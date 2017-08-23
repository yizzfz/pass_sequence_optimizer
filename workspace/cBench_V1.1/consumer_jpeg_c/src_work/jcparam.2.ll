; ModuleID = 'tmp1.ll'
source_filename = "jcparam.c"
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

@jpeg_set_linear_quality.std_luminance_quant_tbl = internal constant [64 x i32] [i32 16, i32 11, i32 10, i32 16, i32 24, i32 40, i32 51, i32 61, i32 12, i32 12, i32 14, i32 19, i32 26, i32 58, i32 60, i32 55, i32 14, i32 13, i32 16, i32 24, i32 40, i32 57, i32 69, i32 56, i32 14, i32 17, i32 22, i32 29, i32 51, i32 87, i32 80, i32 62, i32 18, i32 22, i32 37, i32 56, i32 68, i32 109, i32 103, i32 77, i32 24, i32 35, i32 55, i32 64, i32 81, i32 104, i32 113, i32 92, i32 49, i32 64, i32 78, i32 87, i32 103, i32 121, i32 120, i32 101, i32 72, i32 92, i32 95, i32 98, i32 112, i32 100, i32 103, i32 99], align 16
@jpeg_set_linear_quality.std_chrominance_quant_tbl = internal constant [64 x i32] [i32 17, i32 18, i32 24, i32 47, i32 99, i32 99, i32 99, i32 99, i32 18, i32 21, i32 26, i32 66, i32 99, i32 99, i32 99, i32 99, i32 24, i32 26, i32 56, i32 99, i32 99, i32 99, i32 99, i32 99, i32 47, i32 66, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99, i32 99], align 16
@std_huff_tables.bits_dc_luminance = internal constant [17 x i8] c"\00\00\01\05\01\01\01\01\01\01\00\00\00\00\00\00\00", align 16
@std_huff_tables.val_dc_luminance = internal constant [12 x i8] c"\00\01\02\03\04\05\06\07\08\09\0A\0B", align 1
@std_huff_tables.bits_dc_chrominance = internal constant [17 x i8] c"\00\00\03\01\01\01\01\01\01\01\01\01\00\00\00\00\00", align 16
@std_huff_tables.val_dc_chrominance = internal constant [12 x i8] c"\00\01\02\03\04\05\06\07\08\09\0A\0B", align 1
@std_huff_tables.bits_ac_luminance = internal constant [17 x i8] c"\00\00\02\01\03\03\02\04\03\05\05\04\04\00\00\01}", align 16
@std_huff_tables.val_ac_luminance = internal constant [162 x i8] c"\01\02\03\00\04\11\05\12!1A\06\13Qa\07\22q\142\81\91\A1\08#B\B1\C1\15R\D1\F0$3br\82\09\0A\16\17\18\19\1A%&'()*456789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz\83\84\85\86\87\88\89\8A\92\93\94\95\96\97\98\99\9A\A2\A3\A4\A5\A6\A7\A8\A9\AA\B2\B3\B4\B5\B6\B7\B8\B9\BA\C2\C3\C4\C5\C6\C7\C8\C9\CA\D2\D3\D4\D5\D6\D7\D8\D9\DA\E1\E2\E3\E4\E5\E6\E7\E8\E9\EA\F1\F2\F3\F4\F5\F6\F7\F8\F9\FA", align 16
@std_huff_tables.bits_ac_chrominance = internal constant [17 x i8] c"\00\00\02\01\02\04\04\03\04\07\05\04\04\00\01\02w", align 16
@std_huff_tables.val_ac_chrominance = internal constant [162 x i8] c"\00\01\02\03\11\04\05!1\06\12AQ\07aq\13\222\81\08\14B\91\A1\B1\C1\09#3R\F0\15br\D1\0A\16$4\E1%\F1\17\18\19\1A&'()*56789:CDEFGHIJSTUVWXYZcdefghijstuvwxyz\82\83\84\85\86\87\88\89\8A\92\93\94\95\96\97\98\99\9A\A2\A3\A4\A5\A6\A7\A8\A9\AA\B2\B3\B4\B5\B6\B7\B8\B9\BA\C2\C3\C4\C5\C6\C7\C8\C9\CA\D2\D3\D4\D5\D6\D7\D8\D9\DA\E2\E3\E4\E5\E6\E7\E8\E9\EA\F2\F3\F4\F5\F6\F7\F8\F9\FA", align 16
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jpeg_add_quant_table = private constant [20 x i8] c"jpeg_add_quant_table"
@__profn_jpeg_set_linear_quality = private constant [23 x i8] c"jpeg_set_linear_quality"
@__profn_jpeg_quality_scaling = private constant [20 x i8] c"jpeg_quality_scaling"
@__profn_jpeg_set_quality = private constant [16 x i8] c"jpeg_set_quality"
@__profn_jpeg_set_defaults = private constant [17 x i8] c"jpeg_set_defaults"
@__profn_tmp1.ll_std_huff_tables = private constant [23 x i8] c"tmp1.ll:std_huff_tables"
@__profn_jpeg_default_colorspace = private constant [23 x i8] c"jpeg_default_colorspace"
@__profn_jpeg_set_colorspace = private constant [19 x i8] c"jpeg_set_colorspace"
@__profn_jpeg_simple_progression = private constant [23 x i8] c"jpeg_simple_progression"
@__profn_tmp1.ll_fill_dc_scans = private constant [21 x i8] c"tmp1.ll:fill_dc_scans"
@__profn_tmp1.ll_fill_a_scan = private constant [19 x i8] c"tmp1.ll:fill_a_scan"
@__profn_tmp1.ll_fill_scans = private constant [18 x i8] c"tmp1.ll:fill_scans"
@__profn_tmp1.ll_add_huff_table = private constant [22 x i8] c"tmp1.ll:add_huff_table"
@__profc_jpeg_add_quant_table = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jpeg_add_quant_table = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jpeg_add_quant_table = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 905734270769844002, i64 281578215627716, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_add_quant_table, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, i32, i32*, i32, i32)* @jpeg_add_quant_table to i8*), i8* bitcast ([1 x i64]* @__profvp_jpeg_add_quant_table to i8*), i32 8, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_jpeg_set_linear_quality = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_jpeg_set_linear_quality = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2045826415788051655, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_set_linear_quality, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, i32, i32)* @jpeg_set_linear_quality to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_jpeg_quality_scaling = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_jpeg_quality_scaling = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3435076320402265724, i64 54931947490, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_quality_scaling, i32 0, i32 0), i8* bitcast (i32 (i32)* @jpeg_quality_scaling to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_jpeg_set_quality = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_jpeg_set_quality = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4209578870921256638, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_set_quality, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, i32, i32)* @jpeg_set_quality to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_jpeg_set_defaults = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jpeg_set_defaults = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jpeg_set_defaults = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5123272177795054901, i64 563021993074573, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_set_defaults, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*)* @jpeg_set_defaults to i8*), i8* bitcast ([2 x i64]* @__profvp_jpeg_set_defaults to i8*), i32 5, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_std_huff_tables = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_std_huff_tables = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3212330522245576552, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_std_huff_tables, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_jpeg_default_colorspace = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jpeg_default_colorspace = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jpeg_default_colorspace = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -616779561348905116, i64 281546762331342, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_default_colorspace, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*)* @jpeg_default_colorspace to i8*), i8* bitcast ([1 x i64]* @__profvp_jpeg_default_colorspace to i8*), i32 7, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_jpeg_set_colorspace = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jpeg_set_colorspace = private global [3 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jpeg_set_colorspace = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2137951591233957794, i64 844553215170879, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_set_colorspace, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, i32)* @jpeg_set_colorspace to i8*), i8* bitcast ([3 x i64]* @__profvp_jpeg_set_colorspace to i8*), i32 11, [1 x i16] [i16 3] }, section "__llvm_prf_data", align 8
@__profc_jpeg_simple_progression = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jpeg_simple_progression = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jpeg_simple_progression = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4399916782239566770, i64 563040434733282, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_simple_progression, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*)* @jpeg_simple_progression to i8*), i8* bitcast ([2 x i64]* @__profvp_jpeg_simple_progression to i8*), i32 7, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_fill_dc_scans = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_fill_dc_scans = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1559275262010535632, i64 48045721719, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_fill_dc_scans, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_fill_a_scan = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_fill_a_scan = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2036559239419719457, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_fill_a_scan, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_fill_scans = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_fill_scans = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -654882227136158829, i64 34137660316, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_fill_scans, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_add_huff_table = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_add_huff_table = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4947049742897727200, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_add_huff_table, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [18 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [139 x i8] c"\94\02\87\01x\DAe\90A\0E\021\08E3\172q\EBe\08\16Z;a\DAZ\E8\C2\DBk\EDd\C6\C6\15\E1\F1\02?\AC\85\03 \11<\1B&\03\C3\BB\F0\B2v\A8l 11\D6>\93h\AF\C1\F7\06\D4}j\0A\A7<Y\1D\10{lb\BA\D8V\AE\17\91\9B\1A\C1\A3y?\CE\E80w\0B\5C\96\5C\B5\A0\FB\B9\FF\C7\E2V\84\A1\D4\1C*\AB\C6\9C\8E\DD>\8A\00\B9\1E+\E9L\F1\0Bg6k\FD\01g\B07D\14j ", section "__llvm_prf_names"
@llvm.used = appending global [15 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_add_quant_table to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_set_linear_quality to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_quality_scaling to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_set_quality to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_set_defaults to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_std_huff_tables to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_default_colorspace to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_set_colorspace to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_simple_progression to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_fill_dc_scans to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_fill_a_scan to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_fill_scans to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_add_huff_table to i8*), i8* bitcast ([18 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([139 x i8], [139 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @jpeg_add_quant_table(%struct.jpeg_compress_struct*, i32, i32*, i32, i32) #0 {
  %6 = alloca %struct.jpeg_compress_struct*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca %struct.JQUANT_TBL**, align 8
  %12 = alloca i32, align 4
  %13 = alloca i64, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %6, align 8
  store i32 %1, i32* %7, align 4
  store i32* %2, i32** %8, align 8
  store i32 %3, i32* %9, align 4
  store i32 %4, i32* %10, align 4
  %14 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %15 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %14, i32 0, i32 15
  %16 = load i32, i32* %7, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [4 x %struct.JQUANT_TBL*], [4 x %struct.JQUANT_TBL*]* %15, i64 0, i64 %17
  store %struct.JQUANT_TBL** %18, %struct.JQUANT_TBL*** %11, align 8
  %19 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %20 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %19, i32 0, i32 4
  %21 = load i32, i32* %20, align 4
  %22 = icmp ne i32 %21, 100
  br i1 %22, label %23, label %46

; <label>:23:                                     ; preds = %5
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_add_quant_table, i64 0, i64 6)
  %24 = add i64 %pgocount, 1
  store i64 %24, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_add_quant_table, i64 0, i64 6)
  %25 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %26 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %25, i32 0, i32 0
  %27 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %26, align 8
  %28 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %27, i32 0, i32 5
  store i32 18, i32* %28, align 8
  %29 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %30 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %29, i32 0, i32 4
  %31 = load i32, i32* %30, align 4
  %32 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %33 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %32, i32 0, i32 0
  %34 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %33, align 8
  %35 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %34, i32 0, i32 6
  %36 = bitcast %union.anon* %35 to [8 x i32]*
  %37 = getelementptr inbounds [8 x i32], [8 x i32]* %36, i64 0, i64 0
  store i32 %31, i32* %37, align 4
  %38 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %39 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %38, i32 0, i32 0
  %40 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %39, align 8
  %41 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %40, i32 0, i32 0
  %42 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %41, align 8
  %43 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %44 = bitcast %struct.jpeg_compress_struct* %43 to %struct.jpeg_common_struct*
  %45 = ptrtoint void (%struct.jpeg_common_struct*)* %42 to i64
  call void @__llvm_profile_instrument_target(i64 %45, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_add_quant_table to i8*), i32 0)
  call void %42(%struct.jpeg_common_struct* %44)
  br label %46

; <label>:46:                                     ; preds = %23, %5
  %47 = load %struct.JQUANT_TBL**, %struct.JQUANT_TBL*** %11, align 8
  %48 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %47, align 8
  %49 = icmp eq %struct.JQUANT_TBL* %48, null
  br i1 %49, label %50, label %56

; <label>:50:                                     ; preds = %46
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_add_quant_table, i64 0, i64 7)
  %51 = add i64 %pgocount1, 1
  store i64 %51, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_add_quant_table, i64 0, i64 7)
  %52 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %6, align 8
  %53 = bitcast %struct.jpeg_compress_struct* %52 to %struct.jpeg_common_struct*
  %54 = call %struct.JQUANT_TBL* @jpeg_alloc_quant_table(%struct.jpeg_common_struct* %53)
  %55 = load %struct.JQUANT_TBL**, %struct.JQUANT_TBL*** %11, align 8
  store %struct.JQUANT_TBL* %54, %struct.JQUANT_TBL** %55, align 8
  br label %56

