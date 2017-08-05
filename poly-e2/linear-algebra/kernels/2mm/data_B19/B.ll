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
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %alpha = alloca double, align 8
  %beta = alloca double, align 8
  %call = tail call i8* @polybench_alloc_data(i64 720000, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 880000, i32 8) #4
  %call4 = tail call i8* @polybench_alloc_data(i64 990000, i32 8) #4
  %call6 = tail call i8* @polybench_alloc_data(i64 1080000, i32 8) #4
  %call8 = tail call i8* @polybench_alloc_data(i64 960000, i32 8) #4
  %0 = bitcast i8* %call2 to [1100 x double]*
  %1 = bitcast i8* %call4 to [900 x double]*
  %2 = bitcast i8* %call6 to [1200 x double]*
  %3 = bitcast i8* %call8 to [1200 x double]*
  call fastcc void @init_array(i32 800, i32 900, i32 1100, i32 1200, double* nonnull %alpha, double* nonnull %beta, [1100 x double]* %0, [900 x double]* %1, [1200 x double]* %2, [1200 x double]* %3)
  call void (...) @polybench_timer_start() #4
  %4 = load double, double* %alpha, align 8
  %5 = load double, double* %beta, align 8
  %6 = bitcast i8* %call to [900 x double]*
  call fastcc void @kernel_2mm(i32 800, i32 900, i32 1100, i32 1200, double %4, double %5, [900 x double]* %6, [1100 x double]* %0, [900 x double]* %1, [1200 x double]* %2, [1200 x double]* %3)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %7 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %7, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  call fastcc void @print_array(i32 800, i32 1200, [1200 x double]* %3)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  call void @free(i8* %call) #4
  call void @free(i8* %call2) #4
  call void @free(i8* %call4) #4
  call void @free(i8* %call6) #4
  call void @free(i8* %call8) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %ni, i32 %nj, i32 %nk, i32 %nl, double* nocapture %alpha, double* nocapture %beta, [1100 x double]* %A, [900 x double]* %B, [1200 x double]* %C, [1200 x double]* %D) unnamed_addr #2 {
entry:
  store double 1.500000e+00, double* %alpha, align 8
  store double 1.200000e+00, double* %beta, align 8
  %cmp34 = icmp sgt i32 %ni, 0
  br i1 %cmp34, label %for.body.lr.ph, label %for.end9

for.body.lr.ph:                                   ; preds = %entry
  %0 = zext i32 %nk to i64
  %cmp230 = icmp sgt i32 %nk, 0
  %1 = sext i32 %ni to i64
  %conv4 = sitofp i32 %ni to double
  br i1 %cmp230, label %for.body.us.preheader, label %for.end9

for.body.us.preheader:                            ; preds = %for.body.lr.ph
  br label %for.body.us

for.body.us:                                      ; preds = %for.body.us.preheader, %for.cond1.for.inc7_crit_edge.us
  %indvars.iv76 = phi i64 [ %indvars.iv.next77, %for.cond1.for.inc7_crit_edge.us ], [ 0, %for.body.us.preheader ]
  br label %for.inc.us

for.inc.us:                                       ; preds = %for.inc.us, %for.body.us
  %indvars.iv70 = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next71, %for.inc.us ]
  %2 = mul nsw i64 %indvars.iv76, %indvars.iv70
  %3 = add nsw i64 %2, 1
  %4 = trunc i64 %3 to i32
  %rem.us = srem i32 %4, %ni
  %conv.us = sitofp i32 %rem.us to double
  %div.us = fdiv double %conv.us, %conv4
  %arrayidx6.us = getelementptr inbounds [1100 x double], [1100 x double]* %A, i64 %indvars.iv76, i64 %indvars.iv70
  store double %div.us, double* %arrayidx6.us, align 8
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond84 = icmp eq i64 %indvars.iv.next71, %0
  br i1 %exitcond84, label %for.cond1.for.inc7_crit_edge.us, label %for.inc.us

for.cond1.for.inc7_crit_edge.us:                  ; preds = %for.inc.us
  %indvars.iv.next77 = add nsw i64 %indvars.iv76, 1
  %cmp.us = icmp slt i64 %indvars.iv.next77, %1
  br i1 %cmp.us, label %for.body.us, label %for.end9.loopexit

for.end9.loopexit:                                ; preds = %for.cond1.for.inc7_crit_edge.us
  br label %for.end9

for.end9:                                         ; preds = %for.end9.loopexit, %for.body.lr.ph, %entry
  %cmp1126 = icmp sgt i32 %nk, 0
  br i1 %cmp1126, label %for.body13.lr.ph, label %for.end33

