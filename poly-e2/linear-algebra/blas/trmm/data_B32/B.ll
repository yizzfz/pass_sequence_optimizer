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
  %arraydecay3 = bitcast i8* %call to [1000 x double]*
  %arraydecay4 = bitcast i8* %call1 to [1200 x double]*
  call fastcc void @kernel_trmm(i32 1000, i32 1200, double %0, [1000 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
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
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %arraydecay4)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  call void @free(i8* %call) #3
  call void @free(i8* %call1) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %m, i32 %n, double* %alpha, [1000 x double]* %A, [1200 x double]* %B) unnamed_addr #0 {
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
  %indvar = phi i32 [ 0, %for.cond1.preheader.us.preheader ], [ %indvar.next, %for.inc27.us ]
  %indvars.iv20 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next21, %for.inc27.us ]
  %indvars.iv14 = phi i32 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next15, %for.inc27.us ]
  %cmp23.us = icmp sgt i64 %indvars.iv20, 0
  br i1 %cmp23.us, label %for.body3.lr.ph.us, label %for.end.us

for.body3.lr.ph.us:                               ; preds = %for.cond1.preheader.us
  %0 = and i32 %indvar, 1
  %lcmp.mod = icmp eq i32 %0, 0
  br i1 %lcmp.mod, label %for.body3.us.prol.loopexit, label %for.body3.us.prol

for.body3.us.prol:                                ; preds = %for.body3.lr.ph.us
  %1 = trunc i64 %indvars.iv20 to i32
  %rem.us.prol = srem i32 %1, 1000
  %conv.us.prol = sitofp i32 %rem.us.prol to double
  %div.us.prol = fdiv double %conv.us.prol, 1.000000e+03
  %arrayidx6.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv20, i64 0
  store double %div.us.prol, double* %arrayidx6.us.prol, align 8
  br label %for.body3.us.prol.loopexit

for.body3.us.prol.loopexit:                       ; preds = %for.body3.us.prol, %for.body3.lr.ph.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body3.us.prol ], [ 0, %for.body3.lr.ph.us ]
  %2 = icmp eq i32 %indvar, 1
  br i1 %2, label %for.end.us, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.body3.us.prol.loopexit
  %wide.trip.count.1 = zext i32 %indvars.iv14 to i64
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.body3.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body3.us ], [ %indvars.iv.unr.ph, %for.body3.us.preheader ]
  %3 = add nsw i64 %indvars.iv, %indvars.iv20
  %4 = trunc i64 %3 to i32
  %rem.us = srem i32 %4, 1000
  %conv.us = sitofp i32 %rem.us to double
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv20, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %5 = add nsw i64 %indvars.iv.next, %indvars.iv20
  %6 = trunc i64 %5 to i32
  %rem.us.1 = srem i32 %6, 1000
  %conv.us.1 = sitofp i32 %rem.us.1 to double
  %div.us.v.i0.1 = insertelement <2 x double> undef, double %conv.us, i32 0
  %div.us.v.i0.2 = insertelement <2 x double> %div.us.v.i0.1, double %conv.us.1, i32 1
  %div.us = fdiv <2 x double> %div.us.v.i0.2, <double 1.000000e+03, double 1.000000e+03>
  %7 = bitcast double* %arrayidx6.us to <2 x double>*
  store <2 x double> %div.us, <2 x double>* %7, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.end.us.loopexit, label %for.body3.us

for.end.us.loopexit:                              ; preds = %for.body3.us
  br label %for.end.us

for.end.us:                                       ; preds = %for.end.us.loopexit, %for.body3.us.prol.loopexit, %for.cond1.preheader.us
  %arrayidx10.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv20, i64 %indvars.iv20
  store double 1.000000e+00, double* %arrayidx10.us, align 8
  %8 = trunc i64 %indvars.iv20 to i32
  %sub.us = add i32 %8, 1200
  br i1 true, label %for.body14.us.prol.loopexit, label %for.body14.us.prol

