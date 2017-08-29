; ModuleID = 'newmdct.ll'
source_filename = "newmdct.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.lame_global_flags = type { i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, i8*, i32, i32, float, i32, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, float, i32, i32, i32, float, float, float, float, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.III_side_info_t = type { i32, i32, i32, [2 x [4 x i32]], [2 x %struct.anon] }
%struct.anon = type { [2 x %struct.gr_info_ss] }
%struct.gr_info_ss = type { %struct.gr_info }
%struct.gr_info = type { i32, i32, i32, i32, i32, i32, i32, i32, [3 x i32], [3 x i32], i32, i32, i32, i32, i32, i32, i32, i32, i32, i32*, [4 x i32] }

@mdct_sub48.init = internal unnamed_addr global i32 0, align 4
@sb_sample = internal global [2 x [2 x [18 x [32 x double]]]] zeroinitializer, align 16
@win = internal global [4 x [36 x double]] zeroinitializer, align 16
@ca = internal unnamed_addr global [8 x double] zeroinitializer, align 16
@cs = internal unnamed_addr global [8 x double] zeroinitializer, align 16
@mdct_init48.c = internal unnamed_addr constant [8 x double] [double -6.000000e-01, double -5.350000e-01, double -3.300000e-01, double -1.850000e-01, double -9.500000e-02, double -4.100000e-02, double -1.420000e-02, double -3.700000e-03], align 16
@cos_l = internal global [244 x double] zeroinitializer, align 16
@mdct_init48.d3 = internal unnamed_addr constant [4 x i32] [i32 1, i32 7, i32 10, i32 16], align 16
@mdct_init48.d9 = internal unnamed_addr constant [2 x i32] [i32 4, i32 13], align 4
@all = internal unnamed_addr constant [12 x i32] [i32 0, i32 2, i32 3, i32 5, i32 6, i32 8, i32 9, i32 11, i32 12, i32 14, i32 15, i32 17], align 16
@enwindow = internal global [256 x double] [double 0x3FA251E002C5BE4C, double 0x3F924E1FFC2760F6, double 3.134727e-03, double 2.457142e-03, double 9.713170e-04, double 2.188680e-04, double 1.015660e-04, double 1.382800e-05, double 0x3FA24EFFFE8EA200, double 3.401756e-03, double 9.837150e-04, double 9.918200e-05, double -4.770000e-07, double 1.039510e-04, double 9.536740e-04, double 2.841473e-03, double 1.239800e-05, double 1.912120e-04, double 2.283096e-03, double 0x3F9166FFFA87D736, double 0x3F9334FFF82E8B95, double 2.630711e-03, double 2.474780e-04, double 1.478200e-05, double 0x3FA2467FFD4C82A1, double 3.643036e-03, double 9.918210e-04, double 9.632100e-05, double -4.770000e-07, double 1.058580e-04, double 9.307860e-04, double 2.521515e-03, double 1.144400e-05, double 1.654620e-04, double 2.110004e-03, double 0x3F907FDFF8E84D76, double 0x3F941B0002FC8112, double 2.803326e-03, double 2.770420e-04, double 1.668900e-05, double 0x3FA2385FFEFF602E, double 3.858566e-03, double 9.951590e-04, double 9.346000e-05, double -4.770000e-07, double 1.072880e-04, double 9.026530e-04, double 2.174854e-03, double 1.001400e-05, double 1.401900e-04, double 1.937389e-03, double 0x3F8F32C00A8B630F, double 0x3F94FFC002FEA6D3, double 2.974033e-03, double 3.075600e-04, double 1.812000e-05, double 3.543520e-02, double 4.049301e-03, double 9.942050e-04, double 9.059900e-05, double -4.770000e-07, double 1.082420e-04, double 8.687970e-04, double 1.800537e-03, double 9.060000e-06, double 1.163480e-04, double 1.766682e-03, double 0x3F8D680010E953B9, double 0x3F95E29FFB661AF0, double 3.141880e-03, double 3.390310e-04, double 1.955000e-05, double 0x3FA20B4002AD0C1B, double 4.215240e-03, double 9.894370e-04, double 8.726100e-05, double -4.770000e-07, double 1.087190e-04, double 8.292200e-04, double 1.399517e-03, double 8.106000e-06, double 9.393700e-05, double 1.597881e-03, double 0x3F8BA03FF357727A, double 0x3F96C320035E36F6, double 3.306866e-03, double 3.714560e-04, double 2.145800e-05, double 3.500700e-02, double 4.357815e-03, double 9.808540e-04, double 8.392300e-05, double -4.770000e-07, double 1.087190e-04, double 7.839200e-04, double 9.713170e-04, double 7.629000e-06, double 7.295600e-05, double 1.432419e-03, double 0x3F89DC800CEF6B77, double 2.307415e-02, double 3.467083e-03, double 4.043580e-04, double 2.336500e-05, double 0x3FA1C82FFC6969F3, double 4.477024e-03, double 9.689330e-04, double 8.058500e-05, double -9.540000e-07, double 1.082420e-04, double 7.319450e-04, double 5.159380e-04, double 6.676000e-06, double 5.292900e-05, double 1.269817e-03, double 0x3F881D80076614A1, double 0x3F987B2006DB9161, double 3.622532e-03, double 4.382130e-04, double 2.527200e-05, double 0x3FA19E90011D1416, double 4.573822e-03, double 9.541510e-04, double 7.677100e-05, double -9.540000e-07, double 1.068120e-04, double 6.742480e-04, double 3.337900e-05, double 6.199000e-06, double 3.433200e-05, double 1.111031e-03, double 0x3F86643FF91CEA7A, double 0x3F99519FFD2D5F2B, double 3.771782e-03, double 4.725460e-04, double 2.765700e-05, double 3.405571e-02, double 4.649162e-03, double 9.355550e-04, double 7.343300e-05, double -9.540000e-07, double 1.053810e-04, double 6.103520e-04, double -4.758830e-04, double 5.245000e-06, double 1.716600e-05, double 9.565350e-04, double 0x3F84B1400FA0C315, double 2.552700e-02, double 3.914356e-03, double 5.073550e-04, double 3.004100e-05, double 0x3FA13BE000055E64, double 4.703045e-03, double 9.150510e-04, double 7.009500e-05, double -9.540000e-07, double 1.025200e-04, double 5.393030e-04, double -1.011848e-03, double 4.768000e-06, double 9.540000e-07, double 8.068080e-04, double 9.287834e-03, double 0x3F9AF14004E3FBA4, double 4.048824e-03, double 5.421640e-04, double 3.242500e-05, double 0x3FA102EFFD062E20, double 4.737377e-03, double 8.916850e-04, double 6.628000e-05, double -1.431000e-06, double 9.918200e-05, double 4.625320e-04, double -1.573563e-03, double 4.292000e-06, double -1.382800e-05, double 6.618500e-04, double 8.487225e-03, double 2.707386e-02, double 4.174709e-03, double 5.769730e-04, double 3.480900e-05, double 0x3FA0C53FFF633BD3, double 4.752159e-03, double 8.664130e-04, double 6.294300e-05, double -1.431000e-06, double 9.536700e-05, double 3.786090e-04, double -2.161503e-03, double 3.815000e-06, double -2.718000e-05, double 5.221370e-04, double 7.703304e-03, double 0x3F9C7BA000DE43BA, double 4.290581e-03, double 6.117820e-04, double 3.767000e-05, double 3.224802e-02, double 4.748821e-03, double 8.387570e-04, double 5.960500e-05, double -1.907000e-06, double 9.012200e-05, double 2.884860e-04, double -2.774239e-03, double 3.338000e-06, double -3.957700e-05, double 3.881450e-04, double 6.937027e-03, double 0x3F9D37C002307E44, double 4.395962e-03, double 6.465910e-04, double 4.053100e-05, double 3.170681e-02, double 4.728317e-03, double 8.096690e-04, double 5.579000e-05, double -1.907000e-06, double 8.440000e-05, double 1.916890e-04, double -3.411293e-03, double 3.338000e-06, double -5.054500e-05, double 2.598760e-04, double 6.189346e-03, double 0x3F9DED20070F1B84, double 4.489899e-03, double 6.809230e-04, double 4.339200e-05, double 0x3F9FE13FFEFC278C, double 4.691124e-03, double 7.791520e-04, double 5.292900e-05, double -2.384000e-06, double 7.772400e-05, double 8.821500e-05, double -4.072189e-03, double 2.861000e-06, double -6.055800e-05, double 1.373290e-04, double 5.462170e-03, double 2.989006e-02, double 4.570484e-03, double 7.143020e-04, double 4.625300e-05, double 0x3F9F425FFF77A281, double 4.638195e-03, double 7.472040e-04, double 4.959100e-05, double 4.756451e-03, double 2.145800e-05, double -6.961800e-05, double 2.384000e-06], align 16
@mm = internal global [16 x [31 x double]] zeroinitializer, align 16
@cos_s = internal unnamed_addr global [6 x [6 x double]] zeroinitializer, align 16

; Function Attrs: noinline nounwind uwtable
define void @mdct_sub48(%struct.lame_global_flags* nocapture readonly, i16* readonly, i16* readonly, [2 x [576 x double]]* nocapture, %struct.III_side_info_t* nocapture readonly) local_unnamed_addr #0 {
  %6 = load i32, i32* @mdct_sub48.init, align 4
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %.preheader17

; <label>:8:                                      ; preds = %5
  tail call void @mdct_init48()
  %9 = load i32, i32* @mdct_sub48.init, align 4
  %10 = add nsw i32 %9, 1
  store i32 %10, i32* @mdct_sub48.init, align 4
  br label %.preheader17

.preheader17:                                     ; preds = %8, %5
  %11 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 46
  %12 = load i32, i32* %11, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %.preheader16.lr.ph, label %._crit_edge38

.preheader16.lr.ph:                               ; preds = %.preheader17
  %14 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 45
  %15 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 59
  %16 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 58
  %17 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 57
  %18 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 53
  %19 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 54
  %20 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 55
  %21 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 56
  %22 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 57
  %23 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 58
  br label %.preheader16

.preheader16:                                     ; preds = %.preheader16.lr.ph, %._crit_edge.thread
  %indvars.iv56 = phi i64 [ 0, %.preheader16.lr.ph ], [ %indvars.iv.next57, %._crit_edge.thread ]
  %.0337 = phi i16* [ %1, %.preheader16.lr.ph ], [ %2, %._crit_edge.thread ]
  %24 = load i32, i32* %14, align 8
  %25 = icmp sgt i32 %24, 0
  br i1 %25, label %.lr.ph35.preheader, label %._crit_edge.thread

.lr.ph35.preheader:                               ; preds = %.preheader16
  br label %.lr.ph35

.lr.ph35:                                         ; preds = %.lr.ph35.preheader, %463
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %463 ], [ 0, %.lr.ph35.preheader ]
  %.1434 = phi i16* [ %scevgep, %463 ], [ %.0337, %.lr.ph35.preheader ]
  %26 = sub nsw i64 1, %indvars.iv54
  %27 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 0, i64 0
  br label %28

; <label>:28:                                     ; preds = %.lr.ph35, %28
  %.021 = phi double* [ %27, %.lr.ph35 ], [ %80, %28 ]
  %.2520 = phi i16* [ %.1434, %.lr.ph35 ], [ %79, %28 ]
  %.0719 = phi i32 [ 0, %.lr.ph35 ], [ %81, %28 ]
  tail call fastcc void @window_subband(i16* %.2520, double* %.021)
  %29 = getelementptr inbounds i16, i16* %.2520, i64 32
  %30 = getelementptr inbounds double, double* %.021, i64 32
  tail call fastcc void @window_subband(i16* %29, double* %30)
  %31 = getelementptr inbounds double, double* %.021, i64 33
  %32 = load double, double* %31, align 8
  %33 = fsub double -0.000000e+00, %32
  store double %33, double* %31, align 8
  %34 = getelementptr inbounds double, double* %.021, i64 35
  %35 = load double, double* %34, align 8
  %36 = fsub double -0.000000e+00, %35
  store double %36, double* %34, align 8
  %37 = getelementptr inbounds double, double* %.021, i64 37
  %38 = load double, double* %37, align 8
  %39 = fsub double -0.000000e+00, %38
  store double %39, double* %37, align 8
  %40 = getelementptr inbounds double, double* %.021, i64 39
  %41 = load double, double* %40, align 8
  %42 = fsub double -0.000000e+00, %41
  store double %42, double* %40, align 8
  %43 = getelementptr inbounds double, double* %.021, i64 41
  %44 = load double, double* %43, align 8
  %45 = fsub double -0.000000e+00, %44
  store double %45, double* %43, align 8
  %46 = getelementptr inbounds double, double* %.021, i64 43
  %47 = load double, double* %46, align 8
  %48 = fsub double -0.000000e+00, %47
  store double %48, double* %46, align 8
  %49 = getelementptr inbounds double, double* %.021, i64 45
  %50 = load double, double* %49, align 8
  %51 = fsub double -0.000000e+00, %50
  store double %51, double* %49, align 8
  %52 = getelementptr inbounds double, double* %.021, i64 47
  %53 = load double, double* %52, align 8
  %54 = fsub double -0.000000e+00, %53
  store double %54, double* %52, align 8
  %55 = getelementptr inbounds double, double* %.021, i64 49
  %56 = load double, double* %55, align 8
  %57 = fsub double -0.000000e+00, %56
  store double %57, double* %55, align 8
  %58 = getelementptr inbounds double, double* %.021, i64 51
  %59 = load double, double* %58, align 8
  %60 = fsub double -0.000000e+00, %59
  store double %60, double* %58, align 8
  %61 = getelementptr inbounds double, double* %.021, i64 53
  %62 = load double, double* %61, align 8
  %63 = fsub double -0.000000e+00, %62
  store double %63, double* %61, align 8
  %64 = getelementptr inbounds double, double* %.021, i64 55
  %65 = load double, double* %64, align 8
  %66 = fsub double -0.000000e+00, %65
  store double %66, double* %64, align 8
  %67 = getelementptr inbounds double, double* %.021, i64 57
  %68 = load double, double* %67, align 8
  %69 = fsub double -0.000000e+00, %68
  store double %69, double* %67, align 8
  %70 = getelementptr inbounds double, double* %.021, i64 59
  %71 = load double, double* %70, align 8
  %72 = fsub double -0.000000e+00, %71
  store double %72, double* %70, align 8
  %73 = getelementptr inbounds double, double* %.021, i64 61
  %74 = load double, double* %73, align 8
  %75 = fsub double -0.000000e+00, %74
  store double %75, double* %73, align 8
  %76 = getelementptr inbounds double, double* %.021, i64 63
  %77 = load double, double* %76, align 8
  %78 = fsub double -0.000000e+00, %77
  store double %78, double* %76, align 8
  %79 = getelementptr inbounds i16, i16* %.2520, i64 64
  %80 = getelementptr inbounds double, double* %.021, i64 64
  %81 = add nuw nsw i32 %.0719, 1
  %exitcond = icmp eq i32 %81, 9
  br i1 %exitcond, label %82, label %28

