; ModuleID = 'B.ll'
source_filename = "bicg.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"s\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_bicg = private constant [16 x i8] c"B.ll:kernel_bicg"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 32414643582, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [14 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 171516025331, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 14, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_bicg = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_bicg = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 4464262574321485026, i64 74813467348, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_bicg, i32 0, i32 0), i8* null, i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 89896666006, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [56 x i8] c"6\00main\01B.ll:init_array\01B.ll:kernel_bicg\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_bicg to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([56 x i8], [56 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %call4 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %arraydecay = bitcast i8* %call to [1900 x double]*
  %arraydecay5 = bitcast i8* %call4 to double*
  %arraydecay6 = bitcast i8* %call3 to double*
  tail call fastcc void @init_array(i32 1900, i32 2100, [1900 x double]* %arraydecay, double* %arraydecay5, double* %arraydecay6)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay8 = bitcast i8* %call1 to double*
  %arraydecay9 = bitcast i8* %call2 to double*
  tail call fastcc void @kernel_bicg(i32 1900, i32 2100, [1900 x double]* %arraydecay, double* %arraydecay8, double* %arraydecay9, double* %arraydecay6, double* %arraydecay5)
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
  tail call fastcc void @print_array(i32 1900, i32 2100, double* %arraydecay8, double* %arraydecay9)
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
define internal fastcc void @init_array(i32 %m, i32 %n, [1900 x double]* nocapture %A, double* nocapture %r, double* nocapture %p) unnamed_addr #2 {
entry:
  %cmp6 = icmp sgt i32 %m, 0
  br i1 %cmp6, label %for.body.lr.ph, label %for.cond2.preheader

for.body.lr.ph:                                   ; preds = %entry
  %pgocount = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %0 = add i64 %pgocount, 1
  store i64 %0, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %conv1 = sitofp i32 %m to double
  %xtraiter23 = and i32 %m, 1
  %lcmp.mod24 = icmp eq i32 %xtraiter23, 0
  br i1 %lcmp.mod24, label %for.body.prol.loopexit, label %for.body.prol

for.body.prol:                                    ; preds = %for.body.lr.ph
  %pgocount1 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  %1 = add i64 %pgocount1, 1
  store i64 %1, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  %div.prol = fdiv double 0.000000e+00, %conv1
  store double %div.prol, double* %p, align 8
  br label %for.body.prol.loopexit

for.body.prol.loopexit:                           ; preds = %for.body.prol, %for.body.lr.ph
  %indvars.iv19.unr = phi i64 [ 0, %for.body.lr.ph ], [ 1, %for.body.prol ]
  %2 = icmp eq i32 %m, 1
  br i1 %2, label %for.cond2.preheader, label %for.body.preheader

for.body.preheader:                               ; preds = %for.body.prol.loopexit
  %wide.trip.count21.1 = zext i32 %m to i64
  br label %for.body

for.cond2.preheader.loopexit:                     ; preds = %for.body
  %pgocount2 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 10)
  %3 = add i64 %pgocount2, 1
  store i64 %3, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 10)
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.cond2.preheader.loopexit, %for.body.prol.loopexit, %entry
  %cmp33 = icmp sgt i32 %n, 0
  br i1 %cmp33, label %for.body5.lr.ph, label %for.end29

for.body5.lr.ph:                                  ; preds = %for.cond2.preheader
  %conv8 = sitofp i32 %n to double
  %cmp131 = icmp sgt i32 %m, 0
  br i1 %cmp131, label %for.body5.us.preheader, label %for.body5.preheader

for.body5.us.preheader:                           ; preds = %for.body5.lr.ph
  %xtraiter = and i32 %m, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %4 = icmp eq i32 %m, 1
  %wide.trip.count12 = zext i32 %n to i64
  %wide.trip.count.1 = zext i32 %m to i64
  br label %for.body5.us

for.body5.preheader:                              ; preds = %for.body5.lr.ph
  %pgocount3 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 11)
  %5 = add i64 %pgocount3, 1
  store i64 %5, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 11)
  %xtraiter17 = and i32 %n, 1
  %lcmp.mod18 = icmp eq i32 %xtraiter17, 0
  br i1 %lcmp.mod18, label %for.body5.prol.loopexit, label %for.body5.prol

for.body5.prol:                                   ; preds = %for.body5.preheader
  %pgocount4 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 12)
  %6 = add i64 %pgocount4, 1
  store i64 %6, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 12)
  %div9.prol = fdiv double 0.000000e+00, %conv8
  store double %div9.prol, double* %r, align 8
  br label %for.body5.prol.loopexit

