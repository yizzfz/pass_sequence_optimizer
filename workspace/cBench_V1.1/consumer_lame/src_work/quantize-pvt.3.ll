; ModuleID = 'quantize-pvt.2.ll'
source_filename = "quantize-pvt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.scalefac_struct = type { [23 x i32], [14 x i32] }
%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }
%struct.lame_global_flags = type { i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, i8*, i32, i32, float, i32, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, float, i32, i32, i32, float, float, float, float, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.III_side_info_t = type { i32, i32, i32, [2 x [4 x i32]], [2 x %struct.anon] }
%struct.anon = type { [2 x %struct.gr_info_ss] }
%struct.gr_info_ss = type { %struct.gr_info }
%struct.gr_info = type { i32, i32, i32, i32, i32, i32, i32, i32, [3 x i32], [3 x i32], i32, i32, i32, i32, i32, i32, i32, i32, i32, i32*, [4 x i32] }
%struct.III_scalefac_t = type { [22 x i32], [13 x [3 x i32]] }
%struct.III_psy_ratio = type { %struct.III_psy_xmin, %struct.III_psy_xmin }
%struct.III_psy_xmin = type { [22 x double], [13 x [3 x double]] }

$__llvm_profile_raw_version = comdat any

@masking_lower = global float 1.000000e+00, align 4
@nr_of_sfb_block = global [6 x [3 x [4 x i32]]] [[3 x [4 x i32]] [[4 x i32] [i32 6, i32 5, i32 5, i32 5], [4 x i32] [i32 9, i32 9, i32 9, i32 9], [4 x i32] [i32 6, i32 9, i32 9, i32 9]], [3 x [4 x i32]] [[4 x i32] [i32 6, i32 5, i32 7, i32 3], [4 x i32] [i32 9, i32 9, i32 12, i32 6], [4 x i32] [i32 6, i32 9, i32 12, i32 6]], [3 x [4 x i32]] [[4 x i32] [i32 11, i32 10, i32 0, i32 0], [4 x i32] [i32 18, i32 18, i32 0, i32 0], [4 x i32] [i32 15, i32 18, i32 0, i32 0]], [3 x [4 x i32]] [[4 x i32] [i32 7, i32 7, i32 7, i32 0], [4 x i32] [i32 12, i32 12, i32 12, i32 0], [4 x i32] [i32 6, i32 15, i32 12, i32 0]], [3 x [4 x i32]] [[4 x i32] [i32 6, i32 6, i32 6, i32 3], [4 x i32] [i32 12, i32 9, i32 9, i32 6], [4 x i32] [i32 6, i32 12, i32 9, i32 6]], [3 x [4 x i32]] [[4 x i32] [i32 8, i32 8, i32 5, i32 0], [4 x i32] [i32 15, i32 12, i32 9, i32 0], [4 x i32] [i32 6, i32 18, i32 9, i32 0]]], align 16
@pretab = global [21 x i32] [i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 0, i32 1, i32 1, i32 1, i32 1, i32 2, i32 2, i32 3, i32 3, i32 3, i32 2], align 16
@sfBandIndex = global [6 x %struct.scalefac_struct] [%struct.scalefac_struct { [23 x i32] [i32 0, i32 6, i32 12, i32 18, i32 24, i32 30, i32 36, i32 44, i32 54, i32 66, i32 80, i32 96, i32 116, i32 140, i32 168, i32 200, i32 238, i32 284, i32 336, i32 396, i32 464, i32 522, i32 576], [14 x i32] [i32 0, i32 4, i32 8, i32 12, i32 18, i32 24, i32 32, i32 42, i32 56, i32 74, i32 100, i32 132, i32 174, i32 192] }, %struct.scalefac_struct { [23 x i32] [i32 0, i32 6, i32 12, i32 18, i32 24, i32 30, i32 36, i32 44, i32 54, i32 66, i32 80, i32 96, i32 114, i32 136, i32 162, i32 194, i32 232, i32 278, i32 332, i32 394, i32 464, i32 540, i32 576], [14 x i32] [i32 0, i32 4, i32 8, i32 12, i32 18, i32 26, i32 36, i32 48, i32 62, i32 80, i32 104, i32 136, i32 180, i32 192] }, %struct.scalefac_struct { [23 x i32] [i32 0, i32 6, i32 12, i32 18, i32 24, i32 30, i32 36, i32 44, i32 54, i32 66, i32 80, i32 96, i32 116, i32 140, i32 168, i32 200, i32 238, i32 284, i32 336, i32 396, i32 464, i32 522, i32 576], [14 x i32] [i32 0, i32 4, i32 8, i32 12, i32 18, i32 26, i32 36, i32 48, i32 62, i32 80, i32 104, i32 134, i32 174, i32 192] }, %struct.scalefac_struct { [23 x i32] [i32 0, i32 4, i32 8, i32 12, i32 16, i32 20, i32 24, i32 30, i32 36, i32 44, i32 52, i32 62, i32 74, i32 90, i32 110, i32 134, i32 162, i32 196, i32 238, i32 288, i32 342, i32 418, i32 576], [14 x i32] [i32 0, i32 4, i32 8, i32 12, i32 16, i32 22, i32 30, i32 40, i32 52, i32 66, i32 84, i32 106, i32 136, i32 192] }, %struct.scalefac_struct { [23 x i32] [i32 0, i32 4, i32 8, i32 12, i32 16, i32 20, i32 24, i32 30, i32 36, i32 42, i32 50, i32 60, i32 72, i32 88, i32 106, i32 128, i32 156, i32 190, i32 230, i32 276, i32 330, i32 384, i32 576], [14 x i32] [i32 0, i32 4, i32 8, i32 12, i32 16, i32 22, i32 28, i32 38, i32 50, i32 64, i32 80, i32 100, i32 126, i32 192] }, %struct.scalefac_struct { [23 x i32] [i32 0, i32 4, i32 8, i32 12, i32 16, i32 20, i32 24, i32 30, i32 36, i32 44, i32 54, i32 66, i32 82, i32 102, i32 126, i32 156, i32 194, i32 240, i32 296, i32 364, i32 448, i32 550, i32 576], [14 x i32] [i32 0, i32 4, i32 8, i32 12, i32 16, i32 22, i32 30, i32 42, i32 58, i32 78, i32 104, i32 138, i32 180, i32 192] }], align 16
@scalefac_band = common global %struct.scalefac_struct zeroinitializer, align 4
@ATH_l = internal global [21 x double] zeroinitializer, align 16
@ATH_s = internal global [21 x double] zeroinitializer, align 16
@pow43 = common global [8208 x double] zeroinitializer, align 16
@adj43 = internal global [8208 x double] zeroinitializer, align 16
@adj43asm = internal global [8208 x double] zeroinitializer, align 16
@ipow20 = common global [256 x double] zeroinitializer, align 16
@pow20 = common global [256 x double] zeroinitializer, align 16
@convert_mdct = common global i32 0, align 4
@reduce_sidechannel = common global i32 0, align 4
@.str = private unnamed_addr constant [14 x i8] c"max_bits >= 0\00", align 1
@.str.1 = private unnamed_addr constant [15 x i8] c"quantize-pvt.c\00", align 1
@__PRETTY_FUNCTION__.inner_loop = private unnamed_addr constant [69 x i8] c"int inner_loop(lame_global_flags *, FLOAT8 *, int *, int, gr_info *)\00", align 1
@scale_bitcount.slen1 = internal global [16 x i32] [i32 1, i32 1, i32 1, i32 1, i32 8, i32 2, i32 2, i32 2, i32 4, i32 4, i32 4, i32 8, i32 8, i32 8, i32 16, i32 16], align 16
@scale_bitcount.slen2 = internal global [16 x i32] [i32 1, i32 2, i32 4, i32 8, i32 1, i32 2, i32 4, i32 8, i32 2, i32 4, i32 8, i32 2, i32 4, i32 8, i32 4, i32 8], align 16
@scale_bitcount.slen1_tab = internal global [16 x i32] [i32 0, i32 18, i32 36, i32 54, i32 54, i32 36, i32 54, i32 72, i32 54, i32 72, i32 90, i32 72, i32 90, i32 108, i32 108, i32 126], align 16
@scale_bitcount.slen2_tab = internal global [16 x i32] [i32 0, i32 10, i32 20, i32 30, i32 33, i32 21, i32 31, i32 41, i32 32, i32 42, i32 52, i32 43, i32 53, i32 63, i32 64, i32 74], align 16
@max_range_sfac_tab = internal global [6 x [4 x i32]] [[4 x i32] [i32 15, i32 15, i32 7, i32 7], [4 x i32] [i32 15, i32 15, i32 7, i32 0], [4 x i32] [i32 7, i32 3, i32 0, i32 0], [4 x i32] [i32 15, i32 31, i32 31, i32 0], [4 x i32] [i32 7, i32 7, i32 7, i32 0], [4 x i32] [i32 3, i32 3, i32 0, i32 0]], align 16
@scale_bitcount_lsf.log2tab = internal global [16 x i32] [i32 0, i32 1, i32 2, i32 2, i32 3, i32 3, i32 3, i32 3, i32 4, i32 4, i32 4, i32 4, i32 4, i32 4, i32 4, i32 4], align 16
@stderr = external global %struct._IO_FILE*, align 8
@.str.2 = private unnamed_addr constant [38 x i8] c"intensity stereo not implemented yet\0A\00", align 1
@.str.3 = private unnamed_addr constant [30 x i8] c"cod_info->sfb_partition_table\00", align 1
@__PRETTY_FUNCTION__.scale_bitcount_lsf = private unnamed_addr constant [52 x i8] c"int scale_bitcount_lsf(III_scalefac_t *, gr_info *)\00", align 1
@bin_search_StepSize2.CurrentStep = internal global i32 4, align 4
@ATH_mdct_long = common global [576 x double] zeroinitializer, align 16
@ATH_mdct_short = common global [192 x double] zeroinitializer, align 16
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_iteration_init = private constant [14 x i8] c"iteration_init"
@__profn_compute_ath = private constant [11 x i8] c"compute_ath"
@__profn_ATHformula = private constant [10 x i8] c"ATHformula"
@__profn_ms_convert = private constant [10 x i8] c"ms_convert"
@__profn_on_pe = private constant [5 x i8] c"on_pe"
@__profn_reduce_side = private constant [11 x i8] c"reduce_side"
@__profn_inner_loop = private constant [10 x i8] c"inner_loop"
@__profn_scale_bitcount = private constant [14 x i8] c"scale_bitcount"
@__profn_scale_bitcount_lsf = private constant [18 x i8] c"scale_bitcount_lsf"
@__profn_calc_xmin = private constant [9 x i8] c"calc_xmin"
@__profn_loop_break = private constant [10 x i8] c"loop_break"
@__profn_bin_search_StepSize2 = private constant [20 x i8] c"bin_search_StepSize2"
@__profn_quantize_xrpow = private constant [14 x i8] c"quantize_xrpow"
@__profn_quantize_xrpow_ISO = private constant [18 x i8] c"quantize_xrpow_ISO"
@__profc_iteration_init = private global [14 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_iteration_init = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3787728813423558848, i64 267247422901, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_iteration_init, i32 0, i32 0), i8* bitcast (void (%struct.lame_global_flags*, %struct.III_side_info_t*, [2 x [576 x i32]]*)* @iteration_init to i8*), i8* null, i32 14, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_compute_ath = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_compute_ath = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4451013285257991276, i64 131872858330, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_compute_ath, i32 0, i32 0), i8* bitcast (void (%struct.lame_global_flags*, double*, double*)* @compute_ath to i8*), i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_ATHformula = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_ATHformula = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1944255100188674254, i64 47134776368, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_ATHformula, i32 0, i32 0), i8* bitcast (double (%struct.lame_global_flags*, double)* @ATHformula to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_ms_convert = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_ms_convert = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1222568353292426485, i64 34137660316, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_ms_convert, i32 0, i32 0), i8* bitcast (void ([576 x double]*, [576 x double]*)* @ms_convert to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_on_pe = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_on_pe = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7862873954416661523, i64 97229068719, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_on_pe, i32 0, i32 0), i8* bitcast (void (%struct.lame_global_flags*, [2 x double]*, %struct.III_side_info_t*, i32*, i32, i32)* @on_pe to i8*), i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_reduce_side = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_reduce_side = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4415407910688218848, i64 104524373261, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_reduce_side, i32 0, i32 0), i8* bitcast (void (i32*, double, i32)* @reduce_side to i8*), i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_inner_loop = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_inner_loop = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1305726962269255771, i64 51000079461, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_inner_loop, i32 0, i32 0), i8* bitcast (i32 (%struct.lame_global_flags*, double*, i32*, i32, %struct.gr_info*)* @inner_loop to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_scale_bitcount = private global [20 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_scale_bitcount = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1467613580276839345, i64 320006859366, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_scale_bitcount, i32 0, i32 0), i8* bitcast (i32 (%struct.III_scalefac_t*, %struct.gr_info*)* @scale_bitcount to i8*), i8* null, i32 20, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_scale_bitcount_lsf = private global [21 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_scale_bitcount_lsf = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1606423589641345666, i64 356698158213, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_scale_bitcount_lsf, i32 0, i32 0), i8* bitcast (i32 (%struct.III_scalefac_t*, %struct.gr_info*)* @scale_bitcount_lsf to i8*), i8* null, i32 21, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_calc_xmin = private global [16 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_calc_xmin = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6524937669456767784, i64 285975889570, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_calc_xmin, i32 0, i32 0), i8* bitcast (i32 (%struct.lame_global_flags*, double*, %struct.III_psy_ratio*, %struct.gr_info*, %struct.III_psy_xmin*)* @calc_xmin to i8*), i8* null, i32 16, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_loop_break = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_loop_break = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -622675864606578590, i64 106107678126, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_loop_break, i32 0, i32 0), i8* bitcast (i32 (%struct.III_scalefac_t*, %struct.gr_info*)* @loop_break to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_bin_search_StepSize2 = private global [13 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_bin_search_StepSize2 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -397612652916321364, i64 172915075430, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_bin_search_StepSize2, i32 0, i32 0), i8* bitcast (i32 (%struct.lame_global_flags*, i32, i32, i32*, double*, %struct.gr_info*)* @bin_search_StepSize2 to i8*), i8* null, i32 13, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_quantize_xrpow = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_quantize_xrpow = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6837930760508552414, i64 34137660316, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_quantize_xrpow, i32 0, i32 0), i8* bitcast (void (double*, i32*, %struct.gr_info*)* @quantize_xrpow to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_quantize_xrpow_ISO = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_quantize_xrpow_ISO = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5414442320251928256, i64 48177658595, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_quantize_xrpow_ISO, i32 0, i32 0), i8* bitcast (void (double*, i32*, %struct.gr_info*)* @quantize_xrpow_ISO to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [137 x i8] c"\BB\01\85\01x\DA]\8B1\0E\C2@\0C\04\E5/\F1\03:\A8(Bo9\8E\A3X\DC\D9\87\CF\07\88\D7\13\DAt3\A3]M\09JuC5M`\AFm\A4 \E5\06\E7\FBe\F5\A8\A3\10\D4\8E\EC\F6\92H\D8\97M d\19,\D8u\11P3\09,\EE\0D:S\11\9C5\D9\87\E5A\B1\F4\15\F6\C2\F8\A9j\F0?\E0\1CB\0F\98\D5\B0\0B\05o8\A5\B4I\BFr\82\E7 \CB\9D\F0\13\CD\DF\07\C5\EBt\FB\011\C0G\AC", section "__llvm_prf_names"
@llvm.used = appending global [15 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_iteration_init to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_compute_ath to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_ATHformula to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_ms_convert to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_on_pe to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_reduce_side to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_inner_loop to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_scale_bitcount to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_scale_bitcount_lsf to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_calc_xmin to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_loop_break to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_bin_search_StepSize2 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_quantize_xrpow to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_quantize_xrpow_ISO to i8*), i8* getelementptr inbounds ([137 x i8], [137 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @iteration_init(%struct.lame_global_flags*, %struct.III_side_info_t*, [2 x [576 x i32]]*) #0 {
  %4 = alloca %struct.lame_global_flags*, align 8
  %5 = alloca %struct.III_side_info_t*, align 8
  %6 = alloca [2 x [576 x i32]]*, align 8
  %7 = alloca %struct.gr_info*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %4, align 8
  store %struct.III_side_info_t* %1, %struct.III_side_info_t** %5, align 8
  store [2 x [576 x i32]]* %2, [2 x [576 x i32]]** %6, align 8
  %11 = load %struct.III_side_info_t*, %struct.III_side_info_t** %5, align 8
  %12 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %11, i32 0, i32 2
  store i32 0, i32* %12, align 8
  %13 = load %struct.lame_global_flags*, %struct.lame_global_flags** %4, align 8
  %14 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %13, i32 0, i32 39
  %15 = load i64, i64* %14, align 8
  %16 = icmp eq i64 %15, 0
  br i1 %16, label %17, label %175

; <label>:17:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_iteration_init, i64 0, i64 13)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_iteration_init, i64 0, i64 13)
  store i32 0, i32* %10, align 4
  br label %19

; <label>:19:                                     ; preds = %41, %17
  %20 = load i32, i32* %10, align 4
  %21 = icmp slt i32 %20, 23
  br i1 %21, label %22, label %45

; <label>:22:                                     ; preds = %19
  %23 = load %struct.lame_global_flags*, %struct.lame_global_flags** %4, align 8
  %24 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %23, i32 0, i32 51
  %25 = load i32, i32* %24, align 8
  %26 = load %struct.lame_global_flags*, %struct.lame_global_flags** %4, align 8
  %27 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %26, i32 0, i32 43
  %28 = load i32, i32* %27, align 8
  %29 = mul nsw i32 %28, 3
  %30 = add nsw i32 %25, %29
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [6 x %struct.scalefac_struct], [6 x %struct.scalefac_struct]* @sfBandIndex, i64 0, i64 %31
  %33 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* %32, i32 0, i32 0
  %34 = load i32, i32* %10, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [23 x i32], [23 x i32]* %33, i64 0, i64 %35
  %37 = load i32, i32* %36, align 4
  %38 = load i32, i32* %10, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [23 x i32], [23 x i32]* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i32 0, i32 0), i64 0, i64 %39
  store i32 %37, i32* %40, align 4
  br label %41

; <label>:41:                                     ; preds = %22
  %pgocount1 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_iteration_init, i64 0, i64 5)
  %42 = add i64 %pgocount1, 1
  store i64 %42, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_iteration_init, i64 0, i64 5)
  %43 = load i32, i32* %10, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, i32* %10, align 4
  br label %19

; <label>:45:                                     ; preds = %19
  store i32 0, i32* %10, align 4
  br label %46

; <label>:46:                                     ; preds = %68, %45
  %47 = load i32, i32* %10, align 4
  %48 = icmp slt i32 %47, 14
  br i1 %48, label %49, label %72

