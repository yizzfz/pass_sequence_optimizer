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
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %arraydecay = bitcast i8* %call to [120 x [120 x double]]*
  %arraydecay2 = bitcast i8* %call1 to [120 x [120 x double]]*
  tail call fastcc void @init_array(i32 120, [120 x [120 x double]]* %arraydecay, [120 x [120 x double]]* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_heat_3d(i32 500, i32 120, [120 x [120 x double]]* %arraydecay, [120 x [120 x double]]* %arraydecay2)
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
  %1 = bitcast i8* %call to [120 x [120 x double]]*
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, [120 x [120 x double]]* %A, [120 x [120 x double]]* %B) unnamed_addr #2 {
entry:
  %cmp3 = icmp sgt i32 %n, 0
  br i1 %cmp3, label %for.cond1.preheader.lr.ph, label %for.end24

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %conv8 = sitofp i32 %n to double
  %xtraiter = and i32 %n, 1
  %wide.trip.count28 = zext i32 %n to i64
  %wide.trip.count.1 = zext i32 %n to i64
  %wide.trip.count31 = zext i32 %n to i64
  %0 = icmp eq i32 %xtraiter, 0
  %1 = icmp eq i32 %n, 1
  br label %for.cond4.preheader.us.us.preheader

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.for.end21_crit_edge.us, %for.cond1.preheader.lr.ph
  %indvars.iv29 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next30, %for.cond1.for.end21_crit_edge.us ]
  %2 = trunc i64 %indvars.iv29 to i32
  %sub.us = add i32 %2, %n
  br label %for.cond4.preheader.us.us

for.cond1.for.end21_crit_edge.us:                 ; preds = %for.cond4.for.end_crit_edge.us.us
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next30, %wide.trip.count31
  br i1 %exitcond32, label %for.end24.loopexit, label %for.cond4.preheader.us.us.preheader

for.cond4.preheader.us.us:                        ; preds = %for.cond4.for.end_crit_edge.us.us, %for.cond4.preheader.us.us.preheader
  %indvars.iv26 = phi i64 [ 0, %for.cond4.preheader.us.us.preheader ], [ %indvars.iv.next27, %for.cond4.for.end_crit_edge.us.us ]
  %3 = trunc i64 %indvars.iv26 to i32
  %add.us.us = add i32 %sub.us, %3
  br i1 %0, label %for.body6.us.us.prol.loopexit, label %for.body6.us.us.prol

for.body6.us.us.prol:                             ; preds = %for.cond4.preheader.us.us
  %conv.us.us.prol = sitofp i32 %add.us.us to double
  %mul.us.us.prol = fmul double %conv.us.us.prol, 1.000000e+01
  %div.us.us.prol = fdiv double %mul.us.us.prol, %conv8
  %arrayidx12.us.us.prol = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv29, i64 %indvars.iv26, i64 0
  store double %div.us.us.prol, double* %arrayidx12.us.us.prol, align 8
  %arrayidx18.us.us.prol = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv29, i64 %indvars.iv26, i64 0
  store double %div.us.us.prol, double* %arrayidx18.us.us.prol, align 8
  br label %for.body6.us.us.prol.loopexit

for.body6.us.us.prol.loopexit:                    ; preds = %for.cond4.preheader.us.us, %for.body6.us.us.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body6.us.us.prol ], [ 0, %for.cond4.preheader.us.us ]
  br i1 %1, label %for.cond4.for.end_crit_edge.us.us, label %for.body6.us.us.preheader

for.body6.us.us.preheader:                        ; preds = %for.body6.us.us.prol.loopexit
  br label %for.body6.us.us

for.cond4.for.end_crit_edge.us.us.loopexit:       ; preds = %for.body6.us.us
  br label %for.cond4.for.end_crit_edge.us.us

