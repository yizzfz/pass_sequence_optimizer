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
  %arraydecay1 = bitcast i8* %call to [1000 x double]*
  tail call fastcc void @init_array([1000 x double]* %arraydecay1)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay52 = bitcast i8* %call1 to [1000 x double]*
  %arraydecay63 = bitcast i8* %call2 to [1000 x double]*
  %arraydecay74 = bitcast i8* %call3 to [1000 x double]*
  tail call fastcc void @kernel_adi([1000 x double]* %arraydecay1, [1000 x double]* %arraydecay52, [1000 x double]* %arraydecay63, [1000 x double]* %arraydecay74)
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
  tail call fastcc void @print_array([1000 x double]* %arraydecay1)
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
  %indvars.iv10 = phi i64 [ 0, %entry ], [ %indvars.iv.next11, %for.cond1.for.inc7_crit_edge.us ]
  %0 = add nuw nsw i64 %indvars.iv10, 1000
  %1 = trunc i64 %0 to i32
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.cond1.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next.1, %for.inc.us ]
  %2 = sub nsw i64 0, %indvars.iv
  %3 = trunc i64 %2 to i32
  %sub.us = add nsw i32 %1, %3
  %conv.us = sitofp i32 %sub.us to double
  %div.us = fdiv double %conv.us, 1.000000e+03
  %arrayidx6.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv10, i64 %indvars.iv
  store double %div.us, double* %arrayidx6.us, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %4 = trunc i64 %indvars.iv to i32
  %5 = xor i32 %4, -1
  %sub.us.1 = add nsw i32 %1, %5
  %conv.us.1 = sitofp i32 %sub.us.1 to double
  %div.us.1 = fdiv double %conv.us.1, 1.000000e+03
  %arrayidx6.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv10, i64 %indvars.iv.next
  store double %div.us.1, double* %arrayidx6.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond.1, label %for.cond1.for.inc7_crit_edge.us, label %for.inc.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.inc.us
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next11, 1000
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
  %inc23836 = phi i32 [ 1, %entry ], [ %inc238, %for.inc237 ]
  br label %for.inc.lver.check

for.inc.lver.check:                               ; preds = %for.inc120, %for.cond15.preheader
  %indvar = phi i64 [ 0, %for.cond15.preheader ], [ %indvar.next, %for.inc120 ]
  %indvars.iv44 = phi i64 [ 1, %for.cond15.preheader ], [ %6, %for.inc120 ]
  %0 = add i64 %indvar, 1
  %1 = add i64 %indvar, 1
  %scevgep = getelementptr [1000 x double], [1000 x double]* %p, i64 %1, i64 0
  %scevgep2 = getelementptr [1000 x double], [1000 x double]* %p, i64 %1, i64 999
  %scevgep4 = getelementptr [1000 x double], [1000 x double]* %q, i64 %1, i64 0
  %scevgep6 = getelementptr [1000 x double], [1000 x double]* %q, i64 %1, i64 999
  %arrayidx20 = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 0, i64 %indvars.iv44
  store double 1.000000e+00, double* %arrayidx20, align 8
  %arrayidx23 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv44, i64 0
  store double 0.000000e+00, double* %arrayidx23, align 8
  %2 = bitcast double* %arrayidx20 to i64*
  %3 = load i64, i64* %2, align 8
  %arrayidx28 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv44
  %4 = bitcast [1000 x double]* %arrayidx28 to i64*
  store i64 %3, i64* %4, align 8
  %5 = add nsw i64 %indvars.iv44, -1
  %6 = add nuw nsw i64 %indvars.iv44, 1
  %bound0 = icmp ult double* %scevgep, %scevgep6
  %bound1 = icmp ult double* %scevgep4, %scevgep2
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.inc.lver.orig.preheader, label %for.inc.ph

for.inc.lver.orig.preheader:                      ; preds = %for.inc.lver.check
  br label %for.inc.lver.orig

