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
  %1 = bitcast i8* %call to [1000 x double]*
  tail call fastcc void @print_array(i32 1000, [1000 x double]* %1)
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
define internal fastcc void @init_array(i32 %n, [1000 x double]* nocapture %u) unnamed_addr #2 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.end, %entry
  %indvars.iv26 = phi i64 [ 0, %entry ], [ %indvars.iv.next3, %for.end ]
  %0 = add nuw nsw i64 %indvars.iv26, 1000
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.body
  %indvars.iv5 = phi i64 [ 0, %for.body ], [ %indvars.iv.next.1, %for.body3 ]
  %1 = sub nuw nsw i64 %0, %indvars.iv5
  %2 = trunc i64 %1 to i32
  %conv = sitofp i32 %2 to double
  %arrayidx6 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv26, i64 %indvars.iv5
  %indvars.iv.next = or i64 %indvars.iv5, 1
  %3 = sub nuw nsw i64 %0, %indvars.iv.next
  %4 = trunc i64 %3 to i32
  %conv.1 = sitofp i32 %4 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 1.000000e+03, double 1.000000e+03>
  %5 = bitcast double* %arrayidx6 to <2 x double>*
  store <2 x double> %div, <2 x double>* %5, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv5, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond.1, label %for.end, label %for.body3

for.end:                                          ; preds = %for.body3
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next3, 1000
  br i1 %exitcond8, label %for.end9, label %for.body

for.end9:                                         ; preds = %for.end
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi(i32 %tsteps, i32 %n, [1000 x double]* %u, [1000 x double]* %v, [1000 x double]* %p, [1000 x double]* %q) unnamed_addr #2 {
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
  br label %for.body19.preheader

for.body19.preheader:                             ; preds = %for.end236, %entry
  %0 = phi i32 [ 1, %entry ], [ %inc238, %for.end236 ]
  %1 = phi [1000 x double]* [ %p, %entry ], [ %38, %for.end236 ]
  br label %for.body19

for.body19:                                       ; preds = %for.end119, %for.body19.preheader
  %2 = phi [1000 x double]* [ %1, %for.body19.preheader ], [ %26, %for.end119 ]
  %indvars.iv1546 = phi i64 [ 1, %for.body19.preheader ], [ %indvars.iv.next16, %for.end119 ]
  %3 = load [1000 x double]*, [1000 x double]** %v.addr, align 8
  %arrayidx20 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 0, i64 %indvars.iv1546
  store double 1.000000e+00, double* %arrayidx20, align 8
  %arrayidx23 = getelementptr inbounds [1000 x double], [1000 x double]* %2, i64 %indvars.iv1546, i64 0
  store double 0.000000e+00, double* %arrayidx23, align 8
  %4 = load [1000 x double]*, [1000 x double]** %v.addr, align 8
  %arrayidx26 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 0, i64 %indvars.iv1546
  %5 = bitcast double* %arrayidx26 to i64*
  %6 = load i64, i64* %5, align 8
  %7 = load [1000 x double]*, [1000 x double]** %q.addr, align 8
  %arrayidx28 = getelementptr inbounds [1000 x double], [1000 x double]* %7, i64 %indvars.iv1546
  %8 = bitcast [1000 x double]* %arrayidx28 to i64*
  store i64 %6, i64* %8, align 8
  %9 = add nsw i64 %indvars.iv1546, -1
  %10 = add nuw nsw i64 %indvars.iv1546, 1
  br label %for.body34

