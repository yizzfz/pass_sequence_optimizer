; ModuleID = 'B.ll'
source_filename = "syrk.c"
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
@__profn_B.ll_kernel_syrk = private constant [16 x i8] c"B.ll:kernel_syrk"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 32414643582, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 90900346899, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_syrk = private global [25 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_syrk = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5417141688726560687, i64 292800170575, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i32 0, i32 0), i8* null, i8* null, i32 25, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 63976198547, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [56 x i8] c"6\00main\01B.ll:init_array\01B.ll:kernel_syrk\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_syrk to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([56 x i8], [56 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = bitcast i8* %5 to [1200 x double]*
  %8 = bitcast i8* %6 to [1000 x double]*
  call fastcc void @init_array(i32 1200, i32 1000, double* nonnull %3, double* nonnull %4, [1200 x double]* %7, [1000 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = load double, double* %4, align 8
  tail call fastcc void @kernel_syrk(i32 1200, i32 1000, double %9, double %10, [1200 x double]* %7, [1000 x double]* %8)
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
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %7)
  br label %18

; <label>:18:                                     ; preds = %16, %12, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %19 = add i64 %pgocount2, 1
  store i64 %19, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader4.lr.ph, label %._crit_edge8

.preheader4.lr.ph:                                ; preds = %6
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %9 = icmp sgt i32 %1, 0
  %10 = sitofp i32 %0 to double
  br i1 %9, label %.preheader4.us.preheader, label %.preheader.lr.ph

.preheader4.us.preheader:                         ; preds = %.preheader4.lr.ph
  %wide.trip.count21 = zext i32 %1 to i64
  %wide.trip.count25 = zext i32 %0 to i64
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge11.us, %.preheader4.us.preheader
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %._crit_edge11.us ], [ 0, %.preheader4.us.preheader ]
  br label %11

; <label>:11:                                     ; preds = %._crit_edge1, %.preheader4.us
  %indvars.iv19 = phi i64 [ 0, %.preheader4.us ], [ %indvars.iv.next20, %._crit_edge1 ]
  %12 = mul nuw nsw i64 %indvars.iv19, %indvars.iv23
  %13 = add nuw nsw i64 %12, 1
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, %0
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, %10
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv23, i64 %indvars.iv19
  store double %17, double* %18, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next20, %wide.trip.count21
  br i1 %exitcond22, label %._crit_edge11.us, label %._crit_edge1

._crit_edge1:                                     ; preds = %11
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %19 = add i64 %pgocount2, 1
  store i64 %19, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  br label %11

._crit_edge11.us:                                 ; preds = %11
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %20 = add i64 %pgocount3, 1
  store i64 %20, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next24, %wide.trip.count25
  br i1 %exitcond26, label %.preheader3, label %.preheader4.us

.preheader3:                                      ; preds = %._crit_edge11.us
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %21 = add i64 %pgocount4, 1
  store i64 %21, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %22 = icmp sgt i32 %0, 0
  br i1 %22, label %.preheader.lr.ph, label %._crit_edge8

.preheader.lr.ph:                                 ; preds = %.preheader3, %.preheader4.lr.ph
  %23 = sitofp i32 %1 to double
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count17 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %._crit_edge.us ], [ 0, %.preheader.lr.ph ]
  br label %24

; <label>:24:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %25 = mul nuw nsw i64 %indvars.iv, %indvars.iv15
  %26 = add nuw nsw i64 %25, 2
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, %1
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, %23
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv15, i64 %indvars.iv
  store double %30, double* %31, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge:                                      ; preds = %24
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %32 = add i64 %pgocount5, 1
  store i64 %32, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  br label %24

._crit_edge.us:                                   ; preds = %24
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %33 = add i64 %pgocount6, 1
  store i64 %33, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, %wide.trip.count17
  br i1 %exitcond18, label %._crit_edge8.loopexit, label %.preheader.us

