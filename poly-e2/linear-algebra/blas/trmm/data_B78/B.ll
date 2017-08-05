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
  %0 = bitcast i8* %call to [1000 x double]*
  %.cast = bitcast i8* %call1 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %alpha, [1000 x double]* %0, [1200 x double]* %.cast)
  call void (...) @polybench_timer_start() #3
  %1 = load double, double* %alpha, align 8
  call fastcc void @kernel_trmm(i32 1000, i32 1200, double %1, [1000 x double]* %0, [1200 x double]* %.cast)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %2, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %3 = bitcast i8* %call1 to [1200 x double]*
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %3)
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
  br i1 true, label %for.body.lr.ph, label %for.end29

for.body.lr.ph:                                   ; preds = %entry
  br i1 true, label %for.body.us.preheader, label %for.body.preheader

for.body.preheader:                               ; preds = %for.body.lr.ph
  br label %for.body

for.body.us.preheader:                            ; preds = %for.body.lr.ph
  br label %for.body.us

for.body.us:                                      ; preds = %for.body.us.preheader, %for.cond11.for.inc27_crit_edge.us
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %for.cond11.for.inc27_crit_edge.us ], [ 0, %for.body.us.preheader ]
  %0 = add nuw i64 %indvars.iv24, 4294967295
  %cmp21.us = icmp sgt i64 %indvars.iv24, 0
  %1 = trunc i64 %indvars.iv24 to i32
  br i1 %cmp21.us, label %for.inc.lr.ph.us, label %for.end.us

for.end.us.loopexit:                              ; preds = %for.inc.us
  br label %for.end.us

for.end.us:                                       ; preds = %for.end.us.loopexit, %for.body.us, %for.inc.us.prol.loopexit.unr-lcssa
  %arrayidx10.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv24, i64 %indvars.iv24
  store double 1.000000e+00, double* %arrayidx10.us, align 8
  %sub.us = add i32 %1, 1200
  br i1 true, label %for.inc24.us.prol.loopexit.unr-lcssa, label %for.inc24.us.prol.preheader

for.inc24.us.prol.preheader:                      ; preds = %for.end.us
  %rem16.us.prol = srem i32 %sub.us, 1200
  %conv17.us.prol = sitofp i32 %rem16.us.prol to double
  %div19.us.prol = fdiv double %conv17.us.prol, 1.200000e+03
  %arrayidx23.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv24, i64 0
  store double %div19.us.prol, double* %arrayidx23.us.prol, align 8
  br label %for.inc24.us.prol.loopexit.unr-lcssa

for.inc24.us.prol.loopexit.unr-lcssa:             ; preds = %for.end.us, %for.inc24.us.prol.preheader
  %indvars.iv15.unr.ph = phi i64 [ 1, %for.inc24.us.prol.preheader ], [ 0, %for.end.us ]
  br i1 false, label %for.cond11.for.inc27_crit_edge.us, label %for.inc24.us.preheader

for.inc24.us.preheader:                           ; preds = %for.inc24.us.prol.loopexit.unr-lcssa
  br label %for.inc24.us

for.inc24.us:                                     ; preds = %for.inc24.us.preheader, %for.inc24.us
  %indvars.iv15 = phi i64 [ %indvars.iv.next16.1, %for.inc24.us ], [ %indvars.iv15.unr.ph, %for.inc24.us.preheader ]
  %2 = trunc i64 %indvars.iv15 to i32
  %add15.us = sub i32 %sub.us, %2
  %rem16.us = srem i32 %add15.us, 1200
  %conv17.us = sitofp i32 %rem16.us to double
  %arrayidx23.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv24, i64 %indvars.iv15
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %3 = trunc i64 %indvars.iv.next16 to i32
  %add15.us.1 = sub i32 %sub.us, %3
  %rem16.us.1 = srem i32 %add15.us.1, 1200
  %conv17.us.1 = sitofp i32 %rem16.us.1 to double
  %div19.us.v.i0.1 = insertelement <2 x double> undef, double %conv17.us, i32 0
  %div19.us.v.i0.2 = insertelement <2 x double> %div19.us.v.i0.1, double %conv17.us.1, i32 1
  %div19.us = fdiv <2 x double> %div19.us.v.i0.2, <double 1.200000e+03, double 1.200000e+03>
  %4 = bitcast double* %arrayidx23.us to <2 x double>*
  store <2 x double> %div19.us, <2 x double>* %4, align 8
  %indvars.iv.next16.1 = add nuw nsw i64 %indvars.iv15, 2
  %exitcond.121 = icmp eq i64 %indvars.iv.next16.1, 1200
  br i1 %exitcond.121, label %for.cond11.for.inc27_crit_edge.us.loopexit, label %for.inc24.us