for.body5.prol.loopexit:                          ; preds = %for.body5.prol, %for.body5.preheader
  %indvars.iv13.unr = phi i64 [ 0, %for.body5.preheader ], [ 1, %for.body5.prol ]
  %7 = icmp eq i32 %n, 1
  br i1 %7, label %for.end29, label %for.body5.preheader25

for.body5.preheader25:                            ; preds = %for.body5.prol.loopexit
  %wide.trip.count15.1 = zext i32 %n to i64
  br label %for.body5

for.body5.us:                                     ; preds = %for.cond12.for.inc27_crit_edge.us, %for.body5.us.preheader
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %for.cond12.for.inc27_crit_edge.us ], [ 0, %for.body5.us.preheader ]
  %8 = trunc i64 %indvars.iv10 to i32
  %conv7.us = sitofp i32 %8 to double
  %div9.us = fdiv double %conv7.us, %conv8
  %arrayidx11.us = getelementptr inbounds double, double* %r, i64 %indvars.iv10
  store double %div9.us, double* %arrayidx11.us, align 8
  br i1 %lcmp.mod, label %for.body15.us.prol.loopexit, label %for.body15.us.prol

for.body15.us.prol:                               ; preds = %for.body5.us
  %pgocount5 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %9 = add i64 %pgocount5, 1
  store i64 %9, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %10 = trunc i64 %indvars.iv10 to i32
  %rem16.us.prol = srem i32 %10, %n
  %conv17.us.prol = sitofp i32 %rem16.us.prol to double
  %div19.us.prol = fdiv double %conv17.us.prol, %conv8
  %arrayidx23.us.prol = getelementptr inbounds [1900 x double], [1900 x double]* %A, i64 %indvars.iv10, i64 0
  store double %div19.us.prol, double* %arrayidx23.us.prol, align 8
  br label %for.body15.us.prol.loopexit

for.body15.us.prol.loopexit:                      ; preds = %for.body15.us.prol, %for.body5.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body15.us.prol ], [ 0, %for.body5.us ]
  br i1 %4, label %for.body15.us.prol.loopexit.for.cond12.for.inc27_crit_edge.us_crit_edge, label %for.body15.us.preheader

for.body15.us.prol.loopexit.for.cond12.for.inc27_crit_edge.us_crit_edge: ; preds = %for.body15.us.prol.loopexit
  %pgocount6 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %11 = add i64 %pgocount6, 1
  store i64 %11, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  br label %for.cond12.for.inc27_crit_edge.us

for.body15.us.preheader:                          ; preds = %for.body15.us.prol.loopexit
  br label %for.body15.us

