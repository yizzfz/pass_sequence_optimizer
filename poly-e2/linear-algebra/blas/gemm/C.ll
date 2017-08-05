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
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1100000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1100 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1200 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1100 x double]*
  call fastcc void @init_array(i32 1000, i32 1100, i32 1200, double* nonnull %alpha, double* nonnull %beta, [1100 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1100 x double]* %arraydecay4)
  tail call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  tail call fastcc void @kernel_gemm(i32 1000, i32 1100, i32 1200, double %0, double %1, [1100 x double]* %arraydecay, [1200 x double]* %arraydecay3, [1100 x double]* %arraydecay4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %3 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %3, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %4 = add i64 %pgocount1, 1
  store i64 %4, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  tail call fastcc void @print_array(i32 1000, i32 1100, [1100 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %5 = add i64 %pgocount2, 1
  store i64 %5, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %ni, i32 %nj, i32 %nk, double* nocapture %alpha, double* nocapture %beta, [1100 x double]* nocapture %C, [1200 x double]* nocapture %A, [1100 x double]* nocapture %B) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  %cmp13 = icmp sgt i32 %ni, 0
  br i1 %cmp13, label %for.cond1.preheader.lr.ph, label %for.cond34.preheader

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %pgocount = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 10)
  %0 = add i64 %pgocount, 1
  store i64 %0, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 10)
  %cmp211 = icmp sgt i32 %nj, 0
  %conv4 = sitofp i32 %ni to double
  br i1 %cmp211, label %for.cond1.preheader.us.preheader, label %for.cond14.preheader.lr.ph

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count40 = zext i32 %nj to i64
  %wide.trip.count44 = zext i32 %ni to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc7_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %for.cond1.for.inc7_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.for.body3.us_crit_edge, %for.cond1.preheader.us
  %indvars.iv36 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next37, %for.body3.us.for.body3.us_crit_edge ]
  %1 = mul nuw nsw i64 %indvars.iv36, %indvars.iv42
  %2 = add nuw nsw i64 %1, 1
  %3 = trunc i64 %2 to i32
  %rem.us = srem i32 %3, %ni
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %arrayidx6.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv42, i64 %indvars.iv36
  store double %div.us, double* %arrayidx6.us, align 8
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next37, %wide.trip.count40
  br i1 %exitcond41, label %for.cond1.for.inc7_crit_edge.us, label %for.body3.us.for.body3.us_crit_edge

for.body3.us.for.body3.us_crit_edge:              ; preds = %for.body3.us
  %pgocount1 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %4 = add i64 %pgocount1, 1
  store i64 %4, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  br label %for.body3.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.body3.us
  %pgocount2 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %5 = add i64 %pgocount2, 1
  store i64 %5, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next43, %wide.trip.count44
  br i1 %exitcond45, label %for.cond10.preheader, label %for.cond1.preheader.us

for.cond10.preheader:                             ; preds = %for.cond1.for.inc7_crit_edge.us
  %pgocount3 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 12)
  %6 = add i64 %pgocount3, 1
  store i64 %6, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 12)
  %cmp118 = icmp sgt i32 %ni, 0
  br i1 %cmp118, label %for.cond14.preheader.lr.ph, label %for.cond10.preheader.for.cond34.preheader_crit_edge

for.cond10.preheader.for.cond34.preheader_crit_edge: ; preds = %for.cond10.preheader
  %pgocount4 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %7 = add i64 %pgocount4, 1
  store i64 %7, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  br label %for.cond34.preheader

for.cond14.preheader.lr.ph:                       ; preds = %for.cond10.preheader, %for.cond1.preheader.lr.ph
  %cmp156 = icmp sgt i32 %nk, 0
  %conv22 = sitofp i32 %nk to double
  br i1 %cmp156, label %for.cond14.preheader.us.preheader, label %for.end57

for.cond14.preheader.us.preheader:                ; preds = %for.cond14.preheader.lr.ph
  %xtraiter = and i32 %nk, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %8 = icmp eq i32 %nk, 1
  %wide.trip.count33 = zext i32 %ni to i64
  %wide.trip.count29.1 = zext i32 %nk to i64
  br label %for.cond14.preheader.us

for.cond14.preheader.us:                          ; preds = %for.cond14.for.inc31_crit_edge.us, %for.cond14.preheader.us.preheader
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %for.cond14.for.inc31_crit_edge.us ], [ 0, %for.cond14.preheader.us.preheader ]
  br i1 %lcmp.mod, label %for.body17.us.prol.loopexit, label %for.body17.us.prol

for.body17.us.prol:                               ; preds = %for.cond14.preheader.us
  %pgocount5 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %9 = add i64 %pgocount5, 1
  store i64 %9, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %10 = trunc i64 %indvars.iv31 to i32
  %rem20.us.prol = srem i32 %10, %nk
  %conv21.us.prol = sitofp i32 %rem20.us.prol to double
  %div23.us.prol = fdiv double %conv21.us.prol, %conv22
  %arrayidx27.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv31, i64 0
  store double %div23.us.prol, double* %arrayidx27.us.prol, align 8
  br label %for.body17.us.prol.loopexit

for.body17.us.prol.loopexit:                      ; preds = %for.body17.us.prol, %for.cond14.preheader.us
  %indvars.iv26.unr.ph = phi i64 [ 1, %for.body17.us.prol ], [ 0, %for.cond14.preheader.us ]
  br i1 %8, label %for.body17.us.prol.loopexit.for.cond14.for.inc31_crit_edge.us_crit_edge, label %for.body17.us.preheader

for.body17.us.prol.loopexit.for.cond14.for.inc31_crit_edge.us_crit_edge: ; preds = %for.body17.us.prol.loopexit
  %pgocount6 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %11 = add i64 %pgocount6, 1
  store i64 %11, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  br label %for.cond14.for.inc31_crit_edge.us

for.body17.us.preheader:                          ; preds = %for.body17.us.prol.loopexit
  br label %for.body17.us

