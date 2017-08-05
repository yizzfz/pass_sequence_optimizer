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
  %0 = sext i32 %nk to i64
  %1 = sext i32 %ni to i64
  %cmp40 = icmp sgt i32 %ni, 0
  br i1 %cmp40, label %for.cond1.preheader.lr.ph, label %for.end9

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp238 = icmp sgt i32 %nk, 0
  %conv4 = sitofp i32 %ni to double
  br i1 %cmp238, label %for.cond1.preheader.us.preheader, label %for.end9.thread

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  br label %for.cond1.preheader.us

for.end9.thread:                                  ; preds = %for.cond1.preheader.lr.ph
  %2 = sext i32 %nj to i64
  br label %for.end33

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc7_crit_edge.us
  %indvars.iv2141.us = phi i64 [ %indvars.iv.next22.us, %for.cond1.for.inc7_crit_edge.us ], [ 0, %for.cond1.preheader.us.preheader ]
  br label %for.body3.us

for.body3.us:                                     ; preds = %for.body3.us, %for.cond1.preheader.us
  %indvars.iv1739.us = phi i64 [ 0, %for.cond1.preheader.us ], [ %indvars.iv.next18.us, %for.body3.us ]
  %3 = mul nuw nsw i64 %indvars.iv1739.us, %indvars.iv2141.us
  %4 = add nuw nsw i64 %3, 1
  %5 = trunc i64 %4 to i32
  %rem.us = srem i32 %5, %ni
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %arrayidx6.us = getelementptr inbounds [1100 x double], [1100 x double]* %A, i64 %indvars.iv2141.us, i64 %indvars.iv1739.us
  store double %div.us, double* %arrayidx6.us, align 8
  %indvars.iv.next18.us = add nuw nsw i64 %indvars.iv1739.us, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next18.us, %0
  br i1 %exitcond55, label %for.cond1.for.inc7_crit_edge.us, label %for.body3.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.body3.us
  %indvars.iv.next22.us = add nuw nsw i64 %indvars.iv2141.us, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next22.us, %1
  br i1 %exitcond56, label %for.end9.loopexit, label %for.cond1.preheader.us

for.end9.loopexit:                                ; preds = %for.cond1.for.inc7_crit_edge.us
  br label %for.end9

for.end9:                                         ; preds = %for.end9.loopexit, %entry
  %6 = sext i32 %nj to i64
  %cmp1135 = icmp sgt i32 %nk, 0
  br i1 %cmp1135, label %for.cond14.preheader.lr.ph, label %for.end33

for.cond14.preheader.lr.ph:                       ; preds = %for.end9
  %cmp1533 = icmp sgt i32 %nj, 0
  %conv22 = sitofp i32 %nj to double
  br i1 %cmp1533, label %for.cond14.preheader.us.preheader, label %for.end33.thread

for.cond14.preheader.us.preheader:                ; preds = %for.cond14.preheader.lr.ph
  %xtraiter = and i64 %6, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %7 = icmp eq i32 %nj, 1
  br label %for.cond14.preheader.us

for.end33.thread:                                 ; preds = %for.cond14.preheader.lr.ph
  %8 = sext i32 %nl to i64
  br label %for.cond59.preheader

for.cond14.preheader.us:                          ; preds = %for.cond14.preheader.us.preheader, %for.cond14.for.inc31_crit_edge.us
  %indvars.iv1536.us = phi i64 [ %indvars.iv.next16.us, %for.cond14.for.inc31_crit_edge.us ], [ 0, %for.cond14.preheader.us.preheader ]
  br i1 %lcmp.mod, label %for.body17.us.prol.loopexit, label %for.body17.us.prol

for.body17.us.prol:                               ; preds = %for.cond14.preheader.us
  %9 = trunc i64 %indvars.iv1536.us to i32
  %rem20.us.prol = srem i32 %9, %nj
  %conv21.us.prol = sitofp i32 %rem20.us.prol to double
  %div23.us.prol = fdiv double %conv21.us.prol, %conv22
  %arrayidx27.us.prol = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv1536.us, i64 0
  store double %div23.us.prol, double* %arrayidx27.us.prol, align 8
  br label %for.body17.us.prol.loopexit

for.body17.us.prol.loopexit:                      ; preds = %for.body17.us.prol, %for.cond14.preheader.us
  %indvars.iv1234.us.unr.ph = phi i64 [ 1, %for.body17.us.prol ], [ 0, %for.cond14.preheader.us ]
  br i1 %7, label %for.cond14.for.inc31_crit_edge.us, label %for.body17.us.preheader

