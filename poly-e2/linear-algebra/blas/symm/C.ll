; ModuleID = 'B.ll'
source_filename = "symm.c"
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
@__profn_B.ll_kernel_symm = private constant [16 x i8] c"B.ll:kernel_symm"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 32414643582, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [19 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 216003077631, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 19, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_symm = private global [14 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_symm = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -7942146524714263212, i64 173535970358, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i32 0, i32 0), i8* null, i8* null, i32 14, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 63976198547, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [56 x i8] c"6\00main\01B.ll:init_array\01B.ll:kernel_symm\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_symm to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([56 x i8], [56 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1000 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  tail call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  tail call fastcc void @kernel_symm(i32 1000, i32 1200, double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
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
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %arraydecay)
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
define internal fastcc void @init_array(i32 %m, i32 %n, double* nocapture %alpha, double* nocapture %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture %A, [1200 x double]* nocapture %B) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  %cmp10 = icmp sgt i32 %m, 0
  br i1 %cmp10, label %for.cond1.preheader.lr.ph, label %for.end53

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %pgocount = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 16)
  %0 = add i64 %pgocount, 1
  store i64 %0, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 16)
  %cmp28 = icmp sgt i32 %n, 0
  %conv4 = sitofp i32 %m to double
  br i1 %cmp28, label %for.cond1.preheader.us.preheader, label %for.cond23.preheader.lr.ph

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %1 = zext i32 %n to i64
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count38 = zext i32 %m to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc16_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv35 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next36, %for.cond1.for.inc16_crit_edge.us ]
  %2 = add i64 %indvars.iv35, %1
  %3 = trunc i64 %2 to i32
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.for.body3.us_crit_edge, %for.cond1.preheader.us
  %indvars.iv31 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next32, %for.body3.us.for.body3.us_crit_edge ]
  %4 = add nuw nsw i64 %indvars.iv31, %indvars.iv35
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 100
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %arrayidx6.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv35, i64 %indvars.iv31
  store double %div.us, double* %arrayidx6.us, align 8
  %6 = trunc i64 %indvars.iv31 to i32
  %sub.us = sub i32 %3, %6
  %rem8.us = srem i32 %sub.us, 100
  %conv9.us = sitofp i32 %rem8.us to double
  %div11.us = fdiv double %conv9.us, %conv4
  %arrayidx15.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv35, i64 %indvars.iv31
  store double %div11.us, double* %arrayidx15.us, align 8
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next32, %wide.trip.count
  br i1 %exitcond34, label %for.cond1.for.inc16_crit_edge.us, label %for.body3.us.for.body3.us_crit_edge

for.body3.us.for.body3.us_crit_edge:              ; preds = %for.body3.us
  %pgocount1 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %7 = add i64 %pgocount1, 1
  store i64 %7, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  br label %for.body3.us

for.cond1.for.inc16_crit_edge.us:                 ; preds = %for.body3.us
  %pgocount2 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %8 = add i64 %pgocount2, 1
  store i64 %8, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next36, %wide.trip.count38
  br i1 %exitcond39, label %for.cond19.preheader, label %for.cond1.preheader.us

for.cond19.preheader:                             ; preds = %for.cond1.for.inc16_crit_edge.us
  %pgocount3 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 18)
  %9 = add i64 %pgocount3, 1
  store i64 %9, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 18)
  %cmp206 = icmp sgt i32 %m, 0
  br i1 %cmp206, label %for.cond23.preheader.lr.ph, label %for.end53

for.cond23.preheader.lr.ph:                       ; preds = %for.cond19.preheader, %for.cond1.preheader.lr.ph
  %conv30 = sitofp i32 %m to double
  %10 = add i32 %m, 7
  %11 = add i32 %m, -2
  %12 = sext i32 %m to i64
  %wide.trip.count21.7 = zext i32 %m to i64
  %wide.trip.count30 = zext i32 %m to i64
  %13 = add nsw i64 %wide.trip.count21.7, -8
  br label %for.body26.lr.ph

