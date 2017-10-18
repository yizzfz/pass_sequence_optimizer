; ModuleID = 'tmp1.ll'
source_filename = "mpilib.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

$__llvm_profile_raw_version = comdat any

@global_precision = global i16 0, align 2
@munit_prec = common global i16 0, align 2
@reciph = internal global i16 0, align 2
@recipl = internal global i16 0, align 2
@mshift = internal global i32 0, align 4
@mutemp = internal global i16 0, align 2
@modulus = internal global [130 x i16] zeroinitializer, align 16
@modmpl = internal global i16* null, align 8
@nbits = internal global i16 0, align 2
@modlenMULTUNITS = internal global i16 0, align 2
@mod_divisor = internal global [4 x i16] zeroinitializer, align 2
@mod_quotient = internal global [4 x i16] zeroinitializer, align 2
@ds_data = internal global [262 x i16] zeroinitializer, align 16
@.str = private unnamed_addr constant [26 x i8] c"(c)1986 Philip Zimmermann\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_mp_addc = private constant [7 x i8] c"mp_addc"
@__profn_mp_subb = private constant [7 x i8] c"mp_subb"
@__profn_mp_rotate_left = private constant [14 x i8] c"mp_rotate_left"
@__profn_mp_shift_right_bits = private constant [19 x i8] c"mp_shift_right_bits"
@__profn_mp_compare = private constant [10 x i8] c"mp_compare"
@__profn_mp_inc = private constant [6 x i8] c"mp_inc"
@__profn_mp_dec = private constant [6 x i8] c"mp_dec"
@__profn_mp_neg = private constant [6 x i8] c"mp_neg"
@__profn_mp_init = private constant [7 x i8] c"mp_init"
@__profn_significance = private constant [12 x i8] c"significance"
@__profn_mp_udiv = private constant [7 x i8] c"mp_udiv"
@__profn_mp_recip = private constant [8 x i8] c"mp_recip"
@__profn_countbits = private constant [9 x i8] c"countbits"
@__profn_mp_div = private constant [6 x i8] c"mp_div"
@__profn_mp_shortdiv = private constant [11 x i8] c"mp_shortdiv"
@__profn_mp_mod = private constant [6 x i8] c"mp_mod"
@__profn_mp_shortmod = private constant [11 x i8] c"mp_shortmod"
@__profn_mp_mult = private constant [7 x i8] c"mp_mult"
@__profn_mp_smul = private constant [7 x i8] c"mp_smul"
@__profn_mp_dmul = private constant [7 x i8] c"mp_dmul"
@__profn_mp_quo_digit = private constant [12 x i8] c"mp_quo_digit"
@__profn_stage_smith_modulus = private constant [19 x i8] c"stage_smith_modulus"
@__profn_smith_modmult = private constant [13 x i8] c"smith_modmult"
@__profn_smith_burn = private constant [10 x i8] c"smith_burn"
@__profn_copyright_notice = private constant [16 x i8] c"copyright_notice"
@__profn_mp_modexp = private constant [9 x i8] c"mp_modexp"
@__profn_mp_modexp_crt = private constant [13 x i8] c"mp_modexp_crt"
@__profc_mp_addc = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mp_addc = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7021232722181815280, i64 43380092889, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_mp_addc, i32 0, i32 0), i8* bitcast (i8 (i16*, i16*, i8)* @mp_addc to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_mp_subb = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mp_subb = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1849230132743695244, i64 43380092889, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_mp_subb, i32 0, i32 0), i8* bitcast (i8 (i16*, i16*, i8)* @mp_subb to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_mp_rotate_left = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mp_rotate_left = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6379676756677814107, i64 29212902728, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mp_rotate_left, i32 0, i32 0), i8* bitcast (i8 (i16*, i8)* @mp_rotate_left to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_mp_shift_right_bits = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mp_shift_right_bits = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5146988270682440752, i64 74012308050, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_mp_shift_right_bits, i32 0, i32 0), i8* bitcast (void (i16*, i16)* @mp_shift_right_bits to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_mp_compare = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mp_compare = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -280937036827351610, i64 56147058007, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_mp_compare, i32 0, i32 0), i8* bitcast (i16 (i16*, i16*)* @mp_compare to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_mp_inc = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mp_inc = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7806222436204453543, i64 43433320560, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_mp_inc, i32 0, i32 0), i8* bitcast (i8 (i16*)* @mp_inc to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_mp_dec = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mp_dec = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7019416681759913789, i64 43433320560, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_mp_dec, i32 0, i32 0), i8* bitcast (i8 (i16*)* @mp_dec to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_mp_neg = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mp_neg = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5002818303449803299, i64 26545607443, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mp_neg, i32 0, i32 0), i8* bitcast (void (i16*)* @mp_neg to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_mp_init = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mp_init = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6591577018980056898, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_mp_init, i32 0, i32 0), i8* bitcast (void (i16*, i16)* @mp_init to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_significance = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_significance = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 9170239919320469812, i64 43433320560, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_significance, i32 0, i32 0), i8* bitcast (i16 (i16*)* @significance to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_mp_udiv = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mp_udiv = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4409400744619056298, i64 110689155346, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_udiv, i32 0, i32 0), i8* bitcast (i32 (i16*, i16*, i16*, i16*)* @mp_udiv to i8*), i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_mp_recip = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mp_recip = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5010689475881314941, i64 80400176438, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_mp_recip, i32 0, i32 0), i8* bitcast (i32 (i16*, i16*)* @mp_recip to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_countbits = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_countbits = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7888776582398651920, i64 45078935416, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_countbits, i32 0, i32 0), i8* bitcast (i32 (i16*)* @countbits to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_mp_div = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mp_div = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3954461829870279649, i64 104535587561, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_div, i32 0, i32 0), i8* bitcast (i32 (i16*, i16*, i16*, i16*)* @mp_div to i8*), i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_mp_shortdiv = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mp_shortdiv = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6060331204103511974, i64 114621145662, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_shortdiv, i32 0, i32 0), i8* bitcast (i16 (i16*, i16*, i16)* @mp_shortdiv to i8*), i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_mp_mod = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mp_mod = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3283535044168962506, i64 110689155346, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_mod, i32 0, i32 0), i8* bitcast (i32 (i16*, i16*, i16*)* @mp_mod to i8*), i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_mp_shortmod = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mp_shortmod = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7777624365419025237, i64 114621145662, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_shortmod, i32 0, i32 0), i8* bitcast (i16 (i16*, i16)* @mp_shortmod to i8*), i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_mp_mult = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mp_mult = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8627020174818515195, i64 110689155346, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_mult, i32 0, i32 0), i8* bitcast (i32 (i16*, i16*, i16*)* @mp_mult to i8*), i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_mp_smul = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mp_smul = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8091597723633964468, i64 34137660316, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mp_smul, i32 0, i32 0), i8* bitcast (void (i16*, i16*, i16)* @mp_smul to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_mp_dmul = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mp_dmul = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3341327043952728748, i64 34137660316, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mp_dmul, i32 0, i32 0), i8* bitcast (void (i16*, i16*, i16*)* @mp_dmul to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_mp_quo_digit = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mp_quo_digit = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1449891185491795373, i64 29667547796, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mp_quo_digit, i32 0, i32 0), i8* bitcast (i16 (i16*)* @mp_quo_digit to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_stage_smith_modulus = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_stage_smith_modulus = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7187897160414048668, i64 25571299074, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_stage_smith_modulus, i32 0, i32 0), i8* bitcast (i32 (i16*)* @stage_smith_modulus to i8*), i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_smith_modmult = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_smith_modmult = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8327864851666226960, i64 88053941768, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_smith_modmult, i32 0, i32 0), i8* bitcast (i32 (i16*, i16*, i16*)* @smith_modmult to i8*), i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_smith_burn = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_smith_burn = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3071045080436209659, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_smith_burn, i32 0, i32 0), i8* bitcast (void ()* @smith_burn to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_copyright_notice = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_copyright_notice = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5756492735942533267, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_copyright_notice, i32 0, i32 0), i8* bitcast (i8* ()* @copyright_notice to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_mp_modexp = private global [16 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mp_modexp = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -609963519338975161, i64 208241655243, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_mp_modexp, i32 0, i32 0), i8* bitcast (i32 (i16*, i16*, i16*, i16*)* @mp_modexp to i8*), i8* null, i32 16, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_mp_modexp_crt = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mp_modexp_crt = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -6644372674819551662, i64 55167759196, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_mp_modexp_crt, i32 0, i32 0), i8* bitcast (i32 (i16*, i16*, i16*, i16*, i16*, i16*, i16*)* @mp_modexp_crt to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [294 x i8] c"\A3\02\00mp_addc\01mp_subb\01mp_rotate_left\01mp_shift_right_bits\01mp_compare\01mp_inc\01mp_dec\01mp_neg\01mp_init\01significance\01mp_udiv\01mp_recip\01countbits\01mp_div\01mp_shortdiv\01mp_mod\01mp_shortmod\01mp_mult\01mp_smul\01mp_dmul\01mp_quo_digit\01stage_smith_modulus\01smith_modmult\01smith_burn\01copyright_notice\01mp_modexp\01mp_modexp_crt", section "__llvm_prf_names"
@llvm.used = appending global [28 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mp_addc to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mp_subb to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mp_rotate_left to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mp_shift_right_bits to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mp_compare to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mp_inc to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mp_dec to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mp_neg to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mp_init to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_significance to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mp_udiv to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mp_recip to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_countbits to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mp_div to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mp_shortdiv to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mp_mod to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mp_shortmod to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mp_mult to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mp_smul to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mp_dmul to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mp_quo_digit to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_stage_smith_modulus to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_smith_modmult to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_smith_burn to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_copyright_notice to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mp_modexp to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mp_modexp_crt to i8*), i8* getelementptr inbounds ([294 x i8], [294 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define zeroext i8 @mp_addc(i16*, i16*, i8 zeroext) #0 {
  %4 = alloca i16*, align 8
  %5 = alloca i16*, align 8
  %6 = alloca i8, align 1
  %7 = alloca i16, align 2
  %8 = alloca i16, align 2
  store i16* %0, i16** %4, align 8
  store i16* %1, i16** %5, align 8
  store i8 %2, i8* %6, align 1
  %9 = load i16, i16* @global_precision, align 2
  store i16 %9, i16* %8, align 2
  br label %10

; <label>:10:                                     ; preds = %58, %3
  %11 = load i16, i16* %8, align 2
  %12 = add i16 %11, -1
  store i16 %12, i16* %8, align 2
  %13 = icmp ne i16 %11, 0
  br i1 %13, label %14, label %64

; <label>:14:                                     ; preds = %10
  %15 = load i8, i8* %6, align 1
  %16 = icmp ne i8 %15, 0
  br i1 %16, label %17, label %40

; <label>:17:                                     ; preds = %14
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_mp_addc, i64 0, i64 0)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_mp_addc, i64 0, i64 0)
  %19 = load i16*, i16** %4, align 8
  %20 = load i16, i16* %19, align 2
  %21 = zext i16 %20 to i32
  %22 = load i16*, i16** %5, align 8
  %23 = load i16, i16* %22, align 2
  %24 = zext i16 %23 to i32
  %25 = add nsw i32 %21, %24
  %26 = add nsw i32 %25, 1
  %27 = trunc i32 %26 to i16
  store i16 %27, i16* %7, align 2
  %28 = load i16*, i16** %5, align 8
  %29 = load i16, i16* %28, align 2
  %30 = zext i16 %29 to i32
  %31 = load i16*, i16** %4, align 8
  %32 = load i16, i16* %31, align 2
  %33 = zext i16 %32 to i32
  %34 = xor i32 %33, -1
  %35 = trunc i32 %34 to i16
  %36 = zext i16 %35 to i32
  %37 = icmp sge i32 %30, %36
  %38 = zext i1 %37 to i32
  %39 = trunc i32 %38 to i8
  store i8 %39, i8* %6, align 1
  br label %58

; <label>:40:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_mp_addc, i64 0, i64 1)
  %41 = add i64 %pgocount1, 1
  store i64 %41, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_mp_addc, i64 0, i64 1)
  %42 = load i16*, i16** %4, align 8
  %43 = load i16, i16* %42, align 2
  %44 = zext i16 %43 to i32
  %45 = load i16*, i16** %5, align 8
  %46 = load i16, i16* %45, align 2
  %47 = zext i16 %46 to i32
  %48 = add nsw i32 %44, %47
  %49 = trunc i32 %48 to i16
  store i16 %49, i16* %7, align 2
  %50 = load i16, i16* %7, align 2
  %51 = zext i16 %50 to i32
  %52 = load i16*, i16** %4, align 8
  %53 = load i16, i16* %52, align 2
  %54 = zext i16 %53 to i32
  %55 = icmp slt i32 %51, %54
  %56 = zext i1 %55 to i32
  %57 = trunc i32 %56 to i8
  store i8 %57, i8* %6, align 1
  br label %58

; <label>:58:                                     ; preds = %40, %17
  %59 = load i16*, i16** %5, align 8
  %60 = getelementptr inbounds i16, i16* %59, i32 1
  store i16* %60, i16** %5, align 8
  %61 = load i16, i16* %7, align 2
  %62 = load i16*, i16** %4, align 8
  %63 = getelementptr inbounds i16, i16* %62, i32 1
  store i16* %63, i16** %4, align 8
  store i16 %61, i16* %62, align 2
  br label %10

; <label>:64:                                     ; preds = %10
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_mp_addc, i64 0, i64 2)
  %65 = add i64 %pgocount2, 1
  store i64 %65, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_mp_addc, i64 0, i64 2)
  %66 = load i8, i8* %6, align 1
  ret i8 %66
}

; Function Attrs: noinline nounwind uwtable
define zeroext i8 @mp_subb(i16*, i16*, i8 zeroext) #0 {
  %4 = alloca i16*, align 8
  %5 = alloca i16*, align 8
  %6 = alloca i8, align 1
  %7 = alloca i16, align 2
  %8 = alloca i16, align 2
  store i16* %0, i16** %4, align 8
  store i16* %1, i16** %5, align 8
  store i8 %2, i8* %6, align 1
  %9 = load i16, i16* @global_precision, align 2
  store i16 %9, i16* %8, align 2
  br label %10

; <label>:10:                                     ; preds = %56, %3
  %11 = load i16, i16* %8, align 2
  %12 = add i16 %11, -1
  store i16 %12, i16* %8, align 2
  %13 = icmp ne i16 %11, 0
  br i1 %13, label %14, label %62

; <label>:14:                                     ; preds = %10
  %15 = load i8, i8* %6, align 1
  %16 = icmp ne i8 %15, 0
  br i1 %16, label %17, label %37

; <label>:17:                                     ; preds = %14
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_mp_subb, i64 0, i64 0)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_mp_subb, i64 0, i64 0)
  %19 = load i16*, i16** %4, align 8
  %20 = load i16, i16* %19, align 2
  %21 = zext i16 %20 to i32
  %22 = load i16*, i16** %5, align 8
  %23 = load i16, i16* %22, align 2
  %24 = zext i16 %23 to i32
  %25 = sub nsw i32 %21, %24
  %26 = sub nsw i32 %25, 1
  %27 = trunc i32 %26 to i16
  store i16 %27, i16* %7, align 2
  %28 = load i16*, i16** %4, align 8
  %29 = load i16, i16* %28, align 2
  %30 = zext i16 %29 to i32
  %31 = load i16*, i16** %5, align 8
  %32 = load i16, i16* %31, align 2
  %33 = zext i16 %32 to i32
  %34 = icmp sle i32 %30, %33
  %35 = zext i1 %34 to i32
  %36 = trunc i32 %35 to i8
  store i8 %36, i8* %6, align 1
  br label %56

; <label>:37:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_mp_subb, i64 0, i64 1)
  %38 = add i64 %pgocount1, 1
  store i64 %38, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_mp_subb, i64 0, i64 1)
  %39 = load i16*, i16** %4, align 8
  %40 = load i16, i16* %39, align 2
  %41 = zext i16 %40 to i32
  %42 = load i16*, i16** %5, align 8
  %43 = load i16, i16* %42, align 2
  %44 = zext i16 %43 to i32
  %45 = sub nsw i32 %41, %44
  %46 = trunc i32 %45 to i16
  store i16 %46, i16* %7, align 2
  %47 = load i16*, i16** %4, align 8
  %48 = load i16, i16* %47, align 2
  %49 = zext i16 %48 to i32
  %50 = load i16*, i16** %5, align 8
  %51 = load i16, i16* %50, align 2
  %52 = zext i16 %51 to i32
  %53 = icmp slt i32 %49, %52
  %54 = zext i1 %53 to i32
  %55 = trunc i32 %54 to i8
  store i8 %55, i8* %6, align 1
  br label %56

