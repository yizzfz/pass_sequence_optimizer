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
  tail call fastcc void @kernel_heat_3d(i32 500, i32 120, [120 x [120 x double]]* %arraydecay, [120 x [120 x double]]* %arraydecay2)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %entry.if.end_crit_edge

entry.if.end_crit_edge:                           ; preds = %entry
  br label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %land.lhs.true.if.end_crit_edge

land.lhs.true.if.end_crit_edge:                   ; preds = %land.lhs.true
  br label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true.if.end_crit_edge, %entry.if.end_crit_edge, %if.then
  tail call void @free(i8* %call) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, [120 x [120 x double]]* nocapture %A, [120 x [120 x double]]* nocapture %B) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end21.for.cond1.preheader_crit_edge, %entry
  %indvars.iv6 = phi i64 [ 0, %entry ], [ %indvars.iv.next7, %for.end21.for.cond1.preheader_crit_edge ]
  %0 = add nuw nsw i64 %indvars.iv6, 120
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.end.for.cond4.preheader_crit_edge, %for.cond1.preheader
  %indvars.iv2 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next3, %for.end.for.cond4.preheader_crit_edge ]
  %1 = add nuw nsw i64 %0, %indvars.iv2
  br label %for.body6

for.body6:                                        ; preds = %for.body6.for.body6_crit_edge, %for.cond4.preheader
  %indvars.iv = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next.1, %for.body6.for.body6_crit_edge ]
  %2 = sub nuw nsw i64 %1, %indvars.iv
  %3 = trunc i64 %2 to i32
  %conv = sitofp i32 %3 to double
  %arrayidx12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv6, i64 %indvars.iv2, i64 %indvars.iv
  %arrayidx18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv6, i64 %indvars.iv2, i64 %indvars.iv
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
  br i1 %exitcond.1, label %for.end, label %for.body6.for.body6_crit_edge

for.body6.for.body6_crit_edge:                    ; preds = %for.body6
  br label %for.body6

for.end:                                          ; preds = %for.body6
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next3, 120
  br i1 %exitcond5, label %for.end21, label %for.end.for.cond4.preheader_crit_edge

for.end.for.cond4.preheader_crit_edge:            ; preds = %for.end
  br label %for.cond4.preheader

for.end21:                                        ; preds = %for.end
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, 120
  br i1 %exitcond9, label %for.end24, label %for.end21.for.cond1.preheader_crit_edge

for.end21.for.cond1.preheader_crit_edge:          ; preds = %for.end21
  br label %for.cond1.preheader

for.end24:                                        ; preds = %for.end21
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32 %tsteps, i32 %n, [120 x [120 x double]]* nocapture %A, [120 x [120 x double]]* nocapture %B) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end208.for.cond1.preheader_crit_edge, %entry
  %storemerge2 = phi i32 [ 1, %entry ], [ %inc210, %for.end208.for.cond1.preheader_crit_edge ]
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.end97.for.cond4.preheader_crit_edge, %for.cond1.preheader
  %indvar45 = phi i64 [ %indvar.next46, %for.end97.for.cond4.preheader_crit_edge ], [ 0, %for.cond1.preheader ]
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %for.end97.for.cond4.preheader_crit_edge ], [ 1, %for.cond1.preheader ]
  %0 = add nuw nsw i64 %indvar45, 1
  %1 = add nuw nsw i64 %indvar45, 2
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %2 = add nsw i64 %indvars.iv8, -1
  br label %for.cond8.preheader

