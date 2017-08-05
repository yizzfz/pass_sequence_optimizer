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

; Function Attrs: noinline norecurse nounwind uwtable
define void @kernel_doitgen(i32 %nr, i32 %nq, i32 %np, [140 x [160 x double]]* nocapture %A, [160 x double]* nocapture readonly %C4, double* nocapture %sum) local_unnamed_addr #0 {
entry:
  %0 = sext i32 %nq to i64
  %cmp58 = icmp sgt i32 %nr, 0
  br i1 %cmp58, label %for.cond1.preheader.lr.ph, label %for.end44

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %1 = sext i32 %np to i64
  %2 = shl nsw i64 %1, 3
  %3 = add nsw i64 %1, -1
  %4 = icmp sgt i32 %nq, 0
  %5 = icmp sgt i32 %np, 0
  %6 = icmp sgt i32 %np, 0
  %xtraiter72 = and i64 %1, 1
  %lcmp.mod73 = icmp eq i64 %xtraiter72, 0
  %7 = icmp eq i64 %3, 0
  %sunkaddr80 = ptrtoint double* %sum to i64
  %sunkaddr = ptrtoint double* %sum to i64
  %8 = icmp sgt i32 %np, 0
  %xtraiter74 = and i64 %1, 3
  %lcmp.mod75 = icmp eq i64 %xtraiter74, 0
  %9 = icmp ult i64 %3, 3
  %10 = bitcast double* %sum to i8*
  %11 = icmp sgt i32 %np, 0
  %xtraiter = and i64 %1, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %12 = icmp ult i64 %3, 3
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.lr.ph, %for.end41
  %storemerge59 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc43, %for.end41 ]
  br i1 %4, label %for.cond4.preheader.lr.ph, label %for.end41

for.cond4.preheader.lr.ph:                        ; preds = %for.cond1.preheader
  %idxprom10 = sext i32 %storemerge59 to i64
  br i1 %5, label %for.cond4.preheader.us.preheader, label %for.cond4.preheader.preheader

for.cond4.preheader.us.preheader:                 ; preds = %for.cond4.preheader.lr.ph
  br label %for.cond4.preheader.us

for.cond4.preheader.preheader:                    ; preds = %for.cond4.preheader.lr.ph
  %idxprom30 = sext i32 %storemerge59 to i64
  br label %for.cond4.preheader

for.cond4.preheader.us:                           ; preds = %for.cond4.preheader.us.preheader, %for.end38.us
  %13 = phi i32 [ %split27.us, %for.end38.us ], [ %storemerge59, %for.cond4.preheader.us.preheader ]
  %indvars.iv1831.us = phi i64 [ %indvars.iv.next19.us, %for.end38.us ], [ 0, %for.cond4.preheader.us.preheader ]
  br i1 %6, label %for.body6.us.us.preheader, label %for.cond4.for.cond25.preheader_crit_edge.us.loopexit60

for.body6.us.us.preheader:                        ; preds = %for.cond4.preheader.us
  %arrayidx15.us.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom10, i64 %indvars.iv1831.us, i64 0
  br label %for.body6.us.us

for.end38.us.loopexit:                            ; preds = %for.body27.us
  br label %for.end38.us

for.end38.us:                                     ; preds = %for.end38.us.loopexit, %for.body27.us.prol.loopexit, %for.cond4.for.cond25.preheader_crit_edge.us
  %indvars.iv.next19.us = add nuw nsw i64 %indvars.iv1831.us, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next19.us, %0
  br i1 %exitcond67, label %for.end41.loopexit, label %for.cond4.preheader.us