for.body14.us.prol:                               ; preds = %for.end.us
  %rem16.us.prol = srem i32 %sub.us, 1200
  %conv17.us.prol = sitofp i32 %rem16.us.prol to double
  %div19.us.prol = fdiv double %conv17.us.prol, 1.200000e+03
  %arrayidx23.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv20, i64 0
  store double %div19.us.prol, double* %arrayidx23.us.prol, align 8
  br label %for.body14.us.prol.loopexit

for.body14.us.prol.loopexit:                      ; preds = %for.body14.us.prol, %for.end.us
  %indvars.iv16.unr.ph = phi i64 [ 1, %for.body14.us.prol ], [ 0, %for.end.us ]
  br i1 false, label %for.inc27.us, label %for.body14.us.preheader

for.body14.us.preheader:                          ; preds = %for.body14.us.prol.loopexit
  br label %for.body14.us

for.body14.us:                                    ; preds = %for.body14.us.preheader, %for.body14.us
  %indvars.iv16 = phi i64 [ %indvars.iv.next17.1, %for.body14.us ], [ %indvars.iv16.unr.ph, %for.body14.us.preheader ]
  %9 = trunc i64 %indvars.iv16 to i32
  %add15.us = sub i32 %sub.us, %9
  %rem16.us = srem i32 %add15.us, 1200
  %conv17.us = sitofp i32 %rem16.us to double
  %arrayidx23.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv20, i64 %indvars.iv16
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %10 = trunc i64 %indvars.iv.next17 to i32
  %add15.us.1 = sub i32 %sub.us, %10
  %rem16.us.1 = srem i32 %add15.us.1, 1200
  %conv17.us.1 = sitofp i32 %rem16.us.1 to double
  %div19.us.v.i0.1 = insertelement <2 x double> undef, double %conv17.us, i32 0
  %div19.us.v.i0.2 = insertelement <2 x double> %div19.us.v.i0.1, double %conv17.us.1, i32 1
  %div19.us = fdiv <2 x double> %div19.us.v.i0.2, <double 1.200000e+03, double 1.200000e+03>
  %11 = bitcast double* %arrayidx23.us to <2 x double>*
  store <2 x double> %div19.us, <2 x double>* %11, align 8
  %indvars.iv.next17.1 = add nsw i64 %indvars.iv16, 2
  %exitcond19.1 = icmp eq i64 %indvars.iv.next17.1, 1200
  br i1 %exitcond19.1, label %for.inc27.us.loopexit, label %for.body14.us

for.inc27.us.loopexit:                            ; preds = %for.body14.us
  br label %for.inc27.us

for.inc27.us:                                     ; preds = %for.inc27.us.loopexit, %for.body14.us.prol.loopexit
  %indvars.iv.next21 = add nsw i64 %indvars.iv20, 1
  %indvars.iv.next15 = add i32 %indvars.iv14, 1
  %cmp.us = icmp slt i64 %indvars.iv.next21, 1000
  %indvar.next = add i32 %indvar, 1
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.cond.for.end29_crit_edge.loopexit

for.cond1.preheader:                              ; preds = %for.cond1.preheader.preheader, %for.end
  %indvar33 = phi i32 [ %indvar.next34, %for.end ], [ 0, %for.cond1.preheader.preheader ]
  %indvars.iv29 = phi i64 [ %indvars.iv.next30, %for.end ], [ 0, %for.cond1.preheader.preheader ]
  %indvars.iv25 = phi i32 [ %indvars.iv.next26, %for.end ], [ 0, %for.cond1.preheader.preheader ]
  %cmp23 = icmp sgt i64 %indvars.iv29, 0
  br i1 %cmp23, label %for.body3.lr.ph, label %for.end

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  %12 = and i32 %indvar33, 1
  %lcmp.mod36 = icmp eq i32 %12, 0
  br i1 %lcmp.mod36, label %for.body3.prol.loopexit, label %for.body3.prol

