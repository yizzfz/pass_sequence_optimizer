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
  %1 = bitcast i8* %call to [1000 x double]*
  tail call fastcc void @print_array([1000 x double]* %1)
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

for.cond1.preheader.us:                           ; preds = %for.cond1.for.end_crit_edge.us, %entry
  %indvars.iv8.us = phi i64 [ 0, %entry ], [ %indvars.iv.next5.us, %for.cond1.for.end_crit_edge.us ]
  %0 = add nuw nsw i64 %indvars.iv8.us, 1000
  %1 = trunc i64 %0 to i32
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv4.us = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next.us.1, %for.body3.us ]
  %2 = sub nsw i64 0, %indvars.iv4.us
  %3 = trunc i64 %2 to i32
  %sub.us = add nsw i32 %1, %3
  %conv.us = sitofp i32 %sub.us to double
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv8.us, i64 %indvars.iv4.us
  %4 = trunc i64 %indvars.iv4.us to i32
  %5 = xor i32 %4, -1
  %sub.us.1 = add nsw i32 %1, %5
  %conv.us.1 = sitofp i32 %sub.us.1 to double
  %div.us.v.i0.1 = insertelement <2 x double> undef, double %conv.us, i32 0
  %div.us.v.i0.2 = insertelement <2 x double> %div.us.v.i0.1, double %conv.us.1, i32 1
  %div.us = fdiv <2 x double> %div.us.v.i0.2, <double 1.000000e+03, double 1.000000e+03>
  %6 = bitcast double* %arrayidx6.us to <2 x double>*
  store <2 x double> %div.us, <2 x double>* %6, align 8
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv4.us, 2
  %exitcond.us.1 = icmp eq i64 %indvars.iv.next.us.1, 1000
  br i1 %exitcond.us.1, label %for.cond1.for.end_crit_edge.us, label %for.body3.us

for.cond1.for.end_crit_edge.us:                   ; preds = %for.body3.us
  %indvars.iv.next5.us = add nuw nsw i64 %indvars.iv8.us, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next5.us, 1000
  br i1 %exitcond12, label %for.end9, label %for.cond1.preheader.us

for.end9:                                         ; preds = %for.cond1.for.end_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi([1000 x double]* %u, [1000 x double]* %v, [1000 x double]* %p, [1000 x double]* %q) unnamed_addr #2 {
entry:
  %u.addr = alloca [1000 x double]*, align 8
  %v.addr = alloca [1000 x double]*, align 8
  %p.addr = alloca [1000 x double]*, align 8
  %q.addr = alloca [1000 x double]*, align 8
  %a = alloca double, align 8
  %b = alloca double, align 8
  %c = alloca double, align 8
  %d = alloca double, align 8
  %e = alloca double, align 8
  %f = alloca double, align 8
  store [1000 x double]* %u, [1000 x double]** %u.addr, align 8
  store [1000 x double]* %v, [1000 x double]** %v.addr, align 8
  store [1000 x double]* %p, [1000 x double]** %p.addr, align 8
  store [1000 x double]* %q, [1000 x double]** %q.addr, align 8
  store double 0xC09F400000000001, double* %a, align 8
  store double 0xC09F400000000001, double* %c, align 8
  store double 0xC08F400000000001, double* %d, align 8
  store double 0x40AF420000000001, double* %b, align 8
  store double 0x409F440000000001, double* %e, align 8
  store double 0xC08F400000000001, double* %f, align 8
  br label %for.cond15.preheader

for.cond15.preheader:                             ; preds = %for.end236, %entry
  %0 = phi [1000 x double]* [ %v, %entry ], [ %.pre90, %for.end236 ]
  %1 = phi i32 [ 1, %entry ], [ %inc238, %for.end236 ]
  %2 = phi [1000 x double]* [ %p, %entry ], [ %34, %for.end236 ]
  br label %for.body19.us

