; ModuleID = 'jchuff.2.ll'
source_filename = "jchuff.c"
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
%struct.JHUFF_TBL = type { [17 x i8], [256 x i8], i32 }
%struct.c_derived_tbl = type { [256 x i32], [256 x i8] }
%struct.huff_entropy_encoder = type { %struct.jpeg_entropy_encoder, %struct.savable_state, i32, i32, [4 x %struct.c_derived_tbl*], [4 x %struct.c_derived_tbl*], [4 x i64*], [4 x i64*] }
%struct.savable_state = type { i64, i32, [4 x i32] }
%struct.working_state = type { i8*, i64, %struct.savable_state, %struct.jpeg_compress_struct* }

$__llvm_profile_raw_version = comdat any

@jpeg_natural_order = external constant [0 x i32], align 4
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jpeg_make_c_derived_tbl = private constant [23 x i8] c"jpeg_make_c_derived_tbl"
@__profn_jpeg_gen_optimal_table = private constant [22 x i8] c"jpeg_gen_optimal_table"
@__profn_jinit_huff_encoder = private constant [18 x i8] c"jinit_huff_encoder"
@__profn_tmp1.ll_start_pass_huff = private constant [23 x i8] c"tmp1.ll:start_pass_huff"
@__profn_tmp1.ll_encode_mcu_gather = private constant [25 x i8] c"tmp1.ll:encode_mcu_gather"
@__profn_tmp1.ll_finish_pass_gather = private constant [26 x i8] c"tmp1.ll:finish_pass_gather"
@__profn_tmp1.ll_encode_mcu_huff = private constant [23 x i8] c"tmp1.ll:encode_mcu_huff"
@__profn_tmp1.ll_finish_pass_huff = private constant [24 x i8] c"tmp1.ll:finish_pass_huff"
@__profn_tmp1.ll_htest_one_block = private constant [23 x i8] c"tmp1.ll:htest_one_block"
@__profn_tmp1.ll_emit_restart = private constant [20 x i8] c"tmp1.ll:emit_restart"
@__profn_tmp1.ll_encode_one_block = private constant [24 x i8] c"tmp1.ll:encode_one_block"
@__profn_tmp1.ll_flush_bits = private constant [18 x i8] c"tmp1.ll:flush_bits"
@__profn_tmp1.ll_dump_buffer = private constant [19 x i8] c"tmp1.ll:dump_buffer"
@__profn_tmp1.ll_emit_bits = private constant [17 x i8] c"tmp1.ll:emit_bits"
@__profc_jpeg_make_c_derived_tbl = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jpeg_make_c_derived_tbl = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jpeg_make_c_derived_tbl = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8757513125805771242, i64 281599166716718, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_make_c_derived_tbl, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, %struct.JHUFF_TBL*, %struct.c_derived_tbl**)* @jpeg_make_c_derived_tbl to i8*), i8* bitcast ([1 x i64]* @__profvp_jpeg_make_c_derived_tbl to i8*), i32 7, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_jpeg_gen_optimal_table = private global [22 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jpeg_gen_optimal_table = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jpeg_gen_optimal_table = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 788909933290653330, i64 281834562075855, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, %struct.JHUFF_TBL*, i64*)* @jpeg_gen_optimal_table to i8*), i8* bitcast ([1 x i64]* @__profvp_jpeg_gen_optimal_table to i8*), i32 22, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_jinit_huff_encoder = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jinit_huff_encoder = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jinit_huff_encoder = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5209473368004631703, i64 281509114370972, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jinit_huff_encoder, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*)* @jinit_huff_encoder to i8*), i8* bitcast ([1 x i64]* @__profvp_jinit_huff_encoder to i8*), i32 2, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_start_pass_huff = private global [14 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_start_pass_huff = private global [4 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_start_pass_huff = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 334201159451977910, i64 1126068228165922, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_start_pass_huff, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, i32)* @start_pass_huff to i8*), i8* bitcast ([4 x i64]* @__profvp_tmp1.ll_start_pass_huff to i8*), i32 14, [1 x i16] [i16 4] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_encode_mcu_gather = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_encode_mcu_gather = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2844761245204878266, i64 79560094269, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_encode_mcu_gather, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_compress_struct*, [64 x i16]**)* @encode_mcu_gather to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_finish_pass_gather = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_finish_pass_gather = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2211612079861120933, i64 84105577560, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_finish_pass_gather, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*)* @finish_pass_gather to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_encode_mcu_huff = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_encode_mcu_huff = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7706413279931936766, i64 113096631099, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_encode_mcu_huff, i32 0, i32 0), i8* bitcast (i32 (%struct.jpeg_compress_struct*, [64 x i16]**)* @encode_mcu_huff to i8*), i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_finish_pass_huff = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_finish_pass_huff = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_finish_pass_huff = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2123274939156043603, i64 281497736538215, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_finish_pass_huff, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*)* @finish_pass_huff to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_finish_pass_huff to i8*), i32 2, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_htest_one_block = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_htest_one_block = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7219876040438719561, i64 138478027114, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_htest_one_block, i32 0, i32 0), i8* null, i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_emit_restart = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_emit_restart = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4654246168033032694, i64 101273499841, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_restart, i32 0, i32 0), i8* null, i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_encode_one_block = private global [16 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_encode_one_block = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 887498354199877323, i64 232909105153, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_encode_one_block, i32 0, i32 0), i8* null, i8* null, i32 16, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_flush_bits = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_flush_bits = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2686774352449403793, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_flush_bits, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_dump_buffer = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_dump_buffer = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_dump_buffer = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 634905541345717099, i64 281504644258452, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_dump_buffer, i32 0, i32 0), i8* null, i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_dump_buffer to i8*), i32 2, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_emit_bits = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_emit_bits = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_emit_bits = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -54067658092618037, i64 281584114308322, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_bits, i32 0, i32 0), i8* null, i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_emit_bits to i8*), i32 8, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [10 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [154 x i8] c"\BE\02\96\01x\DAe\8E\DB\0E\83 \10D\E3\0F5\E9k\7Ff\02\B8\08\BA\5C\22K\BF\BF\A8\89\A2}\9D\99sv\E7L\13\82Z\08\06#\AD\FEK#D\F30o\F9D\11)\8B\0F\8A!J3\0D\B3\8F^\E0\AA\B5\A0hR#\06\09\F9\FDb\FE\14Q\AB \ABR\F6\FE\CC\8F\1D\82\A9\98\94\B8\8E\B0MV\DC\81<\AA\0E\BA\C9z\E4V8\A1\22H\91\A09\99\E5\12\85\F6\EFJ\FBsO\FB\FF\DArmv\ED\A5\9C\D1XC\86n\A7\FA\EF6\E9\B6\FA\01I\87w\AF", section "__llvm_prf_names"
@llvm.used = appending global [16 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_make_c_derived_tbl to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_gen_optimal_table to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_huff_encoder to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_huff to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_encode_mcu_gather to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_finish_pass_gather to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_encode_mcu_huff to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_finish_pass_huff to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_htest_one_block to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_emit_restart to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_encode_one_block to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_flush_bits to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_dump_buffer to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_emit_bits to i8*), i8* bitcast ([10 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([154 x i8], [154 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @jpeg_make_c_derived_tbl(%struct.jpeg_compress_struct*, %struct.JHUFF_TBL*, %struct.c_derived_tbl**) #0 {
  %4 = alloca %struct.jpeg_compress_struct*, align 8
  %5 = alloca %struct.JHUFF_TBL*, align 8
  %6 = alloca %struct.c_derived_tbl**, align 8
  %7 = alloca %struct.c_derived_tbl*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca [257 x i8], align 16
  %14 = alloca [257 x i32], align 16
  %15 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %4, align 8
  store %struct.JHUFF_TBL* %1, %struct.JHUFF_TBL** %5, align 8
  store %struct.c_derived_tbl** %2, %struct.c_derived_tbl*** %6, align 8
  %16 = load %struct.c_derived_tbl**, %struct.c_derived_tbl*** %6, align 8
  %17 = load %struct.c_derived_tbl*, %struct.c_derived_tbl** %16, align 8
  %18 = icmp eq %struct.c_derived_tbl* %17, null
  br i1 %18, label %19, label %32

; <label>:19:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_make_c_derived_tbl, i64 0, i64 6)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_make_c_derived_tbl, i64 0, i64 6)
  %21 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %22 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %21, i32 0, i32 1
  %23 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %22, align 8
  %24 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %23, i32 0, i32 0
  %25 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %24, align 8
  %26 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %27 = bitcast %struct.jpeg_compress_struct* %26 to %struct.jpeg_common_struct*
  %28 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %25 to i64
  call void @__llvm_profile_instrument_target(i64 %28, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_make_c_derived_tbl to i8*), i32 0)
  %29 = call i8* %25(%struct.jpeg_common_struct* %27, i32 1, i64 1280)
  %30 = bitcast i8* %29 to %struct.c_derived_tbl*
  %31 = load %struct.c_derived_tbl**, %struct.c_derived_tbl*** %6, align 8
  store %struct.c_derived_tbl* %30, %struct.c_derived_tbl** %31, align 8
  br label %32

; <label>:32:                                     ; preds = %19, %3
  %33 = load %struct.c_derived_tbl**, %struct.c_derived_tbl*** %6, align 8
  %34 = load %struct.c_derived_tbl*, %struct.c_derived_tbl** %33, align 8
  store %struct.c_derived_tbl* %34, %struct.c_derived_tbl** %7, align 8
  store i32 0, i32* %8, align 4
  store i32 1, i32* %10, align 4
  br label %35

; <label>:35:                                     ; preds = %62, %32
  %36 = load i32, i32* %10, align 4
  %37 = icmp sle i32 %36, 16
  br i1 %37, label %38, label %65

; <label>:38:                                     ; preds = %35
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_make_c_derived_tbl, i64 0, i64 2)
  %39 = add i64 %pgocount1, 1
  store i64 %39, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_make_c_derived_tbl, i64 0, i64 2)
  store i32 1, i32* %9, align 4
  br label %40

; <label>:40:                                     ; preds = %58, %38
  %41 = load i32, i32* %9, align 4
  %42 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %5, align 8
  %43 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %42, i32 0, i32 0
  %44 = load i32, i32* %10, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [17 x i8], [17 x i8]* %43, i64 0, i64 %45
  %47 = load i8, i8* %46, align 1
  %48 = zext i8 %47 to i32
  %49 = icmp sle i32 %41, %48
  br i1 %49, label %50, label %61

; <label>:50:                                     ; preds = %40
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_make_c_derived_tbl, i64 0, i64 0)
  %51 = add i64 %pgocount2, 1
  store i64 %51, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_make_c_derived_tbl, i64 0, i64 0)
  %52 = load i32, i32* %10, align 4
  %53 = trunc i32 %52 to i8
  %54 = load i32, i32* %8, align 4
  %55 = add nsw i32 %54, 1
  store i32 %55, i32* %8, align 4
  %56 = sext i32 %54 to i64
  %57 = getelementptr inbounds [257 x i8], [257 x i8]* %13, i64 0, i64 %56
  store i8 %53, i8* %57, align 1
  br label %58

; <label>:58:                                     ; preds = %50
  %59 = load i32, i32* %9, align 4
  %60 = add nsw i32 %59, 1
  store i32 %60, i32* %9, align 4
  br label %40

; <label>:61:                                     ; preds = %40
  br label %62

; <label>:62:                                     ; preds = %61
  %63 = load i32, i32* %10, align 4
  %64 = add nsw i32 %63, 1
  store i32 %64, i32* %10, align 4
  br label %35

; <label>:65:                                     ; preds = %35
  %66 = load i32, i32* %8, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [257 x i8], [257 x i8]* %13, i64 0, i64 %67
  store i8 0, i8* %68, align 1
  %69 = load i32, i32* %8, align 4
  store i32 %69, i32* %11, align 4
  store i32 0, i32* %15, align 4
  %70 = getelementptr inbounds [257 x i8], [257 x i8]* %13, i64 0, i64 0
  %71 = load i8, i8* %70, align 16
  %72 = sext i8 %71 to i32
  store i32 %72, i32* %12, align 4
  store i32 0, i32* %8, align 4
  br label %73

; <label>:73:                                     ; preds = %98, %65
  %74 = load i32, i32* %8, align 4
  %75 = sext i32 %74 to i64
  %76 = getelementptr inbounds [257 x i8], [257 x i8]* %13, i64 0, i64 %75
  %77 = load i8, i8* %76, align 1
  %78 = icmp ne i8 %77, 0
  br i1 %78, label %79, label %103

; <label>:79:                                     ; preds = %73
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_make_c_derived_tbl, i64 0, i64 3)
  %80 = add i64 %pgocount3, 1
  store i64 %80, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_make_c_derived_tbl, i64 0, i64 3)
  br label %81

; <label>:81:                                     ; preds = %89, %79
  %82 = load i32, i32* %8, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [257 x i8], [257 x i8]* %13, i64 0, i64 %83
  %85 = load i8, i8* %84, align 1
  %86 = sext i8 %85 to i32
  %87 = load i32, i32* %12, align 4
  %88 = icmp eq i32 %86, %87
  br i1 %88, label %89, label %98

; <label>:89:                                     ; preds = %81
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_make_c_derived_tbl, i64 0, i64 1)
  %90 = add i64 %pgocount4, 1
  store i64 %90, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_make_c_derived_tbl, i64 0, i64 1)
  %91 = load i32, i32* %15, align 4
  %92 = load i32, i32* %8, align 4
  %93 = add nsw i32 %92, 1
  store i32 %93, i32* %8, align 4
  %94 = sext i32 %92 to i64
  %95 = getelementptr inbounds [257 x i32], [257 x i32]* %14, i64 0, i64 %94
  store i32 %91, i32* %95, align 4
  %96 = load i32, i32* %15, align 4
  %97 = add i32 %96, 1
  store i32 %97, i32* %15, align 4
  br label %81

; <label>:98:                                     ; preds = %81
  %99 = load i32, i32* %15, align 4
  %100 = shl i32 %99, 1
  store i32 %100, i32* %15, align 4
  %101 = load i32, i32* %12, align 4
  %102 = add nsw i32 %101, 1
  store i32 %102, i32* %12, align 4
  br label %73

; <label>:103:                                    ; preds = %73
  %104 = load %struct.c_derived_tbl*, %struct.c_derived_tbl** %7, align 8
  %105 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %104, i32 0, i32 1
  %106 = getelementptr inbounds [256 x i8], [256 x i8]* %105, i32 0, i32 0
  call void @llvm.memset.p0i8.i64(i8* %106, i8 0, i64 256, i32 4, i1 false)
  store i32 0, i32* %8, align 4
  br label %107

; <label>:107:                                    ; preds = %141, %103
  %108 = load i32, i32* %8, align 4
  %109 = load i32, i32* %11, align 4
  %110 = icmp slt i32 %108, %109
  br i1 %110, label %111, label %144

; <label>:111:                                    ; preds = %107
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_make_c_derived_tbl, i64 0, i64 4)
  %112 = add i64 %pgocount5, 1
  store i64 %112, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_make_c_derived_tbl, i64 0, i64 4)
  %113 = load i32, i32* %8, align 4
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds [257 x i32], [257 x i32]* %14, i64 0, i64 %114
  %116 = load i32, i32* %115, align 4
  %117 = load %struct.c_derived_tbl*, %struct.c_derived_tbl** %7, align 8
  %118 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %117, i32 0, i32 0
  %119 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %5, align 8
  %120 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %119, i32 0, i32 1
  %121 = load i32, i32* %8, align 4
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds [256 x i8], [256 x i8]* %120, i64 0, i64 %122
  %124 = load i8, i8* %123, align 1
  %125 = zext i8 %124 to i64
  %126 = getelementptr inbounds [256 x i32], [256 x i32]* %118, i64 0, i64 %125
  store i32 %116, i32* %126, align 4
  %127 = load i32, i32* %8, align 4
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds [257 x i8], [257 x i8]* %13, i64 0, i64 %128
  %130 = load i8, i8* %129, align 1
  %131 = load %struct.c_derived_tbl*, %struct.c_derived_tbl** %7, align 8
  %132 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %131, i32 0, i32 1
  %133 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %5, align 8
  %134 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %133, i32 0, i32 1
  %135 = load i32, i32* %8, align 4
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds [256 x i8], [256 x i8]* %134, i64 0, i64 %136
  %138 = load i8, i8* %137, align 1
  %139 = zext i8 %138 to i64
  %140 = getelementptr inbounds [256 x i8], [256 x i8]* %132, i64 0, i64 %139
  store i8 %130, i8* %140, align 1
  br label %141

