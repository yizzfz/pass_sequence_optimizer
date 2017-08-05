; ModuleID = 'A.ll'
source_filename = "syr2k.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1200 x double]*
  %arraydecay3 = bitcast i8* %call1 to [1000 x double]*
  %arraydecay4 = bitcast i8* %call2 to [1000 x double]*
  call fastcc void @init_array(i32 1200, i32 1000, double* nonnull %alpha, double* nonnull %beta, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1000 x double]* %arraydecay4)
  tail call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  tail call fastcc void @kernel_syr2k(i32 1200, i32 1000, double %0, double %1, [1200 x double]* %arraydecay, [1000 x double]* %arraydecay3, [1000 x double]* %arraydecay4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %entry.if.end_crit_edge

entry.if.end_crit_edge:                           ; preds = %entry
  br label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %2, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %land.lhs.true.if.end_crit_edge

land.lhs.true.if.end_crit_edge:                   ; preds = %land.lhs.true
  br label %if.end

if.then:                                          ; preds = %land.lhs.true
  %3 = bitcast i8* %call to [1200 x double]*
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true.if.end_crit_edge, %entry.if.end_crit_edge, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, i32 %m, double* nocapture %alpha, double* nocapture %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture %A, [1000 x double]* nocapture %B) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc17_crit_edge.us.for.cond1.preheader.us_crit_edge, %entry
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %for.cond1.for.inc17_crit_edge.us.for.cond1.preheader.us_crit_edge ], [ 0, %entry ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us.for.inc.us_crit_edge, %for.cond1.preheader.us
  %indvars.iv18 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next19, %for.inc.us.for.inc.us_crit_edge ]
  %0 = mul nuw nsw i64 %indvars.iv18, %indvars.iv25
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, 1200
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, 1.200000e+03
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv25, i64 %indvars.iv18
  store double %div.us, double* %arrayidx6.us, align 8
  %3 = add nuw nsw i64 %0, 2
  %4 = trunc i64 %3 to i32
  %rem9.us = srem i32 %4, 1000
  %conv10.us = sitofp i32 %rem9.us to double
  %div12.us = fdiv double %conv10.us, 1.000000e+03
  %arrayidx16.us = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv25, i64 %indvars.iv18
  store double %div12.us, double* %arrayidx16.us, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next19, 1000
  br i1 %exitcond24, label %for.cond1.for.inc17_crit_edge.us, label %for.inc.us.for.inc.us_crit_edge

for.inc.us.for.inc.us_crit_edge:                  ; preds = %for.inc.us
  br label %for.inc.us

for.cond1.for.inc17_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next26, 1200
  br i1 %exitcond28, label %for.cond1.for.inc17_crit_edge.us.for.cond24.preheader.us_crit_edge, label %for.cond1.for.inc17_crit_edge.us.for.cond1.preheader.us_crit_edge

for.cond1.for.inc17_crit_edge.us.for.cond1.preheader.us_crit_edge: ; preds = %for.cond1.for.inc17_crit_edge.us
  br label %for.cond1.preheader.us

for.cond1.for.inc17_crit_edge.us.for.cond24.preheader.us_crit_edge: ; preds = %for.cond1.for.inc17_crit_edge.us
  br label %for.cond24.preheader.us

for.cond24.preheader.us:                          ; preds = %for.cond24.for.inc41_crit_edge.us.for.cond24.preheader.us_crit_edge, %for.cond1.for.inc17_crit_edge.us.for.cond24.preheader.us_crit_edge
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %for.cond24.for.inc41_crit_edge.us.for.cond24.preheader.us_crit_edge ], [ 0, %for.cond1.for.inc17_crit_edge.us.for.cond24.preheader.us_crit_edge ]
  br label %for.inc38.us

