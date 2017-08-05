; ModuleID = 'A.ll'
source_filename = "doitgen.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define void @kernel_doitgen(i32 %nr, i32 %nq, i32 %np, [140 x [160 x double]]* nocapture %A, [160 x double]* nocapture readonly %C4, double* nocapture %sum) local_unnamed_addr #0 {
entry:
  %0 = sext i32 %nq to i64
  %cmp54 = icmp sgt i32 %nr, 0
  br i1 %cmp54, label %for.cond1.preheader.lr.ph, label %entry.for.end44_crit_edge

entry.for.end44_crit_edge:                        ; preds = %entry
  br label %for.end44

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %1 = sext i32 %np to i64
  %2 = shl nsw i64 %1, 3
  %3 = add nsw i64 %1, -1
  %xtraiter67 = and i64 %1, 1
  %xtraiter69 = and i64 %1, 3
  %xtraiter = and i64 %1, 3
  %4 = icmp sgt i32 %nq, 0
  %5 = icmp sgt i32 %np, 0
  %6 = icmp sgt i32 %np, 0
  %7 = icmp eq i64 %xtraiter67, 0
  %8 = icmp eq i64 %3, 0
  %sunkaddr = ptrtoint double* %sum to i64
  %9 = ptrtoint double* %sum to i64
  %10 = icmp sgt i32 %np, 0
  %11 = icmp eq i64 %xtraiter69, 0
  %12 = icmp ult i64 %3, 3
  %13 = bitcast double* %sum to i8*
  %14 = icmp sgt i32 %np, 0
  %15 = icmp eq i64 %xtraiter, 0
  %16 = icmp ult i64 %3, 3
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end41.for.cond1.preheader_crit_edge, %for.cond1.preheader.lr.ph
  %17 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc43, %for.end41.for.cond1.preheader_crit_edge ]
  br i1 %4, label %for.cond4.preheader.lr.ph, label %for.cond1.preheader.for.end41_crit_edge

for.cond1.preheader.for.end41_crit_edge:          ; preds = %for.cond1.preheader
  br label %for.end41

for.cond4.preheader.lr.ph:                        ; preds = %for.cond1.preheader
  %idxprom10 = sext i32 %17 to i64
  br i1 %5, label %for.cond4.preheader.lr.ph.for.cond4.preheader.us_crit_edge, label %for.cond4.preheader.preheader

for.cond4.preheader.lr.ph.for.cond4.preheader.us_crit_edge: ; preds = %for.cond4.preheader.lr.ph
  br label %for.cond4.preheader.us

for.cond4.preheader.preheader:                    ; preds = %for.cond4.preheader.lr.ph
  %idxprom30 = sext i32 %17 to i64
  br label %for.cond4.preheader

for.cond4.preheader.us:                           ; preds = %for.end38.us.for.cond4.preheader.us_crit_edge, %for.cond4.preheader.lr.ph.for.cond4.preheader.us_crit_edge
  %18 = phi i32 [ %split23.us, %for.end38.us.for.cond4.preheader.us_crit_edge ], [ %17, %for.cond4.preheader.lr.ph.for.cond4.preheader.us_crit_edge ]
  %indvars.iv1427.us = phi i64 [ %indvars.iv.next15.us, %for.end38.us.for.cond4.preheader.us_crit_edge ], [ 0, %for.cond4.preheader.lr.ph.for.cond4.preheader.us_crit_edge ]
  br i1 %6, label %for.body6.us.us.preheader, label %for.cond4.for.cond25.preheader_crit_edge.us.loopexit55

for.body6.us.us.preheader:                        ; preds = %for.cond4.preheader.us
  %arrayidx15.us.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom10, i64 %indvars.iv1427.us, i64 0
  br label %for.body6.us.us

for.end38.us:                                     ; preds = %for.body27.us.prol.loopexit.for.end38.us_crit_edge, %for.cond4.for.cond25.preheader_crit_edge.us.for.end38.us_crit_edge, %for.body27.us.for.end38.us_crit_edge
  %indvars.iv.next15.us = add nuw nsw i64 %indvars.iv1427.us, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next15.us, %0
  br i1 %exitcond66, label %for.end38.us.for.end41_crit_edge, label %for.end38.us.for.cond4.preheader.us_crit_edge

