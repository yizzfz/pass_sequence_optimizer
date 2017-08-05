; ModuleID = 'B.ll'
source_filename = "heat-3d.c"
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
@__profn_B.ll_kernel_heat_3d = private constant [19 x i8] c"B.ll:kernel_heat_3d"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 32414643582, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [7 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 88325942582, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 7, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_heat_3d = private global [21 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_heat_3d = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2431518469571330303, i64 240297135670, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i32 0, i32 0), i8* null, i8* null, i32 21, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [6 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 73601809215, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 6, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [59 x i8] c"9\00main\01B.ll:init_array\01B.ll:kernel_heat_3d\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_heat_3d to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([59 x i8], [59 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %arraydecay = bitcast i8* %call to [120 x [120 x double]]*
  %arraydecay2 = bitcast i8* %call1 to [120 x [120 x double]]*
  tail call fastcc void @init_array(i32 120, [120 x [120 x double]]* %arraydecay, [120 x [120 x double]]* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_heat_3d(i32 120, [120 x [120 x double]]* %arraydecay, [120 x [120 x double]]* %arraydecay2)
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
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %3 = add i64 %pgocount2, 1
  store i64 %3, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, [120 x [120 x double]]* nocapture %A, [120 x [120 x double]]* nocapture %B) unnamed_addr #2 {
entry:
  %cmp6 = icmp sgt i32 %n, 0
  br i1 %cmp6, label %for.cond1.preheader.lr.ph, label %for.end24

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %conv8 = sitofp i32 %n to double
  %xtraiter = and i32 %n, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %0 = icmp eq i32 %n, 1
  %wide.trip.count34 = zext i32 %n to i64
  %wide.trip.count.1 = zext i32 %n to i64
  %wide.trip.count37 = zext i32 %n to i64
  br label %for.cond4.preheader.us.us.preheader

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.for.inc22_crit_edge.us, %for.cond1.preheader.lr.ph
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %for.cond1.for.inc22_crit_edge.us ], [ 0, %for.cond1.preheader.lr.ph ]
  %1 = trunc i64 %indvars.iv35 to i32
  %sub.us = add i32 %1, %n
  br label %for.cond4.preheader.us.us

for.cond1.for.inc22_crit_edge.us:                 ; preds = %for.cond4.for.inc19_crit_edge.us.us
  %pgocount = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %2 = add i64 %pgocount, 1
  store i64 %2, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 4)
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next36, %wide.trip.count37
  br i1 %exitcond38, label %for.end24.loopexit, label %for.cond4.preheader.us.us.preheader

for.cond4.preheader.us.us:                        ; preds = %for.cond4.for.inc19_crit_edge.us.us, %for.cond4.preheader.us.us.preheader
  %indvars.iv32 = phi i64 [ 0, %for.cond4.preheader.us.us.preheader ], [ %indvars.iv.next33, %for.cond4.for.inc19_crit_edge.us.us ]
  %3 = trunc i64 %indvars.iv32 to i32
  %add.us.us = add i32 %sub.us, %3
  br i1 %lcmp.mod, label %for.body6.us.us.prol.loopexit, label %for.body6.us.us.prol

for.body6.us.us.prol:                             ; preds = %for.cond4.preheader.us.us
  %pgocount1 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %4 = add i64 %pgocount1, 1
  store i64 %4, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %conv.us.us.prol = sitofp i32 %add.us.us to double
  %mul.us.us.prol = fmul double %conv.us.us.prol, 1.000000e+01
  %div.us.us.prol = fdiv double %mul.us.us.prol, %conv8
  %arrayidx12.us.us.prol = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv35, i64 %indvars.iv32, i64 0
  store double %div.us.us.prol, double* %arrayidx12.us.us.prol, align 8
  %arrayidx18.us.us.prol = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv35, i64 %indvars.iv32, i64 0
  store double %div.us.us.prol, double* %arrayidx18.us.us.prol, align 8
  br label %for.body6.us.us.prol.loopexit

for.body6.us.us.prol.loopexit:                    ; preds = %for.body6.us.us.prol, %for.cond4.preheader.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body6.us.us.prol ], [ 0, %for.cond4.preheader.us.us ]
  br i1 %0, label %for.body6.us.us.prol.loopexit.for.cond4.for.inc19_crit_edge.us.us_crit_edge, label %for.body6.us.us.preheader