for.body13.lr.ph:                                 ; preds = %for.end9
  %wide.trip.count64.1 = zext i32 %nj to i64
  %cmp1523 = icmp sgt i32 %nj, 0
  %5 = sext i32 %nk to i64
  %conv22 = sitofp i32 %nj to double
  br i1 %cmp1523, label %for.body13.us.preheader, label %for.end33

for.body13.us.preheader:                          ; preds = %for.body13.lr.ph
  %xtraiter = and i32 %nj, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %6 = icmp eq i32 %nj, 1
  br label %for.body13.us

for.body13.us:                                    ; preds = %for.body13.us.preheader, %for.cond14.for.inc31_crit_edge.us
  %indvars.iv66 = phi i64 [ 0, %for.body13.us.preheader ], [ %indvars.iv.next67, %for.cond14.for.inc31_crit_edge.us ]
  br i1 %lcmp.mod, label %for.inc28.us.prol.loopexit, label %for.inc28.us.prol

for.inc28.us.prol:                                ; preds = %for.body13.us
  %7 = trunc i64 %indvars.iv66 to i32
  %rem20.us.prol = srem i32 %7, %nj
  %conv21.us.prol = sitofp i32 %rem20.us.prol to double
  %div23.us.prol = fdiv double %conv21.us.prol, %conv22
  %arrayidx27.us.prol = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv66, i64 0
  store double %div23.us.prol, double* %arrayidx27.us.prol, align 8
  br label %for.inc28.us.prol.loopexit

for.inc28.us.prol.loopexit:                       ; preds = %for.inc28.us.prol, %for.body13.us
  %indvars.iv61.unr.ph = phi i64 [ 1, %for.inc28.us.prol ], [ 0, %for.body13.us ]
  br i1 %6, label %for.cond14.for.inc31_crit_edge.us, label %for.inc28.us.preheader

for.inc28.us.preheader:                           ; preds = %for.inc28.us.prol.loopexit
  br label %for.inc28.us

for.inc28.us:                                     ; preds = %for.inc28.us.preheader, %for.inc28.us
  %indvars.iv61 = phi i64 [ %indvars.iv.next62.1, %for.inc28.us ], [ %indvars.iv61.unr.ph, %for.inc28.us.preheader ]
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %8 = mul nsw i64 %indvars.iv66, %indvars.iv.next62
  %9 = trunc i64 %8 to i32
  %rem20.us = srem i32 %9, %nj
  %conv21.us = sitofp i32 %rem20.us to double
  %div23.us = fdiv double %conv21.us, %conv22
  %arrayidx27.us = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv66, i64 %indvars.iv61
  store double %div23.us, double* %arrayidx27.us, align 8
  %indvars.iv.next62.1 = add nuw nsw i64 %indvars.iv61, 2
  %10 = mul nsw i64 %indvars.iv66, %indvars.iv.next62.1
  %11 = trunc i64 %10 to i32
  %rem20.us.1 = srem i32 %11, %nj
  %conv21.us.1 = sitofp i32 %rem20.us.1 to double
  %div23.us.1 = fdiv double %conv21.us.1, %conv22
  %arrayidx27.us.1 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv66, i64 %indvars.iv.next62
  store double %div23.us.1, double* %arrayidx27.us.1, align 8
  %exitcond65.1 = icmp eq i64 %indvars.iv.next62.1, %wide.trip.count64.1
  br i1 %exitcond65.1, label %for.cond14.for.inc31_crit_edge.us.loopexit, label %for.inc28.us

for.cond14.for.inc31_crit_edge.us.loopexit:       ; preds = %for.inc28.us
  br label %for.cond14.for.inc31_crit_edge.us

for.cond14.for.inc31_crit_edge.us:                ; preds = %for.cond14.for.inc31_crit_edge.us.loopexit, %for.inc28.us.prol.loopexit
  %indvars.iv.next67 = add nsw i64 %indvars.iv66, 1
  %cmp11.us = icmp slt i64 %indvars.iv.next67, %5
  br i1 %cmp11.us, label %for.body13.us, label %for.end33.loopexit

for.end33.loopexit:                               ; preds = %for.cond14.for.inc31_crit_edge.us
  br label %for.end33

for.end33:                                        ; preds = %for.end33.loopexit, %for.body13.lr.ph, %for.end9
  %cmp3519 = icmp sgt i32 %nj, 0
  br i1 %cmp3519, label %for.body37.lr.ph, label %for.end58

