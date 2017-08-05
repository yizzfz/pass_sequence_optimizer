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
define void @kernel_doitgen(i32 %nr, i32 %nq, i32 %np, [140 x [160 x double]]* nocapture %A, [160 x double]* %C4, double* %sum) local_unnamed_addr #0 {
entry:
  %C4.addr = alloca [160 x double]*, align 8
  %p = alloca i32, align 4
  %s = alloca i32, align 4
  store [160 x double]* %C4, [160 x double]** %C4.addr, align 8
  %0 = sext i32 %nq to i64
  %cmp84 = icmp sgt i32 %nr, 0
  br i1 %cmp84, label %for.body.lr.ph, label %for.end44

for.body.lr.ph:                                   ; preds = %entry
  %1 = sext i32 %np to i64
  %s.promoted85 = load i32, i32* %s, align 4
  %p.promoted = load i32, i32* %p, align 4
  %2 = shl nsw i64 %1, 3
  %3 = sext i32 %np to i64
  %xtraiter100 = and i64 %1, 1
  %4 = sext i32 %np to i64
  %5 = icmp sgt i32 %nq, 0
  %6 = icmp sgt i32 %np, 0
  %7 = icmp sgt i32 %np, 0
  %8 = icmp eq i64 %xtraiter100, 0
  %9 = icmp eq i32 %np, 1
  %sunkaddr = ptrtoint double* %sum to i64
  %10 = ptrtoint double* %sum to i64
  %11 = icmp sgt i32 %np, 0
  %12 = bitcast double* %sum to i8*
  br label %for.body

for.body:                                         ; preds = %for.end41, %for.body.lr.ph
  %.lcssa4251.lcssa88 = phi i32 [ %p.promoted, %for.body.lr.ph ], [ %.lcssa4251.lcssa89, %for.end41 ]
  %.lcssa2938.lcssa50.lcssa87 = phi i32 [ %s.promoted85, %for.body.lr.ph ], [ %.lcssa2938.lcssa50.lcssa86, %for.end41 ]
  %13 = phi i32 [ 0, %for.body.lr.ph ], [ %inc43, %for.end41 ]
  br i1 %5, label %for.body3.lr.ph, label %for.end41

for.body3.lr.ph:                                  ; preds = %for.body
  %idxprom10 = sext i32 %13 to i64
  br i1 %6, label %for.body3.us.preheader, label %for.body3.preheader

for.body3.us.preheader:                           ; preds = %for.body3.lr.ph
  br label %for.body3.us

for.body3.preheader:                              ; preds = %for.body3.lr.ph
  %idxprom30 = sext i32 %13 to i64
  br label %for.body3

for.body3.us:                                     ; preds = %for.body3.us.preheader, %for.end38.us
  %.lcssa2938.lcssa49.us = phi i32 [ %.lcssa2938.lcssa50.us, %for.end38.us ], [ %.lcssa2938.lcssa50.lcssa87, %for.body3.us.preheader ]
  %14 = phi i32 [ %.lcssa18.us, %for.end38.us ], [ %13, %for.body3.us.preheader ]
  %indvars.iv1444.us = phi i64 [ %indvars.iv.next15.us, %for.end38.us ], [ 0, %for.body3.us.preheader ]
  br i1 %7, label %for.body6.lr.ph.us, label %for.end24.us

for.end24.us.loopexit:                            ; preds = %for.cond7.for.end_crit_edge.us.us
  br label %for.end24.us

for.end24.us:                                     ; preds = %for.end24.us.loopexit, %for.body3.us
  %.lcssa2938.lcssa50.us = phi i32 [ %.lcssa2938.lcssa49.us, %for.body3.us ], [ %np, %for.end24.us.loopexit ]
  %.lcssa18.us = phi i32 [ %14, %for.body3.us ], [ %13, %for.end24.us.loopexit ]
  %.lcssa17.us = phi i64 [ %3, %for.body3.us ], [ %1, %for.end24.us.loopexit ]
  %cmp2640.us = icmp sgt i64 %.lcssa17.us, 0
  br i1 %cmp2640.us, label %for.body27.lr.ph.us, label %for.end38.us

