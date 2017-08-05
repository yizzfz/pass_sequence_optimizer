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
  tail call fastcc void @print_array(i32 800, i32 1200, [1200 x double]* %arraydecay11)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
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
  %wide.trip.count58 = zext i32 %nk to i64
  %wide.trip.count62 = zext i32 %ni to i64
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc7_crit_edge.us
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %for.cond1.for.inc7_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv54 = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next55, %for.body3.us ]
  %0 = mul nuw nsw i64 %indvars.iv54, %indvars.iv60
  %1 = add nuw nsw i64 %0, 1
  %2 = trunc i64 %1 to i32
  %rem.us = srem i32 %2, %ni
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %arrayidx6.us = getelementptr inbounds [1100 x double], [1100 x double]* %A, i64 %indvars.iv60, i64 %indvars.iv54
  store double %div.us, double* %arrayidx6.us, align 8
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next55, %wide.trip.count58
  br i1 %exitcond59, label %for.cond1.for.inc7_crit_edge.us, label %for.body3.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.body3.us
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond63 = icmp eq i64 %indvars.iv.next61, %wide.trip.count62
  br i1 %exitcond63, label %for.cond10.preheader.loopexit, label %for.cond1.preheader.us

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
  %xtraiter = and i32 %nj, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %3 = icmp eq i32 %nj, 1
  %wide.trip.count51 = zext i32 %nk to i64
  %wide.trip.count47.1 = zext i32 %nj to i64
  br label %for.cond14.preheader.us

for.cond14.preheader.us:                          ; preds = %for.cond14.preheader.us.preheader, %for.cond14.for.inc31_crit_edge.us
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %for.cond14.for.inc31_crit_edge.us ], [ 0, %for.cond14.preheader.us.preheader ]
  br i1 %lcmp.mod, label %for.body17.us.prol.loopexit, label %for.body17.us.prol

for.body17.us.prol:                               ; preds = %for.cond14.preheader.us
  %4 = trunc i64 %indvars.iv49 to i32
  %rem20.us.prol = srem i32 %4, %nj
  %conv21.us.prol = sitofp i32 %rem20.us.prol to double
  %div23.us.prol = fdiv double %conv21.us.prol, %conv22
  %arrayidx27.us.prol = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv49, i64 0
  store double %div23.us.prol, double* %arrayidx27.us.prol, align 8
  br label %for.body17.us.prol.loopexit

for.body17.us.prol.loopexit:                      ; preds = %for.body17.us.prol, %for.cond14.preheader.us
  %indvars.iv44.unr.ph = phi i64 [ 1, %for.body17.us.prol ], [ 0, %for.cond14.preheader.us ]
  br i1 %3, label %for.cond14.for.inc31_crit_edge.us, label %for.body17.us.preheader

for.body17.us.preheader:                          ; preds = %for.body17.us.prol.loopexit
  br label %for.body17.us

for.body17.us:                                    ; preds = %for.body17.us.preheader, %for.body17.us
  %indvars.iv44 = phi i64 [ %indvars.iv.next45.1, %for.body17.us ], [ %indvars.iv44.unr.ph, %for.body17.us.preheader ]
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %5 = mul nuw nsw i64 %indvars.iv.next45, %indvars.iv49
  %6 = trunc i64 %5 to i32
  %rem20.us = srem i32 %6, %nj
  %conv21.us = sitofp i32 %rem20.us to double
  %div23.us = fdiv double %conv21.us, %conv22
  %arrayidx27.us = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv49, i64 %indvars.iv44
  store double %div23.us, double* %arrayidx27.us, align 8
  %indvars.iv.next45.1 = add nsw i64 %indvars.iv44, 2
  %7 = mul nuw nsw i64 %indvars.iv.next45.1, %indvars.iv49
  %8 = trunc i64 %7 to i32
  %rem20.us.1 = srem i32 %8, %nj
  %conv21.us.1 = sitofp i32 %rem20.us.1 to double
  %div23.us.1 = fdiv double %conv21.us.1, %conv22
  %arrayidx27.us.1 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv49, i64 %indvars.iv.next45
  store double %div23.us.1, double* %arrayidx27.us.1, align 8
  %exitcond48.1 = icmp eq i64 %indvars.iv.next45.1, %wide.trip.count47.1
  br i1 %exitcond48.1, label %for.cond14.for.inc31_crit_edge.us.loopexit, label %for.body17.us

