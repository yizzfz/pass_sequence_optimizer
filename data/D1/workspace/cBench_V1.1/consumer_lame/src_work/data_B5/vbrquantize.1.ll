; ModuleID = 'vbrquantize.ll'
source_filename = "vbrquantize.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct.scalefac_struct = type { [23 x i32], [14 x i32] }
%struct.gr_info = type { i32, i32, i32, i32, i32, i32, i32, i32, [3 x i32], [3 x i32], i32, i32, i32, i32, i32, i32, i32, i32, i32, i32*, [4 x i32] }
%struct.lame_global_flags = type { i64, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i32, i8*, i8*, i32, i32, float, i32, i32, i32, i64, i64, i32, i32, i32, i32, i32, i32, i32, i32, float, i32, i32, i32, float, float, float, float, i32, i32, i32, i32, i32, i32, i32, i32 }
%struct.III_psy_ratio = type { %struct.III_psy_xmin, %struct.III_psy_xmin }
%struct.III_psy_xmin = type { [22 x double], [13 x [3 x double]] }
%struct.III_side_info_t = type { i32, i32, i32, [2 x [4 x i32]], [2 x %struct.anon] }
%struct.anon = type { [2 x %struct.gr_info_ss] }
%struct.gr_info_ss = type { %struct.gr_info }
%struct.III_scalefac_t = type { [22 x i32], [13 x [3 x i32]] }

@pow43 = external local_unnamed_addr global [8208 x double], align 16
@.str = private unnamed_addr constant [13 x i8] c"sf_ok!=10000\00", align 1
@.str.1 = private unnamed_addr constant [14 x i8] c"vbrquantize.c\00", align 1
@__PRETTY_FUNCTION__.find_scalefac = private unnamed_addr constant [64 x i8] c"FLOAT8 find_scalefac(FLOAT8 *, FLOAT8 *, int, int, FLOAT8, int)\00", align 1
@pretab = external local_unnamed_addr global [21 x i32], align 16
@masking_lower = external local_unnamed_addr global float, align 4
@convert_mdct = external local_unnamed_addr global i32, align 4
@scalefac_band = external local_unnamed_addr global %struct.scalefac_struct, align 4

; Function Attrs: noinline nounwind uwtable
define double @calc_sfb_ave_noise(double* nocapture readonly, double* nocapture readonly, i32, i32, double) local_unnamed_addr #0 {
  %6 = tail call double @pow(double %4, double 7.500000e-01) #7
  %7 = mul nsw i32 %3, %2
  %8 = icmp sgt i32 %7, 0
  br i1 %8, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %5
  %9 = sext i32 %2 to i64
  %10 = sext i32 %7 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %37
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %37 ]
  %.026 = phi double [ 0.000000e+00, %.lr.ph.preheader ], [ %39, %37 ]
  %11 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %12 = load double, double* %11, align 8
  %13 = fdiv double %12, %6
  %14 = tail call double @floor(double %13) #6
  %15 = fptosi double %14 to i32
  %16 = icmp sgt i32 %15, 8206
  br i1 %16, label %.loopexit.loopexit, label %17

; <label>:17:                                     ; preds = %.lr.ph
  %18 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call double @fabs(double %19) #6
  %21 = sext i32 %15 to i64
  %22 = getelementptr inbounds [8208 x double], [8208 x double]* @pow43, i64 0, i64 %21
  %23 = load double, double* %22, align 8
  %24 = fmul double %23, %4
  %25 = fsub double %20, %24
  %26 = icmp eq i32 %15, 8206
  br i1 %26, label %37, label %27

; <label>:27:                                     ; preds = %17
  %28 = add nsw i32 %15, 1
  %29 = sext i32 %28 to i64
  %30 = getelementptr inbounds [8208 x double], [8208 x double]* @pow43, i64 0, i64 %29
  %31 = load double, double* %30, align 8
  %32 = fmul double %31, %4
  %33 = fsub double %20, %32
  %34 = tail call double @fabs(double %33) #6
  %35 = tail call double @fabs(double %25) #6
  %36 = fcmp olt double %34, %35
  %.01 = select i1 %36, double %33, double %25
  br label %37

; <label>:37:                                     ; preds = %17, %27
  %.1 = phi double [ %25, %17 ], [ %.01, %27 ]
  %38 = fmul double %.1, %.1
  %39 = fadd double %.026, %38
  %indvars.iv.next = add i64 %indvars.iv, %9
  %40 = icmp slt i64 %indvars.iv.next, %10
  br i1 %40, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %37
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %5
  %.02.lcssa = phi double [ 0.000000e+00, %5 ], [ %39, %._crit_edge.loopexit ]
  %41 = sitofp i32 %3 to double
  %42 = fdiv double %.02.lcssa, %41
  br label %.loopexit

.loopexit.loopexit:                               ; preds = %.lr.ph
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge
  %.0 = phi double [ %42, %._crit_edge ], [ -1.000000e+00, %.loopexit.loopexit ]
  ret double %.0
}

; Function Attrs: nounwind
declare double @pow(double, double) local_unnamed_addr #1

; Function Attrs: nounwind readnone
declare double @floor(double) local_unnamed_addr #2

; Function Attrs: nounwind readnone
declare double @fabs(double) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define double @find_scalefac(double* nocapture readonly, double* nocapture readonly, i32, i32, double, i32) local_unnamed_addr #0 {
  br label %7

; <label>:7:                                      ; preds = %6
  %8 = tail call double @calc_sfb_ave_noise(double* %0, double* %1, i32 %2, i32 %5, double 0x3EA6A09E667F3BCD)
  %9 = fcmp olt double %8, 0.000000e+00
  br i1 %9, label %10, label %11

; <label>:10:                                     ; preds = %7
  br label %15

; <label>:11:                                     ; preds = %7
  %12 = fcmp ogt double %8, %4
  br i1 %12, label %13, label %14

; <label>:13:                                     ; preds = %11
  br label %15

; <label>:14:                                     ; preds = %11
  br label %15

; <label>:15:                                     ; preds = %10, %14, %13
  %.215 = phi double [ -4.500000e+00, %10 ], [ -3.650000e+01, %13 ], [ -4.500000e+00, %14 ]
  %.312 = phi double [ 1.000000e+04, %10 ], [ -2.050000e+01, %13 ], [ -2.050000e+01, %14 ]
  %exp218.1 = tail call double @llvm.exp2.f64(double %.215)
  %16 = tail call double @calc_sfb_ave_noise(double* %0, double* %1, i32 %2, i32 %5, double %exp218.1)
  %17 = fcmp olt double %16, 0.000000e+00
  br i1 %17, label %42, label %35

