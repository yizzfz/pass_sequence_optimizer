; ModuleID = 'B.ll'
source_filename = "ludcmp.c"
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
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_ludcmp = private constant [18 x i8] c"B.ll:kernel_ludcmp"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 32414643582, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [28 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 342419009206, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 28, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_ludcmp = private global [28 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_ludcmp = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2723921114217419270, i64 333193982551, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i32 0, i32 0), i8* null, i8* null, i32 28, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 49239513432, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [58 x i8] c"8\00main\01B.ll:init_array\01B.ll:kernel_ludcmp\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_ludcmp to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([58 x i8], [58 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = bitcast i8* %3 to [2000 x double]*
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_ludcmp(i32 2000, [2000 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %18

; <label>:12:                                     ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %13 = add i64 %pgocount, 1
  store i64 %13, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %14 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %14, align 1
  %15 = icmp eq i8 %strcmpload, 0
  br i1 %15, label %16, label %18

; <label>:16:                                     ; preds = %12
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %17 = add i64 %pgocount1, 1
  store i64 %17, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  tail call fastcc void @print_array(i32 2000, double* %9)
  br label %18

; <label>:18:                                     ; preds = %16, %12, %2
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %19 = add i64 %pgocount2, 1
  store i64 %19, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  %6 = sitofp i32 %0 to double
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph47.preheader, label %._crit_edge44.thread

.lr.ph47.preheader:                               ; preds = %5
  %pgocount = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 16)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 16)
  %xtraiter104 = and i32 %0, 1
  %lcmp.mod105 = icmp eq i32 %xtraiter104, 0
  br i1 %lcmp.mod105, label %.lr.ph47.prol.loopexit, label %.lr.ph47.prol

.lr.ph47.prol:                                    ; preds = %.lr.ph47.preheader
  %pgocount1 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 19)
  %9 = add i64 %pgocount1, 1
  store i64 %9, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 19)
  store double 0.000000e+00, double* %3, align 8
  store double 0.000000e+00, double* %4, align 8
  %10 = fdiv double 1.000000e+00, %6
  %11 = fmul double %10, 5.000000e-01
  %12 = fadd double %11, 4.000000e+00
  store double %12, double* %2, align 8
  br label %.lr.ph47.prol.loopexit

.lr.ph47.prol.loopexit:                           ; preds = %.lr.ph47.prol, %.lr.ph47.preheader
  %indvars.iv100.unr = phi i64 [ 0, %.lr.ph47.preheader ], [ 1, %.lr.ph47.prol ]
  %13 = icmp eq i32 %0, 1
  br i1 %13, label %.preheader15.preheader, label %.lr.ph47.preheader111

.lr.ph47.preheader111:                            ; preds = %.lr.ph47.prol.loopexit
  %wide.trip.count102.1 = zext i32 %0 to i64
  br label %.lr.ph47

.preheader16:                                     ; preds = %.lr.ph47
  %pgocount2 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 20)
  %14 = add i64 %pgocount2, 1
  store i64 %14, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 20)
  %15 = icmp sgt i32 %0, 0
  br i1 %15, label %.preheader15.preheader, label %._crit_edge44.thread

.preheader15.preheader:                           ; preds = %.preheader16, %.lr.ph47.prol.loopexit
  %16 = add i32 %0, -2
  %17 = zext i32 %16 to i64
  %18 = sext i32 %0 to i64
  %wide.trip.count98 = zext i32 %0 to i64
  br label %.lr.ph38

.lr.ph47:                                         ; preds = %.lr.ph47..lr.ph47_crit_edge, %.lr.ph47.preheader111
  %indvars.iv100 = phi i64 [ %indvars.iv.next101.1, %.lr.ph47..lr.ph47_crit_edge ], [ %indvars.iv100.unr, %.lr.ph47.preheader111 ]
  %19 = getelementptr inbounds double, double* %3, i64 %indvars.iv100
  store double 0.000000e+00, double* %19, align 8
  %20 = getelementptr inbounds double, double* %4, i64 %indvars.iv100
  store double 0.000000e+00, double* %20, align 8
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %21 = trunc i64 %indvars.iv.next101 to i32
  %22 = sitofp i32 %21 to double
  %23 = fdiv double %22, %6
  %24 = fmul double %23, 5.000000e-01
  %25 = fadd double %24, 4.000000e+00
  %26 = getelementptr inbounds double, double* %2, i64 %indvars.iv100
  store double %25, double* %26, align 8
  %27 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next101
  store double 0.000000e+00, double* %27, align 8
  %28 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next101
  store double 0.000000e+00, double* %28, align 8
  %indvars.iv.next101.1 = add nsw i64 %indvars.iv100, 2
  %29 = trunc i64 %indvars.iv.next101.1 to i32
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, %6
  %32 = fmul double %31, 5.000000e-01
  %33 = fadd double %32, 4.000000e+00
  %34 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next101
  store double %33, double* %34, align 8
  %exitcond103.1 = icmp eq i64 %indvars.iv.next101.1, %wide.trip.count102.1
  br i1 %exitcond103.1, label %.preheader16, label %.lr.ph47..lr.ph47_crit_edge

.lr.ph47..lr.ph47_crit_edge:                      ; preds = %.lr.ph47
  %pgocount3 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %35 = add i64 %pgocount3, 1
  store i64 %35, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  br label %.lr.ph47

.lr.ph38:                                         ; preds = %._crit_edge42, %.preheader15.preheader
  %indvars.iv96 = phi i64 [ 0, %.preheader15.preheader ], [ %indvars.iv.next97, %._crit_edge42 ]
  %indvars.iv94 = phi i64 [ 1, %.preheader15.preheader ], [ %indvars.iv.next95, %._crit_edge42 ]
  %36 = mul nuw nsw i64 %indvars.iv96, 2001
  %37 = add nuw nsw i64 %36, 1
  %scevgep92 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %37
  %scevgep9293 = bitcast double* %scevgep92 to i8*
  %38 = sub i64 %17, %indvars.iv96
  %39 = shl i64 %38, 3
  %40 = and i64 %39, 34359738360
  %41 = add nuw nsw i64 %40, 8
  br label %44

.preheader14:                                     ; preds = %44
  %pgocount4 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 11)
  %42 = add i64 %pgocount4, 1
  store i64 %42, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 11)
  %indvars.iv.next97 = add nuw nsw i64 %indvars.iv96, 1
  %43 = icmp slt i64 %indvars.iv.next97, %18
  br i1 %43, label %._crit_edge42.loopexit, label %._crit_edge42

