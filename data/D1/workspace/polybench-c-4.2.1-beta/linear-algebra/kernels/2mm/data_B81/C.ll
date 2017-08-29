; ModuleID = 'B.ll'
source_filename = "2mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"D\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_2mm = private constant [15 x i8] c"B.ll:kernel_2mm"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 32414643582, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [19 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 223627448211, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 19, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_2mm = private global [25 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_2mm = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8177580728753112165, i64 299150950334, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i32 0, i32 0), i8* null, i8* null, i32 25, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 63976198547, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [55 x i8] c"5\00main\01B.ll:init_array\01B.ll:kernel_2mm\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_2mm to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([55 x i8], [55 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 720000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 880000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 990000, i32 8) #4
  %8 = tail call i8* @polybench_alloc_data(i64 1080000, i32 8) #4
  %9 = tail call i8* @polybench_alloc_data(i64 960000, i32 8) #4
  %10 = bitcast i8* %6 to [1100 x double]*
  %11 = bitcast i8* %7 to [900 x double]*
  %12 = bitcast i8* %8 to [1200 x double]*
  %13 = bitcast i8* %9 to [1200 x double]*
  call fastcc void @init_array(i32 800, i32 900, i32 1100, i32 1200, double* nonnull %3, double* nonnull %4, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %13)
  tail call void (...) @polybench_timer_start() #4
  %14 = load double, double* %3, align 8
  %15 = load double, double* %4, align 8
  %16 = bitcast i8* %5 to [900 x double]*
  tail call fastcc void @kernel_2mm(i32 800, i32 900, i32 1100, i32 1200, double %14, double %15, [900 x double]* %16, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %13)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %17 = icmp sgt i32 %0, 42
  br i1 %17, label %18, label %24

; <label>:18:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %20 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %20, align 1
  %21 = icmp eq i8 %strcmpload, 0
  br i1 %21, label %22, label %24

; <label>:22:                                     ; preds = %18
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %23 = add i64 %pgocount1, 1
  store i64 %23, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  tail call fastcc void @print_array(i32 800, i32 1200, [1200 x double]* %13)
  br label %24

; <label>:24:                                     ; preds = %22, %18, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %25 = add i64 %pgocount2, 1
  store i64 %25, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  tail call void @free(i8* %8) #4
  tail call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, i32, double* nocapture, double* nocapture, [1100 x double]* nocapture, [900 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %4, align 8
  store double 1.200000e+00, double* %5, align 8
  %11 = icmp sgt i32 %0, 0
  br i1 %11, label %.preheader10.lr.ph, label %.preheader9

.preheader10.lr.ph:                               ; preds = %10
  %pgocount = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 11)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 11)
  %13 = icmp sgt i32 %2, 0
  %14 = sitofp i32 %0 to double
  br i1 %13, label %.preheader10.us.preheader, label %.preheader7

.preheader10.us.preheader:                        ; preds = %.preheader10.lr.ph
  %wide.trip.count59 = zext i32 %2 to i64
  %wide.trip.count63 = zext i32 %0 to i64
  br label %.preheader10.us

.preheader10.us:                                  ; preds = %._crit_edge27.us, %.preheader10.us.preheader
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge27.us ], [ 0, %.preheader10.us.preheader ]
  br label %15

; <label>:15:                                     ; preds = %._crit_edge, %.preheader10.us
  %indvars.iv57 = phi i64 [ 0, %.preheader10.us ], [ %indvars.iv.next58, %._crit_edge ]
  %16 = mul nuw nsw i64 %indvars.iv57, %indvars.iv61
  %17 = add nuw nsw i64 %16, 1
  %18 = trunc i64 %17 to i32
  %19 = srem i32 %18, %0
  %20 = sitofp i32 %19 to double
  %21 = fdiv double %20, %14
  %22 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %indvars.iv61, i64 %indvars.iv57
  store double %21, double* %22, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next58, %wide.trip.count59
  br i1 %exitcond60, label %._crit_edge27.us, label %._crit_edge

._crit_edge:                                      ; preds = %15
  %pgocount3 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %23 = add i64 %pgocount3, 1
  store i64 %23, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  br label %15

