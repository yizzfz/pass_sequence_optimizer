; ModuleID = 'A.ll'
source_filename = "heat-3d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

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
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
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
  %wide.trip.count33 = zext i32 %n to i64
  %wide.trip.count.1 = zext i32 %n to i64
  %wide.trip.count36 = zext i32 %n to i64
  br label %for.cond4.preheader.us.us.preheader

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.lr.ph, %for.cond1.for.inc22_crit_edge.us
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %for.cond1.for.inc22_crit_edge.us ], [ 0, %for.cond1.preheader.lr.ph ]
  %1 = trunc i64 %indvars.iv34 to i32
  %sub.us = add i32 %1, %n
  br label %for.cond4.preheader.us.us

for.cond1.for.inc22_crit_edge.us:                 ; preds = %for.cond4.for.inc19_crit_edge.us.us
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next35, %wide.trip.count36
  br i1 %exitcond37, label %for.end24.loopexit, label %for.cond4.preheader.us.us.preheader

for.cond4.preheader.us.us:                        ; preds = %for.cond4.for.inc19_crit_edge.us.us, %for.cond4.preheader.us.us.preheader
  %indvars.iv31 = phi i64 [ 0, %for.cond4.preheader.us.us.preheader ], [ %indvars.iv.next32, %for.cond4.for.inc19_crit_edge.us.us ]
  %2 = trunc i64 %indvars.iv31 to i32
  %add.us.us = add i32 %sub.us, %2
  br i1 %lcmp.mod, label %for.body6.us.us.prol.loopexit, label %for.body6.us.us.prol

for.body6.us.us.prol:                             ; preds = %for.cond4.preheader.us.us
  %conv.us.us.prol = sitofp i32 %add.us.us to double
  %mul.us.us.prol = fmul double %conv.us.us.prol, 1.000000e+01
  %div.us.us.prol = fdiv double %mul.us.us.prol, %conv8
  %arrayidx12.us.us.prol = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv34, i64 %indvars.iv31, i64 0
  store double %div.us.us.prol, double* %arrayidx12.us.us.prol, align 8
  %arrayidx18.us.us.prol = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv34, i64 %indvars.iv31, i64 0
  store double %div.us.us.prol, double* %arrayidx18.us.us.prol, align 8
  br label %for.body6.us.us.prol.loopexit

for.body6.us.us.prol.loopexit:                    ; preds = %for.body6.us.us.prol, %for.cond4.preheader.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body6.us.us.prol ], [ 0, %for.cond4.preheader.us.us ]
  br i1 %0, label %for.cond4.for.inc19_crit_edge.us.us, label %for.body6.us.us.preheader

for.body6.us.us.preheader:                        ; preds = %for.body6.us.us.prol.loopexit
  br label %for.body6.us.us

for.cond4.for.inc19_crit_edge.us.us.loopexit:     ; preds = %for.body6.us.us
  br label %for.cond4.for.inc19_crit_edge.us.us

for.cond4.for.inc19_crit_edge.us.us:              ; preds = %for.cond4.for.inc19_crit_edge.us.us.loopexit, %for.body6.us.us.prol.loopexit
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond = icmp eq i64 %indvars.iv.next32, %wide.trip.count33
  br i1 %exitcond, label %for.cond1.for.inc22_crit_edge.us, label %for.cond4.preheader.us.us

for.body6.us.us:                                  ; preds = %for.body6.us.us.preheader, %for.body6.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body6.us.us ], [ %indvars.iv.unr.ph, %for.body6.us.us.preheader ]
  %3 = trunc i64 %indvars.iv to i32
  %add7.us.us = sub i32 %add.us.us, %3
  %conv.us.us = sitofp i32 %add7.us.us to double
  %mul.us.us = fmul double %conv.us.us, 1.000000e+01
  %div.us.us = fdiv double %mul.us.us, %conv8
  %arrayidx12.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv34, i64 %indvars.iv31, i64 %indvars.iv
  store double %div.us.us, double* %arrayidx12.us.us, align 8
  %arrayidx18.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv34, i64 %indvars.iv31, i64 %indvars.iv
  store double %div.us.us, double* %arrayidx18.us.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %4 = trunc i64 %indvars.iv.next to i32
  %add7.us.us.1 = sub i32 %add.us.us, %4
  %conv.us.us.1 = sitofp i32 %add7.us.us.1 to double
  %mul.us.us.1 = fmul double %conv.us.us.1, 1.000000e+01
  %div.us.us.1 = fdiv double %mul.us.us.1, %conv8
  %arrayidx12.us.us.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv34, i64 %indvars.iv31, i64 %indvars.iv.next
  store double %div.us.us.1, double* %arrayidx12.us.us.1, align 8
  %arrayidx18.us.us.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv34, i64 %indvars.iv31, i64 %indvars.iv.next
  store double %div.us.us.1, double* %arrayidx18.us.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.cond4.for.inc19_crit_edge.us.us.loopexit, label %for.body6.us.us

