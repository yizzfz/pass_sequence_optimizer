; ModuleID = 'B.ll'
source_filename = "trmm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_trmm = private constant [16 x i8] c"B.ll:kernel_trmm"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 32414643582, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [16 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 196530673398, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 16, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_trmm = private global [16 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_trmm = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 1172305909204374240, i64 190551655843, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i32 0, i32 0), i8* null, i8* null, i32 16, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 63976198547, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [56 x i8] c"6\00main\01B.ll:init_array\01B.ll:kernel_trmm\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_trmm to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([56 x i8], [56 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1000 x double]*
  %arraydecay2 = bitcast i8* %call1 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %alpha, [1000 x double]* %arraydecay, [1200 x double]* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  tail call fastcc void @kernel_trmm(i32 1000, i32 1200, double %0, [1000 x double]* %arraydecay, [1200 x double]* %arraydecay2)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %pgocount = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 1)
  %2 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %2, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %pgocount1 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  %3 = add i64 %pgocount1, 1
  store i64 %3, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 2)
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %arraydecay2)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %4 = add i64 %pgocount2, 1
  store i64 %4, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %m, i32 %n, double* nocapture %alpha, [1000 x double]* nocapture %A, [1200 x double]* nocapture %B) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  %cmp5 = icmp sgt i32 %m, 0
  br i1 %cmp5, label %for.cond1.preheader.lr.ph, label %for.end29

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp123 = icmp sgt i32 %n, 0
  %conv18 = sitofp i32 %n to double
  %conv4 = sitofp i32 %m to double
  br i1 %cmp123, label %for.cond1.preheader.us.preheader, label %for.cond1.preheader.preheader

for.cond1.preheader.preheader:                    ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count36 = zext i32 %m to i64
  br label %for.cond1.preheader

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %xtraiter15 = and i32 %n, 1
  %lcmp.mod16 = icmp eq i32 %xtraiter15, 0
  %0 = icmp eq i32 %n, 1
  %wide.trip.count23 = zext i32 %m to i64
  %wide.trip.count14.1 = zext i32 %n to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond11.for.inc27_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %for.cond11.for.inc27_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  %1 = add i64 %indvars.iv21, 4294967295
  %cmp21.us = icmp sgt i64 %indvars.iv21, 0
  br i1 %cmp21.us, label %for.body3.lr.ph.us, label %for.cond1.preheader.us.for.end.us_crit_edge

for.cond1.preheader.us.for.end.us_crit_edge:      ; preds = %for.cond1.preheader.us
  %pgocount = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  br label %for.end.us

for.end.us.loopexit:                              ; preds = %for.body3.us
  br label %for.end.us

for.end.us:                                       ; preds = %for.cond1.preheader.us.for.end.us_crit_edge, %for.body3.us.prol.loopexit, %for.end.us.loopexit
  %arrayidx10.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv21, i64 %indvars.iv21
  store double 1.000000e+00, double* %arrayidx10.us, align 8
  %3 = trunc i64 %indvars.iv21 to i32
  %sub.us = add i32 %3, %n
  br i1 %lcmp.mod16, label %for.body14.us.prol.loopexit, label %for.body14.us.prol

for.body14.us.prol:                               ; preds = %for.end.us
  %pgocount1 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %4 = add i64 %pgocount1, 1
  store i64 %4, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %rem16.us.prol = srem i32 %sub.us, %n
  %conv17.us.prol = sitofp i32 %rem16.us.prol to double
  %div19.us.prol = fdiv double %conv17.us.prol, %conv18
  %arrayidx23.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv21, i64 0
  store double %div19.us.prol, double* %arrayidx23.us.prol, align 8
  br label %for.body14.us.prol.loopexit

for.body14.us.prol.loopexit:                      ; preds = %for.body14.us.prol, %for.end.us
  %indvars.iv12.unr.ph = phi i64 [ 1, %for.body14.us.prol ], [ 0, %for.end.us ]
  br i1 %0, label %for.cond11.for.inc27_crit_edge.us, label %for.body14.us.preheader

for.body14.us.preheader:                          ; preds = %for.body14.us.prol.loopexit
  br label %for.body14.us