; <label>:56:                                     ; preds = %37, %17
  %57 = load i16*, i16** %5, align 8
  %58 = getelementptr inbounds i16, i16* %57, i32 1
  store i16* %58, i16** %5, align 8
  %59 = load i16, i16* %7, align 2
  %60 = load i16*, i16** %4, align 8
  %61 = getelementptr inbounds i16, i16* %60, i32 1
  store i16* %61, i16** %4, align 8
  store i16 %59, i16* %60, align 2
  br label %10

; <label>:62:                                     ; preds = %10
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_mp_subb, i64 0, i64 2)
  %63 = add i64 %pgocount2, 1
  store i64 %63, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_mp_subb, i64 0, i64 2)
  %64 = load i8, i8* %6, align 1
  ret i8 %64
}

; Function Attrs: noinline nounwind uwtable
define zeroext i8 @mp_rotate_left(i16*, i8 zeroext) #0 {
  %3 = alloca i16*, align 8
  %4 = alloca i8, align 1
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  store i16* %0, i16** %3, align 8
  store i8 %1, i8* %4, align 1
  %8 = load i8, i8* %4, align 1
  %9 = zext i8 %8 to i32
  store i32 %9, i32* %6, align 4
  %10 = load i16, i16* @global_precision, align 2
  %11 = sext i16 %10 to i32
  store i32 %11, i32* %5, align 4
  br label %12

; <label>:12:                                     ; preds = %16, %2
  %13 = load i32, i32* %5, align 4
  %14 = add nsw i32 %13, -1
  store i32 %14, i32* %5, align 4
  %15 = icmp ne i32 %13, 0
  br i1 %15, label %16, label %34

; <label>:16:                                     ; preds = %12
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mp_rotate_left, i64 0, i64 0)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mp_rotate_left, i64 0, i64 0)
  %18 = load i16*, i16** %3, align 8
  %19 = load i16, i16* %18, align 2
  %20 = sext i16 %19 to i32
  %21 = icmp slt i32 %20, 0
  %22 = zext i1 %21 to i32
  store i32 %22, i32* %7, align 4
  %23 = load i16*, i16** %3, align 8
  %24 = load i16, i16* %23, align 2
  %25 = zext i16 %24 to i32
  %26 = shl i32 %25, 1
  %27 = load i32, i32* %6, align 4
  %28 = or i32 %26, %27
  %29 = trunc i32 %28 to i16
  %30 = load i16*, i16** %3, align 8
  store i16 %29, i16* %30, align 2
  %31 = load i32, i32* %7, align 4
  store i32 %31, i32* %6, align 4
  %32 = load i16*, i16** %3, align 8
  %33 = getelementptr inbounds i16, i16* %32, i32 1
  store i16* %33, i16** %3, align 8
  br label %12

; <label>:34:                                     ; preds = %12
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mp_rotate_left, i64 0, i64 1)
  %35 = add i64 %pgocount1, 1
  store i64 %35, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mp_rotate_left, i64 0, i64 1)
  %36 = load i32, i32* %7, align 4
  %37 = trunc i32 %36 to i8
  ret i8 %37
}

; Function Attrs: noinline nounwind uwtable
define void @mp_shift_right_bits(i16*, i16 signext) #0 {
  %3 = alloca i16*, align 8
  %4 = alloca i16, align 2
  %5 = alloca i16, align 2
  %6 = alloca i16, align 2
  %7 = alloca i16, align 2
  %8 = alloca i16, align 2
  %9 = alloca i16, align 2
  store i16* %0, i16** %3, align 8
  store i16 %1, i16* %4, align 2
  %10 = load i16, i16* %4, align 2
  %11 = sext i16 %10 to i32
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_mp_shift_right_bits, i64 0, i64 2)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_mp_shift_right_bits, i64 0, i64 2)
  br label %87

; <label>:15:                                     ; preds = %2
  store i16 0, i16* %6, align 2
  %16 = load i16, i16* %4, align 2
  %17 = sext i16 %16 to i32
  %18 = shl i32 1, %17
  %19 = sub nsw i32 %18, 1
  %20 = trunc i32 %19 to i16
  store i16 %20, i16* %8, align 2
  %21 = load i16, i16* %4, align 2
  %22 = sext i16 %21 to i32
  %23 = sub nsw i32 16, %22
  %24 = trunc i32 %23 to i16
  store i16 %24, i16* %9, align 2
  %25 = load i16, i16* @global_precision, align 2
  store i16 %25, i16* %5, align 2
  %26 = load i16*, i16** %3, align 8
  %27 = load i16, i16* %5, align 2
  %28 = sext i16 %27 to i32
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i16, i16* %26, i64 %29
  %31 = getelementptr inbounds i16, i16* %30, i64 -1
  store i16* %31, i16** %3, align 8
  %32 = load i16, i16* %4, align 2
  %33 = sext i16 %32 to i32
  %34 = icmp eq i32 %33, 16
  br i1 %34, label %35, label %51

; <label>:35:                                     ; preds = %15
  br label %36

; <label>:36:                                     ; preds = %40, %35
  %37 = load i16, i16* %5, align 2
  %38 = add i16 %37, -1
  store i16 %38, i16* %5, align 2
  %39 = icmp ne i16 %37, 0
  br i1 %39, label %40, label %49

; <label>:40:                                     ; preds = %36
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_mp_shift_right_bits, i64 0, i64 0)
  %41 = add i64 %pgocount1, 1
  store i64 %41, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_mp_shift_right_bits, i64 0, i64 0)
  %42 = load i16*, i16** %3, align 8
  %43 = load i16, i16* %42, align 2
  store i16 %43, i16* %7, align 2
  %44 = load i16, i16* %6, align 2
  %45 = load i16*, i16** %3, align 8
  store i16 %44, i16* %45, align 2
  %46 = load i16, i16* %7, align 2
  store i16 %46, i16* %6, align 2
  %47 = load i16*, i16** %3, align 8
  %48 = getelementptr inbounds i16, i16* %47, i32 -1
  store i16* %48, i16** %3, align 8
  br label %36

; <label>:49:                                     ; preds = %36
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_mp_shift_right_bits, i64 0, i64 3)
  %50 = add i64 %pgocount2, 1
  store i64 %50, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_mp_shift_right_bits, i64 0, i64 3)
  br label %87

; <label>:51:                                     ; preds = %15
  br label %52

; <label>:52:                                     ; preds = %56, %51
  %53 = load i16, i16* %5, align 2
  %54 = add i16 %53, -1
  store i16 %54, i16* %5, align 2
  %55 = icmp ne i16 %53, 0
  br i1 %55, label %56, label %85

; <label>:56:                                     ; preds = %52
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_mp_shift_right_bits, i64 0, i64 1)
  %57 = add i64 %pgocount3, 1
  store i64 %57, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_mp_shift_right_bits, i64 0, i64 1)
  %58 = load i16*, i16** %3, align 8
  %59 = load i16, i16* %58, align 2
  %60 = zext i16 %59 to i32
  %61 = load i16, i16* %8, align 2
  %62 = zext i16 %61 to i32
  %63 = and i32 %60, %62
  %64 = trunc i32 %63 to i16
  store i16 %64, i16* %7, align 2
  %65 = load i16, i16* %4, align 2
  %66 = sext i16 %65 to i32
  %67 = load i16*, i16** %3, align 8
  %68 = load i16, i16* %67, align 2
  %69 = zext i16 %68 to i32
  %70 = ashr i32 %69, %66
  %71 = trunc i32 %70 to i16
  store i16 %71, i16* %67, align 2
  %72 = load i16, i16* %6, align 2
  %73 = zext i16 %72 to i32
  %74 = load i16, i16* %9, align 2
  %75 = sext i16 %74 to i32
  %76 = shl i32 %73, %75
  %77 = load i16*, i16** %3, align 8
  %78 = load i16, i16* %77, align 2
  %79 = zext i16 %78 to i32
  %80 = or i32 %79, %76
  %81 = trunc i32 %80 to i16
  store i16 %81, i16* %77, align 2
  %82 = load i16, i16* %7, align 2
  store i16 %82, i16* %6, align 2
  %83 = load i16*, i16** %3, align 8
  %84 = getelementptr inbounds i16, i16* %83, i32 -1
  store i16* %84, i16** %3, align 8
  br label %52

; <label>:85:                                     ; preds = %52
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_mp_shift_right_bits, i64 0, i64 4)
  %86 = add i64 %pgocount4, 1
  store i64 %86, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_mp_shift_right_bits, i64 0, i64 4)
  br label %87

; <label>:87:                                     ; preds = %85, %49, %13
  ret void
}

; Function Attrs: noinline nounwind uwtable
define signext i16 @mp_compare(i16*, i16*) #0 {
  %3 = alloca i16, align 2
  %4 = alloca i16*, align 8
  %5 = alloca i16*, align 8
  %6 = alloca i16, align 2
  store i16* %0, i16** %4, align 8
  store i16* %1, i16** %5, align 8
  %7 = load i16, i16* @global_precision, align 2
  store i16 %7, i16* %6, align 2
  %8 = load i16*, i16** %4, align 8
  %9 = load i16, i16* %6, align 2
  %10 = sext i16 %9 to i32
  %11 = sext i32 %10 to i64
  %12 = getelementptr inbounds i16, i16* %8, i64 %11
  %13 = getelementptr inbounds i16, i16* %12, i64 -1
  store i16* %13, i16** %4, align 8
  %14 = load i16*, i16** %5, align 8
  %15 = load i16, i16* %6, align 2
  %16 = sext i16 %15 to i32
  %17 = sext i32 %16 to i64
  %18 = getelementptr inbounds i16, i16* %14, i64 %17
  %19 = getelementptr inbounds i16, i16* %18, i64 -1
  store i16* %19, i16** %5, align 8
  br label %20

; <label>:20:                                     ; preds = %44, %2
  %21 = load i16*, i16** %4, align 8
  %22 = load i16, i16* %21, align 2
  %23 = zext i16 %22 to i32
  %24 = load i16*, i16** %5, align 8
  %25 = load i16, i16* %24, align 2
  %26 = zext i16 %25 to i32
  %27 = icmp slt i32 %23, %26
  br i1 %27, label %28, label %30

; <label>:28:                                     ; preds = %20
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_mp_compare, i64 0, i64 1)
  %29 = add i64 %pgocount, 1
  store i64 %29, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_mp_compare, i64 0, i64 1)
  store i16 -1, i16* %3, align 2
  br label %50

; <label>:30:                                     ; preds = %20
  %31 = load i16*, i16** %4, align 8
  %32 = getelementptr inbounds i16, i16* %31, i32 -1
  store i16* %32, i16** %4, align 8
  %33 = load i16, i16* %31, align 2
  %34 = zext i16 %33 to i32
  %35 = load i16*, i16** %5, align 8
  %36 = getelementptr inbounds i16, i16* %35, i32 -1
  store i16* %36, i16** %5, align 8
  %37 = load i16, i16* %35, align 2
  %38 = zext i16 %37 to i32
  %39 = icmp sgt i32 %34, %38
  br i1 %39, label %40, label %42

; <label>:40:                                     ; preds = %30
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_mp_compare, i64 0, i64 2)
  %41 = add i64 %pgocount1, 1
  store i64 %41, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_mp_compare, i64 0, i64 2)
  store i16 1, i16* %3, align 2
  br label %50

; <label>:42:                                     ; preds = %30
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_mp_compare, i64 0, i64 0)
  %43 = add i64 %pgocount2, 1
  store i64 %43, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_mp_compare, i64 0, i64 0)
  br label %44

; <label>:44:                                     ; preds = %42
  %45 = load i16, i16* %6, align 2
  %46 = add i16 %45, -1
  store i16 %46, i16* %6, align 2
  %47 = icmp ne i16 %46, 0
  br i1 %47, label %20, label %48

; <label>:48:                                     ; preds = %44
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_mp_compare, i64 0, i64 3)
  %49 = add i64 %pgocount3, 1
  store i64 %49, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_mp_compare, i64 0, i64 3)
  store i16 0, i16* %3, align 2
  br label %50

; <label>:50:                                     ; preds = %48, %40, %28
  %51 = load i16, i16* %3, align 2
  ret i16 %51
}

; Function Attrs: noinline nounwind uwtable
define zeroext i8 @mp_inc(i16*) #0 {
  %2 = alloca i8, align 1
  %3 = alloca i16*, align 8
  %4 = alloca i16, align 2
  store i16* %0, i16** %3, align 8
  %5 = load i16, i16* @global_precision, align 2
  store i16 %5, i16* %4, align 2
  br label %6

; <label>:6:                                      ; preds = %17, %1
  %7 = load i16*, i16** %3, align 8
  %8 = load i16, i16* %7, align 2
  %9 = add i16 %8, 1
  store i16 %9, i16* %7, align 2
  %10 = icmp ne i16 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %6
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_mp_inc, i64 0, i64 1)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_mp_inc, i64 0, i64 1)
  store i8 0, i8* %2, align 1
  br label %23

; <label>:13:                                     ; preds = %6
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_mp_inc, i64 0, i64 0)
  %14 = add i64 %pgocount1, 1
  store i64 %14, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_mp_inc, i64 0, i64 0)
  %15 = load i16*, i16** %3, align 8
  %16 = getelementptr inbounds i16, i16* %15, i32 1
  store i16* %16, i16** %3, align 8
  br label %17

; <label>:17:                                     ; preds = %13
  %18 = load i16, i16* %4, align 2
  %19 = add i16 %18, -1
  store i16 %19, i16* %4, align 2
  %20 = icmp ne i16 %19, 0
  br i1 %20, label %6, label %21

; <label>:21:                                     ; preds = %17
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_mp_inc, i64 0, i64 2)
  %22 = add i64 %pgocount2, 1
  store i64 %22, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_mp_inc, i64 0, i64 2)
  store i8 1, i8* %2, align 1
  br label %23

; <label>:23:                                     ; preds = %21, %11
  %24 = load i8, i8* %2, align 1
  ret i8 %24
}

; Function Attrs: noinline nounwind uwtable
define zeroext i8 @mp_dec(i16*) #0 {
  %2 = alloca i8, align 1
  %3 = alloca i16*, align 8
  %4 = alloca i16, align 2
  store i16* %0, i16** %3, align 8
  %5 = load i16, i16* @global_precision, align 2
  store i16 %5, i16* %4, align 2
  br label %6

; <label>:6:                                      ; preds = %18, %1
  %7 = load i16*, i16** %3, align 8
  %8 = load i16, i16* %7, align 2
  %9 = add i16 %8, -1
  store i16 %9, i16* %7, align 2
  %10 = sext i16 %9 to i32
  %11 = icmp ne i32 %10, -1
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %6
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_mp_dec, i64 0, i64 1)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_mp_dec, i64 0, i64 1)
  store i8 0, i8* %2, align 1
  br label %24

; <label>:14:                                     ; preds = %6
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_mp_dec, i64 0, i64 0)
  %15 = add i64 %pgocount1, 1
  store i64 %15, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_mp_dec, i64 0, i64 0)
  %16 = load i16*, i16** %3, align 8
  %17 = getelementptr inbounds i16, i16* %16, i32 1
  store i16* %17, i16** %3, align 8
  br label %18

; <label>:18:                                     ; preds = %14
  %19 = load i16, i16* %4, align 2
  %20 = add i16 %19, -1
  store i16 %20, i16* %4, align 2
  %21 = icmp ne i16 %20, 0
  br i1 %21, label %6, label %22

; <label>:22:                                     ; preds = %18
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_mp_dec, i64 0, i64 2)
  %23 = add i64 %pgocount2, 1
  store i64 %23, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_mp_dec, i64 0, i64 2)
  store i8 1, i8* %2, align 1
  br label %24

; <label>:24:                                     ; preds = %22, %12
  %25 = load i8, i8* %2, align 1
  ret i8 %25
}

; Function Attrs: noinline nounwind uwtable
define void @mp_neg(i16*) #0 {
  %2 = alloca i16*, align 8
  %3 = alloca i16, align 2
  store i16* %0, i16** %2, align 8
  %4 = load i16, i16* @global_precision, align 2
  store i16 %4, i16* %3, align 2
  %5 = load i16*, i16** %2, align 8
  %6 = call zeroext i8 @mp_dec(i16* %5)
  br label %7