._crit_edge27.us:                                 ; preds = %15
  %pgocount4 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %24 = add i64 %pgocount4, 1
  store i64 %24, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next62, %wide.trip.count63
  br i1 %exitcond64, label %.preheader9.loopexit, label %.preheader10.us

.preheader9.loopexit:                             ; preds = %._crit_edge27.us
  %pgocount5 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 15)
  %25 = add i64 %pgocount5, 1
  store i64 %25, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 15)
  br label %.preheader9

.preheader9:                                      ; preds = %.preheader9.loopexit, %10
  %26 = icmp sgt i32 %2, 0
  br i1 %26, label %.preheader8.lr.ph, label %.preheader7

.preheader8.lr.ph:                                ; preds = %.preheader9
  %pgocount6 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 14)
  %27 = add i64 %pgocount6, 1
  store i64 %27, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 14)
  %28 = icmp sgt i32 %1, 0
  %29 = sitofp i32 %1 to double
  br i1 %28, label %.preheader8.us.preheader, label %.preheader5

.preheader8.us.preheader:                         ; preds = %.preheader8.lr.ph
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %30 = icmp eq i32 %1, 1
  %wide.trip.count54 = zext i32 %2 to i64
  %wide.trip.count50.1 = zext i32 %1 to i64
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %._crit_edge22.us, %.preheader8.us.preheader
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %._crit_edge22.us ], [ 0, %.preheader8.us.preheader ]
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader8.us
  %pgocount7 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  %31 = add i64 %pgocount7, 1
  store i64 %31, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  %32 = trunc i64 %indvars.iv52 to i32
  %33 = srem i32 %32, %1
  %34 = sitofp i32 %33 to double
  %35 = fdiv double %34, %29
  %36 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv52, i64 0
  store double %35, double* %36, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader8.us
  %indvars.iv48.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader8.us ]
  br i1 %30, label %.prol.loopexit.._crit_edge22.us_crit_edge, label %.preheader8.us.new.preheader

.prol.loopexit.._crit_edge22.us_crit_edge:        ; preds = %.prol.loopexit
  %pgocount8 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %37 = add i64 %pgocount8, 1
  store i64 %37, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  br label %._crit_edge22.us

.preheader8.us.new.preheader:                     ; preds = %.prol.loopexit
  br label %.preheader8.us.new

.preheader8.us.new:                               ; preds = %.preheader8.us.new..preheader8.us.new_crit_edge, %.preheader8.us.new.preheader
  %indvars.iv48 = phi i64 [ %indvars.iv.next49.1, %.preheader8.us.new..preheader8.us.new_crit_edge ], [ %indvars.iv48.unr.ph, %.preheader8.us.new.preheader ]
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %38 = mul nuw nsw i64 %indvars.iv.next49, %indvars.iv52
  %39 = trunc i64 %38 to i32
  %40 = srem i32 %39, %1
  %41 = sitofp i32 %40 to double
  %42 = fdiv double %41, %29
  %43 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv52, i64 %indvars.iv48
  store double %42, double* %43, align 8
  %indvars.iv.next49.1 = add nsw i64 %indvars.iv48, 2
  %44 = mul nuw nsw i64 %indvars.iv.next49.1, %indvars.iv52
  %45 = trunc i64 %44 to i32
  %46 = srem i32 %45, %1
  %47 = sitofp i32 %46 to double
  %48 = fdiv double %47, %29
  %49 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv52, i64 %indvars.iv.next49
  store double %48, double* %49, align 8
  %exitcond51.1 = icmp eq i64 %indvars.iv.next49.1, %wide.trip.count50.1
  br i1 %exitcond51.1, label %._crit_edge22.us.loopexit, label %.preheader8.us.new..preheader8.us.new_crit_edge

.preheader8.us.new..preheader8.us.new_crit_edge:  ; preds = %.preheader8.us.new
  %pgocount9 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %50 = add i64 %pgocount9, 1
  store i64 %50, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  br label %.preheader8.us.new

._crit_edge22.us.loopexit:                        ; preds = %.preheader8.us.new
  %pgocount10 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  %51 = add i64 %pgocount10, 1
  store i64 %51, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  br label %._crit_edge22.us

