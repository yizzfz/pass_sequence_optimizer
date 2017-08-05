; ModuleID = 'B.ll'
source_filename = "cholesky.c"
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
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_cholesky = private constant [20 x i8] c"B.ll:kernel_cholesky"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 32414643582, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [24 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 300420118271, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 24, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_cholesky = private global [15 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_cholesky = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4245200372997964226, i64 184785218454, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i32 0, i32 0), i8* null, i8* null, i32 15, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 63976198547, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [60 x i8] c":\00main\01B.ll:init_array\01B.ll:kernel_cholesky\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_cholesky to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([60 x i8], [60 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %arraydecay = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_cholesky(i32 2000, [2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
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
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %3 = add i64 %pgocount2, 1
  store i64 %3, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  tail call void @free(i8* %call) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* nocapture %A) unnamed_addr #0 {
entry:
  %cmp40 = icmp sgt i32 %n, 0
  br i1 %cmp40, label %for.cond1.preheader.lr.ph, label %for.end25.thread

for.end25.thread:                                 ; preds = %entry
  %pgocount = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 17)
  %0 = add i64 %pgocount, 1
  store i64 %0, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 17)
  %call93 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %for.end99

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %pgocount1 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 15)
  %1 = add i64 %pgocount1, 1
  store i64 %1, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 15)
  %conv4 = sitofp i32 %n to double
  %2 = add i32 %n, -2
  %3 = zext i32 %2 to i64
  %4 = sext i32 %n to i64
  %wide.trip.count91 = zext i32 %n to i64
  br label %for.body3.lr.ph

for.body3.lr.ph:                                  ; preds = %for.end18, %for.cond1.preheader.lr.ph
  %indvars.iv89 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next90, %for.end18 ]
  %indvars.iv87 = phi i64 [ 1, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next88, %for.end18 ]
  %5 = mul nuw nsw i64 %indvars.iv89, 2001
  %6 = add nuw nsw i64 %5, 1
  %scevgep85 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %6
  %scevgep8586 = bitcast double* %scevgep85 to i8*
  %7 = sub i64 %3, %indvars.iv89
  %8 = shl i64 %7, 3
  %9 = and i64 %8, 34359738360
  %10 = add nuw nsw i64 %9, 8
  br label %for.body3

for.cond8.preheader:                              ; preds = %for.body3
  %pgocount2 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 10)
  %11 = add i64 %pgocount2, 1
  store i64 %11, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 10)
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %cmp938 = icmp slt i64 %indvars.iv.next90, %4
  br i1 %cmp938, label %for.end18.loopexit, label %for.end18

for.body3:                                        ; preds = %for.body3.for.body3_crit_edge, %for.body3.lr.ph
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %for.body3.for.body3_crit_edge ], [ 0, %for.body3.lr.ph ]
  %12 = sub nsw i64 0, %indvars.iv72
  %13 = trunc i64 %12 to i32
  %rem = srem i32 %13, %n
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, %conv4
  %add = fadd double %div, 1.000000e+00
  %arrayidx6 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv89, i64 %indvars.iv72
  store double %add, double* %arrayidx6, align 8
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond78 = icmp eq i64 %indvars.iv.next73, %indvars.iv87
  br i1 %exitcond78, label %for.cond8.preheader, label %for.body3.for.body3_crit_edge

for.body3.for.body3_crit_edge:                    ; preds = %for.body3
  %pgocount3 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %14 = add i64 %pgocount3, 1
  store i64 %14, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  br label %for.body3

for.end18.loopexit:                               ; preds = %for.cond8.preheader
  %pgocount4 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 12)
  %15 = add i64 %pgocount4, 1
  store i64 %15, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 12)
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep8586, i8 0, i64 %10, i32 8, i1 false)
  br label %for.end18

for.end18:                                        ; preds = %for.end18.loopexit, %for.cond8.preheader
  %arrayidx22 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv89, i64 %indvars.iv89
  store double 1.000000e+00, double* %arrayidx22, align 8
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  %exitcond92 = icmp eq i64 %indvars.iv.next90, %wide.trip.count91
  br i1 %exitcond92, label %for.end25, label %for.body3.lr.ph

for.end25:                                        ; preds = %for.end18
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %16 = bitcast i8* %call to [2000 x [2000 x double]]*
  %cmp2733 = icmp sgt i32 %n, 0
  br i1 %cmp2733, label %for.cond30.preheader.us.preheader, label %for.end99

for.cond30.preheader.us.preheader:                ; preds = %for.end25
  %pgocount5 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 16)
  %17 = add i64 %pgocount5, 1
  store i64 %17, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 16)
  %18 = add i32 %n, -1
  %19 = zext i32 %18 to i64
  %20 = shl nuw nsw i64 %19, 3
  %21 = add nuw nsw i64 %20, 8
  %xtraiter69 = and i32 %n, 3
  %lcmp.mod70 = icmp eq i32 %xtraiter69, 0
  br i1 %lcmp.mod70, label %for.cond30.preheader.us.prol.loopexit, label %for.cond30.for.inc41_crit_edge.us.prol.preheader

for.cond30.for.inc41_crit_edge.us.prol.preheader: ; preds = %for.cond30.preheader.us.preheader
  br label %for.cond30.for.inc41_crit_edge.us.prol