for.body34:                                       ; preds = %for.body34, %for.body19
  %11 = phi [1000 x double]* [ %2, %for.body19 ], [ %26, %for.body34 ]
  %indvars.iv40 = phi i64 [ 1, %for.body19 ], [ %indvars.iv.next, %for.body34 ]
  %12 = load double, double* %c, align 8
  %sub35 = fsub double -0.000000e+00, %12
  %13 = load double, double* %a, align 8
  %14 = add nsw i64 %indvars.iv40, -1
  %arrayidx40 = getelementptr inbounds [1000 x double], [1000 x double]* %11, i64 %indvars.iv1546, i64 %14
  %15 = load double, double* %arrayidx40, align 8
  %mul41 = fmul double %13, %15
  %16 = load double, double* %b, align 8
  %add42 = fadd double %mul41, %16
  %div43 = fdiv double %sub35, %add42
  %arrayidx47 = getelementptr inbounds [1000 x double], [1000 x double]* %11, i64 %indvars.iv1546, i64 %indvars.iv40
  store double %div43, double* %arrayidx47, align 8
  %17 = load double, double* %d, align 8
  %sub48 = fsub double -0.000000e+00, %17
  %18 = load [1000 x double]*, [1000 x double]** %u.addr, align 8
  %arrayidx53 = getelementptr inbounds [1000 x double], [1000 x double]* %18, i64 %indvars.iv40, i64 %9
  %19 = bitcast double* %arrayidx53 to <2 x double>*
  %mul55 = fmul double %17, 2.000000e+00
  %add56 = fadd double %mul55, 1.000000e+00
  %20 = load <2 x double>, <2 x double>* %19, align 8
  %mul54.v.i0.1 = insertelement <2 x double> undef, double %sub48, i32 0
  %mul54.v.i0.2 = insertelement <2 x double> %mul54.v.i0.1, double %add56, i32 1
  %mul54 = fmul <2 x double> %mul54.v.i0.2, %20
  %mul54.v.r1 = extractelement <2 x double> %mul54, i32 0
  %mul54.v.r2 = extractelement <2 x double> %mul54, i32 1
  %add62 = fadd double %mul54.v.r1, %mul54.v.r2
  %21 = load double, double* %f, align 8
  %arrayidx67 = getelementptr inbounds [1000 x double], [1000 x double]* %18, i64 %indvars.iv40, i64 %10
  %22 = load double, double* %arrayidx67, align 8
  %mul68 = fmul double %21, %22
  %sub69 = fsub double %add62, %mul68
  %23 = load double, double* %a, align 8
  %24 = load [1000 x double]*, [1000 x double]** %q.addr, align 8
  %arrayidx74 = getelementptr inbounds [1000 x double], [1000 x double]* %24, i64 %indvars.iv1546, i64 %14
  %25 = load double, double* %arrayidx74, align 8
  %mul75 = fmul double %23, %25
  %sub76 = fsub double %sub69, %mul75
  %26 = load [1000 x double]*, [1000 x double]** %p.addr, align 8
  %arrayidx81 = getelementptr inbounds [1000 x double], [1000 x double]* %26, i64 %indvars.iv1546, i64 %14
  %27 = load double, double* %arrayidx81, align 8
  %mul82 = fmul double %23, %27
  %28 = load double, double* %b, align 8
  %add83 = fadd double %mul82, %28
  %div84 = fdiv double %sub76, %add83
  %arrayidx88 = getelementptr inbounds [1000 x double], [1000 x double]* %24, i64 %indvars.iv1546, i64 %indvars.iv40
  store double %div84, double* %arrayidx88, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv40, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond, label %for.end, label %for.body34

for.end:                                          ; preds = %for.body34
  %arrayidx93 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 999, i64 %indvars.iv1546
  store double 1.000000e+00, double* %arrayidx93, align 8
  br label %for.body98

for.body98:                                       ; preds = %for.body98, %for.end
  %indvars.iv1242 = phi i64 [ 998, %for.end ], [ %indvars.iv.next13.1, %for.body98 ]
  %arrayidx102 = getelementptr inbounds [1000 x double], [1000 x double]* %26, i64 %indvars.iv1546, i64 %indvars.iv1242
  %29 = load double, double* %arrayidx102, align 8
  %30 = or i64 %indvars.iv1242, 1
  %arrayidx107 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %30, i64 %indvars.iv1546
  %31 = load double, double* %arrayidx107, align 8
  %mul108 = fmul double %29, %31
  %arrayidx112 = getelementptr inbounds [1000 x double], [1000 x double]* %24, i64 %indvars.iv1546, i64 %indvars.iv1242
  %32 = load double, double* %arrayidx112, align 8
  %add113 = fadd double %mul108, %32
  %arrayidx117 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv1242, i64 %indvars.iv1546
  store double %add113, double* %arrayidx117, align 8
  %indvars.iv.next13 = add nsw i64 %indvars.iv1242, -1
  %arrayidx102.1 = getelementptr inbounds [1000 x double], [1000 x double]* %26, i64 %indvars.iv1546, i64 %indvars.iv.next13
  %33 = load double, double* %arrayidx102.1, align 8
  %mul108.1 = fmul double %33, %add113
  %arrayidx112.1 = getelementptr inbounds [1000 x double], [1000 x double]* %24, i64 %indvars.iv1546, i64 %indvars.iv.next13
  %34 = load double, double* %arrayidx112.1, align 8
  %add113.1 = fadd double %mul108.1, %34
  %arrayidx117.1 = getelementptr inbounds [1000 x double], [1000 x double]* %4, i64 %indvars.iv.next13, i64 %indvars.iv1546
  store double %add113.1, double* %arrayidx117.1, align 8
  %indvars.iv.next13.1 = add nsw i64 %indvars.iv1242, -2
  %cmp96.1 = icmp sgt i64 %indvars.iv.next13, 1
  br i1 %cmp96.1, label %for.body98, label %for.end119

