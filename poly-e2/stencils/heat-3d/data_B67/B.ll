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
  %arraydecay3 = bitcast i8* %call to [120 x [120 x double]]*
  %arraydecay4 = bitcast i8* %call1 to [120 x [120 x double]]*
  tail call fastcc void @kernel_heat_3d([120 x [120 x double]]* %arraydecay3, [120 x [120 x double]]* %arraydecay4)
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
for.cond1.preheader.lr.ph:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end21, %for.cond1.preheader.lr.ph
  %indvars.iv12 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next13, %for.end21 ]
  %0 = add nuw nsw i64 %indvars.iv12, 120
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.end, %for.cond1.preheader
  %indvars.iv9 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next10, %for.end ]
  %1 = add nuw nsw i64 %0, %indvars.iv9
  br label %for.body6

for.body6:                                        ; preds = %for.body6, %for.cond4.preheader
  %indvars.iv = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next.1, %for.body6 ]
  %2 = sub nuw nsw i64 %1, %indvars.iv
  %3 = trunc i64 %2 to i32
  %conv = sitofp i32 %3 to double
  %mul = fmul double %conv, 1.000000e+01
  %div = fdiv double %mul, 1.200000e+02
  %arrayidx12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv12, i64 %indvars.iv9, i64 %indvars.iv
  store double %div, double* %arrayidx12, align 8
  %arrayidx18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv12, i64 %indvars.iv9, i64 %indvars.iv
  store double %div, double* %arrayidx18, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %4 = sub nuw nsw i64 %1, %indvars.iv.next
  %5 = trunc i64 %4 to i32
  %conv.1 = sitofp i32 %5 to double
  %mul.1 = fmul double %conv.1, 1.000000e+01
  %div.1 = fdiv double %mul.1, 1.200000e+02
  %arrayidx12.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv12, i64 %indvars.iv9, i64 %indvars.iv.next
  store double %div.1, double* %arrayidx12.1, align 8
  %arrayidx18.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv12, i64 %indvars.iv9, i64 %indvars.iv.next
  store double %div.1, double* %arrayidx18.1, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %for.end, label %for.body6

for.end:                                          ; preds = %for.body6
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond = icmp eq i64 %indvars.iv.next10, 120
  br i1 %exitcond, label %for.end21, label %for.cond4.preheader

for.end21:                                        ; preds = %for.end
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next13, 120
  br i1 %exitcond15, label %for.end24, label %for.cond1.preheader

for.end24:                                        ; preds = %for.end21
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d([120 x [120 x double]]* nocapture %A, [120 x [120 x double]]* nocapture %B) unnamed_addr #2 {
entry:
  br label %for.cond4.preheader.preheader

for.cond4.preheader.preheader:                    ; preds = %for.end208, %entry
  %inc21018 = phi i32 [ 1, %entry ], [ %inc210, %for.end208 ]
  br label %for.cond8.preheader.lr.ph

for.cond8.preheader.lr.ph:                        ; preds = %for.end97, %for.cond4.preheader.preheader
  %indvar21 = phi i64 [ 0, %for.cond4.preheader.preheader ], [ %indvar.next22, %for.end97 ]
  %indvars.iv6 = phi i64 [ 1, %for.cond4.preheader.preheader ], [ %indvars.iv.next7, %for.end97 ]
  %0 = add nuw nsw i64 %indvar21, 1
  %1 = add nuw nsw i64 %indvar21, 2
  %2 = add nuw nsw i64 %indvars.iv6, 1
  %3 = add nsw i64 %indvars.iv6, -1
  br label %vector.memcheck37

