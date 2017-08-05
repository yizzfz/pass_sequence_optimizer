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
define void @kernel_doitgen(i32 %nr, i32 %nq, i32 %np, [140 x [160 x double]]* %A, [160 x double]* %C4, double* %sum) local_unnamed_addr #0 {
entry:
  %nr.addr = alloca i32, align 4
  %nq.addr = alloca i32, align 4
  %np.addr = alloca i32, align 4
  %A.addr = alloca [140 x [160 x double]]*, align 8
  %C4.addr = alloca [160 x double]*, align 8
  %sum.addr = alloca double*, align 8
  %r = alloca i32, align 4
  %p = alloca i32, align 4
  %s = alloca i32, align 4
  store i32 %nr, i32* %nr.addr, align 4
  store i32 %nq, i32* %nq.addr, align 4
  store i32 %np, i32* %np.addr, align 4
  store [140 x [160 x double]]* %A, [140 x [160 x double]]** %A.addr, align 8
  store [160 x double]* %C4, [160 x double]** %C4.addr, align 8
  store double* %sum, double** %sum.addr, align 8
  store i32 0, i32* %r, align 4
  %0 = load i32, i32* %nr.addr, align 4
  %cmp50 = icmp sgt i32 %0, 0
  br i1 %cmp50, label %for.cond1.preheader.lr.ph, label %for.end44

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %1 = load i32, i32* %nq.addr, align 4
  %2 = load i32, i32* %np.addr, align 4
  %wide.trip.count.1 = zext i32 %2 to i64
  %wide.trip.count71 = zext i32 %2 to i64
  %3 = load double*, double** %sum.addr, align 8
  %4 = bitcast double* %3 to i8*
  %5 = load [140 x [160 x double]]*, [140 x [160 x double]]** %A.addr, align 8
  %6 = load [160 x double]*, [160 x double]** %C4.addr, align 8
  %7 = load i32, i32* %nq.addr, align 4
  %8 = load i32, i32* %np.addr, align 4
  %9 = sext i32 %8 to i64
  %10 = load i32, i32* %nr.addr, align 4
  %r.promoted = load i32, i32* %r, align 4
  %p.promoted = load i32, i32* %p, align 4
  %s.promoted56 = load i32, i32* %s, align 4
  %11 = sext i32 %7 to i64
  %12 = add i32 %2, -1
  %13 = zext i32 %12 to i64
  %14 = shl nuw nsw i64 %13, 3
  %15 = add nuw nsw i64 %14, 8
  %16 = sext i32 %7 to i64
  %17 = sext i32 %r.promoted to i64
  %18 = sext i32 %10 to i64
  %19 = icmp sgt i32 %1, 0
  %20 = icmp sgt i32 %2, 0
  %21 = icmp sgt i32 %2, 0
  %22 = and i32 %2, 1
  %lcmp.mod = icmp eq i32 %22, 0
  %23 = icmp eq i32 %2, 1
  %sunkaddr83 = ptrtoint double* %3 to i64
  %sunkaddr = ptrtoint double* %3 to i64
  %24 = icmp sgt i32 %2, 0
  %25 = icmp sgt i32 %2, 0
  %26 = icmp sgt i64 %9, 1
  %smax = select i1 %26, i64 %9, i64 1
  %27 = icmp sgt i64 %9, 1
  %smax90 = select i1 %27, i64 %9, i64 1
  %scevgep93 = getelementptr double, double* %3, i64 %smax90
  %28 = icmp sgt i64 %9, 1
  %smax100 = select i1 %28, i64 %9, i64 1
  %29 = icmp sgt i64 %9, 1
  %smax109 = select i1 %29, i64 %9, i64 1
  %scevgep112 = getelementptr double, double* %3, i64 %smax109
  %30 = and i64 %smax, 9223372036854775804
  %31 = add nsw i64 %30, -4
  %32 = lshr exact i64 %31, 2
  %33 = add nuw nsw i64 %32, 1
  %min.iters.check = icmp ult i64 %smax, 4
  %n.vec = and i64 %smax, 9223372036854775804
  %cmp.zero = icmp eq i64 %n.vec, 0
  %xtraiter136 = and i64 %33, 3
  %lcmp.mod137 = icmp eq i64 %xtraiter136, 0
  %34 = icmp ult i64 %31, 12
  %cmp.n = icmp eq i64 %smax, %n.vec
  %min.iters.check101 = icmp ult i64 %smax100, 4
  %n.vec104 = and i64 %smax100, 9223372036854775804
  %cmp.zero105 = icmp eq i64 %n.vec104, 0
  %xtraiter = and i64 %33, 3
  %lcmp.mod135 = icmp eq i64 %xtraiter, 0
  %35 = icmp ult i64 %31, 12
  %cmp.n123 = icmp eq i64 %smax100, %n.vec104
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.lr.ph, %for.inc42
  %indvar = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvar.next, %for.inc42 ]
  %indvars.iv78 = phi i64 [ %17, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next79, %for.inc42 ]
  %inc.lcssa12.lcssa21.lcssa58 = phi i32 [ %s.promoted56, %for.cond1.preheader.lr.ph ], [ %inc.lcssa12.lcssa21.lcssa57, %for.inc42 ]
  %.lcssa19.lcssa54 = phi i32 [ %p.promoted, %for.cond1.preheader.lr.ph ], [ %.lcssa19.lcssa55, %for.inc42 ]
  %36 = add i64 %17, %indvar
  %37 = add i64 %17, %indvar
  br i1 %19, label %for.cond4.preheader.lr.ph, label %for.inc42

for.cond4.preheader.lr.ph:                        ; preds = %for.cond1.preheader
  br i1 %20, label %for.cond4.preheader.us.preheader, label %for.cond4.preheader.preheader

for.cond4.preheader.preheader:                    ; preds = %for.cond4.preheader.lr.ph
  br label %for.cond4.preheader

for.cond4.preheader.us.preheader:                 ; preds = %for.cond4.preheader.lr.ph
  br label %for.cond4.preheader.us

for.cond4.preheader.us:                           ; preds = %for.cond4.preheader.us.preheader, %for.inc39.us
  %indvars.iv76 = phi i64 [ %indvars.iv.next77, %for.inc39.us ], [ 0, %for.cond4.preheader.us.preheader ]
  %scevgep = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %37, i64 %indvars.iv76, i64 0
  %scevgep91 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %37, i64 %indvars.iv76, i64 %smax90
  br i1 %21, label %for.body6.us.us.preheader, label %for.cond4.for.cond25.preheader_crit_edge.us.loopexit59

for.body6.us.us.preheader:                        ; preds = %for.cond4.preheader.us
  %arrayidx15.us.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv78, i64 %indvars.iv76, i64 0
  br label %for.body6.us.us

for.inc39.us:                                     ; preds = %for.cond25.for.inc39_crit_edge.us, %for.cond4.for.cond25.preheader_crit_edge.us
  %.lcssa19.us = phi i32 [ %91, %for.cond25.for.inc39_crit_edge.us ], [ 0, %for.cond4.for.cond25.preheader_crit_edge.us ]
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %cmp2.us = icmp slt i64 %indvars.iv.next77, %16
  br i1 %cmp2.us, label %for.cond4.preheader.us, label %for.inc42.loopexit

