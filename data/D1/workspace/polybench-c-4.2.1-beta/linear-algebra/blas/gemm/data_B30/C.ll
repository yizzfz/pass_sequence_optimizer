; ModuleID = 'B.ll'
source_filename = "gemm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_gemm = private constant [16 x i8] c"B.ll:kernel_gemm"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 32414643582, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [15 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 174192004348, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 15, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_gemm = private global [32 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_gemm = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 5961606765684520061, i64 366391702104, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i32 0, i32 0), i8* null, i8* null, i32 32, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 63976198547, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [56 x i8] c"6\00main\01B.ll:init_array\01B.ll:kernel_gemm\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_gemm to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([56 x i8], [56 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1100000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %8 = bitcast i8* %5 to [1100 x double]*
  %9 = bitcast i8* %6 to [1200 x double]*
  %10 = bitcast i8* %7 to [1100 x double]*
  call fastcc void @init_array(i32 1000, i32 1100, i32 1200, double* nonnull %3, double* nonnull %4, [1100 x double]* %8, [1200 x double]* %9, [1100 x double]* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  tail call fastcc void @kernel_gemm(i32 1000, i32 1100, i32 1200, double %11, double %12, [1100 x double]* %8, [1200 x double]* %9, [1100 x double]* %10)
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
  tail call fastcc void @print_array(i32 1000, i32 1100, [1100 x double]* %8)
  br label %20

; <label>:20:                                     ; preds = %18, %14, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %21 = add i64 %pgocount2, 1
  store i64 %21, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, double* nocapture, double* nocapture, [1100 x double]* nocapture, [1200 x double]* nocapture, [1100 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %3, align 8
  store double 1.200000e+00, double* %4, align 8
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.preheader7.lr.ph, label %.preheader4

.preheader7.lr.ph:                                ; preds = %8
  %pgocount = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 10)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 10)
  %11 = icmp sgt i32 %1, 0
  %12 = sitofp i32 %0 to double
  br i1 %11, label %.preheader7.us.preheader, label %.preheader5.lr.ph

.preheader7.us.preheader:                         ; preds = %.preheader7.lr.ph
  %wide.trip.count41 = zext i32 %1 to i64
  %wide.trip.count45 = zext i32 %0 to i64
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge19.us, %.preheader7.us.preheader
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %._crit_edge19.us ], [ 0, %.preheader7.us.preheader ]
  br label %13

; <label>:13:                                     ; preds = %._crit_edge, %.preheader7.us
  %indvars.iv39 = phi i64 [ 0, %.preheader7.us ], [ %indvars.iv.next40, %._crit_edge ]
  %14 = mul nuw nsw i64 %indvars.iv39, %indvars.iv43
  %15 = add nuw nsw i64 %14, 1
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, %0
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, %12
  %20 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv43, i64 %indvars.iv39
  store double %19, double* %20, align 8
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, %wide.trip.count41
  br i1 %exitcond42, label %._crit_edge19.us, label %._crit_edge

._crit_edge:                                      ; preds = %13
  %pgocount2 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %21 = add i64 %pgocount2, 1
  store i64 %21, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  br label %13

._crit_edge19.us:                                 ; preds = %13
  %pgocount3 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %22 = add i64 %pgocount3, 1
  store i64 %22, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next44, %wide.trip.count45
  br i1 %exitcond46, label %.preheader6, label %.preheader7.us

.preheader6:                                      ; preds = %._crit_edge19.us
  %pgocount4 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 12)
  %23 = add i64 %pgocount4, 1
  store i64 %23, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 12)
  %24 = icmp sgt i32 %0, 0
  br i1 %24, label %.preheader5.lr.ph, label %.preheader6..preheader4_crit_edge

.preheader6..preheader4_crit_edge:                ; preds = %.preheader6
  %pgocount5 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %25 = add i64 %pgocount5, 1
  store i64 %25, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  br label %.preheader4

.preheader5.lr.ph:                                ; preds = %.preheader6, %.preheader7.lr.ph
  %26 = icmp sgt i32 %2, 0
  %27 = sitofp i32 %2 to double
  br i1 %26, label %.preheader5.us.preheader, label %._crit_edge11

.preheader5.us.preheader:                         ; preds = %.preheader5.lr.ph
  %xtraiter = and i32 %2, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %28 = icmp eq i32 %2, 1
  %wide.trip.count36 = zext i32 %0 to i64
  %wide.trip.count32.1 = zext i32 %2 to i64
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %._crit_edge14.us, %.preheader5.us.preheader
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %._crit_edge14.us ], [ 0, %.preheader5.us.preheader ]
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader5.us
  %pgocount6 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %29 = add i64 %pgocount6, 1
  store i64 %29, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %30 = trunc i64 %indvars.iv34 to i32
  %31 = srem i32 %30, %2
  %32 = sitofp i32 %31 to double
  %33 = fdiv double %32, %27
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv34, i64 0
  store double %33, double* %34, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader5.us
  %indvars.iv30.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader5.us ]
  br i1 %28, label %.prol.loopexit.._crit_edge14.us_crit_edge, label %.preheader5.us.new.preheader

