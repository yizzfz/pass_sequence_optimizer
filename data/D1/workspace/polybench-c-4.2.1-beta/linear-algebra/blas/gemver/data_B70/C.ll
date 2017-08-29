; ModuleID = 'B.ll'
source_filename = "gemver.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_gemver = private constant [18 x i8] c"B.ll:kernel_gemver"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 32414643582, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 77261525566, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_gemver = private global [31 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_gemver = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1410264607072615041, i64 348959062499, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i32 0, i32 0), i8* null, i8* null, i32 31, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 49239513432, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [58 x i8] c"8\00main\01B.ll:init_array\01B.ll:kernel_gemver\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_gemver to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([58 x i8], [58 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %8 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %9 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %10 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %11 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %12 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %13 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %14 = bitcast i8* %5 to [2000 x double]*
  %15 = bitcast i8* %6 to double*
  %16 = bitcast i8* %7 to double*
  %17 = bitcast i8* %8 to double*
  %18 = bitcast i8* %9 to double*
  %19 = bitcast i8* %10 to double*
  %20 = bitcast i8* %11 to double*
  %21 = bitcast i8* %12 to double*
  %22 = bitcast i8* %13 to double*
  call fastcc void @init_array(i32 2000, double* nonnull %3, double* nonnull %4, [2000 x double]* %14, double* %15, double* %16, double* %17, double* %18, double* %19, double* %20, double* %21, double* %22)
  tail call void (...) @polybench_timer_start() #4
  %23 = load double, double* %3, align 8
  %24 = load double, double* %4, align 8
  tail call fastcc void @kernel_gemver(i32 2000, double %23, double %24, [2000 x double]* %14, double* %15, double* %16, double* %17, double* %18, double* %19, double* %20, double* %21, double* %22)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %25 = icmp sgt i32 %0, 42
  br i1 %25, label %26, label %32

; <label>:26:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %27 = add i64 %pgocount, 1
  store i64 %27, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %28 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %28, align 1
  %29 = icmp eq i8 %strcmpload, 0
  br i1 %29, label %30, label %32

; <label>:30:                                     ; preds = %26
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %31 = add i64 %pgocount1, 1
  store i64 %31, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  tail call fastcc void @print_array(i32 2000, double* %19)
  br label %32

; <label>:32:                                     ; preds = %30, %26, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %33 = add i64 %pgocount2, 1
  store i64 %33, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  tail call void @free(i8* %8) #4
  tail call void @free(i8* %9) #4
  tail call void @free(i8* %10) #4
  tail call void @free(i8* %11) #4
  tail call void @free(i8* %12) #4
  tail call void @free(i8* %13) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double* nocapture, double* nocapture, [2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %1, align 8
  store double 1.200000e+00, double* %2, align 8
  %13 = sitofp i32 %0 to double
  %14 = icmp sgt i32 %0, 0
  br i1 %14, label %.lr.ph4.split.us.preheader, label %._crit_edge

.lr.ph4.split.us.preheader:                       ; preds = %12
  %xtraiter = and i32 %0, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %15 = icmp eq i32 %0, 1
  %wide.trip.count7 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %0 to i64
  %16 = fdiv double 0.000000e+00, %13
  br label %.lr.ph4.split.us

.lr.ph4.split.us:                                 ; preds = %..loopexit_crit_edge.us, %.lr.ph4.split.us.preheader
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %..loopexit_crit_edge.us ], [ 0, %.lr.ph4.split.us.preheader ]
  %17 = trunc i64 %indvars.iv5 to i32
  %18 = sitofp i32 %17 to double
  %19 = getelementptr inbounds double, double* %4, i64 %indvars.iv5
  store double %18, double* %19, align 8
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %20 = trunc i64 %indvars.iv.next6 to i32
  %21 = sitofp i32 %20 to double
  %22 = fdiv double %21, %13
  %23 = fmul double %22, 5.000000e-01
  %24 = getelementptr inbounds double, double* %6, i64 %indvars.iv5
  store double %23, double* %24, align 8
  %25 = fmul double %22, 2.500000e-01
  %26 = getelementptr inbounds double, double* %5, i64 %indvars.iv5
  store double %25, double* %26, align 8
  %27 = fdiv double %22, 6.000000e+00
  %28 = getelementptr inbounds double, double* %7, i64 %indvars.iv5
  store double %27, double* %28, align 8
  %29 = fmul double %22, 1.250000e-01
  %30 = getelementptr inbounds double, double* %10, i64 %indvars.iv5
  store double %29, double* %30, align 8
  %31 = fdiv double %22, 9.000000e+00
  %32 = getelementptr inbounds double, double* %11, i64 %indvars.iv5
  store double %31, double* %32, align 8
  %33 = getelementptr inbounds double, double* %9, i64 %indvars.iv5
  store double 0.000000e+00, double* %33, align 8
  %34 = getelementptr inbounds double, double* %8, i64 %indvars.iv5
  store double 0.000000e+00, double* %34, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph4.split.us
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %35 = add i64 %pgocount, 1
  store i64 %35, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv5, i64 0
  store double %16, double* %36, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph4.split.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph4.split.us ]
  br i1 %15, label %.prol.loopexit...loopexit_crit_edge.us_crit_edge, label %.lr.ph4.split.us.new.preheader

.prol.loopexit...loopexit_crit_edge.us_crit_edge: ; preds = %.prol.loopexit
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %37 = add i64 %pgocount1, 1
  store i64 %37, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  br label %..loopexit_crit_edge.us

.lr.ph4.split.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.lr.ph4.split.us.new

.lr.ph4.split.us.new:                             ; preds = %.lr.ph4.split.us.new..lr.ph4.split.us.new_crit_edge, %.lr.ph4.split.us.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph4.split.us.new..lr.ph4.split.us.new_crit_edge ], [ %indvars.iv.unr.ph, %.lr.ph4.split.us.new.preheader ]
  %38 = mul nuw nsw i64 %indvars.iv, %indvars.iv5
  %39 = trunc i64 %38 to i32
  %40 = srem i32 %39, %0
  %41 = sitofp i32 %40 to double
  %42 = fdiv double %41, %13
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv5, i64 %indvars.iv
  store double %42, double* %43, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %44 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv5
  %45 = trunc i64 %44 to i32
  %46 = srem i32 %45, %0
  %47 = sitofp i32 %46 to double
  %48 = fdiv double %47, %13
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv5, i64 %indvars.iv.next
  store double %48, double* %49, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %..loopexit_crit_edge.us.loopexit, label %.lr.ph4.split.us.new..lr.ph4.split.us.new_crit_edge

