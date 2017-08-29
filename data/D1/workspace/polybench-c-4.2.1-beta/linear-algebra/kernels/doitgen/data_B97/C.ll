; ModuleID = 'B.ll'
source_filename = "doitgen.c"
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
@__profn_kernel_doitgen = private constant [14 x i8] c"kernel_doitgen"
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_kernel_doitgen = private global [22 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_kernel_doitgen = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7952097593059838232, i64 274972786688, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i32 0, i32 0), i8* bitcast (void (i32, i32, i32, [140 x [160 x double]]*, [160 x double]*, double*)* @kernel_doitgen to i8*), i8* null, i32 22, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 32414643582, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [14 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 174347770393, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 14, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 96849342469, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [54 x i8] c"4\00kernel_doitgen\01main\01B.ll:init_array\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_kernel_doitgen to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([54 x i8], [54 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline norecurse nounwind uwtable
define void @kernel_doitgen(i32, i32, i32, [140 x [160 x double]]* nocapture, [160 x double]* nocapture readonly, double* nocapture) local_unnamed_addr #0 {
  %7 = bitcast double* %5 to i8*
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader5.lr.ph, label %._crit_edge21

.preheader5.lr.ph:                                ; preds = %6
  %9 = icmp sgt i32 %1, 0
  %10 = icmp sgt i32 %2, 0
  %11 = icmp sgt i32 %2, 0
  %12 = icmp sgt i32 %2, 0
  %13 = add i32 %2, -1
  %14 = zext i32 %13 to i64
  %15 = shl nuw nsw i64 %14, 3
  %16 = add nuw nsw i64 %15, 8
  %xtraiter55 = and i32 %2, 3
  %lcmp.mod56 = icmp eq i32 %xtraiter55, 0
  %17 = icmp ult i32 %13, 3
  %wide.trip.count48.3 = zext i32 %2 to i64
  %wide.trip.count60 = zext i32 %1 to i64
  %xtraiter40 = and i32 %2, 1
  %lcmp.mod41 = icmp eq i32 %xtraiter40, 0
  %18 = icmp eq i32 %13, 0
  %wide.trip.count44 = zext i32 %2 to i64
  %wide.trip.count36.1 = zext i32 %2 to i64
  %xtraiter = and i32 %2, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %19 = icmp ult i32 %13, 3
  %wide.trip.count.3 = zext i32 %2 to i64
  %wide.trip.count29 = zext i32 %1 to i64
  %wide.trip.count64 = zext i32 %0 to i64
  br label %.preheader5

.preheader5:                                      ; preds = %._crit_edge13, %.preheader5.lr.ph
  %indvars.iv62 = phi i64 [ 0, %.preheader5.lr.ph ], [ %indvars.iv.next63, %._crit_edge13 ]
  br i1 %9, label %.preheader4.lr.ph, label %.preheader5.._crit_edge13_crit_edge

.preheader5.._crit_edge13_crit_edge:              ; preds = %.preheader5
  %pgocount = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 7)
  %20 = add i64 %pgocount, 1
  store i64 %20, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 7)
  br label %._crit_edge13

.preheader4.lr.ph:                                ; preds = %.preheader5
  br i1 %10, label %.preheader4.us.preheader, label %.preheader4.preheader

.preheader4.preheader:                            ; preds = %.preheader4.lr.ph
  br label %.preheader4

.preheader4.us.preheader:                         ; preds = %.preheader4.lr.ph
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge11.us, %.preheader4.us.preheader
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %._crit_edge11.us ], [ 0, %.preheader4.us.preheader ]
  br i1 %11, label %.lr.ph.us.us.preheader, label %..preheader_crit_edge.us.loopexit22

.lr.ph.us.us.preheader:                           ; preds = %.preheader4.us
  %21 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv58, i64 0
  br label %.lr.ph.us.us

