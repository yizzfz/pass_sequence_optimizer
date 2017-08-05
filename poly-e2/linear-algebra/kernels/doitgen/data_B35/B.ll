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
define void @kernel_doitgen(i32 %nr, i32 %nq, i32 %np, [140 x [160 x double]]* %A, [160 x double]* %C4, double* %sum) local_unnamed_addr #0 {
entry:
  %0 = sext i32 %np to i64
  %1 = sext i32 %nq to i64
  %2 = zext i32 %np to i64
  %cmp48 = icmp sgt i32 %nr, 0
  br i1 %cmp48, label %for.cond1.preheader.lr.ph, label %for.end44

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %3 = shl nsw i64 %0, 3
  %4 = add nsw i64 %0, -1
  %xtraiter63 = and i64 %0, 3
  %xtraiter61 = and i64 %2, 1
  %xtraiter = and i64 %0, 3
  %5 = icmp sgt i32 %nq, 0
  %6 = icmp sgt i32 %np, 0
  %7 = icmp eq i32 %np, 0
  %8 = bitcast double* %sum to i8*
  %9 = icmp sgt i32 %np, 0
  %10 = icmp eq i64 %xtraiter63, 0
  %11 = icmp ult i64 %4, 3
  %12 = icmp eq i64 %xtraiter61, 0
  %13 = icmp eq i32 %np, 1
  %sunkaddr = ptrtoint double* %sum to i64
  %14 = ptrtoint double* %sum to i64
  %15 = icmp sgt i32 %np, 0
  %16 = icmp eq i64 %xtraiter, 0
  %17 = icmp ult i64 %4, 3
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.lr.ph, %for.inc42
  %18 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc43, %for.inc42 ]
  br i1 %5, label %for.cond4.preheader.lr.ph, label %for.inc42

for.cond4.preheader.lr.ph:                        ; preds = %for.cond1.preheader
  %idxprom10 = sext i32 %18 to i64
  br i1 %6, label %for.cond4.preheader.us.preheader, label %for.cond4.preheader.preheader

for.cond4.preheader.us.preheader:                 ; preds = %for.cond4.preheader.lr.ph
  br label %for.cond4.preheader.us

for.cond4.preheader.preheader:                    ; preds = %for.cond4.preheader.lr.ph
  %idxprom30 = sext i32 %18 to i64
  br label %for.cond4.preheader

for.cond4.preheader.us:                           ; preds = %for.cond4.preheader.us.preheader, %for.inc39.us
  %19 = phi i32 [ %split17.us, %for.inc39.us ], [ %18, %for.cond4.preheader.us.preheader ]
  %indvars.iv721.us = phi i64 [ %indvars.iv.next8.us, %for.inc39.us ], [ 0, %for.cond4.preheader.us.preheader ]
  br i1 %7, label %for.cond4.for.cond25.preheader_crit_edge.us.loopexit, label %for.body6.us26.preheader

for.body6.us26.preheader:                         ; preds = %for.cond4.preheader.us
  %arrayidx15.us31.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom10, i64 %indvars.iv721.us, i64 0
  br label %for.body6.us26

for.inc39.us.loopexit:                            ; preds = %for.body27.us
  br label %for.inc39.us

for.inc39.us:                                     ; preds = %for.inc39.us.loopexit, %for.body27.us.prol.loopexit, %for.cond4.for.cond25.preheader_crit_edge.us
  %indvars.iv.next8.us = add nuw nsw i64 %indvars.iv721.us, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next8.us, %1
  br i1 %exitcond60, label %for.inc42.loopexit, label %for.cond4.preheader.us