; <label>:18:                                     ; preds = %101
  tail call void @__assert_fail(i8* getelementptr inbounds ([13 x i8], [13 x i8]* @.str, i64 0, i64 0), i8* getelementptr inbounds ([14 x i8], [14 x i8]* @.str.1, i64 0, i64 0), i32 108, i8* getelementptr inbounds ([64 x i8], [64 x i8]* @__PRETTY_FUNCTION__.find_scalefac, i64 0, i64 0)) #8
  unreachable

; <label>:19:                                     ; preds = %101
  %20 = fadd double %.312.6, 7.500000e-01
  %21 = fadd double %.312.6, 1.000000e-02
  %22 = fcmp ogt double %20, %21
  br i1 %22, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %19
  %23 = fadd double %.312.6, 5.000000e-01
  br label %24

; <label>:24:                                     ; preds = %.lr.ph, %32
  %.31619 = phi double [ %20, %.lr.ph ], [ %33, %32 ]
  %25 = fsub double %.31619, %23
  %26 = tail call double @fabs(double %25) #6
  %27 = fcmp olt double %26, 1.000000e-02
  %28 = fadd double %.31619, -2.500000e-01
  %.417 = select i1 %27, double %28, double %.31619
  %exp2 = tail call double @llvm.exp2.f64(double %.417)
  %29 = tail call double @calc_sfb_ave_noise(double* %0, double* %1, i32 %2, i32 %5, double %exp2)
  %30 = fcmp ule double %29, 0.000000e+00
  %31 = fcmp ugt double %29, %4
  %or.cond = or i1 %30, %31
  br i1 %or.cond, label %32, label %._crit_edge.loopexit

; <label>:32:                                     ; preds = %24
  %33 = fadd double %.417, -2.500000e-01
  %34 = fcmp ogt double %33, %21
  br i1 %34, label %24, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %24, %32
  %.0.ph = phi double [ %.417, %24 ], [ %.312.6, %32 ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %19
  %.0 = phi double [ %.312.6, %19 ], [ %.0.ph, %._crit_edge.loopexit ]
  ret double %.0

; <label>:35:                                     ; preds = %15
  %36 = fcmp ogt double %16, %4
  br i1 %36, label %39, label %37

; <label>:37:                                     ; preds = %35
  %38 = fadd double %.215, 8.000000e+00
  br label %44

; <label>:39:                                     ; preds = %35
  %40 = fcmp oeq double %.312, 1.000000e+04
  %.110.1 = select i1 %40, double %.215, double %.312
  %41 = fadd double %.215, -8.000000e+00
  br label %44

; <label>:42:                                     ; preds = %15
  %43 = fadd double %.215, 8.000000e+00
  br label %44

; <label>:44:                                     ; preds = %42, %39, %37
  %.215.1 = phi double [ %43, %42 ], [ %41, %39 ], [ %38, %37 ]
  %.312.1 = phi double [ %.312, %42 ], [ %.110.1, %39 ], [ %.215, %37 ]
  %exp218.2 = tail call double @llvm.exp2.f64(double %.215.1)
  %45 = tail call double @calc_sfb_ave_noise(double* %0, double* %1, i32 %2, i32 %5, double %exp218.2)
  %46 = fcmp olt double %45, 0.000000e+00
  br i1 %46, label %54, label %47

; <label>:47:                                     ; preds = %44
  %48 = fcmp ogt double %45, %4
  br i1 %48, label %51, label %49

; <label>:49:                                     ; preds = %47
  %50 = fadd double %.215.1, 4.000000e+00
  br label %56

; <label>:51:                                     ; preds = %47
  %52 = fcmp oeq double %.312.1, 1.000000e+04
  %.110.2 = select i1 %52, double %.215.1, double %.312.1
  %53 = fadd double %.215.1, -4.000000e+00
  br label %56

; <label>:54:                                     ; preds = %44
  %55 = fadd double %.215.1, 4.000000e+00
  br label %56

; <label>:56:                                     ; preds = %54, %51, %49
  %.215.2 = phi double [ %55, %54 ], [ %53, %51 ], [ %50, %49 ]
  %.312.2 = phi double [ %.312.1, %54 ], [ %.110.2, %51 ], [ %.215.1, %49 ]
  %exp218.3 = tail call double @llvm.exp2.f64(double %.215.2)
  %57 = tail call double @calc_sfb_ave_noise(double* %0, double* %1, i32 %2, i32 %5, double %exp218.3)
  %58 = fcmp olt double %57, 0.000000e+00
  br i1 %58, label %66, label %59

; <label>:59:                                     ; preds = %56
  %60 = fcmp ogt double %57, %4
  br i1 %60, label %63, label %61

; <label>:61:                                     ; preds = %59
  %62 = fadd double %.215.2, 2.000000e+00
  br label %68

; <label>:63:                                     ; preds = %59
  %64 = fcmp oeq double %.312.2, 1.000000e+04
  %.110.3 = select i1 %64, double %.215.2, double %.312.2
  %65 = fadd double %.215.2, -2.000000e+00
  br label %68

; <label>:66:                                     ; preds = %56
  %67 = fadd double %.215.2, 2.000000e+00
  br label %68

; <label>:68:                                     ; preds = %66, %63, %61
  %.215.3 = phi double [ %67, %66 ], [ %65, %63 ], [ %62, %61 ]
  %.312.3 = phi double [ %.312.2, %66 ], [ %.110.3, %63 ], [ %.215.2, %61 ]
  %exp218.4 = tail call double @llvm.exp2.f64(double %.215.3)
  %69 = tail call double @calc_sfb_ave_noise(double* %0, double* %1, i32 %2, i32 %5, double %exp218.4)
  %70 = fcmp olt double %69, 0.000000e+00
  br i1 %70, label %78, label %71

; <label>:71:                                     ; preds = %68
  %72 = fcmp ogt double %69, %4
  br i1 %72, label %75, label %73

; <label>:73:                                     ; preds = %71
  %74 = fadd double %.215.3, 1.000000e+00
  br label %80

; <label>:75:                                     ; preds = %71
  %76 = fcmp oeq double %.312.3, 1.000000e+04
  %.110.4 = select i1 %76, double %.215.3, double %.312.3
  %77 = fadd double %.215.3, -1.000000e+00
  br label %80

; <label>:78:                                     ; preds = %68
  %79 = fadd double %.215.3, 1.000000e+00
  br label %80

; <label>:80:                                     ; preds = %78, %75, %73
  %.215.4 = phi double [ %79, %78 ], [ %77, %75 ], [ %74, %73 ]
  %.312.4 = phi double [ %.312.3, %78 ], [ %.110.4, %75 ], [ %.215.3, %73 ]
  %exp218.5 = tail call double @llvm.exp2.f64(double %.215.4)
  %81 = tail call double @calc_sfb_ave_noise(double* %0, double* %1, i32 %2, i32 %5, double %exp218.5)
  %82 = fcmp olt double %81, 0.000000e+00
  br i1 %82, label %90, label %83

; <label>:83:                                     ; preds = %80
  %84 = fcmp ogt double %81, %4
  br i1 %84, label %87, label %85

; <label>:85:                                     ; preds = %83
  %86 = fadd double %.215.4, 5.000000e-01
  br label %92

; <label>:87:                                     ; preds = %83
  %88 = fcmp oeq double %.312.4, 1.000000e+04
  %.110.5 = select i1 %88, double %.215.4, double %.312.4
  %89 = fadd double %.215.4, -5.000000e-01
  br label %92

; <label>:90:                                     ; preds = %80
  %91 = fadd double %.215.4, 5.000000e-01
  br label %92

; <label>:92:                                     ; preds = %90, %87, %85
  %.215.5 = phi double [ %91, %90 ], [ %89, %87 ], [ %86, %85 ]
  %.312.5 = phi double [ %.312.4, %90 ], [ %.110.5, %87 ], [ %.215.4, %85 ]
  %exp218.6 = tail call double @llvm.exp2.f64(double %.215.5)
  %93 = tail call double @calc_sfb_ave_noise(double* %0, double* %1, i32 %2, i32 %5, double %exp218.6)
  %94 = fcmp olt double %93, 0.000000e+00
  br i1 %94, label %100, label %95

; <label>:95:                                     ; preds = %92
  %96 = fcmp ogt double %93, %4
  br i1 %96, label %98, label %97

; <label>:97:                                     ; preds = %95
  br label %101

; <label>:98:                                     ; preds = %95
  %99 = fcmp oeq double %.312.5, 1.000000e+04
  %.110.6 = select i1 %99, double %.215.5, double %.312.5
  br label %101

; <label>:100:                                    ; preds = %92
  br label %101

; <label>:101:                                    ; preds = %100, %98, %97
  %.312.6 = phi double [ %.312.5, %100 ], [ %.110.6, %98 ], [ %.215.5, %97 ]
  %102 = fcmp une double %.312.6, 1.000000e+04
  br i1 %102, label %19, label %18
}

