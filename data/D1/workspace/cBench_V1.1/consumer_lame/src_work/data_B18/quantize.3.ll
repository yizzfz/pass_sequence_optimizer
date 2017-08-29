; ModuleID = 'quantize.2.ll'
source_filename = "quantize.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.scalefac_struct = type { [23 x i32], [14 x i32] }
%struct.lame_global_flags = type { i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, i8*, i32, i32, float, i32, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, float, i32, i32, i32, float, float, float, float, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.III_psy_ratio = type { %struct.III_psy_xmin, %struct.III_psy_xmin }
%struct.III_psy_xmin = type { [22 x double], [13 x [3 x double]] }
%struct.III_side_info_t = type { i32, i32, i32, [2 x [4 x i32]], [2 x %struct.anon] }
%struct.anon = type { [2 x %struct.gr_info_ss] }
%struct.gr_info_ss = type { %struct.gr_info }
%struct.gr_info = type { i32, i32, i32, i32, i32, i32, i32, i32, [3 x i32], [3 x i32], i32, i32, i32, i32, i32, i32, i32, i32, i32, i32*, [4 x i32] }
%struct.III_scalefac_t = type { [22 x i32], [13 x [3 x i32]] }

$__llvm_profile_raw_version = comdat any

@bitrate_table = external global [2 x [15 x i32]], align 16
@convert_mdct = external global i32, align 4
@reduce_sidechannel = external global i32, align 4
@masking_lower = external global float, align 4
@.str = private unnamed_addr constant [20 x i8] c"this_bits>=min_bits\00", align 1
@.str.1 = private unnamed_addr constant [11 x i8] c"quantize.c\00", align 1
@__PRETTY_FUNCTION__.VBR_iteration_loop = private unnamed_addr constant [171 x i8] c"void VBR_iteration_loop(lame_global_flags *, FLOAT8 (*)[2], FLOAT8 *, FLOAT8 (*)[2][576], III_psy_ratio (*)[2], III_side_info_t *, int (*)[2][576], III_scalefac_t (*)[2])\00", align 1
@.str.2 = private unnamed_addr constant [20 x i8] c"this_bits<=max_bits\00", align 1
@.str.3 = private unnamed_addr constant [42 x i8] c"(int)cod_info->part2_3_length <= max_bits\00", align 1
@.str.4 = private unnamed_addr constant [18 x i8] c"used_bits <= bits\00", align 1
@nr_of_sfb_block = external global [6 x [3 x [4 x i32]]], align 16
@outer_loop.OldValue = internal global [2 x i32] [i32 180, i32 180], align 4
@.str.5 = private unnamed_addr constant [15 x i8] c"iteration != 1\00", align 1
@__PRETTY_FUNCTION__.outer_loop = private unnamed_addr constant [135 x i8] c"void outer_loop(lame_global_flags *, FLOAT8 *, int, FLOAT8 *, III_psy_xmin *, int *, III_scalefac_t *, gr_info *, FLOAT8 (*)[21], int)\00", align 1
@.str.6 = private unnamed_addr constant [28 x i8] c"cod_info->global_gain < 256\00", align 1
@pretab = external global [21 x i32], align 16
@.str.7 = private unnamed_addr constant [8 x i8] c"s<Q_MAX\00", align 1
@__PRETTY_FUNCTION__.calc_noise1 = private unnamed_addr constant [140 x i8] c"int calc_noise1(FLOAT8 *, int *, gr_info *, FLOAT8 (*)[21], FLOAT8 (*)[21], III_psy_xmin *, III_scalefac_t *, FLOAT8 *, FLOAT8 *, FLOAT8 *)\00", align 1
@.str.8 = private unnamed_addr constant [5 x i8] c"s>=0\00", align 1
@pow20 = external global [256 x double], align 16
@scalefac_band = external global %struct.scalefac_struct, align 4
@pow43 = external global [8208 x double], align 16
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_iteration_loop = private constant [14 x i8] c"iteration_loop"
@__profn_init_outer_loop = private constant [15 x i8] c"init_outer_loop"
@__profn_outer_loop = private constant [10 x i8] c"outer_loop"
@__profn_set_masking_lower = private constant [17 x i8] c"set_masking_lower"
@__profn_VBR_iteration_loop = private constant [18 x i8] c"VBR_iteration_loop"
@__profn_VBR_compare = private constant [11 x i8] c"VBR_compare"
@__profn_calc_noise1 = private constant [11 x i8] c"calc_noise1"
@__profn_quant_compare = private constant [13 x i8] c"quant_compare"
@__profn_amp_scalefac_bands = private constant [18 x i8] c"amp_scalefac_bands"
@__profc_iteration_loop = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_iteration_loop = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -897011503384032906, i64 152450501523, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_iteration_loop, i32 0, i32 0), i8* bitcast (void (%struct.lame_global_flags*, [2 x double]*, double*, [2 x [576 x double]]*, [2 x %struct.III_psy_ratio]*, %struct.III_side_info_t*, [2 x [576 x i32]]*, [2 x %struct.III_scalefac_t]*)* @iteration_loop to i8*), i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_init_outer_loop = private global [17 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_init_outer_loop = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3028582535675800398, i64 297674241030, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_init_outer_loop, i32 0, i32 0), i8* bitcast (i32 (%struct.lame_global_flags*, double*, %struct.gr_info*)* @init_outer_loop to i8*), i8* null, i32 17, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_outer_loop = private global [21 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_outer_loop = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8044989971662827367, i64 313750030380, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_outer_loop, i32 0, i32 0), i8* bitcast (void (%struct.lame_global_flags*, double*, i32, double*, %struct.III_psy_xmin*, i32*, %struct.III_scalefac_t*, %struct.gr_info*, [21 x double]*, i32)* @outer_loop to i8*), i8* null, i32 21, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_set_masking_lower = private global [1 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_set_masking_lower = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3926376328996004210, i64 12884901887, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_set_masking_lower, i32 0, i32 0), i8* bitcast (void (i32, i32)* @set_masking_lower to i8*), i8* null, i32 1, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_VBR_iteration_loop = private global [49 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_VBR_iteration_loop = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2068896872582650913, i64 844919475656, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i32 0, i32 0), i8* bitcast (void (%struct.lame_global_flags*, [2 x double]*, double*, [2 x [576 x double]]*, [2 x %struct.III_psy_ratio]*, %struct.III_side_info_t*, [2 x [576 x i32]]*, [2 x %struct.III_scalefac_t]*)* @VBR_iteration_loop to i8*), i8* null, i32 49, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_VBR_compare = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_VBR_compare = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3491065498934428648, i64 39850498994, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_VBR_compare, i32 0, i32 0), i8* bitcast (i32 (i32, double, double, double, i32, double, double, double)* @VBR_compare to i8*), i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_calc_noise1 = private global [19 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_calc_noise1 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7716111570398576773, i64 336135989234, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_calc_noise1, i32 0, i32 0), i8* bitcast (i32 (double*, i32*, %struct.gr_info*, [21 x double]*, [21 x double]*, %struct.III_psy_xmin*, %struct.III_scalefac_t*, double*, double*, double*)* @calc_noise1 to i8*), i8* null, i32 19, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_quant_compare = private global [34 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_quant_compare = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 6789108574024103790, i64 372943951410, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i32 0, i32 0), i8* bitcast (i32 (i32, i32, double, double, double, i32, double, double, double)* @quant_compare to i8*), i8* null, i32 34, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_amp_scalefac_bands = private global [15 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_amp_scalefac_bands = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4371250491629523356, i64 276665882033, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_amp_scalefac_bands, i32 0, i32 0), i8* bitcast (void (double*, %struct.gr_info*, %struct.III_scalefac_t*, [21 x double]*)* @amp_scalefac_bands to i8*), i8* null, i32 15, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [138 x i8] c"\87\01\00iteration_loop\01init_outer_loop\01outer_loop\01set_masking_lower\01VBR_iteration_loop\01VBR_compare\01calc_noise1\01quant_compare\01amp_scalefac_bands", section "__llvm_prf_names"
@llvm.used = appending global [10 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_iteration_loop to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_init_outer_loop to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_outer_loop to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_set_masking_lower to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_VBR_iteration_loop to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_VBR_compare to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_calc_noise1 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_quant_compare to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_amp_scalefac_bands to i8*), i8* getelementptr inbounds ([138 x i8], [138 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define void @iteration_loop(%struct.lame_global_flags*, [2 x double]*, double*, [2 x [576 x double]]*, [2 x %struct.III_psy_ratio]*, %struct.III_side_info_t*, [2 x [576 x i32]]*, [2 x %struct.III_scalefac_t]*) #0 {
  %9 = alloca %struct.lame_global_flags*, align 8
  %10 = alloca [2 x double]*, align 8
  %11 = alloca double*, align 8
  %12 = alloca [2 x [576 x double]]*, align 8
  %13 = alloca [2 x %struct.III_psy_ratio]*, align 8
  %14 = alloca %struct.III_side_info_t*, align 8
  %15 = alloca [2 x [576 x i32]]*, align 8
  %16 = alloca [2 x %struct.III_scalefac_t]*, align 8
  %17 = alloca [4 x [21 x double]], align 16
  %18 = alloca [4 x double], align 16
  %19 = alloca [2 x %struct.III_psy_xmin], align 16
  %20 = alloca %struct.gr_info*, align 8
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca [2 x i32], align 4
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %9, align 8
  store [2 x double]* %1, [2 x double]** %10, align 8
  store double* %2, double** %11, align 8
  store [2 x [576 x double]]* %3, [2 x [576 x double]]** %12, align 8
  store [2 x %struct.III_psy_ratio]* %4, [2 x %struct.III_psy_ratio]** %13, align 8
  store %struct.III_side_info_t* %5, %struct.III_side_info_t** %14, align 8
  store [2 x [576 x i32]]* %6, [2 x [576 x i32]]** %15, align 8
  store [2 x %struct.III_scalefac_t]* %7, [2 x %struct.III_scalefac_t]** %16, align 8
  %28 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %29 = load %struct.III_side_info_t*, %struct.III_side_info_t** %14, align 8
  %30 = load [2 x [576 x i32]]*, [2 x [576 x i32]]** %15, align 8
  call void @iteration_init(%struct.lame_global_flags* %28, %struct.III_side_info_t* %29, [2 x [576 x i32]]* %30)
  %31 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %32 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %31, i32 0, i32 43
  %33 = load i32, i32* %32, align 8
  %34 = sext i32 %33 to i64
  %35 = getelementptr inbounds [2 x [15 x i32]], [2 x [15 x i32]]* @bitrate_table, i64 0, i64 %34
  %36 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %37 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %36, i32 0, i32 50
  %38 = load i32, i32* %37, align 4
  %39 = sext i32 %38 to i64
  %40 = getelementptr inbounds [15 x i32], [15 x i32]* %35, i64 0, i64 %39
  %41 = load i32, i32* %40, align 4
  store i32 %41, i32* %26, align 4
  %42 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  call void @getframebits(%struct.lame_global_flags* %42, i32* %21, i32* %22)
  %43 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %44 = load %struct.III_side_info_t*, %struct.III_side_info_t** %14, align 8
  %45 = load i32, i32* %22, align 4
  %46 = load i32, i32* %21, align 4
  %47 = call i32 @ResvFrameBegin(%struct.lame_global_flags* %43, %struct.III_side_info_t* %44, i32 %45, i32 %46)
  store i32 0, i32* %24, align 4
  br label %48

; <label>:48:                                     ; preds = %273, %8
  %49 = load i32, i32* %24, align 4
  %50 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %51 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %50, i32 0, i32 45
  %52 = load i32, i32* %51, align 8
  %53 = icmp slt i32 %49, %52
  br i1 %53, label %54, label %277

; <label>:54:                                     ; preds = %48
  %55 = load i32, i32* @convert_mdct, align 4
  %56 = icmp ne i32 %55, 0
  br i1 %56, label %57, label %69

; <label>:57:                                     ; preds = %54
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_iteration_loop, i64 0, i64 7)
  %58 = add i64 %pgocount, 1
  store i64 %58, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_iteration_loop, i64 0, i64 7)
  %59 = load [2 x [576 x double]]*, [2 x [576 x double]]** %12, align 8
  %60 = load i32, i32* %24, align 4
  %61 = sext i32 %60 to i64
  %62 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %59, i64 %61
  %63 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %62, i32 0, i32 0
  %64 = load [2 x [576 x double]]*, [2 x [576 x double]]** %12, align 8
  %65 = load i32, i32* %24, align 4
  %66 = sext i32 %65 to i64
  %67 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %64, i64 %66
  %68 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %67, i32 0, i32 0
  call void @ms_convert([576 x double]* %63, [576 x double]* %68)
  br label %69

; <label>:69:                                     ; preds = %57, %54
  %70 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %71 = load [2 x double]*, [2 x double]** %10, align 8
  %72 = load %struct.III_side_info_t*, %struct.III_side_info_t** %14, align 8
  %73 = getelementptr inbounds [2 x i32], [2 x i32]* %27, i32 0, i32 0
  %74 = load i32, i32* %22, align 4
  %75 = load i32, i32* %24, align 4
  call void @on_pe(%struct.lame_global_flags* %70, [2 x double]* %71, %struct.III_side_info_t* %72, i32* %73, i32 %74, i32 %75)
  %76 = load i32, i32* @reduce_sidechannel, align 4
  %77 = icmp ne i32 %76, 0
  br i1 %77, label %78, label %87

; <label>:78:                                     ; preds = %69
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_iteration_loop, i64 0, i64 8)
  %79 = add i64 %pgocount1, 1
  store i64 %79, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_iteration_loop, i64 0, i64 8)
  %80 = getelementptr inbounds [2 x i32], [2 x i32]* %27, i32 0, i32 0
  %81 = load double*, double** %11, align 8
  %82 = load i32, i32* %24, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds double, double* %81, i64 %83
  %85 = load double, double* %84, align 8
  %86 = load i32, i32* %22, align 4
  call void @reduce_side(i32* %80, double %85, i32 %86)
  br label %87

; <label>:87:                                     ; preds = %78, %69
  store i32 0, i32* %23, align 4
  br label %88

; <label>:88:                                     ; preds = %269, %87
  %89 = load i32, i32* %23, align 4
  %90 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %91 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %90, i32 0, i32 46
  %92 = load i32, i32* %91, align 4
  %93 = icmp slt i32 %89, %92
  br i1 %93, label %94, label %272

; <label>:94:                                     ; preds = %88
  %95 = load %struct.III_side_info_t*, %struct.III_side_info_t** %14, align 8
  %96 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %95, i32 0, i32 4
  %97 = load i32, i32* %24, align 4
  %98 = sext i32 %97 to i64
  %99 = getelementptr inbounds [2 x %struct.anon], [2 x %struct.anon]* %96, i64 0, i64 %98
  %100 = getelementptr inbounds %struct.anon, %struct.anon* %99, i32 0, i32 0
  %101 = load i32, i32* %23, align 4
  %102 = sext i32 %101 to i64
  %103 = getelementptr inbounds [2 x %struct.gr_info_ss], [2 x %struct.gr_info_ss]* %100, i64 0, i64 %102
  %104 = getelementptr inbounds %struct.gr_info_ss, %struct.gr_info_ss* %103, i32 0, i32 0
  store %struct.gr_info* %104, %struct.gr_info** %20, align 8
  %105 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %106 = load [2 x [576 x double]]*, [2 x [576 x double]]** %12, align 8
  %107 = load i32, i32* %24, align 4
  %108 = sext i32 %107 to i64
  %109 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %106, i64 %108
  %110 = load i32, i32* %23, align 4
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %109, i64 0, i64 %111
  %113 = getelementptr inbounds [576 x double], [576 x double]* %112, i32 0, i32 0
  %114 = load %struct.gr_info*, %struct.gr_info** %20, align 8
  %115 = call i32 @init_outer_loop(%struct.lame_global_flags* %105, double* %113, %struct.gr_info* %114)
  %116 = icmp ne i32 %115, 0
  br i1 %116, label %140, label %117

; <label>:117:                                    ; preds = %94
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_iteration_loop, i64 0, i64 4)
  %118 = add i64 %pgocount2, 1
  store i64 %118, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_iteration_loop, i64 0, i64 4)
  %119 = load [2 x %struct.III_scalefac_t]*, [2 x %struct.III_scalefac_t]** %16, align 8
  %120 = load i32, i32* %24, align 4
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %119, i64 %121
  %123 = load i32, i32* %23, align 4
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %122, i64 0, i64 %124
  %126 = bitcast %struct.III_scalefac_t* %125 to i8*
  call void @llvm.memset.p0i8.i64(i8* %126, i8 0, i64 244, i32 4, i1 false)
  %127 = load [2 x [576 x i32]]*, [2 x [576 x i32]]** %15, align 8
  %128 = load i32, i32* %24, align 4
  %129 = sext i32 %128 to i64
  %130 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %127, i64 %129
  %131 = load i32, i32* %23, align 4
  %132 = sext i32 %131 to i64
  %133 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %130, i64 0, i64 %132
  %134 = getelementptr inbounds [576 x i32], [576 x i32]* %133, i32 0, i32 0
  %135 = bitcast i32* %134 to i8*
  call void @llvm.memset.p0i8.i64(i8* %135, i8 0, i64 2304, i32 4, i1 false)
  %136 = getelementptr inbounds [4 x double], [4 x double]* %18, i64 0, i64 3
  store double 0.000000e+00, double* %136, align 8
  %137 = getelementptr inbounds [4 x double], [4 x double]* %18, i64 0, i64 2
  store double 0.000000e+00, double* %137, align 16
  %138 = getelementptr inbounds [4 x double], [4 x double]* %18, i64 0, i64 1
  store double 0.000000e+00, double* %138, align 8
  %139 = getelementptr inbounds [4 x double], [4 x double]* %18, i64 0, i64 0
  store double 0.000000e+00, double* %139, align 16
  br label %198

; <label>:140:                                    ; preds = %94
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_iteration_loop, i64 0, i64 2)
  %141 = add i64 %pgocount3, 1
  store i64 %141, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_iteration_loop, i64 0, i64 2)
  %142 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %143 = load [2 x [576 x double]]*, [2 x [576 x double]]** %12, align 8
  %144 = load i32, i32* %24, align 4
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %143, i64 %145
  %147 = load i32, i32* %23, align 4
  %148 = sext i32 %147 to i64
  %149 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %146, i64 0, i64 %148
  %150 = getelementptr inbounds [576 x double], [576 x double]* %149, i32 0, i32 0
  %151 = load [2 x %struct.III_psy_ratio]*, [2 x %struct.III_psy_ratio]** %13, align 8
  %152 = load i32, i32* %24, align 4
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds [2 x %struct.III_psy_ratio], [2 x %struct.III_psy_ratio]* %151, i64 %153
  %155 = load i32, i32* %23, align 4
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds [2 x %struct.III_psy_ratio], [2 x %struct.III_psy_ratio]* %154, i64 0, i64 %156
  %158 = load %struct.gr_info*, %struct.gr_info** %20, align 8
  %159 = load i32, i32* %23, align 4
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds [2 x %struct.III_psy_xmin], [2 x %struct.III_psy_xmin]* %19, i64 0, i64 %160
  %162 = call i32 @calc_xmin(%struct.lame_global_flags* %142, double* %150, %struct.III_psy_ratio* %157, %struct.gr_info* %158, %struct.III_psy_xmin* %161)
  %163 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %164 = load [2 x [576 x double]]*, [2 x [576 x double]]** %12, align 8
  %165 = load i32, i32* %24, align 4
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %164, i64 %166
  %168 = load i32, i32* %23, align 4
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %167, i64 0, i64 %169
  %171 = getelementptr inbounds [576 x double], [576 x double]* %170, i32 0, i32 0
  %172 = load i32, i32* %23, align 4
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds [2 x i32], [2 x i32]* %27, i64 0, i64 %173
  %175 = load i32, i32* %174, align 4
  %176 = getelementptr inbounds [4 x double], [4 x double]* %18, i32 0, i32 0
  %177 = load i32, i32* %23, align 4
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds [2 x %struct.III_psy_xmin], [2 x %struct.III_psy_xmin]* %19, i64 0, i64 %178
  %180 = load [2 x [576 x i32]]*, [2 x [576 x i32]]** %15, align 8
  %181 = load i32, i32* %24, align 4
  %182 = sext i32 %181 to i64
  %183 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %180, i64 %182
  %184 = load i32, i32* %23, align 4
  %185 = sext i32 %184 to i64
  %186 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %183, i64 0, i64 %185
  %187 = getelementptr inbounds [576 x i32], [576 x i32]* %186, i32 0, i32 0
  %188 = load [2 x %struct.III_scalefac_t]*, [2 x %struct.III_scalefac_t]** %16, align 8
  %189 = load i32, i32* %24, align 4
  %190 = sext i32 %189 to i64
  %191 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %188, i64 %190
  %192 = load i32, i32* %23, align 4
  %193 = sext i32 %192 to i64
  %194 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %191, i64 0, i64 %193
  %195 = load %struct.gr_info*, %struct.gr_info** %20, align 8
  %196 = getelementptr inbounds [4 x [21 x double]], [4 x [21 x double]]* %17, i32 0, i32 0
  %197 = load i32, i32* %23, align 4
  call void @outer_loop(%struct.lame_global_flags* %163, double* %171, i32 %175, double* %176, %struct.III_psy_xmin* %179, i32* %187, %struct.III_scalefac_t* %194, %struct.gr_info* %195, [21 x double]* %196, i32 %197)
  br label %198

; <label>:198:                                    ; preds = %140, %117
  %199 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %200 = load i32, i32* %24, align 4
  %201 = load i32, i32* %23, align 4
  %202 = load [2 x [576 x i32]]*, [2 x [576 x i32]]** %15, align 8
  %203 = load %struct.III_side_info_t*, %struct.III_side_info_t** %14, align 8
  %204 = load [2 x %struct.III_scalefac_t]*, [2 x %struct.III_scalefac_t]** %16, align 8
  call void @best_scalefac_store(%struct.lame_global_flags* %199, i32 %200, i32 %201, [2 x [576 x i32]]* %202, %struct.III_side_info_t* %203, [2 x %struct.III_scalefac_t]* %204)
  %205 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %206 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %205, i32 0, i32 64
  %207 = load i32, i32* %206, align 4
  %208 = icmp eq i32 %207, 1
  br i1 %208, label %209, label %228

; <label>:209:                                    ; preds = %198
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_iteration_loop, i64 0, i64 3)
  %210 = add i64 %pgocount4, 1
  store i64 %210, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_iteration_loop, i64 0, i64 3)
  %211 = load %struct.gr_info*, %struct.gr_info** %20, align 8
  %212 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %211, i32 0, i32 6
  %213 = load i32, i32* %212, align 8
  %214 = icmp eq i32 %213, 0
  br i1 %214, label %215, label %228

; <label>:215:                                    ; preds = %209
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_iteration_loop, i64 0, i64 5)
  %216 = add i64 %pgocount5, 1
  store i64 %216, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_iteration_loop, i64 0, i64 5)
  %217 = load i32, i32* %24, align 4
  %218 = load i32, i32* %23, align 4
  %219 = load %struct.gr_info*, %struct.gr_info** %20, align 8
  %220 = load [2 x [576 x i32]]*, [2 x [576 x i32]]** %15, align 8
  %221 = load i32, i32* %24, align 4
  %222 = sext i32 %221 to i64
  %223 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %220, i64 %222
  %224 = load i32, i32* %23, align 4
  %225 = sext i32 %224 to i64
  %226 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %223, i64 0, i64 %225
  %227 = getelementptr inbounds [576 x i32], [576 x i32]* %226, i32 0, i32 0
  call void @best_huffman_divide(i32 %217, i32 %218, %struct.gr_info* %219, i32* %227)
  br label %228

; <label>:228:                                    ; preds = %215, %209, %198
  %229 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %230 = load %struct.gr_info*, %struct.gr_info** %20, align 8
  %231 = load %struct.III_side_info_t*, %struct.III_side_info_t** %14, align 8
  %232 = load i32, i32* %22, align 4
  call void @ResvAdjust(%struct.lame_global_flags* %229, %struct.gr_info* %230, %struct.III_side_info_t* %231, i32 %232)
  store i32 0, i32* %25, align 4
  br label %233

; <label>:233:                                    ; preds = %264, %228
  %234 = load i32, i32* %25, align 4
  %235 = icmp slt i32 %234, 576
  br i1 %235, label %236, label %268

; <label>:236:                                    ; preds = %233
  %237 = load [2 x [576 x double]]*, [2 x [576 x double]]** %12, align 8
  %238 = load i32, i32* %24, align 4
  %239 = sext i32 %238 to i64
  %240 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %237, i64 %239
  %241 = load i32, i32* %23, align 4
  %242 = sext i32 %241 to i64
  %243 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %240, i64 0, i64 %242
  %244 = load i32, i32* %25, align 4
  %245 = sext i32 %244 to i64
  %246 = getelementptr inbounds [576 x double], [576 x double]* %243, i64 0, i64 %245
  %247 = load double, double* %246, align 8
  %248 = fcmp olt double %247, 0.000000e+00
  br i1 %248, label %249, label %263

; <label>:249:                                    ; preds = %236
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_iteration_loop, i64 0, i64 1)
  %250 = add i64 %pgocount6, 1
  store i64 %250, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_iteration_loop, i64 0, i64 1)
  %251 = load [2 x [576 x i32]]*, [2 x [576 x i32]]** %15, align 8
  %252 = load i32, i32* %24, align 4
  %253 = sext i32 %252 to i64
  %254 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %251, i64 %253
  %255 = load i32, i32* %23, align 4
  %256 = sext i32 %255 to i64
  %257 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %254, i64 0, i64 %256
  %258 = load i32, i32* %25, align 4
  %259 = sext i32 %258 to i64
  %260 = getelementptr inbounds [576 x i32], [576 x i32]* %257, i64 0, i64 %259
  %261 = load i32, i32* %260, align 4
  %262 = mul nsw i32 %261, -1
  store i32 %262, i32* %260, align 4
  br label %263

; <label>:263:                                    ; preds = %249, %236
  br label %264

