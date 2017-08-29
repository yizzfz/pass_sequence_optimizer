; ModuleID = 'B.ll'
source_filename = "jacobi-1d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_jacobi_1d = private constant [21 x i8] c"B.ll:kernel_jacobi_1d"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 32414643582, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 82762904306, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_jacobi_1d = private global [24 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_jacobi_1d = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 3398934233783132561, i64 272318776633, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i32 0, i32 0), i8* null, i8* null, i32 24, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 49239513432, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [61 x i8] c";\00main\01B.ll:init_array\01B.ll:kernel_jacobi_1d\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_jacobi_1d to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([61 x i8], [61 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = bitcast i8* %3 to double*
  %6 = bitcast i8* %4 to double*
  tail call fastcc void @init_array(i32 2000, double* %5, double* %6)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_jacobi_1d(i32 500, i32 2000, double* %5, double* %6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %7 = icmp sgt i32 %0, 42
  br i1 %7, label %8, label %14

; <label>:8:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %10 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %10, align 1
  %11 = icmp eq i8 %strcmpload, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %8
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %13 = add i64 %pgocount1, 1
  store i64 %13, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  tail call fastcc void @print_array(i32 2000, double* %5)
  br label %14

; <label>:14:                                     ; preds = %12, %8, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %15 = add i64 %pgocount2, 1
  store i64 %15, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double* nocapture, double* nocapture) unnamed_addr #2 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %3
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %5 = add i64 %pgocount, 1
  store i64 %5, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %6 = sitofp i32 %0 to double
  %wide.trip.count = zext i32 %0 to i64
  %min.iters.check = icmp eq i32 %0, 1
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %7 = add i64 %pgocount1, 1
  store i64 %7, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %8 = and i32 %0, 1
  %n.mod.vf = zext i32 %8 to i64
  %n.vec = sub nsw i64 %wide.trip.count, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %9 = add i64 %pgocount2, 1
  store i64 %9, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %scevgep = getelementptr double, double* %1, i64 %wide.trip.count
  %scevgep3 = getelementptr double, double* %2, i64 %wide.trip.count
  %bound0 = icmp ugt double* %scevgep3, %1
  %bound1 = icmp ugt double* %scevgep, %2
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %broadcast.splatinsert = insertelement <2 x double> undef, double %6, i32 0
  %broadcast.splat = shufflevector <2 x double> %broadcast.splatinsert, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %vec.ind5 = phi <2 x i32> [ <i32 0, i32 1>, %vector.ph ], [ %vec.ind.next6, %vector.body.vector.body_crit_edge ]
  %10 = sitofp <2 x i32> %vec.ind5 to <2 x double>
  %11 = fadd <2 x double> %10, <double 2.000000e+00, double 2.000000e+00>
  %12 = fdiv <2 x double> %11, %broadcast.splat
  %13 = getelementptr inbounds double, double* %1, i64 %index
  %14 = bitcast double* %13 to <2 x double>*
  store <2 x double> %12, <2 x double>* %14, align 8, !alias.scope !1, !noalias !4
  %15 = fadd <2 x double> %10, <double 3.000000e+00, double 3.000000e+00>
  %16 = fdiv <2 x double> %15, %broadcast.splat
  %17 = getelementptr inbounds double, double* %2, i64 %index
  %18 = bitcast double* %17 to <2 x double>*
  store <2 x double> %16, <2 x double>* %18, align 8, !alias.scope !4
  %index.next = add i64 %index, 2
  %vec.ind.next6 = add <2 x i32> %vec.ind5, <i32 2, i32 2>
  %19 = icmp eq i64 %index.next, %n.vec
  br i1 %19, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !6

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %20 = add i64 %pgocount3, 1
  store i64 %20, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %21 = add i64 %pgocount4, 1
  store i64 %21, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %cmp.n = icmp eq i32 %8, 0
  br i1 %cmp.n, label %._crit_edge, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph ], [ %n.vec, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.scalar.ph_crit_edge, %scalar.ph.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph.scalar.ph_crit_edge ], [ %indvars.iv.ph, %scalar.ph.preheader ]
  %22 = trunc i64 %indvars.iv to i32
  %23 = sitofp i32 %22 to double
  %24 = fadd double %23, 2.000000e+00
  %25 = fdiv double %24, %6
  %26 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  store double %25, double* %26, align 8
  %27 = fadd double %23, 3.000000e+00
  %28 = fdiv double %27, %6
  %29 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  store double %28, double* %29, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit, label %scalar.ph.scalar.ph_crit_edge, !llvm.loop !9

scalar.ph.scalar.ph_crit_edge:                    ; preds = %scalar.ph
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %30 = add i64 %pgocount5, 1
  store i64 %30, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  br label %scalar.ph

._crit_edge.loopexit:                             ; preds = %scalar.ph
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %31 = add i64 %pgocount6, 1
  store i64 %31, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %middle.block, %3
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %32 = add i64 %pgocount7, 1
  store i64 %32, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32, i32, double* nocapture, double* nocapture) unnamed_addr #2 {
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %.preheader2.lr.ph, label %._crit_edge7