; <label>:7:                                      ; preds = %17, %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mp_neg, i64 0, i64 0)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mp_neg, i64 0, i64 0)
  %9 = load i16*, i16** %2, align 8
  %10 = load i16, i16* %9, align 2
  %11 = zext i16 %10 to i32
  %12 = xor i32 %11, -1
  %13 = trunc i32 %12 to i16
  %14 = load i16*, i16** %2, align 8
  store i16 %13, i16* %14, align 2
  %15 = load i16*, i16** %2, align 8
  %16 = getelementptr inbounds i16, i16* %15, i32 1
  store i16* %16, i16** %2, align 8
  br label %17

; <label>:17:                                     ; preds = %7
  %18 = load i16, i16* %3, align 2
  %19 = add i16 %18, -1
  store i16 %19, i16* %3, align 2
  %20 = icmp ne i16 %19, 0
  br i1 %20, label %7, label %21

; <label>:21:                                     ; preds = %17
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mp_neg, i64 0, i64 1)
  %22 = add i64 %pgocount1, 1
  store i64 %22, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mp_neg, i64 0, i64 1)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @mp_init(i16*, i16 zeroext) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_mp_init, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_mp_init, i64 0, i64 0)
  %4 = alloca i16*, align 8
  %5 = alloca i16, align 2
  store i16* %0, i16** %4, align 8
  store i16 %1, i16* %5, align 2
  %6 = load i16*, i16** %4, align 8
  %7 = bitcast i16* %6 to i8*
  %8 = load i16, i16* @global_precision, align 2
  %9 = sext i16 %8 to i32
  %10 = shl i32 %9, 1
  %11 = sext i32 %10 to i64
  call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 %11, i32 1, i1 false)
  %12 = load i16, i16* %5, align 2
  %13 = load i16*, i16** %4, align 8
  %14 = getelementptr inbounds i16, i16* %13, i32 1
  store i16* %14, i16** %4, align 8
  store i16 %12, i16* %13, align 2
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #1

; Function Attrs: noinline nounwind uwtable
define signext i16 @significance(i16*) #0 {
  %2 = alloca i16, align 2
  %3 = alloca i16*, align 8
  %4 = alloca i16, align 2
  store i16* %0, i16** %3, align 8
  %5 = load i16, i16* @global_precision, align 2
  store i16 %5, i16* %4, align 2
  %6 = load i16*, i16** %3, align 8
  %7 = load i16, i16* %4, align 2
  %8 = sext i16 %7 to i32
  %9 = sext i32 %8 to i64
  %10 = getelementptr inbounds i16, i16* %6, i64 %9
  %11 = getelementptr inbounds i16, i16* %10, i64 -1
  store i16* %11, i16** %3, align 8
  br label %12

; <label>:12:                                     ; preds = %22, %1
  %13 = load i16*, i16** %3, align 8
  %14 = getelementptr inbounds i16, i16* %13, i32 -1
  store i16* %14, i16** %3, align 8
  %15 = load i16, i16* %13, align 2
  %16 = icmp ne i16 %15, 0
  br i1 %16, label %17, label %20

; <label>:17:                                     ; preds = %12
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_significance, i64 0, i64 1)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_significance, i64 0, i64 1)
  %19 = load i16, i16* %4, align 2
  store i16 %19, i16* %2, align 2
  br label %29

; <label>:20:                                     ; preds = %12
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_significance, i64 0, i64 0)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_significance, i64 0, i64 0)
  br label %22

; <label>:22:                                     ; preds = %20
  %23 = load i16, i16* %4, align 2
  %24 = add i16 %23, -1
  store i16 %24, i16* %4, align 2
  %25 = icmp ne i16 %24, 0
  br i1 %25, label %12, label %26

; <label>:26:                                     ; preds = %22
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_significance, i64 0, i64 2)
  %27 = add i64 %pgocount2, 1
  store i64 %27, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_significance, i64 0, i64 2)
  %28 = load i16, i16* %4, align 2
  store i16 %28, i16* %2, align 2
  br label %29

; <label>:29:                                     ; preds = %26, %17
  %30 = load i16, i16* %2, align 2
  ret i16 %30
}

; Function Attrs: noinline nounwind uwtable
define i32 @mp_udiv(i16*, i16*, i16*, i16*) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i16*, align 8
  %7 = alloca i16*, align 8
  %8 = alloca i16*, align 8
  %9 = alloca i16*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i16, align 2
  %12 = alloca i16, align 2
  store i16* %0, i16** %6, align 8
  store i16* %1, i16** %7, align 8
  store i16* %2, i16** %8, align 8
  store i16* %3, i16** %9, align 8
  %13 = load i16*, i16** %9, align 8
  %14 = load i16, i16* %13, align 2
  %15 = zext i16 %14 to i32
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %25

; <label>:17:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_udiv, i64 0, i64 5)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_udiv, i64 0, i64 5)
  %19 = load i16*, i16** %9, align 8
  %20 = call signext i16 @significance(i16* %19)
  %21 = sext i16 %20 to i32
  %22 = icmp sle i32 %21, 1
  br i1 %22, label %23, label %25

; <label>:23:                                     ; preds = %17
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_udiv, i64 0, i64 7)
  %24 = add i64 %pgocount1, 1
  store i64 %24, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_udiv, i64 0, i64 7)
  store i32 -1, i32* %5, align 4
  br label %117

; <label>:25:                                     ; preds = %17, %4
  %26 = load i16*, i16** %6, align 8
  call void @mp_init(i16* %26, i16 zeroext 0)
  %27 = load i16*, i16** %7, align 8
  call void @mp_init(i16* %27, i16 zeroext 0)
  %28 = load i16*, i16** %8, align 8
  %29 = call signext i16 @significance(i16* %28)
  store i16 %29, i16* %11, align 2
  %30 = load i16, i16* %11, align 2
  %31 = icmp ne i16 %30, 0
  br i1 %31, label %34, label %32

; <label>:32:                                     ; preds = %25
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_udiv, i64 0, i64 6)
  %33 = add i64 %pgocount2, 1
  store i64 %33, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_udiv, i64 0, i64 6)
  store i32 0, i32* %5, align 4
  br label %117

; <label>:34:                                     ; preds = %25
  %35 = load i16, i16* %11, align 2
  %36 = sext i16 %35 to i32
  %37 = shl i32 %36, 4
  store i32 %37, i32* %10, align 4
  %38 = load i16*, i16** %8, align 8
  %39 = load i16, i16* %11, align 2
  %40 = sext i16 %39 to i32
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds i16, i16* %38, i64 %41
  %43 = getelementptr inbounds i16, i16* %42, i64 -1
  store i16* %43, i16** %8, align 8
  store i16 -32768, i16* %12, align 2
  br label %44

; <label>:44:                                     ; preds = %53, %34
  %45 = load i16*, i16** %8, align 8
  %46 = load i16, i16* %45, align 2
  %47 = zext i16 %46 to i32
  %48 = load i16, i16* %12, align 2
  %49 = zext i16 %48 to i32
  %50 = and i32 %47, %49
  %51 = icmp ne i32 %50, 0
  %52 = xor i1 %51, true
  br i1 %52, label %53, label %61

; <label>:53:                                     ; preds = %44
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_udiv, i64 0, i64 0)
  %54 = add i64 %pgocount3, 1
  store i64 %54, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_udiv, i64 0, i64 0)
  %55 = load i16, i16* %12, align 2
  %56 = zext i16 %55 to i32
  %57 = ashr i32 %56, 1
  %58 = trunc i32 %57 to i16
  store i16 %58, i16* %12, align 2
  %59 = load i32, i32* %10, align 4
  %60 = add nsw i32 %59, -1
  store i32 %60, i32* %10, align 4
  br label %44

; <label>:61:                                     ; preds = %44
  %62 = load i16*, i16** %7, align 8
  %63 = load i16, i16* %11, align 2
  %64 = sext i16 %63 to i32
  %65 = sext i32 %64 to i64
  %66 = getelementptr inbounds i16, i16* %62, i64 %65
  %67 = getelementptr inbounds i16, i16* %66, i64 -1
  store i16* %67, i16** %7, align 8
  br label %68

; <label>:68:                                     ; preds = %113, %61
  %69 = load i32, i32* %10, align 4
  %70 = add nsw i32 %69, -1
  store i32 %70, i32* %10, align 4
  %71 = icmp ne i32 %69, 0
  br i1 %71, label %72, label %115

; <label>:72:                                     ; preds = %68
  %73 = load i16*, i16** %6, align 8
  %74 = load i16*, i16** %8, align 8
  %75 = load i16, i16* %74, align 2
  %76 = zext i16 %75 to i32
  %77 = load i16, i16* %12, align 2
  %78 = zext i16 %77 to i32
  %79 = and i32 %76, %78
  %80 = icmp ne i32 %79, 0
  %81 = zext i1 %80 to i32
  %82 = trunc i32 %81 to i8
  %83 = call zeroext i8 @mp_rotate_left(i16* %73, i8 zeroext %82)
  %84 = load i16*, i16** %6, align 8
  %85 = load i16*, i16** %9, align 8
  %86 = call signext i16 @mp_compare(i16* %84, i16* %85)
  %87 = sext i16 %86 to i32
  %88 = icmp sge i32 %87, 0
  br i1 %88, label %89, label %101

; <label>:89:                                     ; preds = %72
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_udiv, i64 0, i64 2)
  %90 = add i64 %pgocount4, 1
  store i64 %90, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_udiv, i64 0, i64 2)
  %91 = load i16*, i16** %6, align 8
  %92 = load i16*, i16** %9, align 8
  %93 = call zeroext i8 @mp_subb(i16* %91, i16* %92, i8 zeroext 0)
  %94 = load i16, i16* %12, align 2
  %95 = zext i16 %94 to i32
  %96 = load i16*, i16** %7, align 8
  %97 = load i16, i16* %96, align 2
  %98 = zext i16 %97 to i32
  %99 = or i32 %98, %95
  %100 = trunc i32 %99 to i16
  store i16 %100, i16* %96, align 2
  br label %101

; <label>:101:                                    ; preds = %89, %72
  %102 = load i16, i16* %12, align 2
  %103 = zext i16 %102 to i32
  %104 = ashr i32 %103, 1
  %105 = trunc i32 %104 to i16
  store i16 %105, i16* %12, align 2
  %106 = icmp ne i16 %105, 0
  br i1 %106, label %113, label %107

; <label>:107:                                    ; preds = %101
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_udiv, i64 0, i64 3)
  %108 = add i64 %pgocount5, 1
  store i64 %108, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_udiv, i64 0, i64 3)
  store i16 -32768, i16* %12, align 2
  %109 = load i16*, i16** %8, align 8
  %110 = getelementptr inbounds i16, i16* %109, i32 -1
  store i16* %110, i16** %8, align 8
  %111 = load i16*, i16** %7, align 8
  %112 = getelementptr inbounds i16, i16* %111, i32 -1
  store i16* %112, i16** %7, align 8
  br label %113

; <label>:113:                                    ; preds = %107, %101
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_udiv, i64 0, i64 1)
  %114 = add i64 %pgocount6, 1
  store i64 %114, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_udiv, i64 0, i64 1)
  br label %68

; <label>:115:                                    ; preds = %68
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_udiv, i64 0, i64 4)
  %116 = add i64 %pgocount7, 1
  store i64 %116, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_udiv, i64 0, i64 4)
  store i32 0, i32* %5, align 4
  br label %117

; <label>:117:                                    ; preds = %115, %32, %23
  %118 = load i32, i32* %5, align 4
  ret i32 %118
}

; Function Attrs: noinline nounwind uwtable
define i32 @mp_recip(i16*, i16*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i16*, align 8
  %5 = alloca i16*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i16, align 2
  %8 = alloca i16, align 2
  %9 = alloca [130 x i16], align 16
  store i16* %0, i16** %4, align 8
  store i16* %1, i16** %5, align 8
  %10 = load i16*, i16** %5, align 8
  %11 = load i16, i16* %10, align 2
  %12 = zext i16 %11 to i32
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %22

; <label>:14:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_mp_recip, i64 0, i64 4)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_mp_recip, i64 0, i64 4)
  %16 = load i16*, i16** %5, align 8
  %17 = call signext i16 @significance(i16* %16)
  %18 = sext i16 %17 to i32
  %19 = icmp sle i32 %18, 1
  br i1 %19, label %20, label %22

; <label>:20:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_mp_recip, i64 0, i64 5)
  %21 = add i64 %pgocount1, 1
  store i64 %21, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_mp_recip, i64 0, i64 5)
  store i32 -1, i32* %3, align 4
  br label %100

; <label>:22:                                     ; preds = %14, %2
  %23 = getelementptr inbounds [130 x i16], [130 x i16]* %9, i32 0, i32 0
  call void @mp_init(i16* %23, i16 zeroext 0)
  %24 = load i16*, i16** %4, align 8
  call void @mp_init(i16* %24, i16 zeroext 0)
  %25 = load i16*, i16** %5, align 8
  %26 = call i32 @countbits(i16* %25)
  %27 = add nsw i32 %26, 0
  store i32 %27, i32* %6, align 4
  %28 = load i32, i32* %6, align 4
  %29 = and i32 %28, 15
  %30 = shl i32 1, %29
  %31 = trunc i32 %30 to i16
  store i16 %31, i16* %8, align 2
  %32 = load i32, i32* %6, align 4
  %33 = add nsw i32 %32, 1
  %34 = add nsw i32 %33, 15
  %35 = ashr i32 %34, 4
  %36 = trunc i32 %35 to i16
  store i16 %36, i16* %7, align 2
  %37 = load i32, i32* %6, align 4
  %38 = sub nsw i32 %37, 0
  %39 = sub nsw i32 %38, 1
  %40 = and i32 %39, 15
  %41 = shl i32 1, %40
  %42 = load i32, i32* %6, align 4
  %43 = sub nsw i32 %42, 0
  %44 = sub nsw i32 %43, 1
  %45 = add nsw i32 %44, 1
  %46 = add nsw i32 %45, 15
  %47 = ashr i32 %46, 4
  %48 = sub nsw i32 %47, 1
  %49 = sext i32 %48 to i64
  %50 = getelementptr inbounds [130 x i16], [130 x i16]* %9, i64 0, i64 %49
  %51 = load i16, i16* %50, align 2
  %52 = zext i16 %51 to i32
  %53 = or i32 %52, %41
  %54 = trunc i32 %53 to i16
  store i16 %54, i16* %50, align 2
  %55 = load i16*, i16** %4, align 8
  %56 = load i16, i16* %7, align 2
  %57 = sext i16 %56 to i32
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds i16, i16* %55, i64 %58
  %60 = getelementptr inbounds i16, i16* %59, i64 -1
  store i16* %60, i16** %4, align 8
  br label %61

; <label>:61:                                     ; preds = %95, %22
  %62 = load i32, i32* %6, align 4
  %63 = add nsw i32 %62, -1
  store i32 %63, i32* %6, align 4
  %64 = icmp ne i32 %62, 0
  br i1 %64, label %65, label %97

; <label>:65:                                     ; preds = %61
  %66 = getelementptr inbounds [130 x i16], [130 x i16]* %9, i32 0, i32 0
  %67 = call zeroext i8 @mp_rotate_left(i16* %66, i8 zeroext 0)
  %68 = getelementptr inbounds [130 x i16], [130 x i16]* %9, i32 0, i32 0
  %69 = load i16*, i16** %5, align 8
  %70 = call signext i16 @mp_compare(i16* %68, i16* %69)
  %71 = sext i16 %70 to i32
  %72 = icmp sge i32 %71, 0
  br i1 %72, label %73, label %85

; <label>:73:                                     ; preds = %65
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_mp_recip, i64 0, i64 1)
  %74 = add i64 %pgocount2, 1
  store i64 %74, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_mp_recip, i64 0, i64 1)
  %75 = getelementptr inbounds [130 x i16], [130 x i16]* %9, i32 0, i32 0
  %76 = load i16*, i16** %5, align 8
  %77 = call zeroext i8 @mp_subb(i16* %75, i16* %76, i8 zeroext 0)
  %78 = load i16, i16* %8, align 2
  %79 = zext i16 %78 to i32
  %80 = load i16*, i16** %4, align 8
  %81 = load i16, i16* %80, align 2
  %82 = zext i16 %81 to i32
  %83 = or i32 %82, %79
  %84 = trunc i32 %83 to i16
  store i16 %84, i16* %80, align 2
  br label %85

; <label>:85:                                     ; preds = %73, %65
  %86 = load i16, i16* %8, align 2
  %87 = zext i16 %86 to i32
  %88 = ashr i32 %87, 1
  %89 = trunc i32 %88 to i16
  store i16 %89, i16* %8, align 2
  %90 = icmp ne i16 %89, 0
  br i1 %90, label %95, label %91

