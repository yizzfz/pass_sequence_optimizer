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
  %cmp12 = icmp sgt i32 %nr, 0
  br i1 %cmp12, label %for.cond1.preheader.lr.ph, label %for.end44

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %0 = add i32 %np, -1
  %1 = sext i32 %nq to i64
  %2 = zext i32 %0 to i64
  %3 = sext i32 %np to i64
  %4 = sext i32 %nr to i64
  %5 = add nuw nsw i64 %2, 1
  %scevgep80 = getelementptr double, double* %sum, i64 %5
  %6 = add nsw i64 %1, -1
  %7 = and i64 %5, 8589934588
  %8 = add nsw i64 %7, -4
  %9 = lshr exact i64 %8, 2
  %10 = add nuw nsw i64 %9, 1
  %11 = add nuw nsw i64 %2, 1
  %12 = icmp sgt i32 %nq, 0
  %13 = icmp sgt i32 %np, 0
  %14 = ptrtoint double* %sum to i64
  %xtraiter86 = and i64 %5, 1
  %lcmp.mod87 = icmp eq i64 %xtraiter86, 0
  %15 = icmp eq i32 %0, 0
  %sunkaddr = ptrtoint double* %sum to i64
  %sunkaddr.1 = ptrtoint double* %sum to i64
  %sunkaddr.prol = ptrtoint double* %sum to i64
  %min.iters.check = icmp ult i64 %5, 4
  %n.vec = and i64 %5, 8589934588
  %cmp.zero = icmp eq i64 %n.vec, 0
  %xtraiter88 = and i64 %10, 3
  %lcmp.mod89 = icmp eq i64 %xtraiter88, 0
  %16 = icmp ult i64 %8, 12
  %cmp.n = icmp eq i64 %5, %n.vec
  %xtraiter = and i64 %1, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %17 = icmp ult i64 %6, 7
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc42, %for.cond1.preheader.lr.ph
  %indvars.iv64 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next65, %for.inc42 ]
  br i1 %12, label %for.cond4.preheader.lr.ph, label %for.inc42

for.cond4.preheader.lr.ph:                        ; preds = %for.cond1.preheader
  br i1 %13, label %for.body6.us.us.preheader.preheader, label %for.cond4.preheader.preheader

for.cond4.preheader.preheader:                    ; preds = %for.cond4.preheader.lr.ph
  br i1 %lcmp.mod, label %for.cond4.preheader.prol.loopexit, label %for.cond4.preheader.prol.preheader

for.cond4.preheader.prol.preheader:               ; preds = %for.cond4.preheader.preheader
  br label %for.cond4.preheader.prol

for.cond4.preheader.prol:                         ; preds = %for.cond4.preheader.prol, %for.cond4.preheader.prol.preheader
  %indvars.iv42.prol = phi i64 [ %indvars.iv.next43.prol, %for.cond4.preheader.prol ], [ 0, %for.cond4.preheader.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.cond4.preheader.prol ], [ %xtraiter, %for.cond4.preheader.prol.preheader ]
  %indvars.iv.next43.prol = add nuw i64 %indvars.iv42.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.cond4.preheader.prol.loopexit.loopexit, label %for.cond4.preheader.prol, !llvm.loop !1

for.cond4.preheader.prol.loopexit.loopexit:       ; preds = %for.cond4.preheader.prol
  br label %for.cond4.preheader.prol.loopexit

for.cond4.preheader.prol.loopexit:                ; preds = %for.cond4.preheader.prol.loopexit.loopexit, %for.cond4.preheader.preheader
  %indvars.iv42.unr = phi i64 [ 0, %for.cond4.preheader.preheader ], [ %indvars.iv.next43.prol, %for.cond4.preheader.prol.loopexit.loopexit ]
  br i1 %17, label %for.inc42, label %for.cond4.preheader.preheader.new

for.cond4.preheader.preheader.new:                ; preds = %for.cond4.preheader.prol.loopexit
  br label %for.cond4.preheader

for.body6.us.us.preheader.preheader:              ; preds = %for.cond4.preheader.lr.ph
  br label %for.body6.us.us.preheader

for.body6.us.us.preheader:                        ; preds = %for.body6.us.us.preheader.preheader, %for.inc39.us
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %for.inc39.us ], [ 0, %for.body6.us.us.preheader.preheader ]
  %scevgep = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv64, i64 %indvars.iv62, i64 0
  %scevgep77 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv64, i64 %indvars.iv62, i64 %5
  %arrayidx15.us.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv64, i64 %indvars.iv62, i64 0
  br label %for.body6.us.us