for.cond30.for.inc41_crit_edge.us.prol:           ; preds = %for.cond30.for.inc41_crit_edge.us.prol.for.cond30.for.inc41_crit_edge.us.prol_crit_edge, %for.cond30.for.inc41_crit_edge.us.prol.preheader
  %indvars.iv65.prol = phi i64 [ %indvars.iv.next66.prol, %for.cond30.for.inc41_crit_edge.us.prol.for.cond30.for.inc41_crit_edge.us.prol_crit_edge ], [ 0, %for.cond30.for.inc41_crit_edge.us.prol.preheader ]
  %prol.iter71 = phi i32 [ %prol.iter71.sub, %for.cond30.for.inc41_crit_edge.us.prol.for.cond30.for.inc41_crit_edge.us.prol_crit_edge ], [ %xtraiter69, %for.cond30.for.inc41_crit_edge.us.prol.preheader ]
  %22 = mul nuw nsw i64 %indvars.iv65.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %call, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %21, i32 8, i1 false)
  %indvars.iv.next66.prol = add nuw nsw i64 %indvars.iv65.prol, 1
  %prol.iter71.sub = add i32 %prol.iter71, -1
  %prol.iter71.cmp = icmp eq i32 %prol.iter71.sub, 0
  br i1 %prol.iter71.cmp, label %for.cond30.preheader.us.prol.loopexit.loopexit, label %for.cond30.for.inc41_crit_edge.us.prol.for.cond30.for.inc41_crit_edge.us.prol_crit_edge, !llvm.loop !1

for.cond30.for.inc41_crit_edge.us.prol.for.cond30.for.inc41_crit_edge.us.prol_crit_edge: ; preds = %for.cond30.for.inc41_crit_edge.us.prol
  %pgocount6 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %23 = add i64 %pgocount6, 1
  store i64 %23, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  br label %for.cond30.for.inc41_crit_edge.us.prol

for.cond30.preheader.us.prol.loopexit.loopexit:   ; preds = %for.cond30.for.inc41_crit_edge.us.prol
  %pgocount7 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 19)
  %24 = add i64 %pgocount7, 1
  store i64 %24, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 19)
  br label %for.cond30.preheader.us.prol.loopexit

for.cond30.preheader.us.prol.loopexit:            ; preds = %for.cond30.preheader.us.prol.loopexit.loopexit, %for.cond30.preheader.us.preheader
  %indvars.iv65.unr = phi i64 [ 0, %for.cond30.preheader.us.preheader ], [ %indvars.iv.next66.prol, %for.cond30.preheader.us.prol.loopexit.loopexit ]
  %25 = icmp ult i32 %18, 3
  br i1 %25, label %for.cond48.preheader.lr.ph, label %for.cond30.for.inc41_crit_edge.us.3.preheader

for.cond30.for.inc41_crit_edge.us.3.preheader:    ; preds = %for.cond30.preheader.us.prol.loopexit
  %pgocount8 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 20)
  %26 = add i64 %pgocount8, 1
  store i64 %26, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 20)
  %wide.trip.count67.3 = zext i32 %n to i64
  %27 = add nsw i64 %wide.trip.count67.3, -4
  %28 = sub i64 %27, %indvars.iv65.unr
  %29 = lshr i64 %28, 2
  %30 = and i64 %29, 1
  %lcmp.mod105 = icmp eq i64 %30, 0
  br i1 %lcmp.mod105, label %for.cond30.for.inc41_crit_edge.us.3.prol.preheader, label %for.cond30.for.inc41_crit_edge.us.3.prol.loopexit

for.cond30.for.inc41_crit_edge.us.3.prol.preheader: ; preds = %for.cond30.for.inc41_crit_edge.us.3.preheader
  %pgocount9 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 23)
  %31 = add i64 %pgocount9, 1
  store i64 %31, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 23)
  br label %for.cond30.for.inc41_crit_edge.us.3.prol

for.cond30.for.inc41_crit_edge.us.3.prol:         ; preds = %for.cond30.for.inc41_crit_edge.us.3.prol.preheader
  %32 = mul nuw nsw i64 %indvars.iv65.unr, 16000
  %scevgep.prol107 = getelementptr i8, i8* %call, i64 %32
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol107, i8 0, i64 %21, i32 8, i1 false)
  %33 = mul i64 %indvars.iv65.unr, 16000
  %34 = add i64 %33, 16000
  %scevgep.1.prol = getelementptr i8, i8* %call, i64 %34
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.prol, i8 0, i64 %21, i32 8, i1 false)
  %35 = mul i64 %indvars.iv65.unr, 16000
  %36 = add i64 %35, 32000
  %scevgep.2.prol = getelementptr i8, i8* %call, i64 %36
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.prol, i8 0, i64 %21, i32 8, i1 false)
  %37 = mul i64 %indvars.iv65.unr, 16000
  %38 = add i64 %37, 48000
  %scevgep.3.prol = getelementptr i8, i8* %call, i64 %38
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.prol, i8 0, i64 %21, i32 8, i1 false)
  %indvars.iv.next66.3.prol = add nsw i64 %indvars.iv65.unr, 4
  br label %for.cond30.for.inc41_crit_edge.us.3.prol.loopexit

