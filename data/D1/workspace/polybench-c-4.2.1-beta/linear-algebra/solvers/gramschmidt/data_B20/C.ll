; ModuleID = 'B.ll'
source_filename = "gramschmidt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"R\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"Q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_gramschmidt = private constant [23 x i8] c"B.ll:kernel_gramschmidt"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 32414643582, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [12 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 149888853775, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 12, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_gramschmidt = private global [22 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_gramschmidt = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -101542260496489068, i64 268114370087, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i32 0, i32 0), i8* null, i8* null, i32 22, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [9 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 111723334731, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 9, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [63 x i8] c"=\00main\01B.ll:init_array\01B.ll:kernel_gramschmidt\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_gramschmidt to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([63 x i8], [63 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %3 to [1200 x double]*
  %7 = bitcast i8* %4 to [1200 x double]*
  %8 = bitcast i8* %5 to [1200 x double]*
  tail call fastcc void @init_array(i32 1000, i32 1200, [1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_gramschmidt(i32 1000, i32 1200, [1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
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
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8)
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
define internal fastcc void @init_array(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader4.lr.ph, label %.preheader3

.preheader4.lr.ph:                                ; preds = %5
  %pgocount = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %7 = add i64 %pgocount, 1
  store i64 %7, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %8 = icmp sgt i32 %1, 0
  %9 = sitofp i32 %0 to double
  br i1 %8, label %.preheader4.us.preheader, label %._crit_edge7

.preheader4.us.preheader:                         ; preds = %.preheader4.lr.ph
  %pgocount1 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %10 = add i64 %pgocount1, 1
  store i64 %10, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %wide.trip.count17 = zext i32 %1 to i64
  %wide.trip.count22 = zext i32 %0 to i64
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge10.us, %.preheader4.us.preheader
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %._crit_edge10.us ], [ 0, %.preheader4.us.preheader ]
  br label %11

; <label>:11:                                     ; preds = %._crit_edge, %.preheader4.us
  %indvars.iv15 = phi i64 [ 0, %.preheader4.us ], [ %indvars.iv.next16, %._crit_edge ]
  %12 = mul nuw nsw i64 %indvars.iv15, %indvars.iv20
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, %0
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, %9
  %17 = fmul double %16, 1.000000e+02
  %18 = fadd double %17, 1.000000e+01
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv20, i64 %indvars.iv15
  store double %18, double* %19, align 8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv20, i64 %indvars.iv15
  store double 0.000000e+00, double* %20, align 8
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond = icmp eq i64 %indvars.iv.next16, %wide.trip.count17
  br i1 %exitcond, label %._crit_edge10.us, label %._crit_edge

._crit_edge:                                      ; preds = %11
  %pgocount2 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %21 = add i64 %pgocount2, 1
  store i64 %21, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  br label %11

._crit_edge10.us:                                 ; preds = %11
  %pgocount3 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %22 = add i64 %pgocount3, 1
  store i64 %22, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next21, %wide.trip.count22
  br i1 %exitcond23, label %.preheader3.loopexit, label %.preheader4.us

.preheader3.loopexit:                             ; preds = %._crit_edge10.us
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3.loopexit, %5
  %23 = icmp sgt i32 %1, 0
  br i1 %23, label %.preheader.us.preheader, label %._crit_edge7

.preheader.us.preheader:                          ; preds = %.preheader3
  %pgocount4 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %24 = add i64 %pgocount4, 1
  store i64 %24, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %25 = add i32 %1, -1
  %26 = zext i32 %25 to i64
  %27 = shl nuw nsw i64 %26, 3
  %28 = add nuw nsw i64 %27, 8
  %xtraiter = and i32 %1, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader.us.prol.loopexit, label %._crit_edge.us.prol.preheader

._crit_edge.us.prol.preheader:                    ; preds = %.preheader.us.preheader
  br label %._crit_edge.us.prol

._crit_edge.us.prol:                              ; preds = %._crit_edge.us.prol.._crit_edge.us.prol_crit_edge, %._crit_edge.us.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %._crit_edge.us.prol.._crit_edge.us.prol_crit_edge ], [ 0, %._crit_edge.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %._crit_edge.us.prol.._crit_edge.us.prol_crit_edge ], [ %xtraiter, %._crit_edge.us.prol.preheader ]
  %scevgep.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.prol, i64 0
  %scevgep14.prol = bitcast double* %scevgep.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.prol, i8 0, i64 %28, i32 8, i1 false)
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader.us.prol.loopexit.loopexit, label %._crit_edge.us.prol.._crit_edge.us.prol_crit_edge, !llvm.loop !1

._crit_edge.us.prol.._crit_edge.us.prol_crit_edge: ; preds = %._crit_edge.us.prol
  %pgocount5 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %29 = add i64 %pgocount5, 1
  store i64 %29, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  br label %._crit_edge.us.prol

.preheader.us.prol.loopexit.loopexit:             ; preds = %._crit_edge.us.prol
  %pgocount6 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  %30 = add i64 %pgocount6, 1
  store i64 %30, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  br label %.preheader.us.prol.loopexit

.preheader.us.prol.loopexit:                      ; preds = %.preheader.us.prol.loopexit.loopexit, %.preheader.us.preheader
  %indvars.iv.unr = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next.prol, %.preheader.us.prol.loopexit.loopexit ]
  %31 = icmp ult i32 %25, 3
  br i1 %31, label %._crit_edge7, label %._crit_edge.us.3.preheader

._crit_edge.us.3.preheader:                       ; preds = %.preheader.us.prol.loopexit
  %wide.trip.count.3 = zext i32 %1 to i64
  %32 = add nsw i64 %wide.trip.count.3, -4
  %33 = sub i64 %32, %indvars.iv.unr
  %34 = lshr i64 %33, 2
  %35 = and i64 %34, 1
  %lcmp.mod26 = icmp eq i64 %35, 0
  br i1 %lcmp.mod26, label %._crit_edge.us.3.prol.preheader, label %._crit_edge.us.3.prol.loopexit

._crit_edge.us.3.prol.preheader:                  ; preds = %._crit_edge.us.3.preheader
  br label %._crit_edge.us.3.prol

._crit_edge.us.3.prol:                            ; preds = %._crit_edge.us.3.prol.preheader
  %pgocount7 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 11)
  %36 = add i64 %pgocount7, 1
  store i64 %36, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 11)
  %scevgep.prol28 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.unr, i64 0
  %scevgep14.prol29 = bitcast double* %scevgep.prol28 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.prol29, i8 0, i64 %28, i32 8, i1 false)
  %indvars.iv.next.prol30 = add nuw nsw i64 %indvars.iv.unr, 1
  %scevgep.1.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.prol30, i64 0
  %scevgep14.1.prol = bitcast double* %scevgep.1.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.1.prol, i8 0, i64 %28, i32 8, i1 false)
  %indvars.iv.next.1.prol = add nsw i64 %indvars.iv.unr, 2
  %scevgep.2.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.1.prol, i64 0
  %scevgep14.2.prol = bitcast double* %scevgep.2.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.2.prol, i8 0, i64 %28, i32 8, i1 false)
  %indvars.iv.next.2.prol = add nsw i64 %indvars.iv.unr, 3
  %scevgep.3.prol = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.2.prol, i64 0
  %scevgep14.3.prol = bitcast double* %scevgep.3.prol to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.3.prol, i8 0, i64 %28, i32 8, i1 false)
  %indvars.iv.next.3.prol = add nsw i64 %indvars.iv.unr, 4
  br label %._crit_edge.us.3.prol.loopexit

