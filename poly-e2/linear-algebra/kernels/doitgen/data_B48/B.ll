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
  %sum89 = bitcast double* %sum to i8*
  %C4.addr = alloca [160 x double]*, align 8
  %p = alloca i32, align 4
  %s = alloca i32, align 4
  store [160 x double]* %C4, [160 x double]** %C4.addr, align 8
  %cmp62 = icmp sgt i32 %nr, 0
  br i1 %cmp62, label %for.cond1.preheader.lr.ph, label %for.end44

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp223 = icmp sgt i32 %nq, 0
  %cmp814 = icmp sgt i32 %np, 0
  %s.promoted64 = load i32, i32* %s, align 4
  %p.promoted = load i32, i32* %p, align 4
  %0 = add i32 %np, -1
  %1 = sext i32 %np to i64
  %2 = sext i32 %nq to i64
  %3 = zext i32 %0 to i64
  %4 = shl nuw nsw i64 %3, 3
  %5 = add nuw nsw i64 %4, 8
  %cmp516.us = icmp sgt i32 %np, 0
  %6 = load [160 x double]*, [160 x double]** %C4.addr, align 8
  %wide.trip.count79 = zext i32 %0 to i64
  %cmp2622.us = icmp sgt i32 %np, 0
  %wide.trip.count85 = zext i32 %0 to i64
  %cmp516 = icmp sgt i32 %np, 0
  %wide.trip.count73 = zext i32 %0 to i64
  %7 = add nuw nsw i64 %wide.trip.count85, 1
  %scevgep105 = getelementptr double, double* %sum, i64 %7
  %scevgep122 = getelementptr double, double* %sum, i64 %7
  %8 = and i64 %7, 8589934588
  %9 = add nsw i64 %8, -4
  %10 = lshr exact i64 %9, 2
  %11 = add nuw nsw i64 %10, 1
  %12 = add nuw nsw i64 %wide.trip.count85, 1
  %13 = add nuw nsw i64 %wide.trip.count85, 1
  %xtraiter144 = and i64 %7, 1
  %lcmp.mod145 = icmp eq i64 %xtraiter144, 0
  %14 = icmp eq i32 %0, 0
  %min.iters.check = icmp ult i64 %7, 4
  %n.vec = and i64 %7, 8589934588
  %cmp.zero = icmp eq i64 %n.vec, 0
  %xtraiter146 = and i64 %11, 3
  %lcmp.mod147 = icmp eq i64 %xtraiter146, 0
  %15 = icmp ult i64 %9, 12
  %cmp.n = icmp eq i64 %7, %n.vec
  %min.iters.check112 = icmp ult i64 %7, 4
  %n.vec115 = and i64 %7, 8589934588
  %cmp.zero116 = icmp eq i64 %n.vec115, 0
  %xtraiter = and i64 %11, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %16 = icmp ult i64 %9, 12
  %cmp.n133 = icmp eq i64 %7, %n.vec115
  %17 = shl i64 %xtraiter146, 2
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc42, %for.cond1.preheader.lr.ph
  %inc37.lcssa31.lcssa67 = phi i32 [ %p.promoted, %for.cond1.preheader.lr.ph ], [ %inc37.lcssa31.lcssa68, %for.inc42 ]
  %inc.lcssa21.lcssa30.lcssa66 = phi i32 [ %s.promoted64, %for.cond1.preheader.lr.ph ], [ %inc.lcssa21.lcssa30.lcssa65, %for.inc42 ]
  %storemerge63 = phi i32 [ 0, %for.cond1.preheader.lr.ph ], [ %inc43, %for.inc42 ]
  br i1 %cmp223, label %for.cond4.preheader.lr.ph, label %for.inc42

for.cond4.preheader.lr.ph:                        ; preds = %for.cond1.preheader
  %idxprom10 = sext i32 %storemerge63 to i64
  %idxprom30.us = sext i32 %storemerge63 to i64
  br i1 %cmp814, label %for.cond4.preheader.lr.ph.for.cond4.preheader.us_crit_edge, label %for.cond4.preheader.preheader

for.cond4.preheader.preheader:                    ; preds = %for.cond4.preheader.lr.ph
  br label %for.cond4.preheader

for.cond4.preheader.lr.ph.for.cond4.preheader.us_crit_edge: ; preds = %for.cond4.preheader.lr.ph
  %18 = sext i32 %storemerge63 to i64
  br label %for.cond4.preheader.us

for.cond4.preheader.us:                           ; preds = %for.inc39.us, %for.cond4.preheader.lr.ph.for.cond4.preheader.us_crit_edge
  %indvars.iv87 = phi i64 [ %indvars.iv.next88, %for.inc39.us ], [ 0, %for.cond4.preheader.lr.ph.for.cond4.preheader.us_crit_edge ]
  %inc.lcssa21.lcssa29.us = phi i32 [ %inc.lcssa21.lcssa30.us94, %for.inc39.us ], [ %inc.lcssa21.lcssa30.lcssa66, %for.cond4.preheader.lr.ph.for.cond4.preheader.us_crit_edge ]
  %19 = phi i32 [ %.lcssa6.us96, %for.inc39.us ], [ %storemerge63, %for.cond4.preheader.lr.ph.for.cond4.preheader.us_crit_edge ]
  %scevgep = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %18, i64 %indvars.iv87, i64 0
  %scevgep103 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %18, i64 %indvars.iv87, i64 %7
  br i1 %cmp516.us, label %for.body6.us.us.preheader, label %for.inc39.us

for.body6.us.us.preheader:                        ; preds = %for.cond4.preheader.us
  %arrayidx15.us.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom10, i64 %indvars.iv87, i64 0
  br label %for.body6.us.us

for.cond25.preheader.us:                          ; preds = %for.cond7.for.inc22_crit_edge.us.us
  br i1 %cmp2622.us, label %for.cond25.preheader.us.for.body27.us_crit_edge, label %for.inc39.us

for.cond25.preheader.us.for.body27.us_crit_edge:  ; preds = %for.cond25.preheader.us
  br i1 %min.iters.check, label %for.body27.us.preheader, label %min.iters.checked

for.body27.us.preheader:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.cond25.preheader.us.for.body27.us_crit_edge
  %indvars.iv83.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.cond25.preheader.us.for.body27.us_crit_edge ], [ %n.vec, %middle.block ]
  %20 = sub nsw i64 %13, %indvars.iv83.ph
  %21 = sub nsw i64 %wide.trip.count85, %indvars.iv83.ph
  %xtraiter149 = and i64 %20, 3
  %lcmp.mod150 = icmp eq i64 %xtraiter149, 0
  br i1 %lcmp.mod150, label %for.body27.us.prol.loopexit, label %for.body27.us.prol.preheader

for.body27.us.prol.preheader:                     ; preds = %for.body27.us.preheader
  br label %for.body27.us.prol