for.inc39.us.loopexit:                            ; preds = %for.body27.us
  br label %for.inc39.us

for.inc39.us:                                     ; preds = %for.inc39.us.loopexit, %for.body27.us.prol.loopexit, %middle.block
  %indvars.iv.next63 = add nuw i64 %indvars.iv62, 1
  %cmp2.us = icmp slt i64 %indvars.iv.next63, %1
  br i1 %cmp2.us, label %for.body6.us.us.preheader, label %for.inc42.loopexit

for.body27.us:                                    ; preds = %for.body27.us, %for.body27.us.preheader84.new
  %indvars.iv55 = phi i64 [ %indvars.iv55.unr, %for.body27.us.preheader84.new ], [ %indvars.iv.next56.3, %for.body27.us ]
  %arrayidx29.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv55
  %18 = bitcast double* %arrayidx29.us to i64*
  %19 = load i64, i64* %18, align 8
  %arrayidx35.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv64, i64 %indvars.iv62, i64 %indvars.iv55
  %20 = bitcast double* %arrayidx35.us to i64*
  store i64 %19, i64* %20, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %arrayidx29.us.1 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next56
  %21 = bitcast double* %arrayidx29.us.1 to i64*
  %22 = load i64, i64* %21, align 8
  %arrayidx35.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv64, i64 %indvars.iv62, i64 %indvars.iv.next56
  %23 = bitcast double* %arrayidx35.us.1 to i64*
  store i64 %22, i64* %23, align 8
  %indvars.iv.next56.1 = add nsw i64 %indvars.iv55, 2
  %arrayidx29.us.2 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next56.1
  %24 = bitcast double* %arrayidx29.us.2 to i64*
  %25 = load i64, i64* %24, align 8
  %arrayidx35.us.2 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv64, i64 %indvars.iv62, i64 %indvars.iv.next56.1
  %26 = bitcast double* %arrayidx35.us.2 to i64*
  store i64 %25, i64* %26, align 8
  %indvars.iv.next56.2 = add nsw i64 %indvars.iv55, 3
  %arrayidx29.us.3 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next56.2
  %27 = bitcast double* %arrayidx29.us.3 to i64*
  %28 = load i64, i64* %27, align 8
  %arrayidx35.us.3 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv64, i64 %indvars.iv62, i64 %indvars.iv.next56.2
  %29 = bitcast double* %arrayidx35.us.3 to i64*
  store i64 %28, i64* %29, align 8
  %exitcond58.3 = icmp eq i64 %indvars.iv.next56.2, %2
  %indvars.iv.next56.3 = add nsw i64 %indvars.iv55, 4
  br i1 %exitcond58.3, label %for.inc39.us.loopexit, label %for.body27.us, !llvm.loop !3

for.body27.us.preheader:                          ; preds = %for.cond7.for.inc22_crit_edge.us.us
  br i1 %min.iters.check, label %for.body27.us.preheader84, label %min.iters.checked

for.body27.us.preheader84:                        ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.body27.us.preheader
  %indvars.iv55.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.body27.us.preheader ], [ %n.vec, %middle.block ]
  %30 = sub nsw i64 %11, %indvars.iv55.ph
  %31 = sub nsw i64 %2, %indvars.iv55.ph
  %xtraiter91 = and i64 %30, 3
  %lcmp.mod92 = icmp eq i64 %xtraiter91, 0
  br i1 %lcmp.mod92, label %for.body27.us.prol.loopexit, label %for.body27.us.prol.preheader

for.body27.us.prol.preheader:                     ; preds = %for.body27.us.preheader84
  br label %for.body27.us.prol

for.body27.us.prol:                               ; preds = %for.body27.us.prol, %for.body27.us.prol.preheader
  %indvars.iv55.prol = phi i64 [ %indvars.iv.next56.prol, %for.body27.us.prol ], [ %indvars.iv55.ph, %for.body27.us.prol.preheader ]
  %prol.iter93 = phi i64 [ %prol.iter93.sub, %for.body27.us.prol ], [ %xtraiter91, %for.body27.us.prol.preheader ]
  %arrayidx29.us.prol = getelementptr inbounds double, double* %sum, i64 %indvars.iv55.prol
  %32 = bitcast double* %arrayidx29.us.prol to i64*
  %33 = load i64, i64* %32, align 8
  %arrayidx35.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv64, i64 %indvars.iv62, i64 %indvars.iv55.prol
  %34 = bitcast double* %arrayidx35.us.prol to i64*
  store i64 %33, i64* %34, align 8
  %indvars.iv.next56.prol = add nuw nsw i64 %indvars.iv55.prol, 1
  %prol.iter93.sub = add i64 %prol.iter93, -1
  %prol.iter93.cmp = icmp eq i64 %prol.iter93.sub, 0
  br i1 %prol.iter93.cmp, label %for.body27.us.prol.loopexit.loopexit, label %for.body27.us.prol, !llvm.loop !6

