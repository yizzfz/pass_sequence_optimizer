; ModuleID = 'B.ll'
source_filename = "syr2k.c"
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
@__profn_B.ll_kernel_syr2k = private constant [17 x i8] c"B.ll:kernel_syr2k"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 32414643582, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 90900346899, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_syr2k = private global [28 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_syr2k = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4484451777959451810, i64 319673534434, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i32 0, i32 0), i8* null, i8* null, i32 28, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 63976198547, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [57 x i8] c"7\00main\01B.ll:init_array\01B.ll:kernel_syr2k\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_syr2k to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([57 x i8], [57 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1000 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1000 x double]*
  call fastcc void @init_array(i32 1200, i32 1000, double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1000 x double]* %arraydecay4)
  tail call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  tail call fastcc void @kernel_syr2k(i32 1200, i32 1000, double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1000 x double]* %arraydecay4)
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
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %arraydecay)
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
define internal fastcc void @init_array(i32 %n, i32 %m, double* nocapture %alpha, double* nocapture %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture %A, [1000 x double]* nocapture %B) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  %cmp8 = icmp sgt i32 %n, 0
  br i1 %cmp8, label %for.cond1.preheader.lr.ph, label %for.end43

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %0 = add i64 %pgocount, 1
  store i64 %0, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %cmp26 = icmp sgt i32 %m, 0
  %conv4 = sitofp i32 %n to double
  %conv11 = sitofp i32 %m to double
  br i1 %cmp26, label %for.cond1.preheader.us.preheader, label %for.cond24.preheader.lr.ph

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count23 = zext i32 %m to i64
  %wide.trip.count27 = zext i32 %n to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc17_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %for.cond1.for.inc17_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.for.body3.us_crit_edge, %for.cond1.preheader.us
  %indvars.iv18 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next19, %for.body3.us.for.body3.us_crit_edge ]
  %1 = mul nuw nsw i64 %indvars.iv18, %indvars.iv25
  %2 = add nuw nsw i64 %1, 1
  %3 = trunc i64 %2 to i32
  %rem.us = srem i32 %3, %n
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv25, i64 %indvars.iv18
  store double %div.us, double* %arrayidx6.us, align 8
  %4 = add nuw nsw i64 %1, 2
  %5 = trunc i64 %4 to i32
  %rem9.us = srem i32 %5, %m
  %conv10.us = sitofp i32 %rem9.us to double
  %div12.us = fdiv double %conv10.us, %conv11
  %arrayidx16.us = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv25, i64 %indvars.iv18
  store double %div12.us, double* %arrayidx16.us, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next19, %wide.trip.count23
  br i1 %exitcond24, label %for.cond1.for.inc17_crit_edge.us, label %for.body3.us.for.body3.us_crit_edge

for.body3.us.for.body3.us_crit_edge:              ; preds = %for.body3.us
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %6 = add i64 %pgocount1, 1
  store i64 %6, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  br label %for.body3.us

for.cond1.for.inc17_crit_edge.us:                 ; preds = %for.body3.us
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %7 = add i64 %pgocount2, 1
  store i64 %7, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next26, %wide.trip.count27
  br i1 %exitcond28, label %for.cond20.preheader, label %for.cond1.preheader.us

for.cond20.preheader:                             ; preds = %for.cond1.for.inc17_crit_edge.us
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %8 = add i64 %pgocount3, 1
  store i64 %8, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %cmp213 = icmp sgt i32 %n, 0
  br i1 %cmp213, label %for.cond24.preheader.lr.ph, label %for.end43

for.cond24.preheader.lr.ph:                       ; preds = %for.cond20.preheader, %for.cond1.preheader.lr.ph
  %conv32 = sitofp i32 %m to double
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count16 = zext i32 %n to i64
  br label %for.cond24.preheader.us

for.cond24.preheader.us:                          ; preds = %for.cond24.for.inc41_crit_edge.us, %for.cond24.preheader.lr.ph
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %for.cond24.for.inc41_crit_edge.us ], [ 0, %for.cond24.preheader.lr.ph ]
  br label %for.body27.us