for.end119:                                       ; preds = %for.body98
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv1546, 1
  %exitcond75 = icmp eq i64 %indvars.iv.next16, 999
  br i1 %exitcond75, label %for.body144.us.lver.check.preheader, label %for.body19

for.body144.us.lver.check.preheader:              ; preds = %for.end119
  br label %for.body144.us.lver.check

for.body144.us.lver.check:                        ; preds = %for.body144.us.lver.check.preheader, %for.end233.us
  %indvar = phi i64 [ %indvar.next, %for.end233.us ], [ 0, %for.body144.us.lver.check.preheader ]
  %35 = phi [1000 x double]* [ %39, %for.end233.us ], [ %18, %for.body144.us.lver.check.preheader ]
  %indvars.iv2560.us = phi i64 [ %indvars.iv.next26.us, %for.end233.us ], [ 1, %for.body144.us.lver.check.preheader ]
  %36 = add i64 %indvar, 1
  %37 = add i64 %indvar, 1
  %arrayidx130.us = getelementptr inbounds [1000 x double], [1000 x double]* %35, i64 %indvars.iv2560.us, i64 0
  store double 1.000000e+00, double* %arrayidx130.us, align 8
  %38 = load [1000 x double]*, [1000 x double]** %p.addr, align 8
  %arrayidx133.us = getelementptr inbounds [1000 x double], [1000 x double]* %38, i64 %indvars.iv2560.us, i64 0
  store double 0.000000e+00, double* %arrayidx133.us, align 8
  %39 = load [1000 x double]*, [1000 x double]** %u.addr, align 8
  %arrayidx135.us = getelementptr inbounds [1000 x double], [1000 x double]* %39, i64 %indvars.iv2560.us
  %40 = bitcast [1000 x double]* %arrayidx135.us to i64*
  %41 = load i64, i64* %40, align 8
  %42 = load [1000 x double]*, [1000 x double]** %q.addr, align 8
  %arrayidx138.us = getelementptr inbounds [1000 x double], [1000 x double]* %42, i64 %indvars.iv2560.us
  %43 = bitcast [1000 x double]* %arrayidx138.us to i64*
  store i64 %41, i64* %43, align 8
  %44 = load double, double* %f, align 8
  %sub145.us = fsub double -0.000000e+00, %44
  %45 = load double, double* %d, align 8
  %46 = load double, double* %e, align 8
  %47 = load double, double* %a, align 8
  %48 = load [1000 x double]*, [1000 x double]** %v.addr, align 8
  %49 = add nsw i64 %indvars.iv2560.us, -1
  %mul165.us = fmul double %47, 2.000000e+00
  %add166.us = fadd double %mul165.us, 1.000000e+00
  %50 = load double, double* %c, align 8
  %51 = add nuw nsw i64 %indvars.iv2560.us, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %38, i64 %37, i64 0
  %scevgep85 = getelementptr [1000 x double], [1000 x double]* %38, i64 %37, i64 999
  %scevgep87 = getelementptr [1000 x double], [1000 x double]* %42, i64 %37, i64 0
  %scevgep89 = getelementptr [1000 x double], [1000 x double]* %42, i64 %37, i64 999
  %bound0 = icmp ult double* %scevgep, %scevgep89
  %bound1 = icmp ult double* %scevgep87, %scevgep85
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.body144.us.lver.orig.preheader, label %for.body144.us.ph

for.body144.us.lver.orig.preheader:               ; preds = %for.body144.us.lver.check
  br label %for.body144.us.lver.orig