; <label>:82:                                     ; preds = %28
  %83 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %3, i64 %indvars.iv54, i64 %indvars.iv56, i64 0
  %scevgep = getelementptr i16, i16* %.1434, i64 576
  %84 = load i32, i32* %15, align 8
  %85 = icmp eq i32 %84, 0
  br i1 %85, label %103, label %.preheader15

.preheader15.loopexit:                            ; preds = %.backedge
  br label %.preheader15

.preheader15:                                     ; preds = %.preheader15.loopexit, %103, %82
  %86 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %4, i64 0, i32 4, i64 %indvars.iv54, i32 0, i64 %indvars.iv56, i32 0, i32 6
  %87 = load double, double* getelementptr inbounds ([8 x double], [8 x double]* @ca, i64 0, i64 7), align 8
  %88 = load double, double* getelementptr inbounds ([8 x double], [8 x double]* @cs, i64 0, i64 7), align 8
  %89 = load double, double* getelementptr inbounds ([8 x double], [8 x double]* @ca, i64 0, i64 6), align 16
  %90 = load double, double* getelementptr inbounds ([8 x double], [8 x double]* @cs, i64 0, i64 6), align 16
  %91 = load double, double* getelementptr inbounds ([8 x double], [8 x double]* @ca, i64 0, i64 5), align 8
  %92 = load double, double* getelementptr inbounds ([8 x double], [8 x double]* @cs, i64 0, i64 5), align 8
  %93 = load double, double* getelementptr inbounds ([8 x double], [8 x double]* @ca, i64 0, i64 4), align 16
  %94 = load double, double* getelementptr inbounds ([8 x double], [8 x double]* @cs, i64 0, i64 4), align 16
  %95 = load double, double* getelementptr inbounds ([8 x double], [8 x double]* @ca, i64 0, i64 3), align 8
  %96 = load double, double* getelementptr inbounds ([8 x double], [8 x double]* @cs, i64 0, i64 3), align 8
  %97 = load double, double* getelementptr inbounds ([8 x double], [8 x double]* @ca, i64 0, i64 2), align 16
  %98 = load double, double* getelementptr inbounds ([8 x double], [8 x double]* @cs, i64 0, i64 2), align 16
  %99 = load double, double* getelementptr inbounds ([8 x double], [8 x double]* @ca, i64 0, i64 1), align 8
  %100 = load double, double* getelementptr inbounds ([8 x double], [8 x double]* @cs, i64 0, i64 1), align 8
  %101 = load double, double* getelementptr inbounds ([8 x double], [8 x double]* @ca, i64 0, i64 0), align 16
  %102 = load double, double* getelementptr inbounds ([8 x double], [8 x double]* @cs, i64 0, i64 0), align 16
  br label %248

; <label>:103:                                    ; preds = %82
  %104 = load i32, i32* %16, align 4
  %.124 = add nsw i32 %104, 1
  %105 = load i32, i32* %17, align 8
  %106 = icmp slt i32 %.124, %105
  br i1 %106, label %.lr.ph.preheader, label %.preheader15

.lr.ph.preheader:                                 ; preds = %103
  %107 = sext i32 %.124 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.backedge
  %indvars.iv = phi i64 [ %107, %.lr.ph.preheader ], [ %indvars.iv.next, %.backedge ]
  %108 = trunc i64 %indvars.iv to i32
  %109 = sitofp i32 %108 to double
  %110 = fdiv double %109, 3.100000e+01
  %111 = load float, float* %18, align 8
  %112 = fpext float %111 to double
  %113 = fcmp olt double %112, %110
  br i1 %113, label %114, label %.loopexit14

; <label>:114:                                    ; preds = %.lr.ph
  %115 = load float, float* %19, align 4
  %116 = fpext float %115 to double
  %117 = fcmp olt double %110, %116
  br i1 %117, label %.loopexit14.loopexit42, label %.loopexit14

.loopexit14.loopexit42:                           ; preds = %114
  %118 = fsub double %112, %110
  %119 = fmul double %118, 0x3FF921FB54442D18
  %120 = fsub float %115, %111
  %121 = fpext float %120 to double
  %122 = fdiv double %119, %121
  %123 = tail call double @cos(double %122) #4
  %124 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 0, i64 %indvars.iv
  %125 = load double, double* %124, align 8
  %126 = fmul double %123, %125
  store double %126, double* %124, align 8
  %127 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 1, i64 %indvars.iv
  %128 = load double, double* %127, align 8
  %129 = fmul double %123, %128
  store double %129, double* %127, align 8
  %130 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 2, i64 %indvars.iv
  %131 = load double, double* %130, align 8
  %132 = fmul double %123, %131
  store double %132, double* %130, align 8
  %133 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 3, i64 %indvars.iv
  %134 = load double, double* %133, align 8
  %135 = fmul double %123, %134
  store double %135, double* %133, align 8
  %136 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 4, i64 %indvars.iv
  %137 = load double, double* %136, align 8
  %138 = fmul double %123, %137
  store double %138, double* %136, align 8
  %139 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 5, i64 %indvars.iv
  %140 = load double, double* %139, align 8
  %141 = fmul double %123, %140
  store double %141, double* %139, align 8
  %142 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 6, i64 %indvars.iv
  %143 = load double, double* %142, align 8
  %144 = fmul double %123, %143
  store double %144, double* %142, align 8
  %145 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 7, i64 %indvars.iv
  %146 = load double, double* %145, align 8
  %147 = fmul double %123, %146
  store double %147, double* %145, align 8
  %148 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 8, i64 %indvars.iv
  %149 = load double, double* %148, align 8
  %150 = fmul double %123, %149
  store double %150, double* %148, align 8
  %151 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 9, i64 %indvars.iv
  %152 = load double, double* %151, align 8
  %153 = fmul double %123, %152
  store double %153, double* %151, align 8
  %154 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 10, i64 %indvars.iv
  %155 = load double, double* %154, align 8
  %156 = fmul double %123, %155
  store double %156, double* %154, align 8
  %157 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 11, i64 %indvars.iv
  %158 = load double, double* %157, align 8
  %159 = fmul double %123, %158
  store double %159, double* %157, align 8
  %160 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 12, i64 %indvars.iv
  %161 = load double, double* %160, align 8
  %162 = fmul double %123, %161
  store double %162, double* %160, align 8
  %163 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 13, i64 %indvars.iv
  %164 = load double, double* %163, align 8
  %165 = fmul double %123, %164
  store double %165, double* %163, align 8
  %166 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 14, i64 %indvars.iv
  %167 = load double, double* %166, align 8
  %168 = fmul double %123, %167
  store double %168, double* %166, align 8
  %169 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 15, i64 %indvars.iv
  %170 = load double, double* %169, align 8
  %171 = fmul double %123, %170
  store double %171, double* %169, align 8
  %172 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 16, i64 %indvars.iv
  %173 = load double, double* %172, align 8
  %174 = fmul double %123, %173
  store double %174, double* %172, align 8
  %175 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 17, i64 %indvars.iv
  %176 = load double, double* %175, align 8
  %177 = fmul double %123, %176
  store double %177, double* %175, align 8
  br label %.loopexit14

.loopexit14:                                      ; preds = %.loopexit14.loopexit42, %114, %.lr.ph
  %178 = load float, float* %20, align 8
  %179 = fpext float %178 to double
  %180 = fcmp olt double %179, %110
  br i1 %180, label %184, label %.backedge

.backedge:                                        ; preds = %.backedge.loopexit44, %.loopexit14, %184
  %indvars.iv.next = add i64 %indvars.iv, 1
  %181 = load i32, i32* %17, align 8
  %182 = sext i32 %181 to i64
  %183 = icmp slt i64 %indvars.iv.next, %182
  br i1 %183, label %.lr.ph, label %.preheader15.loopexit

; <label>:184:                                    ; preds = %.loopexit14
  %185 = load float, float* %21, align 4
  %186 = fpext float %185 to double
  %187 = fcmp olt double %110, %186
  br i1 %187, label %.backedge.loopexit44, label %.backedge

.backedge.loopexit44:                             ; preds = %184
  %188 = fsub double %186, %110
  %189 = fmul double %188, 0x3FF921FB54442D18
  %190 = fsub float %185, %178
  %191 = fpext float %190 to double
  %192 = fdiv double %189, %191
  %193 = tail call double @cos(double %192) #4
  %194 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 0, i64 %indvars.iv
  %195 = load double, double* %194, align 8
  %196 = fmul double %193, %195
  store double %196, double* %194, align 8
  %197 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 1, i64 %indvars.iv
  %198 = load double, double* %197, align 8
  %199 = fmul double %193, %198
  store double %199, double* %197, align 8
  %200 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 2, i64 %indvars.iv
  %201 = load double, double* %200, align 8
  %202 = fmul double %193, %201
  store double %202, double* %200, align 8
  %203 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 3, i64 %indvars.iv
  %204 = load double, double* %203, align 8
  %205 = fmul double %193, %204
  store double %205, double* %203, align 8
  %206 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 4, i64 %indvars.iv
  %207 = load double, double* %206, align 8
  %208 = fmul double %193, %207
  store double %208, double* %206, align 8
  %209 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 5, i64 %indvars.iv
  %210 = load double, double* %209, align 8
  %211 = fmul double %193, %210
  store double %211, double* %209, align 8
  %212 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 6, i64 %indvars.iv
  %213 = load double, double* %212, align 8
  %214 = fmul double %193, %213
  store double %214, double* %212, align 8
  %215 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 7, i64 %indvars.iv
  %216 = load double, double* %215, align 8
  %217 = fmul double %193, %216
  store double %217, double* %215, align 8
  %218 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 8, i64 %indvars.iv
  %219 = load double, double* %218, align 8
  %220 = fmul double %193, %219
  store double %220, double* %218, align 8
  %221 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 9, i64 %indvars.iv
  %222 = load double, double* %221, align 8
  %223 = fmul double %193, %222
  store double %223, double* %221, align 8
  %224 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 10, i64 %indvars.iv
  %225 = load double, double* %224, align 8
  %226 = fmul double %193, %225
  store double %226, double* %224, align 8
  %227 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 11, i64 %indvars.iv
  %228 = load double, double* %227, align 8
  %229 = fmul double %193, %228
  store double %229, double* %227, align 8
  %230 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 12, i64 %indvars.iv
  %231 = load double, double* %230, align 8
  %232 = fmul double %193, %231
  store double %232, double* %230, align 8
  %233 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 13, i64 %indvars.iv
  %234 = load double, double* %233, align 8
  %235 = fmul double %193, %234
  store double %235, double* %233, align 8
  %236 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 14, i64 %indvars.iv
  %237 = load double, double* %236, align 8
  %238 = fmul double %193, %237
  store double %238, double* %236, align 8
  %239 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 15, i64 %indvars.iv
  %240 = load double, double* %239, align 8
  %241 = fmul double %193, %240
  store double %241, double* %239, align 8
  %242 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 16, i64 %indvars.iv
  %243 = load double, double* %242, align 8
  %244 = fmul double %193, %243
  store double %244, double* %242, align 8
  %245 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 17, i64 %indvars.iv
  %246 = load double, double* %245, align 8
  %247 = fmul double %193, %246
  store double %247, double* %245, align 8
  br label %.backedge

; <label>:248:                                    ; preds = %.loopexit, %.preheader15
  %indvars.iv51 = phi i64 [ 0, %.preheader15 ], [ %indvars.iv.next52, %.loopexit ]
  %.0130 = phi double* [ %83, %.preheader15 ], [ %462, %.loopexit ]
  %249 = load i32, i32* %86, align 8
  %250 = load i32, i32* %22, align 8
  %251 = sext i32 %250 to i64
  %252 = icmp slt i64 %indvars.iv51, %251
  br i1 %252, label %253, label %257

; <label>:253:                                    ; preds = %248
  %254 = load i32, i32* %23, align 4
  %255 = sext i32 %254 to i64
  %256 = icmp sgt i64 %indvars.iv51, %255
  br i1 %256, label %259, label %257

; <label>:257:                                    ; preds = %253, %248
  %258 = bitcast double* %.0130 to i8*
  tail call void @llvm.memset.p0i8.i64(i8* %258, i8 0, i64 144, i32 1, i1 false)
  br label %380

; <label>:259:                                    ; preds = %253
  %260 = icmp eq i32 %249, 2
  br i1 %260, label %.thread, label %.preheader12

.preheader12:                                     ; preds = %259
  %261 = sext i32 %249 to i64
  br label %349

.thread:                                          ; preds = %259
  %262 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 2), align 16
  %263 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %indvars.iv54, i64 8, i64 %indvars.iv51
  %264 = load double, double* %263, align 8
  %265 = fmul double %262, %264
  %266 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %indvars.iv54, i64 9, i64 %indvars.iv51
  %267 = load double, double* %266, align 8
  %268 = fsub double %265, %267
  store double %268, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 6), align 16
  %269 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %indvars.iv54, i64 14, i64 %indvars.iv51
  %270 = load double, double* %269, align 8
  %271 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %indvars.iv54, i64 15, i64 %indvars.iv51
  %272 = load double, double* %271, align 8
  %273 = fmul double %262, %272
  %274 = fadd double %270, %273
  store double %274, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 9), align 8
  %275 = fmul double %262, %270
  %276 = fsub double %275, %272
  store double %276, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 12), align 16
  %277 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 2, i64 %indvars.iv51
  %278 = load double, double* %277, align 8
  %279 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 3, i64 %indvars.iv51
  %280 = load double, double* %279, align 8
  %281 = fmul double %262, %280
  %282 = fadd double %278, %281
  store double %282, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 15), align 8
  %283 = fmul double %262, %278
  %284 = fsub double %283, %280
  store double %284, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 18), align 16
  %285 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 8, i64 %indvars.iv51
  %286 = load double, double* %285, align 8
  %287 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 9, i64 %indvars.iv51
  %288 = load double, double* %287, align 8
  %289 = fmul double %262, %288
  %290 = fadd double %286, %289
  store double %290, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 21), align 8
  %291 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 1), align 8
  %292 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %indvars.iv54, i64 7, i64 %indvars.iv51
  %293 = load double, double* %292, align 8
  %294 = fmul double %291, %293
  %295 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %indvars.iv54, i64 10, i64 %indvars.iv51
  %296 = load double, double* %295, align 8
  %297 = fsub double %294, %296
  store double %297, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 5), align 8
  %298 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %indvars.iv54, i64 13, i64 %indvars.iv51
  %299 = load double, double* %298, align 8
  %300 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %indvars.iv54, i64 16, i64 %indvars.iv51
  %301 = load double, double* %300, align 8
  %302 = fmul double %291, %301
  %303 = fadd double %299, %302
  store double %303, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 8), align 16
  %304 = fmul double %291, %299
  %305 = fsub double %304, %301
  store double %305, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 11), align 8
  %306 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 1, i64 %indvars.iv51
  %307 = load double, double* %306, align 8
  %308 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 4, i64 %indvars.iv51
  %309 = load double, double* %308, align 8
  %310 = fmul double %291, %309
  %311 = fadd double %307, %310
  store double %311, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 14), align 16
  %312 = fmul double %291, %307
  %313 = fsub double %312, %309
  store double %313, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 17), align 8
  %314 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 7, i64 %indvars.iv51
  %315 = load double, double* %314, align 8
  %316 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 10, i64 %indvars.iv51
  %317 = load double, double* %316, align 8
  %318 = fmul double %291, %317
  %319 = fadd double %315, %318
  store double %319, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 20), align 16
  %320 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 0), align 16
  %321 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %indvars.iv54, i64 6, i64 %indvars.iv51
  %322 = load double, double* %321, align 8
  %323 = fmul double %320, %322
  %324 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %indvars.iv54, i64 11, i64 %indvars.iv51
  %325 = load double, double* %324, align 8
  %326 = fsub double %323, %325
  store double %326, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 4), align 16
  %327 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %indvars.iv54, i64 12, i64 %indvars.iv51
  %328 = load double, double* %327, align 8
  %329 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %indvars.iv54, i64 17, i64 %indvars.iv51
  %330 = load double, double* %329, align 8
  %331 = fmul double %320, %330
  %332 = fadd double %328, %331
  store double %332, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 7), align 8
  %333 = fmul double %320, %328
  %334 = fsub double %333, %330
  store double %334, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 10), align 16
  %335 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 0, i64 %indvars.iv51
  %336 = load double, double* %335, align 8
  %337 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 5, i64 %indvars.iv51
  %338 = load double, double* %337, align 8
  %339 = fmul double %320, %338
  %340 = fadd double %336, %339
  store double %340, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 13), align 8
  %341 = fmul double %320, %336
  %342 = fsub double %341, %338
  store double %342, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 16), align 16
  %343 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 6, i64 %indvars.iv51
  %344 = load double, double* %343, align 8
  %345 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 11, i64 %indvars.iv51
  %346 = load double, double* %345, align 8
  %347 = fmul double %320, %346
  %348 = fadd double %344, %347
  store double %348, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 19), align 8
  tail call fastcc void @mdct_short(double* %.0130)
  br label %.loopexit