for.body27.us.prol:                               ; preds = %for.body27.us.prol, %for.body27.us.prol.preheader
  %indvars.iv83.prol = phi i64 [ %indvars.iv.next84.prol, %for.body27.us.prol ], [ %indvars.iv83.ph, %for.body27.us.prol.preheader ]
  %prol.iter151 = phi i64 [ %prol.iter151.sub, %for.body27.us.prol ], [ %xtraiter149, %for.body27.us.prol.preheader ]
  %arrayidx29.us.prol = getelementptr inbounds double, double* %sum, i64 %indvars.iv83.prol
  %22 = bitcast double* %arrayidx29.us.prol to i64*
  %23 = load i64, i64* %22, align 8
  %arrayidx35.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv87, i64 %indvars.iv83.prol
  %24 = bitcast double* %arrayidx35.us.prol to i64*
  store i64 %23, i64* %24, align 8
  %indvars.iv.next84.prol = add nuw nsw i64 %indvars.iv83.prol, 1
  %prol.iter151.sub = add nsw i64 %prol.iter151, -1
  %prol.iter151.cmp = icmp eq i64 %prol.iter151.sub, 0
  br i1 %prol.iter151.cmp, label %for.body27.us.prol.loopexit.unr-lcssa, label %for.body27.us.prol, !llvm.loop !1

for.body27.us.prol.loopexit.unr-lcssa:            ; preds = %for.body27.us.prol
  %25 = add i64 %indvars.iv83.ph, %xtraiter149
  br label %for.body27.us.prol.loopexit

for.body27.us.prol.loopexit:                      ; preds = %for.body27.us.preheader, %for.body27.us.prol.loopexit.unr-lcssa
  %indvars.iv83.unr = phi i64 [ %indvars.iv83.ph, %for.body27.us.preheader ], [ %25, %for.body27.us.prol.loopexit.unr-lcssa ]
  %26 = icmp ult i64 %21, 3
  br i1 %26, label %for.inc39.us.loopexit, label %for.body27.us.preheader.new

for.body27.us.preheader.new:                      ; preds = %for.body27.us.prol.loopexit
  br label %for.body27.us

min.iters.checked:                                ; preds = %for.cond25.preheader.us.for.body27.us_crit_edge
  br i1 %cmp.zero, label %for.body27.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep105
  %bound1 = icmp ugt double* %scevgep103, %sum
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.body27.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br i1 %lcmp.mod147, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter148 = phi i64 [ %prol.iter148.sub, %vector.body.prol ], [ %xtraiter146, %vector.body.prol.preheader ]
  %27 = getelementptr inbounds double, double* %sum, i64 %index.prol
  %28 = bitcast double* %27 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %28, align 8, !alias.scope !3
  %29 = getelementptr double, double* %27, i64 2
  %30 = bitcast double* %29 to <2 x i64>*
  %wide.load108.prol = load <2 x i64>, <2 x i64>* %30, align 8, !alias.scope !3
  %31 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv87, i64 %index.prol
  %32 = bitcast double* %31 to <2 x i64>*
  store <2 x i64> %wide.load.prol, <2 x i64>* %32, align 8, !alias.scope !6, !noalias !3
  %33 = getelementptr double, double* %31, i64 2
  %34 = bitcast double* %33 to <2 x i64>*
  store <2 x i64> %wide.load108.prol, <2 x i64>* %34, align 8, !alias.scope !6, !noalias !3
  %index.next.prol = add nuw nsw i64 %index.prol, 4
  %prol.iter148.sub = add nsw i64 %prol.iter148, -1
  %prol.iter148.cmp = icmp eq i64 %prol.iter148.sub, 0
  br i1 %prol.iter148.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !8

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %17, %vector.body.prol.loopexit.unr-lcssa ]
  br i1 %15, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %35 = getelementptr inbounds double, double* %sum, i64 %index
  %36 = bitcast double* %35 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %36, align 8, !alias.scope !3
  %37 = getelementptr double, double* %35, i64 2
  %38 = bitcast double* %37 to <2 x i64>*
  %wide.load108 = load <2 x i64>, <2 x i64>* %38, align 8, !alias.scope !3
  %39 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv87, i64 %index
  %40 = bitcast double* %39 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %40, align 8, !alias.scope !6, !noalias !3
  %41 = getelementptr double, double* %39, i64 2
  %42 = bitcast double* %41 to <2 x i64>*
  store <2 x i64> %wide.load108, <2 x i64>* %42, align 8, !alias.scope !6, !noalias !3
  %index.next = add i64 %index, 4
  %43 = getelementptr inbounds double, double* %sum, i64 %index.next
  %44 = bitcast double* %43 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %44, align 8, !alias.scope !3
  %45 = getelementptr double, double* %43, i64 2
  %46 = bitcast double* %45 to <2 x i64>*
  %wide.load108.1 = load <2 x i64>, <2 x i64>* %46, align 8, !alias.scope !3
  %47 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv87, i64 %index.next
  %48 = bitcast double* %47 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %48, align 8, !alias.scope !6, !noalias !3
  %49 = getelementptr double, double* %47, i64 2
  %50 = bitcast double* %49 to <2 x i64>*
  store <2 x i64> %wide.load108.1, <2 x i64>* %50, align 8, !alias.scope !6, !noalias !3
  %index.next.1 = add i64 %index, 8
  %51 = getelementptr inbounds double, double* %sum, i64 %index.next.1
  %52 = bitcast double* %51 to <2 x i64>*
  %wide.load.2 = load <2 x i64>, <2 x i64>* %52, align 8, !alias.scope !3
  %53 = getelementptr double, double* %51, i64 2
  %54 = bitcast double* %53 to <2 x i64>*
  %wide.load108.2 = load <2 x i64>, <2 x i64>* %54, align 8, !alias.scope !3
  %55 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv87, i64 %index.next.1
  %56 = bitcast double* %55 to <2 x i64>*
  store <2 x i64> %wide.load.2, <2 x i64>* %56, align 8, !alias.scope !6, !noalias !3
  %57 = getelementptr double, double* %55, i64 2
  %58 = bitcast double* %57 to <2 x i64>*
  store <2 x i64> %wide.load108.2, <2 x i64>* %58, align 8, !alias.scope !6, !noalias !3
  %index.next.2 = add i64 %index, 12
  %59 = getelementptr inbounds double, double* %sum, i64 %index.next.2
  %60 = bitcast double* %59 to <2 x i64>*
  %wide.load.3 = load <2 x i64>, <2 x i64>* %60, align 8, !alias.scope !3
  %61 = getelementptr double, double* %59, i64 2
  %62 = bitcast double* %61 to <2 x i64>*
  %wide.load108.3 = load <2 x i64>, <2 x i64>* %62, align 8, !alias.scope !3
  %63 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv87, i64 %index.next.2
  %64 = bitcast double* %63 to <2 x i64>*
  store <2 x i64> %wide.load.3, <2 x i64>* %64, align 8, !alias.scope !6, !noalias !3
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x i64>*
  store <2 x i64> %wide.load108.3, <2 x i64>* %66, align 8, !alias.scope !6, !noalias !3
  %index.next.3 = add i64 %index, 16
  %67 = icmp eq i64 %index.next.3, %n.vec
  br i1 %67, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !9

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  br i1 %cmp.n, label %for.inc39.us, label %for.body27.us.preheader

