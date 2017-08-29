; ModuleID = 'B.ll'
source_filename = "heat-3d.c"
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
@__profn_B.ll_kernel_heat_3d = private constant [19 x i8] c"B.ll:kernel_heat_3d"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 32414643582, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 88325942582, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_heat_3d = private global [21 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_heat_3d = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2431518469571330303, i64 240297135670, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i32 0, i32 0), i8* null, i8* null, i32 21, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 73601809215, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [59 x i8] c"9\00main\01B.ll:init_array\01B.ll:kernel_heat_3d\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_heat_3d to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([59 x i8], [59 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %5 = bitcast i8* %3 to [120 x [120 x double]]*
  %6 = bitcast i8* %4 to [120 x [120 x double]]*
  tail call fastcc void @init_array(i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_heat_3d(i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
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
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %5)
  br label %14

; <label>:14:                                     ; preds = %12, %8, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %15 = add i64 %pgocount2, 1
  store i64 %15, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.preheader3.lr.ph, label %._crit_edge8

.preheader3.lr.ph:                                ; preds = %3
  %5 = sitofp i32 %0 to double
  %xtraiter = and i32 %0, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %6 = icmp eq i32 %0, 1
  %wide.trip.count20 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %0 to i64
  %wide.trip.count23 = zext i32 %0 to i64
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %._crit_edge6.us, %.preheader3.lr.ph
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %._crit_edge6.us ], [ 0, %.preheader3.lr.ph ]
  %7 = trunc i64 %indvars.iv21 to i32
  %8 = add i32 %7, %0
  br label %.preheader.us.us

._crit_edge6.us:                                  ; preds = %._crit_edge.us.us
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next22, %wide.trip.count23
  br i1 %exitcond24, label %._crit_edge8.loopexit, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv18 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next19, %._crit_edge.us.us ]
  %10 = trunc i64 %indvars.iv18 to i32
  %11 = add i32 %8, %10
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us.us
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %12 = add i64 %pgocount1, 1
  store i64 %12, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %13 = sitofp i32 %11 to double
  %14 = fmul double %13, 1.000000e+01
  %15 = fdiv double %14, %5
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv21, i64 %indvars.iv18, i64 0
  store double %15, double* %16, align 8
  %17 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv21, i64 %indvars.iv18, i64 0
  store double %15, double* %17, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us.us ]
  br i1 %6, label %.prol.loopexit.._crit_edge.us.us_crit_edge, label %.preheader.us.us.new.preheader

.prol.loopexit.._crit_edge.us.us_crit_edge:       ; preds = %.prol.loopexit
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %18 = add i64 %pgocount2, 1
  store i64 %18, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  br label %._crit_edge.us.us

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.preheader.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %19 = add i64 %pgocount3, 1
  store i64 %19, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %.prol.loopexit.._crit_edge.us.us_crit_edge, %._crit_edge.us.us.loopexit
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond = icmp eq i64 %indvars.iv.next19, %wide.trip.count20
  br i1 %exitcond, label %._crit_edge6.us, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new..preheader.us.us.new_crit_edge, %.preheader.us.us.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.us.new..preheader.us.us.new_crit_edge ], [ %indvars.iv.unr.ph, %.preheader.us.us.new.preheader ]
  %20 = trunc i64 %indvars.iv to i32
  %21 = sub i32 %11, %20
  %22 = sitofp i32 %21 to double
  %23 = fmul double %22, 1.000000e+01
  %24 = fdiv double %23, %5
  %25 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv21, i64 %indvars.iv18, i64 %indvars.iv
  store double %24, double* %25, align 8
  %26 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv21, i64 %indvars.iv18, i64 %indvars.iv
  store double %24, double* %26, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %27 = trunc i64 %indvars.iv.next to i32
  %28 = sub i32 %11, %27
  %29 = sitofp i32 %28 to double
  %30 = fmul double %29, 1.000000e+01
  %31 = fdiv double %30, %5
  %32 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv21, i64 %indvars.iv18, i64 %indvars.iv.next
  store double %31, double* %32, align 8
  %33 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv21, i64 %indvars.iv18, i64 %indvars.iv.next
  store double %31, double* %33, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new..preheader.us.us.new_crit_edge

.preheader.us.us.new..preheader.us.us.new_crit_edge: ; preds = %.preheader.us.us.new
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %34 = add i64 %pgocount4, 1
  store i64 %34, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  br label %.preheader.us.us.new