._crit_edge11.us.loopexit:                        ; preds = %.lr.ph10.us.new
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %.prol.loopexit54, %..preheader_crit_edge.us, %._crit_edge11.us.loopexit
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next59, %wide.trip.count60
  br i1 %exitcond61, label %._crit_edge13.loopexit, label %.preheader4.us

.lr.ph10.us.new:                                  ; preds = %.lr.ph10.us.new..lr.ph10.us.new_crit_edge, %.lr.ph10.us.new.preheader
  %indvars.iv46 = phi i64 [ %indvars.iv.next47.3, %.lr.ph10.us.new..lr.ph10.us.new_crit_edge ], [ %indvars.iv46.unr, %.lr.ph10.us.new.preheader ]
  %22 = getelementptr inbounds double, double* %5, i64 %indvars.iv46
  %23 = bitcast double* %22 to i64*
  %24 = load i64, i64* %23, align 8
  %25 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv58, i64 %indvars.iv46
  %26 = bitcast double* %25 to i64*
  store i64 %24, i64* %26, align 8
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %27 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next47
  %28 = bitcast double* %27 to i64*
  %29 = load i64, i64* %28, align 8
  %30 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv58, i64 %indvars.iv.next47
  %31 = bitcast double* %30 to i64*
  store i64 %29, i64* %31, align 8
  %indvars.iv.next47.1 = add nsw i64 %indvars.iv46, 2
  %32 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next47.1
  %33 = bitcast double* %32 to i64*
  %34 = load i64, i64* %33, align 8
  %35 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv58, i64 %indvars.iv.next47.1
  %36 = bitcast double* %35 to i64*
  store i64 %34, i64* %36, align 8
  %indvars.iv.next47.2 = add nsw i64 %indvars.iv46, 3
  %37 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next47.2
  %38 = bitcast double* %37 to i64*
  %39 = load i64, i64* %38, align 8
  %40 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv58, i64 %indvars.iv.next47.2
  %41 = bitcast double* %40 to i64*
  store i64 %39, i64* %41, align 8
  %indvars.iv.next47.3 = add nsw i64 %indvars.iv46, 4
  %exitcond49.3 = icmp eq i64 %indvars.iv.next47.3, %wide.trip.count48.3
  br i1 %exitcond49.3, label %._crit_edge11.us.loopexit, label %.lr.ph10.us.new..lr.ph10.us.new_crit_edge

.lr.ph10.us.new..lr.ph10.us.new_crit_edge:        ; preds = %.lr.ph10.us.new
  %pgocount1 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 2)
  %42 = add i64 %pgocount1, 1
  store i64 %42, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 2)
  br label %.lr.ph10.us.new

..preheader_crit_edge.us.loopexit22:              ; preds = %.preheader4.us
  %pgocount2 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 13)
  %43 = add i64 %pgocount2, 1
  store i64 %43, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 13)
  call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 %16, i32 8, i1 false)
  br label %..preheader_crit_edge.us

..preheader_crit_edge.us.loopexit:                ; preds = %._crit_edge.us.us
  %pgocount3 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 11)
  %44 = add i64 %pgocount3, 1
  store i64 %44, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 11)
  br label %..preheader_crit_edge.us

..preheader_crit_edge.us:                         ; preds = %..preheader_crit_edge.us.loopexit, %..preheader_crit_edge.us.loopexit22
  br i1 %12, label %.lr.ph10.us, label %._crit_edge11.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph.us.us.preheader
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %._crit_edge.us.us ], [ 0, %.lr.ph.us.us.preheader ]
  %45 = getelementptr inbounds double, double* %5, i64 %indvars.iv42
  store double 0.000000e+00, double* %45, align 8
  br i1 %lcmp.mod41, label %.prol.loopexit39, label %.prol.preheader38

.prol.preheader38:                                ; preds = %.lr.ph.us.us
  %pgocount4 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 9)
  %46 = add i64 %pgocount4, 1
  store i64 %46, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 9)
  %47 = load double, double* %21, align 8
  %48 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv42
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = load double, double* %45, align 8
  %52 = fadd double %51, %50
  store double %52, double* %45, align 8
  br label %.prol.loopexit39