for.body27.us:                                    ; preds = %for.body27.us.preheader, %for.body27.us
  %indvars.iv1629.us = phi i64 [ %indvars.iv.next17.us.3, %for.body27.us ], [ %indvars.iv1629.us.unr, %for.body27.us.preheader ]
  %arrayidx29.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv1629.us
  %14 = bitcast double* %arrayidx29.us to i64*
  %15 = load i64, i64* %14, align 8
  %arrayidx35.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv1831.us, i64 %indvars.iv1629.us
  %16 = bitcast double* %arrayidx35.us to i64*
  store i64 %15, i64* %16, align 8
  %indvars.iv.next17.us = add nuw nsw i64 %indvars.iv1629.us, 1
  %arrayidx29.us.1 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next17.us
  %17 = bitcast double* %arrayidx29.us.1 to i64*
  %18 = load i64, i64* %17, align 8
  %arrayidx35.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv1831.us, i64 %indvars.iv.next17.us
  %19 = bitcast double* %arrayidx35.us.1 to i64*
  store i64 %18, i64* %19, align 8
  %indvars.iv.next17.us.1 = add nsw i64 %indvars.iv1629.us, 2
  %arrayidx29.us.2 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next17.us.1
  %20 = bitcast double* %arrayidx29.us.2 to i64*
  %21 = load i64, i64* %20, align 8
  %arrayidx35.us.2 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv1831.us, i64 %indvars.iv.next17.us.1
  %22 = bitcast double* %arrayidx35.us.2 to i64*
  store i64 %21, i64* %22, align 8
  %indvars.iv.next17.us.2 = add nsw i64 %indvars.iv1629.us, 3
  %arrayidx29.us.3 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next17.us.2
  %23 = bitcast double* %arrayidx29.us.3 to i64*
  %24 = load i64, i64* %23, align 8
  %arrayidx35.us.3 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv1831.us, i64 %indvars.iv.next17.us.2
  %25 = bitcast double* %arrayidx35.us.3 to i64*
  store i64 %24, i64* %25, align 8
  %indvars.iv.next17.us.3 = add nsw i64 %indvars.iv1629.us, 4
  %exitcond66.3 = icmp eq i64 %indvars.iv.next17.us.3, %1
  br i1 %exitcond66.3, label %for.end38.us.loopexit, label %for.body27.us

for.cond4.for.cond25.preheader_crit_edge.us.loopexit60: ; preds = %for.cond4.preheader.us
  call void @llvm.memset.p0i8.i64(i8* %10, i8 0, i64 %2, i32 8, i1 false)
  br label %for.cond4.for.cond25.preheader_crit_edge.us

for.cond4.for.cond25.preheader_crit_edge.us.loopexit: ; preds = %for.cond7.for.end_crit_edge.us.us
  br label %for.cond4.for.cond25.preheader_crit_edge.us

for.cond4.for.cond25.preheader_crit_edge.us:      ; preds = %for.cond4.for.cond25.preheader_crit_edge.us.loopexit, %for.cond4.for.cond25.preheader_crit_edge.us.loopexit60
  %split27.us = phi i32 [ %13, %for.cond4.for.cond25.preheader_crit_edge.us.loopexit60 ], [ %storemerge59, %for.cond4.for.cond25.preheader_crit_edge.us.loopexit ]
  br i1 %8, label %for.body27.lr.ph.us, label %for.end38.us

for.body6.us.us:                                  ; preds = %for.body6.us.us.preheader, %for.cond7.for.end_crit_edge.us.us
  %indvars.iv1425.us.us = phi i64 [ %indvars.iv.next15.us.us, %for.cond7.for.end_crit_edge.us.us ], [ 0, %for.body6.us.us.preheader ]
  %arrayidx.us.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv1425.us.us
  store double 0.000000e+00, double* %arrayidx.us.us, align 8
  br i1 %lcmp.mod73, label %for.body9.us.us.prol.loopexit, label %for.body9.us.us.prol

for.body9.us.us.prol:                             ; preds = %for.body6.us.us
  %26 = load double, double* %arrayidx15.us.us.prol, align 8
  %arrayidx19.us.us.prol = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 0, i64 %indvars.iv1425.us.us
  %27 = load double, double* %arrayidx19.us.us.prol, align 8
  %mul.us.us.prol = fmul double %26, %27
  %add.us.us.prol = fadd double %mul.us.us.prol, 0.000000e+00
  %sunkaddr77 = shl i64 %indvars.iv1425.us.us, 3
  %sunkaddr78 = add i64 %sunkaddr, %sunkaddr77
  %sunkaddr79 = inttoptr i64 %sunkaddr78 to double*
  store double %add.us.us.prol, double* %sunkaddr79, align 8
  br label %for.body9.us.us.prol.loopexit