; <label>:49:                                     ; preds = %46
  %50 = load %struct.lame_global_flags*, %struct.lame_global_flags** %4, align 8
  %51 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %50, i32 0, i32 51
  %52 = load i32, i32* %51, align 8
  %53 = load %struct.lame_global_flags*, %struct.lame_global_flags** %4, align 8
  %54 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %53, i32 0, i32 43
  %55 = load i32, i32* %54, align 8
  %56 = mul nsw i32 %55, 3
  %57 = add nsw i32 %52, %56
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [6 x %struct.scalefac_struct], [6 x %struct.scalefac_struct]* @sfBandIndex, i64 0, i64 %58
  %60 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* %59, i32 0, i32 1
  %61 = load i32, i32* %10, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds [14 x i32], [14 x i32]* %60, i64 0, i64 %62
  %64 = load i32, i32* %63, align 4
  %65 = load i32, i32* %10, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [14 x i32], [14 x i32]* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i32 0, i32 1), i64 0, i64 %66
  store i32 %64, i32* %67, align 4
  br label %68

; <label>:68:                                     ; preds = %49
  %pgocount2 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_iteration_init, i64 0, i64 6)
  %69 = add i64 %pgocount2, 1
  store i64 %69, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_iteration_init, i64 0, i64 6)
  %70 = load i32, i32* %10, align 4
  %71 = add nsw i32 %70, 1
  store i32 %71, i32* %10, align 4
  br label %46

; <label>:72:                                     ; preds = %46
  %73 = load %struct.III_side_info_t*, %struct.III_side_info_t** %5, align 8
  %74 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %73, i32 0, i32 0
  store i32 0, i32* %74, align 8
  %75 = load %struct.lame_global_flags*, %struct.lame_global_flags** %4, align 8
  call void @compute_ath(%struct.lame_global_flags* %75, double* getelementptr inbounds ([21 x double], [21 x double]* @ATH_l, i32 0, i32 0), double* getelementptr inbounds ([21 x double], [21 x double]* @ATH_s, i32 0, i32 0))
  store i32 0, i32* %10, align 4
  br label %76

; <label>:76:                                     ; preds = %86, %72
  %77 = load i32, i32* %10, align 4
  %78 = icmp slt i32 %77, 8208
  br i1 %78, label %79, label %90

; <label>:79:                                     ; preds = %76
  %80 = load i32, i32* %10, align 4
  %81 = sitofp i32 %80 to double
  %82 = call double @pow(double %81, double 0x3FF5555555555555) #5
  %83 = load i32, i32* %10, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds [8208 x double], [8208 x double]* @pow43, i64 0, i64 %84
  store double %82, double* %85, align 8
  br label %86

; <label>:86:                                     ; preds = %79
  %pgocount3 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_iteration_init, i64 0, i64 7)
  %87 = add i64 %pgocount3, 1
  store i64 %87, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_iteration_init, i64 0, i64 7)
  %88 = load i32, i32* %10, align 4
  %89 = add nsw i32 %88, 1
  store i32 %89, i32* %10, align 4
  br label %76

; <label>:90:                                     ; preds = %76
  store i32 0, i32* %10, align 4
  br label %91

; <label>:91:                                     ; preds = %114, %90
  %92 = load i32, i32* %10, align 4
  %93 = icmp slt i32 %92, 8207
  br i1 %93, label %94, label %118

; <label>:94:                                     ; preds = %91
  %95 = load i32, i32* %10, align 4
  %96 = add nsw i32 %95, 1
  %97 = sitofp i32 %96 to double
  %98 = load i32, i32* %10, align 4
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds [8208 x double], [8208 x double]* @pow43, i64 0, i64 %99
  %101 = load double, double* %100, align 8
  %102 = load i32, i32* %10, align 4
  %103 = add nsw i32 %102, 1
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds [8208 x double], [8208 x double]* @pow43, i64 0, i64 %104
  %106 = load double, double* %105, align 8
  %107 = fadd double %101, %106
  %108 = fmul double 5.000000e-01, %107
  %109 = call double @pow(double %108, double 7.500000e-01) #5
  %110 = fsub double %97, %109
  %111 = load i32, i32* %10, align 4
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds [8208 x double], [8208 x double]* @adj43, i64 0, i64 %112
  store double %110, double* %113, align 8
  br label %114

; <label>:114:                                    ; preds = %94
  %pgocount4 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_iteration_init, i64 0, i64 8)
  %115 = add i64 %pgocount4, 1
  store i64 %115, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_iteration_init, i64 0, i64 8)
  %116 = load i32, i32* %10, align 4
  %117 = add nsw i32 %116, 1
  store i32 %117, i32* %10, align 4
  br label %91

; <label>:118:                                    ; preds = %91
  %119 = load i32, i32* %10, align 4
  %120 = sext i32 %119 to i64
  %121 = getelementptr inbounds [8208 x double], [8208 x double]* @adj43, i64 0, i64 %120
  store double 5.000000e-01, double* %121, align 8
  store double 0.000000e+00, double* getelementptr inbounds ([8208 x double], [8208 x double]* @adj43asm, i64 0, i64 0), align 16
  store i32 1, i32* %10, align 4
  br label %122

; <label>:122:                                    ; preds = %145, %118
  %123 = load i32, i32* %10, align 4
  %124 = icmp slt i32 %123, 8208
  br i1 %124, label %125, label %149

; <label>:125:                                    ; preds = %122
  %126 = load i32, i32* %10, align 4
  %127 = sitofp i32 %126 to double
  %128 = fsub double %127, 5.000000e-01
  %129 = load i32, i32* %10, align 4
  %130 = sub nsw i32 %129, 1
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds [8208 x double], [8208 x double]* @pow43, i64 0, i64 %131
  %133 = load double, double* %132, align 8
  %134 = load i32, i32* %10, align 4
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds [8208 x double], [8208 x double]* @pow43, i64 0, i64 %135
  %137 = load double, double* %136, align 8
  %138 = fadd double %133, %137
  %139 = fmul double 5.000000e-01, %138
  %140 = call double @pow(double %139, double 7.500000e-01) #5
  %141 = fsub double %128, %140
  %142 = load i32, i32* %10, align 4
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds [8208 x double], [8208 x double]* @adj43asm, i64 0, i64 %143
  store double %141, double* %144, align 8
  br label %145

; <label>:145:                                    ; preds = %125
  %pgocount5 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_iteration_init, i64 0, i64 9)
  %146 = add i64 %pgocount5, 1
  store i64 %146, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_iteration_init, i64 0, i64 9)
  %147 = load i32, i32* %10, align 4
  %148 = add nsw i32 %147, 1
  store i32 %148, i32* %10, align 4
  br label %122

; <label>:149:                                    ; preds = %122
  store i32 0, i32* %10, align 4
  br label %150

; <label>:150:                                    ; preds = %170, %149
  %151 = load i32, i32* %10, align 4
  %152 = icmp slt i32 %151, 256
  br i1 %152, label %153, label %174

; <label>:153:                                    ; preds = %150
  %154 = load i32, i32* %10, align 4
  %155 = sub nsw i32 %154, 210
  %156 = sitofp i32 %155 to double
  %157 = fmul double %156, -1.875000e-01
  %158 = call double @pow(double 2.000000e+00, double %157) #5
  %159 = load i32, i32* %10, align 4
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds [256 x double], [256 x double]* @ipow20, i64 0, i64 %160
  store double %158, double* %161, align 8
  %162 = load i32, i32* %10, align 4
  %163 = sub nsw i32 %162, 210
  %164 = sitofp i32 %163 to double
  %165 = fmul double %164, 2.500000e-01
  %166 = call double @pow(double 2.000000e+00, double %165) #5
  %167 = load i32, i32* %10, align 4
  %168 = sext i32 %167 to i64
  %169 = getelementptr inbounds [256 x double], [256 x double]* @pow20, i64 0, i64 %168
  store double %166, double* %169, align 8
  br label %170

; <label>:170:                                    ; preds = %153
  %pgocount6 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_iteration_init, i64 0, i64 10)
  %171 = add i64 %pgocount6, 1
  store i64 %171, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_iteration_init, i64 0, i64 10)
  %172 = load i32, i32* %10, align 4
  %173 = add nsw i32 %172, 1
  store i32 %173, i32* %10, align 4
  br label %150

; <label>:174:                                    ; preds = %150
  br label %175

; <label>:175:                                    ; preds = %174, %3
  store i32 0, i32* @convert_mdct, align 4
  store i32 0, i32* @reduce_sidechannel, align 4
  %176 = load %struct.lame_global_flags*, %struct.lame_global_flags** %4, align 8
  %177 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %176, i32 0, i32 52
  %178 = load i32, i32* %177, align 4
  %179 = icmp eq i32 %178, 2
  br i1 %179, label %180, label %182

; <label>:180:                                    ; preds = %175
  %pgocount7 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_iteration_init, i64 0, i64 12)
  %181 = add i64 %pgocount7, 1
  store i64 %181, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_iteration_init, i64 0, i64 12)
  store i32 1, i32* @convert_mdct, align 4
  store i32 1, i32* @reduce_sidechannel, align 4
  br label %182

; <label>:182:                                    ; preds = %180, %175
  store i32 0, i32* %9, align 4
  br label %183

; <label>:183:                                    ; preds = %229, %182
  %184 = load i32, i32* %9, align 4
  %185 = load %struct.lame_global_flags*, %struct.lame_global_flags** %4, align 8
  %186 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %185, i32 0, i32 45
  %187 = load i32, i32* %186, align 8
  %188 = icmp slt i32 %184, %187
  br i1 %188, label %189, label %232

; <label>:189:                                    ; preds = %183
  %pgocount8 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_iteration_init, i64 0, i64 3)
  %190 = add i64 %pgocount8, 1
  store i64 %190, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_iteration_init, i64 0, i64 3)
  store i32 0, i32* %8, align 4
  br label %191

; <label>:191:                                    ; preds = %225, %189
  %192 = load i32, i32* %8, align 4
  %193 = load %struct.lame_global_flags*, %struct.lame_global_flags** %4, align 8
  %194 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %193, i32 0, i32 46
  %195 = load i32, i32* %194, align 4
  %196 = icmp slt i32 %192, %195
  br i1 %196, label %197, label %228

; <label>:197:                                    ; preds = %191
  %198 = load %struct.III_side_info_t*, %struct.III_side_info_t** %5, align 8
  %199 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %198, i32 0, i32 4
  %200 = load i32, i32* %9, align 4
  %201 = sext i32 %200 to i64
  %202 = getelementptr inbounds [2 x %struct.anon], [2 x %struct.anon]* %199, i64 0, i64 %201
  %203 = getelementptr inbounds %struct.anon, %struct.anon* %202, i32 0, i32 0
  %204 = load i32, i32* %8, align 4
  %205 = sext i32 %204 to i64
  %206 = getelementptr inbounds [2 x %struct.gr_info_ss], [2 x %struct.gr_info_ss]* %203, i64 0, i64 %205
  %207 = bitcast %struct.gr_info_ss* %206 to %struct.gr_info*
  store %struct.gr_info* %207, %struct.gr_info** %7, align 8
  %208 = load %struct.gr_info*, %struct.gr_info** %7, align 8
  %209 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %208, i32 0, i32 6
  %210 = load i32, i32* %209, align 8
  %211 = icmp eq i32 %210, 2
  br i1 %211, label %212, label %218

; <label>:212:                                    ; preds = %197
  %pgocount9 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_iteration_init, i64 0, i64 1)
  %213 = add i64 %pgocount9, 1
  store i64 %213, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_iteration_init, i64 0, i64 1)
  %214 = load %struct.gr_info*, %struct.gr_info** %7, align 8
  %215 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %214, i32 0, i32 16
  store i32 0, i32* %215, align 8
  %216 = load %struct.gr_info*, %struct.gr_info** %7, align 8
  %217 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %216, i32 0, i32 17
  store i32 0, i32* %217, align 4
  br label %224

; <label>:218:                                    ; preds = %197
  %pgocount10 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_iteration_init, i64 0, i64 2)
  %219 = add i64 %pgocount10, 1
  store i64 %219, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_iteration_init, i64 0, i64 2)
  %220 = load %struct.gr_info*, %struct.gr_info** %7, align 8
  %221 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %220, i32 0, i32 16
  store i32 21, i32* %221, align 8
  %222 = load %struct.gr_info*, %struct.gr_info** %7, align 8
  %223 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %222, i32 0, i32 17
  store i32 12, i32* %223, align 4
  br label %224

; <label>:224:                                    ; preds = %218, %212
  br label %225

; <label>:225:                                    ; preds = %224
  %226 = load i32, i32* %8, align 4
  %227 = add nsw i32 %226, 1
  store i32 %227, i32* %8, align 4
  br label %191

; <label>:228:                                    ; preds = %191
  br label %229

; <label>:229:                                    ; preds = %228
  %230 = load i32, i32* %9, align 4
  %231 = add nsw i32 %230, 1
  store i32 %231, i32* %9, align 4
  br label %183

; <label>:232:                                    ; preds = %183
  store i32 0, i32* %8, align 4
  br label %233

; <label>:233:                                    ; preds = %258, %232
  %234 = load i32, i32* %8, align 4
  %235 = load %struct.lame_global_flags*, %struct.lame_global_flags** %4, align 8
  %236 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %235, i32 0, i32 46
  %237 = load i32, i32* %236, align 4
  %238 = icmp slt i32 %234, %237
  br i1 %238, label %239, label %261

; <label>:239:                                    ; preds = %233
  %pgocount11 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_iteration_init, i64 0, i64 4)
  %240 = add i64 %pgocount11, 1
  store i64 %240, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_iteration_init, i64 0, i64 4)
  store i32 0, i32* %10, align 4
  br label %241

; <label>:241:                                    ; preds = %254, %239
  %242 = load i32, i32* %10, align 4
  %243 = icmp slt i32 %242, 4
  br i1 %243, label %244, label %257

; <label>:244:                                    ; preds = %241
  %pgocount12 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_iteration_init, i64 0, i64 0)
  %245 = add i64 %pgocount12, 1
  store i64 %245, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_iteration_init, i64 0, i64 0)
  %246 = load %struct.III_side_info_t*, %struct.III_side_info_t** %5, align 8
  %247 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %246, i32 0, i32 3
  %248 = load i32, i32* %8, align 4
  %249 = sext i32 %248 to i64
  %250 = getelementptr inbounds [2 x [4 x i32]], [2 x [4 x i32]]* %247, i64 0, i64 %249
  %251 = load i32, i32* %10, align 4
  %252 = sext i32 %251 to i64
  %253 = getelementptr inbounds [4 x i32], [4 x i32]* %250, i64 0, i64 %252
  store i32 0, i32* %253, align 4
  br label %254

; <label>:254:                                    ; preds = %244
  %255 = load i32, i32* %10, align 4
  %256 = add nsw i32 %255, 1
  store i32 %256, i32* %10, align 4
  br label %241

; <label>:257:                                    ; preds = %241
  br label %258

; <label>:258:                                    ; preds = %257
  %259 = load i32, i32* %8, align 4
  %260 = add nsw i32 %259, 1
  store i32 %260, i32* %8, align 4
  br label %233

; <label>:261:                                    ; preds = %233
  %pgocount13 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_iteration_init, i64 0, i64 11)
  %262 = add i64 %pgocount13, 1
  store i64 %262, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_iteration_init, i64 0, i64 11)
  ret void
}

; Function Attrs: nounwind uwtable
define void @compute_ath(%struct.lame_global_flags*, double*, double*) #0 {
  %4 = alloca %struct.lame_global_flags*, align 8
  %5 = alloca double*, align 8
  %6 = alloca double*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca double, align 8
  %12 = alloca double, align 8
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %4, align 8
  store double* %1, double** %5, align 8
  store double* %2, double** %6, align 8
  %13 = load %struct.lame_global_flags*, %struct.lame_global_flags** %4, align 8
  %14 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %13, i32 0, i32 3
  %15 = load i32, i32* %14, align 8
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 1.000000e+03
  store double %17, double* %12, align 8
  store i32 0, i32* %7, align 4
  br label %18

; <label>:18:                                     ; preds = %75, %3
  %19 = load i32, i32* %7, align 4
  %20 = icmp slt i32 %19, 21
  br i1 %20, label %21, label %79

; <label>:21:                                     ; preds = %18
  %22 = load i32, i32* %7, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [23 x i32], [23 x i32]* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i32 0, i32 0), i64 0, i64 %23
  %25 = load i32, i32* %24, align 4
  store i32 %25, i32* %9, align 4
  %26 = load i32, i32* %7, align 4
  %27 = add nsw i32 %26, 1
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [23 x i32], [23 x i32]* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i32 0, i32 0), i64 0, i64 %28
  %30 = load i32, i32* %29, align 4
  store i32 %30, i32* %10, align 4
  %31 = load double*, double** %5, align 8
  %32 = load i32, i32* %7, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds double, double* %31, i64 %33
  store double 1.000000e+99, double* %34, align 8
  %35 = load i32, i32* %9, align 4
  store i32 %35, i32* %8, align 4
  br label %36

; <label>:36:                                     ; preds = %71, %21
  %37 = load i32, i32* %8, align 4
  %38 = load i32, i32* %10, align 4
  %39 = icmp slt i32 %37, %38
  br i1 %39, label %40, label %74

; <label>:40:                                     ; preds = %36
  %41 = load %struct.lame_global_flags*, %struct.lame_global_flags** %4, align 8
  %42 = load double, double* %12, align 8
  %43 = load i32, i32* %8, align 4
  %44 = sitofp i32 %43 to double
  %45 = fmul double %42, %44
  %46 = fdiv double %45, 1.152000e+03
  %47 = call double @ATHformula(%struct.lame_global_flags* %41, double %46)
  store double %47, double* %11, align 8
  %48 = load double*, double** %5, align 8
  %49 = load i32, i32* %7, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds double, double* %48, i64 %50
  %52 = load double, double* %51, align 8
  %53 = load double, double* %11, align 8
  %54 = fcmp olt double %52, %53
  br i1 %54, label %55, label %62

; <label>:55:                                     ; preds = %40
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_compute_ath, i64 0, i64 0)
  %56 = add i64 %pgocount, 1
  store i64 %56, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_compute_ath, i64 0, i64 0)
  %57 = load double*, double** %5, align 8
  %58 = load i32, i32* %7, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds double, double* %57, i64 %59
  %61 = load double, double* %60, align 8
  br label %65

; <label>:62:                                     ; preds = %40
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_compute_ath, i64 0, i64 1)
  %63 = add i64 %pgocount1, 1
  store i64 %63, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_compute_ath, i64 0, i64 1)
  %64 = load double, double* %11, align 8
  br label %65

; <label>:65:                                     ; preds = %62, %55
  %66 = phi double [ %61, %55 ], [ %64, %62 ]
  %67 = load double*, double** %5, align 8
  %68 = load i32, i32* %7, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds double, double* %67, i64 %69
  store double %66, double* %70, align 8
  br label %71

; <label>:71:                                     ; preds = %65
  %72 = load i32, i32* %8, align 4
  %73 = add nsw i32 %72, 1
  store i32 %73, i32* %8, align 4
  br label %36

; <label>:74:                                     ; preds = %36
  br label %75

; <label>:75:                                     ; preds = %74
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_compute_ath, i64 0, i64 4)
  %76 = add i64 %pgocount2, 1
  store i64 %76, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_compute_ath, i64 0, i64 4)
  %77 = load i32, i32* %7, align 4
  %78 = add nsw i32 %77, 1
  store i32 %78, i32* %7, align 4
  br label %18

