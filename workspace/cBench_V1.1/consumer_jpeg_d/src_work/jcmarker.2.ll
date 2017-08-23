; ModuleID = 'tmp1.ll'
source_filename = "jcmarker.c"
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

$__llvm_profile_raw_version = comdat any

@jpeg_natural_order = external constant [0 x i32], align 4
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_jinit_marker_writer = private constant [19 x i8] c"jinit_marker_writer"
@__profn_tmp1.ll_write_any_marker = private constant [24 x i8] c"tmp1.ll:write_any_marker"
@__profn_tmp1.ll_write_file_header = private constant [25 x i8] c"tmp1.ll:write_file_header"
@__profn_tmp1.ll_write_frame_header = private constant [26 x i8] c"tmp1.ll:write_frame_header"
@__profn_tmp1.ll_write_scan_header = private constant [25 x i8] c"tmp1.ll:write_scan_header"
@__profn_tmp1.ll_write_file_trailer = private constant [26 x i8] c"tmp1.ll:write_file_trailer"
@__profn_tmp1.ll_write_tables_only = private constant [25 x i8] c"tmp1.ll:write_tables_only"
@__profn_tmp1.ll_emit_marker = private constant [19 x i8] c"tmp1.ll:emit_marker"
@__profn_tmp1.ll_emit_2bytes = private constant [19 x i8] c"tmp1.ll:emit_2bytes"
@__profn_tmp1.ll_emit_byte = private constant [17 x i8] c"tmp1.ll:emit_byte"
@__profn_tmp1.ll_emit_jfif_app0 = private constant [22 x i8] c"tmp1.ll:emit_jfif_app0"
@__profn_tmp1.ll_emit_adobe_app14 = private constant [24 x i8] c"tmp1.ll:emit_adobe_app14"
@__profn_tmp1.ll_emit_dqt = private constant [16 x i8] c"tmp1.ll:emit_dqt"
@__profn_tmp1.ll_emit_sof = private constant [16 x i8] c"tmp1.ll:emit_sof"
@__profn_tmp1.ll_emit_dac = private constant [16 x i8] c"tmp1.ll:emit_dac"
@__profn_tmp1.ll_emit_dht = private constant [16 x i8] c"tmp1.ll:emit_dht"
@__profn_tmp1.ll_emit_dri = private constant [16 x i8] c"tmp1.ll:emit_dri"
@__profn_tmp1.ll_emit_sos = private constant [16 x i8] c"tmp1.ll:emit_sos"
@__profc_jinit_marker_writer = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_jinit_marker_writer = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_jinit_marker_writer = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 211568801967245165, i64 281487861612543, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jinit_marker_writer, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*)* @jinit_marker_writer to i8*), i8* bitcast ([1 x i64]* @__profvp_jinit_marker_writer to i8*), i32 1, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_write_any_marker = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_write_any_marker = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1017466747376661907, i64 40425548223, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_write_any_marker, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*, i32, i8*, i32)* @write_any_marker to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_write_file_header = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_write_file_header = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5010060570846258230, i64 36496524737, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_write_file_header, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*)* @write_file_header to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_write_frame_header = private global [13 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_write_frame_header = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_write_frame_header = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4728172271275213515, i64 281656646784989, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_write_frame_header, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*)* @write_frame_header to i8*), i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_write_frame_header to i8*), i32 13, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_write_scan_header = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_write_scan_header = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1638857562519890238, i64 111221222549, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_scan_header, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*)* @write_scan_header to i8*), i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_write_file_trailer = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_write_file_trailer = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8324208876558097509, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_write_file_trailer, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*)* @write_file_trailer to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_write_tables_only = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_write_tables_only = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7992740895367819450, i64 104603788919, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_tables_only, i32 0, i32 0), i8* bitcast (void (%struct.jpeg_compress_struct*)* @write_tables_only to i8*), i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_emit_marker = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_emit_marker = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8785628579355180264, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_emit_marker, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_emit_2bytes = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_emit_2bytes = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5123911584249282908, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_emit_2bytes, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_emit_byte = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_emit_byte = private global [2 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_emit_byte = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5747154531493068153, i64 562988352351897, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_emit_byte, i32 0, i32 0), i8* null, i8* bitcast ([2 x i64]* @__profvp_tmp1.ll_emit_byte to i8*), i32 3, [1 x i16] [i16 2] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_emit_jfif_app0 = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_emit_jfif_app0 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8951909675976281713, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_emit_jfif_app0, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_emit_adobe_app14 = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_emit_adobe_app14 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8661271867383492605, i64 34779197915, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_emit_adobe_app14, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_emit_dqt = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_emit_dqt = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_emit_dqt = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6569585788791024541, i64 72339173649809863, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_dqt, i32 0, i32 0), i8* null, i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_emit_dqt to i8*), i32 8, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_emit_sof = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_emit_sof = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_emit_sof = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7551441247684225035, i64 281527735240626, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_emit_sof, i32 0, i32 0), i8* null, i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_emit_sof to i8*), i32 4, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_emit_dac = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_emit_dac = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2535958588655038360, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_emit_dac, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_emit_dht = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profvp_tmp1.ll_emit_dht = private global [1 x i64] zeroinitializer, section "__llvm_prf_vals", align 8
@__profd_tmp1.ll_emit_dht = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5036434830213155753, i64 281592043880718, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_dht, i32 0, i32 0), i8* null, i8* bitcast ([1 x i64]* @__profvp_tmp1.ll_emit_dht to i8*), i32 7, [1 x i16] [i16 1] }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_emit_dri = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_emit_dri = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2562504411600847428, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_emit_dri, i32 0, i32 0), i8* null, i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_emit_sos = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_emit_sos = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6078953857301373430, i64 82365270956, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_emit_sos, i32 0, i32 0), i8* null, i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_vnodes = private global [14 x { i64, i64, i8* }] zeroinitializer, section "__llvm_prf_vnds"
@__llvm_prf_nm = private constant [140 x i8] c"\80\03\88\01x\DAu\8E\DD\0A\C20\0CF\F1\85\C4\89W\BELH\D7\94u\F6\CF4 {{\AD\C8 \91]\85\9C\93\EF#k,Q #?\88\E1\C5Q\88O\92\DBtN\E9\FE]\01\CB\F6\F3F\84\98\08\16B\FFo\18\F3\81\EA3\96\83\D0\A8\13\C6\CF\B0J\D0%\EAPK\DAvCy\FF[\B3\AB\DB\84\BAf\03i\B2\86\18\00[\BBh\8C\BE:\1A|\BAi\E1\9F\A2A\AF\C1\5C\E0l\C0b\22\9E\A3\ED\E8o!_\8D\AF", section "__llvm_prf_names"
@llvm.used = appending global [20 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_marker_writer to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_write_any_marker to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_write_file_header to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_write_frame_header to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_write_scan_header to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_write_file_trailer to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_write_tables_only to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_emit_marker to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_emit_2bytes to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_emit_byte to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_emit_jfif_app0 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_emit_adobe_app14 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_emit_dqt to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_emit_sof to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_emit_dac to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_emit_dht to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_emit_dri to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_emit_sos to i8*), i8* bitcast ([14 x { i64, i64, i8* }]* @__llvm_prf_vnodes to i8*), i8* getelementptr inbounds ([140 x i8], [140 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @jinit_marker_writer(%struct.jpeg_compress_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jinit_marker_writer, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_jinit_marker_writer, i64 0, i64 0)
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  %4 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %5 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %4, i32 0, i32 1
  %6 = load %struct.jpeg_memory_mgr*, %struct.jpeg_memory_mgr** %5, align 8
  %7 = getelementptr inbounds %struct.jpeg_memory_mgr, %struct.jpeg_memory_mgr* %6, i32 0, i32 0
  %8 = load i8* (%struct.jpeg_common_struct*, i32, i64)*, i8* (%struct.jpeg_common_struct*, i32, i64)** %7, align 8
  %9 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %10 = bitcast %struct.jpeg_compress_struct* %9 to %struct.jpeg_common_struct*
  %11 = ptrtoint i8* (%struct.jpeg_common_struct*, i32, i64)* %8 to i64
  call void @__llvm_profile_instrument_target(i64 %11, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_jinit_marker_writer to i8*), i32 0)
  %12 = call i8* %8(%struct.jpeg_common_struct* %10, i32 1, i64 48)
  %13 = bitcast i8* %12 to %struct.jpeg_marker_writer*
  %14 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %15 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %14, i32 0, i32 55
  store %struct.jpeg_marker_writer* %13, %struct.jpeg_marker_writer** %15, align 8
  %16 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %17 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %16, i32 0, i32 55
  %18 = load %struct.jpeg_marker_writer*, %struct.jpeg_marker_writer** %17, align 8
  %19 = getelementptr inbounds %struct.jpeg_marker_writer, %struct.jpeg_marker_writer* %18, i32 0, i32 0
  store void (%struct.jpeg_compress_struct*, i32, i8*, i32)* @write_any_marker, void (%struct.jpeg_compress_struct*, i32, i8*, i32)** %19, align 8
  %20 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %21 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %20, i32 0, i32 55
  %22 = load %struct.jpeg_marker_writer*, %struct.jpeg_marker_writer** %21, align 8
  %23 = getelementptr inbounds %struct.jpeg_marker_writer, %struct.jpeg_marker_writer* %22, i32 0, i32 1
  %24 = bitcast {}** %23 to void (%struct.jpeg_compress_struct*)**
  store void (%struct.jpeg_compress_struct*)* @write_file_header, void (%struct.jpeg_compress_struct*)** %24, align 8
  %25 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %26 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %25, i32 0, i32 55
  %27 = load %struct.jpeg_marker_writer*, %struct.jpeg_marker_writer** %26, align 8
  %28 = getelementptr inbounds %struct.jpeg_marker_writer, %struct.jpeg_marker_writer* %27, i32 0, i32 2
  %29 = bitcast {}** %28 to void (%struct.jpeg_compress_struct*)**
  store void (%struct.jpeg_compress_struct*)* @write_frame_header, void (%struct.jpeg_compress_struct*)** %29, align 8
  %30 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %31 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %30, i32 0, i32 55
  %32 = load %struct.jpeg_marker_writer*, %struct.jpeg_marker_writer** %31, align 8
  %33 = getelementptr inbounds %struct.jpeg_marker_writer, %struct.jpeg_marker_writer* %32, i32 0, i32 3
  %34 = bitcast {}** %33 to void (%struct.jpeg_compress_struct*)**
  store void (%struct.jpeg_compress_struct*)* @write_scan_header, void (%struct.jpeg_compress_struct*)** %34, align 8
  %35 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %36 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %35, i32 0, i32 55
  %37 = load %struct.jpeg_marker_writer*, %struct.jpeg_marker_writer** %36, align 8
  %38 = getelementptr inbounds %struct.jpeg_marker_writer, %struct.jpeg_marker_writer* %37, i32 0, i32 4
  %39 = bitcast {}** %38 to void (%struct.jpeg_compress_struct*)**
  store void (%struct.jpeg_compress_struct*)* @write_file_trailer, void (%struct.jpeg_compress_struct*)** %39, align 8
  %40 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %41 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %40, i32 0, i32 55
  %42 = load %struct.jpeg_marker_writer*, %struct.jpeg_marker_writer** %41, align 8
  %43 = getelementptr inbounds %struct.jpeg_marker_writer, %struct.jpeg_marker_writer* %42, i32 0, i32 5
  %44 = bitcast {}** %43 to void (%struct.jpeg_compress_struct*)**
  store void (%struct.jpeg_compress_struct*)* @write_tables_only, void (%struct.jpeg_compress_struct*)** %44, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @write_any_marker(%struct.jpeg_compress_struct*, i32, i8*, i32) #0 {
  %5 = alloca %struct.jpeg_compress_struct*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i8*, align 8
  %8 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %5, align 8
  store i32 %1, i32* %6, align 4
  store i8* %2, i8** %7, align 8
  store i32 %3, i32* %8, align 4
  %9 = load i32, i32* %8, align 4
  %10 = icmp ule i32 %9, 65533
  br i1 %10, label %11, label %31

; <label>:11:                                     ; preds = %4
  %12 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %13 = load i32, i32* %6, align 4
  call void @emit_marker(%struct.jpeg_compress_struct* %12, i32 %13)
  %14 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %15 = load i32, i32* %8, align 4
  %16 = add i32 %15, 2
  call void @emit_2bytes(%struct.jpeg_compress_struct* %14, i32 %16)
  br label %17

; <label>:17:                                     ; preds = %21, %11
  %18 = load i32, i32* %8, align 4
  %19 = add i32 %18, -1
  store i32 %19, i32* %8, align 4
  %20 = icmp ne i32 %18, 0
  br i1 %20, label %21, label %29

; <label>:21:                                     ; preds = %17
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_write_any_marker, i64 0, i64 0)
  %22 = add i64 %pgocount, 1
  store i64 %22, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_write_any_marker, i64 0, i64 0)
  %23 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %5, align 8
  %24 = load i8*, i8** %7, align 8
  %25 = load i8, i8* %24, align 1
  %26 = zext i8 %25 to i32
  call void @emit_byte(%struct.jpeg_compress_struct* %23, i32 %26)
  %27 = load i8*, i8** %7, align 8
  %28 = getelementptr inbounds i8, i8* %27, i32 1
  store i8* %28, i8** %7, align 8
  br label %17