for.inc38.us:                                     ; preds = %for.inc38.us.for.inc38.us_crit_edge, %for.cond24.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond24.preheader.us ], [ %indvars.iv.next, %for.inc38.us.for.inc38.us_crit_edge ]
  %5 = mul nuw nsw i64 %indvars.iv, %indvars.iv14
  %6 = add nuw nsw i64 %5, 3
  %7 = trunc i64 %6 to i32
  %rem30.us = srem i32 %7, 1200
  %conv31.us = sitofp i32 %rem30.us to double
  %div33.us = fdiv double %conv31.us, 1.000000e+03
  %arrayidx37.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv14, i64 %indvars.iv
  store double %div33.us, double* %arrayidx37.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond24.for.inc41_crit_edge.us, label %for.inc38.us.for.inc38.us_crit_edge

for.inc38.us.for.inc38.us_crit_edge:              ; preds = %for.inc38.us
  br label %for.inc38.us

for.cond24.for.inc41_crit_edge.us:                ; preds = %for.inc38.us
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, 1200
  br i1 %exitcond17, label %for.end43, label %for.cond24.for.inc41_crit_edge.us.for.cond24.preheader.us_crit_edge

for.cond24.for.inc41_crit_edge.us.for.cond24.preheader.us_crit_edge: ; preds = %for.cond24.for.inc41_crit_edge.us
  br label %for.cond24.preheader.us

for.end43:                                        ; preds = %for.cond24.for.inc41_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(i32 %n, i32 %m, double %alpha, double %beta, [1200 x double]* nocapture %C, [1000 x double]* nocapture readonly %A, [1000 x double]* nocapture readonly %B) unnamed_addr #2 {
entry:
  %broadcast.splatinsert150 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat151 = shufflevector <2 x double> %broadcast.splatinsert150, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert125 = insertelement <2 x double> undef, double %alpha, i32 0
  %broadcast.splat126 = shufflevector <2 x double> %broadcast.splatinsert125, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.inc.lr.ph.us

for.inc.us:                                       ; preds = %for.inc.us.preheader153, %for.inc.us.for.inc.us_crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.inc.us.for.inc.us_crit_edge ], [ %indvars.iv.ph, %for.inc.us.preheader153 ]
  %arrayidx5.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %indvars.iv
  %0 = load double, double* %arrayidx5.us, align 8
  %mul.us = fmul double %0, %beta
  store double %mul.us, double* %arrayidx5.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx5.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %indvars.iv.next
  %1 = load double, double* %arrayidx5.us.1, align 8
  %mul.us.1 = fmul double %1, %beta
  store double %mul.us.1, double* %arrayidx5.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx5.us.2 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %indvars.iv.next.1
  %2 = load double, double* %arrayidx5.us.2, align 8
  %mul.us.2 = fmul double %2, %beta
  store double %mul.us.2, double* %arrayidx5.us.2, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx5.us.3 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %indvars.iv.next.2
  %3 = load double, double* %arrayidx5.us.3, align 8
  %mul.us.3 = fmul double %3, %beta
  store double %mul.us.3, double* %arrayidx5.us.3, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv52
  br i1 %exitcond.3, label %for.inc.us.for.cond9.preheader.us29_crit_edge, label %for.inc.us.for.inc.us_crit_edge, !llvm.loop !1

for.inc.us.for.inc.us_crit_edge:                  ; preds = %for.inc.us
  br label %for.inc.us

for.inc.us.for.cond9.preheader.us29_crit_edge:    ; preds = %for.inc.us
  br label %for.cond9.preheader.us29.preheader

for.inc37.us12:                                   ; preds = %for.inc37.us12.preheader, %for.inc37.us12.for.inc37.us12_crit_edge
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %for.inc37.us12.for.inc37.us12_crit_edge ], [ %indvars.iv42.ph, %for.inc37.us12.preheader ]
  %arrayidx15.us15 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv42, i64 %indvars.iv47
  %4 = load double, double* %arrayidx15.us15, align 8
  %mul16.us16 = fmul double %4, %alpha
  %5 = load double, double* %arrayidx20.us33, align 8
  %mul21.us17 = fmul double %mul16.us16, %5
  %arrayidx25.us18 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv42, i64 %indvars.iv47
  %6 = load double, double* %arrayidx25.us18, align 8
  %mul26.us19 = fmul double %6, %alpha
  %7 = load double, double* %arrayidx30.us34, align 8
  %mul31.us20 = fmul double %mul26.us19, %7
  %add.us21 = fadd double %mul21.us17, %mul31.us20
  %arrayidx35.us22 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %indvars.iv42
  %8 = load double, double* %arrayidx35.us22, align 8
  %add36.us23 = fadd double %8, %add.us21
  store double %add36.us23, double* %arrayidx35.us22, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond = icmp eq i64 %indvars.iv.next43, %indvars.iv52
  br i1 %exitcond, label %for.inc37.us12.for.cond9.for.inc40_crit_edge.us35_crit_edge, label %for.inc37.us12.for.inc37.us12_crit_edge, !llvm.loop !5

