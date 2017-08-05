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
  call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %arraydecay3 = bitcast i8* %call to [1000 x double]*
  %arraydecay4 = bitcast i8* %call1 to [1200 x double]*
  call void @kernel_trmm(i32 1000, i32 1200, double %0, [1000 x double]* %arraydecay3, [1200 x double]* %arraydecay4)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %1 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %1, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call void @print_array(i32 1000, i32 1200, [1200 x double]* %arraydecay4)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32 %m, i32 %n, double* %alpha, [1000 x double]* %A, [1200 x double]* %B) #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  br i1 true, label %for.cond1.preheader.lr.ph, label %for.end29

for.cond1.preheader.lr.ph:                        ; preds = %entry
  br i1 true, label %for.cond1.preheader.us.preheader, label %for.cond1.preheader.preheader

for.cond1.preheader.preheader:                    ; preds = %for.cond1.preheader.lr.ph
  br label %for.cond1.preheader

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond11.for.inc27_crit_edge.us.for.cond1.preheader.us_crit_edge, %for.cond1.preheader.us.preheader
  %indvars.iv23 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next24, %for.cond11.for.inc27_crit_edge.us.for.cond1.preheader.us_crit_edge ]
  %indvar = phi i32 [ 0, %for.cond1.preheader.us.preheader ], [ %indvar.next, %for.cond11.for.inc27_crit_edge.us.for.cond1.preheader.us_crit_edge ]
  %indvars.iv14 = phi i32 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next15, %for.cond11.for.inc27_crit_edge.us.for.cond1.preheader.us_crit_edge ]
  %cmp23.us = icmp sgt i64 %indvars.iv23, 0
  br i1 %cmp23.us, label %for.body3.lr.ph.us, label %for.end.us

for.end.us.loopexit:                              ; preds = %for.body3.us
  br label %for.end.us

for.end.us:                                       ; preds = %for.end.us.loopexit, %for.body3.us.prol.loopexit, %for.cond1.preheader.us
  %arrayidx10.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv23, i64 %indvars.iv23
  store double 1.000000e+00, double* %arrayidx10.us, align 8
  %0 = trunc i64 %indvars.iv23 to i32
  %sub.us = add i32 %0, 1200
  br i1 true, label %for.body14.us.prol.loopexit, label %for.body14.us.prol

for.body14.us.prol:                               ; preds = %for.end.us
  %rem16.us.prol = srem i32 %sub.us, 1200
  %conv17.us.prol = sitofp i32 %rem16.us.prol to double
  %div19.us.prol = fdiv double %conv17.us.prol, 1.200000e+03
  %arrayidx23.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv23, i64 0
  store double %div19.us.prol, double* %arrayidx23.us.prol, align 8
  br label %for.body14.us.prol.loopexit

for.body14.us.prol.loopexit:                      ; preds = %for.end.us, %for.body14.us.prol
  %indvars.iv16.unr.ph = phi i64 [ 1, %for.body14.us.prol ], [ 0, %for.end.us ]
  br i1 false, label %for.cond11.for.inc27_crit_edge.us, label %for.body14.us.preheader

for.body14.us.preheader:                          ; preds = %for.body14.us.prol.loopexit
  br label %for.body14.us

for.body14.us:                                    ; preds = %for.body14.us.preheader, %for.body14.us
  %indvars.iv16 = phi i64 [ %indvars.iv.next17.1, %for.body14.us ], [ %indvars.iv16.unr.ph, %for.body14.us.preheader ]
  %1 = trunc i64 %indvars.iv16 to i32
  %add15.us = sub i32 %sub.us, %1
  %rem16.us = srem i32 %add15.us, 1200
  %conv17.us = sitofp i32 %rem16.us to double
  %arrayidx23.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv23, i64 %indvars.iv16
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
  %exitcond.122 = icmp eq i64 %indvars.iv.next17.1, 1200
  br i1 %exitcond.122, label %for.cond11.for.inc27_crit_edge.us.loopexit, label %for.body14.us

for.body3.us:                                     ; preds = %for.body3.us, %for.body3.us.preheader
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body3.us.preheader ], [ %indvars.iv.next.1, %for.body3.us ]
  %4 = add nsw i64 %indvars.iv, %indvars.iv23
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 1000
  %conv.us = sitofp i32 %rem.us to double
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv23, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %6 = add nsw i64 %indvars.iv.next, %indvars.iv23
  %7 = trunc i64 %6 to i32
  %rem.us.1 = srem i32 %7, 1000
  %conv.us.1 = sitofp i32 %rem.us.1 to double
  %div.us.v.i0.1 = insertelement <2 x double> undef, double %conv.us, i32 0
  %div.us.v.i0.2 = insertelement <2 x double> %div.us.v.i0.1, double %conv.us.1, i32 1
  %div.us = fdiv <2 x double> %div.us.v.i0.2, <double 1.000000e+03, double 1.000000e+03>
  %8 = bitcast double* %arrayidx6.us to <2 x double>*
  store <2 x double> %div.us, <2 x double>* %8, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.end.us.loopexit, label %for.body3.us

