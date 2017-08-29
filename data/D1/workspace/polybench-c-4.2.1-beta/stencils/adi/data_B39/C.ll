; ModuleID = 'B.ll'
source_filename = "adi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_adi = private constant [15 x i8] c"B.ll:kernel_adi"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 32414643582, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 77261525566, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_adi = private global [21 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_adi = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -3151364952666595362, i64 264610867256, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_adi, i32 0, i32 0), i8* null, i8* null, i32 21, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 63976198547, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [55 x i8] c"5\00main\01B.ll:init_array\01B.ll:kernel_adi\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_adi to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([55 x i8], [55 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = bitcast i8* %3 to [1000 x double]*
  tail call fastcc void @init_array(i32 1000, [1000 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to [1000 x double]*
  %9 = bitcast i8* %5 to [1000 x double]*
  %10 = bitcast i8* %6 to [1000 x double]*
  tail call fastcc void @kernel_adi(i32 500, i32 1000, [1000 x double]* %7, [1000 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %18

; <label>:12:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %14 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %14, align 1
  %15 = icmp eq i8 %strcmpload, 0
  br i1 %15, label %16, label %18

; <label>:16:                                     ; preds = %12
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %17 = add i64 %pgocount1, 1
  store i64 %17, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  tail call fastcc void @print_array(i32 1000, [1000 x double]* %7)
  br label %18

; <label>:18:                                     ; preds = %16, %12, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %19 = add i64 %pgocount2, 1
  store i64 %19, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [1000 x double]* nocapture) unnamed_addr #2 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader.lr.ph, label %._crit_edge4

.preheader.lr.ph:                                 ; preds = %2
  %4 = sitofp i32 %0 to double
  %5 = sext i32 %0 to i64
  %xtraiter = and i32 %0, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %6 = icmp eq i32 %0, 1
  %wide.trip.count7 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %._crit_edge.us ], [ 0, %.preheader.lr.ph ]
  %7 = add nsw i64 %indvars.iv5, %5
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %9 = trunc i64 %7 to i32
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, %4
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv5, i64 0
  store double %11, double* %12, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us ]
  br i1 %6, label %.prol.loopexit.._crit_edge.us_crit_edge, label %.preheader.us.new.preheader

.prol.loopexit.._crit_edge.us_crit_edge:          ; preds = %.prol.loopexit
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %13 = add i64 %pgocount1, 1
  store i64 %13, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  br label %._crit_edge.us

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  %14 = trunc i64 %7 to i32
  %15 = trunc i64 %7 to i32
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new..preheader.us.new_crit_edge, %.preheader.us.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new..preheader.us.new_crit_edge ], [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ]
  %16 = trunc i64 %indvars.iv to i32
  %17 = sub i32 %14, %16
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, %4
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  store double %19, double* %20, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %21 = trunc i64 %indvars.iv.next to i32
  %22 = sub i32 %15, %21
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, %4
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv.next
  store double %24, double* %25, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader.us.new..preheader.us.new_crit_edge

.preheader.us.new..preheader.us.new_crit_edge:    ; preds = %.preheader.us.new
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %26 = add i64 %pgocount2, 1
  store i64 %26, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  br label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %27 = add i64 %pgocount3, 1
  store i64 %27, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.prol.loopexit.._crit_edge.us_crit_edge, %._crit_edge.us.loopexit
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next6, %wide.trip.count7
  br i1 %exitcond, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %28 = add i64 %pgocount4, 1
  store i64 %28, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %2
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %29 = add i64 %pgocount5, 1
  store i64 %29, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi(i32, i32, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
  %7 = sitofp i32 %1 to double
  %8 = fdiv double 1.000000e+00, %7
  %9 = sitofp i32 %0 to double
  %10 = fdiv double 1.000000e+00, %9
  %11 = fmul double %10, 2.000000e+00
  %12 = fmul double %8, %8
  %13 = fdiv double %11, %12
  %14 = fdiv double %10, %12
  %15 = fmul double %13, -5.000000e-01
  %16 = fadd double %13, 1.000000e+00
  %17 = fmul double %14, -5.000000e-01
  %18 = fadd double %14, 1.000000e+00
  %19 = icmp slt i32 %0, 1
  br i1 %19, label %._crit_edge24, label %.preheader4.lr.ph

.preheader4.lr.ph:                                ; preds = %6
  %20 = add nsw i32 %1, -1
  %21 = icmp sgt i32 %20, 1
  %22 = sext i32 %20 to i64
  %23 = add nsw i32 %1, -2
  %24 = icmp sgt i32 %1, 2
  %25 = fsub double -0.000000e+00, %15
  %26 = fmul double %17, 2.000000e+00
  %27 = fadd double %26, 1.000000e+00
  %28 = icmp sgt i32 %1, 2
  %29 = fsub double -0.000000e+00, %17
  %30 = fmul double %15, 2.000000e+00
  %31 = fadd double %30, 1.000000e+00
  %32 = sext i32 %23 to i64
  %33 = add i32 %1, -3
  %wide.trip.count = zext i32 %20 to i64
  %xtraiter = and i32 %23, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %34 = icmp eq i32 %33, 0
  %35 = add nsw i64 %32, 1
  %indvars.iv.next26.prol = add nsw i64 %32, -1
  %wide.trip.count29 = zext i32 %20 to i64
  %36 = icmp sgt i32 %20, 1
  %37 = sext i32 %20 to i64
  %wide.trip.count33 = zext i32 %20 to i64
  %xtraiter37 = and i32 %23, 1
  %lcmp.mod38 = icmp eq i32 %xtraiter37, 0
  %38 = icmp eq i32 %33, 0
  %39 = add nsw i64 %32, 1
  %indvars.iv.next36.prol = add nsw i64 %32, -1
  %wide.trip.count41 = zext i32 %20 to i64
  br label %.preheader4

.preheader4:                                      ; preds = %._crit_edge22, %.preheader4.lr.ph
  %.0323 = phi i32 [ 1, %.preheader4.lr.ph ], [ %231, %._crit_edge22 ]
  br i1 %21, label %.lver.check.preheader, label %.preheader4.._crit_edge22_crit_edge

.preheader4.._crit_edge22_crit_edge:              ; preds = %.preheader4
  %pgocount = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 6)
  %40 = add i64 %pgocount, 1
  store i64 %40, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 6)
  br label %._crit_edge22

.lver.check.preheader:                            ; preds = %.preheader4
  br label %.lver.check

.lver.check:                                      ; preds = %._crit_edge9.us, %.lver.check.preheader
  %indvar = phi i64 [ %indvar.next, %._crit_edge9.us ], [ 0, %.lver.check.preheader ]
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %._crit_edge9.us ], [ 1, %.lver.check.preheader ]
  %41 = add i64 %indvar, 1
  %42 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %4, i64 %42, i64 0
  %scevgep49 = getelementptr [1000 x double], [1000 x double]* %4, i64 %42, i64 %wide.trip.count
  %scevgep51 = getelementptr [1000 x double], [1000 x double]* %5, i64 %42, i64 0
  %scevgep53 = getelementptr [1000 x double], [1000 x double]* %5, i64 %42, i64 %wide.trip.count
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv27
  store double 1.000000e+00, double* %43, align 8
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 0
  store double 0.000000e+00, double* %44, align 8
  %45 = bitcast double* %43 to i64*
  %46 = load i64, i64* %45, align 8
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27
  %48 = bitcast [1000 x double]* %47 to i64*
  store i64 %46, i64* %48, align 8
  %49 = add nsw i64 %indvars.iv27, -1
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %bound0 = icmp ult double* %scevgep, %scevgep53
  %bound1 = icmp ult double* %scevgep51, %scevgep49
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.ph.lver.orig.preheader, label %.ph

