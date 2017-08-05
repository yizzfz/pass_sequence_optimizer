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
  br i1 true, label %for.cond1.preheader.lr.ph, label %entry.for.end24_crit_edge

entry.for.end24_crit_edge:                        ; preds = %entry
  br label %for.end24

for.cond1.preheader.lr.ph:                        ; preds = %entry
  br label %for.cond4.preheader.us.us.preheader

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.lr.ph, %for.cond1.for.inc22_crit_edge.us
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %for.cond1.for.inc22_crit_edge.us ], [ 0, %for.cond1.preheader.lr.ph ]
  %0 = trunc i64 %indvars.iv35 to i32
  %sub.us = add i32 %0, 120
  br label %for.cond4.preheader.us.us

for.cond1.for.inc22_crit_edge.us:                 ; preds = %for.cond4.for.inc19_crit_edge.us.us
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next36, 120
  br i1 %exitcond38, label %for.end24.loopexit, label %for.cond4.preheader.us.us.preheader

for.cond4.preheader.us.us:                        ; preds = %for.cond4.for.inc19_crit_edge.us.us, %for.cond4.preheader.us.us.preheader
  %indvars.iv32 = phi i64 [ 0, %for.cond4.preheader.us.us.preheader ], [ %indvars.iv.next33, %for.cond4.for.inc19_crit_edge.us.us ]
  %1 = trunc i64 %indvars.iv32 to i32
  %add.us.us = add i32 %sub.us, %1
  br i1 true, label %for.body6.us.us.prol.loopexit, label %for.body6.us.us.prol

for.body6.us.us.prol:                             ; preds = %for.cond4.preheader.us.us
  %conv.us.us.prol = sitofp i32 %add.us.us to double
  %mul.us.us.prol = fmul double %conv.us.us.prol, 1.000000e+01
  %div.us.us.prol = fdiv double %mul.us.us.prol, 1.200000e+02
  %arrayidx12.us.us.prol = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv35, i64 %indvars.iv32, i64 0
  store double %div.us.us.prol, double* %arrayidx12.us.us.prol, align 8
  %arrayidx18.us.us.prol = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv35, i64 %indvars.iv32, i64 0
  store double %div.us.us.prol, double* %arrayidx18.us.us.prol, align 8
  br label %for.body6.us.us.prol.loopexit

for.body6.us.us.prol.loopexit:                    ; preds = %for.body6.us.us.prol, %for.cond4.preheader.us.us
  br i1 false, label %for.body6.us.us.prol.loopexit.for.cond4.for.inc19_crit_edge.us.us_crit_edge, label %for.body6.us.us.preheader

for.body6.us.us.prol.loopexit.for.cond4.for.inc19_crit_edge.us.us_crit_edge: ; preds = %for.body6.us.us.prol.loopexit
  br label %for.cond4.for.inc19_crit_edge.us.us

for.body6.us.us.preheader:                        ; preds = %for.body6.us.us.prol.loopexit
  br label %for.body6.us.us

for.cond4.for.inc19_crit_edge.us.us.loopexit:     ; preds = %for.body6.us.us
  br label %for.cond4.for.inc19_crit_edge.us.us

for.cond4.for.inc19_crit_edge.us.us:              ; preds = %for.body6.us.us.prol.loopexit.for.cond4.for.inc19_crit_edge.us.us_crit_edge, %for.cond4.for.inc19_crit_edge.us.us.loopexit
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond = icmp eq i64 %indvars.iv.next33, 120
  br i1 %exitcond, label %for.cond1.for.inc22_crit_edge.us, label %for.cond4.preheader.us.us

