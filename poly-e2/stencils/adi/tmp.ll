; ModuleID = 'B.ll'
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

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
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
  %indvars.iv12 = phi i64 [ 0, %entry ], [ %indvars.iv.next13, %for.inc7 ]
  %0 = add nuw nsw i64 %indvars.iv12, 1000
  br label %for.body3

for.body3:                                        ; preds = %for.body3, %for.cond1.preheader
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next.1, %for.body3 ]
  %1 = sub nuw nsw i64 %0, %indvars.iv
  %2 = trunc i64 %1 to i32
  %conv = sitofp i32 %2 to double
  %div = fdiv double %conv, 1.000000e+03
  %arrayidx6 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv12, i64 %indvars.iv
  store double %div, double* %arrayidx6, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %3 = sub nuw nsw i64 %0, %indvars.iv.next
  %4 = trunc i64 %3 to i32
  %conv.1 = sitofp i32 %4 to double
  %div.1 = fdiv double %conv.1, 1.000000e+03
  %arrayidx6.1 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv12, i64 %indvars.iv.next
  store double %div.1, double* %arrayidx6.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 999
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.inc7, label %for.body3

for.inc7:                                         ; preds = %for.body3
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next13, 1000
  br i1 %exitcond1, label %for.end9, label %for.cond1.preheader

for.end9:                                         ; preds = %for.inc7
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_adi([1000 x double]* nocapture %u, [1000 x double]* nocapture %v, [1000 x double]* nocapture %p, [1000 x double]* nocapture %q) unnamed_addr #2 {
entry:
  br label %for.cond15.preheader

for.cond15.preheader:                             ; preds = %for.inc237, %entry
  %t.0135 = phi i32 [ 1, %entry ], [ %inc238, %for.inc237 ]
  br label %for.body34.lver.check

for.body34.lver.check:                            ; preds = %for.inc120, %for.cond15.preheader
  %indvar = phi i64 [ %indvar.next, %for.inc120 ], [ 0, %for.cond15.preheader ]
  %indvars.iv140 = phi i64 [ %indvars.iv.next141, %for.inc120 ], [ 1, %for.cond15.preheader ]
  %0 = add nuw nsw i64 %indvar, 1
  %1 = add nuw nsw i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %p, i64 %1, i64 0
  %scevgep5 = getelementptr [1000 x double], [1000 x double]* %p, i64 %1, i64 999
  %scevgep7 = getelementptr [1000 x double], [1000 x double]* %q, i64 %1, i64 0
  %scevgep9 = getelementptr [1000 x double], [1000 x double]* %q, i64 %1, i64 999
  %arrayidx20 = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 0, i64 %indvars.iv140
  store double 1.000000e+00, double* %arrayidx20, align 8
  %arrayidx23 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv140, i64 0
  store double 0.000000e+00, double* %arrayidx23, align 8
  %2 = bitcast double* %arrayidx20 to i64*
  %3 = load i64, i64* %2, align 8
  %arrayidx28 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv140
  %4 = bitcast [1000 x double]* %arrayidx28 to i64*
  store i64 %3, i64* %4, align 8
  %5 = add nsw i64 %indvars.iv140, -1
  %indvars.iv.next141 = add nuw nsw i64 %indvars.iv140, 1
  %bound0 = icmp ult double* %scevgep, %scevgep9
  %bound1 = icmp ult double* %scevgep7, %scevgep5
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.body34.lver.orig.preheader, label %for.body34.ph

for.body34.lver.orig.preheader:                   ; preds = %for.body34.lver.check
  br label %for.body34.lver.orig