; <label>:79:                                     ; preds = %18
  store i32 0, i32* %7, align 4
  br label %80

; <label>:80:                                     ; preds = %137, %79
  %81 = load i32, i32* %7, align 4
  %82 = icmp slt i32 %81, 12
  br i1 %82, label %83, label %141

; <label>:83:                                     ; preds = %80
  %84 = load i32, i32* %7, align 4
  %85 = sext i32 %84 to i64
  %86 = getelementptr inbounds [14 x i32], [14 x i32]* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i32 0, i32 1), i64 0, i64 %85
  %87 = load i32, i32* %86, align 4
  store i32 %87, i32* %9, align 4
  %88 = load i32, i32* %7, align 4
  %89 = add nsw i32 %88, 1
  %90 = sext i32 %89 to i64
  %91 = getelementptr inbounds [14 x i32], [14 x i32]* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i32 0, i32 1), i64 0, i64 %90
  %92 = load i32, i32* %91, align 4
  store i32 %92, i32* %10, align 4
  %93 = load double*, double** %6, align 8
  %94 = load i32, i32* %7, align 4
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds double, double* %93, i64 %95
  store double 1.000000e+99, double* %96, align 8
  %97 = load i32, i32* %9, align 4
  store i32 %97, i32* %8, align 4
  br label %98

; <label>:98:                                     ; preds = %133, %83
  %99 = load i32, i32* %8, align 4
  %100 = load i32, i32* %10, align 4
  %101 = icmp slt i32 %99, %100
  br i1 %101, label %102, label %136

; <label>:102:                                    ; preds = %98
  %103 = load %struct.lame_global_flags*, %struct.lame_global_flags** %4, align 8
  %104 = load double, double* %12, align 8
  %105 = load i32, i32* %8, align 4
  %106 = sitofp i32 %105 to double
  %107 = fmul double %104, %106
  %108 = fdiv double %107, 3.840000e+02
  %109 = call double @ATHformula(%struct.lame_global_flags* %103, double %108)
  store double %109, double* %11, align 8
  %110 = load double*, double** %6, align 8
  %111 = load i32, i32* %7, align 4
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds double, double* %110, i64 %112
  %114 = load double, double* %113, align 8
  %115 = load double, double* %11, align 8
  %116 = fcmp olt double %114, %115
  br i1 %116, label %117, label %124

; <label>:117:                                    ; preds = %102
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_compute_ath, i64 0, i64 2)
  %118 = add i64 %pgocount3, 1
  store i64 %118, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_compute_ath, i64 0, i64 2)
  %119 = load double*, double** %6, align 8
  %120 = load i32, i32* %7, align 4
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds double, double* %119, i64 %121
  %123 = load double, double* %122, align 8
  br label %127

; <label>:124:                                    ; preds = %102
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_compute_ath, i64 0, i64 3)
  %125 = add i64 %pgocount4, 1
  store i64 %125, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_compute_ath, i64 0, i64 3)
  %126 = load double, double* %11, align 8
  br label %127

; <label>:127:                                    ; preds = %124, %117
  %128 = phi double [ %123, %117 ], [ %126, %124 ]
  %129 = load double*, double** %6, align 8
  %130 = load i32, i32* %7, align 4
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds double, double* %129, i64 %131
  store double %128, double* %132, align 8
  br label %133

; <label>:133:                                    ; preds = %127
  %134 = load i32, i32* %8, align 4
  %135 = add nsw i32 %134, 1
  store i32 %135, i32* %8, align 4
  br label %98

; <label>:136:                                    ; preds = %98
  br label %137

; <label>:137:                                    ; preds = %136
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_compute_ath, i64 0, i64 5)
  %138 = add i64 %pgocount5, 1
  store i64 %138, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_compute_ath, i64 0, i64 5)
  %139 = load i32, i32* %7, align 4
  %140 = add nsw i32 %139, 1
  store i32 %140, i32* %7, align 4
  br label %80

; <label>:141:                                    ; preds = %80
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_compute_ath, i64 0, i64 6)
  %142 = add i64 %pgocount6, 1
  store i64 %142, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_compute_ath, i64 0, i64 6)
  ret void
}

; Function Attrs: nounwind
declare double @pow(double, double) #1

; Function Attrs: nounwind uwtable
define double @ATHformula(%struct.lame_global_flags*, double) #0 {
  %3 = alloca %struct.lame_global_flags*, align 8
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %3, align 8
  store double %1, double* %4, align 8
  %6 = load double, double* %4, align 8
  %7 = fcmp ogt double 2.000000e-02, %6
  br i1 %7, label %8, label %10

; <label>:8:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_ATHformula, i64 0, i64 0)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_ATHformula, i64 0, i64 0)
  br label %13

; <label>:10:                                     ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_ATHformula, i64 0, i64 1)
  %11 = add i64 %pgocount1, 1
  store i64 %11, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_ATHformula, i64 0, i64 1)
  %12 = load double, double* %4, align 8
  br label %13

; <label>:13:                                     ; preds = %10, %8
  %14 = phi double [ 2.000000e-02, %8 ], [ %12, %10 ]
  store double %14, double* %4, align 8
  %15 = load double, double* %4, align 8
  %16 = call double @pow(double %15, double -8.000000e-01) #5
  %17 = fmul double 3.640000e+00, %16
  %18 = load double, double* %4, align 8
  %19 = fsub double %18, 3.300000e+00
  %20 = call double @pow(double %19, double 2.000000e+00) #5
  %21 = fmul double -6.000000e-01, %20
  %22 = call double @exp(double %21) #5
  %23 = fmul double 6.500000e+00, %22
  %24 = fsub double %17, %23
  %25 = load double, double* %4, align 8
  %26 = call double @pow(double %25, double 4.000000e+00) #5
  %27 = fmul double 1.000000e-03, %26
  %28 = fadd double %24, %27
  store double %28, double* %5, align 8
  %29 = load %struct.lame_global_flags*, %struct.lame_global_flags** %3, align 8
  %30 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %29, i32 0, i32 34
  %31 = load i32, i32* %30, align 4
  %32 = icmp ne i32 %31, 0
  br i1 %32, label %33, label %36

; <label>:33:                                     ; preds = %13
  %34 = load double, double* %5, align 8
  %35 = fsub double %34, 2.000000e+02
  store double %35, double* %5, align 8
  br label %40

; <label>:36:                                     ; preds = %13
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_ATHformula, i64 0, i64 2)
  %37 = add i64 %pgocount2, 1
  store i64 %37, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_ATHformula, i64 0, i64 2)
  %38 = load double, double* %5, align 8
  %39 = fsub double %38, 1.140000e+02
  store double %39, double* %5, align 8
  br label %40

; <label>:40:                                     ; preds = %36, %33
  %41 = load double, double* %5, align 8
  %42 = fdiv double %41, 1.000000e+01
  %43 = call double @pow(double 1.000000e+01, double %42) #5
  store double %43, double* %5, align 8
  %44 = load double, double* %5, align 8
  ret double %44
}

; Function Attrs: nounwind
declare double @exp(double) #1

; Function Attrs: nounwind uwtable
define void @ms_convert([576 x double]*, [576 x double]*) #0 {
  %3 = alloca [576 x double]*, align 8
  %4 = alloca [576 x double]*, align 8
  %5 = alloca i32, align 4
  %6 = alloca double, align 8
  %7 = alloca double, align 8
  store [576 x double]* %0, [576 x double]** %3, align 8
  store [576 x double]* %1, [576 x double]** %4, align 8
  store i32 0, i32* %5, align 4
  br label %8

; <label>:8:                                      ; preds = %42, %2
  %9 = load i32, i32* %5, align 4
  %10 = icmp slt i32 %9, 576
  br i1 %10, label %11, label %46

; <label>:11:                                     ; preds = %8
  %12 = load [576 x double]*, [576 x double]** %4, align 8
  %13 = getelementptr inbounds [576 x double], [576 x double]* %12, i64 0
  %14 = load i32, i32* %5, align 4
  %15 = sext i32 %14 to i64
  %16 = getelementptr inbounds [576 x double], [576 x double]* %13, i64 0, i64 %15
  %17 = load double, double* %16, align 8
  store double %17, double* %6, align 8
  %18 = load [576 x double]*, [576 x double]** %4, align 8
  %19 = getelementptr inbounds [576 x double], [576 x double]* %18, i64 1
  %20 = load i32, i32* %5, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [576 x double], [576 x double]* %19, i64 0, i64 %21
  %23 = load double, double* %22, align 8
  store double %23, double* %7, align 8
  %24 = load double, double* %6, align 8
  %25 = load double, double* %7, align 8
  %26 = fadd double %24, %25
  %27 = fmul double %26, 0x3FE6A09E667F3BCD
  %28 = load [576 x double]*, [576 x double]** %3, align 8
  %29 = getelementptr inbounds [576 x double], [576 x double]* %28, i64 0
  %30 = load i32, i32* %5, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [576 x double], [576 x double]* %29, i64 0, i64 %31
  store double %27, double* %32, align 8
  %33 = load double, double* %6, align 8
  %34 = load double, double* %7, align 8
  %35 = fsub double %33, %34
  %36 = fmul double %35, 0x3FE6A09E667F3BCD
  %37 = load [576 x double]*, [576 x double]** %3, align 8
  %38 = getelementptr inbounds [576 x double], [576 x double]* %37, i64 1
  %39 = load i32, i32* %5, align 4
  %40 = sext i32 %39 to i64
  %41 = getelementptr inbounds [576 x double], [576 x double]* %38, i64 0, i64 %40
  store double %36, double* %41, align 8
  br label %42

; <label>:42:                                     ; preds = %11
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_ms_convert, i64 0, i64 0)
  %43 = add i64 %pgocount, 1
  store i64 %43, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_ms_convert, i64 0, i64 0)
  %44 = load i32, i32* %5, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, i32* %5, align 4
  br label %8

; <label>:46:                                     ; preds = %8
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_ms_convert, i64 0, i64 1)
  %47 = add i64 %pgocount1, 1
  store i64 %47, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_ms_convert, i64 0, i64 1)
  ret void
}

; Function Attrs: nounwind uwtable
define void @on_pe(%struct.lame_global_flags*, [2 x double]*, %struct.III_side_info_t*, i32*, i32, i32) #0 {
  %7 = alloca %struct.lame_global_flags*, align 8
  %8 = alloca [2 x double]*, align 8
  %9 = alloca %struct.III_side_info_t*, align 8
  %10 = alloca i32*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca %struct.gr_info*, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca [2 x i32], align 4
  %18 = alloca i32, align 4
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %7, align 8
  store [2 x double]* %1, [2 x double]** %8, align 8
  store %struct.III_side_info_t* %2, %struct.III_side_info_t** %9, align 8
  store i32* %3, i32** %10, align 8
  store i32 %4, i32* %11, align 4
  store i32 %5, i32* %12, align 4
  %19 = load i32, i32* %11, align 4
  %20 = load i32, i32* %12, align 4
  call void @ResvMaxBits(i32 %19, i32* %15, i32* %14, i32 %20)
  store i32 0, i32* %18, align 4
  br label %21

; <label>:21:                                     ; preds = %156, %6
  %22 = load i32, i32* %18, align 4
  %23 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %24 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %23, i32 0, i32 46
  %25 = load i32, i32* %24, align 4
  %26 = icmp slt i32 %22, %25
  br i1 %26, label %27, label %160

; <label>:27:                                     ; preds = %21
  %28 = load %struct.III_side_info_t*, %struct.III_side_info_t** %9, align 8
  %29 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %28, i32 0, i32 4
  %30 = load i32, i32* %12, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [2 x %struct.anon], [2 x %struct.anon]* %29, i64 0, i64 %31
  %33 = getelementptr inbounds %struct.anon, %struct.anon* %32, i32 0, i32 0
  %34 = load i32, i32* %18, align 4
  %35 = sext i32 %34 to i64
  %36 = getelementptr inbounds [2 x %struct.gr_info_ss], [2 x %struct.gr_info_ss]* %33, i64 0, i64 %35
  %37 = getelementptr inbounds %struct.gr_info_ss, %struct.gr_info_ss* %36, i32 0, i32 0
  store %struct.gr_info* %37, %struct.gr_info** %13, align 8
  %38 = load i32, i32* %15, align 4
  %39 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %40 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %39, i32 0, i32 46
  %41 = load i32, i32* %40, align 4
  %42 = sdiv i32 %38, %41
  %43 = load i32*, i32** %10, align 8
  %44 = load i32, i32* %18, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds i32, i32* %43, i64 %45
  store i32 %42, i32* %46, align 4
  store i32 0, i32* %16, align 4
  %47 = load [2 x double]*, [2 x double]** %8, align 8
  %48 = load i32, i32* %12, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [2 x double], [2 x double]* %47, i64 %49
  %51 = load i32, i32* %18, align 4
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [2 x double], [2 x double]* %50, i64 0, i64 %52
  %54 = load double, double* %53, align 8
  %55 = fsub double %54, 7.500000e+02
  %56 = fdiv double %55, 1.550000e+00
  %57 = fptosi double %56 to i32
  %58 = load i32, i32* %18, align 4
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [2 x i32], [2 x i32]* %17, i64 0, i64 %59
  store i32 %57, i32* %60, align 4
  %61 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %62 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %61, i32 0, i32 6
  %63 = load i32, i32* %62, align 8
  %64 = icmp eq i32 %63, 2
  br i1 %64, label %65, label %78

; <label>:65:                                     ; preds = %27
  %66 = load i32, i32* %18, align 4
  %67 = sext i32 %66 to i64
  %68 = getelementptr inbounds [2 x i32], [2 x i32]* %17, i64 0, i64 %67
  %69 = load i32, i32* %68, align 4
  %70 = icmp slt i32 %69, 500
  br i1 %70, label %71, label %76

; <label>:71:                                     ; preds = %65
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_on_pe, i64 0, i64 5)
  %72 = add i64 %pgocount, 1
  store i64 %72, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_on_pe, i64 0, i64 5)
  %73 = load i32, i32* %18, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [2 x i32], [2 x i32]* %17, i64 0, i64 %74
  store i32 500, i32* %75, align 4
  br label %76

; <label>:76:                                     ; preds = %71, %65
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_on_pe, i64 0, i64 1)
  %77 = add i64 %pgocount1, 1
  store i64 %77, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_on_pe, i64 0, i64 1)
  br label %78

; <label>:78:                                     ; preds = %76, %27
  %79 = load i32, i32* %18, align 4
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [2 x i32], [2 x i32]* %17, i64 0, i64 %80
  %82 = load i32, i32* %81, align 4
  %83 = icmp slt i32 %82, 0
  br i1 %83, label %84, label %89

; <label>:84:                                     ; preds = %78
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_on_pe, i64 0, i64 4)
  %85 = add i64 %pgocount2, 1
  store i64 %85, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_on_pe, i64 0, i64 4)
  %86 = load i32, i32* %18, align 4
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds [2 x i32], [2 x i32]* %17, i64 0, i64 %87
  store i32 0, i32* %88, align 4
  br label %89

; <label>:89:                                     ; preds = %84, %78
  %90 = load i32, i32* %18, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [2 x i32], [2 x i32]* %17, i64 0, i64 %91
  %93 = load i32, i32* %92, align 4
  %94 = load i32, i32* %16, align 4
  %95 = add nsw i32 %94, %93
  store i32 %95, i32* %16, align 4
  %96 = load i32, i32* %16, align 4
  %97 = load i32, i32* %14, align 4
  %98 = icmp sgt i32 %96, %97
  br i1 %98, label %99, label %112

; <label>:99:                                     ; preds = %89
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_on_pe, i64 0, i64 2)
  %100 = add i64 %pgocount3, 1
  store i64 %100, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_on_pe, i64 0, i64 2)
  %101 = load i32, i32* %14, align 4
  %102 = load i32, i32* %18, align 4
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds [2 x i32], [2 x i32]* %17, i64 0, i64 %103
  %105 = load i32, i32* %104, align 4
  %106 = mul nsw i32 %101, %105
  %107 = load i32, i32* %16, align 4
  %108 = sdiv i32 %106, %107
  %109 = load i32, i32* %18, align 4
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds [2 x i32], [2 x i32]* %17, i64 0, i64 %110
  store i32 %108, i32* %111, align 4
  br label %112

; <label>:112:                                    ; preds = %99, %89
  %113 = load i32*, i32** %10, align 8
  %114 = load i32, i32* %18, align 4
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds i32, i32* %113, i64 %115
  %117 = load i32, i32* %116, align 4
  %118 = load i32, i32* %18, align 4
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds [2 x i32], [2 x i32]* %17, i64 0, i64 %119
  %121 = load i32, i32* %120, align 4
  %122 = add nsw i32 %117, %121
  %123 = icmp sgt i32 %122, 4095
  br i1 %123, label %124, label %135

; <label>:124:                                    ; preds = %112
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_on_pe, i64 0, i64 3)
  %125 = add i64 %pgocount4, 1
  store i64 %125, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_on_pe, i64 0, i64 3)
  %126 = load i32*, i32** %10, align 8
  %127 = load i32, i32* %18, align 4
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds i32, i32* %126, i64 %128
  %130 = load i32, i32* %129, align 4
  %131 = sub nsw i32 4095, %130
  %132 = load i32, i32* %18, align 4
  %133 = sext i32 %132 to i64
  %134 = getelementptr inbounds [2 x i32], [2 x i32]* %17, i64 0, i64 %133
  store i32 %131, i32* %134, align 4
  br label %135

; <label>:135:                                    ; preds = %124, %112
  %136 = load i32*, i32** %10, align 8
  %137 = load i32, i32* %18, align 4
  %138 = sext i32 %137 to i64
  %139 = getelementptr inbounds i32, i32* %136, i64 %138
  %140 = load i32, i32* %139, align 4
  %141 = load i32, i32* %18, align 4
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds [2 x i32], [2 x i32]* %17, i64 0, i64 %142
  %144 = load i32, i32* %143, align 4
  %145 = add nsw i32 %140, %144
  %146 = load i32*, i32** %10, align 8
  %147 = load i32, i32* %18, align 4
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds i32, i32* %146, i64 %148
  store i32 %145, i32* %149, align 4
  %150 = load i32, i32* %18, align 4
  %151 = sext i32 %150 to i64
  %152 = getelementptr inbounds [2 x i32], [2 x i32]* %17, i64 0, i64 %151
  %153 = load i32, i32* %152, align 4
  %154 = load i32, i32* %14, align 4
  %155 = sub nsw i32 %154, %153
  store i32 %155, i32* %14, align 4
  br label %156

; <label>:156:                                    ; preds = %135
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_on_pe, i64 0, i64 0)
  %157 = add i64 %pgocount5, 1
  store i64 %157, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_on_pe, i64 0, i64 0)
  %158 = load i32, i32* %18, align 4
  %159 = add nsw i32 %158, 1
  store i32 %159, i32* %18, align 4
  br label %21

; <label>:160:                                    ; preds = %21
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_on_pe, i64 0, i64 6)
  %161 = add i64 %pgocount6, 1
  store i64 %161, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_on_pe, i64 0, i64 6)
  ret void
}

declare void @ResvMaxBits(i32, i32*, i32*, i32) #2