for.cond4.for.end_crit_edge.us.us:                ; preds = %for.cond4.for.end_crit_edge.us.us.loopexit, %for.body6.us.us.prol.loopexit
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond = icmp eq i64 %indvars.iv.next27, %wide.trip.count28
  br i1 %exitcond, label %for.cond1.for.end21_crit_edge.us, label %for.cond4.preheader.us.us

for.body6.us.us:                                  ; preds = %for.body6.us.us.preheader, %for.body6.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body6.us.us ], [ %indvars.iv.unr.ph, %for.body6.us.us.preheader ]
  %4 = trunc i64 %indvars.iv to i32
  %add7.us.us = sub i32 %add.us.us, %4
  %conv.us.us = sitofp i32 %add7.us.us to double
  %mul.us.us = fmul double %conv.us.us, 1.000000e+01
  %div.us.us = fdiv double %mul.us.us, %conv8
  %arrayidx12.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv29, i64 %indvars.iv26, i64 %indvars.iv
  store double %div.us.us, double* %arrayidx12.us.us, align 8
  %arrayidx18.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv29, i64 %indvars.iv26, i64 %indvars.iv
  store double %div.us.us, double* %arrayidx18.us.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %5 = trunc i64 %indvars.iv.next to i32
  %add7.us.us.1 = sub i32 %add.us.us, %5
  %conv.us.us.1 = sitofp i32 %add7.us.us.1 to double
  %mul.us.us.1 = fmul double %conv.us.us.1, 1.000000e+01
  %div.us.us.1 = fdiv double %mul.us.us.1, %conv8
  %arrayidx12.us.us.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv29, i64 %indvars.iv26, i64 %indvars.iv.next
  store double %div.us.us.1, double* %arrayidx12.us.us.1, align 8
  %arrayidx18.us.us.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv29, i64 %indvars.iv26, i64 %indvars.iv.next
  store double %div.us.us.1, double* %arrayidx18.us.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.cond4.for.end_crit_edge.us.us.loopexit, label %for.body6.us.us

for.end24.loopexit:                               ; preds = %for.cond1.for.end21_crit_edge.us
  br label %for.end24

for.end24:                                        ; preds = %for.end24.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32 %tsteps, i32 %n, [120 x [120 x double]]* %A, [120 x [120 x double]]* %B) unnamed_addr #2 {
entry:
  %sub = add nsw i32 %n, -1
  %sub5 = add nsw i32 %n, -1
  %wide.trip.count13 = zext i32 %sub5 to i64
  %wide.trip.count = zext i32 %sub5 to i64
  %wide.trip.count19 = zext i32 %sub5 to i64
  %wide.trip.count29 = zext i32 %sub5 to i64
  %wide.trip.count24 = zext i32 %sub5 to i64
  %wide.trip.count35 = zext i32 %sub5 to i64
  %0 = add nsw i64 %wide.trip.count24, -1
  %1 = icmp sgt i32 %sub, 1
  %2 = icmp sgt i32 %sub5, 1
  %min.iters.check57 = icmp ult i64 %0, 2
  %n.vec60 = and i64 %0, -2
  %cmp.zero61 = icmp eq i64 %n.vec60, 0
  %ind.end84 = or i64 %0, 1
  %cmp.n85 = icmp eq i64 %0, %n.vec60
  %3 = icmp sgt i32 %sub, 1
  %min.iters.check = icmp ult i64 %0, 2
  %n.vec = and i64 %0, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %0, 1
  %cmp.n = icmp eq i64 %0, %n.vec
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end208, %entry
  %t.08 = phi i32 [ 1, %entry ], [ %inc210, %for.end208 ]
  br i1 %1, label %for.cond4.preheader.preheader, label %for.end208

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  br label %for.cond4.preheader

for.cond101.preheader:                            ; preds = %for.end97
  br i1 %3, label %for.cond109.preheader.lr.ph.preheader, label %for.end208