; <label>:56:                                     ; preds = %50, %46
  store i32 0, i32* %12, align 4
  br label %57

; <label>:57:                                     ; preds = %100, %56
  %58 = load i32, i32* %12, align 4
  %59 = icmp slt i32 %58, 64
  br i1 %59, label %60, label %103

; <label>:60:                                     ; preds = %57
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_add_quant_table, i64 0, i64 0)
  %61 = add i64 %pgocount2, 1
  store i64 %61, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_add_quant_table, i64 0, i64 0)
  %62 = load i32*, i32** %8, align 8
  %63 = load i32, i32* %12, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds i32, i32* %62, i64 %64
  %66 = load i32, i32* %65, align 4
  %67 = zext i32 %66 to i64
  %68 = load i32, i32* %9, align 4
  %69 = sext i32 %68 to i64
  %70 = mul nsw i64 %67, %69
  %71 = add nsw i64 %70, 50
  %72 = sdiv i64 %71, 100
  store i64 %72, i64* %13, align 8
  %73 = load i64, i64* %13, align 8
  %74 = icmp sle i64 %73, 0
  br i1 %74, label %75, label %77

; <label>:75:                                     ; preds = %60
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_add_quant_table, i64 0, i64 2)
  %76 = add i64 %pgocount3, 1
  store i64 %76, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_add_quant_table, i64 0, i64 2)
  store i64 1, i64* %13, align 8
  br label %77

; <label>:77:                                     ; preds = %75, %60
  %78 = load i64, i64* %13, align 8
  %79 = icmp sgt i64 %78, 32767
  br i1 %79, label %80, label %82

; <label>:80:                                     ; preds = %77
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_add_quant_table, i64 0, i64 3)
  %81 = add i64 %pgocount4, 1
  store i64 %81, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_add_quant_table, i64 0, i64 3)
  store i64 32767, i64* %13, align 8
  br label %82

; <label>:82:                                     ; preds = %80, %77
  %83 = load i32, i32* %10, align 4
  %84 = icmp ne i32 %83, 0
  br i1 %84, label %85, label %91

; <label>:85:                                     ; preds = %82
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_add_quant_table, i64 0, i64 1)
  %86 = add i64 %pgocount5, 1
  store i64 %86, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_add_quant_table, i64 0, i64 1)
  %87 = load i64, i64* %13, align 8
  %88 = icmp sgt i64 %87, 255
  br i1 %88, label %89, label %91

; <label>:89:                                     ; preds = %85
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_add_quant_table, i64 0, i64 4)
  %90 = add i64 %pgocount6, 1
  store i64 %90, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_add_quant_table, i64 0, i64 4)
  store i64 255, i64* %13, align 8
  br label %91

; <label>:91:                                     ; preds = %89, %85, %82
  %92 = load i64, i64* %13, align 8
  %93 = trunc i64 %92 to i16
  %94 = load %struct.JQUANT_TBL**, %struct.JQUANT_TBL*** %11, align 8
  %95 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %94, align 8
  %96 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %95, i32 0, i32 0
  %97 = load i32, i32* %12, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds [64 x i16], [64 x i16]* %96, i64 0, i64 %98
  store i16 %93, i16* %99, align 2
  br label %100

; <label>:100:                                    ; preds = %91
  %101 = load i32, i32* %12, align 4
  %102 = add nsw i32 %101, 1
  store i32 %102, i32* %12, align 4
  br label %57

; <label>:103:                                    ; preds = %57
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_add_quant_table, i64 0, i64 5)
  %104 = add i64 %pgocount7, 1
  store i64 %104, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_jpeg_add_quant_table, i64 0, i64 5)
  %105 = load %struct.JQUANT_TBL**, %struct.JQUANT_TBL*** %11, align 8
  %106 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %105, align 8
  %107 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %106, i32 0, i32 1
  store i32 0, i32* %107, align 4
  ret void
}

declare %struct.JQUANT_TBL* @jpeg_alloc_quant_table(%struct.jpeg_common_struct*) #1

; Function Attrs: nounwind uwtable
define void @jpeg_set_linear_quality(%struct.jpeg_compress_struct*, i32, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_set_linear_quality, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_set_linear_quality, i64 0, i64 0)
  %5 = alloca %struct.jpeg_compress_struct*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %5, align 8
  store i32 %1, i32* %6, align 4
  store i32 %2, i32* %7, align 4
  %8 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %9 = load i32, i32* %6, align 4
  %10 = load i32, i32* %7, align 4
  call void @jpeg_add_quant_table(%struct.jpeg_compress_struct* %8, i32 0, i32* getelementptr inbounds ([64 x i32], [64 x i32]* @jpeg_set_linear_quality.std_luminance_quant_tbl, i32 0, i32 0), i32 %9, i32 %10)
  %11 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %12 = load i32, i32* %6, align 4
  %13 = load i32, i32* %7, align 4
  call void @jpeg_add_quant_table(%struct.jpeg_compress_struct* %11, i32 1, i32* getelementptr inbounds ([64 x i32], [64 x i32]* @jpeg_set_linear_quality.std_chrominance_quant_tbl, i32 0, i32 0), i32 %12, i32 %13)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @jpeg_quality_scaling(i32) #0 {
  %2 = alloca i32, align 4
  store i32 %0, i32* %2, align 4
  %3 = load i32, i32* %2, align 4
  %4 = icmp sle i32 %3, 0
  br i1 %4, label %5, label %7

; <label>:5:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_quality_scaling, i64 0, i64 0)
  %6 = add i64 %pgocount, 1
  store i64 %6, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_quality_scaling, i64 0, i64 0)
  store i32 1, i32* %2, align 4
  br label %7

; <label>:7:                                      ; preds = %5, %1
  %8 = load i32, i32* %2, align 4
  %9 = icmp sgt i32 %8, 100
  br i1 %9, label %10, label %12

; <label>:10:                                     ; preds = %7
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_quality_scaling, i64 0, i64 1)
  %11 = add i64 %pgocount1, 1
  store i64 %11, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_quality_scaling, i64 0, i64 1)
  store i32 100, i32* %2, align 4
  br label %12

; <label>:12:                                     ; preds = %10, %7
  %13 = load i32, i32* %2, align 4
  %14 = icmp slt i32 %13, 50
  br i1 %14, label %15, label %19

