; ModuleID = 'newmdct.2.ll'
source_filename = "newmdct.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.lame_global_flags = type { i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, i8*, i32, i32, float, i32, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, float, i32, i32, i32, float, float, float, float, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.III_side_info_t = type { i32, i32, i32, [2 x [4 x i32]], [2 x %struct.anon] }
%struct.anon = type { [2 x %struct.gr_info_ss] }
%struct.gr_info_ss = type { %struct.gr_info }
%struct.gr_info = type { i32, i32, i32, i32, i32, i32, i32, i32, [3 x i32], [3 x i32], i32, i32, i32, i32, i32, i32, i32, i32, i32, i32*, [4 x i32] }

$__llvm_profile_raw_version = comdat any

@mdct_sub48.init = internal global i32 0, align 4
@sb_sample = internal global [2 x [2 x [18 x [32 x double]]]] zeroinitializer, align 16
@win = internal global [4 x [36 x double]] zeroinitializer, align 16
@ca = internal global [8 x double] zeroinitializer, align 16
@cs = internal global [8 x double] zeroinitializer, align 16
@mdct_init48.c = internal constant [8 x double] [double -6.000000e-01, double -5.350000e-01, double -3.300000e-01, double -1.850000e-01, double -9.500000e-02, double -4.100000e-02, double -1.420000e-02, double -3.700000e-03], align 16
@cos_l = internal global [244 x double] zeroinitializer, align 16
@mdct_init48.d3 = internal constant [4 x i32] [i32 1, i32 7, i32 10, i32 16], align 16
@mdct_init48.d9 = internal constant [2 x i32] [i32 4, i32 13], align 4
@all = internal constant [12 x i32] [i32 0, i32 2, i32 3, i32 5, i32 6, i32 8, i32 9, i32 11, i32 12, i32 14, i32 15, i32 17], align 16
@enwindow = internal global [256 x double] [double 0x3FA251E002C5BE4C, double 0x3F924E1FFC2760F6, double 3.134727e-03, double 2.457142e-03, double 9.713170e-04, double 2.188680e-04, double 1.015660e-04, double 1.382800e-05, double 0x3FA24EFFFE8EA200, double 3.401756e-03, double 9.837150e-04, double 9.918200e-05, double -4.770000e-07, double 1.039510e-04, double 9.536740e-04, double 2.841473e-03, double 1.239800e-05, double 1.912120e-04, double 2.283096e-03, double 0x3F9166FFFA87D736, double 0x3F9334FFF82E8B95, double 2.630711e-03, double 2.474780e-04, double 1.478200e-05, double 0x3FA2467FFD4C82A1, double 3.643036e-03, double 9.918210e-04, double 9.632100e-05, double -4.770000e-07, double 1.058580e-04, double 9.307860e-04, double 2.521515e-03, double 1.144400e-05, double 1.654620e-04, double 2.110004e-03, double 0x3F907FDFF8E84D76, double 0x3F941B0002FC8112, double 2.803326e-03, double 2.770420e-04, double 1.668900e-05, double 0x3FA2385FFEFF602E, double 3.858566e-03, double 9.951590e-04, double 9.346000e-05, double -4.770000e-07, double 1.072880e-04, double 9.026530e-04, double 2.174854e-03, double 1.001400e-05, double 1.401900e-04, double 1.937389e-03, double 0x3F8F32C00A8B630F, double 0x3F94FFC002FEA6D3, double 2.974033e-03, double 3.075600e-04, double 1.812000e-05, double 3.543520e-02, double 4.049301e-03, double 9.942050e-04, double 9.059900e-05, double -4.770000e-07, double 1.082420e-04, double 8.687970e-04, double 1.800537e-03, double 9.060000e-06, double 1.163480e-04, double 1.766682e-03, double 0x3F8D680010E953B9, double 0x3F95E29FFB661AF0, double 3.141880e-03, double 3.390310e-04, double 1.955000e-05, double 0x3FA20B4002AD0C1B, double 4.215240e-03, double 9.894370e-04, double 8.726100e-05, double -4.770000e-07, double 1.087190e-04, double 8.292200e-04, double 1.399517e-03, double 8.106000e-06, double 9.393700e-05, double 1.597881e-03, double 0x3F8BA03FF357727A, double 0x3F96C320035E36F6, double 3.306866e-03, double 3.714560e-04, double 2.145800e-05, double 3.500700e-02, double 4.357815e-03, double 9.808540e-04, double 8.392300e-05, double -4.770000e-07, double 1.087190e-04, double 7.839200e-04, double 9.713170e-04, double 7.629000e-06, double 7.295600e-05, double 1.432419e-03, double 0x3F89DC800CEF6B77, double 2.307415e-02, double 3.467083e-03, double 4.043580e-04, double 2.336500e-05, double 0x3FA1C82FFC6969F3, double 4.477024e-03, double 9.689330e-04, double 8.058500e-05, double -9.540000e-07, double 1.082420e-04, double 7.319450e-04, double 5.159380e-04, double 6.676000e-06, double 5.292900e-05, double 1.269817e-03, double 0x3F881D80076614A1, double 0x3F987B2006DB9161, double 3.622532e-03, double 4.382130e-04, double 2.527200e-05, double 0x3FA19E90011D1416, double 4.573822e-03, double 9.541510e-04, double 7.677100e-05, double -9.540000e-07, double 1.068120e-04, double 6.742480e-04, double 3.337900e-05, double 6.199000e-06, double 3.433200e-05, double 1.111031e-03, double 0x3F86643FF91CEA7A, double 0x3F99519FFD2D5F2B, double 3.771782e-03, double 4.725460e-04, double 2.765700e-05, double 3.405571e-02, double 4.649162e-03, double 9.355550e-04, double 7.343300e-05, double -9.540000e-07, double 1.053810e-04, double 6.103520e-04, double -4.758830e-04, double 5.245000e-06, double 1.716600e-05, double 9.565350e-04, double 0x3F84B1400FA0C315, double 2.552700e-02, double 3.914356e-03, double 5.073550e-04, double 3.004100e-05, double 0x3FA13BE000055E64, double 4.703045e-03, double 9.150510e-04, double 7.009500e-05, double -9.540000e-07, double 1.025200e-04, double 5.393030e-04, double -1.011848e-03, double 4.768000e-06, double 9.540000e-07, double 8.068080e-04, double 9.287834e-03, double 0x3F9AF14004E3FBA4, double 4.048824e-03, double 5.421640e-04, double 3.242500e-05, double 0x3FA102EFFD062E20, double 4.737377e-03, double 8.916850e-04, double 6.628000e-05, double -1.431000e-06, double 9.918200e-05, double 4.625320e-04, double -1.573563e-03, double 4.292000e-06, double -1.382800e-05, double 6.618500e-04, double 8.487225e-03, double 2.707386e-02, double 4.174709e-03, double 5.769730e-04, double 3.480900e-05, double 0x3FA0C53FFF633BD3, double 4.752159e-03, double 8.664130e-04, double 6.294300e-05, double -1.431000e-06, double 9.536700e-05, double 3.786090e-04, double -2.161503e-03, double 3.815000e-06, double -2.718000e-05, double 5.221370e-04, double 7.703304e-03, double 0x3F9C7BA000DE43BA, double 4.290581e-03, double 6.117820e-04, double 3.767000e-05, double 3.224802e-02, double 4.748821e-03, double 8.387570e-04, double 5.960500e-05, double -1.907000e-06, double 9.012200e-05, double 2.884860e-04, double -2.774239e-03, double 3.338000e-06, double -3.957700e-05, double 3.881450e-04, double 6.937027e-03, double 0x3F9D37C002307E44, double 4.395962e-03, double 6.465910e-04, double 4.053100e-05, double 3.170681e-02, double 4.728317e-03, double 8.096690e-04, double 5.579000e-05, double -1.907000e-06, double 8.440000e-05, double 1.916890e-04, double -3.411293e-03, double 3.338000e-06, double -5.054500e-05, double 2.598760e-04, double 6.189346e-03, double 0x3F9DED20070F1B84, double 4.489899e-03, double 6.809230e-04, double 4.339200e-05, double 0x3F9FE13FFEFC278C, double 4.691124e-03, double 7.791520e-04, double 5.292900e-05, double -2.384000e-06, double 7.772400e-05, double 8.821500e-05, double -4.072189e-03, double 2.861000e-06, double -6.055800e-05, double 1.373290e-04, double 5.462170e-03, double 2.989006e-02, double 4.570484e-03, double 7.143020e-04, double 4.625300e-05, double 0x3F9F425FFF77A281, double 4.638195e-03, double 7.472040e-04, double 4.959100e-05, double 4.756451e-03, double 2.145800e-05, double -6.961800e-05, double 2.384000e-06], align 16
@mm = internal global [16 x [31 x double]] zeroinitializer, align 16
@cos_s = internal global [6 x [6 x double]] zeroinitializer, align 16
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_mdct_sub48 = private constant [10 x i8] c"mdct_sub48"
@__profn_mdct_init48 = private constant [11 x i8] c"mdct_init48"
@__profn_tmp1.ll_window_subband = private constant [22 x i8] c"tmp1.ll:window_subband"
@__profn_tmp1.ll_mdct_short = private constant [18 x i8] c"tmp1.ll:mdct_short"
@__profn_tmp1.ll_mdct_long = private constant [17 x i8] c"tmp1.ll:mdct_long"
@__profc_mdct_sub48 = private global [24 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mdct_sub48 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -910119367164725880, i64 398336131738, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i32 0, i32 0), i8* bitcast (void (%struct.lame_global_flags*, i16*, i16*, [2 x [576 x double]]*, %struct.III_side_info_t*)* @mdct_sub48 to i8*), i8* null, i32 24, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_mdct_init48 = private global [25 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_mdct_init48 = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -634540165858835587, i64 511323123550, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i32 0, i32 0), i8* bitcast (void ()* @mdct_init48 to i8*), i8* null, i32 25, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_window_subband = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_window_subband = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2084848453560390988, i64 73744657289, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_window_subband, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_mdct_short = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_mdct_short = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 8942116999363615599, i64 53929068288, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_mdct_short, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_tmp1.ll_mdct_long = private global [2 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_tmp1.ll_mdct_long = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -9116151091147753675, i64 26545607443, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_mdct_long, i32 0, i32 0), i8* null, i8* null, i32 2, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [64 x i8] c"R>x\DA\CBMI.\89/.M2\B1`\CC\0513\F32K\80\EC\92\DC\02C\BD\9C\1C\AB\F2\CC\BC\94\FCr\90\82\A4\C4\BC\14\B80XiqF~Q\09\AAPN~^:\00\CC4\1D\F3", section "__llvm_prf_names"
@llvm.used = appending global [6 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mdct_sub48 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_mdct_init48 to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_window_subband to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_mdct_short to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_tmp1.ll_mdct_long to i8*), i8* getelementptr inbounds ([64 x i8], [64 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: nounwind uwtable
define void @mdct_sub48(%struct.lame_global_flags*, i16*, i16*, [2 x [576 x double]]*, %struct.III_side_info_t*) #0 {
  %6 = alloca %struct.lame_global_flags*, align 8
  %7 = alloca i16*, align 8
  %8 = alloca i16*, align 8
  %9 = alloca [2 x [576 x double]]*, align 8
  %10 = alloca %struct.III_side_info_t*, align 8
  %11 = alloca i32, align 4
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca i16*, align 8
  %15 = alloca i32, align 4
  %16 = alloca double*, align 8
  %17 = alloca %struct.gr_info*, align 8
  %18 = alloca double*, align 8
  %19 = alloca double, align 8
  %20 = alloca double, align 8
  %21 = alloca i32, align 4
  %22 = alloca double, align 8
  %23 = alloca double, align 8
  %24 = alloca double, align 8
  store %struct.lame_global_flags* %0, %struct.lame_global_flags** %6, align 8
  store i16* %1, i16** %7, align 8
  store i16* %2, i16** %8, align 8
  store [2 x [576 x double]]* %3, [2 x [576 x double]]** %9, align 8
  store %struct.III_side_info_t* %4, %struct.III_side_info_t** %10, align 8
  %25 = load i32, i32* @mdct_sub48.init, align 4
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %31

; <label>:27:                                     ; preds = %5
  %pgocount = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 23)
  %28 = add i64 %pgocount, 1
  store i64 %28, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 23)
  call void @mdct_init48()
  %29 = load i32, i32* @mdct_sub48.init, align 4
  %30 = add nsw i32 %29, 1
  store i32 %30, i32* @mdct_sub48.init, align 4
  br label %31

; <label>:31:                                     ; preds = %27, %5
  %32 = load i16*, i16** %7, align 8
  store i16* %32, i16** %14, align 8
  store i32 0, i32* %13, align 4
  br label %33

; <label>:33:                                     ; preds = %728, %31
  %34 = load i32, i32* %13, align 4
  %35 = load %struct.lame_global_flags*, %struct.lame_global_flags** %6, align 8
  %36 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %35, i32 0, i32 46
  %37 = load i32, i32* %36, align 4
  %38 = icmp slt i32 %34, %37
  br i1 %38, label %39, label %731

; <label>:39:                                     ; preds = %33
  %pgocount1 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 20)
  %40 = add i64 %pgocount1, 1
  store i64 %40, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 20)
  store i32 0, i32* %11, align 4
  br label %41

; <label>:41:                                     ; preds = %704, %39
  %42 = load i32, i32* %11, align 4
  %43 = load %struct.lame_global_flags*, %struct.lame_global_flags** %6, align 8
  %44 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %43, i32 0, i32 45
  %45 = load i32, i32* %44, align 8
  %46 = icmp slt i32 %42, %45
  br i1 %46, label %47, label %707

; <label>:47:                                     ; preds = %41
  %pgocount2 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 18)
  %48 = add i64 %pgocount2, 1
  store i64 %48, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 18)
  %49 = load [2 x [576 x double]]*, [2 x [576 x double]]** %9, align 8
  %50 = load i32, i32* %11, align 4
  %51 = sext i32 %50 to i64
  %52 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %49, i64 %51
  %53 = load i32, i32* %13, align 4
  %54 = sext i32 %53 to i64
  %55 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %52, i64 0, i64 %54
  %56 = getelementptr inbounds [576 x double], [576 x double]* %55, i32 0, i32 0
  store double* %56, double** %16, align 8
  %57 = load %struct.III_side_info_t*, %struct.III_side_info_t** %10, align 8
  %58 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %57, i32 0, i32 4
  %59 = load i32, i32* %11, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [2 x %struct.anon], [2 x %struct.anon]* %58, i64 0, i64 %60
  %62 = getelementptr inbounds %struct.anon, %struct.anon* %61, i32 0, i32 0
  %63 = load i32, i32* %13, align 4
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds [2 x %struct.gr_info_ss], [2 x %struct.gr_info_ss]* %62, i64 0, i64 %64
  %66 = getelementptr inbounds %struct.gr_info_ss, %struct.gr_info_ss* %65, i32 0, i32 0
  store %struct.gr_info* %66, %struct.gr_info** %17, align 8
  %67 = load i32, i32* %13, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %68
  %70 = load i32, i32* %11, align 4
  %71 = sub nsw i32 1, %70
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [2 x [18 x [32 x double]]], [2 x [18 x [32 x double]]]* %69, i64 0, i64 %72
  %74 = getelementptr inbounds [18 x [32 x double]], [18 x [32 x double]]* %73, i64 0, i64 0
  %75 = getelementptr inbounds [32 x double], [32 x double]* %74, i32 0, i32 0
  store double* %75, double** %18, align 8
  store i32 0, i32* %12, align 4
  br label %76

; <label>:76:                                     ; preds = %107, %47
  %77 = load i32, i32* %12, align 4
  %78 = icmp slt i32 %77, 9
  br i1 %78, label %79, label %110

; <label>:79:                                     ; preds = %76
  %pgocount3 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 6)
  %80 = add i64 %pgocount3, 1
  store i64 %80, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 6)
  %81 = load i16*, i16** %14, align 8
  %82 = load double*, double** %18, align 8
  call void @window_subband(i16* %81, double* %82, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 4))
  %83 = load i16*, i16** %14, align 8
  %84 = getelementptr inbounds i16, i16* %83, i64 32
  %85 = load double*, double** %18, align 8
  %86 = getelementptr inbounds double, double* %85, i64 32
  call void @window_subband(i16* %84, double* %86, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 4))
  store i32 1, i32* %15, align 4
  br label %87

; <label>:87:                                     ; preds = %99, %79
  %88 = load i32, i32* %15, align 4
  %89 = icmp slt i32 %88, 32
  br i1 %89, label %90, label %102

; <label>:90:                                     ; preds = %87
  %pgocount4 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 0)
  %91 = add i64 %pgocount4, 1
  store i64 %91, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 0)
  %92 = load double*, double** %18, align 8
  %93 = load i32, i32* %15, align 4
  %94 = add nsw i32 %93, 32
  %95 = sext i32 %94 to i64
  %96 = getelementptr inbounds double, double* %92, i64 %95
  %97 = load double, double* %96, align 8
  %98 = fmul double %97, -1.000000e+00
  store double %98, double* %96, align 8
  br label %99

; <label>:99:                                     ; preds = %90
  %100 = load i32, i32* %15, align 4
  %101 = add nsw i32 %100, 2
  store i32 %101, i32* %15, align 4
  br label %87

; <label>:102:                                    ; preds = %87
  %103 = load double*, double** %18, align 8
  %104 = getelementptr inbounds double, double* %103, i64 64
  store double* %104, double** %18, align 8
  %105 = load i16*, i16** %14, align 8
  %106 = getelementptr inbounds i16, i16* %105, i64 64
  store i16* %106, i16** %14, align 8
  br label %107

; <label>:107:                                    ; preds = %102
  %108 = load i32, i32* %12, align 4
  %109 = add nsw i32 %108, 1
  store i32 %109, i32* %12, align 4
  br label %76

; <label>:110:                                    ; preds = %76
  %111 = load %struct.lame_global_flags*, %struct.lame_global_flags** %6, align 8
  %112 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %111, i32 0, i32 59
  %113 = load i32, i32* %112, align 8
  %114 = icmp eq i32 %113, 0
  br i1 %114, label %115, label %254

; <label>:115:                                    ; preds = %110
  %pgocount5 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 19)
  %116 = add i64 %pgocount5, 1
  store i64 %116, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 19)
  %117 = load %struct.lame_global_flags*, %struct.lame_global_flags** %6, align 8
  %118 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %117, i32 0, i32 58
  %119 = load i32, i32* %118, align 4
  %120 = add nsw i32 %119, 1
  store i32 %120, i32* %15, align 4
  br label %121

; <label>:121:                                    ; preds = %249, %115
  %122 = load i32, i32* %15, align 4
  %123 = load %struct.lame_global_flags*, %struct.lame_global_flags** %6, align 8
  %124 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %123, i32 0, i32 57
  %125 = load i32, i32* %124, align 8
  %126 = icmp slt i32 %122, %125
  br i1 %126, label %127, label %253

; <label>:127:                                    ; preds = %121
  %128 = load i32, i32* %15, align 4
  %129 = sitofp i32 %128 to double
  %130 = fdiv double %129, 3.100000e+01
  store double %130, double* %20, align 8
  %131 = load %struct.lame_global_flags*, %struct.lame_global_flags** %6, align 8
  %132 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %131, i32 0, i32 53
  %133 = load float, float* %132, align 8
  %134 = fpext float %133 to double
  %135 = load double, double* %20, align 8
  %136 = fcmp olt double %134, %135
  br i1 %136, label %137, label %189

; <label>:137:                                    ; preds = %127
  %pgocount6 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 11)
  %138 = add i64 %pgocount6, 1
  store i64 %138, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 11)
  %139 = load double, double* %20, align 8
  %140 = load %struct.lame_global_flags*, %struct.lame_global_flags** %6, align 8
  %141 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %140, i32 0, i32 54
  %142 = load float, float* %141, align 4
  %143 = fpext float %142 to double
  %144 = fcmp olt double %139, %143
  br i1 %144, label %145, label %189

