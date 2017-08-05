; ModuleID = 'A.ll'
source_filename = "adi.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"u\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
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
  %cmp3 = icmp sgt i32 %n, 0
  br i1 %cmp3, label %for.cond1.preheader.lr.ph, label %for.end9

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %conv4 = sitofp i32 %n to double
  %0 = sext i32 %n to i64
  %xtraiter = and i32 %n, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %1 = icmp eq i32 %n, 1
  %wide.trip.count8 = zext i32 %n to i64
  %wide.trip.count.1 = zext i32 %n to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc7_crit_edge.us, %for.cond1.preheader.lr.ph
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %for.cond1.for.inc7_crit_edge.us ], [ 0, %for.cond1.preheader.lr.ph ]
  %2 = add nsw i64 %indvars.iv5, %0
  br i1 %lcmp.mod, label %for.body3.us.prol.loopexit, label %for.body3.us.prol

for.body3.us.prol:                                ; preds = %for.cond1.preheader.us
  %3 = trunc i64 %2 to i32
  %conv.us.prol = sitofp i32 %3 to double
  %div.us.prol = fdiv double %conv.us.prol, %conv4
  %arrayidx6.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv5, i64 0
  store double %div.us.prol, double* %arrayidx6.us.prol, align 8
  br label %for.body3.us.prol.loopexit

for.body3.us.prol.loopexit:                       ; preds = %for.body3.us.prol, %for.cond1.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body3.us.prol ], [ 0, %for.cond1.preheader.us ]
  br i1 %1, label %for.cond1.for.inc7_crit_edge.us, label %for.body3.us.preheader

for.body3.us.preheader:                           ; preds = %for.body3.us.prol.loopexit
  %4 = trunc i64 %2 to i32
  %5 = trunc i64 %2 to i32
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.body3.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body3.us ], [ %indvars.iv.unr.ph, %for.body3.us.preheader ]
  %6 = trunc i64 %indvars.iv to i32
  %sub.us = sub i32 %4, %6
  %conv.us = sitofp i32 %sub.us to double
  %div.us = fdiv double %conv.us, %conv4
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv5, i64 %indvars.iv
  store double %div.us, double* %arrayidx6.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %7 = trunc i64 %indvars.iv.next to i32
  %sub.us.1 = sub i32 %5, %7
  %conv.us.1 = sitofp i32 %sub.us.1 to double
  %div.us.1 = fdiv double %conv.us.1, %conv4
  %arrayidx6.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv5, i64 %indvars.iv.next
  store double %div.us.1, double* %arrayidx6.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.cond1.for.inc7_crit_edge.us.loopexit, label %for.body3.us

for.cond1.for.inc7_crit_edge.us.loopexit:         ; preds = %for.body3.us
  br label %for.cond1.for.inc7_crit_edge.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.cond1.for.inc7_crit_edge.us.loopexit, %for.body3.us.prol.loopexit
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next6, %wide.trip.count8
  br i1 %exitcond, label %for.end9.loopexit, label %for.cond1.preheader.us

for.end9.loopexit:                                ; preds = %for.cond1.for.inc7_crit_edge.us
  br label %for.end9

for.end9:                                         ; preds = %for.end9.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi(i32 %tsteps, i32 %n, [1000 x double]* nocapture %u, [1000 x double]* nocapture %v, [1000 x double]* nocapture %p, [1000 x double]* nocapture %q) unnamed_addr #2 {
entry:
  %conv = sitofp i32 %n to double
  %div = fdiv double 1.000000e+00, %conv
  %conv3 = sitofp i32 %tsteps to double
  %div4 = fdiv double 1.000000e+00, %conv3
  %mul = fmul double %div4, 2.000000e+00
  %mul5 = fmul double %div, %div
  %div6 = fdiv double %mul, %mul5
  %div9 = fdiv double %div4, %mul5
  %div10 = fmul double %div6, -5.000000e-01
  %add = fadd double %div6, 1.000000e+00
  %div12 = fmul double %div9, -5.000000e-01
  %add13 = fadd double %div9, 1.000000e+00
  %cmp13 = icmp slt i32 %tsteps, 1
  br i1 %cmp13, label %for.end239, label %for.cond15.preheader.lr.ph