for.body9.us.us.prol.loopexit:                    ; preds = %for.body9.us.us.prol, %for.body6.us.us
  %.unr.ph = phi double [ %add.us.us.prol, %for.body9.us.us.prol ], [ 0.000000e+00, %for.body6.us.us ]
  %indvars.iv23.us.us.unr.ph = phi i64 [ 1, %for.body9.us.us.prol ], [ 0, %for.body6.us.us ]
  br i1 %7, label %for.cond7.for.end_crit_edge.us.us, label %for.body9.us.us.preheader

for.body9.us.us.preheader:                        ; preds = %for.body9.us.us.prol.loopexit
  %sunkaddr81 = shl i64 %indvars.iv1425.us.us, 3
  %sunkaddr82 = add i64 %sunkaddr80, %sunkaddr81
  %sunkaddr83 = inttoptr i64 %sunkaddr82 to double*
  br label %for.body9.us.us

for.cond7.for.end_crit_edge.us.us.loopexit:       ; preds = %for.body9.us.us
  br label %for.cond7.for.end_crit_edge.us.us

for.cond7.for.end_crit_edge.us.us:                ; preds = %for.cond7.for.end_crit_edge.us.us.loopexit, %for.body9.us.us.prol.loopexit
  %indvars.iv.next15.us.us = add nuw nsw i64 %indvars.iv1425.us.us, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next15.us.us, %1
  br i1 %exitcond65, label %for.cond4.for.cond25.preheader_crit_edge.us.loopexit, label %for.body6.us.us

for.body9.us.us:                                  ; preds = %for.body9.us.us.preheader, %for.body9.us.us
  %28 = phi double [ %add.us.us.1, %for.body9.us.us ], [ %.unr.ph, %for.body9.us.us.preheader ]
  %indvars.iv23.us.us = phi i64 [ %indvars.iv.next.us.us.1, %for.body9.us.us ], [ %indvars.iv23.us.us.unr.ph, %for.body9.us.us.preheader ]
  %arrayidx15.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom10, i64 %indvars.iv1831.us, i64 %indvars.iv23.us.us
  %29 = load double, double* %arrayidx15.us.us, align 8
  %arrayidx19.us.us = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv23.us.us, i64 %indvars.iv1425.us.us
  %30 = load double, double* %arrayidx19.us.us, align 8
  %mul.us.us = fmul double %29, %30
  %add.us.us = fadd double %28, %mul.us.us
  store double %add.us.us, double* %sunkaddr83, align 8
  %indvars.iv.next.us.us = add nuw nsw i64 %indvars.iv23.us.us, 1
  %arrayidx15.us.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom10, i64 %indvars.iv1831.us, i64 %indvars.iv.next.us.us
  %31 = load double, double* %arrayidx15.us.us.1, align 8
  %arrayidx19.us.us.1 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv.next.us.us, i64 %indvars.iv1425.us.us
  %32 = load double, double* %arrayidx19.us.us.1, align 8
  %mul.us.us.1 = fmul double %31, %32
  %add.us.us.1 = fadd double %add.us.us, %mul.us.us.1
  store double %add.us.us.1, double* %sunkaddr83, align 8
  %indvars.iv.next.us.us.1 = add nsw i64 %indvars.iv23.us.us, 2
  %exitcond64.1 = icmp eq i64 %indvars.iv.next.us.us.1, %1
  br i1 %exitcond64.1, label %for.cond7.for.end_crit_edge.us.us.loopexit, label %for.body9.us.us

for.body27.lr.ph.us:                              ; preds = %for.cond4.for.cond25.preheader_crit_edge.us
  %idxprom30.us = sext i32 %split27.us to i64
  br i1 %lcmp.mod75, label %for.body27.us.prol.loopexit, label %for.body27.us.prol.preheader

for.body27.us.prol.preheader:                     ; preds = %for.body27.lr.ph.us
  br label %for.body27.us.prol