; <label>:349:                                    ; preds = %.preheader12, %349
  %indvars.iv45 = phi i64 [ 8, %.preheader12 ], [ %indvars.iv.next46, %349 ]
  %350 = getelementptr inbounds [4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 %261, i64 %indvars.iv45
  %351 = load double, double* %350, align 8
  %352 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %indvars.iv54, i64 %indvars.iv45, i64 %indvars.iv51
  %353 = load double, double* %352, align 8
  %354 = fmul double %351, %353
  %355 = add nuw nsw i64 %indvars.iv45, 9
  %356 = getelementptr inbounds [4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 %261, i64 %355
  %357 = load double, double* %356, align 8
  %358 = sub nuw nsw i64 17, %indvars.iv45
  %359 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %indvars.iv54, i64 %358, i64 %indvars.iv51
  %360 = load double, double* %359, align 8
  %361 = fmul double %357, %360
  %362 = fsub double %354, %361
  %363 = getelementptr inbounds double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 4), i64 %indvars.iv45
  store double %362, double* %363, align 8
  %364 = add nuw nsw i64 %indvars.iv45, 18
  %365 = getelementptr inbounds [4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 %261, i64 %364
  %366 = load double, double* %365, align 8
  %367 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 %indvars.iv45, i64 %indvars.iv51
  %368 = load double, double* %367, align 8
  %369 = fmul double %366, %368
  %370 = add nuw nsw i64 %indvars.iv45, 27
  %371 = getelementptr inbounds [4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 %261, i64 %370
  %372 = load double, double* %371, align 8
  %373 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 %26, i64 %358, i64 %indvars.iv51
  %374 = load double, double* %373, align 8
  %375 = fmul double %372, %374
  %376 = fadd double %369, %375
  %377 = getelementptr inbounds double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 4), i64 %355
  store double %376, double* %377, align 8
  %indvars.iv.next46 = add nsw i64 %indvars.iv45, -1
  %378 = icmp sgt i64 %indvars.iv45, 0
  br i1 %378, label %349, label %379

; <label>:379:                                    ; preds = %349
  tail call fastcc void @mdct_long(double* %.0130)
  br label %380

; <label>:380:                                    ; preds = %379, %257
  %381 = icmp eq i32 %249, 2
  %382 = icmp eq i64 %indvars.iv51, 0
  %or.cond = or i1 %382, %381
  br i1 %or.cond, label %.loopexit, label %.preheader

.preheader:                                       ; preds = %380
  %383 = getelementptr inbounds double, double* %.0130, i64 7
  %384 = load double, double* %383, align 8
  %385 = fmul double %384, %87
  %386 = getelementptr inbounds double, double* %.0130, i64 -8
  %387 = load double, double* %386, align 8
  %388 = fmul double %387, %88
  %389 = fadd double %385, %388
  %390 = fmul double %384, %88
  %391 = fmul double %87, %387
  %392 = fsub double %390, %391
  store double %389, double* %386, align 8
  store double %392, double* %383, align 8
  %393 = getelementptr inbounds double, double* %.0130, i64 6
  %394 = load double, double* %393, align 8
  %395 = fmul double %394, %89
  %396 = getelementptr inbounds double, double* %.0130, i64 -7
  %397 = load double, double* %396, align 8
  %398 = fmul double %397, %90
  %399 = fadd double %395, %398
  %400 = fmul double %394, %90
  %401 = fmul double %89, %397
  %402 = fsub double %400, %401
  store double %399, double* %396, align 8
  store double %402, double* %393, align 8
  %403 = getelementptr inbounds double, double* %.0130, i64 5
  %404 = load double, double* %403, align 8
  %405 = fmul double %404, %91
  %406 = getelementptr inbounds double, double* %.0130, i64 -6
  %407 = load double, double* %406, align 8
  %408 = fmul double %407, %92
  %409 = fadd double %405, %408
  %410 = fmul double %404, %92
  %411 = fmul double %91, %407
  %412 = fsub double %410, %411
  store double %409, double* %406, align 8
  store double %412, double* %403, align 8
  %413 = getelementptr inbounds double, double* %.0130, i64 4
  %414 = load double, double* %413, align 8
  %415 = fmul double %414, %93
  %416 = getelementptr inbounds double, double* %.0130, i64 -5
  %417 = load double, double* %416, align 8
  %418 = fmul double %417, %94
  %419 = fadd double %415, %418
  %420 = fmul double %414, %94
  %421 = fmul double %93, %417
  %422 = fsub double %420, %421
  store double %419, double* %416, align 8
  store double %422, double* %413, align 8
  %423 = getelementptr inbounds double, double* %.0130, i64 3
  %424 = load double, double* %423, align 8
  %425 = fmul double %424, %95
  %426 = getelementptr inbounds double, double* %.0130, i64 -4
  %427 = load double, double* %426, align 8
  %428 = fmul double %427, %96
  %429 = fadd double %425, %428
  %430 = fmul double %424, %96
  %431 = fmul double %95, %427
  %432 = fsub double %430, %431
  store double %429, double* %426, align 8
  store double %432, double* %423, align 8
  %433 = getelementptr inbounds double, double* %.0130, i64 2
  %434 = load double, double* %433, align 8
  %435 = fmul double %434, %97
  %436 = getelementptr inbounds double, double* %.0130, i64 -3
  %437 = load double, double* %436, align 8
  %438 = fmul double %437, %98
  %439 = fadd double %435, %438
  %440 = fmul double %434, %98
  %441 = fmul double %97, %437
  %442 = fsub double %440, %441
  store double %439, double* %436, align 8
  store double %442, double* %433, align 8
  %443 = getelementptr inbounds double, double* %.0130, i64 1
  %444 = load double, double* %443, align 8
  %445 = fmul double %444, %99
  %446 = getelementptr inbounds double, double* %.0130, i64 -2
  %447 = load double, double* %446, align 8
  %448 = fmul double %447, %100
  %449 = fadd double %445, %448
  %450 = fmul double %444, %100
  %451 = fmul double %99, %447
  %452 = fsub double %450, %451
  store double %449, double* %446, align 8
  store double %452, double* %443, align 8
  %453 = load double, double* %.0130, align 8
  %454 = fmul double %453, %101
  %455 = getelementptr inbounds double, double* %.0130, i64 -1
  %456 = load double, double* %455, align 8
  %457 = fmul double %456, %102
  %458 = fadd double %454, %457
  %459 = fmul double %453, %102
  %460 = fmul double %101, %456
  %461 = fsub double %459, %460
  store double %458, double* %455, align 8
  store double %461, double* %.0130, align 8
  br label %.loopexit

.loopexit:                                        ; preds = %.thread, %.preheader, %380
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %462 = getelementptr inbounds double, double* %.0130, i64 18
  %exitcond53 = icmp eq i64 %indvars.iv.next52, 32
  br i1 %exitcond53, label %463, label %248

; <label>:463:                                    ; preds = %.loopexit
  %indvars.iv.next55 = add nuw i64 %indvars.iv54, 1
  %464 = load i32, i32* %14, align 8
  %465 = sext i32 %464 to i64
  %466 = icmp slt i64 %indvars.iv.next55, %465
  br i1 %466, label %.lr.ph35, label %._crit_edge

._crit_edge:                                      ; preds = %463
  %467 = icmp eq i32 %464, 1
  br i1 %467, label %468, label %._crit_edge.thread

; <label>:468:                                    ; preds = %._crit_edge
  %469 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 1, i64 0
  %470 = bitcast [32 x double]* %469 to i8*
  %471 = getelementptr inbounds [2 x [2 x [18 x [32 x double]]]], [2 x [2 x [18 x [32 x double]]]]* @sb_sample, i64 0, i64 %indvars.iv56, i64 0, i64 0
  %472 = bitcast [32 x double]* %471 to i8*
  tail call void @llvm.memcpy.p0i8.p0i8.i64(i8* %472, i8* %470, i64 4608, i32 16, i1 false)
  br label %._crit_edge.thread

._crit_edge.thread:                               ; preds = %.preheader16, %._crit_edge, %468
  %indvars.iv.next57 = add nuw i64 %indvars.iv56, 1
  %473 = load i32, i32* %11, align 4
  %474 = sext i32 %473 to i64
  %475 = icmp slt i64 %indvars.iv.next57, %474
  br i1 %475, label %.preheader16, label %._crit_edge38.loopexit

._crit_edge38.loopexit:                           ; preds = %._crit_edge.thread
  br label %._crit_edge38

._crit_edge38:                                    ; preds = %._crit_edge38.loopexit, %.preheader17
  ret void
}

; Function Attrs: noinline nounwind uwtable
define void @mdct_init48() local_unnamed_addr #0 {
.preheader49.preheader170:
  %0 = alloca [31 x double], align 16
  store double 0xBFE076BFCD6FBECD, double* getelementptr inbounds ([8 x double], [8 x double]* @ca, i64 0, i64 0), align 16
  store double 0x3FEB7095010F9356, double* getelementptr inbounds ([8 x double], [8 x double]* @cs, i64 0, i64 0), align 16
  store double 0xBFDE30DB485DB660, double* getelementptr inbounds ([8 x double], [8 x double]* @ca, i64 0, i64 1), align 8
  store double 0x3FEC373AFE3FA80C, double* getelementptr inbounds ([8 x double], [8 x double]* @cs, i64 0, i64 1), align 8
  store double 0xBFD40E604F4701FC, double* getelementptr inbounds ([8 x double], [8 x double]* @ca, i64 0, i64 2), align 16
  store double 0x3FEE635B9EE7B56E, double* getelementptr inbounds ([8 x double], [8 x double]* @cs, i64 0, i64 2), align 16
  store double 0xBFC748EE85851AEC, double* getelementptr inbounds ([8 x double], [8 x double]* @ca, i64 0, i64 3), align 8
  store double 0x3FEF77502A0DD15B, double* getelementptr inbounds ([8 x double], [8 x double]* @cs, i64 0, i64 3), align 8
  store double 0xBFB83603A7F2535A, double* getelementptr inbounds ([8 x double], [8 x double]* @ca, i64 0, i64 4), align 16
  store double 0x3FEFDB482DD30F5B, double* getelementptr inbounds ([8 x double], [8 x double]* @cs, i64 0, i64 4), align 16
  store double 0xBFA4F970DD8206D0, double* getelementptr inbounds ([8 x double], [8 x double]* @ca, i64 0, i64 5), align 8
  store double 0x3FEFF91F901A8104, double* getelementptr inbounds ([8 x double], [8 x double]* @cs, i64 0, i64 5), align 8
  store double 0xBF8D14239D59A7C1, double* getelementptr inbounds ([8 x double], [8 x double]* @ca, i64 0, i64 6), align 16
  store double 0x3FEFFF2C98DBE44E, double* getelementptr inbounds ([8 x double], [8 x double]* @cs, i64 0, i64 6), align 16
  store double 0xBF6E4F68C708D3F4, double* getelementptr inbounds ([8 x double], [8 x double]* @ca, i64 0, i64 7), align 8
  store double 0x3FEFFFF1A52805D2, double* getelementptr inbounds ([8 x double], [8 x double]* @cs, i64 0, i64 7), align 8
  br label %.preheader49

.preheader49:                                     ; preds = %.preheader49, %.preheader49.preheader170
  %indvars.iv164 = phi i64 [ 0, %.preheader49.preheader170 ], [ %indvars.iv.next165.3, %.preheader49 ]
  %1 = trunc i64 %indvars.iv164 to i32
  %2 = sitofp i32 %1 to double
  %3 = fadd double %2, 5.000000e-01
  %4 = fmul double %3, 0x3FB657184AE74487
  %5 = tail call double @sin(double %4) #4
  %6 = getelementptr inbounds [4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 %indvars.iv164
  store double %5, double* %6, align 16
  %indvars.iv.next165 = or i64 %indvars.iv164, 1
  %7 = trunc i64 %indvars.iv.next165 to i32
  %8 = sitofp i32 %7 to double
  %9 = fadd double %8, 5.000000e-01
  %10 = fmul double %9, 0x3FB657184AE74487
  %11 = tail call double @sin(double %10) #4
  %12 = getelementptr inbounds [4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 %indvars.iv.next165
  store double %11, double* %12, align 8
  %indvars.iv.next165.1 = or i64 %indvars.iv164, 2
  %13 = trunc i64 %indvars.iv.next165.1 to i32
  %14 = sitofp i32 %13 to double
  %15 = fadd double %14, 5.000000e-01
  %16 = fmul double %15, 0x3FB657184AE74487
  %17 = tail call double @sin(double %16) #4
  %18 = getelementptr inbounds [4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 %indvars.iv.next165.1
  store double %17, double* %18, align 16
  %indvars.iv.next165.2 = or i64 %indvars.iv164, 3
  %19 = trunc i64 %indvars.iv.next165.2 to i32
  %20 = sitofp i32 %19 to double
  %21 = fadd double %20, 5.000000e-01
  %22 = fmul double %21, 0x3FB657184AE74487
  %23 = tail call double @sin(double %22) #4
  %24 = getelementptr inbounds [4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 %indvars.iv.next165.2
  store double %23, double* %24, align 8
  %indvars.iv.next165.3 = add nsw i64 %indvars.iv164, 4
  %exitcond166.3 = icmp eq i64 %indvars.iv.next165.3, 36
  br i1 %exitcond166.3, label %.lr.ph85.prol.preheader, label %.preheader49

.lr.ph85.prol.preheader:                          ; preds = %.preheader49
  %25 = load i64, i64* bitcast ([4 x [36 x double]]* @win to i64*), align 16
  store i64 %25, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 0) to i64*), align 16
  %26 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 1) to i64*), align 8
  store i64 %26, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 1) to i64*), align 8
  %27 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 2) to i64*), align 16
  store i64 %27, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 2) to i64*), align 16
  %28 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 3) to i64*), align 8
  store i64 %28, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 3) to i64*), align 8
  %29 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 4) to i64*), align 16
  store i64 %29, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 4) to i64*), align 16
  %30 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 5) to i64*), align 8
  store i64 %30, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 5) to i64*), align 8
  %31 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 6) to i64*), align 16
  store i64 %31, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 6) to i64*), align 16
  %32 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 7) to i64*), align 8
  store i64 %32, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 7) to i64*), align 8
  %33 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 8) to i64*), align 16
  store i64 %33, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 8) to i64*), align 16
  %34 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 9) to i64*), align 8
  store i64 %34, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 9) to i64*), align 8
  %35 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 10) to i64*), align 16
  store i64 %35, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 10) to i64*), align 16
  %36 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 11) to i64*), align 8
  store i64 %36, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 11) to i64*), align 8
  %37 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 12) to i64*), align 16
  store i64 %37, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 12) to i64*), align 16
  %38 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 13) to i64*), align 8
  store i64 %38, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 13) to i64*), align 8
  %39 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 14) to i64*), align 16
  store i64 %39, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 14) to i64*), align 16
  %40 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 15) to i64*), align 8
  store i64 %40, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 15) to i64*), align 8
  %41 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 16) to i64*), align 16
  store i64 %41, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 16) to i64*), align 16
  %42 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 17) to i64*), align 8
  store i64 %42, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 17) to i64*), align 8
  br label %.lr.ph85.prol