.prol.loopexit.._crit_edge14.us_crit_edge:        ; preds = %.prol.loopexit
  %pgocount7 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %35 = add i64 %pgocount7, 1
  store i64 %35, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  br label %._crit_edge14.us

.preheader5.us.new.preheader:                     ; preds = %.prol.loopexit
  br label %.preheader5.us.new

.preheader5.us.new:                               ; preds = %.preheader5.us.new..preheader5.us.new_crit_edge, %.preheader5.us.new.preheader
  %indvars.iv30 = phi i64 [ %indvars.iv.next31.1, %.preheader5.us.new..preheader5.us.new_crit_edge ], [ %indvars.iv30.unr.ph, %.preheader5.us.new.preheader ]
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %36 = mul nuw nsw i64 %indvars.iv.next31, %indvars.iv34
  %37 = trunc i64 %36 to i32
  %38 = srem i32 %37, %2
  %39 = sitofp i32 %38 to double
  %40 = fdiv double %39, %27
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv34, i64 %indvars.iv30
  store double %40, double* %41, align 8
  %indvars.iv.next31.1 = add nsw i64 %indvars.iv30, 2
  %42 = mul nuw nsw i64 %indvars.iv.next31.1, %indvars.iv34
  %43 = trunc i64 %42 to i32
  %44 = srem i32 %43, %2
  %45 = sitofp i32 %44 to double
  %46 = fdiv double %45, %27
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv34, i64 %indvars.iv.next31
  store double %46, double* %47, align 8
  %exitcond33.1 = icmp eq i64 %indvars.iv.next31.1, %wide.trip.count32.1
  br i1 %exitcond33.1, label %._crit_edge14.us.loopexit, label %.preheader5.us.new..preheader5.us.new_crit_edge

.preheader5.us.new..preheader5.us.new_crit_edge:  ; preds = %.preheader5.us.new
  %pgocount8 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %48 = add i64 %pgocount8, 1
  store i64 %48, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  br label %.preheader5.us.new

._crit_edge14.us.loopexit:                        ; preds = %.preheader5.us.new
  %pgocount9 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  %49 = add i64 %pgocount9, 1
  store i64 %49, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  br label %._crit_edge14.us

._crit_edge14.us:                                 ; preds = %.prol.loopexit.._crit_edge14.us_crit_edge, %._crit_edge14.us.loopexit
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next35, %wide.trip.count36
  br i1 %exitcond37, label %.preheader4.loopexit, label %.preheader5.us

.preheader4.loopexit:                             ; preds = %._crit_edge14.us
  %pgocount10 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 14)
  %50 = add i64 %pgocount10, 1
  store i64 %50, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 14)
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader6..preheader4_crit_edge, %.preheader4.loopexit, %8
  %51 = icmp sgt i32 %2, 0
  br i1 %51, label %.preheader.lr.ph, label %._crit_edge11

.preheader.lr.ph:                                 ; preds = %.preheader4
  %pgocount11 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 11)
  %52 = add i64 %pgocount11, 1
  store i64 %52, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 11)
  %53 = icmp sgt i32 %1, 0
  %54 = sitofp i32 %1 to double
  br i1 %53, label %.preheader.us.preheader, label %._crit_edge11

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count27 = zext i32 %2 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %55

; <label>:55:                                     ; preds = %._crit_edge1, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge1 ]
  %56 = add nuw nsw i64 %indvars.iv, 2
  %57 = mul nuw nsw i64 %56, %indvars.iv25
  %58 = trunc i64 %57 to i32
  %59 = srem i32 %58, %1
  %60 = sitofp i32 %59 to double
  %61 = fdiv double %60, %54
  %62 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv25, i64 %indvars.iv
  store double %61, double* %62, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge1

._crit_edge1:                                     ; preds = %55
  %pgocount12 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %63 = add i64 %pgocount12, 1
  store i64 %63, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  br label %55

._crit_edge.us:                                   ; preds = %55
  %pgocount13 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %64 = add i64 %pgocount13, 1
  store i64 %64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next26, %wide.trip.count27
  br i1 %exitcond28, label %._crit_edge11.loopexit, label %.preheader.us

._crit_edge11.loopexit:                           ; preds = %._crit_edge.us
  %pgocount14 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 13)
  %65 = add i64 %pgocount14, 1
  store i64 %65, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 13)
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %.preheader.lr.ph, %.preheader4, %.preheader5.lr.ph
  %pgocount15 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  %66 = add i64 %pgocount15, 1
  store i64 %66, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemm(i32, i32, i32, double, double, [1100 x double]* nocapture, [1200 x double]* nocapture readonly, [1100 x double]* nocapture readonly) unnamed_addr #2 {
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.preheader4.lr.ph, label %._crit_edge11

