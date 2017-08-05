; ModuleID = 'B.ll'
source_filename = "3mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"G\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_3mm = private constant [15 x i8] c"B.ll:kernel_3mm"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 32414643582, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [17 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 199883487418, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 17, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_3mm = private global [25 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_3mm = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 7165158374039736084, i64 317953800481, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i32 0, i32 0), i8* null, i8* null, i32 25, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 63976198547, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [55 x i8] c"5\00main\01B.ll:init_array\01B.ll:kernel_3mm\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_3mm to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([55 x i8], [55 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 720000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 800000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 900000, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 990000, i32 8) #4
  %call4 = tail call i8* @polybench_alloc_data(i64 1080000, i32 8) #4
  %call5 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %call6 = tail call i8* @polybench_alloc_data(i64 880000, i32 8) #4
  %arraydecay = bitcast i8* %call1 to [1000 x double]*
  %arraydecay7 = bitcast i8* %call2 to [900 x double]*
  %arraydecay8 = bitcast i8* %call4 to [1200 x double]*
  %arraydecay9 = bitcast i8* %call5 to [1100 x double]*
  tail call fastcc void @init_array(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [1000 x double]* %arraydecay, [900 x double]* %arraydecay7, [1200 x double]* %arraydecay8, [1100 x double]* %arraydecay9)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay10 = bitcast i8* %call to [900 x double]*
  %arraydecay13 = bitcast i8* %call3 to [1100 x double]*
  %arraydecay16 = bitcast i8* %call6 to [1100 x double]*
  tail call fastcc void @kernel_3mm(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [900 x double]* %arraydecay10, [1000 x double]* %arraydecay, [900 x double]* %arraydecay7, [1100 x double]* %arraydecay13, [1200 x double]* %arraydecay8, [1100 x double]* %arraydecay9, [1100 x double]* %arraydecay16)
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
  tail call fastcc void @print_array(i32 800, i32 1100, [1100 x double]* %arraydecay16)
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
  tail call void @free(i8* %call5) #4
  tail call void @free(i8* %call6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %ni, i32 %nj, i32 %nk, i32 %nl, i32 %nm, [1000 x double]* nocapture %A, [900 x double]* nocapture %B, [1200 x double]* nocapture %C, [1100 x double]* nocapture %D) unnamed_addr #2 {
entry:
  %cmp18 = icmp sgt i32 %ni, 0
  br i1 %cmp18, label %for.cond1.preheader.lr.ph, label %for.cond11.preheader

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %pgocount = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  %0 = add i64 %pgocount, 1
  store i64 %0, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  %cmp216 = icmp sgt i32 %nk, 0
  %mul4 = mul nsw i32 %ni, 5
  %conv5 = sitofp i32 %mul4 to double
  br i1 %cmp216, label %for.cond1.preheader.us.preheader, label %for.cond37.preheader

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %wide.trip.count59 = zext i32 %nk to i64
  %wide.trip.count63 = zext i32 %ni to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc8_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %for.cond1.for.inc8_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.for.body3.us_crit_edge, %for.cond1.preheader.us
  %indvars.iv55 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next56, %for.body3.us.for.body3.us_crit_edge ]
  %1 = mul nuw nsw i64 %indvars.iv55, %indvars.iv61
  %2 = add nuw nsw i64 %1, 1
  %3 = trunc i64 %2 to i32
  %rem.us = srem i32 %3, %ni
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv5
  %arrayidx7.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv61, i64 %indvars.iv55
  store double %div.us, double* %arrayidx7.us, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next56, %wide.trip.count59
  br i1 %exitcond60, label %for.cond1.for.inc8_crit_edge.us, label %for.body3.us.for.body3.us_crit_edge

for.body3.us.for.body3.us_crit_edge:              ; preds = %for.body3.us
  %pgocount1 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %4 = add i64 %pgocount1, 1
  store i64 %4, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  br label %for.body3.us

for.cond1.for.inc8_crit_edge.us:                  ; preds = %for.body3.us
  %pgocount2 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %5 = add i64 %pgocount2, 1
  store i64 %5, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next62, %wide.trip.count63
  br i1 %exitcond64, label %for.cond11.preheader.loopexit, label %for.cond1.preheader.us

for.cond11.preheader.loopexit:                    ; preds = %for.cond1.for.inc8_crit_edge.us
  %pgocount3 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 13)
  %6 = add i64 %pgocount3, 1
  store i64 %6, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 13)
  br label %for.cond11.preheader

for.cond11.preheader:                             ; preds = %for.cond11.preheader.loopexit, %entry
  %cmp1213 = icmp sgt i32 %nk, 0
  br i1 %cmp1213, label %for.cond15.preheader.lr.ph, label %for.cond37.preheader

for.cond15.preheader.lr.ph:                       ; preds = %for.cond11.preheader
  %pgocount4 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 12)
  %7 = add i64 %pgocount4, 1
  store i64 %7, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 12)
  %cmp1611 = icmp sgt i32 %nj, 0
  %mul24 = mul nsw i32 %nj, 5
  %conv25 = sitofp i32 %mul24 to double
  br i1 %cmp1611, label %for.cond15.preheader.us.preheader, label %for.cond62.preheader