._crit_edge8.loopexit:                            ; preds = %._crit_edge6.us
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %35 = add i64 %pgocount5, 1
  store i64 %35, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %3
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %36 = add i64 %pgocount6, 1
  store i64 %36, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32, [120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  %4 = add nsw i32 %0, -1
  %5 = icmp sgt i32 %4, 1
  %6 = icmp sgt i32 %4, 1
  %wide.trip.count20 = zext i32 %4 to i64
  %wide.trip.count = zext i32 %4 to i64
  %wide.trip.count24 = zext i32 %4 to i64
  %7 = icmp sgt i32 %4, 1
  %wide.trip.count32 = zext i32 %4 to i64
  %wide.trip.count28 = zext i32 %4 to i64
  %wide.trip.count36 = zext i32 %4 to i64
  %8 = add nsw i64 %wide.trip.count28, -1
  %min.iters.check57 = icmp ult i64 %8, 2
  %n.vec60 = and i64 %8, -2
  %cmp.zero61 = icmp eq i64 %n.vec60, 0
  %ind.end84 = or i64 %8, 1
  %cmp.n85 = icmp eq i64 %8, %n.vec60
  %min.iters.check = icmp ult i64 %8, 2
  %n.vec = and i64 %8, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %8, 1
  %cmp.n = icmp eq i64 %8, %n.vec
  br label %.preheader5

.preheader5:                                      ; preds = %._crit_edge16, %3
  %.0517 = phi i32 [ 1, %3 ], [ %163, %._crit_edge16 ]
  br i1 %5, label %.preheader3.preheader, label %.preheader5.._crit_edge16_crit_edge

.preheader5.._crit_edge16_crit_edge:              ; preds = %.preheader5
  %pgocount = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 7)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 7)
  br label %._crit_edge16

.preheader3.preheader:                            ; preds = %.preheader5
  br label %.preheader3

.preheader4:                                      ; preds = %._crit_edge8
  %pgocount1 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 18)
  %10 = add i64 %pgocount1, 1
  store i64 %10, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 18)
  br i1 %7, label %.preheader.lr.ph.preheader, label %._crit_edge16

.preheader.lr.ph.preheader:                       ; preds = %.preheader4
  br label %.preheader.lr.ph

.preheader3:                                      ; preds = %._crit_edge8, %.preheader3.preheader
  %indvar63 = phi i64 [ %indvar.next64, %._crit_edge8 ], [ 0, %.preheader3.preheader ]
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %._crit_edge8 ], [ 1, %.preheader3.preheader ]
  %11 = add i64 %indvar63, 1
  %12 = add i64 %indvar63, 2
  br i1 %6, label %.preheader1.lr.ph, label %.preheader3.._crit_edge8_crit_edge

.preheader3.._crit_edge8_crit_edge:               ; preds = %.preheader3
  %pgocount2 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 6)
  %13 = add i64 %pgocount2, 1
  store i64 %13, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 6)
  br label %._crit_edge8

.preheader1.lr.ph:                                ; preds = %.preheader3
  %14 = add nuw nsw i64 %indvars.iv22, 1
  %15 = add nsw i64 %indvars.iv22, -1
  br label %.preheader1.us

.preheader1.us:                                   ; preds = %._crit_edge.us, %.preheader1.lr.ph
  %indvar65 = phi i64 [ %indvar.next66, %._crit_edge.us ], [ 0, %.preheader1.lr.ph ]
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %._crit_edge.us ], [ 1, %.preheader1.lr.ph ]
  %16 = add i64 %indvar65, 1
  %scevgep67 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %11, i64 %16, i64 1
  %scevgep69 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %11, i64 %16, i64 %wide.trip.count28
  %scevgep71 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvar63, i64 %16, i64 1
  %scevgep73 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %12, i64 %16, i64 %wide.trip.count28
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %17 = add nsw i64 %indvars.iv18, -1
  br i1 %min.iters.check57, label %scalar.ph56.preheader, label %min.iters.checked58

min.iters.checked58:                              ; preds = %.preheader1.us
  %pgocount3 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 10)
  %18 = add i64 %pgocount3, 1
  store i64 %18, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 10)
  br i1 %cmp.zero61, label %scalar.ph56.preheader, label %vector.memcheck79

vector.memcheck79:                                ; preds = %min.iters.checked58
  %pgocount4 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 12)
  %19 = add i64 %pgocount4, 1
  store i64 %19, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 12)
  %bound075 = icmp ult double* %scevgep67, %scevgep73
  %bound176 = icmp ult double* %scevgep71, %scevgep69
  %memcheck.conflict78 = and i1 %bound075, %bound176
  br i1 %memcheck.conflict78, label %scalar.ph56.preheader, label %vector.body54.preheader

