; ModuleID = 'B.ll'
source_filename = "correlation.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"corr\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_correlation = private constant [23 x i8] c"B.ll:kernel_correlation"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 32414643582, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 36170296450, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_correlation = private global [47 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_correlation = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -1350359969428179236, i64 288230900643015461, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i32 0, i32 0), i8* null, i8* null, i32 47, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 63976198547, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [63 x i8] c"=\00main\01B.ll:init_array\01B.ll:kernel_correlation\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_correlation to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([63 x i8], [63 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %8 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(double* nonnull %3, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  tail call fastcc void @kernel_correlation(i32 1200, i32 1400, double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
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
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %10)
  br label %20

; <label>:20:                                     ; preds = %18, %14, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %21 = add i64 %pgocount2, 1
  store i64 %21, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %0, align 8
  br label %.preheader

.preheader:                                       ; preds = %19, %2
  %indvars.iv4 = phi i64 [ 0, %2 ], [ %indvars.iv.next5, %19 ]
  %3 = trunc i64 %indvars.iv4 to i32
  %4 = sitofp i32 %3 to double
  br label %5

; <label>:5:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge ]
  %6 = mul nuw nsw i64 %indvars.iv, %indvars.iv4
  %7 = trunc i64 %6 to i32
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 1.200000e+03
  %10 = fadd double %4, %9
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv4, i64 %indvars.iv
  store double %10, double* %11, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %12 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv4
  %13 = trunc i64 %12 to i32
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 1.200000e+03
  %16 = fadd double %4, %15
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv4, i64 %indvars.iv.next
  store double %16, double* %17, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %19, label %._crit_edge

._crit_edge:                                      ; preds = %5
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %18 = add i64 %pgocount, 1
  store i64 %18, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  br label %5

; <label>:19:                                     ; preds = %5
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

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph41, label %.preheader7

.lr.ph41:                                         ; preds = %7
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.lr.ph41.split.us.preheader, label %.lr.ph41.split.preheader

.lr.ph41.split.preheader:                         ; preds = %.lr.ph41
  %pgocount = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 31)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 31)
  %11 = add i32 %0, -1
  %xtraiter113 = and i32 %0, 3
  %lcmp.mod114 = icmp eq i32 %xtraiter113, 0
  br i1 %lcmp.mod114, label %.lr.ph41.split.prol.loopexit, label %.lr.ph41.split.prol.preheader

.lr.ph41.split.prol.preheader:                    ; preds = %.lr.ph41.split.preheader
  %12 = fdiv double 0.000000e+00, %2
  br label %.lr.ph41.split.prol

.lr.ph41.split.prol:                              ; preds = %.lr.ph41.split.prol..lr.ph41.split.prol_crit_edge, %.lr.ph41.split.prol.preheader
  %indvars.iv109.prol = phi i64 [ %indvars.iv.next110.prol, %.lr.ph41.split.prol..lr.ph41.split.prol_crit_edge ], [ 0, %.lr.ph41.split.prol.preheader ]
  %prol.iter115 = phi i32 [ %prol.iter115.sub, %.lr.ph41.split.prol..lr.ph41.split.prol_crit_edge ], [ %xtraiter113, %.lr.ph41.split.prol.preheader ]
  %13 = getelementptr inbounds double, double* %5, i64 %indvars.iv109.prol
  store double %12, double* %13, align 8
  %indvars.iv.next110.prol = add nuw nsw i64 %indvars.iv109.prol, 1
  %prol.iter115.sub = add i32 %prol.iter115, -1
  %prol.iter115.cmp = icmp eq i32 %prol.iter115.sub, 0
  br i1 %prol.iter115.cmp, label %.lr.ph41.split.prol.loopexit.loopexit, label %.lr.ph41.split.prol..lr.ph41.split.prol_crit_edge, !llvm.loop !1

.lr.ph41.split.prol..lr.ph41.split.prol_crit_edge: ; preds = %.lr.ph41.split.prol
  %pgocount1 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 9)
  %14 = add i64 %pgocount1, 1
  store i64 %14, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 9)
  br label %.lr.ph41.split.prol

.lr.ph41.split.prol.loopexit.loopexit:            ; preds = %.lr.ph41.split.prol
  %pgocount2 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 35)
  %15 = add i64 %pgocount2, 1
  store i64 %15, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 35)
  br label %.lr.ph41.split.prol.loopexit

.lr.ph41.split.prol.loopexit:                     ; preds = %.lr.ph41.split.prol.loopexit.loopexit, %.lr.ph41.split.preheader
  %indvars.iv109.unr = phi i64 [ 0, %.lr.ph41.split.preheader ], [ %indvars.iv.next110.prol, %.lr.ph41.split.prol.loopexit.loopexit ]
  %16 = icmp ult i32 %11, 3
  br i1 %16, label %.lr.ph34, label %.lr.ph41.split.preheader121

.lr.ph41.split.preheader121:                      ; preds = %.lr.ph41.split.prol.loopexit
  %pgocount3 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 37)
  %17 = add i64 %pgocount3, 1
  store i64 %17, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 37)
  %18 = fdiv double 0.000000e+00, %2
  %19 = fdiv double 0.000000e+00, %2
  %20 = fdiv double 0.000000e+00, %2
  %21 = fdiv double 0.000000e+00, %2
  %wide.trip.count111.3 = zext i32 %0 to i64
  %22 = add nsw i64 %wide.trip.count111.3, -4
  %23 = sub i64 %22, %indvars.iv109.unr
  %24 = lshr i64 %23, 2
  %25 = add nuw nsw i64 %24, 1
  %min.iters.check = icmp ult i64 %25, 4
  br i1 %min.iters.check, label %.lr.ph41.split.preheader140, label %min.iters.checked