; <label>:264:                                    ; preds = %263
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_iteration_loop, i64 0, i64 0)
  %265 = add i64 %pgocount7, 1
  store i64 %265, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_iteration_loop, i64 0, i64 0)
  %266 = load i32, i32* %25, align 4
  %267 = add nsw i32 %266, 1
  store i32 %267, i32* %25, align 4
  br label %233

; <label>:268:                                    ; preds = %233
  br label %269

; <label>:269:                                    ; preds = %268
  %270 = load i32, i32* %23, align 4
  %271 = add nsw i32 %270, 1
  store i32 %271, i32* %23, align 4
  br label %88

; <label>:272:                                    ; preds = %88
  br label %273

; <label>:273:                                    ; preds = %272
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_iteration_loop, i64 0, i64 6)
  %274 = add i64 %pgocount8, 1
  store i64 %274, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_iteration_loop, i64 0, i64 6)
  %275 = load i32, i32* %24, align 4
  %276 = add nsw i32 %275, 1
  store i32 %276, i32* %24, align 4
  br label %48

; <label>:277:                                    ; preds = %48
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_iteration_loop, i64 0, i64 9)
  %278 = add i64 %pgocount9, 1
  store i64 %278, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_iteration_loop, i64 0, i64 9)
  %279 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %280 = load %struct.III_side_info_t*, %struct.III_side_info_t** %14, align 8
  %281 = load i32, i32* %22, align 4
  call void @ResvFrameEnd(%struct.lame_global_flags* %279, %struct.III_side_info_t* %280, i32 %281)
  ret void
}

declare void @iteration_init(%struct.lame_global_flags*, %struct.III_side_info_t*, [2 x [576 x i32]]*) #1

declare void @getframebits(%struct.lame_global_flags*, i32*, i32*) #1

declare i32 @ResvFrameBegin(%struct.lame_global_flags*, %struct.III_side_info_t*, i32, i32) #1

declare void @ms_convert([576 x double]*, [576 x double]*) #1

declare void @on_pe(%struct.lame_global_flags*, [2 x double]*, %struct.III_side_info_t*, i32*, i32, i32) #1

declare void @reduce_side(i32*, double, i32) #1

; Function Attrs: noinline nounwind uwtable
define i32 @init_outer_loop(%struct.lame_global_flags*, double*, %struct.gr_info*) #0 {
  %4 = alloca i32, align 4
  %5 = alloca %struct.lame_global_flags*, align 8
  %6 = alloca double*, align 8
  %7 = alloca %struct.gr_info*, align 8
  %8 = alloca i32, align 4
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca [3 x double], align 16
  %12 = alloca double, align 8
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %5, align 8
  store double* %1, double** %6, align 8
  store %struct.gr_info* %2, %struct.gr_info** %7, align 8
  store i32 0, i32* %8, align 4
  br label %13

; <label>:13:                                     ; preds = %23, %3
  %14 = load i32, i32* %8, align 4
  %15 = icmp slt i32 %14, 4
  br i1 %15, label %16, label %26

; <label>:16:                                     ; preds = %13
  %pgocount = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_init_outer_loop, i64 0, i64 1)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_init_outer_loop, i64 0, i64 1)
  %18 = load %struct.gr_info*, %struct.gr_info** %7, align 8
  %19 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %18, i32 0, i32 20
  %20 = load i32, i32* %8, align 4
  %21 = sext i32 %20 to i64
  %22 = getelementptr inbounds [4 x i32], [4 x i32]* %19, i64 0, i64 %21
  store i32 0, i32* %22, align 4
  br label %23

; <label>:23:                                     ; preds = %16
  %24 = load i32, i32* %8, align 4
  %25 = add nsw i32 %24, 1
  store i32 %25, i32* %8, align 4
  br label %13

; <label>:26:                                     ; preds = %13
  %27 = load %struct.gr_info*, %struct.gr_info** %7, align 8
  %28 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %27, i32 0, i32 19
  store i32* getelementptr inbounds ([6 x [3 x [4 x i32]]], [6 x [3 x [4 x i32]]]* @nr_of_sfb_block, i64 0, i64 0, i64 0, i64 0), i32** %28, align 8
  %29 = load %struct.gr_info*, %struct.gr_info** %7, align 8
  %30 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %29, i32 0, i32 0
  store i32 0, i32* %30, align 8
  %31 = load %struct.gr_info*, %struct.gr_info** %7, align 8
  %32 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %31, i32 0, i32 1
  store i32 0, i32* %32, align 4
  %33 = load %struct.gr_info*, %struct.gr_info** %7, align 8
  %34 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %33, i32 0, i32 2
  store i32 0, i32* %34, align 8
  %35 = load %struct.gr_info*, %struct.gr_info** %7, align 8
  %36 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %35, i32 0, i32 4
  store i32 0, i32* %36, align 8
  %37 = load %struct.gr_info*, %struct.gr_info** %7, align 8
  %38 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %37, i32 0, i32 8
  %39 = getelementptr inbounds [3 x i32], [3 x i32]* %38, i64 0, i64 0
  store i32 0, i32* %39, align 8
  %40 = load %struct.gr_info*, %struct.gr_info** %7, align 8
  %41 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %40, i32 0, i32 8
  %42 = getelementptr inbounds [3 x i32], [3 x i32]* %41, i64 0, i64 1
  store i32 0, i32* %42, align 4
  %43 = load %struct.gr_info*, %struct.gr_info** %7, align 8
  %44 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %43, i32 0, i32 8
  %45 = getelementptr inbounds [3 x i32], [3 x i32]* %44, i64 0, i64 2
  store i32 0, i32* %45, align 8
  %46 = load %struct.gr_info*, %struct.gr_info** %7, align 8
  %47 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %46, i32 0, i32 9
  %48 = getelementptr inbounds [3 x i32], [3 x i32]* %47, i64 0, i64 0
  store i32 0, i32* %48, align 4
  %49 = load %struct.gr_info*, %struct.gr_info** %7, align 8
  %50 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %49, i32 0, i32 9
  %51 = getelementptr inbounds [3 x i32], [3 x i32]* %50, i64 0, i64 1
  store i32 0, i32* %51, align 4
  %52 = load %struct.gr_info*, %struct.gr_info** %7, align 8
  %53 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %52, i32 0, i32 9
  %54 = getelementptr inbounds [3 x i32], [3 x i32]* %53, i64 0, i64 2
  store i32 0, i32* %54, align 4
  %55 = load %struct.gr_info*, %struct.gr_info** %7, align 8
  %56 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %55, i32 0, i32 10
  store i32 0, i32* %56, align 8
  %57 = load %struct.gr_info*, %struct.gr_info** %7, align 8
  %58 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %57, i32 0, i32 11
  store i32 0, i32* %58, align 4
  %59 = load %struct.gr_info*, %struct.gr_info** %7, align 8
  %60 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %59, i32 0, i32 15
  store i32 0, i32* %60, align 4
  %61 = load %struct.gr_info*, %struct.gr_info** %7, align 8
  %62 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %61, i32 0, i32 12
  store i32 0, i32* %62, align 8
  %63 = load %struct.gr_info*, %struct.gr_info** %7, align 8
  %64 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %63, i32 0, i32 13
  store i32 0, i32* %64, align 4
  %65 = load %struct.gr_info*, %struct.gr_info** %7, align 8
  %66 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %65, i32 0, i32 3
  store i32 210, i32* %66, align 4
  %67 = load %struct.gr_info*, %struct.gr_info** %7, align 8
  %68 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %67, i32 0, i32 14
  store i32 0, i32* %68, align 8
  %69 = load %struct.gr_info*, %struct.gr_info** %7, align 8
  %70 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %69, i32 0, i32 18
  store i32 0, i32* %70, align 8
  %71 = load %struct.lame_global_flags*, %struct.lame_global_flags** %5, align 8
  %72 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %71, i32 0, i32 20
  %73 = load i32, i32* %72, align 4
  %74 = icmp ne i32 %73, 0
  br i1 %74, label %75, label %250

; <label>:75:                                     ; preds = %26
  %76 = load %struct.gr_info*, %struct.gr_info** %7, align 8
  %77 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %76, i32 0, i32 6
  %78 = load i32, i32* %77, align 8
  %79 = icmp eq i32 %78, 2
  br i1 %79, label %80, label %248

; <label>:80:                                     ; preds = %75
  store i32 0, i32* %10, align 4
  br label %81

; <label>:81:                                     ; preds = %88, %80
  %82 = load i32, i32* %10, align 4
  %83 = icmp slt i32 %82, 3
  br i1 %83, label %84, label %92

; <label>:84:                                     ; preds = %81
  %85 = load i32, i32* %10, align 4
  %86 = sext i32 %85 to i64
  %87 = getelementptr inbounds [3 x double], [3 x double]* %11, i64 0, i64 %86
  store double 0.000000e+00, double* %87, align 8
  br label %88

; <label>:88:                                     ; preds = %84
  %pgocount1 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_init_outer_loop, i64 0, i64 3)
  %89 = add i64 %pgocount1, 1
  store i64 %89, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_init_outer_loop, i64 0, i64 3)
  %90 = load i32, i32* %10, align 4
  %91 = add nsw i32 %90, 1
  store i32 %91, i32* %10, align 4
  br label %81

; <label>:92:                                     ; preds = %81
  store i32 0, i32* %8, align 4
  store i32 0, i32* %9, align 4
  br label %93

; <label>:93:                                     ; preds = %124, %92
  %94 = load i32, i32* %9, align 4
  %95 = icmp slt i32 %94, 192
  br i1 %95, label %96, label %128

; <label>:96:                                     ; preds = %93
  store i32 0, i32* %10, align 4
  br label %97

; <label>:97:                                     ; preds = %120, %96
  %98 = load i32, i32* %10, align 4
  %99 = icmp slt i32 %98, 3
  br i1 %99, label %100, label %123

; <label>:100:                                    ; preds = %97
  %pgocount2 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_init_outer_loop, i64 0, i64 0)
  %101 = add i64 %pgocount2, 1
  store i64 %101, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_init_outer_loop, i64 0, i64 0)
  %102 = load double*, double** %6, align 8
  %103 = load i32, i32* %8, align 4
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds double, double* %102, i64 %104
  %106 = load double, double* %105, align 8
  %107 = load double*, double** %6, align 8
  %108 = load i32, i32* %8, align 4
  %109 = sext i32 %108 to i64
  %110 = getelementptr inbounds double, double* %107, i64 %109
  %111 = load double, double* %110, align 8
  %112 = fmul double %106, %111
  %113 = load i32, i32* %10, align 4
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds [3 x double], [3 x double]* %11, i64 0, i64 %114
  %116 = load double, double* %115, align 8
  %117 = fadd double %116, %112
  store double %117, double* %115, align 8
  %118 = load i32, i32* %8, align 4
  %119 = add nsw i32 %118, 1
  store i32 %119, i32* %8, align 4
  br label %120

; <label>:120:                                    ; preds = %100
  %121 = load i32, i32* %10, align 4
  %122 = add nsw i32 %121, 1
  store i32 %122, i32* %10, align 4
  br label %97

; <label>:123:                                    ; preds = %97
  br label %124

; <label>:124:                                    ; preds = %123
  %pgocount3 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_init_outer_loop, i64 0, i64 4)
  %125 = add i64 %pgocount3, 1
  store i64 %125, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_init_outer_loop, i64 0, i64 4)
  %126 = load i32, i32* %9, align 4
  %127 = add nsw i32 %126, 1
  store i32 %127, i32* %9, align 4
  br label %93

; <label>:128:                                    ; preds = %93
  store double 1.000000e-12, double* %12, align 8
  store i32 0, i32* %10, align 4
  br label %129

; <label>:129:                                    ; preds = %150, %128
  %130 = load i32, i32* %10, align 4
  %131 = icmp slt i32 %130, 3
  br i1 %131, label %132, label %153

; <label>:132:                                    ; preds = %129
  %133 = load double, double* %12, align 8
  %134 = load i32, i32* %10, align 4
  %135 = sext i32 %134 to i64
  %136 = getelementptr inbounds [3 x double], [3 x double]* %11, i64 0, i64 %135
  %137 = load double, double* %136, align 8
  %138 = fcmp ogt double %133, %137
  br i1 %138, label %139, label %142

; <label>:139:                                    ; preds = %132
  %pgocount4 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_init_outer_loop, i64 0, i64 6)
  %140 = add i64 %pgocount4, 1
  store i64 %140, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_init_outer_loop, i64 0, i64 6)
  %141 = load double, double* %12, align 8
  br label %148

; <label>:142:                                    ; preds = %132
  %pgocount5 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_init_outer_loop, i64 0, i64 7)
  %143 = add i64 %pgocount5, 1
  store i64 %143, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_init_outer_loop, i64 0, i64 7)
  %144 = load i32, i32* %10, align 4
  %145 = sext i32 %144 to i64
  %146 = getelementptr inbounds [3 x double], [3 x double]* %11, i64 0, i64 %145
  %147 = load double, double* %146, align 8
  br label %148

; <label>:148:                                    ; preds = %142, %139
  %149 = phi double [ %141, %139 ], [ %147, %142 ]
  store double %149, double* %12, align 8
  br label %150

; <label>:150:                                    ; preds = %148
  %151 = load i32, i32* %10, align 4
  %152 = add nsw i32 %151, 1
  store i32 %152, i32* %10, align 4
  br label %129

; <label>:153:                                    ; preds = %129
  store i32 0, i32* %10, align 4
  br label %154

; <label>:154:                                    ; preds = %178, %153
  %155 = load i32, i32* %10, align 4
  %156 = icmp slt i32 %155, 3
  br i1 %156, label %157, label %181

; <label>:157:                                    ; preds = %154
  %158 = load i32, i32* %10, align 4
  %159 = sext i32 %158 to i64
  %160 = getelementptr inbounds [3 x double], [3 x double]* %11, i64 0, i64 %159
  %161 = load double, double* %160, align 8
  %162 = fcmp ogt double %161, 1.000000e-12
  br i1 %162, label %163, label %169

; <label>:163:                                    ; preds = %157
  %pgocount6 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_init_outer_loop, i64 0, i64 8)
  %164 = add i64 %pgocount6, 1
  store i64 %164, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_init_outer_loop, i64 0, i64 8)
  %165 = load i32, i32* %10, align 4
  %166 = sext i32 %165 to i64
  %167 = getelementptr inbounds [3 x double], [3 x double]* %11, i64 0, i64 %166
  %168 = load double, double* %167, align 8
  br label %171

; <label>:169:                                    ; preds = %157
  %pgocount7 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_init_outer_loop, i64 0, i64 9)
  %170 = add i64 %pgocount7, 1
  store i64 %170, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_init_outer_loop, i64 0, i64 9)
  br label %171

; <label>:171:                                    ; preds = %169, %163
  %172 = phi double [ %168, %163 ], [ 1.000000e-12, %169 ]
  %173 = load double, double* %12, align 8
  %174 = fdiv double %172, %173
  %175 = load i32, i32* %10, align 4
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds [3 x double], [3 x double]* %11, i64 0, i64 %176
  store double %174, double* %177, align 8
  br label %178

; <label>:178:                                    ; preds = %171
  %179 = load i32, i32* %10, align 4
  %180 = add nsw i32 %179, 1
  store i32 %180, i32* %10, align 4
  br label %154

; <label>:181:                                    ; preds = %154
  store i32 0, i32* %10, align 4
  br label %182

; <label>:182:                                    ; preds = %230, %181
  %183 = load i32, i32* %10, align 4
  %184 = icmp slt i32 %183, 3
  br i1 %184, label %185, label %234

; <label>:185:                                    ; preds = %182
  %186 = load i32, i32* %10, align 4
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds [3 x double], [3 x double]* %11, i64 0, i64 %187
  %189 = load double, double* %188, align 8
  %190 = call double @log(double %189) #6
  %191 = fmul double -5.000000e-01, %190
  %192 = fdiv double %191, 0x3FE62E42FEFA39EF
  %193 = fadd double %192, 5.000000e-01
  %194 = fptosi double %193 to i32
  %195 = load %struct.gr_info*, %struct.gr_info** %7, align 8
  %196 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %195, i32 0, i32 9
  %197 = load i32, i32* %10, align 4
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds [3 x i32], [3 x i32]* %196, i64 0, i64 %198
  store i32 %194, i32* %199, align 4
  %200 = load %struct.gr_info*, %struct.gr_info** %7, align 8
  %201 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %200, i32 0, i32 9
  %202 = load i32, i32* %10, align 4
  %203 = sext i32 %202 to i64
  %204 = getelementptr inbounds [3 x i32], [3 x i32]* %201, i64 0, i64 %203
  %205 = load i32, i32* %204, align 4
  %206 = icmp sgt i32 %205, 2
  br i1 %206, label %207, label %214

; <label>:207:                                    ; preds = %185
  %pgocount8 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_init_outer_loop, i64 0, i64 10)
  %208 = add i64 %pgocount8, 1
  store i64 %208, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_init_outer_loop, i64 0, i64 10)
  %209 = load %struct.gr_info*, %struct.gr_info** %7, align 8
  %210 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %209, i32 0, i32 9
  %211 = load i32, i32* %10, align 4
  %212 = sext i32 %211 to i64
  %213 = getelementptr inbounds [3 x i32], [3 x i32]* %210, i64 0, i64 %212
  store i32 2, i32* %213, align 4
  br label %214

; <label>:214:                                    ; preds = %207, %185
  %215 = load %struct.gr_info*, %struct.gr_info** %7, align 8
  %216 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %215, i32 0, i32 9
  %217 = load i32, i32* %10, align 4
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds [3 x i32], [3 x i32]* %216, i64 0, i64 %218
  %220 = load i32, i32* %219, align 4
  %221 = icmp slt i32 %220, 0
  br i1 %221, label %222, label %229

; <label>:222:                                    ; preds = %214
  %pgocount9 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_init_outer_loop, i64 0, i64 11)
  %223 = add i64 %pgocount9, 1
  store i64 %223, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_init_outer_loop, i64 0, i64 11)
  %224 = load %struct.gr_info*, %struct.gr_info** %7, align 8
  %225 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %224, i32 0, i32 9
  %226 = load i32, i32* %10, align 4
  %227 = sext i32 %226 to i64
  %228 = getelementptr inbounds [3 x i32], [3 x i32]* %225, i64 0, i64 %227
  store i32 0, i32* %228, align 4
  br label %229

; <label>:229:                                    ; preds = %222, %214
  br label %230

; <label>:230:                                    ; preds = %229
  %pgocount10 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_init_outer_loop, i64 0, i64 5)
  %231 = add i64 %pgocount10, 1
  store i64 %231, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_init_outer_loop, i64 0, i64 5)
  %232 = load i32, i32* %10, align 4
  %233 = add nsw i32 %232, 1
  store i32 %233, i32* %10, align 4
  br label %182

; <label>:234:                                    ; preds = %182
  %235 = getelementptr inbounds [3 x double], [3 x double]* %11, i64 0, i64 0
  %236 = load double, double* %235, align 16
  %237 = getelementptr inbounds [3 x double], [3 x double]* %11, i64 0, i64 1
  %238 = load double, double* %237, align 8
  %239 = fadd double %236, %238
  %240 = getelementptr inbounds [3 x double], [3 x double]* %11, i64 0, i64 2
  %241 = load double, double* %240, align 16
  %242 = fadd double %239, %241
  %243 = fcmp olt double 1.000000e-99, %242
  br i1 %243, label %244, label %246

; <label>:244:                                    ; preds = %234
  %pgocount11 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_init_outer_loop, i64 0, i64 15)
  %245 = add i64 %pgocount11, 1
  store i64 %245, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_init_outer_loop, i64 0, i64 15)
  store i32 1, i32* %4, align 4
  br label %271

; <label>:246:                                    ; preds = %234
  %pgocount12 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_init_outer_loop, i64 0, i64 16)
  %247 = add i64 %pgocount12, 1
  store i64 %247, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_init_outer_loop, i64 0, i64 16)
  store i32 0, i32* %4, align 4
  br label %271

; <label>:248:                                    ; preds = %75
  %pgocount13 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_init_outer_loop, i64 0, i64 14)
  %249 = add i64 %pgocount13, 1
  store i64 %249, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_init_outer_loop, i64 0, i64 14)
  br label %250

; <label>:250:                                    ; preds = %248, %26
  store i32 0, i32* %8, align 4
  br label %251

; <label>:251:                                    ; preds = %265, %250
  %252 = load i32, i32* %8, align 4
  %253 = icmp slt i32 %252, 576
  br i1 %253, label %254, label %269

; <label>:254:                                    ; preds = %251
  %255 = load double*, double** %6, align 8
  %256 = load i32, i32* %8, align 4
  %257 = sext i32 %256 to i64
  %258 = getelementptr inbounds double, double* %255, i64 %257
  %259 = load double, double* %258, align 8
  %260 = call double @fabs(double %259) #7
  %261 = fcmp olt double 1.000000e-99, %260
  br i1 %261, label %262, label %264

; <label>:262:                                    ; preds = %254
  %pgocount14 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_init_outer_loop, i64 0, i64 12)
  %263 = add i64 %pgocount14, 1
  store i64 %263, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_init_outer_loop, i64 0, i64 12)
  store i32 1, i32* %4, align 4
  br label %271

; <label>:264:                                    ; preds = %254
  br label %265

; <label>:265:                                    ; preds = %264
  %pgocount15 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_init_outer_loop, i64 0, i64 2)
  %266 = add i64 %pgocount15, 1
  store i64 %266, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_init_outer_loop, i64 0, i64 2)
  %267 = load i32, i32* %8, align 4
  %268 = add nsw i32 %267, 1
  store i32 %268, i32* %8, align 4
  br label %251

; <label>:269:                                    ; preds = %251
  %pgocount16 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_init_outer_loop, i64 0, i64 13)
  %270 = add i64 %pgocount16, 1
  store i64 %270, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_init_outer_loop, i64 0, i64 13)
  store i32 0, i32* %4, align 4
  br label %271

; <label>:271:                                    ; preds = %269, %262, %246, %244
  %272 = load i32, i32* %4, align 4
  ret i32 %272
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #2

declare i32 @calc_xmin(%struct.lame_global_flags*, double*, %struct.III_psy_ratio*, %struct.gr_info*, %struct.III_psy_xmin*) #1

; Function Attrs: noinline nounwind uwtable
define void @outer_loop(%struct.lame_global_flags*, double*, i32, double*, %struct.III_psy_xmin*, i32*, %struct.III_scalefac_t*, %struct.gr_info*, [21 x double]*, i32) #0 {
  %11 = alloca %struct.lame_global_flags*, align 8
  %12 = alloca double*, align 8
  %13 = alloca i32, align 4
  %14 = alloca double*, align 8
  %15 = alloca %struct.III_psy_xmin*, align 8
  %16 = alloca i32*, align 8
  %17 = alloca %struct.III_scalefac_t*, align 8
  %18 = alloca %struct.gr_info*, align 8
  %19 = alloca [21 x double]*, align 8
  %20 = alloca i32, align 4
  %21 = alloca %struct.III_scalefac_t, align 4
  %22 = alloca %struct.gr_info, align 8
  %23 = alloca [576 x i32], align 16
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca [576 x double], align 16
  %30 = alloca double, align 8
  %31 = alloca i32, align 4
  %32 = alloca i32, align 4
  %33 = alloca double, align 8
  %34 = alloca double, align 8
  %35 = alloca double, align 8
  %36 = alloca i32, align 4
  %37 = alloca double, align 8
  %38 = alloca double, align 8
  %39 = alloca double, align 8
  %40 = alloca [4 x [21 x double]], align 16
  %41 = alloca [4 x [21 x double]], align 16
  %42 = alloca i32, align 4
  %43 = alloca i32, align 4
  %44 = alloca i32, align 4
  %45 = alloca i32, align 4
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %11, align 8
  store double* %1, double** %12, align 8
  store i32 %2, i32* %13, align 4
  store double* %3, double** %14, align 8
  store %struct.III_psy_xmin* %4, %struct.III_psy_xmin** %15, align 8
  store i32* %5, i32** %16, align 8
  store %struct.III_scalefac_t* %6, %struct.III_scalefac_t** %17, align 8
  store %struct.gr_info* %7, %struct.gr_info** %18, align 8
  store [21 x double]* %8, [21 x double]** %19, align 8
  store i32 %9, i32* %20, align 4
  store i32 0, i32* %27, align 4
  store i32 0, i32* %32, align 4
  store i32 100, i32* %36, align 4
  store double 0.000000e+00, double* %37, align 8
  store double 0.000000e+00, double* %38, align 8
  store double 0.000000e+00, double* %39, align 8
  store i32 1, i32* %42, align 4
  store i32 1, i32* %43, align 4
  store i32 0, i32* %25, align 4
  br label %46

; <label>:46:                                     ; preds = %270, %10
  %47 = load i32, i32* %43, align 4
  %48 = icmp ne i32 %47, 0
  br i1 %48, label %49, label %271

; <label>:49:                                     ; preds = %46
  store i32 0, i32* %44, align 4
  %50 = load i32, i32* %25, align 4
  %51 = add nsw i32 %50, 1
  store i32 %51, i32* %25, align 4
  %52 = load i32, i32* %42, align 4
  %53 = icmp ne i32 %52, 0
  br i1 %53, label %54, label %96

; <label>:54:                                     ; preds = %49
  store i32 0, i32* %42, align 4
  %55 = bitcast %struct.III_scalefac_t* %21 to i8*
  call void @llvm.memset.p0i8.i64(i8* %55, i8 0, i64 244, i32 4, i1 false)
  store i32 0, i32* %24, align 4
  br label %56

; <label>:56:                                     ; preds = %74, %54
  %57 = load i32, i32* %24, align 4
  %58 = icmp slt i32 %57, 576
  br i1 %58, label %59, label %78

; <label>:59:                                     ; preds = %56
  %60 = load double*, double** %12, align 8
  %61 = load i32, i32* %24, align 4
  %62 = sext i32 %61 to i64
  %63 = getelementptr inbounds double, double* %60, i64 %62
  %64 = load double, double* %63, align 8
  %65 = call double @fabs(double %64) #7
  store double %65, double* %30, align 8
  %66 = load double, double* %30, align 8
  %67 = call double @sqrt(double %66) #6
  %68 = load double, double* %30, align 8
  %69 = fmul double %67, %68
  %70 = call double @sqrt(double %69) #6
  %71 = load i32, i32* %24, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [576 x double], [576 x double]* %29, i64 0, i64 %72
  store double %70, double* %73, align 8
  br label %74