for.inc37.us12.for.inc37.us12_crit_edge:          ; preds = %for.inc37.us12
  br label %for.inc37.us12

for.inc37.us12.for.cond9.for.inc40_crit_edge.us35_crit_edge: ; preds = %for.inc37.us12
  br label %for.cond9.for.inc40_crit_edge.us35

for.cond9.preheader.us29:                         ; preds = %for.cond9.preheader.us29.preheader, %for.cond9.for.inc40_crit_edge.us35.for.cond9.preheader.us29_crit_edge
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %for.cond9.for.inc40_crit_edge.us35.for.cond9.preheader.us29_crit_edge ], [ 0, %for.cond9.preheader.us29.preheader ]
  %scevgep95 = getelementptr [1000 x double], [1000 x double]* %A, i64 0, i64 %indvars.iv47
  %9 = add i64 %indvars.iv47, 1
  %scevgep97 = getelementptr [1000 x double], [1000 x double]* %A, i64 %indvars.iv54, i64 %9
  %scevgep99 = getelementptr [1000 x double], [1000 x double]* %B, i64 0, i64 %indvars.iv47
  %scevgep101 = getelementptr [1000 x double], [1000 x double]* %B, i64 %indvars.iv54, i64 %9
  %arrayidx20.us33 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %indvars.iv54, i64 %indvars.iv47
  %arrayidx30.us34 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv54, i64 %indvars.iv47
  br i1 %min.iters.check86, label %for.cond9.preheader.us29.for.inc37.us12_crit_edge, label %min.iters.checked87

for.cond9.preheader.us29.for.inc37.us12_crit_edge: ; preds = %for.cond9.preheader.us29
  br label %for.inc37.us12.preheader

min.iters.checked87:                              ; preds = %for.cond9.preheader.us29
  br i1 %cmp.zero90, label %min.iters.checked87.for.inc37.us12_crit_edge, label %vector.memcheck

min.iters.checked87.for.inc37.us12_crit_edge:     ; preds = %min.iters.checked87
  br label %for.inc37.us12.preheader

vector.memcheck:                                  ; preds = %min.iters.checked87
  %bound0 = icmp ult double* %scevgep, %arrayidx30.us34
  %bound1 = icmp ult double* %arrayidx30.us34, %scevgep93
  %found.conflict = and i1 %bound0, %bound1
  %bound0104 = icmp ult double* %scevgep, %scevgep97
  %bound1105 = icmp ult double* %scevgep95, %scevgep93
  %found.conflict106 = and i1 %bound0104, %bound1105
  %conflict.rdx = or i1 %found.conflict, %found.conflict106
  %bound0107 = icmp ult double* %scevgep, %scevgep101
  %bound1108 = icmp ult double* %scevgep99, %scevgep93
  %found.conflict109 = and i1 %bound0107, %bound1108
  %conflict.rdx110 = or i1 %conflict.rdx, %found.conflict109
  %bound0113 = icmp ult double* %scevgep, %arrayidx20.us33
  %bound1114 = icmp ult double* %arrayidx20.us33, %scevgep93
  %found.conflict115 = and i1 %bound0113, %bound1114
  %conflict.rdx116 = or i1 %conflict.rdx110, %found.conflict115
  br i1 %conflict.rdx116, label %vector.memcheck.for.inc37.us12_crit_edge, label %vector.ph117

