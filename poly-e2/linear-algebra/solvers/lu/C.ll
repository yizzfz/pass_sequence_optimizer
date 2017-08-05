; ModuleID = 'B.ll'
source_filename = "lu.c"
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
@__profn_B.ll_kernel_lu = private constant [14 x i8] c"B.ll:kernel_lu"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 32414643582, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [24 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 300420118271, i64* getelementptr inbounds ([24 x i64], [24 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 24, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_lu = private global [14 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_lu = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -4376252712048593566, i64 169765224626, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i32 0, i32 0), i8* null, i8* null, i32 14, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 63976198547, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [54 x i8] c"4\00main\01B.ll:init_array\01B.ll:kernel_lu\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_lu to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([54 x i8], [54 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %arraydecay = bitcast i8* %call to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_lu(i32 2000, [2000 x double]* %arraydecay)
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
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %3 = add i64 %pgocount2, 1
  store i64 %3, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  tail call void @free(i8* %call) #4
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
  %call93 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
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
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
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
  tail call void @free(i8* %call9597103) #4
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

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu(i32 %n, [2000 x double]* nocapture %A) unnamed_addr #2 {
entry:
  %cmp9 = icmp sgt i32 %n, 0
  br i1 %cmp9, label %for.cond1.preheader.preheader, label %for.end56

for.cond1.preheader.preheader:                    ; preds = %entry
  %wide.trip.count41 = zext i32 %n to i64
  %wide.trip.count35 = zext i32 %n to i64
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc54, %for.cond1.preheader.preheader
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %for.inc54 ], [ 0, %for.cond1.preheader.preheader ]
  %0 = add i64 %indvars.iv39, 4294967295
  %cmp23 = icmp sgt i64 %indvars.iv39, 0
  br i1 %cmp23, label %for.cond4.preheader.preheader, label %for.cond1.preheader.for.inc54_crit_edge

for.cond1.preheader.for.inc54_crit_edge:          ; preds = %for.cond1.preheader
  %pgocount = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 4)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 4)
  br label %for.inc54

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  %arrayidx8.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 0
  br label %for.cond4.preheader

for.cond31.preheader.lr.ph:                       ; preds = %for.end
  %pgocount1 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 10)
  %2 = add i64 %pgocount1, 1
  store i64 %2, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 10)
  %cmp325 = icmp sgt i64 %indvars.iv39, 0
  br i1 %cmp325, label %for.cond31.preheader.us.preheader, label %for.inc54

for.cond31.preheader.us.preheader:                ; preds = %for.cond31.preheader.lr.ph
  %xtraiter2943 = and i64 %indvars.iv39, 1
  %lcmp.mod30 = icmp eq i64 %xtraiter2943, 0
  %3 = trunc i64 %0 to i32
  %4 = icmp eq i32 %3, 0
  %arrayidx37.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 0
  br label %for.cond31.preheader.us

for.cond31.preheader.us:                          ; preds = %for.cond31.for.inc51_crit_edge.us, %for.cond31.preheader.us.preheader
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %for.cond31.for.inc51_crit_edge.us ], [ %indvars.iv39, %for.cond31.preheader.us.preheader ]
  %arrayidx46.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 %indvars.iv33
  br i1 %lcmp.mod30, label %for.body33.us.prol.loopexit, label %for.body33.us.prol

for.body33.us.prol:                               ; preds = %for.cond31.preheader.us
  %pgocount2 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 8)
  %5 = add i64 %pgocount2, 1
  store i64 %5, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 8)
  %6 = load double, double* %arrayidx37.us.prol, align 8
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv33
  %7 = load double, double* %arrayidx41.us.prol, align 8
  %mul42.us.prol = fmul double %6, %7
  %8 = load double, double* %arrayidx46.us, align 8
  %sub47.us.prol = fsub double %8, %mul42.us.prol
  store double %sub47.us.prol, double* %arrayidx46.us, align 8
  br label %for.body33.us.prol.loopexit

for.body33.us.prol.loopexit:                      ; preds = %for.body33.us.prol, %for.cond31.preheader.us
  %indvars.iv24.unr.ph = phi i64 [ 1, %for.body33.us.prol ], [ 0, %for.cond31.preheader.us ]
  br i1 %4, label %for.body33.us.prol.loopexit.for.cond31.for.inc51_crit_edge.us_crit_edge, label %for.body33.us.preheader