; <label>:145:                                    ; preds = %137
  %146 = load %struct.lame_global_flags*, %struct.lame_global_flags** %6, align 8
  %147 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %146, i32 0, i32 53
  %148 = load float, float* %147, align 8
  %149 = fpext float %148 to double
  %150 = load double, double* %20, align 8
  %151 = fsub double %149, %150
  %152 = fmul double 0x3FF921FB54442D18, %151
  %153 = load %struct.lame_global_flags*, %struct.lame_global_flags** %6, align 8
  %154 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %153, i32 0, i32 54
  %155 = load float, float* %154, align 4
  %156 = load %struct.lame_global_flags*, %struct.lame_global_flags** %6, align 8
  %157 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %156, i32 0, i32 53
  %158 = load float, float* %157, align 8
  %159 = fsub float %155, %158
  %160 = fpext float %159 to double
  %161 = fdiv double %152, %160
  %162 = call double @cos(double %161) #3
  store double %162, double* %19, align 8
  store i32 0, i32* %12, align 4
  br label %163

; <label>:163:                                    ; preds = %183, %145
  %164 = load i32, i32* %12, align 4
  %165 = icmp slt i32 %164, 18
  br i1 %165, label %166, label %187

; <label>:166:                                    ; preds = %163
  %167 = load double, double* %19, align 8
  %168 = load i32, i32* %13, align 4
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %169
  %171 = load i32, i32* %11, align 4
  %172 = sub nsw i32 1, %171
  %173 = sext i32 %172 to i64
  %174 = getelementptr inbounds [2 x [18 x [32 x double]]], [2 x [18 x [32 x double]]]* %170, i64 0, i64 %173
  %175 = load i32, i32* %12, align 4
  %176 = sext i32 %175 to i64
  %177 = getelementptr inbounds [18 x [32 x double]], [18 x [32 x double]]* %174, i64 0, i64 %176
  %178 = load i32, i32* %15, align 4
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds [32 x double], [32 x double]* %177, i64 0, i64 %179
  %181 = load double, double* %180, align 8
  %182 = fmul double %181, %167
  store double %182, double* %180, align 8
  br label %183

; <label>:183:                                    ; preds = %166
  %pgocount7 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 4)
  %184 = add i64 %pgocount7, 1
  store i64 %184, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 4)
  %185 = load i32, i32* %12, align 4
  %186 = add nsw i32 %185, 1
  store i32 %186, i32* %12, align 4
  br label %163

; <label>:187:                                    ; preds = %163
  %pgocount8 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 16)
  %188 = add i64 %pgocount8, 1
  store i64 %188, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 16)
  br label %189

; <label>:189:                                    ; preds = %187, %137, %127
  %190 = load %struct.lame_global_flags*, %struct.lame_global_flags** %6, align 8
  %191 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %190, i32 0, i32 55
  %192 = load float, float* %191, align 8
  %193 = fpext float %192 to double
  %194 = load double, double* %20, align 8
  %195 = fcmp olt double %193, %194
  br i1 %195, label %196, label %248

; <label>:196:                                    ; preds = %189
  %pgocount9 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 12)
  %197 = add i64 %pgocount9, 1
  store i64 %197, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 12)
  %198 = load double, double* %20, align 8
  %199 = load %struct.lame_global_flags*, %struct.lame_global_flags** %6, align 8
  %200 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %199, i32 0, i32 56
  %201 = load float, float* %200, align 4
  %202 = fpext float %201 to double
  %203 = fcmp olt double %198, %202
  br i1 %203, label %204, label %248

; <label>:204:                                    ; preds = %196
  %205 = load %struct.lame_global_flags*, %struct.lame_global_flags** %6, align 8
  %206 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %205, i32 0, i32 56
  %207 = load float, float* %206, align 4
  %208 = fpext float %207 to double
  %209 = load double, double* %20, align 8
  %210 = fsub double %208, %209
  %211 = fmul double 0x3FF921FB54442D18, %210
  %212 = load %struct.lame_global_flags*, %struct.lame_global_flags** %6, align 8
  %213 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %212, i32 0, i32 56
  %214 = load float, float* %213, align 4
  %215 = load %struct.lame_global_flags*, %struct.lame_global_flags** %6, align 8
  %216 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %215, i32 0, i32 55
  %217 = load float, float* %216, align 8
  %218 = fsub float %214, %217
  %219 = fpext float %218 to double
  %220 = fdiv double %211, %219
  %221 = call double @cos(double %220) #3
  store double %221, double* %19, align 8
  store i32 0, i32* %12, align 4
  br label %222

; <label>:222:                                    ; preds = %242, %204
  %223 = load i32, i32* %12, align 4
  %224 = icmp slt i32 %223, 18
  br i1 %224, label %225, label %246

; <label>:225:                                    ; preds = %222
  %226 = load double, double* %19, align 8
  %227 = load i32, i32* %13, align 4
  %228 = sext i32 %227 to i64
  %229 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %228
  %230 = load i32, i32* %11, align 4
  %231 = sub nsw i32 1, %230
  %232 = sext i32 %231 to i64
  %233 = getelementptr inbounds [2 x [18 x [32 x double]]], [2 x [18 x [32 x double]]]* %229, i64 0, i64 %232
  %234 = load i32, i32* %12, align 4
  %235 = sext i32 %234 to i64
  %236 = getelementptr inbounds [18 x [32 x double]], [18 x [32 x double]]* %233, i64 0, i64 %235
  %237 = load i32, i32* %15, align 4
  %238 = sext i32 %237 to i64
  %239 = getelementptr inbounds [32 x double], [32 x double]* %236, i64 0, i64 %238
  %240 = load double, double* %239, align 8
  %241 = fmul double %240, %226
  store double %241, double* %239, align 8
  br label %242

; <label>:242:                                    ; preds = %225
  %pgocount10 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 5)
  %243 = add i64 %pgocount10, 1
  store i64 %243, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 5)
  %244 = load i32, i32* %12, align 4
  %245 = add nsw i32 %244, 1
  store i32 %245, i32* %12, align 4
  br label %222

; <label>:246:                                    ; preds = %222
  %pgocount11 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 17)
  %247 = add i64 %pgocount11, 1
  store i64 %247, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 17)
  br label %248

; <label>:248:                                    ; preds = %246, %196, %189
  br label %249

; <label>:249:                                    ; preds = %248
  %pgocount12 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 9)
  %250 = add i64 %pgocount12, 1
  store i64 %250, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 9)
  %251 = load i32, i32* %15, align 4
  %252 = add nsw i32 %251, 1
  store i32 %252, i32* %15, align 4
  br label %121

; <label>:253:                                    ; preds = %121
  br label %254

; <label>:254:                                    ; preds = %253, %110
  store i32 0, i32* %15, align 4
  br label %255

; <label>:255:                                    ; preds = %698, %254
  %256 = load i32, i32* %15, align 4
  %257 = icmp slt i32 %256, 32
  br i1 %257, label %258, label %703

; <label>:258:                                    ; preds = %255
  %259 = load %struct.gr_info*, %struct.gr_info** %17, align 8
  %260 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %259, i32 0, i32 6
  %261 = load i32, i32* %260, align 8
  store i32 %261, i32* %21, align 4
  %262 = load i32, i32* %15, align 4
  %263 = load %struct.lame_global_flags*, %struct.lame_global_flags** %6, align 8
  %264 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %263, i32 0, i32 57
  %265 = load i32, i32* %264, align 8
  %266 = icmp sge i32 %262, %265
  br i1 %266, label %274, label %267

; <label>:267:                                    ; preds = %258
  %pgocount13 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 8)
  %268 = add i64 %pgocount13, 1
  store i64 %268, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 8)
  %269 = load i32, i32* %15, align 4
  %270 = load %struct.lame_global_flags*, %struct.lame_global_flags** %6, align 8
  %271 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %270, i32 0, i32 58
  %272 = load i32, i32* %271, align 4
  %273 = icmp sle i32 %269, %272
  br i1 %273, label %274, label %278

; <label>:274:                                    ; preds = %267, %258
  %pgocount14 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 7)
  %275 = add i64 %pgocount14, 1
  store i64 %275, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 7)
  %276 = load double*, double** %16, align 8
  %277 = bitcast double* %276 to i8*
  call void @llvm.memset.p0i8.i64(i8* %277, i8 0, i64 144, i32 1, i1 false)
  br label %623

; <label>:278:                                    ; preds = %267
  %279 = load i32, i32* %21, align 4
  %280 = icmp eq i32 %279, 2
  br i1 %280, label %281, label %510

; <label>:281:                                    ; preds = %278
  store i32 2, i32* %12, align 4
  br label %282

; <label>:282:                                    ; preds = %503, %281
  %283 = load i32, i32* %12, align 4
  %284 = icmp sge i32 %283, 0
  br i1 %284, label %285, label %507

; <label>:285:                                    ; preds = %282
  %286 = load i32, i32* %12, align 4
  %287 = sext i32 %286 to i64
  %288 = getelementptr inbounds [36 x double], [36 x double]* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2), i64 0, i64 %287
  %289 = load double, double* %288, align 8
  store double %289, double* %22, align 8
  %290 = load i32, i32* %13, align 4
  %291 = sext i32 %290 to i64
  %292 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %291
  %293 = load i32, i32* %11, align 4
  %294 = sext i32 %293 to i64
  %295 = getelementptr inbounds [2 x [18 x [32 x double]]], [2 x [18 x [32 x double]]]* %292, i64 0, i64 %294
  %296 = load i32, i32* %12, align 4
  %297 = add nsw i32 %296, 6
  %298 = sext i32 %297 to i64
  %299 = getelementptr inbounds [18 x [32 x double]], [18 x [32 x double]]* %295, i64 0, i64 %298
  %300 = load i32, i32* %15, align 4
  %301 = sext i32 %300 to i64
  %302 = getelementptr inbounds [32 x double], [32 x double]* %299, i64 0, i64 %301
  %303 = load double, double* %302, align 8
  %304 = load double, double* %22, align 8
  %305 = fmul double %303, %304
  %306 = load i32, i32* %13, align 4
  %307 = sext i32 %306 to i64
  %308 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %307
  %309 = load i32, i32* %11, align 4
  %310 = sext i32 %309 to i64
  %311 = getelementptr inbounds [2 x [18 x [32 x double]]], [2 x [18 x [32 x double]]]* %308, i64 0, i64 %310
  %312 = load i32, i32* %12, align 4
  %313 = sub nsw i32 11, %312
  %314 = sext i32 %313 to i64
  %315 = getelementptr inbounds [18 x [32 x double]], [18 x [32 x double]]* %311, i64 0, i64 %314
  %316 = load i32, i32* %15, align 4
  %317 = sext i32 %316 to i64
  %318 = getelementptr inbounds [32 x double], [32 x double]* %315, i64 0, i64 %317
  %319 = load double, double* %318, align 8
  %320 = fsub double %305, %319
  %321 = load i32, i32* %12, align 4
  %322 = sext i32 %321 to i64
  %323 = getelementptr inbounds double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 4), i64 %322
  store double %320, double* %323, align 8
  %324 = load i32, i32* %13, align 4
  %325 = sext i32 %324 to i64
  %326 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %325
  %327 = load i32, i32* %11, align 4
  %328 = sext i32 %327 to i64
  %329 = getelementptr inbounds [2 x [18 x [32 x double]]], [2 x [18 x [32 x double]]]* %326, i64 0, i64 %328
  %330 = load i32, i32* %12, align 4
  %331 = add nsw i32 %330, 12
  %332 = sext i32 %331 to i64
  %333 = getelementptr inbounds [18 x [32 x double]], [18 x [32 x double]]* %329, i64 0, i64 %332
  %334 = load i32, i32* %15, align 4
  %335 = sext i32 %334 to i64
  %336 = getelementptr inbounds [32 x double], [32 x double]* %333, i64 0, i64 %335
  %337 = load double, double* %336, align 8
  %338 = load i32, i32* %13, align 4
  %339 = sext i32 %338 to i64
  %340 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %339
  %341 = load i32, i32* %11, align 4
  %342 = sext i32 %341 to i64
  %343 = getelementptr inbounds [2 x [18 x [32 x double]]], [2 x [18 x [32 x double]]]* %340, i64 0, i64 %342
  %344 = load i32, i32* %12, align 4
  %345 = sub nsw i32 17, %344
  %346 = sext i32 %345 to i64
  %347 = getelementptr inbounds [18 x [32 x double]], [18 x [32 x double]]* %343, i64 0, i64 %346
  %348 = load i32, i32* %15, align 4
  %349 = sext i32 %348 to i64
  %350 = getelementptr inbounds [32 x double], [32 x double]* %347, i64 0, i64 %349
  %351 = load double, double* %350, align 8
  %352 = load double, double* %22, align 8
  %353 = fmul double %351, %352
  %354 = fadd double %337, %353
  %355 = load i32, i32* %12, align 4
  %356 = add nsw i32 %355, 3
  %357 = sext i32 %356 to i64
  %358 = getelementptr inbounds double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 4), i64 %357
  store double %354, double* %358, align 8
  %359 = load i32, i32* %13, align 4
  %360 = sext i32 %359 to i64
  %361 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %360
  %362 = load i32, i32* %11, align 4
  %363 = sext i32 %362 to i64
  %364 = getelementptr inbounds [2 x [18 x [32 x double]]], [2 x [18 x [32 x double]]]* %361, i64 0, i64 %363
  %365 = load i32, i32* %12, align 4
  %366 = add nsw i32 %365, 12
  %367 = sext i32 %366 to i64
  %368 = getelementptr inbounds [18 x [32 x double]], [18 x [32 x double]]* %364, i64 0, i64 %367
  %369 = load i32, i32* %15, align 4
  %370 = sext i32 %369 to i64
  %371 = getelementptr inbounds [32 x double], [32 x double]* %368, i64 0, i64 %370
  %372 = load double, double* %371, align 8
  %373 = load double, double* %22, align 8
  %374 = fmul double %372, %373
  %375 = load i32, i32* %13, align 4
  %376 = sext i32 %375 to i64
  %377 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %376
  %378 = load i32, i32* %11, align 4
  %379 = sext i32 %378 to i64
  %380 = getelementptr inbounds [2 x [18 x [32 x double]]], [2 x [18 x [32 x double]]]* %377, i64 0, i64 %379
  %381 = load i32, i32* %12, align 4
  %382 = sub nsw i32 17, %381
  %383 = sext i32 %382 to i64
  %384 = getelementptr inbounds [18 x [32 x double]], [18 x [32 x double]]* %380, i64 0, i64 %383
  %385 = load i32, i32* %15, align 4
  %386 = sext i32 %385 to i64
  %387 = getelementptr inbounds [32 x double], [32 x double]* %384, i64 0, i64 %386
  %388 = load double, double* %387, align 8
  %389 = fsub double %374, %388
  %390 = load i32, i32* %12, align 4
  %391 = add nsw i32 %390, 6
  %392 = sext i32 %391 to i64
  %393 = getelementptr inbounds double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 4), i64 %392
  store double %389, double* %393, align 8
  %394 = load i32, i32* %13, align 4
  %395 = sext i32 %394 to i64
  %396 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %395
  %397 = load i32, i32* %11, align 4
  %398 = sub nsw i32 1, %397
  %399 = sext i32 %398 to i64
  %400 = getelementptr inbounds [2 x [18 x [32 x double]]], [2 x [18 x [32 x double]]]* %396, i64 0, i64 %399
  %401 = load i32, i32* %12, align 4
  %402 = sext i32 %401 to i64
  %403 = getelementptr inbounds [18 x [32 x double]], [18 x [32 x double]]* %400, i64 0, i64 %402
  %404 = load i32, i32* %15, align 4
  %405 = sext i32 %404 to i64
  %406 = getelementptr inbounds [32 x double], [32 x double]* %403, i64 0, i64 %405
  %407 = load double, double* %406, align 8
  %408 = load i32, i32* %13, align 4
  %409 = sext i32 %408 to i64
  %410 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %409
  %411 = load i32, i32* %11, align 4
  %412 = sub nsw i32 1, %411
  %413 = sext i32 %412 to i64
  %414 = getelementptr inbounds [2 x [18 x [32 x double]]], [2 x [18 x [32 x double]]]* %410, i64 0, i64 %413
  %415 = load i32, i32* %12, align 4
  %416 = sub nsw i32 5, %415
  %417 = sext i32 %416 to i64
  %418 = getelementptr inbounds [18 x [32 x double]], [18 x [32 x double]]* %414, i64 0, i64 %417
  %419 = load i32, i32* %15, align 4
  %420 = sext i32 %419 to i64
  %421 = getelementptr inbounds [32 x double], [32 x double]* %418, i64 0, i64 %420
  %422 = load double, double* %421, align 8
  %423 = load double, double* %22, align 8
  %424 = fmul double %422, %423
  %425 = fadd double %407, %424
  %426 = load i32, i32* %12, align 4
  %427 = add nsw i32 %426, 9
  %428 = sext i32 %427 to i64
  %429 = getelementptr inbounds double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 4), i64 %428
  store double %425, double* %429, align 8
  %430 = load i32, i32* %13, align 4
  %431 = sext i32 %430 to i64
  %432 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %431
  %433 = load i32, i32* %11, align 4
  %434 = sub nsw i32 1, %433
  %435 = sext i32 %434 to i64
  %436 = getelementptr inbounds [2 x [18 x [32 x double]]], [2 x [18 x [32 x double]]]* %432, i64 0, i64 %435
  %437 = load i32, i32* %12, align 4
  %438 = sext i32 %437 to i64
  %439 = getelementptr inbounds [18 x [32 x double]], [18 x [32 x double]]* %436, i64 0, i64 %438
  %440 = load i32, i32* %15, align 4
  %441 = sext i32 %440 to i64
  %442 = getelementptr inbounds [32 x double], [32 x double]* %439, i64 0, i64 %441
  %443 = load double, double* %442, align 8
  %444 = load double, double* %22, align 8
  %445 = fmul double %443, %444
  %446 = load i32, i32* %13, align 4
  %447 = sext i32 %446 to i64
  %448 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %447
  %449 = load i32, i32* %11, align 4
  %450 = sub nsw i32 1, %449
  %451 = sext i32 %450 to i64
  %452 = getelementptr inbounds [2 x [18 x [32 x double]]], [2 x [18 x [32 x double]]]* %448, i64 0, i64 %451
  %453 = load i32, i32* %12, align 4
  %454 = sub nsw i32 5, %453
  %455 = sext i32 %454 to i64
  %456 = getelementptr inbounds [18 x [32 x double]], [18 x [32 x double]]* %452, i64 0, i64 %455
  %457 = load i32, i32* %15, align 4
  %458 = sext i32 %457 to i64
  %459 = getelementptr inbounds [32 x double], [32 x double]* %456, i64 0, i64 %458
  %460 = load double, double* %459, align 8
  %461 = fsub double %445, %460
  %462 = load i32, i32* %12, align 4
  %463 = add nsw i32 %462, 12
  %464 = sext i32 %463 to i64
  %465 = getelementptr inbounds double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 4), i64 %464
  store double %461, double* %465, align 8
  %466 = load i32, i32* %13, align 4
  %467 = sext i32 %466 to i64
  %468 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %467
  %469 = load i32, i32* %11, align 4
  %470 = sub nsw i32 1, %469
  %471 = sext i32 %470 to i64
  %472 = getelementptr inbounds [2 x [18 x [32 x double]]], [2 x [18 x [32 x double]]]* %468, i64 0, i64 %471
  %473 = load i32, i32* %12, align 4
  %474 = add nsw i32 %473, 6
  %475 = sext i32 %474 to i64
  %476 = getelementptr inbounds [18 x [32 x double]], [18 x [32 x double]]* %472, i64 0, i64 %475
  %477 = load i32, i32* %15, align 4
  %478 = sext i32 %477 to i64
  %479 = getelementptr inbounds [32 x double], [32 x double]* %476, i64 0, i64 %478
  %480 = load double, double* %479, align 8
  %481 = load i32, i32* %13, align 4
  %482 = sext i32 %481 to i64
  %483 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %482
  %484 = load i32, i32* %11, align 4
  %485 = sub nsw i32 1, %484
  %486 = sext i32 %485 to i64
  %487 = getelementptr inbounds [2 x [18 x [32 x double]]], [2 x [18 x [32 x double]]]* %483, i64 0, i64 %486
  %488 = load i32, i32* %12, align 4
  %489 = sub nsw i32 11, %488
  %490 = sext i32 %489 to i64
  %491 = getelementptr inbounds [18 x [32 x double]], [18 x [32 x double]]* %487, i64 0, i64 %490
  %492 = load i32, i32* %15, align 4
  %493 = sext i32 %492 to i64
  %494 = getelementptr inbounds [32 x double], [32 x double]* %491, i64 0, i64 %493
  %495 = load double, double* %494, align 8
  %496 = load double, double* %22, align 8
  %497 = fmul double %495, %496
  %498 = fadd double %480, %497
  %499 = load i32, i32* %12, align 4
  %500 = add nsw i32 %499, 15
  %501 = sext i32 %500 to i64
  %502 = getelementptr inbounds double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 4), i64 %501
  store double %498, double* %502, align 8
  br label %503

