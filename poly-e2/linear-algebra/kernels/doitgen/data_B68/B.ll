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
  %cmp48 = icmp sgt i32 %0, 0
  br i1 %cmp48, label %for.cond1.preheader.lr.ph, label %for.end44

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %1 = load i32, i32* %nq.addr, align 4
  %2 = load i32, i32* %np.addr, align 4
  %wide.trip.count.1 = zext i32 %2 to i64
  %wide.trip.count70 = zext i32 %2 to i64
  %3 = load double*, double** %sum.addr, align 8
  %4 = bitcast double* %3 to i8*
  %5 = load [140 x [160 x double]]*, [140 x [160 x double]]** %A.addr, align 8
  %6 = load [160 x double]*, [160 x double]** %C4.addr, align 8
  %7 = load i32, i32* %nq.addr, align 4
  %8 = load i32, i32* %np.addr, align 4
  %9 = load i32, i32* %nr.addr, align 4
  %r.promoted = load i32, i32* %r, align 4
  %s.promoted52 = load i32, i32* %s, align 4
  %p.promoted = load i32, i32* %p, align 4
  %10 = sext i32 %8 to i64
  %11 = sext i32 %7 to i64
  %12 = add i32 %2, -1
  %13 = zext i32 %12 to i64
  %14 = shl nuw nsw i64 %13, 3
  %15 = add nuw nsw i64 %14, 8
  %16 = sext i32 %8 to i64
  %17 = sext i32 %7 to i64
  %18 = sext i32 %r.promoted to i64
  %19 = sext i32 %9 to i64
  %20 = icmp sgt i32 %1, 0
  %21 = icmp sgt i32 %2, 0
  %22 = icmp sgt i32 %2, 0
  %23 = and i32 %2, 1
  %lcmp.mod = icmp eq i32 %23, 0
  %24 = icmp eq i32 %2, 1
  %sunkaddr84 = ptrtoint double* %3 to i64
  %sunkaddr = ptrtoint double* %3 to i64
  %25 = icmp sgt i32 %2, 0
  %26 = icmp sgt i32 %2, 0
  %27 = icmp sgt i64 %16, 1
  %smax = select i1 %27, i64 %16, i64 1
  %28 = icmp sgt i64 %16, 1
  %smax91 = select i1 %28, i64 %16, i64 1
  %scevgep94 = getelementptr double, double* %3, i64 %smax91
  %29 = icmp sgt i64 %16, 1
  %smax101 = select i1 %29, i64 %16, i64 1
  %30 = icmp sgt i64 %16, 1
  %smax110 = select i1 %30, i64 %16, i64 1
  %scevgep113 = getelementptr double, double* %3, i64 %smax110
  %31 = and i64 %smax101, 9223372036854775804
  %32 = add nsw i64 %31, -4
  %33 = lshr exact i64 %32, 2
  %34 = add nuw nsw i64 %33, 1
  %min.iters.check = icmp ult i64 %smax, 4
  %n.vec = and i64 %smax, 9223372036854775804
  %cmp.zero = icmp eq i64 %n.vec, 0
  %xtraiter143 = and i64 %34, 3
  %lcmp.mod144 = icmp eq i64 %xtraiter143, 0
  %35 = icmp ult i64 %32, 12
  %cmp.n = icmp eq i64 %smax, %n.vec
  %min.iters.check102 = icmp ult i64 %smax101, 4
  %n.vec105 = and i64 %smax101, 9223372036854775804
  %cmp.zero106 = icmp eq i64 %n.vec105, 0
  %xtraiter = and i64 %34, 3
  %lcmp.mod142 = icmp eq i64 %xtraiter, 0
  %36 = icmp ult i64 %32, 12
  %cmp.n124 = icmp eq i64 %smax101, %n.vec105
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.lr.ph, %for.inc42
  %indvar = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvar.next, %for.inc42 ]
  %indvars.iv79 = phi i64 [ %18, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next80, %for.inc42 ]
  %inc37.lcssa19.lcssa55 = phi i32 [ %p.promoted, %for.cond1.preheader.lr.ph ], [ %inc37.lcssa19.lcssa56, %for.inc42 ]
  %inc.lcssa9.lcssa17.lcssa54 = phi i32 [ %s.promoted52, %for.cond1.preheader.lr.ph ], [ %inc.lcssa9.lcssa17.lcssa53, %for.inc42 ]
  %37 = add nsw i64 %18, %indvar
  %38 = add nsw i64 %18, %indvar
  br i1 %20, label %for.cond4.preheader.lr.ph, label %for.inc42

for.cond4.preheader.lr.ph:                        ; preds = %for.cond1.preheader
  br i1 %21, label %for.cond4.preheader.us.preheader, label %for.cond4.preheader.preheader

for.cond4.preheader.preheader:                    ; preds = %for.cond4.preheader.lr.ph
  br label %for.cond4.preheader

for.cond4.preheader.us.preheader:                 ; preds = %for.cond4.preheader.lr.ph
  br label %for.cond4.preheader.us

for.cond4.preheader.us:                           ; preds = %for.cond4.preheader.us.preheader, %for.inc39.us
  %indvars.iv77 = phi i64 [ %indvars.iv.next78, %for.inc39.us ], [ 0, %for.cond4.preheader.us.preheader ]
  %scevgep = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %38, i64 %indvars.iv77, i64 0
  %scevgep92 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %38, i64 %indvars.iv77, i64 %smax91
  br i1 %22, label %for.body6.us.us.preheader, label %for.cond4.for.cond25.preheader_crit_edge.us.loopexit57

for.body6.us.us.preheader:                        ; preds = %for.cond4.preheader.us
  %arrayidx15.us.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv79, i64 %indvars.iv77, i64 0
  br label %for.body6.us.us

for.inc39.us.loopexit.loopexit:                   ; preds = %for.body27.us
  br label %for.inc39.us.loopexit

for.inc39.us.loopexit:                            ; preds = %for.inc39.us.loopexit.loopexit, %middle.block
  %indvars.iv.next73.lcssa = phi i64 [ %n.vec, %middle.block ], [ %indvars.iv.next73, %for.inc39.us.loopexit.loopexit ]
  %39 = trunc i64 %indvars.iv.next73.lcssa to i32
  br label %for.inc39.us

for.inc39.us:                                     ; preds = %for.inc39.us.loopexit, %for.cond4.for.cond25.preheader_crit_edge.us
  %inc37.lcssa19.us = phi i32 [ 0, %for.cond4.for.cond25.preheader_crit_edge.us ], [ %39, %for.inc39.us.loopexit ]
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %cmp2.us = icmp slt i64 %indvars.iv.next78, %17
  br i1 %cmp2.us, label %for.cond4.preheader.us, label %for.inc42.loopexit