; <label>:15:                                     ; preds = %12
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_quality_scaling, i64 0, i64 2)
  %16 = add i64 %pgocount2, 1
  store i64 %16, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_quality_scaling, i64 0, i64 2)
  %17 = load i32, i32* %2, align 4
  %18 = sdiv i32 5000, %17
  store i32 %18, i32* %2, align 4
  br label %24

; <label>:19:                                     ; preds = %12
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_quality_scaling, i64 0, i64 3)
  %20 = add i64 %pgocount3, 1
  store i64 %20, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_jpeg_quality_scaling, i64 0, i64 3)
  %21 = load i32, i32* %2, align 4
  %22 = mul nsw i32 %21, 2
  %23 = sub nsw i32 200, %22
  store i32 %23, i32* %2, align 4
  br label %24

; <label>:24:                                     ; preds = %19, %15
  %25 = load i32, i32* %2, align 4
  ret i32 %25
}

; Function Attrs: nounwind uwtable
define void @jpeg_set_quality(%struct.jpeg_compress_struct*, i32, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_set_quality, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jpeg_set_quality, i64 0, i64 0)
  %5 = alloca %struct.jpeg_compress_struct*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %5, align 8
  store i32 %1, i32* %6, align 4
  store i32 %2, i32* %7, align 4
  %8 = load i32, i32* %6, align 4
  %9 = call i32 @jpeg_quality_scaling(i32 %8)
  store i32 %9, i32* %6, align 4
  %10 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %11 = load i32, i32* %6, align 4
  %12 = load i32, i32* %7, align 4
  call void @jpeg_set_linear_quality(%struct.jpeg_compress_struct* %10, i32 %11, i32 %12)
  ret void
}

; Function Attrs: nounwind uwtable
define void @jpeg_set_defaults(%struct.jpeg_compress_struct*) #0 {
  %2 = alloca %struct.jpeg_compress_struct*, align 8
  %3 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %2, align 8
  %4 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %5 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %4, i32 0, i32 4
  %6 = load i32, i32* %5, align 4
  %7 = icmp ne i32 %6, 100
  br i1 %7, label %8, label %31

; <label>:8:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_set_defaults, i64 0, i64 2)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_set_defaults, i64 0, i64 2)
  %10 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %11 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %10, i32 0, i32 0
  %12 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %11, align 8
  %13 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %12, i32 0, i32 5
  store i32 18, i32* %13, align 8
  %14 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %15 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %14, i32 0, i32 4
  %16 = load i32, i32* %15, align 4
  %17 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %18 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %17, i32 0, i32 0
  %19 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %18, align 8
  %20 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %19, i32 0, i32 6
  %21 = bitcast %union.anon* %20 to [8 x i32]*
  %22 = getelementptr inbounds [8 x i32], [8 x i32]* %21, i64 0, i64 0
  store i32 %16, i32* %22, align 4
  %23 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %24 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %23, i32 0, i32 0
  %25 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %24, align 8
  %26 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %25, i32 0, i32 0
  %27 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %26, align 8
  %28 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %29 = bitcast %struct.jpeg_compress_struct* %28 to %struct.jpeg_common_struct*
  %30 = ptrtoint void (%struct.jpeg_common_struct*)* %27 to i64
  call void @__llvm_profile_instrument_target(i64 %30, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_set_defaults to i8*), i32 0)
  call void %27(%struct.jpeg_common_struct* %29)
  br label %31

; <label>:31:                                     ; preds = %8, %1
  %32 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %33 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %32, i32 0, i32 14
  %34 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %33, align 8
  %35 = icmp eq %struct.jpeg_component_info* %34, null
  br i1 %35, label %36, label %50

; <label>:36:                                     ; preds = %31
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_set_defaults, i64 0, i64 4)
  %37 = add i64 %pgocount1, 1
  store i64 %37, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_set_defaults, i64 0, i64 4)
  %38 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %39 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %38, i32 0, i32 1
  %40 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %39, align 8
  %41 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %40, i32 0, i32 0
  %42 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %41, align 8
  %43 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %44 = bitcast %struct.jpeg_compress_struct* %43 to %struct.jpeg_common_struct*
  %45 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %42 to i64
  call void @__llvm_profile_instrument_target(i64 %45, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_set_defaults to i8*), i32 1)
  %46 = call i8* %42(%struct.jpeg_common_struct* %44, i32 0, i64 960)
  %47 = bitcast i8* %46 to %struct.jpeg_component_info*
  %48 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %49 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %48, i32 0, i32 14
  store %struct.jpeg_component_info* %47, %struct.jpeg_component_info** %49, align 8
  br label %50

; <label>:50:                                     ; preds = %36, %31
  %51 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %52 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %51, i32 0, i32 11
  store i32 8, i32* %52, align 8
  %53 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @jpeg_set_quality(%struct.jpeg_compress_struct* %53, i32 75, i32 1)
  %54 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @std_huff_tables(%struct.jpeg_compress_struct* %54)
  store i32 0, i32* %3, align 4
  br label %55

; <label>:55:                                     ; preds = %75, %50
  %56 = load i32, i32* %3, align 4
  %57 = icmp slt i32 %56, 16
  br i1 %57, label %58, label %78

; <label>:58:                                     ; preds = %55
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_set_defaults, i64 0, i64 0)
  %59 = add i64 %pgocount2, 1
  store i64 %59, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_set_defaults, i64 0, i64 0)
  %60 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %61 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %60, i32 0, i32 18
  %62 = load i32, i32* %3, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [16 x i8], [16 x i8]* %61, i64 0, i64 %63
  store i8 0, i8* %64, align 1
  %65 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %66 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %65, i32 0, i32 19
  %67 = load i32, i32* %3, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [16 x i8], [16 x i8]* %66, i64 0, i64 %68
  store i8 1, i8* %69, align 1
  %70 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %71 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %70, i32 0, i32 20
  %72 = load i32, i32* %3, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [16 x i8], [16 x i8]* %71, i64 0, i64 %73
  store i8 5, i8* %74, align 1
  br label %75

; <label>:75:                                     ; preds = %58
  %76 = load i32, i32* %3, align 4
  %77 = add nsw i32 %76, 1
  store i32 %77, i32* %3, align 4
  br label %55

; <label>:78:                                     ; preds = %55
  %79 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %80 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %79, i32 0, i32 22
  store %struct.jpeg_scan_info* null, %struct.jpeg_scan_info** %80, align 8
  %81 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %82 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %81, i32 0, i32 21
  store i32 0, i32* %82, align 8
  %83 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %84 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %83, i32 0, i32 23
  store i32 0, i32* %84, align 8
  %85 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %86 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %85, i32 0, i32 24
  store i32 0, i32* %86, align 4
  %87 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %88 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %87, i32 0, i32 25
  store i32 0, i32* %88, align 8
  %89 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %90 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %89, i32 0, i32 11
  %91 = load i32, i32* %90, align 8
  %92 = icmp sgt i32 %91, 8
  br i1 %92, label %93, label %97

; <label>:93:                                     ; preds = %78
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_set_defaults, i64 0, i64 3)
  %94 = add i64 %pgocount3, 1
  store i64 %94, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_set_defaults, i64 0, i64 3)
  %95 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %96 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %95, i32 0, i32 25
  store i32 1, i32* %96, align 8
  br label %97

; <label>:97:                                     ; preds = %93, %78
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_set_defaults, i64 0, i64 1)
  %98 = add i64 %pgocount4, 1
  store i64 %98, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_jpeg_set_defaults, i64 0, i64 1)
  %99 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %100 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %99, i32 0, i32 26
  store i32 0, i32* %100, align 4
  %101 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %102 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %101, i32 0, i32 27
  store i32 0, i32* %102, align 8
  %103 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %104 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %103, i32 0, i32 28
  store i32 0, i32* %104, align 4
  %105 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %106 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %105, i32 0, i32 29
  store i32 0, i32* %106, align 8
  %107 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %108 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %107, i32 0, i32 30
  store i32 0, i32* %108, align 4
  %109 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %110 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %109, i32 0, i32 32
  store i8 0, i8* %110, align 4
  %111 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %112 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %111, i32 0, i32 33
  store i16 1, i16* %112, align 2
  %113 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %114 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %113, i32 0, i32 34
  store i16 1, i16* %114, align 8
  %115 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @jpeg_default_colorspace(%struct.jpeg_compress_struct* %115)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @std_huff_tables(%struct.jpeg_compress_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_std_huff_tables, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_std_huff_tables, i64 0, i64 0)
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  %4 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %5 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %5, i32 0, i32 16
  %7 = getelementptr inbounds [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*]* %6, i64 0, i64 0
  call void @add_huff_table(%struct.jpeg_compress_struct* %4, %struct.JHUFF_TBL** %7, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @std_huff_tables.bits_dc_luminance, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @std_huff_tables.val_dc_luminance, i32 0, i32 0))
  %8 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %9 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %10 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %9, i32 0, i32 17
  %11 = getelementptr inbounds [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*]* %10, i64 0, i64 0
  call void @add_huff_table(%struct.jpeg_compress_struct* %8, %struct.JHUFF_TBL** %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @std_huff_tables.bits_ac_luminance, i32 0, i32 0), i8* getelementptr inbounds ([162 x i8], [162 x i8]* @std_huff_tables.val_ac_luminance, i32 0, i32 0))
  %12 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %13 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %14 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %13, i32 0, i32 16
  %15 = getelementptr inbounds [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*]* %14, i64 0, i64 1
  call void @add_huff_table(%struct.jpeg_compress_struct* %12, %struct.JHUFF_TBL** %15, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @std_huff_tables.bits_dc_chrominance, i32 0, i32 0), i8* getelementptr inbounds ([12 x i8], [12 x i8]* @std_huff_tables.val_dc_chrominance, i32 0, i32 0))
  %16 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %17 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %18 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %17, i32 0, i32 17
  %19 = getelementptr inbounds [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*]* %18, i64 0, i64 1
  call void @add_huff_table(%struct.jpeg_compress_struct* %16, %struct.JHUFF_TBL** %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @std_huff_tables.bits_ac_chrominance, i32 0, i32 0), i8* getelementptr inbounds ([162 x i8], [162 x i8]* @std_huff_tables.val_ac_chrominance, i32 0, i32 0))
  ret void
}

