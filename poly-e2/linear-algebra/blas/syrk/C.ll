; ModuleID = 'B.ll'
source_filename = "syrk.c"
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
@__profn_B.ll_kernel_syrk = private constant [16 x i8] c"B.ll:kernel_syrk"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 32414643582, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [8 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 90900346899, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 8, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_syrk = private global [25 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_syrk = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5417141688726560687, i64 292800170575, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i32 0, i32 0), i8* null, i8* null, i32 25, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 63976198547, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [56 x i8] c"6\00main\01B.ll:init_array\01B.ll:kernel_syrk\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_syrk to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([56 x i8], [56 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay2 = bitcast i8* %call1 to [1000 x double]*
  call fastcc void @init_array(i32 1200, i32 1000, double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  tail call fastcc void @kernel_syrk(i32 1200, i32 1000, double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay2)
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
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, i32 %m, double* nocapture %alpha, double* nocapture %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture %A) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  %cmp8 = icmp sgt i32 %n, 0
  br i1 %cmp8, label %for.cond1.preheader.lr.ph, label %for.end33

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %pgocount = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %0 = add i64 %pgocount, 1
  store i64 %0, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %cmp26 = icmp sgt i32 %m, 0
  %conv4 = sitofp i32 %n to double
  br i1 %cmp26, label %for.cond1.preheader.us.preheader, label %for.cond14.preheader.lr.ph

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count22 = zext i32 %m to i64
  %wide.trip.count26 = zext i32 %n to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc7_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %for.cond1.for.inc7_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.for.body3.us_crit_edge, %for.cond1.preheader.us
  %indvars.iv18 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next19, %for.body3.us.for.body3.us_crit_edge ]
  %1 = mul nuw nsw i64 %indvars.iv18, %indvars.iv24
  %2 = add nuw nsw i64 %1, 1
  %3 = trunc i64 %2 to i32
  %rem.us = srem i32 %3, %n
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv24, i64 %indvars.iv18
  store double %div.us, double* %arrayidx6.us, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next19, %wide.trip.count22
  br i1 %exitcond23, label %for.cond1.for.inc7_crit_edge.us, label %for.body3.us.for.body3.us_crit_edge

for.body3.us.for.body3.us_crit_edge:              ; preds = %for.body3.us
  %pgocount1 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %4 = add i64 %pgocount1, 1
  store i64 %4, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  br label %for.body3.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.body3.us
  %pgocount2 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %5 = add i64 %pgocount2, 1
  store i64 %5, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next25, %wide.trip.count26
  br i1 %exitcond27, label %for.cond10.preheader, label %for.cond1.preheader.us

for.cond10.preheader:                             ; preds = %for.cond1.for.inc7_crit_edge.us
  %pgocount3 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %6 = add i64 %pgocount3, 1
  store i64 %6, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %cmp113 = icmp sgt i32 %n, 0
  br i1 %cmp113, label %for.cond14.preheader.lr.ph, label %for.end33

for.cond14.preheader.lr.ph:                       ; preds = %for.cond10.preheader, %for.cond1.preheader.lr.ph
  %conv22 = sitofp i32 %m to double
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count16 = zext i32 %n to i64
  br label %for.cond14.preheader.us

for.cond14.preheader.us:                          ; preds = %for.cond14.for.inc31_crit_edge.us, %for.cond14.preheader.lr.ph
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %for.cond14.for.inc31_crit_edge.us ], [ 0, %for.cond14.preheader.lr.ph ]
  br label %for.body17.us