for.body27.us:                                    ; preds = %for.body27.us.preheader137, %for.body27.us
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %for.body27.us ], [ %indvars.iv72.ph, %for.body27.us.preheader137 ]
  %arrayidx29.us = getelementptr inbounds double, double* %3, i64 %indvars.iv72
  %40 = bitcast double* %arrayidx29.us to i64*
  %41 = load i64, i64* %40, align 8
  %arrayidx35.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv79, i64 %indvars.iv77, i64 %indvars.iv72
  %42 = bitcast double* %arrayidx35.us to i64*
  store i64 %41, i64* %42, align 8
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %cmp26.us = icmp slt i64 %indvars.iv.next73, %16
  br i1 %cmp26.us, label %for.body27.us, label %for.inc39.us.loopexit.loopexit, !llvm.loop !1

for.cond4.for.cond25.preheader_crit_edge.us.loopexit57: ; preds = %for.cond4.preheader.us
  call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 %15, i32 8, i1 false)
  br label %for.cond4.for.cond25.preheader_crit_edge.us

for.cond4.for.cond25.preheader_crit_edge.us.loopexit: ; preds = %for.cond7.for.inc22_crit_edge.us.us
  br label %for.cond4.for.cond25.preheader_crit_edge.us

for.cond4.for.cond25.preheader_crit_edge.us:      ; preds = %for.cond4.for.cond25.preheader_crit_edge.us.loopexit, %for.cond4.for.cond25.preheader_crit_edge.us.loopexit57
  %inc.lcssa9.lcssa.us = phi i32 [ 0, %for.cond4.for.cond25.preheader_crit_edge.us.loopexit57 ], [ %2, %for.cond4.for.cond25.preheader_crit_edge.us.loopexit ]
  br i1 %25, label %for.body27.us.preheader, label %for.inc39.us

for.body27.us.preheader:                          ; preds = %for.cond4.for.cond25.preheader_crit_edge.us
  br i1 %min.iters.check, label %for.body27.us.preheader137, label %min.iters.checked

for.body27.us.preheader137:                       ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.body27.us.preheader
  %indvars.iv72.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.body27.us.preheader ], [ %n.vec, %middle.block ]
  br label %for.body27.us

min.iters.checked:                                ; preds = %for.body27.us.preheader
  br i1 %cmp.zero, label %for.body27.us.preheader137, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep94
  %bound1 = icmp ult double* %3, %scevgep92
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.body27.us.preheader137, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br i1 %lcmp.mod144, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter145 = phi i64 [ %prol.iter145.sub, %vector.body.prol ], [ %xtraiter143, %vector.body.prol.preheader ]
  %43 = getelementptr inbounds double, double* %3, i64 %index.prol
  %44 = bitcast double* %43 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %44, align 8, !alias.scope !4
  %45 = getelementptr double, double* %43, i64 2
  %46 = bitcast double* %45 to <2 x i64>*
  %wide.load97.prol = load <2 x i64>, <2 x i64>* %46, align 8, !alias.scope !4
  %47 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv79, i64 %indvars.iv77, i64 %index.prol
  %48 = bitcast double* %47 to <2 x i64>*
  store <2 x i64> %wide.load.prol, <2 x i64>* %48, align 8, !alias.scope !7, !noalias !4
  %49 = getelementptr double, double* %47, i64 2
  %50 = bitcast double* %49 to <2 x i64>*
  store <2 x i64> %wide.load97.prol, <2 x i64>* %50, align 8, !alias.scope !7, !noalias !4
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter145.sub = add i64 %prol.iter145, -1
  %prol.iter145.cmp = icmp eq i64 %prol.iter145.sub, 0
  br i1 %prol.iter145.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !9

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  br i1 %35, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %51 = getelementptr inbounds double, double* %3, i64 %index
  %52 = bitcast double* %51 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %52, align 8, !alias.scope !4
  %53 = getelementptr double, double* %51, i64 2
  %54 = bitcast double* %53 to <2 x i64>*
  %wide.load97 = load <2 x i64>, <2 x i64>* %54, align 8, !alias.scope !4
  %55 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv79, i64 %indvars.iv77, i64 %index
  %56 = bitcast double* %55 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %56, align 8, !alias.scope !7, !noalias !4
  %57 = getelementptr double, double* %55, i64 2
  %58 = bitcast double* %57 to <2 x i64>*
  store <2 x i64> %wide.load97, <2 x i64>* %58, align 8, !alias.scope !7, !noalias !4
  %index.next = add i64 %index, 4
  %59 = getelementptr inbounds double, double* %3, i64 %index.next
  %60 = bitcast double* %59 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %60, align 8, !alias.scope !4
  %61 = getelementptr double, double* %59, i64 2
  %62 = bitcast double* %61 to <2 x i64>*
  %wide.load97.1 = load <2 x i64>, <2 x i64>* %62, align 8, !alias.scope !4
  %63 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv79, i64 %indvars.iv77, i64 %index.next
  %64 = bitcast double* %63 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %64, align 8, !alias.scope !7, !noalias !4
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x i64>*
  store <2 x i64> %wide.load97.1, <2 x i64>* %66, align 8, !alias.scope !7, !noalias !4
  %index.next.1 = add i64 %index, 8
  %67 = getelementptr inbounds double, double* %3, i64 %index.next.1
  %68 = bitcast double* %67 to <2 x i64>*
  %wide.load.2 = load <2 x i64>, <2 x i64>* %68, align 8, !alias.scope !4
  %69 = getelementptr double, double* %67, i64 2
  %70 = bitcast double* %69 to <2 x i64>*
  %wide.load97.2 = load <2 x i64>, <2 x i64>* %70, align 8, !alias.scope !4
  %71 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv79, i64 %indvars.iv77, i64 %index.next.1
  %72 = bitcast double* %71 to <2 x i64>*
  store <2 x i64> %wide.load.2, <2 x i64>* %72, align 8, !alias.scope !7, !noalias !4
  %73 = getelementptr double, double* %71, i64 2
  %74 = bitcast double* %73 to <2 x i64>*
  store <2 x i64> %wide.load97.2, <2 x i64>* %74, align 8, !alias.scope !7, !noalias !4
  %index.next.2 = add i64 %index, 12
  %75 = getelementptr inbounds double, double* %3, i64 %index.next.2
  %76 = bitcast double* %75 to <2 x i64>*
  %wide.load.3 = load <2 x i64>, <2 x i64>* %76, align 8, !alias.scope !4
  %77 = getelementptr double, double* %75, i64 2
  %78 = bitcast double* %77 to <2 x i64>*
  %wide.load97.3 = load <2 x i64>, <2 x i64>* %78, align 8, !alias.scope !4
  %79 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv79, i64 %indvars.iv77, i64 %index.next.2
  %80 = bitcast double* %79 to <2 x i64>*
  store <2 x i64> %wide.load.3, <2 x i64>* %80, align 8, !alias.scope !7, !noalias !4
  %81 = getelementptr double, double* %79, i64 2
  %82 = bitcast double* %81 to <2 x i64>*
  store <2 x i64> %wide.load97.3, <2 x i64>* %82, align 8, !alias.scope !7, !noalias !4
  %index.next.3 = add i64 %index, 16
  %83 = icmp eq i64 %index.next.3, %n.vec
  br i1 %83, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !11

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  br i1 %cmp.n, label %for.inc39.us.loopexit, label %for.body27.us.preheader137