for.body27.us.prol:                               ; preds = %for.body27.us.prol.preheader, %for.body27.us.prol
  %indvars.iv1629.us.prol = phi i64 [ %indvars.iv.next17.us.prol, %for.body27.us.prol ], [ 0, %for.body27.us.prol.preheader ]
  %prol.iter76 = phi i64 [ %prol.iter76.sub, %for.body27.us.prol ], [ %xtraiter74, %for.body27.us.prol.preheader ]
  %arrayidx29.us.prol = getelementptr inbounds double, double* %sum, i64 %indvars.iv1629.us.prol
  %33 = bitcast double* %arrayidx29.us.prol to i64*
  %34 = load i64, i64* %33, align 8
  %arrayidx35.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv1831.us, i64 %indvars.iv1629.us.prol
  %35 = bitcast double* %arrayidx35.us.prol to i64*
  store i64 %34, i64* %35, align 8
  %indvars.iv.next17.us.prol = add nuw nsw i64 %indvars.iv1629.us.prol, 1
  %prol.iter76.sub = add i64 %prol.iter76, -1
  %prol.iter76.cmp = icmp eq i64 %prol.iter76.sub, 0
  br i1 %prol.iter76.cmp, label %for.body27.us.prol.loopexit.loopexit, label %for.body27.us.prol, !llvm.loop !1

for.body27.us.prol.loopexit.loopexit:             ; preds = %for.body27.us.prol
  br label %for.body27.us.prol.loopexit

for.body27.us.prol.loopexit:                      ; preds = %for.body27.us.prol.loopexit.loopexit, %for.body27.lr.ph.us
  %indvars.iv1629.us.unr = phi i64 [ 0, %for.body27.lr.ph.us ], [ %indvars.iv.next17.us.prol, %for.body27.us.prol.loopexit.loopexit ]
  br i1 %9, label %for.end38.us, label %for.body27.us.preheader

for.body27.us.preheader:                          ; preds = %for.body27.us.prol.loopexit
  br label %for.body27.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.end38
  %indvars.iv1831 = phi i64 [ %indvars.iv.next19, %for.end38 ], [ 0, %for.cond4.preheader.preheader ]
  br i1 %11, label %for.body27.lr.ph, label %for.end38

for.body27.lr.ph:                                 ; preds = %for.cond4.preheader
  br i1 %lcmp.mod, label %for.body27.prol.loopexit, label %for.body27.prol.preheader

for.body27.prol.preheader:                        ; preds = %for.body27.lr.ph
  br label %for.body27.prol

for.body27.prol:                                  ; preds = %for.body27.prol.preheader, %for.body27.prol
  %indvars.iv1629.prol = phi i64 [ %indvars.iv.next17.prol, %for.body27.prol ], [ 0, %for.body27.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body27.prol ], [ %xtraiter, %for.body27.prol.preheader ]
  %arrayidx29.prol = getelementptr inbounds double, double* %sum, i64 %indvars.iv1629.prol
  %36 = bitcast double* %arrayidx29.prol to i64*
  %37 = load i64, i64* %36, align 8
  %arrayidx35.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30, i64 %indvars.iv1831, i64 %indvars.iv1629.prol
  %38 = bitcast double* %arrayidx35.prol to i64*
  store i64 %37, i64* %38, align 8
  %indvars.iv.next17.prol = add nuw nsw i64 %indvars.iv1629.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body27.prol.loopexit.loopexit, label %for.body27.prol, !llvm.loop !3

for.body27.prol.loopexit.loopexit:                ; preds = %for.body27.prol
  br label %for.body27.prol.loopexit

for.body27.prol.loopexit:                         ; preds = %for.body27.prol.loopexit.loopexit, %for.body27.lr.ph
  %indvars.iv1629.unr = phi i64 [ 0, %for.body27.lr.ph ], [ %indvars.iv.next17.prol, %for.body27.prol.loopexit.loopexit ]
  br i1 %12, label %for.end38, label %for.body27.preheader

for.body27.preheader:                             ; preds = %for.body27.prol.loopexit
  br label %for.body27

