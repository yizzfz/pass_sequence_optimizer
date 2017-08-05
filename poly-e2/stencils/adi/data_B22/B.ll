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
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc7, %entry
  %indvars.iv14 = phi i64 [ 0, %entry ], [ %indvars.iv.next11, %for.inc7 ]
  %0 = add nuw nsw i64 %indvars.iv14, 1000
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.cond1.preheader
  %indvars.iv10 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next.1, %for.inc ]
  %1 = sub nuw nsw i64 %0, %indvars.iv10
  %2 = trunc i64 %1 to i32
  %conv = sitofp i32 %2 to double
  %div = fdiv double %conv, 1.000000e+03
  %arrayidx6 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv14, i64 %indvars.iv10
  store double %div, double* %arrayidx6, align 8
  %indvars.iv.next = or i64 %indvars.iv10, 1
  %3 = sub nuw nsw i64 %0, %indvars.iv.next
  %4 = trunc i64 %3 to i32
  %conv.1 = sitofp i32 %4 to double
  %div.1 = fdiv double %conv.1, 1.000000e+03
  %arrayidx6.1 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv14, i64 %indvars.iv.next
  store double %div.1, double* %arrayidx6.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv10, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond.1, label %for.inc7, label %for.inc

for.inc7:                                         ; preds = %for.inc
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next11, 1000
  br i1 %exitcond13, label %for.end9, label %for.cond1.preheader

for.end9:                                         ; preds = %for.inc7
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi([1000 x double]* nocapture %u, [1000 x double]* nocapture %v, [1000 x double]* nocapture %p, [1000 x double]* nocapture %q) unnamed_addr #2 {
entry:
  br label %for.cond15.preheader

for.cond15.preheader:                             ; preds = %for.inc237, %entry
  %storemerge146 = phi i32 [ 1, %entry ], [ %inc238, %for.inc237 ]
  br label %for.inc.lver.check

for.inc.lver.check:                               ; preds = %for.inc120, %for.cond15.preheader
  %indvar = phi i64 [ %indvar.next, %for.inc120 ], [ 0, %for.cond15.preheader ]
  %indvars.iv129 = phi i64 [ %indvars.iv.next126, %for.inc120 ], [ 1, %for.cond15.preheader ]
  %0 = add i64 %indvar, 1
  %1 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %p, i64 %1, i64 0
  %scevgep2 = getelementptr [1000 x double], [1000 x double]* %p, i64 %1, i64 999
  %scevgep4 = getelementptr [1000 x double], [1000 x double]* %q, i64 %1, i64 0
  %scevgep6 = getelementptr [1000 x double], [1000 x double]* %q, i64 %1, i64 999
  %arrayidx20 = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 0, i64 %indvars.iv129
  store double 1.000000e+00, double* %arrayidx20, align 8
  %arrayidx23 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv129, i64 0
  store double 0.000000e+00, double* %arrayidx23, align 8
  %2 = bitcast double* %arrayidx20 to i64*
  %3 = load i64, i64* %2, align 8
  %arrayidx28 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv129
  %4 = bitcast [1000 x double]* %arrayidx28 to i64*
  store i64 %3, i64* %4, align 8
  %5 = add nsw i64 %indvars.iv129, -1
  %indvars.iv.next126 = add nuw nsw i64 %indvars.iv129, 1
  %bound0 = icmp ult double* %scevgep, %scevgep6
  %bound1 = icmp ult double* %scevgep4, %scevgep2
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.inc.lver.orig.preheader, label %for.inc.ph

for.inc.lver.orig.preheader:                      ; preds = %for.inc.lver.check
  br label %for.inc.lver.orig