; <label>:91:                                     ; preds = %85
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_mp_recip, i64 0, i64 2)
  %92 = add i64 %pgocount3, 1
  store i64 %92, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_mp_recip, i64 0, i64 2)
  store i16 -32768, i16* %8, align 2
  %93 = load i16*, i16** %4, align 8
  %94 = getelementptr inbounds i16, i16* %93, i32 -1
  store i16* %94, i16** %4, align 8
  br label %95

; <label>:95:                                     ; preds = %91, %85
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_mp_recip, i64 0, i64 0)
  %96 = add i64 %pgocount4, 1
  store i64 %96, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_mp_recip, i64 0, i64 0)
  br label %61

; <label>:97:                                     ; preds = %61
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_mp_recip, i64 0, i64 3)
  %98 = add i64 %pgocount5, 1
  store i64 %98, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_mp_recip, i64 0, i64 3)
  %99 = getelementptr inbounds [130 x i16], [130 x i16]* %9, i32 0, i32 0
  call void @mp_init(i16* %99, i16 zeroext 0)
  store i32 0, i32* %3, align 4
  br label %100

; <label>:100:                                    ; preds = %97, %20
  %101 = load i32, i32* %3, align 4
  ret i32 %101
}

; Function Attrs: noinline nounwind uwtable
define i32 @countbits(i16*) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i16*, align 8
  %4 = alloca i32, align 4
  %5 = alloca i16, align 2
  %6 = alloca i16, align 2
  store i16* %0, i16** %3, align 8
  %7 = load i16*, i16** %3, align 8
  %8 = call signext i16 @significance(i16* %7)
  store i16 %8, i16* %5, align 2
  %9 = load i16, i16* %5, align 2
  %10 = icmp ne i16 %9, 0
  br i1 %10, label %13, label %11

; <label>:11:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_countbits, i64 0, i64 2)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_countbits, i64 0, i64 2)
  store i32 0, i32* %2, align 4
  br label %43

; <label>:13:                                     ; preds = %1
  %14 = load i16, i16* %5, align 2
  %15 = sext i16 %14 to i32
  %16 = shl i32 %15, 4
  store i32 %16, i32* %4, align 4
  %17 = load i16*, i16** %3, align 8
  %18 = load i16, i16* %5, align 2
  %19 = sext i16 %18 to i32
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds i16, i16* %17, i64 %20
  %22 = getelementptr inbounds i16, i16* %21, i64 -1
  store i16* %22, i16** %3, align 8
  store i16 -32768, i16* %6, align 2
  br label %23

; <label>:23:                                     ; preds = %32, %13
  %24 = load i16*, i16** %3, align 8
  %25 = load i16, i16* %24, align 2
  %26 = zext i16 %25 to i32
  %27 = load i16, i16* %6, align 2
  %28 = zext i16 %27 to i32
  %29 = and i32 %26, %28
  %30 = icmp ne i32 %29, 0
  %31 = xor i1 %30, true
  br i1 %31, label %32, label %40

; <label>:32:                                     ; preds = %23
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_countbits, i64 0, i64 0)
  %33 = add i64 %pgocount1, 1
  store i64 %33, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_countbits, i64 0, i64 0)
  %34 = load i16, i16* %6, align 2
  %35 = zext i16 %34 to i32
  %36 = ashr i32 %35, 1
  %37 = trunc i32 %36 to i16
  store i16 %37, i16* %6, align 2
  %38 = load i32, i32* %4, align 4
  %39 = add nsw i32 %38, -1
  store i32 %39, i32* %4, align 4
  br label %23

; <label>:40:                                     ; preds = %23
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_countbits, i64 0, i64 1)
  %41 = add i64 %pgocount2, 1
  store i64 %41, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_countbits, i64 0, i64 1)
  %42 = load i32, i32* %4, align 4
  store i32 %42, i32* %2, align 4
  br label %43

; <label>:43:                                     ; preds = %40, %11
  %44 = load i32, i32* %2, align 4
  ret i32 %44
}

; Function Attrs: noinline nounwind uwtable
define i32 @mp_div(i16*, i16*, i16*, i16*) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i16*, align 8
  %7 = alloca i16*, align 8
  %8 = alloca i16*, align 8
  %9 = alloca i16*, align 8
  %10 = alloca i8, align 1
  %11 = alloca i8, align 1
  %12 = alloca i32, align 4
  store i16* %0, i16** %6, align 8
  store i16* %1, i16** %7, align 8
  store i16* %2, i16** %8, align 8
  store i16* %3, i16** %9, align 8
  %13 = load i16*, i16** %8, align 8
  %14 = load i16, i16* @global_precision, align 2
  %15 = sext i16 %14 to i32
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i16, i16* %13, i64 %16
  %18 = getelementptr inbounds i16, i16* %17, i64 -1
  %19 = load i16, i16* %18, align 2
  %20 = sext i16 %19 to i32
  %21 = icmp slt i32 %20, 0
  %22 = zext i1 %21 to i32
  %23 = icmp ne i32 %22, 0
  %24 = zext i1 %23 to i32
  %25 = trunc i32 %24 to i8
  store i8 %25, i8* %10, align 1
  %26 = load i16*, i16** %9, align 8
  %27 = load i16, i16* @global_precision, align 2
  %28 = sext i16 %27 to i32
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds i16, i16* %26, i64 %29
  %31 = getelementptr inbounds i16, i16* %30, i64 -1
  %32 = load i16, i16* %31, align 2
  %33 = sext i16 %32 to i32
  %34 = icmp slt i32 %33, 0
  %35 = zext i1 %34 to i32
  %36 = icmp ne i32 %35, 0
  %37 = zext i1 %36 to i32
  %38 = trunc i32 %37 to i8
  store i8 %38, i8* %11, align 1
  %39 = load i8, i8* %10, align 1
  %40 = icmp ne i8 %39, 0
  br i1 %40, label %41, label %44

; <label>:41:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_div, i64 0, i64 0)
  %42 = add i64 %pgocount, 1
  store i64 %42, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_div, i64 0, i64 0)
  %43 = load i16*, i16** %8, align 8
  call void @mp_neg(i16* %43)
  br label %44

; <label>:44:                                     ; preds = %41, %4
  %45 = load i8, i8* %11, align 1
  %46 = icmp ne i8 %45, 0
  br i1 %46, label %47, label %50

; <label>:47:                                     ; preds = %44
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_div, i64 0, i64 1)
  %48 = add i64 %pgocount1, 1
  store i64 %48, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_div, i64 0, i64 1)
  %49 = load i16*, i16** %9, align 8
  call void @mp_neg(i16* %49)
  br label %50

; <label>:50:                                     ; preds = %47, %44
  %51 = load i16*, i16** %6, align 8
  %52 = load i16*, i16** %7, align 8
  %53 = load i16*, i16** %8, align 8
  %54 = load i16*, i16** %9, align 8
  %55 = call i32 @mp_udiv(i16* %51, i16* %52, i16* %53, i16* %54)
  store i32 %55, i32* %12, align 4
  %56 = load i8, i8* %10, align 1
  %57 = icmp ne i8 %56, 0
  br i1 %57, label %58, label %61

; <label>:58:                                     ; preds = %50
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_div, i64 0, i64 2)
  %59 = add i64 %pgocount2, 1
  store i64 %59, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_div, i64 0, i64 2)
  %60 = load i16*, i16** %8, align 8
  call void @mp_neg(i16* %60)
  br label %61

; <label>:61:                                     ; preds = %58, %50
  %62 = load i8, i8* %11, align 1
  %63 = icmp ne i8 %62, 0
  br i1 %63, label %64, label %67

; <label>:64:                                     ; preds = %61
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_div, i64 0, i64 3)
  %65 = add i64 %pgocount3, 1
  store i64 %65, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_div, i64 0, i64 3)
  %66 = load i16*, i16** %9, align 8
  call void @mp_neg(i16* %66)
  br label %67

; <label>:67:                                     ; preds = %64, %61
  %68 = load i32, i32* %12, align 4
  %69 = icmp slt i32 %68, 0
  br i1 %69, label %70, label %73

; <label>:70:                                     ; preds = %67
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_div, i64 0, i64 7)
  %71 = add i64 %pgocount4, 1
  store i64 %71, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_div, i64 0, i64 7)
  %72 = load i32, i32* %12, align 4
  store i32 %72, i32* %5, align 4
  br label %92

; <label>:73:                                     ; preds = %67
  %74 = load i8, i8* %10, align 1
  %75 = icmp ne i8 %74, 0
  br i1 %75, label %76, label %79

; <label>:76:                                     ; preds = %73
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_div, i64 0, i64 5)
  %77 = add i64 %pgocount5, 1
  store i64 %77, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_div, i64 0, i64 5)
  %78 = load i16*, i16** %6, align 8
  call void @mp_neg(i16* %78)
  br label %79

; <label>:79:                                     ; preds = %76, %73
  %80 = load i8, i8* %10, align 1
  %81 = zext i8 %80 to i32
  %82 = load i8, i8* %11, align 1
  %83 = zext i8 %82 to i32
  %84 = xor i32 %81, %83
  %85 = icmp ne i32 %84, 0
  br i1 %85, label %86, label %89

; <label>:86:                                     ; preds = %79
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_div, i64 0, i64 6)
  %87 = add i64 %pgocount6, 1
  store i64 %87, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_div, i64 0, i64 6)
  %88 = load i16*, i16** %7, align 8
  call void @mp_neg(i16* %88)
  br label %89

; <label>:89:                                     ; preds = %86, %79
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_div, i64 0, i64 4)
  %90 = add i64 %pgocount7, 1
  store i64 %90, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_div, i64 0, i64 4)
  %91 = load i32, i32* %12, align 4
  store i32 %91, i32* %5, align 4
  br label %92

; <label>:92:                                     ; preds = %89, %70
  %93 = load i32, i32* %5, align 4
  ret i32 %93
}

; Function Attrs: noinline nounwind uwtable
define zeroext i16 @mp_shortdiv(i16*, i16*, i16 zeroext) #0 {
  %4 = alloca i16, align 2
  %5 = alloca i16*, align 8
  %6 = alloca i16*, align 8
  %7 = alloca i16, align 2
  %8 = alloca i32, align 4
  %9 = alloca i16, align 2
  %10 = alloca i16, align 2
  %11 = alloca i16, align 2
  store i16* %0, i16** %5, align 8
  store i16* %1, i16** %6, align 8
  store i16 %2, i16* %7, align 2
  %12 = load i16, i16* %7, align 2
  %13 = icmp ne i16 %12, 0
  br i1 %13, label %16, label %14

; <label>:14:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_shortdiv, i64 0, i64 6)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_shortdiv, i64 0, i64 6)
  store i16 -1, i16* %4, align 2
  br label %116

; <label>:16:                                     ; preds = %3
  store i16 0, i16* %11, align 2
  %17 = load i16*, i16** %5, align 8
  call void @mp_init(i16* %17, i16 zeroext 0)
  %18 = load i16*, i16** %6, align 8
  %19 = call signext i16 @significance(i16* %18)
  store i16 %19, i16* %9, align 2
  %20 = load i16, i16* %9, align 2
  %21 = icmp ne i16 %20, 0
  br i1 %21, label %24, label %22

; <label>:22:                                     ; preds = %16
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_shortdiv, i64 0, i64 7)
  %23 = add i64 %pgocount1, 1
  store i64 %23, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_shortdiv, i64 0, i64 7)
  store i16 0, i16* %4, align 2
  br label %116

; <label>:24:                                     ; preds = %16
  %25 = load i16, i16* %9, align 2
  %26 = sext i16 %25 to i32
  %27 = shl i32 %26, 4
  store i32 %27, i32* %8, align 4
  %28 = load i16*, i16** %6, align 8
  %29 = load i16, i16* %9, align 2
  %30 = sext i16 %29 to i32
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i16, i16* %28, i64 %31
  %33 = getelementptr inbounds i16, i16* %32, i64 -1
  store i16* %33, i16** %6, align 8
  store i16 -32768, i16* %10, align 2
  br label %34

; <label>:34:                                     ; preds = %43, %24
  %35 = load i16*, i16** %6, align 8
  %36 = load i16, i16* %35, align 2
  %37 = zext i16 %36 to i32
  %38 = load i16, i16* %10, align 2
  %39 = zext i16 %38 to i32
  %40 = and i32 %37, %39
  %41 = icmp ne i32 %40, 0
  %42 = xor i1 %41, true
  br i1 %42, label %43, label %51

; <label>:43:                                     ; preds = %34
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_shortdiv, i64 0, i64 0)
  %44 = add i64 %pgocount2, 1
  store i64 %44, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_shortdiv, i64 0, i64 0)
  %45 = load i16, i16* %10, align 2
  %46 = zext i16 %45 to i32
  %47 = ashr i32 %46, 1
  %48 = trunc i32 %47 to i16
  store i16 %48, i16* %10, align 2
  %49 = load i32, i32* %8, align 4
  %50 = add nsw i32 %49, -1
  store i32 %50, i32* %8, align 4
  br label %34

; <label>:51:                                     ; preds = %34
  %52 = load i16*, i16** %5, align 8
  %53 = load i16, i16* %9, align 2
  %54 = sext i16 %53 to i32
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i16, i16* %52, i64 %55
  %57 = getelementptr inbounds i16, i16* %56, i64 -1
  store i16* %57, i16** %5, align 8
  br label %58

; <label>:58:                                     ; preds = %112, %51
  %59 = load i32, i32* %8, align 4
  %60 = add nsw i32 %59, -1
  store i32 %60, i32* %8, align 4
  %61 = icmp ne i32 %59, 0
  br i1 %61, label %62, label %113

; <label>:62:                                     ; preds = %58
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_shortdiv, i64 0, i64 1)
  %63 = add i64 %pgocount3, 1
  store i64 %63, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_shortdiv, i64 0, i64 1)
  %64 = load i16, i16* %11, align 2
  %65 = zext i16 %64 to i32
  %66 = shl i32 %65, 1
  %67 = trunc i32 %66 to i16
  store i16 %67, i16* %11, align 2
  %68 = load i16*, i16** %6, align 8
  %69 = load i16, i16* %68, align 2
  %70 = zext i16 %69 to i32
  %71 = load i16, i16* %10, align 2
  %72 = zext i16 %71 to i32
  %73 = and i32 %70, %72
  %74 = icmp ne i32 %73, 0
  br i1 %74, label %75, label %79

; <label>:75:                                     ; preds = %62
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_shortdiv, i64 0, i64 2)
  %76 = add i64 %pgocount4, 1
  store i64 %76, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_shortdiv, i64 0, i64 2)
  %77 = load i16, i16* %11, align 2
  %78 = add i16 %77, 1
  store i16 %78, i16* %11, align 2
  br label %79

; <label>:79:                                     ; preds = %75, %62
  %80 = load i16, i16* %11, align 2
  %81 = zext i16 %80 to i32
  %82 = load i16, i16* %7, align 2
  %83 = zext i16 %82 to i32
  %84 = icmp sge i32 %81, %83
  br i1 %84, label %85, label %100

; <label>:85:                                     ; preds = %79
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_shortdiv, i64 0, i64 3)
  %86 = add i64 %pgocount5, 1
  store i64 %86, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_shortdiv, i64 0, i64 3)
  %87 = load i16, i16* %7, align 2
  %88 = zext i16 %87 to i32
  %89 = load i16, i16* %11, align 2
  %90 = zext i16 %89 to i32
  %91 = sub nsw i32 %90, %88
  %92 = trunc i32 %91 to i16
  store i16 %92, i16* %11, align 2
  %93 = load i16, i16* %10, align 2
  %94 = zext i16 %93 to i32
  %95 = load i16*, i16** %5, align 8
  %96 = load i16, i16* %95, align 2
  %97 = zext i16 %96 to i32
  %98 = or i32 %97, %94
  %99 = trunc i32 %98 to i16
  store i16 %99, i16* %95, align 2
  br label %100

; <label>:100:                                    ; preds = %85, %79
  %101 = load i16, i16* %10, align 2
  %102 = zext i16 %101 to i32
  %103 = ashr i32 %102, 1
  %104 = trunc i32 %103 to i16
  store i16 %104, i16* %10, align 2
  %105 = icmp ne i16 %104, 0
  br i1 %105, label %112, label %106

; <label>:106:                                    ; preds = %100
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_shortdiv, i64 0, i64 4)
  %107 = add i64 %pgocount6, 1
  store i64 %107, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_shortdiv, i64 0, i64 4)
  store i16 -32768, i16* %10, align 2
  %108 = load i16*, i16** %6, align 8
  %109 = getelementptr inbounds i16, i16* %108, i32 -1
  store i16* %109, i16** %6, align 8
  %110 = load i16*, i16** %5, align 8
  %111 = getelementptr inbounds i16, i16* %110, i32 -1
  store i16* %111, i16** %5, align 8
  br label %112