for.cond30.for.inc41_crit_edge.us.3.prol.loopexit: ; preds = %for.cond30.for.inc41_crit_edge.us.3.prol, %for.cond30.for.inc41_crit_edge.us.3.preheader
  %indvars.iv65.unr108 = phi i64 [ %indvars.iv65.unr, %for.cond30.for.inc41_crit_edge.us.3.preheader ], [ %indvars.iv.next66.3.prol, %for.cond30.for.inc41_crit_edge.us.3.prol ]
  %39 = icmp eq i64 %29, 0
  br i1 %39, label %for.cond44.preheader, label %for.cond30.for.inc41_crit_edge.us.3.preheader.new

for.cond30.for.inc41_crit_edge.us.3.preheader.new: ; preds = %for.cond30.for.inc41_crit_edge.us.3.prol.loopexit
  br label %for.cond30.for.inc41_crit_edge.us.3

for.cond44.preheader.unr-lcssa:                   ; preds = %for.cond30.for.inc41_crit_edge.us.3
  %pgocount10 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 22)
  %40 = add i64 %pgocount10, 1
  store i64 %40, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 22)
  br label %for.cond44.preheader

for.cond44.preheader:                             ; preds = %for.cond44.preheader.unr-lcssa, %for.cond30.for.inc41_crit_edge.us.3.prol.loopexit
  %cmp459 = icmp sgt i32 %n, 0
  br i1 %cmp459, label %for.cond48.preheader.lr.ph, label %for.end99

for.cond48.preheader.lr.ph:                       ; preds = %for.cond44.preheader, %for.cond30.preheader.us.prol.loopexit
  %xtraiter51 = and i32 %n, 1
  %lcmp.mod52 = icmp eq i32 %xtraiter51, 0
  %41 = icmp eq i32 %n, 1
  %wide.trip.count55 = zext i32 %n to i64
  %wide.trip.count49.1 = zext i32 %n to i64
  %wide.trip.count59 = zext i32 %n to i64
  br label %for.cond52.preheader.us.us.preheader

for.cond52.preheader.us.us.preheader:             ; preds = %for.cond48.for.inc75_crit_edge.us, %for.cond48.preheader.lr.ph
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %for.cond48.for.inc75_crit_edge.us ], [ 0, %for.cond48.preheader.lr.ph ]
  %arrayidx63.us.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv57
  br label %for.cond52.preheader.us.us

for.cond48.for.inc75_crit_edge.us:                ; preds = %for.cond52.for.inc72_crit_edge.us.us
  %pgocount11 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 11)
  %42 = add i64 %pgocount11, 1
  store i64 %42, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 11)
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next58, %wide.trip.count59
  br i1 %exitcond60, label %for.cond78.preheader, label %for.cond52.preheader.us.us.preheader

for.cond52.preheader.us.us:                       ; preds = %for.cond52.for.inc72_crit_edge.us.us, %for.cond52.preheader.us.us.preheader
  %indvars.iv53 = phi i64 [ 0, %for.cond52.preheader.us.us.preheader ], [ %indvars.iv.next54, %for.cond52.for.inc72_crit_edge.us.us ]
  %arrayidx59.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv53, i64 %indvars.iv57
  br i1 %lcmp.mod52, label %for.body55.us.us.prol.loopexit, label %for.body55.us.us.prol

for.body55.us.us.prol:                            ; preds = %for.cond52.preheader.us.us
  %pgocount12 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  %43 = add i64 %pgocount12, 1
  store i64 %43, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  %44 = load double, double* %arrayidx59.us.us, align 8
  %45 = load double, double* %arrayidx63.us.us.prol, align 8
  %mul.us.us.prol = fmul double %44, %45
  %arrayidx67.us.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %16, i64 0, i64 %indvars.iv53, i64 0
  %46 = load double, double* %arrayidx67.us.us.prol, align 8
  %add68.us.us.prol = fadd double %46, %mul.us.us.prol
  store double %add68.us.us.prol, double* %arrayidx67.us.us.prol, align 8
  br label %for.body55.us.us.prol.loopexit

for.body55.us.us.prol.loopexit:                   ; preds = %for.body55.us.us.prol, %for.cond52.preheader.us.us
  %indvars.iv47.unr.ph = phi i64 [ 1, %for.body55.us.us.prol ], [ 0, %for.cond52.preheader.us.us ]
  br i1 %41, label %for.body55.us.us.prol.loopexit.for.cond52.for.inc72_crit_edge.us.us_crit_edge, label %for.body55.us.us.preheader

for.body55.us.us.prol.loopexit.for.cond52.for.inc72_crit_edge.us.us_crit_edge: ; preds = %for.body55.us.us.prol.loopexit
  %pgocount13 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %47 = add i64 %pgocount13, 1
  store i64 %47, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  br label %for.cond52.for.inc72_crit_edge.us.us

for.body55.us.us.preheader:                       ; preds = %for.body55.us.us.prol.loopexit
  br label %for.body55.us.us

for.cond52.for.inc72_crit_edge.us.us.loopexit:    ; preds = %for.body55.us.us
  %pgocount14 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  %48 = add i64 %pgocount14, 1
  store i64 %48, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  br label %for.cond52.for.inc72_crit_edge.us.us

