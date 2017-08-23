; ModuleID = 'tmp1.ll'
source_filename = "takehiro.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.anon = type { i32, i32 }
%struct.scalefac_struct = type { [23 x i32], [14 x i32] }
%struct.huffcodetab = type { i32, i32, i64*, i8* }
%struct.lame_global_flags = type { i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, i8*, i32, i32, float, i32, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, float, i32, i32, i32, float, float, float, float, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.gr_info = type { i32, i32, i32, i32, i32, i32, i32, i32, [3 x i32], [3 x i32], i32, i32, i32, i32, i32, i32, i32, i32, i32, i32*, [4 x i32] }
%struct.III_side_info_t = type { i32, i32, i32, [2 x [4 x i32]], [2 x %struct.anon.0] }
%struct.anon.0 = type { [2 x %struct.gr_info_ss] }
%struct.gr_info_ss = type { %struct.gr_info }
%struct.III_scalefac_t = type { [22 x i32], [13 x [3 x i32]] }

$__llvm_profile_raw_version = comdat any

@subdv_table = global [23 x %struct.anon] [%struct.anon zeroinitializer, %struct.anon zeroinitializer, %struct.anon zeroinitializer, %struct.anon zeroinitializer, %struct.anon zeroinitializer, %struct.anon { i32 0, i32 1 }, %struct.anon { i32 1, i32 1 }, %struct.anon { i32 1, i32 1 }, %struct.anon { i32 1, i32 2 }, %struct.anon { i32 2, i32 2 }, %struct.anon { i32 2, i32 3 }, %struct.anon { i32 2, i32 3 }, %struct.anon { i32 3, i32 4 }, %struct.anon { i32 3, i32 4 }, %struct.anon { i32 3, i32 4 }, %struct.anon { i32 4, i32 5 }, %struct.anon { i32 4, i32 5 }, %struct.anon { i32 4, i32 6 }, %struct.anon { i32 5, i32 6 }, %struct.anon { i32 5, i32 6 }, %struct.anon { i32 5, i32 7 }, %struct.anon { i32 6, i32 7 }, %struct.anon { i32 6, i32 7 }], align 16
@ipow20 = external global [256 x double], align 16
@scalefac_band = external global %struct.scalefac_struct, align 4
@huf_tbl_noESC = internal constant [15 x i32] [i32 1, i32 2, i32 5, i32 7, i32 7, i32 10, i32 10, i32 13, i32 13, i32 13, i32 13, i32 13, i32 13, i32 13, i32 13], align 16
@ht = external global [34 x %struct.huffcodetab], align 16
@cb_esc_buf = internal global [288 x i32] zeroinitializer, align 16
@cb_esc_sign = internal global i32 0, align 4
@cb_esc_end = internal global i32* null, align 8
@scfsi_calc.scfsi_band = internal constant [5 x i32] [i32 0, i32 6, i32 11, i32 16, i32 21], align 16
@scfsi_calc.slen1_n = internal constant [16 x i32] [i32 0, i32 1, i32 1, i32 1, i32 8, i32 2, i32 2, i32 2, i32 4, i32 4, i32 4, i32 8, i32 8, i32 8, i32 16, i32 16], align 16
@scfsi_calc.slen2_n = internal constant [16 x i32] [i32 0, i32 2, i32 4, i32 8, i32 1, i32 2, i32 4, i32 8, i32 2, i32 4, i32 8, i32 2, i32 4, i32 8, i32 4, i32 8], align 16
@scfsi_calc.slen1_tab = internal constant [16 x i32] [i32 0, i32 0, i32 0, i32 0, i32 3, i32 1, i32 1, i32 1, i32 2, i32 2, i32 2, i32 3, i32 3, i32 3, i32 4, i32 4], align 16
@scfsi_calc.slen2_tab = internal constant [16 x i32] [i32 0, i32 1, i32 2, i32 3, i32 0, i32 1, i32 2, i32 3, i32 1, i32 2, i32 3, i32 1, i32 2, i32 3, i32 2, i32 3], align 16
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_count_bits = private constant [10 x i8] c"count_bits"
@__profn_tmp1.ll_choose_table_short = private constant [26 x i8] c"tmp1.ll:choose_table_short"
@__profn_tmp1.ll_count_bits_long = private constant [23 x i8] c"tmp1.ll:count_bits_long"
@__profn_best_huffman_divide = private constant [19 x i8] c"best_huffman_divide"
@__profn_tmp1.ll_choose_table = private constant [20 x i8] c"tmp1.ll:choose_table"
@__profn_best_scalefac_store = private constant [19 x i8] c"best_scalefac_store"
@__profn_tmp1.ll_scfsi_calc = private constant [18 x i8] c"tmp1.ll:scfsi_calc"
@__profn_tmp1.ll_ix_max = private constant [14 x i8] c"tmp1.ll:ix_max"
@__profn_tmp1.ll_count_bit_short_noESC = private constant [29 x i8] c"tmp1.ll:count_bit_short_noESC"
@__profn_tmp1.ll_count_bit_noESC2 = private constant [24 x i8] c"tmp1.ll:count_bit_noESC2"
@__profn_tmp1.ll_count_bit_short_ESC = private constant [27 x i8] c"tmp1.ll:count_bit_short_ESC"
@__profn_tmp1.ll_count_bit_noESC = private constant [23 x i8] c"tmp1.ll:count_bit_noESC"
@__profn_tmp1.ll_count_bit_ESC = private constant [21 x i8] c"tmp1.ll:count_bit_ESC"
@__profc_count_bits = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_count_bits = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 807402663209543275, i64 83909506236, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_count_bits, i32 0, i32 0), i8* bitcast (i32 (%struct.lame_global_flags*, i32*, double*, %struct.gr_info*)* @count_bits to i8*), i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_choose_table_short = private global [16 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_choose_table_short = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1411478205134258298, i64 209029283948, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table_short, i32 0, i32 0), i8* null, i8* null, i32 16, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_count_bits_long = private global [15 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_count_bits_long = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3668016596999132700, i64 235575961504, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_count_bits_long, i32 0, i32 0), i8* null, i8* null, i32 15, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_best_huffman_divide = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_best_huffman_divide = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4962881835926866436, i64 161096646150, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_best_huffman_divide, i32 0, i32 0), i8* bitcast (void (i32, i32, %struct.gr_info*, i32*)* @best_huffman_divide to i8*), i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_choose_table = private global [16 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_choose_table = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4722190849321582932, i64 209029283948, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table, i32 0, i32 0), i8* null, i8* null, i32 16, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_best_scalefac_store = private global [29 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_best_scalefac_store = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4078587777988175054, i64 438790425379, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i32 0, i32 0), i8* bitcast (void (%struct.lame_global_flags*, i32, i32, [2 x [576 x i32]]*, %struct.III_side_info_t*, [2 x %struct.III_scalefac_t]*)* @best_scalefac_store to i8*), i8* null, i32 29, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_scfsi_calc = private global [17 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_scfsi_calc = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1818309954350646754, i64 270749211602, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_scfsi_calc, i32 0, i32 0), i8* null, i8* null, i32 17, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_ix_max = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_ix_max = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 755443898050109369, i64 52477303308, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_ix_max, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_count_bit_short_noESC = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_count_bit_short_noESC = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -9049088901013973491, i64 76325306693, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_count_bit_short_noESC, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_count_bit_noESC2 = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_count_bit_noESC2 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8967348033782179219, i64 26545607443, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_count_bit_noESC2, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_count_bit_short_ESC = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_count_bit_short_ESC = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3060858359060390171, i64 115678768228, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_count_bit_short_ESC, i32 0, i32 0), i8* null, i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_count_bit_noESC = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_count_bit_noESC = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3639769011713143333, i64 52828224629, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_count_bit_noESC, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_count_bit_ESC = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_count_bit_ESC = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3959098267201347688, i64 92954172023, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_count_bit_ESC, i32 0, i32 0), i8* null, i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [129 x i8] c"\9D\02~x\DA}\8EA\0A\C30\0C\04\C9\87\0A\ED\B1\D7\D2\17\E4\01BV\E4\D8 [%RJ\9E\DF\90@r\A8\DB\EB\CC\EEJ\A4su\08\D9\AD\F3\F2\BA^D\EE\94T\8D\C11\08\83%\9D\FCTG\1AD\EB\D8\056\874\C7X\B0\C2\90\DFy\E0\E6\CC\1E4B\E1\88\04\E6:\9DA\A3h\19VG\07\CA\0B\14\5C\BE\CF\EE\EF@\D5g\FFh\D8\8D\DF~\D6\FE\94\1A|\A5\1F\B9\BDi\90", section "__llvm_prf_names"
@llvm.used = appending global [14 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_count_bits to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_choose_table_short to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_count_bits_long to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_best_huffman_divide to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_choose_table to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_best_scalefac_store to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_scfsi_calc to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_ix_max to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_count_bit_short_noESC to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_count_bit_noESC2 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_count_bit_short_ESC to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_count_bit_noESC to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_count_bit_ESC to i8*), i8* getelementptr inbounds ([129 x i8], [129 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define i32 @count_bits(%struct.lame_global_flags*, i32*, double*, %struct.gr_info*) #0 {
  %5 = alloca i32, align 4
  %6 = alloca %struct.lame_global_flags*, align 8
  %7 = alloca i32*, align 8
  %8 = alloca double*, align 8
  %9 = alloca %struct.gr_info*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca double, align 8
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %6, align 8
  store i32* %1, i32** %7, align 8
  store double* %2, double** %8, align 8
  store %struct.gr_info* %3, %struct.gr_info** %9, align 8
  store i32 0, i32* %10, align 4
  %13 = load %struct.gr_info*, %struct.gr_info** %9, align 8
  %14 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %13, i32 0, i32 3
  %15 = load i32, i32* %14, align 4
  %16 = zext i32 %15 to i64
  %17 = getelementptr inbounds [256 x double], [256 x double]* @ipow20, i64 0, i64 %16
  %18 = load double, double* %17, align 8
  %19 = fdiv double 8.206000e+03, %18
  store double %19, double* %12, align 8
  store i32 0, i32* %11, align 4
  br label %20

; <label>:20:                                     ; preds = %34, %4
  %21 = load i32, i32* %11, align 4
  %22 = icmp slt i32 %21, 576
  br i1 %22, label %23, label %38

; <label>:23:                                     ; preds = %20
  %24 = load double*, double** %8, align 8
  %25 = load i32, i32* %11, align 4
  %26 = sext i32 %25 to i64
  %27 = getelementptr inbounds double, double* %24, i64 %26
  %28 = load double, double* %27, align 8
  %29 = load double, double* %12, align 8
  %30 = fcmp ogt double %28, %29
  br i1 %30, label %31, label %33

; <label>:31:                                     ; preds = %23
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_count_bits, i64 0, i64 1)
  %32 = add i64 %pgocount, 1
  store i64 %32, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_count_bits, i64 0, i64 1)
  store i32 100000, i32* %5, align 4
  br label %97

; <label>:33:                                     ; preds = %23
  br label %34

; <label>:34:                                     ; preds = %33
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_count_bits, i64 0, i64 0)
  %35 = add i64 %pgocount1, 1
  store i64 %35, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_count_bits, i64 0, i64 0)
  %36 = load i32, i32* %11, align 4
  %37 = add nsw i32 %36, 1
  store i32 %37, i32* %11, align 4
  br label %20

; <label>:38:                                     ; preds = %20
  %39 = load %struct.lame_global_flags*, %struct.lame_global_flags** %6, align 8
  %40 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %39, i32 0, i32 60
  %41 = load i32, i32* %40, align 4
  %42 = icmp ne i32 %41, 0
  br i1 %42, label %43, label %47

; <label>:43:                                     ; preds = %38
  %44 = load double*, double** %8, align 8
  %45 = load i32*, i32** %7, align 8
  %46 = load %struct.gr_info*, %struct.gr_info** %9, align 8
  call void @quantize_xrpow(double* %44, i32* %45, %struct.gr_info* %46)
  br label %52

; <label>:47:                                     ; preds = %38
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_count_bits, i64 0, i64 4)
  %48 = add i64 %pgocount2, 1
  store i64 %48, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_count_bits, i64 0, i64 4)
  %49 = load double*, double** %8, align 8
  %50 = load i32*, i32** %7, align 8
  %51 = load %struct.gr_info*, %struct.gr_info** %9, align 8
  call void @quantize_xrpow_ISO(double* %49, i32* %50, %struct.gr_info* %51)
  br label %52

; <label>:52:                                     ; preds = %47, %43
  %53 = load %struct.gr_info*, %struct.gr_info** %9, align 8
  %54 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %53, i32 0, i32 6
  %55 = load i32, i32* %54, align 8
  %56 = icmp eq i32 %55, 2
  br i1 %56, label %57, label %76

; <label>:57:                                     ; preds = %52
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_count_bits, i64 0, i64 2)
  %58 = add i64 %pgocount3, 1
  store i64 %58, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_count_bits, i64 0, i64 2)
  %59 = load i32*, i32** %7, align 8
  %60 = load i32*, i32** %7, align 8
  %61 = getelementptr inbounds i32, i32* %60, i64 36
  %62 = call i32 @choose_table_short(i32* %59, i32* %61, i32* %10)
  %63 = load %struct.gr_info*, %struct.gr_info** %9, align 8
  %64 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %63, i32 0, i32 8
  %65 = getelementptr inbounds [3 x i32], [3 x i32]* %64, i64 0, i64 0
  store i32 %62, i32* %65, align 8
  %66 = load i32*, i32** %7, align 8
  %67 = getelementptr inbounds i32, i32* %66, i64 36
  %68 = load i32*, i32** %7, align 8
  %69 = getelementptr inbounds i32, i32* %68, i64 576
  %70 = call i32 @choose_table_short(i32* %67, i32* %69, i32* %10)
  %71 = load %struct.gr_info*, %struct.gr_info** %9, align 8
  %72 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %71, i32 0, i32 8
  %73 = getelementptr inbounds [3 x i32], [3 x i32]* %72, i64 0, i64 1
  store i32 %70, i32* %73, align 4
  %74 = load %struct.gr_info*, %struct.gr_info** %9, align 8
  %75 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %74, i32 0, i32 1
  store i32 288, i32* %75, align 4
  br label %95

; <label>:76:                                     ; preds = %52
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_count_bits, i64 0, i64 3)
  %77 = add i64 %pgocount4, 1
  store i64 %77, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_count_bits, i64 0, i64 3)
  %78 = load i32*, i32** %7, align 8
  %79 = load %struct.gr_info*, %struct.gr_info** %9, align 8
  %80 = call i32 @count_bits_long(i32* %78, %struct.gr_info* %79)
  store i32 %80, i32* %10, align 4
  %81 = load %struct.gr_info*, %struct.gr_info** %9, align 8
  %82 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %81, i32 0, i32 2
  %83 = load i32, i32* %82, align 8
  %84 = load %struct.gr_info*, %struct.gr_info** %9, align 8
  %85 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %84, i32 0, i32 1
  %86 = load i32, i32* %85, align 4
  %87 = sub i32 %83, %86
  %88 = udiv i32 %87, 4
  %89 = load %struct.gr_info*, %struct.gr_info** %9, align 8
  %90 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %89, i32 0, i32 2
  store i32 %88, i32* %90, align 8
  %91 = load %struct.gr_info*, %struct.gr_info** %9, align 8
  %92 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %91, i32 0, i32 1
  %93 = load i32, i32* %92, align 4
  %94 = udiv i32 %93, 2
  store i32 %94, i32* %92, align 4
  br label %95

; <label>:95:                                     ; preds = %76, %57
  %96 = load i32, i32* %10, align 4
  store i32 %96, i32* %5, align 4
  br label %97

; <label>:97:                                     ; preds = %95, %31
  %98 = load i32, i32* %5, align 4
  ret i32 %98
}

declare void @quantize_xrpow(double*, i32*, %struct.gr_info*) #1

declare void @quantize_xrpow_ISO(double*, i32*, %struct.gr_info*) #1

; Function Attrs: nounwind uwtable
define internal i32 @choose_table_short(i32*, i32*, i32*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32*, align 8
  %6 = alloca i32*, align 8
  %7 = alloca i32*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i32* %0, i32** %5, align 8
  store i32* %1, i32** %6, align 8
  store i32* %2, i32** %7, align 8
  %13 = load i32*, i32** %5, align 8
  %14 = load i32*, i32** %6, align 8
  %15 = call i32 @ix_max(i32* %13, i32* %14)
  store i32 %15, i32* %8, align 4
  %16 = load i32, i32* %8, align 4
  %17 = icmp sgt i32 %16, 8206
  br i1 %17, label %18, label %21

; <label>:18:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table_short, i64 0, i64 4)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table_short, i64 0, i64 4)
  %20 = load i32*, i32** %7, align 8
  store i32 100000, i32* %20, align 4
  store i32 -1, i32* %4, align 4
  br label %144

; <label>:21:                                     ; preds = %3
  %22 = load i32, i32* %8, align 4
  %23 = icmp sle i32 %22, 15
  br i1 %23, label %24, label %92

; <label>:24:                                     ; preds = %21
  %25 = load i32, i32* %8, align 4
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %29

; <label>:27:                                     ; preds = %24
  %pgocount2 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table_short, i64 0, i64 9)
  %28 = add i64 %pgocount2, 1
  store i64 %28, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table_short, i64 0, i64 9)
  store i32 0, i32* %4, align 4
  br label %144

; <label>:29:                                     ; preds = %24
  %30 = load i32, i32* %8, align 4
  %31 = sub nsw i32 %30, 1
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [15 x i32], [15 x i32]* @huf_tbl_noESC, i64 0, i64 %32
  %34 = load i32, i32* %33, align 4
  store i32 %34, i32* %9, align 4
  %35 = load i32*, i32** %5, align 8
  %36 = load i32*, i32** %6, align 8
  %37 = load i32, i32* %9, align 4
  %38 = call i32 @count_bit_short_noESC(i32* %35, i32* %36, i32 %37)
  store i32 %38, i32* %10, align 4
  %39 = load i32, i32* %9, align 4
  store i32 %39, i32* %11, align 4
  %40 = load i32, i32* %9, align 4
  switch i32 %40, label %85 [
    i32 7, label %._crit_edge
    i32 10, label %43
    i32 2, label %._crit_edge1
    i32 5, label %57
    i32 13, label %71
  ]

._crit_edge1:                                     ; preds = %29
  %pgocount3 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table_short, i64 0, i64 1)
  %41 = add i64 %pgocount3, 1
  store i64 %41, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table_short, i64 0, i64 1)
  br label %57

._crit_edge:                                      ; preds = %29
  %pgocount4 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table_short, i64 0, i64 0)
  %42 = add i64 %pgocount4, 1
  store i64 %42, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table_short, i64 0, i64 0)
  br label %43

