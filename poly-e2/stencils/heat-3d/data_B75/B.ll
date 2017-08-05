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
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end21, %entry
  %indvars.iv7 = phi i64 [ 0, %entry ], [ %indvars.iv.next8, %for.end21 ]
  %0 = trunc i64 %indvars.iv7 to i32
  %sub = add i32 %0, 120
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.end, %for.cond1.preheader
  %indvars.iv4 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next5, %for.end ]
  %1 = trunc i64 %indvars.iv4 to i32
  %add = add i32 %sub, %1
  br label %for.body6

for.body6:                                        ; preds = %for.cond4.preheader, %for.body6
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body6 ], [ 0, %for.cond4.preheader ]
  %2 = trunc i64 %indvars.iv to i32
  %add7 = sub i32 %add, %2
  %conv = sitofp i32 %add7 to double
  %mul = fmul double %conv, 1.000000e+01
  %div = fdiv double %mul, 1.200000e+02
  %arrayidx12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv7, i64 %indvars.iv4, i64 %indvars.iv
  store double %div, double* %arrayidx12, align 8
  %arrayidx18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv7, i64 %indvars.iv4, i64 %indvars.iv
  store double %div, double* %arrayidx18, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %3 = trunc i64 %indvars.iv.next to i32
  %add7.1 = sub i32 %add, %3
  %conv.1 = sitofp i32 %add7.1 to double
  %mul.1 = fmul double %conv.1, 1.000000e+01
  %div.1 = fdiv double %mul.1, 1.200000e+02
  %arrayidx12.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv7, i64 %indvars.iv4, i64 %indvars.iv.next
  store double %div.1, double* %arrayidx12.1, align 8
  %arrayidx18.1 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv7, i64 %indvars.iv4, i64 %indvars.iv.next
  store double %div.1, double* %arrayidx18.1, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %for.end, label %for.body6

for.end:                                          ; preds = %for.body6
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond = icmp eq i64 %indvars.iv.next5, 120
  br i1 %exitcond, label %for.end21, label %for.cond4.preheader

for.end21:                                        ; preds = %for.end
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next8, 120
  br i1 %exitcond10, label %for.end24, label %for.cond1.preheader

for.end24:                                        ; preds = %for.end21
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32 %tsteps, i32 %n, [120 x [120 x double]]* nocapture %A, [120 x [120 x double]]* nocapture %B) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end208, %entry
  %storemerge8 = phi i32 [ 1, %entry ], [ %inc210, %for.end208 ]
  br label %for.cond8.preheader.lr.ph

for.cond8.preheader.lr.ph:                        ; preds = %for.end97, %for.cond1.preheader
  %indvars.iv84 = phi i64 [ 1, %for.cond1.preheader ], [ %indvars.iv.next85, %for.end97 ]
  %indvar51 = phi i64 [ 0, %for.cond1.preheader ], [ %indvar.next52, %for.end97 ]
  %0 = add nuw nsw i64 %indvar51, 1
  %1 = add nuw nsw i64 %indvar51, 2
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %2 = add nsw i64 %indvars.iv84, -1
  br label %for.cond8.preheader.us

for.cond8.preheader.us:                           ; preds = %for.end.us, %for.cond8.preheader.lr.ph
  %indvar53 = phi i64 [ %indvar.next54, %for.end.us ], [ 0, %for.cond8.preheader.lr.ph ]
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %for.end.us ], [ 1, %for.cond8.preheader.lr.ph ]
  %3 = add nuw nsw i64 %indvar53, 1
  %scevgep55 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %0, i64 %3, i64 1
  %scevgep57 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %0, i64 %3, i64 119
  %scevgep59 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvar51, i64 %3, i64 1
  %scevgep61 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %1, i64 %3, i64 119
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %4 = add nsw i64 %indvars.iv10, -1
  %bound063 = icmp ult double* %scevgep55, %scevgep61
  %bound164 = icmp ult double* %scevgep59, %scevgep57
  %memcheck.conflict66 = and i1 %bound063, %bound164
  br i1 %memcheck.conflict66, label %for.body11.us.preheader, label %vector.body46.preheader

vector.body46.preheader:                          ; preds = %for.cond8.preheader.us
  br label %vector.body46

for.body11.us.preheader:                          ; preds = %for.cond8.preheader.us
  br label %for.body11.us