for.end38.us:                                     ; preds = %for.end24.us, %for.cond25.for.end38_crit_edge.us
  %.lcssa4251.us = phi i32 [ %40, %for.cond25.for.end38_crit_edge.us ], [ 0, %for.end24.us ]
  %indvars.iv.next15.us = add nuw nsw i64 %indvars.iv1444.us, 1
  %exitcond99 = icmp eq i64 %indvars.iv.next15.us, %0
  br i1 %exitcond99, label %for.end41.loopexit, label %for.body3.us

for.body27.us:                                    ; preds = %for.body27.us.preheader, %for.body27.us
  %indvars.iv1241.us = phi i64 [ %indvars.iv.next13.us.3, %for.body27.us ], [ %indvars.iv1241.us.unr, %for.body27.us.preheader ]
  %arrayidx29.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv1241.us
  %15 = bitcast double* %arrayidx29.us to i64*
  %16 = load i64, i64* %15, align 8
  %arrayidx35.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv1444.us, i64 %indvars.iv1241.us
  %17 = bitcast double* %arrayidx35.us to i64*
  store i64 %16, i64* %17, align 8
  %indvars.iv.next13.us = add nuw nsw i64 %indvars.iv1241.us, 1
  %arrayidx29.us.1 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next13.us
  %18 = bitcast double* %arrayidx29.us.1 to i64*
  %19 = load i64, i64* %18, align 8
  %arrayidx35.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv1444.us, i64 %indvars.iv.next13.us
  %20 = bitcast double* %arrayidx35.us.1 to i64*
  store i64 %19, i64* %20, align 8
  %indvars.iv.next13.us.1 = add nsw i64 %indvars.iv1241.us, 2
  %arrayidx29.us.2 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next13.us.1
  %21 = bitcast double* %arrayidx29.us.2 to i64*
  %22 = load i64, i64* %21, align 8
  %arrayidx35.us.2 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv1444.us, i64 %indvars.iv.next13.us.1
  %23 = bitcast double* %arrayidx35.us.2 to i64*
  store i64 %22, i64* %23, align 8
  %indvars.iv.next13.us.2 = add nsw i64 %indvars.iv1241.us, 3
  %arrayidx29.us.3 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next13.us.2
  %24 = bitcast double* %arrayidx29.us.3 to i64*
  %25 = load i64, i64* %24, align 8
  %arrayidx35.us.3 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv1444.us, i64 %indvars.iv.next13.us.2
  %26 = bitcast double* %arrayidx35.us.3 to i64*
  store i64 %25, i64* %26, align 8
  %indvars.iv.next13.us.3 = add nsw i64 %indvars.iv1241.us, 4
  %exitcond96.3 = icmp eq i64 %indvars.iv.next13.us.3, %.lcssa17.us
  br i1 %exitcond96.3, label %for.cond25.for.end38_crit_edge.us.loopexit, label %for.body27.us

for.body6.lr.ph.us:                               ; preds = %for.body3.us
  %27 = load [160 x double]*, [160 x double]** %C4.addr, align 8
  %arrayidx15.us.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom10, i64 %indvars.iv1444.us, i64 0
  br label %for.body6.us.us

for.body6.us.us:                                  ; preds = %for.cond7.for.end_crit_edge.us.us, %for.body6.lr.ph.us
  %indvars.iv1031.us.us = phi i64 [ 0, %for.body6.lr.ph.us ], [ %indvars.iv.next11.us.us, %for.cond7.for.end_crit_edge.us.us ]
  %arrayidx.us.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv1031.us.us
  store double 0.000000e+00, double* %arrayidx.us.us, align 8
  br i1 %8, label %for.body9.us.us.prol.loopexit, label %for.body9.us.us.prol

for.body9.us.us.prol:                             ; preds = %for.body6.us.us
  %28 = load double, double* %arrayidx15.us.us.prol, align 8
  %arrayidx19.us.us.prol = getelementptr inbounds [160 x double], [160 x double]* %27, i64 0, i64 %indvars.iv1031.us.us
  %29 = load double, double* %arrayidx19.us.us.prol, align 8
  %mul.us.us.prol = fmul double %28, %29
  %add.us.us.prol = fadd double %mul.us.us.prol, 0.000000e+00
  %sunkaddr105 = shl i64 %indvars.iv1031.us.us, 3
  %sunkaddr106 = add i64 %10, %sunkaddr105
  %sunkaddr107 = inttoptr i64 %sunkaddr106 to double*
  store double %add.us.us.prol, double* %sunkaddr107, align 8
  br label %for.body9.us.us.prol.loopexit