; Function Attrs: nounwind uwtable
define void @reduce_side(i32*, double, i32) #0 {
  %4 = alloca i32*, align 8
  %5 = alloca double, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca float, align 4
  %10 = alloca i32, align 4
  store i32* %0, i32** %4, align 8
  store double %1, double* %5, align 8
  store i32 %2, i32* %6, align 4
  store i32 2, i32* %8, align 4
  %11 = load double, double* %5, align 8
  %12 = fsub double 5.000000e-01, %11
  %13 = fmul double 3.300000e-01, %12
  %14 = fdiv double %13, 5.000000e-01
  %15 = fptrunc double %14 to float
  store float %15, float* %9, align 4
  %16 = load float, float* %9, align 4
  %17 = fcmp olt float %16, 0.000000e+00
  br i1 %17, label %18, label %20

; <label>:18:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_reduce_side, i64 0, i64 4)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_reduce_side, i64 0, i64 4)
  store float 0.000000e+00, float* %9, align 4
  br label %20

; <label>:20:                                     ; preds = %18, %3
  %21 = load i32*, i32** %4, align 8
  %22 = getelementptr inbounds i32, i32* %21, i64 1
  %23 = load i32, i32* %22, align 4
  %24 = icmp sge i32 %23, 125
  br i1 %24, label %25, label %77

; <label>:25:                                     ; preds = %20
  %26 = load i32*, i32** %4, align 8
  %27 = getelementptr inbounds i32, i32* %26, i64 1
  %28 = load i32, i32* %27, align 4
  %29 = sitofp i32 %28 to float
  %30 = load i32*, i32** %4, align 8
  %31 = getelementptr inbounds i32, i32* %30, i64 1
  %32 = load i32, i32* %31, align 4
  %33 = sitofp i32 %32 to float
  %34 = load float, float* %9, align 4
  %35 = fmul float %33, %34
  %36 = fsub float %29, %35
  %37 = fcmp ogt float %36, 1.250000e+02
  br i1 %37, label %38, label %64

; <label>:38:                                     ; preds = %25
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_reduce_side, i64 0, i64 5)
  %39 = add i64 %pgocount1, 1
  store i64 %39, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_reduce_side, i64 0, i64 5)
  %40 = load i32*, i32** %4, align 8
  %41 = getelementptr inbounds i32, i32* %40, i64 1
  %42 = load i32, i32* %41, align 4
  %43 = sitofp i32 %42 to float
  %44 = load float, float* %9, align 4
  %45 = fmul float %43, %44
  %46 = load i32*, i32** %4, align 8
  %47 = getelementptr inbounds i32, i32* %46, i64 0
  %48 = load i32, i32* %47, align 4
  %49 = sitofp i32 %48 to float
  %50 = fadd float %49, %45
  %51 = fptosi float %50 to i32
  store i32 %51, i32* %47, align 4
  %52 = load i32*, i32** %4, align 8
  %53 = getelementptr inbounds i32, i32* %52, i64 1
  %54 = load i32, i32* %53, align 4
  %55 = sitofp i32 %54 to float
  %56 = load float, float* %9, align 4
  %57 = fmul float %55, %56
  %58 = load i32*, i32** %4, align 8
  %59 = getelementptr inbounds i32, i32* %58, i64 1
  %60 = load i32, i32* %59, align 4
  %61 = sitofp i32 %60 to float
  %62 = fsub float %61, %57
  %63 = fptosi float %62 to i32
  store i32 %63, i32* %59, align 4
  br label %76

; <label>:64:                                     ; preds = %25
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_reduce_side, i64 0, i64 6)
  %65 = add i64 %pgocount2, 1
  store i64 %65, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_reduce_side, i64 0, i64 6)
  %66 = load i32*, i32** %4, align 8
  %67 = getelementptr inbounds i32, i32* %66, i64 1
  %68 = load i32, i32* %67, align 4
  %69 = sub nsw i32 %68, 125
  %70 = load i32*, i32** %4, align 8
  %71 = getelementptr inbounds i32, i32* %70, i64 0
  %72 = load i32, i32* %71, align 4
  %73 = add nsw i32 %72, %69
  store i32 %73, i32* %71, align 4
  %74 = load i32*, i32** %4, align 8
  %75 = getelementptr inbounds i32, i32* %74, i64 1
  store i32 125, i32* %75, align 4
  br label %76

; <label>:76:                                     ; preds = %64, %38
  br label %77

; <label>:77:                                     ; preds = %76, %20
  store i32 0, i32* %7, align 4
  br label %78

; <label>:78:                                     ; preds = %111, %77
  %79 = load i32, i32* %7, align 4
  %80 = load i32, i32* %8, align 4
  %81 = icmp slt i32 %79, %80
  br i1 %81, label %82, label %114

; <label>:82:                                     ; preds = %78
  %83 = load i32, i32* %6, align 4
  %84 = sdiv i32 %83, 2
  %85 = add nsw i32 %84, 1200
  %86 = icmp slt i32 4095, %85
  br i1 %86, label %87, label %89

; <label>:87:                                     ; preds = %82
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_reduce_side, i64 0, i64 0)
  %88 = add i64 %pgocount3, 1
  store i64 %88, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_reduce_side, i64 0, i64 0)
  br label %94

; <label>:89:                                     ; preds = %82
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_reduce_side, i64 0, i64 1)
  %90 = add i64 %pgocount4, 1
  store i64 %90, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_reduce_side, i64 0, i64 1)
  %91 = load i32, i32* %6, align 4
  %92 = sdiv i32 %91, 2
  %93 = add nsw i32 %92, 1200
  br label %94

; <label>:94:                                     ; preds = %89, %87
  %95 = phi i32 [ 4095, %87 ], [ %93, %89 ]
  store i32 %95, i32* %10, align 4
  %96 = load i32*, i32** %4, align 8
  %97 = load i32, i32* %7, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds i32, i32* %96, i64 %98
  %100 = load i32, i32* %99, align 4
  %101 = load i32, i32* %10, align 4
  %102 = icmp sgt i32 %100, %101
  br i1 %102, label %103, label %110

; <label>:103:                                    ; preds = %94
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_reduce_side, i64 0, i64 2)
  %104 = add i64 %pgocount5, 1
  store i64 %104, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_reduce_side, i64 0, i64 2)
  %105 = load i32, i32* %10, align 4
  %106 = load i32*, i32** %4, align 8
  %107 = load i32, i32* %7, align 4
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds i32, i32* %106, i64 %108
  store i32 %105, i32* %109, align 4
  br label %110

; <label>:110:                                    ; preds = %103, %94
  br label %111

; <label>:111:                                    ; preds = %110
  %112 = load i32, i32* %7, align 4
  %113 = add nsw i32 %112, 1
  store i32 %113, i32* %7, align 4
  br label %78

; <label>:114:                                    ; preds = %78
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_reduce_side, i64 0, i64 3)
  %115 = add i64 %pgocount6, 1
  store i64 %115, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_reduce_side, i64 0, i64 3)
  ret void
}

; Function Attrs: nounwind uwtable
define i32 @inner_loop(%struct.lame_global_flags*, double*, i32*, i32, %struct.gr_info*) #0 {
  %6 = alloca %struct.lame_global_flags*, align 8
  %7 = alloca double*, align 8
  %8 = alloca i32*, align 8
  %9 = alloca i32, align 4
  %10 = alloca %struct.gr_info*, align 8
  %11 = alloca i32, align 4
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %6, align 8
  store double* %1, double** %7, align 8
  store i32* %2, i32** %8, align 8
  store i32 %3, i32* %9, align 4
  store %struct.gr_info* %4, %struct.gr_info** %10, align 8
  %12 = load i32, i32* %9, align 4
  %13 = icmp sge i32 %12, 0
  br i1 %13, label %14, label %15

; <label>:14:                                     ; preds = %5
  br label %18

; <label>:15:                                     ; preds = %5
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_inner_loop, i64 0, i64 2)
  %16 = add i64 %pgocount, 1
  store i64 %16, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_inner_loop, i64 0, i64 2)
  call void @__assert_fail(i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i32 0, i32 0), i32 431, i8* getelementptr inbounds ([69 x i8], [69 x i8]* @__PRETTY_FUNCTION__.inner_loop, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %18

; <label>:18:                                     ; preds = %17, %14
  %19 = load %struct.gr_info*, %struct.gr_info** %10, align 8
  %20 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %19, i32 0, i32 3
  %21 = load i32, i32* %20, align 4
  %22 = add i32 %21, -1
  store i32 %22, i32* %20, align 4
  br label %23

; <label>:23:                                     ; preds = %34, %18
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_inner_loop, i64 0, i64 0)
  %24 = add i64 %pgocount1, 1
  store i64 %24, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_inner_loop, i64 0, i64 0)
  %25 = load %struct.gr_info*, %struct.gr_info** %10, align 8
  %26 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %25, i32 0, i32 3
  %27 = load i32, i32* %26, align 4
  %28 = add i32 %27, 1
  store i32 %28, i32* %26, align 4
  %29 = load %struct.lame_global_flags*, %struct.lame_global_flags** %6, align 8
  %30 = load i32*, i32** %8, align 8
  %31 = load double*, double** %7, align 8
  %32 = load %struct.gr_info*, %struct.gr_info** %10, align 8
  %33 = call i32 @count_bits(%struct.lame_global_flags* %29, i32* %30, double* %31, %struct.gr_info* %32)
  store i32 %33, i32* %11, align 4
  br label %34

; <label>:34:                                     ; preds = %23
  %35 = load i32, i32* %11, align 4
  %36 = load i32, i32* %9, align 4
  %37 = icmp sgt i32 %35, %36
  br i1 %37, label %23, label %38

; <label>:38:                                     ; preds = %34
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_inner_loop, i64 0, i64 1)
  %39 = add i64 %pgocount2, 1
  store i64 %39, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_inner_loop, i64 0, i64 1)
  %40 = load i32, i32* %11, align 4
  ret i32 %40
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #3

declare i32 @count_bits(%struct.lame_global_flags*, i32*, double*, %struct.gr_info*) #2

; Function Attrs: nounwind uwtable
define i32 @scale_bitcount(%struct.III_scalefac_t*, %struct.gr_info*) #0 {
  %3 = alloca %struct.III_scalefac_t*, align 8
  %4 = alloca %struct.gr_info*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32*, align 8
  store %struct.III_scalefac_t* %0, %struct.III_scalefac_t** %3, align 8
  store %struct.gr_info* %1, %struct.gr_info** %4, align 8
  store i32 0, i32* %8, align 4
  store i32 0, i32* %9, align 4
  store i32 2, i32* %10, align 4
  %12 = load %struct.gr_info*, %struct.gr_info** %4, align 8
  %13 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %12, i32 0, i32 6
  %14 = load i32, i32* %13, align 8
  %15 = icmp eq i32 %14, 2
  br i1 %15, label %16, label %91

; <label>:16:                                     ; preds = %2
  store i32* getelementptr inbounds ([16 x i32], [16 x i32]* @scale_bitcount.slen1_tab, i32 0, i32 0), i32** %11, align 8
  store i32 0, i32* %5, align 4
  br label %17

; <label>:17:                                     ; preds = %85, %16
  %18 = load i32, i32* %5, align 4
  %19 = icmp slt i32 %18, 3
  br i1 %19, label %20, label %89

; <label>:20:                                     ; preds = %17
  store i32 0, i32* %7, align 4
  br label %21

; <label>:21:                                     ; preds = %48, %20
  %22 = load i32, i32* %7, align 4
  %23 = icmp slt i32 %22, 6
  br i1 %23, label %24, label %52

; <label>:24:                                     ; preds = %21
  %25 = load %struct.III_scalefac_t*, %struct.III_scalefac_t** %3, align 8
  %26 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %25, i32 0, i32 1
  %27 = load i32, i32* %7, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [13 x [3 x i32]], [13 x [3 x i32]]* %26, i64 0, i64 %28
  %30 = load i32, i32* %5, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [3 x i32], [3 x i32]* %29, i64 0, i64 %31
  %33 = load i32, i32* %32, align 4
  %34 = load i32, i32* %8, align 4
  %35 = icmp sgt i32 %33, %34
  br i1 %35, label %36, label %47

; <label>:36:                                     ; preds = %24
  %pgocount = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_scale_bitcount, i64 0, i64 2)
  %37 = add i64 %pgocount, 1
  store i64 %37, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_scale_bitcount, i64 0, i64 2)
  %38 = load %struct.III_scalefac_t*, %struct.III_scalefac_t** %3, align 8
  %39 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %38, i32 0, i32 1
  %40 = load i32, i32* %7, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [13 x [3 x i32]], [13 x [3 x i32]]* %39, i64 0, i64 %41
  %43 = load i32, i32* %5, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [3 x i32], [3 x i32]* %42, i64 0, i64 %44
  %46 = load i32, i32* %45, align 4
  store i32 %46, i32* %8, align 4
  br label %47

; <label>:47:                                     ; preds = %36, %24
  br label %48

; <label>:48:                                     ; preds = %47
  %pgocount1 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_scale_bitcount, i64 0, i64 0)
  %49 = add i64 %pgocount1, 1
  store i64 %49, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_scale_bitcount, i64 0, i64 0)
  %50 = load i32, i32* %7, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, i32* %7, align 4
  br label %21

; <label>:52:                                     ; preds = %21
  store i32 6, i32* %7, align 4
  br label %53

; <label>:53:                                     ; preds = %80, %52
  %54 = load i32, i32* %7, align 4
  %55 = icmp slt i32 %54, 12
  br i1 %55, label %56, label %84

; <label>:56:                                     ; preds = %53
  %57 = load %struct.III_scalefac_t*, %struct.III_scalefac_t** %3, align 8
  %58 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %57, i32 0, i32 1
  %59 = load i32, i32* %7, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [13 x [3 x i32]], [13 x [3 x i32]]* %58, i64 0, i64 %60
  %62 = load i32, i32* %5, align 4
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds [3 x i32], [3 x i32]* %61, i64 0, i64 %63
  %65 = load i32, i32* %64, align 4
  %66 = load i32, i32* %9, align 4
  %67 = icmp sgt i32 %65, %66
  br i1 %67, label %68, label %79

; <label>:68:                                     ; preds = %56
  %pgocount2 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_scale_bitcount, i64 0, i64 3)
  %69 = add i64 %pgocount2, 1
  store i64 %69, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_scale_bitcount, i64 0, i64 3)
  %70 = load %struct.III_scalefac_t*, %struct.III_scalefac_t** %3, align 8
  %71 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %70, i32 0, i32 1
  %72 = load i32, i32* %7, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [13 x [3 x i32]], [13 x [3 x i32]]* %71, i64 0, i64 %73
  %75 = load i32, i32* %5, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [3 x i32], [3 x i32]* %74, i64 0, i64 %76
  %78 = load i32, i32* %77, align 4
  store i32 %78, i32* %9, align 4
  br label %79

; <label>:79:                                     ; preds = %68, %56
  br label %80

; <label>:80:                                     ; preds = %79
  %pgocount3 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_scale_bitcount, i64 0, i64 1)
  %81 = add i64 %pgocount3, 1
  store i64 %81, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_scale_bitcount, i64 0, i64 1)
  %82 = load i32, i32* %7, align 4
  %83 = add nsw i32 %82, 1
  store i32 %83, i32* %7, align 4
  br label %53

; <label>:84:                                     ; preds = %53
  br label %85

; <label>:85:                                     ; preds = %84
  %pgocount4 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_scale_bitcount, i64 0, i64 5)
  %86 = add i64 %pgocount4, 1
  store i64 %86, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_scale_bitcount, i64 0, i64 5)
  %87 = load i32, i32* %5, align 4
  %88 = add nsw i32 %87, 1
  store i32 %88, i32* %5, align 4
  br label %17

; <label>:89:                                     ; preds = %17
  %pgocount5 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_scale_bitcount, i64 0, i64 15)
  %90 = add i64 %pgocount5, 1
  store i64 %90, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_scale_bitcount, i64 0, i64 15)
  br label %202

; <label>:91:                                     ; preds = %2
  store i32* getelementptr inbounds ([16 x i32], [16 x i32]* @scale_bitcount.slen2_tab, i32 0, i32 0), i32** %11, align 8
  store i32 0, i32* %7, align 4
  br label %92

; <label>:92:                                     ; preds = %113, %91
  %93 = load i32, i32* %7, align 4
  %94 = icmp slt i32 %93, 11
  br i1 %94, label %95, label %117

; <label>:95:                                     ; preds = %92
  %96 = load %struct.III_scalefac_t*, %struct.III_scalefac_t** %3, align 8
  %97 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %96, i32 0, i32 0
  %98 = load i32, i32* %7, align 4
  %99 = sext i32 %98 to i64
  %100 = getelementptr inbounds [22 x i32], [22 x i32]* %97, i64 0, i64 %99
  %101 = load i32, i32* %100, align 4
  %102 = load i32, i32* %8, align 4
  %103 = icmp sgt i32 %101, %102
  br i1 %103, label %104, label %112

; <label>:104:                                    ; preds = %95
  %pgocount6 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_scale_bitcount, i64 0, i64 9)
  %105 = add i64 %pgocount6, 1
  store i64 %105, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_scale_bitcount, i64 0, i64 9)
  %106 = load %struct.III_scalefac_t*, %struct.III_scalefac_t** %3, align 8
  %107 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %106, i32 0, i32 0
  %108 = load i32, i32* %7, align 4
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds [22 x i32], [22 x i32]* %107, i64 0, i64 %109
  %111 = load i32, i32* %110, align 4
  store i32 %111, i32* %8, align 4
  br label %112

; <label>:112:                                    ; preds = %104, %95
  br label %113

; <label>:113:                                    ; preds = %112
  %pgocount7 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_scale_bitcount, i64 0, i64 6)
  %114 = add i64 %pgocount7, 1
  store i64 %114, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_scale_bitcount, i64 0, i64 6)
  %115 = load i32, i32* %7, align 4
  %116 = add nsw i32 %115, 1
  store i32 %116, i32* %7, align 4
  br label %92

; <label>:117:                                    ; preds = %92
  %118 = load %struct.gr_info*, %struct.gr_info** %4, align 8
  %119 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %118, i32 0, i32 12
  %120 = load i32, i32* %119, align 8
  %121 = icmp ne i32 %120, 0
  br i1 %121, label %174, label %122

; <label>:122:                                    ; preds = %117
  store i32 11, i32* %7, align 4
  br label %123

; <label>:123:                                    ; preds = %141, %122
  %124 = load i32, i32* %7, align 4
  %125 = icmp slt i32 %124, 21
  br i1 %125, label %126, label %145

; <label>:126:                                    ; preds = %123
  %127 = load %struct.III_scalefac_t*, %struct.III_scalefac_t** %3, align 8
  %128 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %127, i32 0, i32 0
  %129 = load i32, i32* %7, align 4
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds [22 x i32], [22 x i32]* %128, i64 0, i64 %130
  %132 = load i32, i32* %131, align 4
  %133 = load i32, i32* %7, align 4
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds [21 x i32], [21 x i32]* @pretab, i64 0, i64 %134
  %136 = load i32, i32* %135, align 4
  %137 = icmp slt i32 %132, %136
  br i1 %137, label %138, label %140