.prol.loopexit39:                                 ; preds = %.prol.preheader38, %.lr.ph.us.us
  %indvars.iv34.unr.ph = phi i64 [ 1, %.prol.preheader38 ], [ 0, %.lr.ph.us.us ]
  br i1 %18, label %.prol.loopexit39.._crit_edge.us.us_crit_edge, label %.lr.ph.us.us.new.preheader

.prol.loopexit39.._crit_edge.us.us_crit_edge:     ; preds = %.prol.loopexit39
  %pgocount5 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 3)
  %53 = add i64 %pgocount5, 1
  store i64 %53, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 3)
  br label %._crit_edge.us.us

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit39
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  %pgocount6 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 8)
  %54 = add i64 %pgocount6, 1
  store i64 %54, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 8)
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %.prol.loopexit39.._crit_edge.us.us_crit_edge, %._crit_edge.us.us.loopexit
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next43, %wide.trip.count44
  br i1 %exitcond45, label %..preheader_crit_edge.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge, %.lr.ph.us.us.new.preheader
  %indvars.iv34 = phi i64 [ %indvars.iv.next35.1, %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge ], [ %indvars.iv34.unr.ph, %.lr.ph.us.us.new.preheader ]
  %55 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv58, i64 %indvars.iv34
  %56 = load double, double* %55, align 8
  %57 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv34, i64 %indvars.iv42
  %58 = load double, double* %57, align 8
  %59 = fmul double %56, %58
  %60 = load double, double* %45, align 8
  %61 = fadd double %60, %59
  store double %61, double* %45, align 8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %62 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv58, i64 %indvars.iv.next35
  %63 = load double, double* %62, align 8
  %64 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next35, i64 %indvars.iv42
  %65 = load double, double* %64, align 8
  %66 = fmul double %63, %65
  %67 = load double, double* %45, align 8
  %68 = fadd double %67, %66
  store double %68, double* %45, align 8
  %indvars.iv.next35.1 = add nsw i64 %indvars.iv34, 2
  %exitcond37.1 = icmp eq i64 %indvars.iv.next35.1, %wide.trip.count36.1
  br i1 %exitcond37.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge

.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge:      ; preds = %.lr.ph.us.us.new
  %pgocount7 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 0)
  %69 = add i64 %pgocount7, 1
  store i64 %69, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 0)
  br label %.lr.ph.us.us.new

.lr.ph10.us:                                      ; preds = %..preheader_crit_edge.us
  %pgocount8 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 10)
  %70 = add i64 %pgocount8, 1
  store i64 %70, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 10)
  br i1 %lcmp.mod56, label %.prol.loopexit54, label %.prol.preheader53.preheader

.prol.preheader53.preheader:                      ; preds = %.lr.ph10.us
  br label %.prol.preheader53

.prol.preheader53:                                ; preds = %.prol.preheader53..prol.preheader53_crit_edge, %.prol.preheader53.preheader
  %indvars.iv46.prol = phi i64 [ %indvars.iv.next47.prol, %.prol.preheader53..prol.preheader53_crit_edge ], [ 0, %.prol.preheader53.preheader ]
  %prol.iter57 = phi i32 [ %prol.iter57.sub, %.prol.preheader53..prol.preheader53_crit_edge ], [ %xtraiter55, %.prol.preheader53.preheader ]
  %71 = getelementptr inbounds double, double* %5, i64 %indvars.iv46.prol
  %72 = bitcast double* %71 to i64*
  %73 = load i64, i64* %72, align 8
  %74 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv58, i64 %indvars.iv46.prol
  %75 = bitcast double* %74 to i64*
  store i64 %73, i64* %75, align 8
  %indvars.iv.next47.prol = add nuw nsw i64 %indvars.iv46.prol, 1
  %prol.iter57.sub = add i32 %prol.iter57, -1
  %prol.iter57.cmp = icmp eq i32 %prol.iter57.sub, 0
  br i1 %prol.iter57.cmp, label %.prol.loopexit54.loopexit, label %.prol.preheader53..prol.preheader53_crit_edge, !llvm.loop !1

