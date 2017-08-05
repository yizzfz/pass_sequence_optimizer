; ModuleID = 'A.ll'
source_filename = "adi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1000 x double]*
  tail call fastcc void @init_array(i32 1000, [1000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay5 = bitcast i8* %call1 to [1000 x double]*
  %arraydecay6 = bitcast i8* %call2 to [1000 x double]*
  %arraydecay7 = bitcast i8* %call3 to [1000 x double]*
  tail call fastcc void @kernel_adi(i32 500, i32 1000, [1000 x double]* %arraydecay, [1000 x double]* %arraydecay5, [1000 x double]* %arraydecay6, [1000 x double]* %arraydecay7)
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
  tail call fastcc void @print_array(i32 1000, [1000 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, [1000 x double]* nocapture %u) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc7, %entry
  %indvars.iv4 = phi i64 [ 0, %entry ], [ %indvars.iv.next5, %for.inc7 ]
  %0 = add nuw nsw i64 %indvars.iv4, 1000
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next.1, %for.inc ]
  %1 = sub nuw nsw i64 %0, %indvars.iv
  %2 = trunc i64 %1 to i32
  %conv = sitofp i32 %2 to double
  %div = fdiv double %conv, 1.000000e+03
  %arrayidx6 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv4, i64 %indvars.iv
  store double %div, double* %arrayidx6, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %3 = sub nuw nsw i64 %0, %indvars.iv.next
  %4 = trunc i64 %3 to i32
  %conv.1 = sitofp i32 %4 to double
  %div.1 = fdiv double %conv.1, 1.000000e+03
  %arrayidx6.1 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv4, i64 %indvars.iv.next
  store double %div.1, double* %arrayidx6.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond.1, label %for.inc7, label %for.inc

for.inc7:                                         ; preds = %for.inc
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond = icmp eq i64 %indvars.iv.next5, 1000
  br i1 %exitcond, label %for.end9, label %for.cond1.preheader

for.end9:                                         ; preds = %for.inc7
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi(i32 %tsteps, i32 %n, [1000 x double]* nocapture %u, [1000 x double]* nocapture %v, [1000 x double]* nocapture %p, [1000 x double]* nocapture %q) unnamed_addr #2 {
entry:
  br label %for.cond15.preheader

for.cond15.preheader:                             ; preds = %entry, %for.inc237
  %t.011 = phi i32 [ 1, %entry ], [ %inc238, %for.inc237 ]
  br label %for.inc.us.lver.check

for.inc.us.lver.check:                            ; preds = %for.inc120.us, %for.cond15.preheader
  %indvar = phi i64 [ %indvar.next, %for.inc120.us ], [ 0, %for.cond15.preheader ]
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %for.inc120.us ], [ 1, %for.cond15.preheader ]
  %0 = add i64 %indvar, 1
  %1 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %p, i64 %1, i64 0
  %scevgep33 = getelementptr [1000 x double], [1000 x double]* %p, i64 %1, i64 999
  %scevgep35 = getelementptr [1000 x double], [1000 x double]* %q, i64 %1, i64 0
  %scevgep37 = getelementptr [1000 x double], [1000 x double]* %q, i64 %1, i64 999
  %arrayidx20.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 0, i64 %indvars.iv16
  store double 1.000000e+00, double* %arrayidx20.us, align 8
  %arrayidx23.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv16, i64 0
  store double 0.000000e+00, double* %arrayidx23.us, align 8
  %2 = bitcast double* %arrayidx20.us to i64*
  %3 = load i64, i64* %2, align 8
  %arrayidx28.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv16
  %4 = bitcast [1000 x double]* %arrayidx28.us to i64*
  store i64 %3, i64* %4, align 8
  %5 = add nsw i64 %indvars.iv16, -1
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %bound0 = icmp ult double* %scevgep, %scevgep37
  %bound1 = icmp ult double* %scevgep35, %scevgep33
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.inc.us.lver.orig.preheader, label %for.inc.us.ph

for.inc.us.lver.orig.preheader:                   ; preds = %for.inc.us.lver.check
  br label %for.inc.us.lver.orig

for.inc.us.lver.orig:                             ; preds = %for.inc.us.lver.orig.preheader, %for.inc.us.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %for.inc.us.lver.orig ], [ 1, %for.inc.us.lver.orig.preheader ]
  %6 = add nsw i64 %indvars.iv.lver.orig, -1
  %arrayidx40.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv16, i64 %6
  %7 = load double, double* %arrayidx40.us.lver.orig, align 8
  %arrayidx47.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv16, i64 %indvars.iv.lver.orig
  %arrayidx53.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv.lver.orig, i64 %5
  %arrayidx67.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next17
  %arrayidx74.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv16, i64 %6
  %8 = insertelement <2 x double> undef, double %7, i32 0
  %mul41.v.i1.2.us.lver.orig = shufflevector <2 x double> %8, <2 x double> undef, <2 x i32> zeroinitializer
  %mul41.us.lver.orig = fmul <2 x double> %mul41.v.i1.2.us.lver.orig, <double 0xC09F400000000001, double 0xC09F400000000001>
  %add42.us.lver.orig = fadd <2 x double> %mul41.us.lver.orig, <double 0x40AF420000000001, double 0x40AF420000000001>
  %add42.v.r1.us.lver.orig = extractelement <2 x double> %add42.us.lver.orig, i32 0
  %add42.v.r2.us.lver.orig = extractelement <2 x double> %add42.us.lver.orig, i32 1
  %div43.us.lver.orig = fdiv double 0x409F400000000001, %add42.v.r1.us.lver.orig
  store double %div43.us.lver.orig, double* %arrayidx47.us.lver.orig, align 8
  %9 = bitcast double* %arrayidx53.us.lver.orig to <2 x double>*
  %10 = load <2 x double>, <2 x double>* %9, align 8
  %mul61.us.lver.orig = fmul <2 x double> %10, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %mul61.v.r1.us.lver.orig = extractelement <2 x double> %mul61.us.lver.orig, i32 0
  %mul61.v.r2.us.lver.orig = extractelement <2 x double> %mul61.us.lver.orig, i32 1
  %add62.us.lver.orig = fsub double %mul61.v.r2.us.lver.orig, %mul61.v.r1.us.lver.orig
  %11 = load double, double* %arrayidx67.us.lver.orig, align 8
  %mul68.us.lver.orig = fmul double %11, 0xC08F400000000001
  %sub69.us.lver.orig = fsub double %add62.us.lver.orig, %mul68.us.lver.orig
  %12 = load double, double* %arrayidx74.us.lver.orig, align 8
  %mul75.us.lver.orig = fmul double %12, 0xC09F400000000001
  %sub76.us.lver.orig = fsub double %sub69.us.lver.orig, %mul75.us.lver.orig
  %div84.us.lver.orig = fdiv double %sub76.us.lver.orig, %add42.v.r2.us.lver.orig
  %arrayidx88.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv16, i64 %indvars.iv.lver.orig
  store double %div84.us.lver.orig, double* %arrayidx88.us.lver.orig, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, 999
  br i1 %exitcond.lver.orig, label %for.cond30.for.end_crit_edge.us.loopexit, label %for.inc.us.lver.orig