.lr.ph41.split.preheader140:                      ; preds = %middle.block, %min.iters.checked, %.lr.ph41.split.preheader121
  %indvars.iv109.ph = phi i64 [ %indvars.iv109.unr, %min.iters.checked ], [ %indvars.iv109.unr, %.lr.ph41.split.preheader121 ], [ %ind.end, %middle.block ]
  br label %.lr.ph41.split

min.iters.checked:                                ; preds = %.lr.ph41.split.preheader121
  %pgocount4 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 41)
  %26 = add i64 %pgocount4, 1
  store i64 %26, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 41)
  %n.mod.vf = and i64 %25, 3
  %n.vec = sub nsw i64 %25, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %27 = shl nuw i64 %24, 2
  %28 = add i64 %indvars.iv109.unr, %27
  %29 = add i64 %28, 4
  %30 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %29, %30
  br i1 %cmp.zero, label %.lr.ph41.split.preheader140, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert128 = insertelement <2 x double> undef, double %18, i32 0
  %broadcast.splat129 = shufflevector <2 x double> %broadcast.splatinsert128, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert130 = insertelement <2 x double> undef, double %19, i32 0
  %broadcast.splat131 = shufflevector <2 x double> %broadcast.splatinsert130, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert132 = insertelement <2 x double> undef, double %20, i32 0
  %broadcast.splat133 = shufflevector <2 x double> %broadcast.splatinsert132, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert134 = insertelement <2 x double> undef, double %21, i32 0
  %broadcast.splat135 = shufflevector <2 x double> %broadcast.splatinsert134, <2 x double> undef, <2 x i32> zeroinitializer
  %31 = shufflevector <2 x double> %broadcast.splat129, <2 x double> %broadcast.splat131, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %32 = shufflevector <2 x double> %broadcast.splat133, <2 x double> %broadcast.splat135, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %31, <4 x double> %32, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %33 = shl i64 %index, 2
  %offset.idx = add i64 %indvars.iv109.unr, %33
  %34 = add i64 %indvars.iv109.unr, %33
  %35 = add nsw i64 %34, 3
  %36 = add i64 %offset.idx, 11
  %37 = getelementptr inbounds double, double* %5, i64 %35
  %38 = getelementptr inbounds double, double* %5, i64 %36
  %39 = getelementptr double, double* %37, i64 -3
  %40 = bitcast double* %39 to <8 x double>*
  %41 = getelementptr double, double* %38, i64 -3
  %42 = bitcast double* %41 to <8 x double>*
  store <8 x double> %interleaved.vec, <8 x double>* %40, align 8
  store <8 x double> %interleaved.vec, <8 x double>* %42, align 8
  %index.next = add i64 %index, 4
  %43 = icmp eq i64 %index.next, %n.vec
  br i1 %43, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !3

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  %pgocount5 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 15)
  %44 = add i64 %pgocount5, 1
  store i64 %44, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 15)
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %pgocount6 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 42)
  %45 = add i64 %pgocount6, 1
  store i64 %45, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 42)
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.preheader8, label %.lr.ph41.split.preheader140

.lr.ph41.split.us.preheader:                      ; preds = %.lr.ph41
  %46 = add i32 %1, -1
  %xtraiter102 = and i32 %1, 3
  %lcmp.mod103 = icmp eq i32 %xtraiter102, 0
  %47 = icmp ult i32 %46, 3
  %wide.trip.count107 = zext i32 %0 to i64
  %wide.trip.count98.3 = zext i32 %1 to i64
  br label %.lr.ph41.split.us

.lr.ph41.split.us:                                ; preds = %._crit_edge38.us, %.lr.ph41.split.us.preheader
  %indvars.iv105 = phi i64 [ 0, %.lr.ph41.split.us.preheader ], [ %indvars.iv.next106, %._crit_edge38.us ]
  %48 = getelementptr inbounds double, double* %5, i64 %indvars.iv105
  store double 0.000000e+00, double* %48, align 8
  br i1 %lcmp.mod103, label %.lr.ph41.split.us..prol.loopexit101_crit_edge, label %.prol.preheader100.preheader

.lr.ph41.split.us..prol.loopexit101_crit_edge:    ; preds = %.lr.ph41.split.us
  %pgocount7 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 8)
  %49 = add i64 %pgocount7, 1
  store i64 %49, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 8)
  br label %.prol.loopexit101

.prol.preheader100.preheader:                     ; preds = %.lr.ph41.split.us
  br label %.prol.preheader100