for.cond8.preheader:                              ; preds = %for.end.for.cond8.preheader_crit_edge, %for.cond4.preheader
  %indvar47 = phi i64 [ %indvar.next48, %for.end.for.cond8.preheader_crit_edge ], [ 0, %for.cond4.preheader ]
  %indvars.iv4 = phi i64 [ %indvars.iv.next5, %for.end.for.cond8.preheader_crit_edge ], [ 1, %for.cond4.preheader ]
  %3 = add nuw nsw i64 %indvar47, 1
  %scevgep49 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %0, i64 %3, i64 1
  %scevgep51 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %0, i64 %3, i64 119
  %scevgep53 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvar45, i64 %3, i64 1
  %scevgep55 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %1, i64 %3, i64 119
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %4 = add nsw i64 %indvars.iv4, -1
  %bound057 = icmp ult double* %scevgep49, %scevgep55
  %bound158 = icmp ult double* %scevgep53, %scevgep51
  %memcheck.conflict60 = and i1 %bound057, %bound158
  br i1 %memcheck.conflict60, label %for.body11.preheader, label %vector.body40.preheader

vector.body40.preheader:                          ; preds = %for.cond8.preheader
  br label %vector.body40

for.body11.preheader:                             ; preds = %for.cond8.preheader
  br label %for.body11

vector.body40:                                    ; preds = %vector.body40.vector.body40_crit_edge, %vector.body40.preheader
  %index63 = phi i64 [ %index.next64, %vector.body40.vector.body40_crit_edge ], [ 0, %vector.body40.preheader ]
  %offset.idx67 = or i64 %index63, 1
  %5 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv.next9, i64 %indvars.iv4, i64 %offset.idx67
  %6 = bitcast double* %5 to <2 x double>*
  %wide.load71 = load <2 x double>, <2 x double>* %6, align 8, !alias.scope !1
  %7 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv8, i64 %indvars.iv4, i64 %offset.idx67
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load72 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !1
  %9 = fmul <2 x double> %wide.load72, <double 2.000000e+00, double 2.000000e+00>
  %10 = fsub <2 x double> %wide.load71, %9
  %11 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %2, i64 %indvars.iv4, i64 %offset.idx67
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load73 = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !1
  %13 = fadd <2 x double> %wide.load73, %10
  %14 = fmul <2 x double> %13, <double 1.250000e-01, double 1.250000e-01>
  %15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv8, i64 %indvars.iv.next5, i64 %offset.idx67
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load74 = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !1
  %17 = fsub <2 x double> %wide.load74, %9
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv8, i64 %4, i64 %offset.idx67
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load75 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !1
  %20 = fadd <2 x double> %17, %wide.load75
  %21 = fmul <2 x double> %20, <double 1.250000e-01, double 1.250000e-01>
  %22 = fadd <2 x double> %14, %21
  %23 = add nuw nsw i64 %offset.idx67, 1
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv8, i64 %indvars.iv4, i64 %23
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load76 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !1
  %26 = fsub <2 x double> %wide.load76, %9
  %27 = add nsw i64 %offset.idx67, -1
  %28 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv8, i64 %indvars.iv4, i64 %27
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load77 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !1
  %30 = fadd <2 x double> %26, %wide.load77
  %31 = fmul <2 x double> %30, <double 1.250000e-01, double 1.250000e-01>
  %32 = fadd <2 x double> %22, %31
  %33 = fadd <2 x double> %wide.load72, %32
  %34 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv8, i64 %indvars.iv4, i64 %offset.idx67
  %35 = bitcast double* %34 to <2 x double>*
  store <2 x double> %33, <2 x double>* %35, align 8, !alias.scope !4, !noalias !1
  %index.next64 = add nuw nsw i64 %index63, 2
  %36 = icmp eq i64 %index.next64, 118
  br i1 %36, label %for.end.loopexit79, label %vector.body40.vector.body40_crit_edge, !llvm.loop !6

vector.body40.vector.body40_crit_edge:            ; preds = %vector.body40
  br label %vector.body40