.ph.lver.orig.preheader:                          ; preds = %.lver.check
  br label %.ph.lver.orig

.ph.lver.orig:                                    ; preds = %.ph.lver.orig..ph.lver.orig_crit_edge, %.ph.lver.orig.preheader
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %.ph.lver.orig..ph.lver.orig_crit_edge ], [ 1, %.ph.lver.orig.preheader ]
  %50 = add nsw i64 %indvars.iv.lver.orig, -1
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %50
  %52 = load double, double* %51, align 8
  %53 = fmul double %15, %52
  %54 = fadd double %16, %53
  %55 = fdiv double %25, %54
  %56 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv.lver.orig
  store double %55, double* %56, align 8
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %49
  %58 = load double, double* %57, align 8
  %59 = fmul double %17, %58
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %indvars.iv27
  %61 = load double, double* %60, align 8
  %62 = fmul double %27, %61
  %63 = fsub double %62, %59
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next28
  %65 = load double, double* %64, align 8
  %66 = fmul double %17, %65
  %67 = fsub double %63, %66
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %50
  %69 = load double, double* %68, align 8
  %70 = fmul double %15, %69
  %71 = fsub double %67, %70
  %72 = load double, double* %51, align 8
  %73 = fmul double %15, %72
  %74 = fadd double %16, %73
  %75 = fdiv double %71, %74
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv.lver.orig
  store double %75, double* %76, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, %wide.trip.count
  br i1 %exitcond.lver.orig, label %._crit_edge.us.loopexit, label %.ph.lver.orig..ph.lver.orig_crit_edge

