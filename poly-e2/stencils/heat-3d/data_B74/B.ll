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
  %.cast = bitcast i8* %call to [120 x [120 x double]]*
  %arraydecay22 = bitcast i8* %call1 to [120 x [120 x double]]*
  tail call fastcc void @init_array(i32 120, [120 x [120 x double]]* %.cast, [120 x [120 x double]]* %arraydecay22)
  tail call void (...) @polybench_timer_start() #4
  %0 = bitcast i8* %call to [120 x [120 x double]]*
  %1 = bitcast i8* %call1 to [120 x [120 x double]]*
  tail call fastcc void @kernel_heat_3d(i32 500, i32 120, [120 x [120 x double]]* %0, [120 x [120 x double]]* %1)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %2, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %0)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, [120 x [120 x double]]* %A, [120 x [120 x double]]* %B) unnamed_addr #2 {
entry:
  %cmp10 = icmp sgt i32 %n, 0
  br i1 %cmp10, label %for.cond1.preheader.lr.ph, label %for.end24

for.cond1.preheader.lr.ph:                        ; preds = %entry
  br i1 true, label %for.cond1.preheader.us.preheader, label %for.cond.for.end24_crit_edge.loopexit47

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %0 = sext i32 %n to i64
  %conv8.us.us = sitofp i32 %n to double
  %wide.trip.count = zext i32 %n to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.inc22.us
  %indvars.iv53 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next54, %for.inc22.us ]
  br i1 true, label %for.cond4.preheader.us.us.preheader, label %for.cond1.preheader.us.for.inc22.us_crit_edge

for.cond1.preheader.us.for.inc22.us_crit_edge:    ; preds = %for.cond1.preheader.us
  br label %for.inc22.us

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.us
  %1 = trunc i64 %indvars.iv53 to i32
  br label %for.cond4.preheader.us.us

for.inc22.us.loopexit:                            ; preds = %for.inc19.us.us
  br label %for.inc22.us

for.inc22.us:                                     ; preds = %for.cond1.preheader.us.for.inc22.us_crit_edge, %for.inc22.us.loopexit
  %indvars.iv.next54 = add nsw i64 %indvars.iv53, 1
  %cmp.us = icmp slt i64 %indvars.iv.next54, %0
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.cond.for.end24_crit_edge.loopexit

for.cond4.preheader.us.us:                        ; preds = %for.cond4.preheader.us.us.preheader, %for.inc19.us.us
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %for.inc19.us.us ], [ 0, %for.cond4.preheader.us.us.preheader ]
  %2 = trunc i64 %indvars.iv49 to i32
  br label %for.inc.us.us

for.inc19.us.us:                                  ; preds = %for.inc.us.us
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next50, %wide.trip.count
  br i1 %exitcond52, label %for.inc22.us.loopexit, label %for.cond4.preheader.us.us

for.inc.us.us:                                    ; preds = %for.inc.us.us, %for.cond4.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc.us.us ], [ 0, %for.cond4.preheader.us.us ]
  %3 = trunc i64 %indvars.iv to i32
  %add.us.us = sub i32 %n, %3
  %sub.us.us = add i32 %add.us.us, %1
  %add7.us.us = add i32 %sub.us.us, %2
  %conv.us.us = sitofp i32 %add7.us.us to double
  %mul.us.us = fmul double %conv.us.us, 1.000000e+01
  %div.us.us = fdiv double %mul.us.us, %conv8.us.us
  %arrayidx12.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv53, i64 %indvars.iv49, i64 %indvars.iv
  store double %div.us.us, double* %arrayidx12.us.us, align 8
  %arrayidx18.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv53, i64 %indvars.iv49, i64 %indvars.iv
  store double %div.us.us, double* %arrayidx18.us.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.inc19.us.us, label %for.inc.us.us

for.cond.for.end24_crit_edge.loopexit:            ; preds = %for.inc22.us
  br label %for.cond.for.end24_crit_edge

for.cond.for.end24_crit_edge.loopexit47:          ; preds = %for.cond1.preheader.lr.ph
  br label %for.cond.for.end24_crit_edge

for.cond.for.end24_crit_edge:                     ; preds = %for.cond.for.end24_crit_edge.loopexit47, %for.cond.for.end24_crit_edge.loopexit
  br label %for.end24