for.body34.lver.orig:                             ; preds = %for.body34.lver.orig, %for.body34.lver.orig.preheader
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %for.body34.lver.orig ], [ 1, %for.body34.lver.orig.preheader ]
  %6 = add nsw i64 %indvars.iv.lver.orig, -1
  %arrayidx40.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv140, i64 %6
  %7 = load double, double* %arrayidx40.lver.orig, align 8
  %mul41.lver.orig = fmul double %7, 0xC09F400000000001
  %add42.lver.orig = fadd double %mul41.lver.orig, 0x40AF420000000001
  %div43.lver.orig = fdiv double 0x409F400000000001, %add42.lver.orig
  %arrayidx47.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv140, i64 %indvars.iv.lver.orig
  store double %div43.lver.orig, double* %arrayidx47.lver.orig, align 8
  %arrayidx53.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv.lver.orig, i64 %5
  %8 = load double, double* %arrayidx53.lver.orig, align 8
  %9 = fmul double %8, 0xC08F400000000001
  %arrayidx60.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv.lver.orig, i64 %indvars.iv140
  %10 = load double, double* %arrayidx60.lver.orig, align 8
  %mul61.lver.orig = fmul double %10, 0xC09F3C0000000001
  %add62.lver.orig = fsub double %mul61.lver.orig, %9
  %arrayidx67.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv.lver.orig, i64 %indvars.iv.next141
  %11 = load double, double* %arrayidx67.lver.orig, align 8
  %mul68.lver.orig = fmul double %11, 0xC08F400000000001
  %sub69.lver.orig = fsub double %add62.lver.orig, %mul68.lver.orig
  %arrayidx74.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv140, i64 %6
  %12 = load double, double* %arrayidx74.lver.orig, align 8
  %mul75.lver.orig = fmul double %12, 0xC09F400000000001
  %sub76.lver.orig = fsub double %sub69.lver.orig, %mul75.lver.orig
  %div84.lver.orig = fdiv double %sub76.lver.orig, %add42.lver.orig
  %arrayidx88.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv140, i64 %indvars.iv.lver.orig
  store double %div84.lver.orig, double* %arrayidx88.lver.orig, align 8
  %exitcond.lver.orig = icmp eq i64 %indvars.iv.lver.orig, 998
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
  br i1 %exitcond.lver.orig, label %for.end.loopexit, label %for.body34.lver.orig

for.body34.ph:                                    ; preds = %for.body34.lver.check
  %scevgep12 = getelementptr [1000 x double], [1000 x double]* %q, i64 %0, i64 0
  %scevgep11 = getelementptr [1000 x double], [1000 x double]* %p, i64 %0, i64 0
  %load_initial = load double, double* %scevgep11, align 8
  %load_initial13 = load double, double* %scevgep12, align 8
  br label %for.body34

for.body34:                                       ; preds = %for.body34, %for.body34.ph
  %store_forwarded14 = phi double [ %load_initial13, %for.body34.ph ], [ %div84, %for.body34 ]
  %store_forwarded = phi double [ %load_initial, %for.body34.ph ], [ %div43, %for.body34 ]
  %indvars.iv = phi i64 [ 1, %for.body34.ph ], [ %indvars.iv.next, %for.body34 ]
  %mul41 = fmul double %store_forwarded, 0xC09F400000000001
  %add42 = fadd double %mul41, 0x40AF420000000001
  %div43 = fdiv double 0x409F400000000001, %add42
  %arrayidx47 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv140, i64 %indvars.iv
  store double %div43, double* %arrayidx47, align 8
  %arrayidx53 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv, i64 %5
  %13 = load double, double* %arrayidx53, align 8
  %14 = fmul double %13, 0xC08F400000000001
  %arrayidx60 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv, i64 %indvars.iv140
  %15 = load double, double* %arrayidx60, align 8
  %mul61 = fmul double %15, 0xC09F3C0000000001
  %add62 = fsub double %mul61, %14
  %arrayidx67 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv, i64 %indvars.iv.next141
  %16 = load double, double* %arrayidx67, align 8
  %mul68 = fmul double %16, 0xC08F400000000001
  %sub69 = fsub double %add62, %mul68
  %mul75 = fmul double %store_forwarded14, 0xC09F400000000001
  %sub76 = fsub double %sub69, %mul75
  %div84 = fdiv double %sub76, %add42
  %arrayidx88 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv140, i64 %indvars.iv
  store double %div84, double* %arrayidx88, align 8
  %exitcond = icmp eq i64 %indvars.iv, 998
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %for.end.loopexit36, label %for.body34

for.end.loopexit:                                 ; preds = %for.body34.lver.orig
  br label %for.end

for.end.loopexit36:                               ; preds = %for.body34
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit36, %for.end.loopexit
  %arrayidx93 = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 999, i64 %indvars.iv140
  store double 1.000000e+00, double* %arrayidx93, align 8
  br label %for.body98