for.inc.lver.orig:                                ; preds = %for.inc.lver.orig.preheader, %for.inc.lver.orig
  %indvars.iv.lver.orig = phi i64 [ %indvars.iv.next.lver.orig, %for.inc.lver.orig ], [ 1, %for.inc.lver.orig.preheader ]
  %7 = add nsw i64 %indvars.iv.lver.orig, -1
  %arrayidx40.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv44, i64 %7
  %8 = load double, double* %arrayidx40.lver.orig, align 8
  %mul41.lver.orig = fmul double %8, 0xC09F400000000001
  %add42.lver.orig = fadd double %mul41.lver.orig, 0x40AF420000000001
  %div43.lver.orig = fdiv double 0x409F400000000001, %add42.lver.orig
  %arrayidx47.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv44, i64 %indvars.iv.lver.orig
  store double %div43.lver.orig, double* %arrayidx47.lver.orig, align 8
  %arrayidx53.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv.lver.orig, i64 %5
  %9 = bitcast double* %arrayidx53.lver.orig to <2 x double>*
  %10 = load <2 x double>, <2 x double>* %9, align 8
  %mul61.lver.orig = fmul <2 x double> %10, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %mul61.v.r1.lver.orig = extractelement <2 x double> %mul61.lver.orig, i32 0
  %mul61.v.r2.lver.orig = extractelement <2 x double> %mul61.lver.orig, i32 1
  %add62.lver.orig = fsub double %mul61.v.r2.lver.orig, %mul61.v.r1.lver.orig
  %arrayidx67.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv.lver.orig, i64 %6
  %11 = load double, double* %arrayidx67.lver.orig, align 8
  %mul68.lver.orig = fmul double %11, 0xC08F400000000001
  %sub69.lver.orig = fsub double %add62.lver.orig, %mul68.lver.orig
  %arrayidx74.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv44, i64 %7
  %12 = load double, double* %arrayidx74.lver.orig, align 8
  %mul75.lver.orig = fmul double %12, 0xC09F400000000001
  %sub76.lver.orig = fsub double %sub69.lver.orig, %mul75.lver.orig
  %div84.lver.orig = fdiv double %sub76.lver.orig, %add42.lver.orig
  %arrayidx88.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv44, i64 %indvars.iv.lver.orig
  store double %div84.lver.orig, double* %arrayidx88.lver.orig, align 8
  %indvars.iv.next.lver.orig = add nuw nsw i64 %indvars.iv.lver.orig, 1
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
  %indvars.iv = phi i64 [ 1, %for.inc.ph ], [ %indvars.iv.next, %for.inc ]
  %mul41 = fmul double %store_forwarded, 0xC09F400000000001
  %add42 = fadd double %mul41, 0x40AF420000000001
  %div43 = fdiv double 0x409F400000000001, %add42
  %arrayidx47 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv44, i64 %indvars.iv
  store double %div43, double* %arrayidx47, align 8
  %arrayidx53 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv, i64 %5
  %13 = bitcast double* %arrayidx53 to <2 x double>*
  %14 = load <2 x double>, <2 x double>* %13, align 8
  %mul61 = fmul <2 x double> %14, <double 0xC08F400000000001, double 0xC09F3C0000000001>
  %mul61.v.r1 = extractelement <2 x double> %mul61, i32 0
  %mul61.v.r2 = extractelement <2 x double> %mul61, i32 1
  %add62 = fsub double %mul61.v.r2, %mul61.v.r1
  %arrayidx67 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv, i64 %6
  %15 = load double, double* %arrayidx67, align 8
  %mul68 = fmul double %15, 0xC08F400000000001
  %sub69 = fsub double %add62, %mul68
  %mul75 = fmul double %store_forwarded11, 0xC09F400000000001
  %sub76 = fsub double %sub69, %mul75
  %div84 = fdiv double %sub76, %add42
  %arrayidx88 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv44, i64 %indvars.iv
  store double %div84, double* %arrayidx88, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 999
  br i1 %exitcond, label %for.end.loopexit33, label %for.inc

for.end.loopexit:                                 ; preds = %for.inc.lver.orig
  br label %for.end

for.end.loopexit33:                               ; preds = %for.inc
  br label %for.end