for.end24:                                        ; preds = %for.cond.for.end24_crit_edge, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32 %tsteps, i32 %n, [120 x [120 x double]]* %A, [120 x [120 x double]]* %B) unnamed_addr #2 {
entry:
  %sub16 = add nsw i32 %n, -1
  %cmp217 = icmp sgt i32 %sub16, 1
  %0 = sext i32 %sub16 to i64
  %wide.trip.count = zext i32 %sub16 to i64
  %1 = icmp sgt i64 %0, 2
  %smax = select i1 %1, i64 %0, i64 2
  %2 = add nsw i64 %smax, -1
  %min.iters.check = icmp ult i64 %2, 2
  %n.vec = and i64 %2, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = or i64 %2, 1
  %cmp.n = icmp eq i64 %2, %n.vec
  %min.iters.check84 = icmp ult i64 %2, 2
  %n.vec87 = and i64 %2, -2
  %cmp.zero88 = icmp eq i64 %n.vec87, 0
  %ind.end112 = or i64 %2, 1
  %cmp.n113 = icmp eq i64 %2, %n.vec87
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %entry, %for.inc209
  %inc21051 = phi i32 [ 1, %entry ], [ %inc210, %for.inc209 ]
  br i1 %cmp217, label %for.cond4.preheader.preheader, label %for.cond101.preheader

for.cond4.preheader.preheader:                    ; preds = %for.cond1.preheader
  br label %for.cond4.preheader

for.cond101.preheader.loopexit:                   ; preds = %for.inc98
  br label %for.cond101.preheader

for.cond101.preheader:                            ; preds = %for.cond101.preheader.loopexit, %for.cond1.preheader
  br i1 %cmp217, label %for.cond105.preheader.preheader, label %for.inc209

for.cond105.preheader.preheader:                  ; preds = %for.cond101.preheader
  br label %for.cond105.preheader

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc98
  %indvar90 = phi i64 [ %3, %for.inc98 ], [ 0, %for.cond4.preheader.preheader ]
  %indvars.iv56 = phi i64 [ %indvars.iv.next57.pre-phi, %for.inc98 ], [ 1, %for.cond4.preheader.preheader ]
  %3 = add nuw nsw i64 %indvar90, 1
  %4 = add nuw nsw i64 %indvar90, 2
  br i1 true, label %for.cond8.preheader.lr.ph, label %for.cond4.preheader.for.inc98_crit_edge

for.cond4.preheader.for.inc98_crit_edge:          ; preds = %for.cond4.preheader
  br label %for.inc98

for.cond8.preheader.lr.ph:                        ; preds = %for.cond4.preheader
  %add = add nuw nsw i64 %indvars.iv56, 1
  %sub23 = add nsw i64 %indvars.iv56, -1
  br i1 true, label %for.cond8.preheader.us.preheader, label %for.cond8.preheader.lr.ph.for.inc98_crit_edge

for.cond8.preheader.lr.ph.for.inc98_crit_edge:    ; preds = %for.cond8.preheader.lr.ph
  br label %for.inc98

for.cond8.preheader.us.preheader:                 ; preds = %for.cond8.preheader.lr.ph
  br label %for.cond8.preheader.us

for.cond8.preheader.us:                           ; preds = %for.cond8.preheader.us.preheader, %for.inc95.us
  %indvar92 = phi i64 [ %5, %for.inc95.us ], [ 0, %for.cond8.preheader.us.preheader ]
  %indvars.iv54 = phi i64 [ %add34.us, %for.inc95.us ], [ 1, %for.cond8.preheader.us.preheader ]
  %5 = add nuw nsw i64 %indvar92, 1
  %scevgep94 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %3, i64 %5, i64 1
  %scevgep97 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %3, i64 %5, i64 %smax
  %scevgep99 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvar90, i64 %5, i64 1
  %scevgep101 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %4, i64 %5, i64 %smax
  %add34.us = add nuw nsw i64 %indvars.iv54, 1
  %sub49.us = add nsw i64 %indvars.iv54, -1
  br i1 %min.iters.check84, label %for.inc.us.preheader, label %min.iters.checked85