for.body37.lr.ph:                                 ; preds = %for.end33
  %12 = zext i32 %nl to i64
  %cmp3916 = icmp sgt i32 %nl, 0
  %13 = sext i32 %nj to i64
  %conv47 = sitofp i32 %nl to double
  br i1 %cmp3916, label %for.body37.us.preheader, label %for.end58

for.body37.us.preheader:                          ; preds = %for.body37.lr.ph
  br label %for.body37.us

for.body37.us:                                    ; preds = %for.body37.us.preheader, %for.cond38.for.inc56_crit_edge.us
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %for.cond38.for.inc56_crit_edge.us ], [ 0, %for.body37.us.preheader ]
  br label %for.inc53.us

for.inc53.us:                                     ; preds = %for.inc53.us, %for.body37.us
  %indvars.iv50 = phi i64 [ 0, %for.body37.us ], [ %indvars.iv.next51, %for.inc53.us ]
  %14 = add nuw nsw i64 %indvars.iv50, 3
  %15 = mul nsw i64 %indvars.iv57, %14
  %16 = add nsw i64 %15, 1
  %17 = trunc i64 %16 to i32
  %rem45.us = srem i32 %17, %nl
  %conv46.us = sitofp i32 %rem45.us to double
  %div48.us = fdiv double %conv46.us, %conv47
  %arrayidx52.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv57, i64 %indvars.iv50
  store double %div48.us, double* %arrayidx52.us, align 8
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond = icmp eq i64 %indvars.iv.next51, %12
  br i1 %exitcond, label %for.cond38.for.inc56_crit_edge.us, label %for.inc53.us

for.cond38.for.inc56_crit_edge.us:                ; preds = %for.inc53.us
  %indvars.iv.next58 = add nsw i64 %indvars.iv57, 1
  %cmp35.us = icmp slt i64 %indvars.iv.next58, %13
  br i1 %cmp35.us, label %for.body37.us, label %for.end58.loopexit

for.end58.loopexit:                               ; preds = %for.cond38.for.inc56_crit_edge.us
  br label %for.end58

for.end58:                                        ; preds = %for.end58.loopexit, %for.body37.lr.ph, %for.end33
  br i1 %cmp34, label %for.body62.lr.ph, label %for.end82

for.body62.lr.ph:                                 ; preds = %for.end58
  %18 = zext i32 %nl to i64
  %cmp6411 = icmp sgt i32 %nl, 0
  %19 = sext i32 %ni to i64
  %conv71 = sitofp i32 %nk to double
  br i1 %cmp6411, label %for.body62.us.preheader, label %for.end82

for.body62.us.preheader:                          ; preds = %for.body62.lr.ph
  br label %for.body62.us

for.body62.us:                                    ; preds = %for.body62.us.preheader, %for.cond63.for.inc80_crit_edge.us
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %for.cond63.for.inc80_crit_edge.us ], [ 0, %for.body62.us.preheader ]
  br label %for.inc77.us

for.inc77.us:                                     ; preds = %for.inc77.us, %for.body62.us
  %indvars.iv = phi i64 [ 0, %for.body62.us ], [ %indvars.iv.next, %for.inc77.us ]
  %20 = add nuw nsw i64 %indvars.iv, 2
  %21 = mul nsw i64 %indvars.iv48, %20
  %22 = trunc i64 %21 to i32
  %rem69.us = srem i32 %22, %nk
  %conv70.us = sitofp i32 %rem69.us to double
  %div72.us = fdiv double %conv70.us, %conv71
  %arrayidx76.us = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv48, i64 %indvars.iv
  store double %div72.us, double* %arrayidx76.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond80 = icmp eq i64 %indvars.iv.next, %18
  br i1 %exitcond80, label %for.cond63.for.inc80_crit_edge.us, label %for.inc77.us

for.cond63.for.inc80_crit_edge.us:                ; preds = %for.inc77.us
  %indvars.iv.next49 = add nsw i64 %indvars.iv48, 1
  %cmp60.us = icmp slt i64 %indvars.iv.next49, %19
  br i1 %cmp60.us, label %for.body62.us, label %for.end82.loopexit

for.end82.loopexit:                               ; preds = %for.cond63.for.inc80_crit_edge.us
  br label %for.end82

for.end82:                                        ; preds = %for.end82.loopexit, %for.body62.lr.ph, %for.end58
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_2mm(i32 %ni, i32 %nj, i32 %nk, i32 %nl, double %alpha, double %beta, [900 x double]* %tmp, [1100 x double]* %A, [900 x double]* %B, [1200 x double]* %C, [1200 x double]* %D) unnamed_addr #2 {
entry:
  %cmp54 = icmp sgt i32 %ni, 0
  br i1 %cmp54, label %for.body.lr.ph, label %for.end67

