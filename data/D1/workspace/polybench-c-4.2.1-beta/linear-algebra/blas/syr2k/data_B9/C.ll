; ModuleID = 'B.ll'
source_filename = "syr2k.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_syr2k = private constant [17 x i8] c"B.ll:kernel_syr2k"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 32414643582, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 90900346899, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_syr2k = private global [28 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_syr2k = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4484451777959451810, i64 319673534434, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i32 0, i32 0), i8* null, i8* null, i32 28, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 63976198547, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [57 x i8] c"7\00main\01B.ll:init_array\01B.ll:kernel_syr2k\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_syr2k to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1000 x double]*
  call fastcc void @init_array(i32 1200, i32 1000, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  tail call fastcc void @kernel_syr2k(i32 1200, i32 1000, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %20

; <label>:14:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %16 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %16, align 1
  %17 = icmp eq i8 %strcmpload, 0
  br i1 %17, label %18, label %20

; <label>:18:                                     ; preds = %14
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %8)
  br label %20

; <label>:20:                                     ; preds = %18, %14, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %21 = add i64 %pgocount2, 1
  store i64 %21, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader4.lr.ph, label %._crit_edge8

.preheader4.lr.ph:                                ; preds = %7
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %10 = icmp sgt i32 %1, 0
  %11 = sitofp i32 %0 to double
  %12 = sitofp i32 %1 to double
  br i1 %10, label %.preheader4.us.preheader, label %.preheader.lr.ph

.preheader4.us.preheader:                         ; preds = %.preheader4.lr.ph
  %wide.trip.count21 = zext i32 %1 to i64
  %wide.trip.count25 = zext i32 %0 to i64
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge11.us, %.preheader4.us.preheader
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %._crit_edge11.us ], [ 0, %.preheader4.us.preheader ]
  br label %13

; <label>:13:                                     ; preds = %._crit_edge1, %.preheader4.us
  %indvars.iv19 = phi i64 [ 0, %.preheader4.us ], [ %indvars.iv.next20, %._crit_edge1 ]
  %14 = mul nuw nsw i64 %indvars.iv19, %indvars.iv23
  %15 = add nuw nsw i64 %14, 1
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, %0
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, %11
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv23, i64 %indvars.iv19
  store double %19, double* %20, align 8
  %21 = add nuw nsw i64 %14, 2
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, %1
  %24 = sitofp i32 %23 to double
  %25 = fdiv double %24, %12
  %26 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv23, i64 %indvars.iv19
  store double %25, double* %26, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next20, %wide.trip.count21
  br i1 %exitcond22, label %._crit_edge11.us, label %._crit_edge1

._crit_edge1:                                     ; preds = %13
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %27 = add i64 %pgocount2, 1
  store i64 %27, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  br label %13

._crit_edge11.us:                                 ; preds = %13
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %28 = add i64 %pgocount3, 1
  store i64 %28, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next24, %wide.trip.count25
  br i1 %exitcond26, label %.preheader3, label %.preheader4.us

.preheader3:                                      ; preds = %._crit_edge11.us
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %29 = add i64 %pgocount4, 1
  store i64 %29, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %30 = icmp sgt i32 %0, 0
  br i1 %30, label %.preheader.lr.ph, label %._crit_edge8

.preheader.lr.ph:                                 ; preds = %.preheader3, %.preheader4.lr.ph
  %31 = sitofp i32 %1 to double
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count17 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %._crit_edge.us ], [ 0, %.preheader.lr.ph ]
  br label %32

; <label>:32:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %33 = mul nuw nsw i64 %indvars.iv, %indvars.iv15
  %34 = add nuw nsw i64 %33, 3
  %35 = trunc i64 %34 to i32
  %36 = srem i32 %35, %0
  %37 = sitofp i32 %36 to double
  %38 = fdiv double %37, %31
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv15, i64 %indvars.iv
  store double %38, double* %39, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge:                                      ; preds = %32
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %40 = add i64 %pgocount5, 1
  store i64 %40, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  br label %32

._crit_edge.us:                                   ; preds = %32
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %41 = add i64 %pgocount6, 1
  store i64 %41, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, %wide.trip.count17
  br i1 %exitcond18, label %._crit_edge8.loopexit, label %.preheader.us