for.end38.us.for.cond4.preheader.us_crit_edge:    ; preds = %for.end38.us
  br label %for.cond4.preheader.us

for.end38.us.for.end41_crit_edge:                 ; preds = %for.end38.us
  br label %for.end41

for.body27.us:                                    ; preds = %for.body27.us.prol.loopexit.for.body27.us_crit_edge, %for.body27.us.for.body27.us_crit_edge
  %indvars.iv1225.us = phi i64 [ %indvars.iv.next13.us.3, %for.body27.us.for.body27.us_crit_edge ], [ %indvars.iv1225.us.unr, %for.body27.us.prol.loopexit.for.body27.us_crit_edge ]
  %arrayidx29.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv1225.us
  %19 = bitcast double* %arrayidx29.us to i64*
  %20 = load i64, i64* %19, align 8
  %arrayidx35.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv1427.us, i64 %indvars.iv1225.us
  %21 = bitcast double* %arrayidx35.us to i64*
  store i64 %20, i64* %21, align 8
  %indvars.iv.next13.us = add nuw nsw i64 %indvars.iv1225.us, 1
  %arrayidx29.us.1 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next13.us
  %22 = bitcast double* %arrayidx29.us.1 to i64*
  %23 = load i64, i64* %22, align 8
  %arrayidx35.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv1427.us, i64 %indvars.iv.next13.us
  %24 = bitcast double* %arrayidx35.us.1 to i64*
  store i64 %23, i64* %24, align 8
  %indvars.iv.next13.us.1 = add nsw i64 %indvars.iv1225.us, 2
  %arrayidx29.us.2 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next13.us.1
  %25 = bitcast double* %arrayidx29.us.2 to i64*
  %26 = load i64, i64* %25, align 8
  %arrayidx35.us.2 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv1427.us, i64 %indvars.iv.next13.us.1
  %27 = bitcast double* %arrayidx35.us.2 to i64*
  store i64 %26, i64* %27, align 8
  %indvars.iv.next13.us.2 = add nsw i64 %indvars.iv1225.us, 3
  %arrayidx29.us.3 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next13.us.2
  %28 = bitcast double* %arrayidx29.us.3 to i64*
  %29 = load i64, i64* %28, align 8
  %arrayidx35.us.3 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv1427.us, i64 %indvars.iv.next13.us.2
  %30 = bitcast double* %arrayidx35.us.3 to i64*
  store i64 %29, i64* %30, align 8
  %indvars.iv.next13.us.3 = add nsw i64 %indvars.iv1225.us, 4
  %exitcond63.3 = icmp eq i64 %indvars.iv.next13.us.3, %1
  br i1 %exitcond63.3, label %for.body27.us.for.end38.us_crit_edge, label %for.body27.us.for.body27.us_crit_edge

for.body27.us.for.body27.us_crit_edge:            ; preds = %for.body27.us
  br label %for.body27.us

for.body27.us.for.end38.us_crit_edge:             ; preds = %for.body27.us
  br label %for.end38.us

for.cond4.for.cond25.preheader_crit_edge.us.loopexit55: ; preds = %for.cond4.preheader.us
  call void @llvm.memset.p0i8.i64(i8* %13, i8 0, i64 %2, i32 8, i1 false)
  br label %for.cond4.for.cond25.preheader_crit_edge.us

for.cond4.for.cond25.preheader_crit_edge.us:      ; preds = %for.cond7.for.end_crit_edge.us.us.for.cond4.for.cond25.preheader_crit_edge.us_crit_edge, %for.cond4.for.cond25.preheader_crit_edge.us.loopexit55
  %split23.us = phi i32 [ %18, %for.cond4.for.cond25.preheader_crit_edge.us.loopexit55 ], [ %17, %for.cond7.for.end_crit_edge.us.us.for.cond4.for.cond25.preheader_crit_edge.us_crit_edge ]
  br i1 %10, label %for.body27.lr.ph.us, label %for.cond4.for.cond25.preheader_crit_edge.us.for.end38.us_crit_edge

for.cond4.for.cond25.preheader_crit_edge.us.for.end38.us_crit_edge: ; preds = %for.cond4.for.cond25.preheader_crit_edge.us
  br label %for.end38.us