for.inc.us:                                       ; preds = %for.inc.us.preheader, %for.inc.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc.us ], [ %indvars.iv.unr.ph, %for.inc.us.preheader ]
  %5 = add nuw nsw i64 %indvars.iv, %indvars.iv24
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 1000
  %conv.us = sitofp i32 %rem.us to double
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv24, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %7 = add nuw nsw i64 %indvars.iv.next, %indvars.iv24
  %8 = trunc i64 %7 to i32
  %rem.us.1 = srem i32 %8, 1000
  %conv.us.1 = sitofp i32 %rem.us.1 to double
  %div.us.v.i0.1 = insertelement <2 x double> undef, double %conv.us, i32 0
  %div.us.v.i0.2 = insertelement <2 x double> %div.us.v.i0.1, double %conv.us.1, i32 1
  %div.us = fdiv <2 x double> %div.us.v.i0.2, <double 1.000000e+03, double 1.000000e+03>
  %9 = bitcast double* %arrayidx6.us to <2 x double>*
  store <2 x double> %div.us, <2 x double>* %9, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv24
  br i1 %exitcond.1, label %for.end.us.loopexit, label %for.inc.us

for.inc.lr.ph.us:                                 ; preds = %for.body.us
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %for.inc.us.prol.loopexit.unr-lcssa, label %for.inc.us.prol.preheader

for.inc.us.prol.preheader:                        ; preds = %for.inc.lr.ph.us
  %rem.us.prol = srem i32 %1, 1000
  %conv.us.prol = sitofp i32 %rem.us.prol to double
  %div.us.prol = fdiv double %conv.us.prol, 1.000000e+03
  %arrayidx6.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv24, i64 0
  store double %div.us.prol, double* %arrayidx6.us.prol, align 8
  br label %for.inc.us.prol.loopexit.unr-lcssa

for.inc.us.prol.loopexit.unr-lcssa:               ; preds = %for.inc.lr.ph.us, %for.inc.us.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.us.prol.preheader ], [ 0, %for.inc.lr.ph.us ]
  %10 = trunc i64 %0 to i32
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %for.end.us, label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %for.inc.us.prol.loopexit.unr-lcssa
  br label %for.inc.us

for.cond11.for.inc27_crit_edge.us.loopexit:       ; preds = %for.inc24.us
  br label %for.cond11.for.inc27_crit_edge.us

for.cond11.for.inc27_crit_edge.us:                ; preds = %for.cond11.for.inc27_crit_edge.us.loopexit, %for.inc24.us.prol.loopexit.unr-lcssa
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond = icmp eq i64 %indvars.iv.next25, 1000
  br i1 %exitcond, label %for.end29.loopexit, label %for.body.us

for.body:                                         ; preds = %for.body.preheader, %for.end
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %for.end ], [ 0, %for.body.preheader ]
  %12 = add nuw i64 %indvars.iv37, 4294967295
  %cmp21 = icmp sgt i64 %indvars.iv37, 0
  br i1 %cmp21, label %for.inc.lr.ph, label %for.end

for.inc.lr.ph:                                    ; preds = %for.body
  %13 = trunc i64 %indvars.iv37 to i32
  %xtraiter33 = and i32 %13, 1
  %lcmp.mod34 = icmp eq i32 %xtraiter33, 0
  br i1 %lcmp.mod34, label %for.inc.prol.loopexit.unr-lcssa, label %for.inc.prol.preheader

for.inc.prol.preheader:                           ; preds = %for.inc.lr.ph
  %rem.prol = srem i32 %13, 1000
  %conv.prol = sitofp i32 %rem.prol to double
  %div.prol = fdiv double %conv.prol, 1.000000e+03
  %arrayidx6.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv37, i64 0
  store double %div.prol, double* %arrayidx6.prol, align 8
  br label %for.inc.prol.loopexit.unr-lcssa