for.end:                                          ; preds = %for.end.loopexit33, %for.end.loopexit
  %arrayidx93 = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 999, i64 %indvars.iv44
  store double 1.000000e+00, double* %arrayidx93, align 8
  br label %for.inc118

for.inc118:                                       ; preds = %for.inc118, %for.end
  %16 = phi double [ 1.000000e+00, %for.end ], [ %add113.1, %for.inc118 ]
  %indvars.iv41 = phi i64 [ 998, %for.end ], [ %indvars.iv.next42.1, %for.inc118 ]
  %arrayidx102 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv44, i64 %indvars.iv41
  %17 = load double, double* %arrayidx102, align 8
  %mul108 = fmul double %17, %16
  %arrayidx112 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv44, i64 %indvars.iv41
  %18 = load double, double* %arrayidx112, align 8
  %add113 = fadd double %mul108, %18
  %arrayidx117 = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv41, i64 %indvars.iv44
  store double %add113, double* %arrayidx117, align 8
  %indvars.iv.next42 = add nsw i64 %indvars.iv41, -1
  %arrayidx102.1 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv44, i64 %indvars.iv.next42
  %19 = load double, double* %arrayidx102.1, align 8
  %mul108.1 = fmul double %19, %add113
  %arrayidx112.1 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv44, i64 %indvars.iv.next42
  %20 = load double, double* %arrayidx112.1, align 8
  %add113.1 = fadd double %mul108.1, %20
  %arrayidx117.1 = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv.next42, i64 %indvars.iv44
  store double %add113.1, double* %arrayidx117.1, align 8
  %cmp96.1 = icmp sgt i64 %indvars.iv.next42, 1
  %indvars.iv.next42.1 = add nsw i64 %indvars.iv41, -2
  br i1 %cmp96.1, label %for.inc118, label %for.inc120

for.inc120:                                       ; preds = %for.inc118
  %exitcond60 = icmp eq i64 %6, 999
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond60, label %for.inc199.lver.check.preheader, label %for.inc.lver.check

for.inc199.lver.check.preheader:                  ; preds = %for.inc120
  br label %for.inc199.lver.check

for.inc199.lver.check:                            ; preds = %for.inc199.lver.check.preheader, %for.inc234
  %indvar12 = phi i64 [ %indvar.next13, %for.inc234 ], [ 0, %for.inc199.lver.check.preheader ]
  %indvars.iv56 = phi i64 [ %27, %for.inc234 ], [ 1, %for.inc199.lver.check.preheader ]
  %21 = add i64 %indvar12, 1
  %22 = add i64 %indvar12, 1
  %scevgep14 = getelementptr [1000 x double], [1000 x double]* %p, i64 %22, i64 0
  %scevgep16 = getelementptr [1000 x double], [1000 x double]* %p, i64 %22, i64 999
  %scevgep18 = getelementptr [1000 x double], [1000 x double]* %q, i64 %22, i64 0
  %scevgep20 = getelementptr [1000 x double], [1000 x double]* %q, i64 %22, i64 999
  %arrayidx130 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv56, i64 0
  store double 1.000000e+00, double* %arrayidx130, align 8
  %arrayidx133 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv56, i64 0
  store double 0.000000e+00, double* %arrayidx133, align 8
  %23 = bitcast double* %arrayidx130 to i64*
  %24 = load i64, i64* %23, align 8
  %arrayidx138 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv56
  %25 = bitcast [1000 x double]* %arrayidx138 to i64*
  store i64 %24, i64* %25, align 8
  %26 = add nsw i64 %indvars.iv56, -1
  %27 = add nuw nsw i64 %indvars.iv56, 1
  %bound022 = icmp ult double* %scevgep14, %scevgep20
  %bound123 = icmp ult double* %scevgep18, %scevgep16
  %memcheck.conflict25 = and i1 %bound022, %bound123
  br i1 %memcheck.conflict25, label %for.inc199.lver.orig.preheader, label %for.inc199.ph

for.inc199.lver.orig.preheader:                   ; preds = %for.inc199.lver.check
  br label %for.inc199.lver.orig