for.cond14.for.inc31_crit_edge.us.loopexit:       ; preds = %for.body17.us
  br label %for.cond14.for.inc31_crit_edge.us

for.cond14.for.inc31_crit_edge.us:                ; preds = %for.cond14.for.inc31_crit_edge.us.loopexit, %for.body17.us.prol.loopexit
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next50, %wide.trip.count51
  br i1 %exitcond52, label %for.cond34.preheader.loopexit, label %for.cond14.preheader.us

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
  %wide.trip.count37 = zext i32 %nl to i64
  %wide.trip.count41 = zext i32 %nj to i64
  br label %for.cond38.preheader.us

for.cond38.preheader.us:                          ; preds = %for.cond38.preheader.us.preheader, %for.cond38.for.inc56_crit_edge.us
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %for.cond38.for.inc56_crit_edge.us ], [ 0, %for.cond38.preheader.us.preheader ]
  br label %for.body41.us

for.body41.us:                                    ; preds = %for.body41.us, %for.cond38.preheader.us
  %indvars.iv32 = phi i64 [ 0, %for.cond38.preheader.us ], [ %indvars.iv.next33, %for.body41.us ]
  %9 = add nuw nsw i64 %indvars.iv32, 3
  %10 = mul nuw nsw i64 %9, %indvars.iv39
  %11 = add nuw nsw i64 %10, 1
  %12 = trunc i64 %11 to i32
  %rem45.us = srem i32 %12, %nl
  %conv46.us = sitofp i32 %rem45.us to double
  %div48.us = fdiv double %conv46.us, %conv47
  %arrayidx52.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv39, i64 %indvars.iv32
  store double %div48.us, double* %arrayidx52.us, align 8
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next33, %wide.trip.count37
  br i1 %exitcond38, label %for.cond38.for.inc56_crit_edge.us, label %for.body41.us

for.cond38.for.inc56_crit_edge.us:                ; preds = %for.body41.us
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, %wide.trip.count41
  br i1 %exitcond42, label %for.cond59.preheader.loopexit, label %for.cond38.preheader.us

for.cond59.preheader.loopexit:                    ; preds = %for.cond38.for.inc56_crit_edge.us
  br label %for.cond59.preheader

for.cond59.preheader:                             ; preds = %for.cond59.preheader.loopexit, %for.cond14.preheader.lr.ph, %for.cond38.preheader.lr.ph, %for.cond34.preheader
  %cmp603 = icmp sgt i32 %ni, 0
  br i1 %cmp603, label %for.cond63.preheader.lr.ph, label %for.end82

for.cond63.preheader.lr.ph:                       ; preds = %for.cond59.preheader
  %cmp641 = icmp sgt i32 %nl, 0
  %conv71 = sitofp i32 %nk to double
  br i1 %cmp641, label %for.cond63.preheader.us.preheader, label %for.end82

for.cond63.preheader.us.preheader:                ; preds = %for.cond63.preheader.lr.ph
  %wide.trip.count = zext i32 %nl to i64
  %wide.trip.count29 = zext i32 %ni to i64
  br label %for.cond63.preheader.us

for.cond63.preheader.us:                          ; preds = %for.cond63.preheader.us.preheader, %for.cond63.for.inc80_crit_edge.us
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %for.cond63.for.inc80_crit_edge.us ], [ 0, %for.cond63.preheader.us.preheader ]
  br label %for.body66.us

for.body66.us:                                    ; preds = %for.body66.us, %for.cond63.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond63.preheader.us ], [ %indvars.iv.next, %for.body66.us ]
  %13 = add nuw nsw i64 %indvars.iv, 2
  %14 = mul nuw nsw i64 %13, %indvars.iv27
  %15 = trunc i64 %14 to i32
  %rem69.us = srem i32 %15, %nk
  %conv70.us = sitofp i32 %rem69.us to double
  %div72.us = fdiv double %conv70.us, %conv71
  %arrayidx76.us = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv27, i64 %indvars.iv
  store double %div72.us, double* %arrayidx76.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond63.for.inc80_crit_edge.us, label %for.body66.us

