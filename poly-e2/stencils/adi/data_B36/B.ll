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
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end, %entry
  %indvars.iv8 = phi i64 [ 0, %entry ], [ %indvars.iv.next5, %for.end ]
  %0 = add nuw nsw i64 %indvars.iv8, 1000
  %1 = trunc i64 %0 to i32
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv4 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next, %for.body3 ]
  %2 = sub nsw i64 0, %indvars.iv4
  %3 = trunc i64 %2 to i32
  %sub = add i32 %1, %3
  %conv = sitofp i32 %sub to double
  %div = fdiv double %conv, 1.000000e+03
  %arrayidx6 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv8, i64 %indvars.iv4
  store double %div, double* %arrayidx6, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv4, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %for.end, label %for.body3

for.end:                                          ; preds = %for.body3
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next5, 1000
  br i1 %exitcond10, label %for.end9, label %for.cond1.preheader

for.end9:                                         ; preds = %for.end
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
  %0 = phi [1000 x double]* [ %v, %entry ], [ %.pre86, %for.end236 ]
  %1 = phi i32 [ 1, %entry ], [ %inc238, %for.end236 ]
  %2 = phi [1000 x double]* [ %p, %entry ], [ %32, %for.end236 ]
  br label %for.body19.us

for.body19.us:                                    ; preds = %for.end119.us.for.body19.us_crit_edge, %for.cond15.preheader
  %3 = phi [1000 x double]* [ %.pre84, %for.end119.us.for.body19.us_crit_edge ], [ %0, %for.cond15.preheader ]
  %4 = phi [1000 x double]* [ %32, %for.end119.us.for.body19.us_crit_edge ], [ %2, %for.cond15.preheader ]
  %indvars.iv32.us = phi i64 [ %11, %for.end119.us.for.body19.us_crit_edge ], [ 1, %for.cond15.preheader ]
  %arrayidx20.us = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv32.us
  store double 1.000000e+00, double* %arrayidx20.us, align 8
  %arrayidx23.us = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv32.us, i64 0
  store double 0.000000e+00, double* %arrayidx23.us, align 8
  %5 = load [1000 x double]*, [1000 x double]** %v.addr, align 8
  %arrayidx26.us = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv32.us
  %6 = bitcast double* %arrayidx26.us to i64*
  %7 = load i64, i64* %6, align 8
  %8 = load [1000 x double]*, [1000 x double]** %q.addr, align 8
  %arrayidx28.us = getelementptr inbounds [1000 x double], [1000 x double]* %8, i64 %indvars.iv32.us
  %9 = bitcast [1000 x double]* %arrayidx28.us to i64*
  store i64 %7, i64* %9, align 8
  %10 = add nsw i64 %indvars.iv32.us, -1
  %11 = add nuw nsw i64 %indvars.iv32.us, 1
  %.pre = load double, double* %a, align 8
  %.pre74 = load double, double* %b, align 8
  br label %for.body34.us

for.end119.us:                                    ; preds = %for.body98.us
  %exitcond82 = icmp eq i64 %11, 999
  br i1 %exitcond82, label %for.body127.preheader, label %for.end119.us.for.body19.us_crit_edge

for.end119.us.for.body19.us_crit_edge:            ; preds = %for.end119.us
  %.pre84 = load [1000 x double]*, [1000 x double]** %v.addr, align 8
  br label %for.body19.us

for.body127.preheader:                            ; preds = %for.end119.us
  %.pre85 = load double, double* %e, align 8
  %.pre86 = load [1000 x double]*, [1000 x double]** %v.addr, align 8
  %.pre87 = load double, double* %c, align 8
  %sub145 = fsub double -0.000000e+00, %27
  %mul165 = fmul double %29, 2.000000e+00
  %add166 = fadd double %mul165, 1.000000e+00
  br label %for.body144.lver.check