for.cond15.preheader.lr.ph:                       ; preds = %entry
  %sub16 = add nsw i32 %n, -1
  %cmp175 = icmp sgt i32 %sub16, 1
  %idxprom90 = sext i32 %sub16 to i64
  %sub94 = add nsw i32 %n, -2
  %cmp963 = icmp sgt i32 %n, 2
  %sub35 = fsub double -0.000000e+00, %div10
  %mul55 = fmul double %div12, 2.000000e+00
  %add56 = fadd double %mul55, 1.000000e+00
  %cmp2099 = icmp sgt i32 %n, 2
  %sub145 = fsub double -0.000000e+00, %div12
  %mul165 = fmul double %div10, 2.000000e+00
  %add166 = fadd double %mul165, 1.000000e+00
  %0 = sext i32 %sub94 to i64
  %1 = add i32 %n, -3
  %wide.trip.count = zext i32 %sub16 to i64
  %xtraiter = and i32 %sub94, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %2 = icmp eq i32 %1, 0
  %3 = add nsw i64 %0, 1
  %indvars.iv.next17.prol = add nsw i64 %0, -1
  %wide.trip.count22 = zext i32 %sub16 to i64
  %cmp12511 = icmp sgt i32 %sub16, 1
  %idxprom205 = sext i32 %sub16 to i64
  %wide.trip.count27 = zext i32 %sub16 to i64
  %xtraiter32 = and i32 %sub94, 1
  %lcmp.mod33 = icmp eq i32 %xtraiter32, 0
  %4 = icmp eq i32 %1, 0
  %5 = add nsw i64 %0, 1
  %indvars.iv.next30.prol = add nsw i64 %0, -1
  %wide.trip.count37 = zext i32 %sub16 to i64
  br label %for.cond15.preheader

for.cond15.preheader:                             ; preds = %for.inc237, %for.cond15.preheader.lr.ph
  %t.014 = phi i32 [ 1, %for.cond15.preheader.lr.ph ], [ %inc238, %for.inc237 ]
  br i1 %cmp175, label %for.body34.us.lver.check.preheader, label %for.inc237

for.body34.us.lver.check.preheader:               ; preds = %for.cond15.preheader
  br label %for.body34.us.lver.check

for.body34.us.lver.check:                         ; preds = %for.body34.us.lver.check.preheader, %for.inc120.us
  %indvar = phi i64 [ %indvar.next, %for.inc120.us ], [ 0, %for.body34.us.lver.check.preheader ]
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %for.inc120.us ], [ 1, %for.body34.us.lver.check.preheader ]
  %6 = add i64 %indvar, 1
  %7 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %p, i64 %7, i64 0
  %scevgep46 = getelementptr [1000 x double], [1000 x double]* %p, i64 %7, i64 %wide.trip.count
  %scevgep48 = getelementptr [1000 x double], [1000 x double]* %q, i64 %7, i64 0
  %scevgep50 = getelementptr [1000 x double], [1000 x double]* %q, i64 %7, i64 %wide.trip.count
  %arrayidx20.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 0, i64 %indvars.iv19
  store double 1.000000e+00, double* %arrayidx20.us, align 8
  %arrayidx23.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv19, i64 0
  store double 0.000000e+00, double* %arrayidx23.us, align 8
  %8 = bitcast double* %arrayidx20.us to i64*
  %9 = load i64, i64* %8, align 8
  %arrayidx28.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv19
  %10 = bitcast [1000 x double]* %arrayidx28.us to i64*
  store i64 %9, i64* %10, align 8
  %11 = add nsw i64 %indvars.iv19, -1
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %bound0 = icmp ult double* %scevgep, %scevgep50
  %bound1 = icmp ult double* %scevgep48, %scevgep46
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.body34.us.lver.orig.preheader, label %for.body34.us.ph

for.body34.us.lver.orig.preheader:                ; preds = %for.body34.us.lver.check
  br label %for.body34.us.lver.orig