for.body27.us:                                    ; preds = %for.body27.us.for.body27.us_crit_edge, %for.cond24.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond24.preheader.us ], [ %indvars.iv.next, %for.body27.us.for.body27.us_crit_edge ]
  %9 = mul nuw nsw i64 %indvars.iv, %indvars.iv14
  %10 = add nuw nsw i64 %9, 3
  %11 = trunc i64 %10 to i32
  %rem30.us = srem i32 %11, %n
  %conv31.us = sitofp i32 %rem30.us to double
  %div33.us = fdiv double %conv31.us, %conv32
  %arrayidx37.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv14, i64 %indvars.iv
  store double %div33.us, double* %arrayidx37.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond24.for.inc41_crit_edge.us, label %for.body27.us.for.body27.us_crit_edge

for.body27.us.for.body27.us_crit_edge:            ; preds = %for.body27.us
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %12 = add i64 %pgocount4, 1
  store i64 %12, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  br label %for.body27.us

for.cond24.for.inc41_crit_edge.us:                ; preds = %for.body27.us
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %13 = add i64 %pgocount5, 1
  store i64 %13, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, %wide.trip.count16
  br i1 %exitcond17, label %for.end43.loopexit, label %for.cond24.preheader.us

for.end43.loopexit:                               ; preds = %for.cond24.for.inc41_crit_edge.us
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %14 = add i64 %pgocount6, 1
  store i64 %14, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  br label %for.end43

for.end43:                                        ; preds = %for.end43.loopexit, %for.cond20.preheader, %entry
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %15 = add i64 %pgocount7, 1
  store i64 %15, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(i32 %n, i32 %m, double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A, [1000 x double]* nocapture readonly %B) unnamed_addr #2 {
entry:
  %cmp8 = icmp sgt i32 %n, 0
  br i1 %cmp8, label %for.cond1.preheader.lr.ph, label %for.end45

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp75 = icmp sgt i32 %m, 0
  br i1 %cmp75, label %for.body3.lr.ph.us.preheader, label %for.body3.lr.ph.preheader

for.body3.lr.ph.preheader:                        ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count70 = zext i32 %n to i64
  %broadcast.splatinsert77 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat78 = shufflevector <2 x double> %broadcast.splatinsert77, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3.lr.ph

for.body3.lr.ph.us.preheader:                     ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count49 = zext i32 %m to i64
  %wide.trip.count56 = zext i32 %n to i64
  %broadcast.splatinsert146 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat147 = shufflevector <2 x double> %broadcast.splatinsert146, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert121 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat122 = shufflevector <2 x double> %broadcast.splatinsert121, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3.lr.ph.us

for.body3.us:                                     ; preds = %for.body3.us.for.body3.us_crit_edge, %for.body3.us.preheader149
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body3.us.for.body3.us_crit_edge ], [ %indvars.iv.ph, %for.body3.us.preheader149 ]
  %arrayidx5.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %indvars.iv
  %0 = load double, double* %arrayidx5.us, align 8
  %mul.us = fmul double %0, %beta
  store double %mul.us, double* %arrayidx5.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx5.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %indvars.iv.next
  %1 = load double, double* %arrayidx5.us.1, align 8
  %mul.us.1 = fmul double %1, %beta
  store double %mul.us.1, double* %arrayidx5.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.us.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %indvars.iv.next.1
  %2 = load double, double* %arrayidx5.us.2, align 8
  %mul.us.2 = fmul double %2, %beta
  store double %mul.us.2, double* %arrayidx5.us.2, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx5.us.3 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %indvars.iv.next.2
  %3 = load double, double* %arrayidx5.us.3, align 8
  %mul.us.3 = fmul double %3, %beta
  store double %mul.us.3, double* %arrayidx5.us.3, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv52
  br i1 %exitcond.3, label %for.cond9.preheader.us29.preheader.loopexit, label %for.body3.us.for.body3.us_crit_edge, !llvm.loop !1

for.body3.us.for.body3.us_crit_edge:              ; preds = %for.body3.us
  %pgocount = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 3)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 3)
  br label %for.body3.us

for.cond9.preheader.us29.preheader.loopexit:      ; preds = %for.body3.us
  br label %for.cond9.preheader.us29.preheader

for.cond9.preheader.us29.preheader:               ; preds = %middle.block124, %for.body3.us.prol.loopexit, %for.cond9.preheader.us29.preheader.loopexit
  %min.iters.check82 = icmp ult i64 %49, 2
  %n.vec85 = and i64 %49, -2
  %cmp.zero86 = icmp eq i64 %n.vec85, 0
  %cmp.n117 = icmp eq i64 %49, %n.vec85
  br label %for.cond9.preheader.us29