for.body27.us:                                    ; preds = %for.body27.us.preheader130, %for.body27.us
  %indvars.iv14.us = phi i64 [ %indvars.iv.next.us, %for.body27.us ], [ %indvars.iv14.us.ph, %for.body27.us.preheader130 ]
  %arrayidx29.us = getelementptr inbounds double, double* %3, i64 %indvars.iv14.us
  %38 = bitcast double* %arrayidx29.us to i64*
  %39 = load i64, i64* %38, align 8
  %arrayidx35.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv78, i64 %indvars.iv76, i64 %indvars.iv14.us
  %40 = bitcast double* %arrayidx35.us to i64*
  store i64 %39, i64* %40, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv14.us, 1
  %cmp26.us = icmp slt i64 %indvars.iv.next.us, %9
  br i1 %cmp26.us, label %for.body27.us, label %for.cond25.for.inc39_crit_edge.us.loopexit, !llvm.loop !1

for.cond4.for.cond25.preheader_crit_edge.us.loopexit59: ; preds = %for.cond4.preheader.us
  call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 %15, i32 8, i1 false)
  br label %for.cond4.for.cond25.preheader_crit_edge.us

for.cond4.for.cond25.preheader_crit_edge.us.loopexit: ; preds = %for.cond7.for.inc22_crit_edge.us.us
  br label %for.cond4.for.cond25.preheader_crit_edge.us

for.cond4.for.cond25.preheader_crit_edge.us:      ; preds = %for.cond4.for.cond25.preheader_crit_edge.us.loopexit, %for.cond4.for.cond25.preheader_crit_edge.us.loopexit59
  %inc.lcssa12.lcssa.us = phi i32 [ 0, %for.cond4.for.cond25.preheader_crit_edge.us.loopexit59 ], [ %2, %for.cond4.for.cond25.preheader_crit_edge.us.loopexit ]
  br i1 %24, label %for.body27.us.preheader, label %for.inc39.us

for.body27.us.preheader:                          ; preds = %for.cond4.for.cond25.preheader_crit_edge.us
  br i1 %min.iters.check, label %for.body27.us.preheader130, label %min.iters.checked

for.body27.us.preheader130:                       ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.body27.us.preheader
  %indvars.iv14.us.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.body27.us.preheader ], [ %n.vec, %middle.block ]
  br label %for.body27.us

min.iters.checked:                                ; preds = %for.body27.us.preheader
  br i1 %cmp.zero, label %for.body27.us.preheader130, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep93
  %bound1 = icmp ult double* %3, %scevgep91
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.body27.us.preheader130, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br i1 %lcmp.mod137, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter138 = phi i64 [ %prol.iter138.sub, %vector.body.prol ], [ %xtraiter136, %vector.body.prol.preheader ]
  %41 = getelementptr inbounds double, double* %3, i64 %index.prol
  %42 = bitcast double* %41 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %42, align 8, !alias.scope !4
  %43 = getelementptr double, double* %41, i64 2
  %44 = bitcast double* %43 to <2 x i64>*
  %wide.load96.prol = load <2 x i64>, <2 x i64>* %44, align 8, !alias.scope !4
  %45 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv78, i64 %indvars.iv76, i64 %index.prol
  %46 = bitcast double* %45 to <2 x i64>*
  store <2 x i64> %wide.load.prol, <2 x i64>* %46, align 8, !alias.scope !7, !noalias !4
  %47 = getelementptr double, double* %45, i64 2
  %48 = bitcast double* %47 to <2 x i64>*
  store <2 x i64> %wide.load96.prol, <2 x i64>* %48, align 8, !alias.scope !7, !noalias !4
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter138.sub = add i64 %prol.iter138, -1
  %prol.iter138.cmp = icmp eq i64 %prol.iter138.sub, 0
  br i1 %prol.iter138.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !9

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  br i1 %34, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %49 = getelementptr inbounds double, double* %3, i64 %index
  %50 = bitcast double* %49 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %50, align 8, !alias.scope !4
  %51 = getelementptr double, double* %49, i64 2
  %52 = bitcast double* %51 to <2 x i64>*
  %wide.load96 = load <2 x i64>, <2 x i64>* %52, align 8, !alias.scope !4
  %53 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv78, i64 %indvars.iv76, i64 %index
  %54 = bitcast double* %53 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %54, align 8, !alias.scope !7, !noalias !4
  %55 = getelementptr double, double* %53, i64 2
  %56 = bitcast double* %55 to <2 x i64>*
  store <2 x i64> %wide.load96, <2 x i64>* %56, align 8, !alias.scope !7, !noalias !4
  %index.next = add i64 %index, 4
  %57 = getelementptr inbounds double, double* %3, i64 %index.next
  %58 = bitcast double* %57 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %58, align 8, !alias.scope !4
  %59 = getelementptr double, double* %57, i64 2
  %60 = bitcast double* %59 to <2 x i64>*
  %wide.load96.1 = load <2 x i64>, <2 x i64>* %60, align 8, !alias.scope !4
  %61 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv78, i64 %indvars.iv76, i64 %index.next
  %62 = bitcast double* %61 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %62, align 8, !alias.scope !7, !noalias !4
  %63 = getelementptr double, double* %61, i64 2
  %64 = bitcast double* %63 to <2 x i64>*
  store <2 x i64> %wide.load96.1, <2 x i64>* %64, align 8, !alias.scope !7, !noalias !4
  %index.next.1 = add i64 %index, 8
  %65 = getelementptr inbounds double, double* %3, i64 %index.next.1
  %66 = bitcast double* %65 to <2 x i64>*
  %wide.load.2 = load <2 x i64>, <2 x i64>* %66, align 8, !alias.scope !4
  %67 = getelementptr double, double* %65, i64 2
  %68 = bitcast double* %67 to <2 x i64>*
  %wide.load96.2 = load <2 x i64>, <2 x i64>* %68, align 8, !alias.scope !4
  %69 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv78, i64 %indvars.iv76, i64 %index.next.1
  %70 = bitcast double* %69 to <2 x i64>*
  store <2 x i64> %wide.load.2, <2 x i64>* %70, align 8, !alias.scope !7, !noalias !4
  %71 = getelementptr double, double* %69, i64 2
  %72 = bitcast double* %71 to <2 x i64>*
  store <2 x i64> %wide.load96.2, <2 x i64>* %72, align 8, !alias.scope !7, !noalias !4
  %index.next.2 = add i64 %index, 12
  %73 = getelementptr inbounds double, double* %3, i64 %index.next.2
  %74 = bitcast double* %73 to <2 x i64>*
  %wide.load.3 = load <2 x i64>, <2 x i64>* %74, align 8, !alias.scope !4
  %75 = getelementptr double, double* %73, i64 2
  %76 = bitcast double* %75 to <2 x i64>*
  %wide.load96.3 = load <2 x i64>, <2 x i64>* %76, align 8, !alias.scope !4
  %77 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv78, i64 %indvars.iv76, i64 %index.next.2
  %78 = bitcast double* %77 to <2 x i64>*
  store <2 x i64> %wide.load.3, <2 x i64>* %78, align 8, !alias.scope !7, !noalias !4
  %79 = getelementptr double, double* %77, i64 2
  %80 = bitcast double* %79 to <2 x i64>*
  store <2 x i64> %wide.load96.3, <2 x i64>* %80, align 8, !alias.scope !7, !noalias !4
  %index.next.3 = add i64 %index, 16
  %81 = icmp eq i64 %index.next.3, %n.vec
  br i1 %81, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !11

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  br i1 %cmp.n, label %for.cond25.for.inc39_crit_edge.us, label %for.body27.us.preheader130

