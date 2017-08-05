; ModuleID = 'A.ll'
source_filename = "2mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"D\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 720000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 880000, i32 8) #4
  %call4 = tail call i8* @polybench_alloc_data(i64 990000, i32 8) #4
  %call6 = tail call i8* @polybench_alloc_data(i64 1080000, i32 8) #4
  %call8 = tail call i8* @polybench_alloc_data(i64 960000, i32 8) #4
  %arraydecay = bitcast i8* %call2 to [1100 x double]*
  %arraydecay9 = bitcast i8* %call4 to [900 x double]*
  %arraydecay10 = bitcast i8* %call6 to [1200 x double]*
  %arraydecay11 = bitcast i8* %call8 to [1200 x double]*
  call fastcc void @init_array(i32 800, i32 900, i32 1100, i32 1200, double* nonnull %alpha, double* nonnull %beta, [1100 x double]* %arraydecay, [900 x double]* %arraydecay9, [1200 x double]* %arraydecay10, [1200 x double]* %arraydecay11)
  tail call void (...) @polybench_timer_start() #4
  %0 = load double, double* %alpha, align 8
  %1 = load double, double* %beta, align 8
  %arraydecay12 = bitcast i8* %call to [900 x double]*
  tail call fastcc void @kernel_2mm(i32 800, i32 900, i32 1100, i32 1200, double %0, double %1, [900 x double]* %arraydecay12, [1100 x double]* %arraydecay, [900 x double]* %arraydecay9, [1200 x double]* %arraydecay10, [1200 x double]* %arraydecay11)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %2 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %2, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %3 = bitcast i8* %call8 to [1200 x double]*
  tail call fastcc void @print_array(i32 800, i32 1200, [1200 x double]* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call4) #4
  tail call void @free(i8* %call6) #4
  tail call void @free(i8* %call8) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %ni, i32 %nj, i32 %nk, i32 %nl, double* nocapture %alpha, double* nocapture %beta, [1100 x double]* nocapture %A, [900 x double]* nocapture %B, [1200 x double]* nocapture %C, [1200 x double]* nocapture %D) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  %cmp18 = icmp sgt i32 %ni, 0
  br i1 %cmp18, label %for.cond1.preheader.lr.ph, label %for.cond10.preheader

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp216 = icmp sgt i32 %nk, 0
  %conv4 = sitofp i32 %ni to double
  br i1 %cmp216, label %for.cond1.preheader.us.preheader, label %for.cond34.preheader

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %0 = add i32 %nk, -1
  %1 = sext i32 %ni to i64
  %wide.trip.count52 = zext i32 %0 to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc7_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv54 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next55, %for.cond1.for.inc7_crit_edge.us ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %for.body3.us ], [ 0, %for.cond1.preheader.us ]
  %2 = mul nsw i64 %indvars.iv48, %indvars.iv54
  %3 = add nsw i64 %2, 1
  %4 = trunc i64 %3 to i32
  %rem.us = srem i32 %4, %ni
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %arrayidx6.us = getelementptr inbounds [1100 x double], [1100 x double]* %A, i64 %indvars.iv54, i64 %indvars.iv48
  store double %div.us, double* %arrayidx6.us, align 8
  %exitcond53 = icmp eq i64 %indvars.iv48, %wide.trip.count52
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  br i1 %exitcond53, label %for.cond1.for.inc7_crit_edge.us, label %for.body3.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.body3.us
  %indvars.iv.next55 = add nuw i64 %indvars.iv54, 1
  %cmp.us = icmp slt i64 %indvars.iv.next55, %1
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.cond10.preheader.loopexit

for.cond10.preheader.loopexit:                    ; preds = %for.cond1.for.inc7_crit_edge.us
  br label %for.cond10.preheader

for.cond10.preheader:                             ; preds = %for.cond10.preheader.loopexit, %entry
  %cmp1113 = icmp sgt i32 %nk, 0
  br i1 %cmp1113, label %for.cond14.preheader.lr.ph, label %for.cond34.preheader

for.cond14.preheader.lr.ph:                       ; preds = %for.cond10.preheader
  %cmp1511 = icmp sgt i32 %nj, 0
  %conv22 = sitofp i32 %nj to double
  br i1 %cmp1511, label %for.cond14.preheader.us.preheader, label %for.cond59.preheader