; <label>:44:                                     ; preds = %._crit_edge, %.lr.ph38
  %indvars.iv80 = phi i64 [ %indvars.iv.next81, %._crit_edge ], [ 0, %.lr.ph38 ]
  %45 = sub nsw i64 0, %indvars.iv80
  %46 = trunc i64 %45 to i32
  %47 = srem i32 %46, %0
  %48 = sitofp i32 %47 to double
  %49 = fdiv double %48, %6
  %50 = fadd double %49, 1.000000e+00
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv96, i64 %indvars.iv80
  store double %50, double* %51, align 8
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %exitcond85 = icmp eq i64 %indvars.iv.next81, %indvars.iv94
  br i1 %exitcond85, label %.preheader14, label %._crit_edge

._crit_edge:                                      ; preds = %44
  %pgocount5 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %52 = add i64 %pgocount5, 1
  store i64 %52, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  br label %44

._crit_edge42.loopexit:                           ; preds = %.preheader14
  %pgocount6 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 13)
  %53 = add i64 %pgocount6, 1
  store i64 %53, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 13)
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep9293, i8 0, i64 %41, i32 8, i1 false)
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge42.loopexit, %.preheader14
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv96, i64 %indvars.iv96
  store double 1.000000e+00, double* %54, align 8
  %indvars.iv.next95 = add nuw nsw i64 %indvars.iv94, 1
  %exitcond99 = icmp eq i64 %indvars.iv.next97, %wide.trip.count98
  br i1 %exitcond99, label %._crit_edge44, label %.lr.ph38

._crit_edge44.thread:                             ; preds = %.preheader16, %5
  %pgocount7 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 18)
  %55 = add i64 %pgocount7, 1
  store i64 %55, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 18)
  %56 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge19

._crit_edge44:                                    ; preds = %._crit_edge42
  %pgocount8 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 17)
  %57 = add i64 %pgocount8, 1
  store i64 %57, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 17)
  %58 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %59 = bitcast i8* %58 to [2000 x [2000 x double]]*
  %60 = icmp sgt i32 %0, 0
  br i1 %60, label %.preheader13.us.preheader, label %._crit_edge19

.preheader13.us.preheader:                        ; preds = %._crit_edge44
  %pgocount9 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 21)
  %61 = add i64 %pgocount9, 1
  store i64 %61, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 21)
  %62 = add i32 %0, -1
  %63 = zext i32 %62 to i64
  %64 = shl nuw nsw i64 %63, 3
  %65 = add nuw nsw i64 %64, 8
  %xtraiter77 = and i32 %0, 3
  %lcmp.mod78 = icmp eq i32 %xtraiter77, 0
  br i1 %lcmp.mod78, label %.preheader13.us.prol.loopexit, label %._crit_edge35.us.prol.preheader

._crit_edge35.us.prol.preheader:                  ; preds = %.preheader13.us.preheader
  br label %._crit_edge35.us.prol

._crit_edge35.us.prol:                            ; preds = %._crit_edge35.us.prol.._crit_edge35.us.prol_crit_edge, %._crit_edge35.us.prol.preheader
  %indvars.iv73.prol = phi i64 [ %indvars.iv.next74.prol, %._crit_edge35.us.prol.._crit_edge35.us.prol_crit_edge ], [ 0, %._crit_edge35.us.prol.preheader ]
  %prol.iter79 = phi i32 [ %prol.iter79.sub, %._crit_edge35.us.prol.._crit_edge35.us.prol_crit_edge ], [ %xtraiter77, %._crit_edge35.us.prol.preheader ]
  %66 = mul nuw nsw i64 %indvars.iv73.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %58, i64 %66
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %65, i32 8, i1 false)
  %indvars.iv.next74.prol = add nuw nsw i64 %indvars.iv73.prol, 1
  %prol.iter79.sub = add i32 %prol.iter79, -1
  %prol.iter79.cmp = icmp eq i32 %prol.iter79.sub, 0
  br i1 %prol.iter79.cmp, label %.preheader13.us.prol.loopexit.loopexit, label %._crit_edge35.us.prol.._crit_edge35.us.prol_crit_edge, !llvm.loop !1

._crit_edge35.us.prol.._crit_edge35.us.prol_crit_edge: ; preds = %._crit_edge35.us.prol
  %pgocount10 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %67 = add i64 %pgocount10, 1
  store i64 %67, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  br label %._crit_edge35.us.prol

.preheader13.us.prol.loopexit.loopexit:           ; preds = %._crit_edge35.us.prol
  %pgocount11 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 23)
  %68 = add i64 %pgocount11, 1
  store i64 %68, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 23)
  br label %.preheader13.us.prol.loopexit

.preheader13.us.prol.loopexit:                    ; preds = %.preheader13.us.prol.loopexit.loopexit, %.preheader13.us.preheader
  %indvars.iv73.unr = phi i64 [ 0, %.preheader13.us.preheader ], [ %indvars.iv.next74.prol, %.preheader13.us.prol.loopexit.loopexit ]
  %69 = icmp ult i32 %62, 3
  br i1 %69, label %.preheader11.lr.ph, label %._crit_edge35.us.3.preheader

._crit_edge35.us.3.preheader:                     ; preds = %.preheader13.us.prol.loopexit
  %pgocount12 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 24)
  %70 = add i64 %pgocount12, 1
  store i64 %70, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 24)
  %wide.trip.count75.3 = zext i32 %0 to i64
  %71 = add nsw i64 %wide.trip.count75.3, -4
  %72 = sub i64 %71, %indvars.iv73.unr
  %73 = lshr i64 %72, 2
  %74 = and i64 %73, 1
  %lcmp.mod113 = icmp eq i64 %74, 0
  br i1 %lcmp.mod113, label %._crit_edge35.us.3.prol.preheader, label %._crit_edge35.us.3.prol.loopexit

._crit_edge35.us.3.prol.preheader:                ; preds = %._crit_edge35.us.3.preheader
  %pgocount13 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 27)
  %75 = add i64 %pgocount13, 1
  store i64 %75, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 27)
  br label %._crit_edge35.us.3.prol

