; ModuleID = 'A.ll'
source_filename = "doitgen.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline norecurse nounwind uwtable
define void @kernel_doitgen(i32 %nr, i32 %nq, i32 %np, [140 x [160 x double]]* nocapture %A, [160 x double]* nocapture readonly %C4, double* nocapture %sum) #0 {
entry:
  %cmp30 = icmp sgt i32 %nr, 0
  br i1 %cmp30, label %for.cond1.preheader.lr.ph, label %for.end44

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %0 = zext i32 %np to i64
  %1 = add nsw i64 %0, -1
  %2 = icmp sgt i32 %nq, 0
  %3 = icmp sgt i32 %np, 0
  %xtraiter61 = and i64 %0, 1
  %lcmp.mod62 = icmp eq i64 %xtraiter61, 0
  %4 = icmp eq i64 %1, 0
  %sunkaddr69 = ptrtoint double* %sum to i64
  %sunkaddr = ptrtoint double* %sum to i64
  %xtraiter63 = and i64 %0, 3
  %lcmp.mod64 = icmp eq i64 %xtraiter63, 0
  %5 = icmp ult i64 %1, 3
  %wide.trip.count59 = zext i32 %nq to i64
  %wide.trip.count36 = zext i32 %nq to i64
  %6 = add nsw i64 %wide.trip.count36, -1
  %xtraiter = and i64 %wide.trip.count36, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %7 = icmp ult i64 %6, 7
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.lr.ph, %for.end41
  %8 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc43, %for.end41 ]
  br i1 %2, label %for.cond4.preheader.lr.ph, label %for.end41

for.cond4.preheader.lr.ph:                        ; preds = %for.cond1.preheader
  %idxprom10 = sext i32 %8 to i64
  br i1 %3, label %for.body6.us.us.preheader.preheader, label %for.end38.preheader

for.end38.preheader:                              ; preds = %for.cond4.preheader.lr.ph
  br i1 %lcmp.mod, label %for.end38.prol.loopexit, label %for.end38.prol.preheader

for.end38.prol.preheader:                         ; preds = %for.end38.preheader
  br label %for.end38.prol

for.end38.prol:                                   ; preds = %for.end38.prol, %for.end38.prol.preheader
  %indvars.iv34.prol = phi i64 [ %indvars.iv.next35.prol, %for.end38.prol ], [ 0, %for.end38.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.end38.prol ], [ %xtraiter, %for.end38.prol.preheader ]
  %indvars.iv.next35.prol = add nuw nsw i64 %indvars.iv34.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.end38.prol.loopexit.unr-lcssa, label %for.end38.prol, !llvm.loop !1

for.end38.prol.loopexit.unr-lcssa:                ; preds = %for.end38.prol
  br label %for.end38.prol.loopexit

for.end38.prol.loopexit:                          ; preds = %for.end38.preheader, %for.end38.prol.loopexit.unr-lcssa
  %indvars.iv34.unr = phi i64 [ 0, %for.end38.preheader ], [ %indvars.iv.next35.prol, %for.end38.prol.loopexit.unr-lcssa ]
  br i1 %7, label %for.end41.loopexit75, label %for.end38.preheader.new

for.end38.preheader.new:                          ; preds = %for.end38.prol.loopexit
  br label %for.end38

for.body6.us.us.preheader.preheader:              ; preds = %for.cond4.preheader.lr.ph
  br label %for.body6.us.us.preheader

for.body6.us.us.preheader:                        ; preds = %for.body6.us.us.preheader.preheader, %for.end38.us
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %for.end38.us ], [ 0, %for.body6.us.us.preheader.preheader ]
  %arrayidx15.us.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom10, i64 %indvars.iv57, i64 0
  br label %for.body6.us.us

for.end38.us.loopexit:                            ; preds = %for.body27.us
  br label %for.end38.us

for.end38.us:                                     ; preds = %for.end38.us.loopexit, %for.body27.us.prol.loopexit
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next58, %wide.trip.count59
  br i1 %exitcond60, label %for.end41.loopexit, label %for.body6.us.us.preheader

