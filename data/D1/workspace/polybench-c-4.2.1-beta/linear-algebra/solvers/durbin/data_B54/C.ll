; ModuleID = 'B.ll'
source_filename = "durbin.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_durbin = private constant [18 x i8] c"B.ll:kernel_durbin"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 32414643582, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 70332555079, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_durbin = private global [14 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_durbin = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -945145266756008212, i64 164267169623, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i32 0, i32 0), i8* null, i8* null, i32 14, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 49239513432, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [58 x i8] c"8\00main\01B.ll:init_array\01B.ll:kernel_durbin\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_durbin to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([58 x i8], [58 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = bitcast i8* %3 to double*
  tail call fastcc void @init_array(i32 2000, double* %5)
  tail call void (...) @polybench_timer_start() #4
  %6 = bitcast i8* %4 to double*
  tail call fastcc void @kernel_durbin(i32 2000, double* %5, double* %6)
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
  tail call fastcc void @print_array(i32 2000, double* %6)
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
define internal fastcc void @init_array(i32, double* nocapture) unnamed_addr #2 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %5 = add nsw i32 %0, 1
  %6 = add i32 %0, -1
  %xtraiter = and i32 %0, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader..prol.preheader_crit_edge, %.prol.preheader.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader..prol.preheader_crit_edge ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader..prol.preheader_crit_edge ], [ %xtraiter, %.prol.preheader.preheader ]
  %7 = trunc i64 %indvars.iv.prol to i32
  %8 = sub i32 %5, %7
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds double, double* %1, i64 %indvars.iv.prol
  store double %9, double* %10, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader..prol.preheader_crit_edge, !llvm.loop !1

.prol.preheader..prol.preheader_crit_edge:        ; preds = %.prol.preheader
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %11 = add i64 %pgocount1, 1
  store i64 %11, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  br label %.prol.preheader

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %12 = add i64 %pgocount2, 1
  store i64 %12, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  %13 = icmp ult i32 %6, 3
  br i1 %13, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %wide.trip.count.3 = zext i32 %0 to i64
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new..lr.ph.new_crit_edge, %.lr.ph.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new..lr.ph.new_crit_edge ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %14 = trunc i64 %indvars.iv to i32
  %15 = sub i32 %5, %14
  %16 = sitofp i32 %15 to double
  %17 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  store double %16, double* %17, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %18 = trunc i64 %indvars.iv.next to i32
  %19 = sub i32 %5, %18
  %20 = sitofp i32 %19 to double
  %21 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  store double %20, double* %21, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %22 = trunc i64 %indvars.iv.next.1 to i32
  %23 = sub i32 %5, %22
  %24 = sitofp i32 %23 to double
  %25 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.1
  store double %24, double* %25, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %26 = trunc i64 %indvars.iv.next.2 to i32
  %27 = sub i32 %5, %26
  %28 = sitofp i32 %27 to double
  %29 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.2
  store double %28, double* %29, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph.new..lr.ph.new_crit_edge

.lr.ph.new..lr.ph.new_crit_edge:                  ; preds = %.lr.ph.new
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %30 = add i64 %pgocount3, 1
  store i64 %30, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  br label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %31 = add i64 %pgocount4, 1
  store i64 %31, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %2
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %32 = add i64 %pgocount5, 1
  store i64 %32, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_durbin(i32, double* nocapture readonly, double* nocapture) unnamed_addr #2 {
  %4 = bitcast double* %2 to i8*
  %5 = alloca [2000 x double], align 16
  %6 = bitcast [2000 x double]* %5 to i8*
  %7 = load double, double* %1, align 8
  %8 = fsub double -0.000000e+00, %7
  store double %8, double* %2, align 8
  %9 = icmp sgt i32 %0, 1
  br i1 %9, label %.lr.ph17.preheader, label %._crit_edge18

.lr.ph17.preheader:                               ; preds = %3
  %10 = load double, double* %1, align 8
  %11 = fsub double -0.000000e+00, %10
  %12 = add i32 %0, -1
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 0
  %wide.trip.count40 = zext i32 %12 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge12, %.lr.ph17.preheader
  %indvars.iv38 = phi i64 [ 1, %.lr.ph17.preheader ], [ %indvars.iv.next39, %._crit_edge12 ]
  %indvar36 = phi i64 [ 0, %.lr.ph17.preheader ], [ %indvar.next37, %._crit_edge12 ]
  %indvar = phi i32 [ 0, %.lr.ph17.preheader ], [ %indvar.next, %._crit_edge12 ]
  %.0314 = phi double [ %11, %.lr.ph17.preheader ], [ %66, %._crit_edge12 ]
  %.0413 = phi double [ 1.000000e+00, %.lr.ph17.preheader ], [ %19, %._crit_edge12 ]
  %14 = add i64 %indvar36, -1
  %15 = shl i64 %indvar36, 3
  %16 = add nuw nsw i64 %15, 8
  %17 = fmul double %.0314, %.0314
  %18 = fsub double 1.000000e+00, %17
  %19 = fmul double %.0413, %18
  %20 = add nuw nsw i32 %indvar, 1
  %21 = add nsw i64 %indvars.iv38, -1
  %xtraiter = and i32 %20, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader..prol.preheader_crit_edge, %.prol.preheader.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader..prol.preheader_crit_edge ], [ 0, %.prol.preheader.preheader ]
  %.025.prol = phi double [ %28, %.prol.preheader..prol.preheader_crit_edge ], [ 0.000000e+00, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader..prol.preheader_crit_edge ], [ %xtraiter, %.prol.preheader.preheader ]
  %22 = sub nsw i64 %21, %indvars.iv.prol
  %23 = getelementptr inbounds double, double* %1, i64 %22
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds double, double* %2, i64 %indvars.iv.prol
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fadd double %.025.prol, %27
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader..prol.preheader_crit_edge, !llvm.loop !3