.ph.lver.orig..ph.lver.orig_crit_edge:            ; preds = %.ph.lver.orig
  %pgocount2 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 0)
  %77 = add i64 %pgocount2, 1
  store i64 %77, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 0)
  br label %.ph.lver.orig

.ph:                                              ; preds = %.lver.check
  %scevgep55 = getelementptr [1000 x double], [1000 x double]* %4, i64 %41, i64 0
  %scevgep58 = getelementptr [1000 x double], [1000 x double]* %5, i64 %41, i64 0
  %load_initial = load double, double* %scevgep55, align 8
  %load_initial59 = load double, double* %scevgep58, align 8
  br label %97

._crit_edge9.us.loopexit:                         ; preds = %.lr.ph8.us
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %.lr.ph8.us.prol.loopexit, %._crit_edge.us, %._crit_edge9.us.loopexit
  %exitcond30 = icmp eq i64 %indvars.iv.next28, %wide.trip.count29
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond30, label %.preheader, label %.lver.check

.lr.ph8.us:                                       ; preds = %.lr.ph8.us..lr.ph8.us_crit_edge, %.lr.ph8.us.preheader87
  %indvars.iv25 = phi i64 [ %indvars.iv.next26.1, %.lr.ph8.us..lr.ph8.us_crit_edge ], [ %indvars.iv25.unr.ph, %.lr.ph8.us.preheader87 ]
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv25
  %79 = load double, double* %78, align 8
  %80 = add nsw i64 %indvars.iv25, 1
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %80, i64 %indvars.iv27
  %82 = load double, double* %81, align 8
  %83 = fmul double %79, %82
  %84 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv25
  %85 = load double, double* %84, align 8
  %86 = fadd double %83, %85
  %87 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv25, i64 %indvars.iv27
  store double %86, double* %87, align 8
  %indvars.iv.next26 = add nsw i64 %indvars.iv25, -1
  %88 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv.next26
  %89 = load double, double* %88, align 8
  %90 = fmul double %89, %86
  %91 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv.next26
  %92 = load double, double* %91, align 8
  %93 = fadd double %90, %92
  %94 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next26, i64 %indvars.iv27
  store double %93, double* %94, align 8
  %indvars.iv.next26.1 = add nsw i64 %indvars.iv25, -2
  %95 = icmp sgt i64 %indvars.iv.next26, 1
  br i1 %95, label %.lr.ph8.us..lr.ph8.us_crit_edge, label %._crit_edge9.us.loopexit

.lr.ph8.us..lr.ph8.us_crit_edge:                  ; preds = %.lr.ph8.us
  %pgocount3 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 2)
  %96 = add i64 %pgocount3, 1
  store i64 %96, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 2)
  br label %.lr.ph8.us