._crit_edge.us.3.prol.loopexit:                   ; preds = %._crit_edge.us.3.prol, %._crit_edge.us.3.preheader
  %indvars.iv.unr31 = phi i64 [ %indvars.iv.unr, %._crit_edge.us.3.preheader ], [ %indvars.iv.next.3.prol, %._crit_edge.us.3.prol ]
  %37 = icmp eq i64 %34, 0
  br i1 %37, label %._crit_edge7.loopexit, label %._crit_edge.us.3.preheader.new

._crit_edge.us.3.preheader.new:                   ; preds = %._crit_edge.us.3.prol.loopexit
  br label %._crit_edge.us.3

._crit_edge7.loopexit.unr-lcssa:                  ; preds = %._crit_edge.us.3
  %pgocount8 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 10)
  %38 = add i64 %pgocount8, 1
  store i64 %38, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 10)
  br label %._crit_edge7.loopexit

._crit_edge7.loopexit:                            ; preds = %._crit_edge7.loopexit.unr-lcssa, %._crit_edge.us.3.prol.loopexit
  %pgocount9 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  %39 = add i64 %pgocount9, 1
  store i64 %39, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit, %.preheader.us.prol.loopexit, %.preheader3, %.preheader4.lr.ph
  %pgocount10 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %40 = add i64 %pgocount10, 1
  store i64 %40, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  ret void