vector.body54.preheader:                          ; preds = %vector.memcheck79
  br label %vector.body54

vector.body54:                                    ; preds = %vector.body54.vector.body54_crit_edge, %vector.body54.preheader
  %index81 = phi i64 [ %index.next82, %vector.body54.vector.body54_crit_edge ], [ 0, %vector.body54.preheader ]
  %offset.idx86 = or i64 %index81, 1
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %14, i64 %indvars.iv18, i64 %offset.idx86
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !1
  %22 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv18, i64 %offset.idx86
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load91 = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !1
  %24 = fmul <2 x double> %wide.load91, <double 2.000000e+00, double 2.000000e+00>
  %25 = fsub <2 x double> %wide.load90, %24
  %26 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %15, i64 %indvars.iv18, i64 %offset.idx86
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load92 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !1
  %28 = fadd <2 x double> %wide.load92, %25
  %29 = fmul <2 x double> %28, <double 1.250000e-01, double 1.250000e-01>
  %30 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv.next19, i64 %offset.idx86
  %31 = bitcast double* %30 to <2 x double>*
  %wide.load93 = load <2 x double>, <2 x double>* %31, align 8, !alias.scope !1
  %32 = fsub <2 x double> %wide.load93, %24
  %33 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %17, i64 %offset.idx86
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load94 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !1
  %35 = fadd <2 x double> %32, %wide.load94
  %36 = fmul <2 x double> %35, <double 1.250000e-01, double 1.250000e-01>
  %37 = fadd <2 x double> %29, %36
  %38 = add nuw nsw i64 %offset.idx86, 1
  %39 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv18, i64 %38
  %40 = bitcast double* %39 to <2 x double>*
  %wide.load95 = load <2 x double>, <2 x double>* %40, align 8, !alias.scope !1
  %41 = fsub <2 x double> %wide.load95, %24
  %42 = add nsw i64 %offset.idx86, -1
  %43 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv18, i64 %42
  %44 = bitcast double* %43 to <2 x double>*
  %wide.load96 = load <2 x double>, <2 x double>* %44, align 8, !alias.scope !1
  %45 = fadd <2 x double> %41, %wide.load96
  %46 = fmul <2 x double> %45, <double 1.250000e-01, double 1.250000e-01>
  %47 = fadd <2 x double> %37, %46
  %48 = fadd <2 x double> %wide.load91, %47
  %49 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv22, i64 %indvars.iv18, i64 %offset.idx86
  %50 = bitcast double* %49 to <2 x double>*
  store <2 x double> %48, <2 x double>* %50, align 8, !alias.scope !4, !noalias !1
  %index.next82 = add i64 %index81, 2
  %51 = icmp eq i64 %index.next82, %n.vec60
  br i1 %51, label %middle.block55, label %vector.body54.vector.body54_crit_edge, !llvm.loop !6

vector.body54.vector.body54_crit_edge:            ; preds = %vector.body54
  %pgocount5 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 2)
  %52 = add i64 %pgocount5, 1
  store i64 %52, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 2)
  br label %vector.body54

middle.block55:                                   ; preds = %vector.body54
  %pgocount6 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 14)
  %53 = add i64 %pgocount6, 1
  store i64 %53, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 14)
  br i1 %cmp.n85, label %._crit_edge.us, label %middle.block55.scalar.ph56.preheader_crit_edge

middle.block55.scalar.ph56.preheader_crit_edge:   ; preds = %middle.block55
  %pgocount7 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 4)
  %54 = add i64 %pgocount7, 1
  store i64 %54, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 4)
  br label %scalar.ph56.preheader

scalar.ph56.preheader:                            ; preds = %middle.block55.scalar.ph56.preheader_crit_edge, %vector.memcheck79, %min.iters.checked58, %.preheader1.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck79 ], [ 1, %min.iters.checked58 ], [ 1, %.preheader1.us ], [ %ind.end84, %middle.block55.scalar.ph56.preheader_crit_edge ]
  br label %scalar.ph56

