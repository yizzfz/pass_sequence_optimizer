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
  %cmp51 = icmp sgt i32 %0, 0
  br i1 %cmp51, label %for.cond1.preheader.lr.ph, label %for.end44

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %1 = load i32, i32* %nq.addr, align 4
  %2 = load i32, i32* %np.addr, align 4
  %wide.trip.count.1 = zext i32 %2 to i64
  %wide.trip.count73 = zext i32 %2 to i64
  %3 = load double*, double** %sum.addr, align 8
  %4 = bitcast double* %3 to i8*
  %5 = load [140 x [160 x double]]*, [140 x [160 x double]]** %A.addr, align 8
  %6 = load [160 x double]*, [160 x double]** %C4.addr, align 8
  %7 = load i32, i32* %nq.addr, align 4
  %8 = load i32, i32* %np.addr, align 4
  %9 = load i32, i32* %nr.addr, align 4
  %r.promoted = load i32, i32* %r, align 4
  %p.promoted = load i32, i32* %p, align 4
  %s.promoted57 = load i32, i32* %s, align 4
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
  %20 = and i32 %2, 1
  %21 = icmp sgt i64 %16, 1
  %smax = select i1 %21, i64 %16, i64 1
  %22 = icmp sgt i64 %16, 1
  %smax98 = select i1 %22, i64 %16, i64 1
  %scevgep101 = getelementptr double, double* %3, i64 %smax98
  %23 = icmp sgt i64 %16, 1
  %smax108 = select i1 %23, i64 %16, i64 1
  %24 = icmp sgt i64 %16, 1
  %smax117 = select i1 %24, i64 %16, i64 1
  %scevgep120 = getelementptr double, double* %3, i64 %smax117
  %25 = and i64 %smax108, 9223372036854775804
  %26 = add nsw i64 %25, -4
  %27 = lshr exact i64 %26, 2
  %28 = add nuw nsw i64 %27, 1
  %29 = icmp sgt i32 %1, 0
  %30 = icmp sgt i32 %2, 0
  %31 = icmp sgt i32 %2, 0
  %32 = icmp eq i32 %20, 0
  %33 = icmp eq i32 %2, 1
  %sunkaddr = ptrtoint double* %3 to i64
  %34 = ptrtoint double* %3 to i64
  %35 = icmp sgt i32 %2, 0
  %min.iters.check = icmp ult i64 %smax, 4
  %n.vec = and i64 %smax, 9223372036854775804
  %cmp.zero = icmp eq i64 %n.vec, 0
  %xtraiter143 = and i64 %28, 3
  %lcmp.mod144 = icmp eq i64 %xtraiter143, 0
  %36 = icmp ult i64 %26, 12
  %cmp.n = icmp eq i64 %smax, %n.vec
  %37 = icmp sgt i32 %2, 0
  %min.iters.check109 = icmp ult i64 %smax108, 4
  %n.vec112 = and i64 %smax108, 9223372036854775804
  %cmp.zero113 = icmp eq i64 %n.vec112, 0
  %xtraiter = and i64 %28, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %38 = icmp ult i64 %26, 12
  %cmp.n131 = icmp eq i64 %smax108, %n.vec112
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.cond1.preheader.lr.ph, %for.inc42
  %indvar = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvar.next, %for.inc42 ]
  %indvars.iv82 = phi i64 [ %18, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next83, %for.inc42 ]
  %inc.lcssa12.lcssa22.lcssa59 = phi i32 [ %s.promoted57, %for.cond1.preheader.lr.ph ], [ %inc.lcssa12.lcssa22.lcssa58, %for.inc42 ]
  %inc37.lcssa20.lcssa55 = phi i32 [ %p.promoted, %for.cond1.preheader.lr.ph ], [ %inc37.lcssa20.lcssa56, %for.inc42 ]
  %39 = add i64 %18, %indvar
  %40 = add i64 %18, %indvar
  br i1 %29, label %for.cond4.preheader.lr.ph, label %for.inc42

for.cond4.preheader.lr.ph:                        ; preds = %for.cond1.preheader
  br i1 %30, label %for.cond4.preheader.us.preheader, label %for.cond4.preheader.preheader

for.cond4.preheader.preheader:                    ; preds = %for.cond4.preheader.lr.ph
  br label %for.cond4.preheader

for.cond4.preheader.us.preheader:                 ; preds = %for.cond4.preheader.lr.ph
  br label %for.cond4.preheader.us

for.cond4.preheader.us:                           ; preds = %for.cond4.preheader.us.preheader, %for.inc39.us
  %indvars.iv80 = phi i64 [ %indvars.iv.next81, %for.inc39.us ], [ 0, %for.cond4.preheader.us.preheader ]
  %scevgep = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %40, i64 %indvars.iv80, i64 0
  %scevgep99 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %40, i64 %indvars.iv80, i64 %smax98
  br i1 %31, label %for.body6.us.us.preheader, label %for.cond4.for.cond25.preheader_crit_edge.us.loopexit60

for.body6.us.us.preheader:                        ; preds = %for.cond4.preheader.us
  %arrayidx15.us.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv82, i64 %indvars.iv80, i64 0
  br label %for.body6.us.us

for.inc39.us.loopexit.loopexit:                   ; preds = %for.inc36.us
  br label %for.inc39.us.loopexit

for.inc39.us.loopexit:                            ; preds = %for.inc39.us.loopexit.loopexit, %middle.block
  %indvars.iv.next76.lcssa = phi i64 [ %n.vec, %middle.block ], [ %indvars.iv.next76, %for.inc39.us.loopexit.loopexit ]
  %41 = trunc i64 %indvars.iv.next76.lcssa to i32
  br label %for.inc39.us