; Function Attrs: nounwind uwtable
define void @jpeg_default_colorspace(%struct.jpeg_compress_struct*) #0 {
  %2 = alloca %struct.jpeg_compress_struct*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %2, align 8
  %3 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %4 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %3, i32 0, i32 9
  %5 = load i32, i32* %4, align 4
  switch i32 %5, label %24 [
    i32 1, label %6
    i32 2, label %9
    i32 3, label %12
    i32 4, label %15
    i32 5, label %18
    i32 0, label %21
  ]

; <label>:6:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_default_colorspace, i64 0, i64 1)
  %7 = add i64 %pgocount, 1
  store i64 %7, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_default_colorspace, i64 0, i64 1)
  %8 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @jpeg_set_colorspace(%struct.jpeg_compress_struct* %8, i32 1)
  br label %38

; <label>:9:                                      ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_default_colorspace, i64 0, i64 2)
  %10 = add i64 %pgocount1, 1
  store i64 %10, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_default_colorspace, i64 0, i64 2)
  %11 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @jpeg_set_colorspace(%struct.jpeg_compress_struct* %11, i32 3)
  br label %38

; <label>:12:                                     ; preds = %1
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_default_colorspace, i64 0, i64 3)
  %13 = add i64 %pgocount2, 1
  store i64 %13, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_default_colorspace, i64 0, i64 3)
  %14 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @jpeg_set_colorspace(%struct.jpeg_compress_struct* %14, i32 3)
  br label %38

; <label>:15:                                     ; preds = %1
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_default_colorspace, i64 0, i64 4)
  %16 = add i64 %pgocount3, 1
  store i64 %16, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_default_colorspace, i64 0, i64 4)
  %17 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @jpeg_set_colorspace(%struct.jpeg_compress_struct* %17, i32 4)
  br label %38

; <label>:18:                                     ; preds = %1
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_default_colorspace, i64 0, i64 5)
  %19 = add i64 %pgocount4, 1
  store i64 %19, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_default_colorspace, i64 0, i64 5)
  %20 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @jpeg_set_colorspace(%struct.jpeg_compress_struct* %20, i32 5)
  br label %38

; <label>:21:                                     ; preds = %1
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_default_colorspace, i64 0, i64 6)
  %22 = add i64 %pgocount5, 1
  store i64 %22, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_default_colorspace, i64 0, i64 6)
  %23 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @jpeg_set_colorspace(%struct.jpeg_compress_struct* %23, i32 0)
  br label %38

; <label>:24:                                     ; preds = %1
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_default_colorspace, i64 0, i64 0)
  %25 = add i64 %pgocount6, 1
  store i64 %25, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_default_colorspace, i64 0, i64 0)
  %26 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %27 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %26, i32 0, i32 0
  %28 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %27, align 8
  %29 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %28, i32 0, i32 5
  store i32 7, i32* %29, align 8
  %30 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %31 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %30, i32 0, i32 0
  %32 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %31, align 8
  %33 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %32, i32 0, i32 0
  %34 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %33, align 8
  %35 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %36 = bitcast %struct.jpeg_compress_struct* %35 to %struct.jpeg_common_struct*
  %37 = ptrtoint void (%struct.jpeg_common_struct*)* %34 to i64
  call void @__llvm_profile_instrument_target(i64 %37, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_default_colorspace to i8*), i32 0)
  call void %34(%struct.jpeg_common_struct* %36)
  br label %38

; <label>:38:                                     ; preds = %24, %21, %18, %15, %12, %9, %6
  ret void
}

; Function Attrs: nounwind uwtable
define void @jpeg_set_colorspace(%struct.jpeg_compress_struct*, i32) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.jpeg_component_info*, align 8
  %6 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store i32 %1, i32* %4, align 4
  %7 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %7, i32 0, i32 4
  %9 = load i32, i32* %8, align 4
  %10 = icmp ne i32 %9, 100
  br i1 %10, label %11, label %34

; <label>:11:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_set_colorspace, i64 0, i64 1)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_set_colorspace, i64 0, i64 1)
  %13 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %14 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %13, i32 0, i32 0
  %15 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %14, align 8
  %16 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %15, i32 0, i32 5
  store i32 18, i32* %16, align 8
  %17 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %18 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %17, i32 0, i32 4
  %19 = load i32, i32* %18, align 4
  %20 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %21 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %20, i32 0, i32 0
  %22 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %21, align 8
  %23 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %22, i32 0, i32 6
  %24 = bitcast %union.anon* %23 to [8 x i32]*
  %25 = getelementptr inbounds [8 x i32], [8 x i32]* %24, i64 0, i64 0
  store i32 %19, i32* %25, align 4
  %26 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %27 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %26, i32 0, i32 0
  %28 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %27, align 8
  %29 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %28, i32 0, i32 0
  %30 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %29, align 8
  %31 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %32 = bitcast %struct.jpeg_compress_struct* %31 to %struct.jpeg_common_struct*
  %33 = ptrtoint void (%struct.jpeg_common_struct*)* %30 to i64
  call void @__llvm_profile_instrument_target(i64 %33, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_set_colorspace to i8*), i32 0)
  call void %30(%struct.jpeg_common_struct* %32)
  br label %34

; <label>:34:                                     ; preds = %11, %2
  %35 = load i32, i32* %4, align 4
  %36 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %37 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %36, i32 0, i32 13
  store i32 %35, i32* %37, align 8
  %38 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %39 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %38, i32 0, i32 31
  store i32 0, i32* %39, align 8
  %40 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %41 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %40, i32 0, i32 35
  store i32 0, i32* %41, align 4
  %42 = load i32, i32* %4, align 4
  switch i32 %42, label %391 [
    i32 1, label %43
    i32 2, label %65
    i32 3, label %119
    i32 4, label %173
    i32 5, label %243
    i32 0, label %313
  ]

; <label>:43:                                     ; preds = %34
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_set_colorspace, i64 0, i64 2)
  %44 = add i64 %pgocount1, 1
  store i64 %44, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_set_colorspace, i64 0, i64 2)
  %45 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %46 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %45, i32 0, i32 31
  store i32 1, i32* %46, align 8
  %47 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %48 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %47, i32 0, i32 12
  store i32 1, i32* %48, align 4
  %49 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %50 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %49, i32 0, i32 14
  %51 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %50, align 8
  %52 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %51, i64 0
  store %struct.jpeg_component_info* %52, %struct.jpeg_component_info** %5, align 8
  %53 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %54 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %53, i32 0, i32 0
  store i32 1, i32* %54, align 8
  %55 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %56 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %55, i32 0, i32 2
  store i32 1, i32* %56, align 8
  %57 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %58 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %57, i32 0, i32 3
  store i32 1, i32* %58, align 4
  %59 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %60 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %59, i32 0, i32 4
  store i32 0, i32* %60, align 8
  %61 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %62 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %61, i32 0, i32 5
  store i32 0, i32* %62, align 4
  %63 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %64 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %63, i32 0, i32 6
  store i32 0, i32* %64, align 8
  br label %405

; <label>:65:                                     ; preds = %34
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_set_colorspace, i64 0, i64 3)
  %66 = add i64 %pgocount2, 1
  store i64 %66, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_set_colorspace, i64 0, i64 3)
  %67 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %68 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %67, i32 0, i32 35
  store i32 1, i32* %68, align 4
  %69 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %70 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %69, i32 0, i32 12
  store i32 3, i32* %70, align 4
  %71 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %72 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %71, i32 0, i32 14
  %73 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %72, align 8
  %74 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %73, i64 0
  store %struct.jpeg_component_info* %74, %struct.jpeg_component_info** %5, align 8
  %75 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %76 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %75, i32 0, i32 0
  store i32 82, i32* %76, align 8
  %77 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %78 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %77, i32 0, i32 2
  store i32 1, i32* %78, align 8
  %79 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %80 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %79, i32 0, i32 3
  store i32 1, i32* %80, align 4
  %81 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %82 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %81, i32 0, i32 4
  store i32 0, i32* %82, align 8
  %83 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %84 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %83, i32 0, i32 5
  store i32 0, i32* %84, align 4
  %85 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %86 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %85, i32 0, i32 6
  store i32 0, i32* %86, align 8
  %87 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %88 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %87, i32 0, i32 14
  %89 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %88, align 8
  %90 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %89, i64 1
  store %struct.jpeg_component_info* %90, %struct.jpeg_component_info** %5, align 8
  %91 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %92 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %91, i32 0, i32 0
  store i32 71, i32* %92, align 8
  %93 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %94 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %93, i32 0, i32 2
  store i32 1, i32* %94, align 8
  %95 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %96 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %95, i32 0, i32 3
  store i32 1, i32* %96, align 4
  %97 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %98 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %97, i32 0, i32 4
  store i32 0, i32* %98, align 8
  %99 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %100 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %99, i32 0, i32 5
  store i32 0, i32* %100, align 4
  %101 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %102 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %101, i32 0, i32 6
  store i32 0, i32* %102, align 8
  %103 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %104 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %103, i32 0, i32 14
  %105 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %104, align 8
  %106 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %105, i64 2
  store %struct.jpeg_component_info* %106, %struct.jpeg_component_info** %5, align 8
  %107 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %108 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %107, i32 0, i32 0
  store i32 66, i32* %108, align 8
  %109 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %110 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %109, i32 0, i32 2
  store i32 1, i32* %110, align 8
  %111 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %112 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %111, i32 0, i32 3
  store i32 1, i32* %112, align 4
  %113 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %114 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %113, i32 0, i32 4
  store i32 0, i32* %114, align 8
  %115 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %116 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %115, i32 0, i32 5
  store i32 0, i32* %116, align 4
  %117 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %118 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %117, i32 0, i32 6
  store i32 0, i32* %118, align 8
  br label %405