for.body17.us.preheader:                          ; preds = %for.body17.us.prol.loopexit
  br label %for.body17.us

for.body17.us:                                    ; preds = %for.body17.us.preheader, %for.body17.us
  %indvars.iv1234.us = phi i64 [ %indvars.iv.next13.us.1, %for.body17.us ], [ %indvars.iv1234.us.unr.ph, %for.body17.us.preheader ]
  %indvars.iv.next13.us = add nuw nsw i64 %indvars.iv1234.us, 1
  %10 = mul nuw nsw i64 %indvars.iv.next13.us, %indvars.iv1536.us
  %11 = trunc i64 %10 to i32
  %rem20.us = srem i32 %11, %nj
  %conv21.us = sitofp i32 %rem20.us to double
  %div23.us = fdiv double %conv21.us, %conv22
  %arrayidx27.us = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv1536.us, i64 %indvars.iv1234.us
  store double %div23.us, double* %arrayidx27.us, align 8
  %indvars.iv.next13.us.1 = add nsw i64 %indvars.iv1234.us, 2
  %12 = mul nuw nsw i64 %indvars.iv.next13.us.1, %indvars.iv1536.us
  %13 = trunc i64 %12 to i32
  %rem20.us.1 = srem i32 %13, %nj
  %conv21.us.1 = sitofp i32 %rem20.us.1 to double
  %div23.us.1 = fdiv double %conv21.us.1, %conv22
  %arrayidx27.us.1 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv1536.us, i64 %indvars.iv.next13.us
  store double %div23.us.1, double* %arrayidx27.us.1, align 8
  %exitcond52.1 = icmp eq i64 %indvars.iv.next13.us.1, %6
  br i1 %exitcond52.1, label %for.cond14.for.inc31_crit_edge.us.loopexit, label %for.body17.us

for.cond14.for.inc31_crit_edge.us.loopexit:       ; preds = %for.body17.us
  br label %for.cond14.for.inc31_crit_edge.us

for.cond14.for.inc31_crit_edge.us:                ; preds = %for.cond14.for.inc31_crit_edge.us.loopexit, %for.body17.us.prol.loopexit
  %indvars.iv.next16.us = add nuw nsw i64 %indvars.iv1536.us, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next16.us, %0
  br i1 %exitcond53, label %for.end33.loopexit, label %for.cond14.preheader.us

for.end33.loopexit:                               ; preds = %for.cond14.for.inc31_crit_edge.us
  br label %for.end33

for.end33:                                        ; preds = %for.end33.loopexit, %for.end9.thread, %for.end9
  %14 = phi i64 [ %2, %for.end9.thread ], [ %6, %for.end9 ], [ %6, %for.end33.loopexit ]
  %15 = sext i32 %nl to i64
  %cmp3530 = icmp sgt i32 %nj, 0
  br i1 %cmp3530, label %for.cond38.preheader.lr.ph, label %for.cond59.preheader

for.cond38.preheader.lr.ph:                       ; preds = %for.end33
  %cmp3928 = icmp sgt i32 %nl, 0
  %conv47 = sitofp i32 %nl to double
  br i1 %cmp3928, label %for.cond38.preheader.us.preheader, label %for.cond59.preheader

for.cond38.preheader.us.preheader:                ; preds = %for.cond38.preheader.lr.ph
  br label %for.cond38.preheader.us

for.cond38.preheader.us:                          ; preds = %for.cond38.preheader.us.preheader, %for.cond38.for.inc56_crit_edge.us
  %indvars.iv1031.us = phi i64 [ %indvars.iv.next11.us, %for.cond38.for.inc56_crit_edge.us ], [ 0, %for.cond38.preheader.us.preheader ]
  br label %for.body41.us

for.body41.us:                                    ; preds = %for.body41.us, %for.cond38.preheader.us
  %indvars.iv529.us = phi i64 [ 0, %for.cond38.preheader.us ], [ %indvars.iv.next6.us, %for.body41.us ]
  %16 = add nuw nsw i64 %indvars.iv529.us, 3
  %17 = mul nuw nsw i64 %16, %indvars.iv1031.us
  %18 = add nuw nsw i64 %17, 1
  %19 = trunc i64 %18 to i32
  %rem45.us = srem i32 %19, %nl
  %conv46.us = sitofp i32 %rem45.us to double
  %div48.us = fdiv double %conv46.us, %conv47
  %arrayidx52.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv1031.us, i64 %indvars.iv529.us
  store double %div48.us, double* %arrayidx52.us, align 8
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv529.us, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next6.us, %15
  br i1 %exitcond49, label %for.cond38.for.inc56_crit_edge.us, label %for.body41.us