for.body34.us.lver.orig:                          ; preds = %for.body34.us.lver.orig.preheader, %for.body34.us.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %for.body34.us.lver.orig ], [ 1, %for.body34.us.lver.orig.preheader ]
  %12 = add nsw i64 %indvars.iv.lver.orig, -1
  %arrayidx40.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv19, i64 %12
  %13 = load double, double* %arrayidx40.us.lver.orig, align 8
  %mul41.us.lver.orig = fmul double %div10, %13
  %add42.us.lver.orig = fadd double %add, %mul41.us.lver.orig
  %div43.us.lver.orig = fdiv double %sub35, %add42.us.lver.orig
  %arrayidx47.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv19, i64 %indvars.iv.lver.orig
  store double %div43.us.lver.orig, double* %arrayidx47.us.lver.orig, align 8
  %arrayidx53.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv.lver.orig, i64 %11
  %14 = load double, double* %arrayidx53.us.lver.orig, align 8
  %15 = fmul double %div12, %14
  %arrayidx60.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv.lver.orig, i64 %indvars.iv19
  %16 = load double, double* %arrayidx60.us.lver.orig, align 8
  %mul61.us.lver.orig = fmul double %add56, %16
  %add62.us.lver.orig = fsub double %mul61.us.lver.orig, %15
  %arrayidx67.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next20
  %17 = load double, double* %arrayidx67.us.lver.orig, align 8
  %mul68.us.lver.orig = fmul double %div12, %17
  %sub69.us.lver.orig = fsub double %add62.us.lver.orig, %mul68.us.lver.orig
  %arrayidx74.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv19, i64 %12
  %18 = load double, double* %arrayidx74.us.lver.orig, align 8
  %mul75.us.lver.orig = fmul double %div10, %18
  %sub76.us.lver.orig = fsub double %sub69.us.lver.orig, %mul75.us.lver.orig
  %19 = load double, double* %arrayidx40.us.lver.orig, align 8
  %mul82.us.lver.orig = fmul double %div10, %19
  %add83.us.lver.orig = fadd double %add, %mul82.us.lver.orig
  %div84.us.lver.orig = fdiv double %sub76.us.lver.orig, %add83.us.lver.orig
  %arrayidx88.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv19, i64 %indvars.iv.lver.orig
  store double %div84.us.lver.orig, double* %arrayidx88.us.lver.orig, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, %wide.trip.count
  br i1 %exitcond.lver.orig, label %for.cond30.for.end_crit_edge.us.loopexit, label %for.body34.us.lver.orig

for.body34.us.ph:                                 ; preds = %for.body34.us.lver.check
  %scevgep52 = getelementptr [1000 x double], [1000 x double]* %p, i64 %6, i64 0
  %scevgep55 = getelementptr [1000 x double], [1000 x double]* %q, i64 %6, i64 0
  %load_initial = load double, double* %scevgep52, align 8
  %load_initial56 = load double, double* %scevgep55, align 8
  br label %for.body34.us

for.inc120.us.loopexit:                           ; preds = %for.body98.us
  br label %for.inc120.us

for.inc120.us:                                    ; preds = %for.inc120.us.loopexit, %for.body98.us.prol.loopexit, %for.cond30.for.end_crit_edge.us
  %exitcond23 = icmp eq i64 %indvars.iv.next20, %wide.trip.count22
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond23, label %for.cond123.preheader, label %for.body34.us.lver.check

for.body98.us:                                    ; preds = %for.body98.us.preheader82, %for.body98.us
  %indvars.iv16 = phi i64 [ %indvars.iv.next17.1, %for.body98.us ], [ %indvars.iv16.unr.ph, %for.body98.us.preheader82 ]
  %arrayidx102.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv19, i64 %indvars.iv16
  %20 = load double, double* %arrayidx102.us, align 8
  %21 = add nsw i64 %indvars.iv16, 1
  %arrayidx107.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %21, i64 %indvars.iv19
  %22 = load double, double* %arrayidx107.us, align 8
  %mul108.us = fmul double %20, %22
  %arrayidx112.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv19, i64 %indvars.iv16
  %23 = load double, double* %arrayidx112.us, align 8
  %add113.us = fadd double %mul108.us, %23
  %arrayidx117.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv16, i64 %indvars.iv19
  store double %add113.us, double* %arrayidx117.us, align 8
  %indvars.iv.next17 = add nsw i64 %indvars.iv16, -1
  %arrayidx102.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv19, i64 %indvars.iv.next17
  %24 = load double, double* %arrayidx102.us.1, align 8
  %mul108.us.1 = fmul double %24, %add113.us
  %arrayidx112.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv19, i64 %indvars.iv.next17
  %25 = load double, double* %arrayidx112.us.1, align 8
  %add113.us.1 = fadd double %mul108.us.1, %25
  %arrayidx117.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv.next17, i64 %indvars.iv19
  store double %add113.us.1, double* %arrayidx117.us.1, align 8
  %indvars.iv.next17.1 = add nsw i64 %indvars.iv16, -2
  %cmp96.us.1 = icmp sgt i64 %indvars.iv.next17, 1
  br i1 %cmp96.us.1, label %for.body98.us, label %for.inc120.us.loopexit

