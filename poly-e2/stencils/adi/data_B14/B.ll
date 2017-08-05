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
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %arraydecay1 = bitcast i8* %call to [1000 x double]*
  tail call fastcc void @init_array(i32 1000, [1000 x double]* %arraydecay1)
  tail call void (...) @polybench_timer_start() #4
  %0 = bitcast i8* %call1 to [1000 x double]*
  %1 = bitcast i8* %call2 to [1000 x double]*
  %2 = bitcast i8* %call3 to [1000 x double]*
  tail call fastcc void @kernel_adi(i32 500, i32 1000, [1000 x double]* %arraydecay1, [1000 x double]* %0, [1000 x double]* %1, [1000 x double]* %2)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %3 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %3, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  tail call fastcc void @print_array(i32 1000, [1000 x double]* %arraydecay1)
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
define internal fastcc void @init_array(i32 %n, [1000 x double]* %u) unnamed_addr #2 {
entry:
  %cmp4 = icmp sgt i32 %n, 0
  br i1 %cmp4, label %for.body.lr.ph, label %for.end9

for.body.lr.ph:                                   ; preds = %entry
  %0 = sext i32 %n to i64
  %conv4 = sitofp i32 %n to double
  %xtraiter = and i32 %n, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %1 = icmp eq i32 %n, 1
  %wide.trip.count.1 = zext i32 %n to i64
  br label %for.body.us

for.body.us:                                      ; preds = %for.body.lr.ph, %for.cond1.for.inc7_crit_edge.us
  %indvars.iv10 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next11, %for.cond1.for.inc7_crit_edge.us ]
  br i1 %lcmp.mod, label %for.inc.us.prol.loopexit, label %for.inc.us.prol

for.inc.us.prol:                                  ; preds = %for.body.us
  %2 = add nsw i64 %indvars.iv10, %0
  %3 = trunc i64 %2 to i32
  %conv.us.prol = sitofp i32 %3 to double
  %div.us.prol = fdiv double %conv.us.prol, %conv4
  %arrayidx6.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv10, i64 0
  store double %div.us.prol, double* %arrayidx6.us.prol, align 8
  br label %for.inc.us.prol.loopexit

for.inc.us.prol.loopexit:                         ; preds = %for.inc.us.prol, %for.body.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc.us.prol ], [ 0, %for.body.us ]
  br i1 %1, label %for.cond1.for.inc7_crit_edge.us, label %for.inc.us.preheader

for.inc.us.preheader:                             ; preds = %for.inc.us.prol.loopexit
  %4 = add nsw i64 %indvars.iv10, %0
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us.preheader, %for.inc.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.inc.us ], [ %indvars.iv.unr.ph, %for.inc.us.preheader ]
  %5 = sub nsw i64 %4, %indvars.iv
  %6 = trunc i64 %5 to i32
  %conv.us = sitofp i32 %6 to double
  %div.us = fdiv double %conv.us, %conv4
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv10, i64 %indvars.iv
  store double %div.us, double* %arrayidx6.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %7 = sub nsw i64 %4, %indvars.iv.next
  %8 = trunc i64 %7 to i32
  %conv.us.1 = sitofp i32 %8 to double
  %div.us.1 = fdiv double %conv.us.1, %conv4
  %arrayidx6.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv10, i64 %indvars.iv.next
  store double %div.us.1, double* %arrayidx6.us.1, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.cond1.for.inc7_crit_edge.us.loopexit, label %for.inc.us

for.cond1.for.inc7_crit_edge.us.loopexit:         ; preds = %for.inc.us
  br label %for.cond1.for.inc7_crit_edge.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.cond1.for.inc7_crit_edge.us.loopexit, %for.inc.us.prol.loopexit
  %indvars.iv.next11 = add nsw i64 %indvars.iv10, 1
  %cmp.us = icmp slt i64 %indvars.iv.next11, %0
  br i1 %cmp.us, label %for.body.us, label %for.end9.loopexit

for.end9.loopexit:                                ; preds = %for.cond1.for.inc7_crit_edge.us
  br label %for.end9