for.cond15.preheader.us.preheader:                ; preds = %for.cond15.preheader.lr.ph
  %wide.trip.count48 = zext i32 %nj to i64
  %wide.trip.count52 = zext i32 %nk to i64
  br label %for.cond15.preheader.us

for.cond15.preheader.us:                          ; preds = %for.cond15.for.inc34_crit_edge.us, %for.cond15.preheader.us.preheader
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %for.cond15.for.inc34_crit_edge.us ], [ 0, %for.cond15.preheader.us.preheader ]
  br label %for.body18.us

for.body18.us:                                    ; preds = %for.body18.us.for.body18.us_crit_edge, %for.cond15.preheader.us
  %indvars.iv44 = phi i64 [ 0, %for.cond15.preheader.us ], [ %indvars.iv.next45, %for.body18.us.for.body18.us_crit_edge ]
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %8 = mul nuw nsw i64 %indvars.iv.next45, %indvars.iv50
  %9 = add nuw nsw i64 %8, 2
  %10 = trunc i64 %9 to i32
  %rem22.us = srem i32 %10, %nj
  %conv23.us = sitofp i32 %rem22.us to double
  %div26.us = fdiv double %conv23.us, %conv25
  %arrayidx30.us = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv50, i64 %indvars.iv44
  store double %div26.us, double* %arrayidx30.us, align 8
  %exitcond49 = icmp eq i64 %indvars.iv.next45, %wide.trip.count48
  br i1 %exitcond49, label %for.cond15.for.inc34_crit_edge.us, label %for.body18.us.for.body18.us_crit_edge

for.body18.us.for.body18.us_crit_edge:            ; preds = %for.body18.us
  %pgocount5 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %11 = add i64 %pgocount5, 1
  store i64 %11, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  br label %for.body18.us

for.cond15.for.inc34_crit_edge.us:                ; preds = %for.body18.us
  %pgocount6 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %12 = add i64 %pgocount6, 1
  store i64 %12, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next51, %wide.trip.count52
  br i1 %exitcond53, label %for.cond37.preheader.loopexit, label %for.cond15.preheader.us

for.cond37.preheader.loopexit:                    ; preds = %for.cond15.for.inc34_crit_edge.us
  %pgocount7 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 16)
  %13 = add i64 %pgocount7, 1
  store i64 %13, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 16)
  br label %for.cond37.preheader

for.cond37.preheader:                             ; preds = %for.cond37.preheader.loopexit, %for.cond11.preheader, %for.cond1.preheader.lr.ph
  %cmp388 = icmp sgt i32 %nj, 0
  br i1 %cmp388, label %for.cond41.preheader.lr.ph, label %for.cond62.preheader

for.cond41.preheader.lr.ph:                       ; preds = %for.cond37.preheader
  %pgocount8 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 10)
  %14 = add i64 %pgocount8, 1
  store i64 %14, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 10)
  %cmp426 = icmp sgt i32 %nm, 0
  %mul49 = mul nsw i32 %nl, 5
  %conv50 = sitofp i32 %mul49 to double
  br i1 %cmp426, label %for.cond41.preheader.us.preheader, label %for.end87

for.cond41.preheader.us.preheader:                ; preds = %for.cond41.preheader.lr.ph
  %wide.trip.count37 = zext i32 %nm to i64
  %wide.trip.count41 = zext i32 %nj to i64
  br label %for.cond41.preheader.us

for.cond41.preheader.us:                          ; preds = %for.cond41.for.inc59_crit_edge.us, %for.cond41.preheader.us.preheader
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %for.cond41.for.inc59_crit_edge.us ], [ 0, %for.cond41.preheader.us.preheader ]
  br label %for.body44.us

for.body44.us:                                    ; preds = %for.body44.us.for.body44.us_crit_edge, %for.cond41.preheader.us
  %indvars.iv33 = phi i64 [ 0, %for.cond41.preheader.us ], [ %indvars.iv.next34, %for.body44.us.for.body44.us_crit_edge ]
  %15 = add nuw nsw i64 %indvars.iv33, 3
  %16 = mul nuw nsw i64 %15, %indvars.iv39
  %17 = trunc i64 %16 to i32
  %rem47.us = srem i32 %17, %nl
  %conv48.us = sitofp i32 %rem47.us to double
  %div51.us = fdiv double %conv48.us, %conv50
  %arrayidx55.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv39, i64 %indvars.iv33
  store double %div51.us, double* %arrayidx55.us, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next34, %wide.trip.count37
  br i1 %exitcond38, label %for.cond41.for.inc59_crit_edge.us, label %for.body44.us.for.body44.us_crit_edge

for.body44.us.for.body44.us_crit_edge:            ; preds = %for.body44.us
  %pgocount9 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %18 = add i64 %pgocount9, 1
  store i64 %18, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  br label %for.body44.us