; <label>:141:                                    ; preds = %111
  %142 = load i32, i32* %8, align 4
  %143 = add nsw i32 %142, 1
  store i32 %143, i32* %8, align 4
  br label %107

; <label>:144:                                    ; preds = %107
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_make_c_derived_tbl, i64 0, i64 5)
  %145 = add i64 %pgocount6, 1
  store i64 %145, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_make_c_derived_tbl, i64 0, i64 5)
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define void @jpeg_gen_optimal_table(%struct.jpeg_compress_struct*, %struct.JHUFF_TBL*, i64*) #0 {
  %4 = alloca %struct.jpeg_compress_struct*, align 8
  %5 = alloca %struct.JHUFF_TBL*, align 8
  %6 = alloca i64*, align 8
  %7 = alloca [33 x i8], align 16
  %8 = alloca [257 x i32], align 16
  %9 = alloca [257 x i32], align 16
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i64, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %4, align 8
  store %struct.JHUFF_TBL* %1, %struct.JHUFF_TBL** %5, align 8
  store i64* %2, i64** %6, align 8
  %16 = getelementptr inbounds [33 x i8], [33 x i8]* %7, i32 0, i32 0
  call void @llvm.memset.p0i8.i64(i8* %16, i8 0, i64 33, i32 16, i1 false)
  %17 = getelementptr inbounds [257 x i32], [257 x i32]* %8, i32 0, i32 0
  %18 = bitcast i32* %17 to i8*
  call void @llvm.memset.p0i8.i64(i8* %18, i8 0, i64 1028, i32 16, i1 false)
  store i32 0, i32* %13, align 4
  br label %19

; <label>:19:                                     ; preds = %26, %3
  %20 = load i32, i32* %13, align 4
  %21 = icmp slt i32 %20, 257
  br i1 %21, label %22, label %30

; <label>:22:                                     ; preds = %19
  %23 = load i32, i32* %13, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [257 x i32], [257 x i32]* %9, i64 0, i64 %24
  store i32 -1, i32* %25, align 4
  br label %26

; <label>:26:                                     ; preds = %22
  %pgocount = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i64 0, i64 13)
  %27 = add i64 %pgocount, 1
  store i64 %27, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i64 0, i64 13)
  %28 = load i32, i32* %13, align 4
  %29 = add nsw i32 %28, 1
  store i32 %29, i32* %13, align 4
  br label %19

; <label>:30:                                     ; preds = %19
  %31 = load i64*, i64** %6, align 8
  %32 = getelementptr inbounds i64, i64* %31, i64 256
  store i64 1, i64* %32, align 8
  br label %33

; <label>:33:                                     ; preds = %174, %30
  store i32 -1, i32* %10, align 4
  store i64 1000000000, i64* %15, align 8
  store i32 0, i32* %13, align 4
  br label %34

; <label>:34:                                     ; preds = %62, %33
  %35 = load i32, i32* %13, align 4
  %36 = icmp sle i32 %35, 256
  br i1 %36, label %37, label %66

; <label>:37:                                     ; preds = %34
  %38 = load i64*, i64** %6, align 8
  %39 = load i32, i32* %13, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds i64, i64* %38, i64 %40
  %42 = load i64, i64* %41, align 8
  %43 = icmp ne i64 %42, 0
  br i1 %43, label %44, label %61

; <label>:44:                                     ; preds = %37
  %pgocount1 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i64 0, i64 7)
  %45 = add i64 %pgocount1, 1
  store i64 %45, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i64 0, i64 7)
  %46 = load i64*, i64** %6, align 8
  %47 = load i32, i32* %13, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds i64, i64* %46, i64 %48
  %50 = load i64, i64* %49, align 8
  %51 = load i64, i64* %15, align 8
  %52 = icmp sle i64 %50, %51
  br i1 %52, label %53, label %61

; <label>:53:                                     ; preds = %44
  %pgocount2 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i64 0, i64 10)
  %54 = add i64 %pgocount2, 1
  store i64 %54, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i64 0, i64 10)
  %55 = load i64*, i64** %6, align 8
  %56 = load i32, i32* %13, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i64, i64* %55, i64 %57
  %59 = load i64, i64* %58, align 8
  store i64 %59, i64* %15, align 8
  %60 = load i32, i32* %13, align 4
  store i32 %60, i32* %10, align 4
  br label %61

; <label>:61:                                     ; preds = %53, %44, %37
  br label %62

; <label>:62:                                     ; preds = %61
  %pgocount3 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i64 0, i64 1)
  %63 = add i64 %pgocount3, 1
  store i64 %63, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i64 0, i64 1)
  %64 = load i32, i32* %13, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, i32* %13, align 4
  br label %34

; <label>:66:                                     ; preds = %34
  store i32 -1, i32* %11, align 4
  store i64 1000000000, i64* %15, align 8
  store i32 0, i32* %13, align 4
  br label %67

; <label>:67:                                     ; preds = %100, %66
  %68 = load i32, i32* %13, align 4
  %69 = icmp sle i32 %68, 256
  br i1 %69, label %70, label %104

; <label>:70:                                     ; preds = %67
  %71 = load i64*, i64** %6, align 8
  %72 = load i32, i32* %13, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds i64, i64* %71, i64 %73
  %75 = load i64, i64* %74, align 8
  %76 = icmp ne i64 %75, 0
  br i1 %76, label %77, label %99

; <label>:77:                                     ; preds = %70
  %pgocount4 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i64 0, i64 8)
  %78 = add i64 %pgocount4, 1
  store i64 %78, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i64 0, i64 8)
  %79 = load i64*, i64** %6, align 8
  %80 = load i32, i32* %13, align 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds i64, i64* %79, i64 %81
  %83 = load i64, i64* %82, align 8
  %84 = load i64, i64* %15, align 8
  %85 = icmp sle i64 %83, %84
  br i1 %85, label %86, label %99

; <label>:86:                                     ; preds = %77
  %pgocount5 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i64 0, i64 11)
  %87 = add i64 %pgocount5, 1
  store i64 %87, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i64 0, i64 11)
  %88 = load i32, i32* %13, align 4
  %89 = load i32, i32* %10, align 4
  %90 = icmp ne i32 %88, %89
  br i1 %90, label %91, label %99

; <label>:91:                                     ; preds = %86
  %pgocount6 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i64 0, i64 12)
  %92 = add i64 %pgocount6, 1
  store i64 %92, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i64 0, i64 12)
  %93 = load i64*, i64** %6, align 8
  %94 = load i32, i32* %13, align 4
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i64, i64* %93, i64 %95
  %97 = load i64, i64* %96, align 8
  store i64 %97, i64* %15, align 8
  %98 = load i32, i32* %13, align 4
  store i32 %98, i32* %11, align 4
  br label %99

; <label>:99:                                     ; preds = %91, %86, %77, %70
  br label %100

; <label>:100:                                    ; preds = %99
  %pgocount7 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i64 0, i64 2)
  %101 = add i64 %pgocount7, 1
  store i64 %101, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i64 0, i64 2)
  %102 = load i32, i32* %13, align 4
  %103 = add nsw i32 %102, 1
  store i32 %103, i32* %13, align 4
  br label %67

; <label>:104:                                    ; preds = %67
  %105 = load i32, i32* %11, align 4
  %106 = icmp slt i32 %105, 0
  br i1 %106, label %107, label %109

; <label>:107:                                    ; preds = %104
  %pgocount8 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i64 0, i64 21)
  %108 = add i64 %pgocount8, 1
  store i64 %108, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i64 0, i64 21)
  br label %176

; <label>:109:                                    ; preds = %104
  %110 = load i64*, i64** %6, align 8
  %111 = load i32, i32* %11, align 4
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds i64, i64* %110, i64 %112
  %114 = load i64, i64* %113, align 8
  %115 = load i64*, i64** %6, align 8
  %116 = load i32, i32* %10, align 4
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds i64, i64* %115, i64 %117
  %119 = load i64, i64* %118, align 8
  %120 = add nsw i64 %119, %114
  store i64 %120, i64* %118, align 8
  %121 = load i64*, i64** %6, align 8
  %122 = load i32, i32* %11, align 4
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds i64, i64* %121, i64 %123
  store i64 0, i64* %124, align 8
  %125 = load i32, i32* %10, align 4
  %126 = sext i32 %125 to i64
  %127 = getelementptr inbounds [257 x i32], [257 x i32]* %8, i64 0, i64 %126
  %128 = load i32, i32* %127, align 4
  %129 = add nsw i32 %128, 1
  store i32 %129, i32* %127, align 4
  br label %130

; <label>:130:                                    ; preds = %136, %109
  %131 = load i32, i32* %10, align 4
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds [257 x i32], [257 x i32]* %9, i64 0, i64 %132
  %134 = load i32, i32* %133, align 4
  %135 = icmp sge i32 %134, 0
  br i1 %135, label %136, label %147

; <label>:136:                                    ; preds = %130
  %pgocount9 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i64 0, i64 5)
  %137 = add i64 %pgocount9, 1
  store i64 %137, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i64 0, i64 5)
  %138 = load i32, i32* %10, align 4
  %139 = sext i32 %138 to i64
  %140 = getelementptr inbounds [257 x i32], [257 x i32]* %9, i64 0, i64 %139
  %141 = load i32, i32* %140, align 4
  store i32 %141, i32* %10, align 4
  %142 = load i32, i32* %10, align 4
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds [257 x i32], [257 x i32]* %8, i64 0, i64 %143
  %145 = load i32, i32* %144, align 4
  %146 = add nsw i32 %145, 1
  store i32 %146, i32* %144, align 4
  br label %130

; <label>:147:                                    ; preds = %130
  %148 = load i32, i32* %11, align 4
  %149 = load i32, i32* %10, align 4
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds [257 x i32], [257 x i32]* %9, i64 0, i64 %150
  store i32 %148, i32* %151, align 4
  %152 = load i32, i32* %11, align 4
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds [257 x i32], [257 x i32]* %8, i64 0, i64 %153
  %155 = load i32, i32* %154, align 4
  %156 = add nsw i32 %155, 1
  store i32 %156, i32* %154, align 4
  br label %157

; <label>:157:                                    ; preds = %163, %147
  %158 = load i32, i32* %11, align 4
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds [257 x i32], [257 x i32]* %9, i64 0, i64 %159
  %161 = load i32, i32* %160, align 4
  %162 = icmp sge i32 %161, 0
  br i1 %162, label %163, label %174

; <label>:163:                                    ; preds = %157
  %pgocount10 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i64 0, i64 6)
  %164 = add i64 %pgocount10, 1
  store i64 %164, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i64 0, i64 6)
  %165 = load i32, i32* %11, align 4
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds [257 x i32], [257 x i32]* %9, i64 0, i64 %166
  %168 = load i32, i32* %167, align 4
  store i32 %168, i32* %11, align 4
  %169 = load i32, i32* %11, align 4
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds [257 x i32], [257 x i32]* %8, i64 0, i64 %170
  %172 = load i32, i32* %171, align 4
  %173 = add nsw i32 %172, 1
  store i32 %173, i32* %171, align 4
  br label %157

; <label>:174:                                    ; preds = %157
  %pgocount11 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i64 0, i64 18)
  %175 = add i64 %pgocount11, 1
  store i64 %175, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i64 0, i64 18)
  br label %33

; <label>:176:                                    ; preds = %107
  store i32 0, i32* %13, align 4
  br label %177

; <label>:177:                                    ; preds = %217, %176
  %178 = load i32, i32* %13, align 4
  %179 = icmp sle i32 %178, 256
  br i1 %179, label %180, label %221

; <label>:180:                                    ; preds = %177
  %181 = load i32, i32* %13, align 4
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds [257 x i32], [257 x i32]* %8, i64 0, i64 %182
  %184 = load i32, i32* %183, align 4
  %185 = icmp ne i32 %184, 0
  br i1 %185, label %186, label %216

; <label>:186:                                    ; preds = %180
  %187 = load i32, i32* %13, align 4
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds [257 x i32], [257 x i32]* %8, i64 0, i64 %188
  %190 = load i32, i32* %189, align 4
  %191 = icmp sgt i32 %190, 32
  br i1 %191, label %192, label %206

; <label>:192:                                    ; preds = %186
  %pgocount12 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i64 0, i64 20)
  %193 = add i64 %pgocount12, 1
  store i64 %193, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i64 0, i64 20)
  %194 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %195 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %194, i32 0, i32 0
  %196 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %195, align 8
  %197 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %196, i32 0, i32 5
  store i32 38, i32* %197, align 8
  %198 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %199 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %198, i32 0, i32 0
  %200 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %199, align 8
  %201 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %200, i32 0, i32 0
  %202 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %201, align 8
  %203 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %204 = bitcast %struct.jpeg_compress_struct* %203 to %struct.jpeg_common_struct*
  %205 = ptrtoint void (%struct.jpeg_common_struct*)* %202 to i64
  call void @__llvm_profile_instrument_target(i64 %205, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_gen_optimal_table to i8*), i32 0)
  call void %202(%struct.jpeg_common_struct* %204)
  br label %206

; <label>:206:                                    ; preds = %192, %186
  %pgocount13 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i64 0, i64 19)
  %207 = add i64 %pgocount13, 1
  store i64 %207, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i64 0, i64 19)
  %208 = load i32, i32* %13, align 4
  %209 = sext i32 %208 to i64
  %210 = getelementptr inbounds [257 x i32], [257 x i32]* %8, i64 0, i64 %209
  %211 = load i32, i32* %210, align 4
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds [33 x i8], [33 x i8]* %7, i64 0, i64 %212
  %214 = load i8, i8* %213, align 1
  %215 = add i8 %214, 1
  store i8 %215, i8* %213, align 1
  br label %216

; <label>:216:                                    ; preds = %206, %180
  br label %217

; <label>:217:                                    ; preds = %216
  %pgocount14 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i64 0, i64 14)
  %218 = add i64 %pgocount14, 1
  store i64 %218, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i64 0, i64 14)
  %219 = load i32, i32* %13, align 4
  %220 = add nsw i32 %219, 1
  store i32 %220, i32* %13, align 4
  br label %177

; <label>:221:                                    ; preds = %177
  store i32 32, i32* %13, align 4
  br label %222

; <label>:222:                                    ; preds = %276, %221
  %223 = load i32, i32* %13, align 4
  %224 = icmp sgt i32 %223, 16
  br i1 %224, label %225, label %280

; <label>:225:                                    ; preds = %222
  br label %226

; <label>:226:                                    ; preds = %247, %225
  %227 = load i32, i32* %13, align 4
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds [33 x i8], [33 x i8]* %7, i64 0, i64 %228
  %230 = load i8, i8* %229, align 1
  %231 = zext i8 %230 to i32
  %232 = icmp sgt i32 %231, 0
  br i1 %232, label %233, label %275

; <label>:233:                                    ; preds = %226
  %234 = load i32, i32* %13, align 4
  %235 = sub nsw i32 %234, 2
  store i32 %235, i32* %14, align 4
  br label %236

; <label>:236:                                    ; preds = %243, %233
  %237 = load i32, i32* %14, align 4
  %238 = sext i32 %237 to i64
  %239 = getelementptr inbounds [33 x i8], [33 x i8]* %7, i64 0, i64 %238
  %240 = load i8, i8* %239, align 1
  %241 = zext i8 %240 to i32
  %242 = icmp eq i32 %241, 0
  br i1 %242, label %243, label %247

; <label>:243:                                    ; preds = %236
  %pgocount15 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i64 0, i64 0)
  %244 = add i64 %pgocount15, 1
  store i64 %244, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i64 0, i64 0)
  %245 = load i32, i32* %14, align 4
  %246 = add nsw i32 %245, -1
  store i32 %246, i32* %14, align 4
  br label %236

