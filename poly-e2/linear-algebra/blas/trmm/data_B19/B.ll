; ModuleID = 'A.ll'
source_filename = "trmm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) #0 {
entry:
  %alpha = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1000 x double]*
  %arraydecay2 = bitcast i8* %call1 to [1200 x double]*
  call void @init_array(i32 1000, i32 1200, double* nonnull %alpha, [1000 x double]* %arraydecay, [1200 x double]* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %arraydecay3 = bitcast i8* %call to [1000 x double]*
  %arraydecay4 = bitcast i8* %call1 to [1200 x double]*
  tail call void @kernel_trmm(i32 1000, i32 1200, double %0, [1000 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %1, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call void @print_array(i32 1000, i32 1200, [1200 x double]* %arraydecay4)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32 %m, i32 %n, double* nocapture %alpha, [1000 x double]* %A, [1200 x double]* %B) #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  br i1 true, label %for.cond1.preheader.lr.ph, label %for.end29

for.cond1.preheader.lr.ph:                        ; preds = %entry
  br i1 true, label %for.cond1.preheader.us.preheader, label %for.cond1.preheader.preheader

for.cond1.preheader.preheader:                    ; preds = %for.cond1.preheader.lr.ph
  br label %for.cond1.preheader

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.inc27.us
  %indvars.iv23 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next24, %for.inc27.us ]
  %indvar = phi i32 [ 0, %for.cond1.preheader.us.preheader ], [ %indvar.next, %for.inc27.us ]
  %indvars.iv14 = phi i32 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next15, %for.inc27.us ]
  %cmp23.us = icmp sgt i64 %indvars.iv23, 0
  br i1 %cmp23.us, label %for.inc.lr.ph.us, label %for.end.us

for.inc.lr.ph.us:                                 ; preds = %for.cond1.preheader.us
  %xtraiter = and i32 %indvar, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.us.prol.loopexit, label %for.inc.us.prol

for.inc.us.prol:                                  ; preds = %for.inc.lr.ph.us
  %0 = trunc i64 %indvars.iv23 to i32
  %rem.us.prol = srem i32 %0, 1000
  %conv.us.prol = sitofp i32 %rem.us.prol to double
  %div.us.prol = fdiv double %conv.us.prol, 1.000000e+03
  %arrayidx6.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv23, i64 0
  store double %div.us.prol, double* %arrayidx6.us.prol, align 8
  br label %for.inc.us.prol.loopexit

for.inc.us.prol.loopexit:                         ; preds = %for.inc.us.prol, %for.inc.lr.ph.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.us.prol ], [ 0, %for.inc.lr.ph.us ]
  %1 = icmp eq i32 %indvar, 1
  br i1 %1, label %for.end.us, label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %for.inc.us.prol.loopexit
  %wide.trip.count.1 = zext i32 %indvars.iv14 to i64
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us.preheader, %for.inc.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc.us ], [ %indvars.iv.unr.ph, %for.inc.us.preheader ]
  %2 = add nsw i64 %indvars.iv, %indvars.iv23
  %3 = trunc i64 %2 to i32
  %rem.us = srem i32 %3, 1000
  %conv.us = sitofp i32 %rem.us to double
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv23, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %4 = add nsw i64 %indvars.iv.next, %indvars.iv23
  %5 = trunc i64 %4 to i32
  %rem.us.1 = srem i32 %5, 1000
  %conv.us.1 = sitofp i32 %rem.us.1 to double
  %div.us.v.i0.1 = insertelement <2 x double> undef, double %conv.us, i32 0
  %div.us.v.i0.2 = insertelement <2 x double> %div.us.v.i0.1, double %conv.us.1, i32 1
  %div.us = fdiv <2 x double> %div.us.v.i0.2, <double 1.000000e+03, double 1.000000e+03>
  %6 = bitcast double* %arrayidx6.us to <2 x double>*
  store <2 x double> %div.us, <2 x double>* %6, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.end.us.loopexit, label %for.inc.us

for.end.us.loopexit:                              ; preds = %for.inc.us
  br label %for.end.us

