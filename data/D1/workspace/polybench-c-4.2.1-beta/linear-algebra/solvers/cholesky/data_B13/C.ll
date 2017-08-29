; ModuleID = 'B.ll'
source_filename = "cholesky.c"
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
@__profn_B.ll_kernel_cholesky = private constant [20 x i8] c"B.ll:kernel_cholesky"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 32414643582, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [24 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 300420118271, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 24, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_cholesky = private global [15 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_cholesky = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4245200372997964226, i64 184785218454, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i32 0, i32 0), i8* null, i8* null, i32 15, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 63976198547, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [60 x i8] c":\00main\01B.ll:init_array\01B.ll:kernel_cholesky\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_cholesky to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([60 x i8], [60 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_cholesky(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
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
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader14.lr.ph, label %._crit_edge42.thread

._crit_edge42.thread:                             ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 17)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 17)
  %5 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %._crit_edge17

.preheader14.lr.ph:                               ; preds = %2
  %pgocount1 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 15)
  %6 = add i64 %pgocount1, 1
  store i64 %6, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 15)
  %7 = sitofp i32 %0 to double
  %8 = add i32 %0, -2
  %9 = zext i32 %8 to i64
  %10 = sext i32 %0 to i64
  %wide.trip.count93 = zext i32 %0 to i64
  br label %.lr.ph36

.lr.ph36:                                         ; preds = %._crit_edge40, %.preheader14.lr.ph
  %indvars.iv91 = phi i64 [ 0, %.preheader14.lr.ph ], [ %indvars.iv.next92, %._crit_edge40 ]
  %indvars.iv89 = phi i64 [ 1, %.preheader14.lr.ph ], [ %indvars.iv.next90, %._crit_edge40 ]
  %11 = mul nuw nsw i64 %indvars.iv91, 2001
  %12 = add nuw nsw i64 %11, 1
  %scevgep87 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %12
  %scevgep8788 = bitcast double* %scevgep87 to i8*
  %13 = sub i64 %9, %indvars.iv91
  %14 = shl i64 %13, 3
  %15 = and i64 %14, 34359738360
  %16 = add nuw nsw i64 %15, 8
  br label %19

.preheader13:                                     ; preds = %19
  %pgocount2 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 10)
  %17 = add i64 %pgocount2, 1
  store i64 %17, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 10)
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %18 = icmp slt i64 %indvars.iv.next92, %10
  br i1 %18, label %._crit_edge40.loopexit, label %._crit_edge40

; <label>:19:                                     ; preds = %._crit_edge, %.lr.ph36
  %indvars.iv75 = phi i64 [ %indvars.iv.next76, %._crit_edge ], [ 0, %.lr.ph36 ]
  %20 = sub nsw i64 0, %indvars.iv75
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, %0
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, %7
  %25 = fadd double %24, 1.000000e+00
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv91, i64 %indvars.iv75
  store double %25, double* %26, align 8
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond80 = icmp eq i64 %indvars.iv.next76, %indvars.iv89
  br i1 %exitcond80, label %.preheader13, label %._crit_edge

._crit_edge:                                      ; preds = %19
  %pgocount3 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %27 = add i64 %pgocount3, 1
  store i64 %27, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  br label %19

._crit_edge40.loopexit:                           ; preds = %.preheader13
  %pgocount4 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 12)
  %28 = add i64 %pgocount4, 1
  store i64 %28, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 12)
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep8788, i8 0, i64 %16, i32 8, i1 false)
  br label %._crit_edge40

._crit_edge40:                                    ; preds = %._crit_edge40.loopexit, %.preheader13
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv91, i64 %indvars.iv91
  store double 1.000000e+00, double* %29, align 8
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %exitcond94 = icmp eq i64 %indvars.iv.next92, %wide.trip.count93
  br i1 %exitcond94, label %._crit_edge42, label %.lr.ph36

._crit_edge42:                                    ; preds = %._crit_edge40
  %30 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %31 = bitcast i8* %30 to [2000 x [2000 x double]]*
  %32 = icmp sgt i32 %0, 0
  br i1 %32, label %.preheader12.us.preheader, label %._crit_edge17