for.body6.us.us.prol.loopexit.for.cond4.for.inc19_crit_edge.us.us_crit_edge: ; preds = %for.body6.us.us.prol.loopexit
  %pgocount2 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %5 = add i64 %pgocount2, 1
  store i64 %5, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  br label %for.cond4.for.inc19_crit_edge.us.us

for.body6.us.us.preheader:                        ; preds = %for.body6.us.us.prol.loopexit
  br label %for.body6.us.us

for.cond4.for.inc19_crit_edge.us.us.loopexit:     ; preds = %for.body6.us.us
  %pgocount3 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %6 = add i64 %pgocount3, 1
  store i64 %6, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  br label %for.cond4.for.inc19_crit_edge.us.us

for.cond4.for.inc19_crit_edge.us.us:              ; preds = %for.body6.us.us.prol.loopexit.for.cond4.for.inc19_crit_edge.us.us_crit_edge, %for.cond4.for.inc19_crit_edge.us.us.loopexit
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond = icmp eq i64 %indvars.iv.next33, %wide.trip.count34
  br i1 %exitcond, label %for.cond1.for.inc22_crit_edge.us, label %for.cond4.preheader.us.us

for.body6.us.us:                                  ; preds = %for.body6.us.us.for.body6.us.us_crit_edge, %for.body6.us.us.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body6.us.us.for.body6.us.us_crit_edge ], [ %indvars.iv.unr.ph, %for.body6.us.us.preheader ]
  %7 = trunc i64 %indvars.iv to i32
  %add7.us.us = sub i32 %add.us.us, %7
  %conv.us.us = sitofp i32 %add7.us.us to double
  %mul.us.us = fmul double %conv.us.us, 1.000000e+01
  %div.us.us = fdiv double %mul.us.us, %conv8
  %arrayidx12.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv35, i64 %indvars.iv32, i64 %indvars.iv
  store double %div.us.us, double* %arrayidx12.us.us, align 8
  %arrayidx18.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv35, i64 %indvars.iv32, i64 %indvars.iv
  store double %div.us.us, double* %arrayidx18.us.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %8 = trunc i64 %indvars.iv.next to i32
  %add7.us.us.1 = sub i32 %add.us.us, %8
  %conv.us.us.1 = sitofp i32 %add7.us.us.1 to double
  %mul.us.us.1 = fmul double %conv.us.us.1, 1.000000e+01
  %div.us.us.1 = fdiv double %mul.us.us.1, %conv8
  %arrayidx12.us.us.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv35, i64 %indvars.iv32, i64 %indvars.iv.next
  store double %div.us.us.1, double* %arrayidx12.us.us.1, align 8
  %arrayidx18.us.us.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv35, i64 %indvars.iv32, i64 %indvars.iv.next
  store double %div.us.us.1, double* %arrayidx18.us.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.cond4.for.inc19_crit_edge.us.us.loopexit, label %for.body6.us.us.for.body6.us.us_crit_edge

for.body6.us.us.for.body6.us.us_crit_edge:        ; preds = %for.body6.us.us
  %pgocount4 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %9 = add i64 %pgocount4, 1
  store i64 %9, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  br label %for.body6.us.us

for.end24.loopexit:                               ; preds = %for.cond1.for.inc22_crit_edge.us
  %pgocount5 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  %10 = add i64 %pgocount5, 1
  store i64 %10, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 6)
  br label %for.end24

for.end24:                                        ; preds = %for.end24.loopexit, %entry
  %pgocount6 = load i64, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  %11 = add i64 %pgocount6, 1
  store i64 %11, i64* getelementptr inbounds ([7 x i64], [7 x i64]* @__profc_B.ll_init_array, i64 0, i64 5)
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32 %n, [120 x [120 x double]]* nocapture %A, [120 x [120 x double]]* nocapture %B) unnamed_addr #2 {
entry:
  %sub = add nsw i32 %n, -1
  %cmp25 = icmp sgt i32 %sub, 1
  %cmp63 = icmp sgt i32 %sub, 1
  %wide.trip.count18 = zext i32 %sub to i64
  %wide.trip.count = zext i32 %sub to i64
  %wide.trip.count24 = zext i32 %sub to i64
  %cmp10311 = icmp sgt i32 %sub, 1
  %wide.trip.count34 = zext i32 %sub to i64
  %wide.trip.count29 = zext i32 %sub to i64
  %wide.trip.count40 = zext i32 %sub to i64
  %0 = add nsw i64 %wide.trip.count29, -1
  %min.iters.check62 = icmp ult i64 %0, 2
  %n.vec65 = and i64 %0, -2
  %cmp.zero66 = icmp eq i64 %n.vec65, 0
  %ind.end89 = or i64 %0, 1
  %cmp.n90 = icmp eq i64 %0, %n.vec65
  %min.iters.check = icmp ult i64 %0, 2
  %n.vec = and i64 %0, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %0, 1
  %cmp.n = icmp eq i64 %0, %n.vec
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc209, %entry
  %t.013 = phi i32 [ 1, %entry ], [ %inc210, %for.inc209 ]
  br i1 %cmp25, label %for.cond4.preheader.preheader, label %for.cond1.preheader.for.inc209_crit_edge