for.inc39.us:                                     ; preds = %for.inc39.us.loopexit, %for.cond4.for.cond25.preheader_crit_edge.us
  %inc37.lcssa20.us = phi i32 [ 0, %for.cond4.for.cond25.preheader_crit_edge.us ], [ %41, %for.inc39.us.loopexit ]
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %cmp2.us = icmp slt i64 %indvars.iv.next81, %17
  br i1 %cmp2.us, label %for.cond4.preheader.us, label %for.inc42.loopexit

for.inc36.us:                                     ; preds = %for.inc36.us.preheader138, %for.inc36.us
  %indvars.iv75 = phi i64 [ %indvars.iv.next76, %for.inc36.us ], [ %indvars.iv75.ph, %for.inc36.us.preheader138 ]
  %arrayidx29.us = getelementptr inbounds double, double* %3, i64 %indvars.iv75
  %42 = bitcast double* %arrayidx29.us to i64*
  %43 = load i64, i64* %42, align 8
  %arrayidx35.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv82, i64 %indvars.iv80, i64 %indvars.iv75
  %44 = bitcast double* %arrayidx35.us to i64*
  store i64 %43, i64* %44, align 8
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %cmp26.us = icmp slt i64 %indvars.iv.next76, %16
  br i1 %cmp26.us, label %for.inc36.us, label %for.inc39.us.loopexit.loopexit, !llvm.loop !1

for.cond4.for.cond25.preheader_crit_edge.us.loopexit60: ; preds = %for.cond4.preheader.us
  call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 %15, i32 8, i1 false)
  br label %for.cond4.for.cond25.preheader_crit_edge.us

for.cond4.for.cond25.preheader_crit_edge.us.loopexit: ; preds = %for.cond7.for.inc22_crit_edge.us.us
  br label %for.cond4.for.cond25.preheader_crit_edge.us

for.cond4.for.cond25.preheader_crit_edge.us:      ; preds = %for.cond4.for.cond25.preheader_crit_edge.us.loopexit, %for.cond4.for.cond25.preheader_crit_edge.us.loopexit60
  %inc.lcssa12.lcssa.us = phi i32 [ 0, %for.cond4.for.cond25.preheader_crit_edge.us.loopexit60 ], [ %2, %for.cond4.for.cond25.preheader_crit_edge.us.loopexit ]
  br i1 %35, label %for.inc36.us.preheader, label %for.inc39.us

for.inc36.us.preheader:                           ; preds = %for.cond4.for.cond25.preheader_crit_edge.us
  br i1 %min.iters.check, label %for.inc36.us.preheader138, label %min.iters.checked

for.inc36.us.preheader138:                        ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.inc36.us.preheader
  %indvars.iv75.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.inc36.us.preheader ], [ %n.vec, %middle.block ]
  br label %for.inc36.us

min.iters.checked:                                ; preds = %for.inc36.us.preheader
  br i1 %cmp.zero, label %for.inc36.us.preheader138, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep101
  %bound1 = icmp ult double* %3, %scevgep99
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.inc36.us.preheader138, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br i1 %lcmp.mod144, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter145 = phi i64 [ %prol.iter145.sub, %vector.body.prol ], [ %xtraiter143, %vector.body.prol.preheader ]
  %45 = getelementptr inbounds double, double* %3, i64 %index.prol
  %46 = bitcast double* %45 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %46, align 8, !alias.scope !4
  %47 = getelementptr double, double* %45, i64 2
  %48 = bitcast double* %47 to <2 x i64>*
  %wide.load104.prol = load <2 x i64>, <2 x i64>* %48, align 8, !alias.scope !4
  %49 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv82, i64 %indvars.iv80, i64 %index.prol
  %50 = bitcast double* %49 to <2 x i64>*
  store <2 x i64> %wide.load.prol, <2 x i64>* %50, align 8, !alias.scope !7, !noalias !4
  %51 = getelementptr double, double* %49, i64 2
  %52 = bitcast double* %51 to <2 x i64>*
  store <2 x i64> %wide.load104.prol, <2 x i64>* %52, align 8, !alias.scope !7, !noalias !4
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter145.sub = add i64 %prol.iter145, -1
  %prol.iter145.cmp = icmp eq i64 %prol.iter145.sub, 0
  br i1 %prol.iter145.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !9

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  br i1 %36, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %53 = getelementptr inbounds double, double* %3, i64 %index
  %54 = bitcast double* %53 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %54, align 8, !alias.scope !4
  %55 = getelementptr double, double* %53, i64 2
  %56 = bitcast double* %55 to <2 x i64>*
  %wide.load104 = load <2 x i64>, <2 x i64>* %56, align 8, !alias.scope !4
  %57 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv82, i64 %indvars.iv80, i64 %index
  %58 = bitcast double* %57 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %58, align 8, !alias.scope !7, !noalias !4
  %59 = getelementptr double, double* %57, i64 2
  %60 = bitcast double* %59 to <2 x i64>*
  store <2 x i64> %wide.load104, <2 x i64>* %60, align 8, !alias.scope !7, !noalias !4
  %index.next = add i64 %index, 4
  %61 = getelementptr inbounds double, double* %3, i64 %index.next
  %62 = bitcast double* %61 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %62, align 8, !alias.scope !4
  %63 = getelementptr double, double* %61, i64 2
  %64 = bitcast double* %63 to <2 x i64>*
  %wide.load104.1 = load <2 x i64>, <2 x i64>* %64, align 8, !alias.scope !4
  %65 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv82, i64 %indvars.iv80, i64 %index.next
  %66 = bitcast double* %65 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %66, align 8, !alias.scope !7, !noalias !4
  %67 = getelementptr double, double* %65, i64 2
  %68 = bitcast double* %67 to <2 x i64>*
  store <2 x i64> %wide.load104.1, <2 x i64>* %68, align 8, !alias.scope !7, !noalias !4
  %index.next.1 = add i64 %index, 8
  %69 = getelementptr inbounds double, double* %3, i64 %index.next.1
  %70 = bitcast double* %69 to <2 x i64>*
  %wide.load.2 = load <2 x i64>, <2 x i64>* %70, align 8, !alias.scope !4
  %71 = getelementptr double, double* %69, i64 2
  %72 = bitcast double* %71 to <2 x i64>*
  %wide.load104.2 = load <2 x i64>, <2 x i64>* %72, align 8, !alias.scope !4
  %73 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv82, i64 %indvars.iv80, i64 %index.next.1
  %74 = bitcast double* %73 to <2 x i64>*
  store <2 x i64> %wide.load.2, <2 x i64>* %74, align 8, !alias.scope !7, !noalias !4
  %75 = getelementptr double, double* %73, i64 2
  %76 = bitcast double* %75 to <2 x i64>*
  store <2 x i64> %wide.load104.2, <2 x i64>* %76, align 8, !alias.scope !7, !noalias !4
  %index.next.2 = add i64 %index, 12
  %77 = getelementptr inbounds double, double* %3, i64 %index.next.2
  %78 = bitcast double* %77 to <2 x i64>*
  %wide.load.3 = load <2 x i64>, <2 x i64>* %78, align 8, !alias.scope !4
  %79 = getelementptr double, double* %77, i64 2
  %80 = bitcast double* %79 to <2 x i64>*
  %wide.load104.3 = load <2 x i64>, <2 x i64>* %80, align 8, !alias.scope !4
  %81 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv82, i64 %indvars.iv80, i64 %index.next.2
  %82 = bitcast double* %81 to <2 x i64>*
  store <2 x i64> %wide.load.3, <2 x i64>* %82, align 8, !alias.scope !7, !noalias !4
  %83 = getelementptr double, double* %81, i64 2
  %84 = bitcast double* %83 to <2 x i64>*
  store <2 x i64> %wide.load104.3, <2 x i64>* %84, align 8, !alias.scope !7, !noalias !4
  %index.next.3 = add i64 %index, 16
  %85 = icmp eq i64 %index.next.3, %n.vec
  br i1 %85, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !11

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  br i1 %cmp.n, label %for.inc39.us.loopexit, label %for.inc36.us.preheader138