for.cond41.for.inc59_crit_edge.us:                ; preds = %for.body44.us
  %pgocount10 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %19 = add i64 %pgocount10, 1
  store i64 %19, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, %wide.trip.count41
  br i1 %exitcond42, label %for.cond62.preheader.loopexit, label %for.cond41.preheader.us

for.cond62.preheader.loopexit:                    ; preds = %for.cond41.for.inc59_crit_edge.us
  %pgocount11 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 14)
  %20 = add i64 %pgocount11, 1
  store i64 %20, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 14)
  br label %for.cond62.preheader

for.cond62.preheader:                             ; preds = %for.cond62.preheader.loopexit, %for.cond37.preheader, %for.cond15.preheader.lr.ph
  %cmp633 = icmp sgt i32 %nm, 0
  br i1 %cmp633, label %for.cond66.preheader.lr.ph, label %for.end87

for.cond66.preheader.lr.ph:                       ; preds = %for.cond62.preheader
  %pgocount12 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 11)
  %21 = add i64 %pgocount12, 1
  store i64 %21, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 11)
  %cmp671 = icmp sgt i32 %nl, 0
  %mul75 = mul nsw i32 %nk, 5
  %conv76 = sitofp i32 %mul75 to double
  br i1 %cmp671, label %for.cond66.preheader.us.preheader, label %for.end87

for.cond66.preheader.us.preheader:                ; preds = %for.cond66.preheader.lr.ph
  %wide.trip.count = zext i32 %nl to i64
  %wide.trip.count30 = zext i32 %nm to i64
  br label %for.cond66.preheader.us

for.cond66.preheader.us:                          ; preds = %for.cond66.for.inc85_crit_edge.us, %for.cond66.preheader.us.preheader
  %indvars.iv28 = phi i64 [ %indvars.iv.next29, %for.cond66.for.inc85_crit_edge.us ], [ 0, %for.cond66.preheader.us.preheader ]
  br label %for.body69.us

for.body69.us:                                    ; preds = %for.body69.us.for.body69.us_crit_edge, %for.cond66.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond66.preheader.us ], [ %indvars.iv.next, %for.body69.us.for.body69.us_crit_edge ]
  %22 = add nuw nsw i64 %indvars.iv, 2
  %23 = mul nuw nsw i64 %22, %indvars.iv28
  %24 = add nuw nsw i64 %23, 2
  %25 = trunc i64 %24 to i32
  %rem73.us = srem i32 %25, %nk
  %conv74.us = sitofp i32 %rem73.us to double
  %div77.us = fdiv double %conv74.us, %conv76
  %arrayidx81.us = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv28, i64 %indvars.iv
  store double %div77.us, double* %arrayidx81.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond66.for.inc85_crit_edge.us, label %for.body69.us.for.body69.us_crit_edge

for.body69.us.for.body69.us_crit_edge:            ; preds = %for.body69.us
  %pgocount13 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %26 = add i64 %pgocount13, 1
  store i64 %26, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  br label %for.body69.us

for.cond66.for.inc85_crit_edge.us:                ; preds = %for.body69.us
  %pgocount14 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %27 = add i64 %pgocount14, 1
  store i64 %27, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next29, %wide.trip.count30
  br i1 %exitcond31, label %for.end87.loopexit, label %for.cond66.preheader.us

for.end87.loopexit:                               ; preds = %for.cond66.for.inc85_crit_edge.us
  %pgocount15 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 15)
  %28 = add i64 %pgocount15, 1
  store i64 %28, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 15)
  br label %for.end87

for.end87:                                        ; preds = %for.end87.loopexit, %for.cond66.preheader.lr.ph, %for.cond62.preheader, %for.cond41.preheader.lr.ph
  %pgocount16 = load i64, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  %29 = add i64 %pgocount16, 1
  store i64 %29, i64* getelementptr inbounds ([17 x i64], [17 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_3mm(i32 %ni, i32 %nj, i32 %nk, i32 %nl, i32 %nm, [900 x double]* nocapture %E, [1000 x double]* nocapture readonly %A, [900 x double]* nocapture readonly %B, [1100 x double]* nocapture %F, [1200 x double]* nocapture readonly %C, [1100 x double]* nocapture readonly %D, [1100 x double]* nocapture %G) unnamed_addr #2 {
entry:
  %cmp57 = icmp sgt i32 %ni, 0
  br i1 %cmp57, label %for.cond1.preheader.lr.ph, label %for.cond27.preheader

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %pgocount = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 20)
  %0 = add i64 %pgocount, 1
  store i64 %0, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 20)
  %cmp255 = icmp sgt i32 %nj, 0
  %cmp753 = icmp sgt i32 %nk, 0
  br i1 %cmp255, label %for.cond1.preheader.us.preheader, label %for.cond66.preheader.lr.ph

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %1 = add i32 %nj, -1
  %2 = zext i32 %1 to i64
  %3 = shl nuw nsw i64 %2, 3
  %4 = add nuw nsw i64 %3, 8
  %wide.trip.count139 = zext i32 %ni to i64
  %xtraiter129 = and i32 %nk, 1
  %lcmp.mod130 = icmp eq i32 %xtraiter129, 0
  %5 = icmp eq i32 %nk, 1
  %wide.trip.count133 = zext i32 %nj to i64
  %wide.trip.count127.1 = zext i32 %nk to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc24_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv137 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next138, %for.cond1.for.inc24_crit_edge.us ]
  br i1 %cmp753, label %for.body3.us.us.preheader, label %for.cond1.for.inc24_crit_edge.us.loopexit83