for.body34.us:                                    ; preds = %for.body34.us, %for.body34.us.ph
  %store_forwarded57 = phi double [ %load_initial56, %for.body34.us.ph ], [ %div84.us, %for.body34.us ]
  %store_forwarded54 = phi double [ %load_initial, %for.body34.us.ph ], [ %div43.us, %for.body34.us ]
  %indvars.iv = phi i64 [ 1, %for.body34.us.ph ], [ %indvars.iv.next, %for.body34.us ]
  %mul41.us = fmul double %div10, %store_forwarded54
  %add42.us = fadd double %add, %mul41.us
  %div43.us = fdiv double %sub35, %add42.us
  %arrayidx47.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv19, i64 %indvars.iv
  store double %div43.us, double* %arrayidx47.us, align 8
  %arrayidx53.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv, i64 %11
  %26 = load double, double* %arrayidx53.us, align 8
  %27 = fmul double %div12, %26
  %arrayidx60.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv, i64 %indvars.iv19
  %28 = load double, double* %arrayidx60.us, align 8
  %mul61.us = fmul double %add56, %28
  %add62.us = fsub double %mul61.us, %27
  %arrayidx67.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv, i64 %indvars.iv.next20
  %29 = load double, double* %arrayidx67.us, align 8
  %mul68.us = fmul double %div12, %29
  %sub69.us = fsub double %add62.us, %mul68.us
  %mul75.us = fmul double %div10, %store_forwarded57
  %sub76.us = fsub double %sub69.us, %mul75.us
  %mul82.us = fmul double %div10, %store_forwarded54
  %add83.us = fadd double %add, %mul82.us
  %div84.us = fdiv double %sub76.us, %add83.us
  %arrayidx88.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv19, i64 %indvars.iv
  store double %div84.us, double* %arrayidx88.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond30.for.end_crit_edge.us.loopexit83, label %for.body34.us

for.cond30.for.end_crit_edge.us.loopexit:         ; preds = %for.body34.us.lver.orig
  br label %for.cond30.for.end_crit_edge.us

for.cond30.for.end_crit_edge.us.loopexit83:       ; preds = %for.body34.us
  br label %for.cond30.for.end_crit_edge.us

for.cond30.for.end_crit_edge.us:                  ; preds = %for.cond30.for.end_crit_edge.us.loopexit83, %for.cond30.for.end_crit_edge.us.loopexit
  %arrayidx93.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %idxprom90, i64 %indvars.iv19
  store double 1.000000e+00, double* %arrayidx93.us, align 8
  br i1 %cmp963, label %for.body98.us.preheader, label %for.inc120.us

for.body98.us.preheader:                          ; preds = %for.cond30.for.end_crit_edge.us
  br i1 %lcmp.mod, label %for.body98.us.prol.loopexit, label %for.body98.us.prol

for.body98.us.prol:                               ; preds = %for.body98.us.preheader
  %arrayidx102.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv19, i64 %0
  %30 = load double, double* %arrayidx102.us.prol, align 8
  %arrayidx107.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %3, i64 %indvars.iv19
  %31 = load double, double* %arrayidx107.us.prol, align 8
  %mul108.us.prol = fmul double %30, %31
  %arrayidx112.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv19, i64 %0
  %32 = load double, double* %arrayidx112.us.prol, align 8
  %add113.us.prol = fadd double %mul108.us.prol, %32
  %arrayidx117.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %0, i64 %indvars.iv19
  store double %add113.us.prol, double* %arrayidx117.us.prol, align 8
  br label %for.body98.us.prol.loopexit

for.body98.us.prol.loopexit:                      ; preds = %for.body98.us.prol, %for.body98.us.preheader
  %indvars.iv16.unr.ph = phi i64 [ %indvars.iv.next17.prol, %for.body98.us.prol ], [ %0, %for.body98.us.preheader ]
  br i1 %2, label %for.inc120.us, label %for.body98.us.preheader82

for.body98.us.preheader82:                        ; preds = %for.body98.us.prol.loopexit
  br label %for.body98.us

for.cond123.preheader:                            ; preds = %for.inc120.us
  br i1 %cmp12511, label %for.body144.us.lver.check.preheader, label %for.inc237