for.body6.us.us:                                  ; preds = %for.body6.us.us.preheader, %for.cond7.for.inc22_crit_edge.us.us
  %indvars.iv71 = phi i64 [ %indvars.iv.next72, %for.cond7.for.inc22_crit_edge.us.us ], [ 0, %for.body6.us.us.preheader ]
  %arrayidx.us.us = getelementptr inbounds double, double* %3, i64 %indvars.iv71
  store double 0.000000e+00, double* %arrayidx.us.us, align 8
  br i1 %32, label %for.inc.us.us.prol.loopexit, label %for.inc.us.us.prol

for.inc.us.us.prol:                               ; preds = %for.body6.us.us
  %86 = load double, double* %arrayidx15.us.us.prol, align 8
  %arrayidx19.us.us.prol = getelementptr inbounds [160 x double], [160 x double]* %6, i64 0, i64 %indvars.iv71
  %87 = load double, double* %arrayidx19.us.us.prol, align 8
  %mul.us.us.prol = fmul double %86, %87
  %sunkaddr84 = shl i64 %indvars.iv71, 3
  %sunkaddr85 = add i64 %34, %sunkaddr84
  %sunkaddr86 = inttoptr i64 %sunkaddr85 to double*
  %88 = load double, double* %sunkaddr86, align 8
  %add.us.us.prol = fadd double %mul.us.us.prol, %88
  store double %add.us.us.prol, double* %sunkaddr86, align 8
  br label %for.inc.us.us.prol.loopexit

for.inc.us.us.prol.loopexit:                      ; preds = %for.inc.us.us.prol, %for.body6.us.us
  %indvars.iv69.unr.ph = phi i64 [ 1, %for.inc.us.us.prol ], [ 0, %for.body6.us.us ]
  br i1 %33, label %for.cond7.for.inc22_crit_edge.us.us, label %for.inc.us.us.preheader

for.inc.us.us.preheader:                          ; preds = %for.inc.us.us.prol.loopexit
  %sunkaddr93 = shl i64 %indvars.iv71, 3
  %sunkaddr94 = add i64 %sunkaddr, %sunkaddr93
  %sunkaddr95 = inttoptr i64 %sunkaddr94 to double*
  br label %for.inc.us.us

for.cond7.for.inc22_crit_edge.us.us.loopexit:     ; preds = %for.inc.us.us
  br label %for.cond7.for.inc22_crit_edge.us.us

for.cond7.for.inc22_crit_edge.us.us:              ; preds = %for.cond7.for.inc22_crit_edge.us.us.loopexit, %for.inc.us.us.prol.loopexit
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond74 = icmp eq i64 %indvars.iv.next72, %wide.trip.count73
  br i1 %exitcond74, label %for.cond4.for.cond25.preheader_crit_edge.us.loopexit, label %for.body6.us.us