; <label>:119:                                    ; preds = %34
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_set_colorspace, i64 0, i64 4)
  %120 = add i64 %pgocount3, 1
  store i64 %120, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_set_colorspace, i64 0, i64 4)
  %121 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %122 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %121, i32 0, i32 31
  store i32 1, i32* %122, align 8
  %123 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %124 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %123, i32 0, i32 12
  store i32 3, i32* %124, align 4
  %125 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %126 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %125, i32 0, i32 14
  %127 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %126, align 8
  %128 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %127, i64 0
  store %struct.jpeg_component_info* %128, %struct.jpeg_component_info** %5, align 8
  %129 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %130 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %129, i32 0, i32 0
  store i32 1, i32* %130, align 8
  %131 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %132 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %131, i32 0, i32 2
  store i32 2, i32* %132, align 8
  %133 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %134 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %133, i32 0, i32 3
  store i32 2, i32* %134, align 4
  %135 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %136 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %135, i32 0, i32 4
  store i32 0, i32* %136, align 8
  %137 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %138 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %137, i32 0, i32 5
  store i32 0, i32* %138, align 4
  %139 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %140 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %139, i32 0, i32 6
  store i32 0, i32* %140, align 8
  %141 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %142 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %141, i32 0, i32 14
  %143 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %142, align 8
  %144 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %143, i64 1
  store %struct.jpeg_component_info* %144, %struct.jpeg_component_info** %5, align 8
  %145 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %146 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %145, i32 0, i32 0
  store i32 2, i32* %146, align 8
  %147 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %148 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %147, i32 0, i32 2
  store i32 1, i32* %148, align 8
  %149 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %150 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %149, i32 0, i32 3
  store i32 1, i32* %150, align 4
  %151 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %152 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %151, i32 0, i32 4
  store i32 1, i32* %152, align 8
  %153 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %154 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %153, i32 0, i32 5
  store i32 1, i32* %154, align 4
  %155 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %156 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %155, i32 0, i32 6
  store i32 1, i32* %156, align 8
  %157 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %158 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %157, i32 0, i32 14
  %159 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %158, align 8
  %160 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %159, i64 2
  store %struct.jpeg_component_info* %160, %struct.jpeg_component_info** %5, align 8
  %161 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %162 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %161, i32 0, i32 0
  store i32 3, i32* %162, align 8
  %163 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %164 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %163, i32 0, i32 2
  store i32 1, i32* %164, align 8
  %165 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %166 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %165, i32 0, i32 3
  store i32 1, i32* %166, align 4
  %167 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %168 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %167, i32 0, i32 4
  store i32 1, i32* %168, align 8
  %169 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %170 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %169, i32 0, i32 5
  store i32 1, i32* %170, align 4
  %171 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %172 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %171, i32 0, i32 6
  store i32 1, i32* %172, align 8
  br label %405

; <label>:173:                                    ; preds = %34
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_set_colorspace, i64 0, i64 5)
  %174 = add i64 %pgocount4, 1
  store i64 %174, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_set_colorspace, i64 0, i64 5)
  %175 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %176 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %175, i32 0, i32 35
  store i32 1, i32* %176, align 4
  %177 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %178 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %177, i32 0, i32 12
  store i32 4, i32* %178, align 4
  %179 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %180 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %179, i32 0, i32 14
  %181 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %180, align 8
  %182 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %181, i64 0
  store %struct.jpeg_component_info* %182, %struct.jpeg_component_info** %5, align 8
  %183 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %184 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %183, i32 0, i32 0
  store i32 67, i32* %184, align 8
  %185 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %186 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %185, i32 0, i32 2
  store i32 1, i32* %186, align 8
  %187 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %188 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %187, i32 0, i32 3
  store i32 1, i32* %188, align 4
  %189 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %190 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %189, i32 0, i32 4
  store i32 0, i32* %190, align 8
  %191 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %192 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %191, i32 0, i32 5
  store i32 0, i32* %192, align 4
  %193 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %194 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %193, i32 0, i32 6
  store i32 0, i32* %194, align 8
  %195 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %196 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %195, i32 0, i32 14
  %197 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %196, align 8
  %198 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %197, i64 1
  store %struct.jpeg_component_info* %198, %struct.jpeg_component_info** %5, align 8
  %199 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %200 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %199, i32 0, i32 0
  store i32 77, i32* %200, align 8
  %201 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %202 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %201, i32 0, i32 2
  store i32 1, i32* %202, align 8
  %203 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %204 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %203, i32 0, i32 3
  store i32 1, i32* %204, align 4
  %205 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %206 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %205, i32 0, i32 4
  store i32 0, i32* %206, align 8
  %207 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %208 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %207, i32 0, i32 5
  store i32 0, i32* %208, align 4
  %209 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %210 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %209, i32 0, i32 6
  store i32 0, i32* %210, align 8
  %211 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %212 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %211, i32 0, i32 14
  %213 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %212, align 8
  %214 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %213, i64 2
  store %struct.jpeg_component_info* %214, %struct.jpeg_component_info** %5, align 8
  %215 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %216 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %215, i32 0, i32 0
  store i32 89, i32* %216, align 8
  %217 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %218 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %217, i32 0, i32 2
  store i32 1, i32* %218, align 8
  %219 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %220 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %219, i32 0, i32 3
  store i32 1, i32* %220, align 4
  %221 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %222 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %221, i32 0, i32 4
  store i32 0, i32* %222, align 8
  %223 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %224 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %223, i32 0, i32 5
  store i32 0, i32* %224, align 4
  %225 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %226 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %225, i32 0, i32 6
  store i32 0, i32* %226, align 8
  %227 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %228 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %227, i32 0, i32 14
  %229 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %228, align 8
  %230 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %229, i64 3
  store %struct.jpeg_component_info* %230, %struct.jpeg_component_info** %5, align 8
  %231 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %232 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %231, i32 0, i32 0
  store i32 75, i32* %232, align 8
  %233 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %234 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %233, i32 0, i32 2
  store i32 1, i32* %234, align 8
  %235 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %236 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %235, i32 0, i32 3
  store i32 1, i32* %236, align 4
  %237 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %238 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %237, i32 0, i32 4
  store i32 0, i32* %238, align 8
  %239 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %240 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %239, i32 0, i32 5
  store i32 0, i32* %240, align 4
  %241 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %242 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %241, i32 0, i32 6
  store i32 0, i32* %242, align 8
  br label %405

; <label>:243:                                    ; preds = %34
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_set_colorspace, i64 0, i64 6)
  %244 = add i64 %pgocount5, 1
  store i64 %244, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_set_colorspace, i64 0, i64 6)
  %245 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %246 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %245, i32 0, i32 35
  store i32 1, i32* %246, align 4
  %247 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %248 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %247, i32 0, i32 12
  store i32 4, i32* %248, align 4
  %249 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %250 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %249, i32 0, i32 14
  %251 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %250, align 8
  %252 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %251, i64 0
  store %struct.jpeg_component_info* %252, %struct.jpeg_component_info** %5, align 8
  %253 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %254 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %253, i32 0, i32 0
  store i32 1, i32* %254, align 8
  %255 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %256 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %255, i32 0, i32 2
  store i32 2, i32* %256, align 8
  %257 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %258 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %257, i32 0, i32 3
  store i32 2, i32* %258, align 4
  %259 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %260 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %259, i32 0, i32 4
  store i32 0, i32* %260, align 8
  %261 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %262 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %261, i32 0, i32 5
  store i32 0, i32* %262, align 4
  %263 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %264 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %263, i32 0, i32 6
  store i32 0, i32* %264, align 8
  %265 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %266 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %265, i32 0, i32 14
  %267 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %266, align 8
  %268 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %267, i64 1
  store %struct.jpeg_component_info* %268, %struct.jpeg_component_info** %5, align 8
  %269 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %270 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %269, i32 0, i32 0
  store i32 2, i32* %270, align 8
  %271 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %272 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %271, i32 0, i32 2
  store i32 1, i32* %272, align 8
  %273 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %274 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %273, i32 0, i32 3
  store i32 1, i32* %274, align 4
  %275 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %276 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %275, i32 0, i32 4
  store i32 1, i32* %276, align 8
  %277 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %278 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %277, i32 0, i32 5
  store i32 1, i32* %278, align 4
  %279 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %280 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %279, i32 0, i32 6
  store i32 1, i32* %280, align 8
  %281 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %282 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %281, i32 0, i32 14
  %283 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %282, align 8
  %284 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %283, i64 2
  store %struct.jpeg_component_info* %284, %struct.jpeg_component_info** %5, align 8
  %285 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %286 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %285, i32 0, i32 0
  store i32 3, i32* %286, align 8
  %287 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %288 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %287, i32 0, i32 2
  store i32 1, i32* %288, align 8
  %289 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %290 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %289, i32 0, i32 3
  store i32 1, i32* %290, align 4
  %291 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %292 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %291, i32 0, i32 4
  store i32 1, i32* %292, align 8
  %293 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %294 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %293, i32 0, i32 5
  store i32 1, i32* %294, align 4
  %295 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %296 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %295, i32 0, i32 6
  store i32 1, i32* %296, align 8
  %297 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %298 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %297, i32 0, i32 14
  %299 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %298, align 8
  %300 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %299, i64 3
  store %struct.jpeg_component_info* %300, %struct.jpeg_component_info** %5, align 8
  %301 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %302 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %301, i32 0, i32 0
  store i32 4, i32* %302, align 8
  %303 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %304 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %303, i32 0, i32 2
  store i32 2, i32* %304, align 8
  %305 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %306 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %305, i32 0, i32 3
  store i32 2, i32* %306, align 4
  %307 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %308 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %307, i32 0, i32 4
  store i32 0, i32* %308, align 8
  %309 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %310 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %309, i32 0, i32 5
  store i32 0, i32* %310, align 4
  %311 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %312 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %311, i32 0, i32 6
  store i32 0, i32* %312, align 8
  br label %405