for.cond38.for.inc56_crit_edge.us:                ; preds = %for.body41.us
  %indvars.iv.next11.us = add nuw nsw i64 %indvars.iv1031.us, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next11.us, %14
  br i1 %exitcond50, label %for.cond59.preheader.loopexit, label %for.cond38.preheader.us

for.cond59.preheader.loopexit:                    ; preds = %for.cond38.for.inc56_crit_edge.us
  br label %for.cond59.preheader

for.cond59.preheader:                             ; preds = %for.cond59.preheader.loopexit, %for.cond38.preheader.lr.ph, %for.end33.thread, %for.end33
  %20 = phi i64 [ %8, %for.end33.thread ], [ %15, %for.end33 ], [ %15, %for.cond38.preheader.lr.ph ], [ %15, %for.cond59.preheader.loopexit ]
  br i1 %cmp40, label %for.cond63.preheader.lr.ph, label %for.end82

for.cond63.preheader.lr.ph:                       ; preds = %for.cond59.preheader
  %cmp6423 = icmp sgt i32 %nl, 0
  %conv71 = sitofp i32 %nk to double
  br i1 %cmp6423, label %for.cond63.preheader.us.preheader, label %for.end82

for.cond63.preheader.us.preheader:                ; preds = %for.cond63.preheader.lr.ph
  br label %for.cond63.preheader.us

for.cond63.preheader.us:                          ; preds = %for.cond63.preheader.us.preheader, %for.cond63.for.inc80_crit_edge.us
  %indvars.iv326.us = phi i64 [ %indvars.iv.next4.us, %for.cond63.for.inc80_crit_edge.us ], [ 0, %for.cond63.preheader.us.preheader ]
  br label %for.body66.us

for.body66.us:                                    ; preds = %for.body66.us, %for.cond63.preheader.us
  %indvars.iv24.us = phi i64 [ 0, %for.cond63.preheader.us ], [ %indvars.iv.next.us, %for.body66.us ]
  %21 = add nuw nsw i64 %indvars.iv24.us, 2
  %22 = mul nuw nsw i64 %21, %indvars.iv326.us
  %23 = trunc i64 %22 to i32
  %rem69.us = srem i32 %23, %nk
  %conv70.us = sitofp i32 %rem69.us to double
  %div72.us = fdiv double %conv70.us, %conv71
  %arrayidx76.us = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv326.us, i64 %indvars.iv24.us
  store double %div72.us, double* %arrayidx76.us, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv24.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, %20
  br i1 %exitcond, label %for.cond63.for.inc80_crit_edge.us, label %for.body66.us

for.cond63.for.inc80_crit_edge.us:                ; preds = %for.body66.us
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv326.us, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next4.us, %1
  br i1 %exitcond47, label %for.end82.loopexit, label %for.cond63.preheader.us

for.end82.loopexit:                               ; preds = %for.cond63.for.inc80_crit_edge.us
  br label %for.end82

for.end82:                                        ; preds = %for.end82.loopexit, %for.cond63.preheader.lr.ph, %for.cond59.preheader
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_2mm(i32 %ni, i32 %nj, i32 %nk, i32 %nl, double %alpha, double %beta, [900 x double]* nocapture %tmp, [1100 x double]* nocapture readonly %A, [900 x double]* nocapture readonly %B, [1200 x double]* nocapture readonly %C, [1200 x double]* nocapture %D) unnamed_addr #2 {
entry:
  %0 = sext i32 %nk to i64
  %1 = sext i32 %nj to i64
  %2 = sext i32 %ni to i64
  %cmp45 = icmp sgt i32 %ni, 0
  br i1 %cmp45, label %for.cond4.preheader.lr.ph, label %for.end67

for.cond4.preheader.lr.ph:                        ; preds = %entry
  %cmp542 = icmp sgt i32 %nj, 0
  %cmp1040 = icmp sgt i32 %nk, 0
  br i1 %cmp542, label %for.cond4.preheader.us.preheader, label %for.cond34.preheader.lr.ph