for.body11.us12:                                  ; preds = %for.body11.us12.for.body11.us12_crit_edge, %for.body11.us12.preheader
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %for.body11.us12.for.body11.us12_crit_edge ], [ %indvars.iv42.ph, %for.body11.us12.preheader ]
  %arrayidx15.us15 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv42, i64 %indvars.iv47
  %5 = load double, double* %arrayidx15.us15, align 8
  %mul16.us16 = fmul double %5, %alpha
  %6 = load double, double* %arrayidx20.us33, align 8
  %mul21.us17 = fmul double %mul16.us16, %6
  %arrayidx25.us18 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv42, i64 %indvars.iv47
  %7 = load double, double* %arrayidx25.us18, align 8
  %mul26.us19 = fmul double %7, %alpha
  %8 = load double, double* %arrayidx30.us34, align 8
  %mul31.us20 = fmul double %mul26.us19, %8
  %add.us21 = fadd double %mul21.us17, %mul31.us20
  %arrayidx35.us22 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %indvars.iv42
  %9 = load double, double* %arrayidx35.us22, align 8
  %add36.us23 = fadd double %9, %add.us21
  store double %add36.us23, double* %arrayidx35.us22, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond = icmp eq i64 %indvars.iv.next43, %indvars.iv52
  br i1 %exitcond, label %for.cond9.for.inc40_crit_edge.us35.loopexit, label %for.body11.us12.for.body11.us12_crit_edge, !llvm.loop !5

for.body11.us12.for.body11.us12_crit_edge:        ; preds = %for.body11.us12
  %pgocount1 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 0)
  %10 = add i64 %pgocount1, 1
  store i64 %10, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 0)
  br label %for.body11.us12

for.cond9.preheader.us29:                         ; preds = %for.cond9.for.inc40_crit_edge.us35, %for.cond9.preheader.us29.preheader
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %for.cond9.for.inc40_crit_edge.us35 ], [ 0, %for.cond9.preheader.us29.preheader ]
  %scevgep91 = getelementptr [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv47
  %11 = add i64 %indvars.iv47, 1
  %scevgep93 = getelementptr [1000 x double], [1000 x double]* %A, i64 %indvars.iv54, i64 %11
  %scevgep95 = getelementptr [1000 x double], [1000 x double]* %B, i64 0, i64 %indvars.iv47
  %scevgep97 = getelementptr [1000 x double], [1000 x double]* %B, i64 %indvars.iv54, i64 %11
  %arrayidx20.us33 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv54, i64 %indvars.iv47
  %arrayidx30.us34 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv54, i64 %indvars.iv47
  br i1 %min.iters.check82, label %for.body11.us12.preheader, label %min.iters.checked83

for.body11.us12.preheader:                        ; preds = %middle.block80.for.body11.us12.preheader_crit_edge, %vector.memcheck, %min.iters.checked83, %for.cond9.preheader.us29
  %indvars.iv42.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked83 ], [ 0, %for.cond9.preheader.us29 ], [ %n.vec85, %middle.block80.for.body11.us12.preheader_crit_edge ]
  br label %for.body11.us12

min.iters.checked83:                              ; preds = %for.cond9.preheader.us29
  %pgocount2 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 11)
  %12 = add i64 %pgocount2, 1
  store i64 %12, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 11)
  br i1 %cmp.zero86, label %for.body11.us12.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked83
  %pgocount3 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 12)
  %13 = add i64 %pgocount3, 1
  store i64 %13, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 12)
  %bound0 = icmp ult double* %scevgep, %arrayidx30.us34
  %bound1 = icmp ult double* %arrayidx30.us34, %scevgep89
  %found.conflict = and i1 %bound0, %bound1
  %bound0100 = icmp ult double* %scevgep, %scevgep93
  %bound1101 = icmp ult double* %scevgep91, %scevgep89
  %found.conflict102 = and i1 %bound0100, %bound1101
  %conflict.rdx = or i1 %found.conflict, %found.conflict102
  %bound0103 = icmp ult double* %scevgep, %scevgep97
  %bound1104 = icmp ult double* %scevgep95, %scevgep89
  %found.conflict105 = and i1 %bound0103, %bound1104
  %conflict.rdx106 = or i1 %conflict.rdx, %found.conflict105
  %bound0109 = icmp ult double* %scevgep, %arrayidx20.us33
  %bound1110 = icmp ult double* %arrayidx20.us33, %scevgep89
  %found.conflict111 = and i1 %bound0109, %bound1110
  %conflict.rdx112 = or i1 %conflict.rdx106, %found.conflict111
  br i1 %conflict.rdx112, label %for.body11.us12.preheader, label %vector.ph113

