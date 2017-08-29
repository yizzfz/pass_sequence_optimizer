; ModuleID = 'B.ll'
source_filename = "covariance.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"cov\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_covariance = private constant [22 x i8] c"B.ll:kernel_covariance"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 32414643582, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 36170296450, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_covariance = private global [41 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_covariance = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -854660213397515841, i64 497149037787, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i32 0, i32 0), i8* null, i8* null, i32 41, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 63976198547, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [62 x i8] c"<\00main\01B.ll:init_array\01B.ll:kernel_covariance\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_covariance to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([62 x i8], [62 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(i32 1400, double* nonnull %3, [1200 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @kernel_covariance(i32 1200, i32 1400, double %8, [1200 x double]* %7, [1200 x double]* %9, double* %10)
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
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %9)
  br label %18

; <label>:18:                                     ; preds = %16, %12, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %19 = add i64 %pgocount2, 1
  store i64 %19, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  %4 = sitofp i32 %0 to double
  store double %4, double* %1, align 8
  br label %.preheader

.preheader:                                       ; preds = %19, %3
  %indvars.iv4 = phi i64 [ 0, %3 ], [ %indvars.iv.next5, %19 ]
  %5 = trunc i64 %indvars.iv4 to i32
  %6 = sitofp i32 %5 to double
  br label %7

; <label>:7:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = sitofp i32 %8 to double
  %10 = fmul double %6, %9
  %11 = fdiv double %10, 1.200000e+03
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv4, i64 %indvars.iv
  store double %11, double* %12, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %13 = trunc i64 %indvars.iv.next to i32
  %14 = sitofp i32 %13 to double
  %15 = fmul double %6, %14
  %16 = fdiv double %15, 1.200000e+03
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv4, i64 %indvars.iv.next
  store double %16, double* %17, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %19, label %._crit_edge

._crit_edge:                                      ; preds = %7
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  br label %7

; <label>:19:                                     ; preds = %7
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond = icmp eq i64 %indvars.iv.next5, 1400
  br i1 %exitcond, label %21, label %.preheader

; <label>:21:                                     ; preds = %19
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %22 = add i64 %pgocount2, 1
  store i64 %22, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_covariance(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture) unnamed_addr #2 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph30, label %.preheader7

.lr.ph30:                                         ; preds = %6
  %8 = icmp sgt i32 %1, 0
  br i1 %8, label %.lr.ph30.split.us.preheader, label %.lr.ph30.split.preheader

.lr.ph30.split.preheader:                         ; preds = %.lr.ph30
  %pgocount = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 34)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 34)
  %10 = add i32 %0, -1
  %xtraiter88 = and i32 %0, 3
  %lcmp.mod89 = icmp eq i32 %xtraiter88, 0
  br i1 %lcmp.mod89, label %.lr.ph30.split.prol.loopexit, label %.lr.ph30.split.prol.preheader

.lr.ph30.split.prol.preheader:                    ; preds = %.lr.ph30.split.preheader
  %11 = fdiv double 0.000000e+00, %2
  br label %.lr.ph30.split.prol

.lr.ph30.split.prol:                              ; preds = %.lr.ph30.split.prol..lr.ph30.split.prol_crit_edge, %.lr.ph30.split.prol.preheader
  %indvars.iv84.prol = phi i64 [ %indvars.iv.next85.prol, %.lr.ph30.split.prol..lr.ph30.split.prol_crit_edge ], [ 0, %.lr.ph30.split.prol.preheader ]
  %prol.iter90 = phi i32 [ %prol.iter90.sub, %.lr.ph30.split.prol..lr.ph30.split.prol_crit_edge ], [ %xtraiter88, %.lr.ph30.split.prol.preheader ]
  %12 = getelementptr inbounds double, double* %5, i64 %indvars.iv84.prol
  store double %11, double* %12, align 8
  %indvars.iv.next85.prol = add nuw nsw i64 %indvars.iv84.prol, 1
  %prol.iter90.sub = add i32 %prol.iter90, -1
  %prol.iter90.cmp = icmp eq i32 %prol.iter90.sub, 0
  br i1 %prol.iter90.cmp, label %.lr.ph30.split.prol.loopexit.loopexit, label %.lr.ph30.split.prol..lr.ph30.split.prol_crit_edge, !llvm.loop !1

.lr.ph30.split.prol..lr.ph30.split.prol_crit_edge: ; preds = %.lr.ph30.split.prol
  %pgocount1 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 10)
  %13 = add i64 %pgocount1, 1
  store i64 %13, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 10)
  br label %.lr.ph30.split.prol

.lr.ph30.split.prol.loopexit.loopexit:            ; preds = %.lr.ph30.split.prol
  %pgocount2 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 36)
  %14 = add i64 %pgocount2, 1
  store i64 %14, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 36)
  br label %.lr.ph30.split.prol.loopexit

.lr.ph30.split.prol.loopexit:                     ; preds = %.lr.ph30.split.prol.loopexit.loopexit, %.lr.ph30.split.preheader
  %indvars.iv84.unr = phi i64 [ 0, %.lr.ph30.split.preheader ], [ %indvars.iv.next85.prol, %.lr.ph30.split.prol.loopexit.loopexit ]
  %15 = icmp ult i32 %10, 3
  br i1 %15, label %.preheader7, label %.lr.ph30.split.preheader93