for.inc199.lver.orig:                             ; preds = %for.inc199.lver.orig.preheader, %for.inc199.lver.orig
  %indvars.iv48.lver.orig = phi i64 [ %indvars.iv.next49.lver.orig, %for.inc199.lver.orig ], [ 1, %for.inc199.lver.orig.preheader ]
  %28 = add nsw i64 %indvars.iv48.lver.orig, -1
  %arrayidx150.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv56, i64 %28
  %29 = load double, double* %arrayidx150.lver.orig, align 8
  %mul151.lver.orig = fmul double %29, 0xC08F400000000001
  %add152.lver.orig = fadd double %mul151.lver.orig, 0x409F440000000001
  %div153.lver.orig = fdiv double 0x408F400000000001, %add152.lver.orig
  %arrayidx157.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv56, i64 %indvars.iv48.lver.orig
  store double %div153.lver.orig, double* %arrayidx157.lver.orig, align 8
  %arrayidx163.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %26, i64 %indvars.iv48.lver.orig
  %30 = load double, double* %arrayidx163.lver.orig, align 8
  %31 = fmul double %30, 0xC09F400000000001
  %arrayidx170.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv56, i64 %indvars.iv48.lver.orig
  %32 = load double, double* %arrayidx170.lver.orig, align 8
  %mul171.lver.orig = fmul double %32, 0xC0AF3E0000000001
  %add172.lver.orig = fsub double %mul171.lver.orig, %31
  %arrayidx177.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %27, i64 %indvars.iv48.lver.orig
  %33 = load double, double* %arrayidx177.lver.orig, align 8
  %mul178.lver.orig = fmul double %33, 0xC09F400000000001
  %sub179.lver.orig = fsub double %add172.lver.orig, %mul178.lver.orig
  %arrayidx184.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv56, i64 %28
  %34 = load double, double* %arrayidx184.lver.orig, align 8
  %mul185.lver.orig = fmul double %34, 0xC08F400000000001
  %sub186.lver.orig = fsub double %sub179.lver.orig, %mul185.lver.orig
  %div194.lver.orig = fdiv double %sub186.lver.orig, %add152.lver.orig
  %arrayidx198.lver.orig = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv56, i64 %indvars.iv48.lver.orig
  store double %div194.lver.orig, double* %arrayidx198.lver.orig, align 8
  %indvars.iv.next49.lver.orig = add nuw nsw i64 %indvars.iv48.lver.orig, 1
  %exitcond61.lver.orig = icmp eq i64 %indvars.iv.next49.lver.orig, 999
  br i1 %exitcond61.lver.orig, label %for.end201.loopexit, label %for.inc199.lver.orig

for.inc199.ph:                                    ; preds = %for.inc199.lver.check
  %scevgep29 = getelementptr [1000 x double], [1000 x double]* %q, i64 %21, i64 0
  %scevgep26 = getelementptr [1000 x double], [1000 x double]* %p, i64 %21, i64 0
  %load_initial27 = load double, double* %scevgep26, align 8
  %load_initial30 = load double, double* %scevgep29, align 8
  br label %for.inc199

for.inc199:                                       ; preds = %for.inc199, %for.inc199.ph
  %store_forwarded31 = phi double [ %load_initial30, %for.inc199.ph ], [ %div194, %for.inc199 ]
  %store_forwarded28 = phi double [ %load_initial27, %for.inc199.ph ], [ %div153, %for.inc199 ]
  %indvars.iv48 = phi i64 [ 1, %for.inc199.ph ], [ %indvars.iv.next49, %for.inc199 ]
  %mul151 = fmul double %store_forwarded28, 0xC08F400000000001
  %add152 = fadd double %mul151, 0x409F440000000001
  %div153 = fdiv double 0x408F400000000001, %add152
  %arrayidx157 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv56, i64 %indvars.iv48
  store double %div153, double* %arrayidx157, align 8
  %arrayidx163 = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %26, i64 %indvars.iv48
  %35 = load double, double* %arrayidx163, align 8
  %36 = fmul double %35, 0xC09F400000000001
  %arrayidx170 = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %indvars.iv56, i64 %indvars.iv48
  %37 = load double, double* %arrayidx170, align 8
  %mul171 = fmul double %37, 0xC0AF3E0000000001
  %add172 = fsub double %mul171, %36
  %arrayidx177 = getelementptr inbounds [1000 x double], [1000 x double]* %v, i64 %27, i64 %indvars.iv48
  %38 = load double, double* %arrayidx177, align 8
  %mul178 = fmul double %38, 0xC09F400000000001
  %sub179 = fsub double %add172, %mul178
  %mul185 = fmul double %store_forwarded31, 0xC08F400000000001
  %sub186 = fsub double %sub179, %mul185
  %div194 = fdiv double %sub186, %add152
  %arrayidx198 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv56, i64 %indvars.iv48
  store double %div194, double* %arrayidx198, align 8
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next49, 999
  br i1 %exitcond61, label %for.end201.loopexit32, label %for.inc199