for.cond1.preheader.for.inc209_crit_edge:         ; preds = %for.cond1.preheader
  %pgocount = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 7)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 7)
  br label %for.inc209

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  br label %for.cond4.preheader

for.cond101.preheader:                            ; preds = %for.inc98
  %pgocount1 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 18)
  %2 = add i64 %pgocount1, 1
  store i64 %2, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 18)
  br i1 %cmp10311, label %for.cond109.preheader.lr.ph.preheader, label %for.inc209

for.cond109.preheader.lr.ph.preheader:            ; preds = %for.cond101.preheader
  br label %for.cond109.preheader.lr.ph

for.cond4.preheader:                              ; preds = %for.inc98, %for.cond4.preheader.preheader
  %indvar68 = phi i64 [ %indvar.next69, %for.inc98 ], [ 0, %for.cond4.preheader.preheader ]
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %for.inc98 ], [ 1, %for.cond4.preheader.preheader ]
  %3 = add i64 %indvar68, 1
  %4 = add i64 %indvar68, 2
  br i1 %cmp63, label %for.cond8.preheader.lr.ph, label %for.cond4.preheader.for.inc98_crit_edge

for.cond4.preheader.for.inc98_crit_edge:          ; preds = %for.cond4.preheader
  %pgocount2 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 6)
  %5 = add i64 %pgocount2, 1
  store i64 %5, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 6)
  br label %for.inc98

for.cond8.preheader.lr.ph:                        ; preds = %for.cond4.preheader
  %6 = add nuw nsw i64 %indvars.iv20, 1
  %7 = add nsw i64 %indvars.iv20, -1
  br label %for.cond8.preheader.us

for.cond8.preheader.us:                           ; preds = %for.cond8.for.inc95_crit_edge.us, %for.cond8.preheader.lr.ph
  %indvar70 = phi i64 [ %indvar.next71, %for.cond8.for.inc95_crit_edge.us ], [ 0, %for.cond8.preheader.lr.ph ]
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %for.cond8.for.inc95_crit_edge.us ], [ 1, %for.cond8.preheader.lr.ph ]
  %8 = add i64 %indvar70, 1
  %scevgep72 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %3, i64 %8, i64 1
  %scevgep74 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %3, i64 %8, i64 %wide.trip.count29
  %scevgep76 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvar68, i64 %8, i64 1
  %scevgep78 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %4, i64 %8, i64 %wide.trip.count29
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %9 = add nsw i64 %indvars.iv15, -1
  br i1 %min.iters.check62, label %for.body11.us.preheader, label %min.iters.checked63

min.iters.checked63:                              ; preds = %for.cond8.preheader.us
  %pgocount3 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 10)
  %10 = add i64 %pgocount3, 1
  store i64 %10, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 10)
  br i1 %cmp.zero66, label %for.body11.us.preheader, label %vector.memcheck84

vector.memcheck84:                                ; preds = %min.iters.checked63
  %pgocount4 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 12)
  %11 = add i64 %pgocount4, 1
  store i64 %11, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 12)
  %bound080 = icmp ult double* %scevgep72, %scevgep78
  %bound181 = icmp ult double* %scevgep76, %scevgep74
  %memcheck.conflict83 = and i1 %bound080, %bound181
  br i1 %memcheck.conflict83, label %for.body11.us.preheader, label %vector.body59.preheader

vector.body59.preheader:                          ; preds = %vector.memcheck84
  br label %vector.body59