._crit_edge8.loopexit:                            ; preds = %._crit_edge.us
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %34 = add i64 %pgocount7, 1
  store i64 %34, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %.preheader3, %6
  %pgocount8 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %35 = add i64 %pgocount8, 1
  store i64 %35, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syrk(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly) unnamed_addr #2 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader4.lr.ph, label %._crit_edge13

.preheader4.lr.ph:                                ; preds = %6
  %8 = icmp sgt i32 %1, 0
  br i1 %8, label %.lr.ph.us.preheader, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader4.lr.ph
  %wide.trip.count59 = zext i32 %0 to i64
  %broadcast.splatinsert67 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat68 = shufflevector <2 x double> %broadcast.splatinsert67, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph

.lr.ph.us.preheader:                              ; preds = %.preheader4.lr.ph
  %wide.trip.count37 = zext i32 %1 to i64
  %wide.trip.count43 = zext i32 %0 to i64
  %broadcast.splatinsert92 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat93 = shufflevector <2 x double> %broadcast.splatinsert92, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new..lr.ph.us.new_crit_edge, %.lr.ph.us.new.preheader95
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.us.new..lr.ph.us.new_crit_edge ], [ %indvars.iv.ph, %.lr.ph.us.new.preheader95 ]
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv41, i64 %indvars.iv
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, %3
  store double %11, double* %9, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv41, i64 %indvars.iv.next
  %13 = load double, double* %12, align 8
  %14 = fmul double %13, %3
  store double %14, double* %12, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv41, i64 %indvars.iv.next.1
  %16 = load double, double* %15, align 8
  %17 = fmul double %16, %3
  store double %17, double* %15, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv41, i64 %indvars.iv.next.2
  %19 = load double, double* %18, align 8
  %20 = fmul double %19, %3
  store double %20, double* %18, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv39
  br i1 %exitcond.3, label %.preheader.us15.preheader.loopexit, label %.lr.ph.us.new..lr.ph.us.new_crit_edge, !llvm.loop !1

.lr.ph.us.new..lr.ph.us.new_crit_edge:            ; preds = %.lr.ph.us.new
  %pgocount = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 2)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 2)
  br label %.lr.ph.us.new

.preheader.us15.new:                              ; preds = %.preheader.us15.new..preheader.us15.new_crit_edge, %.preheader.us15.new.preheader
  %indvars.iv25 = phi i64 [ %indvars.iv.next26.1, %.preheader.us15.new..preheader.us15.new_crit_edge ], [ %indvars.iv25.unr.ph, %.preheader.us15.new.preheader ]
  %22 = load double, double* %39, align 8
  %23 = fmul double %22, %2
  %24 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv25, i64 %indvars.iv35
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv41, i64 %indvars.iv25
  %28 = load double, double* %27, align 8
  %29 = fadd double %28, %26
  store double %29, double* %27, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %30 = load double, double* %39, align 8
  %31 = fmul double %30, %2
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv.next26, i64 %indvars.iv35
  %33 = load double, double* %32, align 8
  %34 = fmul double %31, %33
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv41, i64 %indvars.iv.next26
  %36 = load double, double* %35, align 8
  %37 = fadd double %36, %34
  store double %37, double* %35, align 8
  %indvars.iv.next26.1 = add nsw i64 %indvars.iv25, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next26.1, %indvars.iv39
  br i1 %exitcond.1, label %._crit_edge.us18.loopexit, label %.preheader.us15.new..preheader.us15.new_crit_edge

.preheader.us15.new..preheader.us15.new_crit_edge: ; preds = %.preheader.us15.new
  %pgocount1 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 0)
  %38 = add i64 %pgocount1, 1
  store i64 %38, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 0)
  br label %.preheader.us15.new

.preheader.us15:                                  ; preds = %._crit_edge.us18, %.preheader.us15.preheader
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %._crit_edge.us18 ], [ 0, %.preheader.us15.preheader ]
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv41, i64 %indvars.iv35
  br i1 %lcmp.mod33, label %.prol.loopexit31, label %.prol.preheader30

