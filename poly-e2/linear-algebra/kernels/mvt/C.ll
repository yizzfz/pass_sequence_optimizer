; ModuleID = 'B.ll'
source_filename = "mvt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"x1\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"x2\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_mvt = private constant [15 x i8] c"B.ll:kernel_mvt"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 32414643582, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 72057671299453502, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_mvt = private global [11 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_mvt = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -598483100572296020, i64 133185768053, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_mvt, i32 0, i32 0), i8* null, i8* null, i32 11, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 89896666006, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [55 x i8] c"5\00main\01B.ll:init_array\01B.ll:kernel_mvt\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_mvt to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([55 x i8], [55 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %arraydecay = bitcast i8* %call1 to double*
  %arraydecay5 = bitcast i8* %call2 to double*
  %arraydecay6 = bitcast i8* %call3 to double*
  %arraydecay7 = bitcast i8* %call4 to double*
  %arraydecay8 = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, double* %arraydecay, double* %arraydecay5, double* %arraydecay6, double* %arraydecay7, [2000 x double]* %arraydecay8)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_mvt(i32 2000, double* %arraydecay, double* %arraydecay5, double* %arraydecay6, double* %arraydecay7, [2000 x double]* %arraydecay8)
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
  tail call fastcc void @print_array(i32 2000, double* %arraydecay, double* %arraydecay5)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %3 = add i64 %pgocount2, 1
  store i64 %3, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  tail call void @free(i8* %call4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, double* nocapture %x1, double* nocapture %x2, double* nocapture %y_1, double* nocapture %y_2, [2000 x double]* nocapture %A) unnamed_addr #2 {
entry:
  %cmp3 = icmp sgt i32 %n, 0
  br i1 %cmp3, label %for.body.lr.ph, label %for.end36

for.body.lr.ph:                                   ; preds = %entry
  %conv1 = sitofp i32 %n to double
  %0 = zext i32 %n to i64
  %xtraiter = and i32 %n, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %1 = icmp eq i32 %n, 1
  %wide.trip.count10 = zext i32 %n to i64
  %wide.trip.count.1 = zext i32 %n to i64
  %div29.us.prol = fdiv double 0.000000e+00, %conv1
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond22.for.cond.loopexit_crit_edge.us, %for.body.lr.ph
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %for.cond22.for.cond.loopexit_crit_edge.us ], [ 0, %for.body.lr.ph ]
  %2 = trunc i64 %indvars.iv6 to i32
  %conv.us = sitofp i32 %2 to double
  %div.us = fdiv double %conv.us, %conv1
  %arrayidx.us = getelementptr inbounds double, double* %x1, i64 %indvars.iv6
  store double %div.us, double* %arrayidx.us, align 8
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %3 = icmp eq i64 %indvars.iv.next7, %0
  %4 = trunc i64 %indvars.iv.next7 to i32
  %5 = sitofp i32 %4 to double
  %6 = zext i1 %3 to i64
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %7 = add i64 %pgocount, %6
  store i64 %7, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %conv3.us = select i1 %3, double 0.000000e+00, double %5
  %div5.us = fdiv double %conv3.us, %conv1
  %arrayidx7.us = getelementptr inbounds double, double* %x2, i64 %indvars.iv6
  store double %div5.us, double* %arrayidx7.us, align 8
  %8 = add nuw nsw i64 %indvars.iv6, 3
  %9 = trunc i64 %8 to i32
  %rem9.us = srem i32 %9, %n
  %conv10.us = sitofp i32 %rem9.us to double
  %div12.us = fdiv double %conv10.us, %conv1
  %arrayidx14.us = getelementptr inbounds double, double* %y_1, i64 %indvars.iv6
  store double %div12.us, double* %arrayidx14.us, align 8
  %10 = add nuw nsw i64 %indvars.iv6, 4
  %11 = trunc i64 %10 to i32
  %rem16.us = srem i32 %11, %n
  %conv17.us = sitofp i32 %rem16.us to double
  %div19.us = fdiv double %conv17.us, %conv1
  %arrayidx21.us = getelementptr inbounds double, double* %y_2, i64 %indvars.iv6
  store double %div19.us, double* %arrayidx21.us, align 8
  br i1 %lcmp.mod, label %for.body25.us.prol.loopexit, label %for.body25.us.prol