.prol.preheader100:                               ; preds = %.prol.preheader100..prol.preheader100_crit_edge, %.prol.preheader100.preheader
  %indvars.iv96.prol = phi i64 [ %indvars.iv.next97.prol, %.prol.preheader100..prol.preheader100_crit_edge ], [ 0, %.prol.preheader100.preheader ]
  %prol.iter104 = phi i32 [ %prol.iter104.sub, %.prol.preheader100..prol.preheader100_crit_edge ], [ %xtraiter102, %.prol.preheader100.preheader ]
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv96.prol, i64 %indvars.iv105
  %51 = load double, double* %50, align 8
  %52 = load double, double* %48, align 8
  %53 = fadd double %51, %52
  store double %53, double* %48, align 8
  %indvars.iv.next97.prol = add nuw nsw i64 %indvars.iv96.prol, 1
  %prol.iter104.sub = add i32 %prol.iter104, -1
  %prol.iter104.cmp = icmp eq i32 %prol.iter104.sub, 0
  br i1 %prol.iter104.cmp, label %.prol.loopexit101.loopexit, label %.prol.preheader100..prol.preheader100_crit_edge, !llvm.loop !6

.prol.preheader100..prol.preheader100_crit_edge:  ; preds = %.prol.preheader100
  %pgocount8 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 2)
  %54 = add i64 %pgocount8, 1
  store i64 %54, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 2)
  br label %.prol.preheader100

.prol.loopexit101.loopexit:                       ; preds = %.prol.preheader100
  %pgocount9 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 19)
  %55 = add i64 %pgocount9, 1
  store i64 %55, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 19)
  br label %.prol.loopexit101

.prol.loopexit101:                                ; preds = %.lr.ph41.split.us..prol.loopexit101_crit_edge, %.prol.loopexit101.loopexit
  %indvars.iv96.unr = phi i64 [ 0, %.lr.ph41.split.us..prol.loopexit101_crit_edge ], [ %indvars.iv.next97.prol, %.prol.loopexit101.loopexit ]
  br i1 %47, label %._crit_edge38.us, label %.lr.ph41.split.us.new.preheader

.lr.ph41.split.us.new.preheader:                  ; preds = %.prol.loopexit101
  br label %.lr.ph41.split.us.new

.lr.ph41.split.us.new:                            ; preds = %.lr.ph41.split.us.new..lr.ph41.split.us.new_crit_edge, %.lr.ph41.split.us.new.preheader
  %indvars.iv96 = phi i64 [ %indvars.iv.next97.3, %.lr.ph41.split.us.new..lr.ph41.split.us.new_crit_edge ], [ %indvars.iv96.unr, %.lr.ph41.split.us.new.preheader ]
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv96, i64 %indvars.iv105
  %57 = load double, double* %56, align 8
  %58 = load double, double* %48, align 8
  %59 = fadd double %57, %58
  store double %59, double* %48, align 8
  %indvars.iv.next97 = add nuw nsw i64 %indvars.iv96, 1
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next97, i64 %indvars.iv105
  %61 = load double, double* %60, align 8
  %62 = fadd double %61, %59
  store double %62, double* %48, align 8
  %indvars.iv.next97.1 = add nsw i64 %indvars.iv96, 2
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next97.1, i64 %indvars.iv105
  %64 = load double, double* %63, align 8
  %65 = fadd double %64, %62
  store double %65, double* %48, align 8
  %indvars.iv.next97.2 = add nsw i64 %indvars.iv96, 3
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next97.2, i64 %indvars.iv105
  %67 = load double, double* %66, align 8
  %68 = fadd double %67, %65
  store double %68, double* %48, align 8
  %indvars.iv.next97.3 = add nsw i64 %indvars.iv96, 4
  %exitcond99.3 = icmp eq i64 %indvars.iv.next97.3, %wide.trip.count98.3
  br i1 %exitcond99.3, label %._crit_edge38.us.loopexit, label %.lr.ph41.split.us.new..lr.ph41.split.us.new_crit_edge

.lr.ph41.split.us.new..lr.ph41.split.us.new_crit_edge: ; preds = %.lr.ph41.split.us.new
  %pgocount10 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 3)
  %69 = add i64 %pgocount10, 1
  store i64 %69, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 3)
  br label %.lr.ph41.split.us.new

._crit_edge38.us.loopexit:                        ; preds = %.lr.ph41.split.us.new
  %pgocount11 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 20)
  %70 = add i64 %pgocount11, 1
  store i64 %70, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 20)
  br label %._crit_edge38.us

._crit_edge38.us:                                 ; preds = %._crit_edge38.us.loopexit, %.prol.loopexit101
  %71 = load double, double* %48, align 8
  %72 = fdiv double %71, %2
  store double %72, double* %48, align 8
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv105, 1
  %exitcond108 = icmp eq i64 %indvars.iv.next106, %wide.trip.count107
  br i1 %exitcond108, label %.preheader8.loopexit, label %.lr.ph41.split.us

.preheader8.loopexit:                             ; preds = %._crit_edge38.us
  %pgocount12 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 28)
  %73 = add i64 %pgocount12, 1
  store i64 %73, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 28)
  br label %.preheader8

.preheader8.loopexit141:                          ; preds = %.lr.ph41.split
  %pgocount13 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 38)
  %74 = add i64 %pgocount13, 1
  store i64 %74, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 38)
  br label %.preheader8

.preheader8:                                      ; preds = %.preheader8.loopexit141, %.preheader8.loopexit, %middle.block
  %75 = icmp sgt i32 %0, 0
  br i1 %75, label %.lr.ph34, label %.preheader7

.lr.ph34:                                         ; preds = %.preheader8, %.lr.ph41.split.prol.loopexit
  %76 = icmp sgt i32 %1, 0
  br i1 %76, label %.lr.ph34.split.us.preheader, label %.lr.ph34.split.preheader