vector.body46:                                    ; preds = %vector.body46.preheader, %vector.body46
  %index69 = phi i64 [ %index.next70, %vector.body46 ], [ 0, %vector.body46.preheader ]
  %offset.idx73 = or i64 %index69, 1
  %5 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv.next85, i64 %indvars.iv10, i64 %offset.idx73
  %6 = bitcast double* %5 to <2 x double>*
  %wide.load77 = load <2 x double>, <2 x double>* %6, align 8, !alias.scope !1
  %7 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv84, i64 %indvars.iv10, i64 %offset.idx73
  %8 = bitcast double* %7 to <2 x double>*
  %wide.load78 = load <2 x double>, <2 x double>* %8, align 8, !alias.scope !1
  %9 = fmul <2 x double> %wide.load78, <double 2.000000e+00, double 2.000000e+00>
  %10 = fsub <2 x double> %wide.load77, %9
  %11 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %2, i64 %indvars.iv10, i64 %offset.idx73
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load79 = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !1
  %13 = fadd <2 x double> %wide.load79, %10
  %14 = fmul <2 x double> %13, <double 1.250000e-01, double 1.250000e-01>
  %15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv84, i64 %indvars.iv.next11, i64 %offset.idx73
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load80 = load <2 x double>, <2 x double>* %16, align 8, !alias.scope !1
  %17 = fsub <2 x double> %wide.load80, %9
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv84, i64 %4, i64 %offset.idx73
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load81 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !1
  %20 = fadd <2 x double> %17, %wide.load81
  %21 = fmul <2 x double> %20, <double 1.250000e-01, double 1.250000e-01>
  %22 = fadd <2 x double> %14, %21
  %23 = add nuw nsw i64 %offset.idx73, 1
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv84, i64 %indvars.iv10, i64 %23
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load82 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !1
  %26 = fsub <2 x double> %wide.load82, %9
  %27 = add nsw i64 %offset.idx73, -1
  %28 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv84, i64 %indvars.iv10, i64 %27
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %29, align 8, !alias.scope !1
  %30 = fadd <2 x double> %26, %wide.load83
  %31 = fmul <2 x double> %30, <double 1.250000e-01, double 1.250000e-01>
  %32 = fadd <2 x double> %22, %31
  %33 = fadd <2 x double> %wide.load78, %32
  %34 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv84, i64 %indvars.iv10, i64 %offset.idx73
  %35 = bitcast double* %34 to <2 x double>*
  store <2 x double> %33, <2 x double>* %35, align 8, !alias.scope !4, !noalias !1
  %index.next70 = add nuw nsw i64 %index69, 2
  %36 = icmp eq i64 %index.next70, 118
  br i1 %36, label %for.end.us.loopexit89, label %vector.body46, !llvm.loop !6

for.body11.us:                                    ; preds = %for.body11.us.preheader, %for.body11.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body11.us ], [ 1, %for.body11.us.preheader ]
  %arrayidx15.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv.next85, i64 %indvars.iv10, i64 %indvars.iv
  %37 = load double, double* %arrayidx15.us, align 8
  %arrayidx21.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv84, i64 %indvars.iv10, i64 %indvars.iv
  %38 = load double, double* %arrayidx21.us, align 8
  %mul.us = fmul double %38, 2.000000e+00
  %sub22.us = fsub double %37, %mul.us
  %arrayidx29.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %2, i64 %indvars.iv10, i64 %indvars.iv
  %39 = load double, double* %arrayidx29.us, align 8
  %add30.us = fadd double %39, %sub22.us
  %mul31.us = fmul double %add30.us, 1.250000e-01
  %arrayidx38.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv84, i64 %indvars.iv.next11, i64 %indvars.iv
  %40 = load double, double* %arrayidx38.us, align 8
  %sub46.us = fsub double %40, %mul.us
  %arrayidx53.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv84, i64 %4, i64 %indvars.iv
  %41 = load double, double* %arrayidx53.us, align 8
  %add54.us = fadd double %sub46.us, %41
  %mul55.us = fmul double %add54.us, 1.250000e-01
  %add56.us = fadd double %mul31.us, %mul55.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx63.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv84, i64 %indvars.iv10, i64 %indvars.iv.next
  %42 = load double, double* %arrayidx63.us, align 8
  %sub71.us = fsub double %42, %mul.us
  %43 = add nsw i64 %indvars.iv, -1
  %arrayidx78.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv84, i64 %indvars.iv10, i64 %43
  %44 = load double, double* %arrayidx78.us, align 8
  %add79.us = fadd double %sub71.us, %44
  %mul80.us = fmul double %add79.us, 1.250000e-01
  %add81.us = fadd double %add56.us, %mul80.us
  %add88.us = fadd double %38, %add81.us
  %arrayidx94.us = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv84, i64 %indvars.iv10, i64 %indvars.iv
  store double %add88.us, double* %arrayidx94.us, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %for.end.us.loopexit, label %for.body11.us, !llvm.loop !9

for.end.us.loopexit:                              ; preds = %for.body11.us
  br label %for.end.us

for.end.us.loopexit89:                            ; preds = %vector.body46
  br label %for.end.us