._crit_edge35.us.3.prol:                          ; preds = %._crit_edge35.us.3.prol.preheader
  %76 = mul nuw nsw i64 %indvars.iv73.unr, 16000
  %scevgep.prol115 = getelementptr i8, i8* %58, i64 %76
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol115, i8 0, i64 %65, i32 8, i1 false)
  %77 = mul i64 %indvars.iv73.unr, 16000
  %78 = add i64 %77, 16000
  %scevgep.1.prol = getelementptr i8, i8* %58, i64 %78
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.prol, i8 0, i64 %65, i32 8, i1 false)
  %79 = mul i64 %indvars.iv73.unr, 16000
  %80 = add i64 %79, 32000
  %scevgep.2.prol = getelementptr i8, i8* %58, i64 %80
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.prol, i8 0, i64 %65, i32 8, i1 false)
  %81 = mul i64 %indvars.iv73.unr, 16000
  %82 = add i64 %81, 48000
  %scevgep.3.prol = getelementptr i8, i8* %58, i64 %82
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.prol, i8 0, i64 %65, i32 8, i1 false)
  %indvars.iv.next74.3.prol = add nsw i64 %indvars.iv73.unr, 4
  br label %._crit_edge35.us.3.prol.loopexit

._crit_edge35.us.3.prol.loopexit:                 ; preds = %._crit_edge35.us.3.prol, %._crit_edge35.us.3.preheader
  %indvars.iv73.unr116 = phi i64 [ %indvars.iv73.unr, %._crit_edge35.us.3.preheader ], [ %indvars.iv.next74.3.prol, %._crit_edge35.us.3.prol ]
  %83 = icmp eq i64 %73, 0
  br i1 %83, label %.preheader12, label %._crit_edge35.us.3.preheader.new

._crit_edge35.us.3.preheader.new:                 ; preds = %._crit_edge35.us.3.prol.loopexit
  br label %._crit_edge35.us.3

.preheader12.unr-lcssa:                           ; preds = %._crit_edge35.us.3
  %pgocount14 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 26)
  %84 = add i64 %pgocount14, 1
  store i64 %84, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 26)
  br label %.preheader12

.preheader12:                                     ; preds = %.preheader12.unr-lcssa, %._crit_edge35.us.3.prol.loopexit
  %85 = icmp sgt i32 %0, 0
  br i1 %85, label %.preheader11.lr.ph, label %._crit_edge19

.preheader11.lr.ph:                               ; preds = %.preheader12, %.preheader13.us.prol.loopexit
  %xtraiter59 = and i32 %0, 1
  %lcmp.mod60 = icmp eq i32 %xtraiter59, 0
  %86 = icmp eq i32 %0, 1
  %wide.trip.count63 = zext i32 %0 to i64
  %wide.trip.count55.1 = zext i32 %0 to i64
  %wide.trip.count67 = zext i32 %0 to i64
  br label %.preheader10.us.us.preheader

.preheader10.us.us.preheader:                     ; preds = %._crit_edge24.us, %.preheader11.lr.ph
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %._crit_edge24.us ], [ 0, %.preheader11.lr.ph ]
  %87 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv65
  br label %.preheader10.us.us

._crit_edge24.us:                                 ; preds = %._crit_edge22.us.us
  %pgocount15 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 12)
  %88 = add i64 %pgocount15, 1
  store i64 %88, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 12)
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next66, %wide.trip.count67
  br i1 %exitcond68, label %.preheader9, label %.preheader10.us.us.preheader

.preheader10.us.us:                               ; preds = %._crit_edge22.us.us, %.preheader10.us.us.preheader
  %indvars.iv61 = phi i64 [ 0, %.preheader10.us.us.preheader ], [ %indvars.iv.next62, %._crit_edge22.us.us ]
  %89 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv61, i64 %indvars.iv65
  br i1 %lcmp.mod60, label %.prol.loopexit58, label %.prol.preheader57

.prol.preheader57:                                ; preds = %.preheader10.us.us
  %pgocount16 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  %90 = add i64 %pgocount16, 1
  store i64 %90, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  %91 = load double, double* %89, align 8
  %92 = load double, double* %87, align 8
  %93 = fmul double %91, %92
  %94 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %59, i64 0, i64 %indvars.iv61, i64 0
  %95 = load double, double* %94, align 8
  %96 = fadd double %95, %93
  store double %96, double* %94, align 8
  br label %.prol.loopexit58

.prol.loopexit58:                                 ; preds = %.prol.preheader57, %.preheader10.us.us
  %indvars.iv53.unr.ph = phi i64 [ 1, %.prol.preheader57 ], [ 0, %.preheader10.us.us ]
  br i1 %86, label %.prol.loopexit58.._crit_edge22.us.us_crit_edge, label %.preheader10.us.us.new.preheader

.prol.loopexit58.._crit_edge22.us.us_crit_edge:   ; preds = %.prol.loopexit58
  %pgocount17 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %97 = add i64 %pgocount17, 1
  store i64 %97, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  br label %._crit_edge22.us.us

.preheader10.us.us.new.preheader:                 ; preds = %.prol.loopexit58
  br label %.preheader10.us.us.new

._crit_edge22.us.us.loopexit:                     ; preds = %.preheader10.us.us.new
  %pgocount18 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 10)
  %98 = add i64 %pgocount18, 1
  store i64 %98, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 10)
  br label %._crit_edge22.us.us

._crit_edge22.us.us:                              ; preds = %.prol.loopexit58.._crit_edge22.us.us_crit_edge, %._crit_edge22.us.us.loopexit
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next62, %wide.trip.count63
  br i1 %exitcond64, label %._crit_edge24.us, label %.preheader10.us.us

.preheader10.us.us.new:                           ; preds = %.preheader10.us.us.new..preheader10.us.us.new_crit_edge, %.preheader10.us.us.new.preheader
  %indvars.iv53 = phi i64 [ %indvars.iv.next54.1, %.preheader10.us.us.new..preheader10.us.us.new_crit_edge ], [ %indvars.iv53.unr.ph, %.preheader10.us.us.new.preheader ]
  %99 = load double, double* %89, align 8
  %100 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv53, i64 %indvars.iv65
  %101 = load double, double* %100, align 8
  %102 = fmul double %99, %101
  %103 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %59, i64 0, i64 %indvars.iv61, i64 %indvars.iv53
  %104 = load double, double* %103, align 8
  %105 = fadd double %104, %102
  store double %105, double* %103, align 8
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %106 = load double, double* %89, align 8
  %107 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next54, i64 %indvars.iv65
  %108 = load double, double* %107, align 8
  %109 = fmul double %106, %108
  %110 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %59, i64 0, i64 %indvars.iv61, i64 %indvars.iv.next54
  %111 = load double, double* %110, align 8
  %112 = fadd double %111, %109
  store double %112, double* %110, align 8
  %indvars.iv.next54.1 = add nsw i64 %indvars.iv53, 2
  %exitcond56.1 = icmp eq i64 %indvars.iv.next54.1, %wide.trip.count55.1
  br i1 %exitcond56.1, label %._crit_edge22.us.us.loopexit, label %.preheader10.us.us.new..preheader10.us.us.new_crit_edge

