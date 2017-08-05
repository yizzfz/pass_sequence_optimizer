; ModuleID = 'A.ll'
source_filename = "3mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"G\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
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
  tail call fastcc void @print_array(i32 800, i32 1100, [1100 x double]* %arraydecay16)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
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
  %wide.trip.count59 = zext i32 %nk to i64
  %wide.trip.count63 = zext i32 %ni to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc8_crit_edge.us
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %for.cond1.for.inc8_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv55 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next56, %for.body3.us ]
  %0 = mul nuw nsw i64 %indvars.iv55, %indvars.iv61
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, %ni
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv5
  %arrayidx7.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv61, i64 %indvars.iv55
  store double %div.us, double* %arrayidx7.us, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next56, %wide.trip.count59
  br i1 %exitcond60, label %for.cond1.for.inc8_crit_edge.us, label %for.body3.us

for.cond1.for.inc8_crit_edge.us:                  ; preds = %for.body3.us
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next62, %wide.trip.count63
  br i1 %exitcond64, label %for.cond11.preheader.loopexit, label %for.cond1.preheader.us

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
  %wide.trip.count48 = zext i32 %nj to i64
  %wide.trip.count52 = zext i32 %nk to i64
  br label %for.cond15.preheader.us

for.cond15.preheader.us:                          ; preds = %for.cond15.preheader.us.preheader, %for.cond15.for.inc34_crit_edge.us
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %for.cond15.for.inc34_crit_edge.us ], [ 0, %for.cond15.preheader.us.preheader ]
  br label %for.body18.us

for.body18.us:                                    ; preds = %for.body18.us, %for.cond15.preheader.us
  %indvars.iv44 = phi i64 [ 0, %for.cond15.preheader.us ], [ %indvars.iv.next45, %for.body18.us ]
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %3 = mul nuw nsw i64 %indvars.iv.next45, %indvars.iv50
  %4 = add nuw nsw i64 %3, 2
  %5 = trunc i64 %4 to i32
  %rem22.us = srem i32 %5, %nj
  %conv23.us = sitofp i32 %rem22.us to double
  %div26.us = fdiv double %conv23.us, %conv25
  %arrayidx30.us = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv50, i64 %indvars.iv44
  store double %div26.us, double* %arrayidx30.us, align 8
  %exitcond49 = icmp eq i64 %indvars.iv.next45, %wide.trip.count48
  br i1 %exitcond49, label %for.cond15.for.inc34_crit_edge.us, label %for.body18.us

for.cond15.for.inc34_crit_edge.us:                ; preds = %for.body18.us
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next51, %wide.trip.count52
  br i1 %exitcond53, label %for.cond37.preheader.loopexit, label %for.cond15.preheader.us

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
  %wide.trip.count37 = zext i32 %nm to i64
  %wide.trip.count41 = zext i32 %nj to i64
  br label %for.cond41.preheader.us

for.cond41.preheader.us:                          ; preds = %for.cond41.preheader.us.preheader, %for.cond41.for.inc59_crit_edge.us
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %for.cond41.for.inc59_crit_edge.us ], [ 0, %for.cond41.preheader.us.preheader ]
  br label %for.body44.us

for.body44.us:                                    ; preds = %for.body44.us, %for.cond41.preheader.us
  %indvars.iv33 = phi i64 [ 0, %for.cond41.preheader.us ], [ %indvars.iv.next34, %for.body44.us ]
  %6 = add nuw nsw i64 %indvars.iv33, 3
  %7 = mul nuw nsw i64 %6, %indvars.iv39
  %8 = trunc i64 %7 to i32
  %rem47.us = srem i32 %8, %nl
  %conv48.us = sitofp i32 %rem47.us to double
  %div51.us = fdiv double %conv48.us, %conv50
  %arrayidx55.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv39, i64 %indvars.iv33
  store double %div51.us, double* %arrayidx55.us, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next34, %wide.trip.count37
  br i1 %exitcond38, label %for.cond41.for.inc59_crit_edge.us, label %for.body44.us