for.inc39.us.loopexit.unr-lcssa:                  ; preds = %for.body27.us
  br label %for.inc39.us.loopexit

for.inc39.us.loopexit:                            ; preds = %for.body27.us.prol.loopexit, %for.inc39.us.loopexit.unr-lcssa
  br label %for.inc39.us

for.inc39.us:                                     ; preds = %for.inc39.us.loopexit, %middle.block, %for.cond25.preheader.us, %for.cond4.preheader.us
  %.lcssa6.us96 = phi i32 [ %19, %for.cond4.preheader.us ], [ %storemerge63, %for.cond25.preheader.us ], [ %storemerge63, %middle.block ], [ %storemerge63, %for.inc39.us.loopexit ]
  %inc.lcssa21.lcssa30.us94 = phi i32 [ %inc.lcssa21.lcssa29.us, %for.cond4.preheader.us ], [ %np, %for.cond25.preheader.us ], [ %np, %middle.block ], [ %np, %for.inc39.us.loopexit ]
  %inc37.lcssa31.us = phi i32 [ 0, %for.cond4.preheader.us ], [ 0, %for.cond25.preheader.us ], [ %np, %middle.block ], [ %np, %for.inc39.us.loopexit ]
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  %exitcond153 = icmp ne i64 %indvars.iv.next88, %2
  br i1 %exitcond153, label %for.cond4.preheader.us, label %for.inc42.loopexit

for.body27.us:                                    ; preds = %for.body27.us, %for.body27.us.preheader.new
  %indvars.iv83 = phi i64 [ %indvars.iv83.unr, %for.body27.us.preheader.new ], [ %indvars.iv.next84.3, %for.body27.us ]
  %arrayidx29.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv83
  %68 = bitcast double* %arrayidx29.us to i64*
  %69 = load i64, i64* %68, align 8
  %arrayidx35.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv87, i64 %indvars.iv83
  %70 = bitcast double* %arrayidx35.us to i64*
  store i64 %69, i64* %70, align 8
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  %arrayidx29.us.1 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next84
  %71 = bitcast double* %arrayidx29.us.1 to i64*
  %72 = load i64, i64* %71, align 8
  %arrayidx35.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv87, i64 %indvars.iv.next84
  %73 = bitcast double* %arrayidx35.us.1 to i64*
  store i64 %72, i64* %73, align 8
  %indvars.iv.next84.1 = add nsw i64 %indvars.iv83, 2
  %arrayidx29.us.2 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next84.1
  %74 = bitcast double* %arrayidx29.us.2 to i64*
  %75 = load i64, i64* %74, align 8
  %arrayidx35.us.2 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv87, i64 %indvars.iv.next84.1
  %76 = bitcast double* %arrayidx35.us.2 to i64*
  store i64 %75, i64* %76, align 8
  %indvars.iv.next84.2 = add nsw i64 %indvars.iv83, 3
  %arrayidx29.us.3 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next84.2
  %77 = bitcast double* %arrayidx29.us.3 to i64*
  %78 = load i64, i64* %77, align 8
  %arrayidx35.us.3 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv87, i64 %indvars.iv.next84.2
  %79 = bitcast double* %arrayidx35.us.3 to i64*
  store i64 %78, i64* %79, align 8
  %exitcond86.3 = icmp eq i64 %indvars.iv.next84.2, %wide.trip.count85
  %indvars.iv.next84.3 = add nsw i64 %indvars.iv83, 4
  br i1 %exitcond86.3, label %for.inc39.us.loopexit.unr-lcssa, label %for.body27.us, !llvm.loop !12

for.body6.us.us:                                  ; preds = %for.body6.us.us.preheader, %for.cond7.for.inc22_crit_edge.us.us
  %indvars.iv81 = phi i64 [ %indvars.iv.next82, %for.cond7.for.inc22_crit_edge.us.us ], [ 0, %for.body6.us.us.preheader ]
  %arrayidx.us.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv81
  store double 0.000000e+00, double* %arrayidx.us.us, align 8
  br i1 %lcmp.mod145, label %for.body9.us.us.prol.loopexit.unr-lcssa, label %for.body9.us.us.prol.preheader

for.body9.us.us.prol.preheader:                   ; preds = %for.body6.us.us
  br label %for.body9.us.us.prol

for.body9.us.us.prol:                             ; preds = %for.body9.us.us.prol.preheader
  %80 = load double, double* %arrayidx15.us.us.prol, align 8
  %arrayidx19.us.us.prol = getelementptr inbounds [160 x double], [160 x double]* %6, i64 0, i64 %indvars.iv81
  %81 = load double, double* %arrayidx19.us.us.prol, align 8
  %mul.us.us.prol = fmul double %80, %81
  %add.us.us.prol = fadd double %mul.us.us.prol, 0.000000e+00
  store double %add.us.us.prol, double* %arrayidx.us.us, align 8
  br label %for.body9.us.us.prol.loopexit.unr-lcssa

for.body9.us.us.prol.loopexit.unr-lcssa:          ; preds = %for.body6.us.us, %for.body9.us.us.prol
  %indvars.iv77.unr.ph = phi i64 [ 1, %for.body9.us.us.prol ], [ 0, %for.body6.us.us ]
  %.unr.ph = phi double [ %add.us.us.prol, %for.body9.us.us.prol ], [ 0.000000e+00, %for.body6.us.us ]
  br label %for.body9.us.us.prol.loopexit

for.body9.us.us.prol.loopexit:                    ; preds = %for.body9.us.us.prol.loopexit.unr-lcssa
  br i1 %14, label %for.cond7.for.inc22_crit_edge.us.us, label %for.body6.us.us.new

for.body6.us.us.new:                              ; preds = %for.body9.us.us.prol.loopexit
  br label %for.body9.us.us

for.cond7.for.inc22_crit_edge.us.us.unr-lcssa:    ; preds = %for.body9.us.us
  br label %for.cond7.for.inc22_crit_edge.us.us

for.cond7.for.inc22_crit_edge.us.us:              ; preds = %for.body9.us.us.prol.loopexit, %for.cond7.for.inc22_crit_edge.us.us.unr-lcssa
  %indvars.iv.next82 = add nuw nsw i64 %indvars.iv81, 1
  %exitcond152 = icmp ne i64 %indvars.iv.next82, %1
  br i1 %exitcond152, label %for.body6.us.us, label %for.cond25.preheader.us