for.body27.us:                                    ; preds = %for.body27.us.preheader, %for.body27.us
  %indvars.iv519.us = phi i64 [ %indvars.iv.next6.us.3, %for.body27.us ], [ %indvars.iv519.us.unr, %for.body27.us.preheader ]
  %arrayidx29.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv519.us
  %20 = bitcast double* %arrayidx29.us to i64*
  %21 = load i64, i64* %20, align 8
  %arrayidx35.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv721.us, i64 %indvars.iv519.us
  %22 = bitcast double* %arrayidx35.us to i64*
  store i64 %21, i64* %22, align 8
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv519.us, 1
  %arrayidx29.us.1 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next6.us
  %23 = bitcast double* %arrayidx29.us.1 to i64*
  %24 = load i64, i64* %23, align 8
  %arrayidx35.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv721.us, i64 %indvars.iv.next6.us
  %25 = bitcast double* %arrayidx35.us.1 to i64*
  store i64 %24, i64* %25, align 8
  %indvars.iv.next6.us.1 = add nsw i64 %indvars.iv519.us, 2
  %arrayidx29.us.2 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next6.us.1
  %26 = bitcast double* %arrayidx29.us.2 to i64*
  %27 = load i64, i64* %26, align 8
  %arrayidx35.us.2 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv721.us, i64 %indvars.iv.next6.us.1
  %28 = bitcast double* %arrayidx35.us.2 to i64*
  store i64 %27, i64* %28, align 8
  %indvars.iv.next6.us.2 = add nsw i64 %indvars.iv519.us, 3
  %arrayidx29.us.3 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next6.us.2
  %29 = bitcast double* %arrayidx29.us.3 to i64*
  %30 = load i64, i64* %29, align 8
  %arrayidx35.us.3 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv721.us, i64 %indvars.iv.next6.us.2
  %31 = bitcast double* %arrayidx35.us.3 to i64*
  store i64 %30, i64* %31, align 8
  %indvars.iv.next6.us.3 = add nsw i64 %indvars.iv519.us, 4
  %exitcond57.3 = icmp eq i64 %indvars.iv.next6.us.3, %0
  br i1 %exitcond57.3, label %for.inc39.us.loopexit, label %for.body27.us

for.body6.us26:                                   ; preds = %for.body6.us26.preheader, %for.cond7.for.inc22_crit_edge.us43
  %indvars.iv315.us27 = phi i64 [ %indvars.iv.next4.us40, %for.cond7.for.inc22_crit_edge.us43 ], [ 0, %for.body6.us26.preheader ]
  %arrayidx.us28 = getelementptr inbounds double, double* %sum, i64 %indvars.iv315.us27
  store double 0.000000e+00, double* %arrayidx.us28, align 8
  br i1 %12, label %for.body9.us29.prol.loopexit, label %for.body9.us29.prol

for.body9.us29.prol:                              ; preds = %for.body6.us26
  %32 = load double, double* %arrayidx15.us31.prol, align 8
  %arrayidx19.us32.prol = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 0, i64 %indvars.iv315.us27
  %33 = load double, double* %arrayidx19.us32.prol, align 8
  %mul.us33.prol = fmul double %32, %33
  %add.us34.prol = fadd double %mul.us33.prol, 0.000000e+00
  %sunkaddr66 = shl i64 %indvars.iv315.us27, 3
  %sunkaddr67 = add i64 %14, %sunkaddr66
  %sunkaddr68 = inttoptr i64 %sunkaddr67 to double*
  store double %add.us34.prol, double* %sunkaddr68, align 8
  br label %for.body9.us29.prol.loopexit

for.body9.us29.prol.loopexit:                     ; preds = %for.body9.us29.prol, %for.body6.us26
  %.unr.ph = phi double [ %add.us34.prol, %for.body9.us29.prol ], [ 0.000000e+00, %for.body6.us26 ]
  %indvars.iv13.us30.unr.ph = phi i64 [ 1, %for.body9.us29.prol ], [ 0, %for.body6.us26 ]
  br i1 %13, label %for.cond7.for.inc22_crit_edge.us43, label %for.body9.us29.preheader

for.body9.us29.preheader:                         ; preds = %for.body9.us29.prol.loopexit
  %sunkaddr77 = shl i64 %indvars.iv315.us27, 3
  %sunkaddr78 = add i64 %sunkaddr, %sunkaddr77
  %sunkaddr79 = inttoptr i64 %sunkaddr78 to double*
  br label %for.body9.us29

