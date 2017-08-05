; ModuleID = 'B.ll'
source_filename = "jacobi-2d.c"
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
@__profn_B.ll_kernel_jacobi_2d = private constant [21 x i8] c"B.ll:kernel_jacobi_2d"
@__profn_B.ll_print_array = private constant [16 x i8] c"B.ll:print_array"
@__profc_main = private global [3 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_main = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -2624081020897602054, i64 32414643582, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i32 0, i32 0), i8* bitcast (i32 (i32, i8**)* @main to i8*), i8* null, i32 3, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_init_array = private global [4 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_init_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 -5234573971622607648, i64 48841616810, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i32 0, i32 0), i8* null, i8* null, i32 4, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_kernel_jacobi_2d = private global [19 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_kernel_jacobi_2d = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 9078208458297787858, i64 213132667004, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i32 0, i32 0), i8* null, i8* null, i32 19, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__profc_B.ll_print_array = private global [5 x i64] zeroinitializer, section "__llvm_prf_cnts", align 8
@__profd_B.ll_print_array = private global { i64, i64, i64*, i8*, i8*, i32, [1 x i16] } { i64 2156983131604126103, i64 63976198547, i64* getelementptr inbounds ([5 x i64], [5 x i64]* @__profc_B.ll_print_array, i32 0, i32 0), i8* null, i8* null, i32 5, [1 x i16] zeroinitializer }, section "__llvm_prf_data", align 8
@__llvm_prf_nm = private constant [61 x i8] c";\00main\01B.ll:init_array\01B.ll:kernel_jacobi_2d\01B.ll:print_array", section "__llvm_prf_names"
@llvm.used = appending global [5 x i8*] [i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_main to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_init_array to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_kernel_jacobi_2d to i8*), i8* bitcast ({ i64, i64, i64*, i8*, i8*, i32, [1 x i16] }* @__profd_B.ll_print_array to i8*), i8* getelementptr inbounds ([61 x i8], [61 x i8]* @__llvm_prf_nm, i32 0, i32 0)], section "llvm.metadata"

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1300 x double]*
  %arraydecay2 = bitcast i8* %call1 to [1300 x double]*
  tail call fastcc void @init_array(i32 1300, [1300 x double]* %arraydecay, [1300 x double]* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_jacobi_2d(i32 500, i32 1300, [1300 x double]* %arraydecay, [1300 x double]* %arraydecay2)
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
  tail call fastcc void @print_array(i32 1300, [1300 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
  %pgocount2 = load i64, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  %3 = add i64 %pgocount2, 1
  store i64 %3, i64* getelementptr inbounds ([3 x i64], [3 x i64]* @__profc_main, i64 0, i64 0)
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, [1300 x double]* nocapture %A, [1300 x double]* nocapture %B) unnamed_addr #2 {
entry:
  %cmp3 = icmp sgt i32 %n, 0
  br i1 %cmp3, label %for.cond1.preheader.lr.ph, label %for.end22

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %conv6 = sitofp i32 %n to double
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count9 = zext i32 %n to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc20_crit_edge.us, %for.cond1.preheader.lr.ph
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %for.cond1.for.inc20_crit_edge.us ], [ 0, %for.cond1.preheader.lr.ph ]
  %0 = trunc i64 %indvars.iv7 to i32
  %conv.us = sitofp i32 %0 to double
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.for.body3.us_crit_edge, %for.cond1.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next, %for.body3.us.for.body3.us_crit_edge ]
  %1 = add nuw nsw i64 %indvars.iv, 2
  %2 = trunc i64 %1 to i32
  %conv4.us = sitofp i32 %2 to double
  %mul.us = fmul double %conv.us, %conv4.us
  %add5.us = fadd double %mul.us, 2.000000e+00
  %div.us = fdiv double %add5.us, %conv6
  %arrayidx8.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv7, i64 %indvars.iv
  store double %div.us, double* %arrayidx8.us, align 8
  %3 = add nuw nsw i64 %indvars.iv, 3
  %4 = trunc i64 %3 to i32
  %conv11.us = sitofp i32 %4 to double
  %mul12.us = fmul double %conv.us, %conv11.us
  %add13.us = fadd double %mul12.us, 3.000000e+00
  %div15.us = fdiv double %add13.us, %conv6
  %arrayidx19.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv7, i64 %indvars.iv
  store double %div15.us, double* %arrayidx19.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond1.for.inc20_crit_edge.us, label %for.body3.us.for.body3.us_crit_edge