for.cond63.for.inc80_crit_edge.us:                ; preds = %for.body66.us
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next28, %wide.trip.count29
  br i1 %exitcond30, label %for.end82.loopexit, label %for.cond63.preheader.us

for.end82.loopexit:                               ; preds = %for.cond63.for.inc80_crit_edge.us
  br label %for.end82

for.end82:                                        ; preds = %for.end82.loopexit, %for.cond63.preheader.lr.ph, %for.cond59.preheader
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_2mm(i32 %ni, i32 %nj, i32 %nk, i32 %nl, double %alpha, double %beta, [900 x double]* nocapture %tmp, [1100 x double]* nocapture readonly %A, [900 x double]* nocapture readonly %B, [1200 x double]* nocapture readonly %C, [1200 x double]* nocapture %D) unnamed_addr #2 {
entry:
  %cmp33 = icmp sgt i32 %ni, 0
  br i1 %cmp33, label %for.cond4.preheader.lr.ph, label %for.end67

for.cond4.preheader.lr.ph:                        ; preds = %entry
  %cmp530 = icmp sgt i32 %nj, 0
  %cmp1028 = icmp sgt i32 %nk, 0
  br i1 %cmp530, label %for.cond4.preheader.us.preheader, label %for.cond34.preheader.lr.ph

for.cond4.preheader.us.preheader:                 ; preds = %for.cond4.preheader.lr.ph
  %0 = add i32 %nj, -1
  %1 = zext i32 %0 to i64
  %2 = shl nuw nsw i64 %1, 3
  %3 = add nuw nsw i64 %2, 8
  %wide.trip.count93 = zext i32 %ni to i64
  %xtraiter83 = and i32 %nk, 1
  %lcmp.mod84 = icmp eq i32 %xtraiter83, 0
  %4 = icmp eq i32 %nk, 1
  %wide.trip.count87 = zext i32 %nj to i64
  %wide.trip.count81.1 = zext i32 %nk to i64
  br label %for.cond4.preheader.us

for.cond4.preheader.us:                           ; preds = %for.cond4.for.inc28_crit_edge.us, %for.cond4.preheader.us.preheader
  %indvars.iv91 = phi i64 [ 0, %for.cond4.preheader.us.preheader ], [ %indvars.iv.next92, %for.cond4.for.inc28_crit_edge.us ]
  br i1 %cmp1028, label %for.body6.us.us.preheader, label %for.cond4.for.inc28_crit_edge.us.loopexit58

for.body6.us.us.preheader:                        ; preds = %for.cond4.preheader.us
  %arrayidx15.us.us.prol = getelementptr inbounds [1100 x double], [1100 x double]* %A, i64 %indvars.iv91, i64 0
  br label %for.body6.us.us

for.cond4.for.inc28_crit_edge.us.loopexit58:      ; preds = %for.cond4.preheader.us
  %scevgep = getelementptr [900 x double], [900 x double]* %tmp, i64 %indvars.iv91, i64 0
  %scevgep78 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep78, i8 0, i64 %3, i32 8, i1 false)
  br label %for.cond4.for.inc28_crit_edge.us

for.cond4.for.inc28_crit_edge.us.loopexit:        ; preds = %for.cond9.for.inc25_crit_edge.us.us
  br label %for.cond4.for.inc28_crit_edge.us

for.cond4.for.inc28_crit_edge.us:                 ; preds = %for.cond4.for.inc28_crit_edge.us.loopexit, %for.cond4.for.inc28_crit_edge.us.loopexit58
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %exitcond94 = icmp eq i64 %indvars.iv.next92, %wide.trip.count93
  br i1 %exitcond94, label %for.cond31.preheader, label %for.cond4.preheader.us

