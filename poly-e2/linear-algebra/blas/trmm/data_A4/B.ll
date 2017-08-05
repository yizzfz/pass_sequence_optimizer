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
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1000 x double]*
  %arraydecay2 = bitcast i8* %call1 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %alpha, [1000 x double]* %arraydecay, [1200 x double]* %arraydecay2)
  tail call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  tail call fastcc void @kernel_trmm(i32 1000, i32 1200, double %0, [1000 x double]* %arraydecay, [1200 x double]* %arraydecay2)
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
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %arraydecay2)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %m, i32 %n, double* nocapture %alpha, [1000 x double]* nocapture %A, [1200 x double]* nocapture %B) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  br i1 true, label %for.cond1.preheader.lr.ph, label %for.end29

for.cond1.preheader.lr.ph:                        ; preds = %entry
  br i1 true, label %for.cond1.preheader.us.preheader, label %for.cond1.preheader.preheader

for.cond1.preheader.preheader:                    ; preds = %for.cond1.preheader.lr.ph
  br label %for.cond1.preheader

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond11.for.inc27_crit_edge.us
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %for.cond11.for.inc27_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  %0 = add i64 %indvars.iv21, 4294967295
  %cmp21.us = icmp sgt i64 %indvars.iv21, 0
  br i1 %cmp21.us, label %for.inc.lr.ph.us, label %for.end.us

for.end.us.loopexit:                              ; preds = %for.inc.us
  br label %for.end.us

for.end.us:                                       ; preds = %for.end.us.loopexit, %for.inc.us.prol.loopexit, %for.cond1.preheader.us
  %arrayidx10.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv21, i64 %indvars.iv21
  store double 1.000000e+00, double* %arrayidx10.us, align 8
  %1 = trunc i64 %indvars.iv21 to i32
  %sub.us = add i32 %1, 1200
  br i1 true, label %for.inc24.us.prol.loopexit, label %for.inc24.us.prol

for.inc24.us.prol:                                ; preds = %for.end.us
  %rem16.us.prol = srem i32 %sub.us, 1200
  %conv17.us.prol = sitofp i32 %rem16.us.prol to double
  %div19.us.prol = fdiv double %conv17.us.prol, 1.200000e+03
  %arrayidx23.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv21, i64 0
  store double %div19.us.prol, double* %arrayidx23.us.prol, align 8
  br label %for.inc24.us.prol.loopexit

for.inc24.us.prol.loopexit:                       ; preds = %for.inc24.us.prol, %for.end.us
  %indvars.iv12.unr.ph = phi i64 [ 1, %for.inc24.us.prol ], [ 0, %for.end.us ]
  br i1 false, label %for.cond11.for.inc27_crit_edge.us, label %for.inc24.us.preheader

for.inc24.us.preheader:                           ; preds = %for.inc24.us.prol.loopexit
  br label %for.inc24.us

for.inc24.us:                                     ; preds = %for.inc24.us.preheader, %for.inc24.us
  %indvars.iv12 = phi i64 [ %indvars.iv.next13.1, %for.inc24.us ], [ %indvars.iv12.unr.ph, %for.inc24.us.preheader ]
  %2 = trunc i64 %indvars.iv12 to i32
  %add15.us = sub i32 %sub.us, %2
  %rem16.us = srem i32 %add15.us, 1200
  %conv17.us = sitofp i32 %rem16.us to double
  %arrayidx23.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv21, i64 %indvars.iv12
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %3 = trunc i64 %indvars.iv.next13 to i32
  %add15.us.1 = sub i32 %sub.us, %3
  %rem16.us.1 = srem i32 %add15.us.1, 1200
  %conv17.us.1 = sitofp i32 %rem16.us.1 to double
  %div19.us.v.i0.1 = insertelement <2 x double> undef, double %conv17.us, i32 0
  %div19.us.v.i0.2 = insertelement <2 x double> %div19.us.v.i0.1, double %conv17.us.1, i32 1
  %div19.us = fdiv <2 x double> %div19.us.v.i0.2, <double 1.200000e+03, double 1.200000e+03>
  %4 = bitcast double* %arrayidx23.us to <2 x double>*
  store <2 x double> %div19.us, <2 x double>* %4, align 8
  %indvars.iv.next13.1 = add nsw i64 %indvars.iv12, 2
  %exitcond.118 = icmp eq i64 %indvars.iv.next13.1, 1200
  br i1 %exitcond.118, label %for.cond11.for.inc27_crit_edge.us.loopexit, label %for.inc24.us