for.body3.us.for.body3.us_crit_edge:              ; preds = %for.body3.us
  %pgocount = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  %5 = add i64 %pgocount, 1
  store i64 %5, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 0)
  br label %for.body3.us

for.cond1.for.inc20_crit_edge.us:                 ; preds = %for.body3.us
  %pgocount1 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %6 = add i64 %pgocount1, 1
  store i64 %6, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 1)
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next8, %wide.trip.count9
  br i1 %exitcond10, label %for.end22.loopexit, label %for.cond1.preheader.us

for.end22.loopexit:                               ; preds = %for.cond1.for.inc20_crit_edge.us
  %pgocount2 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  %7 = add i64 %pgocount2, 1
  store i64 %7, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 3)
  br label %for.end22

for.end22:                                        ; preds = %for.end22.loopexit, %entry
  %pgocount3 = load i64, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  %8 = add i64 %pgocount3, 1
  store i64 %8, i64* getelementptr inbounds ([4 x i64], [4 x i64]* @__profc_B.ll_init_array, i64 0, i64 2)
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_2d(i32 %tsteps, i32 %n, [1300 x double]* nocapture %A, [1300 x double]* nocapture %B) unnamed_addr #2 {
entry:
  %cmp9 = icmp sgt i32 %tsteps, 0
  br i1 %cmp9, label %for.cond1.preheader.lr.ph, label %for.end89

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %sub = add nsw i32 %n, -1
  %cmp23 = icmp sgt i32 %sub, 1
  %wide.trip.count15 = zext i32 %sub to i64
  %wide.trip.count = zext i32 %sub to i64
  %cmp427 = icmp sgt i32 %sub, 1
  %wide.trip.count25 = zext i32 %sub to i64
  %wide.trip.count20 = zext i32 %sub to i64
  %0 = add nsw i64 %wide.trip.count20, -1
  %min.iters.check49 = icmp ult i64 %0, 4
  %n.vec52 = and i64 %0, -4
  %cmp.zero53 = icmp eq i64 %n.vec52, 0
  %ind.end74 = or i64 %n.vec52, 1
  %cmp.n75 = icmp eq i64 %0, %n.vec52
  %min.iters.check = icmp ult i64 %0, 4
  %n.vec = and i64 %0, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %n.vec, 1
  %cmp.n = icmp eq i64 %0, %n.vec
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc87, %for.cond1.preheader.lr.ph
  %t.010 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc88, %for.inc87 ]
  br i1 %cmp23, label %for.cond4.preheader.us.preheader, label %for.cond1.preheader.for.inc87_crit_edge

for.cond1.preheader.for.inc87_crit_edge:          ; preds = %for.cond1.preheader
  %pgocount = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 6)
  %1 = add i64 %pgocount, 1
  store i64 %1, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 6)
  br label %for.inc87

for.cond4.preheader.us.preheader:                 ; preds = %for.cond1.preheader
  br label %for.cond4.preheader.us

for.cond4.preheader.us:                           ; preds = %for.cond4.for.inc37_crit_edge.us, %for.cond4.preheader.us.preheader
  %indvar55 = phi i64 [ %indvar.next56, %for.cond4.for.inc37_crit_edge.us ], [ 0, %for.cond4.preheader.us.preheader ]
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %for.cond4.for.inc37_crit_edge.us ], [ 1, %for.cond4.preheader.us.preheader ]
  %2 = add i64 %indvar55, 1
  %scevgep57 = getelementptr [1300 x double], [1300 x double]* %B, i64 %2, i64 1
  %scevgep59 = getelementptr [1300 x double], [1300 x double]* %B, i64 %2, i64 %wide.trip.count20
  %scevgep61 = getelementptr [1300 x double], [1300 x double]* %A, i64 %indvar55, i64 1
  %3 = add i64 %indvar55, 2
  %scevgep63 = getelementptr [1300 x double], [1300 x double]* %A, i64 %3, i64 %wide.trip.count20
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %4 = add nsw i64 %indvars.iv12, -1
  br i1 %min.iters.check49, label %for.body7.us.preheader, label %min.iters.checked50