; <label>:97:                                     ; preds = %._crit_edge, %.ph
  %store_forwarded60 = phi double [ %load_initial59, %.ph ], [ %117, %._crit_edge ]
  %store_forwarded57 = phi double [ %load_initial, %.ph ], [ %100, %._crit_edge ]
  %indvars.iv = phi i64 [ 1, %.ph ], [ %indvars.iv.next, %._crit_edge ]
  %98 = fmul double %15, %store_forwarded57
  %99 = fadd double %16, %98
  %100 = fdiv double %25, %99
  %101 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv
  store double %100, double* %101, align 8
  %102 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %49
  %103 = load double, double* %102, align 8
  %104 = fmul double %17, %103
  %105 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv27
  %106 = load double, double* %105, align 8
  %107 = fmul double %27, %106
  %108 = fsub double %107, %104
  %109 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv, i64 %indvars.iv.next28
  %110 = load double, double* %109, align 8
  %111 = fmul double %17, %110
  %112 = fsub double %108, %111
  %113 = fmul double %15, %store_forwarded60
  %114 = fsub double %112, %113
  %115 = fmul double %15, %store_forwarded57
  %116 = fadd double %16, %115
  %117 = fdiv double %114, %116
  %118 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv
  store double %117, double* %118, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.loopexit88, label %._crit_edge

._crit_edge:                                      ; preds = %97
  %pgocount4 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 1)
  %119 = add i64 %pgocount4, 1
  store i64 %119, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 1)
  br label %97

._crit_edge.us.loopexit:                          ; preds = %.ph.lver.orig
  %pgocount5 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 7)
  %120 = add i64 %pgocount5, 1
  store i64 %120, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 7)
  br label %._crit_edge.us

._crit_edge.us.loopexit88:                        ; preds = %97
  %pgocount6 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 8)
  %121 = add i64 %pgocount6, 1
  store i64 %121, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 8)
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit88, %._crit_edge.us.loopexit
  %122 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %22, i64 %indvars.iv27
  store double 1.000000e+00, double* %122, align 8
  br i1 %24, label %.lr.ph8.us.preheader, label %._crit_edge9.us

.lr.ph8.us.preheader:                             ; preds = %._crit_edge.us
  %pgocount7 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 9)
  %123 = add i64 %pgocount7, 1
  store i64 %123, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 9)
  br i1 %lcmp.mod, label %.lr.ph8.us.prol.loopexit, label %.lr.ph8.us.prol

.lr.ph8.us.prol:                                  ; preds = %.lr.ph8.us.preheader
  %pgocount8 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 11)
  %124 = add i64 %pgocount8, 1
  store i64 %124, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 11)
  %125 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv27, i64 %32
  %126 = load double, double* %125, align 8
  %127 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %35, i64 %indvars.iv27
  %128 = load double, double* %127, align 8
  %129 = fmul double %126, %128
  %130 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %32
  %131 = load double, double* %130, align 8
  %132 = fadd double %129, %131
  %133 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %32, i64 %indvars.iv27
  store double %132, double* %133, align 8
  br label %.lr.ph8.us.prol.loopexit

.lr.ph8.us.prol.loopexit:                         ; preds = %.lr.ph8.us.prol, %.lr.ph8.us.preheader
  %indvars.iv25.unr.ph = phi i64 [ %indvars.iv.next26.prol, %.lr.ph8.us.prol ], [ %32, %.lr.ph8.us.preheader ]
  br i1 %34, label %._crit_edge9.us, label %.lr.ph8.us.preheader87

.lr.ph8.us.preheader87:                           ; preds = %.lr.ph8.us.prol.loopexit
  %pgocount9 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 10)
  %134 = add i64 %pgocount9, 1
  store i64 %134, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 10)
  br label %.lr.ph8.us

.preheader:                                       ; preds = %._crit_edge9.us
  %pgocount10 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 17)
  %135 = add i64 %pgocount10, 1
  store i64 %135, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 17)
  br i1 %36, label %.lver.check75.preheader, label %._crit_edge22

.lver.check75.preheader:                          ; preds = %.preheader
  br label %.lver.check75