for.end9:                                         ; preds = %for.end9.loopexit, %entry
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi(i32 %tsteps, i32 %n, [1000 x double]* %u, [1000 x double]* %v, [1000 x double]* %p, [1000 x double]* %q) unnamed_addr #2 {
entry:
  %conv = sitofp i32 %n to double
  %0 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i1.2 = shufflevector <2 x double> %0, <2 x double> undef, <2 x i32> zeroinitializer
  %div = fdiv <2 x double> <double 1.000000e+00, double 1.000000e+00>, %div.v.i1.2
  %div.v.r1 = extractelement <2 x double> %div, i32 0
  %conv3 = sitofp i32 %tsteps to double
  %div4 = fdiv double 1.000000e+00, %conv3
  %mul5 = fmul double %div.v.r1, %div.v.r1
  %mul.v.i1.261 = insertelement <2 x double> %div, double 2.000000e+00, i32 0
  %mul.v.i0.1 = insertelement <2 x double> undef, double %div4, i32 0
  %mul.v.i0.2 = shufflevector <2 x double> %mul.v.i0.1, <2 x double> %div, <2 x i32> <i32 0, i32 3>
  %mul = fmul <2 x double> %mul.v.i0.2, %mul.v.i1.261
  %mul.v.r1 = extractelement <2 x double> %mul, i32 0
  %div6.v.i1.1 = insertelement <2 x double> undef, double %mul5, i32 0
  %div6.v.i1.2 = shufflevector <2 x double> %div6.v.i1.1, <2 x double> %mul, <2 x i32> <i32 0, i32 3>
  %div6.v.i0.1 = insertelement <2 x double> undef, double %mul.v.r1, i32 0
  %div6.v.i0.2 = insertelement <2 x double> %div6.v.i0.1, double %div4, i32 1
  %div6 = fdiv <2 x double> %div6.v.i0.2, %div6.v.i1.2
  %div6.v.r1 = extractelement <2 x double> %div6, i32 0
  %div6.v.r2 = extractelement <2 x double> %div6, i32 1
  %div10 = fmul double %div6.v.r1, -5.000000e-01
  %add = fadd double %div6.v.r1, 1.000000e+00
  %div12 = fmul double %div6.v.r2, -5.000000e-01
  %add13 = fadd double %div6.v.r2, 1.000000e+00
  %cmp30 = icmp slt i32 %tsteps, 1
  br i1 %cmp30, label %for.end239, label %for.body.lr.ph

for.body.lr.ph:                                   ; preds = %entry
  %sub1613 = add nsw i32 %n, -1
  %1 = sext i32 %n to i64
  %sub204 = add nsw i64 %1, -1
  %sub207 = add nsw i64 %1, -2
  %sub145 = fsub double -0.000000e+00, %div12
  %sub35 = fsub double -0.000000e+00, %div10
  %mul165.v.i0.1 = insertelement <2 x double> undef, double %div10, i32 0
  %mul165.v.i0.2 = insertelement <2 x double> %mul165.v.i0.1, double %div12, i32 1
  %mul165 = fmul <2 x double> %mul165.v.i0.2, <double 2.000000e+00, double 2.000000e+00>
  %add166 = fadd <2 x double> %mul165, <double 1.000000e+00, double 1.000000e+00>
  %add166.v.r1 = extractelement <2 x double> %add166, i32 0
  %2 = icmp sgt i32 %sub1613, 1
  %3 = insertelement <2 x double> undef, double %div12, i32 0
  %4 = shufflevector <2 x double> %3, <2 x double> %add166, <2 x i32> <i32 0, i32 3>
  %5 = icmp sgt i32 %n, 2
  %xtraiter92 = and i64 %sub207, 1
  %lcmp.mod = icmp eq i64 %xtraiter92, 0
  %6 = icmp eq i32 %n, 3
  %indvars.iv.next41.prol = add nsw i64 %1, -3
  %7 = icmp sgt i64 %sub204, 2
  %smax = select i1 %7, i64 %sub204, i64 2
  br label %for.body

for.body:                                         ; preds = %for.inc237, %for.body.lr.ph
  %inc23836 = phi i32 [ 1, %for.body.lr.ph ], [ %inc238, %for.inc237 ]
  br i1 %2, label %for.body19.preheader, label %for.inc237

for.body19.preheader:                             ; preds = %for.body
  br label %for.body19

