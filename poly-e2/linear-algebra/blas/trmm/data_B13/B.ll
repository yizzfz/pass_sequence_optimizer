; ModuleID = 'A.ll'
source_filename = "trmm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %arraydecay = bitcast i8* %call to [1000 x double]*
  %arraydecay2 = bitcast i8* %call1 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %alpha, [1000 x double]* %arraydecay, [1200 x double]* %arraydecay2)
  call void (...) @polybench_timer_start() #3
  %0 = load double, double* %alpha, align 8
  call fastcc void @kernel_trmm(i32 1000, i32 1200, double %0, [1000 x double]* %arraydecay, [1200 x double]* %arraydecay2)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %1, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %arraydecay2)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #3
  call void @free(i8* %call1) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %m, i32 %n, double* %alpha, [1000 x double]* %A, [1200 x double]* %B) unnamed_addr #0 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  br i1 true, label %for.cond.for.cond1_crit_edge.lr.ph, label %entry.for.end29_crit_edge

entry.for.end29_crit_edge:                        ; preds = %entry
  br label %for.end29

for.cond.for.cond1_crit_edge.lr.ph:               ; preds = %entry
  br i1 true, label %for.cond.for.cond1_crit_edge.us.preheader, label %for.cond.for.cond1_crit_edge.preheader

for.cond.for.cond1_crit_edge.preheader:           ; preds = %for.cond.for.cond1_crit_edge.lr.ph
  br label %for.cond.for.cond1_crit_edge

for.cond.for.cond1_crit_edge.us.preheader:        ; preds = %for.cond.for.cond1_crit_edge.lr.ph
  br label %for.cond.for.cond1_crit_edge.us

for.cond.for.cond1_crit_edge.us:                  ; preds = %for.cond.for.cond1_crit_edge.us.preheader, %for.cond11.for.inc27_crit_edge.us
  %indvar = phi i32 [ 0, %for.cond.for.cond1_crit_edge.us.preheader ], [ %indvar.next, %for.cond11.for.inc27_crit_edge.us ]
  %indvars.iv31 = phi i32 [ 0, %for.cond.for.cond1_crit_edge.us.preheader ], [ %indvars.iv.next32, %for.cond11.for.inc27_crit_edge.us ]
  %indvars.iv20 = phi i64 [ 0, %for.cond.for.cond1_crit_edge.us.preheader ], [ %indvars.iv.next21, %for.cond11.for.inc27_crit_edge.us ]
  %cmp23.us = icmp sgt i64 %indvars.iv20, 0
  br i1 %cmp23.us, label %for.inc.lr.ph.us, label %for.end.us

for.end.us.loopexit:                              ; preds = %for.inc.us
  br label %for.end.us

for.end.us:                                       ; preds = %for.end.us.loopexit, %for.inc.us.prol.loopexit, %for.cond.for.cond1_crit_edge.us
  %arrayidx10.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv20, i64 %indvars.iv20
  store double 1.000000e+00, double* %arrayidx10.us, align 8
  %0 = trunc i64 %indvars.iv20 to i32
  %sub.us = add i32 %0, 1200
  br i1 true, label %for.inc24.us.prol.loopexit, label %for.inc24.us.prol

for.inc24.us.prol:                                ; preds = %for.end.us
  %rem16.us.prol = srem i32 %sub.us, 1200
  %conv17.us.prol = sitofp i32 %rem16.us.prol to double
  %div19.us.prol = fdiv double %conv17.us.prol, 1.200000e+03
  %arrayidx23.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv20, i64 0
  store double %div19.us.prol, double* %arrayidx23.us.prol, align 8
  br label %for.inc24.us.prol.loopexit

for.inc24.us.prol.loopexit:                       ; preds = %for.inc24.us.prol, %for.end.us
  br i1 false, label %for.inc24.us.prol.loopexit.for.cond11.for.inc27_crit_edge.us_crit_edge, label %for.inc24.us.preheader

for.inc24.us.prol.loopexit.for.cond11.for.inc27_crit_edge.us_crit_edge: ; preds = %for.inc24.us.prol.loopexit
  br label %for.cond11.for.inc27_crit_edge.us

for.inc24.us.preheader:                           ; preds = %for.inc24.us.prol.loopexit
  br label %for.inc24.us

