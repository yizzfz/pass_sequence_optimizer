; ModuleID = 'B.ll'
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
  %cmp31 = icmp sgt i32 %nr, 0
  br i1 %cmp31, label %for.cond1.preheader.lr.ph, label %for.end44

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp229 = icmp sgt i32 %nq, 0
  %cmp525 = icmp sgt i32 %np, 0
  %0 = add i32 %np, -1
  %1 = sext i32 %nq to i64
  %2 = zext i32 %0 to i64
  %3 = sext i32 %np to i64
  %4 = sext i32 %nr to i64
  %5 = add nuw nsw i64 %2, 1
  %scevgep85 = getelementptr double, double* %sum, i64 %5
  %6 = add nsw i64 %1, -1
  %7 = and i64 %5, 8589934588
  %8 = add nsw i64 %7, -4
  %9 = lshr exact i64 %8, 2
  %10 = add nuw nsw i64 %9, 1
  %11 = add nuw nsw i64 %2, 1
  %12 = trunc i64 %10 to i2
  %13 = zext i2 %12 to i64
  %14 = shl i64 %13, 2
  %xtraiter126 = and i64 %5, 1
  %lcmp.mod127 = icmp eq i64 %xtraiter126, 0
  %15 = icmp eq i32 %0, 0
  %min.iters.check = icmp ult i64 %5, 4
  %n.vec = and i64 %5, 8589934588
  %cmp.zero = icmp eq i64 %n.vec, 0
  %xtraiter128 = and i64 %10, 3
  %lcmp.mod129 = icmp eq i64 %xtraiter128, 0
  %16 = icmp ult i64 %8, 12
  %cmp.n = icmp eq i64 %5, %n.vec
  %xtraiter = and i64 %1, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %17 = icmp ult i64 %6, 7
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc42, %for.cond1.preheader.lr.ph
  %indvars.iv78 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next79, %for.inc42 ]
  br i1 %cmp229, label %for.cond4.preheader.lr.ph, label %for.inc42

for.cond4.preheader.lr.ph:                        ; preds = %for.cond1.preheader
  br i1 %cmp525, label %for.cond4.preheader.us.preheader, label %for.cond4.preheader.preheader

for.cond4.preheader.preheader:                    ; preds = %for.cond4.preheader.lr.ph
  br i1 %lcmp.mod, label %for.cond4.preheader.prol.loopexit, label %for.cond4.preheader.prol.preheader

for.cond4.preheader.prol.preheader:               ; preds = %for.cond4.preheader.preheader
  br label %for.cond4.preheader.prol

for.cond4.preheader.prol:                         ; preds = %for.cond4.preheader.prol, %for.cond4.preheader.prol.preheader
  %prol.iter = phi i64 [ %prol.iter.sub, %for.cond4.preheader.prol ], [ %xtraiter, %for.cond4.preheader.prol.preheader ]
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.cond4.preheader.prol.loopexit.unr-lcssa, label %for.cond4.preheader.prol, !llvm.loop !1

for.cond4.preheader.prol.loopexit.unr-lcssa:      ; preds = %for.cond4.preheader.prol
  br label %for.cond4.preheader.prol.loopexit

for.cond4.preheader.prol.loopexit:                ; preds = %for.cond4.preheader.prol.loopexit.unr-lcssa, %for.cond4.preheader.preheader
  %indvars.iv56.unr = phi i64 [ 0, %for.cond4.preheader.preheader ], [ %xtraiter, %for.cond4.preheader.prol.loopexit.unr-lcssa ]
  br i1 %17, label %for.inc42.loopexit125, label %for.cond4.preheader.preheader.new

for.cond4.preheader.preheader.new:                ; preds = %for.cond4.preheader.prol.loopexit
  br label %for.cond4.preheader

for.cond4.preheader.us.preheader:                 ; preds = %for.cond4.preheader.lr.ph
  br label %for.cond4.preheader.us

for.cond4.preheader.us:                           ; preds = %for.inc39.us, %for.cond4.preheader.us.preheader
  %indvars.iv76 = phi i64 [ %indvars.iv.next77, %for.inc39.us ], [ 0, %for.cond4.preheader.us.preheader ]
  %arrayidx15.us.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv78, i64 %indvars.iv76, i64 0
  br label %for.body6.us.us

for.body27.us.preheader:                          ; preds = %for.inc22.us.us
  %scevgep = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv78, i64 %indvars.iv76, i64 0
  %scevgep83 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv78, i64 %indvars.iv76, i64 %5
  br i1 %min.iters.check, label %for.body27.us.preheader124, label %min.iters.checked

