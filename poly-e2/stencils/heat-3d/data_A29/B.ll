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
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc22, %entry
  %indvars.iv8 = phi i64 [ 0, %entry ], [ %indvars.iv.next9, %for.inc22 ]
  %0 = add nuw nsw i64 %indvars.iv8, 120
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.inc19, %for.cond1.preheader
  %indvars.iv5 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next6, %for.inc19 ]
  %1 = add nuw nsw i64 %0, %indvars.iv5
  br label %for.body6

for.body6:                                        ; preds = %for.body6, %for.cond4.preheader
  %indvars.iv = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next.1, %for.body6 ]
  %2 = sub nuw nsw i64 %1, %indvars.iv
  %3 = trunc i64 %2 to i32
  %conv = sitofp i32 %3 to double
  %arrayidx12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv8, i64 %indvars.iv5, i64 %indvars.iv
  %arrayidx18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv8, i64 %indvars.iv5, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %4 = sub nuw nsw i64 %1, %indvars.iv.next
  %5 = trunc i64 %4 to i32
  %conv.1 = sitofp i32 %5 to double
  %mul.v.i0.1 = insertelement <2 x double> undef, double %conv, i32 0
  %mul.v.i0.2 = insertelement <2 x double> %mul.v.i0.1, double %conv.1, i32 1
  %mul = fmul <2 x double> %mul.v.i0.2, <double 1.000000e+01, double 1.000000e+01>
  %div = fdiv <2 x double> %mul, <double 1.200000e+02, double 1.200000e+02>
  %6 = bitcast double* %arrayidx12 to <2 x double>*
  %7 = bitcast double* %arrayidx18 to <2 x double>*
  store <2 x double> %div, <2 x double>* %6, align 8
  store <2 x double> %div, <2 x double>* %7, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %for.inc19, label %for.body6

for.inc19:                                        ; preds = %for.body6
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next6, 120
  br i1 %exitcond, label %for.inc22, label %for.cond4.preheader

for.inc22:                                        ; preds = %for.inc19
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next9, 120
  br i1 %exitcond11, label %for.end24, label %for.cond1.preheader

for.end24:                                        ; preds = %for.inc22
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d([120 x [120 x double]]* nocapture %A, [120 x [120 x double]]* nocapture %B) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc209, %entry
  %t.07 = phi i32 [ 1, %entry ], [ %inc210, %for.inc209 ]
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.inc98, %for.cond1.preheader
  %indvar21 = phi i64 [ 0, %for.cond1.preheader ], [ %0, %for.inc98 ]
  %indvars.iv13 = phi i64 [ 1, %for.cond1.preheader ], [ %indvars.iv.next14, %for.inc98 ]
  %0 = add nuw nsw i64 %indvar21, 1
  %1 = add nuw nsw i64 %indvar21, 2
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %2 = add nsw i64 %indvars.iv13, -1
  br label %vector.memcheck37

vector.memcheck37:                                ; preds = %for.inc95, %for.cond4.preheader
  %indvar23 = phi i64 [ 0, %for.cond4.preheader ], [ %3, %for.inc95 ]
  %indvars.iv9 = phi i64 [ 1, %for.cond4.preheader ], [ %indvars.iv.next10, %for.inc95 ]
  %3 = add nuw nsw i64 %indvar23, 1
  %scevgep25 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %0, i64 %3, i64 1
  %scevgep27 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %0, i64 %3, i64 119
  %scevgep29 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvar21, i64 %3, i64 1
  %scevgep31 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %1, i64 %3, i64 119
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %4 = add nsw i64 %indvars.iv9, -1
  %bound033 = icmp ult double* %scevgep25, %scevgep31
  %bound134 = icmp ult double* %scevgep29, %scevgep27
  %memcheck.conflict36 = and i1 %bound033, %bound134
  br i1 %memcheck.conflict36, label %for.body11.preheader, label %vector.body16.preheader

vector.body16.preheader:                          ; preds = %vector.memcheck37
  br label %vector.body16