for.inc24.us:                                     ; preds = %for.inc24.us.preheader, %for.inc24.us
  %indvars.iv16 = phi i64 [ %indvars.iv.next17.1, %for.inc24.us ], [ 0, %for.inc24.us.preheader ]
  %1 = trunc i64 %indvars.iv16 to i32
  %add15.us = sub i32 %sub.us, %1
  %rem16.us = srem i32 %add15.us, 1200
  %conv17.us = sitofp i32 %rem16.us to double
  %arrayidx23.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv20, i64 %indvars.iv16
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %2 = trunc i64 %indvars.iv.next17 to i32
  %add15.us.1 = sub i32 %sub.us, %2
  %rem16.us.1 = srem i32 %add15.us.1, 1200
  %conv17.us.1 = sitofp i32 %rem16.us.1 to double
  %div19.us.v.i0.1 = insertelement <2 x double> undef, double %conv17.us, i32 0
  %div19.us.v.i0.2 = insertelement <2 x double> %div19.us.v.i0.1, double %conv17.us.1, i32 1
  %div19.us = fdiv <2 x double> %div19.us.v.i0.2, <double 1.200000e+03, double 1.200000e+03>
  %3 = bitcast double* %arrayidx23.us to <2 x double>*
  store <2 x double> %div19.us, <2 x double>* %3, align 8
  %indvars.iv.next17.1 = add nsw i64 %indvars.iv16, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next17.1, 1200
  br i1 %exitcond.1, label %for.cond11.for.inc27_crit_edge.us.loopexit, label %for.inc24.us

for.inc.us:                                       ; preds = %for.inc.us.preheader, %for.inc.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc.us ], [ %indvars.iv.unr.ph, %for.inc.us.preheader ]
  %4 = add nsw i64 %indvars.iv, %indvars.iv20
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 1000
  %conv.us = sitofp i32 %rem.us to double
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv20, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %6 = add nsw i64 %indvars.iv.next, %indvars.iv20
  %7 = trunc i64 %6 to i32
  %rem.us.1 = srem i32 %7, 1000
  %conv.us.1 = sitofp i32 %rem.us.1 to double
  %div.us.v.i0.1 = insertelement <2 x double> undef, double %conv.us, i32 0
  %div.us.v.i0.2 = insertelement <2 x double> %div.us.v.i0.1, double %conv.us.1, i32 1
  %div.us = fdiv <2 x double> %div.us.v.i0.2, <double 1.000000e+03, double 1.000000e+03>
  %8 = bitcast double* %arrayidx6.us to <2 x double>*
  store <2 x double> %div.us, <2 x double>* %8, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond34.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count33.1
  br i1 %exitcond34.1, label %for.end.us.loopexit, label %for.inc.us

for.inc.lr.ph.us:                                 ; preds = %for.cond.for.cond1_crit_edge.us
  %xtraiter = and i32 %indvar, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.us.prol.loopexit, label %for.inc.us.prol

for.inc.us.prol:                                  ; preds = %for.inc.lr.ph.us
  %9 = trunc i64 %indvars.iv20 to i32
  %rem.us.prol = srem i32 %9, 1000
  %conv.us.prol = sitofp i32 %rem.us.prol to double
  %div.us.prol = fdiv double %conv.us.prol, 1.000000e+03
  %arrayidx6.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv20, i64 0
  store double %div.us.prol, double* %arrayidx6.us.prol, align 8
  br label %for.inc.us.prol.loopexit

for.inc.us.prol.loopexit:                         ; preds = %for.inc.us.prol, %for.inc.lr.ph.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.us.prol ], [ 0, %for.inc.lr.ph.us ]
  %10 = icmp eq i32 %indvar, 1
  br i1 %10, label %for.end.us, label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %for.inc.us.prol.loopexit
  %wide.trip.count33.1 = zext i32 %indvars.iv31 to i64
  br label %for.inc.us

for.cond11.for.inc27_crit_edge.us.loopexit:       ; preds = %for.inc24.us
  br label %for.cond11.for.inc27_crit_edge.us

for.cond11.for.inc27_crit_edge.us:                ; preds = %for.inc24.us.prol.loopexit.for.cond11.for.inc27_crit_edge.us_crit_edge, %for.cond11.for.inc27_crit_edge.us.loopexit
  %indvars.iv.next21 = add nsw i64 %indvars.iv20, 1
  %indvars.iv.next32 = add i32 %indvars.iv31, 1
  %cmp.us = icmp slt i64 %indvars.iv.next21, 1000
  %indvar.next = add nuw i32 %indvar, 1
  br i1 %cmp.us, label %for.cond.for.cond1_crit_edge.us, label %for.cond.for.end29_crit_edge.loopexit

