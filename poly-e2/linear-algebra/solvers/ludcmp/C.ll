; ModuleID = 'B.ll'
source_filename = "ludcmp.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

$__llvm_profile_raw_version = comdat any

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"x\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@__llvm_profile_raw_version = constant i64 72057594037927940, comdat
@__profn_main = private constant [4 x i8] c"main"
@__profn_B.ll_init_array = private constant [15 x i8] c"B.ll:init_array"
@__profn_B.ll_kernel_ludcmp = private constant [18 x i8] c"B.ll:kernel_ludcmp"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 32414643582, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [28 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 342419009206, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 28, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_ludcmp = private global [28 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_ludcmp = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2723921114217419270, i64 333193982551, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i32 0, i32 0), i8* null, i8* null, i32 28, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 49239513432, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [58 x i8] c"8\00main\01B.ll:init_array\01B.ll:kernel_ludcmp\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_ludcmp to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([58 x i8], [58 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %arraydecay = bitcast i8* %call to [2000 x double]*
  %arraydecay4 = bitcast i8* %call1 to double*
  %arraydecay5 = bitcast i8* %call2 to double*
  %arraydecay6 = bitcast i8* %call3 to double*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_ludcmp(i32 2000, [2000 x double]* %arraydecay, double* %arraydecay4, double* %arraydecay5, double* %arraydecay6)
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
  tail call fastcc void @print_array(i32 2000, double* %arraydecay5)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %3 = add i64 %pgocount2, 1
  store i64 %3, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %n, [2000 x double]* nocapture %A, double* nocapture %b, double* nocapture %x, double* nocapture %y) unnamed_addr #0 {
entry:
  %conv = sitofp i32 %n to double
  %cmp42 = icmp sgt i32 %n, 0
  br i1 %cmp42, label %for.body.preheader, label %for.end46.thread

for.body.preheader:                               ; preds = %entry
  %pgocount = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 16)
  %0 = add i64 %pgocount, 1
  store i64 %0, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 16)
  %xtraiter101 = and i32 %n, 1
  %lcmp.mod102 = icmp eq i32 %xtraiter101, 0
  br i1 %lcmp.mod102, label %for.body.prol.loopexit, label %for.body.prol

for.body.prol:                                    ; preds = %for.body.preheader
  %pgocount1 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 19)
  %1 = add i64 %pgocount1, 1
  store i64 %1, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 19)
  store double 0.000000e+00, double* %x, align 8
  store double 0.000000e+00, double* %y, align 8
  %div.prol = fdiv double 1.000000e+00, %conv
  %div5.prol = fmul double %div.prol, 5.000000e-01
  %add6.prol = fadd double %div5.prol, 4.000000e+00
  store double %add6.prol, double* %b, align 8
  br label %for.body.prol.loopexit

for.body.prol.loopexit:                           ; preds = %for.body.prol, %for.body.preheader
  %indvars.iv95.unr = phi i64 [ 0, %for.body.preheader ], [ 1, %for.body.prol ]
  %2 = icmp eq i32 %n, 1
  br i1 %2, label %for.cond13.preheader.preheader, label %for.body.preheader117

for.body.preheader117:                            ; preds = %for.body.prol.loopexit
  %wide.trip.count97.1 = zext i32 %n to i64
  br label %for.body

for.cond9.preheader:                              ; preds = %for.body
  %pgocount2 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 20)
  %3 = add i64 %pgocount2, 1
  store i64 %3, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 20)
  %cmp1040 = icmp sgt i32 %n, 0
  br i1 %cmp1040, label %for.cond13.preheader.preheader, label %for.end46.thread

for.cond13.preheader.preheader:                   ; preds = %for.cond9.preheader, %for.body.prol.loopexit
  %4 = add i32 %n, -2
  %5 = zext i32 %4 to i64
  %6 = sext i32 %n to i64
  %wide.trip.count93 = zext i32 %n to i64
  br label %for.body16.lr.ph

for.body:                                         ; preds = %for.body.for.body_crit_edge, %for.body.preheader117
  %indvars.iv95 = phi i64 [ %indvars.iv.next96.1, %for.body.for.body_crit_edge ], [ %indvars.iv95.unr, %for.body.preheader117 ]
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv95
  store double 0.000000e+00, double* %arrayidx, align 8
  %arrayidx3 = getelementptr inbounds double, double* %y, i64 %indvars.iv95
  store double 0.000000e+00, double* %arrayidx3, align 8
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %7 = trunc i64 %indvars.iv.next96 to i32
  %conv4 = sitofp i32 %7 to double
  %div = fdiv double %conv4, %conv
  %div5 = fmul double %div, 5.000000e-01
  %add6 = fadd double %div5, 4.000000e+00
  %arrayidx8 = getelementptr inbounds double, double* %b, i64 %indvars.iv95
  store double %add6, double* %arrayidx8, align 8
  %arrayidx.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next96
  store double 0.000000e+00, double* %arrayidx.1, align 8
  %arrayidx3.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next96
  store double 0.000000e+00, double* %arrayidx3.1, align 8
  %indvars.iv.next96.1 = add nsw i64 %indvars.iv95, 2
  %8 = trunc i64 %indvars.iv.next96.1 to i32
  %conv4.1 = sitofp i32 %8 to double
  %div.1 = fdiv double %conv4.1, %conv
  %div5.1 = fmul double %div.1, 5.000000e-01
  %add6.1 = fadd double %div5.1, 4.000000e+00
  %arrayidx8.1 = getelementptr inbounds double, double* %b, i64 %indvars.iv.next96
  store double %add6.1, double* %arrayidx8.1, align 8
  %exitcond98.1 = icmp eq i64 %indvars.iv.next96.1, %wide.trip.count97.1
  br i1 %exitcond98.1, label %for.cond9.preheader, label %for.body.for.body_crit_edge

for.body.for.body_crit_edge:                      ; preds = %for.body
  %pgocount3 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %9 = add i64 %pgocount3, 1
  store i64 %9, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  br label %for.body

for.body16.lr.ph:                                 ; preds = %for.end39, %for.cond13.preheader.preheader
  %indvars.iv91 = phi i64 [ 0, %for.cond13.preheader.preheader ], [ %indvars.iv.next92, %for.end39 ]
  %indvars.iv89 = phi i64 [ 1, %for.cond13.preheader.preheader ], [ %indvars.iv.next90, %for.end39 ]
  %10 = mul nuw nsw i64 %indvars.iv91, 2001
  %11 = add nuw nsw i64 %10, 1
  %scevgep87 = getelementptr [2000 x double], [2000 x double]* %A, i64 0, i64 %11
  %scevgep8788 = bitcast double* %scevgep87 to i8*
  %12 = sub i64 %5, %indvars.iv91
  %13 = shl i64 %12, 3
  %14 = and i64 %13, 34359738360
  %15 = add nuw nsw i64 %14, 8
  br label %for.body16

for.cond29.preheader:                             ; preds = %for.body16
  %pgocount4 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 11)
  %16 = add i64 %pgocount4, 1
  store i64 %16, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 11)
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %cmp3038 = icmp slt i64 %indvars.iv.next92, %6
  br i1 %cmp3038, label %for.end39.loopexit, label %for.end39

for.body16:                                       ; preds = %for.body16.for.body16_crit_edge, %for.body16.lr.ph
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %for.body16.for.body16_crit_edge ], [ 0, %for.body16.lr.ph ]
  %17 = sub nsw i64 0, %indvars.iv74
  %18 = trunc i64 %17 to i32
  %rem = srem i32 %18, %n
  %conv17 = sitofp i32 %rem to double
  %div19 = fdiv double %conv17, %conv
  %add20 = fadd double %div19, 1.000000e+00
  %arrayidx24 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv91, i64 %indvars.iv74
  store double %add20, double* %arrayidx24, align 8
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond80 = icmp eq i64 %indvars.iv.next75, %indvars.iv89
  br i1 %exitcond80, label %for.cond29.preheader, label %for.body16.for.body16_crit_edge

