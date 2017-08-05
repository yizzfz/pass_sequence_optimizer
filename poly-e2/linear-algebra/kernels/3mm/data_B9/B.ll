; ModuleID = 'A.ll'
source_filename = "3mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"G\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 720000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 800000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 900000, i32 8) #4
  %call3 = tail call i8* @polybench_alloc_data(i64 990000, i32 8) #4
  %call4 = tail call i8* @polybench_alloc_data(i64 1080000, i32 8) #4
  %call5 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %call6 = tail call i8* @polybench_alloc_data(i64 880000, i32 8) #4
  %arraydecay = bitcast i8* %call1 to [1000 x double]*
  %arraydecay7 = bitcast i8* %call2 to [900 x double]*
  %arraydecay8 = bitcast i8* %call4 to [1200 x double]*
  %arraydecay9 = bitcast i8* %call5 to [1100 x double]*
  tail call fastcc void @init_array(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [1000 x double]* %arraydecay, [900 x double]* %arraydecay7, [1200 x double]* %arraydecay8, [1100 x double]* %arraydecay9)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay10 = bitcast i8* %call to [900 x double]*
  %arraydecay13 = bitcast i8* %call3 to [1100 x double]*
  %arraydecay16 = bitcast i8* %call6 to [1100 x double]*
  tail call fastcc void @kernel_3mm(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [900 x double]* %arraydecay10, [1000 x double]* %arraydecay, [900 x double]* %arraydecay7, [1100 x double]* %arraydecay13, [1200 x double]* %arraydecay8, [1100 x double]* %arraydecay9, [1100 x double]* %arraydecay16)
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
  %1 = bitcast i8* %call6 to [1100 x double]*
  tail call fastcc void @print_array(i32 800, i32 1100, [1100 x double]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  tail call void @free(i8* %call3) #4
  tail call void @free(i8* %call4) #4
  tail call void @free(i8* %call5) #4
  tail call void @free(i8* %call6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %ni, i32 %nj, i32 %nk, i32 %nl, i32 %nm, [1000 x double]* nocapture %A, [900 x double]* nocapture %B, [1200 x double]* nocapture %C, [1100 x double]* nocapture %D) unnamed_addr #2 {
entry:
  %cmp18 = icmp sgt i32 %ni, 0
  br i1 %cmp18, label %for.cond1.preheader.lr.ph, label %for.cond11.preheader

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp216 = icmp sgt i32 %nk, 0
  %mul4 = mul nsw i32 %ni, 5
  %conv5 = sitofp i32 %mul4 to double
  br i1 %cmp216, label %for.cond1.preheader.us.preheader, label %for.cond37.preheader

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %0 = add i32 %nk, -1
  %1 = sext i32 %ni to i64
  %wide.trip.count53 = zext i32 %0 to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc8_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv55 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next56, %for.cond1.for.inc8_crit_edge.us ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %for.body3.us ], [ 0, %for.cond1.preheader.us ]
  %2 = mul nsw i64 %indvars.iv49, %indvars.iv55
  %3 = add nsw i64 %2, 1
  %4 = trunc i64 %3 to i32
  %rem.us = srem i32 %4, %ni
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv5
  %arrayidx7.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv55, i64 %indvars.iv49
  store double %div.us, double* %arrayidx7.us, align 8
  %exitcond54 = icmp eq i64 %indvars.iv49, %wide.trip.count53
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  br i1 %exitcond54, label %for.cond1.for.inc8_crit_edge.us, label %for.body3.us

for.cond1.for.inc8_crit_edge.us:                  ; preds = %for.body3.us
  %indvars.iv.next56 = add nuw i64 %indvars.iv55, 1
  %cmp.us = icmp slt i64 %indvars.iv.next56, %1
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.cond11.preheader.loopexit

for.cond11.preheader.loopexit:                    ; preds = %for.cond1.for.inc8_crit_edge.us
  br label %for.cond11.preheader

for.cond11.preheader:                             ; preds = %for.cond11.preheader.loopexit, %entry
  %cmp1213 = icmp sgt i32 %nk, 0
  br i1 %cmp1213, label %for.cond15.preheader.lr.ph, label %for.cond37.preheader