.lr.ph34.split.us.preheader:                      ; preds = %.lr.ph34
  %pgocount14 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 30)
  %77 = add i64 %pgocount14, 1
  store i64 %77, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 30)
  %xtraiter84 = and i32 %1, 1
  %lcmp.mod85 = icmp eq i32 %xtraiter84, 0
  %78 = icmp eq i32 %1, 1
  %wide.trip.count88 = zext i32 %0 to i64
  %wide.trip.count80.1 = zext i32 %1 to i64
  br label %.lr.ph34.split.us

.lr.ph34.split.preheader:                         ; preds = %.lr.ph34
  %pgocount15 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 34)
  %79 = add i64 %pgocount15, 1
  store i64 %79, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 34)
  %xtraiter94 = and i32 %0, 1
  %lcmp.mod95 = icmp eq i32 %xtraiter94, 0
  br i1 %lcmp.mod95, label %.lr.ph34.split.prol.loopexit, label %.lr.ph34.split.prol

.lr.ph34.split.prol:                              ; preds = %.lr.ph34.split.preheader
  %pgocount16 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 39)
  %80 = add i64 %pgocount16, 1
  store i64 %80, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 39)
  %81 = fdiv double 0.000000e+00, %2
  store double %81, double* %6, align 8
  %82 = tail call double @sqrt(double %81) #4
  %83 = fcmp ugt double %82, 1.000000e-01
  %84 = zext i1 %83 to i64
  %pgocount17 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 43)
  %85 = add i64 %pgocount17, %84
  store i64 %85, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 43)
  %86 = select i1 %83, double %82, double 1.000000e+00
  store double %86, double* %6, align 8
  br label %.lr.ph34.split.prol.loopexit

.lr.ph34.split.prol.loopexit:                     ; preds = %.lr.ph34.split.prol, %.lr.ph34.split.preheader
  %indvars.iv90.unr = phi i64 [ 0, %.lr.ph34.split.preheader ], [ 1, %.lr.ph34.split.prol ]
  %87 = icmp eq i32 %0, 1
  br i1 %87, label %.preheader7, label %.lr.ph34.split.preheader119

.lr.ph34.split.preheader119:                      ; preds = %.lr.ph34.split.prol.loopexit
  %88 = fdiv double 0.000000e+00, %2
  %89 = fdiv double 0.000000e+00, %2
  %wide.trip.count92.1 = zext i32 %0 to i64
  br label %.lr.ph34.split

.lr.ph34.split.us:                                ; preds = %._crit_edge32.us, %.lr.ph34.split.us.preheader
  %indvars.iv86 = phi i64 [ %indvars.iv.next87, %._crit_edge32.us ], [ 0, %.lr.ph34.split.us.preheader ]
  %90 = getelementptr inbounds double, double* %6, i64 %indvars.iv86
  store double 0.000000e+00, double* %90, align 8
  %91 = getelementptr inbounds double, double* %5, i64 %indvars.iv86
  br i1 %lcmp.mod85, label %.prol.loopexit83, label %.prol.preheader82

.prol.preheader82:                                ; preds = %.lr.ph34.split.us
  %pgocount18 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 21)
  %92 = add i64 %pgocount18, 1
  store i64 %92, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 21)
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv86
  %94 = load double, double* %93, align 8
  %95 = load double, double* %91, align 8
  %96 = fsub double %94, %95
  %97 = fmul double %96, %96
  %98 = load double, double* %90, align 8
  %99 = fadd double %98, %97
  store double %99, double* %90, align 8
  br label %.prol.loopexit83

.prol.loopexit83:                                 ; preds = %.prol.preheader82, %.lr.ph34.split.us
  %indvars.iv78.unr.ph = phi i64 [ 1, %.prol.preheader82 ], [ 0, %.lr.ph34.split.us ]
  br i1 %78, label %.prol.loopexit83.._crit_edge32.us_crit_edge, label %.lr.ph34.split.us.new.preheader

.prol.loopexit83.._crit_edge32.us_crit_edge:      ; preds = %.prol.loopexit83
  %pgocount19 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 10)
  %100 = add i64 %pgocount19, 1
  store i64 %100, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 10)
  br label %._crit_edge32.us

.lr.ph34.split.us.new.preheader:                  ; preds = %.prol.loopexit83
  br label %.lr.ph34.split.us.new

.lr.ph34.split.us.new:                            ; preds = %.lr.ph34.split.us.new..lr.ph34.split.us.new_crit_edge, %.lr.ph34.split.us.new.preheader
  %indvars.iv78 = phi i64 [ %indvars.iv.next79.1, %.lr.ph34.split.us.new..lr.ph34.split.us.new_crit_edge ], [ %indvars.iv78.unr.ph, %.lr.ph34.split.us.new.preheader ]
  %101 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv78, i64 %indvars.iv86
  %102 = load double, double* %101, align 8
  %103 = load double, double* %91, align 8
  %104 = fsub double %102, %103
  %105 = fmul double %104, %104
  %106 = load double, double* %90, align 8
  %107 = fadd double %106, %105
  store double %107, double* %90, align 8
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %108 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next79, i64 %indvars.iv86
  %109 = load double, double* %108, align 8
  %110 = load double, double* %91, align 8
  %111 = fsub double %109, %110
  %112 = fmul double %111, %111
  %113 = load double, double* %90, align 8
  %114 = fadd double %113, %112
  store double %114, double* %90, align 8
  %indvars.iv.next79.1 = add nsw i64 %indvars.iv78, 2
  %exitcond81.1 = icmp eq i64 %indvars.iv.next79.1, %wide.trip.count80.1
  br i1 %exitcond81.1, label %._crit_edge32.us.loopexit, label %.lr.ph34.split.us.new..lr.ph34.split.us.new_crit_edge