for.end24.loopexit:                               ; preds = %for.cond1.for.inc22_crit_edge.us
  br label %for.end24

for.end24:                                        ; preds = %for.end24.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32 %n, [120 x [120 x double]]* nocapture %A, [120 x [120 x double]]* nocapture %B) unnamed_addr #2 {
entry:
  %sub = add nsw i32 %n, -1
  %cmp25 = icmp sgt i32 %sub, 1
  %wide.trip.count19 = zext i32 %sub to i64
  %wide.trip.count = zext i32 %sub to i64
  %wide.trip.count29 = zext i32 %sub to i64
  %wide.trip.count24 = zext i32 %sub to i64
  %0 = add nsw i64 %wide.trip.count24, -1
  %min.iters.check50 = icmp ult i64 %0, 2
  %n.vec53 = and i64 %0, -2
  %cmp.zero54 = icmp eq i64 %n.vec53, 0
  %ind.end77 = or i64 %0, 1
  %cmp.n78 = icmp eq i64 %0, %n.vec53
  %min.iters.check = icmp ult i64 %0, 2
  %n.vec = and i64 %0, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %0, 1
  %cmp.n = icmp eq i64 %0, %n.vec
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc209, %entry
  %t.013 = phi i32 [ 1, %entry ], [ %inc210, %for.inc209 ]
  br i1 %cmp25, label %for.cond8.preheader.lr.ph.preheader, label %for.inc209

for.cond8.preheader.lr.ph.preheader:              ; preds = %for.cond1.preheader
  br label %for.cond8.preheader.lr.ph

for.cond101.preheader:                            ; preds = %for.inc98
  br i1 %cmp25, label %for.cond109.preheader.lr.ph.preheader, label %for.inc209

for.cond109.preheader.lr.ph.preheader:            ; preds = %for.cond101.preheader
  br label %for.cond109.preheader.lr.ph

for.cond8.preheader.lr.ph:                        ; preds = %for.cond8.preheader.lr.ph.preheader, %for.inc98
  %indvar56 = phi i64 [ %indvar.next57, %for.inc98 ], [ 0, %for.cond8.preheader.lr.ph.preheader ]
  %i.06 = phi i32 [ %add, %for.inc98 ], [ 1, %for.cond8.preheader.lr.ph.preheader ]
  %1 = add i64 %indvar56, 1
  %2 = add i64 %indvar56, 2
  %add = add nsw i32 %i.06, 1
  %idxprom = sext i32 %add to i64
  %idxprom16 = sext i32 %i.06 to i64
  %sub23 = add nsw i32 %i.06, -1
  %idxprom24 = sext i32 %sub23 to i64
  br label %for.cond8.preheader.us

for.cond8.preheader.us:                           ; preds = %for.cond8.for.inc95_crit_edge.us, %for.cond8.preheader.lr.ph
  %indvar58 = phi i64 [ %indvar.next59, %for.cond8.for.inc95_crit_edge.us ], [ 0, %for.cond8.preheader.lr.ph ]
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %for.cond8.for.inc95_crit_edge.us ], [ 1, %for.cond8.preheader.lr.ph ]
  %3 = add i64 %indvar58, 1
  %scevgep60 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %1, i64 %3, i64 1
  %scevgep62 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %1, i64 %3, i64 %wide.trip.count24
  %scevgep64 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvar56, i64 %3, i64 1
  %scevgep66 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %2, i64 %3, i64 %wide.trip.count24
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %4 = add nsw i64 %indvars.iv16, -1
  br i1 %min.iters.check50, label %for.body11.us.preheader, label %min.iters.checked51

min.iters.checked51:                              ; preds = %for.cond8.preheader.us
  br i1 %cmp.zero54, label %for.body11.us.preheader, label %vector.memcheck72

vector.memcheck72:                                ; preds = %min.iters.checked51
  %bound068 = icmp ult double* %scevgep60, %scevgep66
  %bound169 = icmp ult double* %scevgep64, %scevgep62
  %memcheck.conflict71 = and i1 %bound068, %bound169
  br i1 %memcheck.conflict71, label %for.body11.us.preheader, label %vector.body47.preheader