._crit_edge8.loopexit:                            ; preds = %._crit_edge.us
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %42 = add i64 %pgocount7, 1
  store i64 %42, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %.preheader3, %7
  %pgocount8 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %43 = add i64 %pgocount8, 1
  store i64 %43, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1000 x double]* nocapture readonly) unnamed_addr #2 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader4.lr.ph, label %._crit_edge13

.preheader4.lr.ph:                                ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph.us.preheader, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader4.lr.ph
  %wide.trip.count55 = zext i32 %0 to i64
  %broadcast.splatinsert62 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat63 = shufflevector <2 x double> %broadcast.splatinsert62, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph

.lr.ph.us.preheader:                              ; preds = %.preheader4.lr.ph
  %wide.trip.count32 = zext i32 %1 to i64
  %wide.trip.count39 = zext i32 %0 to i64
  %broadcast.splatinsert131 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat132 = shufflevector <2 x double> %broadcast.splatinsert131, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert106 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat107 = shufflevector <2 x double> %broadcast.splatinsert106, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new..lr.ph.us.new_crit_edge, %.lr.ph.us.new.preheader134
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.us.new..lr.ph.us.new_crit_edge ], [ %indvars.iv.ph, %.lr.ph.us.new.preheader134 ]
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv
  %11 = load double, double* %10, align 8
  %12 = fmul double %11, %3
  store double %12, double* %10, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv.next
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, %3
  store double %15, double* %13, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv.next.1
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, %3
  store double %18, double* %16, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv.next.2
  %20 = load double, double* %19, align 8
  %21 = fmul double %20, %3
  store double %21, double* %19, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv35
  br i1 %exitcond.3, label %.preheader.us15.preheader.loopexit, label %.lr.ph.us.new..lr.ph.us.new_crit_edge, !llvm.loop !1

.lr.ph.us.new..lr.ph.us.new_crit_edge:            ; preds = %.lr.ph.us.new
  %pgocount = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 3)
  %22 = add i64 %pgocount, 1
  store i64 %22, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 3)
  br label %.lr.ph.us.new

.preheader.us15.preheader.loopexit:               ; preds = %.lr.ph.us.new
  br label %.preheader.us15.preheader

.preheader.us15.preheader:                        ; preds = %middle.block109, %.prol.loopexit, %.preheader.us15.preheader.loopexit
  %min.iters.check67 = icmp ult i64 %78, 2
  %n.vec70 = and i64 %78, -2
  %cmp.zero71 = icmp eq i64 %n.vec70, 0
  %cmp.n102 = icmp eq i64 %78, %n.vec70
  br label %.preheader.us15

scalar.ph66:                                      ; preds = %scalar.ph66.scalar.ph66_crit_edge, %scalar.ph66.preheader
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %scalar.ph66.scalar.ph66_crit_edge ], [ %indvars.iv25.ph, %scalar.ph66.preheader ]
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv25, i64 %indvars.iv30
  %24 = load double, double* %23, align 8
  %25 = fmul double %24, %2
  %26 = load double, double* %39, align 8
  %27 = fmul double %25, %26
  %28 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv25, i64 %indvars.iv30
  %29 = load double, double* %28, align 8
  %30 = fmul double %29, %2
  %31 = load double, double* %40, align 8
  %32 = fmul double %30, %31
  %33 = fadd double %27, %32
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv25
  %35 = load double, double* %34, align 8
  %36 = fadd double %35, %33
  store double %36, double* %34, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond = icmp eq i64 %indvars.iv.next26, %indvars.iv35
  br i1 %exitcond, label %._crit_edge.us18.loopexit, label %scalar.ph66.scalar.ph66_crit_edge, !llvm.loop !5

scalar.ph66.scalar.ph66_crit_edge:                ; preds = %scalar.ph66
  %pgocount1 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 0)
  %37 = add i64 %pgocount1, 1
  store i64 %37, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 0)
  br label %scalar.ph66