for.body15.us:                                    ; preds = %for.body15.us.for.body15.us_crit_edge, %for.body15.us.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body15.us.for.body15.us_crit_edge ], [ %indvars.iv.unr.ph, %for.body15.us.preheader ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %12 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv10
  %13 = trunc i64 %12 to i32
  %rem16.us = srem i32 %13, %n
  %conv17.us = sitofp i32 %rem16.us to double
  %div19.us = fdiv double %conv17.us, %conv8
  %arrayidx23.us = getelementptr inbounds [1900 x double], [1900 x double]* %A, i64 %indvars.iv10, i64 %indvars.iv
  store double %div19.us, double* %arrayidx23.us, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %14 = mul nuw nsw i64 %indvars.iv.next.1, %indvars.iv10
  %15 = trunc i64 %14 to i32
  %rem16.us.1 = srem i32 %15, %n
  %conv17.us.1 = sitofp i32 %rem16.us.1 to double
  %div19.us.1 = fdiv double %conv17.us.1, %conv8
  %arrayidx23.us.1 = getelementptr inbounds [1900 x double], [1900 x double]* %A, i64 %indvars.iv10, i64 %indvars.iv.next
  store double %div19.us.1, double* %arrayidx23.us.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.cond12.for.inc27_crit_edge.us.loopexit, label %for.body15.us.for.body15.us_crit_edge

for.body15.us.for.body15.us_crit_edge:            ; preds = %for.body15.us
  %pgocount7 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %16 = add i64 %pgocount7, 1
  store i64 %16, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  br label %for.body15.us

for.cond12.for.inc27_crit_edge.us.loopexit:       ; preds = %for.body15.us
  %pgocount8 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %17 = add i64 %pgocount8, 1
  store i64 %17, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  br label %for.cond12.for.inc27_crit_edge.us

for.cond12.for.inc27_crit_edge.us:                ; preds = %for.body15.us.prol.loopexit.for.cond12.for.inc27_crit_edge.us_crit_edge, %for.cond12.for.inc27_crit_edge.us.loopexit
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond = icmp eq i64 %indvars.iv.next11, %wide.trip.count12
  br i1 %exitcond, label %for.end29.loopexit, label %for.body5.us

for.body:                                         ; preds = %for.body.for.body_crit_edge, %for.body.preheader
  %indvars.iv19 = phi i64 [ %indvars.iv.next20.1, %for.body.for.body_crit_edge ], [ %indvars.iv19.unr, %for.body.preheader ]
  %18 = trunc i64 %indvars.iv19 to i32
  %conv = sitofp i32 %18 to double
  %div = fdiv double %conv, %conv1
  %arrayidx = getelementptr inbounds double, double* %p, i64 %indvars.iv19
  store double %div, double* %arrayidx, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %19 = trunc i64 %indvars.iv.next20 to i32
  %conv.1 = sitofp i32 %19 to double
  %div.1 = fdiv double %conv.1, %conv1
  %arrayidx.1 = getelementptr inbounds double, double* %p, i64 %indvars.iv.next20
  store double %div.1, double* %arrayidx.1, align 8
  %indvars.iv.next20.1 = add nsw i64 %indvars.iv19, 2
  %exitcond22.1 = icmp eq i64 %indvars.iv.next20.1, %wide.trip.count21.1
  br i1 %exitcond22.1, label %for.cond2.preheader.loopexit, label %for.body.for.body_crit_edge

for.body.for.body_crit_edge:                      ; preds = %for.body
  %pgocount9 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %20 = add i64 %pgocount9, 1
  store i64 %20, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  br label %for.body

for.body5:                                        ; preds = %for.body5.for.body5_crit_edge, %for.body5.preheader25
  %indvars.iv13 = phi i64 [ %indvars.iv.next14.1, %for.body5.for.body5_crit_edge ], [ %indvars.iv13.unr, %for.body5.preheader25 ]
  %21 = trunc i64 %indvars.iv13 to i32
  %conv7 = sitofp i32 %21 to double
  %div9 = fdiv double %conv7, %conv8
  %arrayidx11 = getelementptr inbounds double, double* %r, i64 %indvars.iv13
  store double %div9, double* %arrayidx11, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %22 = trunc i64 %indvars.iv.next14 to i32
  %conv7.1 = sitofp i32 %22 to double
  %div9.1 = fdiv double %conv7.1, %conv8
  %arrayidx11.1 = getelementptr inbounds double, double* %r, i64 %indvars.iv.next14
  store double %div9.1, double* %arrayidx11.1, align 8
  %indvars.iv.next14.1 = add nsw i64 %indvars.iv13, 2
  %exitcond16.1 = icmp eq i64 %indvars.iv.next14.1, %wide.trip.count15.1
  br i1 %exitcond16.1, label %for.end29.loopexit28, label %for.body5.for.body5_crit_edge

for.body5.for.body5_crit_edge:                    ; preds = %for.body5
  %pgocount10 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %23 = add i64 %pgocount10, 1
  store i64 %23, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  br label %for.body5

for.end29.loopexit:                               ; preds = %for.cond12.for.inc27_crit_edge.us
  %pgocount11 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  %24 = add i64 %pgocount11, 1
  store i64 %24, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  br label %for.end29

for.end29.loopexit28:                             ; preds = %for.body5
  %pgocount12 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 13)
  %25 = add i64 %pgocount12, 1
  store i64 %25, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 13)
  br label %for.end29

for.end29:                                        ; preds = %for.end29.loopexit28, %for.end29.loopexit, %for.body5.prol.loopexit, %for.cond2.preheader
  %pgocount13 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %26 = add i64 %pgocount13, 1
  store i64 %26, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_bicg(i32 %m, i32 %n, [1900 x double]* nocapture readonly %A, double* nocapture %s, double* nocapture %q, double* nocapture readonly %p, double* nocapture readonly %r) unnamed_addr #2 {
entry:
  %q17 = bitcast double* %q to i8*
  %cmp5 = icmp sgt i32 %m, 0
  br i1 %cmp5, label %for.cond1.preheader.loopexit, label %for.cond1.preheader

for.cond1.preheader.loopexit:                     ; preds = %entry
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_bicg, i64 0, i64 3)
  %0 = add i64 %pgocount, 1
  store i64 %0, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_bicg, i64 0, i64 3)
  %s22 = bitcast double* %s to i8*
  %1 = add i32 %m, -1
  %2 = zext i32 %1 to i64
  %3 = shl nuw nsw i64 %2, 3
  %4 = add nuw nsw i64 %3, 8
  call void @llvm.memset.p0i8.i64(i8* %s22, i8 0, i64 %4, i32 8, i1 false)
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.loopexit, %entry
  %cmp23 = icmp sgt i32 %n, 0
  br i1 %cmp23, label %for.body3.lr.ph, label %for.end36

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  %cmp71 = icmp sgt i32 %m, 0
  br i1 %cmp71, label %for.body3.us.preheader, label %for.end36.loopexit7