for.body19.us:                                    ; preds = %for.end119.us.for.body19.us_crit_edge, %for.cond15.preheader
  %3 = phi [1000 x double]* [ %.pre88, %for.end119.us.for.body19.us_crit_edge ], [ %0, %for.cond15.preheader ]
  %4 = phi [1000 x double]* [ %34, %for.end119.us.for.body19.us_crit_edge ], [ %2, %for.cond15.preheader ]
  %indvars.iv33.us = phi i64 [ %11, %for.end119.us.for.body19.us_crit_edge ], [ 1, %for.cond15.preheader ]
  %arrayidx20.us = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv33.us
  store double 1.000000e+00, double* %arrayidx20.us, align 8
  %arrayidx23.us = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv33.us, i64 0
  store double 0.000000e+00, double* %arrayidx23.us, align 8
  %5 = load [1000 x double]*, [1000 x double]** %v.addr, align 8
  %arrayidx26.us = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv33.us
  %6 = bitcast double* %arrayidx26.us to i64*
  %7 = load i64, i64* %6, align 8
  %8 = load [1000 x double]*, [1000 x double]** %q.addr, align 8
  %arrayidx28.us = getelementptr inbounds [1000 x double], [1000 x double]* %8, i64 %indvars.iv33.us
  %9 = bitcast [1000 x double]* %arrayidx28.us to i64*
  store i64 %7, i64* %9, align 8
  %10 = add nsw i64 %indvars.iv33.us, -1
  %11 = add nuw nsw i64 %indvars.iv33.us, 1
  %.pre = load double, double* %a, align 8
  %.pre79 = load double, double* %b, align 8
  br label %for.body34.us

for.end119.us:                                    ; preds = %for.body98.us
  %exitcond = icmp eq i64 %11, 999
  br i1 %exitcond, label %for.body127.us.preheader, label %for.end119.us.for.body19.us_crit_edge

for.end119.us.for.body19.us_crit_edge:            ; preds = %for.end119.us
  %.pre88 = load [1000 x double]*, [1000 x double]** %v.addr, align 8
  br label %for.body19.us

for.body127.us.preheader:                         ; preds = %for.end119.us
  %.pre89 = load double, double* %e, align 8
  %.pre90 = load [1000 x double]*, [1000 x double]** %v.addr, align 8
  %.pre91 = load double, double* %c, align 8
  %sub145.us = fsub double -0.000000e+00, %29
  %mul165.us = fmul double %31, 2.000000e+00
  %add166.us = fadd double %mul165.us, 1.000000e+00
  br label %for.body144.us.lver.check

for.body98.us:                                    ; preds = %for.body98.us, %for.cond30.for.end_crit_edge.us
  %12 = phi double [ 1.000000e+00, %for.cond30.for.end_crit_edge.us ], [ %add113.us.1, %for.body98.us ]
  %indvars.iv26.us = phi i64 [ 998, %for.cond30.for.end_crit_edge.us ], [ %indvars.iv.next24.us.1, %for.body98.us ]
  %arrayidx102.us = getelementptr inbounds [1000 x double], [1000 x double]* %34, i64 %indvars.iv33.us, i64 %indvars.iv26.us
  %13 = load double, double* %arrayidx102.us, align 8
  %mul108.us = fmul double %12, %13
  %arrayidx112.us = getelementptr inbounds [1000 x double], [1000 x double]* %32, i64 %indvars.iv33.us, i64 %indvars.iv26.us
  %14 = load double, double* %arrayidx112.us, align 8
  %add113.us = fadd double %mul108.us, %14
  %arrayidx117.us = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv26.us, i64 %indvars.iv33.us
  store double %add113.us, double* %arrayidx117.us, align 8
  %indvars.iv.next24.us = add nsw i64 %indvars.iv26.us, -1
  %arrayidx102.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %34, i64 %indvars.iv33.us, i64 %indvars.iv.next24.us
  %15 = load double, double* %arrayidx102.us.1, align 8
  %mul108.us.1 = fmul double %add113.us, %15
  %arrayidx112.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %32, i64 %indvars.iv33.us, i64 %indvars.iv.next24.us
  %16 = load double, double* %arrayidx112.us.1, align 8
  %add113.us.1 = fadd double %mul108.us.1, %16
  %arrayidx117.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv.next24.us, i64 %indvars.iv33.us
  store double %add113.us.1, double* %arrayidx117.us.1, align 8
  %cmp96.us.1 = icmp sgt i64 %indvars.iv.next24.us, 1
  %indvars.iv.next24.us.1 = add nsw i64 %indvars.iv26.us, -2
  br i1 %cmp96.us.1, label %for.body98.us, label %for.end119.us