vector.body59:                                    ; preds = %vector.body59.vector.body59_crit_edge, %vector.body59.preheader
  %index86 = phi i64 [ %index.next87, %vector.body59.vector.body59_crit_edge ], [ 0, %vector.body59.preheader ]
  %offset.idx91 = or i64 %index86, 1
  %12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %6, i64 %indvars.iv15, i64 %offset.idx91
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load95 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !1
  %14 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv20, i64 %indvars.iv15, i64 %offset.idx91
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load96 = load <2 x double>, <2 x double>* %15, align 8, !alias.scope !1
  %16 = fmul <2 x double> %wide.load96, <double 2.000000e+00, double 2.000000e+00>
  %17 = fsub <2 x double> %wide.load95, %16
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %7, i64 %indvars.iv15, i64 %offset.idx91
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load97 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !1
  %20 = fadd <2 x double> %wide.load97, %17
  %21 = fmul <2 x double> %20, <double 1.250000e-01, double 1.250000e-01>
  %22 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv20, i64 %indvars.iv.next16, i64 %offset.idx91
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load98 = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !1
  %24 = fsub <2 x double> %wide.load98, %16
  %25 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv20, i64 %9, i64 %offset.idx91
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load99 = load <2 x double>, <2 x double>* %26, align 8, !alias.scope !1
  %27 = fadd <2 x double> %24, %wide.load99
  %28 = fmul <2 x double> %27, <double 1.250000e-01, double 1.250000e-01>
  %29 = fadd <2 x double> %21, %28
  %30 = add nuw nsw i64 %offset.idx91, 1
  %31 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv20, i64 %indvars.iv15, i64 %30
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load100 = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !1
  %33 = fsub <2 x double> %wide.load100, %16
  %34 = add nsw i64 %offset.idx91, -1
  %35 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv20, i64 %indvars.iv15, i64 %34
  %36 = bitcast double* %35 to <2 x double>*
  %wide.load101 = load <2 x double>, <2 x double>* %36, align 8, !alias.scope !1
  %37 = fadd <2 x double> %33, %wide.load101
  %38 = fmul <2 x double> %37, <double 1.250000e-01, double 1.250000e-01>
  %39 = fadd <2 x double> %29, %38
  %40 = fadd <2 x double> %wide.load96, %39
  %41 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv20, i64 %indvars.iv15, i64 %offset.idx91
  %42 = bitcast double* %41 to <2 x double>*
  store <2 x double> %40, <2 x double>* %42, align 8, !alias.scope !4, !noalias !1
  %index.next87 = add i64 %index86, 2
  %43 = icmp eq i64 %index.next87, %n.vec65
  br i1 %43, label %middle.block60, label %vector.body59.vector.body59_crit_edge, !llvm.loop !6

vector.body59.vector.body59_crit_edge:            ; preds = %vector.body59
  %pgocount5 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 2)
  %44 = add i64 %pgocount5, 1
  store i64 %44, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 2)
  br label %vector.body59

middle.block60:                                   ; preds = %vector.body59
  %pgocount6 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 14)
  %45 = add i64 %pgocount6, 1
  store i64 %45, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 14)
  br i1 %cmp.n90, label %for.cond8.for.inc95_crit_edge.us, label %middle.block60.for.body11.us.preheader_crit_edge

middle.block60.for.body11.us.preheader_crit_edge: ; preds = %middle.block60
  %pgocount7 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 4)
  %46 = add i64 %pgocount7, 1
  store i64 %46, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 4)
  br label %for.body11.us.preheader

for.body11.us.preheader:                          ; preds = %middle.block60.for.body11.us.preheader_crit_edge, %vector.memcheck84, %min.iters.checked63, %for.cond8.preheader.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck84 ], [ 1, %min.iters.checked63 ], [ 1, %for.cond8.preheader.us ], [ %ind.end89, %middle.block60.for.body11.us.preheader_crit_edge ]
  br label %for.body11.us