for.body33.us.prol.loopexit.for.cond31.for.inc51_crit_edge.us_crit_edge: ; preds = %for.body33.us.prol.loopexit
  %pgocount3 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 3)
  %9 = add i64 %pgocount3, 1
  store i64 %9, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 3)
  br label %for.cond31.for.inc51_crit_edge.us

for.body33.us.preheader:                          ; preds = %for.body33.us.prol.loopexit
  br label %for.body33.us

for.body33.us:                                    ; preds = %for.body33.us.for.body33.us_crit_edge, %for.body33.us.preheader
  %indvars.iv24 = phi i64 [ %indvars.iv.next25.1, %for.body33.us.for.body33.us_crit_edge ], [ %indvars.iv24.unr.ph, %for.body33.us.preheader ]
  %arrayidx37.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 %indvars.iv24
  %10 = load double, double* %arrayidx37.us, align 8
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv24, i64 %indvars.iv33
  %11 = load double, double* %arrayidx41.us, align 8
  %mul42.us = fmul double %10, %11
  %12 = load double, double* %arrayidx46.us, align 8
  %sub47.us = fsub double %12, %mul42.us
  store double %sub47.us, double* %arrayidx46.us, align 8
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %arrayidx37.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 %indvars.iv.next25
  %13 = load double, double* %arrayidx37.us.1, align 8
  %arrayidx41.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next25, i64 %indvars.iv33
  %14 = load double, double* %arrayidx41.us.1, align 8
  %mul42.us.1 = fmul double %13, %14
  %15 = load double, double* %arrayidx46.us, align 8
  %sub47.us.1 = fsub double %15, %mul42.us.1
  store double %sub47.us.1, double* %arrayidx46.us, align 8
  %indvars.iv.next25.1 = add nsw i64 %indvars.iv24, 2
  %exitcond28.1 = icmp eq i64 %indvars.iv.next25.1, %indvars.iv39
  br i1 %exitcond28.1, label %for.cond31.for.inc51_crit_edge.us.loopexit, label %for.body33.us.for.body33.us_crit_edge

for.body33.us.for.body33.us_crit_edge:            ; preds = %for.body33.us
  %pgocount4 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 0)
  %16 = add i64 %pgocount4, 1
  store i64 %16, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 0)
  br label %for.body33.us

for.cond31.for.inc51_crit_edge.us.loopexit:       ; preds = %for.body33.us
  %pgocount5 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 6)
  %17 = add i64 %pgocount5, 1
  store i64 %17, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 6)
  br label %for.cond31.for.inc51_crit_edge.us

for.cond31.for.inc51_crit_edge.us:                ; preds = %for.body33.us.prol.loopexit.for.cond31.for.inc51_crit_edge.us_crit_edge, %for.cond31.for.inc51_crit_edge.us.loopexit
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next34, %wide.trip.count35
  br i1 %exitcond36, label %for.inc54.loopexit, label %for.cond31.preheader.us

for.cond4.preheader:                              ; preds = %for.end, %for.cond4.preheader.preheader
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %for.end ], [ 0, %for.cond4.preheader.preheader ]
  %18 = add i64 %indvars.iv18, 4294967295
  %cmp51 = icmp sgt i64 %indvars.iv18, 0
  br i1 %cmp51, label %for.body6.lr.ph, label %for.cond4.preheader.for.end_crit_edge

for.cond4.preheader.for.end_crit_edge:            ; preds = %for.cond4.preheader
  %pgocount6 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 2)
  %19 = add i64 %pgocount6, 1
  store i64 %19, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 2)
  br label %for.end

for.body6.lr.ph:                                  ; preds = %for.cond4.preheader
  %pgocount7 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 5)
  %20 = add i64 %pgocount7, 1
  store i64 %20, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 5)
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 %indvars.iv18
  %xtraiter44 = and i64 %indvars.iv18, 1
  %lcmp.mod = icmp eq i64 %xtraiter44, 0
  br i1 %lcmp.mod, label %for.body6.prol.loopexit, label %for.body6.prol