vector.memcheck37:                                ; preds = %for.end.us, %for.cond8.preheader.lr.ph
  %indvar23 = phi i64 [ 0, %for.cond8.preheader.lr.ph ], [ %indvar.next24, %for.end.us ]
  %indvars.iv2 = phi i64 [ 1, %for.cond8.preheader.lr.ph ], [ %indvars.iv.next3, %for.end.us ]
  %4 = add nuw nsw i64 %indvar23, 1
  %scevgep25 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %0, i64 %4, i64 1
  %scevgep27 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %0, i64 %4, i64 119
  %scevgep29 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvar21, i64 %4, i64 1
  %scevgep31 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %1, i64 %4, i64 119
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %5 = add nsw i64 %indvars.iv2, -1
  %bound033 = icmp ult double* %scevgep25, %scevgep31
  %bound134 = icmp ult double* %scevgep29, %scevgep27
  %memcheck.conflict36 = and i1 %bound033, %bound134
  br i1 %memcheck.conflict36, label %for.body11.us.preheader, label %vector.body16.preheader

vector.body16.preheader:                          ; preds = %vector.memcheck37
  br label %vector.body16

for.body11.us.preheader:                          ; preds = %vector.memcheck37
  br label %for.body11.us

vector.body16:                                    ; preds = %vector.body16.preheader, %vector.body16
  %index39 = phi i64 [ %index.next40, %vector.body16 ], [ 0, %vector.body16.preheader ]
  %offset.idx43 = or i64 %index39, 1
  %6 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %2, i64 %indvars.iv2, i64 %offset.idx43
  %7 = bitcast double* %6 to <2 x double>*
  %wide.load47 = load <2 x double>, <2 x double>* %7, align 8, !alias.scope !1
  %8 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv6, i64 %indvars.iv2, i64 %offset.idx43
  %9 = bitcast double* %8 to <2 x double>*
  %wide.load48 = load <2 x double>, <2 x double>* %9, align 8, !alias.scope !1
  %10 = fmul <2 x double> %wide.load48, <double 2.000000e+00, double 2.000000e+00>
  %11 = fsub <2 x double> %wide.load47, %10
  %12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %3, i64 %indvars.iv2, i64 %offset.idx43
  %13 = bitcast double* %12 to <2 x double>*
  %wide.load49 = load <2 x double>, <2 x double>* %13, align 8, !alias.scope !1
  %14 = fadd <2 x double> %wide.load49, %11
  %15 = fmul <2 x double> %14, <double 1.250000e-01, double 1.250000e-01>
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv6, i64 %indvars.iv.next3, i64 %offset.idx43
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load50 = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !1
  %18 = fsub <2 x double> %wide.load50, %10
  %19 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv6, i64 %5, i64 %offset.idx43
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load51 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !1
  %21 = fadd <2 x double> %18, %wide.load51
  %22 = fmul <2 x double> %21, <double 1.250000e-01, double 1.250000e-01>
  %23 = fadd <2 x double> %15, %22
  %24 = add nuw nsw i64 %offset.idx43, 1
  %25 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv6, i64 %indvars.iv2, i64 %24
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %26, align 8, !alias.scope !1
  %27 = fsub <2 x double> %wide.load52, %10
  %28 = add nsw i64 %offset.idx43, -1
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv6, i64 %indvars.iv2, i64 %28
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !1
  %31 = fadd <2 x double> %27, %wide.load53
  %32 = fmul <2 x double> %31, <double 1.250000e-01, double 1.250000e-01>
  %33 = fadd <2 x double> %23, %32
  %34 = fadd <2 x double> %wide.load48, %33
  %35 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv6, i64 %indvars.iv2, i64 %offset.idx43
  %36 = bitcast double* %35 to <2 x double>*
  store <2 x double> %34, <2 x double>* %36, align 8, !alias.scope !4, !noalias !1
  %index.next40 = add nuw nsw i64 %index39, 2
  %37 = icmp eq i64 %index.next40, 118
  br i1 %37, label %for.end.us.loopexit55, label %vector.body16, !llvm.loop !6