scalar.ph56:                                      ; preds = %scalar.ph56.scalar.ph56_crit_edge, %scalar.ph56.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph56.scalar.ph56_crit_edge ], [ %indvars.iv.ph, %scalar.ph56.preheader ]
  %55 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %14, i64 %indvars.iv18, i64 %indvars.iv
  %56 = load double, double* %55, align 8
  %57 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv18, i64 %indvars.iv
  %58 = load double, double* %57, align 8
  %59 = fmul double %58, 2.000000e+00
  %60 = fsub double %56, %59
  %61 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %15, i64 %indvars.iv18, i64 %indvars.iv
  %62 = load double, double* %61, align 8
  %63 = fadd double %62, %60
  %64 = fmul double %63, 1.250000e-01
  %65 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv.next19, i64 %indvars.iv
  %66 = load double, double* %65, align 8
  %67 = fsub double %66, %59
  %68 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %17, i64 %indvars.iv
  %69 = load double, double* %68, align 8
  %70 = fadd double %67, %69
  %71 = fmul double %70, 1.250000e-01
  %72 = fadd double %64, %71
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %73 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv18, i64 %indvars.iv.next
  %74 = load double, double* %73, align 8
  %75 = fsub double %74, %59
  %76 = add nsw i64 %indvars.iv, -1
  %77 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv18, i64 %76
  %78 = load double, double* %77, align 8
  %79 = fadd double %75, %78
  %80 = fmul double %79, 1.250000e-01
  %81 = fadd double %72, %80
  %82 = fadd double %58, %81
  %83 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv22, i64 %indvars.iv18, i64 %indvars.iv
  store double %82, double* %83, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.loopexit, label %scalar.ph56.scalar.ph56_crit_edge, !llvm.loop !9

scalar.ph56.scalar.ph56_crit_edge:                ; preds = %scalar.ph56
  %pgocount8 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 0)
  %84 = add i64 %pgocount8, 1
  store i64 %84, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 0)
  br label %scalar.ph56

._crit_edge.us.loopexit:                          ; preds = %scalar.ph56
  %pgocount9 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 8)
  %85 = add i64 %pgocount9, 1
  store i64 %85, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 8)
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block55
  %exitcond21 = icmp eq i64 %indvars.iv.next19, %wide.trip.count20
  %indvar.next66 = add i64 %indvar65, 1
  br i1 %exitcond21, label %._crit_edge8.loopexit, label %.preheader1.us

._crit_edge8.loopexit:                            ; preds = %._crit_edge.us
  %pgocount10 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 16)
  %86 = add i64 %pgocount10, 1
  store i64 %86, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 16)
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %.preheader3.._crit_edge8_crit_edge, %._crit_edge8.loopexit
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next23, %wide.trip.count24
  %indvar.next64 = add i64 %indvar63, 1
  br i1 %exitcond25, label %.preheader4, label %.preheader3