.preheader10.us.us.new..preheader10.us.us.new_crit_edge: ; preds = %.preheader10.us.us.new
  %pgocount19 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %113 = add i64 %pgocount19, 1
  store i64 %113, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  br label %.preheader10.us.us.new

.preheader9:                                      ; preds = %._crit_edge24.us
  %pgocount20 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 22)
  %114 = add i64 %pgocount20, 1
  store i64 %114, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 22)
  %115 = icmp sgt i32 %0, 0
  br i1 %115, label %.preheader.us.preheader, label %._crit_edge19

.preheader.us.preheader:                          ; preds = %.preheader9
  %pgocount21 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 25)
  %116 = add i64 %pgocount21, 1
  store i64 %116, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 25)
  %117 = add i32 %0, -1
  %xtraiter = and i32 %0, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %118 = icmp ult i32 %117, 3
  %wide.trip.count52 = zext i32 %0 to i64
  %wide.trip.count.3 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv50 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next51, %._crit_edge.us ]
  br i1 %lcmp.mod, label %.preheader.us..prol.loopexit_crit_edge, label %.prol.preheader.preheader

.preheader.us..prol.loopexit_crit_edge:           ; preds = %.preheader.us
  %pgocount22 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  %119 = add i64 %pgocount22, 1
  store i64 %119, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  br label %.prol.loopexit

.prol.preheader.preheader:                        ; preds = %.preheader.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader..prol.preheader_crit_edge, %.prol.preheader.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader..prol.preheader_crit_edge ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader..prol.preheader_crit_edge ], [ %xtraiter, %.prol.preheader.preheader ]
  %120 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %59, i64 0, i64 %indvars.iv50, i64 %indvars.iv.prol
  %121 = bitcast double* %120 to i64*
  %122 = load i64, i64* %121, align 8
  %123 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv50, i64 %indvars.iv.prol
  %124 = bitcast double* %123 to i64*
  store i64 %122, i64* %124, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader..prol.preheader_crit_edge, !llvm.loop !3

.prol.preheader..prol.preheader_crit_edge:        ; preds = %.prol.preheader
  %pgocount23 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %125 = add i64 %pgocount23, 1
  store i64 %125, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  br label %.prol.preheader

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  %pgocount24 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 14)
  %126 = add i64 %pgocount24, 1
  store i64 %126, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 14)
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us..prol.loopexit_crit_edge, %.prol.loopexit.loopexit
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us..prol.loopexit_crit_edge ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  br i1 %118, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new..preheader.us.new_crit_edge, %.preheader.us.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us.new..preheader.us.new_crit_edge ], [ %indvars.iv.unr, %.preheader.us.new.preheader ]
  %127 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %59, i64 0, i64 %indvars.iv50, i64 %indvars.iv
  %128 = bitcast double* %127 to i64*
  %129 = load i64, i64* %128, align 8
  %130 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv50, i64 %indvars.iv
  %131 = bitcast double* %130 to i64*
  store i64 %129, i64* %131, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %132 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %59, i64 0, i64 %indvars.iv50, i64 %indvars.iv.next
  %133 = bitcast double* %132 to i64*
  %134 = load i64, i64* %133, align 8
  %135 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv50, i64 %indvars.iv.next
  %136 = bitcast double* %135 to i64*
  store i64 %134, i64* %136, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %137 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %59, i64 0, i64 %indvars.iv50, i64 %indvars.iv.next.1
  %138 = bitcast double* %137 to i64*
  %139 = load i64, i64* %138, align 8
  %140 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv50, i64 %indvars.iv.next.1
  %141 = bitcast double* %140 to i64*
  store i64 %139, i64* %141, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %142 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %59, i64 0, i64 %indvars.iv50, i64 %indvars.iv.next.2
  %143 = bitcast double* %142 to i64*
  %144 = load i64, i64* %143, align 8
  %145 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv50, i64 %indvars.iv.next.2
  %146 = bitcast double* %145 to i64*
  store i64 %144, i64* %146, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %._crit_edge.us.loopexit, label %.preheader.us.new..preheader.us.new_crit_edge

.preheader.us.new..preheader.us.new_crit_edge:    ; preds = %.preheader.us.new
  %pgocount25 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %147 = add i64 %pgocount25, 1
  store i64 %147, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  br label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  %pgocount26 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 15)
  %148 = add i64 %pgocount26, 1
  store i64 %148, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 15)
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond = icmp eq i64 %indvars.iv.next51, %wide.trip.count52
  br i1 %exitcond, label %._crit_edge19.loopexit, label %.preheader.us

._crit_edge19.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit, %.preheader9, %.preheader12, %._crit_edge44, %._crit_edge44.thread
  %149 = phi i8* [ %58, %.preheader9 ], [ %58, %.preheader12 ], [ %58, %._crit_edge44 ], [ %56, %._crit_edge44.thread ], [ %58, %._crit_edge19.loopexit ]
  tail call void @free(i8* %149) #4
  ret void

._crit_edge35.us.3:                               ; preds = %._crit_edge35.us.3.._crit_edge35.us.3_crit_edge, %._crit_edge35.us.3.preheader.new
  %indvars.iv73 = phi i64 [ %indvars.iv73.unr116, %._crit_edge35.us.3.preheader.new ], [ %indvars.iv.next74.3.1, %._crit_edge35.us.3.._crit_edge35.us.3_crit_edge ]
  %150 = mul nuw nsw i64 %indvars.iv73, 16000
  %scevgep = getelementptr i8, i8* %58, i64 %150
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %65, i32 8, i1 false)
  %151 = mul i64 %indvars.iv73, 16000
  %152 = add i64 %151, 16000
  %scevgep.1 = getelementptr i8, i8* %58, i64 %152
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %65, i32 8, i1 false)
  %153 = mul i64 %indvars.iv73, 16000
  %154 = add i64 %153, 32000
  %scevgep.2 = getelementptr i8, i8* %58, i64 %154
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %65, i32 8, i1 false)
  %155 = mul i64 %indvars.iv73, 16000
  %156 = add i64 %155, 48000
  %scevgep.3 = getelementptr i8, i8* %58, i64 %156
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %65, i32 8, i1 false)
  %indvars.iv.next74.3 = add nsw i64 %indvars.iv73, 4
  %157 = mul nuw nsw i64 %indvars.iv.next74.3, 16000
  %scevgep.1117 = getelementptr i8, i8* %58, i64 %157
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1117, i8 0, i64 %65, i32 8, i1 false)
  %158 = mul i64 %indvars.iv.next74.3, 16000
  %159 = add i64 %158, 16000
  %scevgep.1.1 = getelementptr i8, i8* %58, i64 %159
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 %65, i32 8, i1 false)
  %160 = mul i64 %indvars.iv.next74.3, 16000
  %161 = add i64 %160, 32000
  %scevgep.2.1 = getelementptr i8, i8* %58, i64 %161
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 %65, i32 8, i1 false)
  %162 = mul i64 %indvars.iv.next74.3, 16000
  %163 = add i64 %162, 48000
  %scevgep.3.1 = getelementptr i8, i8* %58, i64 %163
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 %65, i32 8, i1 false)
  %indvars.iv.next74.3.1 = add nsw i64 %indvars.iv73, 8
  %exitcond76.3.1 = icmp eq i64 %indvars.iv.next74.3.1, %wide.trip.count75.3
  br i1 %exitcond76.3.1, label %.preheader12.unr-lcssa, label %._crit_edge35.us.3.._crit_edge35.us.3_crit_edge