; <label>:112:                                    ; preds = %106, %100
  br label %58

; <label>:113:                                    ; preds = %58
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_shortdiv, i64 0, i64 5)
  %114 = add i64 %pgocount7, 1
  store i64 %114, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_shortdiv, i64 0, i64 5)
  %115 = load i16, i16* %11, align 2
  store i16 %115, i16* %4, align 2
  br label %116

; <label>:116:                                    ; preds = %113, %22, %14
  %117 = load i16, i16* %4, align 2
  ret i16 %117
}

; Function Attrs: noinline nounwind uwtable
define i32 @mp_mod(i16*, i16*, i16*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i16*, align 8
  %6 = alloca i16*, align 8
  %7 = alloca i16*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i16, align 2
  %10 = alloca i16, align 2
  store i16* %0, i16** %5, align 8
  store i16* %1, i16** %6, align 8
  store i16* %2, i16** %7, align 8
  %11 = load i16*, i16** %7, align 8
  %12 = load i16, i16* %11, align 2
  %13 = zext i16 %12 to i32
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %23

; <label>:15:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_mod, i64 0, i64 5)
  %16 = add i64 %pgocount, 1
  store i64 %16, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_mod, i64 0, i64 5)
  %17 = load i16*, i16** %7, align 8
  %18 = call signext i16 @significance(i16* %17)
  %19 = sext i16 %18 to i32
  %20 = icmp sle i32 %19, 1
  br i1 %20, label %21, label %23

; <label>:21:                                     ; preds = %15
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_mod, i64 0, i64 7)
  %22 = add i64 %pgocount1, 1
  store i64 %22, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_mod, i64 0, i64 7)
  store i32 -1, i32* %4, align 4
  br label %99

; <label>:23:                                     ; preds = %15, %3
  %24 = load i16*, i16** %5, align 8
  call void @mp_init(i16* %24, i16 zeroext 0)
  %25 = load i16*, i16** %6, align 8
  %26 = call signext i16 @significance(i16* %25)
  store i16 %26, i16* %9, align 2
  %27 = load i16, i16* %9, align 2
  %28 = icmp ne i16 %27, 0
  br i1 %28, label %31, label %29

; <label>:29:                                     ; preds = %23
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_mod, i64 0, i64 6)
  %30 = add i64 %pgocount2, 1
  store i64 %30, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_mod, i64 0, i64 6)
  store i32 0, i32* %4, align 4
  br label %99

; <label>:31:                                     ; preds = %23
  %32 = load i16, i16* %9, align 2
  %33 = sext i16 %32 to i32
  %34 = shl i32 %33, 4
  store i32 %34, i32* %8, align 4
  %35 = load i16*, i16** %6, align 8
  %36 = load i16, i16* %9, align 2
  %37 = sext i16 %36 to i32
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i16, i16* %35, i64 %38
  %40 = getelementptr inbounds i16, i16* %39, i64 -1
  store i16* %40, i16** %6, align 8
  store i16 -32768, i16* %10, align 2
  br label %41

; <label>:41:                                     ; preds = %50, %31
  %42 = load i16*, i16** %6, align 8
  %43 = load i16, i16* %42, align 2
  %44 = zext i16 %43 to i32
  %45 = load i16, i16* %10, align 2
  %46 = zext i16 %45 to i32
  %47 = and i32 %44, %46
  %48 = icmp ne i32 %47, 0
  %49 = xor i1 %48, true
  br i1 %49, label %50, label %58

; <label>:50:                                     ; preds = %41
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_mod, i64 0, i64 0)
  %51 = add i64 %pgocount3, 1
  store i64 %51, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_mod, i64 0, i64 0)
  %52 = load i16, i16* %10, align 2
  %53 = zext i16 %52 to i32
  %54 = ashr i32 %53, 1
  %55 = trunc i32 %54 to i16
  store i16 %55, i16* %10, align 2
  %56 = load i32, i32* %8, align 4
  %57 = add nsw i32 %56, -1
  store i32 %57, i32* %8, align 4
  br label %41

; <label>:58:                                     ; preds = %41
  br label %59

; <label>:59:                                     ; preds = %95, %58
  %60 = load i32, i32* %8, align 4
  %61 = add nsw i32 %60, -1
  store i32 %61, i32* %8, align 4
  %62 = icmp ne i32 %60, 0
  br i1 %62, label %63, label %97

; <label>:63:                                     ; preds = %59
  %64 = load i16*, i16** %5, align 8
  %65 = load i16*, i16** %6, align 8
  %66 = load i16, i16* %65, align 2
  %67 = zext i16 %66 to i32
  %68 = load i16, i16* %10, align 2
  %69 = zext i16 %68 to i32
  %70 = and i32 %67, %69
  %71 = icmp ne i32 %70, 0
  %72 = zext i1 %71 to i32
  %73 = trunc i32 %72 to i8
  %74 = call zeroext i8 @mp_rotate_left(i16* %64, i8 zeroext %73)
  %75 = load i16*, i16** %5, align 8
  %76 = load i16*, i16** %7, align 8
  %77 = call signext i16 @mp_compare(i16* %75, i16* %76)
  %78 = sext i16 %77 to i32
  %79 = icmp sge i32 %78, 0
  br i1 %79, label %80, label %85

; <label>:80:                                     ; preds = %63
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_mod, i64 0, i64 2)
  %81 = add i64 %pgocount4, 1
  store i64 %81, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_mod, i64 0, i64 2)
  %82 = load i16*, i16** %5, align 8
  %83 = load i16*, i16** %7, align 8
  %84 = call zeroext i8 @mp_subb(i16* %82, i16* %83, i8 zeroext 0)
  br label %85

; <label>:85:                                     ; preds = %80, %63
  %86 = load i16, i16* %10, align 2
  %87 = zext i16 %86 to i32
  %88 = ashr i32 %87, 1
  %89 = trunc i32 %88 to i16
  store i16 %89, i16* %10, align 2
  %90 = icmp ne i16 %89, 0
  br i1 %90, label %95, label %91

; <label>:91:                                     ; preds = %85
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_mod, i64 0, i64 3)
  %92 = add i64 %pgocount5, 1
  store i64 %92, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_mod, i64 0, i64 3)
  store i16 -32768, i16* %10, align 2
  %93 = load i16*, i16** %6, align 8
  %94 = getelementptr inbounds i16, i16* %93, i32 -1
  store i16* %94, i16** %6, align 8
  br label %95

; <label>:95:                                     ; preds = %91, %85
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_mod, i64 0, i64 1)
  %96 = add i64 %pgocount6, 1
  store i64 %96, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_mod, i64 0, i64 1)
  br label %59

; <label>:97:                                     ; preds = %59
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_mod, i64 0, i64 4)
  %98 = add i64 %pgocount7, 1
  store i64 %98, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_mod, i64 0, i64 4)
  store i32 0, i32* %4, align 4
  br label %99

; <label>:99:                                     ; preds = %97, %29, %21
  %100 = load i32, i32* %4, align 4
  ret i32 %100
}

; Function Attrs: noinline nounwind uwtable
define zeroext i16 @mp_shortmod(i16*, i16 zeroext) #0 {
  %3 = alloca i16, align 2
  %4 = alloca i16*, align 8
  %5 = alloca i16, align 2
  %6 = alloca i32, align 4
  %7 = alloca i16, align 2
  %8 = alloca i16, align 2
  %9 = alloca i16, align 2
  store i16* %0, i16** %4, align 8
  store i16 %1, i16* %5, align 2
  %10 = load i16, i16* %5, align 2
  %11 = icmp ne i16 %10, 0
  br i1 %11, label %14, label %12

; <label>:12:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_shortmod, i64 0, i64 6)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_shortmod, i64 0, i64 6)
  store i16 -1, i16* %3, align 2
  br label %98

; <label>:14:                                     ; preds = %2
  store i16 0, i16* %9, align 2
  %15 = load i16*, i16** %4, align 8
  %16 = call signext i16 @significance(i16* %15)
  store i16 %16, i16* %7, align 2
  %17 = load i16, i16* %7, align 2
  %18 = icmp ne i16 %17, 0
  br i1 %18, label %21, label %19

; <label>:19:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_shortmod, i64 0, i64 7)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_shortmod, i64 0, i64 7)
  store i16 0, i16* %3, align 2
  br label %98

; <label>:21:                                     ; preds = %14
  %22 = load i16, i16* %7, align 2
  %23 = sext i16 %22 to i32
  %24 = shl i32 %23, 4
  store i32 %24, i32* %6, align 4
  %25 = load i16*, i16** %4, align 8
  %26 = load i16, i16* %7, align 2
  %27 = sext i16 %26 to i32
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds i16, i16* %25, i64 %28
  %30 = getelementptr inbounds i16, i16* %29, i64 -1
  store i16* %30, i16** %4, align 8
  store i16 -32768, i16* %8, align 2
  br label %31

; <label>:31:                                     ; preds = %40, %21
  %32 = load i16*, i16** %4, align 8
  %33 = load i16, i16* %32, align 2
  %34 = zext i16 %33 to i32
  %35 = load i16, i16* %8, align 2
  %36 = zext i16 %35 to i32
  %37 = and i32 %34, %36
  %38 = icmp ne i32 %37, 0
  %39 = xor i1 %38, true
  br i1 %39, label %40, label %48

; <label>:40:                                     ; preds = %31
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_shortmod, i64 0, i64 0)
  %41 = add i64 %pgocount2, 1
  store i64 %41, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_shortmod, i64 0, i64 0)
  %42 = load i16, i16* %8, align 2
  %43 = zext i16 %42 to i32
  %44 = ashr i32 %43, 1
  %45 = trunc i32 %44 to i16
  store i16 %45, i16* %8, align 2
  %46 = load i32, i32* %6, align 4
  %47 = add nsw i32 %46, -1
  store i32 %47, i32* %6, align 4
  br label %31

; <label>:48:                                     ; preds = %31
  br label %49

; <label>:49:                                     ; preds = %94, %48
  %50 = load i32, i32* %6, align 4
  %51 = add nsw i32 %50, -1
  store i32 %51, i32* %6, align 4
  %52 = icmp ne i32 %50, 0
  br i1 %52, label %53, label %95

; <label>:53:                                     ; preds = %49
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_shortmod, i64 0, i64 1)
  %54 = add i64 %pgocount3, 1
  store i64 %54, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_shortmod, i64 0, i64 1)
  %55 = load i16, i16* %9, align 2
  %56 = zext i16 %55 to i32
  %57 = shl i32 %56, 1
  %58 = trunc i32 %57 to i16
  store i16 %58, i16* %9, align 2
  %59 = load i16*, i16** %4, align 8
  %60 = load i16, i16* %59, align 2
  %61 = zext i16 %60 to i32
  %62 = load i16, i16* %8, align 2
  %63 = zext i16 %62 to i32
  %64 = and i32 %61, %63
  %65 = icmp ne i32 %64, 0
  br i1 %65, label %66, label %70

; <label>:66:                                     ; preds = %53
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_shortmod, i64 0, i64 2)
  %67 = add i64 %pgocount4, 1
  store i64 %67, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_shortmod, i64 0, i64 2)
  %68 = load i16, i16* %9, align 2
  %69 = add i16 %68, 1
  store i16 %69, i16* %9, align 2
  br label %70

; <label>:70:                                     ; preds = %66, %53
  %71 = load i16, i16* %9, align 2
  %72 = zext i16 %71 to i32
  %73 = load i16, i16* %5, align 2
  %74 = zext i16 %73 to i32
  %75 = icmp sge i32 %72, %74
  br i1 %75, label %76, label %84

; <label>:76:                                     ; preds = %70
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_shortmod, i64 0, i64 3)
  %77 = add i64 %pgocount5, 1
  store i64 %77, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_shortmod, i64 0, i64 3)
  %78 = load i16, i16* %5, align 2
  %79 = zext i16 %78 to i32
  %80 = load i16, i16* %9, align 2
  %81 = zext i16 %80 to i32
  %82 = sub nsw i32 %81, %79
  %83 = trunc i32 %82 to i16
  store i16 %83, i16* %9, align 2
  br label %84

; <label>:84:                                     ; preds = %76, %70
  %85 = load i16, i16* %8, align 2
  %86 = zext i16 %85 to i32
  %87 = ashr i32 %86, 1
  %88 = trunc i32 %87 to i16
  store i16 %88, i16* %8, align 2
  %89 = icmp ne i16 %88, 0
  br i1 %89, label %94, label %90

; <label>:90:                                     ; preds = %84
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_shortmod, i64 0, i64 4)
  %91 = add i64 %pgocount6, 1
  store i64 %91, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_shortmod, i64 0, i64 4)
  store i16 -32768, i16* %8, align 2
  %92 = load i16*, i16** %4, align 8
  %93 = getelementptr inbounds i16, i16* %92, i32 -1
  store i16* %93, i16** %4, align 8
  br label %94

; <label>:94:                                     ; preds = %90, %84
  br label %49

; <label>:95:                                     ; preds = %49
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_shortmod, i64 0, i64 5)
  %96 = add i64 %pgocount7, 1
  store i64 %96, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_shortmod, i64 0, i64 5)
  %97 = load i16, i16* %9, align 2
  store i16 %97, i16* %3, align 2
  br label %98

; <label>:98:                                     ; preds = %95, %19, %12
  %99 = load i16, i16* %3, align 2
  ret i16 %99
}

; Function Attrs: noinline nounwind uwtable
define i32 @mp_mult(i16*, i16*, i16*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i16*, align 8
  %6 = alloca i16*, align 8
  %7 = alloca i16*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i16, align 2
  %10 = alloca i16, align 2
  store i16* %0, i16** %5, align 8
  store i16* %1, i16** %6, align 8
  store i16* %2, i16** %7, align 8
  %11 = load i16*, i16** %5, align 8
  call void @mp_init(i16* %11, i16 zeroext 0)
  %12 = load i16*, i16** %6, align 8
  %13 = load i16, i16* %12, align 2
  %14 = zext i16 %13 to i32
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %24

; <label>:16:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_mult, i64 0, i64 5)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_mult, i64 0, i64 5)
  %18 = load i16*, i16** %6, align 8
  %19 = call signext i16 @significance(i16* %18)
  %20 = sext i16 %19 to i32
  %21 = icmp sle i32 %20, 1
  br i1 %21, label %22, label %24

; <label>:22:                                     ; preds = %16
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_mult, i64 0, i64 7)
  %23 = add i64 %pgocount1, 1
  store i64 %23, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_mult, i64 0, i64 7)
  store i32 0, i32* %4, align 4
  br label %92

; <label>:24:                                     ; preds = %16, %3
  %25 = load i16*, i16** %7, align 8
  %26 = call signext i16 @significance(i16* %25)
  store i16 %26, i16* %10, align 2
  %27 = load i16, i16* %10, align 2
  %28 = icmp ne i16 %27, 0
  br i1 %28, label %31, label %29

; <label>:29:                                     ; preds = %24
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_mult, i64 0, i64 6)
  %30 = add i64 %pgocount2, 1
  store i64 %30, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_mult, i64 0, i64 6)
  store i32 0, i32* %4, align 4
  br label %92

; <label>:31:                                     ; preds = %24
  %32 = load i16, i16* %10, align 2
  %33 = sext i16 %32 to i32
  %34 = shl i32 %33, 4
  store i32 %34, i32* %8, align 4
  %35 = load i16*, i16** %7, align 8
  %36 = load i16, i16* %10, align 2
  %37 = sext i16 %36 to i32
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds i16, i16* %35, i64 %38
  %40 = getelementptr inbounds i16, i16* %39, i64 -1
  store i16* %40, i16** %7, align 8
  store i16 -32768, i16* %9, align 2
  br label %41

; <label>:41:                                     ; preds = %50, %31
  %42 = load i16*, i16** %7, align 8
  %43 = load i16, i16* %42, align 2
  %44 = zext i16 %43 to i32
  %45 = load i16, i16* %9, align 2
  %46 = zext i16 %45 to i32
  %47 = and i32 %44, %46
  %48 = icmp ne i32 %47, 0
  %49 = xor i1 %48, true
  br i1 %49, label %50, label %58