._crit_edge.us.3:                                 ; preds = %._crit_edge.us.3.._crit_edge.us.3_crit_edge, %._crit_edge.us.3.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr31, %._crit_edge.us.3.preheader.new ], [ %indvars.iv.next.3.1, %._crit_edge.us.3.._crit_edge.us.3_crit_edge ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 0
  %scevgep14 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14, i8 0, i64 %28, i32 8, i1 false)
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %scevgep.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 0
  %scevgep14.1 = bitcast double* %scevgep.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.1, i8 0, i64 %28, i32 8, i1 false)
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %scevgep.2 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.1, i64 0
  %scevgep14.2 = bitcast double* %scevgep.2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.2, i8 0, i64 %28, i32 8, i1 false)
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %scevgep.3 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.2, i64 0
  %scevgep14.3 = bitcast double* %scevgep.3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.3, i8 0, i64 %28, i32 8, i1 false)
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %scevgep.132 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.3, i64 0
  %scevgep14.133 = bitcast double* %scevgep.132 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.133, i8 0, i64 %28, i32 8, i1 false)
  %indvars.iv.next.134 = add nsw i64 %indvars.iv, 5
  %scevgep.1.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.134, i64 0
  %scevgep14.1.1 = bitcast double* %scevgep.1.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.1.1, i8 0, i64 %28, i32 8, i1 false)
  %indvars.iv.next.1.1 = add nsw i64 %indvars.iv, 6
  %scevgep.2.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.1.1, i64 0
  %scevgep14.2.1 = bitcast double* %scevgep.2.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.2.1, i8 0, i64 %28, i32 8, i1 false)
  %indvars.iv.next.2.1 = add nsw i64 %indvars.iv, 7
  %scevgep.3.1 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next.2.1, i64 0
  %scevgep14.3.1 = bitcast double* %scevgep.3.1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep14.3.1, i8 0, i64 %28, i32 8, i1 false)
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next.3.1, %wide.trip.count.3
  br i1 %exitcond.3.1, label %._crit_edge7.loopexit.unr-lcssa, label %._crit_edge.us.3.._crit_edge.us.3_crit_edge