.prol.preheader53..prol.preheader53_crit_edge:    ; preds = %.prol.preheader53
  %pgocount9 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 1)
  %76 = add i64 %pgocount9, 1
  store i64 %76, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 1)
  br label %.prol.preheader53

.prol.loopexit54.loopexit:                        ; preds = %.prol.preheader53
  %pgocount10 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 12)
  %77 = add i64 %pgocount10, 1
  store i64 %77, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 12)
  br label %.prol.loopexit54

.prol.loopexit54:                                 ; preds = %.prol.loopexit54.loopexit, %.lr.ph10.us
  %indvars.iv46.unr = phi i64 [ 0, %.lr.ph10.us ], [ %indvars.iv.next47.prol, %.prol.loopexit54.loopexit ]
  br i1 %17, label %._crit_edge11.us, label %.lr.ph10.us.new.preheader

.lr.ph10.us.new.preheader:                        ; preds = %.prol.loopexit54
  %pgocount11 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 15)
  %78 = add i64 %pgocount11, 1
  store i64 %78, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 15)
  br label %.lr.ph10.us.new

.preheader4:                                      ; preds = %._crit_edge11, %.preheader4.preheader
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %._crit_edge11 ], [ 0, %.preheader4.preheader ]
  br i1 %12, label %.lr.ph10, label %.preheader4.._crit_edge11_crit_edge

.preheader4.._crit_edge11_crit_edge:              ; preds = %.preheader4
  %pgocount12 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 6)
  %79 = add i64 %pgocount12, 1
  store i64 %79, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 6)
  br label %._crit_edge11

.lr.ph10:                                         ; preds = %.preheader4
  %pgocount13 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 14)
  %80 = add i64 %pgocount13, 1
  store i64 %80, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 14)
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.lr.ph10
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader..prol.preheader_crit_edge, %.prol.preheader.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader..prol.preheader_crit_edge ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader..prol.preheader_crit_edge ], [ %xtraiter, %.prol.preheader.preheader ]
  %81 = getelementptr inbounds double, double* %5, i64 %indvars.iv.prol
  %82 = bitcast double* %81 to i64*
  %83 = load i64, i64* %82, align 8
  %84 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv27, i64 %indvars.iv.prol
  %85 = bitcast double* %84 to i64*
  store i64 %83, i64* %85, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader..prol.preheader_crit_edge, !llvm.loop !3

.prol.preheader..prol.preheader_crit_edge:        ; preds = %.prol.preheader
  %pgocount14 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 4)
  %86 = add i64 %pgocount14, 1
  store i64 %86, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 4)
  br label %.prol.preheader

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  %pgocount15 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 16)
  %87 = add i64 %pgocount15, 1
  store i64 %87, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 16)
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.lr.ph10
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph10 ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  br i1 %19, label %._crit_edge11, label %.lr.ph10.new.preheader

.lr.ph10.new.preheader:                           ; preds = %.prol.loopexit
  br label %.lr.ph10.new