for.body17.us:                                    ; preds = %for.body17.us.for.body17.us_crit_edge, %for.cond14.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond14.preheader.us ], [ %indvars.iv.next, %for.body17.us.for.body17.us_crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv, %indvars.iv14
  %8 = add nuw nsw i64 %7, 2
  %9 = trunc i64 %8 to i32
  %rem20.us = srem i32 %9, %m
  %conv21.us = sitofp i32 %rem20.us to double
  %div23.us = fdiv double %conv21.us, %conv22
  %arrayidx27.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv14, i64 %indvars.iv
  store double %div23.us, double* %arrayidx27.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond14.for.inc31_crit_edge.us, label %for.body17.us.for.body17.us_crit_edge

for.body17.us.for.body17.us_crit_edge:            ; preds = %for.body17.us
  %pgocount4 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %10 = add i64 %pgocount4, 1
  store i64 %10, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  br label %for.body17.us

for.cond14.for.inc31_crit_edge.us:                ; preds = %for.body17.us
  %pgocount5 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %11 = add i64 %pgocount5, 1
  store i64 %11, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, %wide.trip.count16
  br i1 %exitcond17, label %for.end33.loopexit, label %for.cond14.preheader.us

for.end33.loopexit:                               ; preds = %for.cond14.for.inc31_crit_edge.us
  %pgocount6 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %12 = add i64 %pgocount6, 1
  store i64 %12, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  br label %for.end33

for.end33:                                        ; preds = %for.end33.loopexit, %for.cond10.preheader, %entry
  %pgocount7 = load i64, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %13 = add i64 %pgocount7, 1
  store i64 %13, i64* getelementptr inbounds ([8 x i64], [8 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syrk(i32 %n, i32 %m, double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A) unnamed_addr #2 {
entry:
  %cmp8 = icmp sgt i32 %n, 0
  br i1 %cmp8, label %for.cond1.preheader.lr.ph, label %for.end34

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp75 = icmp sgt i32 %m, 0
  br i1 %cmp75, label %for.body3.lr.ph.us.preheader, label %for.body3.lr.ph.preheader

for.body3.lr.ph.preheader:                        ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count67 = zext i32 %n to i64
  %broadcast.splatinsert75 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat76 = shufflevector <2 x double> %broadcast.splatinsert75, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3.lr.ph

for.body3.lr.ph.us.preheader:                     ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count47 = zext i32 %m to i64
  %wide.trip.count53 = zext i32 %n to i64
  %broadcast.splatinsert100 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat101 = shufflevector <2 x double> %broadcast.splatinsert100, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body3.lr.ph.us

for.body3.us:                                     ; preds = %for.body3.us.for.body3.us_crit_edge, %for.body3.us.preheader103
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body3.us.for.body3.us_crit_edge ], [ %indvars.iv.ph, %for.body3.us.preheader103 ]
  %arrayidx5.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv51, i64 %indvars.iv
  %0 = load double, double* %arrayidx5.us, align 8
  %mul.us = fmul double %0, %beta
  store double %mul.us, double* %arrayidx5.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx5.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv51, i64 %indvars.iv.next
  %1 = load double, double* %arrayidx5.us.1, align 8
  %mul.us.1 = fmul double %1, %beta
  store double %mul.us.1, double* %arrayidx5.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.us.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv51, i64 %indvars.iv.next.1
  %2 = load double, double* %arrayidx5.us.2, align 8
  %mul.us.2 = fmul double %2, %beta
  store double %mul.us.2, double* %arrayidx5.us.2, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx5.us.3 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv51, i64 %indvars.iv.next.2
  %3 = load double, double* %arrayidx5.us.3, align 8
  %mul.us.3 = fmul double %3, %beta
  store double %mul.us.3, double* %arrayidx5.us.3, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv49
  br i1 %exitcond.3, label %for.cond9.preheader.us25.preheader.loopexit, label %for.body3.us.for.body3.us_crit_edge, !llvm.loop !1

for.body3.us.for.body3.us_crit_edge:              ; preds = %for.body3.us
  %pgocount = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 2)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 2)
  br label %for.body3.us