for.body27.us:                                    ; preds = %for.body27.us.preheader, %for.body27.us
  %indvars.iv51 = phi i64 [ %indvars.iv.next52.3, %for.body27.us ], [ %indvars.iv51.unr, %for.body27.us.preheader ]
  %arrayidx29.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv51
  %9 = bitcast double* %arrayidx29.us to i64*
  %10 = load i64, i64* %9, align 8
  %arrayidx35.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom10, i64 %indvars.iv57, i64 %indvars.iv51
  %11 = bitcast double* %arrayidx35.us to i64*
  store i64 %10, i64* %11, align 8
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %arrayidx29.us.1 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next52
  %12 = bitcast double* %arrayidx29.us.1 to i64*
  %13 = load i64, i64* %12, align 8
  %arrayidx35.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom10, i64 %indvars.iv57, i64 %indvars.iv.next52
  %14 = bitcast double* %arrayidx35.us.1 to i64*
  store i64 %13, i64* %14, align 8
  %indvars.iv.next52.1 = add nsw i64 %indvars.iv51, 2
  %arrayidx29.us.2 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next52.1
  %15 = bitcast double* %arrayidx29.us.2 to i64*
  %16 = load i64, i64* %15, align 8
  %arrayidx35.us.2 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom10, i64 %indvars.iv57, i64 %indvars.iv.next52.1
  %17 = bitcast double* %arrayidx35.us.2 to i64*
  store i64 %16, i64* %17, align 8
  %indvars.iv.next52.2 = add nsw i64 %indvars.iv51, 3
  %arrayidx29.us.3 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next52.2
  %18 = bitcast double* %arrayidx29.us.3 to i64*
  %19 = load i64, i64* %18, align 8
  %arrayidx35.us.3 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom10, i64 %indvars.iv57, i64 %indvars.iv.next52.2
  %20 = bitcast double* %arrayidx35.us.3 to i64*
  store i64 %19, i64* %20, align 8
  %indvars.iv.next52.3 = add nsw i64 %indvars.iv51, 4
  %exitcond54.3 = icmp eq i64 %indvars.iv.next52.3, %0
  br i1 %exitcond54.3, label %for.end38.us.loopexit, label %for.body27.us

for.body6.us.us:                                  ; preds = %for.cond7.for.end_crit_edge.us.us, %for.body6.us.us.preheader
  %indvars.iv47 = phi i64 [ 0, %for.body6.us.us.preheader ], [ %indvars.iv.next48, %for.cond7.for.end_crit_edge.us.us ]
  %arrayidx.us.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv47
  store double 0.000000e+00, double* %arrayidx.us.us, align 8
  br i1 %lcmp.mod62, label %for.body9.us.us.prol.loopexit.unr-lcssa, label %for.body9.us.us.prol.preheader

for.body9.us.us.prol.preheader:                   ; preds = %for.body6.us.us
  %21 = load double, double* %arrayidx15.us.us.prol, align 8
  %arrayidx19.us.us.prol = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 0, i64 %indvars.iv47
  %22 = load double, double* %arrayidx19.us.us.prol, align 8
  %mul.us.us.prol = fmul double %21, %22
  %add.us.us.prol = fadd double %mul.us.us.prol, 0.000000e+00
  %sunkaddr66 = shl i64 %indvars.iv47, 3
  %sunkaddr67 = add i64 %sunkaddr, %sunkaddr66
  %sunkaddr68 = inttoptr i64 %sunkaddr67 to double*
  store double %add.us.us.prol, double* %sunkaddr68, align 8
  br label %for.body9.us.us.prol.loopexit.unr-lcssa

for.body9.us.us.prol.loopexit.unr-lcssa:          ; preds = %for.body6.us.us, %for.body9.us.us.prol.preheader
  %indvars.iv43.unr.ph = phi i64 [ 1, %for.body9.us.us.prol.preheader ], [ 0, %for.body6.us.us ]
  %.unr.ph = phi double [ %add.us.us.prol, %for.body9.us.us.prol.preheader ], [ 0.000000e+00, %for.body6.us.us ]
  br i1 %4, label %for.cond7.for.end_crit_edge.us.us, label %for.body9.us.us.preheader