for.body17.us:                                    ; preds = %for.body17.us.for.body17.us_crit_edge, %for.body17.us.preheader
  %indvars.iv26 = phi i64 [ %indvars.iv.next27.1, %for.body17.us.for.body17.us_crit_edge ], [ %indvars.iv26.unr.ph, %for.body17.us.preheader ]
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %12 = mul nuw nsw i64 %indvars.iv.next27, %indvars.iv31
  %13 = trunc i64 %12 to i32
  %rem20.us = srem i32 %13, %nk
  %conv21.us = sitofp i32 %rem20.us to double
  %div23.us = fdiv double %conv21.us, %conv22
  %arrayidx27.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv31, i64 %indvars.iv26
  store double %div23.us, double* %arrayidx27.us, align 8
  %indvars.iv.next27.1 = add nsw i64 %indvars.iv26, 2
  %14 = mul nuw nsw i64 %indvars.iv.next27.1, %indvars.iv31
  %15 = trunc i64 %14 to i32
  %rem20.us.1 = srem i32 %15, %nk
  %conv21.us.1 = sitofp i32 %rem20.us.1 to double
  %div23.us.1 = fdiv double %conv21.us.1, %conv22
  %arrayidx27.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv31, i64 %indvars.iv.next27
  store double %div23.us.1, double* %arrayidx27.us.1, align 8
  %exitcond30.1 = icmp eq i64 %indvars.iv.next27.1, %wide.trip.count29.1
  br i1 %exitcond30.1, label %for.cond14.for.inc31_crit_edge.us.loopexit, label %for.body17.us.for.body17.us_crit_edge

for.body17.us.for.body17.us_crit_edge:            ; preds = %for.body17.us
  %pgocount7 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %16 = add i64 %pgocount7, 1
  store i64 %16, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  br label %for.body17.us

for.cond14.for.inc31_crit_edge.us.loopexit:       ; preds = %for.body17.us
  %pgocount8 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  %17 = add i64 %pgocount8, 1
  store i64 %17, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  br label %for.cond14.for.inc31_crit_edge.us

for.cond14.for.inc31_crit_edge.us:                ; preds = %for.body17.us.prol.loopexit.for.cond14.for.inc31_crit_edge.us_crit_edge, %for.cond14.for.inc31_crit_edge.us.loopexit
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next32, %wide.trip.count33
  br i1 %exitcond34, label %for.cond34.preheader.loopexit, label %for.cond14.preheader.us

for.cond34.preheader.loopexit:                    ; preds = %for.cond14.for.inc31_crit_edge.us
  %pgocount9 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 14)
  %18 = add i64 %pgocount9, 1
  store i64 %18, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 14)
  br label %for.cond34.preheader

for.cond34.preheader:                             ; preds = %for.cond10.preheader.for.cond34.preheader_crit_edge, %for.cond34.preheader.loopexit, %entry
  %cmp353 = icmp sgt i32 %nk, 0
  br i1 %cmp353, label %for.cond38.preheader.lr.ph, label %for.end57

for.cond38.preheader.lr.ph:                       ; preds = %for.cond34.preheader
  %pgocount10 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 11)
  %19 = add i64 %pgocount10, 1
  store i64 %19, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 11)
  %cmp391 = icmp sgt i32 %nj, 0
  %conv46 = sitofp i32 %nj to double
  br i1 %cmp391, label %for.cond38.preheader.us.preheader, label %for.end57

for.cond38.preheader.us.preheader:                ; preds = %for.cond38.preheader.lr.ph
  %wide.trip.count = zext i32 %nj to i64
  %wide.trip.count23 = zext i32 %nk to i64
  br label %for.cond38.preheader.us

for.cond38.preheader.us:                          ; preds = %for.cond38.for.inc55_crit_edge.us, %for.cond38.preheader.us.preheader
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %for.cond38.for.inc55_crit_edge.us ], [ 0, %for.cond38.preheader.us.preheader ]
  br label %for.body41.us

for.body41.us:                                    ; preds = %for.body41.us.for.body41.us_crit_edge, %for.cond38.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond38.preheader.us ], [ %indvars.iv.next, %for.body41.us.for.body41.us_crit_edge ]
  %20 = add nuw nsw i64 %indvars.iv, 2
  %21 = mul nuw nsw i64 %20, %indvars.iv21
  %22 = trunc i64 %21 to i32
  %rem44.us = srem i32 %22, %nj
  %conv45.us = sitofp i32 %rem44.us to double
  %div47.us = fdiv double %conv45.us, %conv46
  %arrayidx51.us = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv21, i64 %indvars.iv
  store double %div47.us, double* %arrayidx51.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond38.for.inc55_crit_edge.us, label %for.body41.us.for.body41.us_crit_edge

for.body41.us.for.body41.us_crit_edge:            ; preds = %for.body41.us
  %pgocount11 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %23 = add i64 %pgocount11, 1
  store i64 %23, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  br label %for.body41.us

for.cond38.for.inc55_crit_edge.us:                ; preds = %for.body41.us
  %pgocount12 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %24 = add i64 %pgocount12, 1
  store i64 %24, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next22, %wide.trip.count23
  br i1 %exitcond24, label %for.end57.loopexit, label %for.cond38.preheader.us

for.end57.loopexit:                               ; preds = %for.cond38.for.inc55_crit_edge.us
  %pgocount13 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 13)
  %25 = add i64 %pgocount13, 1
  store i64 %25, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 13)
  br label %for.end57

for.end57:                                        ; preds = %for.end57.loopexit, %for.cond38.preheader.lr.ph, %for.cond34.preheader, %for.cond14.preheader.lr.ph
  %pgocount14 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  %26 = add i64 %pgocount14, 1
  store i64 %26, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemm(i32 %ni, i32 %nj, i32 %nk, double %alpha, double %beta, [1100 x double]* nocapture %C, [1200 x double]* nocapture readonly %A, [1100 x double]* nocapture readonly %B) unnamed_addr #2 {