; <label>:247:                                    ; preds = %236
  %pgocount16 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i64 0, i64 3)
  %248 = add i64 %pgocount16, 1
  store i64 %248, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i64 0, i64 3)
  %249 = load i32, i32* %13, align 4
  %250 = sext i32 %249 to i64
  %251 = getelementptr inbounds [33 x i8], [33 x i8]* %7, i64 0, i64 %250
  %252 = load i8, i8* %251, align 1
  %253 = zext i8 %252 to i32
  %254 = sub nsw i32 %253, 2
  %255 = trunc i32 %254 to i8
  store i8 %255, i8* %251, align 1
  %256 = load i32, i32* %13, align 4
  %257 = sub nsw i32 %256, 1
  %258 = sext i32 %257 to i64
  %259 = getelementptr inbounds [33 x i8], [33 x i8]* %7, i64 0, i64 %258
  %260 = load i8, i8* %259, align 1
  %261 = add i8 %260, 1
  store i8 %261, i8* %259, align 1
  %262 = load i32, i32* %14, align 4
  %263 = add nsw i32 %262, 1
  %264 = sext i32 %263 to i64
  %265 = getelementptr inbounds [33 x i8], [33 x i8]* %7, i64 0, i64 %264
  %266 = load i8, i8* %265, align 1
  %267 = zext i8 %266 to i32
  %268 = add nsw i32 %267, 2
  %269 = trunc i32 %268 to i8
  store i8 %269, i8* %265, align 1
  %270 = load i32, i32* %14, align 4
  %271 = sext i32 %270 to i64
  %272 = getelementptr inbounds [33 x i8], [33 x i8]* %7, i64 0, i64 %271
  %273 = load i8, i8* %272, align 1
  %274 = add i8 %273, -1
  store i8 %274, i8* %272, align 1
  br label %226

; <label>:275:                                    ; preds = %226
  br label %276

; <label>:276:                                    ; preds = %275
  %pgocount17 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i64 0, i64 15)
  %277 = add i64 %pgocount17, 1
  store i64 %277, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i64 0, i64 15)
  %278 = load i32, i32* %13, align 4
  %279 = add nsw i32 %278, -1
  store i32 %279, i32* %13, align 4
  br label %222

; <label>:280:                                    ; preds = %222
  br label %281

; <label>:281:                                    ; preds = %288, %280
  %282 = load i32, i32* %13, align 4
  %283 = sext i32 %282 to i64
  %284 = getelementptr inbounds [33 x i8], [33 x i8]* %7, i64 0, i64 %283
  %285 = load i8, i8* %284, align 1
  %286 = zext i8 %285 to i32
  %287 = icmp eq i32 %286, 0
  br i1 %287, label %288, label %292

; <label>:288:                                    ; preds = %281
  %pgocount18 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i64 0, i64 16)
  %289 = add i64 %pgocount18, 1
  store i64 %289, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i64 0, i64 16)
  %290 = load i32, i32* %13, align 4
  %291 = add nsw i32 %290, -1
  store i32 %291, i32* %13, align 4
  br label %281

; <label>:292:                                    ; preds = %281
  %293 = load i32, i32* %13, align 4
  %294 = sext i32 %293 to i64
  %295 = getelementptr inbounds [33 x i8], [33 x i8]* %7, i64 0, i64 %294
  %296 = load i8, i8* %295, align 1
  %297 = add i8 %296, -1
  store i8 %297, i8* %295, align 1
  %298 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %5, align 8
  %299 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %298, i32 0, i32 0
  %300 = getelementptr inbounds [17 x i8], [17 x i8]* %299, i32 0, i32 0
  %301 = getelementptr inbounds [33 x i8], [33 x i8]* %7, i32 0, i32 0
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %300, i8* %301, i64 17, i32 4, i1 false)
  store i32 0, i32* %12, align 4
  store i32 1, i32* %13, align 4
  br label %302

; <label>:302:                                    ; preds = %333, %292
  %303 = load i32, i32* %13, align 4
  %304 = icmp sle i32 %303, 32
  br i1 %304, label %305, label %337

; <label>:305:                                    ; preds = %302
  store i32 0, i32* %14, align 4
  br label %306

; <label>:306:                                    ; preds = %328, %305
  %307 = load i32, i32* %14, align 4
  %308 = icmp sle i32 %307, 255
  br i1 %308, label %309, label %332

; <label>:309:                                    ; preds = %306
  %310 = load i32, i32* %14, align 4
  %311 = sext i32 %310 to i64
  %312 = getelementptr inbounds [257 x i32], [257 x i32]* %8, i64 0, i64 %311
  %313 = load i32, i32* %312, align 4
  %314 = load i32, i32* %13, align 4
  %315 = icmp eq i32 %313, %314
  br i1 %315, label %316, label %327

; <label>:316:                                    ; preds = %309
  %pgocount19 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i64 0, i64 9)
  %317 = add i64 %pgocount19, 1
  store i64 %317, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i64 0, i64 9)
  %318 = load i32, i32* %14, align 4
  %319 = trunc i32 %318 to i8
  %320 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %5, align 8
  %321 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %320, i32 0, i32 1
  %322 = load i32, i32* %12, align 4
  %323 = sext i32 %322 to i64
  %324 = getelementptr inbounds [256 x i8], [256 x i8]* %321, i64 0, i64 %323
  store i8 %319, i8* %324, align 1
  %325 = load i32, i32* %12, align 4
  %326 = add nsw i32 %325, 1
  store i32 %326, i32* %12, align 4
  br label %327

; <label>:327:                                    ; preds = %316, %309
  br label %328

; <label>:328:                                    ; preds = %327
  %pgocount20 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i64 0, i64 4)
  %329 = add i64 %pgocount20, 1
  store i64 %329, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i64 0, i64 4)
  %330 = load i32, i32* %14, align 4
  %331 = add nsw i32 %330, 1
  store i32 %331, i32* %14, align 4
  br label %306

; <label>:332:                                    ; preds = %306
  br label %333

; <label>:333:                                    ; preds = %332
  %pgocount21 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i64 0, i64 17)
  %334 = add i64 %pgocount21, 1
  store i64 %334, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_jpeg_gen_optimal_table, i64 0, i64 17)
  %335 = load i32, i32* %13, align 4
  %336 = add nsw i32 %335, 1
  store i32 %336, i32* %13, align 4
  br label %302

; <label>:337:                                    ; preds = %302
  %338 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %5, align 8
  %339 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %338, i32 0, i32 2
  store i32 0, i32* %339, align 4
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: nounwind uwtable
define void @jinit_huff_encoder(%struct.jpeg_compress_struct*) #0 {
  %2 = alloca %struct.jpeg_compress_struct*, align 8
  %3 = alloca %struct.huff_entropy_encoder*, align 8
  %4 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %2, align 8
  %5 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %5, i32 0, i32 1
  %7 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %7, i32 0, i32 0
  %9 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %8, align 8
  %10 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %11 = bitcast %struct.jpeg_compress_struct* %10 to %struct.jpeg_common_struct*
  %12 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %9 to i64
  call void @__llvm_profile_instrument_target(i64 %12, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_huff_encoder to i8*), i32 0)
  %13 = call i8* %9(%struct.jpeg_common_struct* %11, i32 1, i64 192)
  %14 = bitcast i8* %13 to %struct.huff_entropy_encoder*
  store %struct.huff_entropy_encoder* %14, %struct.huff_entropy_encoder** %3, align 8
  %15 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %3, align 8
  %16 = bitcast %struct.huff_entropy_encoder* %15 to %struct.jpeg_entropy_encoder*
  %17 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %18 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %17, i32 0, i32 59
  store %struct.jpeg_entropy_encoder* %16, %struct.jpeg_entropy_encoder** %18, align 8
  %19 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %3, align 8
  %20 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %19, i32 0, i32 0
  %21 = getelementptr inbounds %struct.jpeg_entropy_encoder, %struct.jpeg_entropy_encoder* %20, i32 0, i32 0
  store void (%struct.jpeg_compress_struct*, i32)* @start_pass_huff, void (%struct.jpeg_compress_struct*, i32)** %21, align 8
  store i32 0, i32* %4, align 4
  br label %22

; <label>:22:                                     ; preds = %46, %1
  %23 = load i32, i32* %4, align 4
  %24 = icmp slt i32 %23, 4
  br i1 %24, label %25, label %50

; <label>:25:                                     ; preds = %22
  %26 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %3, align 8
  %27 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %26, i32 0, i32 5
  %28 = load i32, i32* %4, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [4 x %struct.c_derived_tbl*], [4 x %struct.c_derived_tbl*]* %27, i64 0, i64 %29
  store %struct.c_derived_tbl* null, %struct.c_derived_tbl** %30, align 8
  %31 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %3, align 8
  %32 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %31, i32 0, i32 4
  %33 = load i32, i32* %4, align 4
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [4 x %struct.c_derived_tbl*], [4 x %struct.c_derived_tbl*]* %32, i64 0, i64 %34
  store %struct.c_derived_tbl* null, %struct.c_derived_tbl** %35, align 8
  %36 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %3, align 8
  %37 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %36, i32 0, i32 7
  %38 = load i32, i32* %4, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [4 x i64*], [4 x i64*]* %37, i64 0, i64 %39
  store i64* null, i64** %40, align 8
  %41 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %3, align 8
  %42 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %41, i32 0, i32 6
  %43 = load i32, i32* %4, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [4 x i64*], [4 x i64*]* %42, i64 0, i64 %44
  store i64* null, i64** %45, align 8
  br label %46

; <label>:46:                                     ; preds = %25
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jinit_huff_encoder, i64 0, i64 0)
  %47 = add i64 %pgocount, 1
  store i64 %47, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jinit_huff_encoder, i64 0, i64 0)
  %48 = load i32, i32* %4, align 4
  %49 = add nsw i32 %48, 1
  store i32 %49, i32* %4, align 4
  br label %22

; <label>:50:                                     ; preds = %22
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jinit_huff_encoder, i64 0, i64 1)
  %51 = add i64 %pgocount1, 1
  store i64 %51, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_jinit_huff_encoder, i64 0, i64 1)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @start_pass_huff(%struct.jpeg_compress_struct*, i32) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.huff_entropy_encoder*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca %struct.jpeg_component_info*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store i32 %1, i32* %4, align 4
  %10 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %11 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %10, i32 0, i32 59
  %12 = load %struct.jpeg_entropy_encoder*, %struct.jpeg_entropy_encoder** %11, align 8
  %13 = bitcast %struct.jpeg_entropy_encoder* %12 to %struct.huff_entropy_encoder*
  store %struct.huff_entropy_encoder* %13, %struct.huff_entropy_encoder** %5, align 8
  %14 = load i32, i32* %4, align 4
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %24

; <label>:16:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_start_pass_huff, i64 0, i64 12)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_start_pass_huff, i64 0, i64 12)
  %18 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %5, align 8
  %19 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %18, i32 0, i32 0
  %20 = getelementptr inbounds %struct.jpeg_entropy_encoder, %struct.jpeg_entropy_encoder* %19, i32 0, i32 1
  store i32 (%struct.jpeg_compress_struct*, [64 x i16]**)* @encode_mcu_gather, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)** %20, align 8
  %21 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %5, align 8
  %22 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %21, i32 0, i32 0
  %23 = getelementptr inbounds %struct.jpeg_entropy_encoder, %struct.jpeg_entropy_encoder* %22, i32 0, i32 2
  store void (%struct.jpeg_compress_struct*)* @finish_pass_gather, void (%struct.jpeg_compress_struct*)** %23, align 8
  br label %32

; <label>:24:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_start_pass_huff, i64 0, i64 13)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_start_pass_huff, i64 0, i64 13)
  %26 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %5, align 8
  %27 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %26, i32 0, i32 0
  %28 = getelementptr inbounds %struct.jpeg_entropy_encoder, %struct.jpeg_entropy_encoder* %27, i32 0, i32 1
  store i32 (%struct.jpeg_compress_struct*, [64 x i16]**)* @encode_mcu_huff, i32 (%struct.jpeg_compress_struct*, [64 x i16]**)** %28, align 8
  %29 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %5, align 8
  %30 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %29, i32 0, i32 0
  %31 = getelementptr inbounds %struct.jpeg_entropy_encoder, %struct.jpeg_entropy_encoder* %30, i32 0, i32 2
  store void (%struct.jpeg_compress_struct*)* @finish_pass_huff, void (%struct.jpeg_compress_struct*)** %31, align 8
  br label %32

; <label>:32:                                     ; preds = %24, %16
  store i32 0, i32* %6, align 4
  br label %33

; <label>:33:                                     ; preds = %235, %32
  %34 = load i32, i32* %6, align 4
  %35 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %36 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %35, i32 0, i32 41
  %37 = load i32, i32* %36, align 4
  %38 = icmp slt i32 %34, %37
  br i1 %38, label %39, label %238

; <label>:39:                                     ; preds = %33
  %40 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %41 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %40, i32 0, i32 42
  %42 = load i32, i32* %6, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [4 x %struct.jpeg_component_info*], [4 x %struct.jpeg_component_info*]* %41, i64 0, i64 %43
  %45 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %44, align 8
  store %struct.jpeg_component_info* %45, %struct.jpeg_component_info** %9, align 8
  %46 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %9, align 8
  %47 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %46, i32 0, i32 5
  %48 = load i32, i32* %47, align 4
  store i32 %48, i32* %7, align 4
  %49 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %9, align 8
  %50 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %49, i32 0, i32 6
  %51 = load i32, i32* %50, align 8
  store i32 %51, i32* %8, align 4
  %52 = load i32, i32* %7, align 4
  %53 = icmp slt i32 %52, 0
  br i1 %53, label %71, label %54

; <label>:54:                                     ; preds = %39
  %pgocount2 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_start_pass_huff, i64 0, i64 2)
  %55 = add i64 %pgocount2, 1
  store i64 %55, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_start_pass_huff, i64 0, i64 2)
  %56 = load i32, i32* %7, align 4
  %57 = icmp sge i32 %56, 4
  br i1 %57, label %71, label %58

; <label>:58:                                     ; preds = %54
  %pgocount3 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_start_pass_huff, i64 0, i64 6)
  %59 = add i64 %pgocount3, 1
  store i64 %59, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_start_pass_huff, i64 0, i64 6)
  %60 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %61 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %60, i32 0, i32 16
  %62 = load i32, i32* %7, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*]* %61, i64 0, i64 %63
  %65 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %64, align 8
  %66 = icmp eq %struct.JHUFF_TBL* %65, null
  br i1 %66, label %67, label %92

; <label>:67:                                     ; preds = %58
  %pgocount4 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_start_pass_huff, i64 0, i64 10)
  %68 = add i64 %pgocount4, 1
  store i64 %68, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_start_pass_huff, i64 0, i64 10)
  %69 = load i32, i32* %4, align 4
  %70 = icmp ne i32 %69, 0
  br i1 %70, label %92, label %71

; <label>:71:                                     ; preds = %67, %54, %39
  %pgocount5 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_start_pass_huff, i64 0, i64 0)
  %72 = add i64 %pgocount5, 1
  store i64 %72, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_start_pass_huff, i64 0, i64 0)
  %73 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %74 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %73, i32 0, i32 0
  %75 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %74, align 8
  %76 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %75, i32 0, i32 5
  store i32 49, i32* %76, align 8
  %77 = load i32, i32* %7, align 4
  %78 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %79 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %78, i32 0, i32 0
  %80 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %79, align 8
  %81 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %80, i32 0, i32 6
  %82 = bitcast %union.anon* %81 to [8 x i32]*
  %83 = getelementptr inbounds [8 x i32], [8 x i32]* %82, i64 0, i64 0
  store i32 %77, i32* %83, align 4
  %84 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %85 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %84, i32 0, i32 0
  %86 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %85, align 8
  %87 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %86, i32 0, i32 0
  %88 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %87, align 8
  %89 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %90 = bitcast %struct.jpeg_compress_struct* %89 to %struct.jpeg_common_struct*
  %91 = ptrtoint void (%struct.jpeg_common_struct*)* %88 to i64
  call void @__llvm_profile_instrument_target(i64 %91, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_huff to i8*), i32 0)
  call void %88(%struct.jpeg_common_struct* %90)
  br label %92

; <label>:92:                                     ; preds = %71, %67, %58
  %93 = load i32, i32* %8, align 4
  %94 = icmp slt i32 %93, 0
  br i1 %94, label %112, label %95

; <label>:95:                                     ; preds = %92
  %pgocount6 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_start_pass_huff, i64 0, i64 3)
  %96 = add i64 %pgocount6, 1
  store i64 %96, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_start_pass_huff, i64 0, i64 3)
  %97 = load i32, i32* %8, align 4
  %98 = icmp sge i32 %97, 4
  br i1 %98, label %112, label %99