; <label>:503:                                    ; preds = %285
  %pgocount15 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 2)
  %504 = add i64 %pgocount15, 1
  store i64 %504, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 2)
  %505 = load i32, i32* %12, align 4
  %506 = add nsw i32 %505, -1
  store i32 %506, i32* %12, align 4
  br label %282

; <label>:507:                                    ; preds = %282
  %pgocount16 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 14)
  %508 = add i64 %pgocount16, 1
  store i64 %508, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 14)
  %509 = load double*, double** %16, align 8
  call void @mdct_short(double* %509, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 4))
  br label %622

; <label>:510:                                    ; preds = %278
  store i32 8, i32* %12, align 4
  br label %511

; <label>:511:                                    ; preds = %615, %510
  %512 = load i32, i32* %12, align 4
  %513 = icmp sge i32 %512, 0
  br i1 %513, label %514, label %619

; <label>:514:                                    ; preds = %511
  %515 = load i32, i32* %21, align 4
  %516 = sext i32 %515 to i64
  %517 = getelementptr inbounds [4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 %516
  %518 = load i32, i32* %12, align 4
  %519 = sext i32 %518 to i64
  %520 = getelementptr inbounds [36 x double], [36 x double]* %517, i64 0, i64 %519
  %521 = load double, double* %520, align 8
  %522 = load i32, i32* %13, align 4
  %523 = sext i32 %522 to i64
  %524 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %523
  %525 = load i32, i32* %11, align 4
  %526 = sext i32 %525 to i64
  %527 = getelementptr inbounds [2 x [18 x [32 x double]]], [2 x [18 x [32 x double]]]* %524, i64 0, i64 %526
  %528 = load i32, i32* %12, align 4
  %529 = sext i32 %528 to i64
  %530 = getelementptr inbounds [18 x [32 x double]], [18 x [32 x double]]* %527, i64 0, i64 %529
  %531 = load i32, i32* %15, align 4
  %532 = sext i32 %531 to i64
  %533 = getelementptr inbounds [32 x double], [32 x double]* %530, i64 0, i64 %532
  %534 = load double, double* %533, align 8
  %535 = fmul double %521, %534
  %536 = load i32, i32* %21, align 4
  %537 = sext i32 %536 to i64
  %538 = getelementptr inbounds [4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 %537
  %539 = load i32, i32* %12, align 4
  %540 = add nsw i32 %539, 9
  %541 = sext i32 %540 to i64
  %542 = getelementptr inbounds [36 x double], [36 x double]* %538, i64 0, i64 %541
  %543 = load double, double* %542, align 8
  %544 = load i32, i32* %13, align 4
  %545 = sext i32 %544 to i64
  %546 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %545
  %547 = load i32, i32* %11, align 4
  %548 = sext i32 %547 to i64
  %549 = getelementptr inbounds [2 x [18 x [32 x double]]], [2 x [18 x [32 x double]]]* %546, i64 0, i64 %548
  %550 = load i32, i32* %12, align 4
  %551 = sub nsw i32 17, %550
  %552 = sext i32 %551 to i64
  %553 = getelementptr inbounds [18 x [32 x double]], [18 x [32 x double]]* %549, i64 0, i64 %552
  %554 = load i32, i32* %15, align 4
  %555 = sext i32 %554 to i64
  %556 = getelementptr inbounds [32 x double], [32 x double]* %553, i64 0, i64 %555
  %557 = load double, double* %556, align 8
  %558 = fmul double %543, %557
  %559 = fsub double %535, %558
  %560 = load i32, i32* %12, align 4
  %561 = sext i32 %560 to i64
  %562 = getelementptr inbounds double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 4), i64 %561
  store double %559, double* %562, align 8
  %563 = load i32, i32* %21, align 4
  %564 = sext i32 %563 to i64
  %565 = getelementptr inbounds [4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 %564
  %566 = load i32, i32* %12, align 4
  %567 = add nsw i32 %566, 18
  %568 = sext i32 %567 to i64
  %569 = getelementptr inbounds [36 x double], [36 x double]* %565, i64 0, i64 %568
  %570 = load double, double* %569, align 8
  %571 = load i32, i32* %13, align 4
  %572 = sext i32 %571 to i64
  %573 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %572
  %574 = load i32, i32* %11, align 4
  %575 = sub nsw i32 1, %574
  %576 = sext i32 %575 to i64
  %577 = getelementptr inbounds [2 x [18 x [32 x double]]], [2 x [18 x [32 x double]]]* %573, i64 0, i64 %576
  %578 = load i32, i32* %12, align 4
  %579 = sext i32 %578 to i64
  %580 = getelementptr inbounds [18 x [32 x double]], [18 x [32 x double]]* %577, i64 0, i64 %579
  %581 = load i32, i32* %15, align 4
  %582 = sext i32 %581 to i64
  %583 = getelementptr inbounds [32 x double], [32 x double]* %580, i64 0, i64 %582
  %584 = load double, double* %583, align 8
  %585 = fmul double %570, %584
  %586 = load i32, i32* %21, align 4
  %587 = sext i32 %586 to i64
  %588 = getelementptr inbounds [4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 %587
  %589 = load i32, i32* %12, align 4
  %590 = add nsw i32 %589, 27
  %591 = sext i32 %590 to i64
  %592 = getelementptr inbounds [36 x double], [36 x double]* %588, i64 0, i64 %591
  %593 = load double, double* %592, align 8
  %594 = load i32, i32* %13, align 4
  %595 = sext i32 %594 to i64
  %596 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %595
  %597 = load i32, i32* %11, align 4
  %598 = sub nsw i32 1, %597
  %599 = sext i32 %598 to i64
  %600 = getelementptr inbounds [2 x [18 x [32 x double]]], [2 x [18 x [32 x double]]]* %596, i64 0, i64 %599
  %601 = load i32, i32* %12, align 4
  %602 = sub nsw i32 17, %601
  %603 = sext i32 %602 to i64
  %604 = getelementptr inbounds [18 x [32 x double]], [18 x [32 x double]]* %600, i64 0, i64 %603
  %605 = load i32, i32* %15, align 4
  %606 = sext i32 %605 to i64
  %607 = getelementptr inbounds [32 x double], [32 x double]* %604, i64 0, i64 %606
  %608 = load double, double* %607, align 8
  %609 = fmul double %593, %608
  %610 = fadd double %585, %609
  %611 = load i32, i32* %12, align 4
  %612 = add nsw i32 9, %611
  %613 = sext i32 %612 to i64
  %614 = getelementptr inbounds double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 4), i64 %613
  store double %610, double* %614, align 8
  br label %615

; <label>:615:                                    ; preds = %514
  %pgocount17 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 3)
  %616 = add i64 %pgocount17, 1
  store i64 %616, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 3)
  %617 = load i32, i32* %12, align 4
  %618 = add nsw i32 %617, -1
  store i32 %618, i32* %12, align 4
  br label %511

; <label>:619:                                    ; preds = %511
  %pgocount18 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 15)
  %620 = add i64 %pgocount18, 1
  store i64 %620, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 15)
  %621 = load double*, double** %16, align 8
  call void @mdct_long(double* %621, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 4))
  br label %622

; <label>:622:                                    ; preds = %619, %507
  br label %623

; <label>:623:                                    ; preds = %622, %274
  %624 = load i32, i32* %21, align 4
  %625 = icmp ne i32 %624, 2
  br i1 %625, label %626, label %697

; <label>:626:                                    ; preds = %623
  %627 = load i32, i32* %15, align 4
  %628 = icmp eq i32 %627, 0
  br i1 %628, label %629, label %631

; <label>:629:                                    ; preds = %626
  %pgocount19 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 13)
  %630 = add i64 %pgocount19, 1
  store i64 %630, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 13)
  br label %698

; <label>:631:                                    ; preds = %626
  store i32 7, i32* %12, align 4
  br label %632

; <label>:632:                                    ; preds = %691, %631
  %633 = load i32, i32* %12, align 4
  %634 = icmp sge i32 %633, 0
  br i1 %634, label %635, label %695

; <label>:635:                                    ; preds = %632
  %636 = load double*, double** %16, align 8
  %637 = load i32, i32* %12, align 4
  %638 = sext i32 %637 to i64
  %639 = getelementptr inbounds double, double* %636, i64 %638
  %640 = load double, double* %639, align 8
  %641 = load i32, i32* %12, align 4
  %642 = sext i32 %641 to i64
  %643 = getelementptr inbounds [8 x double], [8 x double]* @ca, i64 0, i64 %642
  %644 = load double, double* %643, align 8
  %645 = fmul double %640, %644
  %646 = load double*, double** %16, align 8
  %647 = load i32, i32* %12, align 4
  %648 = sub nsw i32 -1, %647
  %649 = sext i32 %648 to i64
  %650 = getelementptr inbounds double, double* %646, i64 %649
  %651 = load double, double* %650, align 8
  %652 = load i32, i32* %12, align 4
  %653 = sext i32 %652 to i64
  %654 = getelementptr inbounds [8 x double], [8 x double]* @cs, i64 0, i64 %653
  %655 = load double, double* %654, align 8
  %656 = fmul double %651, %655
  %657 = fadd double %645, %656
  store double %657, double* %23, align 8
  %658 = load double*, double** %16, align 8
  %659 = load i32, i32* %12, align 4
  %660 = sext i32 %659 to i64
  %661 = getelementptr inbounds double, double* %658, i64 %660
  %662 = load double, double* %661, align 8
  %663 = load i32, i32* %12, align 4
  %664 = sext i32 %663 to i64
  %665 = getelementptr inbounds [8 x double], [8 x double]* @cs, i64 0, i64 %664
  %666 = load double, double* %665, align 8
  %667 = fmul double %662, %666
  %668 = load double*, double** %16, align 8
  %669 = load i32, i32* %12, align 4
  %670 = sub nsw i32 -1, %669
  %671 = sext i32 %670 to i64
  %672 = getelementptr inbounds double, double* %668, i64 %671
  %673 = load double, double* %672, align 8
  %674 = load i32, i32* %12, align 4
  %675 = sext i32 %674 to i64
  %676 = getelementptr inbounds [8 x double], [8 x double]* @ca, i64 0, i64 %675
  %677 = load double, double* %676, align 8
  %678 = fmul double %673, %677
  %679 = fsub double %667, %678
  store double %679, double* %24, align 8
  %680 = load double, double* %23, align 8
  %681 = load double*, double** %16, align 8
  %682 = load i32, i32* %12, align 4
  %683 = sub nsw i32 -1, %682
  %684 = sext i32 %683 to i64
  %685 = getelementptr inbounds double, double* %681, i64 %684
  store double %680, double* %685, align 8
  %686 = load double, double* %24, align 8
  %687 = load double*, double** %16, align 8
  %688 = load i32, i32* %12, align 4
  %689 = sext i32 %688 to i64
  %690 = getelementptr inbounds double, double* %687, i64 %689
  store double %686, double* %690, align 8
  br label %691

; <label>:691:                                    ; preds = %635
  %pgocount20 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 1)
  %692 = add i64 %pgocount20, 1
  store i64 %692, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 1)
  %693 = load i32, i32* %12, align 4
  %694 = add nsw i32 %693, -1
  store i32 %694, i32* %12, align 4
  br label %632

; <label>:695:                                    ; preds = %632
  %pgocount21 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 10)
  %696 = add i64 %pgocount21, 1
  store i64 %696, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 10)
  br label %697

; <label>:697:                                    ; preds = %695, %623
  br label %698

; <label>:698:                                    ; preds = %697, %629
  %699 = load i32, i32* %15, align 4
  %700 = add nsw i32 %699, 1
  store i32 %700, i32* %15, align 4
  %701 = load double*, double** %16, align 8
  %702 = getelementptr inbounds double, double* %701, i64 18
  store double* %702, double** %16, align 8
  br label %255

; <label>:703:                                    ; preds = %255
  br label %704

; <label>:704:                                    ; preds = %703
  %705 = load i32, i32* %11, align 4
  %706 = add nsw i32 %705, 1
  store i32 %706, i32* %11, align 4
  br label %41

; <label>:707:                                    ; preds = %41
  %708 = load i16*, i16** %8, align 8
  store i16* %708, i16** %14, align 8
  %709 = load %struct.lame_global_flags*, %struct.lame_global_flags** %6, align 8
  %710 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %709, i32 0, i32 45
  %711 = load i32, i32* %710, align 8
  %712 = icmp eq i32 %711, 1
  br i1 %712, label %713, label %727

; <label>:713:                                    ; preds = %707
  %pgocount22 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 21)
  %714 = add i64 %pgocount22, 1
  store i64 %714, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 21)
  %715 = load i32, i32* %13, align 4
  %716 = sext i32 %715 to i64
  %717 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %716
  %718 = getelementptr inbounds [2 x [18 x [32 x double]]], [2 x [18 x [32 x double]]]* %717, i64 0, i64 0
  %719 = getelementptr inbounds [18 x [32 x double]], [18 x [32 x double]]* %718, i32 0, i32 0
  %720 = bitcast [32 x double]* %719 to i8*
  %721 = load i32, i32* %13, align 4
  %722 = sext i32 %721 to i64
  %723 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %722
  %724 = getelementptr inbounds [2 x [18 x [32 x double]]], [2 x [18 x [32 x double]]]* %723, i64 0, i64 1
  %725 = getelementptr inbounds [18 x [32 x double]], [18 x [32 x double]]* %724, i32 0, i32 0
  %726 = bitcast [32 x double]* %725 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %720, i8* %726, i64 4608, i32 16, i1 false)
  br label %727

; <label>:727:                                    ; preds = %713, %707
  br label %728

; <label>:728:                                    ; preds = %727
  %729 = load i32, i32* %13, align 4
  %730 = add nsw i32 %729, 1
  store i32 %730, i32* %13, align 4
  br label %33

; <label>:731:                                    ; preds = %33
  %pgocount23 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 22)
  %732 = add i64 %pgocount23, 1
  store i64 %732, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_mdct_sub48, i64 0, i64 22)
  ret void
}

; Function Attrs: nounwind uwtable
define void @mdct_init48() #0 {
  %1 = alloca i32, align 4
  %2 = alloca i32, align 4
  %3 = alloca i32, align 4
  %4 = alloca double, align 8
  %5 = alloca double, align 8
  %6 = alloca double*, align 8
  %7 = alloca i32, align 4
  %8 = alloca double*, align 8
  %9 = alloca double*, align 8
  %10 = alloca [31 x double], align 16
  %11 = alloca double, align 8
  %12 = alloca double, align 8
  %13 = alloca double, align 8
  %14 = alloca double, align 8
  store i32 0, i32* %2, align 4
  br label %15

; <label>:15:                                     ; preds = %45, %0
  %16 = load i32, i32* %2, align 4
  %17 = icmp slt i32 %16, 8
  br i1 %17, label %18, label %49

; <label>:18:                                     ; preds = %15
  %19 = load i32, i32* %2, align 4
  %20 = sext i32 %19 to i64
  %21 = getelementptr inbounds [8 x double], [8 x double]* @mdct_init48.c, i64 0, i64 %20
  %22 = load double, double* %21, align 8
  %23 = load i32, i32* %2, align 4
  %24 = sext i32 %23 to i64
  %25 = getelementptr inbounds [8 x double], [8 x double]* @mdct_init48.c, i64 0, i64 %24
  %26 = load double, double* %25, align 8
  %27 = fmul double %22, %26
  %28 = fadd double 1.000000e+00, %27
  store double %28, double* %4, align 8
  %29 = load double, double* %4, align 8
  %30 = call double @sqrt(double %29) #3
  store double %30, double* %4, align 8
  %31 = load i32, i32* %2, align 4
  %32 = sext i32 %31 to i64
  %33 = getelementptr inbounds [8 x double], [8 x double]* @mdct_init48.c, i64 0, i64 %32
  %34 = load double, double* %33, align 8
  %35 = load double, double* %4, align 8
  %36 = fdiv double %34, %35
  %37 = load i32, i32* %2, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [8 x double], [8 x double]* @ca, i64 0, i64 %38
  store double %36, double* %39, align 8
  %40 = load double, double* %4, align 8
  %41 = fdiv double 1.000000e+00, %40
  %42 = load i32, i32* %2, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [8 x double], [8 x double]* @cs, i64 0, i64 %43
  store double %41, double* %44, align 8
  br label %45

; <label>:45:                                     ; preds = %18
  %pgocount = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 10)
  %46 = add i64 %pgocount, 1
  store i64 %46, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 10)
  %47 = load i32, i32* %2, align 4
  %48 = add nsw i32 %47, 1
  store i32 %48, i32* %2, align 4
  br label %15

; <label>:49:                                     ; preds = %15
  store i32 0, i32* %1, align 4
  br label %50

; <label>:50:                                     ; preds = %62, %49
  %51 = load i32, i32* %1, align 4
  %52 = icmp slt i32 %51, 36
  br i1 %52, label %53, label %66

; <label>:53:                                     ; preds = %50
  %54 = load i32, i32* %1, align 4
  %55 = sitofp i32 %54 to double
  %56 = fadd double %55, 5.000000e-01
  %57 = fmul double 0x3FB657184AE74487, %56
  %58 = call double @sin(double %57) #3
  %59 = load i32, i32* %1, align 4
  %60 = sext i32 %59 to i64
  %61 = getelementptr inbounds [36 x double], [36 x double]* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0), i64 0, i64 %60
  store double %58, double* %61, align 8
  br label %62

; <label>:62:                                     ; preds = %53
  %pgocount1 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 11)
  %63 = add i64 %pgocount1, 1
  store i64 %63, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 11)
  %64 = load i32, i32* %1, align 4
  %65 = add nsw i32 %64, 1
  store i32 %65, i32* %1, align 4
  br label %50

; <label>:66:                                     ; preds = %50
  store i32 0, i32* %1, align 4
  br label %67

; <label>:67:                                     ; preds = %78, %66
  %68 = load i32, i32* %1, align 4
  %69 = icmp slt i32 %68, 18
  br i1 %69, label %70, label %82

; <label>:70:                                     ; preds = %67
  %71 = load i32, i32* %1, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [36 x double], [36 x double]* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0), i64 0, i64 %72
  %74 = load double, double* %73, align 8
  %75 = load i32, i32* %1, align 4
  %76 = sext i32 %75 to i64
  %77 = getelementptr inbounds [36 x double], [36 x double]* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1), i64 0, i64 %76
  store double %74, double* %77, align 8
  br label %78