; <label>:313:                                    ; preds = %34
  %314 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %315 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %314, i32 0, i32 8
  %316 = load i32, i32* %315, align 8
  %317 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %318 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %317, i32 0, i32 12
  store i32 %316, i32* %318, align 4
  %319 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %320 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %319, i32 0, i32 12
  %321 = load i32, i32* %320, align 4
  %322 = icmp slt i32 %321, 1
  br i1 %322, label %329, label %323

; <label>:323:                                    ; preds = %313
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_set_colorspace, i64 0, i64 10)
  %324 = add i64 %pgocount6, 1
  store i64 %324, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_set_colorspace, i64 0, i64 10)
  %325 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %326 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %325, i32 0, i32 12
  %327 = load i32, i32* %326, align 4
  %328 = icmp sgt i32 %327, 10
  br i1 %328, label %329, label %358

; <label>:329:                                    ; preds = %323, %313
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_set_colorspace, i64 0, i64 9)
  %330 = add i64 %pgocount7, 1
  store i64 %330, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_set_colorspace, i64 0, i64 9)
  %331 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %332 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %331, i32 0, i32 0
  %333 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %332, align 8
  %334 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %333, i32 0, i32 5
  store i32 24, i32* %334, align 8
  %335 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %336 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %335, i32 0, i32 12
  %337 = load i32, i32* %336, align 4
  %338 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %339 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %338, i32 0, i32 0
  %340 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %339, align 8
  %341 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %340, i32 0, i32 6
  %342 = bitcast %union.anon* %341 to [8 x i32]*
  %343 = getelementptr inbounds [8 x i32], [8 x i32]* %342, i64 0, i64 0
  store i32 %337, i32* %343, align 4
  %344 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %345 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %344, i32 0, i32 0
  %346 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %345, align 8
  %347 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %346, i32 0, i32 6
  %348 = bitcast %union.anon* %347 to [8 x i32]*
  %349 = getelementptr inbounds [8 x i32], [8 x i32]* %348, i64 0, i64 1
  store i32 10, i32* %349, align 4
  %350 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %351 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %350, i32 0, i32 0
  %352 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %351, align 8
  %353 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %352, i32 0, i32 0
  %354 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %353, align 8
  %355 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %356 = bitcast %struct.jpeg_compress_struct* %355 to %struct.jpeg_common_struct*
  %357 = ptrtoint void (%struct.jpeg_common_struct*)* %354 to i64
  call void @__llvm_profile_instrument_target(i64 %357, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_set_colorspace to i8*), i32 1)
  call void %354(%struct.jpeg_common_struct* %356)
  br label %358

; <label>:358:                                    ; preds = %329, %323
  store i32 0, i32* %6, align 4
  br label %359

; <label>:359:                                    ; preds = %385, %358
  %360 = load i32, i32* %6, align 4
  %361 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %362 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %361, i32 0, i32 12
  %363 = load i32, i32* %362, align 4
  %364 = icmp slt i32 %360, %363
  br i1 %364, label %365, label %389

; <label>:365:                                    ; preds = %359
  %366 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %367 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %366, i32 0, i32 14
  %368 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %367, align 8
  %369 = load i32, i32* %6, align 4
  %370 = sext i32 %369 to i64
  %371 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %368, i64 %370
  store %struct.jpeg_component_info* %371, %struct.jpeg_component_info** %5, align 8
  %372 = load i32, i32* %6, align 4
  %373 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %374 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %373, i32 0, i32 0
  store i32 %372, i32* %374, align 8
  %375 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %376 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %375, i32 0, i32 2
  store i32 1, i32* %376, align 8
  %377 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %378 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %377, i32 0, i32 3
  store i32 1, i32* %378, align 4
  %379 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %380 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %379, i32 0, i32 4
  store i32 0, i32* %380, align 8
  %381 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %382 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %381, i32 0, i32 5
  store i32 0, i32* %382, align 4
  %383 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %5, align 8
  %384 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %383, i32 0, i32 6
  store i32 0, i32* %384, align 8
  br label %385

; <label>:385:                                    ; preds = %365
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_set_colorspace, i64 0, i64 0)
  %386 = add i64 %pgocount8, 1
  store i64 %386, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_set_colorspace, i64 0, i64 0)
  %387 = load i32, i32* %6, align 4
  %388 = add nsw i32 %387, 1
  store i32 %388, i32* %6, align 4
  br label %359

; <label>:389:                                    ; preds = %359
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_set_colorspace, i64 0, i64 7)
  %390 = add i64 %pgocount9, 1
  store i64 %390, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_set_colorspace, i64 0, i64 7)
  br label %405

; <label>:391:                                    ; preds = %34
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_set_colorspace, i64 0, i64 8)
  %392 = add i64 %pgocount10, 1
  store i64 %392, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_jpeg_set_colorspace, i64 0, i64 8)
  %393 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %394 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %393, i32 0, i32 0
  %395 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %394, align 8
  %396 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %395, i32 0, i32 5
  store i32 8, i32* %396, align 8
  %397 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %398 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %397, i32 0, i32 0
  %399 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %398, align 8
  %400 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %399, i32 0, i32 0
  %401 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %400, align 8
  %402 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %403 = bitcast %struct.jpeg_compress_struct* %402 to %struct.jpeg_common_struct*
  %404 = ptrtoint void (%struct.jpeg_common_struct*)* %401 to i64
  call void @__llvm_profile_instrument_target(i64 %404, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_set_colorspace to i8*), i32 2)
  call void %401(%struct.jpeg_common_struct* %403)
  br label %405

; <label>:405:                                    ; preds = %391, %389, %243, %173, %119, %65, %43
  ret void
}

; Function Attrs: nounwind uwtable
define void @jpeg_simple_progression(%struct.jpeg_compress_struct*) #0 {
  %2 = alloca %struct.jpeg_compress_struct*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca %struct.jpeg_scan_info*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %2, align 8
  %6 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %7 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %6, i32 0, i32 12
  %8 = load i32, i32* %7, align 4
  store i32 %8, i32* %3, align 4
  %9 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %10 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %9, i32 0, i32 4
  %11 = load i32, i32* %10, align 4
  %12 = icmp ne i32 %11, 100
  br i1 %12, label %13, label %36

; <label>:13:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_simple_progression, i64 0, i64 0)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_simple_progression, i64 0, i64 0)
  %15 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %16 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %15, i32 0, i32 0
  %17 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %16, align 8
  %18 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %17, i32 0, i32 5
  store i32 18, i32* %18, align 8
  %19 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %20 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %19, i32 0, i32 4
  %21 = load i32, i32* %20, align 4
  %22 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %23 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %22, i32 0, i32 0
  %24 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %23, align 8
  %25 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %24, i32 0, i32 6
  %26 = bitcast %union.anon* %25 to [8 x i32]*
  %27 = getelementptr inbounds [8 x i32], [8 x i32]* %26, i64 0, i64 0
  store i32 %21, i32* %27, align 4
  %28 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %29 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %28, i32 0, i32 0
  %30 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %29, align 8
  %31 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %30, i32 0, i32 0
  %32 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %31, align 8
  %33 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %34 = bitcast %struct.jpeg_compress_struct* %33 to %struct.jpeg_common_struct*
  %35 = ptrtoint void (%struct.jpeg_common_struct*)* %32 to i64
  call void @__llvm_profile_instrument_target(i64 %35, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_simple_progression to i8*), i32 0)
  call void %32(%struct.jpeg_common_struct* %34)
  br label %36

; <label>:36:                                     ; preds = %13, %1
  %37 = load i32, i32* %3, align 4
  %38 = icmp eq i32 %37, 3
  br i1 %38, label %39, label %47

; <label>:39:                                     ; preds = %36
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_simple_progression, i64 0, i64 1)
  %40 = add i64 %pgocount1, 1
  store i64 %40, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_simple_progression, i64 0, i64 1)
  %41 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %42 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %41, i32 0, i32 13
  %43 = load i32, i32* %42, align 8
  %44 = icmp eq i32 %43, 3
  br i1 %44, label %45, label %47

; <label>:45:                                     ; preds = %39
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_simple_progression, i64 0, i64 5)
  %46 = add i64 %pgocount2, 1
  store i64 %46, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_simple_progression, i64 0, i64 5)
  store i32 10, i32* %4, align 4
  br label %60

; <label>:47:                                     ; preds = %39, %36
  %48 = load i32, i32* %3, align 4
  %49 = icmp sgt i32 %48, 4
  br i1 %49, label %50, label %54