for.cond4.preheader.us.preheader:                 ; preds = %for.cond4.preheader.lr.ph
  %3 = shl nsw i64 %1, 3
  %xtraiter81 = and i64 %0, 1
  %lcmp.mod82 = icmp eq i64 %xtraiter81, 0
  %4 = icmp eq i32 %nk, 1
  br label %for.cond4.preheader.us

for.cond4.preheader.us:                           ; preds = %for.cond4.for.inc28_crit_edge.us, %for.cond4.preheader.us.preheader
  %indvars.iv946.us = phi i64 [ %indvars.iv.next10.us, %for.cond4.for.inc28_crit_edge.us ], [ 0, %for.cond4.preheader.us.preheader ]
  br i1 %cmp1040, label %for.body6.us.us.preheader, label %for.cond4.for.inc28_crit_edge.us.loopexit71

for.body6.us.us.preheader:                        ; preds = %for.cond4.preheader.us
  %arrayidx15.us.us.prol = getelementptr inbounds [1100 x double], [1100 x double]* %A, i64 %indvars.iv946.us, i64 0
  br label %for.body6.us.us

for.cond4.for.inc28_crit_edge.us.loopexit71:      ; preds = %for.cond4.preheader.us
  %scevgep = getelementptr [900 x double], [900 x double]* %tmp, i64 %indvars.iv946.us, i64 0
  %scevgep79 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep79, i8 0, i64 %3, i32 8, i1 false)
  br label %for.cond4.for.inc28_crit_edge.us

for.cond4.for.inc28_crit_edge.us.loopexit:        ; preds = %for.cond9.for.inc25_crit_edge.us.us
  br label %for.cond4.for.inc28_crit_edge.us

for.cond4.for.inc28_crit_edge.us:                 ; preds = %for.cond4.for.inc28_crit_edge.us.loopexit, %for.cond4.for.inc28_crit_edge.us.loopexit71
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv946.us, 1
  %exitcond87 = icmp eq i64 %indvars.iv.next10.us, %2
  br i1 %exitcond87, label %for.cond34.preheader.lr.ph.loopexit, label %for.cond4.preheader.us

for.body6.us.us:                                  ; preds = %for.body6.us.us.preheader, %for.cond9.for.inc25_crit_edge.us.us
  %indvars.iv743.us.us = phi i64 [ %indvars.iv.next8.us.us, %for.cond9.for.inc25_crit_edge.us.us ], [ 0, %for.body6.us.us.preheader ]
  %arrayidx8.us.us = getelementptr inbounds [900 x double], [900 x double]* %tmp, i64 %indvars.iv946.us, i64 %indvars.iv743.us.us
  store double 0.000000e+00, double* %arrayidx8.us.us, align 8
  br i1 %lcmp.mod82, label %for.body11.us.us.prol.loopexit, label %for.body11.us.us.prol

for.body11.us.us.prol:                            ; preds = %for.body6.us.us
  %5 = load double, double* %arrayidx15.us.us.prol, align 8
  %mul.us.us.prol = fmul double %5, %alpha
  %arrayidx19.us.us.prol = getelementptr inbounds [900 x double], [900 x double]* %B, i64 0, i64 %indvars.iv743.us.us
  %6 = load double, double* %arrayidx19.us.us.prol, align 8
  %mul20.us.us.prol = fmul double %mul.us.us.prol, %6
  %add.us.us.prol = fadd double %mul20.us.us.prol, 0.000000e+00
  store double %add.us.us.prol, double* %arrayidx8.us.us, align 8
  br label %for.body11.us.us.prol.loopexit

for.body11.us.us.prol.loopexit:                   ; preds = %for.body11.us.us.prol, %for.body6.us.us
  %indvars.iv541.us.us.unr.ph = phi i64 [ 1, %for.body11.us.us.prol ], [ 0, %for.body6.us.us ]
  %.unr83.ph = phi double [ %add.us.us.prol, %for.body11.us.us.prol ], [ 0.000000e+00, %for.body6.us.us ]
  br i1 %4, label %for.cond9.for.inc25_crit_edge.us.us, label %for.body11.us.us.preheader

for.body11.us.us.preheader:                       ; preds = %for.body11.us.us.prol.loopexit
  br label %for.body11.us.us

for.cond9.for.inc25_crit_edge.us.us.loopexit:     ; preds = %for.body11.us.us
  br label %for.cond9.for.inc25_crit_edge.us.us