; <label>:74:                                     ; preds = %59
  %pgocount = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_outer_loop, i64 0, i64 0)
  %75 = add i64 %pgocount, 1
  store i64 %75, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_outer_loop, i64 0, i64 0)
  %76 = load i32, i32* %24, align 4
  %77 = add nsw i32 %76, 1
  store i32 %77, i32* %24, align 4
  br label %56

; <label>:78:                                     ; preds = %56
  %pgocount1 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_outer_loop, i64 0, i64 1)
  %79 = add i64 %pgocount1, 1
  store i64 %79, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_outer_loop, i64 0, i64 1)
  %80 = load %struct.lame_global_flags*, %struct.lame_global_flags** %11, align 8
  %81 = load i32, i32* %13, align 4
  %82 = load i32, i32* %20, align 4
  %83 = sext i32 %82 to i64
  %84 = getelementptr inbounds [2 x i32], [2 x i32]* @outer_loop.OldValue, i64 0, i64 %83
  %85 = load i32, i32* %84, align 4
  %86 = getelementptr inbounds [576 x i32], [576 x i32]* %23, i32 0, i32 0
  %87 = getelementptr inbounds [576 x double], [576 x double]* %29, i32 0, i32 0
  %88 = load %struct.gr_info*, %struct.gr_info** %18, align 8
  %89 = call i32 @bin_search_StepSize2(%struct.lame_global_flags* %80, i32 %81, i32 %85, i32* %86, double* %87, %struct.gr_info* %88)
  store i32 %89, i32* %27, align 4
  %90 = load %struct.gr_info*, %struct.gr_info** %18, align 8
  %91 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %90, i32 0, i32 3
  %92 = load i32, i32* %91, align 4
  %93 = load i32, i32* %20, align 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds [2 x i32], [2 x i32]* @outer_loop.OldValue, i64 0, i64 %94
  store i32 %92, i32* %95, align 4
  br label %96

; <label>:96:                                     ; preds = %78, %49
  %97 = load i32, i32* %13, align 4
  %98 = load %struct.gr_info*, %struct.gr_info** %18, align 8
  %99 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %98, i32 0, i32 15
  %100 = load i32, i32* %99, align 4
  %101 = sub i32 %97, %100
  store i32 %101, i32* %28, align 4
  %102 = load i32, i32* %28, align 4
  %103 = icmp slt i32 %102, 0
  br i1 %103, label %104, label %113

; <label>:104:                                    ; preds = %96
  %105 = load i32, i32* %25, align 4
  %106 = icmp ne i32 %105, 1
  br i1 %106, label %107, label %108

; <label>:107:                                    ; preds = %104
  br label %111

; <label>:108:                                    ; preds = %104
  %pgocount2 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_outer_loop, i64 0, i64 19)
  %109 = add i64 %pgocount2, 1
  store i64 %109, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_outer_loop, i64 0, i64 19)
  call void @__assert_fail(i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.5, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 805, i8* getelementptr inbounds ([135 x i8], [135 x i8]* @__PRETTY_FUNCTION__.outer_loop, i32 0, i32 0)) #8
  unreachable
                                                  ; No predecessors!
  br label %111

; <label>:111:                                    ; preds = %110, %107
  %pgocount3 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_outer_loop, i64 0, i64 7)
  %112 = add i64 %pgocount3, 1
  store i64 %112, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_outer_loop, i64 0, i64 7)
  store i32 0, i32* %43, align 4
  br label %200

; <label>:113:                                    ; preds = %96
  %114 = load i32, i32* %25, align 4
  %115 = icmp eq i32 %114, 1
  br i1 %115, label %116, label %136

; <label>:116:                                    ; preds = %113
  %117 = load i32, i32* %27, align 4
  %118 = load i32, i32* %28, align 4
  %119 = icmp sgt i32 %117, %118
  br i1 %119, label %120, label %132

; <label>:120:                                    ; preds = %116
  %pgocount4 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_outer_loop, i64 0, i64 11)
  %121 = add i64 %pgocount4, 1
  store i64 %121, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_outer_loop, i64 0, i64 11)
  %122 = load %struct.gr_info*, %struct.gr_info** %18, align 8
  %123 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %122, i32 0, i32 3
  %124 = load i32, i32* %123, align 4
  %125 = add i32 %124, 1
  store i32 %125, i32* %123, align 4
  %126 = load %struct.lame_global_flags*, %struct.lame_global_flags** %11, align 8
  %127 = getelementptr inbounds [576 x double], [576 x double]* %29, i32 0, i32 0
  %128 = getelementptr inbounds [576 x i32], [576 x i32]* %23, i32 0, i32 0
  %129 = load i32, i32* %28, align 4
  %130 = load %struct.gr_info*, %struct.gr_info** %18, align 8
  %131 = call i32 @inner_loop(%struct.lame_global_flags* %126, double* %127, i32* %128, i32 %129, %struct.gr_info* %130)
  store i32 %131, i32* %45, align 4
  br label %135

; <label>:132:                                    ; preds = %116
  %pgocount5 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_outer_loop, i64 0, i64 12)
  %133 = add i64 %pgocount5, 1
  store i64 %133, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_outer_loop, i64 0, i64 12)
  %134 = load i32, i32* %27, align 4
  store i32 %134, i32* %45, align 4
  br label %135

; <label>:135:                                    ; preds = %132, %120
  br label %143

; <label>:136:                                    ; preds = %113
  %137 = load %struct.lame_global_flags*, %struct.lame_global_flags** %11, align 8
  %138 = getelementptr inbounds [576 x double], [576 x double]* %29, i32 0, i32 0
  %139 = getelementptr inbounds [576 x i32], [576 x i32]* %23, i32 0, i32 0
  %140 = load i32, i32* %28, align 4
  %141 = load %struct.gr_info*, %struct.gr_info** %18, align 8
  %142 = call i32 @inner_loop(%struct.lame_global_flags* %137, double* %138, i32* %139, i32 %140, %struct.gr_info* %141)
  store i32 %142, i32* %45, align 4
  br label %143

; <label>:143:                                    ; preds = %136, %135
  %144 = load i32, i32* %45, align 4
  %145 = load %struct.gr_info*, %struct.gr_info** %18, align 8
  %146 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %145, i32 0, i32 0
  store i32 %144, i32* %146, align 8
  %147 = load %struct.lame_global_flags*, %struct.lame_global_flags** %11, align 8
  %148 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %147, i32 0, i32 61
  %149 = load i32, i32* %148, align 8
  %150 = icmp eq i32 %149, 0
  br i1 %150, label %151, label %153

; <label>:151:                                    ; preds = %143
  %pgocount6 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_outer_loop, i64 0, i64 10)
  %152 = add i64 %pgocount6, 1
  store i64 %152, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_outer_loop, i64 0, i64 10)
  store i32 0, i32* %32, align 4
  br label %161

; <label>:153:                                    ; preds = %143
  %154 = load double*, double** %12, align 8
  %155 = getelementptr inbounds [576 x i32], [576 x i32]* %23, i32 0, i32 0
  %156 = load %struct.gr_info*, %struct.gr_info** %18, align 8
  %157 = getelementptr inbounds [4 x [21 x double]], [4 x [21 x double]]* %40, i32 0, i32 0
  %158 = getelementptr inbounds [4 x [21 x double]], [4 x [21 x double]]* %41, i32 0, i32 0
  %159 = load %struct.III_psy_xmin*, %struct.III_psy_xmin** %15, align 8
  %160 = call i32 @calc_noise1(double* %154, i32* %155, %struct.gr_info* %156, [21 x double]* %157, [21 x double]* %158, %struct.III_psy_xmin* %159, %struct.III_scalefac_t* %21, double* %34, double* %35, double* %33)
  store i32 %160, i32* %32, align 4
  br label %161

; <label>:161:                                    ; preds = %153, %151
  %162 = load i32, i32* %25, align 4
  %163 = icmp eq i32 %162, 1
  br i1 %163, label %164, label %166

; <label>:164:                                    ; preds = %161
  %pgocount7 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_outer_loop, i64 0, i64 8)
  %165 = add i64 %pgocount7, 1
  store i64 %165, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_outer_loop, i64 0, i64 8)
  store i32 1, i32* %31, align 4
  br label %180

; <label>:166:                                    ; preds = %161
  %pgocount8 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_outer_loop, i64 0, i64 9)
  %167 = add i64 %pgocount8, 1
  store i64 %167, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_outer_loop, i64 0, i64 9)
  %168 = load %struct.lame_global_flags*, %struct.lame_global_flags** %11, align 8
  %169 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %168, i32 0, i32 18
  %170 = load i32, i32* %169, align 4
  %171 = load i32, i32* %36, align 4
  %172 = load double, double* %39, align 8
  %173 = load double, double* %38, align 8
  %174 = load double, double* %37, align 8
  %175 = load i32, i32* %32, align 4
  %176 = load double, double* %35, align 8
  %177 = load double, double* %34, align 8
  %178 = load double, double* %33, align 8
  %179 = call i32 @quant_compare(i32 %170, i32 %171, double %172, double %173, double %174, i32 %175, double %176, double %177, double %178)
  store i32 %179, i32* %31, align 4
  br label %180

; <label>:180:                                    ; preds = %166, %164
  %181 = load i32, i32* %31, align 4
  %182 = icmp ne i32 %181, 0
  br i1 %182, label %183, label %199

; <label>:183:                                    ; preds = %180
  %pgocount9 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_outer_loop, i64 0, i64 4)
  %184 = add i64 %pgocount9, 1
  store i64 %184, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_outer_loop, i64 0, i64 4)
  %185 = load i32, i32* %32, align 4
  store i32 %185, i32* %36, align 4
  %186 = load double, double* %33, align 8
  store double %186, double* %37, align 8
  %187 = load double, double* %34, align 8
  store double %187, double* %38, align 8
  %188 = load double, double* %35, align 8
  store double %188, double* %39, align 8
  %189 = load %struct.III_scalefac_t*, %struct.III_scalefac_t** %17, align 8
  %190 = bitcast %struct.III_scalefac_t* %189 to i8*
  %191 = bitcast %struct.III_scalefac_t* %21 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %190, i8* %191, i64 244, i32 4, i1 false)
  %192 = load i32*, i32** %16, align 8
  %193 = bitcast i32* %192 to i8*
  %194 = getelementptr inbounds [576 x i32], [576 x i32]* %23, i32 0, i32 0
  %195 = bitcast i32* %194 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %193, i8* %195, i64 2304, i32 4, i1 false)
  %196 = bitcast %struct.gr_info* %22 to i8*
  %197 = load %struct.gr_info*, %struct.gr_info** %18, align 8
  %198 = bitcast %struct.gr_info* %197 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %196, i8* %198, i64 120, i32 8, i1 false)
  br label %199

; <label>:199:                                    ; preds = %183, %180
  br label %200

; <label>:200:                                    ; preds = %199, %111
  %201 = load %struct.lame_global_flags*, %struct.lame_global_flags** %11, align 8
  %202 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %201, i32 0, i32 62
  %203 = load i32, i32* %202, align 4
  %204 = icmp eq i32 %203, 0
  br i1 %204, label %205, label %212

; <label>:205:                                    ; preds = %200
  %206 = load i32, i32* %32, align 4
  %207 = icmp eq i32 %206, 0
  br i1 %207, label %208, label %210

; <label>:208:                                    ; preds = %205
  %pgocount10 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_outer_loop, i64 0, i64 14)
  %209 = add i64 %pgocount10, 1
  store i64 %209, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_outer_loop, i64 0, i64 14)
  store i32 0, i32* %43, align 4
  br label %210

; <label>:210:                                    ; preds = %208, %205
  %pgocount11 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_outer_loop, i64 0, i64 6)
  %211 = add i64 %pgocount11, 1
  store i64 %211, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_outer_loop, i64 0, i64 6)
  br label %212

; <label>:212:                                    ; preds = %210, %200
  %213 = load i32, i32* %43, align 4
  %214 = icmp ne i32 %213, 0
  br i1 %214, label %215, label %253

; <label>:215:                                    ; preds = %212
  %216 = getelementptr inbounds [576 x double], [576 x double]* %29, i32 0, i32 0
  %217 = load %struct.gr_info*, %struct.gr_info** %18, align 8
  %218 = getelementptr inbounds [4 x [21 x double]], [4 x [21 x double]]* %41, i32 0, i32 0
  call void @amp_scalefac_bands(double* %216, %struct.gr_info* %217, %struct.III_scalefac_t* %21, [21 x double]* %218)
  %219 = load %struct.gr_info*, %struct.gr_info** %18, align 8
  %220 = call i32 @loop_break(%struct.III_scalefac_t* %21, %struct.gr_info* %219)
  store i32 %220, i32* %26, align 4
  %221 = icmp eq i32 %220, 0
  br i1 %221, label %222, label %247

; <label>:222:                                    ; preds = %215
  %223 = load %struct.lame_global_flags*, %struct.lame_global_flags** %11, align 8
  %224 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %223, i32 0, i32 43
  %225 = load i32, i32* %224, align 8
  %226 = icmp eq i32 %225, 1
  br i1 %226, label %227, label %231

; <label>:227:                                    ; preds = %222
  %pgocount12 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_outer_loop, i64 0, i64 15)
  %228 = add i64 %pgocount12, 1
  store i64 %228, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_outer_loop, i64 0, i64 15)
  %229 = load %struct.gr_info*, %struct.gr_info** %18, align 8
  %230 = call i32 @scale_bitcount(%struct.III_scalefac_t* %21, %struct.gr_info* %229)
  store i32 %230, i32* %26, align 4
  br label %235

; <label>:231:                                    ; preds = %222
  %pgocount13 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_outer_loop, i64 0, i64 16)
  %232 = add i64 %pgocount13, 1
  store i64 %232, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_outer_loop, i64 0, i64 16)
  %233 = load %struct.gr_info*, %struct.gr_info** %18, align 8
  %234 = call i32 @scale_bitcount_lsf(%struct.III_scalefac_t* %21, %struct.gr_info* %233)
  store i32 %234, i32* %26, align 4
  br label %235

; <label>:235:                                    ; preds = %231, %227
  %236 = load i32, i32* %26, align 4
  %237 = icmp ne i32 %236, 0
  br i1 %237, label %238, label %246

; <label>:238:                                    ; preds = %235
  %pgocount14 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_outer_loop, i64 0, i64 13)
  %239 = add i64 %pgocount14, 1
  store i64 %239, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_outer_loop, i64 0, i64 13)
  %240 = load %struct.gr_info*, %struct.gr_info** %18, align 8
  %241 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %240, i32 0, i32 13
  %242 = load i32, i32* %241, align 4
  %243 = icmp eq i32 %242, 0
  br i1 %243, label %244, label %246

; <label>:244:                                    ; preds = %238
  %pgocount15 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_outer_loop, i64 0, i64 17)
  %245 = add i64 %pgocount15, 1
  store i64 %245, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_outer_loop, i64 0, i64 17)
  store i32 1, i32* %44, align 4
  br label %246

; <label>:246:                                    ; preds = %244, %238, %235
  br label %247

; <label>:247:                                    ; preds = %246, %215
  %pgocount16 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_outer_loop, i64 0, i64 2)
  %248 = add i64 %pgocount16, 1
  store i64 %248, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_outer_loop, i64 0, i64 2)
  %249 = load i32, i32* %26, align 4
  %250 = icmp ne i32 %249, 0
  %251 = xor i1 %250, true
  %252 = zext i1 %251 to i32
  store i32 %252, i32* %43, align 4
  br label %253

; <label>:253:                                    ; preds = %247, %212
  %254 = load i32, i32* %44, align 4
  %255 = icmp ne i32 %254, 0
  br i1 %255, label %256, label %270

; <label>:256:                                    ; preds = %253
  %pgocount17 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_outer_loop, i64 0, i64 3)
  %257 = add i64 %pgocount17, 1
  store i64 %257, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_outer_loop, i64 0, i64 3)
  %258 = load %struct.lame_global_flags*, %struct.lame_global_flags** %11, align 8
  %259 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %258, i32 0, i32 19
  %260 = load i32, i32* %259, align 8
  %261 = icmp ne i32 %260, 0
  br i1 %261, label %262, label %270

; <label>:262:                                    ; preds = %256
  %pgocount18 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_outer_loop, i64 0, i64 5)
  %263 = add i64 %pgocount18, 1
  store i64 %263, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_outer_loop, i64 0, i64 5)
  %264 = load %struct.lame_global_flags*, %struct.lame_global_flags** %11, align 8
  %265 = load double*, double** %12, align 8
  %266 = load %struct.gr_info*, %struct.gr_info** %18, align 8
  %267 = call i32 @init_outer_loop(%struct.lame_global_flags* %264, double* %265, %struct.gr_info* %266)
  store i32 1, i32* %42, align 4
  store i32 1, i32* %43, align 4
  %268 = load %struct.gr_info*, %struct.gr_info** %18, align 8
  %269 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %268, i32 0, i32 13
  store i32 1, i32* %269, align 4
  br label %270

; <label>:270:                                    ; preds = %262, %256, %253
  br label %46

; <label>:271:                                    ; preds = %46
  %272 = load %struct.gr_info*, %struct.gr_info** %18, align 8
  %273 = bitcast %struct.gr_info* %272 to i8*
  %274 = bitcast %struct.gr_info* %22 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %273, i8* %274, i64 120, i32 8, i1 false)
  %275 = load %struct.gr_info*, %struct.gr_info** %18, align 8
  %276 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %275, i32 0, i32 15
  %277 = load i32, i32* %276, align 4
  %278 = load %struct.gr_info*, %struct.gr_info** %18, align 8
  %279 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %278, i32 0, i32 0
  %280 = load i32, i32* %279, align 8
  %281 = add i32 %280, %277
  store i32 %281, i32* %279, align 8
  %282 = load %struct.gr_info*, %struct.gr_info** %18, align 8
  %283 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %282, i32 0, i32 3
  %284 = load i32, i32* %283, align 4
  %285 = icmp ult i32 %284, 256
  br i1 %285, label %286, label %287

; <label>:286:                                    ; preds = %271
  br label %290

; <label>:287:                                    ; preds = %271
  %pgocount19 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_outer_loop, i64 0, i64 20)
  %288 = add i64 %pgocount19, 1
  store i64 %288, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_outer_loop, i64 0, i64 20)
  call void @__assert_fail(i8* getelementptr inbounds ([28 x i8], [28 x i8]* @.str.6, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 891, i8* getelementptr inbounds ([135 x i8], [135 x i8]* @__PRETTY_FUNCTION__.outer_loop, i32 0, i32 0)) #8
  unreachable
                                                  ; No predecessors!
  br label %290

; <label>:290:                                    ; preds = %289, %286
  %pgocount20 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_outer_loop, i64 0, i64 18)
  %291 = add i64 %pgocount20, 1
  store i64 %291, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_outer_loop, i64 0, i64 18)
  %292 = load i32, i32* %36, align 4
  %293 = sitofp i32 %292 to double
  %294 = load double*, double** %14, align 8
  %295 = getelementptr inbounds double, double* %294, i64 0
  store double %293, double* %295, align 8
  %296 = load double, double* %37, align 8
  %297 = load double*, double** %14, align 8
  %298 = getelementptr inbounds double, double* %297, i64 1
  store double %296, double* %298, align 8
  %299 = load double, double* %38, align 8
  %300 = load double*, double** %14, align 8
  %301 = getelementptr inbounds double, double* %300, i64 2
  store double %299, double* %301, align 8
  %302 = load double, double* %39, align 8
  %303 = load double*, double** %14, align 8
  %304 = getelementptr inbounds double, double* %303, i64 3
  store double %302, double* %304, align 8
  ret void
}

declare void @best_scalefac_store(%struct.lame_global_flags*, i32, i32, [2 x [576 x i32]]*, %struct.III_side_info_t*, [2 x %struct.III_scalefac_t]*) #1

declare void @best_huffman_divide(i32, i32, %struct.gr_info*, i32*) #1

declare void @ResvAdjust(%struct.lame_global_flags*, %struct.gr_info*, %struct.III_side_info_t*, i32) #1

declare void @ResvFrameEnd(%struct.lame_global_flags*, %struct.III_side_info_t*, i32) #1

; Function Attrs: noinline nounwind uwtable
define void @set_masking_lower(i32, i32) #0 {
  %pgocount = load i64, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_set_masking_lower, i64 0, i64 0)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([1 x i64], [1 x i64]* @__profc_set_masking_lower, i64 0, i64 0)
  %4 = alloca i32, align 4
  %5 = alloca i32, align 4
  %6 = alloca float, align 4
  %7 = alloca float, align 4
  store i32 %0, i32* %4, align 4
  store i32 %1, i32* %5, align 4
  %8 = load i32, i32* %4, align 4
  %9 = mul nsw i32 2, %8
  %10 = add nsw i32 -6, %9
  %11 = sitofp i32 %10 to float
  store float %11, float* %6, align 4
  %12 = load i32, i32* %5, align 4
  %13 = sub nsw i32 %12, 125
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 2.375000e+03
  %16 = fptrunc double %15 to float
  store float %16, float* %7, align 4
  %17 = load float, float* %7, align 4
  %18 = fsub float %17, 1.000000e+00
  %19 = fmul float 4.000000e+00, %18
  store float %19, float* %7, align 4
  %20 = load float, float* %7, align 4
  %21 = load float, float* %6, align 4
  %22 = fadd float %21, %20
  store float %22, float* %6, align 4
  %23 = load float, float* %6, align 4
  %24 = fdiv float %23, 1.000000e+01
  %25 = fpext float %24 to double
  %26 = call double @pow(double 1.000000e+01, double %25) #6
  %27 = fptrunc double %26 to float
  store float %27, float* @masking_lower, align 4
  ret void
}

; Function Attrs: nounwind
declare double @pow(double, double) #3

; Function Attrs: noinline nounwind uwtable
define void @VBR_iteration_loop(%struct.lame_global_flags*, [2 x double]*, double*, [2 x [576 x double]]*, [2 x %struct.III_psy_ratio]*, %struct.III_side_info_t*, [2 x [576 x i32]]*, [2 x %struct.III_scalefac_t]*) #0 {
  %9 = alloca %struct.lame_global_flags*, align 8
  %10 = alloca [2 x double]*, align 8
  %11 = alloca double*, align 8
  %12 = alloca [2 x [576 x double]]*, align 8
  %13 = alloca [2 x %struct.III_psy_ratio]*, align 8
  %14 = alloca %struct.III_side_info_t*, align 8
  %15 = alloca [2 x [576 x i32]]*, align 8
  %16 = alloca [2 x %struct.III_scalefac_t]*, align 8
  %17 = alloca %struct.gr_info, align 8
  %18 = alloca %struct.gr_info, align 8
  %19 = alloca %struct.III_scalefac_t, align 4
  %20 = alloca [576 x i32], align 16
  %21 = alloca %struct.III_psy_xmin, align 8
  %22 = alloca %struct.gr_info*, align 8
  %23 = alloca [2 x [2 x i32]], align 16
  %24 = alloca [4 x double], align 16
  %25 = alloca [4 x double], align 16
  %26 = alloca [4 x [21 x double]], align 16
  %27 = alloca i32, align 4
  %28 = alloca i32, align 4
  %29 = alloca i32, align 4
  %30 = alloca i32, align 4
  %31 = alloca i32, align 4
  %32 = alloca i32, align 4
  %33 = alloca [15 x i32], align 16
  %34 = alloca i32, align 4
  %35 = alloca i32, align 4
  %36 = alloca i32, align 4
  %37 = alloca i32, align 4
  %38 = alloca i32, align 4
  %39 = alloca i32, align 4
  %40 = alloca i32, align 4
  %41 = alloca i32, align 4
  %42 = alloca i32, align 4
  %43 = alloca i32, align 4
  %44 = alloca i32, align 4
  %45 = alloca double, align 8
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %9, align 8
  store [2 x double]* %1, [2 x double]** %10, align 8
  store double* %2, double** %11, align 8
  store [2 x [576 x double]]* %3, [2 x [576 x double]]** %12, align 8
  store [2 x %struct.III_psy_ratio]* %4, [2 x %struct.III_psy_ratio]** %13, align 8
  store %struct.III_side_info_t* %5, %struct.III_side_info_t** %14, align 8
  store [2 x [576 x i32]]* %6, [2 x [576 x i32]]** %15, align 8
  store [2 x %struct.III_scalefac_t]* %7, [2 x %struct.III_scalefac_t]** %16, align 8
  store %struct.gr_info* null, %struct.gr_info** %22, align 8
  store i32 0, i32* %29, align 4
  store i32 0, i32* %32, align 4
  store i32 0, i32* %41, align 4
  %46 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %47 = load %struct.III_side_info_t*, %struct.III_side_info_t** %14, align 8
  %48 = load [2 x [576 x i32]]*, [2 x [576 x i32]]** %15, align 8
  call void @iteration_init(%struct.lame_global_flags* %46, %struct.III_side_info_t* %47, [2 x [576 x i32]]* %48)
  %49 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %50 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %49, i32 0, i32 50
  store i32 1, i32* %50, align 4
  br label %51

; <label>:51:                                     ; preds = %86, %8
  %52 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %53 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %52, i32 0, i32 50
  %54 = load i32, i32* %53, align 4
  %55 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %56 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %55, i32 0, i32 48
  %57 = load i32, i32* %56, align 4
  %58 = icmp sle i32 %54, %57
  br i1 %58, label %59, label %92

; <label>:59:                                     ; preds = %51
  %60 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  call void @getframebits(%struct.lame_global_flags* %60, i32* %34, i32* %36)
  %61 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %62 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %61, i32 0, i32 50
  %63 = load i32, i32* %62, align 4
  %64 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %65 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %64, i32 0, i32 47
  %66 = load i32, i32* %65, align 8
  %67 = icmp eq i32 %63, %66
  br i1 %67, label %68, label %75

; <label>:68:                                     ; preds = %59
  %pgocount = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 33)
  %69 = add i64 %pgocount, 1
  store i64 %69, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 33)
  %70 = load i32, i32* %36, align 4
  %71 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %72 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %71, i32 0, i32 46
  %73 = load i32, i32* %72, align 4
  %74 = sdiv i32 %70, %73
  store i32 %74, i32* %32, align 4
  br label %75