; <label>:99:                                     ; preds = %95
  %pgocount7 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_start_pass_huff, i64 0, i64 7)
  %100 = add i64 %pgocount7, 1
  store i64 %100, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_start_pass_huff, i64 0, i64 7)
  %101 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %102 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %101, i32 0, i32 17
  %103 = load i32, i32* %8, align 4
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*]* %102, i64 0, i64 %104
  %106 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %105, align 8
  %107 = icmp eq %struct.JHUFF_TBL* %106, null
  br i1 %107, label %108, label %133

; <label>:108:                                    ; preds = %99
  %pgocount8 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_start_pass_huff, i64 0, i64 11)
  %109 = add i64 %pgocount8, 1
  store i64 %109, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_start_pass_huff, i64 0, i64 11)
  %110 = load i32, i32* %4, align 4
  %111 = icmp ne i32 %110, 0
  br i1 %111, label %133, label %112

; <label>:112:                                    ; preds = %108, %95, %92
  %pgocount9 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_start_pass_huff, i64 0, i64 1)
  %113 = add i64 %pgocount9, 1
  store i64 %113, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_start_pass_huff, i64 0, i64 1)
  %114 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %115 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %114, i32 0, i32 0
  %116 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %115, align 8
  %117 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %116, i32 0, i32 5
  store i32 49, i32* %117, align 8
  %118 = load i32, i32* %8, align 4
  %119 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %120 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %119, i32 0, i32 0
  %121 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %120, align 8
  %122 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %121, i32 0, i32 6
  %123 = bitcast %union.anon* %122 to [8 x i32]*
  %124 = getelementptr inbounds [8 x i32], [8 x i32]* %123, i64 0, i64 0
  store i32 %118, i32* %124, align 4
  %125 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %126 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %125, i32 0, i32 0
  %127 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %126, align 8
  %128 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %127, i32 0, i32 0
  %129 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %128, align 8
  %130 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %131 = bitcast %struct.jpeg_compress_struct* %130 to %struct.jpeg_common_struct*
  %132 = ptrtoint void (%struct.jpeg_common_struct*)* %129 to i64
  call void @__llvm_profile_instrument_target(i64 %132, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_huff to i8*), i32 1)
  call void %129(%struct.jpeg_common_struct* %131)
  br label %133

; <label>:133:                                    ; preds = %112, %108, %99
  %134 = load i32, i32* %4, align 4
  %135 = icmp ne i32 %134, 0
  br i1 %135, label %136, label %202

; <label>:136:                                    ; preds = %133
  %137 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %5, align 8
  %138 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %137, i32 0, i32 6
  %139 = load i32, i32* %7, align 4
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds [4 x i64*], [4 x i64*]* %138, i64 0, i64 %140
  %142 = load i64*, i64** %141, align 8
  %143 = icmp eq i64* %142, null
  br i1 %143, label %144, label %161

; <label>:144:                                    ; preds = %136
  %pgocount10 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_start_pass_huff, i64 0, i64 8)
  %145 = add i64 %pgocount10, 1
  store i64 %145, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_start_pass_huff, i64 0, i64 8)
  %146 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %147 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %146, i32 0, i32 1
  %148 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %147, align 8
  %149 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %148, i32 0, i32 0
  %150 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %149, align 8
  %151 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %152 = bitcast %struct.jpeg_compress_struct* %151 to %struct.jpeg_common_struct*
  %153 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %150 to i64
  call void @__llvm_profile_instrument_target(i64 %153, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_huff to i8*), i32 2)
  %154 = call i8* %150(%struct.jpeg_common_struct* %152, i32 1, i64 2056)
  %155 = bitcast i8* %154 to i64*
  %156 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %5, align 8
  %157 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %156, i32 0, i32 6
  %158 = load i32, i32* %7, align 4
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds [4 x i64*], [4 x i64*]* %157, i64 0, i64 %159
  store i64* %155, i64** %160, align 8
  br label %161

; <label>:161:                                    ; preds = %144, %136
  %162 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %5, align 8
  %163 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %162, i32 0, i32 6
  %164 = load i32, i32* %7, align 4
  %165 = sext i32 %164 to i64
  %166 = getelementptr inbounds [4 x i64*], [4 x i64*]* %163, i64 0, i64 %165
  %167 = load i64*, i64** %166, align 8
  %168 = bitcast i64* %167 to i8*
  call void @llvm.memset.p0i8.i64(i8* %168, i8 0, i64 2056, i32 1, i1 false)
  %169 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %5, align 8
  %170 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %169, i32 0, i32 7
  %171 = load i32, i32* %8, align 4
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds [4 x i64*], [4 x i64*]* %170, i64 0, i64 %172
  %174 = load i64*, i64** %173, align 8
  %175 = icmp eq i64* %174, null
  br i1 %175, label %176, label %193

; <label>:176:                                    ; preds = %161
  %pgocount11 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_start_pass_huff, i64 0, i64 9)
  %177 = add i64 %pgocount11, 1
  store i64 %177, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_start_pass_huff, i64 0, i64 9)
  %178 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %179 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %178, i32 0, i32 1
  %180 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %179, align 8
  %181 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %180, i32 0, i32 0
  %182 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %181, align 8
  %183 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %184 = bitcast %struct.jpeg_compress_struct* %183 to %struct.jpeg_common_struct*
  %185 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %182 to i64
  call void @__llvm_profile_instrument_target(i64 %185, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_start_pass_huff to i8*), i32 3)
  %186 = call i8* %182(%struct.jpeg_common_struct* %184, i32 1, i64 2056)
  %187 = bitcast i8* %186 to i64*
  %188 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %5, align 8
  %189 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %188, i32 0, i32 7
  %190 = load i32, i32* %8, align 4
  %191 = sext i32 %190 to i64
  %192 = getelementptr inbounds [4 x i64*], [4 x i64*]* %189, i64 0, i64 %191
  store i64* %187, i64** %192, align 8
  br label %193

; <label>:193:                                    ; preds = %176, %161
  %pgocount12 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_start_pass_huff, i64 0, i64 4)
  %194 = add i64 %pgocount12, 1
  store i64 %194, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_start_pass_huff, i64 0, i64 4)
  %195 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %5, align 8
  %196 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %195, i32 0, i32 7
  %197 = load i32, i32* %8, align 4
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds [4 x i64*], [4 x i64*]* %196, i64 0, i64 %198
  %200 = load i64*, i64** %199, align 8
  %201 = bitcast i64* %200 to i8*
  call void @llvm.memset.p0i8.i64(i8* %201, i8 0, i64 2056, i32 1, i1 false)
  br label %228

; <label>:202:                                    ; preds = %133
  %pgocount13 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_start_pass_huff, i64 0, i64 5)
  %203 = add i64 %pgocount13, 1
  store i64 %203, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_tmp1.ll_start_pass_huff, i64 0, i64 5)
  %204 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %205 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %206 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %205, i32 0, i32 16
  %207 = load i32, i32* %7, align 4
  %208 = sext i32 %207 to i64
  %209 = getelementptr inbounds [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*]* %206, i64 0, i64 %208
  %210 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %209, align 8
  %211 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %5, align 8
  %212 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %211, i32 0, i32 4
  %213 = load i32, i32* %7, align 4
  %214 = sext i32 %213 to i64
  %215 = getelementptr inbounds [4 x %struct.c_derived_tbl*], [4 x %struct.c_derived_tbl*]* %212, i64 0, i64 %214
  call void @jpeg_make_c_derived_tbl(%struct.jpeg_compress_struct* %204, %struct.JHUFF_TBL* %210, %struct.c_derived_tbl** %215)
  %216 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %217 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %218 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %217, i32 0, i32 17
  %219 = load i32, i32* %8, align 4
  %220 = sext i32 %219 to i64
  %221 = getelementptr inbounds [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*]* %218, i64 0, i64 %220
  %222 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %221, align 8
  %223 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %5, align 8
  %224 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %223, i32 0, i32 5
  %225 = load i32, i32* %8, align 4
  %226 = sext i32 %225 to i64
  %227 = getelementptr inbounds [4 x %struct.c_derived_tbl*], [4 x %struct.c_derived_tbl*]* %224, i64 0, i64 %226
  call void @jpeg_make_c_derived_tbl(%struct.jpeg_compress_struct* %216, %struct.JHUFF_TBL* %222, %struct.c_derived_tbl** %227)
  br label %228

; <label>:228:                                    ; preds = %202, %193
  %229 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %5, align 8
  %230 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %229, i32 0, i32 1
  %231 = getelementptr inbounds %struct.savable_state, %struct.savable_state* %230, i32 0, i32 2
  %232 = load i32, i32* %6, align 4
  %233 = sext i32 %232 to i64
  %234 = getelementptr inbounds [4 x i32], [4 x i32]* %231, i64 0, i64 %233
  store i32 0, i32* %234, align 4
  br label %235

; <label>:235:                                    ; preds = %228
  %236 = load i32, i32* %6, align 4
  %237 = add nsw i32 %236, 1
  store i32 %237, i32* %6, align 4
  br label %33

; <label>:238:                                    ; preds = %33
  %239 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %5, align 8
  %240 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %239, i32 0, i32 1
  %241 = getelementptr inbounds %struct.savable_state, %struct.savable_state* %240, i32 0, i32 0
  store i64 0, i64* %241, align 8
  %242 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %5, align 8
  %243 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %242, i32 0, i32 1
  %244 = getelementptr inbounds %struct.savable_state, %struct.savable_state* %243, i32 0, i32 1
  store i32 0, i32* %244, align 8
  %245 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %246 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %245, i32 0, i32 29
  %247 = load i32, i32* %246, align 8
  %248 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %5, align 8
  %249 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %248, i32 0, i32 2
  store i32 %247, i32* %249, align 8
  %250 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %5, align 8
  %251 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %250, i32 0, i32 3
  store i32 0, i32* %251, align 4
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @encode_mcu_gather(%struct.jpeg_compress_struct*, [64 x i16]**) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca [64 x i16]**, align 8
  %5 = alloca %struct.huff_entropy_encoder*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca %struct.jpeg_component_info*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store [64 x i16]** %1, [64 x i16]*** %4, align 8
  %9 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %10 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %9, i32 0, i32 59
  %11 = load %struct.jpeg_entropy_encoder*, %struct.jpeg_entropy_encoder** %10, align 8
  %12 = bitcast %struct.jpeg_entropy_encoder* %11 to %struct.huff_entropy_encoder*
  store %struct.huff_entropy_encoder* %12, %struct.huff_entropy_encoder** %5, align 8
  %13 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %14 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %13, i32 0, i32 29
  %15 = load i32, i32* %14, align 8
  %16 = icmp ne i32 %15, 0
  br i1 %16, label %17, label %53

; <label>:17:                                     ; preds = %2
  %18 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %5, align 8
  %19 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %18, i32 0, i32 2
  %20 = load i32, i32* %19, align 8
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %47

; <label>:22:                                     ; preds = %17
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_encode_mcu_gather, i64 0, i64 4)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_encode_mcu_gather, i64 0, i64 4)
  store i32 0, i32* %7, align 4
  br label %24

; <label>:24:                                     ; preds = %37, %22
  %25 = load i32, i32* %7, align 4
  %26 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %27 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %26, i32 0, i32 41
  %28 = load i32, i32* %27, align 4
  %29 = icmp slt i32 %25, %28
  br i1 %29, label %30, label %41

; <label>:30:                                     ; preds = %24
  %31 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %5, align 8
  %32 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %31, i32 0, i32 1
  %33 = getelementptr inbounds %struct.savable_state, %struct.savable_state* %32, i32 0, i32 2
  %34 = load i32, i32* %7, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [4 x i32], [4 x i32]* %33, i64 0, i64 %35
  store i32 0, i32* %36, align 4
  br label %37

; <label>:37:                                     ; preds = %30
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_encode_mcu_gather, i64 0, i64 1)
  %38 = add i64 %pgocount1, 1
  store i64 %38, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_encode_mcu_gather, i64 0, i64 1)
  %39 = load i32, i32* %7, align 4
  %40 = add nsw i32 %39, 1
  store i32 %40, i32* %7, align 4
  br label %24

; <label>:41:                                     ; preds = %24
  %42 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %43 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %42, i32 0, i32 29
  %44 = load i32, i32* %43, align 8
  %45 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %5, align 8
  %46 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %45, i32 0, i32 2
  store i32 %44, i32* %46, align 8
  br label %47

; <label>:47:                                     ; preds = %41, %17
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_encode_mcu_gather, i64 0, i64 3)
  %48 = add i64 %pgocount2, 1
  store i64 %48, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_encode_mcu_gather, i64 0, i64 3)
  %49 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %5, align 8
  %50 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %49, i32 0, i32 2
  %51 = load i32, i32* %50, align 8
  %52 = add i32 %51, -1
  store i32 %52, i32* %50, align 8
  br label %53

; <label>:53:                                     ; preds = %47, %2
  store i32 0, i32* %6, align 4
  br label %54

; <label>:54:                                     ; preds = %119, %53
  %55 = load i32, i32* %6, align 4
  %56 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %57 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %56, i32 0, i32 45
  %58 = load i32, i32* %57, align 8
  %59 = icmp slt i32 %55, %58
  br i1 %59, label %60, label %122

; <label>:60:                                     ; preds = %54
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_encode_mcu_gather, i64 0, i64 0)
  %61 = add i64 %pgocount3, 1
  store i64 %61, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_encode_mcu_gather, i64 0, i64 0)
  %62 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %63 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %62, i32 0, i32 46
  %64 = load i32, i32* %6, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds [10 x i32], [10 x i32]* %63, i64 0, i64 %65
  %67 = load i32, i32* %66, align 4
  store i32 %67, i32* %7, align 4
  %68 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %69 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %68, i32 0, i32 42
  %70 = load i32, i32* %7, align 4
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds [4 x %struct.jpeg_component_info*], [4 x %struct.jpeg_component_info*]* %69, i64 0, i64 %71
  %73 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %72, align 8
  store %struct.jpeg_component_info* %73, %struct.jpeg_component_info** %8, align 8
  %74 = load [64 x i16]**, [64 x i16]*** %4, align 8
  %75 = load i32, i32* %6, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [64 x i16]*, [64 x i16]** %74, i64 %76
  %78 = load [64 x i16]*, [64 x i16]** %77, align 8
  %79 = getelementptr inbounds [64 x i16], [64 x i16]* %78, i64 0
  %80 = getelementptr inbounds [64 x i16], [64 x i16]* %79, i32 0, i32 0
  %81 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %5, align 8
  %82 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %81, i32 0, i32 1
  %83 = getelementptr inbounds %struct.savable_state, %struct.savable_state* %82, i32 0, i32 2
  %84 = load i32, i32* %7, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [4 x i32], [4 x i32]* %83, i64 0, i64 %85
  %87 = load i32, i32* %86, align 4
  %88 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %5, align 8
  %89 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %88, i32 0, i32 6
  %90 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %8, align 8
  %91 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %90, i32 0, i32 5
  %92 = load i32, i32* %91, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds [4 x i64*], [4 x i64*]* %89, i64 0, i64 %93
  %95 = load i64*, i64** %94, align 8
  %96 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %5, align 8
  %97 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %96, i32 0, i32 7
  %98 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %8, align 8
  %99 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %98, i32 0, i32 6
  %100 = load i32, i32* %99, align 8
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds [4 x i64*], [4 x i64*]* %97, i64 0, i64 %101
  %103 = load i64*, i64** %102, align 8
  call void @htest_one_block(i16* %80, i32 %87, i64* %95, i64* %103)
  %104 = load [64 x i16]**, [64 x i16]*** %4, align 8
  %105 = load i32, i32* %6, align 4
  %106 = sext i32 %105 to i64
  %107 = getelementptr inbounds [64 x i16]*, [64 x i16]** %104, i64 %106
  %108 = load [64 x i16]*, [64 x i16]** %107, align 8
  %109 = getelementptr inbounds [64 x i16], [64 x i16]* %108, i64 0
  %110 = getelementptr inbounds [64 x i16], [64 x i16]* %109, i64 0, i64 0
  %111 = load i16, i16* %110, align 2
  %112 = sext i16 %111 to i32
  %113 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %5, align 8
  %114 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %113, i32 0, i32 1
  %115 = getelementptr inbounds %struct.savable_state, %struct.savable_state* %114, i32 0, i32 2
  %116 = load i32, i32* %7, align 4
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds [4 x i32], [4 x i32]* %115, i64 0, i64 %117
  store i32 %112, i32* %118, align 4
  br label %119