for.body.lr.ph:                                   ; preds = %entry
  %0 = zext i32 %nj to i64
  %cmp550 = icmp sgt i32 %nj, 0
  %wide.trip.count114.1 = zext i32 %nk to i64
  %1 = sext i32 %ni to i64
  br i1 %cmp550, label %for.body.us.preheader, label %for.body33.lr.ph

for.body.us.preheader:                            ; preds = %for.body.lr.ph
  %2 = add i32 %nj, -1
  %3 = zext i32 %2 to i64
  %4 = shl nuw nsw i64 %3, 3
  %5 = add nuw nsw i64 %4, 8
  %6 = icmp sgt i32 %nk, 0
  %xtraiter128 = and i32 %nk, 1
  %lcmp.mod129 = icmp eq i32 %xtraiter128, 0
  %7 = icmp eq i32 %nk, 1
  br label %for.body.us

for.body.us:                                      ; preds = %for.body.us.preheader, %for.cond4.for.inc28_crit_edge.us
  %indvar = phi i64 [ 0, %for.body.us.preheader ], [ %indvar.next, %for.cond4.for.inc28_crit_edge.us ]
  %indvars.iv120 = phi i64 [ 0, %for.body.us.preheader ], [ %indvars.iv.next121, %for.cond4.for.inc28_crit_edge.us ]
  br i1 %6, label %for.body6.us.us.preheader, label %for.cond4.for.inc28_crit_edge.us.loopexit93

for.body6.us.us.preheader:                        ; preds = %for.body.us
  %arrayidx15.us.us.prol = getelementptr inbounds [1100 x double], [1100 x double]* %A, i64 %indvars.iv120, i64 0
  br label %for.body6.us.us

for.cond4.for.inc28_crit_edge.us.loopexit93:      ; preds = %for.body.us
  %scevgep = getelementptr [900 x double], [900 x double]* %tmp, i64 %indvar, i64 0
  %scevgep127 = bitcast double* %scevgep to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep127, i8 0, i64 %5, i32 8, i1 false)
  br label %for.cond4.for.inc28_crit_edge.us

for.cond4.for.inc28_crit_edge.us.loopexit:        ; preds = %for.cond9.for.inc25_crit_edge.us.us
  br label %for.cond4.for.inc28_crit_edge.us

for.cond4.for.inc28_crit_edge.us:                 ; preds = %for.cond4.for.inc28_crit_edge.us.loopexit, %for.cond4.for.inc28_crit_edge.us.loopexit93
  %indvars.iv.next121 = add nsw i64 %indvars.iv120, 1
  %cmp.us = icmp slt i64 %indvars.iv.next121, %1
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %cmp.us, label %for.body.us, label %for.body33.lr.ph.loopexit

for.body6.us.us:                                  ; preds = %for.body6.us.us.preheader, %for.cond9.for.inc25_crit_edge.us.us
  %indvars.iv116 = phi i64 [ %indvars.iv.next117, %for.cond9.for.inc25_crit_edge.us.us ], [ 0, %for.body6.us.us.preheader ]
  %arrayidx8.us.us = getelementptr inbounds [900 x double], [900 x double]* %tmp, i64 %indvars.iv120, i64 %indvars.iv116
  store double 0.000000e+00, double* %arrayidx8.us.us, align 8
  br i1 %lcmp.mod129, label %for.inc.us.us.prol.loopexit, label %for.inc.us.us.prol

for.inc.us.us.prol:                               ; preds = %for.body6.us.us
  %8 = load double, double* %arrayidx15.us.us.prol, align 8
  %mul.us.us.prol = fmul double %8, %alpha
  %arrayidx19.us.us.prol = getelementptr inbounds [900 x double], [900 x double]* %B, i64 0, i64 %indvars.iv116
  %9 = load double, double* %arrayidx19.us.us.prol, align 8
  %mul20.us.us.prol = fmul double %mul.us.us.prol, %9
  %add.us.us.prol = fadd double %mul20.us.us.prol, 0.000000e+00
  store double %add.us.us.prol, double* %arrayidx8.us.us, align 8
  br label %for.inc.us.us.prol.loopexit

for.inc.us.us.prol.loopexit:                      ; preds = %for.inc.us.us.prol, %for.body6.us.us
  %10 = phi double [ %add.us.us.prol, %for.inc.us.us.prol ], [ 0.000000e+00, %for.body6.us.us ]
  %indvars.iv112.unr.ph = phi i64 [ 1, %for.inc.us.us.prol ], [ 0, %for.body6.us.us ]
  br i1 %7, label %for.cond9.for.inc25_crit_edge.us.us, label %for.inc.us.us.preheader