._crit_edge.us.3.._crit_edge.us.3_crit_edge:      ; preds = %._crit_edge.us.3
  %pgocount11 = load i64, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %41 = add i64 %pgocount11, 1
  store i64 %41, i64* getelementptr inbounds ([12 x i64], [12 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  br label %._crit_edge.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #0 {
  %6 = icmp sgt i32 %1, 0
  br i1 %6, label %.preheader5.lr.ph, label %._crit_edge31

.preheader5.lr.ph:                                ; preds = %5
  %7 = icmp sgt i32 %0, 0
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %0, 0
  %10 = icmp sgt i32 %0, 0
  %11 = add i32 %0, -1
  %12 = add i32 %1, -2
  %13 = zext i32 %12 to i64
  %14 = sext i32 %1 to i64
  %xtraiter = and i32 %0, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %15 = icmp ult i32 %11, 3
  %wide.trip.count.3 = zext i32 %0 to i64
  %xtraiter36 = and i32 %0, 1
  %lcmp.mod37 = icmp eq i32 %xtraiter36, 0
  %16 = icmp eq i32 %11, 0
  %wide.trip.count35.1 = zext i32 %0 to i64
  %xtraiter50 = and i32 %0, 1
  %lcmp.mod51 = icmp eq i32 %xtraiter50, 0
  %17 = icmp eq i32 %11, 0
  %xtraiter57 = and i32 %0, 1
  %lcmp.mod58 = icmp eq i32 %xtraiter57, 0
  %18 = icmp eq i32 %11, 0
  %wide.trip.count56.1 = zext i32 %0 to i64
  %wide.trip.count65 = zext i32 %1 to i64
  %wide.trip.count47.1 = zext i32 %0 to i64
  %wide.trip.count70 = zext i32 %1 to i64
  br label %.preheader5

.preheader5:                                      ; preds = %._crit_edge19, %.preheader5.lr.ph
  %indvars.iv68 = phi i64 [ 0, %.preheader5.lr.ph ], [ %indvars.iv.next69, %._crit_edge19 ]
  %indvars.iv61 = phi i64 [ 1, %.preheader5.lr.ph ], [ %indvars.iv.next62, %._crit_edge19 ]
  %19 = mul nuw nsw i64 %indvars.iv68, 1201
  %20 = add nuw nsw i64 %19, 1
  %scevgep = getelementptr [1200 x double], [1200 x double]* %3, i64 0, i64 %20
  %scevgep44 = bitcast double* %scevgep to i8*
  %21 = sub i64 %13, %indvars.iv68
  %22 = shl i64 %21, 3
  %23 = and i64 %22, 34359738360
  %24 = add nuw nsw i64 %23, 8
  br i1 %7, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader5
  %pgocount = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 12)
  %25 = add i64 %pgocount, 1
  store i64 %25, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 12)
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader..prol.preheader_crit_edge, %.prol.preheader.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader..prol.preheader_crit_edge ], [ 0, %.prol.preheader.preheader ]
  %.07.prol = phi double [ %29, %.prol.preheader..prol.preheader_crit_edge ], [ 0.000000e+00, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader..prol.preheader_crit_edge ], [ %xtraiter, %.prol.preheader.preheader ]
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.prol, i64 %indvars.iv68
  %27 = load double, double* %26, align 8
  %28 = fmul double %27, %27
  %29 = fadd double %.07.prol, %28
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader..prol.preheader_crit_edge, !llvm.loop !3

.prol.preheader..prol.preheader_crit_edge:        ; preds = %.prol.preheader
  %pgocount1 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 2)
  %30 = add i64 %pgocount1, 1
  store i64 %30, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 2)
  br label %.prol.preheader

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  %pgocount2 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 14)
  %31 = add i64 %pgocount2, 1
  store i64 %31, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 14)
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  %.07.unr = phi double [ 0.000000e+00, %.lr.ph ], [ %29, %.prol.loopexit.loopexit ]
  %.lcssa.unr = phi double [ undef, %.lr.ph ], [ %29, %.prol.loopexit.loopexit ]
  br i1 %15, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new..lr.ph.new_crit_edge, %.lr.ph.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.new..lr.ph.new_crit_edge ], [ %indvars.iv.unr, %.lr.ph.new.preheader ]
  %.07 = phi double [ %47, %.lr.ph.new..lr.ph.new_crit_edge ], [ %.07.unr, %.lr.ph.new.preheader ]
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv, i64 %indvars.iv68
  %33 = load double, double* %32, align 8
  %34 = fmul double %33, %33
  %35 = fadd double %.07, %34
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next, i64 %indvars.iv68
  %37 = load double, double* %36, align 8
  %38 = fmul double %37, %37
  %39 = fadd double %35, %38
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.1, i64 %indvars.iv68
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %41
  %43 = fadd double %39, %42
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.2, i64 %indvars.iv68
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, %45
  %47 = fadd double %43, %46
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %._crit_edge.loopexit, label %.lr.ph.new..lr.ph.new_crit_edge

.lr.ph.new..lr.ph.new_crit_edge:                  ; preds = %.lr.ph.new
  %pgocount3 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 4)
  %48 = add i64 %pgocount3, 1
  store i64 %48, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 4)
  br label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  %pgocount4 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 16)
  %49 = add i64 %pgocount4, 1
  store i64 %49, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %.preheader5
  %.0.lcssa = phi double [ 0.000000e+00, %.preheader5 ], [ %.lcssa.unr, %.prol.loopexit ], [ %47, %._crit_edge.loopexit ]
  %50 = tail call double @sqrt(double %.0.lcssa) #4
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv68, i64 %indvars.iv68
  store double %50, double* %51, align 8
  br i1 %8, label %.lr.ph10.preheader, label %._crit_edge..preheader4_crit_edge