for.body6.us.us:                                  ; preds = %for.cond7.for.end_crit_edge.us.us.for.body6.us.us_crit_edge, %for.body6.us.us.preheader
  %indvars.iv1021.us.us = phi i64 [ %indvars.iv.next11.us.us, %for.cond7.for.end_crit_edge.us.us.for.body6.us.us_crit_edge ], [ 0, %for.body6.us.us.preheader ]
  %arrayidx.us.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv1021.us.us
  store double 0.000000e+00, double* %arrayidx.us.us, align 8
  br i1 %7, label %for.body6.us.us.for.body9.us.us.prol.loopexit_crit_edge, label %for.body9.us.us.prol

for.body6.us.us.for.body9.us.us.prol.loopexit_crit_edge: ; preds = %for.body6.us.us
  br label %for.body9.us.us.prol.loopexit

for.body9.us.us.prol:                             ; preds = %for.body6.us.us
  %31 = load double, double* %arrayidx15.us.us.prol, align 8
  %arrayidx19.us.us.prol = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 0, i64 %indvars.iv1021.us.us
  %32 = load double, double* %arrayidx19.us.us.prol, align 8
  %mul.us.us.prol = fmul double %31, %32
  %add.us.us.prol = fadd double %mul.us.us.prol, 0.000000e+00
  %sunkaddr72 = shl i64 %indvars.iv1021.us.us, 3
  %sunkaddr73 = add i64 %9, %sunkaddr72
  %sunkaddr74 = inttoptr i64 %sunkaddr73 to double*
  store double %add.us.us.prol, double* %sunkaddr74, align 8
  br label %for.body9.us.us.prol.loopexit

for.body9.us.us.prol.loopexit:                    ; preds = %for.body6.us.us.for.body9.us.us.prol.loopexit_crit_edge, %for.body9.us.us.prol
  %.unr.ph = phi double [ %add.us.us.prol, %for.body9.us.us.prol ], [ 0.000000e+00, %for.body6.us.us.for.body9.us.us.prol.loopexit_crit_edge ]
  %indvars.iv19.us.us.unr.ph = phi i64 [ 1, %for.body9.us.us.prol ], [ 0, %for.body6.us.us.for.body9.us.us.prol.loopexit_crit_edge ]
  br i1 %8, label %for.body9.us.us.prol.loopexit.for.cond7.for.end_crit_edge.us.us_crit_edge, label %for.body9.us.us.prol.loopexit.for.body9.us.us_crit_edge

for.body9.us.us.prol.loopexit.for.body9.us.us_crit_edge: ; preds = %for.body9.us.us.prol.loopexit
  %sunkaddr80 = shl i64 %indvars.iv1021.us.us, 3
  %sunkaddr81 = add i64 %sunkaddr, %sunkaddr80
  %sunkaddr82 = inttoptr i64 %sunkaddr81 to double*
  br label %for.body9.us.us

for.body9.us.us.prol.loopexit.for.cond7.for.end_crit_edge.us.us_crit_edge: ; preds = %for.body9.us.us.prol.loopexit
  br label %for.cond7.for.end_crit_edge.us.us

for.cond7.for.end_crit_edge.us.us:                ; preds = %for.body9.us.us.for.cond7.for.end_crit_edge.us.us_crit_edge, %for.body9.us.us.prol.loopexit.for.cond7.for.end_crit_edge.us.us_crit_edge
  %indvars.iv.next11.us.us = add nuw nsw i64 %indvars.iv1021.us.us, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next11.us.us, %1
  br i1 %exitcond62, label %for.cond7.for.end_crit_edge.us.us.for.cond4.for.cond25.preheader_crit_edge.us_crit_edge, label %for.cond7.for.end_crit_edge.us.us.for.body6.us.us_crit_edge

for.cond7.for.end_crit_edge.us.us.for.body6.us.us_crit_edge: ; preds = %for.cond7.for.end_crit_edge.us.us
  br label %for.body6.us.us

for.cond7.for.end_crit_edge.us.us.for.cond4.for.cond25.preheader_crit_edge.us_crit_edge: ; preds = %for.cond7.for.end_crit_edge.us.us
  br label %for.cond4.for.cond25.preheader_crit_edge.us