._crit_edge22.us:                                 ; preds = %.prol.loopexit.._crit_edge22.us_crit_edge, %._crit_edge22.us.loopexit
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, %wide.trip.count54
  br i1 %exitcond55, label %.preheader7.loopexit, label %.preheader8.us

.preheader7.loopexit:                             ; preds = %._crit_edge22.us
  %pgocount11 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 18)
  %52 = add i64 %pgocount11, 1
  store i64 %52, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 18)
  br label %.preheader7

.preheader7:                                      ; preds = %.preheader7.loopexit, %.preheader9, %.preheader10.lr.ph
  %53 = icmp sgt i32 %1, 0
  br i1 %53, label %.preheader6.lr.ph, label %.preheader5

.preheader6.lr.ph:                                ; preds = %.preheader7
  %pgocount12 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 13)
  %54 = add i64 %pgocount12, 1
  store i64 %54, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 13)
  %55 = icmp sgt i32 %3, 0
  %56 = sitofp i32 %3 to double
  br i1 %55, label %.preheader6.us.preheader, label %.preheader5

.preheader6.us.preheader:                         ; preds = %.preheader6.lr.ph
  %wide.trip.count41 = zext i32 %3 to i64
  %wide.trip.count45 = zext i32 %1 to i64
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %._crit_edge17.us, %.preheader6.us.preheader
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %._crit_edge17.us ], [ 0, %.preheader6.us.preheader ]
  br label %57

; <label>:57:                                     ; preds = %._crit_edge2, %.preheader6.us
  %indvars.iv39 = phi i64 [ 0, %.preheader6.us ], [ %indvars.iv.next40, %._crit_edge2 ]
  %58 = add nuw nsw i64 %indvars.iv39, 3
  %59 = mul nuw nsw i64 %58, %indvars.iv43
  %60 = add nuw nsw i64 %59, 1
  %61 = trunc i64 %60 to i32
  %62 = srem i32 %61, %3
  %63 = sitofp i32 %62 to double
  %64 = fdiv double %63, %56
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %8, i64 %indvars.iv43, i64 %indvars.iv39
  store double %64, double* %65, align 8
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, %wide.trip.count41
  br i1 %exitcond42, label %._crit_edge17.us, label %._crit_edge2

._crit_edge2:                                     ; preds = %57
  %pgocount13 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %66 = add i64 %pgocount13, 1
  store i64 %66, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  br label %57

._crit_edge17.us:                                 ; preds = %57
  %pgocount14 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %67 = add i64 %pgocount14, 1
  store i64 %67, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next44, %wide.trip.count45
  br i1 %exitcond46, label %.preheader5.loopexit, label %.preheader6.us

.preheader5.loopexit:                             ; preds = %._crit_edge17.us
  %pgocount15 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 17)
  %68 = add i64 %pgocount15, 1
  store i64 %68, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 17)
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.loopexit, %.preheader6.lr.ph, %.preheader7, %.preheader8.lr.ph
  %69 = icmp sgt i32 %0, 0
  br i1 %69, label %.preheader.lr.ph, label %._crit_edge14

.preheader.lr.ph:                                 ; preds = %.preheader5
  %pgocount16 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 12)
  %70 = add i64 %pgocount16, 1
  store i64 %70, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 12)
  %71 = icmp sgt i32 %3, 0
  %72 = sitofp i32 %2 to double
  br i1 %71, label %.preheader.us.preheader, label %._crit_edge14

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %wide.trip.count = zext i32 %3 to i64
  %wide.trip.count36 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %73

; <label>:73:                                     ; preds = %._crit_edge1, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge1 ]
  %74 = add nuw nsw i64 %indvars.iv, 2
  %75 = mul nuw nsw i64 %74, %indvars.iv34
  %76 = trunc i64 %75 to i32
  %77 = srem i32 %76, %2
  %78 = sitofp i32 %77 to double
  %79 = fdiv double %78, %72
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv34, i64 %indvars.iv
  store double %79, double* %80, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge1

._crit_edge1:                                     ; preds = %73
  %pgocount17 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %81 = add i64 %pgocount17, 1
  store i64 %81, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  br label %73