._crit_edge..preheader4_crit_edge:                ; preds = %._crit_edge
  %pgocount5 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 6)
  %52 = add i64 %pgocount5, 1
  store i64 %52, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 6)
  br label %.preheader4

.lr.ph10.preheader:                               ; preds = %._crit_edge
  %pgocount6 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 13)
  %53 = add i64 %pgocount6, 1
  store i64 %53, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 13)
  br i1 %lcmp.mod37, label %.lr.ph10.prol.loopexit, label %.lr.ph10.prol

.lr.ph10.prol:                                    ; preds = %.lr.ph10.preheader
  %pgocount7 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 17)
  %54 = add i64 %pgocount7, 1
  store i64 %54, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 17)
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv68
  %56 = load double, double* %55, align 8
  %57 = load double, double* %51, align 8
  %58 = fdiv double %56, %57
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv68
  store double %58, double* %59, align 8
  br label %.lr.ph10.prol.loopexit

.lr.ph10.prol.loopexit:                           ; preds = %.lr.ph10.prol, %.lr.ph10.preheader
  %indvars.iv33.unr.ph = phi i64 [ 1, %.lr.ph10.prol ], [ 0, %.lr.ph10.preheader ]
  br i1 %16, label %.preheader4, label %.lr.ph10.preheader79

.lr.ph10.preheader79:                             ; preds = %.lr.ph10.prol.loopexit
  br label %.lr.ph10

.preheader4.loopexit:                             ; preds = %.lr.ph10
  %pgocount8 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 15)
  %60 = add i64 %pgocount8, 1
  store i64 %60, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 15)
  br label %.preheader4

.preheader4:                                      ; preds = %._crit_edge..preheader4_crit_edge, %.preheader4.loopexit, %.lr.ph10.prol.loopexit
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %61 = icmp slt i64 %indvars.iv.next69, %14
  br i1 %61, label %.lr.ph18, label %._crit_edge19

.lr.ph18:                                         ; preds = %.preheader4
  br i1 %9, label %.lr.ph18.split.us.preheader, label %._crit_edge19.loopexit32

.lr.ph18.split.us.preheader:                      ; preds = %.lr.ph18
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv68
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv68
  br label %.lr.ph18.split.us

.lr.ph18.split.us:                                ; preds = %.loopexit.us, %.lr.ph18.split.us.preheader
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %.loopexit.us ], [ %indvars.iv61, %.lr.ph18.split.us.preheader ]
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv68, i64 %indvars.iv63
  store double 0.000000e+00, double* %64, align 8
  br i1 %lcmp.mod51, label %.prol.loopexit49, label %.prol.preheader48

.prol.preheader48:                                ; preds = %.lr.ph18.split.us
  %pgocount9 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 9)
  %65 = add i64 %pgocount9, 1
  store i64 %65, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 9)
  %66 = load double, double* %63, align 8
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv63
  %68 = load double, double* %67, align 8
  %69 = fmul double %66, %68
  %70 = load double, double* %64, align 8
  %71 = fadd double %70, %69
  store double %71, double* %64, align 8
  br label %.prol.loopexit49

.prol.loopexit49:                                 ; preds = %.prol.preheader48, %.lr.ph18.split.us
  %indvars.iv45.unr.ph = phi i64 [ 1, %.prol.preheader48 ], [ 0, %.lr.ph18.split.us ]
  br i1 %17, label %..preheader_crit_edge.us, label %.lr.ph18.split.us.new.preheader

.lr.ph18.split.us.new.preheader:                  ; preds = %.prol.loopexit49
  br label %.lr.ph18.split.us.new