for.body3.us.us.preheader:                        ; preds = %for.cond1.preheader.us
  %arrayidx12.us.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv137, i64 0
  br label %for.body3.us.us

for.cond1.for.inc24_crit_edge.us.loopexit83:      ; preds = %for.cond1.preheader.us
  %pgocount1 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 17)
  %6 = add i64 %pgocount1, 1
  store i64 %6, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 17)
  %scevgep123 = getelementptr [900 x double], [900 x double]* %E, i64 %indvars.iv137, i64 0
  %scevgep123124 = bitcast double* %scevgep123 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep123124, i8 0, i64 %4, i32 8, i1 false)
  br label %for.cond1.for.inc24_crit_edge.us

for.cond1.for.inc24_crit_edge.us.loopexit:        ; preds = %for.cond6.for.inc21_crit_edge.us.us
  %pgocount2 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 14)
  %7 = add i64 %pgocount2, 1
  store i64 %7, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 14)
  br label %for.cond1.for.inc24_crit_edge.us

for.cond1.for.inc24_crit_edge.us:                 ; preds = %for.cond1.for.inc24_crit_edge.us.loopexit, %for.cond1.for.inc24_crit_edge.us.loopexit83
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %exitcond140 = icmp eq i64 %indvars.iv.next138, %wide.trip.count139
  br i1 %exitcond140, label %for.cond27.preheader.loopexit, label %for.cond1.preheader.us

for.body3.us.us:                                  ; preds = %for.cond6.for.inc21_crit_edge.us.us, %for.body3.us.us.preheader
  %indvars.iv131 = phi i64 [ %indvars.iv.next132, %for.cond6.for.inc21_crit_edge.us.us ], [ 0, %for.body3.us.us.preheader ]
  %arrayidx5.us.us = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv137, i64 %indvars.iv131
  store double 0.000000e+00, double* %arrayidx5.us.us, align 8
  br i1 %lcmp.mod130, label %for.body8.us.us.prol.loopexit, label %for.body8.us.us.prol

for.body8.us.us.prol:                             ; preds = %for.body3.us.us
  %pgocount3 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 9)
  %8 = add i64 %pgocount3, 1
  store i64 %8, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 9)
  %9 = load double, double* %arrayidx12.us.us.prol, align 8
  %arrayidx16.us.us.prol = getelementptr inbounds [900 x double], [900 x double]* %B, i64 0, i64 %indvars.iv131
  %10 = load double, double* %arrayidx16.us.us.prol, align 8
  %mul.us.us.prol = fmul double %9, %10
  %11 = load double, double* %arrayidx5.us.us, align 8
  %add.us.us.prol = fadd double %11, %mul.us.us.prol
  store double %add.us.us.prol, double* %arrayidx5.us.us, align 8
  br label %for.body8.us.us.prol.loopexit

for.body8.us.us.prol.loopexit:                    ; preds = %for.body8.us.us.prol, %for.body3.us.us
  %indvars.iv125.unr.ph = phi i64 [ 1, %for.body8.us.us.prol ], [ 0, %for.body3.us.us ]
  br i1 %5, label %for.body8.us.us.prol.loopexit.for.cond6.for.inc21_crit_edge.us.us_crit_edge, label %for.body8.us.us.preheader

for.body8.us.us.prol.loopexit.for.cond6.for.inc21_crit_edge.us.us_crit_edge: ; preds = %for.body8.us.us.prol.loopexit
  %pgocount4 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 4)
  %12 = add i64 %pgocount4, 1
  store i64 %12, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 4)
  br label %for.cond6.for.inc21_crit_edge.us.us

for.body8.us.us.preheader:                        ; preds = %for.body8.us.us.prol.loopexit
  br label %for.body8.us.us

for.cond6.for.inc21_crit_edge.us.us.loopexit:     ; preds = %for.body8.us.us
  %pgocount5 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 10)
  %13 = add i64 %pgocount5, 1
  store i64 %13, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 10)
  br label %for.cond6.for.inc21_crit_edge.us.us

for.cond6.for.inc21_crit_edge.us.us:              ; preds = %for.body8.us.us.prol.loopexit.for.cond6.for.inc21_crit_edge.us.us_crit_edge, %for.cond6.for.inc21_crit_edge.us.us.loopexit
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1
  %exitcond134 = icmp eq i64 %indvars.iv.next132, %wide.trip.count133
  br i1 %exitcond134, label %for.cond1.for.inc24_crit_edge.us.loopexit, label %for.body3.us.us