.lr.ph85.prol:                                    ; preds = %.lr.ph85.prol, %.lr.ph85.prol.preheader
  %indvars.iv155.prol = phi i64 [ 18, %.lr.ph85.prol.preheader ], [ %indvars.iv.next156.prol, %.lr.ph85.prol ]
  %prol.iter160 = phi i32 [ 6, %.lr.ph85.prol.preheader ], [ %prol.iter160.sub, %.lr.ph85.prol ]
  %43 = getelementptr inbounds [4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 %indvars.iv155.prol
  store double 1.000000e+00, double* %43, align 8
  %indvars.iv.next156.prol = add nsw i64 %indvars.iv155.prol, 1
  %prol.iter160.sub = add i32 %prol.iter160, -1
  %prol.iter160.cmp = icmp eq i32 %prol.iter160.sub, 0
  br i1 %prol.iter160.cmp, label %.lr.ph83.prol.preheader, label %.lr.ph85.prol, !llvm.loop !1

.lr.ph83.prol.preheader:                          ; preds = %.lr.ph85.prol
  br label %.lr.ph83.prol

.lr.ph83.prol:                                    ; preds = %.lr.ph83.prol.preheader, %.lr.ph83.prol
  %indvars.iv152.prol = phi i64 [ %indvars.iv.next153.prol, %.lr.ph83.prol ], [ 24, %.lr.ph83.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph83.prol ], [ 2, %.lr.ph83.prol.preheader ]
  %44 = trunc i64 %indvars.iv152.prol to i32
  %45 = sitofp i32 %44 to double
  %46 = fadd double %45, 5.000000e-01
  %47 = fmul double %46, 0x3FD0C152382D7365
  %48 = tail call double @cos(double %47) #4
  %49 = getelementptr inbounds [4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 %indvars.iv152.prol
  store double %48, double* %49, align 8
  %indvars.iv.next153.prol = add nsw i64 %indvars.iv152.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph83.preheader, label %.lr.ph83.prol, !llvm.loop !3

.lr.ph83.preheader:                               ; preds = %.lr.ph83.prol
  br label %.lr.ph83

.lr.ph83:                                         ; preds = %.lr.ph83.preheader, %.lr.ph83
  %indvars.iv152 = phi i64 [ %indvars.iv.next153.3, %.lr.ph83 ], [ %indvars.iv.next153.prol, %.lr.ph83.preheader ]
  %50 = trunc i64 %indvars.iv152 to i32
  %51 = sitofp i32 %50 to double
  %52 = fadd double %51, 5.000000e-01
  %53 = fmul double %52, 0x3FD0C152382D7365
  %54 = tail call double @cos(double %53) #4
  %55 = getelementptr inbounds [4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 %indvars.iv152
  store double %54, double* %55, align 8
  %indvars.iv.next153 = add nsw i64 %indvars.iv152, 1
  %56 = trunc i64 %indvars.iv.next153 to i32
  %57 = sitofp i32 %56 to double
  %58 = fadd double %57, 5.000000e-01
  %59 = fmul double %58, 0x3FD0C152382D7365
  %60 = tail call double @cos(double %59) #4
  %61 = getelementptr inbounds [4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 %indvars.iv.next153
  store double %60, double* %61, align 8
  %indvars.iv.next153.1 = add nsw i64 %indvars.iv152, 2
  %62 = trunc i64 %indvars.iv.next153.1 to i32
  %63 = sitofp i32 %62 to double
  %64 = fadd double %63, 5.000000e-01
  %65 = fmul double %64, 0x3FD0C152382D7365
  %66 = tail call double @cos(double %65) #4
  %67 = getelementptr inbounds [4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 %indvars.iv.next153.1
  store double %66, double* %67, align 8
  %indvars.iv.next153.2 = add nsw i64 %indvars.iv152, 3
  %68 = trunc i64 %indvars.iv.next153.2 to i32
  %69 = sitofp i32 %68 to double
  %70 = fadd double %69, 5.000000e-01
  %71 = fmul double %70, 0x3FD0C152382D7365
  %72 = tail call double @cos(double %71) #4
  %73 = getelementptr inbounds [4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 %indvars.iv.next153.2
  store double %72, double* %73, align 8
  %indvars.iv.next153.3 = add nsw i64 %indvars.iv152, 4
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next153.3 to i32
  %exitcond154.3 = icmp eq i32 %lftr.wideiv.3, 30
  br i1 %exitcond154.3, label %.preheader44, label %.lr.ph83

.preheader44:                                     ; preds = %.lr.ph83
  call void @llvm.memset.p0i8.i64(i8* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 30) to i8*), i8 0, i64 48, i32 16, i1 false)
  %74 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 35) to i64*), align 8
  store i64 %74, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 0) to i64*), align 16
  %75 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 34) to i64*), align 16
  store i64 %75, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 1) to i64*), align 8
  %76 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 33) to i64*), align 8
  store i64 %76, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 2) to i64*), align 16
  %77 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 32) to i64*), align 16
  store i64 %77, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 3) to i64*), align 8
  %78 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 31) to i64*), align 8
  store i64 %78, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 4) to i64*), align 16
  %79 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 30) to i64*), align 16
  store i64 %79, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 5) to i64*), align 8
  %80 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 29) to i64*), align 8
  store i64 %80, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 6) to i64*), align 16
  %81 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 28) to i64*), align 16
  store i64 %81, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 7) to i64*), align 8
  %82 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 27) to i64*), align 8
  store i64 %82, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 8) to i64*), align 16
  %83 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 26) to i64*), align 16
  store i64 %83, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 9) to i64*), align 8
  %84 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 25) to i64*), align 8
  store i64 %84, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 10) to i64*), align 16
  %85 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 24) to i64*), align 16
  store i64 %85, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 11) to i64*), align 8
  %86 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 23) to i64*), align 8
  store i64 %86, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 12) to i64*), align 16
  %87 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 22) to i64*), align 16
  store i64 %87, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 13) to i64*), align 8
  %88 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 21) to i64*), align 8
  store i64 %88, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 14) to i64*), align 16
  %89 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 20) to i64*), align 16
  store i64 %89, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 15) to i64*), align 8
  %90 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 19) to i64*), align 8
  store i64 %90, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 16) to i64*), align 16
  %91 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 18) to i64*), align 16
  store i64 %91, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 17) to i64*), align 8
  %92 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 17) to i64*), align 8
  store i64 %92, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 18) to i64*), align 16
  %93 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 16) to i64*), align 16
  store i64 %93, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 19) to i64*), align 8
  %94 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 15) to i64*), align 8
  store i64 %94, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 20) to i64*), align 16
  %95 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 14) to i64*), align 16
  store i64 %95, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 21) to i64*), align 8
  %96 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 13) to i64*), align 8
  store i64 %96, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 22) to i64*), align 16
  %97 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 12) to i64*), align 16
  store i64 %97, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 23) to i64*), align 8
  %98 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 11) to i64*), align 8
  store i64 %98, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 24) to i64*), align 16
  %99 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 10) to i64*), align 16
  store i64 %99, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 25) to i64*), align 8
  %100 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 9) to i64*), align 8
  store i64 %100, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 26) to i64*), align 16
  %101 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 8) to i64*), align 16
  store i64 %101, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 27) to i64*), align 8
  %102 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 7) to i64*), align 8
  store i64 %102, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 28) to i64*), align 16
  %103 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 6) to i64*), align 16
  store i64 %103, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 29) to i64*), align 8
  %104 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 5) to i64*), align 8
  store i64 %104, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 30) to i64*), align 16
  %105 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 4) to i64*), align 16
  store i64 %105, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 31) to i64*), align 8
  %106 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 3) to i64*), align 8
  store i64 %106, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 32) to i64*), align 16
  %107 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 2) to i64*), align 16
  store i64 %107, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 33) to i64*), align 8
  %108 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 1) to i64*), align 8
  store i64 %108, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 34) to i64*), align 16
  %109 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 0) to i64*), align 16
  store i64 %109, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 35) to i64*), align 8
  br label %110

; <label>:110:                                    ; preds = %.preheader44, %110
  %indvars.iv142 = phi i64 [ 11, %.preheader44 ], [ %indvars.iv.next143, %110 ]
  %.016 = phi double* [ getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 0), %.preheader44 ], [ %scevgep140, %110 ]
  %111 = getelementptr inbounds [12 x i32], [12 x i32]* @all, i64 0, i64 %indvars.iv142
  %112 = load i32, i32* %111, align 4
  %113 = shl nsw i32 %112, 1
  %114 = or i32 %113, 1
  %115 = sitofp i32 %114 to double
  %116 = fmul double %115, 0x3F9657184AE74487
  %117 = fmul double %116, 3.800000e+01
  %118 = tail call double @cos(double %117) #4
  %119 = fmul double %118, 0x3FBC71C71C71C71C
  store double %119, double* %.016, align 8
  %120 = getelementptr inbounds double, double* %.016, i64 1
  %121 = fmul double %116, 4.200000e+01
  %122 = tail call double @cos(double %121) #4
  %123 = fmul double %122, 0x3FBC71C71C71C71C
  store double %123, double* %120, align 8
  %124 = getelementptr inbounds double, double* %.016, i64 2
  %125 = fmul double %116, 4.600000e+01
  %126 = tail call double @cos(double %125) #4
  %127 = fmul double %126, 0x3FBC71C71C71C71C
  store double %127, double* %124, align 8
  %128 = getelementptr inbounds double, double* %.016, i64 3
  %129 = fmul double %116, 5.000000e+01
  %130 = tail call double @cos(double %129) #4
  %131 = fmul double %130, 0x3FBC71C71C71C71C
  store double %131, double* %128, align 8
  %132 = getelementptr inbounds double, double* %.016, i64 4
  %133 = fmul double %116, 5.400000e+01
  %134 = tail call double @cos(double %133) #4
  %135 = fmul double %134, 0x3FBC71C71C71C71C
  store double %135, double* %132, align 8
  %136 = getelementptr inbounds double, double* %.016, i64 5
  %137 = fmul double %116, 5.800000e+01
  %138 = tail call double @cos(double %137) #4
  %139 = fmul double %138, 0x3FBC71C71C71C71C
  store double %139, double* %136, align 8
  %140 = getelementptr inbounds double, double* %.016, i64 6
  %141 = fmul double %116, 6.200000e+01
  %142 = tail call double @cos(double %141) #4
  %143 = fmul double %142, 0x3FBC71C71C71C71C
  store double %143, double* %140, align 8
  %144 = getelementptr inbounds double, double* %.016, i64 7
  %145 = fmul double %116, 6.600000e+01
  %146 = tail call double @cos(double %145) #4
  %147 = fmul double %146, 0x3FBC71C71C71C71C
  store double %147, double* %144, align 8
  %148 = getelementptr inbounds double, double* %.016, i64 8
  %149 = fmul double %116, 7.000000e+01
  %150 = tail call double @cos(double %149) #4
  %151 = fmul double %150, 0x3FBC71C71C71C71C
  store double %151, double* %148, align 8
  %152 = shl nsw i32 %112, 1
  %153 = or i32 %152, 1
  %154 = sitofp i32 %153 to double
  %155 = fmul double %154, 0x3F9657184AE74487
  %scevgep137 = getelementptr double, double* %.016, i64 9
  %156 = fmul double %155, 1.100000e+02
  %157 = tail call double @cos(double %156) #4
  %158 = fmul double %157, 0x3FBC71C71C71C71C
  store double %158, double* %scevgep137, align 8
  %159 = getelementptr inbounds double, double* %.016, i64 10
  %160 = fmul double %155, 1.140000e+02
  %161 = tail call double @cos(double %160) #4
  %162 = fmul double %161, 0x3FBC71C71C71C71C
  store double %162, double* %159, align 8
  %163 = getelementptr inbounds double, double* %.016, i64 11
  %164 = fmul double %155, 1.180000e+02
  %165 = tail call double @cos(double %164) #4
  %166 = fmul double %165, 0x3FBC71C71C71C71C
  store double %166, double* %163, align 8
  %167 = getelementptr inbounds double, double* %.016, i64 12
  %168 = fmul double %155, 1.220000e+02
  %169 = tail call double @cos(double %168) #4
  %170 = fmul double %169, 0x3FBC71C71C71C71C
  store double %170, double* %167, align 8
  %171 = getelementptr inbounds double, double* %.016, i64 13
  %172 = fmul double %155, 1.260000e+02
  %173 = tail call double @cos(double %172) #4
  %174 = fmul double %173, 0x3FBC71C71C71C71C
  store double %174, double* %171, align 8
  %175 = getelementptr inbounds double, double* %.016, i64 14
  %176 = fmul double %155, 1.300000e+02
  %177 = tail call double @cos(double %176) #4
  %178 = fmul double %177, 0x3FBC71C71C71C71C
  store double %178, double* %175, align 8
  %179 = getelementptr inbounds double, double* %.016, i64 15
  %180 = fmul double %155, 1.340000e+02
  %181 = tail call double @cos(double %180) #4
  %182 = fmul double %181, 0x3FBC71C71C71C71C
  store double %182, double* %179, align 8
  %183 = getelementptr inbounds double, double* %.016, i64 16
  %184 = fmul double %155, 1.380000e+02
  %185 = tail call double @cos(double %184) #4
  %186 = fmul double %185, 0x3FBC71C71C71C71C
  store double %186, double* %183, align 8
  %187 = getelementptr inbounds double, double* %.016, i64 17
  %188 = fmul double %155, 1.420000e+02
  %189 = tail call double @cos(double %188) #4
  %190 = fmul double %189, 0x3FBC71C71C71C71C
  store double %190, double* %187, align 8
  %scevgep140 = getelementptr double, double* %.016, i64 18
  %indvars.iv.next143 = add nsw i64 %indvars.iv142, -1
  %191 = icmp sgt i64 %indvars.iv142, 0
  br i1 %191, label %110, label %.preheader38.preheader122

