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
define void @kernel_doitgen(i32 %nr, i32 %nq, i32 %np, [140 x [160 x double]]* nocapture %A, [160 x double]* nocapture readonly %C4, double* nocapture %sum) local_unnamed_addr #0 {
entry:
  %sum43 = bitcast double* %sum to i8*
  %cmp29 = icmp sgt i32 %nr, 0
  br i1 %cmp29, label %for.cond1.preheader.lr.ph, label %for.end44

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp27 = icmp sgt i32 %nq, 0
  %cmp53 = icmp sgt i32 %np, 0
  %cmp81 = icmp sgt i32 %np, 0
  %cmp265 = icmp sgt i32 %np, 0
  %0 = add i32 %np, -1
  %1 = zext i32 %0 to i64
  %2 = shl nuw nsw i64 %1, 3
  %3 = add nuw nsw i64 %2, 8
  %xtraiter61 = and i32 %np, 3
  %lcmp.mod62 = icmp eq i32 %xtraiter61, 0
  %4 = icmp ult i32 %0, 3
  %wide.trip.count56.3 = zext i32 %np to i64
  %wide.trip.count66 = zext i32 %nq to i64
  %xtraiter48 = and i32 %np, 1
  %lcmp.mod49 = icmp eq i32 %xtraiter48, 0
  %5 = icmp eq i32 %0, 0
  %wide.trip.count52 = zext i32 %np to i64
  %wide.trip.count46.1 = zext i32 %np to i64
  %xtraiter = and i32 %np, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %6 = icmp ult i32 %0, 3
  %wide.trip.count.3 = zext i32 %np to i64
  %wide.trip.count38 = zext i32 %nq to i64
  %wide.trip.count70 = zext i32 %nr to i64
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc42, %for.cond1.preheader.lr.ph
  %indvars.iv68 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next69, %for.inc42 ]
  br i1 %cmp27, label %for.cond4.preheader.lr.ph, label %for.cond1.preheader.for.inc42_crit_edge

for.cond1.preheader.for.inc42_crit_edge:          ; preds = %for.cond1.preheader
  %pgocount = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 7)
  %7 = add i64 %pgocount, 1
  store i64 %7, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 7)
  br label %for.inc42

for.cond4.preheader.lr.ph:                        ; preds = %for.cond1.preheader
  br i1 %cmp53, label %for.cond4.preheader.us.preheader, label %for.cond4.preheader.preheader

for.cond4.preheader.preheader:                    ; preds = %for.cond4.preheader.lr.ph
  br label %for.cond4.preheader

for.cond4.preheader.us.preheader:                 ; preds = %for.cond4.preheader.lr.ph
  br label %for.cond4.preheader.us

for.cond4.preheader.us:                           ; preds = %for.inc39.us, %for.cond4.preheader.us.preheader
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %for.inc39.us ], [ 0, %for.cond4.preheader.us.preheader ]
  br i1 %cmp81, label %for.body6.us.us.preheader, label %for.cond4.for.cond25.preheader_crit_edge.us.loopexit31

for.body6.us.us.preheader:                        ; preds = %for.cond4.preheader.us
  %arrayidx15.us.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv68, i64 %indvars.iv64, i64 0
  br label %for.body6.us.us

for.inc39.us.loopexit:                            ; preds = %for.body27.us
  br label %for.inc39.us

for.inc39.us:                                     ; preds = %for.body27.us.prol.loopexit, %for.cond4.for.cond25.preheader_crit_edge.us, %for.inc39.us.loopexit
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next65, %wide.trip.count66
  br i1 %exitcond67, label %for.inc42.loopexit, label %for.cond4.preheader.us

for.body27.us:                                    ; preds = %for.body27.us.for.body27.us_crit_edge, %for.body27.us.preheader
  %indvars.iv54 = phi i64 [ %indvars.iv.next55.3, %for.body27.us.for.body27.us_crit_edge ], [ %indvars.iv54.unr, %for.body27.us.preheader ]
  %arrayidx29.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv54
  %8 = bitcast double* %arrayidx29.us to i64*
  %9 = load i64, i64* %8, align 8
  %arrayidx35.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv68, i64 %indvars.iv64, i64 %indvars.iv54
  %10 = bitcast double* %arrayidx35.us to i64*
  store i64 %9, i64* %10, align 8
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %arrayidx29.us.1 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next55
  %11 = bitcast double* %arrayidx29.us.1 to i64*
  %12 = load i64, i64* %11, align 8
  %arrayidx35.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv68, i64 %indvars.iv64, i64 %indvars.iv.next55
  %13 = bitcast double* %arrayidx35.us.1 to i64*
  store i64 %12, i64* %13, align 8
  %indvars.iv.next55.1 = add nsw i64 %indvars.iv54, 2
  %arrayidx29.us.2 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next55.1
  %14 = bitcast double* %arrayidx29.us.2 to i64*
  %15 = load i64, i64* %14, align 8
  %arrayidx35.us.2 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv68, i64 %indvars.iv64, i64 %indvars.iv.next55.1
  %16 = bitcast double* %arrayidx35.us.2 to i64*
  store i64 %15, i64* %16, align 8
  %indvars.iv.next55.2 = add nsw i64 %indvars.iv54, 3
  %arrayidx29.us.3 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next55.2
  %17 = bitcast double* %arrayidx29.us.3 to i64*
  %18 = load i64, i64* %17, align 8
  %arrayidx35.us.3 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv68, i64 %indvars.iv64, i64 %indvars.iv.next55.2
  %19 = bitcast double* %arrayidx35.us.3 to i64*
  store i64 %18, i64* %19, align 8
  %indvars.iv.next55.3 = add nsw i64 %indvars.iv54, 4
  %exitcond57.3 = icmp eq i64 %indvars.iv.next55.3, %wide.trip.count56.3
  br i1 %exitcond57.3, label %for.inc39.us.loopexit, label %for.body27.us.for.body27.us_crit_edge