for.body11.us12:                                  ; preds = %for.body11.us12.for.body11.us12_crit_edge, %for.body11.us12.preheader
  %indvars.iv37 = phi i64 [ %indvars.iv.next38.1, %for.body11.us12.for.body11.us12_crit_edge ], [ %indvars.iv37.unr.ph, %for.body11.us12.preheader ]
  %5 = load double, double* %arrayidx15.us29, align 8
  %mul16.us14 = fmul double %5, %alpha
  %arrayidx20.us16 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv45
  %6 = load double, double* %arrayidx20.us16, align 8
  %mul21.us17 = fmul double %mul16.us14, %6
  %arrayidx25.us18 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv51, i64 %indvars.iv37
  %7 = load double, double* %arrayidx25.us18, align 8
  %add.us19 = fadd double %7, %mul21.us17
  store double %add.us19, double* %arrayidx25.us18, align 8
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %8 = load double, double* %arrayidx15.us29, align 8
  %mul16.us14.1 = fmul double %8, %alpha
  %arrayidx20.us16.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next38, i64 %indvars.iv45
  %9 = load double, double* %arrayidx20.us16.1, align 8
  %mul21.us17.1 = fmul double %mul16.us14.1, %9
  %arrayidx25.us18.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv51, i64 %indvars.iv.next38
  %10 = load double, double* %arrayidx25.us18.1, align 8
  %add.us19.1 = fadd double %10, %mul21.us17.1
  store double %add.us19.1, double* %arrayidx25.us18.1, align 8
  %indvars.iv.next38.1 = add nsw i64 %indvars.iv37, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next38.1, %indvars.iv49
  br i1 %exitcond.1, label %for.cond9.for.inc29_crit_edge.us30.loopexit, label %for.body11.us12.for.body11.us12_crit_edge

for.body11.us12.for.body11.us12_crit_edge:        ; preds = %for.body11.us12
  %pgocount1 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 0)
  %11 = add i64 %pgocount1, 1
  store i64 %11, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 0)
  br label %for.body11.us12

for.cond9.preheader.us25:                         ; preds = %for.cond9.for.inc29_crit_edge.us30, %for.cond9.preheader.us25.preheader
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %for.cond9.for.inc29_crit_edge.us30 ], [ 0, %for.cond9.preheader.us25.preheader ]
  %arrayidx15.us29 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv51, i64 %indvars.iv45
  br i1 %lcmp.mod43, label %for.body11.us12.prol.loopexit, label %for.body11.us12.prol

for.body11.us12.prol:                             ; preds = %for.cond9.preheader.us25
  %pgocount2 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 10)
  %12 = add i64 %pgocount2, 1
  store i64 %12, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 10)
  %13 = load double, double* %arrayidx15.us29, align 8
  %mul16.us14.prol = fmul double %13, %alpha
  %arrayidx20.us16.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv45
  %14 = load double, double* %arrayidx20.us16.prol, align 8
  %mul21.us17.prol = fmul double %mul16.us14.prol, %14
  %15 = load double, double* %arrayidx25.us18.prol, align 8
  %add.us19.prol = fadd double %15, %mul21.us17.prol
  store double %add.us19.prol, double* %arrayidx25.us18.prol, align 8
  br label %for.body11.us12.prol.loopexit

for.body11.us12.prol.loopexit:                    ; preds = %for.body11.us12.prol, %for.cond9.preheader.us25
  %indvars.iv37.unr.ph = phi i64 [ 1, %for.body11.us12.prol ], [ 0, %for.cond9.preheader.us25 ]
  br i1 %50, label %for.body11.us12.prol.loopexit.for.cond9.for.inc29_crit_edge.us30_crit_edge, label %for.body11.us12.preheader

for.body11.us12.prol.loopexit.for.cond9.for.inc29_crit_edge.us30_crit_edge: ; preds = %for.body11.us12.prol.loopexit
  %pgocount3 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 3)
  %16 = add i64 %pgocount3, 1
  store i64 %16, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 3)
  br label %for.cond9.for.inc29_crit_edge.us30

for.body11.us12.preheader:                        ; preds = %for.body11.us12.prol.loopexit
  br label %for.body11.us12

for.body3.lr.ph.us:                               ; preds = %for.cond6.for.inc32_crit_edge.us, %for.body3.lr.ph.us.preheader
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %for.cond6.for.inc32_crit_edge.us ], [ 0, %for.body3.lr.ph.us.preheader ]
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %for.cond6.for.inc32_crit_edge.us ], [ 1, %for.body3.lr.ph.us.preheader ]
  %17 = add i64 %indvars.iv51, -3
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %18 = trunc i64 %indvars.iv.next52 to i32
  %xtraiter = and i32 %18, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body3.us.prol.loopexit, label %for.body3.us.prol.preheader