.preheader38.preheader122:                        ; preds = %110
  store double 0xBFB150DD8DD9D8BF, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 216), align 16
  store double 0x3FA5C53B3ED42489, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 217), align 8
  store double 0xBF8DB3B3A9A67635, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 218), align 16
  store double 0x3FB69105D1310418, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 219), align 8
  store double 0xBFBA477C4665D2FD, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 220), align 16
  store double 0x3FBC337B2D43EB39, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 221), align 8
  store double 0x3F8DB3B3A9A6765A, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 222), align 16
  store double 0x3FBA477C4665D2EF, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 223), align 8
  store double 0xBFB150DD8DD9D8C0, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 224), align 16
  store double 0xBFBC337B2D43EB38, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 225), align 8
  store double 0x3FA5C53B3ED424BF, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 226), align 16
  store double 0x3FB69105D1310415, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 227), align 8
  store double 0x3FBC337B2D43EB35, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 228), align 16
  store double 0x3FA5C53B3ED424BE, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 229), align 8
  store double 0xBFB69105D1310415, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 230), align 16
  store double 0x3F8DB3B3A9A676B8, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 231), align 8
  store double 0xBFBA477C4665D2EA, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 232), align 16
  store double 0xBFB150DD8DD9D8CB, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 233), align 8
  store double 0xBFB69105D131040F, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 234), align 16
  store double 0xBFBA477C4665D2E8, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 235), align 8
  store double 0xBFBC337B2D43EB34, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 236), align 16
  store double 0xBFB150DD8DD9D8D2, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 237), align 8
  store double 0xBFA5C53B3ED424D2, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 238), align 16
  store double 0xBF8DB3B3A9A67701, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 239), align 8
  store double 0xBFBA477C4665D2F0, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 240), align 16
  store double 0xBFA5C53B3ED424C1, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 241), align 8
  store double 0x3FA5C53B3ED424D4, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 242), align 16
  store double 0xBFBA477C4665D2E6, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 243), align 8
  %192 = load double, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 248), align 16
  %193 = load double, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 0), align 16
  %194 = fdiv double %193, %192
  %195 = getelementptr inbounds [31 x double], [31 x double]* %0, i64 0, i64 15
  store double %194, double* %195, align 8
  %196 = load double, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 1), align 8
  %197 = fdiv double %196, %193
  store double %197, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 0), align 16
  %198 = load double, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 2), align 16
  %199 = fdiv double %198, %193
  store double %199, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 1), align 8
  %200 = load double, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 3), align 8
  %201 = fdiv double %200, %193
  store double %201, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 2), align 16
  %202 = load double, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 4), align 16
  %203 = fdiv double %202, %193
  store double %203, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 3), align 8
  %204 = load double, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 5), align 8
  %205 = fdiv double %204, %193
  store double %205, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 4), align 16
  %206 = load double, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 6), align 16
  %207 = fdiv double %206, %193
  store double %207, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 5), align 8
  %208 = load double, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 7), align 8
  %209 = fdiv double %208, %193
  store double %209, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 6), align 16
  br label %210

; <label>:210:                                    ; preds = %210, %.preheader38.preheader122
  %indvars.iv117 = phi i64 [ 14, %.preheader38.preheader122 ], [ %indvars.iv.next118, %210 ]
  %.11367 = phi double* [ getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 7), %.preheader38.preheader122 ], [ %scevgep114, %210 ]
  %.12766 = phi double* [ getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 8), %.preheader38.preheader122 ], [ %scevgep115, %210 ]
  %211 = load double, double* %.12766, align 8
  %212 = fdiv double %211, %192
  %213 = sub nuw nsw i64 30, %indvars.iv117
  %214 = getelementptr inbounds [31 x double], [31 x double]* %0, i64 0, i64 %213
  store double %212, double* %214, align 8
  %215 = getelementptr inbounds [31 x double], [31 x double]* %0, i64 0, i64 %indvars.iv117
  store double %212, double* %215, align 8
  %.22862 = getelementptr inbounds double, double* %.12766, i64 1
  %scevgep114 = getelementptr double, double* %.11367, i64 15
  %216 = load double, double* %.22862, align 8
  %217 = fdiv double %216, %211
  store double %217, double* %.11367, align 8
  %218 = getelementptr inbounds double, double* %.11367, i64 1
  %.228 = getelementptr inbounds double, double* %.12766, i64 2
  %219 = load double, double* %.228, align 8
  %220 = fdiv double %219, %211
  store double %220, double* %218, align 8
  %221 = getelementptr inbounds double, double* %.11367, i64 2
  %.228.1 = getelementptr inbounds double, double* %.12766, i64 3
  %222 = load double, double* %.228.1, align 8
  %223 = fdiv double %222, %211
  store double %223, double* %221, align 8
  %224 = getelementptr inbounds double, double* %.11367, i64 3
  %.228.2 = getelementptr inbounds double, double* %.12766, i64 4
  %225 = load double, double* %.228.2, align 8
  %226 = fdiv double %225, %211
  store double %226, double* %224, align 8
  %227 = getelementptr inbounds double, double* %.11367, i64 4
  %.228.3 = getelementptr inbounds double, double* %.12766, i64 5
  %228 = load double, double* %.228.3, align 8
  %229 = fdiv double %228, %211
  store double %229, double* %227, align 8
  %230 = getelementptr inbounds double, double* %.11367, i64 5
  %.228.4 = getelementptr inbounds double, double* %.12766, i64 6
  %231 = load double, double* %.228.4, align 8
  %232 = fdiv double %231, %211
  store double %232, double* %230, align 8
  %233 = getelementptr inbounds double, double* %.11367, i64 6
  %.228.5 = getelementptr inbounds double, double* %.12766, i64 7
  %234 = load double, double* %.228.5, align 8
  %235 = fdiv double %234, %211
  store double %235, double* %233, align 8
  %236 = getelementptr inbounds double, double* %.11367, i64 7
  %.228.6 = getelementptr inbounds double, double* %.12766, i64 8
  %237 = load double, double* %.228.6, align 8
  %238 = fdiv double %237, %211
  store double %238, double* %236, align 8
  %239 = getelementptr inbounds double, double* %.11367, i64 8
  %.228.7 = getelementptr inbounds double, double* %.12766, i64 9
  %240 = load double, double* %.228.7, align 8
  %241 = fdiv double %240, %211
  store double %241, double* %239, align 8
  %242 = getelementptr inbounds double, double* %.11367, i64 9
  %.228.8 = getelementptr inbounds double, double* %.12766, i64 10
  %243 = load double, double* %.228.8, align 8
  %244 = fdiv double %243, %211
  store double %244, double* %242, align 8
  %245 = getelementptr inbounds double, double* %.11367, i64 10
  %.228.9 = getelementptr inbounds double, double* %.12766, i64 11
  %246 = load double, double* %.228.9, align 8
  %247 = fdiv double %246, %211
  store double %247, double* %245, align 8
  %248 = getelementptr inbounds double, double* %.11367, i64 11
  %.228.10 = getelementptr inbounds double, double* %.12766, i64 12
  %249 = load double, double* %.228.10, align 8
  %250 = fdiv double %249, %211
  store double %250, double* %248, align 8
  %251 = getelementptr inbounds double, double* %.11367, i64 12
  %.228.11 = getelementptr inbounds double, double* %.12766, i64 13
  %252 = load double, double* %.228.11, align 8
  %253 = fdiv double %252, %211
  store double %253, double* %251, align 8
  %254 = getelementptr inbounds double, double* %.11367, i64 13
  %.228.12 = getelementptr inbounds double, double* %.12766, i64 14
  %255 = load double, double* %.228.12, align 8
  %256 = fdiv double %255, %211
  store double %256, double* %254, align 8
  %257 = getelementptr inbounds double, double* %.11367, i64 14
  %.228.13 = getelementptr inbounds double, double* %.12766, i64 15
  %258 = load double, double* %.228.13, align 8
  %259 = fdiv double %258, %211
  store double %259, double* %257, align 8
  %scevgep115 = getelementptr double, double* %.12766, i64 16
  %indvars.iv.next118 = add nsw i64 %indvars.iv117, -1
  %260 = icmp sgt i64 %indvars.iv117, 0
  br i1 %260, label %210, label %.preheader35.preheader112

.preheader35.preheader112:                        ; preds = %210
  %261 = load double, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 249), align 8
  %262 = fdiv double %261, %192
  store double %262, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 232), align 16
  %263 = load double, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 250), align 16
  %264 = fdiv double %263, %192
  store double %264, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 233), align 8
  %265 = load double, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 251), align 8
  %266 = fdiv double %265, %192
  store double %266, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 234), align 16
  %267 = load double, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 252), align 16
  %268 = fdiv double %267, %192
  store double %268, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 235), align 8
  %269 = load double, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 253), align 8
  %270 = fdiv double %269, %192
  store double %270, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 236), align 16
  %271 = load double, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 254), align 16
  %272 = fdiv double %271, %192
  store double %272, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 237), align 8
  %273 = load double, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 255), align 8
  %274 = fdiv double %273, %192
  store double %274, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 238), align 16
  %275 = getelementptr inbounds [31 x double], [31 x double]* %0, i64 0, i64 0
  br label %.preheader35

.preheader35:                                     ; preds = %.preheader35.preheader112, %285
  %indvars.iv109 = phi i64 [ 15, %.preheader35.preheader112 ], [ %indvars.iv.next110, %285 ]
  %.43056 = phi double* [ getelementptr inbounds ([16 x [31 x double]], [16 x [31 x double]]* @mm, i64 0, i64 0, i64 0), %.preheader35.preheader112 ], [ %scevgep, %285 ]
  %276 = shl nsw i64 %indvars.iv109, 1
  %277 = or i64 %276, 1
  %278 = trunc i64 %277 to i32
  %279 = sitofp i32 %278 to double
  %280 = fmul double %279, 0x400921FB54442D18
  %281 = fmul double %280, 1.562500e-02
  %282 = tail call double @cos(double %281) #4
  %283 = load double, double* %275, align 16
  %284 = fmul double %282, %283
  store double %284, double* %.43056, align 8
  br label %423

; <label>:285:                                    ; preds = %423
  %scevgep = getelementptr double, double* %.43056, i64 31
  %indvars.iv.next110 = add nsw i64 %indvars.iv109, -1
  %286 = icmp sgt i64 %indvars.iv109, 0
  br i1 %286, label %.preheader35, label %.preheader34

.preheader34:                                     ; preds = %285
  %287 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 17) to i64*), align 8
  %288 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 9) to i64*), align 8
  store i64 %288, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 17) to i64*), align 8
  store i64 %287, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 9) to i64*), align 8
  %289 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 35) to i64*), align 8
  %290 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 27) to i64*), align 8
  store i64 %290, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 35) to i64*), align 8
  store i64 %289, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 27) to i64*), align 8
  %291 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 17) to i64*), align 8
  %292 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 9) to i64*), align 8
  store i64 %292, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 17) to i64*), align 8
  store i64 %291, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 9) to i64*), align 8
  %293 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 35) to i64*), align 8
  %294 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 27) to i64*), align 8
  store i64 %294, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 35) to i64*), align 8
  store i64 %293, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 27) to i64*), align 8
  %295 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 17) to i64*), align 8
  %296 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 9) to i64*), align 8
  store i64 %296, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 17) to i64*), align 8
  store i64 %295, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 9) to i64*), align 8
  %297 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 35) to i64*), align 8
  %298 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 27) to i64*), align 8
  store i64 %298, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 35) to i64*), align 8
  store i64 %297, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 27) to i64*), align 8
  %299 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 16) to i64*), align 16
  %300 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 10) to i64*), align 16
  store i64 %300, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 16) to i64*), align 16
  store i64 %299, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 10) to i64*), align 16
  %301 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 34) to i64*), align 16
  %302 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 28) to i64*), align 16
  store i64 %302, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 34) to i64*), align 16
  store i64 %301, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 28) to i64*), align 16
  %303 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 16) to i64*), align 16
  %304 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 10) to i64*), align 16
  store i64 %304, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 16) to i64*), align 16
  store i64 %303, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 10) to i64*), align 16
  %305 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 34) to i64*), align 16
  %306 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 28) to i64*), align 16
  store i64 %306, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 34) to i64*), align 16
  store i64 %305, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 28) to i64*), align 16
  %307 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 16) to i64*), align 16
  %308 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 10) to i64*), align 16
  store i64 %308, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 16) to i64*), align 16
  store i64 %307, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 10) to i64*), align 16
  %309 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 34) to i64*), align 16
  %310 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 28) to i64*), align 16
  store i64 %310, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 34) to i64*), align 16
  store i64 %309, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 28) to i64*), align 16
  %311 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 15) to i64*), align 8
  %312 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 11) to i64*), align 8
  store i64 %312, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 15) to i64*), align 8
  store i64 %311, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 11) to i64*), align 8
  %313 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 33) to i64*), align 8
  %314 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 29) to i64*), align 8
  store i64 %314, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 33) to i64*), align 8
  store i64 %313, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 29) to i64*), align 8
  %315 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 15) to i64*), align 8
  %316 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 11) to i64*), align 8
  store i64 %316, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 15) to i64*), align 8
  store i64 %315, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 11) to i64*), align 8
  %317 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 33) to i64*), align 8
  %318 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 29) to i64*), align 8
  store i64 %318, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 33) to i64*), align 8
  store i64 %317, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 29) to i64*), align 8
  %319 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 15) to i64*), align 8
  %320 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 11) to i64*), align 8
  store i64 %320, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 15) to i64*), align 8
  store i64 %319, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 11) to i64*), align 8
  %321 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 33) to i64*), align 8
  %322 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 29) to i64*), align 8
  store i64 %322, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 33) to i64*), align 8
  store i64 %321, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 29) to i64*), align 8
  %323 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 14) to i64*), align 16
  %324 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 12) to i64*), align 16
  store i64 %324, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 14) to i64*), align 16
  store i64 %323, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 12) to i64*), align 16
  %325 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 32) to i64*), align 16
  %326 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 30) to i64*), align 16
  store i64 %326, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 32) to i64*), align 16
  store i64 %325, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 30) to i64*), align 16
  %327 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 14) to i64*), align 16
  %328 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 12) to i64*), align 16
  store i64 %328, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 14) to i64*), align 16
  store i64 %327, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 12) to i64*), align 16
  %329 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 32) to i64*), align 16
  %330 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 30) to i64*), align 16
  store i64 %330, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 32) to i64*), align 16
  store i64 %329, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 30) to i64*), align 16
  %331 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 14) to i64*), align 16
  %332 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 12) to i64*), align 16
  store i64 %332, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 14) to i64*), align 16
  store i64 %331, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 12) to i64*), align 16
  %333 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 32) to i64*), align 16
  %334 = load i64, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 30) to i64*), align 16
  store i64 %334, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 32) to i64*), align 16
  store i64 %333, i64* bitcast (double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 30) to i64*), align 16
  %335 = fmul double %192, 0x3F00000000000000
  br label %336