.lr.ph10.new:                                     ; preds = %.lr.ph10.new..lr.ph10.new_crit_edge, %.lr.ph10.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph10.new..lr.ph10.new_crit_edge ], [ %indvars.iv.unr, %.lr.ph10.new.preheader ]
  %88 = getelementptr inbounds double, double* %5, i64 %indvars.iv
  %89 = bitcast double* %88 to i64*
  %90 = load i64, i64* %89, align 8
  %91 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv27, i64 %indvars.iv
  %92 = bitcast double* %91 to i64*
  store i64 %90, i64* %92, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %93 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next
  %94 = bitcast double* %93 to i64*
  %95 = load i64, i64* %94, align 8
  %96 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv27, i64 %indvars.iv.next
  %97 = bitcast double* %96 to i64*
  store i64 %95, i64* %97, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %98 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next.1
  %99 = bitcast double* %98 to i64*
  %100 = load i64, i64* %99, align 8
  %101 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv27, i64 %indvars.iv.next.1
  %102 = bitcast double* %101 to i64*
  store i64 %100, i64* %102, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %103 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next.2
  %104 = bitcast double* %103 to i64*
  %105 = load i64, i64* %104, align 8
  %106 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv27, i64 %indvars.iv.next.2
  %107 = bitcast double* %106 to i64*
  store i64 %105, i64* %107, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %._crit_edge11.loopexit, label %.lr.ph10.new..lr.ph10.new_crit_edge

.lr.ph10.new..lr.ph10.new_crit_edge:              ; preds = %.lr.ph10.new
  %pgocount16 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 5)
  %108 = add i64 %pgocount16, 1
  store i64 %108, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 5)
  br label %.lr.ph10.new

._crit_edge11.loopexit:                           ; preds = %.lr.ph10.new
  %pgocount17 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 17)
  %109 = add i64 %pgocount17, 1
  store i64 %109, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 17)
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %.preheader4.._crit_edge11_crit_edge, %._crit_edge11.loopexit, %.prol.loopexit
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond = icmp eq i64 %indvars.iv.next28, %wide.trip.count29
  br i1 %exitcond, label %._crit_edge13.loopexit68, label %.preheader4

._crit_edge13.loopexit:                           ; preds = %._crit_edge11.us
  %pgocount18 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 18)
  %110 = add i64 %pgocount18, 1
  store i64 %110, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 18)
  br label %._crit_edge13

._crit_edge13.loopexit68:                         ; preds = %._crit_edge11
  %pgocount19 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 19)
  %111 = add i64 %pgocount19, 1
  store i64 %111, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 19)
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %.preheader5.._crit_edge13_crit_edge, %._crit_edge13.loopexit68, %._crit_edge13.loopexit
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next63, %wide.trip.count64
  br i1 %exitcond65, label %._crit_edge21.loopexit, label %.preheader5

._crit_edge21.loopexit:                           ; preds = %._crit_edge13
  %pgocount20 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 21)
  %112 = add i64 %pgocount20, 1
  store i64 %112, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 21)
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21.loopexit, %6
  %pgocount21 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 20)
  %113 = add i64 %pgocount21, 1
  store i64 %113, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 20)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #1 {
  %3 = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %6 = bitcast i8* %3 to [140 x [160 x double]]*
  %7 = bitcast i8* %5 to [160 x double]*
  tail call fastcc void @init_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to double*
  tail call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7, double* %8)
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
  tail call fastcc void @print_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6)
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

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, [140 x [160 x double]]* nocapture, [160 x double]* nocapture) unnamed_addr #0 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader6.lr.ph, label %.preheader4

.preheader6.lr.ph:                                ; preds = %5
  %pgocount = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 11)
  %7 = add i64 %pgocount, 1
  store i64 %7, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 11)
  %8 = icmp sgt i32 %1, 0
  %9 = icmp sgt i32 %2, 0
  %10 = sitofp i32 %2 to double
  br i1 %8, label %.preheader6.us.preheader, label %.preheader4

.preheader6.us.preheader:                         ; preds = %.preheader6.lr.ph
  %wide.trip.count46 = zext i32 %0 to i64
  %xtraiter38 = and i32 %2, 1
  %lcmp.mod39 = icmp eq i32 %xtraiter38, 0
  %11 = icmp eq i32 %2, 1
  %wide.trip.count42 = zext i32 %1 to i64
  %wide.trip.count34.1 = zext i32 %2 to i64
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %._crit_edge15.us, %.preheader6.us.preheader
  %indvars.iv44 = phi i64 [ %indvars.iv.next45, %._crit_edge15.us ], [ 0, %.preheader6.us.preheader ]
  br i1 %9, label %.preheader5.us.us.preheader, label %.preheader6.us.._crit_edge15.us_crit_edge