for.body25.us.prol:                               ; preds = %for.body.us
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %12 = add i64 %pgocount1, 1
  store i64 %12, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %arrayidx33.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv6, i64 0
  store double %div29.us.prol, double* %arrayidx33.us.prol, align 8
  br label %for.body25.us.prol.loopexit

for.body25.us.prol.loopexit:                      ; preds = %for.body25.us.prol, %for.body.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body25.us.prol ], [ 0, %for.body.us ]
  br i1 %1, label %for.body25.us.prol.loopexit.for.cond22.for.cond.loopexit_crit_edge.us_crit_edge, label %for.body25.us.preheader

for.body25.us.prol.loopexit.for.cond22.for.cond.loopexit_crit_edge.us_crit_edge: ; preds = %for.body25.us.prol.loopexit
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %13 = add i64 %pgocount2, 1
  store i64 %13, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  br label %for.cond22.for.cond.loopexit_crit_edge.us

for.body25.us.preheader:                          ; preds = %for.body25.us.prol.loopexit
  br label %for.body25.us

for.body25.us:                                    ; preds = %for.body25.us.for.body25.us_crit_edge, %for.body25.us.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body25.us.for.body25.us_crit_edge ], [ %indvars.iv.unr.ph, %for.body25.us.preheader ]
  %14 = mul nuw nsw i64 %indvars.iv, %indvars.iv6
  %15 = trunc i64 %14 to i32
  %rem26.us = srem i32 %15, %n
  %conv27.us = sitofp i32 %rem26.us to double
  %div29.us = fdiv double %conv27.us, %conv1
  %arrayidx33.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv6, i64 %indvars.iv
  store double %div29.us, double* %arrayidx33.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %16 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv6
  %17 = trunc i64 %16 to i32
  %rem26.us.1 = srem i32 %17, %n
  %conv27.us.1 = sitofp i32 %rem26.us.1 to double
  %div29.us.1 = fdiv double %conv27.us.1, %conv1
  %arrayidx33.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv6, i64 %indvars.iv.next
  store double %div29.us.1, double* %arrayidx33.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.cond22.for.cond.loopexit_crit_edge.us.loopexit, label %for.body25.us.for.body25.us_crit_edge

for.body25.us.for.body25.us_crit_edge:            ; preds = %for.body25.us
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %18 = add i64 %pgocount3, 1
  store i64 %18, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  br label %for.body25.us

for.cond22.for.cond.loopexit_crit_edge.us.loopexit: ; preds = %for.body25.us
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %19 = add i64 %pgocount4, 1
  store i64 %19, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  br label %for.cond22.for.cond.loopexit_crit_edge.us

for.cond22.for.cond.loopexit_crit_edge.us:        ; preds = %for.body25.us.prol.loopexit.for.cond22.for.cond.loopexit_crit_edge.us_crit_edge, %for.cond22.for.cond.loopexit_crit_edge.us.loopexit
  %exitcond = icmp eq i64 %indvars.iv.next7, %wide.trip.count10
  br i1 %exitcond, label %for.end36.loopexit, label %for.body.us

for.end36.loopexit:                               ; preds = %for.cond22.for.cond.loopexit_crit_edge.us
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %20 = add i64 %pgocount5, 1
  store i64 %20, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  br label %for.end36

for.end36:                                        ; preds = %for.end36.loopexit, %entry
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %21 = add i64 %pgocount6, 1
  store i64 %21, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_mvt(i32 %n, double* nocapture %x1, double* nocapture %x2, double* nocapture readonly %y_1, double* nocapture readonly %y_2, [2000 x double]* nocapture readonly %A) unnamed_addr #2 {
entry:
  %cmp7 = icmp sgt i32 %n, 0
  br i1 %cmp7, label %for.cond1.preheader.us.preheader, label %for.end38

for.cond1.preheader.us.preheader:                 ; preds = %entry
  %xtraiter16 = and i32 %n, 1
  %lcmp.mod17 = icmp eq i32 %xtraiter16, 0
  %0 = icmp eq i32 %n, 1
  %wide.trip.count20 = zext i32 %n to i64
  %wide.trip.count14.1 = zext i32 %n to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc12_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %for.cond1.for.inc12_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  %arrayidx.us = getelementptr inbounds double, double* %x1, i64 %indvars.iv18
  br i1 %lcmp.mod17, label %for.body3.us.prol.loopexit, label %for.body3.us.prol