.lr.ph34.split.us.new..lr.ph34.split.us.new_crit_edge: ; preds = %.lr.ph34.split.us.new
  %pgocount20 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 4)
  %115 = add i64 %pgocount20, 1
  store i64 %115, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 4)
  br label %.lr.ph34.split.us.new

._crit_edge32.us.loopexit:                        ; preds = %.lr.ph34.split.us.new
  %pgocount21 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 22)
  %116 = add i64 %pgocount21, 1
  store i64 %116, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 22)
  br label %._crit_edge32.us

._crit_edge32.us:                                 ; preds = %.prol.loopexit83.._crit_edge32.us_crit_edge, %._crit_edge32.us.loopexit
  %117 = load double, double* %90, align 8
  %118 = fdiv double %117, %2
  store double %118, double* %90, align 8
  %119 = tail call double @sqrt(double %118) #4
  %120 = fcmp ugt double %119, 1.000000e-01
  %121 = zext i1 %120 to i64
  %pgocount22 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 44)
  %122 = add i64 %pgocount22, %121
  store i64 %122, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 44)
  %123 = select i1 %120, double %119, double 1.000000e+00
  store double %123, double* %90, align 8
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86, 1
  %exitcond89 = icmp eq i64 %indvars.iv.next87, %wide.trip.count88
  br i1 %exitcond89, label %.preheader7.loopexit, label %.lr.ph34.split.us

.lr.ph41.split:                                   ; preds = %.lr.ph41.split..lr.ph41.split_crit_edge, %.lr.ph41.split.preheader140
  %indvars.iv109 = phi i64 [ %indvars.iv.next110.3, %.lr.ph41.split..lr.ph41.split_crit_edge ], [ %indvars.iv109.ph, %.lr.ph41.split.preheader140 ]
  %124 = getelementptr inbounds double, double* %5, i64 %indvars.iv109
  store double %18, double* %124, align 8
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv109, 1
  %125 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next110
  store double %19, double* %125, align 8
  %indvars.iv.next110.1 = add nsw i64 %indvars.iv109, 2
  %126 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next110.1
  store double %20, double* %126, align 8
  %indvars.iv.next110.2 = add nsw i64 %indvars.iv109, 3
  %127 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next110.2
  store double %21, double* %127, align 8
  %indvars.iv.next110.3 = add nsw i64 %indvars.iv109, 4
  %exitcond112.3 = icmp eq i64 %indvars.iv.next110.3, %wide.trip.count111.3
  br i1 %exitcond112.3, label %.preheader8.loopexit141, label %.lr.ph41.split..lr.ph41.split_crit_edge, !llvm.loop !7

.lr.ph41.split..lr.ph41.split_crit_edge:          ; preds = %.lr.ph41.split
  %pgocount23 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 12)
  %128 = add i64 %pgocount23, 1
  store i64 %128, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 12)
  br label %.lr.ph41.split

.preheader7.loopexit:                             ; preds = %._crit_edge32.us
  br label %.preheader7

.preheader7.loopexit139:                          ; preds = %.lr.ph34.split
  %pgocount24 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 40)
  %129 = add i64 %pgocount24, 1
  store i64 %129, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 40)
  br label %.preheader7

.preheader7:                                      ; preds = %.preheader7.loopexit139, %.preheader7.loopexit, %.lr.ph34.split.prol.loopexit, %.preheader8, %7
  %130 = icmp sgt i32 %1, 0
  br i1 %130, label %.preheader6.lr.ph, label %.preheader

.preheader6.lr.ph:                                ; preds = %.preheader7
  %131 = icmp sgt i32 %0, 0
  br i1 %131, label %.preheader6.us.preheader, label %.preheader.thread

.preheader6.us.preheader:                         ; preds = %.preheader6.lr.ph
  %wide.trip.count71 = zext i32 %0 to i64
  %wide.trip.count75 = zext i32 %1 to i64
  br label %.preheader6.us

.preheader.thread:                                ; preds = %.preheader6.lr.ph
  %pgocount25 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 32)
  %132 = add i64 %pgocount25, 1
  store i64 %132, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 32)
  %133 = add nsw i32 %0, -1
  br label %._crit_edge17

.preheader6.us:                                   ; preds = %._crit_edge27.us, %.preheader6.us.preheader
  %indvars.iv73 = phi i64 [ %indvars.iv.next74, %._crit_edge27.us ], [ 0, %.preheader6.us.preheader ]
  br label %134

; <label>:134:                                    ; preds = %._crit_edge, %.preheader6.us
  %indvars.iv69 = phi i64 [ 0, %.preheader6.us ], [ %indvars.iv.next70, %._crit_edge ]
  %135 = getelementptr inbounds double, double* %5, i64 %indvars.iv69
  %136 = load double, double* %135, align 8
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv73, i64 %indvars.iv69
  %138 = load double, double* %137, align 8
  %139 = fsub double %138, %136
  store double %139, double* %137, align 8
  %140 = tail call double @sqrt(double %2) #4
  %141 = getelementptr inbounds double, double* %6, i64 %indvars.iv69
  %142 = load double, double* %141, align 8
  %143 = fmul double %140, %142
  %144 = load double, double* %137, align 8
  %145 = fdiv double %144, %143
  store double %145, double* %137, align 8
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next70, %wide.trip.count71
  br i1 %exitcond72, label %._crit_edge27.us, label %._crit_edge