for.inc.us.ph:                                    ; preds = %for.inc.us.lver.check
  %scevgep40 = getelementptr [1000 x double], [1000 x double]* %q, i64 %0, i64 0
  %scevgep39 = getelementptr [1000 x double], [1000 x double]* %p, i64 %0, i64 0
  %load_initial = load double, double* %scevgep39, align 8
  %load_initial41 = load double, double* %scevgep40, align 8
  br label %for.inc.us

for.inc120.us:                                    ; preds = %for.inc118.us
  %exitcond19 = icmp eq i64 %indvars.iv.next17, 999
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond19, label %for.inc199.us.lver.check.preheader, label %for.inc.us.lver.check

for.inc199.us.lver.check.preheader:               ; preds = %for.inc120.us
  br label %for.inc199.us.lver.check

for.inc118.us:                                    ; preds = %for.inc118.us, %for.cond30.for.end_crit_edge.us
  %indvars.iv13 = phi i64 [ 998, %for.cond30.for.end_crit_edge.us ], [ %indvars.iv.next14.1, %for.inc118.us ]
  %arrayidx102.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv16, i64 %indvars.iv13
  %13 = load double, double* %arrayidx102.us, align 8
  %14 = or i64 %indvars.iv13, 1
  %arrayidx107.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %14, i64 %indvars.iv16
  %15 = load double, double* %arrayidx107.us, align 8
  %mul108.us = fmul double %13, %15
  %arrayidx112.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv16, i64 %indvars.iv13
  %16 = load double, double* %arrayidx112.us, align 8
  %add113.us = fadd double %mul108.us, %16
  %arrayidx117.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv13, i64 %indvars.iv16
  store double %add113.us, double* %arrayidx117.us, align 8
  %indvars.iv.next14 = add nsw i64 %indvars.iv13, -1
  %arrayidx102.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv16, i64 %indvars.iv.next14
  %17 = load double, double* %arrayidx102.us.1, align 8
  %mul108.us.1 = fmul double %17, %add113.us
  %arrayidx112.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv16, i64 %indvars.iv.next14
  %18 = load double, double* %arrayidx112.us.1, align 8
  %add113.us.1 = fadd double %mul108.us.1, %18
  %arrayidx117.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv.next14, i64 %indvars.iv16
  store double %add113.us.1, double* %arrayidx117.us.1, align 8
  %indvars.iv.next14.1 = add nsw i64 %indvars.iv13, -2
  %cmp96.us.1 = icmp sgt i64 %indvars.iv.next14, 1
  br i1 %cmp96.us.1, label %for.inc118.us, label %for.inc120.us