.preheader.us15:                                  ; preds = %._crit_edge.us18, %.preheader.us15.preheader
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %._crit_edge.us18 ], [ 0, %.preheader.us15.preheader ]
  %scevgep76 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv30
  %38 = add i64 %indvars.iv30, 1
  %scevgep78 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv37, i64 %38
  %scevgep80 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv30
  %scevgep82 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv37, i64 %38
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv37, i64 %indvars.iv30
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv30
  br i1 %min.iters.check67, label %scalar.ph66.preheader, label %min.iters.checked68

scalar.ph66.preheader:                            ; preds = %middle.block65.scalar.ph66.preheader_crit_edge, %vector.memcheck, %min.iters.checked68, %.preheader.us15
  %indvars.iv25.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked68 ], [ 0, %.preheader.us15 ], [ %n.vec70, %middle.block65.scalar.ph66.preheader_crit_edge ]
  br label %scalar.ph66

min.iters.checked68:                              ; preds = %.preheader.us15
  %pgocount2 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 11)
  %41 = add i64 %pgocount2, 1
  store i64 %41, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 11)
  br i1 %cmp.zero71, label %scalar.ph66.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked68
  %pgocount3 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 12)
  %42 = add i64 %pgocount3, 1
  store i64 %42, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 12)
  %bound0 = icmp ult double* %scevgep, %40
  %bound1 = icmp ult double* %40, %scevgep74
  %found.conflict = and i1 %bound0, %bound1
  %bound085 = icmp ult double* %scevgep, %scevgep78
  %bound186 = icmp ult double* %scevgep76, %scevgep74
  %found.conflict87 = and i1 %bound085, %bound186
  %conflict.rdx = or i1 %found.conflict, %found.conflict87
  %bound088 = icmp ult double* %scevgep, %scevgep82
  %bound189 = icmp ult double* %scevgep80, %scevgep74
  %found.conflict90 = and i1 %bound088, %bound189
  %conflict.rdx91 = or i1 %conflict.rdx, %found.conflict90
  %bound094 = icmp ult double* %scevgep, %39
  %bound195 = icmp ult double* %39, %scevgep74
  %found.conflict96 = and i1 %bound094, %bound195
  %conflict.rdx97 = or i1 %conflict.rdx91, %found.conflict96
  br i1 %conflict.rdx97, label %scalar.ph66.preheader, label %vector.ph98

vector.ph98:                                      ; preds = %vector.memcheck
  %43 = load double, double* %39, align 8, !alias.scope !6
  %44 = insertelement <2 x double> undef, double %43, i32 0
  %45 = shufflevector <2 x double> %44, <2 x double> undef, <2 x i32> zeroinitializer
  %46 = load double, double* %40, align 8, !alias.scope !9
  %47 = insertelement <2 x double> undef, double %46, i32 0
  %48 = shufflevector <2 x double> %47, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body64

vector.body64:                                    ; preds = %vector.body64.vector.body64_crit_edge, %vector.ph98
  %index99 = phi i64 [ 0, %vector.ph98 ], [ %index.next100, %vector.body64.vector.body64_crit_edge ]
  %49 = or i64 %index99, 1
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index99, i64 %indvars.iv30
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %49, i64 %indvars.iv30
  %52 = load double, double* %50, align 8, !alias.scope !11
  %53 = load double, double* %51, align 8, !alias.scope !11
  %54 = insertelement <2 x double> undef, double %52, i32 0
  %55 = insertelement <2 x double> %54, double %53, i32 1
  %56 = fmul <2 x double> %55, %broadcast.splat107
  %57 = fmul <2 x double> %56, %45
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index99, i64 %indvars.iv30
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %49, i64 %indvars.iv30
  %60 = load double, double* %58, align 8, !alias.scope !13
  %61 = load double, double* %59, align 8, !alias.scope !13
  %62 = insertelement <2 x double> undef, double %60, i32 0
  %63 = insertelement <2 x double> %62, double %61, i32 1
  %64 = fmul <2 x double> %63, %broadcast.splat107
  %65 = fmul <2 x double> %64, %48
  %66 = fadd <2 x double> %57, %65
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %index99
  %68 = bitcast double* %67 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %68, align 8, !alias.scope !15, !noalias !17
  %69 = fadd <2 x double> %wide.load, %66
  %70 = bitcast double* %67 to <2 x double>*
  store <2 x double> %69, <2 x double>* %70, align 8, !alias.scope !15, !noalias !17
  %index.next100 = add i64 %index99, 2
  %71 = icmp eq i64 %index.next100, %n.vec70
  br i1 %71, label %middle.block65, label %vector.body64.vector.body64_crit_edge, !llvm.loop !18