for.cond109.preheader.lr.ph.preheader:            ; preds = %for.cond101.preheader
  br label %for.cond109.preheader.lr.ph

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.end97
  %indvar63 = phi i64 [ %indvar.next64, %for.end97 ], [ 0, %for.cond4.preheader.preheader ]
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %for.end97 ], [ 1, %for.cond4.preheader.preheader ]
  %4 = add i64 %indvar63, 1
  %5 = add i64 %indvar63, 2
  br i1 %2, label %for.cond8.preheader.lr.ph, label %for.end97

for.cond8.preheader.lr.ph:                        ; preds = %for.cond4.preheader
  %6 = add nuw nsw i64 %indvars.iv15, 1
  %7 = add nsw i64 %indvars.iv15, -1
  br label %for.cond8.preheader.us

for.cond8.preheader.us:                           ; preds = %for.cond8.for.end_crit_edge.us, %for.cond8.preheader.lr.ph
  %indvar65 = phi i64 [ %indvar.next66, %for.cond8.for.end_crit_edge.us ], [ 0, %for.cond8.preheader.lr.ph ]
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %for.cond8.for.end_crit_edge.us ], [ 1, %for.cond8.preheader.lr.ph ]
  %8 = add i64 %indvar65, 1
  %scevgep67 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %4, i64 %8, i64 1
  %scevgep69 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %4, i64 %8, i64 %wide.trip.count24
  %scevgep71 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvar63, i64 %8, i64 1
  %scevgep73 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %5, i64 %8, i64 %wide.trip.count24
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %9 = add nsw i64 %indvars.iv10, -1
  br i1 %min.iters.check57, label %for.body11.us.preheader, label %min.iters.checked58

min.iters.checked58:                              ; preds = %for.cond8.preheader.us
  br i1 %cmp.zero61, label %for.body11.us.preheader, label %vector.memcheck79

vector.memcheck79:                                ; preds = %min.iters.checked58
  %bound075 = icmp ult double* %scevgep67, %scevgep73
  %bound176 = icmp ult double* %scevgep71, %scevgep69
  %memcheck.conflict78 = and i1 %bound075, %bound176
  br i1 %memcheck.conflict78, label %for.body11.us.preheader, label %vector.body54.preheader

vector.body54.preheader:                          ; preds = %vector.memcheck79
  br label %vector.body54

vector.body54:                                    ; preds = %vector.body54.preheader, %vector.body54
  %index81 = phi i64 [ %index.next82, %vector.body54 ], [ 0, %vector.body54.preheader ]
  %offset.idx86 = or i64 %index81, 1
  %10 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %6, i64 %indvars.iv10, i64 %offset.idx86
  %11 = bitcast double* %10 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %11, align 8, !alias.scope !1
  %12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv15, i64 %indvars.iv10, i64 %offset.idx86
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load91 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !1
  %14 = fmul <2 x double> %wide.load91, <double 2.000000e+00, double 2.000000e+00>
  %15 = fsub <2 x double> %wide.load90, %14
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %7, i64 %indvars.iv10, i64 %offset.idx86
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load92 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = fadd <2 x double> %wide.load92, %15
  %19 = fmul <2 x double> %18, <double 1.250000e-01, double 1.250000e-01>
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv15, i64 %indvars.iv.next11, i64 %offset.idx86
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load93 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !1
  %22 = fsub <2 x double> %wide.load93, %14
  %23 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv15, i64 %9, i64 %offset.idx86
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load94 = load <2 x double>, <2 x double>* %24, align 8, !alias.scope !1
  %25 = fadd <2 x double> %22, %wide.load94
  %26 = fmul <2 x double> %25, <double 1.250000e-01, double 1.250000e-01>
  %27 = fadd <2 x double> %19, %26
  %28 = add nuw nsw i64 %offset.idx86, 1
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv15, i64 %indvars.iv10, i64 %28
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load95 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !1
  %31 = fsub <2 x double> %wide.load95, %14
  %32 = add nsw i64 %offset.idx86, -1
  %33 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv15, i64 %indvars.iv10, i64 %32
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load96 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !1
  %35 = fadd <2 x double> %31, %wide.load96
  %36 = fmul <2 x double> %35, <double 1.250000e-01, double 1.250000e-01>
  %37 = fadd <2 x double> %27, %36
  %38 = fadd <2 x double> %wide.load91, %37
  %39 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv15, i64 %indvars.iv10, i64 %offset.idx86
  %40 = bitcast double* %39 to <2 x double>*
  store <2 x double> %38, <2 x double>* %40, align 8, !alias.scope !4, !noalias !1
  %index.next82 = add i64 %index81, 2
  %41 = icmp eq i64 %index.next82, %n.vec60
  br i1 %41, label %middle.block55, label %vector.body54, !llvm.loop !6