entry:
  %cmp8 = icmp sgt i32 %ni, 0
  br i1 %cmp8, label %for.cond1.preheader.lr.ph, label %for.end34

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp21 = icmp sgt i32 %nj, 0
  %cmp75 = icmp sgt i32 %nk, 0
  %cmp103 = icmp sgt i32 %nj, 0
  br i1 %cmp21, label %for.cond1.preheader.us.preheader, label %for.cond1.preheader.preheader

for.cond1.preheader.preheader:                    ; preds = %for.cond1.preheader.lr.ph
  %xtraiter52 = and i32 %nj, 1
  %lcmp.mod53 = icmp eq i32 %xtraiter52, 0
  %wide.trip.count56 = zext i32 %nk to i64
  %wide.trip.count50.1 = zext i32 %nj to i64
  %wide.trip.count60 = zext i32 %ni to i64
  %0 = add nsw i64 %wide.trip.count50.1, -2
  %1 = add nsw i64 %wide.trip.count50.1, -2
  %brmerge65.demorgan = and i1 %cmp75, %cmp103
  %broadcast.splatinsert82 = insertelement <2 x double> undef, double %alpha, i32 0
  br label %for.cond1.preheader

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %2 = add i32 %nj, -1
  %xtraiter = and i32 %nj, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %3 = icmp ult i32 %2, 3
  %xtraiter37 = and i32 %nj, 1
  %lcmp.mod38 = icmp eq i32 %xtraiter37, 0
  %4 = icmp eq i32 %2, 0
  %wide.trip.count42 = zext i32 %nk to i64
  %wide.trip.count36.1 = zext i32 %nj to i64
  %wide.trip.count45 = zext i32 %ni to i64
  %wide.trip.count.3 = zext i32 %nj to i64
  %5 = add nsw i64 %wide.trip.count36.1, -2
  %6 = add nsw i64 %wide.trip.count36.1, -2
  %7 = add nsw i64 %wide.trip.count36.1, -4
  %brmerge.demorgan = and i1 %cmp75, %cmp103
  %broadcast.splatinsert130 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splatinsert162 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat163 = shufflevector <2 x double> %broadcast.splatinsert162, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc32.us, %for.cond1.preheader.us.preheader
  %indvars.iv43 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next44, %for.inc32.us ]
  %scevgep100 = getelementptr [1100 x double], [1100 x double]* %C, i64 %indvars.iv43, i64 2
  br i1 %lcmp.mod, label %for.cond1.preheader.us.for.body3.us.prol.loopexit_crit_edge, label %for.body3.us.prol.preheader

for.cond1.preheader.us.for.body3.us.prol.loopexit_crit_edge: ; preds = %for.cond1.preheader.us
  %pgocount = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 9)
  %8 = add i64 %pgocount, 1
  store i64 %8, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 9)
  br label %for.body3.us.prol.loopexit

for.body3.us.prol.preheader:                      ; preds = %for.cond1.preheader.us
  br label %for.body3.us.prol

for.body3.us.prol:                                ; preds = %for.body3.us.prol.for.body3.us.prol_crit_edge, %for.body3.us.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body3.us.prol.for.body3.us.prol_crit_edge ], [ 0, %for.body3.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body3.us.prol.for.body3.us.prol_crit_edge ], [ %xtraiter, %for.body3.us.prol.preheader ]
  %arrayidx5.us.prol = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv43, i64 %indvars.iv.prol
  %9 = load double, double* %arrayidx5.us.prol, align 8
  %mul.us.prol = fmul double %9, %beta
  store double %mul.us.prol, double* %arrayidx5.us.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body3.us.prol.loopexit.loopexit, label %for.body3.us.prol.for.body3.us.prol_crit_edge, !llvm.loop !1

for.body3.us.prol.for.body3.us.prol_crit_edge:    ; preds = %for.body3.us.prol
  %pgocount1 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 4)
  %10 = add i64 %pgocount1, 1
  store i64 %10, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 4)
  br label %for.body3.us.prol

for.body3.us.prol.loopexit.loopexit:              ; preds = %for.body3.us.prol
  %pgocount2 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 22)
  %11 = add i64 %pgocount2, 1
  store i64 %11, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 22)
  br label %for.body3.us.prol.loopexit

for.body3.us.prol.loopexit:                       ; preds = %for.cond1.preheader.us.for.body3.us.prol.loopexit_crit_edge, %for.body3.us.prol.loopexit.loopexit
  %indvars.iv.unr = phi i64 [ 0, %for.cond1.preheader.us.for.body3.us.prol.loopexit_crit_edge ], [ %indvars.iv.next.prol, %for.body3.us.prol.loopexit.loopexit ]
  br i1 %3, label %for.cond1.for.cond6.preheader_crit_edge.us, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.body3.us.prol.loopexit
  %pgocount3 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 23)
  %12 = add i64 %pgocount3, 1
  store i64 %12, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 23)
  %13 = sub i64 %7, %indvars.iv.unr
  %14 = lshr i64 %13, 2
  %15 = add nuw nsw i64 %14, 1
  %min.iters.check142 = icmp ult i64 %15, 2
  br i1 %min.iters.check142, label %for.body3.us.preheader166, label %min.iters.checked143

for.body3.us.preheader166:                        ; preds = %middle.block140, %min.iters.checked143, %for.body3.us.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked143 ], [ %indvars.iv.unr, %for.body3.us.preheader ], [ %ind.end151, %middle.block140 ]
  br label %for.body3.us

min.iters.checked143:                             ; preds = %for.body3.us.preheader
  %pgocount4 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 27)
  %16 = add i64 %pgocount4, 1
  store i64 %16, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 27)
  %n.mod.vf144 = and i64 %15, 1
  %n.vec145 = sub nsw i64 %15, %n.mod.vf144
  %cmp.zero146 = icmp eq i64 %n.vec145, 0
  %17 = add i64 %indvars.iv.unr, 4
  %18 = shl nuw i64 %14, 2
  %19 = add i64 %17, %18
  %20 = shl nuw nsw i64 %n.mod.vf144, 2
  %ind.end151 = sub i64 %19, %20
  br i1 %cmp.zero146, label %for.body3.us.preheader166, label %vector.ph147