for.body27.us.prol.loopexit.loopexit:             ; preds = %for.body27.us.prol
  br label %for.body27.us.prol.loopexit

for.body27.us.prol.loopexit:                      ; preds = %for.body27.us.prol.loopexit.loopexit, %for.body27.us.preheader84
  %indvars.iv55.unr = phi i64 [ %indvars.iv55.ph, %for.body27.us.preheader84 ], [ %indvars.iv.next56.prol, %for.body27.us.prol.loopexit.loopexit ]
  %35 = icmp ult i64 %31, 3
  br i1 %35, label %for.inc39.us, label %for.body27.us.preheader84.new

for.body27.us.preheader84.new:                    ; preds = %for.body27.us.prol.loopexit
  br label %for.body27.us

min.iters.checked:                                ; preds = %for.body27.us.preheader
  br i1 %cmp.zero, label %for.body27.us.preheader84, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep80
  %bound1 = icmp ugt double* %scevgep77, %sum
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.body27.us.preheader84, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br i1 %lcmp.mod89, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter90 = phi i64 [ %prol.iter90.sub, %vector.body.prol ], [ %xtraiter88, %vector.body.prol.preheader ]
  %36 = getelementptr inbounds double, double* %sum, i64 %index.prol
  %37 = bitcast double* %36 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %37, align 8, !alias.scope !7
  %38 = getelementptr double, double* %36, i64 2
  %39 = bitcast double* %38 to <2 x i64>*
  %wide.load83.prol = load <2 x i64>, <2 x i64>* %39, align 8, !alias.scope !7
  %40 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv64, i64 %indvars.iv62, i64 %index.prol
  %41 = bitcast double* %40 to <2 x i64>*
  store <2 x i64> %wide.load.prol, <2 x i64>* %41, align 8, !alias.scope !10, !noalias !7
  %42 = getelementptr double, double* %40, i64 2
  %43 = bitcast double* %42 to <2 x i64>*
  store <2 x i64> %wide.load83.prol, <2 x i64>* %43, align 8, !alias.scope !10, !noalias !7
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter90.sub = add i64 %prol.iter90, -1
  %prol.iter90.cmp = icmp eq i64 %prol.iter90.sub, 0
  br i1 %prol.iter90.cmp, label %vector.body.prol.loopexit.loopexit, label %vector.body.prol, !llvm.loop !12