; <label>:78:                                     ; preds = %70
  %pgocount2 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 12)
  %79 = add i64 %pgocount2, 1
  store i64 %79, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 12)
  %80 = load i32, i32* %1, align 4
  %81 = add nsw i32 %80, 1
  store i32 %81, i32* %1, align 4
  br label %67

; <label>:82:                                     ; preds = %67
  br label %83

; <label>:83:                                     ; preds = %90, %82
  %84 = load i32, i32* %1, align 4
  %85 = icmp slt i32 %84, 24
  br i1 %85, label %86, label %94

; <label>:86:                                     ; preds = %83
  %87 = load i32, i32* %1, align 4
  %88 = sext i32 %87 to i64
  %89 = getelementptr inbounds [36 x double], [36 x double]* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1), i64 0, i64 %88
  store double 1.000000e+00, double* %89, align 8
  br label %90

; <label>:90:                                     ; preds = %86
  %pgocount3 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 13)
  %91 = add i64 %pgocount3, 1
  store i64 %91, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 13)
  %92 = load i32, i32* %1, align 4
  %93 = add nsw i32 %92, 1
  store i32 %93, i32* %1, align 4
  br label %83

; <label>:94:                                     ; preds = %83
  br label %95

; <label>:95:                                     ; preds = %107, %94
  %96 = load i32, i32* %1, align 4
  %97 = icmp slt i32 %96, 30
  br i1 %97, label %98, label %111

; <label>:98:                                     ; preds = %95
  %99 = load i32, i32* %1, align 4
  %100 = sitofp i32 %99 to double
  %101 = fadd double %100, 5.000000e-01
  %102 = fmul double 0x3FD0C152382D7365, %101
  %103 = call double @cos(double %102) #3
  %104 = load i32, i32* %1, align 4
  %105 = sext i32 %104 to i64
  %106 = getelementptr inbounds [36 x double], [36 x double]* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1), i64 0, i64 %105
  store double %103, double* %106, align 8
  br label %107

; <label>:107:                                    ; preds = %98
  %pgocount4 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 14)
  %108 = add i64 %pgocount4, 1
  store i64 %108, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 14)
  %109 = load i32, i32* %1, align 4
  %110 = add nsw i32 %109, 1
  store i32 %110, i32* %1, align 4
  br label %95

; <label>:111:                                    ; preds = %95
  br label %112

; <label>:112:                                    ; preds = %119, %111
  %113 = load i32, i32* %1, align 4
  %114 = icmp slt i32 %113, 36
  br i1 %114, label %115, label %123

; <label>:115:                                    ; preds = %112
  %116 = load i32, i32* %1, align 4
  %117 = sext i32 %116 to i64
  %118 = getelementptr inbounds [36 x double], [36 x double]* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1), i64 0, i64 %117
  store double 0.000000e+00, double* %118, align 8
  br label %119

; <label>:119:                                    ; preds = %115
  %pgocount5 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 15)
  %120 = add i64 %pgocount5, 1
  store i64 %120, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 15)
  %121 = load i32, i32* %1, align 4
  %122 = add nsw i32 %121, 1
  store i32 %122, i32* %1, align 4
  br label %112

; <label>:123:                                    ; preds = %112
  store i32 0, i32* %1, align 4
  br label %124

; <label>:124:                                    ; preds = %136, %123
  %125 = load i32, i32* %1, align 4
  %126 = icmp slt i32 %125, 36
  br i1 %126, label %127, label %140

; <label>:127:                                    ; preds = %124
  %128 = load i32, i32* %1, align 4
  %129 = sub nsw i32 35, %128
  %130 = sext i32 %129 to i64
  %131 = getelementptr inbounds [36 x double], [36 x double]* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1), i64 0, i64 %130
  %132 = load double, double* %131, align 8
  %133 = load i32, i32* %1, align 4
  %134 = sext i32 %133 to i64
  %135 = getelementptr inbounds [36 x double], [36 x double]* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3), i64 0, i64 %134
  store double %132, double* %135, align 8
  br label %136

; <label>:136:                                    ; preds = %127
  %pgocount6 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 16)
  %137 = add i64 %pgocount6, 1
  store i64 %137, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 16)
  %138 = load i32, i32* %1, align 4
  %139 = add nsw i32 %138, 1
  store i32 %139, i32* %1, align 4
  br label %124

; <label>:140:                                    ; preds = %124
  store double 0x3FBC71C71C71C71C, double* %4, align 8
  store double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i32 0, i32 0), double** %6, align 8
  store i32 11, i32* %7, align 4
  br label %141

; <label>:141:                                    ; preds = %197, %140
  %142 = load i32, i32* %7, align 4
  %143 = sext i32 %142 to i64
  %144 = getelementptr inbounds [12 x i32], [12 x i32]* @all, i64 0, i64 %143
  %145 = load i32, i32* %144, align 4
  store i32 %145, i32* %3, align 4
  store i32 0, i32* %2, align 4
  br label %146

; <label>:146:                                    ; preds = %166, %141
  %147 = load i32, i32* %2, align 4
  %148 = icmp slt i32 %147, 9
  br i1 %148, label %149, label %170

; <label>:149:                                    ; preds = %146
  %150 = load double, double* %4, align 8
  %151 = load i32, i32* %3, align 4
  %152 = mul nsw i32 2, %151
  %153 = add nsw i32 %152, 1
  %154 = sitofp i32 %153 to double
  %155 = fmul double 0x3F9657184AE74487, %154
  %156 = load i32, i32* %2, align 4
  %157 = mul nsw i32 4, %156
  %158 = add nsw i32 %157, 2
  %159 = add nsw i32 %158, 36
  %160 = sitofp i32 %159 to double
  %161 = fmul double %155, %160
  %162 = call double @cos(double %161) #3
  %163 = fmul double %150, %162
  %164 = load double*, double** %6, align 8
  %165 = getelementptr inbounds double, double* %164, i32 1
  store double* %165, double** %6, align 8
  store double %163, double* %164, align 8
  br label %166

; <label>:166:                                    ; preds = %149
  %pgocount7 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 0)
  %167 = add i64 %pgocount7, 1
  store i64 %167, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 0)
  %168 = load i32, i32* %2, align 4
  %169 = add nsw i32 %168, 1
  store i32 %169, i32* %2, align 4
  br label %146

; <label>:170:                                    ; preds = %146
  store i32 0, i32* %2, align 4
  br label %171

; <label>:171:                                    ; preds = %191, %170
  %172 = load i32, i32* %2, align 4
  %173 = icmp slt i32 %172, 9
  br i1 %173, label %174, label %195

; <label>:174:                                    ; preds = %171
  %175 = load double, double* %4, align 8
  %176 = load i32, i32* %3, align 4
  %177 = mul nsw i32 2, %176
  %178 = add nsw i32 %177, 1
  %179 = sitofp i32 %178 to double
  %180 = fmul double 0x3F9657184AE74487, %179
  %181 = load i32, i32* %2, align 4
  %182 = mul nsw i32 4, %181
  %183 = add nsw i32 %182, 2
  %184 = add nsw i32 %183, 108
  %185 = sitofp i32 %184 to double
  %186 = fmul double %180, %185
  %187 = call double @cos(double %186) #3
  %188 = fmul double %175, %187
  %189 = load double*, double** %6, align 8
  %190 = getelementptr inbounds double, double* %189, i32 1
  store double* %190, double** %6, align 8
  store double %188, double* %189, align 8
  br label %191

; <label>:191:                                    ; preds = %174
  %pgocount8 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 1)
  %192 = add i64 %pgocount8, 1
  store i64 %192, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 1)
  %193 = load i32, i32* %2, align 4
  %194 = add nsw i32 %193, 1
  store i32 %194, i32* %2, align 4
  br label %171

; <label>:195:                                    ; preds = %171
  %pgocount9 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 7)
  %196 = add i64 %pgocount9, 1
  store i64 %196, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 7)
  br label %197

; <label>:197:                                    ; preds = %195
  %198 = load i32, i32* %7, align 4
  %199 = add nsw i32 %198, -1
  store i32 %199, i32* %7, align 4
  %200 = icmp sge i32 %199, 0
  br i1 %200, label %141, label %201

; <label>:201:                                    ; preds = %197
  store i32 3, i32* %7, align 4
  br label %202

; <label>:202:                                    ; preds = %258, %201
  %203 = load i32, i32* %7, align 4
  %204 = sext i32 %203 to i64
  %205 = getelementptr inbounds [4 x i32], [4 x i32]* @mdct_init48.d3, i64 0, i64 %204
  %206 = load i32, i32* %205, align 4
  store i32 %206, i32* %3, align 4
  store i32 0, i32* %2, align 4
  br label %207

; <label>:207:                                    ; preds = %227, %202
  %208 = load i32, i32* %2, align 4
  %209 = icmp slt i32 %208, 3
  br i1 %209, label %210, label %231

; <label>:210:                                    ; preds = %207
  %211 = load double, double* %4, align 8
  %212 = load i32, i32* %3, align 4
  %213 = mul nsw i32 2, %212
  %214 = add nsw i32 %213, 1
  %215 = sitofp i32 %214 to double
  %216 = fmul double 0x3F9657184AE74487, %215
  %217 = load i32, i32* %2, align 4
  %218 = mul nsw i32 4, %217
  %219 = add nsw i32 %218, 2
  %220 = add nsw i32 %219, 36
  %221 = sitofp i32 %220 to double
  %222 = fmul double %216, %221
  %223 = call double @cos(double %222) #3
  %224 = fmul double %211, %223
  %225 = load double*, double** %6, align 8
  %226 = getelementptr inbounds double, double* %225, i32 1
  store double* %226, double** %6, align 8
  store double %224, double* %225, align 8
  br label %227

; <label>:227:                                    ; preds = %210
  %pgocount10 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 2)
  %228 = add i64 %pgocount10, 1
  store i64 %228, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 2)
  %229 = load i32, i32* %2, align 4
  %230 = add nsw i32 %229, 1
  store i32 %230, i32* %2, align 4
  br label %207

; <label>:231:                                    ; preds = %207
  store i32 6, i32* %2, align 4
  br label %232

; <label>:232:                                    ; preds = %252, %231
  %233 = load i32, i32* %2, align 4
  %234 = icmp slt i32 %233, 9
  br i1 %234, label %235, label %256

; <label>:235:                                    ; preds = %232
  %236 = load double, double* %4, align 8
  %237 = load i32, i32* %3, align 4
  %238 = mul nsw i32 2, %237
  %239 = add nsw i32 %238, 1
  %240 = sitofp i32 %239 to double
  %241 = fmul double 0x3F9657184AE74487, %240
  %242 = load i32, i32* %2, align 4
  %243 = mul nsw i32 4, %242
  %244 = add nsw i32 %243, 2
  %245 = add nsw i32 %244, 36
  %246 = sitofp i32 %245 to double
  %247 = fmul double %241, %246
  %248 = call double @cos(double %247) #3
  %249 = fmul double %236, %248
  %250 = load double*, double** %6, align 8
  %251 = getelementptr inbounds double, double* %250, i32 1
  store double* %251, double** %6, align 8
  store double %249, double* %250, align 8
  br label %252

; <label>:252:                                    ; preds = %235
  %pgocount11 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 3)
  %253 = add i64 %pgocount11, 1
  store i64 %253, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 3)
  %254 = load i32, i32* %2, align 4
  %255 = add nsw i32 %254, 1
  store i32 %255, i32* %2, align 4
  br label %232

; <label>:256:                                    ; preds = %232
  %pgocount12 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 8)
  %257 = add i64 %pgocount12, 1
  store i64 %257, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 8)
  br label %258

; <label>:258:                                    ; preds = %256
  %259 = load i32, i32* %7, align 4
  %260 = add nsw i32 %259, -1
  store i32 %260, i32* %7, align 4
  %261 = icmp sge i32 %260, 0
  br i1 %261, label %202, label %262

; <label>:262:                                    ; preds = %258
  store i32 1, i32* %7, align 4
  br label %263

; <label>:263:                                    ; preds = %291, %262
  %pgocount13 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 9)
  %264 = add i64 %pgocount13, 1
  store i64 %264, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 9)
  %265 = load i32, i32* %7, align 4
  %266 = sext i32 %265 to i64
  %267 = getelementptr inbounds [2 x i32], [2 x i32]* @mdct_init48.d9, i64 0, i64 %266
  %268 = load i32, i32* %267, align 4
  store i32 %268, i32* %3, align 4
  %269 = load double, double* %4, align 8
  %270 = load i32, i32* %3, align 4
  %271 = mul nsw i32 2, %270
  %272 = add nsw i32 %271, 1
  %273 = sitofp i32 %272 to double
  %274 = fmul double 0x3F9657184AE74487, %273
  %275 = fmul double %274, 3.800000e+01
  %276 = call double @cos(double %275) #3
  %277 = fmul double %269, %276
  %278 = load double*, double** %6, align 8
  %279 = getelementptr inbounds double, double* %278, i32 1
  store double* %279, double** %6, align 8
  store double %277, double* %278, align 8
  %280 = load double, double* %4, align 8
  %281 = load i32, i32* %3, align 4
  %282 = mul nsw i32 2, %281
  %283 = add nsw i32 %282, 1
  %284 = sitofp i32 %283 to double
  %285 = fmul double 0x3F9657184AE74487, %284
  %286 = fmul double %285, 4.600000e+01
  %287 = call double @cos(double %286) #3
  %288 = fmul double %280, %287
  %289 = load double*, double** %6, align 8
  %290 = getelementptr inbounds double, double* %289, i32 1
  store double* %290, double** %6, align 8
  store double %288, double* %289, align 8
  br label %291

; <label>:291:                                    ; preds = %263
  %292 = load i32, i32* %7, align 4
  %293 = add nsw i32 %292, -1
  store i32 %293, i32* %7, align 4
  %294 = icmp sge i32 %293, 0
  br i1 %294, label %263, label %295

; <label>:295:                                    ; preds = %291
  %pgocount14 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 24)
  %296 = add i64 %pgocount14, 1
  store i64 %296, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 24)
  %297 = load double, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 248), align 16
  store double %297, double* %5, align 8
  store double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i32 0, i32 0), double** %8, align 8
  store double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i32 0, i32 0), double** %9, align 8
  %298 = load double*, double** %8, align 8
  %299 = getelementptr inbounds double, double* %298, i32 1
  store double* %299, double** %8, align 8
  %300 = load double, double* %298, align 8
  store double %300, double* %11, align 8
  %301 = load double, double* %11, align 8
  %302 = load double, double* %5, align 8
  %303 = fdiv double %301, %302
  %304 = getelementptr inbounds [31 x double], [31 x double]* %10, i64 0, i64 15
  store double %303, double* %304, align 8
  store i32 0, i32* %2, align 4
  br label %305

; <label>:305:                                    ; preds = %316, %295
  %306 = load i32, i32* %2, align 4
  %307 = icmp slt i32 %306, 7
  br i1 %307, label %308, label %320

; <label>:308:                                    ; preds = %305
  %309 = load double*, double** %8, align 8
  %310 = getelementptr inbounds double, double* %309, i32 1
  store double* %310, double** %8, align 8
  %311 = load double, double* %309, align 8
  %312 = load double, double* %11, align 8
  %313 = fdiv double %311, %312
  %314 = load double*, double** %9, align 8
  %315 = getelementptr inbounds double, double* %314, i32 1
  store double* %315, double** %9, align 8
  store double %313, double* %314, align 8
  br label %316

; <label>:316:                                    ; preds = %308
  %pgocount15 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 17)
  %317 = add i64 %pgocount15, 1
  store i64 %317, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 17)
  %318 = load i32, i32* %2, align 4
  %319 = add nsw i32 %318, 1
  store i32 %319, i32* %2, align 4
  br label %305

; <label>:320:                                    ; preds = %305
  store i32 14, i32* %1, align 4
  br label %321

; <label>:321:                                    ; preds = %354, %320
  %322 = load i32, i32* %1, align 4
  %323 = icmp sge i32 %322, 0
  br i1 %323, label %324, label %358

; <label>:324:                                    ; preds = %321
  %325 = load double*, double** %8, align 8
  %326 = getelementptr inbounds double, double* %325, i32 1
  store double* %326, double** %8, align 8
  %327 = load double, double* %325, align 8
  store double %327, double* %12, align 8
  %328 = load double, double* %12, align 8
  %329 = load double, double* %5, align 8
  %330 = fdiv double %328, %329
  %331 = load i32, i32* %1, align 4
  %332 = sub nsw i32 30, %331
  %333 = sext i32 %332 to i64
  %334 = getelementptr inbounds [31 x double], [31 x double]* %10, i64 0, i64 %333
  store double %330, double* %334, align 8
  %335 = load i32, i32* %1, align 4
  %336 = sext i32 %335 to i64
  %337 = getelementptr inbounds [31 x double], [31 x double]* %10, i64 0, i64 %336
  store double %330, double* %337, align 8
  store i32 0, i32* %2, align 4
  br label %338

; <label>:338:                                    ; preds = %349, %324
  %339 = load i32, i32* %2, align 4
  %340 = icmp slt i32 %339, 15
  br i1 %340, label %341, label %353

; <label>:341:                                    ; preds = %338
  %342 = load double*, double** %8, align 8
  %343 = getelementptr inbounds double, double* %342, i32 1
  store double* %343, double** %8, align 8
  %344 = load double, double* %342, align 8
  %345 = load double, double* %12, align 8
  %346 = fdiv double %344, %345
  %347 = load double*, double** %9, align 8
  %348 = getelementptr inbounds double, double* %347, i32 1
  store double* %348, double** %9, align 8
  store double %346, double* %347, align 8
  br label %349

; <label>:349:                                    ; preds = %341
  %pgocount16 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 4)
  %350 = add i64 %pgocount16, 1
  store i64 %350, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 4)
  %351 = load i32, i32* %2, align 4
  %352 = add nsw i32 %351, 1
  store i32 %352, i32* %2, align 4
  br label %338

; <label>:353:                                    ; preds = %338
  br label %354

; <label>:354:                                    ; preds = %353
  %pgocount17 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 18)
  %355 = add i64 %pgocount17, 1
  store i64 %355, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 18)
  %356 = load i32, i32* %1, align 4
  %357 = add nsw i32 %356, -1
  store i32 %357, i32* %1, align 4
  br label %321

; <label>:358:                                    ; preds = %321
  %359 = load double*, double** %8, align 8
  %360 = getelementptr inbounds double, double* %359, i32 1
  store double* %360, double** %8, align 8
  store i32 0, i32* %2, align 4
  br label %361

; <label>:361:                                    ; preds = %372, %358
  %362 = load i32, i32* %2, align 4
  %363 = icmp slt i32 %362, 7
  br i1 %363, label %364, label %376

; <label>:364:                                    ; preds = %361
  %365 = load double*, double** %8, align 8
  %366 = getelementptr inbounds double, double* %365, i32 1
  store double* %366, double** %8, align 8
  %367 = load double, double* %365, align 8
  %368 = load double, double* %5, align 8
  %369 = fdiv double %367, %368
  %370 = load double*, double** %9, align 8
  %371 = getelementptr inbounds double, double* %370, i32 1
  store double* %371, double** %9, align 8
  store double %369, double* %370, align 8
  br label %372

; <label>:372:                                    ; preds = %364
  %pgocount18 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 19)
  %373 = add i64 %pgocount18, 1
  store i64 %373, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 19)
  %374 = load i32, i32* %2, align 4
  %375 = add nsw i32 %374, 1
  store i32 %375, i32* %2, align 4
  br label %361

; <label>:376:                                    ; preds = %361
  store double* getelementptr inbounds ([16 x [31 x double]], [16 x [31 x double]]* @mm, i64 0, i64 0, i64 0), double** %8, align 8
  store i32 15, i32* %1, align 4
  br label %377

