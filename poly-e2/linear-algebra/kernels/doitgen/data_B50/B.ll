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
  %cmp35 = icmp sgt i32 %nr, 0
  br i1 %cmp35, label %for.cond1.preheader.lr.ph, label %for.end44

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %0 = add i32 %np, -1
  %1 = sext i32 %nq to i64
  %2 = zext i32 %0 to i64
  %3 = sext i32 %np to i64
  %4 = sext i32 %nr to i64
  %5 = add nuw nsw i64 %2, 1
  %scevgep78 = getelementptr double, double* %sum, i64 %5
  %6 = add nsw i64 %1, -1
  %7 = and i64 %5, 8589934588
  %8 = add nsw i64 %7, -4
  %9 = lshr exact i64 %8, 2
  %10 = add nuw nsw i64 %9, 1
  %11 = add nuw nsw i64 %2, 1
  %12 = icmp sgt i32 %nq, 0
  %13 = icmp sgt i32 %np, 0
  %14 = ptrtoint double* %sum to i64
  %xtraiter88 = and i64 %5, 1
  %lcmp.mod89 = icmp eq i64 %xtraiter88, 0
  %15 = icmp eq i32 %0, 0
  %sunkaddr = ptrtoint double* %sum to i64
  %sunkaddr.1 = ptrtoint double* %sum to i64
  %sunkaddr.prol = ptrtoint double* %sum to i64
  %min.iters.check = icmp ult i64 %5, 4
  %n.vec = and i64 %5, 8589934588
  %cmp.zero = icmp eq i64 %n.vec, 0
  %xtraiter90 = and i64 %10, 3
  %lcmp.mod91 = icmp eq i64 %xtraiter90, 0
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
  br i1 %13, label %for.body6.us.us.preheader.preheader, label %for.inc39.preheader

for.inc39.preheader:                              ; preds = %for.cond4.preheader.lr.ph
  br i1 %lcmp.mod, label %for.inc39.prol.loopexit, label %for.inc39.prol.preheader

for.inc39.prol.preheader:                         ; preds = %for.inc39.preheader
  br label %for.inc39.prol

for.inc39.prol:                                   ; preds = %for.inc39.prol, %for.inc39.prol.preheader
  %indvars.iv42.prol = phi i64 [ %indvars.iv.next43.prol, %for.inc39.prol ], [ 0, %for.inc39.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc39.prol ], [ %xtraiter, %for.inc39.prol.preheader ]
  %indvars.iv.next43.prol = add nuw nsw i64 %indvars.iv42.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc39.prol.loopexit.unr-lcssa, label %for.inc39.prol, !llvm.loop !1

for.inc39.prol.loopexit.unr-lcssa:                ; preds = %for.inc39.prol
  br label %for.inc39.prol.loopexit

for.inc39.prol.loopexit:                          ; preds = %for.inc39.preheader, %for.inc39.prol.loopexit.unr-lcssa
  %indvars.iv42.unr = phi i64 [ 0, %for.inc39.preheader ], [ %indvars.iv.next43.prol, %for.inc39.prol.loopexit.unr-lcssa ]
  br i1 %17, label %for.inc42.loopexit87, label %for.inc39.preheader.new

for.inc39.preheader.new:                          ; preds = %for.inc39.prol.loopexit
  br label %for.inc39

for.body6.us.us.preheader.preheader:              ; preds = %for.cond4.preheader.lr.ph
  br label %for.body6.us.us.preheader

for.body6.us.us.preheader:                        ; preds = %for.body6.us.us.preheader.preheader, %for.inc39.us
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %for.inc39.us ], [ 0, %for.body6.us.us.preheader.preheader ]
  %scevgep = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv64, i64 %indvars.iv62, i64 0
  %scevgep75 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv64, i64 %indvars.iv62, i64 %5
  %arrayidx15.us.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv64, i64 %indvars.iv62, i64 0
  br label %for.body6.us.us

for.inc39.us.loopexit.unr-lcssa:                  ; preds = %for.inc36.us
  br label %for.inc39.us.loopexit

for.inc39.us.loopexit:                            ; preds = %for.inc36.us.prol.loopexit, %for.inc39.us.loopexit.unr-lcssa
  br label %for.inc39.us