for.inc.lver.orig:                                ; preds = %for.inc.lver.orig.preheader, %for.inc.lver.orig
  %indvars.iv122.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %for.inc.lver.orig ], [ 1, %for.inc.lver.orig.preheader ]
  %6 = add nsw i64 %indvars.iv122.lver.orig, -1
  %arrayidx40.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv129, i64 %6
  %7 = load double, double* %arrayidx40.lver.orig, align 8
  %arrayidx47.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv129, i64 %indvars.iv122.lver.orig
  %arrayidx53.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv122.lver.orig, i64 %5
  %arrayidx67.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv122.lver.orig, i64 %indvars.iv.next126
  %arrayidx74.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv129, i64 %6
  %8 = insertelement <2 x double> undef, double %7, i32 0
  %mul41.v.i0.2.lver.orig = shufflevector <2 x double> %8, <2 x double> undef, <2 x i32> zeroinitializer
  %mul41.lver.orig = fmul <2 x double> %mul41.v.i0.2.lver.orig, <double 0xC09F400000000001, double 0xC09F400000000001>
  %add42.lver.orig = fadd <2 x double> %mul41.lver.orig, <double 0x40AF420000000001, double 0x40AF420000000001>
  %add42.v.r1.lver.orig = extractelement <2 x double> %add42.lver.orig, i32 0
  %add42.v.r2.lver.orig = extractelement <2 x double> %add42.lver.orig, i32 1
  %div43.lver.orig = fdiv double 0x409F400000000001, %add42.v.r1.lver.orig
  store double %div43.lver.orig, double* %arrayidx47.lver.orig, align 8
  %9 = bitcast double* %arrayidx53.lver.orig to <2 x double>*
  %10 = load <2 x double>, <2 x double>* %9, align 8
  %mul61.lver.orig = fmul <2 x double> %10, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %mul61.v.r1.lver.orig = extractelement <2 x double> %mul61.lver.orig, i32 0
  %mul61.v.r2.lver.orig = extractelement <2 x double> %mul61.lver.orig, i32 1
  %add62.lver.orig = fsub double %mul61.v.r2.lver.orig, %mul61.v.r1.lver.orig
  %11 = load double, double* %arrayidx67.lver.orig, align 8
  %mul68.lver.orig = fmul double %11, 0x408F400000000001
  %sub69115.lver.orig = fadd double %mul68.lver.orig, %add62.lver.orig
  %12 = load double, double* %arrayidx74.lver.orig, align 8
  %mul75.lver.orig = fmul double %12, 0x409F400000000001
  %sub76116.lver.orig = fadd double %mul75.lver.orig, %sub69115.lver.orig
  %div84.lver.orig = fdiv double %sub76116.lver.orig, %add42.v.r2.lver.orig
  %arrayidx88.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv129, i64 %indvars.iv122.lver.orig
  store double %div84.lver.orig, double* %arrayidx88.lver.orig, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv122.lver.orig, 1
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.next.lver.orig, 999
  br i1 %exitcond.lver.orig, label %for.end.loopexit, label %for.inc.lver.orig

for.inc.ph:                                       ; preds = %for.inc.lver.check
  %scevgep9 = getelementptr [1000 x double], [1000 x double]* %q, i64 %0, i64 0
  %scevgep8 = getelementptr [1000 x double], [1000 x double]* %p, i64 %0, i64 0
  %load_initial = load double, double* %scevgep8, align 8
  %load_initial10 = load double, double* %scevgep9, align 8
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.inc.ph
  %store_forwarded11 = phi double [ %load_initial10, %for.inc.ph ], [ %div84, %for.inc ]
  %store_forwarded = phi double [ %load_initial, %for.inc.ph ], [ %div43, %for.inc ]
  %indvars.iv122 = phi i64 [ 1, %for.inc.ph ], [ %indvars.iv.next, %for.inc ]
  %arrayidx47 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv129, i64 %indvars.iv122
  %arrayidx53 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv122, i64 %5
  %arrayidx67 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv122, i64 %indvars.iv.next126
  %13 = insertelement <2 x double> undef, double %store_forwarded, i32 0
  %mul41.v.i0.2 = shufflevector <2 x double> %13, <2 x double> undef, <2 x i32> zeroinitializer
  %mul41 = fmul <2 x double> %mul41.v.i0.2, <double 0xC09F400000000001, double 0xC09F400000000001>
  %add42 = fadd <2 x double> %mul41, <double 0x40AF420000000001, double 0x40AF420000000001>
  %add42.v.r1 = extractelement <2 x double> %add42, i32 0
  %add42.v.r2 = extractelement <2 x double> %add42, i32 1
  %div43 = fdiv double 0x409F400000000001, %add42.v.r1
  store double %div43, double* %arrayidx47, align 8
  %14 = bitcast double* %arrayidx53 to <2 x double>*
  %15 = load <2 x double>, <2 x double>* %14, align 8
  %mul61 = fmul <2 x double> %15, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %mul61.v.r1 = extractelement <2 x double> %mul61, i32 0
  %mul61.v.r2 = extractelement <2 x double> %mul61, i32 1
  %add62 = fsub double %mul61.v.r2, %mul61.v.r1
  %16 = load double, double* %arrayidx67, align 8
  %mul68 = fmul double %16, 0x408F400000000001
  %sub69115 = fadd double %mul68, %add62
  %mul75 = fmul double %store_forwarded11, 0x409F400000000001
  %sub76116 = fadd double %mul75, %sub69115
  %div84 = fdiv double %sub76116, %add42.v.r2
  %arrayidx88 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv129, i64 %indvars.iv122
  store double %div84, double* %arrayidx88, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv122, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond, label %for.end.loopexit33, label %for.inc