for.body11.us:                                    ; preds = %for.body11.us.for.body11.us_crit_edge, %for.body11.us.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body11.us.for.body11.us_crit_edge ], [ %indvars.iv.ph, %for.body11.us.preheader ]
  %arrayidx15.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %6, i64 %indvars.iv15, i64 %indvars.iv
  %47 = load double, double* %arrayidx15.us, align 8
  %arrayidx21.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv20, i64 %indvars.iv15, i64 %indvars.iv
  %48 = load double, double* %arrayidx21.us, align 8
  %mul.us = fmul double %48, 2.000000e+00
  %sub22.us = fsub double %47, %mul.us
  %arrayidx29.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %7, i64 %indvars.iv15, i64 %indvars.iv
  %49 = load double, double* %arrayidx29.us, align 8
  %add30.us = fadd double %49, %sub22.us
  %mul31.us = fmul double %add30.us, 1.250000e-01
  %arrayidx38.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv20, i64 %indvars.iv.next16, i64 %indvars.iv
  %50 = load double, double* %arrayidx38.us, align 8
  %sub46.us = fsub double %50, %mul.us
  %arrayidx53.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv20, i64 %9, i64 %indvars.iv
  %51 = load double, double* %arrayidx53.us, align 8
  %add54.us = fadd double %sub46.us, %51
  %mul55.us = fmul double %add54.us, 1.250000e-01
  %add56.us = fadd double %mul31.us, %mul55.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx63.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv20, i64 %indvars.iv15, i64 %indvars.iv.next
  %52 = load double, double* %arrayidx63.us, align 8
  %sub71.us = fsub double %52, %mul.us
  %53 = add nsw i64 %indvars.iv, -1
  %arrayidx78.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv20, i64 %indvars.iv15, i64 %53
  %54 = load double, double* %arrayidx78.us, align 8
  %add79.us = fadd double %sub71.us, %54
  %mul80.us = fmul double %add79.us, 1.250000e-01
  %add81.us = fadd double %add56.us, %mul80.us
  %add88.us = fadd double %48, %add81.us
  %arrayidx94.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv20, i64 %indvars.iv15, i64 %indvars.iv
  store double %add88.us, double* %arrayidx94.us, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond8.for.inc95_crit_edge.us.loopexit, label %for.body11.us.for.body11.us_crit_edge, !llvm.loop !9

for.body11.us.for.body11.us_crit_edge:            ; preds = %for.body11.us
  %pgocount8 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 0)
  %55 = add i64 %pgocount8, 1
  store i64 %55, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 0)
  br label %for.body11.us

for.cond8.for.inc95_crit_edge.us.loopexit:        ; preds = %for.body11.us
  %pgocount9 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 8)
  %56 = add i64 %pgocount9, 1
  store i64 %56, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 8)
  br label %for.cond8.for.inc95_crit_edge.us

for.cond8.for.inc95_crit_edge.us:                 ; preds = %for.cond8.for.inc95_crit_edge.us.loopexit, %middle.block60
  %exitcond19 = icmp eq i64 %indvars.iv.next16, %wide.trip.count18
  %indvar.next71 = add i64 %indvar70, 1
  br i1 %exitcond19, label %for.inc98.loopexit, label %for.cond8.preheader.us

for.inc98.loopexit:                               ; preds = %for.cond8.for.inc95_crit_edge.us
  %pgocount10 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 16)
  %57 = add i64 %pgocount10, 1
  store i64 %57, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 16)
  br label %for.inc98

for.inc98:                                        ; preds = %for.cond4.preheader.for.inc98_crit_edge, %for.inc98.loopexit
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next21, %wide.trip.count24
  %indvar.next69 = add i64 %indvar68, 1
  br i1 %exitcond25, label %for.cond101.preheader, label %for.cond4.preheader

for.cond109.preheader.lr.ph:                      ; preds = %for.inc206, %for.cond109.preheader.lr.ph.preheader
  %indvar = phi i64 [ %indvar.next, %for.inc206 ], [ 0, %for.cond109.preheader.lr.ph.preheader ]
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %for.inc206 ], [ 1, %for.cond109.preheader.lr.ph.preheader ]
  %58 = add i64 %indvar, 1
  %59 = add i64 %indvar, 2
  %60 = add nuw nsw i64 %indvars.iv36, 1
  %61 = add nsw i64 %indvars.iv36, -1
  br label %for.cond109.preheader.us