for.cond9.for.inc25_crit_edge.us.us:              ; preds = %for.cond9.for.inc25_crit_edge.us.us.loopexit, %for.body11.us.us.prol.loopexit
  %indvars.iv.next8.us.us = add nuw nsw i64 %indvars.iv743.us.us, 1
  %exitcond84 = icmp eq i64 %indvars.iv.next8.us.us, %1
  br i1 %exitcond84, label %for.cond4.for.inc28_crit_edge.us.loopexit, label %for.body6.us.us

for.body11.us.us:                                 ; preds = %for.body11.us.us.preheader, %for.body11.us.us
  %indvars.iv541.us.us = phi i64 [ %indvars.iv.next6.us.us.1, %for.body11.us.us ], [ %indvars.iv541.us.us.unr.ph, %for.body11.us.us.preheader ]
  %7 = phi double [ %add.us.us.1, %for.body11.us.us ], [ %.unr83.ph, %for.body11.us.us.preheader ]
  %arrayidx15.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %A, i64 %indvars.iv946.us, i64 %indvars.iv541.us.us
  %8 = load double, double* %arrayidx15.us.us, align 8
  %mul.us.us = fmul double %8, %alpha
  %arrayidx19.us.us = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv541.us.us, i64 %indvars.iv743.us.us
  %9 = load double, double* %arrayidx19.us.us, align 8
  %mul20.us.us = fmul double %mul.us.us, %9
  %add.us.us = fadd double %7, %mul20.us.us
  store double %add.us.us, double* %arrayidx8.us.us, align 8
  %indvars.iv.next6.us.us = add nuw nsw i64 %indvars.iv541.us.us, 1
  %arrayidx15.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %A, i64 %indvars.iv946.us, i64 %indvars.iv.next6.us.us
  %10 = load double, double* %arrayidx15.us.us.1, align 8
  %mul.us.us.1 = fmul double %10, %alpha
  %arrayidx19.us.us.1 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv.next6.us.us, i64 %indvars.iv743.us.us
  %11 = load double, double* %arrayidx19.us.us.1, align 8
  %mul20.us.us.1 = fmul double %mul.us.us.1, %11
  %add.us.us.1 = fadd double %add.us.us, %mul20.us.us.1
  store double %add.us.us.1, double* %arrayidx8.us.us, align 8
  %indvars.iv.next6.us.us.1 = add nsw i64 %indvars.iv541.us.us, 2
  %exitcond80.1 = icmp eq i64 %indvars.iv.next6.us.us.1, %0
  br i1 %exitcond80.1, label %for.cond9.for.inc25_crit_edge.us.us.loopexit, label %for.body11.us.us

for.cond34.preheader.lr.ph.loopexit:              ; preds = %for.cond4.for.inc28_crit_edge.us
  br label %for.cond34.preheader.lr.ph

for.cond34.preheader.lr.ph:                       ; preds = %for.cond34.preheader.lr.ph.loopexit, %for.cond4.preheader.lr.ph
  %12 = sext i32 %nl to i64
  %cmp3513 = icmp sgt i32 %nl, 0
  br i1 %cmp3513, label %for.cond34.preheader.us.preheader, label %for.end67

for.cond34.preheader.us.preheader:                ; preds = %for.cond34.preheader.lr.ph
  %13 = add nsw i64 %12, -1
  %xtraiter = and i64 %12, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %14 = icmp ult i64 %13, 3
  %xtraiter73 = and i64 %1, 1
  %lcmp.mod74 = icmp eq i64 %xtraiter73, 0
  %15 = icmp eq i32 %nj, 1
  %16 = add nsw i64 %12, -4
  %broadcast.splatinsert97 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat98 = shufflevector <2 x double> %broadcast.splatinsert97, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond34.preheader.us

for.cond34.preheader.us:                          ; preds = %for.cond34.for.inc65_crit_edge.us, %for.cond34.preheader.us.preheader
  %indvars.iv317.us = phi i64 [ %indvars.iv.next4.us, %for.cond34.for.inc65_crit_edge.us ], [ 0, %for.cond34.preheader.us.preheader ]
  br i1 %cmp542, label %for.body36.us.us.preheader, label %for.body36.us20.preheader

for.body36.us.us.preheader:                       ; preds = %for.cond34.preheader.us
  %arrayidx48.us.us.prol = getelementptr inbounds [900 x double], [900 x double]* %tmp, i64 %indvars.iv317.us, i64 0
  br label %for.body36.us.us

for.body36.us20.preheader:                        ; preds = %for.cond34.preheader.us
  br i1 %lcmp.mod, label %for.body36.us20.prol.loopexit, label %for.body36.us20.prol.preheader