for.cond.for.cond1_crit_edge:                     ; preds = %for.cond.for.cond1_crit_edge.preheader, %for.end
  %indvar39 = phi i32 [ 0, %for.cond.for.cond1_crit_edge.preheader ], [ %indvar.next40, %for.end ]
  %indvars.iv37 = phi i32 [ 0, %for.cond.for.cond1_crit_edge.preheader ], [ %indvars.iv.next38, %for.end ]
  %indvars.iv29 = phi i64 [ 0, %for.cond.for.cond1_crit_edge.preheader ], [ %indvars.iv.next30, %for.end ]
  %cmp23 = icmp sgt i64 %indvars.iv29, 0
  br i1 %cmp23, label %for.inc.lr.ph, label %for.end

for.inc.lr.ph:                                    ; preds = %for.cond.for.cond1_crit_edge
  %xtraiter41 = and i32 %indvar39, 1
  %lcmp.mod42 = icmp eq i32 %xtraiter41, 0
  br i1 %lcmp.mod42, label %for.inc.prol.loopexit, label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.lr.ph
  %11 = trunc i64 %indvars.iv29 to i32
  %rem.prol = srem i32 %11, 1000
  %conv.prol = sitofp i32 %rem.prol to double
  %div.prol = fdiv double %conv.prol, 1.000000e+03
  %arrayidx6.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv29, i64 0
  store double %div.prol, double* %arrayidx6.prol, align 8
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol, %for.inc.lr.ph
  %indvars.iv22.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.lr.ph ]
  %12 = icmp eq i32 %indvar39, 1
  br i1 %12, label %for.end, label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.inc.prol.loopexit
  %wide.trip.count.1 = zext i32 %indvars.iv37 to i64
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %indvars.iv22 = phi i64 [ %indvars.iv.next23.1, %for.inc ], [ %indvars.iv22.unr.ph, %for.inc.preheader ]
  %13 = add nsw i64 %indvars.iv22, %indvars.iv29
  %14 = trunc i64 %13 to i32
  %rem = srem i32 %14, 1000
  %conv = sitofp i32 %rem to double
  %arrayidx6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv29, i64 %indvars.iv22
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %15 = add nsw i64 %indvars.iv.next23, %indvars.iv29
  %16 = trunc i64 %15 to i32
  %rem.1 = srem i32 %16, 1000
  %conv.1 = sitofp i32 %rem.1 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 1.000000e+03, double 1.000000e+03>
  %17 = bitcast double* %arrayidx6 to <2 x double>*
  store <2 x double> %div, <2 x double>* %17, align 8
  %indvars.iv.next23.1 = add nsw i64 %indvars.iv22, 2
  %exitcond.144 = icmp eq i64 %indvars.iv.next23.1, %wide.trip.count.1
  br i1 %exitcond.144, label %for.end.loopexit, label %for.inc

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.inc.prol.loopexit, %for.cond.for.cond1_crit_edge
  %arrayidx10 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv29, i64 %indvars.iv29
  store double 1.000000e+00, double* %arrayidx10, align 8
  %indvars.iv.next30 = add nsw i64 %indvars.iv29, 1
  %indvars.iv.next38 = add i32 %indvars.iv37, 1
  %cmp = icmp slt i64 %indvars.iv.next30, 1000
  %indvar.next40 = add nuw i32 %indvar39, 1
  br i1 %cmp, label %for.cond.for.cond1_crit_edge, label %for.cond.for.end29_crit_edge.loopexit47

for.cond.for.end29_crit_edge.loopexit:            ; preds = %for.cond11.for.inc27_crit_edge.us
  br label %for.cond.for.end29_crit_edge

for.cond.for.end29_crit_edge.loopexit47:          ; preds = %for.end
  br label %for.cond.for.end29_crit_edge

for.cond.for.end29_crit_edge:                     ; preds = %for.cond.for.end29_crit_edge.loopexit47, %for.cond.for.end29_crit_edge.loopexit
  br label %for.end29

for.end29:                                        ; preds = %entry.for.end29_crit_edge, %for.cond.for.end29_crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_trmm(i32 %m, i32 %n, double %alpha, [1000 x double]* %A, [1200 x double]* %B) unnamed_addr #0 {
entry:
  br i1 true, label %for.cond.for.cond1_crit_edge.lr.ph, label %entry.for.end32_crit_edge

entry.for.end32_crit_edge:                        ; preds = %entry
  br label %for.end32

for.cond.for.cond1_crit_edge.lr.ph:               ; preds = %entry
  br i1 true, label %for.cond.for.cond1_crit_edge.us.preheader, label %for.cond.for.end32_crit_edge.loopexit15

for.cond.for.cond1_crit_edge.us.preheader:        ; preds = %for.cond.for.cond1_crit_edge.lr.ph
  br label %for.cond.for.cond1_crit_edge.us