for.body34.us:                                    ; preds = %for.body34.us, %for.body19.us
  %17 = phi double [ %.pre79, %for.body19.us ], [ %36, %for.body34.us ]
  %18 = phi double [ %.pre, %for.body19.us ], [ %31, %for.body34.us ]
  %19 = phi [1000 x double]* [ %4, %for.body19.us ], [ %34, %for.body34.us ]
  %indvars.iv19.us = phi i64 [ 1, %for.body19.us ], [ %indvars.iv.next.us, %for.body34.us ]
  %20 = load double, double* %c, align 8
  %sub35.us = fsub double -0.000000e+00, %20
  %21 = add nsw i64 %indvars.iv19.us, -1
  %arrayidx40.us = getelementptr inbounds [1000 x double], [1000 x double]* %19, i64 %indvars.iv33.us, i64 %21
  %22 = load double, double* %arrayidx40.us, align 8
  %mul41.us = fmul double %18, %22
  %add42.us = fadd double %mul41.us, %17
  %div43.us = fdiv double %sub35.us, %add42.us
  %arrayidx47.us = getelementptr inbounds [1000 x double], [1000 x double]* %19, i64 %indvars.iv33.us, i64 %indvars.iv19.us
  store double %div43.us, double* %arrayidx47.us, align 8
  %23 = load double, double* %d, align 8
  %24 = load [1000 x double]*, [1000 x double]** %u.addr, align 8
  %arrayidx53.us = getelementptr inbounds [1000 x double], [1000 x double]* %24, i64 %indvars.iv19.us, i64 %10
  %25 = bitcast double* %arrayidx53.us to <2 x double>*
  %mul55.us = fmul double %23, 2.000000e+00
  %add56.us = fadd double %mul55.us, 1.000000e+00
  %26 = load <2 x double>, <2 x double>* %25, align 8
  %27 = insertelement <2 x double> undef, double %23, i32 0
  %28 = insertelement <2 x double> %27, double %add56.us, i32 1
  %mul61.us = fmul <2 x double> %28, %26
  %mul61.us.v.r1 = extractelement <2 x double> %mul61.us, i32 0
  %mul61.us.v.r2 = extractelement <2 x double> %mul61.us, i32 1
  %add62.us = fsub double %mul61.us.v.r2, %mul61.us.v.r1
  %29 = load double, double* %f, align 8
  %arrayidx67.us = getelementptr inbounds [1000 x double], [1000 x double]* %24, i64 %indvars.iv19.us, i64 %11
  %30 = load double, double* %arrayidx67.us, align 8
  %mul68.us = fmul double %29, %30
  %sub69.us = fsub double %add62.us, %mul68.us
  %31 = load double, double* %a, align 8
  %32 = load [1000 x double]*, [1000 x double]** %q.addr, align 8
  %arrayidx74.us = getelementptr inbounds [1000 x double], [1000 x double]* %32, i64 %indvars.iv33.us, i64 %21
  %33 = load double, double* %arrayidx74.us, align 8
  %mul75.us = fmul double %31, %33
  %sub76.us = fsub double %sub69.us, %mul75.us
  %34 = load [1000 x double]*, [1000 x double]** %p.addr, align 8
  %arrayidx81.us = getelementptr inbounds [1000 x double], [1000 x double]* %34, i64 %indvars.iv33.us, i64 %21
  %35 = load double, double* %arrayidx81.us, align 8
  %mul82.us = fmul double %31, %35
  %36 = load double, double* %b, align 8
  %add83.us = fadd double %mul82.us, %36
  %div84.us = fdiv double %sub76.us, %add83.us
  %arrayidx88.us = getelementptr inbounds [1000 x double], [1000 x double]* %32, i64 %indvars.iv33.us, i64 %indvars.iv19.us
  store double %div84.us, double* %arrayidx88.us, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv19.us, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next.us, 999
  br i1 %exitcond62, label %for.cond30.for.end_crit_edge.us, label %for.body34.us