for.body19:                                       ; preds = %for.body19.preheader, %for.inc120
  %indvar = phi i64 [ %8, %for.inc120 ], [ 0, %for.body19.preheader ]
  %indvars.iv43 = phi i64 [ %13, %for.inc120 ], [ 1, %for.body19.preheader ]
  %8 = add i64 %indvar, 1
  %scevgep70 = getelementptr [1000 x double], [1000 x double]* %q, i64 %8, i64 0
  %arrayidx20 = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 0, i64 %indvars.iv43
  store double 1.000000e+00, double* %arrayidx20, align 8
  %arrayidx23 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv43, i64 0
  store double 0.000000e+00, double* %arrayidx23, align 8
  %9 = bitcast double* %arrayidx20 to i64*
  %10 = load i64, i64* %9, align 8
  %arrayidx28 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv43
  %11 = bitcast [1000 x double]* %arrayidx28 to i64*
  store i64 %10, i64* %11, align 8
  %scevgep68 = getelementptr [1000 x double], [1000 x double]* %q, i64 %8, i64 %smax
  %scevgep64 = getelementptr [1000 x double], [1000 x double]* %p, i64 %8, i64 %smax
  %scevgep = getelementptr [1000 x double], [1000 x double]* %p, i64 %8, i64 1
  %12 = add nsw i64 %indvars.iv43, -1
  %13 = add nuw nsw i64 %indvars.iv43, 1
  %bound0 = icmp ult double* %scevgep, %scevgep68
  %bound1 = icmp ult double* %scevgep70, %scevgep64
  %found.conflict = and i1 %bound0, %bound1
  br i1 %found.conflict, label %for.inc.lver.orig.preheader, label %for.inc.ph

for.inc.lver.orig.preheader:                      ; preds = %for.body19
  br label %for.inc.lver.orig

for.inc.lver.orig:                                ; preds = %for.inc.lver.orig.preheader, %for.inc.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %for.inc.lver.orig ], [ 1, %for.inc.lver.orig.preheader ]
  %14 = add nsw i64 %indvars.iv.lver.orig, -1
  %arrayidx40.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv43, i64 %14
  %15 = load double, double* %arrayidx40.lver.orig, align 8
  %mul41.lver.orig = fmul double %div10, %15
  %add42.lver.orig = fadd double %mul41.lver.orig, %add
  %div43.lver.orig = fdiv double %sub35, %add42.lver.orig
  %arrayidx47.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv43, i64 %indvars.iv.lver.orig
  store double %div43.lver.orig, double* %arrayidx47.lver.orig, align 8
  %arrayidx53.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv.lver.orig, i64 %12
  %16 = bitcast double* %arrayidx53.lver.orig to <2 x double>*
  %17 = load <2 x double>, <2 x double>* %16, align 8
  %mul61.lver.orig = fmul <2 x double> %4, %17
  %mul61.v.r1.lver.orig = extractelement <2 x double> %mul61.lver.orig, i32 0
  %mul61.v.r2.lver.orig = extractelement <2 x double> %mul61.lver.orig, i32 1
  %add62.lver.orig = fsub double %mul61.v.r2.lver.orig, %mul61.v.r1.lver.orig
  %arrayidx67.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv.lver.orig, i64 %13
  %18 = load double, double* %arrayidx67.lver.orig, align 8
  %mul68.lver.orig = fmul double %div12, %18
  %sub69.lver.orig = fsub double %add62.lver.orig, %mul68.lver.orig
  %arrayidx74.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv43, i64 %14
  %19 = load double, double* %arrayidx74.lver.orig, align 8
  %mul75.lver.orig = fmul double %div10, %19
  %sub76.lver.orig = fsub double %sub69.lver.orig, %mul75.lver.orig
  %div84.lver.orig = fdiv double %sub76.lver.orig, %add42.lver.orig
  %arrayidx88.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv43, i64 %indvars.iv.lver.orig
  store double %div84.lver.orig, double* %arrayidx88.lver.orig, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  %cmp32.lver.orig = icmp slt i64 %indvars.iv.next.lver.orig, %sub204
  br i1 %cmp32.lver.orig, label %for.inc.lver.orig, label %for.end.loopexit