for.inc.us:                                       ; preds = %for.inc.us, %for.inc.us.ph
  %store_forwarded42 = phi double [ %load_initial41, %for.inc.us.ph ], [ %div84.us, %for.inc.us ]
  %store_forwarded = phi double [ %load_initial, %for.inc.us.ph ], [ %div43.us, %for.inc.us ]
  %indvars.iv = phi i64 [ 1, %for.inc.us.ph ], [ %indvars.iv.next, %for.inc.us ]
  %arrayidx47.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv16, i64 %indvars.iv
  %arrayidx53.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv, i64 %5
  %arrayidx67.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv, i64 %indvars.iv.next17
  %19 = insertelement <2 x double> undef, double %store_forwarded, i32 0
  %mul41.v.i1.2.us = shufflevector <2 x double> %19, <2 x double> undef, <2 x i32> zeroinitializer
  %mul41.us = fmul <2 x double> %mul41.v.i1.2.us, <double 0xC09F400000000001, double 0xC09F400000000001>
  %add42.us = fadd <2 x double> %mul41.us, <double 0x40AF420000000001, double 0x40AF420000000001>
  %add42.v.r1.us = extractelement <2 x double> %add42.us, i32 0
  %add42.v.r2.us = extractelement <2 x double> %add42.us, i32 1
  %div43.us = fdiv double 0x409F400000000001, %add42.v.r1.us
  store double %div43.us, double* %arrayidx47.us, align 8
  %20 = bitcast double* %arrayidx53.us to <2 x double>*
  %21 = load <2 x double>, <2 x double>* %20, align 8
  %mul61.us = fmul <2 x double> %21, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %mul61.v.r1.us = extractelement <2 x double> %mul61.us, i32 0
  %mul61.v.r2.us = extractelement <2 x double> %mul61.us, i32 1
  %add62.us = fsub double %mul61.v.r2.us, %mul61.v.r1.us
  %22 = load double, double* %arrayidx67.us, align 8
  %mul68.us = fmul double %22, 0xC08F400000000001
  %sub69.us = fsub double %add62.us, %mul68.us
  %mul75.us = fmul double %store_forwarded42, 0xC09F400000000001
  %sub76.us = fsub double %sub69.us, %mul75.us
  %div84.us = fdiv double %sub76.us, %add42.v.r2.us
  %arrayidx88.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv16, i64 %indvars.iv
  store double %div84.us, double* %arrayidx88.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond, label %for.cond30.for.end_crit_edge.us.loopexit64, label %for.inc.us

for.cond30.for.end_crit_edge.us.loopexit:         ; preds = %for.inc.us.lver.orig
  br label %for.cond30.for.end_crit_edge.us