for.body16.for.body16_crit_edge:                  ; preds = %for.body16
  %pgocount5 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %19 = add i64 %pgocount5, 1
  store i64 %19, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  br label %for.body16

for.end39.loopexit:                               ; preds = %for.cond29.preheader
  %pgocount6 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 13)
  %20 = add i64 %pgocount6, 1
  store i64 %20, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 13)
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep8788, i8 0, i64 %15, i32 8, i1 false)
  br label %for.end39

for.end39:                                        ; preds = %for.end39.loopexit, %for.cond29.preheader
  %arrayidx43 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv91, i64 %indvars.iv91
  store double 1.000000e+00, double* %arrayidx43, align 8
  %indvars.iv.next90 = add nuw nsw i64 %indvars.iv89, 1
  %exitcond94 = icmp eq i64 %indvars.iv.next92, %wide.trip.count93
  br i1 %exitcond94, label %for.end46, label %for.body16.lr.ph

for.end46.thread:                                 ; preds = %for.cond9.preheader, %entry
  %pgocount7 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 18)
  %21 = add i64 %pgocount7, 1
  store i64 %21, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 18)
  %call106 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %for.end120

for.end46:                                        ; preds = %for.end39
  %pgocount8 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 17)
  %22 = add i64 %pgocount8, 1
  store i64 %22, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 17)
  %call = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %23 = bitcast i8* %call to [2000 x [2000 x double]]*
  %cmp4833 = icmp sgt i32 %n, 0
  br i1 %cmp4833, label %for.cond51.preheader.us.preheader, label %for.end120

for.cond51.preheader.us.preheader:                ; preds = %for.end46
  %pgocount9 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 21)
  %24 = add i64 %pgocount9, 1
  store i64 %24, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 21)
  %25 = add i32 %n, -1
  %26 = zext i32 %25 to i64
  %27 = shl nuw nsw i64 %26, 3
  %28 = add nuw nsw i64 %27, 8
  %xtraiter71 = and i32 %n, 3
  %lcmp.mod72 = icmp eq i32 %xtraiter71, 0
  br i1 %lcmp.mod72, label %for.cond51.preheader.us.prol.loopexit, label %for.cond51.for.inc62_crit_edge.us.prol.preheader

for.cond51.for.inc62_crit_edge.us.prol.preheader: ; preds = %for.cond51.preheader.us.preheader
  br label %for.cond51.for.inc62_crit_edge.us.prol

for.cond51.for.inc62_crit_edge.us.prol:           ; preds = %for.cond51.for.inc62_crit_edge.us.prol.for.cond51.for.inc62_crit_edge.us.prol_crit_edge, %for.cond51.for.inc62_crit_edge.us.prol.preheader
  %indvars.iv67.prol = phi i64 [ %indvars.iv.next68.prol, %for.cond51.for.inc62_crit_edge.us.prol.for.cond51.for.inc62_crit_edge.us.prol_crit_edge ], [ 0, %for.cond51.for.inc62_crit_edge.us.prol.preheader ]
  %prol.iter73 = phi i32 [ %prol.iter73.sub, %for.cond51.for.inc62_crit_edge.us.prol.for.cond51.for.inc62_crit_edge.us.prol_crit_edge ], [ %xtraiter71, %for.cond51.for.inc62_crit_edge.us.prol.preheader ]
  %29 = mul nuw nsw i64 %indvars.iv67.prol, 16000
  %scevgep.prol = getelementptr i8, i8* %call, i64 %29
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol, i8 0, i64 %28, i32 8, i1 false)
  %indvars.iv.next68.prol = add nuw nsw i64 %indvars.iv67.prol, 1
  %prol.iter73.sub = add i32 %prol.iter73, -1
  %prol.iter73.cmp = icmp eq i32 %prol.iter73.sub, 0
  br i1 %prol.iter73.cmp, label %for.cond51.preheader.us.prol.loopexit.loopexit, label %for.cond51.for.inc62_crit_edge.us.prol.for.cond51.for.inc62_crit_edge.us.prol_crit_edge, !llvm.loop !1

for.cond51.for.inc62_crit_edge.us.prol.for.cond51.for.inc62_crit_edge.us.prol_crit_edge: ; preds = %for.cond51.for.inc62_crit_edge.us.prol
  %pgocount10 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %30 = add i64 %pgocount10, 1
  store i64 %30, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  br label %for.cond51.for.inc62_crit_edge.us.prol

for.cond51.preheader.us.prol.loopexit.loopexit:   ; preds = %for.cond51.for.inc62_crit_edge.us.prol
  %pgocount11 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 23)
  %31 = add i64 %pgocount11, 1
  store i64 %31, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 23)
  br label %for.cond51.preheader.us.prol.loopexit

for.cond51.preheader.us.prol.loopexit:            ; preds = %for.cond51.preheader.us.prol.loopexit.loopexit, %for.cond51.preheader.us.preheader
  %indvars.iv67.unr = phi i64 [ 0, %for.cond51.preheader.us.preheader ], [ %indvars.iv.next68.prol, %for.cond51.preheader.us.prol.loopexit.loopexit ]
  %32 = icmp ult i32 %25, 3
  br i1 %32, label %for.cond69.preheader.lr.ph, label %for.cond51.for.inc62_crit_edge.us.3.preheader

for.cond51.for.inc62_crit_edge.us.3.preheader:    ; preds = %for.cond51.preheader.us.prol.loopexit
  %pgocount12 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 24)
  %33 = add i64 %pgocount12, 1
  store i64 %33, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 24)
  %wide.trip.count69.3 = zext i32 %n to i64
  %34 = add nsw i64 %wide.trip.count69.3, -4
  %35 = sub i64 %34, %indvars.iv67.unr
  %36 = lshr i64 %35, 2
  %37 = and i64 %36, 1
  %lcmp.mod119 = icmp eq i64 %37, 0
  br i1 %lcmp.mod119, label %for.cond51.for.inc62_crit_edge.us.3.prol.preheader, label %for.cond51.for.inc62_crit_edge.us.3.prol.loopexit

for.cond51.for.inc62_crit_edge.us.3.prol.preheader: ; preds = %for.cond51.for.inc62_crit_edge.us.3.preheader
  %pgocount13 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 27)
  %38 = add i64 %pgocount13, 1
  store i64 %38, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 27)
  br label %for.cond51.for.inc62_crit_edge.us.3.prol

for.cond51.for.inc62_crit_edge.us.3.prol:         ; preds = %for.cond51.for.inc62_crit_edge.us.3.prol.preheader
  %39 = mul nuw nsw i64 %indvars.iv67.unr, 16000
  %scevgep.prol121 = getelementptr i8, i8* %call, i64 %39
  call void @llvm.memset.p0i8.i64(i8* %scevgep.prol121, i8 0, i64 %28, i32 8, i1 false)
  %40 = mul i64 %indvars.iv67.unr, 16000
  %41 = add i64 %40, 16000
  %scevgep.1.prol = getelementptr i8, i8* %call, i64 %41
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.prol, i8 0, i64 %28, i32 8, i1 false)
  %42 = mul i64 %indvars.iv67.unr, 16000
  %43 = add i64 %42, 32000
  %scevgep.2.prol = getelementptr i8, i8* %call, i64 %43
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.prol, i8 0, i64 %28, i32 8, i1 false)
  %44 = mul i64 %indvars.iv67.unr, 16000
  %45 = add i64 %44, 48000
  %scevgep.3.prol = getelementptr i8, i8* %call, i64 %45
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.prol, i8 0, i64 %28, i32 8, i1 false)
  %indvars.iv.next68.3.prol = add nsw i64 %indvars.iv67.unr, 4
  br label %for.cond51.for.inc62_crit_edge.us.3.prol.loopexit