._crit_edge.us:                                   ; preds = %73
  %pgocount18 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %82 = add i64 %pgocount18, 1
  store i64 %82, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next35, %wide.trip.count36
  br i1 %exitcond37, label %._crit_edge14.loopexit, label %.preheader.us

._crit_edge14.loopexit:                           ; preds = %._crit_edge.us
  %pgocount19 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 16)
  %83 = add i64 %pgocount19, 1
  store i64 %83, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 16)
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %.preheader.lr.ph, %.preheader5
  %pgocount20 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 10)
  %84 = add i64 %pgocount20, 1
  store i64 %84, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 10)
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_2mm(i32, i32, i32, i32, double, double, [900 x double]* nocapture, [1100 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1200 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
  %12 = icmp sgt i32 %0, 0
  br i1 %12, label %.preheader6.lr.ph, label %._crit_edge12

.preheader6.lr.ph:                                ; preds = %11
  %pgocount = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 21)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 21)
  %14 = icmp sgt i32 %1, 0
  %15 = icmp sgt i32 %2, 0
  br i1 %14, label %.preheader6.us.preheader, label %.preheader.lr.ph

.preheader6.us.preheader:                         ; preds = %.preheader6.lr.ph
  %16 = add i32 %1, -1
  %17 = zext i32 %16 to i64
  %18 = shl nuw nsw i64 %17, 3
  %19 = add nuw nsw i64 %18, 8
  %wide.trip.count72 = zext i32 %0 to i64
  %xtraiter62 = and i32 %2, 1
  %lcmp.mod63 = icmp eq i32 %xtraiter62, 0
  %20 = icmp eq i32 %2, 1
  %wide.trip.count66 = zext i32 %1 to i64
  %wide.trip.count58.1 = zext i32 %2 to i64
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %._crit_edge25.us, %.preheader6.us.preheader
  %indvars.iv70 = phi i64 [ 0, %.preheader6.us.preheader ], [ %indvars.iv.next71, %._crit_edge25.us ]
  br i1 %15, label %.lr.ph21.us.us.preheader, label %._crit_edge25.us.loopexit35

.lr.ph21.us.us.preheader:                         ; preds = %.preheader6.us
  %21 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv70, i64 0
  br label %.lr.ph21.us.us

._crit_edge25.us.loopexit35:                      ; preds = %.preheader6.us
  %pgocount1 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 14)
  %22 = add i64 %pgocount1, 1
  store i64 %22, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 14)
  %scevgep = getelementptr [900 x double], [900 x double]* %6, i64 %indvars.iv70, i64 0
  %scevgep55 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep55, i8 0, i64 %19, i32 8, i1 false)
  br label %._crit_edge25.us

._crit_edge25.us.loopexit:                        ; preds = %._crit_edge22.us.us
  %pgocount2 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 12)
  %23 = add i64 %pgocount2, 1
  store i64 %23, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 12)
  br label %._crit_edge25.us

._crit_edge25.us:                                 ; preds = %._crit_edge25.us.loopexit, %._crit_edge25.us.loopexit35
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond73 = icmp eq i64 %indvars.iv.next71, %wide.trip.count72
  br i1 %exitcond73, label %.preheader5, label %.preheader6.us

.lr.ph21.us.us:                                   ; preds = %._crit_edge22.us.us, %.lr.ph21.us.us.preheader
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %._crit_edge22.us.us ], [ 0, %.lr.ph21.us.us.preheader ]
  %24 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv70, i64 %indvars.iv64
  store double 0.000000e+00, double* %24, align 8
  br i1 %lcmp.mod63, label %.prol.loopexit61, label %.prol.preheader60

.prol.preheader60:                                ; preds = %.lr.ph21.us.us
  %pgocount3 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 8)
  %25 = add i64 %pgocount3, 1
  store i64 %25, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 8)
  %26 = load double, double* %21, align 8
  %27 = fmul double %26, %4
  %28 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 0, i64 %indvars.iv64
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = load double, double* %24, align 8
  %32 = fadd double %31, %30
  store double %32, double* %24, align 8
  br label %.prol.loopexit61