.preheader2.lr.ph:                                ; preds = %4
  %6 = add nsw i32 %1, -1
  %7 = icmp sgt i32 %6, 1
  br i1 %7, label %.preheader2.us.preheader, label %.preheader2.preheader

.preheader2.preheader:                            ; preds = %.preheader2.lr.ph
  %8 = add i32 %0, -1
  %xtraiter94 = and i32 %0, 7
  %lcmp.mod95 = icmp eq i32 %xtraiter94, 0
  br i1 %lcmp.mod95, label %.preheader2.prol.loopexit, label %.preheader2.prol.preheader

.preheader2.prol.preheader:                       ; preds = %.preheader2.preheader
  br label %.preheader2.prol

.preheader2.prol:                                 ; preds = %.preheader2.prol..preheader2.prol_crit_edge, %.preheader2.prol.preheader
  %.016.prol = phi i32 [ %9, %.preheader2.prol..preheader2.prol_crit_edge ], [ 0, %.preheader2.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.preheader2.prol..preheader2.prol_crit_edge ], [ %xtraiter94, %.preheader2.prol.preheader ]
  %9 = add nuw nsw i32 %.016.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader2.prol.loopexit.unr-lcssa, label %.preheader2.prol..preheader2.prol_crit_edge, !llvm.loop !10

.preheader2.prol..preheader2.prol_crit_edge:      ; preds = %.preheader2.prol
  %pgocount = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 4)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 4)
  br label %.preheader2.prol

.preheader2.prol.loopexit.unr-lcssa:              ; preds = %.preheader2.prol
  %pgocount1 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 22)
  %11 = add i64 %pgocount1, 1
  store i64 %11, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 22)
  br label %.preheader2.prol.loopexit

.preheader2.prol.loopexit:                        ; preds = %.preheader2.prol.loopexit.unr-lcssa, %.preheader2.preheader
  %.016.unr = phi i32 [ 0, %.preheader2.preheader ], [ %9, %.preheader2.prol.loopexit.unr-lcssa ]
  %12 = icmp ult i32 %8, 7
  br i1 %12, label %._crit_edge7.loopexit93, label %.preheader2.preheader.new

.preheader2.preheader.new:                        ; preds = %.preheader2.prol.loopexit
  br label %.preheader2