for.cond51.for.inc62_crit_edge.us.3.prol.loopexit: ; preds = %for.cond51.for.inc62_crit_edge.us.3.prol, %for.cond51.for.inc62_crit_edge.us.3.preheader
  %indvars.iv67.unr122 = phi i64 [ %indvars.iv67.unr, %for.cond51.for.inc62_crit_edge.us.3.preheader ], [ %indvars.iv.next68.3.prol, %for.cond51.for.inc62_crit_edge.us.3.prol ]
  %46 = icmp eq i64 %36, 0
  br i1 %46, label %for.cond65.preheader, label %for.cond51.for.inc62_crit_edge.us.3.preheader.new

for.cond51.for.inc62_crit_edge.us.3.preheader.new: ; preds = %for.cond51.for.inc62_crit_edge.us.3.prol.loopexit
  br label %for.cond51.for.inc62_crit_edge.us.3

for.cond65.preheader.unr-lcssa:                   ; preds = %for.cond51.for.inc62_crit_edge.us.3
  %pgocount14 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 26)
  %47 = add i64 %pgocount14, 1
  store i64 %47, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 26)
  br label %for.cond65.preheader

for.cond65.preheader:                             ; preds = %for.cond65.preheader.unr-lcssa, %for.cond51.for.inc62_crit_edge.us.3.prol.loopexit
  %cmp669 = icmp sgt i32 %n, 0
  br i1 %cmp669, label %for.cond69.preheader.lr.ph, label %for.end120

for.cond69.preheader.lr.ph:                       ; preds = %for.cond65.preheader, %for.cond51.preheader.us.prol.loopexit
  %xtraiter53 = and i32 %n, 1
  %lcmp.mod54 = icmp eq i32 %xtraiter53, 0
  %48 = icmp eq i32 %n, 1
  %wide.trip.count57 = zext i32 %n to i64
  %wide.trip.count51.1 = zext i32 %n to i64
  %wide.trip.count61 = zext i32 %n to i64
  br label %for.cond73.preheader.us.us.preheader

for.cond73.preheader.us.us.preheader:             ; preds = %for.cond69.for.inc96_crit_edge.us, %for.cond69.preheader.lr.ph
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %for.cond69.for.inc96_crit_edge.us ], [ 0, %for.cond69.preheader.lr.ph ]
  %arrayidx84.us.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv59
  br label %for.cond73.preheader.us.us

for.cond69.for.inc96_crit_edge.us:                ; preds = %for.cond73.for.inc93_crit_edge.us.us
  %pgocount15 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 12)
  %49 = add i64 %pgocount15, 1
  store i64 %49, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 12)
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next60, %wide.trip.count61
  br i1 %exitcond62, label %for.cond99.preheader, label %for.cond73.preheader.us.us.preheader

for.cond73.preheader.us.us:                       ; preds = %for.cond73.for.inc93_crit_edge.us.us, %for.cond73.preheader.us.us.preheader
  %indvars.iv55 = phi i64 [ 0, %for.cond73.preheader.us.us.preheader ], [ %indvars.iv.next56, %for.cond73.for.inc93_crit_edge.us.us ]
  %arrayidx80.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv55, i64 %indvars.iv59
  br i1 %lcmp.mod54, label %for.body76.us.us.prol.loopexit, label %for.body76.us.us.prol

for.body76.us.us.prol:                            ; preds = %for.cond73.preheader.us.us
  %pgocount16 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  %50 = add i64 %pgocount16, 1
  store i64 %50, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 9)
  %51 = load double, double* %arrayidx80.us.us, align 8
  %52 = load double, double* %arrayidx84.us.us.prol, align 8
  %mul.us.us.prol = fmul double %51, %52
  %arrayidx88.us.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %23, i64 0, i64 %indvars.iv55, i64 0
  %53 = load double, double* %arrayidx88.us.us.prol, align 8
  %add89.us.us.prol = fadd double %53, %mul.us.us.prol
  store double %add89.us.us.prol, double* %arrayidx88.us.us.prol, align 8
  br label %for.body76.us.us.prol.loopexit

for.body76.us.us.prol.loopexit:                   ; preds = %for.body76.us.us.prol, %for.cond73.preheader.us.us
  %indvars.iv49.unr.ph = phi i64 [ 1, %for.body76.us.us.prol ], [ 0, %for.cond73.preheader.us.us ]
  br i1 %48, label %for.body76.us.us.prol.loopexit.for.cond73.for.inc93_crit_edge.us.us_crit_edge, label %for.body76.us.us.preheader

for.body76.us.us.prol.loopexit.for.cond73.for.inc93_crit_edge.us.us_crit_edge: ; preds = %for.body76.us.us.prol.loopexit
  %pgocount17 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %54 = add i64 %pgocount17, 1
  store i64 %54, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  br label %for.cond73.for.inc93_crit_edge.us.us

for.body76.us.us.preheader:                       ; preds = %for.body76.us.us.prol.loopexit
  br label %for.body76.us.us

for.cond73.for.inc93_crit_edge.us.us.loopexit:    ; preds = %for.body76.us.us
  %pgocount18 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 10)
  %55 = add i64 %pgocount18, 1
  store i64 %55, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 10)
  br label %for.cond73.for.inc93_crit_edge.us.us

for.cond73.for.inc93_crit_edge.us.us:             ; preds = %for.body76.us.us.prol.loopexit.for.cond73.for.inc93_crit_edge.us.us_crit_edge, %for.cond73.for.inc93_crit_edge.us.us.loopexit
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next56, %wide.trip.count57
  br i1 %exitcond58, label %for.cond69.for.inc96_crit_edge.us, label %for.cond73.preheader.us.us

for.body76.us.us:                                 ; preds = %for.body76.us.us.for.body76.us.us_crit_edge, %for.body76.us.us.preheader
  %indvars.iv49 = phi i64 [ %indvars.iv.next50.1, %for.body76.us.us.for.body76.us.us_crit_edge ], [ %indvars.iv49.unr.ph, %for.body76.us.us.preheader ]
  %56 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv49, i64 %indvars.iv59
  %57 = load double, double* %arrayidx84.us.us, align 8
  %mul.us.us = fmul double %56, %57
  %arrayidx88.us.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %23, i64 0, i64 %indvars.iv55, i64 %indvars.iv49
  %58 = load double, double* %arrayidx88.us.us, align 8
  %add89.us.us = fadd double %58, %mul.us.us
  store double %add89.us.us, double* %arrayidx88.us.us, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %59 = load double, double* %arrayidx80.us.us, align 8
  %arrayidx84.us.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next50, i64 %indvars.iv59
  %60 = load double, double* %arrayidx84.us.us.1, align 8
  %mul.us.us.1 = fmul double %59, %60
  %arrayidx88.us.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %23, i64 0, i64 %indvars.iv55, i64 %indvars.iv.next50
  %61 = load double, double* %arrayidx88.us.us.1, align 8
  %add89.us.us.1 = fadd double %61, %mul.us.us.1
  store double %add89.us.us.1, double* %arrayidx88.us.us.1, align 8
  %indvars.iv.next50.1 = add nsw i64 %indvars.iv49, 2
  %exitcond52.1 = icmp eq i64 %indvars.iv.next50.1, %wide.trip.count51.1
  br i1 %exitcond52.1, label %for.cond73.for.inc93_crit_edge.us.us.loopexit, label %for.body76.us.us.for.body76.us.us_crit_edge

for.body76.us.us.for.body76.us.us_crit_edge:      ; preds = %for.body76.us.us
  %pgocount19 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %62 = add i64 %pgocount19, 1
  store i64 %62, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  br label %for.body76.us.us

for.cond99.preheader:                             ; preds = %for.cond69.for.inc96_crit_edge.us
  %pgocount20 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 22)
  %63 = add i64 %pgocount20, 1
  store i64 %63, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 22)
  %cmp1003 = icmp sgt i32 %n, 0
  br i1 %cmp1003, label %for.cond103.preheader.us.preheader, label %for.end120

