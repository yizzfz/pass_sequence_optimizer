; ModuleID = 'B.ll'
source_filename = "fdtd-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"ex\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"ey\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"hz\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_fdtd_2d = private constant [19 x i8] c"B.ll:kernel_fdtd_2d"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 32414643582, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [10 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 118391525865, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 10, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_fdtd_2d = private global [36 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_fdtd_2d = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -8235799579896179938, i64 410886641691, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i32 0, i32 0), i8* null, i8* null, i32 36, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [13 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 163912765687, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 13, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [59 x i8] c"9\00main\01B.ll:init_array\01B.ll:kernel_fdtd_2d\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_fdtd_2d to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([59 x i8], [59 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 500, i32 8) #4
  %7 = bitcast i8* %3 to [1200 x double]*
  %8 = bitcast i8* %4 to [1200 x double]*
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array(i32 500, i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_fdtd_2d(i32 500, i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
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
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9)
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

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture) unnamed_addr #2 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph8.preheader, label %.preheader2

.lr.ph8.preheader:                                ; preds = %7
  %pgocount = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %9 = add i64 %pgocount, 1
  store i64 %9, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %10 = add i32 %0, -1
  %xtraiter = and i32 %0, 7
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph8.prol.loopexit, label %.lr.ph8.prol.preheader

.lr.ph8.prol.preheader:                           ; preds = %.lr.ph8.preheader
  br label %.lr.ph8.prol

.lr.ph8.prol:                                     ; preds = %.lr.ph8.prol..lr.ph8.prol_crit_edge, %.lr.ph8.prol.preheader
  %indvars.iv15.prol = phi i64 [ %indvars.iv.next16.prol, %.lr.ph8.prol..lr.ph8.prol_crit_edge ], [ 0, %.lr.ph8.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph8.prol..lr.ph8.prol_crit_edge ], [ %xtraiter, %.lr.ph8.prol.preheader ]
  %11 = trunc i64 %indvars.iv15.prol to i32
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds double, double* %6, i64 %indvars.iv15.prol
  store double %12, double* %13, align 8
  %indvars.iv.next16.prol = add nuw nsw i64 %indvars.iv15.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph8.prol.loopexit.loopexit, label %.lr.ph8.prol..lr.ph8.prol_crit_edge, !llvm.loop !1

.lr.ph8.prol..lr.ph8.prol_crit_edge:              ; preds = %.lr.ph8.prol
  %pgocount1 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %14 = add i64 %pgocount1, 1
  store i64 %14, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  br label %.lr.ph8.prol

.lr.ph8.prol.loopexit.loopexit:                   ; preds = %.lr.ph8.prol
  %pgocount2 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %15 = add i64 %pgocount2, 1
  store i64 %15, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  br label %.lr.ph8.prol.loopexit

.lr.ph8.prol.loopexit:                            ; preds = %.lr.ph8.prol.loopexit.loopexit, %.lr.ph8.preheader
  %indvars.iv15.unr = phi i64 [ 0, %.lr.ph8.preheader ], [ %indvars.iv.next16.prol, %.lr.ph8.prol.loopexit.loopexit ]
  %16 = icmp ult i32 %10, 7
  br i1 %16, label %.preheader2, label %.lr.ph8.preheader19

.lr.ph8.preheader19:                              ; preds = %.lr.ph8.prol.loopexit
  %wide.trip.count17.7 = zext i32 %0 to i64
  br label %.lr.ph8

.preheader2.loopexit:                             ; preds = %.lr.ph8
  %pgocount3 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  %17 = add i64 %pgocount3, 1
  store i64 %17, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  br label %.preheader2

.preheader2:                                      ; preds = %.preheader2.loopexit, %.lr.ph8.prol.loopexit, %7
  %18 = icmp sgt i32 %1, 0
  br i1 %18, label %.preheader.lr.ph, label %._crit_edge5

.preheader.lr.ph:                                 ; preds = %.preheader2
  %pgocount4 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %19 = add i64 %pgocount4, 1
  store i64 %19, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %20 = icmp sgt i32 %2, 0
  %21 = sitofp i32 %1 to double
  %22 = sitofp i32 %2 to double
  br i1 %20, label %.preheader.us.preheader, label %._crit_edge5

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %wide.trip.count = zext i32 %2 to i64
  %wide.trip.count12 = zext i32 %1 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %23 = trunc i64 %indvars.iv10 to i32
  %24 = sitofp i32 %23 to double
  br label %25

; <label>:25:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %26 = trunc i64 %indvars.iv.next to i32
  %27 = sitofp i32 %26 to double
  %28 = fmul double %24, %27
  %29 = fdiv double %28, %21
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv10, i64 %indvars.iv
  store double %29, double* %30, align 8
  %31 = add nuw nsw i64 %indvars.iv, 2
  %32 = trunc i64 %31 to i32
  %33 = sitofp i32 %32 to double
  %34 = fmul double %24, %33
  %35 = fdiv double %34, %22
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv10, i64 %indvars.iv
  store double %35, double* %36, align 8
  %37 = add nuw nsw i64 %indvars.iv, 3
  %38 = trunc i64 %37 to i32
  %39 = sitofp i32 %38 to double
  %40 = fmul double %24, %39
  %41 = fdiv double %40, %21
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv10, i64 %indvars.iv
  store double %41, double* %42, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge:                                      ; preds = %25
  %pgocount5 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %43 = add i64 %pgocount5, 1
  store i64 %43, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  br label %25

._crit_edge.us:                                   ; preds = %25
  %pgocount6 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %44 = add i64 %pgocount6, 1
  store i64 %44, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next11, %wide.trip.count12
  br i1 %exitcond13, label %._crit_edge5.loopexit, label %.preheader.us

.lr.ph8:                                          ; preds = %.lr.ph8..lr.ph8_crit_edge, %.lr.ph8.preheader19
  %indvars.iv15 = phi i64 [ %indvars.iv.next16.7, %.lr.ph8..lr.ph8_crit_edge ], [ %indvars.iv15.unr, %.lr.ph8.preheader19 ]
  %45 = trunc i64 %indvars.iv15 to i32
  %46 = sitofp i32 %45 to double
  %47 = getelementptr inbounds double, double* %6, i64 %indvars.iv15
  store double %46, double* %47, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %48 = trunc i64 %indvars.iv.next16 to i32
  %49 = sitofp i32 %48 to double
  %50 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next16
  store double %49, double* %50, align 8
  %indvars.iv.next16.1 = add nsw i64 %indvars.iv15, 2
  %51 = trunc i64 %indvars.iv.next16.1 to i32
  %52 = sitofp i32 %51 to double
  %53 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next16.1
  store double %52, double* %53, align 8
  %indvars.iv.next16.2 = add nsw i64 %indvars.iv15, 3
  %54 = trunc i64 %indvars.iv.next16.2 to i32
  %55 = sitofp i32 %54 to double
  %56 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next16.2
  store double %55, double* %56, align 8
  %indvars.iv.next16.3 = add nsw i64 %indvars.iv15, 4
  %57 = trunc i64 %indvars.iv.next16.3 to i32
  %58 = sitofp i32 %57 to double
  %59 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next16.3
  store double %58, double* %59, align 8
  %indvars.iv.next16.4 = add nsw i64 %indvars.iv15, 5
  %60 = trunc i64 %indvars.iv.next16.4 to i32
  %61 = sitofp i32 %60 to double
  %62 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next16.4
  store double %61, double* %62, align 8
  %indvars.iv.next16.5 = add nsw i64 %indvars.iv15, 6
  %63 = trunc i64 %indvars.iv.next16.5 to i32
  %64 = sitofp i32 %63 to double
  %65 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next16.5
  store double %64, double* %65, align 8
  %indvars.iv.next16.6 = add nsw i64 %indvars.iv15, 7
  %66 = trunc i64 %indvars.iv.next16.6 to i32
  %67 = sitofp i32 %66 to double
  %68 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next16.6
  store double %67, double* %68, align 8
  %indvars.iv.next16.7 = add nsw i64 %indvars.iv15, 8
  %exitcond18.7 = icmp eq i64 %indvars.iv.next16.7, %wide.trip.count17.7
  br i1 %exitcond18.7, label %.preheader2.loopexit, label %.lr.ph8..lr.ph8_crit_edge

.lr.ph8..lr.ph8_crit_edge:                        ; preds = %.lr.ph8
  %pgocount7 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %69 = add i64 %pgocount7, 1
  store i64 %69, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  br label %.lr.ph8

._crit_edge5.loopexit:                            ; preds = %._crit_edge.us
  %pgocount8 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  %70 = add i64 %pgocount8, 1
  store i64 %70, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit, %.preheader.lr.ph, %.preheader2
  %pgocount9 = load i64, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %71 = add i64 %pgocount9, 1
  store i64 %71, i64* getelementptr inbounds ([10 x i64], [10 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_fdtd_2d(i32, i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture readonly) unnamed_addr #2 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader10.lr.ph, label %._crit_edge25

.preheader10.lr.ph:                               ; preds = %7
  %9 = icmp sgt i32 %2, 0
  %10 = add nsw i32 %1, -1
  %11 = add nsw i32 %2, -1
  %xtraiter = and i32 %2, 7
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %12 = icmp ult i32 %11, 7
  %wide.trip.count.7 = zext i32 %2 to i64
  %xtraiter34 = and i32 %2, 1
  %lcmp.mod35 = icmp eq i32 %xtraiter34, 0
  %13 = icmp eq i32 %11, 0
  %wide.trip.count39 = zext i32 %1 to i64
  %wide.trip.count31.1 = zext i32 %2 to i64
  %xtraiter47 = and i32 %11, 1
  %lcmp.mod48 = icmp eq i32 %xtraiter47, 0
  %14 = icmp eq i32 %2, 2
  %wide.trip.count51 = zext i32 %1 to i64
  %wide.trip.count43.1 = zext i32 %2 to i64
  %wide.trip.count60 = zext i32 %10 to i64
  %wide.trip.count56 = zext i32 %11 to i64
  %wide.trip.count64 = zext i32 %0 to i64
  %15 = add nuw nsw i64 %wide.trip.count56, 1
  %16 = add nsw i64 %wide.trip.count43.1, -2
  %17 = add nsw i64 %wide.trip.count43.1, -2
  %18 = add nsw i64 %wide.trip.count43.1, -2
  %19 = add nsw i64 %wide.trip.count43.1, -2
  %.not = icmp slt i32 %1, 2
  %.not66 = icmp slt i32 %2, 1
  %brmerge = or i1 %.not, %.not66
  %.not67 = icmp slt i32 %1, 1
  %.not68 = icmp slt i32 %2, 2
  %brmerge69 = or i1 %.not67, %.not68
  %.not70 = icmp slt i32 %1, 2
  %.not71 = icmp slt i32 %2, 2
  %brmerge72 = or i1 %.not70, %.not71
  %min.iters.check = icmp ult i32 %11, 4
  %20 = and i32 %11, 3
  %n.mod.vf = zext i32 %20 to i64
  %n.vec = sub nsw i64 %wide.trip.count56, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i32 %20, 0
  br label %.preheader10

.preheader10:                                     ; preds = %._crit_edge23, %.preheader10.lr.ph
  %indvars.iv62 = phi i64 [ 0, %.preheader10.lr.ph ], [ %indvars.iv.next63, %._crit_edge23 ]
  br i1 %9, label %.lr.ph, label %.preheader10..preheader9_crit_edge

.preheader10..preheader9_crit_edge:               ; preds = %.preheader10
  %pgocount = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 11)
  %21 = add i64 %pgocount, 1
  store i64 %21, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 11)
  br label %.preheader9

.lr.ph:                                           ; preds = %.preheader10
  %pgocount1 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 28)
  %22 = add i64 %pgocount1, 1
  store i64 %22, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 28)
  %23 = getelementptr inbounds double, double* %6, i64 %indvars.iv62
  %24 = bitcast double* %23 to i64*
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader..prol.preheader_crit_edge, %.prol.preheader.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader..prol.preheader_crit_edge ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader..prol.preheader_crit_edge ], [ %xtraiter, %.prol.preheader.preheader ]
  %25 = load i64, i64* %24, align 8
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.prol
  %27 = bitcast double* %26 to i64*
  store i64 %25, i64* %27, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader..prol.preheader_crit_edge, !llvm.loop !3