for.body9.us.us:                                  ; preds = %for.body9.us.us, %for.body6.us.us.new
  %indvars.iv77 = phi i64 [ %indvars.iv77.unr.ph, %for.body6.us.us.new ], [ %indvars.iv.next78.1, %for.body9.us.us ]
  %82 = phi double [ %.unr.ph, %for.body6.us.us.new ], [ %add.us.us.1, %for.body9.us.us ]
  %arrayidx15.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom10, i64 %indvars.iv87, i64 %indvars.iv77
  %83 = load double, double* %arrayidx15.us.us, align 8
  %arrayidx19.us.us = getelementptr inbounds [160 x double], [160 x double]* %6, i64 %indvars.iv77, i64 %indvars.iv81
  %84 = load double, double* %arrayidx19.us.us, align 8
  %mul.us.us = fmul double %83, %84
  %add.us.us = fadd double %mul.us.us, %82
  store double %add.us.us, double* %arrayidx.us.us, align 8
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %arrayidx15.us.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom10, i64 %indvars.iv87, i64 %indvars.iv.next78
  %85 = load double, double* %arrayidx15.us.us.1, align 8
  %arrayidx19.us.us.1 = getelementptr inbounds [160 x double], [160 x double]* %6, i64 %indvars.iv.next78, i64 %indvars.iv81
  %86 = load double, double* %arrayidx19.us.us.1, align 8
  %mul.us.us.1 = fmul double %85, %86
  %add.us.us.1 = fadd double %mul.us.us.1, %add.us.us
  store double %add.us.us.1, double* %arrayidx.us.us, align 8
  %exitcond80.1 = icmp eq i64 %indvars.iv.next78, %wide.trip.count79
  %indvars.iv.next78.1 = add nsw i64 %indvars.iv77, 2
  br i1 %exitcond80.1, label %for.cond7.for.inc22_crit_edge.us.us.unr-lcssa, label %for.body9.us.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc39
  %indvars.iv75 = phi i64 [ %indvars.iv.next76, %for.inc39 ], [ 0, %for.cond4.preheader.preheader ]
  %inc.lcssa21.lcssa29 = phi i32 [ %inc.lcssa21.lcssa3099, %for.inc39 ], [ %inc.lcssa21.lcssa30.lcssa66, %for.cond4.preheader.preheader ]
  %scevgep118 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv75, i64 0
  %scevgep120 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv75, i64 %7
  br i1 %cmp516, label %for.body27.lr.ph, label %for.inc39

for.body27.lr.ph:                                 ; preds = %for.cond4.preheader
  call void @llvm.memset.p0i8.i64(i8* %sum89, i8 0, i64 %5, i32 8, i1 false)
  br i1 %min.iters.check112, label %for.body27.preheader, label %min.iters.checked113

min.iters.checked113:                             ; preds = %for.body27.lr.ph
  br i1 %cmp.zero116, label %for.body27.preheader, label %vector.memcheck128

vector.memcheck128:                               ; preds = %min.iters.checked113
  %bound0124 = icmp ult double* %scevgep118, %scevgep122
  %bound1125 = icmp ugt double* %scevgep120, %sum
  %memcheck.conflict127 = and i1 %bound0124, %bound1125
  br i1 %memcheck.conflict127, label %for.body27.preheader, label %vector.body109.preheader

vector.body109.preheader:                         ; preds = %vector.memcheck128
  br i1 %lcmp.mod, label %vector.body109.prol.loopexit, label %vector.body109.prol.preheader

vector.body109.prol.preheader:                    ; preds = %vector.body109.preheader
  br label %vector.body109.prol

vector.body109.prol:                              ; preds = %vector.body109.prol, %vector.body109.prol.preheader
  %index130.prol = phi i64 [ %index.next131.prol, %vector.body109.prol ], [ 0, %vector.body109.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body109.prol ], [ %xtraiter, %vector.body109.prol.preheader ]
  %87 = getelementptr inbounds double, double* %sum, i64 %index130.prol
  %88 = bitcast double* %87 to <2 x i64>*
  %wide.load138.prol = load <2 x i64>, <2 x i64>* %88, align 8, !alias.scope !13
  %89 = getelementptr double, double* %87, i64 2
  %90 = bitcast double* %89 to <2 x i64>*
  %wide.load139.prol = load <2 x i64>, <2 x i64>* %90, align 8, !alias.scope !13
  %91 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv75, i64 %index130.prol
  %92 = bitcast double* %91 to <2 x i64>*
  store <2 x i64> %wide.load138.prol, <2 x i64>* %92, align 8, !alias.scope !16, !noalias !13
  %93 = getelementptr double, double* %91, i64 2
  %94 = bitcast double* %93 to <2 x i64>*
  store <2 x i64> %wide.load139.prol, <2 x i64>* %94, align 8, !alias.scope !16, !noalias !13
  %index.next131.prol = add nuw nsw i64 %index130.prol, 4
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body109.prol.loopexit.unr-lcssa, label %vector.body109.prol, !llvm.loop !18

vector.body109.prol.loopexit.unr-lcssa:           ; preds = %vector.body109.prol
  br label %vector.body109.prol.loopexit

vector.body109.prol.loopexit:                     ; preds = %vector.body109.preheader, %vector.body109.prol.loopexit.unr-lcssa
  %index130.unr = phi i64 [ 0, %vector.body109.preheader ], [ %17, %vector.body109.prol.loopexit.unr-lcssa ]
  br i1 %16, label %middle.block110, label %vector.body109.preheader.new

vector.body109.preheader.new:                     ; preds = %vector.body109.prol.loopexit
  br label %vector.body109