for.body9.us.us:                                  ; preds = %for.body9.us.us.for.body9.us.us_crit_edge, %for.body9.us.us.prol.loopexit.for.body9.us.us_crit_edge
  %33 = phi double [ %add.us.us.1, %for.body9.us.us.for.body9.us.us_crit_edge ], [ %.unr.ph, %for.body9.us.us.prol.loopexit.for.body9.us.us_crit_edge ]
  %indvars.iv19.us.us = phi i64 [ %indvars.iv.next.us.us.1, %for.body9.us.us.for.body9.us.us_crit_edge ], [ %indvars.iv19.us.us.unr.ph, %for.body9.us.us.prol.loopexit.for.body9.us.us_crit_edge ]
  %arrayidx15.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom10, i64 %indvars.iv1427.us, i64 %indvars.iv19.us.us
  %34 = load double, double* %arrayidx15.us.us, align 8
  %arrayidx19.us.us = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv19.us.us, i64 %indvars.iv1021.us.us
  %35 = load double, double* %arrayidx19.us.us, align 8
  %mul.us.us = fmul double %34, %35
  %add.us.us = fadd double %33, %mul.us.us
  store double %add.us.us, double* %sunkaddr82, align 8
  %indvars.iv.next.us.us = add nuw nsw i64 %indvars.iv19.us.us, 1
  %arrayidx15.us.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom10, i64 %indvars.iv1427.us, i64 %indvars.iv.next.us.us
  %36 = load double, double* %arrayidx15.us.us.1, align 8
  %arrayidx19.us.us.1 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv.next.us.us, i64 %indvars.iv1021.us.us
  %37 = load double, double* %arrayidx19.us.us.1, align 8
  %mul.us.us.1 = fmul double %36, %37
  %add.us.us.1 = fadd double %add.us.us, %mul.us.us.1
  store double %add.us.us.1, double* %sunkaddr82, align 8
  %indvars.iv.next.us.us.1 = add nsw i64 %indvars.iv19.us.us, 2
  %exitcond61.1 = icmp eq i64 %indvars.iv.next.us.us.1, %1
  br i1 %exitcond61.1, label %for.body9.us.us.for.cond7.for.end_crit_edge.us.us_crit_edge, label %for.body9.us.us.for.body9.us.us_crit_edge

for.body9.us.us.for.body9.us.us_crit_edge:        ; preds = %for.body9.us.us
  br label %for.body9.us.us

for.body9.us.us.for.cond7.for.end_crit_edge.us.us_crit_edge: ; preds = %for.body9.us.us
  br label %for.cond7.for.end_crit_edge.us.us

for.body27.lr.ph.us:                              ; preds = %for.cond4.for.cond25.preheader_crit_edge.us
  %idxprom30.us = sext i32 %split23.us to i64
  br i1 %11, label %for.body27.lr.ph.us.for.body27.us.prol.loopexit_crit_edge, label %for.body27.lr.ph.us.for.body27.us.prol_crit_edge

for.body27.lr.ph.us.for.body27.us.prol_crit_edge: ; preds = %for.body27.lr.ph.us
  br label %for.body27.us.prol

for.body27.lr.ph.us.for.body27.us.prol.loopexit_crit_edge: ; preds = %for.body27.lr.ph.us
  br label %for.body27.us.prol.loopexit

for.body27.us.prol:                               ; preds = %for.body27.us.prol.for.body27.us.prol_crit_edge, %for.body27.lr.ph.us.for.body27.us.prol_crit_edge
  %indvars.iv1225.us.prol = phi i64 [ %indvars.iv.next13.us.prol, %for.body27.us.prol.for.body27.us.prol_crit_edge ], [ 0, %for.body27.lr.ph.us.for.body27.us.prol_crit_edge ]
  %prol.iter71 = phi i64 [ %prol.iter71.sub, %for.body27.us.prol.for.body27.us.prol_crit_edge ], [ %xtraiter69, %for.body27.lr.ph.us.for.body27.us.prol_crit_edge ]
  %arrayidx29.us.prol = getelementptr inbounds double, double* %sum, i64 %indvars.iv1225.us.prol
  %38 = bitcast double* %arrayidx29.us.prol to i64*
  %39 = load i64, i64* %38, align 8
  %arrayidx35.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv1427.us, i64 %indvars.iv1225.us.prol
  %40 = bitcast double* %arrayidx35.us.prol to i64*
  store i64 %39, i64* %40, align 8
  %indvars.iv.next13.us.prol = add nuw nsw i64 %indvars.iv1225.us.prol, 1
  %prol.iter71.sub = add i64 %prol.iter71, -1
  %prol.iter71.cmp = icmp eq i64 %prol.iter71.sub, 0
  br i1 %prol.iter71.cmp, label %for.body27.us.prol.for.body27.us.prol.loopexit_crit_edge, label %for.body27.us.prol.for.body27.us.prol_crit_edge, !llvm.loop !1