._crit_edge:                                      ; preds = %134
  %pgocount26 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 1)
  %146 = add i64 %pgocount26, 1
  store i64 %146, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 1)
  br label %134

._crit_edge27.us:                                 ; preds = %134
  %pgocount27 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 18)
  %147 = add i64 %pgocount27, 1
  store i64 %147, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 18)
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next74, %wide.trip.count75
  br i1 %exitcond76, label %.preheader.loopexit, label %.preheader6.us

.lr.ph34.split:                                   ; preds = %.lr.ph34.split..lr.ph34.split_crit_edge, %.lr.ph34.split.preheader119
  %indvars.iv90 = phi i64 [ %indvars.iv.next91.1, %.lr.ph34.split..lr.ph34.split_crit_edge ], [ %indvars.iv90.unr, %.lr.ph34.split.preheader119 ]
  %148 = getelementptr inbounds double, double* %6, i64 %indvars.iv90
  store double %88, double* %148, align 8
  %149 = tail call double @sqrt(double %88) #4
  %150 = fcmp ugt double %149, 1.000000e-01
  %151 = zext i1 %150 to i64
  %pgocount28 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 45)
  %152 = add i64 %pgocount28, %151
  store i64 %152, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 45)
  %153 = select i1 %150, double %149, double 1.000000e+00
  store double %153, double* %148, align 8
  %indvars.iv.next91 = add nuw nsw i64 %indvars.iv90, 1
  %154 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next91
  store double %89, double* %154, align 8
  %155 = tail call double @sqrt(double %89) #4
  %156 = fcmp ugt double %155, 1.000000e-01
  %157 = zext i1 %156 to i64
  %pgocount29 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 46)
  %158 = add i64 %pgocount29, %157
  store i64 %158, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 46)
  %159 = select i1 %156, double %155, double 1.000000e+00
  store double %159, double* %154, align 8
  %indvars.iv.next91.1 = add nsw i64 %indvars.iv90, 2
  %exitcond93.1 = icmp eq i64 %indvars.iv.next91.1, %wide.trip.count92.1
  br i1 %exitcond93.1, label %.preheader7.loopexit139, label %.lr.ph34.split..lr.ph34.split_crit_edge

.lr.ph34.split..lr.ph34.split_crit_edge:          ; preds = %.lr.ph34.split
  %pgocount30 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 13)
  %160 = add i64 %pgocount30, 1
  store i64 %160, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 13)
  br label %.lr.ph34.split

.preheader.loopexit:                              ; preds = %._crit_edge27.us
  %pgocount31 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 29)
  %161 = add i64 %pgocount31, 1
  store i64 %161, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 29)
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.preheader7
  %162 = add nsw i32 %0, -1
  %163 = icmp sgt i32 %0, 1
  br i1 %163, label %.lr.ph16, label %._crit_edge17

.lr.ph16:                                         ; preds = %.preheader
  %164 = icmp sgt i32 %1, 0
  br i1 %164, label %.lr.ph16.split.us.preheader, label %.lr.ph16.split.preheader

.lr.ph16.split.preheader:                         ; preds = %.lr.ph16
  %165 = zext i32 %162 to i64
  %166 = add i32 %0, -2
  %167 = zext i32 %166 to i64
  %168 = sext i32 %0 to i64
  %wide.trip.count60.3 = zext i32 %0 to i64
  %wide.trip.count67 = zext i32 %162 to i64
  br label %.lr.ph16.split

.lr.ph16.split.us.preheader:                      ; preds = %.lr.ph16
  %pgocount32 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 33)
  %169 = add i64 %pgocount32, 1
  store i64 %169, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 33)
  %170 = sext i32 %0 to i64
  %wide.trip.count54 = zext i32 %162 to i64
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %171 = icmp eq i32 %1, 1
  %wide.trip.count50 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  br label %.lr.ph16.split.us

.lr.ph16.split.us:                                ; preds = %._crit_edge14.us-lcssa.us.us, %.lr.ph16.split.us.preheader
  %indvars.iv52 = phi i64 [ 0, %.lr.ph16.split.us.preheader ], [ %indvars.iv.next53, %._crit_edge14.us-lcssa.us.us ]
  %indvars.iv46 = phi i64 [ 1, %.lr.ph16.split.us.preheader ], [ %indvars.iv.next47, %._crit_edge14.us-lcssa.us.us ]
  %172 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv52, i64 %indvars.iv52
  store double 1.000000e+00, double* %172, align 8
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %173 = icmp slt i64 %indvars.iv.next53, %170
  br i1 %173, label %.lr.ph.us.us.preheader, label %.lr.ph16.split.us.._crit_edge14.us-lcssa.us.us_crit_edge

.lr.ph16.split.us.._crit_edge14.us-lcssa.us.us_crit_edge: ; preds = %.lr.ph16.split.us
  %pgocount33 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 11)
  %174 = add i64 %pgocount33, 1
  store i64 %174, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 11)
  br label %._crit_edge14.us-lcssa.us.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph16.split.us
  %175 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv52
  br label %.lr.ph.us.us