for.body8.us.us:                                  ; preds = %for.body8.us.us.for.body8.us.us_crit_edge, %for.body8.us.us.preheader
  %indvars.iv125 = phi i64 [ %indvars.iv.next126.1, %for.body8.us.us.for.body8.us.us_crit_edge ], [ %indvars.iv125.unr.ph, %for.body8.us.us.preheader ]
  %arrayidx12.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv137, i64 %indvars.iv125
  %14 = load double, double* %arrayidx12.us.us, align 8
  %arrayidx16.us.us = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv125, i64 %indvars.iv131
  %15 = load double, double* %arrayidx16.us.us, align 8
  %mul.us.us = fmul double %14, %15
  %16 = load double, double* %arrayidx5.us.us, align 8
  %add.us.us = fadd double %16, %mul.us.us
  store double %add.us.us, double* %arrayidx5.us.us, align 8
  %indvars.iv.next126 = add nuw nsw i64 %indvars.iv125, 1
  %arrayidx12.us.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv137, i64 %indvars.iv.next126
  %17 = load double, double* %arrayidx12.us.us.1, align 8
  %arrayidx16.us.us.1 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv.next126, i64 %indvars.iv131
  %18 = load double, double* %arrayidx16.us.us.1, align 8
  %mul.us.us.1 = fmul double %17, %18
  %19 = load double, double* %arrayidx5.us.us, align 8
  %add.us.us.1 = fadd double %19, %mul.us.us.1
  store double %add.us.us.1, double* %arrayidx5.us.us, align 8
  %indvars.iv.next126.1 = add nsw i64 %indvars.iv125, 2
  %exitcond128.1 = icmp eq i64 %indvars.iv.next126.1, %wide.trip.count127.1
  br i1 %exitcond128.1, label %for.cond6.for.inc21_crit_edge.us.us.loopexit, label %for.body8.us.us.for.body8.us.us_crit_edge

for.body8.us.us.for.body8.us.us_crit_edge:        ; preds = %for.body8.us.us
  %pgocount6 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 1)
  %20 = add i64 %pgocount6, 1
  store i64 %20, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 1)
  br label %for.body8.us.us

for.cond27.preheader.loopexit:                    ; preds = %for.cond1.for.inc24_crit_edge.us
  %pgocount7 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 23)
  %21 = add i64 %pgocount7, 1
  store i64 %21, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 23)
  br label %for.cond27.preheader

for.cond27.preheader:                             ; preds = %for.cond27.preheader.loopexit, %entry
  %cmp2831 = icmp sgt i32 %nj, 0
  br i1 %cmp2831, label %for.cond30.preheader.lr.ph, label %for.cond63.preheader

for.cond30.preheader.lr.ph:                       ; preds = %for.cond27.preheader
  %pgocount8 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 21)
  %22 = add i64 %pgocount8, 1
  store i64 %22, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 21)
  %cmp3129 = icmp sgt i32 %nl, 0
  %cmp3827 = icmp sgt i32 %nm, 0
  br i1 %cmp3129, label %for.cond30.preheader.us.preheader, label %for.cond63.preheader

for.cond30.preheader.us.preheader:                ; preds = %for.cond30.preheader.lr.ph
  %23 = add i32 %nl, -1
  %24 = zext i32 %23 to i64
  %25 = shl nuw nsw i64 %24, 3
  %26 = add nuw nsw i64 %25, 8
  %wide.trip.count116 = zext i32 %nj to i64
  %xtraiter106 = and i32 %nm, 1
  %lcmp.mod107 = icmp eq i32 %xtraiter106, 0
  %27 = icmp eq i32 %nm, 1
  %wide.trip.count110 = zext i32 %nl to i64
  %wide.trip.count104.1 = zext i32 %nm to i64
  br label %for.cond30.preheader.us

for.cond30.preheader.us:                          ; preds = %for.cond30.for.inc60_crit_edge.us, %for.cond30.preheader.us.preheader
  %indvars.iv114 = phi i64 [ 0, %for.cond30.preheader.us.preheader ], [ %indvars.iv.next115, %for.cond30.for.inc60_crit_edge.us ]
  br i1 %cmp3827, label %for.body32.us.us.preheader, label %for.cond30.for.inc60_crit_edge.us.loopexit81

for.body32.us.us.preheader:                       ; preds = %for.cond30.preheader.us
  %arrayidx43.us.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv114, i64 0
  br label %for.body32.us.us

for.cond30.for.inc60_crit_edge.us.loopexit81:     ; preds = %for.cond30.preheader.us
  %pgocount9 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 18)
  %28 = add i64 %pgocount9, 1
  store i64 %28, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 18)
  %scevgep100 = getelementptr [1100 x double], [1100 x double]* %F, i64 %indvars.iv114, i64 0
  %scevgep100101 = bitcast double* %scevgep100 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep100101, i8 0, i64 %26, i32 8, i1 false)
  br label %for.cond30.for.inc60_crit_edge.us

for.cond30.for.inc60_crit_edge.us.loopexit:       ; preds = %for.cond37.for.inc57_crit_edge.us.us
  %pgocount10 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 15)
  %29 = add i64 %pgocount10, 1
  store i64 %29, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 15)
  br label %for.cond30.for.inc60_crit_edge.us