._crit_edge35.us.3.._crit_edge35.us.3_crit_edge:  ; preds = %._crit_edge35.us.3
  %pgocount27 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %164 = add i64 %pgocount27, 1
  store i64 %164, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  br label %._crit_edge35.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader12.preheader, label %._crit_edge19

.preheader12.preheader:                           ; preds = %5
  %wide.trip.count101 = zext i32 %0 to i64
  %wide.trip.count95 = zext i32 %0 to i64
  br label %.preheader12

.preheader12:                                     ; preds = %._crit_edge44, %.preheader12.preheader
  %indvars.iv99 = phi i64 [ %indvars.iv.next100, %._crit_edge44 ], [ 0, %.preheader12.preheader ]
  %7 = add i64 %indvars.iv99, 4294967295
  %8 = icmp sgt i64 %indvars.iv99, 0
  br i1 %8, label %.lr.ph35.preheader, label %.preheader12.._crit_edge44_crit_edge

.preheader12.._crit_edge44_crit_edge:             ; preds = %.preheader12
  %pgocount = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 8)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 8)
  br label %._crit_edge44

.lr.ph35.preheader:                               ; preds = %.preheader12
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv99, i64 0
  br label %.lr.ph35

.preheader10:                                     ; preds = %._crit_edge44
  %pgocount1 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 25)
  %11 = add i64 %pgocount1, 1
  store i64 %11, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 25)
  %12 = icmp sgt i32 %0, 0
  br i1 %12, label %.lr.ph27.preheader, label %._crit_edge19

.lr.ph27.preheader:                               ; preds = %.preheader10
  %wide.trip.count67 = zext i32 %0 to i64
  br label %.lr.ph27

.lr.ph43:                                         ; preds = %._crit_edge32
  %pgocount2 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 16)
  %13 = add i64 %pgocount2, 1
  store i64 %13, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 16)
  %14 = icmp sgt i64 %indvars.iv99, 0
  br i1 %14, label %.lr.ph43.split.us.preheader, label %._crit_edge44

.lr.ph43.split.us.preheader:                      ; preds = %.lr.ph43
  %xtraiter89103 = and i64 %indvars.iv99, 1
  %lcmp.mod90 = icmp eq i64 %xtraiter89103, 0
  %15 = trunc i64 %7 to i32
  %16 = icmp eq i32 %15, 0
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv99, i64 0
  br label %.lr.ph43.split.us

.lr.ph43.split.us:                                ; preds = %._crit_edge40.us, %.lr.ph43.split.us.preheader
  %indvars.iv93 = phi i64 [ %indvars.iv.next94, %._crit_edge40.us ], [ %indvars.iv99, %.lr.ph43.split.us.preheader ]
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv99, i64 %indvars.iv93
  %19 = load double, double* %18, align 8
  br i1 %lcmp.mod90, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph43.split.us
  %pgocount3 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 14)
  %20 = add i64 %pgocount3, 1
  store i64 %20, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 14)
  %21 = load double, double* %17, align 8
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv93
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = fsub double %19, %24
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph43.split.us
  %indvars.iv84.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph43.split.us ]
  %.137.us.unr.ph = phi double [ %25, %.prol.preheader ], [ %19, %.lr.ph43.split.us ]
  %.lcssa51.unr.ph = phi double [ %25, %.prol.preheader ], [ undef, %.lr.ph43.split.us ]
  br i1 %16, label %.prol.loopexit.._crit_edge40.us_crit_edge, label %.lr.ph43.split.us.new.preheader

.prol.loopexit.._crit_edge40.us_crit_edge:        ; preds = %.prol.loopexit
  %pgocount4 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 5)
  %26 = add i64 %pgocount4, 1
  store i64 %26, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 5)
  br label %._crit_edge40.us

.lr.ph43.split.us.new.preheader:                  ; preds = %.prol.loopexit
  br label %.lr.ph43.split.us.new

.lr.ph43.split.us.new:                            ; preds = %.lr.ph43.split.us.new..lr.ph43.split.us.new_crit_edge, %.lr.ph43.split.us.new.preheader
  %indvars.iv84 = phi i64 [ %indvars.iv.next85.1, %.lr.ph43.split.us.new..lr.ph43.split.us.new_crit_edge ], [ %indvars.iv84.unr.ph, %.lr.ph43.split.us.new.preheader ]
  %.137.us = phi double [ %38, %.lr.ph43.split.us.new..lr.ph43.split.us.new_crit_edge ], [ %.137.us.unr.ph, %.lr.ph43.split.us.new.preheader ]
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv99, i64 %indvars.iv84
  %28 = load double, double* %27, align 8
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv84, i64 %indvars.iv93
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = fsub double %.137.us, %31
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv99, i64 %indvars.iv.next85
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next85, i64 %indvars.iv93
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = fsub double %32, %37
  %indvars.iv.next85.1 = add nsw i64 %indvars.iv84, 2
  %exitcond88.1 = icmp eq i64 %indvars.iv.next85.1, %indvars.iv99
  br i1 %exitcond88.1, label %._crit_edge40.us.loopexit, label %.lr.ph43.split.us.new..lr.ph43.split.us.new_crit_edge

.lr.ph43.split.us.new..lr.ph43.split.us.new_crit_edge: ; preds = %.lr.ph43.split.us.new
  %pgocount5 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 0)
  %39 = add i64 %pgocount5, 1
  store i64 %39, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 0)
  br label %.lr.ph43.split.us.new

._crit_edge40.us.loopexit:                        ; preds = %.lr.ph43.split.us.new
  %pgocount6 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 12)
  %40 = add i64 %pgocount6, 1
  store i64 %40, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 12)
  br label %._crit_edge40.us