.prol.preheader..prol.preheader_crit_edge:        ; preds = %.prol.preheader
  %pgocount2 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 6)
  %28 = add i64 %pgocount2, 1
  store i64 %28, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 6)
  br label %.prol.preheader

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  %pgocount3 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 32)
  %29 = add i64 %pgocount3, 1
  store i64 %29, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 32)
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  br i1 %12, label %.preheader9, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.preheader9.loopexit:                             ; preds = %.lr.ph.new
  %pgocount4 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 33)
  %30 = add i64 %pgocount4, 1
  store i64 %30, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 33)
  br label %.preheader9

.preheader9:                                      ; preds = %.preheader10..preheader9_crit_edge, %.preheader9.loopexit, %.prol.loopexit
  br i1 %brmerge, label %.preheader8, label %.preheader6.us.preheader

.preheader6.us.preheader:                         ; preds = %.preheader9
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %._crit_edge.us, %.preheader6.us.preheader
  %indvar = phi i64 [ %indvar.next, %._crit_edge.us ], [ 0, %.preheader6.us.preheader ]
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %._crit_edge.us ], [ 1, %.preheader6.us.preheader ]
  %31 = add i64 %indvar, 1
  %scevgep150 = getelementptr [1200 x double], [1200 x double]* %4, i64 %31, i64 2
  %scevgep156 = getelementptr [1200 x double], [1200 x double]* %5, i64 %31, i64 2
  %32 = add nsw i64 %indvars.iv37, -1
  br i1 %lcmp.mod35, label %.prol.loopexit33, label %.prol.preheader32

