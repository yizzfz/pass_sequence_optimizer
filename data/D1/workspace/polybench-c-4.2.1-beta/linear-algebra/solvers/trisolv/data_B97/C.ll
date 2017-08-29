; ModuleID = 'B.ll'
source_filename = "trisolv.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.4 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.5 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_trisolv = private constant [19 x i8] c"B.ll:kernel_trisolv"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 32414643582, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 77261525566, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_trisolv = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_trisolv = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -9203314144398365966, i64 82652651945, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_trisolv, i32 0, i32 0), i8* null, i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 49239513432, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [59 x i8] c"9\00main\01B.ll:init_array\01B.ll:kernel_trisolv\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_trisolv to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([59 x i8], [59 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = bitcast i8* %3 to [2000 x double]*
  %7 = bitcast i8* %4 to double*
  %8 = bitcast i8* %5 to double*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %6, double* %7, double* %8)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_trisolv(i32 2000, [2000 x double]* %6, double* %7, double* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %16

; <label>:10:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %11 = add i64 %pgocount, 1
  store i64 %11, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %12 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %12, align 1
  %13 = icmp eq i8 %strcmpload, 0
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %10
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %15 = add i64 %pgocount1, 1
  store i64 %15, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  tail call fastcc void @print_array(i32 2000, double* %7)
  br label %16

; <label>:16:                                     ; preds = %14, %10, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %17 = add i64 %pgocount2, 1
  store i64 %17, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #2 {
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %.lr.ph5, label %._crit_edge6

.lr.ph5:                                          ; preds = %4
  %6 = add i32 %0, 1
  %7 = sitofp i32 %0 to double
  %wide.trip.count13 = zext i32 %0 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.lr.ph5
  %indvars.iv11 = phi i64 [ 0, %.lr.ph5 ], [ %indvars.iv.next12, %._crit_edge ]
  %indvars.iv9 = phi i64 [ 1, %.lr.ph5 ], [ %indvars.iv.next10, %._crit_edge ]
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %8 = getelementptr inbounds double, double* %2, i64 %indvars.iv11
  store double -9.990000e+02, double* %8, align 8
  %9 = trunc i64 %indvars.iv11 to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds double, double* %3, i64 %indvars.iv11
  store double %10, double* %11, align 8
  %12 = trunc i64 %indvars.iv11 to i32
  %13 = add i32 %6, %12
  %xtraiter14 = and i64 %indvars.iv.next12, 1
  %lcmp.mod = icmp eq i64 %xtraiter14, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %14 = add i64 %pgocount, 1
  store i64 %14, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %15 = sitofp i32 %13 to double
  %16 = fmul double %15, 2.000000e+00
  %17 = fdiv double %16, %7
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv11, i64 0
  store double %17, double* %18, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %19 = icmp eq i64 %indvars.iv11, 0
  br i1 %19, label %.prol.loopexit.._crit_edge_crit_edge, label %.lr.ph.new.preheader

.prol.loopexit.._crit_edge_crit_edge:             ; preds = %.prol.loopexit
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  br label %._crit_edge

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new..lr.ph.new_crit_edge, %.lr.ph.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new..lr.ph.new_crit_edge ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %21 = trunc i64 %indvars.iv to i32
  %22 = sub i32 %13, %21
  %23 = sitofp i32 %22 to double
  %24 = fmul double %23, 2.000000e+00
  %25 = fdiv double %24, %7
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv11, i64 %indvars.iv
  store double %25, double* %26, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %27 = trunc i64 %indvars.iv.next to i32
  %28 = sub i32 %13, %27
  %29 = sitofp i32 %28 to double
  %30 = fmul double %29, 2.000000e+00
  %31 = fdiv double %30, %7
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv11, i64 %indvars.iv.next
  store double %31, double* %32, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv9
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new..lr.ph.new_crit_edge

.lr.ph.new..lr.ph.new_crit_edge:                  ; preds = %.lr.ph.new
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %33 = add i64 %pgocount2, 1
  store i64 %33, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  br label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %34 = add i64 %pgocount3, 1
  store i64 %34, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.prol.loopexit.._crit_edge_crit_edge, %._crit_edge.loopexit
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond = icmp eq i64 %indvars.iv.next12, %wide.trip.count13
  br i1 %exitcond, label %._crit_edge6.loopexit, label %.lr.ph

._crit_edge6.loopexit:                            ; preds = %._crit_edge
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %35 = add i64 %pgocount4, 1
  store i64 %35, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit, %4
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %36 = add i64 %pgocount5, 1
  store i64 %36, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trisolv(i32, [2000 x double]* nocapture readonly, double* nocapture, double* nocapture readonly) unnamed_addr #2 {
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %.lr.ph5.preheader, label %._crit_edge6

.lr.ph5.preheader:                                ; preds = %4
  %wide.trip.count13 = zext i32 %0 to i64
  br label %.lr.ph5

.lr.ph5:                                          ; preds = %._crit_edge, %.lr.ph5.preheader
  %indvars.iv11 = phi i64 [ %indvars.iv.next12, %._crit_edge ], [ 0, %.lr.ph5.preheader ]
  %6 = add i64 %indvars.iv11, 4294967295
  %7 = getelementptr inbounds double, double* %3, i64 %indvars.iv11
  %8 = bitcast double* %7 to i64*
  %9 = load i64, i64* %8, align 8
  %10 = getelementptr inbounds double, double* %2, i64 %indvars.iv11
  %11 = bitcast double* %10 to i64*
  store i64 %9, i64* %11, align 8
  %12 = icmp sgt i64 %indvars.iv11, 0
  br i1 %12, label %.lr.ph.preheader, label %.lr.ph5.._crit_edge_crit_edge

.lr.ph5.._crit_edge_crit_edge:                    ; preds = %.lr.ph5
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_trisolv, i64 0, i64 1)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_trisolv, i64 0, i64 1)
  br label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.lr.ph5
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_trisolv, i64 0, i64 2)
  %14 = add i64 %pgocount1, 1
  store i64 %14, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_trisolv, i64 0, i64 2)
  %xtraiter14 = and i64 %indvars.iv11, 1
  %lcmp.mod = icmp eq i64 %xtraiter14, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_trisolv, i64 0, i64 4)
  %15 = add i64 %pgocount2, 1
  store i64 %15, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_trisolv, i64 0, i64 4)
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv11, i64 0
  %17 = load double, double* %16, align 8
  %18 = load double, double* %2, align 8
  %19 = fmul double %17, %18
  %20 = load double, double* %10, align 8
  %21 = fsub double %20, %19
  store double %21, double* %10, align 8
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol, %.lr.ph.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader ]
  %22 = trunc i64 %6 to i32
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %._crit_edge, label %.lr.ph.preheader17