; <label>:50:                                     ; preds = %41
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_mult, i64 0, i64 0)
  %51 = add i64 %pgocount3, 1
  store i64 %51, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_mult, i64 0, i64 0)
  %52 = load i16, i16* %9, align 2
  %53 = zext i16 %52 to i32
  %54 = ashr i32 %53, 1
  %55 = trunc i32 %54 to i16
  store i16 %55, i16* %9, align 2
  %56 = load i32, i32* %8, align 4
  %57 = add nsw i32 %56, -1
  store i32 %57, i32* %8, align 4
  br label %41

; <label>:58:                                     ; preds = %41
  br label %59

; <label>:59:                                     ; preds = %88, %58
  %60 = load i32, i32* %8, align 4
  %61 = add nsw i32 %60, -1
  store i32 %61, i32* %8, align 4
  %62 = icmp ne i32 %60, 0
  br i1 %62, label %63, label %90

; <label>:63:                                     ; preds = %59
  %64 = load i16*, i16** %5, align 8
  %65 = call zeroext i8 @mp_rotate_left(i16* %64, i8 zeroext 0)
  %66 = load i16*, i16** %7, align 8
  %67 = load i16, i16* %66, align 2
  %68 = zext i16 %67 to i32
  %69 = load i16, i16* %9, align 2
  %70 = zext i16 %69 to i32
  %71 = and i32 %68, %70
  %72 = icmp ne i32 %71, 0
  br i1 %72, label %73, label %78

; <label>:73:                                     ; preds = %63
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_mult, i64 0, i64 2)
  %74 = add i64 %pgocount4, 1
  store i64 %74, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_mult, i64 0, i64 2)
  %75 = load i16*, i16** %5, align 8
  %76 = load i16*, i16** %6, align 8
  %77 = call zeroext i8 @mp_addc(i16* %75, i16* %76, i8 zeroext 0)
  br label %78

; <label>:78:                                     ; preds = %73, %63
  %79 = load i16, i16* %9, align 2
  %80 = zext i16 %79 to i32
  %81 = ashr i32 %80, 1
  %82 = trunc i32 %81 to i16
  store i16 %82, i16* %9, align 2
  %83 = icmp ne i16 %82, 0
  br i1 %83, label %88, label %84

; <label>:84:                                     ; preds = %78
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_mult, i64 0, i64 3)
  %85 = add i64 %pgocount5, 1
  store i64 %85, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_mult, i64 0, i64 3)
  store i16 -32768, i16* %9, align 2
  %86 = load i16*, i16** %7, align 8
  %87 = getelementptr inbounds i16, i16* %86, i32 -1
  store i16* %87, i16** %7, align 8
  br label %88

; <label>:88:                                     ; preds = %84, %78
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_mult, i64 0, i64 1)
  %89 = add i64 %pgocount6, 1
  store i64 %89, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_mult, i64 0, i64 1)
  br label %59

; <label>:90:                                     ; preds = %59
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_mult, i64 0, i64 4)
  %91 = add i64 %pgocount7, 1
  store i64 %91, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_mp_mult, i64 0, i64 4)
  store i32 0, i32* %4, align 4
  br label %92

; <label>:92:                                     ; preds = %90, %29, %22
  %93 = load i32, i32* %4, align 4
  ret i32 %93
}

; Function Attrs: noinline nounwind uwtable
define void @mp_smul(i16*, i16*, i16 zeroext) #0 {
  %4 = alloca i16*, align 8
  %5 = alloca i16*, align 8
  %6 = alloca i16, align 2
  %7 = alloca i16, align 2
  %8 = alloca i64, align 8
  %9 = alloca i64, align 8
  store i16* %0, i16** %4, align 8
  store i16* %1, i16** %5, align 8
  store i16 %2, i16* %6, align 2
  store i64 0, i64* %9, align 8
  store i16 0, i16* %7, align 2
  br label %10

; <label>:10:                                     ; preds = %37, %3
  %11 = load i16, i16* %7, align 2
  %12 = sext i16 %11 to i32
  %13 = load i16, i16* @munit_prec, align 2
  %14 = sext i16 %13 to i32
  %15 = icmp slt i32 %12, %14
  br i1 %15, label %16, label %41

; <label>:16:                                     ; preds = %10
  %17 = load i16, i16* %6, align 2
  %18 = zext i16 %17 to i64
  %19 = load i16*, i16** %5, align 8
  %20 = getelementptr inbounds i16, i16* %19, i32 1
  store i16* %20, i16** %5, align 8
  %21 = load i16, i16* %19, align 2
  %22 = zext i16 %21 to i64
  %23 = mul i64 %18, %22
  store i64 %23, i64* %8, align 8
  %24 = load i16*, i16** %4, align 8
  %25 = load i16, i16* %24, align 2
  %26 = zext i16 %25 to i64
  %27 = load i64, i64* %9, align 8
  %28 = add i64 %26, %27
  %29 = load i64, i64* %8, align 8
  %30 = add i64 %29, %28
  store i64 %30, i64* %8, align 8
  %31 = load i64, i64* %8, align 8
  %32 = trunc i64 %31 to i16
  %33 = load i16*, i16** %4, align 8
  %34 = getelementptr inbounds i16, i16* %33, i32 1
  store i16* %34, i16** %4, align 8
  store i16 %32, i16* %33, align 2
  %35 = load i64, i64* %8, align 8
  %36 = lshr i64 %35, 16
  store i64 %36, i64* %9, align 8
  br label %37

; <label>:37:                                     ; preds = %16
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mp_smul, i64 0, i64 0)
  %38 = add i64 %pgocount, 1
  store i64 %38, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mp_smul, i64 0, i64 0)
  %39 = load i16, i16* %7, align 2
  %40 = add i16 %39, 1
  store i16 %40, i16* %7, align 2
  br label %10

; <label>:41:                                     ; preds = %10
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mp_smul, i64 0, i64 1)
  %42 = add i64 %pgocount1, 1
  store i64 %42, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mp_smul, i64 0, i64 1)
  %43 = load i64, i64* %9, align 8
  %44 = trunc i64 %43 to i16
  %45 = zext i16 %44 to i32
  %46 = load i16*, i16** %4, align 8
  %47 = load i16, i16* %46, align 2
  %48 = zext i16 %47 to i32
  %49 = add nsw i32 %48, %45
  %50 = trunc i32 %49 to i16
  store i16 %50, i16* %46, align 2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @mp_dmul(i16*, i16*, i16*) #0 {
  %4 = alloca i16*, align 8
  %5 = alloca i16*, align 8
  %6 = alloca i16*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i16*, align 8
  %9 = alloca i16*, align 8
  %10 = alloca i16*, align 8
  store i16* %0, i16** %4, align 8
  store i16* %1, i16** %5, align 8
  store i16* %2, i16** %6, align 8
  %11 = load i16*, i16** %4, align 8
  %12 = bitcast i16* %11 to i8*
  %13 = load i16, i16* @global_precision, align 2
  %14 = sext i16 %13 to i32
  %15 = mul nsw i32 %14, 2
  %16 = shl i32 %15, 1
  %17 = sext i32 %16 to i64
  call void @llvm.memset.p0i8.i64(i8* %12, i8 0, i64 %17, i32 1, i1 false)
  %18 = load i16, i16* @global_precision, align 2
  %19 = sext i16 %18 to i32
  %20 = mul nsw i32 %19, 16
  %21 = sdiv i32 %20, 16
  %22 = trunc i32 %21 to i16
  store i16 %22, i16* @munit_prec, align 2
  %23 = load i16*, i16** %5, align 8
  store i16* %23, i16** %8, align 8
  %24 = load i16*, i16** %6, align 8
  store i16* %24, i16** %9, align 8
  %25 = load i16*, i16** %4, align 8
  store i16* %25, i16** %10, align 8
  store i32 0, i32* %7, align 4
  br label %26

; <label>:26:                                     ; preds = %38, %3
  %27 = load i32, i32* %7, align 4
  %28 = load i16, i16* @munit_prec, align 2
  %29 = sext i16 %28 to i32
  %30 = icmp slt i32 %27, %29
  br i1 %30, label %31, label %42

; <label>:31:                                     ; preds = %26
  %32 = load i16*, i16** %10, align 8
  %33 = getelementptr inbounds i16, i16* %32, i32 1
  store i16* %33, i16** %10, align 8
  %34 = load i16*, i16** %8, align 8
  %35 = load i16*, i16** %9, align 8
  %36 = getelementptr inbounds i16, i16* %35, i32 1
  store i16* %36, i16** %9, align 8
  %37 = load i16, i16* %35, align 2
  call void @mp_smul(i16* %32, i16* %34, i16 zeroext %37)
  br label %38

; <label>:38:                                     ; preds = %31
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mp_dmul, i64 0, i64 0)
  %39 = add i64 %pgocount, 1
  store i64 %39, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mp_dmul, i64 0, i64 0)
  %40 = load i32, i32* %7, align 4
  %41 = add nsw i32 %40, 1
  store i32 %41, i32* %7, align 4
  br label %26

; <label>:42:                                     ; preds = %26
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mp_dmul, i64 0, i64 1)
  %43 = add i64 %pgocount1, 1
  store i64 %43, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mp_dmul, i64 0, i64 1)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define zeroext i16 @mp_quo_digit(i16*) #0 {
  %2 = alloca i16*, align 8
  %3 = alloca i64, align 8
  %4 = alloca i64, align 8
  %5 = alloca i64, align 8
  %6 = alloca i64, align 8
  %7 = alloca i16, align 2
  store i16* %0, i16** %2, align 8
  %8 = load i16*, i16** %2, align 8
  %9 = getelementptr inbounds i16, i16* %8, i64 -2
  %10 = load i16, i16* %9, align 2
  %11 = zext i16 %10 to i32
  %12 = xor i32 %11, 65535
  %13 = sext i32 %12 to i64
  %14 = load i16, i16* @reciph, align 2
  %15 = zext i16 %14 to i64
  %16 = mul i64 %13, %15
  %17 = load i16, i16* @reciph, align 2
  %18 = zext i16 %17 to i64
  %19 = add i64 %16, %18
  store i64 %19, i64* %5, align 8
  %20 = load i16*, i16** %2, align 8
  %21 = getelementptr inbounds i16, i16* %20, i64 -1
  %22 = load i16, i16* %21, align 2
  %23 = zext i16 %22 to i32
  %24 = xor i32 %23, 65535
  %25 = sext i32 %24 to i64
  %26 = load i16, i16* @recipl, align 2
  %27 = zext i16 %26 to i64
  %28 = mul i64 %25, %27
  %29 = add i64 %28, 65536
  store i64 %29, i64* %6, align 8
  %30 = load i64, i64* %5, align 8
  %31 = lshr i64 %30, 1
  %32 = load i64, i64* %6, align 8
  %33 = lshr i64 %32, 1
  %34 = add i64 %31, %33
  %35 = add i64 %34, 1
  store i64 %35, i64* %4, align 8
  %36 = load i16*, i16** %2, align 8
  %37 = getelementptr inbounds i16, i16* %36, i64 -1
  %38 = load i16, i16* %37, align 2
  %39 = zext i16 %38 to i32
  %40 = xor i32 %39, 65535
  %41 = sext i32 %40 to i64
  %42 = load i16, i16* @reciph, align 2
  %43 = zext i16 %42 to i64
  %44 = mul i64 %41, %43
  store i64 %44, i64* %5, align 8
  %45 = load i16*, i16** %2, align 8
  %46 = getelementptr inbounds i16, i16* %45, i64 0
  %47 = load i16, i16* %46, align 2
  %48 = zext i16 %47 to i32
  %49 = xor i32 %48, 65535
  %50 = sext i32 %49 to i64
  %51 = load i16, i16* @recipl, align 2
  %52 = zext i16 %51 to i64
  %53 = mul i64 %50, %52
  store i64 %53, i64* %6, align 8
  %54 = load i64, i64* %4, align 8
  %55 = lshr i64 %54, 16
  %56 = load i64, i64* %5, align 8
  %57 = lshr i64 %56, 1
  %58 = add i64 %55, %57
  %59 = load i64, i64* %6, align 8
  %60 = lshr i64 %59, 1
  %61 = add i64 %58, %60
  %62 = add i64 %61, 1
  store i64 %62, i64* %3, align 8
  %63 = load i64, i64* %3, align 8
  %64 = lshr i64 %63, 14
  %65 = load i16*, i16** %2, align 8
  %66 = getelementptr inbounds i16, i16* %65, i64 0
  %67 = load i16, i16* %66, align 2
  %68 = zext i16 %67 to i32
  %69 = xor i32 %68, 65535
  %70 = sext i32 %69 to i64
  %71 = load i16, i16* @reciph, align 2
  %72 = zext i16 %71 to i64
  %73 = mul i64 %70, %72
  %74 = shl i64 %73, 1
  %75 = add i64 %64, %74
  store i64 %75, i64* %3, align 8
  %76 = load i32, i32* @mshift, align 4
  %77 = load i64, i64* %3, align 8
  %78 = zext i32 %76 to i64
  %79 = lshr i64 %77, %78
  store i64 %79, i64* %3, align 8
  %80 = load i64, i64* %3, align 8
  %81 = icmp ult i64 %80, 65535
  br i1 %81, label %82, label %85

; <label>:82:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mp_quo_digit, i64 0, i64 0)
  %83 = add i64 %pgocount, 1
  store i64 %83, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mp_quo_digit, i64 0, i64 0)
  %84 = load i64, i64* %3, align 8
  br label %87

; <label>:85:                                     ; preds = %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mp_quo_digit, i64 0, i64 1)
  %86 = add i64 %pgocount1, 1
  store i64 %86, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_mp_quo_digit, i64 0, i64 1)
  br label %87

; <label>:87:                                     ; preds = %85, %82
  %88 = phi i64 [ %84, %82 ], [ 65535, %85 ]
  %89 = trunc i64 %88 to i16
  store i16 %89, i16* @mutemp, align 2
  store i64 0, i64* %6, align 8
  store i64 0, i64* %5, align 8
  store i64 0, i64* %4, align 8
  store i64 0, i64* %3, align 8
  store i16 0, i16* %7, align 2
  %90 = load i16, i16* %7, align 2
  %91 = load i16, i16* @mutemp, align 2
  ret i16 %91
}

; Function Attrs: noinline nounwind uwtable
define i32 @stage_smith_modulus(i16*) #0 {
  %2 = alloca i16*, align 8
  %3 = alloca i32, align 4
  %4 = alloca i32, align 4
  %5 = alloca i16*, align 8
  %6 = alloca i16*, align 8
  %7 = alloca i32, align 4
  store i16* %0, i16** %2, align 8
  %8 = load i16*, i16** %2, align 8
  %9 = bitcast i16* %8 to i8*
  %10 = load i16, i16* @global_precision, align 2
  %11 = sext i16 %10 to i32
  %12 = shl i32 %11, 1
  %13 = sext i32 %12 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast ([130 x i16]* @modulus to i8*), i8* %9, i64 %13, i32 1, i1 false)
  store i16* getelementptr inbounds ([130 x i16], [130 x i16]* @modulus, i32 0, i32 0), i16** @modmpl, align 8
  %14 = load i16*, i16** @modmpl, align 8
  store i16* %14, i16** @modmpl, align 8
  %15 = call i32 @countbits(i16* getelementptr inbounds ([130 x i16], [130 x i16]* @modulus, i32 0, i32 0))
  %16 = trunc i32 %15 to i16
  store i16 %16, i16* @nbits, align 2
  %17 = load i16, i16* @nbits, align 2
  %18 = sext i16 %17 to i32
  %19 = add nsw i32 %18, 16
  %20 = sub nsw i32 %19, 1
  %21 = sdiv i32 %20, 16
  %22 = trunc i32 %21 to i16
  store i16 %22, i16* @modlenMULTUNITS, align 2
  %23 = load i16, i16* @global_precision, align 2
  %24 = sext i16 %23 to i32
  store i32 %24, i32* %3, align 4
  store i16* getelementptr inbounds ([130 x i16], [130 x i16]* @modulus, i32 0, i32 0), i16** %5, align 8
  %25 = call signext i16 @significance(i16* getelementptr inbounds ([130 x i16], [130 x i16]* @modulus, i32 0, i32 0))
  %26 = sext i16 %25 to i32
  store i32 %26, i32* %4, align 4
  store i32 3, i32* %7, align 4
  %27 = load i32, i32* %7, align 4
  %28 = trunc i32 %27 to i16
  store i16 %28, i16* @global_precision, align 2
  %29 = load i16*, i16** %5, align 8
  %30 = load i32, i32* %4, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds i16, i16* %29, i64 %31
  %33 = getelementptr inbounds i16, i16* %32, i64 -1
  %34 = load i32, i32* %7, align 4
  %35 = sub nsw i32 %34, 1
  %36 = sext i32 %35 to i64
  %37 = sub i64 0, %36
  %38 = getelementptr inbounds i16, i16* %33, i64 %37
  store i16* %38, i16** %5, align 8
  %39 = load i16*, i16** %5, align 8
  %40 = bitcast i16* %39 to i8*
  %41 = load i16, i16* @global_precision, align 2
  %42 = sext i16 %41 to i32
  %43 = shl i32 %42, 1
  %44 = sext i32 %43 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* bitcast ([4 x i16]* @mod_divisor to i8*), i8* %40, i64 %44, i32 1, i1 false)
  %45 = call i32 @countbits(i16* getelementptr inbounds ([4 x i16], [4 x i16]* @mod_divisor, i32 0, i32 0))
  %46 = sub nsw i32 %45, 32
  store i32 %46, i32* @mshift, align 4
  %47 = load i32, i32* @mshift, align 4
  %48 = trunc i32 %47 to i16
  call void @mp_shift_right_bits(i16* getelementptr inbounds ([4 x i16], [4 x i16]* @mod_divisor, i32 0, i32 0), i16 signext %48)
  %49 = call i32 @mp_recip(i16* getelementptr inbounds ([4 x i16], [4 x i16]* @mod_quotient, i32 0, i32 0), i16* getelementptr inbounds ([4 x i16], [4 x i16]* @mod_divisor, i32 0, i32 0))
  call void @mp_shift_right_bits(i16* getelementptr inbounds ([4 x i16], [4 x i16]* @mod_quotient, i32 0, i32 0), i16 signext 1)
  %50 = load i32, i32* @mshift, align 4
  %51 = add nsw i32 %50, 15
  %52 = srem i32 %51, 16
  %53 = add nsw i32 %52, 1
  store i32 %53, i32* @mshift, align 4
  %54 = call zeroext i8 @mp_inc(i16* getelementptr inbounds ([4 x i16], [4 x i16]* @mod_quotient, i32 0, i32 0))
  %55 = call i32 @countbits(i16* getelementptr inbounds ([4 x i16], [4 x i16]* @mod_quotient, i32 0, i32 0))
  %56 = icmp sgt i32 %55, 32
  br i1 %56, label %57, label %61