for.body27.us.for.body27.us_crit_edge:            ; preds = %for.body27.us
  %pgocount1 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 2)
  %20 = add i64 %pgocount1, 1
  store i64 %20, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 2)
  br label %for.body27.us

for.cond4.for.cond25.preheader_crit_edge.us.loopexit31: ; preds = %for.cond4.preheader.us
  %pgocount2 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 13)
  %21 = add i64 %pgocount2, 1
  store i64 %21, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 13)
  call void @llvm.memset.p0i8.i64(i8* %sum43, i8 0, i64 %3, i32 8, i1 false)
  br label %for.cond4.for.cond25.preheader_crit_edge.us

for.cond4.for.cond25.preheader_crit_edge.us.loopexit: ; preds = %for.cond7.for.inc22_crit_edge.us.us
  %pgocount3 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 11)
  %22 = add i64 %pgocount3, 1
  store i64 %22, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 11)
  br label %for.cond4.for.cond25.preheader_crit_edge.us

for.cond4.for.cond25.preheader_crit_edge.us:      ; preds = %for.cond4.for.cond25.preheader_crit_edge.us.loopexit, %for.cond4.for.cond25.preheader_crit_edge.us.loopexit31
  br i1 %cmp265, label %for.body27.lr.ph.us, label %for.inc39.us

for.body6.us.us:                                  ; preds = %for.cond7.for.inc22_crit_edge.us.us, %for.body6.us.us.preheader
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %for.cond7.for.inc22_crit_edge.us.us ], [ 0, %for.body6.us.us.preheader ]
  %arrayidx.us.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv50
  store double 0.000000e+00, double* %arrayidx.us.us, align 8
  br i1 %lcmp.mod49, label %for.body9.us.us.prol.loopexit, label %for.body9.us.us.prol

for.body9.us.us.prol:                             ; preds = %for.body6.us.us
  %pgocount4 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 9)
  %23 = add i64 %pgocount4, 1
  store i64 %23, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 9)
  %24 = load double, double* %arrayidx15.us.us.prol, align 8
  %arrayidx19.us.us.prol = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 0, i64 %indvars.iv50
  %25 = load double, double* %arrayidx19.us.us.prol, align 8
  %mul.us.us.prol = fmul double %24, %25
  %26 = load double, double* %arrayidx.us.us, align 8
  %add.us.us.prol = fadd double %26, %mul.us.us.prol
  store double %add.us.us.prol, double* %arrayidx.us.us, align 8
  br label %for.body9.us.us.prol.loopexit

for.body9.us.us.prol.loopexit:                    ; preds = %for.body9.us.us.prol, %for.body6.us.us
  %indvars.iv44.unr.ph = phi i64 [ 1, %for.body9.us.us.prol ], [ 0, %for.body6.us.us ]
  br i1 %5, label %for.body9.us.us.prol.loopexit.for.cond7.for.inc22_crit_edge.us.us_crit_edge, label %for.body9.us.us.preheader

for.body9.us.us.prol.loopexit.for.cond7.for.inc22_crit_edge.us.us_crit_edge: ; preds = %for.body9.us.us.prol.loopexit
  %pgocount5 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 3)
  %27 = add i64 %pgocount5, 1
  store i64 %27, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 3)
  br label %for.cond7.for.inc22_crit_edge.us.us

for.body9.us.us.preheader:                        ; preds = %for.body9.us.us.prol.loopexit
  br label %for.body9.us.us

for.cond7.for.inc22_crit_edge.us.us.loopexit:     ; preds = %for.body9.us.us
  %pgocount6 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 8)
  %28 = add i64 %pgocount6, 1
  store i64 %28, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 8)
  br label %for.cond7.for.inc22_crit_edge.us.us