for.body27:                                       ; preds = %for.body27.preheader, %for.body27
  %indvars.iv1629 = phi i64 [ %indvars.iv.next17.3, %for.body27 ], [ %indvars.iv1629.unr, %for.body27.preheader ]
  %arrayidx29 = getelementptr inbounds double, double* %sum, i64 %indvars.iv1629
  %39 = bitcast double* %arrayidx29 to i64*
  %40 = load i64, i64* %39, align 8
  %arrayidx35 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30, i64 %indvars.iv1831, i64 %indvars.iv1629
  %41 = bitcast double* %arrayidx35 to i64*
  store i64 %40, i64* %41, align 8
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv1629, 1
  %arrayidx29.1 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next17
  %42 = bitcast double* %arrayidx29.1 to i64*
  %43 = load i64, i64* %42, align 8
  %arrayidx35.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30, i64 %indvars.iv1831, i64 %indvars.iv.next17
  %44 = bitcast double* %arrayidx35.1 to i64*
  store i64 %43, i64* %44, align 8
  %indvars.iv.next17.1 = add nsw i64 %indvars.iv1629, 2
  %arrayidx29.2 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next17.1
  %45 = bitcast double* %arrayidx29.2 to i64*
  %46 = load i64, i64* %45, align 8
  %arrayidx35.2 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30, i64 %indvars.iv1831, i64 %indvars.iv.next17.1
  %47 = bitcast double* %arrayidx35.2 to i64*
  store i64 %46, i64* %47, align 8
  %indvars.iv.next17.2 = add nsw i64 %indvars.iv1629, 3
  %arrayidx29.3 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next17.2
  %48 = bitcast double* %arrayidx29.3 to i64*
  %49 = load i64, i64* %48, align 8
  %arrayidx35.3 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30, i64 %indvars.iv1831, i64 %indvars.iv.next17.2
  %50 = bitcast double* %arrayidx35.3 to i64*
  store i64 %49, i64* %50, align 8
  %indvars.iv.next17.3 = add nsw i64 %indvars.iv1629, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next17.3, %1
  br i1 %exitcond.3, label %for.end38.loopexit, label %for.body27

for.end38.loopexit:                               ; preds = %for.body27
  br label %for.end38

for.end38:                                        ; preds = %for.end38.loopexit, %for.body27.prol.loopexit, %for.cond4.preheader
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv1831, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next19, %0
  br i1 %exitcond62, label %for.end41.loopexit86, label %for.cond4.preheader

for.end41.loopexit:                               ; preds = %for.end38.us
  br label %for.end41

for.end41.loopexit86:                             ; preds = %for.end38
  br label %for.end41

for.end41:                                        ; preds = %for.end41.loopexit86, %for.end41.loopexit, %for.cond1.preheader
  %.lcssa21 = phi i32 [ %storemerge59, %for.cond1.preheader ], [ %split27.us, %for.end41.loopexit ], [ %storemerge59, %for.end41.loopexit86 ]
  %inc43 = add nsw i32 %.lcssa21, 1
  %cmp = icmp slt i32 %inc43, %nr
  br i1 %cmp, label %for.cond1.preheader, label %for.end44.loopexit

for.end44.loopexit:                               ; preds = %for.end41
  br label %for.end44

for.end44:                                        ; preds = %for.end44.loopexit, %entry
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #1 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %arraydecay = bitcast i8* %call to [140 x [160 x double]]*
  %arraydecay3 = bitcast i8* %call2 to [160 x double]*
  tail call fastcc void @init_array([140 x [160 x double]]* %arraydecay, [160 x double]* %arraydecay3)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay5 = bitcast i8* %call2 to [160 x double]*
  %arraydecay6 = bitcast i8* %call1 to double*
  tail call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %arraydecay, [160 x double]* %arraydecay5, double* %arraydecay6)
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
  tail call fastcc void @print_array([140 x [160 x double]]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([140 x [160 x double]]* nocapture %A, [160 x double]* nocapture %C4) unnamed_addr #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.end14, %entry
  %indvars.iv1420 = phi i64 [ 0, %entry ], [ %indvars.iv.next15, %for.end14 ]
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.end, %for.cond1.preheader
  %indvars.iv1119 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next12, %for.end ]
  %0 = mul nuw nsw i64 %indvars.iv1119, %indvars.iv1420
  br label %for.body6