for.cond15.preheader.lr.ph:                       ; preds = %for.cond11.preheader
  %cmp1611 = icmp sgt i32 %nj, 0
  %mul24 = mul nsw i32 %nj, 5
  %conv25 = sitofp i32 %mul24 to double
  br i1 %cmp1611, label %for.cond15.preheader.us.preheader, label %for.cond62.preheader

for.cond15.preheader.us.preheader:                ; preds = %for.cond15.preheader.lr.ph
  %5 = add i32 %nj, -1
  %6 = sext i32 %nk to i64
  %wide.trip.count44 = zext i32 %5 to i64
  br label %for.cond15.preheader.us

for.cond15.preheader.us:                          ; preds = %for.cond15.for.inc34_crit_edge.us, %for.cond15.preheader.us.preheader
  %indvars.iv46 = phi i64 [ 0, %for.cond15.preheader.us.preheader ], [ %indvars.iv.next47, %for.cond15.for.inc34_crit_edge.us ]
  br label %for.body18.us

for.body18.us:                                    ; preds = %for.body18.us, %for.cond15.preheader.us
  %indvars.iv40 = phi i64 [ 0, %for.cond15.preheader.us ], [ %indvars.iv.next41, %for.body18.us ]
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %7 = mul nsw i64 %indvars.iv.next41, %indvars.iv46
  %8 = add nsw i64 %7, 2
  %9 = trunc i64 %8 to i32
  %rem22.us = srem i32 %9, %nj
  %conv23.us = sitofp i32 %rem22.us to double
  %div26.us = fdiv double %conv23.us, %conv25
  %arrayidx30.us = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv46, i64 %indvars.iv40
  store double %div26.us, double* %arrayidx30.us, align 8
  %exitcond45 = icmp eq i64 %indvars.iv40, %wide.trip.count44
  br i1 %exitcond45, label %for.cond15.for.inc34_crit_edge.us, label %for.body18.us

for.cond15.for.inc34_crit_edge.us:                ; preds = %for.body18.us
  %indvars.iv.next47 = add nuw i64 %indvars.iv46, 1
  %cmp12.us = icmp slt i64 %indvars.iv.next47, %6
  br i1 %cmp12.us, label %for.cond15.preheader.us, label %for.cond37.preheader.loopexit

for.cond37.preheader.loopexit:                    ; preds = %for.cond15.for.inc34_crit_edge.us
  br label %for.cond37.preheader

for.cond37.preheader:                             ; preds = %for.cond37.preheader.loopexit, %for.cond1.preheader.lr.ph, %for.cond11.preheader
  %cmp388 = icmp sgt i32 %nj, 0
  br i1 %cmp388, label %for.cond41.preheader.lr.ph, label %for.cond62.preheader

for.cond41.preheader.lr.ph:                       ; preds = %for.cond37.preheader
  %cmp426 = icmp sgt i32 %nm, 0
  %mul49 = mul nsw i32 %nl, 5
  %conv50 = sitofp i32 %mul49 to double
  br i1 %cmp426, label %for.cond41.preheader.us.preheader, label %for.end87

for.cond41.preheader.us.preheader:                ; preds = %for.cond41.preheader.lr.ph
  %10 = add i32 %nm, -1
  %11 = sext i32 %nj to i64
  %wide.trip.count35 = zext i32 %10 to i64
  br label %for.cond41.preheader.us

for.cond41.preheader.us:                          ; preds = %for.cond41.for.inc59_crit_edge.us, %for.cond41.preheader.us.preheader
  %indvars.iv37 = phi i64 [ 0, %for.cond41.preheader.us.preheader ], [ %indvars.iv.next38, %for.cond41.for.inc59_crit_edge.us ]
  br label %for.body44.us

for.body44.us:                                    ; preds = %for.body44.us, %for.cond41.preheader.us
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %for.body44.us ], [ 0, %for.cond41.preheader.us ]
  %12 = add nuw nsw i64 %indvars.iv31, 3
  %13 = mul nsw i64 %12, %indvars.iv37
  %14 = trunc i64 %13 to i32
  %rem47.us = srem i32 %14, %nl
  %conv48.us = sitofp i32 %rem47.us to double
  %div51.us = fdiv double %conv48.us, %conv50
  %arrayidx55.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv37, i64 %indvars.iv31
  store double %div51.us, double* %arrayidx55.us, align 8
  %exitcond36 = icmp eq i64 %indvars.iv31, %wide.trip.count35
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  br i1 %exitcond36, label %for.cond41.for.inc59_crit_edge.us, label %for.body44.us

