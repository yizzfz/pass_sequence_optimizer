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
  %call = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %call1 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %call2 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %call3 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #3
  %arraydecay = bitcast i8* %call to [1000 x double]*
  tail call fastcc void @init_array([1000 x double]* %arraydecay)
  tail call void (...) @polybench_timer_start() #3
  %arraydecay5 = bitcast i8* %call1 to [1000 x double]*
  %arraydecay6 = bitcast i8* %call2 to [1000 x double]*
  %arraydecay7 = bitcast i8* %call3 to [1000 x double]*
  tail call fastcc void @kernel_adi([1000 x double]* %arraydecay, [1000 x double]* %arraydecay5, [1000 x double]* %arraydecay6, [1000 x double]* %arraydecay7)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
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

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #3
  tail call void @free(i8* %call1) #3
  tail call void @free(i8* %call2) #3
  tail call void @free(i8* %call3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([1000 x double]* %u) unnamed_addr #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc7, %entry
  %indvars.iv37 = phi i64 [ 0, %entry ], [ %indvars.iv.next4, %for.inc7 ]
  %0 = add nuw nsw i64 %indvars.iv37, 1000
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv6 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next.1, %for.body3 ]
  %1 = sub nuw nsw i64 %0, %indvars.iv6
  %2 = trunc i64 %1 to i32
  %conv = sitofp i32 %2 to double
  %arrayidx6 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv37, i64 %indvars.iv6
  %indvars.iv.next = or i64 %indvars.iv6, 1
  %3 = sub nuw nsw i64 %0, %indvars.iv.next
  %4 = trunc i64 %3 to i32
  %conv.1 = sitofp i32 %4 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 1.000000e+03, double 1.000000e+03>
  %5 = bitcast double* %arrayidx6 to <2 x double>*
  store <2 x double> %div, <2 x double>* %5, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv6, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond.1, label %for.inc7, label %for.body3

for.inc7:                                         ; preds = %for.body3
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next4, 1000
  br i1 %exitcond8, label %for.end9, label %for.cond1.preheader

for.end9:                                         ; preds = %for.inc7
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_adi([1000 x double]* %u, [1000 x double]* %v, [1000 x double]* %p, [1000 x double]* %q) unnamed_addr #0 {
entry:
  br label %for.cond15.preheader

for.cond15.preheader:                             ; preds = %entry, %for.inc237
  %0 = phi i32 [ 1, %entry ], [ %inc238, %for.inc237 ]
  br label %for.body34.lver.check

for.body34.lver.check:                            ; preds = %for.inc120, %for.cond15.preheader
  %indvar = phi i64 [ %indvar.next, %for.inc120 ], [ 0, %for.cond15.preheader ]
  %indvars.iv3048 = phi i64 [ %indvars.iv.next31, %for.inc120 ], [ 1, %for.cond15.preheader ]
  %1 = add i64 %indvar, 1
  %2 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %p, i64 %2, i64 0
  %scevgep2 = getelementptr [1000 x double], [1000 x double]* %p, i64 %2, i64 999
  %scevgep4 = getelementptr [1000 x double], [1000 x double]* %q, i64 %2, i64 0
  %scevgep6 = getelementptr [1000 x double], [1000 x double]* %q, i64 %2, i64 999
  %arrayidx20 = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 0, i64 %indvars.iv3048
  store double 1.000000e+00, double* %arrayidx20, align 8
  %arrayidx23 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv3048, i64 0
  store double 0.000000e+00, double* %arrayidx23, align 8
  %3 = bitcast double* %arrayidx20 to i64*
  %4 = load i64, i64* %3, align 8
  %arrayidx28 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv3048
  %5 = bitcast [1000 x double]* %arrayidx28 to i64*
  store i64 %4, i64* %5, align 8
  %6 = add nsw i64 %indvars.iv3048, -1
  %7 = add nuw nsw i64 %indvars.iv3048, 1
  %bound0 = icmp ult double* %scevgep, %scevgep6
  %bound1 = icmp ult double* %scevgep4, %scevgep2
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.body34.lver.orig.preheader, label %for.body34.ph

for.body34.lver.orig.preheader:                   ; preds = %for.body34.lver.check
  br label %for.body34.lver.orig