for.body9.us.us.prol.loopexit:                    ; preds = %for.body6.us.us, %for.body9.us.us.prol
  %.unr.ph = phi double [ %add.us.us.prol, %for.body9.us.us.prol ], [ 0.000000e+00, %for.body6.us.us ]
  %indvars.iv27.us.us.unr.ph = phi i64 [ 1, %for.body9.us.us.prol ], [ 0, %for.body6.us.us ]
  br i1 %9, label %for.cond7.for.end_crit_edge.us.us, label %for.body9.us.us.preheader

for.body9.us.us.preheader:                        ; preds = %for.body9.us.us.prol.loopexit
  %sunkaddr114 = shl i64 %indvars.iv1031.us.us, 3
  %sunkaddr115 = add i64 %sunkaddr, %sunkaddr114
  %sunkaddr116 = inttoptr i64 %sunkaddr115 to double*
  br label %for.body9.us.us

for.cond7.for.end_crit_edge.us.us.loopexit:       ; preds = %for.body9.us.us
  br label %for.cond7.for.end_crit_edge.us.us

for.cond7.for.end_crit_edge.us.us:                ; preds = %for.cond7.for.end_crit_edge.us.us.loopexit, %for.body9.us.us.prol.loopexit
  %indvars.iv.next11.us.us = add nuw nsw i64 %indvars.iv1031.us.us, 1
  %exitcond95 = icmp eq i64 %indvars.iv.next11.us.us, %1
  br i1 %exitcond95, label %for.end24.us.loopexit, label %for.body6.us.us

for.body9.us.us:                                  ; preds = %for.body9.us.us, %for.body9.us.us.preheader
  %30 = phi double [ %.unr.ph, %for.body9.us.us.preheader ], [ %add.us.us.1, %for.body9.us.us ]
  %indvars.iv27.us.us = phi i64 [ %indvars.iv27.us.us.unr.ph, %for.body9.us.us.preheader ], [ %indvars.iv.next.us.us.1, %for.body9.us.us ]
  %arrayidx15.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom10, i64 %indvars.iv1444.us, i64 %indvars.iv27.us.us
  %31 = load double, double* %arrayidx15.us.us, align 8
  %arrayidx19.us.us = getelementptr inbounds [160 x double], [160 x double]* %27, i64 %indvars.iv27.us.us, i64 %indvars.iv1031.us.us
  %32 = load double, double* %arrayidx19.us.us, align 8
  %mul.us.us = fmul double %31, %32
  %add.us.us = fadd double %30, %mul.us.us
  store double %add.us.us, double* %sunkaddr116, align 8
  %indvars.iv.next.us.us = add nuw nsw i64 %indvars.iv27.us.us, 1
  %arrayidx15.us.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom10, i64 %indvars.iv1444.us, i64 %indvars.iv.next.us.us
  %33 = load double, double* %arrayidx15.us.us.1, align 8
  %arrayidx19.us.us.1 = getelementptr inbounds [160 x double], [160 x double]* %27, i64 %indvars.iv.next.us.us, i64 %indvars.iv1031.us.us
  %34 = load double, double* %arrayidx19.us.us.1, align 8
  %mul.us.us.1 = fmul double %33, %34
  %add.us.us.1 = fadd double %add.us.us, %mul.us.us.1
  store double %add.us.us.1, double* %sunkaddr116, align 8
  %indvars.iv.next.us.us.1 = add nsw i64 %indvars.iv27.us.us, 2
  %exitcond94.1 = icmp eq i64 %indvars.iv.next.us.us.1, %1
  br i1 %exitcond94.1, label %for.cond7.for.end_crit_edge.us.us.loopexit, label %for.body9.us.us