for.body6.us.us:                                  ; preds = %for.body6.us.us.preheader, %for.body6.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body6.us.us ], [ 0, %for.body6.us.us.preheader ]
  %2 = trunc i64 %indvars.iv to i32
  %add7.us.us = sub i32 %add.us.us, %2
  %conv.us.us = sitofp i32 %add7.us.us to double
  %mul.us.us = fmul double %conv.us.us, 1.000000e+01
  %div.us.us = fdiv double %mul.us.us, 1.200000e+02
  %arrayidx12.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv35, i64 %indvars.iv32, i64 %indvars.iv
  store double %div.us.us, double* %arrayidx12.us.us, align 8
  %arrayidx18.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv35, i64 %indvars.iv32, i64 %indvars.iv
  store double %div.us.us, double* %arrayidx18.us.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %3 = trunc i64 %indvars.iv.next to i32
  %add7.us.us.1 = sub i32 %add.us.us, %3
  %conv.us.us.1 = sitofp i32 %add7.us.us.1 to double
  %mul.us.us.1 = fmul double %conv.us.us.1, 1.000000e+01
  %div.us.us.1 = fdiv double %mul.us.us.1, 1.200000e+02
  %arrayidx12.us.us.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv35, i64 %indvars.iv32, i64 %indvars.iv.next
  store double %div.us.us.1, double* %arrayidx12.us.us.1, align 8
  %arrayidx18.us.us.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv35, i64 %indvars.iv32, i64 %indvars.iv.next
  store double %div.us.us.1, double* %arrayidx18.us.us.1, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %for.cond4.for.inc19_crit_edge.us.us.loopexit, label %for.body6.us.us

for.end24.loopexit:                               ; preds = %for.cond1.for.inc22_crit_edge.us
  br label %for.end24

for.end24:                                        ; preds = %entry.for.end24_crit_edge, %for.end24.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32 %n, [120 x [120 x double]]* nocapture %A, [120 x [120 x double]]* nocapture %B) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc209, %entry
  %t.013 = phi i32 [ 1, %entry ], [ %inc210, %for.inc209 ]
  br i1 true, label %for.cond4.preheader.preheader, label %for.cond1.preheader.for.inc209_crit_edge

for.cond1.preheader.for.inc209_crit_edge:         ; preds = %for.cond1.preheader
  br label %for.inc209

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  br label %for.cond4.preheader

for.cond101.preheader:                            ; preds = %for.inc98
  br i1 true, label %for.cond109.preheader.lr.ph.preheader, label %for.cond101.preheader.for.inc209_crit_edge

for.cond101.preheader.for.inc209_crit_edge:       ; preds = %for.cond101.preheader
  br label %for.inc209

for.cond109.preheader.lr.ph.preheader:            ; preds = %for.cond101.preheader
  br label %for.cond109.preheader.lr.ph

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc98
  %indvar68 = phi i64 [ %0, %for.inc98 ], [ 0, %for.cond4.preheader.preheader ]
  %indvars.iv20 = phi i64 [ %indvars.iv.next21.pre-phi, %for.inc98 ], [ 1, %for.cond4.preheader.preheader ]
  %0 = add nuw nsw i64 %indvar68, 1
  %1 = add nuw nsw i64 %indvar68, 2
  br i1 true, label %for.cond8.preheader.lr.ph, label %for.cond4.preheader.for.inc98_crit_edge

for.cond4.preheader.for.inc98_crit_edge:          ; preds = %for.cond4.preheader
  %.pre = add nuw nsw i64 %indvars.iv20, 1
  br label %for.inc98

for.cond8.preheader.lr.ph:                        ; preds = %for.cond4.preheader
  %2 = add nuw nsw i64 %indvars.iv20, 1
  %3 = add nsw i64 %indvars.iv20, -1
  br label %for.cond8.preheader.us

for.cond8.preheader.us:                           ; preds = %for.cond8.for.inc95_crit_edge.us, %for.cond8.preheader.lr.ph
  %indvar70 = phi i64 [ %4, %for.cond8.for.inc95_crit_edge.us ], [ 0, %for.cond8.preheader.lr.ph ]
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %for.cond8.for.inc95_crit_edge.us ], [ 1, %for.cond8.preheader.lr.ph ]
  %4 = add nuw nsw i64 %indvar70, 1
  %scevgep72 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %0, i64 %4, i64 1
  %scevgep74 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %0, i64 %4, i64 119
  %scevgep76 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvar68, i64 %4, i64 1
  %scevgep78 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %1, i64 %4, i64 119
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %5 = add nsw i64 %indvars.iv15, -1
  br i1 false, label %for.cond8.preheader.us.for.body11.us.preheader_crit_edge, label %min.iters.checked63