for.cond103.preheader.us.preheader:               ; preds = %for.cond99.preheader
  %pgocount21 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 25)
  %64 = add i64 %pgocount21, 1
  store i64 %64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 25)
  %65 = add i32 %n, -1
  %xtraiter = and i32 %n, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %66 = icmp ult i32 %65, 3
  %wide.trip.count48 = zext i32 %n to i64
  %wide.trip.count.3 = zext i32 %n to i64
  br label %for.cond103.preheader.us

for.cond103.preheader.us:                         ; preds = %for.cond103.for.inc118_crit_edge.us, %for.cond103.preheader.us.preheader
  %indvars.iv46 = phi i64 [ 0, %for.cond103.preheader.us.preheader ], [ %indvars.iv.next47, %for.cond103.for.inc118_crit_edge.us ]
  br i1 %lcmp.mod, label %for.cond103.preheader.us.for.body106.us.prol.loopexit_crit_edge, label %for.body106.us.prol.preheader

for.cond103.preheader.us.for.body106.us.prol.loopexit_crit_edge: ; preds = %for.cond103.preheader.us
  %pgocount22 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  %67 = add i64 %pgocount22, 1
  store i64 %67, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 8)
  br label %for.body106.us.prol.loopexit

for.body106.us.prol.preheader:                    ; preds = %for.cond103.preheader.us
  br label %for.body106.us.prol

for.body106.us.prol:                              ; preds = %for.body106.us.prol.for.body106.us.prol_crit_edge, %for.body106.us.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body106.us.prol.for.body106.us.prol_crit_edge ], [ 0, %for.body106.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body106.us.prol.for.body106.us.prol_crit_edge ], [ %xtraiter, %for.body106.us.prol.preheader ]
  %arrayidx110.us.prol = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %23, i64 0, i64 %indvars.iv46, i64 %indvars.iv.prol
  %68 = bitcast double* %arrayidx110.us.prol to i64*
  %69 = load i64, i64* %68, align 8
  %arrayidx114.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv.prol
  %70 = bitcast double* %arrayidx114.us.prol to i64*
  store i64 %69, i64* %70, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body106.us.prol.loopexit.loopexit, label %for.body106.us.prol.for.body106.us.prol_crit_edge, !llvm.loop !3

for.body106.us.prol.for.body106.us.prol_crit_edge: ; preds = %for.body106.us.prol
  %pgocount23 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %71 = add i64 %pgocount23, 1
  store i64 %71, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  br label %for.body106.us.prol

for.body106.us.prol.loopexit.loopexit:            ; preds = %for.body106.us.prol
  %pgocount24 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 14)
  %72 = add i64 %pgocount24, 1
  store i64 %72, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 14)
  br label %for.body106.us.prol.loopexit

for.body106.us.prol.loopexit:                     ; preds = %for.cond103.preheader.us.for.body106.us.prol.loopexit_crit_edge, %for.body106.us.prol.loopexit.loopexit
  %indvars.iv.unr = phi i64 [ 0, %for.cond103.preheader.us.for.body106.us.prol.loopexit_crit_edge ], [ %indvars.iv.next.prol, %for.body106.us.prol.loopexit.loopexit ]
  br i1 %66, label %for.cond103.for.inc118_crit_edge.us, label %for.body106.us.preheader

for.body106.us.preheader:                         ; preds = %for.body106.us.prol.loopexit
  br label %for.body106.us

for.body106.us:                                   ; preds = %for.body106.us.for.body106.us_crit_edge, %for.body106.us.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body106.us.for.body106.us_crit_edge ], [ %indvars.iv.unr, %for.body106.us.preheader ]
  %arrayidx110.us = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %23, i64 0, i64 %indvars.iv46, i64 %indvars.iv
  %73 = bitcast double* %arrayidx110.us to i64*
  %74 = load i64, i64* %73, align 8
  %arrayidx114.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv
  %75 = bitcast double* %arrayidx114.us to i64*
  store i64 %74, i64* %75, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx110.us.1 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %23, i64 0, i64 %indvars.iv46, i64 %indvars.iv.next
  %76 = bitcast double* %arrayidx110.us.1 to i64*
  %77 = load i64, i64* %76, align 8
  %arrayidx114.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv.next
  %78 = bitcast double* %arrayidx114.us.1 to i64*
  store i64 %77, i64* %78, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx110.us.2 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %23, i64 0, i64 %indvars.iv46, i64 %indvars.iv.next.1
  %79 = bitcast double* %arrayidx110.us.2 to i64*
  %80 = load i64, i64* %79, align 8
  %arrayidx114.us.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv.next.1
  %81 = bitcast double* %arrayidx114.us.2 to i64*
  store i64 %80, i64* %81, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx110.us.3 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %23, i64 0, i64 %indvars.iv46, i64 %indvars.iv.next.2
  %82 = bitcast double* %arrayidx110.us.3 to i64*
  %83 = load i64, i64* %82, align 8
  %arrayidx114.us.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv46, i64 %indvars.iv.next.2
  %84 = bitcast double* %arrayidx114.us.3 to i64*
  store i64 %83, i64* %84, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %for.cond103.for.inc118_crit_edge.us.loopexit, label %for.body106.us.for.body106.us_crit_edge

for.body106.us.for.body106.us_crit_edge:          ; preds = %for.body106.us
  %pgocount25 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %85 = add i64 %pgocount25, 1
  store i64 %85, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  br label %for.body106.us

for.cond103.for.inc118_crit_edge.us.loopexit:     ; preds = %for.body106.us
  %pgocount26 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 15)
  %86 = add i64 %pgocount26, 1
  store i64 %86, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 15)
  br label %for.cond103.for.inc118_crit_edge.us

for.cond103.for.inc118_crit_edge.us:              ; preds = %for.cond103.for.inc118_crit_edge.us.loopexit, %for.body106.us.prol.loopexit
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond = icmp eq i64 %indvars.iv.next47, %wide.trip.count48
  br i1 %exitcond, label %for.end120.loopexit, label %for.cond103.preheader.us

for.end120.loopexit:                              ; preds = %for.cond103.for.inc118_crit_edge.us
  br label %for.end120

for.end120:                                       ; preds = %for.end120.loopexit, %for.cond99.preheader, %for.cond65.preheader, %for.end46, %for.end46.thread
  %call108110116 = phi i8* [ %call, %for.cond99.preheader ], [ %call, %for.cond65.preheader ], [ %call, %for.end46 ], [ %call106, %for.end46.thread ], [ %call, %for.end120.loopexit ]
  tail call void @free(i8* %call108110116) #4
  ret void