.prol.preheader30:                                ; preds = %.preheader.us15
  %pgocount2 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 10)
  %40 = add i64 %pgocount2, 1
  store i64 %40, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 10)
  %41 = load double, double* %39, align 8
  %42 = fmul double %41, %2
  %43 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv35
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = load double, double* %85, align 8
  %47 = fadd double %46, %45
  store double %47, double* %85, align 8
  br label %.prol.loopexit31

.prol.loopexit31:                                 ; preds = %.prol.preheader30, %.preheader.us15
  %indvars.iv25.unr.ph = phi i64 [ 1, %.prol.preheader30 ], [ 0, %.preheader.us15 ]
  br i1 %84, label %.prol.loopexit31.._crit_edge.us18_crit_edge, label %.preheader.us15.new.preheader

.prol.loopexit31.._crit_edge.us18_crit_edge:      ; preds = %.prol.loopexit31
  %pgocount3 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 3)
  %48 = add i64 %pgocount3, 1
  store i64 %48, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 3)
  br label %._crit_edge.us18

.preheader.us15.new.preheader:                    ; preds = %.prol.loopexit31
  br label %.preheader.us15.new

.lr.ph.us:                                        ; preds = %._crit_edge9.us, %.lr.ph.us.preheader
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %._crit_edge9.us ], [ 0, %.lr.ph.us.preheader ]
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge9.us ], [ 1, %.lr.ph.us.preheader ]
  %49 = add i64 %indvars.iv41, -3
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %50 = trunc i64 %indvars.iv.next42 to i32
  %xtraiter = and i32 %50, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader..prol.preheader_crit_edge, %.prol.preheader.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader..prol.preheader_crit_edge ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader..prol.preheader_crit_edge ], [ %xtraiter, %.prol.preheader.preheader ]
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv41, i64 %indvars.iv.prol
  %52 = load double, double* %51, align 8
  %53 = fmul double %52, %3
  store double %53, double* %51, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader..prol.preheader_crit_edge, !llvm.loop !5

.prol.preheader..prol.preheader_crit_edge:        ; preds = %.prol.preheader
  %pgocount4 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 1)
  %54 = add i64 %pgocount4, 1
  store i64 %54, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 1)
  br label %.prol.preheader

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  %pgocount5 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 12)
  %55 = add i64 %pgocount5, 1
  store i64 %55, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 12)
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  %56 = icmp ult i64 %indvars.iv41, 3
  br i1 %56, label %.preheader.us15.preheader, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  %pgocount6 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 13)
  %57 = add i64 %pgocount6, 1
  store i64 %57, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 13)
  %58 = sub i64 %49, %indvars.iv.unr
  %59 = lshr i64 %58, 2
  %60 = add nuw nsw i64 %59, 1
  %min.iters.check72 = icmp ult i64 %60, 2
  br i1 %min.iters.check72, label %.lr.ph.us.new.preheader95, label %min.iters.checked73

.lr.ph.us.new.preheader95:                        ; preds = %middle.block70, %min.iters.checked73, %.lr.ph.us.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked73 ], [ %indvars.iv.unr, %.lr.ph.us.new.preheader ], [ %ind.end81, %middle.block70 ]
  br label %.lr.ph.us.new

min.iters.checked73:                              ; preds = %.lr.ph.us.new.preheader
  %pgocount7 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 18)
  %61 = add i64 %pgocount7, 1
  store i64 %61, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 18)
  %n.mod.vf74 = and i64 %60, 1
  %n.vec75 = sub nsw i64 %60, %n.mod.vf74
  %cmp.zero76 = icmp eq i64 %n.vec75, 0
  %62 = add i64 %indvars.iv.unr, 4
  %63 = shl nuw i64 %59, 2
  %64 = add i64 %62, %63
  %65 = shl nuw nsw i64 %n.mod.vf74, 2
  %ind.end81 = sub i64 %64, %65
  br i1 %cmp.zero76, label %.lr.ph.us.new.preheader95, label %vector.ph77

vector.ph77:                                      ; preds = %min.iters.checked73
  br label %vector.body69