for.body6.us.us:                                  ; preds = %for.body6.us.us.preheader, %for.cond7.for.inc22_crit_edge.us.us
  %indvars.iv69 = phi i64 [ %indvars.iv.next70, %for.cond7.for.inc22_crit_edge.us.us ], [ 0, %for.body6.us.us.preheader ]
  %arrayidx.us.us = getelementptr inbounds double, double* %3, i64 %indvars.iv69
  store double 0.000000e+00, double* %arrayidx.us.us, align 8
  br i1 %lcmp.mod, label %for.body9.us.us.prol.loopexit, label %for.body9.us.us.prol

for.body9.us.us.prol:                             ; preds = %for.body6.us.us
  %82 = load double, double* %arrayidx15.us.us.prol, align 8
  %arrayidx19.us.us.prol = getelementptr inbounds [160 x double], [160 x double]* %6, i64 0, i64 %indvars.iv69
  %83 = load double, double* %arrayidx19.us.us.prol, align 8
  %mul.us.us.prol = fmul double %82, %83
  %sunkaddr80 = shl i64 %indvars.iv69, 3
  %sunkaddr81 = add i64 %sunkaddr, %sunkaddr80
  %sunkaddr82 = inttoptr i64 %sunkaddr81 to double*
  %84 = load double, double* %sunkaddr82, align 8
  %add.us.us.prol = fadd double %mul.us.us.prol, %84
  store double %add.us.us.prol, double* %sunkaddr82, align 8
  br label %for.body9.us.us.prol.loopexit

for.body9.us.us.prol.loopexit:                    ; preds = %for.body9.us.us.prol, %for.body6.us.us
  %indvars.iv67.unr.ph = phi i64 [ 1, %for.body9.us.us.prol ], [ 0, %for.body6.us.us ]
  br i1 %23, label %for.cond7.for.inc22_crit_edge.us.us, label %for.body9.us.us.preheader

for.body9.us.us.preheader:                        ; preds = %for.body9.us.us.prol.loopexit
  %sunkaddr84 = shl i64 %indvars.iv69, 3
  %sunkaddr85 = add i64 %sunkaddr83, %sunkaddr84
  %sunkaddr86 = inttoptr i64 %sunkaddr85 to double*
  br label %for.body9.us.us

for.cond7.for.inc22_crit_edge.us.us.loopexit:     ; preds = %for.body9.us.us
  br label %for.cond7.for.inc22_crit_edge.us.us

for.cond7.for.inc22_crit_edge.us.us:              ; preds = %for.cond7.for.inc22_crit_edge.us.us.loopexit, %for.body9.us.us.prol.loopexit
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next70, %wide.trip.count71
  br i1 %exitcond72, label %for.cond4.for.cond25.preheader_crit_edge.us.loopexit, label %for.body6.us.us

for.body9.us.us:                                  ; preds = %for.body9.us.us.preheader, %for.body9.us.us
  %indvars.iv67 = phi i64 [ %indvars.iv.next68.1, %for.body9.us.us ], [ %indvars.iv67.unr.ph, %for.body9.us.us.preheader ]
  %arrayidx15.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv78, i64 %indvars.iv76, i64 %indvars.iv67
  %85 = load double, double* %arrayidx15.us.us, align 8
  %arrayidx19.us.us = getelementptr inbounds [160 x double], [160 x double]* %6, i64 %indvars.iv67, i64 %indvars.iv69
  %86 = load double, double* %arrayidx19.us.us, align 8
  %mul.us.us = fmul double %85, %86
  %87 = load double, double* %sunkaddr86, align 8
  %add.us.us = fadd double %mul.us.us, %87
  store double %add.us.us, double* %sunkaddr86, align 8
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %arrayidx15.us.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv78, i64 %indvars.iv76, i64 %indvars.iv.next68
  %88 = load double, double* %arrayidx15.us.us.1, align 8
  %arrayidx19.us.us.1 = getelementptr inbounds [160 x double], [160 x double]* %6, i64 %indvars.iv.next68, i64 %indvars.iv69
  %89 = load double, double* %arrayidx19.us.us.1, align 8
  %mul.us.us.1 = fmul double %88, %89
  %90 = load double, double* %sunkaddr86, align 8
  %add.us.us.1 = fadd double %mul.us.us.1, %90
  store double %add.us.us.1, double* %sunkaddr86, align 8
  %indvars.iv.next68.1 = add nsw i64 %indvars.iv67, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next68.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.cond7.for.inc22_crit_edge.us.us.loopexit, label %for.body9.us.us

for.cond25.for.inc39_crit_edge.us.loopexit:       ; preds = %for.body27.us
  br label %for.cond25.for.inc39_crit_edge.us

for.cond25.for.inc39_crit_edge.us:                ; preds = %for.cond25.for.inc39_crit_edge.us.loopexit, %middle.block
  %indvars.iv.next.us.lcssa = phi i64 [ %n.vec, %middle.block ], [ %indvars.iv.next.us, %for.cond25.for.inc39_crit_edge.us.loopexit ]
  %91 = trunc i64 %indvars.iv.next.us.lcssa to i32
  br label %for.inc39.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc39
  %indvars.iv = phi i64 [ %indvars.iv.next64, %for.inc39 ], [ 0, %for.cond4.preheader.preheader ]
  %scevgep107 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %36, i64 %indvars.iv, i64 0
  %scevgep110 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %36, i64 %indvars.iv, i64 %smax109
  br i1 %25, label %for.body27.preheader, label %for.inc39

for.body27.preheader:                             ; preds = %for.cond4.preheader
  br i1 %min.iters.check101, label %for.body27.preheader131, label %min.iters.checked102

min.iters.checked102:                             ; preds = %for.body27.preheader
  br i1 %cmp.zero105, label %for.body27.preheader131, label %vector.memcheck118

vector.memcheck118:                               ; preds = %min.iters.checked102
  %bound0114 = icmp ult double* %scevgep107, %scevgep112
  %bound1115 = icmp ult double* %3, %scevgep110
  %memcheck.conflict117 = and i1 %bound0114, %bound1115
  br i1 %memcheck.conflict117, label %for.body27.preheader131, label %vector.body97.preheader

vector.body97.preheader:                          ; preds = %vector.memcheck118
  br i1 %lcmp.mod135, label %vector.body97.prol.loopexit, label %vector.body97.prol.preheader

vector.body97.prol.preheader:                     ; preds = %vector.body97.preheader
  br label %vector.body97.prol