for.inc.prol.loopexit.unr-lcssa:                  ; preds = %for.inc.lr.ph, %for.inc.prol.preheader
  %indvars.iv27.unr.ph = phi i64 [ 1, %for.inc.prol.preheader ], [ 0, %for.inc.lr.ph ]
  %14 = trunc i64 %12 to i32
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %for.end, label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.inc.prol.loopexit.unr-lcssa
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %indvars.iv27 = phi i64 [ %indvars.iv.next28.1, %for.inc ], [ %indvars.iv27.unr.ph, %for.inc.preheader ]
  %16 = add nuw nsw i64 %indvars.iv27, %indvars.iv37
  %17 = trunc i64 %16 to i32
  %rem = srem i32 %17, 1000
  %conv = sitofp i32 %rem to double
  %arrayidx6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv27
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %18 = add nuw nsw i64 %indvars.iv.next28, %indvars.iv37
  %19 = trunc i64 %18 to i32
  %rem.1 = srem i32 %19, 1000
  %conv.1 = sitofp i32 %rem.1 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 1.000000e+03, double 1.000000e+03>
  %20 = bitcast double* %arrayidx6 to <2 x double>*
  store <2 x double> %div, <2 x double>* %20, align 8
  %indvars.iv.next28.1 = add nuw nsw i64 %indvars.iv27, 2
  %exitcond32.1 = icmp eq i64 %indvars.iv.next28.1, %indvars.iv37
  br i1 %exitcond32.1, label %for.end.loopexit, label %for.inc

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.inc.prol.loopexit.unr-lcssa, %for.body
  %arrayidx10 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv37, i64 %indvars.iv37
  store double 1.000000e+00, double* %arrayidx10, align 8
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next38, 1000
  br i1 %exitcond40, label %for.end29.loopexit44, label %for.body

for.end29.loopexit:                               ; preds = %for.cond11.for.inc27_crit_edge.us
  br label %for.end29

for.end29.loopexit44:                             ; preds = %for.end
  br label %for.end29

for.end29:                                        ; preds = %for.end29.loopexit44, %for.end29.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_trmm(i32 %m, i32 %n, double %alpha, [1000 x double]* %A, [1200 x double]* %B) unnamed_addr #0 {
entry:
  br i1 true, label %for.body.us.preheader, label %for.end32

for.body.us.preheader:                            ; preds = %entry
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond1.for.inc30_crit_edge.us, %for.body.us.preheader
  %indvars.iv = phi i64 [ 1, %for.body.us.preheader ], [ %2, %for.cond1.for.inc30_crit_edge.us ]
  %indvars.iv25 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next26, %for.cond1.for.inc30_crit_edge.us ]
  %0 = trunc i64 %indvars.iv25 to i32
  %1 = sub i32 1001, %0
  %2 = add nuw nsw i64 %indvars.iv, 1
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %xtraiter = and i32 %1, 1
  %arrayidx8.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv, i64 %indvars.iv25
  %3 = icmp slt i64 %indvars.iv.next26, 1000
  %4 = icmp eq i32 %xtraiter, 0
  %5 = icmp eq i32 998, %0
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.inc27.us, %for.body.us
  %indvars.iv21 = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next22, %for.inc27.us ]
  %arrayidx16.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv25, i64 %indvars.iv21
  %.pre = load double, double* %arrayidx16.us, align 8
  br i1 %3, label %for.inc.lr.ph.us, label %for.inc27.us

for.inc27.us.loopexit:                            ; preds = %for.inc.us
  br label %for.inc27.us

for.inc27.us:                                     ; preds = %for.inc27.us.loopexit, %for.body3.us, %for.inc.us.prol.loopexit.unr-lcssa
  %6 = phi double [ %add17.us.lcssa.unr.ph, %for.inc.us.prol.loopexit.unr-lcssa ], [ %.pre, %for.body3.us ], [ %add17.us.1, %for.inc27.us.loopexit ]
  %mul22.us = fmul double %6, %alpha
  store double %mul22.us, double* %arrayidx16.us, align 8
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond = icmp eq i64 %indvars.iv.next22, 1200
  br i1 %exitcond, label %for.cond1.for.inc30_crit_edge.us, label %for.body3.us