for.cond30.for.end_crit_edge.us.loopexit64:       ; preds = %for.inc.us
  br label %for.cond30.for.end_crit_edge.us

for.cond30.for.end_crit_edge.us:                  ; preds = %for.cond30.for.end_crit_edge.us.loopexit64, %for.cond30.for.end_crit_edge.us.loopexit
  %arrayidx93.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 999, i64 %indvars.iv16
  store double 1.000000e+00, double* %arrayidx93.us, align 8
  br label %for.inc118.us

for.inc199.us.lver.check:                         ; preds = %for.inc199.us.lver.check.preheader, %for.inc234.us
  %indvar43 = phi i64 [ %indvar.next44, %for.inc234.us ], [ 0, %for.inc199.us.lver.check.preheader ]
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %for.inc234.us ], [ 1, %for.inc199.us.lver.check.preheader ]
  %23 = add i64 %indvar43, 1
  %24 = add i64 %indvar43, 1
  %scevgep45 = getelementptr [1000 x double], [1000 x double]* %p, i64 %24, i64 0
  %scevgep47 = getelementptr [1000 x double], [1000 x double]* %p, i64 %24, i64 999
  %scevgep49 = getelementptr [1000 x double], [1000 x double]* %q, i64 %24, i64 0
  %scevgep51 = getelementptr [1000 x double], [1000 x double]* %q, i64 %24, i64 999
  %arrayidx130.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv27, i64 0
  store double 1.000000e+00, double* %arrayidx130.us, align 8
  %arrayidx133.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv27, i64 0
  store double 0.000000e+00, double* %arrayidx133.us, align 8
  %25 = bitcast double* %arrayidx130.us to i64*
  %26 = load i64, i64* %25, align 8
  %arrayidx138.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv27
  %27 = bitcast [1000 x double]* %arrayidx138.us to i64*
  store i64 %26, i64* %27, align 8
  %28 = add nsw i64 %indvars.iv27, -1
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %bound053 = icmp ult double* %scevgep45, %scevgep51
  %bound154 = icmp ult double* %scevgep49, %scevgep47
  %memcheck.conflict56 = and i1 %bound053, %bound154
  br i1 %memcheck.conflict56, label %for.inc199.us.lver.orig.preheader, label %for.inc199.us.ph

for.inc199.us.lver.orig.preheader:                ; preds = %for.inc199.us.lver.check
  br label %for.inc199.us.lver.orig

for.inc199.us.lver.orig:                          ; preds = %for.inc199.us.lver.orig.preheader, %for.inc199.us.lver.orig
  %indvars.iv20.lver.orig = phi i64 [ %indvars.iv.next21.lver.orig, %for.inc199.us.lver.orig ], [ 1, %for.inc199.us.lver.orig.preheader ]
  %29 = add nsw i64 %indvars.iv20.lver.orig, -1
  %arrayidx150.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv27, i64 %29
  %30 = load double, double* %arrayidx150.us.lver.orig, align 8
  %arrayidx157.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv27, i64 %indvars.iv20.lver.orig
  %arrayidx163.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %28, i64 %indvars.iv20.lver.orig
  %arrayidx170.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv27, i64 %indvars.iv20.lver.orig
  %arrayidx177.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv.next28, i64 %indvars.iv20.lver.orig
  %arrayidx184.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv27, i64 %29
  %31 = insertelement <2 x double> undef, double %30, i32 0
  %mul151.v.i1.2.us.lver.orig = shufflevector <2 x double> %31, <2 x double> undef, <2 x i32> zeroinitializer
  %mul151.us.lver.orig = fmul <2 x double> %mul151.v.i1.2.us.lver.orig, <double 0xC08F400000000001, double 0xC08F400000000001>
  %add152.us.lver.orig = fadd <2 x double> %mul151.us.lver.orig, <double 0x409F440000000001, double 0x409F440000000001>
  %add152.v.r1.us.lver.orig = extractelement <2 x double> %add152.us.lver.orig, i32 0
  %add152.v.r2.us.lver.orig = extractelement <2 x double> %add152.us.lver.orig, i32 1
  %div153.us.lver.orig = fdiv double 0x408F400000000001, %add152.v.r1.us.lver.orig
  store double %div153.us.lver.orig, double* %arrayidx157.us.lver.orig, align 8
  %32 = load double, double* %arrayidx163.us.lver.orig, align 8
  %33 = fmul double %32, 0xC09F400000000001
  %34 = load double, double* %arrayidx170.us.lver.orig, align 8
  %mul171.us.lver.orig = fmul double %34, 0xC0AF3E0000000001
  %add172.us.lver.orig = fsub double %mul171.us.lver.orig, %33
  %35 = load double, double* %arrayidx177.us.lver.orig, align 8
  %mul178.us.lver.orig = fmul double %35, 0xC09F400000000001
  %sub179.us.lver.orig = fsub double %add172.us.lver.orig, %mul178.us.lver.orig
  %36 = load double, double* %arrayidx184.us.lver.orig, align 8
  %mul185.us.lver.orig = fmul double %36, 0xC08F400000000001
  %sub186.us.lver.orig = fsub double %sub179.us.lver.orig, %mul185.us.lver.orig
  %div194.us.lver.orig = fdiv double %sub186.us.lver.orig, %add152.v.r2.us.lver.orig
  %arrayidx198.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv27, i64 %indvars.iv20.lver.orig
  store double %div194.us.lver.orig, double* %arrayidx198.us.lver.orig, align 8
  %indvars.iv.next21.lver.orig = add nuw nsw i64 %indvars.iv20.lver.orig, 1
  %exitcond23.lver.orig = icmp eq i64 %indvars.iv.next21.lver.orig, 999
  br i1 %exitcond23.lver.orig, label %for.cond140.for.end201_crit_edge.us.loopexit, label %for.inc199.us.lver.orig