.prol.preheader32:                                ; preds = %.preheader6.us
  %pgocount5 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 15)
  %33 = add i64 %pgocount5, 1
  store i64 %33, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 15)
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 0
  %35 = load double, double* %34, align 8
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 0
  %37 = load double, double* %36, align 8
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %32, i64 0
  %39 = load double, double* %38, align 8
  %40 = fsub double %37, %39
  %41 = fmul double %40, 5.000000e-01
  %42 = fsub double %35, %41
  store double %42, double* %34, align 8
  br label %.prol.loopexit33

.prol.loopexit33:                                 ; preds = %.prol.preheader32, %.preheader6.us
  %indvars.iv29.unr.ph = phi i64 [ 1, %.prol.preheader32 ], [ 0, %.preheader6.us ]
  br i1 %13, label %.prol.loopexit33.._crit_edge.us_crit_edge, label %.preheader6.us.new.preheader

.prol.loopexit33.._crit_edge.us_crit_edge:        ; preds = %.prol.loopexit33
  %pgocount6 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 9)
  %43 = add i64 %pgocount6, 1
  store i64 %43, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 9)
  br label %._crit_edge.us

.preheader6.us.new.preheader:                     ; preds = %.prol.loopexit33
  %pgocount7 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 13)
  %44 = add i64 %pgocount7, 1
  store i64 %44, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 13)
  %45 = sub nsw i64 %18, %indvars.iv29.unr.ph
  %46 = lshr i64 %45, 1
  %47 = add nuw i64 %46, 1
  %min.iters.check141 = icmp ult i64 %47, 2
  br i1 %min.iters.check141, label %.preheader6.us.new.preheader185, label %min.iters.checked142

min.iters.checked142:                             ; preds = %.preheader6.us.new.preheader
  %pgocount8 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 20)
  %48 = add i64 %pgocount8, 1
  store i64 %48, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 20)
  %n.mod.vf143 = and i64 %47, 1
  %n.vec144 = sub i64 %47, %n.mod.vf143
  %cmp.zero145 = icmp eq i64 %n.vec144, 0
  br i1 %cmp.zero145, label %.preheader6.us.new.preheader185, label %vector.memcheck163

vector.memcheck163:                               ; preds = %min.iters.checked142
  %pgocount9 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 23)
  %49 = add i64 %pgocount9, 1
  store i64 %49, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 23)
  %scevgep148 = getelementptr [1200 x double], [1200 x double]* %4, i64 %31, i64 %indvars.iv29.unr.ph
  %50 = sub nsw i64 %19, %indvars.iv29.unr.ph
  %51 = and i64 %50, -2
  %52 = or i64 %indvars.iv29.unr.ph, %51
  %scevgep151 = getelementptr double, double* %scevgep150, i64 %52
  %scevgep154 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvar, i64 %indvars.iv29.unr.ph
  %scevgep157 = getelementptr double, double* %scevgep156, i64 %52
  %bound0159 = icmp ult double* %scevgep148, %scevgep157
  %bound1160 = icmp ult double* %scevgep154, %scevgep151
  %memcheck.conflict162 = and i1 %bound0159, %bound1160
  %53 = or i64 %indvars.iv29.unr.ph, 2
  %54 = shl nuw i64 %46, 1
  %55 = add i64 %53, %54
  %56 = shl nuw nsw i64 %n.mod.vf143, 1
  %ind.end168 = sub i64 %55, %56
  br i1 %memcheck.conflict162, label %.preheader6.us.new.preheader185, label %vector.body138.preheader

vector.body138.preheader:                         ; preds = %vector.memcheck163
  br label %vector.body138

vector.body138:                                   ; preds = %vector.body138.vector.body138_crit_edge, %vector.body138.preheader
  %index165 = phi i64 [ %index.next166, %vector.body138.vector.body138_crit_edge ], [ 0, %vector.body138.preheader ]
  %57 = shl i64 %index165, 1
  %offset.idx170 = or i64 %indvars.iv29.unr.ph, %57
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %offset.idx170
  %59 = bitcast double* %58 to <4 x double>*
  %wide.vec174 = load <4 x double>, <4 x double>* %59, align 8, !alias.scope !4, !noalias !7
  %strided.vec175 = shufflevector <4 x double> %wide.vec174, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec176 = shufflevector <4 x double> %wide.vec174, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 %offset.idx170
  %61 = bitcast double* %60 to <4 x double>*
  %wide.vec177 = load <4 x double>, <4 x double>* %61, align 8, !alias.scope !7
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %32, i64 %offset.idx170
  %63 = bitcast double* %62 to <4 x double>*
  %wide.vec180 = load <4 x double>, <4 x double>* %63, align 8, !alias.scope !7
  %64 = fsub <4 x double> %wide.vec177, %wide.vec180
  %65 = shufflevector <4 x double> %64, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %66 = fmul <2 x double> %65, <double 5.000000e-01, double 5.000000e-01>
  %67 = fsub <2 x double> %strided.vec175, %66
  %68 = add nuw nsw i64 %offset.idx170, 1
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %68
  %70 = fsub <4 x double> %wide.vec177, %wide.vec180
  %71 = shufflevector <4 x double> %70, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %72 = fmul <2 x double> %71, <double 5.000000e-01, double 5.000000e-01>
  %73 = fsub <2 x double> %strided.vec176, %72
  %74 = getelementptr double, double* %69, i64 -1
  %75 = bitcast double* %74 to <4 x double>*
  %interleaved.vec183 = shufflevector <2 x double> %67, <2 x double> %73, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec183, <4 x double>* %75, align 8, !alias.scope !4, !noalias !7
  %index.next166 = add i64 %index165, 2
  %76 = icmp eq i64 %index.next166, %n.vec144
  br i1 %76, label %middle.block139, label %vector.body138.vector.body138_crit_edge, !llvm.loop !9