for.body9.us.us.preheader:                        ; preds = %for.body9.us.us.prol.loopexit.unr-lcssa
  %sunkaddr70 = shl i64 %indvars.iv47, 3
  %sunkaddr71 = add i64 %sunkaddr69, %sunkaddr70
  %sunkaddr72 = inttoptr i64 %sunkaddr71 to double*
  br label %for.body9.us.us

for.cond7.for.end_crit_edge.us.us.loopexit:       ; preds = %for.body9.us.us
  br label %for.cond7.for.end_crit_edge.us.us

for.cond7.for.end_crit_edge.us.us:                ; preds = %for.cond7.for.end_crit_edge.us.us.loopexit, %for.body9.us.us.prol.loopexit.unr-lcssa
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next48, %0
  br i1 %exitcond50, label %for.body27.lr.ph.us, label %for.body6.us.us

for.body9.us.us:                                  ; preds = %for.body9.us.us.preheader, %for.body9.us.us
  %indvars.iv43 = phi i64 [ %indvars.iv.next44.1, %for.body9.us.us ], [ %indvars.iv43.unr.ph, %for.body9.us.us.preheader ]
  %23 = phi double [ %add.us.us.1, %for.body9.us.us ], [ %.unr.ph, %for.body9.us.us.preheader ]
  %arrayidx15.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom10, i64 %indvars.iv57, i64 %indvars.iv43
  %24 = load double, double* %arrayidx15.us.us, align 8
  %arrayidx19.us.us = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv43, i64 %indvars.iv47
  %25 = load double, double* %arrayidx19.us.us, align 8
  %mul.us.us = fmul double %24, %25
  %add.us.us = fadd double %23, %mul.us.us
  store double %add.us.us, double* %sunkaddr72, align 8
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %arrayidx15.us.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom10, i64 %indvars.iv57, i64 %indvars.iv.next44
  %26 = load double, double* %arrayidx15.us.us.1, align 8
  %arrayidx19.us.us.1 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv.next44, i64 %indvars.iv47
  %27 = load double, double* %arrayidx19.us.us.1, align 8
  %mul.us.us.1 = fmul double %26, %27
  %add.us.us.1 = fadd double %add.us.us, %mul.us.us.1
  store double %add.us.us.1, double* %sunkaddr72, align 8
  %indvars.iv.next44.1 = add nsw i64 %indvars.iv43, 2
  %exitcond46.1 = icmp eq i64 %indvars.iv.next44.1, %0
  br i1 %exitcond46.1, label %for.cond7.for.end_crit_edge.us.us.loopexit, label %for.body9.us.us

for.body27.lr.ph.us:                              ; preds = %for.cond7.for.end_crit_edge.us.us
  br i1 %lcmp.mod64, label %for.body27.us.prol.loopexit, label %for.body27.us.prol.preheader

for.body27.us.prol.preheader:                     ; preds = %for.body27.lr.ph.us
  br label %for.body27.us.prol

for.body27.us.prol:                               ; preds = %for.body27.us.prol.preheader, %for.body27.us.prol
  %indvars.iv51.prol = phi i64 [ %indvars.iv.next52.prol, %for.body27.us.prol ], [ 0, %for.body27.us.prol.preheader ]
  %prol.iter65 = phi i64 [ %prol.iter65.sub, %for.body27.us.prol ], [ %xtraiter63, %for.body27.us.prol.preheader ]
  %arrayidx29.us.prol = getelementptr inbounds double, double* %sum, i64 %indvars.iv51.prol
  %28 = bitcast double* %arrayidx29.us.prol to i64*
  %29 = load i64, i64* %28, align 8
  %arrayidx35.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom10, i64 %indvars.iv57, i64 %indvars.iv51.prol
  %30 = bitcast double* %arrayidx35.us.prol to i64*
  store i64 %29, i64* %30, align 8
  %indvars.iv.next52.prol = add nuw nsw i64 %indvars.iv51.prol, 1
  %prol.iter65.sub = add i64 %prol.iter65, -1
  %prol.iter65.cmp = icmp eq i64 %prol.iter65.sub, 0
  br i1 %prol.iter65.cmp, label %for.body27.us.prol.loopexit.loopexit, label %for.body27.us.prol, !llvm.loop !3