for.inc.us:                                       ; preds = %for.inc.us.preheader, %for.inc.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc.us ], [ %indvars.iv.unr.ph, %for.inc.us.preheader ]
  %5 = add nuw nsw i64 %indvars.iv, %indvars.iv21
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 1000
  %conv.us = sitofp i32 %rem.us to double
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv21, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %7 = add nuw nsw i64 %indvars.iv.next, %indvars.iv21
  %8 = trunc i64 %7 to i32
  %rem.us.1 = srem i32 %8, 1000
  %conv.us.1 = sitofp i32 %rem.us.1 to double
  %div.us.v.i0.1 = insertelement <2 x double> undef, double %conv.us, i32 0
  %div.us.v.i0.2 = insertelement <2 x double> %div.us.v.i0.1, double %conv.us.1, i32 1
  %div.us = fdiv <2 x double> %div.us.v.i0.2, <double 1.000000e+03, double 1.000000e+03>
  %9 = bitcast double* %arrayidx6.us to <2 x double>*
  store <2 x double> %div.us, <2 x double>* %9, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv21
  br i1 %exitcond.1, label %for.end.us.loopexit, label %for.inc.us

for.inc.lr.ph.us:                                 ; preds = %for.cond1.preheader.us
  %xtraiter39 = and i64 %indvars.iv21, 1
  %lcmp.mod = icmp eq i64 %xtraiter39, 0
  br i1 %lcmp.mod, label %for.inc.us.prol.loopexit, label %for.inc.us.prol

for.inc.us.prol:                                  ; preds = %for.inc.lr.ph.us
  %10 = trunc i64 %indvars.iv21 to i32
  %rem.us.prol = srem i32 %10, 1000
  %conv.us.prol = sitofp i32 %rem.us.prol to double
  %div.us.prol = fdiv double %conv.us.prol, 1.000000e+03
  %arrayidx6.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv21, i64 0
  store double %div.us.prol, double* %arrayidx6.us.prol, align 8
  br label %for.inc.us.prol.loopexit

for.inc.us.prol.loopexit:                         ; preds = %for.inc.us.prol, %for.inc.lr.ph.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.us.prol ], [ 0, %for.inc.lr.ph.us ]
  %11 = trunc i64 %0 to i32
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %for.end.us, label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %for.inc.us.prol.loopexit
  br label %for.inc.us

for.cond11.for.inc27_crit_edge.us.loopexit:       ; preds = %for.inc24.us
  br label %for.cond11.for.inc27_crit_edge.us

for.cond11.for.inc27_crit_edge.us:                ; preds = %for.cond11.for.inc27_crit_edge.us.loopexit, %for.inc24.us.prol.loopexit
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond = icmp eq i64 %indvars.iv.next22, 1000
  br i1 %exitcond, label %for.end29.loopexit, label %for.cond1.preheader.us

for.cond1.preheader:                              ; preds = %for.cond1.preheader.preheader, %for.end
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %for.end ], [ 0, %for.cond1.preheader.preheader ]
  %13 = add i64 %indvars.iv34, 4294967295
  %cmp21 = icmp sgt i64 %indvars.iv34, 0
  br i1 %cmp21, label %for.inc.lr.ph, label %for.end

for.inc.lr.ph:                                    ; preds = %for.cond1.preheader
  %xtraiter3038 = and i64 %indvars.iv34, 1
  %lcmp.mod31 = icmp eq i64 %xtraiter3038, 0
  br i1 %lcmp.mod31, label %for.inc.prol.loopexit, label %for.inc.prol

for.inc.prol:                                     ; preds = %for.inc.lr.ph
  %14 = trunc i64 %indvars.iv34 to i32
  %rem.prol = srem i32 %14, 1000
  %conv.prol = sitofp i32 %rem.prol to double
  %div.prol = fdiv double %conv.prol, 1.000000e+03
  %arrayidx6.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv34, i64 0
  store double %div.prol, double* %arrayidx6.prol, align 8
  br label %for.inc.prol.loopexit