for.cond30.for.inc60_crit_edge.us:                ; preds = %for.cond30.for.inc60_crit_edge.us.loopexit, %for.cond30.for.inc60_crit_edge.us.loopexit81
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %exitcond117 = icmp eq i64 %indvars.iv.next115, %wide.trip.count116
  br i1 %exitcond117, label %for.cond63.preheader.loopexit, label %for.cond30.preheader.us

for.body32.us.us:                                 ; preds = %for.cond37.for.inc57_crit_edge.us.us, %for.body32.us.us.preheader
  %indvars.iv108 = phi i64 [ %indvars.iv.next109, %for.cond37.for.inc57_crit_edge.us.us ], [ 0, %for.body32.us.us.preheader ]
  %arrayidx36.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv114, i64 %indvars.iv108
  store double 0.000000e+00, double* %arrayidx36.us.us, align 8
  br i1 %lcmp.mod107, label %for.body39.us.us.prol.loopexit, label %for.body39.us.us.prol

for.body39.us.us.prol:                            ; preds = %for.body32.us.us
  %pgocount11 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 11)
  %30 = add i64 %pgocount11, 1
  store i64 %30, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 11)
  %31 = load double, double* %arrayidx43.us.us.prol, align 8
  %arrayidx47.us.us.prol = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 0, i64 %indvars.iv108
  %32 = load double, double* %arrayidx47.us.us.prol, align 8
  %mul48.us.us.prol = fmul double %31, %32
  %33 = load double, double* %arrayidx36.us.us, align 8
  %add53.us.us.prol = fadd double %33, %mul48.us.us.prol
  store double %add53.us.us.prol, double* %arrayidx36.us.us, align 8
  br label %for.body39.us.us.prol.loopexit

for.body39.us.us.prol.loopexit:                   ; preds = %for.body39.us.us.prol, %for.body32.us.us
  %indvars.iv102.unr.ph = phi i64 [ 1, %for.body39.us.us.prol ], [ 0, %for.body32.us.us ]
  br i1 %27, label %for.body39.us.us.prol.loopexit.for.cond37.for.inc57_crit_edge.us.us_crit_edge, label %for.body39.us.us.preheader

for.body39.us.us.prol.loopexit.for.cond37.for.inc57_crit_edge.us.us_crit_edge: ; preds = %for.body39.us.us.prol.loopexit
  %pgocount12 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 5)
  %34 = add i64 %pgocount12, 1
  store i64 %34, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 5)
  br label %for.cond37.for.inc57_crit_edge.us.us

for.body39.us.us.preheader:                       ; preds = %for.body39.us.us.prol.loopexit
  br label %for.body39.us.us

for.cond37.for.inc57_crit_edge.us.us.loopexit:    ; preds = %for.body39.us.us
  %pgocount13 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 12)
  %35 = add i64 %pgocount13, 1
  store i64 %35, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 12)
  br label %for.cond37.for.inc57_crit_edge.us.us

for.cond37.for.inc57_crit_edge.us.us:             ; preds = %for.body39.us.us.prol.loopexit.for.cond37.for.inc57_crit_edge.us.us_crit_edge, %for.cond37.for.inc57_crit_edge.us.us.loopexit
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  %exitcond111 = icmp eq i64 %indvars.iv.next109, %wide.trip.count110
  br i1 %exitcond111, label %for.cond30.for.inc60_crit_edge.us.loopexit, label %for.body32.us.us

for.body39.us.us:                                 ; preds = %for.body39.us.us.for.body39.us.us_crit_edge, %for.body39.us.us.preheader
  %indvars.iv102 = phi i64 [ %indvars.iv.next103.1, %for.body39.us.us.for.body39.us.us_crit_edge ], [ %indvars.iv102.unr.ph, %for.body39.us.us.preheader ]
  %arrayidx43.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv114, i64 %indvars.iv102
  %36 = load double, double* %arrayidx43.us.us, align 8
  %arrayidx47.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv102, i64 %indvars.iv108
  %37 = load double, double* %arrayidx47.us.us, align 8
  %mul48.us.us = fmul double %36, %37
  %38 = load double, double* %arrayidx36.us.us, align 8
  %add53.us.us = fadd double %38, %mul48.us.us
  store double %add53.us.us, double* %arrayidx36.us.us, align 8
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv102, 1
  %arrayidx43.us.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv114, i64 %indvars.iv.next103
  %39 = load double, double* %arrayidx43.us.us.1, align 8
  %arrayidx47.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv.next103, i64 %indvars.iv108
  %40 = load double, double* %arrayidx47.us.us.1, align 8
  %mul48.us.us.1 = fmul double %39, %40
  %41 = load double, double* %arrayidx36.us.us, align 8
  %add53.us.us.1 = fadd double %41, %mul48.us.us.1
  store double %add53.us.us.1, double* %arrayidx36.us.us, align 8
  %indvars.iv.next103.1 = add nsw i64 %indvars.iv102, 2
  %exitcond105.1 = icmp eq i64 %indvars.iv.next103.1, %wide.trip.count104.1
  br i1 %exitcond105.1, label %for.cond37.for.inc57_crit_edge.us.us.loopexit, label %for.body39.us.us.for.body39.us.us_crit_edge