; Function Attrs: noreturn nounwind
declare void @__assert_fail(i8*, i8*, i32, i8*) local_unnamed_addr #3

; Function Attrs: noinline nounwind uwtable
define double @compute_scalefacs_short([3 x double]* nocapture readonly, %struct.gr_info* nocapture readonly, [3 x i32]* nocapture) local_unnamed_addr #0 {
  %4 = alloca [12 x [3 x double]], align 16
  %5 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %1, i64 0, i32 13
  %6 = load i32, i32* %5, align 4
  %7 = icmp eq i32 %6, 0
  %8 = bitcast [12 x [3 x double]]* %4 to i8*
  %9 = bitcast [3 x double]* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %8, i8* %9, i64 288, i32 8, i1 false)
  %10 = select i1 %7, double 2.000000e+00, double 1.000000e+00
  br label %11

; <label>:11:                                     ; preds = %3, %11
  %indvars.iv = phi i64 [ 0, %3 ], [ %indvars.iv.next, %11 ]
  %.026 = phi double [ 0.000000e+00, %3 ], [ %.2.2, %11 ]
  %12 = icmp slt i64 %indvars.iv, 6
  %.sink = select i1 %12, double 1.500000e+01, double 7.000000e+00
  %13 = fdiv double %.sink, %10
  %14 = getelementptr inbounds [12 x [3 x double]], [12 x [3 x double]]* %4, i64 0, i64 %indvars.iv, i64 0
  %15 = load double, double* %14, align 8
  %16 = fmul double %10, %15
  %17 = fsub double 7.500000e-01, %16
  %18 = fadd double %17, 1.000000e-04
  %19 = tail call double @floor(double %18) #6
  %20 = fptosi double %19 to i32
  %21 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 %indvars.iv, i64 0
  store i32 %20, i32* %21, align 4
  %22 = load double, double* %14, align 8
  %23 = fadd double %13, %22
  %24 = fcmp ogt double %23, %.026
  %.2 = select i1 %24, double %23, double %.026
  %25 = getelementptr inbounds [12 x [3 x double]], [12 x [3 x double]]* %4, i64 0, i64 %indvars.iv, i64 1
  %26 = load double, double* %25, align 8
  %27 = fmul double %10, %26
  %28 = fsub double 7.500000e-01, %27
  %29 = fadd double %28, 1.000000e-04
  %30 = tail call double @floor(double %29) #6
  %31 = fptosi double %30 to i32
  %32 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 %indvars.iv, i64 1
  store i32 %31, i32* %32, align 4
  %33 = load double, double* %25, align 8
  %34 = fadd double %13, %33
  %35 = fcmp ogt double %34, %.2
  %.2.1 = select i1 %35, double %34, double %.2
  %36 = getelementptr inbounds [12 x [3 x double]], [12 x [3 x double]]* %4, i64 0, i64 %indvars.iv, i64 2
  %37 = load double, double* %36, align 8
  %38 = fmul double %10, %37
  %39 = fsub double 7.500000e-01, %38
  %40 = fadd double %39, 1.000000e-04
  %41 = tail call double @floor(double %40) #6
  %42 = fptosi double %41 to i32
  %43 = getelementptr inbounds [3 x i32], [3 x i32]* %2, i64 %indvars.iv, i64 2
  store i32 %42, i32* %43, align 4
  %44 = load double, double* %36, align 8
  %45 = fadd double %13, %44
  %46 = fcmp ogt double %45, %.2.1
  %.2.2 = select i1 %46, double %45, double %.2.1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 12
  br i1 %exitcond, label %47, label %11

; <label>:47:                                     ; preds = %11
  ret double %.2.2
}

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #4

; Function Attrs: noinline nounwind uwtable
define double @compute_scalefacs_long(double* nocapture readonly, %struct.gr_info* nocapture, i32* nocapture) local_unnamed_addr #0 {
  %4 = alloca [21 x double], align 16
  %5 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %1, i64 0, i32 13
  %6 = load i32, i32* %5, align 4
  %7 = icmp eq i32 %6, 0
  %8 = select i1 %7, i32 2, i32 1
  %9 = bitcast [21 x double]* %4 to i8*
  %10 = bitcast double* %0 to i8*
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* nonnull %9, i8* %10, i64 168, i32 8, i1 false)
  %11 = getelementptr inbounds %struct.gr_info, %struct.gr_info* %1, i64 0, i32 12
  store i32 0, i32* %11, align 8
  %12 = getelementptr inbounds [21 x double], [21 x double]* %4, i64 0, i64 11
  %13 = load double, double* %12, align 8
  %14 = load i32, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @pretab, i64 0, i64 11), align 4
  %15 = sdiv i32 %14, %8
  %16 = sitofp i32 %15 to double
  %17 = fadd double %13, %16
  %18 = fcmp ogt double %17, 0.000000e+00
  br i1 %18, label %.thread.preheader, label %20