vector.body138.vector.body138_crit_edge:          ; preds = %vector.body138
  %pgocount10 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 4)
  %77 = add i64 %pgocount10, 1
  store i64 %77, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 4)
  br label %vector.body138

middle.block139:                                  ; preds = %vector.body138
  %pgocount11 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 26)
  %78 = add i64 %pgocount11, 1
  store i64 %78, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 26)
  %cmp.n169 = icmp eq i64 %n.mod.vf143, 0
  br i1 %cmp.n169, label %._crit_edge.us, label %.preheader6.us.new.preheader185

.preheader6.us.new.preheader185:                  ; preds = %middle.block139, %vector.memcheck163, %min.iters.checked142, %.preheader6.us.new.preheader
  %indvars.iv29.ph = phi i64 [ %indvars.iv29.unr.ph, %vector.memcheck163 ], [ %indvars.iv29.unr.ph, %min.iters.checked142 ], [ %indvars.iv29.unr.ph, %.preheader6.us.new.preheader ], [ %ind.end168, %middle.block139 ]
  br label %.preheader6.us.new

.preheader6.us.new:                               ; preds = %.preheader6.us.new..preheader6.us.new_crit_edge, %.preheader6.us.new.preheader185
  %indvars.iv29 = phi i64 [ %indvars.iv.next30.1, %.preheader6.us.new..preheader6.us.new_crit_edge ], [ %indvars.iv29.ph, %.preheader6.us.new.preheader185 ]
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv29
  %80 = load double, double* %79, align 8
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv29
  %82 = load double, double* %81, align 8
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %32, i64 %indvars.iv29
  %84 = load double, double* %83, align 8
  %85 = fsub double %82, %84
  %86 = fmul double %85, 5.000000e-01
  %87 = fsub double %80, %86
  store double %87, double* %79, align 8
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv.next30
  %89 = load double, double* %88, align 8
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv.next30
  %91 = load double, double* %90, align 8
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %32, i64 %indvars.iv.next30
  %93 = load double, double* %92, align 8
  %94 = fsub double %91, %93
  %95 = fmul double %94, 5.000000e-01
  %96 = fsub double %89, %95
  store double %96, double* %88, align 8
  %indvars.iv.next30.1 = add nsw i64 %indvars.iv29, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next30.1, %wide.trip.count31.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader6.us.new..preheader6.us.new_crit_edge, !llvm.loop !12

.preheader6.us.new..preheader6.us.new_crit_edge:  ; preds = %.preheader6.us.new
  %pgocount12 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 1)
  %97 = add i64 %pgocount12, 1
  store i64 %97, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 1)
  br label %.preheader6.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader6.us.new
  %pgocount13 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 14)
  %98 = add i64 %pgocount13, 1
  store i64 %98, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 14)
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.prol.loopexit33.._crit_edge.us_crit_edge, %._crit_edge.us.loopexit, %middle.block139
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond = icmp eq i64 %indvars.iv.next38, %wide.trip.count39
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond, label %.preheader8.loopexit, label %.preheader6.us

.lr.ph.new:                                       ; preds = %.lr.ph.new..lr.ph.new_crit_edge, %.lr.ph.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.7, %.lr.ph.new..lr.ph.new_crit_edge ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %99 = load i64, i64* %24, align 8
  %100 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv
  %101 = bitcast double* %100 to i64*
  store i64 %99, i64* %101, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %102 = load i64, i64* %24, align 8
  %103 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next
  %104 = bitcast double* %103 to i64*
  store i64 %102, i64* %104, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %105 = load i64, i64* %24, align 8
  %106 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.1
  %107 = bitcast double* %106 to i64*
  store i64 %105, i64* %107, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %108 = load i64, i64* %24, align 8
  %109 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.2
  %110 = bitcast double* %109 to i64*
  store i64 %108, i64* %110, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %111 = load i64, i64* %24, align 8
  %112 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.3
  %113 = bitcast double* %112 to i64*
  store i64 %111, i64* %113, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %114 = load i64, i64* %24, align 8
  %115 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.4
  %116 = bitcast double* %115 to i64*
  store i64 %114, i64* %116, align 8
  %indvars.iv.next.5 = add nsw i64 %indvars.iv, 6
  %117 = load i64, i64* %24, align 8
  %118 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.5
  %119 = bitcast double* %118 to i64*
  store i64 %117, i64* %119, align 8
  %indvars.iv.next.6 = add nsw i64 %indvars.iv, 7
  %120 = load i64, i64* %24, align 8
  %121 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.6
  %122 = bitcast double* %121 to i64*
  store i64 %120, i64* %122, align 8
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, %wide.trip.count.7
  br i1 %exitcond.7, label %.preheader9.loopexit, label %.lr.ph.new..lr.ph.new_crit_edge

.lr.ph.new..lr.ph.new_crit_edge:                  ; preds = %.lr.ph.new
  %pgocount14 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 7)
  %123 = add i64 %pgocount14, 1
  store i64 %123, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 7)
  br label %.lr.ph.new

.preheader8.loopexit:                             ; preds = %._crit_edge.us
  %pgocount15 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 29)
  %124 = add i64 %pgocount15, 1
  store i64 %124, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 29)
  br label %.preheader8

.preheader8:                                      ; preds = %.preheader8.loopexit, %.preheader9
  br i1 %brmerge69, label %.preheader7, label %.preheader5.us.preheader

.preheader5.us.preheader:                         ; preds = %.preheader8
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %._crit_edge17.us, %.preheader5.us.preheader
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %._crit_edge17.us ], [ 0, %.preheader5.us.preheader ]
  %scevgep109 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv49, i64 2
  %scevgep112 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv49, i64 -1
  %scevgep115 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv49, i64 2
  br i1 %lcmp.mod48, label %.prol.loopexit46, label %.prol.preheader45