vector.ph113:                                     ; preds = %vector.memcheck
  %14 = load double, double* %arrayidx20.us33, align 8, !alias.scope !6
  %15 = insertelement <2 x double> undef, double %14, i32 0
  %16 = shufflevector <2 x double> %15, <2 x double> undef, <2 x i32> zeroinitializer
  %17 = load double, double* %arrayidx30.us34, align 8, !alias.scope !9
  %18 = insertelement <2 x double> undef, double %17, i32 0
  %19 = shufflevector <2 x double> %18, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body79

vector.body79:                                    ; preds = %vector.body79.vector.body79_crit_edge, %vector.ph113
  %index114 = phi i64 [ 0, %vector.ph113 ], [ %index.next115, %vector.body79.vector.body79_crit_edge ]
  %20 = or i64 %index114, 1
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %index114, i64 %indvars.iv47
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %20, i64 %indvars.iv47
  %23 = load double, double* %21, align 8, !alias.scope !11
  %24 = load double, double* %22, align 8, !alias.scope !11
  %25 = insertelement <2 x double> undef, double %23, i32 0
  %26 = insertelement <2 x double> %25, double %24, i32 1
  %27 = fmul <2 x double> %26, %broadcast.splat122
  %28 = fmul <2 x double> %27, %16
  %29 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %index114, i64 %indvars.iv47
  %30 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %20, i64 %indvars.iv47
  %31 = load double, double* %29, align 8, !alias.scope !13
  %32 = load double, double* %30, align 8, !alias.scope !13
  %33 = insertelement <2 x double> undef, double %31, i32 0
  %34 = insertelement <2 x double> %33, double %32, i32 1
  %35 = fmul <2 x double> %34, %broadcast.splat122
  %36 = fmul <2 x double> %35, %19
  %37 = fadd <2 x double> %28, %36
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %index114
  %39 = bitcast double* %38 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %39, align 8, !alias.scope !15, !noalias !17
  %40 = fadd <2 x double> %wide.load, %37
  %41 = bitcast double* %38 to <2 x double>*
  store <2 x double> %40, <2 x double>* %41, align 8, !alias.scope !15, !noalias !17
  %index.next115 = add i64 %index114, 2
  %42 = icmp eq i64 %index.next115, %n.vec85
  br i1 %42, label %middle.block80, label %vector.body79.vector.body79_crit_edge, !llvm.loop !18

vector.body79.vector.body79_crit_edge:            ; preds = %vector.body79
  %pgocount4 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 1)
  %43 = add i64 %pgocount4, 1
  store i64 %43, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 1)
  br label %vector.body79

middle.block80:                                   ; preds = %vector.body79
  %pgocount5 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 13)
  %44 = add i64 %pgocount5, 1
  store i64 %44, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 13)
  br i1 %cmp.n117, label %for.cond9.for.inc40_crit_edge.us35, label %middle.block80.for.body11.us12.preheader_crit_edge

middle.block80.for.body11.us12.preheader_crit_edge: ; preds = %middle.block80
  %pgocount6 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 8)
  %45 = add i64 %pgocount6, 1
  store i64 %45, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 8)
  br label %for.body11.us12.preheader

for.body3.lr.ph.us:                               ; preds = %for.cond6.for.inc43_crit_edge.us, %for.body3.lr.ph.us.preheader
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %for.cond6.for.inc43_crit_edge.us ], [ 0, %for.body3.lr.ph.us.preheader ]
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %for.cond6.for.inc43_crit_edge.us ], [ 1, %for.body3.lr.ph.us.preheader ]
  %46 = add i64 %indvars.iv54, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 0
  %47 = mul i64 %indvars.iv54, 1201
  %48 = add i64 %47, 1
  %scevgep89 = getelementptr [1200 x double], [1200 x double]* %C, i64 0, i64 %48
  %49 = add i64 %indvars.iv54, 1
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %50 = trunc i64 %indvars.iv.next55 to i32
  %xtraiter = and i32 %50, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body3.us.prol.loopexit, label %for.body3.us.prol.preheader