vector.body47.preheader:                          ; preds = %vector.memcheck72
  br label %vector.body47

vector.body47:                                    ; preds = %vector.body47.preheader, %vector.body47
  %index74 = phi i64 [ %index.next75, %vector.body47 ], [ 0, %vector.body47.preheader ]
  %offset.idx79 = or i64 %index74, 1
  %5 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %idxprom, i64 %indvars.iv16, i64 %offset.idx79
  %6 = bitcast double* %5 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %6, align 8, !alias.scope !1
  %7 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %idxprom16, i64 %indvars.iv16, i64 %offset.idx79
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load84 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !1
  %9 = fmul <2 x double> %wide.load84, <double 2.000000e+00, double 2.000000e+00>
  %10 = fsub <2 x double> %wide.load83, %9
  %11 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %idxprom24, i64 %indvars.iv16, i64 %offset.idx79
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load85 = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !1
  %13 = fadd <2 x double> %wide.load85, %10
  %14 = fmul <2 x double> %13, <double 1.250000e-01, double 1.250000e-01>
  %15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %idxprom16, i64 %indvars.iv.next17, i64 %offset.idx79
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !1
  %17 = fsub <2 x double> %wide.load86, %9
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %idxprom16, i64 %4, i64 %offset.idx79
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !1
  %20 = fadd <2 x double> %17, %wide.load87
  %21 = fmul <2 x double> %20, <double 1.250000e-01, double 1.250000e-01>
  %22 = fadd <2 x double> %14, %21
  %23 = add nuw nsw i64 %offset.idx79, 1
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %idxprom16, i64 %indvars.iv16, i64 %23
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !1
  %26 = fsub <2 x double> %wide.load88, %9
  %27 = add nsw i64 %offset.idx79, -1
  %28 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %idxprom16, i64 %indvars.iv16, i64 %27
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !1
  %30 = fadd <2 x double> %26, %wide.load89
  %31 = fmul <2 x double> %30, <double 1.250000e-01, double 1.250000e-01>
  %32 = fadd <2 x double> %22, %31
  %33 = fadd <2 x double> %wide.load84, %32
  %34 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %idxprom16, i64 %indvars.iv16, i64 %offset.idx79
  %35 = bitcast double* %34 to <2 x double>*
  store <2 x double> %33, <2 x double>* %35, align 8, !alias.scope !4, !noalias !1
  %index.next75 = add i64 %index74, 2
  %36 = icmp eq i64 %index.next75, %n.vec53
  br i1 %36, label %middle.block48, label %vector.body47, !llvm.loop !6

middle.block48:                                   ; preds = %vector.body47
  br i1 %cmp.n78, label %for.cond8.for.inc95_crit_edge.us, label %for.body11.us.preheader

for.body11.us.preheader:                          ; preds = %middle.block48, %vector.memcheck72, %min.iters.checked51, %for.cond8.preheader.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck72 ], [ 1, %min.iters.checked51 ], [ 1, %for.cond8.preheader.us ], [ %ind.end77, %middle.block48 ]
  br label %for.body11.us

for.body11.us:                                    ; preds = %for.body11.us.preheader, %for.body11.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body11.us ], [ %indvars.iv.ph, %for.body11.us.preheader ]
  %arrayidx15.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %idxprom, i64 %indvars.iv16, i64 %indvars.iv
  %37 = load double, double* %arrayidx15.us, align 8
  %arrayidx21.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %idxprom16, i64 %indvars.iv16, i64 %indvars.iv
  %38 = load double, double* %arrayidx21.us, align 8
  %mul.us = fmul double %38, 2.000000e+00
  %sub22.us = fsub double %37, %mul.us
  %arrayidx29.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %idxprom24, i64 %indvars.iv16, i64 %indvars.iv
  %39 = load double, double* %arrayidx29.us, align 8
  %add30.us = fadd double %39, %sub22.us
  %mul31.us = fmul double %add30.us, 1.250000e-01
  %arrayidx38.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %idxprom16, i64 %indvars.iv.next17, i64 %indvars.iv
  %40 = load double, double* %arrayidx38.us, align 8
  %sub46.us = fsub double %40, %mul.us
  %arrayidx53.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %idxprom16, i64 %4, i64 %indvars.iv
  %41 = load double, double* %arrayidx53.us, align 8
  %add54.us = fadd double %sub46.us, %41
  %mul55.us = fmul double %add54.us, 1.250000e-01
  %add56.us = fadd double %mul31.us, %mul55.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx63.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %idxprom16, i64 %indvars.iv16, i64 %indvars.iv.next
  %42 = load double, double* %arrayidx63.us, align 8
  %sub71.us = fsub double %42, %mul.us
  %43 = add nsw i64 %indvars.iv, -1
  %arrayidx78.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %idxprom16, i64 %indvars.iv16, i64 %43
  %44 = load double, double* %arrayidx78.us, align 8
  %add79.us = fadd double %sub71.us, %44
  %mul80.us = fmul double %add79.us, 1.250000e-01
  %add81.us = fadd double %add56.us, %mul80.us
  %add88.us = fadd double %38, %add81.us
  %arrayidx94.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %idxprom16, i64 %indvars.iv16, i64 %indvars.iv
  store double %add88.us, double* %arrayidx94.us, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond8.for.inc95_crit_edge.us.loopexit, label %for.body11.us, !llvm.loop !9