for.body27.us.prol.loopexit.loopexit:             ; preds = %for.body27.us.prol
  br label %for.body27.us.prol.loopexit

for.body27.us.prol.loopexit:                      ; preds = %for.body27.us.prol.loopexit.loopexit, %for.body27.lr.ph.us
  %indvars.iv51.unr = phi i64 [ 0, %for.body27.lr.ph.us ], [ %indvars.iv.next52.prol, %for.body27.us.prol.loopexit.loopexit ]
  br i1 %5, label %for.end38.us, label %for.body27.us.preheader

for.body27.us.preheader:                          ; preds = %for.body27.us.prol.loopexit
  br label %for.body27.us

for.end38:                                        ; preds = %for.end38, %for.end38.preheader.new
  %indvars.iv34 = phi i64 [ %indvars.iv34.unr, %for.end38.preheader.new ], [ %indvars.iv.next35.7, %for.end38 ]
  %indvars.iv.next35.7 = add nsw i64 %indvars.iv34, 8
  %exitcond37.7 = icmp eq i64 %indvars.iv.next35.7, %wide.trip.count36
  br i1 %exitcond37.7, label %for.end41.loopexit75.unr-lcssa, label %for.end38

for.end41.loopexit:                               ; preds = %for.end38.us
  br label %for.end41

for.end41.loopexit75.unr-lcssa:                   ; preds = %for.end38
  br label %for.end41.loopexit75

for.end41.loopexit75:                             ; preds = %for.end38.prol.loopexit, %for.end41.loopexit75.unr-lcssa
  br label %for.end41

for.end41:                                        ; preds = %for.end41.loopexit75, %for.end41.loopexit, %for.cond1.preheader
  %inc43 = add nsw i32 %8, 1
  %cmp = icmp slt i32 %inc43, %nr
  br i1 %cmp, label %for.cond1.preheader, label %for.end44.loopexit

for.end44.loopexit:                               ; preds = %for.end41
  br label %for.end44

for.end44:                                        ; preds = %for.end44.loopexit, %entry
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #1 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %arraydecay = bitcast i8* %call to [140 x [160 x double]]*
  %arraydecay3 = bitcast i8* %call2 to [160 x double]*
  tail call void @init_array([140 x [160 x double]]* %arraydecay, [160 x double]* %arraydecay3)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay6 = bitcast i8* %call1 to double*
  tail call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %arraydecay, [160 x double]* %arraydecay3, double* %arraydecay6)
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
  %1 = bitcast i8* %call to [140 x [160 x double]]*
  tail call void @print_array([140 x [160 x double]]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array([140 x [160 x double]]* nocapture %A, [160 x double]* nocapture %C4) #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end14, %entry
  %indvars.iv13 = phi i64 [ 0, %entry ], [ %indvars.iv.next14, %for.end14 ]
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.end, %for.cond1.preheader
  %indvars.iv9 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next10, %for.end ]
  %0 = mul nuw nsw i64 %indvars.iv9, %indvars.iv13
  br label %for.body6