for.body11.us:                                    ; preds = %for.body11.us.preheader, %for.body11.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body11.us ], [ 1, %for.body11.us.preheader ]
  %arrayidx15.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %2, i64 %indvars.iv2, i64 %indvars.iv
  %38 = load double, double* %arrayidx15.us, align 8
  %arrayidx21.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv6, i64 %indvars.iv2, i64 %indvars.iv
  %39 = load double, double* %arrayidx21.us, align 8
  %mul.us = fmul double %39, 2.000000e+00
  %sub22.us = fsub double %38, %mul.us
  %arrayidx29.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %3, i64 %indvars.iv2, i64 %indvars.iv
  %40 = load double, double* %arrayidx29.us, align 8
  %add30.us = fadd double %40, %sub22.us
  %mul31.us = fmul double %add30.us, 1.250000e-01
  %arrayidx38.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv6, i64 %indvars.iv.next3, i64 %indvars.iv
  %41 = load double, double* %arrayidx38.us, align 8
  %sub46.us = fsub double %41, %mul.us
  %arrayidx53.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv6, i64 %5, i64 %indvars.iv
  %42 = load double, double* %arrayidx53.us, align 8
  %add54.us = fadd double %sub46.us, %42
  %mul55.us = fmul double %add54.us, 1.250000e-01
  %add56.us = fadd double %mul31.us, %mul55.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx63.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv6, i64 %indvars.iv2, i64 %indvars.iv.next
  %43 = load double, double* %arrayidx63.us, align 8
  %sub71.us = fsub double %43, %mul.us
  %44 = add nsw i64 %indvars.iv, -1
  %arrayidx78.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv6, i64 %indvars.iv2, i64 %44
  %45 = load double, double* %arrayidx78.us, align 8
  %add79.us = fadd double %sub71.us, %45
  %mul80.us = fmul double %add79.us, 1.250000e-01
  %add81.us = fadd double %add56.us, %mul80.us
  %add88.us = fadd double %39, %add81.us
  %arrayidx94.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv6, i64 %indvars.iv2, i64 %indvars.iv
  store double %add88.us, double* %arrayidx94.us, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %for.end.us.loopexit, label %for.body11.us, !llvm.loop !9

for.end.us.loopexit:                              ; preds = %for.body11.us
  br label %for.end.us

for.end.us.loopexit55:                            ; preds = %vector.body16
  br label %for.end.us

for.end.us:                                       ; preds = %for.end.us.loopexit55, %for.end.us.loopexit
  %exitcond5 = icmp eq i64 %indvars.iv.next3, 119
  %indvar.next24 = add nuw nsw i64 %indvar23, 1
  br i1 %exitcond5, label %for.end97, label %vector.memcheck37

for.end97:                                        ; preds = %for.end.us
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next7, 119
  %indvar.next22 = add nuw nsw i64 %indvar21, 1
  br i1 %exitcond10, label %for.cond105.preheader.preheader, label %for.cond8.preheader.lr.ph

for.cond105.preheader.preheader:                  ; preds = %for.end97
  br label %for.cond105.preheader

for.cond105.preheader:                            ; preds = %for.cond105.preheader.preheader, %for.end205
  %indvar = phi i64 [ %indvar.next, %for.end205 ], [ 0, %for.cond105.preheader.preheader ]
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %for.end205 ], [ 1, %for.cond105.preheader.preheader ]
  %46 = add nuw nsw i64 %indvar, 1
  %47 = add nuw nsw i64 %indvar, 2
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %48 = add nsw i64 %indvars.iv19, -1
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %for.end202, %for.cond105.preheader
  %indvar1 = phi i64 [ 0, %for.cond105.preheader ], [ %indvar.next2, %for.end202 ]
  %indvars.iv15 = phi i64 [ 1, %for.cond105.preheader ], [ %indvars.iv.next16, %for.end202 ]
  %49 = add nuw nsw i64 %indvar1, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %46, i64 %49, i64 1
  %scevgep4 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %46, i64 %49, i64 119
  %scevgep6 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvar, i64 %49, i64 1
  %scevgep8 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %47, i64 %49, i64 119
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %50 = add nsw i64 %indvars.iv15, -1
  %bound0 = icmp ult double* %scevgep, %scevgep8
  %bound1 = icmp ult double* %scevgep6, %scevgep4
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.body112.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