for.body27.lr.ph.us:                              ; preds = %for.end24.us
  %idxprom30.us = sext i32 %.lcssa18.us to i64
  %35 = add nsw i64 %.lcssa17.us, -1
  %xtraiter102 = and i64 %.lcssa17.us, 3
  %lcmp.mod103 = icmp eq i64 %xtraiter102, 0
  br i1 %lcmp.mod103, label %for.body27.us.prol.loopexit, label %for.body27.us.prol.preheader

for.body27.us.prol.preheader:                     ; preds = %for.body27.lr.ph.us
  br label %for.body27.us.prol

for.body27.us.prol:                               ; preds = %for.body27.us.prol.preheader, %for.body27.us.prol
  %indvars.iv1241.us.prol = phi i64 [ %indvars.iv.next13.us.prol, %for.body27.us.prol ], [ 0, %for.body27.us.prol.preheader ]
  %prol.iter104 = phi i64 [ %prol.iter104.sub, %for.body27.us.prol ], [ %xtraiter102, %for.body27.us.prol.preheader ]
  %arrayidx29.us.prol = getelementptr inbounds double, double* %sum, i64 %indvars.iv1241.us.prol
  %36 = bitcast double* %arrayidx29.us.prol to i64*
  %37 = load i64, i64* %36, align 8
  %arrayidx35.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv1444.us, i64 %indvars.iv1241.us.prol
  %38 = bitcast double* %arrayidx35.us.prol to i64*
  store i64 %37, i64* %38, align 8
  %indvars.iv.next13.us.prol = add nuw nsw i64 %indvars.iv1241.us.prol, 1
  %prol.iter104.sub = add i64 %prol.iter104, -1
  %prol.iter104.cmp = icmp eq i64 %prol.iter104.sub, 0
  br i1 %prol.iter104.cmp, label %for.body27.us.prol.loopexit.loopexit, label %for.body27.us.prol, !llvm.loop !1

for.body27.us.prol.loopexit.loopexit:             ; preds = %for.body27.us.prol
  br label %for.body27.us.prol.loopexit

for.body27.us.prol.loopexit:                      ; preds = %for.body27.us.prol.loopexit.loopexit, %for.body27.lr.ph.us
  %indvars.iv1241.us.unr = phi i64 [ 0, %for.body27.lr.ph.us ], [ %indvars.iv.next13.us.prol, %for.body27.us.prol.loopexit.loopexit ]
  %39 = icmp ult i64 %35, 3
  br i1 %39, label %for.cond25.for.end38_crit_edge.us, label %for.body27.us.preheader

for.body27.us.preheader:                          ; preds = %for.body27.us.prol.loopexit
  br label %for.body27.us

for.cond25.for.end38_crit_edge.us.loopexit:       ; preds = %for.body27.us
  br label %for.cond25.for.end38_crit_edge.us

for.cond25.for.end38_crit_edge.us:                ; preds = %for.cond25.for.end38_crit_edge.us.loopexit, %for.body27.us.prol.loopexit
  %40 = trunc i64 %.lcssa17.us to i32
  br label %for.end38.us

for.body3:                                        ; preds = %for.end38, %for.body3.preheader
  %.lcssa2938.lcssa49 = phi i32 [ %.lcssa2938.lcssa50.lcssa87, %for.body3.preheader ], [ %.lcssa2938.lcssa50, %for.end38 ]
  %indvars.iv1444 = phi i64 [ 0, %for.body3.preheader ], [ %indvars.iv.next15, %for.end38 ]
  br i1 %11, label %for.body6.lr.ph, label %for.end24

for.body6.lr.ph:                                  ; preds = %for.body3
  call void @llvm.memset.p0i8.i64(i8* %12, i8 0, i64 %2, i32 8, i1 false)
  br label %for.end24

for.end24:                                        ; preds = %for.body3, %for.body6.lr.ph
  %.lcssa2938.lcssa50 = phi i32 [ 0, %for.body6.lr.ph ], [ %.lcssa2938.lcssa49, %for.body3 ]
  %.lcssa17 = phi i64 [ %1, %for.body6.lr.ph ], [ %4, %for.body3 ]
  %cmp2640 = icmp sgt i64 %.lcssa17, 0
  br i1 %cmp2640, label %for.body27.lr.ph, label %for.end38

