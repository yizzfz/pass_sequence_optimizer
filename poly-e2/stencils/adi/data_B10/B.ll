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
  tail call fastcc void @init_array([1000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay5 = bitcast i8* %call1 to [1000 x double]*
  %arraydecay6 = bitcast i8* %call2 to [1000 x double]*
  %arraydecay7 = bitcast i8* %call3 to [1000 x double]*
  tail call fastcc void @kernel_adi([1000 x double]* %arraydecay, [1000 x double]* %arraydecay5, [1000 x double]* %arraydecay6, [1000 x double]* %arraydecay7)
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
  tail call fastcc void @print_array([1000 x double]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1000 x double]* nocapture %u) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc7_crit_edge.us, %entry
  %indvars.iv11 = phi i64 [ 0, %entry ], [ %indvars.iv.next12, %for.cond1.for.inc7_crit_edge.us ]
  %0 = trunc i64 %indvars.iv11 to i32
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next.1, %for.inc.us ]
  %1 = sub nsw i64 0, %indvars.iv
  %2 = trunc i64 %1 to i32
  %add.us = add nsw i32 %2, 1000
  %sub.us = add nuw nsw i32 %add.us, %0
  %conv.us = sitofp i32 %sub.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv11, i64 %indvars.iv
  store double %div.us, double* %arrayidx6.us, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %3 = trunc i64 %indvars.iv to i32
  %add.us.1 = sub i32 999, %3
  %sub.us.1 = add nuw nsw i32 %add.us.1, %0
  %conv.us.1 = sitofp i32 %sub.us.1 to double
  %div.us.1 = fdiv double %conv.us.1, 1.000000e+03
  %arrayidx6.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv11, i64 %indvars.iv.next
  store double %div.us.1, double* %arrayidx6.us.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 999
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.cond1.for.inc7_crit_edge.us, label %for.inc.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.inc.us
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next12, 1000
  br i1 %exitcond13, label %for.end9, label %for.cond1.preheader.us

for.end9:                                         ; preds = %for.cond1.for.inc7_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi([1000 x double]* nocapture %u, [1000 x double]* nocapture %v, [1000 x double]* %p, [1000 x double]* %q) unnamed_addr #2 {
entry:
  br label %for.cond15.preheader

for.cond15.preheader:                             ; preds = %for.inc237, %entry
  %inc23865 = phi i32 [ 1, %entry ], [ %inc238, %for.inc237 ]
  br label %for.inc.us.lver.check

for.inc.us.lver.check:                            ; preds = %for.inc120.us, %for.cond15.preheader
  %indvar = phi i64 [ 0, %for.cond15.preheader ], [ %indvar.next, %for.inc120.us ]
  %indvars.iv42 = phi i64 [ 1, %for.cond15.preheader ], [ %6, %for.inc120.us ]
  %0 = add i64 %indvar, 1
  %1 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %p, i64 %1, i64 0
  %scevgep2 = getelementptr [1000 x double], [1000 x double]* %p, i64 %1, i64 999
  %scevgep4 = getelementptr [1000 x double], [1000 x double]* %q, i64 %1, i64 0
  %scevgep6 = getelementptr [1000 x double], [1000 x double]* %q, i64 %1, i64 999
  %sext67 = shl i64 %indvars.iv42, 32
  %idxprom.us = ashr exact i64 %sext67, 32
  %arrayidx20.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 0, i64 %idxprom.us
  store double 1.000000e+00, double* %arrayidx20.us, align 8
  %arrayidx23.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv42, i64 0
  store double 0.000000e+00, double* %arrayidx23.us, align 8
  %arrayidx26.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 0, i64 %indvars.iv42
  %2 = bitcast double* %arrayidx26.us to i64*
  %3 = load i64, i64* %2, align 8
  %arrayidx28.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv42
  %4 = bitcast [1000 x double]* %arrayidx28.us to i64*
  store i64 %3, i64* %4, align 8
  %5 = add nsw i64 %indvars.iv42, -1
  %6 = add nuw nsw i64 %indvars.iv42, 1
  %bound0 = icmp ult double* %scevgep, %scevgep6
  %bound1 = icmp ult double* %scevgep4, %scevgep2
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.inc.us.lver.orig.preheader, label %for.inc.us.ph