for.body112.preheader:                            ; preds = %vector.memcheck
  br label %for.body112

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %51 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv.next20, i64 %indvars.iv15, i64 %offset.idx
  %52 = bitcast double* %51 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %52, align 8, !alias.scope !10
  %53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv19, i64 %indvars.iv15, i64 %offset.idx
  %54 = bitcast double* %53 to <2 x double>*
  %wide.load10 = load <2 x double>, <2 x double>* %54, align 8, !alias.scope !10
  %55 = fmul <2 x double> %wide.load10, <double 2.000000e+00, double 2.000000e+00>
  %56 = fsub <2 x double> %wide.load, %55
  %57 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %48, i64 %indvars.iv15, i64 %offset.idx
  %58 = bitcast double* %57 to <2 x double>*
  %wide.load11 = load <2 x double>, <2 x double>* %58, align 8, !alias.scope !10
  %59 = fadd <2 x double> %wide.load11, %56
  %60 = fmul <2 x double> %59, <double 1.250000e-01, double 1.250000e-01>
  %61 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv19, i64 %indvars.iv.next16, i64 %offset.idx
  %62 = bitcast double* %61 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %62, align 8, !alias.scope !10
  %63 = fsub <2 x double> %wide.load12, %55
  %64 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv19, i64 %50, i64 %offset.idx
  %65 = bitcast double* %64 to <2 x double>*
  %wide.load13 = load <2 x double>, <2 x double>* %65, align 8, !alias.scope !10
  %66 = fadd <2 x double> %63, %wide.load13
  %67 = fmul <2 x double> %66, <double 1.250000e-01, double 1.250000e-01>
  %68 = fadd <2 x double> %60, %67
  %69 = add nuw nsw i64 %offset.idx, 1
  %70 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv19, i64 %indvars.iv15, i64 %69
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load14 = load <2 x double>, <2 x double>* %71, align 8, !alias.scope !10
  %72 = fsub <2 x double> %wide.load14, %55
  %73 = add nsw i64 %offset.idx, -1
  %74 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv19, i64 %indvars.iv15, i64 %73
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load15 = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !10
  %76 = fadd <2 x double> %72, %wide.load15
  %77 = fmul <2 x double> %76, <double 1.250000e-01, double 1.250000e-01>
  %78 = fadd <2 x double> %68, %77
  %79 = fadd <2 x double> %wide.load10, %78
  %80 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv19, i64 %indvars.iv15, i64 %offset.idx
  %81 = bitcast double* %80 to <2 x double>*
  store <2 x double> %79, <2 x double>* %81, align 8, !alias.scope !13, !noalias !10
  %index.next = add nuw nsw i64 %index, 2
  %82 = icmp eq i64 %index.next, 118
  br i1 %82, label %for.end202.loopexit54, label %vector.body, !llvm.loop !15