._crit_edge40.us:                                 ; preds = %.prol.loopexit.._crit_edge40.us_crit_edge, %._crit_edge40.us.loopexit
  %.lcssa51 = phi double [ %.lcssa51.unr.ph, %.prol.loopexit.._crit_edge40.us_crit_edge ], [ %38, %._crit_edge40.us.loopexit ]
  store double %.lcssa51, double* %18, align 8
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %exitcond96 = icmp eq i64 %indvars.iv.next94, %wide.trip.count95
  br i1 %exitcond96, label %._crit_edge44.loopexit, label %.lr.ph43.split.us

.lr.ph35:                                         ; preds = %._crit_edge32, %.lr.ph35.preheader
  %indvars.iv77 = phi i64 [ %indvars.iv.next78, %._crit_edge32 ], [ 0, %.lr.ph35.preheader ]
  %41 = add i64 %indvars.iv77, 4294967295
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv99, i64 %indvars.iv77
  %43 = load double, double* %42, align 8
  %44 = icmp sgt i64 %indvars.iv77, 0
  br i1 %44, label %.lr.ph31.preheader, label %.lr.ph35.._crit_edge32_crit_edge

.lr.ph35.._crit_edge32_crit_edge:                 ; preds = %.lr.ph35
  %pgocount7 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 3)
  %45 = add i64 %pgocount7, 1
  store i64 %45, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 3)
  br label %._crit_edge32

.lr.ph31.preheader:                               ; preds = %.lr.ph35
  %pgocount8 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 11)
  %46 = add i64 %pgocount8, 1
  store i64 %46, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 11)
  %xtraiter73104 = and i64 %indvars.iv77, 1
  %lcmp.mod74 = icmp eq i64 %xtraiter73104, 0
  br i1 %lcmp.mod74, label %.lr.ph31.prol.loopexit, label %.lr.ph31.prol

.lr.ph31.prol:                                    ; preds = %.lr.ph31.preheader
  %pgocount9 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 15)
  %47 = add i64 %pgocount9, 1
  store i64 %47, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 15)
  %48 = load double, double* %10, align 8
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv77
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = fsub double %43, %51
  br label %.lr.ph31.prol.loopexit

.lr.ph31.prol.loopexit:                           ; preds = %.lr.ph31.prol, %.lr.ph31.preheader
  %indvars.iv68.unr.ph = phi i64 [ 1, %.lr.ph31.prol ], [ 0, %.lr.ph31.preheader ]
  %.029.unr.ph = phi double [ %52, %.lr.ph31.prol ], [ %43, %.lr.ph31.preheader ]
  %.lcssa50.unr.ph = phi double [ %52, %.lr.ph31.prol ], [ undef, %.lr.ph31.preheader ]
  %53 = trunc i64 %41 to i32
  %54 = icmp eq i32 %53, 0
  br i1 %54, label %._crit_edge32, label %.lr.ph31.preheader123

.lr.ph31.preheader123:                            ; preds = %.lr.ph31.prol.loopexit
  br label %.lr.ph31

.lr.ph31:                                         ; preds = %.lr.ph31..lr.ph31_crit_edge, %.lr.ph31.preheader123
  %indvars.iv68 = phi i64 [ %indvars.iv.next69.1, %.lr.ph31..lr.ph31_crit_edge ], [ %indvars.iv68.unr.ph, %.lr.ph31.preheader123 ]
  %.029 = phi double [ %66, %.lr.ph31..lr.ph31_crit_edge ], [ %.029.unr.ph, %.lr.ph31.preheader123 ]
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv99, i64 %indvars.iv68
  %56 = load double, double* %55, align 8
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv68, i64 %indvars.iv77
  %58 = load double, double* %57, align 8
  %59 = fmul double %56, %58
  %60 = fsub double %.029, %59
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv99, i64 %indvars.iv.next69
  %62 = load double, double* %61, align 8
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next69, i64 %indvars.iv77
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = fsub double %60, %65
  %indvars.iv.next69.1 = add nsw i64 %indvars.iv68, 2
  %exitcond72.1 = icmp eq i64 %indvars.iv.next69.1, %indvars.iv77
  br i1 %exitcond72.1, label %._crit_edge32.loopexit, label %.lr.ph31..lr.ph31_crit_edge

.lr.ph31..lr.ph31_crit_edge:                      ; preds = %.lr.ph31
  %pgocount10 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 1)
  %67 = add i64 %pgocount10, 1
  store i64 %67, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 1)
  br label %.lr.ph31

._crit_edge32.loopexit:                           ; preds = %.lr.ph31
  %pgocount11 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 13)
  %68 = add i64 %pgocount11, 1
  store i64 %68, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 13)
  br label %._crit_edge32

._crit_edge32:                                    ; preds = %.lr.ph35.._crit_edge32_crit_edge, %._crit_edge32.loopexit, %.lr.ph31.prol.loopexit
  %.0.lcssa = phi double [ %43, %.lr.ph35.._crit_edge32_crit_edge ], [ %.lcssa50.unr.ph, %.lr.ph31.prol.loopexit ], [ %66, %._crit_edge32.loopexit ]
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv77, i64 %indvars.iv77
  %70 = load double, double* %69, align 8
  %71 = fdiv double %.0.lcssa, %70
  store double %71, double* %42, align 8
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %exitcond82 = icmp eq i64 %indvars.iv.next78, %indvars.iv99
  br i1 %exitcond82, label %.lr.ph43, label %.lr.ph35

._crit_edge44.loopexit:                           ; preds = %._crit_edge40.us
  %pgocount12 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 17)
  %72 = add i64 %pgocount12, 1
  store i64 %72, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 17)
  br label %._crit_edge44

._crit_edge44:                                    ; preds = %.preheader12.._crit_edge44_crit_edge, %._crit_edge44.loopexit, %.lr.ph43
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv99, 1
  %exitcond102 = icmp eq i64 %indvars.iv.next100, %wide.trip.count101
  br i1 %exitcond102, label %.preheader10, label %.preheader12

.preheader:                                       ; preds = %._crit_edge24
  %pgocount13 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 26)
  %73 = add i64 %pgocount13, 1
  store i64 %73, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 26)
  %74 = icmp sgt i32 %0, 0
  br i1 %74, label %.lr.ph18.preheader, label %._crit_edge19

.lr.ph18.preheader:                               ; preds = %.preheader
  %75 = sext i32 %0 to i64
  br label %.lr.ph18

