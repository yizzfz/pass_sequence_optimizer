; ModuleID = 'B.ll'
source_filename = "jacobi-2d.c"
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
@__profn_B.ll_kernel_jacobi_2d = private constant [21 x i8] c"B.ll:kernel_jacobi_2d"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 32414643582, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 48841616810, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_jacobi_2d = private global [19 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_jacobi_2d = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 9078208458297787858, i64 213132667004, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i32 0, i32 0), i8* null, i8* null, i32 19, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 63976198547, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [61 x i8] c";\00main\01B.ll:init_array\01B.ll:kernel_jacobi_2d\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_jacobi_2d to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([61 x i8], [61 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %5 = bitcast i8* %3 to [1300 x double]*
  %6 = bitcast i8* %4 to [1300 x double]*
  tail call fastcc void @init_array(i32 1300, [1300 x double]* %5, [1300 x double]* %6)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_jacobi_2d(i32 500, i32 1300, [1300 x double]* %5, [1300 x double]* %6)
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
  tail call fastcc void @print_array(i32 1300, [1300 x double]* %5)
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
define internal fastcc void @init_array(i32, [1300 x double]* nocapture, [1300 x double]* nocapture) unnamed_addr #2 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.preheader.lr.ph, label %._crit_edge4

.preheader.lr.ph:                                 ; preds = %3
  %5 = sitofp i32 %0 to double
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count7 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %._crit_edge.us ], [ 0, %.preheader.lr.ph ]
  %6 = trunc i64 %indvars.iv5 to i32
  %7 = sitofp i32 %6 to double
  br label %8

; <label>:8:                                      ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %9 = add nuw nsw i64 %indvars.iv, 2
  %10 = trunc i64 %9 to i32
  %11 = sitofp i32 %10 to double
  %12 = fmul double %7, %11
  %13 = fadd double %12, 2.000000e+00
  %14 = fdiv double %13, %5
  %15 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  store double %14, double* %15, align 8
  %16 = add nuw nsw i64 %indvars.iv, 3
  %17 = trunc i64 %16 to i32
  %18 = sitofp i32 %17 to double
  %19 = fmul double %7, %18
  %20 = fadd double %19, 3.000000e+00
  %21 = fdiv double %20, %5
  %22 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv5, i64 %indvars.iv
  store double %21, double* %22, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge:                                      ; preds = %8
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %23 = add i64 %pgocount, 1
  store i64 %23, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  br label %8

._crit_edge.us:                                   ; preds = %8
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %24 = add i64 %pgocount1, 1
  store i64 %24, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, %wide.trip.count7
  br i1 %exitcond8, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %25 = add i64 %pgocount2, 1
  store i64 %25, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %3
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %26 = add i64 %pgocount3, 1
  store i64 %26, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_2d(i32, i32, [1300 x double]* nocapture, [1300 x double]* nocapture) unnamed_addr #2 {
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %.preheader6.lr.ph, label %._crit_edge15

.preheader6.lr.ph:                                ; preds = %4
  %6 = add nsw i32 %1, -1
  %7 = icmp sgt i32 %6, 1
  %wide.trip.count18 = zext i32 %6 to i64
  %wide.trip.count = zext i32 %6 to i64
  %8 = icmp sgt i32 %6, 1
  %wide.trip.count26 = zext i32 %6 to i64
  %wide.trip.count22 = zext i32 %6 to i64
  %9 = add nsw i64 %wide.trip.count22, -1
  %min.iters.check49 = icmp ult i64 %9, 4
  %n.vec52 = and i64 %9, -4
  %cmp.zero53 = icmp eq i64 %n.vec52, 0
  %ind.end74 = or i64 %n.vec52, 1
  %cmp.n75 = icmp eq i64 %9, %n.vec52
  %min.iters.check = icmp ult i64 %9, 4
  %n.vec = and i64 %9, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %n.vec, 1
  %cmp.n = icmp eq i64 %9, %n.vec
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge13, %.preheader6.lr.ph
  %.0314 = phi i32 [ 0, %.preheader6.lr.ph ], [ %141, %._crit_edge13 ]
  br i1 %7, label %.preheader4.us.preheader, label %.preheader6.._crit_edge13_crit_edge