.prol.preheader..prol.preheader_crit_edge:        ; preds = %.prol.preheader
  %pgocount = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 0)
  %29 = add i64 %pgocount, 1
  store i64 %29, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 0)
  br label %.prol.preheader

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  %pgocount1 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 5)
  %30 = add i64 %pgocount1, 1
  store i64 %30, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 5)
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  %.025.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %28, %.prol.loopexit.loopexit ]
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %28, %.prol.loopexit.loopexit ]
  %31 = icmp ult i32 %indvar, 3
  br i1 %31, label %.lr.ph9, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new..lr.ph.new_crit_edge, %.lr.ph.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new..lr.ph.new_crit_edge ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %.025 = phi double [ %59, %.lr.ph.new..lr.ph.new_crit_edge ], [ %.025.unr, %.lr.ph.new.preheader ]
  %32 = sub nsw i64 %21, %indvars.iv
  %33 = getelementptr inbounds double, double* %1, i64 %32
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = fadd double %.025, %37
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %39 = sub nsw i64 %21, %indvars.iv.next
  %40 = getelementptr inbounds double, double* %1, i64 %39
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = fadd double %38, %44
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %46 = sub nsw i64 %21, %indvars.iv.next.1
  %47 = getelementptr inbounds double, double* %1, i64 %46
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.1
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = fadd double %45, %51
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %53 = sub nsw i64 %21, %indvars.iv.next.2
  %54 = getelementptr inbounds double, double* %1, i64 %53
  %55 = load double, double* %54, align 8
  %56 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next.2
  %57 = load double, double* %56, align 8
  %58 = fmul double %55, %57
  %59 = fadd double %52, %58
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv38
  br i1 %exitcond.3, label %.lr.ph9.loopexit, label %.lr.ph.new..lr.ph.new_crit_edge

.lr.ph.new..lr.ph.new_crit_edge:                  ; preds = %.lr.ph.new
  %pgocount2 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 2)
  %60 = add i64 %pgocount2, 1
  store i64 %60, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 2)
  br label %.lr.ph.new

.lr.ph9.loopexit:                                 ; preds = %.lr.ph.new
  %pgocount3 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 8)
  %61 = add i64 %pgocount3, 1
  store i64 %61, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 8)
  br label %.lr.ph9