for.body3.us.prol.preheader:                      ; preds = %for.body3.lr.ph.us
  br label %for.body3.us.prol

for.body3.us.prol:                                ; preds = %for.body3.us.prol.for.body3.us.prol_crit_edge, %for.body3.us.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body3.us.prol.for.body3.us.prol_crit_edge ], [ 0, %for.body3.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body3.us.prol.for.body3.us.prol_crit_edge ], [ %xtraiter, %for.body3.us.prol.preheader ]
  %arrayidx5.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv51, i64 %indvars.iv.prol
  %19 = load double, double* %arrayidx5.us.prol, align 8
  %mul.us.prol = fmul double %19, %beta
  store double %mul.us.prol, double* %arrayidx5.us.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body3.us.prol.loopexit.loopexit, label %for.body3.us.prol.for.body3.us.prol_crit_edge, !llvm.loop !5

for.body3.us.prol.for.body3.us.prol_crit_edge:    ; preds = %for.body3.us.prol
  %pgocount4 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 1)
  %20 = add i64 %pgocount4, 1
  store i64 %20, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 1)
  br label %for.body3.us.prol

for.body3.us.prol.loopexit.loopexit:              ; preds = %for.body3.us.prol
  %pgocount5 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 12)
  %21 = add i64 %pgocount5, 1
  store i64 %21, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 12)
  br label %for.body3.us.prol.loopexit

for.body3.us.prol.loopexit:                       ; preds = %for.body3.us.prol.loopexit.loopexit, %for.body3.lr.ph.us
  %indvars.iv.unr = phi i64 [ 0, %for.body3.lr.ph.us ], [ %indvars.iv.next.prol, %for.body3.us.prol.loopexit.loopexit ]
  %22 = icmp ult i64 %indvars.iv51, 3
  br i1 %22, label %for.cond9.preheader.us25.preheader, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.body3.us.prol.loopexit
  %pgocount6 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 13)
  %23 = add i64 %pgocount6, 1
  store i64 %23, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 13)
  %24 = sub i64 %17, %indvars.iv.unr
  %25 = lshr i64 %24, 2
  %26 = add nuw nsw i64 %25, 1
  %min.iters.check80 = icmp ult i64 %26, 2
  br i1 %min.iters.check80, label %for.body3.us.preheader103, label %min.iters.checked81

for.body3.us.preheader103:                        ; preds = %middle.block78, %min.iters.checked81, %for.body3.us.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked81 ], [ %indvars.iv.unr, %for.body3.us.preheader ], [ %ind.end89, %middle.block78 ]
  br label %for.body3.us

min.iters.checked81:                              ; preds = %for.body3.us.preheader
  %pgocount7 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 18)
  %27 = add i64 %pgocount7, 1
  store i64 %27, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 18)
  %n.mod.vf82 = and i64 %26, 1
  %n.vec83 = sub nsw i64 %26, %n.mod.vf82
  %cmp.zero84 = icmp eq i64 %n.vec83, 0
  %28 = add i64 %indvars.iv.unr, 4
  %29 = shl nuw i64 %25, 2
  %30 = add i64 %28, %29
  %31 = shl nuw nsw i64 %n.mod.vf82, 2
  %ind.end89 = sub i64 %30, %31
  br i1 %cmp.zero84, label %for.body3.us.preheader103, label %vector.ph85

vector.ph85:                                      ; preds = %min.iters.checked81
  br label %vector.body77