.prol.preheader45:                                ; preds = %.preheader5.us
  %pgocount16 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 16)
  %125 = add i64 %pgocount16, 1
  store i64 %125, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 16)
  %126 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv49, i64 1
  %127 = load double, double* %126, align 8
  %128 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv49, i64 1
  %129 = load double, double* %128, align 8
  %130 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv49, i64 0
  %131 = load double, double* %130, align 8
  %132 = fsub double %129, %131
  %133 = fmul double %132, 5.000000e-01
  %134 = fsub double %127, %133
  store double %134, double* %126, align 8
  br label %.prol.loopexit46

.prol.loopexit46:                                 ; preds = %.prol.preheader45, %.preheader5.us
  %indvars.iv41.unr.ph = phi i64 [ 2, %.prol.preheader45 ], [ 1, %.preheader5.us ]
  br i1 %14, label %.prol.loopexit46.._crit_edge17.us_crit_edge, label %.preheader5.us.new.preheader

.prol.loopexit46.._crit_edge17.us_crit_edge:      ; preds = %.prol.loopexit46
  %pgocount17 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 8)
  %135 = add i64 %pgocount17, 1
  store i64 %135, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 8)
  br label %._crit_edge17.us

.preheader5.us.new.preheader:                     ; preds = %.prol.loopexit46
  %pgocount18 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 17)
  %136 = add i64 %pgocount18, 1
  store i64 %136, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 17)
  %137 = sub nsw i64 %16, %indvars.iv41.unr.ph
  %138 = lshr i64 %137, 1
  %139 = add nuw i64 %138, 1
  %min.iters.check100 = icmp ult i64 %139, 2
  br i1 %min.iters.check100, label %.preheader5.us.new.preheader184, label %min.iters.checked101

min.iters.checked101:                             ; preds = %.preheader5.us.new.preheader
  %pgocount19 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 22)
  %140 = add i64 %pgocount19, 1
  store i64 %140, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 22)
  %n.mod.vf102 = and i64 %139, 1
  %n.vec103 = sub i64 %139, %n.mod.vf102
  %cmp.zero104 = icmp eq i64 %n.vec103, 0
  br i1 %cmp.zero104, label %.preheader5.us.new.preheader184, label %vector.memcheck122

vector.memcheck122:                               ; preds = %min.iters.checked101
  %pgocount20 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 24)
  %141 = add i64 %pgocount20, 1
  store i64 %141, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 24)
  %scevgep107 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv49, i64 %indvars.iv41.unr.ph
  %142 = sub nsw i64 %17, %indvars.iv41.unr.ph
  %143 = and i64 %142, -2
  %144 = add nsw i64 %indvars.iv41.unr.ph, %143
  %scevgep110 = getelementptr double, double* %scevgep109, i64 %144
  %scevgep113 = getelementptr double, double* %scevgep112, i64 %indvars.iv41.unr.ph
  %scevgep116 = getelementptr double, double* %scevgep115, i64 %144
  %bound0118 = icmp ult double* %scevgep107, %scevgep116
  %bound1119 = icmp ult double* %scevgep113, %scevgep110
  %memcheck.conflict121 = and i1 %bound0118, %bound1119
  %145 = add nuw nsw i64 %indvars.iv41.unr.ph, 2
  %146 = shl nuw i64 %138, 1
  %147 = add i64 %145, %146
  %148 = shl nuw nsw i64 %n.mod.vf102, 1
  %ind.end = sub i64 %147, %148
  br i1 %memcheck.conflict121, label %.preheader5.us.new.preheader184, label %vector.body97.preheader

vector.body97.preheader:                          ; preds = %vector.memcheck122
  br label %vector.body97

vector.body97:                                    ; preds = %vector.body97.vector.body97_crit_edge, %vector.body97.preheader
  %index124 = phi i64 [ %index.next125, %vector.body97.vector.body97_crit_edge ], [ 0, %vector.body97.preheader ]
  %149 = shl i64 %index124, 1
  %offset.idx = or i64 %indvars.iv41.unr.ph, %149
  %150 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv49, i64 %offset.idx
  %151 = bitcast double* %150 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %151, align 8, !alias.scope !13, !noalias !16
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec131 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %152 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv49, i64 %offset.idx
  %153 = getelementptr double, double* %152, i64 -1
  %154 = bitcast double* %153 to <4 x double>*
  %wide.vec132 = load <4 x double>, <4 x double>* %154, align 8, !alias.scope !16
  %strided.vec133 = shufflevector <4 x double> %wide.vec132, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec134 = shufflevector <4 x double> %wide.vec132, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %155 = fsub <2 x double> %strided.vec134, %strided.vec133
  %156 = fmul <2 x double> %155, <double 5.000000e-01, double 5.000000e-01>
  %157 = fsub <2 x double> %strided.vec, %156
  %158 = add nuw nsw i64 %offset.idx, 1
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv49, i64 %158
  %160 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv49, i64 %158
  %161 = getelementptr double, double* %160, i64 -1
  %162 = bitcast double* %161 to <4 x double>*
  %wide.vec135 = load <4 x double>, <4 x double>* %162, align 8, !alias.scope !16
  %strided.vec136 = shufflevector <4 x double> %wide.vec135, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec137 = shufflevector <4 x double> %wide.vec135, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %163 = fsub <2 x double> %strided.vec137, %strided.vec136
  %164 = fmul <2 x double> %163, <double 5.000000e-01, double 5.000000e-01>
  %165 = fsub <2 x double> %strided.vec131, %164
  %166 = getelementptr double, double* %159, i64 -1
  %167 = bitcast double* %166 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %157, <2 x double> %165, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %167, align 8, !alias.scope !13, !noalias !16
  %index.next125 = add i64 %index124, 2
  %168 = icmp eq i64 %index.next125, %n.vec103
  br i1 %168, label %middle.block98, label %vector.body97.vector.body97_crit_edge, !llvm.loop !18

vector.body97.vector.body97_crit_edge:            ; preds = %vector.body97
  %pgocount21 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 5)
  %169 = add i64 %pgocount21, 1
  store i64 %169, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 5)
  br label %vector.body97

