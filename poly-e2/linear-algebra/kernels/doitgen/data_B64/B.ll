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
define void @kernel_doitgen(i32 %nr, i32 %nq, i32 %np, [140 x [160 x double]]* %A, [160 x double]* nocapture readonly %C4, double* %sum) local_unnamed_addr #0 {
entry:
  %cmp51 = icmp sgt i32 %nr, 0
  br i1 %cmp51, label %for.cond1.preheader.lr.ph, label %for.end44

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %0 = sext i32 %np to i64
  %1 = sext i32 %nq to i64
  %2 = sext i32 %nr to i64
  %xtraiter = and i32 %np, 1
  %wide.trip.count.1 = zext i32 %np to i64
  %scevgep88 = getelementptr double, double* %sum, i64 %0
  %3 = add nsw i64 %1, -1
  %4 = add nsw i64 %0, -4
  %5 = lshr i64 %4, 2
  %6 = add nuw nsw i64 %5, 1
  %7 = icmp sgt i32 %nq, 0
  %8 = icmp sgt i32 %np, 0
  %9 = icmp eq i32 %xtraiter, 0
  %10 = icmp eq i32 %np, 1
  %sunkaddr102 = ptrtoint double* %sum to i64
  %sunkaddr = ptrtoint double* %sum to i64
  %min.iters.check = icmp ult i32 %np, 4
  %n.vec = and i64 %0, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %xtraiter96 = and i64 %6, 3
  %lcmp.mod97 = icmp eq i64 %xtraiter96, 0
  %11 = icmp ult i64 %4, 12
  %cmp.n = icmp eq i64 %0, %n.vec
  %xtraiter94 = and i64 %1, 7
  %lcmp.mod95 = icmp eq i64 %xtraiter94, 0
  %12 = icmp ult i64 %3, 7
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc42, %for.cond1.preheader.lr.ph
  %indvars.iv81 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next82, %for.inc42 ]
  br i1 %7, label %for.cond4.preheader.lr.ph, label %for.inc42

for.cond4.preheader.lr.ph:                        ; preds = %for.cond1.preheader
  br i1 %8, label %for.body6.us.us.preheader.preheader, label %for.inc39.preheader

for.inc39.preheader:                              ; preds = %for.cond4.preheader.lr.ph
  br i1 %lcmp.mod95, label %for.inc39.prol.loopexit, label %for.inc39.prol.preheader

for.inc39.prol.preheader:                         ; preds = %for.inc39.preheader
  br label %for.inc39.prol

for.inc39.prol:                                   ; preds = %for.inc39.prol, %for.inc39.prol.preheader
  %indvars.iv65.prol = phi i64 [ %indvars.iv.next66.prol, %for.inc39.prol ], [ 0, %for.inc39.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %for.inc39.prol ], [ %xtraiter94, %for.inc39.prol.preheader ]
  %indvars.iv.next66.prol = add nuw nsw i64 %indvars.iv65.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %for.inc39.prol.loopexit.loopexit, label %for.inc39.prol, !llvm.loop !1

for.inc39.prol.loopexit.loopexit:                 ; preds = %for.inc39.prol
  br label %for.inc39.prol.loopexit

for.inc39.prol.loopexit:                          ; preds = %for.inc39.prol.loopexit.loopexit, %for.inc39.preheader
  %indvars.iv65.unr = phi i64 [ 0, %for.inc39.preheader ], [ %indvars.iv.next66.prol, %for.inc39.prol.loopexit.loopexit ]
  br i1 %12, label %for.inc42, label %for.inc39.preheader.new

for.inc39.preheader.new:                          ; preds = %for.inc39.prol.loopexit
  br label %for.inc39

for.body6.us.us.preheader.preheader:              ; preds = %for.cond4.preheader.lr.ph
  br label %for.body6.us.us.preheader

for.body6.us.us.preheader:                        ; preds = %for.body6.us.us.preheader.preheader, %for.inc39.us
  %indvars.iv79 = phi i64 [ %indvars.iv.next80, %for.inc39.us ], [ 0, %for.body6.us.us.preheader.preheader ]
  %scevgep = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv81, i64 %indvars.iv79, i64 0
  %scevgep85 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv81, i64 %indvars.iv79, i64 %0
  br label %for.body6.us.us

for.inc39.us.loopexit:                            ; preds = %for.body27.us
  br label %for.inc39.us