.lr.ph30.split.preheader93:                       ; preds = %.lr.ph30.split.prol.loopexit
  %pgocount3 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 37)
  %16 = add i64 %pgocount3, 1
  store i64 %16, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 37)
  %17 = fdiv double 0.000000e+00, %2
  %18 = fdiv double 0.000000e+00, %2
  %19 = fdiv double 0.000000e+00, %2
  %20 = fdiv double 0.000000e+00, %2
  %wide.trip.count86.3 = zext i32 %0 to i64
  %21 = add nsw i64 %wide.trip.count86.3, -4
  %22 = sub i64 %21, %indvars.iv84.unr
  %23 = lshr i64 %22, 2
  %24 = add nuw nsw i64 %23, 1
  %min.iters.check = icmp ult i64 %24, 4
  br i1 %min.iters.check, label %.lr.ph30.split.preheader147, label %min.iters.checked

.lr.ph30.split.preheader147:                      ; preds = %middle.block, %min.iters.checked, %.lr.ph30.split.preheader93
  %indvars.iv84.ph = phi i64 [ %indvars.iv84.unr, %min.iters.checked ], [ %indvars.iv84.unr, %.lr.ph30.split.preheader93 ], [ %ind.end, %middle.block ]
  br label %.lr.ph30.split

min.iters.checked:                                ; preds = %.lr.ph30.split.preheader93
  %pgocount4 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 39)
  %25 = add i64 %pgocount4, 1
  store i64 %25, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 39)
  %n.mod.vf = and i64 %24, 3
  %n.vec = sub nsw i64 %24, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %26 = shl nuw i64 %23, 2
  %27 = add i64 %indvars.iv84.unr, %26
  %28 = add i64 %27, 4
  %29 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %28, %29
  br i1 %cmp.zero, label %.lr.ph30.split.preheader147, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert98 = insertelement <2 x double> undef, double %17, i32 0
  %broadcast.splat99 = shufflevector <2 x double> %broadcast.splatinsert98, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert100 = insertelement <2 x double> undef, double %18, i32 0
  %broadcast.splat101 = shufflevector <2 x double> %broadcast.splatinsert100, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert102 = insertelement <2 x double> undef, double %19, i32 0
  %broadcast.splat103 = shufflevector <2 x double> %broadcast.splatinsert102, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert104 = insertelement <2 x double> undef, double %20, i32 0
  %broadcast.splat105 = shufflevector <2 x double> %broadcast.splatinsert104, <2 x double> undef, <2 x i32> zeroinitializer
  %30 = shufflevector <2 x double> %broadcast.splat99, <2 x double> %broadcast.splat101, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %31 = shufflevector <2 x double> %broadcast.splat103, <2 x double> %broadcast.splat105, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %30, <4 x double> %31, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %32 = shl i64 %index, 2
  %offset.idx = add i64 %indvars.iv84.unr, %32
  %33 = add i64 %indvars.iv84.unr, %32
  %34 = add nsw i64 %33, 3
  %35 = add i64 %offset.idx, 11
  %36 = getelementptr inbounds double, double* %5, i64 %34
  %37 = getelementptr inbounds double, double* %5, i64 %35
  %38 = getelementptr double, double* %36, i64 -3
  %39 = bitcast double* %38 to <8 x double>*
  %40 = getelementptr double, double* %37, i64 -3
  %41 = bitcast double* %40 to <8 x double>*
  store <8 x double> %interleaved.vec, <8 x double>* %39, align 8
  store <8 x double> %interleaved.vec, <8 x double>* %41, align 8
  %index.next = add i64 %index, 4
  %42 = icmp eq i64 %index.next, %n.vec
  br i1 %42, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !3

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  %pgocount5 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 13)
  %43 = add i64 %pgocount5, 1
  store i64 %43, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 13)
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %pgocount6 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 40)
  %44 = add i64 %pgocount6, 1
  store i64 %44, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 40)
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.preheader7, label %.lr.ph30.split.preheader147

.lr.ph30.split.us.preheader:                      ; preds = %.lr.ph30
  %45 = add i32 %1, -1
  %xtraiter77 = and i32 %1, 3
  %lcmp.mod78 = icmp eq i32 %xtraiter77, 0
  %46 = icmp ult i32 %45, 3
  %wide.trip.count82 = zext i32 %0 to i64
  %wide.trip.count73.3 = zext i32 %1 to i64
  br label %.lr.ph30.split.us

.lr.ph30.split.us:                                ; preds = %._crit_edge27.us, %.lr.ph30.split.us.preheader
  %indvars.iv80 = phi i64 [ 0, %.lr.ph30.split.us.preheader ], [ %indvars.iv.next81, %._crit_edge27.us ]
  %47 = getelementptr inbounds double, double* %5, i64 %indvars.iv80
  store double 0.000000e+00, double* %47, align 8
  br i1 %lcmp.mod78, label %.lr.ph30.split.us..prol.loopexit76_crit_edge, label %.prol.preheader75.preheader