for.body6.us.us:                                  ; preds = %for.body6.us.us.preheader, %for.cond9.for.inc25_crit_edge.us.us
  %indvars.iv85 = phi i64 [ %indvars.iv.next86, %for.cond9.for.inc25_crit_edge.us.us ], [ 0, %for.body6.us.us.preheader ]
  %arrayidx8.us.us = getelementptr inbounds [900 x double], [900 x double]* %tmp, i64 %indvars.iv91, i64 %indvars.iv85
  store double 0.000000e+00, double* %arrayidx8.us.us, align 8
  br i1 %lcmp.mod84, label %for.body11.us.us.prol.loopexit, label %for.body11.us.us.prol

for.body11.us.us.prol:                            ; preds = %for.body6.us.us
  %5 = load double, double* %arrayidx15.us.us.prol, align 8
  %mul.us.us.prol = fmul double %5, %alpha
  %arrayidx19.us.us.prol = getelementptr inbounds [900 x double], [900 x double]* %B, i64 0, i64 %indvars.iv85
  %6 = load double, double* %arrayidx19.us.us.prol, align 8
  %mul20.us.us.prol = fmul double %mul.us.us.prol, %6
  %7 = load double, double* %arrayidx8.us.us, align 8
  %add.us.us.prol = fadd double %7, %mul20.us.us.prol
  store double %add.us.us.prol, double* %arrayidx8.us.us, align 8
  br label %for.body11.us.us.prol.loopexit

for.body11.us.us.prol.loopexit:                   ; preds = %for.body11.us.us.prol, %for.body6.us.us
  %indvars.iv79.unr.ph = phi i64 [ 1, %for.body11.us.us.prol ], [ 0, %for.body6.us.us ]
  br i1 %4, label %for.cond9.for.inc25_crit_edge.us.us, label %for.body11.us.us.preheader

for.body11.us.us.preheader:                       ; preds = %for.body11.us.us.prol.loopexit
  br label %for.body11.us.us

for.cond9.for.inc25_crit_edge.us.us.loopexit:     ; preds = %for.body11.us.us
  br label %for.cond9.for.inc25_crit_edge.us.us

for.cond9.for.inc25_crit_edge.us.us:              ; preds = %for.cond9.for.inc25_crit_edge.us.us.loopexit, %for.body11.us.us.prol.loopexit
  %indvars.iv.next86 = add nuw nsw i64 %indvars.iv85, 1
  %exitcond88 = icmp eq i64 %indvars.iv.next86, %wide.trip.count87
  br i1 %exitcond88, label %for.cond4.for.inc28_crit_edge.us.loopexit, label %for.body6.us.us

for.body11.us.us:                                 ; preds = %for.body11.us.us.preheader, %for.body11.us.us
  %indvars.iv79 = phi i64 [ %indvars.iv.next80.1, %for.body11.us.us ], [ %indvars.iv79.unr.ph, %for.body11.us.us.preheader ]
  %arrayidx15.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %A, i64 %indvars.iv91, i64 %indvars.iv79
  %8 = load double, double* %arrayidx15.us.us, align 8
  %mul.us.us = fmul double %8, %alpha
  %arrayidx19.us.us = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv79, i64 %indvars.iv85
  %9 = load double, double* %arrayidx19.us.us, align 8
  %mul20.us.us = fmul double %mul.us.us, %9
  %10 = load double, double* %arrayidx8.us.us, align 8
  %add.us.us = fadd double %10, %mul20.us.us
  store double %add.us.us, double* %arrayidx8.us.us, align 8
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv79, 1
  %arrayidx15.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %A, i64 %indvars.iv91, i64 %indvars.iv.next80
  %11 = load double, double* %arrayidx15.us.us.1, align 8
  %mul.us.us.1 = fmul double %11, %alpha
  %arrayidx19.us.us.1 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv.next80, i64 %indvars.iv85
  %12 = load double, double* %arrayidx19.us.us.1, align 8
  %mul20.us.us.1 = fmul double %mul.us.us.1, %12
  %13 = load double, double* %arrayidx8.us.us, align 8
  %add.us.us.1 = fadd double %13, %mul20.us.us.1
  store double %add.us.us.1, double* %arrayidx8.us.us, align 8
  %indvars.iv.next80.1 = add nsw i64 %indvars.iv79, 2
  %exitcond82.1 = icmp eq i64 %indvars.iv.next80.1, %wide.trip.count81.1
  br i1 %exitcond82.1, label %for.cond9.for.inc25_crit_edge.us.us.loopexit, label %for.body11.us.us

