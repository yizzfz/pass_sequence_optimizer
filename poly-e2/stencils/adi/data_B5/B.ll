; ModuleID = 'A.ll'
source_filename = "adi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1000 x double]*
  tail call void @init_array(i32 1000, [1000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay5 = bitcast i8* %call1 to [1000 x double]*
  %arraydecay6 = bitcast i8* %call2 to [1000 x double]*
  %arraydecay7 = bitcast i8* %call3 to [1000 x double]*
  tail call void @kernel_adi(i32 500, i32 1000, [1000 x double]* %arraydecay, [1000 x double]* %arraydecay5, [1000 x double]* %arraydecay6, [1000 x double]* %arraydecay7)
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
  %1 = bitcast i8* %call to [1000 x double]*
  tail call void @print_array(i32 1000, [1000 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true.if.end_crit_edge, %entry.if.end_crit_edge, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32 %n, [1000 x double]* nocapture %u) #2 {
entry:
  %cmp3 = icmp sgt i32 %n, 0
  br i1 %cmp3, label %for.cond1.preheader.lr.ph, label %entry.for.end9_crit_edge

entry.for.end9_crit_edge:                         ; preds = %entry
  br label %for.end9

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %conv4 = sitofp i32 %n to double
  %0 = sext i32 %n to i64
  %xtraiter = and i32 %n, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %1 = icmp eq i32 %n, 1
  %wide.trip.count9 = zext i32 %n to i64
  %wide.trip.count.1 = zext i32 %n to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.inc7.us.for.cond1.preheader.us_crit_edge, %for.cond1.preheader.lr.ph
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %for.inc7.us.for.cond1.preheader.us_crit_edge ], [ 0, %for.cond1.preheader.lr.ph ]
  %2 = add nsw i64 %indvars.iv6, %0
  br i1 %lcmp.mod, label %for.cond1.preheader.us.for.body3.us.prol.loopexit_crit_edge, label %for.body3.us.prol

for.cond1.preheader.us.for.body3.us.prol.loopexit_crit_edge: ; preds = %for.cond1.preheader.us
  br label %for.body3.us.prol.loopexit

for.body3.us.prol:                                ; preds = %for.cond1.preheader.us
  %3 = trunc i64 %2 to i32
  %conv.us.prol = sitofp i32 %3 to double
  %div.us.prol = fdiv double %conv.us.prol, %conv4
  %arrayidx6.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv6, i64 0
  store double %div.us.prol, double* %arrayidx6.us.prol, align 8
  br label %for.body3.us.prol.loopexit

for.body3.us.prol.loopexit:                       ; preds = %for.cond1.preheader.us.for.body3.us.prol.loopexit_crit_edge, %for.body3.us.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body3.us.prol ], [ 0, %for.cond1.preheader.us.for.body3.us.prol.loopexit_crit_edge ]
  br i1 %1, label %for.body3.us.prol.loopexit.for.inc7.us_crit_edge, label %for.body3.us.preheader

for.body3.us.prol.loopexit.for.inc7.us_crit_edge: ; preds = %for.body3.us.prol.loopexit
  br label %for.inc7.us

for.body3.us.preheader:                           ; preds = %for.body3.us.prol.loopexit
  %4 = trunc i64 %2 to i32
  %5 = trunc i64 %2 to i32
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.for.body3.us_crit_edge, %for.body3.us.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body3.us.for.body3.us_crit_edge ], [ %indvars.iv.unr.ph, %for.body3.us.preheader ]
  %6 = trunc i64 %indvars.iv to i32
  %sub.us = sub i32 %4, %6
  %conv.us = sitofp i32 %sub.us to double
  %div.us = fdiv double %conv.us, %conv4
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv6, i64 %indvars.iv
  store double %div.us, double* %arrayidx6.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %7 = trunc i64 %indvars.iv.next to i32
  %sub.us.1 = sub i32 %5, %7
  %conv.us.1 = sitofp i32 %sub.us.1 to double
  %div.us.1 = fdiv double %conv.us.1, %conv4
  %arrayidx6.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv6, i64 %indvars.iv.next
  store double %div.us.1, double* %arrayidx6.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.body3.us.for.inc7.us_crit_edge, label %for.body3.us.for.body3.us_crit_edge

for.body3.us.for.body3.us_crit_edge:              ; preds = %for.body3.us
  br label %for.body3.us

for.body3.us.for.inc7.us_crit_edge:               ; preds = %for.body3.us
  br label %for.inc7.us

for.inc7.us:                                      ; preds = %for.body3.us.for.inc7.us_crit_edge, %for.body3.us.prol.loopexit.for.inc7.us_crit_edge
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond = icmp eq i64 %indvars.iv.next7, %wide.trip.count9
  br i1 %exitcond, label %for.inc7.us.for.end9_crit_edge, label %for.inc7.us.for.cond1.preheader.us_crit_edge

for.inc7.us.for.cond1.preheader.us_crit_edge:     ; preds = %for.inc7.us
  br label %for.cond1.preheader.us

for.inc7.us.for.end9_crit_edge:                   ; preds = %for.inc7.us
  br label %for.end9