min.iters.checked50:                              ; preds = %for.cond4.preheader.us
  %pgocount1 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 8)
  %5 = add i64 %pgocount1, 1
  store i64 %5, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 8)
  br i1 %cmp.zero53, label %for.body7.us.preheader, label %vector.memcheck69

vector.memcheck69:                                ; preds = %min.iters.checked50
  %pgocount2 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 10)
  %6 = add i64 %pgocount2, 1
  store i64 %6, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 10)
  %bound065 = icmp ult double* %scevgep57, %scevgep63
  %bound166 = icmp ult double* %scevgep61, %scevgep59
  %memcheck.conflict68 = and i1 %bound065, %bound166
  br i1 %memcheck.conflict68, label %for.body7.us.preheader, label %vector.body46.preheader

vector.body46.preheader:                          ; preds = %vector.memcheck69
  br label %vector.body46

vector.body46:                                    ; preds = %vector.body46.vector.body46_crit_edge, %vector.body46.preheader
  %index71 = phi i64 [ %index.next72, %vector.body46.vector.body46_crit_edge ], [ 0, %vector.body46.preheader ]
  %offset.idx76 = or i64 %index71, 1
  %7 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv12, i64 %offset.idx76
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load81 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !1
  %9 = getelementptr double, double* %7, i64 2
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load82 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !1
  %11 = add nsw i64 %offset.idx76, -1
  %12 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv12, i64 %11
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !1
  %14 = getelementptr double, double* %12, i64 2
  %15 = bitcast double* %14 to <2 x double>*
  %wide.load84 = load <2 x double>, <2 x double>* %15, align 8, !alias.scope !1
  %16 = fadd <2 x double> %wide.load81, %wide.load83
  %17 = fadd <2 x double> %wide.load82, %wide.load84
  %18 = add nuw nsw i64 %offset.idx76, 1
  %19 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv12, i64 %18
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load85 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !1
  %21 = getelementptr double, double* %19, i64 2
  %22 = bitcast double* %21 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %22, align 8, !alias.scope !1
  %23 = fadd <2 x double> %16, %wide.load85
  %24 = fadd <2 x double> %17, %wide.load86
  %25 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv.next13, i64 %offset.idx76
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %26, align 8, !alias.scope !1
  %27 = getelementptr double, double* %25, i64 2
  %28 = bitcast double* %27 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %28, align 8, !alias.scope !1
  %29 = fadd <2 x double> %23, %wide.load87
  %30 = fadd <2 x double> %24, %wide.load88
  %31 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %4, i64 %offset.idx76
  %32 = bitcast double* %31 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %32, align 8, !alias.scope !1
  %33 = getelementptr double, double* %31, i64 2
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !1
  %35 = fadd <2 x double> %29, %wide.load89
  %36 = fadd <2 x double> %30, %wide.load90
  %37 = fmul <2 x double> %35, <double 2.000000e-01, double 2.000000e-01>
  %38 = fmul <2 x double> %36, <double 2.000000e-01, double 2.000000e-01>
  %39 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv12, i64 %offset.idx76
  %40 = bitcast double* %39 to <2 x double>*
  store <2 x double> %37, <2 x double>* %40, align 8, !alias.scope !4, !noalias !1
  %41 = getelementptr double, double* %39, i64 2
  %42 = bitcast double* %41 to <2 x double>*
  store <2 x double> %38, <2 x double>* %42, align 8, !alias.scope !4, !noalias !1
  %index.next72 = add i64 %index71, 4
  %43 = icmp eq i64 %index.next72, %n.vec52
  br i1 %43, label %middle.block47, label %vector.body46.vector.body46_crit_edge, !llvm.loop !6

vector.body46.vector.body46_crit_edge:            ; preds = %vector.body46
  %pgocount3 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 2)
  %44 = add i64 %pgocount3, 1
  store i64 %44, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 2)
  br label %vector.body46

middle.block47:                                   ; preds = %vector.body46
  %pgocount4 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 12)
  %45 = add i64 %pgocount4, 1
  store i64 %45, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 12)
  br i1 %cmp.n75, label %for.cond4.for.inc37_crit_edge.us, label %middle.block47.for.body7.us.preheader_crit_edge