.lr.ph27:                                         ; preds = %._crit_edge24, %.lr.ph27.preheader
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %._crit_edge24 ], [ 0, %.lr.ph27.preheader ]
  %76 = add i64 %indvars.iv65, 4294967295
  %77 = getelementptr inbounds double, double* %2, i64 %indvars.iv65
  %78 = load double, double* %77, align 8
  %79 = icmp sgt i64 %indvars.iv65, 0
  br i1 %79, label %.lr.ph23.preheader, label %.lr.ph27.._crit_edge24_crit_edge

.lr.ph27.._crit_edge24_crit_edge:                 ; preds = %.lr.ph27
  %pgocount14 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 9)
  %80 = add i64 %pgocount14, 1
  store i64 %80, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 9)
  br label %._crit_edge24

.lr.ph23.preheader:                               ; preds = %.lr.ph27
  %pgocount15 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 18)
  %81 = add i64 %pgocount15, 1
  store i64 %81, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 18)
  %82 = trunc i64 %indvars.iv65 to i32
  %xtraiter58 = and i32 %82, 3
  %lcmp.mod59 = icmp eq i32 %xtraiter58, 0
  br i1 %lcmp.mod59, label %.lr.ph23.prol.loopexit, label %.lr.ph23.prol.preheader

.lr.ph23.prol.preheader:                          ; preds = %.lr.ph23.preheader
  br label %.lr.ph23.prol

.lr.ph23.prol:                                    ; preds = %.lr.ph23.prol..lr.ph23.prol_crit_edge, %.lr.ph23.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph23.prol..lr.ph23.prol_crit_edge ], [ 0, %.lr.ph23.prol.preheader ]
  %.221.prol = phi double [ %88, %.lr.ph23.prol..lr.ph23.prol_crit_edge ], [ %78, %.lr.ph23.prol.preheader ]
  %prol.iter61 = phi i32 [ %prol.iter61.sub, %.lr.ph23.prol..lr.ph23.prol_crit_edge ], [ %xtraiter58, %.lr.ph23.prol.preheader ]
  %83 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv.prol
  %84 = load double, double* %83, align 8
  %85 = getelementptr inbounds double, double* %4, i64 %indvars.iv.prol
  %86 = load double, double* %85, align 8
  %87 = fmul double %84, %86
  %88 = fsub double %.221.prol, %87
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter61.sub = add i32 %prol.iter61, -1
  %prol.iter61.cmp = icmp eq i32 %prol.iter61.sub, 0
  br i1 %prol.iter61.cmp, label %.lr.ph23.prol.loopexit.loopexit, label %.lr.ph23.prol..lr.ph23.prol_crit_edge, !llvm.loop !4

.lr.ph23.prol..lr.ph23.prol_crit_edge:            ; preds = %.lr.ph23.prol
  %pgocount16 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 2)
  %89 = add i64 %pgocount16, 1
  store i64 %89, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 2)
  br label %.lr.ph23.prol

.lr.ph23.prol.loopexit.loopexit:                  ; preds = %.lr.ph23.prol
  %pgocount17 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 19)
  %90 = add i64 %pgocount17, 1
  store i64 %90, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 19)
  br label %.lr.ph23.prol.loopexit

.lr.ph23.prol.loopexit:                           ; preds = %.lr.ph23.prol.loopexit.loopexit, %.lr.ph23.preheader
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph23.preheader ], [ %indvars.iv.next.prol, %.lr.ph23.prol.loopexit.loopexit ]
  %.221.unr = phi double [ %78, %.lr.ph23.preheader ], [ %88, %.lr.ph23.prol.loopexit.loopexit ]
  %.lcssa49.unr = phi double [ undef, %.lr.ph23.preheader ], [ %88, %.lr.ph23.prol.loopexit.loopexit ]
  %91 = trunc i64 %76 to i32
  %92 = icmp ult i32 %91, 3
  br i1 %92, label %._crit_edge24, label %.lr.ph23.preheader122

.lr.ph23.preheader122:                            ; preds = %.lr.ph23.prol.loopexit
  br label %.lr.ph23

.lr.ph23:                                         ; preds = %.lr.ph23..lr.ph23_crit_edge, %.lr.ph23.preheader122
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph23..lr.ph23_crit_edge ], [ %indvars.iv.unr, %.lr.ph23.preheader122 ]
  %.221 = phi double [ %116, %.lr.ph23..lr.ph23_crit_edge ], [ %.221.unr, %.lr.ph23.preheader122 ]
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv
  %94 = load double, double* %93, align 8
  %95 = getelementptr inbounds double, double* %4, i64 %indvars.iv
  %96 = load double, double* %95, align 8
  %97 = fmul double %94, %96
  %98 = fsub double %.221, %97
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %99 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv.next
  %100 = load double, double* %99, align 8
  %101 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next
  %102 = load double, double* %101, align 8
  %103 = fmul double %100, %102
  %104 = fsub double %98, %103
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %105 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv.next.1
  %106 = load double, double* %105, align 8
  %107 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next.1
  %108 = load double, double* %107, align 8
  %109 = fmul double %106, %108
  %110 = fsub double %104, %109
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %111 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv65, i64 %indvars.iv.next.2
  %112 = load double, double* %111, align 8
  %113 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next.2
  %114 = load double, double* %113, align 8
  %115 = fmul double %112, %114
  %116 = fsub double %110, %115
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.362 = icmp eq i64 %indvars.iv.next.3, %indvars.iv65
  br i1 %exitcond.362, label %._crit_edge24.loopexit, label %.lr.ph23..lr.ph23_crit_edge

.lr.ph23..lr.ph23_crit_edge:                      ; preds = %.lr.ph23
  %pgocount18 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 4)
  %117 = add i64 %pgocount18, 1
  store i64 %117, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 4)
  br label %.lr.ph23

._crit_edge24.loopexit:                           ; preds = %.lr.ph23
  %pgocount19 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 20)
  %118 = add i64 %pgocount19, 1
  store i64 %118, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 20)
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %.lr.ph27.._crit_edge24_crit_edge, %._crit_edge24.loopexit, %.lr.ph23.prol.loopexit
  %.2.lcssa = phi double [ %78, %.lr.ph27.._crit_edge24_crit_edge ], [ %.lcssa49.unr, %.lr.ph23.prol.loopexit ], [ %116, %._crit_edge24.loopexit ]
  %119 = getelementptr inbounds double, double* %4, i64 %indvars.iv65
  store double %.2.lcssa, double* %119, align 8
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond = icmp eq i64 %indvars.iv.next66, %wide.trip.count67
  br i1 %exitcond, label %.preheader, label %.lr.ph27