for.body36.us20.prol.preheader:                   ; preds = %for.body36.us20.preheader
  br label %for.body36.us20.prol

for.body36.us20.prol:                             ; preds = %for.body36.us20.prol.preheader, %for.body36.us20.prol
  %indvars.iv114.us21.prol = phi i64 [ %indvars.iv.next2.us26.prol, %for.body36.us20.prol ], [ 0, %for.body36.us20.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body36.us20.prol ], [ %xtraiter, %for.body36.us20.prol.preheader ]
  %arrayidx40.us22.prol = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv317.us, i64 %indvars.iv114.us21.prol
  %17 = load double, double* %arrayidx40.us22.prol, align 8
  %mul41.us23.prol = fmul double %17, %beta
  store double %mul41.us23.prol, double* %arrayidx40.us22.prol, align 8
  %indvars.iv.next2.us26.prol = add nuw nsw i64 %indvars.iv114.us21.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body36.us20.prol.loopexit.loopexit, label %for.body36.us20.prol, !llvm.loop !1

for.body36.us20.prol.loopexit.loopexit:           ; preds = %for.body36.us20.prol
  br label %for.body36.us20.prol.loopexit

for.body36.us20.prol.loopexit:                    ; preds = %for.body36.us20.prol.loopexit.loopexit, %for.body36.us20.preheader
  %indvars.iv114.us21.unr = phi i64 [ 0, %for.body36.us20.preheader ], [ %indvars.iv.next2.us26.prol, %for.body36.us20.prol.loopexit.loopexit ]
  br i1 %14, label %for.cond34.for.inc65_crit_edge.us, label %for.body36.us20.preheader92

for.body36.us20.preheader92:                      ; preds = %for.body36.us20.prol.loopexit
  %18 = sub i64 %16, %indvars.iv114.us21.unr
  %19 = lshr i64 %18, 2
  %20 = add nuw nsw i64 %19, 1
  %min.iters.check = icmp ult i64 %20, 2
  br i1 %min.iters.check, label %for.body36.us20.preheader99, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body36.us20.preheader92
  %n.mod.vf = and i64 %20, 1
  %n.vec = sub nsw i64 %20, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %21 = add i64 %indvars.iv114.us21.unr, 4
  %22 = shl nuw i64 %19, 2
  %23 = add i64 %21, %22
  %24 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %23, %24
  br i1 %cmp.zero, label %for.body36.us20.preheader99, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %25 = shl i64 %index, 2
  %26 = add i64 %indvars.iv114.us21.unr, %25
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv317.us, i64 %26
  %28 = bitcast double* %27 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %28, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec94 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec95 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec96 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %29 = fmul <2 x double> %strided.vec, %broadcast.splat98
  %30 = fmul <2 x double> %strided.vec94, %broadcast.splat98
  %31 = fmul <2 x double> %strided.vec95, %broadcast.splat98
  %32 = add nsw i64 %26, 3
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv317.us, i64 %32
  %34 = fmul <2 x double> %strided.vec96, %broadcast.splat98
  %35 = getelementptr double, double* %33, i64 -3
  %36 = bitcast double* %35 to <8 x double>*
  %37 = shufflevector <2 x double> %29, <2 x double> %30, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %38 = shufflevector <2 x double> %31, <2 x double> %34, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %37, <4 x double> %38, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %36, align 8
  %index.next = add i64 %index, 2
  %39 = icmp eq i64 %index.next, %n.vec
  br i1 %39, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.cond34.for.inc65_crit_edge.us, label %for.body36.us20.preheader99

for.body36.us20.preheader99:                      ; preds = %middle.block, %min.iters.checked, %for.body36.us20.preheader92
  %indvars.iv114.us21.ph = phi i64 [ %indvars.iv114.us21.unr, %min.iters.checked ], [ %indvars.iv114.us21.unr, %for.body36.us20.preheader92 ], [ %ind.end, %middle.block ]
  br label %for.body36.us20