for.inc39.us:                                     ; preds = %for.inc39.us.loopexit, %middle.block
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next63, %1
  br i1 %exitcond72, label %for.inc42.loopexit, label %for.body6.us.us.preheader

for.inc36.us:                                     ; preds = %for.inc36.us, %for.inc36.us.preheader86.new
  %indvars.iv55 = phi i64 [ %indvars.iv55.unr, %for.inc36.us.preheader86.new ], [ %indvars.iv.next56.3, %for.inc36.us ]
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
  %indvars.iv.next56.3 = add nsw i64 %indvars.iv55, 4
  %exitcond58.3 = icmp eq i64 %indvars.iv.next56.2, %2
  br i1 %exitcond58.3, label %for.inc39.us.loopexit.unr-lcssa, label %for.inc36.us, !llvm.loop !3

for.body6.us.us:                                  ; preds = %for.cond7.for.inc22_crit_edge.us.us, %for.body6.us.us.preheader
  %indvars.iv53 = phi i64 [ 0, %for.body6.us.us.preheader ], [ %indvars.iv.next54, %for.cond7.for.inc22_crit_edge.us.us ]
  %arrayidx.us.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv53
  store double 0.000000e+00, double* %arrayidx.us.us, align 8
  %sunkaddr1.us.us = shl i64 %indvars.iv53, 3
  %sunkaddr2.us.us = add i64 %sunkaddr1.us.us, %14
  %sunkaddr3.us.us = inttoptr i64 %sunkaddr2.us.us to double*
  %.pre = load double, double* %sunkaddr3.us.us, align 8
  br i1 %lcmp.mod89, label %for.inc.us.us.prol.loopexit.unr-lcssa, label %for.inc.us.us.prol.preheader

for.inc.us.us.prol.preheader:                     ; preds = %for.body6.us.us
  br label %for.inc.us.us.prol

for.inc.us.us.prol:                               ; preds = %for.inc.us.us.prol.preheader
  %30 = load double, double* %arrayidx15.us.us.prol, align 8
  %arrayidx19.us.us.prol = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 0, i64 %indvars.iv53
  %31 = load double, double* %arrayidx19.us.us.prol, align 8
  %mul.us.us.prol = fmul double %30, %31
  %add.us.us.prol = fadd double %.pre, %mul.us.us.prol
  %sunkaddr82.prol = shl i64 %indvars.iv53, 3
  %sunkaddr83.prol = add i64 %sunkaddr.prol, %sunkaddr82.prol
  %sunkaddr84.prol = inttoptr i64 %sunkaddr83.prol to double*
  store double %add.us.us.prol, double* %sunkaddr84.prol, align 8
  br label %for.inc.us.us.prol.loopexit.unr-lcssa

for.inc.us.us.prol.loopexit.unr-lcssa:            ; preds = %for.body6.us.us, %for.inc.us.us.prol
  %.unr.ph = phi double [ %add.us.us.prol, %for.inc.us.us.prol ], [ %.pre, %for.body6.us.us ]
  %indvars.iv49.unr.ph = phi i64 [ 1, %for.inc.us.us.prol ], [ 0, %for.body6.us.us ]
  br label %for.inc.us.us.prol.loopexit

for.inc.us.us.prol.loopexit:                      ; preds = %for.inc.us.us.prol.loopexit.unr-lcssa
  br i1 %15, label %for.cond7.for.inc22_crit_edge.us.us, label %for.body6.us.us.new

for.body6.us.us.new:                              ; preds = %for.inc.us.us.prol.loopexit
  %sunkaddr82 = shl i64 %indvars.iv53, 3
  %sunkaddr83 = add i64 %sunkaddr, %sunkaddr82
  %sunkaddr84 = inttoptr i64 %sunkaddr83 to double*
  %sunkaddr82.1 = shl i64 %indvars.iv53, 3
  %sunkaddr83.1 = add i64 %sunkaddr.1, %sunkaddr82.1
  %sunkaddr84.1 = inttoptr i64 %sunkaddr83.1 to double*
  br label %for.inc.us.us

for.cond7.for.inc22_crit_edge.us.us.unr-lcssa:    ; preds = %for.inc.us.us
  br label %for.cond7.for.inc22_crit_edge.us.us