for.inc.prol.loopexit:                            ; preds = %for.inc.prol, %for.inc.lr.ph
  %indvars.iv24.unr.ph = phi i64 [ 1, %for.inc.prol ], [ 0, %for.inc.lr.ph ]
  %15 = trunc i64 %13 to i32
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %for.end, label %for.inc.preheader

for.inc.preheader:                                ; preds = %for.inc.prol.loopexit
  br label %for.inc

for.inc:                                          ; preds = %for.inc.preheader, %for.inc
  %indvars.iv24 = phi i64 [ %indvars.iv.next25.1, %for.inc ], [ %indvars.iv24.unr.ph, %for.inc.preheader ]
  %17 = add nuw nsw i64 %indvars.iv24, %indvars.iv34
  %18 = trunc i64 %17 to i32
  %rem = srem i32 %18, 1000
  %conv = sitofp i32 %rem to double
  %arrayidx6 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv34, i64 %indvars.iv24
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %19 = add nuw nsw i64 %indvars.iv.next25, %indvars.iv34
  %20 = trunc i64 %19 to i32
  %rem.1 = srem i32 %20, 1000
  %conv.1 = sitofp i32 %rem.1 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 1.000000e+03, double 1.000000e+03>
  %21 = bitcast double* %arrayidx6 to <2 x double>*
  store <2 x double> %div, <2 x double>* %21, align 8
  %indvars.iv.next25.1 = add nsw i64 %indvars.iv24, 2
  %exitcond29.1 = icmp eq i64 %indvars.iv.next25.1, %indvars.iv34
  br i1 %exitcond29.1, label %for.end.loopexit, label %for.inc

for.end.loopexit:                                 ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit, %for.inc.prol.loopexit, %for.cond1.preheader
  %arrayidx10 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv34, i64 %indvars.iv34
  store double 1.000000e+00, double* %arrayidx10, align 8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next35, 1000
  br i1 %exitcond37, label %for.end29.loopexit42, label %for.cond1.preheader

for.end29.loopexit:                               ; preds = %for.cond11.for.inc27_crit_edge.us
  br label %for.end29

for.end29.loopexit42:                             ; preds = %for.end
  br label %for.end29

for.end29:                                        ; preds = %for.end29.loopexit42, %for.end29.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(i32 %m, i32 %n, double %alpha, [1000 x double]* nocapture readonly %A, [1200 x double]* nocapture %B) unnamed_addr #2 {
entry:
  br i1 true, label %for.cond1.preheader.us.preheader, label %for.end32

for.cond1.preheader.us.preheader:                 ; preds = %entry
  %0 = insertelement <2 x double> undef, double %alpha, i32 0
  %mul22.us11.v.i1.2 = shufflevector <2 x double> %0, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc30_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv44 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next45, %for.cond1.for.inc30_crit_edge.us ]
  %indvars.iv33 = phi i64 [ 1, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next34, %for.cond1.for.inc30_crit_edge.us ]
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %cmp52.us = icmp slt i64 %indvars.iv.next45, 1000
  br i1 %cmp52.us, label %for.cond4.preheader.us.us.preheader, label %for.cond4.preheader.us23.preheader

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.us
  %1 = sub nsw i64 0, %indvars.iv44
  %2 = trunc i64 %1 to i32
  %3 = add i32 1001, %2
  %xtraiter38 = and i32 %3, 1
  %lcmp.mod39 = icmp eq i32 %xtraiter38, 0
  %4 = sub i32 0, %2
  %5 = icmp eq i32 998, %4
  %arrayidx8.us.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv44
  %indvars.iv.next36.prol = add nuw nsw i64 %indvars.iv33, 1
  br label %for.cond4.preheader.us.us

for.cond4.preheader.us23.preheader:               ; preds = %for.cond1.preheader.us
  br i1 true, label %for.cond4.preheader.us23.prol.loopexit, label %for.cond4.preheader.us23.prol.preheader

for.cond4.preheader.us23.prol.preheader:          ; preds = %for.cond4.preheader.us23.preheader
  br label %for.cond4.preheader.us23.prol