for.body26.lr.ph:                                 ; preds = %for.inc51, %for.cond23.preheader.lr.ph
  %indvars.iv28 = phi i64 [ 0, %for.cond23.preheader.lr.ph ], [ %indvars.iv.next29, %for.inc51 ]
  %indvars.iv26 = phi i64 [ 1, %for.cond23.preheader.lr.ph ], [ %indvars.iv.next27, %for.inc51 ]
  %14 = sub nsw i64 0, %indvars.iv28
  %15 = trunc i64 %14 to i32
  %16 = add i32 %10, %15
  %17 = trunc i64 %14 to i32
  %18 = add i32 %11, %17
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %xtraiter41 = and i64 %indvars.iv.next29, 1
  %lcmp.mod = icmp eq i64 %xtraiter41, 0
  br i1 %lcmp.mod, label %for.body26.prol.loopexit, label %for.body26.prol

for.body26.prol:                                  ; preds = %for.body26.lr.ph
  %pgocount4 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  %19 = add i64 %pgocount4, 1
  store i64 %19, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  %20 = trunc i64 %indvars.iv28 to i32
  %rem28.prol = srem i32 %20, 100
  %conv29.prol = sitofp i32 %rem28.prol to double
  %div31.prol = fdiv double %conv29.prol, %conv30
  %arrayidx35.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv28, i64 0
  store double %div31.prol, double* %arrayidx35.prol, align 8
  br label %for.body26.prol.loopexit

for.body26.prol.loopexit:                         ; preds = %for.body26.prol, %for.body26.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body26.prol ], [ 0, %for.body26.lr.ph ]
  %21 = icmp eq i64 %indvars.iv28, 0
  br i1 %21, label %for.body26.prol.loopexit.for.cond40.preheader_crit_edge, label %for.body26.preheader

for.body26.prol.loopexit.for.cond40.preheader_crit_edge: ; preds = %for.body26.prol.loopexit
  %pgocount5 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %22 = add i64 %pgocount5, 1
  store i64 %22, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  br label %for.cond40.preheader

for.body26.preheader:                             ; preds = %for.body26.prol.loopexit
  br label %for.body26

for.cond40.preheader.loopexit:                    ; preds = %for.body26
  %pgocount6 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %23 = add i64 %pgocount6, 1
  store i64 %23, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  br label %for.cond40.preheader

for.cond40.preheader:                             ; preds = %for.body26.prol.loopexit.for.cond40.preheader_crit_edge, %for.cond40.preheader.loopexit
  %cmp414 = icmp slt i64 %indvars.iv.next29, %12
  br i1 %cmp414, label %for.body43.lr.ph, label %for.inc51

for.body43.lr.ph:                                 ; preds = %for.cond40.preheader
  %pgocount7 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  %24 = add i64 %pgocount7, 1
  store i64 %24, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  %xtraiter22 = and i32 %16, 7
  %lcmp.mod23 = icmp eq i32 %xtraiter22, 0
  br i1 %lcmp.mod23, label %for.body43.prol.loopexit, label %for.body43.prol.preheader

for.body43.prol.preheader:                        ; preds = %for.body43.lr.ph
  br label %for.body43.prol

for.body43.prol:                                  ; preds = %for.body43.prol.for.body43.prol_crit_edge, %for.body43.prol.preheader
  %indvars.iv19.prol = phi i64 [ %indvars.iv.next20.prol, %for.body43.prol.for.body43.prol_crit_edge ], [ %indvars.iv26, %for.body43.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body43.prol.for.body43.prol_crit_edge ], [ %xtraiter22, %for.body43.prol.preheader ]
  %arrayidx47.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv28, i64 %indvars.iv19.prol
  store double -9.990000e+02, double* %arrayidx47.prol, align 8
  %indvars.iv.next20.prol = add nuw nsw i64 %indvars.iv19.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body43.prol.loopexit.loopexit, label %for.body43.prol.for.body43.prol_crit_edge, !llvm.loop !1

