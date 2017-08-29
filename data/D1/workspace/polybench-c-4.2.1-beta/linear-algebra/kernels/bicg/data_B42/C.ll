; ModuleID = 'B.ll'
source_filename = "bicg.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"s\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_bicg = private constant [16 x i8] c"B.ll:kernel_bicg"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 32414643582, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [14 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 171516025331, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 14, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_bicg = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_bicg = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4464262574321485026, i64 74813467348, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_bicg, i32 0, i32 0), i8* null, i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 89896666006, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [56 x i8] c"6\00main\01B.ll:init_array\01B.ll:kernel_bicg\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_bicg to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([56 x i8], [56 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %8 = bitcast i8* %3 to [1900 x double]*
  %9 = bitcast i8* %7 to double*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array(i32 1900, i32 2100, [1900 x double]* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = bitcast i8* %4 to double*
  %12 = bitcast i8* %5 to double*
  tail call fastcc void @kernel_bicg(i32 1900, i32 2100, [1900 x double]* %8, double* %11, double* %12, double* %10, double* %9)
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
  tail call fastcc void @print_array(i32 1900, i32 2100, double* %11, double* %12)
  br label %20

; <label>:20:                                     ; preds = %18, %14, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %21 = add i64 %pgocount2, 1
  store i64 %21, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, [1900 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.lr.ph9, label %.preheader

.lr.ph9:                                          ; preds = %5
  %pgocount = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %7 = add i64 %pgocount, 1
  store i64 %7, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %8 = sitofp i32 %0 to double
  %xtraiter26 = and i32 %0, 1
  %lcmp.mod27 = icmp eq i32 %xtraiter26, 0
  br i1 %lcmp.mod27, label %.prol.loopexit25, label %.prol.preheader24

.prol.preheader24:                                ; preds = %.lr.ph9
  %pgocount1 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  %9 = add i64 %pgocount1, 1
  store i64 %9, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  %10 = fdiv double 0.000000e+00, %8
  store double %10, double* %4, align 8
  br label %.prol.loopexit25

.prol.loopexit25:                                 ; preds = %.prol.preheader24, %.lr.ph9
  %indvars.iv20.unr = phi i64 [ 0, %.lr.ph9 ], [ 1, %.prol.preheader24 ]
  %11 = icmp eq i32 %0, 1
  br i1 %11, label %.preheader, label %.lr.ph9.new.preheader

.lr.ph9.new.preheader:                            ; preds = %.prol.loopexit25
  %wide.trip.count22.1 = zext i32 %0 to i64
  br label %.lr.ph9.new

.preheader.loopexit:                              ; preds = %.lr.ph9.new
  %pgocount2 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 10)
  %12 = add i64 %pgocount2, 1
  store i64 %12, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 10)
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.prol.loopexit25, %5
  %13 = icmp sgt i32 %1, 0
  br i1 %13, label %.lr.ph5, label %._crit_edge6

.lr.ph5:                                          ; preds = %.preheader
  %14 = sitofp i32 %1 to double
  %15 = icmp sgt i32 %0, 0
  br i1 %15, label %.lr.ph5.split.us.preheader, label %.lr.ph5.split.preheader

.lr.ph5.split.us.preheader:                       ; preds = %.lr.ph5
  %xtraiter = and i32 %0, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %16 = icmp eq i32 %0, 1
  %wide.trip.count13 = zext i32 %1 to i64
  %wide.trip.count.1 = zext i32 %0 to i64
  br label %.lr.ph5.split.us

.lr.ph5.split.preheader:                          ; preds = %.lr.ph5
  %pgocount3 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 11)
  %17 = add i64 %pgocount3, 1
  store i64 %17, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 11)
  %xtraiter18 = and i32 %1, 1
  %lcmp.mod19 = icmp eq i32 %xtraiter18, 0
  br i1 %lcmp.mod19, label %.lr.ph5.split.prol.loopexit, label %.lr.ph5.split.prol

.lr.ph5.split.prol:                               ; preds = %.lr.ph5.split.preheader
  %pgocount4 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 12)
  %18 = add i64 %pgocount4, 1
  store i64 %18, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 12)
  %19 = fdiv double 0.000000e+00, %14
  store double %19, double* %3, align 8
  br label %.lr.ph5.split.prol.loopexit