for.end201.loopexit:                              ; preds = %for.inc199.lver.orig
  br label %for.end201

for.end201.loopexit32:                            ; preds = %for.inc199
  br label %for.end201

for.end201:                                       ; preds = %for.end201.loopexit32, %for.end201.loopexit
  %arrayidx206 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv56, i64 999
  store double 1.000000e+00, double* %arrayidx206, align 8
  br label %for.inc231

for.inc231:                                       ; preds = %for.inc231, %for.end201
  %39 = phi double [ 1.000000e+00, %for.end201 ], [ %add226.1, %for.inc231 ]
  %indvars.iv53 = phi i64 [ 998, %for.end201 ], [ %indvars.iv.next54.1, %for.inc231 ]
  %arrayidx215 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv56, i64 %indvars.iv53
  %40 = load double, double* %arrayidx215, align 8
  %mul221 = fmul double %40, %39
  %arrayidx225 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv56, i64 %indvars.iv53
  %41 = load double, double* %arrayidx225, align 8
  %add226 = fadd double %mul221, %41
  %arrayidx230 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv56, i64 %indvars.iv53
  store double %add226, double* %arrayidx230, align 8
  %indvars.iv.next54 = add nsw i64 %indvars.iv53, -1
  %arrayidx215.1 = getelementptr inbounds [1000 x double], [1000 x double]* %p, i64 %indvars.iv56, i64 %indvars.iv.next54
  %42 = load double, double* %arrayidx215.1, align 8
  %mul221.1 = fmul double %42, %add226
  %arrayidx225.1 = getelementptr inbounds [1000 x double], [1000 x double]* %q, i64 %indvars.iv56, i64 %indvars.iv.next54
  %43 = load double, double* %arrayidx225.1, align 8
  %add226.1 = fadd double %mul221.1, %43
  %arrayidx230.1 = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv56, i64 %indvars.iv.next54
  store double %add226.1, double* %arrayidx230.1, align 8
  %cmp209.1 = icmp sgt i64 %indvars.iv.next54, 1
  %indvars.iv.next54.1 = add nsw i64 %indvars.iv53, -2
  br i1 %cmp209.1, label %for.inc231, label %for.inc234

for.inc234:                                       ; preds = %for.inc231
  %exitcond62 = icmp eq i64 %27, 999
  %indvar.next13 = add i64 %indvar12, 1
  br i1 %exitcond62, label %for.inc237, label %for.inc199.lver.check

for.inc237:                                       ; preds = %for.inc234
  %inc238 = add nuw nsw i32 %inc23836, 1
  %exitcond63 = icmp eq i32 %inc238, 501
  br i1 %exitcond63, label %for.end239, label %for.cond15.preheader

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
  %indvars.iv10 = phi i64 [ 0, %entry ], [ %indvars.iv.next11, %for.cond2.for.inc10_crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv10, 1000
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %for.inc.us ]
  %4 = add nuw nsw i64 %3, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.body4.us, %if.then.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1000 x double], [1000 x double]* %u, i64 %indvars.iv10, i64 %indvars.iv
  %8 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1000
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next11, 1000
  br i1 %exitcond13, label %for.end12, label %for.cond2.preheader.us

for.end12:                                        ; preds = %for.cond2.for.inc10_crit_edge.us
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