for.body3.us.prol.preheader:                      ; preds = %for.body3.lr.ph.us
  br label %for.body3.us.prol

for.body3.us.prol:                                ; preds = %for.body3.us.prol.for.body3.us.prol_crit_edge, %for.body3.us.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body3.us.prol.for.body3.us.prol_crit_edge ], [ 0, %for.body3.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body3.us.prol.for.body3.us.prol_crit_edge ], [ %xtraiter, %for.body3.us.prol.preheader ]
  %arrayidx5.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %indvars.iv.prol
  %51 = load double, double* %arrayidx5.us.prol, align 8
  %mul.us.prol = fmul double %51, %beta
  store double %mul.us.prol, double* %arrayidx5.us.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body3.us.prol.loopexit.loopexit, label %for.body3.us.prol.for.body3.us.prol_crit_edge, !llvm.loop !19

for.body3.us.prol.for.body3.us.prol_crit_edge:    ; preds = %for.body3.us.prol
  %pgocount7 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 2)
  %52 = add i64 %pgocount7, 1
  store i64 %52, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 2)
  br label %for.body3.us.prol

for.body3.us.prol.loopexit.loopexit:              ; preds = %for.body3.us.prol
  %pgocount8 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 15)
  %53 = add i64 %pgocount8, 1
  store i64 %53, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 15)
  br label %for.body3.us.prol.loopexit

for.body3.us.prol.loopexit:                       ; preds = %for.body3.us.prol.loopexit.loopexit, %for.body3.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %for.body3.lr.ph.us ], [ %indvars.iv.next.prol, %for.body3.us.prol.loopexit.loopexit ]
  %54 = icmp ult i64 %indvars.iv54, 3
  br i1 %54, label %for.cond9.preheader.us29.preheader, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.body3.us.prol.loopexit
  %pgocount9 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 16)
  %55 = add i64 %pgocount9, 1
  store i64 %55, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 16)
  %56 = sub i64 %46, %indvars.iv.unr
  %57 = lshr i64 %56, 2
  %58 = add nuw nsw i64 %57, 1
  %min.iters.check126 = icmp ult i64 %58, 2
  br i1 %min.iters.check126, label %for.body3.us.preheader149, label %min.iters.checked127

for.body3.us.preheader149:                        ; preds = %middle.block124, %min.iters.checked127, %for.body3.us.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked127 ], [ %indvars.iv.unr, %for.body3.us.preheader ], [ %ind.end135, %middle.block124 ]
  %pgocount10 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 17)
  %59 = add i64 %pgocount10, 1
  store i64 %59, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 17)
  br label %for.body3.us

min.iters.checked127:                             ; preds = %for.body3.us.preheader
  %pgocount11 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 21)
  %60 = add i64 %pgocount11, 1
  store i64 %60, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 21)
  %n.mod.vf128 = and i64 %58, 1
  %n.vec129 = sub nsw i64 %58, %n.mod.vf128
  %cmp.zero130 = icmp eq i64 %n.vec129, 0
  %61 = add i64 %indvars.iv.unr, 4
  %62 = shl nuw i64 %57, 2
  %63 = add i64 %61, %62
  %64 = shl nuw nsw i64 %n.mod.vf128, 2
  %ind.end135 = sub i64 %63, %64
  br i1 %cmp.zero130, label %for.body3.us.preheader149, label %vector.ph131

vector.ph131:                                     ; preds = %min.iters.checked127
  br label %vector.body123