for.inc.us:                                       ; preds = %for.inc.us.preheader, %for.inc.us
  %indvars.iv17 = phi i64 [ %indvars.iv.next18.1, %for.inc.us ], [ %indvars.iv17.unr.ph, %for.inc.us.preheader ]
  %7 = phi double [ %add17.us.1, %for.inc.us ], [ %.unr.ph, %for.inc.us.preheader ]
  %arrayidx8.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv17, i64 %indvars.iv25
  %8 = load double, double* %arrayidx8.us, align 8
  %arrayidx12.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv17, i64 %indvars.iv21
  %9 = load double, double* %arrayidx12.us, align 8
  %mul.us = fmul double %8, %9
  %add17.us = fadd double %mul.us, %7
  store double %add17.us, double* %arrayidx16.us, align 8
  %indvars.iv.next18 = add nsw i64 %indvars.iv17, 1
  %arrayidx8.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next18, i64 %indvars.iv25
  %10 = load double, double* %arrayidx8.us.1, align 8
  %arrayidx12.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv.next18, i64 %indvars.iv21
  %11 = load double, double* %arrayidx12.us.1, align 8
  %mul.us.1 = fmul double %10, %11
  %add17.us.1 = fadd double %mul.us.1, %add17.us
  store double %add17.us.1, double* %arrayidx16.us, align 8
  %indvars.iv.next18.1 = add nsw i64 %indvars.iv17, 2
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next18.1 to i32
  %exitcond.1 = icmp eq i32 %lftr.wideiv.1, 1000
  br i1 %exitcond.1, label %for.inc27.us.loopexit, label %for.inc.us

for.inc.lr.ph.us:                                 ; preds = %for.body3.us
  br i1 %4, label %for.inc.us.prol.loopexit.unr-lcssa, label %for.inc.us.prol.preheader

for.inc.us.prol.preheader:                        ; preds = %for.inc.lr.ph.us
  %12 = load double, double* %arrayidx8.us.prol, align 8
  %arrayidx12.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv, i64 %indvars.iv21
  %13 = load double, double* %arrayidx12.us.prol, align 8
  %mul.us.prol = fmul double %12, %13
  %add17.us.prol = fadd double %mul.us.prol, %.pre
  store double %add17.us.prol, double* %arrayidx16.us, align 8
  br label %for.inc.us.prol.loopexit.unr-lcssa

for.inc.us.prol.loopexit.unr-lcssa:               ; preds = %for.inc.lr.ph.us, %for.inc.us.prol.preheader
  %indvars.iv17.unr.ph = phi i64 [ %2, %for.inc.us.prol.preheader ], [ %indvars.iv, %for.inc.lr.ph.us ]
  %.unr.ph = phi double [ %add17.us.prol, %for.inc.us.prol.preheader ], [ %.pre, %for.inc.lr.ph.us ]
  %add17.us.lcssa.unr.ph = phi double [ %add17.us.prol, %for.inc.us.prol.preheader ], [ undef, %for.inc.lr.ph.us ]
  br i1 %5, label %for.inc27.us, label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %for.inc.us.prol.loopexit.unr-lcssa
  br label %for.inc.us

for.cond1.for.inc30_crit_edge.us:                 ; preds = %for.inc27.us
  %exitcond28 = icmp eq i64 %indvars.iv.next26, 1000
  br i1 %exitcond28, label %for.end32.loopexit, label %for.body.us

for.end32.loopexit:                               ; preds = %for.cond1.for.inc30_crit_edge.us
  br label %for.end32

for.end32:                                        ; preds = %for.end32.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %m, i32 %n, [1200 x double]* %B) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br i1 true, label %for.body.us.preheader, label %for.end12

for.body.us.preheader:                            ; preds = %entry
  br label %for.body.us

for.body.us:                                      ; preds = %for.cond2.for.inc10_crit_edge.us, %for.body.us.preheader
  %indvars.iv9 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next10, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 1000, %indvars.iv9
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.body.us
  %indvars.iv = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next, %for.inc.us ]
  %4 = add nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #4
  br label %for.inc.us

for.inc.us:                                       ; preds = %if.then.us, %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv9, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next10, 1000
  br i1 %exitcond13, label %for.end12.loopexit, label %for.body.us

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #4
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