.preheader4.lr.ph:                                ; preds = %8
  %10 = icmp sgt i32 %1, 0
  %11 = icmp sgt i32 %2, 0
  %12 = icmp sgt i32 %1, 0
  br i1 %10, label %.preheader4.us.preheader, label %.preheader4.preheader

.preheader4.preheader:                            ; preds = %.preheader4.lr.ph
  %xtraiter44 = and i32 %1, 1
  %lcmp.mod45 = icmp eq i32 %xtraiter44, 0
  %wide.trip.count48 = zext i32 %2 to i64
  %wide.trip.count40.1 = zext i32 %1 to i64
  %wide.trip.count52 = zext i32 %0 to i64
  %13 = add nsw i64 %wide.trip.count40.1, -2
  %14 = add nsw i64 %wide.trip.count40.1, -2
  %brmerge58.demorgan = and i1 %11, %12
  %broadcast.splatinsert75 = insertelement <2 x double> undef, double %3, i32 0
  br label %.preheader4

.preheader4.us.preheader:                         ; preds = %.preheader4.lr.ph
  %15 = add i32 %1, -1
  %xtraiter = and i32 %1, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %16 = icmp ult i32 %15, 3
  %xtraiter27 = and i32 %1, 1
  %lcmp.mod28 = icmp eq i32 %xtraiter27, 0
  %17 = icmp eq i32 %15, 0
  %wide.trip.count32 = zext i32 %2 to i64
  %wide.trip.count24.1 = zext i32 %1 to i64
  %wide.trip.count35 = zext i32 %0 to i64
  %wide.trip.count.3 = zext i32 %1 to i64
  %18 = add nsw i64 %wide.trip.count24.1, -2
  %19 = add nsw i64 %wide.trip.count24.1, -2
  %20 = add nsw i64 %wide.trip.count24.1, -4
  %brmerge.demorgan = and i1 %11, %12
  %broadcast.splatinsert123 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splatinsert155 = insertelement <2 x double> undef, double %4, i32 0
  %broadcast.splat156 = shufflevector <2 x double> %broadcast.splatinsert155, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge9.us, %.preheader4.us.preheader
  %indvars.iv33 = phi i64 [ 0, %.preheader4.us.preheader ], [ %indvars.iv.next34, %._crit_edge9.us ]
  %scevgep93 = getelementptr [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 2
  br i1 %lcmp.mod, label %.preheader4.us..prol.loopexit_crit_edge, label %.prol.preheader.preheader

.preheader4.us..prol.loopexit_crit_edge:          ; preds = %.preheader4.us
  %pgocount = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 9)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 9)
  br label %.prol.loopexit

.prol.preheader.preheader:                        ; preds = %.preheader4.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader..prol.preheader_crit_edge, %.prol.preheader.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader..prol.preheader_crit_edge ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader..prol.preheader_crit_edge ], [ %xtraiter, %.prol.preheader.preheader ]
  %22 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv.prol
  %23 = load double, double* %22, align 8
  %24 = fmul double %23, %4
  store double %24, double* %22, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader..prol.preheader_crit_edge, !llvm.loop !1

.prol.preheader..prol.preheader_crit_edge:        ; preds = %.prol.preheader
  %pgocount1 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 4)
  %25 = add i64 %pgocount1, 1
  store i64 %25, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 4)
  br label %.prol.preheader

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  %pgocount2 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 22)
  %26 = add i64 %pgocount2, 1
  store i64 %26, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 22)
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader4.us..prol.loopexit_crit_edge, %.prol.loopexit.loopexit
  %indvars.iv.unr = phi i64 [ 0, %.preheader4.us..prol.loopexit_crit_edge ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  br i1 %16, label %..preheader3_crit_edge.us, label %.preheader4.us.new.preheader

.preheader4.us.new.preheader:                     ; preds = %.prol.loopexit
  %pgocount3 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 23)
  %27 = add i64 %pgocount3, 1
  store i64 %27, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 23)
  %28 = sub i64 %20, %indvars.iv.unr
  %29 = lshr i64 %28, 2
  %30 = add nuw nsw i64 %29, 1
  %min.iters.check135 = icmp ult i64 %30, 2
  br i1 %min.iters.check135, label %.preheader4.us.new.preheader159, label %min.iters.checked136

.preheader4.us.new.preheader159:                  ; preds = %middle.block133, %min.iters.checked136, %.preheader4.us.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked136 ], [ %indvars.iv.unr, %.preheader4.us.new.preheader ], [ %ind.end144, %middle.block133 ]
  br label %.preheader4.us.new