for.cond14.preheader.us.preheader:                ; preds = %for.cond14.preheader.lr.ph
  %5 = add i32 %nj, -1
  %6 = sext i32 %nk to i64
  %wide.trip.count43 = zext i32 %5 to i64
  %7 = and i64 %wide.trip.count43, 1
  %lcmp.mod = icmp eq i64 %7, 0
  %8 = icmp eq i32 %5, 0
  br label %for.cond14.preheader.us

for.cond14.preheader.us:                          ; preds = %for.cond14.for.inc31_crit_edge.us, %for.cond14.preheader.us.preheader
  %indvars.iv45 = phi i64 [ 0, %for.cond14.preheader.us.preheader ], [ %indvars.iv.next46, %for.cond14.for.inc31_crit_edge.us ]
  br i1 %lcmp.mod, label %for.body17.us.prol, label %for.body17.us.prol.loopexit

for.body17.us.prol:                               ; preds = %for.cond14.preheader.us
  %9 = trunc i64 %indvars.iv45 to i32
  %rem20.us.prol = srem i32 %9, %nj
  %conv21.us.prol = sitofp i32 %rem20.us.prol to double
  %div23.us.prol = fdiv double %conv21.us.prol, %conv22
  %arrayidx27.us.prol = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv45, i64 0
  store double %div23.us.prol, double* %arrayidx27.us.prol, align 8
  br label %for.body17.us.prol.loopexit

for.body17.us.prol.loopexit:                      ; preds = %for.body17.us.prol, %for.cond14.preheader.us
  %indvars.iv40.unr.ph = phi i64 [ 1, %for.body17.us.prol ], [ 0, %for.cond14.preheader.us ]
  br i1 %8, label %for.cond14.for.inc31_crit_edge.us, label %for.cond14.preheader.us.new

for.cond14.preheader.us.new:                      ; preds = %for.body17.us.prol.loopexit
  br label %for.body17.us

for.body17.us:                                    ; preds = %for.body17.us, %for.cond14.preheader.us.new
  %indvars.iv40 = phi i64 [ %indvars.iv40.unr.ph, %for.cond14.preheader.us.new ], [ %indvars.iv.next41.1, %for.body17.us ]
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %10 = mul nsw i64 %indvars.iv.next41, %indvars.iv45
  %11 = trunc i64 %10 to i32
  %rem20.us = srem i32 %11, %nj
  %conv21.us = sitofp i32 %rem20.us to double
  %div23.us = fdiv double %conv21.us, %conv22
  %arrayidx27.us = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv45, i64 %indvars.iv40
  store double %div23.us, double* %arrayidx27.us, align 8
  %indvars.iv.next41.1 = add nsw i64 %indvars.iv40, 2
  %12 = mul nsw i64 %indvars.iv.next41.1, %indvars.iv45
  %13 = trunc i64 %12 to i32
  %rem20.us.1 = srem i32 %13, %nj
  %conv21.us.1 = sitofp i32 %rem20.us.1 to double
  %div23.us.1 = fdiv double %conv21.us.1, %conv22
  %arrayidx27.us.1 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv45, i64 %indvars.iv.next41
  store double %div23.us.1, double* %arrayidx27.us.1, align 8
  %exitcond44.1 = icmp eq i64 %indvars.iv.next41, %wide.trip.count43
  br i1 %exitcond44.1, label %for.cond14.for.inc31_crit_edge.us.loopexit, label %for.body17.us

for.cond14.for.inc31_crit_edge.us.loopexit:       ; preds = %for.body17.us
  br label %for.cond14.for.inc31_crit_edge.us

for.cond14.for.inc31_crit_edge.us:                ; preds = %for.cond14.for.inc31_crit_edge.us.loopexit, %for.body17.us.prol.loopexit
  %indvars.iv.next46 = add nuw i64 %indvars.iv45, 1
  %cmp11.us = icmp slt i64 %indvars.iv.next46, %6
  br i1 %cmp11.us, label %for.cond14.preheader.us, label %for.cond34.preheader.loopexit

for.cond34.preheader.loopexit:                    ; preds = %for.cond14.for.inc31_crit_edge.us
  br label %for.cond34.preheader

for.cond34.preheader:                             ; preds = %for.cond34.preheader.loopexit, %for.cond1.preheader.lr.ph, %for.cond10.preheader
  %cmp358 = icmp sgt i32 %nj, 0
  br i1 %cmp358, label %for.cond38.preheader.lr.ph, label %for.cond59.preheader

for.cond38.preheader.lr.ph:                       ; preds = %for.cond34.preheader
  %cmp396 = icmp sgt i32 %nl, 0
  %conv47 = sitofp i32 %nl to double
  br i1 %cmp396, label %for.cond38.preheader.us.preheader, label %for.cond59.preheader