for.end.us:                                       ; preds = %for.end.us.loopexit89, %for.end.us.loopexit
  %exitcond14 = icmp eq i64 %indvars.iv.next11, 119
  %indvar.next54 = add nuw nsw i64 %indvar53, 1
  br i1 %exitcond14, label %for.end97, label %for.cond8.preheader.us

for.end97:                                        ; preds = %for.end.us
  %indvar.next52 = add nuw nsw i64 %indvar51, 1
  %exitcond87 = icmp eq i64 %indvar.next52, 118
  br i1 %exitcond87, label %for.cond105.preheader.preheader, label %for.cond8.preheader.lr.ph

for.cond105.preheader.preheader:                  ; preds = %for.end97
  br label %for.cond105.preheader

for.cond105.preheader:                            ; preds = %for.cond105.preheader.preheader, %for.end205
  %indvar = phi i64 [ %indvar.next, %for.end205 ], [ 0, %for.cond105.preheader.preheader ]
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %for.end205 ], [ 1, %for.cond105.preheader.preheader ]
  %45 = add nuw nsw i64 %indvar, 1
  %46 = add nuw nsw i64 %indvar, 2
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %47 = add nsw i64 %indvars.iv25, -1
  br label %for.cond109.preheader

for.cond109.preheader:                            ; preds = %for.end202, %for.cond105.preheader
  %indvar31 = phi i64 [ %indvar.next32, %for.end202 ], [ 0, %for.cond105.preheader ]
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %for.end202 ], [ 1, %for.cond105.preheader ]
  %48 = add nuw nsw i64 %indvar31, 1
  %scevgep = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %45, i64 %48, i64 1
  %scevgep34 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %45, i64 %48, i64 119
  %scevgep36 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvar, i64 %48, i64 1
  %scevgep38 = getelementptr [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %46, i64 %48, i64 119
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %49 = add nsw i64 %indvars.iv20, -1
  %bound0 = icmp ult double* %scevgep, %scevgep38
  %bound1 = icmp ult double* %scevgep36, %scevgep34
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.body112.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %for.cond109.preheader
  br label %vector.body

for.body112.preheader:                            ; preds = %for.cond109.preheader
  br label %for.body112

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = or i64 %index, 1
  %50 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv.next26, i64 %indvars.iv20, i64 %offset.idx
  %51 = bitcast double* %50 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %51, align 8, !alias.scope !10
  %52 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv25, i64 %indvars.iv20, i64 %offset.idx
  %53 = bitcast double* %52 to <2 x double>*
  %wide.load40 = load <2 x double>, <2 x double>* %53, align 8, !alias.scope !10
  %54 = fmul <2 x double> %wide.load40, <double 2.000000e+00, double 2.000000e+00>
  %55 = fsub <2 x double> %wide.load, %54
  %56 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %47, i64 %indvars.iv20, i64 %offset.idx
  %57 = bitcast double* %56 to <2 x double>*
  %wide.load41 = load <2 x double>, <2 x double>* %57, align 8, !alias.scope !10
  %58 = fadd <2 x double> %wide.load41, %55
  %59 = fmul <2 x double> %58, <double 1.250000e-01, double 1.250000e-01>
  %60 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv25, i64 %indvars.iv.next21, i64 %offset.idx
  %61 = bitcast double* %60 to <2 x double>*
  %wide.load42 = load <2 x double>, <2 x double>* %61, align 8, !alias.scope !10
  %62 = fsub <2 x double> %wide.load42, %54
  %63 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv25, i64 %49, i64 %offset.idx
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load43 = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !10
  %65 = fadd <2 x double> %62, %wide.load43
  %66 = fmul <2 x double> %65, <double 1.250000e-01, double 1.250000e-01>
  %67 = fadd <2 x double> %59, %66
  %68 = add nuw nsw i64 %offset.idx, 1
  %69 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv25, i64 %indvars.iv20, i64 %68
  %70 = bitcast double* %69 to <2 x double>*
  %wide.load44 = load <2 x double>, <2 x double>* %70, align 8, !alias.scope !10
  %71 = fsub <2 x double> %wide.load44, %54
  %72 = add nsw i64 %offset.idx, -1
  %73 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv25, i64 %indvars.iv20, i64 %72
  %74 = bitcast double* %73 to <2 x double>*
  %wide.load45 = load <2 x double>, <2 x double>* %74, align 8, !alias.scope !10
  %75 = fadd <2 x double> %71, %wide.load45
  %76 = fmul <2 x double> %75, <double 1.250000e-01, double 1.250000e-01>
  %77 = fadd <2 x double> %67, %76
  %78 = fadd <2 x double> %wide.load40, %77
  %79 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv25, i64 %indvars.iv20, i64 %offset.idx
  %80 = bitcast double* %79 to <2 x double>*
  store <2 x double> %78, <2 x double>* %80, align 8, !alias.scope !13, !noalias !10
  %index.next = add nuw nsw i64 %index, 2
  %81 = icmp eq i64 %index.next, 118
  br i1 %81, label %for.end202.loopexit88, label %vector.body, !llvm.loop !15

for.body112:                                      ; preds = %for.body112.preheader, %for.body112
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %for.body112 ], [ 1, %for.body112.preheader ]
  %arrayidx119 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv.next26, i64 %indvars.iv20, i64 %indvars.iv15
  %82 = load double, double* %arrayidx119, align 8
  %arrayidx125 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv25, i64 %indvars.iv20, i64 %indvars.iv15
  %83 = load double, double* %arrayidx125, align 8
  %mul126 = fmul double %83, 2.000000e+00
  %sub127 = fsub double %82, %mul126
  %arrayidx134 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %47, i64 %indvars.iv20, i64 %indvars.iv15
  %84 = load double, double* %arrayidx134, align 8
  %add135 = fadd double %84, %sub127
  %mul136 = fmul double %add135, 1.250000e-01
  %arrayidx143 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv25, i64 %indvars.iv.next21, i64 %indvars.iv15
  %85 = load double, double* %arrayidx143, align 8
  %sub151 = fsub double %85, %mul126
  %arrayidx158 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv25, i64 %49, i64 %indvars.iv15
  %86 = load double, double* %arrayidx158, align 8
  %add159 = fadd double %sub151, %86
  %mul160 = fmul double %add159, 1.250000e-01
  %add161 = fadd double %mul136, %mul160
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %arrayidx168 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv25, i64 %indvars.iv20, i64 %indvars.iv.next16
  %87 = load double, double* %arrayidx168, align 8
  %sub176 = fsub double %87, %mul126
  %88 = add nsw i64 %indvars.iv15, -1
  %arrayidx183 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %B, i64 %indvars.iv25, i64 %indvars.iv20, i64 %88
  %89 = load double, double* %arrayidx183, align 8
  %add184 = fadd double %sub176, %89
  %mul185 = fmul double %add184, 1.250000e-01
  %add186 = fadd double %add161, %mul185
  %add193 = fadd double %83, %add186
  %arrayidx199 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv25, i64 %indvars.iv20, i64 %indvars.iv15
  store double %add193, double* %arrayidx199, align 8
  %exitcond19 = icmp eq i64 %indvars.iv.next16, 119
  br i1 %exitcond19, label %for.end202.loopexit, label %for.body112, !llvm.loop !16