.preheader.lr.ph:                                 ; preds = %._crit_edge14, %.preheader.lr.ph.preheader
  %indvar = phi i64 [ %indvar.next, %._crit_edge14 ], [ 0, %.preheader.lr.ph.preheader ]
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %._crit_edge14 ], [ 1, %.preheader.lr.ph.preheader ]
  %87 = add i64 %indvar, 1
  %88 = add i64 %indvar, 2
  %89 = add nuw nsw i64 %indvars.iv34, 1
  %90 = add nsw i64 %indvars.iv34, -1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge12.us, %.preheader.lr.ph
  %indvar39 = phi i64 [ %indvar.next40, %._crit_edge12.us ], [ 0, %.preheader.lr.ph ]
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %._crit_edge12.us ], [ 1, %.preheader.lr.ph ]
  %91 = add i64 %indvar39, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %87, i64 %91, i64 1
  %scevgep42 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %87, i64 %91, i64 %wide.trip.count28
  %scevgep44 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvar, i64 %91, i64 1
  %scevgep46 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %88, i64 %91, i64 %wide.trip.count28
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %92 = add nsw i64 %indvars.iv30, -1
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  %pgocount11 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 11)
  %93 = add i64 %pgocount11, 1
  store i64 %93, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 11)
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %pgocount12 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 13)
  %94 = add i64 %pgocount12, 1
  store i64 %94, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 13)
  %bound0 = icmp ult double* %scevgep, %scevgep46
  %bound1 = icmp ult double* %scevgep44, %scevgep42
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %95 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %89, i64 %indvars.iv30, i64 %offset.idx
  %96 = bitcast double* %95 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %96, align 8, !alias.scope !10
  %97 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %indvars.iv30, i64 %offset.idx
  %98 = bitcast double* %97 to <2 x double>*
  %wide.load48 = load <2 x double>, <2 x double>* %98, align 8, !alias.scope !10
  %99 = fmul <2 x double> %wide.load48, <double 2.000000e+00, double 2.000000e+00>
  %100 = fsub <2 x double> %wide.load, %99
  %101 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %90, i64 %indvars.iv30, i64 %offset.idx
  %102 = bitcast double* %101 to <2 x double>*
  %wide.load49 = load <2 x double>, <2 x double>* %102, align 8, !alias.scope !10
  %103 = fadd <2 x double> %wide.load49, %100
  %104 = fmul <2 x double> %103, <double 1.250000e-01, double 1.250000e-01>
  %105 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %indvars.iv.next31, i64 %offset.idx
  %106 = bitcast double* %105 to <2 x double>*
  %wide.load50 = load <2 x double>, <2 x double>* %106, align 8, !alias.scope !10
  %107 = fsub <2 x double> %wide.load50, %99
  %108 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %92, i64 %offset.idx
  %109 = bitcast double* %108 to <2 x double>*
  %wide.load51 = load <2 x double>, <2 x double>* %109, align 8, !alias.scope !10
  %110 = fadd <2 x double> %107, %wide.load51
  %111 = fmul <2 x double> %110, <double 1.250000e-01, double 1.250000e-01>
  %112 = fadd <2 x double> %104, %111
  %113 = add nuw nsw i64 %offset.idx, 1
  %114 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %indvars.iv30, i64 %113
  %115 = bitcast double* %114 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %115, align 8, !alias.scope !10
  %116 = fsub <2 x double> %wide.load52, %99
  %117 = add nsw i64 %offset.idx, -1
  %118 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %indvars.iv30, i64 %117
  %119 = bitcast double* %118 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %119, align 8, !alias.scope !10
  %120 = fadd <2 x double> %116, %wide.load53
  %121 = fmul <2 x double> %120, <double 1.250000e-01, double 1.250000e-01>
  %122 = fadd <2 x double> %112, %121
  %123 = fadd <2 x double> %wide.load48, %122
  %124 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv34, i64 %indvars.iv30, i64 %offset.idx
  %125 = bitcast double* %124 to <2 x double>*
  store <2 x double> %123, <2 x double>* %125, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %126 = icmp eq i64 %index.next, %n.vec
  br i1 %126, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !15

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  %pgocount13 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 3)
  %127 = add i64 %pgocount13, 1
  store i64 %127, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 3)
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %pgocount14 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 15)
  %128 = add i64 %pgocount14, 1
  store i64 %128, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 15)
  br i1 %cmp.n, label %._crit_edge12.us, label %middle.block.scalar.ph.preheader_crit_edge

middle.block.scalar.ph.preheader_crit_edge:       ; preds = %middle.block
  %pgocount15 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 5)
  %129 = add i64 %pgocount15, 1
  store i64 %129, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 5)
  br label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block.scalar.ph.preheader_crit_edge, %vector.memcheck, %min.iters.checked, %.preheader.us
  %indvars.iv26.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %.preheader.us ], [ %ind.end, %middle.block.scalar.ph.preheader_crit_edge ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.scalar.ph_crit_edge, %scalar.ph.preheader
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %scalar.ph.scalar.ph_crit_edge ], [ %indvars.iv26.ph, %scalar.ph.preheader ]
  %130 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %89, i64 %indvars.iv30, i64 %indvars.iv26
  %131 = load double, double* %130, align 8
  %132 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %indvars.iv30, i64 %indvars.iv26
  %133 = load double, double* %132, align 8
  %134 = fmul double %133, 2.000000e+00
  %135 = fsub double %131, %134
  %136 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %90, i64 %indvars.iv30, i64 %indvars.iv26
  %137 = load double, double* %136, align 8
  %138 = fadd double %137, %135
  %139 = fmul double %138, 1.250000e-01
  %140 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %indvars.iv.next31, i64 %indvars.iv26
  %141 = load double, double* %140, align 8
  %142 = fsub double %141, %134
  %143 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %92, i64 %indvars.iv26
  %144 = load double, double* %143, align 8
  %145 = fadd double %142, %144
  %146 = fmul double %145, 1.250000e-01
  %147 = fadd double %139, %146
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %148 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %indvars.iv30, i64 %indvars.iv.next27
  %149 = load double, double* %148, align 8
  %150 = fsub double %149, %134
  %151 = add nsw i64 %indvars.iv26, -1
  %152 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv34, i64 %indvars.iv30, i64 %151
  %153 = load double, double* %152, align 8
  %154 = fadd double %150, %153
  %155 = fmul double %154, 1.250000e-01
  %156 = fadd double %147, %155
  %157 = fadd double %133, %156
  %158 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv34, i64 %indvars.iv30, i64 %indvars.iv26
  store double %157, double* %158, align 8
  %exitcond29 = icmp eq i64 %indvars.iv.next27, %wide.trip.count28
  br i1 %exitcond29, label %._crit_edge12.us.loopexit, label %scalar.ph.scalar.ph_crit_edge, !llvm.loop !16