for.cond41.for.inc59_crit_edge.us:                ; preds = %for.body44.us
  %indvars.iv.next38 = add nuw i64 %indvars.iv37, 1
  %cmp38.us = icmp slt i64 %indvars.iv.next38, %11
  br i1 %cmp38.us, label %for.cond41.preheader.us, label %for.cond62.preheader.loopexit

for.cond62.preheader.loopexit:                    ; preds = %for.cond41.for.inc59_crit_edge.us
  br label %for.cond62.preheader

for.cond62.preheader:                             ; preds = %for.cond62.preheader.loopexit, %for.cond15.preheader.lr.ph, %for.cond37.preheader
  %cmp633 = icmp sgt i32 %nm, 0
  br i1 %cmp633, label %for.cond66.preheader.lr.ph, label %for.end87

for.cond66.preheader.lr.ph:                       ; preds = %for.cond62.preheader
  %cmp671 = icmp sgt i32 %nl, 0
  %mul75 = mul nsw i32 %nk, 5
  %conv76 = sitofp i32 %mul75 to double
  br i1 %cmp671, label %for.cond66.preheader.us.preheader, label %for.end87

for.cond66.preheader.us.preheader:                ; preds = %for.cond66.preheader.lr.ph
  %15 = add i32 %nl, -1
  %16 = sext i32 %nm to i64
  %wide.trip.count = zext i32 %15 to i64
  br label %for.cond66.preheader.us

for.cond66.preheader.us:                          ; preds = %for.cond66.for.inc85_crit_edge.us, %for.cond66.preheader.us.preheader
  %indvars.iv28 = phi i64 [ 0, %for.cond66.preheader.us.preheader ], [ %indvars.iv.next29, %for.cond66.for.inc85_crit_edge.us ]
  br label %for.body69.us

for.body69.us:                                    ; preds = %for.body69.us, %for.cond66.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body69.us ], [ 0, %for.cond66.preheader.us ]
  %17 = add nuw nsw i64 %indvars.iv, 2
  %18 = mul nsw i64 %17, %indvars.iv28
  %19 = add nsw i64 %18, 2
  %20 = trunc i64 %19 to i32
  %rem73.us = srem i32 %20, %nk
  %conv74.us = sitofp i32 %rem73.us to double
  %div77.us = fdiv double %conv74.us, %conv76
  %arrayidx81.us = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv28, i64 %indvars.iv
  store double %div77.us, double* %arrayidx81.us, align 8
  %exitcond = icmp eq i64 %indvars.iv, %wide.trip.count
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %for.cond66.for.inc85_crit_edge.us, label %for.body69.us

for.cond66.for.inc85_crit_edge.us:                ; preds = %for.body69.us
  %indvars.iv.next29 = add nuw i64 %indvars.iv28, 1
  %cmp63.us = icmp slt i64 %indvars.iv.next29, %16
  br i1 %cmp63.us, label %for.cond66.preheader.us, label %for.end87.loopexit

for.end87.loopexit:                               ; preds = %for.cond66.for.inc85_crit_edge.us
  br label %for.end87