.prol.loopexit61:                                 ; preds = %.prol.preheader60, %.lr.ph21.us.us
  %indvars.iv56.unr.ph = phi i64 [ 1, %.prol.preheader60 ], [ 0, %.lr.ph21.us.us ]
  br i1 %20, label %.prol.loopexit61.._crit_edge22.us.us_crit_edge, label %.lr.ph21.us.us.new.preheader

.prol.loopexit61.._crit_edge22.us.us_crit_edge:   ; preds = %.prol.loopexit61
  %pgocount4 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 2)
  %33 = add i64 %pgocount4, 1
  store i64 %33, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 2)
  br label %._crit_edge22.us.us

.lr.ph21.us.us.new.preheader:                     ; preds = %.prol.loopexit61
  br label %.lr.ph21.us.us.new

._crit_edge22.us.us.loopexit:                     ; preds = %.lr.ph21.us.us.new
  %pgocount5 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 9)
  %34 = add i64 %pgocount5, 1
  store i64 %34, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 9)
  br label %._crit_edge22.us.us

._crit_edge22.us.us:                              ; preds = %.prol.loopexit61.._crit_edge22.us.us_crit_edge, %._crit_edge22.us.us.loopexit
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next65, %wide.trip.count66
  br i1 %exitcond67, label %._crit_edge25.us.loopexit, label %.lr.ph21.us.us

.lr.ph21.us.us.new:                               ; preds = %.lr.ph21.us.us.new..lr.ph21.us.us.new_crit_edge, %.lr.ph21.us.us.new.preheader
  %indvars.iv56 = phi i64 [ %indvars.iv.next57.1, %.lr.ph21.us.us.new..lr.ph21.us.us.new_crit_edge ], [ %indvars.iv56.unr.ph, %.lr.ph21.us.us.new.preheader ]
  %35 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv70, i64 %indvars.iv56
  %36 = load double, double* %35, align 8
  %37 = fmul double %36, %4
  %38 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 %indvars.iv56, i64 %indvars.iv64
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = load double, double* %24, align 8
  %42 = fadd double %41, %40
  store double %42, double* %24, align 8
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %43 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv70, i64 %indvars.iv.next57
  %44 = load double, double* %43, align 8
  %45 = fmul double %44, %4
  %46 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 %indvars.iv.next57, i64 %indvars.iv64
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = load double, double* %24, align 8
  %50 = fadd double %49, %48
  store double %50, double* %24, align 8
  %indvars.iv.next57.1 = add nsw i64 %indvars.iv56, 2
  %exitcond59.1 = icmp eq i64 %indvars.iv.next57.1, %wide.trip.count58.1
  br i1 %exitcond59.1, label %._crit_edge22.us.us.loopexit, label %.lr.ph21.us.us.new..lr.ph21.us.us.new_crit_edge

.lr.ph21.us.us.new..lr.ph21.us.us.new_crit_edge:  ; preds = %.lr.ph21.us.us.new
  %pgocount6 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 0)
  %51 = add i64 %pgocount6, 1
  store i64 %51, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 0)
  br label %.lr.ph21.us.us.new

.preheader5:                                      ; preds = %._crit_edge25.us
  %pgocount7 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 23)
  %52 = add i64 %pgocount7, 1
  store i64 %52, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 23)
  %53 = icmp sgt i32 %0, 0
  br i1 %53, label %.preheader.lr.ph, label %.preheader5.._crit_edge12_crit_edge

.preheader5.._crit_edge12_crit_edge:              ; preds = %.preheader5
  %pgocount8 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 7)
  %54 = add i64 %pgocount8, 1
  store i64 %54, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 7)
  br label %._crit_edge12