middle.block47.for.body7.us.preheader_crit_edge:  ; preds = %middle.block47
  %pgocount5 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 4)
  %46 = add i64 %pgocount5, 1
  store i64 %46, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 4)
  br label %for.body7.us.preheader

for.body7.us.preheader:                           ; preds = %middle.block47.for.body7.us.preheader_crit_edge, %vector.memcheck69, %min.iters.checked50, %for.cond4.preheader.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck69 ], [ 1, %min.iters.checked50 ], [ 1, %for.cond4.preheader.us ], [ %ind.end74, %middle.block47.for.body7.us.preheader_crit_edge ]
  br label %for.body7.us

for.body7.us:                                     ; preds = %for.body7.us.for.body7.us_crit_edge, %for.body7.us.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body7.us.for.body7.us_crit_edge ], [ %indvars.iv.ph, %for.body7.us.preheader ]
  %arrayidx9.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv12, i64 %indvars.iv
  %47 = load double, double* %arrayidx9.us, align 8
  %48 = add nsw i64 %indvars.iv, -1
  %arrayidx14.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv12, i64 %48
  %49 = load double, double* %arrayidx14.us, align 8
  %add.us = fadd double %47, %49
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx19.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv12, i64 %indvars.iv.next
  %50 = load double, double* %arrayidx19.us, align 8
  %add20.us = fadd double %add.us, %50
  %arrayidx25.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv.next13, i64 %indvars.iv
  %51 = load double, double* %arrayidx25.us, align 8
  %add26.us = fadd double %add20.us, %51
  %arrayidx31.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %4, i64 %indvars.iv
  %52 = load double, double* %arrayidx31.us, align 8
  %add32.us = fadd double %add26.us, %52
  %mul.us = fmul double %add32.us, 2.000000e-01
  %arrayidx36.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv12, i64 %indvars.iv
  store double %mul.us, double* %arrayidx36.us, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond4.for.inc37_crit_edge.us.loopexit, label %for.body7.us.for.body7.us_crit_edge, !llvm.loop !9

for.body7.us.for.body7.us_crit_edge:              ; preds = %for.body7.us
  %pgocount6 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 0)
  %53 = add i64 %pgocount6, 1
  store i64 %53, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 0)
  br label %for.body7.us

for.cond4.for.inc37_crit_edge.us.loopexit:        ; preds = %for.body7.us
  %pgocount7 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 7)
  %54 = add i64 %pgocount7, 1
  store i64 %54, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 7)
  br label %for.cond4.for.inc37_crit_edge.us

for.cond4.for.inc37_crit_edge.us:                 ; preds = %for.cond4.for.inc37_crit_edge.us.loopexit, %middle.block47
  %exitcond16 = icmp eq i64 %indvars.iv.next13, %wide.trip.count15
  %indvar.next56 = add i64 %indvar55, 1
  br i1 %exitcond16, label %for.cond40.preheader, label %for.cond4.preheader.us

for.cond40.preheader:                             ; preds = %for.cond4.for.inc37_crit_edge.us
  %pgocount8 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 15)
  %55 = add i64 %pgocount8, 1
  store i64 %55, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 15)
  br i1 %cmp427, label %for.cond44.preheader.us.preheader, label %for.inc87

for.cond44.preheader.us.preheader:                ; preds = %for.cond40.preheader
  br label %for.cond44.preheader.us