for.cond7.for.inc22_crit_edge.us.us:              ; preds = %for.inc.us.us.prol.loopexit, %for.cond7.for.inc22_crit_edge.us.us.unr-lcssa
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next54, %3
  br i1 %exitcond71, label %for.inc36.us.preheader, label %for.body6.us.us

for.inc36.us.preheader:                           ; preds = %for.cond7.for.inc22_crit_edge.us.us
  br i1 %min.iters.check, label %for.inc36.us.preheader86, label %min.iters.checked

for.inc36.us.preheader86:                         ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.inc36.us.preheader
  %indvars.iv55.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.inc36.us.preheader ], [ %n.vec, %middle.block ]
  %32 = sub nsw i64 %11, %indvars.iv55.ph
  %33 = sub nsw i64 %2, %indvars.iv55.ph
  %xtraiter93 = and i64 %32, 3
  %lcmp.mod94 = icmp eq i64 %xtraiter93, 0
  br i1 %lcmp.mod94, label %for.inc36.us.prol.loopexit, label %for.inc36.us.prol.preheader

for.inc36.us.prol.preheader:                      ; preds = %for.inc36.us.preheader86
  br label %for.inc36.us.prol

for.inc36.us.prol:                                ; preds = %for.inc36.us.prol, %for.inc36.us.prol.preheader
  %indvars.iv55.prol = phi i64 [ %indvars.iv.next56.prol, %for.inc36.us.prol ], [ %indvars.iv55.ph, %for.inc36.us.prol.preheader ]
  %prol.iter95 = phi i64 [ %prol.iter95.sub, %for.inc36.us.prol ], [ %xtraiter93, %for.inc36.us.prol.preheader ]
  %arrayidx29.us.prol = getelementptr inbounds double, double* %sum, i64 %indvars.iv55.prol
  %34 = bitcast double* %arrayidx29.us.prol to i64*
  %35 = load i64, i64* %34, align 8
  %arrayidx35.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv64, i64 %indvars.iv62, i64 %indvars.iv55.prol
  %36 = bitcast double* %arrayidx35.us.prol to i64*
  store i64 %35, i64* %36, align 8
  %indvars.iv.next56.prol = add nuw nsw i64 %indvars.iv55.prol, 1
  %prol.iter95.sub = add i64 %prol.iter95, -1
  %prol.iter95.cmp = icmp eq i64 %prol.iter95.sub, 0
  br i1 %prol.iter95.cmp, label %for.inc36.us.prol.loopexit.unr-lcssa, label %for.inc36.us.prol, !llvm.loop !6

for.inc36.us.prol.loopexit.unr-lcssa:             ; preds = %for.inc36.us.prol
  br label %for.inc36.us.prol.loopexit

for.inc36.us.prol.loopexit:                       ; preds = %for.inc36.us.preheader86, %for.inc36.us.prol.loopexit.unr-lcssa
  %indvars.iv55.unr = phi i64 [ %indvars.iv55.ph, %for.inc36.us.preheader86 ], [ %indvars.iv.next56.prol, %for.inc36.us.prol.loopexit.unr-lcssa ]
  %37 = icmp ult i64 %33, 3
  br i1 %37, label %for.inc39.us.loopexit, label %for.inc36.us.preheader86.new

for.inc36.us.preheader86.new:                     ; preds = %for.inc36.us.prol.loopexit
  br label %for.inc36.us