; <label>:50:                                     ; preds = %47
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_simple_progression, i64 0, i64 3)
  %51 = add i64 %pgocount3, 1
  store i64 %51, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_simple_progression, i64 0, i64 3)
  %52 = load i32, i32* %3, align 4
  %53 = mul nsw i32 6, %52
  store i32 %53, i32* %4, align 4
  br label %59

; <label>:54:                                     ; preds = %47
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_simple_progression, i64 0, i64 4)
  %55 = add i64 %pgocount4, 1
  store i64 %55, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_simple_progression, i64 0, i64 4)
  %56 = load i32, i32* %3, align 4
  %57 = mul nsw i32 4, %56
  %58 = add nsw i32 2, %57
  store i32 %58, i32* %4, align 4
  br label %59

; <label>:59:                                     ; preds = %54, %50
  br label %60

; <label>:60:                                     ; preds = %59, %45
  %61 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %62 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %61, i32 0, i32 1
  %63 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %62, align 8
  %64 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %63, i32 0, i32 0
  %65 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %64, align 8
  %66 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %67 = bitcast %struct.jpeg_compress_struct* %66 to %struct.jpeg_common_struct*
  %68 = load i32, i32* %4, align 4
  %69 = sext i32 %68 to i64
  %70 = mul i64 %69, 36
  %71 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %65 to i64
  call void @__llvm_profile_instrument_target(i64 %71, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jpeg_simple_progression to i8*), i32 1)
  %72 = call i8* %65(%struct.jpeg_common_struct* %67, i32 0, i64 %70)
  %73 = bitcast i8* %72 to %struct.jpeg_scan_info*
  store %struct.jpeg_scan_info* %73, %struct.jpeg_scan_info** %5, align 8
  %74 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %5, align 8
  %75 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %76 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %75, i32 0, i32 22
  store %struct.jpeg_scan_info* %74, %struct.jpeg_scan_info** %76, align 8
  %77 = load i32, i32* %4, align 4
  %78 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %79 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %78, i32 0, i32 21
  store i32 %77, i32* %79, align 8
  %80 = load i32, i32* %3, align 4
  %81 = icmp eq i32 %80, 3
  br i1 %81, label %82, label %112

; <label>:82:                                     ; preds = %60
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_simple_progression, i64 0, i64 2)
  %83 = add i64 %pgocount5, 1
  store i64 %83, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_simple_progression, i64 0, i64 2)
  %84 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %85 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %84, i32 0, i32 13
  %86 = load i32, i32* %85, align 8
  %87 = icmp eq i32 %86, 3
  br i1 %87, label %88, label %112

; <label>:88:                                     ; preds = %82
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_simple_progression, i64 0, i64 6)
  %89 = add i64 %pgocount6, 1
  store i64 %89, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_jpeg_simple_progression, i64 0, i64 6)
  %90 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %5, align 8
  %91 = load i32, i32* %3, align 4
  %92 = call %struct.jpeg_scan_info* @fill_dc_scans(%struct.jpeg_scan_info* %90, i32 %91, i32 0, i32 1)
  store %struct.jpeg_scan_info* %92, %struct.jpeg_scan_info** %5, align 8
  %93 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %5, align 8
  %94 = call %struct.jpeg_scan_info* @fill_a_scan(%struct.jpeg_scan_info* %93, i32 0, i32 1, i32 5, i32 0, i32 2)
  store %struct.jpeg_scan_info* %94, %struct.jpeg_scan_info** %5, align 8
  %95 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %5, align 8
  %96 = call %struct.jpeg_scan_info* @fill_a_scan(%struct.jpeg_scan_info* %95, i32 2, i32 1, i32 63, i32 0, i32 1)
  store %struct.jpeg_scan_info* %96, %struct.jpeg_scan_info** %5, align 8
  %97 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %5, align 8
  %98 = call %struct.jpeg_scan_info* @fill_a_scan(%struct.jpeg_scan_info* %97, i32 1, i32 1, i32 63, i32 0, i32 1)
  store %struct.jpeg_scan_info* %98, %struct.jpeg_scan_info** %5, align 8
  %99 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %5, align 8
  %100 = call %struct.jpeg_scan_info* @fill_a_scan(%struct.jpeg_scan_info* %99, i32 0, i32 6, i32 63, i32 0, i32 2)
  store %struct.jpeg_scan_info* %100, %struct.jpeg_scan_info** %5, align 8
  %101 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %5, align 8
  %102 = call %struct.jpeg_scan_info* @fill_a_scan(%struct.jpeg_scan_info* %101, i32 0, i32 1, i32 63, i32 2, i32 1)
  store %struct.jpeg_scan_info* %102, %struct.jpeg_scan_info** %5, align 8
  %103 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %5, align 8
  %104 = load i32, i32* %3, align 4
  %105 = call %struct.jpeg_scan_info* @fill_dc_scans(%struct.jpeg_scan_info* %103, i32 %104, i32 1, i32 0)
  store %struct.jpeg_scan_info* %105, %struct.jpeg_scan_info** %5, align 8
  %106 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %5, align 8
  %107 = call %struct.jpeg_scan_info* @fill_a_scan(%struct.jpeg_scan_info* %106, i32 2, i32 1, i32 63, i32 1, i32 0)
  store %struct.jpeg_scan_info* %107, %struct.jpeg_scan_info** %5, align 8
  %108 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %5, align 8
  %109 = call %struct.jpeg_scan_info* @fill_a_scan(%struct.jpeg_scan_info* %108, i32 1, i32 1, i32 63, i32 1, i32 0)
  store %struct.jpeg_scan_info* %109, %struct.jpeg_scan_info** %5, align 8
  %110 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %5, align 8
  %111 = call %struct.jpeg_scan_info* @fill_a_scan(%struct.jpeg_scan_info* %110, i32 0, i32 1, i32 63, i32 1, i32 0)
  store %struct.jpeg_scan_info* %111, %struct.jpeg_scan_info** %5, align 8
  br label %131

; <label>:112:                                    ; preds = %82, %60
  %113 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %5, align 8
  %114 = load i32, i32* %3, align 4
  %115 = call %struct.jpeg_scan_info* @fill_dc_scans(%struct.jpeg_scan_info* %113, i32 %114, i32 0, i32 1)
  store %struct.jpeg_scan_info* %115, %struct.jpeg_scan_info** %5, align 8
  %116 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %5, align 8
  %117 = load i32, i32* %3, align 4
  %118 = call %struct.jpeg_scan_info* @fill_scans(%struct.jpeg_scan_info* %116, i32 %117, i32 1, i32 5, i32 0, i32 2)
  store %struct.jpeg_scan_info* %118, %struct.jpeg_scan_info** %5, align 8
  %119 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %5, align 8
  %120 = load i32, i32* %3, align 4
  %121 = call %struct.jpeg_scan_info* @fill_scans(%struct.jpeg_scan_info* %119, i32 %120, i32 6, i32 63, i32 0, i32 2)
  store %struct.jpeg_scan_info* %121, %struct.jpeg_scan_info** %5, align 8
  %122 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %5, align 8
  %123 = load i32, i32* %3, align 4
  %124 = call %struct.jpeg_scan_info* @fill_scans(%struct.jpeg_scan_info* %122, i32 %123, i32 1, i32 63, i32 2, i32 1)
  store %struct.jpeg_scan_info* %124, %struct.jpeg_scan_info** %5, align 8
  %125 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %5, align 8
  %126 = load i32, i32* %3, align 4
  %127 = call %struct.jpeg_scan_info* @fill_dc_scans(%struct.jpeg_scan_info* %125, i32 %126, i32 1, i32 0)
  store %struct.jpeg_scan_info* %127, %struct.jpeg_scan_info** %5, align 8
  %128 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %5, align 8
  %129 = load i32, i32* %3, align 4
  %130 = call %struct.jpeg_scan_info* @fill_scans(%struct.jpeg_scan_info* %128, i32 %129, i32 1, i32 63, i32 1, i32 0)
  store %struct.jpeg_scan_info* %130, %struct.jpeg_scan_info** %5, align 8
  br label %131

; <label>:131:                                    ; preds = %112, %88
  ret void
}

; Function Attrs: nounwind uwtable
define internal %struct.jpeg_scan_info* @fill_dc_scans(%struct.jpeg_scan_info*, i32, i32, i32) #0 {
  %5 = alloca %struct.jpeg_scan_info*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store %struct.jpeg_scan_info* %0, %struct.jpeg_scan_info** %5, align 8
  store i32 %1, i32* %6, align 4
  store i32 %2, i32* %7, align 4
  store i32 %3, i32* %8, align 4
  %10 = load i32, i32* %6, align 4
  %11 = icmp sle i32 %10, 4
  br i1 %11, label %12, label %45

; <label>:12:                                     ; preds = %4
  %13 = load i32, i32* %6, align 4
  %14 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %5, align 8
  %15 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %14, i32 0, i32 0
  store i32 %13, i32* %15, align 4
  store i32 0, i32* %9, align 4
  br label %16

; <label>:16:                                     ; preds = %27, %12
  %17 = load i32, i32* %9, align 4
  %18 = load i32, i32* %6, align 4
  %19 = icmp slt i32 %17, %18
  br i1 %19, label %20, label %31

; <label>:20:                                     ; preds = %16
  %21 = load i32, i32* %9, align 4
  %22 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %5, align 8
  %23 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %22, i32 0, i32 1
  %24 = load i32, i32* %9, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [4 x i32], [4 x i32]* %23, i64 0, i64 %25
  store i32 %21, i32* %26, align 4
  br label %27