for.body98:                                       ; preds = %for.body98, %for.end
  %17 = phi double [ 1.000000e+00, %for.end ], [ %add113.1, %for.body98 ]
  %indvars.iv137 = phi i64 [ 998, %for.end ], [ %indvars.iv.next138.1, %for.body98 ]
  %arrayidx102 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv140, i64 %indvars.iv137
  %18 = load double, double* %arrayidx102, align 8
  %mul108 = fmul double %18, %17
  %arrayidx112 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv140, i64 %indvars.iv137
  %19 = load double, double* %arrayidx112, align 8
  %add113 = fadd double %mul108, %19
  %arrayidx117 = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv137, i64 %indvars.iv140
  store double %add113, double* %arrayidx117, align 8
  %indvars.iv.next138 = add nsw i64 %indvars.iv137, -1
  %arrayidx102.1 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv140, i64 %indvars.iv.next138
  %20 = load double, double* %arrayidx102.1, align 8
  %mul108.1 = fmul double %20, %add113
  %arrayidx112.1 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv140, i64 %indvars.iv.next138
  %21 = load double, double* %arrayidx112.1, align 8
  %add113.1 = fadd double %mul108.1, %21
  %arrayidx117.1 = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv.next138, i64 %indvars.iv140
  store double %add113.1, double* %arrayidx117.1, align 8
  %cmp96.1 = icmp sgt i64 %indvars.iv.next138, 1
  %indvars.iv.next138.1 = add nsw i64 %indvars.iv137, -2
  br i1 %cmp96.1, label %for.body98, label %for.inc120

for.inc120:                                       ; preds = %for.body98
  %exitcond1 = icmp eq i64 %indvars.iv.next141, 999
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %exitcond1, label %for.body144.lver.check.preheader, label %for.body34.lver.check

for.body144.lver.check.preheader:                 ; preds = %for.inc120
  br label %for.body144.lver.check

for.body144.lver.check:                           ; preds = %for.inc234, %for.body144.lver.check.preheader
  %indvar15 = phi i64 [ %indvar.next16, %for.inc234 ], [ 0, %for.body144.lver.check.preheader ]
  %indvars.iv150 = phi i64 [ %indvars.iv.next151, %for.inc234 ], [ 1, %for.body144.lver.check.preheader ]
  %22 = add nuw nsw i64 %indvar15, 1
  %23 = add nuw nsw i64 %indvar15, 1
  %scevgep17 = getelementptr [1000 x double], [1000 x double]* %p, i64 %23, i64 0
  %scevgep19 = getelementptr [1000 x double], [1000 x double]* %p, i64 %23, i64 999
  %scevgep21 = getelementptr [1000 x double], [1000 x double]* %q, i64 %23, i64 0
  %scevgep23 = getelementptr [1000 x double], [1000 x double]* %q, i64 %23, i64 999
  %arrayidx129 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv150
  %arrayidx130 = getelementptr inbounds [1000 x double], [1000 x double]* %arrayidx129, i64 0, i64 0
  store double 1.000000e+00, double* %arrayidx130, align 8
  %arrayidx133 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv150, i64 0
  store double 0.000000e+00, double* %arrayidx133, align 8
  %24 = bitcast [1000 x double]* %arrayidx129 to i64*
  %25 = load i64, i64* %24, align 8
  %arrayidx138 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv150
  %26 = bitcast [1000 x double]* %arrayidx138 to i64*
  store i64 %25, i64* %26, align 8
  %27 = add nsw i64 %indvars.iv150, -1
  %indvars.iv.next151 = add nuw nsw i64 %indvars.iv150, 1
  %bound025 = icmp ult double* %scevgep17, %scevgep23
  %bound126 = icmp ult double* %scevgep21, %scevgep19
  %memcheck.conflict28 = and i1 %bound025, %bound126
  br i1 %memcheck.conflict28, label %for.body144.lver.orig.preheader, label %for.body144.ph

for.body144.lver.orig.preheader:                  ; preds = %for.body144.lver.check
  br label %for.body144.lver.orig