for.body11:                                       ; preds = %for.body11.for.body11_crit_edge, %for.body11.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body11.for.body11_crit_edge ], [ 1, %for.body11.preheader ]
  %arrayidx15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv.next9, i64 %indvars.iv4, i64 %indvars.iv
  %37 = load double, double* %arrayidx15, align 8
  %arrayidx21 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv8, i64 %indvars.iv4, i64 %indvars.iv
  %38 = load double, double* %arrayidx21, align 8
  %mul = fmul double %38, 2.000000e+00
  %arrayidx29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %2, i64 %indvars.iv4, i64 %indvars.iv
  %39 = load double, double* %arrayidx29, align 8
  %arrayidx38 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv8, i64 %indvars.iv.next5, i64 %indvars.iv
  %40 = load double, double* %arrayidx38, align 8
  %sub22.v.i1.1 = insertelement <2 x double> undef, double %mul, i32 0
  %sub22.v.i1.2 = insertelement <2 x double> %sub22.v.i1.1, double %mul, i32 1
  %sub22.v.i0.1 = insertelement <2 x double> undef, double %37, i32 0
  %sub22.v.i0.2 = insertelement <2 x double> %sub22.v.i0.1, double %40, i32 1
  %sub22 = fsub <2 x double> %sub22.v.i0.2, %sub22.v.i1.2
  %sub22.v.r1 = extractelement <2 x double> %sub22, i32 0
  %sub22.v.r2 = extractelement <2 x double> %sub22, i32 1
  %arrayidx53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv8, i64 %4, i64 %indvars.iv
  %41 = load double, double* %arrayidx53, align 8
  %add30.v.i1.1 = insertelement <2 x double> undef, double %sub22.v.r1, i32 0
  %add30.v.i1.2 = insertelement <2 x double> %add30.v.i1.1, double %41, i32 1
  %add30.v.i0.1 = insertelement <2 x double> undef, double %39, i32 0
  %add30.v.i0.2 = insertelement <2 x double> %add30.v.i0.1, double %sub22.v.r2, i32 1
  %add30 = fadd <2 x double> %add30.v.i0.2, %add30.v.i1.2
  %mul31 = fmul <2 x double> %add30, <double 1.250000e-01, double 1.250000e-01>
  %mul31.v.r1 = extractelement <2 x double> %mul31, i32 0
  %mul31.v.r2 = extractelement <2 x double> %mul31, i32 1
  %add56 = fadd double %mul31.v.r1, %mul31.v.r2
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx63 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv8, i64 %indvars.iv4, i64 %indvars.iv.next
  %42 = load double, double* %arrayidx63, align 8
  %sub71 = fsub double %42, %mul
  %43 = add nsw i64 %indvars.iv, -1
  %arrayidx78 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv8, i64 %indvars.iv4, i64 %43
  %44 = load double, double* %arrayidx78, align 8
  %add79 = fadd double %sub71, %44
  %mul80 = fmul double %add79, 1.250000e-01
  %add81 = fadd double %add56, %mul80
  %add88 = fadd double %38, %add81
  %arrayidx94 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv8, i64 %indvars.iv4, i64 %indvars.iv
  store double %add88, double* %arrayidx94, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %for.end.loopexit, label %for.body11.for.body11_crit_edge, !llvm.loop !9

for.body11.for.body11_crit_edge:                  ; preds = %for.body11
  br label %for.body11

for.end.loopexit:                                 ; preds = %for.body11
  br label %for.end

for.end.loopexit79:                               ; preds = %vector.body40
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit79, %for.end.loopexit
  %exitcond7 = icmp eq i64 %indvars.iv.next5, 119
  %indvar.next48 = add nuw nsw i64 %indvar47, 1
  br i1 %exitcond7, label %for.end97, label %for.end.for.cond8.preheader_crit_edge

for.end.for.cond8.preheader_crit_edge:            ; preds = %for.end
  br label %for.cond8.preheader

for.end97:                                        ; preds = %for.end
  %exitcond11 = icmp eq i64 %indvars.iv.next9, 119
  %indvar.next46 = add nuw nsw i64 %indvar45, 1
  br i1 %exitcond11, label %for.cond105.preheader.preheader, label %for.end97.for.cond4.preheader_crit_edge