for.inc.ph:                                       ; preds = %for.body19
  %load_initial = load double, double* %scevgep70, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.inc.ph, %for.inc
  %store_forwarded = phi double [ %load_initial, %for.inc.ph ], [ %div84, %for.inc ]
  %indvars.iv = phi i64 [ 1, %for.inc.ph ], [ %indvars.iv.next, %for.inc ]
  %20 = add nsw i64 %indvars.iv, -1
  %arrayidx40 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv43, i64 %20
  %21 = load double, double* %arrayidx40, align 8
  %mul41 = fmul double %div10, %21
  %add42 = fadd double %mul41, %add
  %div43 = fdiv double %sub35, %add42
  %arrayidx47 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv43, i64 %indvars.iv
  store double %div43, double* %arrayidx47, align 8
  %arrayidx53 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv, i64 %12
  %22 = bitcast double* %arrayidx53 to <2 x double>*
  %23 = load <2 x double>, <2 x double>* %22, align 8
  %mul61 = fmul <2 x double> %4, %23
  %mul61.v.r1 = extractelement <2 x double> %mul61, i32 0
  %mul61.v.r2 = extractelement <2 x double> %mul61, i32 1
  %add62 = fsub double %mul61.v.r2, %mul61.v.r1
  %arrayidx67 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv, i64 %13
  %24 = load double, double* %arrayidx67, align 8
  %mul68 = fmul double %div12, %24
  %sub69 = fsub double %add62, %mul68
  %mul75 = fmul double %div10, %store_forwarded
  %sub76 = fsub double %sub69, %mul75
  %div84 = fdiv double %sub76, %add42
  %arrayidx88 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv43, i64 %indvars.iv
  store double %div84, double* %arrayidx88, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %cmp32 = icmp slt i64 %indvars.iv.next, %sub204
  br i1 %cmp32, label %for.inc, label %for.end.loopexit94

for.end.loopexit:                                 ; preds = %for.inc.lver.orig
  br label %for.end

for.end.loopexit94:                               ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit94, %for.end.loopexit
  %arrayidx93 = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %sub204, i64 %indvars.iv43
  store double 1.000000e+00, double* %arrayidx93, align 8
  br i1 %5, label %for.inc118.lr.ph, label %for.inc120

for.inc118.lr.ph:                                 ; preds = %for.end
  br i1 %lcmp.mod, label %for.inc118.prol.loopexit, label %for.inc118.prol

for.inc118.prol:                                  ; preds = %for.inc118.lr.ph
  %arrayidx102.prol = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv43, i64 %sub207
  %25 = load double, double* %arrayidx102.prol, align 8
  %arrayidx112.prol = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv43, i64 %sub207
  %26 = load double, double* %arrayidx112.prol, align 8
  %add113.prol = fadd double %25, %26
  %arrayidx117.prol = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %sub207, i64 %indvars.iv43
  store double %add113.prol, double* %arrayidx117.prol, align 8
  br label %for.inc118.prol.loopexit

for.inc118.prol.loopexit:                         ; preds = %for.inc118.prol, %for.inc118.lr.ph
  %indvars.iv40.unr.ph = phi i64 [ %indvars.iv.next41.prol, %for.inc118.prol ], [ %sub207, %for.inc118.lr.ph ]
  br i1 %6, label %for.inc120, label %for.inc118.preheader

for.inc118.preheader:                             ; preds = %for.inc118.prol.loopexit
  br label %for.inc118

for.inc118:                                       ; preds = %for.inc118.preheader, %for.inc118
  %indvars.iv40 = phi i64 [ %indvars.iv.next41.1, %for.inc118 ], [ %indvars.iv40.unr.ph, %for.inc118.preheader ]
  %arrayidx102 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv43, i64 %indvars.iv40
  %27 = load double, double* %arrayidx102, align 8
  %28 = add nsw i64 %indvars.iv40, 1
  %arrayidx107 = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %28, i64 %indvars.iv43
  %29 = load double, double* %arrayidx107, align 8
  %mul108 = fmul double %27, %29
  %arrayidx112 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv43, i64 %indvars.iv40
  %30 = load double, double* %arrayidx112, align 8
  %add113 = fadd double %mul108, %30
  %arrayidx117 = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv40, i64 %indvars.iv43
  store double %add113, double* %arrayidx117, align 8
  %indvars.iv.next41 = add nsw i64 %indvars.iv40, -1
  %arrayidx102.1 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv43, i64 %indvars.iv.next41
  %31 = load double, double* %arrayidx102.1, align 8
  %mul108.1 = fmul double %31, %add113
  %arrayidx112.1 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv43, i64 %indvars.iv.next41
  %32 = load double, double* %arrayidx112.1, align 8
  %add113.1 = fadd double %mul108.1, %32
  %arrayidx117.1 = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv.next41, i64 %indvars.iv43
  store double %add113.1, double* %arrayidx117.1, align 8
  %indvars.iv.next41.1 = add nsw i64 %indvars.iv40, -2
  %cmp96.1 = icmp sgt i64 %indvars.iv.next41, 1
  br i1 %cmp96.1, label %for.inc118, label %for.inc120.loopexit