vector.body123:                                   ; preds = %vector.body123.vector.body123_crit_edge, %vector.ph131
  %index132 = phi i64 [ 0, %vector.ph131 ], [ %index.next133, %vector.body123.vector.body123_crit_edge ]
  %65 = shl i64 %index132, 2
  %66 = add i64 %indvars.iv.unr, %65
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %66
  %68 = bitcast double* %67 to <8 x double>*
  %wide.vec141 = load <8 x double>, <8 x double>* %68, align 8
  %strided.vec142 = shufflevector <8 x double> %wide.vec141, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec143 = shufflevector <8 x double> %wide.vec141, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec144 = shufflevector <8 x double> %wide.vec141, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec145 = shufflevector <8 x double> %wide.vec141, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %69 = fmul <2 x double> %strided.vec142, %broadcast.splat147
  %70 = fmul <2 x double> %strided.vec143, %broadcast.splat147
  %71 = fmul <2 x double> %strided.vec144, %broadcast.splat147
  %72 = add nsw i64 %66, 3
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %72
  %74 = fmul <2 x double> %strided.vec145, %broadcast.splat147
  %75 = getelementptr double, double* %73, i64 -3
  %76 = bitcast double* %75 to <8 x double>*
  %77 = shufflevector <2 x double> %69, <2 x double> %70, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %78 = shufflevector <2 x double> %71, <2 x double> %74, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec148 = shufflevector <4 x double> %77, <4 x double> %78, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec148, <8 x double>* %76, align 8
  %index.next133 = add i64 %index132, 2
  %79 = icmp eq i64 %index.next133, %n.vec129
  br i1 %79, label %middle.block124, label %vector.body123.vector.body123_crit_edge, !llvm.loop !21

vector.body123.vector.body123_crit_edge:          ; preds = %vector.body123
  %pgocount12 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 6)
  %80 = add i64 %pgocount12, 1
  store i64 %80, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 6)
  br label %vector.body123

middle.block124:                                  ; preds = %vector.body123
  %pgocount13 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 22)
  %81 = add i64 %pgocount13, 1
  store i64 %81, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 22)
  %cmp.n136 = icmp eq i64 %n.mod.vf128, 0
  br i1 %cmp.n136, label %for.cond9.preheader.us29.preheader, label %for.body3.us.preheader149

for.cond9.for.inc40_crit_edge.us35.loopexit:      ; preds = %for.body11.us12
  %pgocount14 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 10)
  %82 = add i64 %pgocount14, 1
  store i64 %82, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 10)
  br label %for.cond9.for.inc40_crit_edge.us35

for.cond9.for.inc40_crit_edge.us35:               ; preds = %for.cond9.for.inc40_crit_edge.us35.loopexit, %middle.block80
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next48, %wide.trip.count49
  br i1 %exitcond50, label %for.cond6.for.inc43_crit_edge.us, label %for.cond9.preheader.us29

for.cond6.for.inc43_crit_edge.us:                 ; preds = %for.cond9.for.inc40_crit_edge.us35
  %pgocount15 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 14)
  %83 = add i64 %pgocount15, 1
  store i64 %83, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 14)
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next55, %wide.trip.count56
  br i1 %exitcond57, label %for.end45.loopexit, label %for.body3.lr.ph.us

for.body3.lr.ph:                                  ; preds = %for.inc43, %for.body3.lr.ph.preheader
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %for.inc43 ], [ 0, %for.body3.lr.ph.preheader ]
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %for.inc43 ], [ 1, %for.body3.lr.ph.preheader ]
  %84 = add i64 %indvars.iv68, -3
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %85 = trunc i64 %indvars.iv.next69 to i32
  %xtraiter63 = and i32 %85, 3
  %lcmp.mod64 = icmp eq i32 %xtraiter63, 0
  br i1 %lcmp.mod64, label %for.body3.lr.ph.for.body3.prol.loopexit_crit_edge, label %for.body3.prol.preheader

for.body3.lr.ph.for.body3.prol.loopexit_crit_edge: ; preds = %for.body3.lr.ph
  %pgocount16 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 9)
  %86 = add i64 %pgocount16, 1
  store i64 %86, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 9)
  br label %for.body3.prol.loopexit

for.body3.prol.preheader:                         ; preds = %for.body3.lr.ph
  br label %for.body3.prol

for.body3.prol:                                   ; preds = %for.body3.prol.for.body3.prol_crit_edge, %for.body3.prol.preheader
  %indvars.iv58.prol = phi i64 [ %indvars.iv.next59.prol, %for.body3.prol.for.body3.prol_crit_edge ], [ 0, %for.body3.prol.preheader ]
  %prol.iter65 = phi i32 [ %prol.iter65.sub, %for.body3.prol.for.body3.prol_crit_edge ], [ %xtraiter63, %for.body3.prol.preheader ]
  %arrayidx5.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv68, i64 %indvars.iv58.prol
  %87 = load double, double* %arrayidx5.prol, align 8
  %mul.prol = fmul double %87, %beta
  store double %mul.prol, double* %arrayidx5.prol, align 8
  %indvars.iv.next59.prol = add nuw nsw i64 %indvars.iv58.prol, 1
  %prol.iter65.sub = add i32 %prol.iter65, -1
  %prol.iter65.cmp = icmp eq i32 %prol.iter65.sub, 0
  br i1 %prol.iter65.cmp, label %for.body3.prol.loopexit.loopexit, label %for.body3.prol.for.body3.prol_crit_edge, !llvm.loop !22