for.cond4.preheader.us23.prol:                    ; preds = %for.cond4.preheader.us23.prol.preheader, %for.cond4.preheader.us23.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.cond4.preheader.us23.prol ], [ 0, %for.cond4.preheader.us23.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.cond4.preheader.us23.prol ], [ 0, %for.cond4.preheader.us23.prol.preheader ]
  %arrayidx21.us10.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv44, i64 %indvars.iv.prol
  %6 = load double, double* %arrayidx21.us10.prol, align 8
  %mul22.us11.prol = fmul double %6, %alpha
  store double %mul22.us11.prol, double* %arrayidx21.us10.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.cond4.preheader.us23.prol.loopexit.loopexit, label %for.cond4.preheader.us23.prol, !llvm.loop !1

for.cond4.preheader.us23.prol.loopexit.loopexit:  ; preds = %for.cond4.preheader.us23.prol
  br label %for.cond4.preheader.us23.prol.loopexit

for.cond4.preheader.us23.prol.loopexit:           ; preds = %for.cond4.preheader.us23.prol.loopexit.loopexit, %for.cond4.preheader.us23.preheader
  %indvars.iv.unr = phi i64 [ 0, %for.cond4.preheader.us23.preheader ], [ %indvars.iv.next.prol, %for.cond4.preheader.us23.prol.loopexit.loopexit ]
  br i1 false, label %for.cond1.for.inc30_crit_edge.us, label %for.cond4.preheader.us23.preheader54

for.cond4.preheader.us23.preheader54:             ; preds = %for.cond4.preheader.us23.prol.loopexit
  %7 = sub i64 1196, %indvars.iv.unr
  %8 = lshr i64 %7, 2
  %9 = and i64 %8, 1
  %lcmp.mod59 = icmp eq i64 %9, 0
  br i1 %lcmp.mod59, label %for.cond4.preheader.us23.prol.preheader56, label %for.cond4.preheader.us23.prol.loopexit57.unr-lcssa

for.cond4.preheader.us23.prol.preheader56:        ; preds = %for.cond4.preheader.us23.preheader54
  br label %for.cond4.preheader.us23.prol60

for.cond4.preheader.us23.prol60:                  ; preds = %for.cond4.preheader.us23.prol.preheader56
  %arrayidx21.us10.prol62 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv44, i64 %indvars.iv.unr
  %10 = bitcast double* %arrayidx21.us10.prol62 to <2 x double>*
  %11 = load <2 x double>, <2 x double>* %10, align 8
  %mul22.us11.prol63 = fmul <2 x double> %11, %mul22.us11.v.i1.2
  store <2 x double> %mul22.us11.prol63, <2 x double>* %10, align 8
  %indvars.iv.next.1.prol = add nsw i64 %indvars.iv.unr, 2
  %arrayidx21.us10.2.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv44, i64 %indvars.iv.next.1.prol
  %12 = bitcast double* %arrayidx21.us10.2.prol to <2 x double>*
  %13 = load <2 x double>, <2 x double>* %12, align 8
  %mul22.us11.2.prol = fmul <2 x double> %13, %mul22.us11.v.i1.2
  store <2 x double> %mul22.us11.2.prol, <2 x double>* %12, align 8
  %indvars.iv.next.3.prol = add nsw i64 %indvars.iv.unr, 4
  br label %for.cond4.preheader.us23.prol.loopexit57.unr-lcssa

for.cond4.preheader.us23.prol.loopexit57.unr-lcssa: ; preds = %for.cond4.preheader.us23.preheader54, %for.cond4.preheader.us23.prol60
  %indvars.iv.unr64.ph = phi i64 [ %indvars.iv.next.3.prol, %for.cond4.preheader.us23.prol60 ], [ %indvars.iv.unr, %for.cond4.preheader.us23.preheader54 ]
  br label %for.cond4.preheader.us23.prol.loopexit57

for.cond4.preheader.us23.prol.loopexit57:         ; preds = %for.cond4.preheader.us23.prol.loopexit57.unr-lcssa
  %14 = icmp eq i64 %8, 0
  br i1 %14, label %for.cond1.for.inc30_crit_edge.us.loopexit55, label %for.cond4.preheader.us23.preheader54.new

for.cond4.preheader.us23.preheader54.new:         ; preds = %for.cond4.preheader.us23.prol.loopexit57
  br label %for.cond4.preheader.us23