for.end97.for.cond4.preheader_crit_edge:          ; preds = %for.end97
  br label %for.cond4.preheader

for.cond105.preheader.preheader:                  ; preds = %for.end97
  br label %for.cond105.preheader

for.cond105.preheader:                            ; preds = %for.end205.for.cond105.preheader_crit_edge, %for.cond105.preheader.preheader
  %indvar = phi i64 [ %indvar.next, %for.end205.for.cond105.preheader_crit_edge ], [ 0, %for.cond105.preheader.preheader ]
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %for.end205.for.cond105.preheader_crit_edge ], [ 1, %for.cond105.preheader.preheader ]
  %45 = add nuw nsw i64 %indvar, 1
  %46 = add nuw nsw i64 %indvar, 2
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %47 = add nsw i64 %indvars.iv20, -1
  br label %for.cond109.preheader

for.cond109.preheader:                            ; preds = %for.end202.for.cond109.preheader_crit_edge, %for.cond105.preheader
  %indvar25 = phi i64 [ %indvar.next26, %for.end202.for.cond109.preheader_crit_edge ], [ 0, %for.cond105.preheader ]
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %for.end202.for.cond109.preheader_crit_edge ], [ 1, %for.cond105.preheader ]
  %48 = add nuw nsw i64 %indvar25, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %45, i64 %48, i64 1
  %scevgep28 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %45, i64 %48, i64 119
  %scevgep30 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvar, i64 %48, i64 1
  %scevgep32 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %46, i64 %48, i64 119
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %49 = add nsw i64 %indvars.iv16, -1
  %bound0 = icmp ult double* %scevgep, %scevgep32
  %bound1 = icmp ult double* %scevgep30, %scevgep28
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.body112.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond109.preheader
  br label %vector.body

for.body112.preheader:                            ; preds = %for.cond109.preheader
  br label %for.body112

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %50 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv.next21, i64 %indvars.iv16, i64 %offset.idx
  %51 = bitcast double* %50 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %51, align 8, !alias.scope !10
  %52 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv20, i64 %indvars.iv16, i64 %offset.idx
  %53 = bitcast double* %52 to <2 x double>*
  %wide.load34 = load <2 x double>, <2 x double>* %53, align 8, !alias.scope !10
  %54 = fmul <2 x double> %wide.load34, <double 2.000000e+00, double 2.000000e+00>
  %55 = fsub <2 x double> %wide.load, %54
  %56 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %47, i64 %indvars.iv16, i64 %offset.idx
  %57 = bitcast double* %56 to <2 x double>*
  %wide.load35 = load <2 x double>, <2 x double>* %57, align 8, !alias.scope !10
  %58 = fadd <2 x double> %wide.load35, %55
  %59 = fmul <2 x double> %58, <double 1.250000e-01, double 1.250000e-01>
  %60 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv20, i64 %indvars.iv.next17, i64 %offset.idx
  %61 = bitcast double* %60 to <2 x double>*
  %wide.load36 = load <2 x double>, <2 x double>* %61, align 8, !alias.scope !10
  %62 = fsub <2 x double> %wide.load36, %54
  %63 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv20, i64 %49, i64 %offset.idx
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load37 = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !10
  %65 = fadd <2 x double> %62, %wide.load37
  %66 = fmul <2 x double> %65, <double 1.250000e-01, double 1.250000e-01>
  %67 = fadd <2 x double> %59, %66
  %68 = add nuw nsw i64 %offset.idx, 1
  %69 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv20, i64 %indvars.iv16, i64 %68
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load38 = load <2 x double>, <2 x double>* %70, align 8, !alias.scope !10
  %71 = fsub <2 x double> %wide.load38, %54
  %72 = add nsw i64 %offset.idx, -1
  %73 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv20, i64 %indvars.iv16, i64 %72
  %74 = bitcast double* %73 to <2 x double>*
  %wide.load39 = load <2 x double>, <2 x double>* %74, align 8, !alias.scope !10
  %75 = fadd <2 x double> %71, %wide.load39
  %76 = fmul <2 x double> %75, <double 1.250000e-01, double 1.250000e-01>
  %77 = fadd <2 x double> %67, %76
  %78 = fadd <2 x double> %wide.load34, %77
  %79 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv20, i64 %indvars.iv16, i64 %offset.idx
  %80 = bitcast double* %79 to <2 x double>*
  store <2 x double> %78, <2 x double>* %80, align 8, !alias.scope !13, !noalias !10
  %index.next = add nuw nsw i64 %index, 2
  %81 = icmp eq i64 %index.next, 118
  br i1 %81, label %for.end202.loopexit78, label %vector.body.vector.body_crit_edge, !llvm.loop !15

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