for.cond8.for.inc95_crit_edge.us.loopexit:        ; preds = %for.body11.us
  br label %for.cond8.for.inc95_crit_edge.us

for.cond8.for.inc95_crit_edge.us:                 ; preds = %for.cond8.for.inc95_crit_edge.us.loopexit, %middle.block48
  %exitcond20 = icmp eq i64 %indvars.iv.next17, %wide.trip.count19
  %indvar.next59 = add i64 %indvar58, 1
  br i1 %exitcond20, label %for.inc98, label %for.cond8.preheader.us

for.inc98:                                        ; preds = %for.cond8.for.inc95_crit_edge.us
  %cmp2 = icmp slt i32 %add, %sub
  %indvar.next57 = add i64 %indvar56, 1
  br i1 %cmp2, label %for.cond8.preheader.lr.ph, label %for.cond101.preheader

for.cond109.preheader.lr.ph:                      ; preds = %for.cond109.preheader.lr.ph.preheader, %for.inc206
  %indvar = phi i64 [ %indvar.next, %for.inc206 ], [ 0, %for.cond109.preheader.lr.ph.preheader ]
  %i.112 = phi i32 [ %add113, %for.inc206 ], [ 1, %for.cond109.preheader.lr.ph.preheader ]
  %45 = add i64 %indvar, 1
  %46 = add i64 %indvar, 2
  %add113 = add nsw i32 %i.112, 1
  %idxprom114 = sext i32 %add113 to i64
  %idxprom120 = sext i32 %i.112 to i64
  %sub128 = add nsw i32 %i.112, -1
  %idxprom129 = sext i32 %sub128 to i64
  br label %for.cond109.preheader.us