for.body144.lver.orig:                            ; preds = %for.body144.lver.orig, %for.body144.lver.orig.preheader
  %indvars.iv143.lver.orig = phi i64 [ %indvars.iv.next144.lver.orig, %for.body144.lver.orig ], [ 1, %for.body144.lver.orig.preheader ]
  %28 = add nsw i64 %indvars.iv143.lver.orig, -1
  %arrayidx150.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv150, i64 %28
  %29 = load double, double* %arrayidx150.lver.orig, align 8
  %mul151.lver.orig = fmul double %29, 0xC08F400000000001
  %add152.lver.orig = fadd double %mul151.lver.orig, 0x409F440000000001
  %div153.lver.orig = fdiv double 0x408F400000000001, %add152.lver.orig
  %arrayidx157.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv150, i64 %indvars.iv143.lver.orig
  store double %div153.lver.orig, double* %arrayidx157.lver.orig, align 8
  %arrayidx163.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %27, i64 %indvars.iv143.lver.orig
  %30 = load double, double* %arrayidx163.lver.orig, align 8
  %31 = fmul double %30, 0xC09F400000000001
  %arrayidx170.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv150, i64 %indvars.iv143.lver.orig
  %32 = load double, double* %arrayidx170.lver.orig, align 8
  %mul171.lver.orig = fmul double %32, 0xC0AF3E0000000001
  %add172.lver.orig = fsub double %mul171.lver.orig, %31
  %arrayidx177.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv.next151, i64 %indvars.iv143.lver.orig
  %33 = load double, double* %arrayidx177.lver.orig, align 8
  %mul178.lver.orig = fmul double %33, 0xC09F400000000001
  %sub179.lver.orig = fsub double %add172.lver.orig, %mul178.lver.orig
  %arrayidx184.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv150, i64 %28
  %34 = load double, double* %arrayidx184.lver.orig, align 8
  %mul185.lver.orig = fmul double %34, 0xC08F400000000001
  %sub186.lver.orig = fsub double %sub179.lver.orig, %mul185.lver.orig
  %div194.lver.orig = fdiv double %sub186.lver.orig, %add152.lver.orig
  %arrayidx198.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv150, i64 %indvars.iv143.lver.orig
  store double %div194.lver.orig, double* %arrayidx198.lver.orig, align 8
  %exitcond146.lver.orig = icmp eq i64 %indvars.iv143.lver.orig, 998
  %indvars.iv.next144.lver.orig = add nuw nsw i64 %indvars.iv143.lver.orig, 1
  br i1 %exitcond146.lver.orig, label %for.end201.loopexit, label %for.body144.lver.orig

for.body144.ph:                                   ; preds = %for.body144.lver.check
  %scevgep32 = getelementptr [1000 x double], [1000 x double]* %q, i64 %22, i64 0
  %scevgep29 = getelementptr [1000 x double], [1000 x double]* %p, i64 %22, i64 0
  %load_initial30 = load double, double* %scevgep29, align 8
  %load_initial33 = load double, double* %scevgep32, align 8
  br label %for.body144

for.body144:                                      ; preds = %for.body144, %for.body144.ph
  %store_forwarded34 = phi double [ %load_initial33, %for.body144.ph ], [ %div194, %for.body144 ]
  %store_forwarded31 = phi double [ %load_initial30, %for.body144.ph ], [ %div153, %for.body144 ]
  %indvars.iv143 = phi i64 [ 1, %for.body144.ph ], [ %indvars.iv.next144, %for.body144 ]
  %mul151 = fmul double %store_forwarded31, 0xC08F400000000001
  %add152 = fadd double %mul151, 0x409F440000000001
  %div153 = fdiv double 0x408F400000000001, %add152
  %arrayidx157 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv150, i64 %indvars.iv143
  store double %div153, double* %arrayidx157, align 8
  %arrayidx163 = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %27, i64 %indvars.iv143
  %35 = load double, double* %arrayidx163, align 8
  %36 = fmul double %35, 0xC09F400000000001
  %arrayidx170 = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv150, i64 %indvars.iv143
  %37 = load double, double* %arrayidx170, align 8
  %mul171 = fmul double %37, 0xC0AF3E0000000001
  %add172 = fsub double %mul171, %36
  %arrayidx177 = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv.next151, i64 %indvars.iv143
  %38 = load double, double* %arrayidx177, align 8
  %mul178 = fmul double %38, 0xC09F400000000001
  %sub179 = fsub double %add172, %mul178
  %mul185 = fmul double %store_forwarded34, 0xC08F400000000001
  %sub186 = fsub double %sub179, %mul185
  %div194 = fdiv double %sub186, %add152
  %arrayidx198 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv150, i64 %indvars.iv143
  store double %div194, double* %arrayidx198, align 8
  %exitcond146 = icmp eq i64 %indvars.iv143, 998
  %indvars.iv.next144 = add nuw nsw i64 %indvars.iv143, 1
  br i1 %exitcond146, label %for.end201.loopexit35, label %for.body144