for.body6.prol:                                   ; preds = %for.body6.lr.ph
  %pgocount8 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 9)
  %21 = add i64 %pgocount8, 1
  store i64 %21, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 9)
  %22 = load double, double* %arrayidx8.prol, align 8
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv18
  %23 = load double, double* %arrayidx12.prol, align 8
  %mul.prol = fmul double %22, %23
  %24 = load double, double* %arrayidx16, align 8
  %sub.prol = fsub double %24, %mul.prol
  store double %sub.prol, double* %arrayidx16, align 8
  br label %for.body6.prol.loopexit

for.body6.prol.loopexit:                          ; preds = %for.body6.prol, %for.body6.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body6.prol ], [ 0, %for.body6.lr.ph ]
  %25 = trunc i64 %18 to i32
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %for.end, label %for.body6.preheader

for.body6.preheader:                              ; preds = %for.body6.prol.loopexit
  br label %for.body6

for.body6:                                        ; preds = %for.body6.for.body6_crit_edge, %for.body6.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body6.for.body6_crit_edge ], [ %indvars.iv.unr.ph, %for.body6.preheader ]
  %arrayidx8 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 %indvars.iv
  %27 = load double, double* %arrayidx8, align 8
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv18
  %28 = load double, double* %arrayidx12, align 8
  %mul = fmul double %27, %28
  %29 = load double, double* %arrayidx16, align 8
  %sub = fsub double %29, %mul
  store double %sub, double* %arrayidx16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx8.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 %indvars.iv.next
  %30 = load double, double* %arrayidx8.1, align 8
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next, i64 %indvars.iv18
  %31 = load double, double* %arrayidx12.1, align 8
  %mul.1 = fmul double %30, %31
  %32 = load double, double* %arrayidx16, align 8
  %sub.1 = fsub double %32, %mul.1
  store double %sub.1, double* %arrayidx16, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv18
  br i1 %exitcond.1, label %for.end.loopexit, label %for.body6.for.body6_crit_edge

for.body6.for.body6_crit_edge:                    ; preds = %for.body6
  %pgocount9 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 1)
  %33 = add i64 %pgocount9, 1
  store i64 %33, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 1)
  br label %for.body6

for.end.loopexit:                                 ; preds = %for.body6
  %pgocount10 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 7)
  %34 = add i64 %pgocount10, 1
  store i64 %34, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 7)
  br label %for.end

for.end:                                          ; preds = %for.cond4.preheader.for.end_crit_edge, %for.end.loopexit, %for.body6.prol.loopexit
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv18, i64 %indvars.iv18
  %35 = load double, double* %arrayidx20, align 8
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv39, i64 %indvars.iv18
  %36 = load double, double* %arrayidx24, align 8
  %div = fdiv double %36, %35
  store double %div, double* %arrayidx24, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond = icmp eq i64 %indvars.iv.next19, %indvars.iv39
  br i1 %exitcond, label %for.cond31.preheader.lr.ph, label %for.cond4.preheader

for.inc54.loopexit:                               ; preds = %for.cond31.for.inc51_crit_edge.us
  %pgocount11 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 11)
  %37 = add i64 %pgocount11, 1
  store i64 %37, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 11)
  br label %for.inc54

for.inc54:                                        ; preds = %for.cond1.preheader.for.inc54_crit_edge, %for.inc54.loopexit, %for.cond31.preheader.lr.ph
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, %wide.trip.count41
  br i1 %exitcond42, label %for.end56.loopexit, label %for.cond1.preheader

for.end56.loopexit:                               ; preds = %for.inc54
  %pgocount12 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 13)
  %38 = add i64 %pgocount12, 1
  store i64 %38, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 13)
  br label %for.end56

for.end56:                                        ; preds = %for.end56.loopexit, %entry
  %pgocount13 = load i64, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 12)
  %39 = add i64 %pgocount13, 1
  store i64 %39, i64* getelementptr inbounds ([14 x i64], [14 x i64]* @__profc_B.ll_kernel_lu, i64 0, i64 12)
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [2000 x double]* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
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
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %9) #6
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us.if.end.us_crit_edge, %if.then.us
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv7, i64 %indvars.iv
  %11 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %11) #6
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
