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
  tail call fastcc void @init_array([120 x [120 x double]]* %arraydecay, [120 x [120 x double]]* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_heat_3d([120 x [120 x double]]* %arraydecay, [120 x [120 x double]]* %arraydecay2)
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
  tail call fastcc void @print_array([120 x [120 x double]]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([120 x [120 x double]]* nocapture %A, [120 x [120 x double]]* nocapture %B) unnamed_addr #2 {
for.cond1.preheader.lr.ph.for.cond1.preheader_crit_edge:
  br label %for.cond1.preheader.for.cond4.preheader_crit_edge

for.cond1.preheader.for.cond4.preheader_crit_edge: ; preds = %for.inc22, %for.cond1.preheader.lr.ph.for.cond1.preheader_crit_edge
  %indvars.iv816 = phi i64 [ 0, %for.cond1.preheader.lr.ph.for.cond1.preheader_crit_edge ], [ %indvars.iv.next9, %for.inc22 ]
  %0 = add nuw nsw i64 %indvars.iv816, 120
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.inc19, %for.cond1.preheader.for.cond4.preheader_crit_edge
  %indvars.iv313 = phi i64 [ 0, %for.cond1.preheader.for.cond4.preheader_crit_edge ], [ %indvars.iv.next4, %for.inc19 ]
  %1 = add nuw nsw i64 %0, %indvars.iv313
  br label %for.body6

for.body6:                                        ; preds = %for.body6, %for.cond4.preheader
  %indvars.iv11 = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next.1, %for.body6 ]
  %2 = sub nuw nsw i64 %1, %indvars.iv11
  %3 = trunc i64 %2 to i32
  %conv = sitofp i32 %3 to double
  %mul = fmul double %conv, 1.000000e+01
  %div = fdiv double %mul, 1.200000e+02
  %arrayidx12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv816, i64 %indvars.iv313, i64 %indvars.iv11
  store double %div, double* %arrayidx12, align 8
  %arrayidx18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv816, i64 %indvars.iv313, i64 %indvars.iv11
  store double %div, double* %arrayidx18, align 8
  %indvars.iv.next = or i64 %indvars.iv11, 1
  %4 = sub nuw nsw i64 %1, %indvars.iv.next
  %5 = trunc i64 %4 to i32
  %conv.1 = sitofp i32 %5 to double
  %mul.1 = fmul double %conv.1, 1.000000e+01
  %div.1 = fdiv double %mul.1, 1.200000e+02
  %arrayidx12.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv816, i64 %indvars.iv313, i64 %indvars.iv.next
  store double %div.1, double* %arrayidx12.1, align 8
  %arrayidx18.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv816, i64 %indvars.iv313, i64 %indvars.iv.next
  store double %div.1, double* %arrayidx18.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv11, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %for.inc19, label %for.body6

for.inc19:                                        ; preds = %for.body6
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv313, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next4, 120
  br i1 %exitcond7, label %for.inc22, label %for.cond4.preheader

for.inc22:                                        ; preds = %for.inc19
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv816, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next9, 120
  br i1 %exitcond38, label %for.end24, label %for.cond1.preheader.for.cond4.preheader_crit_edge

for.end24:                                        ; preds = %for.inc22
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d([120 x [120 x double]]* nocapture %A, [120 x [120 x double]]* nocapture %B) unnamed_addr #2 {
entry:
  br label %for.cond4.preheader.for.cond8.preheader_crit_edge.preheader

for.cond4.preheader.for.cond8.preheader_crit_edge.preheader: ; preds = %entry, %for.inc209
  %t.044 = phi i32 [ 1, %entry ], [ %inc210, %for.inc209 ]
  br label %for.cond4.preheader.for.cond8.preheader_crit_edge

for.cond4.preheader.for.cond8.preheader_crit_edge: ; preds = %for.cond4.preheader.for.cond8.preheader_crit_edge.preheader, %for.inc98
  %indvar21 = phi i64 [ 0, %for.cond4.preheader.for.cond8.preheader_crit_edge.preheader ], [ %0, %for.inc98 ]
  %indvars.iv834 = phi i64 [ 1, %for.cond4.preheader.for.cond8.preheader_crit_edge.preheader ], [ %2, %for.inc98 ]
  %0 = add i64 %indvar21, 1
  %1 = add i64 %indvar21, 2
  %2 = add nuw nsw i64 %indvars.iv834, 1
  %3 = add nsw i64 %indvars.iv834, -1
  br label %for.cond8.preheader

for.cond8.preheader:                              ; preds = %for.inc95, %for.cond4.preheader.for.cond8.preheader_crit_edge
  %indvar23 = phi i64 [ %4, %for.inc95 ], [ 0, %for.cond4.preheader.for.cond8.preheader_crit_edge ]
  %indvars.iv231 = phi i64 [ %5, %for.inc95 ], [ 1, %for.cond4.preheader.for.cond8.preheader_crit_edge ]
  %4 = add i64 %indvar23, 1
  %scevgep25 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %0, i64 %4, i64 1
  %scevgep27 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %0, i64 %4, i64 119
  %scevgep29 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvar21, i64 %4, i64 1
  %scevgep31 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %1, i64 %4, i64 119
  %5 = add nuw nsw i64 %indvars.iv231, 1
  %6 = add nsw i64 %indvars.iv231, -1
  %bound033 = icmp ult double* %scevgep25, %scevgep31
  %bound134 = icmp ult double* %scevgep29, %scevgep27
  %found.conflict35 = and i1 %bound033, %bound134
  br i1 %found.conflict35, label %for.body11.preheader, label %vector.body16.preheader

vector.body16.preheader:                          ; preds = %for.cond8.preheader
  br label %vector.body16

for.body11.preheader:                             ; preds = %for.cond8.preheader
  br label %for.body11

vector.body16:                                    ; preds = %vector.body16.preheader, %vector.body16
  %index39 = phi i64 [ %index.next40, %vector.body16 ], [ 0, %vector.body16.preheader ]
  %offset.idx43 = or i64 %index39, 1
  %7 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %2, i64 %indvars.iv231, i64 %offset.idx43
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load47 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !1
  %9 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv834, i64 %indvars.iv231, i64 %offset.idx43
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load48 = load <2 x double>, <2 x double>* %10, align 8, !alias.scope !1
  %11 = fmul <2 x double> %wide.load48, <double 2.000000e+00, double 2.000000e+00>
  %12 = fsub <2 x double> %wide.load47, %11
  %13 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %3, i64 %indvars.iv231, i64 %offset.idx43
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load49 = load <2 x double>, <2 x double>* %14, align 8, !alias.scope !1
  %15 = fadd <2 x double> %wide.load49, %12
  %16 = fmul <2 x double> %15, <double 1.250000e-01, double 1.250000e-01>
  %17 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv834, i64 %5, i64 %offset.idx43
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load50 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !1
  %19 = fsub <2 x double> %wide.load50, %11
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv834, i64 %6, i64 %offset.idx43
  %21 = bitcast double* %20 to <2 x double>*
  %wide.load51 = load <2 x double>, <2 x double>* %21, align 8, !alias.scope !1
  %22 = fadd <2 x double> %19, %wide.load51
  %23 = fmul <2 x double> %22, <double 1.250000e-01, double 1.250000e-01>
  %24 = fadd <2 x double> %16, %23
  %25 = add nuw nsw i64 %offset.idx43, 1
  %26 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv834, i64 %indvars.iv231, i64 %25
  %27 = bitcast double* %26 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %27, align 8, !alias.scope !1
  %28 = fsub <2 x double> %wide.load52, %11
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv834, i64 %indvars.iv231, i64 %index39
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !1
  %31 = fadd <2 x double> %28, %wide.load53
  %32 = fmul <2 x double> %31, <double 1.250000e-01, double 1.250000e-01>
  %33 = fadd <2 x double> %24, %32
  %34 = fadd <2 x double> %wide.load48, %33
  %35 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv834, i64 %indvars.iv231, i64 %offset.idx43
  %36 = bitcast double* %35 to <2 x double>*
  store <2 x double> %34, <2 x double>* %36, align 8, !alias.scope !4, !noalias !1
  %index.next40 = add i64 %index39, 2
  %37 = icmp eq i64 %index.next40, 118
  br i1 %37, label %for.inc95, label %vector.body16, !llvm.loop !6

for.body11:                                       ; preds = %for.body11.preheader, %for.body11
  %indvars.iv29 = phi i64 [ %indvars.iv.next, %for.body11 ], [ 1, %for.body11.preheader ]
  %arrayidx15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %2, i64 %indvars.iv231, i64 %indvars.iv29
  %38 = load double, double* %arrayidx15, align 8
  %arrayidx21 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv834, i64 %indvars.iv231, i64 %indvars.iv29
  %39 = load double, double* %arrayidx21, align 8
  %mul = fmul double %39, 2.000000e+00
  %sub22 = fsub double %38, %mul
  %arrayidx29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %3, i64 %indvars.iv231, i64 %indvars.iv29
  %40 = load double, double* %arrayidx29, align 8
  %add30 = fadd double %40, %sub22
  %mul31 = fmul double %add30, 1.250000e-01
  %arrayidx38 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv834, i64 %5, i64 %indvars.iv29
  %41 = load double, double* %arrayidx38, align 8
  %sub46 = fsub double %41, %mul
  %arrayidx53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv834, i64 %6, i64 %indvars.iv29
  %42 = load double, double* %arrayidx53, align 8
  %add54 = fadd double %sub46, %42
  %mul55 = fmul double %add54, 1.250000e-01
  %add56 = fadd double %mul31, %mul55
  %indvars.iv.next = add nuw nsw i64 %indvars.iv29, 1
  %arrayidx63 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv834, i64 %indvars.iv231, i64 %indvars.iv.next
  %43 = load double, double* %arrayidx63, align 8
  %sub71 = fsub double %43, %mul
  %44 = add nsw i64 %indvars.iv29, -1
  %arrayidx78 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv834, i64 %indvars.iv231, i64 %44
  %45 = load double, double* %arrayidx78, align 8
  %add79 = fadd double %sub71, %45
  %mul80 = fmul double %add79, 1.250000e-01
  %add81 = fadd double %add56, %mul80
  %add88 = fadd double %39, %add81
  %arrayidx94 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv834, i64 %indvars.iv231, i64 %indvars.iv29
  store double %add88, double* %arrayidx94, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %for.inc95, label %for.body11, !llvm.loop !9

for.inc95:                                        ; preds = %vector.body16, %for.body11
  %exitcond7 = icmp eq i64 %5, 119
  br i1 %exitcond7, label %for.inc98, label %for.cond8.preheader

for.inc98:                                        ; preds = %for.inc95
  %exitcond3 = icmp eq i64 %2, 119
  br i1 %exitcond3, label %for.cond105.preheader.for.cond109.preheader_crit_edge.preheader, label %for.cond4.preheader.for.cond8.preheader_crit_edge

for.cond105.preheader.for.cond109.preheader_crit_edge.preheader: ; preds = %for.inc98
  br label %for.cond105.preheader.for.cond109.preheader_crit_edge

for.cond105.preheader.for.cond109.preheader_crit_edge: ; preds = %for.cond105.preheader.for.cond109.preheader_crit_edge.preheader, %for.inc206
  %indvar = phi i64 [ %46, %for.inc206 ], [ 0, %for.cond105.preheader.for.cond109.preheader_crit_edge.preheader ]
  %indvars.iv2342 = phi i64 [ %48, %for.inc206 ], [ 1, %for.cond105.preheader.for.cond109.preheader_crit_edge.preheader ]
  %46 = add i64 %indvar, 1
  %47 = add i64 %indvar, 2
  %48 = add nuw nsw i64 %indvars.iv2342, 1
  %49 = add nsw i64 %indvars.iv2342, -1
  br label %for.cond109.preheader

for.cond109.preheader:                            ; preds = %for.inc203, %for.cond105.preheader.for.cond109.preheader_crit_edge
  %indvar1 = phi i64 [ %50, %for.inc203 ], [ 0, %for.cond105.preheader.for.cond109.preheader_crit_edge ]
  %indvars.iv1739 = phi i64 [ %51, %for.inc203 ], [ 1, %for.cond105.preheader.for.cond109.preheader_crit_edge ]
  %50 = add i64 %indvar1, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %46, i64 %50, i64 1
  %scevgep4 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %46, i64 %50, i64 119
  %scevgep6 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvar, i64 %50, i64 1
  %scevgep8 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %47, i64 %50, i64 119
  %51 = add nuw nsw i64 %indvars.iv1739, 1
  %52 = add nsw i64 %indvars.iv1739, -1
  %bound0 = icmp ult double* %scevgep, %scevgep8
  %bound1 = icmp ult double* %scevgep6, %scevgep4
  %found.conflict = and i1 %bound0, %bound1
  br i1 %found.conflict, label %for.body112.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond109.preheader
  br label %vector.body

for.body112.preheader:                            ; preds = %for.cond109.preheader
  br label %for.body112

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %48, i64 %indvars.iv1739, i64 %offset.idx
  %54 = bitcast double* %53 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %54, align 8, !alias.scope !10
  %55 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv2342, i64 %indvars.iv1739, i64 %offset.idx
  %56 = bitcast double* %55 to <2 x double>*
  %wide.load10 = load <2 x double>, <2 x double>* %56, align 8, !alias.scope !10
  %57 = fmul <2 x double> %wide.load10, <double 2.000000e+00, double 2.000000e+00>
  %58 = fsub <2 x double> %wide.load, %57
  %59 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %49, i64 %indvars.iv1739, i64 %offset.idx
  %60 = bitcast double* %59 to <2 x double>*
  %wide.load11 = load <2 x double>, <2 x double>* %60, align 8, !alias.scope !10
  %61 = fadd <2 x double> %wide.load11, %58
  %62 = fmul <2 x double> %61, <double 1.250000e-01, double 1.250000e-01>
  %63 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv2342, i64 %51, i64 %offset.idx
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !10
  %65 = fsub <2 x double> %wide.load12, %57
  %66 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv2342, i64 %52, i64 %offset.idx
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load13 = load <2 x double>, <2 x double>* %67, align 8, !alias.scope !10
  %68 = fadd <2 x double> %65, %wide.load13
  %69 = fmul <2 x double> %68, <double 1.250000e-01, double 1.250000e-01>
  %70 = fadd <2 x double> %62, %69
  %71 = add nuw nsw i64 %offset.idx, 1
  %72 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv2342, i64 %indvars.iv1739, i64 %71
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load14 = load <2 x double>, <2 x double>* %73, align 8, !alias.scope !10
  %74 = fsub <2 x double> %wide.load14, %57
  %75 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv2342, i64 %indvars.iv1739, i64 %index
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load15 = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !10
  %77 = fadd <2 x double> %74, %wide.load15
  %78 = fmul <2 x double> %77, <double 1.250000e-01, double 1.250000e-01>
  %79 = fadd <2 x double> %70, %78
  %80 = fadd <2 x double> %wide.load10, %79
  %81 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv2342, i64 %indvars.iv1739, i64 %offset.idx
  %82 = bitcast double* %81 to <2 x double>*
  store <2 x double> %80, <2 x double>* %82, align 8, !alias.scope !13, !noalias !10
  %index.next = add i64 %index, 2
  %83 = icmp eq i64 %index.next, 118
  br i1 %83, label %for.inc203, label %vector.body, !llvm.loop !15

for.body112:                                      ; preds = %for.body112.preheader, %for.body112
  %indvars.iv1237 = phi i64 [ %indvars.iv.next13, %for.body112 ], [ 1, %for.body112.preheader ]
  %arrayidx119 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %48, i64 %indvars.iv1739, i64 %indvars.iv1237
  %84 = load double, double* %arrayidx119, align 8
  %arrayidx125 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv2342, i64 %indvars.iv1739, i64 %indvars.iv1237
  %85 = load double, double* %arrayidx125, align 8
  %mul126 = fmul double %85, 2.000000e+00
  %sub127 = fsub double %84, %mul126
  %arrayidx134 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %49, i64 %indvars.iv1739, i64 %indvars.iv1237
  %86 = load double, double* %arrayidx134, align 8
  %add135 = fadd double %86, %sub127
  %mul136 = fmul double %add135, 1.250000e-01
  %arrayidx143 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv2342, i64 %51, i64 %indvars.iv1237
  %87 = load double, double* %arrayidx143, align 8
  %sub151 = fsub double %87, %mul126
  %arrayidx158 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv2342, i64 %52, i64 %indvars.iv1237
  %88 = load double, double* %arrayidx158, align 8
  %add159 = fadd double %sub151, %88
  %mul160 = fmul double %add159, 1.250000e-01
  %add161 = fadd double %mul136, %mul160
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv1237, 1
  %arrayidx168 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv2342, i64 %indvars.iv1739, i64 %indvars.iv.next13
  %89 = load double, double* %arrayidx168, align 8
  %sub176 = fsub double %89, %mul126
  %90 = add nsw i64 %indvars.iv1237, -1
  %arrayidx183 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv2342, i64 %indvars.iv1739, i64 %90
  %91 = load double, double* %arrayidx183, align 8
  %add184 = fadd double %sub176, %91
  %mul185 = fmul double %add184, 1.250000e-01
  %add186 = fadd double %add161, %mul185
  %add193 = fadd double %85, %add186
  %arrayidx199 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv2342, i64 %indvars.iv1739, i64 %indvars.iv1237
  store double %add193, double* %arrayidx199, align 8
  %exitcond16 = icmp eq i64 %indvars.iv.next13, 119
  br i1 %exitcond16, label %for.inc203, label %for.body112, !llvm.loop !16

for.inc203:                                       ; preds = %vector.body, %for.body112
  %exitcond22 = icmp eq i64 %51, 119
  br i1 %exitcond22, label %for.inc206, label %for.cond109.preheader

for.inc206:                                       ; preds = %for.inc203
  %exitcond4 = icmp eq i64 %48, 119
  br i1 %exitcond4, label %for.inc209, label %for.cond105.preheader.for.cond109.preheader_crit_edge

for.inc209:                                       ; preds = %for.inc206
  %inc210 = add nuw nsw i32 %t.044, 1
  %exitcond27 = icmp eq i32 %inc210, 501
  br i1 %exitcond27, label %for.end211, label %for.cond4.preheader.for.cond8.preheader_crit_edge.preheader

for.end211:                                       ; preds = %for.inc209
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([120 x [120 x double]]* nocapture readonly %A) unnamed_addr #0 {
for.cond2.preheader.lr.ph.for.cond2.preheader_crit_edge:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.for.cond5.preheader_crit_edge

for.cond2.preheader.for.cond5.preheader_crit_edge: ; preds = %for.inc21, %for.cond2.preheader.lr.ph.for.cond2.preheader_crit_edge
  %indvars.iv818 = phi i64 [ 0, %for.cond2.preheader.lr.ph.for.cond2.preheader_crit_edge ], [ %indvars.iv.next9, %for.inc21 ]
  %3 = mul nuw nsw i64 %indvars.iv818, 14400
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.inc18, %for.cond2.preheader.for.cond5.preheader_crit_edge
  %indvars.iv215 = phi i64 [ 0, %for.cond2.preheader.for.cond5.preheader_crit_edge ], [ %indvars.iv.next3, %for.inc18 ]
  %4 = mul nuw nsw i64 %indvars.iv215, 120
  %5 = add nuw nsw i64 %4, %3
  br label %for.body7

for.body7:                                        ; preds = %if.end, %for.cond5.preheader
  %indvars.iv13 = phi i64 [ 0, %for.cond5.preheader ], [ %indvars.iv.next, %if.end ]
  %6 = add nuw nsw i64 %5, %indvars.iv13
  %7 = trunc i64 %6 to i32
  %rem = srem i32 %7, 20
  %cmp11 = icmp eq i32 %rem, 0
  br i1 %cmp11, label %if.then, label %if.end

if.then:                                          ; preds = %for.body7
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #5
  br label %if.end

if.end:                                           ; preds = %for.body7, %if.then
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv818, i64 %indvars.iv215, i64 %indvars.iv13
  %10 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %for.inc18, label %for.body7

for.inc18:                                        ; preds = %if.end
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv215, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next3, 120
  br i1 %exitcond7, label %for.inc21, label %for.cond5.preheader

for.inc21:                                        ; preds = %for.inc18
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv818, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next9, 120
  br i1 %exitcond41, label %for.end23, label %for.cond2.preheader.for.cond5.preheader_crit_edge

for.end23:                                        ; preds = %for.inc21
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %12) #5
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