; <label>:29:                                     ; preds = %17
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_write_any_marker, i64 0, i64 2)
  %30 = add i64 %pgocount1, 1
  store i64 %30, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_write_any_marker, i64 0, i64 2)
  br label %31

; <label>:31:                                     ; preds = %29, %4
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_write_any_marker, i64 0, i64 1)
  %32 = add i64 %pgocount2, 1
  store i64 %32, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_write_any_marker, i64 0, i64 1)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @write_file_header(%struct.jpeg_compress_struct*) #0 {
  %2 = alloca %struct.jpeg_compress_struct*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %2, align 8
  %3 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @emit_marker(%struct.jpeg_compress_struct* %3, i32 216)
  %4 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %5 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %4, i32 0, i32 31
  %6 = load i32, i32* %5, align 8
  %7 = icmp ne i32 %6, 0
  br i1 %7, label %8, label %11

; <label>:8:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_write_file_header, i64 0, i64 1)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_write_file_header, i64 0, i64 1)
  %10 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @emit_jfif_app0(%struct.jpeg_compress_struct* %10)
  br label %11

; <label>:11:                                     ; preds = %8, %1
  %12 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %13 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %12, i32 0, i32 35
  %14 = load i32, i32* %13, align 4
  %15 = icmp ne i32 %14, 0
  br i1 %15, label %16, label %19

; <label>:16:                                     ; preds = %11
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_write_file_header, i64 0, i64 2)
  %17 = add i64 %pgocount1, 1
  store i64 %17, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_write_file_header, i64 0, i64 2)
  %18 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @emit_adobe_app14(%struct.jpeg_compress_struct* %18)
  br label %19

; <label>:19:                                     ; preds = %16, %11
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_write_file_header, i64 0, i64 0)
  %20 = add i64 %pgocount2, 1
  store i64 %20, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_write_file_header, i64 0, i64 0)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @write_frame_header(%struct.jpeg_compress_struct*) #0 {
  %2 = alloca %struct.jpeg_compress_struct*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca %struct.jpeg_component_info*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %2, align 8
  store i32 0, i32* %4, align 4
  store i32 0, i32* %3, align 4
  %7 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %7, i32 0, i32 14
  %9 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %8, align 8
  store %struct.jpeg_component_info* %9, %struct.jpeg_component_info** %6, align 8
  br label %10

; <label>:10:                                     ; preds = %25, %1
  %11 = load i32, i32* %3, align 4
  %12 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %13 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %12, i32 0, i32 12
  %14 = load i32, i32* %13, align 4
  %15 = icmp slt i32 %11, %14
  br i1 %15, label %16, label %30

; <label>:16:                                     ; preds = %10
  %pgocount = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_write_frame_header, i64 0, i64 0)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_write_frame_header, i64 0, i64 0)
  %18 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %19 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %20 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %19, i32 0, i32 4
  %21 = load i32, i32* %20, align 8
  %22 = call i32 @emit_dqt(%struct.jpeg_compress_struct* %18, i32 %21)
  %23 = load i32, i32* %4, align 4
  %24 = add nsw i32 %23, %22
  store i32 %24, i32* %4, align 4
  br label %25

; <label>:25:                                     ; preds = %16
  %26 = load i32, i32* %3, align 4
  %27 = add nsw i32 %26, 1
  store i32 %27, i32* %3, align 4
  %28 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %29 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %28, i32 1
  store %struct.jpeg_component_info* %29, %struct.jpeg_component_info** %6, align 8
  br label %10

; <label>:30:                                     ; preds = %10
  %31 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %32 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %31, i32 0, i32 24
  %33 = load i32, i32* %32, align 4
  %34 = icmp ne i32 %33, 0
  br i1 %34, label %47, label %35

; <label>:35:                                     ; preds = %30
  %pgocount1 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_write_frame_header, i64 0, i64 5)
  %36 = add i64 %pgocount1, 1
  store i64 %36, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_write_frame_header, i64 0, i64 5)
  %37 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %38 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %37, i32 0, i32 37
  %39 = load i32, i32* %38, align 4
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %47, label %41