for.cond8.preheader.us.for.body11.us.preheader_crit_edge: ; preds = %for.cond8.preheader.us
  br label %for.body11.us.preheader

min.iters.checked63:                              ; preds = %for.cond8.preheader.us
  br i1 false, label %min.iters.checked63.for.body11.us.preheader_crit_edge, label %vector.memcheck84

min.iters.checked63.for.body11.us.preheader_crit_edge: ; preds = %min.iters.checked63
  br label %for.body11.us.preheader

vector.memcheck84:                                ; preds = %min.iters.checked63
  %bound080 = icmp ult double* %scevgep72, %scevgep78
  %bound181 = icmp ult double* %scevgep76, %scevgep74
  %memcheck.conflict83 = and i1 %bound080, %bound181
  br i1 %memcheck.conflict83, label %for.body11.us.preheader, label %vector.body59.preheader

vector.body59.preheader:                          ; preds = %vector.memcheck84
  br label %vector.body59

vector.body59:                                    ; preds = %vector.body59.preheader, %vector.body59
  %index86 = phi i64 [ %index.next87, %vector.body59 ], [ 0, %vector.body59.preheader ]
  %offset.idx91 = or i64 %index86, 1
  %6 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %2, i64 %indvars.iv15, i64 %offset.idx91
  %7 = bitcast double* %6 to <2 x double>*
  %wide.load95 = load <2 x double>, <2 x double>* %7, align 8, !alias.scope !1
  %8 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv20, i64 %indvars.iv15, i64 %offset.idx91
  %9 = bitcast double* %8 to <2 x double>*
  %wide.load96 = load <2 x double>, <2 x double>* %9, align 8, !alias.scope !1
  %10 = fmul <2 x double> %wide.load96, <double 2.000000e+00, double 2.000000e+00>
  %11 = fsub <2 x double> %wide.load95, %10
  %12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %3, i64 %indvars.iv15, i64 %offset.idx91
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load97 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !1
  %14 = fadd <2 x double> %wide.load97, %11
  %15 = fmul <2 x double> %14, <double 1.250000e-01, double 1.250000e-01>
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv20, i64 %indvars.iv.next16, i64 %offset.idx91
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load98 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = fsub <2 x double> %wide.load98, %10
  %19 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv20, i64 %5, i64 %offset.idx91
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load99 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !1
  %21 = fadd <2 x double> %18, %wide.load99
  %22 = fmul <2 x double> %21, <double 1.250000e-01, double 1.250000e-01>
  %23 = fadd <2 x double> %15, %22
  %24 = add nuw nsw i64 %offset.idx91, 1
  %25 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv20, i64 %indvars.iv15, i64 %24
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load100 = load <2 x double>, <2 x double>* %26, align 8, !alias.scope !1
  %27 = fsub <2 x double> %wide.load100, %10
  %28 = add nsw i64 %offset.idx91, -1
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv20, i64 %indvars.iv15, i64 %28
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load101 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !1
  %31 = fadd <2 x double> %27, %wide.load101
  %32 = fmul <2 x double> %31, <double 1.250000e-01, double 1.250000e-01>
  %33 = fadd <2 x double> %23, %32
  %34 = fadd <2 x double> %wide.load96, %33
  %35 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv20, i64 %indvars.iv15, i64 %offset.idx91
  %36 = bitcast double* %35 to <2 x double>*
  store <2 x double> %34, <2 x double>* %36, align 8, !alias.scope !4, !noalias !1
  %index.next87 = add i64 %index86, 2
  %37 = icmp eq i64 %index.next87, 118
  br i1 %37, label %middle.block60, label %vector.body59, !llvm.loop !6