for.cond52.for.inc72_crit_edge.us.us:             ; preds = %for.body55.us.us.prol.loopexit.for.cond52.for.inc72_crit_edge.us.us_crit_edge, %for.cond52.for.inc72_crit_edge.us.us.loopexit
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next54, %wide.trip.count55
  br i1 %exitcond56, label %for.cond48.for.inc75_crit_edge.us, label %for.cond52.preheader.us.us

for.body55.us.us:                                 ; preds = %for.body55.us.us.for.body55.us.us_crit_edge, %for.body55.us.us.preheader
  %indvars.iv47 = phi i64 [ %indvars.iv.next48.1, %for.body55.us.us.for.body55.us.us_crit_edge ], [ %indvars.iv47.unr.ph, %for.body55.us.us.preheader ]
  %49 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv47, i64 %indvars.iv57
  %50 = load double, double* %arrayidx63.us.us, align 8
  %mul.us.us = fmul double %49, %50
  %arrayidx67.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %16, i64 0, i64 %indvars.iv53, i64 %indvars.iv47
  %51 = load double, double* %arrayidx67.us.us, align 8
  %add68.us.us = fadd double %51, %mul.us.us
  store double %add68.us.us, double* %arrayidx67.us.us, align 8
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %52 = load double, double* %arrayidx59.us.us, align 8
  %arrayidx63.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next48, i64 %indvars.iv57
  %53 = load double, double* %arrayidx63.us.us.1, align 8
  %mul.us.us.1 = fmul double %52, %53
  %arrayidx67.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %16, i64 0, i64 %indvars.iv53, i64 %indvars.iv.next48
  %54 = load double, double* %arrayidx67.us.us.1, align 8
  %add68.us.us.1 = fadd double %54, %mul.us.us.1
  store double %add68.us.us.1, double* %arrayidx67.us.us.1, align 8
  %indvars.iv.next48.1 = add nsw i64 %indvars.iv47, 2
  %exitcond50.1 = icmp eq i64 %indvars.iv.next48.1, %wide.trip.count49.1
  br i1 %exitcond50.1, label %for.cond52.for.inc72_crit_edge.us.us.loopexit, label %for.body55.us.us.for.body55.us.us_crit_edge

for.body55.us.us.for.body55.us.us_crit_edge:      ; preds = %for.body55.us.us
  %pgocount15 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %55 = add i64 %pgocount15, 1
  store i64 %55, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  br label %for.body55.us.us

for.cond78.preheader:                             ; preds = %for.cond48.for.inc75_crit_edge.us
  %pgocount16 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 18)
  %56 = add i64 %pgocount16, 1
  store i64 %56, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 18)
  %cmp793 = icmp sgt i32 %n, 0
  br i1 %cmp793, label %for.cond82.preheader.us.preheader, label %for.end99

for.cond82.preheader.us.preheader:                ; preds = %for.cond78.preheader
  %pgocount17 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 21)
  %57 = add i64 %pgocount17, 1
  store i64 %57, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 21)
  %58 = add i32 %n, -1
  %xtraiter = and i32 %n, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %59 = icmp ult i32 %58, 3
  %wide.trip.count46 = zext i32 %n to i64
  %wide.trip.count.3 = zext i32 %n to i64
  br label %for.cond82.preheader.us

for.cond82.preheader.us:                          ; preds = %for.cond82.for.inc97_crit_edge.us, %for.cond82.preheader.us.preheader
  %indvars.iv44 = phi i64 [ 0, %for.cond82.preheader.us.preheader ], [ %indvars.iv.next45, %for.cond82.for.inc97_crit_edge.us ]
  br i1 %lcmp.mod, label %for.cond82.preheader.us.for.body85.us.prol.loopexit_crit_edge, label %for.body85.us.prol.preheader

for.cond82.preheader.us.for.body85.us.prol.loopexit_crit_edge: ; preds = %for.cond82.preheader.us
  %pgocount18 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %60 = add i64 %pgocount18, 1
  store i64 %60, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  br label %for.body85.us.prol.loopexit

for.body85.us.prol.preheader:                     ; preds = %for.cond82.preheader.us
  br label %for.body85.us.prol

for.body85.us.prol:                               ; preds = %for.body85.us.prol.for.body85.us.prol_crit_edge, %for.body85.us.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body85.us.prol.for.body85.us.prol_crit_edge ], [ 0, %for.body85.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body85.us.prol.for.body85.us.prol_crit_edge ], [ %xtraiter, %for.body85.us.prol.preheader ]
  %arrayidx89.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %16, i64 0, i64 %indvars.iv44, i64 %indvars.iv.prol
  %61 = bitcast double* %arrayidx89.us.prol to i64*
  %62 = load i64, i64* %61, align 8
  %arrayidx93.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv44, i64 %indvars.iv.prol
  %63 = bitcast double* %arrayidx93.us.prol to i64*
  store i64 %62, i64* %63, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body85.us.prol.loopexit.loopexit, label %for.body85.us.prol.for.body85.us.prol_crit_edge, !llvm.loop !3

for.body85.us.prol.for.body85.us.prol_crit_edge:  ; preds = %for.body85.us.prol
  %pgocount19 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %64 = add i64 %pgocount19, 1
  store i64 %64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  br label %for.body85.us.prol

for.body85.us.prol.loopexit.loopexit:             ; preds = %for.body85.us.prol
  %pgocount20 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 13)
  %65 = add i64 %pgocount20, 1
  store i64 %65, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 13)
  br label %for.body85.us.prol.loopexit