; <label>:119:                                    ; preds = %60
  %120 = load i32, i32* %6, align 4
  %121 = add nsw i32 %120, 1
  store i32 %121, i32* %6, align 4
  br label %54

; <label>:122:                                    ; preds = %54
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_encode_mcu_gather, i64 0, i64 2)
  %123 = add i64 %pgocount4, 1
  store i64 %123, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_encode_mcu_gather, i64 0, i64 2)
  ret i32 1
}

; Function Attrs: nounwind uwtable
define internal void @finish_pass_gather(%struct.jpeg_compress_struct*) #0 {
  %2 = alloca %struct.jpeg_compress_struct*, align 8
  %3 = alloca %struct.huff_entropy_encoder*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.jpeg_component_info*, align 8
  %8 = alloca %struct.JHUFF_TBL**, align 8
  %9 = alloca [4 x i32], align 16
  %10 = alloca [4 x i32], align 16
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %2, align 8
  %11 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %12 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %11, i32 0, i32 59
  %13 = load %struct.jpeg_entropy_encoder*, %struct.jpeg_entropy_encoder** %12, align 8
  %14 = bitcast %struct.jpeg_entropy_encoder* %13 to %struct.huff_entropy_encoder*
  store %struct.huff_entropy_encoder* %14, %struct.huff_entropy_encoder** %3, align 8
  %15 = getelementptr inbounds [4 x i32], [4 x i32]* %9, i32 0, i32 0
  %16 = bitcast i32* %15 to i8*
  call void @llvm.memset.p0i8.i64(i8* %16, i8 0, i64 16, i32 16, i1 false)
  %17 = getelementptr inbounds [4 x i32], [4 x i32]* %10, i32 0, i32 0
  %18 = bitcast i32* %17 to i8*
  call void @llvm.memset.p0i8.i64(i8* %18, i8 0, i64 16, i32 16, i1 false)
  store i32 0, i32* %4, align 4
  br label %19

; <label>:19:                                     ; preds = %108, %1
  %20 = load i32, i32* %4, align 4
  %21 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %22 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %21, i32 0, i32 41
  %23 = load i32, i32* %22, align 4
  %24 = icmp slt i32 %20, %23
  br i1 %24, label %25, label %112

; <label>:25:                                     ; preds = %19
  %26 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %27 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %26, i32 0, i32 42
  %28 = load i32, i32* %4, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [4 x %struct.jpeg_component_info*], [4 x %struct.jpeg_component_info*]* %27, i64 0, i64 %29
  %31 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %30, align 8
  store %struct.jpeg_component_info* %31, %struct.jpeg_component_info** %7, align 8
  %32 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %7, align 8
  %33 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %32, i32 0, i32 5
  %34 = load i32, i32* %33, align 4
  store i32 %34, i32* %5, align 4
  %35 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %7, align 8
  %36 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %35, i32 0, i32 6
  %37 = load i32, i32* %36, align 8
  store i32 %37, i32* %6, align 4
  %38 = load i32, i32* %5, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [4 x i32], [4 x i32]* %9, i64 0, i64 %39
  %41 = load i32, i32* %40, align 4
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %72, label %43

; <label>:43:                                     ; preds = %25
  %44 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %45 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %44, i32 0, i32 16
  %46 = load i32, i32* %5, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*]* %45, i64 0, i64 %47
  store %struct.JHUFF_TBL** %48, %struct.JHUFF_TBL*** %8, align 8
  %49 = load %struct.JHUFF_TBL**, %struct.JHUFF_TBL*** %8, align 8
  %50 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %49, align 8
  %51 = icmp eq %struct.JHUFF_TBL* %50, null
  br i1 %51, label %52, label %58

; <label>:52:                                     ; preds = %43
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_finish_pass_gather, i64 0, i64 3)
  %53 = add i64 %pgocount, 1
  store i64 %53, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_finish_pass_gather, i64 0, i64 3)
  %54 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %55 = bitcast %struct.jpeg_compress_struct* %54 to %struct.jpeg_common_struct*
  %56 = call %struct.JHUFF_TBL* @jpeg_alloc_huff_table(%struct.jpeg_common_struct* %55)
  %57 = load %struct.JHUFF_TBL**, %struct.JHUFF_TBL*** %8, align 8
  store %struct.JHUFF_TBL* %56, %struct.JHUFF_TBL** %57, align 8
  br label %58

; <label>:58:                                     ; preds = %52, %43
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_finish_pass_gather, i64 0, i64 1)
  %59 = add i64 %pgocount1, 1
  store i64 %59, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_finish_pass_gather, i64 0, i64 1)
  %60 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %61 = load %struct.JHUFF_TBL**, %struct.JHUFF_TBL*** %8, align 8
  %62 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %61, align 8
  %63 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %3, align 8
  %64 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %63, i32 0, i32 6
  %65 = load i32, i32* %5, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [4 x i64*], [4 x i64*]* %64, i64 0, i64 %66
  %68 = load i64*, i64** %67, align 8
  call void @jpeg_gen_optimal_table(%struct.jpeg_compress_struct* %60, %struct.JHUFF_TBL* %62, i64* %68)
  %69 = load i32, i32* %5, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [4 x i32], [4 x i32]* %9, i64 0, i64 %70
  store i32 1, i32* %71, align 4
  br label %72

; <label>:72:                                     ; preds = %58, %25
  %73 = load i32, i32* %6, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [4 x i32], [4 x i32]* %10, i64 0, i64 %74
  %76 = load i32, i32* %75, align 4
  %77 = icmp ne i32 %76, 0
  br i1 %77, label %107, label %78

; <label>:78:                                     ; preds = %72
  %79 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %80 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %79, i32 0, i32 17
  %81 = load i32, i32* %6, align 4
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*]* %80, i64 0, i64 %82
  store %struct.JHUFF_TBL** %83, %struct.JHUFF_TBL*** %8, align 8
  %84 = load %struct.JHUFF_TBL**, %struct.JHUFF_TBL*** %8, align 8
  %85 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %84, align 8
  %86 = icmp eq %struct.JHUFF_TBL* %85, null
  br i1 %86, label %87, label %93

; <label>:87:                                     ; preds = %78
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_finish_pass_gather, i64 0, i64 4)
  %88 = add i64 %pgocount2, 1
  store i64 %88, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_finish_pass_gather, i64 0, i64 4)
  %89 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %90 = bitcast %struct.jpeg_compress_struct* %89 to %struct.jpeg_common_struct*
  %91 = call %struct.JHUFF_TBL* @jpeg_alloc_huff_table(%struct.jpeg_common_struct* %90)
  %92 = load %struct.JHUFF_TBL**, %struct.JHUFF_TBL*** %8, align 8
  store %struct.JHUFF_TBL* %91, %struct.JHUFF_TBL** %92, align 8
  br label %93

; <label>:93:                                     ; preds = %87, %78
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_finish_pass_gather, i64 0, i64 2)
  %94 = add i64 %pgocount3, 1
  store i64 %94, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_finish_pass_gather, i64 0, i64 2)
  %95 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %96 = load %struct.JHUFF_TBL**, %struct.JHUFF_TBL*** %8, align 8
  %97 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %96, align 8
  %98 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %3, align 8
  %99 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %98, i32 0, i32 7
  %100 = load i32, i32* %6, align 4
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds [4 x i64*], [4 x i64*]* %99, i64 0, i64 %101
  %103 = load i64*, i64** %102, align 8
  call void @jpeg_gen_optimal_table(%struct.jpeg_compress_struct* %95, %struct.JHUFF_TBL* %97, i64* %103)
  %104 = load i32, i32* %6, align 4
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds [4 x i32], [4 x i32]* %10, i64 0, i64 %105
  store i32 1, i32* %106, align 4
  br label %107

; <label>:107:                                    ; preds = %93, %72
  br label %108

; <label>:108:                                    ; preds = %107
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_finish_pass_gather, i64 0, i64 0)
  %109 = add i64 %pgocount4, 1
  store i64 %109, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_finish_pass_gather, i64 0, i64 0)
  %110 = load i32, i32* %4, align 4
  %111 = add nsw i32 %110, 1
  store i32 %111, i32* %4, align 4
  br label %19

; <label>:112:                                    ; preds = %19
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_finish_pass_gather, i64 0, i64 5)
  %113 = add i64 %pgocount5, 1
  store i64 %113, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_finish_pass_gather, i64 0, i64 5)
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @encode_mcu_huff(%struct.jpeg_compress_struct*, [64 x i16]**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.jpeg_compress_struct*, align 8
  %5 = alloca [64 x i16]**, align 8
  %6 = alloca %struct.huff_entropy_encoder*, align 8
  %7 = alloca %struct.working_state, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca %struct.jpeg_component_info*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %4, align 8
  store [64 x i16]** %1, [64 x i16]*** %5, align 8
  %11 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %12 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %11, i32 0, i32 59
  %13 = load %struct.jpeg_entropy_encoder*, %struct.jpeg_entropy_encoder** %12, align 8
  %14 = bitcast %struct.jpeg_entropy_encoder* %13 to %struct.huff_entropy_encoder*
  store %struct.huff_entropy_encoder* %14, %struct.huff_entropy_encoder** %6, align 8
  %15 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %16 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %15, i32 0, i32 5
  %17 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %16, align 8
  %18 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %17, i32 0, i32 0
  %19 = load i8*, i8** %18, align 8
  %20 = getelementptr inbounds %struct.working_state, %struct.working_state* %7, i32 0, i32 0
  store i8* %19, i8** %20, align 8
  %21 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %22 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %21, i32 0, i32 5
  %23 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %22, align 8
  %24 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %23, i32 0, i32 1
  %25 = load i64, i64* %24, align 8
  %26 = getelementptr inbounds %struct.working_state, %struct.working_state* %7, i32 0, i32 1
  store i64 %25, i64* %26, align 8
  %27 = getelementptr inbounds %struct.working_state, %struct.working_state* %7, i32 0, i32 2
  %28 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %6, align 8
  %29 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %28, i32 0, i32 1
  %30 = bitcast %struct.savable_state* %27 to i8*
  %31 = bitcast %struct.savable_state* %29 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %30, i8* %31, i64 32, i32 8, i1 false)
  %32 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %33 = getelementptr inbounds %struct.working_state, %struct.working_state* %7, i32 0, i32 3
  store %struct.jpeg_compress_struct* %32, %struct.jpeg_compress_struct** %33, align 8
  %34 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %35 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %34, i32 0, i32 29
  %36 = load i32, i32* %35, align 8
  %37 = icmp ne i32 %36, 0
  br i1 %37, label %38, label %55

; <label>:38:                                     ; preds = %2
  %39 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %6, align 8
  %40 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %39, i32 0, i32 2
  %41 = load i32, i32* %40, align 8
  %42 = icmp eq i32 %41, 0
  br i1 %42, label %43, label %53

; <label>:43:                                     ; preds = %38
  %44 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %6, align 8
  %45 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %44, i32 0, i32 3
  %46 = load i32, i32* %45, align 4
  %47 = call i32 @emit_restart(%struct.working_state* %7, i32 %46)
  %48 = icmp ne i32 %47, 0
  br i1 %48, label %51, label %49

; <label>:49:                                     ; preds = %43
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_encode_mcu_huff, i64 0, i64 7)
  %50 = add i64 %pgocount, 1
  store i64 %50, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_encode_mcu_huff, i64 0, i64 7)
  store i32 0, i32* %3, align 4
  br label %177

; <label>:51:                                     ; preds = %43
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_encode_mcu_huff, i64 0, i64 5)
  %52 = add i64 %pgocount1, 1
  store i64 %52, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_encode_mcu_huff, i64 0, i64 5)
  br label %53

; <label>:53:                                     ; preds = %51, %38
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_encode_mcu_huff, i64 0, i64 1)
  %54 = add i64 %pgocount2, 1
  store i64 %54, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_encode_mcu_huff, i64 0, i64 1)
  br label %55

; <label>:55:                                     ; preds = %53, %2
  store i32 0, i32* %8, align 4
  br label %56

; <label>:56:                                     ; preds = %123, %55
  %57 = load i32, i32* %8, align 4
  %58 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %59 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %58, i32 0, i32 45
  %60 = load i32, i32* %59, align 8
  %61 = icmp slt i32 %57, %60
  br i1 %61, label %62, label %127

; <label>:62:                                     ; preds = %56
  %63 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %64 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %63, i32 0, i32 46
  %65 = load i32, i32* %8, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [10 x i32], [10 x i32]* %64, i64 0, i64 %66
  %68 = load i32, i32* %67, align 4
  store i32 %68, i32* %9, align 4
  %69 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %70 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %69, i32 0, i32 42
  %71 = load i32, i32* %9, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [4 x %struct.jpeg_component_info*], [4 x %struct.jpeg_component_info*]* %70, i64 0, i64 %72
  %74 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %73, align 8
  store %struct.jpeg_component_info* %74, %struct.jpeg_component_info** %10, align 8
  %75 = load [64 x i16]**, [64 x i16]*** %5, align 8
  %76 = load i32, i32* %8, align 4
  %77 = sext i32 %76 to i64
  %78 = getelementptr inbounds [64 x i16]*, [64 x i16]** %75, i64 %77
  %79 = load [64 x i16]*, [64 x i16]** %78, align 8
  %80 = getelementptr inbounds [64 x i16], [64 x i16]* %79, i64 0
  %81 = getelementptr inbounds [64 x i16], [64 x i16]* %80, i32 0, i32 0
  %82 = getelementptr inbounds %struct.working_state, %struct.working_state* %7, i32 0, i32 2
  %83 = getelementptr inbounds %struct.savable_state, %struct.savable_state* %82, i32 0, i32 2
  %84 = load i32, i32* %9, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [4 x i32], [4 x i32]* %83, i64 0, i64 %85
  %87 = load i32, i32* %86, align 4
  %88 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %6, align 8
  %89 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %88, i32 0, i32 4
  %90 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %10, align 8
  %91 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %90, i32 0, i32 5
  %92 = load i32, i32* %91, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds [4 x %struct.c_derived_tbl*], [4 x %struct.c_derived_tbl*]* %89, i64 0, i64 %93
  %95 = load %struct.c_derived_tbl*, %struct.c_derived_tbl** %94, align 8
  %96 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %6, align 8
  %97 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %96, i32 0, i32 5
  %98 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %10, align 8
  %99 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %98, i32 0, i32 6
  %100 = load i32, i32* %99, align 8
  %101 = sext i32 %100 to i64
  %102 = getelementptr inbounds [4 x %struct.c_derived_tbl*], [4 x %struct.c_derived_tbl*]* %97, i64 0, i64 %101
  %103 = load %struct.c_derived_tbl*, %struct.c_derived_tbl** %102, align 8
  %104 = call i32 @encode_one_block(%struct.working_state* %7, i16* %81, i32 %87, %struct.c_derived_tbl* %95, %struct.c_derived_tbl* %103)
  %105 = icmp ne i32 %104, 0
  br i1 %105, label %108, label %106

; <label>:106:                                    ; preds = %62
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_encode_mcu_huff, i64 0, i64 3)
  %107 = add i64 %pgocount3, 1
  store i64 %107, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_encode_mcu_huff, i64 0, i64 3)
  store i32 0, i32* %3, align 4
  br label %177

; <label>:108:                                    ; preds = %62
  %109 = load [64 x i16]**, [64 x i16]*** %5, align 8
  %110 = load i32, i32* %8, align 4
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds [64 x i16]*, [64 x i16]** %109, i64 %111
  %113 = load [64 x i16]*, [64 x i16]** %112, align 8
  %114 = getelementptr inbounds [64 x i16], [64 x i16]* %113, i64 0
  %115 = getelementptr inbounds [64 x i16], [64 x i16]* %114, i64 0, i64 0
  %116 = load i16, i16* %115, align 2
  %117 = sext i16 %116 to i32
  %118 = getelementptr inbounds %struct.working_state, %struct.working_state* %7, i32 0, i32 2
  %119 = getelementptr inbounds %struct.savable_state, %struct.savable_state* %118, i32 0, i32 2
  %120 = load i32, i32* %9, align 4
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds [4 x i32], [4 x i32]* %119, i64 0, i64 %121
  store i32 %117, i32* %122, align 4
  br label %123