min.iters.checked136:                             ; preds = %.preheader4.us.new.preheader
  %pgocount4 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 27)
  %31 = add i64 %pgocount4, 1
  store i64 %31, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 27)
  %n.mod.vf137 = and i64 %30, 1
  %n.vec138 = sub nsw i64 %30, %n.mod.vf137
  %cmp.zero139 = icmp eq i64 %n.vec138, 0
  %32 = add i64 %indvars.iv.unr, 4
  %33 = shl nuw i64 %29, 2
  %34 = add i64 %32, %33
  %35 = shl nuw nsw i64 %n.mod.vf137, 2
  %ind.end144 = sub i64 %34, %35
  br i1 %cmp.zero139, label %.preheader4.us.new.preheader159, label %vector.ph140

vector.ph140:                                     ; preds = %min.iters.checked136
  br label %vector.body132

vector.body132:                                   ; preds = %vector.body132.vector.body132_crit_edge, %vector.ph140
  %index141 = phi i64 [ 0, %vector.ph140 ], [ %index.next142, %vector.body132.vector.body132_crit_edge ]
  %36 = shl i64 %index141, 2
  %37 = add i64 %indvars.iv.unr, %36
  %38 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %37
  %39 = bitcast double* %38 to <8 x double>*
  %wide.vec150 = load <8 x double>, <8 x double>* %39, align 8
  %strided.vec151 = shufflevector <8 x double> %wide.vec150, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec152 = shufflevector <8 x double> %wide.vec150, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec153 = shufflevector <8 x double> %wide.vec150, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec154 = shufflevector <8 x double> %wide.vec150, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %40 = fmul <2 x double> %strided.vec151, %broadcast.splat156
  %41 = fmul <2 x double> %strided.vec152, %broadcast.splat156
  %42 = fmul <2 x double> %strided.vec153, %broadcast.splat156
  %43 = add nsw i64 %37, 3
  %44 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %43
  %45 = fmul <2 x double> %strided.vec154, %broadcast.splat156
  %46 = getelementptr double, double* %44, i64 -3
  %47 = bitcast double* %46 to <8 x double>*
  %48 = shufflevector <2 x double> %40, <2 x double> %41, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %49 = shufflevector <2 x double> %42, <2 x double> %45, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec157 = shufflevector <4 x double> %48, <4 x double> %49, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec157, <8 x double>* %47, align 8
  %index.next142 = add i64 %index141, 2
  %50 = icmp eq i64 %index.next142, %n.vec138
  br i1 %50, label %middle.block133, label %vector.body132.vector.body132_crit_edge, !llvm.loop !3

vector.body132.vector.body132_crit_edge:          ; preds = %vector.body132
  %pgocount5 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 7)
  %51 = add i64 %pgocount5, 1
  store i64 %51, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 7)
  br label %vector.body132

middle.block133:                                  ; preds = %vector.body132
  %pgocount6 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 28)
  %52 = add i64 %pgocount6, 1
  store i64 %52, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 28)
  %cmp.n145 = icmp eq i64 %n.mod.vf137, 0
  br i1 %cmp.n145, label %..preheader3_crit_edge.us, label %.preheader4.us.new.preheader159

._crit_edge9.us.loopexit:                         ; preds = %._crit_edge.us.us
  %pgocount7 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 24)
  %53 = add i64 %pgocount7, 1
  store i64 %53, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 24)
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %..preheader3_crit_edge.us, %._crit_edge9.us.loopexit
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next34, %wide.trip.count35
  br i1 %exitcond36, label %._crit_edge11.loopexit, label %.preheader4.us

.preheader4.us.new:                               ; preds = %.preheader4.us.new..preheader4.us.new_crit_edge, %.preheader4.us.new.preheader159
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader4.us.new..preheader4.us.new_crit_edge ], [ %indvars.iv.ph, %.preheader4.us.new.preheader159 ]
  %54 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv
  %55 = load double, double* %54, align 8
  %56 = fmul double %55, %4
  store double %56, double* %54, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %57 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv.next
  %58 = load double, double* %57, align 8
  %59 = fmul double %58, %4
  store double %59, double* %57, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %60 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv.next.1
  %61 = load double, double* %60, align 8
  %62 = fmul double %61, %4
  store double %62, double* %60, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %63 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv.next.2
  %64 = load double, double* %63, align 8
  %65 = fmul double %64, %4
  store double %65, double* %63, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %..preheader3_crit_edge.us.loopexit, label %.preheader4.us.new..preheader4.us.new_crit_edge, !llvm.loop !6

.preheader4.us.new..preheader4.us.new_crit_edge:  ; preds = %.preheader4.us.new
  %pgocount8 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 5)
  %66 = add i64 %pgocount8, 1
  store i64 %66, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 5)
  br label %.preheader4.us.new

..preheader3_crit_edge.us.loopexit:               ; preds = %.preheader4.us.new
  %pgocount9 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 25)
  %67 = add i64 %pgocount9, 1
  store i64 %67, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 25)
  br label %..preheader3_crit_edge.us

..preheader3_crit_edge.us:                        ; preds = %..preheader3_crit_edge.us.loopexit, %middle.block133, %.prol.loopexit
  br i1 %brmerge.demorgan, label %.preheader.us.us.preheader, label %._crit_edge9.us