; <label>:43:                                     ; preds = %._crit_edge, %29
  %44 = load i32, i32* %11, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, i32* %11, align 4
  %46 = load i32, i32* %11, align 4
  %47 = call i32 @count_bit_noESC2(i32 %46)
  store i32 %47, i32* %12, align 4
  %48 = load i32, i32* %10, align 4
  %49 = load i32, i32* %12, align 4
  %50 = icmp sgt i32 %48, %49
  br i1 %50, label %51, label %55

; <label>:51:                                     ; preds = %43
  %pgocount5 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table_short, i64 0, i64 12)
  %52 = add i64 %pgocount5, 1
  store i64 %52, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table_short, i64 0, i64 12)
  %53 = load i32, i32* %12, align 4
  store i32 %53, i32* %10, align 4
  %54 = load i32, i32* %11, align 4
  store i32 %54, i32* %9, align 4
  br label %55

; <label>:55:                                     ; preds = %51, %43
  %pgocount6 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table_short, i64 0, i64 10)
  %56 = add i64 %pgocount6, 1
  store i64 %56, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table_short, i64 0, i64 10)
  br label %57

; <label>:57:                                     ; preds = %._crit_edge1, %55, %29
  %58 = load i32, i32* %11, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, i32* %11, align 4
  %60 = load i32, i32* %11, align 4
  %61 = call i32 @count_bit_noESC2(i32 %60)
  store i32 %61, i32* %12, align 4
  %62 = load i32, i32* %10, align 4
  %63 = load i32, i32* %12, align 4
  %64 = icmp sgt i32 %62, %63
  br i1 %64, label %65, label %69

; <label>:65:                                     ; preds = %57
  %pgocount7 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table_short, i64 0, i64 11)
  %66 = add i64 %pgocount7, 1
  store i64 %66, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table_short, i64 0, i64 11)
  %67 = load i32, i32* %12, align 4
  store i32 %67, i32* %10, align 4
  %68 = load i32, i32* %11, align 4
  store i32 %68, i32* %9, align 4
  br label %69

; <label>:69:                                     ; preds = %65, %57
  %pgocount8 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table_short, i64 0, i64 8)
  %70 = add i64 %pgocount8, 1
  store i64 %70, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table_short, i64 0, i64 8)
  br label %87

; <label>:71:                                     ; preds = %29
  %72 = load i32, i32* %11, align 4
  %73 = add nsw i32 %72, 2
  store i32 %73, i32* %11, align 4
  %74 = load i32, i32* %11, align 4
  %75 = call i32 @count_bit_noESC2(i32 %74)
  store i32 %75, i32* %12, align 4
  %76 = load i32, i32* %10, align 4
  %77 = load i32, i32* %12, align 4
  %78 = icmp sgt i32 %76, %77
  br i1 %78, label %79, label %83

; <label>:79:                                     ; preds = %71
  %pgocount9 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table_short, i64 0, i64 15)
  %80 = add i64 %pgocount9, 1
  store i64 %80, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table_short, i64 0, i64 15)
  %81 = load i32, i32* %12, align 4
  store i32 %81, i32* %10, align 4
  %82 = load i32, i32* %11, align 4
  store i32 %82, i32* %9, align 4
  br label %83

; <label>:83:                                     ; preds = %79, %71
  %pgocount10 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table_short, i64 0, i64 14)
  %84 = add i64 %pgocount10, 1
  store i64 %84, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table_short, i64 0, i64 14)
  br label %87

; <label>:85:                                     ; preds = %29
  %pgocount11 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table_short, i64 0, i64 13)
  %86 = add i64 %pgocount11, 1
  store i64 %86, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table_short, i64 0, i64 13)
  br label %87

; <label>:87:                                     ; preds = %85, %83, %69
  %88 = load i32, i32* %10, align 4
  %89 = load i32*, i32** %7, align 8
  %90 = load i32, i32* %89, align 4
  %91 = add nsw i32 %90, %88
  store i32 %91, i32* %89, align 4
  br label %142

; <label>:92:                                     ; preds = %21
  %93 = load i32, i32* %8, align 4
  %94 = sub nsw i32 %93, 15
  store i32 %94, i32* %8, align 4
  store i32 24, i32* %11, align 4
  br label %95

; <label>:95:                                     ; preds = %110, %92
  %96 = load i32, i32* %11, align 4
  %97 = icmp slt i32 %96, 32
  br i1 %97, label %98, label %113

; <label>:98:                                     ; preds = %95
  %99 = load i32, i32* %11, align 4
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds [34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 %100
  %102 = getelementptr inbounds %struct.huffcodetab, %struct.huffcodetab* %101, i32 0, i32 1
  %103 = load i32, i32* %102, align 4
  %104 = load i32, i32* %8, align 4
  %105 = icmp sge i32 %103, %104
  br i1 %105, label %106, label %108

; <label>:106:                                    ; preds = %98
  %pgocount12 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table_short, i64 0, i64 6)
  %107 = add i64 %pgocount12, 1
  store i64 %107, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table_short, i64 0, i64 6)
  br label %113

; <label>:108:                                    ; preds = %98
  %pgocount13 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table_short, i64 0, i64 2)
  %109 = add i64 %pgocount13, 1
  store i64 %109, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table_short, i64 0, i64 2)
  br label %110

; <label>:110:                                    ; preds = %108
  %111 = load i32, i32* %11, align 4
  %112 = add nsw i32 %111, 1
  store i32 %112, i32* %11, align 4
  br label %95

; <label>:113:                                    ; preds = %106, %95
  %114 = load i32, i32* %11, align 4
  %115 = sub nsw i32 %114, 8
  store i32 %115, i32* %9, align 4
  br label %116

; <label>:116:                                    ; preds = %131, %113
  %117 = load i32, i32* %9, align 4
  %118 = icmp slt i32 %117, 24
  br i1 %118, label %119, label %134

; <label>:119:                                    ; preds = %116
  %120 = load i32, i32* %9, align 4
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds [34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 %121
  %123 = getelementptr inbounds %struct.huffcodetab, %struct.huffcodetab* %122, i32 0, i32 1
  %124 = load i32, i32* %123, align 4
  %125 = load i32, i32* %8, align 4
  %126 = icmp sge i32 %124, %125
  br i1 %126, label %127, label %129

; <label>:127:                                    ; preds = %119
  %pgocount14 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table_short, i64 0, i64 7)
  %128 = add i64 %pgocount14, 1
  store i64 %128, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table_short, i64 0, i64 7)
  br label %134

; <label>:129:                                    ; preds = %119
  %pgocount15 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table_short, i64 0, i64 3)
  %130 = add i64 %pgocount15, 1
  store i64 %130, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table_short, i64 0, i64 3)
  br label %131

; <label>:131:                                    ; preds = %129
  %132 = load i32, i32* %9, align 4
  %133 = add nsw i32 %132, 1
  store i32 %133, i32* %9, align 4
  br label %116

; <label>:134:                                    ; preds = %127, %116
  %pgocount16 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table_short, i64 0, i64 5)
  %135 = add i64 %pgocount16, 1
  store i64 %135, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table_short, i64 0, i64 5)
  %136 = load i32*, i32** %5, align 8
  %137 = load i32*, i32** %6, align 8
  %138 = load i32, i32* %9, align 4
  %139 = load i32, i32* %11, align 4
  %140 = load i32*, i32** %7, align 8
  %141 = call i32 @count_bit_short_ESC(i32* %136, i32* %137, i32 %138, i32 %139, i32* %140)
  store i32 %141, i32* %9, align 4
  br label %142

; <label>:142:                                    ; preds = %134, %87
  %143 = load i32, i32* %9, align 4
  store i32 %143, i32* %4, align 4
  br label %144

; <label>:144:                                    ; preds = %142, %27, %18
  %145 = load i32, i32* %4, align 4
  ret i32 %145
}

; Function Attrs: nounwind uwtable
define internal i32 @count_bits_long(i32*, %struct.gr_info*) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i32*, align 8
  %5 = alloca %struct.gr_info*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store i32* %0, i32** %4, align 8
  store %struct.gr_info* %1, %struct.gr_info** %5, align 8
  store i32 0, i32* %9, align 4
  store i32 576, i32* %6, align 4
  br label %14

; <label>:14:                                     ; preds = %36, %2
  %15 = load i32, i32* %6, align 4
  %16 = icmp sgt i32 %15, 1
  br i1 %16, label %17, label %39

; <label>:17:                                     ; preds = %14
  %18 = load i32*, i32** %4, align 8
  %19 = load i32, i32* %6, align 4
  %20 = sub nsw i32 %19, 1
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds i32, i32* %18, i64 %21
  %23 = load i32, i32* %22, align 4
  %24 = load i32*, i32** %4, align 8
  %25 = load i32, i32* %6, align 4
  %26 = sub nsw i32 %25, 2
  %27 = sext i32 %26 to i64
  %28 = getelementptr inbounds i32, i32* %24, i64 %27
  %29 = load i32, i32* %28, align 4
  %30 = or i32 %23, %29
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %32, label %34

; <label>:32:                                     ; preds = %17
  %pgocount = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_count_bits_long, i64 0, i64 8)
  %33 = add i64 %pgocount, 1
  store i64 %33, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_count_bits_long, i64 0, i64 8)
  br label %39

; <label>:34:                                     ; preds = %17
  %pgocount1 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_count_bits_long, i64 0, i64 0)
  %35 = add i64 %pgocount1, 1
  store i64 %35, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_count_bits_long, i64 0, i64 0)
  br label %36

; <label>:36:                                     ; preds = %34
  %37 = load i32, i32* %6, align 4
  %38 = sub nsw i32 %37, 2
  store i32 %38, i32* %6, align 4
  br label %14

; <label>:39:                                     ; preds = %32, %14
  %40 = load i32, i32* %6, align 4
  %41 = load %struct.gr_info*, %struct.gr_info** %5, align 8
  %42 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %41, i32 0, i32 2
  store i32 %40, i32* %42, align 8
  store i32 0, i32* %7, align 4
  br label %43

; <label>:43:                                     ; preds = %142, %39
  %44 = load i32, i32* %6, align 4
  %45 = icmp sgt i32 %44, 3
  br i1 %45, label %46, label %145

; <label>:46:                                     ; preds = %43
  %47 = load i32*, i32** %4, align 8
  %48 = load i32, i32* %6, align 4
  %49 = sub nsw i32 %48, 1
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i32, i32* %47, i64 %50
  %52 = load i32, i32* %51, align 4
  %53 = load i32*, i32** %4, align 8
  %54 = load i32, i32* %6, align 4
  %55 = sub nsw i32 %54, 2
  %56 = sext i32 %55 to i64
  %57 = getelementptr inbounds i32, i32* %53, i64 %56
  %58 = load i32, i32* %57, align 4
  %59 = or i32 %52, %58
  %60 = load i32*, i32** %4, align 8
  %61 = load i32, i32* %6, align 4
  %62 = sub nsw i32 %61, 3
  %63 = sext i32 %62 to i64
  %64 = getelementptr inbounds i32, i32* %60, i64 %63
  %65 = load i32, i32* %64, align 4
  %66 = or i32 %59, %65
  %67 = load i32*, i32** %4, align 8
  %68 = load i32, i32* %6, align 4
  %69 = sub nsw i32 %68, 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds i32, i32* %67, i64 %70
  %72 = load i32, i32* %71, align 4
  %73 = or i32 %66, %72
  %74 = icmp ugt i32 %73, 1
  br i1 %74, label %75, label %77

; <label>:75:                                     ; preds = %46
  %pgocount2 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_count_bits_long, i64 0, i64 9)
  %76 = add i64 %pgocount2, 1
  store i64 %76, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_count_bits_long, i64 0, i64 9)
  br label %145

; <label>:77:                                     ; preds = %46
  %pgocount3 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_count_bits_long, i64 0, i64 1)
  %78 = add i64 %pgocount3, 1
  store i64 %78, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_count_bits_long, i64 0, i64 1)
  %79 = load i32*, i32** %4, align 8
  %80 = load i32, i32* %6, align 4
  %81 = sub nsw i32 %80, 1
  %82 = sext i32 %81 to i64
  %83 = getelementptr inbounds i32, i32* %79, i64 %82
  %84 = load i32, i32* %83, align 4
  store i32 %84, i32* %11, align 4
  %85 = load i32, i32* %11, align 4
  store i32 %85, i32* %10, align 4
  %86 = load i32, i32* %11, align 4
  %87 = load i32, i32* %9, align 4
  %88 = add nsw i32 %87, %86
  store i32 %88, i32* %9, align 4
  %89 = load i32*, i32** %4, align 8
  %90 = load i32, i32* %6, align 4
  %91 = sub nsw i32 %90, 2
  %92 = sext i32 %91 to i64
  %93 = getelementptr inbounds i32, i32* %89, i64 %92
  %94 = load i32, i32* %93, align 4
  store i32 %94, i32* %11, align 4
  %95 = load i32, i32* %11, align 4
  %96 = icmp ne i32 %95, 0
  br i1 %96, label %97, label %103

; <label>:97:                                     ; preds = %77
  %pgocount4 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_count_bits_long, i64 0, i64 2)
  %98 = add i64 %pgocount4, 1
  store i64 %98, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_count_bits_long, i64 0, i64 2)
  %99 = load i32, i32* %10, align 4
  %100 = add nsw i32 %99, 2
  store i32 %100, i32* %10, align 4
  %101 = load i32, i32* %9, align 4
  %102 = add nsw i32 %101, 1
  store i32 %102, i32* %9, align 4
  br label %103

; <label>:103:                                    ; preds = %97, %77
  %104 = load i32*, i32** %4, align 8
  %105 = load i32, i32* %6, align 4
  %106 = sub nsw i32 %105, 3
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds i32, i32* %104, i64 %107
  %109 = load i32, i32* %108, align 4
  store i32 %109, i32* %11, align 4
  %110 = load i32, i32* %11, align 4
  %111 = icmp ne i32 %110, 0
  br i1 %111, label %112, label %118

; <label>:112:                                    ; preds = %103
  %pgocount5 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_count_bits_long, i64 0, i64 3)
  %113 = add i64 %pgocount5, 1
  store i64 %113, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_count_bits_long, i64 0, i64 3)
  %114 = load i32, i32* %10, align 4
  %115 = add nsw i32 %114, 4
  store i32 %115, i32* %10, align 4
  %116 = load i32, i32* %9, align 4
  %117 = add nsw i32 %116, 1
  store i32 %117, i32* %9, align 4
  br label %118

; <label>:118:                                    ; preds = %112, %103
  %119 = load i32*, i32** %4, align 8
  %120 = load i32, i32* %6, align 4
  %121 = sub nsw i32 %120, 4
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds i32, i32* %119, i64 %122
  %124 = load i32, i32* %123, align 4
  store i32 %124, i32* %11, align 4
  %125 = load i32, i32* %11, align 4
  %126 = icmp ne i32 %125, 0
  br i1 %126, label %127, label %133

; <label>:127:                                    ; preds = %118
  %pgocount6 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_count_bits_long, i64 0, i64 4)
  %128 = add i64 %pgocount6, 1
  store i64 %128, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_count_bits_long, i64 0, i64 4)
  %129 = load i32, i32* %10, align 4
  %130 = add nsw i32 %129, 8
  store i32 %130, i32* %10, align 4
  %131 = load i32, i32* %9, align 4
  %132 = add nsw i32 %131, 1
  store i32 %132, i32* %9, align 4
  br label %133

; <label>:133:                                    ; preds = %127, %118
  %134 = load i8*, i8** getelementptr inbounds ([34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 32, i32 3), align 16
  %135 = load i32, i32* %10, align 4
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds i8, i8* %134, i64 %136
  %138 = load i8, i8* %137, align 1
  %139 = zext i8 %138 to i32
  %140 = load i32, i32* %7, align 4
  %141 = add nsw i32 %140, %139
  store i32 %141, i32* %7, align 4
  br label %142

; <label>:142:                                    ; preds = %133
  %143 = load i32, i32* %6, align 4
  %144 = sub nsw i32 %143, 4
  store i32 %144, i32* %6, align 4
  br label %43

; <label>:145:                                    ; preds = %75, %43
  %146 = load %struct.gr_info*, %struct.gr_info** %5, align 8
  %147 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %146, i32 0, i32 2
  %148 = load i32, i32* %147, align 8
  %149 = load i32, i32* %6, align 4
  %150 = sub i32 %148, %149
  store i32 %150, i32* %8, align 4
  %151 = load i32, i32* %7, align 4
  %152 = load i32, i32* %8, align 4
  %153 = icmp slt i32 %151, %152
  br i1 %153, label %154, label %160

; <label>:154:                                    ; preds = %145
  %155 = load i32, i32* %7, align 4
  %156 = load i32, i32* %9, align 4
  %157 = add nsw i32 %156, %155
  store i32 %157, i32* %9, align 4
  %158 = load %struct.gr_info*, %struct.gr_info** %5, align 8
  %159 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %158, i32 0, i32 14
  store i32 0, i32* %159, align 8
  br label %167

; <label>:160:                                    ; preds = %145
  %pgocount7 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_count_bits_long, i64 0, i64 10)
  %161 = add i64 %pgocount7, 1
  store i64 %161, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_count_bits_long, i64 0, i64 10)
  %162 = load i32, i32* %8, align 4
  %163 = load i32, i32* %9, align 4
  %164 = add nsw i32 %163, %162
  store i32 %164, i32* %9, align 4
  %165 = load %struct.gr_info*, %struct.gr_info** %5, align 8
  %166 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %165, i32 0, i32 14
  store i32 1, i32* %166, align 8
  br label %167

; <label>:167:                                    ; preds = %160, %154
  %168 = load i32, i32* %9, align 4
  %169 = load %struct.gr_info*, %struct.gr_info** %5, align 8
  %170 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %169, i32 0, i32 18
  store i32 %168, i32* %170, align 8
  %171 = load i32, i32* %6, align 4
  %172 = load %struct.gr_info*, %struct.gr_info** %5, align 8
  %173 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %172, i32 0, i32 1
  store i32 %171, i32* %173, align 4
  %174 = load i32, i32* %6, align 4
  %175 = icmp eq i32 %174, 0
  br i1 %175, label %176, label %179

; <label>:176:                                    ; preds = %167
  %pgocount8 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_count_bits_long, i64 0, i64 11)
  %177 = add i64 %pgocount8, 1
  store i64 %177, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_count_bits_long, i64 0, i64 11)
  %178 = load i32, i32* %9, align 4
  store i32 %178, i32* %3, align 4
  br label %309

; <label>:179:                                    ; preds = %167
  %180 = load %struct.gr_info*, %struct.gr_info** %5, align 8
  %181 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %180, i32 0, i32 6
  %182 = load i32, i32* %181, align 8
  %183 = icmp eq i32 %182, 0
  br i1 %183, label %184, label %271

