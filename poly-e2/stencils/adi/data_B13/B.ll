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
  %call = call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %call1 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %call2 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %call3 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %arraydecay = bitcast i8* %call to [1000 x double]*
  call fastcc void @init_array(i32 1000, [1000 x double]* %arraydecay)
  call void (...) @polybench_timer_start() #4
  %arraydecay5 = bitcast i8* %call1 to [1000 x double]*
  %arraydecay6 = bitcast i8* %call2 to [1000 x double]*
  %arraydecay7 = bitcast i8* %call3 to [1000 x double]*
  call fastcc void @kernel_adi(i32 500, i32 1000, [1000 x double]* %arraydecay, [1000 x double]* %arraydecay5, [1000 x double]* %arraydecay6, [1000 x double]* %arraydecay7)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = bitcast i8* %call to [1000 x double]*
  call fastcc void @print_array(i32 1000, [1000 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  call void @free(i8* %call2) #4
  call void @free(i8* %call3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %n, [1000 x double]* nocapture %u) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc7_crit_edge.us, %entry
  %indvars.iv10 = phi i64 [ 0, %entry ], [ %indvars.iv.next11, %for.cond1.for.inc7_crit_edge.us ]
  %0 = trunc i64 %indvars.iv10 to i32
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next.1, %for.body3.us ]
  %1 = trunc i64 %indvars.iv to i32
  %add.us = sub i32 1000, %1
  %sub.us = add i32 %add.us, %0
  %conv.us = sitofp i32 %sub.us to double
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv10, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %2 = trunc i64 %indvars.iv.next to i32
  %add.us.1 = sub i32 1000, %2
  %sub.us.1 = add i32 %add.us.1, %0
  %conv.us.1 = sitofp i32 %sub.us.1 to double
  %div.us.v.i0.1 = insertelement <2 x double> undef, double %conv.us, i32 0
  %div.us.v.i0.2 = insertelement <2 x double> %div.us.v.i0.1, double %conv.us.1, i32 1
  %div.us = fdiv <2 x double> %div.us.v.i0.2, <double 1.000000e+03, double 1.000000e+03>
  %3 = bitcast double* %arrayidx6.us to <2 x double>*
  store <2 x double> %div.us, <2 x double>* %3, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond.1, label %for.cond1.for.inc7_crit_edge.us, label %for.body3.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.body3.us
  %indvars.iv.next11 = add nsw i64 %indvars.iv10, 1
  %cmp.us = icmp slt i64 %indvars.iv.next11, 1000
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.end9

for.end9:                                         ; preds = %for.cond1.for.inc7_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi(i32 %tsteps, i32 %n, [1000 x double]* nocapture %u, [1000 x double]* nocapture %v, [1000 x double]* %p, [1000 x double]* %q) unnamed_addr #2 {
entry:
  br label %for.cond15.preheader

for.cond15.preheader:                             ; preds = %for.inc237, %entry
  %inc23843 = phi i32 [ 1, %entry ], [ %inc238, %for.inc237 ]
  br label %for.body34.us.lver.check

for.body34.us.lver.check:                         ; preds = %for.cond15.preheader, %for.inc120.us
  %indvar = phi i64 [ 0, %for.cond15.preheader ], [ %0, %for.inc120.us ]
  %indvars.iv58 = phi i64 [ 1, %for.cond15.preheader ], [ %indvars.iv.next59, %for.inc120.us ]
  %0 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %p, i64 %0, i64 0
  %scevgep81 = getelementptr [1000 x double], [1000 x double]* %p, i64 %0, i64 999
  %scevgep83 = getelementptr [1000 x double], [1000 x double]* %q, i64 %0, i64 0
  %scevgep85 = getelementptr [1000 x double], [1000 x double]* %q, i64 %0, i64 999
  %arrayidx20.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 0, i64 %indvars.iv58
  store double 1.000000e+00, double* %arrayidx20.us, align 8
  %arrayidx23.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv58, i64 0
  store double 0.000000e+00, double* %arrayidx23.us, align 8
  %1 = bitcast double* %arrayidx20.us to i64*
  %2 = load i64, i64* %1, align 8
  %arrayidx28.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv58
  %3 = bitcast [1000 x double]* %arrayidx28.us to i64*
  store i64 %2, i64* %3, align 8
  %4 = add nsw i64 %indvars.iv58, -1
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %bound0 = icmp ult double* %scevgep, %scevgep85
  %bound1 = icmp ult double* %scevgep83, %scevgep81
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.body34.us.lver.orig.preheader, label %for.body34.us.ph

for.body34.us.lver.orig.preheader:                ; preds = %for.body34.us.lver.check
  br label %for.body34.us.lver.orig

for.body34.us.lver.orig:                          ; preds = %for.body34.us.lver.orig.preheader, %for.body34.us.lver.orig
  %indvars.iv49.lver.orig = phi i64 [ %indvars.iv.next50.lver.orig, %for.body34.us.lver.orig ], [ 1, %for.body34.us.lver.orig.preheader ]
  %5 = add nsw i64 %indvars.iv49.lver.orig, -1
  %arrayidx40.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv58, i64 %5
  %6 = load double, double* %arrayidx40.us.lver.orig, align 8
  %mul41.us.lver.orig = fmul double %6, 0xC09F400000000001
  %add42.us.lver.orig = fadd double %mul41.us.lver.orig, 0x40AF420000000001
  %div43.us.lver.orig = fdiv double 0x409F400000000001, %add42.us.lver.orig
  %arrayidx47.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv58, i64 %indvars.iv49.lver.orig
  store double %div43.us.lver.orig, double* %arrayidx47.us.lver.orig, align 8
  %arrayidx53.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv49.lver.orig, i64 %4
  %7 = bitcast double* %arrayidx53.us.lver.orig to <2 x double>*
  %8 = load <2 x double>, <2 x double>* %7, align 8
  %mul61.us.lver.orig = fmul <2 x double> %8, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %mul61.us.lver.orig.v.r1 = extractelement <2 x double> %mul61.us.lver.orig, i32 0
  %mul61.us.lver.orig.v.r2 = extractelement <2 x double> %mul61.us.lver.orig, i32 1
  %add62.us.lver.orig = fsub double %mul61.us.lver.orig.v.r2, %mul61.us.lver.orig.v.r1
  %arrayidx67.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv49.lver.orig, i64 %indvars.iv.next59
  %9 = load double, double* %arrayidx67.us.lver.orig, align 8
  %mul68.us.lver.orig = fmul double %9, 0xC08F400000000001
  %sub69.us.lver.orig = fsub double %add62.us.lver.orig, %mul68.us.lver.orig
  %arrayidx74.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv58, i64 %5
  %10 = load double, double* %arrayidx74.us.lver.orig, align 8
  %mul75.us.lver.orig = fmul double %10, 0xC09F400000000001
  %sub76.us.lver.orig = fsub double %sub69.us.lver.orig, %mul75.us.lver.orig
  %div84.us.lver.orig = fdiv double %sub76.us.lver.orig, %add42.us.lver.orig
  %arrayidx88.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv58, i64 %indvars.iv49.lver.orig
  store double %div84.us.lver.orig, double* %arrayidx88.us.lver.orig, align 8
  %indvars.iv.next50.lver.orig = add nuw nsw i64 %indvars.iv49.lver.orig, 1
  %cmp32.us.lver.orig = icmp slt i64 %indvars.iv.next50.lver.orig, 999
  br i1 %cmp32.us.lver.orig, label %for.body34.us.lver.orig, label %for.cond30.for.end_crit_edge.us.loopexit

for.body34.us.ph:                                 ; preds = %for.body34.us.lver.check
  %load_initial = load double, double* %scevgep, align 8
  %load_initial89 = load double, double* %scevgep83, align 8
  br label %for.body34.us

for.inc120.us:                                    ; preds = %for.body98.us
  %cmp17.us = icmp slt i64 %indvars.iv.next59, 999
  br i1 %cmp17.us, label %for.body34.us.lver.check, label %for.body144.us.lver.check.preheader

for.body144.us.lver.check.preheader:              ; preds = %for.inc120.us
  br label %for.body144.us.lver.check

for.body98.us:                                    ; preds = %for.cond30.for.end_crit_edge.us, %for.body98.us
  %indvars.iv53 = phi i64 [ %indvars.iv.next54.1, %for.body98.us ], [ 998, %for.cond30.for.end_crit_edge.us ]
  %arrayidx102.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv58, i64 %indvars.iv53
  %11 = load double, double* %arrayidx102.us, align 8
  %12 = or i64 %indvars.iv53, 1
  %arrayidx107.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %12, i64 %indvars.iv58
  %13 = load double, double* %arrayidx107.us, align 8
  %mul108.us = fmul double %11, %13
  %arrayidx112.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv58, i64 %indvars.iv53
  %14 = load double, double* %arrayidx112.us, align 8
  %add113.us = fadd double %mul108.us, %14
  %arrayidx117.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv53, i64 %indvars.iv58
  store double %add113.us, double* %arrayidx117.us, align 8
  %indvars.iv.next54 = add nsw i64 %indvars.iv53, -1
  %arrayidx102.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv58, i64 %indvars.iv.next54
  %15 = load double, double* %arrayidx102.us.1, align 8
  %mul108.us.1 = fmul double %15, %add113.us
  %arrayidx112.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv58, i64 %indvars.iv.next54
  %16 = load double, double* %arrayidx112.us.1, align 8
  %add113.us.1 = fadd double %mul108.us.1, %16
  %arrayidx117.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv.next54, i64 %indvars.iv58
  store double %add113.us.1, double* %arrayidx117.us.1, align 8
  %indvars.iv.next54.1 = add nsw i64 %indvars.iv53, -2
  %cmp96.us.1 = icmp sgt i64 %indvars.iv.next54, 1
  br i1 %cmp96.us.1, label %for.body98.us, label %for.inc120.us

for.body34.us:                                    ; preds = %for.body34.us, %for.body34.us.ph
  %store_forwarded90 = phi double [ %load_initial89, %for.body34.us.ph ], [ %div84.us, %for.body34.us ]
  %store_forwarded = phi double [ %load_initial, %for.body34.us.ph ], [ %div43.us, %for.body34.us ]
  %indvars.iv49 = phi i64 [ 1, %for.body34.us.ph ], [ %indvars.iv.next50, %for.body34.us ]
  %mul41.us = fmul double %store_forwarded, 0xC09F400000000001
  %add42.us = fadd double %mul41.us, 0x40AF420000000001
  %div43.us = fdiv double 0x409F400000000001, %add42.us
  %arrayidx47.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv58, i64 %indvars.iv49
  store double %div43.us, double* %arrayidx47.us, align 8
  %arrayidx53.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv49, i64 %4
  %17 = bitcast double* %arrayidx53.us to <2 x double>*
  %18 = load <2 x double>, <2 x double>* %17, align 8
  %mul61.us = fmul <2 x double> %18, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %mul61.us.v.r1 = extractelement <2 x double> %mul61.us, i32 0
  %mul61.us.v.r2 = extractelement <2 x double> %mul61.us, i32 1
  %add62.us = fsub double %mul61.us.v.r2, %mul61.us.v.r1
  %arrayidx67.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv49, i64 %indvars.iv.next59
  %19 = load double, double* %arrayidx67.us, align 8
  %mul68.us = fmul double %19, 0xC08F400000000001
  %sub69.us = fsub double %add62.us, %mul68.us
  %mul75.us = fmul double %store_forwarded90, 0xC09F400000000001
  %sub76.us = fsub double %sub69.us, %mul75.us
  %div84.us = fdiv double %sub76.us, %add42.us
  %arrayidx88.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv58, i64 %indvars.iv49
  store double %div84.us, double* %arrayidx88.us, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %cmp32.us = icmp slt i64 %indvars.iv.next50, 999
  br i1 %cmp32.us, label %for.body34.us, label %for.cond30.for.end_crit_edge.us.loopexit114

for.cond30.for.end_crit_edge.us.loopexit:         ; preds = %for.body34.us.lver.orig
  br label %for.cond30.for.end_crit_edge.us

for.cond30.for.end_crit_edge.us.loopexit114:      ; preds = %for.body34.us
  br label %for.cond30.for.end_crit_edge.us

for.cond30.for.end_crit_edge.us:                  ; preds = %for.cond30.for.end_crit_edge.us.loopexit114, %for.cond30.for.end_crit_edge.us.loopexit
  %arrayidx93.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 999, i64 %indvars.iv58
  store double 1.000000e+00, double* %arrayidx93.us, align 8
  br label %for.body98.us

for.body144.us.lver.check:                        ; preds = %for.body144.us.lver.check.preheader, %for.inc234.us
  %indvar91 = phi i64 [ %20, %for.inc234.us ], [ 0, %for.body144.us.lver.check.preheader ]
  %indvars.iv77 = phi i64 [ %indvars.iv.next78, %for.inc234.us ], [ 1, %for.body144.us.lver.check.preheader ]
  %20 = add i64 %indvar91, 1
  %scevgep93 = getelementptr [1000 x double], [1000 x double]* %p, i64 %20, i64 0
  %scevgep95 = getelementptr [1000 x double], [1000 x double]* %p, i64 %20, i64 999
  %scevgep97 = getelementptr [1000 x double], [1000 x double]* %q, i64 %20, i64 0
  %scevgep99 = getelementptr [1000 x double], [1000 x double]* %q, i64 %20, i64 999
  %arrayidx130.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv77, i64 0
  store double 1.000000e+00, double* %arrayidx130.us, align 8
  %arrayidx133.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv77, i64 0
  store double 0.000000e+00, double* %arrayidx133.us, align 8
  %21 = bitcast double* %arrayidx130.us to i64*
  %22 = load i64, i64* %21, align 8
  %arrayidx138.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv77
  %23 = bitcast [1000 x double]* %arrayidx138.us to i64*
  store i64 %22, i64* %23, align 8
  %24 = add nsw i64 %indvars.iv77, -1
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %bound0101 = icmp ult double* %scevgep93, %scevgep99
  %bound1102 = icmp ult double* %scevgep97, %scevgep95
  %memcheck.conflict104 = and i1 %bound0101, %bound1102
  br i1 %memcheck.conflict104, label %for.body144.us.lver.orig.preheader, label %for.body144.us.ph

for.body144.us.lver.orig.preheader:               ; preds = %for.body144.us.lver.check
  br label %for.body144.us.lver.orig

for.body144.us.lver.orig:                         ; preds = %for.body144.us.lver.orig.preheader, %for.body144.us.lver.orig
  %indvars.iv68.lver.orig = phi i64 [ %indvars.iv.next69.lver.orig, %for.body144.us.lver.orig ], [ 1, %for.body144.us.lver.orig.preheader ]
  %25 = add nsw i64 %indvars.iv68.lver.orig, -1
  %arrayidx150.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv77, i64 %25
  %26 = load double, double* %arrayidx150.us.lver.orig, align 8
  %mul151.us.lver.orig = fmul double %26, 0xC08F400000000001
  %add152.us.lver.orig = fadd double %mul151.us.lver.orig, 0x409F440000000001
  %div153.us.lver.orig = fdiv double 0x408F400000000001, %add152.us.lver.orig
  %arrayidx157.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv77, i64 %indvars.iv68.lver.orig
  store double %div153.us.lver.orig, double* %arrayidx157.us.lver.orig, align 8
  %arrayidx163.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %24, i64 %indvars.iv68.lver.orig
  %27 = load double, double* %arrayidx163.us.lver.orig, align 8
  %28 = fmul double %27, 0xC09F400000000001
  %arrayidx170.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv77, i64 %indvars.iv68.lver.orig
  %29 = load double, double* %arrayidx170.us.lver.orig, align 8
  %mul171.us.lver.orig = fmul double %29, 0xC0AF3E0000000001
  %add172.us.lver.orig = fsub double %mul171.us.lver.orig, %28
  %arrayidx177.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv.next78, i64 %indvars.iv68.lver.orig
  %30 = load double, double* %arrayidx177.us.lver.orig, align 8
  %mul178.us.lver.orig = fmul double %30, 0xC09F400000000001
  %sub179.us.lver.orig = fsub double %add172.us.lver.orig, %mul178.us.lver.orig
  %arrayidx184.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv77, i64 %25
  %31 = load double, double* %arrayidx184.us.lver.orig, align 8
  %mul185.us.lver.orig = fmul double %31, 0xC08F400000000001
  %sub186.us.lver.orig = fsub double %sub179.us.lver.orig, %mul185.us.lver.orig
  %div194.us.lver.orig = fdiv double %sub186.us.lver.orig, %add152.us.lver.orig
  %arrayidx198.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv77, i64 %indvars.iv68.lver.orig
  store double %div194.us.lver.orig, double* %arrayidx198.us.lver.orig, align 8
  %indvars.iv.next69.lver.orig = add nuw nsw i64 %indvars.iv68.lver.orig, 1
  %cmp142.us.lver.orig = icmp slt i64 %indvars.iv.next69.lver.orig, 999
  br i1 %cmp142.us.lver.orig, label %for.body144.us.lver.orig, label %for.cond140.for.end201_crit_edge.us.loopexit

for.body144.us.ph:                                ; preds = %for.body144.us.lver.check
  %load_initial106 = load double, double* %scevgep93, align 8
  %load_initial109 = load double, double* %scevgep97, align 8
  br label %for.body144.us

for.inc234.us:                                    ; preds = %for.body211.us
  %exitcond = icmp eq i64 %indvars.iv.next78, 999
  br i1 %exitcond, label %for.inc237, label %for.body144.us.lver.check

for.body211.us:                                   ; preds = %for.cond140.for.end201_crit_edge.us, %for.body211.us
  %indvars.iv72 = phi i64 [ %indvars.iv.next73.1, %for.body211.us ], [ 998, %for.cond140.for.end201_crit_edge.us ]
  %arrayidx215.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv77, i64 %indvars.iv72
  %32 = load double, double* %arrayidx215.us, align 8
  %33 = or i64 %indvars.iv72, 1
  %arrayidx220.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv77, i64 %33
  %34 = load double, double* %arrayidx220.us, align 8
  %mul221.us = fmul double %32, %34
  %arrayidx225.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv77, i64 %indvars.iv72
  %35 = load double, double* %arrayidx225.us, align 8
  %add226.us = fadd double %mul221.us, %35
  %arrayidx230.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv77, i64 %indvars.iv72
  store double %add226.us, double* %arrayidx230.us, align 8
  %indvars.iv.next73 = add nsw i64 %indvars.iv72, -1
  %arrayidx215.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv77, i64 %indvars.iv.next73
  %36 = load double, double* %arrayidx215.us.1, align 8
  %mul221.us.1 = fmul double %36, %add226.us
  %arrayidx225.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv77, i64 %indvars.iv.next73
  %37 = load double, double* %arrayidx225.us.1, align 8
  %add226.us.1 = fadd double %mul221.us.1, %37
  %arrayidx230.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv77, i64 %indvars.iv.next73
  store double %add226.us.1, double* %arrayidx230.us.1, align 8
  %indvars.iv.next73.1 = add nsw i64 %indvars.iv72, -2
  %cmp209.us.1 = icmp sgt i64 %indvars.iv.next73, 1
  br i1 %cmp209.us.1, label %for.body211.us, label %for.inc234.us

for.body144.us:                                   ; preds = %for.body144.us, %for.body144.us.ph
  %store_forwarded110 = phi double [ %load_initial109, %for.body144.us.ph ], [ %div194.us, %for.body144.us ]
  %store_forwarded107 = phi double [ %load_initial106, %for.body144.us.ph ], [ %div153.us, %for.body144.us ]
  %indvars.iv68 = phi i64 [ 1, %for.body144.us.ph ], [ %indvars.iv.next69, %for.body144.us ]
  %mul151.us = fmul double %store_forwarded107, 0xC08F400000000001
  %add152.us = fadd double %mul151.us, 0x409F440000000001
  %div153.us = fdiv double 0x408F400000000001, %add152.us
  %arrayidx157.us = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv77, i64 %indvars.iv68
  store double %div153.us, double* %arrayidx157.us, align 8
  %arrayidx163.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %24, i64 %indvars.iv68
  %38 = load double, double* %arrayidx163.us, align 8
  %39 = fmul double %38, 0xC09F400000000001
  %arrayidx170.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv77, i64 %indvars.iv68
  %40 = load double, double* %arrayidx170.us, align 8
  %mul171.us = fmul double %40, 0xC0AF3E0000000001
  %add172.us = fsub double %mul171.us, %39
  %arrayidx177.us = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv.next78, i64 %indvars.iv68
  %41 = load double, double* %arrayidx177.us, align 8
  %mul178.us = fmul double %41, 0xC09F400000000001
  %sub179.us = fsub double %add172.us, %mul178.us
  %mul185.us = fmul double %store_forwarded110, 0xC08F400000000001
  %sub186.us = fsub double %sub179.us, %mul185.us
  %div194.us = fdiv double %sub186.us, %add152.us
  %arrayidx198.us = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv77, i64 %indvars.iv68
  store double %div194.us, double* %arrayidx198.us, align 8
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %cmp142.us = icmp slt i64 %indvars.iv.next69, 999
  br i1 %cmp142.us, label %for.body144.us, label %for.cond140.for.end201_crit_edge.us.loopexit113

for.cond140.for.end201_crit_edge.us.loopexit:     ; preds = %for.body144.us.lver.orig
  br label %for.cond140.for.end201_crit_edge.us

for.cond140.for.end201_crit_edge.us.loopexit113:  ; preds = %for.body144.us
  br label %for.cond140.for.end201_crit_edge.us

for.cond140.for.end201_crit_edge.us:              ; preds = %for.cond140.for.end201_crit_edge.us.loopexit113, %for.cond140.for.end201_crit_edge.us.loopexit
  %arrayidx206.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv77, i64 999
  store double 1.000000e+00, double* %arrayidx206.us, align 8
  br label %for.body211.us

for.inc237:                                       ; preds = %for.inc234.us
  %inc238 = add nsw i32 %inc23843, 1
  %cmp = icmp slt i32 %inc23843, 500
  br i1 %cmp, label %for.cond15.preheader, label %for.end239

for.end239:                                       ; preds = %for.inc237
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [1000 x double]* nocapture readonly %u) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %entry
  %indvars.iv12 = phi i64 [ 0, %entry ], [ %indvars.iv.next13, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv12, 1000
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
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv12, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next13 = add nsw i64 %indvars.iv12, 1
  %cmp.us = icmp slt i64 %indvars.iv.next13, 1000
  br i1 %cmp.us, label %for.cond2.preheader.us, label %for.end12

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
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