.lver.check75:                                    ; preds = %._crit_edge19.us, %.lver.check75.preheader
  %indvar61 = phi i64 [ %indvar.next62, %._crit_edge19.us ], [ 0, %.lver.check75.preheader ]
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge19.us ], [ 1, %.lver.check75.preheader ]
  %136 = add i64 %indvar61, 1
  %137 = add i64 %indvar61, 1
  %scevgep63 = getelementptr [1000 x double], [1000 x double]* %4, i64 %137, i64 0
  %scevgep65 = getelementptr [1000 x double], [1000 x double]* %4, i64 %137, i64 %wide.trip.count
  %scevgep67 = getelementptr [1000 x double], [1000 x double]* %5, i64 %137, i64 0
  %scevgep69 = getelementptr [1000 x double], [1000 x double]* %5, i64 %137, i64 %wide.trip.count
  %138 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 0
  store double 1.000000e+00, double* %138, align 8
  %139 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 0
  store double 0.000000e+00, double* %139, align 8
  %140 = bitcast double* %138 to i64*
  %141 = load i64, i64* %140, align 8
  %142 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39
  %143 = bitcast [1000 x double]* %142 to i64*
  store i64 %141, i64* %143, align 8
  %144 = add nsw i64 %indvars.iv39, -1
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %bound071 = icmp ult double* %scevgep63, %scevgep69
  %bound172 = icmp ult double* %scevgep67, %scevgep65
  %memcheck.conflict74 = and i1 %bound071, %bound172
  br i1 %memcheck.conflict74, label %.ph76.lver.orig.preheader, label %.ph76

.ph76.lver.orig.preheader:                        ; preds = %.lver.check75
  br label %.ph76.lver.orig

.ph76.lver.orig:                                  ; preds = %.ph76.lver.orig..ph76.lver.orig_crit_edge, %.ph76.lver.orig.preheader
  %indvars.iv31.lver.orig = phi i64 [ %indvars.iv.next32.lver.orig, %.ph76.lver.orig..ph76.lver.orig_crit_edge ], [ 1, %.ph76.lver.orig.preheader ]
  %145 = add nsw i64 %indvars.iv31.lver.orig, -1
  %146 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %145
  %147 = load double, double* %146, align 8
  %148 = fmul double %17, %147
  %149 = fadd double %18, %148
  %150 = fdiv double %29, %149
  %151 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv31.lver.orig
  store double %150, double* %151, align 8
  %152 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %144, i64 %indvars.iv31.lver.orig
  %153 = load double, double* %152, align 8
  %154 = fmul double %15, %153
  %155 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv39, i64 %indvars.iv31.lver.orig
  %156 = load double, double* %155, align 8
  %157 = fmul double %31, %156
  %158 = fsub double %157, %154
  %159 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next40, i64 %indvars.iv31.lver.orig
  %160 = load double, double* %159, align 8
  %161 = fmul double %15, %160
  %162 = fsub double %158, %161
  %163 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %145
  %164 = load double, double* %163, align 8
  %165 = fmul double %17, %164
  %166 = fsub double %162, %165
  %167 = load double, double* %146, align 8
  %168 = fmul double %17, %167
  %169 = fadd double %18, %168
  %170 = fdiv double %166, %169
  %171 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv31.lver.orig
  store double %170, double* %171, align 8
  %indvars.iv.next32.lver.orig = add nuw nsw i64 %indvars.iv31.lver.orig, 1
  %exitcond34.lver.orig = icmp eq i64 %indvars.iv.next32.lver.orig, %wide.trip.count33
  br i1 %exitcond34.lver.orig, label %._crit_edge15.us.loopexit, label %.ph76.lver.orig..ph76.lver.orig_crit_edge

.ph76.lver.orig..ph76.lver.orig_crit_edge:        ; preds = %.ph76.lver.orig
  %pgocount11 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 3)
  %172 = add i64 %pgocount11, 1
  store i64 %172, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 3)
  br label %.ph76.lver.orig