middle.block98:                                   ; preds = %vector.body97
  %pgocount22 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 27)
  %170 = add i64 %pgocount22, 1
  store i64 %170, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 27)
  %cmp.n127 = icmp eq i64 %n.mod.vf102, 0
  br i1 %cmp.n127, label %._crit_edge17.us, label %.preheader5.us.new.preheader184

.preheader5.us.new.preheader184:                  ; preds = %middle.block98, %vector.memcheck122, %min.iters.checked101, %.preheader5.us.new.preheader
  %indvars.iv41.ph = phi i64 [ %indvars.iv41.unr.ph, %vector.memcheck122 ], [ %indvars.iv41.unr.ph, %min.iters.checked101 ], [ %indvars.iv41.unr.ph, %.preheader5.us.new.preheader ], [ %ind.end, %middle.block98 ]
  br label %.preheader5.us.new

.preheader5.us.new:                               ; preds = %.preheader5.us.new..preheader5.us.new_crit_edge, %.preheader5.us.new.preheader184
  %indvars.iv41 = phi i64 [ %indvars.iv.next42.1, %.preheader5.us.new..preheader5.us.new_crit_edge ], [ %indvars.iv41.ph, %.preheader5.us.new.preheader184 ]
  %171 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv49, i64 %indvars.iv41
  %172 = load double, double* %171, align 8
  %173 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv49, i64 %indvars.iv41
  %174 = load double, double* %173, align 8
  %175 = add nsw i64 %indvars.iv41, -1
  %176 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv49, i64 %175
  %177 = load double, double* %176, align 8
  %178 = fsub double %174, %177
  %179 = fmul double %178, 5.000000e-01
  %180 = fsub double %172, %179
  store double %180, double* %171, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %181 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv49, i64 %indvars.iv.next42
  %182 = load double, double* %181, align 8
  %183 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv49, i64 %indvars.iv.next42
  %184 = load double, double* %183, align 8
  %185 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv49, i64 %indvars.iv41
  %186 = load double, double* %185, align 8
  %187 = fsub double %184, %186
  %188 = fmul double %187, 5.000000e-01
  %189 = fsub double %182, %188
  store double %189, double* %181, align 8
  %indvars.iv.next42.1 = add nsw i64 %indvars.iv41, 2
  %exitcond44.1 = icmp eq i64 %indvars.iv.next42.1, %wide.trip.count43.1
  br i1 %exitcond44.1, label %._crit_edge17.us.loopexit, label %.preheader5.us.new..preheader5.us.new_crit_edge, !llvm.loop !19

.preheader5.us.new..preheader5.us.new_crit_edge:  ; preds = %.preheader5.us.new
  %pgocount23 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 2)
  %190 = add i64 %pgocount23, 1
  store i64 %190, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 2)
  br label %.preheader5.us.new

._crit_edge17.us.loopexit:                        ; preds = %.preheader5.us.new
  %pgocount24 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 19)
  %191 = add i64 %pgocount24, 1
  store i64 %191, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 19)
  br label %._crit_edge17.us

._crit_edge17.us:                                 ; preds = %.prol.loopexit46.._crit_edge17.us_crit_edge, %._crit_edge17.us.loopexit, %middle.block98
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next50, %wide.trip.count51
  br i1 %exitcond52, label %.preheader7.loopexit, label %.preheader5.us

.preheader7.loopexit:                             ; preds = %._crit_edge17.us
  %pgocount25 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 30)
  %192 = add i64 %pgocount25, 1
  store i64 %192, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 30)
  br label %.preheader7

.preheader7:                                      ; preds = %.preheader7.loopexit, %.preheader8
  br i1 %brmerge72, label %._crit_edge23, label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %.preheader7
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge21.us, %.preheader.us.preheader
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %._crit_edge21.us ], [ 0, %.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv58, i64 0
  %scevgep74 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv58, i64 %wide.trip.count56
  %scevgep76 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv58, i64 0
  %scevgep78 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv58, i64 %15
  %scevgep80 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv58, i64 0
  %193 = add i64 %indvars.iv58, 1
  %scevgep82 = getelementptr [1200 x double], [1200 x double]* %4, i64 %193, i64 %wide.trip.count56
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  %pgocount26 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 18)
  %194 = add i64 %pgocount26, 1
  store i64 %194, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 18)
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %pgocount27 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 21)
  %195 = add i64 %pgocount27, 1
  store i64 %195, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 21)
  %bound0 = icmp ult double* %scevgep, %scevgep78
  %bound1 = icmp ult double* %scevgep76, %scevgep74
  %found.conflict = and i1 %bound0, %bound1
  %bound084 = icmp ult double* %scevgep, %scevgep82
  %bound185 = icmp ult double* %scevgep80, %scevgep74
  %found.conflict86 = and i1 %bound084, %bound185
  %conflict.rdx = or i1 %found.conflict, %found.conflict86
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %196 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv58, i64 %index
  %197 = bitcast double* %196 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %197, align 8, !alias.scope !20, !noalias !23
  %198 = getelementptr double, double* %196, i64 2
  %199 = bitcast double* %198 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %199, align 8, !alias.scope !20, !noalias !23
  %200 = or i64 %index, 1
  %201 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv58, i64 %200
  %202 = bitcast double* %201 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %202, align 8, !alias.scope !26
  %203 = getelementptr double, double* %201, i64 2
  %204 = bitcast double* %203 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %204, align 8, !alias.scope !26
  %205 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv58, i64 %index
  %206 = bitcast double* %205 to <2 x double>*
  %wide.load91 = load <2 x double>, <2 x double>* %206, align 8, !alias.scope !26
  %207 = getelementptr double, double* %205, i64 2
  %208 = bitcast double* %207 to <2 x double>*
  %wide.load92 = load <2 x double>, <2 x double>* %208, align 8, !alias.scope !26
  %209 = fsub <2 x double> %wide.load89, %wide.load91
  %210 = fsub <2 x double> %wide.load90, %wide.load92
  %211 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next59, i64 %index
  %212 = bitcast double* %211 to <2 x double>*
  %wide.load93 = load <2 x double>, <2 x double>* %212, align 8, !alias.scope !27
  %213 = getelementptr double, double* %211, i64 2
  %214 = bitcast double* %213 to <2 x double>*
  %wide.load94 = load <2 x double>, <2 x double>* %214, align 8, !alias.scope !27
  %215 = fadd <2 x double> %209, %wide.load93
  %216 = fadd <2 x double> %210, %wide.load94
  %217 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv58, i64 %index
  %218 = bitcast double* %217 to <2 x double>*
  %wide.load95 = load <2 x double>, <2 x double>* %218, align 8, !alias.scope !27
  %219 = getelementptr double, double* %217, i64 2
  %220 = bitcast double* %219 to <2 x double>*
  %wide.load96 = load <2 x double>, <2 x double>* %220, align 8, !alias.scope !27
  %221 = fsub <2 x double> %215, %wide.load95
  %222 = fsub <2 x double> %216, %wide.load96
  %223 = fmul <2 x double> %221, <double 7.000000e-01, double 7.000000e-01>
  %224 = fmul <2 x double> %222, <double 7.000000e-01, double 7.000000e-01>
  %225 = fsub <2 x double> %wide.load, %223
  %226 = fsub <2 x double> %wide.load88, %224
  %227 = bitcast double* %196 to <2 x double>*
  store <2 x double> %225, <2 x double>* %227, align 8, !alias.scope !20, !noalias !23
  %228 = bitcast double* %198 to <2 x double>*
  store <2 x double> %226, <2 x double>* %228, align 8, !alias.scope !20, !noalias !23
  %index.next = add i64 %index, 4
  %229 = icmp eq i64 %index.next, %n.vec
  br i1 %229, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !28

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  %pgocount28 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 3)
  %230 = add i64 %pgocount28, 1
  store i64 %230, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 3)
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %pgocount29 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 25)
  %231 = add i64 %pgocount29, 1
  store i64 %231, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 25)
  br i1 %cmp.n, label %middle.block.._crit_edge21.us_crit_edge, label %scalar.ph.preheader