min.iters.checked85:                              ; preds = %for.cond8.preheader.us
  br i1 %cmp.zero88, label %for.inc.us.preheader, label %vector.memcheck107

vector.memcheck107:                               ; preds = %min.iters.checked85
  %bound0103 = icmp ult double* %scevgep94, %scevgep101
  %bound1104 = icmp ult double* %scevgep99, %scevgep97
  %memcheck.conflict106 = and i1 %bound0103, %bound1104
  br i1 %memcheck.conflict106, label %for.inc.us.preheader, label %vector.body80.preheader

vector.body80.preheader:                          ; preds = %vector.memcheck107
  br label %vector.body80

vector.body80:                                    ; preds = %vector.body80.preheader, %vector.body80
  %index109 = phi i64 [ %index.next110, %vector.body80 ], [ 0, %vector.body80.preheader ]
  %offset.idx114 = or i64 %index109, 1
  %6 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %add, i64 %indvars.iv54, i64 %offset.idx114
  %7 = bitcast double* %6 to <2 x double>*
  %wide.load118 = load <2 x double>, <2 x double>* %7, align 8, !alias.scope !1
  %8 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv56, i64 %indvars.iv54, i64 %offset.idx114
  %9 = bitcast double* %8 to <2 x double>*
  %wide.load119 = load <2 x double>, <2 x double>* %9, align 8, !alias.scope !1
  %10 = fmul <2 x double> %wide.load119, <double 2.000000e+00, double 2.000000e+00>
  %11 = fsub <2 x double> %wide.load118, %10
  %12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %sub23, i64 %indvars.iv54, i64 %offset.idx114
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load120 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !1
  %14 = fadd <2 x double> %wide.load120, %11
  %15 = fmul <2 x double> %14, <double 1.250000e-01, double 1.250000e-01>
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv56, i64 %add34.us, i64 %offset.idx114
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load121 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = fsub <2 x double> %wide.load121, %10
  %19 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv56, i64 %sub49.us, i64 %offset.idx114
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load122 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !1
  %21 = fadd <2 x double> %18, %wide.load122
  %22 = fmul <2 x double> %21, <double 1.250000e-01, double 1.250000e-01>
  %23 = fadd <2 x double> %15, %22
  %24 = add nuw nsw i64 %offset.idx114, 1
  %25 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv56, i64 %indvars.iv54, i64 %24
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load123 = load <2 x double>, <2 x double>* %26, align 8, !alias.scope !1
  %27 = fsub <2 x double> %wide.load123, %10
  %28 = add nsw i64 %offset.idx114, -1
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv56, i64 %indvars.iv54, i64 %28
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load124 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !1
  %31 = fadd <2 x double> %27, %wide.load124
  %32 = fmul <2 x double> %31, <double 1.250000e-01, double 1.250000e-01>
  %33 = fadd <2 x double> %23, %32
  %34 = fadd <2 x double> %wide.load119, %33
  %35 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv56, i64 %indvars.iv54, i64 %offset.idx114
  %36 = bitcast double* %35 to <2 x double>*
  store <2 x double> %34, <2 x double>* %36, align 8, !alias.scope !4, !noalias !1
  %index.next110 = add i64 %index109, 2
  %37 = icmp eq i64 %index.next110, %n.vec87
  br i1 %37, label %middle.block81, label %vector.body80, !llvm.loop !6