.ph76:                                            ; preds = %.lver.check75
  %scevgep77 = getelementptr [1000 x double], [1000 x double]* %4, i64 %136, i64 0
  %scevgep82 = getelementptr [1000 x double], [1000 x double]* %5, i64 %136, i64 0
  %load_initial78 = load double, double* %scevgep77, align 8
  %load_initial83 = load double, double* %scevgep82, align 8
  br label %192

._crit_edge19.us.loopexit:                        ; preds = %.lr.ph18.us
  br label %._crit_edge19.us

._crit_edge19.us:                                 ; preds = %.lr.ph18.us.prol.loopexit, %._crit_edge15.us, %._crit_edge19.us.loopexit
  %exitcond42 = icmp eq i64 %indvars.iv.next40, %wide.trip.count41
  %indvar.next62 = add i64 %indvar61, 1
  br i1 %exitcond42, label %._crit_edge22.loopexit, label %.lver.check75

.lr.ph18.us:                                      ; preds = %.lr.ph18.us..lr.ph18.us_crit_edge, %.lr.ph18.us.preheader85
  %indvars.iv35 = phi i64 [ %indvars.iv.next36.1, %.lr.ph18.us..lr.ph18.us_crit_edge ], [ %indvars.iv35.unr.ph, %.lr.ph18.us.preheader85 ]
  %173 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv35
  %174 = load double, double* %173, align 8
  %175 = add nsw i64 %indvars.iv35, 1
  %176 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %175
  %177 = load double, double* %176, align 8
  %178 = fmul double %174, %177
  %179 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv35
  %180 = load double, double* %179, align 8
  %181 = fadd double %178, %180
  %182 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv35
  store double %181, double* %182, align 8
  %indvars.iv.next36 = add nsw i64 %indvars.iv35, -1
  %183 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv.next36
  %184 = load double, double* %183, align 8
  %185 = fmul double %184, %181
  %186 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv.next36
  %187 = load double, double* %186, align 8
  %188 = fadd double %185, %187
  %189 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv.next36
  store double %188, double* %189, align 8
  %indvars.iv.next36.1 = add nsw i64 %indvars.iv35, -2
  %190 = icmp sgt i64 %indvars.iv.next36, 1
  br i1 %190, label %.lr.ph18.us..lr.ph18.us_crit_edge, label %._crit_edge19.us.loopexit

.lr.ph18.us..lr.ph18.us_crit_edge:                ; preds = %.lr.ph18.us
  %pgocount12 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 5)
  %191 = add i64 %pgocount12, 1
  store i64 %191, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 5)
  br label %.lr.ph18.us

; <label>:192:                                    ; preds = %._crit_edge1, %.ph76
  %store_forwarded84 = phi double [ %load_initial83, %.ph76 ], [ %212, %._crit_edge1 ]
  %store_forwarded81 = phi double [ %load_initial78, %.ph76 ], [ %195, %._crit_edge1 ]
  %indvars.iv31 = phi i64 [ 1, %.ph76 ], [ %indvars.iv.next32, %._crit_edge1 ]
  %193 = fmul double %17, %store_forwarded81
  %194 = fadd double %18, %193
  %195 = fdiv double %29, %194
  %196 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv31
  store double %195, double* %196, align 8
  %197 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %144, i64 %indvars.iv31
  %198 = load double, double* %197, align 8
  %199 = fmul double %15, %198
  %200 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv39, i64 %indvars.iv31
  %201 = load double, double* %200, align 8
  %202 = fmul double %31, %201
  %203 = fsub double %202, %199
  %204 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next40, i64 %indvars.iv31
  %205 = load double, double* %204, align 8
  %206 = fmul double %15, %205
  %207 = fsub double %203, %206
  %208 = fmul double %17, %store_forwarded84
  %209 = fsub double %207, %208
  %210 = fmul double %17, %store_forwarded81
  %211 = fadd double %18, %210
  %212 = fdiv double %209, %211
  %213 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv31
  store double %212, double* %213, align 8
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next32, %wide.trip.count33
  br i1 %exitcond34, label %._crit_edge15.us.loopexit86, label %._crit_edge1

._crit_edge1:                                     ; preds = %192
  %pgocount13 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 4)
  %214 = add i64 %pgocount13, 1
  store i64 %214, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 4)
  br label %192