; <label>:138:                                    ; preds = %126
  %pgocount8 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_scale_bitcount, i64 0, i64 19)
  %139 = add i64 %pgocount8, 1
  store i64 %139, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_scale_bitcount, i64 0, i64 19)
  br label %145

; <label>:140:                                    ; preds = %126
  br label %141

; <label>:141:                                    ; preds = %140
  %pgocount9 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_scale_bitcount, i64 0, i64 14)
  %142 = add i64 %pgocount9, 1
  store i64 %142, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_scale_bitcount, i64 0, i64 14)
  %143 = load i32, i32* %7, align 4
  %144 = add nsw i32 %143, 1
  store i32 %144, i32* %7, align 4
  br label %123

; <label>:145:                                    ; preds = %138, %123
  %146 = load i32, i32* %7, align 4
  %147 = icmp eq i32 %146, 21
  br i1 %147, label %148, label %172

; <label>:148:                                    ; preds = %145
  %149 = load %struct.gr_info*, %struct.gr_info** %4, align 8
  %150 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %149, i32 0, i32 12
  store i32 1, i32* %150, align 8
  store i32 11, i32* %7, align 4
  br label %151

; <label>:151:                                    ; preds = %166, %148
  %152 = load i32, i32* %7, align 4
  %153 = icmp slt i32 %152, 21
  br i1 %153, label %154, label %170

; <label>:154:                                    ; preds = %151
  %155 = load i32, i32* %7, align 4
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds [21 x i32], [21 x i32]* @pretab, i64 0, i64 %156
  %158 = load i32, i32* %157, align 4
  %159 = load %struct.III_scalefac_t*, %struct.III_scalefac_t** %3, align 8
  %160 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %159, i32 0, i32 0
  %161 = load i32, i32* %7, align 4
  %162 = sext i32 %161 to i64
  %163 = getelementptr inbounds [22 x i32], [22 x i32]* %160, i64 0, i64 %162
  %164 = load i32, i32* %163, align 4
  %165 = sub nsw i32 %164, %158
  store i32 %165, i32* %163, align 4
  br label %166

; <label>:166:                                    ; preds = %154
  %pgocount10 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_scale_bitcount, i64 0, i64 13)
  %167 = add i64 %pgocount10, 1
  store i64 %167, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_scale_bitcount, i64 0, i64 13)
  %168 = load i32, i32* %7, align 4
  %169 = add nsw i32 %168, 1
  store i32 %169, i32* %7, align 4
  br label %151

; <label>:170:                                    ; preds = %151
  %pgocount11 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_scale_bitcount, i64 0, i64 18)
  %171 = add i64 %pgocount11, 1
  store i64 %171, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_scale_bitcount, i64 0, i64 18)
  br label %172

; <label>:172:                                    ; preds = %170, %145
  %pgocount12 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_scale_bitcount, i64 0, i64 17)
  %173 = add i64 %pgocount12, 1
  store i64 %173, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_scale_bitcount, i64 0, i64 17)
  br label %174

; <label>:174:                                    ; preds = %172, %117
  store i32 11, i32* %7, align 4
  br label %175

; <label>:175:                                    ; preds = %196, %174
  %176 = load i32, i32* %7, align 4
  %177 = icmp slt i32 %176, 21
  br i1 %177, label %178, label %200

; <label>:178:                                    ; preds = %175
  %179 = load %struct.III_scalefac_t*, %struct.III_scalefac_t** %3, align 8
  %180 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %179, i32 0, i32 0
  %181 = load i32, i32* %7, align 4
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds [22 x i32], [22 x i32]* %180, i64 0, i64 %182
  %184 = load i32, i32* %183, align 4
  %185 = load i32, i32* %9, align 4
  %186 = icmp sgt i32 %184, %185
  br i1 %186, label %187, label %195

; <label>:187:                                    ; preds = %178
  %pgocount13 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_scale_bitcount, i64 0, i64 10)
  %188 = add i64 %pgocount13, 1
  store i64 %188, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_scale_bitcount, i64 0, i64 10)
  %189 = load %struct.III_scalefac_t*, %struct.III_scalefac_t** %3, align 8
  %190 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %189, i32 0, i32 0
  %191 = load i32, i32* %7, align 4
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds [22 x i32], [22 x i32]* %190, i64 0, i64 %192
  %194 = load i32, i32* %193, align 4
  store i32 %194, i32* %9, align 4
  br label %195

; <label>:195:                                    ; preds = %187, %178
  br label %196

; <label>:196:                                    ; preds = %195
  %pgocount14 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_scale_bitcount, i64 0, i64 7)
  %197 = add i64 %pgocount14, 1
  store i64 %197, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_scale_bitcount, i64 0, i64 7)
  %198 = load i32, i32* %7, align 4
  %199 = add nsw i32 %198, 1
  store i32 %199, i32* %7, align 4
  br label %175

; <label>:200:                                    ; preds = %175
  %pgocount15 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_scale_bitcount, i64 0, i64 16)
  %201 = add i64 %pgocount15, 1
  store i64 %201, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_scale_bitcount, i64 0, i64 16)
  br label %202

; <label>:202:                                    ; preds = %200, %89
  %203 = load %struct.gr_info*, %struct.gr_info** %4, align 8
  %204 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %203, i32 0, i32 15
  store i32 100000, i32* %204, align 4
  store i32 0, i32* %6, align 4
  br label %205

; <label>:205:                                    ; preds = %247, %202
  %206 = load i32, i32* %6, align 4
  %207 = icmp slt i32 %206, 16
  br i1 %207, label %208, label %251

; <label>:208:                                    ; preds = %205
  %209 = load i32, i32* %8, align 4
  %210 = load i32, i32* %6, align 4
  %211 = sext i32 %210 to i64
  %212 = getelementptr inbounds [16 x i32], [16 x i32]* @scale_bitcount.slen1, i64 0, i64 %211
  %213 = load i32, i32* %212, align 4
  %214 = icmp slt i32 %209, %213
  br i1 %214, label %215, label %246

; <label>:215:                                    ; preds = %208
  %pgocount16 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_scale_bitcount, i64 0, i64 8)
  %216 = add i64 %pgocount16, 1
  store i64 %216, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_scale_bitcount, i64 0, i64 8)
  %217 = load i32, i32* %9, align 4
  %218 = load i32, i32* %6, align 4
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds [16 x i32], [16 x i32]* @scale_bitcount.slen2, i64 0, i64 %219
  %221 = load i32, i32* %220, align 4
  %222 = icmp slt i32 %217, %221
  br i1 %222, label %223, label %246

; <label>:223:                                    ; preds = %215
  %pgocount17 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_scale_bitcount, i64 0, i64 11)
  %224 = add i64 %pgocount17, 1
  store i64 %224, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_scale_bitcount, i64 0, i64 11)
  %225 = load %struct.gr_info*, %struct.gr_info** %4, align 8
  %226 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %225, i32 0, i32 15
  %227 = load i32, i32* %226, align 4
  %228 = load i32*, i32** %11, align 8
  %229 = load i32, i32* %6, align 4
  %230 = sext i32 %229 to i64
  %231 = getelementptr inbounds i32, i32* %228, i64 %230
  %232 = load i32, i32* %231, align 4
  %233 = icmp sgt i32 %227, %232
  br i1 %233, label %234, label %246

; <label>:234:                                    ; preds = %223
  %pgocount18 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_scale_bitcount, i64 0, i64 12)
  %235 = add i64 %pgocount18, 1
  store i64 %235, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_scale_bitcount, i64 0, i64 12)
  %236 = load i32*, i32** %11, align 8
  %237 = load i32, i32* %6, align 4
  %238 = sext i32 %237 to i64
  %239 = getelementptr inbounds i32, i32* %236, i64 %238
  %240 = load i32, i32* %239, align 4
  %241 = load %struct.gr_info*, %struct.gr_info** %4, align 8
  %242 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %241, i32 0, i32 15
  store i32 %240, i32* %242, align 4
  %243 = load i32, i32* %6, align 4
  %244 = load %struct.gr_info*, %struct.gr_info** %4, align 8
  %245 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %244, i32 0, i32 4
  store i32 %243, i32* %245, align 8
  store i32 0, i32* %10, align 4
  br label %246

; <label>:246:                                    ; preds = %234, %223, %215, %208
  br label %247

; <label>:247:                                    ; preds = %246
  %pgocount19 = load i64, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_scale_bitcount, i64 0, i64 4)
  %248 = add i64 %pgocount19, 1
  store i64 %248, i64* getelementptr inbounds ([20 x i64], [20 x i64]* @__profc_scale_bitcount, i64 0, i64 4)
  %249 = load i32, i32* %6, align 4
  %250 = add nsw i32 %249, 1
  store i32 %250, i32* %6, align 4
  br label %205

; <label>:251:                                    ; preds = %205
  %252 = load i32, i32* %10, align 4
  ret i32 %252
}

; Function Attrs: nounwind uwtable
define i32 @scale_bitcount_lsf(%struct.III_scalefac_t*, %struct.gr_info*) #0 {
  %3 = alloca %struct.III_scalefac_t*, align 8
  %4 = alloca %struct.gr_info*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca [4 x i32], align 16
  %14 = alloca i32*, align 8
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  store %struct.III_scalefac_t* %0, %struct.III_scalefac_t** %3, align 8
  store %struct.gr_info* %1, %struct.gr_info** %4, align 8
  %19 = load %struct.gr_info*, %struct.gr_info** %4, align 8
  %20 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %19, i32 0, i32 12
  %21 = load i32, i32* %20, align 8
  %22 = icmp ne i32 %21, 0
  br i1 %22, label %23, label %24

; <label>:23:                                     ; preds = %2
  store i32 2, i32* %5, align 4
  br label %26

; <label>:24:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_scale_bitcount_lsf, i64 0, i64 14)
  %25 = add i64 %pgocount, 1
  store i64 %25, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_scale_bitcount_lsf, i64 0, i64 14)
  store i32 0, i32* %5, align 4
  br label %26

; <label>:26:                                     ; preds = %24, %23
  store i32 0, i32* %11, align 4
  br label %27

; <label>:27:                                     ; preds = %35, %26
  %28 = load i32, i32* %11, align 4
  %29 = icmp slt i32 %28, 4
  br i1 %29, label %30, label %38

; <label>:30:                                     ; preds = %27
  %pgocount2 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_scale_bitcount_lsf, i64 0, i64 5)
  %31 = add i64 %pgocount2, 1
  store i64 %31, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_scale_bitcount_lsf, i64 0, i64 5)
  %32 = load i32, i32* %11, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [4 x i32], [4 x i32]* %13, i64 0, i64 %33
  store i32 0, i32* %34, align 4
  br label %35

; <label>:35:                                     ; preds = %30
  %36 = load i32, i32* %11, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, i32* %11, align 4
  br label %27

; <label>:38:                                     ; preds = %27
  %39 = load %struct.gr_info*, %struct.gr_info** %4, align 8
  %40 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %39, i32 0, i32 6
  %41 = load i32, i32* %40, align 8
  %42 = icmp eq i32 %41, 2
  br i1 %42, label %43, label %117

; <label>:43:                                     ; preds = %38
  store i32 1, i32* %6, align 4
  %44 = load i32, i32* %5, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [6 x [3 x [4 x i32]]], [6 x [3 x [4 x i32]]]* @nr_of_sfb_block, i64 0, i64 %45
  %47 = load i32, i32* %6, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [3 x [4 x i32]], [3 x [4 x i32]]* %46, i64 0, i64 %48
  %50 = getelementptr inbounds [4 x i32], [4 x i32]* %49, i64 0, i64 0
  store i32* %50, i32** %14, align 8
  store i32 0, i32* %12, align 4
  store i32 0, i32* %7, align 4
  br label %51

; <label>:51:                                     ; preds = %111, %43
  %52 = load i32, i32* %7, align 4
  %53 = icmp slt i32 %52, 4
  br i1 %53, label %54, label %115

; <label>:54:                                     ; preds = %51
  %55 = load i32*, i32** %14, align 8
  %56 = load i32, i32* %7, align 4
  %57 = sext i32 %56 to i64
  %58 = getelementptr inbounds i32, i32* %55, i64 %57
  %59 = load i32, i32* %58, align 4
  %60 = udiv i32 %59, 3
  store i32 %60, i32* %8, align 4
  store i32 0, i32* %11, align 4
  br label %61

; <label>:61:                                     ; preds = %104, %54
  %62 = load i32, i32* %11, align 4
  %63 = load i32, i32* %8, align 4
  %64 = icmp slt i32 %62, %63
  br i1 %64, label %65, label %110

; <label>:65:                                     ; preds = %61
  store i32 0, i32* %9, align 4
  br label %66

; <label>:66:                                     ; preds = %99, %65
  %67 = load i32, i32* %9, align 4
  %68 = icmp slt i32 %67, 3
  br i1 %68, label %69, label %103

; <label>:69:                                     ; preds = %66
  %70 = load %struct.III_scalefac_t*, %struct.III_scalefac_t** %3, align 8
  %71 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %70, i32 0, i32 1
  %72 = load i32, i32* %12, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [13 x [3 x i32]], [13 x [3 x i32]]* %71, i64 0, i64 %73
  %75 = load i32, i32* %9, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [3 x i32], [3 x i32]* %74, i64 0, i64 %76
  %78 = load i32, i32* %77, align 4
  %79 = load i32, i32* %7, align 4
  %80 = sext i32 %79 to i64
  %81 = getelementptr inbounds [4 x i32], [4 x i32]* %13, i64 0, i64 %80
  %82 = load i32, i32* %81, align 4
  %83 = icmp sgt i32 %78, %82
  br i1 %83, label %85, label %._crit_edge

._crit_edge:                                      ; preds = %69
  %pgocount3 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_scale_bitcount_lsf, i64 0, i64 2)
  %84 = add i64 %pgocount3, 1
  store i64 %84, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_scale_bitcount_lsf, i64 0, i64 2)
  br label %98

; <label>:85:                                     ; preds = %69
  %86 = load %struct.III_scalefac_t*, %struct.III_scalefac_t** %3, align 8
  %87 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %86, i32 0, i32 1
  %88 = load i32, i32* %12, align 4
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds [13 x [3 x i32]], [13 x [3 x i32]]* %87, i64 0, i64 %89
  %91 = load i32, i32* %9, align 4
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds [3 x i32], [3 x i32]* %90, i64 0, i64 %92
  %94 = load i32, i32* %93, align 4
  %95 = load i32, i32* %7, align 4
  %96 = sext i32 %95 to i64
  %97 = getelementptr inbounds [4 x i32], [4 x i32]* %13, i64 0, i64 %96
  store i32 %94, i32* %97, align 4
  br label %98

; <label>:98:                                     ; preds = %85, %._crit_edge
  br label %99

; <label>:99:                                     ; preds = %98
  %pgocount4 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_scale_bitcount_lsf, i64 0, i64 0)
  %100 = add i64 %pgocount4, 1
  store i64 %100, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_scale_bitcount_lsf, i64 0, i64 0)
  %101 = load i32, i32* %9, align 4
  %102 = add nsw i32 %101, 1
  store i32 %102, i32* %9, align 4
  br label %66

; <label>:103:                                    ; preds = %66
  br label %104

; <label>:104:                                    ; preds = %103
  %pgocount5 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_scale_bitcount_lsf, i64 0, i64 1)
  %105 = add i64 %pgocount5, 1
  store i64 %105, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_scale_bitcount_lsf, i64 0, i64 1)
  %106 = load i32, i32* %11, align 4
  %107 = add nsw i32 %106, 1
  store i32 %107, i32* %11, align 4
  %108 = load i32, i32* %12, align 4
  %109 = add nsw i32 %108, 1
  store i32 %109, i32* %12, align 4
  br label %61

; <label>:110:                                    ; preds = %61
  br label %111

; <label>:111:                                    ; preds = %110
  %pgocount6 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_scale_bitcount_lsf, i64 0, i64 7)
  %112 = add i64 %pgocount6, 1
  store i64 %112, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_scale_bitcount_lsf, i64 0, i64 7)
  %113 = load i32, i32* %7, align 4
  %114 = add nsw i32 %113, 1
  store i32 %114, i32* %7, align 4
  br label %51

; <label>:115:                                    ; preds = %51
  %pgocount7 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_scale_bitcount_lsf, i64 0, i64 12)
  %116 = add i64 %pgocount7, 1
  store i64 %116, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_scale_bitcount_lsf, i64 0, i64 12)
  br label %175

; <label>:117:                                    ; preds = %38
  store i32 0, i32* %6, align 4
  %118 = load i32, i32* %5, align 4
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds [6 x [3 x [4 x i32]]], [6 x [3 x [4 x i32]]]* @nr_of_sfb_block, i64 0, i64 %119
  %121 = load i32, i32* %6, align 4
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds [3 x [4 x i32]], [3 x [4 x i32]]* %120, i64 0, i64 %122
  %124 = getelementptr inbounds [4 x i32], [4 x i32]* %123, i64 0, i64 0
  store i32* %124, i32** %14, align 8
  store i32 0, i32* %12, align 4
  store i32 0, i32* %7, align 4
  br label %125

; <label>:125:                                    ; preds = %169, %117
  %126 = load i32, i32* %7, align 4
  %127 = icmp slt i32 %126, 4
  br i1 %127, label %128, label %173

; <label>:128:                                    ; preds = %125
  %129 = load i32*, i32** %14, align 8
  %130 = load i32, i32* %7, align 4
  %131 = sext i32 %130 to i64
  %132 = getelementptr inbounds i32, i32* %129, i64 %131
  %133 = load i32, i32* %132, align 4
  store i32 %133, i32* %8, align 4
  store i32 0, i32* %11, align 4
  br label %134

; <label>:134:                                    ; preds = %163, %128
  %135 = load i32, i32* %11, align 4
  %136 = load i32, i32* %8, align 4
  %137 = icmp slt i32 %135, %136
  br i1 %137, label %138, label %168

; <label>:138:                                    ; preds = %134
  %139 = load %struct.III_scalefac_t*, %struct.III_scalefac_t** %3, align 8
  %140 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %139, i32 0, i32 0
  %141 = load i32, i32* %12, align 4
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds [22 x i32], [22 x i32]* %140, i64 0, i64 %142
  %144 = load i32, i32* %143, align 4
  %145 = load i32, i32* %7, align 4
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds [4 x i32], [4 x i32]* %13, i64 0, i64 %146
  %148 = load i32, i32* %147, align 4
  %149 = icmp sgt i32 %144, %148
  br i1 %149, label %151, label %._crit_edge1

._crit_edge1:                                     ; preds = %138
  %pgocount8 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_scale_bitcount_lsf, i64 0, i64 3)
  %150 = add i64 %pgocount8, 1
  store i64 %150, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_scale_bitcount_lsf, i64 0, i64 3)
  br label %162

; <label>:151:                                    ; preds = %138
  %pgocount9 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_scale_bitcount_lsf, i64 0, i64 4)
  %152 = add i64 %pgocount9, 1
  store i64 %152, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_scale_bitcount_lsf, i64 0, i64 4)
  %153 = load %struct.III_scalefac_t*, %struct.III_scalefac_t** %3, align 8
  %154 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %153, i32 0, i32 0
  %155 = load i32, i32* %12, align 4
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds [22 x i32], [22 x i32]* %154, i64 0, i64 %156
  %158 = load i32, i32* %157, align 4
  %159 = load i32, i32* %7, align 4
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds [4 x i32], [4 x i32]* %13, i64 0, i64 %160
  store i32 %158, i32* %161, align 4
  br label %162