; <label>:184:                                    ; preds = %179
  store i32 0, i32* %13, align 4
  br label %185

; <label>:185:                                    ; preds = %193, %184
  %186 = load i32, i32* %13, align 4
  %187 = add nsw i32 %186, 1
  store i32 %187, i32* %13, align 4
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds [23 x i32], [23 x i32]* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i32 0, i32 0), i64 0, i64 %188
  %190 = load i32, i32* %189, align 4
  %191 = load i32, i32* %6, align 4
  %192 = icmp slt i32 %190, %191
  br i1 %192, label %193, label %195

; <label>:193:                                    ; preds = %185
  %pgocount9 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_count_bits_long, i64 0, i64 5)
  %194 = add i64 %pgocount9, 1
  store i64 %194, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_count_bits_long, i64 0, i64 5)
  br label %185

; <label>:195:                                    ; preds = %185
  %196 = load i32, i32* %13, align 4
  %197 = sext i32 %196 to i64
  %198 = getelementptr inbounds [23 x %struct.anon], [23 x %struct.anon]* @subdv_table, i64 0, i64 %197
  %199 = getelementptr inbounds %struct.anon, %struct.anon* %198, i32 0, i32 0
  %200 = load i32, i32* %199, align 8
  store i32 %200, i32* %12, align 4
  br label %201

; <label>:201:                                    ; preds = %209, %195
  %202 = load i32, i32* %12, align 4
  %203 = add nsw i32 %202, 1
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds [23 x i32], [23 x i32]* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i32 0, i32 0), i64 0, i64 %204
  %206 = load i32, i32* %205, align 4
  %207 = load i32, i32* %6, align 4
  %208 = icmp sgt i32 %206, %207
  br i1 %208, label %209, label %213

; <label>:209:                                    ; preds = %201
  %pgocount10 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_count_bits_long, i64 0, i64 6)
  %210 = add i64 %pgocount10, 1
  store i64 %210, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_count_bits_long, i64 0, i64 6)
  %211 = load i32, i32* %12, align 4
  %212 = add nsw i32 %211, -1
  store i32 %212, i32* %12, align 4
  br label %201

; <label>:213:                                    ; preds = %201
  %214 = load i32, i32* %12, align 4
  %215 = load %struct.gr_info*, %struct.gr_info** %5, align 8
  %216 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %215, i32 0, i32 10
  store i32 %214, i32* %216, align 8
  %217 = load i32, i32* %13, align 4
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds [23 x %struct.anon], [23 x %struct.anon]* @subdv_table, i64 0, i64 %218
  %220 = getelementptr inbounds %struct.anon, %struct.anon* %219, i32 0, i32 1
  %221 = load i32, i32* %220, align 4
  store i32 %221, i32* %12, align 4
  br label %222

; <label>:222:                                    ; preds = %234, %213
  %223 = load i32, i32* %12, align 4
  %224 = load %struct.gr_info*, %struct.gr_info** %5, align 8
  %225 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %224, i32 0, i32 10
  %226 = load i32, i32* %225, align 8
  %227 = add i32 %223, %226
  %228 = add i32 %227, 2
  %229 = zext i32 %228 to i64
  %230 = getelementptr inbounds [23 x i32], [23 x i32]* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i32 0, i32 0), i64 0, i64 %229
  %231 = load i32, i32* %230, align 4
  %232 = load i32, i32* %6, align 4
  %233 = icmp sgt i32 %231, %232
  br i1 %233, label %234, label %238

; <label>:234:                                    ; preds = %222
  %pgocount11 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_count_bits_long, i64 0, i64 7)
  %235 = add i64 %pgocount11, 1
  store i64 %235, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_count_bits_long, i64 0, i64 7)
  %236 = load i32, i32* %12, align 4
  %237 = add nsw i32 %236, -1
  store i32 %237, i32* %12, align 4
  br label %222

; <label>:238:                                    ; preds = %222
  %pgocount12 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_count_bits_long, i64 0, i64 13)
  %239 = add i64 %pgocount12, 1
  store i64 %239, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_count_bits_long, i64 0, i64 13)
  %240 = load i32, i32* %12, align 4
  %241 = load %struct.gr_info*, %struct.gr_info** %5, align 8
  %242 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %241, i32 0, i32 11
  store i32 %240, i32* %242, align 4
  %243 = load %struct.gr_info*, %struct.gr_info** %5, align 8
  %244 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %243, i32 0, i32 10
  %245 = load i32, i32* %244, align 8
  %246 = add i32 %245, 1
  %247 = zext i32 %246 to i64
  %248 = getelementptr inbounds [23 x i32], [23 x i32]* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i32 0, i32 0), i64 0, i64 %247
  %249 = load i32, i32* %248, align 4
  store i32 %249, i32* %7, align 4
  %250 = load i32, i32* %12, align 4
  %251 = load %struct.gr_info*, %struct.gr_info** %5, align 8
  %252 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %251, i32 0, i32 10
  %253 = load i32, i32* %252, align 8
  %254 = add i32 %250, %253
  %255 = add i32 %254, 2
  %256 = zext i32 %255 to i64
  %257 = getelementptr inbounds [23 x i32], [23 x i32]* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i32 0, i32 0), i64 0, i64 %256
  %258 = load i32, i32* %257, align 4
  store i32 %258, i32* %8, align 4
  %259 = load i32*, i32** %4, align 8
  %260 = load i32, i32* %8, align 4
  %261 = sext i32 %260 to i64
  %262 = getelementptr inbounds i32, i32* %259, i64 %261
  %263 = load i32*, i32** %4, align 8
  %264 = load i32, i32* %6, align 4
  %265 = sext i32 %264 to i64
  %266 = getelementptr inbounds i32, i32* %263, i64 %265
  %267 = call i32 @choose_table(i32* %262, i32* %266, i32* %9)
  %268 = load %struct.gr_info*, %struct.gr_info** %5, align 8
  %269 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %268, i32 0, i32 8
  %270 = getelementptr inbounds [3 x i32], [3 x i32]* %269, i64 0, i64 2
  store i32 %267, i32* %270, align 8
  br label %286

; <label>:271:                                    ; preds = %179
  %pgocount13 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_count_bits_long, i64 0, i64 12)
  %272 = add i64 %pgocount13, 1
  store i64 %272, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_count_bits_long, i64 0, i64 12)
  %273 = load %struct.gr_info*, %struct.gr_info** %5, align 8
  %274 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %273, i32 0, i32 10
  store i32 7, i32* %274, align 8
  %275 = load %struct.gr_info*, %struct.gr_info** %5, align 8
  %276 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %275, i32 0, i32 11
  store i32 13, i32* %276, align 4
  %277 = load i32, i32* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i32 0, i32 0, i64 8), align 4
  store i32 %277, i32* %7, align 4
  %278 = load i32, i32* %6, align 4
  store i32 %278, i32* %8, align 4
  %279 = load i32, i32* %7, align 4
  %280 = load i32, i32* %8, align 4
  %281 = icmp sgt i32 %279, %280
  br i1 %281, label %282, label %285

; <label>:282:                                    ; preds = %271
  %pgocount14 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_count_bits_long, i64 0, i64 14)
  %283 = add i64 %pgocount14, 1
  store i64 %283, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_tmp1.ll_count_bits_long, i64 0, i64 14)
  %284 = load i32, i32* %8, align 4
  store i32 %284, i32* %7, align 4
  br label %285

; <label>:285:                                    ; preds = %282, %271
  br label %286

; <label>:286:                                    ; preds = %285, %238
  %287 = load i32*, i32** %4, align 8
  %288 = load i32*, i32** %4, align 8
  %289 = load i32, i32* %7, align 4
  %290 = sext i32 %289 to i64
  %291 = getelementptr inbounds i32, i32* %288, i64 %290
  %292 = call i32 @choose_table(i32* %287, i32* %291, i32* %9)
  %293 = load %struct.gr_info*, %struct.gr_info** %5, align 8
  %294 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %293, i32 0, i32 8
  %295 = getelementptr inbounds [3 x i32], [3 x i32]* %294, i64 0, i64 0
  store i32 %292, i32* %295, align 8
  %296 = load i32*, i32** %4, align 8
  %297 = load i32, i32* %7, align 4
  %298 = sext i32 %297 to i64
  %299 = getelementptr inbounds i32, i32* %296, i64 %298
  %300 = load i32*, i32** %4, align 8
  %301 = load i32, i32* %8, align 4
  %302 = sext i32 %301 to i64
  %303 = getelementptr inbounds i32, i32* %300, i64 %302
  %304 = call i32 @choose_table(i32* %299, i32* %303, i32* %9)
  %305 = load %struct.gr_info*, %struct.gr_info** %5, align 8
  %306 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %305, i32 0, i32 8
  %307 = getelementptr inbounds [3 x i32], [3 x i32]* %306, i64 0, i64 1
  store i32 %304, i32* %307, align 4
  %308 = load i32, i32* %9, align 4
  store i32 %308, i32* %3, align 4
  br label %309

; <label>:309:                                    ; preds = %286, %176
  %310 = load i32, i32* %3, align 4
  ret i32 %310
}

; Function Attrs: nounwind uwtable
define void @best_huffman_divide(i32, i32, %struct.gr_info*, i32*) #0 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca %struct.gr_info*, align 8
  %8 = alloca i32*, align 8
  %9 = alloca i32*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca [25 x i32], align 16
  %17 = alloca [25 x i32], align 16
  %18 = alloca %struct.gr_info, align 8
  store i32 %0, i32* %5, align 4
  store i32 %1, i32* %6, align 4
  store %struct.gr_info* %2, %struct.gr_info** %7, align 8
  store i32* %3, i32** %8, align 8
  %19 = bitcast %struct.gr_info* %18 to i8*
  %20 = load %struct.gr_info*, %struct.gr_info** %7, align 8
  %21 = bitcast %struct.gr_info* %20 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %19, i8* %21, i64 120, i32 8, i1 false)
  %22 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %18, i32 0, i32 1
  %23 = load i32, i32* %22, align 4
  %24 = mul i32 %23, 2
  store i32 %24, i32* %14, align 4
  %25 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %18, i32 0, i32 0
  store i32* %25, i32** %9, align 8
  store i32 2, i32* %10, align 4
  br label %26

; <label>:26:                                     ; preds = %64, %4
  %27 = load i32, i32* %10, align 4
  %28 = icmp slt i32 %27, 23
  br i1 %28, label %29, label %67

; <label>:29:                                     ; preds = %26
  %30 = load i32, i32* %10, align 4
  %31 = sext i32 %30 to i64
  %32 = getelementptr inbounds [23 x i32], [23 x i32]* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i32 0, i32 0), i64 0, i64 %31
  %33 = load i32, i32* %32, align 4
  store i32 %33, i32* %13, align 4
  %34 = load i32, i32* %13, align 4
  %35 = load i32, i32* %14, align 4
  %36 = icmp sgt i32 %34, %35
  br i1 %36, label %37, label %39

; <label>:37:                                     ; preds = %29
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_best_huffman_divide, i64 0, i64 7)
  %38 = add i64 %pgocount, 1
  store i64 %38, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_best_huffman_divide, i64 0, i64 7)
  br label %67

; <label>:39:                                     ; preds = %29
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_best_huffman_divide, i64 0, i64 4)
  %40 = add i64 %pgocount1, 1
  store i64 %40, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_best_huffman_divide, i64 0, i64 4)
  %41 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %18, i32 0, i32 18
  %42 = load i32, i32* %41, align 8
  %43 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %18, i32 0, i32 15
  %44 = load i32, i32* %43, align 4
  %45 = add i32 %42, %44
  %46 = load i32, i32* %10, align 4
  %47 = sext i32 %46 to i64
  %48 = getelementptr inbounds [25 x i32], [25 x i32]* %16, i64 0, i64 %47
  store i32 %45, i32* %48, align 4
  %49 = load i32*, i32** %8, align 8
  %50 = load i32, i32* %13, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds i32, i32* %49, i64 %51
  %53 = load i32*, i32** %8, align 8
  %54 = load i32, i32* %14, align 4
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds i32, i32* %53, i64 %55
  %57 = load i32, i32* %10, align 4
  %58 = sext i32 %57 to i64
  %59 = getelementptr inbounds [25 x i32], [25 x i32]* %16, i64 0, i64 %58
  %60 = call i32 @choose_table(i32* %52, i32* %56, i32* %59)
  %61 = load i32, i32* %10, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds [25 x i32], [25 x i32]* %17, i64 0, i64 %62
  store i32 %60, i32* %63, align 4
  br label %64

; <label>:64:                                     ; preds = %39
  %65 = load i32, i32* %10, align 4
  %66 = add nsw i32 %65, 1
  store i32 %66, i32* %10, align 4
  br label %26

; <label>:67:                                     ; preds = %37, %26
  br label %68

; <label>:68:                                     ; preds = %75, %67
  %69 = load i32, i32* %10, align 4
  %70 = icmp sle i32 %69, 24
  br i1 %70, label %71, label %79

; <label>:71:                                     ; preds = %68
  %72 = load i32, i32* %10, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [25 x i32], [25 x i32]* %16, i64 0, i64 %73
  store i32 100000, i32* %74, align 4
  br label %75

; <label>:75:                                     ; preds = %71
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_best_huffman_divide, i64 0, i64 3)
  %76 = add i64 %pgocount2, 1
  store i64 %76, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_best_huffman_divide, i64 0, i64 3)
  %77 = load i32, i32* %10, align 4
  %78 = add nsw i32 %77, 1
  store i32 %78, i32* %10, align 4
  br label %68

; <label>:79:                                     ; preds = %68
  store i32 0, i32* %10, align 4
  br label %80

; <label>:80:                                     ; preds = %183, %79
  %81 = load i32, i32* %10, align 4
  %82 = icmp slt i32 %81, 16
  br i1 %82, label %83, label %187

; <label>:83:                                     ; preds = %80
  %84 = load i32, i32* %10, align 4
  %85 = add nsw i32 %84, 1
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds [23 x i32], [23 x i32]* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i32 0, i32 0), i64 0, i64 %86
  %88 = load i32, i32* %87, align 4
  store i32 %88, i32* %12, align 4
  %89 = load i32, i32* %12, align 4
  %90 = load i32, i32* %14, align 4
  %91 = icmp sgt i32 %89, %90
  br i1 %91, label %92, label %94

; <label>:92:                                     ; preds = %83
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_best_huffman_divide, i64 0, i64 8)
  %93 = add i64 %pgocount3, 1
  store i64 %93, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_best_huffman_divide, i64 0, i64 8)
  br label %187

; <label>:94:                                     ; preds = %83
  %95 = load i32, i32* %10, align 4
  %96 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %18, i32 0, i32 10
  store i32 %95, i32* %96, align 8
  store i32 0, i32* %15, align 4
  %97 = load i32*, i32** %8, align 8
  %98 = load i32*, i32** %8, align 8
  %99 = load i32, i32* %12, align 4
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds i32, i32* %98, i64 %100
  %102 = call i32 @choose_table(i32* %97, i32* %101, i32* %15)
  %103 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %18, i32 0, i32 8
  %104 = getelementptr inbounds [3 x i32], [3 x i32]* %103, i64 0, i64 0
  store i32 %102, i32* %104, align 8
  %105 = load %struct.gr_info*, %struct.gr_info** %7, align 8
  %106 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %105, i32 0, i32 0
  %107 = load i32, i32* %106, align 8
  %108 = load i32, i32* %15, align 4
  %109 = icmp slt i32 %107, %108
  br i1 %109, label %110, label %112

; <label>:110:                                    ; preds = %94
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_best_huffman_divide, i64 0, i64 9)
  %111 = add i64 %pgocount4, 1
  store i64 %111, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_best_huffman_divide, i64 0, i64 9)
  br label %187

; <label>:112:                                    ; preds = %94
  store i32 0, i32* %11, align 4
  br label %113

; <label>:113:                                    ; preds = %179, %112
  %114 = load i32, i32* %11, align 4
  %115 = icmp slt i32 %114, 8
  br i1 %115, label %116, label %182

; <label>:116:                                    ; preds = %113
  %117 = load i32, i32* %15, align 4
  %118 = load i32, i32* %10, align 4
  %119 = load i32, i32* %11, align 4
  %120 = add nsw i32 %118, %119
  %121 = add nsw i32 %120, 2
  %122 = sext i32 %121 to i64
  %123 = getelementptr inbounds [25 x i32], [25 x i32]* %16, i64 0, i64 %122
  %124 = load i32, i32* %123, align 4
  %125 = add nsw i32 %117, %124
  %126 = load i32*, i32** %9, align 8
  store i32 %125, i32* %126, align 4
  %127 = load %struct.gr_info*, %struct.gr_info** %7, align 8
  %128 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %127, i32 0, i32 0
  %129 = load i32, i32* %128, align 8
  %130 = load i32*, i32** %9, align 8
  %131 = load i32, i32* %130, align 4
  %132 = icmp slt i32 %129, %131
  br i1 %132, label %133, label %135

; <label>:133:                                    ; preds = %116
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_best_huffman_divide, i64 0, i64 0)
  %134 = add i64 %pgocount5, 1
  store i64 %134, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_best_huffman_divide, i64 0, i64 0)
  br label %179

; <label>:135:                                    ; preds = %116
  %136 = load i32, i32* %10, align 4
  %137 = load i32, i32* %11, align 4
  %138 = add nsw i32 %136, %137
  %139 = add nsw i32 %138, 2
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds [23 x i32], [23 x i32]* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i32 0, i32 0), i64 0, i64 %140
  %142 = load i32, i32* %141, align 4
  store i32 %142, i32* %13, align 4
  %143 = load i32*, i32** %8, align 8
  %144 = load i32, i32* %12, align 4
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds i32, i32* %143, i64 %145
  %147 = load i32*, i32** %8, align 8
  %148 = load i32, i32* %13, align 4
  %149 = sext i32 %148 to i64
  %150 = getelementptr inbounds i32, i32* %147, i64 %149
  %151 = load i32*, i32** %9, align 8
  %152 = call i32 @choose_table(i32* %146, i32* %150, i32* %151)
  %153 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %18, i32 0, i32 8
  %154 = getelementptr inbounds [3 x i32], [3 x i32]* %153, i64 0, i64 1
  store i32 %152, i32* %154, align 4
  %155 = load %struct.gr_info*, %struct.gr_info** %7, align 8
  %156 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %155, i32 0, i32 0
  %157 = load i32, i32* %156, align 8
  %158 = load i32*, i32** %9, align 8
  %159 = load i32, i32* %158, align 4
  %160 = icmp slt i32 %157, %159
  br i1 %160, label %161, label %163