for.cond109.preheader.us:                         ; preds = %for.cond109.for.inc203_crit_edge.us, %for.cond109.preheader.lr.ph
  %indvar32 = phi i64 [ %indvar.next33, %for.cond109.for.inc203_crit_edge.us ], [ 0, %for.cond109.preheader.lr.ph ]
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %for.cond109.for.inc203_crit_edge.us ], [ 1, %for.cond109.preheader.lr.ph ]
  %47 = add i64 %indvar32, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %45, i64 %47, i64 1
  %scevgep35 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %45, i64 %47, i64 %wide.trip.count24
  %scevgep37 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvar, i64 %47, i64 1
  %scevgep39 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %46, i64 %47, i64 %wide.trip.count24
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %48 = add nsw i64 %indvars.iv26, -1
  br i1 %min.iters.check, label %for.body112.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond109.preheader.us
  br i1 %cmp.zero, label %for.body112.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep39
  %bound1 = icmp ult double* %scevgep37, %scevgep35
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.body112.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %49 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %idxprom114, i64 %indvars.iv26, i64 %offset.idx
  %50 = bitcast double* %49 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %50, align 8, !alias.scope !10
  %51 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %idxprom120, i64 %indvars.iv26, i64 %offset.idx
  %52 = bitcast double* %51 to <2 x double>*
  %wide.load41 = load <2 x double>, <2 x double>* %52, align 8, !alias.scope !10
  %53 = fmul <2 x double> %wide.load41, <double 2.000000e+00, double 2.000000e+00>
  %54 = fsub <2 x double> %wide.load, %53
  %55 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %idxprom129, i64 %indvars.iv26, i64 %offset.idx
  %56 = bitcast double* %55 to <2 x double>*
  %wide.load42 = load <2 x double>, <2 x double>* %56, align 8, !alias.scope !10
  %57 = fadd <2 x double> %wide.load42, %54
  %58 = fmul <2 x double> %57, <double 1.250000e-01, double 1.250000e-01>
  %59 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %idxprom120, i64 %indvars.iv.next27, i64 %offset.idx
  %60 = bitcast double* %59 to <2 x double>*
  %wide.load43 = load <2 x double>, <2 x double>* %60, align 8, !alias.scope !10
  %61 = fsub <2 x double> %wide.load43, %53
  %62 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %idxprom120, i64 %48, i64 %offset.idx
  %63 = bitcast double* %62 to <2 x double>*
  %wide.load44 = load <2 x double>, <2 x double>* %63, align 8, !alias.scope !10
  %64 = fadd <2 x double> %61, %wide.load44
  %65 = fmul <2 x double> %64, <double 1.250000e-01, double 1.250000e-01>
  %66 = fadd <2 x double> %58, %65
  %67 = add nuw nsw i64 %offset.idx, 1
  %68 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %idxprom120, i64 %indvars.iv26, i64 %67
  %69 = bitcast double* %68 to <2 x double>*
  %wide.load45 = load <2 x double>, <2 x double>* %69, align 8, !alias.scope !10
  %70 = fsub <2 x double> %wide.load45, %53
  %71 = add nsw i64 %offset.idx, -1
  %72 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %idxprom120, i64 %indvars.iv26, i64 %71
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load46 = load <2 x double>, <2 x double>* %73, align 8, !alias.scope !10
  %74 = fadd <2 x double> %70, %wide.load46
  %75 = fmul <2 x double> %74, <double 1.250000e-01, double 1.250000e-01>
  %76 = fadd <2 x double> %66, %75
  %77 = fadd <2 x double> %wide.load41, %76
  %78 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %idxprom120, i64 %indvars.iv26, i64 %offset.idx
  %79 = bitcast double* %78 to <2 x double>*
  store <2 x double> %77, <2 x double>* %79, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %80 = icmp eq i64 %index.next, %n.vec
  br i1 %80, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond109.for.inc203_crit_edge.us, label %for.body112.us.preheader

for.body112.us.preheader:                         ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond109.preheader.us
  %indvars.iv21.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %for.cond109.preheader.us ], [ %ind.end, %middle.block ]
  br label %for.body112.us

for.body112.us:                                   ; preds = %for.body112.us.preheader, %for.body112.us
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %for.body112.us ], [ %indvars.iv21.ph, %for.body112.us.preheader ]
  %arrayidx119.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %idxprom114, i64 %indvars.iv26, i64 %indvars.iv21
  %81 = load double, double* %arrayidx119.us, align 8
  %arrayidx125.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %idxprom120, i64 %indvars.iv26, i64 %indvars.iv21
  %82 = load double, double* %arrayidx125.us, align 8
  %mul126.us = fmul double %82, 2.000000e+00
  %sub127.us = fsub double %81, %mul126.us
  %arrayidx134.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %idxprom129, i64 %indvars.iv26, i64 %indvars.iv21
  %83 = load double, double* %arrayidx134.us, align 8
  %add135.us = fadd double %83, %sub127.us
  %mul136.us = fmul double %add135.us, 1.250000e-01
  %arrayidx143.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %idxprom120, i64 %indvars.iv.next27, i64 %indvars.iv21
  %84 = load double, double* %arrayidx143.us, align 8
  %sub151.us = fsub double %84, %mul126.us
  %arrayidx158.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %idxprom120, i64 %48, i64 %indvars.iv21
  %85 = load double, double* %arrayidx158.us, align 8
  %add159.us = fadd double %sub151.us, %85
  %mul160.us = fmul double %add159.us, 1.250000e-01
  %add161.us = fadd double %mul136.us, %mul160.us
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %arrayidx168.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %idxprom120, i64 %indvars.iv26, i64 %indvars.iv.next22
  %86 = load double, double* %arrayidx168.us, align 8
  %sub176.us = fsub double %86, %mul126.us
  %87 = add nsw i64 %indvars.iv21, -1
  %arrayidx183.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %idxprom120, i64 %indvars.iv26, i64 %87
  %88 = load double, double* %arrayidx183.us, align 8
  %add184.us = fadd double %sub176.us, %88
  %mul185.us = fmul double %add184.us, 1.250000e-01
  %add186.us = fadd double %add161.us, %mul185.us
  %add193.us = fadd double %82, %add186.us
  %arrayidx199.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %idxprom120, i64 %indvars.iv26, i64 %indvars.iv21
  store double %add193.us, double* %arrayidx199.us, align 8
  %exitcond25 = icmp eq i64 %indvars.iv.next22, %wide.trip.count24
  br i1 %exitcond25, label %for.cond109.for.inc203_crit_edge.us.loopexit, label %for.body112.us, !llvm.loop !16