.thread.preheader:                                ; preds = %3, %20, %102, %110, %118, %126, %134, %142, %150, %158, %.thread.preheader.loopexit14
  %19 = sitofp i32 %8 to double
  br label %.thread

; <label>:20:                                     ; preds = %3
  %21 = getelementptr inbounds [21 x double], [21 x double]* %4, i64 0, i64 12
  %22 = load double, double* %21, align 16
  %23 = load i32, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @pretab, i64 0, i64 12), align 16
  %24 = sdiv i32 %23, %8
  %25 = sitofp i32 %24 to double
  %26 = fadd double %22, %25
  %27 = fcmp ogt double %26, 0.000000e+00
  br i1 %27, label %.thread.preheader, label %102

.thread.preheader.loopexit14:                     ; preds = %158
  store i32 1, i32* %11, align 8
  %28 = load i32, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @pretab, i64 0, i64 11), align 4
  %29 = sdiv i32 %28, %8
  %30 = sitofp i32 %29 to double
  %31 = getelementptr inbounds [21 x double], [21 x double]* %4, i64 0, i64 11
  %32 = load double, double* %31, align 8
  %33 = fadd double %32, %30
  store double %33, double* %31, align 8
  %34 = load i32, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @pretab, i64 0, i64 12), align 16
  %35 = sdiv i32 %34, %8
  %36 = sitofp i32 %35 to double
  %37 = getelementptr inbounds [21 x double], [21 x double]* %4, i64 0, i64 12
  %38 = load double, double* %37, align 16
  %39 = fadd double %38, %36
  store double %39, double* %37, align 16
  %40 = load i32, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @pretab, i64 0, i64 13), align 4
  %41 = sdiv i32 %40, %8
  %42 = sitofp i32 %41 to double
  %43 = getelementptr inbounds [21 x double], [21 x double]* %4, i64 0, i64 13
  %44 = load double, double* %43, align 8
  %45 = fadd double %44, %42
  store double %45, double* %43, align 8
  %46 = load i32, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @pretab, i64 0, i64 14), align 8
  %47 = sdiv i32 %46, %8
  %48 = sitofp i32 %47 to double
  %49 = getelementptr inbounds [21 x double], [21 x double]* %4, i64 0, i64 14
  %50 = load double, double* %49, align 16
  %51 = fadd double %50, %48
  store double %51, double* %49, align 16
  %52 = load i32, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @pretab, i64 0, i64 15), align 4
  %53 = sdiv i32 %52, %8
  %54 = sitofp i32 %53 to double
  %55 = getelementptr inbounds [21 x double], [21 x double]* %4, i64 0, i64 15
  %56 = load double, double* %55, align 8
  %57 = fadd double %56, %54
  store double %57, double* %55, align 8
  %58 = load i32, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @pretab, i64 0, i64 16), align 16
  %59 = sdiv i32 %58, %8
  %60 = sitofp i32 %59 to double
  %61 = getelementptr inbounds [21 x double], [21 x double]* %4, i64 0, i64 16
  %62 = load double, double* %61, align 16
  %63 = fadd double %62, %60
  store double %63, double* %61, align 16
  %64 = load i32, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @pretab, i64 0, i64 17), align 4
  %65 = sdiv i32 %64, %8
  %66 = sitofp i32 %65 to double
  %67 = getelementptr inbounds [21 x double], [21 x double]* %4, i64 0, i64 17
  %68 = load double, double* %67, align 8
  %69 = fadd double %68, %66
  store double %69, double* %67, align 8
  %70 = load i32, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @pretab, i64 0, i64 18), align 8
  %71 = sdiv i32 %70, %8
  %72 = sitofp i32 %71 to double
  %73 = getelementptr inbounds [21 x double], [21 x double]* %4, i64 0, i64 18
  %74 = load double, double* %73, align 16
  %75 = fadd double %74, %72
  store double %75, double* %73, align 16
  %76 = load i32, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @pretab, i64 0, i64 19), align 4
  %77 = sdiv i32 %76, %8
  %78 = sitofp i32 %77 to double
  %79 = getelementptr inbounds [21 x double], [21 x double]* %4, i64 0, i64 19
  %80 = load double, double* %79, align 8
  %81 = fadd double %80, %78
  store double %81, double* %79, align 8
  %82 = load i32, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @pretab, i64 0, i64 20), align 16
  %83 = sdiv i32 %82, %8
  %84 = sitofp i32 %83 to double
  %85 = getelementptr inbounds [21 x double], [21 x double]* %4, i64 0, i64 20
  %86 = load double, double* %85, align 16
  %87 = fadd double %86, %84
  store double %87, double* %85, align 16
  br label %.thread.preheader

.thread:                                          ; preds = %.thread, %.thread.preheader
  %indvars.iv = phi i64 [ 0, %.thread.preheader ], [ %indvars.iv.next, %.thread ]
  %.07 = phi double [ 0.000000e+00, %.thread.preheader ], [ %.1, %.thread ]
  %88 = getelementptr inbounds [21 x double], [21 x double]* %4, i64 0, i64 %indvars.iv
  %89 = load double, double* %88, align 8
  %90 = fmul double %19, %89
  %91 = fsub double 7.500000e-01, %90
  %92 = fadd double %91, 1.000000e-04
  %93 = tail call double @floor(double %92) #6
  %94 = fptosi double %93 to i32
  %95 = getelementptr inbounds i32, i32* %2, i64 %indvars.iv
  store i32 %94, i32* %95, align 4
  %96 = icmp slt i64 %indvars.iv, 11
  %.sink = select i1 %96, double 1.500000e+01, double 7.000000e+00
  %97 = fdiv double %.sink, %19
  %98 = load double, double* %88, align 8
  %99 = fadd double %97, %98
  %100 = fcmp ogt double %99, %.07
  %.1 = select i1 %100, double %99, double %.07
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 21
  br i1 %exitcond, label %101, label %.thread

; <label>:101:                                    ; preds = %.thread
  ret double %.1