for.inc.us.us:                                    ; preds = %for.inc.us.us.preheader, %for.inc.us.us
  %indvars.iv69 = phi i64 [ %indvars.iv.next70.1, %for.inc.us.us ], [ %indvars.iv69.unr.ph, %for.inc.us.us.preheader ]
  %arrayidx15.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv82, i64 %indvars.iv80, i64 %indvars.iv69
  %89 = load double, double* %arrayidx15.us.us, align 8
  %arrayidx19.us.us = getelementptr inbounds [160 x double], [160 x double]* %6, i64 %indvars.iv69, i64 %indvars.iv71
  %90 = load double, double* %arrayidx19.us.us, align 8
  %mul.us.us = fmul double %89, %90
  %91 = load double, double* %sunkaddr95, align 8
  %add.us.us = fadd double %mul.us.us, %91
  store double %add.us.us, double* %sunkaddr95, align 8
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %arrayidx15.us.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv82, i64 %indvars.iv80, i64 %indvars.iv.next70
  %92 = load double, double* %arrayidx15.us.us.1, align 8
  %arrayidx19.us.us.1 = getelementptr inbounds [160 x double], [160 x double]* %6, i64 %indvars.iv.next70, i64 %indvars.iv71
  %93 = load double, double* %arrayidx19.us.us.1, align 8
  %mul.us.us.1 = fmul double %92, %93
  %94 = load double, double* %sunkaddr95, align 8
  %add.us.us.1 = fadd double %mul.us.us.1, %94
  store double %add.us.us.1, double* %sunkaddr95, align 8
  %indvars.iv.next70.1 = add nsw i64 %indvars.iv69, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next70.1, %wide.trip.count.1
  br i1 %exitcond.1, label %for.cond7.for.inc22_crit_edge.us.us.loopexit, label %for.inc.us.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc39
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %for.inc39 ], [ 0, %for.cond4.preheader.preheader ]
  %scevgep115 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %39, i64 %indvars.iv65, i64 0
  %scevgep118 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %39, i64 %indvars.iv65, i64 %smax117
  br i1 %37, label %for.inc36.preheader, label %for.inc39

for.inc36.preheader:                              ; preds = %for.cond4.preheader
  br i1 %min.iters.check109, label %for.inc36.preheader139, label %min.iters.checked110

min.iters.checked110:                             ; preds = %for.inc36.preheader
  br i1 %cmp.zero113, label %for.inc36.preheader139, label %vector.memcheck126

vector.memcheck126:                               ; preds = %min.iters.checked110
  %bound0122 = icmp ult double* %scevgep115, %scevgep120
  %bound1123 = icmp ult double* %3, %scevgep118
  %memcheck.conflict125 = and i1 %bound0122, %bound1123
  br i1 %memcheck.conflict125, label %for.inc36.preheader139, label %vector.body105.preheader

vector.body105.preheader:                         ; preds = %vector.memcheck126
  br i1 %lcmp.mod, label %vector.body105.prol.loopexit, label %vector.body105.prol.preheader

vector.body105.prol.preheader:                    ; preds = %vector.body105.preheader
  br label %vector.body105.prol

vector.body105.prol:                              ; preds = %vector.body105.prol, %vector.body105.prol.preheader
  %index128.prol = phi i64 [ %index.next129.prol, %vector.body105.prol ], [ 0, %vector.body105.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body105.prol ], [ %xtraiter, %vector.body105.prol.preheader ]
  %95 = getelementptr inbounds double, double* %3, i64 %index128.prol
  %96 = bitcast double* %95 to <2 x i64>*
  %wide.load136.prol = load <2 x i64>, <2 x i64>* %96, align 8, !alias.scope !12
  %97 = getelementptr double, double* %95, i64 2
  %98 = bitcast double* %97 to <2 x i64>*
  %wide.load137.prol = load <2 x i64>, <2 x i64>* %98, align 8, !alias.scope !12
  %99 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv82, i64 %indvars.iv65, i64 %index128.prol
  %100 = bitcast double* %99 to <2 x i64>*
  store <2 x i64> %wide.load136.prol, <2 x i64>* %100, align 8, !alias.scope !15, !noalias !12
  %101 = getelementptr double, double* %99, i64 2
  %102 = bitcast double* %101 to <2 x i64>*
  store <2 x i64> %wide.load137.prol, <2 x i64>* %102, align 8, !alias.scope !15, !noalias !12
  %index.next129.prol = add i64 %index128.prol, 4
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body105.prol.loopexit.unr-lcssa, label %vector.body105.prol, !llvm.loop !17

vector.body105.prol.loopexit.unr-lcssa:           ; preds = %vector.body105.prol
  br label %vector.body105.prol.loopexit

vector.body105.prol.loopexit:                     ; preds = %vector.body105.preheader, %vector.body105.prol.loopexit.unr-lcssa
  %index128.unr = phi i64 [ 0, %vector.body105.preheader ], [ %index.next129.prol, %vector.body105.prol.loopexit.unr-lcssa ]
  br i1 %38, label %middle.block106, label %vector.body105.preheader.new

vector.body105.preheader.new:                     ; preds = %vector.body105.prol.loopexit
  br label %vector.body105