.preheader6.us.._crit_edge15.us_crit_edge:        ; preds = %.preheader6.us
  %pgocount1 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %12 = add i64 %pgocount1, 1
  store i64 %12, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  br label %._crit_edge15.us

.preheader5.us.us.preheader:                      ; preds = %.preheader6.us
  br label %.preheader5.us.us

._crit_edge15.us.loopexit:                        ; preds = %._crit_edge13.us.us
  %pgocount2 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  %13 = add i64 %pgocount2, 1
  store i64 %13, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  br label %._crit_edge15.us

._crit_edge15.us:                                 ; preds = %.preheader6.us.._crit_edge15.us_crit_edge, %._crit_edge15.us.loopexit
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next45, %wide.trip.count46
  br i1 %exitcond47, label %.preheader4.loopexit, label %.preheader6.us

.preheader5.us.us:                                ; preds = %._crit_edge13.us.us, %.preheader5.us.us.preheader
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %._crit_edge13.us.us ], [ 0, %.preheader5.us.us.preheader ]
  %14 = mul nuw nsw i64 %indvars.iv40, %indvars.iv44
  br i1 %lcmp.mod39, label %.prol.loopexit37, label %.prol.preheader36

.prol.preheader36:                                ; preds = %.preheader5.us.us
  %pgocount3 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %15 = add i64 %pgocount3, 1
  store i64 %15, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %16 = trunc i64 %14 to i32
  %17 = srem i32 %16, %2
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, %10
  %20 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv44, i64 %indvars.iv40, i64 0
  store double %19, double* %20, align 8
  br label %.prol.loopexit37

.prol.loopexit37:                                 ; preds = %.prol.preheader36, %.preheader5.us.us
  %indvars.iv32.unr.ph = phi i64 [ 1, %.prol.preheader36 ], [ 0, %.preheader5.us.us ]
  br i1 %11, label %.prol.loopexit37.._crit_edge13.us.us_crit_edge, label %.preheader5.us.us.new.preheader

.prol.loopexit37.._crit_edge13.us.us_crit_edge:   ; preds = %.prol.loopexit37
  %pgocount4 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %21 = add i64 %pgocount4, 1
  store i64 %21, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  br label %._crit_edge13.us.us

.preheader5.us.us.new.preheader:                  ; preds = %.prol.loopexit37
  br label %.preheader5.us.us.new

._crit_edge13.us.us.loopexit:                     ; preds = %.preheader5.us.us.new
  %pgocount5 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %22 = add i64 %pgocount5, 1
  store i64 %22, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  br label %._crit_edge13.us.us

._crit_edge13.us.us:                              ; preds = %.prol.loopexit37.._crit_edge13.us.us_crit_edge, %._crit_edge13.us.us.loopexit
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next41, %wide.trip.count42
  br i1 %exitcond43, label %._crit_edge15.us.loopexit, label %.preheader5.us.us

.preheader5.us.us.new:                            ; preds = %.preheader5.us.us.new..preheader5.us.us.new_crit_edge, %.preheader5.us.us.new.preheader
  %indvars.iv32 = phi i64 [ %indvars.iv.next33.1, %.preheader5.us.us.new..preheader5.us.us.new_crit_edge ], [ %indvars.iv32.unr.ph, %.preheader5.us.us.new.preheader ]
  %23 = add nsw i64 %indvars.iv32, %14
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, %2
  %26 = sitofp i32 %25 to double
  %27 = fdiv double %26, %10
  %28 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv44, i64 %indvars.iv40, i64 %indvars.iv32
  store double %27, double* %28, align 8
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %29 = add nsw i64 %indvars.iv.next33, %14
  %30 = trunc i64 %29 to i32
  %31 = srem i32 %30, %2
  %32 = sitofp i32 %31 to double
  %33 = fdiv double %32, %10
  %34 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv44, i64 %indvars.iv40, i64 %indvars.iv.next33
  store double %33, double* %34, align 8
  %indvars.iv.next33.1 = add nsw i64 %indvars.iv32, 2
  %exitcond35.1 = icmp eq i64 %indvars.iv.next33.1, %wide.trip.count34.1
  br i1 %exitcond35.1, label %._crit_edge13.us.us.loopexit, label %.preheader5.us.us.new..preheader5.us.us.new_crit_edge