.lr.ph9:                                          ; preds = %.lr.ph9.loopexit, %.prol.loopexit
  %.lcssa = phi double [ %.lcssa.unr, %.prol.loopexit ], [ %59, %.lr.ph9.loopexit ]
  %62 = getelementptr inbounds double, double* %1, i64 %indvars.iv38
  %63 = load double, double* %62, align 8
  %64 = fadd double %.lcssa, %63
  %65 = fsub double -0.000000e+00, %64
  %66 = fdiv double %65, %19
  %67 = add nsw i64 %indvars.iv38, -1
  %68 = and i32 %indvar, 1
  %lcmp.mod29 = icmp eq i32 %68, 0
  br i1 %lcmp.mod29, label %.prol.preheader26, label %.prol.loopexit27

.prol.preheader26:                                ; preds = %.lr.ph9
  %pgocount4 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 9)
  %69 = add i64 %pgocount4, 1
  store i64 %69, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 9)
  %70 = load double, double* %2, align 8
  %71 = getelementptr inbounds double, double* %2, i64 %67
  %72 = load double, double* %71, align 8
  %73 = fmul double %66, %72
  %74 = fadd double %70, %73
  store double %74, double* %13, align 16
  br label %.prol.loopexit27

.prol.loopexit27:                                 ; preds = %.prol.preheader26, %.lr.ph9
  %indvars.iv21.unr.ph = phi i64 [ 1, %.prol.preheader26 ], [ 0, %.lr.ph9 ]
  %75 = icmp eq i32 %indvar, 0
  br i1 %75, label %.prol.loopexit27.._crit_edge12_crit_edge, label %.lr.ph9.new.preheader

.prol.loopexit27.._crit_edge12_crit_edge:         ; preds = %.prol.loopexit27
  %pgocount5 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 4)
  %76 = add i64 %pgocount5, 1
  store i64 %76, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 4)
  br label %._crit_edge12

.lr.ph9.new.preheader:                            ; preds = %.prol.loopexit27
  %pgocount6 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 6)
  %77 = add i64 %pgocount6, 1
  store i64 %77, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 6)
  %78 = sub i64 %14, %indvars.iv21.unr.ph
  %79 = lshr i64 %78, 1
  %80 = add nuw i64 %79, 1
  %min.iters.check = icmp ult i64 %80, 2
  br i1 %min.iters.check, label %.lr.ph9.new.preheader52, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph9.new.preheader
  %pgocount7 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 10)
  %81 = add i64 %pgocount7, 1
  store i64 %81, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 10)
  %n.mod.vf = and i64 %80, 1
  %n.vec = sub i64 %80, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %82 = or i64 %indvars.iv21.unr.ph, 2
  %83 = shl nuw i64 %79, 1
  %84 = add i64 %82, %83
  %85 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %84, %85
  br i1 %cmp.zero, label %.lr.ph9.new.preheader52, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert50 = insertelement <2 x double> undef, double %66, i32 0
  %broadcast.splat51 = shufflevector <2 x double> %broadcast.splatinsert50, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %86 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv21.unr.ph, %86
  %87 = getelementptr inbounds double, double* %2, i64 %offset.idx
  %88 = bitcast double* %87 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %88, align 8
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec45 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %89 = sub nsw i64 %67, %offset.idx
  %90 = getelementptr inbounds double, double* %2, i64 %89
  %91 = getelementptr double, double* %90, i64 -3
  %92 = bitcast double* %91 to <4 x double>*
  %wide.vec46 = load <4 x double>, <4 x double>* %92, align 8
  %strided.vec47 = shufflevector <4 x double> %wide.vec46, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %reverse = shufflevector <2 x double> %strided.vec47, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %strided.vec48 = shufflevector <4 x double> %wide.vec46, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %reverse49 = shufflevector <2 x double> %strided.vec48, <2 x double> undef, <2 x i32> <i32 1, i32 0>
  %93 = fmul <2 x double> %broadcast.splat51, %reverse49
  %94 = fadd <2 x double> %strided.vec, %93
  %95 = add nuw nsw i64 %offset.idx, 1
  %96 = fmul <2 x double> %broadcast.splat51, %reverse
  %97 = fadd <2 x double> %strided.vec45, %96
  %98 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 %95
  %99 = getelementptr double, double* %98, i64 -1
  %100 = bitcast double* %99 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %94, <2 x double> %97, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %100, align 8
  %index.next = add i64 %index, 2
  %101 = icmp eq i64 %index.next, %n.vec
  br i1 %101, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !4

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  %pgocount8 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 3)
  %102 = add i64 %pgocount8, 1
  store i64 %102, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 3)
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %pgocount9 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 11)
  %103 = add i64 %pgocount9, 1
  store i64 %103, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 11)
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge12, label %.lr.ph9.new.preheader52