; <label>:123:                                    ; preds = %108
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_encode_mcu_huff, i64 0, i64 0)
  %124 = add i64 %pgocount4, 1
  store i64 %124, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_encode_mcu_huff, i64 0, i64 0)
  %125 = load i32, i32* %8, align 4
  %126 = add nsw i32 %125, 1
  store i32 %126, i32* %8, align 4
  br label %56

; <label>:127:                                    ; preds = %56
  %128 = getelementptr inbounds %struct.working_state, %struct.working_state* %7, i32 0, i32 0
  %129 = load i8*, i8** %128, align 8
  %130 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %131 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %130, i32 0, i32 5
  %132 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %131, align 8
  %133 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %132, i32 0, i32 0
  store i8* %129, i8** %133, align 8
  %134 = getelementptr inbounds %struct.working_state, %struct.working_state* %7, i32 0, i32 1
  %135 = load i64, i64* %134, align 8
  %136 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %137 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %136, i32 0, i32 5
  %138 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %137, align 8
  %139 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %138, i32 0, i32 1
  store i64 %135, i64* %139, align 8
  %140 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %6, align 8
  %141 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %140, i32 0, i32 1
  %142 = getelementptr inbounds %struct.working_state, %struct.working_state* %7, i32 0, i32 2
  %143 = bitcast %struct.savable_state* %141 to i8*
  %144 = bitcast %struct.savable_state* %142 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %143, i8* %144, i64 32, i32 8, i1 false)
  %145 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %146 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %145, i32 0, i32 29
  %147 = load i32, i32* %146, align 8
  %148 = icmp ne i32 %147, 0
  br i1 %148, label %149, label %175

; <label>:149:                                    ; preds = %127
  %150 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %6, align 8
  %151 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %150, i32 0, i32 2
  %152 = load i32, i32* %151, align 8
  %153 = icmp eq i32 %152, 0
  br i1 %153, label %154, label %169

; <label>:154:                                    ; preds = %149
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_encode_mcu_huff, i64 0, i64 6)
  %155 = add i64 %pgocount5, 1
  store i64 %155, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_encode_mcu_huff, i64 0, i64 6)
  %156 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %157 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %156, i32 0, i32 29
  %158 = load i32, i32* %157, align 8
  %159 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %6, align 8
  %160 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %159, i32 0, i32 2
  store i32 %158, i32* %160, align 8
  %161 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %6, align 8
  %162 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %161, i32 0, i32 3
  %163 = load i32, i32* %162, align 4
  %164 = add nsw i32 %163, 1
  store i32 %164, i32* %162, align 4
  %165 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %6, align 8
  %166 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %165, i32 0, i32 3
  %167 = load i32, i32* %166, align 4
  %168 = and i32 %167, 7
  store i32 %168, i32* %166, align 4
  br label %169

; <label>:169:                                    ; preds = %154, %149
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_encode_mcu_huff, i64 0, i64 4)
  %170 = add i64 %pgocount6, 1
  store i64 %170, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_encode_mcu_huff, i64 0, i64 4)
  %171 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %6, align 8
  %172 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %171, i32 0, i32 2
  %173 = load i32, i32* %172, align 8
  %174 = add i32 %173, -1
  store i32 %174, i32* %172, align 8
  br label %175

; <label>:175:                                    ; preds = %169, %127
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_encode_mcu_huff, i64 0, i64 2)
  %176 = add i64 %pgocount7, 1
  store i64 %176, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_encode_mcu_huff, i64 0, i64 2)
  store i32 1, i32* %3, align 4
  br label %177

; <label>:177:                                    ; preds = %175, %106, %49
  %178 = load i32, i32* %3, align 4
  ret i32 %178
}

; Function Attrs: nounwind uwtable
define internal void @finish_pass_huff(%struct.jpeg_compress_struct*) #0 {
  %2 = alloca %struct.jpeg_compress_struct*, align 8
  %3 = alloca %struct.huff_entropy_encoder*, align 8
  %4 = alloca %struct.working_state, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %2, align 8
  %5 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %5, i32 0, i32 59
  %7 = load %struct.jpeg_entropy_encoder*, %struct.jpeg_entropy_encoder** %6, align 8
  %8 = bitcast %struct.jpeg_entropy_encoder* %7 to %struct.huff_entropy_encoder*
  store %struct.huff_entropy_encoder* %8, %struct.huff_entropy_encoder** %3, align 8
  %9 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %10 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %9, i32 0, i32 5
  %11 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %10, align 8
  %12 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %11, i32 0, i32 0
  %13 = load i8*, i8** %12, align 8
  %14 = getelementptr inbounds %struct.working_state, %struct.working_state* %4, i32 0, i32 0
  store i8* %13, i8** %14, align 8
  %15 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %16 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %15, i32 0, i32 5
  %17 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %16, align 8
  %18 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %17, i32 0, i32 1
  %19 = load i64, i64* %18, align 8
  %20 = getelementptr inbounds %struct.working_state, %struct.working_state* %4, i32 0, i32 1
  store i64 %19, i64* %20, align 8
  %21 = getelementptr inbounds %struct.working_state, %struct.working_state* %4, i32 0, i32 2
  %22 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %3, align 8
  %23 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %22, i32 0, i32 1
  %24 = bitcast %struct.savable_state* %21 to i8*
  %25 = bitcast %struct.savable_state* %23 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %24, i8* %25, i64 32, i32 8, i1 false)
  %26 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %27 = getelementptr inbounds %struct.working_state, %struct.working_state* %4, i32 0, i32 3
  store %struct.jpeg_compress_struct* %26, %struct.jpeg_compress_struct** %27, align 8
  %28 = call i32 @flush_bits(%struct.working_state* %4)
  %29 = icmp ne i32 %28, 0
  br i1 %29, label %44, label %30

; <label>:30:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_finish_pass_huff, i64 0, i64 1)
  %31 = add i64 %pgocount, 1
  store i64 %31, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_finish_pass_huff, i64 0, i64 1)
  %32 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %33 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %32, i32 0, i32 0
  %34 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %33, align 8
  %35 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %34, i32 0, i32 5
  store i32 22, i32* %35, align 8
  %36 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %37 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %36, i32 0, i32 0
  %38 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %37, align 8
  %39 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %38, i32 0, i32 0
  %40 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %39, align 8
  %41 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %42 = bitcast %struct.jpeg_compress_struct* %41 to %struct.jpeg_common_struct*
  %43 = ptrtoint void (%struct.jpeg_common_struct*)* %40 to i64
  call void @__llvm_profile_instrument_target(i64 %43, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_finish_pass_huff to i8*), i32 0)
  call void %40(%struct.jpeg_common_struct* %42)
  br label %44

; <label>:44:                                     ; preds = %30, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_finish_pass_huff, i64 0, i64 0)
  %45 = add i64 %pgocount1, 1
  store i64 %45, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_finish_pass_huff, i64 0, i64 0)
  %46 = getelementptr inbounds %struct.working_state, %struct.working_state* %4, i32 0, i32 0
  %47 = load i8*, i8** %46, align 8
  %48 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %49 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %48, i32 0, i32 5
  %50 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %49, align 8
  %51 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %50, i32 0, i32 0
  store i8* %47, i8** %51, align 8
  %52 = getelementptr inbounds %struct.working_state, %struct.working_state* %4, i32 0, i32 1
  %53 = load i64, i64* %52, align 8
  %54 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %55 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %54, i32 0, i32 5
  %56 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %55, align 8
  %57 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %56, i32 0, i32 1
  store i64 %53, i64* %57, align 8
  %58 = load %struct.huff_entropy_encoder*, %struct.huff_entropy_encoder** %3, align 8
  %59 = getelementptr inbounds %struct.huff_entropy_encoder, %struct.huff_entropy_encoder* %58, i32 0, i32 1
  %60 = getelementptr inbounds %struct.working_state, %struct.working_state* %4, i32 0, i32 2
  %61 = bitcast %struct.savable_state* %59 to i8*
  %62 = bitcast %struct.savable_state* %60 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %61, i8* %62, i64 32, i32 8, i1 false)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @htest_one_block(i16*, i32, i64*, i64*) #0 {
  %5 = alloca i16*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i64*, align 8
  %8 = alloca i64*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i16* %0, i16** %5, align 8
  store i32 %1, i32* %6, align 4
  store i64* %2, i64** %7, align 8
  store i64* %3, i64** %8, align 8
  %13 = load i16*, i16** %5, align 8
  %14 = getelementptr inbounds i16, i16* %13, i64 0
  %15 = load i16, i16* %14, align 2
  %16 = sext i16 %15 to i32
  %17 = load i32, i32* %6, align 4
  %18 = sub nsw i32 %16, %17
  store i32 %18, i32* %9, align 4
  %19 = load i32, i32* %9, align 4
  %20 = icmp slt i32 %19, 0
  br i1 %20, label %21, label %25

; <label>:21:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_htest_one_block, i64 0, i64 8)
  %22 = add i64 %pgocount, 1
  store i64 %22, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_htest_one_block, i64 0, i64 8)
  %23 = load i32, i32* %9, align 4
  %24 = sub nsw i32 0, %23
  store i32 %24, i32* %9, align 4
  br label %25

; <label>:25:                                     ; preds = %21, %4
  store i32 0, i32* %10, align 4
  br label %26

; <label>:26:                                     ; preds = %29, %25
  %27 = load i32, i32* %9, align 4
  %28 = icmp ne i32 %27, 0
  br i1 %28, label %29, label %35

; <label>:29:                                     ; preds = %26
  %pgocount1 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_htest_one_block, i64 0, i64 2)
  %30 = add i64 %pgocount1, 1
  store i64 %30, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_htest_one_block, i64 0, i64 2)
  %31 = load i32, i32* %10, align 4
  %32 = add nsw i32 %31, 1
  store i32 %32, i32* %10, align 4
  %33 = load i32, i32* %9, align 4
  %34 = ashr i32 %33, 1
  store i32 %34, i32* %9, align 4
  br label %26

; <label>:35:                                     ; preds = %26
  %36 = load i64*, i64** %7, align 8
  %37 = load i32, i32* %10, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i64, i64* %36, i64 %38
  %40 = load i64, i64* %39, align 8
  %41 = add nsw i64 %40, 1
  store i64 %41, i64* %39, align 8
  store i32 0, i32* %12, align 4
  store i32 1, i32* %11, align 4
  br label %42

; <label>:42:                                     ; preds = %100, %35
  %43 = load i32, i32* %11, align 4
  %44 = icmp slt i32 %43, 64
  br i1 %44, label %45, label %103

; <label>:45:                                     ; preds = %42
  %46 = load i16*, i16** %5, align 8
  %47 = load i32, i32* %11, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [0 x i32], [0 x i32]* @jpeg_natural_order, i64 0, i64 %48
  %50 = load i32, i32* %49, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i16, i16* %46, i64 %51
  %53 = load i16, i16* %52, align 2
  %54 = sext i16 %53 to i32
  store i32 %54, i32* %9, align 4
  %55 = icmp eq i32 %54, 0
  br i1 %55, label %56, label %60

; <label>:56:                                     ; preds = %45
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_htest_one_block, i64 0, i64 4)
  %57 = add i64 %pgocount2, 1
  store i64 %57, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_htest_one_block, i64 0, i64 4)
  %58 = load i32, i32* %12, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, i32* %12, align 4
  br label %99

; <label>:60:                                     ; preds = %45
  br label %61

; <label>:61:                                     ; preds = %64, %60
  %62 = load i32, i32* %12, align 4
  %63 = icmp sgt i32 %62, 15
  br i1 %63, label %64, label %72

; <label>:64:                                     ; preds = %61
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_htest_one_block, i64 0, i64 0)
  %65 = add i64 %pgocount3, 1
  store i64 %65, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_htest_one_block, i64 0, i64 0)
  %66 = load i64*, i64** %8, align 8
  %67 = getelementptr inbounds i64, i64* %66, i64 240
  %68 = load i64, i64* %67, align 8
  %69 = add nsw i64 %68, 1
  store i64 %69, i64* %67, align 8
  %70 = load i32, i32* %12, align 4
  %71 = sub nsw i32 %70, 16
  store i32 %71, i32* %12, align 4
  br label %61

; <label>:72:                                     ; preds = %61
  %73 = load i32, i32* %9, align 4
  %74 = icmp slt i32 %73, 0
  br i1 %74, label %75, label %79

; <label>:75:                                     ; preds = %72
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_htest_one_block, i64 0, i64 5)
  %76 = add i64 %pgocount4, 1
  store i64 %76, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_htest_one_block, i64 0, i64 5)
  %77 = load i32, i32* %9, align 4
  %78 = sub nsw i32 0, %77
  store i32 %78, i32* %9, align 4
  br label %79

; <label>:79:                                     ; preds = %75, %72
  store i32 1, i32* %10, align 4
  br label %80

; <label>:80:                                     ; preds = %84, %79
  %81 = load i32, i32* %9, align 4
  %82 = ashr i32 %81, 1
  store i32 %82, i32* %9, align 4
  %83 = icmp ne i32 %82, 0
  br i1 %83, label %84, label %88

; <label>:84:                                     ; preds = %80
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_htest_one_block, i64 0, i64 1)
  %85 = add i64 %pgocount5, 1
  store i64 %85, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_htest_one_block, i64 0, i64 1)
  %86 = load i32, i32* %10, align 4
  %87 = add nsw i32 %86, 1
  store i32 %87, i32* %10, align 4
  br label %80

; <label>:88:                                     ; preds = %80
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_htest_one_block, i64 0, i64 3)
  %89 = add i64 %pgocount6, 1
  store i64 %89, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_htest_one_block, i64 0, i64 3)
  %90 = load i64*, i64** %8, align 8
  %91 = load i32, i32* %12, align 4
  %92 = shl i32 %91, 4
  %93 = load i32, i32* %10, align 4
  %94 = add nsw i32 %92, %93
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds i64, i64* %90, i64 %95
  %97 = load i64, i64* %96, align 8
  %98 = add nsw i64 %97, 1
  store i64 %98, i64* %96, align 8
  store i32 0, i32* %12, align 4
  br label %99

; <label>:99:                                     ; preds = %88, %56
  br label %100

; <label>:100:                                    ; preds = %99
  %101 = load i32, i32* %11, align 4
  %102 = add nsw i32 %101, 1
  store i32 %102, i32* %11, align 4
  br label %42

; <label>:103:                                    ; preds = %42
  %104 = load i32, i32* %12, align 4
  %105 = icmp sgt i32 %104, 0
  br i1 %105, label %106, label %112

; <label>:106:                                    ; preds = %103
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_htest_one_block, i64 0, i64 7)
  %107 = add i64 %pgocount7, 1
  store i64 %107, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_htest_one_block, i64 0, i64 7)
  %108 = load i64*, i64** %8, align 8
  %109 = getelementptr inbounds i64, i64* %108, i64 0
  %110 = load i64, i64* %109, align 8
  %111 = add nsw i64 %110, 1
  store i64 %111, i64* %109, align 8
  br label %112

; <label>:112:                                    ; preds = %106, %103
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_htest_one_block, i64 0, i64 6)
  %113 = add i64 %pgocount8, 1
  store i64 %113, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_tmp1.ll_htest_one_block, i64 0, i64 6)
  ret void
}

declare %struct.JHUFF_TBL* @jpeg_alloc_huff_table(%struct.jpeg_common_struct*) #2

; Function Attrs: nounwind uwtable
define internal i32 @emit_restart(%struct.working_state*, i32) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.working_state*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store %struct.working_state* %0, %struct.working_state** %4, align 8
  store i32 %1, i32* %5, align 4
  %7 = load %struct.working_state*, %struct.working_state** %4, align 8
  %8 = call i32 @flush_bits(%struct.working_state* %7)
  %9 = icmp ne i32 %8, 0
  br i1 %9, label %12, label %10

; <label>:10:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_restart, i64 0, i64 2)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_restart, i64 0, i64 2)
  store i32 0, i32* %3, align 4
  br label %73