for.cond.for.cond1_crit_edge.us:                  ; preds = %for.cond.for.cond1_crit_edge.us.preheader, %for.cond1.for.inc30_crit_edge.us
  %indvar = phi i32 [ 0, %for.cond.for.cond1_crit_edge.us.preheader ], [ %indvar.next, %for.cond1.for.inc30_crit_edge.us ]
  %indvars.iv28 = phi i64 [ 0, %for.cond.for.cond1_crit_edge.us.preheader ], [ %1, %for.cond1.for.inc30_crit_edge.us ]
  %indvars.iv = phi i64 [ 1, %for.cond.for.cond1_crit_edge.us.preheader ], [ %indvars.iv.next18.prol, %for.cond1.for.inc30_crit_edge.us ]
  %0 = sub i32 1001, %indvar
  %1 = add nsw i64 %indvars.iv28, 1
  %cmp54.us = icmp slt i64 %1, 1000
  %xtraiter = and i32 %0, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %2 = icmp eq i32 998, %indvar
  %arrayidx8.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv28
  %indvars.iv.next18.prol = add nsw i64 %indvars.iv, 1
  br label %for.cond1.for.cond4_crit_edge.us

for.cond1.for.cond4_crit_edge.us:                 ; preds = %for.inc27.us, %for.cond.for.cond1_crit_edge.us
  %indvars.iv23 = phi i64 [ 0, %for.cond.for.cond1_crit_edge.us ], [ %indvars.iv.next24, %for.inc27.us ]
  br i1 %cmp54.us, label %for.inc.lr.ph.us, label %for.cond1.for.cond4_crit_edge.us.for.inc27.us_crit_edge

for.cond1.for.cond4_crit_edge.us.for.inc27.us_crit_edge: ; preds = %for.cond1.for.cond4_crit_edge.us
  %.pre35 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv28, i64 %indvars.iv23
  br label %for.inc27.us

for.inc27.us.loopexit:                            ; preds = %for.inc.us
  br label %for.inc27.us

for.inc27.us:                                     ; preds = %for.inc27.us.loopexit, %for.cond1.for.cond4_crit_edge.us.for.inc27.us_crit_edge, %for.inc.us.prol.loopexit
  %arrayidx21.us.pre-phi = phi double* [ %.pre35, %for.cond1.for.cond4_crit_edge.us.for.inc27.us_crit_edge ], [ %arrayidx16.us, %for.inc.us.prol.loopexit ], [ %arrayidx16.us, %for.inc27.us.loopexit ]
  %3 = load double, double* %arrayidx21.us.pre-phi, align 8
  %mul22.us = fmul double %3, %alpha
  store double %mul22.us, double* %arrayidx21.us.pre-phi, align 8
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond = icmp eq i64 %indvars.iv.next24, 1200
  br i1 %exitcond, label %for.cond1.for.inc30_crit_edge.us, label %for.cond1.for.cond4_crit_edge.us

for.inc.us:                                       ; preds = %for.inc.us.prol.loopexit.for.inc.us_crit_edge, %for.inc.us
  %4 = phi double [ %add17.us.1, %for.inc.us ], [ %.pre, %for.inc.us.prol.loopexit.for.inc.us_crit_edge ]
  %indvars.iv17 = phi i64 [ %indvars.iv.next18.1, %for.inc.us ], [ %indvars.iv17.unr.ph, %for.inc.us.prol.loopexit.for.inc.us_crit_edge ]
  %arrayidx8.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv17, i64 %indvars.iv28
  %5 = load double, double* %arrayidx8.us, align 8
  %arrayidx12.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv17, i64 %indvars.iv23
  %6 = load double, double* %arrayidx12.us, align 8
  %mul.us = fmul double %5, %6
  %add17.us = fadd double %mul.us, %4
  store double %add17.us, double* %arrayidx16.us, align 8
  %indvars.iv.next18 = add nsw i64 %indvars.iv17, 1
  %arrayidx8.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next18, i64 %indvars.iv28
  %7 = load double, double* %arrayidx8.us.1, align 8
  %arrayidx12.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv.next18, i64 %indvars.iv23
  %8 = load double, double* %arrayidx12.us.1, align 8
  %mul.us.1 = fmul double %7, %8
  %add17.us.1 = fadd double %mul.us.1, %add17.us
  store double %add17.us.1, double* %arrayidx16.us, align 8
  %indvars.iv.next18.1 = add nsw i64 %indvars.iv17, 2
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next18.1 to i32
  %exitcond.1 = icmp eq i32 %lftr.wideiv.1, 1000
  br i1 %exitcond.1, label %for.inc27.us.loopexit, label %for.inc.us