vector.ph147:                                     ; preds = %min.iters.checked143
  br label %vector.body139

vector.body139:                                   ; preds = %vector.body139.vector.body139_crit_edge, %vector.ph147
  %index148 = phi i64 [ 0, %vector.ph147 ], [ %index.next149, %vector.body139.vector.body139_crit_edge ]
  %21 = shl i64 %index148, 2
  %22 = add i64 %indvars.iv.unr, %21
  %23 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv43, i64 %22
  %24 = bitcast double* %23 to <8 x double>*
  %wide.vec157 = load <8 x double>, <8 x double>* %24, align 8
  %strided.vec158 = shufflevector <8 x double> %wide.vec157, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec159 = shufflevector <8 x double> %wide.vec157, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec160 = shufflevector <8 x double> %wide.vec157, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec161 = shufflevector <8 x double> %wide.vec157, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %25 = fmul <2 x double> %strided.vec158, %broadcast.splat163
  %26 = fmul <2 x double> %strided.vec159, %broadcast.splat163
  %27 = fmul <2 x double> %strided.vec160, %broadcast.splat163
  %28 = add nsw i64 %22, 3
  %29 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv43, i64 %28
  %30 = fmul <2 x double> %strided.vec161, %broadcast.splat163
  %31 = getelementptr double, double* %29, i64 -3
  %32 = bitcast double* %31 to <8 x double>*
  %33 = shufflevector <2 x double> %25, <2 x double> %26, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %34 = shufflevector <2 x double> %27, <2 x double> %30, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec164 = shufflevector <4 x double> %33, <4 x double> %34, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec164, <8 x double>* %32, align 8
  %index.next149 = add i64 %index148, 2
  %35 = icmp eq i64 %index.next149, %n.vec145
  br i1 %35, label %middle.block140, label %vector.body139.vector.body139_crit_edge, !llvm.loop !3

vector.body139.vector.body139_crit_edge:          ; preds = %vector.body139
  %pgocount5 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 7)
  %36 = add i64 %pgocount5, 1
  store i64 %36, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 7)
  br label %vector.body139

middle.block140:                                  ; preds = %vector.body139
  %pgocount6 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 28)
  %37 = add i64 %pgocount6, 1
  store i64 %37, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 28)
  %cmp.n152 = icmp eq i64 %n.mod.vf144, 0
  br i1 %cmp.n152, label %for.cond1.for.cond6.preheader_crit_edge.us, label %for.body3.us.preheader166

for.inc32.us.loopexit:                            ; preds = %for.cond9.for.inc29_crit_edge.us.us
  %pgocount7 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 24)
  %38 = add i64 %pgocount7, 1
  store i64 %38, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 24)
  br label %for.inc32.us

for.inc32.us:                                     ; preds = %for.cond1.for.cond6.preheader_crit_edge.us, %for.inc32.us.loopexit
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next44, %wide.trip.count45
  br i1 %exitcond46, label %for.end34.loopexit, label %for.cond1.preheader.us

for.body3.us:                                     ; preds = %for.body3.us.for.body3.us_crit_edge, %for.body3.us.preheader166
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body3.us.for.body3.us_crit_edge ], [ %indvars.iv.ph, %for.body3.us.preheader166 ]
  %arrayidx5.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv43, i64 %indvars.iv
  %39 = load double, double* %arrayidx5.us, align 8
  %mul.us = fmul double %39, %beta
  store double %mul.us, double* %arrayidx5.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx5.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv43, i64 %indvars.iv.next
  %40 = load double, double* %arrayidx5.us.1, align 8
  %mul.us.1 = fmul double %40, %beta
  store double %mul.us.1, double* %arrayidx5.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.us.2 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv43, i64 %indvars.iv.next.1
  %41 = load double, double* %arrayidx5.us.2, align 8
  %mul.us.2 = fmul double %41, %beta
  store double %mul.us.2, double* %arrayidx5.us.2, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx5.us.3 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv43, i64 %indvars.iv.next.2
  %42 = load double, double* %arrayidx5.us.3, align 8
  %mul.us.3 = fmul double %42, %beta
  store double %mul.us.3, double* %arrayidx5.us.3, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %for.cond1.for.cond6.preheader_crit_edge.us.loopexit, label %for.body3.us.for.body3.us_crit_edge, !llvm.loop !6

for.body3.us.for.body3.us_crit_edge:              ; preds = %for.body3.us
  %pgocount8 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 5)
  %43 = add i64 %pgocount8, 1
  store i64 %43, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 5)
  br label %for.body3.us

for.cond1.for.cond6.preheader_crit_edge.us.loopexit: ; preds = %for.body3.us
  %pgocount9 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 25)
  %44 = add i64 %pgocount9, 1
  store i64 %44, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 25)
  br label %for.cond1.for.cond6.preheader_crit_edge.us

for.cond1.for.cond6.preheader_crit_edge.us:       ; preds = %for.cond1.for.cond6.preheader_crit_edge.us.loopexit, %middle.block140, %for.body3.us.prol.loopexit
  br i1 %brmerge.demorgan, label %for.cond9.preheader.us.us.preheader, label %for.inc32.us

for.cond9.preheader.us.us.preheader:              ; preds = %for.cond1.for.cond6.preheader_crit_edge.us
  %arrayidx25.us.us.prol = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv43, i64 0
  br label %for.cond9.preheader.us.us

for.cond9.preheader.us.us:                        ; preds = %for.cond9.for.inc29_crit_edge.us.us, %for.cond9.preheader.us.us.preheader
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %for.cond9.for.inc29_crit_edge.us.us ], [ 0, %for.cond9.preheader.us.us.preheader ]
  %scevgep106 = getelementptr [1100 x double], [1100 x double]* %B, i64 %indvars.iv40, i64 2
  %arrayidx15.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv43, i64 %indvars.iv40
  br i1 %lcmp.mod38, label %for.body11.us.us.prol.loopexit, label %for.body11.us.us.prol