; <label>:12:                                     ; preds = %2
  %13 = load %struct.working_state*, %struct.working_state** %4, align 8
  %14 = getelementptr inbounds %struct.working_state, %struct.working_state* %13, i32 0, i32 0
  %15 = load i8*, i8** %14, align 8
  %16 = getelementptr inbounds i8, i8* %15, i32 1
  store i8* %16, i8** %14, align 8
  store i8 -1, i8* %15, align 1
  %17 = load %struct.working_state*, %struct.working_state** %4, align 8
  %18 = getelementptr inbounds %struct.working_state, %struct.working_state* %17, i32 0, i32 1
  %19 = load i64, i64* %18, align 8
  %20 = add i64 %19, -1
  store i64 %20, i64* %18, align 8
  %21 = icmp eq i64 %20, 0
  br i1 %21, label %22, label %30

; <label>:22:                                     ; preds = %12
  %23 = load %struct.working_state*, %struct.working_state** %4, align 8
  %24 = call i32 @dump_buffer(%struct.working_state* %23)
  %25 = icmp ne i32 %24, 0
  br i1 %25, label %28, label %26

; <label>:26:                                     ; preds = %22
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_restart, i64 0, i64 5)
  %27 = add i64 %pgocount1, 1
  store i64 %27, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_restart, i64 0, i64 5)
  store i32 0, i32* %3, align 4
  br label %73

; <label>:28:                                     ; preds = %22
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_restart, i64 0, i64 3)
  %29 = add i64 %pgocount2, 1
  store i64 %29, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_restart, i64 0, i64 3)
  br label %30

; <label>:30:                                     ; preds = %28, %12
  %31 = load i32, i32* %5, align 4
  %32 = add nsw i32 208, %31
  %33 = trunc i32 %32 to i8
  %34 = load %struct.working_state*, %struct.working_state** %4, align 8
  %35 = getelementptr inbounds %struct.working_state, %struct.working_state* %34, i32 0, i32 0
  %36 = load i8*, i8** %35, align 8
  %37 = getelementptr inbounds i8, i8* %36, i32 1
  store i8* %37, i8** %35, align 8
  store i8 %33, i8* %36, align 1
  %38 = load %struct.working_state*, %struct.working_state** %4, align 8
  %39 = getelementptr inbounds %struct.working_state, %struct.working_state* %38, i32 0, i32 1
  %40 = load i64, i64* %39, align 8
  %41 = add i64 %40, -1
  store i64 %41, i64* %39, align 8
  %42 = icmp eq i64 %41, 0
  br i1 %42, label %43, label %51

; <label>:43:                                     ; preds = %30
  %44 = load %struct.working_state*, %struct.working_state** %4, align 8
  %45 = call i32 @dump_buffer(%struct.working_state* %44)
  %46 = icmp ne i32 %45, 0
  br i1 %46, label %49, label %47

; <label>:47:                                     ; preds = %43
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_restart, i64 0, i64 6)
  %48 = add i64 %pgocount3, 1
  store i64 %48, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_restart, i64 0, i64 6)
  store i32 0, i32* %3, align 4
  br label %73

; <label>:49:                                     ; preds = %43
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_restart, i64 0, i64 4)
  %50 = add i64 %pgocount4, 1
  store i64 %50, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_restart, i64 0, i64 4)
  br label %51

; <label>:51:                                     ; preds = %49, %30
  store i32 0, i32* %6, align 4
  br label %52

; <label>:52:                                     ; preds = %67, %51
  %53 = load i32, i32* %6, align 4
  %54 = load %struct.working_state*, %struct.working_state** %4, align 8
  %55 = getelementptr inbounds %struct.working_state, %struct.working_state* %54, i32 0, i32 3
  %56 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %55, align 8
  %57 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %56, i32 0, i32 41
  %58 = load i32, i32* %57, align 4
  %59 = icmp slt i32 %53, %58
  br i1 %59, label %60, label %71

; <label>:60:                                     ; preds = %52
  %61 = load %struct.working_state*, %struct.working_state** %4, align 8
  %62 = getelementptr inbounds %struct.working_state, %struct.working_state* %61, i32 0, i32 2
  %63 = getelementptr inbounds %struct.savable_state, %struct.savable_state* %62, i32 0, i32 2
  %64 = load i32, i32* %6, align 4
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds [4 x i32], [4 x i32]* %63, i64 0, i64 %65
  store i32 0, i32* %66, align 4
  br label %67

; <label>:67:                                     ; preds = %60
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_restart, i64 0, i64 0)
  %68 = add i64 %pgocount5, 1
  store i64 %68, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_restart, i64 0, i64 0)
  %69 = load i32, i32* %6, align 4
  %70 = add nsw i32 %69, 1
  store i32 %70, i32* %6, align 4
  br label %52

; <label>:71:                                     ; preds = %52
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_restart, i64 0, i64 1)
  %72 = add i64 %pgocount6, 1
  store i64 %72, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_restart, i64 0, i64 1)
  store i32 1, i32* %3, align 4
  br label %73

; <label>:73:                                     ; preds = %71, %47, %26, %10
  %74 = load i32, i32* %3, align 4
  ret i32 %74
}

; Function Attrs: nounwind uwtable
define internal i32 @encode_one_block(%struct.working_state*, i16*, i32, %struct.c_derived_tbl*, %struct.c_derived_tbl*) #0 {
  %6 = alloca i32, align 4
  %7 = alloca %struct.working_state*, align 8
  %8 = alloca i16*, align 8
  %9 = alloca i32, align 4
  %10 = alloca %struct.c_derived_tbl*, align 8
  %11 = alloca %struct.c_derived_tbl*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  store %struct.working_state* %0, %struct.working_state** %7, align 8
  store i16* %1, i16** %8, align 8
  store i32 %2, i32* %9, align 4
  store %struct.c_derived_tbl* %3, %struct.c_derived_tbl** %10, align 8
  store %struct.c_derived_tbl* %4, %struct.c_derived_tbl** %11, align 8
  %18 = load i16*, i16** %8, align 8
  %19 = getelementptr inbounds i16, i16* %18, i64 0
  %20 = load i16, i16* %19, align 2
  %21 = sext i16 %20 to i32
  %22 = load i32, i32* %9, align 4
  %23 = sub nsw i32 %21, %22
  store i32 %23, i32* %13, align 4
  store i32 %23, i32* %12, align 4
  %24 = load i32, i32* %12, align 4
  %25 = icmp slt i32 %24, 0
  br i1 %25, label %26, label %32

; <label>:26:                                     ; preds = %5
  %pgocount = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_encode_one_block, i64 0, i64 6)
  %27 = add i64 %pgocount, 1
  store i64 %27, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_encode_one_block, i64 0, i64 6)
  %28 = load i32, i32* %12, align 4
  %29 = sub nsw i32 0, %28
  store i32 %29, i32* %12, align 4
  %30 = load i32, i32* %13, align 4
  %31 = add nsw i32 %30, -1
  store i32 %31, i32* %13, align 4
  br label %32

; <label>:32:                                     ; preds = %26, %5
  store i32 0, i32* %14, align 4
  br label %33

; <label>:33:                                     ; preds = %36, %32
  %34 = load i32, i32* %12, align 4
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %36, label %42

; <label>:36:                                     ; preds = %33
  %pgocount1 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_encode_one_block, i64 0, i64 0)
  %37 = add i64 %pgocount1, 1
  store i64 %37, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_encode_one_block, i64 0, i64 0)
  %38 = load i32, i32* %14, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, i32* %14, align 4
  %40 = load i32, i32* %12, align 4
  %41 = ashr i32 %40, 1
  store i32 %41, i32* %12, align 4
  br label %33

; <label>:42:                                     ; preds = %33
  %43 = load %struct.working_state*, %struct.working_state** %7, align 8
  %44 = load %struct.c_derived_tbl*, %struct.c_derived_tbl** %10, align 8
  %45 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %44, i32 0, i32 0
  %46 = load i32, i32* %14, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [256 x i32], [256 x i32]* %45, i64 0, i64 %47
  %49 = load i32, i32* %48, align 4
  %50 = load %struct.c_derived_tbl*, %struct.c_derived_tbl** %10, align 8
  %51 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %50, i32 0, i32 1
  %52 = load i32, i32* %14, align 4
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds [256 x i8], [256 x i8]* %51, i64 0, i64 %53
  %55 = load i8, i8* %54, align 1
  %56 = sext i8 %55 to i32
  %57 = call i32 @emit_bits(%struct.working_state* %43, i32 %49, i32 %56)
  %58 = icmp ne i32 %57, 0
  br i1 %58, label %61, label %59

; <label>:59:                                     ; preds = %42
  %pgocount2 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_encode_one_block, i64 0, i64 7)
  %60 = add i64 %pgocount2, 1
  store i64 %60, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_encode_one_block, i64 0, i64 7)
  store i32 0, i32* %6, align 4
  br label %194

; <label>:61:                                     ; preds = %42
  %62 = load i32, i32* %14, align 4
  %63 = icmp ne i32 %62, 0
  br i1 %63, label %64, label %74

; <label>:64:                                     ; preds = %61
  %65 = load %struct.working_state*, %struct.working_state** %7, align 8
  %66 = load i32, i32* %13, align 4
  %67 = load i32, i32* %14, align 4
  %68 = call i32 @emit_bits(%struct.working_state* %65, i32 %66, i32 %67)
  %69 = icmp ne i32 %68, 0
  br i1 %69, label %72, label %70

; <label>:70:                                     ; preds = %64
  %pgocount3 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_encode_one_block, i64 0, i64 10)
  %71 = add i64 %pgocount3, 1
  store i64 %71, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_encode_one_block, i64 0, i64 10)
  store i32 0, i32* %6, align 4
  br label %194

; <label>:72:                                     ; preds = %64
  %pgocount4 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_encode_one_block, i64 0, i64 8)
  %73 = add i64 %pgocount4, 1
  store i64 %73, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_encode_one_block, i64 0, i64 8)
  br label %74

; <label>:74:                                     ; preds = %72, %61
  store i32 0, i32* %16, align 4
  store i32 1, i32* %15, align 4
  br label %75

; <label>:75:                                     ; preds = %169, %74
  %76 = load i32, i32* %15, align 4
  %77 = icmp slt i32 %76, 64
  br i1 %77, label %78, label %172

; <label>:78:                                     ; preds = %75
  %79 = load i16*, i16** %8, align 8
  %80 = load i32, i32* %15, align 4
  %81 = sext i32 %80 to i64
  %82 = getelementptr inbounds [0 x i32], [0 x i32]* @jpeg_natural_order, i64 0, i64 %81
  %83 = load i32, i32* %82, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds i16, i16* %79, i64 %84
  %86 = load i16, i16* %85, align 2
  %87 = sext i16 %86 to i32
  store i32 %87, i32* %12, align 4
  %88 = icmp eq i32 %87, 0
  br i1 %88, label %89, label %93

; <label>:89:                                     ; preds = %78
  %pgocount5 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_encode_one_block, i64 0, i64 3)
  %90 = add i64 %pgocount5, 1
  store i64 %90, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_encode_one_block, i64 0, i64 3)
  %91 = load i32, i32* %16, align 4
  %92 = add nsw i32 %91, 1
  store i32 %92, i32* %16, align 4
  br label %168

; <label>:93:                                     ; preds = %78
  br label %94

; <label>:94:                                     ; preds = %112, %93
  %95 = load i32, i32* %16, align 4
  %96 = icmp sgt i32 %95, 15
  br i1 %96, label %97, label %116

; <label>:97:                                     ; preds = %94
  %98 = load %struct.working_state*, %struct.working_state** %7, align 8
  %99 = load %struct.c_derived_tbl*, %struct.c_derived_tbl** %11, align 8
  %100 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %99, i32 0, i32 0
  %101 = getelementptr inbounds [256 x i32], [256 x i32]* %100, i64 0, i64 240
  %102 = load i32, i32* %101, align 4
  %103 = load %struct.c_derived_tbl*, %struct.c_derived_tbl** %11, align 8
  %104 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %103, i32 0, i32 1
  %105 = getelementptr inbounds [256 x i8], [256 x i8]* %104, i64 0, i64 240
  %106 = load i8, i8* %105, align 4
  %107 = sext i8 %106 to i32
  %108 = call i32 @emit_bits(%struct.working_state* %98, i32 %102, i32 %107)
  %109 = icmp ne i32 %108, 0
  br i1 %109, label %112, label %110

; <label>:110:                                    ; preds = %97
  %pgocount6 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_encode_one_block, i64 0, i64 4)
  %111 = add i64 %pgocount6, 1
  store i64 %111, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_encode_one_block, i64 0, i64 4)
  store i32 0, i32* %6, align 4
  br label %194

; <label>:112:                                    ; preds = %97
  %pgocount7 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_encode_one_block, i64 0, i64 2)
  %113 = add i64 %pgocount7, 1
  store i64 %113, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_encode_one_block, i64 0, i64 2)
  %114 = load i32, i32* %16, align 4
  %115 = sub nsw i32 %114, 16
  store i32 %115, i32* %16, align 4
  br label %94

; <label>:116:                                    ; preds = %94
  %117 = load i32, i32* %12, align 4
  store i32 %117, i32* %13, align 4
  %118 = load i32, i32* %12, align 4
  %119 = icmp slt i32 %118, 0
  br i1 %119, label %120, label %126

; <label>:120:                                    ; preds = %116
  %pgocount8 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_encode_one_block, i64 0, i64 9)
  %121 = add i64 %pgocount8, 1
  store i64 %121, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_encode_one_block, i64 0, i64 9)
  %122 = load i32, i32* %12, align 4
  %123 = sub nsw i32 0, %122
  store i32 %123, i32* %12, align 4
  %124 = load i32, i32* %13, align 4
  %125 = add nsw i32 %124, -1
  store i32 %125, i32* %13, align 4
  br label %126

; <label>:126:                                    ; preds = %120, %116
  store i32 1, i32* %14, align 4
  br label %127

; <label>:127:                                    ; preds = %131, %126
  %128 = load i32, i32* %12, align 4
  %129 = ashr i32 %128, 1
  store i32 %129, i32* %12, align 4
  %130 = icmp ne i32 %129, 0
  br i1 %130, label %131, label %135

; <label>:131:                                    ; preds = %127
  %pgocount9 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_encode_one_block, i64 0, i64 1)
  %132 = add i64 %pgocount9, 1
  store i64 %132, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_encode_one_block, i64 0, i64 1)
  %133 = load i32, i32* %14, align 4
  %134 = add nsw i32 %133, 1
  store i32 %134, i32* %14, align 4
  br label %127

; <label>:135:                                    ; preds = %127
  %136 = load i32, i32* %16, align 4
  %137 = shl i32 %136, 4
  %138 = load i32, i32* %14, align 4
  %139 = add nsw i32 %137, %138
  store i32 %139, i32* %17, align 4
  %140 = load %struct.working_state*, %struct.working_state** %7, align 8
  %141 = load %struct.c_derived_tbl*, %struct.c_derived_tbl** %11, align 8
  %142 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %141, i32 0, i32 0
  %143 = load i32, i32* %17, align 4
  %144 = sext i32 %143 to i64
  %145 = getelementptr inbounds [256 x i32], [256 x i32]* %142, i64 0, i64 %144
  %146 = load i32, i32* %145, align 4
  %147 = load %struct.c_derived_tbl*, %struct.c_derived_tbl** %11, align 8
  %148 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %147, i32 0, i32 1
  %149 = load i32, i32* %17, align 4
  %150 = sext i32 %149 to i64
  %151 = getelementptr inbounds [256 x i8], [256 x i8]* %148, i64 0, i64 %150
  %152 = load i8, i8* %151, align 1
  %153 = sext i8 %152 to i32
  %154 = call i32 @emit_bits(%struct.working_state* %140, i32 %146, i32 %153)
  %155 = icmp ne i32 %154, 0
  br i1 %155, label %158, label %156

; <label>:156:                                    ; preds = %135
  %pgocount10 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_encode_one_block, i64 0, i64 13)
  %157 = add i64 %pgocount10, 1
  store i64 %157, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_encode_one_block, i64 0, i64 13)
  store i32 0, i32* %6, align 4
  br label %194

; <label>:158:                                    ; preds = %135
  %159 = load %struct.working_state*, %struct.working_state** %7, align 8
  %160 = load i32, i32* %13, align 4
  %161 = load i32, i32* %14, align 4
  %162 = call i32 @emit_bits(%struct.working_state* %159, i32 %160, i32 %161)
  %163 = icmp ne i32 %162, 0
  br i1 %163, label %166, label %164