vector.body69:                                    ; preds = %vector.body69.vector.body69_crit_edge, %vector.ph77
  %index78 = phi i64 [ 0, %vector.ph77 ], [ %index.next79, %vector.body69.vector.body69_crit_edge ]
  %66 = shl i64 %index78, 2
  %67 = add i64 %indvars.iv.unr, %66
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv41, i64 %67
  %69 = bitcast double* %68 to <8 x double>*
  %wide.vec87 = load <8 x double>, <8 x double>* %69, align 8
  %strided.vec88 = shufflevector <8 x double> %wide.vec87, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec89 = shufflevector <8 x double> %wide.vec87, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec90 = shufflevector <8 x double> %wide.vec87, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec91 = shufflevector <8 x double> %wide.vec87, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %70 = fmul <2 x double> %strided.vec88, %broadcast.splat93
  %71 = fmul <2 x double> %strided.vec89, %broadcast.splat93
  %72 = fmul <2 x double> %strided.vec90, %broadcast.splat93
  %73 = add nsw i64 %67, 3
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv41, i64 %73
  %75 = fmul <2 x double> %strided.vec91, %broadcast.splat93
  %76 = getelementptr double, double* %74, i64 -3
  %77 = bitcast double* %76 to <8 x double>*
  %78 = shufflevector <2 x double> %70, <2 x double> %71, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %79 = shufflevector <2 x double> %72, <2 x double> %75, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec94 = shufflevector <4 x double> %78, <4 x double> %79, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec94, <8 x double>* %77, align 8
  %index.next79 = add i64 %index78, 2
  %80 = icmp eq i64 %index.next79, %n.vec75
  br i1 %80, label %middle.block70, label %vector.body69.vector.body69_crit_edge, !llvm.loop !7

vector.body69.vector.body69_crit_edge:            ; preds = %vector.body69
  %pgocount8 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 6)
  %81 = add i64 %pgocount8, 1
  store i64 %81, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 6)
  br label %vector.body69

middle.block70:                                   ; preds = %vector.body69
  %pgocount9 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 19)
  %82 = add i64 %pgocount9, 1
  store i64 %82, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 19)
  %cmp.n82 = icmp eq i64 %n.mod.vf74, 0
  br i1 %cmp.n82, label %.preheader.us15.preheader, label %.lr.ph.us.new.preheader95

.preheader.us15.preheader.loopexit:               ; preds = %.lr.ph.us.new
  %pgocount10 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 14)
  %83 = add i64 %pgocount10, 1
  store i64 %83, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 14)
  br label %.preheader.us15.preheader

.preheader.us15.preheader:                        ; preds = %.preheader.us15.preheader.loopexit, %middle.block70, %.prol.loopexit
  %xtraiter3261 = and i64 %indvars.iv.next42, 1
  %lcmp.mod33 = icmp eq i64 %xtraiter3261, 0
  %84 = icmp eq i64 %indvars.iv41, 0
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv41, i64 0
  br label %.preheader.us15

._crit_edge.us18.loopexit:                        ; preds = %.preheader.us15.new
  %pgocount11 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 9)
  %86 = add i64 %pgocount11, 1
  store i64 %86, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 9)
  br label %._crit_edge.us18

._crit_edge.us18:                                 ; preds = %.prol.loopexit31.._crit_edge.us18_crit_edge, %._crit_edge.us18.loopexit
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond = icmp eq i64 %indvars.iv.next36, %wide.trip.count37
  br i1 %exitcond, label %._crit_edge9.us, label %.preheader.us15

._crit_edge9.us:                                  ; preds = %._crit_edge.us18
  %pgocount12 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 11)
  %87 = add i64 %pgocount12, 1
  store i64 %87, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 11)
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next42, %wide.trip.count43
  br i1 %exitcond44, label %._crit_edge13.loopexit, label %.lr.ph.us

.lr.ph:                                           ; preds = %.preheader3, %.lr.ph.preheader
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %.preheader3 ], [ 0, %.lr.ph.preheader ]
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %.preheader3 ], [ 1, %.lr.ph.preheader ]
  %88 = add i64 %indvars.iv57, -3
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %89 = trunc i64 %indvars.iv.next58 to i32
  %xtraiter52 = and i32 %89, 3
  %lcmp.mod53 = icmp eq i32 %xtraiter52, 0
  br i1 %lcmp.mod53, label %.lr.ph..prol.loopexit51_crit_edge, label %.prol.preheader50.preheader