middle.block.._crit_edge21.us_crit_edge:          ; preds = %middle.block
  %pgocount30 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 10)
  %232 = add i64 %pgocount30, 1
  store i64 %232, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 10)
  br label %._crit_edge21.us

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us
  %indvars.iv54.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader.us ], [ %n.vec, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.scalar.ph_crit_edge, %scalar.ph.preheader
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %scalar.ph.scalar.ph_crit_edge ], [ %indvars.iv54.ph, %scalar.ph.preheader ]
  %233 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv58, i64 %indvars.iv54
  %234 = load double, double* %233, align 8
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %235 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv58, i64 %indvars.iv.next55
  %236 = load double, double* %235, align 8
  %237 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv58, i64 %indvars.iv54
  %238 = load double, double* %237, align 8
  %239 = fsub double %236, %238
  %240 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next59, i64 %indvars.iv54
  %241 = load double, double* %240, align 8
  %242 = fadd double %239, %241
  %243 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv58, i64 %indvars.iv54
  %244 = load double, double* %243, align 8
  %245 = fsub double %242, %244
  %246 = fmul double %245, 7.000000e-01
  %247 = fsub double %234, %246
  store double %247, double* %233, align 8
  %exitcond57 = icmp eq i64 %indvars.iv.next55, %wide.trip.count56
  br i1 %exitcond57, label %._crit_edge21.us.loopexit, label %scalar.ph.scalar.ph_crit_edge, !llvm.loop !29

scalar.ph.scalar.ph_crit_edge:                    ; preds = %scalar.ph
  %pgocount31 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 0)
  %248 = add i64 %pgocount31, 1
  store i64 %248, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 0)
  br label %scalar.ph

._crit_edge21.us.loopexit:                        ; preds = %scalar.ph
  %pgocount32 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 12)
  %249 = add i64 %pgocount32, 1
  store i64 %249, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 12)
  br label %._crit_edge21.us

._crit_edge21.us:                                 ; preds = %middle.block.._crit_edge21.us_crit_edge, %._crit_edge21.us.loopexit
  %exitcond61 = icmp eq i64 %indvars.iv.next59, %wide.trip.count60
  br i1 %exitcond61, label %._crit_edge23.loopexit, label %.preheader.us

._crit_edge23.loopexit:                           ; preds = %._crit_edge21.us
  %pgocount33 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 31)
  %250 = add i64 %pgocount33, 1
  store i64 %250, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 31)
  br label %._crit_edge23

._crit_edge23:                                    ; preds = %._crit_edge23.loopexit, %.preheader7
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next63, %wide.trip.count64
  br i1 %exitcond65, label %._crit_edge25.loopexit, label %.preheader10

._crit_edge25.loopexit:                           ; preds = %._crit_edge23
  %pgocount34 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 35)
  %251 = add i64 %pgocount34, 1
  store i64 %251, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 35)
  br label %._crit_edge25

._crit_edge25:                                    ; preds = %._crit_edge25.loopexit, %7
  %pgocount35 = load i64, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 34)
  %252 = add i64 %pgocount35, 1
  store i64 %252, i64* getelementptr inbounds ([36 x i64], [36 x i64]* @__profc_B.ll_kernel_fdtd_2d, i64 0, i64 34)
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %6) #5
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = icmp sgt i32 %0, 0
  %11 = icmp sgt i32 %1, 0
  %or.cond = and i1 %10, %11
  br i1 %or.cond, label %.preheader11.us.preheader, label %._crit_edge24

.preheader11.us.preheader:                        ; preds = %5
  %12 = sext i32 %0 to i64
  %wide.trip.count44 = zext i32 %1 to i64
  %wide.trip.count48 = zext i32 %0 to i64
  br label %.preheader11.us

.preheader11.us:                                  ; preds = %._crit_edge22.us, %.preheader11.us.preheader
  %indvars.iv46 = phi i64 [ 0, %.preheader11.us.preheader ], [ %indvars.iv.next47, %._crit_edge22.us ]
  %13 = mul nsw i64 %indvars.iv46, %12
  br label %14

; <label>:14:                                     ; preds = %23, %.preheader11.us
  %indvars.iv42 = phi i64 [ 0, %.preheader11.us ], [ %indvars.iv.next43, %23 ]
  %15 = add nsw i64 %indvars.iv42, %13
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 20
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %20, label %._crit_edge

._crit_edge:                                      ; preds = %14
  %pgocount = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %19 = add i64 %pgocount, 1
  store i64 %19, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  br label %23

; <label>:20:                                     ; preds = %14
  %pgocount3 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %21 = add i64 %pgocount3, 1
  store i64 %21, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc9.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %22) #5
  br label %23

; <label>:23:                                     ; preds = %._crit_edge, %20
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv46, i64 %indvars.iv42
  %26 = load double, double* %25, align 8
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %26) #5
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next43, %wide.trip.count44
  br i1 %exitcond45, label %._crit_edge22.us, label %14