for.body85.us.prol.loopexit:                      ; preds = %for.cond82.preheader.us.for.body85.us.prol.loopexit_crit_edge, %for.body85.us.prol.loopexit.loopexit
  %indvars.iv.unr = phi i64 [ 0, %for.cond82.preheader.us.for.body85.us.prol.loopexit_crit_edge ], [ %indvars.iv.next.prol, %for.body85.us.prol.loopexit.loopexit ]
  br i1 %59, label %for.cond82.for.inc97_crit_edge.us, label %for.body85.us.preheader

for.body85.us.preheader:                          ; preds = %for.body85.us.prol.loopexit
  br label %for.body85.us

for.body85.us:                                    ; preds = %for.body85.us.for.body85.us_crit_edge, %for.body85.us.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body85.us.for.body85.us_crit_edge ], [ %indvars.iv.unr, %for.body85.us.preheader ]
  %arrayidx89.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %16, i64 0, i64 %indvars.iv44, i64 %indvars.iv
  %66 = bitcast double* %arrayidx89.us to i64*
  %67 = load i64, i64* %66, align 8
  %arrayidx93.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv44, i64 %indvars.iv
  %68 = bitcast double* %arrayidx93.us to i64*
  store i64 %67, i64* %68, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx89.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %16, i64 0, i64 %indvars.iv44, i64 %indvars.iv.next
  %69 = bitcast double* %arrayidx89.us.1 to i64*
  %70 = load i64, i64* %69, align 8
  %arrayidx93.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv44, i64 %indvars.iv.next
  %71 = bitcast double* %arrayidx93.us.1 to i64*
  store i64 %70, i64* %71, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx89.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %16, i64 0, i64 %indvars.iv44, i64 %indvars.iv.next.1
  %72 = bitcast double* %arrayidx89.us.2 to i64*
  %73 = load i64, i64* %72, align 8
  %arrayidx93.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv44, i64 %indvars.iv.next.1
  %74 = bitcast double* %arrayidx93.us.2 to i64*
  store i64 %73, i64* %74, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx89.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %16, i64 0, i64 %indvars.iv44, i64 %indvars.iv.next.2
  %75 = bitcast double* %arrayidx89.us.3 to i64*
  %76 = load i64, i64* %75, align 8
  %arrayidx93.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv44, i64 %indvars.iv.next.2
  %77 = bitcast double* %arrayidx93.us.3 to i64*
  store i64 %76, i64* %77, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %for.cond82.for.inc97_crit_edge.us.loopexit, label %for.body85.us.for.body85.us_crit_edge

for.body85.us.for.body85.us_crit_edge:            ; preds = %for.body85.us
  %pgocount21 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %78 = add i64 %pgocount21, 1
  store i64 %78, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  br label %for.body85.us

for.cond82.for.inc97_crit_edge.us.loopexit:       ; preds = %for.body85.us
  %pgocount22 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 14)
  %79 = add i64 %pgocount22, 1
  store i64 %79, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 14)
  br label %for.cond82.for.inc97_crit_edge.us

for.cond82.for.inc97_crit_edge.us:                ; preds = %for.cond82.for.inc97_crit_edge.us.loopexit, %for.body85.us.prol.loopexit
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond = icmp eq i64 %indvars.iv.next45, %wide.trip.count46
  br i1 %exitcond, label %for.end99.loopexit, label %for.cond82.preheader.us

for.end99.loopexit:                               ; preds = %for.cond82.for.inc97_crit_edge.us
  br label %for.end99

for.end99:                                        ; preds = %for.end99.loopexit, %for.cond78.preheader, %for.cond44.preheader, %for.end25, %for.end25.thread
  %call9597103 = phi i8* [ %call, %for.cond78.preheader ], [ %call, %for.cond44.preheader ], [ %call, %for.end25 ], [ %call93, %for.end25.thread ], [ %call, %for.end99.loopexit ]
  tail call void @free(i8* %call9597103) #3
  ret void