vector.body.prol.loopexit.loopexit:               ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.loopexit, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.loopexit ]
  br i1 %16, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %44 = getelementptr inbounds double, double* %sum, i64 %index
  %45 = bitcast double* %44 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %45, align 8, !alias.scope !7
  %46 = getelementptr double, double* %44, i64 2
  %47 = bitcast double* %46 to <2 x i64>*
  %wide.load83 = load <2 x i64>, <2 x i64>* %47, align 8, !alias.scope !7
  %48 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv64, i64 %indvars.iv62, i64 %index
  %49 = bitcast double* %48 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %49, align 8, !alias.scope !10, !noalias !7
  %50 = getelementptr double, double* %48, i64 2
  %51 = bitcast double* %50 to <2 x i64>*
  store <2 x i64> %wide.load83, <2 x i64>* %51, align 8, !alias.scope !10, !noalias !7
  %index.next = add i64 %index, 4
  %52 = getelementptr inbounds double, double* %sum, i64 %index.next
  %53 = bitcast double* %52 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %53, align 8, !alias.scope !7
  %54 = getelementptr double, double* %52, i64 2
  %55 = bitcast double* %54 to <2 x i64>*
  %wide.load83.1 = load <2 x i64>, <2 x i64>* %55, align 8, !alias.scope !7
  %56 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv64, i64 %indvars.iv62, i64 %index.next
  %57 = bitcast double* %56 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %57, align 8, !alias.scope !10, !noalias !7
  %58 = getelementptr double, double* %56, i64 2
  %59 = bitcast double* %58 to <2 x i64>*
  store <2 x i64> %wide.load83.1, <2 x i64>* %59, align 8, !alias.scope !10, !noalias !7
  %index.next.1 = add i64 %index, 8
  %60 = getelementptr inbounds double, double* %sum, i64 %index.next.1
  %61 = bitcast double* %60 to <2 x i64>*
  %wide.load.2 = load <2 x i64>, <2 x i64>* %61, align 8, !alias.scope !7
  %62 = getelementptr double, double* %60, i64 2
  %63 = bitcast double* %62 to <2 x i64>*
  %wide.load83.2 = load <2 x i64>, <2 x i64>* %63, align 8, !alias.scope !7
  %64 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv64, i64 %indvars.iv62, i64 %index.next.1
  %65 = bitcast double* %64 to <2 x i64>*
  store <2 x i64> %wide.load.2, <2 x i64>* %65, align 8, !alias.scope !10, !noalias !7
  %66 = getelementptr double, double* %64, i64 2
  %67 = bitcast double* %66 to <2 x i64>*
  store <2 x i64> %wide.load83.2, <2 x i64>* %67, align 8, !alias.scope !10, !noalias !7
  %index.next.2 = add i64 %index, 12
  %68 = getelementptr inbounds double, double* %sum, i64 %index.next.2
  %69 = bitcast double* %68 to <2 x i64>*
  %wide.load.3 = load <2 x i64>, <2 x i64>* %69, align 8, !alias.scope !7
  %70 = getelementptr double, double* %68, i64 2
  %71 = bitcast double* %70 to <2 x i64>*
  %wide.load83.3 = load <2 x i64>, <2 x i64>* %71, align 8, !alias.scope !7
  %72 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv64, i64 %indvars.iv62, i64 %index.next.2
  %73 = bitcast double* %72 to <2 x i64>*
  store <2 x i64> %wide.load.3, <2 x i64>* %73, align 8, !alias.scope !10, !noalias !7
  %74 = getelementptr double, double* %72, i64 2
  %75 = bitcast double* %74 to <2 x i64>*
  store <2 x i64> %wide.load83.3, <2 x i64>* %75, align 8, !alias.scope !10, !noalias !7
  %index.next.3 = add i64 %index, 16
  %76 = icmp eq i64 %index.next.3, %n.vec
  br i1 %76, label %middle.block.loopexit, label %vector.body, !llvm.loop !13

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.body.prol.loopexit
  br i1 %cmp.n, label %for.inc39.us, label %for.body27.us.preheader84

for.body6.us.us:                                  ; preds = %for.body6.us.us.preheader, %for.cond7.for.inc22_crit_edge.us.us
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %for.cond7.for.inc22_crit_edge.us.us ], [ 0, %for.body6.us.us.preheader ]
  %arrayidx.us.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv53
  store double 0.000000e+00, double* %arrayidx.us.us, align 8
  %sunkaddr67 = shl i64 %indvars.iv53, 3
  %sunkaddr68 = add i64 %14, %sunkaddr67
  %sunkaddr69 = inttoptr i64 %sunkaddr68 to double*
  %.pre = load double, double* %sunkaddr69, align 8
  br i1 %lcmp.mod87, label %for.body9.us.us.prol.loopexit, label %for.body9.us.us.prol

for.body9.us.us.prol:                             ; preds = %for.body6.us.us
  %77 = load double, double* %arrayidx15.us.us.prol, align 8
  %arrayidx19.us.us.prol = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 0, i64 %indvars.iv53
  %78 = load double, double* %arrayidx19.us.us.prol, align 8
  %mul.us.us.prol = fmul double %77, %78
  %add.us.us.prol = fadd double %.pre, %mul.us.us.prol
  %sunkaddr72.prol = shl i64 %indvars.iv53, 3
  %sunkaddr73.prol = add i64 %sunkaddr.prol, %sunkaddr72.prol
  %sunkaddr74.prol = inttoptr i64 %sunkaddr73.prol to double*
  store double %add.us.us.prol, double* %sunkaddr74.prol, align 8
  br label %for.body9.us.us.prol.loopexit

for.body9.us.us.prol.loopexit:                    ; preds = %for.body9.us.us.prol, %for.body6.us.us
  %.unr.ph = phi double [ %add.us.us.prol, %for.body9.us.us.prol ], [ %.pre, %for.body6.us.us ]
  %indvars.iv49.unr.ph = phi i64 [ 1, %for.body9.us.us.prol ], [ 0, %for.body6.us.us ]
  br i1 %15, label %for.cond7.for.inc22_crit_edge.us.us, label %for.body6.us.us.new