.lr.ph4.split.us.new..lr.ph4.split.us.new_crit_edge: ; preds = %.lr.ph4.split.us.new
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %50 = add i64 %pgocount2, 1
  store i64 %50, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  br label %.lr.ph4.split.us.new

..loopexit_crit_edge.us.loopexit:                 ; preds = %.lr.ph4.split.us.new
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %51 = add i64 %pgocount3, 1
  store i64 %51, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  br label %..loopexit_crit_edge.us

..loopexit_crit_edge.us:                          ; preds = %.prol.loopexit...loopexit_crit_edge.us_crit_edge, %..loopexit_crit_edge.us.loopexit
  %exitcond = icmp eq i64 %indvars.iv.next6, %wide.trip.count7
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph4.split.us

._crit_edge.loopexit:                             ; preds = %..loopexit_crit_edge.us
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %52 = add i64 %pgocount4, 1
  store i64 %52, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %12
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %53 = add i64 %pgocount5, 1
  store i64 %53, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemver(i32, double, double, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture readonly, double* nocapture readonly, double* nocapture readonly, double* nocapture, double* nocapture, double* nocapture readonly, double* nocapture readonly) unnamed_addr #2 {
  %13 = icmp sgt i32 %0, 0
  br i1 %13, label %.preheader8.us.preheader, label %._crit_edge11

.preheader8.us.preheader:                         ; preds = %12
  %pgocount = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 21)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 21)
  %xtraiter49 = and i32 %0, 1
  %lcmp.mod50 = icmp eq i32 %xtraiter49, 0
  %15 = icmp eq i32 %0, 1
  %wide.trip.count53 = zext i32 %0 to i64
  %wide.trip.count45.1 = zext i32 %0 to i64
  %16 = add nsw i64 %wide.trip.count45.1, -2
  %17 = add nsw i64 %wide.trip.count45.1, -2
  %scevgep64 = getelementptr double, double* %5, i64 2
  %scevgep69 = getelementptr double, double* %7, i64 2
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %._crit_edge20.us, %.preheader8.us.preheader
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %._crit_edge20.us ], [ 0, %.preheader8.us.preheader ]
  %scevgep59 = getelementptr [2000 x double], [2000 x double]* %3, i64 %indvars.iv51, i64 2
  %18 = getelementptr inbounds double, double* %4, i64 %indvars.iv51
  %19 = getelementptr inbounds double, double* %6, i64 %indvars.iv51
  br i1 %lcmp.mod50, label %.prol.loopexit48, label %.prol.preheader47

.prol.preheader47:                                ; preds = %.preheader8.us
  %pgocount1 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 10)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 10)
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv51, i64 0
  %22 = load double, double* %21, align 8
  %23 = load double, double* %18, align 8
  %24 = load double, double* %5, align 8
  %25 = fmul double %23, %24
  %26 = fadd double %22, %25
  %27 = load double, double* %19, align 8
  %28 = load double, double* %7, align 8
  %29 = fmul double %27, %28
  %30 = fadd double %26, %29
  store double %30, double* %21, align 8
  br label %.prol.loopexit48