for.inc.us.lver.orig.preheader:                   ; preds = %for.inc.us.lver.check
  br label %for.inc.us.lver.orig

for.inc.us.lver.orig:                             ; preds = %for.inc.us.lver.orig.preheader, %for.inc.us.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %for.inc.us.lver.orig ], [ 1, %for.inc.us.lver.orig.preheader ]
  %7 = add nsw i64 %indvars.iv.lver.orig, -1
  %arrayidx40.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv42, i64 %7
  %8 = load double, double* %arrayidx40.us.lver.orig, align 8
  %mul41.us.lver.orig = fmul double %8, 0xC09F400000000001
  %add42.us.lver.orig = fadd double %mul41.us.lver.orig, 0x40AF420000000001
  %div43.us.lver.orig = fdiv double 0x409F400000000001, %add42.us.lver.orig
  %arrayidx47.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv42, i64 %indvars.iv.lver.orig
  store double %div43.us.lver.orig, double* %arrayidx47.us.lver.orig, align 8
  %arrayidx53.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv.lver.orig, i64 %5
  %9 = bitcast double* %arrayidx53.us.lver.orig to <2 x double>*
  %10 = load <2 x double>, <2 x double>* %9, align 8
  %mul61.us.lver.orig = fmul <2 x double> %10, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %mul61.us.v.r1.lver.orig = extractelement <2 x double> %mul61.us.lver.orig, i32 0
  %mul61.us.v.r2.lver.orig = extractelement <2 x double> %mul61.us.lver.orig, i32 1
  %add62.us.lver.orig = fsub double %mul61.us.v.r2.lver.orig, %mul61.us.v.r1.lver.orig
  %arrayidx67.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv.lver.orig, i64 %6
  %11 = load double, double* %arrayidx67.us.lver.orig, align 8
  %mul68.us.lver.orig = fmul double %11, 0xC08F400000000001
  %sub69.us.lver.orig = fsub double %add62.us.lver.orig, %mul68.us.lver.orig
  %arrayidx74.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv42, i64 %7
  %12 = load double, double* %arrayidx74.us.lver.orig, align 8
  %mul75.us.lver.orig = fmul double %12, 0xC09F400000000001
  %sub76.us.lver.orig = fsub double %sub69.us.lver.orig, %mul75.us.lver.orig
  %div84.us.lver.orig = fdiv double %sub76.us.lver.orig, %add42.us.lver.orig
  %arrayidx88.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv42, i64 %indvars.iv.lver.orig
  store double %div84.us.lver.orig, double* %arrayidx88.us.lver.orig, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, 999
  br i1 %exitcond.lver.orig, label %for.cond30.for.end_crit_edge.us.loopexit, label %for.inc.us.lver.orig

for.inc.us.ph:                                    ; preds = %for.inc.us.lver.check
  %scevgep9 = getelementptr [1000 x double], [1000 x double]* %q, i64 %0, i64 0
  %scevgep8 = getelementptr [1000 x double], [1000 x double]* %p, i64 %0, i64 0
  %load_initial = load double, double* %scevgep8, align 8
  %load_initial10 = load double, double* %scevgep9, align 8
  br label %for.inc.us

for.inc120.us:                                    ; preds = %for.inc118.us
  %exitcond78 = icmp eq i64 %6, 999
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond78, label %for.inc199.us.lver.check.preheader, label %for.inc.us.lver.check

for.inc199.us.lver.check.preheader:               ; preds = %for.inc120.us
  br label %for.inc199.us.lver.check