; <label>:41:                                     ; preds = %35
  %pgocount2 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_write_frame_header, i64 0, i64 7)
  %42 = add i64 %pgocount2, 1
  store i64 %42, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_write_frame_header, i64 0, i64 7)
  %43 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %44 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %43, i32 0, i32 11
  %45 = load i32, i32* %44, align 8
  %46 = icmp ne i32 %45, 8
  br i1 %46, label %47, label %48

; <label>:47:                                     ; preds = %41, %35, %30
  store i32 0, i32* %5, align 4
  br label %101

; <label>:48:                                     ; preds = %41
  store i32 1, i32* %5, align 4
  store i32 0, i32* %3, align 4
  %49 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %50 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %49, i32 0, i32 14
  %51 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %50, align 8
  store %struct.jpeg_component_info* %51, %struct.jpeg_component_info** %6, align 8
  br label %52

; <label>:52:                                     ; preds = %72, %48
  %53 = load i32, i32* %3, align 4
  %54 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %55 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %54, i32 0, i32 12
  %56 = load i32, i32* %55, align 4
  %57 = icmp slt i32 %53, %56
  br i1 %57, label %58, label %78

; <label>:58:                                     ; preds = %52
  %59 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %60 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %59, i32 0, i32 5
  %61 = load i32, i32* %60, align 4
  %62 = icmp sgt i32 %61, 1
  br i1 %62, label %69, label %63

; <label>:63:                                     ; preds = %58
  %pgocount3 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_write_frame_header, i64 0, i64 3)
  %64 = add i64 %pgocount3, 1
  store i64 %64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_write_frame_header, i64 0, i64 3)
  %65 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %66 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %65, i32 0, i32 6
  %67 = load i32, i32* %66, align 8
  %68 = icmp sgt i32 %67, 1
  br i1 %68, label %69, label %71

; <label>:69:                                     ; preds = %63, %58
  %pgocount4 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_write_frame_header, i64 0, i64 2)
  %70 = add i64 %pgocount4, 1
  store i64 %70, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_write_frame_header, i64 0, i64 2)
  store i32 0, i32* %5, align 4
  br label %71

; <label>:71:                                     ; preds = %69, %63
  br label %72

; <label>:72:                                     ; preds = %71
  %pgocount5 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_write_frame_header, i64 0, i64 1)
  %73 = add i64 %pgocount5, 1
  store i64 %73, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_write_frame_header, i64 0, i64 1)
  %74 = load i32, i32* %3, align 4
  %75 = add nsw i32 %74, 1
  store i32 %75, i32* %3, align 4
  %76 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %77 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %76, i32 1
  store %struct.jpeg_component_info* %77, %struct.jpeg_component_info** %6, align 8
  br label %52

; <label>:78:                                     ; preds = %52
  %79 = load i32, i32* %4, align 4
  %80 = icmp ne i32 %79, 0
  br i1 %80, label %81, label %99

; <label>:81:                                     ; preds = %78
  %pgocount6 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_write_frame_header, i64 0, i64 11)
  %82 = add i64 %pgocount6, 1
  store i64 %82, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_write_frame_header, i64 0, i64 11)
  %83 = load i32, i32* %5, align 4
  %84 = icmp ne i32 %83, 0
  br i1 %84, label %85, label %99

; <label>:85:                                     ; preds = %81
  %pgocount7 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_write_frame_header, i64 0, i64 12)
  %86 = add i64 %pgocount7, 1
  store i64 %86, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_write_frame_header, i64 0, i64 12)
  store i32 0, i32* %5, align 4
  %87 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %88 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %87, i32 0, i32 0
  %89 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %88, align 8
  %90 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %89, i32 0, i32 5
  store i32 74, i32* %90, align 8
  %91 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %92 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %91, i32 0, i32 0
  %93 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %92, align 8
  %94 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %93, i32 0, i32 1
  %95 = load void (%struct.jpeg_common_struct*, i32)*, void (%struct.jpeg_common_struct*, i32)** %94, align 8
  %96 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %97 = bitcast %struct.jpeg_compress_struct* %96 to %struct.jpeg_common_struct*
  %98 = ptrtoint void (%struct.jpeg_common_struct*, i32)* %95 to i64
  call void @__llvm_profile_instrument_target(i64 %98, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_write_frame_header to i8*), i32 0)
  call void %95(%struct.jpeg_common_struct* %97, i32 0)
  br label %99

; <label>:99:                                     ; preds = %85, %81, %78
  %pgocount8 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_write_frame_header, i64 0, i64 9)
  %100 = add i64 %pgocount8, 1
  store i64 %100, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_write_frame_header, i64 0, i64 9)
  br label %101

; <label>:101:                                    ; preds = %99, %47
  %102 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %103 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %102, i32 0, i32 24
  %104 = load i32, i32* %103, align 4
  %105 = icmp ne i32 %104, 0
  br i1 %105, label %106, label %109

; <label>:106:                                    ; preds = %101
  %pgocount9 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_write_frame_header, i64 0, i64 4)
  %107 = add i64 %pgocount9, 1
  store i64 %107, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_write_frame_header, i64 0, i64 4)
  %108 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @emit_sof(%struct.jpeg_compress_struct* %108, i32 201)
  br label %128

; <label>:109:                                    ; preds = %101
  %110 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %111 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %110, i32 0, i32 37
  %112 = load i32, i32* %111, align 4
  %113 = icmp ne i32 %112, 0
  br i1 %113, label %114, label %117

; <label>:114:                                    ; preds = %109
  %pgocount10 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_write_frame_header, i64 0, i64 6)
  %115 = add i64 %pgocount10, 1
  store i64 %115, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_write_frame_header, i64 0, i64 6)
  %116 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @emit_sof(%struct.jpeg_compress_struct* %116, i32 194)
  br label %127

; <label>:117:                                    ; preds = %109
  %118 = load i32, i32* %5, align 4
  %119 = icmp ne i32 %118, 0
  br i1 %119, label %120, label %123

; <label>:120:                                    ; preds = %117
  %pgocount11 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_write_frame_header, i64 0, i64 8)
  %121 = add i64 %pgocount11, 1
  store i64 %121, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_write_frame_header, i64 0, i64 8)
  %122 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @emit_sof(%struct.jpeg_compress_struct* %122, i32 192)
  br label %126

; <label>:123:                                    ; preds = %117
  %pgocount12 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_write_frame_header, i64 0, i64 10)
  %124 = add i64 %pgocount12, 1
  store i64 %124, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_tmp1.ll_write_frame_header, i64 0, i64 10)
  %125 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @emit_sof(%struct.jpeg_compress_struct* %125, i32 193)
  br label %126

; <label>:126:                                    ; preds = %123, %120
  br label %127

; <label>:127:                                    ; preds = %126, %114
  br label %128

; <label>:128:                                    ; preds = %127, %106
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @write_scan_header(%struct.jpeg_compress_struct*) #0 {
  %2 = alloca %struct.jpeg_compress_struct*, align 8
  %3 = alloca i32, align 4
  %4 = alloca %struct.jpeg_component_info*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %2, align 8
  %5 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %6 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %5, i32 0, i32 24
  %7 = load i32, i32* %6, align 4
  %8 = icmp ne i32 %7, 0
  br i1 %8, label %9, label %12

; <label>:9:                                      ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_scan_header, i64 0, i64 4)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_scan_header, i64 0, i64 4)
  %11 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @emit_dac(%struct.jpeg_compress_struct* %11)
  br label %71

; <label>:12:                                     ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_scan_header, i64 0, i64 6)
  %13 = add i64 %pgocount1, 1
  store i64 %13, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_scan_header, i64 0, i64 6)
  store i32 0, i32* %3, align 4
  br label %14

; <label>:14:                                     ; preds = %67, %12
  %15 = load i32, i32* %3, align 4
  %16 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %17 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %16, i32 0, i32 41
  %18 = load i32, i32* %17, align 4
  %19 = icmp slt i32 %15, %18
  br i1 %19, label %20, label %70

; <label>:20:                                     ; preds = %14
  %21 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %22 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %21, i32 0, i32 42
  %23 = load i32, i32* %3, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [4 x %struct.jpeg_component_info*], [4 x %struct.jpeg_component_info*]* %22, i64 0, i64 %24
  %26 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %25, align 8
  store %struct.jpeg_component_info* %26, %struct.jpeg_component_info** %4, align 8
  %27 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %28 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %27, i32 0, i32 37
  %29 = load i32, i32* %28, align 4
  %30 = icmp ne i32 %29, 0
  br i1 %30, label %31, label %56

; <label>:31:                                     ; preds = %20
  %32 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %33 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %32, i32 0, i32 47
  %34 = load i32, i32* %33, align 4
  %35 = icmp eq i32 %34, 0
  br i1 %35, label %36, label %49