.lr.ph18:                                         ; preds = %._crit_edge, %.lr.ph18.preheader
  %indvars.iv54 = phi i64 [ %75, %.lr.ph18.preheader ], [ %indvars.iv.next55, %._crit_edge ]
  %indvar = phi i32 [ 0, %.lr.ph18.preheader ], [ %indvar.next, %._crit_edge ]
  %.2917.in = phi i32 [ %0, %.lr.ph18.preheader ], [ %.2917, %._crit_edge ]
  %120 = add nsw i32 %indvar, -1
  %indvars.iv.next55 = add nsw i64 %indvars.iv54, -1
  %.2917 = add nsw i32 %.2917.in, -1
  %121 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next55
  %122 = load double, double* %121, align 8
  %123 = icmp slt i32 %.2917.in, %0
  br i1 %123, label %.lr.ph.preheader, label %.lr.ph18.._crit_edge_crit_edge

.lr.ph18.._crit_edge_crit_edge:                   ; preds = %.lr.ph18
  %pgocount20 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 10)
  %124 = add i64 %pgocount20, 1
  store i64 %124, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 10)
  br label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.lr.ph18
  %pgocount21 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 21)
  %125 = add i64 %pgocount21, 1
  store i64 %125, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 21)
  %xtraiter = and i32 %indvar, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol..lr.ph.prol_crit_edge, %.lr.ph.prol.preheader
  %indvars.iv52.prol = phi i64 [ %indvars.iv.next53.prol, %.lr.ph.prol..lr.ph.prol_crit_edge ], [ %indvars.iv54, %.lr.ph.prol.preheader ]
  %.314.prol = phi double [ %131, %.lr.ph.prol..lr.ph.prol_crit_edge ], [ %122, %.lr.ph.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.prol..lr.ph.prol_crit_edge ], [ %xtraiter, %.lr.ph.prol.preheader ]
  %126 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next55, i64 %indvars.iv52.prol
  %127 = load double, double* %126, align 8
  %128 = getelementptr inbounds double, double* %3, i64 %indvars.iv52.prol
  %129 = load double, double* %128, align 8
  %130 = fmul double %127, %129
  %131 = fsub double %.314.prol, %130
  %indvars.iv.next53.prol = add nsw i64 %indvars.iv52.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol..lr.ph.prol_crit_edge, !llvm.loop !5

.lr.ph.prol..lr.ph.prol_crit_edge:                ; preds = %.lr.ph.prol
  %pgocount22 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 6)
  %132 = add i64 %pgocount22, 1
  store i64 %132, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 6)
  br label %.lr.ph.prol

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  %pgocount23 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 22)
  %133 = add i64 %pgocount23, 1
  store i64 %133, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 22)
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %indvars.iv52.unr = phi i64 [ %indvars.iv54, %.lr.ph.preheader ], [ %indvars.iv.next53.prol, %.lr.ph.prol.loopexit.loopexit ]
  %.314.unr = phi double [ %122, %.lr.ph.preheader ], [ %131, %.lr.ph.prol.loopexit.loopexit ]
  %.lcssa.unr = phi double [ undef, %.lr.ph.preheader ], [ %131, %.lr.ph.prol.loopexit.loopexit ]
  %134 = icmp ult i32 %120, 3
  br i1 %134, label %._crit_edge, label %.lr.ph.preheader121

.lr.ph.preheader121:                              ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph..lr.ph_crit_edge, %.lr.ph.preheader121
  %indvars.iv52 = phi i64 [ %indvars.iv.next53.3, %.lr.ph..lr.ph_crit_edge ], [ %indvars.iv52.unr, %.lr.ph.preheader121 ]
  %.314 = phi double [ %158, %.lr.ph..lr.ph_crit_edge ], [ %.314.unr, %.lr.ph.preheader121 ]
  %135 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next55, i64 %indvars.iv52
  %136 = load double, double* %135, align 8
  %137 = getelementptr inbounds double, double* %3, i64 %indvars.iv52
  %138 = load double, double* %137, align 8
  %139 = fmul double %136, %138
  %140 = fsub double %.314, %139
  %indvars.iv.next53 = add nsw i64 %indvars.iv52, 1
  %141 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next55, i64 %indvars.iv.next53
  %142 = load double, double* %141, align 8
  %143 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next53
  %144 = load double, double* %143, align 8
  %145 = fmul double %142, %144
  %146 = fsub double %140, %145
  %indvars.iv.next53.1 = add nsw i64 %indvars.iv52, 2
  %147 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next55, i64 %indvars.iv.next53.1
  %148 = load double, double* %147, align 8
  %149 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next53.1
  %150 = load double, double* %149, align 8
  %151 = fmul double %148, %150
  %152 = fsub double %146, %151
  %indvars.iv.next53.2 = add nsw i64 %indvars.iv52, 3
  %153 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next55, i64 %indvars.iv.next53.2
  %154 = load double, double* %153, align 8
  %155 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next53.2
  %156 = load double, double* %155, align 8
  %157 = fmul double %154, %156
  %158 = fsub double %152, %157
  %indvars.iv.next53.3 = add nsw i64 %indvars.iv52, 4
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next53.3 to i32
  %exitcond.3 = icmp eq i32 %lftr.wideiv.3, %0
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph..lr.ph_crit_edge

.lr.ph..lr.ph_crit_edge:                          ; preds = %.lr.ph
  %pgocount24 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 7)
  %159 = add i64 %pgocount24, 1
  store i64 %159, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 7)
  br label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  %pgocount25 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 23)
  %160 = add i64 %pgocount25, 1
  store i64 %160, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 23)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph18.._crit_edge_crit_edge, %._crit_edge.loopexit, %.lr.ph.prol.loopexit
  %.3.lcssa = phi double [ %122, %.lr.ph18.._crit_edge_crit_edge ], [ %.lcssa.unr, %.lr.ph.prol.loopexit ], [ %158, %._crit_edge.loopexit ]
  %161 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next55, i64 %indvars.iv.next55
  %162 = load double, double* %161, align 8
  %163 = fdiv double %.3.lcssa, %162
  %164 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next55
  store double %163, double* %164, align 8
  %165 = icmp sgt i64 %indvars.iv54, 1
  %indvar.next = add nuw nsw i32 %indvar, 1
  br i1 %165, label %.lr.ph18, label %._crit_edge19.loopexit

._crit_edge19.loopexit:                           ; preds = %._crit_edge
  %pgocount26 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 27)
  %166 = add i64 %pgocount26, 1
  store i64 %166, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 27)
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit, %.preheader, %.preheader10, %5
  %pgocount27 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 24)
  %167 = add i64 %pgocount27, 1
  store i64 %167, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 24)
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
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !2}
!5 = distinct !{!5, !2}