min.iters.checked:                                ; preds = %for.body27.us.preheader
  br i1 %cmp.zero, label %for.body27.us.preheader124, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep85
  %bound1 = icmp ugt double* %scevgep83, %sum
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.body27.us.preheader124, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br i1 %lcmp.mod129, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter130 = phi i64 [ %prol.iter130.sub, %vector.body.prol ], [ %xtraiter128, %vector.body.prol.preheader ]
  %18 = getelementptr inbounds double, double* %sum, i64 %index.prol
  %19 = bitcast double* %18 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %19, align 8, !alias.scope !3
  %20 = getelementptr double, double* %18, i64 2
  %21 = bitcast double* %20 to <2 x i64>*
  %wide.load88.prol = load <2 x i64>, <2 x i64>* %21, align 8, !alias.scope !3
  %22 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv78, i64 %indvars.iv76, i64 %index.prol
  %23 = bitcast double* %22 to <2 x i64>*
  store <2 x i64> %wide.load.prol, <2 x i64>* %23, align 8, !alias.scope !6, !noalias !3
  %24 = getelementptr double, double* %22, i64 2
  %25 = bitcast double* %24 to <2 x i64>*
  store <2 x i64> %wide.load88.prol, <2 x i64>* %25, align 8, !alias.scope !6, !noalias !3
  %index.next.prol = add nuw nsw i64 %index.prol, 4
  %prol.iter130.sub = add nsw i64 %prol.iter130, -1
  %prol.iter130.cmp = icmp eq i64 %prol.iter130.sub, 0
  br i1 %prol.iter130.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !8

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %14, %vector.body.prol.loopexit.unr-lcssa ]
  br i1 %16, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %26 = getelementptr inbounds double, double* %sum, i64 %index
  %27 = bitcast double* %26 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %27, align 8, !alias.scope !3
  %28 = getelementptr double, double* %26, i64 2
  %29 = bitcast double* %28 to <2 x i64>*
  %wide.load88 = load <2 x i64>, <2 x i64>* %29, align 8, !alias.scope !3
  %30 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv78, i64 %indvars.iv76, i64 %index
  %31 = bitcast double* %30 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %31, align 8, !alias.scope !6, !noalias !3
  %32 = getelementptr double, double* %30, i64 2
  %33 = bitcast double* %32 to <2 x i64>*
  store <2 x i64> %wide.load88, <2 x i64>* %33, align 8, !alias.scope !6, !noalias !3
  %index.next = add i64 %index, 4
  %34 = getelementptr inbounds double, double* %sum, i64 %index.next
  %35 = bitcast double* %34 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %35, align 8, !alias.scope !3
  %36 = getelementptr double, double* %34, i64 2
  %37 = bitcast double* %36 to <2 x i64>*
  %wide.load88.1 = load <2 x i64>, <2 x i64>* %37, align 8, !alias.scope !3
  %38 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv78, i64 %indvars.iv76, i64 %index.next
  %39 = bitcast double* %38 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %39, align 8, !alias.scope !6, !noalias !3
  %40 = getelementptr double, double* %38, i64 2
  %41 = bitcast double* %40 to <2 x i64>*
  store <2 x i64> %wide.load88.1, <2 x i64>* %41, align 8, !alias.scope !6, !noalias !3
  %index.next.1 = add i64 %index, 8
  %42 = getelementptr inbounds double, double* %sum, i64 %index.next.1
  %43 = bitcast double* %42 to <2 x i64>*
  %wide.load.2 = load <2 x i64>, <2 x i64>* %43, align 8, !alias.scope !3
  %44 = getelementptr double, double* %42, i64 2
  %45 = bitcast double* %44 to <2 x i64>*
  %wide.load88.2 = load <2 x i64>, <2 x i64>* %45, align 8, !alias.scope !3
  %46 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv78, i64 %indvars.iv76, i64 %index.next.1
  %47 = bitcast double* %46 to <2 x i64>*
  store <2 x i64> %wide.load.2, <2 x i64>* %47, align 8, !alias.scope !6, !noalias !3
  %48 = getelementptr double, double* %46, i64 2
  %49 = bitcast double* %48 to <2 x i64>*
  store <2 x i64> %wide.load88.2, <2 x i64>* %49, align 8, !alias.scope !6, !noalias !3
  %index.next.2 = add i64 %index, 12
  %50 = getelementptr inbounds double, double* %sum, i64 %index.next.2
  %51 = bitcast double* %50 to <2 x i64>*
  %wide.load.3 = load <2 x i64>, <2 x i64>* %51, align 8, !alias.scope !3
  %52 = getelementptr double, double* %50, i64 2
  %53 = bitcast double* %52 to <2 x i64>*
  %wide.load88.3 = load <2 x i64>, <2 x i64>* %53, align 8, !alias.scope !3
  %54 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv78, i64 %indvars.iv76, i64 %index.next.2
  %55 = bitcast double* %54 to <2 x i64>*
  store <2 x i64> %wide.load.3, <2 x i64>* %55, align 8, !alias.scope !6, !noalias !3
  %56 = getelementptr double, double* %54, i64 2
  %57 = bitcast double* %56 to <2 x i64>*
  store <2 x i64> %wide.load88.3, <2 x i64>* %57, align 8, !alias.scope !6, !noalias !3
  %index.next.3 = add i64 %index, 16
  %58 = icmp eq i64 %index.next.3, %n.vec
  br i1 %58, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !9

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.unr-lcssa, %vector.body.prol.loopexit
  br i1 %cmp.n, label %for.inc39.us, label %for.body27.us.preheader124