middle.block60:                                   ; preds = %vector.body59
  br i1 true, label %for.cond8.for.inc95_crit_edge.us, label %middle.block60.for.body11.us.preheader_crit_edge

middle.block60.for.body11.us.preheader_crit_edge: ; preds = %middle.block60
  br label %for.body11.us.preheader

for.body11.us.preheader:                          ; preds = %middle.block60.for.body11.us.preheader_crit_edge, %min.iters.checked63.for.body11.us.preheader_crit_edge, %for.cond8.preheader.us.for.body11.us.preheader_crit_edge, %vector.memcheck84
  br label %for.body11.us

for.body11.us:                                    ; preds = %for.body11.us.preheader, %for.body11.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body11.us ], [ 1, %for.body11.us.preheader ]
  %arrayidx15.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %2, i64 %indvars.iv15, i64 %indvars.iv
  %38 = load double, double* %arrayidx15.us, align 8
  %arrayidx21.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv20, i64 %indvars.iv15, i64 %indvars.iv
  %39 = load double, double* %arrayidx21.us, align 8
  %mul.us = fmul double %39, 2.000000e+00
  %sub22.us = fsub double %38, %mul.us
  %arrayidx29.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %3, i64 %indvars.iv15, i64 %indvars.iv
  %40 = load double, double* %arrayidx29.us, align 8
  %add30.us = fadd double %40, %sub22.us
  %mul31.us = fmul double %add30.us, 1.250000e-01
  %arrayidx38.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv20, i64 %indvars.iv.next16, i64 %indvars.iv
  %41 = load double, double* %arrayidx38.us, align 8
  %sub46.us = fsub double %41, %mul.us
  %arrayidx53.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv20, i64 %5, i64 %indvars.iv
  %42 = load double, double* %arrayidx53.us, align 8
  %add54.us = fadd double %sub46.us, %42
  %mul55.us = fmul double %add54.us, 1.250000e-01
  %add56.us = fadd double %mul31.us, %mul55.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx63.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv20, i64 %indvars.iv15, i64 %indvars.iv.next
  %43 = load double, double* %arrayidx63.us, align 8
  %sub71.us = fsub double %43, %mul.us
  %44 = add nsw i64 %indvars.iv, -1
  %arrayidx78.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv20, i64 %indvars.iv15, i64 %44
  %45 = load double, double* %arrayidx78.us, align 8
  %add79.us = fadd double %sub71.us, %45
  %mul80.us = fmul double %add79.us, 1.250000e-01
  %add81.us = fadd double %add56.us, %mul80.us
  %add88.us = fadd double %39, %add81.us
  %arrayidx94.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv20, i64 %indvars.iv15, i64 %indvars.iv
  store double %add88.us, double* %arrayidx94.us, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %for.cond8.for.inc95_crit_edge.us.loopexit, label %for.body11.us, !llvm.loop !9

for.cond8.for.inc95_crit_edge.us.loopexit:        ; preds = %for.body11.us
  br label %for.cond8.for.inc95_crit_edge.us

for.cond8.for.inc95_crit_edge.us:                 ; preds = %for.cond8.for.inc95_crit_edge.us.loopexit, %middle.block60
  %exitcond19 = icmp eq i64 %indvars.iv.next16, 119
  br i1 %exitcond19, label %for.inc98.loopexit, label %for.cond8.preheader.us

for.inc98.loopexit:                               ; preds = %for.cond8.for.inc95_crit_edge.us
  br label %for.inc98

for.inc98:                                        ; preds = %for.cond4.preheader.for.inc98_crit_edge, %for.inc98.loopexit
  %indvars.iv.next21.pre-phi = phi i64 [ %.pre, %for.cond4.preheader.for.inc98_crit_edge ], [ %2, %for.inc98.loopexit ]
  %exitcond25 = icmp eq i64 %indvars.iv.next21.pre-phi, 119
  br i1 %exitcond25, label %for.cond101.preheader, label %for.cond4.preheader