for.body11.us.us.prol:                            ; preds = %for.cond9.preheader.us.us
  %pgocount10 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 14)
  %45 = add i64 %pgocount10, 1
  store i64 %45, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 14)
  %46 = load double, double* %arrayidx15.us.us, align 8
  %mul16.us.us.prol = fmul double %46, %alpha
  %arrayidx20.us.us.prol = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv40, i64 0
  %47 = load double, double* %arrayidx20.us.us.prol, align 8
  %mul21.us.us.prol = fmul double %mul16.us.us.prol, %47
  %48 = load double, double* %arrayidx25.us.us.prol, align 8
  %add.us.us.prol = fadd double %48, %mul21.us.us.prol
  store double %add.us.us.prol, double* %arrayidx25.us.us.prol, align 8
  br label %for.body11.us.us.prol.loopexit

for.body11.us.us.prol.loopexit:                   ; preds = %for.body11.us.us.prol, %for.cond9.preheader.us.us
  %indvars.iv34.unr.ph = phi i64 [ 1, %for.body11.us.us.prol ], [ 0, %for.cond9.preheader.us.us ]
  br i1 %4, label %for.body11.us.us.prol.loopexit.for.cond9.for.inc29_crit_edge.us.us_crit_edge, label %for.body11.us.us.preheader

for.body11.us.us.prol.loopexit.for.cond9.for.inc29_crit_edge.us.us_crit_edge: ; preds = %for.body11.us.us.prol.loopexit
  %pgocount11 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 6)
  %49 = add i64 %pgocount11, 1
  store i64 %49, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 6)
  br label %for.cond9.for.inc29_crit_edge.us.us

for.body11.us.us.preheader:                       ; preds = %for.body11.us.us.prol.loopexit
  %pgocount12 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 11)
  %50 = add i64 %pgocount12, 1
  store i64 %50, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 11)
  %51 = sub nsw i64 %5, %indvars.iv34.unr.ph
  %52 = lshr i64 %51, 1
  %53 = add nuw i64 %52, 1
  %min.iters.check91 = icmp ult i64 %53, 2
  br i1 %min.iters.check91, label %for.body11.us.us.preheader165, label %min.iters.checked92

for.body11.us.us.preheader165:                    ; preds = %middle.block89, %vector.memcheck119, %min.iters.checked92, %for.body11.us.us.preheader
  %indvars.iv34.ph = phi i64 [ %indvars.iv34.unr.ph, %vector.memcheck119 ], [ %indvars.iv34.unr.ph, %min.iters.checked92 ], [ %indvars.iv34.unr.ph, %for.body11.us.us.preheader ], [ %ind.end124, %middle.block89 ]
  br label %for.body11.us.us

min.iters.checked92:                              ; preds = %for.body11.us.us.preheader
  %pgocount13 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 15)
  %54 = add i64 %pgocount13, 1
  store i64 %54, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 15)
  %n.mod.vf93 = and i64 %53, 1
  %n.vec94 = sub i64 %53, %n.mod.vf93
  %cmp.zero95 = icmp eq i64 %n.vec94, 0
  br i1 %cmp.zero95, label %for.body11.us.us.preheader165, label %vector.memcheck119

vector.memcheck119:                               ; preds = %min.iters.checked92
  %pgocount14 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 18)
  %55 = add i64 %pgocount14, 1
  store i64 %55, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 18)
  %scevgep98 = getelementptr [1100 x double], [1100 x double]* %C, i64 %indvars.iv43, i64 %indvars.iv34.unr.ph
  %56 = sub nsw i64 %6, %indvars.iv34.unr.ph
  %57 = and i64 %56, -2
  %58 = or i64 %indvars.iv34.unr.ph, %57
  %scevgep101 = getelementptr double, double* %scevgep100, i64 %58
  %scevgep104 = getelementptr [1100 x double], [1100 x double]* %B, i64 %indvars.iv40, i64 %indvars.iv34.unr.ph
  %scevgep107 = getelementptr double, double* %scevgep106, i64 %58
  %bound0111 = icmp ult double* %scevgep98, %arrayidx15.us.us
  %bound1112 = icmp ult double* %arrayidx15.us.us, %scevgep101
  %found.conflict113 = and i1 %bound0111, %bound1112
  %bound0114 = icmp ult double* %scevgep98, %scevgep107
  %bound1115 = icmp ult double* %scevgep104, %scevgep101
  %found.conflict116 = and i1 %bound0114, %bound1115
  %conflict.rdx117 = or i1 %found.conflict113, %found.conflict116
  %59 = or i64 %indvars.iv34.unr.ph, 2
  %60 = shl nuw i64 %52, 1
  %61 = add i64 %59, %60
  %62 = shl nuw nsw i64 %n.mod.vf93, 1
  %ind.end124 = sub i64 %61, %62
  br i1 %conflict.rdx117, label %for.body11.us.us.preheader165, label %vector.ph120

vector.ph120:                                     ; preds = %vector.memcheck119
  %63 = load double, double* %arrayidx15.us.us, align 8, !alias.scope !8
  %64 = insertelement <2 x double> undef, double %63, i32 0
  %65 = fmul <2 x double> %64, %broadcast.splatinsert130
  %66 = shufflevector <2 x double> %65, <2 x double> undef, <2 x i32> zeroinitializer
  %67 = load double, double* %arrayidx15.us.us, align 8, !alias.scope !8
  %68 = insertelement <2 x double> undef, double %67, i32 0
  %69 = fmul <2 x double> %68, %broadcast.splatinsert130
  %70 = shufflevector <2 x double> %69, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body88