vector.body97.prol:                               ; preds = %vector.body97.prol, %vector.body97.prol.preheader
  %index120.prol = phi i64 [ %index.next121.prol, %vector.body97.prol ], [ 0, %vector.body97.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body97.prol ], [ %xtraiter, %vector.body97.prol.preheader ]
  %92 = getelementptr inbounds double, double* %3, i64 %index120.prol
  %93 = bitcast double* %92 to <2 x i64>*
  %wide.load128.prol = load <2 x i64>, <2 x i64>* %93, align 8, !alias.scope !12
  %94 = getelementptr double, double* %92, i64 2
  %95 = bitcast double* %94 to <2 x i64>*
  %wide.load129.prol = load <2 x i64>, <2 x i64>* %95, align 8, !alias.scope !12
  %96 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv78, i64 %indvars.iv, i64 %index120.prol
  %97 = bitcast double* %96 to <2 x i64>*
  store <2 x i64> %wide.load128.prol, <2 x i64>* %97, align 8, !alias.scope !15, !noalias !12
  %98 = getelementptr double, double* %96, i64 2
  %99 = bitcast double* %98 to <2 x i64>*
  store <2 x i64> %wide.load129.prol, <2 x i64>* %99, align 8, !alias.scope !15, !noalias !12
  %index.next121.prol = add i64 %index120.prol, 4
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body97.prol.loopexit.unr-lcssa, label %vector.body97.prol, !llvm.loop !17

vector.body97.prol.loopexit.unr-lcssa:            ; preds = %vector.body97.prol
  br label %vector.body97.prol.loopexit

vector.body97.prol.loopexit:                      ; preds = %vector.body97.preheader, %vector.body97.prol.loopexit.unr-lcssa
  %index120.unr = phi i64 [ 0, %vector.body97.preheader ], [ %index.next121.prol, %vector.body97.prol.loopexit.unr-lcssa ]
  br i1 %35, label %middle.block98, label %vector.body97.preheader.new

vector.body97.preheader.new:                      ; preds = %vector.body97.prol.loopexit
  br label %vector.body97

vector.body97:                                    ; preds = %vector.body97, %vector.body97.preheader.new
  %index120 = phi i64 [ %index120.unr, %vector.body97.preheader.new ], [ %index.next121.3, %vector.body97 ]
  %100 = getelementptr inbounds double, double* %3, i64 %index120
  %101 = bitcast double* %100 to <2 x i64>*
  %wide.load128 = load <2 x i64>, <2 x i64>* %101, align 8, !alias.scope !12
  %102 = getelementptr double, double* %100, i64 2
  %103 = bitcast double* %102 to <2 x i64>*
  %wide.load129 = load <2 x i64>, <2 x i64>* %103, align 8, !alias.scope !12
  %104 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv78, i64 %indvars.iv, i64 %index120
  %105 = bitcast double* %104 to <2 x i64>*
  store <2 x i64> %wide.load128, <2 x i64>* %105, align 8, !alias.scope !15, !noalias !12
  %106 = getelementptr double, double* %104, i64 2
  %107 = bitcast double* %106 to <2 x i64>*
  store <2 x i64> %wide.load129, <2 x i64>* %107, align 8, !alias.scope !15, !noalias !12
  %index.next121 = add i64 %index120, 4
  %108 = getelementptr inbounds double, double* %3, i64 %index.next121
  %109 = bitcast double* %108 to <2 x i64>*
  %wide.load128.1 = load <2 x i64>, <2 x i64>* %109, align 8, !alias.scope !12
  %110 = getelementptr double, double* %108, i64 2
  %111 = bitcast double* %110 to <2 x i64>*
  %wide.load129.1 = load <2 x i64>, <2 x i64>* %111, align 8, !alias.scope !12
  %112 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv78, i64 %indvars.iv, i64 %index.next121
  %113 = bitcast double* %112 to <2 x i64>*
  store <2 x i64> %wide.load128.1, <2 x i64>* %113, align 8, !alias.scope !15, !noalias !12
  %114 = getelementptr double, double* %112, i64 2
  %115 = bitcast double* %114 to <2 x i64>*
  store <2 x i64> %wide.load129.1, <2 x i64>* %115, align 8, !alias.scope !15, !noalias !12
  %index.next121.1 = add i64 %index120, 8
  %116 = getelementptr inbounds double, double* %3, i64 %index.next121.1
  %117 = bitcast double* %116 to <2 x i64>*
  %wide.load128.2 = load <2 x i64>, <2 x i64>* %117, align 8, !alias.scope !12
  %118 = getelementptr double, double* %116, i64 2
  %119 = bitcast double* %118 to <2 x i64>*
  %wide.load129.2 = load <2 x i64>, <2 x i64>* %119, align 8, !alias.scope !12
  %120 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv78, i64 %indvars.iv, i64 %index.next121.1
  %121 = bitcast double* %120 to <2 x i64>*
  store <2 x i64> %wide.load128.2, <2 x i64>* %121, align 8, !alias.scope !15, !noalias !12
  %122 = getelementptr double, double* %120, i64 2
  %123 = bitcast double* %122 to <2 x i64>*
  store <2 x i64> %wide.load129.2, <2 x i64>* %123, align 8, !alias.scope !15, !noalias !12
  %index.next121.2 = add i64 %index120, 12
  %124 = getelementptr inbounds double, double* %3, i64 %index.next121.2
  %125 = bitcast double* %124 to <2 x i64>*
  %wide.load128.3 = load <2 x i64>, <2 x i64>* %125, align 8, !alias.scope !12
  %126 = getelementptr double, double* %124, i64 2
  %127 = bitcast double* %126 to <2 x i64>*
  %wide.load129.3 = load <2 x i64>, <2 x i64>* %127, align 8, !alias.scope !12
  %128 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv78, i64 %indvars.iv, i64 %index.next121.2
  %129 = bitcast double* %128 to <2 x i64>*
  store <2 x i64> %wide.load128.3, <2 x i64>* %129, align 8, !alias.scope !15, !noalias !12
  %130 = getelementptr double, double* %128, i64 2
  %131 = bitcast double* %130 to <2 x i64>*
  store <2 x i64> %wide.load129.3, <2 x i64>* %131, align 8, !alias.scope !15, !noalias !12
  %index.next121.3 = add i64 %index120, 16
  %132 = icmp eq i64 %index.next121.3, %n.vec104
  br i1 %132, label %middle.block98.unr-lcssa, label %vector.body97, !llvm.loop !18

middle.block98.unr-lcssa:                         ; preds = %vector.body97
  br label %middle.block98

middle.block98:                                   ; preds = %vector.body97.prol.loopexit, %middle.block98.unr-lcssa
  br i1 %cmp.n123, label %for.inc39.loopexit, label %for.body27.preheader131

for.body27.preheader131:                          ; preds = %middle.block98, %vector.memcheck118, %min.iters.checked102, %for.body27.preheader
  %indvars.iv14.ph = phi i64 [ 0, %vector.memcheck118 ], [ 0, %min.iters.checked102 ], [ 0, %for.body27.preheader ], [ %n.vec104, %middle.block98 ]
  br label %for.body27