vector.body105:                                   ; preds = %vector.body105, %vector.body105.preheader.new
  %index128 = phi i64 [ %index128.unr, %vector.body105.preheader.new ], [ %index.next129.3, %vector.body105 ]
  %103 = getelementptr inbounds double, double* %3, i64 %index128
  %104 = bitcast double* %103 to <2 x i64>*
  %wide.load136 = load <2 x i64>, <2 x i64>* %104, align 8, !alias.scope !12
  %105 = getelementptr double, double* %103, i64 2
  %106 = bitcast double* %105 to <2 x i64>*
  %wide.load137 = load <2 x i64>, <2 x i64>* %106, align 8, !alias.scope !12
  %107 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv82, i64 %indvars.iv65, i64 %index128
  %108 = bitcast double* %107 to <2 x i64>*
  store <2 x i64> %wide.load136, <2 x i64>* %108, align 8, !alias.scope !15, !noalias !12
  %109 = getelementptr double, double* %107, i64 2
  %110 = bitcast double* %109 to <2 x i64>*
  store <2 x i64> %wide.load137, <2 x i64>* %110, align 8, !alias.scope !15, !noalias !12
  %index.next129 = add i64 %index128, 4
  %111 = getelementptr inbounds double, double* %3, i64 %index.next129
  %112 = bitcast double* %111 to <2 x i64>*
  %wide.load136.1 = load <2 x i64>, <2 x i64>* %112, align 8, !alias.scope !12
  %113 = getelementptr double, double* %111, i64 2
  %114 = bitcast double* %113 to <2 x i64>*
  %wide.load137.1 = load <2 x i64>, <2 x i64>* %114, align 8, !alias.scope !12
  %115 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv82, i64 %indvars.iv65, i64 %index.next129
  %116 = bitcast double* %115 to <2 x i64>*
  store <2 x i64> %wide.load136.1, <2 x i64>* %116, align 8, !alias.scope !15, !noalias !12
  %117 = getelementptr double, double* %115, i64 2
  %118 = bitcast double* %117 to <2 x i64>*
  store <2 x i64> %wide.load137.1, <2 x i64>* %118, align 8, !alias.scope !15, !noalias !12
  %index.next129.1 = add i64 %index128, 8
  %119 = getelementptr inbounds double, double* %3, i64 %index.next129.1
  %120 = bitcast double* %119 to <2 x i64>*
  %wide.load136.2 = load <2 x i64>, <2 x i64>* %120, align 8, !alias.scope !12
  %121 = getelementptr double, double* %119, i64 2
  %122 = bitcast double* %121 to <2 x i64>*
  %wide.load137.2 = load <2 x i64>, <2 x i64>* %122, align 8, !alias.scope !12
  %123 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv82, i64 %indvars.iv65, i64 %index.next129.1
  %124 = bitcast double* %123 to <2 x i64>*
  store <2 x i64> %wide.load136.2, <2 x i64>* %124, align 8, !alias.scope !15, !noalias !12
  %125 = getelementptr double, double* %123, i64 2
  %126 = bitcast double* %125 to <2 x i64>*
  store <2 x i64> %wide.load137.2, <2 x i64>* %126, align 8, !alias.scope !15, !noalias !12
  %index.next129.2 = add i64 %index128, 12
  %127 = getelementptr inbounds double, double* %3, i64 %index.next129.2
  %128 = bitcast double* %127 to <2 x i64>*
  %wide.load136.3 = load <2 x i64>, <2 x i64>* %128, align 8, !alias.scope !12
  %129 = getelementptr double, double* %127, i64 2
  %130 = bitcast double* %129 to <2 x i64>*
  %wide.load137.3 = load <2 x i64>, <2 x i64>* %130, align 8, !alias.scope !12
  %131 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv82, i64 %indvars.iv65, i64 %index.next129.2
  %132 = bitcast double* %131 to <2 x i64>*
  store <2 x i64> %wide.load136.3, <2 x i64>* %132, align 8, !alias.scope !15, !noalias !12
  %133 = getelementptr double, double* %131, i64 2
  %134 = bitcast double* %133 to <2 x i64>*
  store <2 x i64> %wide.load137.3, <2 x i64>* %134, align 8, !alias.scope !15, !noalias !12
  %index.next129.3 = add i64 %index128, 16
  %135 = icmp eq i64 %index.next129.3, %n.vec112
  br i1 %135, label %middle.block106.unr-lcssa, label %vector.body105, !llvm.loop !18

middle.block106.unr-lcssa:                        ; preds = %vector.body105
  br label %middle.block106

middle.block106:                                  ; preds = %vector.body105.prol.loopexit, %middle.block106.unr-lcssa
  br i1 %cmp.n131, label %for.inc39.loopexit, label %for.inc36.preheader139

for.inc36.preheader139:                           ; preds = %middle.block106, %vector.memcheck126, %min.iters.checked110, %for.inc36.preheader
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck126 ], [ 0, %min.iters.checked110 ], [ 0, %for.inc36.preheader ], [ %n.vec112, %middle.block106 ]
  br label %for.inc36

for.inc36:                                        ; preds = %for.inc36.preheader139, %for.inc36
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc36 ], [ %indvars.iv.ph, %for.inc36.preheader139 ]
  %arrayidx29 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %136 = bitcast double* %arrayidx29 to i64*
  %137 = load i64, i64* %136, align 8
  %arrayidx35 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %5, i64 %indvars.iv82, i64 %indvars.iv65, i64 %indvars.iv
  %138 = bitcast double* %arrayidx35 to i64*
  store i64 %137, i64* %138, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %cmp26 = icmp slt i64 %indvars.iv.next, %10
  br i1 %cmp26, label %for.inc36, label %for.inc39.loopexit.loopexit, !llvm.loop !19

for.inc39.loopexit.loopexit:                      ; preds = %for.inc36
  br label %for.inc39.loopexit

for.inc39.loopexit:                               ; preds = %for.inc39.loopexit.loopexit, %middle.block106
  %indvars.iv.next.lcssa = phi i64 [ %n.vec112, %middle.block106 ], [ %indvars.iv.next, %for.inc39.loopexit.loopexit ]
  %139 = trunc i64 %indvars.iv.next.lcssa to i32
  br label %for.inc39

for.inc39:                                        ; preds = %for.inc39.loopexit, %for.cond4.preheader
  %inc37.lcssa20 = phi i32 [ 0, %for.cond4.preheader ], [ %139, %for.inc39.loopexit ]
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %cmp2 = icmp slt i64 %indvars.iv.next66, %11
  br i1 %cmp2, label %for.cond4.preheader, label %for.inc42.loopexit140

for.inc42.loopexit:                               ; preds = %for.inc39.us
  br label %for.inc42

for.inc42.loopexit140:                            ; preds = %for.inc39
  br label %for.inc42