for.body3.prol.for.body3.prol_crit_edge:          ; preds = %for.body3.prol
  %pgocount17 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 4)
  %88 = add i64 %pgocount17, 1
  store i64 %88, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 4)
  br label %for.body3.prol

for.body3.prol.loopexit.loopexit:                 ; preds = %for.body3.prol
  %pgocount18 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 18)
  %89 = add i64 %pgocount18, 1
  store i64 %89, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 18)
  br label %for.body3.prol.loopexit

for.body3.prol.loopexit:                          ; preds = %for.body3.lr.ph.for.body3.prol.loopexit_crit_edge, %for.body3.prol.loopexit.loopexit
  %indvars.iv58.unr = phi i64 [ 0, %for.body3.lr.ph.for.body3.prol.loopexit_crit_edge ], [ %indvars.iv.next59.prol, %for.body3.prol.loopexit.loopexit ]
  %90 = icmp ult i64 %indvars.iv68, 3
  br i1 %90, label %for.inc43, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.body3.prol.loopexit
  %pgocount19 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 19)
  %91 = add i64 %pgocount19, 1
  store i64 %91, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 19)
  %92 = sub i64 %84, %indvars.iv58.unr
  %93 = lshr i64 %92, 2
  %94 = add nuw nsw i64 %93, 1
  %min.iters.check = icmp ult i64 %94, 2
  br i1 %min.iters.check, label %for.body3.preheader150, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body3.preheader
  %pgocount20 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 23)
  %95 = add i64 %pgocount20, 1
  store i64 %95, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 23)
  %n.mod.vf = and i64 %94, 1
  %n.vec = sub nsw i64 %94, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %96 = add i64 %indvars.iv58.unr, 4
  %97 = shl nuw i64 %93, 2
  %98 = add i64 %96, %97
  %99 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %98, %99
  br i1 %cmp.zero, label %for.body3.preheader150, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %100 = shl i64 %index, 2
  %101 = add i64 %indvars.iv58.unr, %100
  %102 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv68, i64 %101
  %103 = bitcast double* %102 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %103, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec74 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec75 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec76 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %104 = fmul <2 x double> %strided.vec, %broadcast.splat78
  %105 = fmul <2 x double> %strided.vec74, %broadcast.splat78
  %106 = fmul <2 x double> %strided.vec75, %broadcast.splat78
  %107 = add nsw i64 %101, 3
  %108 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv68, i64 %107
  %109 = fmul <2 x double> %strided.vec76, %broadcast.splat78
  %110 = getelementptr double, double* %108, i64 -3
  %111 = bitcast double* %110 to <8 x double>*
  %112 = shufflevector <2 x double> %104, <2 x double> %105, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %113 = shufflevector <2 x double> %106, <2 x double> %109, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %112, <4 x double> %113, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %111, align 8
  %index.next = add i64 %index, 2
  %114 = icmp eq i64 %index.next, %n.vec
  br i1 %114, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !23

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  %pgocount21 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 7)
  %115 = add i64 %pgocount21, 1
  store i64 %115, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 7)
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %pgocount22 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 24)
  %116 = add i64 %pgocount22, 1
  store i64 %116, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 24)
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.inc43, label %for.body3.preheader150

