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

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %m, i32 %n, double* nocapture %alpha, [1000 x double]* nocapture %A, [1200 x double]* nocapture %B) unnamed_addr #2 {
for.cond1.preheader.us.preheader:
  store double 1.500000e+00, double* %alpha, align 8
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond11.for.inc27_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv21 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next22, %for.cond11.for.inc27_crit_edge.us ]
  %0 = add i64 %indvars.iv21, 4294967295
  %cmp21.us = icmp sgt i64 %indvars.iv21, 0
  br i1 %cmp21.us, label %for.inc.lr.ph.us, label %for.end.us.new

for.end.us.new.loopexit:                          ; preds = %for.inc.us
  br label %for.end.us.new

for.end.us.new:                                   ; preds = %for.end.us.new.loopexit, %for.inc.us.prol.loopexit, %for.cond1.preheader.us
  %arrayidx10.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv21, i64 %indvars.iv21
  store double 1.000000e+00, double* %arrayidx10.us, align 8
  %1 = trunc i64 %indvars.iv21 to i32
  %sub.us = add i32 %1, 1200
  br label %for.inc24.us

for.inc24.us:                                     ; preds = %for.inc24.us, %for.end.us.new
  %indvars.iv12 = phi i64 [ 0, %for.end.us.new ], [ %indvars.iv.next13.1, %for.inc24.us ]
  %2 = trunc i64 %indvars.iv12 to i32
  %add15.us = sub i32 %sub.us, %2
  %rem16.us = srem i32 %add15.us, 1200
  %conv17.us = sitofp i32 %rem16.us to double
  %arrayidx23.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv21, i64 %indvars.iv12
  %3 = or i32 %2, 1
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
  br i1 %exitcond.118, label %for.cond11.for.inc27_crit_edge.us, label %for.inc24.us

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
  br i1 %exitcond.1, label %for.end.us.new.loopexit, label %for.inc.us

for.inc.lr.ph.us:                                 ; preds = %for.cond1.preheader.us
  %xtraiter38 = and i64 %indvars.iv21, 1
  %lcmp.mod = icmp eq i64 %xtraiter38, 0
  br i1 %lcmp.mod, label %for.inc.us.prol.loopexit, label %for.inc.us.prol

for.inc.us.prol:                                  ; preds = %for.inc.lr.ph.us
  %10 = trunc i64 %indvars.iv21 to i32
  %rem.us.prol = srem i32 %10, 1000
  %conv.us.prol = sitofp i32 %rem.us.prol to double
  %div.us.prol = fdiv double %conv.us.prol, 1.000000e+03
  %arrayidx6.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv21, i64 0
  store double %div.us.prol, double* %arrayidx6.us.prol, align 8
  br label %for.inc.us.prol.loopexit

for.inc.us.prol.loopexit:                         ; preds = %for.inc.lr.ph.us, %for.inc.us.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.us.prol ], [ 0, %for.inc.lr.ph.us ]
  %11 = trunc i64 %0 to i32
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %for.end.us.new, label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %for.inc.us.prol.loopexit
  br label %for.inc.us

for.cond11.for.inc27_crit_edge.us:                ; preds = %for.inc24.us
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond = icmp eq i64 %indvars.iv.next22, 1000
  br i1 %exitcond, label %for.end29, label %for.cond1.preheader.us

for.end29:                                        ; preds = %for.cond11.for.inc27_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(i32 %m, i32 %n, double %alpha, [1000 x double]* nocapture readonly %A, [1200 x double]* nocapture %B) unnamed_addr #2 {
for.cond1.preheader.us.preheader:
  %0 = insertelement <2 x double> undef, double %alpha, i32 0
  %mul22.us13.v.i1.2 = shufflevector <2 x double> %0, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc30_crit_edge.us.for.cond1.preheader.us_crit_edge, %for.cond1.preheader.us.preheader
  %indvars.iv44 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next45, %for.cond1.for.inc30_crit_edge.us.for.cond1.preheader.us_crit_edge ]
  %indvars.iv33 = phi i64 [ 1, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next34, %for.cond1.for.inc30_crit_edge.us.for.cond1.preheader.us_crit_edge ]
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %cmp52.us = icmp slt i64 %indvars.iv.next45, 1000
  br i1 %cmp52.us, label %for.cond4.preheader.us.us.preheader, label %for.cond4.preheader.us8.preheader