for.body27.us.prol.for.body27.us.prol_crit_edge:  ; preds = %for.body27.us.prol
  br label %for.body27.us.prol

for.body27.us.prol.for.body27.us.prol.loopexit_crit_edge: ; preds = %for.body27.us.prol
  br label %for.body27.us.prol.loopexit

for.body27.us.prol.loopexit:                      ; preds = %for.body27.us.prol.for.body27.us.prol.loopexit_crit_edge, %for.body27.lr.ph.us.for.body27.us.prol.loopexit_crit_edge
  %indvars.iv1225.us.unr = phi i64 [ 0, %for.body27.lr.ph.us.for.body27.us.prol.loopexit_crit_edge ], [ %indvars.iv.next13.us.prol, %for.body27.us.prol.for.body27.us.prol.loopexit_crit_edge ]
  br i1 %12, label %for.body27.us.prol.loopexit.for.end38.us_crit_edge, label %for.body27.us.prol.loopexit.for.body27.us_crit_edge

for.body27.us.prol.loopexit.for.body27.us_crit_edge: ; preds = %for.body27.us.prol.loopexit
  br label %for.body27.us

for.body27.us.prol.loopexit.for.end38.us_crit_edge: ; preds = %for.body27.us.prol.loopexit
  br label %for.end38.us

for.cond4.preheader:                              ; preds = %for.end38.for.cond4.preheader_crit_edge, %for.cond4.preheader.preheader
  %indvars.iv1427 = phi i64 [ %indvars.iv.next15, %for.end38.for.cond4.preheader_crit_edge ], [ 0, %for.cond4.preheader.preheader ]
  br i1 %14, label %for.body27.lr.ph, label %for.cond4.preheader.for.end38_crit_edge

for.cond4.preheader.for.end38_crit_edge:          ; preds = %for.cond4.preheader
  br label %for.end38

for.body27.lr.ph:                                 ; preds = %for.cond4.preheader
  br i1 %15, label %for.body27.lr.ph.for.body27.prol.loopexit_crit_edge, label %for.body27.lr.ph.for.body27.prol_crit_edge

for.body27.lr.ph.for.body27.prol_crit_edge:       ; preds = %for.body27.lr.ph
  br label %for.body27.prol

for.body27.lr.ph.for.body27.prol.loopexit_crit_edge: ; preds = %for.body27.lr.ph
  br label %for.body27.prol.loopexit

for.body27.prol:                                  ; preds = %for.body27.prol.for.body27.prol_crit_edge, %for.body27.lr.ph.for.body27.prol_crit_edge
  %indvars.iv1225.prol = phi i64 [ %indvars.iv.next13.prol, %for.body27.prol.for.body27.prol_crit_edge ], [ 0, %for.body27.lr.ph.for.body27.prol_crit_edge ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body27.prol.for.body27.prol_crit_edge ], [ %xtraiter, %for.body27.lr.ph.for.body27.prol_crit_edge ]
  %arrayidx29.prol = getelementptr inbounds double, double* %sum, i64 %indvars.iv1225.prol
  %41 = bitcast double* %arrayidx29.prol to i64*
  %42 = load i64, i64* %41, align 8
  %arrayidx35.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30, i64 %indvars.iv1427, i64 %indvars.iv1225.prol
  %43 = bitcast double* %arrayidx35.prol to i64*
  store i64 %42, i64* %43, align 8
  %indvars.iv.next13.prol = add nuw nsw i64 %indvars.iv1225.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body27.prol.for.body27.prol.loopexit_crit_edge, label %for.body27.prol.for.body27.prol_crit_edge, !llvm.loop !3

for.body27.prol.for.body27.prol_crit_edge:        ; preds = %for.body27.prol
  br label %for.body27.prol

for.body27.prol.for.body27.prol.loopexit_crit_edge: ; preds = %for.body27.prol
  br label %for.body27.prol.loopexit