for.body27.lr.ph:                                 ; preds = %for.end24
  %41 = add nsw i64 %.lcssa17, -1
  %xtraiter = and i64 %.lcssa17, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %for.body27.prol.loopexit, label %for.body27.prol.preheader

for.body27.prol.preheader:                        ; preds = %for.body27.lr.ph
  br label %for.body27.prol

for.body27.prol:                                  ; preds = %for.body27.prol.preheader, %for.body27.prol
  %indvars.iv1241.prol = phi i64 [ %indvars.iv.next13.prol, %for.body27.prol ], [ 0, %for.body27.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.body27.prol ], [ %xtraiter, %for.body27.prol.preheader ]
  %arrayidx29.prol = getelementptr inbounds double, double* %sum, i64 %indvars.iv1241.prol
  %42 = bitcast double* %arrayidx29.prol to i64*
  %43 = load i64, i64* %42, align 8
  %arrayidx35.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30, i64 %indvars.iv1444, i64 %indvars.iv1241.prol
  %44 = bitcast double* %arrayidx35.prol to i64*
  store i64 %43, i64* %44, align 8
  %indvars.iv.next13.prol = add nuw nsw i64 %indvars.iv1241.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.body27.prol.loopexit.loopexit, label %for.body27.prol, !llvm.loop !3

for.body27.prol.loopexit.loopexit:                ; preds = %for.body27.prol
  br label %for.body27.prol.loopexit

for.body27.prol.loopexit:                         ; preds = %for.body27.prol.loopexit.loopexit, %for.body27.lr.ph
  %indvars.iv1241.unr = phi i64 [ 0, %for.body27.lr.ph ], [ %indvars.iv.next13.prol, %for.body27.prol.loopexit.loopexit ]
  %45 = icmp ult i64 %41, 3
  br i1 %45, label %for.end38.loopexit, label %for.body27.preheader

for.body27.preheader:                             ; preds = %for.body27.prol.loopexit
  br label %for.body27

for.body27:                                       ; preds = %for.body27.preheader, %for.body27
  %indvars.iv1241 = phi i64 [ %indvars.iv.next13.3, %for.body27 ], [ %indvars.iv1241.unr, %for.body27.preheader ]
  %arrayidx29 = getelementptr inbounds double, double* %sum, i64 %indvars.iv1241
  %46 = bitcast double* %arrayidx29 to i64*
  %47 = load i64, i64* %46, align 8
  %arrayidx35 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30, i64 %indvars.iv1444, i64 %indvars.iv1241
  %48 = bitcast double* %arrayidx35 to i64*
  store i64 %47, i64* %48, align 8
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv1241, 1
  %arrayidx29.1 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next13
  %49 = bitcast double* %arrayidx29.1 to i64*
  %50 = load i64, i64* %49, align 8
  %arrayidx35.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30, i64 %indvars.iv1444, i64 %indvars.iv.next13
  %51 = bitcast double* %arrayidx35.1 to i64*
  store i64 %50, i64* %51, align 8
  %indvars.iv.next13.1 = add nsw i64 %indvars.iv1241, 2
  %arrayidx29.2 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next13.1
  %52 = bitcast double* %arrayidx29.2 to i64*
  %53 = load i64, i64* %52, align 8
  %arrayidx35.2 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30, i64 %indvars.iv1444, i64 %indvars.iv.next13.1
  %54 = bitcast double* %arrayidx35.2 to i64*
  store i64 %53, i64* %54, align 8
  %indvars.iv.next13.2 = add nsw i64 %indvars.iv1241, 3
  %arrayidx29.3 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next13.2
  %55 = bitcast double* %arrayidx29.3 to i64*
  %56 = load i64, i64* %55, align 8
  %arrayidx35.3 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30, i64 %indvars.iv1444, i64 %indvars.iv.next13.2
  %57 = bitcast double* %arrayidx35.3 to i64*
  store i64 %56, i64* %57, align 8
  %indvars.iv.next13.3 = add nsw i64 %indvars.iv1241, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next13.3, %.lcssa17
  br i1 %exitcond.3, label %for.end38.loopexit.loopexit, label %for.body27