for.cond4.preheader.us8.preheader:                ; preds = %for.cond1.preheader.us
  br label %for.cond4.preheader.us8

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.us
  %1 = sub nsw i64 0, %indvars.iv44
  %2 = trunc i64 %1 to i32
  %3 = and i64 %indvars.iv44, 1
  %lcmp.mod39 = icmp eq i64 %3, 0
  %arrayidx8.us.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv33, i64 %indvars.iv44
  %indvars.iv.next36.prol = add nuw nsw i64 %indvars.iv33, 1
  %4 = icmp eq i32 %2, -998
  br label %for.cond4.preheader.us.us

for.cond4.preheader.us8:                          ; preds = %for.cond4.preheader.us8, %for.cond4.preheader.us8.preheader
  %indvars.iv = phi i64 [ 0, %for.cond4.preheader.us8.preheader ], [ %indvars.iv.next.3.1, %for.cond4.preheader.us8 ]
  %arrayidx21.us12 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv44, i64 %indvars.iv
  %5 = bitcast double* %arrayidx21.us12 to <2 x double>*
  %6 = load <2 x double>, <2 x double>* %5, align 8
  %mul22.us13 = fmul <2 x double> %6, %mul22.us13.v.i1.2
  store <2 x double> %mul22.us13, <2 x double>* %5, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %arrayidx21.us12.2 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv44, i64 %indvars.iv.next.1
  %7 = bitcast double* %arrayidx21.us12.2 to <2 x double>*
  %8 = load <2 x double>, <2 x double>* %7, align 8
  %mul22.us13.2 = fmul <2 x double> %8, %mul22.us13.v.i1.2
  store <2 x double> %mul22.us13.2, <2 x double>* %7, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %arrayidx21.us12.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv44, i64 %indvars.iv.next.3
  %9 = bitcast double* %arrayidx21.us12.1 to <2 x double>*
  %10 = load <2 x double>, <2 x double>* %9, align 8
  %mul22.us13.1 = fmul <2 x double> %10, %mul22.us13.v.i1.2
  store <2 x double> %mul22.us13.1, <2 x double>* %9, align 8
  %indvars.iv.next.1.1 = or i64 %indvars.iv, 6
  %arrayidx21.us12.2.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv44, i64 %indvars.iv.next.1.1
  %11 = bitcast double* %arrayidx21.us12.2.1 to <2 x double>*
  %12 = load <2 x double>, <2 x double>* %11, align 8
  %mul22.us13.2.1 = fmul <2 x double> %12, %mul22.us13.v.i1.2
  store <2 x double> %mul22.us13.2.1, <2 x double>* %11, align 8
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next.3.1, 1200
  br i1 %exitcond.3.1, label %for.cond1.for.inc30_crit_edge.us.loopexit52, label %for.cond4.preheader.us8

for.cond1.for.inc30_crit_edge.us.loopexit:        ; preds = %for.cond4.for.inc27_crit_edge.us.us
  br label %for.cond1.for.inc30_crit_edge.us

for.cond1.for.inc30_crit_edge.us.loopexit52:      ; preds = %for.cond4.preheader.us8
  br label %for.cond1.for.inc30_crit_edge.us

for.cond1.for.inc30_crit_edge.us:                 ; preds = %for.cond1.for.inc30_crit_edge.us.loopexit52, %for.cond1.for.inc30_crit_edge.us.loopexit
  %exitcond47 = icmp eq i64 %indvars.iv.next45, 1000
  br i1 %exitcond47, label %for.end32, label %for.cond1.for.inc30_crit_edge.us.for.cond1.preheader.us_crit_edge

for.cond1.for.inc30_crit_edge.us.for.cond1.preheader.us_crit_edge: ; preds = %for.cond1.for.inc30_crit_edge.us
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  br label %for.cond1.preheader.us

for.cond4.preheader.us.us:                        ; preds = %for.cond4.for.inc27_crit_edge.us.us, %for.cond4.preheader.us.us.preheader
  %indvars.iv41 = phi i64 [ 0, %for.cond4.preheader.us.us.preheader ], [ %indvars.iv.next42, %for.cond4.for.inc27_crit_edge.us.us ]
  %arrayidx16.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv44, i64 %indvars.iv41
  br i1 %lcmp.mod39, label %for.inc.us.us.prol, label %for.inc.us.us.prol.loopexit