for.cond7.for.inc22_crit_edge.us.us:              ; preds = %for.body9.us.us.prol.loopexit.for.cond7.for.inc22_crit_edge.us.us_crit_edge, %for.cond7.for.inc22_crit_edge.us.us.loopexit
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next51, %wide.trip.count52
  br i1 %exitcond53, label %for.cond4.for.cond25.preheader_crit_edge.us.loopexit, label %for.body6.us.us

for.body9.us.us:                                  ; preds = %for.body9.us.us.for.body9.us.us_crit_edge, %for.body9.us.us.preheader
  %indvars.iv44 = phi i64 [ %indvars.iv.next45.1, %for.body9.us.us.for.body9.us.us_crit_edge ], [ %indvars.iv44.unr.ph, %for.body9.us.us.preheader ]
  %arrayidx15.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv68, i64 %indvars.iv64, i64 %indvars.iv44
  %29 = load double, double* %arrayidx15.us.us, align 8
  %arrayidx19.us.us = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv44, i64 %indvars.iv50
  %30 = load double, double* %arrayidx19.us.us, align 8
  %mul.us.us = fmul double %29, %30
  %31 = load double, double* %arrayidx.us.us, align 8
  %add.us.us = fadd double %31, %mul.us.us
  store double %add.us.us, double* %arrayidx.us.us, align 8
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %arrayidx15.us.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv68, i64 %indvars.iv64, i64 %indvars.iv.next45
  %32 = load double, double* %arrayidx15.us.us.1, align 8
  %arrayidx19.us.us.1 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv.next45, i64 %indvars.iv50
  %33 = load double, double* %arrayidx19.us.us.1, align 8
  %mul.us.us.1 = fmul double %32, %33
  %34 = load double, double* %arrayidx.us.us, align 8
  %add.us.us.1 = fadd double %34, %mul.us.us.1
  store double %add.us.us.1, double* %arrayidx.us.us, align 8
  %indvars.iv.next45.1 = add nsw i64 %indvars.iv44, 2
  %exitcond47.1 = icmp eq i64 %indvars.iv.next45.1, %wide.trip.count46.1
  br i1 %exitcond47.1, label %for.cond7.for.inc22_crit_edge.us.us.loopexit, label %for.body9.us.us.for.body9.us.us_crit_edge

for.body9.us.us.for.body9.us.us_crit_edge:        ; preds = %for.body9.us.us
  %pgocount7 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 0)
  %35 = add i64 %pgocount7, 1
  store i64 %35, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 0)
  br label %for.body9.us.us

for.body27.lr.ph.us:                              ; preds = %for.cond4.for.cond25.preheader_crit_edge.us
  %pgocount8 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 10)
  %36 = add i64 %pgocount8, 1
  store i64 %36, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 10)
  br i1 %lcmp.mod62, label %for.body27.us.prol.loopexit, label %for.body27.us.prol.preheader

for.body27.us.prol.preheader:                     ; preds = %for.body27.lr.ph.us
  br label %for.body27.us.prol

for.body27.us.prol:                               ; preds = %for.body27.us.prol.for.body27.us.prol_crit_edge, %for.body27.us.prol.preheader
  %indvars.iv54.prol = phi i64 [ %indvars.iv.next55.prol, %for.body27.us.prol.for.body27.us.prol_crit_edge ], [ 0, %for.body27.us.prol.preheader ]
  %prol.iter63 = phi i32 [ %prol.iter63.sub, %for.body27.us.prol.for.body27.us.prol_crit_edge ], [ %xtraiter61, %for.body27.us.prol.preheader ]
  %arrayidx29.us.prol = getelementptr inbounds double, double* %sum, i64 %indvars.iv54.prol
  %37 = bitcast double* %arrayidx29.us.prol to i64*
  %38 = load i64, i64* %37, align 8
  %arrayidx35.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv68, i64 %indvars.iv64, i64 %indvars.iv54.prol
  %39 = bitcast double* %arrayidx35.us.prol to i64*
  store i64 %38, i64* %39, align 8
  %indvars.iv.next55.prol = add nuw nsw i64 %indvars.iv54.prol, 1
  %prol.iter63.sub = add i32 %prol.iter63, -1
  %prol.iter63.cmp = icmp eq i32 %prol.iter63.sub, 0
  br i1 %prol.iter63.cmp, label %for.body27.us.prol.loopexit.loopexit, label %for.body27.us.prol.for.body27.us.prol_crit_edge, !llvm.loop !1

for.body27.us.prol.for.body27.us.prol_crit_edge:  ; preds = %for.body27.us.prol
  %pgocount9 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 1)
  %40 = add i64 %pgocount9, 1
  store i64 %40, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 1)
  br label %for.body27.us.prol

for.body27.us.prol.loopexit.loopexit:             ; preds = %for.body27.us.prol
  %pgocount10 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 12)
  %41 = add i64 %pgocount10, 1
  store i64 %41, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 12)
  br label %for.body27.us.prol.loopexit