vector.body64.vector.body64_crit_edge:            ; preds = %vector.body64
  %pgocount4 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 1)
  %72 = add i64 %pgocount4, 1
  store i64 %72, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 1)
  br label %vector.body64

middle.block65:                                   ; preds = %vector.body64
  %pgocount5 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 13)
  %73 = add i64 %pgocount5, 1
  store i64 %73, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 13)
  br i1 %cmp.n102, label %._crit_edge.us18, label %middle.block65.scalar.ph66.preheader_crit_edge

middle.block65.scalar.ph66.preheader_crit_edge:   ; preds = %middle.block65
  %pgocount6 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 8)
  %74 = add i64 %pgocount6, 1
  store i64 %74, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 8)
  br label %scalar.ph66.preheader

.lr.ph.us:                                        ; preds = %._crit_edge9.us, %.lr.ph.us.preheader
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %._crit_edge9.us ], [ 0, %.lr.ph.us.preheader ]
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %._crit_edge9.us ], [ 1, %.lr.ph.us.preheader ]
  %75 = add i64 %indvars.iv37, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 0
  %76 = mul i64 %indvars.iv37, 1201
  %77 = add i64 %76, 1
  %scevgep74 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %77
  %78 = add i64 %indvars.iv37, 1
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %79 = trunc i64 %indvars.iv.next38 to i32
  %xtraiter = and i32 %79, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader..prol.preheader_crit_edge, %.prol.preheader.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader..prol.preheader_crit_edge ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader..prol.preheader_crit_edge ], [ %xtraiter, %.prol.preheader.preheader ]
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv.prol
  %81 = load double, double* %80, align 8
  %82 = fmul double %81, %3
  store double %82, double* %80, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader..prol.preheader_crit_edge, !llvm.loop !19

.prol.preheader..prol.preheader_crit_edge:        ; preds = %.prol.preheader
  %pgocount7 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 2)
  %83 = add i64 %pgocount7, 1
  store i64 %83, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 2)
  br label %.prol.preheader

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  %pgocount8 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 15)
  %84 = add i64 %pgocount8, 1
  store i64 %84, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 15)
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  %85 = icmp ult i64 %indvars.iv37, 3
  br i1 %85, label %.preheader.us15.preheader, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  %pgocount9 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 16)
  %86 = add i64 %pgocount9, 1
  store i64 %86, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 16)
  %87 = sub i64 %75, %indvars.iv.unr
  %88 = lshr i64 %87, 2
  %89 = add nuw nsw i64 %88, 1
  %min.iters.check111 = icmp ult i64 %89, 2
  br i1 %min.iters.check111, label %.lr.ph.us.new.preheader134, label %min.iters.checked112

.lr.ph.us.new.preheader134:                       ; preds = %middle.block109, %min.iters.checked112, %.lr.ph.us.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked112 ], [ %indvars.iv.unr, %.lr.ph.us.new.preheader ], [ %ind.end120, %middle.block109 ]
  %pgocount10 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 17)
  %90 = add i64 %pgocount10, 1
  store i64 %90, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 17)
  br label %.lr.ph.us.new

min.iters.checked112:                             ; preds = %.lr.ph.us.new.preheader
  %pgocount11 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 21)
  %91 = add i64 %pgocount11, 1
  store i64 %91, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 21)
  %n.mod.vf113 = and i64 %89, 1
  %n.vec114 = sub nsw i64 %89, %n.mod.vf113
  %cmp.zero115 = icmp eq i64 %n.vec114, 0
  %92 = add i64 %indvars.iv.unr, 4
  %93 = shl nuw i64 %88, 2
  %94 = add i64 %92, %93
  %95 = shl nuw nsw i64 %n.mod.vf113, 2
  %ind.end120 = sub i64 %94, %95
  br i1 %cmp.zero115, label %.lr.ph.us.new.preheader134, label %vector.ph116