for.body6.us.us.new:                              ; preds = %for.body9.us.us.prol.loopexit
  %sunkaddr72 = shl i64 %indvars.iv53, 3
  %sunkaddr73 = add i64 %sunkaddr, %sunkaddr72
  %sunkaddr74 = inttoptr i64 %sunkaddr73 to double*
  %sunkaddr72.1 = shl i64 %indvars.iv53, 3
  %sunkaddr73.1 = add i64 %sunkaddr.1, %sunkaddr72.1
  %sunkaddr74.1 = inttoptr i64 %sunkaddr73.1 to double*
  br label %for.body9.us.us

for.cond7.for.inc22_crit_edge.us.us.loopexit:     ; preds = %for.body9.us.us
  br label %for.cond7.for.inc22_crit_edge.us.us

for.cond7.for.inc22_crit_edge.us.us:              ; preds = %for.cond7.for.inc22_crit_edge.us.us.loopexit, %for.body9.us.us.prol.loopexit
  %indvars.iv.next54 = add nuw i64 %indvars.iv53, 1
  %cmp5.us.us = icmp slt i64 %indvars.iv.next54, %3
  br i1 %cmp5.us.us, label %for.body6.us.us, label %for.body27.us.preheader

for.body9.us.us:                                  ; preds = %for.body9.us.us, %for.body6.us.us.new
  %79 = phi double [ %.unr.ph, %for.body6.us.us.new ], [ %add.us.us.1, %for.body9.us.us ]
  %indvars.iv49 = phi i64 [ %indvars.iv49.unr.ph, %for.body6.us.us.new ], [ %indvars.iv.next50.1, %for.body9.us.us ]
  %arrayidx15.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv64, i64 %indvars.iv62, i64 %indvars.iv49
  %80 = load double, double* %arrayidx15.us.us, align 8
  %arrayidx19.us.us = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv49, i64 %indvars.iv53
  %81 = load double, double* %arrayidx19.us.us, align 8
  %mul.us.us = fmul double %80, %81
  %add.us.us = fadd double %79, %mul.us.us
  store double %add.us.us, double* %sunkaddr74, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %arrayidx15.us.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv64, i64 %indvars.iv62, i64 %indvars.iv.next50
  %82 = load double, double* %arrayidx15.us.us.1, align 8
  %arrayidx19.us.us.1 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv.next50, i64 %indvars.iv53
  %83 = load double, double* %arrayidx19.us.us.1, align 8
  %mul.us.us.1 = fmul double %82, %83
  %add.us.us.1 = fadd double %add.us.us, %mul.us.us.1
  store double %add.us.us.1, double* %sunkaddr74.1, align 8
  %exitcond52.1 = icmp eq i64 %indvars.iv.next50, %2
  %indvars.iv.next50.1 = add nsw i64 %indvars.iv49, 2
  br i1 %exitcond52.1, label %for.cond7.for.inc22_crit_edge.us.us.loopexit, label %for.body9.us.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader, %for.cond4.preheader.preheader.new
  %indvars.iv42 = phi i64 [ %indvars.iv42.unr, %for.cond4.preheader.preheader.new ], [ %indvars.iv.next43.7, %for.cond4.preheader ]
  %indvars.iv.next43.7 = add i64 %indvars.iv42, 8
  %cmp2.7 = icmp slt i64 %indvars.iv.next43.7, %1
  br i1 %cmp2.7, label %for.cond4.preheader, label %for.inc42.loopexit94

for.inc42.loopexit:                               ; preds = %for.inc39.us
  br label %for.inc42

for.inc42.loopexit94:                             ; preds = %for.cond4.preheader
  br label %for.inc42

for.inc42:                                        ; preds = %for.inc42.loopexit94, %for.inc42.loopexit, %for.cond4.preheader.prol.loopexit, %for.cond1.preheader
  %indvars.iv.next65 = add nuw i64 %indvars.iv64, 1
  %cmp = icmp slt i64 %indvars.iv.next65, %4
  br i1 %cmp, label %for.cond1.preheader, label %for.end44.loopexit

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
  tail call fastcc void @init_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %arraydecay, [160 x double]* %arraydecay3)
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
  tail call fastcc void @print_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %nr, i32 %nq, i32 %np, [140 x [160 x double]]* nocapture %A, [160 x double]* nocapture %C4) unnamed_addr #0 {