for.cond41.for.inc59_crit_edge.us:                ; preds = %for.body44.us
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, %wide.trip.count41
  br i1 %exitcond42, label %for.cond62.preheader.loopexit, label %for.cond41.preheader.us

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
  %wide.trip.count = zext i32 %nl to i64
  %wide.trip.count30 = zext i32 %nm to i64
  br label %for.cond66.preheader.us

for.cond66.preheader.us:                          ; preds = %for.cond66.preheader.us.preheader, %for.cond66.for.inc85_crit_edge.us
  %indvars.iv28 = phi i64 [ %indvars.iv.next29, %for.cond66.for.inc85_crit_edge.us ], [ 0, %for.cond66.preheader.us.preheader ]
  br label %for.body69.us

for.body69.us:                                    ; preds = %for.body69.us, %for.cond66.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond66.preheader.us ], [ %indvars.iv.next, %for.body69.us ]
  %9 = add nuw nsw i64 %indvars.iv, 2
  %10 = mul nuw nsw i64 %9, %indvars.iv28
  %11 = add nuw nsw i64 %10, 2
  %12 = trunc i64 %11 to i32
  %rem73.us = srem i32 %12, %nk
  %conv74.us = sitofp i32 %rem73.us to double
  %div77.us = fdiv double %conv74.us, %conv76
  %arrayidx81.us = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv28, i64 %indvars.iv
  store double %div77.us, double* %arrayidx81.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond66.for.inc85_crit_edge.us, label %for.body69.us

for.cond66.for.inc85_crit_edge.us:                ; preds = %for.body69.us
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next29, %wide.trip.count30
  br i1 %exitcond31, label %for.end87.loopexit, label %for.cond66.preheader.us

for.end87.loopexit:                               ; preds = %for.cond66.for.inc85_crit_edge.us
  br label %for.end87

for.end87:                                        ; preds = %for.end87.loopexit, %for.cond41.preheader.lr.ph, %for.cond66.preheader.lr.ph, %for.cond62.preheader
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_3mm(i32 %ni, i32 %nj, i32 %nk, i32 %nl, i32 %nm, [900 x double]* nocapture %E, [1000 x double]* nocapture readonly %A, [900 x double]* nocapture readonly %B, [1100 x double]* nocapture %F, [1200 x double]* nocapture readonly %C, [1100 x double]* nocapture readonly %D, [1100 x double]* nocapture %G) unnamed_addr #2 {
entry:
  %cmp57 = icmp sgt i32 %ni, 0
  br i1 %cmp57, label %for.cond1.preheader.lr.ph, label %for.cond27.preheader

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp255 = icmp sgt i32 %nj, 0
  %cmp753 = icmp sgt i32 %nk, 0
  br i1 %cmp255, label %for.cond1.preheader.us.preheader, label %for.cond66.preheader.lr.ph

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %0 = add i32 %nj, -1
  %1 = zext i32 %0 to i64
  %2 = shl nuw nsw i64 %1, 3
  %3 = add nuw nsw i64 %2, 8
  %wide.trip.count139 = zext i32 %ni to i64
  %xtraiter129 = and i32 %nk, 1
  %lcmp.mod130 = icmp eq i32 %xtraiter129, 0
  %4 = icmp eq i32 %nk, 1
  %wide.trip.count133 = zext i32 %nj to i64
  %wide.trip.count127.1 = zext i32 %nk to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc24_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv137 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next138, %for.cond1.for.inc24_crit_edge.us ]
  br i1 %cmp753, label %for.body3.us.us.preheader, label %for.cond1.for.inc24_crit_edge.us.loopexit83

for.body3.us.us.preheader:                        ; preds = %for.cond1.preheader.us
  %arrayidx12.us.us.prol = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv137, i64 0
  br label %for.body3.us.us