for.body34.lver.orig:                             ; preds = %for.body34.lver.orig.preheader, %for.body34.lver.orig
  %indvars.iv45.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %for.body34.lver.orig ], [ 1, %for.body34.lver.orig.preheader ]
  %8 = add nsw i64 %indvars.iv45.lver.orig, -1
  %arrayidx40.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv3048, i64 %8
  %9 = load double, double* %arrayidx40.lver.orig, align 8
  %arrayidx47.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv3048, i64 %indvars.iv45.lver.orig
  %arrayidx53.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv45.lver.orig, i64 %6
  %arrayidx67.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv45.lver.orig, i64 %7
  %arrayidx74.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv3048, i64 %8
  %10 = insertelement <2 x double> undef, double %9, i32 0
  %mul41.v.i0.2.lver.orig = shufflevector <2 x double> %10, <2 x double> undef, <2 x i32> zeroinitializer
  %mul41.lver.orig = fmul <2 x double> %mul41.v.i0.2.lver.orig, <double 0xC09F400000000001, double 0xC09F400000000001>
  %add42.lver.orig = fadd <2 x double> %mul41.lver.orig, <double 0x40AF420000000001, double 0x40AF420000000001>
  %add42.v.r1.lver.orig = extractelement <2 x double> %add42.lver.orig, i32 0
  %add42.v.r2.lver.orig = extractelement <2 x double> %add42.lver.orig, i32 1
  %div43.lver.orig = fdiv double 0x409F400000000001, %add42.v.r1.lver.orig
  store double %div43.lver.orig, double* %arrayidx47.lver.orig, align 8
  %11 = bitcast double* %arrayidx53.lver.orig to <2 x double>*
  %12 = load <2 x double>, <2 x double>* %11, align 8
  %mul61.lver.orig = fmul <2 x double> %12, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %mul61.v.r1.lver.orig = extractelement <2 x double> %mul61.lver.orig, i32 0
  %mul61.v.r2.lver.orig = extractelement <2 x double> %mul61.lver.orig, i32 1
  %add62.lver.orig = fsub double %mul61.v.r2.lver.orig, %mul61.v.r1.lver.orig
  %13 = load double, double* %arrayidx67.lver.orig, align 8
  %mul68.lver.orig = fmul double %13, 0xC08F400000000001
  %sub69.lver.orig = fsub double %add62.lver.orig, %mul68.lver.orig
  %14 = load double, double* %arrayidx74.lver.orig, align 8
  %mul75.lver.orig = fmul double %14, 0xC09F400000000001
  %sub76.lver.orig = fsub double %sub69.lver.orig, %mul75.lver.orig
  %div84.lver.orig = fdiv double %sub76.lver.orig, %add42.v.r2.lver.orig
  %arrayidx88.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv3048, i64 %indvars.iv45.lver.orig
  store double %div84.lver.orig, double* %arrayidx88.lver.orig, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv45.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, 999
  br i1 %exitcond.lver.orig, label %for.end.loopexit, label %for.body34.lver.orig

for.body34.ph:                                    ; preds = %for.body34.lver.check
  %scevgep8 = getelementptr [1000 x double], [1000 x double]* %p, i64 %1, i64 0
  %scevgep11 = getelementptr [1000 x double], [1000 x double]* %q, i64 %1, i64 0
  %load_initial = load double, double* %scevgep8, align 8
  %load_initial12 = load double, double* %scevgep11, align 8
  br label %for.body34

for.body34:                                       ; preds = %for.body34.ph, %for.body34
  %store_forwarded13 = phi double [ %load_initial12, %for.body34.ph ], [ %div84, %for.body34 ]
  %store_forwarded10 = phi double [ %load_initial, %for.body34.ph ], [ %div43, %for.body34 ]
  %indvars.iv45 = phi i64 [ 1, %for.body34.ph ], [ %indvars.iv.next, %for.body34 ]
  %arrayidx47 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv3048, i64 %indvars.iv45
  %arrayidx53 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv45, i64 %6
  %arrayidx67 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv45, i64 %7
  %15 = insertelement <2 x double> undef, double %store_forwarded10, i32 0
  %mul41.v.i0.2 = shufflevector <2 x double> %15, <2 x double> undef, <2 x i32> zeroinitializer
  %mul41 = fmul <2 x double> %mul41.v.i0.2, <double 0xC09F400000000001, double 0xC09F400000000001>
  %add42 = fadd <2 x double> %mul41, <double 0x40AF420000000001, double 0x40AF420000000001>
  %add42.v.r1 = extractelement <2 x double> %add42, i32 0
  %add42.v.r2 = extractelement <2 x double> %add42, i32 1
  %div43 = fdiv double 0x409F400000000001, %add42.v.r1
  store double %div43, double* %arrayidx47, align 8
  %16 = bitcast double* %arrayidx53 to <2 x double>*
  %17 = load <2 x double>, <2 x double>* %16, align 8
  %mul61 = fmul <2 x double> %17, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %mul61.v.r1 = extractelement <2 x double> %mul61, i32 0
  %mul61.v.r2 = extractelement <2 x double> %mul61, i32 1
  %add62 = fsub double %mul61.v.r2, %mul61.v.r1
  %18 = load double, double* %arrayidx67, align 8
  %mul68 = fmul double %18, 0xC08F400000000001
  %sub69 = fsub double %add62, %mul68
  %mul75 = fmul double %store_forwarded13, 0xC09F400000000001
  %sub76 = fsub double %sub69, %mul75
  %div84 = fdiv double %sub76, %add42.v.r2
  %arrayidx88 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv3048, i64 %indvars.iv45
  store double %div84, double* %arrayidx88, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv45, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond, label %for.end.loopexit35, label %for.body34