.lr.ph30.split.us..prol.loopexit76_crit_edge:     ; preds = %.lr.ph30.split.us
  %pgocount7 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 8)
  %48 = add i64 %pgocount7, 1
  store i64 %48, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 8)
  br label %.prol.loopexit76

.prol.preheader75.preheader:                      ; preds = %.lr.ph30.split.us
  br label %.prol.preheader75

.prol.preheader75:                                ; preds = %.prol.preheader75..prol.preheader75_crit_edge, %.prol.preheader75.preheader
  %indvars.iv71.prol = phi i64 [ %indvars.iv.next72.prol, %.prol.preheader75..prol.preheader75_crit_edge ], [ 0, %.prol.preheader75.preheader ]
  %prol.iter79 = phi i32 [ %prol.iter79.sub, %.prol.preheader75..prol.preheader75_crit_edge ], [ %xtraiter77, %.prol.preheader75.preheader ]
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv71.prol, i64 %indvars.iv80
  %50 = load double, double* %49, align 8
  %51 = load double, double* %47, align 8
  %52 = fadd double %50, %51
  store double %52, double* %47, align 8
  %indvars.iv.next72.prol = add nuw nsw i64 %indvars.iv71.prol, 1
  %prol.iter79.sub = add i32 %prol.iter79, -1
  %prol.iter79.cmp = icmp eq i32 %prol.iter79.sub, 0
  br i1 %prol.iter79.cmp, label %.prol.loopexit76.loopexit, label %.prol.preheader75..prol.preheader75_crit_edge, !llvm.loop !6

.prol.preheader75..prol.preheader75_crit_edge:    ; preds = %.prol.preheader75
  %pgocount8 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 1)
  %53 = add i64 %pgocount8, 1
  store i64 %53, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 1)
  br label %.prol.preheader75

.prol.loopexit76.loopexit:                        ; preds = %.prol.preheader75
  %pgocount9 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 17)
  %54 = add i64 %pgocount9, 1
  store i64 %54, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 17)
  br label %.prol.loopexit76

.prol.loopexit76:                                 ; preds = %.lr.ph30.split.us..prol.loopexit76_crit_edge, %.prol.loopexit76.loopexit
  %indvars.iv71.unr = phi i64 [ 0, %.lr.ph30.split.us..prol.loopexit76_crit_edge ], [ %indvars.iv.next72.prol, %.prol.loopexit76.loopexit ]
  br i1 %46, label %._crit_edge27.us, label %.lr.ph30.split.us.new.preheader

.lr.ph30.split.us.new.preheader:                  ; preds = %.prol.loopexit76
  br label %.lr.ph30.split.us.new

.lr.ph30.split.us.new:                            ; preds = %.lr.ph30.split.us.new..lr.ph30.split.us.new_crit_edge, %.lr.ph30.split.us.new.preheader
  %indvars.iv71 = phi i64 [ %indvars.iv.next72.3, %.lr.ph30.split.us.new..lr.ph30.split.us.new_crit_edge ], [ %indvars.iv71.unr, %.lr.ph30.split.us.new.preheader ]
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv71, i64 %indvars.iv80
  %56 = load double, double* %55, align 8
  %57 = load double, double* %47, align 8
  %58 = fadd double %56, %57
  store double %58, double* %47, align 8
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next72, i64 %indvars.iv80
  %60 = load double, double* %59, align 8
  %61 = fadd double %60, %58
  store double %61, double* %47, align 8
  %indvars.iv.next72.1 = add nsw i64 %indvars.iv71, 2
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next72.1, i64 %indvars.iv80
  %63 = load double, double* %62, align 8
  %64 = fadd double %63, %61
  store double %64, double* %47, align 8
  %indvars.iv.next72.2 = add nsw i64 %indvars.iv71, 3
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next72.2, i64 %indvars.iv80
  %66 = load double, double* %65, align 8
  %67 = fadd double %66, %64
  store double %67, double* %47, align 8
  %indvars.iv.next72.3 = add nsw i64 %indvars.iv71, 4
  %exitcond74.3 = icmp eq i64 %indvars.iv.next72.3, %wide.trip.count73.3
  br i1 %exitcond74.3, label %._crit_edge27.us.loopexit, label %.lr.ph30.split.us.new..lr.ph30.split.us.new_crit_edge

.lr.ph30.split.us.new..lr.ph30.split.us.new_crit_edge: ; preds = %.lr.ph30.split.us.new
  %pgocount10 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 3)
  %68 = add i64 %pgocount10, 1
  store i64 %68, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 3)
  br label %.lr.ph30.split.us.new

._crit_edge27.us.loopexit:                        ; preds = %.lr.ph30.split.us.new
  %pgocount11 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 19)
  %69 = add i64 %pgocount11, 1
  store i64 %69, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 19)
  br label %._crit_edge27.us

._crit_edge27.us:                                 ; preds = %._crit_edge27.us.loopexit, %.prol.loopexit76
  %70 = load double, double* %47, align 8
  %71 = fdiv double %70, %2
  store double %71, double* %47, align 8
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %exitcond83 = icmp eq i64 %indvars.iv.next81, %wide.trip.count82
  br i1 %exitcond83, label %.preheader7.loopexit, label %.lr.ph30.split.us