for.cond109.preheader.us:                         ; preds = %for.cond109.for.inc203_crit_edge.us, %for.cond109.preheader.lr.ph
  %indvar44 = phi i64 [ %indvar.next45, %for.cond109.for.inc203_crit_edge.us ], [ 0, %for.cond109.preheader.lr.ph ]
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %for.cond109.for.inc203_crit_edge.us ], [ 1, %for.cond109.preheader.lr.ph ]
  %62 = add i64 %indvar44, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %58, i64 %62, i64 1
  %scevgep47 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %58, i64 %62, i64 %wide.trip.count29
  %scevgep49 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvar, i64 %62, i64 1
  %scevgep51 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %59, i64 %62, i64 %wide.trip.count29
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %63 = add nsw i64 %indvars.iv31, -1
  br i1 %min.iters.check, label %for.body112.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond109.preheader.us
  %pgocount11 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 11)
  %64 = add i64 %pgocount11, 1
  store i64 %64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 11)
  br i1 %cmp.zero, label %for.body112.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %pgocount12 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 13)
  %65 = add i64 %pgocount12, 1
  store i64 %65, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 13)
  %bound0 = icmp ult double* %scevgep, %scevgep51
  %bound1 = icmp ult double* %scevgep49, %scevgep47
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.body112.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %66 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %60, i64 %indvars.iv31, i64 %offset.idx
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %67, align 8, !alias.scope !10
  %68 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv36, i64 %indvars.iv31, i64 %offset.idx
  %69 = bitcast double* %68 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %69, align 8, !alias.scope !10
  %70 = fmul <2 x double> %wide.load53, <double 2.000000e+00, double 2.000000e+00>
  %71 = fsub <2 x double> %wide.load, %70
  %72 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %61, i64 %indvars.iv31, i64 %offset.idx
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load54 = load <2 x double>, <2 x double>* %73, align 8, !alias.scope !10
  %74 = fadd <2 x double> %wide.load54, %71
  %75 = fmul <2 x double> %74, <double 1.250000e-01, double 1.250000e-01>
  %76 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv36, i64 %indvars.iv.next32, i64 %offset.idx
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load55 = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !10
  %78 = fsub <2 x double> %wide.load55, %70
  %79 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv36, i64 %63, i64 %offset.idx
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !10
  %81 = fadd <2 x double> %78, %wide.load56
  %82 = fmul <2 x double> %81, <double 1.250000e-01, double 1.250000e-01>
  %83 = fadd <2 x double> %75, %82
  %84 = add nuw nsw i64 %offset.idx, 1
  %85 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv36, i64 %indvars.iv31, i64 %84
  %86 = bitcast double* %85 to <2 x double>*
  %wide.load57 = load <2 x double>, <2 x double>* %86, align 8, !alias.scope !10
  %87 = fsub <2 x double> %wide.load57, %70
  %88 = add nsw i64 %offset.idx, -1
  %89 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv36, i64 %indvars.iv31, i64 %88
  %90 = bitcast double* %89 to <2 x double>*
  %wide.load58 = load <2 x double>, <2 x double>* %90, align 8, !alias.scope !10
  %91 = fadd <2 x double> %87, %wide.load58
  %92 = fmul <2 x double> %91, <double 1.250000e-01, double 1.250000e-01>
  %93 = fadd <2 x double> %83, %92
  %94 = fadd <2 x double> %wide.load53, %93
  %95 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv36, i64 %indvars.iv31, i64 %offset.idx
  %96 = bitcast double* %95 to <2 x double>*
  store <2 x double> %94, <2 x double>* %96, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %97 = icmp eq i64 %index.next, %n.vec
  br i1 %97, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !15

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  %pgocount13 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 3)
  %98 = add i64 %pgocount13, 1
  store i64 %98, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 3)
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %pgocount14 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 15)
  %99 = add i64 %pgocount14, 1
  store i64 %99, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 15)
  br i1 %cmp.n, label %for.cond109.for.inc203_crit_edge.us, label %middle.block.for.body112.us.preheader_crit_edge

middle.block.for.body112.us.preheader_crit_edge:  ; preds = %middle.block
  %pgocount15 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 5)
  %100 = add i64 %pgocount15, 1
  store i64 %100, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 5)
  br label %for.body112.us.preheader

for.body112.us.preheader:                         ; preds = %middle.block.for.body112.us.preheader_crit_edge, %vector.memcheck, %min.iters.checked, %for.cond109.preheader.us
  %indvars.iv26.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %for.cond109.preheader.us ], [ %ind.end, %middle.block.for.body112.us.preheader_crit_edge ]
  br label %for.body112.us