.prol.loopexit48:                                 ; preds = %.prol.preheader47, %.preheader8.us
  %indvars.iv43.unr.ph = phi i64 [ 1, %.prol.preheader47 ], [ 0, %.preheader8.us ]
  br i1 %15, label %.prol.loopexit48.._crit_edge20.us_crit_edge, label %.preheader8.us.new.preheader

.prol.loopexit48.._crit_edge20.us_crit_edge:      ; preds = %.prol.loopexit48
  %pgocount2 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 4)
  %31 = add i64 %pgocount2, 1
  store i64 %31, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 4)
  br label %._crit_edge20.us

.preheader8.us.new.preheader:                     ; preds = %.prol.loopexit48
  %pgocount3 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 11)
  %32 = add i64 %pgocount3, 1
  store i64 %32, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 11)
  %33 = sub nsw i64 %16, %indvars.iv43.unr.ph
  %34 = lshr i64 %33, 1
  %35 = add nuw i64 %34, 1
  %min.iters.check = icmp ult i64 %35, 2
  br i1 %min.iters.check, label %.preheader8.us.new.preheader137, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader8.us.new.preheader
  %pgocount4 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 15)
  %36 = add i64 %pgocount4, 1
  store i64 %36, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 15)
  %n.mod.vf = and i64 %35, 1
  %n.vec = sub i64 %35, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.preheader8.us.new.preheader137, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %pgocount5 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 18)
  %37 = add i64 %pgocount5, 1
  store i64 %37, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 18)
  %scevgep57 = getelementptr [2000 x double], [2000 x double]* %3, i64 %indvars.iv51, i64 %indvars.iv43.unr.ph
  %38 = sub nsw i64 %17, %indvars.iv43.unr.ph
  %39 = and i64 %38, -2
  %40 = or i64 %indvars.iv43.unr.ph, %39
  %scevgep60 = getelementptr double, double* %scevgep59, i64 %40
  %scevgep62 = getelementptr double, double* %5, i64 %indvars.iv43.unr.ph
  %scevgep65 = getelementptr double, double* %scevgep64, i64 %40
  %scevgep67 = getelementptr double, double* %7, i64 %indvars.iv43.unr.ph
  %scevgep70 = getelementptr double, double* %scevgep69, i64 %40
  %bound0 = icmp ult double* %scevgep57, %18
  %bound1 = icmp ult double* %18, %scevgep60
  %found.conflict = and i1 %bound0, %bound1
  %bound073 = icmp ult double* %scevgep57, %scevgep65
  %bound174 = icmp ult double* %scevgep62, %scevgep60
  %found.conflict75 = and i1 %bound073, %bound174
  %conflict.rdx = or i1 %found.conflict, %found.conflict75
  %bound078 = icmp ult double* %scevgep57, %19
  %bound179 = icmp ult double* %19, %scevgep60
  %found.conflict80 = and i1 %bound078, %bound179
  %conflict.rdx81 = or i1 %conflict.rdx, %found.conflict80
  %bound082 = icmp ult double* %scevgep57, %scevgep70
  %bound183 = icmp ult double* %scevgep67, %scevgep60
  %found.conflict84 = and i1 %bound082, %bound183
  %conflict.rdx85 = or i1 %conflict.rdx81, %found.conflict84
  %41 = or i64 %indvars.iv43.unr.ph, 2
  %42 = shl nuw i64 %34, 1
  %43 = add i64 %41, %42
  %44 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %43, %44
  br i1 %conflict.rdx85, label %.preheader8.us.new.preheader137, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %45 = load double, double* %18, align 8, !alias.scope !1
  %46 = insertelement <2 x double> undef, double %45, i32 0
  %47 = shufflevector <2 x double> %46, <2 x double> undef, <2 x i32> zeroinitializer
  %48 = load double, double* %19, align 8, !alias.scope !4
  %49 = insertelement <2 x double> undef, double %48, i32 0
  %50 = shufflevector <2 x double> %49, <2 x double> undef, <2 x i32> zeroinitializer
  %51 = load double, double* %18, align 8, !alias.scope !1
  %52 = insertelement <2 x double> undef, double %51, i32 0
  %53 = shufflevector <2 x double> %52, <2 x double> undef, <2 x i32> zeroinitializer
  %54 = load double, double* %19, align 8, !alias.scope !4
  %55 = insertelement <2 x double> undef, double %54, i32 0
  %56 = shufflevector <2 x double> %55, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %57 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv43.unr.ph, %57
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv51, i64 %offset.idx
  %59 = bitcast double* %58 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %59, align 8, !alias.scope !6, !noalias !8
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec86 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %60 = getelementptr inbounds double, double* %5, i64 %offset.idx
  %61 = bitcast double* %60 to <4 x double>*
  %wide.vec87 = load <4 x double>, <4 x double>* %61, align 8, !alias.scope !11
  %strided.vec88 = shufflevector <4 x double> %wide.vec87, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec89 = shufflevector <4 x double> %wide.vec87, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %62 = fmul <2 x double> %47, %strided.vec88
  %63 = fadd <2 x double> %strided.vec, %62
  %64 = getelementptr inbounds double, double* %7, i64 %offset.idx
  %65 = bitcast double* %64 to <4 x double>*
  %wide.vec90 = load <4 x double>, <4 x double>* %65, align 8, !alias.scope !12
  %strided.vec91 = shufflevector <4 x double> %wide.vec90, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec92 = shufflevector <4 x double> %wide.vec90, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %66 = fmul <2 x double> %50, %strided.vec91
  %67 = fadd <2 x double> %63, %66
  %68 = add nuw nsw i64 %offset.idx, 1
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv51, i64 %68
  %70 = fmul <2 x double> %53, %strided.vec89
  %71 = fadd <2 x double> %strided.vec86, %70
  %72 = fmul <2 x double> %56, %strided.vec92
  %73 = fadd <2 x double> %71, %72
  %74 = getelementptr double, double* %69, i64 -1
  %75 = bitcast double* %74 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %67, <2 x double> %73, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %75, align 8, !alias.scope !6, !noalias !8
  %index.next = add i64 %index, 2
  %76 = icmp eq i64 %index.next, %n.vec
  br i1 %76, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !13

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  %pgocount6 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 3)
  %77 = add i64 %pgocount6, 1
  store i64 %77, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 3)
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %pgocount7 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 19)
  %78 = add i64 %pgocount7, 1
  store i64 %78, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 19)
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge20.us, label %.preheader8.us.new.preheader137