for.inc118.us:                                    ; preds = %for.inc118.us, %for.cond30.for.end_crit_edge.us
  %13 = phi double [ 1.000000e+00, %for.cond30.for.end_crit_edge.us ], [ %add113.us.1, %for.inc118.us ]
  %indvars.iv39 = phi i64 [ 998, %for.cond30.for.end_crit_edge.us ], [ %indvars.iv.next40.1, %for.inc118.us ]
  %arrayidx102.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv42, i64 %indvars.iv39
  %14 = load double, double* %arrayidx102.us, align 8
  %mul108.us = fmul double %14, %13
  %arrayidx112.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv42, i64 %indvars.iv39
  %15 = load double, double* %arrayidx112.us, align 8
  %add113.us = fadd double %mul108.us, %15
  %arrayidx117.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv39, i64 %indvars.iv42
  store double %add113.us, double* %arrayidx117.us, align 8
  %indvars.iv.next40 = add nsw i64 %indvars.iv39, -1
  %arrayidx102.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv42, i64 %indvars.iv.next40
  %16 = load double, double* %arrayidx102.us.1, align 8
  %mul108.us.1 = fmul double %16, %add113.us
  %arrayidx112.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv42, i64 %indvars.iv.next40
  %17 = load double, double* %arrayidx112.us.1, align 8
  %add113.us.1 = fadd double %mul108.us.1, %17
  %arrayidx117.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv.next40, i64 %indvars.iv42
  store double %add113.us.1, double* %arrayidx117.us.1, align 8
  %cmp96.us.1 = icmp sgt i64 %indvars.iv.next40, 1
  %indvars.iv.next40.1 = add nsw i64 %indvars.iv39, -2
  br i1 %cmp96.us.1, label %for.inc118.us, label %for.inc120.us

for.inc.us:                                       ; preds = %for.inc.us, %for.inc.us.ph
  %store_forwarded11 = phi double [ %load_initial10, %for.inc.us.ph ], [ %div84.us, %for.inc.us ]
  %store_forwarded = phi double [ %load_initial, %for.inc.us.ph ], [ %div43.us, %for.inc.us ]
  %indvars.iv = phi i64 [ 1, %for.inc.us.ph ], [ %indvars.iv.next, %for.inc.us ]
  %mul41.us = fmul double %store_forwarded, 0xC09F400000000001
  %add42.us = fadd double %mul41.us, 0x40AF420000000001
  %div43.us = fdiv double 0x409F400000000001, %add42.us
  %arrayidx47.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv42, i64 %indvars.iv
  store double %div43.us, double* %arrayidx47.us, align 8
  %arrayidx53.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv, i64 %5
  %18 = bitcast double* %arrayidx53.us to <2 x double>*
  %19 = load <2 x double>, <2 x double>* %18, align 8
  %mul61.us = fmul <2 x double> %19, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %mul61.us.v.r1 = extractelement <2 x double> %mul61.us, i32 0
  %mul61.us.v.r2 = extractelement <2 x double> %mul61.us, i32 1
  %add62.us = fsub double %mul61.us.v.r2, %mul61.us.v.r1
  %arrayidx67.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv, i64 %6
  %20 = load double, double* %arrayidx67.us, align 8
  %mul68.us = fmul double %20, 0xC08F400000000001
  %sub69.us = fsub double %add62.us, %mul68.us
  %mul75.us = fmul double %store_forwarded11, 0xC09F400000000001
  %sub76.us = fsub double %sub69.us, %mul75.us
  %div84.us = fdiv double %sub76.us, %add42.us
  %arrayidx88.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv42, i64 %indvars.iv
  store double %div84.us, double* %arrayidx88.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond, label %for.cond30.for.end_crit_edge.us.loopexit33, label %for.inc.us

for.cond30.for.end_crit_edge.us.loopexit:         ; preds = %for.inc.us.lver.orig
  br label %for.cond30.for.end_crit_edge.us