for.inc42:                                        ; preds = %for.inc42.loopexit140, %for.inc42.loopexit, %for.cond1.preheader
  %inc.lcssa12.lcssa22.lcssa58 = phi i32 [ %inc.lcssa12.lcssa22.lcssa59, %for.cond1.preheader ], [ %inc.lcssa12.lcssa.us, %for.inc42.loopexit ], [ %inc.lcssa12.lcssa22.lcssa59, %for.inc42.loopexit140 ]
  %inc37.lcssa20.lcssa56 = phi i32 [ %inc37.lcssa20.lcssa55, %for.cond1.preheader ], [ %inc37.lcssa20.us, %for.inc42.loopexit ], [ %inc37.lcssa20, %for.inc42.loopexit140 ]
  %indvars.iv.next83 = add nsw i64 %indvars.iv82, 1
  %cmp = icmp slt i64 %indvars.iv.next83, %19
  %indvar.next = add i64 %indvar, 1
  br i1 %cmp, label %for.cond1.preheader, label %for.cond.for.end44_crit_edge

for.cond.for.end44_crit_edge:                     ; preds = %for.inc42
  %140 = trunc i64 %indvars.iv.next83 to i32
  store i32 %140, i32* %r, align 4
  store i32 %inc37.lcssa20.lcssa56, i32* %p, align 4
  store i32 %inc.lcssa12.lcssa22.lcssa58, i32* %s, align 4
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
  %25 = bitcast [160 x [160 x double]]** %C4 to i8**
  %26 = bitcast [160 x double]** %sum to i8**
  %27 = bitcast [150 x [140 x [160 x double]]]** %A to i8**
  %28 = load i8*, i8** %27, align 8
  tail call void @free(i8* %28) #3
  %29 = load i8*, i8** %26, align 8
  tail call void @free(i8* %29) #3
  %30 = load i8*, i8** %25, align 8
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
  %cmp20 = icmp sgt i32 %nr, 0
  br i1 %cmp20, label %for.cond1.preheader.lr.ph, label %for.cond18.preheader

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %0 = load i32, i32* %nq.addr, align 4
  %wide.trip.count71 = zext i32 %0 to i64
  %cmp215 = icmp sgt i32 %0, 0
  %1 = load i32, i32* %np.addr, align 4
  %wide.trip.count66 = zext i32 %1 to i64
  %2 = load [140 x [160 x double]]*, [140 x [160 x double]]** %A.addr, align 8
  %3 = load i32, i32* %nr.addr, align 4
  %4 = sext i32 %3 to i64
  %i.promoted21 = load i32, i32* %i, align 4
  br i1 %cmp215, label %for.cond1.preheader.us.preheader, label %for.cond.for.cond18.preheader_crit_edge.loopexit56

for.cond1.preheader.us.preheader:                 ; preds = %for.cond1.preheader.lr.ph
  %5 = sext i32 %i.promoted21 to i64
  %conv7.us.us = sitofp i32 %1 to double
  %6 = icmp sgt i32 %1, 0
  %xtraiter78 = and i64 %wide.trip.count66, 1
  %lcmp.mod79 = icmp eq i64 %xtraiter78, 0
  %7 = icmp eq i32 %1, 1
  br label %for.cond1.preheader.us

for.cond1.preheader.us:                           ; preds = %for.cond1.preheader.us.preheader, %for.cond1.for.inc15_crit_edge.us
  %indvars.iv73 = phi i64 [ %5, %for.cond1.preheader.us.preheader ], [ %indvars.iv.next74, %for.cond1.for.inc15_crit_edge.us ]
  br i1 %6, label %for.cond4.preheader.us.us.preheader, label %for.cond1.for.inc15_crit_edge.us

for.cond4.preheader.us.us.preheader:              ; preds = %for.cond1.preheader.us
  br label %for.cond4.preheader.us.us

for.cond1.for.inc15_crit_edge.us.loopexit:        ; preds = %for.cond4.for.inc12_crit_edge.us.us
  br label %for.cond1.for.inc15_crit_edge.us

for.cond1.for.inc15_crit_edge.us:                 ; preds = %for.cond1.for.inc15_crit_edge.us.loopexit, %for.cond1.preheader.us
  %inc.lcssa18.lcssa.us = phi i32 [ 0, %for.cond1.preheader.us ], [ %1, %for.cond1.for.inc15_crit_edge.us.loopexit ]
  %indvars.iv.next74 = add nsw i64 %indvars.iv73, 1
  %cmp.us = icmp slt i64 %indvars.iv.next74, %4
  br i1 %cmp.us, label %for.cond1.preheader.us, label %for.cond.for.cond18.preheader_crit_edge.loopexit

for.cond4.preheader.us.us:                        ; preds = %for.cond4.preheader.us.us.preheader, %for.cond4.for.inc12_crit_edge.us.us
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %for.cond4.for.inc12_crit_edge.us.us ], [ 0, %for.cond4.preheader.us.us.preheader ]
  %8 = mul nsw i64 %indvars.iv68, %indvars.iv73
  br i1 %lcmp.mod79, label %for.inc.us.us.prol.loopexit.unr-lcssa, label %for.inc.us.us.prol.preheader

for.inc.us.us.prol.preheader:                     ; preds = %for.cond4.preheader.us.us
  br label %for.inc.us.us.prol

for.inc.us.us.prol:                               ; preds = %for.inc.us.us.prol.preheader
  %9 = trunc i64 %8 to i32
  %rem.us.us.prol = srem i32 %9, %1
  %conv.us.us.prol = sitofp i32 %rem.us.us.prol to double
  %div.us.us.prol = fdiv double %conv.us.us.prol, %conv7.us.us
  %arrayidx11.us.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %2, i64 %indvars.iv73, i64 %indvars.iv68, i64 0
  store double %div.us.us.prol, double* %arrayidx11.us.us.prol, align 8
  br label %for.inc.us.us.prol.loopexit.unr-lcssa