; <label>:336:                                    ; preds = %336, %.preheader34
  %indvars.iv100 = phi i64 [ 0, %.preheader34 ], [ %indvars.iv.next101.1, %336 ]
  %337 = getelementptr inbounds [4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 %indvars.iv100
  %338 = load double, double* %337, align 16
  %339 = fmul double %335, %338
  store double %339, double* %337, align 16
  %340 = getelementptr inbounds [4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 %indvars.iv100
  %341 = load double, double* %340, align 16
  %342 = fmul double %335, %341
  store double %342, double* %340, align 16
  %343 = getelementptr inbounds [4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 %indvars.iv100
  %344 = load double, double* %343, align 16
  %345 = fmul double %335, %344
  store double %345, double* %343, align 16
  %indvars.iv.next101 = or i64 %indvars.iv100, 1
  %346 = getelementptr inbounds [4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 0, i64 %indvars.iv.next101
  %347 = load double, double* %346, align 8
  %348 = fmul double %335, %347
  store double %348, double* %346, align 8
  %349 = getelementptr inbounds [4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 1, i64 %indvars.iv.next101
  %350 = load double, double* %349, align 8
  %351 = fmul double %335, %350
  store double %351, double* %349, align 8
  %352 = getelementptr inbounds [4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 3, i64 %indvars.iv.next101
  %353 = load double, double* %352, align 8
  %354 = fmul double %335, %353
  store double %354, double* %352, align 8
  %indvars.iv.next101.1 = add nsw i64 %indvars.iv100, 2
  %exitcond102.1 = icmp eq i64 %indvars.iv.next101.1, 36
  br i1 %exitcond102.1, label %.preheader.preheader, label %336

.preheader.preheader:                             ; preds = %336
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %.preheader ], [ 0, %.preheader.preheader ]
  %355 = trunc i64 %indvars.iv to i32
  %356 = sitofp i32 %355 to double
  %357 = fadd double %356, 5.000000e-01
  %358 = fmul double %357, 0x3FD0C152382D7365
  %359 = tail call double @cos(double %358) #4
  %360 = fmul double %192, %359
  %361 = fmul double %360, 0x3F00000000000000
  %362 = fmul double %361, 0x3FD5555555555555
  %363 = tail call double @tan(double %358) #4
  %364 = getelementptr inbounds [4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 %indvars.iv
  store double %363, double* %364, align 8
  %365 = shl nsw i64 %indvars.iv, 2
  %366 = or i64 %365, 2
  %367 = add nuw nsw i64 %366, 12
  %368 = trunc i64 %367 to i32
  %369 = sitofp i32 %368 to double
  %370 = add nuw nsw i64 %366, 36
  %371 = trunc i64 %370 to i32
  %372 = sitofp i32 %371 to double
  %373 = add nuw nsw i64 %indvars.iv, 3
  %374 = fmul double %369, 0x3FB0C152382D7365
  %375 = tail call double @cos(double %374) #4
  %376 = fmul double %362, %375
  %377 = getelementptr inbounds [6 x [6 x double]], [6 x [6 x double]]* @cos_s, i64 0, i64 0, i64 %indvars.iv
  store double %376, double* %377, align 8
  %378 = fmul double %372, 0x3FB0C152382D7365
  %379 = tail call double @cos(double %378) #4
  %380 = fmul double %362, %379
  %381 = getelementptr inbounds [6 x [6 x double]], [6 x [6 x double]]* @cos_s, i64 0, i64 0, i64 %373
  store double %380, double* %381, align 8
  %382 = fmul double %369, 0x3FC921FB54442D18
  %383 = tail call double @cos(double %382) #4
  %384 = fmul double %362, %383
  %385 = getelementptr inbounds [6 x [6 x double]], [6 x [6 x double]]* @cos_s, i64 0, i64 1, i64 %indvars.iv
  store double %384, double* %385, align 8
  %386 = fmul double %372, 0x3FC921FB54442D18
  %387 = tail call double @cos(double %386) #4
  %388 = fmul double %362, %387
  %389 = getelementptr inbounds [6 x [6 x double]], [6 x [6 x double]]* @cos_s, i64 0, i64 1, i64 %373
  store double %388, double* %389, align 8
  %390 = fmul double %369, 0x3FD4F1A6C638D03E
  %391 = tail call double @cos(double %390) #4
  %392 = fmul double %362, %391
  %393 = getelementptr inbounds [6 x [6 x double]], [6 x [6 x double]]* @cos_s, i64 0, i64 2, i64 %indvars.iv
  store double %392, double* %393, align 8
  %394 = fmul double %372, 0x3FD4F1A6C638D03E
  %395 = tail call double @cos(double %394) #4
  %396 = fmul double %362, %395
  %397 = getelementptr inbounds [6 x [6 x double]], [6 x [6 x double]]* @cos_s, i64 0, i64 2, i64 %373
  store double %396, double* %397, align 8
  %398 = fmul double %369, 0x3FDD524FE24F89F1
  %399 = tail call double @cos(double %398) #4
  %400 = fmul double %362, %399
  %401 = getelementptr inbounds [6 x [6 x double]], [6 x [6 x double]]* @cos_s, i64 0, i64 3, i64 %indvars.iv
  store double %400, double* %401, align 8
  %402 = fmul double %372, 0x3FDD524FE24F89F1
  %403 = tail call double @cos(double %402) #4
  %404 = fmul double %362, %403
  %405 = getelementptr inbounds [6 x [6 x double]], [6 x [6 x double]]* @cos_s, i64 0, i64 3, i64 %373
  store double %404, double* %405, align 8
  %406 = fmul double %369, 0x3FE2D97C7F3321D2
  %407 = tail call double @cos(double %406) #4
  %408 = fmul double %362, %407
  %409 = getelementptr inbounds [6 x [6 x double]], [6 x [6 x double]]* @cos_s, i64 0, i64 4, i64 %indvars.iv
  store double %408, double* %409, align 8
  %410 = fmul double %372, 0x3FE2D97C7F3321D2
  %411 = tail call double @cos(double %410) #4
  %412 = fmul double %362, %411
  %413 = getelementptr inbounds [6 x [6 x double]], [6 x [6 x double]]* @cos_s, i64 0, i64 4, i64 %373
  store double %412, double* %413, align 8
  %414 = fmul double %369, 0x3FE709D10D3E7EAB
  %415 = tail call double @cos(double %414) #4
  %416 = fmul double %362, %415
  %417 = getelementptr inbounds [6 x [6 x double]], [6 x [6 x double]]* @cos_s, i64 0, i64 5, i64 %indvars.iv
  store double %416, double* %417, align 8
  %418 = fmul double %372, 0x3FE709D10D3E7EAB
  %419 = tail call double @cos(double %418) #4
  %420 = fmul double %362, %419
  %421 = getelementptr inbounds [6 x [6 x double]], [6 x [6 x double]]* @cos_s, i64 0, i64 5, i64 %373
  store double %420, double* %421, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 3
  br i1 %exitcond, label %422, label %.preheader

; <label>:422:                                    ; preds = %.preheader
  ret void

; <label>:423:                                    ; preds = %.preheader35, %423
  %indvars.iv.next107173 = phi i64 [ 2, %.preheader35 ], [ %indvars.iv.next107, %423 ]
  %.53154172 = phi double* [ %.43056, %.preheader35 ], [ %434, %423 ]
  %indvars.iv106171 = phi i64 [ 1, %.preheader35 ], [ %indvars.iv.next107.1, %423 ]
  %424 = getelementptr inbounds double, double* %.53154172, i64 1
  %425 = mul nuw nsw i64 %indvars.iv.next107173, %277
  %426 = trunc i64 %425 to i32
  %427 = sitofp i32 %426 to double
  %428 = fmul double %427, 0x400921FB54442D18
  %429 = fmul double %428, 1.562500e-02
  %430 = tail call double @cos(double %429) #4
  %431 = getelementptr inbounds [31 x double], [31 x double]* %0, i64 0, i64 %indvars.iv106171
  %432 = load double, double* %431, align 8
  %433 = fmul double %430, %432
  store double %433, double* %424, align 8
  %434 = getelementptr inbounds double, double* %.53154172, i64 2
  %indvars.iv.next107.1 = add nsw i64 %indvars.iv106171, 2
  %435 = mul nuw nsw i64 %indvars.iv.next107.1, %277
  %436 = trunc i64 %435 to i32
  %437 = sitofp i32 %436 to double
  %438 = fmul double %437, 0x400921FB54442D18
  %439 = fmul double %438, 1.562500e-02
  %440 = tail call double @cos(double %439) #4
  %441 = add nsw i64 %indvars.iv106171, 1
  %442 = getelementptr inbounds [31 x double], [31 x double]* %0, i64 0, i64 %441
  %443 = load double, double* %442, align 8
  %444 = fmul double %440, %443
  store double %444, double* %434, align 8
  %indvars.iv.next107 = add nsw i64 %indvars.iv106171, 3
  %exitcond108 = icmp eq i64 %indvars.iv.next107, 32
  br i1 %exitcond108, label %285, label %423
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @window_subband(i16* readonly, double* nocapture) unnamed_addr #1 {
  %3 = getelementptr inbounds i16, i16* %0, i64 255
  %4 = load i16, i16* %3, align 2
  %5 = sitofp i16 %4 to double
  %6 = getelementptr inbounds i16, i16* %0, i64 223
  %7 = load i16, i16* %6, align 2
  %8 = sext i16 %7 to i32
  %9 = getelementptr inbounds i16, i16* %0, i64 287
  %10 = load i16, i16* %9, align 2
  %11 = sext i16 %10 to i32
  %12 = sub nsw i32 %8, %11
  %13 = sitofp i32 %12 to double
  %14 = load double, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 0), align 16
  %15 = fmul double %14, %13
  %16 = fadd double %5, %15
  %17 = getelementptr inbounds i16, i16* %0, i64 191
  %18 = load i16, i16* %17, align 2
  %19 = sext i16 %18 to i32
  %20 = getelementptr inbounds i16, i16* %0, i64 319
  %21 = load i16, i16* %20, align 2
  %22 = sext i16 %21 to i32
  %23 = add nsw i32 %22, %19
  %24 = sitofp i32 %23 to double
  %25 = load double, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 1), align 8
  %26 = fmul double %25, %24
  %27 = fadd double %16, %26
  %28 = getelementptr inbounds i16, i16* %0, i64 159
  %29 = load i16, i16* %28, align 2
  %30 = sext i16 %29 to i32
  %31 = getelementptr inbounds i16, i16* %0, i64 351
  %32 = load i16, i16* %31, align 2
  %33 = sext i16 %32 to i32
  %34 = sub nsw i32 %30, %33
  %35 = sitofp i32 %34 to double
  %36 = load double, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 2), align 16
  %37 = fmul double %36, %35
  %38 = fadd double %27, %37
  %39 = getelementptr inbounds i16, i16* %0, i64 127
  %40 = load i16, i16* %39, align 2
  %41 = sext i16 %40 to i32
  %42 = getelementptr inbounds i16, i16* %0, i64 383
  %43 = load i16, i16* %42, align 2
  %44 = sext i16 %43 to i32
  %45 = add nsw i32 %44, %41
  %46 = sitofp i32 %45 to double
  %47 = load double, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 3), align 8
  %48 = fmul double %47, %46
  %49 = fadd double %38, %48
  %50 = getelementptr inbounds i16, i16* %0, i64 95
  %51 = load i16, i16* %50, align 2
  %52 = sext i16 %51 to i32
  %53 = getelementptr inbounds i16, i16* %0, i64 415
  %54 = load i16, i16* %53, align 2
  %55 = sext i16 %54 to i32
  %56 = sub nsw i32 %52, %55
  %57 = sitofp i32 %56 to double
  %58 = load double, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 4), align 16
  %59 = fmul double %58, %57
  %60 = fadd double %49, %59
  %61 = getelementptr inbounds i16, i16* %0, i64 63
  %62 = load i16, i16* %61, align 2
  %63 = sext i16 %62 to i32
  %64 = getelementptr inbounds i16, i16* %0, i64 447
  %65 = load i16, i16* %64, align 2
  %66 = sext i16 %65 to i32
  %67 = add nsw i32 %66, %63
  %68 = sitofp i32 %67 to double
  %69 = load double, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 5), align 8
  %70 = fmul double %69, %68
  %71 = fadd double %60, %70
  %72 = getelementptr inbounds i16, i16* %0, i64 31
  %73 = load i16, i16* %72, align 2
  %74 = sext i16 %73 to i32
  %75 = getelementptr inbounds i16, i16* %0, i64 479
  %76 = load i16, i16* %75, align 2
  %77 = sext i16 %76 to i32
  %78 = sub nsw i32 %74, %77
  %79 = sitofp i32 %78 to double
  %80 = load double, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 6), align 16
  %81 = fmul double %80, %79
  %82 = fadd double %71, %81
  store double %82, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 19), align 8
  br label %83