for.body3.prol:                                   ; preds = %for.body3.lr.ph
  %13 = trunc i64 %indvars.iv29 to i32
  %rem.prol = srem i32 %13, 1000
  %conv.prol = sitofp i32 %rem.prol to double
  %div.prol = fdiv double %conv.prol, 1.000000e+03
  %arrayidx6.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv29, i64 0
  store double %div.prol, double* %arrayidx6.prol, align 8
  br label %for.body3.prol.loopexit

for.body3.prol.loopexit:                          ; preds = %for.body3.prol, %for.body3.lr.ph
  %indvars.iv22.unr.ph = phi i64 [ 1, %for.body3.prol ], [ 0, %for.body3.lr.ph ]
  %14 = icmp eq i32 %indvar33, 1
  br i1 %14, label %for.end, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.body3.prol.loopexit
  %wide.trip.count27.1 = zext i32 %indvars.iv25 to i64
  br label %for.body3

for.body3:                                        ; preds = %for.body3.preheader, %for.body3
  %indvars.iv22 = phi i64 [ %indvars.iv.next23.1, %for.body3 ], [ %indvars.iv22.unr.ph, %for.body3.preheader ]
  %15 = add nsw i64 %indvars.iv22, %indvars.iv29
  %16 = trunc i64 %15 to i32
  %rem = srem i32 %16, 1000
  %conv = sitofp i32 %rem to double
  %arrayidx6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv29, i64 %indvars.iv22
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %17 = add nsw i64 %indvars.iv.next23, %indvars.iv29
  %18 = trunc i64 %17 to i32
  %rem.1 = srem i32 %18, 1000
  %conv.1 = sitofp i32 %rem.1 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 1.000000e+03, double 1.000000e+03>
  %19 = bitcast double* %arrayidx6 to <2 x double>*
  store <2 x double> %div, <2 x double>* %19, align 8
  %indvars.iv.next23.1 = add nsw i64 %indvars.iv22, 2
  %exitcond28.1 = icmp eq i64 %indvars.iv.next23.1, %wide.trip.count27.1
  br i1 %exitcond28.1, label %for.end.loopexit, label %for.body3

for.end.loopexit:                                 ; preds = %for.body3
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body3.prol.loopexit, %for.cond1.preheader
  %arrayidx10 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv29, i64 %indvars.iv29
  store double 1.000000e+00, double* %arrayidx10, align 8
  %indvars.iv.next30 = add nsw i64 %indvars.iv29, 1
  %indvars.iv.next26 = add i32 %indvars.iv25, 1
  %cmp = icmp slt i64 %indvars.iv.next30, 1000
  %indvar.next34 = add i32 %indvar33, 1
  br i1 %cmp, label %for.cond1.preheader, label %for.cond.for.end29_crit_edge.loopexit39

for.cond.for.end29_crit_edge.loopexit:            ; preds = %for.inc27.us
  br label %for.cond.for.end29_crit_edge

for.cond.for.end29_crit_edge.loopexit39:          ; preds = %for.end
  br label %for.cond.for.end29_crit_edge

for.cond.for.end29_crit_edge:                     ; preds = %for.cond.for.end29_crit_edge.loopexit39, %for.cond.for.end29_crit_edge.loopexit
  br label %for.end29

for.end29:                                        ; preds = %for.cond.for.end29_crit_edge, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_trmm(i32 %m, i32 %n, double %alpha, [1000 x double]* %A, [1200 x double]* %B) unnamed_addr #0 {
entry:
  br i1 true, label %for.cond1.preheader.lr.ph, label %for.end32