.lr.ph9.new.preheader52:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph9.new.preheader
  %indvars.iv21.ph = phi i64 [ %indvars.iv21.unr.ph, %min.iters.checked ], [ %indvars.iv21.unr.ph, %.lr.ph9.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph9.new

.lr.ph9.new:                                      ; preds = %.lr.ph9.new..lr.ph9.new_crit_edge, %.lr.ph9.new.preheader52
  %indvars.iv21 = phi i64 [ %indvars.iv.next22.1, %.lr.ph9.new..lr.ph9.new_crit_edge ], [ %indvars.iv21.ph, %.lr.ph9.new.preheader52 ]
  %104 = getelementptr inbounds double, double* %2, i64 %indvars.iv21
  %105 = load double, double* %104, align 8
  %106 = sub nsw i64 %67, %indvars.iv21
  %107 = getelementptr inbounds double, double* %2, i64 %106
  %108 = load double, double* %107, align 8
  %109 = fmul double %66, %108
  %110 = fadd double %105, %109
  %111 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 %indvars.iv21
  store double %110, double* %111, align 8
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %112 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next22
  %113 = load double, double* %112, align 8
  %114 = sub nsw i64 %67, %indvars.iv.next22
  %115 = getelementptr inbounds double, double* %2, i64 %114
  %116 = load double, double* %115, align 8
  %117 = fmul double %66, %116
  %118 = fadd double %113, %117
  %119 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 0, i64 %indvars.iv.next22
  store double %118, double* %119, align 8
  %indvars.iv.next22.1 = add nsw i64 %indvars.iv21, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next22.1, %indvars.iv38
  br i1 %exitcond.1, label %._crit_edge12.loopexit, label %.lr.ph9.new..lr.ph9.new_crit_edge, !llvm.loop !7

.lr.ph9.new..lr.ph9.new_crit_edge:                ; preds = %.lr.ph9.new
  %pgocount10 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 1)
  %120 = add i64 %pgocount10, 1
  store i64 %120, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 1)
  br label %.lr.ph9.new

._crit_edge12.loopexit:                           ; preds = %.lr.ph9.new
  %pgocount11 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 7)
  %121 = add i64 %pgocount11, 1
  store i64 %121, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 7)
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %.prol.loopexit27.._crit_edge12_crit_edge, %._crit_edge12.loopexit, %middle.block
  call void @llvm.memcpy.p0i8.p0i8.i64(i8* %4, i8* nonnull %6, i64 %16, i32 8, i1 false)
  %122 = getelementptr inbounds double, double* %2, i64 %indvars.iv38
  store double %66, double* %122, align 8
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %indvar.next = add nuw nsw i32 %indvar, 1
  %indvar.next37 = add nuw nsw i64 %indvar36, 1
  %exitcond = icmp eq i64 %indvar.next37, %wide.trip.count40
  br i1 %exitcond, label %._crit_edge18.loopexit, label %.lr.ph

._crit_edge18.loopexit:                           ; preds = %._crit_edge12
  %pgocount12 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 13)
  %123 = add i64 %pgocount12, 1
  store i64 %123, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 13)
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge18.loopexit, %3
  %pgocount13 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 12)
  %124 = add i64 %pgocount13, 1
  store i64 %124, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_durbin, i64 0, i64 12)
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
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
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #6
  br label %15

; <label>:15:                                     ; preds = %.lr.ph._crit_edge, %12
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
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
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #6
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

; Function Attrs: argmemonly nounwind
declare void @llvm.memcpy.p0i8.p0i8.i64(i8* nocapture writeonly, i8* nocapture readonly, i64, i32, i1) #5

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !5, !6}
!5 = !{!"llvm.loop.vectorize.width", i32 1}
!6 = !{!"llvm.loop.interleave.count", i32 1}
!7 = distinct !{!7, !8, !5, !6}
!8 = !{!"llvm.loop.unroll.runtime.disable"}