for.cond30.for.inc41_crit_edge.us.3:              ; preds = %for.cond30.for.inc41_crit_edge.us.3.for.cond30.for.inc41_crit_edge.us.3_crit_edge, %for.cond30.for.inc41_crit_edge.us.3.preheader.new
  %indvars.iv65 = phi i64 [ %indvars.iv65.unr108, %for.cond30.for.inc41_crit_edge.us.3.preheader.new ], [ %indvars.iv.next66.3.1, %for.cond30.for.inc41_crit_edge.us.3.for.cond30.for.inc41_crit_edge.us.3_crit_edge ]
  %80 = mul nuw nsw i64 %indvars.iv65, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %80
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %21, i32 8, i1 false)
  %81 = mul i64 %indvars.iv65, 16000
  %82 = add i64 %81, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %82
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %21, i32 8, i1 false)
  %83 = mul i64 %indvars.iv65, 16000
  %84 = add i64 %83, 32000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %84
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %21, i32 8, i1 false)
  %85 = mul i64 %indvars.iv65, 16000
  %86 = add i64 %85, 48000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %86
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %21, i32 8, i1 false)
  %indvars.iv.next66.3 = add nsw i64 %indvars.iv65, 4
  %87 = mul nuw nsw i64 %indvars.iv.next66.3, 16000
  %scevgep.1109 = getelementptr i8, i8* %call, i64 %87
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1109, i8 0, i64 %21, i32 8, i1 false)
  %88 = mul i64 %indvars.iv.next66.3, 16000
  %89 = add i64 %88, 16000
  %scevgep.1.1 = getelementptr i8, i8* %call, i64 %89
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 %21, i32 8, i1 false)
  %90 = mul i64 %indvars.iv.next66.3, 16000
  %91 = add i64 %90, 32000
  %scevgep.2.1 = getelementptr i8, i8* %call, i64 %91
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 %21, i32 8, i1 false)
  %92 = mul i64 %indvars.iv.next66.3, 16000
  %93 = add i64 %92, 48000
  %scevgep.3.1 = getelementptr i8, i8* %call, i64 %93
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 %21, i32 8, i1 false)
  %indvars.iv.next66.3.1 = add nsw i64 %indvars.iv65, 8
  %exitcond68.3.1 = icmp eq i64 %indvars.iv.next66.3.1, %wide.trip.count67.3
  br i1 %exitcond68.3.1, label %for.cond44.preheader.unr-lcssa, label %for.cond30.for.inc41_crit_edge.us.3.for.cond30.for.inc41_crit_edge.us.3_crit_edge

for.cond30.for.inc41_crit_edge.us.3.for.cond30.for.inc41_crit_edge.us.3_crit_edge: ; preds = %for.cond30.for.inc41_crit_edge.us.3
  %pgocount23 = load i64, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %94 = add i64 %pgocount23, 1
  store i64 %94, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  br label %for.cond30.for.inc41_crit_edge.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32 %n, [2000 x double]* nocapture %A) unnamed_addr #0 {
entry:
  %cmp7 = icmp sgt i32 %n, 0
  br i1 %cmp7, label %for.cond1.preheader.preheader, label %for.end58

for.cond1.preheader.preheader:                    ; preds = %entry
  %wide.trip.count29 = zext i32 %n to i64
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end47, %for.cond1.preheader.preheader
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %for.end47 ], [ 0, %for.cond1.preheader.preheader ]
  %0 = add i64 %indvars.iv27, -2
  %1 = add i64 %indvars.iv27, 4294967295
  %cmp23 = icmp sgt i64 %indvars.iv27, 0
  br i1 %cmp23, label %for.cond4.preheader.preheader, label %for.cond1.preheader.for.end47_crit_edge

for.cond1.preheader.for.end47_crit_edge:          ; preds = %for.cond1.preheader
  %pgocount = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 3)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 3)
  br label %for.end47

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 0
  br label %for.cond4.preheader

for.cond28.preheader:                             ; preds = %for.end
  %pgocount1 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 7)
  %3 = add i64 %pgocount1, 1
  store i64 %3, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 7)
  %cmp295 = icmp sgt i64 %indvars.iv27, 0
  br i1 %cmp295, label %for.body30.lr.ph, label %for.end47

for.body30.lr.ph:                                 ; preds = %for.cond28.preheader
  %pgocount2 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 8)
  %4 = add i64 %pgocount2, 1
  store i64 %4, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 8)
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv27
  %xtraiter2331 = and i64 %indvars.iv27, 1
  %lcmp.mod24 = icmp eq i64 %xtraiter2331, 0
  br i1 %lcmp.mod24, label %for.body30.prol.loopexit, label %for.body30.prol

for.body30.prol:                                  ; preds = %for.body30.lr.ph
  %pgocount3 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 10)
  %5 = add i64 %pgocount3, 1
  store i64 %5, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 10)
  %arrayidx34.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 0
  %6 = load double, double* %arrayidx34.prol, align 8
  %mul39.prol = fmul double %6, %6
  %7 = load double, double* %arrayidx43, align 8
  %sub44.prol = fsub double %7, %mul39.prol
  store double %sub44.prol, double* %arrayidx43, align 8
  br label %for.body30.prol.loopexit

for.body30.prol.loopexit:                         ; preds = %for.body30.prol, %for.body30.lr.ph
  %indvars.iv18.unr.ph = phi i64 [ 1, %for.body30.prol ], [ 0, %for.body30.lr.ph ]
  %8 = trunc i64 %1 to i32
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %for.end47, label %for.body30.preheader

for.body30.preheader:                             ; preds = %for.body30.prol.loopexit
  %pgocount4 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 9)
  %10 = add i64 %pgocount4, 1
  store i64 %10, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 9)
  %11 = sub i64 %0, %indvars.iv18.unr.ph
  %12 = lshr i64 %11, 1
  %13 = and i64 %12, 1
  %lcmp.mod35 = icmp eq i64 %13, 0
  br i1 %lcmp.mod35, label %for.body30.prol.preheader, label %for.body30.prol.loopexit34.unr-lcssa

for.body30.prol.preheader:                        ; preds = %for.body30.preheader
  br label %for.body30.prol36