; <label>:36:                                     ; preds = %31
  %37 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %38 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %37, i32 0, i32 49
  %39 = load i32, i32* %38, align 4
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %41, label %47

; <label>:41:                                     ; preds = %36
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_scan_header, i64 0, i64 3)
  %42 = add i64 %pgocount2, 1
  store i64 %42, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_scan_header, i64 0, i64 3)
  %43 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %44 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %45 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %44, i32 0, i32 5
  %46 = load i32, i32* %45, align 4
  call void @emit_dht(%struct.jpeg_compress_struct* %43, i32 %46, i32 0)
  br label %47

; <label>:47:                                     ; preds = %41, %36
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_scan_header, i64 0, i64 2)
  %48 = add i64 %pgocount3, 1
  store i64 %48, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_scan_header, i64 0, i64 2)
  br label %55

; <label>:49:                                     ; preds = %31
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_scan_header, i64 0, i64 0)
  %50 = add i64 %pgocount4, 1
  store i64 %50, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_scan_header, i64 0, i64 0)
  %51 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %52 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %53 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %52, i32 0, i32 6
  %54 = load i32, i32* %53, align 8
  call void @emit_dht(%struct.jpeg_compress_struct* %51, i32 %54, i32 1)
  br label %55

; <label>:55:                                     ; preds = %49, %47
  br label %66

; <label>:56:                                     ; preds = %20
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_scan_header, i64 0, i64 1)
  %57 = add i64 %pgocount5, 1
  store i64 %57, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_scan_header, i64 0, i64 1)
  %58 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %59 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %60 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %59, i32 0, i32 5
  %61 = load i32, i32* %60, align 4
  call void @emit_dht(%struct.jpeg_compress_struct* %58, i32 %61, i32 0)
  %62 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %63 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %4, align 8
  %64 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %63, i32 0, i32 6
  %65 = load i32, i32* %64, align 8
  call void @emit_dht(%struct.jpeg_compress_struct* %62, i32 %65, i32 1)
  br label %66

; <label>:66:                                     ; preds = %56, %55
  br label %67

; <label>:67:                                     ; preds = %66
  %68 = load i32, i32* %3, align 4
  %69 = add nsw i32 %68, 1
  store i32 %69, i32* %3, align 4
  br label %14

; <label>:70:                                     ; preds = %14
  br label %71

; <label>:71:                                     ; preds = %70, %9
  %72 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %73 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %72, i32 0, i32 29
  %74 = load i32, i32* %73, align 8
  %75 = icmp ne i32 %74, 0
  br i1 %75, label %76, label %79

; <label>:76:                                     ; preds = %71
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_scan_header, i64 0, i64 5)
  %77 = add i64 %pgocount6, 1
  store i64 %77, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_scan_header, i64 0, i64 5)
  %78 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @emit_dri(%struct.jpeg_compress_struct* %78)
  br label %79

; <label>:79:                                     ; preds = %76, %71
  %80 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @emit_sos(%struct.jpeg_compress_struct* %80)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @write_file_trailer(%struct.jpeg_compress_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_write_file_trailer, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_write_file_trailer, i64 0, i64 0)
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  %4 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  call void @emit_marker(%struct.jpeg_compress_struct* %4, i32 217)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @write_tables_only(%struct.jpeg_compress_struct*) #0 {
  %2 = alloca %struct.jpeg_compress_struct*, align 8
  %3 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %2, align 8
  %4 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @emit_marker(%struct.jpeg_compress_struct* %4, i32 216)
  store i32 0, i32* %3, align 4
  br label %5

; <label>:5:                                      ; preds = %23, %1
  %6 = load i32, i32* %3, align 4
  %7 = icmp slt i32 %6, 4
  br i1 %7, label %8, label %26

; <label>:8:                                      ; preds = %5
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_tables_only, i64 0, i64 0)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_tables_only, i64 0, i64 0)
  %10 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %11 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %10, i32 0, i32 15
  %12 = load i32, i32* %3, align 4
  %13 = sext i32 %12 to i64
  %14 = getelementptr inbounds [4 x %struct.JQUANT_TBL*], [4 x %struct.JQUANT_TBL*]* %11, i64 0, i64 %13
  %15 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %14, align 8
  %16 = icmp ne %struct.JQUANT_TBL* %15, null
  br i1 %16, label %17, label %22

; <label>:17:                                     ; preds = %8
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_tables_only, i64 0, i64 1)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_tables_only, i64 0, i64 1)
  %19 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %20 = load i32, i32* %3, align 4
  %21 = call i32 @emit_dqt(%struct.jpeg_compress_struct* %19, i32 %20)
  br label %22

; <label>:22:                                     ; preds = %17, %8
  br label %23

; <label>:23:                                     ; preds = %22
  %24 = load i32, i32* %3, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* %3, align 4
  br label %5

; <label>:26:                                     ; preds = %5
  %27 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %28 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %27, i32 0, i32 24
  %29 = load i32, i32* %28, align 4
  %30 = icmp ne i32 %29, 0
  br i1 %30, label %66, label %31

; <label>:31:                                     ; preds = %26
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_tables_only, i64 0, i64 6)
  %32 = add i64 %pgocount2, 1
  store i64 %32, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_tables_only, i64 0, i64 6)
  store i32 0, i32* %3, align 4
  br label %33

; <label>:33:                                     ; preds = %61, %31
  %34 = load i32, i32* %3, align 4
  %35 = icmp slt i32 %34, 4
  br i1 %35, label %36, label %65

; <label>:36:                                     ; preds = %33
  %37 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %38 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %37, i32 0, i32 16
  %39 = load i32, i32* %3, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*]* %38, i64 0, i64 %40
  %42 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %41, align 8
  %43 = icmp ne %struct.JHUFF_TBL* %42, null
  br i1 %43, label %44, label %48

; <label>:44:                                     ; preds = %36
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_tables_only, i64 0, i64 3)
  %45 = add i64 %pgocount3, 1
  store i64 %45, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_tables_only, i64 0, i64 3)
  %46 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %47 = load i32, i32* %3, align 4
  call void @emit_dht(%struct.jpeg_compress_struct* %46, i32 %47, i32 0)
  br label %48

; <label>:48:                                     ; preds = %44, %36
  %49 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %50 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %49, i32 0, i32 17
  %51 = load i32, i32* %3, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*]* %50, i64 0, i64 %52
  %54 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %53, align 8
  %55 = icmp ne %struct.JHUFF_TBL* %54, null
  br i1 %55, label %56, label %60

; <label>:56:                                     ; preds = %48
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_tables_only, i64 0, i64 4)
  %57 = add i64 %pgocount4, 1
  store i64 %57, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_tables_only, i64 0, i64 4)
  %58 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %59 = load i32, i32* %3, align 4
  call void @emit_dht(%struct.jpeg_compress_struct* %58, i32 %59, i32 1)
  br label %60

; <label>:60:                                     ; preds = %56, %48
  br label %61

; <label>:61:                                     ; preds = %60
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_tables_only, i64 0, i64 2)
  %62 = add i64 %pgocount5, 1
  store i64 %62, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_tables_only, i64 0, i64 2)
  %63 = load i32, i32* %3, align 4
  %64 = add nsw i32 %63, 1
  store i32 %64, i32* %3, align 4
  br label %33

; <label>:65:                                     ; preds = %33
  br label %66

; <label>:66:                                     ; preds = %65, %26
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_tables_only, i64 0, i64 5)
  %67 = add i64 %pgocount6, 1
  store i64 %67, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_write_tables_only, i64 0, i64 5)
  %68 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @emit_marker(%struct.jpeg_compress_struct* %68, i32 217)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @emit_marker(%struct.jpeg_compress_struct*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_emit_marker, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_emit_marker, i64 0, i64 0)
  %4 = alloca %struct.jpeg_compress_struct*, align 8
  %5 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %4, align 8
  store i32 %1, i32* %5, align 4
  %6 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  call void @emit_byte(%struct.jpeg_compress_struct* %6, i32 255)
  %7 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %8 = load i32, i32* %5, align 4
  call void @emit_byte(%struct.jpeg_compress_struct* %7, i32 %8)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @emit_2bytes(%struct.jpeg_compress_struct*, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_emit_2bytes, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_emit_2bytes, i64 0, i64 0)
  %4 = alloca %struct.jpeg_compress_struct*, align 8
  %5 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %4, align 8
  store i32 %1, i32* %5, align 4
  %6 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %7 = load i32, i32* %5, align 4
  %8 = ashr i32 %7, 8
  %9 = and i32 %8, 255
  call void @emit_byte(%struct.jpeg_compress_struct* %6, i32 %9)
  %10 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %11 = load i32, i32* %5, align 4
  %12 = and i32 %11, 255
  call void @emit_byte(%struct.jpeg_compress_struct* %10, i32 %12)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @emit_byte(%struct.jpeg_compress_struct*, i32) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.jpeg_destination_mgr*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store i32 %1, i32* %4, align 4
  %6 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %7 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %6, i32 0, i32 5
  %8 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %7, align 8
  store %struct.jpeg_destination_mgr* %8, %struct.jpeg_destination_mgr** %5, align 8
  %9 = load i32, i32* %4, align 4
  %10 = trunc i32 %9 to i8
  %11 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %5, align 8
  %12 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %11, i32 0, i32 0
  %13 = load i8*, i8** %12, align 8
  %14 = getelementptr inbounds i8, i8* %13, i32 1
  store i8* %14, i8** %12, align 8
  store i8 %10, i8* %13, align 1
  %15 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %5, align 8
  %16 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %15, i32 0, i32 1
  %17 = load i64, i64* %16, align 8
  %18 = add i64 %17, -1
  store i64 %18, i64* %16, align 8
  %19 = icmp eq i64 %18, 0
  br i1 %19, label %20, label %44