for.body3.preheader150:                           ; preds = %middle.block, %min.iters.checked, %for.body3.preheader
  %indvars.iv58.ph = phi i64 [ %indvars.iv58.unr, %min.iters.checked ], [ %indvars.iv58.unr, %for.body3.preheader ], [ %ind.end, %middle.block ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3.for.body3_crit_edge, %for.body3.preheader150
  %indvars.iv58 = phi i64 [ %indvars.iv.next59.3, %for.body3.for.body3_crit_edge ], [ %indvars.iv58.ph, %for.body3.preheader150 ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv68, i64 %indvars.iv58
  %117 = load double, double* %arrayidx5, align 8
  %mul = fmul double %117, %beta
  store double %mul, double* %arrayidx5, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %arrayidx5.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv68, i64 %indvars.iv.next59
  %118 = load double, double* %arrayidx5.1, align 8
  %mul.1 = fmul double %118, %beta
  store double %mul.1, double* %arrayidx5.1, align 8
  %indvars.iv.next59.1 = add nsw i64 %indvars.iv58, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv68, i64 %indvars.iv.next59.1
  %119 = load double, double* %arrayidx5.2, align 8
  %mul.2 = fmul double %119, %beta
  store double %mul.2, double* %arrayidx5.2, align 8
  %indvars.iv.next59.2 = add nsw i64 %indvars.iv58, 3
  %arrayidx5.3 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv68, i64 %indvars.iv.next59.2
  %120 = load double, double* %arrayidx5.3, align 8
  %mul.3 = fmul double %120, %beta
  store double %mul.3, double* %arrayidx5.3, align 8
  %indvars.iv.next59.3 = add nsw i64 %indvars.iv58, 4
  %exitcond62.3 = icmp eq i64 %indvars.iv.next59.3, %indvars.iv66
  br i1 %exitcond62.3, label %for.inc43.loopexit, label %for.body3.for.body3_crit_edge, !llvm.loop !24

for.body3.for.body3_crit_edge:                    ; preds = %for.body3
  %pgocount23 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 5)
  %121 = add i64 %pgocount23, 1
  store i64 %121, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 5)
  br label %for.body3

for.inc43.loopexit:                               ; preds = %for.body3
  %pgocount24 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 20)
  %122 = add i64 %pgocount24, 1
  store i64 %122, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 20)
  br label %for.inc43

for.inc43:                                        ; preds = %for.inc43.loopexit, %middle.block, %for.body3.prol.loopexit
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next69, %wide.trip.count70
  br i1 %exitcond71, label %for.end45.loopexit151, label %for.body3.lr.ph

for.end45.loopexit:                               ; preds = %for.cond6.for.inc43_crit_edge.us
  %pgocount25 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 26)
  %123 = add i64 %pgocount25, 1
  store i64 %123, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 26)
  br label %for.end45

for.end45.loopexit151:                            ; preds = %for.inc43
  %pgocount26 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 27)
  %124 = add i64 %pgocount26, 1
  store i64 %124, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 27)
  br label %for.end45

for.end45:                                        ; preds = %for.end45.loopexit151, %for.end45.loopexit, %entry
  %pgocount27 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 25)
  %125 = add i64 %pgocount27, 1
  store i64 %125, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_syr2k, i64 0, i64 25)
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [1200 x double]* nocapture readonly %C) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %cmp4 = icmp sgt i32 %n, 0
  br i1 %cmp4, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %n to i64
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count10 = zext i32 %n to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv7 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next8, %for.cond2.for.inc10_crit_edge.us ]
  %4 = mul nsw i64 %indvars.iv7, %3
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
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv7, i64 %indvars.iv
  %11 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %11) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %12 = add i64 %pgocount2, 1
  store i64 %12, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next8, %wide.trip.count10
  br i1 %exitcond11, label %for.end12.loopexit, label %for.cond2.preheader.us

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
!1 = distinct !{!1, !2, !3, !4}
!2 = !{!"llvm.loop.unroll.runtime.disable"}
!3 = !{!"llvm.loop.vectorize.width", i32 1}
!4 = !{!"llvm.loop.interleave.count", i32 1}
!5 = distinct !{!5, !3, !4}
!6 = !{!7}
!7 = distinct !{!7, !8}
!8 = distinct !{!8, !"LVerDomain"}
!9 = !{!10}
!10 = distinct !{!10, !8}
!11 = !{!12}
!12 = distinct !{!12, !8}
!13 = !{!14}
!14 = distinct !{!14, !8}
!15 = !{!16}
!16 = distinct !{!16, !8}
!17 = !{!10, !12, !14, !7}
!18 = distinct !{!18, !3, !4}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.unroll.disable"}
!21 = distinct !{!21, !3, !4}
!22 = distinct !{!22, !20}
!23 = distinct !{!23, !3, !4}
!24 = distinct !{!24, !2, !3, !4}