.lr.ph.preheader17:                               ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph..lr.ph_crit_edge, %.lr.ph.preheader17
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph..lr.ph_crit_edge ], [ %indvars.iv.unr.ph, %.lr.ph.preheader17 ]
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv11, i64 %indvars.iv
  %25 = load double, double* %24, align 8
  %26 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = load double, double* %10, align 8
  %30 = fsub double %29, %28
  store double %30, double* %10, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv11, i64 %indvars.iv.next
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = load double, double* %10, align 8
  %37 = fsub double %36, %35
  store double %37, double* %10, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv11
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph..lr.ph_crit_edge

.lr.ph..lr.ph_crit_edge:                          ; preds = %.lr.ph
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_trisolv, i64 0, i64 0)
  %38 = add i64 %pgocount3, 1
  store i64 %38, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_trisolv, i64 0, i64 0)
  br label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_trisolv, i64 0, i64 3)
  %39 = add i64 %pgocount4, 1
  store i64 %39, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_trisolv, i64 0, i64 3)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph5.._crit_edge_crit_edge, %._crit_edge.loopexit, %.lr.ph.prol.loopexit
  %40 = load double, double* %10, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv11, i64 %indvars.iv11
  %42 = load double, double* %41, align 8
  %43 = fdiv double %40, %42
  store double %43, double* %10, align 8
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond = icmp eq i64 %indvars.iv.next12, %wide.trip.count13
  br i1 %exitcond, label %._crit_edge6.loopexit, label %.lr.ph5

._crit_edge6.loopexit:                            ; preds = %._crit_edge
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_trisolv, i64 0, i64 6)
  %44 = add i64 %pgocount5, 1
  store i64 %44, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_trisolv, i64 0, i64 6)
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit, %4
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_trisolv, i64 0, i64 5)
  %45 = add i64 %pgocount6, 1
  store i64 %45, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_kernel_trisolv, i64 0, i64 5)
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
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  br i1 %7, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %20, %.lr.ph.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %20 ], [ 0, %.lr.ph.preheader ]
  %9 = phi %struct._IO_FILE* [ %21, %20 ], [ %8, %.lr.ph.preheader ]
  %10 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %11 = load double, double* %10, align 8
  %12 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.4, i64 0, i64 0), double %11) #5
  %13 = trunc i64 %indvars.iv to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %17, label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %.lr.ph
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %16 = add i64 %pgocount, 1
  store i64 %16, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  br label %20

; <label>:17:                                     ; preds = %.lr.ph
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %18 = add i64 %pgocount1, 1
  store i64 %18, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %19) #5
  br label %20

; <label>:20:                                     ; preds = %.lr.ph._crit_edge, %17
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %20
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %22 = add i64 %pgocount2, 1
  store i64 %22, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %.lcssa = phi %struct._IO_FILE* [ %8, %2 ], [ %21, %._crit_edge.loopexit ]
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %23 = add i64 %pgocount3, 1
  store i64 %23, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %.lcssa, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %25) #5
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