min.iters.checked:                                ; preds = %for.inc36.us.preheader
  br i1 %cmp.zero, label %for.inc36.us.preheader86, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep78
  %bound1 = icmp ugt double* %scevgep75, %sum
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.inc36.us.preheader86, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br i1 %lcmp.mod91, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter92 = phi i64 [ %prol.iter92.sub, %vector.body.prol ], [ %xtraiter90, %vector.body.prol.preheader ]
  %38 = getelementptr inbounds double, double* %sum, i64 %index.prol
  %39 = bitcast double* %38 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %39, align 8, !alias.scope !7
  %40 = getelementptr double, double* %38, i64 2
  %41 = bitcast double* %40 to <2 x i64>*
  %wide.load81.prol = load <2 x i64>, <2 x i64>* %41, align 8, !alias.scope !7
  %42 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv64, i64 %indvars.iv62, i64 %index.prol
  %43 = bitcast double* %42 to <2 x i64>*
  store <2 x i64> %wide.load.prol, <2 x i64>* %43, align 8, !alias.scope !10, !noalias !7
  %44 = getelementptr double, double* %42, i64 2
  %45 = bitcast double* %44 to <2 x i64>*
  store <2 x i64> %wide.load81.prol, <2 x i64>* %45, align 8, !alias.scope !10, !noalias !7
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter92.sub = add i64 %prol.iter92, -1
  %prol.iter92.cmp = icmp eq i64 %prol.iter92.sub, 0
  br i1 %prol.iter92.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !12

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  br i1 %16, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %46 = getelementptr inbounds double, double* %sum, i64 %index
  %47 = bitcast double* %46 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %47, align 8, !alias.scope !7
  %48 = getelementptr double, double* %46, i64 2
  %49 = bitcast double* %48 to <2 x i64>*
  %wide.load81 = load <2 x i64>, <2 x i64>* %49, align 8, !alias.scope !7
  %50 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv64, i64 %indvars.iv62, i64 %index
  %51 = bitcast double* %50 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %51, align 8, !alias.scope !10, !noalias !7
  %52 = getelementptr double, double* %50, i64 2
  %53 = bitcast double* %52 to <2 x i64>*
  store <2 x i64> %wide.load81, <2 x i64>* %53, align 8, !alias.scope !10, !noalias !7
  %index.next = add i64 %index, 4
  %54 = getelementptr inbounds double, double* %sum, i64 %index.next
  %55 = bitcast double* %54 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %55, align 8, !alias.scope !7
  %56 = getelementptr double, double* %54, i64 2
  %57 = bitcast double* %56 to <2 x i64>*
  %wide.load81.1 = load <2 x i64>, <2 x i64>* %57, align 8, !alias.scope !7
  %58 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv64, i64 %indvars.iv62, i64 %index.next
  %59 = bitcast double* %58 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %59, align 8, !alias.scope !10, !noalias !7
  %60 = getelementptr double, double* %58, i64 2
  %61 = bitcast double* %60 to <2 x i64>*
  store <2 x i64> %wide.load81.1, <2 x i64>* %61, align 8, !alias.scope !10, !noalias !7
  %index.next.1 = add i64 %index, 8
  %62 = getelementptr inbounds double, double* %sum, i64 %index.next.1
  %63 = bitcast double* %62 to <2 x i64>*
  %wide.load.2 = load <2 x i64>, <2 x i64>* %63, align 8, !alias.scope !7
  %64 = getelementptr double, double* %62, i64 2
  %65 = bitcast double* %64 to <2 x i64>*
  %wide.load81.2 = load <2 x i64>, <2 x i64>* %65, align 8, !alias.scope !7
  %66 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv64, i64 %indvars.iv62, i64 %index.next.1
  %67 = bitcast double* %66 to <2 x i64>*
  store <2 x i64> %wide.load.2, <2 x i64>* %67, align 8, !alias.scope !10, !noalias !7
  %68 = getelementptr double, double* %66, i64 2
  %69 = bitcast double* %68 to <2 x i64>*
  store <2 x i64> %wide.load81.2, <2 x i64>* %69, align 8, !alias.scope !10, !noalias !7
  %index.next.2 = add i64 %index, 12
  %70 = getelementptr inbounds double, double* %sum, i64 %index.next.2
  %71 = bitcast double* %70 to <2 x i64>*
  %wide.load.3 = load <2 x i64>, <2 x i64>* %71, align 8, !alias.scope !7
  %72 = getelementptr double, double* %70, i64 2
  %73 = bitcast double* %72 to <2 x i64>*
  %wide.load81.3 = load <2 x i64>, <2 x i64>* %73, align 8, !alias.scope !7
  %74 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv64, i64 %indvars.iv62, i64 %index.next.2
  %75 = bitcast double* %74 to <2 x i64>*
  store <2 x i64> %wide.load.3, <2 x i64>* %75, align 8, !alias.scope !10, !noalias !7
  %76 = getelementptr double, double* %74, i64 2
  %77 = bitcast double* %76 to <2 x i64>*
  store <2 x i64> %wide.load81.3, <2 x i64>* %77, align 8, !alias.scope !10, !noalias !7
  %index.next.3 = add i64 %index, 16
  %78 = icmp eq i64 %index.next.3, %n.vec
  br i1 %78, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !13

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  br i1 %cmp.n, label %for.inc39.us, label %for.inc36.us.preheader86