.preheader7.loopexit:                             ; preds = %._crit_edge27.us
  %pgocount12 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 31)
  %72 = add i64 %pgocount12, 1
  store i64 %72, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 31)
  br label %.preheader7

.preheader7.loopexit148:                          ; preds = %.lr.ph30.split
  %pgocount13 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 38)
  %73 = add i64 %pgocount13, 1
  store i64 %73, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 38)
  br label %.preheader7

.preheader7:                                      ; preds = %.preheader7.loopexit148, %.preheader7.loopexit, %middle.block, %.lr.ph30.split.prol.loopexit, %6
  %74 = icmp sgt i32 %1, 0
  br i1 %74, label %.preheader6.lr.ph, label %.preheader5

.preheader6.lr.ph:                                ; preds = %.preheader7
  %pgocount14 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 30)
  %75 = add i64 %pgocount14, 1
  store i64 %75, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 30)
  %76 = icmp sgt i32 %0, 0
  br i1 %76, label %.preheader6.us.preheader, label %._crit_edge13

.preheader6.us.preheader:                         ; preds = %.preheader6.lr.ph
  %77 = add i32 %0, -1
  %xtraiter64 = and i32 %0, 3
  %lcmp.mod65 = icmp eq i32 %xtraiter64, 0
  %78 = icmp ult i32 %77, 3
  %wide.trip.count68 = zext i32 %1 to i64
  %wide.trip.count60.3 = zext i32 %0 to i64
  %79 = add nsw i64 %wide.trip.count60.3, -4
  %80 = add nsw i64 %wide.trip.count60.3, -4
  %scevgep123 = getelementptr double, double* %5, i64 4
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %._crit_edge22.us, %.preheader6.us.preheader
  %indvars.iv66 = phi i64 [ 0, %.preheader6.us.preheader ], [ %indvars.iv.next67, %._crit_edge22.us ]
  %scevgep118 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv66, i64 4
  br i1 %lcmp.mod65, label %.preheader6.us..prol.loopexit63_crit_edge, label %.prol.preheader62.preheader

.preheader6.us..prol.loopexit63_crit_edge:        ; preds = %.preheader6.us
  %pgocount15 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 9)
  %81 = add i64 %pgocount15, 1
  store i64 %81, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 9)
  br label %.prol.loopexit63

.prol.preheader62.preheader:                      ; preds = %.preheader6.us
  br label %.prol.preheader62

.prol.preheader62:                                ; preds = %.prol.preheader62..prol.preheader62_crit_edge, %.prol.preheader62.preheader
  %indvars.iv58.prol = phi i64 [ %indvars.iv.next59.prol, %.prol.preheader62..prol.preheader62_crit_edge ], [ 0, %.prol.preheader62.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader62..prol.preheader62_crit_edge ], [ %xtraiter64, %.prol.preheader62.preheader ]
  %82 = getelementptr inbounds double, double* %5, i64 %indvars.iv58.prol
  %83 = load double, double* %82, align 8
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv66, i64 %indvars.iv58.prol
  %85 = load double, double* %84, align 8
  %86 = fsub double %85, %83
  store double %86, double* %84, align 8
  %indvars.iv.next59.prol = add nuw nsw i64 %indvars.iv58.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit63.loopexit, label %.prol.preheader62..prol.preheader62_crit_edge, !llvm.loop !7

.prol.preheader62..prol.preheader62_crit_edge:    ; preds = %.prol.preheader62
  %pgocount16 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 2)
  %87 = add i64 %pgocount16, 1
  store i64 %87, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 2)
  br label %.prol.preheader62

.prol.loopexit63.loopexit:                        ; preds = %.prol.preheader62
  %pgocount17 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 18)
  %88 = add i64 %pgocount17, 1
  store i64 %88, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 18)
  br label %.prol.loopexit63

.prol.loopexit63:                                 ; preds = %.preheader6.us..prol.loopexit63_crit_edge, %.prol.loopexit63.loopexit
  %indvars.iv58.unr = phi i64 [ 0, %.preheader6.us..prol.loopexit63_crit_edge ], [ %indvars.iv.next59.prol, %.prol.loopexit63.loopexit ]
  br i1 %78, label %._crit_edge22.us, label %.preheader6.us.new.preheader

.preheader6.us.new.preheader:                     ; preds = %.prol.loopexit63
  %pgocount18 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 20)
  %89 = add i64 %pgocount18, 1
  store i64 %89, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 20)
  %90 = sub i64 %79, %indvars.iv58.unr
  %91 = lshr i64 %90, 2
  %92 = add nuw nsw i64 %91, 1
  %min.iters.check110 = icmp ult i64 %92, 2
  br i1 %min.iters.check110, label %.preheader6.us.new.preheader146, label %min.iters.checked111