for.cond30.for.end_crit_edge.us.loopexit33:       ; preds = %for.inc.us
  br label %for.cond30.for.end_crit_edge.us

for.cond30.for.end_crit_edge.us:                  ; preds = %for.cond30.for.end_crit_edge.us.loopexit33, %for.cond30.for.end_crit_edge.us.loopexit
  %arrayidx93.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 999, i64 %indvars.iv42
  store double 1.000000e+00, double* %arrayidx93.us, align 8
  br label %for.inc118.us

for.inc199.us.lver.check:                         ; preds = %for.inc199.us.lver.check.preheader, %for.inc234.us
  %indvar12 = phi i64 [ %indvar.next13, %for.inc234.us ], [ 0, %for.inc199.us.lver.check.preheader ]
  %indvars.iv54 = phi i64 [ %27, %for.inc234.us ], [ 1, %for.inc199.us.lver.check.preheader ]
  %21 = add i64 %indvar12, 1
  %22 = add i64 %indvar12, 1
  %scevgep14 = getelementptr [1000 x double], [1000 x double]* %p, i64 %22, i64 0
  %scevgep16 = getelementptr [1000 x double], [1000 x double]* %p, i64 %22, i64 999
  %scevgep18 = getelementptr [1000 x double], [1000 x double]* %q, i64 %22, i64 0
  %scevgep20 = getelementptr [1000 x double], [1000 x double]* %q, i64 %22, i64 999
  %sext = shl i64 %indvars.iv54, 32
  %idxprom128.us = ashr exact i64 %sext, 32
  %arrayidx130.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %idxprom128.us, i64 0
  store double 1.000000e+00, double* %arrayidx130.us, align 8
  %arrayidx133.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv54, i64 0
  store double 0.000000e+00, double* %arrayidx133.us, align 8
  %arrayidx136.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv54, i64 0
  %23 = bitcast double* %arrayidx136.us to i64*
  %24 = load i64, i64* %23, align 8
  %arrayidx138.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv54
  %25 = bitcast [1000 x double]* %arrayidx138.us to i64*
  store i64 %24, i64* %25, align 8
  %26 = add nsw i64 %indvars.iv54, -1
  %27 = add nuw nsw i64 %indvars.iv54, 1
  %bound022 = icmp ult double* %scevgep14, %scevgep20
  %bound123 = icmp ult double* %scevgep18, %scevgep16
  %memcheck.conflict25 = and i1 %bound022, %bound123
  br i1 %memcheck.conflict25, label %for.inc199.us.lver.orig.preheader, label %for.inc199.us.ph

for.inc199.us.lver.orig.preheader:                ; preds = %for.inc199.us.lver.check
  br label %for.inc199.us.lver.orig