vector.memcheck.for.inc37.us12_crit_edge:         ; preds = %vector.memcheck
  br label %for.inc37.us12.preheader

vector.ph117:                                     ; preds = %vector.memcheck
  br label %vector.body83

vector.body83:                                    ; preds = %vector.body83.vector.body83_crit_edge, %vector.ph117
  %index118 = phi i64 [ 0, %vector.ph117 ], [ %index.next119, %vector.body83.vector.body83_crit_edge ]
  %10 = or i64 %index118, 1
  %11 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %index118, i64 %indvars.iv47
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %10, i64 %indvars.iv47
  %13 = load double, double* %11, align 8, !alias.scope !6
  %14 = load double, double* %12, align 8, !alias.scope !6
  %15 = insertelement <2 x double> undef, double %13, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fmul <2 x double> %16, %broadcast.splat126
  %18 = load double, double* %arrayidx20.us33, align 8, !alias.scope !9
  %19 = insertelement <2 x double> undef, double %18, i32 0
  %20 = shufflevector <2 x double> %19, <2 x double> undef, <2 x i32> zeroinitializer
  %21 = fmul <2 x double> %17, %20
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %index118, i64 %indvars.iv47
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %B, i64 %10, i64 %indvars.iv47
  %24 = load double, double* %22, align 8, !alias.scope !11
  %25 = load double, double* %23, align 8, !alias.scope !11
  %26 = insertelement <2 x double> undef, double %24, i32 0
  %27 = insertelement <2 x double> %26, double %25, i32 1
  %28 = fmul <2 x double> %27, %broadcast.splat126
  %29 = load double, double* %arrayidx30.us34, align 8, !alias.scope !13
  %30 = insertelement <2 x double> undef, double %29, i32 0
  %31 = shufflevector <2 x double> %30, <2 x double> undef, <2 x i32> zeroinitializer
  %32 = fmul <2 x double> %28, %31
  %33 = fadd <2 x double> %21, %32
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %index118
  %35 = bitcast double* %34 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %35, align 8, !alias.scope !15, !noalias !17
  %36 = fadd <2 x double> %wide.load, %33
  %37 = bitcast double* %34 to <2 x double>*
  store <2 x double> %36, <2 x double>* %37, align 8, !alias.scope !15, !noalias !17
  %index.next119 = add i64 %index118, 2
  %38 = icmp eq i64 %index.next119, %n.vec89
  br i1 %38, label %middle.block84, label %vector.body83.vector.body83_crit_edge, !llvm.loop !18

vector.body83.vector.body83_crit_edge:            ; preds = %vector.body83
  br label %vector.body83

middle.block84:                                   ; preds = %vector.body83
  br i1 %cmp.n121, label %middle.block84.for.cond9.for.inc40_crit_edge.us35_crit_edge, label %middle.block84.for.inc37.us12_crit_edge

middle.block84.for.inc37.us12_crit_edge:          ; preds = %middle.block84
  br label %for.inc37.us12.preheader

for.inc37.us12.preheader:                         ; preds = %for.cond9.preheader.us29.for.inc37.us12_crit_edge, %min.iters.checked87.for.inc37.us12_crit_edge, %vector.memcheck.for.inc37.us12_crit_edge, %middle.block84.for.inc37.us12_crit_edge
  %indvars.iv42.ph = phi i64 [ 0, %vector.memcheck.for.inc37.us12_crit_edge ], [ 0, %min.iters.checked87.for.inc37.us12_crit_edge ], [ 0, %for.cond9.preheader.us29.for.inc37.us12_crit_edge ], [ %n.vec89, %middle.block84.for.inc37.us12_crit_edge ]
  br label %for.inc37.us12

middle.block84.for.cond9.for.inc40_crit_edge.us35_crit_edge: ; preds = %middle.block84
  br label %for.cond9.for.inc40_crit_edge.us35