vector.ph116:                                     ; preds = %min.iters.checked112
  br label %vector.body108

vector.body108:                                   ; preds = %vector.body108.vector.body108_crit_edge, %vector.ph116
  %index117 = phi i64 [ 0, %vector.ph116 ], [ %index.next118, %vector.body108.vector.body108_crit_edge ]
  %96 = shl i64 %index117, 2
  %97 = add i64 %indvars.iv.unr, %96
  %98 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %97
  %99 = bitcast double* %98 to <8 x double>*
  %wide.vec126 = load <8 x double>, <8 x double>* %99, align 8
  %strided.vec127 = shufflevector <8 x double> %wide.vec126, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec128 = shufflevector <8 x double> %wide.vec126, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec129 = shufflevector <8 x double> %wide.vec126, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec130 = shufflevector <8 x double> %wide.vec126, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %100 = fmul <2 x double> %strided.vec127, %broadcast.splat132
  %101 = fmul <2 x double> %strided.vec128, %broadcast.splat132
  %102 = fmul <2 x double> %strided.vec129, %broadcast.splat132
  %103 = add nsw i64 %97, 3
  %104 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %103
  %105 = fmul <2 x double> %strided.vec130, %broadcast.splat132
  %106 = getelementptr double, double* %104, i64 -3
  %107 = bitcast double* %106 to <8 x double>*
  %108 = shufflevector <2 x double> %100, <2 x double> %101, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %109 = shufflevector <2 x double> %102, <2 x double> %105, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec133 = shufflevector <4 x double> %108, <4 x double> %109, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec133, <8 x double>* %107, align 8
  %index.next118 = add i64 %index117, 2
  %110 = icmp eq i64 %index.next118, %n.vec114
  br i1 %110, label %middle.block109, label %vector.body108.vector.body108_crit_edge, !llvm.loop !21

vector.body108.vector.body108_crit_edge:          ; preds = %vector.body108
  %pgocount12 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 6)
  %111 = add i64 %pgocount12, 1
  store i64 %111, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 6)
  br label %vector.body108

middle.block109:                                  ; preds = %vector.body108
  %pgocount13 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 22)
  %112 = add i64 %pgocount13, 1
  store i64 %112, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 22)
  %cmp.n121 = icmp eq i64 %n.mod.vf113, 0
  br i1 %cmp.n121, label %.preheader.us15.preheader, label %.lr.ph.us.new.preheader134

._crit_edge.us18.loopexit:                        ; preds = %scalar.ph66
  %pgocount14 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 10)
  %113 = add i64 %pgocount14, 1
  store i64 %113, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 10)
  br label %._crit_edge.us18

._crit_edge.us18:                                 ; preds = %._crit_edge.us18.loopexit, %middle.block65
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next31, %wide.trip.count32
  br i1 %exitcond33, label %._crit_edge9.us, label %.preheader.us15

._crit_edge9.us:                                  ; preds = %._crit_edge.us18
  %pgocount15 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 14)
  %114 = add i64 %pgocount15, 1
  store i64 %114, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 14)
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next38, %wide.trip.count39
  br i1 %exitcond40, label %._crit_edge13.loopexit, label %.lr.ph.us

.lr.ph:                                           ; preds = %.preheader3, %.lr.ph.preheader
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %.preheader3 ], [ 0, %.lr.ph.preheader ]
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %.preheader3 ], [ 1, %.lr.ph.preheader ]
  %115 = add i64 %indvars.iv53, -3
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %116 = trunc i64 %indvars.iv.next54 to i32
  %xtraiter48 = and i32 %116, 3
  %lcmp.mod49 = icmp eq i32 %xtraiter48, 0
  br i1 %lcmp.mod49, label %.lr.ph..prol.loopexit47_crit_edge, label %.prol.preheader46.preheader

.lr.ph..prol.loopexit47_crit_edge:                ; preds = %.lr.ph
  %pgocount16 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 9)
  %117 = add i64 %pgocount16, 1
  store i64 %117, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 9)
  br label %.prol.loopexit47