for.body6.us.us:                                  ; preds = %for.body6.us.us.preheader, %for.cond7.for.inc22_crit_edge.us.us
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %for.cond7.for.inc22_crit_edge.us.us ], [ 0, %for.body6.us.us.preheader ]
  %arrayidx.us.us = getelementptr inbounds double, double* %3, i64 %indvars.iv68
  store double 0.000000e+00, double* %arrayidx.us.us, align 8
  br i1 %lcmp.mod, label %for.body9.us.us.prol.loopexit, label %for.body9.us.us.prol

for.body9.us.us.prol:                             ; preds = %for.body6.us.us
  %84 = load double, double* %arrayidx15.us.us.prol, align 8
  %arrayidx19.us.us.prol = getelementptr inbounds [160 x double], [160 x double]* %6, i64 0, i64 %indvars.iv68
  %85 = load double, double* %arrayidx19.us.us.prol, align 8
  %mul.us.us.prol = fmul double %84, %85
  %sunkaddr81 = shl i64 %indvars.iv68, 3
  %sunkaddr82 = add i64 %sunkaddr, %sunkaddr81
  %sunkaddr83 = inttoptr i64 %sunkaddr82 to double*
  %86 = load double, double* %sunkaddr83, align 8
  %add.us.us.prol = fadd double %mul.us.us.prol, %86
  store double %add.us.us.prol, double* %sunkaddr83, align 8
  br label %for.body9.us.us.prol.loopexit

for.body9.us.us.prol.loopexit:                    ; preds = %for.body9.us.us.prol, %for.body6.us.us
  %indvars.iv66.unr.ph = phi i64 [ 1, %for.body9.us.us.prol ], [ 0, %for.body6.us.us ]
  br i1 %24, label %for.cond7.for.inc22_crit_edge.us.us, label %for.body9.us.us.preheader

for.body9.us.us.preheader:                        ; preds = %for.body9.us.us.prol.loopexit
  %sunkaddr85 = shl i64 %indvars.iv68, 3
  %sunkaddr86 = add i64 %sunkaddr84, %sunkaddr85
  %sunkaddr87 = inttoptr i64 %sunkaddr86 to double*
  br label %for.body9.us.us

for.cond7.for.inc22_crit_edge.us.us.loopexit:     ; preds = %for.body9.us.us
  br label %for.cond7.for.inc22_crit_edge.us.us

for.cond7.for.inc22_crit_edge.us.us:              ; preds = %for.cond7.for.inc22_crit_edge.us.us.loopexit, %for.body9.us.us.prol.loopexit
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next69, %wide.trip.count70
  br i1 %exitcond71, label %for.cond4.for.cond25.preheader_crit_edge.us.loopexit, label %for.body6.us.us

for.body9.us.us:                                  ; preds = %for.body9.us.us.preheader, %for.body9.us.us
  %indvars.iv66 = phi i64 [ %indvars.iv.next67.1, %for.body9.us.us ], [ %indvars.iv66.unr.ph, %for.body9.us.us.preheader ]
  %arrayidx15.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv79, i64 %indvars.iv77, i64 %indvars.iv66
  %87 = load double, double* %arrayidx15.us.us, align 8
  %arrayidx19.us.us = getelementptr inbounds [160 x double], [160 x double]* %6, i64 %indvars.iv66, i64 %indvars.iv68
  %88 = load double, double* %arrayidx19.us.us, align 8
  %mul.us.us = fmul double %87, %88
  %89 = load double, double* %sunkaddr87, align 8
  %add.us.us = fadd double %mul.us.us, %89
  store double %add.us.us, double* %sunkaddr87, align 8
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %arrayidx15.us.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv79, i64 %indvars.iv77, i64 %indvars.iv.next67
  %90 = load double, double* %arrayidx15.us.us.1, align 8
  %arrayidx19.us.us.1 = getelementptr inbounds [160 x double], [160 x double]* %6, i64 %indvars.iv.next67, i64 %indvars.iv68
  %91 = load double, double* %arrayidx19.us.us.1, align 8
  %mul.us.us.1 = fmul double %90, %91
  %92 = load double, double* %sunkaddr87, align 8
  %add.us.us.1 = fadd double %mul.us.us.1, %92
  store double %add.us.us.1, double* %sunkaddr87, align 8
  %indvars.iv.next67.1 = add nuw nsw i64 %indvars.iv66, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next67.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.cond7.for.inc22_crit_edge.us.us.loopexit, label %for.body9.us.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc39
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %for.inc39 ], [ 0, %for.cond4.preheader.preheader ]
  %scevgep108 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %37, i64 %indvars.iv62, i64 0
  %scevgep111 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %37, i64 %indvars.iv62, i64 %smax110
  br i1 %26, label %for.body27.preheader, label %for.inc39

for.body27.preheader:                             ; preds = %for.cond4.preheader
  br i1 %min.iters.check102, label %for.body27.preheader138, label %min.iters.checked103

min.iters.checked103:                             ; preds = %for.body27.preheader
  br i1 %cmp.zero106, label %for.body27.preheader138, label %vector.memcheck119

vector.memcheck119:                               ; preds = %min.iters.checked103
  %bound0115 = icmp ult double* %scevgep108, %scevgep113
  %bound1116 = icmp ult double* %3, %scevgep111
  %memcheck.conflict118 = and i1 %bound0115, %bound1116
  br i1 %memcheck.conflict118, label %for.body27.preheader138, label %vector.body98.preheader