for.body14.us:                                    ; preds = %for.body14.us.for.body14.us_crit_edge, %for.body14.us.preheader
  %indvars.iv12 = phi i64 [ %indvars.iv.next13.1, %for.body14.us.for.body14.us_crit_edge ], [ %indvars.iv12.unr.ph, %for.body14.us.preheader ]
  %5 = trunc i64 %indvars.iv12 to i32
  %add15.us = sub i32 %sub.us, %5
  %rem16.us = srem i32 %add15.us, %n
  %conv17.us = sitofp i32 %rem16.us to double
  %div19.us = fdiv double %conv17.us, %conv18
  %arrayidx23.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv21, i64 %indvars.iv12
  store double %div19.us, double* %arrayidx23.us, align 8
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %6 = trunc i64 %indvars.iv.next13 to i32
  %add15.us.1 = sub i32 %sub.us, %6
  %rem16.us.1 = srem i32 %add15.us.1, %n
  %conv17.us.1 = sitofp i32 %rem16.us.1 to double
  %div19.us.1 = fdiv double %conv17.us.1, %conv18
  %arrayidx23.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv21, i64 %indvars.iv.next13
  store double %div19.us.1, double* %arrayidx23.us.1, align 8
  %indvars.iv.next13.1 = add nsw i64 %indvars.iv12, 2
  %exitcond.118 = icmp eq i64 %indvars.iv.next13.1, %wide.trip.count14.1
  br i1 %exitcond.118, label %for.cond11.for.inc27_crit_edge.us.loopexit, label %for.body14.us.for.body14.us_crit_edge

for.body14.us.for.body14.us_crit_edge:            ; preds = %for.body14.us
  %pgocount2 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %7 = add i64 %pgocount2, 1
  store i64 %7, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  br label %for.body14.us

for.body3.us:                                     ; preds = %for.body3.us.for.body3.us_crit_edge, %for.body3.us.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body3.us.for.body3.us_crit_edge ], [ %indvars.iv.unr.ph, %for.body3.us.preheader ]
  %8 = add nuw nsw i64 %indvars.iv, %indvars.iv21
  %9 = trunc i64 %8 to i32
  %rem.us = srem i32 %9, %m
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv21, i64 %indvars.iv
  store double %div.us, double* %arrayidx6.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %10 = add nuw nsw i64 %indvars.iv.next, %indvars.iv21
  %11 = trunc i64 %10 to i32
  %rem.us.1 = srem i32 %11, %m
  %conv.us.1 = sitofp i32 %rem.us.1 to double
  %div.us.1 = fdiv double %conv.us.1, %conv4
  %arrayidx6.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv21, i64 %indvars.iv.next
  store double %div.us.1, double* %arrayidx6.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv21
  br i1 %exitcond.1, label %for.end.us.loopexit, label %for.body3.us.for.body3.us_crit_edge

for.body3.us.for.body3.us_crit_edge:              ; preds = %for.body3.us
  %pgocount3 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %12 = add i64 %pgocount3, 1
  store i64 %12, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  br label %for.body3.us

for.body3.lr.ph.us:                               ; preds = %for.cond1.preheader.us
  %pgocount4 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %13 = add i64 %pgocount4, 1
  store i64 %13, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %xtraiter39 = and i64 %indvars.iv21, 1
  %lcmp.mod = icmp eq i64 %xtraiter39, 0
  br i1 %lcmp.mod, label %for.body3.us.prol.loopexit, label %for.body3.us.prol

for.body3.us.prol:                                ; preds = %for.body3.lr.ph.us
  %pgocount5 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 10)
  %14 = add i64 %pgocount5, 1
  store i64 %14, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 10)
  %15 = trunc i64 %indvars.iv21 to i32
  %rem.us.prol = srem i32 %15, %m
  %conv.us.prol = sitofp i32 %rem.us.prol to double
  %div.us.prol = fdiv double %conv.us.prol, %conv4
  %arrayidx6.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv21, i64 0
  store double %div.us.prol, double* %arrayidx6.us.prol, align 8
  br label %for.body3.us.prol.loopexit

for.body3.us.prol.loopexit:                       ; preds = %for.body3.us.prol, %for.body3.lr.ph.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body3.us.prol ], [ 0, %for.body3.lr.ph.us ]
  %16 = trunc i64 %1 to i32
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %for.end.us, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.body3.us.prol.loopexit
  %pgocount6 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  %18 = add i64 %pgocount6, 1
  store i64 %18, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  br label %for.body3.us