for.cond38.preheader.us.preheader:                ; preds = %for.cond38.preheader.lr.ph
  %14 = add i32 %nl, -1
  %15 = sext i32 %nj to i64
  %wide.trip.count35 = zext i32 %14 to i64
  br label %for.cond38.preheader.us

for.cond38.preheader.us:                          ; preds = %for.cond38.for.inc56_crit_edge.us, %for.cond38.preheader.us.preheader
  %indvars.iv37 = phi i64 [ 0, %for.cond38.preheader.us.preheader ], [ %indvars.iv.next38, %for.cond38.for.inc56_crit_edge.us ]
  br label %for.body41.us

for.body41.us:                                    ; preds = %for.body41.us, %for.cond38.preheader.us
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %for.body41.us ], [ 0, %for.cond38.preheader.us ]
  %16 = add nuw nsw i64 %indvars.iv30, 3
  %17 = mul nsw i64 %16, %indvars.iv37
  %18 = add nsw i64 %17, 1
  %19 = trunc i64 %18 to i32
  %rem45.us = srem i32 %19, %nl
  %conv46.us = sitofp i32 %rem45.us to double
  %div48.us = fdiv double %conv46.us, %conv47
  %arrayidx52.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv37, i64 %indvars.iv30
  store double %div48.us, double* %arrayidx52.us, align 8
  %exitcond36 = icmp eq i64 %indvars.iv30, %wide.trip.count35
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  br i1 %exitcond36, label %for.cond38.for.inc56_crit_edge.us, label %for.body41.us

for.cond38.for.inc56_crit_edge.us:                ; preds = %for.body41.us
  %indvars.iv.next38 = add nuw i64 %indvars.iv37, 1
  %cmp35.us = icmp slt i64 %indvars.iv.next38, %15
  br i1 %cmp35.us, label %for.cond38.preheader.us, label %for.cond59.preheader.loopexit

for.cond59.preheader.loopexit:                    ; preds = %for.cond38.for.inc56_crit_edge.us
  br label %for.cond59.preheader

for.cond59.preheader:                             ; preds = %for.cond59.preheader.loopexit, %for.cond14.preheader.lr.ph, %for.cond38.preheader.lr.ph, %for.cond34.preheader
  %20 = icmp sgt i32 %ni, 0
  br i1 %20, label %for.cond63.preheader.lr.ph, label %for.end82

for.cond63.preheader.lr.ph:                       ; preds = %for.cond59.preheader
  %cmp641 = icmp sgt i32 %nl, 0
  %conv71 = sitofp i32 %nk to double
  br i1 %cmp641, label %for.cond63.preheader.us.preheader, label %for.end82

for.cond63.preheader.us.preheader:                ; preds = %for.cond63.preheader.lr.ph
  %21 = add i32 %nl, -1
  %22 = sext i32 %ni to i64
  %wide.trip.count = zext i32 %21 to i64
  br label %for.cond63.preheader.us

for.cond63.preheader.us:                          ; preds = %for.cond63.for.inc80_crit_edge.us, %for.cond63.preheader.us.preheader
  %indvars.iv27 = phi i64 [ 0, %for.cond63.preheader.us.preheader ], [ %indvars.iv.next28, %for.cond63.for.inc80_crit_edge.us ]
  br label %for.body66.us

for.body66.us:                                    ; preds = %for.body66.us, %for.cond63.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body66.us ], [ 0, %for.cond63.preheader.us ]
  %23 = add nuw nsw i64 %indvars.iv, 2
  %24 = mul nsw i64 %23, %indvars.iv27
  %25 = trunc i64 %24 to i32
  %rem69.us = srem i32 %25, %nk
  %conv70.us = sitofp i32 %rem69.us to double
  %div72.us = fdiv double %conv70.us, %conv71
  %arrayidx76.us = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv27, i64 %indvars.iv
  store double %div72.us, double* %arrayidx76.us, align 8
  %exitcond = icmp eq i64 %indvars.iv, %wide.trip.count
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %for.cond63.for.inc80_crit_edge.us, label %for.body66.us

for.cond63.for.inc80_crit_edge.us:                ; preds = %for.body66.us
  %indvars.iv.next28 = add nuw i64 %indvars.iv27, 1
  %cmp60.us = icmp slt i64 %indvars.iv.next28, %22
  br i1 %cmp60.us, label %for.cond63.preheader.us, label %for.end82.loopexit