entry:
  %cmp10 = icmp sgt i32 %nr, 0
  br i1 %cmp10, label %for.cond1.preheader.lr.ph, label %for.cond18.preheader

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp28 = icmp sgt i32 %nq, 0
  %conv7 = sitofp i32 %np to double
  br i1 %cmp28, label %for.cond1.preheader.us.preheader, label %for.cond18.preheader

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %0 = add i32 %np, -1
  %1 = sext i32 %nq to i64
  %2 = sext i32 %nr to i64
  %wide.trip.count43 = zext i32 %0 to i64
  %3 = icmp sgt i32 %np, 0
  %4 = and i64 %wide.trip.count43, 1
  %lcmp.mod52 = icmp eq i64 %4, 0
  %5 = icmp eq i32 %0, 0
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc15_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv48 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next49, %for.cond1.for.inc15_crit_edge.us ]
  br i1 %3, label %for.cond4.preheader.us.us.preheader, label %for.cond1.for.inc15_crit_edge.us

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.us
  br label %for.cond4.preheader.us.us

for.cond1.for.inc15_crit_edge.us.loopexit:        ; preds = %for.cond4.for.inc12_crit_edge.us.us
  br label %for.cond1.for.inc15_crit_edge.us

for.cond1.for.inc15_crit_edge.us:                 ; preds = %for.cond1.for.inc15_crit_edge.us.loopexit, %for.cond1.preheader.us
  %indvars.iv.next49 = add nuw i64 %indvars.iv48, 1
  %cmp.us = icmp slt i64 %indvars.iv.next49, %2
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.cond18.preheader.loopexit

for.cond4.preheader.us.us:                        ; preds = %for.cond4.preheader.us.us.preheader, %for.cond4.for.inc12_crit_edge.us.us
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %for.cond4.for.inc12_crit_edge.us.us ], [ 0, %for.cond4.preheader.us.us.preheader ]
  %6 = mul nsw i64 %indvars.iv45, %indvars.iv48
  br i1 %lcmp.mod52, label %for.body6.us.us.prol, label %for.body6.us.us.prol.loopexit

for.body6.us.us.prol:                             ; preds = %for.cond4.preheader.us.us
  %7 = trunc i64 %6 to i32
  %rem.us.us.prol = srem i32 %7, %np
  %conv.us.us.prol = sitofp i32 %rem.us.us.prol to double
  %div.us.us.prol = fdiv double %conv.us.us.prol, %conv7
  %arrayidx11.us.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv48, i64 %indvars.iv45, i64 0
  store double %div.us.us.prol, double* %arrayidx11.us.us.prol, align 8
  br label %for.body6.us.us.prol.loopexit

for.body6.us.us.prol.loopexit:                    ; preds = %for.body6.us.us.prol, %for.cond4.preheader.us.us
  %indvars.iv40.unr.ph = phi i64 [ 1, %for.body6.us.us.prol ], [ 0, %for.cond4.preheader.us.us ]
  br i1 %5, label %for.cond4.for.inc12_crit_edge.us.us, label %for.cond4.preheader.us.us.new

for.cond4.preheader.us.us.new:                    ; preds = %for.body6.us.us.prol.loopexit
  br label %for.body6.us.us

for.cond4.for.inc12_crit_edge.us.us.loopexit:     ; preds = %for.body6.us.us
  br label %for.cond4.for.inc12_crit_edge.us.us

for.cond4.for.inc12_crit_edge.us.us:              ; preds = %for.cond4.for.inc12_crit_edge.us.us.loopexit, %for.body6.us.us.prol.loopexit
  %indvars.iv.next46 = add nuw i64 %indvars.iv45, 1
  %cmp2.us.us = icmp slt i64 %indvars.iv.next46, %1
  br i1 %cmp2.us.us, label %for.cond4.preheader.us.us, label %for.cond1.for.inc15_crit_edge.us.loopexit