for.end9:                                         ; preds = %for.inc7.us.for.end9_crit_edge, %entry.for.end9_crit_edge
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_adi(i32 %tsteps, i32 %n, [1000 x double]* nocapture %u, [1000 x double]* nocapture %v, [1000 x double]* nocapture %p, [1000 x double]* nocapture %q) #2 {
entry:
  %conv = sitofp i32 %n to double
  %conv3 = sitofp i32 %tsteps to double
  %div.v.i1.1 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i1.2 = insertelement <2 x double> %div.v.i1.1, double %conv3, i32 1
  %div = fdiv <2 x double> <double 1.000000e+00, double 1.000000e+00>, %div.v.i1.2
  %div.v.r1 = extractelement <2 x double> %div, i32 0
  %mul.v.i1.1 = insertelement <2 x double> undef, double %div.v.r1, i32 0
  %mul.v.i1.2 = insertelement <2 x double> %mul.v.i1.1, double 2.000000e+00, i32 1
  %mul5 = fmul <2 x double> %div, %mul.v.i1.2
  %div6.v.i1 = shufflevector <2 x double> %mul5, <2 x double> undef, <2 x i32> zeroinitializer
  %div6.v.i0 = shufflevector <2 x double> %mul5, <2 x double> %div, <2 x i32> <i32 1, i32 3>
  %div6 = fdiv <2 x double> %div6.v.i0, %div6.v.i1
  %div10 = fmul <2 x double> %div6, <double -5.000000e-01, double -5.000000e-01>
  %div10.v.r1 = extractelement <2 x double> %div10, i32 0
  %div10.v.r2 = extractelement <2 x double> %div10, i32 1
  %add = fadd <2 x double> %div6, <double 1.000000e+00, double 1.000000e+00>
  %cmp15 = icmp slt i32 %tsteps, 1
  br i1 %cmp15, label %entry.for.end239_crit_edge, label %for.cond15.preheader.lr.ph

entry.for.end239_crit_edge:                       ; preds = %entry
  br label %for.end239

for.cond15.preheader.lr.ph:                       ; preds = %entry
  %sub16 = add nsw i32 %n, -1
  %cmp175 = icmp sgt i32 %sub16, 1
  %sub35 = fsub double -0.000000e+00, %div10.v.r1
  %mul55 = fmul double %div10.v.r2, 2.000000e+00
  %add56 = fadd double %mul55, 1.000000e+00
  %0 = insertelement <2 x double> undef, double %div10.v.r2, i32 0
  %1 = insertelement <2 x double> %0, double %add56, i32 1
  %idxprom90 = sext i32 %sub16 to i64
  %sub94 = add nsw i32 %n, -2
  %cmp963 = icmp sgt i32 %n, 2
  %sub145 = fsub double -0.000000e+00, %div10.v.r2
  %mul165 = fmul double %div10.v.r1, 2.000000e+00
  %add166 = fadd double %mul165, 1.000000e+00
  %mul151.v.i0 = shufflevector <2 x double> %div10, <2 x double> undef, <2 x i32> <i32 1, i32 1>
  %add152.v.i1 = shufflevector <2 x double> %add, <2 x double> undef, <2 x i32> <i32 1, i32 1>
  %cmp20910 = icmp sgt i32 %n, 2
  %2 = sext i32 %sub94 to i64
  %3 = add i32 %n, -3
  %wide.trip.count = zext i32 %sub16 to i64
  %xtraiter = and i32 %sub94, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %4 = icmp eq i32 %3, 0
  %5 = add nsw i64 %2, 1
  %indvars.iv.next19.prol = add nsw i64 %2, -1
  %wide.trip.count24 = zext i32 %sub16 to i64
  %cmp12512 = icmp sgt i32 %sub16, 1
  %idxprom205 = sext i32 %sub16 to i64
  %wide.trip.count29 = zext i32 %sub16 to i64
  %xtraiter34 = and i32 %sub94, 1
  %lcmp.mod35 = icmp eq i32 %xtraiter34, 0
  %6 = icmp eq i32 %3, 0
  %7 = add nsw i64 %2, 1
  %indvars.iv.next32.prol = add nsw i64 %2, -1
  %wide.trip.count39 = zext i32 %sub16 to i64
  br label %for.cond15.preheader

for.cond15.preheader:                             ; preds = %for.inc237.for.cond15.preheader_crit_edge, %for.cond15.preheader.lr.ph
  %t.016 = phi i32 [ 1, %for.cond15.preheader.lr.ph ], [ %inc238, %for.inc237.for.cond15.preheader_crit_edge ]
  br i1 %cmp175, label %for.cond15.preheader.for.body34.us.lver.check_crit_edge, label %for.cond15.preheader.for.inc237_crit_edge

for.cond15.preheader.for.inc237_crit_edge:        ; preds = %for.cond15.preheader
  br label %for.inc237

for.cond15.preheader.for.body34.us.lver.check_crit_edge: ; preds = %for.cond15.preheader
  br label %for.body34.us.lver.check