for.inc.us.us.preheader:                          ; preds = %for.inc.us.us.prol.loopexit
  br label %for.inc.us.us

for.cond9.for.inc25_crit_edge.us.us.loopexit:     ; preds = %for.inc.us.us
  br label %for.cond9.for.inc25_crit_edge.us.us

for.cond9.for.inc25_crit_edge.us.us:              ; preds = %for.cond9.for.inc25_crit_edge.us.us.loopexit, %for.inc.us.us.prol.loopexit
  %indvars.iv.next117 = add nuw nsw i64 %indvars.iv116, 1
  %exitcond136 = icmp eq i64 %indvars.iv.next117, %0
  br i1 %exitcond136, label %for.cond4.for.inc28_crit_edge.us.loopexit, label %for.body6.us.us

for.inc.us.us:                                    ; preds = %for.inc.us.us.preheader, %for.inc.us.us
  %11 = phi double [ %add.us.us.1, %for.inc.us.us ], [ %10, %for.inc.us.us.preheader ]
  %indvars.iv112 = phi i64 [ %indvars.iv.next113.1, %for.inc.us.us ], [ %indvars.iv112.unr.ph, %for.inc.us.us.preheader ]
  %arrayidx15.us.us = getelementptr inbounds [1100 x double], [1100 x double]* %A, i64 %indvars.iv120, i64 %indvars.iv112
  %12 = load double, double* %arrayidx15.us.us, align 8
  %mul.us.us = fmul double %12, %alpha
  %arrayidx19.us.us = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv112, i64 %indvars.iv116
  %13 = load double, double* %arrayidx19.us.us, align 8
  %mul20.us.us = fmul double %mul.us.us, %13
  %add.us.us = fadd double %11, %mul20.us.us
  store double %add.us.us, double* %arrayidx8.us.us, align 8
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112, 1
  %arrayidx15.us.us.1 = getelementptr inbounds [1100 x double], [1100 x double]* %A, i64 %indvars.iv120, i64 %indvars.iv.next113
  %14 = load double, double* %arrayidx15.us.us.1, align 8
  %mul.us.us.1 = fmul double %14, %alpha
  %arrayidx19.us.us.1 = getelementptr inbounds [900 x double], [900 x double]* %B, i64 %indvars.iv.next113, i64 %indvars.iv116
  %15 = load double, double* %arrayidx19.us.us.1, align 8
  %mul20.us.us.1 = fmul double %mul.us.us.1, %15
  %add.us.us.1 = fadd double %add.us.us, %mul20.us.us.1
  store double %add.us.us.1, double* %arrayidx8.us.us, align 8
  %indvars.iv.next113.1 = add nuw nsw i64 %indvars.iv112, 2
  %exitcond115.1 = icmp eq i64 %indvars.iv.next113.1, %wide.trip.count114.1
  br i1 %exitcond115.1, label %for.cond9.for.inc25_crit_edge.us.us.loopexit, label %for.inc.us.us

for.body33.lr.ph.loopexit:                        ; preds = %for.cond4.for.inc28_crit_edge.us
  br label %for.body33.lr.ph

for.body33.lr.ph:                                 ; preds = %for.body33.lr.ph.loopexit, %for.body.lr.ph
  %wide.trip.count.3 = zext i32 %nl to i64
  %cmp358 = icmp sgt i32 %nl, 0
  br i1 %cmp358, label %for.body33.us.preheader, label %for.end67

for.body33.us.preheader:                          ; preds = %for.body33.lr.ph
  %16 = add i32 %nl, -1
  %17 = and i32 %nl, 3
  %18 = add nsw i32 %17, -1
  %19 = zext i32 %18 to i64
  %20 = add nuw nsw i64 %19, 1
  %21 = and i32 %nj, 1
  %lcmp.mod126 = icmp eq i32 %21, 0
  %22 = icmp eq i32 %nj, 1
  %lcmp.mod = icmp eq i32 %17, 0
  %23 = icmp ult i32 %16, 3
  %24 = add nsw i64 %wide.trip.count.3, -4
  %broadcast.splatinsert149 = insertelement <2 x double> undef, double %beta, i32 0
  %broadcast.splat150 = shufflevector <2 x double> %broadcast.splatinsert149, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.body33.us