.prol.preheader46.preheader:                      ; preds = %.lr.ph
  br label %.prol.preheader46

.prol.preheader46:                                ; preds = %.prol.preheader46..prol.preheader46_crit_edge, %.prol.preheader46.preheader
  %indvars.iv41.prol = phi i64 [ %indvars.iv.next42.prol, %.prol.preheader46..prol.preheader46_crit_edge ], [ 0, %.prol.preheader46.preheader ]
  %prol.iter50 = phi i32 [ %prol.iter50.sub, %.prol.preheader46..prol.preheader46_crit_edge ], [ %xtraiter48, %.prol.preheader46.preheader ]
  %118 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv41.prol
  %119 = load double, double* %118, align 8
  %120 = fmul double %119, %3
  store double %120, double* %118, align 8
  %indvars.iv.next42.prol = add nuw nsw i64 %indvars.iv41.prol, 1
  %prol.iter50.sub = add i32 %prol.iter50, -1
  %prol.iter50.cmp = icmp eq i32 %prol.iter50.sub, 0
  br i1 %prol.iter50.cmp, label %.prol.loopexit47.loopexit, label %.prol.preheader46..prol.preheader46_crit_edge, !llvm.loop !22

.prol.preheader46..prol.preheader46_crit_edge:    ; preds = %.prol.preheader46
  %pgocount17 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 4)
  %121 = add i64 %pgocount17, 1
  store i64 %121, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 4)
  br label %.prol.preheader46

.prol.loopexit47.loopexit:                        ; preds = %.prol.preheader46
  %pgocount18 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 18)
  %122 = add i64 %pgocount18, 1
  store i64 %122, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 18)
  br label %.prol.loopexit47

.prol.loopexit47:                                 ; preds = %.lr.ph..prol.loopexit47_crit_edge, %.prol.loopexit47.loopexit
  %indvars.iv41.unr = phi i64 [ 0, %.lr.ph..prol.loopexit47_crit_edge ], [ %indvars.iv.next42.prol, %.prol.loopexit47.loopexit ]
  %123 = icmp ult i64 %indvars.iv53, 3
  br i1 %123, label %.preheader3, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit47
  %pgocount19 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 19)
  %124 = add i64 %pgocount19, 1
  store i64 %124, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 19)
  %125 = sub i64 %115, %indvars.iv41.unr
  %126 = lshr i64 %125, 2
  %127 = add nuw nsw i64 %126, 1
  %min.iters.check = icmp ult i64 %127, 2
  br i1 %min.iters.check, label %.lr.ph.new.preheader135, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph.new.preheader
  %pgocount20 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 23)
  %128 = add i64 %pgocount20, 1
  store i64 %128, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 23)
  %n.mod.vf = and i64 %127, 1
  %n.vec = sub nsw i64 %127, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %129 = add i64 %indvars.iv41.unr, 4
  %130 = shl nuw i64 %126, 2
  %131 = add i64 %129, %130
  %132 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %131, %132
  br i1 %cmp.zero, label %.lr.ph.new.preheader135, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %133 = shl i64 %index, 2
  %134 = add i64 %indvars.iv41.unr, %133
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %134
  %136 = bitcast double* %135 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %136, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec59 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec60 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec61 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %137 = fmul <2 x double> %strided.vec, %broadcast.splat63
  %138 = fmul <2 x double> %strided.vec59, %broadcast.splat63
  %139 = fmul <2 x double> %strided.vec60, %broadcast.splat63
  %140 = add nsw i64 %134, 3
  %141 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %140
  %142 = fmul <2 x double> %strided.vec61, %broadcast.splat63
  %143 = getelementptr double, double* %141, i64 -3
  %144 = bitcast double* %143 to <8 x double>*
  %145 = shufflevector <2 x double> %137, <2 x double> %138, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %146 = shufflevector <2 x double> %139, <2 x double> %142, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %145, <4 x double> %146, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %144, align 8
  %index.next = add i64 %index, 2
  %147 = icmp eq i64 %index.next, %n.vec
  br i1 %147, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !23

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  %pgocount21 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 7)
  %148 = add i64 %pgocount21, 1
  store i64 %148, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 7)
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %pgocount22 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 24)
  %149 = add i64 %pgocount22, 1
  store i64 %149, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 24)
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.preheader3, label %.lr.ph.new.preheader135