.preheader5.us.us.new..preheader5.us.us.new_crit_edge: ; preds = %.preheader5.us.us.new
  %pgocount6 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %35 = add i64 %pgocount6, 1
  store i64 %35, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  br label %.preheader5.us.us.new

.preheader4.loopexit:                             ; preds = %._crit_edge15.us
  %pgocount7 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 13)
  %36 = add i64 %pgocount7, 1
  store i64 %36, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 13)
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.loopexit, %.preheader6.lr.ph, %5
  %37 = icmp sgt i32 %2, 0
  br i1 %37, label %.preheader.lr.ph, label %._crit_edge10

.preheader.lr.ph:                                 ; preds = %.preheader4
  %38 = sitofp i32 %2 to double
  %xtraiter = and i32 %2, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %39 = icmp eq i32 %2, 1
  %wide.trip.count30 = zext i32 %2 to i64
  %wide.trip.count.1 = zext i32 %2 to i64
  %40 = fdiv double 0.000000e+00, %38
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv28 = phi i64 [ %indvars.iv.next29, %._crit_edge.us ], [ 0, %.preheader.lr.ph ]
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  %pgocount8 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %41 = add i64 %pgocount8, 1
  store i64 %41, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %42 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv28, i64 0
  store double %40, double* %42, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us ]
  br i1 %39, label %.prol.loopexit.._crit_edge.us_crit_edge, label %.preheader.us.new.preheader

.prol.loopexit.._crit_edge.us_crit_edge:          ; preds = %.prol.loopexit
  %pgocount9 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %43 = add i64 %pgocount9, 1
  store i64 %43, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  br label %._crit_edge.us

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new..preheader.us.new_crit_edge, %.preheader.us.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new..preheader.us.new_crit_edge ], [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ]
  %44 = mul nuw nsw i64 %indvars.iv, %indvars.iv28
  %45 = trunc i64 %44 to i32
  %46 = srem i32 %45, %2
  %47 = sitofp i32 %46 to double
  %48 = fdiv double %47, %38
  %49 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv28, i64 %indvars.iv
  store double %48, double* %49, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %50 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv28
  %51 = trunc i64 %50 to i32
  %52 = srem i32 %51, %2
  %53 = sitofp i32 %52 to double
  %54 = fdiv double %53, %38
  %55 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv28, i64 %indvars.iv.next
  store double %54, double* %55, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader.us.new..preheader.us.new_crit_edge

.preheader.us.new..preheader.us.new_crit_edge:    ; preds = %.preheader.us.new
  %pgocount10 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %56 = add i64 %pgocount10, 1
  store i64 %56, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  br label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  %pgocount11 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  %57 = add i64 %pgocount11, 1
  store i64 %57, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.prol.loopexit.._crit_edge.us_crit_edge, %._crit_edge.us.loopexit
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond = icmp eq i64 %indvars.iv.next29, %wide.trip.count30
  br i1 %exitcond, label %._crit_edge10.loopexit, label %.preheader.us

._crit_edge10.loopexit:                           ; preds = %._crit_edge.us
  %pgocount12 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 12)
  %58 = add i64 %pgocount12, 1
  store i64 %58, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 12)
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit, %.preheader4
  %pgocount13 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 10)
  %59 = add i64 %pgocount13, 1
  store i64 %59, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 10)
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, i32, [140 x [160 x double]]* nocapture readonly) unnamed_addr #1 {
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #6
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.preheader3.lr.ph, label %._crit_edge8