middle.block55:                                   ; preds = %vector.body54
  br i1 %cmp.n85, label %for.cond8.for.end_crit_edge.us, label %for.body11.us.preheader

for.body11.us.preheader:                          ; preds = %middle.block55, %vector.memcheck79, %min.iters.checked58, %for.cond8.preheader.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck79 ], [ 1, %min.iters.checked58 ], [ 1, %for.cond8.preheader.us ], [ %ind.end84, %middle.block55 ]
  br label %for.body11.us

for.body11.us:                                    ; preds = %for.body11.us.preheader, %for.body11.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body11.us ], [ %indvars.iv.ph, %for.body11.us.preheader ]
  %arrayidx15.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %6, i64 %indvars.iv10, i64 %indvars.iv
  %42 = load double, double* %arrayidx15.us, align 8
  %arrayidx21.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv15, i64 %indvars.iv10, i64 %indvars.iv
  %43 = load double, double* %arrayidx21.us, align 8
  %mul.us = fmul double %43, 2.000000e+00
  %sub22.us = fsub double %42, %mul.us
  %arrayidx29.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %7, i64 %indvars.iv10, i64 %indvars.iv
  %44 = load double, double* %arrayidx29.us, align 8
  %add30.us = fadd double %44, %sub22.us
  %mul31.us = fmul double %add30.us, 1.250000e-01
  %arrayidx38.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv15, i64 %indvars.iv.next11, i64 %indvars.iv
  %45 = load double, double* %arrayidx38.us, align 8
  %sub46.us = fsub double %45, %mul.us
  %arrayidx53.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv15, i64 %9, i64 %indvars.iv
  %46 = load double, double* %arrayidx53.us, align 8
  %add54.us = fadd double %sub46.us, %46
  %mul55.us = fmul double %add54.us, 1.250000e-01
  %add56.us = fadd double %mul31.us, %mul55.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx63.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv15, i64 %indvars.iv10, i64 %indvars.iv.next
  %47 = load double, double* %arrayidx63.us, align 8
  %sub71.us = fsub double %47, %mul.us
  %48 = add nsw i64 %indvars.iv, -1
  %arrayidx78.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv15, i64 %indvars.iv10, i64 %48
  %49 = load double, double* %arrayidx78.us, align 8
  %add79.us = fadd double %sub71.us, %49
  %mul80.us = fmul double %add79.us, 1.250000e-01
  %add81.us = fadd double %add56.us, %mul80.us
  %add88.us = fadd double %43, %add81.us
  %arrayidx94.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv15, i64 %indvars.iv10, i64 %indvars.iv
  store double %add88.us, double* %arrayidx94.us, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond8.for.end_crit_edge.us.loopexit, label %for.body11.us, !llvm.loop !9

for.cond8.for.end_crit_edge.us.loopexit:          ; preds = %for.body11.us
  br label %for.cond8.for.end_crit_edge.us