for.cond11.for.inc27_crit_edge.us.loopexit:       ; preds = %for.body14.us
  %pgocount7 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %19 = add i64 %pgocount7, 1
  store i64 %19, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  br label %for.cond11.for.inc27_crit_edge.us

for.cond11.for.inc27_crit_edge.us:                ; preds = %for.cond11.for.inc27_crit_edge.us.loopexit, %for.body14.us.prol.loopexit
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond = icmp eq i64 %indvars.iv.next22, %wide.trip.count23
  br i1 %exitcond, label %for.end29.loopexit, label %for.cond1.preheader.us

for.cond1.preheader:                              ; preds = %for.end, %for.cond1.preheader.preheader
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %for.end ], [ 0, %for.cond1.preheader.preheader ]
  %20 = add i64 %indvars.iv34, 4294967295
  %cmp21 = icmp sgt i64 %indvars.iv34, 0
  br i1 %cmp21, label %for.body3.lr.ph, label %for.cond1.preheader.for.end_crit_edge

for.cond1.preheader.for.end_crit_edge:            ; preds = %for.cond1.preheader
  %pgocount8 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %21 = add i64 %pgocount8, 1
  store i64 %21, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  br label %for.end

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  %pgocount9 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  %22 = add i64 %pgocount9, 1
  store i64 %22, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  %xtraiter3038 = and i64 %indvars.iv34, 1
  %lcmp.mod31 = icmp eq i64 %xtraiter3038, 0
  br i1 %lcmp.mod31, label %for.body3.prol.loopexit, label %for.body3.prol

for.body3.prol:                                   ; preds = %for.body3.lr.ph
  %pgocount10 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 12)
  %23 = add i64 %pgocount10, 1
  store i64 %23, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 12)
  %24 = trunc i64 %indvars.iv34 to i32
  %rem.prol = srem i32 %24, %m
  %conv.prol = sitofp i32 %rem.prol to double
  %div.prol = fdiv double %conv.prol, %conv4
  %arrayidx6.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv34, i64 0
  store double %div.prol, double* %arrayidx6.prol, align 8
  br label %for.body3.prol.loopexit

for.body3.prol.loopexit:                          ; preds = %for.body3.prol, %for.body3.lr.ph
  %indvars.iv24.unr.ph = phi i64 [ 1, %for.body3.prol ], [ 0, %for.body3.lr.ph ]
  %25 = trunc i64 %20 to i32
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %for.end, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.body3.prol.loopexit
  br label %for.body3

for.body3:                                        ; preds = %for.body3.for.body3_crit_edge, %for.body3.preheader
  %indvars.iv24 = phi i64 [ %indvars.iv.next25.1, %for.body3.for.body3_crit_edge ], [ %indvars.iv24.unr.ph, %for.body3.preheader ]
  %27 = add nuw nsw i64 %indvars.iv24, %indvars.iv34
  %28 = trunc i64 %27 to i32
  %rem = srem i32 %28, %m
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, %conv4
  %arrayidx6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv34, i64 %indvars.iv24
  store double %div, double* %arrayidx6, align 8
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %29 = add nuw nsw i64 %indvars.iv.next25, %indvars.iv34
  %30 = trunc i64 %29 to i32
  %rem.1 = srem i32 %30, %m
  %conv.1 = sitofp i32 %rem.1 to double
  %div.1 = fdiv double %conv.1, %conv4
  %arrayidx6.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv34, i64 %indvars.iv.next25
  store double %div.1, double* %arrayidx6.1, align 8
  %indvars.iv.next25.1 = add nsw i64 %indvars.iv24, 2
  %exitcond29.1 = icmp eq i64 %indvars.iv.next25.1, %indvars.iv34
  br i1 %exitcond29.1, label %for.end.loopexit, label %for.body3.for.body3_crit_edge

for.body3.for.body3_crit_edge:                    ; preds = %for.body3
  %pgocount11 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %31 = add i64 %pgocount11, 1
  store i64 %31, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  br label %for.body3

for.end.loopexit:                                 ; preds = %for.body3
  %pgocount12 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 11)
  %32 = add i64 %pgocount12, 1
  store i64 %32, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 11)
  br label %for.end