for.end87:                                        ; preds = %for.end87.loopexit, %for.cond41.preheader.lr.ph, %for.cond66.preheader.lr.ph, %for.cond62.preheader
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_3mm(i32 %ni, i32 %nj, i32 %nk, i32 %nl, i32 %nm, [900 x double]* nocapture %E, [1000 x double]* nocapture readonly %A, [900 x double]* nocapture readonly %B, [1100 x double]* nocapture %F, [1200 x double]* nocapture readonly %C, [1100 x double]* nocapture readonly %D, [1100 x double]* nocapture %G) unnamed_addr #2 {
entry:
  %cmp17 = icmp sgt i32 %ni, 0
  br i1 %cmp17, label %for.cond1.preheader.lr.ph, label %for.cond27.preheader

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp215 = icmp sgt i32 %nj, 0
  br i1 %cmp215, label %for.cond1.preheader.us.preheader, label %for.cond66.preheader.lr.ph

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %0 = add i32 %nj, -1
  %1 = zext i32 %0 to i64
  %2 = shl nuw nsw i64 %1, 3
  %3 = add nuw nsw i64 %2, 8
  %4 = add i32 %nk, -1
  %5 = sext i32 %nj to i64
  %6 = sext i32 %ni to i64
  %wide.trip.count114 = zext i32 %4 to i64
  %7 = icmp sgt i32 %nk, 0
  %8 = and i64 %wide.trip.count114, 1
  %lcmp.mod128 = icmp eq i64 %8, 0
  %9 = icmp eq i32 %4, 0
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc24_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv118 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next119, %for.cond1.for.inc24_crit_edge.us ]
  br i1 %7, label %for.body3.us.us.preheader, label %for.cond1.for.inc24_crit_edge.us.loopexit83

for.body3.us.us.preheader:                        ; preds = %for.cond1.preheader.us
  %arrayidx12.us.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv118, i64 0
  br label %for.body3.us.us

for.cond1.for.inc24_crit_edge.us.loopexit83:      ; preds = %for.cond1.preheader.us
  %scevgep110 = getelementptr [900 x double], [900 x double]* %E, i64 %indvars.iv118, i64 0
  %scevgep110111 = bitcast double* %scevgep110 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep110111, i8 0, i64 %3, i32 8, i1 false)
  br label %for.cond1.for.inc24_crit_edge.us

for.cond1.for.inc24_crit_edge.us.loopexit:        ; preds = %for.cond6.for.inc21_crit_edge.us.us
  br label %for.cond1.for.inc24_crit_edge.us

for.cond1.for.inc24_crit_edge.us:                 ; preds = %for.cond1.for.inc24_crit_edge.us.loopexit, %for.cond1.for.inc24_crit_edge.us.loopexit83
  %indvars.iv.next119 = add nuw i64 %indvars.iv118, 1
  %cmp.us = icmp slt i64 %indvars.iv.next119, %6
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.cond27.preheader.loopexit

for.body3.us.us:                                  ; preds = %for.body3.us.us.preheader, %for.cond6.for.inc21_crit_edge.us.us
  %indvars.iv116 = phi i64 [ %indvars.iv.next117, %for.cond6.for.inc21_crit_edge.us.us ], [ 0, %for.body3.us.us.preheader ]
  %arrayidx5.us.us = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv118, i64 %indvars.iv116
  store double 0.000000e+00, double* %arrayidx5.us.us, align 8
  br i1 %lcmp.mod128, label %for.body8.us.us.prol, label %for.body8.us.us.prol.loopexit

for.body8.us.us.prol:                             ; preds = %for.body3.us.us
  %10 = load double, double* %arrayidx12.us.us.prol, align 8
  %arrayidx16.us.us.prol = getelementptr inbounds [900 x double], [900 x double]* %B, i64 0, i64 %indvars.iv116
  %11 = load double, double* %arrayidx16.us.us.prol, align 8
  %mul.us.us.prol = fmul double %10, %11
  %add.us.us.prol = fadd double %mul.us.us.prol, 0.000000e+00
  store double %add.us.us.prol, double* %arrayidx5.us.us, align 8
  br label %for.body8.us.us.prol.loopexit

for.body8.us.us.prol.loopexit:                    ; preds = %for.body8.us.us.prol, %for.body3.us.us
  %.unr129.ph = phi double [ %add.us.us.prol, %for.body8.us.us.prol ], [ 0.000000e+00, %for.body3.us.us ]
  %indvars.iv112.unr.ph = phi i64 [ 1, %for.body8.us.us.prol ], [ 0, %for.body3.us.us ]
  br i1 %9, label %for.cond6.for.inc21_crit_edge.us.us, label %for.body3.us.us.new

for.body3.us.us.new:                              ; preds = %for.body8.us.us.prol.loopexit
  br label %for.body8.us.us

for.cond6.for.inc21_crit_edge.us.us.loopexit:     ; preds = %for.body8.us.us
  br label %for.cond6.for.inc21_crit_edge.us.us