; <label>:20:                                     ; preds = %2
  %21 = load %struct.jpeg_destination_mgr*, %struct.jpeg_destination_mgr** %5, align 8
  %22 = getelementptr inbounds %struct.jpeg_destination_mgr, %struct.jpeg_destination_mgr* %21, i32 0, i32 3
  %23 = load i32 (%struct.jpeg_compress_struct*)*, i32 (%struct.jpeg_compress_struct*)** %22, align 8
  %24 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %25 = ptrtoint i32 (%struct.jpeg_compress_struct*)* %23 to i64
  call void @__llvm_profile_instrument_target(i64 %25, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_emit_byte to i8*), i32 0)
  %26 = call i32 %23(%struct.jpeg_compress_struct* %24)
  %27 = icmp ne i32 %26, 0
  br i1 %27, label %42, label %28

; <label>:28:                                     ; preds = %20
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_emit_byte, i64 0, i64 2)
  %29 = add i64 %pgocount, 1
  store i64 %29, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_emit_byte, i64 0, i64 2)
  %30 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %31 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %30, i32 0, i32 0
  %32 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %31, align 8
  %33 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %32, i32 0, i32 5
  store i32 22, i32* %33, align 8
  %34 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %35 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %34, i32 0, i32 0
  %36 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %35, align 8
  %37 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %36, i32 0, i32 0
  %38 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %37, align 8
  %39 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %40 = bitcast %struct.jpeg_compress_struct* %39 to %struct.jpeg_common_struct*
  %41 = ptrtoint void (%struct.jpeg_common_struct*)* %38 to i64
  call void @__llvm_profile_instrument_target(i64 %41, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_emit_byte to i8*), i32 1)
  call void %38(%struct.jpeg_common_struct* %40)
  br label %42

; <label>:42:                                     ; preds = %28, %20
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_emit_byte, i64 0, i64 1)
  %43 = add i64 %pgocount1, 1
  store i64 %43, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_emit_byte, i64 0, i64 1)
  br label %44

; <label>:44:                                     ; preds = %42, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_emit_byte, i64 0, i64 0)
  %45 = add i64 %pgocount2, 1
  store i64 %45, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_emit_byte, i64 0, i64 0)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @emit_jfif_app0(%struct.jpeg_compress_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_emit_jfif_app0, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_emit_jfif_app0, i64 0, i64 0)
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  %4 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  call void @emit_marker(%struct.jpeg_compress_struct* %4, i32 224)
  %5 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  call void @emit_2bytes(%struct.jpeg_compress_struct* %5, i32 16)
  %6 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  call void @emit_byte(%struct.jpeg_compress_struct* %6, i32 74)
  %7 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  call void @emit_byte(%struct.jpeg_compress_struct* %7, i32 70)
  %8 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  call void @emit_byte(%struct.jpeg_compress_struct* %8, i32 73)
  %9 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  call void @emit_byte(%struct.jpeg_compress_struct* %9, i32 70)
  %10 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  call void @emit_byte(%struct.jpeg_compress_struct* %10, i32 0)
  %11 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  call void @emit_byte(%struct.jpeg_compress_struct* %11, i32 1)
  %12 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  call void @emit_byte(%struct.jpeg_compress_struct* %12, i32 1)
  %13 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %14 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %15 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %14, i32 0, i32 32
  %16 = load i8, i8* %15, align 4
  %17 = zext i8 %16 to i32
  call void @emit_byte(%struct.jpeg_compress_struct* %13, i32 %17)
  %18 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %19 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %20 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %19, i32 0, i32 33
  %21 = load i16, i16* %20, align 2
  %22 = zext i16 %21 to i32
  call void @emit_2bytes(%struct.jpeg_compress_struct* %18, i32 %22)
  %23 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %24 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %25 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %24, i32 0, i32 34
  %26 = load i16, i16* %25, align 8
  %27 = zext i16 %26 to i32
  call void @emit_2bytes(%struct.jpeg_compress_struct* %23, i32 %27)
  %28 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  call void @emit_byte(%struct.jpeg_compress_struct* %28, i32 0)
  %29 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  call void @emit_byte(%struct.jpeg_compress_struct* %29, i32 0)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @emit_adobe_app14(%struct.jpeg_compress_struct*) #0 {
  %2 = alloca %struct.jpeg_compress_struct*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %2, align 8
  %3 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @emit_marker(%struct.jpeg_compress_struct* %3, i32 238)
  %4 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @emit_2bytes(%struct.jpeg_compress_struct* %4, i32 14)
  %5 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @emit_byte(%struct.jpeg_compress_struct* %5, i32 65)
  %6 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @emit_byte(%struct.jpeg_compress_struct* %6, i32 100)
  %7 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @emit_byte(%struct.jpeg_compress_struct* %7, i32 111)
  %8 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @emit_byte(%struct.jpeg_compress_struct* %8, i32 98)
  %9 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @emit_byte(%struct.jpeg_compress_struct* %9, i32 101)
  %10 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @emit_2bytes(%struct.jpeg_compress_struct* %10, i32 100)
  %11 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @emit_2bytes(%struct.jpeg_compress_struct* %11, i32 0)
  %12 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @emit_2bytes(%struct.jpeg_compress_struct* %12, i32 0)
  %13 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %14 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %13, i32 0, i32 13
  %15 = load i32, i32* %14, align 8
  switch i32 %15, label %22 [
    i32 3, label %16
    i32 5, label %19
  ]

; <label>:16:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_emit_adobe_app14, i64 0, i64 1)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_emit_adobe_app14, i64 0, i64 1)
  %18 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @emit_byte(%struct.jpeg_compress_struct* %18, i32 1)
  br label %25

; <label>:19:                                     ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_emit_adobe_app14, i64 0, i64 0)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_emit_adobe_app14, i64 0, i64 0)
  %21 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @emit_byte(%struct.jpeg_compress_struct* %21, i32 2)
  br label %25

; <label>:22:                                     ; preds = %1
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_emit_adobe_app14, i64 0, i64 2)
  %23 = add i64 %pgocount2, 1
  store i64 %23, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_emit_adobe_app14, i64 0, i64 2)
  %24 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @emit_byte(%struct.jpeg_compress_struct* %24, i32 0)
  br label %25

; <label>:25:                                     ; preds = %22, %19, %16
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @emit_dqt(%struct.jpeg_compress_struct*, i32) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca i32, align 4
  %5 = alloca %struct.JQUANT_TBL*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store i32 %1, i32* %4, align 4
  %9 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %10 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %9, i32 0, i32 15
  %11 = load i32, i32* %4, align 4
  %12 = sext i32 %11 to i64
  %13 = getelementptr inbounds [4 x %struct.JQUANT_TBL*], [4 x %struct.JQUANT_TBL*]* %10, i64 0, i64 %12
  %14 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %13, align 8
  store %struct.JQUANT_TBL* %14, %struct.JQUANT_TBL** %5, align 8
  %15 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %5, align 8
  %16 = icmp eq %struct.JQUANT_TBL* %15, null
  br i1 %16, label %17, label %38

; <label>:17:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_dqt, i64 0, i64 5)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_dqt, i64 0, i64 5)
  %19 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %20 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %19, i32 0, i32 0
  %21 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %20, align 8
  %22 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %21, i32 0, i32 5
  store i32 51, i32* %22, align 8
  %23 = load i32, i32* %4, align 4
  %24 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %25 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %24, i32 0, i32 0
  %26 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %25, align 8
  %27 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %26, i32 0, i32 6
  %28 = bitcast %union.anon* %27 to [8 x i32]*
  %29 = getelementptr inbounds [8 x i32], [8 x i32]* %28, i64 0, i64 0
  store i32 %23, i32* %29, align 4
  %30 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %31 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %30, i32 0, i32 0
  %32 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %31, align 8
  %33 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %32, i32 0, i32 0
  %34 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %33, align 8
  %35 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %36 = bitcast %struct.jpeg_compress_struct* %35 to %struct.jpeg_common_struct*
  %37 = ptrtoint void (%struct.jpeg_common_struct*)* %34 to i64
  call void @__llvm_profile_instrument_target(i64 %37, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_emit_dqt to i8*), i32 0)
  call void %34(%struct.jpeg_common_struct* %36)
  br label %38