.preheader2.us.preheader:                         ; preds = %.preheader2.lr.ph
  %13 = add i32 %1, -2
  %14 = add i32 %1, -3
  %xtraiter = and i32 %13, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %15 = icmp eq i32 %14, 0
  %xtraiter12 = and i32 %13, 1
  %lcmp.mod13 = icmp eq i32 %xtraiter12, 0
  %16 = icmp eq i32 %14, 0
  %wide.trip.count11.1 = zext i32 %6 to i64
  %17 = getelementptr inbounds double, double* %3, i64 1
  %18 = getelementptr inbounds double, double* %3, i64 2
  %19 = getelementptr inbounds double, double* %2, i64 1
  %wide.trip.count.1 = zext i32 %6 to i64
  %20 = getelementptr inbounds double, double* %2, i64 1
  %21 = getelementptr inbounds double, double* %2, i64 2
  %22 = getelementptr inbounds double, double* %3, i64 1
  %23 = add nsw i64 %wide.trip.count11.1, -2
  %scevgep30 = getelementptr double, double* %2, i64 2
  %24 = add nsw i64 %wide.trip.count11.1, -2
  %scevgep33 = getelementptr double, double* %3, i64 -1
  %scevgep36 = getelementptr double, double* %3, i64 3
  %25 = add nsw i64 %wide.trip.count11.1, -2
  %scevgep57 = getelementptr double, double* %3, i64 2
  %26 = add nsw i64 %wide.trip.count11.1, -2
  %scevgep60 = getelementptr double, double* %2, i64 -1
  %scevgep63 = getelementptr double, double* %2, i64 3
  br label %.preheader2.us

.preheader2.us:                                   ; preds = %._crit_edge.us, %.preheader2.us.preheader
  %.016.us = phi i32 [ %69, %._crit_edge.us ], [ 0, %.preheader2.us.preheader ]
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader2.us
  %pgocount2 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 11)
  %27 = add i64 %pgocount2, 1
  store i64 %27, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 11)
  %28 = load double, double* %2, align 8
  %29 = load double, double* %20, align 8
  %30 = fadd double %28, %29
  %31 = load double, double* %21, align 8
  %32 = fadd double %30, %31
  %33 = fmul double %32, 3.333300e-01
  store double %33, double* %22, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader2.us
  %indvars.iv.unr.ph = phi i64 [ 2, %.prol.preheader ], [ 1, %.preheader2.us ]
  br i1 %15, label %.lr.ph5.us.preheader, label %.preheader2.us.new.preheader

.preheader2.us.new.preheader:                     ; preds = %.prol.loopexit
  %pgocount3 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 7)
  %34 = add i64 %pgocount3, 1
  store i64 %34, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 7)
  %35 = sub nsw i64 %25, %indvars.iv.unr.ph
  %36 = lshr i64 %35, 1
  %37 = add nuw i64 %36, 1
  %min.iters.check49 = icmp ult i64 %37, 2
  br i1 %min.iters.check49, label %.preheader2.us.new.preheader92, label %min.iters.checked50

.preheader2.us.new.preheader92:                   ; preds = %middle.block47, %vector.memcheck70, %min.iters.checked50, %.preheader2.us.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr.ph, %vector.memcheck70 ], [ %indvars.iv.unr.ph, %min.iters.checked50 ], [ %indvars.iv.unr.ph, %.preheader2.us.new.preheader ], [ %ind.end75, %middle.block47 ]
  br label %.preheader2.us.new

min.iters.checked50:                              ; preds = %.preheader2.us.new.preheader
  %pgocount4 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 13)
  %38 = add i64 %pgocount4, 1
  store i64 %38, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 13)
  %n.mod.vf51 = and i64 %37, 1
  %n.vec52 = sub i64 %37, %n.mod.vf51
  %cmp.zero53 = icmp eq i64 %n.vec52, 0
  br i1 %cmp.zero53, label %.preheader2.us.new.preheader92, label %vector.memcheck70

vector.memcheck70:                                ; preds = %min.iters.checked50
  %pgocount5 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 15)
  %39 = add i64 %pgocount5, 1
  store i64 %39, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 15)
  %scevgep55 = getelementptr double, double* %3, i64 %indvars.iv.unr.ph
  %40 = sub nsw i64 %26, %indvars.iv.unr.ph
  %41 = and i64 %40, -2
  %42 = add nsw i64 %indvars.iv.unr.ph, %41
  %scevgep58 = getelementptr double, double* %scevgep57, i64 %42
  %scevgep61 = getelementptr double, double* %scevgep60, i64 %indvars.iv.unr.ph
  %scevgep64 = getelementptr double, double* %scevgep63, i64 %42
  %bound066 = icmp ult double* %scevgep55, %scevgep64
  %bound167 = icmp ult double* %scevgep61, %scevgep58
  %memcheck.conflict69 = and i1 %bound066, %bound167
  %43 = add nuw nsw i64 %indvars.iv.unr.ph, 2
  %44 = shl nuw i64 %36, 1
  %45 = add i64 %43, %44
  %46 = shl nuw nsw i64 %n.mod.vf51, 1
  %ind.end75 = sub i64 %45, %46
  br i1 %memcheck.conflict69, label %.preheader2.us.new.preheader92, label %vector.body46.preheader