for.inc199.us.lver.orig:                          ; preds = %for.inc199.us.lver.orig.preheader, %for.inc199.us.lver.orig
  %indvars.iv47.lver.orig = phi i64 [ %indvars.iv.next48.lver.orig, %for.inc199.us.lver.orig ], [ 1, %for.inc199.us.lver.orig.preheader ]
  %28 = add nsw i64 %indvars.iv47.lver.orig, -1
  %arrayidx150.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv54, i64 %28
  %29 = load double, double* %arrayidx150.us.lver.orig, align 8
  %mul151.us.lver.orig = fmul double %29, 0xC08F400000000001
  %add152.us.lver.orig = fadd double %mul151.us.lver.orig, 0x409F440000000001
  %div153.us.lver.orig = fdiv double 0x408F400000000001, %add152.us.lver.orig
  %arrayidx157.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv54, i64 %indvars.iv47.lver.orig
  store double %div153.us.lver.orig, double* %arrayidx157.us.lver.orig, align 8
  %arrayidx163.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %26, i64 %indvars.iv47.lver.orig
  %30 = load double, double* %arrayidx163.us.lver.orig, align 8
  %31 = fmul double %30, 0xC09F400000000001
  %arrayidx170.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv54, i64 %indvars.iv47.lver.orig
  %32 = load double, double* %arrayidx170.us.lver.orig, align 8
  %mul171.us.lver.orig = fmul double %32, 0xC0AF3E0000000001
  %add172.us.lver.orig = fsub double %mul171.us.lver.orig, %31
  %arrayidx177.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %27, i64 %indvars.iv47.lver.orig
  %33 = load double, double* %arrayidx177.us.lver.orig, align 8
  %mul178.us.lver.orig = fmul double %33, 0xC09F400000000001
  %sub179.us.lver.orig = fsub double %add172.us.lver.orig, %mul178.us.lver.orig
  %arrayidx184.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv54, i64 %28
  %34 = load double, double* %arrayidx184.us.lver.orig, align 8
  %mul185.us.lver.orig = fmul double %34, 0xC08F400000000001
  %sub186.us.lver.orig = fsub double %sub179.us.lver.orig, %mul185.us.lver.orig
  %div194.us.lver.orig = fdiv double %sub186.us.lver.orig, %add152.us.lver.orig
  %arrayidx198.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv54, i64 %indvars.iv47.lver.orig
  store double %div194.us.lver.orig, double* %arrayidx198.us.lver.orig, align 8
  %indvars.iv.next48.lver.orig = add nuw nsw i64 %indvars.iv47.lver.orig, 1
  %exitcond79.lver.orig = icmp eq i64 %indvars.iv.next48.lver.orig, 999
  br i1 %exitcond79.lver.orig, label %for.cond140.for.end201_crit_edge.us.loopexit, label %for.inc199.us.lver.orig

for.inc199.us.ph:                                 ; preds = %for.inc199.us.lver.check
  %scevgep29 = getelementptr [1000 x double], [1000 x double]* %q, i64 %21, i64 0
  %scevgep26 = getelementptr [1000 x double], [1000 x double]* %p, i64 %21, i64 0
  %load_initial27 = load double, double* %scevgep26, align 8
  %load_initial30 = load double, double* %scevgep29, align 8
  br label %for.inc199.us

for.inc234.us:                                    ; preds = %for.inc231.us
  %exitcond80 = icmp eq i64 %27, 999
  %indvar.next13 = add i64 %indvar12, 1
  br i1 %exitcond80, label %for.inc237, label %for.inc199.us.lver.check

for.inc231.us:                                    ; preds = %for.inc231.us, %for.cond140.for.end201_crit_edge.us
  %35 = phi double [ 1.000000e+00, %for.cond140.for.end201_crit_edge.us ], [ %add226.us.1, %for.inc231.us ]
  %indvars.iv51 = phi i64 [ 998, %for.cond140.for.end201_crit_edge.us ], [ %indvars.iv.next52.1, %for.inc231.us ]
  %arrayidx215.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv54, i64 %indvars.iv51
  %36 = load double, double* %arrayidx215.us, align 8
  %mul221.us = fmul double %36, %35
  %arrayidx225.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv54, i64 %indvars.iv51
  %37 = load double, double* %arrayidx225.us, align 8
  %add226.us = fadd double %mul221.us, %37
  %arrayidx230.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv54, i64 %indvars.iv51
  store double %add226.us, double* %arrayidx230.us, align 8
  %indvars.iv.next52 = add nsw i64 %indvars.iv51, -1
  %arrayidx215.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv54, i64 %indvars.iv.next52
  %38 = load double, double* %arrayidx215.us.1, align 8
  %mul221.us.1 = fmul double %38, %add226.us
  %arrayidx225.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv54, i64 %indvars.iv.next52
  %39 = load double, double* %arrayidx225.us.1, align 8
  %add226.us.1 = fadd double %mul221.us.1, %39
  %arrayidx230.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv54, i64 %indvars.iv.next52
  store double %add226.us.1, double* %arrayidx230.us.1, align 8
  %cmp209.us.1 = icmp sgt i64 %indvars.iv.next52, 1
  %indvars.iv.next52.1 = add nsw i64 %indvars.iv51, -2
  br i1 %cmp209.us.1, label %for.inc231.us, label %for.inc234.us