vector.body77:                                    ; preds = %vector.body77.vector.body77_crit_edge, %vector.ph85
  %index86 = phi i64 [ 0, %vector.ph85 ], [ %index.next87, %vector.body77.vector.body77_crit_edge ]
  %32 = shl i64 %index86, 2
  %33 = add i64 %indvars.iv.unr, %32
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv51, i64 %33
  %35 = bitcast double* %34 to <8 x double>*
  %wide.vec95 = load <8 x double>, <8 x double>* %35, align 8
  %strided.vec96 = shufflevector <8 x double> %wide.vec95, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec97 = shufflevector <8 x double> %wide.vec95, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec98 = shufflevector <8 x double> %wide.vec95, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec99 = shufflevector <8 x double> %wide.vec95, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %36 = fmul <2 x double> %strided.vec96, %broadcast.splat101
  %37 = fmul <2 x double> %strided.vec97, %broadcast.splat101
  %38 = fmul <2 x double> %strided.vec98, %broadcast.splat101
  %39 = add nsw i64 %33, 3
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv51, i64 %39
  %41 = fmul <2 x double> %strided.vec99, %broadcast.splat101
  %42 = getelementptr double, double* %40, i64 -3
  %43 = bitcast double* %42 to <8 x double>*
  %44 = shufflevector <2 x double> %36, <2 x double> %37, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %45 = shufflevector <2 x double> %38, <2 x double> %41, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec102 = shufflevector <4 x double> %44, <4 x double> %45, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec102, <8 x double>* %43, align 8
  %index.next87 = add i64 %index86, 2
  %46 = icmp eq i64 %index.next87, %n.vec83
  br i1 %46, label %middle.block78, label %vector.body77.vector.body77_crit_edge, !llvm.loop !7

vector.body77.vector.body77_crit_edge:            ; preds = %vector.body77
  %pgocount8 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 6)
  %47 = add i64 %pgocount8, 1
  store i64 %47, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 6)
  br label %vector.body77

middle.block78:                                   ; preds = %vector.body77
  %pgocount9 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 19)
  %48 = add i64 %pgocount9, 1
  store i64 %48, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 19)
  %cmp.n90 = icmp eq i64 %n.mod.vf82, 0
  br i1 %cmp.n90, label %for.cond9.preheader.us25.preheader, label %for.body3.us.preheader103

for.cond9.preheader.us25.preheader.loopexit:      ; preds = %for.body3.us
  %pgocount10 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 14)
  %49 = add i64 %pgocount10, 1
  store i64 %49, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 14)
  br label %for.cond9.preheader.us25.preheader

for.cond9.preheader.us25.preheader:               ; preds = %for.cond9.preheader.us25.preheader.loopexit, %middle.block78, %for.body3.us.prol.loopexit
  %xtraiter4269 = and i64 %indvars.iv.next52, 1
  %lcmp.mod43 = icmp eq i64 %xtraiter4269, 0
  %50 = icmp eq i64 %indvars.iv51, 0
  %arrayidx25.us18.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv51, i64 0
  br label %for.cond9.preheader.us25

for.cond9.for.inc29_crit_edge.us30.loopexit:      ; preds = %for.body11.us12
  %pgocount11 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 9)
  %51 = add i64 %pgocount11, 1
  store i64 %51, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 9)
  br label %for.cond9.for.inc29_crit_edge.us30

for.cond9.for.inc29_crit_edge.us30:               ; preds = %for.body11.us12.prol.loopexit.for.cond9.for.inc29_crit_edge.us30_crit_edge, %for.cond9.for.inc29_crit_edge.us30.loopexit
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond = icmp eq i64 %indvars.iv.next46, %wide.trip.count47
  br i1 %exitcond, label %for.cond6.for.inc32_crit_edge.us, label %for.cond9.preheader.us25

for.cond6.for.inc32_crit_edge.us:                 ; preds = %for.cond9.for.inc29_crit_edge.us30
  %pgocount12 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 11)
  %52 = add i64 %pgocount12, 1
  store i64 %52, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 11)
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next52, %wide.trip.count53
  br i1 %exitcond54, label %for.end34.loopexit, label %for.body3.lr.ph.us

for.body3.lr.ph:                                  ; preds = %for.inc32, %for.body3.lr.ph.preheader
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %for.inc32 ], [ 0, %for.body3.lr.ph.preheader ]
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %for.inc32 ], [ 1, %for.body3.lr.ph.preheader ]
  %53 = add i64 %indvars.iv65, -3
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %54 = trunc i64 %indvars.iv.next66 to i32
  %xtraiter60 = and i32 %54, 3
  %lcmp.mod61 = icmp eq i32 %xtraiter60, 0
  br i1 %lcmp.mod61, label %for.body3.lr.ph.for.body3.prol.loopexit_crit_edge, label %for.body3.prol.preheader