; <label>:83:                                     ; preds = %2, %83
  %indvars.iv18 = phi i64 [ 14, %2 ], [ %indvars.iv.next19, %83 ]
  %.0612 = phi double* [ getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 7), %2 ], [ %275, %83 ]
  %84 = getelementptr inbounds i16, i16* %0, i64 %indvars.iv18
  %85 = sub nsw i64 0, %indvars.iv18
  %86 = getelementptr inbounds i16, i16* %0, i64 %85
  %87 = getelementptr inbounds i16, i16* %86, i64 270
  %88 = load i16, i16* %87, align 2
  %89 = sitofp i16 %88 to double
  %90 = getelementptr inbounds i16, i16* %84, i64 240
  %91 = load i16, i16* %90, align 2
  %92 = sitofp i16 %91 to double
  %93 = getelementptr inbounds double, double* %.0612, i64 1
  %94 = load double, double* %.0612, align 8
  %95 = getelementptr inbounds i16, i16* %86, i64 334
  %96 = load i16, i16* %95, align 2
  %97 = sitofp i16 %96 to double
  %98 = fmul double %94, %97
  %99 = fadd double %89, %98
  %100 = getelementptr inbounds i16, i16* %84, i64 176
  %101 = load i16, i16* %100, align 2
  %102 = sitofp i16 %101 to double
  %103 = fmul double %94, %102
  %104 = fadd double %92, %103
  %105 = getelementptr inbounds double, double* %.0612, i64 2
  %106 = load double, double* %93, align 8
  %107 = getelementptr inbounds i16, i16* %86, i64 398
  %108 = load i16, i16* %107, align 2
  %109 = sitofp i16 %108 to double
  %110 = fmul double %106, %109
  %111 = fadd double %99, %110
  %112 = getelementptr inbounds i16, i16* %84, i64 112
  %113 = load i16, i16* %112, align 2
  %114 = sitofp i16 %113 to double
  %115 = fmul double %106, %114
  %116 = fadd double %104, %115
  %117 = getelementptr inbounds double, double* %.0612, i64 3
  %118 = load double, double* %105, align 8
  %119 = getelementptr inbounds i16, i16* %86, i64 462
  %120 = load i16, i16* %119, align 2
  %121 = sitofp i16 %120 to double
  %122 = fmul double %118, %121
  %123 = fadd double %111, %122
  %124 = getelementptr inbounds i16, i16* %84, i64 48
  %125 = load i16, i16* %124, align 2
  %126 = sitofp i16 %125 to double
  %127 = fmul double %118, %126
  %128 = fadd double %116, %127
  %129 = getelementptr inbounds double, double* %.0612, i64 4
  %130 = load double, double* %117, align 8
  %131 = getelementptr inbounds i16, i16* %86, i64 14
  %132 = load i16, i16* %131, align 2
  %133 = sitofp i16 %132 to double
  %134 = fmul double %130, %133
  %135 = fadd double %123, %134
  %136 = getelementptr inbounds i16, i16* %84, i64 496
  %137 = load i16, i16* %136, align 2
  %138 = sitofp i16 %137 to double
  %139 = fmul double %130, %138
  %140 = fadd double %128, %139
  %141 = getelementptr inbounds double, double* %.0612, i64 5
  %142 = load double, double* %129, align 8
  %143 = getelementptr inbounds i16, i16* %86, i64 78
  %144 = load i16, i16* %143, align 2
  %145 = sitofp i16 %144 to double
  %146 = fmul double %142, %145
  %147 = fadd double %135, %146
  %148 = getelementptr inbounds i16, i16* %84, i64 432
  %149 = load i16, i16* %148, align 2
  %150 = sitofp i16 %149 to double
  %151 = fmul double %142, %150
  %152 = fadd double %140, %151
  %153 = getelementptr inbounds double, double* %.0612, i64 6
  %154 = load double, double* %141, align 8
  %155 = getelementptr inbounds i16, i16* %86, i64 142
  %156 = load i16, i16* %155, align 2
  %157 = sitofp i16 %156 to double
  %158 = fmul double %154, %157
  %159 = fadd double %147, %158
  %160 = getelementptr inbounds i16, i16* %84, i64 368
  %161 = load i16, i16* %160, align 2
  %162 = sitofp i16 %161 to double
  %163 = fmul double %154, %162
  %164 = fadd double %152, %163
  %165 = getelementptr inbounds double, double* %.0612, i64 7
  %166 = load double, double* %153, align 8
  %167 = getelementptr inbounds i16, i16* %86, i64 206
  %168 = load i16, i16* %167, align 2
  %169 = sitofp i16 %168 to double
  %170 = fmul double %166, %169
  %171 = fadd double %159, %170
  %172 = getelementptr inbounds i16, i16* %84, i64 304
  %173 = load i16, i16* %172, align 2
  %174 = sitofp i16 %173 to double
  %175 = fmul double %166, %174
  %176 = fadd double %164, %175
  %177 = getelementptr inbounds double, double* %.0612, i64 8
  %178 = load double, double* %165, align 8
  %179 = getelementptr inbounds i16, i16* %84, i64 16
  %180 = load i16, i16* %179, align 2
  %181 = sitofp i16 %180 to double
  %182 = fmul double %178, %181
  %183 = fadd double %171, %182
  %184 = getelementptr inbounds i16, i16* %86, i64 494
  %185 = load i16, i16* %184, align 2
  %186 = sitofp i16 %185 to double
  %187 = fmul double %178, %186
  %188 = fsub double %176, %187
  %189 = getelementptr inbounds double, double* %.0612, i64 9
  %190 = load double, double* %177, align 8
  %191 = getelementptr inbounds i16, i16* %84, i64 80
  %192 = load i16, i16* %191, align 2
  %193 = sitofp i16 %192 to double
  %194 = fmul double %190, %193
  %195 = fadd double %183, %194
  %196 = getelementptr inbounds i16, i16* %86, i64 430
  %197 = load i16, i16* %196, align 2
  %198 = sitofp i16 %197 to double
  %199 = fmul double %190, %198
  %200 = fsub double %188, %199
  %201 = getelementptr inbounds double, double* %.0612, i64 10
  %202 = load double, double* %189, align 8
  %203 = getelementptr inbounds i16, i16* %84, i64 144
  %204 = load i16, i16* %203, align 2
  %205 = sitofp i16 %204 to double
  %206 = fmul double %202, %205
  %207 = fadd double %195, %206
  %208 = getelementptr inbounds i16, i16* %86, i64 366
  %209 = load i16, i16* %208, align 2
  %210 = sitofp i16 %209 to double
  %211 = fmul double %202, %210
  %212 = fsub double %200, %211
  %213 = getelementptr inbounds double, double* %.0612, i64 11
  %214 = load double, double* %201, align 8
  %215 = getelementptr inbounds i16, i16* %84, i64 208
  %216 = load i16, i16* %215, align 2
  %217 = sitofp i16 %216 to double
  %218 = fmul double %214, %217
  %219 = fadd double %207, %218
  %220 = getelementptr inbounds i16, i16* %86, i64 302
  %221 = load i16, i16* %220, align 2
  %222 = sitofp i16 %221 to double
  %223 = fmul double %214, %222
  %224 = fsub double %212, %223
  %225 = getelementptr inbounds double, double* %.0612, i64 12
  %226 = load double, double* %213, align 8
  %227 = getelementptr inbounds i16, i16* %84, i64 272
  %228 = load i16, i16* %227, align 2
  %229 = sitofp i16 %228 to double
  %230 = fmul double %226, %229
  %231 = fsub double %219, %230
  %232 = getelementptr inbounds i16, i16* %86, i64 238
  %233 = load i16, i16* %232, align 2
  %234 = sitofp i16 %233 to double
  %235 = fmul double %226, %234
  %236 = fadd double %224, %235
  %237 = getelementptr inbounds double, double* %.0612, i64 13
  %238 = load double, double* %225, align 8
  %239 = getelementptr inbounds i16, i16* %84, i64 336
  %240 = load i16, i16* %239, align 2
  %241 = sitofp i16 %240 to double
  %242 = fmul double %238, %241
  %243 = fsub double %231, %242
  %244 = getelementptr inbounds i16, i16* %86, i64 174
  %245 = load i16, i16* %244, align 2
  %246 = sitofp i16 %245 to double
  %247 = fmul double %238, %246
  %248 = fadd double %236, %247
  %249 = getelementptr inbounds double, double* %.0612, i64 14
  %250 = load double, double* %237, align 8
  %251 = getelementptr inbounds i16, i16* %84, i64 400
  %252 = load i16, i16* %251, align 2
  %253 = sitofp i16 %252 to double
  %254 = fmul double %250, %253
  %255 = fsub double %243, %254
  %256 = getelementptr inbounds i16, i16* %86, i64 110
  %257 = load i16, i16* %256, align 2
  %258 = sitofp i16 %257 to double
  %259 = fmul double %250, %258
  %260 = fadd double %248, %259
  %261 = load double, double* %249, align 8
  %262 = getelementptr inbounds i16, i16* %84, i64 464
  %263 = load i16, i16* %262, align 2
  %264 = sitofp i16 %263 to double
  %265 = fmul double %261, %264
  %266 = fsub double %255, %265
  %267 = getelementptr inbounds i16, i16* %86, i64 46
  %268 = load i16, i16* %267, align 2
  %269 = sitofp i16 %268 to double
  %270 = fmul double %261, %269
  %271 = fadd double %260, %270
  %272 = sub nuw nsw i64 30, %indvars.iv18
  %273 = getelementptr inbounds double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 4), i64 %272
  store double %266, double* %273, align 8
  %274 = getelementptr inbounds double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 4), i64 %indvars.iv18
  store double %271, double* %274, align 8
  %275 = getelementptr inbounds double, double* %.0612, i64 15
  %indvars.iv.next19 = add nsw i64 %indvars.iv18, -1
  %276 = icmp sgt i64 %indvars.iv18, 0
  br i1 %276, label %83, label %277

; <label>:277:                                    ; preds = %83
  %278 = getelementptr inbounds i16, i16* %0, i64 239
  %279 = load i16, i16* %278, align 2
  %280 = sitofp i16 %279 to double
  %281 = getelementptr inbounds i16, i16* %0, i64 175
  %282 = load i16, i16* %281, align 2
  %283 = sitofp i16 %282 to double
  %284 = load double, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 232), align 16
  %285 = fmul double %283, %284
  %286 = fadd double %280, %285
  %287 = getelementptr inbounds i16, i16* %0, i64 111
  %288 = load i16, i16* %287, align 2
  %289 = sitofp i16 %288 to double
  %290 = load double, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 233), align 8
  %291 = fmul double %289, %290
  %292 = fadd double %286, %291
  %293 = getelementptr inbounds i16, i16* %0, i64 47
  %294 = load i16, i16* %293, align 2
  %295 = sitofp i16 %294 to double
  %296 = load double, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 234), align 16
  %297 = fmul double %295, %296
  %298 = fadd double %292, %297
  %299 = getelementptr inbounds i16, i16* %0, i64 303
  %300 = load i16, i16* %299, align 2
  %301 = sitofp i16 %300 to double
  %302 = load double, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 235), align 8
  %303 = fmul double %301, %302
  %304 = fsub double %298, %303
  %305 = getelementptr inbounds i16, i16* %0, i64 367
  %306 = load i16, i16* %305, align 2
  %307 = sitofp i16 %306 to double
  %308 = load double, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 236), align 16
  %309 = fmul double %307, %308
  %310 = fsub double %304, %309
  %311 = getelementptr inbounds i16, i16* %0, i64 431
  %312 = load i16, i16* %311, align 2
  %313 = sitofp i16 %312 to double
  %314 = load double, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 237), align 8
  %315 = fmul double %313, %314
  %316 = fsub double %310, %315
  %317 = getelementptr inbounds i16, i16* %0, i64 495
  %318 = load i16, i16* %317, align 2
  %319 = sitofp i16 %318 to double
  %320 = load double, double* getelementptr inbounds ([256 x double], [256 x double]* @enwindow, i64 0, i64 238), align 16
  %321 = fmul double %319, %320
  %322 = fsub double %316, %321
  br label %323

; <label>:323:                                    ; preds = %323, %277
  %indvars.iv = phi i64 [ 15, %277 ], [ %indvars.iv.next, %323 ]
  %.179 = phi double* [ getelementptr inbounds ([16 x [31 x double]], [16 x [31 x double]]* @mm, i64 0, i64 0, i64 0), %277 ], [ %scevgep17, %323 ]
  %.21 = getelementptr inbounds double, double* %.179, i64 1
  %324 = load double, double* %.179, align 8
  %325 = fmul double %271, %324
  %326 = getelementptr inbounds double, double* %.179, i64 2
  %327 = load double, double* %326, align 8
  %328 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 6), align 16
  %329 = fmul double %327, %328
  %330 = fadd double %325, %329
  %331 = load double, double* %.21, align 8
  %332 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 5), align 8
  %333 = fmul double %331, %332
  %334 = fadd double %322, %333
  %.2 = getelementptr inbounds double, double* %.179, i64 3
  %335 = getelementptr inbounds double, double* %.179, i64 4
  %336 = load double, double* %335, align 8
  %337 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 8), align 16
  %338 = fmul double %336, %337
  %339 = fadd double %330, %338
  %340 = load double, double* %.2, align 8
  %341 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 7), align 8
  %342 = fmul double %340, %341
  %343 = fadd double %334, %342
  %.2.1 = getelementptr inbounds double, double* %.179, i64 5
  %344 = getelementptr inbounds double, double* %.179, i64 6
  %345 = load double, double* %344, align 8
  %346 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 10), align 16
  %347 = fmul double %345, %346
  %348 = fadd double %339, %347
  %349 = load double, double* %.2.1, align 8
  %350 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 9), align 8
  %351 = fmul double %349, %350
  %352 = fadd double %343, %351
  %.2.2 = getelementptr inbounds double, double* %.179, i64 7
  %353 = getelementptr inbounds double, double* %.179, i64 8
  %354 = load double, double* %353, align 8
  %355 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 12), align 16
  %356 = fmul double %354, %355
  %357 = fadd double %348, %356
  %358 = load double, double* %.2.2, align 8
  %359 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 11), align 8
  %360 = fmul double %358, %359
  %361 = fadd double %352, %360
  %.2.3 = getelementptr inbounds double, double* %.179, i64 9
  %362 = getelementptr inbounds double, double* %.179, i64 10
  %363 = load double, double* %362, align 8
  %364 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 14), align 16
  %365 = fmul double %363, %364
  %366 = fadd double %357, %365
  %367 = load double, double* %.2.3, align 8
  %368 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 13), align 8
  %369 = fmul double %367, %368
  %370 = fadd double %361, %369
  %.2.4 = getelementptr inbounds double, double* %.179, i64 11
  %371 = getelementptr inbounds double, double* %.179, i64 12
  %372 = load double, double* %371, align 8
  %373 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 16), align 16
  %374 = fmul double %372, %373
  %375 = fadd double %366, %374
  %376 = load double, double* %.2.4, align 8
  %377 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 15), align 8
  %378 = fmul double %376, %377
  %379 = fadd double %370, %378
  %.2.5 = getelementptr inbounds double, double* %.179, i64 13
  %380 = getelementptr inbounds double, double* %.179, i64 14
  %381 = load double, double* %380, align 8
  %382 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 18), align 16
  %383 = fmul double %381, %382
  %384 = fadd double %375, %383
  %385 = load double, double* %.2.5, align 8
  %386 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 17), align 8
  %387 = fmul double %385, %386
  %388 = fadd double %379, %387
  %.2.6 = getelementptr inbounds double, double* %.179, i64 15
  %389 = getelementptr inbounds double, double* %.179, i64 16
  %390 = load double, double* %389, align 8
  %391 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 20), align 16
  %392 = fmul double %390, %391
  %393 = fadd double %384, %392
  %394 = load double, double* %.2.6, align 8
  %395 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 19), align 8
  %396 = fmul double %394, %395
  %397 = fadd double %388, %396
  %.2.7 = getelementptr inbounds double, double* %.179, i64 17
  %398 = getelementptr inbounds double, double* %.179, i64 18
  %399 = load double, double* %398, align 8
  %400 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 22), align 16
  %401 = fmul double %399, %400
  %402 = fadd double %393, %401
  %403 = load double, double* %.2.7, align 8
  %404 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 21), align 8
  %405 = fmul double %403, %404
  %406 = fadd double %397, %405
  %.2.8 = getelementptr inbounds double, double* %.179, i64 19
  %407 = getelementptr inbounds double, double* %.179, i64 20
  %408 = load double, double* %407, align 8
  %409 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 24), align 16
  %410 = fmul double %408, %409
  %411 = fadd double %402, %410
  %412 = load double, double* %.2.8, align 8
  %413 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 23), align 8
  %414 = fmul double %412, %413
  %415 = fadd double %406, %414
  %.2.9 = getelementptr inbounds double, double* %.179, i64 21
  %416 = getelementptr inbounds double, double* %.179, i64 22
  %417 = load double, double* %416, align 8
  %418 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 26), align 16
  %419 = fmul double %417, %418
  %420 = fadd double %411, %419
  %421 = load double, double* %.2.9, align 8
  %422 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 25), align 8
  %423 = fmul double %421, %422
  %424 = fadd double %415, %423
  %.2.10 = getelementptr inbounds double, double* %.179, i64 23
  %425 = getelementptr inbounds double, double* %.179, i64 24
  %426 = load double, double* %425, align 8
  %427 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 28), align 16
  %428 = fmul double %426, %427
  %429 = fadd double %420, %428
  %430 = load double, double* %.2.10, align 8
  %431 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 27), align 8
  %432 = fmul double %430, %431
  %433 = fadd double %424, %432
  %.2.11 = getelementptr inbounds double, double* %.179, i64 25
  %434 = getelementptr inbounds double, double* %.179, i64 26
  %435 = load double, double* %434, align 8
  %436 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 30), align 16
  %437 = fmul double %435, %436
  %438 = fadd double %429, %437
  %439 = load double, double* %.2.11, align 8
  %440 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 29), align 8
  %441 = fmul double %439, %440
  %442 = fadd double %433, %441
  %.2.12 = getelementptr inbounds double, double* %.179, i64 27
  %443 = getelementptr inbounds double, double* %.179, i64 28
  %444 = load double, double* %443, align 8
  %445 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 32), align 16
  %446 = fmul double %444, %445
  %447 = fadd double %438, %446
  %448 = load double, double* %.2.12, align 8
  %449 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 31), align 8
  %450 = fmul double %448, %449
  %451 = fadd double %442, %450
  %.2.13 = getelementptr inbounds double, double* %.179, i64 29
  %452 = getelementptr inbounds double, double* %.179, i64 30
  %453 = load double, double* %452, align 8
  %454 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 34), align 16
  %455 = fmul double %453, %454
  %456 = fadd double %447, %455
  %457 = load double, double* %.2.13, align 8
  %458 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 33), align 8
  %459 = fmul double %457, %458
  %460 = fadd double %451, %459
  %scevgep17 = getelementptr double, double* %.179, i64 31
  %461 = fadd double %460, %456
  %462 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  store double %461, double* %462, align 8
  %463 = fsub double %460, %456
  %464 = sub nuw nsw i64 31, %indvars.iv
  %465 = getelementptr inbounds double, double* %1, i64 %464
  store double %463, double* %465, align 8
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %466 = icmp sgt i64 %indvars.iv, 0
  br i1 %466, label %323, label %467