for.inc199.us.ph:                                 ; preds = %for.inc199.us.lver.check
  %scevgep60 = getelementptr [1000 x double], [1000 x double]* %q, i64 %23, i64 0
  %scevgep57 = getelementptr [1000 x double], [1000 x double]* %p, i64 %23, i64 0
  %load_initial58 = load double, double* %scevgep57, align 8
  %load_initial61 = load double, double* %scevgep60, align 8
  br label %for.inc199.us

for.inc234.us:                                    ; preds = %for.inc231.us
  %exitcond30 = icmp eq i64 %indvars.iv.next28, 999
  %indvar.next44 = add i64 %indvar43, 1
  br i1 %exitcond30, label %for.inc237, label %for.inc199.us.lver.check

for.inc231.us:                                    ; preds = %for.inc231.us, %for.cond140.for.end201_crit_edge.us
  %indvars.iv24 = phi i64 [ 998, %for.cond140.for.end201_crit_edge.us ], [ %indvars.iv.next25.1, %for.inc231.us ]
  %arrayidx215.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv27, i64 %indvars.iv24
  %37 = load double, double* %arrayidx215.us, align 8
  %38 = or i64 %indvars.iv24, 1
  %arrayidx220.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv27, i64 %38
  %39 = load double, double* %arrayidx220.us, align 8
  %mul221.us = fmul double %37, %39
  %arrayidx225.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv27, i64 %indvars.iv24
  %40 = load double, double* %arrayidx225.us, align 8
  %add226.us = fadd double %mul221.us, %40
  %arrayidx230.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv27, i64 %indvars.iv24
  store double %add226.us, double* %arrayidx230.us, align 8
  %indvars.iv.next25 = add nsw i64 %indvars.iv24, -1
  %arrayidx215.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv27, i64 %indvars.iv.next25
  %41 = load double, double* %arrayidx215.us.1, align 8
  %mul221.us.1 = fmul double %41, %add226.us
  %arrayidx225.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv27, i64 %indvars.iv.next25
  %42 = load double, double* %arrayidx225.us.1, align 8
  %add226.us.1 = fadd double %mul221.us.1, %42
  %arrayidx230.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv27, i64 %indvars.iv.next25
  store double %add226.us.1, double* %arrayidx230.us.1, align 8
  %indvars.iv.next25.1 = add nsw i64 %indvars.iv24, -2
  %cmp209.us.1 = icmp sgt i64 %indvars.iv.next25, 1
  br i1 %cmp209.us.1, label %for.inc231.us, label %for.inc234.us