for.body36.us20:                                  ; preds = %for.body36.us20.preheader99, %for.body36.us20
  %indvars.iv114.us21 = phi i64 [ %indvars.iv.next2.us26.3, %for.body36.us20 ], [ %indvars.iv114.us21.ph, %for.body36.us20.preheader99 ]
  %arrayidx40.us22 = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv317.us, i64 %indvars.iv114.us21
  %40 = load double, double* %arrayidx40.us22, align 8
  %mul41.us23 = fmul double %40, %beta
  store double %mul41.us23, double* %arrayidx40.us22, align 8
  %indvars.iv.next2.us26 = add nuw nsw i64 %indvars.iv114.us21, 1
  %arrayidx40.us22.1 = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv317.us, i64 %indvars.iv.next2.us26
  %41 = load double, double* %arrayidx40.us22.1, align 8
  %mul41.us23.1 = fmul double %41, %beta
  store double %mul41.us23.1, double* %arrayidx40.us22.1, align 8
  %indvars.iv.next2.us26.1 = add nsw i64 %indvars.iv114.us21, 2
  %arrayidx40.us22.2 = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv317.us, i64 %indvars.iv.next2.us26.1
  %42 = load double, double* %arrayidx40.us22.2, align 8
  %mul41.us23.2 = fmul double %42, %beta
  store double %mul41.us23.2, double* %arrayidx40.us22.2, align 8
  %indvars.iv.next2.us26.2 = add nsw i64 %indvars.iv114.us21, 3
  %arrayidx40.us22.3 = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv317.us, i64 %indvars.iv.next2.us26.2
  %43 = load double, double* %arrayidx40.us22.3, align 8
  %mul41.us23.3 = fmul double %43, %beta
  store double %mul41.us23.3, double* %arrayidx40.us22.3, align 8
  %indvars.iv.next2.us26.3 = add nsw i64 %indvars.iv114.us21, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next2.us26.3, %12
  br i1 %exitcond.3, label %for.cond34.for.inc65_crit_edge.us.loopexit100, label %for.body36.us20, !llvm.loop !6

for.cond34.for.inc65_crit_edge.us.loopexit:       ; preds = %for.cond42.for.inc62_crit_edge.us.us
  br label %for.cond34.for.inc65_crit_edge.us

for.cond34.for.inc65_crit_edge.us.loopexit100:    ; preds = %for.body36.us20
  br label %for.cond34.for.inc65_crit_edge.us

for.cond34.for.inc65_crit_edge.us:                ; preds = %for.cond34.for.inc65_crit_edge.us.loopexit100, %for.cond34.for.inc65_crit_edge.us.loopexit, %middle.block, %for.body36.us20.prol.loopexit
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv317.us, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next4.us, %2
  br i1 %exitcond76, label %for.end67.loopexit, label %for.cond34.preheader.us

for.body36.us.us:                                 ; preds = %for.body36.us.us.preheader, %for.cond42.for.inc62_crit_edge.us.us
  %indvars.iv114.us.us = phi i64 [ %indvars.iv.next2.us.us, %for.cond42.for.inc62_crit_edge.us.us ], [ 0, %for.body36.us.us.preheader ]
  %arrayidx40.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv317.us, i64 %indvars.iv114.us.us
  %44 = load double, double* %arrayidx40.us.us, align 8
  %mul41.us.us = fmul double %44, %beta
  store double %mul41.us.us, double* %arrayidx40.us.us, align 8
  br i1 %lcmp.mod74, label %for.body44.us.us.prol.loopexit, label %for.body44.us.us.prol

for.body44.us.us.prol:                            ; preds = %for.body36.us.us
  %45 = load double, double* %arrayidx48.us.us.prol, align 8
  %arrayidx52.us.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 0, i64 %indvars.iv114.us.us
  %46 = load double, double* %arrayidx52.us.us.prol, align 8
  %mul53.us.us.prol = fmul double %45, %46
  %add58.us.us.prol = fadd double %mul41.us.us, %mul53.us.us.prol
  store double %add58.us.us.prol, double* %arrayidx40.us.us, align 8
  br label %for.body44.us.us.prol.loopexit

for.body44.us.us.prol.loopexit:                   ; preds = %for.body44.us.us.prol, %for.body36.us.us
  %indvars.iv12.us.us.unr.ph = phi i64 [ 1, %for.body44.us.us.prol ], [ 0, %for.body36.us.us ]
  %.unr.ph = phi double [ %add58.us.us.prol, %for.body44.us.us.prol ], [ %mul41.us.us, %for.body36.us.us ]
  br i1 %15, label %for.cond42.for.inc62_crit_edge.us.us, label %for.body44.us.us.preheader

for.body44.us.us.preheader:                       ; preds = %for.body44.us.us.prol.loopexit
  br label %for.body44.us.us