for.body34.us.lver.check:                         ; preds = %for.inc120.us.for.body34.us.lver.check_crit_edge, %for.cond15.preheader.for.body34.us.lver.check_crit_edge
  %indvar = phi i64 [ %indvar.next, %for.inc120.us.for.body34.us.lver.check_crit_edge ], [ 0, %for.cond15.preheader.for.body34.us.lver.check_crit_edge ]
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %for.inc120.us.for.body34.us.lver.check_crit_edge ], [ 1, %for.cond15.preheader.for.body34.us.lver.check_crit_edge ]
  %8 = add i64 %indvar, 1
  %9 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %p, i64 %9, i64 0
  %scevgep48 = getelementptr [1000 x double], [1000 x double]* %p, i64 %9, i64 %wide.trip.count
  %scevgep50 = getelementptr [1000 x double], [1000 x double]* %q, i64 %9, i64 0
  %scevgep52 = getelementptr [1000 x double], [1000 x double]* %q, i64 %9, i64 %wide.trip.count
  %arrayidx20.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 0, i64 %indvars.iv21
  store double 1.000000e+00, double* %arrayidx20.us, align 8
  %arrayidx23.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv21, i64 0
  store double 0.000000e+00, double* %arrayidx23.us, align 8
  %10 = bitcast double* %arrayidx20.us to i64*
  %11 = load i64, i64* %10, align 8
  %arrayidx28.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv21
  %12 = bitcast [1000 x double]* %arrayidx28.us to i64*
  store i64 %11, i64* %12, align 8
  %13 = add nsw i64 %indvars.iv21, -1
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %bound0 = icmp ult double* %scevgep, %scevgep52
  %bound1 = icmp ult double* %scevgep50, %scevgep48
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.body34.us.lver.check.for.body34.us.lver.orig_crit_edge, label %for.body34.us.ph

for.body34.us.lver.check.for.body34.us.lver.orig_crit_edge: ; preds = %for.body34.us.lver.check
  br label %for.body34.us.lver.orig

for.body34.us.lver.orig:                          ; preds = %for.body34.us.lver.orig.for.body34.us.lver.orig_crit_edge, %for.body34.us.lver.check.for.body34.us.lver.orig_crit_edge
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %for.body34.us.lver.orig.for.body34.us.lver.orig_crit_edge ], [ 1, %for.body34.us.lver.check.for.body34.us.lver.orig_crit_edge ]
  %14 = add nsw i64 %indvars.iv.lver.orig, -1
  %arrayidx40.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv21, i64 %14
  %15 = load double, double* %arrayidx40.us.lver.orig, align 8
  %arrayidx47.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv21, i64 %indvars.iv.lver.orig
  %arrayidx53.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv.lver.orig, i64 %13
  %arrayidx67.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next22
  %arrayidx74.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv21, i64 %14
  %16 = insertelement <2 x double> undef, double %15, i32 0
  %17 = fmul <2 x double> %div10, %16
  %18 = fadd <2 x double> %add, %17
  %add42.v.r1.us.lver.orig = extractelement <2 x double> %18, i32 0
  %add42.v.r2.us.lver.orig = extractelement <2 x double> %18, i32 0
  %div43.us.lver.orig = fdiv double %sub35, %add42.v.r1.us.lver.orig
  store double %div43.us.lver.orig, double* %arrayidx47.us.lver.orig, align 8
  %19 = bitcast double* %arrayidx53.us.lver.orig to <2 x double>*
  %20 = load <2 x double>, <2 x double>* %19, align 8
  %mul61.us.lver.orig = fmul <2 x double> %1, %20
  %mul61.v.r1.us.lver.orig = extractelement <2 x double> %mul61.us.lver.orig, i32 0
  %mul61.v.r2.us.lver.orig = extractelement <2 x double> %mul61.us.lver.orig, i32 1
  %add62.us.lver.orig = fsub double %mul61.v.r2.us.lver.orig, %mul61.v.r1.us.lver.orig
  %21 = load double, double* %arrayidx67.us.lver.orig, align 8
  %mul68.us.lver.orig = fmul double %div10.v.r2, %21
  %sub69.us.lver.orig = fsub double %add62.us.lver.orig, %mul68.us.lver.orig
  %22 = load double, double* %arrayidx74.us.lver.orig, align 8
  %mul75.us.lver.orig = fmul double %div10.v.r1, %22
  %sub76.us.lver.orig = fsub double %sub69.us.lver.orig, %mul75.us.lver.orig
  %div84.us.lver.orig = fdiv double %sub76.us.lver.orig, %add42.v.r2.us.lver.orig
  %arrayidx88.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv21, i64 %indvars.iv.lver.orig
  store double %div84.us.lver.orig, double* %arrayidx88.us.lver.orig, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, %wide.trip.count
  br i1 %exitcond.lver.orig, label %for.body34.us.lver.orig.for.end.us_crit_edge, label %for.body34.us.lver.orig.for.body34.us.lver.orig_crit_edge

for.body34.us.lver.orig.for.body34.us.lver.orig_crit_edge: ; preds = %for.body34.us.lver.orig
  br label %for.body34.us.lver.orig

for.body34.us.lver.orig.for.end.us_crit_edge:     ; preds = %for.body34.us.lver.orig
  br label %for.end.us

for.body34.us.ph:                                 ; preds = %for.body34.us.lver.check
  %scevgep55 = getelementptr [1000 x double], [1000 x double]* %q, i64 %8, i64 0
  %scevgep54 = getelementptr [1000 x double], [1000 x double]* %p, i64 %8, i64 0
  %load_initial = load double, double* %scevgep54, align 8
  %load_initial56 = load double, double* %scevgep55, align 8
  br label %for.body34.us