for.inc.lr.ph.us:                                 ; preds = %for.cond6.for.inc43_crit_edge.us.for.inc.lr.ph.us_crit_edge, %entry
  %indvars.iv73 = phi i2 [ 1, %entry ], [ %indvars.iv.next74, %for.cond6.for.inc43_crit_edge.us.for.inc.lr.ph.us_crit_edge ]
  %indvars.iv54 = phi i64 [ 0, %entry ], [ %indvars.iv.next55, %for.cond6.for.inc43_crit_edge.us.for.inc.lr.ph.us_crit_edge ]
  %indvars.iv52 = phi i64 [ 1, %entry ], [ %indvars.iv.next53, %for.cond6.for.inc43_crit_edge.us.for.inc.lr.ph.us_crit_edge ]
  %39 = add i64 %indvars.iv54, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 0
  %40 = mul i64 %indvars.iv54, 1201
  %41 = add i64 %40, 1
  %scevgep93 = getelementptr [1200 x double], [1200 x double]* %C, i64 0, i64 %41
  %42 = add i64 %indvars.iv54, 1
  %43 = zext i2 %indvars.iv73 to i64
  %44 = add nuw nsw i64 %43, 4294967295
  %45 = and i64 %44, 4294967295
  %46 = add nuw nsw i64 %45, 1
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %47 = trunc i64 %indvars.iv.next55 to i32
  %xtraiter = and i32 %47, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.lr.ph.us.for.inc.us.prol.loopexit_crit_edge, label %for.inc.lr.ph.us.for.inc.us.prol_crit_edge

for.inc.lr.ph.us.for.inc.us.prol_crit_edge:       ; preds = %for.inc.lr.ph.us
  br label %for.inc.us.prol

for.inc.lr.ph.us.for.inc.us.prol.loopexit_crit_edge: ; preds = %for.inc.lr.ph.us
  br label %for.inc.us.prol.loopexit

for.inc.us.prol:                                  ; preds = %for.inc.us.prol.for.inc.us.prol_crit_edge, %for.inc.lr.ph.us.for.inc.us.prol_crit_edge
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc.us.prol.for.inc.us.prol_crit_edge ], [ 0, %for.inc.lr.ph.us.for.inc.us.prol_crit_edge ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.inc.us.prol.for.inc.us.prol_crit_edge ], [ %xtraiter, %for.inc.lr.ph.us.for.inc.us.prol_crit_edge ]
  %arrayidx5.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %indvars.iv.prol
  %48 = load double, double* %arrayidx5.us.prol, align 8
  %mul.us.prol = fmul double %48, %beta
  store double %mul.us.prol, double* %arrayidx5.us.prol, align 8
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc.us.prol.for.inc.us.prol.loopexit_crit_edge, label %for.inc.us.prol.for.inc.us.prol_crit_edge, !llvm.loop !19

for.inc.us.prol.for.inc.us.prol_crit_edge:        ; preds = %for.inc.us.prol
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  br label %for.inc.us.prol

for.inc.us.prol.for.inc.us.prol.loopexit_crit_edge: ; preds = %for.inc.us.prol
  br label %for.inc.us.prol.loopexit

for.inc.us.prol.loopexit:                         ; preds = %for.inc.us.prol.for.inc.us.prol.loopexit_crit_edge, %for.inc.lr.ph.us.for.inc.us.prol.loopexit_crit_edge
  %indvars.iv.unr = phi i64 [ 0, %for.inc.lr.ph.us.for.inc.us.prol.loopexit_crit_edge ], [ %46, %for.inc.us.prol.for.inc.us.prol.loopexit_crit_edge ]
  %49 = icmp ult i64 %indvars.iv54, 3
  br i1 %49, label %for.inc.us.prol.loopexit.for.cond9.preheader.us29_crit_edge, label %for.inc.us.preheader

for.inc.us.prol.loopexit.for.cond9.preheader.us29_crit_edge: ; preds = %for.inc.us.prol.loopexit
  br label %for.cond9.preheader.us29.preheader