for.end.us:                                       ; preds = %for.end.us.loopexit, %for.inc.us.prol.loopexit, %for.cond1.preheader.us
  %arrayidx10.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv23, i64 %indvars.iv23
  store double 1.000000e+00, double* %arrayidx10.us, align 8
  %7 = trunc i64 %indvars.iv23 to i32
  %sub.us = add i32 %7, 1200
  br i1 true, label %for.inc24.us.prol.loopexit, label %for.inc24.us.prol

for.inc24.us.prol:                                ; preds = %for.end.us
  %rem16.us.prol = srem i32 %sub.us, 1200
  %conv17.us.prol = sitofp i32 %rem16.us.prol to double
  %div19.us.prol = fdiv double %conv17.us.prol, 1.200000e+03
  %arrayidx23.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv23, i64 0
  store double %div19.us.prol, double* %arrayidx23.us.prol, align 8
  br label %for.inc24.us.prol.loopexit

for.inc24.us.prol.loopexit:                       ; preds = %for.inc24.us.prol, %for.end.us
  %indvars.iv16.unr.ph = phi i64 [ 1, %for.inc24.us.prol ], [ 0, %for.end.us ]
  br i1 false, label %for.inc27.us, label %for.inc24.us.preheader

for.inc24.us.preheader:                           ; preds = %for.inc24.us.prol.loopexit
  br label %for.inc24.us

for.inc24.us:                                     ; preds = %for.inc24.us.preheader, %for.inc24.us
  %indvars.iv16 = phi i64 [ %indvars.iv.next17.1, %for.inc24.us ], [ %indvars.iv16.unr.ph, %for.inc24.us.preheader ]
  %8 = trunc i64 %indvars.iv16 to i32
  %add15.us = sub i32 %sub.us, %8
  %rem16.us = srem i32 %add15.us, 1200
  %conv17.us = sitofp i32 %rem16.us to double
  %arrayidx23.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv23, i64 %indvars.iv16
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %9 = trunc i64 %indvars.iv.next17 to i32
  %add15.us.1 = sub i32 %sub.us, %9
  %rem16.us.1 = srem i32 %add15.us.1, 1200
  %conv17.us.1 = sitofp i32 %rem16.us.1 to double
  %div19.us.v.i0.1 = insertelement <2 x double> undef, double %conv17.us, i32 0
  %div19.us.v.i0.2 = insertelement <2 x double> %div19.us.v.i0.1, double %conv17.us.1, i32 1
  %div19.us = fdiv <2 x double> %div19.us.v.i0.2, <double 1.200000e+03, double 1.200000e+03>
  %10 = bitcast double* %arrayidx23.us to <2 x double>*
  store <2 x double> %div19.us, <2 x double>* %10, align 8
  %indvars.iv.next17.1 = add nsw i64 %indvars.iv16, 2
  %exitcond.122 = icmp eq i64 %indvars.iv.next17.1, 1200
  br i1 %exitcond.122, label %for.inc27.us.loopexit, label %for.inc24.us

for.inc27.us.loopexit:                            ; preds = %for.inc24.us
  br label %for.inc27.us

for.inc27.us:                                     ; preds = %for.inc27.us.loopexit, %for.inc24.us.prol.loopexit
  %indvars.iv.next24 = add nsw i64 %indvars.iv23, 1
  %indvars.iv.next15 = add i32 %indvars.iv14, 1
  %cmp.us = icmp slt i64 %indvars.iv.next24, 1000
  %indvar.next = add i32 %indvar, 1
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.cond.for.end29_crit_edge.loopexit

for.cond1.preheader:                              ; preds = %for.cond1.preheader.preheader, %for.end
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %for.end ], [ 0, %for.cond1.preheader.preheader ]
  %indvar31 = phi i32 [ %indvar.next32, %for.end ], [ 0, %for.cond1.preheader.preheader ]
  %indvars.iv28 = phi i32 [ %indvars.iv.next29, %for.end ], [ 0, %for.cond1.preheader.preheader ]
  %cmp23 = icmp sgt i64 %indvars.iv37, 0
  br i1 %cmp23, label %for.inc.lr.ph, label %for.end