for.body27:                                       ; preds = %for.body27.preheader131, %for.body27
  %indvars.iv14 = phi i64 [ %indvars.iv.next, %for.body27 ], [ %indvars.iv14.ph, %for.body27.preheader131 ]
  %arrayidx29 = getelementptr inbounds double, double* %3, i64 %indvars.iv14
  %133 = bitcast double* %arrayidx29 to i64*
  %134 = load i64, i64* %133, align 8
  %arrayidx35 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv78, i64 %indvars.iv, i64 %indvars.iv14
  %135 = bitcast double* %arrayidx35 to i64*
  store i64 %134, i64* %135, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv14, 1
  %cmp26 = icmp slt i64 %indvars.iv.next, %9
  br i1 %cmp26, label %for.body27, label %for.inc39.loopexit.loopexit, !llvm.loop !19

for.inc39.loopexit.loopexit:                      ; preds = %for.body27
  br label %for.inc39.loopexit

for.inc39.loopexit:                               ; preds = %for.inc39.loopexit.loopexit, %middle.block98
  %indvars.iv.next.lcssa = phi i64 [ %n.vec104, %middle.block98 ], [ %indvars.iv.next, %for.inc39.loopexit.loopexit ]
  %136 = trunc i64 %indvars.iv.next.lcssa to i32
  br label %for.inc39

for.inc39:                                        ; preds = %for.inc39.loopexit, %for.cond4.preheader
  %.lcssa19 = phi i32 [ 0, %for.cond4.preheader ], [ %136, %for.inc39.loopexit ]
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv, 1
  %cmp2 = icmp slt i64 %indvars.iv.next64, %11
  br i1 %cmp2, label %for.cond4.preheader, label %for.inc42.loopexit132

for.inc42.loopexit:                               ; preds = %for.inc39.us
  br label %for.inc42

for.inc42.loopexit132:                            ; preds = %for.inc39
  br label %for.inc42

for.inc42:                                        ; preds = %for.inc42.loopexit132, %for.inc42.loopexit, %for.cond1.preheader
  %inc.lcssa12.lcssa21.lcssa57 = phi i32 [ %inc.lcssa12.lcssa21.lcssa58, %for.cond1.preheader ], [ %inc.lcssa12.lcssa.us, %for.inc42.loopexit ], [ %inc.lcssa12.lcssa21.lcssa58, %for.inc42.loopexit132 ]
  %.lcssa19.lcssa55 = phi i32 [ %.lcssa19.lcssa54, %for.cond1.preheader ], [ %.lcssa19.us, %for.inc42.loopexit ], [ %.lcssa19, %for.inc42.loopexit132 ]
  %indvars.iv.next79 = add nsw i64 %indvars.iv78, 1
  %cmp = icmp slt i64 %indvars.iv.next79, %18
  %indvar.next = add i64 %indvar, 1
  br i1 %cmp, label %for.cond1.preheader, label %for.cond.for.end44_crit_edge

for.cond.for.end44_crit_edge:                     ; preds = %for.inc42
  %137 = trunc i64 %indvars.iv.next79 to i32
  store i32 %137, i32* %r, align 4
  store i32 %.lcssa19.lcssa55, i32* %p, align 4
  store i32 %inc.lcssa12.lcssa21.lcssa57, i32* %s, align 4
  br label %for.end44

for.end44:                                        ; preds = %for.cond.for.end44_crit_edge, %entry
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #1 {
entry:
  %argc.addr = alloca i32, align 4
  %argv.addr = alloca i8**, align 8
  %nr = alloca i32, align 4
  %nq = alloca i32, align 4
  %np = alloca i32, align 4
  %A = alloca [150 x [140 x [160 x double]]]*, align 8
  %sum = alloca [160 x double]*, align 8
  %C4 = alloca [160 x [160 x double]]*, align 8
  store i32 %argc, i32* %argc.addr, align 4
  store i8** %argv, i8*** %argv.addr, align 8
  store i32 150, i32* %nr, align 4
  store i32 140, i32* %nq, align 4
  store i32 160, i32* %np, align 4
  %call = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %0 = bitcast [150 x [140 x [160 x double]]]** %A to i8**
  store i8* %call, i8** %0, align 8
  %call1 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %1 = bitcast [160 x double]** %sum to i8**
  store i8* %call1, i8** %1, align 8
  %call2 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %2 = bitcast [160 x [160 x double]]** %C4 to i8**
  store i8* %call2, i8** %2, align 8
  %3 = load i32, i32* %nr, align 4
  %4 = load i32, i32* %nq, align 4
  %5 = load i32, i32* %np, align 4
  %6 = bitcast [150 x [140 x [160 x double]]]** %A to [140 x [160 x double]]**
  %7 = load [140 x [160 x double]]*, [140 x [160 x double]]** %6, align 8
  %arraydecay3 = bitcast i8* %call2 to [160 x double]*
  tail call fastcc void @init_array(i32 %3, i32 %4, i32 %5, [140 x [160 x double]]* %7, [160 x double]* %arraydecay3)
  tail call void (...) @polybench_timer_start() #4
  %8 = load i32, i32* %nr, align 4
  %9 = load i32, i32* %nq, align 4
  %10 = load i32, i32* %np, align 4
  %11 = bitcast [150 x [140 x [160 x double]]]** %A to [140 x [160 x double]]**
  %12 = load [140 x [160 x double]]*, [140 x [160 x double]]** %11, align 8
  %13 = bitcast [160 x [160 x double]]** %C4 to [160 x double]**
  %14 = load [160 x double]*, [160 x double]** %13, align 8
  %15 = bitcast [160 x double]** %sum to double**
  %16 = load double*, double** %15, align 8
  tail call void @kernel_doitgen(i32 %8, i32 %9, i32 %10, [140 x [160 x double]]* %12, [160 x double]* %14, double* %16)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %17 = load i32, i32* %argc.addr, align 4
  %cmp = icmp sgt i32 %17, 42
  br i1 %cmp, label %land.lhs.true, label %if.end

land.lhs.true:                                    ; preds = %entry
  %18 = load i8**, i8*** %argv.addr, align 8
  %19 = load i8*, i8** %18, align 8
  %strcmpload = load i8, i8* %19, align 1
  %tobool = icmp eq i8 %strcmpload, 0
  br i1 %tobool, label %if.then, label %if.end

if.then:                                          ; preds = %land.lhs.true
  %20 = load i32, i32* %nr, align 4
  %21 = load i32, i32* %nq, align 4
  %22 = load i32, i32* %np, align 4
  %23 = bitcast [150 x [140 x [160 x double]]]** %A to [140 x [160 x double]]**
  %24 = load [140 x [160 x double]]*, [140 x [160 x double]]** %23, align 8
  tail call fastcc void @print_array(i32 %20, i32 %21, i32 %22, [140 x [160 x double]]* %24)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %if.then, %entry
  %25 = bitcast [160 x [160 x double]]** %C4 to i8**
  %26 = bitcast [160 x double]** %sum to i8**
  %27 = bitcast [150 x [140 x [160 x double]]]** %A to i8**
  %28 = load i8*, i8** %27, align 8
  tail call void @free(i8* %28) #4
  %29 = load i8*, i8** %26, align 8
  tail call void @free(i8* %29) #4
  %30 = load i8*, i8** %25, align 8
  tail call void @free(i8* %30) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32 %nr, i32 %nq, i32 %np, [140 x [160 x double]]* %A, [160 x double]* %C4) unnamed_addr #0 {