; <label>:164:                                    ; preds = %158
  %pgocount11 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_encode_one_block, i64 0, i64 14)
  %165 = add i64 %pgocount11, 1
  store i64 %165, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_encode_one_block, i64 0, i64 14)
  store i32 0, i32* %6, align 4
  br label %194

; <label>:166:                                    ; preds = %158
  %pgocount12 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_encode_one_block, i64 0, i64 5)
  %167 = add i64 %pgocount12, 1
  store i64 %167, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_encode_one_block, i64 0, i64 5)
  store i32 0, i32* %16, align 4
  br label %168

; <label>:168:                                    ; preds = %166, %89
  br label %169

; <label>:169:                                    ; preds = %168
  %170 = load i32, i32* %15, align 4
  %171 = add nsw i32 %170, 1
  store i32 %171, i32* %15, align 4
  br label %75

; <label>:172:                                    ; preds = %75
  %173 = load i32, i32* %16, align 4
  %174 = icmp sgt i32 %173, 0
  br i1 %174, label %175, label %192

; <label>:175:                                    ; preds = %172
  %176 = load %struct.working_state*, %struct.working_state** %7, align 8
  %177 = load %struct.c_derived_tbl*, %struct.c_derived_tbl** %11, align 8
  %178 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %177, i32 0, i32 0
  %179 = getelementptr inbounds [256 x i32], [256 x i32]* %178, i64 0, i64 0
  %180 = load i32, i32* %179, align 4
  %181 = load %struct.c_derived_tbl*, %struct.c_derived_tbl** %11, align 8
  %182 = getelementptr inbounds %struct.c_derived_tbl, %struct.c_derived_tbl* %181, i32 0, i32 1
  %183 = getelementptr inbounds [256 x i8], [256 x i8]* %182, i64 0, i64 0
  %184 = load i8, i8* %183, align 4
  %185 = sext i8 %184 to i32
  %186 = call i32 @emit_bits(%struct.working_state* %176, i32 %180, i32 %185)
  %187 = icmp ne i32 %186, 0
  br i1 %187, label %190, label %188

; <label>:188:                                    ; preds = %175
  %pgocount13 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_encode_one_block, i64 0, i64 15)
  %189 = add i64 %pgocount13, 1
  store i64 %189, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_encode_one_block, i64 0, i64 15)
  store i32 0, i32* %6, align 4
  br label %194

; <label>:190:                                    ; preds = %175
  %pgocount14 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_encode_one_block, i64 0, i64 12)
  %191 = add i64 %pgocount14, 1
  store i64 %191, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_encode_one_block, i64 0, i64 12)
  br label %192

; <label>:192:                                    ; preds = %190, %172
  %pgocount15 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_encode_one_block, i64 0, i64 11)
  %193 = add i64 %pgocount15, 1
  store i64 %193, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_encode_one_block, i64 0, i64 11)
  store i32 1, i32* %6, align 4
  br label %194

; <label>:194:                                    ; preds = %192, %188, %164, %156, %110, %70, %59
  %195 = load i32, i32* %6, align 4
  ret i32 %195
}

; Function Attrs: nounwind uwtable
define internal i32 @flush_bits(%struct.working_state*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.working_state*, align 8
  store %struct.working_state* %0, %struct.working_state** %3, align 8
  %4 = load %struct.working_state*, %struct.working_state** %3, align 8
  %5 = call i32 @emit_bits(%struct.working_state* %4, i32 127, i32 7)
  %6 = icmp ne i32 %5, 0
  br i1 %6, label %9, label %7

; <label>:7:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_flush_bits, i64 0, i64 1)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_flush_bits, i64 0, i64 1)
  store i32 0, i32* %2, align 4
  br label %17

; <label>:9:                                      ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_flush_bits, i64 0, i64 0)
  %10 = add i64 %pgocount1, 1
  store i64 %10, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_flush_bits, i64 0, i64 0)
  %11 = load %struct.working_state*, %struct.working_state** %3, align 8
  %12 = getelementptr inbounds %struct.working_state, %struct.working_state* %11, i32 0, i32 2
  %13 = getelementptr inbounds %struct.savable_state, %struct.savable_state* %12, i32 0, i32 0
  store i64 0, i64* %13, align 8
  %14 = load %struct.working_state*, %struct.working_state** %3, align 8
  %15 = getelementptr inbounds %struct.working_state, %struct.working_state* %14, i32 0, i32 2
  %16 = getelementptr inbounds %struct.savable_state, %struct.savable_state* %15, i32 0, i32 1
  store i32 0, i32* %16, align 8
  store i32 1, i32* %2, align 4
  br label %17

; <label>:17:                                     ; preds = %9, %7
  %18 = load i32, i32* %2, align 4
  ret i32 %18
}

; Function Attrs: nounwind uwtable
define internal i32 @dump_buffer(%struct.working_state*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca %struct.working_state*, align 8
  %4 = alloca %struct.jpeg_destination_mgr*, align 8
  store %struct.working_state* %0, %struct.working_state** %3, align 8
  %5 = load %struct.working_state*, %struct.working_state** %3, align 8
  %6 = getelementptr inbounds %struct.working_state, %struct.working_state* %5, i32 0, i32 3
  %7 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %7, i32 0, i32 5
  %9 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %8, align 8
  store %struct.jpeg_destination_mgr* %9, %struct.jpeg_destination_mgr** %4, align 8
  %10 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %4, align 8
  %11 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %10, i32 0, i32 3
  %12 = load i32 (%struct.jpeg_compress_struct*)*, i32 (%struct.jpeg_compress_struct*)** %11, align 8
  %13 = load %struct.working_state*, %struct.working_state** %3, align 8
  %14 = getelementptr inbounds %struct.working_state, %struct.working_state* %13, i32 0, i32 3
  %15 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %14, align 8
  %16 = ptrtoint i32 (%struct.jpeg_compress_struct*)* %12 to i64
  call void @__llvm_profile_instrument_target(i64 %16, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_dump_buffer to i8*), i32 0)
  %17 = call i32 %12(%struct.jpeg_compress_struct* %15)
  %18 = icmp ne i32 %17, 0
  br i1 %18, label %21, label %19

; <label>:19:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_dump_buffer, i64 0, i64 1)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_dump_buffer, i64 0, i64 1)
  store i32 0, i32* %2, align 4
  br label %33

; <label>:21:                                     ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_dump_buffer, i64 0, i64 0)
  %22 = add i64 %pgocount1, 1
  store i64 %22, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_dump_buffer, i64 0, i64 0)
  %23 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %4, align 8
  %24 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %23, i32 0, i32 0
  %25 = load i8*, i8** %24, align 8
  %26 = load %struct.working_state*, %struct.working_state** %3, align 8
  %27 = getelementptr inbounds %struct.working_state, %struct.working_state* %26, i32 0, i32 0
  store i8* %25, i8** %27, align 8
  %28 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %4, align 8
  %29 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %28, i32 0, i32 1
  %30 = load i64, i64* %29, align 8
  %31 = load %struct.working_state*, %struct.working_state** %3, align 8
  %32 = getelementptr inbounds %struct.working_state, %struct.working_state* %31, i32 0, i32 1
  store i64 %30, i64* %32, align 8
  store i32 1, i32* %2, align 4
  br label %33

; <label>:33:                                     ; preds = %21, %19
  %34 = load i32, i32* %2, align 4
  ret i32 %34
}

; Function Attrs: inlinehint nounwind uwtable
define internal i32 @emit_bits(%struct.working_state*, i32, i32) #3 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.working_state*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i64, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store %struct.working_state* %0, %struct.working_state** %5, align 8
  store i32 %1, i32* %6, align 4
  store i32 %2, i32* %7, align 4
  %11 = load i32, i32* %6, align 4
  %12 = zext i32 %11 to i64
  store i64 %12, i64* %8, align 8
  %13 = load %struct.working_state*, %struct.working_state** %5, align 8
  %14 = getelementptr inbounds %struct.working_state, %struct.working_state* %13, i32 0, i32 2
  %15 = getelementptr inbounds %struct.savable_state, %struct.savable_state* %14, i32 0, i32 1
  %16 = load i32, i32* %15, align 8
  store i32 %16, i32* %9, align 4
  %17 = load i32, i32* %7, align 4
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %39

; <label>:19:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_bits, i64 0, i64 5)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_bits, i64 0, i64 5)
  %21 = load %struct.working_state*, %struct.working_state** %5, align 8
  %22 = getelementptr inbounds %struct.working_state, %struct.working_state* %21, i32 0, i32 3
  %23 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %22, align 8
  %24 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %23, i32 0, i32 0
  %25 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %24, align 8
  %26 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %25, i32 0, i32 5
  store i32 39, i32* %26, align 8
  %27 = load %struct.working_state*, %struct.working_state** %5, align 8
  %28 = getelementptr inbounds %struct.working_state, %struct.working_state* %27, i32 0, i32 3
  %29 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %28, align 8
  %30 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %29, i32 0, i32 0
  %31 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %30, align 8
  %32 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %31, i32 0, i32 0
  %33 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %32, align 8
  %34 = load %struct.working_state*, %struct.working_state** %5, align 8
  %35 = getelementptr inbounds %struct.working_state, %struct.working_state* %34, i32 0, i32 3
  %36 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %35, align 8
  %37 = bitcast %struct.jpeg_compress_struct* %36 to %struct.jpeg_common_struct*
  %38 = ptrtoint void (%struct.jpeg_common_struct*)* %33 to i64
  call void @__llvm_profile_instrument_target(i64 %38, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_emit_bits to i8*), i32 0)
  call void %33(%struct.jpeg_common_struct* %37)
  br label %39

; <label>:39:                                     ; preds = %19, %3
  %40 = load i32, i32* %7, align 4
  %41 = zext i32 %40 to i64
  %42 = shl i64 1, %41
  %43 = sub nsw i64 %42, 1
  %44 = load i64, i64* %8, align 8
  %45 = and i64 %44, %43
  store i64 %45, i64* %8, align 8
  %46 = load i32, i32* %7, align 4
  %47 = load i32, i32* %9, align 4
  %48 = add nsw i32 %47, %46
  store i32 %48, i32* %9, align 4
  %49 = load i32, i32* %9, align 4
  %50 = sub nsw i32 24, %49
  %51 = load i64, i64* %8, align 8
  %52 = zext i32 %50 to i64
  %53 = shl i64 %51, %52
  store i64 %53, i64* %8, align 8
  %54 = load %struct.working_state*, %struct.working_state** %5, align 8
  %55 = getelementptr inbounds %struct.working_state, %struct.working_state* %54, i32 0, i32 2
  %56 = getelementptr inbounds %struct.savable_state, %struct.savable_state* %55, i32 0, i32 0
  %57 = load i64, i64* %56, align 8
  %58 = load i64, i64* %8, align 8
  %59 = or i64 %58, %57
  store i64 %59, i64* %8, align 8
  br label %60

; <label>:60:                                     ; preds = %110, %39
  %61 = load i32, i32* %9, align 4
  %62 = icmp sge i32 %61, 8
  br i1 %62, label %63, label %116

; <label>:63:                                     ; preds = %60
  %64 = load i64, i64* %8, align 8
  %65 = ashr i64 %64, 16
  %66 = and i64 %65, 255
  %67 = trunc i64 %66 to i32
  store i32 %67, i32* %10, align 4
  %68 = load i32, i32* %10, align 4
  %69 = trunc i32 %68 to i8
  %70 = load %struct.working_state*, %struct.working_state** %5, align 8
  %71 = getelementptr inbounds %struct.working_state, %struct.working_state* %70, i32 0, i32 0
  %72 = load i8*, i8** %71, align 8
  %73 = getelementptr inbounds i8, i8* %72, i32 1
  store i8* %73, i8** %71, align 8
  store i8 %69, i8* %72, align 1
  %74 = load %struct.working_state*, %struct.working_state** %5, align 8
  %75 = getelementptr inbounds %struct.working_state, %struct.working_state* %74, i32 0, i32 1
  %76 = load i64, i64* %75, align 8
  %77 = add i64 %76, -1
  store i64 %77, i64* %75, align 8
  %78 = icmp eq i64 %77, 0
  br i1 %78, label %79, label %87

; <label>:79:                                     ; preds = %63
  %80 = load %struct.working_state*, %struct.working_state** %5, align 8
  %81 = call i32 @dump_buffer(%struct.working_state* %80)
  %82 = icmp ne i32 %81, 0
  br i1 %82, label %85, label %83

; <label>:83:                                     ; preds = %79
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_bits, i64 0, i64 6)
  %84 = add i64 %pgocount1, 1
  store i64 %84, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_bits, i64 0, i64 6)
  store i32 0, i32* %4, align 4
  br label %126

; <label>:85:                                     ; preds = %79
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_bits, i64 0, i64 2)
  %86 = add i64 %pgocount2, 1
  store i64 %86, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_bits, i64 0, i64 2)
  br label %87

; <label>:87:                                     ; preds = %85, %63
  %88 = load i32, i32* %10, align 4
  %89 = icmp eq i32 %88, 255
  br i1 %89, label %90, label %110

; <label>:90:                                     ; preds = %87
  %91 = load %struct.working_state*, %struct.working_state** %5, align 8
  %92 = getelementptr inbounds %struct.working_state, %struct.working_state* %91, i32 0, i32 0
  %93 = load i8*, i8** %92, align 8
  %94 = getelementptr inbounds i8, i8* %93, i32 1
  store i8* %94, i8** %92, align 8
  store i8 0, i8* %93, align 1
  %95 = load %struct.working_state*, %struct.working_state** %5, align 8
  %96 = getelementptr inbounds %struct.working_state, %struct.working_state* %95, i32 0, i32 1
  %97 = load i64, i64* %96, align 8
  %98 = add i64 %97, -1
  store i64 %98, i64* %96, align 8
  %99 = icmp eq i64 %98, 0
  br i1 %99, label %100, label %108

; <label>:100:                                    ; preds = %90
  %101 = load %struct.working_state*, %struct.working_state** %5, align 8
  %102 = call i32 @dump_buffer(%struct.working_state* %101)
  %103 = icmp ne i32 %102, 0
  br i1 %103, label %106, label %104

; <label>:104:                                    ; preds = %100
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_bits, i64 0, i64 7)
  %105 = add i64 %pgocount3, 1
  store i64 %105, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_bits, i64 0, i64 7)
  store i32 0, i32* %4, align 4
  br label %126

; <label>:106:                                    ; preds = %100
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_bits, i64 0, i64 3)
  %107 = add i64 %pgocount4, 1
  store i64 %107, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_bits, i64 0, i64 3)
  br label %108

; <label>:108:                                    ; preds = %106, %90
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_bits, i64 0, i64 1)
  %109 = add i64 %pgocount5, 1
  store i64 %109, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_bits, i64 0, i64 1)
  br label %110

; <label>:110:                                    ; preds = %108, %87
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_bits, i64 0, i64 0)
  %111 = add i64 %pgocount6, 1
  store i64 %111, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_bits, i64 0, i64 0)
  %112 = load i64, i64* %8, align 8
  %113 = shl i64 %112, 8
  store i64 %113, i64* %8, align 8
  %114 = load i32, i32* %9, align 4
  %115 = sub nsw i32 %114, 8
  store i32 %115, i32* %9, align 4
  br label %60

; <label>:116:                                    ; preds = %60
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_bits, i64 0, i64 4)
  %117 = add i64 %pgocount7, 1
  store i64 %117, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_bits, i64 0, i64 4)
  %118 = load i64, i64* %8, align 8
  %119 = load %struct.working_state*, %struct.working_state** %5, align 8
  %120 = getelementptr inbounds %struct.working_state, %struct.working_state* %119, i32 0, i32 2
  %121 = getelementptr inbounds %struct.savable_state, %struct.savable_state* %120, i32 0, i32 0
  store i64 %118, i64* %121, align 8
  %122 = load i32, i32* %9, align 4
  %123 = load %struct.working_state*, %struct.working_state** %5, align 8
  %124 = getelementptr inbounds %struct.working_state, %struct.working_state* %123, i32 0, i32 2
  %125 = getelementptr inbounds %struct.savable_state, %struct.savable_state* %124, i32 0, i32 1
  store i32 %122, i32* %125, align 8
  store i32 1, i32* %4, align 4
  br label %126

; <label>:126:                                    ; preds = %116, %104, %83
  %127 = load i32, i32* %4, align 4
  ret i32 %127
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #4

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { inlinehint nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