for.cond31.preheader:                             ; preds = %for.cond4.for.inc28_crit_edge.us
  %cmp325 = icmp sgt i32 %ni, 0
  br i1 %cmp325, label %for.cond34.preheader.lr.ph, label %for.end67

for.cond34.preheader.lr.ph:                       ; preds = %for.cond4.preheader.lr.ph, %for.cond31.preheader
  %cmp353 = icmp sgt i32 %nl, 0
  %cmp431 = icmp sgt i32 %nj, 0
  br i1 %cmp353, label %for.cond34.preheader.us.preheader, label %for.end67

for.cond34.preheader.us.preheader:                ; preds = %for.cond34.preheader.lr.ph
  %14 = add i32 %nl, -1
  %wide.trip.count71 = zext i32 %ni to i64
  %xtraiter = and i32 %nl, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %15 = icmp ult i32 %14, 3
  %wide.trip.count.3 = zext i32 %nl to i64
  %xtraiter63 = and i32 %nj, 1
  %lcmp.mod64 = icmp eq i32 %xtraiter63, 0
  %16 = icmp eq i32 %nj, 1
  %wide.trip.count68 = zext i32 %nl to i64
  %wide.trip.count62.1 = zext i32 %nj to i64
  %17 = add nsw i64 %wide.trip.count68, -4
  %broadcast.splatinsert106 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat107 = shufflevector <2 x double> %broadcast.splatinsert106, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond34.preheader.us

for.cond34.preheader.us:                          ; preds = %for.cond34.for.inc65_crit_edge.us, %for.cond34.preheader.us.preheader
  %indvars.iv69 = phi i64 [ 0, %for.cond34.preheader.us.preheader ], [ %indvars.iv.next70, %for.cond34.for.inc65_crit_edge.us ]
  br i1 %cmp431, label %for.body36.us.us.preheader, label %for.body36.us7.preheader

for.body36.us.us.preheader:                       ; preds = %for.cond34.preheader.us
  %arrayidx48.us.us.prol = getelementptr inbounds [900 x double], [900 x double]* %tmp, i64 %indvars.iv69, i64 0
  br label %for.body36.us.us

for.body36.us7.preheader:                         ; preds = %for.cond34.preheader.us
  br i1 %lcmp.mod, label %for.body36.us7.prol.loopexit, label %for.body36.us7.prol.preheader

for.body36.us7.prol.preheader:                    ; preds = %for.body36.us7.preheader
  br label %for.body36.us7.prol

for.body36.us7.prol:                              ; preds = %for.body36.us7.prol.preheader, %for.body36.us7.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body36.us7.prol ], [ 0, %for.body36.us7.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body36.us7.prol ], [ %xtraiter, %for.body36.us7.prol.preheader ]
  %arrayidx40.us10.prol = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv69, i64 %indvars.iv.prol
  %18 = load double, double* %arrayidx40.us10.prol, align 8
  %mul41.us11.prol = fmul double %18, %beta
  store double %mul41.us11.prol, double* %arrayidx40.us10.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body36.us7.prol.loopexit.loopexit, label %for.body36.us7.prol, !llvm.loop !1

for.body36.us7.prol.loopexit.loopexit:            ; preds = %for.body36.us7.prol
  br label %for.body36.us7.prol.loopexit

for.body36.us7.prol.loopexit:                     ; preds = %for.body36.us7.prol.loopexit.loopexit, %for.body36.us7.preheader
  %indvars.iv.unr = phi i64 [ 0, %for.body36.us7.preheader ], [ %indvars.iv.next.prol, %for.body36.us7.prol.loopexit.loopexit ]
  br i1 %15, label %for.cond34.for.inc65_crit_edge.us, label %for.body36.us7.preheader101