for.cond1.for.inc24_crit_edge.us.loopexit83:      ; preds = %for.cond1.preheader.us
  %scevgep123 = getelementptr [900 x double], [900 x double]* %E, i64 %indvars.iv137, i64 0
  %scevgep123124 = bitcast double* %scevgep123 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep123124, i8 0, i64 %3, i32 8, i1 false)
  br label %for.cond1.for.inc24_crit_edge.us

for.cond1.for.inc24_crit_edge.us.loopexit:        ; preds = %for.cond6.for.inc21_crit_edge.us.us
  br label %for.cond1.for.inc24_crit_edge.us

for.cond1.for.inc24_crit_edge.us:                 ; preds = %for.cond1.for.inc24_crit_edge.us.loopexit, %for.cond1.for.inc24_crit_edge.us.loopexit83
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %exitcond140 = icmp eq i64 %indvars.iv.next138, %wide.trip.count139
  br i1 %exitcond140, label %for.cond27.preheader.loopexit, label %for.cond1.preheader.us

for.body3.us.us:                                  ; preds = %for.body3.us.us.preheader, %for.cond6.for.inc21_crit_edge.us.us
  %indvars.iv131 = phi i64 [ %indvars.iv.next132, %for.cond6.for.inc21_crit_edge.us.us ], [ 0, %for.body3.us.us.preheader ]
  %arrayidx5.us.us = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv137, i64 %indvars.iv131
  store double 0.000000e+00, double* %arrayidx5.us.us, align 8
  br i1 %lcmp.mod130, label %for.body8.us.us.prol.loopexit, label %for.body8.us.us.prol

for.body8.us.us.prol:                             ; preds = %for.body3.us.us
  %5 = load double, double* %arrayidx12.us.us.prol, align 8
  %arrayidx16.us.us.prol = getelementptr inbounds [900 x double], [900 x double]* %B, i64 0, i64 %indvars.iv131
  %6 = load double, double* %arrayidx16.us.us.prol, align 8
  %mul.us.us.prol = fmul double %5, %6
  %7 = load double, double* %arrayidx5.us.us, align 8
  %add.us.us.prol = fadd double %7, %mul.us.us.prol
  store double %add.us.us.prol, double* %arrayidx5.us.us, align 8
  br label %for.body8.us.us.prol.loopexit

for.body8.us.us.prol.loopexit:                    ; preds = %for.body8.us.us.prol, %for.body3.us.us
  %indvars.iv125.unr.ph = phi i64 [ 1, %for.body8.us.us.prol ], [ 0, %for.body3.us.us ]
  br i1 %4, label %for.cond6.for.inc21_crit_edge.us.us, label %for.body8.us.us.preheader

for.body8.us.us.preheader:                        ; preds = %for.body8.us.us.prol.loopexit
  br label %for.body8.us.us

for.cond6.for.inc21_crit_edge.us.us.loopexit:     ; preds = %for.body8.us.us
  br label %for.cond6.for.inc21_crit_edge.us.us

for.cond6.for.inc21_crit_edge.us.us:              ; preds = %for.cond6.for.inc21_crit_edge.us.us.loopexit, %for.body8.us.us.prol.loopexit
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1
  %exitcond134 = icmp eq i64 %indvars.iv.next132, %wide.trip.count133
  br i1 %exitcond134, label %for.cond1.for.inc24_crit_edge.us.loopexit, label %for.body3.us.us