.lr.ph5.split.prol.loopexit:                      ; preds = %.lr.ph5.split.prol, %.lr.ph5.split.preheader
  %indvars.iv14.unr = phi i64 [ 0, %.lr.ph5.split.preheader ], [ 1, %.lr.ph5.split.prol ]
  %20 = icmp eq i32 %1, 1
  br i1 %20, label %._crit_edge6, label %.lr.ph5.split.preheader28

.lr.ph5.split.preheader28:                        ; preds = %.lr.ph5.split.prol.loopexit
  %wide.trip.count16.1 = zext i32 %1 to i64
  br label %.lr.ph5.split

.lr.ph5.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph5.split.us.preheader
  %indvars.iv11 = phi i64 [ %indvars.iv.next12, %._crit_edge.us ], [ 0, %.lr.ph5.split.us.preheader ]
  %21 = trunc i64 %indvars.iv11 to i32
  %22 = sitofp i32 %21 to double
  %23 = fdiv double %22, %14
  %24 = getelementptr inbounds double, double* %3, i64 %indvars.iv11
  store double %23, double* %24, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph5.split.us
  %pgocount5 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %25 = add i64 %pgocount5, 1
  store i64 %25, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %26 = trunc i64 %indvars.iv11 to i32
  %27 = srem i32 %26, %1
  %28 = sitofp i32 %27 to double
  %29 = fdiv double %28, %14
  %30 = getelementptr inbounds [1900 x double], [1900 x double]* %2, i64 %indvars.iv11, i64 0
  store double %29, double* %30, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph5.split.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph5.split.us ]
  br i1 %16, label %.prol.loopexit.._crit_edge.us_crit_edge, label %.lr.ph5.split.us.new.preheader

.prol.loopexit.._crit_edge.us_crit_edge:          ; preds = %.prol.loopexit
  %pgocount6 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %31 = add i64 %pgocount6, 1
  store i64 %31, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  br label %._crit_edge.us

.lr.ph5.split.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.lr.ph5.split.us.new

