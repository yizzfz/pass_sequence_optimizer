; ModuleID = 'tabinit.ll'
source_filename = "tabinit.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@cos64 = internal global [16 x double] zeroinitializer, align 16
@cos32 = internal global [8 x double] zeroinitializer, align 16
@cos16 = internal global [4 x double] zeroinitializer, align 16
@cos8 = internal global [2 x double] zeroinitializer, align 16
@cos4 = internal global [1 x double] zeroinitializer, align 8
@pnts = local_unnamed_addr global [5 x double*] [double* getelementptr inbounds ([16 x double], [16 x double]* @cos64, i32 0, i32 0), double* getelementptr inbounds ([8 x double], [8 x double]* @cos32, i32 0, i32 0), double* getelementptr inbounds ([4 x double], [4 x double]* @cos16, i32 0, i32 0), double* getelementptr inbounds ([2 x double], [2 x double]* @cos8, i32 0, i32 0), double* getelementptr inbounds ([1 x double], [1 x double]* @cos4, i32 0, i32 0)], align 16
@decwin = common global [544 x double] zeroinitializer, align 16
@intwinbase = internal unnamed_addr constant [257 x i64] [i64 0, i64 -1, i64 -1, i64 -1, i64 -1, i64 -1, i64 -1, i64 -2, i64 -2, i64 -2, i64 -2, i64 -3, i64 -3, i64 -4, i64 -4, i64 -5, i64 -5, i64 -6, i64 -7, i64 -7, i64 -8, i64 -9, i64 -10, i64 -11, i64 -13, i64 -14, i64 -16, i64 -17, i64 -19, i64 -21, i64 -24, i64 -26, i64 -29, i64 -31, i64 -35, i64 -38, i64 -41, i64 -45, i64 -49, i64 -53, i64 -58, i64 -63, i64 -68, i64 -73, i64 -79, i64 -85, i64 -91, i64 -97, i64 -104, i64 -111, i64 -117, i64 -125, i64 -132, i64 -139, i64 -147, i64 -154, i64 -161, i64 -169, i64 -176, i64 -183, i64 -190, i64 -196, i64 -202, i64 -208, i64 -213, i64 -218, i64 -222, i64 -225, i64 -227, i64 -228, i64 -228, i64 -227, i64 -224, i64 -221, i64 -215, i64 -208, i64 -200, i64 -189, i64 -177, i64 -163, i64 -146, i64 -127, i64 -106, i64 -83, i64 -57, i64 -29, i64 2, i64 36, i64 72, i64 111, i64 153, i64 197, i64 244, i64 294, i64 347, i64 401, i64 459, i64 519, i64 581, i64 645, i64 711, i64 779, i64 848, i64 919, i64 991, i64 1064, i64 1137, i64 1210, i64 1283, i64 1356, i64 1428, i64 1498, i64 1567, i64 1634, i64 1698, i64 1759, i64 1817, i64 1870, i64 1919, i64 1962, i64 2001, i64 2032, i64 2057, i64 2075, i64 2085, i64 2087, i64 2080, i64 2063, i64 2037, i64 2000, i64 1952, i64 1893, i64 1822, i64 1739, i64 1644, i64 1535, i64 1414, i64 1280, i64 1131, i64 970, i64 794, i64 605, i64 402, i64 185, i64 -45, i64 -288, i64 -545, i64 -814, i64 -1095, i64 -1388, i64 -1692, i64 -2006, i64 -2330, i64 -2663, i64 -3004, i64 -3351, i64 -3705, i64 -4063, i64 -4425, i64 -4788, i64 -5153, i64 -5517, i64 -5879, i64 -6237, i64 -6589, i64 -6935, i64 -7271, i64 -7597, i64 -7910, i64 -8209, i64 -8491, i64 -8755, i64 -8998, i64 -9219, i64 -9416, i64 -9585, i64 -9727, i64 -9838, i64 -9916, i64 -9959, i64 -9966, i64 -9935, i64 -9863, i64 -9750, i64 -9592, i64 -9389, i64 -9139, i64 -8840, i64 -8492, i64 -8092, i64 -7640, i64 -7134, i64 -6574, i64 -5959, i64 -5288, i64 -4561, i64 -3776, i64 -2935, i64 -2037, i64 -1082, i64 -70, i64 998, i64 2122, i64 3300, i64 4533, i64 5818, i64 7154, i64 8540, i64 9975, i64 11455, i64 12980, i64 14548, i64 16155, i64 17799, i64 19478, i64 21189, i64 22929, i64 24694, i64 26482, i64 28289, i64 30112, i64 31947, i64 33791, i64 35640, i64 37489, i64 39336, i64 41176, i64 43006, i64 44821, i64 46617, i64 48390, i64 50137, i64 51853, i64 53534, i64 55178, i64 56778, i64 58333, i64 59838, i64 61289, i64 62684, i64 64019, i64 65290, i64 66494, i64 67629, i64 68692, i64 69679, i64 70590, i64 71420, i64 72169, i64 72835, i64 73415, i64 73908, i64 74313, i64 74630, i64 74856, i64 74992, i64 75038], align 16