entry:
  %nr.addr = alloca i32, align 4
  %nq.addr = alloca i32, align 4
  %np.addr = alloca i32, align 4
  %A.addr = alloca [140 x [160 x double]]*, align 8
  %C4.addr = alloca [160 x double]*, align 8
  %i = alloca i32, align 4
  store i32 %nr, i32* %nr.addr, align 4
  store i32 %nq, i32* %nq.addr, align 4
  store i32 %np, i32* %np.addr, align 4
  store [140 x [160 x double]]* %A, [140 x [160 x double]]** %A.addr, align 8
  store [160 x double]* %C4, [160 x double]** %C4.addr, align 8
  store i32 0, i32* %i, align 4
  %cmp16 = icmp sgt i32 %nr, 0
  br i1 %cmp16, label %for.cond1.preheader.lr.ph, label %for.cond18.preheader

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %0 = load i32, i32* %nq.addr, align 4
  %wide.trip.count = zext i32 %0 to i64
  %cmp214 = icmp sgt i32 %0, 0
  %1 = load i32, i32* %np.addr, align 4
  %2 = load [140 x [160 x double]]*, [140 x [160 x double]]** %A.addr, align 8
  %3 = sext i32 %1 to i64
  %4 = load i32, i32* %nr.addr, align 4
  %5 = sext i32 %4 to i64
  %i.promoted17 = load i32, i32* %i, align 4
  br i1 %cmp214, label %for.cond1.preheader.us.preheader, label %for.cond.for.cond18.preheader_crit_edge.loopexit45

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %6 = sext i32 %i.promoted17 to i64
  %7 = icmp sgt i32 %1, 0
  %conv7.us.us = sitofp i32 %1 to double
  %xtraiter58 = and i64 %3, 1
  %lcmp.mod59 = icmp eq i64 %xtraiter58, 0
  %8 = icmp eq i32 %1, 1
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc15_crit_edge.us
  %indvars.iv54 = phi i64 [ %6, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next55, %for.cond1.for.inc15_crit_edge.us ]
  br i1 %7, label %for.cond4.preheader.us.us.preheader, label %for.cond1.for.inc15_crit_edge.us

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.us
  br label %for.cond4.preheader.us.us

for.cond1.for.inc15_crit_edge.us.loopexit:        ; preds = %for.cond4.for.inc12_crit_edge.us.us
  br label %for.cond1.for.inc15_crit_edge.us

for.cond1.for.inc15_crit_edge.us:                 ; preds = %for.cond1.for.inc15_crit_edge.us.loopexit, %for.cond1.preheader.us
  %indvars.iv.next55 = add nsw i64 %indvars.iv54, 1
  %cmp.us = icmp slt i64 %indvars.iv.next55, %5
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.cond.for.cond18.preheader_crit_edge.loopexit

for.cond4.preheader.us.us:                        ; preds = %for.cond4.preheader.us.us.preheader, %for.cond4.for.inc12_crit_edge.us.us
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %for.cond4.for.inc12_crit_edge.us.us ], [ 0, %for.cond4.preheader.us.us.preheader ]
  %9 = mul nsw i64 %indvars.iv50, %indvars.iv54
  %10 = trunc i64 %9 to i32
  br i1 %lcmp.mod59, label %for.body6.us.us.prol.loopexit.unr-lcssa, label %for.body6.us.us.prol.preheader

for.body6.us.us.prol.preheader:                   ; preds = %for.cond4.preheader.us.us
  br label %for.body6.us.us.prol

for.body6.us.us.prol:                             ; preds = %for.body6.us.us.prol.preheader
  %rem.us.us.prol = srem i32 %10, %1
  %conv.us.us.prol = sitofp i32 %rem.us.us.prol to double
  %div.us.us.prol = fdiv double %conv.us.us.prol, %conv7.us.us
  %arrayidx11.us.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %2, i64 %indvars.iv54, i64 %indvars.iv50, i64 0
  store double %div.us.us.prol, double* %arrayidx11.us.us.prol, align 8
  br label %for.body6.us.us.prol.loopexit.unr-lcssa

for.body6.us.us.prol.loopexit.unr-lcssa:          ; preds = %for.cond4.preheader.us.us, %for.body6.us.us.prol
  %indvars.iv513.us.us.unr.ph = phi i64 [ 1, %for.body6.us.us.prol ], [ 0, %for.cond4.preheader.us.us ]
  br label %for.body6.us.us.prol.loopexit

for.body6.us.us.prol.loopexit:                    ; preds = %for.body6.us.us.prol.loopexit.unr-lcssa
  br i1 %8, label %for.cond4.for.inc12_crit_edge.us.us, label %for.cond4.preheader.us.us.new

for.cond4.preheader.us.us.new:                    ; preds = %for.body6.us.us.prol.loopexit
  br label %for.body6.us.us

for.cond4.for.inc12_crit_edge.us.us.unr-lcssa:    ; preds = %for.body6.us.us
  br label %for.cond4.for.inc12_crit_edge.us.us

for.cond4.for.inc12_crit_edge.us.us:              ; preds = %for.body6.us.us.prol.loopexit, %for.cond4.for.inc12_crit_edge.us.us.unr-lcssa
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next51, %wide.trip.count
  br i1 %exitcond53, label %for.cond1.for.inc15_crit_edge.us.loopexit, label %for.cond4.preheader.us.us

for.body6.us.us:                                  ; preds = %for.body6.us.us, %for.cond4.preheader.us.us.new
  %indvars.iv513.us.us = phi i64 [ %indvars.iv513.us.us.unr.ph, %for.cond4.preheader.us.us.new ], [ %indvars.iv.next6.us.us.1, %for.body6.us.us ]
  %11 = trunc i64 %indvars.iv513.us.us to i32
  %add.us.us = add nsw i32 %10, %11
  %rem.us.us = srem i32 %add.us.us, %1
  %conv.us.us = sitofp i32 %rem.us.us to double
  %div.us.us = fdiv double %conv.us.us, %conv7.us.us
  %arrayidx11.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %2, i64 %indvars.iv54, i64 %indvars.iv50, i64 %indvars.iv513.us.us
  store double %div.us.us, double* %arrayidx11.us.us, align 8
  %indvars.iv.next6.us.us = add nuw nsw i64 %indvars.iv513.us.us, 1
  %12 = trunc i64 %indvars.iv.next6.us.us to i32
  %add.us.us.1 = add nsw i32 %10, %12
  %rem.us.us.1 = srem i32 %add.us.us.1, %1
  %conv.us.us.1 = sitofp i32 %rem.us.us.1 to double
  %div.us.us.1 = fdiv double %conv.us.us.1, %conv7.us.us
  %arrayidx11.us.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %2, i64 %indvars.iv54, i64 %indvars.iv50, i64 %indvars.iv.next6.us.us
  store double %div.us.us.1, double* %arrayidx11.us.us.1, align 8
  %indvars.iv.next6.us.us.1 = add nsw i64 %indvars.iv513.us.us, 2
  %exitcond49.1 = icmp eq i64 %indvars.iv.next6.us.us.1, %3
  br i1 %exitcond49.1, label %for.cond4.for.inc12_crit_edge.us.us.unr-lcssa, label %for.body6.us.us