.preheader.lr.ph:                                 ; preds = %.preheader5, %.preheader6.lr.ph
  %55 = icmp sgt i32 %3, 0
  %56 = icmp sgt i32 %1, 0
  br i1 %55, label %.preheader.us.preheader, label %._crit_edge12

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %57 = add i32 %3, -1
  %wide.trip.count48 = zext i32 %0 to i64
  %xtraiter = and i32 %3, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %58 = icmp ult i32 %57, 3
  %wide.trip.count.3 = zext i32 %3 to i64
  %xtraiter40 = and i32 %1, 1
  %lcmp.mod41 = icmp eq i32 %xtraiter40, 0
  %59 = icmp eq i32 %1, 1
  %wide.trip.count45 = zext i32 %3 to i64
  %wide.trip.count39.1 = zext i32 %1 to i64
  %60 = add nsw i64 %wide.trip.count45, -4
  %broadcast.splatinsert83 = insertelement <2 x double> undef, double %5, i32 0
  %broadcast.splat84 = shufflevector <2 x double> %broadcast.splatinsert83, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge10.us, %.preheader.us.preheader
  %indvars.iv46 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next47, %._crit_edge10.us ]
  br i1 %56, label %.lr.ph.us.us.preheader, label %.lr.ph9..lr.ph9.split_crit_edge.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %.preheader.us
  %61 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv46, i64 0
  br label %.lr.ph.us.us

.lr.ph9..lr.ph9.split_crit_edge.us.preheader:     ; preds = %.preheader.us
  %pgocount9 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 15)
  %62 = add i64 %pgocount9, 1
  store i64 %62, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 15)
  br i1 %lcmp.mod, label %.lr.ph9..lr.ph9.split_crit_edge.us.prol.loopexit, label %.lr.ph9..lr.ph9.split_crit_edge.us.prol.preheader

.lr.ph9..lr.ph9.split_crit_edge.us.prol.preheader: ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us.preheader
  br label %.lr.ph9..lr.ph9.split_crit_edge.us.prol

.lr.ph9..lr.ph9.split_crit_edge.us.prol:          ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us.prol..lr.ph9..lr.ph9.split_crit_edge.us.prol_crit_edge, %.lr.ph9..lr.ph9.split_crit_edge.us.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph9..lr.ph9.split_crit_edge.us.prol..lr.ph9..lr.ph9.split_crit_edge.us.prol_crit_edge ], [ 0, %.lr.ph9..lr.ph9.split_crit_edge.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph9..lr.ph9.split_crit_edge.us.prol..lr.ph9..lr.ph9.split_crit_edge.us.prol_crit_edge ], [ %xtraiter, %.lr.ph9..lr.ph9.split_crit_edge.us.prol.preheader ]
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv46, i64 %indvars.iv.prol
  %64 = load double, double* %63, align 8
  %65 = fmul double %64, %5
  store double %65, double* %63, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph9..lr.ph9.split_crit_edge.us.prol.loopexit.loopexit, label %.lr.ph9..lr.ph9.split_crit_edge.us.prol..lr.ph9..lr.ph9.split_crit_edge.us.prol_crit_edge, !llvm.loop !1

.lr.ph9..lr.ph9.split_crit_edge.us.prol..lr.ph9..lr.ph9.split_crit_edge.us.prol_crit_edge: ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us.prol
  %pgocount10 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 4)
  %66 = add i64 %pgocount10, 1
  store i64 %66, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 4)
  br label %.lr.ph9..lr.ph9.split_crit_edge.us.prol

.lr.ph9..lr.ph9.split_crit_edge.us.prol.loopexit.loopexit: ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us.prol
  %pgocount11 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 16)
  %67 = add i64 %pgocount11, 1
  store i64 %67, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 16)
  br label %.lr.ph9..lr.ph9.split_crit_edge.us.prol.loopexit

.lr.ph9..lr.ph9.split_crit_edge.us.prol.loopexit: ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us.prol.loopexit.loopexit, %.lr.ph9..lr.ph9.split_crit_edge.us.preheader
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph9..lr.ph9.split_crit_edge.us.preheader ], [ %indvars.iv.next.prol, %.lr.ph9..lr.ph9.split_crit_edge.us.prol.loopexit.loopexit ]
  br i1 %58, label %._crit_edge10.us, label %.lr.ph9..lr.ph9.split_crit_edge.us.preheader78