vector.body46.preheader:                          ; preds = %vector.memcheck70
  br label %vector.body46

vector.body46:                                    ; preds = %vector.body46.vector.body46_crit_edge, %vector.body46.preheader
  %index72 = phi i64 [ %index.next73, %vector.body46.vector.body46_crit_edge ], [ 0, %vector.body46.preheader ]
  %47 = shl i64 %index72, 1
  %offset.idx77 = or i64 %indvars.iv.unr.ph, %47
  %48 = add nsw i64 %offset.idx77, -1
  %49 = getelementptr inbounds double, double* %2, i64 %48
  %50 = bitcast double* %49 to <4 x double>*
  %wide.vec81 = load <4 x double>, <4 x double>* %50, align 8, !alias.scope !12
  %strided.vec82 = shufflevector <4 x double> %wide.vec81, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec83 = shufflevector <4 x double> %wide.vec81, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %51 = fadd <2 x double> %strided.vec82, %strided.vec83
  %52 = add nuw nsw i64 %offset.idx77, 1
  %53 = getelementptr inbounds double, double* %2, i64 %52
  %54 = getelementptr double, double* %53, i64 -1
  %55 = bitcast double* %54 to <4 x double>*
  %wide.vec84 = load <4 x double>, <4 x double>* %55, align 8, !alias.scope !12
  %strided.vec86 = shufflevector <4 x double> %wide.vec84, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %56 = fadd <2 x double> %51, %strided.vec86
  %57 = fmul <2 x double> %56, <double 3.333300e-01, double 3.333300e-01>
  %58 = bitcast double* %53 to <4 x double>*
  %wide.vec87 = load <4 x double>, <4 x double>* %58, align 8, !alias.scope !12
  %strided.vec89 = shufflevector <4 x double> %wide.vec87, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %59 = fadd <4 x double> %wide.vec84, %wide.vec87
  %60 = shufflevector <4 x double> %59, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %61 = fadd <2 x double> %60, %strided.vec89
  %62 = fmul <2 x double> %61, <double 3.333300e-01, double 3.333300e-01>
  %63 = getelementptr inbounds double, double* %3, i64 %52
  %64 = getelementptr double, double* %63, i64 -1
  %65 = bitcast double* %64 to <4 x double>*
  %interleaved.vec90 = shufflevector <2 x double> %57, <2 x double> %62, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec90, <4 x double>* %65, align 8, !alias.scope !15, !noalias !12
  %index.next73 = add i64 %index72, 2
  %66 = icmp eq i64 %index.next73, %n.vec52
  br i1 %66, label %middle.block47, label %vector.body46.vector.body46_crit_edge, !llvm.loop !17

vector.body46.vector.body46_crit_edge:            ; preds = %vector.body46
  %pgocount6 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 2)
  %67 = add i64 %pgocount6, 1
  store i64 %67, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 2)
  br label %vector.body46

middle.block47:                                   ; preds = %vector.body46
  %pgocount7 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 18)
  %68 = add i64 %pgocount7, 1
  store i64 %68, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 18)
  %cmp.n76 = icmp eq i64 %n.mod.vf51, 0
  br i1 %cmp.n76, label %.lr.ph5.us.preheader, label %.preheader2.us.new.preheader92

._crit_edge.us.loopexit:                          ; preds = %.lr.ph5.us
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.lr.ph5.us.prol.loopexit.._crit_edge.us_crit_edge, %middle.block, %._crit_edge.us.loopexit
  %69 = add nuw nsw i32 %.016.us, 1
  %exitcond = icmp eq i32 %69, %0
  br i1 %exitcond, label %._crit_edge7.loopexit, label %.preheader2.us