for.body112:                                      ; preds = %for.body112.for.body112_crit_edge, %for.body112.preheader
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %for.body112.for.body112_crit_edge ], [ 1, %for.body112.preheader ]
  %arrayidx119 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv.next21, i64 %indvars.iv16, i64 %indvars.iv12
  %82 = load double, double* %arrayidx119, align 8
  %arrayidx125 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv20, i64 %indvars.iv16, i64 %indvars.iv12
  %83 = load double, double* %arrayidx125, align 8
  %mul126 = fmul double %83, 2.000000e+00
  %arrayidx134 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %47, i64 %indvars.iv16, i64 %indvars.iv12
  %84 = load double, double* %arrayidx134, align 8
  %arrayidx143 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv20, i64 %indvars.iv.next17, i64 %indvars.iv12
  %85 = load double, double* %arrayidx143, align 8
  %sub127.v.i1.1 = insertelement <2 x double> undef, double %mul126, i32 0
  %sub127.v.i1.2 = insertelement <2 x double> %sub127.v.i1.1, double %mul126, i32 1
  %sub127.v.i0.1 = insertelement <2 x double> undef, double %82, i32 0
  %sub127.v.i0.2 = insertelement <2 x double> %sub127.v.i0.1, double %85, i32 1
  %sub127 = fsub <2 x double> %sub127.v.i0.2, %sub127.v.i1.2
  %sub127.v.r1 = extractelement <2 x double> %sub127, i32 0
  %sub127.v.r2 = extractelement <2 x double> %sub127, i32 1
  %arrayidx158 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv20, i64 %49, i64 %indvars.iv12
  %86 = load double, double* %arrayidx158, align 8
  %add135.v.i1.1 = insertelement <2 x double> undef, double %sub127.v.r1, i32 0
  %add135.v.i1.2 = insertelement <2 x double> %add135.v.i1.1, double %86, i32 1
  %add135.v.i0.1 = insertelement <2 x double> undef, double %84, i32 0
  %add135.v.i0.2 = insertelement <2 x double> %add135.v.i0.1, double %sub127.v.r2, i32 1
  %add135 = fadd <2 x double> %add135.v.i0.2, %add135.v.i1.2
  %mul136 = fmul <2 x double> %add135, <double 1.250000e-01, double 1.250000e-01>
  %mul136.v.r1 = extractelement <2 x double> %mul136, i32 0
  %mul136.v.r2 = extractelement <2 x double> %mul136, i32 1
  %add161 = fadd double %mul136.v.r1, %mul136.v.r2
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %arrayidx168 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv20, i64 %indvars.iv16, i64 %indvars.iv.next13
  %87 = load double, double* %arrayidx168, align 8
  %sub176 = fsub double %87, %mul126
  %88 = add nsw i64 %indvars.iv12, -1
  %arrayidx183 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv20, i64 %indvars.iv16, i64 %88
  %89 = load double, double* %arrayidx183, align 8
  %add184 = fadd double %sub176, %89
  %mul185 = fmul double %add184, 1.250000e-01
  %add186 = fadd double %add161, %mul185
  %add193 = fadd double %83, %add186
  %arrayidx199 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv20, i64 %indvars.iv16, i64 %indvars.iv12
  store double %add193, double* %arrayidx199, align 8
  %exitcond15 = icmp eq i64 %indvars.iv.next13, 119
  br i1 %exitcond15, label %for.end202.loopexit, label %for.body112.for.body112_crit_edge, !llvm.loop !16