for.body43.prol.for.body43.prol_crit_edge:        ; preds = %for.body43.prol
  %pgocount8 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %25 = add i64 %pgocount8, 1
  store i64 %25, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  br label %for.body43.prol

for.body43.prol.loopexit.loopexit:                ; preds = %for.body43.prol
  %pgocount9 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 10)
  %26 = add i64 %pgocount9, 1
  store i64 %26, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 10)
  br label %for.body43.prol.loopexit

for.body43.prol.loopexit:                         ; preds = %for.body43.prol.loopexit.loopexit, %for.body43.lr.ph
  %indvars.iv19.unr = phi i64 [ %indvars.iv26, %for.body43.lr.ph ], [ %indvars.iv.next20.prol, %for.body43.prol.loopexit.loopexit ]
  %27 = icmp ult i32 %18, 7
  br i1 %27, label %for.inc51, label %for.body43.preheader

for.body43.preheader:                             ; preds = %for.body43.prol.loopexit
  %pgocount10 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 11)
  %28 = add i64 %pgocount10, 1
  store i64 %28, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 11)
  %29 = sub i64 %13, %indvars.iv19.unr
  %30 = lshr i64 %29, 3
  %31 = add nuw nsw i64 %30, 1
  %min.iters.check = icmp ult i64 %31, 2
  br i1 %min.iters.check, label %for.body43.preheader45, label %min.iters.checked

for.body43.preheader45:                           ; preds = %middle.block, %min.iters.checked, %for.body43.preheader
  %indvars.iv19.ph = phi i64 [ %indvars.iv19.unr, %min.iters.checked ], [ %indvars.iv19.unr, %for.body43.preheader ], [ %ind.end, %middle.block ]
  br label %for.body43

min.iters.checked:                                ; preds = %for.body43.preheader
  %pgocount11 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 13)
  %32 = add i64 %pgocount11, 1
  store i64 %32, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 13)
  %n.mod.vf = and i64 %31, 1
  %n.vec = sub nsw i64 %31, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %33 = add i64 %indvars.iv19.unr, 8
  %34 = shl nuw i64 %30, 3
  %35 = add i64 %33, %34
  %36 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %35, %36
  br i1 %cmp.zero, label %for.body43.preheader45, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %37 = shl i64 %index, 3
  %38 = add i64 %indvars.iv19.unr, %37
  %39 = add nsw i64 %38, 7
  %40 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv28, i64 %39
  %41 = getelementptr double, double* %40, i64 -7
  %42 = bitcast double* %41 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %42, align 8
  %index.next = add i64 %index, 2
  %43 = icmp eq i64 %index.next, %n.vec
  br i1 %43, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !3

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  %pgocount12 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %44 = add i64 %pgocount12, 1
  store i64 %44, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %pgocount13 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 14)
  %45 = add i64 %pgocount13, 1
  store i64 %45, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 14)
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.inc51, label %for.body43.preheader45

for.body26:                                       ; preds = %for.body26.for.body26_crit_edge, %for.body26.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body26.for.body26_crit_edge ], [ %indvars.iv.unr.ph, %for.body26.preheader ]
  %46 = add nuw nsw i64 %indvars.iv, %indvars.iv28
  %47 = trunc i64 %46 to i32
  %rem28 = srem i32 %47, 100
  %conv29 = sitofp i32 %rem28 to double
  %div31 = fdiv double %conv29, %conv30
  %arrayidx35 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv28, i64 %indvars.iv
  store double %div31, double* %arrayidx35, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %48 = add nuw nsw i64 %indvars.iv.next, %indvars.iv28
  %49 = trunc i64 %48 to i32
  %rem28.1 = srem i32 %49, 100
  %conv29.1 = sitofp i32 %rem28.1 to double
  %div31.1 = fdiv double %conv29.1, %conv30
  %arrayidx35.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv28, i64 %indvars.iv.next
  store double %div31.1, double* %arrayidx35.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv26
  br i1 %exitcond.1, label %for.cond40.preheader.loopexit, label %for.body26.for.body26_crit_edge