for.end.loopexit:                                 ; preds = %for.inc.lver.orig
  br label %for.end

for.end.loopexit33:                               ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit33, %for.end.loopexit
  %arrayidx93 = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 999, i64 %indvars.iv129
  store double 1.000000e+00, double* %arrayidx93, align 8
  br label %for.inc118

for.inc118:                                       ; preds = %for.inc118, %for.end
  %17 = phi double [ 1.000000e+00, %for.end ], [ %add113.1, %for.inc118 ]
  %indvars.iv125 = phi i64 [ 998, %for.end ], [ %indvars.iv.next123.1, %for.inc118 ]
  %arrayidx102 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv129, i64 %indvars.iv125
  %18 = load double, double* %arrayidx102, align 8
  %mul108 = fmul double %18, %17
  %arrayidx112 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv129, i64 %indvars.iv125
  %19 = load double, double* %arrayidx112, align 8
  %add113 = fadd double %mul108, %19
  %arrayidx117 = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv125, i64 %indvars.iv129
  store double %add113, double* %arrayidx117, align 8
  %indvars.iv.next123 = add nsw i64 %indvars.iv125, -1
  %arrayidx102.1 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv129, i64 %indvars.iv.next123
  %20 = load double, double* %arrayidx102.1, align 8
  %mul108.1 = fmul double %20, %add113
  %arrayidx112.1 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv129, i64 %indvars.iv.next123
  %21 = load double, double* %arrayidx112.1, align 8
  %add113.1 = fadd double %mul108.1, %21
  %arrayidx117.1 = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv.next123, i64 %indvars.iv129
  store double %add113.1, double* %arrayidx117.1, align 8
  %cmp96.1 = icmp sgt i64 %indvars.iv.next123, 1
  %indvars.iv.next123.1 = add nsw i64 %indvars.iv125, -2
  br i1 %cmp96.1, label %for.inc118, label %for.inc120

for.inc120:                                       ; preds = %for.inc118
  %exitcond128 = icmp eq i64 %indvars.iv.next126, 999
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond128, label %for.inc199.lver.check.preheader, label %for.inc.lver.check

for.inc199.lver.check.preheader:                  ; preds = %for.inc120
  br label %for.inc199.lver.check

for.inc199.lver.check:                            ; preds = %for.inc199.lver.check.preheader, %for.inc234
  %indvar12 = phi i64 [ %indvar.next13, %for.inc234 ], [ 0, %for.inc199.lver.check.preheader ]
  %indvars.iv144 = phi i64 [ %indvars.iv.next141, %for.inc234 ], [ 1, %for.inc199.lver.check.preheader ]
  %22 = add i64 %indvar12, 1
  %23 = add i64 %indvar12, 1
  %scevgep14 = getelementptr [1000 x double], [1000 x double]* %p, i64 %23, i64 0
  %scevgep16 = getelementptr [1000 x double], [1000 x double]* %p, i64 %23, i64 999
  %scevgep18 = getelementptr [1000 x double], [1000 x double]* %q, i64 %23, i64 0
  %scevgep20 = getelementptr [1000 x double], [1000 x double]* %q, i64 %23, i64 999
  %arrayidx130 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv144, i64 0
  store double 1.000000e+00, double* %arrayidx130, align 8
  %arrayidx133 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv144, i64 0
  store double 0.000000e+00, double* %arrayidx133, align 8
  %24 = bitcast double* %arrayidx130 to i64*
  %25 = load i64, i64* %24, align 8
  %arrayidx138 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv144
  %26 = bitcast [1000 x double]* %arrayidx138 to i64*
  store i64 %25, i64* %26, align 8
  %27 = add nsw i64 %indvars.iv144, -1
  %indvars.iv.next141 = add nuw nsw i64 %indvars.iv144, 1
  %bound022 = icmp ult double* %scevgep14, %scevgep20
  %bound123 = icmp ult double* %scevgep18, %scevgep16
  %memcheck.conflict25 = and i1 %bound022, %bound123
  br i1 %memcheck.conflict25, label %for.inc199.lver.orig.preheader, label %for.inc199.ph

for.inc199.lver.orig.preheader:                   ; preds = %for.inc199.lver.check
  br label %for.inc199.lver.orig