for.body9.us29:                                   ; preds = %for.body9.us29.preheader, %for.body9.us29
  %34 = phi double [ %add.us34.1, %for.body9.us29 ], [ %.unr.ph, %for.body9.us29.preheader ]
  %indvars.iv13.us30 = phi i64 [ %indvars.iv.next.us35.1, %for.body9.us29 ], [ %indvars.iv13.us30.unr.ph, %for.body9.us29.preheader ]
  %arrayidx15.us31 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom10, i64 %indvars.iv721.us, i64 %indvars.iv13.us30
  %35 = load double, double* %arrayidx15.us31, align 8
  %arrayidx19.us32 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv13.us30, i64 %indvars.iv315.us27
  %36 = load double, double* %arrayidx19.us32, align 8
  %mul.us33 = fmul double %35, %36
  %add.us34 = fadd double %34, %mul.us33
  store double %add.us34, double* %sunkaddr79, align 8
  %indvars.iv.next.us35 = add nuw nsw i64 %indvars.iv13.us30, 1
  %arrayidx15.us31.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom10, i64 %indvars.iv721.us, i64 %indvars.iv.next.us35
  %37 = load double, double* %arrayidx15.us31.1, align 8
  %arrayidx19.us32.1 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv.next.us35, i64 %indvars.iv315.us27
  %38 = load double, double* %arrayidx19.us32.1, align 8
  %mul.us33.1 = fmul double %37, %38
  %add.us34.1 = fadd double %add.us34, %mul.us33.1
  store double %add.us34.1, double* %sunkaddr79, align 8
  %indvars.iv.next.us35.1 = add nsw i64 %indvars.iv13.us30, 2
  %exitcond11.us36.1 = icmp eq i64 %indvars.iv.next.us35.1, %2
  br i1 %exitcond11.us36.1, label %for.cond7.for.inc22_crit_edge.us43.loopexit, label %for.body9.us29

for.cond7.for.inc22_crit_edge.us43.loopexit:      ; preds = %for.body9.us29
  br label %for.cond7.for.inc22_crit_edge.us43

for.cond7.for.inc22_crit_edge.us43:               ; preds = %for.cond7.for.inc22_crit_edge.us43.loopexit, %for.body9.us29.prol.loopexit
  %indvars.iv.next4.us40 = add nuw nsw i64 %indvars.iv315.us27, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next4.us40, %0
  br i1 %exitcond53, label %for.cond4.for.cond25.preheader_crit_edge.us.loopexit84, label %for.body6.us26

for.cond4.for.cond25.preheader_crit_edge.us.loopexit: ; preds = %for.cond4.preheader.us
  call void @llvm.memset.p0i8.i64(i8* %8, i8 0, i64 %3, i32 8, i1 false)
  br label %for.cond4.for.cond25.preheader_crit_edge.us

for.cond4.for.cond25.preheader_crit_edge.us.loopexit84: ; preds = %for.cond7.for.inc22_crit_edge.us43
  br label %for.cond4.for.cond25.preheader_crit_edge.us

for.cond4.for.cond25.preheader_crit_edge.us:      ; preds = %for.cond4.for.cond25.preheader_crit_edge.us.loopexit84, %for.cond4.for.cond25.preheader_crit_edge.us.loopexit
  %split17.us = phi i32 [ %19, %for.cond4.for.cond25.preheader_crit_edge.us.loopexit ], [ %18, %for.cond4.for.cond25.preheader_crit_edge.us.loopexit84 ]
  br i1 %9, label %for.body27.lr.ph.us, label %for.inc39.us

for.body27.lr.ph.us:                              ; preds = %for.cond4.for.cond25.preheader_crit_edge.us
  %idxprom30.us = sext i32 %split17.us to i64
  br i1 %10, label %for.body27.us.prol.loopexit, label %for.body27.us.prol.preheader

for.body27.us.prol.preheader:                     ; preds = %for.body27.lr.ph.us
  br label %for.body27.us.prol

for.body27.us.prol:                               ; preds = %for.body27.us.prol.preheader, %for.body27.us.prol
  %indvars.iv519.us.prol = phi i64 [ %indvars.iv.next6.us.prol, %for.body27.us.prol ], [ 0, %for.body27.us.prol.preheader ]
  %prol.iter65 = phi i64 [ %prol.iter65.sub, %for.body27.us.prol ], [ %xtraiter63, %for.body27.us.prol.preheader ]
  %arrayidx29.us.prol = getelementptr inbounds double, double* %sum, i64 %indvars.iv519.us.prol
  %39 = bitcast double* %arrayidx29.us.prol to i64*
  %40 = load i64, i64* %39, align 8
  %arrayidx35.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv721.us, i64 %indvars.iv519.us.prol
  %41 = bitcast double* %arrayidx35.us.prol to i64*
  store i64 %40, i64* %41, align 8
  %indvars.iv.next6.us.prol = add nuw nsw i64 %indvars.iv519.us.prol, 1
  %prol.iter65.sub = add i64 %prol.iter65, -1
  %prol.iter65.cmp = icmp eq i64 %prol.iter65.sub, 0
  br i1 %prol.iter65.cmp, label %for.body27.us.prol.loopexit.loopexit, label %for.body27.us.prol, !llvm.loop !1