for.body3.us.prol:                                ; preds = %for.cond1.preheader.us
  %pgocount = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_mvt, i64 0, i64 4)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_mvt, i64 0, i64 4)
  %2 = load double, double* %arrayidx.us, align 8
  %arrayidx7.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv18, i64 0
  %3 = load double, double* %arrayidx7.us.prol, align 8
  %4 = load double, double* %y_1, align 8
  %mul.us.prol = fmul double %3, %4
  %add.us.prol = fadd double %2, %mul.us.prol
  store double %add.us.prol, double* %arrayidx.us, align 8
  br label %for.body3.us.prol.loopexit

for.body3.us.prol.loopexit:                       ; preds = %for.body3.us.prol, %for.cond1.preheader.us
  %indvars.iv12.unr.ph = phi i64 [ 1, %for.body3.us.prol ], [ 0, %for.cond1.preheader.us ]
  br i1 %0, label %for.body3.us.prol.loopexit.for.cond1.for.inc12_crit_edge.us_crit_edge, label %for.body3.us.preheader

for.body3.us.prol.loopexit.for.cond1.for.inc12_crit_edge.us_crit_edge: ; preds = %for.body3.us.prol.loopexit
  %pgocount1 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_mvt, i64 0, i64 2)
  %5 = add i64 %pgocount1, 1
  store i64 %5, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_mvt, i64 0, i64 2)
  br label %for.cond1.for.inc12_crit_edge.us

for.body3.us.preheader:                           ; preds = %for.body3.us.prol.loopexit
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.for.body3.us_crit_edge, %for.body3.us.preheader
  %indvars.iv12 = phi i64 [ %indvars.iv.next13.1, %for.body3.us.for.body3.us_crit_edge ], [ %indvars.iv12.unr.ph, %for.body3.us.preheader ]
  %6 = load double, double* %arrayidx.us, align 8
  %arrayidx7.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv18, i64 %indvars.iv12
  %7 = load double, double* %arrayidx7.us, align 8
  %arrayidx9.us = getelementptr inbounds double, double* %y_1, i64 %indvars.iv12
  %8 = load double, double* %arrayidx9.us, align 8
  %mul.us = fmul double %7, %8
  %add.us = fadd double %6, %mul.us
  store double %add.us, double* %arrayidx.us, align 8
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %arrayidx7.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv18, i64 %indvars.iv.next13
  %9 = load double, double* %arrayidx7.us.1, align 8
  %arrayidx9.us.1 = getelementptr inbounds double, double* %y_1, i64 %indvars.iv.next13
  %10 = load double, double* %arrayidx9.us.1, align 8
  %mul.us.1 = fmul double %9, %10
  %add.us.1 = fadd double %add.us, %mul.us.1
  store double %add.us.1, double* %arrayidx.us, align 8
  %indvars.iv.next13.1 = add nsw i64 %indvars.iv12, 2
  %exitcond15.1 = icmp eq i64 %indvars.iv.next13.1, %wide.trip.count14.1
  br i1 %exitcond15.1, label %for.cond1.for.inc12_crit_edge.us.loopexit, label %for.body3.us.for.body3.us_crit_edge

for.body3.us.for.body3.us_crit_edge:              ; preds = %for.body3.us
  %pgocount2 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_mvt, i64 0, i64 0)
  %11 = add i64 %pgocount2, 1
  store i64 %11, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_mvt, i64 0, i64 0)
  br label %for.body3.us

for.cond1.for.inc12_crit_edge.us.loopexit:        ; preds = %for.body3.us
  %pgocount3 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_mvt, i64 0, i64 5)
  %12 = add i64 %pgocount3, 1
  store i64 %12, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_mvt, i64 0, i64 5)
  br label %for.cond1.for.inc12_crit_edge.us

for.cond1.for.inc12_crit_edge.us:                 ; preds = %for.body3.us.prol.loopexit.for.cond1.for.inc12_crit_edge.us_crit_edge, %for.cond1.for.inc12_crit_edge.us.loopexit
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next19, %wide.trip.count20
  br i1 %exitcond21, label %for.cond15.preheader, label %for.cond1.preheader.us