for.cond109.preheader.lr.ph:                      ; preds = %for.cond109.preheader.lr.ph.preheader, %for.inc206
  %indvar = phi i64 [ %46, %for.inc206 ], [ 0, %for.cond109.preheader.lr.ph.preheader ]
  %indvars.iv36 = phi i64 [ %48, %for.inc206 ], [ 1, %for.cond109.preheader.lr.ph.preheader ]
  %46 = add nuw nsw i64 %indvar, 1
  %47 = add nuw nsw i64 %indvar, 2
  %48 = add nuw nsw i64 %indvars.iv36, 1
  %49 = add nsw i64 %indvars.iv36, -1
  br label %for.cond109.preheader.us

for.cond109.preheader.us:                         ; preds = %for.cond109.for.inc203_crit_edge.us, %for.cond109.preheader.lr.ph
  %indvar44 = phi i64 [ %50, %for.cond109.for.inc203_crit_edge.us ], [ 0, %for.cond109.preheader.lr.ph ]
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %for.cond109.for.inc203_crit_edge.us ], [ 1, %for.cond109.preheader.lr.ph ]
  %50 = add nuw nsw i64 %indvar44, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %46, i64 %50, i64 1
  %scevgep47 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %46, i64 %50, i64 119
  %scevgep49 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvar, i64 %50, i64 1
  %scevgep51 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %47, i64 %50, i64 119
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %51 = add nsw i64 %indvars.iv31, -1
  br i1 false, label %for.cond109.preheader.us.for.body112.us.preheader_crit_edge, label %min.iters.checked

for.cond109.preheader.us.for.body112.us.preheader_crit_edge: ; preds = %for.cond109.preheader.us
  br label %for.body112.us.preheader

min.iters.checked:                                ; preds = %for.cond109.preheader.us
  br i1 false, label %min.iters.checked.for.body112.us.preheader_crit_edge, label %vector.memcheck

min.iters.checked.for.body112.us.preheader_crit_edge: ; preds = %min.iters.checked
  br label %for.body112.us.preheader

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep51
  %bound1 = icmp ult double* %scevgep49, %scevgep47
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.body112.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %52 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %48, i64 %indvars.iv31, i64 %offset.idx
  %53 = bitcast double* %52 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %53, align 8, !alias.scope !10
  %54 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv36, i64 %indvars.iv31, i64 %offset.idx
  %55 = bitcast double* %54 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %55, align 8, !alias.scope !10
  %56 = fmul <2 x double> %wide.load53, <double 2.000000e+00, double 2.000000e+00>
  %57 = fsub <2 x double> %wide.load, %56
  %58 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %49, i64 %indvars.iv31, i64 %offset.idx
  %59 = bitcast double* %58 to <2 x double>*
  %wide.load54 = load <2 x double>, <2 x double>* %59, align 8, !alias.scope !10
  %60 = fadd <2 x double> %wide.load54, %57
  %61 = fmul <2 x double> %60, <double 1.250000e-01, double 1.250000e-01>
  %62 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv36, i64 %indvars.iv.next32, i64 %offset.idx
  %63 = bitcast double* %62 to <2 x double>*
  %wide.load55 = load <2 x double>, <2 x double>* %63, align 8, !alias.scope !10
  %64 = fsub <2 x double> %wide.load55, %56
  %65 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv36, i64 %51, i64 %offset.idx
  %66 = bitcast double* %65 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %66, align 8, !alias.scope !10
  %67 = fadd <2 x double> %64, %wide.load56
  %68 = fmul <2 x double> %67, <double 1.250000e-01, double 1.250000e-01>
  %69 = fadd <2 x double> %61, %68
  %70 = add nuw nsw i64 %offset.idx, 1
  %71 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv36, i64 %indvars.iv31, i64 %70
  %72 = bitcast double* %71 to <2 x double>*
  %wide.load57 = load <2 x double>, <2 x double>* %72, align 8, !alias.scope !10
  %73 = fsub <2 x double> %wide.load57, %56
  %74 = add nsw i64 %offset.idx, -1
  %75 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv36, i64 %indvars.iv31, i64 %74
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load58 = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !10
  %77 = fadd <2 x double> %73, %wide.load58
  %78 = fmul <2 x double> %77, <double 1.250000e-01, double 1.250000e-01>
  %79 = fadd <2 x double> %69, %78
  %80 = fadd <2 x double> %wide.load53, %79
  %81 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv36, i64 %indvars.iv31, i64 %offset.idx
  %82 = bitcast double* %81 to <2 x double>*
  store <2 x double> %80, <2 x double>* %82, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %83 = icmp eq i64 %index.next, 118
  br i1 %83, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 true, label %for.cond109.for.inc203_crit_edge.us, label %middle.block.for.body112.us.preheader_crit_edge