; <label>:162:                                    ; preds = %151, %._crit_edge1
  br label %163

; <label>:163:                                    ; preds = %162
  %164 = load i32, i32* %11, align 4
  %165 = add nsw i32 %164, 1
  store i32 %165, i32* %11, align 4
  %166 = load i32, i32* %12, align 4
  %167 = add nsw i32 %166, 1
  store i32 %167, i32* %12, align 4
  br label %134

; <label>:168:                                    ; preds = %134
  br label %169

; <label>:169:                                    ; preds = %168
  %pgocount10 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_scale_bitcount_lsf, i64 0, i64 8)
  %170 = add i64 %pgocount10, 1
  store i64 %170, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_scale_bitcount_lsf, i64 0, i64 8)
  %171 = load i32, i32* %7, align 4
  %172 = add nsw i32 %171, 1
  store i32 %172, i32* %7, align 4
  br label %125

; <label>:173:                                    ; preds = %125
  %pgocount11 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_scale_bitcount_lsf, i64 0, i64 13)
  %174 = add i64 %pgocount11, 1
  store i64 %174, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_scale_bitcount_lsf, i64 0, i64 13)
  br label %175

; <label>:175:                                    ; preds = %173, %115
  store i32 0, i32* %10, align 4
  store i32 0, i32* %7, align 4
  br label %176

; <label>:176:                                    ; preds = %198, %175
  %177 = load i32, i32* %7, align 4
  %178 = icmp slt i32 %177, 4
  br i1 %178, label %179, label %201

; <label>:179:                                    ; preds = %176
  %pgocount12 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_scale_bitcount_lsf, i64 0, i64 6)
  %180 = add i64 %pgocount12, 1
  store i64 %180, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_scale_bitcount_lsf, i64 0, i64 6)
  %181 = load i32, i32* %7, align 4
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds [4 x i32], [4 x i32]* %13, i64 0, i64 %182
  %184 = load i32, i32* %183, align 4
  %185 = load i32, i32* %5, align 4
  %186 = sext i32 %185 to i64
  %187 = getelementptr inbounds [6 x [4 x i32]], [6 x [4 x i32]]* @max_range_sfac_tab, i64 0, i64 %186
  %188 = load i32, i32* %7, align 4
  %189 = sext i32 %188 to i64
  %190 = getelementptr inbounds [4 x i32], [4 x i32]* %187, i64 0, i64 %189
  %191 = load i32, i32* %190, align 4
  %192 = icmp sgt i32 %184, %191
  br i1 %192, label %193, label %197

; <label>:193:                                    ; preds = %179
  %pgocount13 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_scale_bitcount_lsf, i64 0, i64 9)
  %194 = add i64 %pgocount13, 1
  store i64 %194, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_scale_bitcount_lsf, i64 0, i64 9)
  %195 = load i32, i32* %10, align 4
  %196 = add nsw i32 %195, 1
  store i32 %196, i32* %10, align 4
  br label %197

; <label>:197:                                    ; preds = %193, %179
  br label %198

; <label>:198:                                    ; preds = %197
  %199 = load i32, i32* %7, align 4
  %200 = add nsw i32 %199, 1
  store i32 %200, i32* %7, align 4
  br label %176

; <label>:201:                                    ; preds = %176
  %202 = load i32, i32* %10, align 4
  %203 = icmp ne i32 %202, 0
  br i1 %203, label %292, label %204

; <label>:204:                                    ; preds = %201
  %205 = load i32, i32* %5, align 4
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds [6 x [3 x [4 x i32]]], [6 x [3 x [4 x i32]]]* @nr_of_sfb_block, i64 0, i64 %206
  %208 = load i32, i32* %6, align 4
  %209 = sext i32 %208 to i64
  %210 = getelementptr inbounds [3 x [4 x i32]], [3 x [4 x i32]]* %207, i64 0, i64 %209
  %211 = getelementptr inbounds [4 x i32], [4 x i32]* %210, i64 0, i64 0
  %212 = load %struct.gr_info*, %struct.gr_info** %4, align 8
  %213 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %212, i32 0, i32 19
  store i32* %211, i32** %213, align 8
  store i32 0, i32* %7, align 4
  br label %214

; <label>:214:                                    ; preds = %230, %204
  %215 = load i32, i32* %7, align 4
  %216 = icmp slt i32 %215, 4
  br i1 %216, label %217, label %234

; <label>:217:                                    ; preds = %214
  %218 = load i32, i32* %7, align 4
  %219 = sext i32 %218 to i64
  %220 = getelementptr inbounds [4 x i32], [4 x i32]* %13, i64 0, i64 %219
  %221 = load i32, i32* %220, align 4
  %222 = sext i32 %221 to i64
  %223 = getelementptr inbounds [16 x i32], [16 x i32]* @scale_bitcount_lsf.log2tab, i64 0, i64 %222
  %224 = load i32, i32* %223, align 4
  %225 = load %struct.gr_info*, %struct.gr_info** %4, align 8
  %226 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %225, i32 0, i32 20
  %227 = load i32, i32* %7, align 4
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds [4 x i32], [4 x i32]* %226, i64 0, i64 %228
  store i32 %224, i32* %229, align 4
  br label %230

; <label>:230:                                    ; preds = %217
  %pgocount14 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_scale_bitcount_lsf, i64 0, i64 10)
  %231 = add i64 %pgocount14, 1
  store i64 %231, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_scale_bitcount_lsf, i64 0, i64 10)
  %232 = load i32, i32* %7, align 4
  %233 = add nsw i32 %232, 1
  store i32 %233, i32* %7, align 4
  br label %214

; <label>:234:                                    ; preds = %214
  %235 = load %struct.gr_info*, %struct.gr_info** %4, align 8
  %236 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %235, i32 0, i32 20
  %237 = getelementptr inbounds [4 x i32], [4 x i32]* %236, i64 0, i64 0
  %238 = load i32, i32* %237, align 8
  store i32 %238, i32* %15, align 4
  %239 = load %struct.gr_info*, %struct.gr_info** %4, align 8
  %240 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %239, i32 0, i32 20
  %241 = getelementptr inbounds [4 x i32], [4 x i32]* %240, i64 0, i64 1
  %242 = load i32, i32* %241, align 4
  store i32 %242, i32* %16, align 4
  %243 = load %struct.gr_info*, %struct.gr_info** %4, align 8
  %244 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %243, i32 0, i32 20
  %245 = getelementptr inbounds [4 x i32], [4 x i32]* %244, i64 0, i64 2
  %246 = load i32, i32* %245, align 8
  store i32 %246, i32* %17, align 4
  %247 = load %struct.gr_info*, %struct.gr_info** %4, align 8
  %248 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %247, i32 0, i32 20
  %249 = getelementptr inbounds [4 x i32], [4 x i32]* %248, i64 0, i64 3
  %250 = load i32, i32* %249, align 4
  store i32 %250, i32* %18, align 4
  %251 = load i32, i32* %5, align 4
  switch i32 %251, label %287 [
    i32 0, label %252
    i32 1, label %266
    i32 2, label %278
  ]

; <label>:252:                                    ; preds = %234
  %pgocount15 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_scale_bitcount_lsf, i64 0, i64 17)
  %253 = add i64 %pgocount15, 1
  store i64 %253, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_scale_bitcount_lsf, i64 0, i64 17)
  %254 = load i32, i32* %15, align 4
  %255 = mul i32 %254, 5
  %256 = load i32, i32* %16, align 4
  %257 = add i32 %255, %256
  %258 = shl i32 %257, 4
  %259 = load i32, i32* %17, align 4
  %260 = shl i32 %259, 2
  %261 = add i32 %258, %260
  %262 = load i32, i32* %18, align 4
  %263 = add i32 %261, %262
  %264 = load %struct.gr_info*, %struct.gr_info** %4, align 8
  %265 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %264, i32 0, i32 4
  store i32 %263, i32* %265, align 8
  br label %291

; <label>:266:                                    ; preds = %234
  %pgocount16 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_scale_bitcount_lsf, i64 0, i64 18)
  %267 = add i64 %pgocount16, 1
  store i64 %267, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_scale_bitcount_lsf, i64 0, i64 18)
  %268 = load i32, i32* %15, align 4
  %269 = mul i32 %268, 5
  %270 = load i32, i32* %16, align 4
  %271 = add i32 %269, %270
  %272 = shl i32 %271, 2
  %273 = add i32 400, %272
  %274 = load i32, i32* %17, align 4
  %275 = add i32 %273, %274
  %276 = load %struct.gr_info*, %struct.gr_info** %4, align 8
  %277 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %276, i32 0, i32 4
  store i32 %275, i32* %277, align 8
  br label %291

; <label>:278:                                    ; preds = %234
  %pgocount17 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_scale_bitcount_lsf, i64 0, i64 16)
  %279 = add i64 %pgocount17, 1
  store i64 %279, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_scale_bitcount_lsf, i64 0, i64 16)
  %280 = load i32, i32* %15, align 4
  %281 = mul i32 %280, 3
  %282 = add i32 500, %281
  %283 = load i32, i32* %16, align 4
  %284 = add i32 %282, %283
  %285 = load %struct.gr_info*, %struct.gr_info** %4, align 8
  %286 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %285, i32 0, i32 4
  store i32 %284, i32* %286, align 8
  br label %291

; <label>:287:                                    ; preds = %234
  %pgocount18 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_scale_bitcount_lsf, i64 0, i64 19)
  %288 = add i64 %pgocount18, 1
  store i64 %288, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_scale_bitcount_lsf, i64 0, i64 19)
  %289 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %290 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %289, i8* getelementptr inbounds ([38 x i8], [38 x i8]* @.str.2, i32 0, i32 0))
  call void @exit(i32 1) #6
  unreachable

; <label>:291:                                    ; preds = %278, %266, %252
  br label %292

; <label>:292:                                    ; preds = %291, %201
  %293 = load i32, i32* %10, align 4
  %294 = icmp ne i32 %293, 0
  br i1 %294, label %335, label %295

; <label>:295:                                    ; preds = %292
  %296 = load %struct.gr_info*, %struct.gr_info** %4, align 8
  %297 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %296, i32 0, i32 19
  %298 = load i32*, i32** %297, align 8
  %299 = icmp ne i32* %298, null
  br i1 %299, label %300, label %301

; <label>:300:                                    ; preds = %295
  br label %304

; <label>:301:                                    ; preds = %295
  %pgocount19 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_scale_bitcount_lsf, i64 0, i64 20)
  %302 = add i64 %pgocount19, 1
  store i64 %302, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_scale_bitcount_lsf, i64 0, i64 20)
  call void @__assert_fail(i8* getelementptr inbounds ([30 x i8], [30 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.1, i32 0, i32 0), i32 665, i8* getelementptr inbounds ([52 x i8], [52 x i8]* @__PRETTY_FUNCTION__.scale_bitcount_lsf, i32 0, i32 0)) #6
  unreachable
                                                  ; No predecessors!
  br label %304

; <label>:304:                                    ; preds = %303, %300
  %305 = load %struct.gr_info*, %struct.gr_info** %4, align 8
  %306 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %305, i32 0, i32 15
  store i32 0, i32* %306, align 4
  store i32 0, i32* %7, align 4
  br label %307

; <label>:307:                                    ; preds = %329, %304
  %308 = load i32, i32* %7, align 4
  %309 = icmp slt i32 %308, 4
  br i1 %309, label %310, label %333

; <label>:310:                                    ; preds = %307
  %311 = load %struct.gr_info*, %struct.gr_info** %4, align 8
  %312 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %311, i32 0, i32 20
  %313 = load i32, i32* %7, align 4
  %314 = sext i32 %313 to i64
  %315 = getelementptr inbounds [4 x i32], [4 x i32]* %312, i64 0, i64 %314
  %316 = load i32, i32* %315, align 4
  %317 = load %struct.gr_info*, %struct.gr_info** %4, align 8
  %318 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %317, i32 0, i32 19
  %319 = load i32*, i32** %318, align 8
  %320 = load i32, i32* %7, align 4
  %321 = sext i32 %320 to i64
  %322 = getelementptr inbounds i32, i32* %319, i64 %321
  %323 = load i32, i32* %322, align 4
  %324 = mul i32 %316, %323
  %325 = load %struct.gr_info*, %struct.gr_info** %4, align 8
  %326 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %325, i32 0, i32 15
  %327 = load i32, i32* %326, align 4
  %328 = add i32 %327, %324
  store i32 %328, i32* %326, align 4
  br label %329

; <label>:329:                                    ; preds = %310
  %pgocount20 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_scale_bitcount_lsf, i64 0, i64 11)
  %330 = add i64 %pgocount20, 1
  store i64 %330, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_scale_bitcount_lsf, i64 0, i64 11)
  %331 = load i32, i32* %7, align 4
  %332 = add nsw i32 %331, 1
  store i32 %332, i32* %7, align 4
  br label %307

; <label>:333:                                    ; preds = %307
  %pgocount21 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_scale_bitcount_lsf, i64 0, i64 15)
  %334 = add i64 %pgocount21, 1
  store i64 %334, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_scale_bitcount_lsf, i64 0, i64 15)
  br label %335

; <label>:335:                                    ; preds = %333, %292
  %336 = load i32, i32* %10, align 4
  ret i32 %336
}

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: noreturn nounwind
declare void @exit(i32) #3

; Function Attrs: nounwind uwtable
define i32 @calc_xmin(%struct.lame_global_flags*, double*, %struct.III_psy_ratio*, %struct.gr_info*, %struct.III_psy_xmin*) #0 {
  %6 = alloca %struct.lame_global_flags*, align 8
  %7 = alloca double*, align 8
  %8 = alloca %struct.III_psy_ratio*, align 8
  %9 = alloca %struct.gr_info*, align 8
  %10 = alloca %struct.III_psy_xmin*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca double, align 8
  %19 = alloca double, align 8
  %20 = alloca double, align 8
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %6, align 8
  store double* %1, double** %7, align 8
  store %struct.III_psy_ratio* %2, %struct.III_psy_ratio** %8, align 8
  store %struct.gr_info* %3, %struct.gr_info** %9, align 8
  store %struct.III_psy_xmin* %4, %struct.III_psy_xmin** %10, align 8
  store i32 0, i32* %16, align 4
  %21 = load %struct.lame_global_flags*, %struct.lame_global_flags** %6, align 8
  %22 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %21, i32 0, i32 33
  %23 = load i32, i32* %22, align 8
  %24 = icmp ne i32 %23, 0
  br i1 %24, label %25, label %81

; <label>:25:                                     ; preds = %5
  %26 = load %struct.gr_info*, %struct.gr_info** %9, align 8
  %27 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %26, i32 0, i32 17
  %28 = load i32, i32* %27, align 4
  store i32 %28, i32* %17, align 4
  br label %29

; <label>:29:                                     ; preds = %55, %25
  %30 = load i32, i32* %17, align 4
  %31 = icmp ult i32 %30, 12
  br i1 %31, label %32, label %58

; <label>:32:                                     ; preds = %29
  %pgocount = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_calc_xmin, i64 0, i64 7)
  %33 = add i64 %pgocount, 1
  store i64 %33, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_calc_xmin, i64 0, i64 7)
  store i32 0, i32* %15, align 4
  br label %34

; <label>:34:                                     ; preds = %51, %32
  %35 = load i32, i32* %15, align 4
  %36 = icmp slt i32 %35, 3
  br i1 %36, label %37, label %54

; <label>:37:                                     ; preds = %34
  %pgocount1 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_calc_xmin, i64 0, i64 1)
  %38 = add i64 %pgocount1, 1
  store i64 %38, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_calc_xmin, i64 0, i64 1)
  %39 = load i32, i32* %17, align 4
  %40 = zext i32 %39 to i64
  %41 = getelementptr inbounds [21 x double], [21 x double]* @ATH_s, i64 0, i64 %40
  %42 = load double, double* %41, align 8
  %43 = load %struct.III_psy_xmin*, %struct.III_psy_xmin** %10, align 8
  %44 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %43, i32 0, i32 1
  %45 = load i32, i32* %17, align 4
  %46 = zext i32 %45 to i64
  %47 = getelementptr inbounds [13 x [3 x double]], [13 x [3 x double]]* %44, i64 0, i64 %46
  %48 = load i32, i32* %15, align 4
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [3 x double], [3 x double]* %47, i64 0, i64 %49
  store double %42, double* %50, align 8
  br label %51

; <label>:51:                                     ; preds = %37
  %52 = load i32, i32* %15, align 4
  %53 = add nsw i32 %52, 1
  store i32 %53, i32* %15, align 4
  br label %34

; <label>:54:                                     ; preds = %34
  br label %55

; <label>:55:                                     ; preds = %54
  %56 = load i32, i32* %17, align 4
  %57 = add i32 %56, 1
  store i32 %57, i32* %17, align 4
  br label %29

; <label>:58:                                     ; preds = %29
  store i32 0, i32* %17, align 4
  br label %59

; <label>:59:                                     ; preds = %76, %58
  %60 = load i32, i32* %17, align 4
  %61 = load %struct.gr_info*, %struct.gr_info** %9, align 8
  %62 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %61, i32 0, i32 16
  %63 = load i32, i32* %62, align 8
  %64 = icmp ult i32 %60, %63
  br i1 %64, label %65, label %79

; <label>:65:                                     ; preds = %59
  %pgocount2 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_calc_xmin, i64 0, i64 8)
  %66 = add i64 %pgocount2, 1
  store i64 %66, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_calc_xmin, i64 0, i64 8)
  %67 = load i32, i32* %17, align 4
  %68 = zext i32 %67 to i64
  %69 = getelementptr inbounds [21 x double], [21 x double]* @ATH_l, i64 0, i64 %68
  %70 = load double, double* %69, align 8
  %71 = load %struct.III_psy_xmin*, %struct.III_psy_xmin** %10, align 8
  %72 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %71, i32 0, i32 0
  %73 = load i32, i32* %17, align 4
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds [22 x double], [22 x double]* %72, i64 0, i64 %74
  store double %70, double* %75, align 8
  br label %76

; <label>:76:                                     ; preds = %65
  %77 = load i32, i32* %17, align 4
  %78 = add i32 %77, 1
  store i32 %78, i32* %17, align 4
  br label %59

; <label>:79:                                     ; preds = %59
  %pgocount3 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_calc_xmin, i64 0, i64 14)
  %80 = add i64 %pgocount3, 1
  store i64 %80, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_calc_xmin, i64 0, i64 14)
  br label %323

; <label>:81:                                     ; preds = %5
  %pgocount4 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_calc_xmin, i64 0, i64 15)
  %82 = add i64 %pgocount4, 1
  store i64 %82, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_calc_xmin, i64 0, i64 15)
  %83 = load %struct.gr_info*, %struct.gr_info** %9, align 8
  %84 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %83, i32 0, i32 17
  %85 = load i32, i32* %84, align 4
  store i32 %85, i32* %17, align 4
  br label %86