for.inc.us.us.prol.loopexit.unr-lcssa:            ; preds = %for.cond4.preheader.us.us, %for.inc.us.us.prol
  %indvars.iv63.unr.ph = phi i64 [ 1, %for.inc.us.us.prol ], [ 0, %for.cond4.preheader.us.us ]
  br label %for.inc.us.us.prol.loopexit

for.inc.us.us.prol.loopexit:                      ; preds = %for.inc.us.us.prol.loopexit.unr-lcssa
  br i1 %7, label %for.cond4.for.inc12_crit_edge.us.us, label %for.cond4.preheader.us.us.new

for.cond4.preheader.us.us.new:                    ; preds = %for.inc.us.us.prol.loopexit
  br label %for.inc.us.us

for.cond4.for.inc12_crit_edge.us.us.unr-lcssa:    ; preds = %for.inc.us.us
  br label %for.cond4.for.inc12_crit_edge.us.us

for.cond4.for.inc12_crit_edge.us.us:              ; preds = %for.inc.us.us.prol.loopexit, %for.cond4.for.inc12_crit_edge.us.us.unr-lcssa
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next69, %wide.trip.count71
  br i1 %exitcond72, label %for.cond1.for.inc15_crit_edge.us.loopexit, label %for.cond4.preheader.us.us

for.inc.us.us:                                    ; preds = %for.inc.us.us, %for.cond4.preheader.us.us.new
  %indvars.iv63 = phi i64 [ %indvars.iv63.unr.ph, %for.cond4.preheader.us.us.new ], [ %indvars.iv.next64.1, %for.inc.us.us ]
  %10 = add nsw i64 %8, %indvars.iv63
  %11 = trunc i64 %10 to i32
  %rem.us.us = srem i32 %11, %1
  %conv.us.us = sitofp i32 %rem.us.us to double
  %div.us.us = fdiv double %conv.us.us, %conv7.us.us
  %arrayidx11.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %2, i64 %indvars.iv73, i64 %indvars.iv68, i64 %indvars.iv63
  store double %div.us.us, double* %arrayidx11.us.us, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %12 = add nsw i64 %8, %indvars.iv.next64
  %13 = trunc i64 %12 to i32
  %rem.us.us.1 = srem i32 %13, %1
  %conv.us.us.1 = sitofp i32 %rem.us.us.1 to double
  %div.us.us.1 = fdiv double %conv.us.us.1, %conv7.us.us
  %arrayidx11.us.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %2, i64 %indvars.iv73, i64 %indvars.iv68, i64 %indvars.iv.next64
  store double %div.us.us.1, double* %arrayidx11.us.us.1, align 8
  %indvars.iv.next64.1 = add nsw i64 %indvars.iv63, 2
  %exitcond67.1 = icmp eq i64 %indvars.iv.next64.1, %wide.trip.count66
  br i1 %exitcond67.1, label %for.cond4.for.inc12_crit_edge.us.us.unr-lcssa, label %for.inc.us.us

for.cond.for.cond18.preheader_crit_edge.loopexit: ; preds = %for.cond1.for.inc15_crit_edge.us
  %14 = trunc i64 %indvars.iv.next74 to i32
  br label %for.cond.for.cond18.preheader_crit_edge

for.cond.for.cond18.preheader_crit_edge.loopexit56: ; preds = %for.cond1.preheader.lr.ph
  %k.promoted = load i32, i32* %k, align 4
  %15 = add i32 %i.promoted21, 1
  %16 = icmp sgt i32 %3, %15
  %smax77 = select i1 %16, i32 %3, i32 %15
  br label %for.cond.for.cond18.preheader_crit_edge

for.cond.for.cond18.preheader_crit_edge:          ; preds = %for.cond.for.cond18.preheader_crit_edge.loopexit56, %for.cond.for.cond18.preheader_crit_edge.loopexit
  %inc.lcssa18.lcssa26.lcssa = phi i32 [ %inc.lcssa18.lcssa.us, %for.cond.for.cond18.preheader_crit_edge.loopexit ], [ %k.promoted, %for.cond.for.cond18.preheader_crit_edge.loopexit56 ]
  %inc16.lcssa = phi i32 [ %14, %for.cond.for.cond18.preheader_crit_edge.loopexit ], [ %smax77, %for.cond.for.cond18.preheader_crit_edge.loopexit56 ]
  store i32 %inc16.lcssa, i32* %i, align 4
  store i32 %inc.lcssa18.lcssa26.lcssa, i32* %k, align 4
  %.pr = load i32, i32* %np.addr, align 4
  br label %for.cond18.preheader

for.cond18.preheader:                             ; preds = %for.cond.for.cond18.preheader_crit_edge, %entry
  %17 = phi i32 [ %.pr, %for.cond.for.cond18.preheader_crit_edge ], [ %np, %entry ]
  store i32 0, i32* %i, align 4
  %cmp198 = icmp sgt i32 %17, 0
  br i1 %cmp198, label %for.cond22.preheader.lr.ph, label %for.end40

for.cond22.preheader.lr.ph:                       ; preds = %for.cond18.preheader
  %18 = load i32, i32* %np.addr, align 4
  %wide.trip.count = zext i32 %18 to i64
  %19 = sext i32 %18 to i64
  %cmp235 = icmp sgt i32 %18, 0
  %20 = load [160 x double]*, [160 x double]** %C4.addr, align 8
  %i.promoted = load i32, i32* %i, align 4
  br i1 %cmp235, label %for.cond22.preheader.us.preheader, label %for.cond18.for.end40_crit_edge.loopexit54

for.cond22.preheader.us.preheader:                ; preds = %for.cond22.preheader.lr.ph
  %21 = sext i32 %i.promoted to i64
  %conv29.us = sitofp i32 %18 to double
  %xtraiter = and i64 %wide.trip.count, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %22 = icmp eq i32 %18, 1
  %div30.us.prol = fdiv double 0.000000e+00, %conv29.us
  br label %for.cond22.preheader.us