.lr.ph9..lr.ph9.split_crit_edge.us.preheader78:   ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us.prol.loopexit
  %pgocount12 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 17)
  %68 = add i64 %pgocount12, 1
  store i64 %68, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 17)
  %69 = sub i64 %60, %indvars.iv.unr
  %70 = lshr i64 %69, 2
  %71 = add nuw nsw i64 %70, 1
  %min.iters.check = icmp ult i64 %71, 2
  br i1 %min.iters.check, label %.lr.ph9..lr.ph9.split_crit_edge.us.preheader85, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us.preheader78
  %pgocount13 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 20)
  %72 = add i64 %pgocount13, 1
  store i64 %72, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 20)
  %n.mod.vf = and i64 %71, 1
  %n.vec = sub nsw i64 %71, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %73 = add i64 %indvars.iv.unr, 4
  %74 = shl nuw i64 %70, 2
  %75 = add i64 %73, %74
  %76 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %75, %76
  br i1 %cmp.zero, label %.lr.ph9..lr.ph9.split_crit_edge.us.preheader85, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %77 = shl i64 %index, 2
  %78 = add i64 %indvars.iv.unr, %77
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv46, i64 %78
  %80 = bitcast double* %79 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %80, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec80 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec81 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec82 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %81 = fmul <2 x double> %strided.vec, %broadcast.splat84
  %82 = fmul <2 x double> %strided.vec80, %broadcast.splat84
  %83 = fmul <2 x double> %strided.vec81, %broadcast.splat84
  %84 = add nsw i64 %78, 3
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv46, i64 %84
  %86 = fmul <2 x double> %strided.vec82, %broadcast.splat84
  %87 = getelementptr double, double* %85, i64 -3
  %88 = bitcast double* %87 to <8 x double>*
  %89 = shufflevector <2 x double> %81, <2 x double> %82, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %90 = shufflevector <2 x double> %83, <2 x double> %86, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %89, <4 x double> %90, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %88, align 8
  %index.next = add i64 %index, 2
  %91 = icmp eq i64 %index.next, %n.vec
  br i1 %91, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !3

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  %pgocount14 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 6)
  %92 = add i64 %pgocount14, 1
  store i64 %92, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 6)
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %pgocount15 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 22)
  %93 = add i64 %pgocount15, 1
  store i64 %93, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 22)
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge10.us, label %.lr.ph9..lr.ph9.split_crit_edge.us.preheader85

.lr.ph9..lr.ph9.split_crit_edge.us.preheader85:   ; preds = %middle.block, %min.iters.checked, %.lr.ph9..lr.ph9.split_crit_edge.us.preheader78
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked ], [ %indvars.iv.unr, %.lr.ph9..lr.ph9.split_crit_edge.us.preheader78 ], [ %ind.end, %middle.block ]
  br label %.lr.ph9..lr.ph9.split_crit_edge.us

.lr.ph9..lr.ph9.split_crit_edge.us:               ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us..lr.ph9..lr.ph9.split_crit_edge.us_crit_edge, %.lr.ph9..lr.ph9.split_crit_edge.us.preheader85
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph9..lr.ph9.split_crit_edge.us..lr.ph9..lr.ph9.split_crit_edge.us_crit_edge ], [ %indvars.iv.ph, %.lr.ph9..lr.ph9.split_crit_edge.us.preheader85 ]
  %94 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv46, i64 %indvars.iv
  %95 = load double, double* %94, align 8
  %96 = fmul double %95, %5
  store double %96, double* %94, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %97 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv46, i64 %indvars.iv.next
  %98 = load double, double* %97, align 8
  %99 = fmul double %98, %5
  store double %99, double* %97, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %100 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv46, i64 %indvars.iv.next.1
  %101 = load double, double* %100, align 8
  %102 = fmul double %101, %5
  store double %102, double* %100, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %103 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv46, i64 %indvars.iv.next.2
  %104 = load double, double* %103, align 8
  %105 = fmul double %104, %5
  store double %105, double* %103, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %._crit_edge10.us.loopexit86, label %.lr.ph9..lr.ph9.split_crit_edge.us..lr.ph9..lr.ph9.split_crit_edge.us_crit_edge, !llvm.loop !6

.lr.ph9..lr.ph9.split_crit_edge.us..lr.ph9..lr.ph9.split_crit_edge.us_crit_edge: ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us
  %pgocount16 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 5)
  %106 = add i64 %pgocount16, 1
  store i64 %106, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 5)
  br label %.lr.ph9..lr.ph9.split_crit_edge.us