._crit_edge14.us-lcssa.us.us.loopexit:            ; preds = %._crit_edge.us.us
  %pgocount34 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 23)
  %176 = add i64 %pgocount34, 1
  store i64 %176, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 23)
  br label %._crit_edge14.us-lcssa.us.us

._crit_edge14.us-lcssa.us.us:                     ; preds = %.lr.ph16.split.us.._crit_edge14.us-lcssa.us.us_crit_edge, %._crit_edge14.us-lcssa.us.us.loopexit
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, %wide.trip.count54
  br i1 %exitcond55, label %._crit_edge17.loopexit, label %.lr.ph16.split.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph.us.us.preheader
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %._crit_edge.us.us ], [ %indvars.iv46, %.lr.ph.us.us.preheader ]
  %177 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv52, i64 %indvars.iv48
  store double 0.000000e+00, double* %177, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %pgocount35 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 16)
  %178 = add i64 %pgocount35, 1
  store i64 %178, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 16)
  %179 = load double, double* %175, align 8
  %180 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 0, i64 %indvars.iv48
  %181 = load double, double* %180, align 8
  %182 = fmul double %179, %181
  %183 = load double, double* %177, align 8
  %184 = fadd double %183, %182
  store double %184, double* %177, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %171, label %.prol.loopexit.._crit_edge.us.us_crit_edge, label %.lr.ph.us.us.new.preheader

.prol.loopexit.._crit_edge.us.us_crit_edge:       ; preds = %.prol.loopexit
  %pgocount36 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 5)
  %185 = add i64 %pgocount36, 1
  store i64 %185, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 5)
  br label %._crit_edge.us.us

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  %pgocount37 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 17)
  %186 = add i64 %pgocount37, 1
  store i64 %186, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 17)
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %.prol.loopexit.._crit_edge.us.us_crit_edge, %._crit_edge.us.us.loopexit
  %187 = bitcast double* %177 to i64*
  %188 = load i64, i64* %187, align 8
  %189 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv48, i64 %indvars.iv52
  %190 = bitcast double* %189 to i64*
  store i64 %188, i64* %190, align 8
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond = icmp eq i64 %indvars.iv.next49, %wide.trip.count50
  br i1 %exitcond, label %._crit_edge14.us-lcssa.us.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge, %.lr.ph.us.us.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge ], [ %indvars.iv.unr.ph, %.lr.ph.us.us.new.preheader ]
  %191 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv52
  %192 = load double, double* %191, align 8
  %193 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv48
  %194 = load double, double* %193, align 8
  %195 = fmul double %192, %194
  %196 = load double, double* %177, align 8
  %197 = fadd double %196, %195
  store double %197, double* %177, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %198 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv52
  %199 = load double, double* %198, align 8
  %200 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv48
  %201 = load double, double* %200, align 8
  %202 = fmul double %199, %201
  %203 = load double, double* %177, align 8
  %204 = fadd double %203, %202
  store double %204, double* %177, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge

.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge:      ; preds = %.lr.ph.us.us.new
  %pgocount38 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 0)
  %205 = add i64 %pgocount38, 1
  store i64 %205, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 0)
  br label %.lr.ph.us.us.new

.lr.ph16.split:                                   ; preds = %._crit_edge14, %.lr.ph16.split.preheader
  %indvars.iv65 = phi i64 [ 0, %.lr.ph16.split.preheader ], [ %indvars.iv.next66, %._crit_edge14 ]
  %indvars.iv56 = phi i64 [ 1, %.lr.ph16.split.preheader ], [ %indvars.iv.next57, %._crit_edge14 ]
  %206 = sub i64 %167, %indvars.iv65
  %207 = trunc i64 %206 to i32
  %208 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv65
  store double 1.000000e+00, double* %208, align 8
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %209 = icmp slt i64 %indvars.iv.next66, %168
  br i1 %209, label %.lr.ph13.split.preheader, label %.lr.ph16.split.._crit_edge14_crit_edge

.lr.ph16.split.._crit_edge14_crit_edge:           ; preds = %.lr.ph16.split
  %pgocount39 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 14)
  %210 = add i64 %pgocount39, 1
  store i64 %210, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 14)
  br label %._crit_edge14

.lr.ph13.split.preheader:                         ; preds = %.lr.ph16.split
  %pgocount40 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 24)
  %211 = add i64 %pgocount40, 1
  store i64 %211, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 24)
  %212 = sub i64 %165, %indvars.iv65
  %213 = trunc i64 %212 to i32
  %xtraiter63 = and i32 %213, 3
  %lcmp.mod64 = icmp eq i32 %xtraiter63, 0
  br i1 %lcmp.mod64, label %.lr.ph13.split.prol.loopexit, label %.lr.ph13.split.prol.preheader

.lr.ph13.split.prol.preheader:                    ; preds = %.lr.ph13.split.preheader
  br label %.lr.ph13.split.prol

.lr.ph13.split.prol:                              ; preds = %.lr.ph13.split.prol..lr.ph13.split.prol_crit_edge, %.lr.ph13.split.prol.preheader
  %indvars.iv58.prol = phi i64 [ %indvars.iv.next59.prol, %.lr.ph13.split.prol..lr.ph13.split.prol_crit_edge ], [ %indvars.iv56, %.lr.ph13.split.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph13.split.prol..lr.ph13.split.prol_crit_edge ], [ %xtraiter63, %.lr.ph13.split.prol.preheader ]
  %214 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv58.prol
  store double 0.000000e+00, double* %214, align 8
  %215 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv58.prol, i64 %indvars.iv65
  %216 = bitcast double* %215 to i64*
  store i64 0, i64* %216, align 8
  %indvars.iv.next59.prol = add nuw nsw i64 %indvars.iv58.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph13.split.prol.loopexit.loopexit, label %.lr.ph13.split.prol..lr.ph13.split.prol_crit_edge, !llvm.loop !9