for.inc199.lver.orig:                             ; preds = %for.inc199.lver.orig.preheader, %for.inc199.lver.orig
  %indvars.iv137.lver.orig = phi i64 [ %indvars.iv.next130.lver.orig, %for.inc199.lver.orig ], [ 1, %for.inc199.lver.orig.preheader ]
  %28 = add nsw i64 %indvars.iv137.lver.orig, -1
  %arrayidx150.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv144, i64 %28
  %29 = load double, double* %arrayidx150.lver.orig, align 8
  %arrayidx157.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv144, i64 %indvars.iv137.lver.orig
  %arrayidx163.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %27, i64 %indvars.iv137.lver.orig
  %arrayidx170.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv144, i64 %indvars.iv137.lver.orig
  %arrayidx177.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv.next141, i64 %indvars.iv137.lver.orig
  %arrayidx184.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv144, i64 %28
  %30 = insertelement <2 x double> undef, double %29, i32 0
  %mul151.v.i0.2.lver.orig = shufflevector <2 x double> %30, <2 x double> undef, <2 x i32> zeroinitializer
  %mul151.lver.orig = fmul <2 x double> %mul151.v.i0.2.lver.orig, <double 0xC08F400000000001, double 0xC08F400000000001>
  %add152.lver.orig = fadd <2 x double> %mul151.lver.orig, <double 0x409F440000000001, double 0x409F440000000001>
  %add152.v.r1.lver.orig = extractelement <2 x double> %add152.lver.orig, i32 0
  %add152.v.r2.lver.orig = extractelement <2 x double> %add152.lver.orig, i32 1
  %div153.lver.orig = fdiv double 0x408F400000000001, %add152.v.r1.lver.orig
  store double %div153.lver.orig, double* %arrayidx157.lver.orig, align 8
  %31 = load double, double* %arrayidx163.lver.orig, align 8
  %32 = fmul double %31, 0x409F400000000001
  %33 = load double, double* %arrayidx170.lver.orig, align 8
  %mul171.lver.orig = fmul double %33, 0x40AF3E0000000001
  %add172111114.lver.orig = fsub double %32, %mul171.lver.orig
  %34 = load double, double* %arrayidx177.lver.orig, align 8
  %mul178.lver.orig = fmul double %34, 0x409F400000000001
  %sub179112.lver.orig = fadd double %add172111114.lver.orig, %mul178.lver.orig
  %35 = load double, double* %arrayidx184.lver.orig, align 8
  %mul185.lver.orig = fmul double %35, 0x408F400000000001
  %sub186113.lver.orig = fadd double %sub179112.lver.orig, %mul185.lver.orig
  %div194.lver.orig = fdiv double %sub186113.lver.orig, %add152.v.r2.lver.orig
  %arrayidx198.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv144, i64 %indvars.iv137.lver.orig
  store double %div194.lver.orig, double* %arrayidx198.lver.orig, align 8
  %indvars.iv.next130.lver.orig = add nuw nsw i64 %indvars.iv137.lver.orig, 1
  %exitcond136.lver.orig = icmp eq i64 %indvars.iv.next130.lver.orig, 999
  br i1 %exitcond136.lver.orig, label %for.end201.loopexit, label %for.inc199.lver.orig

for.inc199.ph:                                    ; preds = %for.inc199.lver.check
  %scevgep29 = getelementptr [1000 x double], [1000 x double]* %q, i64 %22, i64 0
  %scevgep26 = getelementptr [1000 x double], [1000 x double]* %p, i64 %22, i64 0
  %load_initial27 = load double, double* %scevgep26, align 8
  %load_initial30 = load double, double* %scevgep29, align 8
  br label %for.inc199