for.end.loopexit:                                 ; preds = %for.body34.lver.orig
  br label %for.end

for.end.loopexit35:                               ; preds = %for.body34
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit35, %for.end.loopexit
  %arrayidx93 = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 999, i64 %indvars.iv3048
  store double 1.000000e+00, double* %arrayidx93, align 8
  br label %for.body98

for.body98:                                       ; preds = %for.body98, %for.end
  %19 = phi double [ 1.000000e+00, %for.end ], [ %add113.1, %for.body98 ]
  %indvars.iv2846 = phi i64 [ 998, %for.end ], [ %indvars.iv.next29.1, %for.body98 ]
  %arrayidx102 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv3048, i64 %indvars.iv2846
  %20 = load double, double* %arrayidx102, align 8
  %mul108 = fmul double %19, %20
  %arrayidx112 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv3048, i64 %indvars.iv2846
  %21 = load double, double* %arrayidx112, align 8
  %add113 = fadd double %mul108, %21
  %arrayidx117 = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv2846, i64 %indvars.iv3048
  store double %add113, double* %arrayidx117, align 8
  %indvars.iv.next29 = add nsw i64 %indvars.iv2846, -1
  %arrayidx102.1 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv3048, i64 %indvars.iv.next29
  %22 = load double, double* %arrayidx102.1, align 8
  %mul108.1 = fmul double %add113, %22
  %arrayidx112.1 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv3048, i64 %indvars.iv.next29
  %23 = load double, double* %arrayidx112.1, align 8
  %add113.1 = fadd double %mul108.1, %23
  %arrayidx117.1 = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv.next29, i64 %indvars.iv3048
  store double %add113.1, double* %arrayidx117.1, align 8
  %indvars.iv.next29.1 = add nsw i64 %indvars.iv2846, -2
  %cmp96.1 = icmp sgt i64 %indvars.iv.next29, 1
  br i1 %cmp96.1, label %for.body98, label %for.inc120

for.inc120:                                       ; preds = %for.body98
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv3048, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next31, 999
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond53, label %for.body144.lver.check.preheader, label %for.body34.lver.check

for.body144.lver.check.preheader:                 ; preds = %for.inc120
  br label %for.body144.lver.check

for.body144.lver.check:                           ; preds = %for.body144.lver.check.preheader, %for.inc234
  %indvar14 = phi i64 [ %indvar.next15, %for.inc234 ], [ 0, %for.body144.lver.check.preheader ]
  %indvars.iv4152 = phi i64 [ %indvars.iv.next42, %for.inc234 ], [ 1, %for.body144.lver.check.preheader ]
  %24 = add i64 %indvar14, 1
  %25 = add i64 %indvar14, 1
  %scevgep16 = getelementptr [1000 x double], [1000 x double]* %p, i64 %25, i64 0
  %scevgep18 = getelementptr [1000 x double], [1000 x double]* %p, i64 %25, i64 999
  %scevgep20 = getelementptr [1000 x double], [1000 x double]* %q, i64 %25, i64 0
  %scevgep22 = getelementptr [1000 x double], [1000 x double]* %q, i64 %25, i64 999
  %arrayidx130 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv4152, i64 0
  store double 1.000000e+00, double* %arrayidx130, align 8
  %arrayidx133 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv4152, i64 0
  store double 0.000000e+00, double* %arrayidx133, align 8
  %arrayidx136 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv4152, i64 0
  %26 = bitcast double* %arrayidx136 to i64*
  %27 = load i64, i64* %26, align 8
  %arrayidx138 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv4152
  %28 = bitcast [1000 x double]* %arrayidx138 to i64*
  store i64 %27, i64* %28, align 8
  %29 = add nsw i64 %indvars.iv4152, -1
  %30 = add nuw nsw i64 %indvars.iv4152, 1
  %bound024 = icmp ult double* %scevgep16, %scevgep22
  %bound125 = icmp ult double* %scevgep20, %scevgep18
  %memcheck.conflict27 = and i1 %bound024, %bound125
  br i1 %memcheck.conflict27, label %for.body144.lver.orig.preheader, label %for.body144.ph

