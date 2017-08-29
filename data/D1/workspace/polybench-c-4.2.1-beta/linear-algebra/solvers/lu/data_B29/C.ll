; ModuleID = 'B.ll'
source_filename = "lu.c"
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
@__profn_B.ll_kernel_lu = private constant [14 x i8] c"B.ll:kernel_lu"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 32414643582, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [24 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 300420118271, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 24, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_lu = private global [14 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_lu = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4376252712048593566, i64 169765224626, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i32 0, i32 0), i8* null, i8* null, i32 14, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 63976198547, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [54 x i8] c"4\00main\01B.ll:init_array\01B.ll:kernel_lu\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_lu to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([54 x i8], [54 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_lu(i32 2000, [2000 x double]* %4)
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

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]* nocapture) unnamed_addr #0 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader14.lr.ph, label %._crit_edge42.thread

._crit_edge42.thread:                             ; preds = %2
  %pgocount = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 17)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 17)
  %5 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
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
  %30 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
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
  tail call void @free(i8* %121) #4
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

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32, [2000 x double]* nocapture) unnamed_addr #2 {
  %3 = icmp sgt i32 %0, 0
  br i1 %3, label %.preheader6.preheader, label %._crit_edge17

.preheader6.preheader:                            ; preds = %2
  %wide.trip.count48 = zext i32 %0 to i64
  %wide.trip.count42 = zext i32 %0 to i64
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge13, %.preheader6.preheader
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %._crit_edge13 ], [ 0, %.preheader6.preheader ]
  %4 = add i64 %indvars.iv46, 4294967295
  %5 = icmp sgt i64 %indvars.iv46, 0
  br i1 %5, label %.preheader4.preheader, label %.preheader6.._crit_edge13_crit_edge

.preheader6.._crit_edge13_crit_edge:              ; preds = %.preheader6
  %pgocount = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 4)
  %6 = add i64 %pgocount, 1
  store i64 %6, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 4)
  br label %._crit_edge13

.preheader4.preheader:                            ; preds = %.preheader6
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv46, i64 0
  br label %.preheader4

.preheader.lr.ph:                                 ; preds = %._crit_edge
  %pgocount1 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 10)
  %8 = add i64 %pgocount1, 1
  store i64 %8, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 10)
  %9 = icmp sgt i64 %indvars.iv46, 0
  br i1 %9, label %.preheader.us.preheader, label %._crit_edge13

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %xtraiter3650 = and i64 %indvars.iv46, 1
  %lcmp.mod37 = icmp eq i64 %xtraiter3650, 0
  %10 = trunc i64 %4 to i32
  %11 = icmp eq i32 %10, 0
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv46, i64 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge11.us, %.preheader.us.preheader
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %._crit_edge11.us ], [ %indvars.iv46, %.preheader.us.preheader ]
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv46, i64 %indvars.iv40
  br i1 %lcmp.mod37, label %.prol.loopexit35, label %.prol.preheader34

.prol.preheader34:                                ; preds = %.preheader.us
  %pgocount2 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 8)
  %14 = add i64 %pgocount2, 1
  store i64 %14, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 8)
  %15 = load double, double* %12, align 8
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv40
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = load double, double* %13, align 8
  %20 = fsub double %19, %18
  store double %20, double* %13, align 8
  br label %.prol.loopexit35

.prol.loopexit35:                                 ; preds = %.prol.preheader34, %.preheader.us
  %indvars.iv29.unr.ph = phi i64 [ 1, %.prol.preheader34 ], [ 0, %.preheader.us ]
  br i1 %11, label %.prol.loopexit35.._crit_edge11.us_crit_edge, label %.preheader.us.new.preheader

.prol.loopexit35.._crit_edge11.us_crit_edge:      ; preds = %.prol.loopexit35
  %pgocount3 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 3)
  %21 = add i64 %pgocount3, 1
  store i64 %21, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 3)
  br label %._crit_edge11.us

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit35
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new..preheader.us.new_crit_edge, %.preheader.us.new.preheader
  %indvars.iv29 = phi i64 [ %indvars.iv.next30.1, %.preheader.us.new..preheader.us.new_crit_edge ], [ %indvars.iv29.unr.ph, %.preheader.us.new.preheader ]
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv46, i64 %indvars.iv29
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv29, i64 %indvars.iv40
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = load double, double* %13, align 8
  %28 = fsub double %27, %26
  store double %28, double* %13, align 8
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv46, i64 %indvars.iv.next30
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next30, i64 %indvars.iv40
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = load double, double* %13, align 8
  %35 = fsub double %34, %33
  store double %35, double* %13, align 8
  %indvars.iv.next30.1 = add nsw i64 %indvars.iv29, 2
  %exitcond33.1 = icmp eq i64 %indvars.iv.next30.1, %indvars.iv46
  br i1 %exitcond33.1, label %._crit_edge11.us.loopexit, label %.preheader.us.new..preheader.us.new_crit_edge