for.inc199:                                       ; preds = %for.inc199, %for.inc199.ph
  %store_forwarded31 = phi double [ %load_initial30, %for.inc199.ph ], [ %div194, %for.inc199 ]
  %store_forwarded28 = phi double [ %load_initial27, %for.inc199.ph ], [ %div153, %for.inc199 ]
  %indvars.iv137 = phi i64 [ 1, %for.inc199.ph ], [ %indvars.iv.next130, %for.inc199 ]
  %arrayidx157 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv144, i64 %indvars.iv137
  %arrayidx163 = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %27, i64 %indvars.iv137
  %arrayidx170 = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv144, i64 %indvars.iv137
  %arrayidx177 = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv.next141, i64 %indvars.iv137
  %36 = insertelement <2 x double> undef, double %store_forwarded28, i32 0
  %mul151.v.i0.2 = shufflevector <2 x double> %36, <2 x double> undef, <2 x i32> zeroinitializer
  %mul151 = fmul <2 x double> %mul151.v.i0.2, <double 0xC08F400000000001, double 0xC08F400000000001>
  %add152 = fadd <2 x double> %mul151, <double 0x409F440000000001, double 0x409F440000000001>
  %add152.v.r1 = extractelement <2 x double> %add152, i32 0
  %add152.v.r2 = extractelement <2 x double> %add152, i32 1
  %div153 = fdiv double 0x408F400000000001, %add152.v.r1
  store double %div153, double* %arrayidx157, align 8
  %37 = load double, double* %arrayidx163, align 8
  %38 = fmul double %37, 0x409F400000000001
  %39 = load double, double* %arrayidx170, align 8
  %mul171 = fmul double %39, 0x40AF3E0000000001
  %add172111114 = fsub double %38, %mul171
  %40 = load double, double* %arrayidx177, align 8
  %mul178 = fmul double %40, 0x409F400000000001
  %sub179112 = fadd double %add172111114, %mul178
  %mul185 = fmul double %store_forwarded31, 0x408F400000000001
  %sub186113 = fadd double %sub179112, %mul185
  %div194 = fdiv double %sub186113, %add152.v.r2
  %arrayidx198 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv144, i64 %indvars.iv137
  store double %div194, double* %arrayidx198, align 8
  %indvars.iv.next130 = add nuw nsw i64 %indvars.iv137, 1
  %exitcond136 = icmp eq i64 %indvars.iv.next130, 999
  br i1 %exitcond136, label %for.end201.loopexit32, label %for.inc199

for.end201.loopexit:                              ; preds = %for.inc199.lver.orig
  br label %for.end201

for.end201.loopexit32:                            ; preds = %for.inc199
  br label %for.end201

for.end201:                                       ; preds = %for.end201.loopexit32, %for.end201.loopexit
  %arrayidx206 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv144, i64 999
  store double 1.000000e+00, double* %arrayidx206, align 8
  br label %for.inc231

for.inc231:                                       ; preds = %for.inc231, %for.end201
  %41 = phi double [ 1.000000e+00, %for.end201 ], [ %add226.1, %for.inc231 ]
  %indvars.iv140 = phi i64 [ 998, %for.end201 ], [ %indvars.iv.next138.1, %for.inc231 ]
  %arrayidx215 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv144, i64 %indvars.iv140
  %42 = load double, double* %arrayidx215, align 8
  %mul221 = fmul double %42, %41
  %arrayidx225 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv144, i64 %indvars.iv140
  %43 = load double, double* %arrayidx225, align 8
  %add226 = fadd double %mul221, %43
  %arrayidx230 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv144, i64 %indvars.iv140
  store double %add226, double* %arrayidx230, align 8
  %indvars.iv.next138 = add nsw i64 %indvars.iv140, -1
  %arrayidx215.1 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv144, i64 %indvars.iv.next138
  %44 = load double, double* %arrayidx215.1, align 8
  %mul221.1 = fmul double %44, %add226
  %arrayidx225.1 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv144, i64 %indvars.iv.next138
  %45 = load double, double* %arrayidx225.1, align 8
  %add226.1 = fadd double %mul221.1, %45
  %arrayidx230.1 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv144, i64 %indvars.iv.next138
  store double %add226.1, double* %arrayidx230.1, align 8
  %cmp209.1 = icmp sgt i64 %indvars.iv.next138, 1
  %indvars.iv.next138.1 = add nsw i64 %indvars.iv140, -2
  br i1 %cmp209.1, label %for.inc231, label %for.inc234

for.inc234:                                       ; preds = %for.inc231
  %exitcond143 = icmp eq i64 %indvars.iv.next141, 999
  %indvar.next13 = add i64 %indvar12, 1
  br i1 %exitcond143, label %for.inc237, label %for.inc199.lver.check

for.inc237:                                       ; preds = %for.inc234
  %inc238 = add nuw nsw i32 %storemerge146, 1
  %exitcond145 = icmp eq i32 %inc238, 501
  br i1 %exitcond145, label %for.end239, label %for.cond15.preheader

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
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %entry
  %indvars.iv13 = phi i64 [ 0, %entry ], [ %indvars.iv.next10, %for.inc10 ]
  %3 = mul nuw nsw i64 %indvars.iv13, 1000
  br label %for.body4

for.body4:                                        ; preds = %for.inc, %for.cond2.preheader
  %indvars.iv9 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %for.inc ]
  %4 = add nuw nsw i64 %indvars.iv9, %3
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
  %arrayidx8 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv13, i64 %indvars.iv9
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv9, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %for.inc
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next10, 1000
  br i1 %exitcond12, label %for.end12, label %for.cond2.preheader

for.end12:                                        ; preds = %for.inc10
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