for.body112.for.body112_crit_edge:                ; preds = %for.body112
  br label %for.body112

for.end202.loopexit:                              ; preds = %for.body112
  br label %for.end202

for.end202.loopexit78:                            ; preds = %vector.body
  br label %for.end202

for.end202:                                       ; preds = %for.end202.loopexit78, %for.end202.loopexit
  %exitcond19 = icmp eq i64 %indvars.iv.next17, 119
  %indvar.next26 = add nuw nsw i64 %indvar25, 1
  br i1 %exitcond19, label %for.end205, label %for.end202.for.cond109.preheader_crit_edge

for.end202.for.cond109.preheader_crit_edge:       ; preds = %for.end202
  br label %for.cond109.preheader

for.end205:                                       ; preds = %for.end202
  %exitcond23 = icmp eq i64 %indvars.iv.next21, 119
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %exitcond23, label %for.end208, label %for.end205.for.cond105.preheader_crit_edge

for.end205.for.cond105.preheader_crit_edge:       ; preds = %for.end205
  br label %for.cond105.preheader

for.end208:                                       ; preds = %for.end205
  %inc210 = add nuw nsw i32 %storemerge2, 1
  %exitcond24 = icmp eq i32 %inc210, 501
  br i1 %exitcond24, label %for.end211, label %for.end208.for.cond1.preheader_crit_edge

for.end208.for.cond1.preheader_crit_edge:         ; preds = %for.end208
  br label %for.cond1.preheader

for.end211:                                       ; preds = %for.end208
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
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.end20.for.cond2.preheader_crit_edge, %entry
  %indvars.iv8 = phi i64 [ 0, %entry ], [ %indvars.iv.next9, %for.end20.for.cond2.preheader_crit_edge ]
  %3 = mul nuw nsw i64 %indvars.iv8, 120
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.end.for.cond5.preheader_crit_edge, %for.cond2.preheader
  %indvars.iv3 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next4, %for.end.for.cond5.preheader_crit_edge ]
  %4 = add nuw nsw i64 %indvars.iv3, %3
  %5 = mul nuw nsw i64 %4, 120
  br label %for.body7

for.body7:                                        ; preds = %if.end.for.body7_crit_edge, %for.cond5.preheader
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader ], [ %indvars.iv.next, %if.end.for.body7_crit_edge ]
  %6 = add nuw nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %rem = srem i32 %7, 20
  %cmp11 = icmp eq i32 %rem, 0
  br i1 %cmp11, label %if.then, label %for.body7.if.end_crit_edge

for.body7.if.end_crit_edge:                       ; preds = %for.body7
  br label %if.end

if.then:                                          ; preds = %for.body7
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #5
  br label %if.end

if.end:                                           ; preds = %for.body7.if.end_crit_edge, %if.then
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv8, i64 %indvars.iv3, i64 %indvars.iv
  %10 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %for.end, label %if.end.for.body7_crit_edge

if.end.for.body7_crit_edge:                       ; preds = %if.end
  br label %for.body7

for.end:                                          ; preds = %if.end
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next4, 120
  br i1 %exitcond7, label %for.end20, label %for.end.for.cond5.preheader_crit_edge

for.end.for.cond5.preheader_crit_edge:            ; preds = %for.end
  br label %for.cond5.preheader

for.end20:                                        ; preds = %for.end
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next9, 120
  br i1 %exitcond11, label %for.end23, label %for.end20.for.cond2.preheader_crit_edge

for.end20.for.cond2.preheader_crit_edge:          ; preds = %for.end20
  br label %for.cond2.preheader

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