; <label>:377:                                    ; preds = %407, %376
  %378 = load i32, i32* %1, align 4
  %379 = icmp sge i32 %378, 0
  br i1 %379, label %380, label %411

; <label>:380:                                    ; preds = %377
  store i32 1, i32* %2, align 4
  br label %381

; <label>:381:                                    ; preds = %402, %380
  %382 = load i32, i32* %2, align 4
  %383 = icmp slt i32 %382, 32
  br i1 %383, label %384, label %406

; <label>:384:                                    ; preds = %381
  %385 = load i32, i32* %1, align 4
  %386 = mul nsw i32 2, %385
  %387 = add nsw i32 %386, 1
  %388 = load i32, i32* %2, align 4
  %389 = mul nsw i32 %387, %388
  %390 = sitofp i32 %389 to double
  %391 = fmul double %390, 0x400921FB54442D18
  %392 = fdiv double %391, 6.400000e+01
  %393 = call double @cos(double %392) #3
  %394 = load i32, i32* %2, align 4
  %395 = sub nsw i32 %394, 1
  %396 = sext i32 %395 to i64
  %397 = getelementptr inbounds [31 x double], [31 x double]* %10, i64 0, i64 %396
  %398 = load double, double* %397, align 8
  %399 = fmul double %393, %398
  %400 = load double*, double** %8, align 8
  %401 = getelementptr inbounds double, double* %400, i32 1
  store double* %401, double** %8, align 8
  store double %399, double* %400, align 8
  br label %402

; <label>:402:                                    ; preds = %384
  %pgocount19 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 5)
  %403 = add i64 %pgocount19, 1
  store i64 %403, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 5)
  %404 = load i32, i32* %2, align 4
  %405 = add nsw i32 %404, 1
  store i32 %405, i32* %2, align 4
  br label %381

; <label>:406:                                    ; preds = %381
  br label %407

; <label>:407:                                    ; preds = %406
  %pgocount20 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 20)
  %408 = add i64 %pgocount20, 1
  store i64 %408, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 20)
  %409 = load i32, i32* %1, align 4
  %410 = add nsw i32 %409, -1
  store i32 %410, i32* %1, align 4
  br label %377

; <label>:411:                                    ; preds = %377
  store i32 0, i32* %2, align 4
  br label %412

; <label>:412:                                    ; preds = %530, %411
  %413 = load i32, i32* %2, align 4
  %414 = icmp slt i32 %413, 4
  br i1 %414, label %415, label %534

; <label>:415:                                    ; preds = %412
  %416 = load i32, i32* %2, align 4
  %417 = sub nsw i32 17, %416
  %418 = sext i32 %417 to i64
  %419 = getelementptr inbounds [36 x double], [36 x double]* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0), i64 0, i64 %418
  %420 = load double, double* %419, align 8
  store double %420, double* %13, align 8
  %421 = load i32, i32* %2, align 4
  %422 = add nsw i32 9, %421
  %423 = sext i32 %422 to i64
  %424 = getelementptr inbounds [36 x double], [36 x double]* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0), i64 0, i64 %423
  %425 = load double, double* %424, align 8
  %426 = load i32, i32* %2, align 4
  %427 = sub nsw i32 17, %426
  %428 = sext i32 %427 to i64
  %429 = getelementptr inbounds [36 x double], [36 x double]* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0), i64 0, i64 %428
  store double %425, double* %429, align 8
  %430 = load double, double* %13, align 8
  %431 = load i32, i32* %2, align 4
  %432 = add nsw i32 9, %431
  %433 = sext i32 %432 to i64
  %434 = getelementptr inbounds [36 x double], [36 x double]* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0), i64 0, i64 %433
  store double %430, double* %434, align 8
  %435 = load i32, i32* %2, align 4
  %436 = sub nsw i32 35, %435
  %437 = sext i32 %436 to i64
  %438 = getelementptr inbounds [36 x double], [36 x double]* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0), i64 0, i64 %437
  %439 = load double, double* %438, align 8
  store double %439, double* %13, align 8
  %440 = load i32, i32* %2, align 4
  %441 = add nsw i32 27, %440
  %442 = sext i32 %441 to i64
  %443 = getelementptr inbounds [36 x double], [36 x double]* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0), i64 0, i64 %442
  %444 = load double, double* %443, align 8
  %445 = load i32, i32* %2, align 4
  %446 = sub nsw i32 35, %445
  %447 = sext i32 %446 to i64
  %448 = getelementptr inbounds [36 x double], [36 x double]* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0), i64 0, i64 %447
  store double %444, double* %448, align 8
  %449 = load double, double* %13, align 8
  %450 = load i32, i32* %2, align 4
  %451 = add nsw i32 27, %450
  %452 = sext i32 %451 to i64
  %453 = getelementptr inbounds [36 x double], [36 x double]* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0), i64 0, i64 %452
  store double %449, double* %453, align 8
  %454 = load i32, i32* %2, align 4
  %455 = sub nsw i32 17, %454
  %456 = sext i32 %455 to i64
  %457 = getelementptr inbounds [36 x double], [36 x double]* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1), i64 0, i64 %456
  %458 = load double, double* %457, align 8
  store double %458, double* %13, align 8
  %459 = load i32, i32* %2, align 4
  %460 = add nsw i32 9, %459
  %461 = sext i32 %460 to i64
  %462 = getelementptr inbounds [36 x double], [36 x double]* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1), i64 0, i64 %461
  %463 = load double, double* %462, align 8
  %464 = load i32, i32* %2, align 4
  %465 = sub nsw i32 17, %464
  %466 = sext i32 %465 to i64
  %467 = getelementptr inbounds [36 x double], [36 x double]* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1), i64 0, i64 %466
  store double %463, double* %467, align 8
  %468 = load double, double* %13, align 8
  %469 = load i32, i32* %2, align 4
  %470 = add nsw i32 9, %469
  %471 = sext i32 %470 to i64
  %472 = getelementptr inbounds [36 x double], [36 x double]* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1), i64 0, i64 %471
  store double %468, double* %472, align 8
  %473 = load i32, i32* %2, align 4
  %474 = sub nsw i32 35, %473
  %475 = sext i32 %474 to i64
  %476 = getelementptr inbounds [36 x double], [36 x double]* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1), i64 0, i64 %475
  %477 = load double, double* %476, align 8
  store double %477, double* %13, align 8
  %478 = load i32, i32* %2, align 4
  %479 = add nsw i32 27, %478
  %480 = sext i32 %479 to i64
  %481 = getelementptr inbounds [36 x double], [36 x double]* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1), i64 0, i64 %480
  %482 = load double, double* %481, align 8
  %483 = load i32, i32* %2, align 4
  %484 = sub nsw i32 35, %483
  %485 = sext i32 %484 to i64
  %486 = getelementptr inbounds [36 x double], [36 x double]* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1), i64 0, i64 %485
  store double %482, double* %486, align 8
  %487 = load double, double* %13, align 8
  %488 = load i32, i32* %2, align 4
  %489 = add nsw i32 27, %488
  %490 = sext i32 %489 to i64
  %491 = getelementptr inbounds [36 x double], [36 x double]* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1), i64 0, i64 %490
  store double %487, double* %491, align 8
  %492 = load i32, i32* %2, align 4
  %493 = sub nsw i32 17, %492
  %494 = sext i32 %493 to i64
  %495 = getelementptr inbounds [36 x double], [36 x double]* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3), i64 0, i64 %494
  %496 = load double, double* %495, align 8
  store double %496, double* %13, align 8
  %497 = load i32, i32* %2, align 4
  %498 = add nsw i32 9, %497
  %499 = sext i32 %498 to i64
  %500 = getelementptr inbounds [36 x double], [36 x double]* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3), i64 0, i64 %499
  %501 = load double, double* %500, align 8
  %502 = load i32, i32* %2, align 4
  %503 = sub nsw i32 17, %502
  %504 = sext i32 %503 to i64
  %505 = getelementptr inbounds [36 x double], [36 x double]* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3), i64 0, i64 %504
  store double %501, double* %505, align 8
  %506 = load double, double* %13, align 8
  %507 = load i32, i32* %2, align 4
  %508 = add nsw i32 9, %507
  %509 = sext i32 %508 to i64
  %510 = getelementptr inbounds [36 x double], [36 x double]* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3), i64 0, i64 %509
  store double %506, double* %510, align 8
  %511 = load i32, i32* %2, align 4
  %512 = sub nsw i32 35, %511
  %513 = sext i32 %512 to i64
  %514 = getelementptr inbounds [36 x double], [36 x double]* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3), i64 0, i64 %513
  %515 = load double, double* %514, align 8
  store double %515, double* %13, align 8
  %516 = load i32, i32* %2, align 4
  %517 = add nsw i32 27, %516
  %518 = sext i32 %517 to i64
  %519 = getelementptr inbounds [36 x double], [36 x double]* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3), i64 0, i64 %518
  %520 = load double, double* %519, align 8
  %521 = load i32, i32* %2, align 4
  %522 = sub nsw i32 35, %521
  %523 = sext i32 %522 to i64
  %524 = getelementptr inbounds [36 x double], [36 x double]* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3), i64 0, i64 %523
  store double %520, double* %524, align 8
  %525 = load double, double* %13, align 8
  %526 = load i32, i32* %2, align 4
  %527 = add nsw i32 27, %526
  %528 = sext i32 %527 to i64
  %529 = getelementptr inbounds [36 x double], [36 x double]* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3), i64 0, i64 %528
  store double %525, double* %529, align 8
  br label %530

; <label>:530:                                    ; preds = %415
  %pgocount21 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 21)
  %531 = add i64 %pgocount21, 1
  store i64 %531, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 21)
  %532 = load i32, i32* %2, align 4
  %533 = add nsw i32 %532, 1
  store i32 %533, i32* %2, align 4
  br label %412

; <label>:534:                                    ; preds = %412
  store i32 0, i32* %1, align 4
  br label %535

; <label>:535:                                    ; preds = %560, %534
  %536 = load i32, i32* %1, align 4
  %537 = icmp slt i32 %536, 36
  br i1 %537, label %538, label %564

; <label>:538:                                    ; preds = %535
  %539 = load double, double* %5, align 8
  %540 = fdiv double %539, 3.276800e+04
  %541 = load i32, i32* %1, align 4
  %542 = sext i32 %541 to i64
  %543 = getelementptr inbounds [36 x double], [36 x double]* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0), i64 0, i64 %542
  %544 = load double, double* %543, align 8
  %545 = fmul double %544, %540
  store double %545, double* %543, align 8
  %546 = load double, double* %5, align 8
  %547 = fdiv double %546, 3.276800e+04
  %548 = load i32, i32* %1, align 4
  %549 = sext i32 %548 to i64
  %550 = getelementptr inbounds [36 x double], [36 x double]* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1), i64 0, i64 %549
  %551 = load double, double* %550, align 8
  %552 = fmul double %551, %547
  store double %552, double* %550, align 8
  %553 = load double, double* %5, align 8
  %554 = fdiv double %553, 3.276800e+04
  %555 = load i32, i32* %1, align 4
  %556 = sext i32 %555 to i64
  %557 = getelementptr inbounds [36 x double], [36 x double]* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3), i64 0, i64 %556
  %558 = load double, double* %557, align 8
  %559 = fmul double %558, %554
  store double %559, double* %557, align 8
  br label %560

; <label>:560:                                    ; preds = %538
  %pgocount22 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 22)
  %561 = add i64 %pgocount22, 1
  store i64 %561, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 22)
  %562 = load i32, i32* %1, align 4
  %563 = add nsw i32 %562, 1
  store i32 %563, i32* %1, align 4
  br label %535

; <label>:564:                                    ; preds = %535
  store double 0x3FD5555555555555, double* %4, align 8
  store i32 0, i32* %1, align 4
  br label %565

; <label>:565:                                    ; preds = %637, %564
  %566 = load i32, i32* %1, align 4
  %567 = icmp slt i32 %566, 3
  br i1 %567, label %568, label %641

; <label>:568:                                    ; preds = %565
  %569 = load i32, i32* %1, align 4
  %570 = sitofp i32 %569 to double
  %571 = fadd double %570, 5.000000e-01
  %572 = fmul double 0x3FD0C152382D7365, %571
  %573 = call double @cos(double %572) #3
  %574 = load double, double* %5, align 8
  %575 = fmul double %573, %574
  %576 = fdiv double %575, 3.276800e+04
  %577 = load double, double* %4, align 8
  %578 = fmul double %576, %577
  store double %578, double* %14, align 8
  %579 = load i32, i32* %1, align 4
  %580 = sitofp i32 %579 to double
  %581 = fadd double %580, 5.000000e-01
  %582 = fmul double 0x3FD0C152382D7365, %581
  %583 = call double @tan(double %582) #3
  %584 = load i32, i32* %1, align 4
  %585 = sext i32 %584 to i64
  %586 = getelementptr inbounds [36 x double], [36 x double]* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2), i64 0, i64 %585
  store double %583, double* %586, align 8
  store i32 0, i32* %3, align 4
  br label %587

; <label>:587:                                    ; preds = %632, %568
  %588 = load i32, i32* %3, align 4
  %589 = icmp slt i32 %588, 6
  br i1 %589, label %590, label %636

; <label>:590:                                    ; preds = %587
  %591 = load double, double* %14, align 8
  %592 = load i32, i32* %3, align 4
  %593 = mul nsw i32 2, %592
  %594 = add nsw i32 %593, 1
  %595 = sitofp i32 %594 to double
  %596 = fmul double 0x3FB0C152382D7365, %595
  %597 = load i32, i32* %1, align 4
  %598 = mul nsw i32 4, %597
  %599 = add nsw i32 %598, 2
  %600 = add nsw i32 %599, 12
  %601 = sitofp i32 %600 to double
  %602 = fmul double %596, %601
  %603 = call double @cos(double %602) #3
  %604 = fmul double %591, %603
  %605 = load i32, i32* %3, align 4
  %606 = sext i32 %605 to i64
  %607 = getelementptr inbounds [6 x [6 x double]], [6 x [6 x double]]* @cos_s, i64 0, i64 %606
  %608 = load i32, i32* %1, align 4
  %609 = sext i32 %608 to i64
  %610 = getelementptr inbounds [6 x double], [6 x double]* %607, i64 0, i64 %609
  store double %604, double* %610, align 8
  %611 = load double, double* %14, align 8
  %612 = load i32, i32* %3, align 4
  %613 = mul nsw i32 2, %612
  %614 = add nsw i32 %613, 1
  %615 = sitofp i32 %614 to double
  %616 = fmul double 0x3FB0C152382D7365, %615
  %617 = load i32, i32* %1, align 4
  %618 = mul nsw i32 4, %617
  %619 = add nsw i32 %618, 2
  %620 = add nsw i32 %619, 36
  %621 = sitofp i32 %620 to double
  %622 = fmul double %616, %621
  %623 = call double @cos(double %622) #3
  %624 = fmul double %611, %623
  %625 = load i32, i32* %3, align 4
  %626 = sext i32 %625 to i64
  %627 = getelementptr inbounds [6 x [6 x double]], [6 x [6 x double]]* @cos_s, i64 0, i64 %626
  %628 = load i32, i32* %1, align 4
  %629 = add nsw i32 %628, 3
  %630 = sext i32 %629 to i64
  %631 = getelementptr inbounds [6 x double], [6 x double]* %627, i64 0, i64 %630
  store double %624, double* %631, align 8
  br label %632

; <label>:632:                                    ; preds = %590
  %pgocount23 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 6)
  %633 = add i64 %pgocount23, 1
  store i64 %633, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 6)
  %634 = load i32, i32* %3, align 4
  %635 = add nsw i32 %634, 1
  store i32 %635, i32* %3, align 4
  br label %587

; <label>:636:                                    ; preds = %587
  br label %637

; <label>:637:                                    ; preds = %636
  %pgocount24 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 23)
  %638 = add i64 %pgocount24, 1
  store i64 %638, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_mdct_init48, i64 0, i64 23)
  %639 = load i32, i32* %1, align 4
  %640 = add nsw i32 %639, 1
  store i32 %640, i32* %1, align 4
  br label %565

; <label>:641:                                    ; preds = %565
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @window_subband(i16*, double*, double*) #0 {
  %4 = alloca i16*, align 8
  %5 = alloca double*, align 8
  %6 = alloca double*, align 8
  %7 = alloca i32, align 4
  %8 = alloca double, align 8
  %9 = alloca double, align 8
  %10 = alloca double*, align 8
  %11 = alloca i16*, align 8
  %12 = alloca i16*, align 8
  %13 = alloca double, align 8
  %14 = alloca i32, align 4
  %15 = alloca double, align 8
  %16 = alloca double, align 8
  store i16* %0, i16** %4, align 8
  store double* %1, double** %5, align 8
  store double* %2, double** %6, align 8
  store double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i32 0, i32 0), double** %10, align 8
  %17 = load i16*, i16** %4, align 8
  %18 = getelementptr inbounds i16, i16* %17, i64 255
  %19 = load i16, i16* %18, align 2
  %20 = sitofp i16 %19 to double
  store double %20, double* %9, align 8
  %21 = load i16*, i16** %4, align 8
  %22 = getelementptr inbounds i16, i16* %21, i64 223
  %23 = load i16, i16* %22, align 2
  %24 = sext i16 %23 to i32
  %25 = load i16*, i16** %4, align 8
  %26 = getelementptr inbounds i16, i16* %25, i64 287
  %27 = load i16, i16* %26, align 2
  %28 = sext i16 %27 to i32
  %29 = sub nsw i32 %24, %28
  %30 = sitofp i32 %29 to double
  %31 = load double*, double** %10, align 8
  %32 = getelementptr inbounds double, double* %31, i32 1
  store double* %32, double** %10, align 8
  %33 = load double, double* %31, align 8
  %34 = fmul double %30, %33
  %35 = load double, double* %9, align 8
  %36 = fadd double %35, %34
  store double %36, double* %9, align 8
  %37 = load i16*, i16** %4, align 8
  %38 = getelementptr inbounds i16, i16* %37, i64 191
  %39 = load i16, i16* %38, align 2
  %40 = sext i16 %39 to i32
  %41 = load i16*, i16** %4, align 8
  %42 = getelementptr inbounds i16, i16* %41, i64 319
  %43 = load i16, i16* %42, align 2
  %44 = sext i16 %43 to i32
  %45 = add nsw i32 %40, %44
  %46 = sitofp i32 %45 to double
  %47 = load double*, double** %10, align 8
  %48 = getelementptr inbounds double, double* %47, i32 1
  store double* %48, double** %10, align 8
  %49 = load double, double* %47, align 8
  %50 = fmul double %46, %49
  %51 = load double, double* %9, align 8
  %52 = fadd double %51, %50
  store double %52, double* %9, align 8
  %53 = load i16*, i16** %4, align 8
  %54 = getelementptr inbounds i16, i16* %53, i64 159
  %55 = load i16, i16* %54, align 2
  %56 = sext i16 %55 to i32
  %57 = load i16*, i16** %4, align 8
  %58 = getelementptr inbounds i16, i16* %57, i64 351
  %59 = load i16, i16* %58, align 2
  %60 = sext i16 %59 to i32
  %61 = sub nsw i32 %56, %60
  %62 = sitofp i32 %61 to double
  %63 = load double*, double** %10, align 8
  %64 = getelementptr inbounds double, double* %63, i32 1
  store double* %64, double** %10, align 8
  %65 = load double, double* %63, align 8
  %66 = fmul double %62, %65
  %67 = load double, double* %9, align 8
  %68 = fadd double %67, %66
  store double %68, double* %9, align 8
  %69 = load i16*, i16** %4, align 8
  %70 = getelementptr inbounds i16, i16* %69, i64 127
  %71 = load i16, i16* %70, align 2
  %72 = sext i16 %71 to i32
  %73 = load i16*, i16** %4, align 8
  %74 = getelementptr inbounds i16, i16* %73, i64 383
  %75 = load i16, i16* %74, align 2
  %76 = sext i16 %75 to i32
  %77 = add nsw i32 %72, %76
  %78 = sitofp i32 %77 to double
  %79 = load double*, double** %10, align 8
  %80 = getelementptr inbounds double, double* %79, i32 1
  store double* %80, double** %10, align 8
  %81 = load double, double* %79, align 8
  %82 = fmul double %78, %81
  %83 = load double, double* %9, align 8
  %84 = fadd double %83, %82
  store double %84, double* %9, align 8
  %85 = load i16*, i16** %4, align 8
  %86 = getelementptr inbounds i16, i16* %85, i64 95
  %87 = load i16, i16* %86, align 2
  %88 = sext i16 %87 to i32
  %89 = load i16*, i16** %4, align 8
  %90 = getelementptr inbounds i16, i16* %89, i64 415
  %91 = load i16, i16* %90, align 2
  %92 = sext i16 %91 to i32
  %93 = sub nsw i32 %88, %92
  %94 = sitofp i32 %93 to double
  %95 = load double*, double** %10, align 8
  %96 = getelementptr inbounds double, double* %95, i32 1
  store double* %96, double** %10, align 8
  %97 = load double, double* %95, align 8
  %98 = fmul double %94, %97
  %99 = load double, double* %9, align 8
  %100 = fadd double %99, %98
  store double %100, double* %9, align 8
  %101 = load i16*, i16** %4, align 8
  %102 = getelementptr inbounds i16, i16* %101, i64 63
  %103 = load i16, i16* %102, align 2
  %104 = sext i16 %103 to i32
  %105 = load i16*, i16** %4, align 8
  %106 = getelementptr inbounds i16, i16* %105, i64 447
  %107 = load i16, i16* %106, align 2
  %108 = sext i16 %107 to i32
  %109 = add nsw i32 %104, %108
  %110 = sitofp i32 %109 to double
  %111 = load double*, double** %10, align 8
  %112 = getelementptr inbounds double, double* %111, i32 1
  store double* %112, double** %10, align 8
  %113 = load double, double* %111, align 8
  %114 = fmul double %110, %113
  %115 = load double, double* %9, align 8
  %116 = fadd double %115, %114
  store double %116, double* %9, align 8
  %117 = load i16*, i16** %4, align 8
  %118 = getelementptr inbounds i16, i16* %117, i64 31
  %119 = load i16, i16* %118, align 2
  %120 = sext i16 %119 to i32
  %121 = load i16*, i16** %4, align 8
  %122 = getelementptr inbounds i16, i16* %121, i64 479
  %123 = load i16, i16* %122, align 2
  %124 = sext i16 %123 to i32
  %125 = sub nsw i32 %120, %124
  %126 = sitofp i32 %125 to double
  %127 = load double*, double** %10, align 8
  %128 = getelementptr inbounds double, double* %127, i32 1
  store double* %128, double** %10, align 8
  %129 = load double, double* %127, align 8
  %130 = fmul double %126, %129
  %131 = load double, double* %9, align 8
  %132 = fadd double %131, %130
  store double %132, double* %9, align 8
  %133 = load double, double* %9, align 8
  %134 = load double*, double** %6, align 8
  %135 = getelementptr inbounds double, double* %134, i64 15
  store double %133, double* %135, align 8
  store i32 14, i32* %7, align 4
  br label %136