for.body27.us.prol.loopexit.loopexit:             ; preds = %for.body27.us.prol
  br label %for.body27.us.prol.loopexit

for.body27.us.prol.loopexit:                      ; preds = %for.body27.us.prol.loopexit.loopexit, %for.body27.lr.ph.us
  %indvars.iv519.us.unr = phi i64 [ 0, %for.body27.lr.ph.us ], [ %indvars.iv.next6.us.prol, %for.body27.us.prol.loopexit.loopexit ]
  br i1 %11, label %for.inc39.us, label %for.body27.us.preheader

for.body27.us.preheader:                          ; preds = %for.body27.us.prol.loopexit
  br label %for.body27.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc39
  %indvars.iv721 = phi i64 [ %indvars.iv.next8, %for.inc39 ], [ 0, %for.cond4.preheader.preheader ]
  br i1 %15, label %for.body27.lr.ph, label %for.inc39

for.body27.lr.ph:                                 ; preds = %for.cond4.preheader
  br i1 %16, label %for.body27.prol.loopexit, label %for.body27.prol.preheader

for.body27.prol.preheader:                        ; preds = %for.body27.lr.ph
  br label %for.body27.prol

for.body27.prol:                                  ; preds = %for.body27.prol.preheader, %for.body27.prol
  %indvars.iv519.prol = phi i64 [ %indvars.iv.next6.prol, %for.body27.prol ], [ 0, %for.body27.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body27.prol ], [ %xtraiter, %for.body27.prol.preheader ]
  %arrayidx29.prol = getelementptr inbounds double, double* %sum, i64 %indvars.iv519.prol
  %42 = bitcast double* %arrayidx29.prol to i64*
  %43 = load i64, i64* %42, align 8
  %arrayidx35.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30, i64 %indvars.iv721, i64 %indvars.iv519.prol
  %44 = bitcast double* %arrayidx35.prol to i64*
  store i64 %43, i64* %44, align 8
  %indvars.iv.next6.prol = add nuw nsw i64 %indvars.iv519.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body27.prol.loopexit.loopexit, label %for.body27.prol, !llvm.loop !3

for.body27.prol.loopexit.loopexit:                ; preds = %for.body27.prol
  br label %for.body27.prol.loopexit

for.body27.prol.loopexit:                         ; preds = %for.body27.prol.loopexit.loopexit, %for.body27.lr.ph
  %indvars.iv519.unr = phi i64 [ 0, %for.body27.lr.ph ], [ %indvars.iv.next6.prol, %for.body27.prol.loopexit.loopexit ]
  br i1 %17, label %for.inc39, label %for.body27.preheader

for.body27.preheader:                             ; preds = %for.body27.prol.loopexit
  br label %for.body27

for.body27:                                       ; preds = %for.body27.preheader, %for.body27
  %indvars.iv519 = phi i64 [ %indvars.iv.next6.3, %for.body27 ], [ %indvars.iv519.unr, %for.body27.preheader ]
  %arrayidx29 = getelementptr inbounds double, double* %sum, i64 %indvars.iv519
  %45 = bitcast double* %arrayidx29 to i64*
  %46 = load i64, i64* %45, align 8
  %arrayidx35 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30, i64 %indvars.iv721, i64 %indvars.iv519
  %47 = bitcast double* %arrayidx35 to i64*
  store i64 %46, i64* %47, align 8
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv519, 1
  %arrayidx29.1 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next6
  %48 = bitcast double* %arrayidx29.1 to i64*
  %49 = load i64, i64* %48, align 8
  %arrayidx35.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30, i64 %indvars.iv721, i64 %indvars.iv.next6
  %50 = bitcast double* %arrayidx35.1 to i64*
  store i64 %49, i64* %50, align 8
  %indvars.iv.next6.1 = add nsw i64 %indvars.iv519, 2
  %arrayidx29.2 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next6.1
  %51 = bitcast double* %arrayidx29.2 to i64*
  %52 = load i64, i64* %51, align 8
  %arrayidx35.2 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30, i64 %indvars.iv721, i64 %indvars.iv.next6.1
  %53 = bitcast double* %arrayidx35.2 to i64*
  store i64 %52, i64* %53, align 8
  %indvars.iv.next6.2 = add nsw i64 %indvars.iv519, 3
  %arrayidx29.3 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next6.2
  %54 = bitcast double* %arrayidx29.3 to i64*
  %55 = load i64, i64* %54, align 8
  %arrayidx35.3 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30, i64 %indvars.iv721, i64 %indvars.iv.next6.2
  %56 = bitcast double* %arrayidx35.3 to i64*
  store i64 %55, i64* %56, align 8
  %indvars.iv.next6.3 = add nsw i64 %indvars.iv519, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next6.3, %0
  br i1 %exitcond.3, label %for.inc39.loopexit, label %for.body27