; <label>:161:                                    ; preds = %135
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_best_huffman_divide, i64 0, i64 1)
  %162 = add i64 %pgocount6, 1
  store i64 %162, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_best_huffman_divide, i64 0, i64 1)
  br label %179

; <label>:163:                                    ; preds = %135
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_best_huffman_divide, i64 0, i64 2)
  %164 = add i64 %pgocount7, 1
  store i64 %164, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_best_huffman_divide, i64 0, i64 2)
  %165 = load i32, i32* %11, align 4
  %166 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %18, i32 0, i32 11
  store i32 %165, i32* %166, align 4
  %167 = load i32, i32* %10, align 4
  %168 = load i32, i32* %11, align 4
  %169 = add nsw i32 %167, %168
  %170 = add nsw i32 %169, 2
  %171 = sext i32 %170 to i64
  %172 = getelementptr inbounds [25 x i32], [25 x i32]* %17, i64 0, i64 %171
  %173 = load i32, i32* %172, align 4
  %174 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %18, i32 0, i32 8
  %175 = getelementptr inbounds [3 x i32], [3 x i32]* %174, i64 0, i64 2
  store i32 %173, i32* %175, align 8
  %176 = load %struct.gr_info*, %struct.gr_info** %7, align 8
  %177 = bitcast %struct.gr_info* %176 to i8*
  %178 = bitcast %struct.gr_info* %18 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %177, i8* %178, i64 120, i32 8, i1 false)
  br label %179

; <label>:179:                                    ; preds = %163, %161, %133
  %180 = load i32, i32* %11, align 4
  %181 = add nsw i32 %180, 1
  store i32 %181, i32* %11, align 4
  br label %113

; <label>:182:                                    ; preds = %113
  br label %183

; <label>:183:                                    ; preds = %182
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_best_huffman_divide, i64 0, i64 5)
  %184 = add i64 %pgocount8, 1
  store i64 %184, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_best_huffman_divide, i64 0, i64 5)
  %185 = load i32, i32* %10, align 4
  %186 = add nsw i32 %185, 1
  store i32 %186, i32* %10, align 4
  br label %80

; <label>:187:                                    ; preds = %110, %92, %80
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_best_huffman_divide, i64 0, i64 6)
  %188 = add i64 %pgocount9, 1
  store i64 %188, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_best_huffman_divide, i64 0, i64 6)
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind uwtable
define internal i32 @choose_table(i32*, i32*, i32*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca i32*, align 8
  %6 = alloca i32*, align 8
  %7 = alloca i32*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i32* %0, i32** %5, align 8
  store i32* %1, i32** %6, align 8
  store i32* %2, i32** %7, align 8
  %13 = load i32*, i32** %5, align 8
  %14 = load i32*, i32** %6, align 8
  %15 = call i32 @ix_max(i32* %13, i32* %14)
  store i32 %15, i32* %8, align 4
  %16 = load i32, i32* %8, align 4
  %17 = icmp sgt i32 %16, 8206
  br i1 %17, label %18, label %21

; <label>:18:                                     ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table, i64 0, i64 4)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table, i64 0, i64 4)
  %20 = load i32*, i32** %7, align 8
  store i32 100000, i32* %20, align 4
  store i32 -1, i32* %4, align 4
  br label %144

; <label>:21:                                     ; preds = %3
  %22 = load i32, i32* %8, align 4
  %23 = icmp sle i32 %22, 15
  br i1 %23, label %24, label %92

; <label>:24:                                     ; preds = %21
  %25 = load i32, i32* %8, align 4
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %29

; <label>:27:                                     ; preds = %24
  %pgocount2 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table, i64 0, i64 9)
  %28 = add i64 %pgocount2, 1
  store i64 %28, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table, i64 0, i64 9)
  store i32 0, i32* %4, align 4
  br label %144

; <label>:29:                                     ; preds = %24
  %30 = load i32, i32* %8, align 4
  %31 = sub nsw i32 %30, 1
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [15 x i32], [15 x i32]* @huf_tbl_noESC, i64 0, i64 %32
  %34 = load i32, i32* %33, align 4
  store i32 %34, i32* %9, align 4
  %35 = load i32*, i32** %5, align 8
  %36 = load i32*, i32** %6, align 8
  %37 = load i32, i32* %9, align 4
  %38 = call i32 @count_bit_noESC(i32* %35, i32* %36, i32 %37)
  store i32 %38, i32* %10, align 4
  %39 = load i32, i32* %9, align 4
  store i32 %39, i32* %11, align 4
  %40 = load i32, i32* %9, align 4
  switch i32 %40, label %85 [
    i32 7, label %._crit_edge
    i32 10, label %43
    i32 2, label %._crit_edge1
    i32 5, label %57
    i32 13, label %71
  ]

._crit_edge1:                                     ; preds = %29
  %pgocount3 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table, i64 0, i64 1)
  %41 = add i64 %pgocount3, 1
  store i64 %41, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table, i64 0, i64 1)
  br label %57

._crit_edge:                                      ; preds = %29
  %pgocount4 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table, i64 0, i64 0)
  %42 = add i64 %pgocount4, 1
  store i64 %42, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table, i64 0, i64 0)
  br label %43

; <label>:43:                                     ; preds = %._crit_edge, %29
  %44 = load i32, i32* %11, align 4
  %45 = add nsw i32 %44, 1
  store i32 %45, i32* %11, align 4
  %46 = load i32, i32* %11, align 4
  %47 = call i32 @count_bit_noESC2(i32 %46)
  store i32 %47, i32* %12, align 4
  %48 = load i32, i32* %10, align 4
  %49 = load i32, i32* %12, align 4
  %50 = icmp sgt i32 %48, %49
  br i1 %50, label %51, label %55

; <label>:51:                                     ; preds = %43
  %pgocount5 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table, i64 0, i64 12)
  %52 = add i64 %pgocount5, 1
  store i64 %52, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table, i64 0, i64 12)
  %53 = load i32, i32* %12, align 4
  store i32 %53, i32* %10, align 4
  %54 = load i32, i32* %11, align 4
  store i32 %54, i32* %9, align 4
  br label %55

; <label>:55:                                     ; preds = %51, %43
  %pgocount6 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table, i64 0, i64 10)
  %56 = add i64 %pgocount6, 1
  store i64 %56, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table, i64 0, i64 10)
  br label %57

; <label>:57:                                     ; preds = %._crit_edge1, %55, %29
  %58 = load i32, i32* %11, align 4
  %59 = add nsw i32 %58, 1
  store i32 %59, i32* %11, align 4
  %60 = load i32, i32* %11, align 4
  %61 = call i32 @count_bit_noESC2(i32 %60)
  store i32 %61, i32* %12, align 4
  %62 = load i32, i32* %10, align 4
  %63 = load i32, i32* %12, align 4
  %64 = icmp sgt i32 %62, %63
  br i1 %64, label %65, label %69

; <label>:65:                                     ; preds = %57
  %pgocount7 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table, i64 0, i64 11)
  %66 = add i64 %pgocount7, 1
  store i64 %66, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table, i64 0, i64 11)
  %67 = load i32, i32* %12, align 4
  store i32 %67, i32* %10, align 4
  %68 = load i32, i32* %11, align 4
  store i32 %68, i32* %9, align 4
  br label %69

; <label>:69:                                     ; preds = %65, %57
  %pgocount8 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table, i64 0, i64 8)
  %70 = add i64 %pgocount8, 1
  store i64 %70, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table, i64 0, i64 8)
  br label %87

; <label>:71:                                     ; preds = %29
  %72 = load i32, i32* %11, align 4
  %73 = add nsw i32 %72, 2
  store i32 %73, i32* %11, align 4
  %74 = load i32, i32* %11, align 4
  %75 = call i32 @count_bit_noESC2(i32 %74)
  store i32 %75, i32* %12, align 4
  %76 = load i32, i32* %10, align 4
  %77 = load i32, i32* %12, align 4
  %78 = icmp sgt i32 %76, %77
  br i1 %78, label %79, label %83

; <label>:79:                                     ; preds = %71
  %pgocount9 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table, i64 0, i64 15)
  %80 = add i64 %pgocount9, 1
  store i64 %80, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table, i64 0, i64 15)
  %81 = load i32, i32* %12, align 4
  store i32 %81, i32* %10, align 4
  %82 = load i32, i32* %11, align 4
  store i32 %82, i32* %9, align 4
  br label %83

; <label>:83:                                     ; preds = %79, %71
  %pgocount10 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table, i64 0, i64 14)
  %84 = add i64 %pgocount10, 1
  store i64 %84, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table, i64 0, i64 14)
  br label %87

; <label>:85:                                     ; preds = %29
  %pgocount11 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table, i64 0, i64 13)
  %86 = add i64 %pgocount11, 1
  store i64 %86, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table, i64 0, i64 13)
  br label %87

; <label>:87:                                     ; preds = %85, %83, %69
  %88 = load i32, i32* %10, align 4
  %89 = load i32*, i32** %7, align 8
  %90 = load i32, i32* %89, align 4
  %91 = add nsw i32 %90, %88
  store i32 %91, i32* %89, align 4
  br label %142

; <label>:92:                                     ; preds = %21
  %93 = load i32, i32* %8, align 4
  %94 = sub nsw i32 %93, 15
  store i32 %94, i32* %8, align 4
  store i32 24, i32* %11, align 4
  br label %95

; <label>:95:                                     ; preds = %110, %92
  %96 = load i32, i32* %11, align 4
  %97 = icmp slt i32 %96, 32
  br i1 %97, label %98, label %113

; <label>:98:                                     ; preds = %95
  %99 = load i32, i32* %11, align 4
  %100 = sext i32 %99 to i64
  %101 = getelementptr inbounds [34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 %100
  %102 = getelementptr inbounds %struct.huffcodetab, %struct.huffcodetab* %101, i32 0, i32 1
  %103 = load i32, i32* %102, align 4
  %104 = load i32, i32* %8, align 4
  %105 = icmp sge i32 %103, %104
  br i1 %105, label %106, label %108

; <label>:106:                                    ; preds = %98
  %pgocount12 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table, i64 0, i64 6)
  %107 = add i64 %pgocount12, 1
  store i64 %107, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table, i64 0, i64 6)
  br label %113

; <label>:108:                                    ; preds = %98
  %pgocount13 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table, i64 0, i64 2)
  %109 = add i64 %pgocount13, 1
  store i64 %109, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table, i64 0, i64 2)
  br label %110

; <label>:110:                                    ; preds = %108
  %111 = load i32, i32* %11, align 4
  %112 = add nsw i32 %111, 1
  store i32 %112, i32* %11, align 4
  br label %95

; <label>:113:                                    ; preds = %106, %95
  %114 = load i32, i32* %11, align 4
  %115 = sub nsw i32 %114, 8
  store i32 %115, i32* %9, align 4
  br label %116

; <label>:116:                                    ; preds = %131, %113
  %117 = load i32, i32* %9, align 4
  %118 = icmp slt i32 %117, 24
  br i1 %118, label %119, label %134

; <label>:119:                                    ; preds = %116
  %120 = load i32, i32* %9, align 4
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds [34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 %121
  %123 = getelementptr inbounds %struct.huffcodetab, %struct.huffcodetab* %122, i32 0, i32 1
  %124 = load i32, i32* %123, align 4
  %125 = load i32, i32* %8, align 4
  %126 = icmp sge i32 %124, %125
  br i1 %126, label %127, label %129

; <label>:127:                                    ; preds = %119
  %pgocount14 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table, i64 0, i64 7)
  %128 = add i64 %pgocount14, 1
  store i64 %128, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table, i64 0, i64 7)
  br label %134

; <label>:129:                                    ; preds = %119
  %pgocount15 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table, i64 0, i64 3)
  %130 = add i64 %pgocount15, 1
  store i64 %130, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table, i64 0, i64 3)
  br label %131

; <label>:131:                                    ; preds = %129
  %132 = load i32, i32* %9, align 4
  %133 = add nsw i32 %132, 1
  store i32 %133, i32* %9, align 4
  br label %116

; <label>:134:                                    ; preds = %127, %116
  %pgocount16 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table, i64 0, i64 5)
  %135 = add i64 %pgocount16, 1
  store i64 %135, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_tmp1.ll_choose_table, i64 0, i64 5)
  %136 = load i32*, i32** %5, align 8
  %137 = load i32*, i32** %6, align 8
  %138 = load i32, i32* %9, align 4
  %139 = load i32, i32* %11, align 4
  %140 = load i32*, i32** %7, align 8
  %141 = call i32 @count_bit_ESC(i32* %136, i32* %137, i32 %138, i32 %139, i32* %140)
  store i32 %141, i32* %9, align 4
  br label %142

; <label>:142:                                    ; preds = %134, %87
  %143 = load i32, i32* %9, align 4
  store i32 %143, i32* %4, align 4
  br label %144

; <label>:144:                                    ; preds = %142, %27, %18
  %145 = load i32, i32* %4, align 4
  ret i32 %145
}

; Function Attrs: nounwind uwtable
define void @best_scalefac_store(%struct.lame_global_flags*, i32, i32, [2 x [576 x i32]]*, %struct.III_side_info_t*, [2 x %struct.III_scalefac_t]*) #0 {
  %7 = alloca %struct.lame_global_flags*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca [2 x [576 x i32]]*, align 8
  %11 = alloca %struct.III_side_info_t*, align 8
  %12 = alloca [2 x %struct.III_scalefac_t]*, align 8
  %13 = alloca %struct.gr_info*, align 8
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  %19 = alloca i32, align 4
  %20 = alloca i32, align 4
  %21 = alloca i32, align 4
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %7, align 8
  store i32 %1, i32* %8, align 4
  store i32 %2, i32* %9, align 4
  store [2 x [576 x i32]]* %3, [2 x [576 x i32]]** %10, align 8
  store %struct.III_side_info_t* %4, %struct.III_side_info_t** %11, align 8
  store [2 x %struct.III_scalefac_t]* %5, [2 x %struct.III_scalefac_t]** %12, align 8
  %22 = load %struct.III_side_info_t*, %struct.III_side_info_t** %11, align 8
  %23 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %22, i32 0, i32 4
  %24 = load i32, i32* %8, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [2 x %struct.anon.0], [2 x %struct.anon.0]* %23, i64 0, i64 %25
  %27 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %26, i32 0, i32 0
  %28 = load i32, i32* %9, align 4
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [2 x %struct.gr_info_ss], [2 x %struct.gr_info_ss]* %27, i64 0, i64 %29
  %31 = getelementptr inbounds %struct.gr_info_ss, %struct.gr_info_ss* %30, i32 0, i32 0
  store %struct.gr_info* %31, %struct.gr_info** %13, align 8
  store i32 0, i32* %14, align 4
  br label %32

; <label>:32:                                     ; preds = %107, %6
  %33 = load i32, i32* %14, align 4
  %34 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %35 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %34, i32 0, i32 16
  %36 = load i32, i32* %35, align 8
  %37 = icmp ult i32 %33, %36
  br i1 %37, label %38, label %111

; <label>:38:                                     ; preds = %32
  %39 = load [2 x %struct.III_scalefac_t]*, [2 x %struct.III_scalefac_t]** %12, align 8
  %40 = load i32, i32* %8, align 4
  %41 = sext i32 %40 to i64
  %42 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %39, i64 %41
  %43 = load i32, i32* %9, align 4
  %44 = sext i32 %43 to i64
  %45 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %42, i64 0, i64 %44
  %46 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %45, i32 0, i32 0
  %47 = load i32, i32* %14, align 4
  %48 = sext i32 %47 to i64
  %49 = getelementptr inbounds [22 x i32], [22 x i32]* %46, i64 0, i64 %48
  %50 = load i32, i32* %49, align 4
  %51 = icmp sgt i32 %50, 0
  br i1 %51, label %52, label %106

; <label>:52:                                     ; preds = %38
  %53 = load i32, i32* %14, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [23 x i32], [23 x i32]* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i32 0, i32 0), i64 0, i64 %54
  %56 = load i32, i32* %55, align 4
  store i32 %56, i32* %17, align 4
  %57 = load i32, i32* %14, align 4
  %58 = add nsw i32 %57, 1
  %59 = sext i32 %58 to i64
  %60 = getelementptr inbounds [23 x i32], [23 x i32]* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i32 0, i32 0), i64 0, i64 %59
  %61 = load i32, i32* %60, align 4
  store i32 %61, i32* %18, align 4
  %62 = load i32, i32* %17, align 4
  store i32 %62, i32* %16, align 4
  br label %63

; <label>:63:                                     ; preds = %84, %52
  %64 = load i32, i32* %16, align 4
  %65 = load i32, i32* %18, align 4
  %66 = icmp slt i32 %64, %65
  br i1 %66, label %67, label %87

; <label>:67:                                     ; preds = %63
  %68 = load [2 x [576 x i32]]*, [2 x [576 x i32]]** %10, align 8
  %69 = load i32, i32* %8, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %68, i64 %70
  %72 = load i32, i32* %9, align 4
  %73 = sext i32 %72 to i64
  %74 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %71, i64 0, i64 %73
  %75 = load i32, i32* %16, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [576 x i32], [576 x i32]* %74, i64 0, i64 %76
  %78 = load i32, i32* %77, align 4
  %79 = icmp ne i32 %78, 0
  br i1 %79, label %80, label %82

; <label>:80:                                     ; preds = %67
  %pgocount = load i64, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 12)
  %81 = add i64 %pgocount, 1
  store i64 %81, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 12)
  br label %87

; <label>:82:                                     ; preds = %67
  %pgocount1 = load i64, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 5)
  %83 = add i64 %pgocount1, 1
  store i64 %83, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 5)
  br label %84

; <label>:84:                                     ; preds = %82
  %85 = load i32, i32* %16, align 4
  %86 = add nsw i32 %85, 1
  store i32 %86, i32* %16, align 4
  br label %63

; <label>:87:                                     ; preds = %80, %63
  %88 = load i32, i32* %16, align 4
  %89 = load i32, i32* %18, align 4
  %90 = icmp eq i32 %88, %89
  br i1 %90, label %91, label %104

; <label>:91:                                     ; preds = %87
  %pgocount2 = load i64, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 11)
  %92 = add i64 %pgocount2, 1
  store i64 %92, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 11)
  %93 = load [2 x %struct.III_scalefac_t]*, [2 x %struct.III_scalefac_t]** %12, align 8
  %94 = load i32, i32* %8, align 4
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %93, i64 %95
  %97 = load i32, i32* %9, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %96, i64 0, i64 %98
  %100 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %99, i32 0, i32 0
  %101 = load i32, i32* %14, align 4
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds [22 x i32], [22 x i32]* %100, i64 0, i64 %102
  store i32 0, i32* %103, align 4
  br label %104