vector.body88:                                    ; preds = %vector.body88.vector.body88_crit_edge, %vector.ph120
  %index121 = phi i64 [ 0, %vector.ph120 ], [ %index.next122, %vector.body88.vector.body88_crit_edge ]
  %71 = shl i64 %index121, 1
  %offset.idx126 = or i64 %indvars.iv34.unr.ph, %71
  %72 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv40, i64 %offset.idx126
  %73 = bitcast double* %72 to <4 x double>*
  %wide.vec132 = load <4 x double>, <4 x double>* %73, align 8, !alias.scope !11
  %strided.vec133 = shufflevector <4 x double> %wide.vec132, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec134 = shufflevector <4 x double> %wide.vec132, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %74 = fmul <2 x double> %66, %strided.vec133
  %75 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv43, i64 %offset.idx126
  %76 = bitcast double* %75 to <4 x double>*
  %wide.vec135 = load <4 x double>, <4 x double>* %76, align 8, !alias.scope !13, !noalias !15
  %strided.vec136 = shufflevector <4 x double> %wide.vec135, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec137 = shufflevector <4 x double> %wide.vec135, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %77 = fadd <2 x double> %strided.vec136, %74
  %78 = add nuw nsw i64 %offset.idx126, 1
  %79 = fmul <2 x double> %70, %strided.vec134
  %80 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv43, i64 %78
  %81 = fadd <2 x double> %strided.vec137, %79
  %82 = getelementptr double, double* %80, i64 -1
  %83 = bitcast double* %82 to <4 x double>*
  %interleaved.vec138 = shufflevector <2 x double> %77, <2 x double> %81, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec138, <4 x double>* %83, align 8, !alias.scope !13, !noalias !15
  %index.next122 = add i64 %index121, 2
  %84 = icmp eq i64 %index.next122, %n.vec94
  br i1 %84, label %middle.block89, label %vector.body88.vector.body88_crit_edge, !llvm.loop !16

vector.body88.vector.body88_crit_edge:            ; preds = %vector.body88
  %pgocount15 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 2)
  %85 = add i64 %pgocount15, 1
  store i64 %85, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 2)
  br label %vector.body88

middle.block89:                                   ; preds = %vector.body88
  %pgocount16 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 20)
  %86 = add i64 %pgocount16, 1
  store i64 %86, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 20)
  %cmp.n125 = icmp eq i64 %n.mod.vf93, 0
  br i1 %cmp.n125, label %for.cond9.for.inc29_crit_edge.us.us, label %for.body11.us.us.preheader165

for.cond9.for.inc29_crit_edge.us.us.loopexit:     ; preds = %for.body11.us.us
  %pgocount17 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 12)
  %87 = add i64 %pgocount17, 1
  store i64 %87, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 12)
  br label %for.cond9.for.inc29_crit_edge.us.us

for.cond9.for.inc29_crit_edge.us.us:              ; preds = %for.body11.us.us.prol.loopexit.for.cond9.for.inc29_crit_edge.us.us_crit_edge, %for.cond9.for.inc29_crit_edge.us.us.loopexit, %middle.block89
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond = icmp eq i64 %indvars.iv.next41, %wide.trip.count42
  br i1 %exitcond, label %for.inc32.us.loopexit, label %for.cond9.preheader.us.us

for.body11.us.us:                                 ; preds = %for.body11.us.us.for.body11.us.us_crit_edge, %for.body11.us.us.preheader165
  %indvars.iv34 = phi i64 [ %indvars.iv.next35.1, %for.body11.us.us.for.body11.us.us_crit_edge ], [ %indvars.iv34.ph, %for.body11.us.us.preheader165 ]
  %88 = load double, double* %arrayidx15.us.us, align 8
  %mul16.us.us = fmul double %88, %alpha
  %arrayidx20.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv40, i64 %indvars.iv34
  %89 = load double, double* %arrayidx20.us.us, align 8
  %mul21.us.us = fmul double %mul16.us.us, %89
  %arrayidx25.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv43, i64 %indvars.iv34
  %90 = load double, double* %arrayidx25.us.us, align 8
  %add.us.us = fadd double %90, %mul21.us.us
  store double %add.us.us, double* %arrayidx25.us.us, align 8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %91 = load double, double* %arrayidx15.us.us, align 8
  %mul16.us.us.1 = fmul double %91, %alpha
  %arrayidx20.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv40, i64 %indvars.iv.next35
  %92 = load double, double* %arrayidx20.us.us.1, align 8
  %mul21.us.us.1 = fmul double %mul16.us.us.1, %92
  %arrayidx25.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv43, i64 %indvars.iv.next35
  %93 = load double, double* %arrayidx25.us.us.1, align 8
  %add.us.us.1 = fadd double %93, %mul21.us.us.1
  store double %add.us.us.1, double* %arrayidx25.us.us.1, align 8
  %indvars.iv.next35.1 = add nsw i64 %indvars.iv34, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next35.1, %wide.trip.count36.1
  br i1 %exitcond.1, label %for.cond9.for.inc29_crit_edge.us.us.loopexit, label %for.body11.us.us.for.body11.us.us_crit_edge, !llvm.loop !17

for.body11.us.us.for.body11.us.us_crit_edge:      ; preds = %for.body11.us.us
  %pgocount18 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 0)
  %94 = add i64 %pgocount18, 1
  store i64 %94, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 0)
  br label %for.body11.us.us

for.cond1.preheader:                              ; preds = %for.inc32, %for.cond1.preheader.preheader
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %for.inc32 ], [ 0, %for.cond1.preheader.preheader ]
  %scevgep69 = getelementptr [1100 x double], [1100 x double]* %C, i64 %indvars.iv58, i64 2
  br i1 %brmerge65.demorgan, label %for.cond9.preheader.us.preheader, label %for.cond1.preheader.for.inc32_crit_edge

for.cond1.preheader.for.inc32_crit_edge:          ; preds = %for.cond1.preheader
  %pgocount19 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 10)
  %95 = add i64 %pgocount19, 1
  store i64 %95, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 10)
  br label %for.inc32