.lr.ph5.split.us.new:                             ; preds = %.lr.ph5.split.us.new..lr.ph5.split.us.new_crit_edge, %.lr.ph5.split.us.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph5.split.us.new..lr.ph5.split.us.new_crit_edge ], [ %indvars.iv.unr.ph, %.lr.ph5.split.us.new.preheader ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %32 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv11
  %33 = trunc i64 %32 to i32
  %34 = srem i32 %33, %1
  %35 = sitofp i32 %34 to double
  %36 = fdiv double %35, %14
  %37 = getelementptr inbounds [1900 x double], [1900 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv
  store double %36, double* %37, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %38 = mul nuw nsw i64 %indvars.iv.next.1, %indvars.iv11
  %39 = trunc i64 %38 to i32
  %40 = srem i32 %39, %1
  %41 = sitofp i32 %40 to double
  %42 = fdiv double %41, %14
  %43 = getelementptr inbounds [1900 x double], [1900 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv.next
  store double %42, double* %43, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph5.split.us.new..lr.ph5.split.us.new_crit_edge

.lr.ph5.split.us.new..lr.ph5.split.us.new_crit_edge: ; preds = %.lr.ph5.split.us.new
  %pgocount7 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %44 = add i64 %pgocount7, 1
  store i64 %44, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  br label %.lr.ph5.split.us.new

._crit_edge.us.loopexit:                          ; preds = %.lr.ph5.split.us.new
  %pgocount8 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %45 = add i64 %pgocount8, 1
  store i64 %45, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.prol.loopexit.._crit_edge.us_crit_edge, %._crit_edge.us.loopexit
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond = icmp eq i64 %indvars.iv.next12, %wide.trip.count13
  br i1 %exitcond, label %._crit_edge6.loopexit, label %.lr.ph5.split.us

.lr.ph9.new:                                      ; preds = %.lr.ph9.new..lr.ph9.new_crit_edge, %.lr.ph9.new.preheader
  %indvars.iv20 = phi i64 [ %indvars.iv.next21.1, %.lr.ph9.new..lr.ph9.new_crit_edge ], [ %indvars.iv20.unr, %.lr.ph9.new.preheader ]
  %46 = trunc i64 %indvars.iv20 to i32
  %47 = sitofp i32 %46 to double
  %48 = fdiv double %47, %8
  %49 = getelementptr inbounds double, double* %4, i64 %indvars.iv20
  store double %48, double* %49, align 8
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %50 = trunc i64 %indvars.iv.next21 to i32
  %51 = sitofp i32 %50 to double
  %52 = fdiv double %51, %8
  %53 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next21
  store double %52, double* %53, align 8
  %indvars.iv.next21.1 = add nsw i64 %indvars.iv20, 2
  %exitcond23.1 = icmp eq i64 %indvars.iv.next21.1, %wide.trip.count22.1
  br i1 %exitcond23.1, label %.preheader.loopexit, label %.lr.ph9.new..lr.ph9.new_crit_edge

.lr.ph9.new..lr.ph9.new_crit_edge:                ; preds = %.lr.ph9.new
  %pgocount9 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %54 = add i64 %pgocount9, 1
  store i64 %54, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  br label %.lr.ph9.new

.lr.ph5.split:                                    ; preds = %.lr.ph5.split..lr.ph5.split_crit_edge, %.lr.ph5.split.preheader28
  %indvars.iv14 = phi i64 [ %indvars.iv.next15.1, %.lr.ph5.split..lr.ph5.split_crit_edge ], [ %indvars.iv14.unr, %.lr.ph5.split.preheader28 ]
  %55 = trunc i64 %indvars.iv14 to i32
  %56 = sitofp i32 %55 to double
  %57 = fdiv double %56, %14
  %58 = getelementptr inbounds double, double* %3, i64 %indvars.iv14
  store double %57, double* %58, align 8
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %59 = trunc i64 %indvars.iv.next15 to i32
  %60 = sitofp i32 %59 to double
  %61 = fdiv double %60, %14
  %62 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next15
  store double %61, double* %62, align 8
  %indvars.iv.next15.1 = add nsw i64 %indvars.iv14, 2
  %exitcond17.1 = icmp eq i64 %indvars.iv.next15.1, %wide.trip.count16.1
  br i1 %exitcond17.1, label %._crit_edge6.loopexit31, label %.lr.ph5.split..lr.ph5.split_crit_edge

.lr.ph5.split..lr.ph5.split_crit_edge:            ; preds = %.lr.ph5.split
  %pgocount10 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %63 = add i64 %pgocount10, 1
  store i64 %63, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  br label %.lr.ph5.split

._crit_edge6.loopexit:                            ; preds = %._crit_edge.us
  %pgocount11 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  %64 = add i64 %pgocount11, 1
  store i64 %64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  br label %._crit_edge6

._crit_edge6.loopexit31:                          ; preds = %.lr.ph5.split
  %pgocount12 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 13)
  %65 = add i64 %pgocount12, 1
  store i64 %65, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 13)
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit31, %._crit_edge6.loopexit, %.lr.ph5.split.prol.loopexit, %.preheader
  %pgocount13 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %66 = add i64 %pgocount13, 1
  store i64 %66, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_bicg(i32, i32, [1900 x double]* nocapture readonly, double* nocapture, double* nocapture, double* nocapture readonly, double* nocapture readonly) unnamed_addr #2 {
  %8 = bitcast double* %4 to i8*
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.preheader.loopexit, label %.preheader

.preheader.loopexit:                              ; preds = %7
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_bicg, i64 0, i64 3)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_bicg, i64 0, i64 3)
  %11 = bitcast double* %3 to i8*
  %12 = add i32 %0, -1
  %13 = zext i32 %12 to i64
  %14 = shl nuw nsw i64 %13, 3
  %15 = add nuw nsw i64 %14, 8
  call void @llvm.memset.p0i8.i64(i8* %11, i8 0, i64 %15, i32 8, i1 false)
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %7
  %16 = icmp sgt i32 %1, 0
  br i1 %16, label %.lr.ph4, label %._crit_edge5

.lr.ph4:                                          ; preds = %.preheader
  %17 = icmp sgt i32 %0, 0
  br i1 %17, label %.lr.ph4.split.us.preheader, label %._crit_edge5.loopexit9

.lr.ph4.split.us.preheader:                       ; preds = %.lr.ph4
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count12 = zext i32 %1 to i64
  br label %.lr.ph4.split.us

.lr.ph4.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph4.split.us.preheader
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %._crit_edge.us ], [ 0, %.lr.ph4.split.us.preheader ]
  %18 = getelementptr inbounds double, double* %4, i64 %indvars.iv10
  store double 0.000000e+00, double* %18, align 8
  %19 = getelementptr inbounds double, double* %6, i64 %indvars.iv10
  br label %20