for.inc.us.us:                                    ; preds = %for.inc.us.us, %for.body6.us.us.new
  %79 = phi double [ %.unr.ph, %for.body6.us.us.new ], [ %add.us.us.1, %for.inc.us.us ]
  %indvars.iv49 = phi i64 [ %indvars.iv49.unr.ph, %for.body6.us.us.new ], [ %indvars.iv.next50.1, %for.inc.us.us ]
  %arrayidx15.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv64, i64 %indvars.iv62, i64 %indvars.iv49
  %80 = load double, double* %arrayidx15.us.us, align 8
  %arrayidx19.us.us = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv49, i64 %indvars.iv53
  %81 = load double, double* %arrayidx19.us.us, align 8
  %mul.us.us = fmul double %80, %81
  %add.us.us = fadd double %79, %mul.us.us
  store double %add.us.us, double* %sunkaddr84, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %arrayidx15.us.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv64, i64 %indvars.iv62, i64 %indvars.iv.next50
  %82 = load double, double* %arrayidx15.us.us.1, align 8
  %arrayidx19.us.us.1 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv.next50, i64 %indvars.iv53
  %83 = load double, double* %arrayidx19.us.us.1, align 8
  %mul.us.us.1 = fmul double %82, %83
  %add.us.us.1 = fadd double %add.us.us, %mul.us.us.1
  store double %add.us.us.1, double* %sunkaddr84.1, align 8
  %indvars.iv.next50.1 = add nsw i64 %indvars.iv49, 2
  %exitcond52.1 = icmp eq i64 %indvars.iv.next50, %2
  br i1 %exitcond52.1, label %for.cond7.for.inc22_crit_edge.us.us.unr-lcssa, label %for.inc.us.us

for.inc39:                                        ; preds = %for.inc39, %for.inc39.preheader.new
  %indvars.iv42 = phi i64 [ %indvars.iv42.unr, %for.inc39.preheader.new ], [ %indvars.iv.next43.7, %for.inc39 ]
  %indvars.iv.next43.7 = add nsw i64 %indvars.iv42, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next43.7, %1
  br i1 %exitcond.7, label %for.inc42.loopexit87.unr-lcssa, label %for.inc39

for.inc42.loopexit:                               ; preds = %for.inc39.us
  br label %for.inc42

for.inc42.loopexit87.unr-lcssa:                   ; preds = %for.inc39
  br label %for.inc42.loopexit87

for.inc42.loopexit87:                             ; preds = %for.inc39.prol.loopexit, %for.inc42.loopexit87.unr-lcssa
  br label %for.inc42

for.inc42:                                        ; preds = %for.inc42.loopexit87, %for.inc42.loopexit, %for.cond1.preheader
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond73 = icmp eq i64 %indvars.iv.next65, %4
  br i1 %exitcond73, label %for.end44.loopexit, label %for.cond1.preheader

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
  %arraydecay1 = bitcast i8* %call to [140 x [160 x double]]*
  %arraydecay32 = bitcast i8* %call2 to [160 x double]*
  tail call fastcc void @init_array([140 x [160 x double]]* %arraydecay1, [160 x double]* %arraydecay32)
  tail call void (...) @polybench_timer_start() #4
  %arraydecay63 = bitcast i8* %call1 to double*
  tail call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %arraydecay1, [160 x double]* %arraydecay32, double* %arraydecay63)
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

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
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
  %indvars.iv16 = phi i64 [ 0, %entry ], [ %indvars.iv.next17, %for.inc15 ]
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.inc12, %for.cond1.preheader
  %indvars.iv13 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next14, %for.inc12 ]
  %0 = mul nuw nsw i64 %indvars.iv13, %indvars.iv16
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.cond4.preheader
  %indvars.iv9 = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next10.1, %for.inc ]
  %1 = add nuw nsw i64 %indvars.iv9, %0
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 160
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 1.600000e+02
  %arrayidx11 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv16, i64 %indvars.iv13, i64 %indvars.iv9
  store double %div, double* %arrayidx11, align 8
  %indvars.iv.next10 = or i64 %indvars.iv9, 1
  %3 = add nuw nsw i64 %indvars.iv.next10, %0
  %4 = trunc i64 %3 to i32
  %rem.1 = srem i32 %4, 160
  %conv.1 = sitofp i32 %rem.1 to double
  %div.1 = fdiv double %conv.1, 1.600000e+02
  %arrayidx11.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv16, i64 %indvars.iv13, i64 %indvars.iv.next10
  store double %div.1, double* %arrayidx11.1, align 8
  %indvars.iv.next10.1 = add nsw i64 %indvars.iv9, 2
  %exitcond12.1 = icmp eq i64 %indvars.iv.next10, 159
  br i1 %exitcond12.1, label %for.inc12, label %for.inc