for.body98.us:                                    ; preds = %for.body98.us.for.body98.us_crit_edge, %for.cond30.for.end_crit_edge.us
  %12 = phi double [ %add113.us, %for.body98.us.for.body98.us_crit_edge ], [ 1.000000e+00, %for.cond30.for.end_crit_edge.us ]
  %indvars.iv26.us = phi i64 [ %indvars.iv.next24.us, %for.body98.us.for.body98.us_crit_edge ], [ 998, %for.cond30.for.end_crit_edge.us ]
  %arrayidx102.us = getelementptr inbounds [1000 x double], [1000 x double]* %32, i64 %indvars.iv32.us, i64 %indvars.iv26.us
  %13 = load double, double* %arrayidx102.us, align 8
  %mul108.us = fmul double %12, %13
  %arrayidx112.us = getelementptr inbounds [1000 x double], [1000 x double]* %30, i64 %indvars.iv32.us, i64 %indvars.iv26.us
  %14 = load double, double* %arrayidx112.us, align 8
  %add113.us = fadd double %mul108.us, %14
  %arrayidx117.us = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv26.us, i64 %indvars.iv32.us
  store double %add113.us, double* %arrayidx117.us, align 8
  %cmp96.us = icmp sgt i64 %indvars.iv26.us, 1
  br i1 %cmp96.us, label %for.body98.us.for.body98.us_crit_edge, label %for.end119.us

for.body98.us.for.body98.us_crit_edge:            ; preds = %for.body98.us
  %indvars.iv.next24.us = add nsw i64 %indvars.iv26.us, -1
  br label %for.body98.us

for.body34.us:                                    ; preds = %for.body34.us.for.body34.us_crit_edge, %for.body19.us
  %15 = phi double [ %.pre74, %for.body19.us ], [ %34, %for.body34.us.for.body34.us_crit_edge ]
  %16 = phi double [ %.pre, %for.body19.us ], [ %29, %for.body34.us.for.body34.us_crit_edge ]
  %17 = phi [1000 x double]* [ %4, %for.body19.us ], [ %32, %for.body34.us.for.body34.us_crit_edge ]
  %indvars.iv20.us = phi i64 [ 1, %for.body19.us ], [ %indvars.iv.next.us, %for.body34.us.for.body34.us_crit_edge ]
  %18 = load double, double* %c, align 8
  %sub35.us = fsub double -0.000000e+00, %18
  %19 = add nsw i64 %indvars.iv20.us, -1
  %arrayidx40.us = getelementptr inbounds [1000 x double], [1000 x double]* %17, i64 %indvars.iv32.us, i64 %19
  %20 = load double, double* %arrayidx40.us, align 8
  %mul41.us = fmul double %16, %20
  %add42.us = fadd double %mul41.us, %15
  %div43.us = fdiv double %sub35.us, %add42.us
  %arrayidx47.us = getelementptr inbounds [1000 x double], [1000 x double]* %17, i64 %indvars.iv32.us, i64 %indvars.iv20.us
  store double %div43.us, double* %arrayidx47.us, align 8
  %21 = load double, double* %d, align 8
  %22 = load [1000 x double]*, [1000 x double]** %u.addr, align 8
  %arrayidx53.us = getelementptr inbounds [1000 x double], [1000 x double]* %22, i64 %indvars.iv20.us, i64 %10
  %23 = bitcast double* %arrayidx53.us to <2 x double>*
  %mul55.us = fmul double %21, 2.000000e+00
  %add56.us = fadd double %mul55.us, 1.000000e+00
  %24 = load <2 x double>, <2 x double>* %23, align 8
  %25 = insertelement <2 x double> undef, double %21, i32 0
  %26 = insertelement <2 x double> %25, double %add56.us, i32 1
  %mul61.us = fmul <2 x double> %26, %24
  %mul61.us.v.r1 = extractelement <2 x double> %mul61.us, i32 0
  %mul61.us.v.r2 = extractelement <2 x double> %mul61.us, i32 1
  %add62.us = fsub double %mul61.us.v.r2, %mul61.us.v.r1
  %27 = load double, double* %f, align 8
  %arrayidx67.us = getelementptr inbounds [1000 x double], [1000 x double]* %22, i64 %indvars.iv20.us, i64 %11
  %28 = load double, double* %arrayidx67.us, align 8
  %mul68.us = fmul double %27, %28
  %sub69.us = fsub double %add62.us, %mul68.us
  %29 = load double, double* %a, align 8
  %30 = load [1000 x double]*, [1000 x double]** %q.addr, align 8
  %arrayidx74.us = getelementptr inbounds [1000 x double], [1000 x double]* %30, i64 %indvars.iv32.us, i64 %19
  %31 = load double, double* %arrayidx74.us, align 8
  %mul75.us = fmul double %29, %31
  %sub76.us = fsub double %sub69.us, %mul75.us
  %32 = load [1000 x double]*, [1000 x double]** %p.addr, align 8
  %arrayidx81.us = getelementptr inbounds [1000 x double], [1000 x double]* %32, i64 %indvars.iv32.us, i64 %19
  %33 = load double, double* %arrayidx81.us, align 8
  %mul82.us = fmul double %29, %33
  %34 = load double, double* %b, align 8
  %add83.us = fadd double %mul82.us, %34
  %div84.us = fdiv double %sub76.us, %add83.us
  %arrayidx88.us = getelementptr inbounds [1000 x double], [1000 x double]* %30, i64 %indvars.iv32.us, i64 %indvars.iv20.us
  store double %div84.us, double* %arrayidx88.us, align 8
  %exitcond69 = icmp eq i64 %indvars.iv20.us, 998
  br i1 %exitcond69, label %for.cond30.for.end_crit_edge.us, label %for.body34.us.for.body34.us_crit_edge