for.body11.preheader:                             ; preds = %vector.memcheck37
  br label %for.body11

vector.body16:                                    ; preds = %vector.body16, %vector.body16.preheader
  %index39 = phi i64 [ 0, %vector.body16.preheader ], [ %index.next40, %vector.body16 ]
  %offset.idx43 = or i64 %index39, 1
  %5 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv.next14, i64 %indvars.iv9, i64 %offset.idx43
  %6 = bitcast double* %5 to <2 x double>*
  %wide.load47 = load <2 x double>, <2 x double>* %6, align 8, !alias.scope !1
  %7 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv13, i64 %indvars.iv9, i64 %offset.idx43
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load48 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !1
  %9 = fmul <2 x double> %wide.load48, <double 2.000000e+00, double 2.000000e+00>
  %10 = fsub <2 x double> %wide.load47, %9
  %11 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %2, i64 %indvars.iv9, i64 %offset.idx43
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load49 = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !1
  %13 = fadd <2 x double> %wide.load49, %10
  %14 = fmul <2 x double> %13, <double 1.250000e-01, double 1.250000e-01>
  %15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv13, i64 %indvars.iv.next10, i64 %offset.idx43
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load50 = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !1
  %17 = fsub <2 x double> %wide.load50, %9
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv13, i64 %4, i64 %offset.idx43
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load51 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !1
  %20 = fadd <2 x double> %17, %wide.load51
  %21 = fmul <2 x double> %20, <double 1.250000e-01, double 1.250000e-01>
  %22 = fadd <2 x double> %14, %21
  %23 = add nuw nsw i64 %offset.idx43, 1
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv13, i64 %indvars.iv9, i64 %23
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !1
  %26 = fsub <2 x double> %wide.load52, %9
  %27 = add nsw i64 %offset.idx43, -1
  %28 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv13, i64 %indvars.iv9, i64 %27
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !1
  %30 = fadd <2 x double> %26, %wide.load53
  %31 = fmul <2 x double> %30, <double 1.250000e-01, double 1.250000e-01>
  %32 = fadd <2 x double> %22, %31
  %33 = fadd <2 x double> %wide.load48, %32
  %34 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv13, i64 %indvars.iv9, i64 %offset.idx43
  %35 = bitcast double* %34 to <2 x double>*
  store <2 x double> %33, <2 x double>* %35, align 8, !alias.scope !4, !noalias !1
  %index.next40 = add nuw nsw i64 %index39, 2
  %36 = icmp eq i64 %index.next40, 118
  br i1 %36, label %for.inc95.loopexit57, label %vector.body16, !llvm.loop !6