; Function Attrs: noinline nounwind uwtable
define void @make_decode_tables(i64) local_unnamed_addr #0 {
.lr.ph21:
  %1 = load double*, double** getelementptr inbounds ([5 x double*], [5 x double*]* @pnts, i64 0, i64 0), align 16
  br label %2

; <label>:2:                                      ; preds = %2, %.lr.ph21
  %indvars.iv29 = phi i64 [ 0, %.lr.ph21 ], [ %indvars.iv.next30.1, %2 ]
  %3 = trunc i64 %indvars.iv29 to i32
  %4 = sitofp i32 %3 to double
  %5 = fmul double %4, 2.000000e+00
  %6 = fadd double %5, 1.000000e+00
  %7 = fmul double %6, 0x400921FB54442D18
  %8 = fmul double %7, 1.562500e-02
  %9 = tail call double @cos(double %8) #2
  %10 = fmul double %9, 2.000000e+00
  %11 = fdiv double 1.000000e+00, %10
  %12 = getelementptr inbounds double, double* %1, i64 %indvars.iv29
  store double %11, double* %12, align 8
  %indvars.iv.next30 = or i64 %indvars.iv29, 1
  %13 = trunc i64 %indvars.iv.next30 to i32
  %14 = sitofp i32 %13 to double
  %15 = fmul double %14, 2.000000e+00
  %16 = fadd double %15, 1.000000e+00
  %17 = fmul double %16, 0x400921FB54442D18
  %18 = fmul double %17, 1.562500e-02
  %19 = tail call double @cos(double %18) #2
  %20 = fmul double %19, 2.000000e+00
  %21 = fdiv double 1.000000e+00, %20
  %22 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next30
  store double %21, double* %22, align 8
  %indvars.iv.next30.1 = add nsw i64 %indvars.iv29, 2
  %exitcond31.1 = icmp eq i64 %indvars.iv.next30.1, 16
  br i1 %exitcond31.1, label %.lr.ph21.1, label %2

; <label>:23:                                     ; preds = %33, %._crit_edge22.435
  %indvars.iv26 = phi i64 [ 0, %._crit_edge22.435 ], [ %indvars.iv.next27, %33 ]
  %.018 = phi i64 [ %75, %._crit_edge22.435 ], [ %.1, %33 ]
  %.1217 = phi i32 [ 0, %._crit_edge22.435 ], [ %40, %33 ]
  %.0715 = phi double* [ getelementptr inbounds ([544 x double], [544 x double]* @decwin, i64 0, i64 0), %._crit_edge22.435 ], [ %41, %33 ]
  %24 = icmp ult double* %.0715, getelementptr inbounds ([544 x double], [544 x double]* @decwin, i64 0, i64 528)
  br i1 %24, label %25, label %33

; <label>:25:                                     ; preds = %23
  %26 = getelementptr inbounds [257 x i64], [257 x i64]* @intwinbase, i64 0, i64 %indvars.iv26
  %27 = load i64, i64* %26, align 8
  %28 = sitofp i64 %27 to double
  %29 = fmul double %28, 0x3EF0000000000000
  %30 = sitofp i64 %.018 to double
  %31 = fmul double %30, %29
  store double %31, double* %.0715, align 8
  %32 = getelementptr inbounds double, double* %.0715, i64 16
  store double %31, double* %32, align 8
  br label %33

; <label>:33:                                     ; preds = %25, %23
  %34 = srem i32 %.1217, 32
  %35 = icmp eq i32 %34, 31
  %36 = getelementptr inbounds double, double* %.0715, i64 -1023
  %..07 = select i1 %35, double* %36, double* %.0715
  %37 = srem i32 %.1217, 64
  %38 = icmp eq i32 %37, 63
  %39 = sub nsw i64 0, %.018
  %.1 = select i1 %38, i64 %39, i64 %.018
  %40 = add nuw nsw i32 %.1217, 1
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %41 = getelementptr inbounds double, double* %..07, i64 32
  %exitcond28 = icmp eq i64 %indvars.iv.next27, 256
  br i1 %exitcond28, label %.lr.ph.preheader, label %23