; <label>:102:                                    ; preds = %20
  %103 = getelementptr inbounds [21 x double], [21 x double]* %4, i64 0, i64 13
  %104 = load double, double* %103, align 8
  %105 = load i32, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @pretab, i64 0, i64 13), align 4
  %106 = sdiv i32 %105, %8
  %107 = sitofp i32 %106 to double
  %108 = fadd double %104, %107
  %109 = fcmp ogt double %108, 0.000000e+00
  br i1 %109, label %.thread.preheader, label %110

; <label>:110:                                    ; preds = %102
  %111 = getelementptr inbounds [21 x double], [21 x double]* %4, i64 0, i64 14
  %112 = load double, double* %111, align 16
  %113 = load i32, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @pretab, i64 0, i64 14), align 8
  %114 = sdiv i32 %113, %8
  %115 = sitofp i32 %114 to double
  %116 = fadd double %112, %115
  %117 = fcmp ogt double %116, 0.000000e+00
  br i1 %117, label %.thread.preheader, label %118

; <label>:118:                                    ; preds = %110
  %119 = getelementptr inbounds [21 x double], [21 x double]* %4, i64 0, i64 15
  %120 = load double, double* %119, align 8
  %121 = load i32, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @pretab, i64 0, i64 15), align 4
  %122 = sdiv i32 %121, %8
  %123 = sitofp i32 %122 to double
  %124 = fadd double %120, %123
  %125 = fcmp ogt double %124, 0.000000e+00
  br i1 %125, label %.thread.preheader, label %126

; <label>:126:                                    ; preds = %118
  %127 = getelementptr inbounds [21 x double], [21 x double]* %4, i64 0, i64 16
  %128 = load double, double* %127, align 16
  %129 = load i32, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @pretab, i64 0, i64 16), align 16
  %130 = sdiv i32 %129, %8
  %131 = sitofp i32 %130 to double
  %132 = fadd double %128, %131
  %133 = fcmp ogt double %132, 0.000000e+00
  br i1 %133, label %.thread.preheader, label %134

; <label>:134:                                    ; preds = %126
  %135 = getelementptr inbounds [21 x double], [21 x double]* %4, i64 0, i64 17
  %136 = load double, double* %135, align 8
  %137 = load i32, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @pretab, i64 0, i64 17), align 4
  %138 = sdiv i32 %137, %8
  %139 = sitofp i32 %138 to double
  %140 = fadd double %136, %139
  %141 = fcmp ogt double %140, 0.000000e+00
  br i1 %141, label %.thread.preheader, label %142

; <label>:142:                                    ; preds = %134
  %143 = getelementptr inbounds [21 x double], [21 x double]* %4, i64 0, i64 18
  %144 = load double, double* %143, align 16
  %145 = load i32, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @pretab, i64 0, i64 18), align 8
  %146 = sdiv i32 %145, %8
  %147 = sitofp i32 %146 to double
  %148 = fadd double %144, %147
  %149 = fcmp ogt double %148, 0.000000e+00
  br i1 %149, label %.thread.preheader, label %150

; <label>:150:                                    ; preds = %142
  %151 = getelementptr inbounds [21 x double], [21 x double]* %4, i64 0, i64 19
  %152 = load double, double* %151, align 8
  %153 = load i32, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @pretab, i64 0, i64 19), align 4
  %154 = sdiv i32 %153, %8
  %155 = sitofp i32 %154 to double
  %156 = fadd double %152, %155
  %157 = fcmp ogt double %156, 0.000000e+00
  br i1 %157, label %.thread.preheader, label %158

; <label>:158:                                    ; preds = %150
  %159 = getelementptr inbounds [21 x double], [21 x double]* %4, i64 0, i64 20
  %160 = load double, double* %159, align 16
  %161 = load i32, i32* getelementptr inbounds ([21 x i32], [21 x i32]* @pretab, i64 0, i64 20), align 16
  %162 = sdiv i32 %161, %8
  %163 = sitofp i32 %162 to double
  %164 = fadd double %160, %163
  %165 = fcmp ogt double %164, 0.000000e+00
  br i1 %165, label %.thread.preheader, label %.thread.preheader.loopexit14
}

; Function Attrs: noinline nounwind uwtable
define void @VBR_iteration_loop_new(%struct.lame_global_flags*, [2 x double]* nocapture readnone, double* nocapture readnone, [2 x [576 x double]]*, [2 x %struct.III_psy_ratio]*, %struct.III_side_info_t*, [2 x [576 x i32]]*, [2 x %struct.III_scalefac_t]* nocapture) local_unnamed_addr #0 {
  %9 = alloca [2 x [2 x %struct.III_psy_xmin]], align 16
  %10 = alloca %struct.III_psy_xmin, align 8
  %11 = alloca [576 x double], align 16
  tail call void @iteration_init(%struct.lame_global_flags* %0, %struct.III_side_info_t* %5, [2 x [576 x i32]]* %6) #7
  %12 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 22
  %13 = load i32, i32* %12, align 4
  %14 = shl i32 %13, 1
  %15 = add nsw i32 %14, -10
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 1.000000e+01
  %18 = fcmp ogt double %17, 1.270000e+02
  br i1 %18, label %cdce.call, label %cdce.end, !prof !1

cdce.call:                                        ; preds = %8
  %19 = tail call double @pow(double 1.000000e+01, double %17) #7
  br label %cdce.end

cdce.end:                                         ; preds = %8, %cdce.call
  store float 1.000000e+00, float* @masking_lower, align 4
  %20 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 45
  %21 = load i32, i32* %20, align 8
  %22 = icmp sgt i32 %21, 0
  br i1 %22, label %.lr.ph28, label %._crit_edge29

.lr.ph28:                                         ; preds = %cdce.end
  %23 = getelementptr inbounds %struct.lame_global_flags, %struct.lame_global_flags* %0, i64 0, i32 46
  %24 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %10, i64 0, i32 1, i64 0
  %25 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %10, i64 0, i32 0, i64 0
  %26 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %10, i64 0, i32 0, i64 0
  %27 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %10, i64 0, i32 0, i64 1
  %28 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %10, i64 0, i32 0, i64 2
  %29 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %10, i64 0, i32 0, i64 3
  %30 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %10, i64 0, i32 0, i64 4
  %31 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %10, i64 0, i32 0, i64 5
  %32 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %10, i64 0, i32 0, i64 6
  %33 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %10, i64 0, i32 0, i64 7
  %34 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %10, i64 0, i32 0, i64 8
  %35 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %10, i64 0, i32 0, i64 9
  %36 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %10, i64 0, i32 0, i64 10
  %37 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %10, i64 0, i32 0, i64 11
  %38 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %10, i64 0, i32 0, i64 12
  %39 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %10, i64 0, i32 0, i64 13
  %40 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %10, i64 0, i32 0, i64 14
  %41 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %10, i64 0, i32 0, i64 15
  %42 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %10, i64 0, i32 0, i64 16
  %43 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %10, i64 0, i32 0, i64 17
  %44 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %10, i64 0, i32 0, i64 18
  %45 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %10, i64 0, i32 0, i64 19
  %46 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %10, i64 0, i32 0, i64 20
  br label %47