for.inc.us.preheader:                             ; preds = %for.inc.us.prol.loopexit
  %50 = sub i64 %39, %indvars.iv.unr
  %51 = lshr i64 %50, 2
  %52 = add nuw nsw i64 %51, 1
  %min.iters.check130 = icmp ult i64 %52, 2
  br i1 %min.iters.check130, label %for.inc.us.preheader.for.inc.us_crit_edge, label %min.iters.checked131

for.inc.us.preheader.for.inc.us_crit_edge:        ; preds = %for.inc.us.preheader
  br label %for.inc.us.preheader153

min.iters.checked131:                             ; preds = %for.inc.us.preheader
  %n.mod.vf132 = and i64 %52, 1
  %n.vec133 = sub nsw i64 %52, %n.mod.vf132
  %cmp.zero134 = icmp eq i64 %n.vec133, 0
  %53 = add nsw i64 %indvars.iv.unr, 4
  %54 = shl nuw i64 %51, 2
  %55 = add i64 %53, %54
  %56 = shl nuw nsw i64 %n.mod.vf132, 2
  %ind.end139 = sub i64 %55, %56
  br i1 %cmp.zero134, label %min.iters.checked131.for.inc.us_crit_edge, label %vector.ph135

min.iters.checked131.for.inc.us_crit_edge:        ; preds = %min.iters.checked131
  br label %for.inc.us.preheader153

vector.ph135:                                     ; preds = %min.iters.checked131
  br label %vector.body127

vector.body127:                                   ; preds = %vector.body127.vector.body127_crit_edge, %vector.ph135
  %index136 = phi i64 [ 0, %vector.ph135 ], [ %index.next137, %vector.body127.vector.body127_crit_edge ]
  %57 = shl i64 %index136, 2
  %58 = add i64 %indvars.iv.unr, %57
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %58
  %60 = bitcast double* %59 to <8 x double>*
  %wide.vec145 = load <8 x double>, <8 x double>* %60, align 8
  %strided.vec146 = shufflevector <8 x double> %wide.vec145, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec147 = shufflevector <8 x double> %wide.vec145, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec148 = shufflevector <8 x double> %wide.vec145, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec149 = shufflevector <8 x double> %wide.vec145, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %61 = fmul <2 x double> %strided.vec146, %broadcast.splat151
  %62 = fmul <2 x double> %strided.vec147, %broadcast.splat151
  %63 = fmul <2 x double> %strided.vec148, %broadcast.splat151
  %64 = add nsw i64 %58, 3
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv54, i64 %64
  %66 = fmul <2 x double> %strided.vec149, %broadcast.splat151
  %67 = getelementptr double, double* %65, i64 -3
  %68 = bitcast double* %67 to <8 x double>*
  %69 = shufflevector <2 x double> %61, <2 x double> %62, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %70 = shufflevector <2 x double> %63, <2 x double> %66, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec152 = shufflevector <4 x double> %69, <4 x double> %70, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec152, <8 x double>* %68, align 8
  %index.next137 = add i64 %index136, 2
  %71 = icmp eq i64 %index.next137, %n.vec133
  br i1 %71, label %middle.block128, label %vector.body127.vector.body127_crit_edge, !llvm.loop !21

vector.body127.vector.body127_crit_edge:          ; preds = %vector.body127
  br label %vector.body127

middle.block128:                                  ; preds = %vector.body127
  %cmp.n140 = icmp eq i64 %n.mod.vf132, 0
  br i1 %cmp.n140, label %middle.block128.for.cond9.preheader.us29_crit_edge, label %middle.block128.for.inc.us_crit_edge

middle.block128.for.inc.us_crit_edge:             ; preds = %middle.block128
  br label %for.inc.us.preheader153

for.inc.us.preheader153:                          ; preds = %for.inc.us.preheader.for.inc.us_crit_edge, %min.iters.checked131.for.inc.us_crit_edge, %middle.block128.for.inc.us_crit_edge
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked131.for.inc.us_crit_edge ], [ %indvars.iv.unr, %for.inc.us.preheader.for.inc.us_crit_edge ], [ %ind.end139, %middle.block128.for.inc.us_crit_edge ]
  br label %for.inc.us