for.body34.us:                                    ; preds = %for.body34.us.for.body34.us_crit_edge, %for.body34.us.ph
  %store_forwarded57 = phi double [ %load_initial56, %for.body34.us.ph ], [ %div84.us, %for.body34.us.for.body34.us_crit_edge ]
  %store_forwarded = phi double [ %load_initial, %for.body34.us.ph ], [ %div43.us, %for.body34.us.for.body34.us_crit_edge ]
  %indvars.iv = phi i64 [ 1, %for.body34.us.ph ], [ %indvars.iv.next, %for.body34.us.for.body34.us_crit_edge ]
  %arrayidx47.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv21, i64 %indvars.iv
  %arrayidx53.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv, i64 %13
  %arrayidx67.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv, i64 %indvars.iv.next22
  %23 = insertelement <2 x double> undef, double %store_forwarded, i32 0
  %24 = fmul <2 x double> %div10, %23
  %25 = fadd <2 x double> %add, %24
  %add42.v.r1.us = extractelement <2 x double> %25, i32 0
  %add42.v.r2.us = extractelement <2 x double> %25, i32 0
  %div43.us = fdiv double %sub35, %add42.v.r1.us
  store double %div43.us, double* %arrayidx47.us, align 8
  %26 = bitcast double* %arrayidx53.us to <2 x double>*
  %27 = load <2 x double>, <2 x double>* %26, align 8
  %mul61.us = fmul <2 x double> %1, %27
  %mul61.v.r1.us = extractelement <2 x double> %mul61.us, i32 0
  %mul61.v.r2.us = extractelement <2 x double> %mul61.us, i32 1
  %add62.us = fsub double %mul61.v.r2.us, %mul61.v.r1.us
  %28 = load double, double* %arrayidx67.us, align 8
  %mul68.us = fmul double %div10.v.r2, %28
  %sub69.us = fsub double %add62.us, %mul68.us
  %mul75.us = fmul double %div10.v.r1, %store_forwarded57
  %sub76.us = fsub double %sub69.us, %mul75.us
  %div84.us = fdiv double %sub76.us, %add42.v.r2.us
  %arrayidx88.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv21, i64 %indvars.iv
  store double %div84.us, double* %arrayidx88.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.body34.us.for.end.us_crit_edge, label %for.body34.us.for.body34.us_crit_edge

for.body34.us.for.body34.us_crit_edge:            ; preds = %for.body34.us
  br label %for.body34.us

for.body34.us.for.end.us_crit_edge:               ; preds = %for.body34.us
  br label %for.end.us

for.end.us:                                       ; preds = %for.body34.us.for.end.us_crit_edge, %for.body34.us.lver.orig.for.end.us_crit_edge
  %arrayidx93.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %idxprom90, i64 %indvars.iv21
  store double 1.000000e+00, double* %arrayidx93.us, align 8
  br i1 %cmp963, label %for.body98.us.preheader, label %for.end.us.for.inc120.us_crit_edge

for.end.us.for.inc120.us_crit_edge:               ; preds = %for.end.us
  br label %for.inc120.us

for.body98.us.preheader:                          ; preds = %for.end.us
  br i1 %lcmp.mod, label %for.body98.us.preheader.for.body98.us.prol.loopexit_crit_edge, label %for.body98.us.prol

for.body98.us.preheader.for.body98.us.prol.loopexit_crit_edge: ; preds = %for.body98.us.preheader
  br label %for.body98.us.prol.loopexit

for.body98.us.prol:                               ; preds = %for.body98.us.preheader
  %arrayidx102.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv21, i64 %2
  %29 = load double, double* %arrayidx102.us.prol, align 8
  %arrayidx107.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %5, i64 %indvars.iv21
  %30 = load double, double* %arrayidx107.us.prol, align 8
  %mul108.us.prol = fmul double %29, %30
  %arrayidx112.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv21, i64 %2
  %31 = load double, double* %arrayidx112.us.prol, align 8
  %add113.us.prol = fadd double %mul108.us.prol, %31
  %arrayidx117.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %2, i64 %indvars.iv21
  store double %add113.us.prol, double* %arrayidx117.us.prol, align 8
  br label %for.body98.us.prol.loopexit

for.body98.us.prol.loopexit:                      ; preds = %for.body98.us.preheader.for.body98.us.prol.loopexit_crit_edge, %for.body98.us.prol
  %indvars.iv18.unr.ph = phi i64 [ %indvars.iv.next19.prol, %for.body98.us.prol ], [ %2, %for.body98.us.preheader.for.body98.us.prol.loopexit_crit_edge ]
  br i1 %4, label %for.body98.us.prol.loopexit.for.inc120.us_crit_edge, label %for.body98.us.prol.loopexit.for.body98.us_crit_edge

for.body98.us.prol.loopexit.for.body98.us_crit_edge: ; preds = %for.body98.us.prol.loopexit
  br label %for.body98.us

for.body98.us.prol.loopexit.for.inc120.us_crit_edge: ; preds = %for.body98.us.prol.loopexit
  br label %for.inc120.us