.preheader8.us.new.preheader137:                  ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader8.us.new.preheader
  %indvars.iv43.ph = phi i64 [ %indvars.iv43.unr.ph, %vector.memcheck ], [ %indvars.iv43.unr.ph, %min.iters.checked ], [ %indvars.iv43.unr.ph, %.preheader8.us.new.preheader ], [ %ind.end, %middle.block ]
  br label %.preheader8.us.new

.preheader8.us.new:                               ; preds = %.preheader8.us.new..preheader8.us.new_crit_edge, %.preheader8.us.new.preheader137
  %indvars.iv43 = phi i64 [ %indvars.iv.next44.1, %.preheader8.us.new..preheader8.us.new_crit_edge ], [ %indvars.iv43.ph, %.preheader8.us.new.preheader137 ]
  %79 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv51, i64 %indvars.iv43
  %80 = load double, double* %79, align 8
  %81 = load double, double* %18, align 8
  %82 = getelementptr inbounds double, double* %5, i64 %indvars.iv43
  %83 = load double, double* %82, align 8
  %84 = fmul double %81, %83
  %85 = fadd double %80, %84
  %86 = load double, double* %19, align 8
  %87 = getelementptr inbounds double, double* %7, i64 %indvars.iv43
  %88 = load double, double* %87, align 8
  %89 = fmul double %86, %88
  %90 = fadd double %85, %89
  store double %90, double* %79, align 8
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv51, i64 %indvars.iv.next44
  %92 = load double, double* %91, align 8
  %93 = load double, double* %18, align 8
  %94 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next44
  %95 = load double, double* %94, align 8
  %96 = fmul double %93, %95
  %97 = fadd double %92, %96
  %98 = load double, double* %19, align 8
  %99 = getelementptr inbounds double, double* %7, i64 %indvars.iv.next44
  %100 = load double, double* %99, align 8
  %101 = fmul double %98, %100
  %102 = fadd double %97, %101
  store double %102, double* %91, align 8
  %indvars.iv.next44.1 = add nsw i64 %indvars.iv43, 2
  %exitcond46.1 = icmp eq i64 %indvars.iv.next44.1, %wide.trip.count45.1
  br i1 %exitcond46.1, label %._crit_edge20.us.loopexit, label %.preheader8.us.new..preheader8.us.new_crit_edge, !llvm.loop !16

.preheader8.us.new..preheader8.us.new_crit_edge:  ; preds = %.preheader8.us.new
  %pgocount8 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 0)
  %103 = add i64 %pgocount8, 1
  store i64 %103, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 0)
  br label %.preheader8.us.new

._crit_edge20.us.loopexit:                        ; preds = %.preheader8.us.new
  %pgocount9 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 12)
  %104 = add i64 %pgocount9, 1
  store i64 %104, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 12)
  br label %._crit_edge20.us

._crit_edge20.us:                                 ; preds = %.prol.loopexit48.._crit_edge20.us_crit_edge, %._crit_edge20.us.loopexit, %middle.block
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next52, %wide.trip.count53
  br i1 %exitcond54, label %.preheader7, label %.preheader8.us

.preheader7:                                      ; preds = %._crit_edge20.us
  %105 = icmp sgt i32 %0, 0
  br i1 %105, label %.preheader6.us.preheader, label %._crit_edge11