for.body3.lr.ph.us:                               ; preds = %for.cond1.preheader.us
  %xtraiter = and i32 %indvar, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body3.us.prol.loopexit, label %for.body3.us.prol

for.body3.us.prol:                                ; preds = %for.body3.lr.ph.us
  %9 = trunc i64 %indvars.iv23 to i32
  %rem.us.prol = srem i32 %9, 1000
  %conv.us.prol = sitofp i32 %rem.us.prol to double
  %div.us.prol = fdiv double %conv.us.prol, 1.000000e+03
  %arrayidx6.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv23, i64 0
  store double %div.us.prol, double* %arrayidx6.us.prol, align 8
  br label %for.body3.us.prol.loopexit

for.body3.us.prol.loopexit:                       ; preds = %for.body3.lr.ph.us, %for.body3.us.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body3.us.prol ], [ 0, %for.body3.lr.ph.us ]
  %10 = icmp eq i32 %indvar, 1
  br i1 %10, label %for.end.us, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.body3.us.prol.loopexit
  %wide.trip.count.1 = zext i32 %indvars.iv14 to i64
  br label %for.body3.us

for.cond11.for.inc27_crit_edge.us.loopexit:       ; preds = %for.body14.us
  br label %for.cond11.for.inc27_crit_edge.us

for.cond11.for.inc27_crit_edge.us:                ; preds = %for.cond11.for.inc27_crit_edge.us.loopexit, %for.body14.us.prol.loopexit
  %indvars.iv.next24 = add nsw i64 %indvars.iv23, 1
  %cmp.us = icmp slt i64 %indvars.iv.next24, 1000
  br i1 %cmp.us, label %for.cond11.for.inc27_crit_edge.us.for.cond1.preheader.us_crit_edge, label %for.cond.for.end29_crit_edge.loopexit

for.cond11.for.inc27_crit_edge.us.for.cond1.preheader.us_crit_edge: ; preds = %for.cond11.for.inc27_crit_edge.us
  %indvar.next = add i32 %indvar, 1
  %indvars.iv.next15 = add i32 %indvars.iv14, 1
  br label %for.cond1.preheader.us

for.cond1.preheader:                              ; preds = %for.cond1.preheader.preheader, %for.end.for.cond1.preheader_crit_edge
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %for.end.for.cond1.preheader_crit_edge ], [ 0, %for.cond1.preheader.preheader ]
  %indvar31 = phi i32 [ %indvar.next32, %for.end.for.cond1.preheader_crit_edge ], [ 0, %for.cond1.preheader.preheader ]
  %indvars.iv28 = phi i32 [ %indvars.iv.next29, %for.end.for.cond1.preheader_crit_edge ], [ 0, %for.cond1.preheader.preheader ]
  %cmp23 = icmp sgt i64 %indvars.iv37, 0
  br i1 %cmp23, label %for.body3.lr.ph, label %for.end

for.body3.lr.ph:                                  ; preds = %for.cond1.preheader
  %xtraiter33 = and i32 %indvar31, 1
  %lcmp.mod34 = icmp eq i32 %xtraiter33, 0
  br i1 %lcmp.mod34, label %for.body3.prol.loopexit, label %for.body3.prol

for.body3.prol:                                   ; preds = %for.body3.lr.ph
  %11 = trunc i64 %indvars.iv37 to i32
  %rem.prol = srem i32 %11, 1000
  %conv.prol = sitofp i32 %rem.prol to double
  %div.prol = fdiv double %conv.prol, 1.000000e+03
  %arrayidx6.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv37, i64 0
  store double %div.prol, double* %arrayidx6.prol, align 8
  br label %for.body3.prol.loopexit

for.body3.prol.loopexit:                          ; preds = %for.body3.lr.ph, %for.body3.prol
  %indvars.iv25.unr.ph = phi i64 [ 1, %for.body3.prol ], [ 0, %for.body3.lr.ph ]
  %12 = icmp eq i32 %indvar31, 1
  br i1 %12, label %for.end, label %for.body3.preheader

for.body3.preheader:                              ; preds = %for.body3.prol.loopexit
  %wide.trip.count30.1 = zext i32 %indvars.iv28 to i64
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.body3.preheader
  %indvars.iv25 = phi i64 [ %indvars.iv25.unr.ph, %for.body3.preheader ], [ %indvars.iv.next26.1, %for.body3 ]
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
  br i1 %exitcond.136, label %for.end.loopexit, label %for.body3