vector.body98.preheader:                          ; preds = %vector.memcheck119
  br i1 %lcmp.mod142, label %vector.body98.prol.loopexit, label %vector.body98.prol.preheader

vector.body98.prol.preheader:                     ; preds = %vector.body98.preheader
  br label %vector.body98.prol

vector.body98.prol:                               ; preds = %vector.body98.prol, %vector.body98.prol.preheader
  %index121.prol = phi i64 [ %index.next122.prol, %vector.body98.prol ], [ 0, %vector.body98.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body98.prol ], [ %xtraiter, %vector.body98.prol.preheader ]
  %93 = getelementptr inbounds double, double* %3, i64 %index121.prol
  %94 = bitcast double* %93 to <2 x i64>*
  %wide.load129.prol = load <2 x i64>, <2 x i64>* %94, align 8, !alias.scope !12
  %95 = getelementptr double, double* %93, i64 2
  %96 = bitcast double* %95 to <2 x i64>*
  %wide.load130.prol = load <2 x i64>, <2 x i64>* %96, align 8, !alias.scope !12
  %97 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv79, i64 %indvars.iv62, i64 %index121.prol
  %98 = bitcast double* %97 to <2 x i64>*
  store <2 x i64> %wide.load129.prol, <2 x i64>* %98, align 8, !alias.scope !15, !noalias !12
  %99 = getelementptr double, double* %97, i64 2
  %100 = bitcast double* %99 to <2 x i64>*
  store <2 x i64> %wide.load130.prol, <2 x i64>* %100, align 8, !alias.scope !15, !noalias !12
  %index.next122.prol = add i64 %index121.prol, 4
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body98.prol.loopexit.unr-lcssa, label %vector.body98.prol, !llvm.loop !17

vector.body98.prol.loopexit.unr-lcssa:            ; preds = %vector.body98.prol
  br label %vector.body98.prol.loopexit

vector.body98.prol.loopexit:                      ; preds = %vector.body98.preheader, %vector.body98.prol.loopexit.unr-lcssa
  %index121.unr = phi i64 [ 0, %vector.body98.preheader ], [ %index.next122.prol, %vector.body98.prol.loopexit.unr-lcssa ]
  br i1 %36, label %middle.block99, label %vector.body98.preheader.new

vector.body98.preheader.new:                      ; preds = %vector.body98.prol.loopexit
  br label %vector.body98

vector.body98:                                    ; preds = %vector.body98, %vector.body98.preheader.new
  %index121 = phi i64 [ %index121.unr, %vector.body98.preheader.new ], [ %index.next122.3, %vector.body98 ]
  %101 = getelementptr inbounds double, double* %3, i64 %index121
  %102 = bitcast double* %101 to <2 x i64>*
  %wide.load129 = load <2 x i64>, <2 x i64>* %102, align 8, !alias.scope !12
  %103 = getelementptr double, double* %101, i64 2
  %104 = bitcast double* %103 to <2 x i64>*
  %wide.load130 = load <2 x i64>, <2 x i64>* %104, align 8, !alias.scope !12
  %105 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv79, i64 %indvars.iv62, i64 %index121
  %106 = bitcast double* %105 to <2 x i64>*
  store <2 x i64> %wide.load129, <2 x i64>* %106, align 8, !alias.scope !15, !noalias !12
  %107 = getelementptr double, double* %105, i64 2
  %108 = bitcast double* %107 to <2 x i64>*
  store <2 x i64> %wide.load130, <2 x i64>* %108, align 8, !alias.scope !15, !noalias !12
  %index.next122 = add i64 %index121, 4
  %109 = getelementptr inbounds double, double* %3, i64 %index.next122
  %110 = bitcast double* %109 to <2 x i64>*
  %wide.load129.1 = load <2 x i64>, <2 x i64>* %110, align 8, !alias.scope !12
  %111 = getelementptr double, double* %109, i64 2
  %112 = bitcast double* %111 to <2 x i64>*
  %wide.load130.1 = load <2 x i64>, <2 x i64>* %112, align 8, !alias.scope !12
  %113 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv79, i64 %indvars.iv62, i64 %index.next122
  %114 = bitcast double* %113 to <2 x i64>*
  store <2 x i64> %wide.load129.1, <2 x i64>* %114, align 8, !alias.scope !15, !noalias !12
  %115 = getelementptr double, double* %113, i64 2
  %116 = bitcast double* %115 to <2 x i64>*
  store <2 x i64> %wide.load130.1, <2 x i64>* %116, align 8, !alias.scope !15, !noalias !12
  %index.next122.1 = add i64 %index121, 8
  %117 = getelementptr inbounds double, double* %3, i64 %index.next122.1
  %118 = bitcast double* %117 to <2 x i64>*
  %wide.load129.2 = load <2 x i64>, <2 x i64>* %118, align 8, !alias.scope !12
  %119 = getelementptr double, double* %117, i64 2
  %120 = bitcast double* %119 to <2 x i64>*
  %wide.load130.2 = load <2 x i64>, <2 x i64>* %120, align 8, !alias.scope !12
  %121 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv79, i64 %indvars.iv62, i64 %index.next122.1
  %122 = bitcast double* %121 to <2 x i64>*
  store <2 x i64> %wide.load129.2, <2 x i64>* %122, align 8, !alias.scope !15, !noalias !12
  %123 = getelementptr double, double* %121, i64 2
  %124 = bitcast double* %123 to <2 x i64>*
  store <2 x i64> %wide.load130.2, <2 x i64>* %124, align 8, !alias.scope !15, !noalias !12
  %index.next122.2 = add i64 %index121, 12
  %125 = getelementptr inbounds double, double* %3, i64 %index.next122.2
  %126 = bitcast double* %125 to <2 x i64>*
  %wide.load129.3 = load <2 x i64>, <2 x i64>* %126, align 8, !alias.scope !12
  %127 = getelementptr double, double* %125, i64 2
  %128 = bitcast double* %127 to <2 x i64>*
  %wide.load130.3 = load <2 x i64>, <2 x i64>* %128, align 8, !alias.scope !12
  %129 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv79, i64 %indvars.iv62, i64 %index.next122.2
  %130 = bitcast double* %129 to <2 x i64>*
  store <2 x i64> %wide.load129.3, <2 x i64>* %130, align 8, !alias.scope !15, !noalias !12
  %131 = getelementptr double, double* %129, i64 2
  %132 = bitcast double* %131 to <2 x i64>*
  store <2 x i64> %wide.load130.3, <2 x i64>* %132, align 8, !alias.scope !15, !noalias !12
  %index.next122.3 = add i64 %index121, 16
  %133 = icmp eq i64 %index.next122.3, %n.vec105
  br i1 %133, label %middle.block99.unr-lcssa, label %vector.body98, !llvm.loop !18