for.inc39.us:                                     ; preds = %for.inc39.us.loopexit, %middle.block
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv79, 1
  %cmp2.us = icmp slt i64 %indvars.iv.next80, %1
  br i1 %cmp2.us, label %for.body6.us.us.preheader, label %for.inc42.loopexit

for.body27.us:                                    ; preds = %for.body27.us.preheader92, %for.body27.us
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %for.body27.us ], [ %indvars.iv74.ph, %for.body27.us.preheader92 ]
  %arrayidx29.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv74
  %13 = bitcast double* %arrayidx29.us to i64*
  %14 = load i64, i64* %13, align 8
  %arrayidx35.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv81, i64 %indvars.iv79, i64 %indvars.iv74
  %15 = bitcast double* %arrayidx35.us to i64*
  store i64 %14, i64* %15, align 8
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %cmp26.us = icmp slt i64 %indvars.iv.next75, %0
  br i1 %cmp26.us, label %for.body27.us, label %for.inc39.us.loopexit, !llvm.loop !3

for.body6.us.us:                                  ; preds = %for.cond7.for.inc22_crit_edge.us.us, %for.body6.us.us.preheader
  %indvars.iv71 = phi i64 [ 0, %for.body6.us.us.preheader ], [ %indvars.iv.next72, %for.cond7.for.inc22_crit_edge.us.us ]
  %arrayidx.us.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv71
  store double 0.000000e+00, double* %arrayidx.us.us, align 8
  br i1 %9, label %for.body9.us.us.prol.loopexit.unr-lcssa, label %for.body9.us.us.prol.preheader

for.body9.us.us.prol.preheader:                   ; preds = %for.body6.us.us
  %16 = load double, double* %scevgep, align 8
  %arrayidx19.us.us.prol = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 0, i64 %indvars.iv71
  %17 = load double, double* %arrayidx19.us.us.prol, align 8
  %mul.us.us.prol = fmul double %16, %17
  %add.us.us.prol = fadd double %mul.us.us.prol, 0.000000e+00
  %sunkaddr99 = mul i64 %indvars.iv71, 8
  %sunkaddr100 = add i64 %sunkaddr, %sunkaddr99
  %sunkaddr101 = inttoptr i64 %sunkaddr100 to double*
  store double %add.us.us.prol, double* %sunkaddr101, align 8
  br label %for.body9.us.us.prol.loopexit.unr-lcssa

for.body9.us.us.prol.loopexit.unr-lcssa:          ; preds = %for.body6.us.us, %for.body9.us.us.prol.preheader
  %18 = phi double [ %add.us.us.prol, %for.body9.us.us.prol.preheader ], [ 0.000000e+00, %for.body6.us.us ]
  %indvars.iv69.unr.ph = phi i64 [ 1, %for.body9.us.us.prol.preheader ], [ 0, %for.body6.us.us ]
  br i1 %10, label %for.cond7.for.inc22_crit_edge.us.us, label %for.body9.us.us.preheader

for.body9.us.us.preheader:                        ; preds = %for.body9.us.us.prol.loopexit.unr-lcssa
  %sunkaddr103 = mul i64 %indvars.iv71, 8
  %sunkaddr104 = add i64 %sunkaddr102, %sunkaddr103
  %sunkaddr105 = inttoptr i64 %sunkaddr104 to double*
  br label %for.body9.us.us

for.cond7.for.inc22_crit_edge.us.us.loopexit:     ; preds = %for.body9.us.us
  br label %for.cond7.for.inc22_crit_edge.us.us

for.cond7.for.inc22_crit_edge.us.us:              ; preds = %for.cond7.for.inc22_crit_edge.us.us.loopexit, %for.body9.us.us.prol.loopexit.unr-lcssa
  %wide.trip.count73.pre-phi = phi i64 [ 1, %for.body9.us.us.prol.loopexit.unr-lcssa ], [ %wide.trip.count.1, %for.cond7.for.inc22_crit_edge.us.us.loopexit ]
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond = icmp eq i64 %indvars.iv.next72, %wide.trip.count73.pre-phi
  br i1 %exitcond, label %for.body27.us.preheader, label %for.body6.us.us

for.body27.us.preheader:                          ; preds = %for.cond7.for.inc22_crit_edge.us.us
  br i1 %min.iters.check, label %for.body27.us.preheader92, label %min.iters.checked

for.body27.us.preheader92:                        ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.body27.us.preheader
  %indvars.iv74.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.body27.us.preheader ], [ %n.vec, %middle.block ]
  br label %for.body27.us