for.inc.lr.ph:                                    ; preds = %for.cond1.preheader
  %xtraiter33 = and i32 %indvar31, 1
  %lcmp.mod34 = icmp eq i32 %xtraiter33, 0
  br i1 %lcmp.mod34, label %for.inc.prol.loopexit, label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.lr.ph
  %11 = trunc i64 %indvars.iv37 to i32
  %rem.prol = srem i32 %11, 1000
  %conv.prol = sitofp i32 %rem.prol to double
  %div.prol = fdiv double %conv.prol, 1.000000e+03
  %arrayidx6.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv37, i64 0
  store double %div.prol, double* %arrayidx6.prol, align 8
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol, %for.inc.lr.ph
  %indvars.iv25.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.lr.ph ]
  %12 = icmp eq i32 %indvar31, 1
  br i1 %12, label %for.end, label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.inc.prol.loopexit
  %wide.trip.count30.1 = zext i32 %indvars.iv28 to i64
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %indvars.iv25 = phi i64 [ %indvars.iv.next26.1, %for.inc ], [ %indvars.iv25.unr.ph, %for.inc.preheader ]
  %13 = add nsw i64 %indvars.iv25, %indvars.iv37
  %14 = trunc i64 %13 to i32
  %rem = srem i32 %14, 1000
  %conv = sitofp i32 %rem to double
  %arrayidx6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv25
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %15 = add nsw i64 %indvars.iv.next26, %indvars.iv37
  %16 = trunc i64 %15 to i32
  %rem.1 = srem i32 %16, 1000
  %conv.1 = sitofp i32 %rem.1 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 1.000000e+03, double 1.000000e+03>
  %17 = bitcast double* %arrayidx6 to <2 x double>*
  store <2 x double> %div, <2 x double>* %17, align 8
  %indvars.iv.next26.1 = add nsw i64 %indvars.iv25, 2
  %exitcond.136 = icmp eq i64 %indvars.iv.next26.1, %wide.trip.count30.1
  br i1 %exitcond.136, label %for.end.loopexit, label %for.inc

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.inc.prol.loopexit, %for.cond1.preheader
  %arrayidx10 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv37
  store double 1.000000e+00, double* %arrayidx10, align 8
  %indvars.iv.next38 = add nsw i64 %indvars.iv37, 1
  %indvars.iv.next29 = add i32 %indvars.iv28, 1
  %cmp = icmp slt i64 %indvars.iv.next38, 1000
  %indvar.next32 = add i32 %indvar31, 1
  br i1 %cmp, label %for.cond1.preheader, label %for.cond.for.end29_crit_edge.loopexit41

for.cond.for.end29_crit_edge.loopexit:            ; preds = %for.inc27.us
  br label %for.cond.for.end29_crit_edge

for.cond.for.end29_crit_edge.loopexit41:          ; preds = %for.end
  br label %for.cond.for.end29_crit_edge

for.cond.for.end29_crit_edge:                     ; preds = %for.cond.for.end29_crit_edge.loopexit41, %for.cond.for.end29_crit_edge.loopexit
  br label %for.end29

for.end29:                                        ; preds = %for.cond.for.end29_crit_edge, %entry
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_trmm(i32 %m, i32 %n, double %alpha, [1000 x double]* %A, [1200 x double]* %B) #2 {
entry:
  br i1 true, label %for.cond1.preheader.lr.ph, label %for.end32