; <label>:75:                                     ; preds = %68, %59
  %76 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %77 = load %struct.III_side_info_t*, %struct.III_side_info_t** %14, align 8
  %78 = load i32, i32* %36, align 4
  %79 = load i32, i32* %34, align 4
  %80 = call i32 @ResvFrameBegin(%struct.lame_global_flags* %76, %struct.III_side_info_t* %77, i32 %78, i32 %79)
  %81 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %82 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %81, i32 0, i32 50
  %83 = load i32, i32* %82, align 4
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds [15 x i32], [15 x i32]* %33, i64 0, i64 %84
  store i32 %80, i32* %85, align 4
  br label %86

; <label>:86:                                     ; preds = %75
  %pgocount3 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 26)
  %87 = add i64 %pgocount3, 1
  store i64 %87, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 26)
  %88 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %89 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %88, i32 0, i32 50
  %90 = load i32, i32* %89, align 4
  %91 = add nsw i32 %90, 1
  store i32 %91, i32* %89, align 4
  br label %51

; <label>:92:                                     ; preds = %51
  %93 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %94 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %93, i32 0, i32 48
  %95 = load i32, i32* %94, align 4
  %96 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %97 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %96, i32 0, i32 50
  store i32 %95, i32* %97, align 4
  store i32 0, i32* %40, align 4
  store i32 0, i32* %39, align 4
  br label %98

; <label>:98:                                     ; preds = %535, %92
  %99 = load i32, i32* %39, align 4
  %100 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %101 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %100, i32 0, i32 45
  %102 = load i32, i32* %101, align 8
  %103 = icmp slt i32 %99, %102
  br i1 %103, label %104, label %539

; <label>:104:                                    ; preds = %98
  %105 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %106 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %105, i32 0, i32 46
  %107 = load i32, i32* %106, align 4
  store i32 %107, i32* %42, align 4
  %108 = load i32, i32* @reduce_sidechannel, align 4
  %109 = icmp ne i32 %108, 0
  br i1 %109, label %110, label %112

; <label>:110:                                    ; preds = %104
  %pgocount4 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 31)
  %111 = add i64 %pgocount4, 1
  store i64 %111, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 31)
  store i32 1, i32* %42, align 4
  br label %112

; <label>:112:                                    ; preds = %110, %104
  %113 = load i32, i32* @convert_mdct, align 4
  %114 = icmp ne i32 %113, 0
  br i1 %114, label %115, label %127

; <label>:115:                                    ; preds = %112
  %pgocount5 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 32)
  %116 = add i64 %pgocount5, 1
  store i64 %116, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 32)
  %117 = load [2 x [576 x double]]*, [2 x [576 x double]]** %12, align 8
  %118 = load i32, i32* %39, align 4
  %119 = sext i32 %118 to i64
  %120 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %117, i64 %119
  %121 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %120, i32 0, i32 0
  %122 = load [2 x [576 x double]]*, [2 x [576 x double]]** %12, align 8
  %123 = load i32, i32* %39, align 4
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %122, i64 %124
  %126 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %125, i32 0, i32 0
  call void @ms_convert([576 x double]* %121, [576 x double]* %126)
  br label %127

; <label>:127:                                    ; preds = %115, %112
  store i32 0, i32* %38, align 4
  br label %128

; <label>:128:                                    ; preds = %531, %127
  %129 = load i32, i32* %38, align 4
  %130 = load i32, i32* %42, align 4
  %131 = icmp slt i32 %129, %130
  br i1 %131, label %132, label %534

; <label>:132:                                    ; preds = %128
  %133 = load %struct.III_side_info_t*, %struct.III_side_info_t** %14, align 8
  %134 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %133, i32 0, i32 4
  %135 = load i32, i32* %39, align 4
  %136 = sext i32 %135 to i64
  %137 = getelementptr inbounds [2 x %struct.anon], [2 x %struct.anon]* %134, i64 0, i64 %136
  %138 = getelementptr inbounds %struct.anon, %struct.anon* %137, i32 0, i32 0
  %139 = load i32, i32* %38, align 4
  %140 = sext i32 %139 to i64
  %141 = getelementptr inbounds [2 x %struct.gr_info_ss], [2 x %struct.gr_info_ss]* %138, i64 0, i64 %140
  %142 = getelementptr inbounds %struct.gr_info_ss, %struct.gr_info_ss* %141, i32 0, i32 0
  store %struct.gr_info* %142, %struct.gr_info** %22, align 8
  %143 = load i32, i32* %32, align 4
  %144 = icmp sgt i32 125, %143
  br i1 %144, label %145, label %146

; <label>:145:                                    ; preds = %132
  br label %149

; <label>:146:                                    ; preds = %132
  %pgocount6 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 2)
  %147 = add i64 %pgocount6, 1
  store i64 %147, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 2)
  %148 = load i32, i32* %32, align 4
  br label %149

; <label>:149:                                    ; preds = %146, %145
  %150 = phi i32 [ 125, %145 ], [ %148, %146 ]
  store i32 %150, i32* %30, align 4
  %151 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %152 = load [2 x [576 x double]]*, [2 x [576 x double]]** %12, align 8
  %153 = load i32, i32* %39, align 4
  %154 = sext i32 %153 to i64
  %155 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %152, i64 %154
  %156 = load i32, i32* %38, align 4
  %157 = sext i32 %156 to i64
  %158 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %155, i64 0, i64 %157
  %159 = getelementptr inbounds [576 x double], [576 x double]* %158, i32 0, i32 0
  %160 = load %struct.gr_info*, %struct.gr_info** %22, align 8
  %161 = call i32 @init_outer_loop(%struct.lame_global_flags* %151, double* %159, %struct.gr_info* %160)
  %162 = icmp ne i32 %161, 0
  br i1 %162, label %188, label %163

; <label>:163:                                    ; preds = %149
  %pgocount7 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 6)
  %164 = add i64 %pgocount7, 1
  store i64 %164, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 6)
  %165 = load [2 x %struct.III_scalefac_t]*, [2 x %struct.III_scalefac_t]** %16, align 8
  %166 = load i32, i32* %39, align 4
  %167 = sext i32 %166 to i64
  %168 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %165, i64 %167
  %169 = load i32, i32* %38, align 4
  %170 = sext i32 %169 to i64
  %171 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %168, i64 0, i64 %170
  %172 = bitcast %struct.III_scalefac_t* %171 to i8*
  call void @llvm.memset.p0i8.i64(i8* %172, i8 0, i64 244, i32 4, i1 false)
  %173 = load [2 x [576 x i32]]*, [2 x [576 x i32]]** %15, align 8
  %174 = load i32, i32* %39, align 4
  %175 = sext i32 %174 to i64
  %176 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %173, i64 %175
  %177 = load i32, i32* %38, align 4
  %178 = sext i32 %177 to i64
  %179 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %176, i64 0, i64 %178
  %180 = getelementptr inbounds [576 x i32], [576 x i32]* %179, i32 0, i32 0
  %181 = bitcast i32* %180 to i8*
  call void @llvm.memset.p0i8.i64(i8* %181, i8 0, i64 2304, i32 4, i1 false)
  %182 = load i32, i32* %39, align 4
  %183 = sext i32 %182 to i64
  %184 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %23, i64 0, i64 %183
  %185 = load i32, i32* %38, align 4
  %186 = sext i32 %185 to i64
  %187 = getelementptr inbounds [2 x i32], [2 x i32]* %184, i64 0, i64 %186
  store i32 0, i32* %187, align 4
  store i32 1, i32* %40, align 4
  br label %531

; <label>:188:                                    ; preds = %149
  %189 = bitcast %struct.gr_info* %18 to i8*
  %190 = load %struct.gr_info*, %struct.gr_info** %22, align 8
  %191 = bitcast %struct.gr_info* %190 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %189, i8* %191, i64 120, i32 8, i1 false)
  %192 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %193 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %192, i32 0, i32 22
  %194 = load i32, i32* %193, align 4
  call void @set_masking_lower(i32 %194, i32 2500)
  %195 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %196 = load [2 x [576 x double]]*, [2 x [576 x double]]** %12, align 8
  %197 = load i32, i32* %39, align 4
  %198 = sext i32 %197 to i64
  %199 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %196, i64 %198
  %200 = load i32, i32* %38, align 4
  %201 = sext i32 %200 to i64
  %202 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %199, i64 0, i64 %201
  %203 = getelementptr inbounds [576 x double], [576 x double]* %202, i32 0, i32 0
  %204 = load [2 x %struct.III_psy_ratio]*, [2 x %struct.III_psy_ratio]** %13, align 8
  %205 = load i32, i32* %39, align 4
  %206 = sext i32 %205 to i64
  %207 = getelementptr inbounds [2 x %struct.III_psy_ratio], [2 x %struct.III_psy_ratio]* %204, i64 %206
  %208 = load i32, i32* %38, align 4
  %209 = sext i32 %208 to i64
  %210 = getelementptr inbounds [2 x %struct.III_psy_ratio], [2 x %struct.III_psy_ratio]* %207, i64 0, i64 %209
  %211 = load %struct.gr_info*, %struct.gr_info** %22, align 8
  %212 = call i32 @calc_xmin(%struct.lame_global_flags* %195, double* %203, %struct.III_psy_ratio* %210, %struct.gr_info* %211, %struct.III_psy_xmin* %21)
  %213 = icmp eq i32 0, %212
  br i1 %213, label %214, label %216

; <label>:214:                                    ; preds = %188
  %pgocount8 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 7)
  %215 = add i64 %pgocount8, 1
  store i64 %215, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 7)
  store i32 1, i32* %40, align 4
  store i32 125, i32* %30, align 4
  br label %216

; <label>:216:                                    ; preds = %214, %188
  %217 = load %struct.gr_info*, %struct.gr_info** %22, align 8
  %218 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %217, i32 0, i32 6
  %219 = load i32, i32* %218, align 8
  %220 = icmp eq i32 %219, 2
  br i1 %220, label %221, label %257

; <label>:221:                                    ; preds = %216
  %222 = load [2 x double]*, [2 x double]** %10, align 8
  %223 = load i32, i32* %39, align 4
  %224 = sext i32 %223 to i64
  %225 = getelementptr inbounds [2 x double], [2 x double]* %222, i64 %224
  %226 = load i32, i32* %38, align 4
  %227 = sext i32 %226 to i64
  %228 = getelementptr inbounds [2 x double], [2 x double]* %225, i64 0, i64 %227
  %229 = load double, double* %228, align 8
  %230 = fcmp ogt double 1.100000e+03, %229
  br i1 %230, label %231, label %232

; <label>:231:                                    ; preds = %221
  br label %242

; <label>:232:                                    ; preds = %221
  %pgocount9 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 17)
  %233 = add i64 %pgocount9, 1
  store i64 %233, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 17)
  %234 = load [2 x double]*, [2 x double]** %10, align 8
  %235 = load i32, i32* %39, align 4
  %236 = sext i32 %235 to i64
  %237 = getelementptr inbounds [2 x double], [2 x double]* %234, i64 %236
  %238 = load i32, i32* %38, align 4
  %239 = sext i32 %238 to i64
  %240 = getelementptr inbounds [2 x double], [2 x double]* %237, i64 0, i64 %239
  %241 = load double, double* %240, align 8
  br label %242

; <label>:242:                                    ; preds = %232, %231
  %243 = phi double [ 1.100000e+03, %231 ], [ %241, %232 ]
  %244 = load i32, i32* %30, align 4
  %245 = sitofp i32 %244 to double
  %246 = fadd double %245, %243
  %247 = fptosi double %246 to i32
  store i32 %247, i32* %30, align 4
  %248 = load i32, i32* %30, align 4
  %249 = icmp slt i32 %248, 1800
  br i1 %249, label %250, label %253

; <label>:250:                                    ; preds = %242
  %pgocount10 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 18)
  %251 = add i64 %pgocount10, 1
  store i64 %251, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 18)
  %252 = load i32, i32* %30, align 4
  br label %255

; <label>:253:                                    ; preds = %242
  %pgocount11 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 19)
  %254 = add i64 %pgocount11, 1
  store i64 %254, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 19)
  br label %255

; <label>:255:                                    ; preds = %253, %250
  %256 = phi i32 [ %252, %250 ], [ 1800, %253 ]
  store i32 %256, i32* %30, align 4
  br label %257

; <label>:257:                                    ; preds = %255, %216
  %258 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %259 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %258, i32 0, i32 48
  %260 = load i32, i32* %259, align 4
  %261 = sext i32 %260 to i64
  %262 = getelementptr inbounds [15 x i32], [15 x i32]* %33, i64 0, i64 %261
  %263 = load i32, i32* %262, align 4
  %264 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %265 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %264, i32 0, i32 46
  %266 = load i32, i32* %265, align 4
  %267 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %268 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %267, i32 0, i32 45
  %269 = load i32, i32* %268, align 8
  %270 = mul nsw i32 %266, %269
  %271 = sdiv i32 %263, %270
  %272 = add nsw i32 1200, %271
  store i32 %272, i32* %31, align 4
  %273 = load i32, i32* %31, align 4
  %274 = icmp slt i32 %273, 2500
  br i1 %274, label %275, label %277

; <label>:275:                                    ; preds = %257
  %276 = load i32, i32* %31, align 4
  br label %279

; <label>:277:                                    ; preds = %257
  %pgocount12 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 8)
  %278 = add i64 %pgocount12, 1
  store i64 %278, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 8)
  br label %279

; <label>:279:                                    ; preds = %277, %275
  %280 = phi i32 [ %276, %275 ], [ 2500, %277 ]
  store i32 %280, i32* %31, align 4
  %281 = load i32, i32* %31, align 4
  %282 = load i32, i32* %30, align 4
  %283 = icmp sgt i32 %281, %282
  br i1 %283, label %284, label %286

; <label>:284:                                    ; preds = %279
  %285 = load i32, i32* %31, align 4
  br label %289

; <label>:286:                                    ; preds = %279
  %pgocount13 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 9)
  %287 = add i64 %pgocount13, 1
  store i64 %287, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 9)
  %288 = load i32, i32* %30, align 4
  br label %289

; <label>:289:                                    ; preds = %286, %284
  %290 = phi i32 [ %285, %284 ], [ %288, %286 ]
  store i32 %290, i32* %31, align 4
  %291 = load i32, i32* %31, align 4
  %292 = load i32, i32* %30, align 4
  %293 = sub nsw i32 %291, %292
  %294 = sdiv i32 %293, 4
  store i32 %294, i32* %28, align 4
  %295 = load i32, i32* %31, align 4
  %296 = load i32, i32* %30, align 4
  %297 = add nsw i32 %295, %296
  %298 = sdiv i32 %297, 2
  store i32 %298, i32* %27, align 4
  %299 = load i32, i32* %31, align 4
  %300 = add nsw i32 %299, 1
  store i32 %300, i32* %43, align 4
  br label %301

; <label>:301:                                    ; preds = %._crit_edge, %289
  %302 = load i32, i32* %27, align 4
  %303 = load i32, i32* %30, align 4
  %304 = icmp sge i32 %302, %303
  br i1 %304, label %305, label %306

; <label>:305:                                    ; preds = %301
  br label %309

; <label>:306:                                    ; preds = %301
  %pgocount14 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 45)
  %307 = add i64 %pgocount14, 1
  store i64 %307, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 45)
  call void @__assert_fail(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 400, i8* getelementptr inbounds ([171 x i8], [171 x i8]* @__PRETTY_FUNCTION__.VBR_iteration_loop, i32 0, i32 0)) #8
  unreachable
                                                  ; No predecessors!
  br label %309

; <label>:309:                                    ; preds = %308, %305
  %310 = load i32, i32* %27, align 4
  %311 = load i32, i32* %31, align 4
  %312 = icmp sle i32 %310, %311
  br i1 %312, label %313, label %314

; <label>:313:                                    ; preds = %309
  br label %317

; <label>:314:                                    ; preds = %309
  %pgocount15 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 46)
  %315 = add i64 %pgocount15, 1
  store i64 %315, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 46)
  call void @__assert_fail(i8* getelementptr inbounds ([20 x i8], [20 x i8]* @.str.2, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 401, i8* getelementptr inbounds ([171 x i8], [171 x i8]* @__PRETTY_FUNCTION__.VBR_iteration_loop, i32 0, i32 0)) #8
  unreachable
                                                  ; No predecessors!
  br label %317

; <label>:317:                                    ; preds = %316, %313
  %318 = load i32, i32* %27, align 4
  %319 = load i32, i32* %43, align 4
  %320 = icmp sge i32 %318, %319
  br i1 %320, label %321, label %327

; <label>:321:                                    ; preds = %317
  %322 = load i32, i32* %28, align 4
  %323 = load i32, i32* %27, align 4
  %324 = sub nsw i32 %323, %322
  store i32 %324, i32* %27, align 4
  %325 = load i32, i32* %28, align 4
  %326 = sdiv i32 %325, 2
  store i32 %326, i32* %28, align 4
  br label %468

; <label>:327:                                    ; preds = %317
  %328 = getelementptr inbounds [4 x double], [4 x double]* %25, i64 0, i64 0
  store double 0.000000e+00, double* %328, align 16
  %329 = getelementptr inbounds [4 x double], [4 x double]* %25, i64 0, i64 1
  store double 0.000000e+00, double* %329, align 8
  %330 = getelementptr inbounds [4 x double], [4 x double]* %25, i64 0, i64 2
  store double 0.000000e+00, double* %330, align 16
  %331 = getelementptr inbounds [4 x double], [4 x double]* %25, i64 0, i64 3
  store double 0.000000e+00, double* %331, align 8
  %332 = getelementptr inbounds [4 x double], [4 x double]* %25, i64 0, i64 0
  %333 = load double, double* %332, align 16
  %334 = fcmp ogt double 0.000000e+00, %333
  br i1 %334, label %335, label %336

; <label>:335:                                    ; preds = %327
  br label %340

; <label>:336:                                    ; preds = %327
  %pgocount16 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 14)
  %337 = add i64 %pgocount16, 1
  store i64 %337, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 14)
  %338 = getelementptr inbounds [4 x double], [4 x double]* %25, i64 0, i64 0
  %339 = load double, double* %338, align 16
  br label %340

; <label>:340:                                    ; preds = %336, %335
  %341 = phi double [ 0.000000e+00, %335 ], [ %339, %336 ]
  %342 = getelementptr inbounds [4 x double], [4 x double]* %25, i64 0, i64 0
  store double %341, double* %342, align 16
  %343 = getelementptr inbounds [4 x double], [4 x double]* %25, i64 0, i64 2
  %344 = load double, double* %343, align 16
  %345 = fcmp ogt double 0.000000e+00, %344
  br i1 %345, label %346, label %348

; <label>:346:                                    ; preds = %340
  %pgocount17 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 15)
  %347 = add i64 %pgocount17, 1
  store i64 %347, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 15)
  br label %352

; <label>:348:                                    ; preds = %340
  %pgocount18 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 16)
  %349 = add i64 %pgocount18, 1
  store i64 %349, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 16)
  %350 = getelementptr inbounds [4 x double], [4 x double]* %25, i64 0, i64 2
  %351 = load double, double* %350, align 16
  br label %352

; <label>:352:                                    ; preds = %348, %346
  %353 = phi double [ 0.000000e+00, %346 ], [ %351, %348 ]
  %354 = getelementptr inbounds [4 x double], [4 x double]* %25, i64 0, i64 2
  store double %353, double* %354, align 16
  %355 = load %struct.gr_info*, %struct.gr_info** %22, align 8
  %356 = bitcast %struct.gr_info* %355 to i8*
  %357 = bitcast %struct.gr_info* %18 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %356, i8* %357, i64 120, i32 8, i1 false)
  %358 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %359 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %358, i32 0, i32 22
  %360 = load i32, i32* %359, align 4
  %361 = load i32, i32* %27, align 4
  call void @set_masking_lower(i32 %360, i32 %361)
  %362 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %363 = load [2 x [576 x double]]*, [2 x [576 x double]]** %12, align 8
  %364 = load i32, i32* %39, align 4
  %365 = sext i32 %364 to i64
  %366 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %363, i64 %365
  %367 = load i32, i32* %38, align 4
  %368 = sext i32 %367 to i64
  %369 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %366, i64 0, i64 %368
  %370 = getelementptr inbounds [576 x double], [576 x double]* %369, i32 0, i32 0
  %371 = load [2 x %struct.III_psy_ratio]*, [2 x %struct.III_psy_ratio]** %13, align 8
  %372 = load i32, i32* %39, align 4
  %373 = sext i32 %372 to i64
  %374 = getelementptr inbounds [2 x %struct.III_psy_ratio], [2 x %struct.III_psy_ratio]* %371, i64 %373
  %375 = load i32, i32* %38, align 4
  %376 = sext i32 %375 to i64
  %377 = getelementptr inbounds [2 x %struct.III_psy_ratio], [2 x %struct.III_psy_ratio]* %374, i64 0, i64 %376
  %378 = load %struct.gr_info*, %struct.gr_info** %22, align 8
  %379 = call i32 @calc_xmin(%struct.lame_global_flags* %362, double* %370, %struct.III_psy_ratio* %377, %struct.gr_info* %378, %struct.III_psy_xmin* %21)
  %380 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %381 = load [2 x [576 x double]]*, [2 x [576 x double]]** %12, align 8
  %382 = load i32, i32* %39, align 4
  %383 = sext i32 %382 to i64
  %384 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %381, i64 %383
  %385 = load i32, i32* %38, align 4
  %386 = sext i32 %385 to i64
  %387 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %384, i64 0, i64 %386
  %388 = getelementptr inbounds [576 x double], [576 x double]* %387, i32 0, i32 0
  %389 = load i32, i32* %27, align 4
  %390 = getelementptr inbounds [4 x double], [4 x double]* %24, i32 0, i32 0
  %391 = load [2 x [576 x i32]]*, [2 x [576 x i32]]** %15, align 8
  %392 = load i32, i32* %39, align 4
  %393 = sext i32 %392 to i64
  %394 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %391, i64 %393
  %395 = load i32, i32* %38, align 4
  %396 = sext i32 %395 to i64
  %397 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %394, i64 0, i64 %396
  %398 = getelementptr inbounds [576 x i32], [576 x i32]* %397, i32 0, i32 0
  %399 = load [2 x %struct.III_scalefac_t]*, [2 x %struct.III_scalefac_t]** %16, align 8
  %400 = load i32, i32* %39, align 4
  %401 = sext i32 %400 to i64
  %402 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %399, i64 %401
  %403 = load i32, i32* %38, align 4
  %404 = sext i32 %403 to i64
  %405 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %402, i64 0, i64 %404
  %406 = load %struct.gr_info*, %struct.gr_info** %22, align 8
  %407 = getelementptr inbounds [4 x [21 x double]], [4 x [21 x double]]* %26, i32 0, i32 0
  %408 = load i32, i32* %38, align 4
  call void @outer_loop(%struct.lame_global_flags* %380, double* %388, i32 %389, double* %390, %struct.III_psy_xmin* %21, i32* %398, %struct.III_scalefac_t* %405, %struct.gr_info* %406, [21 x double]* %407, i32 %408)
  %409 = getelementptr inbounds [4 x double], [4 x double]* %25, i64 0, i64 0
  %410 = load double, double* %409, align 16
  %411 = fptosi double %410 to i32
  %412 = getelementptr inbounds [4 x double], [4 x double]* %25, i64 0, i64 3
  %413 = load double, double* %412, align 8
  %414 = getelementptr inbounds [4 x double], [4 x double]* %25, i64 0, i64 2
  %415 = load double, double* %414, align 16
  %416 = getelementptr inbounds [4 x double], [4 x double]* %25, i64 0, i64 1
  %417 = load double, double* %416, align 8
  %418 = getelementptr inbounds [4 x double], [4 x double]* %24, i64 0, i64 0
  %419 = load double, double* %418, align 16
  %420 = fptosi double %419 to i32
  %421 = getelementptr inbounds [4 x double], [4 x double]* %24, i64 0, i64 3
  %422 = load double, double* %421, align 8
  %423 = getelementptr inbounds [4 x double], [4 x double]* %24, i64 0, i64 2
  %424 = load double, double* %423, align 16
  %425 = getelementptr inbounds [4 x double], [4 x double]* %24, i64 0, i64 1
  %426 = load double, double* %425, align 8
  %427 = call i32 @VBR_compare(i32 %411, double %413, double %415, double %417, i32 %420, double %422, double %424, double %426)
  store i32 %427, i32* %44, align 4
  %428 = load i32, i32* %44, align 4
  %429 = icmp ne i32 %428, 0
  br i1 %429, label %430, label %460

; <label>:430:                                    ; preds = %352
  %431 = load %struct.gr_info*, %struct.gr_info** %22, align 8
  %432 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %431, i32 0, i32 0
  %433 = load i32, i32* %432, align 8
  store i32 %433, i32* %43, align 4
  %434 = bitcast %struct.III_scalefac_t* %19 to i8*
  %435 = load [2 x %struct.III_scalefac_t]*, [2 x %struct.III_scalefac_t]** %16, align 8
  %436 = load i32, i32* %39, align 4
  %437 = sext i32 %436 to i64
  %438 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %435, i64 %437
  %439 = load i32, i32* %38, align 4
  %440 = sext i32 %439 to i64
  %441 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %438, i64 0, i64 %440
  %442 = bitcast %struct.III_scalefac_t* %441 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %434, i8* %442, i64 244, i32 4, i1 false)
  %443 = getelementptr inbounds [576 x i32], [576 x i32]* %20, i32 0, i32 0
  %444 = bitcast i32* %443 to i8*
  %445 = load [2 x [576 x i32]]*, [2 x [576 x i32]]** %15, align 8
  %446 = load i32, i32* %39, align 4
  %447 = sext i32 %446 to i64
  %448 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %445, i64 %447
  %449 = load i32, i32* %38, align 4
  %450 = sext i32 %449 to i64
  %451 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %448, i64 0, i64 %450
  %452 = getelementptr inbounds [576 x i32], [576 x i32]* %451, i32 0, i32 0
  %453 = bitcast i32* %452 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %444, i8* %453, i64 2304, i32 4, i1 false)
  %454 = bitcast %struct.gr_info* %17 to i8*
  %455 = load %struct.gr_info*, %struct.gr_info** %22, align 8
  %456 = bitcast %struct.gr_info* %455 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %454, i8* %456, i64 120, i32 8, i1 false)
  %457 = load i32, i32* %28, align 4
  %458 = load i32, i32* %27, align 4
  %459 = sub nsw i32 %458, %457
  store i32 %459, i32* %27, align 4
  br label %465