.preheader3.lr.ph:                                ; preds = %4
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_print_array, i64 0, i64 6)
  %10 = add i64 %pgocount, 1
  store i64 %10, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_print_array, i64 0, i64 6)
  %11 = icmp sgt i32 %1, 0
  %12 = icmp sgt i32 %2, 0
  br i1 %11, label %.preheader3.us.preheader, label %._crit_edge8

.preheader3.us.preheader:                         ; preds = %.preheader3.lr.ph
  %13 = sext i32 %1 to i64
  %wide.trip.count25 = zext i32 %0 to i64
  %wide.trip.count = zext i32 %2 to i64
  %wide.trip.count21 = zext i32 %1 to i64
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %._crit_edge6.us, %.preheader3.us.preheader
  %indvars.iv23 = phi i64 [ 0, %.preheader3.us.preheader ], [ %indvars.iv.next24, %._crit_edge6.us ]
  br i1 %12, label %.preheader.us.us.preheader, label %.preheader3.us.._crit_edge6.us_crit_edge

.preheader3.us.._crit_edge6.us_crit_edge:         ; preds = %.preheader3.us
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %14 = add i64 %pgocount1, 1
  store i64 %14, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  br label %._crit_edge6.us

.preheader.us.us.preheader:                       ; preds = %.preheader3.us
  %15 = mul nsw i64 %indvars.iv23, %13
  %16 = trunc i64 %15 to i32
  br label %.preheader.us.us

._crit_edge6.us.loopexit:                         ; preds = %._crit_edge.us.us
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_print_array, i64 0, i64 5)
  %17 = add i64 %pgocount2, 1
  store i64 %17, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_print_array, i64 0, i64 5)
  br label %._crit_edge6.us

._crit_edge6.us:                                  ; preds = %.preheader3.us.._crit_edge6.us_crit_edge, %._crit_edge6.us.loopexit
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next24, %wide.trip.count25
  br i1 %exitcond26, label %._crit_edge8.loopexit, label %.preheader3.us

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %18 = trunc i64 %indvars.iv19 to i32
  %19 = add i32 %18, %16
  %20 = mul i32 %19, %2
  %21 = zext i32 %20 to i64
  br label %23

._crit_edge.us.us:                                ; preds = %32
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %22 = add i64 %pgocount3, 1
  store i64 %22, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next20, %wide.trip.count21
  br i1 %exitcond22, label %._crit_edge6.us.loopexit, label %.preheader.us.us

; <label>:23:                                     ; preds = %32, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %32 ], [ 0, %.preheader.us.us ]
  %24 = add i64 %indvars.iv, %21
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, 20
  %27 = icmp eq i32 %26, 0
  br i1 %27, label %29, label %._crit_edge

._crit_edge:                                      ; preds = %23
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %28 = add i64 %pgocount4, 1
  store i64 %28, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  br label %32

; <label>:29:                                     ; preds = %23
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %30 = add i64 %pgocount5, 1
  store i64 %30, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %31) #6
  br label %32

; <label>:32:                                     ; preds = %._crit_edge, %29
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv23, i64 %indvars.iv19, i64 %indvars.iv
  %35 = load double, double* %34, align 8
  %36 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %35) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.us, label %23

._crit_edge8.loopexit:                            ; preds = %._crit_edge6.us
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_print_array, i64 0, i64 7)
  %37 = add i64 %pgocount6, 1
  store i64 %37, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_print_array, i64 0, i64 7)
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %.preheader3.lr.ph, %4
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_print_array, i64 0, i64 4)
  %38 = add i64 %pgocount7, 1
  store i64 %38, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_print_array, i64 0, i64 4)
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %41) #6
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

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