middle.block99.unr-lcssa:                         ; preds = %vector.body98
  br label %middle.block99

middle.block99:                                   ; preds = %vector.body98.prol.loopexit, %middle.block99.unr-lcssa
  br i1 %cmp.n124, label %for.inc39.loopexit, label %for.body27.preheader138

for.body27.preheader138:                          ; preds = %middle.block99, %vector.memcheck119, %min.iters.checked103, %for.body27.preheader
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck119 ], [ 0, %min.iters.checked103 ], [ 0, %for.body27.preheader ], [ %n.vec105, %middle.block99 ]
  br label %for.body27

for.body27:                                       ; preds = %for.body27.preheader138, %for.body27
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.body27 ], [ %indvars.iv.ph, %for.body27.preheader138 ]
  %arrayidx29 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %134 = bitcast double* %arrayidx29 to i64*
  %135 = load i64, i64* %134, align 8
  %arrayidx35 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv79, i64 %indvars.iv62, i64 %indvars.iv
  %136 = bitcast double* %arrayidx35 to i64*
  store i64 %135, i64* %136, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %cmp26 = icmp slt i64 %indvars.iv.next, %10
  br i1 %cmp26, label %for.body27, label %for.inc39.loopexit.loopexit, !llvm.loop !19

for.inc39.loopexit.loopexit:                      ; preds = %for.body27
  br label %for.inc39.loopexit

for.inc39.loopexit:                               ; preds = %for.inc39.loopexit.loopexit, %middle.block99
  %indvars.iv.next.lcssa = phi i64 [ %n.vec105, %middle.block99 ], [ %indvars.iv.next, %for.inc39.loopexit.loopexit ]
  %137 = trunc i64 %indvars.iv.next.lcssa to i32
  br label %for.inc39

for.inc39:                                        ; preds = %for.inc39.loopexit, %for.cond4.preheader
  %inc37.lcssa19 = phi i32 [ 0, %for.cond4.preheader ], [ %137, %for.inc39.loopexit ]
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %cmp2 = icmp slt i64 %indvars.iv.next63, %11
  br i1 %cmp2, label %for.cond4.preheader, label %for.inc42.loopexit139

for.inc42.loopexit:                               ; preds = %for.inc39.us
  br label %for.inc42

for.inc42.loopexit139:                            ; preds = %for.inc39
  br label %for.inc42

for.inc42:                                        ; preds = %for.inc42.loopexit139, %for.inc42.loopexit, %for.cond1.preheader
  %inc37.lcssa19.lcssa56 = phi i32 [ %inc37.lcssa19.lcssa55, %for.cond1.preheader ], [ %inc37.lcssa19.us, %for.inc42.loopexit ], [ %inc37.lcssa19, %for.inc42.loopexit139 ]
  %inc.lcssa9.lcssa17.lcssa53 = phi i32 [ %inc.lcssa9.lcssa17.lcssa54, %for.cond1.preheader ], [ %inc.lcssa9.lcssa.us, %for.inc42.loopexit ], [ %inc.lcssa9.lcssa17.lcssa54, %for.inc42.loopexit139 ]
  %indvars.iv.next80 = add nsw i64 %indvars.iv79, 1
  %cmp = icmp slt i64 %indvars.iv.next80, %19
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %cmp, label %for.cond1.preheader, label %for.cond.for.end44_crit_edge

for.cond.for.end44_crit_edge:                     ; preds = %for.inc42
  %138 = trunc i64 %indvars.iv.next80 to i32
  store i32 %138, i32* %r, align 4
  store i32 %inc.lcssa9.lcssa17.lcssa53, i32* %s, align 4
  store i32 %inc37.lcssa19.lcssa56, i32* %p, align 4
  br label %for.end44

for.end44:                                        ; preds = %for.cond.for.end44_crit_edge, %entry
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** %argv) local_unnamed_addr #0 {
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
  %call = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #3
  %0 = bitcast [150 x [140 x [160 x double]]]** %A to i8**
  store i8* %call, i8** %0, align 8
  %call1 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #3
  %1 = bitcast [160 x double]** %sum to i8**
  store i8* %call1, i8** %1, align 8
  %call2 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #3
  %2 = bitcast [160 x [160 x double]]** %C4 to i8**
  store i8* %call2, i8** %2, align 8
  %3 = load i32, i32* %nr, align 4
  %4 = load i32, i32* %nq, align 4
  %5 = load i32, i32* %np, align 4
  %6 = bitcast [150 x [140 x [160 x double]]]** %A to [140 x [160 x double]]**
  %7 = load [140 x [160 x double]]*, [140 x [160 x double]]** %6, align 8
  %arraydecay3 = bitcast i8* %call2 to [160 x double]*
  tail call fastcc void @init_array(i32 %3, i32 %4, i32 %5, [140 x [160 x double]]* %7, [160 x double]* %arraydecay3)
  tail call void (...) @polybench_timer_start() #3
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
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
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
  %25 = bitcast [150 x [140 x [160 x double]]]** %A to i8**
  %26 = load i8*, i8** %25, align 8
  tail call void @free(i8* %26) #3
  %27 = bitcast [160 x double]** %sum to i8**
  %28 = load i8*, i8** %27, align 8
  tail call void @free(i8* %28) #3
  %29 = bitcast [160 x [160 x double]]** %C4 to i8**
  %30 = load i8*, i8** %29, align 8
  tail call void @free(i8* %30) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32 %nr, i32 %nq, i32 %np, [140 x [160 x double]]* %A, [160 x double]* %C4) unnamed_addr #0 {