for.inc.us.us.prol:                               ; preds = %for.cond4.preheader.us.us
  %13 = load double, double* %arrayidx8.us.us.prol, align 8
  %arrayidx12.us.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv33, i64 %indvars.iv41
  %14 = load double, double* %arrayidx12.us.us.prol, align 8
  %mul.us.us.prol = fmul double %13, %14
  %15 = load double, double* %arrayidx16.us.us, align 8
  %add17.us.us.prol = fadd double %15, %mul.us.us.prol
  store double %add17.us.us.prol, double* %arrayidx16.us.us, align 8
  br label %for.inc.us.us.prol.loopexit

for.inc.us.us.prol.loopexit:                      ; preds = %for.cond4.preheader.us.us, %for.inc.us.us.prol
  %indvars.iv35.unr.ph = phi i64 [ %indvars.iv.next36.prol, %for.inc.us.us.prol ], [ %indvars.iv33, %for.cond4.preheader.us.us ]
  br i1 %4, label %for.inc.us.us.prol.loopexit.for.cond4.for.inc27_crit_edge.us.us_crit_edge, label %for.inc.us.us.prol.loopexit.for.inc.us.us_crit_edge

for.inc.us.us.prol.loopexit.for.cond4.for.inc27_crit_edge.us.us_crit_edge: ; preds = %for.inc.us.us.prol.loopexit
  %.pre51 = load double, double* %arrayidx16.us.us, align 8
  br label %for.cond4.for.inc27_crit_edge.us.us

for.inc.us.us.prol.loopexit.for.inc.us.us_crit_edge: ; preds = %for.inc.us.us.prol.loopexit
  %.pre = load double, double* %arrayidx16.us.us, align 8
  br label %for.inc.us.us

for.cond4.for.inc27_crit_edge.us.us.loopexit:     ; preds = %for.inc.us.us
  br label %for.cond4.for.inc27_crit_edge.us.us

for.cond4.for.inc27_crit_edge.us.us:              ; preds = %for.cond4.for.inc27_crit_edge.us.us.loopexit, %for.inc.us.us.prol.loopexit.for.cond4.for.inc27_crit_edge.us.us_crit_edge
  %16 = phi double [ %.pre51, %for.inc.us.us.prol.loopexit.for.cond4.for.inc27_crit_edge.us.us_crit_edge ], [ %add17.us.us.1, %for.cond4.for.inc27_crit_edge.us.us.loopexit ]
  %mul22.us.us = fmul double %16, %alpha
  store double %mul22.us.us, double* %arrayidx16.us.us, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond = icmp eq i64 %indvars.iv.next42, 1200
  br i1 %exitcond, label %for.cond1.for.inc30_crit_edge.us.loopexit, label %for.cond4.preheader.us.us

for.inc.us.us:                                    ; preds = %for.inc.us.us.prol.loopexit.for.inc.us.us_crit_edge, %for.inc.us.us
  %17 = phi double [ %.pre, %for.inc.us.us.prol.loopexit.for.inc.us.us_crit_edge ], [ %add17.us.us.1, %for.inc.us.us ]
  %indvars.iv35 = phi i64 [ %indvars.iv35.unr.ph, %for.inc.us.us.prol.loopexit.for.inc.us.us_crit_edge ], [ %indvars.iv.next36.1, %for.inc.us.us ]
  %arrayidx8.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv35, i64 %indvars.iv44
  %18 = load double, double* %arrayidx8.us.us, align 8
  %arrayidx12.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv35, i64 %indvars.iv41
  %19 = load double, double* %arrayidx12.us.us, align 8
  %mul.us.us = fmul double %18, %19
  %add17.us.us = fadd double %17, %mul.us.us
  store double %add17.us.us, double* %arrayidx16.us.us, align 8
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %arrayidx8.us.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv.next36, i64 %indvars.iv44
  %20 = load double, double* %arrayidx8.us.us.1, align 8
  %arrayidx12.us.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %B, i64 %indvars.iv.next36, i64 %indvars.iv41
  %21 = load double, double* %arrayidx12.us.us.1, align 8
  %mul.us.us.1 = fmul double %20, %21
  %add17.us.us.1 = fadd double %add17.us.us, %mul.us.us.1
  store double %add17.us.us.1, double* %arrayidx16.us.us, align 8
  %indvars.iv.next36.1 = add nsw i64 %indvars.iv35, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next36.1, 1000
  br i1 %exitcond.1, label %for.cond4.for.inc27_crit_edge.us.us.loopexit, label %for.inc.us.us

for.end32:                                        ; preds = %for.cond1.for.inc30_crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %m, i32 %n, [1200 x double]* nocapture readonly %B) unnamed_addr #0 {
for.cond2.preheader.us.preheader:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
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

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
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
  br i1 %exitcond12, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
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