.preheader6.us.preheader:                         ; preds = %.preheader7
  %xtraiter37 = and i32 %0, 1
  %lcmp.mod38 = icmp eq i32 %xtraiter37, 0
  %106 = icmp eq i32 %0, 1
  %wide.trip.count41 = zext i32 %0 to i64
  %wide.trip.count33.1 = zext i32 %0 to i64
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %._crit_edge16.us, %.preheader6.us.preheader
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge16.us ], [ 0, %.preheader6.us.preheader ]
  %107 = getelementptr inbounds double, double* %9, i64 %indvars.iv39
  br i1 %lcmp.mod38, label %.prol.loopexit36, label %.prol.preheader35

.prol.preheader35:                                ; preds = %.preheader6.us
  %pgocount10 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 13)
  %108 = add i64 %pgocount10, 1
  store i64 %108, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 13)
  %109 = load double, double* %107, align 8
  %110 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 0, i64 %indvars.iv39
  %111 = load double, double* %110, align 8
  %112 = fmul double %111, %2
  %113 = load double, double* %10, align 8
  %114 = fmul double %112, %113
  %115 = fadd double %109, %114
  store double %115, double* %107, align 8
  br label %.prol.loopexit36

.prol.loopexit36:                                 ; preds = %.prol.preheader35, %.preheader6.us
  %indvars.iv31.unr.ph = phi i64 [ 1, %.prol.preheader35 ], [ 0, %.preheader6.us ]
  br i1 %106, label %.prol.loopexit36.._crit_edge16.us_crit_edge, label %.preheader6.us.new.preheader

.prol.loopexit36.._crit_edge16.us_crit_edge:      ; preds = %.prol.loopexit36
  %pgocount11 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 5)
  %116 = add i64 %pgocount11, 1
  store i64 %116, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 5)
  br label %._crit_edge16.us

.preheader6.us.new.preheader:                     ; preds = %.prol.loopexit36
  br label %.preheader6.us.new

.preheader6.us.new:                               ; preds = %.preheader6.us.new..preheader6.us.new_crit_edge, %.preheader6.us.new.preheader
  %indvars.iv31 = phi i64 [ %indvars.iv.next32.1, %.preheader6.us.new..preheader6.us.new_crit_edge ], [ %indvars.iv31.unr.ph, %.preheader6.us.new.preheader ]
  %117 = load double, double* %107, align 8
  %118 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv31, i64 %indvars.iv39
  %119 = load double, double* %118, align 8
  %120 = fmul double %119, %2
  %121 = getelementptr inbounds double, double* %10, i64 %indvars.iv31
  %122 = load double, double* %121, align 8
  %123 = fmul double %120, %122
  %124 = fadd double %117, %123
  store double %124, double* %107, align 8
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %125 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv.next32, i64 %indvars.iv39
  %126 = load double, double* %125, align 8
  %127 = fmul double %126, %2
  %128 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next32
  %129 = load double, double* %128, align 8
  %130 = fmul double %127, %129
  %131 = fadd double %124, %130
  store double %131, double* %107, align 8
  %indvars.iv.next32.1 = add nsw i64 %indvars.iv31, 2
  %exitcond34.1 = icmp eq i64 %indvars.iv.next32.1, %wide.trip.count33.1
  br i1 %exitcond34.1, label %._crit_edge16.us.loopexit, label %.preheader6.us.new..preheader6.us.new_crit_edge

.preheader6.us.new..preheader6.us.new_crit_edge:  ; preds = %.preheader6.us.new
  %pgocount12 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 1)
  %132 = add i64 %pgocount12, 1
  store i64 %132, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 1)
  br label %.preheader6.us.new

._crit_edge16.us.loopexit:                        ; preds = %.preheader6.us.new
  %pgocount13 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 14)
  %133 = add i64 %pgocount13, 1
  store i64 %133, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 14)
  br label %._crit_edge16.us

._crit_edge16.us:                                 ; preds = %.prol.loopexit36.._crit_edge16.us_crit_edge, %._crit_edge16.us.loopexit
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, %wide.trip.count41
  br i1 %exitcond42, label %.preheader5, label %.preheader6.us

.preheader5:                                      ; preds = %._crit_edge16.us
  %pgocount14 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 22)
  %134 = add i64 %pgocount14, 1
  store i64 %134, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 22)
  %135 = icmp sgt i32 %0, 0
  br i1 %135, label %.lr.ph13.preheader, label %._crit_edge11

.lr.ph13.preheader:                               ; preds = %.preheader5
  %pgocount15 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 23)
  %136 = add i64 %pgocount15, 1
  store i64 %136, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 23)
  %137 = add i32 %0, -1
  %xtraiter29 = and i32 %0, 3
  %lcmp.mod30 = icmp eq i32 %xtraiter29, 0
  br i1 %lcmp.mod30, label %.lr.ph13.prol.loopexit, label %.lr.ph13.prol.preheader

.lr.ph13.prol.preheader:                          ; preds = %.lr.ph13.preheader
  br label %.lr.ph13.prol