for.body98.us:                                    ; preds = %for.body98.us.for.body98.us_crit_edge, %for.body98.us.prol.loopexit.for.body98.us_crit_edge
  %indvars.iv18 = phi i64 [ %indvars.iv.next19.1, %for.body98.us.for.body98.us_crit_edge ], [ %indvars.iv18.unr.ph, %for.body98.us.prol.loopexit.for.body98.us_crit_edge ]
  %arrayidx102.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv21, i64 %indvars.iv18
  %32 = load double, double* %arrayidx102.us, align 8
  %33 = add nsw i64 %indvars.iv18, 1
  %arrayidx107.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %33, i64 %indvars.iv21
  %34 = load double, double* %arrayidx107.us, align 8
  %mul108.us = fmul double %32, %34
  %arrayidx112.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv21, i64 %indvars.iv18
  %35 = load double, double* %arrayidx112.us, align 8
  %add113.us = fadd double %mul108.us, %35
  %arrayidx117.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv18, i64 %indvars.iv21
  store double %add113.us, double* %arrayidx117.us, align 8
  %indvars.iv.next19 = add nsw i64 %indvars.iv18, -1
  %arrayidx102.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv21, i64 %indvars.iv.next19
  %36 = load double, double* %arrayidx102.us.1, align 8
  %mul108.us.1 = fmul double %36, %add113.us
  %arrayidx112.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv21, i64 %indvars.iv.next19
  %37 = load double, double* %arrayidx112.us.1, align 8
  %add113.us.1 = fadd double %mul108.us.1, %37
  %arrayidx117.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv.next19, i64 %indvars.iv21
  store double %add113.us.1, double* %arrayidx117.us.1, align 8
  %cmp96.us.1 = icmp sgt i64 %indvars.iv.next19, 1
  br i1 %cmp96.us.1, label %for.body98.us.for.body98.us_crit_edge, label %for.body98.us.for.inc120.us_crit_edge

for.body98.us.for.inc120.us_crit_edge:            ; preds = %for.body98.us
  br label %for.inc120.us

for.body98.us.for.body98.us_crit_edge:            ; preds = %for.body98.us
  %indvars.iv.next19.1 = add nsw i64 %indvars.iv18, -2
  br label %for.body98.us

for.inc120.us:                                    ; preds = %for.body98.us.for.inc120.us_crit_edge, %for.body98.us.prol.loopexit.for.inc120.us_crit_edge, %for.end.us.for.inc120.us_crit_edge
  %exitcond25 = icmp eq i64 %indvars.iv.next22, %wide.trip.count24
  br i1 %exitcond25, label %for.cond123.preheader, label %for.inc120.us.for.body34.us.lver.check_crit_edge

for.inc120.us.for.body34.us.lver.check_crit_edge: ; preds = %for.inc120.us
  %indvar.next = add i64 %indvar, 1
  br label %for.body34.us.lver.check

for.cond123.preheader:                            ; preds = %for.inc120.us
  br i1 %cmp12512, label %for.cond123.preheader.for.body144.us.lver.check_crit_edge, label %for.cond123.preheader.for.inc237_crit_edge

for.cond123.preheader.for.inc237_crit_edge:       ; preds = %for.cond123.preheader
  br label %for.inc237

for.cond123.preheader.for.body144.us.lver.check_crit_edge: ; preds = %for.cond123.preheader
  br label %for.body144.us.lver.check

for.body144.us.lver.check:                        ; preds = %for.inc234.us.for.body144.us.lver.check_crit_edge, %for.cond123.preheader.for.body144.us.lver.check_crit_edge
  %indvar58 = phi i64 [ %indvar.next59, %for.inc234.us.for.body144.us.lver.check_crit_edge ], [ 0, %for.cond123.preheader.for.body144.us.lver.check_crit_edge ]
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %for.inc234.us.for.body144.us.lver.check_crit_edge ], [ 1, %for.cond123.preheader.for.body144.us.lver.check_crit_edge ]
  %38 = add i64 %indvar58, 1
  %39 = add i64 %indvar58, 1
  %scevgep60 = getelementptr [1000 x double], [1000 x double]* %p, i64 %39, i64 0
  %scevgep62 = getelementptr [1000 x double], [1000 x double]* %p, i64 %39, i64 %wide.trip.count
  %scevgep64 = getelementptr [1000 x double], [1000 x double]* %q, i64 %39, i64 0
  %scevgep66 = getelementptr [1000 x double], [1000 x double]* %q, i64 %39, i64 %wide.trip.count
  %arrayidx130.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv36, i64 0
  store double 1.000000e+00, double* %arrayidx130.us, align 8
  %arrayidx133.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv36, i64 0
  store double 0.000000e+00, double* %arrayidx133.us, align 8
  %40 = bitcast double* %arrayidx130.us to i64*
  %41 = load i64, i64* %40, align 8
  %arrayidx138.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv36
  %42 = bitcast [1000 x double]* %arrayidx138.us to i64*
  store i64 %41, i64* %42, align 8
  %43 = add nsw i64 %indvars.iv36, -1
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %bound068 = icmp ult double* %scevgep60, %scevgep66
  %bound169 = icmp ult double* %scevgep64, %scevgep62
  %memcheck.conflict71 = and i1 %bound068, %bound169
  br i1 %memcheck.conflict71, label %for.body144.us.lver.check.for.body144.us.lver.orig_crit_edge, label %for.body144.us.ph