; <label>:27:                                     ; preds = %20
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_fill_dc_scans, i64 0, i64 0)
  %28 = add i64 %pgocount, 1
  store i64 %28, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_fill_dc_scans, i64 0, i64 0)
  %29 = load i32, i32* %9, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, i32* %9, align 4
  br label %16

; <label>:31:                                     ; preds = %16
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_fill_dc_scans, i64 0, i64 1)
  %32 = add i64 %pgocount1, 1
  store i64 %32, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_fill_dc_scans, i64 0, i64 1)
  %33 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %5, align 8
  %34 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %33, i32 0, i32 3
  store i32 0, i32* %34, align 4
  %35 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %5, align 8
  %36 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %35, i32 0, i32 2
  store i32 0, i32* %36, align 4
  %37 = load i32, i32* %7, align 4
  %38 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %5, align 8
  %39 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %38, i32 0, i32 4
  store i32 %37, i32* %39, align 4
  %40 = load i32, i32* %8, align 4
  %41 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %5, align 8
  %42 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %41, i32 0, i32 5
  store i32 %40, i32* %42, align 4
  %43 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %5, align 8
  %44 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %43, i32 1
  store %struct.jpeg_scan_info* %44, %struct.jpeg_scan_info** %5, align 8
  br label %52

; <label>:45:                                     ; preds = %4
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_fill_dc_scans, i64 0, i64 2)
  %46 = add i64 %pgocount2, 1
  store i64 %46, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_fill_dc_scans, i64 0, i64 2)
  %47 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %5, align 8
  %48 = load i32, i32* %6, align 4
  %49 = load i32, i32* %7, align 4
  %50 = load i32, i32* %8, align 4
  %51 = call %struct.jpeg_scan_info* @fill_scans(%struct.jpeg_scan_info* %47, i32 %48, i32 0, i32 0, i32 %49, i32 %50)
  store %struct.jpeg_scan_info* %51, %struct.jpeg_scan_info** %5, align 8
  br label %52

; <label>:52:                                     ; preds = %45, %31
  %53 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %5, align 8
  ret %struct.jpeg_scan_info* %53
}

; Function Attrs: nounwind uwtable
define internal %struct.jpeg_scan_info* @fill_a_scan(%struct.jpeg_scan_info*, i32, i32, i32, i32, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_fill_a_scan, i64 0, i64 0)
  %7 = add i64 %pgocount, 1
  store i64 %7, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_fill_a_scan, i64 0, i64 0)
  %8 = alloca %struct.jpeg_scan_info*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store %struct.jpeg_scan_info* %0, %struct.jpeg_scan_info** %8, align 8
  store i32 %1, i32* %9, align 4
  store i32 %2, i32* %10, align 4
  store i32 %3, i32* %11, align 4
  store i32 %4, i32* %12, align 4
  store i32 %5, i32* %13, align 4
  %14 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %8, align 8
  %15 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %14, i32 0, i32 0
  store i32 1, i32* %15, align 4
  %16 = load i32, i32* %9, align 4
  %17 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %8, align 8
  %18 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %17, i32 0, i32 1
  %19 = getelementptr inbounds [4 x i32], [4 x i32]* %18, i64 0, i64 0
  store i32 %16, i32* %19, align 4
  %20 = load i32, i32* %10, align 4
  %21 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %8, align 8
  %22 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %21, i32 0, i32 2
  store i32 %20, i32* %22, align 4
  %23 = load i32, i32* %11, align 4
  %24 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %8, align 8
  %25 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %24, i32 0, i32 3
  store i32 %23, i32* %25, align 4
  %26 = load i32, i32* %12, align 4
  %27 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %8, align 8
  %28 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %27, i32 0, i32 4
  store i32 %26, i32* %28, align 4
  %29 = load i32, i32* %13, align 4
  %30 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %8, align 8
  %31 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %30, i32 0, i32 5
  store i32 %29, i32* %31, align 4
  %32 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %8, align 8
  %33 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %32, i32 1
  store %struct.jpeg_scan_info* %33, %struct.jpeg_scan_info** %8, align 8
  %34 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %8, align 8
  ret %struct.jpeg_scan_info* %34
}

; Function Attrs: nounwind uwtable
define internal %struct.jpeg_scan_info* @fill_scans(%struct.jpeg_scan_info*, i32, i32, i32, i32, i32) #0 {
  %7 = alloca %struct.jpeg_scan_info*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store %struct.jpeg_scan_info* %0, %struct.jpeg_scan_info** %7, align 8
  store i32 %1, i32* %8, align 4
  store i32 %2, i32* %9, align 4
  store i32 %3, i32* %10, align 4
  store i32 %4, i32* %11, align 4
  store i32 %5, i32* %12, align 4
  store i32 0, i32* %13, align 4
  br label %14

; <label>:14:                                     ; preds = %39, %6
  %15 = load i32, i32* %13, align 4
  %16 = load i32, i32* %8, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %43

; <label>:18:                                     ; preds = %14
  %19 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %7, align 8
  %20 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %19, i32 0, i32 0
  store i32 1, i32* %20, align 4
  %21 = load i32, i32* %13, align 4
  %22 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %7, align 8
  %23 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %22, i32 0, i32 1
  %24 = getelementptr inbounds [4 x i32], [4 x i32]* %23, i64 0, i64 0
  store i32 %21, i32* %24, align 4
  %25 = load i32, i32* %9, align 4
  %26 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %7, align 8
  %27 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %26, i32 0, i32 2
  store i32 %25, i32* %27, align 4
  %28 = load i32, i32* %10, align 4
  %29 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %7, align 8
  %30 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %29, i32 0, i32 3
  store i32 %28, i32* %30, align 4
  %31 = load i32, i32* %11, align 4
  %32 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %7, align 8
  %33 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %32, i32 0, i32 4
  store i32 %31, i32* %33, align 4
  %34 = load i32, i32* %12, align 4
  %35 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %7, align 8
  %36 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %35, i32 0, i32 5
  store i32 %34, i32* %36, align 4
  %37 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %7, align 8
  %38 = getelementptr inbounds %struct.jpeg_scan_info, %struct.jpeg_scan_info* %37, i32 1
  store %struct.jpeg_scan_info* %38, %struct.jpeg_scan_info** %7, align 8
  br label %39

; <label>:39:                                     ; preds = %18
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_fill_scans, i64 0, i64 0)
  %40 = add i64 %pgocount, 1
  store i64 %40, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_fill_scans, i64 0, i64 0)
  %41 = load i32, i32* %13, align 4
  %42 = add nsw i32 %41, 1
  store i32 %42, i32* %13, align 4
  br label %14

; <label>:43:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_fill_scans, i64 0, i64 1)
  %44 = add i64 %pgocount1, 1
  store i64 %44, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_fill_scans, i64 0, i64 1)
  %45 = load %struct.jpeg_scan_info*, %struct.jpeg_scan_info** %7, align 8
  ret %struct.jpeg_scan_info* %45
}

; Function Attrs: nounwind uwtable
define internal void @add_huff_table(%struct.jpeg_compress_struct*, %struct.JHUFF_TBL**, i8*, i8*) #0 {
  %5 = alloca %struct.jpeg_compress_struct*, align 8
  %6 = alloca %struct.JHUFF_TBL**, align 8
  %7 = alloca i8*, align 8
  %8 = alloca i8*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %5, align 8
  store %struct.JHUFF_TBL** %1, %struct.JHUFF_TBL*** %6, align 8
  store i8* %2, i8** %7, align 8
  store i8* %3, i8** %8, align 8
  %9 = load %struct.JHUFF_TBL**, %struct.JHUFF_TBL*** %6, align 8
  %10 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %9, align 8
  %11 = icmp eq %struct.JHUFF_TBL* %10, null
  br i1 %11, label %12, label %18

; <label>:12:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_add_huff_table, i64 0, i64 1)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_add_huff_table, i64 0, i64 1)
  %14 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %15 = bitcast %struct.jpeg_compress_struct* %14 to %struct.jpeg_common_struct*
  %16 = call %struct.JHUFF_TBL* @jpeg_alloc_huff_table(%struct.jpeg_common_struct* %15)
  %17 = load %struct.JHUFF_TBL**, %struct.JHUFF_TBL*** %6, align 8
  store %struct.JHUFF_TBL* %16, %struct.JHUFF_TBL** %17, align 8
  br label %18

; <label>:18:                                     ; preds = %12, %4
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_add_huff_table, i64 0, i64 0)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_add_huff_table, i64 0, i64 0)
  %20 = load %struct.JHUFF_TBL**, %struct.JHUFF_TBL*** %6, align 8
  %21 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %20, align 8
  %22 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %21, i32 0, i32 0
  %23 = getelementptr inbounds [17 x i8], [17 x i8]* %22, i32 0, i32 0
  %24 = load i8*, i8** %7, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %23, i8* %24, i64 17, i32 1, i1 false)
  %25 = load %struct.JHUFF_TBL**, %struct.JHUFF_TBL*** %6, align 8
  %26 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %25, align 8
  %27 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %26, i32 0, i32 1
  %28 = getelementptr inbounds [256 x i8], [256 x i8]* %27, i32 0, i32 0
  %29 = load i8*, i8** %8, align 8
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %28, i8* %29, i64 256, i32 1, i1 false)
  %30 = load %struct.JHUFF_TBL**, %struct.JHUFF_TBL*** %6, align 8
  %31 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %30, align 8
  %32 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %31, i32 0, i32 2
  store i32 0, i32* %32, align 4
  ret void
}

declare %struct.JHUFF_TBL* @jpeg_alloc_huff_table(%struct.jpeg_common_struct*) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #3

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