; <label>:57:                                     ; preds = %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_stage_smith_modulus, i64 0, i64 1)
  %58 = add i64 %pgocount, 1
  store i64 %58, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_stage_smith_modulus, i64 0, i64 1)
  call void @mp_shift_right_bits(i16* getelementptr inbounds ([4 x i16], [4 x i16]* @mod_quotient, i32 0, i32 0), i16 signext 1)
  %59 = load i32, i32* @mshift, align 4
  %60 = add nsw i32 %59, -1
  store i32 %60, i32* @mshift, align 4
  br label %61

; <label>:61:                                     ; preds = %57, %1
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_stage_smith_modulus, i64 0, i64 0)
  %62 = add i64 %pgocount1, 1
  store i64 %62, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_stage_smith_modulus, i64 0, i64 0)
  store i16* getelementptr inbounds ([4 x i16], [4 x i16]* @mod_quotient, i32 0, i32 0), i16** %6, align 8
  %63 = load i16*, i16** %6, align 8
  %64 = getelementptr inbounds i16, i16* %63, i32 1
  store i16* %64, i16** %6, align 8
  %65 = load i16, i16* %63, align 2
  store i16 %65, i16* @recipl, align 2
  %66 = load i16*, i16** %6, align 8
  %67 = load i16, i16* %66, align 2
  store i16 %67, i16* @reciph, align 2
  %68 = load i32, i32* %3, align 4
  %69 = trunc i32 %68 to i16
  store i16 %69, i16* @global_precision, align 2
  ret i32 0
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #1

; Function Attrs: noinline nounwind uwtable
define i32 @smith_modmult(i16*, i16*, i16*) #0 {
  %4 = alloca i16*, align 8
  %5 = alloca i16*, align 8
  %6 = alloca i16*, align 8
  %7 = alloca i16*, align 8
  %8 = alloca i16*, align 8
  %9 = alloca i16*, align 8
  %10 = alloca i16*, align 8
  %11 = alloca i16, align 2
  %12 = alloca i16, align 2
  %13 = alloca i16, align 2
  %14 = alloca i16, align 2
  store i16* %0, i16** %4, align 8
  store i16* %1, i16** %5, align 8
  store i16* %2, i16** %6, align 8
  store i16* getelementptr inbounds ([262 x i16], [262 x i16]* @ds_data, i32 0, i64 1), i16** %7, align 8
  %15 = load i16, i16* @global_precision, align 2
  store i16 %15, i16* %11, align 2
  %16 = load i16*, i16** %7, align 8
  %17 = load i16*, i16** %5, align 8
  %18 = load i16*, i16** %6, align 8
  call void @mp_dmul(i16* %16, i16* %17, i16* %18)
  %19 = load i16, i16* %11, align 2
  %20 = sext i16 %19 to i32
  %21 = mul nsw i32 %20, 2
  %22 = add nsw i32 %21, 1
  %23 = trunc i32 %22 to i16
  store i16 %23, i16* @global_precision, align 2
  %24 = load i16*, i16** %7, align 8
  %25 = load i16, i16* @global_precision, align 2
  %26 = sext i16 %25 to i32
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i16, i16* %24, i64 %27
  %29 = getelementptr inbounds i16, i16* %28, i64 -1
  store i16 0, i16* %29, align 2
  %30 = load i16*, i16** %7, align 8
  %31 = call signext i16 @significance(i16* %30)
  %32 = sext i16 %31 to i32
  %33 = mul nsw i32 %32, 1
  %34 = trunc i32 %33 to i16
  store i16 %34, i16* %13, align 2
  %35 = load i16, i16* %13, align 2
  %36 = sext i16 %35 to i32
  %37 = load i16, i16* @modlenMULTUNITS, align 2
  %38 = sext i16 %37 to i32
  %39 = icmp sge i32 %36, %38
  br i1 %39, label %40, label %115

; <label>:40:                                     ; preds = %3
  %41 = load i16*, i16** %7, align 8
  %42 = call zeroext i8 @mp_inc(i16* %41)
  %43 = load i16*, i16** %7, align 8
  call void @mp_neg(i16* %43)
  %44 = load i16, i16* %11, align 2
  store i16 %44, i16* @global_precision, align 2
  %45 = load i16, i16* @global_precision, align 2
  %46 = sext i16 %45 to i32
  %47 = mul nsw i32 %46, 16
  %48 = sdiv i32 %47, 16
  %49 = trunc i32 %48 to i16
  store i16 %49, i16* @munit_prec, align 2
  %50 = load i16*, i16** %7, align 8
  %51 = load i16, i16* %13, align 2
  %52 = sext i16 %51 to i32
  %53 = sext i32 %52 to i64
  %54 = getelementptr inbounds i16, i16* %50, i64 %53
  store i16* %54, i16** %8, align 8
  %55 = load i16, i16* %13, align 2
  %56 = sext i16 %55 to i32
  %57 = add nsw i32 %56, 1
  %58 = load i16, i16* @modlenMULTUNITS, align 2
  %59 = sext i16 %58 to i32
  %60 = sub nsw i32 %57, %59
  %61 = trunc i32 %60 to i16
  store i16 %61, i16* %12, align 2
  %62 = load i16*, i16** %8, align 8
  %63 = load i16, i16* @modlenMULTUNITS, align 2
  %64 = sext i16 %63 to i32
  %65 = sext i32 %64 to i64
  %66 = sub i64 0, %65
  %67 = getelementptr inbounds i16, i16* %62, i64 %66
  store i16* %67, i16** %9, align 8
  br label %68

; <label>:68:                                     ; preds = %105, %40
  %69 = load i16, i16* %12, align 2
  %70 = icmp ne i16 %69, 0
  br i1 %70, label %71, label %109

; <label>:71:                                     ; preds = %68
  %72 = load i16*, i16** %8, align 8
  %73 = call zeroext i16 @mp_quo_digit(i16* %72)
  store i16 %73, i16* %14, align 2
  %74 = load i16, i16* %14, align 2
  %75 = zext i16 %74 to i32
  %76 = icmp sgt i32 %75, 0
  br i1 %76, label %77, label %100

; <label>:77:                                     ; preds = %71
  %78 = load i16*, i16** %9, align 8
  %79 = load i16*, i16** @modmpl, align 8
  %80 = load i16, i16* %14, align 2
  call void @mp_smul(i16* %78, i16* %79, i16 zeroext %80)
  %81 = load i16*, i16** %8, align 8
  %82 = load i16, i16* %81, align 2
  %83 = zext i16 %82 to i32
  %84 = and i32 %83, 32768
  %85 = icmp ne i32 %84, 0
  br i1 %85, label %98, label %86

; <label>:86:                                     ; preds = %77
  %87 = load i16*, i16** %9, align 8
  store i16* %87, i16** %10, align 8
  %88 = load i16*, i16** %10, align 8
  %89 = call zeroext i8 @mp_subb(i16* %88, i16* getelementptr inbounds ([130 x i16], [130 x i16]* @modulus, i32 0, i32 0), i8 zeroext 0)
  %90 = icmp ne i8 %89, 0
  br i1 %90, label %91, label %96

; <label>:91:                                     ; preds = %86
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_smith_modmult, i64 0, i64 3)
  %92 = add i64 %pgocount, 1
  store i64 %92, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_smith_modmult, i64 0, i64 3)
  %93 = load i16*, i16** %8, align 8
  %94 = load i16, i16* %93, align 2
  %95 = add i16 %94, -1
  store i16 %95, i16* %93, align 2
  br label %96

; <label>:96:                                     ; preds = %91, %86
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_smith_modmult, i64 0, i64 2)
  %97 = add i64 %pgocount1, 1
  store i64 %97, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_smith_modmult, i64 0, i64 2)
  br label %98

; <label>:98:                                     ; preds = %96, %77
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_smith_modmult, i64 0, i64 1)
  %99 = add i64 %pgocount2, 1
  store i64 %99, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_smith_modmult, i64 0, i64 1)
  br label %100

; <label>:100:                                    ; preds = %98, %71
  %101 = load i16*, i16** %8, align 8
  %102 = getelementptr inbounds i16, i16* %101, i32 -1
  store i16* %102, i16** %8, align 8
  %103 = load i16*, i16** %9, align 8
  %104 = getelementptr inbounds i16, i16* %103, i32 -1
  store i16* %104, i16** %9, align 8
  br label %105

; <label>:105:                                    ; preds = %100
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_smith_modmult, i64 0, i64 0)
  %106 = add i64 %pgocount3, 1
  store i64 %106, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_smith_modmult, i64 0, i64 0)
  %107 = load i16, i16* %12, align 2
  %108 = add i16 %107, -1
  store i16 %108, i16* %12, align 2
  br label %68

; <label>:109:                                    ; preds = %68
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_smith_modmult, i64 0, i64 4)
  %110 = add i64 %pgocount4, 1
  store i64 %110, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_smith_modmult, i64 0, i64 4)
  %111 = load i16, i16* %11, align 2
  store i16 %111, i16* @global_precision, align 2
  %112 = load i16*, i16** %7, align 8
  call void @mp_neg(i16* %112)
  %113 = load i16*, i16** %7, align 8
  %114 = call zeroext i8 @mp_dec(i16* %113)
  br label %118

; <label>:115:                                    ; preds = %3
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_smith_modmult, i64 0, i64 5)
  %116 = add i64 %pgocount5, 1
  store i64 %116, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_smith_modmult, i64 0, i64 5)
  %117 = load i16, i16* %11, align 2
  store i16 %117, i16* @global_precision, align 2
  br label %118

; <label>:118:                                    ; preds = %115, %109
  %119 = load i16*, i16** %4, align 8
  %120 = bitcast i16* %119 to i8*
  %121 = load i16*, i16** %7, align 8
  %122 = bitcast i16* %121 to i8*
  %123 = load i16, i16* @global_precision, align 2
  %124 = sext i16 %123 to i32
  %125 = shl i32 %124, 1
  %126 = sext i32 %125 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %120, i8* %122, i64 %126, i32 1, i1 false)
  ret i32 0
}

; Function Attrs: noinline nounwind uwtable
define void @smith_burn() #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_smith_burn, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_smith_burn, i64 0, i64 0)
  call void @llvm.memset.p0i8.i64(i8* bitcast ([130 x i16]* @modulus to i8*), i8 0, i64 130, i32 16, i1 false)
  call void @llvm.memset.p0i8.i64(i8* bitcast ([262 x i16]* @ds_data to i8*), i8 0, i64 262, i32 16, i1 false)
  call void @llvm.memset.p0i8.i64(i8* bitcast ([4 x i16]* @mod_quotient to i8*), i8 0, i64 4, i32 2, i1 false)
  call void @llvm.memset.p0i8.i64(i8* bitcast ([4 x i16]* @mod_divisor to i8*), i8 0, i64 4, i32 2, i1 false)
  store i16* null, i16** @modmpl, align 8
  store i16 0, i16* @nbits, align 2
  store i32 0, i32* @mshift, align 4
  store i16 0, i16* @recipl, align 2
  store i16 0, i16* @reciph, align 2
  store i16 0, i16* @mutemp, align 2
  store i16 0, i16* @modlenMULTUNITS, align 2
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i8* @copyright_notice() #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_copyright_notice, i64 0, i64 0)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_copyright_notice, i64 0, i64 0)
  ret i8* getelementptr inbounds ([26 x i8], [26 x i8]* @.str, i32 0, i32 0)
}

; Function Attrs: noinline nounwind uwtable
define i32 @mp_modexp(i16*, i16*, i16*, i16*) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i16*, align 8
  %7 = alloca i16*, align 8
  %8 = alloca i16*, align 8
  %9 = alloca i16*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i16, align 2
  %12 = alloca i16, align 2
  %13 = alloca [130 x i16], align 16
  %14 = alloca i16, align 2
  store i16* %0, i16** %6, align 8
  store i16* %1, i16** %7, align 8
  store i16* %2, i16** %8, align 8
  store i16* %3, i16** %9, align 8
  %15 = load i16*, i16** %6, align 8
  call void @mp_init(i16* %15, i16 zeroext 1)
  %16 = load i16*, i16** %8, align 8
  %17 = load i16, i16* %16, align 2
  %18 = zext i16 %17 to i32
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %41

; <label>:20:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_mp_modexp, i64 0, i64 4)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_mp_modexp, i64 0, i64 4)
  %22 = load i16*, i16** %8, align 8
  %23 = call signext i16 @significance(i16* %22)
  %24 = sext i16 %23 to i32
  %25 = icmp sle i32 %24, 1
  br i1 %25, label %26, label %41

; <label>:26:                                     ; preds = %20
  %27 = load i16*, i16** %7, align 8
  %28 = load i16, i16* %27, align 2
  %29 = zext i16 %28 to i32
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %31, label %39

; <label>:31:                                     ; preds = %26
  %pgocount1 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_mp_modexp, i64 0, i64 11)
  %32 = add i64 %pgocount1, 1
  store i64 %32, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_mp_modexp, i64 0, i64 11)
  %33 = load i16*, i16** %7, align 8
  %34 = call signext i16 @significance(i16* %33)
  %35 = sext i16 %34 to i32
  %36 = icmp sle i32 %35, 1
  br i1 %36, label %37, label %39

; <label>:37:                                     ; preds = %31
  %pgocount2 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_mp_modexp, i64 0, i64 13)
  %38 = add i64 %pgocount2, 1
  store i64 %38, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_mp_modexp, i64 0, i64 13)
  store i32 -1, i32* %5, align 4
  br label %187

; <label>:39:                                     ; preds = %31, %26
  %pgocount3 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_mp_modexp, i64 0, i64 8)
  %40 = add i64 %pgocount3, 1
  store i64 %40, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_mp_modexp, i64 0, i64 8)
  store i32 0, i32* %5, align 4
  br label %187

; <label>:41:                                     ; preds = %20, %4
  %42 = load i16*, i16** %9, align 8
  %43 = load i16, i16* %42, align 2
  %44 = zext i16 %43 to i32
  %45 = icmp eq i32 %44, 0
  br i1 %45, label %46, label %54

; <label>:46:                                     ; preds = %41
  %pgocount4 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_mp_modexp, i64 0, i64 6)
  %47 = add i64 %pgocount4, 1
  store i64 %47, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_mp_modexp, i64 0, i64 6)
  %48 = load i16*, i16** %9, align 8
  %49 = call signext i16 @significance(i16* %48)
  %50 = sext i16 %49 to i32
  %51 = icmp sle i32 %50, 1
  br i1 %51, label %52, label %54

