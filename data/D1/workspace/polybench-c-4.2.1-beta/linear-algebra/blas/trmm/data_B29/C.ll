; ModuleID = 'B.ll'
source_filename = "trmm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_trmm = private constant [16 x i8] c"B.ll:kernel_trmm"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 32414643582, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [16 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 196530673398, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 16, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_trmm = private global [16 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_trmm = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1172305909204374240, i64 190551655843, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i32 0, i32 0), i8* null, i8* null, i32 16, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 63976198547, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [56 x i8] c"6\00main\01B.ll:init_array\01B.ll:kernel_trmm\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_trmm to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([56 x i8], [56 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %4 to [1000 x double]*
  %7 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %3, [1000 x double]* %6, [1200 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  tail call fastcc void @kernel_trmm(i32 1000, i32 1200, double %8, [1000 x double]* %6, [1200 x double]* %7)
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
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %7)
  br label %16

; <label>:16:                                     ; preds = %14, %10, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %17 = add i64 %pgocount2, 1
  store i64 %17, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader.lr.ph, label %._crit_edge9

.preheader.lr.ph:                                 ; preds = %5
  %7 = icmp sgt i32 %1, 0
  %8 = sitofp i32 %1 to double
  %9 = sitofp i32 %0 to double
  br i1 %7, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %wide.trip.count40 = zext i32 %0 to i64
  br label %.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %xtraiter18 = and i32 %1, 1
  %lcmp.mod19 = icmp eq i32 %xtraiter18, 0
  %10 = icmp eq i32 %1, 1
  %wide.trip.count26 = zext i32 %0 to i64
  %wide.trip.count15.1 = zext i32 %1 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge6.us, %.preheader.us.preheader
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %._crit_edge6.us ], [ 0, %.preheader.us.preheader ]
  %11 = add i64 %indvars.iv24, 4294967295
  %12 = icmp sgt i64 %indvars.iv24, 0
  br i1 %12, label %.lr.ph.us, label %.preheader.us.._crit_edge.us_crit_edge

.preheader.us.._crit_edge.us_crit_edge:           ; preds = %.preheader.us
  %pgocount = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  br label %._crit_edge.us

._crit_edge.us.loopexit:                          ; preds = %.lr.ph.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.preheader.us.._crit_edge.us_crit_edge, %.prol.loopexit, %._crit_edge.us.loopexit
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv24, i64 %indvars.iv24
  store double 1.000000e+00, double* %14, align 8
  %15 = trunc i64 %indvars.iv24 to i32
  %16 = add i32 %15, %1
  br i1 %lcmp.mod19, label %.prol.loopexit17, label %.prol.preheader16

.prol.preheader16:                                ; preds = %._crit_edge.us
  %pgocount1 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %17 = add i64 %pgocount1, 1
  store i64 %17, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %18 = srem i32 %16, %1
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, %8
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv24, i64 0
  store double %20, double* %21, align 8
  br label %.prol.loopexit17

.prol.loopexit17:                                 ; preds = %.prol.preheader16, %._crit_edge.us
  %indvars.iv13.unr.ph = phi i64 [ 1, %.prol.preheader16 ], [ 0, %._crit_edge.us ]
  br i1 %10, label %._crit_edge6.us, label %._crit_edge.us.new.preheader

._crit_edge.us.new.preheader:                     ; preds = %.prol.loopexit17
  br label %._crit_edge.us.new

._crit_edge.us.new:                               ; preds = %._crit_edge.us.new.._crit_edge.us.new_crit_edge, %._crit_edge.us.new.preheader
  %indvars.iv13 = phi i64 [ %indvars.iv.next14.1, %._crit_edge.us.new.._crit_edge.us.new_crit_edge ], [ %indvars.iv13.unr.ph, %._crit_edge.us.new.preheader ]
  %22 = trunc i64 %indvars.iv13 to i32
  %23 = sub i32 %16, %22
  %24 = srem i32 %23, %1
  %25 = sitofp i32 %24 to double
  %26 = fdiv double %25, %8
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv24, i64 %indvars.iv13
  store double %26, double* %27, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %28 = trunc i64 %indvars.iv.next14 to i32
  %29 = sub i32 %16, %28
  %30 = srem i32 %29, %1
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %31, %8
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv24, i64 %indvars.iv.next14
  store double %32, double* %33, align 8
  %indvars.iv.next14.1 = add nsw i64 %indvars.iv13, 2
  %exitcond.121 = icmp eq i64 %indvars.iv.next14.1, %wide.trip.count15.1
  br i1 %exitcond.121, label %._crit_edge6.us.loopexit, label %._crit_edge.us.new.._crit_edge.us.new_crit_edge

._crit_edge.us.new.._crit_edge.us.new_crit_edge:  ; preds = %._crit_edge.us.new
  %pgocount2 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %34 = add i64 %pgocount2, 1
  store i64 %34, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  br label %._crit_edge.us.new

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new..lr.ph.us.new_crit_edge, %.lr.ph.us.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.new..lr.ph.us.new_crit_edge ], [ %indvars.iv.unr.ph, %.lr.ph.us.new.preheader ]
  %35 = add nuw nsw i64 %indvars.iv, %indvars.iv24
  %36 = trunc i64 %35 to i32
  %37 = srem i32 %36, %0
  %38 = sitofp i32 %37 to double
  %39 = fdiv double %38, %9
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv24, i64 %indvars.iv
  store double %39, double* %40, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %41 = add nuw nsw i64 %indvars.iv.next, %indvars.iv24
  %42 = trunc i64 %41 to i32
  %43 = srem i32 %42, %0
  %44 = sitofp i32 %43 to double
  %45 = fdiv double %44, %9
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv24, i64 %indvars.iv.next
  store double %45, double* %46, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv24
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph.us.new..lr.ph.us.new_crit_edge