for.body144.us.lver.check.for.body144.us.lver.orig_crit_edge: ; preds = %for.body144.us.lver.check
  br label %for.body144.us.lver.orig

for.body144.us.lver.orig:                         ; preds = %for.body144.us.lver.orig.for.body144.us.lver.orig_crit_edge, %for.body144.us.lver.check.for.body144.us.lver.orig_crit_edge
  %indvars.iv26.lver.orig = phi i64 [ %indvars.iv.next27.lver.orig, %for.body144.us.lver.orig.for.body144.us.lver.orig_crit_edge ], [ 1, %for.body144.us.lver.check.for.body144.us.lver.orig_crit_edge ]
  %44 = add nsw i64 %indvars.iv26.lver.orig, -1
  %arrayidx150.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv36, i64 %44
  %45 = load double, double* %arrayidx150.us.lver.orig, align 8
  %arrayidx157.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv36, i64 %indvars.iv26.lver.orig
  %arrayidx163.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %43, i64 %indvars.iv26.lver.orig
  %arrayidx170.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv36, i64 %indvars.iv26.lver.orig
  %arrayidx177.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv.next37, i64 %indvars.iv26.lver.orig
  %arrayidx184.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv36, i64 %44
  %46 = insertelement <2 x double> undef, double %45, i32 0
  %mul151.v.i1.2.us.lver.orig = shufflevector <2 x double> %46, <2 x double> undef, <2 x i32> zeroinitializer
  %mul151.us.lver.orig = fmul <2 x double> %mul151.v.i0, %mul151.v.i1.2.us.lver.orig
  %add152.us.lver.orig = fadd <2 x double> %add152.v.i1, %mul151.us.lver.orig
  %add152.v.r1.us.lver.orig = extractelement <2 x double> %add152.us.lver.orig, i32 0
  %add152.v.r2.us.lver.orig = extractelement <2 x double> %add152.us.lver.orig, i32 1
  %div153.us.lver.orig = fdiv double %sub145, %add152.v.r1.us.lver.orig
  store double %div153.us.lver.orig, double* %arrayidx157.us.lver.orig, align 8
  %47 = load double, double* %arrayidx163.us.lver.orig, align 8
  %48 = fmul double %div10.v.r1, %47
  %49 = load double, double* %arrayidx170.us.lver.orig, align 8
  %mul171.us.lver.orig = fmul double %add166, %49
  %add172.us.lver.orig = fsub double %mul171.us.lver.orig, %48
  %50 = load double, double* %arrayidx177.us.lver.orig, align 8
  %mul178.us.lver.orig = fmul double %div10.v.r1, %50
  %sub179.us.lver.orig = fsub double %add172.us.lver.orig, %mul178.us.lver.orig
  %51 = load double, double* %arrayidx184.us.lver.orig, align 8
  %mul185.us.lver.orig = fmul double %div10.v.r2, %51
  %sub186.us.lver.orig = fsub double %sub179.us.lver.orig, %mul185.us.lver.orig
  %div194.us.lver.orig = fdiv double %sub186.us.lver.orig, %add152.v.r2.us.lver.orig
  %arrayidx198.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv36, i64 %indvars.iv26.lver.orig
  store double %div194.us.lver.orig, double* %arrayidx198.us.lver.orig, align 8
  %indvars.iv.next27.lver.orig = add nuw nsw i64 %indvars.iv26.lver.orig, 1
  %exitcond30.lver.orig = icmp eq i64 %indvars.iv.next27.lver.orig, %wide.trip.count29
  br i1 %exitcond30.lver.orig, label %for.body144.us.lver.orig.for.end201.us_crit_edge, label %for.body144.us.lver.orig.for.body144.us.lver.orig_crit_edge

for.body144.us.lver.orig.for.body144.us.lver.orig_crit_edge: ; preds = %for.body144.us.lver.orig
  br label %for.body144.us.lver.orig

for.body144.us.lver.orig.for.end201.us_crit_edge: ; preds = %for.body144.us.lver.orig
  br label %for.end201.us

for.body144.us.ph:                                ; preds = %for.body144.us.lver.check
  %scevgep75 = getelementptr [1000 x double], [1000 x double]* %q, i64 %38, i64 0
  %scevgep72 = getelementptr [1000 x double], [1000 x double]* %p, i64 %38, i64 0
  %load_initial73 = load double, double* %scevgep72, align 8
  %load_initial76 = load double, double* %scevgep75, align 8
  br label %for.body144.us