for.body8.us.us:                                  ; preds = %for.body8.us.us.preheader, %for.body8.us.us
  %indvars.iv125 = phi i64 [ %indvars.iv.next126.1, %for.body8.us.us ], [ %indvars.iv125.unr.ph, %for.body8.us.us.preheader ]
  %arrayidx12.us.us = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv137, i64 %indvars.iv125
  %8 = load double, double* %arrayidx12.us.us, align 8
  %arrayidx16.us.us = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv125, i64 %indvars.iv131
  %9 = load double, double* %arrayidx16.us.us, align 8
  %mul.us.us = fmul double %8, %9
  %10 = load double, double* %arrayidx5.us.us, align 8
  %add.us.us = fadd double %10, %mul.us.us
  store double %add.us.us, double* %arrayidx5.us.us, align 8
  %indvars.iv.next126 = add nuw nsw i64 %indvars.iv125, 1
  %arrayidx12.us.us.1 = getelementptr inbounds [1000 x double], [1000 x double]* %A, i64 %indvars.iv137, i64 %indvars.iv.next126
  %11 = load double, double* %arrayidx12.us.us.1, align 8
  %arrayidx16.us.us.1 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv.next126, i64 %indvars.iv131
  %12 = load double, double* %arrayidx16.us.us.1, align 8
  %mul.us.us.1 = fmul double %11, %12
  %13 = load double, double* %arrayidx5.us.us, align 8
  %add.us.us.1 = fadd double %13, %mul.us.us.1
  store double %add.us.us.1, double* %arrayidx5.us.us, align 8
  %indvars.iv.next126.1 = add nsw i64 %indvars.iv125, 2
  %exitcond128.1 = icmp eq i64 %indvars.iv.next126.1, %wide.trip.count127.1
  br i1 %exitcond128.1, label %for.cond6.for.inc21_crit_edge.us.us.loopexit, label %for.body8.us.us

for.cond27.preheader.loopexit:                    ; preds = %for.cond1.for.inc24_crit_edge.us
  br label %for.cond27.preheader

for.cond27.preheader:                             ; preds = %for.cond27.preheader.loopexit, %entry
  %cmp2831 = icmp sgt i32 %nj, 0
  br i1 %cmp2831, label %for.cond30.preheader.lr.ph, label %for.cond63.preheader

for.cond30.preheader.lr.ph:                       ; preds = %for.cond27.preheader
  %cmp3129 = icmp sgt i32 %nl, 0
  %cmp3827 = icmp sgt i32 %nm, 0
  br i1 %cmp3129, label %for.cond30.preheader.us.preheader, label %for.cond63.preheader

for.cond30.preheader.us.preheader:                ; preds = %for.cond30.preheader.lr.ph
  %14 = add i32 %nl, -1
  %15 = zext i32 %14 to i64
  %16 = shl nuw nsw i64 %15, 3
  %17 = add nuw nsw i64 %16, 8
  %wide.trip.count116 = zext i32 %nj to i64
  %xtraiter106 = and i32 %nm, 1
  %lcmp.mod107 = icmp eq i32 %xtraiter106, 0
  %18 = icmp eq i32 %nm, 1
  %wide.trip.count110 = zext i32 %nl to i64
  %wide.trip.count104.1 = zext i32 %nm to i64
  br label %for.cond30.preheader.us

for.cond30.preheader.us:                          ; preds = %for.cond30.for.inc60_crit_edge.us, %for.cond30.preheader.us.preheader
  %indvars.iv114 = phi i64 [ 0, %for.cond30.preheader.us.preheader ], [ %indvars.iv.next115, %for.cond30.for.inc60_crit_edge.us ]
  br i1 %cmp3827, label %for.body32.us.us.preheader, label %for.cond30.for.inc60_crit_edge.us.loopexit81

for.body32.us.us.preheader:                       ; preds = %for.cond30.preheader.us
  %arrayidx43.us.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv114, i64 0
  br label %for.body32.us.us

for.cond30.for.inc60_crit_edge.us.loopexit81:     ; preds = %for.cond30.preheader.us
  %scevgep100 = getelementptr [1100 x double], [1100 x double]* %F, i64 %indvars.iv114, i64 0
  %scevgep100101 = bitcast double* %scevgep100 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep100101, i8 0, i64 %17, i32 8, i1 false)
  br label %for.cond30.for.inc60_crit_edge.us

for.cond30.for.inc60_crit_edge.us.loopexit:       ; preds = %for.cond37.for.inc57_crit_edge.us.us
  br label %for.cond30.for.inc60_crit_edge.us