; <label>:460:                                    ; preds = %352
  %pgocount19 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 37)
  %461 = add i64 %pgocount19, 1
  store i64 %461, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 37)
  %462 = load i32, i32* %28, align 4
  %463 = load i32, i32* %27, align 4
  %464 = add nsw i32 %463, %462
  store i32 %464, i32* %27, align 4
  br label %465

; <label>:465:                                    ; preds = %460, %430
  %466 = load i32, i32* %28, align 4
  %467 = sdiv i32 %466, 2
  store i32 %467, i32* %28, align 4
  br label %468

; <label>:468:                                    ; preds = %465, %321
  %469 = load i32, i32* %28, align 4
  %470 = icmp sgt i32 %469, 10
  br i1 %470, label %._crit_edge, label %472

._crit_edge:                                      ; preds = %468
  %pgocount20 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 22)
  %471 = add i64 %pgocount20, 1
  store i64 %471, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 22)
  br label %301

; <label>:472:                                    ; preds = %468
  %473 = load i32, i32* %43, align 4
  %474 = load i32, i32* %31, align 4
  %475 = icmp sle i32 %473, %474
  br i1 %475, label %476, label %501

; <label>:476:                                    ; preds = %472
  %pgocount21 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 10)
  %477 = add i64 %pgocount21, 1
  store i64 %477, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 10)
  %478 = load %struct.gr_info*, %struct.gr_info** %22, align 8
  %479 = bitcast %struct.gr_info* %478 to i8*
  %480 = bitcast %struct.gr_info* %17 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %479, i8* %480, i64 120, i32 8, i1 false)
  %481 = load [2 x %struct.III_scalefac_t]*, [2 x %struct.III_scalefac_t]** %16, align 8
  %482 = load i32, i32* %39, align 4
  %483 = sext i32 %482 to i64
  %484 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %481, i64 %483
  %485 = load i32, i32* %38, align 4
  %486 = sext i32 %485 to i64
  %487 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %484, i64 0, i64 %486
  %488 = bitcast %struct.III_scalefac_t* %487 to i8*
  %489 = bitcast %struct.III_scalefac_t* %19 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %488, i8* %489, i64 244, i32 4, i1 false)
  %490 = load [2 x [576 x i32]]*, [2 x [576 x i32]]** %15, align 8
  %491 = load i32, i32* %39, align 4
  %492 = sext i32 %491 to i64
  %493 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %490, i64 %492
  %494 = load i32, i32* %38, align 4
  %495 = sext i32 %494 to i64
  %496 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %493, i64 0, i64 %495
  %497 = getelementptr inbounds [576 x i32], [576 x i32]* %496, i32 0, i32 0
  %498 = bitcast i32* %497 to i8*
  %499 = getelementptr inbounds [576 x i32], [576 x i32]* %20, i32 0, i32 0
  %500 = bitcast i32* %499 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %498, i8* %500, i64 2304, i32 4, i1 false)
  br label %501

; <label>:501:                                    ; preds = %476, %472
  %502 = load %struct.gr_info*, %struct.gr_info** %22, align 8
  %503 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %502, i32 0, i32 0
  %504 = load i32, i32* %503, align 8
  %505 = load i32, i32* %31, align 4
  %506 = icmp sle i32 %504, %505
  br i1 %506, label %507, label %508

; <label>:507:                                    ; preds = %501
  br label %511

; <label>:508:                                    ; preds = %501
  %pgocount22 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 47)
  %509 = add i64 %pgocount22, 1
  store i64 %509, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 47)
  call void @__assert_fail(i8* getelementptr inbounds ([42 x i8], [42 x i8]* @.str.3, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 497, i8* getelementptr inbounds ([171 x i8], [171 x i8]* @__PRETTY_FUNCTION__.VBR_iteration_loop, i32 0, i32 0)) #8
  unreachable
                                                  ; No predecessors!
  br label %511

; <label>:511:                                    ; preds = %510, %507
  %pgocount23 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 21)
  %512 = add i64 %pgocount23, 1
  store i64 %512, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 21)
  %513 = load %struct.gr_info*, %struct.gr_info** %22, align 8
  %514 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %513, i32 0, i32 0
  %515 = load i32, i32* %514, align 8
  %516 = load i32, i32* %39, align 4
  %517 = sext i32 %516 to i64
  %518 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %23, i64 0, i64 %517
  %519 = load i32, i32* %38, align 4
  %520 = sext i32 %519 to i64
  %521 = getelementptr inbounds [2 x i32], [2 x i32]* %518, i64 0, i64 %520
  store i32 %515, i32* %521, align 4
  %522 = load i32, i32* %39, align 4
  %523 = sext i32 %522 to i64
  %524 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %23, i64 0, i64 %523
  %525 = load i32, i32* %38, align 4
  %526 = sext i32 %525 to i64
  %527 = getelementptr inbounds [2 x i32], [2 x i32]* %524, i64 0, i64 %526
  %528 = load i32, i32* %527, align 4
  %529 = load i32, i32* %29, align 4
  %530 = add nsw i32 %529, %528
  store i32 %530, i32* %29, align 4
  br label %531

; <label>:531:                                    ; preds = %511, %163
  %532 = load i32, i32* %38, align 4
  %533 = add nsw i32 %532, 1
  store i32 %533, i32* %38, align 4
  br label %128

; <label>:534:                                    ; preds = %128
  br label %535

; <label>:535:                                    ; preds = %534
  %pgocount24 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 30)
  %536 = add i64 %pgocount24, 1
  store i64 %536, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 30)
  %537 = load i32, i32* %39, align 4
  %538 = add nsw i32 %537, 1
  store i32 %538, i32* %39, align 4
  br label %98

; <label>:539:                                    ; preds = %98
  %540 = load i32, i32* @reduce_sidechannel, align 4
  %541 = icmp ne i32 %540, 0
  br i1 %541, label %542, label %608

; <label>:542:                                    ; preds = %539
  store i32 0, i32* %39, align 4
  br label %543

; <label>:543:                                    ; preds = %603, %542
  %544 = load i32, i32* %39, align 4
  %545 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %546 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %545, i32 0, i32 45
  %547 = load i32, i32* %546, align 8
  %548 = icmp slt i32 %544, %547
  br i1 %548, label %549, label %606

; <label>:549:                                    ; preds = %543
  %550 = load double*, double** %11, align 8
  %551 = load i32, i32* %39, align 4
  %552 = sext i32 %551 to i64
  %553 = getelementptr inbounds double, double* %550, i64 %552
  %554 = load double, double* %553, align 8
  %555 = fsub double 5.000000e-01, %554
  %556 = fmul double 3.300000e-01, %555
  %557 = fdiv double %556, 5.000000e-01
  store double %557, double* %45, align 8
  %558 = load double, double* %45, align 8
  %559 = fsub double 1.000000e+00, %558
  %560 = load double, double* %45, align 8
  %561 = fadd double 1.000000e+00, %560
  %562 = fdiv double %559, %561
  %563 = load i32, i32* %39, align 4
  %564 = sext i32 %563 to i64
  %565 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %23, i64 0, i64 %564
  %566 = getelementptr inbounds [2 x i32], [2 x i32]* %565, i64 0, i64 0
  %567 = load i32, i32* %566, align 8
  %568 = sitofp i32 %567 to double
  %569 = fmul double %562, %568
  %570 = fptosi double %569 to i32
  %571 = load i32, i32* %39, align 4
  %572 = sext i32 %571 to i64
  %573 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %23, i64 0, i64 %572
  %574 = getelementptr inbounds [2 x i32], [2 x i32]* %573, i64 0, i64 1
  store i32 %570, i32* %574, align 4
  %575 = load i32, i32* %39, align 4
  %576 = sext i32 %575 to i64
  %577 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %23, i64 0, i64 %576
  %578 = getelementptr inbounds [2 x i32], [2 x i32]* %577, i64 0, i64 1
  %579 = load i32, i32* %578, align 4
  %580 = icmp sgt i32 125, %579
  br i1 %580, label %581, label %583

; <label>:581:                                    ; preds = %549
  %pgocount25 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 38)
  %582 = add i64 %pgocount25, 1
  store i64 %582, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 38)
  br label %590

; <label>:583:                                    ; preds = %549
  %pgocount26 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 39)
  %584 = add i64 %pgocount26, 1
  store i64 %584, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 39)
  %585 = load i32, i32* %39, align 4
  %586 = sext i32 %585 to i64
  %587 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %23, i64 0, i64 %586
  %588 = getelementptr inbounds [2 x i32], [2 x i32]* %587, i64 0, i64 1
  %589 = load i32, i32* %588, align 4
  br label %590

; <label>:590:                                    ; preds = %583, %581
  %591 = phi i32 [ 125, %581 ], [ %589, %583 ]
  %592 = load i32, i32* %39, align 4
  %593 = sext i32 %592 to i64
  %594 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %23, i64 0, i64 %593
  %595 = getelementptr inbounds [2 x i32], [2 x i32]* %594, i64 0, i64 1
  store i32 %591, i32* %595, align 4
  %596 = load i32, i32* %39, align 4
  %597 = sext i32 %596 to i64
  %598 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %23, i64 0, i64 %597
  %599 = getelementptr inbounds [2 x i32], [2 x i32]* %598, i64 0, i64 1
  %600 = load i32, i32* %599, align 4
  %601 = load i32, i32* %29, align 4
  %602 = add nsw i32 %601, %600
  store i32 %602, i32* %29, align 4
  br label %603

; <label>:603:                                    ; preds = %590
  %604 = load i32, i32* %39, align 4
  %605 = add nsw i32 %604, 1
  store i32 %605, i32* %39, align 4
  br label %543

; <label>:606:                                    ; preds = %543
  %pgocount27 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 40)
  %607 = add i64 %pgocount27, 1
  store i64 %607, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 40)
  br label %608

; <label>:608:                                    ; preds = %606, %539
  %609 = load i32, i32* %40, align 4
  %610 = icmp ne i32 %609, 0
  br i1 %610, label %611, label %613

; <label>:611:                                    ; preds = %608
  %pgocount28 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 41)
  %612 = add i64 %pgocount28, 1
  store i64 %612, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 41)
  br label %618

; <label>:613:                                    ; preds = %608
  %pgocount29 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 44)
  %614 = add i64 %pgocount29, 1
  store i64 %614, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 44)
  %615 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %616 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %615, i32 0, i32 47
  %617 = load i32, i32* %616, align 8
  br label %618

; <label>:618:                                    ; preds = %613, %611
  %619 = phi i32 [ 1, %611 ], [ %617, %613 ]
  %620 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %621 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %620, i32 0, i32 50
  store i32 %619, i32* %621, align 4
  br label %622

; <label>:622:                                    ; preds = %643, %618
  %623 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %624 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %623, i32 0, i32 50
  %625 = load i32, i32* %624, align 4
  %626 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %627 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %626, i32 0, i32 48
  %628 = load i32, i32* %627, align 4
  %629 = icmp slt i32 %625, %628
  br i1 %629, label %630, label %648

; <label>:630:                                    ; preds = %622
  %631 = load i32, i32* %29, align 4
  %632 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %633 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %632, i32 0, i32 50
  %634 = load i32, i32* %633, align 4
  %635 = sext i32 %634 to i64
  %636 = getelementptr inbounds [15 x i32], [15 x i32]* %33, i64 0, i64 %635
  %637 = load i32, i32* %636, align 4
  %638 = icmp sle i32 %631, %637
  br i1 %638, label %639, label %641

; <label>:639:                                    ; preds = %630
  %pgocount30 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 43)
  %640 = add i64 %pgocount30, 1
  store i64 %640, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 43)
  br label %648

; <label>:641:                                    ; preds = %630
  %pgocount31 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 36)
  %642 = add i64 %pgocount31, 1
  store i64 %642, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 36)
  br label %643

; <label>:643:                                    ; preds = %641
  %644 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %645 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %644, i32 0, i32 50
  %646 = load i32, i32* %645, align 4
  %647 = add nsw i32 %646, 1
  store i32 %647, i32* %645, align 4
  br label %622

; <label>:648:                                    ; preds = %639, %622
  %649 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  call void @getframebits(%struct.lame_global_flags* %649, i32* %34, i32* %36)
  %650 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %651 = load %struct.III_side_info_t*, %struct.III_side_info_t** %14, align 8
  %652 = load i32, i32* %36, align 4
  %653 = load i32, i32* %34, align 4
  %654 = call i32 @ResvFrameBegin(%struct.lame_global_flags* %650, %struct.III_side_info_t* %651, i32 %652, i32 %653)
  store i32 %654, i32* %35, align 4
  %655 = load i32, i32* %29, align 4
  %656 = load i32, i32* %35, align 4
  %657 = icmp sgt i32 %655, %656
  br i1 %657, label %658, label %739

; <label>:658:                                    ; preds = %648
  store i32 1, i32* %41, align 4
  store i32 0, i32* %39, align 4
  br label %659

; <label>:659:                                    ; preds = %701, %658
  %660 = load i32, i32* %39, align 4
  %661 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %662 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %661, i32 0, i32 45
  %663 = load i32, i32* %662, align 8
  %664 = icmp slt i32 %660, %663
  br i1 %664, label %665, label %704

; <label>:665:                                    ; preds = %659
  %pgocount32 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 34)
  %666 = add i64 %pgocount32, 1
  store i64 %666, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 34)
  store i32 0, i32* %38, align 4
  br label %667

; <label>:667:                                    ; preds = %696, %665
  %668 = load i32, i32* %38, align 4
  %669 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %670 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %669, i32 0, i32 46
  %671 = load i32, i32* %670, align 4
  %672 = icmp slt i32 %668, %671
  br i1 %672, label %673, label %700

; <label>:673:                                    ; preds = %667
  %674 = load i32, i32* %39, align 4
  %675 = sext i32 %674 to i64
  %676 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %23, i64 0, i64 %675
  %677 = load i32, i32* %38, align 4
  %678 = sext i32 %677 to i64
  %679 = getelementptr inbounds [2 x i32], [2 x i32]* %676, i64 0, i64 %678
  %680 = load i32, i32* %679, align 4
  %681 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %682 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %681, i32 0, i32 50
  %683 = load i32, i32* %682, align 4
  %684 = sext i32 %683 to i64
  %685 = getelementptr inbounds [15 x i32], [15 x i32]* %33, i64 0, i64 %684
  %686 = load i32, i32* %685, align 4
  %687 = mul nsw i32 %680, %686
  %688 = load i32, i32* %29, align 4
  %689 = sdiv i32 %687, %688
  %690 = load i32, i32* %39, align 4
  %691 = sext i32 %690 to i64
  %692 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %23, i64 0, i64 %691
  %693 = load i32, i32* %38, align 4
  %694 = sext i32 %693 to i64
  %695 = getelementptr inbounds [2 x i32], [2 x i32]* %692, i64 0, i64 %694
  store i32 %689, i32* %695, align 4
  br label %696

; <label>:696:                                    ; preds = %673
  %pgocount33 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 0)
  %697 = add i64 %pgocount33, 1
  store i64 %697, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 0)
  %698 = load i32, i32* %38, align 4
  %699 = add nsw i32 %698, 1
  store i32 %699, i32* %38, align 4
  br label %667

; <label>:700:                                    ; preds = %667
  br label %701

; <label>:701:                                    ; preds = %700
  %702 = load i32, i32* %39, align 4
  %703 = add nsw i32 %702, 1
  store i32 %703, i32* %39, align 4
  br label %659

; <label>:704:                                    ; preds = %659
  store i32 0, i32* %29, align 4
  store i32 0, i32* %39, align 4
  br label %705

; <label>:705:                                    ; preds = %734, %704
  %706 = load i32, i32* %39, align 4
  %707 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %708 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %707, i32 0, i32 45
  %709 = load i32, i32* %708, align 8
  %710 = icmp slt i32 %706, %709
  br i1 %710, label %711, label %737

; <label>:711:                                    ; preds = %705
  %pgocount34 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 35)
  %712 = add i64 %pgocount34, 1
  store i64 %712, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 35)
  store i32 0, i32* %38, align 4
  br label %713

; <label>:713:                                    ; preds = %729, %711
  %714 = load i32, i32* %38, align 4
  %715 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %716 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %715, i32 0, i32 46
  %717 = load i32, i32* %716, align 4
  %718 = icmp slt i32 %714, %717
  br i1 %718, label %719, label %733

; <label>:719:                                    ; preds = %713
  %720 = load i32, i32* %39, align 4
  %721 = sext i32 %720 to i64
  %722 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %23, i64 0, i64 %721
  %723 = load i32, i32* %38, align 4
  %724 = sext i32 %723 to i64
  %725 = getelementptr inbounds [2 x i32], [2 x i32]* %722, i64 0, i64 %724
  %726 = load i32, i32* %725, align 4
  %727 = load i32, i32* %29, align 4
  %728 = add nsw i32 %727, %726
  store i32 %728, i32* %29, align 4
  br label %729

; <label>:729:                                    ; preds = %719
  %pgocount35 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 1)
  %730 = add i64 %pgocount35, 1
  store i64 %730, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 1)
  %731 = load i32, i32* %38, align 4
  %732 = add nsw i32 %731, 1
  store i32 %732, i32* %38, align 4
  br label %713

; <label>:733:                                    ; preds = %713
  br label %734

; <label>:734:                                    ; preds = %733
  %735 = load i32, i32* %39, align 4
  %736 = add nsw i32 %735, 1
  store i32 %736, i32* %39, align 4
  br label %705

; <label>:737:                                    ; preds = %705
  %pgocount36 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 42)
  %738 = add i64 %pgocount36, 1
  store i64 %738, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 42)
  br label %739

; <label>:739:                                    ; preds = %737, %648
  %740 = load i32, i32* %29, align 4
  %741 = load i32, i32* %35, align 4
  %742 = icmp sle i32 %740, %741
  br i1 %742, label %743, label %744

; <label>:743:                                    ; preds = %739
  br label %747

; <label>:744:                                    ; preds = %739
  %pgocount37 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 48)
  %745 = add i64 %pgocount37, 1
  store i64 %745, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 48)
  call void @__assert_fail(i8* getelementptr inbounds ([18 x i8], [18 x i8]* @.str.4, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 552, i8* getelementptr inbounds ([171 x i8], [171 x i8]* @__PRETTY_FUNCTION__.VBR_iteration_loop, i32 0, i32 0)) #8
  unreachable
                                                  ; No predecessors!
  br label %747

; <label>:747:                                    ; preds = %746, %743
  store i32 0, i32* %39, align 4
  br label %748

; <label>:748:                                    ; preds = %890, %747
  %749 = load i32, i32* %39, align 4
  %750 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %751 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %750, i32 0, i32 45
  %752 = load i32, i32* %751, align 8
  %753 = icmp slt i32 %749, %752
  br i1 %753, label %754, label %894

; <label>:754:                                    ; preds = %748
  store i32 0, i32* %38, align 4
  br label %755

; <label>:755:                                    ; preds = %886, %754
  %756 = load i32, i32* %38, align 4
  %757 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %758 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %757, i32 0, i32 46
  %759 = load i32, i32* %758, align 4
  %760 = icmp slt i32 %756, %759
  br i1 %760, label %761, label %889

; <label>:761:                                    ; preds = %755
  %762 = load i32, i32* %41, align 4
  %763 = icmp ne i32 %762, 0
  br i1 %763, label %._crit_edge1, label %765

._crit_edge1:                                     ; preds = %761
  %pgocount38 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 23)
  %764 = add i64 %pgocount38, 1
  store i64 %764, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 23)
  br label %773

; <label>:765:                                    ; preds = %761
  %pgocount39 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 4)
  %766 = add i64 %pgocount39, 1
  store i64 %766, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 4)
  %767 = load i32, i32* @reduce_sidechannel, align 4
  %768 = icmp ne i32 %767, 0
  br i1 %768, label %769, label %885

; <label>:769:                                    ; preds = %765
  %pgocount40 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 12)
  %770 = add i64 %pgocount40, 1
  store i64 %770, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 12)
  %771 = load i32, i32* %38, align 4
  %772 = icmp eq i32 %771, 1
  br i1 %772, label %773, label %885

; <label>:773:                                    ; preds = %769, %._crit_edge1
  %774 = load %struct.III_side_info_t*, %struct.III_side_info_t** %14, align 8
  %775 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %774, i32 0, i32 4
  %776 = load i32, i32* %39, align 4
  %777 = sext i32 %776 to i64
  %778 = getelementptr inbounds [2 x %struct.anon], [2 x %struct.anon]* %775, i64 0, i64 %777
  %779 = getelementptr inbounds %struct.anon, %struct.anon* %778, i32 0, i32 0
  %780 = load i32, i32* %38, align 4
  %781 = sext i32 %780 to i64
  %782 = getelementptr inbounds [2 x %struct.gr_info_ss], [2 x %struct.gr_info_ss]* %779, i64 0, i64 %781
  %783 = getelementptr inbounds %struct.gr_info_ss, %struct.gr_info_ss* %782, i32 0, i32 0
  store %struct.gr_info* %783, %struct.gr_info** %22, align 8
  %784 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %785 = load [2 x [576 x double]]*, [2 x [576 x double]]** %12, align 8
  %786 = load i32, i32* %39, align 4
  %787 = sext i32 %786 to i64
  %788 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %785, i64 %787
  %789 = load i32, i32* %38, align 4
  %790 = sext i32 %789 to i64
  %791 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %788, i64 0, i64 %790
  %792 = getelementptr inbounds [576 x double], [576 x double]* %791, i32 0, i32 0
  %793 = load %struct.gr_info*, %struct.gr_info** %22, align 8
  %794 = call i32 @init_outer_loop(%struct.lame_global_flags* %784, double* %792, %struct.gr_info* %793)
  %795 = icmp ne i32 %794, 0
  br i1 %795, label %819, label %796

; <label>:796:                                    ; preds = %773
  %pgocount41 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 11)
  %797 = add i64 %pgocount41, 1
  store i64 %797, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 11)
  %798 = load [2 x %struct.III_scalefac_t]*, [2 x %struct.III_scalefac_t]** %16, align 8
  %799 = load i32, i32* %39, align 4
  %800 = sext i32 %799 to i64
  %801 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %798, i64 %800
  %802 = load i32, i32* %38, align 4
  %803 = sext i32 %802 to i64
  %804 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %801, i64 0, i64 %803
  %805 = bitcast %struct.III_scalefac_t* %804 to i8*
  call void @llvm.memset.p0i8.i64(i8* %805, i8 0, i64 244, i32 4, i1 false)
  %806 = load [2 x [576 x i32]]*, [2 x [576 x i32]]** %15, align 8
  %807 = load i32, i32* %39, align 4
  %808 = sext i32 %807 to i64
  %809 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %806, i64 %808
  %810 = load i32, i32* %38, align 4
  %811 = sext i32 %810 to i64
  %812 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %809, i64 0, i64 %811
  %813 = getelementptr inbounds [576 x i32], [576 x i32]* %812, i32 0, i32 0
  %814 = bitcast i32* %813 to i8*
  call void @llvm.memset.p0i8.i64(i8* %814, i8 0, i64 2304, i32 4, i1 false)
  %815 = getelementptr inbounds [4 x double], [4 x double]* %24, i64 0, i64 3
  store double 0.000000e+00, double* %815, align 8
  %816 = getelementptr inbounds [4 x double], [4 x double]* %24, i64 0, i64 2
  store double 0.000000e+00, double* %816, align 16
  %817 = getelementptr inbounds [4 x double], [4 x double]* %24, i64 0, i64 1
  store double 0.000000e+00, double* %817, align 8
  %818 = getelementptr inbounds [4 x double], [4 x double]* %24, i64 0, i64 0
  store double 0.000000e+00, double* %818, align 16
  br label %883