; <label>:136:                                    ; preds = %483, %3
  %137 = load i32, i32* %7, align 4
  %138 = icmp sge i32 %137, 0
  br i1 %138, label %139, label %487

; <label>:139:                                    ; preds = %136
  %140 = load i16*, i16** %4, align 8
  %141 = load i32, i32* %7, align 4
  %142 = sext i32 %141 to i64
  %143 = getelementptr inbounds i16, i16* %140, i64 %142
  store i16* %143, i16** %11, align 8
  %144 = load i16*, i16** %4, align 8
  %145 = load i32, i32* %7, align 4
  %146 = sub nsw i32 0, %145
  %147 = sext i32 %146 to i64
  %148 = getelementptr inbounds i16, i16* %144, i64 %147
  store i16* %148, i16** %12, align 8
  %149 = load i16*, i16** %12, align 8
  %150 = getelementptr inbounds i16, i16* %149, i64 270
  %151 = load i16, i16* %150, align 2
  %152 = sitofp i16 %151 to double
  store double %152, double* %8, align 8
  %153 = load i16*, i16** %11, align 8
  %154 = getelementptr inbounds i16, i16* %153, i64 240
  %155 = load i16, i16* %154, align 2
  %156 = sitofp i16 %155 to double
  store double %156, double* %9, align 8
  %157 = load double*, double** %10, align 8
  %158 = getelementptr inbounds double, double* %157, i32 1
  store double* %158, double** %10, align 8
  %159 = load double, double* %157, align 8
  store double %159, double* %13, align 8
  %160 = load i16*, i16** %12, align 8
  %161 = getelementptr inbounds i16, i16* %160, i64 334
  %162 = load i16, i16* %161, align 2
  %163 = sext i16 %162 to i32
  %164 = sitofp i32 %163 to double
  %165 = load double, double* %13, align 8
  %166 = fmul double %164, %165
  %167 = load double, double* %8, align 8
  %168 = fadd double %167, %166
  store double %168, double* %8, align 8
  %169 = load i16*, i16** %11, align 8
  %170 = getelementptr inbounds i16, i16* %169, i64 176
  %171 = load i16, i16* %170, align 2
  %172 = sext i16 %171 to i32
  %173 = sitofp i32 %172 to double
  %174 = load double, double* %13, align 8
  %175 = fmul double %173, %174
  %176 = load double, double* %9, align 8
  %177 = fadd double %176, %175
  store double %177, double* %9, align 8
  %178 = load double*, double** %10, align 8
  %179 = getelementptr inbounds double, double* %178, i32 1
  store double* %179, double** %10, align 8
  %180 = load double, double* %178, align 8
  store double %180, double* %13, align 8
  %181 = load i16*, i16** %12, align 8
  %182 = getelementptr inbounds i16, i16* %181, i64 398
  %183 = load i16, i16* %182, align 2
  %184 = sext i16 %183 to i32
  %185 = sitofp i32 %184 to double
  %186 = load double, double* %13, align 8
  %187 = fmul double %185, %186
  %188 = load double, double* %8, align 8
  %189 = fadd double %188, %187
  store double %189, double* %8, align 8
  %190 = load i16*, i16** %11, align 8
  %191 = getelementptr inbounds i16, i16* %190, i64 112
  %192 = load i16, i16* %191, align 2
  %193 = sext i16 %192 to i32
  %194 = sitofp i32 %193 to double
  %195 = load double, double* %13, align 8
  %196 = fmul double %194, %195
  %197 = load double, double* %9, align 8
  %198 = fadd double %197, %196
  store double %198, double* %9, align 8
  %199 = load double*, double** %10, align 8
  %200 = getelementptr inbounds double, double* %199, i32 1
  store double* %200, double** %10, align 8
  %201 = load double, double* %199, align 8
  store double %201, double* %13, align 8
  %202 = load i16*, i16** %12, align 8
  %203 = getelementptr inbounds i16, i16* %202, i64 462
  %204 = load i16, i16* %203, align 2
  %205 = sext i16 %204 to i32
  %206 = sitofp i32 %205 to double
  %207 = load double, double* %13, align 8
  %208 = fmul double %206, %207
  %209 = load double, double* %8, align 8
  %210 = fadd double %209, %208
  store double %210, double* %8, align 8
  %211 = load i16*, i16** %11, align 8
  %212 = getelementptr inbounds i16, i16* %211, i64 48
  %213 = load i16, i16* %212, align 2
  %214 = sext i16 %213 to i32
  %215 = sitofp i32 %214 to double
  %216 = load double, double* %13, align 8
  %217 = fmul double %215, %216
  %218 = load double, double* %9, align 8
  %219 = fadd double %218, %217
  store double %219, double* %9, align 8
  %220 = load double*, double** %10, align 8
  %221 = getelementptr inbounds double, double* %220, i32 1
  store double* %221, double** %10, align 8
  %222 = load double, double* %220, align 8
  store double %222, double* %13, align 8
  %223 = load i16*, i16** %12, align 8
  %224 = getelementptr inbounds i16, i16* %223, i64 14
  %225 = load i16, i16* %224, align 2
  %226 = sext i16 %225 to i32
  %227 = sitofp i32 %226 to double
  %228 = load double, double* %13, align 8
  %229 = fmul double %227, %228
  %230 = load double, double* %8, align 8
  %231 = fadd double %230, %229
  store double %231, double* %8, align 8
  %232 = load i16*, i16** %11, align 8
  %233 = getelementptr inbounds i16, i16* %232, i64 496
  %234 = load i16, i16* %233, align 2
  %235 = sext i16 %234 to i32
  %236 = sitofp i32 %235 to double
  %237 = load double, double* %13, align 8
  %238 = fmul double %236, %237
  %239 = load double, double* %9, align 8
  %240 = fadd double %239, %238
  store double %240, double* %9, align 8
  %241 = load double*, double** %10, align 8
  %242 = getelementptr inbounds double, double* %241, i32 1
  store double* %242, double** %10, align 8
  %243 = load double, double* %241, align 8
  store double %243, double* %13, align 8
  %244 = load i16*, i16** %12, align 8
  %245 = getelementptr inbounds i16, i16* %244, i64 78
  %246 = load i16, i16* %245, align 2
  %247 = sext i16 %246 to i32
  %248 = sitofp i32 %247 to double
  %249 = load double, double* %13, align 8
  %250 = fmul double %248, %249
  %251 = load double, double* %8, align 8
  %252 = fadd double %251, %250
  store double %252, double* %8, align 8
  %253 = load i16*, i16** %11, align 8
  %254 = getelementptr inbounds i16, i16* %253, i64 432
  %255 = load i16, i16* %254, align 2
  %256 = sext i16 %255 to i32
  %257 = sitofp i32 %256 to double
  %258 = load double, double* %13, align 8
  %259 = fmul double %257, %258
  %260 = load double, double* %9, align 8
  %261 = fadd double %260, %259
  store double %261, double* %9, align 8
  %262 = load double*, double** %10, align 8
  %263 = getelementptr inbounds double, double* %262, i32 1
  store double* %263, double** %10, align 8
  %264 = load double, double* %262, align 8
  store double %264, double* %13, align 8
  %265 = load i16*, i16** %12, align 8
  %266 = getelementptr inbounds i16, i16* %265, i64 142
  %267 = load i16, i16* %266, align 2
  %268 = sext i16 %267 to i32
  %269 = sitofp i32 %268 to double
  %270 = load double, double* %13, align 8
  %271 = fmul double %269, %270
  %272 = load double, double* %8, align 8
  %273 = fadd double %272, %271
  store double %273, double* %8, align 8
  %274 = load i16*, i16** %11, align 8
  %275 = getelementptr inbounds i16, i16* %274, i64 368
  %276 = load i16, i16* %275, align 2
  %277 = sext i16 %276 to i32
  %278 = sitofp i32 %277 to double
  %279 = load double, double* %13, align 8
  %280 = fmul double %278, %279
  %281 = load double, double* %9, align 8
  %282 = fadd double %281, %280
  store double %282, double* %9, align 8
  %283 = load double*, double** %10, align 8
  %284 = getelementptr inbounds double, double* %283, i32 1
  store double* %284, double** %10, align 8
  %285 = load double, double* %283, align 8
  store double %285, double* %13, align 8
  %286 = load i16*, i16** %12, align 8
  %287 = getelementptr inbounds i16, i16* %286, i64 206
  %288 = load i16, i16* %287, align 2
  %289 = sext i16 %288 to i32
  %290 = sitofp i32 %289 to double
  %291 = load double, double* %13, align 8
  %292 = fmul double %290, %291
  %293 = load double, double* %8, align 8
  %294 = fadd double %293, %292
  store double %294, double* %8, align 8
  %295 = load i16*, i16** %11, align 8
  %296 = getelementptr inbounds i16, i16* %295, i64 304
  %297 = load i16, i16* %296, align 2
  %298 = sext i16 %297 to i32
  %299 = sitofp i32 %298 to double
  %300 = load double, double* %13, align 8
  %301 = fmul double %299, %300
  %302 = load double, double* %9, align 8
  %303 = fadd double %302, %301
  store double %303, double* %9, align 8
  %304 = load double*, double** %10, align 8
  %305 = getelementptr inbounds double, double* %304, i32 1
  store double* %305, double** %10, align 8
  %306 = load double, double* %304, align 8
  store double %306, double* %13, align 8
  %307 = load i16*, i16** %11, align 8
  %308 = getelementptr inbounds i16, i16* %307, i64 16
  %309 = load i16, i16* %308, align 2
  %310 = sext i16 %309 to i32
  %311 = sitofp i32 %310 to double
  %312 = load double, double* %13, align 8
  %313 = fmul double %311, %312
  %314 = load double, double* %8, align 8
  %315 = fadd double %314, %313
  store double %315, double* %8, align 8
  %316 = load i16*, i16** %12, align 8
  %317 = getelementptr inbounds i16, i16* %316, i64 494
  %318 = load i16, i16* %317, align 2
  %319 = sext i16 %318 to i32
  %320 = sitofp i32 %319 to double
  %321 = load double, double* %13, align 8
  %322 = fmul double %320, %321
  %323 = load double, double* %9, align 8
  %324 = fsub double %323, %322
  store double %324, double* %9, align 8
  %325 = load double*, double** %10, align 8
  %326 = getelementptr inbounds double, double* %325, i32 1
  store double* %326, double** %10, align 8
  %327 = load double, double* %325, align 8
  store double %327, double* %13, align 8
  %328 = load i16*, i16** %11, align 8
  %329 = getelementptr inbounds i16, i16* %328, i64 80
  %330 = load i16, i16* %329, align 2
  %331 = sext i16 %330 to i32
  %332 = sitofp i32 %331 to double
  %333 = load double, double* %13, align 8
  %334 = fmul double %332, %333
  %335 = load double, double* %8, align 8
  %336 = fadd double %335, %334
  store double %336, double* %8, align 8
  %337 = load i16*, i16** %12, align 8
  %338 = getelementptr inbounds i16, i16* %337, i64 430
  %339 = load i16, i16* %338, align 2
  %340 = sext i16 %339 to i32
  %341 = sitofp i32 %340 to double
  %342 = load double, double* %13, align 8
  %343 = fmul double %341, %342
  %344 = load double, double* %9, align 8
  %345 = fsub double %344, %343
  store double %345, double* %9, align 8
  %346 = load double*, double** %10, align 8
  %347 = getelementptr inbounds double, double* %346, i32 1
  store double* %347, double** %10, align 8
  %348 = load double, double* %346, align 8
  store double %348, double* %13, align 8
  %349 = load i16*, i16** %11, align 8
  %350 = getelementptr inbounds i16, i16* %349, i64 144
  %351 = load i16, i16* %350, align 2
  %352 = sext i16 %351 to i32
  %353 = sitofp i32 %352 to double
  %354 = load double, double* %13, align 8
  %355 = fmul double %353, %354
  %356 = load double, double* %8, align 8
  %357 = fadd double %356, %355
  store double %357, double* %8, align 8
  %358 = load i16*, i16** %12, align 8
  %359 = getelementptr inbounds i16, i16* %358, i64 366
  %360 = load i16, i16* %359, align 2
  %361 = sext i16 %360 to i32
  %362 = sitofp i32 %361 to double
  %363 = load double, double* %13, align 8
  %364 = fmul double %362, %363
  %365 = load double, double* %9, align 8
  %366 = fsub double %365, %364
  store double %366, double* %9, align 8
  %367 = load double*, double** %10, align 8
  %368 = getelementptr inbounds double, double* %367, i32 1
  store double* %368, double** %10, align 8
  %369 = load double, double* %367, align 8
  store double %369, double* %13, align 8
  %370 = load i16*, i16** %11, align 8
  %371 = getelementptr inbounds i16, i16* %370, i64 208
  %372 = load i16, i16* %371, align 2
  %373 = sext i16 %372 to i32
  %374 = sitofp i32 %373 to double
  %375 = load double, double* %13, align 8
  %376 = fmul double %374, %375
  %377 = load double, double* %8, align 8
  %378 = fadd double %377, %376
  store double %378, double* %8, align 8
  %379 = load i16*, i16** %12, align 8
  %380 = getelementptr inbounds i16, i16* %379, i64 302
  %381 = load i16, i16* %380, align 2
  %382 = sext i16 %381 to i32
  %383 = sitofp i32 %382 to double
  %384 = load double, double* %13, align 8
  %385 = fmul double %383, %384
  %386 = load double, double* %9, align 8
  %387 = fsub double %386, %385
  store double %387, double* %9, align 8
  %388 = load double*, double** %10, align 8
  %389 = getelementptr inbounds double, double* %388, i32 1
  store double* %389, double** %10, align 8
  %390 = load double, double* %388, align 8
  store double %390, double* %13, align 8
  %391 = load i16*, i16** %11, align 8
  %392 = getelementptr inbounds i16, i16* %391, i64 272
  %393 = load i16, i16* %392, align 2
  %394 = sext i16 %393 to i32
  %395 = sitofp i32 %394 to double
  %396 = load double, double* %13, align 8
  %397 = fmul double %395, %396
  %398 = load double, double* %8, align 8
  %399 = fsub double %398, %397
  store double %399, double* %8, align 8
  %400 = load i16*, i16** %12, align 8
  %401 = getelementptr inbounds i16, i16* %400, i64 238
  %402 = load i16, i16* %401, align 2
  %403 = sext i16 %402 to i32
  %404 = sitofp i32 %403 to double
  %405 = load double, double* %13, align 8
  %406 = fmul double %404, %405
  %407 = load double, double* %9, align 8
  %408 = fadd double %407, %406
  store double %408, double* %9, align 8
  %409 = load double*, double** %10, align 8
  %410 = getelementptr inbounds double, double* %409, i32 1
  store double* %410, double** %10, align 8
  %411 = load double, double* %409, align 8
  store double %411, double* %13, align 8
  %412 = load i16*, i16** %11, align 8
  %413 = getelementptr inbounds i16, i16* %412, i64 336
  %414 = load i16, i16* %413, align 2
  %415 = sext i16 %414 to i32
  %416 = sitofp i32 %415 to double
  %417 = load double, double* %13, align 8
  %418 = fmul double %416, %417
  %419 = load double, double* %8, align 8
  %420 = fsub double %419, %418
  store double %420, double* %8, align 8
  %421 = load i16*, i16** %12, align 8
  %422 = getelementptr inbounds i16, i16* %421, i64 174
  %423 = load i16, i16* %422, align 2
  %424 = sext i16 %423 to i32
  %425 = sitofp i32 %424 to double
  %426 = load double, double* %13, align 8
  %427 = fmul double %425, %426
  %428 = load double, double* %9, align 8
  %429 = fadd double %428, %427
  store double %429, double* %9, align 8
  %430 = load double*, double** %10, align 8
  %431 = getelementptr inbounds double, double* %430, i32 1
  store double* %431, double** %10, align 8
  %432 = load double, double* %430, align 8
  store double %432, double* %13, align 8
  %433 = load i16*, i16** %11, align 8
  %434 = getelementptr inbounds i16, i16* %433, i64 400
  %435 = load i16, i16* %434, align 2
  %436 = sext i16 %435 to i32
  %437 = sitofp i32 %436 to double
  %438 = load double, double* %13, align 8
  %439 = fmul double %437, %438
  %440 = load double, double* %8, align 8
  %441 = fsub double %440, %439
  store double %441, double* %8, align 8
  %442 = load i16*, i16** %12, align 8
  %443 = getelementptr inbounds i16, i16* %442, i64 110
  %444 = load i16, i16* %443, align 2
  %445 = sext i16 %444 to i32
  %446 = sitofp i32 %445 to double
  %447 = load double, double* %13, align 8
  %448 = fmul double %446, %447
  %449 = load double, double* %9, align 8
  %450 = fadd double %449, %448
  store double %450, double* %9, align 8
  %451 = load double*, double** %10, align 8
  %452 = getelementptr inbounds double, double* %451, i32 1
  store double* %452, double** %10, align 8
  %453 = load double, double* %451, align 8
  store double %453, double* %13, align 8
  %454 = load i16*, i16** %11, align 8
  %455 = getelementptr inbounds i16, i16* %454, i64 464
  %456 = load i16, i16* %455, align 2
  %457 = sext i16 %456 to i32
  %458 = sitofp i32 %457 to double
  %459 = load double, double* %13, align 8
  %460 = fmul double %458, %459
  %461 = load double, double* %8, align 8
  %462 = fsub double %461, %460
  store double %462, double* %8, align 8
  %463 = load i16*, i16** %12, align 8
  %464 = getelementptr inbounds i16, i16* %463, i64 46
  %465 = load i16, i16* %464, align 2
  %466 = sext i16 %465 to i32
  %467 = sitofp i32 %466 to double
  %468 = load double, double* %13, align 8
  %469 = fmul double %467, %468
  %470 = load double, double* %9, align 8
  %471 = fadd double %470, %469
  store double %471, double* %9, align 8
  %472 = load double, double* %8, align 8
  %473 = load double*, double** %6, align 8
  %474 = load i32, i32* %7, align 4
  %475 = sub nsw i32 30, %474
  %476 = sext i32 %475 to i64
  %477 = getelementptr inbounds double, double* %473, i64 %476
  store double %472, double* %477, align 8
  %478 = load double, double* %9, align 8
  %479 = load double*, double** %6, align 8
  %480 = load i32, i32* %7, align 4
  %481 = sext i32 %480 to i64
  %482 = getelementptr inbounds double, double* %479, i64 %481
  store double %478, double* %482, align 8
  br label %483