for.end:                                          ; preds = %for.cond1.preheader.for.end_crit_edge, %for.end.loopexit, %for.body3.prol.loopexit
  %arrayidx10 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv34, i64 %indvars.iv34
  store double 1.000000e+00, double* %arrayidx10, align 8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next35, %wide.trip.count36
  br i1 %exitcond37, label %for.end29.loopexit42, label %for.cond1.preheader

for.end29.loopexit:                               ; preds = %for.cond11.for.inc27_crit_edge.us
  %pgocount13 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 14)
  %33 = add i64 %pgocount13, 1
  store i64 %33, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 14)
  br label %for.end29

for.end29.loopexit42:                             ; preds = %for.end
  %pgocount14 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 15)
  %34 = add i64 %pgocount14, 1
  store i64 %34, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 15)
  br label %for.end29

for.end29:                                        ; preds = %for.end29.loopexit42, %for.end29.loopexit, %entry
  %pgocount15 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 13)
  %35 = add i64 %pgocount15, 1
  store i64 %35, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_init_array, i64 0, i64 13)
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(i32 %m, i32 %n, double %alpha, [1000 x double]* nocapture readonly %A, [1200 x double]* nocapture %B) unnamed_addr #2 {
entry:
  %cmp6 = icmp sgt i32 %m, 0
  %cmp24 = icmp sgt i32 %n, 0
  %or.cond = and i1 %cmp6, %cmp24
  br i1 %or.cond, label %for.cond1.preheader.us.preheader, label %for.end32

for.cond1.preheader.us.preheader:                 ; preds = %entry
  %0 = add i32 %n, -1
  %1 = add i32 %m, 1
  %2 = add i32 %m, -2
  %3 = sext i32 %m to i64
  %wide.trip.count46 = zext i32 %m to i64
  %xtraiter = and i32 %n, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %4 = icmp ult i32 %0, 3
  %wide.trip.count.3 = zext i32 %n to i64
  %wide.trip.count43 = zext i32 %n to i64
  %wide.trip.count37.1 = zext i32 %m to i64
  %5 = add nsw i64 %wide.trip.count43, -4
  %broadcast.splatinsert56 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat57 = shufflevector <2 x double> %broadcast.splatinsert56, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc30_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv44 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next45, %for.cond1.for.inc30_crit_edge.us ]
  %indvars.iv33 = phi i64 [ 1, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next34, %for.cond1.for.inc30_crit_edge.us ]
  %6 = sub nsw i64 0, %indvars.iv44
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %cmp52.us = icmp slt i64 %indvars.iv.next45, %3
  br i1 %cmp52.us, label %for.cond4.preheader.us.us.preheader, label %for.cond4.preheader.us23.preheader

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.us
  %7 = trunc i64 %6 to i32
  %8 = trunc i64 %6 to i32
  %9 = add i32 %1, %8
  %xtraiter38 = and i32 %9, 1
  %lcmp.mod39 = icmp eq i32 %xtraiter38, 0
  %10 = sub i32 0, %7
  %11 = icmp eq i32 %2, %10
  %arrayidx8.us.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv44
  %indvars.iv.next36.prol = add nuw nsw i64 %indvars.iv33, 1
  br label %for.cond4.preheader.us.us

for.cond4.preheader.us23.preheader:               ; preds = %for.cond1.preheader.us
  %pgocount = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 7)
  %12 = add i64 %pgocount, 1
  store i64 %12, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 7)
  br i1 %lcmp.mod, label %for.cond4.preheader.us23.prol.loopexit, label %for.cond4.preheader.us23.prol.preheader

for.cond4.preheader.us23.prol.preheader:          ; preds = %for.cond4.preheader.us23.preheader
  br label %for.cond4.preheader.us23.prol

for.cond4.preheader.us23.prol:                    ; preds = %for.cond4.preheader.us23.prol.for.cond4.preheader.us23.prol_crit_edge, %for.cond4.preheader.us23.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.cond4.preheader.us23.prol.for.cond4.preheader.us23.prol_crit_edge ], [ 0, %for.cond4.preheader.us23.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.cond4.preheader.us23.prol.for.cond4.preheader.us23.prol_crit_edge ], [ %xtraiter, %for.cond4.preheader.us23.prol.preheader ]
  %arrayidx21.us10.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv44, i64 %indvars.iv.prol
  %13 = load double, double* %arrayidx21.us10.prol, align 8
  %mul22.us11.prol = fmul double %13, %alpha
  store double %mul22.us11.prol, double* %arrayidx21.us10.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.cond4.preheader.us23.prol.loopexit.loopexit, label %for.cond4.preheader.us23.prol.for.cond4.preheader.us23.prol_crit_edge, !llvm.loop !1