.lr.ph15.us:                                      ; preds = %.lr.ph15.us..lr.ph15.us_crit_edge, %.lr.ph15.us.preheader78
  %indvars.iv54 = phi i64 [ %indvars.iv.next55.1, %.lr.ph15.us..lr.ph15.us_crit_edge ], [ %indvars.iv54.unr.ph, %.lr.ph15.us.preheader78 ]
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv54, i64 %indvars.iv63
  %73 = load double, double* %72, align 8
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv68
  %75 = load double, double* %74, align 8
  %76 = load double, double* %64, align 8
  %77 = fmul double %75, %76
  %78 = fsub double %73, %77
  store double %78, double* %72, align 8
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next55, i64 %indvars.iv63
  %80 = load double, double* %79, align 8
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next55, i64 %indvars.iv68
  %82 = load double, double* %81, align 8
  %83 = load double, double* %64, align 8
  %84 = fmul double %82, %83
  %85 = fsub double %80, %84
  store double %85, double* %79, align 8
  %indvars.iv.next55.1 = add nsw i64 %indvars.iv54, 2
  %exitcond.160 = icmp eq i64 %indvars.iv.next55.1, %wide.trip.count56.1
  br i1 %exitcond.160, label %.loopexit.us.loopexit, label %.lr.ph15.us..lr.ph15.us_crit_edge

.lr.ph15.us..lr.ph15.us_crit_edge:                ; preds = %.lr.ph15.us
  %pgocount10 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 1)
  %86 = add i64 %pgocount10, 1
  store i64 %86, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 1)
  br label %.lr.ph15.us

.lr.ph18.split.us.new:                            ; preds = %.lr.ph18.split.us.new..lr.ph18.split.us.new_crit_edge, %.lr.ph18.split.us.new.preheader
  %indvars.iv45 = phi i64 [ %indvars.iv.next46.1, %.lr.ph18.split.us.new..lr.ph18.split.us.new_crit_edge ], [ %indvars.iv45.unr.ph, %.lr.ph18.split.us.new.preheader ]
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv45, i64 %indvars.iv68
  %88 = load double, double* %87, align 8
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv45, i64 %indvars.iv63
  %90 = load double, double* %89, align 8
  %91 = fmul double %88, %90
  %92 = load double, double* %64, align 8
  %93 = fadd double %92, %91
  store double %93, double* %64, align 8
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %94 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next46, i64 %indvars.iv68
  %95 = load double, double* %94, align 8
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next46, i64 %indvars.iv63
  %97 = load double, double* %96, align 8
  %98 = fmul double %95, %97
  %99 = load double, double* %64, align 8
  %100 = fadd double %99, %98
  store double %100, double* %64, align 8
  %indvars.iv.next46.1 = add nsw i64 %indvars.iv45, 2
  %exitcond.153 = icmp eq i64 %indvars.iv.next46.1, %wide.trip.count47.1
  br i1 %exitcond.153, label %..preheader_crit_edge.us.loopexit, label %.lr.ph18.split.us.new..lr.ph18.split.us.new_crit_edge

.lr.ph18.split.us.new..lr.ph18.split.us.new_crit_edge: ; preds = %.lr.ph18.split.us.new
  %pgocount11 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 0)
  %101 = add i64 %pgocount11, 1
  store i64 %101, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 0)
  br label %.lr.ph18.split.us.new

.loopexit.us.loopexit:                            ; preds = %.lr.ph15.us
  br label %.loopexit.us

.loopexit.us:                                     ; preds = %..preheader_crit_edge.us..loopexit.us_crit_edge, %.lr.ph15.us.prol.loopexit, %.loopexit.us.loopexit
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond = icmp eq i64 %indvars.iv.next64, %wide.trip.count65
  br i1 %exitcond, label %._crit_edge19.loopexit, label %.lr.ph18.split.us

..preheader_crit_edge.us.loopexit:                ; preds = %.lr.ph18.split.us.new
  %pgocount12 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 7)
  %102 = add i64 %pgocount12, 1
  store i64 %102, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 7)
  br label %..preheader_crit_edge.us

..preheader_crit_edge.us:                         ; preds = %..preheader_crit_edge.us.loopexit, %.prol.loopexit49
  br i1 %10, label %.lr.ph15.us.preheader, label %..preheader_crit_edge.us..loopexit.us_crit_edge

..preheader_crit_edge.us..loopexit.us_crit_edge:  ; preds = %..preheader_crit_edge.us
  %pgocount13 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 5)
  %103 = add i64 %pgocount13, 1
  store i64 %103, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 5)
  br label %.loopexit.us