for.cond30.for.end_crit_edge.us:                  ; preds = %for.body34.us
  %arrayidx93.us = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 999, i64 %indvars.iv33.us
  store double 1.000000e+00, double* %arrayidx93.us, align 8
  br label %for.body98.us

for.body144.us.lver.check:                        ; preds = %for.end233.us, %for.body127.us.preheader
  %indvar = phi i64 [ 0, %for.body127.us.preheader ], [ %indvar.next, %for.end233.us ]
  %indvars.iv55.us = phi i64 [ 1, %for.body127.us.preheader ], [ %43, %for.end233.us ]
  %37 = add i64 %indvar, 1
  %38 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %34, i64 %38, i64 0
  %scevgep3 = getelementptr [1000 x double], [1000 x double]* %34, i64 %38, i64 999
  %scevgep5 = getelementptr [1000 x double], [1000 x double]* %32, i64 %38, i64 0
  %scevgep7 = getelementptr [1000 x double], [1000 x double]* %32, i64 %38, i64 999
  %arrayidx130.us = getelementptr inbounds [1000 x double], [1000 x double]* %24, i64 %indvars.iv55.us, i64 0
  store double 1.000000e+00, double* %arrayidx130.us, align 8
  %arrayidx133.us = getelementptr inbounds [1000 x double], [1000 x double]* %34, i64 %indvars.iv55.us, i64 0
  store double 0.000000e+00, double* %arrayidx133.us, align 8
  %39 = bitcast double* %arrayidx130.us to i64*
  %40 = load i64, i64* %39, align 8
  %arrayidx138.us = getelementptr inbounds [1000 x double], [1000 x double]* %32, i64 %indvars.iv55.us
  %41 = bitcast [1000 x double]* %arrayidx138.us to i64*
  store i64 %40, i64* %41, align 8
  %42 = add nsw i64 %indvars.iv55.us, -1
  %43 = add nuw nsw i64 %indvars.iv55.us, 1
  %bound0 = icmp ult double* %scevgep, %scevgep7
  %bound1 = icmp ult double* %scevgep5, %scevgep3
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.body144.us.lver.orig.preheader, label %for.body144.us.ph

for.body144.us.lver.orig.preheader:               ; preds = %for.body144.us.lver.check
  br label %for.body144.us.lver.orig

for.body144.us.lver.orig:                         ; preds = %for.body144.us.lver.orig.preheader, %for.body144.us.lver.orig
  %indvars.iv45.us.lver.orig = phi i64 [ %indvars.iv.next42.us.lver.orig, %for.body144.us.lver.orig ], [ 1, %for.body144.us.lver.orig.preheader ]
  %44 = add nsw i64 %indvars.iv45.us.lver.orig, -1
  %arrayidx150.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %34, i64 %indvars.iv55.us, i64 %44
  %45 = load double, double* %arrayidx150.us.lver.orig, align 8
  %mul151.us.lver.orig = fmul double %23, %45
  %add152.us.lver.orig = fadd double %mul151.us.lver.orig, %.pre89
  %div153.us.lver.orig = fdiv double %sub145.us, %add152.us.lver.orig
  %arrayidx157.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %34, i64 %indvars.iv55.us, i64 %indvars.iv45.us.lver.orig
  store double %div153.us.lver.orig, double* %arrayidx157.us.lver.orig, align 8
  %arrayidx163.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %.pre90, i64 %42, i64 %indvars.iv45.us.lver.orig
  %46 = load double, double* %arrayidx163.us.lver.orig, align 8
  %47 = fmul double %31, %46
  %arrayidx170.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %.pre90, i64 %indvars.iv55.us, i64 %indvars.iv45.us.lver.orig
  %48 = load double, double* %arrayidx170.us.lver.orig, align 8
  %mul171.us.lver.orig = fmul double %add166.us, %48
  %add172.us.lver.orig = fsub double %mul171.us.lver.orig, %47
  %arrayidx177.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %.pre90, i64 %43, i64 %indvars.iv45.us.lver.orig
  %49 = load double, double* %arrayidx177.us.lver.orig, align 8
  %mul178.us.lver.orig = fmul double %.pre91, %49
  %sub179.us.lver.orig = fsub double %add172.us.lver.orig, %mul178.us.lver.orig
  %arrayidx184.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %32, i64 %indvars.iv55.us, i64 %44
  %50 = load double, double* %arrayidx184.us.lver.orig, align 8
  %mul185.us.lver.orig = fmul double %23, %50
  %sub186.us.lver.orig = fsub double %sub179.us.lver.orig, %mul185.us.lver.orig
  %div194.us.lver.orig = fdiv double %sub186.us.lver.orig, %add152.us.lver.orig
  %arrayidx198.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %32, i64 %indvars.iv55.us, i64 %indvars.iv45.us.lver.orig
  store double %div194.us.lver.orig, double* %arrayidx198.us.lver.orig, align 8
  %indvars.iv.next42.us.lver.orig = add nuw nsw i64 %indvars.iv45.us.lver.orig, 1
  %exitcond.us.lver.orig = icmp eq i64 %indvars.iv.next42.us.lver.orig, 999
  br i1 %exitcond.us.lver.orig, label %for.cond140.for.end201_crit_edge.us.loopexit, label %for.body144.us.lver.orig