for.end82.loopexit:                               ; preds = %for.cond63.for.inc80_crit_edge.us
  br label %for.end82

for.end82:                                        ; preds = %for.end82.loopexit, %for.cond63.preheader.lr.ph, %for.cond59.preheader
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_2mm(i32 %ni, i32 %nj, i32 %nk, i32 %nl, double %alpha, double %beta, [900 x double]* nocapture %tmp, [1100 x double]* nocapture readonly %A, [900 x double]* nocapture readonly %B, [1200 x double]* nocapture readonly %C, [1200 x double]* nocapture %D) unnamed_addr #2 {
entry:
  %cmp11 = icmp sgt i32 %ni, 0
  br i1 %cmp11, label %for.cond4.preheader.lr.ph, label %for.end67

for.cond4.preheader.lr.ph:                        ; preds = %entry
  %cmp59 = icmp sgt i32 %nj, 0
  br i1 %cmp59, label %for.cond4.preheader.us.preheader, label %for.cond34.preheader.lr.ph

for.cond4.preheader.us.preheader:                 ; preds = %for.cond4.preheader.lr.ph
  %0 = add i32 %nj, -1
  %1 = zext i32 %0 to i64
  %2 = shl nuw nsw i64 %1, 3
  %3 = add nuw nsw i64 %2, 8
  %4 = add i32 %nk, -1
  %5 = sext i32 %nj to i64
  %6 = sext i32 %ni to i64
  %wide.trip.count75 = zext i32 %4 to i64
  %7 = icmp sgt i32 %nk, 0
  %8 = and i64 %wide.trip.count75, 1
  %lcmp.mod101 = icmp eq i64 %8, 0
  %9 = icmp eq i32 %4, 0
  br label %for.cond4.preheader.us

for.cond4.preheader.us:                           ; preds = %for.cond4.for.inc28_crit_edge.us, %for.cond4.preheader.us.preheader
  %indvars.iv79 = phi i64 [ 0, %for.cond4.preheader.us.preheader ], [ %indvars.iv.next80, %for.cond4.for.inc28_crit_edge.us ]
  br i1 %7, label %for.body6.us.us.preheader, label %for.cond4.for.inc28_crit_edge.us.loopexit57

for.body6.us.us.preheader:                        ; preds = %for.cond4.preheader.us
  %arrayidx15.us.us.prol = getelementptr inbounds [1100 x double], [1100 x double]* %A, i64 %indvars.iv79, i64 0
  br label %for.body6.us.us

for.cond4.for.inc28_crit_edge.us.loopexit57:      ; preds = %for.cond4.preheader.us
  %scevgep = getelementptr [900 x double], [900 x double]* %tmp, i64 %indvars.iv79, i64 0
  %scevgep72 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep72, i8 0, i64 %3, i32 8, i1 false)
  br label %for.cond4.for.inc28_crit_edge.us

for.cond4.for.inc28_crit_edge.us.loopexit:        ; preds = %for.cond9.for.inc25_crit_edge.us.us
  br label %for.cond4.for.inc28_crit_edge.us

for.cond4.for.inc28_crit_edge.us:                 ; preds = %for.cond4.for.inc28_crit_edge.us.loopexit, %for.cond4.for.inc28_crit_edge.us.loopexit57
  %indvars.iv.next80 = add nuw i64 %indvars.iv79, 1
  %cmp.us = icmp slt i64 %indvars.iv.next80, %6
  br i1 %cmp.us, label %for.cond4.preheader.us, label %for.cond31.preheader

for.body6.us.us:                                  ; preds = %for.body6.us.us.preheader, %for.cond9.for.inc25_crit_edge.us.us
  %indvars.iv77 = phi i64 [ %indvars.iv.next78, %for.cond9.for.inc25_crit_edge.us.us ], [ 0, %for.body6.us.us.preheader ]
  %arrayidx8.us.us = getelementptr inbounds [900 x double], [900 x double]* %tmp, i64 %indvars.iv79, i64 %indvars.iv77
  store double 0.000000e+00, double* %arrayidx8.us.us, align 8
  br i1 %lcmp.mod101, label %for.body11.us.us.prol, label %for.body11.us.us.prol.loopexit

for.body11.us.us.prol:                            ; preds = %for.body6.us.us
  %10 = load double, double* %arrayidx15.us.us.prol, align 8
  %mul.us.us.prol = fmul double %10, %alpha
  %arrayidx19.us.us.prol = getelementptr inbounds [900 x double], [900 x double]* %B, i64 0, i64 %indvars.iv77
  %11 = load double, double* %arrayidx19.us.us.prol, align 8
  %mul20.us.us.prol = fmul double %mul.us.us.prol, %11
  %add.us.us.prol = fadd double %mul20.us.us.prol, 0.000000e+00
  store double %add.us.us.prol, double* %arrayidx8.us.us, align 8
  br label %for.body11.us.us.prol.loopexit