for.cond1.preheader.lr.ph:                        ; preds = %entry
  br i1 true, label %for.cond1.preheader.us.preheader, label %for.cond.for.end32_crit_edge.loopexit48

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %0 = insertelement <2 x double> undef, double %alpha, i32 0
  %mul22.us37.v.i0.2 = shufflevector <2 x double> %0, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.inc30.us
  %indvars.iv64 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next65, %for.inc30.us ]
  %indvar = phi i32 [ 0, %for.cond1.preheader.us.preheader ], [ %indvar.next, %for.inc30.us ]
  %indvars.iv50 = phi i64 [ 1, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next51.pre-phi, %for.inc30.us ]
  %indvars.iv.next65 = add nsw i64 %indvars.iv64, 1
  %cmp54.us = icmp slt i64 %indvars.iv.next65, 1000
  br i1 %cmp54.us, label %for.cond4.preheader.us.us.preheader, label %for.cond4.preheader.us15.preheader

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.us
  %1 = sub i32 1001, %indvar
  %xtraiter58 = and i32 %1, 1
  %lcmp.mod59 = icmp eq i32 %xtraiter58, 0
  %2 = icmp eq i32 998, %indvar
  %arrayidx8.us.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv50, i64 %indvars.iv64
  %indvars.iv.next53.prol = add nsw i64 %indvars.iv50, 1
  br label %for.cond4.preheader.us.us

for.cond4.preheader.us15.preheader:               ; preds = %for.cond1.preheader.us
  br i1 true, label %for.cond4.preheader.us15.prol.loopexit, label %for.cond4.preheader.us15.prol.preheader

for.cond4.preheader.us15.prol.preheader:          ; preds = %for.cond4.preheader.us15.preheader
  br label %for.cond4.preheader.us15.prol

for.cond4.preheader.us15.prol:                    ; preds = %for.cond4.preheader.us15.prol.preheader, %for.cond4.preheader.us15.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.cond4.preheader.us15.prol ], [ 0, %for.cond4.preheader.us15.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.cond4.preheader.us15.prol ], [ 0, %for.cond4.preheader.us15.prol.preheader ]
  %arrayidx21.us36.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv64, i64 %indvars.iv.prol
  %3 = load double, double* %arrayidx21.us36.prol, align 8
  %mul22.us37.prol = fmul double %3, %alpha
  store double %mul22.us37.prol, double* %arrayidx21.us36.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.cond4.preheader.us15.prol.loopexit.loopexit, label %for.cond4.preheader.us15.prol, !llvm.loop !1

for.cond4.preheader.us15.prol.loopexit.loopexit:  ; preds = %for.cond4.preheader.us15.prol
  br label %for.cond4.preheader.us15.prol.loopexit

for.cond4.preheader.us15.prol.loopexit:           ; preds = %for.cond4.preheader.us15.prol.loopexit.loopexit, %for.cond4.preheader.us15.preheader
  %indvars.iv.unr = phi i64 [ 0, %for.cond4.preheader.us15.preheader ], [ %indvars.iv.next.prol, %for.cond4.preheader.us15.prol.loopexit.loopexit ]
  br i1 false, label %for.inc30.us.loopexit47, label %for.cond4.preheader.us15.preheader70

for.cond4.preheader.us15.preheader70:             ; preds = %for.cond4.preheader.us15.prol.loopexit
  %4 = sub i64 1196, %indvars.iv.unr
  %5 = lshr i64 %4, 2
  %6 = and i64 %5, 1
  %lcmp.mod74 = icmp eq i64 %6, 0
  br i1 %lcmp.mod74, label %for.cond4.preheader.us15.prol.preheader71, label %for.cond4.preheader.us15.prol.loopexit72.unr-lcssa

for.cond4.preheader.us15.prol.preheader71:        ; preds = %for.cond4.preheader.us15.preheader70
  br label %for.cond4.preheader.us15.prol75

for.cond4.preheader.us15.prol75:                  ; preds = %for.cond4.preheader.us15.prol.preheader71
  %arrayidx21.us36.prol77 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv64, i64 %indvars.iv.unr
  %7 = bitcast double* %arrayidx21.us36.prol77 to <2 x double>*
  %8 = load <2 x double>, <2 x double>* %7, align 8
  %mul22.us37.prol78 = fmul <2 x double> %mul22.us37.v.i0.2, %8
  store <2 x double> %mul22.us37.prol78, <2 x double>* %7, align 8
  %indvars.iv.next.1.prol = add nsw i64 %indvars.iv.unr, 2
  %arrayidx21.us36.2.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv64, i64 %indvars.iv.next.1.prol
  %9 = bitcast double* %arrayidx21.us36.2.prol to <2 x double>*
  %10 = load <2 x double>, <2 x double>* %9, align 8
  %mul22.us37.2.prol = fmul <2 x double> %mul22.us37.v.i0.2, %10
  store <2 x double> %mul22.us37.2.prol, <2 x double>* %9, align 8
  %indvars.iv.next.3.prol = add nsw i64 %indvars.iv.unr, 4
  br label %for.cond4.preheader.us15.prol.loopexit72.unr-lcssa