for.body11:                                       ; preds = %for.body11, %for.body11.preheader
  %indvars.iv = phi i64 [ 1, %for.body11.preheader ], [ %indvars.iv.next, %for.body11 ]
  %arrayidx15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv.next14, i64 %indvars.iv9, i64 %indvars.iv
  %37 = load double, double* %arrayidx15, align 8
  %arrayidx21 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv13, i64 %indvars.iv9, i64 %indvars.iv
  %38 = load double, double* %arrayidx21, align 8
  %mul = fmul double %38, 2.000000e+00
  %arrayidx29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %2, i64 %indvars.iv9, i64 %indvars.iv
  %39 = load double, double* %arrayidx29, align 8
  %arrayidx38 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv13, i64 %indvars.iv.next10, i64 %indvars.iv
  %40 = load double, double* %arrayidx38, align 8
  %41 = insertelement <2 x double> undef, double %mul, i32 0
  %sub22.v.i1.2 = shufflevector <2 x double> %41, <2 x double> undef, <2 x i32> zeroinitializer
  %sub22.v.i0.1 = insertelement <2 x double> undef, double %37, i32 0
  %sub22.v.i0.2 = insertelement <2 x double> %sub22.v.i0.1, double %40, i32 1
  %sub22 = fsub <2 x double> %sub22.v.i0.2, %sub22.v.i1.2
  %sub22.v.r1 = extractelement <2 x double> %sub22, i32 0
  %arrayidx53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv13, i64 %4, i64 %indvars.iv
  %42 = load double, double* %arrayidx53, align 8
  %add30.v.i1.1 = insertelement <2 x double> undef, double %sub22.v.r1, i32 0
  %add30.v.i1.2 = insertelement <2 x double> %add30.v.i1.1, double %42, i32 1
  %add30.v.i0.1 = insertelement <2 x double> undef, double %39, i32 0
  %add30.v.i0.2 = shufflevector <2 x double> %add30.v.i0.1, <2 x double> %sub22, <2 x i32> <i32 0, i32 3>
  %add30 = fadd <2 x double> %add30.v.i0.2, %add30.v.i1.2
  %mul31 = fmul <2 x double> %add30, <double 1.250000e-01, double 1.250000e-01>
  %mul31.v.r1 = extractelement <2 x double> %mul31, i32 0
  %mul31.v.r2 = extractelement <2 x double> %mul31, i32 1
  %add56 = fadd double %mul31.v.r1, %mul31.v.r2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx63 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv13, i64 %indvars.iv9, i64 %indvars.iv.next
  %43 = load double, double* %arrayidx63, align 8
  %sub71 = fsub double %43, %mul
  %44 = add nsw i64 %indvars.iv, -1
  %arrayidx78 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv13, i64 %indvars.iv9, i64 %44
  %45 = load double, double* %arrayidx78, align 8
  %add79 = fadd double %sub71, %45
  %mul80 = fmul double %add79, 1.250000e-01
  %add81 = fadd double %add56, %mul80
  %add88 = fadd double %38, %add81
  %arrayidx94 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv13, i64 %indvars.iv9, i64 %indvars.iv
  store double %add88, double* %arrayidx94, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %for.inc95.loopexit, label %for.body11, !llvm.loop !9

for.inc95.loopexit:                               ; preds = %for.body11
  br label %for.inc95

for.inc95.loopexit57:                             ; preds = %vector.body16
  br label %for.inc95

for.inc95:                                        ; preds = %for.inc95.loopexit57, %for.inc95.loopexit
  %exitcond12 = icmp eq i64 %indvars.iv.next10, 119
  br i1 %exitcond12, label %for.inc98, label %vector.memcheck37

for.inc98:                                        ; preds = %for.inc95
  %exitcond16 = icmp eq i64 %indvars.iv.next14, 119
  br i1 %exitcond16, label %for.cond105.preheader.preheader, label %for.cond4.preheader

for.cond105.preheader.preheader:                  ; preds = %for.inc98
  br label %for.cond105.preheader

for.cond105.preheader:                            ; preds = %for.inc206, %for.cond105.preheader.preheader
  %indvar = phi i64 [ 0, %for.cond105.preheader.preheader ], [ %46, %for.inc206 ]
  %indvars.iv25 = phi i64 [ 1, %for.cond105.preheader.preheader ], [ %indvars.iv.next26, %for.inc206 ]
  %46 = add nuw nsw i64 %indvar, 1
  %47 = add nuw nsw i64 %indvar, 2
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %48 = add nsw i64 %indvars.iv25, -1
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %for.inc203, %for.cond105.preheader
  %indvar1 = phi i64 [ 0, %for.cond105.preheader ], [ %49, %for.inc203 ]
  %indvars.iv21 = phi i64 [ 1, %for.cond105.preheader ], [ %indvars.iv.next22, %for.inc203 ]
  %49 = add nuw nsw i64 %indvar1, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %46, i64 %49, i64 1
  %scevgep4 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %46, i64 %49, i64 119
  %scevgep6 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvar, i64 %49, i64 1
  %scevgep8 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %47, i64 %49, i64 119
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %50 = add nsw i64 %indvars.iv21, -1
  %bound0 = icmp ult double* %scevgep, %scevgep8
  %bound1 = icmp ult double* %scevgep6, %scevgep4
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.body112.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