.preheader6.._crit_edge13_crit_edge:              ; preds = %.preheader6
  %pgocount = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 6)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 6)
  br label %._crit_edge13

.preheader4.us.preheader:                         ; preds = %.preheader6
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge.us, %.preheader4.us.preheader
  %indvar55 = phi i64 [ %indvar.next56, %._crit_edge.us ], [ 0, %.preheader4.us.preheader ]
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %._crit_edge.us ], [ 1, %.preheader4.us.preheader ]
  %11 = add i64 %indvar55, 1
  %scevgep57 = getelementptr [1300 x double], [1300 x double]* %3, i64 %11, i64 1
  %scevgep59 = getelementptr [1300 x double], [1300 x double]* %3, i64 %11, i64 %wide.trip.count22
  %scevgep61 = getelementptr [1300 x double], [1300 x double]* %2, i64 %indvar55, i64 1
  %12 = add i64 %indvar55, 2
  %scevgep63 = getelementptr [1300 x double], [1300 x double]* %2, i64 %12, i64 %wide.trip.count22
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %13 = add nsw i64 %indvars.iv16, -1
  br i1 %min.iters.check49, label %scalar.ph48.preheader, label %min.iters.checked50

min.iters.checked50:                              ; preds = %.preheader4.us
  %pgocount1 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 8)
  %14 = add i64 %pgocount1, 1
  store i64 %14, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 8)
  br i1 %cmp.zero53, label %scalar.ph48.preheader, label %vector.memcheck69

vector.memcheck69:                                ; preds = %min.iters.checked50
  %pgocount2 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 10)
  %15 = add i64 %pgocount2, 1
  store i64 %15, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 10)
  %bound065 = icmp ult double* %scevgep57, %scevgep63
  %bound166 = icmp ult double* %scevgep61, %scevgep59
  %memcheck.conflict68 = and i1 %bound065, %bound166
  br i1 %memcheck.conflict68, label %scalar.ph48.preheader, label %vector.body46.preheader

vector.body46.preheader:                          ; preds = %vector.memcheck69
  br label %vector.body46

vector.body46:                                    ; preds = %vector.body46.vector.body46_crit_edge, %vector.body46.preheader
  %index71 = phi i64 [ %index.next72, %vector.body46.vector.body46_crit_edge ], [ 0, %vector.body46.preheader ]
  %offset.idx76 = or i64 %index71, 1
  %16 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv16, i64 %offset.idx76
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load81 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = getelementptr double, double* %16, i64 2
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load82 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !1
  %20 = add nsw i64 %offset.idx76, -1
  %21 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv16, i64 %20
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !1
  %23 = getelementptr double, double* %21, i64 2
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load84 = load <2 x double>, <2 x double>* %24, align 8, !alias.scope !1
  %25 = fadd <2 x double> %wide.load81, %wide.load83
  %26 = fadd <2 x double> %wide.load82, %wide.load84
  %27 = add nuw nsw i64 %offset.idx76, 1
  %28 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv16, i64 %27
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load85 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !1
  %30 = getelementptr double, double* %28, i64 2
  %31 = bitcast double* %30 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %31, align 8, !alias.scope !1
  %32 = fadd <2 x double> %25, %wide.load85
  %33 = fadd <2 x double> %26, %wide.load86
  %34 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv.next17, i64 %offset.idx76
  %35 = bitcast double* %34 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %35, align 8, !alias.scope !1
  %36 = getelementptr double, double* %34, i64 2
  %37 = bitcast double* %36 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %37, align 8, !alias.scope !1
  %38 = fadd <2 x double> %32, %wide.load87
  %39 = fadd <2 x double> %33, %wide.load88
  %40 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %13, i64 %offset.idx76
  %41 = bitcast double* %40 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %41, align 8, !alias.scope !1
  %42 = getelementptr double, double* %40, i64 2
  %43 = bitcast double* %42 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %43, align 8, !alias.scope !1
  %44 = fadd <2 x double> %38, %wide.load89
  %45 = fadd <2 x double> %39, %wide.load90
  %46 = fmul <2 x double> %44, <double 2.000000e-01, double 2.000000e-01>
  %47 = fmul <2 x double> %45, <double 2.000000e-01, double 2.000000e-01>
  %48 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv16, i64 %offset.idx76
  %49 = bitcast double* %48 to <2 x double>*
  store <2 x double> %46, <2 x double>* %49, align 8, !alias.scope !4, !noalias !1
  %50 = getelementptr double, double* %48, i64 2
  %51 = bitcast double* %50 to <2 x double>*
  store <2 x double> %47, <2 x double>* %51, align 8, !alias.scope !4, !noalias !1
  %index.next72 = add i64 %index71, 4
  %52 = icmp eq i64 %index.next72, %n.vec52
  br i1 %52, label %middle.block47, label %vector.body46.vector.body46_crit_edge, !llvm.loop !6