for.body144.lver.orig.preheader:                  ; preds = %for.body144.lver.check
  br label %for.body144.lver.orig

for.body144.lver.orig:                            ; preds = %for.body144.lver.orig.preheader, %for.body144.lver.orig
  %indvars.iv3449.lver.orig = phi i64 [ %indvars.iv.next35.lver.orig, %for.body144.lver.orig ], [ 1, %for.body144.lver.orig.preheader ]
  %31 = add nsw i64 %indvars.iv3449.lver.orig, -1
  %arrayidx150.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv4152, i64 %31
  %32 = load double, double* %arrayidx150.lver.orig, align 8
  %mul151.lver.orig = fmul double %32, 0xC08F400000000001
  %add152.lver.orig = fadd double %mul151.lver.orig, 0x409F440000000001
  %div153.lver.orig = fdiv double 0x408F400000000001, %add152.lver.orig
  %arrayidx157.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv4152, i64 %indvars.iv3449.lver.orig
  store double %div153.lver.orig, double* %arrayidx157.lver.orig, align 8
  %arrayidx163.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %29, i64 %indvars.iv3449.lver.orig
  %33 = load double, double* %arrayidx163.lver.orig, align 8
  %34 = fmul double %33, 0xC09F400000000001
  %arrayidx170.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv4152, i64 %indvars.iv3449.lver.orig
  %35 = load double, double* %arrayidx170.lver.orig, align 8
  %mul171.lver.orig = fmul double %35, 0xC0AF3E0000000001
  %add172.lver.orig = fsub double %mul171.lver.orig, %34
  %arrayidx177.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %30, i64 %indvars.iv3449.lver.orig
  %36 = load double, double* %arrayidx177.lver.orig, align 8
  %mul178.lver.orig = fmul double %36, 0xC09F400000000001
  %sub179.lver.orig = fsub double %add172.lver.orig, %mul178.lver.orig
  %arrayidx184.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv4152, i64 %31
  %37 = load double, double* %arrayidx184.lver.orig, align 8
  %mul185.lver.orig = fmul double %37, 0xC08F400000000001
  %sub186.lver.orig = fsub double %sub179.lver.orig, %mul185.lver.orig
  %div194.lver.orig = fdiv double %sub186.lver.orig, %add152.lver.orig
  %arrayidx198.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv4152, i64 %indvars.iv3449.lver.orig
  store double %div194.lver.orig, double* %arrayidx198.lver.orig, align 8
  %indvars.iv.next35.lver.orig = add nuw nsw i64 %indvars.iv3449.lver.orig, 1
  %exitcond38.lver.orig = icmp eq i64 %indvars.iv.next35.lver.orig, 999
  br i1 %exitcond38.lver.orig, label %for.end201.loopexit, label %for.body144.lver.orig

for.body144.ph:                                   ; preds = %for.body144.lver.check
  %scevgep31 = getelementptr [1000 x double], [1000 x double]* %q, i64 %24, i64 0
  %scevgep28 = getelementptr [1000 x double], [1000 x double]* %p, i64 %24, i64 0
  %load_initial29 = load double, double* %scevgep28, align 8
  %load_initial32 = load double, double* %scevgep31, align 8
  br label %for.body144