min.iters.checked111:                             ; preds = %.preheader6.us.new.preheader
  %pgocount19 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 23)
  %93 = add i64 %pgocount19, 1
  store i64 %93, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 23)
  %n.mod.vf112 = and i64 %92, 1
  %n.vec113 = sub nsw i64 %92, %n.mod.vf112
  %cmp.zero114 = icmp eq i64 %n.vec113, 0
  br i1 %cmp.zero114, label %.preheader6.us.new.preheader146, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked111
  %pgocount20 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 26)
  %94 = add i64 %pgocount20, 1
  store i64 %94, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 26)
  %scevgep116 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv66, i64 %indvars.iv58.unr
  %95 = sub i64 %80, %indvars.iv58.unr
  %96 = and i64 %95, -4
  %97 = add i64 %indvars.iv58.unr, %96
  %scevgep119 = getelementptr double, double* %scevgep118, i64 %97
  %scevgep121 = getelementptr double, double* %5, i64 %indvars.iv58.unr
  %scevgep124 = getelementptr double, double* %scevgep123, i64 %97
  %bound0 = icmp ult double* %scevgep116, %scevgep124
  %bound1 = icmp ult double* %scevgep121, %scevgep119
  %memcheck.conflict = and i1 %bound0, %bound1
  %98 = add i64 %indvars.iv58.unr, 4
  %99 = shl nuw i64 %91, 2
  %100 = add i64 %98, %99
  %101 = shl nuw nsw i64 %n.mod.vf112, 2
  %ind.end130 = sub i64 %100, %101
  br i1 %memcheck.conflict, label %.preheader6.us.new.preheader146, label %vector.body107.preheader

vector.body107.preheader:                         ; preds = %vector.memcheck
  br label %vector.body107

vector.body107:                                   ; preds = %vector.body107.vector.body107_crit_edge, %vector.body107.preheader
  %index127 = phi i64 [ %index.next128, %vector.body107.vector.body107_crit_edge ], [ 0, %vector.body107.preheader ]
  %102 = shl i64 %index127, 2
  %103 = add i64 %indvars.iv58.unr, %102
  %104 = getelementptr inbounds double, double* %5, i64 %103
  %105 = bitcast double* %104 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %105, align 8, !alias.scope !8
  %106 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv66, i64 %103
  %107 = bitcast double* %106 to <8 x double>*
  %wide.vec139 = load <8 x double>, <8 x double>* %107, align 8, !alias.scope !11, !noalias !8
  %108 = fsub <8 x double> %wide.vec139, %wide.vec
  %109 = shufflevector <8 x double> %108, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %110 = fsub <8 x double> %wide.vec139, %wide.vec
  %111 = shufflevector <8 x double> %110, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %112 = fsub <8 x double> %wide.vec139, %wide.vec
  %113 = shufflevector <8 x double> %112, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %114 = add nsw i64 %103, 3
  %115 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv66, i64 %114
  %116 = fsub <8 x double> %wide.vec139, %wide.vec
  %117 = shufflevector <8 x double> %116, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %118 = getelementptr double, double* %115, i64 -3
  %119 = bitcast double* %118 to <8 x double>*
  %120 = shufflevector <2 x double> %109, <2 x double> %111, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %121 = shufflevector <2 x double> %113, <2 x double> %117, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec144 = shufflevector <4 x double> %120, <4 x double> %121, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec144, <8 x double>* %119, align 8, !alias.scope !11, !noalias !8
  %index.next128 = add i64 %index127, 2
  %122 = icmp eq i64 %index.next128, %n.vec113
  br i1 %122, label %middle.block108, label %vector.body107.vector.body107_crit_edge, !llvm.loop !13

vector.body107.vector.body107_crit_edge:          ; preds = %vector.body107
  %pgocount21 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 7)
  %123 = add i64 %pgocount21, 1
  store i64 %123, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 7)
  br label %vector.body107

middle.block108:                                  ; preds = %vector.body107
  %pgocount22 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 29)
  %124 = add i64 %pgocount22, 1
  store i64 %124, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 29)
  %cmp.n131 = icmp eq i64 %n.mod.vf112, 0
  br i1 %cmp.n131, label %._crit_edge22.us, label %.preheader6.us.new.preheader146

.preheader6.us.new.preheader146:                  ; preds = %middle.block108, %vector.memcheck, %min.iters.checked111, %.preheader6.us.new.preheader
  %indvars.iv58.ph = phi i64 [ %indvars.iv58.unr, %vector.memcheck ], [ %indvars.iv58.unr, %min.iters.checked111 ], [ %indvars.iv58.unr, %.preheader6.us.new.preheader ], [ %ind.end130, %middle.block108 ]
  br label %.preheader6.us.new