; <label>:38:                                     ; preds = %17, %2
  store i32 0, i32* %6, align 4
  store i32 0, i32* %7, align 4
  br label %39

; <label>:39:                                     ; preds = %55, %38
  %40 = load i32, i32* %7, align 4
  %41 = icmp slt i32 %40, 64
  br i1 %41, label %42, label %58

; <label>:42:                                     ; preds = %39
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_dqt, i64 0, i64 0)
  %43 = add i64 %pgocount1, 1
  store i64 %43, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_dqt, i64 0, i64 0)
  %44 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %5, align 8
  %45 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %44, i32 0, i32 0
  %46 = load i32, i32* %7, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [64 x i16], [64 x i16]* %45, i64 0, i64 %47
  %49 = load i16, i16* %48, align 2
  %50 = zext i16 %49 to i32
  %51 = icmp sgt i32 %50, 255
  br i1 %51, label %52, label %54

; <label>:52:                                     ; preds = %42
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_dqt, i64 0, i64 1)
  %53 = add i64 %pgocount2, 1
  store i64 %53, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_dqt, i64 0, i64 1)
  store i32 1, i32* %6, align 4
  br label %54

; <label>:54:                                     ; preds = %52, %42
  br label %55

; <label>:55:                                     ; preds = %54
  %56 = load i32, i32* %7, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, i32* %7, align 4
  br label %39

; <label>:58:                                     ; preds = %39
  %59 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %5, align 8
  %60 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %59, i32 0, i32 1
  %61 = load i32, i32* %60, align 4
  %62 = icmp ne i32 %61, 0
  br i1 %62, label %109, label %63

; <label>:63:                                     ; preds = %58
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_dqt, i64 0, i64 6)
  %64 = add i64 %pgocount3, 1
  store i64 %64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_dqt, i64 0, i64 6)
  %65 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  call void @emit_marker(%struct.jpeg_compress_struct* %65, i32 219)
  %66 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %67 = load i32, i32* %6, align 4
  %68 = icmp ne i32 %67, 0
  %69 = zext i1 %68 to i64
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_dqt, i64 0, i64 7)
  %70 = add i64 %pgocount4, %69
  store i64 %70, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_dqt, i64 0, i64 7)
  %71 = select i1 %68, i32 131, i32 67
  call void @emit_2bytes(%struct.jpeg_compress_struct* %66, i32 %71)
  %72 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %73 = load i32, i32* %4, align 4
  %74 = load i32, i32* %6, align 4
  %75 = shl i32 %74, 4
  %76 = add nsw i32 %73, %75
  call void @emit_byte(%struct.jpeg_compress_struct* %72, i32 %76)
  store i32 0, i32* %7, align 4
  br label %77

; <label>:77:                                     ; preds = %102, %63
  %78 = load i32, i32* %7, align 4
  %79 = icmp slt i32 %78, 64
  br i1 %79, label %80, label %106

; <label>:80:                                     ; preds = %77
  %81 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %5, align 8
  %82 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %81, i32 0, i32 0
  %83 = load i32, i32* %7, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds [0 x i32], [0 x i32]* @jpeg_natural_order, i64 0, i64 %84
  %86 = load i32, i32* %85, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds [64 x i16], [64 x i16]* %82, i64 0, i64 %87
  %89 = load i16, i16* %88, align 2
  %90 = zext i16 %89 to i32
  store i32 %90, i32* %8, align 4
  %91 = load i32, i32* %6, align 4
  %92 = icmp ne i32 %91, 0
  br i1 %92, label %93, label %98

; <label>:93:                                     ; preds = %80
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_dqt, i64 0, i64 3)
  %94 = add i64 %pgocount5, 1
  store i64 %94, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_dqt, i64 0, i64 3)
  %95 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %96 = load i32, i32* %8, align 4
  %97 = lshr i32 %96, 8
  call void @emit_byte(%struct.jpeg_compress_struct* %95, i32 %97)
  br label %98

; <label>:98:                                     ; preds = %93, %80
  %99 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %100 = load i32, i32* %8, align 4
  %101 = and i32 %100, 255
  call void @emit_byte(%struct.jpeg_compress_struct* %99, i32 %101)
  br label %102

; <label>:102:                                    ; preds = %98
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_dqt, i64 0, i64 2)
  %103 = add i64 %pgocount6, 1
  store i64 %103, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_dqt, i64 0, i64 2)
  %104 = load i32, i32* %7, align 4
  %105 = add nsw i32 %104, 1
  store i32 %105, i32* %7, align 4
  br label %77

; <label>:106:                                    ; preds = %77
  %107 = load %struct.JQUANT_TBL*, %struct.JQUANT_TBL** %5, align 8
  %108 = getelementptr inbounds %struct.JQUANT_TBL, %struct.JQUANT_TBL* %107, i32 0, i32 1
  store i32 1, i32* %108, align 4
  br label %109

; <label>:109:                                    ; preds = %106, %58
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_dqt, i64 0, i64 4)
  %110 = add i64 %pgocount7, 1
  store i64 %110, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_emit_dqt, i64 0, i64 4)
  %111 = load i32, i32* %6, align 4
  ret i32 %111
}

; Function Attrs: nounwind uwtable
define internal void @emit_sof(%struct.jpeg_compress_struct*, i32) #0 {
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca %struct.jpeg_component_info*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  store i32 %1, i32* %4, align 4
  %7 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %8 = load i32, i32* %4, align 4
  call void @emit_marker(%struct.jpeg_compress_struct* %7, i32 %8)
  %9 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %10 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %11 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %10, i32 0, i32 12
  %12 = load i32, i32* %11, align 4
  %13 = mul nsw i32 3, %12
  %14 = add nsw i32 %13, 2
  %15 = add nsw i32 %14, 5
  %16 = add nsw i32 %15, 1
  call void @emit_2bytes(%struct.jpeg_compress_struct* %9, i32 %16)
  %17 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %18 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %17, i32 0, i32 7
  %19 = load i32, i32* %18, align 4
  %20 = zext i32 %19 to i64
  %21 = icmp sgt i64 %20, 65535
  br i1 %21, label %29, label %22

; <label>:22:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_emit_sof, i64 0, i64 3)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_emit_sof, i64 0, i64 3)
  %24 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %25 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %24, i32 0, i32 6
  %26 = load i32, i32* %25, align 8
  %27 = zext i32 %26 to i64
  %28 = icmp sgt i64 %27, 65535
  br i1 %28, label %29, label %49

; <label>:29:                                     ; preds = %22, %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_emit_sof, i64 0, i64 2)
  %30 = add i64 %pgocount1, 1
  store i64 %30, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_emit_sof, i64 0, i64 2)
  %31 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %32 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %31, i32 0, i32 0
  %33 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %32, align 8
  %34 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %33, i32 0, i32 5
  store i32 40, i32* %34, align 8
  %35 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %36 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %35, i32 0, i32 0
  %37 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %36, align 8
  %38 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %37, i32 0, i32 6
  %39 = bitcast %union.anon* %38 to [8 x i32]*
  %40 = getelementptr inbounds [8 x i32], [8 x i32]* %39, i64 0, i64 0
  store i32 65535, i32* %40, align 4
  %41 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %42 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %41, i32 0, i32 0
  %43 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %42, align 8
  %44 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %43, i32 0, i32 0
  %45 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %44, align 8
  %46 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %47 = bitcast %struct.jpeg_compress_struct* %46 to %struct.jpeg_common_struct*
  %48 = ptrtoint void (%struct.jpeg_common_struct*)* %45 to i64
  call void @__llvm_profile_instrument_target(i64 %48, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_emit_sof to i8*), i32 0)
  call void %45(%struct.jpeg_common_struct* %47)
  br label %49