for.body112.preheader:                            ; preds = %vector.memcheck
  br label %for.body112

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next, %vector.body ]
  %offset.idx = or i64 %index, 1
  %51 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv.next26, i64 %indvars.iv21, i64 %offset.idx
  %52 = bitcast double* %51 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %52, align 8, !alias.scope !10
  %53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv25, i64 %indvars.iv21, i64 %offset.idx
  %54 = bitcast double* %53 to <2 x double>*
  %wide.load10 = load <2 x double>, <2 x double>* %54, align 8, !alias.scope !10
  %55 = fmul <2 x double> %wide.load10, <double 2.000000e+00, double 2.000000e+00>
  %56 = fsub <2 x double> %wide.load, %55
  %57 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %48, i64 %indvars.iv21, i64 %offset.idx
  %58 = bitcast double* %57 to <2 x double>*
  %wide.load11 = load <2 x double>, <2 x double>* %58, align 8, !alias.scope !10
  %59 = fadd <2 x double> %wide.load11, %56
  %60 = fmul <2 x double> %59, <double 1.250000e-01, double 1.250000e-01>
  %61 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv25, i64 %indvars.iv.next22, i64 %offset.idx
  %62 = bitcast double* %61 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %62, align 8, !alias.scope !10
  %63 = fsub <2 x double> %wide.load12, %55
  %64 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv25, i64 %50, i64 %offset.idx
  %65 = bitcast double* %64 to <2 x double>*
  %wide.load13 = load <2 x double>, <2 x double>* %65, align 8, !alias.scope !10
  %66 = fadd <2 x double> %63, %wide.load13
  %67 = fmul <2 x double> %66, <double 1.250000e-01, double 1.250000e-01>
  %68 = fadd <2 x double> %60, %67
  %69 = add nuw nsw i64 %offset.idx, 1
  %70 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv25, i64 %indvars.iv21, i64 %69
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load14 = load <2 x double>, <2 x double>* %71, align 8, !alias.scope !10
  %72 = fsub <2 x double> %wide.load14, %55
  %73 = add nsw i64 %offset.idx, -1
  %74 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv25, i64 %indvars.iv21, i64 %73
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load15 = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !10
  %76 = fadd <2 x double> %72, %wide.load15
  %77 = fmul <2 x double> %76, <double 1.250000e-01, double 1.250000e-01>
  %78 = fadd <2 x double> %68, %77
  %79 = fadd <2 x double> %wide.load10, %78
  %80 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv25, i64 %indvars.iv21, i64 %offset.idx
  %81 = bitcast double* %80 to <2 x double>*
  store <2 x double> %79, <2 x double>* %81, align 8, !alias.scope !13, !noalias !10
  %index.next = add nuw nsw i64 %index, 2
  %82 = icmp eq i64 %index.next, 118
  br i1 %82, label %for.inc203.loopexit56, label %vector.body, !llvm.loop !15