for.body34.us.for.body34.us_crit_edge:            ; preds = %for.body34.us
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv20.us, 1
  br label %for.body34.us

for.cond30.for.end_crit_edge.us:                  ; preds = %for.body34.us
  %arrayidx93.us = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 999, i64 %indvars.iv32.us
  store double 1.000000e+00, double* %arrayidx93.us, align 8
  br label %for.body98.us

for.body144.lver.check:                           ; preds = %for.end233.for.body144.lver.check_crit_edge, %for.body127.preheader
  %indvar = phi i64 [ 0, %for.body127.preheader ], [ %indvar.next, %for.end233.for.body144.lver.check_crit_edge ]
  %indvars.iv51 = phi i64 [ 1, %for.body127.preheader ], [ %41, %for.end233.for.body144.lver.check_crit_edge ]
  %35 = add i64 %indvar, 1
  %36 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %32, i64 %36, i64 0
  %scevgep3 = getelementptr [1000 x double], [1000 x double]* %32, i64 %36, i64 999
  %scevgep5 = getelementptr [1000 x double], [1000 x double]* %30, i64 %36, i64 0
  %scevgep7 = getelementptr [1000 x double], [1000 x double]* %30, i64 %36, i64 999
  %arrayidx130 = getelementptr inbounds [1000 x double], [1000 x double]* %22, i64 %indvars.iv51, i64 0
  store double 1.000000e+00, double* %arrayidx130, align 8
  %arrayidx133 = getelementptr inbounds [1000 x double], [1000 x double]* %32, i64 %indvars.iv51, i64 0
  store double 0.000000e+00, double* %arrayidx133, align 8
  %37 = bitcast double* %arrayidx130 to i64*
  %38 = load i64, i64* %37, align 8
  %arrayidx138 = getelementptr inbounds [1000 x double], [1000 x double]* %30, i64 %indvars.iv51
  %39 = bitcast [1000 x double]* %arrayidx138 to i64*
  store i64 %38, i64* %39, align 8
  %40 = add nsw i64 %indvars.iv51, -1
  %41 = add nuw nsw i64 %indvars.iv51, 1
  %bound0 = icmp ult double* %scevgep, %scevgep7
  %bound1 = icmp ult double* %scevgep5, %scevgep3
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.body144.lver.check.for.body144.lver.orig_crit_edge, label %for.body144.ph

for.body144.lver.check.for.body144.lver.orig_crit_edge: ; preds = %for.body144.lver.check
  br label %for.body144.lver.orig