for.body27.us.prol.loopexit:                      ; preds = %for.body27.us.prol.loopexit.loopexit, %for.body27.lr.ph.us
  %indvars.iv54.unr = phi i64 [ 0, %for.body27.lr.ph.us ], [ %indvars.iv.next55.prol, %for.body27.us.prol.loopexit.loopexit ]
  br i1 %4, label %for.inc39.us, label %for.body27.us.preheader

for.body27.us.preheader:                          ; preds = %for.body27.us.prol.loopexit
  %pgocount11 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 15)
  %42 = add i64 %pgocount11, 1
  store i64 %42, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 15)
  br label %for.body27.us

for.cond4.preheader:                              ; preds = %for.inc39, %for.cond4.preheader.preheader
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %for.inc39 ], [ 0, %for.cond4.preheader.preheader ]
  br i1 %cmp265, label %for.body27.lr.ph, label %for.cond4.preheader.for.inc39_crit_edge

for.cond4.preheader.for.inc39_crit_edge:          ; preds = %for.cond4.preheader
  %pgocount12 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 6)
  %43 = add i64 %pgocount12, 1
  store i64 %43, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 6)
  br label %for.inc39

for.body27.lr.ph:                                 ; preds = %for.cond4.preheader
  %pgocount13 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 14)
  %44 = add i64 %pgocount13, 1
  store i64 %44, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 14)
  br i1 %lcmp.mod, label %for.body27.prol.loopexit, label %for.body27.prol.preheader

for.body27.prol.preheader:                        ; preds = %for.body27.lr.ph
  br label %for.body27.prol

for.body27.prol:                                  ; preds = %for.body27.prol.for.body27.prol_crit_edge, %for.body27.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body27.prol.for.body27.prol_crit_edge ], [ 0, %for.body27.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body27.prol.for.body27.prol_crit_edge ], [ %xtraiter, %for.body27.prol.preheader ]
  %arrayidx29.prol = getelementptr inbounds double, double* %sum, i64 %indvars.iv.prol
  %45 = bitcast double* %arrayidx29.prol to i64*
  %46 = load i64, i64* %45, align 8
  %arrayidx35.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv68, i64 %indvars.iv36, i64 %indvars.iv.prol
  %47 = bitcast double* %arrayidx35.prol to i64*
  store i64 %46, i64* %47, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body27.prol.loopexit.loopexit, label %for.body27.prol.for.body27.prol_crit_edge, !llvm.loop !3

for.body27.prol.for.body27.prol_crit_edge:        ; preds = %for.body27.prol
  %pgocount14 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 4)
  %48 = add i64 %pgocount14, 1
  store i64 %48, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 4)
  br label %for.body27.prol

for.body27.prol.loopexit.loopexit:                ; preds = %for.body27.prol
  %pgocount15 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 16)
  %49 = add i64 %pgocount15, 1
  store i64 %49, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 16)
  br label %for.body27.prol.loopexit

for.body27.prol.loopexit:                         ; preds = %for.body27.prol.loopexit.loopexit, %for.body27.lr.ph
  %indvars.iv.unr = phi i64 [ 0, %for.body27.lr.ph ], [ %indvars.iv.next.prol, %for.body27.prol.loopexit.loopexit ]
  br i1 %6, label %for.inc39, label %for.body27.preheader

for.body27.preheader:                             ; preds = %for.body27.prol.loopexit
  br label %for.body27

for.body27:                                       ; preds = %for.body27.for.body27_crit_edge, %for.body27.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body27.for.body27_crit_edge ], [ %indvars.iv.unr, %for.body27.preheader ]
  %arrayidx29 = getelementptr inbounds double, double* %sum, i64 %indvars.iv
  %50 = bitcast double* %arrayidx29 to i64*
  %51 = load i64, i64* %50, align 8
  %arrayidx35 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv68, i64 %indvars.iv36, i64 %indvars.iv
  %52 = bitcast double* %arrayidx35 to i64*
  store i64 %51, i64* %52, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx29.1 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next
  %53 = bitcast double* %arrayidx29.1 to i64*
  %54 = load i64, i64* %53, align 8
  %arrayidx35.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv68, i64 %indvars.iv36, i64 %indvars.iv.next
  %55 = bitcast double* %arrayidx35.1 to i64*
  store i64 %54, i64* %55, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx29.2 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next.1
  %56 = bitcast double* %arrayidx29.2 to i64*
  %57 = load i64, i64* %56, align 8
  %arrayidx35.2 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv68, i64 %indvars.iv36, i64 %indvars.iv.next.1
  %58 = bitcast double* %arrayidx35.2 to i64*
  store i64 %57, i64* %58, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx29.3 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next.2
  %59 = bitcast double* %arrayidx29.3 to i64*
  %60 = load i64, i64* %59, align 8
  %arrayidx35.3 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv68, i64 %indvars.iv36, i64 %indvars.iv.next.2
  %61 = bitcast double* %arrayidx35.3 to i64*
  store i64 %60, i64* %61, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %for.inc39.loopexit, label %for.body27.for.body27_crit_edge