entry:
  %nr.addr = alloca i32, align 4
  %nq.addr = alloca i32, align 4
  %np.addr = alloca i32, align 4
  %A.addr = alloca [140 x [160 x double]]*, align 8
  %C4.addr = alloca [160 x double]*, align 8
  %i = alloca i32, align 4
  %k = alloca i32, align 4
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
  %wide.trip.count65 = zext i32 %0 to i64
  %cmp212 = icmp sgt i32 %0, 0
  %1 = load i32, i32* %np.addr, align 4
  %wide.trip.count60.1 = zext i32 %1 to i64
  %conv7 = sitofp i32 %1 to double
  %2 = load [140 x [160 x double]]*, [140 x [160 x double]]** %A.addr, align 8
  %3 = load i32, i32* %nr.addr, align 4
  %4 = sext i32 %3 to i64
  %i.promoted17 = load i32, i32* %i, align 4
  br i1 %cmp212, label %for.cond1.preheader.us.preheader, label %for.cond.for.cond18.preheader_crit_edge.loopexit50

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %5 = sext i32 %i.promoted17 to i64
  %6 = icmp sgt i32 %1, 0
  %7 = and i32 %1, 1
  %lcmp.mod73 = icmp eq i32 %7, 0
  %8 = icmp eq i32 %1, 1
  %9 = insertelement <2 x double> undef, double %conv7, i32 0
  %div.us.us.v.i1.2 = shufflevector <2 x double> %9, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc15_crit_edge.us
  %indvars.iv67 = phi i64 [ %5, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next68, %for.cond1.for.inc15_crit_edge.us ]
  br i1 %6, label %for.cond4.preheader.us.us.preheader, label %for.cond1.for.inc15_crit_edge.us

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.us
  br label %for.cond4.preheader.us.us

for.cond1.for.inc15_crit_edge.us.loopexit:        ; preds = %for.cond4.for.inc12_crit_edge.us.us
  br label %for.cond1.for.inc15_crit_edge.us

for.cond1.for.inc15_crit_edge.us:                 ; preds = %for.cond1.for.inc15_crit_edge.us.loopexit, %for.cond1.preheader.us
  %inc.lcssa15.lcssa.us = phi i32 [ 0, %for.cond1.preheader.us ], [ %1, %for.cond1.for.inc15_crit_edge.us.loopexit ]
  %indvars.iv.next68 = add nsw i64 %indvars.iv67, 1
  %cmp.us = icmp slt i64 %indvars.iv.next68, %4
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.cond.for.cond18.preheader_crit_edge.loopexit

for.cond4.preheader.us.us:                        ; preds = %for.cond4.preheader.us.us.preheader, %for.cond4.for.inc12_crit_edge.us.us
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %for.cond4.for.inc12_crit_edge.us.us ], [ 0, %for.cond4.preheader.us.us.preheader ]
  %10 = mul nsw i64 %indvars.iv62, %indvars.iv67
  br i1 %lcmp.mod73, label %for.body6.us.us.prol.loopexit, label %for.body6.us.us.prol

for.body6.us.us.prol:                             ; preds = %for.cond4.preheader.us.us
  %11 = trunc i64 %10 to i32
  %rem.us.us.prol = srem i32 %11, %1
  %conv.us.us.prol = sitofp i32 %rem.us.us.prol to double
  %div.us.us.prol = fdiv double %conv.us.us.prol, %conv7
  %arrayidx11.us.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %2, i64 %indvars.iv67, i64 %indvars.iv62, i64 0
  store double %div.us.us.prol, double* %arrayidx11.us.us.prol, align 8
  br label %for.body6.us.us.prol.loopexit

for.body6.us.us.prol.loopexit:                    ; preds = %for.body6.us.us.prol, %for.cond4.preheader.us.us
  %indvars.iv57.unr.ph = phi i64 [ 1, %for.body6.us.us.prol ], [ 0, %for.cond4.preheader.us.us ]
  br i1 %8, label %for.cond4.for.inc12_crit_edge.us.us, label %for.body6.us.us.preheader

for.body6.us.us.preheader:                        ; preds = %for.body6.us.us.prol.loopexit
  br label %for.body6.us.us

for.cond4.for.inc12_crit_edge.us.us.loopexit:     ; preds = %for.body6.us.us
  br label %for.cond4.for.inc12_crit_edge.us.us

for.cond4.for.inc12_crit_edge.us.us:              ; preds = %for.cond4.for.inc12_crit_edge.us.us.loopexit, %for.body6.us.us.prol.loopexit
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next63, %wide.trip.count65
  br i1 %exitcond66, label %for.cond1.for.inc15_crit_edge.us.loopexit, label %for.cond4.preheader.us.us

for.body6.us.us:                                  ; preds = %for.body6.us.us.preheader, %for.body6.us.us
  %indvars.iv57 = phi i64 [ %indvars.iv.next58.1, %for.body6.us.us ], [ %indvars.iv57.unr.ph, %for.body6.us.us.preheader ]
  %12 = add nsw i64 %10, %indvars.iv57
  %13 = trunc i64 %12 to i32
  %rem.us.us = srem i32 %13, %1
  %conv.us.us = sitofp i32 %rem.us.us to double
  %arrayidx11.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %2, i64 %indvars.iv67, i64 %indvars.iv62, i64 %indvars.iv57
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %14 = add nsw i64 %10, %indvars.iv.next58
  %15 = trunc i64 %14 to i32
  %rem.us.us.1 = srem i32 %15, %1
  %conv.us.us.1 = sitofp i32 %rem.us.us.1 to double
  %div.us.us.v.i0.1 = insertelement <2 x double> undef, double %conv.us.us, i32 0
  %div.us.us.v.i0.2 = insertelement <2 x double> %div.us.us.v.i0.1, double %conv.us.us.1, i32 1
  %div.us.us = fdiv <2 x double> %div.us.us.v.i0.2, %div.us.us.v.i1.2
  %16 = bitcast double* %arrayidx11.us.us to <2 x double>*
  store <2 x double> %div.us.us, <2 x double>* %16, align 8
  %indvars.iv.next58.1 = add nuw nsw i64 %indvars.iv57, 2
  %exitcond61.1 = icmp eq i64 %indvars.iv.next58.1, %wide.trip.count60.1
  br i1 %exitcond61.1, label %for.cond4.for.inc12_crit_edge.us.us.loopexit, label %for.body6.us.us

for.cond.for.cond18.preheader_crit_edge.loopexit: ; preds = %for.cond1.for.inc15_crit_edge.us
  %17 = trunc i64 %indvars.iv.next68 to i32
  br label %for.cond.for.cond18.preheader_crit_edge

for.cond.for.cond18.preheader_crit_edge.loopexit50: ; preds = %for.cond1.preheader.lr.ph
  %k.promoted = load i32, i32* %k, align 4
  %18 = add i32 %i.promoted17, 1
  %19 = icmp sgt i32 %3, %18
  %smax71 = select i1 %19, i32 %3, i32 %18
  br label %for.cond.for.cond18.preheader_crit_edge