for.body144.us.lver.orig:                         ; preds = %for.body144.us.lver.orig.preheader, %for.body144.us.lver.orig
  %indvars.iv1954.us.lver.orig = phi i64 [ %indvars.iv.next20.us.lver.orig, %for.body144.us.lver.orig ], [ 1, %for.body144.us.lver.orig.preheader ]
  %52 = add nsw i64 %indvars.iv1954.us.lver.orig, -1
  %arrayidx150.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %38, i64 %indvars.iv2560.us, i64 %52
  %53 = load double, double* %arrayidx150.us.lver.orig, align 8
  %mul151.us.lver.orig = fmul double %45, %53
  %add152.us.lver.orig = fadd double %mul151.us.lver.orig, %46
  %div153.us.lver.orig = fdiv double %sub145.us, %add152.us.lver.orig
  %arrayidx157.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %38, i64 %indvars.iv2560.us, i64 %indvars.iv1954.us.lver.orig
  store double %div153.us.lver.orig, double* %arrayidx157.us.lver.orig, align 8
  %arrayidx163.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %48, i64 %49, i64 %indvars.iv1954.us.lver.orig
  %54 = load double, double* %arrayidx163.us.lver.orig, align 8
  %55 = fmul double %47, %54
  %arrayidx170.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %48, i64 %indvars.iv2560.us, i64 %indvars.iv1954.us.lver.orig
  %56 = load double, double* %arrayidx170.us.lver.orig, align 8
  %mul171.us.lver.orig = fmul double %add166.us, %56
  %add172.us.lver.orig = fsub double %mul171.us.lver.orig, %55
  %arrayidx177.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %48, i64 %51, i64 %indvars.iv1954.us.lver.orig
  %57 = load double, double* %arrayidx177.us.lver.orig, align 8
  %mul178.us.lver.orig = fmul double %50, %57
  %sub179.us.lver.orig = fsub double %add172.us.lver.orig, %mul178.us.lver.orig
  %arrayidx184.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %42, i64 %indvars.iv2560.us, i64 %52
  %58 = load double, double* %arrayidx184.us.lver.orig, align 8
  %mul185.us.lver.orig = fmul double %45, %58
  %sub186.us.lver.orig = fsub double %sub179.us.lver.orig, %mul185.us.lver.orig
  %div194.us.lver.orig = fdiv double %sub186.us.lver.orig, %add152.us.lver.orig
  %arrayidx198.us.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %42, i64 %indvars.iv2560.us, i64 %indvars.iv1954.us.lver.orig
  store double %div194.us.lver.orig, double* %arrayidx198.us.lver.orig, align 8
  %indvars.iv.next20.us.lver.orig = add nuw nsw i64 %indvars.iv1954.us.lver.orig, 1
  %exitcond.us.lver.orig = icmp eq i64 %indvars.iv.next20.us.lver.orig, 999
  br i1 %exitcond.us.lver.orig, label %for.body211.us.preheader.loopexit, label %for.body144.us.lver.orig

for.body144.us.ph:                                ; preds = %for.body144.us.lver.check
  %scevgep91 = getelementptr [1000 x double], [1000 x double]* %38, i64 %36, i64 0
  %load_initial = load double, double* %scevgep91, align 8
  %scevgep92 = getelementptr [1000 x double], [1000 x double]* %42, i64 %36, i64 0
  %load_initial93 = load double, double* %scevgep92, align 8
  br label %for.body144.us

for.end233.us:                                    ; preds = %for.body211.us
  %indvars.iv.next26.us = add nuw nsw i64 %indvars.iv2560.us, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next26.us, 999
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond76, label %for.end236, label %for.body144.us.lver.check

for.body211.us:                                   ; preds = %for.body211.us, %for.body211.us.preheader
  %indvars.iv2257.us = phi i64 [ 998, %for.body211.us.preheader ], [ %indvars.iv.next23.us.1, %for.body211.us ]
  %arrayidx215.us = getelementptr inbounds [1000 x double], [1000 x double]* %38, i64 %indvars.iv2560.us, i64 %indvars.iv2257.us
  %59 = load double, double* %arrayidx215.us, align 8
  %60 = or i64 %indvars.iv2257.us, 1
  %arrayidx220.us = getelementptr inbounds [1000 x double], [1000 x double]* %39, i64 %indvars.iv2560.us, i64 %60
  %61 = load double, double* %arrayidx220.us, align 8
  %mul221.us = fmul double %59, %61
  %arrayidx225.us = getelementptr inbounds [1000 x double], [1000 x double]* %42, i64 %indvars.iv2560.us, i64 %indvars.iv2257.us
  %62 = load double, double* %arrayidx225.us, align 8
  %add226.us = fadd double %mul221.us, %62
  %arrayidx230.us = getelementptr inbounds [1000 x double], [1000 x double]* %39, i64 %indvars.iv2560.us, i64 %indvars.iv2257.us
  store double %add226.us, double* %arrayidx230.us, align 8
  %indvars.iv.next23.us = add nsw i64 %indvars.iv2257.us, -1
  %arrayidx215.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %38, i64 %indvars.iv2560.us, i64 %indvars.iv.next23.us
  %63 = load double, double* %arrayidx215.us.1, align 8
  %mul221.us.1 = fmul double %63, %add226.us
  %arrayidx225.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %42, i64 %indvars.iv2560.us, i64 %indvars.iv.next23.us
  %64 = load double, double* %arrayidx225.us.1, align 8
  %add226.us.1 = fadd double %mul221.us.1, %64
  %arrayidx230.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %39, i64 %indvars.iv2560.us, i64 %indvars.iv.next23.us
  store double %add226.us.1, double* %arrayidx230.us.1, align 8
  %indvars.iv.next23.us.1 = add nsw i64 %indvars.iv2257.us, -2
  %cmp209.us.1 = icmp sgt i64 %indvars.iv.next23.us, 1
  br i1 %cmp209.us.1, label %for.body211.us, label %for.end233.us