for.body27.us.preheader124:                       ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.body27.us.preheader
  %indvars.iv69.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.body27.us.preheader ], [ %n.vec, %middle.block ]
  %59 = sub nsw i64 %11, %indvars.iv69.ph
  %60 = sub nsw i64 %2, %indvars.iv69.ph
  %xtraiter131 = and i64 %59, 3
  %lcmp.mod132 = icmp eq i64 %xtraiter131, 0
  br i1 %lcmp.mod132, label %for.body27.us.prol.loopexit, label %for.body27.us.prol.preheader

for.body27.us.prol.preheader:                     ; preds = %for.body27.us.preheader124
  br label %for.body27.us.prol

for.body27.us.prol:                               ; preds = %for.body27.us.prol, %for.body27.us.prol.preheader
  %indvars.iv69.prol = phi i64 [ %indvars.iv.next70.prol, %for.body27.us.prol ], [ %indvars.iv69.ph, %for.body27.us.prol.preheader ]
  %prol.iter133 = phi i64 [ %prol.iter133.sub, %for.body27.us.prol ], [ %xtraiter131, %for.body27.us.prol.preheader ]
  %arrayidx29.us.prol = getelementptr inbounds double, double* %sum, i64 %indvars.iv69.prol
  %61 = bitcast double* %arrayidx29.us.prol to i64*
  %62 = load i64, i64* %61, align 8
  %arrayidx35.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv78, i64 %indvars.iv76, i64 %indvars.iv69.prol
  %63 = bitcast double* %arrayidx35.us.prol to i64*
  store i64 %62, i64* %63, align 8
  %indvars.iv.next70.prol = add nuw nsw i64 %indvars.iv69.prol, 1
  %prol.iter133.sub = add nsw i64 %prol.iter133, -1
  %prol.iter133.cmp = icmp eq i64 %prol.iter133.sub, 0
  br i1 %prol.iter133.cmp, label %for.body27.us.prol.loopexit.unr-lcssa, label %for.body27.us.prol, !llvm.loop !12

for.body27.us.prol.loopexit.unr-lcssa:            ; preds = %for.body27.us.prol
  %64 = add i64 %indvars.iv69.ph, %xtraiter131
  br label %for.body27.us.prol.loopexit

for.body27.us.prol.loopexit:                      ; preds = %for.body27.us.prol.loopexit.unr-lcssa, %for.body27.us.preheader124
  %indvars.iv69.unr = phi i64 [ %indvars.iv69.ph, %for.body27.us.preheader124 ], [ %64, %for.body27.us.prol.loopexit.unr-lcssa ]
  %65 = icmp ult i64 %60, 3
  br i1 %65, label %for.inc39.us.loopexit, label %for.body27.us.preheader124.new

for.body27.us.preheader124.new:                   ; preds = %for.body27.us.prol.loopexit
  br label %for.body27.us