for.cond4.preheader.us23:                         ; preds = %for.cond4.preheader.us23, %for.cond4.preheader.us23.preheader54.new
  %indvars.iv = phi i64 [ %indvars.iv.unr64.ph, %for.cond4.preheader.us23.preheader54.new ], [ %indvars.iv.next.3.1, %for.cond4.preheader.us23 ]
  %arrayidx21.us10 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv44, i64 %indvars.iv
  %15 = bitcast double* %arrayidx21.us10 to <2 x double>*
  %16 = load <2 x double>, <2 x double>* %15, align 8
  %mul22.us11 = fmul <2 x double> %16, %mul22.us11.v.i1.2
  store <2 x double> %mul22.us11, <2 x double>* %15, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx21.us10.2 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv44, i64 %indvars.iv.next.1
  %17 = bitcast double* %arrayidx21.us10.2 to <2 x double>*
  %18 = load <2 x double>, <2 x double>* %17, align 8
  %mul22.us11.2 = fmul <2 x double> %18, %mul22.us11.v.i1.2
  store <2 x double> %mul22.us11.2, <2 x double>* %17, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %arrayidx21.us10.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv44, i64 %indvars.iv.next.3
  %19 = bitcast double* %arrayidx21.us10.1 to <2 x double>*
  %20 = load <2 x double>, <2 x double>* %19, align 8
  %mul22.us11.1 = fmul <2 x double> %20, %mul22.us11.v.i1.2
  store <2 x double> %mul22.us11.1, <2 x double>* %19, align 8
  %indvars.iv.next.1.1 = add nsw i64 %indvars.iv, 6
  %arrayidx21.us10.2.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv44, i64 %indvars.iv.next.1.1
  %21 = bitcast double* %arrayidx21.us10.2.1 to <2 x double>*
  %22 = load <2 x double>, <2 x double>* %21, align 8
  %mul22.us11.2.1 = fmul <2 x double> %22, %mul22.us11.v.i1.2
  store <2 x double> %mul22.us11.2.1, <2 x double>* %21, align 8
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next.3.1, 1200
  br i1 %exitcond.3.1, label %for.cond1.for.inc30_crit_edge.us.loopexit55.unr-lcssa, label %for.cond4.preheader.us23

for.cond1.for.inc30_crit_edge.us.loopexit:        ; preds = %for.cond4.for.inc27_crit_edge.us.us
  br label %for.cond1.for.inc30_crit_edge.us

for.cond1.for.inc30_crit_edge.us.loopexit55.unr-lcssa: ; preds = %for.cond4.preheader.us23
  br label %for.cond1.for.inc30_crit_edge.us.loopexit55

for.cond1.for.inc30_crit_edge.us.loopexit55:      ; preds = %for.cond4.preheader.us23.prol.loopexit57, %for.cond1.for.inc30_crit_edge.us.loopexit55.unr-lcssa
  br label %for.cond1.for.inc30_crit_edge.us

for.cond1.for.inc30_crit_edge.us:                 ; preds = %for.cond1.for.inc30_crit_edge.us.loopexit55, %for.cond1.for.inc30_crit_edge.us.loopexit, %for.cond4.preheader.us23.prol.loopexit
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next45, 1000
  br i1 %exitcond47, label %for.end32.loopexit, label %for.cond1.preheader.us

for.cond4.preheader.us.us:                        ; preds = %for.cond4.preheader.us.us.preheader, %for.cond4.for.inc27_crit_edge.us.us
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %for.cond4.for.inc27_crit_edge.us.us ], [ 0, %for.cond4.preheader.us.us.preheader ]
  %arrayidx16.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv44, i64 %indvars.iv41
  br i1 %lcmp.mod39, label %for.inc.us.us.prol.loopexit, label %for.inc.us.us.prol

for.inc.us.us.prol:                               ; preds = %for.cond4.preheader.us.us
  %23 = load double, double* %arrayidx8.us.us.prol, align 8
  %arrayidx12.us.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv33, i64 %indvars.iv41
  %24 = load double, double* %arrayidx12.us.us.prol, align 8
  %mul.us.us.prol = fmul double %23, %24
  %25 = load double, double* %arrayidx16.us.us, align 8
  %add17.us.us.prol = fadd double %25, %mul.us.us.prol
  store double %add17.us.us.prol, double* %arrayidx16.us.us, align 8
  br label %for.inc.us.us.prol.loopexit