for.cond44.preheader.us:                          ; preds = %for.cond44.for.inc84_crit_edge.us, %for.cond44.preheader.us.preheader
  %indvar = phi i64 [ %indvar.next, %for.cond44.for.inc84_crit_edge.us ], [ 0, %for.cond44.preheader.us.preheader ]
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %for.cond44.for.inc84_crit_edge.us ], [ 1, %for.cond44.preheader.us.preheader ]
  %56 = add i64 %indvar, 1
  %scevgep = getelementptr [1300 x double], [1300 x double]* %A, i64 %56, i64 1
  %scevgep30 = getelementptr [1300 x double], [1300 x double]* %A, i64 %56, i64 %wide.trip.count20
  %scevgep32 = getelementptr [1300 x double], [1300 x double]* %B, i64 %indvar, i64 1
  %57 = add i64 %indvar, 2
  %scevgep34 = getelementptr [1300 x double], [1300 x double]* %B, i64 %57, i64 %wide.trip.count20
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %58 = add nsw i64 %indvars.iv22, -1
  br i1 %min.iters.check, label %for.body47.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond44.preheader.us
  %pgocount9 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 11)
  %59 = add i64 %pgocount9, 1
  store i64 %59, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 11)
  br i1 %cmp.zero, label %for.body47.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %pgocount10 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 13)
  %60 = add i64 %pgocount10, 1
  store i64 %60, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 13)
  %bound0 = icmp ult double* %scevgep, %scevgep34
  %bound1 = icmp ult double* %scevgep32, %scevgep30
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.body47.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %61 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv22, i64 %offset.idx
  %62 = bitcast double* %61 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %62, align 8, !alias.scope !10
  %63 = getelementptr double, double* %61, i64 2
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load37 = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !10
  %65 = add nsw i64 %offset.idx, -1
  %66 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv22, i64 %65
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load38 = load <2 x double>, <2 x double>* %67, align 8, !alias.scope !10
  %68 = getelementptr double, double* %66, i64 2
  %69 = bitcast double* %68 to <2 x double>*
  %wide.load39 = load <2 x double>, <2 x double>* %69, align 8, !alias.scope !10
  %70 = fadd <2 x double> %wide.load, %wide.load38
  %71 = fadd <2 x double> %wide.load37, %wide.load39
  %72 = add nuw nsw i64 %offset.idx, 1
  %73 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv22, i64 %72
  %74 = bitcast double* %73 to <2 x double>*
  %wide.load40 = load <2 x double>, <2 x double>* %74, align 8, !alias.scope !10
  %75 = getelementptr double, double* %73, i64 2
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load41 = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !10
  %77 = fadd <2 x double> %70, %wide.load40
  %78 = fadd <2 x double> %71, %wide.load41
  %79 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv.next23, i64 %offset.idx
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load42 = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !10
  %81 = getelementptr double, double* %79, i64 2
  %82 = bitcast double* %81 to <2 x double>*
  %wide.load43 = load <2 x double>, <2 x double>* %82, align 8, !alias.scope !10
  %83 = fadd <2 x double> %77, %wide.load42
  %84 = fadd <2 x double> %78, %wide.load43
  %85 = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %58, i64 %offset.idx
  %86 = bitcast double* %85 to <2 x double>*
  %wide.load44 = load <2 x double>, <2 x double>* %86, align 8, !alias.scope !10
  %87 = getelementptr double, double* %85, i64 2
  %88 = bitcast double* %87 to <2 x double>*
  %wide.load45 = load <2 x double>, <2 x double>* %88, align 8, !alias.scope !10
  %89 = fadd <2 x double> %83, %wide.load44
  %90 = fadd <2 x double> %84, %wide.load45
  %91 = fmul <2 x double> %89, <double 2.000000e-01, double 2.000000e-01>
  %92 = fmul <2 x double> %90, <double 2.000000e-01, double 2.000000e-01>
  %93 = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv22, i64 %offset.idx
  %94 = bitcast double* %93 to <2 x double>*
  store <2 x double> %91, <2 x double>* %94, align 8, !alias.scope !13, !noalias !10
  %95 = getelementptr double, double* %93, i64 2
  %96 = bitcast double* %95 to <2 x double>*
  store <2 x double> %92, <2 x double>* %96, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 4
  %97 = icmp eq i64 %index.next, %n.vec
  br i1 %97, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !15

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  %pgocount11 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 3)
  %98 = add i64 %pgocount11, 1
  store i64 %98, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 3)
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %pgocount12 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 14)
  %99 = add i64 %pgocount12, 1
  store i64 %99, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 14)
  br i1 %cmp.n, label %for.cond44.for.inc84_crit_edge.us, label %middle.block.for.body47.us.preheader_crit_edge

middle.block.for.body47.us.preheader_crit_edge:   ; preds = %middle.block
  %pgocount13 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 5)
  %100 = add i64 %pgocount13, 1
  store i64 %100, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 5)
  br label %for.body47.us.preheader