.lr.ph15.us.preheader:                            ; preds = %..preheader_crit_edge.us
  %pgocount14 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 8)
  %104 = add i64 %pgocount14, 1
  store i64 %104, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 8)
  br i1 %lcmp.mod58, label %.lr.ph15.us.prol.loopexit, label %.lr.ph15.us.prol

.lr.ph15.us.prol:                                 ; preds = %.lr.ph15.us.preheader
  %pgocount15 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 11)
  %105 = add i64 %pgocount15, 1
  store i64 %105, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 11)
  %106 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 0, i64 %indvars.iv63
  %107 = load double, double* %106, align 8
  %108 = load double, double* %62, align 8
  %109 = load double, double* %64, align 8
  %110 = fmul double %108, %109
  %111 = fsub double %107, %110
  store double %111, double* %106, align 8
  br label %.lr.ph15.us.prol.loopexit

.lr.ph15.us.prol.loopexit:                        ; preds = %.lr.ph15.us.prol, %.lr.ph15.us.preheader
  %indvars.iv54.unr.ph = phi i64 [ 1, %.lr.ph15.us.prol ], [ 0, %.lr.ph15.us.preheader ]
  br i1 %18, label %.loopexit.us, label %.lr.ph15.us.preheader78

.lr.ph15.us.preheader78:                          ; preds = %.lr.ph15.us.prol.loopexit
  %pgocount16 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 10)
  %112 = add i64 %pgocount16, 1
  store i64 %112, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 10)
  br label %.lr.ph15.us

.lr.ph10:                                         ; preds = %.lr.ph10..lr.ph10_crit_edge, %.lr.ph10.preheader79
  %indvars.iv33 = phi i64 [ %indvars.iv.next34.1, %.lr.ph10..lr.ph10_crit_edge ], [ %indvars.iv33.unr.ph, %.lr.ph10.preheader79 ]
  %113 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv33, i64 %indvars.iv68
  %114 = load double, double* %113, align 8
  %115 = load double, double* %51, align 8
  %116 = fdiv double %114, %115
  %117 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv33, i64 %indvars.iv68
  store double %116, double* %117, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %118 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next34, i64 %indvars.iv68
  %119 = load double, double* %118, align 8
  %120 = load double, double* %51, align 8
  %121 = fdiv double %119, %120
  %122 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next34, i64 %indvars.iv68
  store double %121, double* %122, align 8
  %indvars.iv.next34.1 = add nsw i64 %indvars.iv33, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next34.1, %wide.trip.count35.1
  br i1 %exitcond.1, label %.preheader4.loopexit, label %.lr.ph10..lr.ph10_crit_edge

.lr.ph10..lr.ph10_crit_edge:                      ; preds = %.lr.ph10
  %pgocount17 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 3)
  %123 = add i64 %pgocount17, 1
  store i64 %123, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 3)
  br label %.lr.ph10

._crit_edge19.loopexit32:                         ; preds = %.lr.ph18
  %pgocount18 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 19)
  %124 = add i64 %pgocount18, 1
  store i64 %124, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 19)
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep44, i8 0, i64 %24, i32 8, i1 false)
  br label %._crit_edge19

._crit_edge19.loopexit:                           ; preds = %.loopexit.us
  %pgocount19 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 18)
  %125 = add i64 %pgocount19, 1
  store i64 %125, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 18)
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit, %._crit_edge19.loopexit32, %.preheader4
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next69, %wide.trip.count70
  br i1 %exitcond71, label %._crit_edge31.loopexit, label %.preheader5

._crit_edge31.loopexit:                           ; preds = %._crit_edge19
  %pgocount20 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 21)
  %126 = add i64 %pgocount20, 1
  store i64 %126, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 21)
  br label %._crit_edge31

._crit_edge31:                                    ; preds = %._crit_edge31.loopexit, %5
  %pgocount21 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 20)
  %127 = add i64 %pgocount21, 1
  store i64 %127, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_B.ll_kernel_gramschmidt, i64 0, i64 20)
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #6
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.preheader4.us.preheader, label %._crit_edge12