; <label>:467:                                    ; preds = %323
  ret void
}

; Function Attrs: nounwind
declare double @cos(double) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #3

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @mdct_short(double* nocapture) unnamed_addr #1 {
  br label %2

; <label>:2:                                      ; preds = %2, %1
  %indvars.iv = phi i64 [ 5, %1 ], [ %indvars.iv.next, %2 ]
  %3 = getelementptr inbounds [6 x [6 x double]], [6 x [6 x double]]* @cos_s, i64 0, i64 %indvars.iv, i64 0
  %4 = load double, double* %3, align 16
  %5 = getelementptr inbounds [6 x [6 x double]], [6 x [6 x double]]* @cos_s, i64 0, i64 %indvars.iv, i64 1
  %6 = load double, double* %5, align 8
  %7 = getelementptr inbounds [6 x [6 x double]], [6 x [6 x double]]* @cos_s, i64 0, i64 %indvars.iv, i64 2
  %8 = load double, double* %7, align 16
  %9 = getelementptr inbounds [6 x [6 x double]], [6 x [6 x double]]* @cos_s, i64 0, i64 %indvars.iv, i64 3
  %10 = load double, double* %9, align 8
  %11 = getelementptr inbounds [6 x [6 x double]], [6 x [6 x double]]* @cos_s, i64 0, i64 %indvars.iv, i64 4
  %12 = load double, double* %11, align 16
  %13 = getelementptr inbounds [6 x [6 x double]], [6 x [6 x double]]* @cos_s, i64 0, i64 %indvars.iv, i64 5
  %14 = load double, double* %13, align 8
  %15 = mul nuw nsw i64 %indvars.iv, 3
  %16 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 16), align 16
  %17 = fmul double %4, %16
  %18 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 17), align 8
  %19 = fmul double %6, %18
  %20 = fadd double %17, %19
  %21 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 18), align 16
  %22 = fmul double %8, %21
  %23 = fadd double %20, %22
  %24 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 19), align 8
  %25 = fmul double %10, %24
  %26 = fadd double %23, %25
  %27 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 20), align 16
  %28 = fmul double %12, %27
  %29 = fadd double %26, %28
  %30 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 21), align 8
  %31 = fmul double %14, %30
  %32 = fadd double %29, %31
  %33 = add nuw nsw i64 %15, 2
  %34 = getelementptr inbounds double, double* %0, i64 %33
  store double %32, double* %34, align 8
  %35 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 10), align 16
  %36 = fmul double %4, %35
  %37 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 11), align 8
  %38 = fmul double %6, %37
  %39 = fadd double %36, %38
  %40 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 12), align 16
  %41 = fmul double %8, %40
  %42 = fadd double %39, %41
  %43 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 13), align 8
  %44 = fmul double %10, %43
  %45 = fadd double %42, %44
  %46 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 14), align 16
  %47 = fmul double %12, %46
  %48 = fadd double %45, %47
  %49 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 15), align 8
  %50 = fmul double %14, %49
  %51 = fadd double %48, %50
  %52 = add nuw nsw i64 %15, 1
  %53 = getelementptr inbounds double, double* %0, i64 %52
  store double %51, double* %53, align 8
  %54 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 4), align 16
  %55 = fmul double %4, %54
  %56 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 5), align 8
  %57 = fmul double %6, %56
  %58 = fadd double %55, %57
  %59 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 6), align 16
  %60 = fmul double %8, %59
  %61 = fadd double %58, %60
  %62 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 7), align 8
  %63 = fmul double %10, %62
  %64 = fadd double %61, %63
  %65 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 8), align 16
  %66 = fmul double %12, %65
  %67 = fadd double %64, %66
  %68 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 9), align 8
  %69 = fmul double %14, %68
  %70 = fadd double %67, %69
  %71 = getelementptr inbounds double, double* %0, i64 %15
  store double %70, double* %71, align 8
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %72 = icmp sgt i64 %indvars.iv, 0
  br i1 %72, label %2, label %73

; <label>:73:                                     ; preds = %2
  ret void
}

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @mdct_long(double* nocapture) unnamed_addr #1 {
  br label %2

; <label>:2:                                      ; preds = %2, %1
  %indvars.iv = phi i64 [ %indvars.iv.next, %2 ], [ 11, %1 ]
  %.0 = phi double* [ %95, %2 ], [ getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 0), %1 ]
  %3 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 4), align 16
  %4 = load double, double* %.0, align 8
  %5 = fmul double %3, %4
  %6 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 5), align 8
  %7 = getelementptr inbounds double, double* %.0, i64 1
  %8 = load double, double* %7, align 8
  %9 = fmul double %6, %8
  %10 = fadd double %5, %9
  %11 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 6), align 16
  %12 = getelementptr inbounds double, double* %.0, i64 2
  %13 = load double, double* %12, align 8
  %14 = fmul double %11, %13
  %15 = fadd double %10, %14
  %16 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 7), align 8
  %17 = getelementptr inbounds double, double* %.0, i64 3
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fadd double %15, %19
  %21 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 8), align 16
  %22 = getelementptr inbounds double, double* %.0, i64 4
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = fadd double %20, %24
  %26 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 9), align 8
  %27 = getelementptr inbounds double, double* %.0, i64 5
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = fadd double %25, %29
  %31 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 10), align 16
  %32 = getelementptr inbounds double, double* %.0, i64 6
  %33 = load double, double* %32, align 8
  %34 = fmul double %31, %33
  %35 = fadd double %30, %34
  %36 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 11), align 8
  %37 = getelementptr inbounds double, double* %.0, i64 7
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = fadd double %35, %39
  %41 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 12), align 16
  %42 = getelementptr inbounds double, double* %.0, i64 8
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = fadd double %40, %44
  %46 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 13), align 8
  %47 = getelementptr inbounds double, double* %.0, i64 9
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = fadd double %45, %49
  %51 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 14), align 16
  %52 = getelementptr inbounds double, double* %.0, i64 10
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = fadd double %50, %54
  %56 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 15), align 8
  %57 = getelementptr inbounds double, double* %.0, i64 11
  %58 = load double, double* %57, align 8
  %59 = fmul double %56, %58
  %60 = fadd double %55, %59
  %61 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 16), align 16
  %62 = getelementptr inbounds double, double* %.0, i64 12
  %63 = load double, double* %62, align 8
  %64 = fmul double %61, %63
  %65 = fadd double %60, %64
  %66 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 17), align 8
  %67 = getelementptr inbounds double, double* %.0, i64 13
  %68 = load double, double* %67, align 8
  %69 = fmul double %66, %68
  %70 = fadd double %65, %69
  %71 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 18), align 16
  %72 = getelementptr inbounds double, double* %.0, i64 14
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = fadd double %70, %74
  %76 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 19), align 8
  %77 = getelementptr inbounds double, double* %.0, i64 15
  %78 = load double, double* %77, align 8
  %79 = fmul double %76, %78
  %80 = fadd double %75, %79
  %81 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 20), align 16
  %82 = getelementptr inbounds double, double* %.0, i64 16
  %83 = load double, double* %82, align 8
  %84 = fmul double %81, %83
  %85 = fadd double %80, %84
  %86 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 21), align 8
  %87 = getelementptr inbounds double, double* %.0, i64 17
  %88 = load double, double* %87, align 8
  %89 = fmul double %86, %88
  %90 = fadd double %85, %89
  %91 = getelementptr inbounds [12 x i32], [12 x i32]* @all, i64 0, i64 %indvars.iv
  %92 = load i32, i32* %91, align 4
  %93 = sext i32 %92 to i64
  %94 = getelementptr inbounds double, double* %0, i64 %93
  store double %90, double* %94, align 8
  %95 = getelementptr inbounds double, double* %.0, i64 18
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %96 = icmp sgt i64 %indvars.iv, 0
  br i1 %96, label %2, label %97

; <label>:97:                                     ; preds = %2
  %98 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 4), align 16
  %99 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 9), align 8
  %100 = fadd double %98, %99
  %101 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 19), align 8
  %102 = fadd double %100, %101
  %103 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 5), align 8
  %104 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 8), align 16
  %105 = fadd double %103, %104
  %106 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 20), align 16
  %107 = fadd double %105, %106
  %108 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 6), align 16
  %109 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 7), align 8
  %110 = fadd double %108, %109
  %111 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 21), align 8
  %112 = fadd double %110, %111
  %113 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 10), align 16
  %114 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 13), align 8
  %115 = fsub double %113, %114
  %116 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 18), align 16
  %117 = fadd double %115, %116
  %118 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 11), align 8
  %119 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 14), align 16
  %120 = fsub double %118, %119
  %121 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 17), align 8
  %122 = fadd double %120, %121
  %123 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 12), align 16
  %124 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 15), align 8
  %125 = fsub double %123, %124
  %126 = load double, double* getelementptr inbounds ([4 x [36 x double]], [4 x [36 x double]]* @win, i64 0, i64 2, i64 16), align 16
  %127 = fadd double %125, %126
  %128 = load double, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 216), align 16
  %129 = fmul double %102, %128
  %130 = load double, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 217), align 8
  %131 = fmul double %107, %130
  %132 = fadd double %129, %131
  %133 = load double, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 218), align 16
  %134 = fmul double %112, %133
  %135 = fadd double %132, %134
  %136 = load double, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 219), align 8
  %137 = fmul double %117, %136
  %138 = fadd double %135, %137
  %139 = load double, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 220), align 16
  %140 = fmul double %122, %139
  %141 = fadd double %138, %140
  %142 = load double, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 221), align 8
  %143 = fmul double %127, %142
  %144 = fadd double %141, %143
  %145 = getelementptr inbounds double, double* %0, i64 16
  store double %144, double* %145, align 8
  %146 = load double, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 222), align 16
  %147 = fmul double %102, %146
  %148 = load double, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 223), align 8
  %149 = fmul double %107, %148
  %150 = fadd double %147, %149
  %151 = load double, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 224), align 16
  %152 = fmul double %112, %151
  %153 = fadd double %150, %152
  %154 = load double, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 225), align 8
  %155 = fmul double %117, %154
  %156 = fadd double %153, %155
  %157 = load double, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 226), align 16
  %158 = fmul double %122, %157
  %159 = fadd double %156, %158
  %160 = load double, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 227), align 8
  %161 = fmul double %127, %160
  %162 = fadd double %159, %161
  %163 = getelementptr inbounds double, double* %0, i64 10
  store double %162, double* %163, align 8
  %164 = load double, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 228), align 16
  %165 = fmul double %102, %164
  %166 = load double, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 229), align 8
  %167 = fmul double %107, %166
  %168 = fadd double %165, %167
  %169 = load double, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 230), align 16
  %170 = fmul double %112, %169
  %171 = fadd double %168, %170
  %172 = load double, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 231), align 8
  %173 = fmul double %117, %172
  %174 = fadd double %171, %173
  %175 = load double, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 232), align 16
  %176 = fmul double %122, %175
  %177 = fadd double %174, %176
  %178 = load double, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 233), align 8
  %179 = fmul double %127, %178
  %180 = fadd double %177, %179
  %181 = getelementptr inbounds double, double* %0, i64 7
  store double %180, double* %181, align 8
  %182 = load double, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 234), align 16
  %183 = fmul double %102, %182
  %184 = load double, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 235), align 8
  %185 = fmul double %107, %184
  %186 = fadd double %183, %185
  %187 = load double, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 236), align 16
  %188 = fmul double %112, %187
  %189 = fadd double %186, %188
  %190 = load double, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 237), align 8
  %191 = fmul double %117, %190
  %192 = fadd double %189, %191
  %193 = load double, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 238), align 16
  %194 = fmul double %122, %193
  %195 = fadd double %192, %194
  %196 = load double, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 239), align 8
  %197 = fmul double %127, %196
  %198 = fadd double %195, %197
  %199 = getelementptr inbounds double, double* %0, i64 1
  store double %198, double* %199, align 8
  %200 = fsub double %102, %107
  %201 = fadd double %200, %127
  %202 = fsub double %112, %117
  %203 = fsub double %202, %122
  %204 = load double, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 240), align 16
  %205 = fmul double %201, %204
  %206 = load double, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 241), align 8
  %207 = fmul double %203, %206
  %208 = fadd double %205, %207
  %209 = getelementptr inbounds double, double* %0, i64 13
  store double %208, double* %209, align 8
  %210 = load double, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 242), align 16
  %211 = fmul double %201, %210
  %212 = load double, double* getelementptr inbounds ([244 x double], [244 x double]* @cos_l, i64 0, i64 243), align 8
  %213 = fmul double %203, %212
  %214 = fadd double %211, %213
  %215 = getelementptr inbounds double, double* %0, i64 4
  store double %214, double* %215, align 8
  ret void
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #3

; Function Attrs: nounwind
declare double @sin(double) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @tan(double) local_unnamed_addr #2

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { argmemonly nounwind }
attributes #4 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