for.body112:                                      ; preds = %for.body112.preheader, %for.body112
  %indvars.iv11 = phi i64 [ %indvars.iv.next12, %for.body112 ], [ 1, %for.body112.preheader ]
  %arrayidx119 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv.next20, i64 %indvars.iv15, i64 %indvars.iv11
  %83 = load double, double* %arrayidx119, align 8
  %arrayidx125 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv19, i64 %indvars.iv15, i64 %indvars.iv11
  %84 = load double, double* %arrayidx125, align 8
  %mul126 = fmul double %84, 2.000000e+00
  %sub127 = fsub double %83, %mul126
  %arrayidx134 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %48, i64 %indvars.iv15, i64 %indvars.iv11
  %85 = load double, double* %arrayidx134, align 8
  %add135 = fadd double %85, %sub127
  %mul136 = fmul double %add135, 1.250000e-01
  %arrayidx143 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv19, i64 %indvars.iv.next16, i64 %indvars.iv11
  %86 = load double, double* %arrayidx143, align 8
  %sub151 = fsub double %86, %mul126
  %arrayidx158 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv19, i64 %50, i64 %indvars.iv11
  %87 = load double, double* %arrayidx158, align 8
  %add159 = fadd double %sub151, %87
  %mul160 = fmul double %add159, 1.250000e-01
  %add161 = fadd double %mul136, %mul160
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %arrayidx168 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv19, i64 %indvars.iv15, i64 %indvars.iv.next12
  %88 = load double, double* %arrayidx168, align 8
  %sub176 = fsub double %88, %mul126
  %89 = add nsw i64 %indvars.iv11, -1
  %arrayidx183 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv19, i64 %indvars.iv15, i64 %89
  %90 = load double, double* %arrayidx183, align 8
  %add184 = fadd double %sub176, %90
  %mul185 = fmul double %add184, 1.250000e-01
  %add186 = fadd double %add161, %mul185
  %add193 = fadd double %84, %add186
  %arrayidx199 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv19, i64 %indvars.iv15, i64 %indvars.iv11
  store double %add193, double* %arrayidx199, align 8
  %exitcond14 = icmp eq i64 %indvars.iv.next12, 119
  br i1 %exitcond14, label %for.end202.loopexit, label %for.body112, !llvm.loop !16

for.end202.loopexit:                              ; preds = %for.body112
  br label %for.end202

for.end202.loopexit54:                            ; preds = %vector.body
  br label %for.end202

for.end202:                                       ; preds = %for.end202.loopexit54, %for.end202.loopexit
  %exitcond18 = icmp eq i64 %indvars.iv.next16, 119
  %indvar.next2 = add nuw nsw i64 %indvar1, 1
  br i1 %exitcond18, label %for.end205, label %vector.memcheck

for.end205:                                       ; preds = %for.end202
  %exitcond22 = icmp eq i64 %indvars.iv.next20, 119
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %exitcond22, label %for.end208, label %for.cond105.preheader

for.end208:                                       ; preds = %for.end205
  %inc210 = add nuw nsw i32 %inc21018, 1
  %exitcond23 = icmp eq i32 %inc210, 501
  br i1 %exitcond23, label %for.end211, label %for.cond4.preheader.preheader

for.end211:                                       ; preds = %for.end208
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([120 x [120 x double]]* nocapture readonly %A) unnamed_addr #0 {
for.cond2.preheader.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.end20, %for.cond2.preheader.preheader
  %indvars.iv15 = phi i64 [ 0, %for.cond2.preheader.preheader ], [ %indvars.iv.next16, %for.end20 ]
  %3 = mul nuw nsw i64 %indvars.iv15, 120
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.end, %for.cond2.preheader
  %indvars.iv10 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next11, %for.end ]
  %4 = add nuw nsw i64 %indvars.iv10, %3
  %5 = mul nuw nsw i64 %4, 120
  br label %for.body7

for.body7:                                        ; preds = %if.end, %for.cond5.preheader
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader ], [ %indvars.iv.next, %if.end ]
  %6 = add nuw nsw i64 %indvars.iv, %5
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
  %arrayidx16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv15, i64 %indvars.iv10, i64 %indvars.iv
  %10 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %for.end, label %for.body7

for.end:                                          ; preds = %if.end
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next11, 120
  br i1 %exitcond14, label %for.end20, label %for.cond5.preheader

for.end20:                                        ; preds = %for.end
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, 120
  br i1 %exitcond18, label %for.end23, label %for.cond2.preheader

for.end23:                                        ; preds = %for.end20
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