for.body6:                                        ; preds = %for.body6, %for.cond4.preheader
  %indvars.iv5 = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next6.1, %for.body6 ]
  %1 = add nuw nsw i64 %indvars.iv5, %0
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 160
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 1.600000e+02
  %arrayidx11 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv13, i64 %indvars.iv9, i64 %indvars.iv5
  store double %div, double* %arrayidx11, align 8
  %indvars.iv.next6 = or i64 %indvars.iv5, 1
  %3 = add nuw nsw i64 %indvars.iv.next6, %0
  %4 = trunc i64 %3 to i32
  %rem.1 = srem i32 %4, 160
  %conv.1 = sitofp i32 %rem.1 to double
  %div.1 = fdiv double %conv.1, 1.600000e+02
  %arrayidx11.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv13, i64 %indvars.iv9, i64 %indvars.iv.next6
  store double %div.1, double* %arrayidx11.1, align 8
  %indvars.iv.next6.1 = add nsw i64 %indvars.iv5, 2
  %exitcond8.1 = icmp eq i64 %indvars.iv.next6.1, 160
  br i1 %exitcond8.1, label %for.end, label %for.body6

for.end:                                          ; preds = %for.body6
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next10, 140
  br i1 %exitcond12, label %for.end14, label %for.cond4.preheader

for.end14:                                        ; preds = %for.end
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 150
  br i1 %exitcond15, label %for.cond22.preheader.preheader, label %for.cond1.preheader

for.cond22.preheader.preheader:                   ; preds = %for.end14
  br label %for.cond22.preheader

for.cond22.preheader:                             ; preds = %for.cond22.preheader.preheader, %for.end37
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %for.end37 ], [ 0, %for.cond22.preheader.preheader ]
  br label %for.body25

for.body25:                                       ; preds = %for.body25, %for.cond22.preheader
  %indvars.iv = phi i64 [ 0, %for.cond22.preheader ], [ %indvars.iv.next.1, %for.body25 ]
  %5 = mul nuw nsw i64 %indvars.iv, %indvars.iv2
  %6 = trunc i64 %5 to i32
  %rem27 = srem i32 %6, 160
  %conv28 = sitofp i32 %rem27 to double
  %div30 = fdiv double %conv28, 1.600000e+02
  %arrayidx34 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv2, i64 %indvars.iv
  store double %div30, double* %arrayidx34, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %7 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv2
  %8 = trunc i64 %7 to i32
  %rem27.1 = srem i32 %8, 160
  %conv28.1 = sitofp i32 %rem27.1 to double
  %div30.1 = fdiv double %conv28.1, 1.600000e+02
  %arrayidx34.1 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv2, i64 %indvars.iv.next
  store double %div30.1, double* %arrayidx34.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %for.end37, label %for.body25

for.end37:                                        ; preds = %for.body25
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next3, 160
  br i1 %exitcond4, label %for.end40, label %for.cond22.preheader

for.end40:                                        ; preds = %for.end37
  ret void
}

declare void @polybench_timer_start(...) #2

declare void @polybench_timer_stop(...) #2

declare void @polybench_timer_print(...) #2

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([140 x [160 x double]]* nocapture readonly %A) #1 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.end20, %entry
  %indvars.iv8 = phi i64 [ 0, %entry ], [ %indvars.iv.next9, %for.end20 ]
  %3 = mul nuw nsw i64 %indvars.iv8, 140
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.end, %for.cond2.preheader
  %indvars.iv3 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next4, %for.end ]
  %4 = add nuw nsw i64 %indvars.iv3, %3
  %5 = mul nuw nsw i64 %4, 160
  br label %for.body7

for.body7:                                        ; preds = %if.end, %for.cond5.preheader
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader ], [ %indvars.iv.next, %if.end ]
  %6 = add nuw nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %rem = srem i32 %7, 20
  %cmp11 = icmp eq i32 %rem, 0
  br i1 %cmp11, label %if.then, label %if.end

if.then:                                          ; preds = %for.body7
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body7
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv8, i64 %indvars.iv3, i64 %indvars.iv
  %10 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond, label %for.end, label %for.body7

for.end:                                          ; preds = %if.end
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next4, 140
  br i1 %exitcond7, label %for.end20, label %for.cond5.preheader

for.end20:                                        ; preds = %for.end
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next9, 150
  br i1 %exitcond11, label %for.end23, label %for.cond2.preheader

for.end23:                                        ; preds = %for.end20
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %12) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