for.end201.loopexit:                              ; preds = %for.body144.lver.orig
  br label %for.end201

for.end201.loopexit35:                            ; preds = %for.body144
  br label %for.end201

for.end201:                                       ; preds = %for.end201.loopexit35, %for.end201.loopexit
  %arrayidx206 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv150, i64 999
  store double 1.000000e+00, double* %arrayidx206, align 8
  br label %for.body211

for.body211:                                      ; preds = %for.body211, %for.end201
  %39 = phi double [ 1.000000e+00, %for.end201 ], [ %add226.1, %for.body211 ]
  %indvars.iv147 = phi i64 [ 998, %for.end201 ], [ %indvars.iv.next148.1, %for.body211 ]
  %arrayidx215 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv150, i64 %indvars.iv147
  %40 = load double, double* %arrayidx215, align 8
  %mul221 = fmul double %40, %39
  %arrayidx225 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv150, i64 %indvars.iv147
  %41 = load double, double* %arrayidx225, align 8
  %add226 = fadd double %mul221, %41
  %arrayidx230 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv150, i64 %indvars.iv147
  store double %add226, double* %arrayidx230, align 8
  %indvars.iv.next148 = add nsw i64 %indvars.iv147, -1
  %arrayidx215.1 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv150, i64 %indvars.iv.next148
  %42 = load double, double* %arrayidx215.1, align 8
  %mul221.1 = fmul double %42, %add226
  %arrayidx225.1 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv150, i64 %indvars.iv.next148
  %43 = load double, double* %arrayidx225.1, align 8
  %add226.1 = fadd double %mul221.1, %43
  %arrayidx230.1 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv150, i64 %indvars.iv.next148
  store double %add226.1, double* %arrayidx230.1, align 8
  %cmp209.1 = icmp sgt i64 %indvars.iv.next148, 1
  %indvars.iv.next148.1 = add nsw i64 %indvars.iv147, -2
  br i1 %cmp209.1, label %for.body211, label %for.inc234

for.inc234:                                       ; preds = %for.body211
  %exitcond2 = icmp eq i64 %indvars.iv.next151, 999
  %indvar.next16 = add nuw nsw i64 %indvar15, 1
  br i1 %exitcond2, label %for.inc237, label %for.body144.lver.check

for.inc237:                                       ; preds = %for.inc234
  %inc238 = add nuw nsw i32 %t.0135, 1
  %exitcond3 = icmp eq i32 %inc238, 501
  br i1 %exitcond3, label %for.end239, label %for.cond15.preheader

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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc10, %entry
  %indvars.iv11 = phi i64 [ 0, %entry ], [ %indvars.iv.next12, %for.inc10 ]
  %3 = mul nuw nsw i64 %indvars.iv11, 1000
  br label %for.body4

for.body4:                                        ; preds = %if.end, %for.cond2.preheader
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next, %if.end ]
  %4 = add nuw nsw i64 %indvars.iv, %3
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp5 = icmp eq i32 %rem, 0
  br i1 %cmp5, label %if.then, label %if.end

if.then:                                          ; preds = %for.body4
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body4
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv11, i64 %indvars.iv
  %8 = load double, double* %arrayidx8, align 8
  %call9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %for.inc10, label %for.body4

for.inc10:                                        ; preds = %if.end
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next12, 1000
  br i1 %exitcond1, label %for.end12, label %for.cond2.preheader

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