scalar.ph.scalar.ph_crit_edge:                    ; preds = %scalar.ph
  %pgocount16 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 1)
  %159 = add i64 %pgocount16, 1
  store i64 %159, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 1)
  br label %scalar.ph

._crit_edge12.us.loopexit:                        ; preds = %scalar.ph
  %pgocount17 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 9)
  %160 = add i64 %pgocount17, 1
  store i64 %160, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 9)
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %._crit_edge12.us.loopexit, %middle.block
  %exitcond33 = icmp eq i64 %indvars.iv.next31, %wide.trip.count32
  %indvar.next40 = add i64 %indvar39, 1
  br i1 %exitcond33, label %._crit_edge14, label %.preheader.us

._crit_edge14:                                    ; preds = %._crit_edge12.us
  %pgocount18 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 17)
  %161 = add i64 %pgocount18, 1
  store i64 %161, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 17)
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next35, %wide.trip.count36
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond37, label %._crit_edge16.loopexit, label %.preheader.lr.ph

._crit_edge16.loopexit:                           ; preds = %._crit_edge14
  %pgocount19 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 19)
  %162 = add i64 %pgocount19, 1
  store i64 %162, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 19)
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %.preheader5.._crit_edge16_crit_edge, %._crit_edge16.loopexit, %.preheader4
  %163 = add nuw nsw i32 %.0517, 1
  %exitcond38 = icmp eq i32 %163, 501
  br i1 %exitcond38, label %164, label %.preheader5

; <label>:164:                                    ; preds = %._crit_edge16
  %pgocount20 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 20)
  %165 = add i64 %pgocount20, 1
  store i64 %165, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 20)
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [120 x [120 x double]]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader3.lr.ph, label %._crit_edge8

.preheader3.lr.ph:                                ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count20 = zext i32 %0 to i64
  %wide.trip.count24 = zext i32 %0 to i64
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %._crit_edge6.us, %.preheader3.lr.ph
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %._crit_edge6.us ], [ 0, %.preheader3.lr.ph ]
  %9 = mul nsw i64 %indvars.iv22, %8
  %10 = trunc i64 %9 to i32
  br label %.preheader.us.us

._crit_edge6.us:                                  ; preds = %._crit_edge.us.us
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next23, %wide.trip.count24
  br i1 %exitcond25, label %._crit_edge8.loopexit, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv18 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next19, %._crit_edge.us.us ]
  %12 = trunc i64 %indvars.iv18 to i32
  %13 = add i32 %12, %10
  %14 = mul i32 %13, %0
  %15 = zext i32 %14 to i64
  br label %17

._crit_edge.us.us:                                ; preds = %26
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %16 = add i64 %pgocount1, 1
  store i64 %16, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next19, %wide.trip.count20
  br i1 %exitcond21, label %._crit_edge6.us, label %.preheader.us.us

; <label>:17:                                     ; preds = %26, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %26 ], [ 0, %.preheader.us.us ]
  %18 = add i64 %indvars.iv, %15
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, 20
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %23, label %._crit_edge

._crit_edge:                                      ; preds = %17
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %22 = add i64 %pgocount2, 1
  store i64 %22, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  br label %26

; <label>:23:                                     ; preds = %17
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %24 = add i64 %pgocount3, 1
  store i64 %24, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %25) #5
  br label %26

; <label>:26:                                     ; preds = %._crit_edge, %23
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv22, i64 %indvars.iv18, i64 %indvars.iv
  %29 = load double, double* %28, align 8
  %30 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %29) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.us, label %17

._crit_edge8.loopexit:                            ; preds = %._crit_edge6.us
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_print_array, i64 0, i64 5)
  %31 = add i64 %pgocount4, 1
  store i64 %31, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_print_array, i64 0, i64 5)
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %2
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_print_array, i64 0, i64 4)
  %32 = add i64 %pgocount5, 1
  store i64 %32, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_print_array, i64 0, i64 4)
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %35) #5
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