for.cond9.preheader.us.preheader:                 ; preds = %for.cond1.preheader
  %arrayidx25.us.prol = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv58, i64 0
  br label %for.cond9.preheader.us

for.cond9.preheader.us:                           ; preds = %for.cond9.for.inc29_crit_edge.us, %for.cond9.preheader.us.preheader
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %for.cond9.for.inc29_crit_edge.us ], [ 0, %for.cond9.preheader.us.preheader ]
  %scevgep75 = getelementptr [1100 x double], [1100 x double]* %B, i64 %indvars.iv54, i64 2
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %A, i64 %indvars.iv58, i64 %indvars.iv54
  br i1 %lcmp.mod53, label %for.body11.us.preheader, label %for.body11.us.prol

for.body11.us.prol:                               ; preds = %for.cond9.preheader.us
  %pgocount20 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 16)
  %96 = add i64 %pgocount20, 1
  store i64 %96, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 16)
  %97 = load double, double* %arrayidx15.us, align 8
  %mul16.us.prol = fmul double %97, %alpha
  %arrayidx20.us.prol = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv54, i64 0
  %98 = load double, double* %arrayidx20.us.prol, align 8
  %mul21.us.prol = fmul double %mul16.us.prol, %98
  %99 = load double, double* %arrayidx25.us.prol, align 8
  %add.us.prol = fadd double %99, %mul21.us.prol
  store double %add.us.prol, double* %arrayidx25.us.prol, align 8
  br label %for.body11.us.preheader

for.body11.us.preheader:                          ; preds = %for.body11.us.prol, %for.cond9.preheader.us
  %indvars.iv48.unr.ph = phi i64 [ 1, %for.body11.us.prol ], [ 0, %for.cond9.preheader.us ]
  %100 = sub nsw i64 %0, %indvars.iv48.unr.ph
  %101 = lshr i64 %100, 1
  %102 = add nuw i64 %101, 1
  %min.iters.check = icmp ult i64 %102, 2
  br i1 %min.iters.check, label %for.body11.us.preheader167, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body11.us.preheader
  %pgocount21 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 17)
  %103 = add i64 %pgocount21, 1
  store i64 %103, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 17)
  %n.mod.vf = and i64 %102, 1
  %n.vec = sub i64 %102, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %for.body11.us.preheader167, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %pgocount22 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 19)
  %104 = add i64 %pgocount22, 1
  store i64 %104, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 19)
  %scevgep67 = getelementptr [1100 x double], [1100 x double]* %C, i64 %indvars.iv58, i64 %indvars.iv48.unr.ph
  %105 = sub nsw i64 %1, %indvars.iv48.unr.ph
  %106 = and i64 %105, -2
  %107 = or i64 %indvars.iv48.unr.ph, %106
  %scevgep70 = getelementptr double, double* %scevgep69, i64 %107
  %scevgep73 = getelementptr [1100 x double], [1100 x double]* %B, i64 %indvars.iv54, i64 %indvars.iv48.unr.ph
  %scevgep76 = getelementptr double, double* %scevgep75, i64 %107
  %bound0 = icmp ult double* %scevgep67, %arrayidx15.us
  %bound1 = icmp ult double* %arrayidx15.us, %scevgep70
  %found.conflict = and i1 %bound0, %bound1
  %bound079 = icmp ult double* %scevgep67, %scevgep76
  %bound180 = icmp ult double* %scevgep73, %scevgep70
  %found.conflict81 = and i1 %bound079, %bound180
  %conflict.rdx = or i1 %found.conflict, %found.conflict81
  %108 = or i64 %indvars.iv48.unr.ph, 2
  %109 = shl nuw i64 %101, 1
  %110 = add i64 %108, %109
  %111 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %110, %111
  br i1 %conflict.rdx, label %for.body11.us.preheader167, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %112 = load double, double* %arrayidx15.us, align 8, !alias.scope !18
  %113 = insertelement <2 x double> undef, double %112, i32 0
  %114 = fmul <2 x double> %113, %broadcast.splatinsert82
  %115 = shufflevector <2 x double> %114, <2 x double> undef, <2 x i32> zeroinitializer
  %116 = load double, double* %arrayidx15.us, align 8, !alias.scope !18
  %117 = insertelement <2 x double> undef, double %116, i32 0
  %118 = fmul <2 x double> %117, %broadcast.splatinsert82
  %119 = shufflevector <2 x double> %118, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %120 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv48.unr.ph, %120
  %121 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv54, i64 %offset.idx
  %122 = bitcast double* %121 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %122, align 8, !alias.scope !21
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec84 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %123 = fmul <2 x double> %115, %strided.vec
  %124 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv58, i64 %offset.idx
  %125 = bitcast double* %124 to <4 x double>*
  %wide.vec85 = load <4 x double>, <4 x double>* %125, align 8, !alias.scope !23, !noalias !25
  %strided.vec86 = shufflevector <4 x double> %wide.vec85, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec87 = shufflevector <4 x double> %wide.vec85, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %126 = fadd <2 x double> %strided.vec86, %123
  %127 = add nuw nsw i64 %offset.idx, 1
  %128 = fmul <2 x double> %119, %strided.vec84
  %129 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv58, i64 %127
  %130 = fadd <2 x double> %strided.vec87, %128
  %131 = getelementptr double, double* %129, i64 -1
  %132 = bitcast double* %131 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %126, <2 x double> %130, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %132, align 8, !alias.scope !23, !noalias !25
  %index.next = add i64 %index, 2
  %133 = icmp eq i64 %index.next, %n.vec
  br i1 %133, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !26

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  %pgocount23 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 3)
  %134 = add i64 %pgocount23, 1
  store i64 %134, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 3)
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %pgocount24 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 21)
  %135 = add i64 %pgocount24, 1
  store i64 %135, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 21)
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.cond9.for.inc29_crit_edge.us, label %middle.block.for.body11.us.preheader167_crit_edge