for.cond42.for.inc62_crit_edge.us.us.loopexit:    ; preds = %for.body44.us.us
  br label %for.cond42.for.inc62_crit_edge.us.us

for.cond42.for.inc62_crit_edge.us.us:             ; preds = %for.cond42.for.inc62_crit_edge.us.us.loopexit, %for.body44.us.us.prol.loopexit
  %indvars.iv.next2.us.us = add nuw nsw i64 %indvars.iv114.us.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next2.us.us, %12
  br i1 %exitcond, label %for.cond34.for.inc65_crit_edge.us.loopexit, label %for.body36.us.us

for.body44.us.us:                                 ; preds = %for.body44.us.us.preheader, %for.body44.us.us
  %indvars.iv12.us.us = phi i64 [ %indvars.iv.next.us.us.1, %for.body44.us.us ], [ %indvars.iv12.us.us.unr.ph, %for.body44.us.us.preheader ]
  %47 = phi double [ %add58.us.us.1, %for.body44.us.us ], [ %.unr.ph, %for.body44.us.us.preheader ]
  %arrayidx48.us.us = getelementptr inbounds [900 x double], [900 x double]* %tmp, i64 %indvars.iv317.us, i64 %indvars.iv12.us.us
  %48 = load double, double* %arrayidx48.us.us, align 8
  %arrayidx52.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv12.us.us, i64 %indvars.iv114.us.us
  %49 = load double, double* %arrayidx52.us.us, align 8
  %mul53.us.us = fmul double %48, %49
  %add58.us.us = fadd double %47, %mul53.us.us
  store double %add58.us.us, double* %arrayidx40.us.us, align 8
  %indvars.iv.next.us.us = add nuw nsw i64 %indvars.iv12.us.us, 1
  %arrayidx48.us.us.1 = getelementptr inbounds [900 x double], [900 x double]* %tmp, i64 %indvars.iv317.us, i64 %indvars.iv.next.us.us
  %50 = load double, double* %arrayidx48.us.us.1, align 8
  %arrayidx52.us.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv.next.us.us, i64 %indvars.iv114.us.us
  %51 = load double, double* %arrayidx52.us.us.1, align 8
  %mul53.us.us.1 = fmul double %50, %51
  %add58.us.us.1 = fadd double %add58.us.us, %mul53.us.us.1
  store double %add58.us.us.1, double* %arrayidx40.us.us, align 8
  %indvars.iv.next.us.us.1 = add nsw i64 %indvars.iv12.us.us, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.us.us.1, %1
  br i1 %exitcond.1, label %for.cond42.for.inc62_crit_edge.us.us.loopexit, label %for.body44.us.us

for.end67.loopexit:                               ; preds = %for.cond34.for.inc65_crit_edge.us
  br label %for.end67

for.end67:                                        ; preds = %for.end67.loopexit, %entry, %for.cond34.preheader.lr.ph
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
  %3 = sext i32 %nl to i64
  %4 = sext i32 %ni to i64
  %cmp7 = icmp sgt i32 %ni, 0
  %cmp35 = icmp sgt i32 %nl, 0
  %or.cond = and i1 %cmp7, %cmp35
  br i1 %or.cond, label %for.cond2.preheader.us.preheader, label %for.end12

for.cond2.preheader.us.preheader:                 ; preds = %entry
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.preheader.us.preheader, %for.cond2.for.inc10_crit_edge.us
  %indvars.iv28.us = phi i64 [ %indvars.iv.next3.us, %for.cond2.for.inc10_crit_edge.us ], [ 0, %for.cond2.preheader.us.preheader ]
  %5 = mul nsw i64 %indvars.iv28.us, %4
  br label %for.body4.us

for.body4.us:                                     ; preds = %if.end.us, %for.cond2.preheader.us
  %indvars.iv6.us = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next.us, %if.end.us ]
  %6 = add nsw i64 %indvars.iv6.us, %5
  %7 = trunc i64 %6 to i32
  %rem.us = srem i32 %7, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %if.end.us

if.then.us:                                       ; preds = %for.body4.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #6
  br label %if.end.us

if.end.us:                                        ; preds = %if.then.us, %for.body4.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv28.us, i64 %indvars.iv6.us
  %10 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv6.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, %3
  br i1 %exitcond, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %if.end.us
  %indvars.iv.next3.us = add nuw nsw i64 %indvars.iv28.us, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next3.us, %4
  br i1 %exitcond11, label %for.end12.loopexit, label %for.cond2.preheader.us

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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