for.end38.loopexit.loopexit:                      ; preds = %for.body27
  br label %for.end38.loopexit

for.end38.loopexit:                               ; preds = %for.end38.loopexit.loopexit, %for.body27.prol.loopexit
  %58 = trunc i64 %.lcssa17 to i32
  br label %for.end38

for.end38:                                        ; preds = %for.end24, %for.end38.loopexit
  %.lcssa4251 = phi i32 [ %58, %for.end38.loopexit ], [ 0, %for.end24 ]
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv1444, 1
  %exitcond93 = icmp eq i64 %indvars.iv.next15, %0
  br i1 %exitcond93, label %for.end41.loopexit117, label %for.body3

for.end41.loopexit:                               ; preds = %for.end38.us
  br label %for.end41

for.end41.loopexit117:                            ; preds = %for.end38
  br label %for.end41

for.end41:                                        ; preds = %for.end41.loopexit117, %for.end41.loopexit, %for.body
  %.lcssa4251.lcssa89 = phi i32 [ %.lcssa4251.lcssa88, %for.body ], [ %.lcssa4251.us, %for.end41.loopexit ], [ %.lcssa4251, %for.end41.loopexit117 ]
  %.lcssa2938.lcssa50.lcssa86 = phi i32 [ %.lcssa2938.lcssa50.lcssa87, %for.body ], [ %.lcssa2938.lcssa50.us, %for.end41.loopexit ], [ %.lcssa2938.lcssa50, %for.end41.loopexit117 ]
  %.lcssa22 = phi i32 [ %13, %for.body ], [ %.lcssa18.us, %for.end41.loopexit ], [ %13, %for.end41.loopexit117 ]
  %inc43 = add nsw i32 %.lcssa22, 1
  %cmp = icmp slt i32 %inc43, %nr
  br i1 %cmp, label %for.body, label %for.cond.for.end44_crit_edge

for.cond.for.end44_crit_edge:                     ; preds = %for.end41
  store i32 %.lcssa2938.lcssa50.lcssa86, i32* %s, align 4
  store i32 %.lcssa4251.lcssa89, i32* %p, align 4
  br label %for.end44

for.end44:                                        ; preds = %entry, %for.cond.for.end44_crit_edge
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #1 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #5
  %call1 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #5
  %call2 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #5
  %arraydecay = bitcast i8* %call to [140 x [160 x double]]*
  %arraydecay3 = bitcast i8* %call2 to [160 x double]*
  tail call fastcc void @init_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %arraydecay, [160 x double]* %arraydecay3)
  tail call void (...) @polybench_timer_start() #5
  %arraydecay6 = bitcast i8* %call1 to double*
  tail call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %arraydecay, [160 x double]* %arraydecay3, double* %arraydecay6)
  tail call void (...) @polybench_timer_stop() #5
  tail call void (...) @polybench_timer_print() #5
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = bitcast i8* %call to [140 x [160 x double]]*
  tail call fastcc void @print_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #5
  tail call void @free(i8* %call1) #5
  tail call void @free(i8* %call2) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %nr, i32 %nq, i32 %np, [140 x [160 x double]]* nocapture %A, [160 x double]* nocapture %C4) unnamed_addr #0 {
entry:
  br label %for.body

for.body:                                         ; preds = %for.end14, %entry
  %indvars.iv1019 = phi i64 [ 0, %entry ], [ %indvars.iv.next11, %for.end14 ]
  br label %for.body3

for.body3:                                        ; preds = %for.end, %for.body
  %indvars.iv717 = phi i64 [ 0, %for.body ], [ %indvars.iv.next8, %for.end ]
  %0 = mul nuw nsw i64 %indvars.iv717, %indvars.iv1019
  br label %for.body6

for.body6:                                        ; preds = %for.body6, %for.body3
  %indvars.iv415 = phi i64 [ 0, %for.body3 ], [ %indvars.iv.next5.1, %for.body6 ]
  %1 = add nuw nsw i64 %indvars.iv415, %0
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 160
  %conv = sitofp i32 %rem to double
  %arrayidx11 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv1019, i64 %indvars.iv717, i64 %indvars.iv415
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
  %exitcond22.1 = icmp eq i64 %indvars.iv.next5.1, 160
  br i1 %exitcond22.1, label %for.end, label %for.body6