; <label>:86:                                     ; preds = %207, %81
  %87 = load i32, i32* %17, align 4
  %88 = icmp ult i32 %87, 12
  br i1 %88, label %89, label %211

; <label>:89:                                     ; preds = %86
  %90 = load i32, i32* %17, align 4
  %91 = zext i32 %90 to i64
  %92 = getelementptr inbounds [14 x i32], [14 x i32]* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i32 0, i32 1), i64 0, i64 %91
  %93 = load i32, i32* %92, align 4
  store i32 %93, i32* %11, align 4
  %94 = load i32, i32* %17, align 4
  %95 = add i32 %94, 1
  %96 = zext i32 %95 to i64
  %97 = getelementptr inbounds [14 x i32], [14 x i32]* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i32 0, i32 1), i64 0, i64 %96
  %98 = load i32, i32* %97, align 4
  store i32 %98, i32* %12, align 4
  %99 = load i32, i32* %12, align 4
  %100 = load i32, i32* %11, align 4
  %101 = sub nsw i32 %99, %100
  store i32 %101, i32* %13, align 4
  store i32 0, i32* %15, align 4
  br label %102

; <label>:102:                                    ; preds = %203, %89
  %103 = load i32, i32* %15, align 4
  %104 = icmp slt i32 %103, 3
  br i1 %104, label %105, label %206

; <label>:105:                                    ; preds = %102
  store double 0.000000e+00, double* %18, align 8
  %106 = load i32, i32* %11, align 4
  store i32 %106, i32* %14, align 4
  br label %107

; <label>:107:                                    ; preds = %126, %105
  %108 = load i32, i32* %14, align 4
  %109 = load i32, i32* %12, align 4
  %110 = icmp slt i32 %108, %109
  br i1 %110, label %111, label %130

; <label>:111:                                    ; preds = %107
  %112 = load double*, double** %7, align 8
  %113 = load i32, i32* %14, align 4
  %114 = mul nsw i32 %113, 3
  %115 = load i32, i32* %15, align 4
  %116 = add nsw i32 %114, %115
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds double, double* %112, i64 %117
  %119 = load double, double* %118, align 8
  store double %119, double* %20, align 8
  %120 = load double, double* %20, align 8
  %121 = load double, double* %20, align 8
  %122 = fmul double %120, %121
  store double %122, double* %20, align 8
  %123 = load double, double* %20, align 8
  %124 = load double, double* %18, align 8
  %125 = fadd double %124, %123
  store double %125, double* %18, align 8
  br label %126

; <label>:126:                                    ; preds = %111
  %pgocount5 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_calc_xmin, i64 0, i64 0)
  %127 = add i64 %pgocount5, 1
  store i64 %127, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_calc_xmin, i64 0, i64 0)
  %128 = load i32, i32* %14, align 4
  %129 = add nsw i32 %128, 1
  store i32 %129, i32* %14, align 4
  br label %107

; <label>:130:                                    ; preds = %107
  %131 = load i32, i32* %13, align 4
  %132 = sitofp i32 %131 to double
  %133 = load double, double* %18, align 8
  %134 = fdiv double %133, %132
  store double %134, double* %18, align 8
  %135 = load %struct.III_psy_ratio*, %struct.III_psy_ratio** %8, align 8
  %136 = getelementptr inbounds %struct.III_psy_ratio, %struct.III_psy_ratio* %135, i32 0, i32 1
  %137 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %136, i32 0, i32 1
  %138 = load i32, i32* %17, align 4
  %139 = zext i32 %138 to i64
  %140 = getelementptr inbounds [13 x [3 x double]], [13 x [3 x double]]* %137, i64 0, i64 %139
  %141 = load i32, i32* %15, align 4
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds [3 x double], [3 x double]* %140, i64 0, i64 %142
  %144 = load double, double* %143, align 8
  store double %144, double* %19, align 8
  %145 = load double, double* %19, align 8
  %146 = fcmp ogt double %145, 0.000000e+00
  br i1 %146, label %147, label %166

; <label>:147:                                    ; preds = %130
  %pgocount6 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_calc_xmin, i64 0, i64 3)
  %148 = add i64 %pgocount6, 1
  store i64 %148, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_calc_xmin, i64 0, i64 3)
  %149 = load double, double* %18, align 8
  %150 = load %struct.III_psy_ratio*, %struct.III_psy_ratio** %8, align 8
  %151 = getelementptr inbounds %struct.III_psy_ratio, %struct.III_psy_ratio* %150, i32 0, i32 0
  %152 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %151, i32 0, i32 1
  %153 = load i32, i32* %17, align 4
  %154 = zext i32 %153 to i64
  %155 = getelementptr inbounds [13 x [3 x double]], [13 x [3 x double]]* %152, i64 0, i64 %154
  %156 = load i32, i32* %15, align 4
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds [3 x double], [3 x double]* %155, i64 0, i64 %157
  %159 = load double, double* %158, align 8
  %160 = fmul double %149, %159
  %161 = load float, float* @masking_lower, align 4
  %162 = fpext float %161 to double
  %163 = fmul double %160, %162
  %164 = load double, double* %19, align 8
  %165 = fdiv double %163, %164
  store double %165, double* %19, align 8
  br label %166

; <label>:166:                                    ; preds = %147, %130
  %167 = load i32, i32* %17, align 4
  %168 = zext i32 %167 to i64
  %169 = getelementptr inbounds [21 x double], [21 x double]* @ATH_s, i64 0, i64 %168
  %170 = load double, double* %169, align 8
  %171 = load double, double* %19, align 8
  %172 = fcmp ogt double %170, %171
  br i1 %172, label %173, label %179

; <label>:173:                                    ; preds = %166
  %pgocount7 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_calc_xmin, i64 0, i64 4)
  %174 = add i64 %pgocount7, 1
  store i64 %174, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_calc_xmin, i64 0, i64 4)
  %175 = load i32, i32* %17, align 4
  %176 = zext i32 %175 to i64
  %177 = getelementptr inbounds [21 x double], [21 x double]* @ATH_s, i64 0, i64 %176
  %178 = load double, double* %177, align 8
  br label %182

; <label>:179:                                    ; preds = %166
  %pgocount8 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_calc_xmin, i64 0, i64 5)
  %180 = add i64 %pgocount8, 1
  store i64 %180, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_calc_xmin, i64 0, i64 5)
  %181 = load double, double* %19, align 8
  br label %182

; <label>:182:                                    ; preds = %179, %173
  %183 = phi double [ %178, %173 ], [ %181, %179 ]
  %184 = load %struct.III_psy_xmin*, %struct.III_psy_xmin** %10, align 8
  %185 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %184, i32 0, i32 1
  %186 = load i32, i32* %17, align 4
  %187 = zext i32 %186 to i64
  %188 = getelementptr inbounds [13 x [3 x double]], [13 x [3 x double]]* %185, i64 0, i64 %187
  %189 = load i32, i32* %15, align 4
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds [3 x double], [3 x double]* %188, i64 0, i64 %190
  store double %183, double* %191, align 8
  %192 = load double, double* %18, align 8
  %193 = load i32, i32* %17, align 4
  %194 = zext i32 %193 to i64
  %195 = getelementptr inbounds [21 x double], [21 x double]* @ATH_s, i64 0, i64 %194
  %196 = load double, double* %195, align 8
  %197 = fcmp ogt double %192, %196
  br i1 %197, label %198, label %202

; <label>:198:                                    ; preds = %182
  %pgocount9 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_calc_xmin, i64 0, i64 6)
  %199 = add i64 %pgocount9, 1
  store i64 %199, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_calc_xmin, i64 0, i64 6)
  %200 = load i32, i32* %16, align 4
  %201 = add nsw i32 %200, 1
  store i32 %201, i32* %16, align 4
  br label %202

; <label>:202:                                    ; preds = %198, %182
  br label %203

; <label>:203:                                    ; preds = %202
  %204 = load i32, i32* %15, align 4
  %205 = add nsw i32 %204, 1
  store i32 %205, i32* %15, align 4
  br label %102

; <label>:206:                                    ; preds = %102
  br label %207

; <label>:207:                                    ; preds = %206
  %pgocount10 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_calc_xmin, i64 0, i64 9)
  %208 = add i64 %pgocount10, 1
  store i64 %208, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_calc_xmin, i64 0, i64 9)
  %209 = load i32, i32* %17, align 4
  %210 = add i32 %209, 1
  store i32 %210, i32* %17, align 4
  br label %86

; <label>:211:                                    ; preds = %86
  store i32 0, i32* %17, align 4
  br label %212

; <label>:212:                                    ; preds = %319, %211
  %213 = load i32, i32* %17, align 4
  %214 = load %struct.gr_info*, %struct.gr_info** %9, align 8
  %215 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %214, i32 0, i32 16
  %216 = load i32, i32* %215, align 8
  %217 = icmp ult i32 %213, %216
  br i1 %217, label %218, label %322

; <label>:218:                                    ; preds = %212
  %219 = load i32, i32* %17, align 4
  %220 = zext i32 %219 to i64
  %221 = getelementptr inbounds [23 x i32], [23 x i32]* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i32 0, i32 0), i64 0, i64 %220
  %222 = load i32, i32* %221, align 4
  store i32 %222, i32* %11, align 4
  %223 = load i32, i32* %17, align 4
  %224 = add i32 %223, 1
  %225 = zext i32 %224 to i64
  %226 = getelementptr inbounds [23 x i32], [23 x i32]* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i32 0, i32 0), i64 0, i64 %225
  %227 = load i32, i32* %226, align 4
  store i32 %227, i32* %12, align 4
  %228 = load i32, i32* %12, align 4
  %229 = load i32, i32* %11, align 4
  %230 = sub nsw i32 %228, %229
  store i32 %230, i32* %13, align 4
  store double 0.000000e+00, double* %18, align 8
  %231 = load i32, i32* %11, align 4
  store i32 %231, i32* %14, align 4
  br label %232

; <label>:232:                                    ; preds = %251, %218
  %233 = load i32, i32* %14, align 4
  %234 = load i32, i32* %12, align 4
  %235 = icmp slt i32 %233, %234
  br i1 %235, label %236, label %255

; <label>:236:                                    ; preds = %232
  %237 = load double*, double** %7, align 8
  %238 = load i32, i32* %14, align 4
  %239 = sext i32 %238 to i64
  %240 = getelementptr inbounds double, double* %237, i64 %239
  %241 = load double, double* %240, align 8
  %242 = load double*, double** %7, align 8
  %243 = load i32, i32* %14, align 4
  %244 = sext i32 %243 to i64
  %245 = getelementptr inbounds double, double* %242, i64 %244
  %246 = load double, double* %245, align 8
  %247 = fmul double %241, %246
  store double %247, double* %20, align 8
  %248 = load double, double* %20, align 8
  %249 = load double, double* %18, align 8
  %250 = fadd double %249, %248
  store double %250, double* %18, align 8
  br label %251

; <label>:251:                                    ; preds = %236
  %pgocount11 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_calc_xmin, i64 0, i64 2)
  %252 = add i64 %pgocount11, 1
  store i64 %252, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_calc_xmin, i64 0, i64 2)
  %253 = load i32, i32* %14, align 4
  %254 = add nsw i32 %253, 1
  store i32 %254, i32* %14, align 4
  br label %232

; <label>:255:                                    ; preds = %232
  %256 = load i32, i32* %13, align 4
  %257 = sitofp i32 %256 to double
  %258 = load double, double* %18, align 8
  %259 = fdiv double %258, %257
  store double %259, double* %18, align 8
  %260 = load %struct.III_psy_ratio*, %struct.III_psy_ratio** %8, align 8
  %261 = getelementptr inbounds %struct.III_psy_ratio, %struct.III_psy_ratio* %260, i32 0, i32 1
  %262 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %261, i32 0, i32 0
  %263 = load i32, i32* %17, align 4
  %264 = zext i32 %263 to i64
  %265 = getelementptr inbounds [22 x double], [22 x double]* %262, i64 0, i64 %264
  %266 = load double, double* %265, align 8
  store double %266, double* %19, align 8
  %267 = load double, double* %19, align 8
  %268 = fcmp ogt double %267, 0.000000e+00
  br i1 %268, label %269, label %285

; <label>:269:                                    ; preds = %255
  %pgocount12 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_calc_xmin, i64 0, i64 10)
  %270 = add i64 %pgocount12, 1
  store i64 %270, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_calc_xmin, i64 0, i64 10)
  %271 = load double, double* %18, align 8
  %272 = load %struct.III_psy_ratio*, %struct.III_psy_ratio** %8, align 8
  %273 = getelementptr inbounds %struct.III_psy_ratio, %struct.III_psy_ratio* %272, i32 0, i32 0
  %274 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %273, i32 0, i32 0
  %275 = load i32, i32* %17, align 4
  %276 = zext i32 %275 to i64
  %277 = getelementptr inbounds [22 x double], [22 x double]* %274, i64 0, i64 %276
  %278 = load double, double* %277, align 8
  %279 = fmul double %271, %278
  %280 = load float, float* @masking_lower, align 4
  %281 = fpext float %280 to double
  %282 = fmul double %279, %281
  %283 = load double, double* %19, align 8
  %284 = fdiv double %282, %283
  store double %284, double* %19, align 8
  br label %285

; <label>:285:                                    ; preds = %269, %255
  %286 = load i32, i32* %17, align 4
  %287 = zext i32 %286 to i64
  %288 = getelementptr inbounds [21 x double], [21 x double]* @ATH_l, i64 0, i64 %287
  %289 = load double, double* %288, align 8
  %290 = load double, double* %19, align 8
  %291 = fcmp ogt double %289, %290
  br i1 %291, label %292, label %298

; <label>:292:                                    ; preds = %285
  %pgocount13 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_calc_xmin, i64 0, i64 11)
  %293 = add i64 %pgocount13, 1
  store i64 %293, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_calc_xmin, i64 0, i64 11)
  %294 = load i32, i32* %17, align 4
  %295 = zext i32 %294 to i64
  %296 = getelementptr inbounds [21 x double], [21 x double]* @ATH_l, i64 0, i64 %295
  %297 = load double, double* %296, align 8
  br label %301

; <label>:298:                                    ; preds = %285
  %pgocount14 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_calc_xmin, i64 0, i64 12)
  %299 = add i64 %pgocount14, 1
  store i64 %299, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_calc_xmin, i64 0, i64 12)
  %300 = load double, double* %19, align 8
  br label %301

; <label>:301:                                    ; preds = %298, %292
  %302 = phi double [ %297, %292 ], [ %300, %298 ]
  %303 = load %struct.III_psy_xmin*, %struct.III_psy_xmin** %10, align 8
  %304 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %303, i32 0, i32 0
  %305 = load i32, i32* %17, align 4
  %306 = zext i32 %305 to i64
  %307 = getelementptr inbounds [22 x double], [22 x double]* %304, i64 0, i64 %306
  store double %302, double* %307, align 8
  %308 = load double, double* %18, align 8
  %309 = load i32, i32* %17, align 4
  %310 = zext i32 %309 to i64
  %311 = getelementptr inbounds [21 x double], [21 x double]* @ATH_l, i64 0, i64 %310
  %312 = load double, double* %311, align 8
  %313 = fcmp ogt double %308, %312
  br i1 %313, label %314, label %318

; <label>:314:                                    ; preds = %301
  %pgocount15 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_calc_xmin, i64 0, i64 13)
  %315 = add i64 %pgocount15, 1
  store i64 %315, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_calc_xmin, i64 0, i64 13)
  %316 = load i32, i32* %16, align 4
  %317 = add nsw i32 %316, 1
  store i32 %317, i32* %16, align 4
  br label %318

; <label>:318:                                    ; preds = %314, %301
  br label %319

; <label>:319:                                    ; preds = %318
  %320 = load i32, i32* %17, align 4
  %321 = add i32 %320, 1
  store i32 %321, i32* %17, align 4
  br label %212

; <label>:322:                                    ; preds = %212
  br label %323

; <label>:323:                                    ; preds = %322, %79
  %324 = load i32, i32* %16, align 4
  ret i32 %324
}

; Function Attrs: nounwind uwtable
define i32 @loop_break(%struct.III_scalefac_t*, %struct.gr_info*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca %struct.III_scalefac_t*, align 8
  %5 = alloca %struct.gr_info*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store %struct.III_scalefac_t* %0, %struct.III_scalefac_t** %4, align 8
  store %struct.gr_info* %1, %struct.gr_info** %5, align 8
  store i32 0, i32* %7, align 4
  br label %8

; <label>:8:                                      ; preds = %26, %2
  %9 = load i32, i32* %7, align 4
  %10 = load %struct.gr_info*, %struct.gr_info** %5, align 8
  %11 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %10, i32 0, i32 16
  %12 = load i32, i32* %11, align 8
  %13 = icmp ult i32 %9, %12
  br i1 %13, label %14, label %29

; <label>:14:                                     ; preds = %8
  %15 = load %struct.III_scalefac_t*, %struct.III_scalefac_t** %4, align 8
  %16 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %15, i32 0, i32 0
  %17 = load i32, i32* %7, align 4
  %18 = zext i32 %17 to i64
  %19 = getelementptr inbounds [22 x i32], [22 x i32]* %16, i64 0, i64 %18
  %20 = load i32, i32* %19, align 4
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %24

; <label>:22:                                     ; preds = %14
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_loop_break, i64 0, i64 2)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_loop_break, i64 0, i64 2)
  store i32 0, i32* %3, align 4
  br label %65

; <label>:24:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_loop_break, i64 0, i64 0)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_loop_break, i64 0, i64 0)
  br label %26

; <label>:26:                                     ; preds = %24
  %27 = load i32, i32* %7, align 4
  %28 = add i32 %27, 1
  store i32 %28, i32* %7, align 4
  br label %8

; <label>:29:                                     ; preds = %8
  %30 = load %struct.gr_info*, %struct.gr_info** %5, align 8
  %31 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %30, i32 0, i32 17
  %32 = load i32, i32* %31, align 4
  store i32 %32, i32* %7, align 4
  br label %33

; <label>:33:                                     ; preds = %59, %29
  %34 = load i32, i32* %7, align 4
  %35 = icmp ult i32 %34, 12
  br i1 %35, label %36, label %63

; <label>:36:                                     ; preds = %33
  store i32 0, i32* %6, align 4
  br label %37

; <label>:37:                                     ; preds = %54, %36
  %38 = load i32, i32* %6, align 4
  %39 = icmp slt i32 %38, 3
  br i1 %39, label %40, label %58

; <label>:40:                                     ; preds = %37
  %41 = load %struct.III_scalefac_t*, %struct.III_scalefac_t** %4, align 8
  %42 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %41, i32 0, i32 1
  %43 = load i32, i32* %7, align 4
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds [13 x [3 x i32]], [13 x [3 x i32]]* %42, i64 0, i64 %44
  %46 = load i32, i32* %6, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [3 x i32], [3 x i32]* %45, i64 0, i64 %47
  %49 = load i32, i32* %48, align 4
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %51, label %53

; <label>:51:                                     ; preds = %40
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_loop_break, i64 0, i64 4)
  %52 = add i64 %pgocount2, 1
  store i64 %52, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_loop_break, i64 0, i64 4)
  store i32 0, i32* %3, align 4
  br label %65