for.cond6.for.inc21_crit_edge.us.us:              ; preds = %for.cond6.for.inc21_crit_edge.us.us.loopexit, %for.body8.us.us.prol.loopexit
  %indvars.iv.next117 = add nuw i64 %indvars.iv116, 1
  %cmp2.us.us = icmp slt i64 %indvars.iv.next117, %5
  br i1 %cmp2.us.us, label %for.body3.us.us, label %for.cond1.for.inc24_crit_edge.us.loopexit

for.body8.us.us:                                  ; preds = %for.body8.us.us, %for.body3.us.us.new
  %12 = phi double [ %.unr129.ph, %for.body3.us.us.new ], [ %add.us.us.1, %for.body8.us.us ]
  %indvars.iv112 = phi i64 [ %indvars.iv112.unr.ph, %for.body3.us.us.new ], [ %indvars.iv.next113.1, %for.body8.us.us ]
  %arrayidx12.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv118, i64 %indvars.iv112
  %13 = load double, double* %arrayidx12.us.us, align 8
  %arrayidx16.us.us = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv112, i64 %indvars.iv116
  %14 = load double, double* %arrayidx16.us.us, align 8
  %mul.us.us = fmul double %13, %14
  %add.us.us = fadd double %12, %mul.us.us
  store double %add.us.us, double* %arrayidx5.us.us, align 8
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112, 1
  %arrayidx12.us.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv118, i64 %indvars.iv.next113
  %15 = load double, double* %arrayidx12.us.us.1, align 8
  %arrayidx16.us.us.1 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv.next113, i64 %indvars.iv116
  %16 = load double, double* %arrayidx16.us.us.1, align 8
  %mul.us.us.1 = fmul double %15, %16
  %add.us.us.1 = fadd double %add.us.us, %mul.us.us.1
  store double %add.us.us.1, double* %arrayidx5.us.us, align 8
  %exitcond115.1 = icmp eq i64 %indvars.iv.next113, %wide.trip.count114
  %indvars.iv.next113.1 = add nsw i64 %indvars.iv112, 2
  br i1 %exitcond115.1, label %for.cond6.for.inc21_crit_edge.us.us.loopexit, label %for.body8.us.us

for.cond27.preheader.loopexit:                    ; preds = %for.cond1.for.inc24_crit_edge.us
  br label %for.cond27.preheader

for.cond27.preheader:                             ; preds = %for.cond27.preheader.loopexit, %entry
  %cmp2811 = icmp sgt i32 %nj, 0
  %cmp319 = icmp sgt i32 %nl, 0
  %or.cond = and i1 %cmp2811, %cmp319
  br i1 %or.cond, label %for.cond30.preheader.us.preheader, label %for.cond63.preheader

for.cond30.preheader.us.preheader:                ; preds = %for.cond27.preheader
  %17 = add i32 %nl, -1
  %18 = zext i32 %17 to i64
  %19 = shl nuw nsw i64 %18, 3
  %20 = add nuw nsw i64 %19, 8
  %21 = add i32 %nm, -1
  %22 = sext i32 %nl to i64
  %23 = sext i32 %nj to i64
  %wide.trip.count99 = zext i32 %21 to i64
  %24 = icmp sgt i32 %nm, 0
  %25 = and i64 %wide.trip.count99, 1
  %lcmp.mod125 = icmp eq i64 %25, 0
  %26 = icmp eq i32 %21, 0
  br label %for.cond30.preheader.us

for.cond30.preheader.us:                          ; preds = %for.cond30.for.inc60_crit_edge.us, %for.cond30.preheader.us.preheader
  %indvars.iv103 = phi i64 [ 0, %for.cond30.preheader.us.preheader ], [ %indvars.iv.next104, %for.cond30.for.inc60_crit_edge.us ]
  br i1 %24, label %for.body32.us.us.preheader, label %for.cond30.for.inc60_crit_edge.us.loopexit81

for.body32.us.us.preheader:                       ; preds = %for.cond30.preheader.us
  %arrayidx43.us.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv103, i64 0
  br label %for.body32.us.us