for.cond22.preheader.us:                          ; preds = %for.cond22.preheader.us.preheader, %for.cond22.for.inc38_crit_edge.us
  %indvars.iv60 = phi i64 [ %21, %for.cond22.preheader.us.preheader ], [ %indvars.iv.next61, %for.cond22.for.inc38_crit_edge.us ]
  br i1 %lcmp.mod, label %for.inc35.us.prol.loopexit.unr-lcssa, label %for.inc35.us.prol.preheader

for.inc35.us.prol.preheader:                      ; preds = %for.cond22.preheader.us
  br label %for.inc35.us.prol

for.inc35.us.prol:                                ; preds = %for.inc35.us.prol.preheader
  %arrayidx34.us.prol = getelementptr inbounds [160 x double], [160 x double]* %20, i64 %indvars.iv60, i64 0
  store double %div30.us.prol, double* %arrayidx34.us.prol, align 8
  br label %for.inc35.us.prol.loopexit.unr-lcssa

for.inc35.us.prol.loopexit.unr-lcssa:             ; preds = %for.cond22.preheader.us, %for.inc35.us.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %for.inc35.us.prol ], [ 0, %for.cond22.preheader.us ]
  br label %for.inc35.us.prol.loopexit

for.inc35.us.prol.loopexit:                       ; preds = %for.inc35.us.prol.loopexit.unr-lcssa
  br i1 %22, label %for.cond22.for.inc38_crit_edge.us, label %for.cond22.preheader.us.new

for.cond22.preheader.us.new:                      ; preds = %for.inc35.us.prol.loopexit
  br label %for.inc35.us

for.inc35.us:                                     ; preds = %for.inc35.us, %for.cond22.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %for.cond22.preheader.us.new ], [ %indvars.iv.next.1, %for.inc35.us ]
  %23 = mul nsw i64 %indvars.iv60, %indvars.iv
  %24 = trunc i64 %23 to i32
  %rem27.us = srem i32 %24, %18
  %conv28.us = sitofp i32 %rem27.us to double
  %div30.us = fdiv double %conv28.us, %conv29.us
  %arrayidx34.us = getelementptr inbounds [160 x double], [160 x double]* %20, i64 %indvars.iv60, i64 %indvars.iv
  store double %div30.us, double* %arrayidx34.us, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %25 = mul nsw i64 %indvars.iv60, %indvars.iv.next
  %26 = trunc i64 %25 to i32
  %rem27.us.1 = srem i32 %26, %18
  %conv28.us.1 = sitofp i32 %rem27.us.1 to double
  %div30.us.1 = fdiv double %conv28.us.1, %conv29.us
  %arrayidx34.us.1 = getelementptr inbounds [160 x double], [160 x double]* %20, i64 %indvars.iv60, i64 %indvars.iv.next
  store double %div30.us.1, double* %arrayidx34.us.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %for.cond22.for.inc38_crit_edge.us.unr-lcssa, label %for.inc35.us

for.cond22.for.inc38_crit_edge.us.unr-lcssa:      ; preds = %for.inc35.us
  br label %for.cond22.for.inc38_crit_edge.us

for.cond22.for.inc38_crit_edge.us:                ; preds = %for.inc35.us.prol.loopexit, %for.cond22.for.inc38_crit_edge.us.unr-lcssa
  %indvars.iv.next61 = add nsw i64 %indvars.iv60, 1
  %cmp19.us = icmp slt i64 %indvars.iv.next61, %19
  br i1 %cmp19.us, label %for.cond22.preheader.us, label %for.cond18.for.end40_crit_edge.loopexit

for.cond18.for.end40_crit_edge.loopexit:          ; preds = %for.cond22.for.inc38_crit_edge.us
  %27 = trunc i64 %indvars.iv.next61 to i32
  br label %for.cond18.for.end40_crit_edge

for.cond18.for.end40_crit_edge.loopexit54:        ; preds = %for.cond22.preheader.lr.ph
  %28 = add i32 %i.promoted, 1
  %29 = icmp sgt i32 %18, %28
  %smax = select i1 %29, i32 %18, i32 %28
  br label %for.cond18.for.end40_crit_edge

for.cond18.for.end40_crit_edge:                   ; preds = %for.cond18.for.end40_crit_edge.loopexit54, %for.cond18.for.end40_crit_edge.loopexit
  %inc39.lcssa = phi i32 [ %27, %for.cond18.for.end40_crit_edge.loopexit ], [ %smax, %for.cond18.for.end40_crit_edge.loopexit54 ]
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
  %wide.trip.count54 = zext i32 %4 to i64
  %11 = icmp sgt i32 %6, 0
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

for.cond5.for.inc18_crit_edge.us.us:              ; preds = %for.inc.us.us
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, %wide.trip.count54
  br i1 %exitcond55, label %for.cond2.for.inc21_crit_edge.us.loopexit, label %for.cond5.preheader.us.us

for.body7.us.us:                                  ; preds = %for.inc.us.us, %for.cond5.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %for.inc.us.us ], [ 0, %for.cond5.preheader.us.us ]
  %16 = add i64 %15, %indvars.iv
  %17 = trunc i64 %16 to i32
  %rem.us.us = srem i32 %17, 20
  %cmp11.us.us = icmp eq i32 %rem.us.us, 0
  br i1 %cmp11.us.us, label %if.then.us.us, label %for.inc.us.us

if.then.us.us:                                    ; preds = %for.body7.us.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #5
  br label %for.inc.us.us

for.inc.us.us:                                    ; preds = %if.then.us.us, %for.body7.us.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %7, i64 %indvars.iv56, i64 %indvars.iv52, i64 %indvars.iv
  %20 = load double, double* %arrayidx16.us.us, align 8
  %call17.us.us = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
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