.lr.ph.us.new..lr.ph.us.new_crit_edge:            ; preds = %.lr.ph.us.new
  %pgocount3 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %47 = add i64 %pgocount3, 1
  store i64 %47, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  br label %.lr.ph.us.new

.lr.ph.us:                                        ; preds = %.preheader.us
  %pgocount4 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %48 = add i64 %pgocount4, 1
  store i64 %48, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %xtraiter43 = and i64 %indvars.iv24, 1
  %lcmp.mod = icmp eq i64 %xtraiter43, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us
  %pgocount5 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 10)
  %49 = add i64 %pgocount5, 1
  store i64 %49, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 10)
  %50 = trunc i64 %indvars.iv24 to i32
  %51 = srem i32 %50, %0
  %52 = sitofp i32 %51 to double
  %53 = fdiv double %52, %9
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv24, i64 0
  store double %53, double* %54, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us ]
  %55 = trunc i64 %11 to i32
  %56 = icmp eq i32 %55, 0
  br i1 %56, label %._crit_edge.us, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  %pgocount6 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  %57 = add i64 %pgocount6, 1
  store i64 %57, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  br label %.lr.ph.us.new

._crit_edge6.us.loopexit:                         ; preds = %._crit_edge.us.new
  %pgocount7 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %58 = add i64 %pgocount7, 1
  store i64 %58, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  br label %._crit_edge6.us

._crit_edge6.us:                                  ; preds = %._crit_edge6.us.loopexit, %.prol.loopexit17
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond = icmp eq i64 %indvars.iv.next25, %wide.trip.count26
  br i1 %exitcond, label %._crit_edge9.loopexit, label %.preheader.us

.preheader:                                       ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %._crit_edge ], [ 0, %.preheader.preheader ]
  %59 = add i64 %indvars.iv38, 4294967295
  %60 = icmp sgt i64 %indvars.iv38, 0
  br i1 %60, label %.lr.ph, label %.preheader.._crit_edge_crit_edge

.preheader.._crit_edge_crit_edge:                 ; preds = %.preheader
  %pgocount8 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %61 = add i64 %pgocount8, 1
  store i64 %61, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  br label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %pgocount9 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  %62 = add i64 %pgocount9, 1
  store i64 %62, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  %xtraiter3442 = and i64 %indvars.iv38, 1
  %lcmp.mod35 = icmp eq i64 %xtraiter3442, 0
  br i1 %lcmp.mod35, label %.prol.loopexit33, label %.prol.preheader32