for.cond4.preheader.us15.prol.loopexit72.unr-lcssa: ; preds = %for.cond4.preheader.us15.preheader70, %for.cond4.preheader.us15.prol75
  %indvars.iv.unr79.ph = phi i64 [ %indvars.iv.next.3.prol, %for.cond4.preheader.us15.prol75 ], [ %indvars.iv.unr, %for.cond4.preheader.us15.preheader70 ]
  br label %for.cond4.preheader.us15.prol.loopexit72

for.cond4.preheader.us15.prol.loopexit72:         ; preds = %for.cond4.preheader.us15.prol.loopexit72.unr-lcssa
  %11 = icmp eq i64 %5, 0
  br i1 %11, label %for.inc30.us.loopexit47.loopexit, label %for.cond4.preheader.us15.preheader70.new

for.cond4.preheader.us15.preheader70.new:         ; preds = %for.cond4.preheader.us15.prol.loopexit72
  br label %for.cond4.preheader.us15

for.cond4.preheader.us15:                         ; preds = %for.cond4.preheader.us15, %for.cond4.preheader.us15.preheader70.new
  %indvars.iv = phi i64 [ %indvars.iv.unr79.ph, %for.cond4.preheader.us15.preheader70.new ], [ %indvars.iv.next.3.1, %for.cond4.preheader.us15 ]
  %arrayidx21.us36 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv64, i64 %indvars.iv
  %12 = bitcast double* %arrayidx21.us36 to <2 x double>*
  %13 = load <2 x double>, <2 x double>* %12, align 8
  %mul22.us37 = fmul <2 x double> %mul22.us37.v.i0.2, %13
  store <2 x double> %mul22.us37, <2 x double>* %12, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx21.us36.2 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv64, i64 %indvars.iv.next.1
  %14 = bitcast double* %arrayidx21.us36.2 to <2 x double>*
  %15 = load <2 x double>, <2 x double>* %14, align 8
  %mul22.us37.2 = fmul <2 x double> %mul22.us37.v.i0.2, %15
  store <2 x double> %mul22.us37.2, <2 x double>* %14, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %arrayidx21.us36.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv64, i64 %indvars.iv.next.3
  %16 = bitcast double* %arrayidx21.us36.1 to <2 x double>*
  %17 = load <2 x double>, <2 x double>* %16, align 8
  %mul22.us37.1 = fmul <2 x double> %mul22.us37.v.i0.2, %17
  store <2 x double> %mul22.us37.1, <2 x double>* %16, align 8
  %indvars.iv.next.1.1 = add nsw i64 %indvars.iv, 6
  %arrayidx21.us36.2.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv64, i64 %indvars.iv.next.1.1
  %18 = bitcast double* %arrayidx21.us36.2.1 to <2 x double>*
  %19 = load <2 x double>, <2 x double>* %18, align 8
  %mul22.us37.2.1 = fmul <2 x double> %mul22.us37.v.i0.2, %19
  store <2 x double> %mul22.us37.2.1, <2 x double>* %18, align 8
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next.3.1, 1200
  br i1 %exitcond.3.1, label %for.inc30.us.loopexit47.loopexit.unr-lcssa, label %for.cond4.preheader.us15

for.inc30.us.loopexit47.loopexit.unr-lcssa:       ; preds = %for.cond4.preheader.us15
  br label %for.inc30.us.loopexit47.loopexit