min.iters.checked:                                ; preds = %for.body27.us.preheader
  br i1 %cmp.zero, label %for.body27.us.preheader92, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep88
  %bound1 = icmp ugt double* %scevgep85, %sum
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.body27.us.preheader92, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br i1 %lcmp.mod97, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter98 = phi i64 [ %prol.iter98.sub, %vector.body.prol ], [ %xtraiter96, %vector.body.prol.preheader ]
  %19 = getelementptr inbounds double, double* %sum, i64 %index.prol
  %20 = bitcast double* %19 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %20, align 8, !alias.scope !6
  %21 = getelementptr double, double* %19, i64 2
  %22 = bitcast double* %21 to <2 x i64>*
  %wide.load91.prol = load <2 x i64>, <2 x i64>* %22, align 8, !alias.scope !6
  %23 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv81, i64 %indvars.iv79, i64 %index.prol
  %24 = bitcast double* %23 to <2 x i64>*
  store <2 x i64> %wide.load.prol, <2 x i64>* %24, align 8, !alias.scope !9, !noalias !6
  %25 = getelementptr double, double* %23, i64 2
  %26 = bitcast double* %25 to <2 x i64>*
  store <2 x i64> %wide.load91.prol, <2 x i64>* %26, align 8, !alias.scope !9, !noalias !6
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter98.sub = add i64 %prol.iter98, -1
  %prol.iter98.cmp = icmp eq i64 %prol.iter98.sub, 0
  br i1 %prol.iter98.cmp, label %vector.body.prol.loopexit.loopexit, label %vector.body.prol, !llvm.loop !11

vector.body.prol.loopexit.loopexit:               ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.loopexit, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.loopexit ]
  br i1 %11, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %27 = getelementptr inbounds double, double* %sum, i64 %index
  %28 = bitcast double* %27 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %28, align 8, !alias.scope !6
  %29 = getelementptr double, double* %27, i64 2
  %30 = bitcast double* %29 to <2 x i64>*
  %wide.load91 = load <2 x i64>, <2 x i64>* %30, align 8, !alias.scope !6
  %31 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv81, i64 %indvars.iv79, i64 %index
  %32 = bitcast double* %31 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %32, align 8, !alias.scope !9, !noalias !6
  %33 = getelementptr double, double* %31, i64 2
  %34 = bitcast double* %33 to <2 x i64>*
  store <2 x i64> %wide.load91, <2 x i64>* %34, align 8, !alias.scope !9, !noalias !6
  %index.next = add i64 %index, 4
  %35 = getelementptr inbounds double, double* %sum, i64 %index.next
  %36 = bitcast double* %35 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %36, align 8, !alias.scope !6
  %37 = getelementptr double, double* %35, i64 2
  %38 = bitcast double* %37 to <2 x i64>*
  %wide.load91.1 = load <2 x i64>, <2 x i64>* %38, align 8, !alias.scope !6
  %39 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv81, i64 %indvars.iv79, i64 %index.next
  %40 = bitcast double* %39 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %40, align 8, !alias.scope !9, !noalias !6
  %41 = getelementptr double, double* %39, i64 2
  %42 = bitcast double* %41 to <2 x i64>*
  store <2 x i64> %wide.load91.1, <2 x i64>* %42, align 8, !alias.scope !9, !noalias !6
  %index.next.1 = add i64 %index, 8
  %43 = getelementptr inbounds double, double* %sum, i64 %index.next.1
  %44 = bitcast double* %43 to <2 x i64>*
  %wide.load.2 = load <2 x i64>, <2 x i64>* %44, align 8, !alias.scope !6
  %45 = getelementptr double, double* %43, i64 2
  %46 = bitcast double* %45 to <2 x i64>*
  %wide.load91.2 = load <2 x i64>, <2 x i64>* %46, align 8, !alias.scope !6
  %47 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv81, i64 %indvars.iv79, i64 %index.next.1
  %48 = bitcast double* %47 to <2 x i64>*
  store <2 x i64> %wide.load.2, <2 x i64>* %48, align 8, !alias.scope !9, !noalias !6
  %49 = getelementptr double, double* %47, i64 2
  %50 = bitcast double* %49 to <2 x i64>*
  store <2 x i64> %wide.load91.2, <2 x i64>* %50, align 8, !alias.scope !9, !noalias !6
  %index.next.2 = add i64 %index, 12
  %51 = getelementptr inbounds double, double* %sum, i64 %index.next.2
  %52 = bitcast double* %51 to <2 x i64>*
  %wide.load.3 = load <2 x i64>, <2 x i64>* %52, align 8, !alias.scope !6
  %53 = getelementptr double, double* %51, i64 2
  %54 = bitcast double* %53 to <2 x i64>*
  %wide.load91.3 = load <2 x i64>, <2 x i64>* %54, align 8, !alias.scope !6
  %55 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv81, i64 %indvars.iv79, i64 %index.next.2
  %56 = bitcast double* %55 to <2 x i64>*
  store <2 x i64> %wide.load.3, <2 x i64>* %56, align 8, !alias.scope !9, !noalias !6
  %57 = getelementptr double, double* %55, i64 2
  %58 = bitcast double* %57 to <2 x i64>*
  store <2 x i64> %wide.load91.3, <2 x i64>* %58, align 8, !alias.scope !9, !noalias !6
  %index.next.3 = add i64 %index, 16
  %59 = icmp eq i64 %index.next.3, %n.vec
  br i1 %59, label %middle.block.loopexit, label %vector.body, !llvm.loop !12

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.body.prol.loopexit
  br i1 %cmp.n, label %for.inc39.us, label %for.body27.us.preheader92