.prol.preheader32:                                ; preds = %.lr.ph
  %pgocount10 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 12)
  %63 = add i64 %pgocount10, 1
  store i64 %63, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 12)
  %64 = trunc i64 %indvars.iv38 to i32
  %65 = srem i32 %64, %0
  %66 = sitofp i32 %65 to double
  %67 = fdiv double %66, %9
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv38, i64 0
  store double %67, double* %68, align 8
  br label %.prol.loopexit33

.prol.loopexit33:                                 ; preds = %.prol.preheader32, %.lr.ph
  %indvars.iv27.unr.ph = phi i64 [ 1, %.prol.preheader32 ], [ 0, %.lr.ph ]
  %69 = trunc i64 %59 to i32
  %70 = icmp eq i32 %69, 0
  br i1 %70, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit33
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new..lr.ph.new_crit_edge, %.lr.ph.new.preheader
  %indvars.iv27 = phi i64 [ %indvars.iv.next28.1, %.lr.ph.new..lr.ph.new_crit_edge ], [ %indvars.iv27.unr.ph, %.lr.ph.new.preheader ]
  %71 = add nuw nsw i64 %indvars.iv27, %indvars.iv38
  %72 = trunc i64 %71 to i32
  %73 = srem i32 %72, %0
  %74 = sitofp i32 %73 to double
  %75 = fdiv double %74, %9
  %76 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv38, i64 %indvars.iv27
  store double %75, double* %76, align 8
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %77 = add nuw nsw i64 %indvars.iv.next28, %indvars.iv38
  %78 = trunc i64 %77 to i32
  %79 = srem i32 %78, %0
  %80 = sitofp i32 %79 to double
  %81 = fdiv double %80, %9
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv38, i64 %indvars.iv.next28
  store double %81, double* %82, align 8
  %indvars.iv.next28.1 = add nsw i64 %indvars.iv27, 2
  %exitcond31.1 = icmp eq i64 %indvars.iv.next28.1, %indvars.iv38
  br i1 %exitcond31.1, label %._crit_edge.loopexit, label %.lr.ph.new..lr.ph.new_crit_edge

.lr.ph.new..lr.ph.new_crit_edge:                  ; preds = %.lr.ph.new
  %pgocount11 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %83 = add i64 %pgocount11, 1
  store i64 %83, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  br label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  %pgocount12 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 11)
  %84 = add i64 %pgocount12, 1
  store i64 %84, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 11)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.preheader.._crit_edge_crit_edge, %._crit_edge.loopexit, %.prol.loopexit33
  %85 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv38, i64 %indvars.iv38
  store double 1.000000e+00, double* %85, align 8
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next39, %wide.trip.count40
  br i1 %exitcond41, label %._crit_edge9.loopexit46, label %.preheader

._crit_edge9.loopexit:                            ; preds = %._crit_edge6.us
  %pgocount13 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 14)
  %86 = add i64 %pgocount13, 1
  store i64 %86, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 14)
  br label %._crit_edge9