for.body30.prol36:                                ; preds = %for.body30.prol.preheader
  %pgocount5 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 12)
  %14 = add i64 %pgocount5, 1
  store i64 %14, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 12)
  %arrayidx34.prol37 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv18.unr.ph
  %15 = load double, double* %arrayidx34.prol37, align 8
  %mul39.prol38 = fmul double %15, %15
  %16 = load double, double* %arrayidx43, align 8
  %sub44.prol39 = fsub double %16, %mul39.prol38
  store double %sub44.prol39, double* %arrayidx43, align 8
  %indvars.iv.next19.prol = add nuw nsw i64 %indvars.iv18.unr.ph, 1
  %arrayidx34.1.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv.next19.prol
  %17 = load double, double* %arrayidx34.1.prol, align 8
  %mul39.1.prol = fmul double %17, %17
  %sub44.1.prol = fsub double %sub44.prol39, %mul39.1.prol
  store double %sub44.1.prol, double* %arrayidx43, align 8
  %indvars.iv.next19.1.prol = or i64 %indvars.iv18.unr.ph, 2
  br label %for.body30.prol.loopexit34.unr-lcssa

for.body30.prol.loopexit34.unr-lcssa:             ; preds = %for.body30.prol36, %for.body30.preheader
  %indvars.iv18.unr.ph40 = phi i64 [ %indvars.iv.next19.1.prol, %for.body30.prol36 ], [ %indvars.iv18.unr.ph, %for.body30.preheader ]
  br label %for.body30.prol.loopexit34

for.body30.prol.loopexit34:                       ; preds = %for.body30.prol.loopexit34.unr-lcssa
  %18 = icmp eq i64 %12, 0
  br i1 %18, label %for.end47.loopexit, label %for.body30.preheader.new

for.body30.preheader.new:                         ; preds = %for.body30.prol.loopexit34
  %pgocount6 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 11)
  %19 = add i64 %pgocount6, 1
  store i64 %19, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 11)
  br label %for.body30

for.cond4.preheader:                              ; preds = %for.end, %for.cond4.preheader.preheader
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %for.end ], [ 0, %for.cond4.preheader.preheader ]
  %20 = add i64 %indvars.iv13, 4294967295
  %cmp51 = icmp sgt i64 %indvars.iv13, 0
  br i1 %cmp51, label %for.body6.lr.ph, label %for.cond4.preheader.for.end_crit_edge

for.cond4.preheader.for.end_crit_edge:            ; preds = %for.cond4.preheader
  %pgocount7 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 1)
  %21 = add i64 %pgocount7, 1
  store i64 %21, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 1)
  br label %for.end

for.body6.lr.ph:                                  ; preds = %for.cond4.preheader
  %pgocount8 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 4)
  %22 = add i64 %pgocount8, 1
  store i64 %22, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 4)
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv13
  %xtraiter32 = and i64 %indvars.iv13, 1
  %lcmp.mod = icmp eq i64 %xtraiter32, 0
  br i1 %lcmp.mod, label %for.body6.prol.loopexit, label %for.body6.prol

for.body6.prol:                                   ; preds = %for.body6.lr.ph
  %pgocount9 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 6)
  %23 = add i64 %pgocount9, 1
  store i64 %23, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 6)
  %24 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv13, i64 0
  %25 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %24, %25
  %26 = load double, double* %arrayidx16, align 8
  %sub.prol = fsub double %26, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.body6.prol.loopexit

for.body6.prol.loopexit:                          ; preds = %for.body6.prol, %for.body6.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body6.prol ], [ 0, %for.body6.lr.ph ]
  %27 = trunc i64 %20 to i32
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %for.end, label %for.body6.preheader

for.body6.preheader:                              ; preds = %for.body6.prol.loopexit
  br label %for.body6

for.body6:                                        ; preds = %for.body6.for.body6_crit_edge, %for.body6.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body6.for.body6_crit_edge ], [ %indvars.iv.unr.ph, %for.body6.preheader ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv
  %29 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv13, i64 %indvars.iv
  %30 = load double, double* %arrayidx12, align 8
  %mul = fmul double %29, %30
  %31 = load double, double* %arrayidx16, align 8
  %sub = fsub double %31, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv.next
  %32 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv13, i64 %indvars.iv.next
  %33 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %32, %33
  %34 = load double, double* %arrayidx16, align 8
  %sub.1 = fsub double %34, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv13
  br i1 %exitcond.1, label %for.end.loopexit, label %for.body6.for.body6_crit_edge

for.body6.for.body6_crit_edge:                    ; preds = %for.body6
  %pgocount10 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 0)
  %35 = add i64 %pgocount10, 1
  store i64 %35, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 0)
  br label %for.body6

for.end.loopexit:                                 ; preds = %for.body6
  %pgocount11 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 5)
  %36 = add i64 %pgocount11, 1
  store i64 %36, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 5)
  br label %for.end

for.end:                                          ; preds = %for.cond4.preheader.for.end_crit_edge, %for.end.loopexit, %for.body6.prol.loopexit
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv13, i64 %indvars.iv13
  %37 = load double, double* %arrayidx20, align 8
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv13
  %38 = load double, double* %arrayidx24, align 8
  %div = fdiv double %38, %37
  store double %div, double* %arrayidx24, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next14, %indvars.iv27
  br i1 %exitcond, label %for.cond28.preheader, label %for.cond4.preheader