.preheader6.us.new:                               ; preds = %.preheader6.us.new..preheader6.us.new_crit_edge, %.preheader6.us.new.preheader146
  %indvars.iv58 = phi i64 [ %indvars.iv.next59.3, %.preheader6.us.new..preheader6.us.new_crit_edge ], [ %indvars.iv58.ph, %.preheader6.us.new.preheader146 ]
  %125 = getelementptr inbounds double, double* %5, i64 %indvars.iv58
  %126 = load double, double* %125, align 8
  %127 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv66, i64 %indvars.iv58
  %128 = load double, double* %127, align 8
  %129 = fsub double %128, %126
  store double %129, double* %127, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %130 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next59
  %131 = load double, double* %130, align 8
  %132 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv66, i64 %indvars.iv.next59
  %133 = load double, double* %132, align 8
  %134 = fsub double %133, %131
  store double %134, double* %132, align 8
  %indvars.iv.next59.1 = add nsw i64 %indvars.iv58, 2
  %135 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next59.1
  %136 = load double, double* %135, align 8
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv66, i64 %indvars.iv.next59.1
  %138 = load double, double* %137, align 8
  %139 = fsub double %138, %136
  store double %139, double* %137, align 8
  %indvars.iv.next59.2 = add nsw i64 %indvars.iv58, 3
  %140 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next59.2
  %141 = load double, double* %140, align 8
  %142 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv66, i64 %indvars.iv.next59.2
  %143 = load double, double* %142, align 8
  %144 = fsub double %143, %141
  store double %144, double* %142, align 8
  %indvars.iv.next59.3 = add nsw i64 %indvars.iv58, 4
  %exitcond61.3 = icmp eq i64 %indvars.iv.next59.3, %wide.trip.count60.3
  br i1 %exitcond61.3, label %._crit_edge22.us.loopexit, label %.preheader6.us.new..preheader6.us.new_crit_edge, !llvm.loop !14

.preheader6.us.new..preheader6.us.new_crit_edge:  ; preds = %.preheader6.us.new
  %pgocount23 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 4)
  %145 = add i64 %pgocount23, 1
  store i64 %145, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 4)
  br label %.preheader6.us.new

._crit_edge22.us.loopexit:                        ; preds = %.preheader6.us.new
  %pgocount24 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 21)
  %146 = add i64 %pgocount24, 1
  store i64 %146, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 21)
  br label %._crit_edge22.us

._crit_edge22.us:                                 ; preds = %._crit_edge22.us.loopexit, %middle.block108, %.prol.loopexit63
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next67, %wide.trip.count68
  br i1 %exitcond69, label %.preheader5.loopexit, label %.preheader6.us

.lr.ph30.split:                                   ; preds = %.lr.ph30.split..lr.ph30.split_crit_edge, %.lr.ph30.split.preheader147
  %indvars.iv84 = phi i64 [ %indvars.iv.next85.3, %.lr.ph30.split..lr.ph30.split_crit_edge ], [ %indvars.iv84.ph, %.lr.ph30.split.preheader147 ]
  %147 = getelementptr inbounds double, double* %5, i64 %indvars.iv84
  store double %17, double* %147, align 8
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %148 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next85
  store double %18, double* %148, align 8
  %indvars.iv.next85.1 = add nsw i64 %indvars.iv84, 2
  %149 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next85.1
  store double %19, double* %149, align 8
  %indvars.iv.next85.2 = add nsw i64 %indvars.iv84, 3
  %150 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next85.2
  store double %20, double* %150, align 8
  %indvars.iv.next85.3 = add nsw i64 %indvars.iv84, 4
  %exitcond87.3 = icmp eq i64 %indvars.iv.next85.3, %wide.trip.count86.3
  br i1 %exitcond87.3, label %.preheader7.loopexit148, label %.lr.ph30.split..lr.ph30.split_crit_edge, !llvm.loop !15

.lr.ph30.split..lr.ph30.split_crit_edge:          ; preds = %.lr.ph30.split
  %pgocount25 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 11)
  %151 = add i64 %pgocount25, 1
  store i64 %151, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 11)
  br label %.lr.ph30.split

.preheader5.loopexit:                             ; preds = %._crit_edge22.us
  %pgocount26 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 32)
  %152 = add i64 %pgocount26, 1
  store i64 %152, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 32)
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.loopexit, %.preheader7
  %153 = icmp sgt i32 %0, 0
  br i1 %153, label %.preheader.lr.ph, label %._crit_edge13

.preheader.lr.ph:                                 ; preds = %.preheader5
  %154 = icmp sgt i32 %1, 0
  %155 = fadd double %2, -1.000000e+00
  br i1 %154, label %.lr.ph10.us.preheader, label %.preheader.preheader

.lr.ph10.us.preheader:                            ; preds = %.preheader.lr.ph
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %156 = icmp eq i32 %1, 1
  %wide.trip.count38 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  %wide.trip.count42 = zext i32 %0 to i64
  br label %.lr.ph10.us

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %157 = zext i32 %0 to i64
  %158 = add i32 %0, -1
  %159 = zext i32 %158 to i64
  %wide.trip.count56 = zext i32 %0 to i64
  %160 = fdiv double 0.000000e+00, %155
  %161 = fdiv double 0.000000e+00, %155
  %wide.trip.count48.1 = zext i32 %0 to i64
  %162 = fdiv double 0.000000e+00, %155
  %163 = add nsw i64 %wide.trip.count56, -2
  br label %.lr.ph10

._crit_edge11.us-lcssa.us.us:                     ; preds = %._crit_edge.us.us
  %pgocount27 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 16)
  %164 = add i64 %pgocount27, 1
  store i64 %164, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 16)
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next41, %wide.trip.count42
  br i1 %exitcond43, label %._crit_edge13.loopexit, label %.lr.ph10.us