for.cond8.for.end_crit_edge.us:                   ; preds = %for.cond8.for.end_crit_edge.us.loopexit, %middle.block55
  %exitcond14 = icmp eq i64 %indvars.iv.next11, %wide.trip.count13
  %indvar.next66 = add i64 %indvar65, 1
  br i1 %exitcond14, label %for.end97.loopexit, label %for.cond8.preheader.us

for.end97.loopexit:                               ; preds = %for.cond8.for.end_crit_edge.us
  br label %for.end97

for.end97:                                        ; preds = %for.end97.loopexit, %for.cond4.preheader
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next16, %wide.trip.count19
  %indvar.next64 = add i64 %indvar63, 1
  br i1 %exitcond20, label %for.cond101.preheader, label %for.cond4.preheader

for.cond109.preheader.lr.ph:                      ; preds = %for.cond109.preheader.lr.ph.preheader, %for.end205
  %indvar = phi i64 [ %indvar.next, %for.end205 ], [ 0, %for.cond109.preheader.lr.ph.preheader ]
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %for.end205 ], [ 1, %for.cond109.preheader.lr.ph.preheader ]
  %50 = add i64 %indvar, 1
  %51 = add i64 %indvar, 2
  %52 = add nuw nsw i64 %indvars.iv31, 1
  %53 = add nsw i64 %indvars.iv31, -1
  br label %for.cond109.preheader.us

for.cond109.preheader.us:                         ; preds = %for.cond109.for.end202_crit_edge.us, %for.cond109.preheader.lr.ph
  %indvar39 = phi i64 [ %indvar.next40, %for.cond109.for.end202_crit_edge.us ], [ 0, %for.cond109.preheader.lr.ph ]
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %for.cond109.for.end202_crit_edge.us ], [ 1, %for.cond109.preheader.lr.ph ]
  %54 = add i64 %indvar39, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %50, i64 %54, i64 1
  %scevgep42 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %50, i64 %54, i64 %wide.trip.count24
  %scevgep44 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvar, i64 %54, i64 1
  %scevgep46 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %51, i64 %54, i64 %wide.trip.count24
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %55 = add nsw i64 %indvars.iv26, -1
  br i1 %min.iters.check, label %for.body112.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond109.preheader.us
  br i1 %cmp.zero, label %for.body112.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep46
  %bound1 = icmp ult double* %scevgep44, %scevgep42
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.body112.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %56 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %52, i64 %indvars.iv26, i64 %offset.idx
  %57 = bitcast double* %56 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %57, align 8, !alias.scope !10
  %58 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv31, i64 %indvars.iv26, i64 %offset.idx
  %59 = bitcast double* %58 to <2 x double>*
  %wide.load48 = load <2 x double>, <2 x double>* %59, align 8, !alias.scope !10
  %60 = fmul <2 x double> %wide.load48, <double 2.000000e+00, double 2.000000e+00>
  %61 = fsub <2 x double> %wide.load, %60
  %62 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %53, i64 %indvars.iv26, i64 %offset.idx
  %63 = bitcast double* %62 to <2 x double>*
  %wide.load49 = load <2 x double>, <2 x double>* %63, align 8, !alias.scope !10
  %64 = fadd <2 x double> %wide.load49, %61
  %65 = fmul <2 x double> %64, <double 1.250000e-01, double 1.250000e-01>
  %66 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv31, i64 %indvars.iv.next27, i64 %offset.idx
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load50 = load <2 x double>, <2 x double>* %67, align 8, !alias.scope !10
  %68 = fsub <2 x double> %wide.load50, %60
  %69 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv31, i64 %55, i64 %offset.idx
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load51 = load <2 x double>, <2 x double>* %70, align 8, !alias.scope !10
  %71 = fadd <2 x double> %68, %wide.load51
  %72 = fmul <2 x double> %71, <double 1.250000e-01, double 1.250000e-01>
  %73 = fadd <2 x double> %65, %72
  %74 = add nuw nsw i64 %offset.idx, 1
  %75 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv31, i64 %indvars.iv26, i64 %74
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !10
  %77 = fsub <2 x double> %wide.load52, %60
  %78 = add nsw i64 %offset.idx, -1
  %79 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv31, i64 %indvars.iv26, i64 %78
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !10
  %81 = fadd <2 x double> %77, %wide.load53
  %82 = fmul <2 x double> %81, <double 1.250000e-01, double 1.250000e-01>
  %83 = fadd <2 x double> %73, %82
  %84 = fadd <2 x double> %wide.load48, %83
  %85 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv31, i64 %indvars.iv26, i64 %offset.idx
  %86 = bitcast double* %85 to <2 x double>*
  store <2 x double> %84, <2 x double>* %86, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %87 = icmp eq i64 %index.next, %n.vec
  br i1 %87, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.cond109.for.end202_crit_edge.us, label %for.body112.us.preheader