for.body27.prol.loopexit:                         ; preds = %for.body27.prol.for.body27.prol.loopexit_crit_edge, %for.body27.lr.ph.for.body27.prol.loopexit_crit_edge
  %indvars.iv1225.unr = phi i64 [ 0, %for.body27.lr.ph.for.body27.prol.loopexit_crit_edge ], [ %indvars.iv.next13.prol, %for.body27.prol.for.body27.prol.loopexit_crit_edge ]
  br i1 %16, label %for.body27.prol.loopexit.for.end38_crit_edge, label %for.body27.prol.loopexit.for.body27_crit_edge

for.body27.prol.loopexit.for.body27_crit_edge:    ; preds = %for.body27.prol.loopexit
  br label %for.body27

for.body27.prol.loopexit.for.end38_crit_edge:     ; preds = %for.body27.prol.loopexit
  br label %for.end38

for.body27:                                       ; preds = %for.body27.for.body27_crit_edge, %for.body27.prol.loopexit.for.body27_crit_edge
  %indvars.iv1225 = phi i64 [ %indvars.iv.next13.3, %for.body27.for.body27_crit_edge ], [ %indvars.iv1225.unr, %for.body27.prol.loopexit.for.body27_crit_edge ]
  %arrayidx29 = getelementptr inbounds double, double* %sum, i64 %indvars.iv1225
  %44 = bitcast double* %arrayidx29 to i64*
  %45 = load i64, i64* %44, align 8
  %arrayidx35 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30, i64 %indvars.iv1427, i64 %indvars.iv1225
  %46 = bitcast double* %arrayidx35 to i64*
  store i64 %45, i64* %46, align 8
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv1225, 1
  %arrayidx29.1 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next13
  %47 = bitcast double* %arrayidx29.1 to i64*
  %48 = load i64, i64* %47, align 8
  %arrayidx35.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30, i64 %indvars.iv1427, i64 %indvars.iv.next13
  %49 = bitcast double* %arrayidx35.1 to i64*
  store i64 %48, i64* %49, align 8
  %indvars.iv.next13.1 = add nsw i64 %indvars.iv1225, 2
  %arrayidx29.2 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next13.1
  %50 = bitcast double* %arrayidx29.2 to i64*
  %51 = load i64, i64* %50, align 8
  %arrayidx35.2 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30, i64 %indvars.iv1427, i64 %indvars.iv.next13.1
  %52 = bitcast double* %arrayidx35.2 to i64*
  store i64 %51, i64* %52, align 8
  %indvars.iv.next13.2 = add nsw i64 %indvars.iv1225, 3
  %arrayidx29.3 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next13.2
  %53 = bitcast double* %arrayidx29.3 to i64*
  %54 = load i64, i64* %53, align 8
  %arrayidx35.3 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30, i64 %indvars.iv1427, i64 %indvars.iv.next13.2
  %55 = bitcast double* %arrayidx35.3 to i64*
  store i64 %54, i64* %55, align 8
  %indvars.iv.next13.3 = add nsw i64 %indvars.iv1225, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next13.3, %1
  br i1 %exitcond.3, label %for.body27.for.end38_crit_edge, label %for.body27.for.body27_crit_edge

for.body27.for.body27_crit_edge:                  ; preds = %for.body27
  br label %for.body27

for.body27.for.end38_crit_edge:                   ; preds = %for.body27
  br label %for.end38

for.end38:                                        ; preds = %for.body27.for.end38_crit_edge, %for.body27.prol.loopexit.for.end38_crit_edge, %for.cond4.preheader.for.end38_crit_edge
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv1427, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next15, %0
  br i1 %exitcond58, label %for.end38.for.end41_crit_edge, label %for.end38.for.cond4.preheader_crit_edge

for.end38.for.cond4.preheader_crit_edge:          ; preds = %for.end38
  br label %for.cond4.preheader

for.end38.for.end41_crit_edge:                    ; preds = %for.end38
  br label %for.end41

for.end41:                                        ; preds = %for.end38.for.end41_crit_edge, %for.end38.us.for.end41_crit_edge, %for.cond1.preheader.for.end41_crit_edge
  %.lcssa17 = phi i32 [ %17, %for.cond1.preheader.for.end41_crit_edge ], [ %split23.us, %for.end38.us.for.end41_crit_edge ], [ %17, %for.end38.for.end41_crit_edge ]
  %inc43 = add nsw i32 %.lcssa17, 1
  %cmp = icmp slt i32 %inc43, %nr
  br i1 %cmp, label %for.end41.for.cond1.preheader_crit_edge, label %for.end41.for.end44_crit_edge