for.inc30.us.loopexit47.loopexit:                 ; preds = %for.cond4.preheader.us15.prol.loopexit72, %for.inc30.us.loopexit47.loopexit.unr-lcssa
  br label %for.inc30.us.loopexit47

for.inc30.us.loopexit47:                          ; preds = %for.inc30.us.loopexit47.loopexit, %for.cond4.preheader.us15.prol.loopexit
  %.pre69 = add nsw i64 %indvars.iv50, 1
  br label %for.inc30.us

for.inc30.us.loopexit:                            ; preds = %for.inc27.us.us
  br label %for.inc30.us

for.inc30.us:                                     ; preds = %for.inc30.us.loopexit, %for.inc30.us.loopexit47
  %indvars.iv.next51.pre-phi = phi i64 [ %.pre69, %for.inc30.us.loopexit47 ], [ %indvars.iv.next53.prol, %for.inc30.us.loopexit ]
  %indvar.next = add i32 %indvar, 1
  br i1 %cmp54.us, label %for.cond1.preheader.us, label %for.cond.for.end32_crit_edge.loopexit

for.cond4.preheader.us.us:                        ; preds = %for.cond4.preheader.us.us.preheader, %for.inc27.us.us
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %for.inc27.us.us ], [ 0, %for.cond4.preheader.us.us.preheader ]
  %arrayidx16.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv64, i64 %indvars.iv61
  br i1 %lcmp.mod59, label %for.inc.us.us.prol.loopexit, label %for.inc.us.us.prol

for.inc.us.us.prol:                               ; preds = %for.cond4.preheader.us.us
  %20 = load double, double* %arrayidx8.us.us.prol, align 8
  %arrayidx12.us.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv50, i64 %indvars.iv61
  %21 = load double, double* %arrayidx12.us.us.prol, align 8
  %mul.us.us.prol = fmul double %20, %21
  %22 = load double, double* %arrayidx16.us.us, align 8
  %add17.us.us.prol = fadd double %mul.us.us.prol, %22
  store double %add17.us.us.prol, double* %arrayidx16.us.us, align 8
  br label %for.inc.us.us.prol.loopexit

for.inc.us.us.prol.loopexit:                      ; preds = %for.inc.us.us.prol, %for.cond4.preheader.us.us
  %indvars.iv52.unr.ph = phi i64 [ %indvars.iv.next53.prol, %for.inc.us.us.prol ], [ %indvars.iv50, %for.cond4.preheader.us.us ]
  br i1 %2, label %for.inc.us.us.prol.loopexit.for.inc27.us.us_crit_edge, label %for.inc.us.us.prol.loopexit.for.inc.us.us_crit_edge

for.inc.us.us.prol.loopexit.for.inc27.us.us_crit_edge: ; preds = %for.inc.us.us.prol.loopexit
  %.pre68 = load double, double* %arrayidx16.us.us, align 8
  br label %for.inc27.us.us

for.inc.us.us.prol.loopexit.for.inc.us.us_crit_edge: ; preds = %for.inc.us.us.prol.loopexit
  %.pre = load double, double* %arrayidx16.us.us, align 8
  br label %for.inc.us.us

for.inc27.us.us.loopexit:                         ; preds = %for.inc.us.us
  br label %for.inc27.us.us

for.inc27.us.us:                                  ; preds = %for.inc27.us.us.loopexit, %for.inc.us.us.prol.loopexit.for.inc27.us.us_crit_edge
  %23 = phi double [ %.pre68, %for.inc.us.us.prol.loopexit.for.inc27.us.us_crit_edge ], [ %add17.us.us.1, %for.inc27.us.us.loopexit ]
  %mul22.us.us = fmul double %23, %alpha
  store double %mul22.us.us, double* %arrayidx16.us.us, align 8
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond = icmp eq i64 %indvars.iv.next62, 1200
  br i1 %exitcond, label %for.inc30.us.loopexit, label %for.cond4.preheader.us.us