for.body27.for.body27_crit_edge:                  ; preds = %for.body27
  %pgocount16 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 5)
  %62 = add i64 %pgocount16, 1
  store i64 %62, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 5)
  br label %for.body27

for.inc39.loopexit:                               ; preds = %for.body27
  %pgocount17 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 17)
  %63 = add i64 %pgocount17, 1
  store i64 %63, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 17)
  br label %for.inc39

for.inc39:                                        ; preds = %for.cond4.preheader.for.inc39_crit_edge, %for.inc39.loopexit, %for.body27.prol.loopexit
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond = icmp eq i64 %indvars.iv.next37, %wide.trip.count38
  br i1 %exitcond, label %for.inc42.loopexit74, label %for.cond4.preheader

for.inc42.loopexit:                               ; preds = %for.inc39.us
  %pgocount18 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 18)
  %64 = add i64 %pgocount18, 1
  store i64 %64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 18)
  br label %for.inc42

for.inc42.loopexit74:                             ; preds = %for.inc39
  %pgocount19 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 19)
  %65 = add i64 %pgocount19, 1
  store i64 %65, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 19)
  br label %for.inc42

for.inc42:                                        ; preds = %for.cond1.preheader.for.inc42_crit_edge, %for.inc42.loopexit74, %for.inc42.loopexit
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next69, %wide.trip.count70
  br i1 %exitcond71, label %for.end44.loopexit, label %for.cond1.preheader

for.end44.loopexit:                               ; preds = %for.inc42
  %pgocount20 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 21)
  %66 = add i64 %pgocount20, 1
  store i64 %66, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 21)
  br label %for.end44

for.end44:                                        ; preds = %for.end44.loopexit, %entry
  %pgocount21 = load i64, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 20)
  %67 = add i64 %pgocount21, 1
  store i64 %67, i64* getelementptr inbounds ([22 x i64], [22 x i64]* @__profc_kernel_doitgen, i64 0, i64 20)
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #1 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %arraydecay = bitcast i8* %call to [140 x [160 x double]]*
  %arraydecay3 = bitcast i8* %call2 to [160 x double]*
  tail call fastcc void @init_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %arraydecay, [160 x double]* %arraydecay3)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay6 = bitcast i8* %call1 to double*
  tail call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %arraydecay, [160 x double]* %arraydecay3, double* %arraydecay6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %0 = add i64 %pgocount, 1
  store i64 %0, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %1 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %1, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %2 = add i64 %pgocount1, 1
  store i64 %2, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  tail call fastcc void @print_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %3 = add i64 %pgocount2, 1
  store i64 %3, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %nr, i32 %nq, i32 %np, [140 x [160 x double]]* nocapture %A, [160 x double]* nocapture %C4) unnamed_addr #0 {
entry:
  %cmp10 = icmp sgt i32 %nr, 0
  br i1 %cmp10, label %for.cond1.preheader.lr.ph, label %for.cond18.preheader

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %pgocount = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 11)
  %0 = add i64 %pgocount, 1
  store i64 %0, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 11)
  %cmp28 = icmp sgt i32 %nq, 0
  %cmp56 = icmp sgt i32 %np, 0
  %conv7 = sitofp i32 %np to double
  br i1 %cmp28, label %for.cond1.preheader.us.preheader, label %for.cond18.preheader

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count56 = zext i32 %nr to i64
  %xtraiter47 = and i32 %np, 1
  %lcmp.mod48 = icmp eq i32 %xtraiter47, 0
  %1 = icmp eq i32 %np, 1
  %wide.trip.count52 = zext i32 %nq to i64
  %wide.trip.count45.1 = zext i32 %np to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc15_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %for.cond1.for.inc15_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  br i1 %cmp56, label %for.cond4.preheader.us.us.preheader, label %for.cond1.preheader.us.for.cond1.for.inc15_crit_edge.us_crit_edge

for.cond1.preheader.us.for.cond1.for.inc15_crit_edge.us_crit_edge: ; preds = %for.cond1.preheader.us
  %pgocount1 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %2 = add i64 %pgocount1, 1
  store i64 %2, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  br label %for.cond1.for.inc15_crit_edge.us

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.us
  br label %for.cond4.preheader.us.us

for.cond1.for.inc15_crit_edge.us.loopexit:        ; preds = %for.cond4.for.inc12_crit_edge.us.us
  %pgocount2 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  %3 = add i64 %pgocount2, 1
  store i64 %3, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  br label %for.cond1.for.inc15_crit_edge.us

for.cond1.for.inc15_crit_edge.us:                 ; preds = %for.cond1.preheader.us.for.cond1.for.inc15_crit_edge.us_crit_edge, %for.cond1.for.inc15_crit_edge.us.loopexit
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next55, %wide.trip.count56
  br i1 %exitcond57, label %for.cond18.preheader.loopexit, label %for.cond1.preheader.us