.lr.ph13.prol:                                    ; preds = %.lr.ph13.prol..lr.ph13.prol_crit_edge, %.lr.ph13.prol.preheader
  %indvars.iv25.prol = phi i64 [ %indvars.iv.next26.prol, %.lr.ph13.prol..lr.ph13.prol_crit_edge ], [ 0, %.lr.ph13.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph13.prol..lr.ph13.prol_crit_edge ], [ %xtraiter29, %.lr.ph13.prol.preheader ]
  %138 = getelementptr inbounds double, double* %9, i64 %indvars.iv25.prol
  %139 = load double, double* %138, align 8
  %140 = getelementptr inbounds double, double* %11, i64 %indvars.iv25.prol
  %141 = load double, double* %140, align 8
  %142 = fadd double %139, %141
  store double %142, double* %138, align 8
  %indvars.iv.next26.prol = add nuw nsw i64 %indvars.iv25.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph13.prol.loopexit.loopexit, label %.lr.ph13.prol..lr.ph13.prol_crit_edge, !llvm.loop !17

.lr.ph13.prol..lr.ph13.prol_crit_edge:            ; preds = %.lr.ph13.prol
  %pgocount16 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 6)
  %143 = add i64 %pgocount16, 1
  store i64 %143, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 6)
  br label %.lr.ph13.prol

.lr.ph13.prol.loopexit.loopexit:                  ; preds = %.lr.ph13.prol
  %pgocount17 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 25)
  %144 = add i64 %pgocount17, 1
  store i64 %144, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 25)
  br label %.lr.ph13.prol.loopexit

.lr.ph13.prol.loopexit:                           ; preds = %.lr.ph13.prol.loopexit.loopexit, %.lr.ph13.preheader
  %indvars.iv25.unr = phi i64 [ 0, %.lr.ph13.preheader ], [ %indvars.iv.next26.prol, %.lr.ph13.prol.loopexit.loopexit ]
  %145 = icmp ult i32 %137, 3
  br i1 %145, label %.preheader.us.preheader, label %.lr.ph13.preheader56

.lr.ph13.preheader56:                             ; preds = %.lr.ph13.prol.loopexit
  %pgocount18 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 26)
  %146 = add i64 %pgocount18, 1
  store i64 %146, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 26)
  %wide.trip.count27.3 = zext i32 %0 to i64
  %147 = add nsw i64 %wide.trip.count45.1, -4
  %148 = sub i64 %147, %indvars.iv25.unr
  %149 = lshr i64 %148, 2
  %150 = add nuw nsw i64 %149, 1
  %min.iters.check96 = icmp ult i64 %150, 2
  br i1 %min.iters.check96, label %.lr.ph13.preheader136, label %min.iters.checked97

.lr.ph13.preheader136:                            ; preds = %middle.block94, %vector.memcheck114, %min.iters.checked97, %.lr.ph13.preheader56
  %indvars.iv25.ph = phi i64 [ %indvars.iv25.unr, %vector.memcheck114 ], [ %indvars.iv25.unr, %min.iters.checked97 ], [ %indvars.iv25.unr, %.lr.ph13.preheader56 ], [ %ind.end119, %middle.block94 ]
  br label %.lr.ph13

min.iters.checked97:                              ; preds = %.lr.ph13.preheader56
  %pgocount19 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 28)
  %151 = add i64 %pgocount19, 1
  store i64 %151, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 28)
  %n.mod.vf98 = and i64 %150, 1
  %n.vec99 = sub nsw i64 %150, %n.mod.vf98
  %cmp.zero100 = icmp eq i64 %n.vec99, 0
  br i1 %cmp.zero100, label %.lr.ph13.preheader136, label %vector.memcheck114

vector.memcheck114:                               ; preds = %min.iters.checked97
  %pgocount20 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 29)
  %152 = add i64 %pgocount20, 1
  store i64 %152, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 29)
  %scevgep102 = getelementptr double, double* %9, i64 %indvars.iv25.unr
  %153 = add nsw i64 %wide.trip.count45.1, -4
  %154 = sub i64 %153, %indvars.iv25.unr
  %155 = and i64 %154, -4
  %156 = add i64 %indvars.iv25.unr, %155
  %157 = add i64 %156, 4
  %scevgep104 = getelementptr double, double* %9, i64 %157
  %scevgep106 = getelementptr double, double* %11, i64 %indvars.iv25.unr
  %scevgep108 = getelementptr double, double* %11, i64 %157
  %bound0110 = icmp ult double* %scevgep102, %scevgep108
  %bound1111 = icmp ult double* %scevgep106, %scevgep104
  %memcheck.conflict113 = and i1 %bound0110, %bound1111
  %158 = shl nuw i64 %149, 2
  %159 = add i64 %indvars.iv25.unr, %158
  %160 = add i64 %159, 4
  %161 = shl nuw nsw i64 %n.mod.vf98, 2
  %ind.end119 = sub i64 %160, %161
  br i1 %memcheck.conflict113, label %.lr.ph13.preheader136, label %vector.body93.preheader