for.inc.us.us:                                    ; preds = %for.inc.us.us.prol.loopexit.for.inc.us.us_crit_edge, %for.inc.us.us
  %24 = phi double [ %add17.us.us.1, %for.inc.us.us ], [ %.pre, %for.inc.us.us.prol.loopexit.for.inc.us.us_crit_edge ]
  %indvars.iv52 = phi i64 [ %indvars.iv.next53.1, %for.inc.us.us ], [ %indvars.iv52.unr.ph, %for.inc.us.us.prol.loopexit.for.inc.us.us_crit_edge ]
  %arrayidx8.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv52, i64 %indvars.iv64
  %25 = load double, double* %arrayidx8.us.us, align 8
  %arrayidx12.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv52, i64 %indvars.iv61
  %26 = load double, double* %arrayidx12.us.us, align 8
  %mul.us.us = fmul double %25, %26
  %add17.us.us = fadd double %mul.us.us, %24
  store double %add17.us.us, double* %arrayidx16.us.us, align 8
  %indvars.iv.next53 = add nsw i64 %indvars.iv52, 1
  %arrayidx8.us.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next53, i64 %indvars.iv64
  %27 = load double, double* %arrayidx8.us.us.1, align 8
  %arrayidx12.us.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv.next53, i64 %indvars.iv61
  %28 = load double, double* %arrayidx12.us.us.1, align 8
  %mul.us.us.1 = fmul double %27, %28
  %add17.us.us.1 = fadd double %mul.us.us.1, %add17.us.us
  store double %add17.us.us.1, double* %arrayidx16.us.us, align 8
  %indvars.iv.next53.1 = add nsw i64 %indvars.iv52, 2
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next53.1 to i32
  %exitcond.1 = icmp eq i32 %lftr.wideiv.1, 1000
  br i1 %exitcond.1, label %for.inc27.us.us.loopexit, label %for.inc.us.us

for.cond.for.end32_crit_edge.loopexit:            ; preds = %for.inc30.us
  br label %for.cond.for.end32_crit_edge

for.cond.for.end32_crit_edge.loopexit48:          ; preds = %for.cond1.preheader.lr.ph
  br label %for.cond.for.end32_crit_edge

for.cond.for.end32_crit_edge:                     ; preds = %for.cond.for.end32_crit_edge.loopexit48, %for.cond.for.end32_crit_edge.loopexit
  br label %for.end32

for.end32:                                        ; preds = %for.cond.for.end32_crit_edge, %entry
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %m, i32 %n, [1200 x double]* %B) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %for.cond2.preheader.lr.ph, label %for.end12

for.cond2.preheader.lr.ph:                        ; preds = %entry
  br i1 true, label %for.cond2.preheader.us.preheader, label %for.cond.for.end12_crit_edge.loopexit7

for.cond2.preheader.us.preheader:                 ; preds = %for.cond2.preheader.lr.ph
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.preheader.us.preheader, %for.inc10.us
  %indvars.iv10 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next11, %for.inc10.us ]
  %3 = mul nsw i64 1000, %indvars.iv10
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc.us ], [ 0, %for.cond2.preheader.us ]
  %4 = add nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc.us

for.inc.us:                                       ; preds = %if.then.us, %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv10, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.inc10.us, label %for.body4.us

for.inc10.us:                                     ; preds = %for.inc.us
  %indvars.iv.next11 = add nsw i64 %indvars.iv10, 1
  %cmp.us = icmp slt i64 %indvars.iv.next11, 1000
  br i1 %cmp.us, label %for.cond2.preheader.us, label %for.cond.for.end12_crit_edge.loopexit

for.cond.for.end12_crit_edge.loopexit:            ; preds = %for.inc10.us
  br label %for.cond.for.end12_crit_edge

for.cond.for.end12_crit_edge.loopexit7:           ; preds = %for.cond2.preheader.lr.ph
  br label %for.cond.for.end12_crit_edge

for.cond.for.end12_crit_edge:                     ; preds = %for.cond.for.end12_crit_edge.loopexit7, %for.cond.for.end12_crit_edge.loopexit
  br label %for.end12

for.end12:                                        ; preds = %for.cond.for.end12_crit_edge, %entry
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