.preheader.us.us.preheader:                       ; preds = %..preheader3_crit_edge.us
  %68 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 0
  br label %.preheader.us.us

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %scevgep99 = getelementptr [1100 x double], [1100 x double]* %7, i64 %indvars.iv30, i64 2
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv33, i64 %indvars.iv30
  br i1 %lcmp.mod28, label %.prol.loopexit26, label %.prol.preheader25

.prol.preheader25:                                ; preds = %.preheader.us.us
  %pgocount10 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 14)
  %70 = add i64 %pgocount10, 1
  store i64 %70, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 14)
  %71 = load double, double* %69, align 8
  %72 = fmul double %71, %3
  %73 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv30, i64 0
  %74 = load double, double* %73, align 8
  %75 = fmul double %72, %74
  %76 = load double, double* %68, align 8
  %77 = fadd double %76, %75
  store double %77, double* %68, align 8
  br label %.prol.loopexit26

.prol.loopexit26:                                 ; preds = %.prol.preheader25, %.preheader.us.us
  %indvars.iv22.unr.ph = phi i64 [ 1, %.prol.preheader25 ], [ 0, %.preheader.us.us ]
  br i1 %17, label %.prol.loopexit26.._crit_edge.us.us_crit_edge, label %.preheader.us.us.new.preheader

.prol.loopexit26.._crit_edge.us.us_crit_edge:     ; preds = %.prol.loopexit26
  %pgocount11 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 6)
  %78 = add i64 %pgocount11, 1
  store i64 %78, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 6)
  br label %._crit_edge.us.us

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit26
  %pgocount12 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 11)
  %79 = add i64 %pgocount12, 1
  store i64 %79, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 11)
  %80 = sub nsw i64 %18, %indvars.iv22.unr.ph
  %81 = lshr i64 %80, 1
  %82 = add nuw i64 %81, 1
  %min.iters.check84 = icmp ult i64 %82, 2
  br i1 %min.iters.check84, label %.preheader.us.us.new.preheader158, label %min.iters.checked85

.preheader.us.us.new.preheader158:                ; preds = %middle.block82, %vector.memcheck112, %min.iters.checked85, %.preheader.us.us.new.preheader
  %indvars.iv22.ph = phi i64 [ %indvars.iv22.unr.ph, %vector.memcheck112 ], [ %indvars.iv22.unr.ph, %min.iters.checked85 ], [ %indvars.iv22.unr.ph, %.preheader.us.us.new.preheader ], [ %ind.end117, %middle.block82 ]
  br label %.preheader.us.us.new

min.iters.checked85:                              ; preds = %.preheader.us.us.new.preheader
  %pgocount13 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 15)
  %83 = add i64 %pgocount13, 1
  store i64 %83, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 15)
  %n.mod.vf86 = and i64 %82, 1
  %n.vec87 = sub i64 %82, %n.mod.vf86
  %cmp.zero88 = icmp eq i64 %n.vec87, 0
  br i1 %cmp.zero88, label %.preheader.us.us.new.preheader158, label %vector.memcheck112