for.cond51.for.inc62_crit_edge.us.3:              ; preds = %for.cond51.for.inc62_crit_edge.us.3.for.cond51.for.inc62_crit_edge.us.3_crit_edge, %for.cond51.for.inc62_crit_edge.us.3.preheader.new
  %indvars.iv67 = phi i64 [ %indvars.iv67.unr122, %for.cond51.for.inc62_crit_edge.us.3.preheader.new ], [ %indvars.iv.next68.3.1, %for.cond51.for.inc62_crit_edge.us.3.for.cond51.for.inc62_crit_edge.us.3_crit_edge ]
  %87 = mul nuw nsw i64 %indvars.iv67, 16000
  %scevgep = getelementptr i8, i8* %call, i64 %87
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 %28, i32 8, i1 false)
  %88 = mul i64 %indvars.iv67, 16000
  %89 = add i64 %88, 16000
  %scevgep.1 = getelementptr i8, i8* %call, i64 %89
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 %28, i32 8, i1 false)
  %90 = mul i64 %indvars.iv67, 16000
  %91 = add i64 %90, 32000
  %scevgep.2 = getelementptr i8, i8* %call, i64 %91
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 %28, i32 8, i1 false)
  %92 = mul i64 %indvars.iv67, 16000
  %93 = add i64 %92, 48000
  %scevgep.3 = getelementptr i8, i8* %call, i64 %93
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 %28, i32 8, i1 false)
  %indvars.iv.next68.3 = add nsw i64 %indvars.iv67, 4
  %94 = mul nuw nsw i64 %indvars.iv.next68.3, 16000
  %scevgep.1123 = getelementptr i8, i8* %call, i64 %94
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1123, i8 0, i64 %28, i32 8, i1 false)
  %95 = mul i64 %indvars.iv.next68.3, 16000
  %96 = add i64 %95, 16000
  %scevgep.1.1 = getelementptr i8, i8* %call, i64 %96
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1.1, i8 0, i64 %28, i32 8, i1 false)
  %97 = mul i64 %indvars.iv.next68.3, 16000
  %98 = add i64 %97, 32000
  %scevgep.2.1 = getelementptr i8, i8* %call, i64 %98
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2.1, i8 0, i64 %28, i32 8, i1 false)
  %99 = mul i64 %indvars.iv.next68.3, 16000
  %100 = add i64 %99, 48000
  %scevgep.3.1 = getelementptr i8, i8* %call, i64 %100
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3.1, i8 0, i64 %28, i32 8, i1 false)
  %indvars.iv.next68.3.1 = add nsw i64 %indvars.iv67, 8
  %exitcond70.3.1 = icmp eq i64 %indvars.iv.next68.3.1, %wide.trip.count69.3
  br i1 %exitcond70.3.1, label %for.cond65.preheader.unr-lcssa, label %for.cond51.for.inc62_crit_edge.us.3.for.cond51.for.inc62_crit_edge.us.3_crit_edge

for.cond51.for.inc62_crit_edge.us.3.for.cond51.for.inc62_crit_edge.us.3_crit_edge: ; preds = %for.cond51.for.inc62_crit_edge.us.3
  %pgocount27 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  %101 = add i64 %pgocount27, 1
  store i64 %101, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_init_array, i64 0, i64 7)
  br label %for.cond51.for.inc62_crit_edge.us.3
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_ludcmp(i32 %n, [2000 x double]* nocapture %A, double* nocapture readonly %b, double* nocapture %x, double* nocapture %y) unnamed_addr #2 {
entry:
  %cmp26 = icmp sgt i32 %n, 0
  br i1 %cmp26, label %for.cond1.preheader.preheader, label %for.end113

for.cond1.preheader.preheader:                    ; preds = %entry
  %wide.trip.count80 = zext i32 %n to i64
  %wide.trip.count74 = zext i32 %n to i64
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc58, %for.cond1.preheader.preheader
  %indvars.iv78 = phi i64 [ %indvars.iv.next79, %for.inc58 ], [ 0, %for.cond1.preheader.preheader ]
  %0 = add i64 %indvars.iv78, 4294967295
  %cmp218 = icmp sgt i64 %indvars.iv78, 0
  br i1 %cmp218, label %for.body3.preheader, label %for.cond1.preheader.for.inc58_crit_edge

for.cond1.preheader.for.inc58_crit_edge:          ; preds = %for.cond1.preheader
  %pgocount = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 8)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 8)
  br label %for.inc58

for.body3.preheader:                              ; preds = %for.cond1.preheader
  %arrayidx12.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv78, i64 0
  br label %for.body3

for.cond61.preheader:                             ; preds = %for.inc58
  %pgocount1 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 25)
  %2 = add i64 %pgocount1, 1
  store i64 %2, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 25)
  %cmp6212 = icmp sgt i32 %n, 0
  br i1 %cmp6212, label %for.body63.preheader, label %for.end113

for.body63.preheader:                             ; preds = %for.cond61.preheader
  %wide.trip.count46 = zext i32 %n to i64
  br label %for.body63

for.body30.lr.ph:                                 ; preds = %for.end
  %pgocount2 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 16)
  %3 = add i64 %pgocount2, 1
  store i64 %3, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 16)
  %cmp3620 = icmp sgt i64 %indvars.iv78, 0
  br i1 %cmp3620, label %for.body30.us.preheader, label %for.inc58

for.body30.us.preheader:                          ; preds = %for.body30.lr.ph
  %xtraiter6882 = and i64 %indvars.iv78, 1
  %lcmp.mod69 = icmp eq i64 %xtraiter6882, 0
  %4 = trunc i64 %0 to i32
  %5 = icmp eq i32 %4, 0
  %arrayidx41.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv78, i64 0
  br label %for.body30.us

for.body30.us:                                    ; preds = %for.cond35.for.end50_crit_edge.us, %for.body30.us.preheader
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %for.cond35.for.end50_crit_edge.us ], [ %indvars.iv78, %for.body30.us.preheader ]
  %arrayidx34.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv78, i64 %indvars.iv72
  %6 = load double, double* %arrayidx34.us, align 8
  br i1 %lcmp.mod69, label %for.inc48.us.prol.loopexit, label %for.inc48.us.prol

for.inc48.us.prol:                                ; preds = %for.body30.us
  %pgocount3 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 14)
  %7 = add i64 %pgocount3, 1
  store i64 %7, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 14)
  %8 = load double, double* %arrayidx41.us.prol, align 8
  %arrayidx45.us.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv72
  %9 = load double, double* %arrayidx45.us.prol, align 8
  %mul46.us.prol = fmul double %8, %9
  %sub47.us.prol = fsub double %6, %mul46.us.prol
  br label %for.inc48.us.prol.loopexit

for.inc48.us.prol.loopexit:                       ; preds = %for.inc48.us.prol, %for.body30.us
  %indvars.iv63.unr.ph = phi i64 [ 1, %for.inc48.us.prol ], [ 0, %for.body30.us ]
  %w.122.us.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ %6, %for.body30.us ]
  %sub47.us.lcssa.unr.ph = phi double [ %sub47.us.prol, %for.inc48.us.prol ], [ undef, %for.body30.us ]
  br i1 %5, label %for.inc48.us.prol.loopexit.for.cond35.for.end50_crit_edge.us_crit_edge, label %for.inc48.us.preheader

for.inc48.us.prol.loopexit.for.cond35.for.end50_crit_edge.us_crit_edge: ; preds = %for.inc48.us.prol.loopexit
  %pgocount4 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 5)
  %10 = add i64 %pgocount4, 1
  store i64 %10, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 5)
  br label %for.cond35.for.end50_crit_edge.us

for.inc48.us.preheader:                           ; preds = %for.inc48.us.prol.loopexit
  br label %for.inc48.us

for.inc48.us:                                     ; preds = %for.inc48.us.for.inc48.us_crit_edge, %for.inc48.us.preheader
  %indvars.iv63 = phi i64 [ %indvars.iv.next64.1, %for.inc48.us.for.inc48.us_crit_edge ], [ %indvars.iv63.unr.ph, %for.inc48.us.preheader ]
  %w.122.us = phi double [ %sub47.us.1, %for.inc48.us.for.inc48.us_crit_edge ], [ %w.122.us.unr.ph, %for.inc48.us.preheader ]
  %arrayidx41.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv78, i64 %indvars.iv63
  %11 = load double, double* %arrayidx41.us, align 8
  %arrayidx45.us = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv63, i64 %indvars.iv72
  %12 = load double, double* %arrayidx45.us, align 8
  %mul46.us = fmul double %11, %12
  %sub47.us = fsub double %w.122.us, %mul46.us
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %arrayidx41.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv78, i64 %indvars.iv.next64
  %13 = load double, double* %arrayidx41.us.1, align 8
  %arrayidx45.us.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next64, i64 %indvars.iv72
  %14 = load double, double* %arrayidx45.us.1, align 8
  %mul46.us.1 = fmul double %13, %14
  %sub47.us.1 = fsub double %sub47.us, %mul46.us.1
  %indvars.iv.next64.1 = add nsw i64 %indvars.iv63, 2
  %exitcond67.1 = icmp eq i64 %indvars.iv.next64.1, %indvars.iv78
  br i1 %exitcond67.1, label %for.cond35.for.end50_crit_edge.us.loopexit, label %for.inc48.us.for.inc48.us_crit_edge