for.body27.us:                                    ; preds = %for.body27.us, %for.body27.us.preheader124.new
  %indvars.iv69 = phi i64 [ %indvars.iv69.unr, %for.body27.us.preheader124.new ], [ %indvars.iv.next70.3, %for.body27.us ]
  %arrayidx29.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv69
  %66 = bitcast double* %arrayidx29.us to i64*
  %67 = load i64, i64* %66, align 8
  %arrayidx35.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv78, i64 %indvars.iv76, i64 %indvars.iv69
  %68 = bitcast double* %arrayidx35.us to i64*
  store i64 %67, i64* %68, align 8
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %arrayidx29.us.1 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next70
  %69 = bitcast double* %arrayidx29.us.1 to i64*
  %70 = load i64, i64* %69, align 8
  %arrayidx35.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv78, i64 %indvars.iv76, i64 %indvars.iv.next70
  %71 = bitcast double* %arrayidx35.us.1 to i64*
  store i64 %70, i64* %71, align 8
  %indvars.iv.next70.1 = add nsw i64 %indvars.iv69, 2
  %arrayidx29.us.2 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next70.1
  %72 = bitcast double* %arrayidx29.us.2 to i64*
  %73 = load i64, i64* %72, align 8
  %arrayidx35.us.2 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv78, i64 %indvars.iv76, i64 %indvars.iv.next70.1
  %74 = bitcast double* %arrayidx35.us.2 to i64*
  store i64 %73, i64* %74, align 8
  %indvars.iv.next70.2 = add nsw i64 %indvars.iv69, 3
  %arrayidx29.us.3 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next70.2
  %75 = bitcast double* %arrayidx29.us.3 to i64*
  %76 = load i64, i64* %75, align 8
  %arrayidx35.us.3 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv78, i64 %indvars.iv76, i64 %indvars.iv.next70.2
  %77 = bitcast double* %arrayidx35.us.3 to i64*
  store i64 %76, i64* %77, align 8
  %exitcond72.3 = icmp eq i64 %indvars.iv.next70.2, %2
  %indvars.iv.next70.3 = add nsw i64 %indvars.iv69, 4
  br i1 %exitcond72.3, label %for.inc39.us.loopexit.unr-lcssa, label %for.body27.us, !llvm.loop !13

for.inc39.us.loopexit.unr-lcssa:                  ; preds = %for.body27.us
  br label %for.inc39.us.loopexit

for.inc39.us.loopexit:                            ; preds = %for.inc39.us.loopexit.unr-lcssa, %for.body27.us.prol.loopexit
  br label %for.inc39.us

for.inc39.us:                                     ; preds = %for.inc39.us.loopexit, %middle.block
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %exitcond122 = icmp eq i64 %indvars.iv.next77, %1
  br i1 %exitcond122, label %for.inc42.loopexit, label %for.cond4.preheader.us

for.body6.us.us:                                  ; preds = %for.inc22.us.us, %for.cond4.preheader.us
  %indvars.iv67 = phi i64 [ %indvars.iv.next68, %for.inc22.us.us ], [ 0, %for.cond4.preheader.us ]
  %arrayidx.us.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv67
  store double 0.000000e+00, double* %arrayidx.us.us, align 8
  br i1 %lcmp.mod127, label %for.body9.us.us.prol.loopexit.unr-lcssa, label %for.body9.us.us.prol.preheader

for.body9.us.us.prol.preheader:                   ; preds = %for.body6.us.us
  br label %for.body9.us.us.prol

for.body9.us.us.prol:                             ; preds = %for.body9.us.us.prol.preheader
  %78 = load double, double* %arrayidx15.us.us.prol, align 8
  %arrayidx19.us.us.prol = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 0, i64 %indvars.iv67
  %79 = load double, double* %arrayidx19.us.us.prol, align 8
  %mul.us.us.prol = fmul double %78, %79
  %add.us.us.prol = fadd double %mul.us.us.prol, 0.000000e+00
  store double %add.us.us.prol, double* %arrayidx.us.us, align 8
  br label %for.body9.us.us.prol.loopexit.unr-lcssa

for.body9.us.us.prol.loopexit.unr-lcssa:          ; preds = %for.body9.us.us.prol, %for.body6.us.us
  %.unr.ph = phi double [ %add.us.us.prol, %for.body9.us.us.prol ], [ 0.000000e+00, %for.body6.us.us ]
  %indvars.iv63.unr.ph = phi i64 [ 1, %for.body9.us.us.prol ], [ 0, %for.body6.us.us ]
  br label %for.body9.us.us.prol.loopexit

for.body9.us.us.prol.loopexit:                    ; preds = %for.body9.us.us.prol.loopexit.unr-lcssa
  br i1 %15, label %for.inc22.us.us, label %for.body6.us.us.new