for.cond4.preheader.us23.prol.for.cond4.preheader.us23.prol_crit_edge: ; preds = %for.cond4.preheader.us23.prol
  %pgocount1 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 1)
  %14 = add i64 %pgocount1, 1
  store i64 %14, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 1)
  br label %for.cond4.preheader.us23.prol

for.cond4.preheader.us23.prol.loopexit.loopexit:  ; preds = %for.cond4.preheader.us23.prol
  %pgocount2 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 9)
  %15 = add i64 %pgocount2, 1
  store i64 %15, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 9)
  br label %for.cond4.preheader.us23.prol.loopexit

for.cond4.preheader.us23.prol.loopexit:           ; preds = %for.cond4.preheader.us23.prol.loopexit.loopexit, %for.cond4.preheader.us23.preheader
  %indvars.iv.unr = phi i64 [ 0, %for.cond4.preheader.us23.preheader ], [ %indvars.iv.next.prol, %for.cond4.preheader.us23.prol.loopexit.loopexit ]
  br i1 %4, label %for.cond1.for.inc30_crit_edge.us, label %for.cond4.preheader.us23.preheader51

for.cond4.preheader.us23.preheader51:             ; preds = %for.cond4.preheader.us23.prol.loopexit
  %pgocount3 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 10)
  %16 = add i64 %pgocount3, 1
  store i64 %16, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 10)
  %17 = sub i64 %5, %indvars.iv.unr
  %18 = lshr i64 %17, 2
  %19 = add nuw nsw i64 %18, 1
  %min.iters.check = icmp ult i64 %19, 2
  br i1 %min.iters.check, label %for.cond4.preheader.us23.preheader58, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond4.preheader.us23.preheader51
  %pgocount4 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 12)
  %20 = add i64 %pgocount4, 1
  store i64 %20, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 12)
  %n.mod.vf = and i64 %19, 1
  %n.vec = sub nsw i64 %19, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %21 = add i64 %indvars.iv.unr, 4
  %22 = shl nuw i64 %18, 2
  %23 = add i64 %21, %22
  %24 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %23, %24
  br i1 %cmp.zero, label %for.cond4.preheader.us23.preheader58, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %25 = shl i64 %index, 2
  %26 = add i64 %indvars.iv.unr, %25
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv44, i64 %26
  %28 = bitcast double* %27 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %28, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec53 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec54 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec55 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %29 = fmul <2 x double> %strided.vec, %broadcast.splat57
  %30 = fmul <2 x double> %strided.vec53, %broadcast.splat57
  %31 = fmul <2 x double> %strided.vec54, %broadcast.splat57
  %32 = add nsw i64 %26, 3
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv44, i64 %32
  %34 = fmul <2 x double> %strided.vec55, %broadcast.splat57
  %35 = getelementptr double, double* %33, i64 -3
  %36 = bitcast double* %35 to <8 x double>*
  %37 = shufflevector <2 x double> %29, <2 x double> %30, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %38 = shufflevector <2 x double> %31, <2 x double> %34, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %37, <4 x double> %38, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %36, align 8
  %index.next = add i64 %index, 2
  %39 = icmp eq i64 %index.next, %n.vec
  br i1 %39, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !3

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  %pgocount5 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 4)
  %40 = add i64 %pgocount5, 1
  store i64 %40, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 4)
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %pgocount6 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 13)
  %41 = add i64 %pgocount6, 1
  store i64 %41, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 13)
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.cond1.for.inc30_crit_edge.us, label %for.cond4.preheader.us23.preheader58

for.cond4.preheader.us23.preheader58:             ; preds = %middle.block, %min.iters.checked, %for.cond4.preheader.us23.preheader51
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked ], [ %indvars.iv.unr, %for.cond4.preheader.us23.preheader51 ], [ %ind.end, %middle.block ]
  br label %for.cond4.preheader.us23