for.body11.us.us.prol.loopexit:                   ; preds = %for.body11.us.us.prol, %for.body6.us.us
  %.unr102.ph = phi double [ %add.us.us.prol, %for.body11.us.us.prol ], [ 0.000000e+00, %for.body6.us.us ]
  %indvars.iv73.unr.ph = phi i64 [ 1, %for.body11.us.us.prol ], [ 0, %for.body6.us.us ]
  br i1 %9, label %for.cond9.for.inc25_crit_edge.us.us, label %for.body6.us.us.new

for.body6.us.us.new:                              ; preds = %for.body11.us.us.prol.loopexit
  br label %for.body11.us.us

for.cond9.for.inc25_crit_edge.us.us.loopexit:     ; preds = %for.body11.us.us
  br label %for.cond9.for.inc25_crit_edge.us.us

for.cond9.for.inc25_crit_edge.us.us:              ; preds = %for.cond9.for.inc25_crit_edge.us.us.loopexit, %for.body11.us.us.prol.loopexit
  %indvars.iv.next78 = add nuw i64 %indvars.iv77, 1
  %cmp5.us.us = icmp slt i64 %indvars.iv.next78, %5
  br i1 %cmp5.us.us, label %for.body6.us.us, label %for.cond4.for.inc28_crit_edge.us.loopexit

for.body11.us.us:                                 ; preds = %for.body11.us.us, %for.body6.us.us.new
  %12 = phi double [ %.unr102.ph, %for.body6.us.us.new ], [ %add.us.us.1, %for.body11.us.us ]
  %indvars.iv73 = phi i64 [ %indvars.iv73.unr.ph, %for.body6.us.us.new ], [ %indvars.iv.next74.1, %for.body11.us.us ]
  %arrayidx15.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %A, i64 %indvars.iv79, i64 %indvars.iv73
  %13 = load double, double* %arrayidx15.us.us, align 8
  %mul.us.us = fmul double %13, %alpha
  %arrayidx19.us.us = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv73, i64 %indvars.iv77
  %14 = load double, double* %arrayidx19.us.us, align 8
  %mul20.us.us = fmul double %mul.us.us, %14
  %add.us.us = fadd double %12, %mul20.us.us
  store double %add.us.us, double* %arrayidx8.us.us, align 8
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %arrayidx15.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %A, i64 %indvars.iv79, i64 %indvars.iv.next74
  %15 = load double, double* %arrayidx15.us.us.1, align 8
  %mul.us.us.1 = fmul double %15, %alpha
  %arrayidx19.us.us.1 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv.next74, i64 %indvars.iv77
  %16 = load double, double* %arrayidx19.us.us.1, align 8
  %mul20.us.us.1 = fmul double %mul.us.us.1, %16
  %add.us.us.1 = fadd double %add.us.us, %mul20.us.us.1
  store double %add.us.us.1, double* %arrayidx8.us.us, align 8
  %exitcond76.1 = icmp eq i64 %indvars.iv.next74, %wide.trip.count75
  %indvars.iv.next74.1 = add nsw i64 %indvars.iv73, 2
  br i1 %exitcond76.1, label %for.cond9.for.inc25_crit_edge.us.us.loopexit, label %for.body11.us.us

for.cond31.preheader:                             ; preds = %for.cond4.for.inc28_crit_edge.us
  %cmp353 = icmp sgt i32 %nl, 0
  br i1 %cmp353, label %for.cond34.preheader.us.preheader, label %for.end67

for.cond34.preheader.lr.ph:                       ; preds = %for.cond4.preheader.lr.ph
  %cmp353.old = icmp sgt i32 %nl, 0
  br i1 %cmp353.old, label %for.cond34.preheader.lr.ph.for.cond34.preheader.us.preheader_crit_edge, label %for.end67

for.cond34.preheader.lr.ph.for.cond34.preheader.us.preheader_crit_edge: ; preds = %for.cond34.preheader.lr.ph
  %.pre = add i32 %nj, -1
  %.pre88 = sext i32 %ni to i64
  %.pre90 = zext i32 %.pre to i64
  br label %for.cond34.preheader.us.preheader