for.body39.us.us.for.body39.us.us_crit_edge:      ; preds = %for.body39.us.us
  %pgocount14 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 2)
  %42 = add i64 %pgocount14, 1
  store i64 %42, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 2)
  br label %for.body39.us.us

for.cond63.preheader.loopexit:                    ; preds = %for.cond30.for.inc60_crit_edge.us
  %pgocount15 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 24)
  %43 = add i64 %pgocount15, 1
  store i64 %43, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 24)
  br label %for.cond63.preheader

for.cond63.preheader:                             ; preds = %for.cond63.preheader.loopexit, %for.cond30.preheader.lr.ph, %for.cond27.preheader
  %cmp645 = icmp sgt i32 %ni, 0
  br i1 %cmp645, label %for.cond66.preheader.lr.ph, label %for.end98

for.cond66.preheader.lr.ph:                       ; preds = %for.cond63.preheader, %for.cond1.preheader.lr.ph
  %cmp673 = icmp sgt i32 %nl, 0
  %cmp741 = icmp sgt i32 %nj, 0
  br i1 %cmp673, label %for.cond66.preheader.us.preheader, label %for.cond66.preheader.lr.ph.for.end98_crit_edge

for.cond66.preheader.lr.ph.for.end98_crit_edge:   ; preds = %for.cond66.preheader.lr.ph
  %pgocount16 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 6)
  %44 = add i64 %pgocount16, 1
  store i64 %44, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 6)
  br label %for.end98

for.cond66.preheader.us.preheader:                ; preds = %for.cond66.preheader.lr.ph
  %45 = add i32 %nl, -1
  %46 = zext i32 %45 to i64
  %47 = shl nuw nsw i64 %46, 3
  %48 = add nuw nsw i64 %47, 8
  %wide.trip.count93 = zext i32 %ni to i64
  %xtraiter = and i32 %nj, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %49 = icmp eq i32 %nj, 1
  %wide.trip.count88 = zext i32 %nl to i64
  %wide.trip.count.1 = zext i32 %nj to i64
  br label %for.cond66.preheader.us

for.cond66.preheader.us:                          ; preds = %for.cond66.for.inc96_crit_edge.us, %for.cond66.preheader.us.preheader
  %indvars.iv91 = phi i64 [ 0, %for.cond66.preheader.us.preheader ], [ %indvars.iv.next92, %for.cond66.for.inc96_crit_edge.us ]
  br i1 %cmp741, label %for.body68.us.us.preheader, label %for.cond66.for.inc96_crit_edge.us.loopexit79

for.body68.us.us.preheader:                       ; preds = %for.cond66.preheader.us
  %arrayidx79.us.us.prol = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv91, i64 0
  br label %for.body68.us.us

for.cond66.for.inc96_crit_edge.us.loopexit79:     ; preds = %for.cond66.preheader.us
  %pgocount17 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 16)
  %50 = add i64 %pgocount17, 1
  store i64 %50, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 16)
  %scevgep = getelementptr [1100 x double], [1100 x double]* %G, i64 %indvars.iv91, i64 0
  %scevgep85 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep85, i8 0, i64 %48, i32 8, i1 false)
  br label %for.cond66.for.inc96_crit_edge.us

for.cond66.for.inc96_crit_edge.us.loopexit:       ; preds = %for.cond73.for.inc93_crit_edge.us.us
  %pgocount18 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 13)
  %51 = add i64 %pgocount18, 1
  store i64 %51, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 13)
  br label %for.cond66.for.inc96_crit_edge.us

for.cond66.for.inc96_crit_edge.us:                ; preds = %for.cond66.for.inc96_crit_edge.us.loopexit, %for.cond66.for.inc96_crit_edge.us.loopexit79
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %exitcond94 = icmp eq i64 %indvars.iv.next92, %wide.trip.count93
  br i1 %exitcond94, label %for.end98.loopexit, label %for.cond66.preheader.us

for.body68.us.us:                                 ; preds = %for.cond73.for.inc93_crit_edge.us.us, %for.body68.us.us.preheader
  %indvars.iv86 = phi i64 [ %indvars.iv.next87, %for.cond73.for.inc93_crit_edge.us.us ], [ 0, %for.body68.us.us.preheader ]
  %arrayidx72.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %G, i64 %indvars.iv91, i64 %indvars.iv86
  store double 0.000000e+00, double* %arrayidx72.us.us, align 8
  br i1 %lcmp.mod, label %for.body75.us.us.prol.loopexit, label %for.body75.us.us.prol