middle.block81:                                   ; preds = %vector.body80
  br i1 %cmp.n113, label %for.inc95.us, label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %middle.block81, %vector.memcheck107, %min.iters.checked85, %for.cond8.preheader.us
  %indvars.iv.ph = phi i64 [ 1, %vector.memcheck107 ], [ 1, %min.iters.checked85 ], [ 1, %for.cond8.preheader.us ], [ %ind.end112, %middle.block81 ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us.preheader, %for.inc.us
  %indvars.iv = phi i64 [ %add61.us, %for.inc.us ], [ %indvars.iv.ph, %for.inc.us.preheader ]
  %arrayidx15.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %add, i64 %indvars.iv54, i64 %indvars.iv
  %38 = load double, double* %arrayidx15.us, align 8
  %arrayidx21.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv56, i64 %indvars.iv54, i64 %indvars.iv
  %39 = load double, double* %arrayidx21.us, align 8
  %mul.us = fmul double %39, 2.000000e+00
  %sub22.us = fsub double %38, %mul.us
  %arrayidx29.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %sub23, i64 %indvars.iv54, i64 %indvars.iv
  %40 = load double, double* %arrayidx29.us, align 8
  %add30.us = fadd double %40, %sub22.us
  %mul31.us = fmul double %add30.us, 1.250000e-01
  %arrayidx38.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv56, i64 %add34.us, i64 %indvars.iv
  %41 = load double, double* %arrayidx38.us, align 8
  %sub46.us = fsub double %41, %mul.us
  %arrayidx53.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv56, i64 %sub49.us, i64 %indvars.iv
  %42 = load double, double* %arrayidx53.us, align 8
  %add54.us = fadd double %sub46.us, %42
  %mul55.us = fmul double %add54.us, 1.250000e-01
  %add56.us = fadd double %mul31.us, %mul55.us
  %add61.us = add nuw nsw i64 %indvars.iv, 1
  %arrayidx63.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv56, i64 %indvars.iv54, i64 %add61.us
  %43 = load double, double* %arrayidx63.us, align 8
  %sub71.us = fsub double %43, %mul.us
  %sub76.us = add nsw i64 %indvars.iv, -1
  %arrayidx78.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv56, i64 %indvars.iv54, i64 %sub76.us
  %44 = load double, double* %arrayidx78.us, align 8
  %add79.us = fadd double %sub71.us, %44
  %mul80.us = fmul double %add79.us, 1.250000e-01
  %add81.us = fadd double %add56.us, %mul80.us
  %add88.us = fadd double %39, %add81.us
  %arrayidx94.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv56, i64 %indvars.iv54, i64 %indvars.iv
  store double %add88.us, double* %arrayidx94.us, align 8
  %cmp10.us = icmp slt i64 %add61.us, %0
  br i1 %cmp10.us, label %for.inc.us, label %for.inc95.us.loopexit, !llvm.loop !9

for.inc95.us.loopexit:                            ; preds = %for.inc.us
  br label %for.inc95.us

for.inc95.us:                                     ; preds = %for.inc95.us.loopexit, %middle.block81
  %cmp6.us = icmp slt i64 %add34.us, %0
  br i1 %cmp6.us, label %for.cond8.preheader.us, label %for.inc98.loopexit

for.inc98.loopexit:                               ; preds = %for.inc95.us
  br label %for.inc98

for.inc98:                                        ; preds = %for.cond8.preheader.lr.ph.for.inc98_crit_edge, %for.cond4.preheader.for.inc98_crit_edge, %for.inc98.loopexit
  %indvars.iv.next57.pre-phi = phi i64 [ %add, %for.cond8.preheader.lr.ph.for.inc98_crit_edge ], [ undef, %for.cond4.preheader.for.inc98_crit_edge ], [ %add, %for.inc98.loopexit ]
  %cmp2 = icmp slt i64 %indvars.iv.next57.pre-phi, %0
  br i1 %cmp2, label %for.cond4.preheader, label %for.cond101.preheader.loopexit

for.cond105.preheader:                            ; preds = %for.cond105.preheader.preheader, %for.inc206
  %indvar = phi i64 [ %45, %for.inc206 ], [ 0, %for.cond105.preheader.preheader ]
  %indvars.iv62 = phi i64 [ %indvars.iv.next63.pre-phi, %for.inc206 ], [ 1, %for.cond105.preheader.preheader ]
  %45 = add nuw nsw i64 %indvar, 1
  %46 = add nuw nsw i64 %indvar, 2
  br i1 true, label %for.cond109.preheader.lr.ph, label %for.cond105.preheader.for.inc206_crit_edge

for.cond105.preheader.for.inc206_crit_edge:       ; preds = %for.cond105.preheader
  br label %for.inc206

for.cond109.preheader.lr.ph:                      ; preds = %for.cond105.preheader
  %add113 = add nuw nsw i64 %indvars.iv62, 1
  %sub128 = add nsw i64 %indvars.iv62, -1
  br i1 true, label %for.cond109.preheader.us.preheader, label %for.cond109.preheader.lr.ph.for.inc206_crit_edge

for.cond109.preheader.lr.ph.for.inc206_crit_edge: ; preds = %for.cond109.preheader.lr.ph
  br label %for.inc206

for.cond109.preheader.us.preheader:               ; preds = %for.cond109.preheader.lr.ph
  br label %for.cond109.preheader.us

for.cond109.preheader.us:                         ; preds = %for.cond109.preheader.us.preheader, %for.inc203.us
  %indvar64 = phi i64 [ %47, %for.inc203.us ], [ 0, %for.cond109.preheader.us.preheader ]
  %indvars.iv60 = phi i64 [ %add139.us, %for.inc203.us ], [ 1, %for.cond109.preheader.us.preheader ]
  %47 = add nuw nsw i64 %indvar64, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %45, i64 %47, i64 1
  %scevgep68 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %45, i64 %47, i64 %smax
  %scevgep70 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvar, i64 %47, i64 1
  %scevgep72 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %46, i64 %47, i64 %smax
  %add139.us = add nuw nsw i64 %indvars.iv60, 1
  %sub154.us = add nsw i64 %indvars.iv60, -1
  br i1 %min.iters.check, label %for.inc200.us.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %for.cond109.preheader.us
  br i1 %cmp.zero, label %for.inc200.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep72
  %bound1 = icmp ult double* %scevgep70, %scevgep68
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.inc200.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %48 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %add113, i64 %indvars.iv60, i64 %offset.idx
  %49 = bitcast double* %48 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %49, align 8, !alias.scope !10
  %50 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv62, i64 %indvars.iv60, i64 %offset.idx
  %51 = bitcast double* %50 to <2 x double>*
  %wide.load74 = load <2 x double>, <2 x double>* %51, align 8, !alias.scope !10
  %52 = fmul <2 x double> %wide.load74, <double 2.000000e+00, double 2.000000e+00>
  %53 = fsub <2 x double> %wide.load, %52
  %54 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %sub128, i64 %indvars.iv60, i64 %offset.idx
  %55 = bitcast double* %54 to <2 x double>*
  %wide.load75 = load <2 x double>, <2 x double>* %55, align 8, !alias.scope !10
  %56 = fadd <2 x double> %wide.load75, %53
  %57 = fmul <2 x double> %56, <double 1.250000e-01, double 1.250000e-01>
  %58 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv62, i64 %add139.us, i64 %offset.idx
  %59 = bitcast double* %58 to <2 x double>*
  %wide.load76 = load <2 x double>, <2 x double>* %59, align 8, !alias.scope !10
  %60 = fsub <2 x double> %wide.load76, %52
  %61 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv62, i64 %sub154.us, i64 %offset.idx
  %62 = bitcast double* %61 to <2 x double>*
  %wide.load77 = load <2 x double>, <2 x double>* %62, align 8, !alias.scope !10
  %63 = fadd <2 x double> %60, %wide.load77
  %64 = fmul <2 x double> %63, <double 1.250000e-01, double 1.250000e-01>
  %65 = fadd <2 x double> %57, %64
  %66 = add nuw nsw i64 %offset.idx, 1
  %67 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv62, i64 %indvars.iv60, i64 %66
  %68 = bitcast double* %67 to <2 x double>*
  %wide.load78 = load <2 x double>, <2 x double>* %68, align 8, !alias.scope !10
  %69 = fsub <2 x double> %wide.load78, %52
  %70 = add nsw i64 %offset.idx, -1
  %71 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv62, i64 %indvars.iv60, i64 %70
  %72 = bitcast double* %71 to <2 x double>*
  %wide.load79 = load <2 x double>, <2 x double>* %72, align 8, !alias.scope !10
  %73 = fadd <2 x double> %69, %wide.load79
  %74 = fmul <2 x double> %73, <double 1.250000e-01, double 1.250000e-01>
  %75 = fadd <2 x double> %65, %74
  %76 = fadd <2 x double> %wide.load74, %75
  %77 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv62, i64 %indvars.iv60, i64 %offset.idx
  %78 = bitcast double* %77 to <2 x double>*
  store <2 x double> %76, <2 x double>* %78, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %79 = icmp eq i64 %index.next, %n.vec
  br i1 %79, label %middle.block, label %vector.body, !llvm.loop !15

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %for.inc203.us, label %for.inc200.us.preheader

for.inc200.us.preheader:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond109.preheader.us
  %indvars.iv58.ph = phi i64 [ 1, %vector.memcheck ], [ 1, %min.iters.checked ], [ 1, %for.cond109.preheader.us ], [ %ind.end, %middle.block ]
  br label %for.inc200.us

for.inc200.us:                                    ; preds = %for.inc200.us.preheader, %for.inc200.us
  %indvars.iv58 = phi i64 [ %add166.us, %for.inc200.us ], [ %indvars.iv58.ph, %for.inc200.us.preheader ]
  %arrayidx119.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %add113, i64 %indvars.iv60, i64 %indvars.iv58
  %80 = load double, double* %arrayidx119.us, align 8
  %arrayidx125.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv62, i64 %indvars.iv60, i64 %indvars.iv58
  %81 = load double, double* %arrayidx125.us, align 8
  %mul126.us = fmul double %81, 2.000000e+00
  %sub127.us = fsub double %80, %mul126.us
  %arrayidx134.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %sub128, i64 %indvars.iv60, i64 %indvars.iv58
  %82 = load double, double* %arrayidx134.us, align 8
  %add135.us = fadd double %82, %sub127.us
  %mul136.us = fmul double %add135.us, 1.250000e-01
  %arrayidx143.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv62, i64 %add139.us, i64 %indvars.iv58
  %83 = load double, double* %arrayidx143.us, align 8
  %sub151.us = fsub double %83, %mul126.us
  %arrayidx158.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv62, i64 %sub154.us, i64 %indvars.iv58
  %84 = load double, double* %arrayidx158.us, align 8
  %add159.us = fadd double %sub151.us, %84
  %mul160.us = fmul double %add159.us, 1.250000e-01
  %add161.us = fadd double %mul136.us, %mul160.us
  %add166.us = add nuw nsw i64 %indvars.iv58, 1
  %arrayidx168.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv62, i64 %indvars.iv60, i64 %add166.us
  %85 = load double, double* %arrayidx168.us, align 8
  %sub176.us = fsub double %85, %mul126.us
  %sub181.us = add nsw i64 %indvars.iv58, -1
  %arrayidx183.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv62, i64 %indvars.iv60, i64 %sub181.us
  %86 = load double, double* %arrayidx183.us, align 8
  %add184.us = fadd double %sub176.us, %86
  %mul185.us = fmul double %add184.us, 1.250000e-01
  %add186.us = fadd double %add161.us, %mul185.us
  %add193.us = fadd double %81, %add186.us
  %arrayidx199.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv62, i64 %indvars.iv60, i64 %indvars.iv58
  store double %add193.us, double* %arrayidx199.us, align 8
  %cmp111.us = icmp slt i64 %add166.us, %0
  br i1 %cmp111.us, label %for.inc200.us, label %for.inc203.us.loopexit, !llvm.loop !16

for.inc203.us.loopexit:                           ; preds = %for.inc200.us
  br label %for.inc203.us

for.inc203.us:                                    ; preds = %for.inc203.us.loopexit, %middle.block
  %exitcond = icmp eq i64 %add139.us, %wide.trip.count
  br i1 %exitcond, label %for.inc206.loopexit, label %for.cond109.preheader.us

for.inc206.loopexit:                              ; preds = %for.inc203.us
  br label %for.inc206

for.inc206:                                       ; preds = %for.cond109.preheader.lr.ph.for.inc206_crit_edge, %for.cond105.preheader.for.inc206_crit_edge, %for.inc206.loopexit
  %indvars.iv.next63.pre-phi = phi i64 [ %add113, %for.cond109.preheader.lr.ph.for.inc206_crit_edge ], [ undef, %for.cond105.preheader.for.inc206_crit_edge ], [ %add113, %for.inc206.loopexit ]
  %cmp103 = icmp slt i64 %indvars.iv.next63.pre-phi, %0
  br i1 %cmp103, label %for.cond105.preheader, label %for.inc209.loopexit

for.inc209.loopexit:                              ; preds = %for.inc206
  br label %for.inc209

for.inc209:                                       ; preds = %for.inc209.loopexit, %for.cond101.preheader
  %inc210 = add nsw i32 %inc21051, 1
  %cmp = icmp slt i32 %inc210, 501
  br i1 %cmp, label %for.cond1.preheader, label %for.end211

for.end211:                                       ; preds = %for.inc209
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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp12 = icmp sgt i32 %n, 0
  br i1 %cmp12, label %for.cond2.preheader.lr.ph, label %for.end23

for.cond2.preheader.lr.ph:                        ; preds = %entry
  br i1 true, label %for.cond2.preheader.us.preheader, label %for.cond.for.end23_crit_edge.loopexit49

for.cond2.preheader.us.preheader:                 ; preds = %for.cond2.preheader.lr.ph
  %3 = sext i32 %n to i64
  %wide.trip.count = zext i32 %n to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.preheader.us.preheader, %for.inc21.us
  %indvars.iv56 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next57, %for.inc21.us ]
  br i1 true, label %for.cond5.preheader.lr.ph.split.us.us, label %for.cond2.preheader.us.for.inc21.us_crit_edge