for.cond.for.cond18.preheader_crit_edge.loopexit: ; preds = %for.cond1.for.inc15_crit_edge.us
  %13 = trunc i64 %indvars.iv.next55 to i32
  br label %for.cond.for.cond18.preheader_crit_edge

for.cond.for.cond18.preheader_crit_edge.loopexit45: ; preds = %for.cond1.preheader.lr.ph
  %14 = add i32 %i.promoted17, 1
  %15 = icmp sgt i32 %4, %14
  %smax57 = select i1 %15, i32 %4, i32 %14
  br label %for.cond.for.cond18.preheader_crit_edge

for.cond.for.cond18.preheader_crit_edge:          ; preds = %for.cond.for.cond18.preheader_crit_edge.loopexit45, %for.cond.for.cond18.preheader_crit_edge.loopexit
  %inc16.lcssa = phi i32 [ %13, %for.cond.for.cond18.preheader_crit_edge.loopexit ], [ %smax57, %for.cond.for.cond18.preheader_crit_edge.loopexit45 ]
  store i32 %inc16.lcssa, i32* %i, align 4
  %.pr = load i32, i32* %np.addr, align 4
  br label %for.cond18.preheader

for.cond18.preheader:                             ; preds = %for.cond.for.cond18.preheader_crit_edge, %entry
  %16 = phi i32 [ %.pr, %for.cond.for.cond18.preheader_crit_edge ], [ %np, %entry ]
  store i32 0, i32* %i, align 4
  %cmp1910 = icmp sgt i32 %16, 0
  br i1 %cmp1910, label %for.cond22.preheader.lr.ph, label %for.end40

for.cond22.preheader.lr.ph:                       ; preds = %for.cond18.preheader
  %17 = load i32, i32* %np.addr, align 4
  %18 = sext i32 %17 to i64
  %cmp237 = icmp sgt i32 %17, 0
  %19 = load [160 x double]*, [160 x double]** %C4.addr, align 8
  %20 = sext i32 %17 to i64
  %i.promoted = load i32, i32* %i, align 4
  br i1 %cmp237, label %for.cond22.preheader.us.preheader, label %for.cond18.for.end40_crit_edge.loopexit43

for.cond22.preheader.us.preheader:                ; preds = %for.cond22.preheader.lr.ph
  %21 = sext i32 %i.promoted to i64
  %conv29.us = sitofp i32 %17 to double
  %xtraiter = and i64 %20, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %22 = icmp eq i32 %17, 1
  %div30.us.prol = fdiv double 0.000000e+00, %conv29.us
  br label %for.cond22.preheader.us

for.cond22.preheader.us:                          ; preds = %for.cond22.preheader.us.preheader, %for.cond22.for.inc38_crit_edge.us
  %indvars.iv = phi i64 [ %21, %for.cond22.preheader.us.preheader ], [ %indvars.iv.next, %for.cond22.for.inc38_crit_edge.us ]
  %23 = trunc i64 %indvars.iv to i32
  br i1 %lcmp.mod, label %for.body25.us.prol.loopexit.unr-lcssa, label %for.body25.us.prol.preheader

for.body25.us.prol.preheader:                     ; preds = %for.cond22.preheader.us
  br label %for.body25.us.prol

for.body25.us.prol:                               ; preds = %for.body25.us.prol.preheader
  %arrayidx34.us.prol = getelementptr inbounds [160 x double], [160 x double]* %19, i64 %indvars.iv, i64 0
  store double %div30.us.prol, double* %arrayidx34.us.prol, align 8
  br label %for.body25.us.prol.loopexit.unr-lcssa

for.body25.us.prol.loopexit.unr-lcssa:            ; preds = %for.cond22.preheader.us, %for.body25.us.prol
  %indvars.iv8.us.unr.ph = phi i64 [ 1, %for.body25.us.prol ], [ 0, %for.cond22.preheader.us ]
  br label %for.body25.us.prol.loopexit

for.body25.us.prol.loopexit:                      ; preds = %for.body25.us.prol.loopexit.unr-lcssa
  br i1 %22, label %for.cond22.for.inc38_crit_edge.us, label %for.cond22.preheader.us.new

for.cond22.preheader.us.new:                      ; preds = %for.body25.us.prol.loopexit
  br label %for.body25.us

for.body25.us:                                    ; preds = %for.body25.us, %for.cond22.preheader.us.new
  %indvars.iv8.us = phi i64 [ %indvars.iv8.us.unr.ph, %for.cond22.preheader.us.new ], [ %indvars.iv.next.us.1, %for.body25.us ]
  %24 = trunc i64 %indvars.iv8.us to i32
  %mul26.us = mul nsw i32 %23, %24
  %rem27.us = srem i32 %mul26.us, %17
  %conv28.us = sitofp i32 %rem27.us to double
  %div30.us = fdiv double %conv28.us, %conv29.us
  %arrayidx34.us = getelementptr inbounds [160 x double], [160 x double]* %19, i64 %indvars.iv, i64 %indvars.iv8.us
  store double %div30.us, double* %arrayidx34.us, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv8.us, 1
  %25 = trunc i64 %indvars.iv.next.us to i32
  %mul26.us.1 = mul nsw i32 %23, %25
  %rem27.us.1 = srem i32 %mul26.us.1, %17
  %conv28.us.1 = sitofp i32 %rem27.us.1 to double
  %div30.us.1 = fdiv double %conv28.us.1, %conv29.us
  %arrayidx34.us.1 = getelementptr inbounds [160 x double], [160 x double]* %19, i64 %indvars.iv, i64 %indvars.iv.next.us
  store double %div30.us.1, double* %arrayidx34.us.1, align 8
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv8.us, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.us.1, %20
  br i1 %exitcond.1, label %for.cond22.for.inc38_crit_edge.us.unr-lcssa, label %for.body25.us

for.cond22.for.inc38_crit_edge.us.unr-lcssa:      ; preds = %for.body25.us
  br label %for.cond22.for.inc38_crit_edge.us

for.cond22.for.inc38_crit_edge.us:                ; preds = %for.body25.us.prol.loopexit, %for.cond22.for.inc38_crit_edge.us.unr-lcssa
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %cmp19.us = icmp slt i64 %indvars.iv.next, %18
  br i1 %cmp19.us, label %for.cond22.preheader.us, label %for.cond18.for.end40_crit_edge.loopexit

for.cond18.for.end40_crit_edge.loopexit:          ; preds = %for.cond22.for.inc38_crit_edge.us
  %26 = trunc i64 %indvars.iv.next to i32
  br label %for.cond18.for.end40_crit_edge

for.cond18.for.end40_crit_edge.loopexit43:        ; preds = %for.cond22.preheader.lr.ph
  %27 = add i32 %i.promoted, 1
  %28 = icmp sgt i32 %17, %27
  %smax = select i1 %28, i32 %17, i32 %27
  br label %for.cond18.for.end40_crit_edge

for.cond18.for.end40_crit_edge:                   ; preds = %for.cond18.for.end40_crit_edge.loopexit43, %for.cond18.for.end40_crit_edge.loopexit
  %inc39.lcssa = phi i32 [ %26, %for.cond18.for.end40_crit_edge.loopexit ], [ %smax, %for.cond18.for.end40_crit_edge.loopexit43 ]
  store i32 %inc39.lcssa, i32* %i, align 4
  br label %for.end40