.preheader12.us.preheader:                        ; preds = %._crit_edge42
  %pgocount5 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 16)
  %33 = add i64 %pgocount5, 1
  store i64 %33, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 16)
  %34 = add i32 %0, -1
  %35 = zext i32 %34 to i64
  %36 = shl nuw nsw i64 %35, 3
  %37 = add nuw nsw i64 %36, 8
  %xtraiter72 = and i32 %0, 3
  %lcmp.mod73 = icmp eq i32 %xtraiter72, 0
  br i1 %lcmp.mod73, label %.preheader12.us.prol.loopexit, label %._crit_edge33.us.prol.preheader

._crit_edge33.us.prol.preheader:                  ; preds = %.preheader12.us.preheader
  br label %._crit_edge33.us.prol

._crit_edge33.us.prol:                            ; preds = %._crit_edge33.us.prol.._crit_edge33.us.prol_crit_edge, %._crit_edge33.us.prol.preheader
  %indvars.iv68.prol = phi i64 [ %indvars.iv.next69.prol, %._crit_edge33.us.prol.._crit_edge33.us.prol_crit_edge ], [ 0, %._crit_edge33.us.prol.preheader ]
  %prol.iter74 = phi i32 [ %prol.iter74.sub, %._crit_edge33.us.prol.._crit_edge33.us.prol_crit_edge ], [ %xtraiter72, %._crit_edge33.us.prol.preheader ]
  %38 = mul nuw nsw i64 %indvars.iv68.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %30, i64 %38
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %37, i32 8, i1 false)
  %indvars.iv.next69.prol = add nuw nsw i64 %indvars.iv68.prol, 1
  %prol.iter74.sub = add i32 %prol.iter74, -1
  %prol.iter74.cmp = icmp eq i32 %prol.iter74.sub, 0
  br i1 %prol.iter74.cmp, label %.preheader12.us.prol.loopexit.loopexit, label %._crit_edge33.us.prol.._crit_edge33.us.prol_crit_edge, !llvm.loop !1

._crit_edge33.us.prol.._crit_edge33.us.prol_crit_edge: ; preds = %._crit_edge33.us.prol
  %pgocount6 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %39 = add i64 %pgocount6, 1
  store i64 %39, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  br label %._crit_edge33.us.prol

.preheader12.us.prol.loopexit.loopexit:           ; preds = %._crit_edge33.us.prol
  %pgocount7 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 19)
  %40 = add i64 %pgocount7, 1
  store i64 %40, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 19)
  br label %.preheader12.us.prol.loopexit

.preheader12.us.prol.loopexit:                    ; preds = %.preheader12.us.prol.loopexit.loopexit, %.preheader12.us.preheader
  %indvars.iv68.unr = phi i64 [ 0, %.preheader12.us.preheader ], [ %indvars.iv.next69.prol, %.preheader12.us.prol.loopexit.loopexit ]
  %41 = icmp ult i32 %34, 3
  br i1 %41, label %.preheader10.lr.ph, label %._crit_edge33.us.3.preheader

._crit_edge33.us.3.preheader:                     ; preds = %.preheader12.us.prol.loopexit
  %pgocount8 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 20)
  %42 = add i64 %pgocount8, 1
  store i64 %42, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 20)
  %wide.trip.count70.3 = zext i32 %0 to i64
  %43 = add nsw i64 %wide.trip.count70.3, -4
  %44 = sub i64 %43, %indvars.iv68.unr
  %45 = lshr i64 %44, 2
  %46 = and i64 %45, 1
  %lcmp.mod100 = icmp eq i64 %46, 0
  br i1 %lcmp.mod100, label %._crit_edge33.us.3.prol.preheader, label %._crit_edge33.us.3.prol.loopexit

._crit_edge33.us.3.prol.preheader:                ; preds = %._crit_edge33.us.3.preheader
  %pgocount9 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 23)
  %47 = add i64 %pgocount9, 1
  store i64 %47, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 23)
  br label %._crit_edge33.us.3.prol

._crit_edge33.us.3.prol:                          ; preds = %._crit_edge33.us.3.prol.preheader
  %48 = mul nuw nsw i64 %indvars.iv68.unr, 16000
  %scevgep.prol102 = getelementptr i8, i8* %30, i64 %48
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol102, i8 0, i64 %37, i32 8, i1 false)
  %49 = mul i64 %indvars.iv68.unr, 16000
  %50 = add i64 %49, 16000
  %scevgep.1.prol = getelementptr i8, i8* %30, i64 %50
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.prol, i8 0, i64 %37, i32 8, i1 false)
  %51 = mul i64 %indvars.iv68.unr, 16000
  %52 = add i64 %51, 32000
  %scevgep.2.prol = getelementptr i8, i8* %30, i64 %52
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.prol, i8 0, i64 %37, i32 8, i1 false)
  %53 = mul i64 %indvars.iv68.unr, 16000
  %54 = add i64 %53, 48000
  %scevgep.3.prol = getelementptr i8, i8* %30, i64 %54
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.prol, i8 0, i64 %37, i32 8, i1 false)
  %indvars.iv.next69.3.prol = add nsw i64 %indvars.iv68.unr, 4
  br label %._crit_edge33.us.3.prol.loopexit