for.body9.us.us:                                  ; preds = %for.body9.us.us.preheader, %for.body9.us.us
  %60 = phi double [ %add.us.us.1, %for.body9.us.us ], [ %18, %for.body9.us.us.preheader ]
  %indvars.iv69 = phi i64 [ %indvars.iv.next70.1, %for.body9.us.us ], [ %indvars.iv69.unr.ph, %for.body9.us.us.preheader ]
  %arrayidx15.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv81, i64 %indvars.iv79, i64 %indvars.iv69
  %61 = load double, double* %arrayidx15.us.us, align 8
  %arrayidx19.us.us = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv69, i64 %indvars.iv71
  %62 = load double, double* %arrayidx19.us.us, align 8
  %mul.us.us = fmul double %61, %62
  %add.us.us = fadd double %mul.us.us, %60
  store double %add.us.us, double* %sunkaddr105, align 8
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %arrayidx15.us.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv81, i64 %indvars.iv79, i64 %indvars.iv.next70
  %63 = load double, double* %arrayidx15.us.us.1, align 8
  %arrayidx19.us.us.1 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv.next70, i64 %indvars.iv71
  %64 = load double, double* %arrayidx19.us.us.1, align 8
  %mul.us.us.1 = fmul double %63, %64
  %add.us.us.1 = fadd double %mul.us.us.1, %add.us.us
  store double %add.us.us.1, double* %sunkaddr105, align 8
  %indvars.iv.next70.1 = add nsw i64 %indvars.iv69, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next70.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.cond7.for.inc22_crit_edge.us.us.loopexit, label %for.body9.us.us

for.inc39:                                        ; preds = %for.inc39, %for.inc39.preheader.new
  %indvars.iv65 = phi i64 [ %indvars.iv65.unr, %for.inc39.preheader.new ], [ %indvars.iv.next66.7, %for.inc39 ]
  %indvars.iv.next66.7 = add nsw i64 %indvars.iv65, 8
  %cmp2.7 = icmp slt i64 %indvars.iv.next66.7, %1
  br i1 %cmp2.7, label %for.inc39, label %for.inc42.loopexit106

for.inc42.loopexit:                               ; preds = %for.inc39.us
  br label %for.inc42

for.inc42.loopexit106:                            ; preds = %for.inc39
  br label %for.inc42

for.inc42:                                        ; preds = %for.inc42.loopexit106, %for.inc42.loopexit, %for.inc39.prol.loopexit, %for.cond1.preheader
  %indvars.iv.next82 = add nsw i64 %indvars.iv81, 1
  %cmp = icmp slt i64 %indvars.iv.next82, %2
  br i1 %cmp, label %for.cond1.preheader, label %for.end44.loopexit

for.end44.loopexit:                               ; preds = %for.inc42
  br label %for.end44