for.end202.loopexit:                              ; preds = %for.body112
  br label %for.end202

for.end202.loopexit88:                            ; preds = %vector.body
  br label %for.end202

for.end202:                                       ; preds = %for.end202.loopexit88, %for.end202.loopexit
  %exitcond24 = icmp eq i64 %indvars.iv.next21, 119
  %indvar.next32 = add nuw nsw i64 %indvar31, 1
  br i1 %exitcond24, label %for.end205, label %for.cond109.preheader

for.end205:                                       ; preds = %for.end202
  %exitcond29 = icmp eq i64 %indvars.iv.next26, 119
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %exitcond29, label %for.end208, label %for.cond105.preheader

for.end208:                                       ; preds = %for.end205
  %inc210 = add nuw nsw i32 %storemerge8, 1
  %exitcond30 = icmp eq i32 %inc210, 501
  br i1 %exitcond30, label %for.end211, label %for.cond1.preheader

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

for.cond2.preheader:                              ; preds = %for.end20, %entry
  %indvars.iv10 = phi i64 [ 0, %entry ], [ %indvars.iv.next11, %for.end20 ]
  %3 = mul nuw nsw i64 %indvars.iv10, 120
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.end, %for.cond2.preheader
  %indvars.iv6 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next7, %for.end ]
  %mul81 = add nuw nsw i64 %indvars.iv6, %3
  %add = mul nuw nsw i64 %mul81, 120
  br label %for.body7

for.body7:                                        ; preds = %if.end, %for.cond5.preheader
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader ], [ %indvars.iv.next, %if.end ]
  %4 = add nuw nsw i64 %indvars.iv, %add
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp11 = icmp eq i32 %rem, 0
  br i1 %cmp11, label %if.then, label %if.end

if.then:                                          ; preds = %for.body7
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body7
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %A, i64 %indvars.iv10, i64 %indvars.iv6, i64 %indvars.iv
  %8 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %for.end, label %for.body7

for.end:                                          ; preds = %if.end
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, 120
  br i1 %exitcond9, label %for.end20, label %for.cond5.preheader

for.end20:                                        ; preds = %for.end
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next11, 120
  br i1 %exitcond14, label %for.end23, label %for.cond2.preheader

for.end23:                                        ; preds = %for.end20
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
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