for.end.loopexit:                                 ; preds = %for.body3
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.body3.prol.loopexit, %for.cond1.preheader
  %arrayidx10 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv37
  store double 1.000000e+00, double* %arrayidx10, align 8
  %indvars.iv.next38 = add nsw i64 %indvars.iv37, 1
  %cmp = icmp slt i64 %indvars.iv.next38, 1000
  br i1 %cmp, label %for.end.for.cond1.preheader_crit_edge, label %for.cond.for.end29_crit_edge.loopexit41

for.end.for.cond1.preheader_crit_edge:            ; preds = %for.end
  %indvar.next32 = add i32 %indvar31, 1
  %indvars.iv.next29 = add i32 %indvars.iv28, 1
  br label %for.cond1.preheader

for.cond.for.end29_crit_edge.loopexit:            ; preds = %for.cond11.for.inc27_crit_edge.us
  br label %for.cond.for.end29_crit_edge

for.cond.for.end29_crit_edge.loopexit41:          ; preds = %for.end
  br label %for.cond.for.end29_crit_edge

for.cond.for.end29_crit_edge:                     ; preds = %for.cond.for.end29_crit_edge.loopexit41, %for.cond.for.end29_crit_edge.loopexit
  br label %for.end29

for.end29:                                        ; preds = %entry, %for.cond.for.end29_crit_edge
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_trmm(i32 %m, i32 %n, double %alpha, [1000 x double]* %A, [1200 x double]* %B) #2 {
entry:
  br i1 true, label %for.cond1.preheader.lr.ph, label %for.end32

for.cond1.preheader.lr.ph:                        ; preds = %entry
  br i1 true, label %for.cond1.preheader.us.preheader, label %for.cond.for.end32_crit_edge.loopexit15

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc30_crit_edge.us.for.cond1.preheader.us_crit_edge, %for.cond1.preheader.us.preheader
  %indvars.iv27 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %1, %for.cond1.for.inc30_crit_edge.us.for.cond1.preheader.us_crit_edge ]
  %indvar = phi i32 [ 0, %for.cond1.preheader.us.preheader ], [ %indvar.next, %for.cond1.for.inc30_crit_edge.us.for.cond1.preheader.us_crit_edge ]
  %indvars.iv = phi i64 [ 1, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next18.prol, %for.cond1.for.inc30_crit_edge.us.for.cond1.preheader.us_crit_edge ]
  %0 = sub i32 1001, %indvar
  %1 = add nsw i64 %indvars.iv27, 1
  %cmp54.us = icmp slt i64 %1, 1000
  %xtraiter = and i32 %0, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %2 = icmp eq i32 998, %indvar
  %arrayidx8.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv27
  %indvars.iv.next18.prol = add nsw i64 %indvars.iv, 1
  br label %for.cond4.preheader.us

for.end.us.loopexit:                              ; preds = %for.body6.us
  br label %for.end.us

for.end.us:                                       ; preds = %for.end.us.loopexit, %for.cond4.preheader.us.for.end.us_crit_edge, %for.body6.us.prol.loopexit
  %arrayidx21.us.pre-phi = phi double* [ %.pre30, %for.cond4.preheader.us.for.end.us_crit_edge ], [ %arrayidx16.us, %for.body6.us.prol.loopexit ], [ %arrayidx16.us, %for.end.us.loopexit ]
  %3 = load double, double* %arrayidx21.us.pre-phi, align 8
  %mul22.us = fmul double %3, %alpha
  store double %mul22.us, double* %arrayidx21.us.pre-phi, align 8
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond = icmp eq i64 %indvars.iv.next24, 1200
  br i1 %exitcond, label %for.cond1.for.inc30_crit_edge.us, label %for.cond4.preheader.us

for.body6.us:                                     ; preds = %for.body6.us.prol.loopexit.for.body6.us_crit_edge, %for.body6.us
  %4 = phi double [ %add17.us.1, %for.body6.us ], [ %.pre, %for.body6.us.prol.loopexit.for.body6.us_crit_edge ]
  %indvars.iv17 = phi i64 [ %indvars.iv.next18.1, %for.body6.us ], [ %indvars.iv17.unr.ph, %for.body6.us.prol.loopexit.for.body6.us_crit_edge ]
  %arrayidx8.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv17, i64 %indvars.iv27
  %5 = load double, double* %arrayidx8.us, align 8
  %arrayidx12.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv17, i64 %indvars.iv23
  %6 = load double, double* %arrayidx12.us, align 8
  %mul.us = fmul double %5, %6
  %add17.us = fadd double %mul.us, %4
  store double %add17.us, double* %arrayidx16.us, align 8
  %indvars.iv.next18 = add nsw i64 %indvars.iv17, 1
  %arrayidx8.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next18, i64 %indvars.iv27
  %7 = load double, double* %arrayidx8.us.1, align 8
  %arrayidx12.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv.next18, i64 %indvars.iv23
  %8 = load double, double* %arrayidx12.us.1, align 8
  %mul.us.1 = fmul double %7, %8
  %add17.us.1 = fadd double %mul.us.1, %add17.us
  store double %add17.us.1, double* %arrayidx16.us, align 8
  %indvars.iv.next18.1 = add nsw i64 %indvars.iv17, 2
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next18.1 to i32
  %exitcond.1 = icmp eq i32 %lftr.wideiv.1, 1000
  br i1 %exitcond.1, label %for.end.us.loopexit, label %for.body6.us