for.cond2.preheader.us.for.inc21.us_crit_edge:    ; preds = %for.cond2.preheader.us
  br label %for.inc21.us

for.inc21.us.loopexit:                            ; preds = %for.inc18.us.us
  br label %for.inc21.us

for.inc21.us:                                     ; preds = %for.cond2.preheader.us.for.inc21.us_crit_edge, %for.inc21.us.loopexit
  %indvars.iv.next57 = add nsw i64 %indvars.iv56, 1
  %cmp.us = icmp slt i64 %indvars.iv.next57, %3
  br i1 %cmp.us, label %for.cond2.preheader.us, label %for.cond.for.end23_crit_edge.loopexit

for.cond5.preheader.us.us:                        ; preds = %for.inc18.us.us, %for.cond5.preheader.lr.ph.split.us.us
  %indvars.iv52 = phi i64 [ 0, %for.cond5.preheader.lr.ph.split.us.us ], [ %indvars.iv.next53, %for.inc18.us.us ]
  %4 = trunc i64 %indvars.iv52 to i32
  %mul83.us.us = add i32 %12, %4
  %add.us.us = mul i32 %mul83.us.us, %n
  %5 = zext i32 %add.us.us to i64
  br label %for.body7.us.us

for.inc18.us.us:                                  ; preds = %for.inc.us.us
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, %wide.trip.count
  br i1 %exitcond55, label %for.inc21.us.loopexit, label %for.cond5.preheader.us.us