middle.block.for.body112.us.preheader_crit_edge:  ; preds = %middle.block
  br label %for.body112.us.preheader

for.body112.us.preheader:                         ; preds = %middle.block.for.body112.us.preheader_crit_edge, %min.iters.checked.for.body112.us.preheader_crit_edge, %for.cond109.preheader.us.for.body112.us.preheader_crit_edge, %vector.memcheck
  br label %for.body112.us

for.body112.us:                                   ; preds = %for.body112.us.preheader, %for.body112.us
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %for.body112.us ], [ 1, %for.body112.us.preheader ]
  %arrayidx119.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %48, i64 %indvars.iv31, i64 %indvars.iv26
  %84 = load double, double* %arrayidx119.us, align 8
  %arrayidx125.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv36, i64 %indvars.iv31, i64 %indvars.iv26
  %85 = load double, double* %arrayidx125.us, align 8
  %mul126.us = fmul double %85, 2.000000e+00
  %sub127.us = fsub double %84, %mul126.us
  %arrayidx134.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %49, i64 %indvars.iv31, i64 %indvars.iv26
  %86 = load double, double* %arrayidx134.us, align 8
  %add135.us = fadd double %86, %sub127.us
  %mul136.us = fmul double %add135.us, 1.250000e-01
  %arrayidx143.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv36, i64 %indvars.iv.next32, i64 %indvars.iv26
  %87 = load double, double* %arrayidx143.us, align 8
  %sub151.us = fsub double %87, %mul126.us
  %arrayidx158.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv36, i64 %51, i64 %indvars.iv26
  %88 = load double, double* %arrayidx158.us, align 8
  %add159.us = fadd double %sub151.us, %88
  %mul160.us = fmul double %add159.us, 1.250000e-01
  %add161.us = fadd double %mul136.us, %mul160.us
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %arrayidx168.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv36, i64 %indvars.iv31, i64 %indvars.iv.next27
  %89 = load double, double* %arrayidx168.us, align 8
  %sub176.us = fsub double %89, %mul126.us
  %90 = add nsw i64 %indvars.iv26, -1
  %arrayidx183.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv36, i64 %indvars.iv31, i64 %90
  %91 = load double, double* %arrayidx183.us, align 8
  %add184.us = fadd double %sub176.us, %91
  %mul185.us = fmul double %add184.us, 1.250000e-01
  %add186.us = fadd double %add161.us, %mul185.us
  %add193.us = fadd double %85, %add186.us
  %arrayidx199.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv36, i64 %indvars.iv31, i64 %indvars.iv26
  store double %add193.us, double* %arrayidx199.us, align 8
  %exitcond30 = icmp eq i64 %indvars.iv.next27, 119
  br i1 %exitcond30, label %for.cond109.for.inc203_crit_edge.us.loopexit, label %for.body112.us, !llvm.loop !16

for.cond109.for.inc203_crit_edge.us.loopexit:     ; preds = %for.body112.us
  br label %for.cond109.for.inc203_crit_edge.us