._crit_edge9.loopexit46:                          ; preds = %._crit_edge
  %pgocount14 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 15)
  %87 = add i64 %pgocount14, 1
  store i64 %87, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 15)
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit46, %._crit_edge9.loopexit, %5
  %pgocount15 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 13)
  %88 = add i64 %pgocount15, 1
  store i64 %88, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 13)
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(i32, i32, double, [1000 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  %7 = icmp sgt i32 %1, 0
  %or.cond = and i1 %6, %7
  br i1 %or.cond, label %.preheader3.us.preheader, label %._crit_edge9

.preheader3.us.preheader:                         ; preds = %5
  %8 = add i32 %1, -1
  %9 = add i32 %0, 1
  %10 = add i32 %0, -2
  %11 = sext i32 %0 to i64
  %wide.trip.count33 = zext i32 %0 to i64
  %xtraiter = and i32 %1, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %12 = icmp ult i32 %8, 3
  %wide.trip.count.3 = zext i32 %1 to i64
  %wide.trip.count30 = zext i32 %1 to i64
  %wide.trip.count24.1 = zext i32 %0 to i64
  %13 = add nsw i64 %wide.trip.count30, -4
  %broadcast.splatinsert43 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat44 = shufflevector <2 x double> %broadcast.splatinsert43, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %._crit_edge7.us, %.preheader3.us.preheader
  %indvars.iv31 = phi i64 [ 0, %.preheader3.us.preheader ], [ %indvars.iv.next32, %._crit_edge7.us ]
  %indvars.iv20 = phi i64 [ 1, %.preheader3.us.preheader ], [ %indvars.iv.next21, %._crit_edge7.us ]
  %14 = sub nsw i64 0, %indvars.iv31
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %15 = icmp slt i64 %indvars.iv.next32, %11
  br i1 %15, label %.preheader.us.us.preheader, label %.preheader.us12.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader3.us
  %16 = trunc i64 %14 to i32
  %17 = trunc i64 %14 to i32
  %18 = add i32 %9, %17
  %xtraiter25 = and i32 %18, 1
  %lcmp.mod26 = icmp eq i32 %xtraiter25, 0
  %19 = sub i32 0, %16
  %20 = icmp eq i32 %10, %19
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv20, i64 %indvars.iv31
  %indvars.iv.next23.prol = add nuw nsw i64 %indvars.iv20, 1
  br label %.preheader.us.us

.preheader.us12.preheader:                        ; preds = %.preheader3.us
  %pgocount = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 7)
  %22 = add i64 %pgocount, 1
  store i64 %22, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 7)
  br i1 %lcmp.mod, label %.preheader.us12.prol.loopexit, label %.preheader.us12.prol.preheader

.preheader.us12.prol.preheader:                   ; preds = %.preheader.us12.preheader
  br label %.preheader.us12.prol

.preheader.us12.prol:                             ; preds = %.preheader.us12.prol..preheader.us12.prol_crit_edge, %.preheader.us12.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.preheader.us12.prol..preheader.us12.prol_crit_edge ], [ 0, %.preheader.us12.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.preheader.us12.prol..preheader.us12.prol_crit_edge ], [ %xtraiter, %.preheader.us12.prol.preheader ]
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv.prol
  %24 = load double, double* %23, align 8
  %25 = fmul double %24, %2
  store double %25, double* %23, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader.us12.prol.loopexit.loopexit, label %.preheader.us12.prol..preheader.us12.prol_crit_edge, !llvm.loop !1

.preheader.us12.prol..preheader.us12.prol_crit_edge: ; preds = %.preheader.us12.prol
  %pgocount1 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 1)
  %26 = add i64 %pgocount1, 1
  store i64 %26, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 1)
  br label %.preheader.us12.prol

.preheader.us12.prol.loopexit.loopexit:           ; preds = %.preheader.us12.prol
  %pgocount2 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 9)
  %27 = add i64 %pgocount2, 1
  store i64 %27, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 9)
  br label %.preheader.us12.prol.loopexit

.preheader.us12.prol.loopexit:                    ; preds = %.preheader.us12.prol.loopexit.loopexit, %.preheader.us12.preheader
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us12.preheader ], [ %indvars.iv.next.prol, %.preheader.us12.prol.loopexit.loopexit ]
  br i1 %12, label %._crit_edge7.us, label %.preheader.us12.preheader38