; <label>:104:                                    ; preds = %91, %87
  %pgocount3 = load i64, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 10)
  %105 = add i64 %pgocount3, 1
  store i64 %105, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 10)
  br label %106

; <label>:106:                                    ; preds = %104, %38
  br label %107

; <label>:107:                                    ; preds = %106
  %pgocount4 = load i64, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 8)
  %108 = add i64 %pgocount4, 1
  store i64 %108, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 8)
  %109 = load i32, i32* %14, align 4
  %110 = add nsw i32 %109, 1
  store i32 %110, i32* %14, align 4
  br label %32

; <label>:111:                                    ; preds = %32
  store i32 0, i32* %15, align 4
  br label %112

; <label>:112:                                    ; preds = %205, %111
  %113 = load i32, i32* %15, align 4
  %114 = icmp slt i32 %113, 3
  br i1 %114, label %115, label %209

; <label>:115:                                    ; preds = %112
  %116 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %117 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %116, i32 0, i32 17
  %118 = load i32, i32* %117, align 4
  store i32 %118, i32* %14, align 4
  br label %119

; <label>:119:                                    ; preds = %200, %115
  %120 = load i32, i32* %14, align 4
  %121 = icmp slt i32 %120, 12
  br i1 %121, label %122, label %204

; <label>:122:                                    ; preds = %119
  %123 = load [2 x %struct.III_scalefac_t]*, [2 x %struct.III_scalefac_t]** %12, align 8
  %124 = load i32, i32* %8, align 4
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %123, i64 %125
  %127 = load i32, i32* %9, align 4
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %126, i64 0, i64 %128
  %130 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %129, i32 0, i32 1
  %131 = load i32, i32* %14, align 4
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds [13 x [3 x i32]], [13 x [3 x i32]]* %130, i64 0, i64 %132
  %134 = load i32, i32* %15, align 4
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds [3 x i32], [3 x i32]* %133, i64 0, i64 %135
  %137 = load i32, i32* %136, align 4
  %138 = icmp sgt i32 %137, 0
  br i1 %138, label %139, label %199

; <label>:139:                                    ; preds = %122
  %140 = load i32, i32* %14, align 4
  %141 = sext i32 %140 to i64
  %142 = getelementptr inbounds [14 x i32], [14 x i32]* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i32 0, i32 1), i64 0, i64 %141
  %143 = load i32, i32* %142, align 4
  store i32 %143, i32* %17, align 4
  %144 = load i32, i32* %14, align 4
  %145 = add nsw i32 %144, 1
  %146 = sext i32 %145 to i64
  %147 = getelementptr inbounds [14 x i32], [14 x i32]* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i32 0, i32 1), i64 0, i64 %146
  %148 = load i32, i32* %147, align 4
  store i32 %148, i32* %18, align 4
  %149 = load i32, i32* %17, align 4
  store i32 %149, i32* %16, align 4
  br label %150

; <label>:150:                                    ; preds = %174, %139
  %151 = load i32, i32* %16, align 4
  %152 = load i32, i32* %18, align 4
  %153 = icmp slt i32 %151, %152
  br i1 %153, label %154, label %177

; <label>:154:                                    ; preds = %150
  %155 = load [2 x [576 x i32]]*, [2 x [576 x i32]]** %10, align 8
  %156 = load i32, i32* %8, align 4
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %155, i64 %157
  %159 = load i32, i32* %9, align 4
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %158, i64 0, i64 %160
  %162 = load i32, i32* %16, align 4
  %163 = mul nsw i32 3, %162
  %164 = load i32, i32* %15, align 4
  %165 = add nsw i32 %163, %164
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds [576 x i32], [576 x i32]* %161, i64 0, i64 %166
  %168 = load i32, i32* %167, align 4
  %169 = icmp ne i32 %168, 0
  br i1 %169, label %170, label %172

; <label>:170:                                    ; preds = %154
  %pgocount5 = load i64, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 4)
  %171 = add i64 %pgocount5, 1
  store i64 %171, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 4)
  br label %177

; <label>:172:                                    ; preds = %154
  %pgocount6 = load i64, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 0)
  %173 = add i64 %pgocount6, 1
  store i64 %173, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 0)
  br label %174

; <label>:174:                                    ; preds = %172
  %175 = load i32, i32* %16, align 4
  %176 = add nsw i32 %175, 1
  store i32 %176, i32* %16, align 4
  br label %150

; <label>:177:                                    ; preds = %170, %150
  %178 = load i32, i32* %16, align 4
  %179 = load i32, i32* %18, align 4
  %180 = icmp eq i32 %178, %179
  br i1 %180, label %181, label %197

; <label>:181:                                    ; preds = %177
  %pgocount7 = load i64, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 3)
  %182 = add i64 %pgocount7, 1
  store i64 %182, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 3)
  %183 = load [2 x %struct.III_scalefac_t]*, [2 x %struct.III_scalefac_t]** %12, align 8
  %184 = load i32, i32* %8, align 4
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %183, i64 %185
  %187 = load i32, i32* %9, align 4
  %188 = sext i32 %187 to i64
  %189 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %186, i64 0, i64 %188
  %190 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %189, i32 0, i32 1
  %191 = load i32, i32* %14, align 4
  %192 = sext i32 %191 to i64
  %193 = getelementptr inbounds [13 x [3 x i32]], [13 x [3 x i32]]* %190, i64 0, i64 %192
  %194 = load i32, i32* %15, align 4
  %195 = sext i32 %194 to i64
  %196 = getelementptr inbounds [3 x i32], [3 x i32]* %193, i64 0, i64 %195
  store i32 0, i32* %196, align 4
  br label %197

; <label>:197:                                    ; preds = %181, %177
  %pgocount8 = load i64, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 2)
  %198 = add i64 %pgocount8, 1
  store i64 %198, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 2)
  br label %199

; <label>:199:                                    ; preds = %197, %122
  br label %200

; <label>:200:                                    ; preds = %199
  %pgocount9 = load i64, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 1)
  %201 = add i64 %pgocount9, 1
  store i64 %201, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 1)
  %202 = load i32, i32* %14, align 4
  %203 = add nsw i32 %202, 1
  store i32 %203, i32* %14, align 4
  br label %119

; <label>:204:                                    ; preds = %119
  br label %205

; <label>:205:                                    ; preds = %204
  %pgocount10 = load i64, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 9)
  %206 = add i64 %pgocount10, 1
  store i64 %206, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 9)
  %207 = load i32, i32* %15, align 4
  %208 = add nsw i32 %207, 1
  store i32 %208, i32* %15, align 4
  br label %112

; <label>:209:                                    ; preds = %112
  %210 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %211 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %210, i32 0, i32 15
  %212 = load i32, i32* %211, align 4
  %213 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %214 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %213, i32 0, i32 0
  %215 = load i32, i32* %214, align 8
  %216 = sub i32 %215, %212
  store i32 %216, i32* %214, align 8
  %217 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %218 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %217, i32 0, i32 13
  %219 = load i32, i32* %218, align 4
  %220 = icmp ne i32 %219, 0
  br i1 %220, label %395, label %221

; <label>:221:                                    ; preds = %209
  %pgocount11 = load i64, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 19)
  %222 = add i64 %pgocount11, 1
  store i64 %222, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 19)
  %223 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %224 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %223, i32 0, i32 12
  %225 = load i32, i32* %224, align 8
  %226 = icmp ne i32 %225, 0
  br i1 %226, label %395, label %227

; <label>:227:                                    ; preds = %221
  store i32 0, i32* %21, align 4
  store i32 0, i32* %19, align 4
  br label %228

; <label>:228:                                    ; preds = %249, %227
  %229 = load i32, i32* %19, align 4
  %230 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %231 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %230, i32 0, i32 16
  %232 = load i32, i32* %231, align 8
  %233 = icmp ult i32 %229, %232
  br i1 %233, label %234, label %253

; <label>:234:                                    ; preds = %228
  %235 = load [2 x %struct.III_scalefac_t]*, [2 x %struct.III_scalefac_t]** %12, align 8
  %236 = load i32, i32* %8, align 4
  %237 = sext i32 %236 to i64
  %238 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %235, i64 %237
  %239 = load i32, i32* %9, align 4
  %240 = sext i32 %239 to i64
  %241 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %238, i64 0, i64 %240
  %242 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %241, i32 0, i32 0
  %243 = load i32, i32* %19, align 4
  %244 = zext i32 %243 to i64
  %245 = getelementptr inbounds [22 x i32], [22 x i32]* %242, i64 0, i64 %244
  %246 = load i32, i32* %245, align 4
  %247 = load i32, i32* %21, align 4
  %248 = or i32 %247, %246
  store i32 %248, i32* %21, align 4
  br label %249

; <label>:249:                                    ; preds = %234
  %pgocount12 = load i64, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 13)
  %250 = add i64 %pgocount12, 1
  store i64 %250, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 13)
  %251 = load i32, i32* %19, align 4
  %252 = add i32 %251, 1
  store i32 %252, i32* %19, align 4
  br label %228

; <label>:253:                                    ; preds = %228
  %254 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %255 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %254, i32 0, i32 17
  %256 = load i32, i32* %255, align 4
  store i32 %256, i32* %19, align 4
  br label %257

; <label>:257:                                    ; preds = %287, %253
  %258 = load i32, i32* %19, align 4
  %259 = icmp ult i32 %258, 12
  br i1 %259, label %260, label %291

; <label>:260:                                    ; preds = %257
  store i32 0, i32* %20, align 4
  br label %261

; <label>:261:                                    ; preds = %282, %260
  %262 = load i32, i32* %20, align 4
  %263 = icmp slt i32 %262, 3
  br i1 %263, label %264, label %286

; <label>:264:                                    ; preds = %261
  %265 = load [2 x %struct.III_scalefac_t]*, [2 x %struct.III_scalefac_t]** %12, align 8
  %266 = load i32, i32* %8, align 4
  %267 = sext i32 %266 to i64
  %268 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %265, i64 %267
  %269 = load i32, i32* %9, align 4
  %270 = sext i32 %269 to i64
  %271 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %268, i64 0, i64 %270
  %272 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %271, i32 0, i32 1
  %273 = load i32, i32* %19, align 4
  %274 = zext i32 %273 to i64
  %275 = getelementptr inbounds [13 x [3 x i32]], [13 x [3 x i32]]* %272, i64 0, i64 %274
  %276 = load i32, i32* %20, align 4
  %277 = sext i32 %276 to i64
  %278 = getelementptr inbounds [3 x i32], [3 x i32]* %275, i64 0, i64 %277
  %279 = load i32, i32* %278, align 4
  %280 = load i32, i32* %21, align 4
  %281 = or i32 %280, %279
  store i32 %281, i32* %21, align 4
  br label %282

; <label>:282:                                    ; preds = %264
  %pgocount13 = load i64, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 6)
  %283 = add i64 %pgocount13, 1
  store i64 %283, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 6)
  %284 = load i32, i32* %20, align 4
  %285 = add nsw i32 %284, 1
  store i32 %285, i32* %20, align 4
  br label %261

; <label>:286:                                    ; preds = %261
  br label %287

; <label>:287:                                    ; preds = %286
  %pgocount14 = load i64, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 14)
  %288 = add i64 %pgocount14, 1
  store i64 %288, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 14)
  %289 = load i32, i32* %19, align 4
  %290 = add i32 %289, 1
  store i32 %290, i32* %19, align 4
  br label %257

; <label>:291:                                    ; preds = %257
  %292 = load i32, i32* %21, align 4
  %293 = and i32 %292, 1
  %294 = icmp ne i32 %293, 0
  br i1 %294, label %393, label %295

; <label>:295:                                    ; preds = %291
  %pgocount15 = load i64, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 23)
  %296 = add i64 %pgocount15, 1
  store i64 %296, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 23)
  %297 = load i32, i32* %21, align 4
  %298 = icmp ne i32 %297, 0
  br i1 %298, label %299, label %393

; <label>:299:                                    ; preds = %295
  store i32 0, i32* %19, align 4
  br label %300

; <label>:300:                                    ; preds = %320, %299
  %301 = load i32, i32* %19, align 4
  %302 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %303 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %302, i32 0, i32 16
  %304 = load i32, i32* %303, align 8
  %305 = icmp ult i32 %301, %304
  br i1 %305, label %306, label %324

; <label>:306:                                    ; preds = %300
  %307 = load [2 x %struct.III_scalefac_t]*, [2 x %struct.III_scalefac_t]** %12, align 8
  %308 = load i32, i32* %8, align 4
  %309 = sext i32 %308 to i64
  %310 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %307, i64 %309
  %311 = load i32, i32* %9, align 4
  %312 = sext i32 %311 to i64
  %313 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %310, i64 0, i64 %312
  %314 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %313, i32 0, i32 0
  %315 = load i32, i32* %19, align 4
  %316 = zext i32 %315 to i64
  %317 = getelementptr inbounds [22 x i32], [22 x i32]* %314, i64 0, i64 %316
  %318 = load i32, i32* %317, align 4
  %319 = sdiv i32 %318, 2
  store i32 %319, i32* %317, align 4
  br label %320

; <label>:320:                                    ; preds = %306
  %pgocount16 = load i64, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 15)
  %321 = add i64 %pgocount16, 1
  store i64 %321, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 15)
  %322 = load i32, i32* %19, align 4
  %323 = add i32 %322, 1
  store i32 %323, i32* %19, align 4
  br label %300

; <label>:324:                                    ; preds = %300
  %325 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %326 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %325, i32 0, i32 17
  %327 = load i32, i32* %326, align 4
  store i32 %327, i32* %19, align 4
  br label %328

; <label>:328:                                    ; preds = %357, %324
  %329 = load i32, i32* %19, align 4
  %330 = icmp ult i32 %329, 12
  br i1 %330, label %331, label %361

; <label>:331:                                    ; preds = %328
  store i32 0, i32* %20, align 4
  br label %332

; <label>:332:                                    ; preds = %352, %331
  %333 = load i32, i32* %20, align 4
  %334 = icmp slt i32 %333, 3
  br i1 %334, label %335, label %356

; <label>:335:                                    ; preds = %332
  %336 = load [2 x %struct.III_scalefac_t]*, [2 x %struct.III_scalefac_t]** %12, align 8
  %337 = load i32, i32* %8, align 4
  %338 = sext i32 %337 to i64
  %339 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %336, i64 %338
  %340 = load i32, i32* %9, align 4
  %341 = sext i32 %340 to i64
  %342 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %339, i64 0, i64 %341
  %343 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %342, i32 0, i32 1
  %344 = load i32, i32* %19, align 4
  %345 = zext i32 %344 to i64
  %346 = getelementptr inbounds [13 x [3 x i32]], [13 x [3 x i32]]* %343, i64 0, i64 %345
  %347 = load i32, i32* %20, align 4
  %348 = sext i32 %347 to i64
  %349 = getelementptr inbounds [3 x i32], [3 x i32]* %346, i64 0, i64 %348
  %350 = load i32, i32* %349, align 4
  %351 = sdiv i32 %350, 2
  store i32 %351, i32* %349, align 4
  br label %352

; <label>:352:                                    ; preds = %335
  %pgocount17 = load i64, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 7)
  %353 = add i64 %pgocount17, 1
  store i64 %353, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 7)
  %354 = load i32, i32* %20, align 4
  %355 = add nsw i32 %354, 1
  store i32 %355, i32* %20, align 4
  br label %332

; <label>:356:                                    ; preds = %332
  br label %357

; <label>:357:                                    ; preds = %356
  %pgocount18 = load i64, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 16)
  %358 = add i64 %pgocount18, 1
  store i64 %358, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 16)
  %359 = load i32, i32* %19, align 4
  %360 = add i32 %359, 1
  store i32 %360, i32* %19, align 4
  br label %328

; <label>:361:                                    ; preds = %328
  %362 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %363 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %362, i32 0, i32 13
  store i32 1, i32* %363, align 4
  %364 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %365 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %364, i32 0, i32 15
  store i32 99999999, i32* %365, align 4
  %366 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %367 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %366, i32 0, i32 45
  %368 = load i32, i32* %367, align 8
  %369 = icmp eq i32 %368, 2
  br i1 %369, label %370, label %381

; <label>:370:                                    ; preds = %361
  %pgocount19 = load i64, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 26)
  %371 = add i64 %pgocount19, 1
  store i64 %371, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 26)
  %372 = load [2 x %struct.III_scalefac_t]*, [2 x %struct.III_scalefac_t]** %12, align 8
  %373 = load i32, i32* %8, align 4
  %374 = sext i32 %373 to i64
  %375 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %372, i64 %374
  %376 = load i32, i32* %9, align 4
  %377 = sext i32 %376 to i64
  %378 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %375, i64 0, i64 %377
  %379 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %380 = call i32 @scale_bitcount(%struct.III_scalefac_t* %378, %struct.gr_info* %379)
  br label %392

; <label>:381:                                    ; preds = %361
  %pgocount20 = load i64, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 27)
  %382 = add i64 %pgocount20, 1
  store i64 %382, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 27)
  %383 = load [2 x %struct.III_scalefac_t]*, [2 x %struct.III_scalefac_t]** %12, align 8
  %384 = load i32, i32* %8, align 4
  %385 = sext i32 %384 to i64
  %386 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %383, i64 %385
  %387 = load i32, i32* %9, align 4
  %388 = sext i32 %387 to i64
  %389 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %386, i64 0, i64 %388
  %390 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %391 = call i32 @scale_bitcount_lsf(%struct.III_scalefac_t* %389, %struct.gr_info* %390)
  br label %392

; <label>:392:                                    ; preds = %381, %370
  br label %393

; <label>:393:                                    ; preds = %392, %295, %291
  %pgocount21 = load i64, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 21)
  %394 = add i64 %pgocount21, 1
  store i64 %394, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 21)
  br label %395

; <label>:395:                                    ; preds = %393, %221, %209
  %396 = load %struct.lame_global_flags*, %struct.lame_global_flags** %7, align 8
  %397 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %396, i32 0, i32 45
  %398 = load i32, i32* %397, align 8
  %399 = icmp eq i32 %398, 2
  br i1 %399, label %400, label %481

; <label>:400:                                    ; preds = %395
  %pgocount22 = load i64, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 18)
  %401 = add i64 %pgocount22, 1
  store i64 %401, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 18)
  %402 = load i32, i32* %8, align 4
  %403 = icmp eq i32 %402, 1
  br i1 %403, label %404, label %481