for.end:                                          ; preds = %for.body6
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv717, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next8, 140
  br i1 %exitcond23, label %for.end14, label %for.body3

for.end14:                                        ; preds = %for.end
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv1019, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next11, 150
  br i1 %exitcond24, label %for.body21.preheader, label %for.body

for.body21.preheader:                             ; preds = %for.end14
  br label %for.body21

for.body21:                                       ; preds = %for.body21.preheader, %for.end37
  %indvars.iv213 = phi i64 [ %indvars.iv.next3, %for.end37 ], [ 0, %for.body21.preheader ]
  br label %for.body25

for.body25:                                       ; preds = %for.body25, %for.body21
  %indvars.iv12 = phi i64 [ 0, %for.body21 ], [ %indvars.iv.next.1, %for.body25 ]
  %6 = mul nuw nsw i64 %indvars.iv12, %indvars.iv213
  %7 = trunc i64 %6 to i32
  %rem27 = srem i32 %7, 160
  %conv28 = sitofp i32 %rem27 to double
  %arrayidx34 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv213, i64 %indvars.iv12
  %indvars.iv.next = or i64 %indvars.iv12, 1
  %8 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv213
  %9 = trunc i64 %8 to i32
  %rem27.1 = srem i32 %9, 160
  %conv28.1 = sitofp i32 %rem27.1 to double
  %div30.v.i0.1 = insertelement <2 x double> undef, double %conv28, i32 0
  %div30.v.i0.2 = insertelement <2 x double> %div30.v.i0.1, double %conv28.1, i32 1
  %div30 = fdiv <2 x double> %div30.v.i0.2, <double 1.600000e+02, double 1.600000e+02>
  %10 = bitcast double* %arrayidx34 to <2 x double>*
  store <2 x double> %div30, <2 x double>* %10, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv12, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %for.end37, label %for.body25

for.end37:                                        ; preds = %for.body25
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv213, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next3, 160
  br i1 %exitcond21, label %for.end40, label %for.body21

for.end40:                                        ; preds = %for.end37
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %nr, i32 %nq, i32 %np, [140 x [160 x double]]* nocapture readonly %A) unnamed_addr #1 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.body

for.body:                                         ; preds = %for.end20, %entry
  %indvars.iv615 = phi i64 [ 0, %entry ], [ %indvars.iv.next7, %for.end20 ]
  %3 = mul nuw nsw i64 %indvars.iv615, 140
  br label %for.body4

for.body4:                                        ; preds = %for.end, %for.body
  %indvars.iv213 = phi i64 [ 0, %for.body ], [ %indvars.iv.next3, %for.end ]
  %tmp = add nuw nsw i64 %indvars.iv213, %3
  %tmp11 = mul nuw nsw i64 %tmp, 160
  br label %for.body7

for.body7:                                        ; preds = %if.end, %for.body4
  %indvars.iv12 = phi i64 [ 0, %for.body4 ], [ %indvars.iv.next, %if.end ]
  %4 = add nuw nsw i64 %indvars.iv12, %tmp11
  %5 = trunc i64 %4 to i32
  %rem = srem i32 %5, 20
  %cmp11 = icmp eq i32 %rem, 0
  br i1 %cmp11, label %if.then, label %if.end

if.then:                                          ; preds = %for.body7
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #6
  br label %if.end

if.end:                                           ; preds = %for.body7, %if.then
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv615, i64 %indvars.iv213, i64 %indvars.iv12
  %8 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv12, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond, label %for.end, label %for.body7

for.end:                                          ; preds = %if.end
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv213, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next3, 140
  br i1 %exitcond17, label %for.end20, label %for.body4

for.end20:                                        ; preds = %for.end
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv615, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next7, 150
  br i1 %exitcond18, label %for.end23, label %for.body

for.end23:                                        ; preds = %for.end20
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #2

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #5

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #5

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { argmemonly nounwind }
attributes #5 = { nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !2}