for.end41.for.end44_crit_edge:                    ; preds = %for.end41
  br label %for.end44

for.end41.for.cond1.preheader_crit_edge:          ; preds = %for.end41
  br label %for.cond1.preheader

for.end44:                                        ; preds = %for.end41.for.end44_crit_edge, %entry.for.end44_crit_edge
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %arraydecay = bitcast i8* %call to [140 x [160 x double]]*
  %arraydecay3 = bitcast i8* %call2 to [160 x double]*
  tail call fastcc void @init_array([140 x [160 x double]]* %arraydecay, [160 x double]* %arraydecay3)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay6 = bitcast i8* %call1 to double*
  tail call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %arraydecay, [160 x double]* %arraydecay3, double* %arraydecay6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %entry.if.end_crit_edge

entry.if.end_crit_edge:                           ; preds = %entry
  br label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %land.lhs.true.if.end_crit_edge

land.lhs.true.if.end_crit_edge:                   ; preds = %land.lhs.true
  br label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = bitcast i8* %call to [140 x [160 x double]]*
  tail call fastcc void @print_array([140 x [160 x double]]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true.if.end_crit_edge, %entry.if.end_crit_edge, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([140 x [160 x double]]* nocapture %A, [160 x double]* nocapture %C4) unnamed_addr #2 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end14.for.cond1.preheader_crit_edge, %entry
  %indvars.iv1320 = phi i64 [ 0, %entry ], [ %indvars.iv.next14, %for.end14.for.cond1.preheader_crit_edge ]
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.end.for.cond4.preheader_crit_edge, %for.cond1.preheader
  %indvars.iv919 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next10, %for.end.for.cond4.preheader_crit_edge ]
  %0 = mul nuw nsw i64 %indvars.iv919, %indvars.iv1320
  br label %for.body6

for.body6:                                        ; preds = %for.body6.for.body6_crit_edge, %for.cond4.preheader
  %indvars.iv518 = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next6.1, %for.body6.for.body6_crit_edge ]
  %1 = add nuw nsw i64 %indvars.iv518, %0
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 160
  %conv = sitofp i32 %rem to double
  %arrayidx11 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv1320, i64 %indvars.iv919, i64 %indvars.iv518
  %indvars.iv.next6 = or i64 %indvars.iv518, 1
  %3 = add nuw nsw i64 %indvars.iv.next6, %0
  %4 = trunc i64 %3 to i32
  %rem.1 = srem i32 %4, 160
  %conv.1 = sitofp i32 %rem.1 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 1.600000e+02, double 1.600000e+02>
  %5 = bitcast double* %arrayidx11 to <2 x double>*
  store <2 x double> %div, <2 x double>* %5, align 8
  %indvars.iv.next6.1 = add nsw i64 %indvars.iv518, 2
  %exitcond8.1 = icmp eq i64 %indvars.iv.next6.1, 160
  br i1 %exitcond8.1, label %for.end, label %for.body6.for.body6_crit_edge

for.body6.for.body6_crit_edge:                    ; preds = %for.body6
  br label %for.body6

for.end:                                          ; preds = %for.body6
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv919, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next10, 140
  br i1 %exitcond12, label %for.end14, label %for.end.for.cond4.preheader_crit_edge

for.end.for.cond4.preheader_crit_edge:            ; preds = %for.end
  br label %for.cond4.preheader

for.end14:                                        ; preds = %for.end
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv1320, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 150
  br i1 %exitcond15, label %for.end14.for.cond22.preheader_crit_edge, label %for.end14.for.cond1.preheader_crit_edge

for.end14.for.cond1.preheader_crit_edge:          ; preds = %for.end14
  br label %for.cond1.preheader

for.end14.for.cond22.preheader_crit_edge:         ; preds = %for.end14
  br label %for.cond22.preheader

for.cond22.preheader:                             ; preds = %for.end37.for.cond22.preheader_crit_edge, %for.end14.for.cond22.preheader_crit_edge
  %indvars.iv217 = phi i64 [ %indvars.iv.next3, %for.end37.for.cond22.preheader_crit_edge ], [ 0, %for.end14.for.cond22.preheader_crit_edge ]
  br label %for.body25