for.body144.lver.orig:                            ; preds = %for.body144.lver.orig, %for.body144.lver.check.for.body144.lver.orig_crit_edge
  %indvars.iv43.lver.orig = phi i64 [ 1, %for.body144.lver.check.for.body144.lver.orig_crit_edge ], [ %indvars.iv.next40.lver.orig, %for.body144.lver.orig ]
  %42 = add nsw i64 %indvars.iv43.lver.orig, -1
  %arrayidx150.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %32, i64 %indvars.iv51, i64 %42
  %43 = load double, double* %arrayidx150.lver.orig, align 8
  %mul151.lver.orig = fmul double %21, %43
  %add152.lver.orig = fadd double %mul151.lver.orig, %.pre85
  %div153.lver.orig = fdiv double %sub145, %add152.lver.orig
  %arrayidx157.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %32, i64 %indvars.iv51, i64 %indvars.iv43.lver.orig
  store double %div153.lver.orig, double* %arrayidx157.lver.orig, align 8
  %arrayidx163.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %.pre86, i64 %40, i64 %indvars.iv43.lver.orig
  %44 = load double, double* %arrayidx163.lver.orig, align 8
  %45 = fmul double %29, %44
  %arrayidx170.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %.pre86, i64 %indvars.iv51, i64 %indvars.iv43.lver.orig
  %46 = load double, double* %arrayidx170.lver.orig, align 8
  %mul171.lver.orig = fmul double %add166, %46
  %add172.lver.orig = fsub double %mul171.lver.orig, %45
  %arrayidx177.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %.pre86, i64 %41, i64 %indvars.iv43.lver.orig
  %47 = load double, double* %arrayidx177.lver.orig, align 8
  %mul178.lver.orig = fmul double %.pre87, %47
  %sub179.lver.orig = fsub double %add172.lver.orig, %mul178.lver.orig
  %arrayidx184.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %30, i64 %indvars.iv51, i64 %42
  %48 = load double, double* %arrayidx184.lver.orig, align 8
  %mul185.lver.orig = fmul double %21, %48
  %sub186.lver.orig = fsub double %sub179.lver.orig, %mul185.lver.orig
  %div194.lver.orig = fdiv double %sub186.lver.orig, %add152.lver.orig
  %arrayidx198.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %30, i64 %indvars.iv51, i64 %indvars.iv43.lver.orig
  store double %div194.lver.orig, double* %arrayidx198.lver.orig, align 8
  %indvars.iv.next40.lver.orig = add nuw nsw i64 %indvars.iv43.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.next40.lver.orig, 999
  br i1 %exitcond.lver.orig, label %for.end201.loopexit, label %for.body144.lver.orig

for.body144.ph:                                   ; preds = %for.body144.lver.check
  %scevgep10 = getelementptr [1000 x double], [1000 x double]* %30, i64 %35, i64 0
  %scevgep9 = getelementptr [1000 x double], [1000 x double]* %32, i64 %35, i64 0
  %load_initial = load double, double* %scevgep9, align 8
  %load_initial11 = load double, double* %scevgep10, align 8
  br label %for.body144