.lr.ph.preheader:                                 ; preds = %33
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %51
  %indvars.iv = phi i64 [ %indvars.iv.next, %51 ], [ 256, %.lr.ph.preheader ]
  %.214 = phi i64 [ %.3, %51 ], [ %.1, %.lr.ph.preheader ]
  %.2313 = phi i32 [ %58, %51 ], [ 256, %.lr.ph.preheader ]
  %.2911 = phi double* [ %59, %51 ], [ %41, %.lr.ph.preheader ]
  %42 = icmp ult double* %.2911, getelementptr inbounds ([544 x double], [544 x double]* @decwin, i64 0, i64 528)
  br i1 %42, label %43, label %51

; <label>:43:                                     ; preds = %.lr.ph
  %44 = getelementptr inbounds [257 x i64], [257 x i64]* @intwinbase, i64 0, i64 %indvars.iv
  %45 = load i64, i64* %44, align 8
  %46 = sitofp i64 %45 to double
  %47 = fmul double %46, 0x3EF0000000000000
  %48 = sitofp i64 %.214 to double
  %49 = fmul double %48, %47
  store double %49, double* %.2911, align 8
  %50 = getelementptr inbounds double, double* %.2911, i64 16
  store double %49, double* %50, align 8
  br label %51

; <label>:51:                                     ; preds = %43, %.lr.ph
  %52 = srem i32 %.2313, 32
  %53 = icmp eq i32 %52, 31
  %54 = getelementptr inbounds double, double* %.2911, i64 -1023
  %..29 = select i1 %53, double* %54, double* %.2911
  %55 = srem i32 %.2313, 64
  %56 = icmp eq i32 %55, 63
  %57 = sub nsw i64 0, %.214
  %.3 = select i1 %56, i64 %57, i64 %.214
  %58 = add nsw i32 %.2313, 1
  %indvars.iv.next = add nsw i64 %indvars.iv, -1
  %59 = getelementptr inbounds double, double* %..29, i64 32
  %exitcond = icmp eq i32 %58, 512
  br i1 %exitcond, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %51
  ret void

.lr.ph21.1:                                       ; preds = %2
  %60 = load double*, double** getelementptr inbounds ([5 x double*], [5 x double*]* @pnts, i64 0, i64 1), align 8
  br label %.lr.ph21.237

.lr.ph21.237:                                     ; preds = %.lr.ph21.1
  store double 0x3FE013D19C61D971, double* %60, align 8
  %61 = getelementptr inbounds double, double* %60, i64 1
  store double 0x3FE0B84F03EBE15E, double* %61, align 8
  %62 = getelementptr inbounds double, double* %60, i64 2
  store double 0x3FE22467D1065A74, double* %62, align 8
  %63 = getelementptr inbounds double, double* %60, i64 3
  store double 0x3FE4B2C398BBE3C6, double* %63, align 8
  %64 = getelementptr inbounds double, double* %60, i64 4
  store double 0x3FE938900B7D4210, double* %64, align 8
  %65 = getelementptr inbounds double, double* %60, i64 5
  store double 0x3FF0F8892A4ECED7, double* %65, align 8
  %66 = getelementptr inbounds double, double* %60, i64 6
  store double 0x3FFB8F24B0406142, double* %66, align 8
  %67 = getelementptr inbounds double, double* %60, i64 7
  store double 0x4014679380E538D4, double* %67, align 8
  %68 = load double*, double** getelementptr inbounds ([5 x double*], [5 x double*]* @pnts, i64 0, i64 2), align 16
  br label %.lr.ph21.336

.lr.ph21.336:                                     ; preds = %.lr.ph21.237
  store double 0x3FE0503ED17CBA53, double* %68, align 8
  %69 = getelementptr inbounds double, double* %68, i64 1
  store double 0x3FE33E37A1E0173E, double* %69, align 8
  %70 = getelementptr inbounds double, double* %68, i64 2
  store double 0x3FECCC9AEFB18D57, double* %70, align 8
  %71 = getelementptr inbounds double, double* %68, i64 3
  store double 0x400480D9D073B426, double* %71, align 8
  %72 = load double*, double** getelementptr inbounds ([5 x double*], [5 x double*]* @pnts, i64 0, i64 3), align 8
  br label %._crit_edge22.435

._crit_edge22.435:                                ; preds = %.lr.ph21.336
  store double 0x3FE1517A7BDB3895, double* %72, align 8
  %73 = getelementptr inbounds double, double* %72, i64 1
  store double 0x3FF4E7AE9144F0FB, double* %73, align 8
  %74 = load double*, double** getelementptr inbounds ([5 x double*], [5 x double*]* @pnts, i64 0, i64 4), align 16
  store double 0x3FE6A09E667F3BCC, double* %74, align 8
  %75 = sub nsw i64 0, %0
  br label %23
}

; Function Attrs: nounwind
declare double @cos(double) local_unnamed_addr #1

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