._crit_edge22.us:                                 ; preds = %23
  %pgocount4 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_print_array, i64 0, i64 6)
  %28 = add i64 %pgocount4, 1
  store i64 %28, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_print_array, i64 0, i64 6)
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next47, %wide.trip.count48
  br i1 %exitcond49, label %._crit_edge24.loopexit, label %.preheader11.us

._crit_edge24.loopexit:                           ; preds = %._crit_edge22.us
  %pgocount5 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_print_array, i64 0, i64 10)
  %29 = add i64 %pgocount5, 1
  store i64 %29, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_print_array, i64 0, i64 10)
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge24.loopexit, %5
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %31 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %32) #5
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %35 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %34, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  %36 = icmp sgt i32 %0, 0
  %37 = icmp sgt i32 %1, 0
  %or.cond51 = and i1 %36, %37
  br i1 %or.cond51, label %.preheader10.us.preheader, label %._crit_edge19

.preheader10.us.preheader:                        ; preds = %._crit_edge24
  %38 = sext i32 %0 to i64
  %wide.trip.count35 = zext i32 %1 to i64
  %wide.trip.count39 = zext i32 %0 to i64
  br label %.preheader10.us

.preheader10.us:                                  ; preds = %._crit_edge17.us, %.preheader10.us.preheader
  %indvars.iv37 = phi i64 [ 0, %.preheader10.us.preheader ], [ %indvars.iv.next38, %._crit_edge17.us ]
  %39 = mul nsw i64 %indvars.iv37, %38
  br label %40

; <label>:40:                                     ; preds = %49, %.preheader10.us
  %indvars.iv33 = phi i64 [ 0, %.preheader10.us ], [ %indvars.iv.next34, %49 ]
  %41 = add nsw i64 %indvars.iv33, %39
  %42 = trunc i64 %41 to i32
  %43 = srem i32 %42, 20
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %46, label %._crit_edge1

._crit_edge1:                                     ; preds = %40
  %pgocount6 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %45 = add i64 %pgocount6, 1
  store i64 %45, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  br label %49

; <label>:46:                                     ; preds = %40
  %pgocount7 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_print_array, i64 0, i64 4)
  %47 = add i64 %pgocount7, 1
  store i64 %47, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_print_array, i64 0, i64 4)
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc6.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %48) #5
  br label %49

; <label>:49:                                     ; preds = %._crit_edge1, %46
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv37, i64 %indvars.iv33
  %52 = load double, double* %51, align 8
  %53 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %50, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %52) #5
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next34, %wide.trip.count35
  br i1 %exitcond36, label %._crit_edge17.us, label %40

._crit_edge17.us:                                 ; preds = %49
  %pgocount8 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_print_array, i64 0, i64 7)
  %54 = add i64 %pgocount8, 1
  store i64 %54, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_print_array, i64 0, i64 7)
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next38, %wide.trip.count39
  br i1 %exitcond40, label %._crit_edge19.loopexit, label %.preheader10.us

._crit_edge19.loopexit:                           ; preds = %._crit_edge17.us
  %pgocount9 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_print_array, i64 0, i64 11)
  %55 = add i64 %pgocount9, 1
  store i64 %55, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_print_array, i64 0, i64 11)
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit, %._crit_edge24
  %56 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %57 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %56, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  %58 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %59 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %58, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  %60 = icmp sgt i32 %0, 0
  %61 = icmp sgt i32 %1, 0
  %or.cond52 = and i1 %60, %61
  br i1 %or.cond52, label %.preheader.us.preheader, label %._crit_edge14

.preheader.us.preheader:                          ; preds = %._crit_edge19
  %62 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count30 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv28 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next29, %._crit_edge.us ]
  %63 = mul nsw i64 %indvars.iv28, %62
  br label %64

; <label>:64:                                     ; preds = %73, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %73 ]
  %65 = add nsw i64 %indvars.iv, %63
  %66 = trunc i64 %65 to i32
  %67 = srem i32 %66, 20
  %68 = icmp eq i32 %67, 0
  br i1 %68, label %70, label %._crit_edge2

._crit_edge2:                                     ; preds = %64
  %pgocount10 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %69 = add i64 %pgocount10, 1
  store i64 %69, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  br label %73

; <label>:70:                                     ; preds = %64
  %pgocount11 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_print_array, i64 0, i64 5)
  %71 = add i64 %pgocount11, 1
  store i64 %71, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_print_array, i64 0, i64 5)
  %72 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %72) #5
  br label %73

; <label>:73:                                     ; preds = %._crit_edge2, %70
  %74 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv28, i64 %indvars.iv
  %76 = load double, double* %75, align 8
  %77 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %74, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %76) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %64

._crit_edge.us:                                   ; preds = %73
  %pgocount12 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_print_array, i64 0, i64 8)
  %78 = add i64 %pgocount12, 1
  store i64 %78, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_print_array, i64 0, i64 8)
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next29, %wide.trip.count30
  br i1 %exitcond31, label %._crit_edge14.loopexit, label %.preheader.us

._crit_edge14.loopexit:                           ; preds = %._crit_edge.us
  %pgocount13 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_print_array, i64 0, i64 12)
  %79 = add i64 %pgocount13, 1
  store i64 %79, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_print_array, i64 0, i64 12)
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %._crit_edge19
  %pgocount14 = load i64, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_print_array, i64 0, i64 9)
  %80 = add i64 %pgocount14, 1
  store i64 %80, i64* getelementptr inbounds ([13 x i64], [13 x i64]* @__profc_B.ll_print_array, i64 0, i64 9)
  %81 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %82 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %81, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
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
!3 = distinct !{!3, !2}
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = distinct !{!12, !10, !11}
!13 = !{!14}
!14 = distinct !{!14, !15}
!15 = distinct !{!15, !"LVerDomain"}
!16 = !{!17}
!17 = distinct !{!17, !15}
!18 = distinct !{!18, !10, !11}
!19 = distinct !{!19, !10, !11}
!20 = !{!21}
!21 = distinct !{!21, !22}
!22 = distinct !{!22, !"LVerDomain"}
!23 = !{!24, !25}
!24 = distinct !{!24, !22}
!25 = distinct !{!25, !22}
!26 = !{!24}
!27 = !{!25}
!28 = distinct !{!28, !10, !11}
!29 = distinct !{!29, !10, !11}