for.body6.us.us.new:                              ; preds = %for.body9.us.us.prol.loopexit
  br label %for.body9.us.us

for.inc22.us.us.unr-lcssa:                        ; preds = %for.body9.us.us
  br label %for.inc22.us.us

for.inc22.us.us:                                  ; preds = %for.inc22.us.us.unr-lcssa, %for.body9.us.us.prol.loopexit
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond121 = icmp eq i64 %indvars.iv.next68, %3
  br i1 %exitcond121, label %for.body27.us.preheader, label %for.body6.us.us

for.body9.us.us:                                  ; preds = %for.body9.us.us, %for.body6.us.us.new
  %80 = phi double [ %.unr.ph, %for.body6.us.us.new ], [ %add.us.us.1, %for.body9.us.us ]
  %indvars.iv63 = phi i64 [ %indvars.iv63.unr.ph, %for.body6.us.us.new ], [ %indvars.iv.next64.1, %for.body9.us.us ]
  %arrayidx15.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv78, i64 %indvars.iv76, i64 %indvars.iv63
  %81 = load double, double* %arrayidx15.us.us, align 8
  %arrayidx19.us.us = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv63, i64 %indvars.iv67
  %82 = load double, double* %arrayidx19.us.us, align 8
  %mul.us.us = fmul double %81, %82
  %add.us.us = fadd double %80, %mul.us.us
  store double %add.us.us, double* %arrayidx.us.us, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %arrayidx15.us.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv78, i64 %indvars.iv76, i64 %indvars.iv.next64
  %83 = load double, double* %arrayidx15.us.us.1, align 8
  %arrayidx19.us.us.1 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv.next64, i64 %indvars.iv67
  %84 = load double, double* %arrayidx19.us.us.1, align 8
  %mul.us.us.1 = fmul double %83, %84
  %add.us.us.1 = fadd double %add.us.us, %mul.us.us.1
  store double %add.us.us.1, double* %arrayidx.us.us, align 8
  %exitcond66.1 = icmp eq i64 %indvars.iv.next64, %2
  %indvars.iv.next64.1 = add nsw i64 %indvars.iv63, 2
  br i1 %exitcond66.1, label %for.inc22.us.us.unr-lcssa, label %for.body9.us.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader, %for.cond4.preheader.preheader.new
  %indvars.iv56 = phi i64 [ %indvars.iv56.unr, %for.cond4.preheader.preheader.new ], [ %indvars.iv.next57.7, %for.cond4.preheader ]
  %indvars.iv.next57.7 = add nuw nsw i64 %indvars.iv56, 8
  %exitcond120.7 = icmp eq i64 %indvars.iv.next57.7, %1
  br i1 %exitcond120.7, label %for.inc42.loopexit125.unr-lcssa, label %for.cond4.preheader

for.inc42.loopexit:                               ; preds = %for.inc39.us
  br label %for.inc42

for.inc42.loopexit125.unr-lcssa:                  ; preds = %for.cond4.preheader
  br label %for.inc42.loopexit125

for.inc42.loopexit125:                            ; preds = %for.inc42.loopexit125.unr-lcssa, %for.cond4.preheader.prol.loopexit
  br label %for.inc42

for.inc42:                                        ; preds = %for.inc42.loopexit125, %for.inc42.loopexit, %for.cond1.preheader
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %exitcond123 = icmp eq i64 %indvars.iv.next79, %4
  br i1 %exitcond123, label %for.end44.loopexit, label %for.cond1.preheader

for.end44.loopexit:                               ; preds = %for.inc42
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
  tail call fastcc void @print_array([140 x [160 x double]]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %if.then, %land.lhs.true, %entry
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

for.cond1.preheader:                              ; preds = %for.inc15, %entry
  %indvars.iv38 = phi i64 [ 0, %entry ], [ %indvars.iv.next39, %for.inc15 ]
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.inc12, %for.cond1.preheader
  %indvars.iv35 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next36, %for.inc12 ]
  %0 = mul nuw nsw i64 %indvars.iv35, %indvars.iv38
  br label %for.body6