for.body144.us:                                   ; preds = %for.body144.us.for.body144.us_crit_edge, %for.body144.us.ph
  %store_forwarded77 = phi double [ %load_initial76, %for.body144.us.ph ], [ %div194.us, %for.body144.us.for.body144.us_crit_edge ]
  %store_forwarded74 = phi double [ %load_initial73, %for.body144.us.ph ], [ %div153.us, %for.body144.us.for.body144.us_crit_edge ]
  %indvars.iv26 = phi i64 [ 1, %for.body144.us.ph ], [ %indvars.iv.next27, %for.body144.us.for.body144.us_crit_edge ]
  %arrayidx157.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv36, i64 %indvars.iv26
  %arrayidx163.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %43, i64 %indvars.iv26
  %arrayidx170.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv36, i64 %indvars.iv26
  %arrayidx177.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv.next37, i64 %indvars.iv26
  %52 = insertelement <2 x double> undef, double %store_forwarded74, i32 0
  %mul151.v.i1.2.us = shufflevector <2 x double> %52, <2 x double> undef, <2 x i32> zeroinitializer
  %mul151.us = fmul <2 x double> %mul151.v.i0, %mul151.v.i1.2.us
  %add152.us = fadd <2 x double> %add152.v.i1, %mul151.us
  %add152.v.r1.us = extractelement <2 x double> %add152.us, i32 0
  %add152.v.r2.us = extractelement <2 x double> %add152.us, i32 1
  %div153.us = fdiv double %sub145, %add152.v.r1.us
  store double %div153.us, double* %arrayidx157.us, align 8
  %53 = load double, double* %arrayidx163.us, align 8
  %54 = fmul double %div10.v.r1, %53
  %55 = load double, double* %arrayidx170.us, align 8
  %mul171.us = fmul double %add166, %55
  %add172.us = fsub double %mul171.us, %54
  %56 = load double, double* %arrayidx177.us, align 8
  %mul178.us = fmul double %div10.v.r1, %56
  %sub179.us = fsub double %add172.us, %mul178.us
  %mul185.us = fmul double %div10.v.r2, %store_forwarded77
  %sub186.us = fsub double %sub179.us, %mul185.us
  %div194.us = fdiv double %sub186.us, %add152.v.r2.us
  %arrayidx198.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv36, i64 %indvars.iv26
  store double %div194.us, double* %arrayidx198.us, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next27, %wide.trip.count29
  br i1 %exitcond30, label %for.body144.us.for.end201.us_crit_edge, label %for.body144.us.for.body144.us_crit_edge

for.body144.us.for.body144.us_crit_edge:          ; preds = %for.body144.us
  br label %for.body144.us

for.body144.us.for.end201.us_crit_edge:           ; preds = %for.body144.us
  br label %for.end201.us

for.end201.us:                                    ; preds = %for.body144.us.for.end201.us_crit_edge, %for.body144.us.lver.orig.for.end201.us_crit_edge
  %arrayidx206.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv36, i64 %idxprom205
  store double 1.000000e+00, double* %arrayidx206.us, align 8
  br i1 %cmp20910, label %for.body211.us.preheader, label %for.end201.us.for.inc234.us_crit_edge

for.end201.us.for.inc234.us_crit_edge:            ; preds = %for.end201.us
  br label %for.inc234.us

for.body211.us.preheader:                         ; preds = %for.end201.us
  br i1 %lcmp.mod35, label %for.body211.us.preheader.for.body211.us.prol.loopexit_crit_edge, label %for.body211.us.prol

for.body211.us.preheader.for.body211.us.prol.loopexit_crit_edge: ; preds = %for.body211.us.preheader
  br label %for.body211.us.prol.loopexit

for.body211.us.prol:                              ; preds = %for.body211.us.preheader
  %arrayidx215.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv36, i64 %2
  %57 = load double, double* %arrayidx215.us.prol, align 8
  %arrayidx220.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv36, i64 %7
  %58 = load double, double* %arrayidx220.us.prol, align 8
  %mul221.us.prol = fmul double %57, %58
  %arrayidx225.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv36, i64 %2
  %59 = load double, double* %arrayidx225.us.prol, align 8
  %add226.us.prol = fadd double %mul221.us.prol, %59
  %arrayidx230.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv36, i64 %2
  store double %add226.us.prol, double* %arrayidx230.us.prol, align 8
  br label %for.body211.us.prol.loopexit

for.body211.us.prol.loopexit:                     ; preds = %for.body211.us.preheader.for.body211.us.prol.loopexit_crit_edge, %for.body211.us.prol
  %indvars.iv31.unr.ph = phi i64 [ %indvars.iv.next32.prol, %for.body211.us.prol ], [ %2, %for.body211.us.preheader.for.body211.us.prol.loopexit_crit_edge ]
  br i1 %6, label %for.body211.us.prol.loopexit.for.inc234.us_crit_edge, label %for.body211.us.prol.loopexit.for.body211.us_crit_edge

for.body211.us.prol.loopexit.for.body211.us_crit_edge: ; preds = %for.body211.us.prol.loopexit
  br label %for.body211.us

for.body211.us.prol.loopexit.for.inc234.us_crit_edge: ; preds = %for.body211.us.prol.loopexit
  br label %for.inc234.us