middle.block128.for.cond9.preheader.us29_crit_edge: ; preds = %middle.block128
  br label %for.cond9.preheader.us29.preheader

for.cond9.preheader.us29.preheader:               ; preds = %for.inc.us.for.cond9.preheader.us29_crit_edge, %for.inc.us.prol.loopexit.for.cond9.preheader.us29_crit_edge, %middle.block128.for.cond9.preheader.us29_crit_edge
  %min.iters.check86 = icmp ult i64 %42, 2
  %n.vec89 = and i64 %42, -2
  %cmp.zero90 = icmp eq i64 %n.vec89, 0
  %cmp.n121 = icmp eq i64 %42, %n.vec89
  br label %for.cond9.preheader.us29

for.cond9.for.inc40_crit_edge.us35:               ; preds = %middle.block84.for.cond9.for.inc40_crit_edge.us35_crit_edge, %for.inc37.us12.for.cond9.for.inc40_crit_edge.us35_crit_edge
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next48, 1000
  br i1 %exitcond50, label %for.cond6.for.inc43_crit_edge.us, label %for.cond9.for.inc40_crit_edge.us35.for.cond9.preheader.us29_crit_edge

for.cond9.for.inc40_crit_edge.us35.for.cond9.preheader.us29_crit_edge: ; preds = %for.cond9.for.inc40_crit_edge.us35
  br label %for.cond9.preheader.us29

for.cond6.for.inc43_crit_edge.us:                 ; preds = %for.cond9.for.inc40_crit_edge.us35
  %exitcond57 = icmp eq i64 %indvars.iv.next55, 1200
  br i1 %exitcond57, label %for.end45, label %for.cond6.for.inc43_crit_edge.us.for.inc.lr.ph.us_crit_edge

for.cond6.for.inc43_crit_edge.us.for.inc.lr.ph.us_crit_edge: ; preds = %for.cond6.for.inc43_crit_edge.us
  %indvars.iv.next74 = add i2 %indvars.iv73, 1
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  br label %for.inc.lr.ph.us

for.end45:                                        ; preds = %for.cond6.for.inc43_crit_edge.us
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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us.for.cond2.preheader.us_crit_edge, %entry
  %indvars.iv7 = phi i64 [ 0, %entry ], [ %indvars.iv.next8, %for.cond2.for.inc10_crit_edge.us.for.cond2.preheader.us_crit_edge ]
  %3 = mul nsw i64 %indvars.iv7, 1200
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us.for.body4.us_crit_edge, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us.for.body4.us_crit_edge ]
  %4 = add nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.body4.us.for.inc.us_crit_edge

for.body4.us.for.inc.us_crit_edge:                ; preds = %for.body4.us
  br label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us.for.inc.us_crit_edge, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv7, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.inc.us.for.body4.us_crit_edge

for.inc.us.for.body4.us_crit_edge:                ; preds = %for.inc.us
  br label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next8, 1200
  br i1 %exitcond11, label %for.end12, label %for.cond2.for.inc10_crit_edge.us.for.cond2.preheader.us_crit_edge

for.cond2.for.inc10_crit_edge.us.for.cond2.preheader.us_crit_edge: ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2, !3, !4}
!2 = !{!"llvm.loop.unroll.runtime.disable"}
!3 = !{!"llvm.loop.vectorize.width", i32 1}
!4 = !{!"llvm.loop.interleave.count", i32 1}
!5 = distinct !{!5, !3, !4}
!6 = !{!7}
!7 = distinct !{!7, !8}
!8 = distinct !{!8, !"LVerDomain"}
!9 = !{!10}
!10 = distinct !{!10, !8}
!11 = !{!12}
!12 = distinct !{!12, !8}
!13 = !{!14}
!14 = distinct !{!14, !8}
!15 = !{!16}
!16 = distinct !{!16, !8}
!17 = !{!14, !7, !12, !10}
!18 = distinct !{!18, !3, !4}
!19 = distinct !{!19, !20}
!20 = !{!"llvm.loop.unroll.disable"}
!21 = distinct !{!21, !3, !4}