for.inc120.loopexit:                              ; preds = %for.inc118
  br label %for.inc120

for.inc120:                                       ; preds = %for.inc120.loopexit, %for.inc118.prol.loopexit, %for.end
  %cmp17 = icmp slt i64 %13, %sub204
  br i1 %cmp17, label %for.body19, label %for.end122

for.end122:                                       ; preds = %for.inc120
  br i1 true, label %for.body127.preheader, label %for.end122.for.inc237_crit_edge

for.end122.for.inc237_crit_edge:                  ; preds = %for.end122
  br label %for.inc237

for.body127.preheader:                            ; preds = %for.end122
  br label %for.body127

for.body127:                                      ; preds = %for.body127.preheader, %for.inc234
  %indvar71 = phi i64 [ %33, %for.inc234 ], [ 0, %for.body127.preheader ]
  %indvars.iv55 = phi i64 [ %38, %for.inc234 ], [ 1, %for.body127.preheader ]
  %33 = add i64 %indvar71, 1
  %scevgep86 = getelementptr [1000 x double], [1000 x double]* %p, i64 %33, i64 0
  %scevgep89 = getelementptr [1000 x double], [1000 x double]* %q, i64 %33, i64 0
  %arrayidx130 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv55, i64 0
  store double 1.000000e+00, double* %arrayidx130, align 8
  %arrayidx133 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv55, i64 0
  store double 0.000000e+00, double* %arrayidx133, align 8
  %34 = bitcast double* %arrayidx130 to i64*
  %35 = load i64, i64* %34, align 8
  %arrayidx138 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv55
  %36 = bitcast [1000 x double]* %arrayidx138 to i64*
  store i64 %35, i64* %36, align 8
  %scevgep80 = getelementptr [1000 x double], [1000 x double]* %q, i64 %33, i64 %smax
  %scevgep76 = getelementptr [1000 x double], [1000 x double]* %p, i64 %33, i64 %smax
  %37 = add nsw i64 %indvars.iv55, -1
  %38 = add nuw nsw i64 %indvars.iv55, 1
  %bound082 = icmp ult double* %scevgep86, %scevgep80
  %bound183 = icmp ult double* %scevgep89, %scevgep76
  %found.conflict84 = and i1 %bound082, %bound183
  br i1 %found.conflict84, label %for.inc199.lver.orig.preheader, label %for.inc199.ph

for.inc199.lver.orig.preheader:                   ; preds = %for.body127
  br label %for.inc199.lver.orig

for.inc199.lver.orig:                             ; preds = %for.inc199.lver.orig.preheader, %for.inc199.lver.orig
  %indvars.iv47.lver.orig = phi i64 [ %indvars.iv.next48.lver.orig, %for.inc199.lver.orig ], [ 1, %for.inc199.lver.orig.preheader ]
  %39 = add nsw i64 %indvars.iv47.lver.orig, -1
  %arrayidx150.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv55, i64 %39
  %40 = load double, double* %arrayidx150.lver.orig, align 8
  %mul151.lver.orig = fmul double %div12, %40
  %add152.lver.orig = fadd double %mul151.lver.orig, %add13
  %div153.lver.orig = fdiv double %sub145, %add152.lver.orig
  %arrayidx157.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv55, i64 %indvars.iv47.lver.orig
  store double %div153.lver.orig, double* %arrayidx157.lver.orig, align 8
  %arrayidx163.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %37, i64 %indvars.iv47.lver.orig
  %41 = load double, double* %arrayidx163.lver.orig, align 8
  %42 = fmul double %div10, %41
  %arrayidx170.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv55, i64 %indvars.iv47.lver.orig
  %43 = load double, double* %arrayidx170.lver.orig, align 8
  %mul171.lver.orig = fmul double %add166.v.r1, %43
  %add172.lver.orig = fsub double %mul171.lver.orig, %42
  %arrayidx177.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %38, i64 %indvars.iv47.lver.orig
  %44 = load double, double* %arrayidx177.lver.orig, align 8
  %mul178.lver.orig = fmul double %div10, %44
  %sub179.lver.orig = fsub double %add172.lver.orig, %mul178.lver.orig
  %arrayidx184.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv55, i64 %39
  %45 = load double, double* %arrayidx184.lver.orig, align 8
  %mul185.lver.orig = fmul double %div12, %45
  %sub186.lver.orig = fsub double %sub179.lver.orig, %mul185.lver.orig
  %div194.lver.orig = fdiv double %sub186.lver.orig, %add152.lver.orig
  %arrayidx198.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv55, i64 %indvars.iv47.lver.orig
  store double %div194.lver.orig, double* %arrayidx198.lver.orig, align 8
  %indvars.iv.next48.lver.orig = add nuw nsw i64 %indvars.iv47.lver.orig, 1
  %cmp142.lver.orig = icmp slt i64 %indvars.iv.next48.lver.orig, %sub204
  br i1 %cmp142.lver.orig, label %for.inc199.lver.orig, label %for.end201.loopexit