vector.body109:                                   ; preds = %vector.body109, %vector.body109.preheader.new
  %index130 = phi i64 [ %index130.unr, %vector.body109.preheader.new ], [ %index.next131.3, %vector.body109 ]
  %95 = getelementptr inbounds double, double* %sum, i64 %index130
  %96 = bitcast double* %95 to <2 x i64>*
  %wide.load138 = load <2 x i64>, <2 x i64>* %96, align 8, !alias.scope !13
  %97 = getelementptr double, double* %95, i64 2
  %98 = bitcast double* %97 to <2 x i64>*
  %wide.load139 = load <2 x i64>, <2 x i64>* %98, align 8, !alias.scope !13
  %99 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv75, i64 %index130
  %100 = bitcast double* %99 to <2 x i64>*
  store <2 x i64> %wide.load138, <2 x i64>* %100, align 8, !alias.scope !16, !noalias !13
  %101 = getelementptr double, double* %99, i64 2
  %102 = bitcast double* %101 to <2 x i64>*
  store <2 x i64> %wide.load139, <2 x i64>* %102, align 8, !alias.scope !16, !noalias !13
  %index.next131 = add i64 %index130, 4
  %103 = getelementptr inbounds double, double* %sum, i64 %index.next131
  %104 = bitcast double* %103 to <2 x i64>*
  %wide.load138.1 = load <2 x i64>, <2 x i64>* %104, align 8, !alias.scope !13
  %105 = getelementptr double, double* %103, i64 2
  %106 = bitcast double* %105 to <2 x i64>*
  %wide.load139.1 = load <2 x i64>, <2 x i64>* %106, align 8, !alias.scope !13
  %107 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv75, i64 %index.next131
  %108 = bitcast double* %107 to <2 x i64>*
  store <2 x i64> %wide.load138.1, <2 x i64>* %108, align 8, !alias.scope !16, !noalias !13
  %109 = getelementptr double, double* %107, i64 2
  %110 = bitcast double* %109 to <2 x i64>*
  store <2 x i64> %wide.load139.1, <2 x i64>* %110, align 8, !alias.scope !16, !noalias !13
  %index.next131.1 = add i64 %index130, 8
  %111 = getelementptr inbounds double, double* %sum, i64 %index.next131.1
  %112 = bitcast double* %111 to <2 x i64>*
  %wide.load138.2 = load <2 x i64>, <2 x i64>* %112, align 8, !alias.scope !13
  %113 = getelementptr double, double* %111, i64 2
  %114 = bitcast double* %113 to <2 x i64>*
  %wide.load139.2 = load <2 x i64>, <2 x i64>* %114, align 8, !alias.scope !13
  %115 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv75, i64 %index.next131.1
  %116 = bitcast double* %115 to <2 x i64>*
  store <2 x i64> %wide.load138.2, <2 x i64>* %116, align 8, !alias.scope !16, !noalias !13
  %117 = getelementptr double, double* %115, i64 2
  %118 = bitcast double* %117 to <2 x i64>*
  store <2 x i64> %wide.load139.2, <2 x i64>* %118, align 8, !alias.scope !16, !noalias !13
  %index.next131.2 = add i64 %index130, 12
  %119 = getelementptr inbounds double, double* %sum, i64 %index.next131.2
  %120 = bitcast double* %119 to <2 x i64>*
  %wide.load138.3 = load <2 x i64>, <2 x i64>* %120, align 8, !alias.scope !13
  %121 = getelementptr double, double* %119, i64 2
  %122 = bitcast double* %121 to <2 x i64>*
  %wide.load139.3 = load <2 x i64>, <2 x i64>* %122, align 8, !alias.scope !13
  %123 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv75, i64 %index.next131.2
  %124 = bitcast double* %123 to <2 x i64>*
  store <2 x i64> %wide.load138.3, <2 x i64>* %124, align 8, !alias.scope !16, !noalias !13
  %125 = getelementptr double, double* %123, i64 2
  %126 = bitcast double* %125 to <2 x i64>*
  store <2 x i64> %wide.load139.3, <2 x i64>* %126, align 8, !alias.scope !16, !noalias !13
  %index.next131.3 = add i64 %index130, 16
  %127 = icmp eq i64 %index.next131.3, %n.vec115
  br i1 %127, label %middle.block110.unr-lcssa, label %vector.body109, !llvm.loop !19

middle.block110.unr-lcssa:                        ; preds = %vector.body109
  br label %middle.block110

middle.block110:                                  ; preds = %vector.body109.prol.loopexit, %middle.block110.unr-lcssa
  br i1 %cmp.n133, label %for.inc39, label %for.body27.preheader

for.body27.preheader:                             ; preds = %middle.block110, %vector.memcheck128, %min.iters.checked113, %for.body27.lr.ph
  %indvars.iv71.ph = phi i64 [ 0, %vector.memcheck128 ], [ 0, %min.iters.checked113 ], [ 0, %for.body27.lr.ph ], [ %n.vec115, %middle.block110 ]
  %128 = sub nsw i64 %12, %indvars.iv71.ph
  %129 = sub nsw i64 %wide.trip.count85, %indvars.iv71.ph
  %xtraiter141 = and i64 %128, 3
  %lcmp.mod142 = icmp eq i64 %xtraiter141, 0
  br i1 %lcmp.mod142, label %for.body27.prol.loopexit, label %for.body27.prol.preheader

for.body27.prol.preheader:                        ; preds = %for.body27.preheader
  br label %for.body27.prol

for.body27.prol:                                  ; preds = %for.body27.prol, %for.body27.prol.preheader
  %indvars.iv71.prol = phi i64 [ %indvars.iv.next72.prol, %for.body27.prol ], [ %indvars.iv71.ph, %for.body27.prol.preheader ]
  %prol.iter143 = phi i64 [ %prol.iter143.sub, %for.body27.prol ], [ %xtraiter141, %for.body27.prol.preheader ]
  %arrayidx29.prol = getelementptr inbounds double, double* %sum, i64 %indvars.iv71.prol
  %130 = bitcast double* %arrayidx29.prol to i64*
  %131 = load i64, i64* %130, align 8
  %arrayidx35.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv75, i64 %indvars.iv71.prol
  %132 = bitcast double* %arrayidx35.prol to i64*
  store i64 %131, i64* %132, align 8
  %indvars.iv.next72.prol = add nuw nsw i64 %indvars.iv71.prol, 1
  %prol.iter143.sub = add nsw i64 %prol.iter143, -1
  %prol.iter143.cmp = icmp eq i64 %prol.iter143.sub, 0
  br i1 %prol.iter143.cmp, label %for.body27.prol.loopexit.unr-lcssa, label %for.body27.prol, !llvm.loop !20

for.body27.prol.loopexit.unr-lcssa:               ; preds = %for.body27.prol
  %133 = add i64 %indvars.iv71.ph, %xtraiter141
  br label %for.body27.prol.loopexit

for.body27.prol.loopexit:                         ; preds = %for.body27.preheader, %for.body27.prol.loopexit.unr-lcssa
  %indvars.iv71.unr = phi i64 [ %indvars.iv71.ph, %for.body27.preheader ], [ %133, %for.body27.prol.loopexit.unr-lcssa ]
  %134 = icmp ult i64 %129, 3
  br i1 %134, label %for.inc39.loopexit, label %for.body27.preheader.new

for.body27.preheader.new:                         ; preds = %for.body27.prol.loopexit
  br label %for.body27

for.body27:                                       ; preds = %for.body27, %for.body27.preheader.new
  %indvars.iv71 = phi i64 [ %indvars.iv71.unr, %for.body27.preheader.new ], [ %indvars.iv.next72.3, %for.body27 ]
  %arrayidx29 = getelementptr inbounds double, double* %sum, i64 %indvars.iv71
  %135 = bitcast double* %arrayidx29 to i64*
  %136 = load i64, i64* %135, align 8
  %arrayidx35 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv75, i64 %indvars.iv71
  %137 = bitcast double* %arrayidx35 to i64*
  store i64 %136, i64* %137, align 8
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %arrayidx29.1 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next72
  %138 = bitcast double* %arrayidx29.1 to i64*
  %139 = load i64, i64* %138, align 8
  %arrayidx35.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv75, i64 %indvars.iv.next72
  %140 = bitcast double* %arrayidx35.1 to i64*
  store i64 %139, i64* %140, align 8
  %indvars.iv.next72.1 = add nsw i64 %indvars.iv71, 2
  %arrayidx29.2 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next72.1
  %141 = bitcast double* %arrayidx29.2 to i64*
  %142 = load i64, i64* %141, align 8
  %arrayidx35.2 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv75, i64 %indvars.iv.next72.1
  %143 = bitcast double* %arrayidx35.2 to i64*
  store i64 %142, i64* %143, align 8
  %indvars.iv.next72.2 = add nsw i64 %indvars.iv71, 3
  %arrayidx29.3 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next72.2
  %144 = bitcast double* %arrayidx29.3 to i64*
  %145 = load i64, i64* %144, align 8
  %arrayidx35.3 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %idxprom30.us, i64 %indvars.iv75, i64 %indvars.iv.next72.2
  %146 = bitcast double* %arrayidx35.3 to i64*
  store i64 %145, i64* %146, align 8
  %exitcond74.3 = icmp eq i64 %indvars.iv.next72.2, %wide.trip.count73
  %indvars.iv.next72.3 = add nsw i64 %indvars.iv71, 4
  br i1 %exitcond74.3, label %for.inc39.loopexit.unr-lcssa, label %for.body27, !llvm.loop !21