for.inc48.us.for.inc48.us_crit_edge:              ; preds = %for.inc48.us
  %pgocount5 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 0)
  %15 = add i64 %pgocount5, 1
  store i64 %15, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 0)
  br label %for.inc48.us

for.cond35.for.end50_crit_edge.us.loopexit:       ; preds = %for.inc48.us
  %pgocount6 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 12)
  %16 = add i64 %pgocount6, 1
  store i64 %16, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 12)
  br label %for.cond35.for.end50_crit_edge.us

for.cond35.for.end50_crit_edge.us:                ; preds = %for.inc48.us.prol.loopexit.for.cond35.for.end50_crit_edge.us_crit_edge, %for.cond35.for.end50_crit_edge.us.loopexit
  %sub47.us.lcssa = phi double [ %sub47.us.lcssa.unr.ph, %for.inc48.us.prol.loopexit.for.cond35.for.end50_crit_edge.us_crit_edge ], [ %sub47.us.1, %for.cond35.for.end50_crit_edge.us.loopexit ]
  store double %sub47.us.lcssa, double* %arrayidx34.us, align 8
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond75 = icmp eq i64 %indvars.iv.next73, %wide.trip.count74
  br i1 %exitcond75, label %for.inc58.loopexit, label %for.body30.us

for.body3:                                        ; preds = %for.end, %for.body3.preheader
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %for.end ], [ 0, %for.body3.preheader ]
  %17 = add i64 %indvars.iv56, 4294967295
  %arrayidx5 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv78, i64 %indvars.iv56
  %18 = load double, double* %arrayidx5, align 8
  %cmp714 = icmp sgt i64 %indvars.iv56, 0
  br i1 %cmp714, label %for.inc.preheader, label %for.body3.for.end_crit_edge

for.body3.for.end_crit_edge:                      ; preds = %for.body3
  %pgocount7 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 3)
  %19 = add i64 %pgocount7, 1
  store i64 %19, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 3)
  br label %for.end

for.inc.preheader:                                ; preds = %for.body3
  %pgocount8 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 11)
  %20 = add i64 %pgocount8, 1
  store i64 %20, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 11)
  %xtraiter5283 = and i64 %indvars.iv56, 1
  %lcmp.mod53 = icmp eq i64 %xtraiter5283, 0
  br i1 %lcmp.mod53, label %for.inc.prol.loopexit, label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.preheader
  %pgocount9 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 15)
  %21 = add i64 %pgocount9, 1
  store i64 %21, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 15)
  %22 = load double, double* %arrayidx12.prol, align 8
  %arrayidx16.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 0, i64 %indvars.iv56
  %23 = load double, double* %arrayidx16.prol, align 8
  %mul.prol = fmul double %22, %23
  %sub.prol = fsub double %18, %mul.prol
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol, %for.inc.preheader
  %indvars.iv47.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.preheader ]
  %w.016.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ %18, %for.inc.preheader ]
  %sub.lcssa.unr.ph = phi double [ %sub.prol, %for.inc.prol ], [ undef, %for.inc.preheader ]
  %24 = trunc i64 %17 to i32
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %for.end, label %for.inc.preheader95

for.inc.preheader95:                              ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc.for.inc_crit_edge, %for.inc.preheader95
  %indvars.iv47 = phi i64 [ %indvars.iv.next48.1, %for.inc.for.inc_crit_edge ], [ %indvars.iv47.unr.ph, %for.inc.preheader95 ]
  %w.016 = phi double [ %sub.1, %for.inc.for.inc_crit_edge ], [ %w.016.unr.ph, %for.inc.preheader95 ]
  %arrayidx12 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv78, i64 %indvars.iv47
  %26 = load double, double* %arrayidx12, align 8
  %arrayidx16 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv47, i64 %indvars.iv56
  %27 = load double, double* %arrayidx16, align 8
  %mul = fmul double %26, %27
  %sub = fsub double %w.016, %mul
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %arrayidx12.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv78, i64 %indvars.iv.next48
  %28 = load double, double* %arrayidx12.1, align 8
  %arrayidx16.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next48, i64 %indvars.iv56
  %29 = load double, double* %arrayidx16.1, align 8
  %mul.1 = fmul double %28, %29
  %sub.1 = fsub double %sub, %mul.1
  %indvars.iv.next48.1 = add nsw i64 %indvars.iv47, 2
  %exitcond51.1 = icmp eq i64 %indvars.iv.next48.1, %indvars.iv56
  br i1 %exitcond51.1, label %for.end.loopexit, label %for.inc.for.inc_crit_edge

for.inc.for.inc_crit_edge:                        ; preds = %for.inc
  %pgocount10 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 1)
  %30 = add i64 %pgocount10, 1
  store i64 %30, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 1)
  br label %for.inc

for.end.loopexit:                                 ; preds = %for.inc
  %pgocount11 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 13)
  %31 = add i64 %pgocount11, 1
  store i64 %31, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 13)
  br label %for.end

for.end:                                          ; preds = %for.body3.for.end_crit_edge, %for.end.loopexit, %for.inc.prol.loopexit
  %w.0.lcssa = phi double [ %18, %for.body3.for.end_crit_edge ], [ %sub.lcssa.unr.ph, %for.inc.prol.loopexit ], [ %sub.1, %for.end.loopexit ]
  %arrayidx20 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv56, i64 %indvars.iv56
  %32 = load double, double* %arrayidx20, align 8
  %div = fdiv double %w.0.lcssa, %32
  store double %div, double* %arrayidx5, align 8
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next57, %indvars.iv78
  br i1 %exitcond61, label %for.body30.lr.ph, label %for.body3

for.inc58.loopexit:                               ; preds = %for.cond35.for.end50_crit_edge.us
  %pgocount12 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 17)
  %33 = add i64 %pgocount12, 1
  store i64 %33, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 17)
  br label %for.inc58

for.inc58:                                        ; preds = %for.cond1.preheader.for.inc58_crit_edge, %for.inc58.loopexit, %for.body30.lr.ph
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %exitcond81 = icmp eq i64 %indvars.iv.next79, %wide.trip.count80
  br i1 %exitcond81, label %for.cond61.preheader, label %for.cond1.preheader

for.cond86.preheader:                             ; preds = %for.end79
  %pgocount13 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 26)
  %34 = add i64 %pgocount13, 1
  store i64 %34, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 26)
  %cmp875 = icmp sgt i32 %n, 0
  br i1 %cmp875, label %for.body88.preheader, label %for.end113

for.body88.preheader:                             ; preds = %for.cond86.preheader
  %35 = sext i32 %n to i64
  br label %for.body88

for.body63:                                       ; preds = %for.end79, %for.body63.preheader
  %indvars.iv44 = phi i64 [ %indvars.iv.next45, %for.end79 ], [ 0, %for.body63.preheader ]
  %36 = add i64 %indvars.iv44, 4294967295
  %arrayidx65 = getelementptr inbounds double, double* %b, i64 %indvars.iv44
  %37 = load double, double* %arrayidx65, align 8
  %cmp678 = icmp sgt i64 %indvars.iv44, 0
  br i1 %cmp678, label %for.inc77.preheader, label %for.body63.for.end79_crit_edge

for.body63.for.end79_crit_edge:                   ; preds = %for.body63
  %pgocount14 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 9)
  %38 = add i64 %pgocount14, 1
  store i64 %38, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 9)
  br label %for.end79

for.inc77.preheader:                              ; preds = %for.body63
  %pgocount15 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 18)
  %39 = add i64 %pgocount15, 1
  store i64 %39, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 18)
  %40 = trunc i64 %indvars.iv44 to i32
  %xtraiter37 = and i32 %40, 3
  %lcmp.mod38 = icmp eq i32 %xtraiter37, 0
  br i1 %lcmp.mod38, label %for.inc77.prol.loopexit, label %for.inc77.prol.preheader