._crit_edge10.us.loopexit:                        ; preds = %._crit_edge.us.us
  %pgocount17 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 13)
  %107 = add i64 %pgocount17, 1
  store i64 %107, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 13)
  br label %._crit_edge10.us

._crit_edge10.us.loopexit86:                      ; preds = %.lr.ph9..lr.ph9.split_crit_edge.us
  %pgocount18 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 18)
  %108 = add i64 %pgocount18, 1
  store i64 %108, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 18)
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %._crit_edge10.us.loopexit86, %._crit_edge10.us.loopexit, %middle.block, %.lr.ph9..lr.ph9.split_crit_edge.us.prol.loopexit
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next47, %wide.trip.count48
  br i1 %exitcond49, label %._crit_edge12.loopexit, label %.preheader.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph.us.us.preheader
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %._crit_edge.us.us ], [ 0, %.lr.ph.us.us.preheader ]
  %109 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv46, i64 %indvars.iv43
  %110 = load double, double* %109, align 8
  %111 = fmul double %110, %5
  store double %111, double* %109, align 8
  br i1 %lcmp.mod41, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %pgocount19 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 10)
  %112 = add i64 %pgocount19, 1
  store i64 %112, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 10)
  %113 = load double, double* %61, align 8
  %114 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 0, i64 %indvars.iv43
  %115 = load double, double* %114, align 8
  %116 = fmul double %113, %115
  %117 = load double, double* %109, align 8
  %118 = fadd double %117, %116
  store double %118, double* %109, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %indvars.iv37.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %59, label %.prol.loopexit.._crit_edge.us.us_crit_edge, label %.lr.ph.us.us.new.preheader

.prol.loopexit.._crit_edge.us.us_crit_edge:       ; preds = %.prol.loopexit
  %pgocount20 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 3)
  %119 = add i64 %pgocount20, 1
  store i64 %119, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 3)
  br label %._crit_edge.us.us

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  %pgocount21 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 11)
  %120 = add i64 %pgocount21, 1
  store i64 %120, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 11)
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %.prol.loopexit.._crit_edge.us.us_crit_edge, %._crit_edge.us.us.loopexit
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond = icmp eq i64 %indvars.iv.next44, %wide.trip.count45
  br i1 %exitcond, label %._crit_edge10.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge, %.lr.ph.us.us.new.preheader
  %indvars.iv37 = phi i64 [ %indvars.iv.next38.1, %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge ], [ %indvars.iv37.unr.ph, %.lr.ph.us.us.new.preheader ]
  %121 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv46, i64 %indvars.iv37
  %122 = load double, double* %121, align 8
  %123 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv37, i64 %indvars.iv43
  %124 = load double, double* %123, align 8
  %125 = fmul double %122, %124
  %126 = load double, double* %109, align 8
  %127 = fadd double %126, %125
  store double %127, double* %109, align 8
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %128 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv46, i64 %indvars.iv.next38
  %129 = load double, double* %128, align 8
  %130 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv.next38, i64 %indvars.iv43
  %131 = load double, double* %130, align 8
  %132 = fmul double %129, %131
  %133 = load double, double* %109, align 8
  %134 = fadd double %133, %132
  store double %134, double* %109, align 8
  %indvars.iv.next38.1 = add nsw i64 %indvars.iv37, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next38.1, %wide.trip.count39.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge

.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge:      ; preds = %.lr.ph.us.us.new
  %pgocount22 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 1)
  %135 = add i64 %pgocount22, 1
  store i64 %135, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 1)
  br label %.lr.ph.us.us.new

._crit_edge12.loopexit:                           ; preds = %._crit_edge10.us
  %pgocount23 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 24)
  %136 = add i64 %pgocount23, 1
  store i64 %136, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 24)
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %.preheader5.._crit_edge12_crit_edge, %._crit_edge12.loopexit, %.preheader.lr.ph, %11
  %pgocount24 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 19)
  %137 = add i64 %pgocount24, 1
  store i64 %137, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_2mm, i64 0, i64 19)
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
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
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %20) #6
  br label %21

; <label>:21:                                     ; preds = %._crit_edge, %18
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv6, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %24) #6
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
  %30 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %31) #6
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