.preheader.us12.preheader38:                      ; preds = %.preheader.us12.prol.loopexit
  %pgocount3 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 10)
  %28 = add i64 %pgocount3, 1
  store i64 %28, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 10)
  %29 = sub i64 %13, %indvars.iv.unr
  %30 = lshr i64 %29, 2
  %31 = add nuw nsw i64 %30, 1
  %min.iters.check = icmp ult i64 %31, 2
  br i1 %min.iters.check, label %.preheader.us12.preheader45, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us12.preheader38
  %pgocount4 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 12)
  %32 = add i64 %pgocount4, 1
  store i64 %32, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 12)
  %n.mod.vf = and i64 %31, 1
  %n.vec = sub nsw i64 %31, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %33 = add i64 %indvars.iv.unr, 4
  %34 = shl nuw i64 %30, 2
  %35 = add i64 %33, %34
  %36 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %35, %36
  br i1 %cmp.zero, label %.preheader.us12.preheader45, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %37 = shl i64 %index, 2
  %38 = add i64 %indvars.iv.unr, %37
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %38
  %40 = bitcast double* %39 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %40, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec40 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec41 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec42 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %41 = fmul <2 x double> %strided.vec, %broadcast.splat44
  %42 = fmul <2 x double> %strided.vec40, %broadcast.splat44
  %43 = fmul <2 x double> %strided.vec41, %broadcast.splat44
  %44 = add nsw i64 %38, 3
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %44
  %46 = fmul <2 x double> %strided.vec42, %broadcast.splat44
  %47 = getelementptr double, double* %45, i64 -3
  %48 = bitcast double* %47 to <8 x double>*
  %49 = shufflevector <2 x double> %41, <2 x double> %42, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %50 = shufflevector <2 x double> %43, <2 x double> %46, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %49, <4 x double> %50, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %48, align 8
  %index.next = add i64 %index, 2
  %51 = icmp eq i64 %index.next, %n.vec
  br i1 %51, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !3

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  %pgocount5 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 4)
  %52 = add i64 %pgocount5, 1
  store i64 %52, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 4)
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %pgocount6 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 13)
  %53 = add i64 %pgocount6, 1
  store i64 %53, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 13)
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge7.us, label %.preheader.us12.preheader45

.preheader.us12.preheader45:                      ; preds = %middle.block, %min.iters.checked, %.preheader.us12.preheader38
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked ], [ %indvars.iv.unr, %.preheader.us12.preheader38 ], [ %ind.end, %middle.block ]
  br label %.preheader.us12

.preheader.us12:                                  ; preds = %.preheader.us12..preheader.us12_crit_edge, %.preheader.us12.preheader45
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us12..preheader.us12_crit_edge ], [ %indvars.iv.ph, %.preheader.us12.preheader45 ]
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv
  %55 = load double, double* %54, align 8
  %56 = fmul double %55, %2
  store double %56, double* %54, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv.next
  %58 = load double, double* %57, align 8
  %59 = fmul double %58, %2
  store double %59, double* %57, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv.next.1
  %61 = load double, double* %60, align 8
  %62 = fmul double %61, %2
  store double %62, double* %60, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv.next.2
  %64 = load double, double* %63, align 8
  %65 = fmul double %64, %2
  store double %65, double* %63, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %._crit_edge7.us.loopexit46, label %.preheader.us12..preheader.us12_crit_edge, !llvm.loop !6

.preheader.us12..preheader.us12_crit_edge:        ; preds = %.preheader.us12
  %pgocount7 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 3)
  %66 = add i64 %pgocount7, 1
  store i64 %66, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 3)
  br label %.preheader.us12

._crit_edge7.us.loopexit:                         ; preds = %._crit_edge.us.us
  %pgocount8 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 8)
  %67 = add i64 %pgocount8, 1
  store i64 %67, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 8)
  br label %._crit_edge7.us

._crit_edge7.us.loopexit46:                       ; preds = %.preheader.us12
  %pgocount9 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 11)
  %68 = add i64 %pgocount9, 1
  store i64 %68, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 11)
  br label %._crit_edge7.us

._crit_edge7.us:                                  ; preds = %._crit_edge7.us.loopexit46, %._crit_edge7.us.loopexit, %middle.block, %.preheader.us12.prol.loopexit
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next32, %wide.trip.count33
  br i1 %exitcond34, label %._crit_edge9.loopexit, label %.preheader3.us

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv28 = phi i64 [ %indvars.iv.next29, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv28
  br i1 %lcmp.mod26, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us.us
  %pgocount10 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 5)
  %70 = add i64 %pgocount10, 1
  store i64 %70, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 5)
  %71 = load double, double* %21, align 8
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv20, i64 %indvars.iv28
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = load double, double* %69, align 8
  %76 = fadd double %75, %74
  store double %76, double* %69, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us.us
  %indvars.iv22.unr.ph = phi i64 [ %indvars.iv.next23.prol, %.prol.preheader ], [ %indvars.iv20, %.preheader.us.us ]
  br i1 %20, label %.prol.loopexit.._crit_edge.us.us_crit_edge, label %.preheader.us.us.new.preheader