; <label>:404:                                    ; preds = %400
  %pgocount23 = load i64, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 20)
  %405 = add i64 %pgocount23, 1
  store i64 %405, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 20)
  %406 = load %struct.III_side_info_t*, %struct.III_side_info_t** %11, align 8
  %407 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %406, i32 0, i32 4
  %408 = getelementptr inbounds [2 x %struct.anon.0], [2 x %struct.anon.0]* %407, i64 0, i64 0
  %409 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %408, i32 0, i32 0
  %410 = load i32, i32* %9, align 4
  %411 = sext i32 %410 to i64
  %412 = getelementptr inbounds [2 x %struct.gr_info_ss], [2 x %struct.gr_info_ss]* %409, i64 0, i64 %411
  %413 = getelementptr inbounds %struct.gr_info_ss, %struct.gr_info_ss* %412, i32 0, i32 0
  %414 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %413, i32 0, i32 6
  %415 = load i32, i32* %414, align 8
  %416 = icmp ne i32 %415, 2
  br i1 %416, label %417, label %481

; <label>:417:                                    ; preds = %404
  %pgocount24 = load i64, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 22)
  %418 = add i64 %pgocount24, 1
  store i64 %418, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 22)
  %419 = load %struct.III_side_info_t*, %struct.III_side_info_t** %11, align 8
  %420 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %419, i32 0, i32 4
  %421 = getelementptr inbounds [2 x %struct.anon.0], [2 x %struct.anon.0]* %420, i64 0, i64 1
  %422 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %421, i32 0, i32 0
  %423 = load i32, i32* %9, align 4
  %424 = sext i32 %423 to i64
  %425 = getelementptr inbounds [2 x %struct.gr_info_ss], [2 x %struct.gr_info_ss]* %422, i64 0, i64 %424
  %426 = getelementptr inbounds %struct.gr_info_ss, %struct.gr_info_ss* %425, i32 0, i32 0
  %427 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %426, i32 0, i32 6
  %428 = load i32, i32* %427, align 8
  %429 = icmp ne i32 %428, 2
  br i1 %429, label %430, label %481

; <label>:430:                                    ; preds = %417
  %pgocount25 = load i64, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 24)
  %431 = add i64 %pgocount25, 1
  store i64 %431, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 24)
  %432 = load %struct.III_side_info_t*, %struct.III_side_info_t** %11, align 8
  %433 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %432, i32 0, i32 4
  %434 = getelementptr inbounds [2 x %struct.anon.0], [2 x %struct.anon.0]* %433, i64 0, i64 0
  %435 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %434, i32 0, i32 0
  %436 = load i32, i32* %9, align 4
  %437 = sext i32 %436 to i64
  %438 = getelementptr inbounds [2 x %struct.gr_info_ss], [2 x %struct.gr_info_ss]* %435, i64 0, i64 %437
  %439 = getelementptr inbounds %struct.gr_info_ss, %struct.gr_info_ss* %438, i32 0, i32 0
  %440 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %439, i32 0, i32 13
  %441 = load i32, i32* %440, align 4
  %442 = load %struct.III_side_info_t*, %struct.III_side_info_t** %11, align 8
  %443 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %442, i32 0, i32 4
  %444 = getelementptr inbounds [2 x %struct.anon.0], [2 x %struct.anon.0]* %443, i64 0, i64 1
  %445 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %444, i32 0, i32 0
  %446 = load i32, i32* %9, align 4
  %447 = sext i32 %446 to i64
  %448 = getelementptr inbounds [2 x %struct.gr_info_ss], [2 x %struct.gr_info_ss]* %445, i64 0, i64 %447
  %449 = getelementptr inbounds %struct.gr_info_ss, %struct.gr_info_ss* %448, i32 0, i32 0
  %450 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %449, i32 0, i32 13
  %451 = load i32, i32* %450, align 4
  %452 = icmp eq i32 %441, %451
  br i1 %452, label %453, label %481

; <label>:453:                                    ; preds = %430
  %pgocount26 = load i64, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 25)
  %454 = add i64 %pgocount26, 1
  store i64 %454, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 25)
  %455 = load %struct.III_side_info_t*, %struct.III_side_info_t** %11, align 8
  %456 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %455, i32 0, i32 4
  %457 = getelementptr inbounds [2 x %struct.anon.0], [2 x %struct.anon.0]* %456, i64 0, i64 0
  %458 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %457, i32 0, i32 0
  %459 = load i32, i32* %9, align 4
  %460 = sext i32 %459 to i64
  %461 = getelementptr inbounds [2 x %struct.gr_info_ss], [2 x %struct.gr_info_ss]* %458, i64 0, i64 %460
  %462 = getelementptr inbounds %struct.gr_info_ss, %struct.gr_info_ss* %461, i32 0, i32 0
  %463 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %462, i32 0, i32 12
  %464 = load i32, i32* %463, align 8
  %465 = load %struct.III_side_info_t*, %struct.III_side_info_t** %11, align 8
  %466 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %465, i32 0, i32 4
  %467 = getelementptr inbounds [2 x %struct.anon.0], [2 x %struct.anon.0]* %466, i64 0, i64 1
  %468 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %467, i32 0, i32 0
  %469 = load i32, i32* %9, align 4
  %470 = sext i32 %469 to i64
  %471 = getelementptr inbounds [2 x %struct.gr_info_ss], [2 x %struct.gr_info_ss]* %468, i64 0, i64 %470
  %472 = getelementptr inbounds %struct.gr_info_ss, %struct.gr_info_ss* %471, i32 0, i32 0
  %473 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %472, i32 0, i32 12
  %474 = load i32, i32* %473, align 8
  %475 = icmp eq i32 %464, %474
  br i1 %475, label %476, label %481

; <label>:476:                                    ; preds = %453
  %pgocount27 = load i64, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 28)
  %477 = add i64 %pgocount27, 1
  store i64 %477, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 28)
  %478 = load i32, i32* %9, align 4
  %479 = load %struct.III_side_info_t*, %struct.III_side_info_t** %11, align 8
  %480 = load [2 x %struct.III_scalefac_t]*, [2 x %struct.III_scalefac_t]** %12, align 8
  call void @scfsi_calc(i32 %478, %struct.III_side_info_t* %479, [2 x %struct.III_scalefac_t]* %480)
  br label %481

; <label>:481:                                    ; preds = %476, %453, %430, %417, %404, %400, %395
  %pgocount28 = load i64, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 17)
  %482 = add i64 %pgocount28, 1
  store i64 %482, i64* getelementptr inbounds ([29 x i64], [29 x i64]* @__profc_best_scalefac_store, i64 0, i64 17)
  %483 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %484 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %483, i32 0, i32 15
  %485 = load i32, i32* %484, align 4
  %486 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %487 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %486, i32 0, i32 0
  %488 = load i32, i32* %487, align 8
  %489 = add i32 %488, %485
  store i32 %489, i32* %487, align 8
  ret void
}

declare i32 @scale_bitcount(%struct.III_scalefac_t*, %struct.gr_info*) #1

declare i32 @scale_bitcount_lsf(%struct.III_scalefac_t*, %struct.gr_info*) #1

; Function Attrs: nounwind uwtable
define internal void @scfsi_calc(i32, %struct.III_side_info_t*, [2 x %struct.III_scalefac_t]*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.III_side_info_t*, align 8
  %6 = alloca [2 x %struct.III_scalefac_t]*, align 8
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca %struct.gr_info*, align 8
  %14 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store %struct.III_side_info_t* %1, %struct.III_side_info_t** %5, align 8
  store [2 x %struct.III_scalefac_t]* %2, [2 x %struct.III_scalefac_t]** %6, align 8
  %15 = load %struct.III_side_info_t*, %struct.III_side_info_t** %5, align 8
  %16 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %15, i32 0, i32 4
  %17 = getelementptr inbounds [2 x %struct.anon.0], [2 x %struct.anon.0]* %16, i64 0, i64 1
  %18 = getelementptr inbounds %struct.anon.0, %struct.anon.0* %17, i32 0, i32 0
  %19 = load i32, i32* %4, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [2 x %struct.gr_info_ss], [2 x %struct.gr_info_ss]* %18, i64 0, i64 %20
  %22 = getelementptr inbounds %struct.gr_info_ss, %struct.gr_info_ss* %21, i32 0, i32 0
  store %struct.gr_info* %22, %struct.gr_info** %13, align 8
  store i32 0, i32* %7, align 4
  br label %23

; <label>:23:                                     ; preds = %35, %3
  %24 = load i32, i32* %7, align 4
  %25 = icmp slt i32 %24, 4
  br i1 %25, label %26, label %39

; <label>:26:                                     ; preds = %23
  %27 = load %struct.III_side_info_t*, %struct.III_side_info_t** %5, align 8
  %28 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %27, i32 0, i32 3
  %29 = load i32, i32* %4, align 4
  %30 = sext i32 %29 to i64
  %31 = getelementptr inbounds [2 x [4 x i32]], [2 x [4 x i32]]* %28, i64 0, i64 %30
  %32 = load i32, i32* %7, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [4 x i32], [4 x i32]* %31, i64 0, i64 %33
  store i32 0, i32* %34, align 4
  br label %35

; <label>:35:                                     ; preds = %26
  %pgocount = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_scfsi_calc, i64 0, i64 2)
  %36 = add i64 %pgocount, 1
  store i64 %36, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_scfsi_calc, i64 0, i64 2)
  %37 = load i32, i32* %7, align 4
  %38 = add nsw i32 %37, 1
  store i32 %38, i32* %7, align 4
  br label %23

; <label>:39:                                     ; preds = %23
  store i32 0, i32* %7, align 4
  br label %40

; <label>:40:                                     ; preds = %131, %39
  %41 = load i32, i32* %7, align 4
  %42 = icmp slt i32 %41, 4
  br i1 %42, label %43, label %135

; <label>:43:                                     ; preds = %40
  %44 = load i32, i32* %7, align 4
  %45 = sext i32 %44 to i64
  %46 = getelementptr inbounds [5 x i32], [5 x i32]* @scfsi_calc.scfsi_band, i64 0, i64 %45
  %47 = load i32, i32* %46, align 4
  store i32 %47, i32* %12, align 4
  br label %48

; <label>:48:                                     ; preds = %81, %43
  %49 = load i32, i32* %12, align 4
  %50 = load i32, i32* %7, align 4
  %51 = add nsw i32 %50, 1
  %52 = sext i32 %51 to i64
  %53 = getelementptr inbounds [5 x i32], [5 x i32]* @scfsi_calc.scfsi_band, i64 0, i64 %52
  %54 = load i32, i32* %53, align 4
  %55 = icmp slt i32 %49, %54
  br i1 %55, label %56, label %85

; <label>:56:                                     ; preds = %48
  %57 = load [2 x %struct.III_scalefac_t]*, [2 x %struct.III_scalefac_t]** %6, align 8
  %58 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %57, i64 0
  %59 = load i32, i32* %4, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %58, i64 0, i64 %60
  %62 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %61, i32 0, i32 0
  %63 = load i32, i32* %12, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [22 x i32], [22 x i32]* %62, i64 0, i64 %64
  %66 = load i32, i32* %65, align 4
  %67 = load [2 x %struct.III_scalefac_t]*, [2 x %struct.III_scalefac_t]** %6, align 8
  %68 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %67, i64 1
  %69 = load i32, i32* %4, align 4
  %70 = sext i32 %69 to i64
  %71 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %68, i64 0, i64 %70
  %72 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %71, i32 0, i32 0
  %73 = load i32, i32* %12, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [22 x i32], [22 x i32]* %72, i64 0, i64 %74
  %76 = load i32, i32* %75, align 4
  %77 = icmp ne i32 %66, %76
  br i1 %77, label %78, label %80

; <label>:78:                                     ; preds = %56
  %pgocount1 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_scfsi_calc, i64 0, i64 9)
  %79 = add i64 %pgocount1, 1
  store i64 %79, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_scfsi_calc, i64 0, i64 9)
  br label %85

; <label>:80:                                     ; preds = %56
  br label %81

; <label>:81:                                     ; preds = %80
  %pgocount2 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_scfsi_calc, i64 0, i64 1)
  %82 = add i64 %pgocount2, 1
  store i64 %82, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_scfsi_calc, i64 0, i64 1)
  %83 = load i32, i32* %12, align 4
  %84 = add nsw i32 %83, 1
  store i32 %84, i32* %12, align 4
  br label %48

; <label>:85:                                     ; preds = %78, %48
  %86 = load i32, i32* %12, align 4
  %87 = load i32, i32* %7, align 4
  %88 = add nsw i32 %87, 1
  %89 = sext i32 %88 to i64
  %90 = getelementptr inbounds [5 x i32], [5 x i32]* @scfsi_calc.scfsi_band, i64 0, i64 %89
  %91 = load i32, i32* %90, align 4
  %92 = icmp eq i32 %86, %91
  br i1 %92, label %93, label %130

; <label>:93:                                     ; preds = %85
  %94 = load i32, i32* %7, align 4
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds [5 x i32], [5 x i32]* @scfsi_calc.scfsi_band, i64 0, i64 %95
  %97 = load i32, i32* %96, align 4
  store i32 %97, i32* %12, align 4
  br label %98

; <label>:98:                                     ; preds = %116, %93
  %99 = load i32, i32* %12, align 4
  %100 = load i32, i32* %7, align 4
  %101 = add nsw i32 %100, 1
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds [5 x i32], [5 x i32]* @scfsi_calc.scfsi_band, i64 0, i64 %102
  %104 = load i32, i32* %103, align 4
  %105 = icmp slt i32 %99, %104
  br i1 %105, label %106, label %120

; <label>:106:                                    ; preds = %98
  %107 = load [2 x %struct.III_scalefac_t]*, [2 x %struct.III_scalefac_t]** %6, align 8
  %108 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %107, i64 1
  %109 = load i32, i32* %4, align 4
  %110 = sext i32 %109 to i64
  %111 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %108, i64 0, i64 %110
  %112 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %111, i32 0, i32 0
  %113 = load i32, i32* %12, align 4
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds [22 x i32], [22 x i32]* %112, i64 0, i64 %114
  store i32 -1, i32* %115, align 4
  br label %116

; <label>:116:                                    ; preds = %106
  %pgocount3 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_scfsi_calc, i64 0, i64 0)
  %117 = add i64 %pgocount3, 1
  store i64 %117, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_scfsi_calc, i64 0, i64 0)
  %118 = load i32, i32* %12, align 4
  %119 = add nsw i32 %118, 1
  store i32 %119, i32* %12, align 4
  br label %98

; <label>:120:                                    ; preds = %98
  %pgocount4 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_scfsi_calc, i64 0, i64 7)
  %121 = add i64 %pgocount4, 1
  store i64 %121, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_scfsi_calc, i64 0, i64 7)
  %122 = load %struct.III_side_info_t*, %struct.III_side_info_t** %5, align 8
  %123 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %122, i32 0, i32 3
  %124 = load i32, i32* %4, align 4
  %125 = sext i32 %124 to i64
  %126 = getelementptr inbounds [2 x [4 x i32]], [2 x [4 x i32]]* %123, i64 0, i64 %125
  %127 = load i32, i32* %7, align 4
  %128 = sext i32 %127 to i64
  %129 = getelementptr inbounds [4 x i32], [4 x i32]* %126, i64 0, i64 %128
  store i32 1, i32* %129, align 4
  br label %130

; <label>:130:                                    ; preds = %120, %85
  br label %131

; <label>:131:                                    ; preds = %130
  %pgocount5 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_scfsi_calc, i64 0, i64 3)
  %132 = add i64 %pgocount5, 1
  store i64 %132, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_scfsi_calc, i64 0, i64 3)
  %133 = load i32, i32* %7, align 4
  %134 = add nsw i32 %133, 1
  store i32 %134, i32* %7, align 4
  br label %40

; <label>:135:                                    ; preds = %40
  store i32 0, i32* %10, align 4
  store i32 0, i32* %8, align 4
  store i32 0, i32* %12, align 4
  br label %136

; <label>:136:                                    ; preds = %182, %135
  %137 = load i32, i32* %12, align 4
  %138 = icmp slt i32 %137, 11
  br i1 %138, label %139, label %185

; <label>:139:                                    ; preds = %136
  %140 = load [2 x %struct.III_scalefac_t]*, [2 x %struct.III_scalefac_t]** %6, align 8
  %141 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %140, i64 1
  %142 = load i32, i32* %4, align 4
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %141, i64 0, i64 %143
  %145 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %144, i32 0, i32 0
  %146 = load i32, i32* %12, align 4
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds [22 x i32], [22 x i32]* %145, i64 0, i64 %147
  %149 = load i32, i32* %148, align 4
  %150 = icmp slt i32 %149, 0
  br i1 %150, label %151, label %153

; <label>:151:                                    ; preds = %139
  %pgocount6 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_scfsi_calc, i64 0, i64 10)
  %152 = add i64 %pgocount6, 1
  store i64 %152, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_scfsi_calc, i64 0, i64 10)
  br label %182

; <label>:153:                                    ; preds = %139
  %154 = load i32, i32* %10, align 4
  %155 = add nsw i32 %154, 1
  store i32 %155, i32* %10, align 4
  %156 = load i32, i32* %8, align 4
  %157 = load [2 x %struct.III_scalefac_t]*, [2 x %struct.III_scalefac_t]** %6, align 8
  %158 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %157, i64 1
  %159 = load i32, i32* %4, align 4
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %158, i64 0, i64 %160
  %162 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %161, i32 0, i32 0
  %163 = load i32, i32* %12, align 4
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds [22 x i32], [22 x i32]* %162, i64 0, i64 %164
  %166 = load i32, i32* %165, align 4
  %167 = icmp slt i32 %156, %166
  br i1 %167, label %168, label %180

; <label>:168:                                    ; preds = %153
  %pgocount7 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_scfsi_calc, i64 0, i64 12)
  %169 = add i64 %pgocount7, 1
  store i64 %169, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_scfsi_calc, i64 0, i64 12)
  %170 = load [2 x %struct.III_scalefac_t]*, [2 x %struct.III_scalefac_t]** %6, align 8
  %171 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %170, i64 1
  %172 = load i32, i32* %4, align 4
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %171, i64 0, i64 %173
  %175 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %174, i32 0, i32 0
  %176 = load i32, i32* %12, align 4
  %177 = sext i32 %176 to i64
  %178 = getelementptr inbounds [22 x i32], [22 x i32]* %175, i64 0, i64 %177
  %179 = load i32, i32* %178, align 4
  store i32 %179, i32* %8, align 4
  br label %180

; <label>:180:                                    ; preds = %168, %153
  %pgocount8 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_scfsi_calc, i64 0, i64 5)
  %181 = add i64 %pgocount8, 1
  store i64 %181, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_scfsi_calc, i64 0, i64 5)
  br label %182

; <label>:182:                                    ; preds = %180, %151
  %183 = load i32, i32* %12, align 4
  %184 = add nsw i32 %183, 1
  store i32 %184, i32* %12, align 4
  br label %136