.lr.ph..prol.loopexit51_crit_edge:                ; preds = %.lr.ph
  %pgocount13 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 8)
  %90 = add i64 %pgocount13, 1
  store i64 %90, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 8)
  br label %.prol.loopexit51

.prol.preheader50.preheader:                      ; preds = %.lr.ph
  br label %.prol.preheader50

.prol.preheader50:                                ; preds = %.prol.preheader50..prol.preheader50_crit_edge, %.prol.preheader50.preheader
  %indvars.iv45.prol = phi i64 [ %indvars.iv.next46.prol, %.prol.preheader50..prol.preheader50_crit_edge ], [ 0, %.prol.preheader50.preheader ]
  %prol.iter54 = phi i32 [ %prol.iter54.sub, %.prol.preheader50..prol.preheader50_crit_edge ], [ %xtraiter52, %.prol.preheader50.preheader ]
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv57, i64 %indvars.iv45.prol
  %92 = load double, double* %91, align 8
  %93 = fmul double %92, %3
  store double %93, double* %91, align 8
  %indvars.iv.next46.prol = add nuw nsw i64 %indvars.iv45.prol, 1
  %prol.iter54.sub = add i32 %prol.iter54, -1
  %prol.iter54.cmp = icmp eq i32 %prol.iter54.sub, 0
  br i1 %prol.iter54.cmp, label %.prol.loopexit51.loopexit, label %.prol.preheader50..prol.preheader50_crit_edge, !llvm.loop !8

.prol.preheader50..prol.preheader50_crit_edge:    ; preds = %.prol.preheader50
  %pgocount14 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 4)
  %94 = add i64 %pgocount14, 1
  store i64 %94, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 4)
  br label %.prol.preheader50

.prol.loopexit51.loopexit:                        ; preds = %.prol.preheader50
  %pgocount15 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 15)
  %95 = add i64 %pgocount15, 1
  store i64 %95, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 15)
  br label %.prol.loopexit51

.prol.loopexit51:                                 ; preds = %.lr.ph..prol.loopexit51_crit_edge, %.prol.loopexit51.loopexit
  %indvars.iv45.unr = phi i64 [ 0, %.lr.ph..prol.loopexit51_crit_edge ], [ %indvars.iv.next46.prol, %.prol.loopexit51.loopexit ]
  %96 = icmp ult i64 %indvars.iv57, 3
  br i1 %96, label %.preheader3, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit51
  %pgocount16 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 16)
  %97 = add i64 %pgocount16, 1
  store i64 %97, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 16)
  %98 = sub i64 %88, %indvars.iv45.unr
  %99 = lshr i64 %98, 2
  %100 = add nuw nsw i64 %99, 1
  %min.iters.check = icmp ult i64 %100, 2
  br i1 %min.iters.check, label %.lr.ph.new.preheader96, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph.new.preheader
  %pgocount17 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 20)
  %101 = add i64 %pgocount17, 1
  store i64 %101, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 20)
  %n.mod.vf = and i64 %100, 1
  %n.vec = sub nsw i64 %100, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %102 = add i64 %indvars.iv45.unr, 4
  %103 = shl nuw i64 %99, 2
  %104 = add i64 %102, %103
  %105 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %104, %105
  br i1 %cmp.zero, label %.lr.ph.new.preheader96, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %106 = shl i64 %index, 2
  %107 = add i64 %indvars.iv45.unr, %106
  %108 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv57, i64 %107
  %109 = bitcast double* %108 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %109, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec64 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec65 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec66 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %110 = fmul <2 x double> %strided.vec, %broadcast.splat68
  %111 = fmul <2 x double> %strided.vec64, %broadcast.splat68
  %112 = fmul <2 x double> %strided.vec65, %broadcast.splat68
  %113 = add nsw i64 %107, 3
  %114 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv57, i64 %113
  %115 = fmul <2 x double> %strided.vec66, %broadcast.splat68
  %116 = getelementptr double, double* %114, i64 -3
  %117 = bitcast double* %116 to <8 x double>*
  %118 = shufflevector <2 x double> %110, <2 x double> %111, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %119 = shufflevector <2 x double> %112, <2 x double> %115, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %118, <4 x double> %119, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %117, align 8
  %index.next = add i64 %index, 2
  %120 = icmp eq i64 %index.next, %n.vec
  br i1 %120, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !9

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  %pgocount18 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 7)
  %121 = add i64 %pgocount18, 1
  store i64 %121, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 7)
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %pgocount19 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 21)
  %122 = add i64 %pgocount19, 1
  store i64 %122, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 21)
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.preheader3, label %.lr.ph.new.preheader96