vector.memcheck112:                               ; preds = %min.iters.checked85
  %pgocount14 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 18)
  %84 = add i64 %pgocount14, 1
  store i64 %84, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 18)
  %scevgep91 = getelementptr [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv22.unr.ph
  %85 = sub nsw i64 %19, %indvars.iv22.unr.ph
  %86 = and i64 %85, -2
  %87 = or i64 %indvars.iv22.unr.ph, %86
  %scevgep94 = getelementptr double, double* %scevgep93, i64 %87
  %scevgep97 = getelementptr [1100 x double], [1100 x double]* %7, i64 %indvars.iv30, i64 %indvars.iv22.unr.ph
  %scevgep100 = getelementptr double, double* %scevgep99, i64 %87
  %bound0104 = icmp ult double* %scevgep91, %69
  %bound1105 = icmp ult double* %69, %scevgep94
  %found.conflict106 = and i1 %bound0104, %bound1105
  %bound0107 = icmp ult double* %scevgep91, %scevgep100
  %bound1108 = icmp ult double* %scevgep97, %scevgep94
  %found.conflict109 = and i1 %bound0107, %bound1108
  %conflict.rdx110 = or i1 %found.conflict106, %found.conflict109
  %88 = or i64 %indvars.iv22.unr.ph, 2
  %89 = shl nuw i64 %81, 1
  %90 = add i64 %88, %89
  %91 = shl nuw nsw i64 %n.mod.vf86, 1
  %ind.end117 = sub i64 %90, %91
  br i1 %conflict.rdx110, label %.preheader.us.us.new.preheader158, label %vector.ph113

vector.ph113:                                     ; preds = %vector.memcheck112
  %92 = load double, double* %69, align 8, !alias.scope !8
  %93 = insertelement <2 x double> undef, double %92, i32 0
  %94 = fmul <2 x double> %93, %broadcast.splatinsert123
  %95 = shufflevector <2 x double> %94, <2 x double> undef, <2 x i32> zeroinitializer
  %96 = load double, double* %69, align 8, !alias.scope !8
  %97 = insertelement <2 x double> undef, double %96, i32 0
  %98 = fmul <2 x double> %97, %broadcast.splatinsert123
  %99 = shufflevector <2 x double> %98, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body81

vector.body81:                                    ; preds = %vector.body81.vector.body81_crit_edge, %vector.ph113
  %index114 = phi i64 [ 0, %vector.ph113 ], [ %index.next115, %vector.body81.vector.body81_crit_edge ]
  %100 = shl i64 %index114, 1
  %offset.idx119 = or i64 %indvars.iv22.unr.ph, %100
  %101 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv30, i64 %offset.idx119
  %102 = bitcast double* %101 to <4 x double>*
  %wide.vec125 = load <4 x double>, <4 x double>* %102, align 8, !alias.scope !11
  %strided.vec126 = shufflevector <4 x double> %wide.vec125, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec127 = shufflevector <4 x double> %wide.vec125, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %103 = fmul <2 x double> %95, %strided.vec126
  %104 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %offset.idx119
  %105 = bitcast double* %104 to <4 x double>*
  %wide.vec128 = load <4 x double>, <4 x double>* %105, align 8, !alias.scope !13, !noalias !15
  %strided.vec129 = shufflevector <4 x double> %wide.vec128, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec130 = shufflevector <4 x double> %wide.vec128, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %106 = fadd <2 x double> %strided.vec129, %103
  %107 = add nuw nsw i64 %offset.idx119, 1
  %108 = fmul <2 x double> %99, %strided.vec127
  %109 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %107
  %110 = fadd <2 x double> %strided.vec130, %108
  %111 = getelementptr double, double* %109, i64 -1
  %112 = bitcast double* %111 to <4 x double>*
  %interleaved.vec131 = shufflevector <2 x double> %106, <2 x double> %110, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec131, <4 x double>* %112, align 8, !alias.scope !13, !noalias !15
  %index.next115 = add i64 %index114, 2
  %113 = icmp eq i64 %index.next115, %n.vec87
  br i1 %113, label %middle.block82, label %vector.body81.vector.body81_crit_edge, !llvm.loop !16

vector.body81.vector.body81_crit_edge:            ; preds = %vector.body81
  %pgocount15 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 2)
  %114 = add i64 %pgocount15, 1
  store i64 %114, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 2)
  br label %vector.body81

middle.block82:                                   ; preds = %vector.body81
  %pgocount16 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 20)
  %115 = add i64 %pgocount16, 1
  store i64 %115, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 20)
  %cmp.n118 = icmp eq i64 %n.mod.vf86, 0
  br i1 %cmp.n118, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader158

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  %pgocount17 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 12)
  %116 = add i64 %pgocount17, 1
  store i64 %116, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 12)
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %.prol.loopexit26.._crit_edge.us.us_crit_edge, %._crit_edge.us.us.loopexit, %middle.block82
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond = icmp eq i64 %indvars.iv.next31, %wide.trip.count32
  br i1 %exitcond, label %._crit_edge9.us.loopexit, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new..preheader.us.us.new_crit_edge, %.preheader.us.us.new.preheader158
  %indvars.iv22 = phi i64 [ %indvars.iv.next23.1, %.preheader.us.us.new..preheader.us.us.new_crit_edge ], [ %indvars.iv22.ph, %.preheader.us.us.new.preheader158 ]
  %117 = load double, double* %69, align 8
  %118 = fmul double %117, %3
  %119 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv30, i64 %indvars.iv22
  %120 = load double, double* %119, align 8
  %121 = fmul double %118, %120
  %122 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv22
  %123 = load double, double* %122, align 8
  %124 = fadd double %123, %121
  store double %124, double* %122, align 8
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %125 = load double, double* %69, align 8
  %126 = fmul double %125, %3
  %127 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv30, i64 %indvars.iv.next23
  %128 = load double, double* %127, align 8
  %129 = fmul double %126, %128
  %130 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv.next23
  %131 = load double, double* %130, align 8
  %132 = fadd double %131, %129
  store double %132, double* %130, align 8
  %indvars.iv.next23.1 = add nsw i64 %indvars.iv22, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next23.1, %wide.trip.count24.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new..preheader.us.us.new_crit_edge, !llvm.loop !17

.preheader.us.us.new..preheader.us.us.new_crit_edge: ; preds = %.preheader.us.us.new
  %pgocount18 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 0)
  %133 = add i64 %pgocount18, 1
  store i64 %133, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 0)
  br label %.preheader.us.us.new

.preheader4:                                      ; preds = %._crit_edge9, %.preheader4.preheader
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %._crit_edge9 ], [ 0, %.preheader4.preheader ]
  %scevgep62 = getelementptr [1100 x double], [1100 x double]* %5, i64 %indvars.iv50, i64 2
  br i1 %brmerge58.demorgan, label %.preheader.us.preheader, label %.preheader4.._crit_edge9_crit_edge