for.body6.us.us:                                  ; preds = %for.body6.us.us, %for.cond4.preheader.us.us.new
  %indvars.iv40 = phi i64 [ %indvars.iv40.unr.ph, %for.cond4.preheader.us.us.new ], [ %indvars.iv.next41.1, %for.body6.us.us ]
  %8 = add nsw i64 %indvars.iv40, %6
  %9 = trunc i64 %8 to i32
  %rem.us.us = srem i32 %9, %np
  %conv.us.us = sitofp i32 %rem.us.us to double
  %div.us.us = fdiv double %conv.us.us, %conv7
  %arrayidx11.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv48, i64 %indvars.iv45, i64 %indvars.iv40
  store double %div.us.us, double* %arrayidx11.us.us, align 8
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %10 = add nsw i64 %indvars.iv.next41, %6
  %11 = trunc i64 %10 to i32
  %rem.us.us.1 = srem i32 %11, %np
  %conv.us.us.1 = sitofp i32 %rem.us.us.1 to double
  %div.us.us.1 = fdiv double %conv.us.us.1, %conv7
  %arrayidx11.us.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv48, i64 %indvars.iv45, i64 %indvars.iv.next41
  store double %div.us.us.1, double* %arrayidx11.us.us.1, align 8
  %exitcond44.1 = icmp eq i64 %indvars.iv.next41, %wide.trip.count43
  %indvars.iv.next41.1 = add nsw i64 %indvars.iv40, 2
  br i1 %exitcond44.1, label %for.cond4.for.inc12_crit_edge.us.us.loopexit, label %for.body6.us.us

for.cond18.preheader.loopexit:                    ; preds = %for.cond1.for.inc15_crit_edge.us
  br label %for.cond18.preheader

for.cond18.preheader:                             ; preds = %for.cond18.preheader.loopexit, %for.cond1.preheader.lr.ph, %entry
  %cmp193 = icmp sgt i32 %np, 0
  br i1 %cmp193, label %for.cond22.preheader.lr.ph, label %for.end40

for.cond22.preheader.lr.ph:                       ; preds = %for.cond18.preheader
  %conv29 = sitofp i32 %np to double
  %12 = add i32 %np, -1
  %13 = sext i32 %np to i64
  %wide.trip.count = zext i32 %12 to i64
  %14 = and i64 %wide.trip.count, 1
  %lcmp.mod = icmp eq i64 %14, 0
  %div30.us.prol = fdiv double 0.000000e+00, %conv29
  %15 = icmp eq i32 %12, 0
  br label %for.cond22.preheader.us

for.cond22.preheader.us:                          ; preds = %for.cond22.for.inc38_crit_edge.us, %for.cond22.preheader.lr.ph
  %indvars.iv37 = phi i64 [ 0, %for.cond22.preheader.lr.ph ], [ %indvars.iv.next38, %for.cond22.for.inc38_crit_edge.us ]
  br i1 %lcmp.mod, label %for.body25.us.prol, label %for.body25.us.prol.loopexit

for.body25.us.prol:                               ; preds = %for.cond22.preheader.us
  %arrayidx34.us.prol = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv37, i64 0
  store double %div30.us.prol, double* %arrayidx34.us.prol, align 8
  br label %for.body25.us.prol.loopexit

for.body25.us.prol.loopexit:                      ; preds = %for.body25.us.prol, %for.cond22.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body25.us.prol ], [ 0, %for.cond22.preheader.us ]
  br i1 %15, label %for.cond22.for.inc38_crit_edge.us, label %for.cond22.preheader.us.new

for.cond22.preheader.us.new:                      ; preds = %for.body25.us.prol.loopexit
  br label %for.body25.us

for.body25.us:                                    ; preds = %for.body25.us, %for.cond22.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.cond22.preheader.us.new ], [ %indvars.iv.next.1, %for.body25.us ]
  %16 = mul nsw i64 %indvars.iv, %indvars.iv37
  %17 = trunc i64 %16 to i32
  %rem27.us = srem i32 %17, %np
  %conv28.us = sitofp i32 %rem27.us to double
  %div30.us = fdiv double %conv28.us, %conv29
  %arrayidx34.us = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv37, i64 %indvars.iv
  store double %div30.us, double* %arrayidx34.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %18 = mul nsw i64 %indvars.iv.next, %indvars.iv37
  %19 = trunc i64 %18 to i32
  %rem27.us.1 = srem i32 %19, %np
  %conv28.us.1 = sitofp i32 %rem27.us.1 to double
  %div30.us.1 = fdiv double %conv28.us.1, %conv29
  %arrayidx34.us.1 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv37, i64 %indvars.iv.next
  store double %div30.us.1, double* %arrayidx34.us.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.cond22.for.inc38_crit_edge.us.loopexit, label %for.body25.us

for.cond22.for.inc38_crit_edge.us.loopexit:       ; preds = %for.body25.us
  br label %for.cond22.for.inc38_crit_edge.us

for.cond22.for.inc38_crit_edge.us:                ; preds = %for.cond22.for.inc38_crit_edge.us.loopexit, %for.body25.us.prol.loopexit
  %indvars.iv.next38 = add nuw i64 %indvars.iv37, 1
  %cmp19.us = icmp slt i64 %indvars.iv.next38, %13
  br i1 %cmp19.us, label %for.cond22.preheader.us, label %for.end40.loopexit