; <label>:483:                                    ; preds = %139
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_window_subband, i64 0, i64 1)
  %484 = add i64 %pgocount, 1
  store i64 %484, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_window_subband, i64 0, i64 1)
  %485 = load i32, i32* %7, align 4
  %486 = add nsw i32 %485, -1
  store i32 %486, i32* %7, align 4
  br label %136

; <label>:487:                                    ; preds = %136
  %488 = load i16*, i16** %4, align 8
  %489 = getelementptr inbounds i16, i16* %488, i64 239
  %490 = load i16, i16* %489, align 2
  %491 = sitofp i16 %490 to double
  store double %491, double* %8, align 8
  %492 = load i16*, i16** %4, align 8
  %493 = getelementptr inbounds i16, i16* %492, i64 175
  %494 = load i16, i16* %493, align 2
  %495 = sext i16 %494 to i32
  %496 = sitofp i32 %495 to double
  %497 = load double*, double** %10, align 8
  %498 = getelementptr inbounds double, double* %497, i32 1
  store double* %498, double** %10, align 8
  %499 = load double, double* %497, align 8
  %500 = fmul double %496, %499
  %501 = load double, double* %8, align 8
  %502 = fadd double %501, %500
  store double %502, double* %8, align 8
  %503 = load i16*, i16** %4, align 8
  %504 = getelementptr inbounds i16, i16* %503, i64 111
  %505 = load i16, i16* %504, align 2
  %506 = sext i16 %505 to i32
  %507 = sitofp i32 %506 to double
  %508 = load double*, double** %10, align 8
  %509 = getelementptr inbounds double, double* %508, i32 1
  store double* %509, double** %10, align 8
  %510 = load double, double* %508, align 8
  %511 = fmul double %507, %510
  %512 = load double, double* %8, align 8
  %513 = fadd double %512, %511
  store double %513, double* %8, align 8
  %514 = load i16*, i16** %4, align 8
  %515 = getelementptr inbounds i16, i16* %514, i64 47
  %516 = load i16, i16* %515, align 2
  %517 = sext i16 %516 to i32
  %518 = sitofp i32 %517 to double
  %519 = load double*, double** %10, align 8
  %520 = getelementptr inbounds double, double* %519, i32 1
  store double* %520, double** %10, align 8
  %521 = load double, double* %519, align 8
  %522 = fmul double %518, %521
  %523 = load double, double* %8, align 8
  %524 = fadd double %523, %522
  store double %524, double* %8, align 8
  %525 = load i16*, i16** %4, align 8
  %526 = getelementptr inbounds i16, i16* %525, i64 303
  %527 = load i16, i16* %526, align 2
  %528 = sext i16 %527 to i32
  %529 = sitofp i32 %528 to double
  %530 = load double*, double** %10, align 8
  %531 = getelementptr inbounds double, double* %530, i32 1
  store double* %531, double** %10, align 8
  %532 = load double, double* %530, align 8
  %533 = fmul double %529, %532
  %534 = load double, double* %8, align 8
  %535 = fsub double %534, %533
  store double %535, double* %8, align 8
  %536 = load i16*, i16** %4, align 8
  %537 = getelementptr inbounds i16, i16* %536, i64 367
  %538 = load i16, i16* %537, align 2
  %539 = sext i16 %538 to i32
  %540 = sitofp i32 %539 to double
  %541 = load double*, double** %10, align 8
  %542 = getelementptr inbounds double, double* %541, i32 1
  store double* %542, double** %10, align 8
  %543 = load double, double* %541, align 8
  %544 = fmul double %540, %543
  %545 = load double, double* %8, align 8
  %546 = fsub double %545, %544
  store double %546, double* %8, align 8
  %547 = load i16*, i16** %4, align 8
  %548 = getelementptr inbounds i16, i16* %547, i64 431
  %549 = load i16, i16* %548, align 2
  %550 = sext i16 %549 to i32
  %551 = sitofp i32 %550 to double
  %552 = load double*, double** %10, align 8
  %553 = getelementptr inbounds double, double* %552, i32 1
  store double* %553, double** %10, align 8
  %554 = load double, double* %552, align 8
  %555 = fmul double %551, %554
  %556 = load double, double* %8, align 8
  %557 = fsub double %556, %555
  store double %557, double* %8, align 8
  %558 = load i16*, i16** %4, align 8
  %559 = getelementptr inbounds i16, i16* %558, i64 495
  %560 = load i16, i16* %559, align 2
  %561 = sext i16 %560 to i32
  %562 = sitofp i32 %561 to double
  %563 = load double*, double** %10, align 8
  %564 = getelementptr inbounds double, double* %563, i32 1
  store double* %564, double** %10, align 8
  %565 = load double, double* %563, align 8
  %566 = fmul double %562, %565
  %567 = load double, double* %8, align 8
  %568 = fsub double %567, %566
  store double %568, double* %8, align 8
  %569 = load double*, double** %6, align 8
  %570 = getelementptr inbounds double, double* %569, i32 1
  store double* %570, double** %6, align 8
  store double* getelementptr inbounds ([16 x [31 x double]], [16 x [31 x double]]* @mm, i64 0, i64 0, i64 0), double** %10, align 8
  store i32 15, i32* %7, align 4
  br label %571

; <label>:571:                                    ; preds = %625, %487
  %572 = load i32, i32* %7, align 4
  %573 = icmp sge i32 %572, 0
  br i1 %573, label %574, label %629

; <label>:574:                                    ; preds = %571
  %575 = load double, double* %8, align 8
  store double %575, double* %15, align 8
  %576 = load double, double* %9, align 8
  %577 = load double*, double** %10, align 8
  %578 = getelementptr inbounds double, double* %577, i32 1
  store double* %578, double** %10, align 8
  %579 = load double, double* %577, align 8
  %580 = fmul double %576, %579
  store double %580, double* %16, align 8
  store i32 14, i32* %14, align 4
  br label %581

; <label>:581:                                    ; preds = %603, %574
  %582 = load i32, i32* %14, align 4
  %583 = icmp sge i32 %582, 0
  br i1 %583, label %584, label %607

; <label>:584:                                    ; preds = %581
  %585 = load double*, double** %10, align 8
  %586 = getelementptr inbounds double, double* %585, i32 1
  store double* %586, double** %10, align 8
  %587 = load double, double* %585, align 8
  %588 = load double*, double** %6, align 8
  %589 = getelementptr inbounds double, double* %588, i32 1
  store double* %589, double** %6, align 8
  %590 = load double, double* %588, align 8
  %591 = fmul double %587, %590
  %592 = load double, double* %15, align 8
  %593 = fadd double %592, %591
  store double %593, double* %15, align 8
  %594 = load double*, double** %10, align 8
  %595 = getelementptr inbounds double, double* %594, i32 1
  store double* %595, double** %10, align 8
  %596 = load double, double* %594, align 8
  %597 = load double*, double** %6, align 8
  %598 = getelementptr inbounds double, double* %597, i32 1
  store double* %598, double** %6, align 8
  %599 = load double, double* %597, align 8
  %600 = fmul double %596, %599
  %601 = load double, double* %16, align 8
  %602 = fadd double %601, %600
  store double %602, double* %16, align 8
  br label %603

; <label>:603:                                    ; preds = %584
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_window_subband, i64 0, i64 0)
  %604 = add i64 %pgocount1, 1
  store i64 %604, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_window_subband, i64 0, i64 0)
  %605 = load i32, i32* %14, align 4
  %606 = add nsw i32 %605, -1
  store i32 %606, i32* %14, align 4
  br label %581

; <label>:607:                                    ; preds = %581
  %608 = load double*, double** %6, align 8
  %609 = getelementptr inbounds double, double* %608, i64 -30
  store double* %609, double** %6, align 8
  %610 = load double, double* %15, align 8
  %611 = load double, double* %16, align 8
  %612 = fadd double %610, %611
  %613 = load double*, double** %5, align 8
  %614 = load i32, i32* %7, align 4
  %615 = sext i32 %614 to i64
  %616 = getelementptr inbounds double, double* %613, i64 %615
  store double %612, double* %616, align 8
  %617 = load double, double* %15, align 8
  %618 = load double, double* %16, align 8
  %619 = fsub double %617, %618
  %620 = load double*, double** %5, align 8
  %621 = load i32, i32* %7, align 4
  %622 = sub nsw i32 31, %621
  %623 = sext i32 %622 to i64
  %624 = getelementptr inbounds double, double* %620, i64 %623
  store double %619, double* %624, align 8
  br label %625

; <label>:625:                                    ; preds = %607
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_window_subband, i64 0, i64 2)
  %626 = add i64 %pgocount2, 1
  store i64 %626, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_window_subband, i64 0, i64 2)
  %627 = load i32, i32* %7, align 4
  %628 = add nsw i32 %627, -1
  store i32 %628, i32* %7, align 4
  br label %571

; <label>:629:                                    ; preds = %571
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_window_subband, i64 0, i64 3)
  %630 = add i64 %pgocount3, 1
  store i64 %630, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_tmp1.ll_window_subband, i64 0, i64 3)
  ret void
}

; Function Attrs: nounwind
declare double @cos(double) #1

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #2

; Function Attrs: nounwind uwtable
define internal void @mdct_short(double*, double*) #0 {
  %3 = alloca double*, align 8
  %4 = alloca double*, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca double, align 8
  %8 = alloca double, align 8
  %9 = alloca double, align 8
  %10 = alloca double, align 8
  %11 = alloca double, align 8
  %12 = alloca double, align 8
  store double* %0, double** %3, align 8
  store double* %1, double** %4, align 8
  store i32 5, i32* %5, align 4
  br label %13

; <label>:13:                                     ; preds = %121, %2
  %14 = load i32, i32* %5, align 4
  %15 = icmp sge i32 %14, 0
  br i1 %15, label %16, label %125

; <label>:16:                                     ; preds = %13
  %17 = load i32, i32* %5, align 4
  %18 = sext i32 %17 to i64
  %19 = getelementptr inbounds [6 x [6 x double]], [6 x [6 x double]]* @cos_s, i64 0, i64 %18
  %20 = getelementptr inbounds [6 x double], [6 x double]* %19, i64 0, i64 0
  %21 = load double, double* %20, align 16
  store double %21, double* %7, align 8
  %22 = load i32, i32* %5, align 4
  %23 = sext i32 %22 to i64
  %24 = getelementptr inbounds [6 x [6 x double]], [6 x [6 x double]]* @cos_s, i64 0, i64 %23
  %25 = getelementptr inbounds [6 x double], [6 x double]* %24, i64 0, i64 1
  %26 = load double, double* %25, align 8
  store double %26, double* %8, align 8
  %27 = load i32, i32* %5, align 4
  %28 = sext i32 %27 to i64
  %29 = getelementptr inbounds [6 x [6 x double]], [6 x [6 x double]]* @cos_s, i64 0, i64 %28
  %30 = getelementptr inbounds [6 x double], [6 x double]* %29, i64 0, i64 2
  %31 = load double, double* %30, align 16
  store double %31, double* %9, align 8
  %32 = load i32, i32* %5, align 4
  %33 = sext i32 %32 to i64
  %34 = getelementptr inbounds [6 x [6 x double]], [6 x [6 x double]]* @cos_s, i64 0, i64 %33
  %35 = getelementptr inbounds [6 x double], [6 x double]* %34, i64 0, i64 3
  %36 = load double, double* %35, align 8
  store double %36, double* %10, align 8
  %37 = load i32, i32* %5, align 4
  %38 = sext i32 %37 to i64
  %39 = getelementptr inbounds [6 x [6 x double]], [6 x [6 x double]]* @cos_s, i64 0, i64 %38
  %40 = getelementptr inbounds [6 x double], [6 x double]* %39, i64 0, i64 4
  %41 = load double, double* %40, align 16
  store double %41, double* %11, align 8
  %42 = load i32, i32* %5, align 4
  %43 = sext i32 %42 to i64
  %44 = getelementptr inbounds [6 x [6 x double]], [6 x [6 x double]]* @cos_s, i64 0, i64 %43
  %45 = getelementptr inbounds [6 x double], [6 x double]* %44, i64 0, i64 5
  %46 = load double, double* %45, align 8
  store double %46, double* %12, align 8
  store i32 2, i32* %6, align 4
  br label %47

; <label>:47:                                     ; preds = %116, %16
  %48 = load i32, i32* %6, align 4
  %49 = icmp sge i32 %48, 0
  br i1 %49, label %50, label %120

; <label>:50:                                     ; preds = %47
  %51 = load double, double* %7, align 8
  %52 = load double*, double** %4, align 8
  %53 = load i32, i32* %6, align 4
  %54 = mul nsw i32 6, %53
  %55 = sext i32 %54 to i64
  %56 = getelementptr inbounds double, double* %52, i64 %55
  %57 = load double, double* %56, align 8
  %58 = fmul double %51, %57
  %59 = load double, double* %8, align 8
  %60 = load double*, double** %4, align 8
  %61 = load i32, i32* %6, align 4
  %62 = mul nsw i32 6, %61
  %63 = add nsw i32 %62, 1
  %64 = sext i32 %63 to i64
  %65 = getelementptr inbounds double, double* %60, i64 %64
  %66 = load double, double* %65, align 8
  %67 = fmul double %59, %66
  %68 = fadd double %58, %67
  %69 = load double, double* %9, align 8
  %70 = load double*, double** %4, align 8
  %71 = load i32, i32* %6, align 4
  %72 = mul nsw i32 6, %71
  %73 = add nsw i32 %72, 2
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds double, double* %70, i64 %74
  %76 = load double, double* %75, align 8
  %77 = fmul double %69, %76
  %78 = fadd double %68, %77
  %79 = load double, double* %10, align 8
  %80 = load double*, double** %4, align 8
  %81 = load i32, i32* %6, align 4
  %82 = mul nsw i32 6, %81
  %83 = add nsw i32 %82, 3
  %84 = sext i32 %83 to i64
  %85 = getelementptr inbounds double, double* %80, i64 %84
  %86 = load double, double* %85, align 8
  %87 = fmul double %79, %86
  %88 = fadd double %78, %87
  %89 = load double, double* %11, align 8
  %90 = load double*, double** %4, align 8
  %91 = load i32, i32* %6, align 4
  %92 = mul nsw i32 6, %91
  %93 = add nsw i32 %92, 4
  %94 = sext i32 %93 to i64
  %95 = getelementptr inbounds double, double* %90, i64 %94
  %96 = load double, double* %95, align 8
  %97 = fmul double %89, %96
  %98 = fadd double %88, %97
  %99 = load double, double* %12, align 8
  %100 = load double*, double** %4, align 8
  %101 = load i32, i32* %6, align 4
  %102 = mul nsw i32 6, %101
  %103 = add nsw i32 %102, 5
  %104 = sext i32 %103 to i64
  %105 = getelementptr inbounds double, double* %100, i64 %104
  %106 = load double, double* %105, align 8
  %107 = fmul double %99, %106
  %108 = fadd double %98, %107
  %109 = load double*, double** %3, align 8
  %110 = load i32, i32* %5, align 4
  %111 = mul nsw i32 3, %110
  %112 = load i32, i32* %6, align 4
  %113 = add nsw i32 %111, %112
  %114 = sext i32 %113 to i64
  %115 = getelementptr inbounds double, double* %109, i64 %114
  store double %108, double* %115, align 8
  br label %116

; <label>:116:                                    ; preds = %50
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_mdct_short, i64 0, i64 0)
  %117 = add i64 %pgocount, 1
  store i64 %117, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_mdct_short, i64 0, i64 0)
  %118 = load i32, i32* %6, align 4
  %119 = add nsw i32 %118, -1
  store i32 %119, i32* %6, align 4
  br label %47

; <label>:120:                                    ; preds = %47
  br label %121

; <label>:121:                                    ; preds = %120
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_mdct_short, i64 0, i64 1)
  %122 = add i64 %pgocount1, 1
  store i64 %122, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_mdct_short, i64 0, i64 1)
  %123 = load i32, i32* %5, align 4
  %124 = add nsw i32 %123, -1
  store i32 %124, i32* %5, align 4
  br label %13

; <label>:125:                                    ; preds = %13
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_mdct_short, i64 0, i64 2)
  %126 = add i64 %pgocount2, 1
  store i64 %126, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_tmp1.ll_mdct_short, i64 0, i64 2)
  ret void
}

; Function Attrs: nounwind uwtable
define internal void @mdct_long(double*, double*) #0 {
  %3 = alloca double*, align 8
  %4 = alloca double*, align 8
  %5 = alloca double, align 8
  %6 = alloca double, align 8
  %7 = alloca double, align 8
  %8 = alloca double, align 8
  %9 = alloca double, align 8
  %10 = alloca double, align 8
  %11 = alloca i32, align 4
  %12 = alloca double*, align 8
  store double* %0, double** %3, align 8
  store double* %1, double** %4, align 8
  store i32 11, i32* %11, align 4
  store double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i32 0, i32 0), double** %12, align 8
  br label %13