for.cond30.for.inc60_crit_edge.us.loopexit81:     ; preds = %for.cond30.preheader.us
  %scevgep95 = getelementptr [1100 x double], [1100 x double]* %F, i64 %indvars.iv103, i64 0
  %scevgep9596 = bitcast double* %scevgep95 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep9596, i8 0, i64 %20, i32 8, i1 false)
  br label %for.cond30.for.inc60_crit_edge.us

for.cond30.for.inc60_crit_edge.us.loopexit:       ; preds = %for.cond37.for.inc57_crit_edge.us.us
  br label %for.cond30.for.inc60_crit_edge.us

for.cond30.for.inc60_crit_edge.us:                ; preds = %for.cond30.for.inc60_crit_edge.us.loopexit, %for.cond30.for.inc60_crit_edge.us.loopexit81
  %indvars.iv.next104 = add nuw i64 %indvars.iv103, 1
  %cmp28.us = icmp slt i64 %indvars.iv.next104, %23
  br i1 %cmp28.us, label %for.cond30.preheader.us, label %for.cond63.preheader.loopexit

for.body32.us.us:                                 ; preds = %for.body32.us.us.preheader, %for.cond37.for.inc57_crit_edge.us.us
  %indvars.iv101 = phi i64 [ %indvars.iv.next102, %for.cond37.for.inc57_crit_edge.us.us ], [ 0, %for.body32.us.us.preheader ]
  %arrayidx36.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv103, i64 %indvars.iv101
  store double 0.000000e+00, double* %arrayidx36.us.us, align 8
  br i1 %lcmp.mod125, label %for.body39.us.us.prol, label %for.body39.us.us.prol.loopexit

for.body39.us.us.prol:                            ; preds = %for.body32.us.us
  %27 = load double, double* %arrayidx43.us.us.prol, align 8
  %arrayidx47.us.us.prol = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 0, i64 %indvars.iv101
  %28 = load double, double* %arrayidx47.us.us.prol, align 8
  %mul48.us.us.prol = fmul double %27, %28
  %add53.us.us.prol = fadd double %mul48.us.us.prol, 0.000000e+00
  store double %add53.us.us.prol, double* %arrayidx36.us.us, align 8
  br label %for.body39.us.us.prol.loopexit

for.body39.us.us.prol.loopexit:                   ; preds = %for.body39.us.us.prol, %for.body32.us.us
  %.unr126.ph = phi double [ %add53.us.us.prol, %for.body39.us.us.prol ], [ 0.000000e+00, %for.body32.us.us ]
  %indvars.iv97.unr.ph = phi i64 [ 1, %for.body39.us.us.prol ], [ 0, %for.body32.us.us ]
  br i1 %26, label %for.cond37.for.inc57_crit_edge.us.us, label %for.body32.us.us.new

for.body32.us.us.new:                             ; preds = %for.body39.us.us.prol.loopexit
  br label %for.body39.us.us

for.cond37.for.inc57_crit_edge.us.us.loopexit:    ; preds = %for.body39.us.us
  br label %for.cond37.for.inc57_crit_edge.us.us

for.cond37.for.inc57_crit_edge.us.us:             ; preds = %for.cond37.for.inc57_crit_edge.us.us.loopexit, %for.body39.us.us.prol.loopexit
  %indvars.iv.next102 = add nuw i64 %indvars.iv101, 1
  %cmp31.us.us = icmp slt i64 %indvars.iv.next102, %22
  br i1 %cmp31.us.us, label %for.body32.us.us, label %for.cond30.for.inc60_crit_edge.us.loopexit