; <label>:819:                                    ; preds = %773
  %820 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %821 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %820, i32 0, i32 22
  %822 = load i32, i32* %821, align 4
  %823 = load i32, i32* %39, align 4
  %824 = sext i32 %823 to i64
  %825 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %23, i64 0, i64 %824
  %826 = load i32, i32* %38, align 4
  %827 = sext i32 %826 to i64
  %828 = getelementptr inbounds [2 x i32], [2 x i32]* %825, i64 0, i64 %827
  %829 = load i32, i32* %828, align 4
  call void @set_masking_lower(i32 %822, i32 %829)
  %830 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %831 = load [2 x [576 x double]]*, [2 x [576 x double]]** %12, align 8
  %832 = load i32, i32* %39, align 4
  %833 = sext i32 %832 to i64
  %834 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %831, i64 %833
  %835 = load i32, i32* %38, align 4
  %836 = sext i32 %835 to i64
  %837 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %834, i64 0, i64 %836
  %838 = getelementptr inbounds [576 x double], [576 x double]* %837, i32 0, i32 0
  %839 = load [2 x %struct.III_psy_ratio]*, [2 x %struct.III_psy_ratio]** %13, align 8
  %840 = load i32, i32* %39, align 4
  %841 = sext i32 %840 to i64
  %842 = getelementptr inbounds [2 x %struct.III_psy_ratio], [2 x %struct.III_psy_ratio]* %839, i64 %841
  %843 = load i32, i32* %38, align 4
  %844 = sext i32 %843 to i64
  %845 = getelementptr inbounds [2 x %struct.III_psy_ratio], [2 x %struct.III_psy_ratio]* %842, i64 0, i64 %844
  %846 = load %struct.gr_info*, %struct.gr_info** %22, align 8
  %847 = call i32 @calc_xmin(%struct.lame_global_flags* %830, double* %838, %struct.III_psy_ratio* %845, %struct.gr_info* %846, %struct.III_psy_xmin* %21)
  %848 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %849 = load [2 x [576 x double]]*, [2 x [576 x double]]** %12, align 8
  %850 = load i32, i32* %39, align 4
  %851 = sext i32 %850 to i64
  %852 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %849, i64 %851
  %853 = load i32, i32* %38, align 4
  %854 = sext i32 %853 to i64
  %855 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %852, i64 0, i64 %854
  %856 = getelementptr inbounds [576 x double], [576 x double]* %855, i32 0, i32 0
  %857 = load i32, i32* %39, align 4
  %858 = sext i32 %857 to i64
  %859 = getelementptr inbounds [2 x [2 x i32]], [2 x [2 x i32]]* %23, i64 0, i64 %858
  %860 = load i32, i32* %38, align 4
  %861 = sext i32 %860 to i64
  %862 = getelementptr inbounds [2 x i32], [2 x i32]* %859, i64 0, i64 %861
  %863 = load i32, i32* %862, align 4
  %864 = getelementptr inbounds [4 x double], [4 x double]* %24, i32 0, i32 0
  %865 = load [2 x [576 x i32]]*, [2 x [576 x i32]]** %15, align 8
  %866 = load i32, i32* %39, align 4
  %867 = sext i32 %866 to i64
  %868 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %865, i64 %867
  %869 = load i32, i32* %38, align 4
  %870 = sext i32 %869 to i64
  %871 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %868, i64 0, i64 %870
  %872 = getelementptr inbounds [576 x i32], [576 x i32]* %871, i32 0, i32 0
  %873 = load [2 x %struct.III_scalefac_t]*, [2 x %struct.III_scalefac_t]** %16, align 8
  %874 = load i32, i32* %39, align 4
  %875 = sext i32 %874 to i64
  %876 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %873, i64 %875
  %877 = load i32, i32* %38, align 4
  %878 = sext i32 %877 to i64
  %879 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %876, i64 0, i64 %878
  %880 = load %struct.gr_info*, %struct.gr_info** %22, align 8
  %881 = getelementptr inbounds [4 x [21 x double]], [4 x [21 x double]]* %26, i32 0, i32 0
  %882 = load i32, i32* %38, align 4
  call void @outer_loop(%struct.lame_global_flags* %848, double* %856, i32 %863, double* %864, %struct.III_psy_xmin* %21, i32* %872, %struct.III_scalefac_t* %879, %struct.gr_info* %880, [21 x double]* %881, i32 %882)
  br label %883

; <label>:883:                                    ; preds = %819, %796
  %pgocount42 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 13)
  %884 = add i64 %pgocount42, 1
  store i64 %884, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 13)
  br label %885

; <label>:885:                                    ; preds = %883, %769, %765
  br label %886

; <label>:886:                                    ; preds = %885
  %887 = load i32, i32* %38, align 4
  %888 = add nsw i32 %887, 1
  store i32 %888, i32* %38, align 4
  br label %755

; <label>:889:                                    ; preds = %755
  br label %890

; <label>:890:                                    ; preds = %889
  %pgocount43 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 27)
  %891 = add i64 %pgocount43, 1
  store i64 %891, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 27)
  %892 = load i32, i32* %39, align 4
  %893 = add nsw i32 %892, 1
  store i32 %893, i32* %39, align 4
  br label %748

; <label>:894:                                    ; preds = %748
  store i32 0, i32* %39, align 4
  br label %895

; <label>:895:                                    ; preds = %952, %894
  %896 = load i32, i32* %39, align 4
  %897 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %898 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %897, i32 0, i32 45
  %899 = load i32, i32* %898, align 8
  %900 = icmp slt i32 %896, %899
  br i1 %900, label %901, label %956

; <label>:901:                                    ; preds = %895
  store i32 0, i32* %38, align 4
  br label %902

; <label>:902:                                    ; preds = %948, %901
  %903 = load i32, i32* %38, align 4
  %904 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %905 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %904, i32 0, i32 46
  %906 = load i32, i32* %905, align 4
  %907 = icmp slt i32 %903, %906
  br i1 %907, label %908, label %951

; <label>:908:                                    ; preds = %902
  %909 = load %struct.III_side_info_t*, %struct.III_side_info_t** %14, align 8
  %910 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %909, i32 0, i32 4
  %911 = load i32, i32* %39, align 4
  %912 = sext i32 %911 to i64
  %913 = getelementptr inbounds [2 x %struct.anon], [2 x %struct.anon]* %910, i64 0, i64 %912
  %914 = getelementptr inbounds %struct.anon, %struct.anon* %913, i32 0, i32 0
  %915 = load i32, i32* %38, align 4
  %916 = sext i32 %915 to i64
  %917 = getelementptr inbounds [2 x %struct.gr_info_ss], [2 x %struct.gr_info_ss]* %914, i64 0, i64 %916
  %918 = getelementptr inbounds %struct.gr_info_ss, %struct.gr_info_ss* %917, i32 0, i32 0
  store %struct.gr_info* %918, %struct.gr_info** %22, align 8
  %919 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %920 = load i32, i32* %39, align 4
  %921 = load i32, i32* %38, align 4
  %922 = load [2 x [576 x i32]]*, [2 x [576 x i32]]** %15, align 8
  %923 = load %struct.III_side_info_t*, %struct.III_side_info_t** %14, align 8
  %924 = load [2 x %struct.III_scalefac_t]*, [2 x %struct.III_scalefac_t]** %16, align 8
  call void @best_scalefac_store(%struct.lame_global_flags* %919, i32 %920, i32 %921, [2 x [576 x i32]]* %922, %struct.III_side_info_t* %923, [2 x %struct.III_scalefac_t]* %924)
  %925 = load %struct.gr_info*, %struct.gr_info** %22, align 8
  %926 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %925, i32 0, i32 6
  %927 = load i32, i32* %926, align 8
  %928 = icmp eq i32 %927, 0
  br i1 %928, label %930, label %._crit_edge2

._crit_edge2:                                     ; preds = %908
  %pgocount44 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 24)
  %929 = add i64 %pgocount44, 1
  store i64 %929, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 24)
  br label %943

; <label>:930:                                    ; preds = %908
  %pgocount45 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 5)
  %931 = add i64 %pgocount45, 1
  store i64 %931, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 5)
  %932 = load i32, i32* %39, align 4
  %933 = load i32, i32* %38, align 4
  %934 = load %struct.gr_info*, %struct.gr_info** %22, align 8
  %935 = load [2 x [576 x i32]]*, [2 x [576 x i32]]** %15, align 8
  %936 = load i32, i32* %39, align 4
  %937 = sext i32 %936 to i64
  %938 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %935, i64 %937
  %939 = load i32, i32* %38, align 4
  %940 = sext i32 %939 to i64
  %941 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %938, i64 0, i64 %940
  %942 = getelementptr inbounds [576 x i32], [576 x i32]* %941, i32 0, i32 0
  call void @best_huffman_divide(i32 %932, i32 %933, %struct.gr_info* %934, i32* %942)
  br label %943

; <label>:943:                                    ; preds = %930, %._crit_edge2
  %944 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %945 = load %struct.gr_info*, %struct.gr_info** %22, align 8
  %946 = load %struct.III_side_info_t*, %struct.III_side_info_t** %14, align 8
  %947 = load i32, i32* %36, align 4
  call void @ResvAdjust(%struct.lame_global_flags* %944, %struct.gr_info* %945, %struct.III_side_info_t* %946, i32 %947)
  br label %948

; <label>:948:                                    ; preds = %943
  %949 = load i32, i32* %38, align 4
  %950 = add nsw i32 %949, 1
  store i32 %950, i32* %38, align 4
  br label %902

; <label>:951:                                    ; preds = %902
  br label %952

; <label>:952:                                    ; preds = %951
  %pgocount46 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 28)
  %953 = add i64 %pgocount46, 1
  store i64 %953, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 28)
  %954 = load i32, i32* %39, align 4
  %955 = add nsw i32 %954, 1
  store i32 %955, i32* %39, align 4
  br label %895

; <label>:956:                                    ; preds = %895
  store i32 0, i32* %39, align 4
  br label %957

; <label>:957:                                    ; preds = %1012, %956
  %958 = load i32, i32* %39, align 4
  %959 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %960 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %959, i32 0, i32 45
  %961 = load i32, i32* %960, align 8
  %962 = icmp slt i32 %958, %961
  br i1 %962, label %963, label %1016

; <label>:963:                                    ; preds = %957
  store i32 0, i32* %38, align 4
  br label %964

; <label>:964:                                    ; preds = %1007, %963
  %965 = load i32, i32* %38, align 4
  %966 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %967 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %966, i32 0, i32 46
  %968 = load i32, i32* %967, align 4
  %969 = icmp slt i32 %965, %968
  br i1 %969, label %970, label %1011

; <label>:970:                                    ; preds = %964
  store i32 0, i32* %37, align 4
  br label %971

; <label>:971:                                    ; preds = %1002, %970
  %972 = load i32, i32* %37, align 4
  %973 = icmp slt i32 %972, 576
  br i1 %973, label %974, label %1006

; <label>:974:                                    ; preds = %971
  %975 = load [2 x [576 x double]]*, [2 x [576 x double]]** %12, align 8
  %976 = load i32, i32* %39, align 4
  %977 = sext i32 %976 to i64
  %978 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %975, i64 %977
  %979 = load i32, i32* %38, align 4
  %980 = sext i32 %979 to i64
  %981 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %978, i64 0, i64 %980
  %982 = load i32, i32* %37, align 4
  %983 = sext i32 %982 to i64
  %984 = getelementptr inbounds [576 x double], [576 x double]* %981, i64 0, i64 %983
  %985 = load double, double* %984, align 8
  %986 = fcmp olt double %985, 0.000000e+00
  br i1 %986, label %987, label %1001

; <label>:987:                                    ; preds = %974
  %pgocount47 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 25)
  %988 = add i64 %pgocount47, 1
  store i64 %988, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 25)
  %989 = load [2 x [576 x i32]]*, [2 x [576 x i32]]** %15, align 8
  %990 = load i32, i32* %39, align 4
  %991 = sext i32 %990 to i64
  %992 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %989, i64 %991
  %993 = load i32, i32* %38, align 4
  %994 = sext i32 %993 to i64
  %995 = getelementptr inbounds [2 x [576 x i32]], [2 x [576 x i32]]* %992, i64 0, i64 %994
  %996 = load i32, i32* %37, align 4
  %997 = sext i32 %996 to i64
  %998 = getelementptr inbounds [576 x i32], [576 x i32]* %995, i64 0, i64 %997
  %999 = load i32, i32* %998, align 4
  %1000 = mul nsw i32 %999, -1
  store i32 %1000, i32* %998, align 4
  br label %1001

; <label>:1001:                                   ; preds = %987, %974
  br label %1002

; <label>:1002:                                   ; preds = %1001
  %pgocount48 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 20)
  %1003 = add i64 %pgocount48, 1
  store i64 %1003, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 20)
  %1004 = load i32, i32* %37, align 4
  %1005 = add nsw i32 %1004, 1
  store i32 %1005, i32* %37, align 4
  br label %971

; <label>:1006:                                   ; preds = %971
  br label %1007

; <label>:1007:                                   ; preds = %1006
  %pgocount49 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 3)
  %1008 = add i64 %pgocount49, 1
  store i64 %1008, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 3)
  %1009 = load i32, i32* %38, align 4
  %1010 = add nsw i32 %1009, 1
  store i32 %1010, i32* %38, align 4
  br label %964

; <label>:1011:                                   ; preds = %964
  br label %1012

; <label>:1012:                                   ; preds = %1011
  %pgocount50 = load i64, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 29)
  %1013 = add i64 %pgocount50, 1
  store i64 %1013, i64* getelementptr inbounds ([49 x i64], [49 x i64]* @__profc_VBR_iteration_loop, i64 0, i64 29)
  %1014 = load i32, i32* %39, align 4
  %1015 = add nsw i32 %1014, 1
  store i32 %1015, i32* %39, align 4
  br label %957

; <label>:1016:                                   ; preds = %957
  %1017 = load %struct.lame_global_flags*, %struct.lame_global_flags** %9, align 8
  %1018 = load %struct.III_side_info_t*, %struct.III_side_info_t** %14, align 8
  %1019 = load i32, i32* %36, align 4
  call void @ResvFrameEnd(%struct.lame_global_flags* %1017, %struct.III_side_info_t* %1018, i32 %1019)
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) #4

; Function Attrs: noinline nounwind uwtable
define i32 @VBR_compare(i32, double, double, double, i32, double, double, double) #0 {
  %9 = alloca i32, align 4
  %10 = alloca double, align 8
  %11 = alloca double, align 8
  %12 = alloca double, align 8
  %13 = alloca i32, align 4
  %14 = alloca double, align 8
  %15 = alloca double, align 8
  %16 = alloca double, align 8
  %17 = alloca i32, align 4
  store i32 %0, i32* %9, align 4
  store double %1, double* %10, align 8
  store double %2, double* %11, align 8
  store double %3, double* %12, align 8
  store i32 %4, i32* %13, align 4
  store double %5, double* %14, align 8
  store double %6, double* %15, align 8
  store double %7, double* %16, align 8
  store i32 0, i32* %17, align 4
  %18 = load i32, i32* %13, align 4
  %19 = load i32, i32* %9, align 4
  %20 = icmp sle i32 %18, %19
  br i1 %20, label %21, label %36

; <label>:21:                                     ; preds = %8
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_VBR_compare, i64 0, i64 1)
  %22 = add i64 %pgocount, 1
  store i64 %22, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_VBR_compare, i64 0, i64 1)
  %23 = load double, double* %15, align 8
  %24 = load double, double* %11, align 8
  %25 = fcmp ole double %23, %24
  br i1 %25, label %26, label %36

; <label>:26:                                     ; preds = %21
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_VBR_compare, i64 0, i64 2)
  %27 = add i64 %pgocount1, 1
  store i64 %27, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_VBR_compare, i64 0, i64 2)
  %28 = load double, double* %14, align 8
  %29 = load double, double* %10, align 8
  %30 = fcmp ole double %28, %29
  br i1 %30, label %31, label %36

; <label>:31:                                     ; preds = %26
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_VBR_compare, i64 0, i64 3)
  %32 = add i64 %pgocount2, 1
  store i64 %32, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_VBR_compare, i64 0, i64 3)
  %33 = load double, double* %16, align 8
  %34 = load double, double* %12, align 8
  %35 = fcmp ole double %33, %34
  br label %36

; <label>:36:                                     ; preds = %31, %26, %21, %8
  %37 = phi i1 [ false, %26 ], [ false, %21 ], [ false, %8 ], [ %35, %31 ]
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_VBR_compare, i64 0, i64 0)
  %38 = add i64 %pgocount3, 1
  store i64 %38, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_VBR_compare, i64 0, i64 0)
  %39 = zext i1 %37 to i32
  store i32 %39, i32* %17, align 4
  %40 = load i32, i32* %17, align 4
  ret i32 %40
}

; Function Attrs: nounwind
declare double @log(double) #3

; Function Attrs: nounwind readnone
declare double @fabs(double) #5

; Function Attrs: nounwind
declare double @sqrt(double) #3

declare i32 @bin_search_StepSize2(%struct.lame_global_flags*, i32, i32, i32*, double*, %struct.gr_info*) #1

declare i32 @inner_loop(%struct.lame_global_flags*, double*, i32*, i32, %struct.gr_info*) #1

; Function Attrs: noinline nounwind uwtable
define i32 @calc_noise1(double*, i32*, %struct.gr_info*, [21 x double]*, [21 x double]*, %struct.III_psy_xmin*, %struct.III_scalefac_t*, double*, double*, double*) #0 {
  %11 = alloca double*, align 8
  %12 = alloca i32*, align 8
  %13 = alloca %struct.gr_info*, align 8
  %14 = alloca [21 x double]*, align 8
  %15 = alloca [21 x double]*, align 8
  %16 = alloca %struct.III_psy_xmin*, align 8
  %17 = alloca %struct.III_scalefac_t*, align 8
  %18 = alloca double*, align 8
  %19 = alloca double*, align 8
  %20 = alloca double*, align 8
  %21 = alloca i32, align 4
  %22 = alloca i32, align 4
  %23 = alloca i32, align 4
  %24 = alloca i32, align 4
  %25 = alloca i32, align 4
  %26 = alloca i32, align 4
  %27 = alloca double, align 8
  %28 = alloca double, align 8
  %29 = alloca double, align 8
  %30 = alloca i32, align 4
  %31 = alloca double, align 8
  %32 = alloca double, align 8
  %33 = alloca i32, align 4
  %34 = alloca double, align 8
  %35 = alloca i32, align 4
  %36 = alloca double, align 8
  store double* %0, double** %11, align 8
  store i32* %1, i32** %12, align 8
  store %struct.gr_info* %2, %struct.gr_info** %13, align 8
  store [21 x double]* %3, [21 x double]** %14, align 8
  store [21 x double]* %4, [21 x double]** %15, align 8
  store %struct.III_psy_xmin* %5, %struct.III_psy_xmin** %16, align 8
  store %struct.III_scalefac_t* %6, %struct.III_scalefac_t** %17, align 8
  store double* %7, double** %18, align 8
  store double* %8, double** %19, align 8
  store double* %9, double** %20, align 8
  store i32 0, i32* %25, align 4
  store i32 0, i32* %30, align 4
  %37 = load double*, double** %18, align 8
  store double 0.000000e+00, double* %37, align 8
  %38 = load double*, double** %19, align 8
  store double 0.000000e+00, double* %38, align 8
  %39 = load double*, double** %20, align 8
  store double -9.990000e+02, double* %39, align 8
  store i32 0, i32* %26, align 4
  br label %40

; <label>:40:                                     ; preds = %219, %10
  %41 = load i32, i32* %26, align 4
  %42 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %43 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %42, i32 0, i32 16
  %44 = load i32, i32* %43, align 8
  %45 = icmp ult i32 %41, %44
  br i1 %45, label %46, label %222

; <label>:46:                                     ; preds = %40
  %47 = load %struct.III_scalefac_t*, %struct.III_scalefac_t** %17, align 8
  %48 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %47, i32 0, i32 0
  %49 = load i32, i32* %26, align 4
  %50 = zext i32 %49 to i64
  %51 = getelementptr inbounds [22 x i32], [22 x i32]* %48, i64 0, i64 %50
  %52 = load i32, i32* %51, align 4
  store i32 %52, i32* %33, align 4
  %53 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %54 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %53, i32 0, i32 12
  %55 = load i32, i32* %54, align 8
  %56 = icmp ne i32 %55, 0
  br i1 %56, label %57, label %65

; <label>:57:                                     ; preds = %46
  %pgocount = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_calc_noise1, i64 0, i64 7)
  %58 = add i64 %pgocount, 1
  store i64 %58, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_calc_noise1, i64 0, i64 7)
  %59 = load i32, i32* %26, align 4
  %60 = zext i32 %59 to i64
  %61 = getelementptr inbounds [21 x i32], [21 x i32]* @pretab, i64 0, i64 %60
  %62 = load i32, i32* %61, align 4
  %63 = load i32, i32* %33, align 4
  %64 = add nsw i32 %63, %62
  store i32 %64, i32* %33, align 4
  br label %65

; <label>:65:                                     ; preds = %57, %46
  %66 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %67 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %66, i32 0, i32 3
  %68 = load i32, i32* %67, align 4
  %69 = load i32, i32* %33, align 4
  %70 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %71 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %70, i32 0, i32 13
  %72 = load i32, i32* %71, align 4
  %73 = add i32 %72, 1
  %74 = shl i32 %69, %73
  %75 = sub i32 %68, %74
  store i32 %75, i32* %33, align 4
  %76 = load i32, i32* %33, align 4
  %77 = icmp slt i32 %76, 256
  br i1 %77, label %78, label %79

; <label>:78:                                     ; preds = %65
  br label %82

; <label>:79:                                     ; preds = %65
  %pgocount1 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_calc_noise1, i64 0, i64 17)
  %80 = add i64 %pgocount1, 1
  store i64 %80, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_calc_noise1, i64 0, i64 17)
  call void @__assert_fail(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 945, i8* getelementptr inbounds ([140 x i8], [140 x i8]* @__PRETTY_FUNCTION__.calc_noise1, i32 0, i32 0)) #8
  unreachable
                                                  ; No predecessors!
  br label %82

; <label>:82:                                     ; preds = %81, %78
  %83 = load i32, i32* %33, align 4
  %84 = icmp sge i32 %83, 0
  br i1 %84, label %85, label %86

; <label>:85:                                     ; preds = %82
  br label %89

; <label>:86:                                     ; preds = %82
  %pgocount2 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_calc_noise1, i64 0, i64 18)
  %87 = add i64 %pgocount2, 1
  store i64 %87, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_calc_noise1, i64 0, i64 18)
  call void @__assert_fail(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 946, i8* getelementptr inbounds ([140 x i8], [140 x i8]* @__PRETTY_FUNCTION__.calc_noise1, i32 0, i32 0)) #8
  unreachable
                                                  ; No predecessors!
  br label %89

; <label>:89:                                     ; preds = %88, %85
  %90 = load i32, i32* %33, align 4
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [256 x double], [256 x double]* @pow20, i64 0, i64 %91
  %93 = load double, double* %92, align 8
  store double %93, double* %32, align 8
  %94 = load i32, i32* %26, align 4
  %95 = zext i32 %94 to i64
  %96 = getelementptr inbounds [23 x i32], [23 x i32]* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i32 0, i32 0), i64 0, i64 %95
  %97 = load i32, i32* %96, align 4
  store i32 %97, i32* %21, align 4
  %98 = load i32, i32* %26, align 4
  %99 = add i32 %98, 1
  %100 = zext i32 %99 to i64
  %101 = getelementptr inbounds [23 x i32], [23 x i32]* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i32 0, i32 0), i64 0, i64 %100
  %102 = load i32, i32* %101, align 4
  store i32 %102, i32* %22, align 4
  %103 = load i32, i32* %22, align 4
  %104 = load i32, i32* %21, align 4
  %105 = sub nsw i32 %103, %104
  %106 = sitofp i32 %105 to double
  store double %106, double* %29, align 8
  store double 0.000000e+00, double* %27, align 8
  %107 = load i32, i32* %21, align 4
  store i32 %107, i32* %23, align 4
  br label %108

; <label>:108:                                    ; preds = %135, %89
  %109 = load i32, i32* %23, align 4
  %110 = load i32, i32* %22, align 4
  %111 = icmp slt i32 %109, %110
  br i1 %111, label %112, label %139

; <label>:112:                                    ; preds = %108
  %113 = load double*, double** %11, align 8
  %114 = load i32, i32* %23, align 4
  %115 = sext i32 %114 to i64
  %116 = getelementptr inbounds double, double* %113, i64 %115
  %117 = load double, double* %116, align 8
  %118 = call double @fabs(double %117) #7
  %119 = load i32*, i32** %12, align 8
  %120 = load i32, i32* %23, align 4
  %121 = sext i32 %120 to i64
  %122 = getelementptr inbounds i32, i32* %119, i64 %121
  %123 = load i32, i32* %122, align 4
  %124 = sext i32 %123 to i64
  %125 = getelementptr inbounds [8208 x double], [8208 x double]* @pow43, i64 0, i64 %124
  %126 = load double, double* %125, align 8
  %127 = load double, double* %32, align 8
  %128 = fmul double %126, %127
  %129 = fsub double %118, %128
  store double %129, double* %34, align 8
  %130 = load double, double* %34, align 8
  %131 = load double, double* %34, align 8
  %132 = fmul double %130, %131
  %133 = load double, double* %27, align 8
  %134 = fadd double %133, %132
  store double %134, double* %27, align 8
  br label %135

; <label>:135:                                    ; preds = %112
  %pgocount3 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_calc_noise1, i64 0, i64 1)
  %136 = add i64 %pgocount3, 1
  store i64 %136, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_calc_noise1, i64 0, i64 1)
  %137 = load i32, i32* %23, align 4
  %138 = add nsw i32 %137, 1
  store i32 %138, i32* %23, align 4
  br label %108

; <label>:139:                                    ; preds = %108
  %140 = load double, double* %27, align 8
  %141 = load double, double* %29, align 8
  %142 = fdiv double %140, %141
  %143 = load [21 x double]*, [21 x double]** %14, align 8
  %144 = getelementptr inbounds [21 x double], [21 x double]* %143, i64 0
  %145 = load i32, i32* %26, align 4
  %146 = zext i32 %145 to i64
  %147 = getelementptr inbounds [21 x double], [21 x double]* %144, i64 0, i64 %146
  store double %142, double* %147, align 8
  %148 = load [21 x double]*, [21 x double]** %14, align 8
  %149 = getelementptr inbounds [21 x double], [21 x double]* %148, i64 0
  %150 = load i32, i32* %26, align 4
  %151 = zext i32 %150 to i64
  %152 = getelementptr inbounds [21 x double], [21 x double]* %149, i64 0, i64 %151
  %153 = load double, double* %152, align 8
  %154 = load %struct.III_psy_xmin*, %struct.III_psy_xmin** %16, align 8
  %155 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %154, i32 0, i32 0
  %156 = load i32, i32* %26, align 4
  %157 = zext i32 %156 to i64
  %158 = getelementptr inbounds [22 x double], [22 x double]* %155, i64 0, i64 %157
  %159 = load double, double* %158, align 8
  %160 = fdiv double %153, %159
  %161 = fcmp ogt double 1.000000e-03, %160
  br i1 %161, label %162, label %163

; <label>:162:                                    ; preds = %139
  br label %178

; <label>:163:                                    ; preds = %139
  %pgocount4 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_calc_noise1, i64 0, i64 8)
  %164 = add i64 %pgocount4, 1
  store i64 %164, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_calc_noise1, i64 0, i64 8)
  %165 = load [21 x double]*, [21 x double]** %14, align 8
  %166 = getelementptr inbounds [21 x double], [21 x double]* %165, i64 0
  %167 = load i32, i32* %26, align 4
  %168 = zext i32 %167 to i64
  %169 = getelementptr inbounds [21 x double], [21 x double]* %166, i64 0, i64 %168
  %170 = load double, double* %169, align 8
  %171 = load %struct.III_psy_xmin*, %struct.III_psy_xmin** %16, align 8
  %172 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %171, i32 0, i32 0
  %173 = load i32, i32* %26, align 4
  %174 = zext i32 %173 to i64
  %175 = getelementptr inbounds [22 x double], [22 x double]* %172, i64 0, i64 %174
  %176 = load double, double* %175, align 8
  %177 = fdiv double %170, %176
  br label %178