for.body75.us.us.prol:                            ; preds = %for.body68.us.us
  %pgocount19 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 7)
  %52 = add i64 %pgocount19, 1
  store i64 %52, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 7)
  %53 = load double, double* %arrayidx79.us.us.prol, align 8
  %arrayidx83.us.us.prol = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 0, i64 %indvars.iv86
  %54 = load double, double* %arrayidx83.us.us.prol, align 8
  %mul84.us.us.prol = fmul double %53, %54
  %55 = load double, double* %arrayidx72.us.us, align 8
  %add89.us.us.prol = fadd double %55, %mul84.us.us.prol
  store double %add89.us.us.prol, double* %arrayidx72.us.us, align 8
  br label %for.body75.us.us.prol.loopexit

for.body75.us.us.prol.loopexit:                   ; preds = %for.body75.us.us.prol, %for.body68.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body75.us.us.prol ], [ 0, %for.body68.us.us ]
  br i1 %49, label %for.body75.us.us.prol.loopexit.for.cond73.for.inc93_crit_edge.us.us_crit_edge, label %for.body75.us.us.preheader

for.body75.us.us.prol.loopexit.for.cond73.for.inc93_crit_edge.us.us_crit_edge: ; preds = %for.body75.us.us.prol.loopexit
  %pgocount20 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 3)
  %56 = add i64 %pgocount20, 1
  store i64 %56, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 3)
  br label %for.cond73.for.inc93_crit_edge.us.us

for.body75.us.us.preheader:                       ; preds = %for.body75.us.us.prol.loopexit
  br label %for.body75.us.us

for.cond73.for.inc93_crit_edge.us.us.loopexit:    ; preds = %for.body75.us.us
  %pgocount21 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 8)
  %57 = add i64 %pgocount21, 1
  store i64 %57, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 8)
  br label %for.cond73.for.inc93_crit_edge.us.us

for.cond73.for.inc93_crit_edge.us.us:             ; preds = %for.body75.us.us.prol.loopexit.for.cond73.for.inc93_crit_edge.us.us_crit_edge, %for.cond73.for.inc93_crit_edge.us.us.loopexit
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86, 1
  %exitcond = icmp eq i64 %indvars.iv.next87, %wide.trip.count88
  br i1 %exitcond, label %for.cond66.for.inc96_crit_edge.us.loopexit, label %for.body68.us.us

for.body75.us.us:                                 ; preds = %for.body75.us.us.for.body75.us.us_crit_edge, %for.body75.us.us.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body75.us.us.for.body75.us.us_crit_edge ], [ %indvars.iv.unr.ph, %for.body75.us.us.preheader ]
  %arrayidx79.us.us = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv91, i64 %indvars.iv
  %58 = load double, double* %arrayidx79.us.us, align 8
  %arrayidx83.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv, i64 %indvars.iv86
  %59 = load double, double* %arrayidx83.us.us, align 8
  %mul84.us.us = fmul double %58, %59
  %60 = load double, double* %arrayidx72.us.us, align 8
  %add89.us.us = fadd double %60, %mul84.us.us
  store double %add89.us.us, double* %arrayidx72.us.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx79.us.us.1 = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv91, i64 %indvars.iv.next
  %61 = load double, double* %arrayidx79.us.us.1, align 8
  %arrayidx83.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv.next, i64 %indvars.iv86
  %62 = load double, double* %arrayidx83.us.us.1, align 8
  %mul84.us.us.1 = fmul double %61, %62
  %63 = load double, double* %arrayidx72.us.us, align 8
  %add89.us.us.1 = fadd double %63, %mul84.us.us.1
  store double %add89.us.us.1, double* %arrayidx72.us.us, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.cond73.for.inc93_crit_edge.us.us.loopexit, label %for.body75.us.us.for.body75.us.us_crit_edge

for.body75.us.us.for.body75.us.us_crit_edge:      ; preds = %for.body75.us.us
  %pgocount22 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 0)
  %64 = add i64 %pgocount22, 1
  store i64 %64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 0)
  br label %for.body75.us.us

for.end98.loopexit:                               ; preds = %for.cond66.for.inc96_crit_edge.us
  %pgocount23 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 22)
  %65 = add i64 %pgocount23, 1
  store i64 %65, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 22)
  br label %for.end98

for.end98:                                        ; preds = %for.cond66.preheader.lr.ph.for.end98_crit_edge, %for.end98.loopexit, %for.cond63.preheader
  %pgocount24 = load i64, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 19)
  %66 = add i64 %pgocount24, 1
  store i64 %66, i64* getelementptr inbounds ([25 x i64], [25 x i64]* @__profc_B.ll_kernel_3mm, i64 0, i64 19)
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %ni, i32 %nl, [1100 x double]* nocapture readonly %G) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp4 = icmp sgt i32 %ni, 0
  %cmp31 = icmp sgt i32 %nl, 0
  %or.cond = and i1 %cmp4, %cmp31
  br i1 %or.cond, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %ni to i64
  %wide.trip.count = zext i32 %nl to i64
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
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %9) #6
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us.if.end.us_crit_edge, %if.then.us
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1100 x double], [1100 x double]* %G, i64 %indvars.iv8, i64 %indvars.iv
  %11 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %11) #6
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
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %16) #6
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