for.body39.us.us:                                 ; preds = %for.body39.us.us, %for.body32.us.us.new
  %29 = phi double [ %.unr126.ph, %for.body32.us.us.new ], [ %add53.us.us.1, %for.body39.us.us ]
  %indvars.iv97 = phi i64 [ %indvars.iv97.unr.ph, %for.body32.us.us.new ], [ %indvars.iv.next98.1, %for.body39.us.us ]
  %arrayidx43.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv103, i64 %indvars.iv97
  %30 = load double, double* %arrayidx43.us.us, align 8
  %arrayidx47.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv97, i64 %indvars.iv101
  %31 = load double, double* %arrayidx47.us.us, align 8
  %mul48.us.us = fmul double %30, %31
  %add53.us.us = fadd double %29, %mul48.us.us
  store double %add53.us.us, double* %arrayidx36.us.us, align 8
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %arrayidx43.us.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv103, i64 %indvars.iv.next98
  %32 = load double, double* %arrayidx43.us.us.1, align 8
  %arrayidx47.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv.next98, i64 %indvars.iv101
  %33 = load double, double* %arrayidx47.us.us.1, align 8
  %mul48.us.us.1 = fmul double %32, %33
  %add53.us.us.1 = fadd double %add53.us.us, %mul48.us.us.1
  store double %add53.us.us.1, double* %arrayidx36.us.us, align 8
  %exitcond100.1 = icmp eq i64 %indvars.iv.next98, %wide.trip.count99
  %indvars.iv.next98.1 = add nsw i64 %indvars.iv97, 2
  br i1 %exitcond100.1, label %for.cond37.for.inc57_crit_edge.us.us.loopexit, label %for.body39.us.us

for.cond63.preheader.loopexit:                    ; preds = %for.cond30.for.inc60_crit_edge.us
  br label %for.cond63.preheader

for.cond63.preheader:                             ; preds = %for.cond63.preheader.loopexit, %for.cond27.preheader
  %34 = icmp sgt i32 %nl, 0
  %35 = icmp sgt i32 %ni, 0
  %or.cond123 = and i1 %35, %34
  br i1 %or.cond123, label %for.cond66.preheader.us.preheader, label %for.end98

for.cond66.preheader.lr.ph:                       ; preds = %for.cond1.preheader.lr.ph
  %cmp673.old = icmp sgt i32 %nl, 0
  br i1 %cmp673.old, label %for.cond66.preheader.us.preheader, label %for.end98

for.cond66.preheader.us.preheader:                ; preds = %for.cond63.preheader, %for.cond66.preheader.lr.ph
  %36 = add i32 %nl, -1
  %37 = zext i32 %36 to i64
  %38 = shl nuw nsw i64 %37, 3
  %39 = add nuw nsw i64 %38, 8
  %40 = add i32 %nj, -1
  %41 = sext i32 %nl to i64
  %42 = sext i32 %ni to i64
  %wide.trip.count = zext i32 %40 to i64
  %43 = icmp sgt i32 %nj, 0
  %44 = and i64 %wide.trip.count, 1
  %lcmp.mod = icmp eq i64 %44, 0
  %45 = icmp eq i32 %40, 0
  br label %for.cond66.preheader.us

for.cond66.preheader.us:                          ; preds = %for.cond66.for.inc96_crit_edge.us, %for.cond66.preheader.us.preheader
  %indvars.iv88 = phi i64 [ 0, %for.cond66.preheader.us.preheader ], [ %indvars.iv.next89, %for.cond66.for.inc96_crit_edge.us ]
  br i1 %43, label %for.body68.us.us.preheader, label %for.cond66.for.inc96_crit_edge.us.loopexit79

for.body68.us.us.preheader:                       ; preds = %for.cond66.preheader.us
  %arrayidx79.us.us.prol = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv88, i64 0
  br label %for.body68.us.us

for.cond66.for.inc96_crit_edge.us.loopexit79:     ; preds = %for.cond66.preheader.us
  %scevgep = getelementptr [1100 x double], [1100 x double]* %G, i64 %indvars.iv88, i64 0
  %scevgep85 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep85, i8 0, i64 %39, i32 8, i1 false)
  br label %for.cond66.for.inc96_crit_edge.us

for.cond66.for.inc96_crit_edge.us.loopexit:       ; preds = %for.cond73.for.inc93_crit_edge.us.us
  br label %for.cond66.for.inc96_crit_edge.us

for.cond66.for.inc96_crit_edge.us:                ; preds = %for.cond66.for.inc96_crit_edge.us.loopexit, %for.cond66.for.inc96_crit_edge.us.loopexit79
  %indvars.iv.next89 = add nuw i64 %indvars.iv88, 1
  %cmp64.us = icmp slt i64 %indvars.iv.next89, %42
  br i1 %cmp64.us, label %for.cond66.preheader.us, label %for.end98.loopexit