for.body144:                                      ; preds = %for.body144.ph, %for.body144
  %store_forwarded33 = phi double [ %load_initial32, %for.body144.ph ], [ %div194, %for.body144 ]
  %store_forwarded30 = phi double [ %load_initial29, %for.body144.ph ], [ %div153, %for.body144 ]
  %indvars.iv3449 = phi i64 [ 1, %for.body144.ph ], [ %indvars.iv.next35, %for.body144 ]
  %mul151 = fmul double %store_forwarded30, 0xC08F400000000001
  %add152 = fadd double %mul151, 0x409F440000000001
  %div153 = fdiv double 0x408F400000000001, %add152
  %arrayidx157 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv4152, i64 %indvars.iv3449
  store double %div153, double* %arrayidx157, align 8
  %arrayidx163 = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %29, i64 %indvars.iv3449
  %38 = load double, double* %arrayidx163, align 8
  %39 = fmul double %38, 0xC09F400000000001
  %arrayidx170 = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv4152, i64 %indvars.iv3449
  %40 = load double, double* %arrayidx170, align 8
  %mul171 = fmul double %40, 0xC0AF3E0000000001
  %add172 = fsub double %mul171, %39
  %arrayidx177 = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %30, i64 %indvars.iv3449
  %41 = load double, double* %arrayidx177, align 8
  %mul178 = fmul double %41, 0xC09F400000000001
  %sub179 = fsub double %add172, %mul178
  %mul185 = fmul double %store_forwarded33, 0xC08F400000000001
  %sub186 = fsub double %sub179, %mul185
  %div194 = fdiv double %sub186, %add152
  %arrayidx198 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv4152, i64 %indvars.iv3449
  store double %div194, double* %arrayidx198, align 8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv3449, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next35, 999
  br i1 %exitcond38, label %for.end201.loopexit34, label %for.body144

for.end201.loopexit:                              ; preds = %for.body144.lver.orig
  br label %for.end201

for.end201.loopexit34:                            ; preds = %for.body144
  br label %for.end201

for.end201:                                       ; preds = %for.end201.loopexit34, %for.end201.loopexit
  %arrayidx206 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv4152, i64 999
  store double 1.000000e+00, double* %arrayidx206, align 8
  br label %for.body211

for.body211:                                      ; preds = %for.body211, %for.end201
  %42 = phi double [ 1.000000e+00, %for.end201 ], [ %add226.1, %for.body211 ]
  %indvars.iv3950 = phi i64 [ 998, %for.end201 ], [ %indvars.iv.next40.1, %for.body211 ]
  %arrayidx215 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv4152, i64 %indvars.iv3950
  %43 = load double, double* %arrayidx215, align 8
  %mul221 = fmul double %42, %43
  %arrayidx225 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv4152, i64 %indvars.iv3950
  %44 = load double, double* %arrayidx225, align 8
  %add226 = fadd double %mul221, %44
  %arrayidx230 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv4152, i64 %indvars.iv3950
  store double %add226, double* %arrayidx230, align 8
  %indvars.iv.next40 = add nsw i64 %indvars.iv3950, -1
  %arrayidx215.1 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv4152, i64 %indvars.iv.next40
  %45 = load double, double* %arrayidx215.1, align 8
  %mul221.1 = fmul double %add226, %45
  %arrayidx225.1 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv4152, i64 %indvars.iv.next40
  %46 = load double, double* %arrayidx225.1, align 8
  %add226.1 = fadd double %mul221.1, %46
  %arrayidx230.1 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv4152, i64 %indvars.iv.next40
  store double %add226.1, double* %arrayidx230.1, align 8
  %indvars.iv.next40.1 = add nsw i64 %indvars.iv3950, -2
  %cmp209.1 = icmp sgt i64 %indvars.iv.next40, 1
  br i1 %cmp209.1, label %for.body211, label %for.inc234

for.inc234:                                       ; preds = %for.body211
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv4152, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next42, 999
  %indvar.next15 = add i64 %indvar14, 1
  br i1 %exitcond54, label %for.inc237, label %for.body144.lver.check

for.inc237:                                       ; preds = %for.inc234
  %inc238 = add nuw nsw i32 %0, 1
  %exitcond55 = icmp eq i32 %inc238, 501
  br i1 %exitcond55, label %for.end239, label %for.cond15.preheader

for.end239:                                       ; preds = %for.inc237
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1000 x double]* %u) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #4
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %entry
  %indvars.iv37 = phi i64 [ 0, %entry ], [ %indvars.iv.next4, %for.inc10 ]
  %3 = mul nuw nsw i64 %indvars.iv37, 1000
  br label %for.body4

for.body4:                                        ; preds = %for.cond2.preheader, %if.end
  %indvars.iv6 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %if.end ]
  %4 = add nuw nsw i64 %indvars.iv6, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #4
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body4
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv37, i64 %indvars.iv6
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv6, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %if.end
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next4, 1000
  br i1 %exitcond8, label %for.end12, label %for.cond2.preheader

for.end12:                                        ; preds = %for.inc10
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