for.inc39.loopexit.unr-lcssa:                     ; preds = %for.body27
  br label %for.inc39.loopexit

for.inc39.loopexit:                               ; preds = %for.body27.prol.loopexit, %for.inc39.loopexit.unr-lcssa
  br label %for.inc39

for.inc39:                                        ; preds = %for.inc39.loopexit, %middle.block110, %for.cond4.preheader
  %inc.lcssa21.lcssa3099 = phi i32 [ %inc.lcssa21.lcssa29, %for.cond4.preheader ], [ 0, %middle.block110 ], [ 0, %for.inc39.loopexit ]
  %inc37.lcssa31 = phi i32 [ 0, %for.cond4.preheader ], [ %np, %middle.block110 ], [ %np, %for.inc39.loopexit ]
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond = icmp ne i64 %indvars.iv.next76, %2
  br i1 %exitcond, label %for.cond4.preheader, label %for.inc42.loopexit140

for.inc42.loopexit:                               ; preds = %for.inc39.us
  br label %for.inc42

for.inc42.loopexit140:                            ; preds = %for.inc39
  br label %for.inc42

for.inc42:                                        ; preds = %for.inc42.loopexit140, %for.inc42.loopexit, %for.cond1.preheader
  %inc37.lcssa31.lcssa68 = phi i32 [ %inc37.lcssa31.lcssa67, %for.cond1.preheader ], [ %inc37.lcssa31.us, %for.inc42.loopexit ], [ %inc37.lcssa31, %for.inc42.loopexit140 ]
  %inc.lcssa21.lcssa30.lcssa65 = phi i32 [ %inc.lcssa21.lcssa30.lcssa66, %for.cond1.preheader ], [ %inc.lcssa21.lcssa30.us94, %for.inc42.loopexit ], [ %inc.lcssa21.lcssa3099, %for.inc42.loopexit140 ]
  %.lcssa10 = phi i32 [ %storemerge63, %for.cond1.preheader ], [ %.lcssa6.us96, %for.inc42.loopexit ], [ %storemerge63, %for.inc42.loopexit140 ]
  %inc43 = add nsw i32 %.lcssa10, 1
  %cmp = icmp slt i32 %inc43, %nr
  br i1 %cmp, label %for.cond1.preheader, label %for.cond.for.end44_crit_edge

for.cond.for.end44_crit_edge:                     ; preds = %for.inc42
  store i32 %inc.lcssa21.lcssa30.lcssa65, i32* %s, align 4
  store i32 %inc37.lcssa31.lcssa68, i32* %p, align 4
  br label %for.end44

for.end44:                                        ; preds = %entry, %for.cond.for.end44_crit_edge
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
  tail call fastcc void @init_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %arraydecay, [160 x double]* %arraydecay3)
  tail call void (...) @polybench_timer_start() #3
  %arraydecay5 = bitcast i8* %call2 to [160 x double]*
  %arraydecay6 = bitcast i8* %call1 to double*
  tail call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %arraydecay, [160 x double]* %arraydecay5, double* %arraydecay6)
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
  tail call fastcc void @print_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %arraydecay)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #3
  tail call void @free(i8* %call1) #3
  tail call void @free(i8* %call2) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %nr, i32 %nq, i32 %np, [140 x [160 x double]]* %A, [160 x double]* %C4) unnamed_addr #0 {
entry:
  %k = alloca i32, align 4
  %cmp14 = icmp sgt i32 %nr, 0
  br i1 %cmp14, label %for.cond1.preheader.lr.ph, label %for.cond18.preheader

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %cmp211 = icmp sgt i32 %nq, 0
  %cmp510 = icmp sgt i32 %np, 0
  %conv7 = sitofp i32 %np to double
  br i1 %cmp211, label %for.cond1.preheader.us.preheader, label %for.cond1.preheader.lr.ph.for.cond.for.cond18.preheader_crit_edge_crit_edge

for.cond1.preheader.lr.ph.for.cond.for.cond18.preheader_crit_edge_crit_edge: ; preds = %for.cond1.preheader.lr.ph
  %k.promoted = load i32, i32* %k, align 4
  br label %for.cond.for.cond18.preheader_crit_edge

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %0 = add i32 %np, -1
  %1 = sext i32 %nq to i64
  %2 = sext i32 %nr to i64
  %wide.trip.count56 = zext i32 %0 to i64
  %3 = and i64 %wide.trip.count56, 1
  %lcmp.mod65 = icmp eq i64 %3, 0
  %4 = icmp eq i32 %0, 0
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc15_crit_edge.us, %for.cond1.preheader.us.preheader
  %indvars.iv61 = phi i64 [ 0, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next62, %for.cond1.for.inc15_crit_edge.us ]
  br i1 %cmp510, label %for.cond4.preheader.us.us.preheader, label %for.cond1.for.inc15_crit_edge.us

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.us
  br label %for.cond4.preheader.us.us

for.cond1.for.inc15_crit_edge.us.loopexit:        ; preds = %for.cond4.for.inc12_crit_edge.us.us
  br label %for.cond1.for.inc15_crit_edge.us

for.cond1.for.inc15_crit_edge.us:                 ; preds = %for.cond1.for.inc15_crit_edge.us.loopexit, %for.cond1.preheader.us
  %inc.lcssa13.lcssa.us = phi i32 [ 0, %for.cond1.preheader.us ], [ %np, %for.cond1.for.inc15_crit_edge.us.loopexit ]
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond67 = icmp ne i64 %indvars.iv.next62, %2
  br i1 %exitcond67, label %for.cond1.preheader.us, label %for.cond.for.cond18.preheader_crit_edge.loopexit

for.cond4.preheader.us.us:                        ; preds = %for.cond4.preheader.us.us.preheader, %for.cond4.for.inc12_crit_edge.us.us
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %for.cond4.for.inc12_crit_edge.us.us ], [ 0, %for.cond4.preheader.us.us.preheader ]
  %5 = mul nuw nsw i64 %indvars.iv58, %indvars.iv61
  br i1 %lcmp.mod65, label %for.body6.us.us.prol.preheader, label %for.body6.us.us.prol.loopexit.unr-lcssa

for.body6.us.us.prol.preheader:                   ; preds = %for.cond4.preheader.us.us
  br label %for.body6.us.us.prol