.preheader4.us.preheader:                         ; preds = %4
  %10 = sext i32 %1 to i64
  %wide.trip.count21 = zext i32 %1 to i64
  %wide.trip.count25 = zext i32 %1 to i64
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge10.us, %.preheader4.us.preheader
  %indvars.iv23 = phi i64 [ 0, %.preheader4.us.preheader ], [ %indvars.iv.next24, %._crit_edge10.us ]
  %11 = mul nsw i64 %indvars.iv23, %10
  br label %12

; <label>:12:                                     ; preds = %21, %.preheader4.us
  %indvars.iv19 = phi i64 [ 0, %.preheader4.us ], [ %indvars.iv.next20, %21 ]
  %13 = add nsw i64 %indvars.iv19, %11
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %18, label %._crit_edge

._crit_edge:                                      ; preds = %12
  %pgocount = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %17 = add i64 %pgocount, 1
  store i64 %17, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  br label %21

; <label>:18:                                     ; preds = %12
  %pgocount2 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %19 = add i64 %pgocount2, 1
  store i64 %19, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %20) #6
  br label %21

; <label>:21:                                     ; preds = %._crit_edge, %18
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv23, i64 %indvars.iv19
  %24 = load double, double* %23, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %24) #6
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next20, %wide.trip.count21
  br i1 %exitcond22, label %._crit_edge10.us, label %12

._crit_edge10.us:                                 ; preds = %21
  %pgocount3 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_print_array, i64 0, i64 4)
  %26 = add i64 %pgocount3, 1
  store i64 %26, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_print_array, i64 0, i64 4)
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next24, %wide.trip.count25
  br i1 %exitcond26, label %._crit_edge12.loopexit, label %.preheader4.us

._crit_edge12.loopexit:                           ; preds = %._crit_edge10.us
  %pgocount4 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_print_array, i64 0, i64 7)
  %27 = add i64 %pgocount4, 1
  store i64 %27, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_print_array, i64 0, i64 7)
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %4
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %31 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %32 = icmp sgt i32 %0, 0
  %33 = icmp sgt i32 %1, 0
  %or.cond = and i1 %32, %33
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge7

.preheader.us.preheader:                          ; preds = %._crit_edge12
  %34 = sext i32 %1 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count16 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv14 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next15, %._crit_edge.us ]
  %35 = mul nsw i64 %indvars.iv14, %34
  br label %36

; <label>:36:                                     ; preds = %45, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %45 ]
  %37 = add nsw i64 %indvars.iv, %35
  %38 = trunc i64 %37 to i32
  %39 = srem i32 %38, 20
  %40 = icmp eq i32 %39, 0
  br i1 %40, label %42, label %._crit_edge1

._crit_edge1:                                     ; preds = %36
  %pgocount5 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %41 = add i64 %pgocount5, 1
  store i64 %41, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  br label %45

; <label>:42:                                     ; preds = %36
  %pgocount6 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %43 = add i64 %pgocount6, 1
  store i64 %43, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %44) #6
  br label %45

; <label>:45:                                     ; preds = %._crit_edge1, %42
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv14, i64 %indvars.iv
  %48 = load double, double* %47, align 8
  %49 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %48) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %36

._crit_edge.us:                                   ; preds = %45
  %pgocount7 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_print_array, i64 0, i64 5)
  %50 = add i64 %pgocount7, 1
  store i64 %50, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_print_array, i64 0, i64 5)
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, %wide.trip.count16
  br i1 %exitcond17, label %._crit_edge7.loopexit, label %.preheader.us

._crit_edge7.loopexit:                            ; preds = %._crit_edge.us
  %pgocount8 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_print_array, i64 0, i64 8)
  %51 = add i64 %pgocount8, 1
  store i64 %51, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_print_array, i64 0, i64 8)
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit, %._crit_edge12
  %pgocount9 = load i64, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_print_array, i64 0, i64 6)
  %52 = add i64 %pgocount9, 1
  store i64 %52, i64* getelementptr inbounds ([9 x i64], [9 x i64]* @__profc_B.ll_print_array, i64 0, i64 6)
  %53 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %54 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %53, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %55 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %56 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %55) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

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