for.cond109.for.inc203_crit_edge.us.loopexit:     ; preds = %for.body112.us
  br label %for.cond109.for.inc203_crit_edge.us

for.cond109.for.inc203_crit_edge.us:              ; preds = %for.cond109.for.inc203_crit_edge.us.loopexit, %middle.block
  %exitcond30 = icmp eq i64 %indvars.iv.next27, %wide.trip.count29
  %indvar.next33 = add i64 %indvar32, 1
  br i1 %exitcond30, label %for.inc206, label %for.cond109.preheader.us

for.inc206:                                       ; preds = %for.cond109.for.inc203_crit_edge.us
  %cmp103 = icmp slt i32 %add113, %sub
  %indvar.next = add i64 %indvar, 1
  br i1 %cmp103, label %for.cond109.preheader.lr.ph, label %for.inc209.loopexit

for.inc209.loopexit:                              ; preds = %for.inc206
  br label %for.inc209

for.inc209:                                       ; preds = %for.inc209.loopexit, %for.cond1.preheader, %for.cond101.preheader
  %inc210 = add nuw nsw i32 %t.013, 1
  %exitcond31 = icmp eq i32 %inc210, 501
  br i1 %exitcond31, label %for.end211, label %for.cond1.preheader

for.end211:                                       ; preds = %for.inc209
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
  %wide.trip.count37 = zext i32 %n to i64
  %wide.trip.count42 = zext i32 %n to i64
  br label %for.cond5.preheader.us.us.preheader

for.cond5.preheader.us.us.preheader:              ; preds = %for.cond2.preheader.lr.ph, %for.cond2.for.inc21_crit_edge.us
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %for.cond2.for.inc21_crit_edge.us ], [ 0, %for.cond2.preheader.lr.ph ]
  %4 = mul nsw i64 %indvars.iv39, %3
  %5 = trunc i64 %4 to i32
  br label %for.cond5.preheader.us.us

for.cond2.for.inc21_crit_edge.us:                 ; preds = %for.cond5.for.inc18_crit_edge.us.us
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next40, %wide.trip.count42
  br i1 %exitcond43, label %for.end23.loopexit, label %for.cond5.preheader.us.us.preheader

for.cond5.preheader.us.us:                        ; preds = %for.cond5.for.inc18_crit_edge.us.us, %for.cond5.preheader.us.us.preheader
  %indvars.iv35 = phi i64 [ 0, %for.cond5.preheader.us.us.preheader ], [ %indvars.iv.next36, %for.cond5.for.inc18_crit_edge.us.us ]
  %6 = trunc i64 %indvars.iv35 to i32
  %mul81.us.us = add i32 %6, %5
  %add.us.us = mul i32 %mul81.us.us, %n
  %7 = zext i32 %add.us.us to i64
  br label %for.body7.us.us

for.cond5.for.inc18_crit_edge.us.us:              ; preds = %if.end.us.us
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next36, %wide.trip.count37
  br i1 %exitcond38, label %for.cond2.for.inc21_crit_edge.us, label %for.cond5.preheader.us.us

for.body7.us.us:                                  ; preds = %if.end.us.us, %for.cond5.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end.us.us ], [ 0, %for.cond5.preheader.us.us ]
  %8 = add i64 %indvars.iv, %7
  %9 = trunc i64 %8 to i32
  %rem.us.us = srem i32 %9, 20
  %cmp11.us.us = icmp eq i32 %rem.us.us, 0
  br i1 %cmp11.us.us, label %if.then.us.us, label %if.end.us.us

if.then.us.us:                                    ; preds = %for.body7.us.us
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #5
  br label %if.end.us.us

if.end.us.us:                                     ; preds = %if.then.us.us, %for.body7.us.us
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv39, i64 %indvars.iv35, i64 %indvars.iv
  %12 = load double, double* %arrayidx16.us.us, align 8
  %call17.us.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %12) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond5.for.inc18_crit_edge.us.us, label %for.body7.us.us

for.end23.loopexit:                               ; preds = %for.cond2.for.inc21_crit_edge.us
  br label %for.end23

for.end23:                                        ; preds = %for.end23.loopexit, %entry
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %14) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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