; <label>:178:                                    ; preds = %163, %162
  %179 = phi double [ 1.000000e-03, %162 ], [ %177, %163 ]
  %180 = call double @log10(double %179) #6
  %181 = fmul double 1.000000e+01, %180
  store double %181, double* %31, align 8
  %182 = load double, double* %31, align 8
  %183 = load [21 x double]*, [21 x double]** %15, align 8
  %184 = getelementptr inbounds [21 x double], [21 x double]* %183, i64 0
  %185 = load i32, i32* %26, align 4
  %186 = zext i32 %185 to i64
  %187 = getelementptr inbounds [21 x double], [21 x double]* %184, i64 0, i64 %186
  store double %182, double* %187, align 8
  %188 = load double, double* %31, align 8
  %189 = fcmp ogt double %188, 0.000000e+00
  br i1 %189, label %190, label %198

; <label>:190:                                    ; preds = %178
  %pgocount5 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_calc_noise1, i64 0, i64 9)
  %191 = add i64 %pgocount5, 1
  store i64 %191, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_calc_noise1, i64 0, i64 9)
  %192 = load i32, i32* %25, align 4
  %193 = add nsw i32 %192, 1
  store i32 %193, i32* %25, align 4
  %194 = load double, double* %31, align 8
  %195 = load double*, double** %18, align 8
  %196 = load double, double* %195, align 8
  %197 = fadd double %196, %194
  store double %197, double* %195, align 8
  br label %198

; <label>:198:                                    ; preds = %190, %178
  %199 = load double, double* %31, align 8
  %200 = load double*, double** %19, align 8
  %201 = load double, double* %200, align 8
  %202 = fadd double %201, %199
  store double %202, double* %200, align 8
  %203 = load double*, double** %20, align 8
  %204 = load double, double* %203, align 8
  %205 = load double, double* %31, align 8
  %206 = fcmp ogt double %204, %205
  br i1 %206, label %207, label %211

; <label>:207:                                    ; preds = %198
  %pgocount6 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_calc_noise1, i64 0, i64 10)
  %208 = add i64 %pgocount6, 1
  store i64 %208, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_calc_noise1, i64 0, i64 10)
  %209 = load double*, double** %20, align 8
  %210 = load double, double* %209, align 8
  br label %214

; <label>:211:                                    ; preds = %198
  %pgocount7 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_calc_noise1, i64 0, i64 11)
  %212 = add i64 %pgocount7, 1
  store i64 %212, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_calc_noise1, i64 0, i64 11)
  %213 = load double, double* %31, align 8
  br label %214

; <label>:214:                                    ; preds = %211, %207
  %215 = phi double [ %210, %207 ], [ %213, %211 ]
  %216 = load double*, double** %20, align 8
  store double %215, double* %216, align 8
  %217 = load i32, i32* %30, align 4
  %218 = add nsw i32 %217, 1
  store i32 %218, i32* %30, align 4
  br label %219

; <label>:219:                                    ; preds = %214
  %220 = load i32, i32* %26, align 4
  %221 = add i32 %220, 1
  store i32 %221, i32* %26, align 4
  br label %40

; <label>:222:                                    ; preds = %40
  store i32 0, i32* %24, align 4
  br label %223

; <label>:223:                                    ; preds = %432, %222
  %224 = load i32, i32* %24, align 4
  %225 = icmp slt i32 %224, 3
  br i1 %225, label %226, label %436

; <label>:226:                                    ; preds = %223
  %227 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %228 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %227, i32 0, i32 17
  %229 = load i32, i32* %228, align 4
  store i32 %229, i32* %26, align 4
  br label %230

; <label>:230:                                    ; preds = %428, %226
  %231 = load i32, i32* %26, align 4
  %232 = icmp ult i32 %231, 12
  br i1 %232, label %233, label %431

; <label>:233:                                    ; preds = %230
  %234 = load %struct.III_scalefac_t*, %struct.III_scalefac_t** %17, align 8
  %235 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %234, i32 0, i32 1
  %236 = load i32, i32* %26, align 4
  %237 = zext i32 %236 to i64
  %238 = getelementptr inbounds [13 x [3 x i32]], [13 x [3 x i32]]* %235, i64 0, i64 %237
  %239 = load i32, i32* %24, align 4
  %240 = sext i32 %239 to i64
  %241 = getelementptr inbounds [3 x i32], [3 x i32]* %238, i64 0, i64 %240
  %242 = load i32, i32* %241, align 4
  %243 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %244 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %243, i32 0, i32 13
  %245 = load i32, i32* %244, align 4
  %246 = add i32 %245, 1
  %247 = shl i32 %242, %246
  %248 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %249 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %248, i32 0, i32 9
  %250 = load i32, i32* %24, align 4
  %251 = sext i32 %250 to i64
  %252 = getelementptr inbounds [3 x i32], [3 x i32]* %249, i64 0, i64 %251
  %253 = load i32, i32* %252, align 4
  %254 = mul nsw i32 %253, 8
  %255 = add nsw i32 %247, %254
  store i32 %255, i32* %35, align 4
  %256 = load %struct.gr_info*, %struct.gr_info** %13, align 8
  %257 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %256, i32 0, i32 3
  %258 = load i32, i32* %257, align 4
  %259 = load i32, i32* %35, align 4
  %260 = sub i32 %258, %259
  store i32 %260, i32* %35, align 4
  %261 = load i32, i32* %35, align 4
  %262 = icmp slt i32 %261, 256
  br i1 %262, label %263, label %264

; <label>:263:                                    ; preds = %233
  br label %267

; <label>:264:                                    ; preds = %233
  %pgocount8 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_calc_noise1, i64 0, i64 15)
  %265 = add i64 %pgocount8, 1
  store i64 %265, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_calc_noise1, i64 0, i64 15)
  call void @__assert_fail(i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.7, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 1000, i8* getelementptr inbounds ([140 x i8], [140 x i8]* @__PRETTY_FUNCTION__.calc_noise1, i32 0, i32 0)) #8
  unreachable
                                                  ; No predecessors!
  br label %267

; <label>:267:                                    ; preds = %266, %263
  %268 = load i32, i32* %35, align 4
  %269 = icmp sge i32 %268, 0
  br i1 %269, label %270, label %271

; <label>:270:                                    ; preds = %267
  br label %274

; <label>:271:                                    ; preds = %267
  %pgocount9 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_calc_noise1, i64 0, i64 16)
  %272 = add i64 %pgocount9, 1
  store i64 %272, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_calc_noise1, i64 0, i64 16)
  call void @__assert_fail(i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.8, i32 0, i32 0), i8* getelementptr inbounds ([11 x i8], [11 x i8]* @.str.1, i32 0, i32 0), i32 1001, i8* getelementptr inbounds ([140 x i8], [140 x i8]* @__PRETTY_FUNCTION__.calc_noise1, i32 0, i32 0)) #8
  unreachable
                                                  ; No predecessors!
  br label %274

; <label>:274:                                    ; preds = %273, %270
  %275 = load i32, i32* %35, align 4
  %276 = sext i32 %275 to i64
  %277 = getelementptr inbounds [256 x double], [256 x double]* @pow20, i64 0, i64 %276
  %278 = load double, double* %277, align 8
  store double %278, double* %28, align 8
  %279 = load i32, i32* %26, align 4
  %280 = zext i32 %279 to i64
  %281 = getelementptr inbounds [14 x i32], [14 x i32]* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i32 0, i32 1), i64 0, i64 %280
  %282 = load i32, i32* %281, align 4
  store i32 %282, i32* %21, align 4
  %283 = load i32, i32* %26, align 4
  %284 = add i32 %283, 1
  %285 = zext i32 %284 to i64
  %286 = getelementptr inbounds [14 x i32], [14 x i32]* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i32 0, i32 1), i64 0, i64 %285
  %287 = load i32, i32* %286, align 4
  store i32 %287, i32* %22, align 4
  %288 = load i32, i32* %22, align 4
  %289 = load i32, i32* %21, align 4
  %290 = sub nsw i32 %288, %289
  %291 = sitofp i32 %290 to double
  store double %291, double* %29, align 8
  store double 0.000000e+00, double* %27, align 8
  %292 = load i32, i32* %21, align 4
  store i32 %292, i32* %23, align 4
  br label %293

; <label>:293:                                    ; preds = %327, %274
  %294 = load i32, i32* %23, align 4
  %295 = load i32, i32* %22, align 4
  %296 = icmp slt i32 %294, %295
  br i1 %296, label %297, label %330

; <label>:297:                                    ; preds = %293
  %pgocount10 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_calc_noise1, i64 0, i64 0)
  %298 = add i64 %pgocount10, 1
  store i64 %298, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_calc_noise1, i64 0, i64 0)
  %299 = load double*, double** %11, align 8
  %300 = load i32, i32* %23, align 4
  %301 = mul nsw i32 %300, 3
  %302 = load i32, i32* %24, align 4
  %303 = add nsw i32 %301, %302
  %304 = sext i32 %303 to i64
  %305 = getelementptr inbounds double, double* %299, i64 %304
  %306 = load double, double* %305, align 8
  %307 = call double @fabs(double %306) #7
  %308 = load i32*, i32** %12, align 8
  %309 = load i32, i32* %23, align 4
  %310 = mul nsw i32 %309, 3
  %311 = load i32, i32* %24, align 4
  %312 = add nsw i32 %310, %311
  %313 = sext i32 %312 to i64
  %314 = getelementptr inbounds i32, i32* %308, i64 %313
  %315 = load i32, i32* %314, align 4
  %316 = sext i32 %315 to i64
  %317 = getelementptr inbounds [8208 x double], [8208 x double]* @pow43, i64 0, i64 %316
  %318 = load double, double* %317, align 8
  %319 = load double, double* %28, align 8
  %320 = fmul double %318, %319
  %321 = fsub double %307, %320
  store double %321, double* %36, align 8
  %322 = load double, double* %36, align 8
  %323 = load double, double* %36, align 8
  %324 = fmul double %322, %323
  %325 = load double, double* %27, align 8
  %326 = fadd double %325, %324
  store double %326, double* %27, align 8
  br label %327

; <label>:327:                                    ; preds = %297
  %328 = load i32, i32* %23, align 4
  %329 = add nsw i32 %328, 1
  store i32 %329, i32* %23, align 4
  br label %293

; <label>:330:                                    ; preds = %293
  %331 = load double, double* %27, align 8
  %332 = load double, double* %29, align 8
  %333 = fdiv double %331, %332
  %334 = load [21 x double]*, [21 x double]** %14, align 8
  %335 = load i32, i32* %24, align 4
  %336 = add nsw i32 %335, 1
  %337 = sext i32 %336 to i64
  %338 = getelementptr inbounds [21 x double], [21 x double]* %334, i64 %337
  %339 = load i32, i32* %26, align 4
  %340 = zext i32 %339 to i64
  %341 = getelementptr inbounds [21 x double], [21 x double]* %338, i64 0, i64 %340
  store double %333, double* %341, align 8
  %342 = load [21 x double]*, [21 x double]** %14, align 8
  %343 = load i32, i32* %24, align 4
  %344 = add nsw i32 %343, 1
  %345 = sext i32 %344 to i64
  %346 = getelementptr inbounds [21 x double], [21 x double]* %342, i64 %345
  %347 = load i32, i32* %26, align 4
  %348 = zext i32 %347 to i64
  %349 = getelementptr inbounds [21 x double], [21 x double]* %346, i64 0, i64 %348
  %350 = load double, double* %349, align 8
  %351 = load %struct.III_psy_xmin*, %struct.III_psy_xmin** %16, align 8
  %352 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %351, i32 0, i32 1
  %353 = load i32, i32* %26, align 4
  %354 = zext i32 %353 to i64
  %355 = getelementptr inbounds [13 x [3 x double]], [13 x [3 x double]]* %352, i64 0, i64 %354
  %356 = load i32, i32* %24, align 4
  %357 = sext i32 %356 to i64
  %358 = getelementptr inbounds [3 x double], [3 x double]* %355, i64 0, i64 %357
  %359 = load double, double* %358, align 8
  %360 = fdiv double %350, %359
  %361 = fcmp ogt double 1.000000e-03, %360
  br i1 %361, label %362, label %363

; <label>:362:                                    ; preds = %330
  br label %384

; <label>:363:                                    ; preds = %330
  %pgocount11 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_calc_noise1, i64 0, i64 2)
  %364 = add i64 %pgocount11, 1
  store i64 %364, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_calc_noise1, i64 0, i64 2)
  %365 = load [21 x double]*, [21 x double]** %14, align 8
  %366 = load i32, i32* %24, align 4
  %367 = add nsw i32 %366, 1
  %368 = sext i32 %367 to i64
  %369 = getelementptr inbounds [21 x double], [21 x double]* %365, i64 %368
  %370 = load i32, i32* %26, align 4
  %371 = zext i32 %370 to i64
  %372 = getelementptr inbounds [21 x double], [21 x double]* %369, i64 0, i64 %371
  %373 = load double, double* %372, align 8
  %374 = load %struct.III_psy_xmin*, %struct.III_psy_xmin** %16, align 8
  %375 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %374, i32 0, i32 1
  %376 = load i32, i32* %26, align 4
  %377 = zext i32 %376 to i64
  %378 = getelementptr inbounds [13 x [3 x double]], [13 x [3 x double]]* %375, i64 0, i64 %377
  %379 = load i32, i32* %24, align 4
  %380 = sext i32 %379 to i64
  %381 = getelementptr inbounds [3 x double], [3 x double]* %378, i64 0, i64 %380
  %382 = load double, double* %381, align 8
  %383 = fdiv double %373, %382
  br label %384

; <label>:384:                                    ; preds = %363, %362
  %385 = phi double [ 1.000000e-03, %362 ], [ %383, %363 ]
  %386 = call double @log10(double %385) #6
  %387 = fmul double 1.000000e+01, %386
  store double %387, double* %31, align 8
  %388 = load double, double* %31, align 8
  %389 = load [21 x double]*, [21 x double]** %15, align 8
  %390 = load i32, i32* %24, align 4
  %391 = add nsw i32 %390, 1
  %392 = sext i32 %391 to i64
  %393 = getelementptr inbounds [21 x double], [21 x double]* %389, i64 %392
  %394 = load i32, i32* %26, align 4
  %395 = zext i32 %394 to i64
  %396 = getelementptr inbounds [21 x double], [21 x double]* %393, i64 0, i64 %395
  store double %388, double* %396, align 8
  %397 = load double, double* %31, align 8
  %398 = fcmp ogt double %397, 0.000000e+00
  br i1 %398, label %399, label %407

; <label>:399:                                    ; preds = %384
  %pgocount12 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_calc_noise1, i64 0, i64 3)
  %400 = add i64 %pgocount12, 1
  store i64 %400, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_calc_noise1, i64 0, i64 3)
  %401 = load i32, i32* %25, align 4
  %402 = add nsw i32 %401, 1
  store i32 %402, i32* %25, align 4
  %403 = load double, double* %31, align 8
  %404 = load double*, double** %18, align 8
  %405 = load double, double* %404, align 8
  %406 = fadd double %405, %403
  store double %406, double* %404, align 8
  br label %407

; <label>:407:                                    ; preds = %399, %384
  %408 = load double, double* %31, align 8
  %409 = load double*, double** %19, align 8
  %410 = load double, double* %409, align 8
  %411 = fadd double %410, %408
  store double %411, double* %409, align 8
  %412 = load double*, double** %20, align 8
  %413 = load double, double* %412, align 8
  %414 = load double, double* %31, align 8
  %415 = fcmp ogt double %413, %414
  br i1 %415, label %416, label %420

; <label>:416:                                    ; preds = %407
  %pgocount13 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_calc_noise1, i64 0, i64 4)
  %417 = add i64 %pgocount13, 1
  store i64 %417, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_calc_noise1, i64 0, i64 4)
  %418 = load double*, double** %20, align 8
  %419 = load double, double* %418, align 8
  br label %423

; <label>:420:                                    ; preds = %407
  %pgocount14 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_calc_noise1, i64 0, i64 5)
  %421 = add i64 %pgocount14, 1
  store i64 %421, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_calc_noise1, i64 0, i64 5)
  %422 = load double, double* %31, align 8
  br label %423

; <label>:423:                                    ; preds = %420, %416
  %424 = phi double [ %419, %416 ], [ %422, %420 ]
  %425 = load double*, double** %20, align 8
  store double %424, double* %425, align 8
  %426 = load i32, i32* %30, align 4
  %427 = add nsw i32 %426, 1
  store i32 %427, i32* %30, align 4
  br label %428

; <label>:428:                                    ; preds = %423
  %429 = load i32, i32* %26, align 4
  %430 = add i32 %429, 1
  store i32 %430, i32* %26, align 4
  br label %230

; <label>:431:                                    ; preds = %230
  br label %432

; <label>:432:                                    ; preds = %431
  %pgocount15 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_calc_noise1, i64 0, i64 6)
  %433 = add i64 %pgocount15, 1
  store i64 %433, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_calc_noise1, i64 0, i64 6)
  %434 = load i32, i32* %24, align 4
  %435 = add nsw i32 %434, 1
  store i32 %435, i32* %24, align 4
  br label %223

; <label>:436:                                    ; preds = %223
  %437 = load i32, i32* %30, align 4
  %438 = icmp sgt i32 %437, 1
  br i1 %438, label %439, label %446

; <label>:439:                                    ; preds = %436
  %pgocount16 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_calc_noise1, i64 0, i64 13)
  %440 = add i64 %pgocount16, 1
  store i64 %440, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_calc_noise1, i64 0, i64 13)
  %441 = load i32, i32* %30, align 4
  %442 = sitofp i32 %441 to double
  %443 = load double*, double** %19, align 8
  %444 = load double, double* %443, align 8
  %445 = fdiv double %444, %442
  store double %445, double* %443, align 8
  br label %446

; <label>:446:                                    ; preds = %439, %436
  %447 = load i32, i32* %25, align 4
  %448 = icmp sgt i32 %447, 1
  br i1 %448, label %449, label %456

; <label>:449:                                    ; preds = %446
  %pgocount17 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_calc_noise1, i64 0, i64 14)
  %450 = add i64 %pgocount17, 1
  store i64 %450, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_calc_noise1, i64 0, i64 14)
  %451 = load i32, i32* %25, align 4
  %452 = sitofp i32 %451 to double
  %453 = load double*, double** %18, align 8
  %454 = load double, double* %453, align 8
  %455 = fdiv double %454, %452
  store double %455, double* %453, align 8
  br label %456

; <label>:456:                                    ; preds = %449, %446
  %pgocount18 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_calc_noise1, i64 0, i64 12)
  %457 = add i64 %pgocount18, 1
  store i64 %457, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_calc_noise1, i64 0, i64 12)
  %458 = load i32, i32* %25, align 4
  ret i32 %458
}

; Function Attrs: noinline nounwind uwtable
define i32 @quant_compare(i32, i32, double, double, double, i32, double, double, double) #0 {
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca double, align 8
  %13 = alloca double, align 8
  %14 = alloca double, align 8
  %15 = alloca i32, align 4
  %16 = alloca double, align 8
  %17 = alloca double, align 8
  %18 = alloca double, align 8
  %19 = alloca i32, align 4
  store i32 %0, i32* %10, align 4
  store i32 %1, i32* %11, align 4
  store double %2, double* %12, align 8
  store double %3, double* %13, align 8
  store double %4, double* %14, align 8
  store i32 %5, i32* %15, align 4
  store double %6, double* %16, align 8
  store double %7, double* %17, align 8
  store double %8, double* %18, align 8
  store i32 0, i32* %19, align 4
  %20 = load i32, i32* %10, align 4
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %42

; <label>:22:                                     ; preds = %9
  %23 = load i32, i32* %15, align 4
  %24 = load i32, i32* %11, align 4
  %25 = icmp slt i32 %23, %24
  br i1 %25, label %38, label %26

; <label>:26:                                     ; preds = %22
  %27 = load i32, i32* %15, align 4
  %28 = load i32, i32* %11, align 4
  %29 = icmp eq i32 %27, %28
  br i1 %29, label %30, label %35

; <label>:30:                                     ; preds = %26
  %pgocount = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 23)
  %31 = add i64 %pgocount, 1
  store i64 %31, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 23)
  %32 = load double, double* %17, align 8
  %33 = load double, double* %13, align 8
  %34 = fcmp ole double %32, %33
  br label %35

; <label>:35:                                     ; preds = %30, %26
  %36 = phi i1 [ false, %26 ], [ %34, %30 ]
  %pgocount3 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 16)
  %37 = add i64 %pgocount3, 1
  store i64 %37, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 16)
  br label %38

; <label>:38:                                     ; preds = %35, %22
  %39 = phi i1 [ true, %22 ], [ %36, %35 ]
  %pgocount4 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 10)
  %40 = add i64 %pgocount4, 1
  store i64 %40, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 10)
  %41 = zext i1 %39 to i32
  store i32 %41, i32* %19, align 4
  br label %42

; <label>:42:                                     ; preds = %38, %9
  %43 = load i32, i32* %10, align 4
  %44 = icmp eq i32 %43, 1
  br i1 %44, label %45, label %51

; <label>:45:                                     ; preds = %42
  %pgocount5 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 4)
  %46 = add i64 %pgocount5, 1
  store i64 %46, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 4)
  %47 = load double, double* %18, align 8
  %48 = load double, double* %14, align 8
  %49 = fcmp olt double %47, %48
  %50 = zext i1 %49 to i32
  store i32 %50, i32* %19, align 4
  br label %51

; <label>:51:                                     ; preds = %45, %42
  %52 = load i32, i32* %10, align 4
  %53 = icmp eq i32 %52, 2
  br i1 %53, label %54, label %60

; <label>:54:                                     ; preds = %51
  %pgocount6 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 5)
  %55 = add i64 %pgocount6, 1
  store i64 %55, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 5)
  %56 = load double, double* %16, align 8
  %57 = load double, double* %12, align 8
  %58 = fcmp olt double %56, %57
  %59 = zext i1 %58 to i32
  store i32 %59, i32* %19, align 4
  br label %60

; <label>:60:                                     ; preds = %54, %51
  %61 = load i32, i32* %10, align 4
  %62 = icmp eq i32 %61, 3
  br i1 %62, label %63, label %77

; <label>:63:                                     ; preds = %60
  %64 = load double, double* %16, align 8
  %65 = load double, double* %12, align 8
  %66 = fcmp olt double %64, %65
  br i1 %66, label %67, label %73

; <label>:67:                                     ; preds = %63
  %pgocount7 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 12)
  %68 = add i64 %pgocount7, 1
  store i64 %68, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 12)
  %69 = load double, double* %18, align 8
  %70 = load double, double* %14, align 8
  %71 = fadd double %70, 2.000000e+00
  %72 = fcmp olt double %69, %71
  br label %73

; <label>:73:                                     ; preds = %67, %63
  %74 = phi i1 [ false, %63 ], [ %72, %67 ]
  %pgocount8 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 6)
  %75 = add i64 %pgocount8, 1
  store i64 %75, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 6)
  %76 = zext i1 %74 to i32
  store i32 %76, i32* %19, align 4
  br label %77

; <label>:77:                                     ; preds = %73, %60
  %78 = load i32, i32* %10, align 4
  %79 = icmp eq i32 %78, 4
  br i1 %79, label %80, label %183

; <label>:80:                                     ; preds = %77
  %81 = load double, double* %18, align 8
  %82 = fcmp oge double 0.000000e+00, %81
  br i1 %82, label %83, label %87

; <label>:83:                                     ; preds = %80
  %pgocount9 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 13)
  %84 = add i64 %pgocount9, 1
  store i64 %84, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 13)
  %85 = load double, double* %14, align 8
  %86 = fcmp ogt double %85, 2.000000e+00
  br i1 %86, label %179, label %87

; <label>:87:                                     ; preds = %83, %80
  %88 = load double, double* %18, align 8
  %89 = fcmp oge double 0.000000e+00, %88
  br i1 %89, label %90, label %106

; <label>:90:                                     ; preds = %87
  %pgocount10 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 17)
  %91 = add i64 %pgocount10, 1
  store i64 %91, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 17)
  %92 = load double, double* %14, align 8
  %93 = fcmp olt double %92, 0.000000e+00
  br i1 %93, label %94, label %106

; <label>:94:                                     ; preds = %90
  %pgocount11 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 24)
  %95 = add i64 %pgocount11, 1
  store i64 %95, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 24)
  %96 = load double, double* %14, align 8
  %97 = fadd double %96, 2.000000e+00
  %98 = load double, double* %18, align 8
  %99 = fcmp ogt double %97, %98
  br i1 %99, label %100, label %106

; <label>:100:                                    ; preds = %94
  %pgocount12 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 30)
  %101 = add i64 %pgocount12, 1
  store i64 %101, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 30)
  %102 = load double, double* %16, align 8
  %103 = load double, double* %12, align 8
  %104 = fcmp olt double %102, %103
  br i1 %104, label %179, label %._crit_edge

._crit_edge:                                      ; preds = %100
  %pgocount13 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 0)
  %105 = add i64 %pgocount13, 1
  store i64 %105, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 0)
  br label %106

; <label>:106:                                    ; preds = %._crit_edge, %94, %90, %87
  %107 = load double, double* %18, align 8
  %108 = fcmp oge double 0.000000e+00, %107
  br i1 %108, label %109, label %127

; <label>:109:                                    ; preds = %106
  %pgocount14 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 18)
  %110 = add i64 %pgocount14, 1
  store i64 %110, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 18)
  %111 = load double, double* %14, align 8
  %112 = fcmp ogt double %111, 0.000000e+00
  br i1 %112, label %113, label %127

; <label>:113:                                    ; preds = %109
  %pgocount15 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 25)
  %114 = add i64 %pgocount15, 1
  store i64 %114, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 25)
  %115 = load double, double* %14, align 8
  %116 = fadd double %115, 2.000000e+00
  %117 = load double, double* %18, align 8
  %118 = fcmp ogt double %116, %117
  br i1 %118, label %119, label %127