.preheader4.._crit_edge9_crit_edge:               ; preds = %.preheader4
  %pgocount19 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 10)
  %134 = add i64 %pgocount19, 1
  store i64 %134, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 10)
  br label %._crit_edge9

.preheader.us.preheader:                          ; preds = %.preheader4
  %135 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv50, i64 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep68 = getelementptr [1100 x double], [1100 x double]* %7, i64 %indvars.iv46, i64 2
  %136 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv50, i64 %indvars.iv46
  br i1 %lcmp.mod45, label %.preheader.us.new.preheader, label %.prol.preheader42

.prol.preheader42:                                ; preds = %.preheader.us
  %pgocount20 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 16)
  %137 = add i64 %pgocount20, 1
  store i64 %137, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 16)
  %138 = load double, double* %136, align 8
  %139 = fmul double %138, %3
  %140 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv46, i64 0
  %141 = load double, double* %140, align 8
  %142 = fmul double %139, %141
  %143 = load double, double* %135, align 8
  %144 = fadd double %143, %142
  store double %144, double* %135, align 8
  br label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.preheader42, %.preheader.us
  %indvars.iv38.unr.ph = phi i64 [ 1, %.prol.preheader42 ], [ 0, %.preheader.us ]
  %145 = sub nsw i64 %13, %indvars.iv38.unr.ph
  %146 = lshr i64 %145, 1
  %147 = add nuw i64 %146, 1
  %min.iters.check = icmp ult i64 %147, 2
  br i1 %min.iters.check, label %.preheader.us.new.preheader160, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us.new.preheader
  %pgocount21 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 17)
  %148 = add i64 %pgocount21, 1
  store i64 %148, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 17)
  %n.mod.vf = and i64 %147, 1
  %n.vec = sub i64 %147, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.preheader.us.new.preheader160, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %pgocount22 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 19)
  %149 = add i64 %pgocount22, 1
  store i64 %149, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 19)
  %scevgep60 = getelementptr [1100 x double], [1100 x double]* %5, i64 %indvars.iv50, i64 %indvars.iv38.unr.ph
  %150 = sub nsw i64 %14, %indvars.iv38.unr.ph
  %151 = and i64 %150, -2
  %152 = or i64 %indvars.iv38.unr.ph, %151
  %scevgep63 = getelementptr double, double* %scevgep62, i64 %152
  %scevgep66 = getelementptr [1100 x double], [1100 x double]* %7, i64 %indvars.iv46, i64 %indvars.iv38.unr.ph
  %scevgep69 = getelementptr double, double* %scevgep68, i64 %152
  %bound0 = icmp ult double* %scevgep60, %136
  %bound1 = icmp ult double* %136, %scevgep63
  %found.conflict = and i1 %bound0, %bound1
  %bound072 = icmp ult double* %scevgep60, %scevgep69
  %bound173 = icmp ult double* %scevgep66, %scevgep63
  %found.conflict74 = and i1 %bound072, %bound173
  %conflict.rdx = or i1 %found.conflict, %found.conflict74
  %153 = or i64 %indvars.iv38.unr.ph, 2
  %154 = shl nuw i64 %146, 1
  %155 = add i64 %153, %154
  %156 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %155, %156
  br i1 %conflict.rdx, label %.preheader.us.new.preheader160, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %157 = load double, double* %136, align 8, !alias.scope !18
  %158 = insertelement <2 x double> undef, double %157, i32 0
  %159 = fmul <2 x double> %158, %broadcast.splatinsert75
  %160 = shufflevector <2 x double> %159, <2 x double> undef, <2 x i32> zeroinitializer
  %161 = load double, double* %136, align 8, !alias.scope !18
  %162 = insertelement <2 x double> undef, double %161, i32 0
  %163 = fmul <2 x double> %162, %broadcast.splatinsert75
  %164 = shufflevector <2 x double> %163, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %165 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv38.unr.ph, %165
  %166 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv46, i64 %offset.idx
  %167 = bitcast double* %166 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %167, align 8, !alias.scope !21
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec77 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %168 = fmul <2 x double> %160, %strided.vec
  %169 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv50, i64 %offset.idx
  %170 = bitcast double* %169 to <4 x double>*
  %wide.vec78 = load <4 x double>, <4 x double>* %170, align 8, !alias.scope !23, !noalias !25
  %strided.vec79 = shufflevector <4 x double> %wide.vec78, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec80 = shufflevector <4 x double> %wide.vec78, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %171 = fadd <2 x double> %strided.vec79, %168
  %172 = add nuw nsw i64 %offset.idx, 1
  %173 = fmul <2 x double> %164, %strided.vec77
  %174 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv50, i64 %172
  %175 = fadd <2 x double> %strided.vec80, %173
  %176 = getelementptr double, double* %174, i64 -1
  %177 = bitcast double* %176 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %171, <2 x double> %175, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %177, align 8, !alias.scope !23, !noalias !25
  %index.next = add i64 %index, 2
  %178 = icmp eq i64 %index.next, %n.vec
  br i1 %178, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !26

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  %pgocount23 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 3)
  %179 = add i64 %pgocount23, 1
  store i64 %179, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 3)
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %pgocount24 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 21)
  %180 = add i64 %pgocount24, 1
  store i64 %180, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 21)
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge.us, label %middle.block..preheader.us.new.preheader160_crit_edge