for.body112:                                      ; preds = %for.body112, %for.body112.preheader
  %indvars.iv17 = phi i64 [ 1, %for.body112.preheader ], [ %indvars.iv.next18, %for.body112 ]
  %arrayidx119 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv.next26, i64 %indvars.iv21, i64 %indvars.iv17
  %83 = load double, double* %arrayidx119, align 8
  %arrayidx125 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv25, i64 %indvars.iv21, i64 %indvars.iv17
  %84 = load double, double* %arrayidx125, align 8
  %mul126 = fmul double %84, 2.000000e+00
  %arrayidx134 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %48, i64 %indvars.iv21, i64 %indvars.iv17
  %85 = load double, double* %arrayidx134, align 8
  %arrayidx143 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv25, i64 %indvars.iv.next22, i64 %indvars.iv17
  %86 = load double, double* %arrayidx143, align 8
  %87 = insertelement <2 x double> undef, double %mul126, i32 0
  %sub127.v.i1.2 = shufflevector <2 x double> %87, <2 x double> undef, <2 x i32> zeroinitializer
  %sub127.v.i0.1 = insertelement <2 x double> undef, double %83, i32 0
  %sub127.v.i0.2 = insertelement <2 x double> %sub127.v.i0.1, double %86, i32 1
  %sub127 = fsub <2 x double> %sub127.v.i0.2, %sub127.v.i1.2
  %sub127.v.r1 = extractelement <2 x double> %sub127, i32 0
  %arrayidx158 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv25, i64 %50, i64 %indvars.iv17
  %88 = load double, double* %arrayidx158, align 8
  %add135.v.i1.1 = insertelement <2 x double> undef, double %sub127.v.r1, i32 0
  %add135.v.i1.2 = insertelement <2 x double> %add135.v.i1.1, double %88, i32 1
  %add135.v.i0.1 = insertelement <2 x double> undef, double %85, i32 0
  %add135.v.i0.2 = shufflevector <2 x double> %add135.v.i0.1, <2 x double> %sub127, <2 x i32> <i32 0, i32 3>
  %add135 = fadd <2 x double> %add135.v.i0.2, %add135.v.i1.2
  %mul136 = fmul <2 x double> %add135, <double 1.250000e-01, double 1.250000e-01>
  %mul136.v.r1 = extractelement <2 x double> %mul136, i32 0
  %mul136.v.r2 = extractelement <2 x double> %mul136, i32 1
  %add161 = fadd double %mul136.v.r1, %mul136.v.r2
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %arrayidx168 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv25, i64 %indvars.iv21, i64 %indvars.iv.next18
  %89 = load double, double* %arrayidx168, align 8
  %sub176 = fsub double %89, %mul126
  %90 = add nsw i64 %indvars.iv17, -1
  %arrayidx183 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv25, i64 %indvars.iv21, i64 %90
  %91 = load double, double* %arrayidx183, align 8
  %add184 = fadd double %sub176, %91
  %mul185 = fmul double %add184, 1.250000e-01
  %add186 = fadd double %add161, %mul185
  %add193 = fadd double %84, %add186
  %arrayidx199 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv25, i64 %indvars.iv21, i64 %indvars.iv17
  store double %add193, double* %arrayidx199, align 8
  %exitcond20 = icmp eq i64 %indvars.iv.next18, 119
  br i1 %exitcond20, label %for.inc203.loopexit, label %for.body112, !llvm.loop !16

for.inc203.loopexit:                              ; preds = %for.body112
  br label %for.inc203

for.inc203.loopexit56:                            ; preds = %vector.body
  br label %for.inc203

for.inc203:                                       ; preds = %for.inc203.loopexit56, %for.inc203.loopexit
  %exitcond24 = icmp eq i64 %indvars.iv.next22, 119
  br i1 %exitcond24, label %for.inc206, label %vector.memcheck

for.inc206:                                       ; preds = %for.inc203
  %exitcond28 = icmp eq i64 %indvars.iv.next26, 119
  br i1 %exitcond28, label %for.inc209, label %for.cond105.preheader

for.inc209:                                       ; preds = %for.inc206
  %inc210 = add nuw nsw i32 %t.07, 1
  %exitcond29 = icmp eq i32 %inc210, 501
  br i1 %exitcond29, label %for.end211, label %for.cond1.preheader

for.end211:                                       ; preds = %for.inc209
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([120 x [120 x double]]* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc21, %entry
  %indvars.iv11 = phi i64 [ 0, %entry ], [ %indvars.iv.next12, %for.inc21 ]
  %3 = mul nuw nsw i64 %indvars.iv11, 120
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.inc18, %for.cond2.preheader
  %indvars.iv6 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next7, %for.inc18 ]
  %4 = add nuw nsw i64 %indvars.iv6, %3
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
  %arrayidx16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv11, i64 %indvars.iv6, i64 %indvars.iv
  %10 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %for.inc18, label %for.body7

for.inc18:                                        ; preds = %if.end
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next7, 120
  br i1 %exitcond10, label %for.inc21, label %for.cond5.preheader

for.inc21:                                        ; preds = %for.inc18
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next12, 120
  br i1 %exitcond14, label %for.end23, label %for.cond2.preheader

for.end23:                                        ; preds = %for.inc21
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %12) #5
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