for.body47.us.preheader:                          ; preds = %middle.block.for.body47.us.preheader_crit_edge, %vector.memcheck, %min.iters.checked, %for.cond44.preheader.us
  %indvars.iv17.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %for.cond44.preheader.us ], [ %ind.end, %middle.block.for.body47.us.preheader_crit_edge ]
  br label %for.body47.us

for.body47.us:                                    ; preds = %for.body47.us.for.body47.us_crit_edge, %for.body47.us.preheader
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %for.body47.us.for.body47.us_crit_edge ], [ %indvars.iv17.ph, %for.body47.us.preheader ]
  %arrayidx51.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv22, i64 %indvars.iv17
  %101 = load double, double* %arrayidx51.us, align 8
  %102 = add nsw i64 %indvars.iv17, -1
  %arrayidx56.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv22, i64 %102
  %103 = load double, double* %arrayidx56.us, align 8
  %add57.us = fadd double %101, %103
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %arrayidx62.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv22, i64 %indvars.iv.next18
  %104 = load double, double* %arrayidx62.us, align 8
  %add63.us = fadd double %add57.us, %104
  %arrayidx68.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %indvars.iv.next23, i64 %indvars.iv17
  %105 = load double, double* %arrayidx68.us, align 8
  %add69.us = fadd double %add63.us, %105
  %arrayidx74.us = getelementptr inbounds [1300 x double], [1300 x double]* %B, i64 %58, i64 %indvars.iv17
  %106 = load double, double* %arrayidx74.us, align 8
  %add75.us = fadd double %add69.us, %106
  %mul76.us = fmul double %add75.us, 2.000000e-01
  %arrayidx80.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv22, i64 %indvars.iv17
  store double %mul76.us, double* %arrayidx80.us, align 8
  %exitcond21 = icmp eq i64 %indvars.iv.next18, %wide.trip.count20
  br i1 %exitcond21, label %for.cond44.for.inc84_crit_edge.us.loopexit, label %for.body47.us.for.body47.us_crit_edge, !llvm.loop !16

for.body47.us.for.body47.us_crit_edge:            ; preds = %for.body47.us
  %pgocount14 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 1)
  %107 = add i64 %pgocount14, 1
  store i64 %107, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 1)
  br label %for.body47.us

for.cond44.for.inc84_crit_edge.us.loopexit:       ; preds = %for.body47.us
  %pgocount15 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 9)
  %108 = add i64 %pgocount15, 1
  store i64 %108, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 9)
  br label %for.cond44.for.inc84_crit_edge.us

for.cond44.for.inc84_crit_edge.us:                ; preds = %for.cond44.for.inc84_crit_edge.us.loopexit, %middle.block
  %exitcond26 = icmp eq i64 %indvars.iv.next23, %wide.trip.count25
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond26, label %for.inc87.loopexit, label %for.cond44.preheader.us

for.inc87.loopexit:                               ; preds = %for.cond44.for.inc84_crit_edge.us
  %pgocount16 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 16)
  %109 = add i64 %pgocount16, 1
  store i64 %109, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 16)
  br label %for.inc87

for.inc87:                                        ; preds = %for.cond1.preheader.for.inc87_crit_edge, %for.inc87.loopexit, %for.cond40.preheader
  %inc88 = add nuw nsw i32 %t.010, 1
  %exitcond27 = icmp eq i32 %inc88, %tsteps
  br i1 %exitcond27, label %for.end89.loopexit, label %for.cond1.preheader

for.end89.loopexit:                               ; preds = %for.inc87
  %pgocount17 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 18)
  %110 = add i64 %pgocount17, 1
  store i64 %110, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 18)
  br label %for.end89

for.end89:                                        ; preds = %for.end89.loopexit, %entry
  %pgocount18 = load i64, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 17)
  %111 = add i64 %pgocount18, 1
  store i64 %111, i64* getelementptr inbounds ([19 x i64], [19 x i64]* @__profc_B.ll_kernel_jacobi_2d, i64 0, i64 17)
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [1300 x double]* nocapture readonly %A) unnamed_addr #0 {
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
  %arrayidx8.us = getelementptr inbounds [1300 x double], [1300 x double]* %A, i64 %indvars.iv7, i64 %indvars.iv
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