for.body112.us:                                   ; preds = %for.body112.us.for.body112.us_crit_edge, %for.body112.us.preheader
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %for.body112.us.for.body112.us_crit_edge ], [ %indvars.iv26.ph, %for.body112.us.preheader ]
  %arrayidx119.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %60, i64 %indvars.iv31, i64 %indvars.iv26
  %101 = load double, double* %arrayidx119.us, align 8
  %arrayidx125.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv36, i64 %indvars.iv31, i64 %indvars.iv26
  %102 = load double, double* %arrayidx125.us, align 8
  %mul126.us = fmul double %102, 2.000000e+00
  %sub127.us = fsub double %101, %mul126.us
  %arrayidx134.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %61, i64 %indvars.iv31, i64 %indvars.iv26
  %103 = load double, double* %arrayidx134.us, align 8
  %add135.us = fadd double %103, %sub127.us
  %mul136.us = fmul double %add135.us, 1.250000e-01
  %arrayidx143.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv36, i64 %indvars.iv.next32, i64 %indvars.iv26
  %104 = load double, double* %arrayidx143.us, align 8
  %sub151.us = fsub double %104, %mul126.us
  %arrayidx158.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv36, i64 %63, i64 %indvars.iv26
  %105 = load double, double* %arrayidx158.us, align 8
  %add159.us = fadd double %sub151.us, %105
  %mul160.us = fmul double %add159.us, 1.250000e-01
  %add161.us = fadd double %mul136.us, %mul160.us
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %arrayidx168.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv36, i64 %indvars.iv31, i64 %indvars.iv.next27
  %106 = load double, double* %arrayidx168.us, align 8
  %sub176.us = fsub double %106, %mul126.us
  %107 = add nsw i64 %indvars.iv26, -1
  %arrayidx183.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv36, i64 %indvars.iv31, i64 %107
  %108 = load double, double* %arrayidx183.us, align 8
  %add184.us = fadd double %sub176.us, %108
  %mul185.us = fmul double %add184.us, 1.250000e-01
  %add186.us = fadd double %add161.us, %mul185.us
  %add193.us = fadd double %102, %add186.us
  %arrayidx199.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv36, i64 %indvars.iv31, i64 %indvars.iv26
  store double %add193.us, double* %arrayidx199.us, align 8
  %exitcond30 = icmp eq i64 %indvars.iv.next27, %wide.trip.count29
  br i1 %exitcond30, label %for.cond109.for.inc203_crit_edge.us.loopexit, label %for.body112.us.for.body112.us_crit_edge, !llvm.loop !16

for.body112.us.for.body112.us_crit_edge:          ; preds = %for.body112.us
  %pgocount16 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 1)
  %109 = add i64 %pgocount16, 1
  store i64 %109, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 1)
  br label %for.body112.us

for.cond109.for.inc203_crit_edge.us.loopexit:     ; preds = %for.body112.us
  %pgocount17 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 9)
  %110 = add i64 %pgocount17, 1
  store i64 %110, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 9)
  br label %for.cond109.for.inc203_crit_edge.us

for.cond109.for.inc203_crit_edge.us:              ; preds = %for.cond109.for.inc203_crit_edge.us.loopexit, %middle.block
  %exitcond35 = icmp eq i64 %indvars.iv.next32, %wide.trip.count34
  %indvar.next45 = add i64 %indvar44, 1
  br i1 %exitcond35, label %for.inc206, label %for.cond109.preheader.us

for.inc206:                                       ; preds = %for.cond109.for.inc203_crit_edge.us
  %pgocount18 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 17)
  %111 = add i64 %pgocount18, 1
  store i64 %111, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 17)
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next37, %wide.trip.count40
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond41, label %for.inc209.loopexit, label %for.cond109.preheader.lr.ph

for.inc209.loopexit:                              ; preds = %for.inc206
  %pgocount19 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 19)
  %112 = add i64 %pgocount19, 1
  store i64 %112, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 19)
  br label %for.inc209

for.inc209:                                       ; preds = %for.cond1.preheader.for.inc209_crit_edge, %for.inc209.loopexit, %for.cond101.preheader
  %inc210 = add nuw nsw i32 %t.013, 1
  %exitcond42 = icmp eq i32 %inc210, 501
  br i1 %exitcond42, label %for.end211, label %for.cond1.preheader