; <label>:47:                                     ; preds = %.lr.ph28, %._crit_edge
  %indvars.iv50 = phi i64 [ 0, %.lr.ph28 ], [ %indvars.iv.next51, %._crit_edge ]
  %48 = load i32, i32* @convert_mdct, align 4
  %49 = icmp eq i32 %48, 0
  %50 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %3, i64 %indvars.iv50, i64 0
  br i1 %49, label %.preheader16, label %51

; <label>:51:                                     ; preds = %47
  call void @ms_convert([576 x double]* %50, [576 x double]* %50) #7
  br label %.preheader16

.preheader16:                                     ; preds = %47, %51
  %52 = load i32, i32* %23, align 4
  %53 = icmp sgt i32 %52, 0
  br i1 %53, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader16
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %237
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %237 ], [ 0, %.lr.ph.preheader ]
  %54 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %5, i64 0, i32 4, i64 %indvars.iv50, i32 0, i64 %indvars.iv48, i32 0, i32 6
  %55 = load i32, i32* %54, align 8
  br label %56

; <label>:56:                                     ; preds = %56, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.2, %56 ]
  %57 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %3, i64 %indvars.iv50, i64 %indvars.iv48, i64 %indvars.iv
  %58 = load double, double* %57, align 8
  %59 = call double @fabs(double %58) #6
  %60 = call double @sqrt(double %59) #7
  %61 = fmul double %59, %60
  %62 = call double @sqrt(double %61) #7
  %63 = getelementptr inbounds [576 x double], [576 x double]* %11, i64 0, i64 %indvars.iv
  store double %62, double* %63, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %64 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %3, i64 %indvars.iv50, i64 %indvars.iv48, i64 %indvars.iv.next
  %65 = load double, double* %64, align 8
  %66 = call double @fabs(double %65) #6
  %67 = call double @sqrt(double %66) #7
  %68 = fmul double %66, %67
  %69 = call double @sqrt(double %68) #7
  %70 = getelementptr inbounds [576 x double], [576 x double]* %11, i64 0, i64 %indvars.iv.next
  store double %69, double* %70, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %71 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %3, i64 %indvars.iv50, i64 %indvars.iv48, i64 %indvars.iv.next.1
  %72 = load double, double* %71, align 8
  %73 = call double @fabs(double %72) #6
  %74 = call double @sqrt(double %73) #7
  %75 = fmul double %73, %74
  %76 = call double @sqrt(double %75) #7
  %77 = getelementptr inbounds [576 x double], [576 x double]* %11, i64 0, i64 %indvars.iv.next.1
  store double %76, double* %77, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next.2, 576
  br i1 %exitcond.2, label %78, label %56

; <label>:78:                                     ; preds = %56
  %79 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %5, i64 0, i32 4, i64 %indvars.iv50, i32 0, i64 %indvars.iv48, i32 0
  %80 = icmp eq i32 %55, 2
  %81 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %3, i64 %indvars.iv50, i64 %indvars.iv48, i64 0
  %82 = getelementptr inbounds [2 x %struct.III_psy_ratio], [2 x %struct.III_psy_ratio]* %4, i64 %indvars.iv50, i64 %indvars.iv48
  %83 = getelementptr inbounds [2 x [2 x %struct.III_psy_xmin]], [2 x [2 x %struct.III_psy_xmin]]* %9, i64 0, i64 %indvars.iv50, i64 %indvars.iv48
  %84 = call i32 @calc_xmin(%struct.lame_global_flags* %0, double* %81, %struct.III_psy_ratio* %82, %struct.gr_info* %79, %struct.III_psy_xmin* %83) #7
  br i1 %80, label %.preheader52.preheader, label %.outer.preheader

.outer.preheader:                                 ; preds = %78
  br label %.outer

.preheader52.preheader:                           ; preds = %78
  br label %.preheader52

.preheader52:                                     ; preds = %.preheader52.preheader, %.preheader52
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %.preheader52 ], [ 0, %.preheader52.preheader ]
  %.022 = phi double [ %.2.2, %.preheader52 ], [ 0.000000e+00, %.preheader52.preheader ]
  %85 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 %indvars.iv37
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %86 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 1, i64 %indvars.iv.next38
  %87 = load i32, i32* %85, align 4
  %88 = load i32, i32* %86, align 4
  %89 = sub nsw i32 %88, %87
  %90 = mul nsw i32 %87, 3
  %91 = sext i32 %90 to i64
  %92 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %3, i64 %indvars.iv50, i64 %indvars.iv48, i64 %91
  %93 = getelementptr inbounds [576 x double], [576 x double]* %11, i64 0, i64 %91
  %94 = load float, float* @masking_lower, align 4
  %95 = fpext float %94 to double
  %96 = getelementptr inbounds [2 x [2 x %struct.III_psy_xmin]], [2 x [2 x %struct.III_psy_xmin]]* %9, i64 0, i64 %indvars.iv50, i64 %indvars.iv48, i32 1, i64 %indvars.iv37, i64 0
  %97 = load double, double* %96, align 8
  %98 = fmul double %95, %97
  %99 = call double @find_scalefac(double* %92, double* %93, i32 3, i32 undef, double %98, i32 %89)
  %100 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %10, i64 0, i32 1, i64 %indvars.iv37, i64 0
  store double %99, double* %100, align 8
  %101 = fcmp ogt double %99, %.022
  %.2 = select i1 %101, double %99, double %.022
  %102 = load i32, i32* %85, align 4
  %103 = load i32, i32* %86, align 4
  %104 = sub nsw i32 %103, %102
  %105 = mul nsw i32 %102, 3
  %106 = add nsw i32 %105, 1
  %107 = sext i32 %106 to i64
  %108 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %3, i64 %indvars.iv50, i64 %indvars.iv48, i64 %107
  %109 = getelementptr inbounds [576 x double], [576 x double]* %11, i64 0, i64 %107
  %110 = load float, float* @masking_lower, align 4
  %111 = fpext float %110 to double
  %112 = getelementptr inbounds [2 x [2 x %struct.III_psy_xmin]], [2 x [2 x %struct.III_psy_xmin]]* %9, i64 0, i64 %indvars.iv50, i64 %indvars.iv48, i32 1, i64 %indvars.iv37, i64 1
  %113 = load double, double* %112, align 8
  %114 = fmul double %111, %113
  %115 = call double @find_scalefac(double* %108, double* %109, i32 3, i32 undef, double %114, i32 %104)
  %116 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %10, i64 0, i32 1, i64 %indvars.iv37, i64 1
  store double %115, double* %116, align 8
  %117 = fcmp ogt double %115, %.2
  %.2.1 = select i1 %117, double %115, double %.2
  %118 = load i32, i32* %85, align 4
  %119 = load i32, i32* %86, align 4
  %120 = sub nsw i32 %119, %118
  %121 = mul nsw i32 %118, 3
  %122 = add nsw i32 %121, 2
  %123 = sext i32 %122 to i64
  %124 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %3, i64 %indvars.iv50, i64 %indvars.iv48, i64 %123
  %125 = getelementptr inbounds [576 x double], [576 x double]* %11, i64 0, i64 %123
  %126 = load float, float* @masking_lower, align 4
  %127 = fpext float %126 to double
  %128 = getelementptr inbounds [2 x [2 x %struct.III_psy_xmin]], [2 x [2 x %struct.III_psy_xmin]]* %9, i64 0, i64 %indvars.iv50, i64 %indvars.iv48, i32 1, i64 %indvars.iv37, i64 2
  %129 = load double, double* %128, align 8
  %130 = fmul double %127, %129
  %131 = call double @find_scalefac(double* %124, double* %125, i32 3, i32 undef, double %130, i32 %120)
  %132 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %10, i64 0, i32 1, i64 %indvars.iv37, i64 2
  store double %131, double* %132, align 8
  %133 = fcmp ogt double %131, %.2.1
  %.2.2 = select i1 %133, double %131, double %.2.1
  %exitcond = icmp eq i64 %indvars.iv.next38, 12
  br i1 %exitcond, label %.loopexit.loopexit55, label %.preheader52