for.inc199.us:                                    ; preds = %for.inc199.us, %for.inc199.us.ph
  %store_forwarded62 = phi double [ %load_initial61, %for.inc199.us.ph ], [ %div194.us, %for.inc199.us ]
  %store_forwarded59 = phi double [ %load_initial58, %for.inc199.us.ph ], [ %div153.us, %for.inc199.us ]
  %indvars.iv20 = phi i64 [ 1, %for.inc199.us.ph ], [ %indvars.iv.next21, %for.inc199.us ]
  %arrayidx157.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv27, i64 %indvars.iv20
  %arrayidx163.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %28, i64 %indvars.iv20
  %arrayidx170.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv27, i64 %indvars.iv20
  %arrayidx177.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv.next28, i64 %indvars.iv20
  %43 = insertelement <2 x double> undef, double %store_forwarded59, i32 0
  %mul151.v.i1.2.us = shufflevector <2 x double> %43, <2 x double> undef, <2 x i32> zeroinitializer
  %mul151.us = fmul <2 x double> %mul151.v.i1.2.us, <double 0xC08F400000000001, double 0xC08F400000000001>
  %add152.us = fadd <2 x double> %mul151.us, <double 0x409F440000000001, double 0x409F440000000001>
  %add152.v.r1.us = extractelement <2 x double> %add152.us, i32 0
  %add152.v.r2.us = extractelement <2 x double> %add152.us, i32 1
  %div153.us = fdiv double 0x408F400000000001, %add152.v.r1.us
  store double %div153.us, double* %arrayidx157.us, align 8
  %44 = load double, double* %arrayidx163.us, align 8
  %45 = fmul double %44, 0xC09F400000000001
  %46 = load double, double* %arrayidx170.us, align 8
  %mul171.us = fmul double %46, 0xC0AF3E0000000001
  %add172.us = fsub double %mul171.us, %45
  %47 = load double, double* %arrayidx177.us, align 8
  %mul178.us = fmul double %47, 0xC09F400000000001
  %sub179.us = fsub double %add172.us, %mul178.us
  %mul185.us = fmul double %store_forwarded62, 0xC08F400000000001
  %sub186.us = fsub double %sub179.us, %mul185.us
  %div194.us = fdiv double %sub186.us, %add152.v.r2.us
  %arrayidx198.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv27, i64 %indvars.iv20
  store double %div194.us, double* %arrayidx198.us, align 8
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next21, 999
  br i1 %exitcond23, label %for.cond140.for.end201_crit_edge.us.loopexit63, label %for.inc199.us

for.cond140.for.end201_crit_edge.us.loopexit:     ; preds = %for.inc199.us.lver.orig
  br label %for.cond140.for.end201_crit_edge.us

for.cond140.for.end201_crit_edge.us.loopexit63:   ; preds = %for.inc199.us
  br label %for.cond140.for.end201_crit_edge.us

for.cond140.for.end201_crit_edge.us:              ; preds = %for.cond140.for.end201_crit_edge.us.loopexit63, %for.cond140.for.end201_crit_edge.us.loopexit
  %arrayidx206.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv27, i64 999
  store double 1.000000e+00, double* %arrayidx206.us, align 8
  br label %for.inc231.us

for.inc237:                                       ; preds = %for.inc234.us
  %inc238 = add nuw nsw i32 %t.011, 1
  %exitcond31 = icmp eq i32 %inc238, 501
  br i1 %exitcond31, label %for.end239, label %for.cond15.preheader

for.end239:                                       ; preds = %for.inc237
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [1000 x double]* nocapture readonly %u) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %entry
  %indvars.iv4 = phi i64 [ 0, %entry ], [ %indvars.iv.next5, %for.inc10 ]
  %3 = mul nuw nsw i64 %indvars.iv4, 1000
  br label %for.body4

for.body4:                                        ; preds = %for.inc, %for.cond2.preheader
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %for.inc ]
  %4 = add nuw nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body4, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv4, i64 %indvars.iv
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %for.inc
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next5, 1000
  br i1 %exitcond7, label %for.end12, label %for.cond2.preheader

for.end12:                                        ; preds = %for.inc10
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
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