for.inc.us.us.prol.loopexit:                      ; preds = %for.inc.us.us.prol, %for.cond4.preheader.us.us
  %indvars.iv35.unr.ph = phi i64 [ %indvars.iv.next36.prol, %for.inc.us.us.prol ], [ %indvars.iv33, %for.cond4.preheader.us.us ]
  br i1 %5, label %for.inc.us.us.prol.loopexit.for.cond4.for.inc27_crit_edge.us.us_crit_edge, label %for.inc.us.us.prol.loopexit.for.inc.us.us_crit_edge

for.inc.us.us.prol.loopexit.for.cond4.for.inc27_crit_edge.us.us_crit_edge: ; preds = %for.inc.us.us.prol.loopexit
  %.pre53 = load double, double* %arrayidx16.us.us, align 8
  br label %for.cond4.for.inc27_crit_edge.us.us

for.inc.us.us.prol.loopexit.for.inc.us.us_crit_edge: ; preds = %for.inc.us.us.prol.loopexit
  %.pre = load double, double* %arrayidx16.us.us, align 8
  br label %for.inc.us.us

for.cond4.for.inc27_crit_edge.us.us.loopexit:     ; preds = %for.inc.us.us
  br label %for.cond4.for.inc27_crit_edge.us.us

for.cond4.for.inc27_crit_edge.us.us:              ; preds = %for.cond4.for.inc27_crit_edge.us.us.loopexit, %for.inc.us.us.prol.loopexit.for.cond4.for.inc27_crit_edge.us.us_crit_edge
  %26 = phi double [ %.pre53, %for.inc.us.us.prol.loopexit.for.cond4.for.inc27_crit_edge.us.us_crit_edge ], [ %add17.us.us.1, %for.cond4.for.inc27_crit_edge.us.us.loopexit ]
  %mul22.us.us = fmul double %26, %alpha
  store double %mul22.us.us, double* %arrayidx16.us.us, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond = icmp eq i64 %indvars.iv.next42, 1200
  br i1 %exitcond, label %for.cond1.for.inc30_crit_edge.us.loopexit, label %for.cond4.preheader.us.us

for.inc.us.us:                                    ; preds = %for.inc.us.us.prol.loopexit.for.inc.us.us_crit_edge, %for.inc.us.us
  %27 = phi double [ %add17.us.us.1, %for.inc.us.us ], [ %.pre, %for.inc.us.us.prol.loopexit.for.inc.us.us_crit_edge ]
  %indvars.iv35 = phi i64 [ %indvars.iv.next36.1, %for.inc.us.us ], [ %indvars.iv35.unr.ph, %for.inc.us.us.prol.loopexit.for.inc.us.us_crit_edge ]
  %arrayidx8.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv35, i64 %indvars.iv44
  %28 = load double, double* %arrayidx8.us.us, align 8
  %arrayidx12.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv35, i64 %indvars.iv41
  %29 = load double, double* %arrayidx12.us.us, align 8
  %mul.us.us = fmul double %28, %29
  %add17.us.us = fadd double %27, %mul.us.us
  store double %add17.us.us, double* %arrayidx16.us.us, align 8
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %arrayidx8.us.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next36, i64 %indvars.iv44
  %30 = load double, double* %arrayidx8.us.us.1, align 8
  %arrayidx12.us.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv.next36, i64 %indvars.iv41
  %31 = load double, double* %arrayidx12.us.us.1, align 8
  %mul.us.us.1 = fmul double %30, %31
  %add17.us.us.1 = fadd double %add17.us.us, %mul.us.us.1
  store double %add17.us.us.1, double* %arrayidx16.us.us, align 8
  %indvars.iv.next36.1 = add nsw i64 %indvars.iv35, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next36.1, 1000
  br i1 %exitcond.1, label %for.cond4.for.inc27_crit_edge.us.us.loopexit, label %for.inc.us.us

for.end32.loopexit:                               ; preds = %for.cond1.for.inc30_crit_edge.us
  br label %for.end32

for.end32:                                        ; preds = %for.end32.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %m, i32 %n, [1200 x double]* nocapture readonly %B) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br i1 true, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv8 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next9, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv8, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %4 = add nsw i64 %indvars.iv, %3
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
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv8, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next9, 1000
  br i1 %exitcond12, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