._crit_edge33.us.3.prol.loopexit:                 ; preds = %._crit_edge33.us.3.prol, %._crit_edge33.us.3.preheader
  %indvars.iv68.unr103 = phi i64 [ %indvars.iv68.unr, %._crit_edge33.us.3.preheader ], [ %indvars.iv.next69.3.prol, %._crit_edge33.us.3.prol ]
  %55 = icmp eq i64 %45, 0
  br i1 %55, label %.preheader11, label %._crit_edge33.us.3.preheader.new

._crit_edge33.us.3.preheader.new:                 ; preds = %._crit_edge33.us.3.prol.loopexit
  br label %._crit_edge33.us.3

.preheader11.unr-lcssa:                           ; preds = %._crit_edge33.us.3
  %pgocount10 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 22)
  %56 = add i64 %pgocount10, 1
  store i64 %56, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 22)
  br label %.preheader11

.preheader11:                                     ; preds = %.preheader11.unr-lcssa, %._crit_edge33.us.3.prol.loopexit
  %57 = icmp sgt i32 %0, 0
  br i1 %57, label %.preheader10.lr.ph, label %._crit_edge17

.preheader10.lr.ph:                               ; preds = %.preheader11, %.preheader12.us.prol.loopexit
  %xtraiter54 = and i32 %0, 1
  %lcmp.mod55 = icmp eq i32 %xtraiter54, 0
  %58 = icmp eq i32 %0, 1
  %wide.trip.count58 = zext i32 %0 to i64
  %wide.trip.count50.1 = zext i32 %0 to i64
  %wide.trip.count62 = zext i32 %0 to i64
  br label %.preheader9.us.us.preheader

.preheader9.us.us.preheader:                      ; preds = %._crit_edge22.us, %.preheader10.lr.ph
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %._crit_edge22.us ], [ 0, %.preheader10.lr.ph ]
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv60
  br label %.preheader9.us.us

._crit_edge22.us:                                 ; preds = %._crit_edge20.us.us
  %pgocount11 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 11)
  %60 = add i64 %pgocount11, 1
  store i64 %60, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 11)
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond63 = icmp eq i64 %indvars.iv.next61, %wide.trip.count62
  br i1 %exitcond63, label %.preheader8, label %.preheader9.us.us.preheader

.preheader9.us.us:                                ; preds = %._crit_edge20.us.us, %.preheader9.us.us.preheader
  %indvars.iv56 = phi i64 [ 0, %.preheader9.us.us.preheader ], [ %indvars.iv.next57, %._crit_edge20.us.us ]
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv56, i64 %indvars.iv60
  br i1 %lcmp.mod55, label %.prol.loopexit53, label %.prol.preheader52

.prol.preheader52:                                ; preds = %.preheader9.us.us
  %pgocount12 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  %62 = add i64 %pgocount12, 1
  store i64 %62, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  %63 = load double, double* %61, align 8
  %64 = load double, double* %59, align 8
  %65 = fmul double %63, %64
  %66 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %31, i64 0, i64 %indvars.iv56, i64 0
  %67 = load double, double* %66, align 8
  %68 = fadd double %67, %65
  store double %68, double* %66, align 8
  br label %.prol.loopexit53

.prol.loopexit53:                                 ; preds = %.prol.preheader52, %.preheader9.us.us
  %indvars.iv48.unr.ph = phi i64 [ 1, %.prol.preheader52 ], [ 0, %.preheader9.us.us ]
  br i1 %58, label %.prol.loopexit53.._crit_edge20.us.us_crit_edge, label %.preheader9.us.us.new.preheader

.prol.loopexit53.._crit_edge20.us.us_crit_edge:   ; preds = %.prol.loopexit53
  %pgocount13 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %69 = add i64 %pgocount13, 1
  store i64 %69, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  br label %._crit_edge20.us.us

.preheader9.us.us.new.preheader:                  ; preds = %.prol.loopexit53
  br label %.preheader9.us.us.new