for.body6.us.us.prol:                             ; preds = %for.body6.us.us.prol.preheader
  %6 = trunc i64 %5 to i32
  %rem.us.us.prol = srem i32 %6, %np
  %conv.us.us.prol = sitofp i32 %rem.us.us.prol to double
  %div.us.us.prol = fdiv double %conv.us.us.prol, %conv7
  %arrayidx11.us.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv61, i64 %indvars.iv58, i64 0
  store double %div.us.us.prol, double* %arrayidx11.us.us.prol, align 8
  br label %for.body6.us.us.prol.loopexit.unr-lcssa

for.body6.us.us.prol.loopexit.unr-lcssa:          ; preds = %for.cond4.preheader.us.us, %for.body6.us.us.prol
  %indvars.iv53.unr.ph = phi i64 [ 1, %for.body6.us.us.prol ], [ 0, %for.cond4.preheader.us.us ]
  br label %for.body6.us.us.prol.loopexit

for.body6.us.us.prol.loopexit:                    ; preds = %for.body6.us.us.prol.loopexit.unr-lcssa
  br i1 %4, label %for.cond4.for.inc12_crit_edge.us.us, label %for.cond4.preheader.us.us.new

for.cond4.preheader.us.us.new:                    ; preds = %for.body6.us.us.prol.loopexit
  br label %for.body6.us.us

for.cond4.for.inc12_crit_edge.us.us.unr-lcssa:    ; preds = %for.body6.us.us
  br label %for.cond4.for.inc12_crit_edge.us.us

for.cond4.for.inc12_crit_edge.us.us:              ; preds = %for.body6.us.us.prol.loopexit, %for.cond4.for.inc12_crit_edge.us.us.unr-lcssa
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond66 = icmp ne i64 %indvars.iv.next59, %1
  br i1 %exitcond66, label %for.cond4.preheader.us.us, label %for.cond1.for.inc15_crit_edge.us.loopexit

for.body6.us.us:                                  ; preds = %for.body6.us.us, %for.cond4.preheader.us.us.new
  %indvars.iv53 = phi i64 [ %indvars.iv53.unr.ph, %for.cond4.preheader.us.us.new ], [ %indvars.iv.next54.1, %for.body6.us.us ]
  %7 = add nsw i64 %5, %indvars.iv53
  %8 = trunc i64 %7 to i32
  %rem.us.us = srem i32 %8, %np
  %conv.us.us = sitofp i32 %rem.us.us to double
  %arrayidx11.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv61, i64 %indvars.iv58, i64 %indvars.iv53
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %9 = add nsw i64 %5, %indvars.iv.next54
  %10 = trunc i64 %9 to i32
  %rem.us.us.1 = srem i32 %10, %np
  %conv.us.us.1 = sitofp i32 %rem.us.us.1 to double
  %div.us.us.v.i1.1 = insertelement <2 x double> undef, double %conv7, i32 0
  %div.us.us.v.i1.2 = insertelement <2 x double> %div.us.us.v.i1.1, double %conv7, i32 1
  %div.us.us.v.i0.1 = insertelement <2 x double> undef, double %conv.us.us, i32 0
  %div.us.us.v.i0.2 = insertelement <2 x double> %div.us.us.v.i0.1, double %conv.us.us.1, i32 1
  %div.us.us = fdiv <2 x double> %div.us.us.v.i0.2, %div.us.us.v.i1.2
  %11 = bitcast double* %arrayidx11.us.us to <2 x double>*
  store <2 x double> %div.us.us, <2 x double>* %11, align 8
  %exitcond57.1 = icmp eq i64 %indvars.iv.next54, %wide.trip.count56
  %indvars.iv.next54.1 = add nsw i64 %indvars.iv53, 2
  br i1 %exitcond57.1, label %for.cond4.for.inc12_crit_edge.us.us.unr-lcssa, label %for.body6.us.us

for.cond.for.cond18.preheader_crit_edge.loopexit: ; preds = %for.cond1.for.inc15_crit_edge.us
  br label %for.cond.for.cond18.preheader_crit_edge

for.cond.for.cond18.preheader_crit_edge:          ; preds = %for.cond.for.cond18.preheader_crit_edge.loopexit, %for.cond1.preheader.lr.ph.for.cond.for.cond18.preheader_crit_edge_crit_edge
  %inc.lcssa13.lcssa21.lcssa = phi i32 [ %k.promoted, %for.cond1.preheader.lr.ph.for.cond.for.cond18.preheader_crit_edge_crit_edge ], [ %inc.lcssa13.lcssa.us, %for.cond.for.cond18.preheader_crit_edge.loopexit ]
  store i32 %inc.lcssa13.lcssa21.lcssa, i32* %k, align 4
  br label %for.cond18.preheader

for.cond18.preheader:                             ; preds = %entry, %for.cond.for.cond18.preheader_crit_edge
  %cmp196 = icmp sgt i32 %np, 0
  br i1 %cmp196, label %for.cond22.preheader.lr.ph, label %for.end40

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
  %indvars.iv50 = phi i64 [ 0, %for.cond22.preheader.lr.ph ], [ %indvars.iv.next51, %for.cond22.for.inc38_crit_edge.us ]
  br i1 %lcmp.mod, label %for.body25.us.prol.preheader, label %for.body25.us.prol.loopexit.unr-lcssa

for.body25.us.prol.preheader:                     ; preds = %for.cond22.preheader.us
  br label %for.body25.us.prol

for.body25.us.prol:                               ; preds = %for.body25.us.prol.preheader
  %arrayidx34.us.prol = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv50, i64 0
  store double %div30.us.prol, double* %arrayidx34.us.prol, align 8
  br label %for.body25.us.prol.loopexit.unr-lcssa

for.body25.us.prol.loopexit.unr-lcssa:            ; preds = %for.cond22.preheader.us, %for.body25.us.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body25.us.prol ], [ 0, %for.cond22.preheader.us ]
  br label %for.body25.us.prol.loopexit

for.body25.us.prol.loopexit:                      ; preds = %for.body25.us.prol.loopexit.unr-lcssa
  br i1 %15, label %for.cond22.for.inc38_crit_edge.us, label %for.cond22.preheader.us.new

for.cond22.preheader.us.new:                      ; preds = %for.body25.us.prol.loopexit
  br label %for.body25.us

for.body25.us:                                    ; preds = %for.body25.us, %for.cond22.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.cond22.preheader.us.new ], [ %indvars.iv.next.1, %for.body25.us ]
  %16 = mul nsw i64 %indvars.iv, %indvars.iv50
  %17 = trunc i64 %16 to i32
  %rem27.us = srem i32 %17, %np
  %conv28.us = sitofp i32 %rem27.us to double
  %arrayidx34.us = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv50, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %18 = mul nsw i64 %indvars.iv.next, %indvars.iv50
  %19 = trunc i64 %18 to i32
  %rem27.us.1 = srem i32 %19, %np
  %conv28.us.1 = sitofp i32 %rem27.us.1 to double
  %div30.us.v.i1.1 = insertelement <2 x double> undef, double %conv29, i32 0
  %div30.us.v.i1.2 = insertelement <2 x double> %div30.us.v.i1.1, double %conv29, i32 1
  %div30.us.v.i0.1 = insertelement <2 x double> undef, double %conv28.us, i32 0
  %div30.us.v.i0.2 = insertelement <2 x double> %div30.us.v.i0.1, double %conv28.us.1, i32 1
  %div30.us = fdiv <2 x double> %div30.us.v.i0.2, %div30.us.v.i1.2
  %20 = bitcast double* %arrayidx34.us to <2 x double>*
  store <2 x double> %div30.us, <2 x double>* %20, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.cond22.for.inc38_crit_edge.us.unr-lcssa, label %for.body25.us