vector.body46.vector.body46_crit_edge:            ; preds = %vector.body46
  %pgocount3 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 2)
  %53 = add i64 %pgocount3, 1
  store i64 %53, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 2)
  br label %vector.body46

middle.block47:                                   ; preds = %vector.body46
  %pgocount4 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 12)
  %54 = add i64 %pgocount4, 1
  store i64 %54, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 12)
  br i1 %cmp.n75, label %._crit_edge.us, label %middle.block47.scalar.ph48.preheader_crit_edge

middle.block47.scalar.ph48.preheader_crit_edge:   ; preds = %middle.block47
  %pgocount5 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 4)
  %55 = add i64 %pgocount5, 1
  store i64 %55, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 4)
  br label %scalar.ph48.preheader

scalar.ph48.preheader:                            ; preds = %middle.block47.scalar.ph48.preheader_crit_edge, %vector.memcheck69, %min.iters.checked50, %.preheader4.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck69 ], [ 1, %min.iters.checked50 ], [ 1, %.preheader4.us ], [ %ind.end74, %middle.block47.scalar.ph48.preheader_crit_edge ]
  br label %scalar.ph48

scalar.ph48:                                      ; preds = %scalar.ph48.scalar.ph48_crit_edge, %scalar.ph48.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph48.scalar.ph48_crit_edge ], [ %indvars.iv.ph, %scalar.ph48.preheader ]
  %56 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv
  %57 = load double, double* %56, align 8
  %58 = add nsw i64 %indvars.iv, -1
  %59 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv16, i64 %58
  %60 = load double, double* %59, align 8
  %61 = fadd double %57, %60
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %62 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv.next
  %63 = load double, double* %62, align 8
  %64 = fadd double %61, %63
  %65 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv.next17, i64 %indvars.iv
  %66 = load double, double* %65, align 8
  %67 = fadd double %64, %66
  %68 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %13, i64 %indvars.iv
  %69 = load double, double* %68, align 8
  %70 = fadd double %67, %69
  %71 = fmul double %70, 2.000000e-01
  %72 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv16, i64 %indvars.iv
  store double %71, double* %72, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.loopexit, label %scalar.ph48.scalar.ph48_crit_edge, !llvm.loop !9

scalar.ph48.scalar.ph48_crit_edge:                ; preds = %scalar.ph48
  %pgocount6 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 0)
  %73 = add i64 %pgocount6, 1
  store i64 %73, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 0)
  br label %scalar.ph48

._crit_edge.us.loopexit:                          ; preds = %scalar.ph48
  %pgocount7 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 7)
  %74 = add i64 %pgocount7, 1
  store i64 %74, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 7)
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block47
  %exitcond19 = icmp eq i64 %indvars.iv.next17, %wide.trip.count18
  %indvar.next56 = add i64 %indvar55, 1
  br i1 %exitcond19, label %.preheader5, label %.preheader4.us

.preheader5:                                      ; preds = %._crit_edge.us
  %pgocount8 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 15)
  %75 = add i64 %pgocount8, 1
  store i64 %75, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 15)
  br i1 %8, label %.preheader.us.preheader, label %._crit_edge13