for.body36.us7.preheader101:                      ; preds = %for.body36.us7.prol.loopexit
  %19 = sub i64 %17, %indvars.iv.unr
  %20 = lshr i64 %19, 2
  %21 = add nuw nsw i64 %20, 1
  %min.iters.check = icmp ult i64 %21, 2
  br i1 %min.iters.check, label %for.body36.us7.preheader108, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body36.us7.preheader101
  %n.mod.vf = and i64 %21, 1
  %n.vec = sub nsw i64 %21, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %22 = add i64 %indvars.iv.unr, 4
  %23 = shl nuw i64 %20, 2
  %24 = add i64 %22, %23
  %25 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %24, %25
  br i1 %cmp.zero, label %for.body36.us7.preheader108, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %26 = shl i64 %index, 2
  %27 = add i64 %indvars.iv.unr, %26
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv69, i64 %27
  %29 = bitcast double* %28 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %29, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec103 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec104 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec105 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %30 = fmul <2 x double> %strided.vec, %broadcast.splat107
  %31 = fmul <2 x double> %strided.vec103, %broadcast.splat107
  %32 = fmul <2 x double> %strided.vec104, %broadcast.splat107
  %33 = add nsw i64 %27, 3
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv69, i64 %33
  %35 = fmul <2 x double> %strided.vec105, %broadcast.splat107
  %36 = getelementptr double, double* %34, i64 -3
  %37 = bitcast double* %36 to <8 x double>*
  %38 = shufflevector <2 x double> %30, <2 x double> %31, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %39 = shufflevector <2 x double> %32, <2 x double> %35, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %38, <4 x double> %39, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %37, align 8
  %index.next = add i64 %index, 2
  %40 = icmp eq i64 %index.next, %n.vec
  br i1 %40, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.cond34.for.inc65_crit_edge.us, label %for.body36.us7.preheader108

for.body36.us7.preheader108:                      ; preds = %middle.block, %min.iters.checked, %for.body36.us7.preheader101
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked ], [ %indvars.iv.unr, %for.body36.us7.preheader101 ], [ %ind.end, %middle.block ]
  br label %for.body36.us7

for.body36.us7:                                   ; preds = %for.body36.us7.preheader108, %for.body36.us7
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body36.us7 ], [ %indvars.iv.ph, %for.body36.us7.preheader108 ]
  %arrayidx40.us10 = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv69, i64 %indvars.iv
  %41 = load double, double* %arrayidx40.us10, align 8
  %mul41.us11 = fmul double %41, %beta
  store double %mul41.us11, double* %arrayidx40.us10, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx40.us10.1 = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv69, i64 %indvars.iv.next
  %42 = load double, double* %arrayidx40.us10.1, align 8
  %mul41.us11.1 = fmul double %42, %beta
  store double %mul41.us11.1, double* %arrayidx40.us10.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx40.us10.2 = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv69, i64 %indvars.iv.next.1
  %43 = load double, double* %arrayidx40.us10.2, align 8
  %mul41.us11.2 = fmul double %43, %beta
  store double %mul41.us11.2, double* %arrayidx40.us10.2, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx40.us10.3 = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv69, i64 %indvars.iv.next.2
  %44 = load double, double* %arrayidx40.us10.3, align 8
  %mul41.us11.3 = fmul double %44, %beta
  store double %mul41.us11.3, double* %arrayidx40.us10.3, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %for.cond34.for.inc65_crit_edge.us.loopexit109, label %for.body36.us7, !llvm.loop !6

for.cond34.for.inc65_crit_edge.us.loopexit:       ; preds = %for.cond42.for.inc62_crit_edge.us.us
  br label %for.cond34.for.inc65_crit_edge.us

for.cond34.for.inc65_crit_edge.us.loopexit109:    ; preds = %for.body36.us7
  br label %for.cond34.for.inc65_crit_edge.us

for.cond34.for.inc65_crit_edge.us:                ; preds = %for.cond34.for.inc65_crit_edge.us.loopexit109, %for.cond34.for.inc65_crit_edge.us.loopexit, %middle.block, %for.body36.us7.prol.loopexit
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next70, %wide.trip.count71
  br i1 %exitcond72, label %for.end67.loopexit, label %for.cond34.preheader.us