for.cond4.preheader.us.us:                        ; preds = %for.cond4.for.inc12_crit_edge.us.us, %for.cond4.preheader.us.us.preheader
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %for.cond4.for.inc12_crit_edge.us.us ], [ 0, %for.cond4.preheader.us.us.preheader ]
  %4 = mul nuw nsw i64 %indvars.iv49, %indvars.iv54
  br i1 %lcmp.mod48, label %for.body6.us.us.prol.loopexit, label %for.body6.us.us.prol

for.body6.us.us.prol:                             ; preds = %for.cond4.preheader.us.us
  %pgocount3 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %5 = add i64 %pgocount3, 1
  store i64 %5, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %6 = trunc i64 %4 to i32
  %rem.us.us.prol = srem i32 %6, %np
  %conv.us.us.prol = sitofp i32 %rem.us.us.prol to double
  %div.us.us.prol = fdiv double %conv.us.us.prol, %conv7
  %arrayidx11.us.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv54, i64 %indvars.iv49, i64 0
  store double %div.us.us.prol, double* %arrayidx11.us.us.prol, align 8
  br label %for.body6.us.us.prol.loopexit

for.body6.us.us.prol.loopexit:                    ; preds = %for.body6.us.us.prol, %for.cond4.preheader.us.us
  %indvars.iv42.unr.ph = phi i64 [ 1, %for.body6.us.us.prol ], [ 0, %for.cond4.preheader.us.us ]
  br i1 %1, label %for.body6.us.us.prol.loopexit.for.cond4.for.inc12_crit_edge.us.us_crit_edge, label %for.body6.us.us.preheader

for.body6.us.us.prol.loopexit.for.cond4.for.inc12_crit_edge.us.us_crit_edge: ; preds = %for.body6.us.us.prol.loopexit
  %pgocount4 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %7 = add i64 %pgocount4, 1
  store i64 %7, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  br label %for.cond4.for.inc12_crit_edge.us.us

for.body6.us.us.preheader:                        ; preds = %for.body6.us.us.prol.loopexit
  br label %for.body6.us.us

for.cond4.for.inc12_crit_edge.us.us.loopexit:     ; preds = %for.body6.us.us
  %pgocount5 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %8 = add i64 %pgocount5, 1
  store i64 %8, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  br label %for.cond4.for.inc12_crit_edge.us.us

for.cond4.for.inc12_crit_edge.us.us:              ; preds = %for.body6.us.us.prol.loopexit.for.cond4.for.inc12_crit_edge.us.us_crit_edge, %for.cond4.for.inc12_crit_edge.us.us.loopexit
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next50, %wide.trip.count52
  br i1 %exitcond53, label %for.cond1.for.inc15_crit_edge.us.loopexit, label %for.cond4.preheader.us.us

for.body6.us.us:                                  ; preds = %for.body6.us.us.for.body6.us.us_crit_edge, %for.body6.us.us.preheader
  %indvars.iv42 = phi i64 [ %indvars.iv.next43.1, %for.body6.us.us.for.body6.us.us_crit_edge ], [ %indvars.iv42.unr.ph, %for.body6.us.us.preheader ]
  %9 = add nsw i64 %indvars.iv42, %4
  %10 = trunc i64 %9 to i32
  %rem.us.us = srem i32 %10, %np
  %conv.us.us = sitofp i32 %rem.us.us to double
  %div.us.us = fdiv double %conv.us.us, %conv7
  %arrayidx11.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv54, i64 %indvars.iv49, i64 %indvars.iv42
  store double %div.us.us, double* %arrayidx11.us.us, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %11 = add nsw i64 %indvars.iv.next43, %4
  %12 = trunc i64 %11 to i32
  %rem.us.us.1 = srem i32 %12, %np
  %conv.us.us.1 = sitofp i32 %rem.us.us.1 to double
  %div.us.us.1 = fdiv double %conv.us.us.1, %conv7
  %arrayidx11.us.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv54, i64 %indvars.iv49, i64 %indvars.iv.next43
  store double %div.us.us.1, double* %arrayidx11.us.us.1, align 8
  %indvars.iv.next43.1 = add nsw i64 %indvars.iv42, 2
  %exitcond46.1 = icmp eq i64 %indvars.iv.next43.1, %wide.trip.count45.1
  br i1 %exitcond46.1, label %for.cond4.for.inc12_crit_edge.us.us.loopexit, label %for.body6.us.us.for.body6.us.us_crit_edge

for.body6.us.us.for.body6.us.us_crit_edge:        ; preds = %for.body6.us.us
  %pgocount6 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %13 = add i64 %pgocount6, 1
  store i64 %13, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  br label %for.body6.us.us

for.cond18.preheader.loopexit:                    ; preds = %for.cond1.for.inc15_crit_edge.us
  %pgocount7 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 13)
  %14 = add i64 %pgocount7, 1
  store i64 %14, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 13)
  br label %for.cond18.preheader