for.cond.for.cond18.preheader_crit_edge:          ; preds = %for.cond.for.cond18.preheader_crit_edge.loopexit50, %for.cond.for.cond18.preheader_crit_edge.loopexit
  %inc.lcssa15.lcssa22.lcssa = phi i32 [ %inc.lcssa15.lcssa.us, %for.cond.for.cond18.preheader_crit_edge.loopexit ], [ %k.promoted, %for.cond.for.cond18.preheader_crit_edge.loopexit50 ]
  %inc16.lcssa = phi i32 [ %17, %for.cond.for.cond18.preheader_crit_edge.loopexit ], [ %smax71, %for.cond.for.cond18.preheader_crit_edge.loopexit50 ]
  store i32 %inc16.lcssa, i32* %i, align 4
  store i32 %inc.lcssa15.lcssa22.lcssa, i32* %k, align 4
  %.pr = load i32, i32* %np.addr, align 4
  br label %for.cond18.preheader

for.cond18.preheader:                             ; preds = %for.cond.for.cond18.preheader_crit_edge, %entry
  %20 = phi i32 [ %.pr, %for.cond.for.cond18.preheader_crit_edge ], [ %np, %entry ]
  store i32 0, i32* %i, align 4
  %cmp197 = icmp sgt i32 %20, 0
  br i1 %cmp197, label %for.cond22.preheader.lr.ph, label %for.end40

for.cond22.preheader.lr.ph:                       ; preds = %for.cond18.preheader
  %21 = load i32, i32* %np.addr, align 4
  %wide.trip.count.1 = zext i32 %21 to i64
  %22 = sext i32 %21 to i64
  %cmp235 = icmp sgt i32 %21, 0
  %conv29 = sitofp i32 %21 to double
  %23 = load [160 x double]*, [160 x double]** %C4.addr, align 8
  %i.promoted = load i32, i32* %i, align 4
  br i1 %cmp235, label %for.cond22.preheader.us.preheader, label %for.cond18.for.end40_crit_edge.loopexit48

for.cond22.preheader.us.preheader:                ; preds = %for.cond22.preheader.lr.ph
  %24 = sext i32 %i.promoted to i64
  %25 = and i32 %21, 1
  %lcmp.mod = icmp eq i32 %25, 0
  %26 = icmp eq i32 %21, 1
  %div30.us.prol = fdiv double 0.000000e+00, %conv29
  %27 = insertelement <2 x double> undef, double %conv29, i32 0
  %div30.us.v.i1.2 = shufflevector <2 x double> %27, <2 x double> undef, <2 x i32> zeroinitializer
  br label %for.cond22.preheader.us

for.cond22.preheader.us:                          ; preds = %for.cond22.preheader.us.preheader, %for.cond22.for.inc38_crit_edge.us
  %indvars.iv54 = phi i64 [ %24, %for.cond22.preheader.us.preheader ], [ %indvars.iv.next55, %for.cond22.for.inc38_crit_edge.us ]
  br i1 %lcmp.mod, label %for.body25.us.prol.loopexit, label %for.body25.us.prol

for.body25.us.prol:                               ; preds = %for.cond22.preheader.us
  %arrayidx34.us.prol = getelementptr inbounds [160 x double], [160 x double]* %23, i64 %indvars.iv54, i64 0
  store double %div30.us.prol, double* %arrayidx34.us.prol, align 8
  br label %for.body25.us.prol.loopexit

for.body25.us.prol.loopexit:                      ; preds = %for.body25.us.prol, %for.cond22.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %for.body25.us.prol ], [ 0, %for.cond22.preheader.us ]
  br i1 %26, label %for.cond22.for.inc38_crit_edge.us, label %for.body25.us.preheader

for.body25.us.preheader:                          ; preds = %for.body25.us.prol.loopexit
  br label %for.body25.us

for.body25.us:                                    ; preds = %for.body25.us.preheader, %for.body25.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %for.body25.us ], [ %indvars.iv.unr.ph, %for.body25.us.preheader ]
  %28 = mul nsw i64 %indvars.iv, %indvars.iv54
  %29 = trunc i64 %28 to i32
  %rem27.us = srem i32 %29, %21
  %conv28.us = sitofp i32 %rem27.us to double
  %arrayidx34.us = getelementptr inbounds [160 x double], [160 x double]* %23, i64 %indvars.iv54, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %30 = mul nsw i64 %indvars.iv.next, %indvars.iv54
  %31 = trunc i64 %30 to i32
  %rem27.us.1 = srem i32 %31, %21
  %conv28.us.1 = sitofp i32 %rem27.us.1 to double
  %div30.us.v.i0.1 = insertelement <2 x double> undef, double %conv28.us, i32 0
  %div30.us.v.i0.2 = insertelement <2 x double> %div30.us.v.i0.1, double %conv28.us.1, i32 1
  %div30.us = fdiv <2 x double> %div30.us.v.i0.2, %div30.us.v.i1.2
  %32 = bitcast double* %arrayidx34.us to <2 x double>*
  store <2 x double> %div30.us, <2 x double>* %32, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.cond22.for.inc38_crit_edge.us.loopexit, label %for.body25.us

for.cond22.for.inc38_crit_edge.us.loopexit:       ; preds = %for.body25.us
  br label %for.cond22.for.inc38_crit_edge.us

for.cond22.for.inc38_crit_edge.us:                ; preds = %for.cond22.for.inc38_crit_edge.us.loopexit, %for.body25.us.prol.loopexit
  %indvars.iv.next55 = add nsw i64 %indvars.iv54, 1
  %cmp19.us = icmp slt i64 %indvars.iv.next55, %22
  br i1 %cmp19.us, label %for.cond22.preheader.us, label %for.cond18.for.end40_crit_edge.loopexit

for.cond18.for.end40_crit_edge.loopexit:          ; preds = %for.cond22.for.inc38_crit_edge.us
  %33 = trunc i64 %indvars.iv.next55 to i32
  br label %for.cond18.for.end40_crit_edge

for.cond18.for.end40_crit_edge.loopexit48:        ; preds = %for.cond22.preheader.lr.ph
  %34 = add i32 %i.promoted, 1
  %35 = icmp sgt i32 %21, %34
  %smax = select i1 %35, i32 %21, i32 %34
  br label %for.cond18.for.end40_crit_edge

for.cond18.for.end40_crit_edge:                   ; preds = %for.cond18.for.end40_crit_edge.loopexit48, %for.cond18.for.end40_crit_edge.loopexit
  %inc39.lcssa = phi i32 [ %33, %for.cond18.for.end40_crit_edge.loopexit ], [ %smax, %for.cond18.for.end40_crit_edge.loopexit48 ]
  store i32 %inc39.lcssa, i32* %i, align 4
  br label %for.end40