for.cond34.preheader.us.preheader:                ; preds = %for.cond34.preheader.lr.ph.for.cond34.preheader.us.preheader_crit_edge, %for.cond31.preheader
  %wide.trip.count61.pre-phi = phi i64 [ %.pre90, %for.cond34.preheader.lr.ph.for.cond34.preheader.us.preheader_crit_edge ], [ %1, %for.cond31.preheader ]
  %.pre-phi89 = phi i64 [ %.pre88, %for.cond34.preheader.lr.ph.for.cond34.preheader.us.preheader_crit_edge ], [ %6, %for.cond31.preheader ]
  %17 = add i32 %nl, -1
  %18 = sext i32 %nl to i64
  %wide.trip.count = zext i32 %17 to i64
  %19 = add nuw nsw i64 %wide.trip.count, 1
  %20 = and i64 %19, 8589934588
  %21 = add nsw i64 %20, -4
  %22 = lshr exact i64 %21, 2
  %23 = icmp sgt i32 %nj, 0
  %24 = and i64 %wide.trip.count61.pre-phi, 1
  %lcmp.mod99 = icmp eq i64 %24, 0
  %25 = icmp eq i64 %wide.trip.count61.pre-phi, 0
  %min.iters.check = icmp ult i64 %19, 4
  %n.vec = and i64 %19, 8589934588
  %cmp.zero = icmp eq i64 %n.vec, 0
  %broadcast.splatinsert94 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat95 = shufflevector <2 x double> %broadcast.splatinsert94, <2 x double> undef, <2 x i32> zeroinitializer
  %26 = and i64 %22, 1
  %lcmp.mod = icmp eq i64 %26, 0
  %27 = icmp eq i64 %22, 0
  %cmp.n = icmp eq i64 %19, %n.vec
  br label %for.cond34.preheader.us

for.cond34.preheader.us:                          ; preds = %for.cond34.for.inc65_crit_edge.us, %for.cond34.preheader.us.preheader
  %indvars.iv65 = phi i64 [ 0, %for.cond34.preheader.us.preheader ], [ %indvars.iv.next66, %for.cond34.for.inc65_crit_edge.us ]
  br i1 %23, label %for.body36.us.us.preheader, label %for.body36.us13.preheader

for.body36.us.us.preheader:                       ; preds = %for.cond34.preheader.us
  %arrayidx48.us.us.prol = getelementptr inbounds [900 x double], [900 x double]* %tmp, i64 %indvars.iv65, i64 0
  br label %for.body36.us.us

for.body36.us13.preheader:                        ; preds = %for.cond34.preheader.us
  br i1 %min.iters.check, label %for.body36.us13.preheader96, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body36.us13.preheader
  br i1 %cmp.zero, label %for.body36.us13.preheader96, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br i1 %lcmp.mod, label %vector.body.prol, label %vector.body.prol.loopexit

vector.body.prol:                                 ; preds = %vector.ph
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv65, i64 0
  %29 = bitcast double* %28 to <2 x double>*
  %wide.load.prol = load <2 x double>, <2 x double>* %29, align 8
  %30 = getelementptr [1200 x double], [1200 x double]* %D, i64 %indvars.iv65, i64 2
  %31 = bitcast double* %30 to <2 x double>*
  %wide.load93.prol = load <2 x double>, <2 x double>* %31, align 8
  %32 = fmul <2 x double> %wide.load.prol, %broadcast.splat95
  %33 = fmul <2 x double> %wide.load93.prol, %broadcast.splat95
  %34 = bitcast double* %28 to <2 x double>*
  store <2 x double> %32, <2 x double>* %34, align 8
  %35 = bitcast double* %30 to <2 x double>*
  store <2 x double> %33, <2 x double>* %35, align 8
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol, %vector.ph
  %index.unr.ph = phi i64 [ 4, %vector.body.prol ], [ 0, %vector.ph ]
  br i1 %27, label %middle.block, label %vector.ph.new