middle.block.for.body11.us.preheader167_crit_edge: ; preds = %middle.block
  %pgocount25 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 8)
  %136 = add i64 %pgocount25, 1
  store i64 %136, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 8)
  br label %for.body11.us.preheader167

for.body11.us.preheader167:                       ; preds = %middle.block.for.body11.us.preheader167_crit_edge, %vector.memcheck, %min.iters.checked, %for.body11.us.preheader
  %indvars.iv48.ph = phi i64 [ %indvars.iv48.unr.ph, %vector.memcheck ], [ %indvars.iv48.unr.ph, %min.iters.checked ], [ %indvars.iv48.unr.ph, %for.body11.us.preheader ], [ %ind.end, %middle.block.for.body11.us.preheader167_crit_edge ]
  br label %for.body11.us

for.body11.us:                                    ; preds = %for.body11.us.for.body11.us_crit_edge, %for.body11.us.preheader167
  %indvars.iv48 = phi i64 [ %indvars.iv.next49.1, %for.body11.us.for.body11.us_crit_edge ], [ %indvars.iv48.ph, %for.body11.us.preheader167 ]
  %137 = load double, double* %arrayidx15.us, align 8
  %mul16.us = fmul double %137, %alpha
  %arrayidx20.us = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv54, i64 %indvars.iv48
  %138 = load double, double* %arrayidx20.us, align 8
  %mul21.us = fmul double %mul16.us, %138
  %arrayidx25.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv58, i64 %indvars.iv48
  %139 = load double, double* %arrayidx25.us, align 8
  %add.us = fadd double %139, %mul21.us
  store double %add.us, double* %arrayidx25.us, align 8
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %140 = load double, double* %arrayidx15.us, align 8
  %mul16.us.1 = fmul double %140, %alpha
  %arrayidx20.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %B, i64 %indvars.iv54, i64 %indvars.iv.next49
  %141 = load double, double* %arrayidx20.us.1, align 8
  %mul21.us.1 = fmul double %mul16.us.1, %141
  %arrayidx25.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv58, i64 %indvars.iv.next49
  %142 = load double, double* %arrayidx25.us.1, align 8
  %add.us.1 = fadd double %142, %mul21.us.1
  store double %add.us.1, double* %arrayidx25.us.1, align 8
  %indvars.iv.next49.1 = add nsw i64 %indvars.iv48, 2
  %exitcond51.1 = icmp eq i64 %indvars.iv.next49.1, %wide.trip.count50.1
  br i1 %exitcond51.1, label %for.cond9.for.inc29_crit_edge.us.loopexit, label %for.body11.us.for.body11.us_crit_edge, !llvm.loop !27

for.body11.us.for.body11.us_crit_edge:            ; preds = %for.body11.us
  %pgocount26 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 1)
  %143 = add i64 %pgocount26, 1
  store i64 %143, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 1)
  br label %for.body11.us

for.cond9.for.inc29_crit_edge.us.loopexit:        ; preds = %for.body11.us
  %pgocount27 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 13)
  %144 = add i64 %pgocount27, 1
  store i64 %144, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 13)
  br label %for.cond9.for.inc29_crit_edge.us

for.cond9.for.inc29_crit_edge.us:                 ; preds = %for.cond9.for.inc29_crit_edge.us.loopexit, %middle.block
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next55, %wide.trip.count56
  br i1 %exitcond57, label %for.inc32.loopexit, label %for.cond9.preheader.us

for.inc32.loopexit:                               ; preds = %for.cond9.for.inc29_crit_edge.us
  %pgocount28 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 26)
  %145 = add i64 %pgocount28, 1
  store i64 %145, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 26)
  br label %for.inc32

for.inc32:                                        ; preds = %for.cond1.preheader.for.inc32_crit_edge, %for.inc32.loopexit
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next59, %wide.trip.count60
  br i1 %exitcond61, label %for.end34.loopexit168, label %for.cond1.preheader

for.end34.loopexit:                               ; preds = %for.inc32.us
  %pgocount29 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 30)
  %146 = add i64 %pgocount29, 1
  store i64 %146, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 30)
  br label %for.end34

for.end34.loopexit168:                            ; preds = %for.inc32
  %pgocount30 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 31)
  %147 = add i64 %pgocount30, 1
  store i64 %147, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 31)
  br label %for.end34

for.end34:                                        ; preds = %for.end34.loopexit168, %for.end34.loopexit, %entry
  %pgocount31 = load i64, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 29)
  %148 = add i64 %pgocount31, 1
  store i64 %148, i64* getelementptr inbounds ([32 x i64], [32 x i64]* @__profc_B.ll_kernel_gemm, i64 0, i64 29)
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %ni, i32 %nj, [1100 x double]* nocapture readonly %C) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %cmp4 = icmp sgt i32 %ni, 0
  %cmp31 = icmp sgt i32 %nj, 0
  %or.cond = and i1 %cmp4, %cmp31
  br i1 %or.cond, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %ni to i64
  %wide.trip.count = zext i32 %nj to i64
  %wide.trip.count11 = zext i32 %ni to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv8 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next9, %for.cond2.for.inc10_crit_edge.us ]
  %4 = mul nsw i64 %indvars.iv8, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %5 = add nsw i64 %indvars.iv, %4
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.body4.us.if.end.us_crit_edge

for.body4.us.if.end.us_crit_edge:                 ; preds = %for.body4.us
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %7 = add i64 %pgocount, 1
  store i64 %7, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  br label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %8 = add i64 %pgocount1, 1
  store i64 %8, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %9) #5
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us.if.end.us_crit_edge, %if.then.us
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1100 x double], [1100 x double]* %C, i64 %indvars.iv8, i64 %indvars.iv
  %11 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %11) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %12 = add i64 %pgocount2, 1
  store i64 %12, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next9, %wide.trip.count11
  br i1 %exitcond12, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  %pgocount3 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 4)
  %13 = add i64 %pgocount3, 1
  store i64 %13, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 4)
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %pgocount4 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %14 = add i64 %pgocount4, 1
  store i64 %14, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %16) #5
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