for.cond109.for.inc203_crit_edge.us:              ; preds = %for.cond109.for.inc203_crit_edge.us.loopexit, %middle.block
  %exitcond35 = icmp eq i64 %indvars.iv.next32, 119
  br i1 %exitcond35, label %for.inc206, label %for.cond109.preheader.us

for.inc206:                                       ; preds = %for.cond109.for.inc203_crit_edge.us
  %exitcond41 = icmp eq i64 %48, 119
  br i1 %exitcond41, label %for.inc209.loopexit, label %for.cond109.preheader.lr.ph

for.inc209.loopexit:                              ; preds = %for.inc206
  br label %for.inc209

for.inc209:                                       ; preds = %for.cond101.preheader.for.inc209_crit_edge, %for.cond1.preheader.for.inc209_crit_edge, %for.inc209.loopexit
  %inc210 = add nuw nsw i32 %t.013, 1
  %exitcond42 = icmp eq i32 %inc210, 501
  br i1 %exitcond42, label %for.end211, label %for.cond1.preheader

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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %for.cond2.preheader.lr.ph, label %entry.for.end23_crit_edge

entry.for.end23_crit_edge:                        ; preds = %entry
  br label %for.end23

for.cond2.preheader.lr.ph:                        ; preds = %entry
  br label %for.cond5.preheader.us.us.preheader

for.cond5.preheader.us.us.preheader:              ; preds = %for.cond2.preheader.lr.ph, %for.cond2.for.inc21_crit_edge.us
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %for.cond2.for.inc21_crit_edge.us ], [ 0, %for.cond2.preheader.lr.ph ]
  %3 = mul nsw i64 %indvars.iv40, 120
  %4 = trunc i64 %3 to i32
  br label %for.cond5.preheader.us.us

for.cond2.for.inc21_crit_edge.us:                 ; preds = %for.cond5.for.inc18_crit_edge.us.us
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next41, 120
  br i1 %exitcond44, label %for.end23.loopexit, label %for.cond5.preheader.us.us.preheader

for.cond5.preheader.us.us:                        ; preds = %for.cond5.for.inc18_crit_edge.us.us, %for.cond5.preheader.us.us.preheader
  %indvars.iv36 = phi i64 [ 0, %for.cond5.preheader.us.us.preheader ], [ %indvars.iv.next37, %for.cond5.for.inc18_crit_edge.us.us ]
  %5 = trunc i64 %indvars.iv36 to i32
  %mul81.us.us = add i32 %5, %4
  %add.us.us = mul i32 %mul81.us.us, 120
  %6 = zext i32 %add.us.us to i64
  br label %for.body7.us.us

for.cond5.for.inc18_crit_edge.us.us:              ; preds = %if.end.us.us
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next37, 120
  br i1 %exitcond39, label %for.cond2.for.inc21_crit_edge.us, label %for.cond5.preheader.us.us

for.body7.us.us:                                  ; preds = %if.end.us.us, %for.cond5.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end.us.us ], [ 0, %for.cond5.preheader.us.us ]
  %7 = add i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %rem.us.us = srem i32 %8, 20
  %cmp11.us.us = icmp eq i32 %rem.us.us, 0
  br i1 %cmp11.us.us, label %if.then.us.us, label %if.end.us.us

if.then.us.us:                                    ; preds = %for.body7.us.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %9) #5
  br label %if.end.us.us

if.end.us.us:                                     ; preds = %if.then.us.us, %for.body7.us.us
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv40, i64 %indvars.iv36, i64 %indvars.iv
  %11 = load double, double* %arrayidx16.us.us, align 8
  %call17.us.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %11) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %for.cond5.for.inc18_crit_edge.us.us, label %for.body7.us.us

for.end23.loopexit:                               ; preds = %for.cond2.for.inc21_crit_edge.us
  br label %for.end23

for.end23:                                        ; preds = %entry.for.end23_crit_edge, %for.end23.loopexit
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %13) #5
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