.lr.ph10.us:                                      ; preds = %._crit_edge11.us-lcssa.us.us, %.lr.ph10.us.preheader
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %._crit_edge11.us-lcssa.us.us ], [ 0, %.lr.ph10.us.preheader ]
  %165 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv40
  br label %.lr.ph.us.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph10.us
  %indvars.iv36 = phi i64 [ %indvars.iv40, %.lr.ph10.us ], [ %indvars.iv.next37, %._crit_edge.us.us ]
  %166 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv40, i64 %indvars.iv36
  store double 0.000000e+00, double* %166, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %pgocount28 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 14)
  %167 = add i64 %pgocount28, 1
  store i64 %167, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 14)
  %168 = load double, double* %165, align 8
  %169 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv36
  %170 = load double, double* %169, align 8
  %171 = fmul double %168, %170
  %172 = load double, double* %166, align 8
  %173 = fadd double %172, %171
  store double %173, double* %166, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %156, label %.prol.loopexit.._crit_edge.us.us_crit_edge, label %.lr.ph.us.us.new.preheader

.prol.loopexit.._crit_edge.us.us_crit_edge:       ; preds = %.prol.loopexit
  %pgocount29 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 5)
  %174 = add i64 %pgocount29, 1
  store i64 %174, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 5)
  br label %._crit_edge.us.us

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  %pgocount30 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 15)
  %175 = add i64 %pgocount30, 1
  store i64 %175, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 15)
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %.prol.loopexit.._crit_edge.us.us_crit_edge, %._crit_edge.us.us.loopexit
  %176 = load double, double* %166, align 8
  %177 = fdiv double %176, %155
  store double %177, double* %166, align 8
  %178 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv36, i64 %indvars.iv40
  store double %177, double* %178, align 8
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond = icmp eq i64 %indvars.iv.next37, %wide.trip.count38
  br i1 %exitcond, label %._crit_edge11.us-lcssa.us.us, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge, %.lr.ph.us.us.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %179 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv40
  %180 = load double, double* %179, align 8
  %181 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv36
  %182 = load double, double* %181, align 8
  %183 = fmul double %180, %182
  %184 = load double, double* %166, align 8
  %185 = fadd double %184, %183
  store double %185, double* %166, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %186 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv40
  %187 = load double, double* %186, align 8
  %188 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv36
  %189 = load double, double* %188, align 8
  %190 = fmul double %187, %189
  %191 = load double, double* %166, align 8
  %192 = fadd double %191, %190
  store double %192, double* %166, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge

.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge:      ; preds = %.lr.ph.us.us.new
  %pgocount31 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 0)
  %193 = add i64 %pgocount31, 1
  store i64 %193, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 0)
  br label %.lr.ph.us.us.new

.lr.ph10:                                         ; preds = %._crit_edge11, %.preheader.preheader
  %indvars.iv54 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next55, %._crit_edge11 ]
  %194 = sub i64 %159, %indvars.iv54
  %195 = trunc i64 %194 to i32
  %196 = sub i64 %157, %indvars.iv54
  %xtraiter5291 = and i64 %196, 1
  %lcmp.mod53 = icmp eq i64 %xtraiter5291, 0
  br i1 %lcmp.mod53, label %.prol.loopexit51, label %.prol.preheader50

.prol.preheader50:                                ; preds = %.lr.ph10
  %pgocount32 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 24)
  %197 = add i64 %pgocount32, 1
  store i64 %197, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 24)
  %198 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv54
  store double %162, double* %198, align 8
  %indvars.iv.next47.prol = add nuw nsw i64 %indvars.iv54, 1
  br label %.prol.loopexit51

.prol.loopexit51:                                 ; preds = %.prol.preheader50, %.lr.ph10
  %indvars.iv46.unr.ph = phi i64 [ %indvars.iv.next47.prol, %.prol.preheader50 ], [ %indvars.iv54, %.lr.ph10 ]
  %199 = icmp eq i32 %195, 0
  br i1 %199, label %.prol.loopexit51.._crit_edge11_crit_edge, label %.lr.ph10.new.preheader

.prol.loopexit51.._crit_edge11_crit_edge:         ; preds = %.prol.loopexit51
  %pgocount33 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 12)
  %200 = add i64 %pgocount33, 1
  store i64 %200, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 12)
  br label %._crit_edge11

.lr.ph10.new.preheader:                           ; preds = %.prol.loopexit51
  %201 = sub i64 %163, %indvars.iv46.unr.ph
  %202 = lshr i64 %201, 1
  %203 = and i64 %202, 1
  %lcmp.mod150 = icmp eq i64 %203, 0
  br i1 %lcmp.mod150, label %.lr.ph10.new.prol.preheader, label %.lr.ph10.new.prol.loopexit.unr-lcssa

.lr.ph10.new.prol.preheader:                      ; preds = %.lr.ph10.new.preheader
  br label %.lr.ph10.new.prol