for.body3.us.preheader:                           ; preds = %for.body3.lr.ph
  %wide.trip.count = zext i32 %m to i64
  %wide.trip.count10 = zext i32 %n to i64
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.cond6.for.inc34_crit_edge.us, %for.body3.us.preheader
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %for.cond6.for.inc34_crit_edge.us ], [ 0, %for.body3.us.preheader ]
  %arrayidx5.us = getelementptr inbounds double, double* %q, i64 %indvars.iv8
  store double 0.000000e+00, double* %arrayidx5.us, align 8
  %arrayidx12.us = getelementptr inbounds double, double* %r, i64 %indvars.iv8
  br label %for.body8.us

for.body8.us:                                     ; preds = %for.body8.us.for.body8.us_crit_edge, %for.body3.us
  %indvars.iv = phi i64 [ 0, %for.body3.us ], [ %indvars.iv.next, %for.body8.us.for.body8.us_crit_edge ]
  %arrayidx10.us = getelementptr inbounds double, double* %s, i64 %indvars.iv
  %5 = load double, double* %arrayidx10.us, align 8
  %6 = load double, double* %arrayidx12.us, align 8
  %arrayidx16.us = getelementptr inbounds [1900 x double], [1900 x double]* %A, i64 %indvars.iv8, i64 %indvars.iv
  %7 = load double, double* %arrayidx16.us, align 8
  %mul.us = fmul double %6, %7
  %add.us = fadd double %5, %mul.us
  store double %add.us, double* %arrayidx10.us, align 8
  %8 = load double, double* %arrayidx5.us, align 8
  %9 = load double, double* %arrayidx16.us, align 8
  %arrayidx26.us = getelementptr inbounds double, double* %p, i64 %indvars.iv
  %10 = load double, double* %arrayidx26.us, align 8
  %mul27.us = fmul double %9, %10
  %add28.us = fadd double %8, %mul27.us
  store double %add28.us, double* %arrayidx5.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond6.for.inc34_crit_edge.us, label %for.body8.us.for.body8.us_crit_edge

for.body8.us.for.body8.us_crit_edge:              ; preds = %for.body8.us
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_bicg, i64 0, i64 0)
  %11 = add i64 %pgocount1, 1
  store i64 %11, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_bicg, i64 0, i64 0)
  br label %for.body8.us

for.cond6.for.inc34_crit_edge.us:                 ; preds = %for.body8.us
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_bicg, i64 0, i64 1)
  %12 = add i64 %pgocount2, 1
  store i64 %12, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_bicg, i64 0, i64 1)
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next9, %wide.trip.count10
  br i1 %exitcond11, label %for.end36.loopexit, label %for.body3.us

for.end36.loopexit7:                              ; preds = %for.body3.lr.ph
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_bicg, i64 0, i64 5)
  %13 = add i64 %pgocount3, 1
  store i64 %13, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_bicg, i64 0, i64 5)
  %14 = add i32 %n, -1
  %15 = zext i32 %14 to i64
  %16 = shl nuw nsw i64 %15, 3
  %17 = add nuw nsw i64 %16, 8
  call void @llvm.memset.p0i8.i64(i8* %q17, i8 0, i64 %17, i32 8, i1 false)
  br label %for.end36

for.end36.loopexit:                               ; preds = %for.cond6.for.inc34_crit_edge.us
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_bicg, i64 0, i64 4)
  %18 = add i64 %pgocount4, 1
  store i64 %18, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_bicg, i64 0, i64 4)
  br label %for.end36

for.end36:                                        ; preds = %for.end36.loopexit, %for.end36.loopexit7, %for.cond1.preheader
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_bicg, i64 0, i64 2)
  %19 = add i64 %pgocount5, 1
  store i64 %19, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_kernel_bicg, i64 0, i64 2)
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %m, i32 %n, double* nocapture readonly %s, double* nocapture readonly %q) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp6 = icmp sgt i32 %m, 0
  br i1 %cmp6, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %wide.trip.count10 = zext i32 %m to i64
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
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %if.end

if.end:                                           ; preds = %for.body.if.end_crit_edge, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %s, i64 %indvars.iv8
  %8 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
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
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
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
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #6
  br label %if.end14

if.end14:                                         ; preds = %for.body9.if.end14_crit_edge, %if.then12
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds double, double* %q, i64 %indvars.iv
  %17 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
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
  %call21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #6
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