.lr.ph5.us:                                       ; preds = %.lr.ph5.us..lr.ph5.us_crit_edge, %.lr.ph5.us.preheader91
  %indvars.iv9 = phi i64 [ %indvars.iv.next10.1, %.lr.ph5.us..lr.ph5.us_crit_edge ], [ %indvars.iv9.ph, %.lr.ph5.us.preheader91 ]
  %70 = add nsw i64 %indvars.iv9, -1
  %71 = getelementptr inbounds double, double* %3, i64 %70
  %72 = load double, double* %71, align 8
  %73 = getelementptr inbounds double, double* %3, i64 %indvars.iv9
  %74 = load double, double* %73, align 8
  %75 = fadd double %72, %74
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %76 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next10
  %77 = load double, double* %76, align 8
  %78 = fadd double %75, %77
  %79 = fmul double %78, 3.333300e-01
  %80 = getelementptr inbounds double, double* %2, i64 %indvars.iv9
  store double %79, double* %80, align 8
  %81 = getelementptr inbounds double, double* %3, i64 %indvars.iv9
  %82 = load double, double* %81, align 8
  %83 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next10
  %84 = load double, double* %83, align 8
  %85 = fadd double %82, %84
  %indvars.iv.next10.1 = add nsw i64 %indvars.iv9, 2
  %86 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next10.1
  %87 = load double, double* %86, align 8
  %88 = fadd double %85, %87
  %89 = fmul double %88, 3.333300e-01
  %90 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next10
  store double %89, double* %90, align 8
  %exitcond.115 = icmp eq i64 %indvars.iv.next10.1, %wide.trip.count11.1
  br i1 %exitcond.115, label %._crit_edge.us.loopexit, label %.lr.ph5.us..lr.ph5.us_crit_edge, !llvm.loop !18

.lr.ph5.us..lr.ph5.us_crit_edge:                  ; preds = %.lr.ph5.us
  %pgocount8 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 0)
  %91 = add i64 %pgocount8, 1
  store i64 %91, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 0)
  br label %.lr.ph5.us

.preheader2.us.new:                               ; preds = %.preheader2.us.new..preheader2.us.new_crit_edge, %.preheader2.us.new.preheader92
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader2.us.new..preheader2.us.new_crit_edge ], [ %indvars.iv.ph, %.preheader2.us.new.preheader92 ]
  %92 = add nsw i64 %indvars.iv, -1
  %93 = getelementptr inbounds double, double* %2, i64 %92
  %94 = load double, double* %93, align 8
  %95 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %96 = load double, double* %95, align 8
  %97 = fadd double %94, %96
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %98 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %99 = load double, double* %98, align 8
  %100 = fadd double %97, %99
  %101 = fmul double %100, 3.333300e-01
  %102 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  store double %101, double* %102, align 8
  %103 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %104 = load double, double* %103, align 8
  %105 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %106 = load double, double* %105, align 8
  %107 = fadd double %104, %106
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %108 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.1
  %109 = load double, double* %108, align 8
  %110 = fadd double %107, %109
  %111 = fmul double %110, 3.333300e-01
  %112 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next
  store double %111, double* %112, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %.lr.ph5.us.preheader.loopexit, label %.preheader2.us.new..preheader2.us.new_crit_edge, !llvm.loop !19

.preheader2.us.new..preheader2.us.new_crit_edge:  ; preds = %.preheader2.us.new
  %pgocount9 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 1)
  %113 = add i64 %pgocount9, 1
  store i64 %113, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 1)
  br label %.preheader2.us.new

.lr.ph5.us.preheader.loopexit:                    ; preds = %.preheader2.us.new
  %pgocount10 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 9)
  %114 = add i64 %pgocount10, 1
  store i64 %114, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 9)
  br label %.lr.ph5.us.preheader

.lr.ph5.us.preheader:                             ; preds = %.lr.ph5.us.preheader.loopexit, %middle.block47, %.prol.loopexit
  br i1 %lcmp.mod13, label %.lr.ph5.us.prol.loopexit, label %.lr.ph5.us.prol