._crit_edge15.us.loopexit:                        ; preds = %.ph76.lver.orig
  %pgocount14 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 12)
  %215 = add i64 %pgocount14, 1
  store i64 %215, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 12)
  br label %._crit_edge15.us

._crit_edge15.us.loopexit86:                      ; preds = %192
  %pgocount15 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 13)
  %216 = add i64 %pgocount15, 1
  store i64 %216, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 13)
  br label %._crit_edge15.us

._crit_edge15.us:                                 ; preds = %._crit_edge15.us.loopexit86, %._crit_edge15.us.loopexit
  %217 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %37
  store double 1.000000e+00, double* %217, align 8
  br i1 %28, label %.lr.ph18.us.preheader, label %._crit_edge19.us

.lr.ph18.us.preheader:                            ; preds = %._crit_edge15.us
  %pgocount16 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 14)
  %218 = add i64 %pgocount16, 1
  store i64 %218, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 14)
  br i1 %lcmp.mod38, label %.lr.ph18.us.prol.loopexit, label %.lr.ph18.us.prol

.lr.ph18.us.prol:                                 ; preds = %.lr.ph18.us.preheader
  %pgocount17 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 16)
  %219 = add i64 %pgocount17, 1
  store i64 %219, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 16)
  %220 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv39, i64 %32
  %221 = load double, double* %220, align 8
  %222 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %39
  %223 = load double, double* %222, align 8
  %224 = fmul double %221, %223
  %225 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %32
  %226 = load double, double* %225, align 8
  %227 = fadd double %224, %226
  %228 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv39, i64 %32
  store double %227, double* %228, align 8
  br label %.lr.ph18.us.prol.loopexit

.lr.ph18.us.prol.loopexit:                        ; preds = %.lr.ph18.us.prol, %.lr.ph18.us.preheader
  %indvars.iv35.unr.ph = phi i64 [ %indvars.iv.next36.prol, %.lr.ph18.us.prol ], [ %32, %.lr.ph18.us.preheader ]
  br i1 %38, label %._crit_edge19.us, label %.lr.ph18.us.preheader85

.lr.ph18.us.preheader85:                          ; preds = %.lr.ph18.us.prol.loopexit
  %pgocount18 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 15)
  %229 = add i64 %pgocount18, 1
  store i64 %229, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 15)
  br label %.lr.ph18.us

._crit_edge22.loopexit:                           ; preds = %._crit_edge19.us
  %pgocount19 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 18)
  %230 = add i64 %pgocount19, 1
  store i64 %230, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 18)
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %.preheader4.._crit_edge22_crit_edge, %._crit_edge22.loopexit, %.preheader
  %231 = add nuw nsw i32 %.0323, 1
  %exitcond43 = icmp eq i32 %.0323, %0
  br i1 %exitcond43, label %._crit_edge24.loopexit, label %.preheader4

._crit_edge24.loopexit:                           ; preds = %._crit_edge22
  %pgocount20 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 20)
  %232 = add i64 %pgocount20, 1
  store i64 %232, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 20)
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge24.loopexit, %6
  %pgocount21 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 19)
  %233 = add i64 %pgocount21, 1
  store i64 %233, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_adi, i64 0, i64 19)
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1000 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge4

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count7 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next6, %._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv5, %8
  br label %10

; <label>:10:                                     ; preds = %19, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %19 ]
  %11 = add nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %16, label %._crit_edge

._crit_edge:                                      ; preds = %10
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  br label %19

; <label>:16:                                     ; preds = %10
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %17 = add i64 %pgocount1, 1
  store i64 %17, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #5
  br label %19

; <label>:19:                                     ; preds = %._crit_edge, %16
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %22) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %10

._crit_edge.us:                                   ; preds = %19
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %24 = add i64 %pgocount2, 1
  store i64 %24, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, %wide.trip.count7
  br i1 %exitcond8, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 4)
  %25 = add i64 %pgocount3, 1
  store i64 %25, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 4)
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %2
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %26 = add i64 %pgocount4, 1
  store i64 %26, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %29) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
