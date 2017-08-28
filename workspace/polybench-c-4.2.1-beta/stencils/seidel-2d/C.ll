; ModuleID = 'B.ll'
source_filename = "seidel-2d.c"
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
@__profn_B.ll_kernel_seidel_2d = private constant [21 x i8] c"B.ll:kernel_seidel_2d"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 32414643582, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 77261525566, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_seidel_2d = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_seidel_2d = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2820458480847639218, i64 74003936261, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_seidel_2d, i32 0, i32 0), i8* null, i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 63976198547, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [61 x i8] c";\00main\01B.ll:init_array\01B.ll:kernel_seidel_2d\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_seidel_2d to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([61 x i8], [61 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_seidel_2d(i32 500, i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %12

; <label>:6:                                      ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %7 = add i64 %pgocount, 1
  store i64 %7, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %8 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %8, align 1
  %9 = icmp eq i8 %strcmpload, 0
  br i1 %9, label %10, label %12

; <label>:10:                                     ; preds = %6
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %11 = add i64 %pgocount1, 1
  store i64 %11, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %4)
  br label %12

; <label>:12:                                     ; preds = %10, %6, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %13 = add i64 %pgocount2, 1
  store i64 %13, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture) unnamed_addr #2 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader.lr.ph, label %._crit_edge4

.preheader.lr.ph:                                 ; preds = %2
  %4 = sitofp i32 %0 to double
  %xtraiter = and i32 %0, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %5 = icmp eq i32 %0, 1
  %wide.trip.count7 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %._crit_edge.us ], [ 0, %.preheader.lr.ph ]
  %6 = trunc i64 %indvars.iv5 to i32
  %7 = sitofp i32 %6 to double
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %9 = fmul double %7, 2.000000e+00
  %10 = fadd double %9, 2.000000e+00
  %11 = fdiv double %10, %4
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv5, i64 0
  store double %11, double* %12, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us ]
  br i1 %5, label %.prol.loopexit.._crit_edge.us_crit_edge, label %.preheader.us.new.preheader

.prol.loopexit.._crit_edge.us_crit_edge:          ; preds = %.prol.loopexit
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %13 = add i64 %pgocount1, 1
  store i64 %13, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  br label %._crit_edge.us

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new..preheader.us.new_crit_edge, %.preheader.us.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new..preheader.us.new_crit_edge ], [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ]
  %14 = add nuw nsw i64 %indvars.iv, 2
  %15 = trunc i64 %14 to i32
  %16 = sitofp i32 %15 to double
  %17 = fmul double %7, %16
  %18 = fadd double %17, 2.000000e+00
  %19 = fdiv double %18, %4
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  store double %19, double* %20, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %21 = add nsw i64 %indvars.iv, 3
  %22 = trunc i64 %21 to i32
  %23 = sitofp i32 %22 to double
  %24 = fmul double %7, %23
  %25 = fadd double %24, 2.000000e+00
  %26 = fdiv double %25, %4
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv.next
  store double %26, double* %27, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader.us.new..preheader.us.new_crit_edge

.preheader.us.new..preheader.us.new_crit_edge:    ; preds = %.preheader.us.new
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %28 = add i64 %pgocount2, 1
  store i64 %28, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  br label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %29 = add i64 %pgocount3, 1
  store i64 %29, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.prol.loopexit.._crit_edge.us_crit_edge, %._crit_edge.us.loopexit
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next6, %wide.trip.count7
  br i1 %exitcond, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %30 = add i64 %pgocount4, 1
  store i64 %30, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %2
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %31 = add i64 %pgocount5, 1
  store i64 %31, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_seidel_2d(i32, i32, [2000 x double]* nocapture) unnamed_addr #2 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.preheader3.lr.ph, label %._crit_edge8

.preheader3.lr.ph:                                ; preds = %3
  %5 = add nsw i32 %1, -2
  %6 = icmp slt i32 %5, 1
  %7 = add i32 %1, -1
  %wide.trip.count11 = zext i32 %7 to i64
  %wide.trip.count = zext i32 %7 to i64
  br label %.preheader3