for.inc12:                                        ; preds = %for.inc
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next14, 140
  br i1 %exitcond2, label %for.inc15, label %for.cond4.preheader

for.inc15:                                        ; preds = %for.inc12
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next17, 150
  br i1 %exitcond3, label %for.cond22.preheader.preheader, label %for.cond1.preheader

for.cond22.preheader.preheader:                   ; preds = %for.inc15
  br label %for.cond22.preheader

for.cond22.preheader:                             ; preds = %for.cond22.preheader.preheader, %for.inc38
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %for.inc38 ], [ 0, %for.cond22.preheader.preheader ]
  br label %for.inc35

for.inc35:                                        ; preds = %for.inc35, %for.cond22.preheader
  %indvars.iv = phi i64 [ 0, %for.cond22.preheader ], [ %indvars.iv.next.1, %for.inc35 ]
  %5 = mul nuw nsw i64 %indvars.iv, %indvars.iv7
  %6 = trunc i64 %5 to i32
  %rem27 = srem i32 %6, 160
  %conv28 = sitofp i32 %rem27 to double
  %div30 = fdiv double %conv28, 1.600000e+02
  %arrayidx34 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv7, i64 %indvars.iv
  store double %div30, double* %arrayidx34, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %7 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv7
  %8 = trunc i64 %7 to i32
  %rem27.1 = srem i32 %8, 160
  %conv28.1 = sitofp i32 %rem27.1 to double
  %div30.1 = fdiv double %conv28.1, 1.600000e+02
  %arrayidx34.1 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv7, i64 %indvars.iv.next
  store double %div30.1, double* %arrayidx34.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 159
  br i1 %exitcond.1, label %for.inc38, label %for.inc35

for.inc38:                                        ; preds = %for.inc35
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next8, 160
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
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc21, %entry
  %indvars.iv8 = phi i64 [ 0, %entry ], [ %indvars.iv.next9, %for.inc21 ]
  %3 = mul nuw nsw i64 %indvars.iv8, 140
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.inc18, %for.cond2.preheader
  %indvars.iv6 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next7, %for.inc18 ]
  %mul81 = add nuw nsw i64 %indvars.iv6, %3
  %sext = mul nuw nsw i64 %mul81, 687194767360
  %4 = lshr exact i64 %sext, 32
  br label %for.body7

for.body7:                                        ; preds = %for.inc, %for.cond5.preheader
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader ], [ %indvars.iv.next, %for.inc ]
  %5 = add nuw nsw i64 %indvars.iv, %4
  %6 = trunc i64 %5 to i32
  %rem = srem i32 %6, 20
  %cmp11 = icmp eq i32 %rem, 0
  br i1 %cmp11, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body7
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #5
  br label %for.inc

for.inc:                                          ; preds = %for.body7, %if.then
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv8, i64 %indvars.iv6, i64 %indvars.iv
  %9 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond, label %for.inc18, label %for.body7

for.inc18:                                        ; preds = %for.inc
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next7, 140
  br i1 %exitcond1, label %for.inc21, label %for.cond5.preheader

for.inc21:                                        ; preds = %for.inc18
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next9, 150
  br i1 %exitcond2, label %for.end23, label %for.cond2.preheader

for.end23:                                        ; preds = %for.inc21
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %11) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #2

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
attributes #6 = { cold nounwind }

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