for.body144.us.lver.check.preheader:              ; preds = %for.cond123.preheader
  br label %for.body144.us.lver.check

for.body144.us.lver.check:                        ; preds = %for.body144.us.lver.check.preheader, %for.inc234.us
  %indvar58 = phi i64 [ %indvar.next59, %for.inc234.us ], [ 0, %for.body144.us.lver.check.preheader ]
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %for.inc234.us ], [ 1, %for.body144.us.lver.check.preheader ]
  %33 = add i64 %indvar58, 1
  %34 = add i64 %indvar58, 1
  %scevgep60 = getelementptr [1000 x double], [1000 x double]* %p, i64 %34, i64 0
  %scevgep62 = getelementptr [1000 x double], [1000 x double]* %p, i64 %34, i64 %wide.trip.count
  %scevgep64 = getelementptr [1000 x double], [1000 x double]* %q, i64 %34, i64 0
  %scevgep66 = getelementptr [1000 x double], [1000 x double]* %q, i64 %34, i64 %wide.trip.count
  %arrayidx130.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv34, i64 0
  store double 1.000000e+00, double* %arrayidx130.us, align 8
  %arrayidx133.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv34, i64 0
  store double 0.000000e+00, double* %arrayidx133.us, align 8
  %35 = bitcast double* %arrayidx130.us to i64*
  %36 = load i64, i64* %35, align 8
  %arrayidx138.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv34
  %37 = bitcast [1000 x double]* %arrayidx138.us to i64*
  store i64 %36, i64* %37, align 8
  %38 = add nsw i64 %indvars.iv34, -1
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %bound068 = icmp ult double* %scevgep60, %scevgep66
  %bound169 = icmp ult double* %scevgep64, %scevgep62
  %memcheck.conflict71 = and i1 %bound068, %bound169
  br i1 %memcheck.conflict71, label %for.body144.us.lver.orig.preheader, label %for.body144.us.ph

for.body144.us.lver.orig.preheader:               ; preds = %for.body144.us.lver.check
  br label %for.body144.us.lver.orig

for.body144.us.lver.orig:                         ; preds = %for.body144.us.lver.orig.preheader, %for.body144.us.lver.orig
  %indvars.iv24.lver.orig = phi i64 [ %indvars.iv.next25.lver.orig, %for.body144.us.lver.orig ], [ 1, %for.body144.us.lver.orig.preheader ]
  %39 = add nsw i64 %indvars.iv24.lver.orig, -1
  %arrayidx150.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv34, i64 %39
  %40 = load double, double* %arrayidx150.us.lver.orig, align 8
  %mul151.us.lver.orig = fmul double %div12, %40
  %add152.us.lver.orig = fadd double %add13, %mul151.us.lver.orig
  %div153.us.lver.orig = fdiv double %sub145, %add152.us.lver.orig
  %arrayidx157.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv34, i64 %indvars.iv24.lver.orig
  store double %div153.us.lver.orig, double* %arrayidx157.us.lver.orig, align 8
  %arrayidx163.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %38, i64 %indvars.iv24.lver.orig
  %41 = load double, double* %arrayidx163.us.lver.orig, align 8
  %42 = fmul double %div10, %41
  %arrayidx170.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv34, i64 %indvars.iv24.lver.orig
  %43 = load double, double* %arrayidx170.us.lver.orig, align 8
  %mul171.us.lver.orig = fmul double %add166, %43
  %add172.us.lver.orig = fsub double %mul171.us.lver.orig, %42
  %arrayidx177.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv.next35, i64 %indvars.iv24.lver.orig
  %44 = load double, double* %arrayidx177.us.lver.orig, align 8
  %mul178.us.lver.orig = fmul double %div10, %44
  %sub179.us.lver.orig = fsub double %add172.us.lver.orig, %mul178.us.lver.orig
  %arrayidx184.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv34, i64 %39
  %45 = load double, double* %arrayidx184.us.lver.orig, align 8
  %mul185.us.lver.orig = fmul double %div12, %45
  %sub186.us.lver.orig = fsub double %sub179.us.lver.orig, %mul185.us.lver.orig
  %46 = load double, double* %arrayidx150.us.lver.orig, align 8
  %mul192.us.lver.orig = fmul double %div12, %46
  %add193.us.lver.orig = fadd double %add13, %mul192.us.lver.orig
  %div194.us.lver.orig = fdiv double %sub186.us.lver.orig, %add193.us.lver.orig
  %arrayidx198.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv34, i64 %indvars.iv24.lver.orig
  store double %div194.us.lver.orig, double* %arrayidx198.us.lver.orig, align 8
  %indvars.iv.next25.lver.orig = add nuw nsw i64 %indvars.iv24.lver.orig, 1
  %exitcond28.lver.orig = icmp eq i64 %indvars.iv.next25.lver.orig, %wide.trip.count27
  br i1 %exitcond28.lver.orig, label %for.cond140.for.end201_crit_edge.us.loopexit, label %for.body144.us.lver.orig