for.body33.us:                                    ; preds = %for.body33.us.preheader, %for.cond34.for.inc65_crit_edge.us
  %indvars.iv105 = phi i64 [ 0, %for.body33.us.preheader ], [ %indvars.iv.next106, %for.cond34.for.inc65_crit_edge.us ]
  br i1 %cmp550, label %for.body36.us.us.preheader, label %for.body36.us18.preheader

for.body36.us.us.preheader:                       ; preds = %for.body33.us
  %arrayidx48.us.us.prol = getelementptr inbounds [900 x double], [900 x double]* %tmp, i64 %indvars.iv105, i64 0
  br label %for.body36.us.us

for.body36.us18.preheader:                        ; preds = %for.body33.us
  br i1 %lcmp.mod, label %for.body36.us18.prol.loopexit, label %for.body36.us18.prol.preheader

for.body36.us18.prol.preheader:                   ; preds = %for.body36.us18.preheader
  br label %for.body36.us18.prol

for.body36.us18.prol:                             ; preds = %for.body36.us18.prol.preheader, %for.body36.us18.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.body36.us18.prol ], [ 0, %for.body36.us18.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %for.body36.us18.prol ], [ %17, %for.body36.us18.prol.preheader ]
  %arrayidx40.us21.prol = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv105, i64 %indvars.iv.prol
  %25 = load double, double* %arrayidx40.us21.prol, align 8
  %mul41.us22.prol = fmul double %25, %beta
  store double %mul41.us22.prol, double* %arrayidx40.us21.prol, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body36.us18.prol.loopexit.loopexit, label %for.body36.us18.prol, !llvm.loop !1

for.body36.us18.prol.loopexit.loopexit:           ; preds = %for.body36.us18.prol
  br label %for.body36.us18.prol.loopexit

for.body36.us18.prol.loopexit:                    ; preds = %for.body36.us18.prol.loopexit.loopexit, %for.body36.us18.preheader
  %indvars.iv.unr = phi i64 [ 0, %for.body36.us18.preheader ], [ %20, %for.body36.us18.prol.loopexit.loopexit ]
  br i1 %23, label %for.cond34.for.inc65_crit_edge.us, label %for.body36.us18.preheader140

for.body36.us18.preheader140:                     ; preds = %for.body36.us18.prol.loopexit
  %26 = sub nsw i64 %24, %indvars.iv.unr
  %27 = lshr i64 %26, 2
  %28 = add nuw nsw i64 %27, 1
  %min.iters.check = icmp ult i64 %28, 2
  br i1 %min.iters.check, label %for.body36.us18.preheader151, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body36.us18.preheader140
  %n.mod.vf = and i64 %28, 1
  %n.vec = sub nsw i64 %28, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %29 = add nsw i64 %indvars.iv.unr, 4
  %30 = shl nuw i64 %27, 2
  %31 = add i64 %29, %30
  %32 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %31, %32
  br i1 %cmp.zero, label %for.body36.us18.preheader151, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %33 = shl i64 %index, 2
  %offset.idx = add i64 %indvars.iv.unr, %33
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv105, i64 %offset.idx
  %35 = bitcast double* %34 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %35, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec146 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec147 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec148 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %36 = fmul <2 x double> %strided.vec, %broadcast.splat150
  %37 = fmul <2 x double> %strided.vec146, %broadcast.splat150
  %38 = fmul <2 x double> %strided.vec147, %broadcast.splat150
  %39 = add nsw i64 %offset.idx, 3
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv105, i64 %39
  %41 = fmul <2 x double> %strided.vec148, %broadcast.splat150
  %42 = getelementptr double, double* %40, i64 -3
  %43 = bitcast double* %42 to <8 x double>*
  %44 = shufflevector <2 x double> %36, <2 x double> %37, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %45 = shufflevector <2 x double> %38, <2 x double> %41, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %44, <4 x double> %45, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %43, align 8
  %index.next = add i64 %index, 2
  %46 = icmp eq i64 %index.next, %n.vec
  br i1 %46, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %for.cond34.for.inc65_crit_edge.us, label %for.body36.us18.preheader151

for.body36.us18.preheader151:                     ; preds = %middle.block, %min.iters.checked, %for.body36.us18.preheader140
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked ], [ %indvars.iv.unr, %for.body36.us18.preheader140 ], [ %ind.end, %middle.block ]
  br label %for.body36.us18