for.cond30.for.inc60_crit_edge.us:                ; preds = %for.cond30.for.inc60_crit_edge.us.loopexit, %for.cond30.for.inc60_crit_edge.us.loopexit81
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %exitcond117 = icmp eq i64 %indvars.iv.next115, %wide.trip.count116
  br i1 %exitcond117, label %for.cond63.preheader.loopexit, label %for.cond30.preheader.us

for.body32.us.us:                                 ; preds = %for.body32.us.us.preheader, %for.cond37.for.inc57_crit_edge.us.us
  %indvars.iv108 = phi i64 [ %indvars.iv.next109, %for.cond37.for.inc57_crit_edge.us.us ], [ 0, %for.body32.us.us.preheader ]
  %arrayidx36.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv114, i64 %indvars.iv108
  store double 0.000000e+00, double* %arrayidx36.us.us, align 8
  br i1 %lcmp.mod107, label %for.body39.us.us.prol.loopexit, label %for.body39.us.us.prol

for.body39.us.us.prol:                            ; preds = %for.body32.us.us
  %19 = load double, double* %arrayidx43.us.us.prol, align 8
  %arrayidx47.us.us.prol = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 0, i64 %indvars.iv108
  %20 = load double, double* %arrayidx47.us.us.prol, align 8
  %mul48.us.us.prol = fmul double %19, %20
  %21 = load double, double* %arrayidx36.us.us, align 8
  %add53.us.us.prol = fadd double %21, %mul48.us.us.prol
  store double %add53.us.us.prol, double* %arrayidx36.us.us, align 8
  br label %for.body39.us.us.prol.loopexit

for.body39.us.us.prol.loopexit:                   ; preds = %for.body39.us.us.prol, %for.body32.us.us
  %indvars.iv102.unr.ph = phi i64 [ 1, %for.body39.us.us.prol ], [ 0, %for.body32.us.us ]
  br i1 %18, label %for.cond37.for.inc57_crit_edge.us.us, label %for.body39.us.us.preheader

for.body39.us.us.preheader:                       ; preds = %for.body39.us.us.prol.loopexit
  br label %for.body39.us.us

for.cond37.for.inc57_crit_edge.us.us.loopexit:    ; preds = %for.body39.us.us
  br label %for.cond37.for.inc57_crit_edge.us.us

for.cond37.for.inc57_crit_edge.us.us:             ; preds = %for.cond37.for.inc57_crit_edge.us.us.loopexit, %for.body39.us.us.prol.loopexit
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  %exitcond111 = icmp eq i64 %indvars.iv.next109, %wide.trip.count110
  br i1 %exitcond111, label %for.cond30.for.inc60_crit_edge.us.loopexit, label %for.body32.us.us

for.body39.us.us:                                 ; preds = %for.body39.us.us.preheader, %for.body39.us.us
  %indvars.iv102 = phi i64 [ %indvars.iv.next103.1, %for.body39.us.us ], [ %indvars.iv102.unr.ph, %for.body39.us.us.preheader ]
  %arrayidx43.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv114, i64 %indvars.iv102
  %22 = load double, double* %arrayidx43.us.us, align 8
  %arrayidx47.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv102, i64 %indvars.iv108
  %23 = load double, double* %arrayidx47.us.us, align 8
  %mul48.us.us = fmul double %22, %23
  %24 = load double, double* %arrayidx36.us.us, align 8
  %add53.us.us = fadd double %24, %mul48.us.us
  store double %add53.us.us, double* %arrayidx36.us.us, align 8
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv102, 1
  %arrayidx43.us.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv114, i64 %indvars.iv.next103
  %25 = load double, double* %arrayidx43.us.us.1, align 8
  %arrayidx47.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %D, i64 %indvars.iv.next103, i64 %indvars.iv108
  %26 = load double, double* %arrayidx47.us.us.1, align 8
  %mul48.us.us.1 = fmul double %25, %26
  %27 = load double, double* %arrayidx36.us.us, align 8
  %add53.us.us.1 = fadd double %27, %mul48.us.us.1
  store double %add53.us.us.1, double* %arrayidx36.us.us, align 8
  %indvars.iv.next103.1 = add nsw i64 %indvars.iv102, 2
  %exitcond105.1 = icmp eq i64 %indvars.iv.next103.1, %wide.trip.count104.1
  br i1 %exitcond105.1, label %for.cond37.for.inc57_crit_edge.us.us.loopexit, label %for.body39.us.us