for.body144.us.ph:                                ; preds = %for.body144.us.lver.check
  %scevgep10 = getelementptr [1000 x double], [1000 x double]* %32, i64 %37, i64 0
  %scevgep9 = getelementptr [1000 x double], [1000 x double]* %34, i64 %37, i64 0
  %load_initial = load double, double* %scevgep9, align 8
  %load_initial11 = load double, double* %scevgep10, align 8
  br label %for.body144.us

for.end233.us:                                    ; preds = %for.body211.us
  %exitcond87 = icmp eq i64 %43, 999
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond87, label %for.end236, label %for.body144.us.lver.check

for.body211.us:                                   ; preds = %for.body211.us, %for.cond140.for.end201_crit_edge.us
  %51 = phi double [ 1.000000e+00, %for.cond140.for.end201_crit_edge.us ], [ %add226.us.1, %for.body211.us ]
  %indvars.iv49.us = phi i64 [ 998, %for.cond140.for.end201_crit_edge.us ], [ %indvars.iv.next47.us.1, %for.body211.us ]
  %arrayidx215.us = getelementptr inbounds [1000 x double], [1000 x double]* %34, i64 %indvars.iv55.us, i64 %indvars.iv49.us
  %52 = load double, double* %arrayidx215.us, align 8
  %mul221.us = fmul double %51, %52
  %arrayidx225.us = getelementptr inbounds [1000 x double], [1000 x double]* %32, i64 %indvars.iv55.us, i64 %indvars.iv49.us
  %53 = load double, double* %arrayidx225.us, align 8
  %add226.us = fadd double %mul221.us, %53
  %arrayidx230.us = getelementptr inbounds [1000 x double], [1000 x double]* %24, i64 %indvars.iv55.us, i64 %indvars.iv49.us
  store double %add226.us, double* %arrayidx230.us, align 8
  %indvars.iv.next47.us = add nsw i64 %indvars.iv49.us, -1
  %arrayidx215.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %34, i64 %indvars.iv55.us, i64 %indvars.iv.next47.us
  %54 = load double, double* %arrayidx215.us.1, align 8
  %mul221.us.1 = fmul double %add226.us, %54
  %arrayidx225.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %32, i64 %indvars.iv55.us, i64 %indvars.iv.next47.us
  %55 = load double, double* %arrayidx225.us.1, align 8
  %add226.us.1 = fadd double %mul221.us.1, %55
  %arrayidx230.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %24, i64 %indvars.iv55.us, i64 %indvars.iv.next47.us
  store double %add226.us.1, double* %arrayidx230.us.1, align 8
  %cmp209.us.1 = icmp sgt i64 %indvars.iv.next47.us, 1
  %indvars.iv.next47.us.1 = add nsw i64 %indvars.iv49.us, -2
  br i1 %cmp209.us.1, label %for.body211.us, label %for.end233.us