for.inc199.ph:                                    ; preds = %for.body127
  %load_initial87 = load double, double* %scevgep86, align 8
  %load_initial90 = load double, double* %scevgep89, align 8
  br label %for.inc199

for.inc199:                                       ; preds = %for.inc199.ph, %for.inc199
  %store_forwarded91 = phi double [ %load_initial90, %for.inc199.ph ], [ %div194, %for.inc199 ]
  %store_forwarded88 = phi double [ %load_initial87, %for.inc199.ph ], [ %div153, %for.inc199 ]
  %indvars.iv47 = phi i64 [ 1, %for.inc199.ph ], [ %indvars.iv.next48, %for.inc199 ]
  %46 = add nsw i64 %indvars.iv47, -1
  %arrayidx150 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv55, i64 %46
  %47 = load double, double* %arrayidx150, align 8
  %mul151 = fmul double %div12, %47
  %add152 = fadd double %mul151, %add13
  %div153 = fdiv double %sub145, %add152
  %arrayidx157 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv55, i64 %indvars.iv47
  store double %div153, double* %arrayidx157, align 8
  %arrayidx163 = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %37, i64 %indvars.iv47
  %48 = load double, double* %arrayidx163, align 8
  %49 = fmul double %div10, %48
  %arrayidx170 = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv55, i64 %indvars.iv47
  %50 = load double, double* %arrayidx170, align 8
  %mul171 = fmul double %add166.v.r1, %50
  %add172 = fsub double %mul171, %49
  %arrayidx177 = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %38, i64 %indvars.iv47
  %51 = load double, double* %arrayidx177, align 8
  %mul178 = fmul double %div10, %51
  %sub179 = fsub double %add172, %mul178
  %mul185 = fmul double %div12, %store_forwarded91
  %sub186 = fsub double %sub179, %mul185
  %mul192 = fmul double %div12, %store_forwarded88
  %add193 = fadd double %mul192, %add13
  %div194 = fdiv double %sub186, %add193
  %arrayidx198 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv55, i64 %indvars.iv47
  store double %div194, double* %arrayidx198, align 8
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %cmp142 = icmp slt i64 %indvars.iv.next48, %sub204
  br i1 %cmp142, label %for.inc199, label %for.end201.loopexit93

for.end201.loopexit:                              ; preds = %for.inc199.lver.orig
  br label %for.end201

for.end201.loopexit93:                            ; preds = %for.inc199
  br label %for.end201

for.end201:                                       ; preds = %for.end201.loopexit93, %for.end201.loopexit
  %arrayidx206 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv55, i64 %sub204
  store double 1.000000e+00, double* %arrayidx206, align 8
  br i1 %5, label %for.inc231.lr.ph, label %for.inc234

for.inc231.lr.ph:                                 ; preds = %for.end201
  br i1 %lcmp.mod, label %for.inc231.prol.loopexit, label %for.inc231.prol

for.inc231.prol:                                  ; preds = %for.inc231.lr.ph
  %arrayidx215.prol = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv55, i64 %sub207
  %52 = load double, double* %arrayidx215.prol, align 8
  %arrayidx225.prol = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv55, i64 %sub207
  %53 = load double, double* %arrayidx225.prol, align 8
  %add226.prol = fadd double %52, %53
  %arrayidx230.prol = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv55, i64 %sub207
  store double %add226.prol, double* %arrayidx230.prol, align 8
  br label %for.inc231.prol.loopexit