vector.ph.new:                                    ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph.new
  %index = phi i64 [ %index.unr.ph, %vector.ph.new ], [ %index.next.1, %vector.body ]
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv65, i64 %index
  %37 = bitcast double* %36 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %37, align 8
  %38 = getelementptr double, double* %36, i64 2
  %39 = bitcast double* %38 to <2 x double>*
  %wide.load93 = load <2 x double>, <2 x double>* %39, align 8
  %40 = fmul <2 x double> %wide.load, %broadcast.splat95
  %41 = fmul <2 x double> %wide.load93, %broadcast.splat95
  %42 = bitcast double* %36 to <2 x double>*
  store <2 x double> %40, <2 x double>* %42, align 8
  %43 = bitcast double* %38 to <2 x double>*
  store <2 x double> %41, <2 x double>* %43, align 8
  %index.next = add i64 %index, 4
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv65, i64 %index.next
  %45 = bitcast double* %44 to <2 x double>*
  %wide.load.1 = load <2 x double>, <2 x double>* %45, align 8
  %46 = getelementptr double, double* %44, i64 2
  %47 = bitcast double* %46 to <2 x double>*
  %wide.load93.1 = load <2 x double>, <2 x double>* %47, align 8
  %48 = fmul <2 x double> %wide.load.1, %broadcast.splat95
  %49 = fmul <2 x double> %wide.load93.1, %broadcast.splat95
  %50 = bitcast double* %44 to <2 x double>*
  store <2 x double> %48, <2 x double>* %50, align 8
  %51 = bitcast double* %46 to <2 x double>*
  store <2 x double> %49, <2 x double>* %51, align 8
  %index.next.1 = add i64 %index, 8
  %52 = icmp eq i64 %index.next.1, %n.vec
  br i1 %52, label %middle.block.loopexit, label %vector.body, !llvm.loop !1

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.body.prol.loopexit
  br i1 %cmp.n, label %for.cond34.for.inc65_crit_edge.us, label %for.body36.us13.preheader96

for.body36.us13.preheader96:                      ; preds = %middle.block, %min.iters.checked, %for.body36.us13.preheader
  %indvars.iv.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %for.body36.us13.preheader ], [ %n.vec, %middle.block ]
  br label %for.body36.us13

for.body36.us13:                                  ; preds = %for.body36.us13.preheader96, %for.body36.us13
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body36.us13 ], [ %indvars.iv.ph, %for.body36.us13.preheader96 ]
  %arrayidx40.us16 = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv65, i64 %indvars.iv
  %53 = load double, double* %arrayidx40.us16, align 8
  %mul41.us17 = fmul double %53, %beta
  store double %mul41.us17, double* %arrayidx40.us16, align 8
  %exitcond = icmp eq i64 %indvars.iv, %wide.trip.count
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %for.cond34.for.inc65_crit_edge.us.loopexit103, label %for.body36.us13, !llvm.loop !4

for.cond34.for.inc65_crit_edge.us.loopexit:       ; preds = %for.cond42.for.inc62_crit_edge.us.us
  br label %for.cond34.for.inc65_crit_edge.us

for.cond34.for.inc65_crit_edge.us.loopexit103:    ; preds = %for.body36.us13
  br label %for.cond34.for.inc65_crit_edge.us

for.cond34.for.inc65_crit_edge.us:                ; preds = %for.cond34.for.inc65_crit_edge.us.loopexit103, %for.cond34.for.inc65_crit_edge.us.loopexit, %middle.block
  %indvars.iv.next66 = add nuw i64 %indvars.iv65, 1
  %cmp32.us = icmp slt i64 %indvars.iv.next66, %.pre-phi89
  br i1 %cmp32.us, label %for.cond34.preheader.us, label %for.end67.loopexit

for.body36.us.us:                                 ; preds = %for.body36.us.us.preheader, %for.cond42.for.inc62_crit_edge.us.us
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %for.cond42.for.inc62_crit_edge.us.us ], [ 0, %for.body36.us.us.preheader ]
  %arrayidx40.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv65, i64 %indvars.iv63
  %54 = load double, double* %arrayidx40.us.us, align 8
  %mul41.us.us = fmul double %54, %beta
  store double %mul41.us.us, double* %arrayidx40.us.us, align 8
  br i1 %lcmp.mod99, label %for.body44.us.us.prol, label %for.body44.us.us.prol.loopexit

for.body44.us.us.prol:                            ; preds = %for.body36.us.us
  %55 = load double, double* %arrayidx48.us.us.prol, align 8
  %arrayidx52.us.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 0, i64 %indvars.iv63
  %56 = load double, double* %arrayidx52.us.us.prol, align 8
  %mul53.us.us.prol = fmul double %55, %56
  %add58.us.us.prol = fadd double %mul41.us.us, %mul53.us.us.prol
  store double %add58.us.us.prol, double* %arrayidx40.us.us, align 8
  br label %for.body44.us.us.prol.loopexit