for.end211:                                       ; preds = %for.inc209
  %pgocount20 = load i64, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 20)
  %113 = add i64 %pgocount20, 1
  store i64 %113, i64* getelementptr inbounds ([21 x i64], [21 x i64]* @__profc_B.ll_kernel_heat_3d, i64 0, i64 20)
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [120 x [120 x double]]* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %cmp7 = icmp sgt i32 %n, 0
  br i1 %cmp7, label %for.cond2.preheader.lr.ph, label %for.end23

for.cond2.preheader.lr.ph:                        ; preds = %entry
  %3 = sext i32 %n to i64
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count38 = zext i32 %n to i64
  %wide.trip.count43 = zext i32 %n to i64
  br label %for.cond5.preheader.us.us.preheader

for.cond5.preheader.us.us.preheader:              ; preds = %for.cond2.for.inc21_crit_edge.us, %for.cond2.preheader.lr.ph
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %for.cond2.for.inc21_crit_edge.us ], [ 0, %for.cond2.preheader.lr.ph ]
  %4 = mul nsw i64 %indvars.iv40, %3
  %5 = trunc i64 %4 to i32
  br label %for.cond5.preheader.us.us

for.cond2.for.inc21_crit_edge.us:                 ; preds = %for.cond5.for.inc18_crit_edge.us.us
  %pgocount = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %6 = add i64 %pgocount, 1
  store i64 %6, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_print_array, i64 0, i64 3)
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next41, %wide.trip.count43
  br i1 %exitcond44, label %for.end23.loopexit, label %for.cond5.preheader.us.us.preheader

for.cond5.preheader.us.us:                        ; preds = %for.cond5.for.inc18_crit_edge.us.us, %for.cond5.preheader.us.us.preheader
  %indvars.iv36 = phi i64 [ 0, %for.cond5.preheader.us.us.preheader ], [ %indvars.iv.next37, %for.cond5.for.inc18_crit_edge.us.us ]
  %7 = trunc i64 %indvars.iv36 to i32
  %mul81.us.us = add i32 %7, %5
  %add.us.us = mul i32 %mul81.us.us, %n
  %8 = zext i32 %add.us.us to i64
  br label %for.body7.us.us

for.cond5.for.inc18_crit_edge.us.us:              ; preds = %if.end.us.us
  %pgocount1 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %9 = add i64 %pgocount1, 1
  store i64 %9, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_print_array, i64 0, i64 2)
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next37, %wide.trip.count38
  br i1 %exitcond39, label %for.cond2.for.inc21_crit_edge.us, label %for.cond5.preheader.us.us

for.body7.us.us:                                  ; preds = %if.end.us.us, %for.cond5.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end.us.us ], [ 0, %for.cond5.preheader.us.us ]
  %10 = add i64 %indvars.iv, %8
  %11 = trunc i64 %10 to i32
  %rem.us.us = srem i32 %11, 20
  %cmp11.us.us = icmp eq i32 %rem.us.us, 0
  br i1 %cmp11.us.us, label %if.then.us.us, label %for.body7.us.us.if.end.us.us_crit_edge

for.body7.us.us.if.end.us.us_crit_edge:           ; preds = %for.body7.us.us
  %pgocount2 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  %12 = add i64 %pgocount2, 1
  store i64 %12, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_print_array, i64 0, i64 0)
  br label %if.end.us.us

if.then.us.us:                                    ; preds = %for.body7.us.us
  %pgocount3 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %13 = add i64 %pgocount3, 1
  store i64 %13, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_print_array, i64 0, i64 1)
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %if.end.us.us

if.end.us.us:                                     ; preds = %for.body7.us.us.if.end.us.us_crit_edge, %if.then.us.us
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv40, i64 %indvars.iv36, i64 %indvars.iv
  %16 = load double, double* %arrayidx16.us.us, align 8
  %call17.us.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond5.for.inc18_crit_edge.us.us, label %for.body7.us.us

for.end23.loopexit:                               ; preds = %for.cond2.for.inc21_crit_edge.us
  %pgocount4 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_print_array, i64 0, i64 5)
  %17 = add i64 %pgocount4, 1
  store i64 %17, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_print_array, i64 0, i64 5)
  br label %for.end23

for.end23:                                        ; preds = %for.end23.loopexit, %entry
  %pgocount5 = load i64, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_print_array, i64 0, i64 4)
  %18 = add i64 %pgocount5, 1
  store i64 %18, i64* getelementptr inbounds ([6 x i64], [6 x i64]* @__profc_B.ll_print_array, i64 0, i64 4)
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}