for.end40:                                        ; preds = %for.cond18.for.end40_crit_edge, %for.cond18.preheader
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %nr, i32 %nq, i32 %np, [140 x [160 x double]]* %A) unnamed_addr #1 {
entry:
  %nr.addr = alloca i32, align 4
  %nq.addr = alloca i32, align 4
  %np.addr = alloca i32, align 4
  %A.addr = alloca [140 x [160 x double]]*, align 8
  %i = alloca i32, align 4
  %k = alloca i32, align 4
  store i32 %nr, i32* %nr.addr, align 4
  store i32 %nq, i32* %nq.addr, align 4
  store i32 %np, i32* %np.addr, align 4
  store [140 x [160 x double]]* %A, [140 x [160 x double]]** %A.addr, align 8
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  store i32 0, i32* %i, align 4
  %3 = load i32, i32* %nr.addr, align 4
  %cmp12 = icmp sgt i32 %3, 0
  br i1 %cmp12, label %for.cond2.preheader.lr.ph, label %for.end23

for.cond2.preheader.lr.ph:                        ; preds = %entry
  %4 = load i32, i32* %nq.addr, align 4
  %5 = sext i32 %4 to i64
  %cmp37 = icmp sgt i32 %4, 0
  %6 = load i32, i32* %np.addr, align 4
  %wide.trip.count = zext i32 %6 to i64
  %7 = load [140 x [160 x double]]*, [140 x [160 x double]]** %A.addr, align 8
  %8 = load i32, i32* %nr.addr, align 4
  %9 = sext i32 %8 to i64
  %i.promoted = load i32, i32* %i, align 4
  br i1 %cmp37, label %for.cond2.preheader.us.preheader, label %for.cond.for.end23_crit_edge.loopexit49

for.cond2.preheader.us.preheader:                 ; preds = %for.cond2.preheader.lr.ph
  %10 = sext i32 %i.promoted to i64
  %11 = icmp sgt i32 %6, 0
  %wide.trip.count54 = zext i32 %4 to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.preheader.us.preheader, %for.cond2.for.inc21_crit_edge.us
  %indvars.iv56 = phi i64 [ %10, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next57, %for.cond2.for.inc21_crit_edge.us ]
  br i1 %11, label %for.cond5.preheader.us.us.preheader, label %for.cond2.for.inc21_crit_edge.us

for.cond5.preheader.us.us.preheader:              ; preds = %for.cond2.preheader.us
  %12 = mul nsw i64 %5, %indvars.iv56
  %13 = trunc i64 %12 to i32
  br label %for.cond5.preheader.us.us

for.cond2.for.inc21_crit_edge.us.loopexit:        ; preds = %for.cond5.for.inc18_crit_edge.us.us
  br label %for.cond2.for.inc21_crit_edge.us

for.cond2.for.inc21_crit_edge.us:                 ; preds = %for.cond2.for.inc21_crit_edge.us.loopexit, %for.cond2.preheader.us
  %inc.lcssa10.lcssa.us = phi i32 [ 0, %for.cond2.preheader.us ], [ %6, %for.cond2.for.inc21_crit_edge.us.loopexit ]
  %indvars.iv.next57 = add nsw i64 %indvars.iv56, 1
  %cmp.us = icmp slt i64 %indvars.iv.next57, %9
  br i1 %cmp.us, label %for.cond2.preheader.us, label %for.cond.for.end23_crit_edge.loopexit

for.cond5.preheader.us.us:                        ; preds = %for.cond5.preheader.us.us.preheader, %for.cond5.for.inc18_crit_edge.us.us
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %for.cond5.for.inc18_crit_edge.us.us ], [ 0, %for.cond5.preheader.us.us.preheader ]
  %14 = trunc i64 %indvars.iv52 to i32
  %mul83.us.us = add i32 %13, %14
  %add.us.us = mul i32 %mul83.us.us, %6
  %15 = zext i32 %add.us.us to i64
  br label %for.body7.us.us

for.cond5.for.inc18_crit_edge.us.us:              ; preds = %if.end.us.us
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, %wide.trip.count54
  br i1 %exitcond55, label %for.cond2.for.inc21_crit_edge.us.loopexit, label %for.cond5.preheader.us.us

for.body7.us.us:                                  ; preds = %if.end.us.us, %for.cond5.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end.us.us ], [ 0, %for.cond5.preheader.us.us ]
  %16 = add i64 %15, %indvars.iv
  %17 = trunc i64 %16 to i32
  %rem.us.us = srem i32 %17, 20
  %cmp11.us.us = icmp eq i32 %rem.us.us, 0
  br i1 %cmp11.us.us, label %if.then.us.us, label %if.end.us.us

if.then.us.us:                                    ; preds = %for.body7.us.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #6
  br label %if.end.us.us

if.end.us.us:                                     ; preds = %if.then.us.us, %for.body7.us.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %7, i64 %indvars.iv56, i64 %indvars.iv52, i64 %indvars.iv
  %20 = load double, double* %arrayidx16.us.us, align 8
  %call17.us.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond5.for.inc18_crit_edge.us.us, label %for.body7.us.us

for.cond.for.end23_crit_edge.loopexit:            ; preds = %for.cond2.for.inc21_crit_edge.us
  %21 = trunc i64 %indvars.iv.next57 to i32
  br label %for.cond.for.end23_crit_edge

for.cond.for.end23_crit_edge.loopexit49:          ; preds = %for.cond2.preheader.lr.ph
  %k.promoted = load i32, i32* %k, align 4
  %22 = add i32 %i.promoted, 1
  %23 = icmp sgt i32 %8, %22
  %smax = select i1 %23, i32 %8, i32 %22
  br label %for.cond.for.end23_crit_edge

for.cond.for.end23_crit_edge:                     ; preds = %for.cond.for.end23_crit_edge.loopexit49, %for.cond.for.end23_crit_edge.loopexit
  %inc.lcssa10.lcssa17.lcssa = phi i32 [ %inc.lcssa10.lcssa.us, %for.cond.for.end23_crit_edge.loopexit ], [ %k.promoted, %for.cond.for.end23_crit_edge.loopexit49 ]
  %inc22.lcssa = phi i32 [ %21, %for.cond.for.end23_crit_edge.loopexit ], [ %smax, %for.cond.for.end23_crit_edge.loopexit49 ]
  store i32 %inc22.lcssa, i32* %i, align 4
  store i32 %inc.lcssa10.lcssa17.lcssa, i32* %k, align 4
  br label %for.end23

for.end23:                                        ; preds = %for.cond.for.end23_crit_edge, %entry
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %25) #6
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
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8}
!8 = distinct !{!8, !6}
!9 = distinct !{!9, !10}
!10 = !{!"llvm.loop.unroll.disable"}
!11 = distinct !{!11, !2, !3}
!12 = !{!13}
!13 = distinct !{!13, !14}
!14 = distinct !{!14, !"LVerDomain"}
!15 = !{!16}
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !10}
!18 = distinct !{!18, !2, !3}
!19 = distinct !{!19, !2, !3}