; <label>:119:                                    ; preds = %113
  %pgocount16 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 31)
  %120 = add i64 %pgocount16, 1
  store i64 %120, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 31)
  %121 = load double, double* %16, align 8
  %122 = load double, double* %12, align 8
  %123 = load double, double* %13, align 8
  %124 = fadd double %122, %123
  %125 = fcmp olt double %121, %124
  br i1 %125, label %179, label %._crit_edge1

._crit_edge1:                                     ; preds = %119
  %pgocount17 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 1)
  %126 = add i64 %pgocount17, 1
  store i64 %126, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 1)
  br label %127

; <label>:127:                                    ; preds = %._crit_edge1, %113, %109, %106
  %128 = load double, double* %18, align 8
  %129 = fcmp olt double 0.000000e+00, %128
  br i1 %129, label %130, label %150

; <label>:130:                                    ; preds = %127
  %pgocount18 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 19)
  %131 = add i64 %pgocount18, 1
  store i64 %131, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 19)
  %132 = load double, double* %14, align 8
  %133 = fcmp ogt double %132, -5.000000e-01
  br i1 %133, label %134, label %150

; <label>:134:                                    ; preds = %130
  %pgocount19 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 26)
  %135 = add i64 %pgocount19, 1
  store i64 %135, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 26)
  %136 = load double, double* %14, align 8
  %137 = fadd double %136, 1.000000e+00
  %138 = load double, double* %18, align 8
  %139 = fcmp ogt double %137, %138
  br i1 %139, label %140, label %150

; <label>:140:                                    ; preds = %134
  %pgocount20 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 32)
  %141 = add i64 %pgocount20, 1
  store i64 %141, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 32)
  %142 = load double, double* %16, align 8
  %143 = load double, double* %17, align 8
  %144 = fadd double %142, %143
  %145 = load double, double* %12, align 8
  %146 = load double, double* %13, align 8
  %147 = fadd double %145, %146
  %148 = fcmp olt double %144, %147
  br i1 %148, label %179, label %._crit_edge2

._crit_edge2:                                     ; preds = %140
  %pgocount21 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 2)
  %149 = add i64 %pgocount21, 1
  store i64 %149, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 2)
  br label %150

; <label>:150:                                    ; preds = %._crit_edge2, %134, %130, %127
  %151 = load double, double* %18, align 8
  %152 = fcmp olt double 0.000000e+00, %151
  br i1 %152, label %153, label %176

; <label>:153:                                    ; preds = %150
  %pgocount22 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 20)
  %154 = add i64 %pgocount22, 1
  store i64 %154, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 20)
  %155 = load double, double* %14, align 8
  %156 = fcmp ogt double %155, -1.000000e+00
  br i1 %156, label %157, label %176

; <label>:157:                                    ; preds = %153
  %pgocount23 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 27)
  %158 = add i64 %pgocount23, 1
  store i64 %158, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 27)
  %159 = load double, double* %14, align 8
  %160 = fadd double %159, 1.500000e+00
  %161 = load double, double* %18, align 8
  %162 = fcmp ogt double %160, %161
  br i1 %162, label %163, label %176

; <label>:163:                                    ; preds = %157
  %pgocount24 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 33)
  %164 = add i64 %pgocount24, 1
  store i64 %164, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 33)
  %165 = load double, double* %16, align 8
  %166 = load double, double* %17, align 8
  %167 = fadd double %165, %166
  %168 = load double, double* %17, align 8
  %169 = fadd double %167, %168
  %170 = load double, double* %12, align 8
  %171 = load double, double* %13, align 8
  %172 = fadd double %170, %171
  %173 = load double, double* %13, align 8
  %174 = fadd double %172, %173
  %175 = fcmp olt double %169, %174
  br label %176

; <label>:176:                                    ; preds = %163, %157, %153, %150
  %177 = phi i1 [ false, %157 ], [ false, %153 ], [ false, %150 ], [ %175, %163 ]
  %pgocount25 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 11)
  %178 = add i64 %pgocount25, 1
  store i64 %178, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 11)
  br label %179

; <label>:179:                                    ; preds = %176, %140, %119, %100, %83
  %180 = phi i1 [ true, %140 ], [ true, %119 ], [ true, %100 ], [ true, %83 ], [ %177, %176 ]
  %pgocount26 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 7)
  %181 = add i64 %pgocount26, 1
  store i64 %181, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 7)
  %182 = zext i1 %180 to i32
  store i32 %182, i32* %19, align 4
  br label %183

; <label>:183:                                    ; preds = %179, %77
  %184 = load i32, i32* %10, align 4
  %185 = icmp eq i32 %184, 5
  br i1 %185, label %186, label %206

; <label>:186:                                    ; preds = %183
  %187 = load double, double* %17, align 8
  %188 = load double, double* %13, align 8
  %189 = fcmp olt double %187, %188
  br i1 %189, label %202, label %190

; <label>:190:                                    ; preds = %186
  %191 = load double, double* %17, align 8
  %192 = load double, double* %13, align 8
  %193 = fcmp oeq double %191, %192
  br i1 %193, label %194, label %199

; <label>:194:                                    ; preds = %190
  %pgocount27 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 21)
  %195 = add i64 %pgocount27, 1
  store i64 %195, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 21)
  %196 = load double, double* %16, align 8
  %197 = load double, double* %12, align 8
  %198 = fcmp olt double %196, %197
  br label %199

; <label>:199:                                    ; preds = %194, %190
  %200 = phi i1 [ false, %190 ], [ %198, %194 ]
  %pgocount28 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 14)
  %201 = add i64 %pgocount28, 1
  store i64 %201, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 14)
  br label %202

; <label>:202:                                    ; preds = %199, %186
  %203 = phi i1 [ true, %186 ], [ %200, %199 ]
  %pgocount29 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 8)
  %204 = add i64 %pgocount29, 1
  store i64 %204, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 8)
  %205 = zext i1 %203 to i32
  store i32 %205, i32* %19, align 4
  br label %206

; <label>:206:                                    ; preds = %202, %183
  %207 = load i32, i32* %10, align 4
  %208 = icmp eq i32 %207, 6
  br i1 %208, label %209, label %243

; <label>:209:                                    ; preds = %206
  %210 = load double, double* %17, align 8
  %211 = load double, double* %13, align 8
  %212 = fcmp olt double %210, %211
  br i1 %212, label %239, label %213

; <label>:213:                                    ; preds = %209
  %214 = load double, double* %17, align 8
  %215 = load double, double* %13, align 8
  %216 = fcmp oeq double %214, %215
  br i1 %216, label %217, label %236

; <label>:217:                                    ; preds = %213
  %pgocount30 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 22)
  %218 = add i64 %pgocount30, 1
  store i64 %218, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 22)
  %219 = load double, double* %18, align 8
  %220 = load double, double* %14, align 8
  %221 = fcmp olt double %219, %220
  br i1 %221, label %234, label %222

; <label>:222:                                    ; preds = %217
  %223 = load double, double* %18, align 8
  %224 = load double, double* %14, align 8
  %225 = fcmp oeq double %223, %224
  br i1 %225, label %226, label %231

; <label>:226:                                    ; preds = %222
  %pgocount31 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 29)
  %227 = add i64 %pgocount31, 1
  store i64 %227, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 29)
  %228 = load double, double* %16, align 8
  %229 = load double, double* %12, align 8
  %230 = fcmp ole double %228, %229
  br label %231

; <label>:231:                                    ; preds = %226, %222
  %232 = phi i1 [ false, %222 ], [ %230, %226 ]
  %pgocount32 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 28)
  %233 = add i64 %pgocount32, 1
  store i64 %233, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 28)
  br label %234

; <label>:234:                                    ; preds = %231, %217
  %235 = phi i1 [ true, %217 ], [ %232, %231 ]
  br label %236

; <label>:236:                                    ; preds = %234, %213
  %237 = phi i1 [ false, %213 ], [ %235, %234 ]
  %pgocount33 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 15)
  %238 = add i64 %pgocount33, 1
  store i64 %238, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 15)
  br label %239

; <label>:239:                                    ; preds = %236, %209
  %240 = phi i1 [ true, %209 ], [ %237, %236 ]
  %pgocount34 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 9)
  %241 = add i64 %pgocount34, 1
  store i64 %241, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 9)
  %242 = zext i1 %240 to i32
  store i32 %242, i32* %19, align 4
  br label %243

; <label>:243:                                    ; preds = %239, %206
  %pgocount35 = load i64, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 3)
  %244 = add i64 %pgocount35, 1
  store i64 %244, i64* getelementptr inbounds ([34 x i64], [34 x i64]* @__profc_quant_compare, i64 0, i64 3)
  %245 = load i32, i32* %19, align 4
  ret i32 %245
}

; Function Attrs: noinline nounwind uwtable
define void @amp_scalefac_bands(double*, %struct.gr_info*, %struct.III_scalefac_t*, [21 x double]*) #0 {
  %5 = alloca double*, align 8
  %6 = alloca %struct.gr_info*, align 8
  %7 = alloca %struct.III_scalefac_t*, align 8
  %8 = alloca [21 x double]*, align 8
  %9 = alloca i32, align 4
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca double, align 8
  %15 = alloca double, align 8
  store double* %0, double** %5, align 8
  store %struct.gr_info* %1, %struct.gr_info** %6, align 8
  store %struct.III_scalefac_t* %2, %struct.III_scalefac_t** %7, align 8
  store [21 x double]* %3, [21 x double]** %8, align 8
  %16 = load %struct.gr_info*, %struct.gr_info** %6, align 8
  %17 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %16, i32 0, i32 13
  %18 = load i32, i32* %17, align 4
  %19 = icmp eq i32 %18, 0
  br i1 %19, label %20, label %22

; <label>:20:                                     ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_amp_scalefac_bands, i64 0, i64 14)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_amp_scalefac_bands, i64 0, i64 14)
  store double 0x3FF4BFDAD5362A27, double* %14, align 8
  br label %23

; <label>:22:                                     ; preds = %4
  store double 0x3FFAE89F995AD3AE, double* %14, align 8
  br label %23

; <label>:23:                                     ; preds = %22, %20
  store double -9.000000e+02, double* %15, align 8
  store i32 0, i32* %13, align 4
  br label %24

; <label>:24:                                     ; preds = %52, %23
  %25 = load i32, i32* %13, align 4
  %26 = load %struct.gr_info*, %struct.gr_info** %6, align 8
  %27 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %26, i32 0, i32 16
  %28 = load i32, i32* %27, align 8
  %29 = icmp ult i32 %25, %28
  br i1 %29, label %30, label %55

; <label>:30:                                     ; preds = %24
  %31 = load [21 x double]*, [21 x double]** %8, align 8
  %32 = getelementptr inbounds [21 x double], [21 x double]* %31, i64 0
  %33 = load i32, i32* %13, align 4
  %34 = zext i32 %33 to i64
  %35 = getelementptr inbounds [21 x double], [21 x double]* %32, i64 0, i64 %34
  %36 = load double, double* %35, align 8
  %37 = load double, double* %15, align 8
  %38 = fcmp ogt double %36, %37
  br i1 %38, label %39, label %47

; <label>:39:                                     ; preds = %30
  %pgocount1 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_amp_scalefac_bands, i64 0, i64 9)
  %40 = add i64 %pgocount1, 1
  store i64 %40, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_amp_scalefac_bands, i64 0, i64 9)
  %41 = load [21 x double]*, [21 x double]** %8, align 8
  %42 = getelementptr inbounds [21 x double], [21 x double]* %41, i64 0
  %43 = load i32, i32* %13, align 4
  %44 = zext i32 %43 to i64
  %45 = getelementptr inbounds [21 x double], [21 x double]* %42, i64 0, i64 %44
  %46 = load double, double* %45, align 8
  br label %50

; <label>:47:                                     ; preds = %30
  %pgocount2 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_amp_scalefac_bands, i64 0, i64 10)
  %48 = add i64 %pgocount2, 1
  store i64 %48, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_amp_scalefac_bands, i64 0, i64 10)
  %49 = load double, double* %15, align 8
  br label %50

; <label>:50:                                     ; preds = %47, %39
  %51 = phi double [ %46, %39 ], [ %49, %47 ]
  store double %51, double* %15, align 8
  br label %52

; <label>:52:                                     ; preds = %50
  %53 = load i32, i32* %13, align 4
  %54 = add i32 %53, 1
  store i32 %54, i32* %13, align 4
  br label %24

; <label>:55:                                     ; preds = %24
  %56 = load %struct.gr_info*, %struct.gr_info** %6, align 8
  %57 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %56, i32 0, i32 17
  %58 = load i32, i32* %57, align 4
  store i32 %58, i32* %13, align 4
  br label %59

; <label>:59:                                     ; preds = %99, %55
  %60 = load i32, i32* %13, align 4
  %61 = icmp ult i32 %60, 12
  br i1 %61, label %62, label %102

; <label>:62:                                     ; preds = %59
  %pgocount3 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_amp_scalefac_bands, i64 0, i64 6)
  %63 = add i64 %pgocount3, 1
  store i64 %63, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_amp_scalefac_bands, i64 0, i64 6)
  store i32 0, i32* %12, align 4
  br label %64

; <label>:64:                                     ; preds = %95, %62
  %65 = load i32, i32* %12, align 4
  %66 = icmp slt i32 %65, 3
  br i1 %66, label %67, label %98

; <label>:67:                                     ; preds = %64
  %68 = load [21 x double]*, [21 x double]** %8, align 8
  %69 = load i32, i32* %12, align 4
  %70 = add nsw i32 %69, 1
  %71 = sext i32 %70 to i64
  %72 = getelementptr inbounds [21 x double], [21 x double]* %68, i64 %71
  %73 = load i32, i32* %13, align 4
  %74 = zext i32 %73 to i64
  %75 = getelementptr inbounds [21 x double], [21 x double]* %72, i64 0, i64 %74
  %76 = load double, double* %75, align 8
  %77 = load double, double* %15, align 8
  %78 = fcmp ogt double %76, %77
  br i1 %78, label %79, label %90

; <label>:79:                                     ; preds = %67
  %pgocount4 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_amp_scalefac_bands, i64 0, i64 2)
  %80 = add i64 %pgocount4, 1
  store i64 %80, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_amp_scalefac_bands, i64 0, i64 2)
  %81 = load [21 x double]*, [21 x double]** %8, align 8
  %82 = load i32, i32* %12, align 4
  %83 = add nsw i32 %82, 1
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds [21 x double], [21 x double]* %81, i64 %84
  %86 = load i32, i32* %13, align 4
  %87 = zext i32 %86 to i64
  %88 = getelementptr inbounds [21 x double], [21 x double]* %85, i64 0, i64 %87
  %89 = load double, double* %88, align 8
  br label %93

; <label>:90:                                     ; preds = %67
  %pgocount5 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_amp_scalefac_bands, i64 0, i64 3)
  %91 = add i64 %pgocount5, 1
  store i64 %91, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_amp_scalefac_bands, i64 0, i64 3)
  %92 = load double, double* %15, align 8
  br label %93

; <label>:93:                                     ; preds = %90, %79
  %94 = phi double [ %89, %79 ], [ %92, %90 ]
  store double %94, double* %15, align 8
  br label %95

; <label>:95:                                     ; preds = %93
  %96 = load i32, i32* %12, align 4
  %97 = add nsw i32 %96, 1
  store i32 %97, i32* %12, align 4
  br label %64

; <label>:98:                                     ; preds = %64
  br label %99

; <label>:99:                                     ; preds = %98
  %100 = load i32, i32* %13, align 4
  %101 = add i32 %100, 1
  store i32 %101, i32* %13, align 4
  br label %59

; <label>:102:                                    ; preds = %59
  %103 = load double, double* %15, align 8
  %104 = fmul double %103, 1.050000e+00
  %105 = fcmp olt double %104, 0.000000e+00
  br i1 %105, label %106, label %110

; <label>:106:                                    ; preds = %102
  %pgocount6 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_amp_scalefac_bands, i64 0, i64 12)
  %107 = add i64 %pgocount6, 1
  store i64 %107, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_amp_scalefac_bands, i64 0, i64 12)
  %108 = load double, double* %15, align 8
  %109 = fmul double %108, 1.050000e+00
  br label %112

; <label>:110:                                    ; preds = %102
  %pgocount7 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_amp_scalefac_bands, i64 0, i64 13)
  %111 = add i64 %pgocount7, 1
  store i64 %111, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_amp_scalefac_bands, i64 0, i64 13)
  br label %112

; <label>:112:                                    ; preds = %110, %106
  %113 = phi double [ %109, %106 ], [ 0.000000e+00, %110 ]
  store double %113, double* %15, align 8
  store i32 0, i32* %13, align 4
  br label %114

; <label>:114:                                    ; preds = %167, %112
  %115 = load i32, i32* %13, align 4
  %116 = load %struct.gr_info*, %struct.gr_info** %6, align 8
  %117 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %116, i32 0, i32 16
  %118 = load i32, i32* %117, align 8
  %119 = icmp ult i32 %115, %118
  br i1 %119, label %120, label %170

; <label>:120:                                    ; preds = %114
  %pgocount8 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_amp_scalefac_bands, i64 0, i64 7)
  %121 = add i64 %pgocount8, 1
  store i64 %121, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_amp_scalefac_bands, i64 0, i64 7)
  %122 = load [21 x double]*, [21 x double]** %8, align 8
  %123 = getelementptr inbounds [21 x double], [21 x double]* %122, i64 0
  %124 = load i32, i32* %13, align 4
  %125 = zext i32 %124 to i64
  %126 = getelementptr inbounds [21 x double], [21 x double]* %123, i64 0, i64 %125
  %127 = load double, double* %126, align 8
  %128 = load double, double* %15, align 8
  %129 = fcmp ogt double %127, %128
  br i1 %129, label %130, label %166

; <label>:130:                                    ; preds = %120
  %131 = load %struct.III_scalefac_t*, %struct.III_scalefac_t** %7, align 8
  %132 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %131, i32 0, i32 0
  %133 = load i32, i32* %13, align 4
  %134 = zext i32 %133 to i64
  %135 = getelementptr inbounds [22 x i32], [22 x i32]* %132, i64 0, i64 %134
  %136 = load i32, i32* %135, align 4
  %137 = add nsw i32 %136, 1
  store i32 %137, i32* %135, align 4
  %138 = load i32, i32* %13, align 4
  %139 = zext i32 %138 to i64
  %140 = getelementptr inbounds [23 x i32], [23 x i32]* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i32 0, i32 0), i64 0, i64 %139
  %141 = load i32, i32* %140, align 4
  store i32 %141, i32* %9, align 4
  %142 = load i32, i32* %13, align 4
  %143 = add i32 %142, 1
  %144 = zext i32 %143 to i64
  %145 = getelementptr inbounds [23 x i32], [23 x i32]* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i32 0, i32 0), i64 0, i64 %144
  %146 = load i32, i32* %145, align 4
  store i32 %146, i32* %10, align 4
  %147 = load i32, i32* %9, align 4
  store i32 %147, i32* %11, align 4
  br label %148

; <label>:148:                                    ; preds = %160, %130
  %149 = load i32, i32* %11, align 4
  %150 = load i32, i32* %10, align 4
  %151 = icmp slt i32 %149, %150
  br i1 %151, label %152, label %164

; <label>:152:                                    ; preds = %148
  %153 = load double, double* %14, align 8
  %154 = load double*, double** %5, align 8
  %155 = load i32, i32* %11, align 4
  %156 = sext i32 %155 to i64
  %157 = getelementptr inbounds double, double* %154, i64 %156
  %158 = load double, double* %157, align 8
  %159 = fmul double %158, %153
  store double %159, double* %157, align 8
  br label %160

; <label>:160:                                    ; preds = %152
  %pgocount9 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_amp_scalefac_bands, i64 0, i64 4)
  %161 = add i64 %pgocount9, 1
  store i64 %161, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_amp_scalefac_bands, i64 0, i64 4)
  %162 = load i32, i32* %11, align 4
  %163 = add nsw i32 %162, 1
  store i32 %163, i32* %11, align 4
  br label %148

; <label>:164:                                    ; preds = %148
  %pgocount10 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_amp_scalefac_bands, i64 0, i64 11)
  %165 = add i64 %pgocount10, 1
  store i64 %165, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_amp_scalefac_bands, i64 0, i64 11)
  br label %166

; <label>:166:                                    ; preds = %164, %120
  br label %167

; <label>:167:                                    ; preds = %166
  %168 = load i32, i32* %13, align 4
  %169 = add i32 %168, 1
  store i32 %169, i32* %13, align 4
  br label %114

; <label>:170:                                    ; preds = %114
  store i32 0, i32* %12, align 4
  br label %171

; <label>:171:                                    ; preds = %242, %170
  %172 = load i32, i32* %12, align 4
  %173 = icmp slt i32 %172, 3
  br i1 %173, label %174, label %245

; <label>:174:                                    ; preds = %171
  %pgocount11 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_amp_scalefac_bands, i64 0, i64 8)
  %175 = add i64 %pgocount11, 1
  store i64 %175, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_amp_scalefac_bands, i64 0, i64 8)
  %176 = load %struct.gr_info*, %struct.gr_info** %6, align 8
  %177 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %176, i32 0, i32 17
  %178 = load i32, i32* %177, align 4
  store i32 %178, i32* %13, align 4
  br label %179

; <label>:179:                                    ; preds = %238, %174
  %180 = load i32, i32* %13, align 4
  %181 = icmp ult i32 %180, 12
  br i1 %181, label %182, label %241

; <label>:182:                                    ; preds = %179
  %pgocount12 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_amp_scalefac_bands, i64 0, i64 1)
  %183 = add i64 %pgocount12, 1
  store i64 %183, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_amp_scalefac_bands, i64 0, i64 1)
  %184 = load [21 x double]*, [21 x double]** %8, align 8
  %185 = load i32, i32* %12, align 4
  %186 = add nsw i32 %185, 1
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds [21 x double], [21 x double]* %184, i64 %187
  %189 = load i32, i32* %13, align 4
  %190 = zext i32 %189 to i64
  %191 = getelementptr inbounds [21 x double], [21 x double]* %188, i64 0, i64 %190
  %192 = load double, double* %191, align 8
  %193 = load double, double* %15, align 8
  %194 = fcmp ogt double %192, %193
  br i1 %194, label %195, label %237

; <label>:195:                                    ; preds = %182
  %196 = load %struct.III_scalefac_t*, %struct.III_scalefac_t** %7, align 8
  %197 = getelementptr inbounds %struct.III_scalefac_t, %struct.III_scalefac_t* %196, i32 0, i32 1
  %198 = load i32, i32* %13, align 4
  %199 = zext i32 %198 to i64
  %200 = getelementptr inbounds [13 x [3 x i32]], [13 x [3 x i32]]* %197, i64 0, i64 %199
  %201 = load i32, i32* %12, align 4
  %202 = sext i32 %201 to i64
  %203 = getelementptr inbounds [3 x i32], [3 x i32]* %200, i64 0, i64 %202
  %204 = load i32, i32* %203, align 4
  %205 = add nsw i32 %204, 1
  store i32 %205, i32* %203, align 4
  %206 = load i32, i32* %13, align 4
  %207 = zext i32 %206 to i64
  %208 = getelementptr inbounds [14 x i32], [14 x i32]* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i32 0, i32 1), i64 0, i64 %207
  %209 = load i32, i32* %208, align 4
  store i32 %209, i32* %9, align 4
  %210 = load i32, i32* %13, align 4
  %211 = add i32 %210, 1
  %212 = zext i32 %211 to i64
  %213 = getelementptr inbounds [14 x i32], [14 x i32]* getelementptr inbounds (%struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i32 0, i32 1), i64 0, i64 %212
  %214 = load i32, i32* %213, align 4
  store i32 %214, i32* %10, align 4
  %215 = load i32, i32* %9, align 4
  store i32 %215, i32* %11, align 4
  br label %216

; <label>:216:                                    ; preds = %231, %195
  %217 = load i32, i32* %11, align 4
  %218 = load i32, i32* %10, align 4
  %219 = icmp slt i32 %217, %218
  br i1 %219, label %220, label %235

; <label>:220:                                    ; preds = %216
  %221 = load double, double* %14, align 8
  %222 = load double*, double** %5, align 8
  %223 = load i32, i32* %11, align 4
  %224 = mul nsw i32 %223, 3
  %225 = load i32, i32* %12, align 4
  %226 = add nsw i32 %224, %225
  %227 = sext i32 %226 to i64
  %228 = getelementptr inbounds double, double* %222, i64 %227
  %229 = load double, double* %228, align 8
  %230 = fmul double %229, %221
  store double %230, double* %228, align 8
  br label %231

; <label>:231:                                    ; preds = %220
  %pgocount13 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_amp_scalefac_bands, i64 0, i64 0)
  %232 = add i64 %pgocount13, 1
  store i64 %232, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_amp_scalefac_bands, i64 0, i64 0)
  %233 = load i32, i32* %11, align 4
  %234 = add nsw i32 %233, 1
  store i32 %234, i32* %11, align 4
  br label %216

; <label>:235:                                    ; preds = %216
  %pgocount14 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_amp_scalefac_bands, i64 0, i64 5)
  %236 = add i64 %pgocount14, 1
  store i64 %236, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_amp_scalefac_bands, i64 0, i64 5)
  br label %237

; <label>:237:                                    ; preds = %235, %182
  br label %238

; <label>:238:                                    ; preds = %237
  %239 = load i32, i32* %13, align 4
  %240 = add i32 %239, 1
  store i32 %240, i32* %13, align 4
  br label %179

; <label>:241:                                    ; preds = %179
  br label %242

; <label>:242:                                    ; preds = %241
  %243 = load i32, i32* %12, align 4
  %244 = add nsw i32 %243, 1
  store i32 %244, i32* %12, align 4
  br label %171

; <label>:245:                                    ; preds = %171
  ret void
}

declare i32 @loop_break(%struct.III_scalefac_t*, %struct.gr_info*) #1

declare i32 @scale_bitcount(%struct.III_scalefac_t*, %struct.gr_info*) #1

declare i32 @scale_bitcount_lsf(%struct.III_scalefac_t*, %struct.gr_info*) #1

; Function Attrs: nounwind
declare double @log10(double) #3

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #6

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #5 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind }
attributes #7 = { nounwind readnone }
attributes #8 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