vector.body93.preheader:                          ; preds = %vector.memcheck114
  br label %vector.body93

vector.body93:                                    ; preds = %vector.body93.vector.body93_crit_edge, %vector.body93.preheader
  %index116 = phi i64 [ %index.next117, %vector.body93.vector.body93_crit_edge ], [ 0, %vector.body93.preheader ]
  %162 = shl i64 %index116, 2
  %163 = add i64 %indvars.iv25.unr, %162
  %164 = getelementptr inbounds double, double* %9, i64 %163
  %165 = bitcast double* %164 to <8 x double>*
  %wide.vec125 = load <8 x double>, <8 x double>* %165, align 8, !alias.scope !19, !noalias !22
  %166 = getelementptr inbounds double, double* %11, i64 %163
  %167 = bitcast double* %166 to <8 x double>*
  %wide.vec130 = load <8 x double>, <8 x double>* %167, align 8, !alias.scope !22
  %168 = fadd <8 x double> %wide.vec125, %wide.vec130
  %169 = shufflevector <8 x double> %168, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %170 = fadd <8 x double> %wide.vec125, %wide.vec130
  %171 = shufflevector <8 x double> %170, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %172 = fadd <8 x double> %wide.vec125, %wide.vec130
  %173 = shufflevector <8 x double> %172, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %174 = add nsw i64 %163, 3
  %175 = getelementptr inbounds double, double* %9, i64 %174
  %176 = fadd <8 x double> %wide.vec125, %wide.vec130
  %177 = shufflevector <8 x double> %176, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %178 = getelementptr double, double* %175, i64 -3
  %179 = bitcast double* %178 to <8 x double>*
  %180 = shufflevector <2 x double> %169, <2 x double> %171, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %181 = shufflevector <2 x double> %173, <2 x double> %177, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec135 = shufflevector <4 x double> %180, <4 x double> %181, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec135, <8 x double>* %179, align 8, !alias.scope !19, !noalias !22
  %index.next117 = add i64 %index116, 2
  %182 = icmp eq i64 %index.next117, %n.vec99
  br i1 %182, label %middle.block94, label %vector.body93.vector.body93_crit_edge, !llvm.loop !24

vector.body93.vector.body93_crit_edge:            ; preds = %vector.body93
  %pgocount21 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 9)
  %183 = add i64 %pgocount21, 1
  store i64 %183, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 9)
  br label %vector.body93

middle.block94:                                   ; preds = %vector.body93
  %pgocount22 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 30)
  %184 = add i64 %pgocount22, 1
  store i64 %184, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 30)
  %cmp.n120 = icmp eq i64 %n.mod.vf98, 0
  br i1 %cmp.n120, label %.preheader4, label %.lr.ph13.preheader136

.preheader4.loopexit:                             ; preds = %.lr.ph13
  %pgocount23 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 27)
  %185 = add i64 %pgocount23, 1
  store i64 %185, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 27)
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.loopexit, %middle.block94
  %186 = icmp sgt i32 %0, 0
  br i1 %186, label %.preheader.us.preheader, label %._crit_edge11

.preheader.us.preheader:                          ; preds = %.preheader4, %.lr.ph13.prol.loopexit
  %xtraiter = and i32 %0, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %187 = icmp eq i32 %0, 1
  %wide.trip.count24 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %188 = getelementptr inbounds double, double* %8, i64 %indvars.iv22
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  %pgocount24 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 16)
  %189 = add i64 %pgocount24, 1
  store i64 %189, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 16)
  %190 = load double, double* %188, align 8
  %191 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv22, i64 0
  %192 = load double, double* %191, align 8
  %193 = fmul double %192, %1
  %194 = load double, double* %9, align 8
  %195 = fmul double %193, %194
  %196 = fadd double %190, %195
  store double %196, double* %188, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us ]
  br i1 %187, label %.prol.loopexit.._crit_edge.us_crit_edge, label %.preheader.us.new.preheader

.prol.loopexit.._crit_edge.us_crit_edge:          ; preds = %.prol.loopexit
  %pgocount25 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 8)
  %197 = add i64 %pgocount25, 1
  store i64 %197, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 8)
  br label %._crit_edge.us

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new..preheader.us.new_crit_edge, %.preheader.us.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new..preheader.us.new_crit_edge ], [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ]
  %198 = load double, double* %188, align 8
  %199 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv22, i64 %indvars.iv
  %200 = load double, double* %199, align 8
  %201 = fmul double %200, %1
  %202 = getelementptr inbounds double, double* %9, i64 %indvars.iv
  %203 = load double, double* %202, align 8
  %204 = fmul double %201, %203
  %205 = fadd double %198, %204
  store double %205, double* %188, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %206 = getelementptr inbounds [2000 x double], [2000 x double]* %3, i64 %indvars.iv22, i64 %indvars.iv.next
  %207 = load double, double* %206, align 8
  %208 = fmul double %207, %1
  %209 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next
  %210 = load double, double* %209, align 8
  %211 = fmul double %208, %210
  %212 = fadd double %205, %211
  store double %212, double* %188, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader.us.new..preheader.us.new_crit_edge