for.body7.us.us:                                  ; preds = %for.inc.us.us, %for.cond5.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc.us.us ], [ 0, %for.cond5.preheader.us.us ]
  %6 = add i64 %5, %indvars.iv
  %7 = trunc i64 %6 to i32
  %rem.us.us = srem i32 %7, 20
  %cmp11.us.us = icmp eq i32 %rem.us.us, 0
  br i1 %cmp11.us.us, label %if.then.us.us, label %for.inc.us.us

if.then.us.us:                                    ; preds = %for.body7.us.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #5
  br label %for.inc.us.us

for.inc.us.us:                                    ; preds = %if.then.us.us, %for.body7.us.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16.us.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv56, i64 %indvars.iv52, i64 %indvars.iv
  %10 = load double, double* %arrayidx16.us.us, align 8
  %call17.us.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.inc18.us.us, label %for.body7.us.us

for.cond5.preheader.lr.ph.split.us.us:            ; preds = %for.cond2.preheader.us
  %11 = mul nsw i64 %indvars.iv56, %3
  %12 = trunc i64 %11 to i32
  br label %for.cond5.preheader.us.us

for.cond.for.end23_crit_edge.loopexit:            ; preds = %for.inc21.us
  br label %for.cond.for.end23_crit_edge

for.cond.for.end23_crit_edge.loopexit49:          ; preds = %for.cond2.preheader.lr.ph
  br label %for.cond.for.end23_crit_edge

for.cond.for.end23_crit_edge:                     ; preds = %for.cond.for.end23_crit_edge.loopexit49, %for.cond.for.end23_crit_edge.loopexit
  br label %for.end23

for.end23:                                        ; preds = %for.cond.for.end23_crit_edge, %entry
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %14) #5
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