for.body68.us.us:                                 ; preds = %for.body68.us.us.preheader, %for.cond73.for.inc93_crit_edge.us.us
  %indvars.iv86 = phi i64 [ %indvars.iv.next87, %for.cond73.for.inc93_crit_edge.us.us ], [ 0, %for.body68.us.us.preheader ]
  %arrayidx72.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %G, i64 %indvars.iv88, i64 %indvars.iv86
  store double 0.000000e+00, double* %arrayidx72.us.us, align 8
  br i1 %lcmp.mod, label %for.body75.us.us.prol, label %for.body75.us.us.prol.loopexit

for.body75.us.us.prol:                            ; preds = %for.body68.us.us
  %46 = load double, double* %arrayidx79.us.us.prol, align 8
  %arrayidx83.us.us.prol = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 0, i64 %indvars.iv86
  %47 = load double, double* %arrayidx83.us.us.prol, align 8
  %mul84.us.us.prol = fmul double %46, %47
  %add89.us.us.prol = fadd double %mul84.us.us.prol, 0.000000e+00
  store double %add89.us.us.prol, double* %arrayidx72.us.us, align 8
  br label %for.body75.us.us.prol.loopexit

for.body75.us.us.prol.loopexit:                   ; preds = %for.body75.us.us.prol, %for.body68.us.us
  %.unr.ph = phi double [ %add89.us.us.prol, %for.body75.us.us.prol ], [ 0.000000e+00, %for.body68.us.us ]
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body75.us.us.prol ], [ 0, %for.body68.us.us ]
  br i1 %45, label %for.cond73.for.inc93_crit_edge.us.us, label %for.body68.us.us.new

for.body68.us.us.new:                             ; preds = %for.body75.us.us.prol.loopexit
  br label %for.body75.us.us

for.cond73.for.inc93_crit_edge.us.us.loopexit:    ; preds = %for.body75.us.us
  br label %for.cond73.for.inc93_crit_edge.us.us

for.cond73.for.inc93_crit_edge.us.us:             ; preds = %for.cond73.for.inc93_crit_edge.us.us.loopexit, %for.body75.us.us.prol.loopexit
  %indvars.iv.next87 = add nuw i64 %indvars.iv86, 1
  %cmp67.us.us = icmp slt i64 %indvars.iv.next87, %41
  br i1 %cmp67.us.us, label %for.body68.us.us, label %for.cond66.for.inc96_crit_edge.us.loopexit

for.body75.us.us:                                 ; preds = %for.body75.us.us, %for.body68.us.us.new
  %48 = phi double [ %.unr.ph, %for.body68.us.us.new ], [ %add89.us.us.1, %for.body75.us.us ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.body68.us.us.new ], [ %indvars.iv.next.1, %for.body75.us.us ]
  %arrayidx79.us.us = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv88, i64 %indvars.iv
  %49 = load double, double* %arrayidx79.us.us, align 8
  %arrayidx83.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv, i64 %indvars.iv86
  %50 = load double, double* %arrayidx83.us.us, align 8
  %mul84.us.us = fmul double %49, %50
  %add89.us.us = fadd double %48, %mul84.us.us
  store double %add89.us.us, double* %arrayidx72.us.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx79.us.us.1 = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv88, i64 %indvars.iv.next
  %51 = load double, double* %arrayidx79.us.us.1, align 8
  %arrayidx83.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv.next, i64 %indvars.iv86
  %52 = load double, double* %arrayidx83.us.us.1, align 8
  %mul84.us.us.1 = fmul double %51, %52
  %add89.us.us.1 = fadd double %add89.us.us, %mul84.us.us.1
  store double %add89.us.us.1, double* %arrayidx72.us.us, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.cond73.for.inc93_crit_edge.us.us.loopexit, label %for.body75.us.us

for.end98.loopexit:                               ; preds = %for.cond66.for.inc96_crit_edge.us
  br label %for.end98

for.end98:                                        ; preds = %for.end98.loopexit, %for.cond66.preheader.lr.ph, %for.cond63.preheader
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %ni, i32 %nl, [1100 x double]* nocapture readonly %G) unnamed_addr #0 {
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
  %arrayidx8.us = getelementptr inbounds [1100 x double], [1100 x double]* %G, i64 %indvars.iv8, i64 %indvars.iv
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