; <label>:53:                                     ; preds = %40
  br label %54

; <label>:54:                                     ; preds = %53
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_loop_break, i64 0, i64 1)
  %55 = add i64 %pgocount3, 1
  store i64 %55, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_loop_break, i64 0, i64 1)
  %56 = load i32, i32* %6, align 4
  %57 = add nsw i32 %56, 1
  store i32 %57, i32* %6, align 4
  br label %37

; <label>:58:                                     ; preds = %37
  br label %59

; <label>:59:                                     ; preds = %58
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_loop_break, i64 0, i64 3)
  %60 = add i64 %pgocount4, 1
  store i64 %60, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_loop_break, i64 0, i64 3)
  %61 = load i32, i32* %7, align 4
  %62 = add i32 %61, 1
  store i32 %62, i32* %7, align 4
  br label %33

; <label>:63:                                     ; preds = %33
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_loop_break, i64 0, i64 5)
  %64 = add i64 %pgocount5, 1
  store i64 %64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_loop_break, i64 0, i64 5)
  store i32 1, i32* %3, align 4
  br label %65

; <label>:65:                                     ; preds = %63, %51, %22
  %66 = load i32, i32* %3, align 4
  ret i32 %66
}

; Function Attrs: nounwind uwtable
define i32 @bin_search_StepSize2(%struct.lame_global_flags*, i32, i32, i32*, double*, %struct.gr_info*) #0 {
  %7 = alloca %struct.lame_global_flags*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32*, align 8
  %11 = alloca double*, align 8
  %12 = alloca %struct.gr_info*, align 8
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %7, align 8
  store i32 %1, i32* %8, align 4
  store i32 %2, i32* %9, align 4
  store i32* %3, i32** %10, align 8
  store double* %4, double** %11, align 8
  store %struct.gr_info* %5, %struct.gr_info** %12, align 8
  store i32 0, i32* %14, align 4
  %17 = load i32, i32* %9, align 4
  store i32 %17, i32* %15, align 4
  store i32 0, i32* %16, align 4
  br label %18

; <label>:18:                                     ; preds = %92, %6
  %19 = load i32, i32* %15, align 4
  %20 = load %struct.gr_info*, %struct.gr_info** %12, align 8
  %21 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %20, i32 0, i32 3
  store i32 %19, i32* %21, align 4
  %22 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %23 = load i32*, i32** %10, align 8
  %24 = load double*, double** %11, align 8
  %25 = load %struct.gr_info*, %struct.gr_info** %12, align 8
  %26 = call i32 @count_bits(%struct.lame_global_flags* %22, i32* %23, double* %24, %struct.gr_info* %25)
  store i32 %26, i32* %13, align 4
  %27 = load i32, i32* @bin_search_StepSize2.CurrentStep, align 4
  %28 = icmp eq i32 %27, 1
  br i1 %28, label %29, label %31

; <label>:29:                                     ; preds = %18
  %pgocount = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_bin_search_StepSize2, i64 0, i64 9)
  %30 = add i64 %pgocount, 1
  store i64 %30, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_bin_search_StepSize2, i64 0, i64 9)
  br label %93

; <label>:31:                                     ; preds = %18
  %32 = load i32, i32* %14, align 4
  %33 = icmp ne i32 %32, 0
  br i1 %33, label %34, label %38

; <label>:34:                                     ; preds = %31
  %pgocount1 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_bin_search_StepSize2, i64 0, i64 0)
  %35 = add i64 %pgocount1, 1
  store i64 %35, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_bin_search_StepSize2, i64 0, i64 0)
  %36 = load i32, i32* @bin_search_StepSize2.CurrentStep, align 4
  %37 = sdiv i32 %36, 2
  store i32 %37, i32* @bin_search_StepSize2.CurrentStep, align 4
  br label %38

; <label>:38:                                     ; preds = %34, %31
  %39 = load i32, i32* %13, align 4
  %40 = load i32, i32* %8, align 4
  %41 = icmp sgt i32 %39, %40
  br i1 %41, label %42, label %63

; <label>:42:                                     ; preds = %38
  %43 = load i32, i32* %16, align 4
  %44 = icmp eq i32 %43, 2
  br i1 %44, label %45, label %53

; <label>:45:                                     ; preds = %42
  %pgocount2 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_bin_search_StepSize2, i64 0, i64 3)
  %46 = add i64 %pgocount2, 1
  store i64 %46, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_bin_search_StepSize2, i64 0, i64 3)
  %47 = load i32, i32* %14, align 4
  %48 = icmp ne i32 %47, 0
  br i1 %48, label %53, label %49

; <label>:49:                                     ; preds = %45
  %pgocount3 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_bin_search_StepSize2, i64 0, i64 5)
  %50 = add i64 %pgocount3, 1
  store i64 %50, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_bin_search_StepSize2, i64 0, i64 5)
  store i32 1, i32* %14, align 4
  %51 = load i32, i32* @bin_search_StepSize2.CurrentStep, align 4
  %52 = sdiv i32 %51, 2
  store i32 %52, i32* @bin_search_StepSize2.CurrentStep, align 4
  br label %53

; <label>:53:                                     ; preds = %49, %45, %42
  store i32 1, i32* %16, align 4
  %54 = load i32, i32* @bin_search_StepSize2.CurrentStep, align 4
  %55 = load i32, i32* %15, align 4
  %56 = add nsw i32 %55, %54
  store i32 %56, i32* %15, align 4
  %57 = load i32, i32* %15, align 4
  %58 = icmp sgt i32 %57, 255
  br i1 %58, label %59, label %61

; <label>:59:                                     ; preds = %53
  %pgocount4 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_bin_search_StepSize2, i64 0, i64 10)
  %60 = add i64 %pgocount4, 1
  store i64 %60, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_bin_search_StepSize2, i64 0, i64 10)
  br label %93

; <label>:61:                                     ; preds = %53
  %pgocount5 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_bin_search_StepSize2, i64 0, i64 1)
  %62 = add i64 %pgocount5, 1
  store i64 %62, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_bin_search_StepSize2, i64 0, i64 1)
  br label %91

; <label>:63:                                     ; preds = %38
  %64 = load i32, i32* %13, align 4
  %65 = load i32, i32* %8, align 4
  %66 = icmp slt i32 %64, %65
  br i1 %66, label %67, label %87

; <label>:67:                                     ; preds = %63
  %68 = load i32, i32* %16, align 4
  %69 = icmp eq i32 %68, 1
  br i1 %69, label %70, label %78

; <label>:70:                                     ; preds = %67
  %pgocount6 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_bin_search_StepSize2, i64 0, i64 4)
  %71 = add i64 %pgocount6, 1
  store i64 %71, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_bin_search_StepSize2, i64 0, i64 4)
  %72 = load i32, i32* %14, align 4
  %73 = icmp ne i32 %72, 0
  br i1 %73, label %78, label %74

; <label>:74:                                     ; preds = %70
  %pgocount7 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_bin_search_StepSize2, i64 0, i64 6)
  %75 = add i64 %pgocount7, 1
  store i64 %75, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_bin_search_StepSize2, i64 0, i64 6)
  store i32 1, i32* %14, align 4
  %76 = load i32, i32* @bin_search_StepSize2.CurrentStep, align 4
  %77 = sdiv i32 %76, 2
  store i32 %77, i32* @bin_search_StepSize2.CurrentStep, align 4
  br label %78

; <label>:78:                                     ; preds = %74, %70, %67
  store i32 2, i32* %16, align 4
  %79 = load i32, i32* @bin_search_StepSize2.CurrentStep, align 4
  %80 = load i32, i32* %15, align 4
  %81 = sub nsw i32 %80, %79
  store i32 %81, i32* %15, align 4
  %82 = load i32, i32* %15, align 4
  %83 = icmp slt i32 %82, 0
  br i1 %83, label %84, label %86

; <label>:84:                                     ; preds = %78
  %pgocount8 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_bin_search_StepSize2, i64 0, i64 12)
  %85 = add i64 %pgocount8, 1
  store i64 %85, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_bin_search_StepSize2, i64 0, i64 12)
  br label %93

; <label>:86:                                     ; preds = %78
  br label %89

; <label>:87:                                     ; preds = %63
  %pgocount9 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_bin_search_StepSize2, i64 0, i64 11)
  %88 = add i64 %pgocount9, 1
  store i64 %88, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_bin_search_StepSize2, i64 0, i64 11)
  br label %93

; <label>:89:                                     ; preds = %86
  %pgocount10 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_bin_search_StepSize2, i64 0, i64 2)
  %90 = add i64 %pgocount10, 1
  store i64 %90, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_bin_search_StepSize2, i64 0, i64 2)
  br label %91

; <label>:91:                                     ; preds = %89, %61
  br label %92

; <label>:92:                                     ; preds = %91
  br i1 true, label %18, label %93

; <label>:93:                                     ; preds = %92, %87, %84, %59, %29
  %94 = load i32, i32* %9, align 4
  %95 = load i32, i32* %15, align 4
  %96 = sub nsw i32 %94, %95
  %97 = call i32 @abs(i32 %96) #7
  store i32 %97, i32* @bin_search_StepSize2.CurrentStep, align 4
  %98 = load i32, i32* @bin_search_StepSize2.CurrentStep, align 4
  %99 = icmp sge i32 %98, 4
  br i1 %99, label %100, label %102

; <label>:100:                                    ; preds = %93
  %pgocount11 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_bin_search_StepSize2, i64 0, i64 7)
  %101 = add i64 %pgocount11, 1
  store i64 %101, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_bin_search_StepSize2, i64 0, i64 7)
  store i32 4, i32* @bin_search_StepSize2.CurrentStep, align 4
  br label %104

; <label>:102:                                    ; preds = %93
  %pgocount12 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_bin_search_StepSize2, i64 0, i64 8)
  %103 = add i64 %pgocount12, 1
  store i64 %103, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_bin_search_StepSize2, i64 0, i64 8)
  store i32 2, i32* @bin_search_StepSize2.CurrentStep, align 4
  br label %104

; <label>:104:                                    ; preds = %102, %100
  %105 = load i32, i32* %13, align 4
  ret i32 %105
}

; Function Attrs: nounwind readnone
declare i32 @abs(i32) #4

; Function Attrs: nounwind uwtable
define void @quantize_xrpow(double*, i32*, %struct.gr_info*) #0 {
  %4 = alloca double*, align 8
  %5 = alloca i32*, align 8
  %6 = alloca %struct.gr_info*, align 8
  %7 = alloca double, align 8
  %8 = alloca double, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  store double* %0, double** %4, align 8
  store i32* %1, i32** %5, align 8
  store %struct.gr_info* %2, %struct.gr_info** %6, align 8
  %11 = load %struct.gr_info*, %struct.gr_info** %6, align 8
  %12 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %11, i32 0, i32 3
  %13 = load i32, i32* %12, align 4
  %14 = zext i32 %13 to i64
  %15 = getelementptr inbounds [256 x double], [256 x double]* @ipow20, i64 0, i64 %14
  %16 = load double, double* %15, align 8
  store double %16, double* %7, align 8
  store i32 144, i32* %9, align 4
  br label %17

; <label>:17:                                     ; preds = %85, %3
  %18 = load i32, i32* %9, align 4
  %19 = icmp sgt i32 %18, 0
  br i1 %19, label %20, label %89

; <label>:20:                                     ; preds = %17
  %21 = load double*, double** %4, align 8
  %22 = getelementptr inbounds double, double* %21, i32 1
  store double* %22, double** %4, align 8
  %23 = load double, double* %21, align 8
  %24 = load double, double* %7, align 8
  %25 = fmul double %23, %24
  store double %25, double* %8, align 8
  %26 = load double, double* %8, align 8
  %27 = fptosi double %26 to i32
  store i32 %27, i32* %10, align 4
  %28 = load double, double* %8, align 8
  %29 = load i32, i32* %10, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [8208 x double], [8208 x double]* @adj43, i64 0, i64 %30
  %32 = load double, double* %31, align 8
  %33 = fadd double %28, %32
  %34 = fptosi double %33 to i32
  %35 = load i32*, i32** %5, align 8
  %36 = getelementptr inbounds i32, i32* %35, i32 1
  store i32* %36, i32** %5, align 8
  store i32 %34, i32* %35, align 4
  %37 = load double*, double** %4, align 8
  %38 = getelementptr inbounds double, double* %37, i32 1
  store double* %38, double** %4, align 8
  %39 = load double, double* %37, align 8
  %40 = load double, double* %7, align 8
  %41 = fmul double %39, %40
  store double %41, double* %8, align 8
  %42 = load double, double* %8, align 8
  %43 = fptosi double %42 to i32
  store i32 %43, i32* %10, align 4
  %44 = load double, double* %8, align 8
  %45 = load i32, i32* %10, align 4
  %46 = sext i32 %45 to i64
  %47 = getelementptr inbounds [8208 x double], [8208 x double]* @adj43, i64 0, i64 %46
  %48 = load double, double* %47, align 8
  %49 = fadd double %44, %48
  %50 = fptosi double %49 to i32
  %51 = load i32*, i32** %5, align 8
  %52 = getelementptr inbounds i32, i32* %51, i32 1
  store i32* %52, i32** %5, align 8
  store i32 %50, i32* %51, align 4
  %53 = load double*, double** %4, align 8
  %54 = getelementptr inbounds double, double* %53, i32 1
  store double* %54, double** %4, align 8
  %55 = load double, double* %53, align 8
  %56 = load double, double* %7, align 8
  %57 = fmul double %55, %56
  store double %57, double* %8, align 8
  %58 = load double, double* %8, align 8
  %59 = fptosi double %58 to i32
  store i32 %59, i32* %10, align 4
  %60 = load double, double* %8, align 8
  %61 = load i32, i32* %10, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds [8208 x double], [8208 x double]* @adj43, i64 0, i64 %62
  %64 = load double, double* %63, align 8
  %65 = fadd double %60, %64
  %66 = fptosi double %65 to i32
  %67 = load i32*, i32** %5, align 8
  %68 = getelementptr inbounds i32, i32* %67, i32 1
  store i32* %68, i32** %5, align 8
  store i32 %66, i32* %67, align 4
  %69 = load double*, double** %4, align 8
  %70 = getelementptr inbounds double, double* %69, i32 1
  store double* %70, double** %4, align 8
  %71 = load double, double* %69, align 8
  %72 = load double, double* %7, align 8
  %73 = fmul double %71, %72
  store double %73, double* %8, align 8
  %74 = load double, double* %8, align 8
  %75 = fptosi double %74 to i32
  store i32 %75, i32* %10, align 4
  %76 = load double, double* %8, align 8
  %77 = load i32, i32* %10, align 4
  %78 = sext i32 %77 to i64
  %79 = getelementptr inbounds [8208 x double], [8208 x double]* @adj43, i64 0, i64 %78
  %80 = load double, double* %79, align 8
  %81 = fadd double %76, %80
  %82 = fptosi double %81 to i32
  %83 = load i32*, i32** %5, align 8
  %84 = getelementptr inbounds i32, i32* %83, i32 1
  store i32* %84, i32** %5, align 8
  store i32 %82, i32* %83, align 4
  br label %85

; <label>:85:                                     ; preds = %20
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_quantize_xrpow, i64 0, i64 0)
  %86 = add i64 %pgocount, 1
  store i64 %86, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_quantize_xrpow, i64 0, i64 0)
  %87 = load i32, i32* %9, align 4
  %88 = add nsw i32 %87, -1
  store i32 %88, i32* %9, align 4
  br label %17

; <label>:89:                                     ; preds = %17
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_quantize_xrpow, i64 0, i64 1)
  %90 = add i64 %pgocount1, 1
  store i64 %90, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_quantize_xrpow, i64 0, i64 1)
  ret void
}

; Function Attrs: nounwind uwtable
define void @quantize_xrpow_ISO(double*, i32*, %struct.gr_info*) #0 {
  %4 = alloca double*, align 8
  %5 = alloca i32*, align 8
  %6 = alloca %struct.gr_info*, align 8
  %7 = alloca double, align 8
  %8 = alloca i32, align 4
  %9 = alloca double, align 8
  store double* %0, double** %4, align 8
  store i32* %1, i32** %5, align 8
  store %struct.gr_info* %2, %struct.gr_info** %6, align 8
  %10 = load %struct.gr_info*, %struct.gr_info** %6, align 8
  %11 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %10, i32 0, i32 3
  %12 = load i32, i32* %11, align 4
  %13 = zext i32 %12 to i64
  %14 = getelementptr inbounds [256 x double], [256 x double]* @ipow20, i64 0, i64 %13
  %15 = load double, double* %14, align 8
  store double %15, double* %7, align 8
  %16 = load double, double* %7, align 8
  %17 = fdiv double 5.946000e-01, %16
  store double %17, double* %9, align 8
  store i32 576, i32* %8, align 4
  br label %18

; <label>:18:                                     ; preds = %44, %3
  %19 = load i32, i32* %8, align 4
  %20 = icmp sgt i32 %19, 0
  br i1 %20, label %21, label %47

; <label>:21:                                     ; preds = %18
  %22 = load double, double* %9, align 8
  %23 = load double*, double** %4, align 8
  %24 = load double, double* %23, align 8
  %25 = fcmp ogt double %22, %24
  br i1 %25, label %26, label %32

; <label>:26:                                     ; preds = %21
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_quantize_xrpow_ISO, i64 0, i64 0)
  %27 = add i64 %pgocount, 1
  store i64 %27, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_quantize_xrpow_ISO, i64 0, i64 0)
  %28 = load i32*, i32** %5, align 8
  %29 = getelementptr inbounds i32, i32* %28, i32 1
  store i32* %29, i32** %5, align 8
  store i32 0, i32* %28, align 4
  %30 = load double*, double** %4, align 8
  %31 = getelementptr inbounds double, double* %30, i32 1
  store double* %31, double** %4, align 8
  br label %43

; <label>:32:                                     ; preds = %21
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_quantize_xrpow_ISO, i64 0, i64 1)
  %33 = add i64 %pgocount1, 1
  store i64 %33, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_quantize_xrpow_ISO, i64 0, i64 1)
  %34 = load double, double* %7, align 8
  %35 = load double*, double** %4, align 8
  %36 = getelementptr inbounds double, double* %35, i32 1
  store double* %36, double** %4, align 8
  %37 = load double, double* %35, align 8
  %38 = fmul double %34, %37
  %39 = fadd double %38, 4.054000e-01
  %40 = fptosi double %39 to i32
  %41 = load i32*, i32** %5, align 8
  %42 = getelementptr inbounds i32, i32* %41, i32 1
  store i32* %42, i32** %5, align 8
  store i32 %40, i32* %41, align 4
  br label %43

; <label>:43:                                     ; preds = %32, %26
  br label %44

; <label>:44:                                     ; preds = %43
  %45 = load i32, i32* %8, align 4
  %46 = add nsw i32 %45, -1
  store i32 %46, i32* %8, align 4
  br label %18

; <label>:47:                                     ; preds = %18
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_quantize_xrpow_ISO, i64 0, i64 2)
  %48 = add i64 %pgocount2, 1
  store i64 %48, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_quantize_xrpow_ISO, i64 0, i64 2)
  ret void
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #5

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind }
attributes #6 = { noreturn nounwind }
attributes #7 = { nounwind readnone }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