for.cond63.preheader.loopexit:                    ; preds = %for.cond30.for.inc60_crit_edge.us
  br label %for.cond63.preheader

for.cond63.preheader:                             ; preds = %for.cond63.preheader.loopexit, %for.cond30.preheader.lr.ph, %for.cond27.preheader
  %cmp645 = icmp sgt i32 %ni, 0
  br i1 %cmp645, label %for.cond66.preheader.lr.ph, label %for.end98

for.cond66.preheader.lr.ph:                       ; preds = %for.cond1.preheader.lr.ph, %for.cond63.preheader
  %cmp673 = icmp sgt i32 %nl, 0
  %cmp741 = icmp sgt i32 %nj, 0
  br i1 %cmp673, label %for.cond66.preheader.us.preheader, label %for.end98

for.cond66.preheader.us.preheader:                ; preds = %for.cond66.preheader.lr.ph
  %28 = add i32 %nl, -1
  %29 = zext i32 %28 to i64
  %30 = shl nuw nsw i64 %29, 3
  %31 = add nuw nsw i64 %30, 8
  %wide.trip.count93 = zext i32 %ni to i64
  %xtraiter = and i32 %nj, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %32 = icmp eq i32 %nj, 1
  %wide.trip.count88 = zext i32 %nl to i64
  %wide.trip.count.1 = zext i32 %nj to i64
  br label %for.cond66.preheader.us

for.cond66.preheader.us:                          ; preds = %for.cond66.for.inc96_crit_edge.us, %for.cond66.preheader.us.preheader
  %indvars.iv91 = phi i64 [ 0, %for.cond66.preheader.us.preheader ], [ %indvars.iv.next92, %for.cond66.for.inc96_crit_edge.us ]
  br i1 %cmp741, label %for.body68.us.us.preheader, label %for.cond66.for.inc96_crit_edge.us.loopexit79

for.body68.us.us.preheader:                       ; preds = %for.cond66.preheader.us
  %arrayidx79.us.us.prol = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv91, i64 0
  br label %for.body68.us.us

for.cond66.for.inc96_crit_edge.us.loopexit79:     ; preds = %for.cond66.preheader.us
  %scevgep = getelementptr [1100 x double], [1100 x double]* %G, i64 %indvars.iv91, i64 0
  %scevgep85 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep85, i8 0, i64 %31, i32 8, i1 false)
  br label %for.cond66.for.inc96_crit_edge.us

for.cond66.for.inc96_crit_edge.us.loopexit:       ; preds = %for.cond73.for.inc93_crit_edge.us.us
  br label %for.cond66.for.inc96_crit_edge.us

for.cond66.for.inc96_crit_edge.us:                ; preds = %for.cond66.for.inc96_crit_edge.us.loopexit, %for.cond66.for.inc96_crit_edge.us.loopexit79
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %exitcond94 = icmp eq i64 %indvars.iv.next92, %wide.trip.count93
  br i1 %exitcond94, label %for.end98.loopexit, label %for.cond66.preheader.us

for.body68.us.us:                                 ; preds = %for.body68.us.us.preheader, %for.cond73.for.inc93_crit_edge.us.us
  %indvars.iv86 = phi i64 [ %indvars.iv.next87, %for.cond73.for.inc93_crit_edge.us.us ], [ 0, %for.body68.us.us.preheader ]
  %arrayidx72.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %G, i64 %indvars.iv91, i64 %indvars.iv86
  store double 0.000000e+00, double* %arrayidx72.us.us, align 8
  br i1 %lcmp.mod, label %for.body75.us.us.prol.loopexit, label %for.body75.us.us.prol