for.body26.for.body26_crit_edge:                  ; preds = %for.body26
  %pgocount14 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %50 = add i64 %pgocount14, 1
  store i64 %50, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  br label %for.body26

for.body43:                                       ; preds = %for.body43.for.body43_crit_edge, %for.body43.preheader45
  %indvars.iv19 = phi i64 [ %indvars.iv.next20.7, %for.body43.for.body43_crit_edge ], [ %indvars.iv19.ph, %for.body43.preheader45 ]
  %arrayidx47 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv28, i64 %indvars.iv19
  store double -9.990000e+02, double* %arrayidx47, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %arrayidx47.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv28, i64 %indvars.iv.next20
  store double -9.990000e+02, double* %arrayidx47.1, align 8
  %indvars.iv.next20.1 = add nsw i64 %indvars.iv19, 2
  %arrayidx47.2 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv28, i64 %indvars.iv.next20.1
  store double -9.990000e+02, double* %arrayidx47.2, align 8
  %indvars.iv.next20.2 = add nsw i64 %indvars.iv19, 3
  %arrayidx47.3 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv28, i64 %indvars.iv.next20.2
  store double -9.990000e+02, double* %arrayidx47.3, align 8
  %indvars.iv.next20.3 = add nsw i64 %indvars.iv19, 4
  %arrayidx47.4 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv28, i64 %indvars.iv.next20.3
  store double -9.990000e+02, double* %arrayidx47.4, align 8
  %indvars.iv.next20.4 = add nsw i64 %indvars.iv19, 5
  %arrayidx47.5 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv28, i64 %indvars.iv.next20.4
  store double -9.990000e+02, double* %arrayidx47.5, align 8
  %indvars.iv.next20.5 = add nsw i64 %indvars.iv19, 6
  %arrayidx47.6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv28, i64 %indvars.iv.next20.5
  store double -9.990000e+02, double* %arrayidx47.6, align 8
  %indvars.iv.next20.6 = add nsw i64 %indvars.iv19, 7
  %arrayidx47.7 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv28, i64 %indvars.iv.next20.6
  store double -9.990000e+02, double* %arrayidx47.7, align 8
  %indvars.iv.next20.7 = add nsw i64 %indvars.iv19, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next20.7, %wide.trip.count21.7
  br i1 %exitcond.7, label %for.inc51.loopexit, label %for.body43.for.body43_crit_edge, !llvm.loop !6

for.body43.for.body43_crit_edge:                  ; preds = %for.body43
  %pgocount15 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %51 = add i64 %pgocount15, 1
  store i64 %51, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  br label %for.body43

for.inc51.loopexit:                               ; preds = %for.body43
  %pgocount16 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 12)
  %52 = add i64 %pgocount16, 1
  store i64 %52, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 12)
  br label %for.inc51

for.inc51:                                        ; preds = %for.inc51.loopexit, %middle.block, %for.body43.prol.loopexit, %for.cond40.preheader
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond = icmp eq i64 %indvars.iv.next29, %wide.trip.count30
  br i1 %exitcond, label %for.end53.loopexit, label %for.body26.lr.ph

for.end53.loopexit:                               ; preds = %for.inc51
  %pgocount17 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 17)
  %53 = add i64 %pgocount17, 1
  store i64 %53, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 17)
  br label %for.end53