; <label>:134:                                    ; preds = %.outer, %136
  %indvars.iv32 = phi i64 [ %153, %.outer ], [ %indvars.iv.next33, %136 ]
  %135 = icmp slt i64 %indvars.iv32, 21
  br i1 %135, label %136, label %.loopexit.loopexit

; <label>:136:                                    ; preds = %134
  %137 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 0, i64 %indvars.iv32
  %138 = load i32, i32* %137, align 4
  %indvars.iv.next33 = add nsw i64 %indvars.iv32, 1
  %139 = getelementptr inbounds %struct.scalefac_struct, %struct.scalefac_struct* @scalefac_band, i64 0, i32 0, i64 %indvars.iv.next33
  %140 = load i32, i32* %139, align 4
  %141 = sub nsw i32 %140, %138
  %142 = sext i32 %138 to i64
  %143 = getelementptr inbounds [2 x [576 x double]], [2 x [576 x double]]* %3, i64 %indvars.iv50, i64 %indvars.iv48, i64 %142
  %144 = getelementptr inbounds [576 x double], [576 x double]* %11, i64 0, i64 %142
  %145 = load float, float* @masking_lower, align 4
  %146 = fpext float %145 to double
  %147 = getelementptr inbounds [2 x [2 x %struct.III_psy_xmin]], [2 x [2 x %struct.III_psy_xmin]]* %9, i64 0, i64 %indvars.iv50, i64 %indvars.iv48, i32 0, i64 %indvars.iv32
  %148 = load double, double* %147, align 8
  %149 = fmul double %146, %148
  %150 = call double @find_scalefac(double* %143, double* %144, i32 1, i32 undef, double %149, i32 %141)
  %151 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %10, i64 0, i32 0, i64 %indvars.iv32
  store double %150, double* %151, align 8
  %152 = fcmp ogt double %150, %.3.ph
  br i1 %152, label %.outer.loopexit, label %134

.outer.loopexit:                                  ; preds = %136
  br label %.outer

.outer:                                           ; preds = %.outer.preheader, %.outer.loopexit
  %.17.ph = phi i64 [ %indvars.iv.next33, %.outer.loopexit ], [ 0, %.outer.preheader ]
  %.3.ph = phi double [ %150, %.outer.loopexit ], [ 0.000000e+00, %.outer.preheader ]
  %sext = shl i64 %.17.ph, 32
  %153 = ashr exact i64 %sext, 32
  br label %134

.loopexit.loopexit:                               ; preds = %134
  br label %.loopexit

.loopexit.loopexit55:                             ; preds = %.preheader52
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit55, %.loopexit.loopexit
  %.5 = phi double [ %.3.ph, %.loopexit.loopexit ], [ %.2.2, %.loopexit.loopexit55 ]
  %154 = fmul double %.5, 4.000000e+00
  %155 = fadd double %154, 2.100000e+02
  %156 = fadd double %155, 5.000000e-01
  %157 = call double @floor(double %156) #6
  %158 = fptoui double %157 to i32
  %159 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %5, i64 0, i32 4, i64 %indvars.iv50, i32 0, i64 %indvars.iv48, i32 0, i32 3
  store i32 %158, i32* %159, align 4
  br i1 %80, label %.preheader.preheader, label %.preheader12

.preheader.preheader:                             ; preds = %.loopexit
  br label %.preheader

.preheader:                                       ; preds = %.preheader, %.preheader.preheader
  %indvars.iv45 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next46.1, %.preheader ]
  %160 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %10, i64 0, i32 1, i64 %indvars.iv45, i64 0
  %161 = load double, double* %160, align 8
  %162 = fsub double %161, %.5
  store double %162, double* %160, align 8
  %163 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %10, i64 0, i32 1, i64 %indvars.iv45, i64 1
  %164 = load double, double* %163, align 8
  %165 = fsub double %164, %.5
  store double %165, double* %163, align 8
  %166 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %10, i64 0, i32 1, i64 %indvars.iv45, i64 2
  %167 = load double, double* %166, align 8
  %168 = fsub double %167, %.5
  store double %168, double* %166, align 8
  %indvars.iv.next46 = or i64 %indvars.iv45, 1
  %169 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %10, i64 0, i32 1, i64 %indvars.iv.next46, i64 0
  %170 = load double, double* %169, align 8
  %171 = fsub double %170, %.5
  store double %171, double* %169, align 8
  %172 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %10, i64 0, i32 1, i64 %indvars.iv.next46, i64 1
  %173 = load double, double* %172, align 8
  %174 = fsub double %173, %.5
  store double %174, double* %172, align 8
  %175 = getelementptr inbounds %struct.III_psy_xmin, %struct.III_psy_xmin* %10, i64 0, i32 1, i64 %indvars.iv.next46, i64 2
  %176 = load double, double* %175, align 8
  %177 = fsub double %176, %.5
  store double %177, double* %175, align 8
  %indvars.iv.next46.1 = add nsw i64 %indvars.iv45, 2
  %exitcond47.1 = icmp eq i64 %indvars.iv.next46.1, 12
  br i1 %exitcond47.1, label %178, label %.preheader