for.body36.us18:                                  ; preds = %for.body36.us18.preheader151, %for.body36.us18
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %for.body36.us18 ], [ %indvars.iv.ph, %for.body36.us18.preheader151 ]
  %arrayidx40.us21 = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv105, i64 %indvars.iv
  %47 = load double, double* %arrayidx40.us21, align 8
  %mul41.us22 = fmul double %47, %beta
  store double %mul41.us22, double* %arrayidx40.us21, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx40.us21.1 = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv105, i64 %indvars.iv.next
  %48 = load double, double* %arrayidx40.us21.1, align 8
  %mul41.us22.1 = fmul double %48, %beta
  store double %mul41.us22.1, double* %arrayidx40.us21.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx40.us21.2 = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv105, i64 %indvars.iv.next.1
  %49 = load double, double* %arrayidx40.us21.2, align 8
  %mul41.us22.2 = fmul double %49, %beta
  store double %mul41.us22.2, double* %arrayidx40.us21.2, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx40.us21.3 = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv105, i64 %indvars.iv.next.2
  %50 = load double, double* %arrayidx40.us21.3, align 8
  %mul41.us22.3 = fmul double %50, %beta
  store double %mul41.us22.3, double* %arrayidx40.us21.3, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %for.cond34.for.inc65_crit_edge.us.loopexit152, label %for.body36.us18, !llvm.loop !6

for.cond34.for.inc65_crit_edge.us.loopexit:       ; preds = %for.cond42.for.inc62_crit_edge.us.us
  br label %for.cond34.for.inc65_crit_edge.us

for.cond34.for.inc65_crit_edge.us.loopexit152:    ; preds = %for.body36.us18
  br label %for.cond34.for.inc65_crit_edge.us

for.cond34.for.inc65_crit_edge.us:                ; preds = %for.cond34.for.inc65_crit_edge.us.loopexit152, %for.cond34.for.inc65_crit_edge.us.loopexit, %middle.block, %for.body36.us18.prol.loopexit
  %indvars.iv.next106 = add nsw i64 %indvars.iv105, 1
  %cmp32.us = icmp slt i64 %indvars.iv.next106, %1
  br i1 %cmp32.us, label %for.body33.us, label %for.end67.loopexit

for.body36.us.us:                                 ; preds = %for.body36.us.us.preheader, %for.cond42.for.inc62_crit_edge.us.us
  %indvars.iv101 = phi i64 [ %indvars.iv.next102, %for.cond42.for.inc62_crit_edge.us.us ], [ 0, %for.body36.us.us.preheader ]
  %arrayidx40.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv105, i64 %indvars.iv101
  %51 = load double, double* %arrayidx40.us.us, align 8
  %mul41.us.us = fmul double %51, %beta
  store double %mul41.us.us, double* %arrayidx40.us.us, align 8
  br i1 %lcmp.mod126, label %for.inc59.us.us.prol.loopexit, label %for.inc59.us.us.prol

for.inc59.us.us.prol:                             ; preds = %for.body36.us.us
  %52 = load double, double* %arrayidx48.us.us.prol, align 8
  %arrayidx52.us.us.prol = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 0, i64 %indvars.iv101
  %53 = load double, double* %arrayidx52.us.us.prol, align 8
  %mul53.us.us.prol = fmul double %52, %53
  %add58.us.us.prol = fadd double %mul41.us.us, %mul53.us.us.prol
  store double %add58.us.us.prol, double* %arrayidx40.us.us, align 8
  br label %for.inc59.us.us.prol.loopexit

for.inc59.us.us.prol.loopexit:                    ; preds = %for.inc59.us.us.prol, %for.body36.us.us
  %54 = phi double [ %add58.us.us.prol, %for.inc59.us.us.prol ], [ %mul41.us.us, %for.body36.us.us ]
  %indvars.iv97.unr.ph = phi i64 [ 1, %for.inc59.us.us.prol ], [ 0, %for.body36.us.us ]
  br i1 %22, label %for.cond42.for.inc62_crit_edge.us.us, label %for.inc59.us.us.preheader

for.inc59.us.us.preheader:                        ; preds = %for.inc59.us.us.prol.loopexit
  br label %for.inc59.us.us

for.cond42.for.inc62_crit_edge.us.us.loopexit:    ; preds = %for.inc59.us.us
  br label %for.cond42.for.inc62_crit_edge.us.us

for.cond42.for.inc62_crit_edge.us.us:             ; preds = %for.cond42.for.inc62_crit_edge.us.us.loopexit, %for.inc59.us.us.prol.loopexit
  %indvars.iv.next102 = add nuw nsw i64 %indvars.iv101, 1
  %exitcond = icmp eq i64 %indvars.iv.next102, %wide.trip.count.3
  br i1 %exitcond, label %for.cond34.for.inc65_crit_edge.us.loopexit, label %for.body36.us.us