.preheader.us.preheader:                          ; preds = %.preheader5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge11.us, %.preheader.us.preheader
  %indvar = phi i64 [ %indvar.next, %._crit_edge11.us ], [ 0, %.preheader.us.preheader ]
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %._crit_edge11.us ], [ 1, %.preheader.us.preheader ]
  %76 = add i64 %indvar, 1
  %scevgep = getelementptr [1300 x double], [1300 x double]* %2, i64 %76, i64 1
  %scevgep30 = getelementptr [1300 x double], [1300 x double]* %2, i64 %76, i64 %wide.trip.count22
  %scevgep32 = getelementptr [1300 x double], [1300 x double]* %3, i64 %indvar, i64 1
  %77 = add i64 %indvar, 2
  %scevgep34 = getelementptr [1300 x double], [1300 x double]* %3, i64 %77, i64 %wide.trip.count22
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %78 = add nsw i64 %indvars.iv24, -1
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  %pgocount9 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 11)
  %79 = add i64 %pgocount9, 1
  store i64 %79, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 11)
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %pgocount10 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 13)
  %80 = add i64 %pgocount10, 1
  store i64 %80, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 13)
  %bound0 = icmp ult double* %scevgep, %scevgep34
  %bound1 = icmp ult double* %scevgep32, %scevgep30
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %81 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv24, i64 %offset.idx
  %82 = bitcast double* %81 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %82, align 8, !alias.scope !10
  %83 = getelementptr double, double* %81, i64 2
  %84 = bitcast double* %83 to <2 x double>*
  %wide.load37 = load <2 x double>, <2 x double>* %84, align 8, !alias.scope !10
  %85 = add nsw i64 %offset.idx, -1
  %86 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv24, i64 %85
  %87 = bitcast double* %86 to <2 x double>*
  %wide.load38 = load <2 x double>, <2 x double>* %87, align 8, !alias.scope !10
  %88 = getelementptr double, double* %86, i64 2
  %89 = bitcast double* %88 to <2 x double>*
  %wide.load39 = load <2 x double>, <2 x double>* %89, align 8, !alias.scope !10
  %90 = fadd <2 x double> %wide.load, %wide.load38
  %91 = fadd <2 x double> %wide.load37, %wide.load39
  %92 = add nuw nsw i64 %offset.idx, 1
  %93 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv24, i64 %92
  %94 = bitcast double* %93 to <2 x double>*
  %wide.load40 = load <2 x double>, <2 x double>* %94, align 8, !alias.scope !10
  %95 = getelementptr double, double* %93, i64 2
  %96 = bitcast double* %95 to <2 x double>*
  %wide.load41 = load <2 x double>, <2 x double>* %96, align 8, !alias.scope !10
  %97 = fadd <2 x double> %90, %wide.load40
  %98 = fadd <2 x double> %91, %wide.load41
  %99 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv.next25, i64 %offset.idx
  %100 = bitcast double* %99 to <2 x double>*
  %wide.load42 = load <2 x double>, <2 x double>* %100, align 8, !alias.scope !10
  %101 = getelementptr double, double* %99, i64 2
  %102 = bitcast double* %101 to <2 x double>*
  %wide.load43 = load <2 x double>, <2 x double>* %102, align 8, !alias.scope !10
  %103 = fadd <2 x double> %97, %wide.load42
  %104 = fadd <2 x double> %98, %wide.load43
  %105 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %78, i64 %offset.idx
  %106 = bitcast double* %105 to <2 x double>*
  %wide.load44 = load <2 x double>, <2 x double>* %106, align 8, !alias.scope !10
  %107 = getelementptr double, double* %105, i64 2
  %108 = bitcast double* %107 to <2 x double>*
  %wide.load45 = load <2 x double>, <2 x double>* %108, align 8, !alias.scope !10
  %109 = fadd <2 x double> %103, %wide.load44
  %110 = fadd <2 x double> %104, %wide.load45
  %111 = fmul <2 x double> %109, <double 2.000000e-01, double 2.000000e-01>
  %112 = fmul <2 x double> %110, <double 2.000000e-01, double 2.000000e-01>
  %113 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv24, i64 %offset.idx
  %114 = bitcast double* %113 to <2 x double>*
  store <2 x double> %111, <2 x double>* %114, align 8, !alias.scope !13, !noalias !10
  %115 = getelementptr double, double* %113, i64 2
  %116 = bitcast double* %115 to <2 x double>*
  store <2 x double> %112, <2 x double>* %116, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 4
  %117 = icmp eq i64 %index.next, %n.vec
  br i1 %117, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !15

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  %pgocount11 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 3)
  %118 = add i64 %pgocount11, 1
  store i64 %118, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 3)
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %pgocount12 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 14)
  %119 = add i64 %pgocount12, 1
  store i64 %119, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 14)
  br i1 %cmp.n, label %._crit_edge11.us, label %middle.block.scalar.ph.preheader_crit_edge