.lr.ph5.us.prol:                                  ; preds = %.lr.ph5.us.preheader
  %pgocount11 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 12)
  %115 = add i64 %pgocount11, 1
  store i64 %115, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 12)
  %116 = load double, double* %3, align 8
  %117 = load double, double* %17, align 8
  %118 = fadd double %116, %117
  %119 = load double, double* %18, align 8
  %120 = fadd double %118, %119
  %121 = fmul double %120, 3.333300e-01
  store double %121, double* %19, align 8
  br label %.lr.ph5.us.prol.loopexit

.lr.ph5.us.prol.loopexit:                         ; preds = %.lr.ph5.us.prol, %.lr.ph5.us.preheader
  %indvars.iv9.unr.ph = phi i64 [ 2, %.lr.ph5.us.prol ], [ 1, %.lr.ph5.us.preheader ]
  br i1 %16, label %.lr.ph5.us.prol.loopexit.._crit_edge.us_crit_edge, label %.lr.ph5.us.preheader26

.lr.ph5.us.prol.loopexit.._crit_edge.us_crit_edge: ; preds = %.lr.ph5.us.prol.loopexit
  %pgocount12 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 6)
  %122 = add i64 %pgocount12, 1
  store i64 %122, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 6)
  br label %._crit_edge.us

.lr.ph5.us.preheader26:                           ; preds = %.lr.ph5.us.prol.loopexit
  %pgocount13 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 8)
  %123 = add i64 %pgocount13, 1
  store i64 %123, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 8)
  %124 = sub nsw i64 %23, %indvars.iv9.unr.ph
  %125 = lshr i64 %124, 1
  %126 = add nuw i64 %125, 1
  %min.iters.check = icmp ult i64 %126, 2
  br i1 %min.iters.check, label %.lr.ph5.us.preheader91, label %min.iters.checked

.lr.ph5.us.preheader91:                           ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph5.us.preheader26
  %indvars.iv9.ph = phi i64 [ %indvars.iv9.unr.ph, %vector.memcheck ], [ %indvars.iv9.unr.ph, %min.iters.checked ], [ %indvars.iv9.unr.ph, %.lr.ph5.us.preheader26 ], [ %ind.end, %middle.block ]
  %pgocount14 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 10)
  %127 = add i64 %pgocount14, 1
  store i64 %127, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 10)
  br label %.lr.ph5.us