.preheader3:                                      ; preds = %._crit_edge6, %.preheader3.lr.ph
  %.027 = phi i32 [ 0, %.preheader3.lr.ph ], [ %41, %._crit_edge6 ]
  br i1 %6, label %.preheader3.._crit_edge6_crit_edge, label %.preheader.preheader

.preheader3.._crit_edge6_crit_edge:               ; preds = %.preheader3
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_seidel_2d, i64 0, i64 1)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_seidel_2d, i64 0, i64 1)
  br label %._crit_edge6

.preheader.preheader:                             ; preds = %.preheader3
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge, %.preheader.preheader
  %indvar = phi i64 [ %indvar.next, %._crit_edge ], [ 0, %.preheader.preheader ]
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %._crit_edge ], [ 1, %.preheader.preheader ]
  %9 = add i64 %indvar, 1
  %scevgep = getelementptr [2000 x double], [2000 x double]* %2, i64 %9, i64 0
  %10 = add nsw i64 %indvars.iv9, -1
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %load_initial = load double, double* %scevgep, align 8
  br label %11

; <label>:11:                                     ; preds = %._crit_edge1, %.preheader
  %store_forwarded = phi double [ %load_initial, %.preheader ], [ %37, %._crit_edge1 ]
  %indvars.iv = phi i64 [ 1, %.preheader ], [ %indvars.iv.next, %._crit_edge1 ]
  %12 = add nsw i64 %indvars.iv, -1
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %10, i64 %12
  %14 = load double, double* %13, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %10, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = fadd double %14, %16
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %10, i64 %indvars.iv.next
  %19 = load double, double* %18, align 8
  %20 = fadd double %17, %19
  %21 = fadd double %20, %store_forwarded
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv9, i64 %indvars.iv
  %23 = load double, double* %22, align 8
  %24 = fadd double %21, %23
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv9, i64 %indvars.iv.next
  %26 = load double, double* %25, align 8
  %27 = fadd double %24, %26
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv.next10, i64 %12
  %29 = load double, double* %28, align 8
  %30 = fadd double %27, %29
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv.next10, i64 %indvars.iv
  %32 = load double, double* %31, align 8
  %33 = fadd double %30, %32
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv.next10, i64 %indvars.iv.next
  %35 = load double, double* %34, align 8
  %36 = fadd double %33, %35
  %37 = fdiv double %36, 9.000000e+00
  store double %37, double* %22, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge, label %._crit_edge1

._crit_edge1:                                     ; preds = %11
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_seidel_2d, i64 0, i64 0)
  %38 = add i64 %pgocount2, 1
  store i64 %38, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_seidel_2d, i64 0, i64 0)
  br label %11

._crit_edge:                                      ; preds = %11
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_seidel_2d, i64 0, i64 2)
  %39 = add i64 %pgocount3, 1
  store i64 %39, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_seidel_2d, i64 0, i64 2)
  %exitcond12 = icmp eq i64 %indvars.iv.next10, %wide.trip.count11
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond12, label %._crit_edge6.loopexit, label %.preheader

._crit_edge6.loopexit:                            ; preds = %._crit_edge
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_seidel_2d, i64 0, i64 3)
  %40 = add i64 %pgocount4, 1
  store i64 %40, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_seidel_2d, i64 0, i64 3)
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %.preheader3.._crit_edge6_crit_edge, %._crit_edge6.loopexit
  %41 = add nuw nsw i32 %.027, 1
  %exitcond13 = icmp eq i32 %41, %0
  br i1 %exitcond13, label %._crit_edge8.loopexit, label %.preheader3

._crit_edge8.loopexit:                            ; preds = %._crit_edge6
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_seidel_2d, i64 0, i64 5)
  %42 = add i64 %pgocount5, 1
  store i64 %42, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_seidel_2d, i64 0, i64 5)
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %3
  %pgocount6 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_seidel_2d, i64 0, i64 4)
  %43 = add i64 %pgocount6, 1
  store i64 %43, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_seidel_2d, i64 0, i64 4)
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]* nocapture readonly) unnamed_addr #0 {
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
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
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