for.end40.loopexit:                               ; preds = %for.cond22.for.inc38_crit_edge.us
  br label %for.end40

for.end40:                                        ; preds = %for.end40.loopexit, %for.cond18.preheader
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %nr, i32 %nq, i32 %np, [140 x [160 x double]]* nocapture readonly %A) unnamed_addr #1 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %cmp7 = icmp sgt i32 %nr, 0
  %cmp34 = icmp sgt i32 %nq, 0
  %or.cond = and i1 %cmp7, %cmp34
  br i1 %or.cond, label %for.cond2.preheader.us.preheader, label %for.end23

for.cond2.preheader.us.preheader:                 ; preds = %entry
  %3 = sext i32 %np to i64
  %4 = sext i32 %nq to i64
  %5 = sext i32 %nr to i64
  %6 = icmp sgt i32 %np, 0
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc21_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv39 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next40, %for.cond2.for.inc21_crit_edge.us ]
  br i1 %6, label %for.cond5.preheader.us.us.preheader, label %for.cond2.for.inc21_crit_edge.us

for.cond5.preheader.us.us.preheader:              ; preds = %for.cond2.preheader.us
  %7 = mul nsw i64 %indvars.iv39, %4
  %8 = trunc i64 %7 to i32
  br label %for.cond5.preheader.us.us

for.cond2.for.inc21_crit_edge.us.loopexit:        ; preds = %for.cond5.for.inc18_crit_edge.us.us
  br label %for.cond2.for.inc21_crit_edge.us

for.cond2.for.inc21_crit_edge.us:                 ; preds = %for.cond2.for.inc21_crit_edge.us.loopexit, %for.cond2.preheader.us
  %indvars.iv.next40 = add nuw i64 %indvars.iv39, 1
  %cmp.us = icmp slt i64 %indvars.iv.next40, %5
  br i1 %cmp.us, label %for.cond2.preheader.us, label %for.end23.loopexit

for.cond5.preheader.us.us:                        ; preds = %for.cond5.preheader.us.us.preheader, %for.cond5.for.inc18_crit_edge.us.us
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %for.cond5.for.inc18_crit_edge.us.us ], [ 0, %for.cond5.preheader.us.us.preheader ]
  %9 = trunc i64 %indvars.iv37 to i32
  %mul81.us.us = add i32 %9, %8
  %add.us.us = mul i32 %mul81.us.us, %np
  %10 = zext i32 %add.us.us to i64
  br label %for.body7.us.us

for.cond5.for.inc18_crit_edge.us.us:              ; preds = %if.end.us.us
  %indvars.iv.next38 = add nuw i64 %indvars.iv37, 1
  %cmp3.us.us = icmp slt i64 %indvars.iv.next38, %4
  br i1 %cmp3.us.us, label %for.cond5.preheader.us.us, label %for.cond2.for.inc21_crit_edge.us.loopexit

for.body7.us.us:                                  ; preds = %if.end.us.us, %for.cond5.preheader.us.us
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader.us.us ], [ %indvars.iv.next, %if.end.us.us ]
  %11 = add i64 %indvars.iv, %10
  %12 = trunc i64 %11 to i32
  %rem.us.us = srem i32 %12, 20
  %cmp11.us.us = icmp eq i32 %rem.us.us, 0
  br i1 %cmp11.us.us, label %if.then.us.us, label %if.end.us.us

if.then.us.us:                                    ; preds = %for.body7.us.us
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %if.end.us.us

if.end.us.us:                                     ; preds = %for.body7.us.us, %if.then.us.us
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv39, i64 %indvars.iv37, i64 %indvars.iv
  %15 = load double, double* %arrayidx16.us.us, align 8
  %call17.us.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %cmp6.us.us = icmp slt i64 %indvars.iv.next, %3
  br i1 %cmp6.us.us, label %for.body7.us.us, label %for.cond5.for.inc18_crit_edge.us.us

for.end23.loopexit:                               ; preds = %for.cond2.for.inc21_crit_edge.us
  br label %for.end23

for.end23:                                        ; preds = %for.end23.loopexit, %entry
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %17) #5
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
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !2}
!7 = !{!8}
!8 = distinct !{!8, !9}
!9 = distinct !{!9, !"LVerDomain"}
!10 = !{!11}
!11 = distinct !{!11, !9}
!12 = distinct !{!12, !2}
!13 = distinct !{!13, !4, !5}