; <label>:185:                                    ; preds = %136
  store i32 0, i32* %11, align 4
  store i32 0, i32* %9, align 4
  br label %186

; <label>:186:                                    ; preds = %232, %185
  %187 = load i32, i32* %12, align 4
  %188 = icmp slt i32 %187, 21
  br i1 %188, label %189, label %235

; <label>:189:                                    ; preds = %186
  %190 = load [2 x %struct.III_scalefac_t]*, [2 x %struct.III_scalefac_t]** %6, align 8
  %191 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %190, i64 1
  %192 = load i32, i32* %4, align 4
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %191, i64 0, i64 %193
  %195 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %194, i32 0, i32 0
  %196 = load i32, i32* %12, align 4
  %197 = sext i32 %196 to i64
  %198 = getelementptr inbounds [22 x i32], [22 x i32]* %195, i64 0, i64 %197
  %199 = load i32, i32* %198, align 4
  %200 = icmp slt i32 %199, 0
  br i1 %200, label %201, label %203

; <label>:201:                                    ; preds = %189
  %pgocount9 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_scfsi_calc, i64 0, i64 11)
  %202 = add i64 %pgocount9, 1
  store i64 %202, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_scfsi_calc, i64 0, i64 11)
  br label %232

; <label>:203:                                    ; preds = %189
  %204 = load i32, i32* %11, align 4
  %205 = add nsw i32 %204, 1
  store i32 %205, i32* %11, align 4
  %206 = load i32, i32* %9, align 4
  %207 = load [2 x %struct.III_scalefac_t]*, [2 x %struct.III_scalefac_t]** %6, align 8
  %208 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %207, i64 1
  %209 = load i32, i32* %4, align 4
  %210 = sext i32 %209 to i64
  %211 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %208, i64 0, i64 %210
  %212 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %211, i32 0, i32 0
  %213 = load i32, i32* %12, align 4
  %214 = sext i32 %213 to i64
  %215 = getelementptr inbounds [22 x i32], [22 x i32]* %212, i64 0, i64 %214
  %216 = load i32, i32* %215, align 4
  %217 = icmp slt i32 %206, %216
  br i1 %217, label %218, label %230

; <label>:218:                                    ; preds = %203
  %pgocount10 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_scfsi_calc, i64 0, i64 13)
  %219 = add i64 %pgocount10, 1
  store i64 %219, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_scfsi_calc, i64 0, i64 13)
  %220 = load [2 x %struct.III_scalefac_t]*, [2 x %struct.III_scalefac_t]** %6, align 8
  %221 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %220, i64 1
  %222 = load i32, i32* %4, align 4
  %223 = sext i32 %222 to i64
  %224 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %221, i64 0, i64 %223
  %225 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %224, i32 0, i32 0
  %226 = load i32, i32* %12, align 4
  %227 = sext i32 %226 to i64
  %228 = getelementptr inbounds [22 x i32], [22 x i32]* %225, i64 0, i64 %227
  %229 = load i32, i32* %228, align 4
  store i32 %229, i32* %9, align 4
  br label %230

; <label>:230:                                    ; preds = %218, %203
  %pgocount11 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_scfsi_calc, i64 0, i64 6)
  %231 = add i64 %pgocount11, 1
  store i64 %231, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_scfsi_calc, i64 0, i64 6)
  br label %232

; <label>:232:                                    ; preds = %230, %201
  %233 = load i32, i32* %12, align 4
  %234 = add nsw i32 %233, 1
  store i32 %234, i32* %12, align 4
  br label %186

; <label>:235:                                    ; preds = %186
  store i32 0, i32* %7, align 4
  br label %236

; <label>:236:                                    ; preds = %284, %235
  %237 = load i32, i32* %7, align 4
  %238 = icmp slt i32 %237, 16
  br i1 %238, label %239, label %288

; <label>:239:                                    ; preds = %236
  %240 = load i32, i32* %8, align 4
  %241 = load i32, i32* %7, align 4
  %242 = sext i32 %241 to i64
  %243 = getelementptr inbounds [16 x i32], [16 x i32]* @scfsi_calc.slen1_n, i64 0, i64 %242
  %244 = load i32, i32* %243, align 4
  %245 = icmp slt i32 %240, %244
  br i1 %245, label %246, label %283

; <label>:246:                                    ; preds = %239
  %pgocount12 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_scfsi_calc, i64 0, i64 8)
  %247 = add i64 %pgocount12, 1
  store i64 %247, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_scfsi_calc, i64 0, i64 8)
  %248 = load i32, i32* %9, align 4
  %249 = load i32, i32* %7, align 4
  %250 = sext i32 %249 to i64
  %251 = getelementptr inbounds [16 x i32], [16 x i32]* @scfsi_calc.slen2_n, i64 0, i64 %250
  %252 = load i32, i32* %251, align 4
  %253 = icmp slt i32 %248, %252
  br i1 %253, label %254, label %283

; <label>:254:                                    ; preds = %246
  %255 = load i32, i32* %7, align 4
  %256 = sext i32 %255 to i64
  %257 = getelementptr inbounds [16 x i32], [16 x i32]* @scfsi_calc.slen1_tab, i64 0, i64 %256
  %258 = load i32, i32* %257, align 4
  %259 = load i32, i32* %10, align 4
  %260 = mul nsw i32 %258, %259
  %261 = load i32, i32* %7, align 4
  %262 = sext i32 %261 to i64
  %263 = getelementptr inbounds [16 x i32], [16 x i32]* @scfsi_calc.slen2_tab, i64 0, i64 %262
  %264 = load i32, i32* %263, align 4
  %265 = load i32, i32* %11, align 4
  %266 = mul nsw i32 %264, %265
  %267 = add nsw i32 %260, %266
  store i32 %267, i32* %14, align 4
  %268 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %269 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %268, i32 0, i32 15
  %270 = load i32, i32* %269, align 4
  %271 = load i32, i32* %14, align 4
  %272 = icmp sgt i32 %270, %271
  br i1 %272, label %273, label %281

; <label>:273:                                    ; preds = %254
  %pgocount13 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_scfsi_calc, i64 0, i64 15)
  %274 = add i64 %pgocount13, 1
  store i64 %274, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_scfsi_calc, i64 0, i64 15)
  %275 = load i32, i32* %14, align 4
  %276 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %277 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %276, i32 0, i32 15
  store i32 %275, i32* %277, align 4
  %278 = load i32, i32* %7, align 4
  %279 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %280 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %279, i32 0, i32 4
  store i32 %278, i32* %280, align 8
  br label %281

; <label>:281:                                    ; preds = %273, %254
  %pgocount14 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_scfsi_calc, i64 0, i64 14)
  %282 = add i64 %pgocount14, 1
  store i64 %282, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_scfsi_calc, i64 0, i64 14)
  br label %283

; <label>:283:                                    ; preds = %281, %246, %239
  br label %284

; <label>:284:                                    ; preds = %283
  %pgocount15 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_scfsi_calc, i64 0, i64 4)
  %285 = add i64 %pgocount15, 1
  store i64 %285, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_scfsi_calc, i64 0, i64 4)
  %286 = load i32, i32* %7, align 4
  %287 = add nsw i32 %286, 1
  store i32 %287, i32* %7, align 4
  br label %236

; <label>:288:                                    ; preds = %236
  %pgocount16 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_scfsi_calc, i64 0, i64 16)
  %289 = add i64 %pgocount16, 1
  store i64 %289, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_tmp1.ll_scfsi_calc, i64 0, i64 16)
  ret void
}

; Function Attrs: nounwind uwtable
define internal i32 @ix_max(i32*, i32*) #0 {
  %3 = alloca i32*, align 8
  %4 = alloca i32*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  store i32* %0, i32** %3, align 8
  store i32* %1, i32** %4, align 8
  store i32 0, i32* %5, align 4
  br label %7

; <label>:7:                                      ; preds = %31, %2
  %8 = load i32*, i32** %3, align 8
  %9 = load i32*, i32** %4, align 8
  %10 = icmp ult i32* %8, %9
  br i1 %10, label %11, label %33

; <label>:11:                                     ; preds = %7
  %12 = load i32*, i32** %3, align 8
  %13 = getelementptr inbounds i32, i32* %12, i32 1
  store i32* %13, i32** %3, align 8
  %14 = load i32, i32* %12, align 4
  store i32 %14, i32* %6, align 4
  %15 = load i32, i32* %5, align 4
  %16 = load i32, i32* %6, align 4
  %17 = icmp slt i32 %15, %16
  br i1 %17, label %18, label %21

; <label>:18:                                     ; preds = %11
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_ix_max, i64 0, i64 1)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_ix_max, i64 0, i64 1)
  %20 = load i32, i32* %6, align 4
  store i32 %20, i32* %5, align 4
  br label %21

; <label>:21:                                     ; preds = %18, %11
  %22 = load i32*, i32** %3, align 8
  %23 = getelementptr inbounds i32, i32* %22, i32 1
  store i32* %23, i32** %3, align 8
  %24 = load i32, i32* %22, align 4
  store i32 %24, i32* %6, align 4
  %25 = load i32, i32* %5, align 4
  %26 = load i32, i32* %6, align 4
  %27 = icmp slt i32 %25, %26
  br i1 %27, label %28, label %31

; <label>:28:                                     ; preds = %21
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_ix_max, i64 0, i64 2)
  %29 = add i64 %pgocount1, 1
  store i64 %29, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_ix_max, i64 0, i64 2)
  %30 = load i32, i32* %6, align 4
  store i32 %30, i32* %5, align 4
  br label %31

; <label>:31:                                     ; preds = %28, %21
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_ix_max, i64 0, i64 0)
  %32 = add i64 %pgocount2, 1
  store i64 %32, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_ix_max, i64 0, i64 0)
  br label %7

; <label>:33:                                     ; preds = %7
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_ix_max, i64 0, i64 3)
  %34 = add i64 %pgocount3, 1
  store i64 %34, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_ix_max, i64 0, i64 3)
  %35 = load i32, i32* %5, align 4
  ret i32 %35
}

; Function Attrs: nounwind uwtable
define internal i32 @count_bit_short_noESC(i32*, i32*, i32) #0 {
  %4 = alloca i32*, align 8
  %5 = alloca i32*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %10 = alloca i32*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  store i32* %0, i32** %4, align 8
  store i32* %1, i32** %5, align 8
  store i32 %2, i32* %6, align 4
  store i32 0, i32* %7, align 4
  store i32 0, i32* %8, align 4
  %14 = load i32, i32* %6, align 4
  %15 = zext i32 %14 to i64
  %16 = getelementptr inbounds [34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 %15
  %17 = getelementptr inbounds %struct.huffcodetab, %struct.huffcodetab* %16, i32 0, i32 3
  %18 = load i8*, i8** %17, align 8
  store i8* %18, i8** %9, align 8
  store i32* getelementptr inbounds ([288 x i32], [288 x i32]* @cb_esc_buf, i32 0, i32 0), i32** %10, align 8
  br label %19

; <label>:19:                                     ; preds = %68, %3
  store i32 0, i32* %11, align 4
  br label %20

; <label>:20:                                     ; preds = %60, %19
  %21 = load i32, i32* %11, align 4
  %22 = icmp slt i32 %21, 3
  br i1 %22, label %23, label %64

; <label>:23:                                     ; preds = %20
  %24 = load i32*, i32** %4, align 8
  %25 = getelementptr inbounds i32, i32* %24, i64 3
  %26 = load i32, i32* %25, align 4
  store i32 %26, i32* %12, align 4
  %27 = load i32*, i32** %4, align 8
  %28 = getelementptr inbounds i32, i32* %27, i32 1
  store i32* %28, i32** %4, align 8
  %29 = load i32, i32* %27, align 4
  store i32 %29, i32* %13, align 4
  %30 = load i32, i32* %13, align 4
  %31 = icmp ne i32 %30, 0
  br i1 %31, label %32, label %38

; <label>:32:                                     ; preds = %23
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_count_bit_short_noESC, i64 0, i64 1)
  %33 = add i64 %pgocount, 1
  store i64 %33, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_count_bit_short_noESC, i64 0, i64 1)
  %34 = load i32, i32* %8, align 4
  %35 = add nsw i32 %34, 1
  store i32 %35, i32* %8, align 4
  %36 = load i32, i32* %13, align 4
  %37 = mul nsw i32 %36, 16
  store i32 %37, i32* %13, align 4
  br label %38

; <label>:38:                                     ; preds = %32, %23
  %39 = load i32, i32* %12, align 4
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %41, label %48

; <label>:41:                                     ; preds = %38
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_count_bit_short_noESC, i64 0, i64 2)
  %42 = add i64 %pgocount1, 1
  store i64 %42, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_count_bit_short_noESC, i64 0, i64 2)
  %43 = load i32, i32* %8, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, i32* %8, align 4
  %45 = load i32, i32* %12, align 4
  %46 = load i32, i32* %13, align 4
  %47 = add nsw i32 %46, %45
  store i32 %47, i32* %13, align 4
  br label %48

; <label>:48:                                     ; preds = %41, %38
  %49 = load i32, i32* %13, align 4
  %50 = load i32*, i32** %10, align 8
  %51 = getelementptr inbounds i32, i32* %50, i32 1
  store i32* %51, i32** %10, align 8
  store i32 %49, i32* %50, align 4
  %52 = load i8*, i8** %9, align 8
  %53 = load i32, i32* %13, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds i8, i8* %52, i64 %54
  %56 = load i8, i8* %55, align 1
  %57 = zext i8 %56 to i32
  %58 = load i32, i32* %7, align 4
  %59 = add nsw i32 %58, %57
  store i32 %59, i32* %7, align 4
  br label %60

; <label>:60:                                     ; preds = %48
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_count_bit_short_noESC, i64 0, i64 0)
  %61 = add i64 %pgocount2, 1
  store i64 %61, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_count_bit_short_noESC, i64 0, i64 0)
  %62 = load i32, i32* %11, align 4
  %63 = add nsw i32 %62, 1
  store i32 %63, i32* %11, align 4
  br label %20

; <label>:64:                                     ; preds = %20
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_count_bit_short_noESC, i64 0, i64 3)
  %65 = add i64 %pgocount3, 1
  store i64 %65, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_count_bit_short_noESC, i64 0, i64 3)
  %66 = load i32*, i32** %4, align 8
  %67 = getelementptr inbounds i32, i32* %66, i64 3
  store i32* %67, i32** %4, align 8
  br label %68

; <label>:68:                                     ; preds = %64
  %69 = load i32*, i32** %4, align 8
  %70 = load i32*, i32** %5, align 8
  %71 = icmp ult i32* %69, %70
  br i1 %71, label %19, label %72

; <label>:72:                                     ; preds = %68
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_count_bit_short_noESC, i64 0, i64 4)
  %73 = add i64 %pgocount4, 1
  store i64 %73, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_tmp1.ll_count_bit_short_noESC, i64 0, i64 4)
  %74 = load i32, i32* %8, align 4
  store i32 %74, i32* @cb_esc_sign, align 4
  %75 = load i32*, i32** %10, align 8
  store i32* %75, i32** @cb_esc_end, align 8
  %76 = load i32, i32* %7, align 4
  %77 = load i32, i32* %8, align 4
  %78 = add nsw i32 %76, %77
  ret i32 %78
}

; Function Attrs: nounwind uwtable
define internal i32 @count_bit_noESC2(i32) #0 {
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca i32*, align 8
  store i32 %0, i32* %2, align 4
  %5 = load i32, i32* @cb_esc_sign, align 4
  store i32 %5, i32* %3, align 4
  store i32* getelementptr inbounds ([288 x i32], [288 x i32]* @cb_esc_buf, i32 0, i32 0), i32** %4, align 8
  br label %6

; <label>:6:                                      ; preds = %22, %1
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_count_bit_noESC2, i64 0, i64 0)
  %7 = add i64 %pgocount, 1
  store i64 %7, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_count_bit_noESC2, i64 0, i64 0)
  %8 = load i32, i32* %2, align 4
  %9 = zext i32 %8 to i64
  %10 = getelementptr inbounds [34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 %9
  %11 = getelementptr inbounds %struct.huffcodetab, %struct.huffcodetab* %10, i32 0, i32 3
  %12 = load i8*, i8** %11, align 8
  %13 = load i32*, i32** %4, align 8
  %14 = getelementptr inbounds i32, i32* %13, i32 1
  store i32* %14, i32** %4, align 8
  %15 = load i32, i32* %13, align 4
  %16 = sext i32 %15 to i64
  %17 = getelementptr inbounds i8, i8* %12, i64 %16
  %18 = load i8, i8* %17, align 1
  %19 = zext i8 %18 to i32
  %20 = load i32, i32* %3, align 4
  %21 = add nsw i32 %20, %19
  store i32 %21, i32* %3, align 4
  br label %22

; <label>:22:                                     ; preds = %6
  %23 = load i32*, i32** %4, align 8
  %24 = load i32*, i32** @cb_esc_end, align 8
  %25 = icmp ult i32* %23, %24
  br i1 %25, label %6, label %26

; <label>:26:                                     ; preds = %22
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_count_bit_noESC2, i64 0, i64 1)
  %27 = add i64 %pgocount1, 1
  store i64 %27, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_count_bit_noESC2, i64 0, i64 1)
  %28 = load i32, i32* %3, align 4
  ret i32 %28
}