for.cond18.preheader:                             ; preds = %for.cond18.preheader.loopexit, %for.cond1.preheader.lr.ph, %entry
  %cmp193 = icmp sgt i32 %np, 0
  br i1 %cmp193, label %for.cond22.preheader.lr.ph, label %for.end40

for.cond22.preheader.lr.ph:                       ; preds = %for.cond18.preheader
  %conv29 = sitofp i32 %np to double
  %xtraiter = and i32 %np, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %15 = icmp eq i32 %np, 1
  %wide.trip.count40 = zext i32 %np to i64
  %wide.trip.count.1 = zext i32 %np to i64
  %div30.us.prol = fdiv double 0.000000e+00, %conv29
  br label %for.cond22.preheader.us

for.cond22.preheader.us:                          ; preds = %for.cond22.for.inc38_crit_edge.us, %for.cond22.preheader.lr.ph
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %for.cond22.for.inc38_crit_edge.us ], [ 0, %for.cond22.preheader.lr.ph ]
  br i1 %lcmp.mod, label %for.body25.us.prol.loopexit, label %for.body25.us.prol

for.body25.us.prol:                               ; preds = %for.cond22.preheader.us
  %pgocount8 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %16 = add i64 %pgocount8, 1
  store i64 %16, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %arrayidx34.us.prol = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv38, i64 0
  store double %div30.us.prol, double* %arrayidx34.us.prol, align 8
  br label %for.body25.us.prol.loopexit

for.body25.us.prol.loopexit:                      ; preds = %for.body25.us.prol, %for.cond22.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body25.us.prol ], [ 0, %for.cond22.preheader.us ]
  br i1 %15, label %for.body25.us.prol.loopexit.for.cond22.for.inc38_crit_edge.us_crit_edge, label %for.body25.us.preheader

for.body25.us.prol.loopexit.for.cond22.for.inc38_crit_edge.us_crit_edge: ; preds = %for.body25.us.prol.loopexit
  %pgocount9 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %17 = add i64 %pgocount9, 1
  store i64 %17, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  br label %for.cond22.for.inc38_crit_edge.us

for.body25.us.preheader:                          ; preds = %for.body25.us.prol.loopexit
  br label %for.body25.us

for.body25.us:                                    ; preds = %for.body25.us.for.body25.us_crit_edge, %for.body25.us.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body25.us.for.body25.us_crit_edge ], [ %indvars.iv.unr.ph, %for.body25.us.preheader ]
  %18 = mul nuw nsw i64 %indvars.iv, %indvars.iv38
  %19 = trunc i64 %18 to i32
  %rem27.us = srem i32 %19, %np
  %conv28.us = sitofp i32 %rem27.us to double
  %div30.us = fdiv double %conv28.us, %conv29
  %arrayidx34.us = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv38, i64 %indvars.iv
  store double %div30.us, double* %arrayidx34.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %20 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv38
  %21 = trunc i64 %20 to i32
  %rem27.us.1 = srem i32 %21, %np
  %conv28.us.1 = sitofp i32 %rem27.us.1 to double
  %div30.us.1 = fdiv double %conv28.us.1, %conv29
  %arrayidx34.us.1 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv38, i64 %indvars.iv.next
  store double %div30.us.1, double* %arrayidx34.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.cond22.for.inc38_crit_edge.us.loopexit, label %for.body25.us.for.body25.us_crit_edge

for.body25.us.for.body25.us_crit_edge:            ; preds = %for.body25.us
  %pgocount10 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %22 = add i64 %pgocount10, 1
  store i64 %22, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  br label %for.body25.us

for.cond22.for.inc38_crit_edge.us.loopexit:       ; preds = %for.body25.us
  %pgocount11 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  %23 = add i64 %pgocount11, 1
  store i64 %23, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  br label %for.cond22.for.inc38_crit_edge.us

for.cond22.for.inc38_crit_edge.us:                ; preds = %for.body25.us.prol.loopexit.for.cond22.for.inc38_crit_edge.us_crit_edge, %for.cond22.for.inc38_crit_edge.us.loopexit
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond = icmp eq i64 %indvars.iv.next39, %wide.trip.count40
  br i1 %exitcond, label %for.end40.loopexit, label %for.cond22.preheader.us

for.end40.loopexit:                               ; preds = %for.cond22.for.inc38_crit_edge.us
  %pgocount12 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 12)
  %24 = add i64 %pgocount12, 1
  store i64 %24, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 12)
  br label %for.end40

for.end40:                                        ; preds = %for.end40.loopexit, %for.cond18.preheader
  %pgocount13 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 10)
  %25 = add i64 %pgocount13, 1
  store i64 %25, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 10)
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %nr, i32 %nq, i32 %np, [140 x [160 x double]]* nocapture readonly %A) unnamed_addr #1 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp7 = icmp sgt i32 %nr, 0
  br i1 %cmp7, label %for.cond2.preheader.lr.ph, label %for.end23