for.end53:                                        ; preds = %for.end53.loopexit, %for.cond19.preheader, %entry
  %pgocount18 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 15)
  %54 = add i64 %pgocount18, 1
  store i64 %54, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_init_array, i64 0, i64 15)
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_symm(i32 %m, i32 %n, double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A, [1200 x double]* nocapture readonly %B) unnamed_addr #2 {
entry:
  %cmp8 = icmp sgt i32 %m, 0
  %cmp26 = icmp sgt i32 %n, 0
  %or.cond = and i1 %cmp8, %cmp26
  br i1 %or.cond, label %for.cond1.preheader.us.preheader, label %for.end55

for.cond1.preheader.us.preheader:                 ; preds = %entry
  %wide.trip.count66 = zext i32 %m to i64
  %wide.trip.count62 = zext i32 %n to i64
  %mul44.us23 = fmul double %alpha, 0.000000e+00
  %wide.trip.count = zext i32 %n to i64
  %0 = add nsw i64 %wide.trip.count62, -1
  %min.iters.check = icmp ult i32 %n, 4
  %1 = and i32 %n, 3
  %n.mod.vf = zext i32 %1 to i64
  %n.vec = sub nsw i64 %wide.trip.count62, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %broadcast.splatinsert84 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat85 = shufflevector <2 x double> %broadcast.splatinsert84, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert88 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat89 = shufflevector <2 x double> %broadcast.splatinsert88, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert90 = insertelement <2 x double> undef, double %mul44.us23, i32 0
  %broadcast.splat91 = shufflevector <2 x double> %broadcast.splatinsert90, <2 x double> undef, <2 x i32> zeroinitializer
  %cmp.n = icmp eq i32 %1, 0
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc53_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %for.cond1.for.inc53_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv64, i64 0
  %scevgep72 = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv64, i64 %wide.trip.count62
  %scevgep74 = getelementptr [1200 x double], [1200 x double]* %B, i64 %indvars.iv64, i64 0
  %scevgep76 = getelementptr [1200 x double], [1200 x double]* %B, i64 %indvars.iv64, i64 %wide.trip.count62
  %cmp51.us = icmp sgt i64 %indvars.iv64, 0
  %arrayidx41.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv64, i64 %indvars.iv64
  br i1 %cmp51.us, label %for.cond4.preheader.us.us.preheader, label %for.cond4.preheader.us41.preheader

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.us
  br label %for.cond4.preheader.us.us

for.cond4.preheader.us41.preheader:               ; preds = %for.cond1.preheader.us
  %pgocount = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 5)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 5)
  br i1 %min.iters.check, label %for.cond4.preheader.us41.preheader92, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond4.preheader.us41.preheader
  %pgocount1 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 7)
  %3 = add i64 %pgocount1, 1
  store i64 %3, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 7)
  br i1 %cmp.zero, label %for.cond4.preheader.us41.preheader92, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %pgocount2 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 10)
  %4 = add i64 %pgocount2, 1
  store i64 %4, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 10)
  %bound0 = icmp ult double* %scevgep, %scevgep76
  %bound1 = icmp ult double* %scevgep74, %scevgep72
  %found.conflict = and i1 %bound0, %bound1
  %bound079 = icmp ult double* %scevgep, %arrayidx41.us.us
  %bound180 = icmp ult double* %arrayidx41.us.us, %scevgep72
  %found.conflict81 = and i1 %bound079, %bound180
  %conflict.rdx = or i1 %found.conflict, %found.conflict81
  br i1 %conflict.rdx, label %for.cond4.preheader.us41.preheader92, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %5 = load double, double* %arrayidx41.us.us, align 8, !alias.scope !8
  %6 = insertelement <2 x double> undef, double %5, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  %8 = insertelement <2 x double> undef, double %5, i32 0
  %9 = shufflevector <2 x double> %8, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv64, i64 %index
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !11, !noalias !13
  %12 = getelementptr double, double* %10, i64 2
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !11, !noalias !13
  %14 = fmul <2 x double> %wide.load, %broadcast.splat85
  %15 = fmul <2 x double> %wide.load83, %broadcast.splat85
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv64, i64 %index
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !15
  %18 = getelementptr double, double* %16, i64 2
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !15
  %20 = fmul <2 x double> %wide.load86, %broadcast.splat89
  %21 = fmul <2 x double> %wide.load87, %broadcast.splat89
  %22 = fmul <2 x double> %20, %7
  %23 = fmul <2 x double> %21, %9
  %24 = fadd <2 x double> %14, %22
  %25 = fadd <2 x double> %15, %23
  %26 = fadd <2 x double> %broadcast.splat91, %24
  %27 = fadd <2 x double> %broadcast.splat91, %25
  %28 = bitcast double* %10 to <2 x double>*
  store <2 x double> %26, <2 x double>* %28, align 8, !alias.scope !11, !noalias !13
  %29 = bitcast double* %12 to <2 x double>*
  store <2 x double> %27, <2 x double>* %29, align 8, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %30 = icmp eq i64 %index.next, %n.vec
  br i1 %30, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !16

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  %pgocount3 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 2)
  %31 = add i64 %pgocount3, 1
  store i64 %31, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 2)
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %pgocount4 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 12)
  %32 = add i64 %pgocount4, 1
  store i64 %32, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 12)
  br i1 %cmp.n, label %for.cond1.for.inc53_crit_edge.us, label %for.cond4.preheader.us41.preheader92