for.body144:                                      ; preds = %for.body144, %for.body144.ph
  %store_forwarded12 = phi double [ %load_initial11, %for.body144.ph ], [ %div194, %for.body144 ]
  %store_forwarded = phi double [ %load_initial, %for.body144.ph ], [ %div153, %for.body144 ]
  %indvars.iv43 = phi i64 [ 1, %for.body144.ph ], [ %indvars.iv.next40, %for.body144 ]
  %mul151 = fmul double %21, %store_forwarded
  %add152 = fadd double %mul151, %.pre85
  %div153 = fdiv double %sub145, %add152
  %arrayidx157 = getelementptr inbounds [1000 x double], [1000 x double]* %32, i64 %indvars.iv51, i64 %indvars.iv43
  store double %div153, double* %arrayidx157, align 8
  %arrayidx163 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre86, i64 %40, i64 %indvars.iv43
  %49 = load double, double* %arrayidx163, align 8
  %50 = fmul double %29, %49
  %arrayidx170 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre86, i64 %indvars.iv51, i64 %indvars.iv43
  %51 = load double, double* %arrayidx170, align 8
  %mul171 = fmul double %add166, %51
  %add172 = fsub double %mul171, %50
  %arrayidx177 = getelementptr inbounds [1000 x double], [1000 x double]* %.pre86, i64 %41, i64 %indvars.iv43
  %52 = load double, double* %arrayidx177, align 8
  %mul178 = fmul double %.pre87, %52
  %sub179 = fsub double %add172, %mul178
  %mul185 = fmul double %21, %store_forwarded12
  %sub186 = fsub double %sub179, %mul185
  %div194 = fdiv double %sub186, %add152
  %arrayidx198 = getelementptr inbounds [1000 x double], [1000 x double]* %30, i64 %indvars.iv51, i64 %indvars.iv43
  store double %div194, double* %arrayidx198, align 8
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond = icmp eq i64 %indvars.iv.next40, 999
  br i1 %exitcond, label %for.end201.loopexit23, label %for.body144

for.end201.loopexit:                              ; preds = %for.body144.lver.orig
  br label %for.end201

for.end201.loopexit23:                            ; preds = %for.body144
  br label %for.end201

for.end201:                                       ; preds = %for.end201.loopexit23, %for.end201.loopexit
  %arrayidx206 = getelementptr inbounds [1000 x double], [1000 x double]* %22, i64 %indvars.iv51, i64 999
  store double 1.000000e+00, double* %arrayidx206, align 8
  br label %for.body211

for.body211:                                      ; preds = %for.body211.for.body211_crit_edge, %for.end201
  %53 = phi double [ %add226, %for.body211.for.body211_crit_edge ], [ 1.000000e+00, %for.end201 ]
  %indvars.iv46 = phi i64 [ %indvars.iv.next44, %for.body211.for.body211_crit_edge ], [ 998, %for.end201 ]
  %arrayidx215 = getelementptr inbounds [1000 x double], [1000 x double]* %32, i64 %indvars.iv51, i64 %indvars.iv46
  %54 = load double, double* %arrayidx215, align 8
  %mul221 = fmul double %53, %54
  %arrayidx225 = getelementptr inbounds [1000 x double], [1000 x double]* %30, i64 %indvars.iv51, i64 %indvars.iv46
  %55 = load double, double* %arrayidx225, align 8
  %add226 = fadd double %mul221, %55
  %arrayidx230 = getelementptr inbounds [1000 x double], [1000 x double]* %22, i64 %indvars.iv51, i64 %indvars.iv46
  store double %add226, double* %arrayidx230, align 8
  %cmp209 = icmp sgt i64 %indvars.iv46, 1
  br i1 %cmp209, label %for.body211.for.body211_crit_edge, label %for.end233

for.body211.for.body211_crit_edge:                ; preds = %for.body211
  %indvars.iv.next44 = add nsw i64 %indvars.iv46, -1
  br label %for.body211

for.end233:                                       ; preds = %for.body211
  %exitcond83 = icmp eq i64 %41, 999
  br i1 %exitcond83, label %for.end236, label %for.end233.for.body144.lver.check_crit_edge

for.end233.for.body144.lver.check_crit_edge:      ; preds = %for.end233
  %indvar.next = add i64 %indvar, 1
  br label %for.body144.lver.check

for.end236:                                       ; preds = %for.end233
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
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.end, %entry
  %indvars.iv8 = phi i64 [ 0, %entry ], [ %indvars.iv.next5, %for.end ]
  %3 = mul nuw nsw i64 %indvars.iv8, 1000
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.cond2.preheader
  %indvars.iv4 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %if.end ]
  %4 = add nuw nsw i64 %indvars.iv4, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end

if.end:                                           ; preds = %for.body4, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv8, i64 %indvars.iv4
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv4, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %for.end, label %for.body4

for.end:                                          ; preds = %if.end
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next5, 1000
  br i1 %exitcond10, label %for.end12, label %for.cond2.preheader

for.end12:                                        ; preds = %for.end
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