for.inc59.us.us:                                  ; preds = %for.inc59.us.us.preheader, %for.inc59.us.us
  %55 = phi double [ %add58.us.us.1, %for.inc59.us.us ], [ %54, %for.inc59.us.us.preheader ]
  %indvars.iv97 = phi i64 [ %indvars.iv.next98.1, %for.inc59.us.us ], [ %indvars.iv97.unr.ph, %for.inc59.us.us.preheader ]
  %arrayidx48.us.us = getelementptr inbounds [900 x double], [900 x double]* %tmp, i64 %indvars.iv105, i64 %indvars.iv97
  %56 = load double, double* %arrayidx48.us.us, align 8
  %arrayidx52.us.us = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv97, i64 %indvars.iv101
  %57 = load double, double* %arrayidx52.us.us, align 8
  %mul53.us.us = fmul double %56, %57
  %add58.us.us = fadd double %55, %mul53.us.us
  store double %add58.us.us, double* %arrayidx40.us.us, align 8
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %arrayidx48.us.us.1 = getelementptr inbounds [900 x double], [900 x double]* %tmp, i64 %indvars.iv105, i64 %indvars.iv.next98
  %58 = load double, double* %arrayidx48.us.us.1, align 8
  %arrayidx52.us.us.1 = getelementptr inbounds [1200 x double], [1200 x double]* %C, i64 %indvars.iv.next98, i64 %indvars.iv101
  %59 = load double, double* %arrayidx52.us.us.1, align 8
  %mul53.us.us.1 = fmul double %58, %59
  %add58.us.us.1 = fadd double %add58.us.us, %mul53.us.us.1
  store double %add58.us.us.1, double* %arrayidx40.us.us, align 8
  %indvars.iv.next98.1 = add nuw nsw i64 %indvars.iv97, 2
  %exitcond100.1 = icmp eq i64 %indvars.iv.next98.1, %0
  br i1 %exitcond100.1, label %for.cond42.for.inc62_crit_edge.us.us.loopexit, label %for.inc59.us.us

for.end67.loopexit:                               ; preds = %for.cond34.for.inc65_crit_edge.us
  br label %for.end67

for.end67:                                        ; preds = %for.end67.loopexit, %for.body33.lr.ph, %entry
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %ni, i32 %nl, [1200 x double]* %D) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %cmp4 = icmp sgt i32 %ni, 0
  br i1 %cmp4, label %for.body.lr.ph, label %for.end12

for.body.lr.ph:                                   ; preds = %entry
  %3 = zext i32 %nl to i64
  %cmp32 = icmp sgt i32 %nl, 0
  %4 = sext i32 %ni to i64
  br i1 %cmp32, label %for.body.us.preheader, label %for.end12

for.body.us.preheader:                            ; preds = %for.body.lr.ph
  br label %for.body.us

for.body.us:                                      ; preds = %for.body.us.preheader, %for.cond2.for.inc10_crit_edge.us
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %for.cond2.for.inc10_crit_edge.us ], [ 0, %for.body.us.preheader ]
  %5 = mul nsw i64 %indvars.iv10, %4
  br label %for.body4.us

for.body4.us:                                     ; preds = %for.inc.us, %for.body.us
  %indvars.iv = phi i64 [ 0, %for.body.us ], [ %indvars.iv.next, %for.inc.us ]
  %6 = add nsw i64 %5, %indvars.iv
  %7 = trunc i64 %6 to i32
  %rem.us = srem i32 %7, 20
  %cmp5.us = icmp eq i32 %rem.us, 0
  br i1 %cmp5.us, label %if.then.us, label %for.inc.us

if.then.us:                                       ; preds = %for.body4.us
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #6
  br label %for.inc.us

for.inc.us:                                       ; preds = %if.then.us, %for.body4.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx8.us = getelementptr inbounds [1200 x double], [1200 x double]* %D, i64 %indvars.iv10, i64 %indvars.iv
  %10 = load double, double* %arrayidx8.us, align 8
  %call9.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next, %3
  br i1 %exitcond13, label %for.cond2.for.inc10_crit_edge.us, label %for.body4.us

for.cond2.for.inc10_crit_edge.us:                 ; preds = %for.inc.us
  %indvars.iv.next11 = add nsw i64 %indvars.iv10, 1
  %cmp.us = icmp slt i64 %indvars.iv.next11, %4
  br i1 %cmp.us, label %for.body.us, label %for.end12.loopexit

for.end12.loopexit:                               ; preds = %for.cond2.for.inc10_crit_edge.us
  br label %for.end12

for.end12:                                        ; preds = %for.end12.loopexit, %for.body.lr.ph, %entry
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %12) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