; <label>:20:                                     ; preds = %._crit_edge, %.lr.ph4.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph4.split.us ], [ %indvars.iv.next, %._crit_edge ]
  %21 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = load double, double* %19, align 8
  %24 = getelementptr inbounds [1900 x double], [1900 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fadd double %22, %26
  store double %27, double* %21, align 8
  %28 = load double, double* %18, align 8
  %29 = load double, double* %24, align 8
  %30 = getelementptr inbounds double, double* %5, i64 %indvars.iv
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = fadd double %28, %32
  store double %33, double* %18, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge:                                      ; preds = %20
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_bicg, i64 0, i64 0)
  %34 = add i64 %pgocount1, 1
  store i64 %34, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_bicg, i64 0, i64 0)
  br label %20

._crit_edge.us:                                   ; preds = %20
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_bicg, i64 0, i64 1)
  %35 = add i64 %pgocount2, 1
  store i64 %35, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_bicg, i64 0, i64 1)
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next11, %wide.trip.count12
  br i1 %exitcond13, label %._crit_edge5.loopexit, label %.lr.ph4.split.us

._crit_edge5.loopexit9:                           ; preds = %.lr.ph4
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_bicg, i64 0, i64 5)
  %36 = add i64 %pgocount3, 1
  store i64 %36, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_bicg, i64 0, i64 5)
  %37 = add i32 %1, -1
  %38 = zext i32 %37 to i64
  %39 = shl nuw nsw i64 %38, 3
  %40 = add nuw nsw i64 %39, 8
  call void @llvm.memset.p0i8.i64(i8* %8, i8 0, i64 %40, i32 8, i1 false)
  br label %._crit_edge5

._crit_edge5.loopexit:                            ; preds = %._crit_edge.us
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_bicg, i64 0, i64 4)
  %41 = add i64 %pgocount4, 1
  store i64 %41, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_bicg, i64 0, i64 4)
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit, %._crit_edge5.loopexit9, %.preheader
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_bicg, i64 0, i64 2)
  %42 = add i64 %pgocount5, 1
  store i64 %42, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_bicg, i64 0, i64 2)
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, double* nocapture readonly, double* nocapture readonly) unnamed_addr #0 {
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #6
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.lr.ph7.preheader, label %._crit_edge8

.lr.ph7.preheader:                                ; preds = %4
  %wide.trip.count11 = zext i32 %0 to i64
  br label %.lr.ph7

.lr.ph7:                                          ; preds = %17, %.lr.ph7.preheader
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %17 ], [ 0, %.lr.ph7.preheader ]
  %10 = trunc i64 %indvars.iv9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %14, label %.lr.ph7._crit_edge

.lr.ph7._crit_edge:                               ; preds = %.lr.ph7
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  br label %17

; <label>:14:                                     ; preds = %.lr.ph7
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %15 = add i64 %pgocount1, 1
  store i64 %15, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #6
  br label %17

; <label>:17:                                     ; preds = %.lr.ph7._crit_edge, %14
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds double, double* %2, i64 %indvars.iv9
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next10, %wide.trip.count11
  br i1 %exitcond12, label %._crit_edge8.loopexit, label %.lr.ph7

._crit_edge8.loopexit:                            ; preds = %17
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i64 0, i64 5)
  %22 = add i64 %pgocount2, 1
  store i64 %22, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i64 0, i64 5)
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %4
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %27 = icmp sgt i32 %1, 0
  br i1 %27, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %._crit_edge8
  %wide.trip.count = zext i32 %1 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %35, %.lr.ph.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %35 ], [ 0, %.lr.ph.preheader ]
  %28 = trunc i64 %indvars.iv to i32
  %29 = srem i32 %28, 20
  %30 = icmp eq i32 %29, 0
  br i1 %30, label %32, label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %.lr.ph
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %31 = add i64 %pgocount3, 1
  store i64 %31, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  br label %35

; <label>:32:                                     ; preds = %.lr.ph
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i64 0, i64 4)
  %33 = add i64 %pgocount4, 1
  store i64 %33, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i64 0, i64 4)
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %34) #6
  br label %35

; <label>:35:                                     ; preds = %.lr.ph._crit_edge, %32
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %37 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %38 = load double, double* %37, align 8
  %39 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %36, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %38) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %35
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i64 0, i64 6)
  %40 = add i64 %pgocount5, 1
  store i64 %40, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i64 0, i64 6)
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge8
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %41 = add i64 %pgocount6, 1
  store i64 %41, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %43 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %42, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %45 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %44) #6
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
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

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