.lr.ph.new.preheader135:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph.new.preheader
  %indvars.iv41.ph = phi i64 [ %indvars.iv41.unr, %min.iters.checked ], [ %indvars.iv41.unr, %.lr.ph.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new..lr.ph.new_crit_edge, %.lr.ph.new.preheader135
  %indvars.iv41 = phi i64 [ %indvars.iv.next42.3, %.lr.ph.new..lr.ph.new_crit_edge ], [ %indvars.iv41.ph, %.lr.ph.new.preheader135 ]
  %150 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv41
  %151 = load double, double* %150, align 8
  %152 = fmul double %151, %3
  store double %152, double* %150, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %153 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.next42
  %154 = load double, double* %153, align 8
  %155 = fmul double %154, %3
  store double %155, double* %153, align 8
  %indvars.iv.next42.1 = add nsw i64 %indvars.iv41, 2
  %156 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.next42.1
  %157 = load double, double* %156, align 8
  %158 = fmul double %157, %3
  store double %158, double* %156, align 8
  %indvars.iv.next42.2 = add nsw i64 %indvars.iv41, 3
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv53, i64 %indvars.iv.next42.2
  %160 = load double, double* %159, align 8
  %161 = fmul double %160, %3
  store double %161, double* %159, align 8
  %indvars.iv.next42.3 = add nsw i64 %indvars.iv41, 4
  %exitcond45.3 = icmp eq i64 %indvars.iv.next42.3, %indvars.iv51
  br i1 %exitcond45.3, label %.preheader3.loopexit, label %.lr.ph.new..lr.ph.new_crit_edge, !llvm.loop !24

.lr.ph.new..lr.ph.new_crit_edge:                  ; preds = %.lr.ph.new
  %pgocount23 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 5)
  %162 = add i64 %pgocount23, 1
  store i64 %162, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 5)
  br label %.lr.ph.new

.preheader3.loopexit:                             ; preds = %.lr.ph.new
  %pgocount24 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 20)
  %163 = add i64 %pgocount24, 1
  store i64 %163, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 20)
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3.loopexit, %middle.block, %.prol.loopexit47
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next54, %wide.trip.count55
  br i1 %exitcond56, label %._crit_edge13.loopexit136, label %.lr.ph

._crit_edge13.loopexit:                           ; preds = %._crit_edge9.us
  %pgocount25 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 26)
  %164 = add i64 %pgocount25, 1
  store i64 %164, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 26)
  br label %._crit_edge13

._crit_edge13.loopexit136:                        ; preds = %.preheader3
  %pgocount26 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 27)
  %165 = add i64 %pgocount26, 1
  store i64 %165, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 27)
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit136, %._crit_edge13.loopexit, %7
  %pgocount27 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 25)
  %166 = add i64 %pgocount27, 1
  store i64 %166, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 25)
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
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
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
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
!1 = distinct !{!1, !2, !3, !4}
!2 = !{!"llvm.loop.unroll.runtime.disable"}
!3 = !{!"llvm.loop.vectorize.width", i32 1}
!4 = !{!"llvm.loop.interleave.count", i32 1}
!5 = distinct !{!5, !3, !4}
!6 = !{!7}
!7 = distinct !{!7, !8}
!8 = distinct !{!8, !"LVerDomain"}
!9 = !{!10}
!10 = distinct !{!10, !8}
!11 = !{!12}
!12 = distinct !{!12, !8}
!13 = !{!14}
!14 = distinct !{!14, !8}
!15 = !{!16}
!16 = distinct !{!16, !8}
!17 = !{!10, !12, !14, !7}
!18 = distinct !{!18, !3, !4}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.unroll.disable"}
!21 = distinct !{!21, !3, !4}
!22 = distinct !{!22, !20}
!23 = distinct !{!23, !3, !4}
!24 = distinct !{!24, !2, !3, !4}