for.body144.us:                                   ; preds = %for.body144.us, %for.body144.us.ph
  %store_forwarded12 = phi double [ %load_initial11, %for.body144.us.ph ], [ %div194.us, %for.body144.us ]
  %store_forwarded = phi double [ %load_initial, %for.body144.us.ph ], [ %div153.us, %for.body144.us ]
  %indvars.iv45.us = phi i64 [ 1, %for.body144.us.ph ], [ %indvars.iv.next42.us, %for.body144.us ]
  %mul151.us = fmul double %23, %store_forwarded
  %add152.us = fadd double %mul151.us, %.pre89
  %div153.us = fdiv double %sub145.us, %add152.us
  %arrayidx157.us = getelementptr inbounds [1000 x double], [1000 x double]* %34, i64 %indvars.iv55.us, i64 %indvars.iv45.us
  store double %div153.us, double* %arrayidx157.us, align 8
  %arrayidx163.us = getelementptr inbounds [1000 x double], [1000 x double]* %.pre90, i64 %42, i64 %indvars.iv45.us
  %56 = load double, double* %arrayidx163.us, align 8
  %57 = fmul double %31, %56
  %arrayidx170.us = getelementptr inbounds [1000 x double], [1000 x double]* %.pre90, i64 %indvars.iv55.us, i64 %indvars.iv45.us
  %58 = load double, double* %arrayidx170.us, align 8
  %mul171.us = fmul double %add166.us, %58
  %add172.us = fsub double %mul171.us, %57
  %arrayidx177.us = getelementptr inbounds [1000 x double], [1000 x double]* %.pre90, i64 %43, i64 %indvars.iv45.us
  %59 = load double, double* %arrayidx177.us, align 8
  %mul178.us = fmul double %.pre91, %59
  %sub179.us = fsub double %add172.us, %mul178.us
  %mul185.us = fmul double %23, %store_forwarded12
  %sub186.us = fsub double %sub179.us, %mul185.us
  %div194.us = fdiv double %sub186.us, %add152.us
  %arrayidx198.us = getelementptr inbounds [1000 x double], [1000 x double]* %32, i64 %indvars.iv55.us, i64 %indvars.iv45.us
  store double %div194.us, double* %arrayidx198.us, align 8
  %indvars.iv.next42.us = add nuw nsw i64 %indvars.iv45.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next42.us, 999
  br i1 %exitcond.us, label %for.cond140.for.end201_crit_edge.us.loopexit24, label %for.body144.us

for.cond140.for.end201_crit_edge.us.loopexit:     ; preds = %for.body144.us.lver.orig
  br label %for.cond140.for.end201_crit_edge.us

for.cond140.for.end201_crit_edge.us.loopexit24:   ; preds = %for.body144.us
  br label %for.cond140.for.end201_crit_edge.us

for.cond140.for.end201_crit_edge.us:              ; preds = %for.cond140.for.end201_crit_edge.us.loopexit24, %for.cond140.for.end201_crit_edge.us.loopexit
  %arrayidx206.us = getelementptr inbounds [1000 x double], [1000 x double]* %24, i64 %indvars.iv55.us, i64 999
  store double 1.000000e+00, double* %arrayidx206.us, align 8
  br label %for.body211.us

for.end236:                                       ; preds = %for.end233.us
  %inc238 = add nuw nsw i32 %1, 1
  %exitcond1 = icmp eq i32 %inc238, 501
  br i1 %exitcond1, label %for.end239, label %for.cond15.preheader

for.end239:                                       ; preds = %for.end236
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

for.cond2.preheader.us:                           ; preds = %for.cond2.for.end_crit_edge.us, %entry
  %indvars.iv8.us = phi i64 [ 0, %entry ], [ %indvars.iv.next5.us, %for.cond2.for.end_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv8.us, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv4.us = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next.us, %if.end.us ]
  %4 = add nuw nsw i64 %indvars.iv4.us, %3
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
  %arrayidx8.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv8.us, i64 %indvars.iv4.us
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv4.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 1000
  br i1 %exitcond.us, label %for.cond2.for.end_crit_edge.us, label %for.body4.us

for.cond2.for.end_crit_edge.us:                   ; preds = %if.end.us
  %indvars.iv.next5.us = add nuw nsw i64 %indvars.iv8.us, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next5.us, 1000
  br i1 %exitcond12, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.end_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
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