._crit_edge20.us.us.loopexit:                     ; preds = %.preheader9.us.us.new
  %pgocount14 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  %70 = add i64 %pgocount14, 1
  store i64 %70, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  br label %._crit_edge20.us.us

._crit_edge20.us.us:                              ; preds = %.prol.loopexit53.._crit_edge20.us.us_crit_edge, %._crit_edge20.us.us.loopexit
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next57, %wide.trip.count58
  br i1 %exitcond59, label %._crit_edge22.us, label %.preheader9.us.us

.preheader9.us.us.new:                            ; preds = %.preheader9.us.us.new..preheader9.us.us.new_crit_edge, %.preheader9.us.us.new.preheader
  %indvars.iv48 = phi i64 [ %indvars.iv.next49.1, %.preheader9.us.us.new..preheader9.us.us.new_crit_edge ], [ %indvars.iv48.unr.ph, %.preheader9.us.us.new.preheader ]
  %71 = load double, double* %61, align 8
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv48, i64 %indvars.iv60
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %31, i64 0, i64 %indvars.iv56, i64 %indvars.iv48
  %76 = load double, double* %75, align 8
  %77 = fadd double %76, %74
  store double %77, double* %75, align 8
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %78 = load double, double* %61, align 8
  %79 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next49, i64 %indvars.iv60
  %80 = load double, double* %79, align 8
  %81 = fmul double %78, %80
  %82 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %31, i64 0, i64 %indvars.iv56, i64 %indvars.iv.next49
  %83 = load double, double* %82, align 8
  %84 = fadd double %83, %81
  store double %84, double* %82, align 8
  %indvars.iv.next49.1 = add nsw i64 %indvars.iv48, 2
  %exitcond51.1 = icmp eq i64 %indvars.iv.next49.1, %wide.trip.count50.1
  br i1 %exitcond51.1, label %._crit_edge20.us.us.loopexit, label %.preheader9.us.us.new..preheader9.us.us.new_crit_edge

.preheader9.us.us.new..preheader9.us.us.new_crit_edge: ; preds = %.preheader9.us.us.new
  %pgocount15 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %85 = add i64 %pgocount15, 1
  store i64 %85, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  br label %.preheader9.us.us.new

.preheader8:                                      ; preds = %._crit_edge22.us
  %pgocount16 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 18)
  %86 = add i64 %pgocount16, 1
  store i64 %86, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 18)
  %87 = icmp sgt i32 %0, 0
  br i1 %87, label %.preheader.us.preheader, label %._crit_edge17

.preheader.us.preheader:                          ; preds = %.preheader8
  %pgocount17 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 21)
  %88 = add i64 %pgocount17, 1
  store i64 %88, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 21)
  %89 = add i32 %0, -1
  %xtraiter = and i32 %0, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %90 = icmp ult i32 %89, 3
  %wide.trip.count47 = zext i32 %0 to i64
  %wide.trip.count.3 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv45 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next46, %._crit_edge.us ]
  br i1 %lcmp.mod, label %.preheader.us..prol.loopexit_crit_edge, label %.prol.preheader.preheader

.preheader.us..prol.loopexit_crit_edge:           ; preds = %.preheader.us
  %pgocount18 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %91 = add i64 %pgocount18, 1
  store i64 %91, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  br label %.prol.loopexit

.prol.preheader.preheader:                        ; preds = %.preheader.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader..prol.preheader_crit_edge, %.prol.preheader.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader..prol.preheader_crit_edge ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader..prol.preheader_crit_edge ], [ %xtraiter, %.prol.preheader.preheader ]
  %92 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %31, i64 0, i64 %indvars.iv45, i64 %indvars.iv.prol
  %93 = bitcast double* %92 to i64*
  %94 = load i64, i64* %93, align 8
  %95 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv.prol
  %96 = bitcast double* %95 to i64*
  store i64 %94, i64* %96, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader..prol.preheader_crit_edge, !llvm.loop !3