for.cond22.for.inc38_crit_edge.us.unr-lcssa:      ; preds = %for.body25.us
  br label %for.cond22.for.inc38_crit_edge.us

for.cond22.for.inc38_crit_edge.us:                ; preds = %for.body25.us.prol.loopexit, %for.cond22.for.inc38_crit_edge.us.unr-lcssa
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond = icmp ne i64 %indvars.iv.next51, %13
  br i1 %exitcond, label %for.cond22.preheader.us, label %for.end40.loopexit

for.end40.loopexit:                               ; preds = %for.cond22.for.inc38_crit_edge.us
  br label %for.end40

for.end40:                                        ; preds = %for.end40.loopexit, %for.cond18.preheader
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %nr, i32 %nq, i32 %np, [140 x [160 x double]]* %A) unnamed_addr #0 {
entry:
  %k = alloca i32, align 4
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %cmp8 = icmp sgt i32 %nr, 0
  br i1 %cmp8, label %for.cond2.preheader.lr.ph, label %for.end23

for.cond2.preheader.lr.ph:                        ; preds = %entry
  %cmp35 = icmp sgt i32 %nq, 0
  %cmp64 = icmp sgt i32 %np, 0
  br i1 %cmp35, label %for.cond2.preheader.us.preheader, label %for.cond2.preheader.lr.ph.for.cond.for.end23_crit_edge_crit_edge

for.cond2.preheader.lr.ph.for.cond.for.end23_crit_edge_crit_edge: ; preds = %for.cond2.preheader.lr.ph
  %k.promoted = load i32, i32* %k, align 4
  br label %for.cond.for.end23_crit_edge

for.cond2.preheader.us.preheader:                 ; preds = %for.cond2.preheader.lr.ph
  %3 = sext i32 %np to i64
  %4 = sext i32 %nr to i64
  %5 = sext i32 %nq to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc21_crit_edge.us, %for.cond2.preheader.us.preheader
  %indvars.iv46 = phi i64 [ 0, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next47, %for.cond2.for.inc21_crit_edge.us ]
  br i1 %cmp64, label %for.cond5.preheader.us.us.preheader, label %for.cond2.for.inc21_crit_edge.us

for.cond5.preheader.us.us.preheader:              ; preds = %for.cond2.preheader.us
  %6 = mul nsw i64 %indvars.iv46, %5
  %7 = trunc i64 %6 to i32
  br label %for.cond5.preheader.us.us

for.cond2.for.inc21_crit_edge.us.loopexit:        ; preds = %for.cond5.for.inc18_crit_edge.us.us
  br label %for.cond2.for.inc21_crit_edge.us

for.cond2.for.inc21_crit_edge.us:                 ; preds = %for.cond2.preheader.us, %for.cond2.for.inc21_crit_edge.us.loopexit
  %inc.lcssa7.lcssa.us = phi i32 [ %np, %for.cond2.for.inc21_crit_edge.us.loopexit ], [ 0, %for.cond2.preheader.us ]
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond51 = icmp ne i64 %indvars.iv.next47, %4
  br i1 %exitcond51, label %for.cond2.preheader.us, label %for.cond.for.end23_crit_edge.loopexit

for.cond5.preheader.us.us:                        ; preds = %for.cond5.for.inc18_crit_edge.us.us, %for.cond5.preheader.us.us.preheader
  %indvars.iv44 = phi i64 [ %indvars.iv.next45, %for.cond5.for.inc18_crit_edge.us.us ], [ 0, %for.cond5.preheader.us.us.preheader ]
  %8 = trunc i64 %indvars.iv44 to i32
  %mul83.us.us = add i32 %8, %7
  %add.us.us = mul i32 %mul83.us.us, %np
  %9 = zext i32 %add.us.us to i64
  br label %for.body7.us.us

for.cond5.for.inc18_crit_edge.us.us:              ; preds = %if.end.us.us
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond50 = icmp ne i64 %indvars.iv.next45, %5
  br i1 %exitcond50, label %for.cond5.preheader.us.us, label %for.cond2.for.inc21_crit_edge.us.loopexit

for.body7.us.us:                                  ; preds = %if.end.us.us, %for.cond5.preheader.us.us
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader.us.us ], [ %indvars.iv.next, %if.end.us.us ]
  %10 = add nuw nsw i64 %9, %indvars.iv
  %11 = trunc i64 %10 to i32
  %rem.us.us = srem i32 %11, 20
  %cmp11.us.us = icmp eq i32 %rem.us.us, 0
  br i1 %cmp11.us.us, label %if.then.us.us, label %if.end.us.us

if.then.us.us:                                    ; preds = %for.body7.us.us
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %if.end.us.us

if.end.us.us:                                     ; preds = %for.body7.us.us, %if.then.us.us
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv46, i64 %indvars.iv44, i64 %indvars.iv
  %14 = load double, double* %arrayidx16.us.us, align 8
  %call17.us.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp ne i64 %indvars.iv.next, %3
  br i1 %exitcond, label %for.body7.us.us, label %for.cond5.for.inc18_crit_edge.us.us

for.cond.for.end23_crit_edge.loopexit:            ; preds = %for.cond2.for.inc21_crit_edge.us
  br label %for.cond.for.end23_crit_edge

for.cond.for.end23_crit_edge:                     ; preds = %for.cond.for.end23_crit_edge.loopexit, %for.cond2.preheader.lr.ph.for.cond.for.end23_crit_edge_crit_edge
  %inc.lcssa7.lcssa11.lcssa = phi i32 [ %k.promoted, %for.cond2.preheader.lr.ph.for.cond.for.end23_crit_edge_crit_edge ], [ %inc.lcssa7.lcssa.us, %for.cond.for.end23_crit_edge.loopexit ]
  store i32 %inc.lcssa7.lcssa11.lcssa, i32* %k, align 4
  br label %for.end23

for.end23:                                        ; preds = %entry, %for.cond.for.end23_crit_edge
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %16) #5
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
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = distinct !{!8, !2}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = distinct !{!12, !10, !11}
!13 = !{!14}
!14 = distinct !{!14, !15}
!15 = distinct !{!15, !"LVerDomain"}
!16 = !{!17}
!17 = distinct !{!17, !15}
!18 = distinct !{!18, !2}
!19 = distinct !{!19, !10, !11}
!20 = distinct !{!20, !2}
!21 = distinct !{!21, !10, !11}