; <label>:52:                                     ; preds = %46
  %pgocount5 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_mp_modexp, i64 0, i64 9)
  %53 = add i64 %pgocount5, 1
  store i64 %53, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_mp_modexp, i64 0, i64 9)
  store i32 -2, i32* %5, align 4
  br label %187

; <label>:54:                                     ; preds = %46, %41
  %55 = load i16*, i16** %7, align 8
  %56 = load i16*, i16** %9, align 8
  %57 = call signext i16 @mp_compare(i16* %55, i16* %56)
  %58 = sext i16 %57 to i32
  %59 = icmp sge i32 %58, 0
  br i1 %59, label %60, label %62

; <label>:60:                                     ; preds = %54
  %pgocount6 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_mp_modexp, i64 0, i64 5)
  %61 = add i64 %pgocount6, 1
  store i64 %61, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_mp_modexp, i64 0, i64 5)
  store i32 -3, i32* %5, align 4
  br label %187

; <label>:62:                                     ; preds = %54
  %63 = load i16*, i16** %8, align 8
  %64 = load i16*, i16** %9, align 8
  %65 = call signext i16 @mp_compare(i16* %63, i16* %64)
  %66 = sext i16 %65 to i32
  %67 = icmp sge i32 %66, 0
  br i1 %67, label %68, label %70

; <label>:68:                                     ; preds = %62
  %pgocount7 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_mp_modexp, i64 0, i64 7)
  %69 = add i64 %pgocount7, 1
  store i64 %69, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_mp_modexp, i64 0, i64 7)
  store i32 -4, i32* %5, align 4
  br label %187

; <label>:70:                                     ; preds = %62
  %71 = load i16, i16* @global_precision, align 2
  store i16 %71, i16* %11, align 2
  %72 = load i16*, i16** %9, align 8
  %73 = call i32 @countbits(i16* %72)
  %74 = add nsw i32 %73, 0
  %75 = add nsw i32 %74, 15
  %76 = ashr i32 %75, 4
  %77 = trunc i32 %76 to i16
  store i16 %77, i16* @global_precision, align 2
  %78 = load i16*, i16** %9, align 8
  %79 = call i32 @stage_smith_modulus(i16* %78)
  %80 = icmp ne i32 %79, 0
  br i1 %80, label %81, label %84

; <label>:81:                                     ; preds = %70
  %pgocount8 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_mp_modexp, i64 0, i64 10)
  %82 = add i64 %pgocount8, 1
  store i64 %82, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_mp_modexp, i64 0, i64 10)
  %83 = load i16, i16* %11, align 2
  store i16 %83, i16* @global_precision, align 2
  store i32 -5, i32* %5, align 4
  br label %187

; <label>:84:                                     ; preds = %70
  %85 = load i16*, i16** %8, align 8
  %86 = call signext i16 @significance(i16* %85)
  store i16 %86, i16* %14, align 2
  %87 = load i16, i16* %14, align 2
  %88 = icmp ne i16 %87, 0
  br i1 %88, label %91, label %89

; <label>:89:                                     ; preds = %84
  %pgocount9 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_mp_modexp, i64 0, i64 14)
  %90 = add i64 %pgocount9, 1
  store i64 %90, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_mp_modexp, i64 0, i64 14)
  store i32 0, i32* %5, align 4
  br label %187

; <label>:91:                                     ; preds = %84
  %92 = load i16, i16* %14, align 2
  %93 = sext i16 %92 to i32
  %94 = shl i32 %93, 4
  store i32 %94, i32* %10, align 4
  %95 = load i16*, i16** %8, align 8
  %96 = load i16, i16* %14, align 2
  %97 = sext i16 %96 to i32
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds i16, i16* %95, i64 %98
  %100 = getelementptr inbounds i16, i16* %99, i64 -1
  store i16* %100, i16** %8, align 8
  store i16 -32768, i16* %12, align 2
  br label %101

; <label>:101:                                    ; preds = %110, %91
  %102 = load i16*, i16** %8, align 8
  %103 = load i16, i16* %102, align 2
  %104 = zext i16 %103 to i32
  %105 = load i16, i16* %12, align 2
  %106 = zext i16 %105 to i32
  %107 = and i32 %104, %106
  %108 = icmp ne i32 %107, 0
  %109 = xor i1 %108, true
  br i1 %109, label %110, label %118

; <label>:110:                                    ; preds = %101
  %pgocount10 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_mp_modexp, i64 0, i64 0)
  %111 = add i64 %pgocount10, 1
  store i64 %111, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_mp_modexp, i64 0, i64 0)
  %112 = load i16, i16* %12, align 2
  %113 = zext i16 %112 to i32
  %114 = ashr i32 %113, 1
  %115 = trunc i32 %114 to i16
  store i16 %115, i16* %12, align 2
  %116 = load i32, i32* %10, align 4
  %117 = add nsw i32 %116, -1
  store i32 %117, i32* %10, align 4
  br label %101

; <label>:118:                                    ; preds = %101
  %119 = load i32, i32* %10, align 4
  %120 = add nsw i32 %119, -1
  store i32 %120, i32* %10, align 4
  %121 = load i16*, i16** %6, align 8
  %122 = bitcast i16* %121 to i8*
  %123 = load i16*, i16** %7, align 8
  %124 = bitcast i16* %123 to i8*
  %125 = load i16, i16* @global_precision, align 2
  %126 = sext i16 %125 to i32
  %127 = shl i32 %126, 1
  %128 = sext i32 %127 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %122, i8* %124, i64 %128, i32 1, i1 false)
  %129 = load i16, i16* %12, align 2
  %130 = zext i16 %129 to i32
  %131 = ashr i32 %130, 1
  %132 = trunc i32 %131 to i16
  store i16 %132, i16* %12, align 2
  %133 = icmp ne i16 %132, 0
  br i1 %133, label %138, label %134

; <label>:134:                                    ; preds = %118
  %pgocount11 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_mp_modexp, i64 0, i64 15)
  %135 = add i64 %pgocount11, 1
  store i64 %135, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_mp_modexp, i64 0, i64 15)
  store i16 -32768, i16* %12, align 2
  %136 = load i16*, i16** %8, align 8
  %137 = getelementptr inbounds i16, i16* %136, i32 -1
  store i16* %137, i16** %8, align 8
  br label %138

; <label>:138:                                    ; preds = %134, %118
  br label %139

; <label>:139:                                    ; preds = %181, %138
  %140 = load i32, i32* %10, align 4
  %141 = add nsw i32 %140, -1
  store i32 %141, i32* %10, align 4
  %142 = icmp ne i32 %140, 0
  br i1 %142, label %143, label %182

; <label>:143:                                    ; preds = %139
  %144 = getelementptr inbounds [130 x i16], [130 x i16]* %13, i32 0, i32 0
  %145 = load i16*, i16** %6, align 8
  %146 = load i16*, i16** %6, align 8
  %147 = call i32 @smith_modmult(i16* %144, i16* %145, i16* %146)
  %148 = load i16*, i16** %8, align 8
  %149 = load i16, i16* %148, align 2
  %150 = zext i16 %149 to i32
  %151 = load i16, i16* %12, align 2
  %152 = zext i16 %151 to i32
  %153 = and i32 %150, %152
  %154 = icmp ne i32 %153, 0
  br i1 %154, label %155, label %161

; <label>:155:                                    ; preds = %143
  %pgocount12 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_mp_modexp, i64 0, i64 1)
  %156 = add i64 %pgocount12, 1
  store i64 %156, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_mp_modexp, i64 0, i64 1)
  %157 = load i16*, i16** %6, align 8
  %158 = getelementptr inbounds [130 x i16], [130 x i16]* %13, i32 0, i32 0
  %159 = load i16*, i16** %7, align 8
  %160 = call i32 @smith_modmult(i16* %157, i16* %158, i16* %159)
  br label %171

; <label>:161:                                    ; preds = %143
  %pgocount13 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_mp_modexp, i64 0, i64 2)
  %162 = add i64 %pgocount13, 1
  store i64 %162, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_mp_modexp, i64 0, i64 2)
  %163 = load i16*, i16** %6, align 8
  %164 = bitcast i16* %163 to i8*
  %165 = getelementptr inbounds [130 x i16], [130 x i16]* %13, i32 0, i32 0
  %166 = bitcast i16* %165 to i8*
  %167 = load i16, i16* @global_precision, align 2
  %168 = sext i16 %167 to i32
  %169 = shl i32 %168, 1
  %170 = sext i32 %169 to i64
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %164, i8* %166, i64 %170, i32 1, i1 false)
  br label %171

; <label>:171:                                    ; preds = %161, %155
  %172 = load i16, i16* %12, align 2
  %173 = zext i16 %172 to i32
  %174 = ashr i32 %173, 1
  %175 = trunc i32 %174 to i16
  store i16 %175, i16* %12, align 2
  %176 = icmp ne i16 %175, 0
  br i1 %176, label %181, label %177

; <label>:177:                                    ; preds = %171
  %pgocount14 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_mp_modexp, i64 0, i64 3)
  %178 = add i64 %pgocount14, 1
  store i64 %178, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_mp_modexp, i64 0, i64 3)
  store i16 -32768, i16* %12, align 2
  %179 = load i16*, i16** %8, align 8
  %180 = getelementptr inbounds i16, i16* %179, i32 -1
  store i16* %180, i16** %8, align 8
  br label %181

; <label>:181:                                    ; preds = %177, %171
  br label %139

; <label>:182:                                    ; preds = %139
  %pgocount15 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_mp_modexp, i64 0, i64 12)
  %183 = add i64 %pgocount15, 1
  store i64 %183, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_mp_modexp, i64 0, i64 12)
  %184 = getelementptr inbounds [130 x i16], [130 x i16]* %13, i32 0, i32 0
  call void @mp_init(i16* %184, i16 zeroext 0)
  call void @smith_burn()
  %185 = load i16, i16* %11, align 2
  store i16 %185, i16* @global_precision, align 2
  %186 = call i8* @copyright_notice()
  store i32 0, i32* %5, align 4
  br label %187

; <label>:187:                                    ; preds = %182, %89, %81, %68, %60, %52, %39, %37
  %188 = load i32, i32* %5, align 4
  ret i32 %188
}

; Function Attrs: noinline nounwind uwtable
define i32 @mp_modexp_crt(i16*, i16*, i16*, i16*, i16*, i16*, i16*) #0 {
  %8 = alloca i32, align 4
  %9 = alloca i16*, align 8
  %10 = alloca i16*, align 8
  %11 = alloca i16*, align 8
  %12 = alloca i16*, align 8
  %13 = alloca i16*, align 8
  %14 = alloca i16*, align 8
  %15 = alloca i16*, align 8
  %16 = alloca [130 x i16], align 16
  %17 = alloca [130 x i16], align 16
  %18 = alloca i32, align 4
  store i16* %0, i16** %9, align 8
  store i16* %1, i16** %10, align 8
  store i16* %2, i16** %11, align 8
  store i16* %3, i16** %12, align 8
  store i16* %4, i16** %13, align 8
  store i16* %5, i16** %14, align 8
  store i16* %6, i16** %15, align 8
  %19 = getelementptr inbounds [130 x i16], [130 x i16]* %17, i32 0, i32 0
  %20 = load i16*, i16** %10, align 8
  %21 = load i16*, i16** %11, align 8
  %22 = call i32 @mp_mod(i16* %19, i16* %20, i16* %21)
  %23 = load i16*, i16** %9, align 8
  %24 = getelementptr inbounds [130 x i16], [130 x i16]* %17, i32 0, i32 0
  %25 = load i16*, i16** %13, align 8
  %26 = load i16*, i16** %11, align 8
  %27 = call i32 @mp_modexp(i16* %23, i16* %24, i16* %25, i16* %26)
  store i32 %27, i32* %18, align 4
  %28 = load i32, i32* %18, align 4
  %29 = icmp slt i32 %28, 0
  br i1 %29, label %30, label %34

; <label>:30:                                     ; preds = %7
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_mp_modexp_crt, i64 0, i64 1)
  %31 = add i64 %pgocount, 1
  store i64 %31, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_mp_modexp_crt, i64 0, i64 1)
  %32 = load i16*, i16** %9, align 8
  call void @mp_init(i16* %32, i16 zeroext 1)
  %33 = load i32, i32* %18, align 4
  store i32 %33, i32* %8, align 4
  br label %79

; <label>:34:                                     ; preds = %7
  %35 = getelementptr inbounds [130 x i16], [130 x i16]* %17, i32 0, i32 0
  %36 = load i16*, i16** %10, align 8
  %37 = load i16*, i16** %12, align 8
  %38 = call i32 @mp_mod(i16* %35, i16* %36, i16* %37)
  %39 = getelementptr inbounds [130 x i16], [130 x i16]* %16, i32 0, i32 0
  %40 = getelementptr inbounds [130 x i16], [130 x i16]* %17, i32 0, i32 0
  %41 = load i16*, i16** %14, align 8
  %42 = load i16*, i16** %12, align 8
  %43 = call i32 @mp_modexp(i16* %39, i16* %40, i16* %41, i16* %42)
  store i32 %43, i32* %18, align 4
  %44 = load i32, i32* %18, align 4
  %45 = icmp slt i32 %44, 0
  br i1 %45, label %46, label %50

; <label>:46:                                     ; preds = %34
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_mp_modexp_crt, i64 0, i64 3)
  %47 = add i64 %pgocount1, 1
  store i64 %47, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_mp_modexp_crt, i64 0, i64 3)
  %48 = load i16*, i16** %9, align 8
  call void @mp_init(i16* %48, i16 zeroext 1)
  %49 = load i32, i32* %18, align 4
  store i32 %49, i32* %8, align 4
  br label %79

; <label>:50:                                     ; preds = %34
  %51 = getelementptr inbounds [130 x i16], [130 x i16]* %16, i32 0, i32 0
  %52 = load i16*, i16** %9, align 8
  %53 = call zeroext i8 @mp_subb(i16* %51, i16* %52, i8 zeroext 0)
  %54 = icmp ne i8 %53, 0
  br i1 %54, label %55, label %60

; <label>:55:                                     ; preds = %50
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_mp_modexp_crt, i64 0, i64 2)
  %56 = add i64 %pgocount2, 1
  store i64 %56, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_mp_modexp_crt, i64 0, i64 2)
  %57 = getelementptr inbounds [130 x i16], [130 x i16]* %16, i32 0, i32 0
  %58 = load i16*, i16** %12, align 8
  %59 = call zeroext i8 @mp_addc(i16* %57, i16* %58, i8 zeroext 0)
  br label %60

; <label>:60:                                     ; preds = %55, %50
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_mp_modexp_crt, i64 0, i64 0)
  %61 = add i64 %pgocount3, 1
  store i64 %61, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_mp_modexp_crt, i64 0, i64 0)
  %62 = getelementptr inbounds [130 x i16], [130 x i16]* %17, i32 0, i32 0
  %63 = getelementptr inbounds [130 x i16], [130 x i16]* %16, i32 0, i32 0
  %64 = load i16*, i16** %15, align 8
  %65 = call i32 @mp_mult(i16* %62, i16* %63, i16* %64)
  %66 = getelementptr inbounds [130 x i16], [130 x i16]* %16, i32 0, i32 0
  %67 = getelementptr inbounds [130 x i16], [130 x i16]* %17, i32 0, i32 0
  %68 = load i16*, i16** %12, align 8
  %69 = call i32 @mp_mod(i16* %66, i16* %67, i16* %68)
  %70 = getelementptr inbounds [130 x i16], [130 x i16]* %17, i32 0, i32 0
  %71 = load i16*, i16** %11, align 8
  %72 = getelementptr inbounds [130 x i16], [130 x i16]* %16, i32 0, i32 0
  %73 = call i32 @mp_mult(i16* %70, i16* %71, i16* %72)
  %74 = load i16*, i16** %9, align 8
  %75 = getelementptr inbounds [130 x i16], [130 x i16]* %17, i32 0, i32 0
  %76 = call zeroext i8 @mp_addc(i16* %74, i16* %75, i8 zeroext 0)
  %77 = getelementptr inbounds [130 x i16], [130 x i16]* %16, i32 0, i32 0
  call void @mp_init(i16* %77, i16 zeroext 0)
  %78 = getelementptr inbounds [130 x i16], [130 x i16]* %17, i32 0, i32 0
  call void @mp_init(i16* %78, i16 zeroext 0)
  store i32 0, i32* %8, align 4
  br label %79

; <label>:79:                                     ; preds = %60, %46, %30
  %80 = load i32, i32* %8, align 4
  ret i32 %80
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { argmemonly nounwind }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