; <label>:49:                                     ; preds = %29, %22
  %50 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %51 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %52 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %51, i32 0, i32 11
  %53 = load i32, i32* %52, align 8
  call void @emit_byte(%struct.jpeg_compress_struct* %50, i32 %53)
  %54 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %55 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %56 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %55, i32 0, i32 7
  %57 = load i32, i32* %56, align 4
  call void @emit_2bytes(%struct.jpeg_compress_struct* %54, i32 %57)
  %58 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %59 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %60 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %59, i32 0, i32 6
  %61 = load i32, i32* %60, align 8
  call void @emit_2bytes(%struct.jpeg_compress_struct* %58, i32 %61)
  %62 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %63 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %64 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %63, i32 0, i32 12
  %65 = load i32, i32* %64, align 4
  call void @emit_byte(%struct.jpeg_compress_struct* %62, i32 %65)
  store i32 0, i32* %5, align 4
  %66 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %67 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %66, i32 0, i32 14
  %68 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %67, align 8
  store %struct.jpeg_component_info* %68, %struct.jpeg_component_info** %6, align 8
  br label %69

; <label>:69:                                     ; preds = %93, %49
  %70 = load i32, i32* %5, align 4
  %71 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %72 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %71, i32 0, i32 12
  %73 = load i32, i32* %72, align 4
  %74 = icmp slt i32 %70, %73
  br i1 %74, label %75, label %99

; <label>:75:                                     ; preds = %69
  %76 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %77 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %78 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %77, i32 0, i32 0
  %79 = load i32, i32* %78, align 8
  call void @emit_byte(%struct.jpeg_compress_struct* %76, i32 %79)
  %80 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %81 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %82 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %81, i32 0, i32 2
  %83 = load i32, i32* %82, align 8
  %84 = shl i32 %83, 4
  %85 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %86 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %85, i32 0, i32 3
  %87 = load i32, i32* %86, align 4
  %88 = add nsw i32 %84, %87
  call void @emit_byte(%struct.jpeg_compress_struct* %80, i32 %88)
  %89 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %90 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %91 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %90, i32 0, i32 4
  %92 = load i32, i32* %91, align 8
  call void @emit_byte(%struct.jpeg_compress_struct* %89, i32 %92)
  br label %93

; <label>:93:                                     ; preds = %75
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_emit_sof, i64 0, i64 0)
  %94 = add i64 %pgocount2, 1
  store i64 %94, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_emit_sof, i64 0, i64 0)
  %95 = load i32, i32* %5, align 4
  %96 = add nsw i32 %95, 1
  store i32 %96, i32* %5, align 4
  %97 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %98 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %97, i32 1
  store %struct.jpeg_component_info* %98, %struct.jpeg_component_info** %6, align 8
  br label %69

; <label>:99:                                     ; preds = %69
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_emit_sof, i64 0, i64 1)
  %100 = add i64 %pgocount3, 1
  store i64 %100, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_emit_sof, i64 0, i64 1)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @emit_dac(%struct.jpeg_compress_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_emit_dac, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_emit_dac, i64 0, i64 0)
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @emit_dht(%struct.jpeg_compress_struct*, i32, i32) #0 {
  %4 = alloca %struct.jpeg_compress_struct*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.JHUFF_TBL*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %4, align 8
  store i32 %1, i32* %5, align 4
  store i32 %2, i32* %6, align 4
  %10 = load i32, i32* %6, align 4
  %11 = icmp ne i32 %10, 0
  br i1 %11, label %12, label %22

; <label>:12:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_dht, i64 0, i64 3)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_dht, i64 0, i64 3)
  %14 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %15 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %14, i32 0, i32 17
  %16 = load i32, i32* %5, align 4
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*]* %15, i64 0, i64 %17
  %19 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %18, align 8
  store %struct.JHUFF_TBL* %19, %struct.JHUFF_TBL** %7, align 8
  %20 = load i32, i32* %5, align 4
  %21 = add nsw i32 %20, 16
  store i32 %21, i32* %5, align 4
  br label %30

; <label>:22:                                     ; preds = %3
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_dht, i64 0, i64 4)
  %23 = add i64 %pgocount1, 1
  store i64 %23, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_dht, i64 0, i64 4)
  %24 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %25 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %24, i32 0, i32 16
  %26 = load i32, i32* %5, align 4
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds [4 x %struct.JHUFF_TBL*], [4 x %struct.JHUFF_TBL*]* %25, i64 0, i64 %27
  %29 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %28, align 8
  store %struct.JHUFF_TBL* %29, %struct.JHUFF_TBL** %7, align 8
  br label %30

; <label>:30:                                     ; preds = %22, %12
  %31 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %7, align 8
  %32 = icmp eq %struct.JHUFF_TBL* %31, null
  br i1 %32, label %33, label %54

; <label>:33:                                     ; preds = %30
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_dht, i64 0, i64 5)
  %34 = add i64 %pgocount2, 1
  store i64 %34, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_dht, i64 0, i64 5)
  %35 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %36 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %35, i32 0, i32 0
  %37 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %36, align 8
  %38 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %37, i32 0, i32 5
  store i32 49, i32* %38, align 8
  %39 = load i32, i32* %5, align 4
  %40 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %41 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %40, i32 0, i32 0
  %42 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %41, align 8
  %43 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %42, i32 0, i32 6
  %44 = bitcast %union.anon* %43 to [8 x i32]*
  %45 = getelementptr inbounds [8 x i32], [8 x i32]* %44, i64 0, i64 0
  store i32 %39, i32* %45, align 4
  %46 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %47 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %46, i32 0, i32 0
  %48 = load %struct.jpeg_error_mgr*, %struct.jpeg_error_mgr** %47, align 8
  %49 = getelementptr inbounds %struct.jpeg_error_mgr, %struct.jpeg_error_mgr* %48, i32 0, i32 0
  %50 = load void (%struct.jpeg_common_struct*)*, void (%struct.jpeg_common_struct*)** %49, align 8
  %51 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %52 = bitcast %struct.jpeg_compress_struct* %51 to %struct.jpeg_common_struct*
  %53 = ptrtoint void (%struct.jpeg_common_struct*)* %50 to i64
  call void @__llvm_profile_instrument_target(i64 %53, i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_emit_dht to i8*), i32 0)
  call void %50(%struct.jpeg_common_struct* %52)
  br label %54

; <label>:54:                                     ; preds = %33, %30
  %55 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %7, align 8
  %56 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %55, i32 0, i32 2
  %57 = load i32, i32* %56, align 4
  %58 = icmp ne i32 %57, 0
  br i1 %58, label %124, label %59

; <label>:59:                                     ; preds = %54
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_dht, i64 0, i64 6)
  %60 = add i64 %pgocount3, 1
  store i64 %60, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_dht, i64 0, i64 6)
  %61 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  call void @emit_marker(%struct.jpeg_compress_struct* %61, i32 196)
  store i32 0, i32* %8, align 4
  store i32 1, i32* %9, align 4
  br label %62

; <label>:62:                                     ; preds = %75, %59
  %63 = load i32, i32* %9, align 4
  %64 = icmp sle i32 %63, 16
  br i1 %64, label %65, label %79

; <label>:65:                                     ; preds = %62
  %66 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %7, align 8
  %67 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %66, i32 0, i32 0
  %68 = load i32, i32* %9, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [17 x i8], [17 x i8]* %67, i64 0, i64 %69
  %71 = load i8, i8* %70, align 1
  %72 = zext i8 %71 to i32
  %73 = load i32, i32* %8, align 4
  %74 = add nsw i32 %73, %72
  store i32 %74, i32* %8, align 4
  br label %75

; <label>:75:                                     ; preds = %65
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_dht, i64 0, i64 0)
  %76 = add i64 %pgocount4, 1
  store i64 %76, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_dht, i64 0, i64 0)
  %77 = load i32, i32* %9, align 4
  %78 = add nsw i32 %77, 1
  store i32 %78, i32* %9, align 4
  br label %62

; <label>:79:                                     ; preds = %62
  %80 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %81 = load i32, i32* %8, align 4
  %82 = add nsw i32 %81, 2
  %83 = add nsw i32 %82, 1
  %84 = add nsw i32 %83, 16
  call void @emit_2bytes(%struct.jpeg_compress_struct* %80, i32 %84)
  %85 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %86 = load i32, i32* %5, align 4
  call void @emit_byte(%struct.jpeg_compress_struct* %85, i32 %86)
  store i32 1, i32* %9, align 4
  br label %87

; <label>:87:                                     ; preds = %99, %79
  %88 = load i32, i32* %9, align 4
  %89 = icmp sle i32 %88, 16
  br i1 %89, label %90, label %103

; <label>:90:                                     ; preds = %87
  %91 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %92 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %7, align 8
  %93 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %92, i32 0, i32 0
  %94 = load i32, i32* %9, align 4
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds [17 x i8], [17 x i8]* %93, i64 0, i64 %95
  %97 = load i8, i8* %96, align 1
  %98 = zext i8 %97 to i32
  call void @emit_byte(%struct.jpeg_compress_struct* %91, i32 %98)
  br label %99