for.end40:                                        ; preds = %for.cond18.for.end40_crit_edge, %for.cond18.preheader
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32 %nr, i32 %nq, i32 %np, [140 x [160 x double]]* %A) unnamed_addr #0 {
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
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #5
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  store i32 0, i32* %i, align 4
  %3 = load i32, i32* %nr.addr, align 4
  %cmp10 = icmp sgt i32 %3, 0
  br i1 %cmp10, label %for.cond2.preheader.lr.ph, label %for.end23

for.cond2.preheader.lr.ph:                        ; preds = %entry
  %4 = load i32, i32* %nq.addr, align 4
  %5 = sext i32 %4 to i64
  %cmp36 = icmp sgt i32 %4, 0
  %6 = load i32, i32* %np.addr, align 4
  %wide.trip.count = zext i32 %6 to i64
  %7 = load [140 x [160 x double]]*, [140 x [160 x double]]** %A.addr, align 8
  %8 = load i32, i32* %nr.addr, align 4
  %9 = sext i32 %8 to i64
  %i.promoted = load i32, i32* %i, align 4
  br i1 %cmp36, label %for.cond2.preheader.us.preheader, label %for.cond.for.end23_crit_edge.loopexit46

for.cond2.preheader.us.preheader:                 ; preds = %for.cond2.preheader.lr.ph
  %10 = sext i32 %i.promoted to i64
  %11 = icmp sgt i32 %6, 0
  %wide.trip.count51 = zext i32 %4 to i64
  br label %for.cond2.preheader.us

for.cond2.preheader.us:                           ; preds = %for.cond2.preheader.us.preheader, %for.cond2.for.inc21_crit_edge.us
  %indvars.iv53 = phi i64 [ %10, %for.cond2.preheader.us.preheader ], [ %indvars.iv.next54, %for.cond2.for.inc21_crit_edge.us ]
  br i1 %11, label %for.cond5.preheader.us.us.preheader, label %for.cond2.for.inc21_crit_edge.us

for.cond5.preheader.us.us.preheader:              ; preds = %for.cond2.preheader.us
  %12 = mul nsw i64 %5, %indvars.iv53
  %13 = trunc i64 %12 to i32
  br label %for.cond5.preheader.us.us

for.cond2.for.inc21_crit_edge.us.loopexit:        ; preds = %for.cond5.for.inc18_crit_edge.us.us
  br label %for.cond2.for.inc21_crit_edge.us

for.cond2.for.inc21_crit_edge.us:                 ; preds = %for.cond2.for.inc21_crit_edge.us.loopexit, %for.cond2.preheader.us
  %inc.lcssa9.lcssa.us = phi i32 [ 0, %for.cond2.preheader.us ], [ %6, %for.cond2.for.inc21_crit_edge.us.loopexit ]
  %indvars.iv.next54 = add nsw i64 %indvars.iv53, 1
  %cmp.us = icmp slt i64 %indvars.iv.next54, %9
  br i1 %cmp.us, label %for.cond2.preheader.us, label %for.cond.for.end23_crit_edge.loopexit

for.cond5.preheader.us.us:                        ; preds = %for.cond5.preheader.us.us.preheader, %for.cond5.for.inc18_crit_edge.us.us
  %indvars.iv49 = phi i64 [ %indvars.iv.next50, %for.cond5.for.inc18_crit_edge.us.us ], [ 0, %for.cond5.preheader.us.us.preheader ]
  %14 = trunc i64 %indvars.iv49 to i32
  %mul83.us.us = add i32 %14, %13
  %add.us.us = mul i32 %mul83.us.us, %6
  %15 = zext i32 %add.us.us to i64
  br label %for.body7.us.us

for.cond5.for.inc18_crit_edge.us.us:              ; preds = %if.end.us.us
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next50, %wide.trip.count51
  br i1 %exitcond52, label %for.cond2.for.inc21_crit_edge.us.loopexit, label %for.cond5.preheader.us.us

for.body7.us.us:                                  ; preds = %if.end.us.us, %for.cond5.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %if.end.us.us ], [ 0, %for.cond5.preheader.us.us ]
  %16 = add i64 %15, %indvars.iv
  %17 = trunc i64 %16 to i32
  %rem.us.us = srem i32 %17, 20
  %cmp11.us.us = icmp eq i32 %rem.us.us, 0
  br i1 %cmp11.us.us, label %if.then.us.us, label %if.end.us.us

if.then.us.us:                                    ; preds = %for.body7.us.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #5
  br label %if.end.us.us

if.end.us.us:                                     ; preds = %if.then.us.us, %for.body7.us.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %7, i64 %indvars.iv53, i64 %indvars.iv49, i64 %indvars.iv
  %20 = load double, double* %arrayidx16.us.us, align 8
  %call17.us.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %for.cond5.for.inc18_crit_edge.us.us, label %for.body7.us.us

for.cond.for.end23_crit_edge.loopexit:            ; preds = %for.cond2.for.inc21_crit_edge.us
  %21 = trunc i64 %indvars.iv.next54 to i32
  br label %for.cond.for.end23_crit_edge

for.cond.for.end23_crit_edge.loopexit46:          ; preds = %for.cond2.preheader.lr.ph
  %k.promoted = load i32, i32* %k, align 4
  %22 = add i32 %i.promoted, 1
  %23 = icmp sgt i32 %8, %22
  %smax = select i1 %23, i32 %8, i32 %22
  br label %for.cond.for.end23_crit_edge

for.cond.for.end23_crit_edge:                     ; preds = %for.cond.for.end23_crit_edge.loopexit46, %for.cond.for.end23_crit_edge.loopexit
  %inc.lcssa9.lcssa15.lcssa = phi i32 [ %inc.lcssa9.lcssa.us, %for.cond.for.end23_crit_edge.loopexit ], [ %k.promoted, %for.cond.for.end23_crit_edge.loopexit46 ]
  %inc22.lcssa = phi i32 [ %21, %for.cond.for.end23_crit_edge.loopexit ], [ %smax, %for.cond.for.end23_crit_edge.loopexit46 ]
  store i32 %inc22.lcssa, i32* %i, align 4
  store i32 %inc.lcssa9.lcssa15.lcssa, i32* %k, align 4
  br label %for.end23

for.end23:                                        ; preds = %for.cond.for.end23_crit_edge, %entry
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %25) #5
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