; <label>:13:                                     ; preds = %167, %2
  %pgocount = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_mdct_long, i64 0, i64 0)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_mdct_long, i64 0, i64 0)
  %15 = load double*, double** %4, align 8
  %16 = getelementptr inbounds double, double* %15, i64 0
  %17 = load double, double* %16, align 8
  %18 = load double*, double** %12, align 8
  %19 = getelementptr inbounds double, double* %18, i64 0
  %20 = load double, double* %19, align 8
  %21 = fmul double %17, %20
  %22 = load double*, double** %4, align 8
  %23 = getelementptr inbounds double, double* %22, i64 1
  %24 = load double, double* %23, align 8
  %25 = load double*, double** %12, align 8
  %26 = getelementptr inbounds double, double* %25, i64 1
  %27 = load double, double* %26, align 8
  %28 = fmul double %24, %27
  %29 = fadd double %21, %28
  %30 = load double*, double** %4, align 8
  %31 = getelementptr inbounds double, double* %30, i64 2
  %32 = load double, double* %31, align 8
  %33 = load double*, double** %12, align 8
  %34 = getelementptr inbounds double, double* %33, i64 2
  %35 = load double, double* %34, align 8
  %36 = fmul double %32, %35
  %37 = fadd double %29, %36
  %38 = load double*, double** %4, align 8
  %39 = getelementptr inbounds double, double* %38, i64 3
  %40 = load double, double* %39, align 8
  %41 = load double*, double** %12, align 8
  %42 = getelementptr inbounds double, double* %41, i64 3
  %43 = load double, double* %42, align 8
  %44 = fmul double %40, %43
  %45 = fadd double %37, %44
  %46 = load double*, double** %4, align 8
  %47 = getelementptr inbounds double, double* %46, i64 4
  %48 = load double, double* %47, align 8
  %49 = load double*, double** %12, align 8
  %50 = getelementptr inbounds double, double* %49, i64 4
  %51 = load double, double* %50, align 8
  %52 = fmul double %48, %51
  %53 = fadd double %45, %52
  %54 = load double*, double** %4, align 8
  %55 = getelementptr inbounds double, double* %54, i64 5
  %56 = load double, double* %55, align 8
  %57 = load double*, double** %12, align 8
  %58 = getelementptr inbounds double, double* %57, i64 5
  %59 = load double, double* %58, align 8
  %60 = fmul double %56, %59
  %61 = fadd double %53, %60
  %62 = load double*, double** %4, align 8
  %63 = getelementptr inbounds double, double* %62, i64 6
  %64 = load double, double* %63, align 8
  %65 = load double*, double** %12, align 8
  %66 = getelementptr inbounds double, double* %65, i64 6
  %67 = load double, double* %66, align 8
  %68 = fmul double %64, %67
  %69 = fadd double %61, %68
  %70 = load double*, double** %4, align 8
  %71 = getelementptr inbounds double, double* %70, i64 7
  %72 = load double, double* %71, align 8
  %73 = load double*, double** %12, align 8
  %74 = getelementptr inbounds double, double* %73, i64 7
  %75 = load double, double* %74, align 8
  %76 = fmul double %72, %75
  %77 = fadd double %69, %76
  %78 = load double*, double** %4, align 8
  %79 = getelementptr inbounds double, double* %78, i64 8
  %80 = load double, double* %79, align 8
  %81 = load double*, double** %12, align 8
  %82 = getelementptr inbounds double, double* %81, i64 8
  %83 = load double, double* %82, align 8
  %84 = fmul double %80, %83
  %85 = fadd double %77, %84
  %86 = load double*, double** %4, align 8
  %87 = getelementptr inbounds double, double* %86, i64 9
  %88 = load double, double* %87, align 8
  %89 = load double*, double** %12, align 8
  %90 = getelementptr inbounds double, double* %89, i64 9
  %91 = load double, double* %90, align 8
  %92 = fmul double %88, %91
  %93 = fadd double %85, %92
  %94 = load double*, double** %4, align 8
  %95 = getelementptr inbounds double, double* %94, i64 10
  %96 = load double, double* %95, align 8
  %97 = load double*, double** %12, align 8
  %98 = getelementptr inbounds double, double* %97, i64 10
  %99 = load double, double* %98, align 8
  %100 = fmul double %96, %99
  %101 = fadd double %93, %100
  %102 = load double*, double** %4, align 8
  %103 = getelementptr inbounds double, double* %102, i64 11
  %104 = load double, double* %103, align 8
  %105 = load double*, double** %12, align 8
  %106 = getelementptr inbounds double, double* %105, i64 11
  %107 = load double, double* %106, align 8
  %108 = fmul double %104, %107
  %109 = fadd double %101, %108
  %110 = load double*, double** %4, align 8
  %111 = getelementptr inbounds double, double* %110, i64 12
  %112 = load double, double* %111, align 8
  %113 = load double*, double** %12, align 8
  %114 = getelementptr inbounds double, double* %113, i64 12
  %115 = load double, double* %114, align 8
  %116 = fmul double %112, %115
  %117 = fadd double %109, %116
  %118 = load double*, double** %4, align 8
  %119 = getelementptr inbounds double, double* %118, i64 13
  %120 = load double, double* %119, align 8
  %121 = load double*, double** %12, align 8
  %122 = getelementptr inbounds double, double* %121, i64 13
  %123 = load double, double* %122, align 8
  %124 = fmul double %120, %123
  %125 = fadd double %117, %124
  %126 = load double*, double** %4, align 8
  %127 = getelementptr inbounds double, double* %126, i64 14
  %128 = load double, double* %127, align 8
  %129 = load double*, double** %12, align 8
  %130 = getelementptr inbounds double, double* %129, i64 14
  %131 = load double, double* %130, align 8
  %132 = fmul double %128, %131
  %133 = fadd double %125, %132
  %134 = load double*, double** %4, align 8
  %135 = getelementptr inbounds double, double* %134, i64 15
  %136 = load double, double* %135, align 8
  %137 = load double*, double** %12, align 8
  %138 = getelementptr inbounds double, double* %137, i64 15
  %139 = load double, double* %138, align 8
  %140 = fmul double %136, %139
  %141 = fadd double %133, %140
  %142 = load double*, double** %4, align 8
  %143 = getelementptr inbounds double, double* %142, i64 16
  %144 = load double, double* %143, align 8
  %145 = load double*, double** %12, align 8
  %146 = getelementptr inbounds double, double* %145, i64 16
  %147 = load double, double* %146, align 8
  %148 = fmul double %144, %147
  %149 = fadd double %141, %148
  %150 = load double*, double** %4, align 8
  %151 = getelementptr inbounds double, double* %150, i64 17
  %152 = load double, double* %151, align 8
  %153 = load double*, double** %12, align 8
  %154 = getelementptr inbounds double, double* %153, i64 17
  %155 = load double, double* %154, align 8
  %156 = fmul double %152, %155
  %157 = fadd double %149, %156
  %158 = load double*, double** %3, align 8
  %159 = load i32, i32* %11, align 4
  %160 = sext i32 %159 to i64
  %161 = getelementptr inbounds [12 x i32], [12 x i32]* @all, i64 0, i64 %160
  %162 = load i32, i32* %161, align 4
  %163 = sext i32 %162 to i64
  %164 = getelementptr inbounds double, double* %158, i64 %163
  store double %157, double* %164, align 8
  %165 = load double*, double** %12, align 8
  %166 = getelementptr inbounds double, double* %165, i64 18
  store double* %166, double** %12, align 8
  br label %167

; <label>:167:                                    ; preds = %13
  %168 = load i32, i32* %11, align 4
  %169 = add nsw i32 %168, -1
  store i32 %169, i32* %11, align 4
  %170 = icmp sge i32 %169, 0
  br i1 %170, label %13, label %171

; <label>:171:                                    ; preds = %167
  %pgocount1 = load i64, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_mdct_long, i64 0, i64 1)
  %172 = add i64 %pgocount1, 1
  store i64 %172, i64* getelementptr inbounds ([2 x i64], [2 x i64]* @__profc_tmp1.ll_mdct_long, i64 0, i64 1)
  %173 = load double*, double** %4, align 8
  %174 = getelementptr inbounds double, double* %173, i64 0
  %175 = load double, double* %174, align 8
  %176 = load double*, double** %4, align 8
  %177 = getelementptr inbounds double, double* %176, i64 5
  %178 = load double, double* %177, align 8
  %179 = fadd double %175, %178
  %180 = load double*, double** %4, align 8
  %181 = getelementptr inbounds double, double* %180, i64 15
  %182 = load double, double* %181, align 8
  %183 = fadd double %179, %182
  store double %183, double* %5, align 8
  %184 = load double*, double** %4, align 8
  %185 = getelementptr inbounds double, double* %184, i64 1
  %186 = load double, double* %185, align 8
  %187 = load double*, double** %4, align 8
  %188 = getelementptr inbounds double, double* %187, i64 4
  %189 = load double, double* %188, align 8
  %190 = fadd double %186, %189
  %191 = load double*, double** %4, align 8
  %192 = getelementptr inbounds double, double* %191, i64 16
  %193 = load double, double* %192, align 8
  %194 = fadd double %190, %193
  store double %194, double* %6, align 8
  %195 = load double*, double** %4, align 8
  %196 = getelementptr inbounds double, double* %195, i64 2
  %197 = load double, double* %196, align 8
  %198 = load double*, double** %4, align 8
  %199 = getelementptr inbounds double, double* %198, i64 3
  %200 = load double, double* %199, align 8
  %201 = fadd double %197, %200
  %202 = load double*, double** %4, align 8
  %203 = getelementptr inbounds double, double* %202, i64 17
  %204 = load double, double* %203, align 8
  %205 = fadd double %201, %204
  store double %205, double* %7, align 8
  %206 = load double*, double** %4, align 8
  %207 = getelementptr inbounds double, double* %206, i64 6
  %208 = load double, double* %207, align 8
  %209 = load double*, double** %4, align 8
  %210 = getelementptr inbounds double, double* %209, i64 9
  %211 = load double, double* %210, align 8
  %212 = fsub double %208, %211
  %213 = load double*, double** %4, align 8
  %214 = getelementptr inbounds double, double* %213, i64 14
  %215 = load double, double* %214, align 8
  %216 = fadd double %212, %215
  store double %216, double* %8, align 8
  %217 = load double*, double** %4, align 8
  %218 = getelementptr inbounds double, double* %217, i64 7
  %219 = load double, double* %218, align 8
  %220 = load double*, double** %4, align 8
  %221 = getelementptr inbounds double, double* %220, i64 10
  %222 = load double, double* %221, align 8
  %223 = fsub double %219, %222
  %224 = load double*, double** %4, align 8
  %225 = getelementptr inbounds double, double* %224, i64 13
  %226 = load double, double* %225, align 8
  %227 = fadd double %223, %226
  store double %227, double* %9, align 8
  %228 = load double*, double** %4, align 8
  %229 = getelementptr inbounds double, double* %228, i64 8
  %230 = load double, double* %229, align 8
  %231 = load double*, double** %4, align 8
  %232 = getelementptr inbounds double, double* %231, i64 11
  %233 = load double, double* %232, align 8
  %234 = fsub double %230, %233
  %235 = load double*, double** %4, align 8
  %236 = getelementptr inbounds double, double* %235, i64 12
  %237 = load double, double* %236, align 8
  %238 = fadd double %234, %237
  store double %238, double* %10, align 8
  %239 = load double, double* %5, align 8
  %240 = load double*, double** %12, align 8
  %241 = getelementptr inbounds double, double* %240, i64 0
  %242 = load double, double* %241, align 8
  %243 = fmul double %239, %242
  %244 = load double, double* %6, align 8
  %245 = load double*, double** %12, align 8
  %246 = getelementptr inbounds double, double* %245, i64 1
  %247 = load double, double* %246, align 8
  %248 = fmul double %244, %247
  %249 = fadd double %243, %248
  %250 = load double, double* %7, align 8
  %251 = load double*, double** %12, align 8
  %252 = getelementptr inbounds double, double* %251, i64 2
  %253 = load double, double* %252, align 8
  %254 = fmul double %250, %253
  %255 = fadd double %249, %254
  %256 = load double, double* %8, align 8
  %257 = load double*, double** %12, align 8
  %258 = getelementptr inbounds double, double* %257, i64 3
  %259 = load double, double* %258, align 8
  %260 = fmul double %256, %259
  %261 = fadd double %255, %260
  %262 = load double, double* %9, align 8
  %263 = load double*, double** %12, align 8
  %264 = getelementptr inbounds double, double* %263, i64 4
  %265 = load double, double* %264, align 8
  %266 = fmul double %262, %265
  %267 = fadd double %261, %266
  %268 = load double, double* %10, align 8
  %269 = load double*, double** %12, align 8
  %270 = getelementptr inbounds double, double* %269, i64 5
  %271 = load double, double* %270, align 8
  %272 = fmul double %268, %271
  %273 = fadd double %267, %272
  %274 = load double*, double** %3, align 8
  %275 = getelementptr inbounds double, double* %274, i64 16
  store double %273, double* %275, align 8
  %276 = load double*, double** %12, align 8
  %277 = getelementptr inbounds double, double* %276, i64 6
  store double* %277, double** %12, align 8
  %278 = load double, double* %5, align 8
  %279 = load double*, double** %12, align 8
  %280 = getelementptr inbounds double, double* %279, i64 0
  %281 = load double, double* %280, align 8
  %282 = fmul double %278, %281
  %283 = load double, double* %6, align 8
  %284 = load double*, double** %12, align 8
  %285 = getelementptr inbounds double, double* %284, i64 1
  %286 = load double, double* %285, align 8
  %287 = fmul double %283, %286
  %288 = fadd double %282, %287
  %289 = load double, double* %7, align 8
  %290 = load double*, double** %12, align 8
  %291 = getelementptr inbounds double, double* %290, i64 2
  %292 = load double, double* %291, align 8
  %293 = fmul double %289, %292
  %294 = fadd double %288, %293
  %295 = load double, double* %8, align 8
  %296 = load double*, double** %12, align 8
  %297 = getelementptr inbounds double, double* %296, i64 3
  %298 = load double, double* %297, align 8
  %299 = fmul double %295, %298
  %300 = fadd double %294, %299
  %301 = load double, double* %9, align 8
  %302 = load double*, double** %12, align 8
  %303 = getelementptr inbounds double, double* %302, i64 4
  %304 = load double, double* %303, align 8
  %305 = fmul double %301, %304
  %306 = fadd double %300, %305
  %307 = load double, double* %10, align 8
  %308 = load double*, double** %12, align 8
  %309 = getelementptr inbounds double, double* %308, i64 5
  %310 = load double, double* %309, align 8
  %311 = fmul double %307, %310
  %312 = fadd double %306, %311
  %313 = load double*, double** %3, align 8
  %314 = getelementptr inbounds double, double* %313, i64 10
  store double %312, double* %314, align 8
  %315 = load double*, double** %12, align 8
  %316 = getelementptr inbounds double, double* %315, i64 6
  store double* %316, double** %12, align 8
  %317 = load double, double* %5, align 8
  %318 = load double*, double** %12, align 8
  %319 = getelementptr inbounds double, double* %318, i64 0
  %320 = load double, double* %319, align 8
  %321 = fmul double %317, %320
  %322 = load double, double* %6, align 8
  %323 = load double*, double** %12, align 8
  %324 = getelementptr inbounds double, double* %323, i64 1
  %325 = load double, double* %324, align 8
  %326 = fmul double %322, %325
  %327 = fadd double %321, %326
  %328 = load double, double* %7, align 8
  %329 = load double*, double** %12, align 8
  %330 = getelementptr inbounds double, double* %329, i64 2
  %331 = load double, double* %330, align 8
  %332 = fmul double %328, %331
  %333 = fadd double %327, %332
  %334 = load double, double* %8, align 8
  %335 = load double*, double** %12, align 8
  %336 = getelementptr inbounds double, double* %335, i64 3
  %337 = load double, double* %336, align 8
  %338 = fmul double %334, %337
  %339 = fadd double %333, %338
  %340 = load double, double* %9, align 8
  %341 = load double*, double** %12, align 8
  %342 = getelementptr inbounds double, double* %341, i64 4
  %343 = load double, double* %342, align 8
  %344 = fmul double %340, %343
  %345 = fadd double %339, %344
  %346 = load double, double* %10, align 8
  %347 = load double*, double** %12, align 8
  %348 = getelementptr inbounds double, double* %347, i64 5
  %349 = load double, double* %348, align 8
  %350 = fmul double %346, %349
  %351 = fadd double %345, %350
  %352 = load double*, double** %3, align 8
  %353 = getelementptr inbounds double, double* %352, i64 7
  store double %351, double* %353, align 8
  %354 = load double*, double** %12, align 8
  %355 = getelementptr inbounds double, double* %354, i64 6
  store double* %355, double** %12, align 8
  %356 = load double, double* %5, align 8
  %357 = load double*, double** %12, align 8
  %358 = getelementptr inbounds double, double* %357, i64 0
  %359 = load double, double* %358, align 8
  %360 = fmul double %356, %359
  %361 = load double, double* %6, align 8
  %362 = load double*, double** %12, align 8
  %363 = getelementptr inbounds double, double* %362, i64 1
  %364 = load double, double* %363, align 8
  %365 = fmul double %361, %364
  %366 = fadd double %360, %365
  %367 = load double, double* %7, align 8
  %368 = load double*, double** %12, align 8
  %369 = getelementptr inbounds double, double* %368, i64 2
  %370 = load double, double* %369, align 8
  %371 = fmul double %367, %370
  %372 = fadd double %366, %371
  %373 = load double, double* %8, align 8
  %374 = load double*, double** %12, align 8
  %375 = getelementptr inbounds double, double* %374, i64 3
  %376 = load double, double* %375, align 8
  %377 = fmul double %373, %376
  %378 = fadd double %372, %377
  %379 = load double, double* %9, align 8
  %380 = load double*, double** %12, align 8
  %381 = getelementptr inbounds double, double* %380, i64 4
  %382 = load double, double* %381, align 8
  %383 = fmul double %379, %382
  %384 = fadd double %378, %383
  %385 = load double, double* %10, align 8
  %386 = load double*, double** %12, align 8
  %387 = getelementptr inbounds double, double* %386, i64 5
  %388 = load double, double* %387, align 8
  %389 = fmul double %385, %388
  %390 = fadd double %384, %389
  %391 = load double*, double** %3, align 8
  %392 = getelementptr inbounds double, double* %391, i64 1
  store double %390, double* %392, align 8
  %393 = load double*, double** %12, align 8
  %394 = getelementptr inbounds double, double* %393, i64 6
  store double* %394, double** %12, align 8
  %395 = load double, double* %5, align 8
  %396 = load double, double* %6, align 8
  %397 = fsub double %395, %396
  %398 = load double, double* %10, align 8
  %399 = fadd double %397, %398
  store double %399, double* %5, align 8
  %400 = load double, double* %7, align 8
  %401 = load double, double* %8, align 8
  %402 = fsub double %400, %401
  %403 = load double, double* %9, align 8
  %404 = fsub double %402, %403
  store double %404, double* %7, align 8
  %405 = load double, double* %5, align 8
  %406 = load double*, double** %12, align 8
  %407 = getelementptr inbounds double, double* %406, i64 0
  %408 = load double, double* %407, align 8
  %409 = fmul double %405, %408
  %410 = load double, double* %7, align 8
  %411 = load double*, double** %12, align 8
  %412 = getelementptr inbounds double, double* %411, i64 1
  %413 = load double, double* %412, align 8
  %414 = fmul double %410, %413
  %415 = fadd double %409, %414
  %416 = load double*, double** %3, align 8
  %417 = getelementptr inbounds double, double* %416, i64 13
  store double %415, double* %417, align 8
  %418 = load double, double* %5, align 8
  %419 = load double*, double** %12, align 8
  %420 = getelementptr inbounds double, double* %419, i64 2
  %421 = load double, double* %420, align 8
  %422 = fmul double %418, %421
  %423 = load double, double* %7, align 8
  %424 = load double*, double** %12, align 8
  %425 = getelementptr inbounds double, double* %424, i64 3
  %426 = load double, double* %425, align 8
  %427 = fmul double %423, %426
  %428 = fadd double %422, %427
  %429 = load double*, double** %3, align 8
  %430 = getelementptr inbounds double, double* %429, i64 4
  store double %428, double* %430, align 8
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #2

; Function Attrs: nounwind
declare double @sqrt(double) #1

; Function Attrs: nounwind
declare double @sin(double) #1

; Function Attrs: nounwind
declare double @tan(double) #1

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

attributes #0 = { nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { argmemonly nounwind }
attributes #3 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (trunk 288896)"}