for.cond4.preheader.us41.preheader92:             ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond4.preheader.us41.preheader
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond4.preheader.us41.preheader ], [ %n.vec, %middle.block ]
  %33 = sub nsw i64 %wide.trip.count62, %indvars.iv.ph
  %xtraiter = and i64 %33, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.cond4.preheader.us41.prol.loopexit.unr-lcssa, label %for.cond4.preheader.us41.prol.preheader

for.cond4.preheader.us41.prol.preheader:          ; preds = %for.cond4.preheader.us41.preheader92
  br label %for.cond4.preheader.us41.prol

for.cond4.preheader.us41.prol:                    ; preds = %for.cond4.preheader.us41.prol.preheader
  %pgocount5 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 8)
  %34 = add i64 %pgocount5, 1
  store i64 %34, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 8)
  %arrayidx31.us16.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv64, i64 %indvars.iv.ph
  %35 = load double, double* %arrayidx31.us16.prol, align 8
  %mul32.us17.prol = fmul double %35, %beta
  %arrayidx36.us18.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv64, i64 %indvars.iv.ph
  %36 = load double, double* %arrayidx36.us18.prol, align 8
  %mul37.us19.prol = fmul double %36, %alpha
  %37 = load double, double* %arrayidx41.us.us, align 8
  %mul42.us21.prol = fmul double %mul37.us19.prol, %37
  %add43.us22.prol = fadd double %mul32.us17.prol, %mul42.us21.prol
  %add45.us24.prol = fadd double %mul44.us23, %add43.us22.prol
  store double %add45.us24.prol, double* %arrayidx31.us16.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.ph, 1
  br label %for.cond4.preheader.us41.prol.loopexit.unr-lcssa

for.cond4.preheader.us41.prol.loopexit.unr-lcssa: ; preds = %for.cond4.preheader.us41.prol, %for.cond4.preheader.us41.preheader92
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %for.cond4.preheader.us41.prol ], [ %indvars.iv.ph, %for.cond4.preheader.us41.preheader92 ]
  br label %for.cond4.preheader.us41.prol.loopexit

for.cond4.preheader.us41.prol.loopexit:           ; preds = %for.cond4.preheader.us41.prol.loopexit.unr-lcssa
  %38 = icmp eq i64 %0, %indvars.iv.ph
  br i1 %38, label %for.cond1.for.inc53_crit_edge.us.loopexit93, label %for.cond4.preheader.us41.preheader92.new

for.cond4.preheader.us41.preheader92.new:         ; preds = %for.cond4.preheader.us41.prol.loopexit
  br label %for.cond4.preheader.us41