for.body75.us.us.prol:                            ; preds = %for.body68.us.us
  %33 = load double, double* %arrayidx79.us.us.prol, align 8
  %arrayidx83.us.us.prol = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 0, i64 %indvars.iv86
  %34 = load double, double* %arrayidx83.us.us.prol, align 8
  %mul84.us.us.prol = fmul double %33, %34
  %35 = load double, double* %arrayidx72.us.us, align 8
  %add89.us.us.prol = fadd double %35, %mul84.us.us.prol
  store double %add89.us.us.prol, double* %arrayidx72.us.us, align 8
  br label %for.body75.us.us.prol.loopexit

for.body75.us.us.prol.loopexit:                   ; preds = %for.body75.us.us.prol, %for.body68.us.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body75.us.us.prol ], [ 0, %for.body68.us.us ]
  br i1 %32, label %for.cond73.for.inc93_crit_edge.us.us, label %for.body75.us.us.preheader

for.body75.us.us.preheader:                       ; preds = %for.body75.us.us.prol.loopexit
  br label %for.body75.us.us

for.cond73.for.inc93_crit_edge.us.us.loopexit:    ; preds = %for.body75.us.us
  br label %for.cond73.for.inc93_crit_edge.us.us

for.cond73.for.inc93_crit_edge.us.us:             ; preds = %for.cond73.for.inc93_crit_edge.us.us.loopexit, %for.body75.us.us.prol.loopexit
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86, 1
  %exitcond = icmp eq i64 %indvars.iv.next87, %wide.trip.count88
  br i1 %exitcond, label %for.cond66.for.inc96_crit_edge.us.loopexit, label %for.body68.us.us

for.body75.us.us:                                 ; preds = %for.body75.us.us.preheader, %for.body75.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body75.us.us ], [ %indvars.iv.unr.ph, %for.body75.us.us.preheader ]
  %arrayidx79.us.us = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv91, i64 %indvars.iv
  %36 = load double, double* %arrayidx79.us.us, align 8
  %arrayidx83.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv, i64 %indvars.iv86
  %37 = load double, double* %arrayidx83.us.us, align 8
  %mul84.us.us = fmul double %36, %37
  %38 = load double, double* %arrayidx72.us.us, align 8
  %add89.us.us = fadd double %38, %mul84.us.us
  store double %add89.us.us, double* %arrayidx72.us.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx79.us.us.1 = getelementptr inbounds [900 x double], [900 x double]* %E, i64 %indvars.iv91, i64 %indvars.iv.next
  %39 = load double, double* %arrayidx79.us.us.1, align 8
  %arrayidx83.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %F, i64 %indvars.iv.next, i64 %indvars.iv86
  %40 = load double, double* %arrayidx83.us.us.1, align 8
  %mul84.us.us.1 = fmul double %39, %40
  %41 = load double, double* %arrayidx72.us.us, align 8
  %add89.us.us.1 = fadd double %41, %mul84.us.us.1
  store double %add89.us.us.1, double* %arrayidx72.us.us, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
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
  %3 = sext i32 %ni to i64
  %wide.trip.count = zext i32 %nl to i64
  %wide.trip.count11 = zext i32 %ni to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc10_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv8 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next9, %for.cond2.for.inc10_crit_edge.us ]
  %4 = mul nsw i64 %indvars.iv8, %3
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next, %if.end.us ]
  %5 = add nsw i64 %indvars.iv, %4
  %6 = trunc i64 %5 to i32
  %rem.us = srem i32 %6, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #6
  br label %if.end.us

if.end.us:                                        ; preds = %if.then.us, %for.body4.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1100 x double], [1100 x double]* %G, i64 %indvars.iv8, i64 %indvars.iv
  %9 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next9, %wide.trip.count11
  br i1 %exitcond12, label %for.end12.loopexit, label %for.cond2.preheader.us

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %entry
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %11) #6
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