for.inc39.loopexit:                               ; preds = %for.body27
  br label %for.inc39

for.inc39:                                        ; preds = %for.inc39.loopexit, %for.body27.prol.loopexit, %for.cond4.preheader
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv721, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next8, %1
  br i1 %exitcond52, label %for.inc42.loopexit85, label %for.cond4.preheader

for.inc42.loopexit:                               ; preds = %for.inc39.us
  br label %for.inc42

for.inc42.loopexit85:                             ; preds = %for.inc39
  br label %for.inc42

for.inc42:                                        ; preds = %for.inc42.loopexit85, %for.inc42.loopexit, %for.cond1.preheader
  %.lcssa10 = phi i32 [ %18, %for.cond1.preheader ], [ %split17.us, %for.inc42.loopexit ], [ %18, %for.inc42.loopexit85 ]
  %inc43 = add nsw i32 %.lcssa10, 1
  %cmp = icmp slt i32 %inc43, %nr
  br i1 %cmp, label %for.cond1.preheader, label %for.end44.loopexit

for.end44.loopexit:                               ; preds = %for.inc42
  br label %for.end44

for.end44:                                        ; preds = %for.end44.loopexit, %entry
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #3
  %call1 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #3
  %call2 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #3
  %arraydecay = bitcast i8* %call to [140 x [160 x double]]*
  %arraydecay3 = bitcast i8* %call2 to [160 x double]*
  tail call fastcc void @init_array([140 x [160 x double]]* %arraydecay, [160 x double]* %arraydecay3)
  tail call void (...) @polybench_timer_start() #3
  %arraydecay6 = bitcast i8* %call1 to double*
  tail call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %arraydecay, [160 x double]* %arraydecay3, double* %arraydecay6)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = bitcast i8* %call to [140 x [160 x double]]*
  tail call fastcc void @print_array([140 x [160 x double]]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #3
  tail call void @free(i8* %call1) #3
  tail call void @free(i8* %call2) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([140 x [160 x double]]* %A, [160 x double]* %C4) unnamed_addr #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc15, %entry
  %indvars.iv1017 = phi i64 [ 0, %entry ], [ %indvars.iv.next11, %for.inc15 ]
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.inc12, %for.cond1.preheader
  %indvars.iv716 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next8, %for.inc12 ]
  %0 = mul nuw nsw i64 %indvars.iv716, %indvars.iv1017
  br label %for.body6

for.body6:                                        ; preds = %for.body6, %for.cond4.preheader
  %indvars.iv415 = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next5.1, %for.body6 ]
  %1 = add nuw nsw i64 %indvars.iv415, %0
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 160
  %conv = sitofp i32 %rem to double
  %arrayidx11 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv1017, i64 %indvars.iv716, i64 %indvars.iv415
  %indvars.iv.next5 = or i64 %indvars.iv415, 1
  %3 = add nuw nsw i64 %indvars.iv.next5, %0
  %4 = trunc i64 %3 to i32
  %rem.1 = srem i32 %4, 160
  %conv.1 = sitofp i32 %rem.1 to double
  %div.v.i0.1 = insertelement <2 x double> undef, double %conv, i32 0
  %div.v.i0.2 = insertelement <2 x double> %div.v.i0.1, double %conv.1, i32 1
  %div = fdiv <2 x double> %div.v.i0.2, <double 1.600000e+02, double 1.600000e+02>
  %5 = bitcast double* %arrayidx11 to <2 x double>*
  store <2 x double> %div, <2 x double>* %5, align 8
  %indvars.iv.next5.1 = add nsw i64 %indvars.iv415, 2
  %exitcond18.1 = icmp eq i64 %indvars.iv.next5.1, 160
  br i1 %exitcond18.1, label %for.inc12, label %for.body6