for.cond4.preheader.us41:                         ; preds = %for.cond4.preheader.us41.for.cond4.preheader.us41_crit_edge, %for.cond4.preheader.us41.preheader92.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.cond4.preheader.us41.preheader92.new ], [ %indvars.iv.next.1, %for.cond4.preheader.us41.for.cond4.preheader.us41_crit_edge ]
  %arrayidx31.us16 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv64, i64 %indvars.iv
  %39 = load double, double* %arrayidx31.us16, align 8
  %mul32.us17 = fmul double %39, %beta
  %arrayidx36.us18 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv64, i64 %indvars.iv
  %40 = load double, double* %arrayidx36.us18, align 8
  %mul37.us19 = fmul double %40, %alpha
  %41 = load double, double* %arrayidx41.us.us, align 8
  %mul42.us21 = fmul double %mul37.us19, %41
  %add43.us22 = fadd double %mul32.us17, %mul42.us21
  %add45.us24 = fadd double %mul44.us23, %add43.us22
  store double %add45.us24, double* %arrayidx31.us16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx31.us16.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv64, i64 %indvars.iv.next
  %42 = load double, double* %arrayidx31.us16.1, align 8
  %mul32.us17.1 = fmul double %42, %beta
  %arrayidx36.us18.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv64, i64 %indvars.iv.next
  %43 = load double, double* %arrayidx36.us18.1, align 8
  %mul37.us19.1 = fmul double %43, %alpha
  %44 = load double, double* %arrayidx41.us.us, align 8
  %mul42.us21.1 = fmul double %mul37.us19.1, %44
  %add43.us22.1 = fadd double %mul32.us17.1, %mul42.us21.1
  %add45.us24.1 = fadd double %mul44.us23, %add43.us22.1
  store double %add45.us24.1, double* %arrayidx31.us16.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %for.cond1.for.inc53_crit_edge.us.loopexit93.unr-lcssa, label %for.cond4.preheader.us41.for.cond4.preheader.us41_crit_edge, !llvm.loop !17

for.cond4.preheader.us41.for.cond4.preheader.us41_crit_edge: ; preds = %for.cond4.preheader.us41
  %pgocount6 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 1)
  %45 = add i64 %pgocount6, 1
  store i64 %45, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 1)
  br label %for.cond4.preheader.us41

for.cond1.for.inc53_crit_edge.us.loopexit:        ; preds = %for.cond4.for.end_crit_edge.us.us
  %pgocount7 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 4)
  %46 = add i64 %pgocount7, 1
  store i64 %46, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 4)
  br label %for.cond1.for.inc53_crit_edge.us

for.cond1.for.inc53_crit_edge.us.loopexit93.unr-lcssa: ; preds = %for.cond4.preheader.us41
  %pgocount8 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 9)
  %47 = add i64 %pgocount8, 1
  store i64 %47, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 9)
  br label %for.cond1.for.inc53_crit_edge.us.loopexit93

for.cond1.for.inc53_crit_edge.us.loopexit93:      ; preds = %for.cond1.for.inc53_crit_edge.us.loopexit93.unr-lcssa, %for.cond4.preheader.us41.prol.loopexit
  %pgocount9 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 6)
  %48 = add i64 %pgocount9, 1
  store i64 %48, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 6)
  br label %for.cond1.for.inc53_crit_edge.us

for.cond1.for.inc53_crit_edge.us:                 ; preds = %for.cond1.for.inc53_crit_edge.us.loopexit93, %for.cond1.for.inc53_crit_edge.us.loopexit, %middle.block
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next65, %wide.trip.count66
  br i1 %exitcond67, label %for.end55.loopexit, label %for.cond1.preheader.us