.lr.ph13.split.prol..lr.ph13.split.prol_crit_edge: ; preds = %.lr.ph13.split.prol
  %pgocount41 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 6)
  %217 = add i64 %pgocount41, 1
  store i64 %217, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 6)
  br label %.lr.ph13.split.prol

.lr.ph13.split.prol.loopexit.loopexit:            ; preds = %.lr.ph13.split.prol
  %pgocount42 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 25)
  %218 = add i64 %pgocount42, 1
  store i64 %218, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 25)
  br label %.lr.ph13.split.prol.loopexit

.lr.ph13.split.prol.loopexit:                     ; preds = %.lr.ph13.split.prol.loopexit.loopexit, %.lr.ph13.split.preheader
  %indvars.iv58.unr = phi i64 [ %indvars.iv56, %.lr.ph13.split.preheader ], [ %indvars.iv.next59.prol, %.lr.ph13.split.prol.loopexit.loopexit ]
  %219 = icmp ult i32 %207, 3
  br i1 %219, label %._crit_edge14, label %.lr.ph13.split.preheader137

.lr.ph13.split.preheader137:                      ; preds = %.lr.ph13.split.prol.loopexit
  br label %.lr.ph13.split

.lr.ph13.split:                                   ; preds = %.lr.ph13.split..lr.ph13.split_crit_edge, %.lr.ph13.split.preheader137
  %indvars.iv58 = phi i64 [ %indvars.iv.next59.3, %.lr.ph13.split..lr.ph13.split_crit_edge ], [ %indvars.iv58.unr, %.lr.ph13.split.preheader137 ]
  %220 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv58
  store double 0.000000e+00, double* %220, align 8
  %221 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv58, i64 %indvars.iv65
  %222 = bitcast double* %221 to i64*
  store i64 0, i64* %222, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %223 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv.next59
  store double 0.000000e+00, double* %223, align 8
  %224 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next59, i64 %indvars.iv65
  %225 = bitcast double* %224 to i64*
  store i64 0, i64* %225, align 8
  %indvars.iv.next59.1 = add nsw i64 %indvars.iv58, 2
  %226 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv.next59.1
  store double 0.000000e+00, double* %226, align 8
  %227 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next59.1, i64 %indvars.iv65
  %228 = bitcast double* %227 to i64*
  store i64 0, i64* %228, align 8
  %indvars.iv.next59.2 = add nsw i64 %indvars.iv58, 3
  %229 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv.next59.2
  store double 0.000000e+00, double* %229, align 8
  %230 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next59.2, i64 %indvars.iv65
  %231 = bitcast double* %230 to i64*
  store i64 0, i64* %231, align 8
  %indvars.iv.next59.3 = add nsw i64 %indvars.iv58, 4
  %exitcond61.3 = icmp eq i64 %indvars.iv.next59.3, %wide.trip.count60.3
  br i1 %exitcond61.3, label %._crit_edge14.loopexit, label %.lr.ph13.split..lr.ph13.split_crit_edge

.lr.ph13.split..lr.ph13.split_crit_edge:          ; preds = %.lr.ph13.split
  %pgocount43 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 7)
  %232 = add i64 %pgocount43, 1
  store i64 %232, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 7)
  br label %.lr.ph13.split

._crit_edge14.loopexit:                           ; preds = %.lr.ph13.split
  %pgocount44 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 26)
  %233 = add i64 %pgocount44, 1
  store i64 %233, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 26)
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %.lr.ph16.split.._crit_edge14_crit_edge, %._crit_edge14.loopexit, %.lr.ph13.split.prol.loopexit
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next66, %wide.trip.count67
  br i1 %exitcond68, label %._crit_edge17.loopexit138, label %.lr.ph16.split

._crit_edge17.loopexit:                           ; preds = %._crit_edge14.us-lcssa.us.us
  br label %._crit_edge17

._crit_edge17.loopexit138:                        ; preds = %._crit_edge14
  %pgocount45 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 36)
  %234 = add i64 %pgocount45, 1
  store i64 %234, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 36)
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit138, %._crit_edge17.loopexit, %.preheader, %.preheader.thread
  %235 = phi i32 [ %133, %.preheader.thread ], [ %162, %.preheader ], [ %162, %._crit_edge17.loopexit ], [ %162, %._crit_edge17.loopexit138 ]
  %pgocount46 = load i64, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 27)
  %236 = add i64 %pgocount46, 1
  store i64 %236, i64* getelementptr inbounds ([47 x i64], [47 x i64]* @__profc_B.ll_kernel_correlation, i64 0, i64 27)
  %237 = sext i32 %235 to i64
  %238 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %237, i64 %237
  store double 1.000000e+00, double* %238, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
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
  %28 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %29) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #4

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
!7 = distinct !{!7, !8, !4, !5}
!8 = !{!"llvm.loop.unroll.runtime.disable"}
!9 = distinct !{!9, !2}