for.inc231.prol.loopexit:                         ; preds = %for.inc231.prol, %for.inc231.lr.ph
  %indvars.iv52.unr.ph = phi i64 [ %indvars.iv.next41.prol, %for.inc231.prol ], [ %sub207, %for.inc231.lr.ph ]
  br i1 %6, label %for.inc234, label %for.inc231.preheader

for.inc231.preheader:                             ; preds = %for.inc231.prol.loopexit
  br label %for.inc231

for.inc231:                                       ; preds = %for.inc231.preheader, %for.inc231
  %indvars.iv52 = phi i64 [ %indvars.iv.next53.1, %for.inc231 ], [ %indvars.iv52.unr.ph, %for.inc231.preheader ]
  %arrayidx215 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv55, i64 %indvars.iv52
  %54 = load double, double* %arrayidx215, align 8
  %55 = add nsw i64 %indvars.iv52, 1
  %arrayidx220 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv55, i64 %55
  %56 = load double, double* %arrayidx220, align 8
  %mul221 = fmul double %54, %56
  %arrayidx225 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv55, i64 %indvars.iv52
  %57 = load double, double* %arrayidx225, align 8
  %add226 = fadd double %mul221, %57
  %arrayidx230 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv55, i64 %indvars.iv52
  store double %add226, double* %arrayidx230, align 8
  %indvars.iv.next53 = add nsw i64 %indvars.iv52, -1
  %arrayidx215.1 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv55, i64 %indvars.iv.next53
  %58 = load double, double* %arrayidx215.1, align 8
  %mul221.1 = fmul double %58, %add226
  %arrayidx225.1 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv55, i64 %indvars.iv.next53
  %59 = load double, double* %arrayidx225.1, align 8
  %add226.1 = fadd double %mul221.1, %59
  %arrayidx230.1 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv55, i64 %indvars.iv.next53
  store double %add226.1, double* %arrayidx230.1, align 8
  %indvars.iv.next53.1 = add nsw i64 %indvars.iv52, -2
  %cmp209.1 = icmp sgt i64 %indvars.iv.next53, 1
  br i1 %cmp209.1, label %for.inc231, label %for.inc234.loopexit

for.inc234.loopexit:                              ; preds = %for.inc231
  br label %for.inc234

for.inc234:                                       ; preds = %for.inc234.loopexit, %for.inc231.prol.loopexit, %for.end201
  %cmp125 = icmp slt i64 %38, %sub204
  br i1 %cmp125, label %for.body127, label %for.inc237.loopexit

for.inc237.loopexit:                              ; preds = %for.inc234
  br label %for.inc237

for.inc237:                                       ; preds = %for.end122.for.inc237_crit_edge, %for.inc237.loopexit, %for.body
  %inc238 = add nsw i32 %inc23836, 1
  %cmp = icmp slt i32 %inc23836, %tsteps
  br i1 %cmp, label %for.body, label %for.end239.loopexit

for.end239.loopexit:                              ; preds = %for.inc237
  br label %for.end239

for.end239:                                       ; preds = %for.end239.loopexit, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %n, [1000 x double]* %u) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp4 = icmp sgt i32 %n, 0
  br i1 %cmp4, label %for.body.lr.ph, label %for.end12

for.body.lr.ph:                                   ; preds = %entry
  %3 = sext i32 %n to i64
  %4 = zext i32 %n to i64
  br label %for.body.us

for.body.us:                                      ; preds = %for.body.lr.ph, %for.cond2.for.inc10_crit_edge.us
  %indvars.iv10 = phi i64 [ 0, %for.body.lr.ph ], [ %indvars.iv.next11, %for.cond2.for.inc10_crit_edge.us ]
  %5 = mul nsw i64 %indvars.iv10, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.body.us
  %indvars.iv = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next, %for.inc.us ]
  %6 = add nsw i64 %5, %indvars.iv
  %7 = trunc i64 %6 to i32
  %rem.us = srem i32 %7, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #5
  br label %for.inc.us

for.inc.us:                                       ; preds = %if.then.us, %for.body4.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv10, i64 %indvars.iv
  %10 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next, %4
  br i1 %exitcond13, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next11 = add nsw i64 %indvars.iv10, 1
  %cmp.us = icmp slt i64 %indvars.iv.next11, %3
  br i1 %cmp.us, label %for.body.us, label %for.end12.loopexit

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %12) #5
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