; <label>:99:                                     ; preds = %90
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_dht, i64 0, i64 1)
  %100 = add i64 %pgocount5, 1
  store i64 %100, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_dht, i64 0, i64 1)
  %101 = load i32, i32* %9, align 4
  %102 = add nsw i32 %101, 1
  store i32 %102, i32* %9, align 4
  br label %87

; <label>:103:                                    ; preds = %87
  store i32 0, i32* %9, align 4
  br label %104

; <label>:104:                                    ; preds = %117, %103
  %105 = load i32, i32* %9, align 4
  %106 = load i32, i32* %8, align 4
  %107 = icmp slt i32 %105, %106
  br i1 %107, label %108, label %121

; <label>:108:                                    ; preds = %104
  %109 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %4, align 8
  %110 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %7, align 8
  %111 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %110, i32 0, i32 1
  %112 = load i32, i32* %9, align 4
  %113 = sext i32 %112 to i64
  %114 = getelementptr inbounds [256 x i8], [256 x i8]* %111, i64 0, i64 %113
  %115 = load i8, i8* %114, align 1
  %116 = zext i8 %115 to i32
  call void @emit_byte(%struct.jpeg_compress_struct* %109, i32 %116)
  br label %117

; <label>:117:                                    ; preds = %108
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_dht, i64 0, i64 2)
  %118 = add i64 %pgocount6, 1
  store i64 %118, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_emit_dht, i64 0, i64 2)
  %119 = load i32, i32* %9, align 4
  %120 = add nsw i32 %119, 1
  store i32 %120, i32* %9, align 4
  br label %104

; <label>:121:                                    ; preds = %104
  %122 = load %struct.JHUFF_TBL*, %struct.JHUFF_TBL** %7, align 8
  %123 = getelementptr inbounds %struct.JHUFF_TBL, %struct.JHUFF_TBL* %122, i32 0, i32 2
  store i32 1, i32* %123, align 4
  br label %124

; <label>:124:                                    ; preds = %121, %54
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @emit_dri(%struct.jpeg_compress_struct*) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_emit_dri, i64 0, i64 0)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_tmp1.ll_emit_dri, i64 0, i64 0)
  %3 = alloca %struct.jpeg_compress_struct*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %3, align 8
  %4 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  call void @emit_marker(%struct.jpeg_compress_struct* %4, i32 221)
  %5 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  call void @emit_2bytes(%struct.jpeg_compress_struct* %5, i32 4)
  %6 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %7 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %3, align 8
  %8 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %7, i32 0, i32 29
  %9 = load i32, i32* %8, align 8
  call void @emit_2bytes(%struct.jpeg_compress_struct* %6, i32 %9)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @emit_sos(%struct.jpeg_compress_struct*) #0 {
  %2 = alloca %struct.jpeg_compress_struct*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca %struct.jpeg_component_info*, align 8
  store %struct.jpeg_compress_struct* %0, %struct.jpeg_compress_struct** %2, align 8
  %7 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  call void @emit_marker(%struct.jpeg_compress_struct* %7, i32 218)
  %8 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %9 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %10 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %9, i32 0, i32 41
  %11 = load i32, i32* %10, align 4
  %12 = mul nsw i32 2, %11
  %13 = add nsw i32 %12, 2
  %14 = add nsw i32 %13, 1
  %15 = add nsw i32 %14, 3
  call void @emit_2bytes(%struct.jpeg_compress_struct* %8, i32 %15)
  %16 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %17 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %18 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %17, i32 0, i32 41
  %19 = load i32, i32* %18, align 4
  call void @emit_byte(%struct.jpeg_compress_struct* %16, i32 %19)
  store i32 0, i32* %3, align 4
  br label %20

; <label>:20:                                     ; preds = %76, %1
  %21 = load i32, i32* %3, align 4
  %22 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %23 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %22, i32 0, i32 41
  %24 = load i32, i32* %23, align 4
  %25 = icmp slt i32 %21, %24
  br i1 %25, label %26, label %80

; <label>:26:                                     ; preds = %20
  %27 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %28 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %27, i32 0, i32 42
  %29 = load i32, i32* %3, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [4 x %struct.jpeg_component_info*], [4 x %struct.jpeg_component_info*]* %28, i64 0, i64 %30
  %32 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %31, align 8
  store %struct.jpeg_component_info* %32, %struct.jpeg_component_info** %6, align 8
  %33 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %34 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %35 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %34, i32 0, i32 0
  %36 = load i32, i32* %35, align 8
  call void @emit_byte(%struct.jpeg_compress_struct* %33, i32 %36)
  %37 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %38 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %37, i32 0, i32 5
  %39 = load i32, i32* %38, align 4
  store i32 %39, i32* %4, align 4
  %40 = load %struct.jpeg_component_info*, %struct.jpeg_component_info** %6, align 8
  %41 = getelementptr inbounds %struct.jpeg_component_info, %struct.jpeg_component_info* %40, i32 0, i32 6
  %42 = load i32, i32* %41, align 8
  store i32 %42, i32* %5, align 4
  %43 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %44 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %43, i32 0, i32 37
  %45 = load i32, i32* %44, align 4
  %46 = icmp ne i32 %45, 0
  br i1 %46, label %47, label %70

; <label>:47:                                     ; preds = %26
  %48 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %49 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %48, i32 0, i32 47
  %50 = load i32, i32* %49, align 4
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %52, label %67

; <label>:52:                                     ; preds = %47
  store i32 0, i32* %5, align 4
  %53 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %54 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %53, i32 0, i32 49
  %55 = load i32, i32* %54, align 4
  %56 = icmp ne i32 %55, 0
  br i1 %56, label %57, label %65

; <label>:57:                                     ; preds = %52
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_emit_sos, i64 0, i64 3)
  %58 = add i64 %pgocount, 1
  store i64 %58, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_emit_sos, i64 0, i64 3)
  %59 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %60 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %59, i32 0, i32 24
  %61 = load i32, i32* %60, align 4
  %62 = icmp ne i32 %61, 0
  br i1 %62, label %65, label %63

; <label>:63:                                     ; preds = %57
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_emit_sos, i64 0, i64 4)
  %64 = add i64 %pgocount1, 1
  store i64 %64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_emit_sos, i64 0, i64 4)
  store i32 0, i32* %4, align 4
  br label %65

; <label>:65:                                     ; preds = %63, %57, %52
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_emit_sos, i64 0, i64 2)
  %66 = add i64 %pgocount2, 1
  store i64 %66, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_emit_sos, i64 0, i64 2)
  br label %69

; <label>:67:                                     ; preds = %47
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_emit_sos, i64 0, i64 1)
  %68 = add i64 %pgocount3, 1
  store i64 %68, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_emit_sos, i64 0, i64 1)
  store i32 0, i32* %4, align 4
  br label %69

; <label>:69:                                     ; preds = %67, %65
  br label %70

; <label>:70:                                     ; preds = %69, %26
  %71 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %72 = load i32, i32* %4, align 4
  %73 = shl i32 %72, 4
  %74 = load i32, i32* %5, align 4
  %75 = add nsw i32 %73, %74
  call void @emit_byte(%struct.jpeg_compress_struct* %71, i32 %75)
  br label %76

; <label>:76:                                     ; preds = %70
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_emit_sos, i64 0, i64 0)
  %77 = add i64 %pgocount4, 1
  store i64 %77, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_emit_sos, i64 0, i64 0)
  %78 = load i32, i32* %3, align 4
  %79 = add nsw i32 %78, 1
  store i32 %79, i32* %3, align 4
  br label %20

; <label>:80:                                     ; preds = %20
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_emit_sos, i64 0, i64 5)
  %81 = add i64 %pgocount5, 1
  store i64 %81, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_tmp1.ll_emit_sos, i64 0, i64 5)
  %82 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %83 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %84 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %83, i32 0, i32 47
  %85 = load i32, i32* %84, align 4
  call void @emit_byte(%struct.jpeg_compress_struct* %82, i32 %85)
  %86 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %87 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %88 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %87, i32 0, i32 48
  %89 = load i32, i32* %88, align 8
  call void @emit_byte(%struct.jpeg_compress_struct* %86, i32 %89)
  %90 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %91 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %92 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %91, i32 0, i32 49
  %93 = load i32, i32* %92, align 4
  %94 = shl i32 %93, 4
  %95 = load %struct.jpeg_compress_struct*, %struct.jpeg_compress_struct** %2, align 8
  %96 = getelementptr inbounds %struct.jpeg_compress_struct, %struct.jpeg_compress_struct* %95, i32 0, i32 50
  %97 = load i32, i32* %96, align 8
  %98 = add nsw i32 %94, %97
  call void @emit_byte(%struct.jpeg_compress_struct* %90, i32 %98)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.value.profile(i8*, i64, i64, i32, i32) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #1

declare void @__llvm_profile_instrument_target(i64, i8*, i32)

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