for.body36.us.us:                                 ; preds = %for.body36.us.us.preheader, %for.cond42.for.inc62_crit_edge.us.us
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %for.cond42.for.inc62_crit_edge.us.us ], [ 0, %for.body36.us.us.preheader ]
  %arrayidx40.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv69, i64 %indvars.iv66
  %45 = load double, double* %arrayidx40.us.us, align 8
  %mul41.us.us = fmul double %45, %beta
  store double %mul41.us.us, double* %arrayidx40.us.us, align 8
  br i1 %lcmp.mod64, label %for.body44.us.us.prol.loopexit, label %for.body44.us.us.prol

for.body44.us.us.prol:                            ; preds = %for.body36.us.us
  %46 = load double, double* %arrayidx48.us.us.prol, align 8
  %arrayidx52.us.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 0, i64 %indvars.iv66
  %47 = load double, double* %arrayidx52.us.us.prol, align 8
  %mul53.us.us.prol = fmul double %46, %47
  %48 = load double, double* %arrayidx40.us.us, align 8
  %add58.us.us.prol = fadd double %48, %mul53.us.us.prol
  store double %add58.us.us.prol, double* %arrayidx40.us.us, align 8
  br label %for.body44.us.us.prol.loopexit

for.body44.us.us.prol.loopexit:                   ; preds = %for.body44.us.us.prol, %for.body36.us.us
  %indvars.iv60.unr.ph = phi i64 [ 1, %for.body44.us.us.prol ], [ 0, %for.body36.us.us ]
  br i1 %16, label %for.cond42.for.inc62_crit_edge.us.us, label %for.body44.us.us.preheader

for.body44.us.us.preheader:                       ; preds = %for.body44.us.us.prol.loopexit
  br label %for.body44.us.us

for.cond42.for.inc62_crit_edge.us.us.loopexit:    ; preds = %for.body44.us.us
  br label %for.cond42.for.inc62_crit_edge.us.us

for.cond42.for.inc62_crit_edge.us.us:             ; preds = %for.cond42.for.inc62_crit_edge.us.us.loopexit, %for.body44.us.us.prol.loopexit
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond = icmp eq i64 %indvars.iv.next67, %wide.trip.count68
  br i1 %exitcond, label %for.cond34.for.inc65_crit_edge.us.loopexit, label %for.body36.us.us

for.body44.us.us:                                 ; preds = %for.body44.us.us.preheader, %for.body44.us.us
  %indvars.iv60 = phi i64 [ %indvars.iv.next61.1, %for.body44.us.us ], [ %indvars.iv60.unr.ph, %for.body44.us.us.preheader ]
  %arrayidx48.us.us = getelementptr inbounds [900 x double], [900 x double]* %tmp, i64 %indvars.iv69, i64 %indvars.iv60
  %49 = load double, double* %arrayidx48.us.us, align 8
  %arrayidx52.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv60, i64 %indvars.iv66
  %50 = load double, double* %arrayidx52.us.us, align 8
  %mul53.us.us = fmul double %49, %50
  %51 = load double, double* %arrayidx40.us.us, align 8
  %add58.us.us = fadd double %51, %mul53.us.us
  store double %add58.us.us, double* %arrayidx40.us.us, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %arrayidx48.us.us.1 = getelementptr inbounds [900 x double], [900 x double]* %tmp, i64 %indvars.iv69, i64 %indvars.iv.next61
  %52 = load double, double* %arrayidx48.us.us.1, align 8
  %arrayidx52.us.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv.next61, i64 %indvars.iv66
  %53 = load double, double* %arrayidx52.us.us.1, align 8
  %mul53.us.us.1 = fmul double %52, %53
  %54 = load double, double* %arrayidx40.us.us, align 8
  %add58.us.us.1 = fadd double %54, %mul53.us.us.1
  store double %add58.us.us.1, double* %arrayidx40.us.us, align 8
  %indvars.iv.next61.1 = add nsw i64 %indvars.iv60, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next61.1, %wide.trip.count62.1
  br i1 %exitcond.1, label %for.cond42.for.inc62_crit_edge.us.us.loopexit, label %for.body44.us.us

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
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv8, i64 %indvars.iv
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