for.cond1.preheader.lr.ph:                        ; preds = %entry
  br i1 true, label %for.cond1.preheader.us.preheader, label %for.cond.for.end32_crit_edge.loopexit15

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.inc30.us
  %indvar = phi i32 [ 0, %for.cond1.preheader.us.preheader ], [ %indvar.next, %for.inc30.us ]
  %indvars.iv28 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %1, %for.inc30.us ]
  %indvars.iv = phi i64 [ 1, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next18.prol, %for.inc30.us ]
  %0 = sub i32 1001, %indvar
  %1 = add nsw i64 %indvars.iv28, 1
  %cmp54.us = icmp slt i64 %1, 1000
  %xtraiter = and i32 %0, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %2 = icmp eq i32 998, %indvar
  %arrayidx8.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv28
  %indvars.iv.next18.prol = add nsw i64 %indvars.iv, 1
  br label %for.cond4.preheader.us

for.cond4.preheader.us:                           ; preds = %for.end.us, %for.cond1.preheader.us
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %for.end.us ], [ 0, %for.cond1.preheader.us ]
  br i1 %cmp54.us, label %for.body6.lr.ph.us, label %for.cond4.preheader.us.for.end.us_crit_edge

for.cond4.preheader.us.for.end.us_crit_edge:      ; preds = %for.cond4.preheader.us
  %.pre31 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv28, i64 %indvars.iv23
  br label %for.end.us

for.body6.lr.ph.us:                               ; preds = %for.cond4.preheader.us
  %arrayidx16.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv28, i64 %indvars.iv23
  br i1 %lcmp.mod, label %for.body6.us.prol.loopexit, label %for.body6.us.prol

for.body6.us.prol:                                ; preds = %for.body6.lr.ph.us
  %3 = load double, double* %arrayidx8.us.prol, align 8
  %arrayidx12.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv, i64 %indvars.iv23
  %4 = load double, double* %arrayidx12.us.prol, align 8
  %mul.us.prol = fmul double %3, %4
  %5 = load double, double* %arrayidx16.us, align 8
  %add17.us.prol = fadd double %mul.us.prol, %5
  store double %add17.us.prol, double* %arrayidx16.us, align 8
  br label %for.body6.us.prol.loopexit

for.body6.us.prol.loopexit:                       ; preds = %for.body6.us.prol, %for.body6.lr.ph.us
  %indvars.iv17.unr.ph = phi i64 [ %indvars.iv.next18.prol, %for.body6.us.prol ], [ %indvars.iv, %for.body6.lr.ph.us ]
  br i1 %2, label %for.end.us, label %for.body6.us.prol.loopexit.for.body6.us_crit_edge

for.body6.us.prol.loopexit.for.body6.us_crit_edge: ; preds = %for.body6.us.prol.loopexit
  %.pre = load double, double* %arrayidx16.us, align 8
  br label %for.body6.us

for.body6.us:                                     ; preds = %for.body6.us.prol.loopexit.for.body6.us_crit_edge, %for.body6.us
  %6 = phi double [ %add17.us.1, %for.body6.us ], [ %.pre, %for.body6.us.prol.loopexit.for.body6.us_crit_edge ]
  %indvars.iv17 = phi i64 [ %indvars.iv.next18.1, %for.body6.us ], [ %indvars.iv17.unr.ph, %for.body6.us.prol.loopexit.for.body6.us_crit_edge ]
  %arrayidx8.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv17, i64 %indvars.iv28
  %7 = load double, double* %arrayidx8.us, align 8
  %arrayidx12.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv17, i64 %indvars.iv23
  %8 = load double, double* %arrayidx12.us, align 8
  %mul.us = fmul double %7, %8
  %add17.us = fadd double %mul.us, %6
  store double %add17.us, double* %arrayidx16.us, align 8
  %indvars.iv.next18 = add nsw i64 %indvars.iv17, 1
  %arrayidx8.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next18, i64 %indvars.iv28
  %9 = load double, double* %arrayidx8.us.1, align 8
  %arrayidx12.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv.next18, i64 %indvars.iv23
  %10 = load double, double* %arrayidx12.us.1, align 8
  %mul.us.1 = fmul double %9, %10
  %add17.us.1 = fadd double %mul.us.1, %add17.us
  store double %add17.us.1, double* %arrayidx16.us, align 8
  %indvars.iv.next18.1 = add nsw i64 %indvars.iv17, 2
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next18.1 to i32
  %exitcond.1 = icmp eq i32 %lftr.wideiv.1, 1000
  br i1 %exitcond.1, label %for.end.us.loopexit, label %for.body6.us