for.cond2.preheader.lr.ph:                        ; preds = %entry
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_print_array, i64 0, i64 6)
  %3 = add i64 %pgocount, 1
  store i64 %3, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_print_array, i64 0, i64 6)
  %cmp34 = icmp sgt i32 %nq, 0
  %cmp62 = icmp sgt i32 %np, 0
  br i1 %cmp34, label %for.cond2.preheader.us.preheader, label %for.end23

for.cond2.preheader.us.preheader:                 ; preds = %for.cond2.preheader.lr.ph
  %4 = sext i32 %nq to i64
  %wide.trip.count44 = zext i32 %nr to i64
  %wide.trip.count = zext i32 %np to i64
  %wide.trip.count39 = zext i32 %nq to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc21_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv41 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next42, %for.cond2.for.inc21_crit_edge.us ]
  br i1 %cmp62, label %for.cond5.preheader.us.us.preheader, label %for.cond2.preheader.us.for.cond2.for.inc21_crit_edge.us_crit_edge

for.cond2.preheader.us.for.cond2.for.inc21_crit_edge.us_crit_edge: ; preds = %for.cond2.preheader.us
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %5 = add i64 %pgocount1, 1
  store i64 %5, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  br label %for.cond2.for.inc21_crit_edge.us

for.cond5.preheader.us.us.preheader:              ; preds = %for.cond2.preheader.us
  %6 = mul nsw i64 %indvars.iv41, %4
  %7 = trunc i64 %6 to i32
  br label %for.cond5.preheader.us.us

for.cond2.for.inc21_crit_edge.us.loopexit:        ; preds = %for.cond5.for.inc18_crit_edge.us.us
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_print_array, i64 0, i64 5)
  %8 = add i64 %pgocount2, 1
  store i64 %8, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_print_array, i64 0, i64 5)
  br label %for.cond2.for.inc21_crit_edge.us

for.cond2.for.inc21_crit_edge.us:                 ; preds = %for.cond2.preheader.us.for.cond2.for.inc21_crit_edge.us_crit_edge, %for.cond2.for.inc21_crit_edge.us.loopexit
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next42, %wide.trip.count44
  br i1 %exitcond45, label %for.end23.loopexit, label %for.cond2.preheader.us

for.cond5.preheader.us.us:                        ; preds = %for.cond5.for.inc18_crit_edge.us.us, %for.cond5.preheader.us.us.preheader
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %for.cond5.for.inc18_crit_edge.us.us ], [ 0, %for.cond5.preheader.us.us.preheader ]
  %9 = trunc i64 %indvars.iv37 to i32
  %mul81.us.us = add i32 %9, %7
  %add.us.us = mul i32 %mul81.us.us, %np
  %10 = zext i32 %add.us.us to i64
  br label %for.body7.us.us

for.cond5.for.inc18_crit_edge.us.us:              ; preds = %if.end.us.us
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %11 = add i64 %pgocount3, 1
  store i64 %11, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next38, %wide.trip.count39
  br i1 %exitcond40, label %for.cond2.for.inc21_crit_edge.us.loopexit, label %for.cond5.preheader.us.us

for.body7.us.us:                                  ; preds = %if.end.us.us, %for.cond5.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end.us.us ], [ 0, %for.cond5.preheader.us.us ]
  %12 = add i64 %indvars.iv, %10
  %13 = trunc i64 %12 to i32
  %rem.us.us = srem i32 %13, 20
  %cmp11.us.us = icmp eq i32 %rem.us.us, 0
  br i1 %cmp11.us.us, label %if.then.us.us, label %for.body7.us.us.if.end.us.us_crit_edge

for.body7.us.us.if.end.us.us_crit_edge:           ; preds = %for.body7.us.us
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %14 = add i64 %pgocount4, 1
  store i64 %14, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  br label %if.end.us.us

if.then.us.us:                                    ; preds = %for.body7.us.us
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %15 = add i64 %pgocount5, 1
  store i64 %15, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #6
  br label %if.end.us.us

if.end.us.us:                                     ; preds = %for.body7.us.us.if.end.us.us_crit_edge, %if.then.us.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv41, i64 %indvars.iv37, i64 %indvars.iv
  %18 = load double, double* %arrayidx16.us.us, align 8
  %call17.us.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond5.for.inc18_crit_edge.us.us, label %for.body7.us.us

for.end23.loopexit:                               ; preds = %for.cond2.for.inc21_crit_edge.us
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_print_array, i64 0, i64 7)
  %19 = add i64 %pgocount6, 1
  store i64 %19, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_print_array, i64 0, i64 7)
  br label %for.end23

for.end23:                                        ; preds = %for.end23.loopexit, %for.cond2.preheader.lr.ph, %entry
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_print_array, i64 0, i64 4)
  %20 = add i64 %pgocount7, 1
  store i64 %20, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_print_array, i64 0, i64 4)
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #6
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