for.body144.us.ph:                                ; preds = %for.body144.us.lver.check
  %scevgep72 = getelementptr [1000 x double], [1000 x double]* %p, i64 %33, i64 0
  %scevgep77 = getelementptr [1000 x double], [1000 x double]* %q, i64 %33, i64 0
  %load_initial73 = load double, double* %scevgep72, align 8
  %load_initial78 = load double, double* %scevgep77, align 8
  br label %for.body144.us

for.inc234.us.loopexit:                           ; preds = %for.body211.us
  br label %for.inc234.us

for.inc234.us:                                    ; preds = %for.inc234.us.loopexit, %for.body211.us.prol.loopexit, %for.cond140.for.end201_crit_edge.us
  %exitcond38 = icmp eq i64 %indvars.iv.next35, %wide.trip.count37
  %indvar.next59 = add i64 %indvar58, 1
  br i1 %exitcond38, label %for.inc237.loopexit, label %for.body144.us.lver.check

for.body211.us:                                   ; preds = %for.body211.us.preheader80, %for.body211.us
  %indvars.iv29 = phi i64 [ %indvars.iv.next30.1, %for.body211.us ], [ %indvars.iv29.unr.ph, %for.body211.us.preheader80 ]
  %arrayidx215.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv34, i64 %indvars.iv29
  %47 = load double, double* %arrayidx215.us, align 8
  %48 = add nsw i64 %indvars.iv29, 1
  %arrayidx220.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv34, i64 %48
  %49 = load double, double* %arrayidx220.us, align 8
  %mul221.us = fmul double %47, %49
  %arrayidx225.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv34, i64 %indvars.iv29
  %50 = load double, double* %arrayidx225.us, align 8
  %add226.us = fadd double %mul221.us, %50
  %arrayidx230.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv34, i64 %indvars.iv29
  store double %add226.us, double* %arrayidx230.us, align 8
  %indvars.iv.next30 = add nsw i64 %indvars.iv29, -1
  %arrayidx215.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv34, i64 %indvars.iv.next30
  %51 = load double, double* %arrayidx215.us.1, align 8
  %mul221.us.1 = fmul double %51, %add226.us
  %arrayidx225.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv34, i64 %indvars.iv.next30
  %52 = load double, double* %arrayidx225.us.1, align 8
  %add226.us.1 = fadd double %mul221.us.1, %52
  %arrayidx230.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv34, i64 %indvars.iv.next30
  store double %add226.us.1, double* %arrayidx230.us.1, align 8
  %indvars.iv.next30.1 = add nsw i64 %indvars.iv29, -2
  %cmp209.us.1 = icmp sgt i64 %indvars.iv.next30, 1
  br i1 %cmp209.us.1, label %for.body211.us, label %for.inc234.us.loopexit