for.body3.lr.ph.for.body3.prol.loopexit_crit_edge: ; preds = %for.body3.lr.ph
  %pgocount13 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 8)
  %55 = add i64 %pgocount13, 1
  store i64 %55, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 8)
  br label %for.body3.prol.loopexit

for.body3.prol.preheader:                         ; preds = %for.body3.lr.ph
  br label %for.body3.prol

for.body3.prol:                                   ; preds = %for.body3.prol.for.body3.prol_crit_edge, %for.body3.prol.preheader
  %indvars.iv55.prol = phi i64 [ %indvars.iv.next56.prol, %for.body3.prol.for.body3.prol_crit_edge ], [ 0, %for.body3.prol.preheader ]
  %prol.iter62 = phi i32 [ %prol.iter62.sub, %for.body3.prol.for.body3.prol_crit_edge ], [ %xtraiter60, %for.body3.prol.preheader ]
  %arrayidx5.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv65, i64 %indvars.iv55.prol
  %56 = load double, double* %arrayidx5.prol, align 8
  %mul.prol = fmul double %56, %beta
  store double %mul.prol, double* %arrayidx5.prol, align 8
  %indvars.iv.next56.prol = add nuw nsw i64 %indvars.iv55.prol, 1
  %prol.iter62.sub = add i32 %prol.iter62, -1
  %prol.iter62.cmp = icmp eq i32 %prol.iter62.sub, 0
  br i1 %prol.iter62.cmp, label %for.body3.prol.loopexit.loopexit, label %for.body3.prol.for.body3.prol_crit_edge, !llvm.loop !8

for.body3.prol.for.body3.prol_crit_edge:          ; preds = %for.body3.prol
  %pgocount14 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 4)
  %57 = add i64 %pgocount14, 1
  store i64 %57, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 4)
  br label %for.body3.prol

for.body3.prol.loopexit.loopexit:                 ; preds = %for.body3.prol
  %pgocount15 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 15)
  %58 = add i64 %pgocount15, 1
  store i64 %58, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 15)
  br label %for.body3.prol.loopexit

for.body3.prol.loopexit:                          ; preds = %for.body3.lr.ph.for.body3.prol.loopexit_crit_edge, %for.body3.prol.loopexit.loopexit
  %indvars.iv55.unr = phi i64 [ 0, %for.body3.lr.ph.for.body3.prol.loopexit_crit_edge ], [ %indvars.iv.next56.prol, %for.body3.prol.loopexit.loopexit ]
  %59 = icmp ult i64 %indvars.iv65, 3
  br i1 %59, label %for.inc32, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.body3.prol.loopexit
  %pgocount16 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 16)
  %60 = add i64 %pgocount16, 1
  store i64 %60, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 16)
  %61 = sub i64 %53, %indvars.iv55.unr
  %62 = lshr i64 %61, 2
  %63 = add nuw nsw i64 %62, 1
  %min.iters.check = icmp ult i64 %63, 2
  br i1 %min.iters.check, label %for.body3.preheader104, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body3.preheader
  %pgocount17 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 20)
  %64 = add i64 %pgocount17, 1
  store i64 %64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 20)
  %n.mod.vf = and i64 %63, 1
  %n.vec = sub nsw i64 %63, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %65 = add i64 %indvars.iv55.unr, 4
  %66 = shl nuw i64 %62, 2
  %67 = add i64 %65, %66
  %68 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %67, %68
  br i1 %cmp.zero, label %for.body3.preheader104, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %69 = shl i64 %index, 2
  %70 = add i64 %indvars.iv55.unr, %69
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv65, i64 %70
  %72 = bitcast double* %71 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %72, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec72 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec73 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec74 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %73 = fmul <2 x double> %strided.vec, %broadcast.splat76
  %74 = fmul <2 x double> %strided.vec72, %broadcast.splat76
  %75 = fmul <2 x double> %strided.vec73, %broadcast.splat76
  %76 = add nsw i64 %70, 3
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv65, i64 %76
  %78 = fmul <2 x double> %strided.vec74, %broadcast.splat76
  %79 = getelementptr double, double* %77, i64 -3
  %80 = bitcast double* %79 to <8 x double>*
  %81 = shufflevector <2 x double> %73, <2 x double> %74, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %82 = shufflevector <2 x double> %75, <2 x double> %78, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %81, <4 x double> %82, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %80, align 8
  %index.next = add i64 %index, 2
  %83 = icmp eq i64 %index.next, %n.vec
  br i1 %83, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !9

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  %pgocount18 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 7)
  %84 = add i64 %pgocount18, 1
  store i64 %84, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 7)
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %pgocount19 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 21)
  %85 = add i64 %pgocount19, 1
  store i64 %85, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 21)
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.inc32, label %for.body3.preheader104