; Function Attrs: nounwind uwtable
define internal i32 @count_bit_short_ESC(i32*, i32*, i32, i32, i32*) #0 {
  %6 = alloca i32*, align 8
  %7 = alloca i32*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  %18 = alloca i32, align 4
  store i32* %0, i32** %6, align 8
  store i32* %1, i32** %7, align 8
  store i32 %2, i32* %8, align 4
  store i32 %3, i32* %9, align 4
  store i32* %4, i32** %10, align 8
  %19 = load i32, i32* %8, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 %20
  %22 = getelementptr inbounds %struct.huffcodetab, %struct.huffcodetab* %21, i32 0, i32 0
  %23 = load i32, i32* %22, align 8
  store i32 %23, i32* %11, align 4
  %24 = load i32, i32* %9, align 4
  %25 = sext i32 %24 to i64
  %26 = getelementptr inbounds [34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 %25
  %27 = getelementptr inbounds %struct.huffcodetab, %struct.huffcodetab* %26, i32 0, i32 0
  %28 = load i32, i32* %27, align 8
  store i32 %28, i32* %12, align 4
  store i32 0, i32* %13, align 4
  store i32 0, i32* %14, align 4
  store i32 0, i32* %15, align 4
  br label %29

; <label>:29:                                     ; preds = %105, %5
  store i32 0, i32* %16, align 4
  br label %30

; <label>:30:                                     ; preds = %97, %29
  %31 = load i32, i32* %16, align 4
  %32 = icmp slt i32 %31, 3
  br i1 %32, label %33, label %101

; <label>:33:                                     ; preds = %30
  %34 = load i32*, i32** %6, align 8
  %35 = getelementptr inbounds i32, i32* %34, i64 3
  %36 = load i32, i32* %35, align 4
  store i32 %36, i32* %17, align 4
  %37 = load i32*, i32** %6, align 8
  %38 = getelementptr inbounds i32, i32* %37, i32 1
  store i32* %38, i32** %6, align 8
  %39 = load i32, i32* %37, align 4
  store i32 %39, i32* %18, align 4
  %40 = load i32, i32* %18, align 4
  %41 = icmp ne i32 %40, 0
  br i1 %41, label %42, label %59

; <label>:42:                                     ; preds = %33
  %43 = load i32, i32* %13, align 4
  %44 = add nsw i32 %43, 1
  store i32 %44, i32* %13, align 4
  %45 = load i32, i32* %18, align 4
  %46 = icmp sgt i32 %45, 14
  br i1 %46, label %47, label %55

; <label>:47:                                     ; preds = %42
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_count_bit_short_ESC, i64 0, i64 3)
  %48 = add i64 %pgocount, 1
  store i64 %48, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_count_bit_short_ESC, i64 0, i64 3)
  store i32 15, i32* %18, align 4
  %49 = load i32, i32* %11, align 4
  %50 = load i32, i32* %14, align 4
  %51 = add nsw i32 %50, %49
  store i32 %51, i32* %14, align 4
  %52 = load i32, i32* %12, align 4
  %53 = load i32, i32* %15, align 4
  %54 = add nsw i32 %53, %52
  store i32 %54, i32* %15, align 4
  br label %55

; <label>:55:                                     ; preds = %47, %42
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_count_bit_short_ESC, i64 0, i64 1)
  %56 = add i64 %pgocount1, 1
  store i64 %56, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_count_bit_short_ESC, i64 0, i64 1)
  %57 = load i32, i32* %18, align 4
  %58 = mul nsw i32 %57, 16
  store i32 %58, i32* %18, align 4
  br label %59

; <label>:59:                                     ; preds = %55, %33
  %60 = load i32, i32* %17, align 4
  %61 = icmp ne i32 %60, 0
  br i1 %61, label %62, label %80

; <label>:62:                                     ; preds = %59
  %63 = load i32, i32* %13, align 4
  %64 = add nsw i32 %63, 1
  store i32 %64, i32* %13, align 4
  %65 = load i32, i32* %17, align 4
  %66 = icmp sgt i32 %65, 14
  br i1 %66, label %67, label %75

; <label>:67:                                     ; preds = %62
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_count_bit_short_ESC, i64 0, i64 4)
  %68 = add i64 %pgocount2, 1
  store i64 %68, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_count_bit_short_ESC, i64 0, i64 4)
  store i32 15, i32* %17, align 4
  %69 = load i32, i32* %11, align 4
  %70 = load i32, i32* %14, align 4
  %71 = add nsw i32 %70, %69
  store i32 %71, i32* %14, align 4
  %72 = load i32, i32* %12, align 4
  %73 = load i32, i32* %15, align 4
  %74 = add nsw i32 %73, %72
  store i32 %74, i32* %15, align 4
  br label %75

; <label>:75:                                     ; preds = %67, %62
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_count_bit_short_ESC, i64 0, i64 2)
  %76 = add i64 %pgocount3, 1
  store i64 %76, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_count_bit_short_ESC, i64 0, i64 2)
  %77 = load i32, i32* %17, align 4
  %78 = load i32, i32* %18, align 4
  %79 = add nsw i32 %78, %77
  store i32 %79, i32* %18, align 4
  br label %80

; <label>:80:                                     ; preds = %75, %59
  %81 = load i8*, i8** getelementptr inbounds ([34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 16, i32 3), align 16
  %82 = load i32, i32* %18, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i8, i8* %81, i64 %83
  %85 = load i8, i8* %84, align 1
  %86 = zext i8 %85 to i32
  %87 = load i32, i32* %14, align 4
  %88 = add nsw i32 %87, %86
  store i32 %88, i32* %14, align 4
  %89 = load i8*, i8** getelementptr inbounds ([34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 24, i32 3), align 16
  %90 = load i32, i32* %18, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i8, i8* %89, i64 %91
  %93 = load i8, i8* %92, align 1
  %94 = zext i8 %93 to i32
  %95 = load i32, i32* %15, align 4
  %96 = add nsw i32 %95, %94
  store i32 %96, i32* %15, align 4
  br label %97

; <label>:97:                                     ; preds = %80
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_count_bit_short_ESC, i64 0, i64 0)
  %98 = add i64 %pgocount4, 1
  store i64 %98, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_count_bit_short_ESC, i64 0, i64 0)
  %99 = load i32, i32* %16, align 4
  %100 = add nsw i32 %99, 1
  store i32 %100, i32* %16, align 4
  br label %30

; <label>:101:                                    ; preds = %30
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_count_bit_short_ESC, i64 0, i64 5)
  %102 = add i64 %pgocount5, 1
  store i64 %102, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_count_bit_short_ESC, i64 0, i64 5)
  %103 = load i32*, i32** %6, align 8
  %104 = getelementptr inbounds i32, i32* %103, i64 3
  store i32* %104, i32** %6, align 8
  br label %105

; <label>:105:                                    ; preds = %101
  %106 = load i32*, i32** %6, align 8
  %107 = load i32*, i32** %7, align 8
  %108 = icmp ult i32* %106, %107
  br i1 %108, label %29, label %109

; <label>:109:                                    ; preds = %105
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_count_bit_short_ESC, i64 0, i64 6)
  %110 = add i64 %pgocount6, 1
  store i64 %110, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_count_bit_short_ESC, i64 0, i64 6)
  %111 = load i32, i32* %14, align 4
  %112 = load i32, i32* %15, align 4
  %113 = icmp sgt i32 %111, %112
  br i1 %113, label %114, label %118

; <label>:114:                                    ; preds = %109
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_count_bit_short_ESC, i64 0, i64 7)
  %115 = add i64 %pgocount7, 1
  store i64 %115, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_tmp1.ll_count_bit_short_ESC, i64 0, i64 7)
  %116 = load i32, i32* %15, align 4
  store i32 %116, i32* %14, align 4
  %117 = load i32, i32* %9, align 4
  store i32 %117, i32* %8, align 4
  br label %118

; <label>:118:                                    ; preds = %114, %109
  %119 = load i32, i32* %13, align 4
  %120 = load i32, i32* %14, align 4
  %121 = add nsw i32 %119, %120
  %122 = load i32*, i32** %10, align 8
  %123 = load i32, i32* %122, align 4
  %124 = add nsw i32 %123, %121
  store i32 %124, i32* %122, align 4
  %125 = load i32, i32* %8, align 4
  ret i32 %125
}

; Function Attrs: nounwind uwtable
define internal i32 @count_bit_noESC(i32*, i32*, i32) #0 {
  %4 = alloca i32*, align 8
  %5 = alloca i32*, align 8
  %6 = alloca i32, align 4
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca i8*, align 8
  %10 = alloca i32*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  store i32* %0, i32** %4, align 8
  store i32* %1, i32** %5, align 8
  store i32 %2, i32* %6, align 4
  store i32 0, i32* %7, align 4
  store i32 0, i32* %8, align 4
  %13 = load i32, i32* %6, align 4
  %14 = zext i32 %13 to i64
  %15 = getelementptr inbounds [34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 %14
  %16 = getelementptr inbounds %struct.huffcodetab, %struct.huffcodetab* %15, i32 0, i32 3
  %17 = load i8*, i8** %16, align 8
  store i8* %17, i8** %9, align 8
  store i32* getelementptr inbounds ([288 x i32], [288 x i32]* @cb_esc_buf, i32 0, i32 0), i32** %10, align 8
  br label %18

; <label>:18:                                     ; preds = %56, %3
  %19 = load i32*, i32** %4, align 8
  %20 = getelementptr inbounds i32, i32* %19, i32 1
  store i32* %20, i32** %4, align 8
  %21 = load i32, i32* %19, align 4
  store i32 %21, i32* %11, align 4
  %22 = load i32*, i32** %4, align 8
  %23 = getelementptr inbounds i32, i32* %22, i32 1
  store i32* %23, i32** %4, align 8
  %24 = load i32, i32* %22, align 4
  store i32 %24, i32* %12, align 4
  %25 = load i32, i32* %11, align 4
  %26 = icmp ne i32 %25, 0
  br i1 %26, label %27, label %33

; <label>:27:                                     ; preds = %18
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_count_bit_noESC, i64 0, i64 1)
  %28 = add i64 %pgocount, 1
  store i64 %28, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_count_bit_noESC, i64 0, i64 1)
  %29 = load i32, i32* %8, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, i32* %8, align 4
  %31 = load i32, i32* %11, align 4
  %32 = mul nsw i32 %31, 16
  store i32 %32, i32* %11, align 4
  br label %33

; <label>:33:                                     ; preds = %27, %18
  %34 = load i32, i32* %12, align 4
  %35 = icmp ne i32 %34, 0
  br i1 %35, label %36, label %43

; <label>:36:                                     ; preds = %33
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_count_bit_noESC, i64 0, i64 2)
  %37 = add i64 %pgocount1, 1
  store i64 %37, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_count_bit_noESC, i64 0, i64 2)
  %38 = load i32, i32* %8, align 4
  %39 = add nsw i32 %38, 1
  store i32 %39, i32* %8, align 4
  %40 = load i32, i32* %12, align 4
  %41 = load i32, i32* %11, align 4
  %42 = add nsw i32 %41, %40
  store i32 %42, i32* %11, align 4
  br label %43

; <label>:43:                                     ; preds = %36, %33
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_count_bit_noESC, i64 0, i64 0)
  %44 = add i64 %pgocount2, 1
  store i64 %44, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_count_bit_noESC, i64 0, i64 0)
  %45 = load i32, i32* %11, align 4
  %46 = load i32*, i32** %10, align 8
  %47 = getelementptr inbounds i32, i32* %46, i32 1
  store i32* %47, i32** %10, align 8
  store i32 %45, i32* %46, align 4
  %48 = load i8*, i8** %9, align 8
  %49 = load i32, i32* %11, align 4
  %50 = sext i32 %49 to i64
  %51 = getelementptr inbounds i8, i8* %48, i64 %50
  %52 = load i8, i8* %51, align 1
  %53 = zext i8 %52 to i32
  %54 = load i32, i32* %7, align 4
  %55 = add nsw i32 %54, %53
  store i32 %55, i32* %7, align 4
  br label %56

; <label>:56:                                     ; preds = %43
  %57 = load i32*, i32** %4, align 8
  %58 = load i32*, i32** %5, align 8
  %59 = icmp ult i32* %57, %58
  br i1 %59, label %18, label %60

; <label>:60:                                     ; preds = %56
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_count_bit_noESC, i64 0, i64 3)
  %61 = add i64 %pgocount3, 1
  store i64 %61, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_count_bit_noESC, i64 0, i64 3)
  %62 = load i32, i32* %8, align 4
  store i32 %62, i32* @cb_esc_sign, align 4
  %63 = load i32*, i32** %10, align 8
  store i32* %63, i32** @cb_esc_end, align 8
  %64 = load i32, i32* %7, align 4
  %65 = load i32, i32* %8, align 4
  %66 = add nsw i32 %64, %65
  ret i32 %66
}

; Function Attrs: nounwind uwtable
define internal i32 @count_bit_ESC(i32*, i32*, i32, i32, i32*) #0 {
  %6 = alloca i32*, align 8
  %7 = alloca i32*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i32, align 4
  %15 = alloca i32, align 4
  %16 = alloca i32, align 4
  %17 = alloca i32, align 4
  store i32* %0, i32** %6, align 8
  store i32* %1, i32** %7, align 8
  store i32 %2, i32* %8, align 4
  store i32 %3, i32* %9, align 4
  store i32* %4, i32** %10, align 8
  %18 = load i32, i32* %8, align 4
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds [34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 %19
  %21 = getelementptr inbounds %struct.huffcodetab, %struct.huffcodetab* %20, i32 0, i32 0
  %22 = load i32, i32* %21, align 8
  store i32 %22, i32* %11, align 4
  %23 = load i32, i32* %9, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 %24
  %26 = getelementptr inbounds %struct.huffcodetab, %struct.huffcodetab* %25, i32 0, i32 0
  %27 = load i32, i32* %26, align 8
  store i32 %27, i32* %12, align 4
  store i32 0, i32* %13, align 4
  store i32 0, i32* %14, align 4
  store i32 0, i32* %15, align 4
  br label %28

; <label>:28:                                     ; preds = %79, %5
  %29 = load i32*, i32** %6, align 8
  %30 = load i32*, i32** %7, align 8
  %31 = icmp ult i32* %29, %30
  br i1 %31, label %32, label %97

; <label>:32:                                     ; preds = %28
  %33 = load i32*, i32** %6, align 8
  %34 = getelementptr inbounds i32, i32* %33, i32 1
  store i32* %34, i32** %6, align 8
  %35 = load i32, i32* %33, align 4
  store i32 %35, i32* %16, align 4
  %36 = load i32*, i32** %6, align 8
  %37 = getelementptr inbounds i32, i32* %36, i32 1
  store i32* %37, i32** %6, align 8
  %38 = load i32, i32* %36, align 4
  store i32 %38, i32* %17, align 4
  %39 = load i32, i32* %16, align 4
  %40 = icmp ne i32 %39, 0
  br i1 %40, label %41, label %58

; <label>:41:                                     ; preds = %32
  %42 = load i32, i32* %13, align 4
  %43 = add nsw i32 %42, 1
  store i32 %43, i32* %13, align 4
  %44 = load i32, i32* %16, align 4
  %45 = icmp sgt i32 %44, 14
  br i1 %45, label %46, label %54

; <label>:46:                                     ; preds = %41
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_count_bit_ESC, i64 0, i64 3)
  %47 = add i64 %pgocount, 1
  store i64 %47, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_count_bit_ESC, i64 0, i64 3)
  store i32 15, i32* %16, align 4
  %48 = load i32, i32* %11, align 4
  %49 = load i32, i32* %14, align 4
  %50 = add nsw i32 %49, %48
  store i32 %50, i32* %14, align 4
  %51 = load i32, i32* %12, align 4
  %52 = load i32, i32* %15, align 4
  %53 = add nsw i32 %52, %51
  store i32 %53, i32* %15, align 4
  br label %54

; <label>:54:                                     ; preds = %46, %41
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_count_bit_ESC, i64 0, i64 1)
  %55 = add i64 %pgocount1, 1
  store i64 %55, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_count_bit_ESC, i64 0, i64 1)
  %56 = load i32, i32* %16, align 4
  %57 = mul nsw i32 %56, 16
  store i32 %57, i32* %16, align 4
  br label %58

; <label>:58:                                     ; preds = %54, %32
  %59 = load i32, i32* %17, align 4
  %60 = icmp ne i32 %59, 0
  br i1 %60, label %61, label %79

; <label>:61:                                     ; preds = %58
  %62 = load i32, i32* %13, align 4
  %63 = add nsw i32 %62, 1
  store i32 %63, i32* %13, align 4
  %64 = load i32, i32* %17, align 4
  %65 = icmp sgt i32 %64, 14
  br i1 %65, label %66, label %74

; <label>:66:                                     ; preds = %61
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_count_bit_ESC, i64 0, i64 4)
  %67 = add i64 %pgocount2, 1
  store i64 %67, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_count_bit_ESC, i64 0, i64 4)
  store i32 15, i32* %17, align 4
  %68 = load i32, i32* %11, align 4
  %69 = load i32, i32* %14, align 4
  %70 = add nsw i32 %69, %68
  store i32 %70, i32* %14, align 4
  %71 = load i32, i32* %12, align 4
  %72 = load i32, i32* %15, align 4
  %73 = add nsw i32 %72, %71
  store i32 %73, i32* %15, align 4
  br label %74

; <label>:74:                                     ; preds = %66, %61
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_count_bit_ESC, i64 0, i64 2)
  %75 = add i64 %pgocount3, 1
  store i64 %75, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_count_bit_ESC, i64 0, i64 2)
  %76 = load i32, i32* %17, align 4
  %77 = load i32, i32* %16, align 4
  %78 = add nsw i32 %77, %76
  store i32 %78, i32* %16, align 4
  br label %79

; <label>:79:                                     ; preds = %74, %58
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_count_bit_ESC, i64 0, i64 0)
  %80 = add i64 %pgocount4, 1
  store i64 %80, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_count_bit_ESC, i64 0, i64 0)
  %81 = load i8*, i8** getelementptr inbounds ([34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 16, i32 3), align 16
  %82 = load i32, i32* %16, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds i8, i8* %81, i64 %83
  %85 = load i8, i8* %84, align 1
  %86 = zext i8 %85 to i32
  %87 = load i32, i32* %14, align 4
  %88 = add nsw i32 %87, %86
  store i32 %88, i32* %14, align 4
  %89 = load i8*, i8** getelementptr inbounds ([34 x %struct.huffcodetab], [34 x %struct.huffcodetab]* @ht, i64 0, i64 24, i32 3), align 16
  %90 = load i32, i32* %16, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds i8, i8* %89, i64 %91
  %93 = load i8, i8* %92, align 1
  %94 = zext i8 %93 to i32
  %95 = load i32, i32* %15, align 4
  %96 = add nsw i32 %95, %94
  store i32 %96, i32* %15, align 4
  br label %28

; <label>:97:                                     ; preds = %28
  %98 = load i32, i32* %14, align 4
  %99 = load i32, i32* %15, align 4
  %100 = icmp sgt i32 %98, %99
  br i1 %100, label %101, label %105

; <label>:101:                                    ; preds = %97
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_count_bit_ESC, i64 0, i64 6)
  %102 = add i64 %pgocount5, 1
  store i64 %102, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_count_bit_ESC, i64 0, i64 6)
  %103 = load i32, i32* %15, align 4
  store i32 %103, i32* %14, align 4
  %104 = load i32, i32* %9, align 4
  store i32 %104, i32* %8, align 4
  br label %105

; <label>:105:                                    ; preds = %101, %97
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_count_bit_ESC, i64 0, i64 5)
  %106 = add i64 %pgocount6, 1
  store i64 %106, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_tmp1.ll_count_bit_ESC, i64 0, i64 5)
  %107 = load i32, i32* %13, align 4
  %108 = load i32, i32* %14, align 4
  %109 = add nsw i32 %107, %108
  %110 = load i32*, i32** %10, align 8
  %111 = load i32, i32* %110, align 4
  %112 = add nsw i32 %111, %109
  store i32 %112, i32* %110, align 4
  %113 = load i32, i32* %8, align 4
  ret i32 %113
}

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