; <label>:178:                                    ; preds = %.preheader
  %179 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %5, i64 0, i32 4, i64 %indvars.iv50, i32 0, i64 %indvars.iv48, i32 0, i32 13
  store i32 0, i32* %179, align 4
  %180 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %7, i64 %indvars.iv50, i64 %indvars.iv48, i32 1, i64 0
  %181 = call double @compute_scalefacs_short([3 x double]* nonnull %24, %struct.gr_info* %79, [3 x i32]* %180)
  %182 = fcmp ogt double %181, 0.000000e+00
  br i1 %182, label %183, label %237

; <label>:183:                                    ; preds = %178
  store i32 1, i32* %179, align 4
  %184 = call double @compute_scalefacs_short([3 x double]* nonnull %24, %struct.gr_info* nonnull %79, [3 x i32]* %180)
  %185 = fcmp ogt double %184, 0.000000e+00
  br i1 %185, label %186, label %237

; <label>:186:                                    ; preds = %183
  call void @exit(i32 32) #8
  unreachable

.preheader12:                                     ; preds = %.loopexit
  %187 = load double, double* %26, align 8
  %188 = fsub double %187, %.5
  store double %188, double* %26, align 8
  %189 = load double, double* %27, align 8
  %190 = fsub double %189, %.5
  store double %190, double* %27, align 8
  %191 = load double, double* %28, align 8
  %192 = fsub double %191, %.5
  store double %192, double* %28, align 8
  %193 = load double, double* %29, align 8
  %194 = fsub double %193, %.5
  store double %194, double* %29, align 8
  %195 = load double, double* %30, align 8
  %196 = fsub double %195, %.5
  store double %196, double* %30, align 8
  %197 = load double, double* %31, align 8
  %198 = fsub double %197, %.5
  store double %198, double* %31, align 8
  %199 = load double, double* %32, align 8
  %200 = fsub double %199, %.5
  store double %200, double* %32, align 8
  %201 = load double, double* %33, align 8
  %202 = fsub double %201, %.5
  store double %202, double* %33, align 8
  %203 = load double, double* %34, align 8
  %204 = fsub double %203, %.5
  store double %204, double* %34, align 8
  %205 = load double, double* %35, align 8
  %206 = fsub double %205, %.5
  store double %206, double* %35, align 8
  %207 = load double, double* %36, align 8
  %208 = fsub double %207, %.5
  store double %208, double* %36, align 8
  %209 = load double, double* %37, align 8
  %210 = fsub double %209, %.5
  store double %210, double* %37, align 8
  %211 = load double, double* %38, align 8
  %212 = fsub double %211, %.5
  store double %212, double* %38, align 8
  %213 = load double, double* %39, align 8
  %214 = fsub double %213, %.5
  store double %214, double* %39, align 8
  %215 = load double, double* %40, align 8
  %216 = fsub double %215, %.5
  store double %216, double* %40, align 8
  %217 = load double, double* %41, align 8
  %218 = fsub double %217, %.5
  store double %218, double* %41, align 8
  %219 = load double, double* %42, align 8
  %220 = fsub double %219, %.5
  store double %220, double* %42, align 8
  %221 = load double, double* %43, align 8
  %222 = fsub double %221, %.5
  store double %222, double* %43, align 8
  %223 = load double, double* %44, align 8
  %224 = fsub double %223, %.5
  store double %224, double* %44, align 8
  %225 = load double, double* %45, align 8
  %226 = fsub double %225, %.5
  store double %226, double* %45, align 8
  %227 = load double, double* %46, align 8
  %228 = fsub double %227, %.5
  store double %228, double* %46, align 8
  %229 = getelementptr inbounds %struct.III_side_info_t, %struct.III_side_info_t* %5, i64 0, i32 4, i64 %indvars.iv50, i32 0, i64 %indvars.iv48, i32 0, i32 13
  store i32 0, i32* %229, align 4
  %230 = getelementptr inbounds [2 x %struct.III_scalefac_t], [2 x %struct.III_scalefac_t]* %7, i64 %indvars.iv50, i64 %indvars.iv48, i32 0, i64 0
  %231 = call double @compute_scalefacs_long(double* nonnull %25, %struct.gr_info* nonnull %79, i32* %230)
  %232 = fcmp ogt double %231, 0.000000e+00
  br i1 %232, label %233, label %237

; <label>:233:                                    ; preds = %.preheader12
  store i32 1, i32* %229, align 4
  %234 = call double @compute_scalefacs_long(double* nonnull %25, %struct.gr_info* nonnull %79, i32* %230)
  %235 = fcmp ogt double %234, 0.000000e+00
  br i1 %235, label %236, label %237

; <label>:236:                                    ; preds = %233
  call void @exit(i32 32) #8
  unreachable

; <label>:237:                                    ; preds = %183, %178, %233, %.preheader12
  %indvars.iv.next49 = add nuw i64 %indvars.iv48, 1
  %238 = load i32, i32* %23, align 4
  %239 = sext i32 %238 to i64
  %240 = icmp slt i64 %indvars.iv.next49, %239
  br i1 %240, label %.lr.ph, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %237
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader16
  %indvars.iv.next51 = add nuw i64 %indvars.iv50, 1
  %241 = load i32, i32* %20, align 8
  %242 = sext i32 %241 to i64
  %243 = icmp slt i64 %indvars.iv.next51, %242
  br i1 %243, label %47, label %._crit_edge29.loopexit

._crit_edge29.loopexit:                           ; preds = %._crit_edge
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge29.loopexit, %cdce.end
  ret void
}

declare void @iteration_init(%struct.lame_global_flags*, %struct.III_side_info_t*, [2 x [576 x i32]]*) local_unnamed_addr #5

declare void @ms_convert([576 x double]*, [576 x double]*) local_unnamed_addr #5

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #1

declare i32 @calc_xmin(%struct.lame_global_flags*, double*, %struct.III_psy_ratio*, %struct.gr_info*, %struct.III_psy_xmin*) local_unnamed_addr #5

; Function Attrs: noreturn nounwind
declare void @exit(i32) local_unnamed_addr #3

; Function Attrs: nounwind readnone
declare double @llvm.exp2.f64(double) #6

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind readnone "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { noreturn nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #6 = { nounwind readnone }
attributes #7 = { nounwind }
attributes #8 = { noreturn nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!"branch_weights", i32 1, i32 2000}