for.inc.lr.ph.us:                                 ; preds = %for.cond1.for.cond4_crit_edge.us
  %arrayidx16.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv28, i64 %indvars.iv23
  br i1 %lcmp.mod, label %for.inc.us.prol.loopexit, label %for.inc.us.prol

for.inc.us.prol:                                  ; preds = %for.inc.lr.ph.us
  %9 = load double, double* %arrayidx8.us.prol, align 8
  %arrayidx12.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv, i64 %indvars.iv23
  %10 = load double, double* %arrayidx12.us.prol, align 8
  %mul.us.prol = fmul double %9, %10
  %11 = load double, double* %arrayidx16.us, align 8
  %add17.us.prol = fadd double %mul.us.prol, %11
  store double %add17.us.prol, double* %arrayidx16.us, align 8
  br label %for.inc.us.prol.loopexit

for.inc.us.prol.loopexit:                         ; preds = %for.inc.us.prol, %for.inc.lr.ph.us
  %indvars.iv17.unr.ph = phi i64 [ %indvars.iv.next18.prol, %for.inc.us.prol ], [ %indvars.iv, %for.inc.lr.ph.us ]
  br i1 %2, label %for.inc27.us, label %for.inc.us.prol.loopexit.for.inc.us_crit_edge

for.inc.us.prol.loopexit.for.inc.us_crit_edge:    ; preds = %for.inc.us.prol.loopexit
  %.pre = load double, double* %arrayidx16.us, align 8
  br label %for.inc.us

for.cond1.for.inc30_crit_edge.us:                 ; preds = %for.inc27.us
  %indvar.next = add i32 %indvar, 1
  br i1 %cmp54.us, label %for.cond.for.cond1_crit_edge.us, label %for.cond.for.end32_crit_edge.loopexit

for.cond.for.end32_crit_edge.loopexit:            ; preds = %for.cond1.for.inc30_crit_edge.us
  br label %for.cond.for.end32_crit_edge

for.cond.for.end32_crit_edge.loopexit15:          ; preds = %for.cond.for.cond1_crit_edge.lr.ph
  br label %for.cond.for.end32_crit_edge

for.cond.for.end32_crit_edge:                     ; preds = %for.cond.for.end32_crit_edge.loopexit15, %for.cond.for.end32_crit_edge.loopexit
  br label %for.end32

for.end32:                                        ; preds = %entry.for.end32_crit_edge, %for.cond.for.end32_crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %m, i32 %n, [1200 x double]* %B) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br i1 true, label %for.cond.for.cond2_crit_edge.lr.ph, label %entry.for.end12_crit_edge

entry.for.end12_crit_edge:                        ; preds = %entry
  br label %for.end12

for.cond.for.cond2_crit_edge.lr.ph:               ; preds = %entry
  br i1 true, label %for.cond.for.cond2_crit_edge.us.preheader, label %for.cond.for.end12_crit_edge.loopexit7

for.cond.for.cond2_crit_edge.us.preheader:        ; preds = %for.cond.for.cond2_crit_edge.lr.ph
  br label %for.cond.for.cond2_crit_edge.us

for.cond.for.cond2_crit_edge.us:                  ; preds = %for.cond.for.cond2_crit_edge.us.preheader, %for.cond2.for.inc10_crit_edge.us
  %indvars.iv10 = phi i64 [ 0, %for.cond.for.cond2_crit_edge.us.preheader ], [ %indvars.iv.next11, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 1000, %indvars.iv10
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond.for.cond2_crit_edge.us
  %indvars.iv = phi i64 [ 0, %for.cond.for.cond2_crit_edge.us ], [ %indvars.iv.next, %for.inc.us ]
  %4 = add nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #4
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv10, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond14, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next11 = add nsw i64 %indvars.iv10, 1
  %cmp.us = icmp slt i64 %indvars.iv.next11, 1000
  br i1 %cmp.us, label %for.cond.for.cond2_crit_edge.us, label %for.cond.for.end12_crit_edge.loopexit

for.cond.for.end12_crit_edge.loopexit:            ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.cond.for.end12_crit_edge

for.cond.for.end12_crit_edge.loopexit7:           ; preds = %for.cond.for.cond2_crit_edge.lr.ph
  br label %for.cond.for.end12_crit_edge

for.cond.for.end12_crit_edge:                     ; preds = %for.cond.for.end12_crit_edge.loopexit7, %for.cond.for.end12_crit_edge.loopexit
  br label %for.end12

for.end12:                                        ; preds = %entry.for.end12_crit_edge, %for.cond.for.end12_crit_edge
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