for.body144.us:                                   ; preds = %for.body144.us, %for.body144.us.ph
  %store_forwarded94 = phi double [ %load_initial93, %for.body144.us.ph ], [ %div194.us, %for.body144.us ]
  %store_forwarded = phi double [ %load_initial, %for.body144.us.ph ], [ %div153.us, %for.body144.us ]
  %indvars.iv1954.us = phi i64 [ 1, %for.body144.us.ph ], [ %indvars.iv.next20.us, %for.body144.us ]
  %mul151.us = fmul double %45, %store_forwarded
  %add152.us = fadd double %mul151.us, %46
  %div153.us = fdiv double %sub145.us, %add152.us
  %arrayidx157.us = getelementptr inbounds [1000 x double], [1000 x double]* %38, i64 %indvars.iv2560.us, i64 %indvars.iv1954.us
  store double %div153.us, double* %arrayidx157.us, align 8
  %arrayidx163.us = getelementptr inbounds [1000 x double], [1000 x double]* %48, i64 %49, i64 %indvars.iv1954.us
  %65 = load double, double* %arrayidx163.us, align 8
  %66 = fmul double %47, %65
  %arrayidx170.us = getelementptr inbounds [1000 x double], [1000 x double]* %48, i64 %indvars.iv2560.us, i64 %indvars.iv1954.us
  %67 = load double, double* %arrayidx170.us, align 8
  %mul171.us = fmul double %add166.us, %67
  %add172.us = fsub double %mul171.us, %66
  %arrayidx177.us = getelementptr inbounds [1000 x double], [1000 x double]* %48, i64 %51, i64 %indvars.iv1954.us
  %68 = load double, double* %arrayidx177.us, align 8
  %mul178.us = fmul double %50, %68
  %sub179.us = fsub double %add172.us, %mul178.us
  %mul185.us = fmul double %45, %store_forwarded94
  %sub186.us = fsub double %sub179.us, %mul185.us
  %div194.us = fdiv double %sub186.us, %add152.us
  %arrayidx198.us = getelementptr inbounds [1000 x double], [1000 x double]* %42, i64 %indvars.iv2560.us, i64 %indvars.iv1954.us
  store double %div194.us, double* %arrayidx198.us, align 8
  %indvars.iv.next20.us = add nuw nsw i64 %indvars.iv1954.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next20.us, 999
  br i1 %exitcond.us, label %for.body211.us.preheader.loopexit99, label %for.body144.us

for.body211.us.preheader.loopexit:                ; preds = %for.body144.us.lver.orig
  br label %for.body211.us.preheader

for.body211.us.preheader.loopexit99:              ; preds = %for.body144.us
  br label %for.body211.us.preheader

for.body211.us.preheader:                         ; preds = %for.body211.us.preheader.loopexit99, %for.body211.us.preheader.loopexit
  %arrayidx206.us = getelementptr inbounds [1000 x double], [1000 x double]* %39, i64 %indvars.iv2560.us, i64 999
  store double 1.000000e+00, double* %arrayidx206.us, align 8
  br label %for.body211.us

for.end236:                                       ; preds = %for.end233.us
  %inc238 = add nuw nsw i32 %0, 1
  %exitcond77 = icmp eq i32 %inc238, 501
  br i1 %exitcond77, label %for.end239, label %for.body19.preheader

for.end239:                                       ; preds = %for.end236
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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.body

for.body:                                         ; preds = %for.end, %entry
  %indvars.iv26 = phi i64 [ 0, %entry ], [ %indvars.iv.next3, %for.end ]
  %3 = mul nuw nsw i64 %indvars.iv26, 1000
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.body
  %indvars.iv5 = phi i64 [ 0, %for.body ], [ %indvars.iv.next, %if.end ]
  %4 = add nuw nsw i64 %indvars.iv5, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end

if.end:                                           ; preds = %for.body4, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv26, i64 %indvars.iv5
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %for.end, label %for.body4

for.end:                                          ; preds = %if.end
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next3, 1000
  br i1 %exitcond8, label %for.end12, label %for.body

for.end12:                                        ; preds = %for.end
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
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
tr.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
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