.prol.preheader..prol.preheader_crit_edge:        ; preds = %.prol.preheader
  %pgocount19 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %97 = add i64 %pgocount19, 1
  store i64 %97, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  br label %.prol.preheader

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  %pgocount20 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 13)
  %98 = add i64 %pgocount20, 1
  store i64 %98, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 13)
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us..prol.loopexit_crit_edge, %.prol.loopexit.loopexit
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us..prol.loopexit_crit_edge ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  br i1 %90, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new..preheader.us.new_crit_edge, %.preheader.us.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader.us.new..preheader.us.new_crit_edge ], [ %indvars.iv.unr, %.preheader.us.new.preheader ]
  %99 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %31, i64 0, i64 %indvars.iv45, i64 %indvars.iv
  %100 = bitcast double* %99 to i64*
  %101 = load i64, i64* %100, align 8
  %102 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv
  %103 = bitcast double* %102 to i64*
  store i64 %101, i64* %103, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %104 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %31, i64 0, i64 %indvars.iv45, i64 %indvars.iv.next
  %105 = bitcast double* %104 to i64*
  %106 = load i64, i64* %105, align 8
  %107 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv.next
  %108 = bitcast double* %107 to i64*
  store i64 %106, i64* %108, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %109 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %31, i64 0, i64 %indvars.iv45, i64 %indvars.iv.next.1
  %110 = bitcast double* %109 to i64*
  %111 = load i64, i64* %110, align 8
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv.next.1
  %113 = bitcast double* %112 to i64*
  store i64 %111, i64* %113, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %114 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %31, i64 0, i64 %indvars.iv45, i64 %indvars.iv.next.2
  %115 = bitcast double* %114 to i64*
  %116 = load i64, i64* %115, align 8
  %117 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv.next.2
  %118 = bitcast double* %117 to i64*
  store i64 %116, i64* %118, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %._crit_edge.us.loopexit, label %.preheader.us.new..preheader.us.new_crit_edge

.preheader.us.new..preheader.us.new_crit_edge:    ; preds = %.preheader.us.new
  %pgocount21 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %119 = add i64 %pgocount21, 1
  store i64 %119, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  br label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  %pgocount22 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 14)
  %120 = add i64 %pgocount22, 1
  store i64 %120, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 14)
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond = icmp eq i64 %indvars.iv.next46, %wide.trip.count47
  br i1 %exitcond, label %._crit_edge17.loopexit, label %.preheader.us

._crit_edge17.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %.preheader8, %.preheader11, %._crit_edge42, %._crit_edge42.thread
  %121 = phi i8* [ %30, %.preheader8 ], [ %30, %.preheader11 ], [ %30, %._crit_edge42 ], [ %5, %._crit_edge42.thread ], [ %30, %._crit_edge17.loopexit ]
  tail call void @free(i8* %121) #3
  ret void

._crit_edge33.us.3:                               ; preds = %._crit_edge33.us.3.._crit_edge33.us.3_crit_edge, %._crit_edge33.us.3.preheader.new
  %indvars.iv68 = phi i64 [ %indvars.iv68.unr103, %._crit_edge33.us.3.preheader.new ], [ %indvars.iv.next69.3.1, %._crit_edge33.us.3.._crit_edge33.us.3_crit_edge ]
  %122 = mul nuw nsw i64 %indvars.iv68, 16000
  %scevgep = getelementptr i8, i8* %30, i64 %122
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %37, i32 8, i1 false)
  %123 = mul i64 %indvars.iv68, 16000
  %124 = add i64 %123, 16000
  %scevgep.1 = getelementptr i8, i8* %30, i64 %124
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %37, i32 8, i1 false)
  %125 = mul i64 %indvars.iv68, 16000
  %126 = add i64 %125, 32000
  %scevgep.2 = getelementptr i8, i8* %30, i64 %126
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %37, i32 8, i1 false)
  %127 = mul i64 %indvars.iv68, 16000
  %128 = add i64 %127, 48000
  %scevgep.3 = getelementptr i8, i8* %30, i64 %128
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %37, i32 8, i1 false)
  %indvars.iv.next69.3 = add nsw i64 %indvars.iv68, 4
  %129 = mul nuw nsw i64 %indvars.iv.next69.3, 16000
  %scevgep.1104 = getelementptr i8, i8* %30, i64 %129
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1104, i8 0, i64 %37, i32 8, i1 false)
  %130 = mul i64 %indvars.iv.next69.3, 16000
  %131 = add i64 %130, 16000
  %scevgep.1.1 = getelementptr i8, i8* %30, i64 %131
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 %37, i32 8, i1 false)
  %132 = mul i64 %indvars.iv.next69.3, 16000
  %133 = add i64 %132, 32000
  %scevgep.2.1 = getelementptr i8, i8* %30, i64 %133
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 %37, i32 8, i1 false)
  %134 = mul i64 %indvars.iv.next69.3, 16000
  %135 = add i64 %134, 48000
  %scevgep.3.1 = getelementptr i8, i8* %30, i64 %135
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 %37, i32 8, i1 false)
  %indvars.iv.next69.3.1 = add nsw i64 %indvars.iv68, 8
  %exitcond71.3.1 = icmp eq i64 %indvars.iv.next69.3.1, %wide.trip.count70.3
  br i1 %exitcond71.3.1, label %.preheader11.unr-lcssa, label %._crit_edge33.us.3.._crit_edge33.us.3_crit_edge