for.body44.us.us.prol.loopexit:                   ; preds = %for.body44.us.us.prol, %for.body36.us.us
  %.unr.ph = phi double [ %add58.us.us.prol, %for.body44.us.us.prol ], [ %mul41.us.us, %for.body36.us.us ]
  %indvars.iv59.unr.ph = phi i64 [ 1, %for.body44.us.us.prol ], [ 0, %for.body36.us.us ]
  br i1 %25, label %for.cond42.for.inc62_crit_edge.us.us, label %for.body36.us.us.new

for.body36.us.us.new:                             ; preds = %for.body44.us.us.prol.loopexit
  br label %for.body44.us.us

for.cond42.for.inc62_crit_edge.us.us.loopexit:    ; preds = %for.body44.us.us
  br label %for.cond42.for.inc62_crit_edge.us.us

for.cond42.for.inc62_crit_edge.us.us:             ; preds = %for.cond42.for.inc62_crit_edge.us.us.loopexit, %for.body44.us.us.prol.loopexit
  %indvars.iv.next64 = add nuw i64 %indvars.iv63, 1
  %cmp35.us.us = icmp slt i64 %indvars.iv.next64, %18
  br i1 %cmp35.us.us, label %for.body36.us.us, label %for.cond34.for.inc65_crit_edge.us.loopexit

for.body44.us.us:                                 ; preds = %for.body44.us.us, %for.body36.us.us.new
  %57 = phi double [ %.unr.ph, %for.body36.us.us.new ], [ %add58.us.us.1, %for.body44.us.us ]
  %indvars.iv59 = phi i64 [ %indvars.iv59.unr.ph, %for.body36.us.us.new ], [ %indvars.iv.next60.1, %for.body44.us.us ]
  %arrayidx48.us.us = getelementptr inbounds [900 x double], [900 x double]* %tmp, i64 %indvars.iv65, i64 %indvars.iv59
  %58 = load double, double* %arrayidx48.us.us, align 8
  %arrayidx52.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv59, i64 %indvars.iv63
  %59 = load double, double* %arrayidx52.us.us, align 8
  %mul53.us.us = fmul double %58, %59
  %add58.us.us = fadd double %57, %mul53.us.us
  store double %add58.us.us, double* %arrayidx40.us.us, align 8
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %arrayidx48.us.us.1 = getelementptr inbounds [900 x double], [900 x double]* %tmp, i64 %indvars.iv65, i64 %indvars.iv.next60
  %60 = load double, double* %arrayidx48.us.us.1, align 8
  %arrayidx52.us.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv.next60, i64 %indvars.iv63
  %61 = load double, double* %arrayidx52.us.us.1, align 8
  %mul53.us.us.1 = fmul double %60, %61
  %add58.us.us.1 = fadd double %add58.us.us, %mul53.us.us.1
  store double %add58.us.us.1, double* %arrayidx40.us.us, align 8
  %exitcond62.1 = icmp eq i64 %indvars.iv.next60, %wide.trip.count61.pre-phi
  %indvars.iv.next60.1 = add nsw i64 %indvars.iv59, 2
  br i1 %exitcond62.1, label %for.cond42.for.inc62_crit_edge.us.us.loopexit, label %for.body44.us.us

for.end67.loopexit:                               ; preds = %for.cond34.for.inc65_crit_edge.us
  br label %for.end67

for.end67:                                        ; preds = %for.end67.loopexit, %entry, %for.cond34.preheader.lr.ph, %for.cond31.preheader
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %ni, i32 %nl, [1200 x double]* nocapture readonly %D) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp4 = icmp sgt i32 %ni, 0
  %cmp31 = icmp sgt i32 %nl, 0
  %or.cond = and i1 %cmp4, %cmp31
  br i1 %or.cond, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %nl to i64
  %4 = sext i32 %ni to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv8 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next9, %for.cond2.for.inc10_crit_edge.us ]
  %5 = mul nsw i64 %indvars.iv8, %4
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %6 = add nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %rem.us = srem i32 %7, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #6
  br label %if.end.us

if.end.us:                                        ; preds = %for.body4.us, %if.then.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv8, i64 %indvars.iv
  %10 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #6
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %cmp3.us = icmp slt i64 %indvars.iv.next, %3
  br i1 %cmp3.us, label %for.body4.us, label %for.cond2.for.inc10_crit_edge.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next9 = add nuw i64 %indvars.iv8, 1
  %cmp.us = icmp slt i64 %indvars.iv.next9, %4
  br i1 %cmp.us, label %for.cond2.preheader.us, label %for.end12.loopexit

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %12) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = distinct !{!4, !5, !2, !3}
!5 = !{!"llvm.loop.unroll.runtime.disable"}