.preheader.us.new..preheader.us.new_crit_edge:    ; preds = %.preheader.us.new
  %pgocount26 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 2)
  %213 = add i64 %pgocount26, 1
  store i64 %213, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 2)
  br label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  %pgocount27 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 17)
  %214 = add i64 %pgocount27, 1
  store i64 %214, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 17)
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.prol.loopexit.._crit_edge.us_crit_edge, %._crit_edge.us.loopexit
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond = icmp eq i64 %indvars.iv.next23, %wide.trip.count24
  br i1 %exitcond, label %._crit_edge11.loopexit, label %.preheader.us

.lr.ph13:                                         ; preds = %.lr.ph13..lr.ph13_crit_edge, %.lr.ph13.preheader136
  %indvars.iv25 = phi i64 [ %indvars.iv.next26.3, %.lr.ph13..lr.ph13_crit_edge ], [ %indvars.iv25.ph, %.lr.ph13.preheader136 ]
  %215 = getelementptr inbounds double, double* %9, i64 %indvars.iv25
  %216 = load double, double* %215, align 8
  %217 = getelementptr inbounds double, double* %11, i64 %indvars.iv25
  %218 = load double, double* %217, align 8
  %219 = fadd double %216, %218
  store double %219, double* %215, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %220 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next26
  %221 = load double, double* %220, align 8
  %222 = getelementptr inbounds double, double* %11, i64 %indvars.iv.next26
  %223 = load double, double* %222, align 8
  %224 = fadd double %221, %223
  store double %224, double* %220, align 8
  %indvars.iv.next26.1 = add nsw i64 %indvars.iv25, 2
  %225 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next26.1
  %226 = load double, double* %225, align 8
  %227 = getelementptr inbounds double, double* %11, i64 %indvars.iv.next26.1
  %228 = load double, double* %227, align 8
  %229 = fadd double %226, %228
  store double %229, double* %225, align 8
  %indvars.iv.next26.2 = add nsw i64 %indvars.iv25, 3
  %230 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next26.2
  %231 = load double, double* %230, align 8
  %232 = getelementptr inbounds double, double* %11, i64 %indvars.iv.next26.2
  %233 = load double, double* %232, align 8
  %234 = fadd double %231, %233
  store double %234, double* %230, align 8
  %indvars.iv.next26.3 = add nsw i64 %indvars.iv25, 4
  %exitcond28.3 = icmp eq i64 %indvars.iv.next26.3, %wide.trip.count27.3
  br i1 %exitcond28.3, label %.preheader4.loopexit, label %.lr.ph13..lr.ph13_crit_edge, !llvm.loop !25

.lr.ph13..lr.ph13_crit_edge:                      ; preds = %.lr.ph13
  %pgocount28 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 7)
  %235 = add i64 %pgocount28, 1
  store i64 %235, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 7)
  br label %.lr.ph13

._crit_edge11.loopexit:                           ; preds = %._crit_edge.us
  %pgocount29 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 24)
  %236 = add i64 %pgocount29, 1
  store i64 %236, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 24)
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %.preheader4, %.preheader5, %.preheader7, %12
  %pgocount30 = load i64, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 20)
  %237 = add i64 %pgocount30, 1
  store i64 %237, i64* getelementptr inbounds ([31 x i64], [31 x i64]* @__profc_B.ll_kernel_gemver, i64 0, i64 20)
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %15, %.lr.ph.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %15 ], [ 0, %.lr.ph.preheader ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %12, label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %.lr.ph
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  br label %15

; <label>:12:                                     ; preds = %.lr.ph
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %13 = add i64 %pgocount1, 1
  store i64 %13, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %15

; <label>:15:                                     ; preds = %.lr.ph._crit_edge, %12
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %15
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %20 = add i64 %pgocount2, 1
  store i64 %20, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %21 = add i64 %pgocount3, 1
  store i64 %21, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = !{!7}
!7 = distinct !{!7, !3}
!8 = !{!2, !9, !5, !10}
!9 = distinct !{!9, !3}
!10 = distinct !{!10, !3}
!11 = !{!9}
!12 = !{!10}
!13 = distinct !{!13, !14, !15}
!14 = !{!"llvm.loop.vectorize.width", i32 1}
!15 = !{!"llvm.loop.interleave.count", i32 1}
!16 = distinct !{!16, !14, !15}
!17 = distinct !{!17, !18}
!18 = !{!"llvm.loop.unroll.disable"}
!19 = !{!20}
!20 = distinct !{!20, !21}
!21 = distinct !{!21, !"LVerDomain"}
!22 = !{!23}
!23 = distinct !{!23, !21}
!24 = distinct !{!24, !14, !15}
!25 = distinct !{!25, !14, !15}