for.cond4.preheader.us.us:                        ; preds = %for.cond4.for.end_crit_edge.us.us, %for.cond4.preheader.us.us.preheader
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %for.cond4.for.end_crit_edge.us.us ], [ 0, %for.cond4.preheader.us.us.preheader ]
  %arrayidx8.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv64, i64 %indvars.iv60
  br label %for.body6.us.us

for.cond4.for.end_crit_edge.us.us:                ; preds = %for.body6.us.us
  %pgocount10 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 3)
  %49 = add i64 %pgocount10, 1
  store i64 %49, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 3)
  %arrayidx31.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv64, i64 %indvars.iv60
  %50 = load double, double* %arrayidx31.us.us, align 8
  %mul32.us.us = fmul double %50, %beta
  %arrayidx36.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv64, i64 %indvars.iv60
  %51 = load double, double* %arrayidx36.us.us, align 8
  %mul37.us.us = fmul double %51, %alpha
  %52 = load double, double* %arrayidx41.us.us, align 8
  %mul42.us.us = fmul double %mul37.us.us, %52
  %add43.us.us = fadd double %mul32.us.us, %mul42.us.us
  %mul44.us.us = fmul double %add27.us.us, %alpha
  %add45.us.us = fadd double %mul44.us.us, %add43.us.us
  store double %add45.us.us, double* %arrayidx31.us.us, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond63 = icmp eq i64 %indvars.iv.next61, %wide.trip.count62
  br i1 %exitcond63, label %for.cond1.for.inc53_crit_edge.us.loopexit, label %for.cond4.preheader.us.us

for.body6.us.us:                                  ; preds = %for.body6.us.us.for.body6.us.us_crit_edge, %for.cond4.preheader.us.us
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %for.body6.us.us.for.body6.us.us_crit_edge ], [ 0, %for.cond4.preheader.us.us ]
  %temp2.03.us.us = phi double [ %add27.us.us, %for.body6.us.us.for.body6.us.us_crit_edge ], [ 0.000000e+00, %for.cond4.preheader.us.us ]
  %53 = load double, double* %arrayidx8.us.us, align 8
  %mul.us.us = fmul double %53, %alpha
  %arrayidx12.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv64, i64 %indvars.iv54
  %54 = load double, double* %arrayidx12.us.us, align 8
  %mul13.us.us = fmul double %mul.us.us, %54
  %arrayidx17.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %indvars.iv60
  %55 = load double, double* %arrayidx17.us.us, align 8
  %add.us.us = fadd double %55, %mul13.us.us
  store double %add.us.us, double* %arrayidx17.us.us, align 8
  %arrayidx21.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv54, i64 %indvars.iv60
  %56 = load double, double* %arrayidx21.us.us, align 8
  %57 = load double, double* %arrayidx12.us.us, align 8
  %mul26.us.us = fmul double %56, %57
  %add27.us.us = fadd double %temp2.03.us.us, %mul26.us.us
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next55, %indvars.iv64
  br i1 %exitcond59, label %for.cond4.for.end_crit_edge.us.us, label %for.body6.us.us.for.body6.us.us_crit_edge

for.body6.us.us.for.body6.us.us_crit_edge:        ; preds = %for.body6.us.us
  %pgocount11 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 0)
  %58 = add i64 %pgocount11, 1
  store i64 %58, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 0)
  br label %for.body6.us.us

for.end55.loopexit:                               ; preds = %for.cond1.for.inc53_crit_edge.us
  %pgocount12 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 13)
  %59 = add i64 %pgocount12, 1
  store i64 %59, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 13)
  br label %for.end55

for.end55:                                        ; preds = %for.end55.loopexit, %entry
  %pgocount13 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 11)
  %60 = add i64 %pgocount13, 1
  store i64 %60, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_symm, i64 0, i64 11)
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %m, i32 %n, [1200 x double]* nocapture readonly %C) unnamed_addr #0 {
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
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv8, i64 %indvars.iv
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
!13 = !{!14, !9}
!14 = distinct !{!14, !10}
!15 = !{!14}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}