for.body211.us:                                   ; preds = %for.body211.us.for.body211.us_crit_edge, %for.body211.us.prol.loopexit.for.body211.us_crit_edge
  %indvars.iv31 = phi i64 [ %indvars.iv.next32.1, %for.body211.us.for.body211.us_crit_edge ], [ %indvars.iv31.unr.ph, %for.body211.us.prol.loopexit.for.body211.us_crit_edge ]
  %arrayidx215.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv36, i64 %indvars.iv31
  %60 = load double, double* %arrayidx215.us, align 8
  %61 = add nsw i64 %indvars.iv31, 1
  %arrayidx220.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv36, i64 %61
  %62 = load double, double* %arrayidx220.us, align 8
  %mul221.us = fmul double %60, %62
  %arrayidx225.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv36, i64 %indvars.iv31
  %63 = load double, double* %arrayidx225.us, align 8
  %add226.us = fadd double %mul221.us, %63
  %arrayidx230.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv36, i64 %indvars.iv31
  store double %add226.us, double* %arrayidx230.us, align 8
  %indvars.iv.next32 = add nsw i64 %indvars.iv31, -1
  %arrayidx215.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv36, i64 %indvars.iv.next32
  %64 = load double, double* %arrayidx215.us.1, align 8
  %mul221.us.1 = fmul double %64, %add226.us
  %arrayidx225.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv36, i64 %indvars.iv.next32
  %65 = load double, double* %arrayidx225.us.1, align 8
  %add226.us.1 = fadd double %mul221.us.1, %65
  %arrayidx230.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv36, i64 %indvars.iv.next32
  store double %add226.us.1, double* %arrayidx230.us.1, align 8
  %cmp209.us.1 = icmp sgt i64 %indvars.iv.next32, 1
  br i1 %cmp209.us.1, label %for.body211.us.for.body211.us_crit_edge, label %for.body211.us.for.inc234.us_crit_edge

for.body211.us.for.inc234.us_crit_edge:           ; preds = %for.body211.us
  br label %for.inc234.us

for.body211.us.for.body211.us_crit_edge:          ; preds = %for.body211.us
  %indvars.iv.next32.1 = add nsw i64 %indvars.iv31, -2
  br label %for.body211.us

for.inc234.us:                                    ; preds = %for.body211.us.for.inc234.us_crit_edge, %for.body211.us.prol.loopexit.for.inc234.us_crit_edge, %for.end201.us.for.inc234.us_crit_edge
  %exitcond40 = icmp eq i64 %indvars.iv.next37, %wide.trip.count39
  br i1 %exitcond40, label %for.inc234.us.for.inc237_crit_edge, label %for.inc234.us.for.body144.us.lver.check_crit_edge

for.inc234.us.for.body144.us.lver.check_crit_edge: ; preds = %for.inc234.us
  %indvar.next59 = add i64 %indvar58, 1
  br label %for.body144.us.lver.check

for.inc234.us.for.inc237_crit_edge:               ; preds = %for.inc234.us
  br label %for.inc237

for.inc237:                                       ; preds = %for.inc234.us.for.inc237_crit_edge, %for.cond123.preheader.for.inc237_crit_edge, %for.cond15.preheader.for.inc237_crit_edge
  %exitcond41 = icmp eq i32 %t.016, %tsteps
  br i1 %exitcond41, label %for.inc237.for.end239_crit_edge, label %for.inc237.for.cond15.preheader_crit_edge

for.inc237.for.cond15.preheader_crit_edge:        ; preds = %for.inc237
  %inc238 = add nuw nsw i32 %t.016, 1
  br label %for.cond15.preheader

for.inc237.for.end239_crit_edge:                  ; preds = %for.inc237
  br label %for.end239

for.end239:                                       ; preds = %for.inc237.for.end239_crit_edge, %entry.for.end239_crit_edge
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32 %n, [1000 x double]* nocapture readonly %u) #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp4 = icmp sgt i32 %n, 0
  br i1 %cmp4, label %for.cond2.preheader.us.preheader, label %entry.for.end12_crit_edge

entry.for.end12_crit_edge:                        ; preds = %entry
  br label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %n to i64
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count11 = zext i32 %n to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.inc10.us.for.cond2.preheader.us_crit_edge, %for.cond2.preheader.us.preheader
  %indvars.iv8 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next9, %for.inc10.us.for.cond2.preheader.us_crit_edge ]
  %4 = mul nsw i64 %indvars.iv8, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us.for.body4.us_crit_edge, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end.us.for.body4.us_crit_edge ], [ 0, %for.cond2.preheader.us ]
  %5 = add nsw i64 %indvars.iv, %4
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.body4.us.if.end.us_crit_edge

for.body4.us.if.end.us_crit_edge:                 ; preds = %for.body4.us
  br label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #5
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us.if.end.us_crit_edge, %if.then.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv8, i64 %indvars.iv
  %9 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.inc10.us, label %if.end.us.for.body4.us_crit_edge

if.end.us.for.body4.us_crit_edge:                 ; preds = %if.end.us
  br label %for.body4.us

for.inc10.us:                                     ; preds = %if.end.us
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next9, %wide.trip.count11
  br i1 %exitcond12, label %for.inc10.us.for.end12_crit_edge, label %for.inc10.us.for.cond2.preheader.us_crit_edge

for.inc10.us.for.cond2.preheader.us_crit_edge:    ; preds = %for.inc10.us
  br label %for.cond2.preheader.us

for.inc10.us.for.end12_crit_edge:                 ; preds = %for.inc10.us
  br label %for.end12

for.end12:                                        ; preds = %for.inc10.us.for.end12_crit_edge, %entry.for.end12_crit_edge
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %11) #5
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