for.body6:                                        ; preds = %for.body6, %for.cond4.preheader
  %indvars.iv818 = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next9.1, %for.body6 ]
  %1 = add nuw nsw i64 %indvars.iv818, %0
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 160
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 1.600000e+02
  %arrayidx11 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv1420, i64 %indvars.iv1119, i64 %indvars.iv818
  store double %div, double* %arrayidx11, align 8
  %indvars.iv.next9 = or i64 %indvars.iv818, 1
  %3 = add nuw nsw i64 %indvars.iv.next9, %0
  %4 = trunc i64 %3 to i32
  %rem.1 = srem i32 %4, 160
  %conv.1 = sitofp i32 %rem.1 to double
  %div.1 = fdiv double %conv.1, 1.600000e+02
  %arrayidx11.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv1420, i64 %indvars.iv1119, i64 %indvars.iv.next9
  store double %div.1, double* %arrayidx11.1, align 8
  %indvars.iv.next9.1 = add nsw i64 %indvars.iv818, 2
  %exitcond22.1 = icmp eq i64 %indvars.iv.next9.1, 160
  br i1 %exitcond22.1, label %for.end, label %for.body6

for.end:                                          ; preds = %for.body6
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv1119, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next12, 140
  br i1 %exitcond23, label %for.end14, label %for.cond4.preheader

for.end14:                                        ; preds = %for.end
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv1420, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next15, 150
  br i1 %exitcond24, label %for.cond22.preheader.preheader, label %for.cond1.preheader

for.cond22.preheader.preheader:                   ; preds = %for.end14
  br label %for.cond22.preheader

for.cond22.preheader:                             ; preds = %for.cond22.preheader.preheader, %for.end37
  %indvars.iv617 = phi i64 [ %indvars.iv.next7, %for.end37 ], [ 0, %for.cond22.preheader.preheader ]
  br label %for.body25

for.body25:                                       ; preds = %for.body25, %for.cond22.preheader
  %indvars.iv16 = phi i64 [ 0, %for.cond22.preheader ], [ %indvars.iv.next.1, %for.body25 ]
  %5 = mul nuw nsw i64 %indvars.iv16, %indvars.iv617
  %6 = trunc i64 %5 to i32
  %rem27 = srem i32 %6, 160
  %conv28 = sitofp i32 %rem27 to double
  %div30 = fdiv double %conv28, 1.600000e+02
  %arrayidx34 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv617, i64 %indvars.iv16
  store double %div30, double* %arrayidx34, align 8
  %indvars.iv.next = or i64 %indvars.iv16, 1
  %7 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv617
  %8 = trunc i64 %7 to i32
  %rem27.1 = srem i32 %8, 160
  %conv28.1 = sitofp i32 %rem27.1 to double
  %div30.1 = fdiv double %conv28.1, 1.600000e+02
  %arrayidx34.1 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv617, i64 %indvars.iv.next
  store double %div30.1, double* %arrayidx34.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv16, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %for.end37, label %for.body25

for.end37:                                        ; preds = %for.body25
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv617, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next7, 160
  br i1 %exitcond21, label %for.end40, label %for.cond22.preheader

for.end40:                                        ; preds = %for.end37
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([140 x [160 x double]]* nocapture readonly %A) unnamed_addr #1 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.end20, %entry
  %indvars.iv712 = phi i64 [ 0, %entry ], [ %indvars.iv.next8, %for.end20 ]
  %3 = mul nuw nsw i64 %indvars.iv712, 140
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.end, %for.cond2.preheader
  %indvars.iv511 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next6, %for.end ]
  %mul83 = add nuw nsw i64 %indvars.iv511, %3
  %add = mul nuw nsw i64 %mul83, 160
  br label %for.body7

for.body7:                                        ; preds = %if.end, %for.cond5.preheader
  %indvars.iv10 = phi i64 [ 0, %for.cond5.preheader ], [ %indvars.iv.next, %if.end ]
  %4 = add nuw nsw i64 %indvars.iv10, %add
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp11 = icmp eq i32 %rem, 0
  br i1 %cmp11, label %if.then, label %if.end

if.then:                                          ; preds = %for.body7
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body7
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv712, i64 %indvars.iv511, i64 %indvars.iv10
  %8 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv10, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond, label %for.end, label %for.body7

for.end:                                          ; preds = %if.end
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv511, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next6, 140
  br i1 %exitcond13, label %for.end20, label %for.cond5.preheader

for.end20:                                        ; preds = %for.end
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv712, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next8, 150
  br i1 %exitcond14, label %for.end23, label %for.cond2.preheader

for.end23:                                        ; preds = %for.end20
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
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