middle.block..preheader.us.new.preheader160_crit_edge: ; preds = %middle.block
  %pgocount25 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 8)
  %181 = add i64 %pgocount25, 1
  store i64 %181, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 8)
  br label %.preheader.us.new.preheader160

.preheader.us.new.preheader160:                   ; preds = %middle.block..preheader.us.new.preheader160_crit_edge, %vector.memcheck, %min.iters.checked, %.preheader.us.new.preheader
  %indvars.iv38.ph = phi i64 [ %indvars.iv38.unr.ph, %vector.memcheck ], [ %indvars.iv38.unr.ph, %min.iters.checked ], [ %indvars.iv38.unr.ph, %.preheader.us.new.preheader ], [ %ind.end, %middle.block..preheader.us.new.preheader160_crit_edge ]
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new..preheader.us.new_crit_edge, %.preheader.us.new.preheader160
  %indvars.iv38 = phi i64 [ %indvars.iv.next39.1, %.preheader.us.new..preheader.us.new_crit_edge ], [ %indvars.iv38.ph, %.preheader.us.new.preheader160 ]
  %182 = load double, double* %136, align 8
  %183 = fmul double %182, %3
  %184 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv46, i64 %indvars.iv38
  %185 = load double, double* %184, align 8
  %186 = fmul double %183, %185
  %187 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv50, i64 %indvars.iv38
  %188 = load double, double* %187, align 8
  %189 = fadd double %188, %186
  store double %189, double* %187, align 8
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %190 = load double, double* %136, align 8
  %191 = fmul double %190, %3
  %192 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv46, i64 %indvars.iv.next39
  %193 = load double, double* %192, align 8
  %194 = fmul double %191, %193
  %195 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv50, i64 %indvars.iv.next39
  %196 = load double, double* %195, align 8
  %197 = fadd double %196, %194
  store double %197, double* %195, align 8
  %indvars.iv.next39.1 = add nsw i64 %indvars.iv38, 2
  %exitcond41.1 = icmp eq i64 %indvars.iv.next39.1, %wide.trip.count40.1
  br i1 %exitcond41.1, label %._crit_edge.us.loopexit, label %.preheader.us.new..preheader.us.new_crit_edge, !llvm.loop !27

.preheader.us.new..preheader.us.new_crit_edge:    ; preds = %.preheader.us.new
  %pgocount26 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 1)
  %198 = add i64 %pgocount26, 1
  store i64 %198, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 1)
  br label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  %pgocount27 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 13)
  %199 = add i64 %pgocount27, 1
  store i64 %199, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 13)
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next47, %wide.trip.count48
  br i1 %exitcond49, label %._crit_edge9.loopexit, label %.preheader.us

._crit_edge9.loopexit:                            ; preds = %._crit_edge.us
  %pgocount28 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 26)
  %200 = add i64 %pgocount28, 1
  store i64 %200, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 26)
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %.preheader4.._crit_edge9_crit_edge, %._crit_edge9.loopexit
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next51, %wide.trip.count52
  br i1 %exitcond53, label %._crit_edge11.loopexit161, label %.preheader4

._crit_edge11.loopexit:                           ; preds = %._crit_edge9.us
  %pgocount29 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 30)
  %201 = add i64 %pgocount29, 1
  store i64 %201, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 30)
  br label %._crit_edge11

._crit_edge11.loopexit161:                        ; preds = %._crit_edge9
  %pgocount30 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 31)
  %202 = add i64 %pgocount30, 1
  store i64 %202, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 31)
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit161, %._crit_edge11.loopexit, %8
  %pgocount31 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 29)
  %203 = add i64 %pgocount31, 1
  store i64 %203, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 29)
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1100 x double]* nocapture readonly) unnamed_addr #0 {
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
  %23 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv6, i64 %indvars.iv
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
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12}
!12 = distinct !{!12, !10}
!13 = !{!14}
!14 = distinct !{!14, !10}
!15 = !{!9, !12}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}
!18 = !{!19}
!19 = distinct !{!19, !20}
!20 = distinct !{!20, !"LVerDomain"}
!21 = !{!22}
!22 = distinct !{!22, !20}
!23 = !{!24}
!24 = distinct !{!24, !20}
!25 = !{!19, !22}
!26 = distinct !{!26, !4, !5}
!27 = distinct !{!27, !4, !5}