for.cond4.preheader.us23:                         ; preds = %for.cond4.preheader.us23.for.cond4.preheader.us23_crit_edge, %for.cond4.preheader.us23.preheader58
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.cond4.preheader.us23.for.cond4.preheader.us23_crit_edge ], [ %indvars.iv.ph, %for.cond4.preheader.us23.preheader58 ]
  %arrayidx21.us10 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv44, i64 %indvars.iv
  %42 = load double, double* %arrayidx21.us10, align 8
  %mul22.us11 = fmul double %42, %alpha
  store double %mul22.us11, double* %arrayidx21.us10, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx21.us10.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv44, i64 %indvars.iv.next
  %43 = load double, double* %arrayidx21.us10.1, align 8
  %mul22.us11.1 = fmul double %43, %alpha
  store double %mul22.us11.1, double* %arrayidx21.us10.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx21.us10.2 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv44, i64 %indvars.iv.next.1
  %44 = load double, double* %arrayidx21.us10.2, align 8
  %mul22.us11.2 = fmul double %44, %alpha
  store double %mul22.us11.2, double* %arrayidx21.us10.2, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx21.us10.3 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv44, i64 %indvars.iv.next.2
  %45 = load double, double* %arrayidx21.us10.3, align 8
  %mul22.us11.3 = fmul double %45, %alpha
  store double %mul22.us11.3, double* %arrayidx21.us10.3, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %for.cond1.for.inc30_crit_edge.us.loopexit59, label %for.cond4.preheader.us23.for.cond4.preheader.us23_crit_edge, !llvm.loop !6

for.cond4.preheader.us23.for.cond4.preheader.us23_crit_edge: ; preds = %for.cond4.preheader.us23
  %pgocount7 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 3)
  %46 = add i64 %pgocount7, 1
  store i64 %46, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 3)
  br label %for.cond4.preheader.us23

for.cond1.for.inc30_crit_edge.us.loopexit:        ; preds = %for.cond4.for.end_crit_edge.us.us
  %pgocount8 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 8)
  %47 = add i64 %pgocount8, 1
  store i64 %47, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 8)
  br label %for.cond1.for.inc30_crit_edge.us

for.cond1.for.inc30_crit_edge.us.loopexit59:      ; preds = %for.cond4.preheader.us23
  %pgocount9 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 11)
  %48 = add i64 %pgocount9, 1
  store i64 %48, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 11)
  br label %for.cond1.for.inc30_crit_edge.us

for.cond1.for.inc30_crit_edge.us:                 ; preds = %for.cond1.for.inc30_crit_edge.us.loopexit59, %for.cond1.for.inc30_crit_edge.us.loopexit, %middle.block, %for.cond4.preheader.us23.prol.loopexit
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next45, %wide.trip.count46
  br i1 %exitcond47, label %for.end32.loopexit, label %for.cond1.preheader.us

for.cond4.preheader.us.us:                        ; preds = %for.cond4.for.end_crit_edge.us.us, %for.cond4.preheader.us.us.preheader
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %for.cond4.for.end_crit_edge.us.us ], [ 0, %for.cond4.preheader.us.us.preheader ]
  %arrayidx16.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv44, i64 %indvars.iv41
  br i1 %lcmp.mod39, label %for.body6.us.us.prol.loopexit, label %for.body6.us.us.prol

for.body6.us.us.prol:                             ; preds = %for.cond4.preheader.us.us
  %pgocount10 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 5)
  %49 = add i64 %pgocount10, 1
  store i64 %49, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 5)
  %50 = load double, double* %arrayidx8.us.us.prol, align 8
  %arrayidx12.us.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv33, i64 %indvars.iv41
  %51 = load double, double* %arrayidx12.us.us.prol, align 8
  %mul.us.us.prol = fmul double %50, %51
  %52 = load double, double* %arrayidx16.us.us, align 8
  %add17.us.us.prol = fadd double %52, %mul.us.us.prol
  store double %add17.us.us.prol, double* %arrayidx16.us.us, align 8
  br label %for.body6.us.us.prol.loopexit

for.body6.us.us.prol.loopexit:                    ; preds = %for.body6.us.us.prol, %for.cond4.preheader.us.us
  %indvars.iv35.unr.ph = phi i64 [ %indvars.iv.next36.prol, %for.body6.us.us.prol ], [ %indvars.iv33, %for.cond4.preheader.us.us ]
  br i1 %11, label %for.body6.us.us.prol.loopexit.for.cond4.for.end_crit_edge.us.us_crit_edge, label %for.body6.us.us.preheader