for.body112.us.preheader:                         ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond109.preheader.us
  %indvars.iv21.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %for.cond109.preheader.us ], [ %ind.end, %middle.block ]
  br label %for.body112.us

for.body112.us:                                   ; preds = %for.body112.us.preheader, %for.body112.us
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %for.body112.us ], [ %indvars.iv21.ph, %for.body112.us.preheader ]
  %arrayidx119.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %52, i64 %indvars.iv26, i64 %indvars.iv21
  %88 = load double, double* %arrayidx119.us, align 8
  %arrayidx125.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv31, i64 %indvars.iv26, i64 %indvars.iv21
  %89 = load double, double* %arrayidx125.us, align 8
  %mul126.us = fmul double %89, 2.000000e+00
  %sub127.us = fsub double %88, %mul126.us
  %arrayidx134.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %53, i64 %indvars.iv26, i64 %indvars.iv21
  %90 = load double, double* %arrayidx134.us, align 8
  %add135.us = fadd double %90, %sub127.us
  %mul136.us = fmul double %add135.us, 1.250000e-01
  %arrayidx143.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv31, i64 %indvars.iv.next27, i64 %indvars.iv21
  %91 = load double, double* %arrayidx143.us, align 8
  %sub151.us = fsub double %91, %mul126.us
  %arrayidx158.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv31, i64 %55, i64 %indvars.iv21
  %92 = load double, double* %arrayidx158.us, align 8
  %add159.us = fadd double %sub151.us, %92
  %mul160.us = fmul double %add159.us, 1.250000e-01
  %add161.us = fadd double %mul136.us, %mul160.us
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %arrayidx168.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv31, i64 %indvars.iv26, i64 %indvars.iv.next22
  %93 = load double, double* %arrayidx168.us, align 8
  %sub176.us = fsub double %93, %mul126.us
  %94 = add nsw i64 %indvars.iv21, -1
  %arrayidx183.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv31, i64 %indvars.iv26, i64 %94
  %95 = load double, double* %arrayidx183.us, align 8
  %add184.us = fadd double %sub176.us, %95
  %mul185.us = fmul double %add184.us, 1.250000e-01
  %add186.us = fadd double %add161.us, %mul185.us
  %add193.us = fadd double %89, %add186.us
  %arrayidx199.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv31, i64 %indvars.iv26, i64 %indvars.iv21
  store double %add193.us, double* %arrayidx199.us, align 8
  %exitcond25 = icmp eq i64 %indvars.iv.next22, %wide.trip.count24
  br i1 %exitcond25, label %for.cond109.for.end202_crit_edge.us.loopexit, label %for.body112.us, !llvm.loop !16

for.cond109.for.end202_crit_edge.us.loopexit:     ; preds = %for.body112.us
  br label %for.cond109.for.end202_crit_edge.us

for.cond109.for.end202_crit_edge.us:              ; preds = %for.cond109.for.end202_crit_edge.us.loopexit, %middle.block
  %exitcond30 = icmp eq i64 %indvars.iv.next27, %wide.trip.count29
  %indvar.next40 = add i64 %indvar39, 1
  br i1 %exitcond30, label %for.end205, label %for.cond109.preheader.us