for.end44:                                        ; preds = %for.end44.loopexit, %entry
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) local_unnamed_addr #1 {
entry:
  %call = call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %call1 = call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %call2 = call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %arraydecay = bitcast i8* %call to [140 x [160 x double]]*
  %arraydecay3 = bitcast i8* %call2 to [160 x double]*
  call fastcc void @init_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %arraydecay, [160 x double]* %arraydecay3)
  call void (...) @polybench_timer_start() #4
  %arraydecay6 = bitcast i8* %call1 to double*
  call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %arraydecay, [160 x double]* %arraydecay3, double* %arraydecay6)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %cmp = icmp sgt i32 %argc, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %0 = load i8*, i8** %argv, align 8
  %strcmpload = load i8, i8* %0, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %1 = bitcast i8* %call to [140 x [160 x double]]*
  call fastcc void @print_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  call void @free(i8* %call) #4
  call void @free(i8* %call1) #4
  call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %nr, i32 %nq, i32 %np, [140 x [160 x double]]* nocapture %A, [160 x double]* nocapture %C4) unnamed_addr #0 {
entry:
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.for.inc15_crit_edge.us, %entry
  %indvars.iv73 = phi i64 [ 0, %entry ], [ %indvars.iv.next74, %for.cond1.for.inc15_crit_edge.us ]
  br label %for.cond4.preheader.us.us

for.cond1.for.inc15_crit_edge.us:                 ; preds = %for.cond4.for.inc12_crit_edge.us.us
  %indvars.iv.next74 = add nsw i64 %indvars.iv73, 1
  %cmp.us = icmp slt i64 %indvars.iv.next74, 150
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.cond22.preheader.us.preheader

for.cond22.preheader.us.preheader:                ; preds = %for.cond1.for.inc15_crit_edge.us
  br label %for.cond22.preheader.us

for.cond4.preheader.us.us:                        ; preds = %for.cond1.preheader.us, %for.cond4.for.inc12_crit_edge.us.us
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %for.cond4.for.inc12_crit_edge.us.us ], [ 0, %for.cond1.preheader.us ]
  %0 = mul nsw i64 %indvars.iv68, %indvars.iv73
  br label %for.body6.us.us

for.cond4.for.inc12_crit_edge.us.us:              ; preds = %for.body6.us.us
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next69, 140
  br i1 %exitcond72, label %for.cond1.for.inc15_crit_edge.us, label %for.cond4.preheader.us.us

for.body6.us.us:                                  ; preds = %for.body6.us.us, %for.cond4.preheader.us.us
  %indvars.iv63 = phi i64 [ 0, %for.cond4.preheader.us.us ], [ %indvars.iv.next64.1, %for.body6.us.us ]
  %1 = add nuw nsw i64 %0, %indvars.iv63
  %2 = trunc i64 %1 to i32
  %rem.us.us = srem i32 %2, 160
  %conv.us.us = sitofp i32 %rem.us.us to double
  %arrayidx11.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv73, i64 %indvars.iv68, i64 %indvars.iv63
  %indvars.iv.next64 = or i64 %indvars.iv63, 1
  %3 = add nuw nsw i64 %0, %indvars.iv.next64
  %4 = trunc i64 %3 to i32
  %rem.us.us.1 = srem i32 %4, 160
  %conv.us.us.1 = sitofp i32 %rem.us.us.1 to double
  %div.us.us.v.i0.1 = insertelement <2 x double> undef, double %conv.us.us, i32 0
  %div.us.us.v.i0.2 = insertelement <2 x double> %div.us.us.v.i0.1, double %conv.us.us.1, i32 1
  %div.us.us = fdiv <2 x double> %div.us.us.v.i0.2, <double 1.600000e+02, double 1.600000e+02>
  %5 = bitcast double* %arrayidx11.us.us to <2 x double>*
  store <2 x double> %div.us.us, <2 x double>* %5, align 8
  %indvars.iv.next64.1 = add nsw i64 %indvars.iv63, 2
  %exitcond67.1 = icmp eq i64 %indvars.iv.next64.1, 160
  br i1 %exitcond67.1, label %for.cond4.for.inc12_crit_edge.us.us, label %for.body6.us.us

for.cond22.preheader.us:                          ; preds = %for.cond22.preheader.us.preheader, %for.cond22.for.inc38_crit_edge.us
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %for.cond22.for.inc38_crit_edge.us ], [ 0, %for.cond22.preheader.us.preheader ]
  br label %for.body25.us