for.body3.preheader104:                           ; preds = %middle.block, %min.iters.checked, %for.body3.preheader
  %indvars.iv55.ph = phi i64 [ %indvars.iv55.unr, %min.iters.checked ], [ %indvars.iv55.unr, %for.body3.preheader ], [ %ind.end, %middle.block ]
  br label %for.body3

for.body3:                                        ; preds = %for.body3.for.body3_crit_edge, %for.body3.preheader104
  %indvars.iv55 = phi i64 [ %indvars.iv.next56.3, %for.body3.for.body3_crit_edge ], [ %indvars.iv55.ph, %for.body3.preheader104 ]
  %arrayidx5 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv65, i64 %indvars.iv55
  %86 = load double, double* %arrayidx5, align 8
  %mul = fmul double %86, %beta
  store double %mul, double* %arrayidx5, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %arrayidx5.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv65, i64 %indvars.iv.next56
  %87 = load double, double* %arrayidx5.1, align 8
  %mul.1 = fmul double %87, %beta
  store double %mul.1, double* %arrayidx5.1, align 8
  %indvars.iv.next56.1 = add nsw i64 %indvars.iv55, 2
  %arrayidx5.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv65, i64 %indvars.iv.next56.1
  %88 = load double, double* %arrayidx5.2, align 8
  %mul.2 = fmul double %88, %beta
  store double %mul.2, double* %arrayidx5.2, align 8
  %indvars.iv.next56.2 = add nsw i64 %indvars.iv55, 3
  %arrayidx5.3 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv65, i64 %indvars.iv.next56.2
  %89 = load double, double* %arrayidx5.3, align 8
  %mul.3 = fmul double %89, %beta
  store double %mul.3, double* %arrayidx5.3, align 8
  %indvars.iv.next56.3 = add nsw i64 %indvars.iv55, 4
  %exitcond59.3 = icmp eq i64 %indvars.iv.next56.3, %indvars.iv63
  br i1 %exitcond59.3, label %for.inc32.loopexit, label %for.body3.for.body3_crit_edge, !llvm.loop !10

for.body3.for.body3_crit_edge:                    ; preds = %for.body3
  %pgocount20 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 5)
  %90 = add i64 %pgocount20, 1
  store i64 %90, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 5)
  br label %for.body3

for.inc32.loopexit:                               ; preds = %for.body3
  %pgocount21 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 17)
  %91 = add i64 %pgocount21, 1
  store i64 %91, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 17)
  br label %for.inc32

for.inc32:                                        ; preds = %for.inc32.loopexit, %middle.block, %for.body3.prol.loopexit
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next66, %wide.trip.count67
  br i1 %exitcond68, label %for.end34.loopexit105, label %for.body3.lr.ph

for.end34.loopexit:                               ; preds = %for.cond6.for.inc32_crit_edge.us
  %pgocount22 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 23)
  %92 = add i64 %pgocount22, 1
  store i64 %92, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 23)
  br label %for.end34

for.end34.loopexit105:                            ; preds = %for.inc32
  %pgocount23 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 24)
  %93 = add i64 %pgocount23, 1
  store i64 %93, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 24)
  br label %for.end34

for.end34:                                        ; preds = %for.end34.loopexit105, %for.end34.loopexit, %entry
  %pgocount24 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 22)
  %94 = add i64 %pgocount24, 1
  store i64 %94, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_syrk, i64 0, i64 22)
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
!5 = distinct !{!5, !6}
!6 = !{!"llvm.loop.unroll.disable"}
!7 = distinct !{!7, !3, !4}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !3, !4}
!10 = distinct !{!10, !2, !3, !4}