for.end205:                                       ; preds = %for.cond109.for.end202_crit_edge.us
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next32, %wide.trip.count35
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond36, label %for.end208.loopexit, label %for.cond109.preheader.lr.ph

for.end208.loopexit:                              ; preds = %for.end205
  br label %for.end208

for.end208:                                       ; preds = %for.end208.loopexit, %for.cond101.preheader, %for.cond1.preheader
  %inc210 = add nuw nsw i32 %t.08, 1
  %exitcond37 = icmp eq i32 %inc210, 501
  br i1 %exitcond37, label %for.end211, label %for.cond1.preheader

for.end211:                                       ; preds = %for.end208
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [120 x [120 x double]]* %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %cmp4 = icmp sgt i32 %n, 0
  br i1 %cmp4, label %for.cond2.preheader.lr.ph, label %for.end23

for.cond2.preheader.lr.ph:                        ; preds = %entry
  %3 = sext i32 %n to i64
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count32 = zext i32 %n to i64
  %wide.trip.count37 = zext i32 %n to i64
  br label %for.cond5.preheader.us.us.preheader

for.cond5.preheader.us.us.preheader:              ; preds = %for.cond2.for.end20_crit_edge.us, %for.cond2.preheader.lr.ph
  %indvars.iv34 = phi i64 [ 0, %for.cond2.preheader.lr.ph ], [ %indvars.iv.next35, %for.cond2.for.end20_crit_edge.us ]
  %4 = mul nsw i64 %indvars.iv34, %3
  %5 = trunc i64 %4 to i32
  br label %for.cond5.preheader.us.us

for.cond2.for.end20_crit_edge.us:                 ; preds = %for.cond5.for.end_crit_edge.us.us
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next35, %wide.trip.count37
  br i1 %exitcond38, label %for.end23.loopexit, label %for.cond5.preheader.us.us.preheader

for.cond5.preheader.us.us:                        ; preds = %for.cond5.for.end_crit_edge.us.us, %for.cond5.preheader.us.us.preheader
  %indvars.iv30 = phi i64 [ 0, %for.cond5.preheader.us.us.preheader ], [ %indvars.iv.next31, %for.cond5.for.end_crit_edge.us.us ]
  %6 = trunc i64 %indvars.iv30 to i32
  %mul81.us.us = add i32 %6, %5
  %add.us.us = mul i32 %mul81.us.us, %n
  %7 = zext i32 %add.us.us to i64
  br label %for.body7.us.us

for.cond5.for.end_crit_edge.us.us:                ; preds = %if.end.us.us
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next31, %wide.trip.count32
  br i1 %exitcond33, label %for.cond2.for.end20_crit_edge.us, label %for.cond5.preheader.us.us

for.body7.us.us:                                  ; preds = %if.end.us.us, %for.cond5.preheader.us.us
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader.us.us ], [ %indvars.iv.next, %if.end.us.us ]
  %8 = add i64 %indvars.iv, %7
  %9 = trunc i64 %8 to i32
  %rem.us.us = srem i32 %9, 20
  %cmp11.us.us = icmp eq i32 %rem.us.us, 0
  br i1 %cmp11.us.us, label %if.then.us.us, label %if.end.us.us

if.then.us.us:                                    ; preds = %for.body7.us.us
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #5
  br label %if.end.us.us

if.end.us.us:                                     ; preds = %for.body7.us.us, %if.then.us.us
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv34, i64 %indvars.iv30, i64 %indvars.iv
  %12 = load double, double* %arrayidx16.us.us, align 8
  %call17.us.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %12) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond5.for.end_crit_edge.us.us, label %for.body7.us.us

for.end23.loopexit:                               ; preds = %for.cond2.for.end20_crit_edge.us
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
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

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