for.cond15.preheader:                             ; preds = %for.cond1.for.inc12_crit_edge.us
  %pgocount4 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_mvt, i64 0, i64 9)
  %13 = add i64 %pgocount4, 1
  store i64 %13, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_mvt, i64 0, i64 9)
  %cmp163 = icmp sgt i32 %n, 0
  br i1 %cmp163, label %for.cond18.preheader.us.preheader, label %for.end38

for.cond18.preheader.us.preheader:                ; preds = %for.cond15.preheader
  %xtraiter = and i32 %n, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %14 = icmp eq i32 %n, 1
  %wide.trip.count11 = zext i32 %n to i64
  %wide.trip.count.1 = zext i32 %n to i64
  br label %for.cond18.preheader.us

for.cond18.preheader.us:                          ; preds = %for.cond18.for.inc36_crit_edge.us, %for.cond18.preheader.us.preheader
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %for.cond18.for.inc36_crit_edge.us ], [ 0, %for.cond18.preheader.us.preheader ]
  %arrayidx22.us = getelementptr inbounds double, double* %x2, i64 %indvars.iv9
  br i1 %lcmp.mod, label %for.body20.us.prol.loopexit, label %for.body20.us.prol

for.body20.us.prol:                               ; preds = %for.cond18.preheader.us
  %pgocount5 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_mvt, i64 0, i64 6)
  %15 = add i64 %pgocount5, 1
  store i64 %15, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_mvt, i64 0, i64 6)
  %16 = load double, double* %arrayidx22.us, align 8
  %arrayidx26.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv9
  %17 = load double, double* %arrayidx26.us.prol, align 8
  %18 = load double, double* %y_2, align 8
  %mul29.us.prol = fmul double %17, %18
  %add30.us.prol = fadd double %16, %mul29.us.prol
  store double %add30.us.prol, double* %arrayidx22.us, align 8
  br label %for.body20.us.prol.loopexit

for.body20.us.prol.loopexit:                      ; preds = %for.body20.us.prol, %for.cond18.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body20.us.prol ], [ 0, %for.cond18.preheader.us ]
  br i1 %14, label %for.body20.us.prol.loopexit.for.cond18.for.inc36_crit_edge.us_crit_edge, label %for.body20.us.preheader

for.body20.us.prol.loopexit.for.cond18.for.inc36_crit_edge.us_crit_edge: ; preds = %for.body20.us.prol.loopexit
  %pgocount6 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_mvt, i64 0, i64 3)
  %19 = add i64 %pgocount6, 1
  store i64 %19, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_mvt, i64 0, i64 3)
  br label %for.cond18.for.inc36_crit_edge.us

for.body20.us.preheader:                          ; preds = %for.body20.us.prol.loopexit
  br label %for.body20.us

for.body20.us:                                    ; preds = %for.body20.us.for.body20.us_crit_edge, %for.body20.us.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body20.us.for.body20.us_crit_edge ], [ %indvars.iv.unr.ph, %for.body20.us.preheader ]
  %20 = load double, double* %arrayidx22.us, align 8
  %arrayidx26.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv9
  %21 = load double, double* %arrayidx26.us, align 8
  %arrayidx28.us = getelementptr inbounds double, double* %y_2, i64 %indvars.iv
  %22 = load double, double* %arrayidx28.us, align 8
  %mul29.us = fmul double %21, %22
  %add30.us = fadd double %20, %mul29.us
  store double %add30.us, double* %arrayidx22.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx26.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv9
  %23 = load double, double* %arrayidx26.us.1, align 8
  %arrayidx28.us.1 = getelementptr inbounds double, double* %y_2, i64 %indvars.iv.next
  %24 = load double, double* %arrayidx28.us.1, align 8
  %mul29.us.1 = fmul double %23, %24
  %add30.us.1 = fadd double %add30.us, %mul29.us.1
  store double %add30.us.1, double* %arrayidx22.us, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.cond18.for.inc36_crit_edge.us.loopexit, label %for.body20.us.for.body20.us_crit_edge