min.iters.checked:                                ; preds = %.lr.ph5.us.preheader26
  %pgocount15 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 14)
  %128 = add i64 %pgocount15, 1
  store i64 %128, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 14)
  %n.mod.vf = and i64 %126, 1
  %n.vec = sub i64 %126, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.lr.ph5.us.preheader91, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %pgocount16 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 16)
  %129 = add i64 %pgocount16, 1
  store i64 %129, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 16)
  %scevgep = getelementptr double, double* %2, i64 %indvars.iv9.unr.ph
  %130 = sub nsw i64 %24, %indvars.iv9.unr.ph
  %131 = and i64 %130, -2
  %132 = add nsw i64 %indvars.iv9.unr.ph, %131
  %scevgep31 = getelementptr double, double* %scevgep30, i64 %132
  %scevgep34 = getelementptr double, double* %scevgep33, i64 %indvars.iv9.unr.ph
  %scevgep37 = getelementptr double, double* %scevgep36, i64 %132
  %bound0 = icmp ult double* %scevgep, %scevgep37
  %bound1 = icmp ult double* %scevgep34, %scevgep31
  %memcheck.conflict = and i1 %bound0, %bound1
  %133 = add nuw nsw i64 %indvars.iv9.unr.ph, 2
  %134 = shl nuw i64 %125, 1
  %135 = add i64 %133, %134
  %136 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %135, %136
  br i1 %memcheck.conflict, label %.lr.ph5.us.preheader91, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %137 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv9.unr.ph, %137
  %138 = add nsw i64 %offset.idx, -1
  %139 = getelementptr inbounds double, double* %3, i64 %138
  %140 = bitcast double* %139 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %140, align 8, !alias.scope !20
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec39 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %141 = fadd <2 x double> %strided.vec, %strided.vec39
  %142 = add nuw nsw i64 %offset.idx, 1
  %143 = getelementptr inbounds double, double* %3, i64 %142
  %144 = getelementptr double, double* %143, i64 -1
  %145 = bitcast double* %144 to <4 x double>*
  %wide.vec40 = load <4 x double>, <4 x double>* %145, align 8, !alias.scope !20
  %strided.vec42 = shufflevector <4 x double> %wide.vec40, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %146 = fadd <2 x double> %141, %strided.vec42
  %147 = fmul <2 x double> %146, <double 3.333300e-01, double 3.333300e-01>
  %148 = bitcast double* %143 to <4 x double>*
  %wide.vec43 = load <4 x double>, <4 x double>* %148, align 8, !alias.scope !20
  %strided.vec45 = shufflevector <4 x double> %wide.vec43, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %149 = fadd <4 x double> %wide.vec40, %wide.vec43
  %150 = shufflevector <4 x double> %149, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %151 = fadd <2 x double> %150, %strided.vec45
  %152 = fmul <2 x double> %151, <double 3.333300e-01, double 3.333300e-01>
  %153 = getelementptr inbounds double, double* %2, i64 %142
  %154 = getelementptr double, double* %153, i64 -1
  %155 = bitcast double* %154 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %147, <2 x double> %152, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %155, align 8, !alias.scope !23, !noalias !20
  %index.next = add i64 %index, 2
  %156 = icmp eq i64 %index.next, %n.vec
  br i1 %156, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !25

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  %pgocount17 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 3)
  %157 = add i64 %pgocount17, 1
  store i64 %157, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 3)
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %pgocount18 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 19)
  %158 = add i64 %pgocount18, 1
  store i64 %158, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 19)
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge.us, label %.lr.ph5.us.preheader91

.preheader2:                                      ; preds = %.preheader2..preheader2_crit_edge, %.preheader2.preheader.new
  %.016 = phi i32 [ %.016.unr, %.preheader2.preheader.new ], [ %159, %.preheader2..preheader2_crit_edge ]
  %159 = add nsw i32 %.016, 8
  %exitcond22.7 = icmp eq i32 %159, %0
  br i1 %exitcond22.7, label %._crit_edge7.loopexit93.unr-lcssa, label %.preheader2..preheader2_crit_edge

.preheader2..preheader2_crit_edge:                ; preds = %.preheader2
  %pgocount19 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 5)
  %160 = add i64 %pgocount19, 1
  store i64 %160, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 5)
  br label %.preheader2

._crit_edge7.loopexit:                            ; preds = %._crit_edge.us
  %pgocount20 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 21)
  %161 = add i64 %pgocount20, 1
  store i64 %161, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 21)
  br label %._crit_edge7

._crit_edge7.loopexit93.unr-lcssa:                ; preds = %.preheader2
  %pgocount21 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 23)
  %162 = add i64 %pgocount21, 1
  store i64 %162, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 23)
  br label %._crit_edge7.loopexit93

._crit_edge7.loopexit93:                          ; preds = %._crit_edge7.loopexit93.unr-lcssa, %.preheader2.prol.loopexit
  %pgocount22 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 20)
  %163 = add i64 %pgocount22, 1
  store i64 %163, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 20)
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit93, %._crit_edge7.loopexit, %4
  %pgocount23 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 17)
  %164 = add i64 %pgocount23, 1
  store i64 %164, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_kernel_jacobi_1d, i64 0, i64 17)
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
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
!10 = distinct !{!10, !11}
!11 = !{!"llvm.loop.unroll.disable"}
!12 = !{!13}
!13 = distinct !{!13, !14}
!14 = distinct !{!14, !"LVerDomain"}
!15 = !{!16}
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !7, !8}
!18 = distinct !{!18, !7, !8}
!19 = distinct !{!19, !7, !8}
!20 = !{!21}
!21 = distinct !{!21, !22}
!22 = distinct !{!22, !"LVerDomain"}
!23 = !{!24}
!24 = distinct !{!24, !22}
!25 = distinct !{!25, !7, !8}