for.inc199.us:                                    ; preds = %for.inc199.us, %for.inc199.us.ph
  %store_forwarded31 = phi double [ %load_initial30, %for.inc199.us.ph ], [ %div194.us, %for.inc199.us ]
  %store_forwarded28 = phi double [ %load_initial27, %for.inc199.us.ph ], [ %div153.us, %for.inc199.us ]
  %indvars.iv47 = phi i64 [ 1, %for.inc199.us.ph ], [ %indvars.iv.next48, %for.inc199.us ]
  %mul151.us = fmul double %store_forwarded28, 0xC08F400000000001
  %add152.us = fadd double %mul151.us, 0x409F440000000001
  %div153.us = fdiv double 0x408F400000000001, %add152.us
  %arrayidx157.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv54, i64 %indvars.iv47
  store double %div153.us, double* %arrayidx157.us, align 8
  %arrayidx163.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %26, i64 %indvars.iv47
  %40 = load double, double* %arrayidx163.us, align 8
  %41 = fmul double %40, 0xC09F400000000001
  %arrayidx170.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv54, i64 %indvars.iv47
  %42 = load double, double* %arrayidx170.us, align 8
  %mul171.us = fmul double %42, 0xC0AF3E0000000001
  %add172.us = fsub double %mul171.us, %41
  %arrayidx177.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %27, i64 %indvars.iv47
  %43 = load double, double* %arrayidx177.us, align 8
  %mul178.us = fmul double %43, 0xC09F400000000001
  %sub179.us = fsub double %add172.us, %mul178.us
  %mul185.us = fmul double %store_forwarded31, 0xC08F400000000001
  %sub186.us = fsub double %sub179.us, %mul185.us
  %div194.us = fdiv double %sub186.us, %add152.us
  %arrayidx198.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv54, i64 %indvars.iv47
  store double %div194.us, double* %arrayidx198.us, align 8
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond79 = icmp eq i64 %indvars.iv.next48, 999
  br i1 %exitcond79, label %for.cond140.for.end201_crit_edge.us.loopexit32, label %for.inc199.us

for.cond140.for.end201_crit_edge.us.loopexit:     ; preds = %for.inc199.us.lver.orig
  br label %for.cond140.for.end201_crit_edge.us

for.cond140.for.end201_crit_edge.us.loopexit32:   ; preds = %for.inc199.us
  br label %for.cond140.for.end201_crit_edge.us

for.cond140.for.end201_crit_edge.us:              ; preds = %for.cond140.for.end201_crit_edge.us.loopexit32, %for.cond140.for.end201_crit_edge.us.loopexit
  %arrayidx206.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv54, i64 999
  store double 1.000000e+00, double* %arrayidx206.us, align 8
  br label %for.inc231.us

for.inc237:                                       ; preds = %for.inc234.us
  %inc238 = add nuw nsw i32 %inc23865, 1
  %exitcond81 = icmp eq i32 %inc238, 501
  br i1 %exitcond81, label %for.end239, label %for.cond15.preheader

for.end239:                                       ; preds = %for.inc237
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1000 x double]* nocapture readonly %u) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv11 = phi i64 [ 0, %entry ], [ %indvars.iv.next12, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv11, 1000
  %4 = trunc i64 %3 to i32
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %inc4.us = phi i32 [ 0, %for.cond2.preheader.us ], [ %inc.us, %for.inc.us ]
  %add.us = add nuw nsw i32 %4, %inc4.us
  %rem.us = srem i32 %add.us, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %5) #5
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv11, i64 %indvars.iv
  %7 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %7) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %inc.us = add nuw nsw i32 %inc4.us, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond1, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond = icmp eq i64 %indvars.iv.next12, 1000
  br i1 %exitcond, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %10 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %9) #5
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