.lr.ph10.new.prol:                                ; preds = %.lr.ph10.new.prol.preheader
  %pgocount34 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 27)
  %204 = add i64 %pgocount34, 1
  store i64 %204, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 27)
  %205 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv46.unr.ph
  store double %160, double* %205, align 8
  %206 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv46.unr.ph, i64 %indvars.iv54
  store double %160, double* %206, align 8
  %indvars.iv.next47.prol151 = add nuw nsw i64 %indvars.iv46.unr.ph, 1
  %207 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv.next47.prol151
  store double %161, double* %207, align 8
  %208 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next47.prol151, i64 %indvars.iv54
  store double %161, double* %208, align 8
  %indvars.iv.next47.1.prol = add nsw i64 %indvars.iv46.unr.ph, 2
  br label %.lr.ph10.new.prol.loopexit.unr-lcssa

.lr.ph10.new.prol.loopexit.unr-lcssa:             ; preds = %.lr.ph10.new.prol, %.lr.ph10.new.preheader
  %indvars.iv46.unr.ph152 = phi i64 [ %indvars.iv.next47.1.prol, %.lr.ph10.new.prol ], [ %indvars.iv46.unr.ph, %.lr.ph10.new.preheader ]
  br label %.lr.ph10.new.prol.loopexit

.lr.ph10.new.prol.loopexit:                       ; preds = %.lr.ph10.new.prol.loopexit.unr-lcssa
  %209 = icmp eq i64 %202, 0
  br i1 %209, label %._crit_edge11.loopexit, label %.lr.ph10.new.preheader.new

.lr.ph10.new.preheader.new:                       ; preds = %.lr.ph10.new.prol.loopexit
  br label %.lr.ph10.new

.lr.ph10.new:                                     ; preds = %.lr.ph10.new..lr.ph10.new_crit_edge, %.lr.ph10.new.preheader.new
  %indvars.iv46 = phi i64 [ %indvars.iv46.unr.ph152, %.lr.ph10.new.preheader.new ], [ %indvars.iv.next47.1.1, %.lr.ph10.new..lr.ph10.new_crit_edge ]
  %210 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv46
  store double %160, double* %210, align 8
  %211 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv46, i64 %indvars.iv54
  store double %160, double* %211, align 8
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %212 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv.next47
  store double %161, double* %212, align 8
  %213 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next47, i64 %indvars.iv54
  store double %161, double* %213, align 8
  %indvars.iv.next47.1 = add nsw i64 %indvars.iv46, 2
  %214 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv.next47.1
  store double %160, double* %214, align 8
  %215 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next47.1, i64 %indvars.iv54
  store double %160, double* %215, align 8
  %indvars.iv.next47.1153 = add nsw i64 %indvars.iv46, 3
  %216 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv.next47.1153
  store double %161, double* %216, align 8
  %217 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next47.1153, i64 %indvars.iv54
  store double %161, double* %217, align 8
  %indvars.iv.next47.1.1 = add nsw i64 %indvars.iv46, 4
  %exitcond49.1.1 = icmp eq i64 %indvars.iv.next47.1.1, %wide.trip.count48.1
  br i1 %exitcond49.1.1, label %._crit_edge11.loopexit.unr-lcssa, label %.lr.ph10.new..lr.ph10.new_crit_edge

.lr.ph10.new..lr.ph10.new_crit_edge:              ; preds = %.lr.ph10.new
  %pgocount35 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 6)
  %218 = add i64 %pgocount35, 1
  store i64 %218, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 6)
  br label %.lr.ph10.new

._crit_edge11.loopexit.unr-lcssa:                 ; preds = %.lr.ph10.new
  %pgocount36 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 25)
  %219 = add i64 %pgocount36, 1
  store i64 %219, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 25)
  br label %._crit_edge11.loopexit

._crit_edge11.loopexit:                           ; preds = %._crit_edge11.loopexit.unr-lcssa, %.lr.ph10.new.prol.loopexit
  %pgocount37 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 22)
  %220 = add i64 %pgocount37, 1
  store i64 %220, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 22)
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %.prol.loopexit51.._crit_edge11_crit_edge, %._crit_edge11.loopexit
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next55, %wide.trip.count56
  br i1 %exitcond57, label %._crit_edge13.loopexit145, label %.lr.ph10

._crit_edge13.loopexit:                           ; preds = %._crit_edge11.us-lcssa.us.us
  %pgocount38 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 33)
  %221 = add i64 %pgocount38, 1
  store i64 %221, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 33)
  br label %._crit_edge13

._crit_edge13.loopexit145:                        ; preds = %._crit_edge11
  %pgocount39 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 35)
  %222 = add i64 %pgocount39, 1
  store i64 %222, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 35)
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit145, %._crit_edge13.loopexit, %.preheader5, %.preheader6.lr.ph
  %pgocount40 = load i64, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 28)
  %223 = add i64 %pgocount40, 1
  store i64 %223, i64* getelementptr inbounds ([41 x i64], [41 x i64]* @__profc_B.ll_kernel_covariance, i64 0, i64 28)
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
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
  %28 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #5
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !2}
!7 = distinct !{!7, !2}
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !4, !5}
!14 = distinct !{!14, !4, !5}
!15 = distinct !{!15, !16, !4, !5}
!16 = !{!"llvm.loop.unroll.runtime.disable"}