._crit_edge33.us.3.._crit_edge33.us.3_crit_edge:  ; preds = %._crit_edge33.us.3
  %pgocount23 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %136 = add i64 %pgocount23, 1
  store i64 %136, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  br label %._crit_edge33.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader4.preheader, label %._crit_edge11

.preheader4.preheader:                            ; preds = %2
  %wide.trip.count34 = zext i32 %0 to i64
  br label %.preheader4

.preheader4:                                      ; preds = %._crit_edge9, %.preheader4.preheader
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %._crit_edge9 ], [ 0, %.preheader4.preheader ]
  %4 = add i64 %indvars.iv32, -2
  %5 = add i64 %indvars.iv32, 4294967295
  %6 = icmp sgt i64 %indvars.iv32, 0
  br i1 %6, label %.preheader.preheader, label %.preheader4.._crit_edge9_crit_edge

.preheader4.._crit_edge9_crit_edge:               ; preds = %.preheader4
  %pgocount = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 3)
  %7 = add i64 %pgocount, 1
  store i64 %7, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 3)
  br label %._crit_edge9

.preheader.preheader:                             ; preds = %.preheader4
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv32, i64 0
  br label %.preheader

.preheader3:                                      ; preds = %._crit_edge
  %pgocount1 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 7)
  %9 = add i64 %pgocount1, 1
  store i64 %9, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 7)
  %10 = icmp sgt i64 %indvars.iv32, 0
  br i1 %10, label %.lr.ph8, label %._crit_edge9

.lr.ph8:                                          ; preds = %.preheader3
  %pgocount2 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 8)
  %11 = add i64 %pgocount2, 1
  store i64 %11, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 8)
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv32, i64 %indvars.iv32
  %xtraiter2836 = and i64 %indvars.iv32, 1
  %lcmp.mod29 = icmp eq i64 %xtraiter2836, 0
  br i1 %lcmp.mod29, label %.prol.loopexit27, label %.prol.preheader26

.prol.preheader26:                                ; preds = %.lr.ph8
  %pgocount3 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 10)
  %13 = add i64 %pgocount3, 1
  store i64 %13, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 10)
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv32, i64 0
  %15 = load double, double* %14, align 8
  %16 = fmul double %15, %15
  %17 = load double, double* %12, align 8
  %18 = fsub double %17, %16
  store double %18, double* %12, align 8
  br label %.prol.loopexit27

.prol.loopexit27:                                 ; preds = %.prol.preheader26, %.lr.ph8
  %indvars.iv21.unr.ph = phi i64 [ 1, %.prol.preheader26 ], [ 0, %.lr.ph8 ]
  %19 = trunc i64 %5 to i32
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %._crit_edge9, label %.lr.ph8.new.preheader

.lr.ph8.new.preheader:                            ; preds = %.prol.loopexit27
  %pgocount4 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 9)
  %21 = add i64 %pgocount4, 1
  store i64 %21, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 9)
  %22 = sub i64 %4, %indvars.iv21.unr.ph
  %23 = lshr i64 %22, 1
  %24 = and i64 %23, 1
  %lcmp.mod38 = icmp eq i64 %24, 0
  br i1 %lcmp.mod38, label %.lr.ph8.new.prol.preheader, label %.lr.ph8.new.prol.loopexit.unr-lcssa

.lr.ph8.new.prol.preheader:                       ; preds = %.lr.ph8.new.preheader
  br label %.lr.ph8.new.prol