.prol.loopexit.._crit_edge.us.us_crit_edge:       ; preds = %.prol.loopexit
  %pgocount11 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 2)
  %77 = add i64 %pgocount11, 1
  store i64 %77, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 2)
  br label %._crit_edge.us.us

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.preheader.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  %pgocount12 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 6)
  %78 = add i64 %pgocount12, 1
  store i64 %78, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 6)
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %.prol.loopexit.._crit_edge.us.us_crit_edge, %._crit_edge.us.us.loopexit
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv28
  %80 = load double, double* %79, align 8
  %81 = fmul double %80, %2
  store double %81, double* %79, align 8
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond = icmp eq i64 %indvars.iv.next29, %wide.trip.count30
  br i1 %exitcond, label %._crit_edge7.us.loopexit, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new..preheader.us.us.new_crit_edge, %.preheader.us.us.new.preheader
  %indvars.iv22 = phi i64 [ %indvars.iv.next23.1, %.preheader.us.us.new..preheader.us.us.new_crit_edge ], [ %indvars.iv22.unr.ph, %.preheader.us.us.new.preheader ]
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv22, i64 %indvars.iv31
  %83 = load double, double* %82, align 8
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv22, i64 %indvars.iv28
  %85 = load double, double* %84, align 8
  %86 = fmul double %83, %85
  %87 = load double, double* %69, align 8
  %88 = fadd double %87, %86
  store double %88, double* %69, align 8
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next23, i64 %indvars.iv31
  %90 = load double, double* %89, align 8
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next23, i64 %indvars.iv28
  %92 = load double, double* %91, align 8
  %93 = fmul double %90, %92
  %94 = load double, double* %69, align 8
  %95 = fadd double %94, %93
  store double %95, double* %69, align 8
  %indvars.iv.next23.1 = add nsw i64 %indvars.iv22, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next23.1, %wide.trip.count24.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new..preheader.us.us.new_crit_edge

.preheader.us.us.new..preheader.us.us.new_crit_edge: ; preds = %.preheader.us.us.new
  %pgocount13 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 0)
  %96 = add i64 %pgocount13, 1
  store i64 %96, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 0)
  br label %.preheader.us.us.new

._crit_edge9.loopexit:                            ; preds = %._crit_edge7.us
  %pgocount14 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 15)
  %97 = add i64 %pgocount14, 1
  store i64 %97, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 15)
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %5
  %pgocount15 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 14)
  %98 = add i64 %pgocount15, 1
  store i64 %98, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 14)
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge4

.preheader.us.preheader:                          ; preds = %3
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count8 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv6 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next7, %._crit_edge.us ]
  %11 = mul nsw i64 %indvars.iv6, %10
  br label %12

; <label>:12:                                     ; preds = %21, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %21 ]
  %13 = add nsw i64 %indvars.iv, %11
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %18, label %._crit_edge

._crit_edge:                                      ; preds = %12
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  br label %21

; <label>:18:                                     ; preds = %12
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %19 = add i64 %pgocount1, 1
  store i64 %19, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %20) #5
  br label %21

; <label>:21:                                     ; preds = %._crit_edge, %18
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv6, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %24) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %12

._crit_edge.us:                                   ; preds = %21
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %26 = add i64 %pgocount2, 1
  store i64 %26, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, %wide.trip.count8
  br i1 %exitcond9, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 4)
  %27 = add i64 %pgocount3, 1
  store i64 %27, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 4)
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %3
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %28 = add i64 %pgocount4, 1
  store i64 %28, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %31) #5
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
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