for.end.us.loopexit:                              ; preds = %for.body6.us
  br label %for.end.us

for.end.us:                                       ; preds = %for.end.us.loopexit, %for.cond4.preheader.us.for.end.us_crit_edge, %for.body6.us.prol.loopexit
  %arrayidx21.us.pre-phi = phi double* [ %.pre31, %for.cond4.preheader.us.for.end.us_crit_edge ], [ %arrayidx16.us, %for.body6.us.prol.loopexit ], [ %arrayidx16.us, %for.end.us.loopexit ]
  %11 = load double, double* %arrayidx21.us.pre-phi, align 8
  %mul22.us = fmul double %11, %alpha
  store double %mul22.us, double* %arrayidx21.us.pre-phi, align 8
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next24, 1200
  br i1 %exitcond27, label %for.inc30.us, label %for.cond4.preheader.us

for.inc30.us:                                     ; preds = %for.end.us
  %indvar.next = add i32 %indvar, 1
  br i1 %cmp54.us, label %for.cond1.preheader.us, label %for.cond.for.end32_crit_edge.loopexit

for.cond.for.end32_crit_edge.loopexit:            ; preds = %for.inc30.us
  br label %for.cond.for.end32_crit_edge

for.cond.for.end32_crit_edge.loopexit15:          ; preds = %for.cond1.preheader.lr.ph
  br label %for.cond.for.end32_crit_edge

for.cond.for.end32_crit_edge:                     ; preds = %for.cond.for.end32_crit_edge.loopexit15, %for.cond.for.end32_crit_edge.loopexit
  br label %for.end32

for.end32:                                        ; preds = %for.cond.for.end32_crit_edge, %entry
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
  br i1 true, label %for.cond2.preheader.lr.ph, label %for.end12

for.cond2.preheader.lr.ph:                        ; preds = %entry
  br i1 true, label %for.cond2.preheader.us.preheader, label %for.cond.for.end12_crit_edge.loopexit8

for.cond2.preheader.us.preheader:                 ; preds = %for.cond2.preheader.lr.ph
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.preheader.us.preheader, %for.inc10.us
  %indvars.iv11 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next12, %for.inc10.us ]
  %3 = mul nsw i64 1000, %indvars.iv11
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end.us ], [ 0, %for.cond2.preheader.us ]
  %4 = add nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #4
  br label %if.end.us

if.end.us:                                        ; preds = %if.then.us, %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv11, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.inc10.us, label %for.body4.us

for.inc10.us:                                     ; preds = %if.end.us
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, 1
  %cmp.us = icmp slt i64 %indvars.iv.next12, 1000
  br i1 %cmp.us, label %for.cond2.preheader.us, label %for.cond.for.end12_crit_edge.loopexit

for.cond.for.end12_crit_edge.loopexit:            ; preds = %for.inc10.us
  br label %for.cond.for.end12_crit_edge

for.cond.for.end12_crit_edge.loopexit8:           ; preds = %for.cond2.preheader.lr.ph
  br label %for.cond.for.end12_crit_edge

for.cond.for.end12_crit_edge:                     ; preds = %for.cond.for.end12_crit_edge.loopexit8, %for.cond.for.end12_crit_edge.loopexit
  br label %for.end12

for.end12:                                        ; preds = %for.cond.for.end12_crit_edge, %entry
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