.lr.ph8.new.prol:                                 ; preds = %.lr.ph8.new.prol.preheader
  %pgocount5 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 12)
  %25 = add i64 %pgocount5, 1
  store i64 %25, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 12)
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv32, i64 %indvars.iv21.unr.ph
  %27 = load double, double* %26, align 8
  %28 = fmul double %27, %27
  %29 = load double, double* %12, align 8
  %30 = fsub double %29, %28
  store double %30, double* %12, align 8
  %indvars.iv.next22.prol = add nuw nsw i64 %indvars.iv21.unr.ph, 1
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv32, i64 %indvars.iv.next22.prol
  %32 = load double, double* %31, align 8
  %33 = fmul double %32, %32
  %34 = fsub double %30, %33
  store double %34, double* %12, align 8
  %indvars.iv.next22.1.prol = or i64 %indvars.iv21.unr.ph, 2
  br label %.lr.ph8.new.prol.loopexit.unr-lcssa

.lr.ph8.new.prol.loopexit.unr-lcssa:              ; preds = %.lr.ph8.new.prol, %.lr.ph8.new.preheader
  %indvars.iv21.unr.ph39 = phi i64 [ %indvars.iv.next22.1.prol, %.lr.ph8.new.prol ], [ %indvars.iv21.unr.ph, %.lr.ph8.new.preheader ]
  br label %.lr.ph8.new.prol.loopexit

.lr.ph8.new.prol.loopexit:                        ; preds = %.lr.ph8.new.prol.loopexit.unr-lcssa
  %35 = icmp eq i64 %23, 0
  br i1 %35, label %._crit_edge9.loopexit, label %.lr.ph8.new.preheader.new

.lr.ph8.new.preheader.new:                        ; preds = %.lr.ph8.new.prol.loopexit
  %pgocount6 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 11)
  %36 = add i64 %pgocount6, 1
  store i64 %36, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 11)
  br label %.lr.ph8.new

.preheader:                                       ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %._crit_edge ], [ 0, %.preheader.preheader ]
  %37 = add i64 %indvars.iv16, 4294967295
  %38 = icmp sgt i64 %indvars.iv16, 0
  br i1 %38, label %.lr.ph, label %.preheader.._crit_edge_crit_edge

.preheader.._crit_edge_crit_edge:                 ; preds = %.preheader
  %pgocount7 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 1)
  %39 = add i64 %pgocount7, 1
  store i64 %39, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 1)
  br label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %pgocount8 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 4)
  %40 = add i64 %pgocount8, 1
  store i64 %40, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 4)
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv32, i64 %indvars.iv16
  %xtraiter37 = and i64 %indvars.iv16, 1
  %lcmp.mod = icmp eq i64 %xtraiter37, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %pgocount9 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 6)
  %42 = add i64 %pgocount9, 1
  store i64 %42, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 6)
  %43 = load double, double* %8, align 8
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv16, i64 0
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = load double, double* %41, align 8
  %48 = fsub double %47, %46
  store double %48, double* %41, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %49 = trunc i64 %37 to i32
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new..lr.ph.new_crit_edge, %.lr.ph.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new..lr.ph.new_crit_edge ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv32, i64 %indvars.iv
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv16, i64 %indvars.iv
  %54 = load double, double* %53, align 8
  %55 = fmul double %52, %54
  %56 = load double, double* %41, align 8
  %57 = fsub double %56, %55
  store double %57, double* %41, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %58 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv32, i64 %indvars.iv.next
  %59 = load double, double* %58, align 8
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv16, i64 %indvars.iv.next
  %61 = load double, double* %60, align 8
  %62 = fmul double %59, %61
  %63 = load double, double* %41, align 8
  %64 = fsub double %63, %62
  store double %64, double* %41, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv16
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new..lr.ph.new_crit_edge

.lr.ph.new..lr.ph.new_crit_edge:                  ; preds = %.lr.ph.new
  %pgocount10 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 0)
  %65 = add i64 %pgocount10, 1
  store i64 %65, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 0)
  br label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  %pgocount11 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 5)
  %66 = add i64 %pgocount11, 1
  store i64 %66, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 5)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.preheader.._crit_edge_crit_edge, %._crit_edge.loopexit, %.prol.loopexit
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv16, i64 %indvars.iv16
  %68 = load double, double* %67, align 8
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv32, i64 %indvars.iv16
  %70 = load double, double* %69, align 8
  %71 = fdiv double %70, %68
  store double %71, double* %69, align 8
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond = icmp eq i64 %indvars.iv.next17, %indvars.iv32
  br i1 %exitcond, label %.preheader3, label %.preheader