for.inc77.prol.preheader:                         ; preds = %for.inc77.preheader
  br label %for.inc77.prol

for.inc77.prol:                                   ; preds = %for.inc77.prol.for.inc77.prol_crit_edge, %for.inc77.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc77.prol.for.inc77.prol_crit_edge ], [ 0, %for.inc77.prol.preheader ]
  %w.210.prol = phi double [ %sub76.prol, %for.inc77.prol.for.inc77.prol_crit_edge ], [ %37, %for.inc77.prol.preheader ]
  %prol.iter40 = phi i32 [ %prol.iter40.sub, %for.inc77.prol.for.inc77.prol_crit_edge ], [ %xtraiter37, %for.inc77.prol.preheader ]
  %arrayidx72.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv44, i64 %indvars.iv.prol
  %41 = load double, double* %arrayidx72.prol, align 8
  %arrayidx74.prol = getelementptr inbounds double, double* %y, i64 %indvars.iv.prol
  %42 = load double, double* %arrayidx74.prol, align 8
  %mul75.prol = fmul double %41, %42
  %sub76.prol = fsub double %w.210.prol, %mul75.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter40.sub = add i32 %prol.iter40, -1
  %prol.iter40.cmp = icmp eq i32 %prol.iter40.sub, 0
  br i1 %prol.iter40.cmp, label %for.inc77.prol.loopexit.loopexit, label %for.inc77.prol.for.inc77.prol_crit_edge, !llvm.loop !4

for.inc77.prol.for.inc77.prol_crit_edge:          ; preds = %for.inc77.prol
  %pgocount16 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 2)
  %43 = add i64 %pgocount16, 1
  store i64 %43, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 2)
  br label %for.inc77.prol

for.inc77.prol.loopexit.loopexit:                 ; preds = %for.inc77.prol
  %pgocount17 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 19)
  %44 = add i64 %pgocount17, 1
  store i64 %44, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 19)
  br label %for.inc77.prol.loopexit

for.inc77.prol.loopexit:                          ; preds = %for.inc77.prol.loopexit.loopexit, %for.inc77.preheader
  %indvars.iv.unr = phi i64 [ 0, %for.inc77.preheader ], [ %indvars.iv.next.prol, %for.inc77.prol.loopexit.loopexit ]
  %w.210.unr = phi double [ %37, %for.inc77.preheader ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %sub76.lcssa.unr = phi double [ undef, %for.inc77.preheader ], [ %sub76.prol, %for.inc77.prol.loopexit.loopexit ]
  %45 = trunc i64 %36 to i32
  %46 = icmp ult i32 %45, 3
  br i1 %46, label %for.end79, label %for.inc77.preheader94

for.inc77.preheader94:                            ; preds = %for.inc77.prol.loopexit
  br label %for.inc77

for.inc77:                                        ; preds = %for.inc77.for.inc77_crit_edge, %for.inc77.preheader94
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc77.for.inc77_crit_edge ], [ %indvars.iv.unr, %for.inc77.preheader94 ]
  %w.210 = phi double [ %sub76.3, %for.inc77.for.inc77_crit_edge ], [ %w.210.unr, %for.inc77.preheader94 ]
  %arrayidx72 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv44, i64 %indvars.iv
  %47 = load double, double* %arrayidx72, align 8
  %arrayidx74 = getelementptr inbounds double, double* %y, i64 %indvars.iv
  %48 = load double, double* %arrayidx74, align 8
  %mul75 = fmul double %47, %48
  %sub76 = fsub double %w.210, %mul75
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx72.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv44, i64 %indvars.iv.next
  %49 = load double, double* %arrayidx72.1, align 8
  %arrayidx74.1 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next
  %50 = load double, double* %arrayidx74.1, align 8
  %mul75.1 = fmul double %49, %50
  %sub76.1 = fsub double %sub76, %mul75.1
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx72.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv44, i64 %indvars.iv.next.1
  %51 = load double, double* %arrayidx72.2, align 8
  %arrayidx74.2 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next.1
  %52 = load double, double* %arrayidx74.2, align 8
  %mul75.2 = fmul double %51, %52
  %sub76.2 = fsub double %sub76.1, %mul75.2
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx72.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv44, i64 %indvars.iv.next.2
  %53 = load double, double* %arrayidx72.3, align 8
  %arrayidx74.3 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next.2
  %54 = load double, double* %arrayidx74.3, align 8
  %mul75.3 = fmul double %53, %54
  %sub76.3 = fsub double %sub76.2, %mul75.3
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.341 = icmp eq i64 %indvars.iv.next.3, %indvars.iv44
  br i1 %exitcond.341, label %for.end79.loopexit, label %for.inc77.for.inc77_crit_edge

for.inc77.for.inc77_crit_edge:                    ; preds = %for.inc77
  %pgocount18 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 4)
  %55 = add i64 %pgocount18, 1
  store i64 %55, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 4)
  br label %for.inc77

for.end79.loopexit:                               ; preds = %for.inc77
  %pgocount19 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 20)
  %56 = add i64 %pgocount19, 1
  store i64 %56, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 20)
  br label %for.end79

for.end79:                                        ; preds = %for.body63.for.end79_crit_edge, %for.end79.loopexit, %for.inc77.prol.loopexit
  %w.2.lcssa = phi double [ %37, %for.body63.for.end79_crit_edge ], [ %sub76.lcssa.unr, %for.inc77.prol.loopexit ], [ %sub76.3, %for.end79.loopexit ]
  %arrayidx81 = getelementptr inbounds double, double* %y, i64 %indvars.iv44
  store double %w.2.lcssa, double* %arrayidx81, align 8
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond = icmp eq i64 %indvars.iv.next45, %wide.trip.count46
  br i1 %exitcond, label %for.cond86.preheader, label %for.body63

for.body88:                                       ; preds = %for.end104, %for.body88.preheader
  %indvars.iv33 = phi i64 [ %35, %for.body88.preheader ], [ %indvars.iv.next34, %for.end104 ]
  %indvar = phi i32 [ 0, %for.body88.preheader ], [ %indvar.next, %for.end104 ]
  %i.27.in = phi i32 [ %n, %for.body88.preheader ], [ %i.27, %for.end104 ]
  %57 = add nsw i32 %indvar, -1
  %indvars.iv.next34 = add nsw i64 %indvars.iv33, -1
  %i.27 = add nsw i32 %i.27.in, -1
  %arrayidx90 = getelementptr inbounds double, double* %y, i64 %indvars.iv.next34
  %58 = load double, double* %arrayidx90, align 8
  %cmp921 = icmp slt i32 %i.27.in, %n
  br i1 %cmp921, label %for.inc102.preheader, label %for.body88.for.end104_crit_edge

for.body88.for.end104_crit_edge:                  ; preds = %for.body88
  %pgocount20 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 10)
  %59 = add i64 %pgocount20, 1
  store i64 %59, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 10)
  br label %for.end104

for.inc102.preheader:                             ; preds = %for.body88
  %pgocount21 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 21)
  %60 = add i64 %pgocount21, 1
  store i64 %60, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 21)
  %xtraiter = and i32 %indvar, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc102.prol.loopexit, label %for.inc102.prol.preheader

for.inc102.prol.preheader:                        ; preds = %for.inc102.preheader
  br label %for.inc102.prol