for.cond4.preheader.us:                           ; preds = %for.end.us, %for.cond1.preheader.us
  %indvars.iv23 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next24, %for.end.us ]
  br i1 %cmp54.us, label %for.body6.lr.ph.us, label %for.cond4.preheader.us.for.end.us_crit_edge

for.cond4.preheader.us.for.end.us_crit_edge:      ; preds = %for.cond4.preheader.us
  %.pre30 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv27, i64 %indvars.iv23
  br label %for.end.us

for.body6.lr.ph.us:                               ; preds = %for.cond4.preheader.us
  %arrayidx16.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv27, i64 %indvars.iv23
  br i1 %lcmp.mod, label %for.body6.us.prol.loopexit, label %for.body6.us.prol

for.body6.us.prol:                                ; preds = %for.body6.lr.ph.us
  %9 = load double, double* %arrayidx8.us.prol, align 8
  %arrayidx12.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv, i64 %indvars.iv23
  %10 = load double, double* %arrayidx12.us.prol, align 8
  %mul.us.prol = fmul double %9, %10
  %11 = load double, double* %arrayidx16.us, align 8
  %add17.us.prol = fadd double %mul.us.prol, %11
  store double %add17.us.prol, double* %arrayidx16.us, align 8
  br label %for.body6.us.prol.loopexit

for.body6.us.prol.loopexit:                       ; preds = %for.body6.lr.ph.us, %for.body6.us.prol
  %indvars.iv17.unr.ph = phi i64 [ %indvars.iv.next18.prol, %for.body6.us.prol ], [ %indvars.iv, %for.body6.lr.ph.us ]
  br i1 %2, label %for.end.us, label %for.body6.us.prol.loopexit.for.body6.us_crit_edge

for.body6.us.prol.loopexit.for.body6.us_crit_edge: ; preds = %for.body6.us.prol.loopexit
  %.pre = load double, double* %arrayidx16.us, align 8
  br label %for.body6.us

for.cond1.for.inc30_crit_edge.us:                 ; preds = %for.end.us
  br i1 %cmp54.us, label %for.cond1.for.inc30_crit_edge.us.for.cond1.preheader.us_crit_edge, label %for.cond.for.end32_crit_edge.loopexit

for.cond1.for.inc30_crit_edge.us.for.cond1.preheader.us_crit_edge: ; preds = %for.cond1.for.inc30_crit_edge.us
  %indvar.next = add i32 %indvar, 1
  br label %for.cond1.preheader.us

for.cond.for.end32_crit_edge.loopexit:            ; preds = %for.cond1.for.inc30_crit_edge.us
  br label %for.cond.for.end32_crit_edge

for.cond.for.end32_crit_edge.loopexit15:          ; preds = %for.cond1.preheader.lr.ph
  br label %for.cond.for.end32_crit_edge

for.cond.for.end32_crit_edge:                     ; preds = %for.cond.for.end32_crit_edge.loopexit15, %for.cond.for.end32_crit_edge.loopexit
  br label %for.end32

for.end32:                                        ; preds = %entry, %for.cond.for.end32_crit_edge
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

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv10 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next11, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 1000, %indvars.iv10
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %4 = add nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv10, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next11 = add nsw i64 %indvars.iv10, 1
  %cmp.us = icmp slt i64 %indvars.iv.next11, 1000
  br i1 %cmp.us, label %for.cond2.preheader.us, label %for.cond.for.end12_crit_edge.loopexit

for.cond.for.end12_crit_edge.loopexit:            ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.cond.for.end12_crit_edge

for.cond.for.end12_crit_edge.loopexit7:           ; preds = %for.cond2.preheader.lr.ph
  br label %for.cond.for.end12_crit_edge

for.cond.for.end12_crit_edge:                     ; preds = %for.cond.for.end12_crit_edge.loopexit7, %for.cond.for.end12_crit_edge.loopexit
  br label %for.end12

for.end12:                                        ; preds = %entry, %for.cond.for.end12_crit_edge
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