.preheader.us.new..preheader.us.new_crit_edge:    ; preds = %.preheader.us.new
  %pgocount4 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 0)
  %36 = add i64 %pgocount4, 1
  store i64 %36, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 0)
  br label %.preheader.us.new

._crit_edge11.us.loopexit:                        ; preds = %.preheader.us.new
  %pgocount5 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 6)
  %37 = add i64 %pgocount5, 1
  store i64 %37, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 6)
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %.prol.loopexit35.._crit_edge11.us_crit_edge, %._crit_edge11.us.loopexit
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next41, %wide.trip.count42
  br i1 %exitcond43, label %._crit_edge13.loopexit, label %.preheader.us

.preheader4:                                      ; preds = %._crit_edge, %.preheader4.preheader
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %._crit_edge ], [ 0, %.preheader4.preheader ]
  %38 = add i64 %indvars.iv23, 4294967295
  %39 = icmp sgt i64 %indvars.iv23, 0
  br i1 %39, label %.lr.ph, label %.preheader4.._crit_edge_crit_edge

.preheader4.._crit_edge_crit_edge:                ; preds = %.preheader4
  %pgocount6 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 2)
  %40 = add i64 %pgocount6, 1
  store i64 %40, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 2)
  br label %._crit_edge

.lr.ph:                                           ; preds = %.preheader4
  %pgocount7 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 5)
  %41 = add i64 %pgocount7, 1
  store i64 %41, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 5)
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv46, i64 %indvars.iv23
  %xtraiter51 = and i64 %indvars.iv23, 1
  %lcmp.mod = icmp eq i64 %xtraiter51, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %pgocount8 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 9)
  %43 = add i64 %pgocount8, 1
  store i64 %43, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 9)
  %44 = load double, double* %7, align 8
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv23
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = load double, double* %42, align 8
  %49 = fsub double %48, %47
  store double %49, double* %42, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %50 = trunc i64 %38 to i32
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new..lr.ph.new_crit_edge, %.lr.ph.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new..lr.ph.new_crit_edge ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv46, i64 %indvars.iv
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv, i64 %indvars.iv23
  %55 = load double, double* %54, align 8
  %56 = fmul double %53, %55
  %57 = load double, double* %42, align 8
  %58 = fsub double %57, %56
  store double %58, double* %42, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv46, i64 %indvars.iv.next
  %60 = load double, double* %59, align 8
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv23
  %62 = load double, double* %61, align 8
  %63 = fmul double %60, %62
  %64 = load double, double* %42, align 8
  %65 = fsub double %64, %63
  store double %65, double* %42, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv23
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new..lr.ph.new_crit_edge

.lr.ph.new..lr.ph.new_crit_edge:                  ; preds = %.lr.ph.new
  %pgocount9 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 1)
  %66 = add i64 %pgocount9, 1
  store i64 %66, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 1)
  br label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  %pgocount10 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 7)
  %67 = add i64 %pgocount10, 1
  store i64 %67, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.preheader4.._crit_edge_crit_edge, %._crit_edge.loopexit, %.prol.loopexit
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv23, i64 %indvars.iv23
  %69 = load double, double* %68, align 8
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv46, i64 %indvars.iv23
  %71 = load double, double* %70, align 8
  %72 = fdiv double %71, %69
  store double %72, double* %70, align 8
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond = icmp eq i64 %indvars.iv.next24, %indvars.iv46
  br i1 %exitcond, label %.preheader.lr.ph, label %.preheader4

._crit_edge13.loopexit:                           ; preds = %._crit_edge11.us
  %pgocount11 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 11)
  %73 = add i64 %pgocount11, 1
  store i64 %73, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 11)
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %.preheader6.._crit_edge13_crit_edge, %._crit_edge13.loopexit, %.preheader.lr.ph
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next47, %wide.trip.count48
  br i1 %exitcond49, label %._crit_edge17.loopexit, label %.preheader6

._crit_edge17.loopexit:                           ; preds = %._crit_edge13
  %pgocount12 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 13)
  %74 = add i64 %pgocount12, 1
  store i64 %74, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 13)
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %2
  %pgocount13 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 12)
  %75 = add i64 %pgocount13, 1
  store i64 %75, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 12)
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
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
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #6
  br label %19

; <label>:19:                                     ; preds = %._crit_edge, %16
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %22) #6
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
  %28 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %29) #6
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