for.body25:                                       ; preds = %for.body25.for.body25_crit_edge, %for.cond22.preheader
  %indvars.iv16 = phi i64 [ 0, %for.cond22.preheader ], [ %indvars.iv.next.1, %for.body25.for.body25_crit_edge ]
  %6 = mul nuw nsw i64 %indvars.iv16, %indvars.iv217
  %7 = trunc i64 %6 to i32
  %rem27 = srem i32 %7, 160
  %conv28 = sitofp i32 %rem27 to double
  %arrayidx34 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv217, i64 %indvars.iv16
  %indvars.iv.next = or i64 %indvars.iv16, 1
  %8 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv217
  %9 = trunc i64 %8 to i32
  %rem27.1 = srem i32 %9, 160
  %conv28.1 = sitofp i32 %rem27.1 to double
  %div30.v.i0.1 = insertelement <2 x double> undef, double %conv28, i32 0
  %div30.v.i0.2 = insertelement <2 x double> %div30.v.i0.1, double %conv28.1, i32 1
  %div30 = fdiv <2 x double> %div30.v.i0.2, <double 1.600000e+02, double 1.600000e+02>
  %10 = bitcast double* %arrayidx34 to <2 x double>*
  store <2 x double> %div30, <2 x double>* %10, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv16, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %for.end37, label %for.body25.for.body25_crit_edge

for.body25.for.body25_crit_edge:                  ; preds = %for.body25
  br label %for.body25

for.end37:                                        ; preds = %for.body25
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv217, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next3, 160
  br i1 %exitcond4, label %for.end40, label %for.end37.for.cond22.preheader_crit_edge

for.end37.for.cond22.preheader_crit_edge:         ; preds = %for.end37
  br label %for.cond22.preheader

for.end40:                                        ; preds = %for.end37
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([140 x [160 x double]]* nocapture readonly %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.end20.for.cond2.preheader_crit_edge, %entry
  %indvars.iv714 = phi i64 [ 0, %entry ], [ %indvars.iv.next8, %for.end20.for.cond2.preheader_crit_edge ]
  %3 = mul nuw nsw i64 %indvars.iv714, 22400
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.end.for.cond5.preheader_crit_edge, %for.cond2.preheader
  %indvars.iv213 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next3, %for.end.for.cond5.preheader_crit_edge ]
  %4 = mul nuw nsw i64 %indvars.iv213, 160
  %5 = add nuw nsw i64 %4, %3
  br label %for.body7

for.body7:                                        ; preds = %if.end.for.body7_crit_edge, %for.cond5.preheader
  %indvars.iv12 = phi i64 [ 0, %for.cond5.preheader ], [ %indvars.iv.next, %if.end.for.body7_crit_edge ]
  %6 = add nuw nsw i64 %5, %indvars.iv12
  %7 = trunc i64 %6 to i32
  %rem = srem i32 %7, 20
  %cmp11 = icmp eq i32 %rem, 0
  br i1 %cmp11, label %if.then, label %for.body7.if.end_crit_edge

for.body7.if.end_crit_edge:                       ; preds = %for.body7
  br label %if.end

if.then:                                          ; preds = %for.body7
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %8) #6
  br label %if.end

if.end:                                           ; preds = %for.body7.if.end_crit_edge, %if.then
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv714, i64 %indvars.iv213, i64 %indvars.iv12
  %10 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %10) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv12, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond, label %for.end, label %if.end.for.body7_crit_edge

if.end.for.body7_crit_edge:                       ; preds = %if.end
  br label %for.body7

for.end:                                          ; preds = %if.end
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv213, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next3, 140
  br i1 %exitcond6, label %for.end20, label %for.end.for.cond5.preheader_crit_edge

for.end.for.cond5.preheader_crit_edge:            ; preds = %for.end
  br label %for.cond5.preheader

for.end20:                                        ; preds = %for.end
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv714, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next8, 150
  br i1 %exitcond11, label %for.end23, label %for.end20.for.cond2.preheader_crit_edge

for.end20.for.cond2.preheader_crit_edge:          ; preds = %for.end20
  br label %for.cond2.preheader

for.end23:                                        ; preds = %for.end20
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
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
!3 = distinct !{!3, !2}