middle.block.scalar.ph.preheader_crit_edge:       ; preds = %middle.block
  %pgocount13 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 5)
  %120 = add i64 %pgocount13, 1
  store i64 %120, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 5)
  br label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block.scalar.ph.preheader_crit_edge, %vector.memcheck, %min.iters.checked, %.preheader.us
  %indvars.iv20.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.preheader.us ], [ %ind.end, %middle.block.scalar.ph.preheader_crit_edge ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.scalar.ph_crit_edge, %scalar.ph.preheader
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %scalar.ph.scalar.ph_crit_edge ], [ %indvars.iv20.ph, %scalar.ph.preheader ]
  %121 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv24, i64 %indvars.iv20
  %122 = load double, double* %121, align 8
  %123 = add nsw i64 %indvars.iv20, -1
  %124 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv24, i64 %123
  %125 = load double, double* %124, align 8
  %126 = fadd double %122, %125
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %127 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv24, i64 %indvars.iv.next21
  %128 = load double, double* %127, align 8
  %129 = fadd double %126, %128
  %130 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv.next25, i64 %indvars.iv20
  %131 = load double, double* %130, align 8
  %132 = fadd double %129, %131
  %133 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %78, i64 %indvars.iv20
  %134 = load double, double* %133, align 8
  %135 = fadd double %132, %134
  %136 = fmul double %135, 2.000000e-01
  %137 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv24, i64 %indvars.iv20
  store double %136, double* %137, align 8
  %exitcond23 = icmp eq i64 %indvars.iv.next21, %wide.trip.count22
  br i1 %exitcond23, label %._crit_edge11.us.loopexit, label %scalar.ph.scalar.ph_crit_edge, !llvm.loop !16

scalar.ph.scalar.ph_crit_edge:                    ; preds = %scalar.ph
  %pgocount14 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 1)
  %138 = add i64 %pgocount14, 1
  store i64 %138, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 1)
  br label %scalar.ph

._crit_edge11.us.loopexit:                        ; preds = %scalar.ph
  %pgocount15 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 9)
  %139 = add i64 %pgocount15, 1
  store i64 %139, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 9)
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us.loopexit, %middle.block
  %exitcond27 = icmp eq i64 %indvars.iv.next25, %wide.trip.count26
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond27, label %._crit_edge13.loopexit, label %.preheader.us

._crit_edge13.loopexit:                           ; preds = %._crit_edge11.us
  %pgocount16 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 16)
  %140 = add i64 %pgocount16, 1
  store i64 %140, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 16)
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %.preheader6.._crit_edge13_crit_edge, %._crit_edge13.loopexit, %.preheader5
  %141 = add nuw nsw i32 %.0314, 1
  %exitcond28 = icmp eq i32 %141, %0
  br i1 %exitcond28, label %._crit_edge15.loopexit, label %.preheader6

._crit_edge15.loopexit:                           ; preds = %._crit_edge13
  %pgocount17 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 18)
  %142 = add i64 %pgocount17, 1
  store i64 %142, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 18)
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %4
  %pgocount18 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 17)
  %143 = add i64 %pgocount18, 1
  store i64 %143, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 17)
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1300 x double]* nocapture readonly) unnamed_addr #0 {
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
  %21 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}