for.body6:                                        ; preds = %for.body6, %for.cond4.preheader
  %indvars.iv31 = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next32.1, %for.body6 ]
  %1 = add nuw nsw i64 %indvars.iv31, %0
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 160
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 1.600000e+02
  %arrayidx11 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv38, i64 %indvars.iv35, i64 %indvars.iv31
  store double %div, double* %arrayidx11, align 8
  %indvars.iv.next32 = or i64 %indvars.iv31, 1
  %3 = add nuw nsw i64 %indvars.iv.next32, %0
  %4 = trunc i64 %3 to i32
  %rem.1 = srem i32 %4, 160
  %conv.1 = sitofp i32 %rem.1 to double
  %div.1 = fdiv double %conv.1, 1.600000e+02
  %arrayidx11.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv38, i64 %indvars.iv35, i64 %indvars.iv.next32
  store double %div.1, double* %arrayidx11.1, align 8
  %exitcond34.1 = icmp eq i64 %indvars.iv.next32, 159
  %indvars.iv.next32.1 = add nuw nsw i64 %indvars.iv31, 2
  br i1 %exitcond34.1, label %for.inc12, label %for.body6

for.inc12:                                        ; preds = %for.body6
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next36, 140
  br i1 %exitcond2, label %for.inc15, label %for.cond4.preheader

for.inc15:                                        ; preds = %for.inc12
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next39, 150
  br i1 %exitcond3, label %for.cond22.preheader.preheader, label %for.cond1.preheader

for.cond22.preheader.preheader:                   ; preds = %for.inc15
  br label %for.cond22.preheader

for.cond22.preheader:                             ; preds = %for.inc38, %for.cond22.preheader.preheader
  %indvars.iv29 = phi i64 [ %indvars.iv.next30, %for.inc38 ], [ 0, %for.cond22.preheader.preheader ]
  br label %for.body25

for.body25:                                       ; preds = %for.body25, %for.cond22.preheader
  %indvars.iv = phi i64 [ 0, %for.cond22.preheader ], [ %indvars.iv.next.1, %for.body25 ]
  %5 = mul nuw nsw i64 %indvars.iv, %indvars.iv29
  %6 = trunc i64 %5 to i32
  %rem27 = srem i32 %6, 160
  %conv28 = sitofp i32 %rem27 to double
  %div30 = fdiv double %conv28, 1.600000e+02
  %arrayidx34 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv29, i64 %indvars.iv
  store double %div30, double* %arrayidx34, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %7 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv29
  %8 = trunc i64 %7 to i32
  %rem27.1 = srem i32 %8, 160
  %conv28.1 = sitofp i32 %rem27.1 to double
  %div30.1 = fdiv double %conv28.1, 1.600000e+02
  %arrayidx34.1 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv29, i64 %indvars.iv.next
  store double %div30.1, double* %arrayidx34.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 159
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.inc38, label %for.body25

for.inc38:                                        ; preds = %for.body25
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next30, 160
  br i1 %exitcond1, label %for.end40, label %for.cond22.preheader

for.end40:                                        ; preds = %for.inc38
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([140 x [160 x double]]* nocapture readonly %A) unnamed_addr #1 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc21, %entry
  %indvars.iv20 = phi i64 [ 0, %entry ], [ %indvars.iv.next21, %for.inc21 ]
  %3 = mul nuw nsw i64 %indvars.iv20, 140
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.inc18, %for.cond2.preheader
  %indvars.iv18 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next19, %for.inc18 ]
  %mul813 = add nuw nsw i64 %indvars.iv18, %3
  %sext = mul nuw nsw i64 %mul813, 687194767360
  %4 = lshr exact i64 %sext, 32
  br label %for.body7

for.body7:                                        ; preds = %if.end, %for.cond5.preheader
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader ], [ %indvars.iv.next, %if.end ]
  %5 = add nuw nsw i64 %indvars.iv, %4
  %6 = trunc i64 %5 to i32
  %rem = srem i32 %6, 20
  %cmp11 = icmp eq i32 %rem, 0
  br i1 %cmp11, label %if.then, label %if.end

if.then:                                          ; preds = %for.body7
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #5
  br label %if.end

if.end:                                           ; preds = %if.then, %for.body7
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv20, i64 %indvars.iv18, i64 %indvars.iv
  %9 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond, label %for.inc18, label %for.body7

for.inc18:                                        ; preds = %if.end
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next19, 140
  br i1 %exitcond1, label %for.inc21, label %for.cond5.preheader

for.inc21:                                        ; preds = %for.inc18
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next21, 150
  br i1 %exitcond2, label %for.end23, label %for.cond2.preheader

for.end23:                                        ; preds = %for.inc21
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %11) #5
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

attributes #0 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = distinct !{!8, !2}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = distinct !{!12, !2}
!13 = distinct !{!13, !10, !11}