for.body144.us:                                   ; preds = %for.body144.us, %for.body144.us.ph
  %store_forwarded79 = phi double [ %load_initial78, %for.body144.us.ph ], [ %div194.us, %for.body144.us ]
  %store_forwarded76 = phi double [ %load_initial73, %for.body144.us.ph ], [ %div153.us, %for.body144.us ]
  %indvars.iv24 = phi i64 [ 1, %for.body144.us.ph ], [ %indvars.iv.next25, %for.body144.us ]
  %mul151.us = fmul double %div12, %store_forwarded76
  %add152.us = fadd double %add13, %mul151.us
  %div153.us = fdiv double %sub145, %add152.us
  %arrayidx157.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv34, i64 %indvars.iv24
  store double %div153.us, double* %arrayidx157.us, align 8
  %arrayidx163.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %38, i64 %indvars.iv24
  %53 = load double, double* %arrayidx163.us, align 8
  %54 = fmul double %div10, %53
  %arrayidx170.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv34, i64 %indvars.iv24
  %55 = load double, double* %arrayidx170.us, align 8
  %mul171.us = fmul double %add166, %55
  %add172.us = fsub double %mul171.us, %54
  %arrayidx177.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv.next35, i64 %indvars.iv24
  %56 = load double, double* %arrayidx177.us, align 8
  %mul178.us = fmul double %div10, %56
  %sub179.us = fsub double %add172.us, %mul178.us
  %mul185.us = fmul double %div12, %store_forwarded79
  %sub186.us = fsub double %sub179.us, %mul185.us
  %mul192.us = fmul double %div12, %store_forwarded76
  %add193.us = fadd double %add13, %mul192.us
  %div194.us = fdiv double %sub186.us, %add193.us
  %arrayidx198.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv34, i64 %indvars.iv24
  store double %div194.us, double* %arrayidx198.us, align 8
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next25, %wide.trip.count27
  br i1 %exitcond28, label %for.cond140.for.end201_crit_edge.us.loopexit81, label %for.body144.us

for.cond140.for.end201_crit_edge.us.loopexit:     ; preds = %for.body144.us.lver.orig
  br label %for.cond140.for.end201_crit_edge.us

for.cond140.for.end201_crit_edge.us.loopexit81:   ; preds = %for.body144.us
  br label %for.cond140.for.end201_crit_edge.us

for.cond140.for.end201_crit_edge.us:              ; preds = %for.cond140.for.end201_crit_edge.us.loopexit81, %for.cond140.for.end201_crit_edge.us.loopexit
  %arrayidx206.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv34, i64 %idxprom205
  store double 1.000000e+00, double* %arrayidx206.us, align 8
  br i1 %cmp2099, label %for.body211.us.preheader, label %for.inc234.us

for.body211.us.preheader:                         ; preds = %for.cond140.for.end201_crit_edge.us
  br i1 %lcmp.mod33, label %for.body211.us.prol.loopexit, label %for.body211.us.prol

for.body211.us.prol:                              ; preds = %for.body211.us.preheader
  %arrayidx215.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv34, i64 %0
  %57 = load double, double* %arrayidx215.us.prol, align 8
  %arrayidx220.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv34, i64 %5
  %58 = load double, double* %arrayidx220.us.prol, align 8
  %mul221.us.prol = fmul double %57, %58
  %arrayidx225.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv34, i64 %0
  %59 = load double, double* %arrayidx225.us.prol, align 8
  %add226.us.prol = fadd double %mul221.us.prol, %59
  %arrayidx230.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv34, i64 %0
  store double %add226.us.prol, double* %arrayidx230.us.prol, align 8
  br label %for.body211.us.prol.loopexit

for.body211.us.prol.loopexit:                     ; preds = %for.body211.us.prol, %for.body211.us.preheader
  %indvars.iv29.unr.ph = phi i64 [ %indvars.iv.next30.prol, %for.body211.us.prol ], [ %0, %for.body211.us.preheader ]
  br i1 %4, label %for.inc234.us, label %for.body211.us.preheader80

for.body211.us.preheader80:                       ; preds = %for.body211.us.prol.loopexit
  br label %for.body211.us

for.inc237.loopexit:                              ; preds = %for.inc234.us
  br label %for.inc237

for.inc237:                                       ; preds = %for.inc237.loopexit, %for.cond15.preheader, %for.cond123.preheader
  %inc238 = add nuw nsw i32 %t.014, 1
  %exitcond39 = icmp eq i32 %t.014, %tsteps
  br i1 %exitcond39, label %for.end239.loopexit, label %for.cond15.preheader

for.end239.loopexit:                              ; preds = %for.inc237
  br label %for.end239

for.end239:                                       ; preds = %for.end239.loopexit, %entry
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
  %cmp4 = icmp sgt i32 %n, 0
  br i1 %cmp4, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %n to i64
  %wide.trip.count = zext i32 %n to i64
  %wide.trip.count10 = zext i32 %n to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv7 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next8, %for.cond2.for.inc10_crit_edge.us ]
  %4 = mul nsw i64 %indvars.iv7, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %5 = add nsw i64 %indvars.iv, %4
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #5
  br label %if.end.us

if.end.us:                                        ; preds = %if.then.us, %for.body4.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv7, i64 %indvars.iv
  %9 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next8, %wide.trip.count10
  br i1 %exitcond11, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %11) #5
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