for.inc102.prol:                                  ; preds = %for.inc102.prol.for.inc102.prol_crit_edge, %for.inc102.prol.preheader
  %indvars.iv31.prol = phi i64 [ %indvars.iv.next32.prol, %for.inc102.prol.for.inc102.prol_crit_edge ], [ %indvars.iv33, %for.inc102.prol.preheader ]
  %w.33.prol = phi double [ %sub101.prol, %for.inc102.prol.for.inc102.prol_crit_edge ], [ %58, %for.inc102.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc102.prol.for.inc102.prol_crit_edge ], [ %xtraiter, %for.inc102.prol.preheader ]
  %arrayidx97.prol = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next34, i64 %indvars.iv31.prol
  %61 = load double, double* %arrayidx97.prol, align 8
  %arrayidx99.prol = getelementptr inbounds double, double* %x, i64 %indvars.iv31.prol
  %62 = load double, double* %arrayidx99.prol, align 8
  %mul100.prol = fmul double %61, %62
  %sub101.prol = fsub double %w.33.prol, %mul100.prol
  %indvars.iv.next32.prol = add nsw i64 %indvars.iv31.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc102.prol.loopexit.loopexit, label %for.inc102.prol.for.inc102.prol_crit_edge, !llvm.loop !5

for.inc102.prol.for.inc102.prol_crit_edge:        ; preds = %for.inc102.prol
  %pgocount22 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 6)
  %63 = add i64 %pgocount22, 1
  store i64 %63, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 6)
  br label %for.inc102.prol

for.inc102.prol.loopexit.loopexit:                ; preds = %for.inc102.prol
  %pgocount23 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 22)
  %64 = add i64 %pgocount23, 1
  store i64 %64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 22)
  br label %for.inc102.prol.loopexit

for.inc102.prol.loopexit:                         ; preds = %for.inc102.prol.loopexit.loopexit, %for.inc102.preheader
  %indvars.iv31.unr = phi i64 [ %indvars.iv33, %for.inc102.preheader ], [ %indvars.iv.next32.prol, %for.inc102.prol.loopexit.loopexit ]
  %w.33.unr = phi double [ %58, %for.inc102.preheader ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %sub101.lcssa.unr = phi double [ undef, %for.inc102.preheader ], [ %sub101.prol, %for.inc102.prol.loopexit.loopexit ]
  %65 = icmp ult i32 %57, 3
  br i1 %65, label %for.end104, label %for.inc102.preheader93

for.inc102.preheader93:                           ; preds = %for.inc102.prol.loopexit
  br label %for.inc102

for.inc102:                                       ; preds = %for.inc102.for.inc102_crit_edge, %for.inc102.preheader93
  %indvars.iv31 = phi i64 [ %indvars.iv.next32.3, %for.inc102.for.inc102_crit_edge ], [ %indvars.iv31.unr, %for.inc102.preheader93 ]
  %w.33 = phi double [ %sub101.3, %for.inc102.for.inc102_crit_edge ], [ %w.33.unr, %for.inc102.preheader93 ]
  %arrayidx97 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next34, i64 %indvars.iv31
  %66 = load double, double* %arrayidx97, align 8
  %arrayidx99 = getelementptr inbounds double, double* %x, i64 %indvars.iv31
  %67 = load double, double* %arrayidx99, align 8
  %mul100 = fmul double %66, %67
  %sub101 = fsub double %w.33, %mul100
  %indvars.iv.next32 = add nsw i64 %indvars.iv31, 1
  %arrayidx97.1 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next34, i64 %indvars.iv.next32
  %68 = load double, double* %arrayidx97.1, align 8
  %arrayidx99.1 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next32
  %69 = load double, double* %arrayidx99.1, align 8
  %mul100.1 = fmul double %68, %69
  %sub101.1 = fsub double %sub101, %mul100.1
  %indvars.iv.next32.1 = add nsw i64 %indvars.iv31, 2
  %arrayidx97.2 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next34, i64 %indvars.iv.next32.1
  %70 = load double, double* %arrayidx97.2, align 8
  %arrayidx99.2 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next32.1
  %71 = load double, double* %arrayidx99.2, align 8
  %mul100.2 = fmul double %70, %71
  %sub101.2 = fsub double %sub101.1, %mul100.2
  %indvars.iv.next32.2 = add nsw i64 %indvars.iv31, 3
  %arrayidx97.3 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next34, i64 %indvars.iv.next32.2
  %72 = load double, double* %arrayidx97.3, align 8
  %arrayidx99.3 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next32.2
  %73 = load double, double* %arrayidx99.3, align 8
  %mul100.3 = fmul double %72, %73
  %sub101.3 = fsub double %sub101.2, %mul100.3
  %indvars.iv.next32.3 = add nsw i64 %indvars.iv31, 4
  %lftr.wideiv.3 = trunc i64 %indvars.iv.next32.3 to i32
  %exitcond.3 = icmp eq i32 %lftr.wideiv.3, %n
  br i1 %exitcond.3, label %for.end104.loopexit, label %for.inc102.for.inc102_crit_edge

for.inc102.for.inc102_crit_edge:                  ; preds = %for.inc102
  %pgocount24 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 7)
  %74 = add i64 %pgocount24, 1
  store i64 %74, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 7)
  br label %for.inc102

for.end104.loopexit:                              ; preds = %for.inc102
  %pgocount25 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 23)
  %75 = add i64 %pgocount25, 1
  store i64 %75, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 23)
  br label %for.end104

for.end104:                                       ; preds = %for.body88.for.end104_crit_edge, %for.end104.loopexit, %for.inc102.prol.loopexit
  %w.3.lcssa = phi double [ %58, %for.body88.for.end104_crit_edge ], [ %sub101.lcssa.unr, %for.inc102.prol.loopexit ], [ %sub101.3, %for.end104.loopexit ]
  %arrayidx108 = getelementptr inbounds [2000 x double], [2000 x double]* %A, i64 %indvars.iv.next34, i64 %indvars.iv.next34
  %76 = load double, double* %arrayidx108, align 8
  %div109 = fdiv double %w.3.lcssa, %76
  %arrayidx111 = getelementptr inbounds double, double* %x, i64 %indvars.iv.next34
  store double %div109, double* %arrayidx111, align 8
  %cmp87 = icmp sgt i64 %indvars.iv33, 1
  %indvar.next = add nuw nsw i32 %indvar, 1
  br i1 %cmp87, label %for.body88, label %for.end113.loopexit

for.end113.loopexit:                              ; preds = %for.end104
  %pgocount26 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 27)
  %77 = add i64 %pgocount26, 1
  store i64 %77, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 27)
  br label %for.end113

for.end113:                                       ; preds = %for.end113.loopexit, %for.cond86.preheader, %for.cond61.preheader, %entry
  %pgocount27 = load i64, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 24)
  %78 = add i64 %pgocount27, 1
  store i64 %78, i64* getelementptr inbounds ([28 x i64], [28 x i64]* @__profc_B.ll_kernel_ludcmp, i64 0, i64 24)
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, double* nocapture readonly %x) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp1 = icmp sgt i32 %n, 0
  br i1 %cmp1, label %for.body.preheader, label %for.end

for.body.preheader:                               ; preds = %entry
  %wide.trip.count = zext i32 %n to i64
  br label %for.body

for.body:                                         ; preds = %if.end, %for.body.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end ], [ 0, %for.body.preheader ]
  %3 = trunc i64 %indvars.iv to i32
  %rem = srem i32 %3, 20
  %cmp2 = icmp eq i32 %rem, 0
  br i1 %cmp2, label %if.then, label %for.body.if.end_crit_edge

for.body.if.end_crit_edge:                        ; preds = %for.body
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %4 = add i64 %pgocount, 1
  store i64 %4, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  br label %if.end

if.then:                                          ; preds = %for.body
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %5 = add i64 %pgocount1, 1
  store i64 %5, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %if.end

if.end:                                           ; preds = %for.body.if.end_crit_edge, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx = getelementptr inbounds double, double* %x, i64 %indvars.iv
  %8 = load double, double* %arrayidx, align 8
  %call4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.end.loopexit, label %for.body

for.end.loopexit:                                 ; preds = %if.end
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %9 = add i64 %pgocount2, 1
  store i64 %9, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %entry
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %10 = add i64 %pgocount3, 1
  store i64 %10, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %12) #6
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
!4 = distinct !{!4, !2}
!5 = distinct !{!5, !2}