.lr.ph.new.preheader96:                           ; preds = %middle.block, %min.iters.checked, %.lr.ph.new.preheader
  %indvars.iv45.ph = phi i64 [ %indvars.iv45.unr, %min.iters.checked ], [ %indvars.iv45.unr, %.lr.ph.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new..lr.ph.new_crit_edge, %.lr.ph.new.preheader96
  %indvars.iv45 = phi i64 [ %indvars.iv.next46.3, %.lr.ph.new..lr.ph.new_crit_edge ], [ %indvars.iv45.ph, %.lr.ph.new.preheader96 ]
  %123 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv57, i64 %indvars.iv45
  %124 = load double, double* %123, align 8
  %125 = fmul double %124, %3
  store double %125, double* %123, align 8
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %126 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv57, i64 %indvars.iv.next46
  %127 = load double, double* %126, align 8
  %128 = fmul double %127, %3
  store double %128, double* %126, align 8
  %indvars.iv.next46.1 = add nsw i64 %indvars.iv45, 2
  %129 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv57, i64 %indvars.iv.next46.1
  %130 = load double, double* %129, align 8
  %131 = fmul double %130, %3
  store double %131, double* %129, align 8
  %indvars.iv.next46.2 = add nsw i64 %indvars.iv45, 3
  %132 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv57, i64 %indvars.iv.next46.2
  %133 = load double, double* %132, align 8
  %134 = fmul double %133, %3
  store double %134, double* %132, align 8
  %indvars.iv.next46.3 = add nsw i64 %indvars.iv45, 4
  %exitcond49.3 = icmp eq i64 %indvars.iv.next46.3, %indvars.iv55
  br i1 %exitcond49.3, label %.preheader3.loopexit, label %.lr.ph.new..lr.ph.new_crit_edge, !llvm.loop !10

.lr.ph.new..lr.ph.new_crit_edge:                  ; preds = %.lr.ph.new
  %pgocount20 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 5)
  %135 = add i64 %pgocount20, 1
  store i64 %135, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 5)
  br label %.lr.ph.new

.preheader3.loopexit:                             ; preds = %.lr.ph.new
  %pgocount21 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 17)
  %136 = add i64 %pgocount21, 1
  store i64 %136, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 17)
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3.loopexit, %middle.block, %.prol.loopexit51
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next58, %wide.trip.count59
  br i1 %exitcond60, label %._crit_edge13.loopexit97, label %.lr.ph

._crit_edge13.loopexit:                           ; preds = %._crit_edge9.us
  %pgocount22 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 23)
  %137 = add i64 %pgocount22, 1
  store i64 %137, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 23)
  br label %._crit_edge13

._crit_edge13.loopexit97:                         ; preds = %.preheader3
  %pgocount23 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 24)
  %138 = add i64 %pgocount23, 1
  store i64 %138, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 24)
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit97, %._crit_edge13.loopexit, %6
  %pgocount24 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 22)
  %139 = add i64 %pgocount24, 1
  store i64 %139, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 22)
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
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.unroll.disable"}
!7 = distinct !{!7, !3, !4}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !3, !4}
!10 = distinct !{!10, !2, !3, !4}