for.body20.us.for.body20.us_crit_edge:            ; preds = %for.body20.us
  %pgocount7 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_mvt, i64 0, i64 1)
  %25 = add i64 %pgocount7, 1
  store i64 %25, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_mvt, i64 0, i64 1)
  br label %for.body20.us

for.cond18.for.inc36_crit_edge.us.loopexit:       ; preds = %for.body20.us
  %pgocount8 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_mvt, i64 0, i64 7)
  %26 = add i64 %pgocount8, 1
  store i64 %26, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_mvt, i64 0, i64 7)
  br label %for.cond18.for.inc36_crit_edge.us

for.cond18.for.inc36_crit_edge.us:                ; preds = %for.body20.us.prol.loopexit.for.cond18.for.inc36_crit_edge.us_crit_edge, %for.cond18.for.inc36_crit_edge.us.loopexit
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond = icmp eq i64 %indvars.iv.next10, %wide.trip.count11
  br i1 %exitcond, label %for.end38.loopexit, label %for.cond18.preheader.us

for.end38.loopexit:                               ; preds = %for.cond18.for.inc36_crit_edge.us
  %pgocount9 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_mvt, i64 0, i64 10)
  %27 = add i64 %pgocount9, 1
  store i64 %27, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_mvt, i64 0, i64 10)
  br label %for.end38

for.end38:                                        ; preds = %for.end38.loopexit, %for.cond15.preheader, %entry
  %pgocount10 = load i64, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_mvt, i64 0, i64 8)
  %28 = add i64 %pgocount10, 1
  store i64 %28, i64* getelementptr inbounds ([11 x i64], [11 x i64]* @__profc_B.ll_kernel_mvt, i64 0, i64 8)
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* nocapture readonly %x1, double* nocapture readonly %x2) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %cmp6 = icmp sgt i32 %n, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %wide.trip.count10 = zext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %if.end, %for.body.preheader
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %if.end ], [ 0, %for.body.preheader ]
  %3 = trunc i64 %indvars.iv8 to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.body.if.end_crit_edge

for.body.if.end_crit_edge:                        ; preds = %for.body
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  br label %if.end

if.then:                                          ; preds = %for.body
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %5 = add i64 %pgocount1, 1
  store i64 %5, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end

if.end:                                           ; preds = %for.body.if.end_crit_edge, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %x1, i64 %indvars.iv8
  %8 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next9, %wide.trip.count10
  br i1 %exitcond11, label %for.end.loopexit, label %for.body

for.end.loopexit:                                 ; preds = %if.end
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i64 0, i64 5)
  %9 = add i64 %pgocount2, 1
  store i64 %9, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i64 0, i64 5)
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #5
  %cmp84 = icmp sgt i32 %n, 0
  br i1 %cmp84, label %for.body9.preheader, label %for.end20

for.body9.preheader:                              ; preds = %for.end
  %wide.trip.count = zext i32 %n to i64
  br label %for.body9

for.body9:                                        ; preds = %if.end14, %for.body9.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end14 ], [ 0, %for.body9.preheader ]
  %12 = trunc i64 %indvars.iv to i32
  %rem10 = srem i32 %12, 20
  %cmp11 = icmp eq i32 %rem10, 0
  br i1 %cmp11, label %if.then12, label %for.body9.if.end14_crit_edge

for.body9.if.end14_crit_edge:                     ; preds = %for.body9
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %13 = add i64 %pgocount3, 1
  store i64 %13, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  br label %if.end14

if.then12:                                        ; preds = %for.body9
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i64 0, i64 4)
  %14 = add i64 %pgocount4, 1
  store i64 %14, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i64 0, i64 4)
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %if.end14

if.end14:                                         ; preds = %for.body9.if.end14_crit_edge, %if.then12
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds double, double* %x2, i64 %indvars.iv
  %17 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end20.loopexit, label %for.body9

for.end20.loopexit:                               ; preds = %if.end14
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i64 0, i64 6)
  %18 = add i64 %pgocount5, 1
  store i64 %18, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i64 0, i64 6)
  br label %for.end20

for.end20:                                        ; preds = %for.end20.loopexit, %for.end
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %19 = add i64 %pgocount6, 1
  store i64 %19, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #5
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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

; Function Attrs: nounwind
declare void @llvm.instrprof.increment.step(i8*, i64, i32, i32, i64) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