for.body6.us.us.prol.loopexit.for.cond4.for.end_crit_edge.us.us_crit_edge: ; preds = %for.body6.us.us.prol.loopexit
  %pgocount11 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 2)
  %53 = add i64 %pgocount11, 1
  store i64 %53, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 2)
  br label %for.cond4.for.end_crit_edge.us.us

for.body6.us.us.preheader:                        ; preds = %for.body6.us.us.prol.loopexit
  br label %for.body6.us.us

for.cond4.for.end_crit_edge.us.us.loopexit:       ; preds = %for.body6.us.us
  %pgocount12 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 6)
  %54 = add i64 %pgocount12, 1
  store i64 %54, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 6)
  br label %for.cond4.for.end_crit_edge.us.us

for.cond4.for.end_crit_edge.us.us:                ; preds = %for.body6.us.us.prol.loopexit.for.cond4.for.end_crit_edge.us.us_crit_edge, %for.cond4.for.end_crit_edge.us.us.loopexit
  %arrayidx21.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv44, i64 %indvars.iv41
  %55 = load double, double* %arrayidx21.us.us, align 8
  %mul22.us.us = fmul double %55, %alpha
  store double %mul22.us.us, double* %arrayidx21.us.us, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond = icmp eq i64 %indvars.iv.next42, %wide.trip.count43
  br i1 %exitcond, label %for.cond1.for.inc30_crit_edge.us.loopexit, label %for.cond4.preheader.us.us

for.body6.us.us:                                  ; preds = %for.body6.us.us.for.body6.us.us_crit_edge, %for.body6.us.us.preheader
  %indvars.iv35 = phi i64 [ %indvars.iv.next36.1, %for.body6.us.us.for.body6.us.us_crit_edge ], [ %indvars.iv35.unr.ph, %for.body6.us.us.preheader ]
  %arrayidx8.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv35, i64 %indvars.iv44
  %56 = load double, double* %arrayidx8.us.us, align 8
  %arrayidx12.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv35, i64 %indvars.iv41
  %57 = load double, double* %arrayidx12.us.us, align 8
  %mul.us.us = fmul double %56, %57
  %58 = load double, double* %arrayidx16.us.us, align 8
  %add17.us.us = fadd double %58, %mul.us.us
  store double %add17.us.us, double* %arrayidx16.us.us, align 8
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %arrayidx8.us.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next36, i64 %indvars.iv44
  %59 = load double, double* %arrayidx8.us.us.1, align 8
  %arrayidx12.us.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv.next36, i64 %indvars.iv41
  %60 = load double, double* %arrayidx12.us.us.1, align 8
  %mul.us.us.1 = fmul double %59, %60
  %61 = load double, double* %arrayidx16.us.us, align 8
  %add17.us.us.1 = fadd double %61, %mul.us.us.1
  store double %add17.us.us.1, double* %arrayidx16.us.us, align 8
  %indvars.iv.next36.1 = add nsw i64 %indvars.iv35, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next36.1, %wide.trip.count37.1
  br i1 %exitcond.1, label %for.cond4.for.end_crit_edge.us.us.loopexit, label %for.body6.us.us.for.body6.us.us_crit_edge

for.body6.us.us.for.body6.us.us_crit_edge:        ; preds = %for.body6.us.us
  %pgocount13 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 0)
  %62 = add i64 %pgocount13, 1
  store i64 %62, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 0)
  br label %for.body6.us.us

for.end32.loopexit:                               ; preds = %for.cond1.for.inc30_crit_edge.us
  %pgocount14 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 15)
  %63 = add i64 %pgocount14, 1
  store i64 %63, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 15)
  br label %for.end32

for.end32:                                        ; preds = %for.end32.loopexit, %entry
  %pgocount15 = load i64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 14)
  %64 = add i64 %pgocount15, 1
  store i64 %64, i64* getelementptr inbounds ([16 x i64], [16 x i64]* @__profc_B.ll_kernel_trmm, i64 0, i64 14)
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %m, i32 %n, [1200 x double]* nocapture readonly %B) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %cmp4 = icmp sgt i32 %m, 0
  %cmp31 = icmp sgt i32 %n, 0
  %or.cond = and i1 %cmp4, %cmp31
  br i1 %or.cond, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %m to i64
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count11 = zext i32 %m to i64
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
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv8, i64 %indvars.iv
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