.lr.ph8.new:                                      ; preds = %.lr.ph8.new..lr.ph8.new_crit_edge, %.lr.ph8.new.preheader.new
  %indvars.iv21 = phi i64 [ %indvars.iv21.unr.ph39, %.lr.ph8.new.preheader.new ], [ %indvars.iv.next22.1.1, %.lr.ph8.new..lr.ph8.new_crit_edge ]
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv32, i64 %indvars.iv21
  %73 = load double, double* %72, align 8
  %74 = fmul double %73, %73
  %75 = load double, double* %12, align 8
  %76 = fsub double %75, %74
  store double %76, double* %12, align 8
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %77 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv32, i64 %indvars.iv.next22
  %78 = load double, double* %77, align 8
  %79 = fmul double %78, %78
  %80 = fsub double %76, %79
  store double %80, double* %12, align 8
  %indvars.iv.next22.1 = add nsw i64 %indvars.iv21, 2
  %81 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv32, i64 %indvars.iv.next22.1
  %82 = load double, double* %81, align 8
  %83 = fmul double %82, %82
  %84 = fsub double %80, %83
  store double %84, double* %12, align 8
  %indvars.iv.next22.140 = add nsw i64 %indvars.iv21, 3
  %85 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv32, i64 %indvars.iv.next22.140
  %86 = load double, double* %85, align 8
  %87 = fmul double %86, %86
  %88 = fsub double %84, %87
  store double %88, double* %12, align 8
  %indvars.iv.next22.1.1 = add nsw i64 %indvars.iv21, 4
  %exitcond25.1.1 = icmp eq i64 %indvars.iv.next22.1.1, %indvars.iv32
  br i1 %exitcond25.1.1, label %._crit_edge9.loopexit.unr-lcssa, label %.lr.ph8.new..lr.ph8.new_crit_edge

.lr.ph8.new..lr.ph8.new_crit_edge:                ; preds = %.lr.ph8.new
  %pgocount12 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 2)
  %89 = add i64 %pgocount12, 1
  store i64 %89, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 2)
  br label %.lr.ph8.new

._crit_edge9.loopexit.unr-lcssa:                  ; preds = %.lr.ph8.new
  br label %._crit_edge9.loopexit

._crit_edge9.loopexit:                            ; preds = %._crit_edge9.loopexit.unr-lcssa, %.lr.ph8.new.prol.loopexit
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %.preheader4.._crit_edge9_crit_edge, %._crit_edge9.loopexit, %.prol.loopexit27, %.preheader3
  %90 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv32, i64 %indvars.iv32
  %91 = load double, double* %90, align 8
  %92 = tail call double @sqrt(double %91) #3
  store double %92, double* %90, align 8
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next33, %wide.trip.count34
  br i1 %exitcond35, label %._crit_edge11.loopexit, label %.preheader4

._crit_edge11.loopexit:                           ; preds = %._crit_edge9
  %pgocount13 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 14)
  %93 = add i64 %pgocount13, 1
  store i64 %93, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 14)
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %2
  %pgocount14 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 13)
  %94 = add i64 %pgocount14, 1
  store i64 %94, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 13)
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
  br i1 %7, label %.preheader.preheader, label %._crit_edge4

.preheader.preheader:                             ; preds = %2
  %8 = sext i32 %0 to i64
  %wide.trip.count11 = zext i32 %0 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv9 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next10, %._crit_edge ]
  %indvars.iv7 = phi i64 [ 1, %.preheader.preheader ], [ %indvars.iv.next8, %._crit_edge ]
  %9 = mul nsw i64 %indvars.iv9, %8
  br label %10

; <label>:10:                                     ; preds = %19, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %19 ], [ 0, %.lr.ph ]
  %11 = add nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %16, label %._crit_edge1

._crit_edge1:                                     ; preds = %10
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %15 = add i64 %pgocount, 1
  store i64 %15, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  br label %19

; <label>:16:                                     ; preds = %10
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %17 = add i64 %pgocount2, 1
  store i64 %17, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #5
  br label %19

; <label>:19:                                     ; preds = %._crit_edge1, %16
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv9, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %22) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv7
  br i1 %exitcond, label %._crit_edge, label %10

._crit_edge:                                      ; preds = %19
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %24 = add i64 %pgocount3, 1
  store i64 %24, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next10, %wide.trip.count11
  br i1 %exitcond12, label %._crit_edge4.loopexit, label %.lr.ph

._crit_edge4.loopexit:                            ; preds = %._crit_edge
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 4)
  %25 = add i64 %pgocount4, 1
  store i64 %25, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 4)
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %2
  %pgocount5 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %26 = add i64 %pgocount5, 1
  store i64 %26, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %29) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