for.inc12:                                        ; preds = %for.body6
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv716, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next8, 140
  br i1 %exitcond19, label %for.inc15, label %for.cond4.preheader

for.inc15:                                        ; preds = %for.inc12
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv1017, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next11, 150
  br i1 %exitcond20, label %for.cond22.preheader.preheader, label %for.cond1.preheader

for.cond22.preheader.preheader:                   ; preds = %for.inc15
  br label %for.cond22.preheader

for.cond22.preheader:                             ; preds = %for.cond22.preheader.preheader, %for.inc38
  %indvars.iv214 = phi i64 [ %indvars.iv.next3, %for.inc38 ], [ 0, %for.cond22.preheader.preheader ]
  br label %for.body25

for.body25:                                       ; preds = %for.body25, %for.cond22.preheader
  %indvars.iv13 = phi i64 [ 0, %for.cond22.preheader ], [ %indvars.iv.next.1, %for.body25 ]
  %6 = mul nuw nsw i64 %indvars.iv13, %indvars.iv214
  %7 = trunc i64 %6 to i32
  %rem27 = srem i32 %7, 160
  %conv28 = sitofp i32 %rem27 to double
  %arrayidx34 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv214, i64 %indvars.iv13
  %indvars.iv.next = or i64 %indvars.iv13, 1
  %8 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv214
  %9 = trunc i64 %8 to i32
  %rem27.1 = srem i32 %9, 160
  %conv28.1 = sitofp i32 %rem27.1 to double
  %div30.v.i0.1 = insertelement <2 x double> undef, double %conv28, i32 0
  %div30.v.i0.2 = insertelement <2 x double> %div30.v.i0.1, double %conv28.1, i32 1
  %div30 = fdiv <2 x double> %div30.v.i0.2, <double 1.600000e+02, double 1.600000e+02>
  %10 = bitcast double* %arrayidx34 to <2 x double>*
  store <2 x double> %div30, <2 x double>* %10, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv13, 2
  %exitcond12.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond12.1, label %for.inc38, label %for.body25

for.inc38:                                        ; preds = %for.body25
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv214, 1
  %exitcond = icmp eq i64 %indvars.iv.next3, 160
  br i1 %exitcond, label %for.end40, label %for.cond22.preheader

for.end40:                                        ; preds = %for.inc38
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([140 x [160 x double]]* %A) unnamed_addr #0 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc21, %entry
  %indvars.iv510 = phi i64 [ 0, %entry ], [ %indvars.iv.next6, %for.inc21 ]
  %3 = mul nuw nsw i64 %indvars.iv510, 140
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.inc18, %for.cond2.preheader
  %indvars.iv39 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next4, %for.inc18 ]
  %mul81 = add nuw nsw i64 %indvars.iv39, %3
  %add = mul nuw nsw i64 %mul81, 160
  br label %for.body7

for.body7:                                        ; preds = %if.end, %for.cond5.preheader
  %indvars.iv8 = phi i64 [ 0, %for.cond5.preheader ], [ %indvars.iv.next, %if.end ]
  %4 = add nuw nsw i64 %indvars.iv8, %add
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp11 = icmp eq i32 %rem, 0
  br i1 %cmp11, label %if.then, label %if.end

if.then:                                          ; preds = %for.body7
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body7
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv510, i64 %indvars.iv39, i64 %indvars.iv8
  %8 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv8, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond, label %for.inc18, label %for.body7

for.inc18:                                        ; preds = %if.end
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next4, 140
  br i1 %exitcond11, label %for.inc21, label %for.cond5.preheader

for.inc21:                                        ; preds = %for.inc18
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv510, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next6, 150
  br i1 %exitcond12, label %for.end23, label %for.cond2.preheader

for.end23:                                        ; preds = %for.inc21
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