for.body30:                                       ; preds = %for.body30.for.body30_crit_edge, %for.body30.preheader.new
  %indvars.iv18 = phi i64 [ %indvars.iv18.unr.ph40, %for.body30.preheader.new ], [ %indvars.iv.next19.1.1, %for.body30.for.body30_crit_edge ]
  %arrayidx34 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv18
  %39 = load double, double* %arrayidx34, align 8
  %mul39 = fmul double %39, %39
  %40 = load double, double* %arrayidx43, align 8
  %sub44 = fsub double %40, %mul39
  store double %sub44, double* %arrayidx43, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %arrayidx34.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv.next19
  %41 = load double, double* %arrayidx34.1, align 8
  %mul39.1 = fmul double %41, %41
  %sub44.1 = fsub double %sub44, %mul39.1
  store double %sub44.1, double* %arrayidx43, align 8
  %indvars.iv.next19.1 = add nsw i64 %indvars.iv18, 2
  %arrayidx34.141 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv.next19.1
  %42 = load double, double* %arrayidx34.141, align 8
  %mul39.142 = fmul double %42, %42
  %sub44.143 = fsub double %sub44.1, %mul39.142
  store double %sub44.143, double* %arrayidx43, align 8
  %indvars.iv.next19.144 = add nsw i64 %indvars.iv18, 3
  %arrayidx34.1.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv.next19.144
  %43 = load double, double* %arrayidx34.1.1, align 8
  %mul39.1.1 = fmul double %43, %43
  %sub44.1.1 = fsub double %sub44.143, %mul39.1.1
  store double %sub44.1.1, double* %arrayidx43, align 8
  %indvars.iv.next19.1.1 = add nsw i64 %indvars.iv18, 4
  %exitcond22.1.1 = icmp eq i64 %indvars.iv.next19.1.1, %indvars.iv27
  br i1 %exitcond22.1.1, label %for.end47.loopexit.unr-lcssa, label %for.body30.for.body30_crit_edge

for.body30.for.body30_crit_edge:                  ; preds = %for.body30
  %pgocount12 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 2)
  %44 = add i64 %pgocount12, 1
  store i64 %44, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 2)
  br label %for.body30

for.end47.loopexit.unr-lcssa:                     ; preds = %for.body30
  br label %for.end47.loopexit

for.end47.loopexit:                               ; preds = %for.end47.loopexit.unr-lcssa, %for.body30.prol.loopexit34
  br label %for.end47

for.end47:                                        ; preds = %for.cond1.preheader.for.end47_crit_edge, %for.end47.loopexit, %for.body30.prol.loopexit, %for.cond28.preheader
  %arrayidx51 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv27, i64 %indvars.iv27
  %45 = load double, double* %arrayidx51, align 8
  %call = tail call double @sqrt(double %45) #3
  store double %call, double* %arrayidx51, align 8
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next28, %wide.trip.count29
  br i1 %exitcond30, label %for.end58.loopexit, label %for.cond1.preheader

for.end58.loopexit:                               ; preds = %for.end47
  %pgocount13 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 14)
  %46 = add i64 %pgocount13, 1
  store i64 %46, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 14)
  br label %for.end58

for.end58:                                        ; preds = %for.end58.loopexit, %entry
  %pgocount14 = load i64, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 13)
  %47 = add i64 %pgocount14, 1
  store i64 %47, i64* getelementptr inbounds ([15 x i64], [15 x i64]* @__profc_B.ll_kernel_cholesky, i64 0, i64 13)
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [2000 x double]* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %cmp4 = icmp sgt i32 %n, 0
  br i1 %cmp4, label %for.cond2.preheader.preheader, label %for.end12

for.cond2.preheader.preheader:                    ; preds = %entry
  %3 = sext i32 %n to i64
  %wide.trip.count14 = zext i32 %n to i64
  br label %for.body4.lr.ph

for.body4.lr.ph:                                  ; preds = %for.inc10, %for.cond2.preheader.preheader
  %indvars.iv11 = phi i64 [ 0, %for.cond2.preheader.preheader ], [ %indvars.iv.next12, %for.inc10 ]
  %indvars.iv9 = phi i64 [ 1, %for.cond2.preheader.preheader ], [ %indvars.iv.next10, %for.inc10 ]
  %4 = mul nsw i64 %indvars.iv11, %3
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.body4.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end ], [ 0, %for.body4.lr.ph ]
  %5 = add nsw i64 %indvars.iv, %4
  %6 = trunc i64 %5 to i32
  %rem = srem i32 %6, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %for.body4.if.end_crit_edge

for.body4.if.end_crit_edge:                       ; preds = %for.body4
  %pgocount = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %7 = add i64 %pgocount, 1
  store i64 %7, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  br label %if.end

if.then:                                          ; preds = %for.body4
  %pgocount1 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %8 = add i64 %pgocount1, 1
  store i64 %8, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %9) #5
  br label %if.end

if.end:                                           ; preds = %for.body4.if.end_crit_edge, %if.then
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv11, i64 %indvars.iv
  %11 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %11) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv9
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %if.end
  %pgocount2 = load i64, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %12 = add i64 %pgocount2, 1
  store i64 %12, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next12, %wide.trip.count14
  br i1 %exitcond15, label %for.end12.loopexit, label %for.body4.lr.ph

for.end12.loopexit:                               ; preds = %for.inc10
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
declare void @free(i8* nocapture) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

; Function Attrs: nounwind
declare void @llvm.instrprof.increment(i8*, i64, i32, i32) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