for.body25.us:                                    ; preds = %for.body25.us, %for.cond22.preheader.us
  %indvars.iv = phi i64 [ 0, %for.cond22.preheader.us ], [ %indvars.iv.next.1, %for.body25.us ]
  %6 = mul nuw nsw i64 %indvars.iv60, %indvars.iv
  %7 = trunc i64 %6 to i32
  %rem27.us = srem i32 %7, 160
  %conv28.us = sitofp i32 %rem27.us to double
  %arrayidx34.us = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv60, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %8 = mul nuw nsw i64 %indvars.iv60, %indvars.iv.next
  %9 = trunc i64 %8 to i32
  %rem27.us.1 = srem i32 %9, 160
  %conv28.us.1 = sitofp i32 %rem27.us.1 to double
  %div30.us.v.i0.1 = insertelement <2 x double> undef, double %conv28.us, i32 0
  %div30.us.v.i0.2 = insertelement <2 x double> %div30.us.v.i0.1, double %conv28.us.1, i32 1
  %div30.us = fdiv <2 x double> %div30.us.v.i0.2, <double 1.600000e+02, double 1.600000e+02>
  %10 = bitcast double* %arrayidx34.us to <2 x double>*
  store <2 x double> %div30.us, <2 x double>* %10, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %for.cond22.for.inc38_crit_edge.us, label %for.body25.us

for.cond22.for.inc38_crit_edge.us:                ; preds = %for.body25.us
  %indvars.iv.next61 = add nsw i64 %indvars.iv60, 1
  %cmp19.us = icmp slt i64 %indvars.iv.next61, 160
  br i1 %cmp19.us, label %for.cond22.preheader.us, label %for.end40

for.end40:                                        ; preds = %for.cond22.for.inc38_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %nr, i32 %nq, i32 %np, [140 x [160 x double]]* nocapture readonly %A) unnamed_addr #1 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.for.inc21_crit_edge.us, %entry
  %indvars.iv56 = phi i64 [ 0, %entry ], [ %indvars.iv.next57, %for.cond2.for.inc21_crit_edge.us ]
  %3 = mul nsw i64 %indvars.iv56, 140
  br label %for.cond5.preheader.us.us

for.cond2.for.inc21_crit_edge.us:                 ; preds = %for.cond5.for.inc18_crit_edge.us.us
  %indvars.iv.next57 = add nsw i64 %indvars.iv56, 1
  %cmp.us = icmp slt i64 %indvars.iv.next57, 150
  br i1 %cmp.us, label %for.cond2.preheader.us, label %for.end23

for.cond5.preheader.us.us:                        ; preds = %for.cond5.for.inc18_crit_edge.us.us, %for.cond2.preheader.us
  %indvars.iv52 = phi i64 [ 0, %for.cond2.preheader.us ], [ %indvars.iv.next53, %for.cond5.for.inc18_crit_edge.us.us ]
  %mul83.us.us = add i64 %3, %indvars.iv52
  %add.us.us = mul i64 %mul83.us.us, 160
  br label %for.body7.us.us

for.cond5.for.inc18_crit_edge.us.us:              ; preds = %if.end.us.us
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, 140
  br i1 %exitcond55, label %for.cond2.for.inc21_crit_edge.us, label %for.cond5.preheader.us.us

for.body7.us.us:                                  ; preds = %if.end.us.us, %for.cond5.preheader.us.us
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader.us.us ], [ %indvars.iv.next, %if.end.us.us ]
  %4 = add i64 %add.us.us, %indvars.iv
  %5 = trunc i64 %4 to i32
  %rem.us.us = srem i32 %5, 20
  %cmp11.us.us = icmp eq i32 %rem.us.us, 0
  br i1 %cmp11.us.us, label %if.then.us.us, label %if.end.us.us

if.then.us.us:                                    ; preds = %for.body7.us.us
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = call i32 @fputc(i32 10, %struct._IO_FILE* %6) #5
  br label %if.end.us.us

if.end.us.us:                                     ; preds = %for.body7.us.us, %if.then.us.us
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv56, i64 %indvars.iv52, i64 %indvars.iv
  %8 = load double, double* %arrayidx16.us.us, align 8
  %call17.us.us = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %8) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond, label %for.cond5.for.inc18_crit_edge.us.us, label %for.body7.us.us

for.end23:                                        ; preds = %for.cond2.for.inc21_crit_edge.us
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %9, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %10) #5
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
!6 = !{!7}
!7 = distinct !{!7, !8}
!8 = distinct !{!8, !"LVerDomain"}
!9 = !{!10}
!10 = distinct !{!10, !8}
!11 = distinct !{!11, !2}
!12 = distinct !{!12, !4, !5}
