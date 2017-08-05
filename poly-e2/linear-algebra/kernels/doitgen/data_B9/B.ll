; ModuleID = 'A.ll'
source_filename = "doitgen.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline norecurse nounwind uwtable
define void @kernel_doitgen(i32 %nr, i32 %nq, i32 %np, [140 x [160 x double]]* nocapture %A, [160 x double]* nocapture readonly %C4, double* nocapture %sum) #0 {
entry:
  %0 = bitcast double* %sum to i8*
  %cmp48 = icmp sgt i32 %nr, 0
  br i1 %cmp48, label %for.cond1.preheader.lr.ph, label %for.end44

for.cond1.preheader.lr.ph:                        ; preds = %entry
  %1 = add i32 %np, -1
  %2 = sext i32 %nq to i64
  %3 = zext i32 %1 to i64
  %4 = shl nuw nsw i64 %3, 3
  %5 = add nuw nsw i64 %4, 8
  %6 = sext i32 %np to i64
  %7 = sext i32 %nq to i64
  %8 = sext i32 %nr to i64
  %9 = icmp sgt i32 %nq, 0
  %10 = icmp sgt i32 %np, 0
  %11 = icmp sgt i32 %np, 0
  %sunkaddr = ptrtoint double* %sum to i64
  %wide.trip.count64 = zext i32 %1 to i64
  %12 = icmp sgt i32 %np, 0
  %wide.trip.count70 = zext i32 %1 to i64
  %13 = icmp sgt i32 %np, 0
  %wide.trip.count = zext i32 %1 to i64
  %14 = add nuw nsw i64 %wide.trip.count70, 1
  %scevgep87 = getelementptr double, double* %sum, i64 %14
  %scevgep104 = getelementptr double, double* %sum, i64 %14
  %15 = and i64 %14, 8589934588
  %16 = add nsw i64 %15, -4
  %17 = lshr exact i64 %16, 2
  %18 = add nuw nsw i64 %17, 1
  %19 = add nuw nsw i64 %wide.trip.count70, 1
  %20 = add nuw nsw i64 %wide.trip.count70, 1
  %xtraiter128 = and i64 %14, 1
  %lcmp.mod129 = icmp eq i64 %xtraiter128, 0
  %21 = icmp eq i32 %1, 0
  %min.iters.check = icmp ult i64 %14, 4
  %n.vec = and i64 %14, 8589934588
  %cmp.zero = icmp eq i64 %n.vec, 0
  %xtraiter130 = and i64 %18, 3
  %lcmp.mod131 = icmp eq i64 %xtraiter130, 0
  %22 = icmp ult i64 %16, 12
  %cmp.n = icmp eq i64 %14, %n.vec
  %min.iters.check94 = icmp ult i64 %14, 4
  %n.vec97 = and i64 %14, 8589934588
  %cmp.zero98 = icmp eq i64 %n.vec97, 0
  %xtraiter = and i64 %18, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %23 = icmp ult i64 %16, 12
  %cmp.n115 = icmp eq i64 %14, %n.vec97
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc42, %for.cond1.preheader.lr.ph
  %indvars.iv77 = phi i64 [ 0, %for.cond1.preheader.lr.ph ], [ %indvars.iv.next78, %for.inc42 ]
  br i1 %9, label %for.cond4.preheader.lr.ph, label %for.inc42

for.cond4.preheader.lr.ph:                        ; preds = %for.cond1.preheader
  br i1 %10, label %for.cond4.preheader.us.preheader, label %for.cond4.preheader.preheader

for.cond4.preheader.preheader:                    ; preds = %for.cond4.preheader.lr.ph
  br label %for.cond4.preheader

for.cond4.preheader.us.preheader:                 ; preds = %for.cond4.preheader.lr.ph
  br label %for.cond4.preheader.us

for.cond4.preheader.us:                           ; preds = %for.cond4.preheader.us.preheader, %for.inc39.us
  %indvars.iv75 = phi i64 [ %indvars.iv.next76, %for.inc39.us ], [ 0, %for.cond4.preheader.us.preheader ]
  %scevgep = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv77, i64 %indvars.iv75, i64 0
  %scevgep85 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv77, i64 %indvars.iv75, i64 %14
  br i1 %11, label %for.body6.us.us.preheader, label %for.cond4.for.cond25.preheader_crit_edge.us.loopexit50

for.body6.us.us.preheader:                        ; preds = %for.cond4.preheader.us
  %arrayidx15.us.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv77, i64 %indvars.iv75, i64 0
  br label %for.body6.us.us

for.inc39.us.loopexit.unr-lcssa:                  ; preds = %for.inc36.us
  br label %for.inc39.us.loopexit

for.inc39.us.loopexit:                            ; preds = %for.inc36.us.prol.loopexit, %for.inc39.us.loopexit.unr-lcssa
  br label %for.inc39.us

for.inc39.us:                                     ; preds = %for.inc39.us.loopexit, %middle.block, %for.cond4.for.cond25.preheader_crit_edge.us
  %indvars.iv.next76 = add nuw i64 %indvars.iv75, 1
  %cmp2.us = icmp slt i64 %indvars.iv.next76, %7
  br i1 %cmp2.us, label %for.cond4.preheader.us, label %for.inc42.loopexit

for.inc36.us:                                     ; preds = %for.inc36.us, %for.inc36.us.preheader122.new
  %indvars.iv68 = phi i64 [ %indvars.iv68.unr, %for.inc36.us.preheader122.new ], [ %indvars.iv.next69.3, %for.inc36.us ]
  %arrayidx29.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv68
  %24 = bitcast double* %arrayidx29.us to i64*
  %25 = load i64, i64* %24, align 8
  %arrayidx35.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv77, i64 %indvars.iv75, i64 %indvars.iv68
  %26 = bitcast double* %arrayidx35.us to i64*
  store i64 %25, i64* %26, align 8
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %arrayidx29.us.1 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next69
  %27 = bitcast double* %arrayidx29.us.1 to i64*
  %28 = load i64, i64* %27, align 8
  %arrayidx35.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv77, i64 %indvars.iv75, i64 %indvars.iv.next69
  %29 = bitcast double* %arrayidx35.us.1 to i64*
  store i64 %28, i64* %29, align 8
  %indvars.iv.next69.1 = add nsw i64 %indvars.iv68, 2
  %arrayidx29.us.2 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next69.1
  %30 = bitcast double* %arrayidx29.us.2 to i64*
  %31 = load i64, i64* %30, align 8
  %arrayidx35.us.2 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv77, i64 %indvars.iv75, i64 %indvars.iv.next69.1
  %32 = bitcast double* %arrayidx35.us.2 to i64*
  store i64 %31, i64* %32, align 8
  %indvars.iv.next69.2 = add nsw i64 %indvars.iv68, 3
  %arrayidx29.us.3 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next69.2
  %33 = bitcast double* %arrayidx29.us.3 to i64*
  %34 = load i64, i64* %33, align 8
  %arrayidx35.us.3 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv77, i64 %indvars.iv75, i64 %indvars.iv.next69.2
  %35 = bitcast double* %arrayidx35.us.3 to i64*
  store i64 %34, i64* %35, align 8
  %exitcond71.3 = icmp eq i64 %indvars.iv.next69.2, %wide.trip.count70
  %indvars.iv.next69.3 = add nsw i64 %indvars.iv68, 4
  br i1 %exitcond71.3, label %for.inc39.us.loopexit.unr-lcssa, label %for.inc36.us, !llvm.loop !1

for.cond4.for.cond25.preheader_crit_edge.us.loopexit50: ; preds = %for.cond4.preheader.us
  call void @llvm.memset.p0i8.i64(i8* %0, i8 0, i64 %5, i32 8, i1 false)
  br label %for.cond4.for.cond25.preheader_crit_edge.us

for.cond4.for.cond25.preheader_crit_edge.us.loopexit: ; preds = %for.cond7.for.inc22_crit_edge.us.us
  br label %for.cond4.for.cond25.preheader_crit_edge.us

for.cond4.for.cond25.preheader_crit_edge.us:      ; preds = %for.cond4.for.cond25.preheader_crit_edge.us.loopexit, %for.cond4.for.cond25.preheader_crit_edge.us.loopexit50
  br i1 %12, label %for.inc36.us.preheader, label %for.inc39.us

for.inc36.us.preheader:                           ; preds = %for.cond4.for.cond25.preheader_crit_edge.us
  br i1 %min.iters.check, label %for.inc36.us.preheader122, label %min.iters.checked

for.inc36.us.preheader122:                        ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %for.inc36.us.preheader
  %indvars.iv68.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %for.inc36.us.preheader ], [ %n.vec, %middle.block ]
  %36 = sub nsw i64 %20, %indvars.iv68.ph
  %37 = sub nsw i64 %wide.trip.count70, %indvars.iv68.ph
  %xtraiter133 = and i64 %36, 3
  %lcmp.mod134 = icmp eq i64 %xtraiter133, 0
  br i1 %lcmp.mod134, label %for.inc36.us.prol.loopexit, label %for.inc36.us.prol.preheader

for.inc36.us.prol.preheader:                      ; preds = %for.inc36.us.preheader122
  br label %for.inc36.us.prol

for.inc36.us.prol:                                ; preds = %for.inc36.us.prol, %for.inc36.us.prol.preheader
  %indvars.iv68.prol = phi i64 [ %indvars.iv.next69.prol, %for.inc36.us.prol ], [ %indvars.iv68.ph, %for.inc36.us.prol.preheader ]
  %prol.iter135 = phi i64 [ %prol.iter135.sub, %for.inc36.us.prol ], [ %xtraiter133, %for.inc36.us.prol.preheader ]
  %arrayidx29.us.prol = getelementptr inbounds double, double* %sum, i64 %indvars.iv68.prol
  %38 = bitcast double* %arrayidx29.us.prol to i64*
  %39 = load i64, i64* %38, align 8
  %arrayidx35.us.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv77, i64 %indvars.iv75, i64 %indvars.iv68.prol
  %40 = bitcast double* %arrayidx35.us.prol to i64*
  store i64 %39, i64* %40, align 8
  %indvars.iv.next69.prol = add nuw nsw i64 %indvars.iv68.prol, 1
  %prol.iter135.sub = add i64 %prol.iter135, -1
  %prol.iter135.cmp = icmp eq i64 %prol.iter135.sub, 0
  br i1 %prol.iter135.cmp, label %for.inc36.us.prol.loopexit.unr-lcssa, label %for.inc36.us.prol, !llvm.loop !4

for.inc36.us.prol.loopexit.unr-lcssa:             ; preds = %for.inc36.us.prol
  br label %for.inc36.us.prol.loopexit

for.inc36.us.prol.loopexit:                       ; preds = %for.inc36.us.preheader122, %for.inc36.us.prol.loopexit.unr-lcssa
  %indvars.iv68.unr = phi i64 [ %indvars.iv68.ph, %for.inc36.us.preheader122 ], [ %indvars.iv.next69.prol, %for.inc36.us.prol.loopexit.unr-lcssa ]
  %41 = icmp ult i64 %37, 3
  br i1 %41, label %for.inc39.us.loopexit, label %for.inc36.us.preheader122.new

for.inc36.us.preheader122.new:                    ; preds = %for.inc36.us.prol.loopexit
  br label %for.inc36.us

min.iters.checked:                                ; preds = %for.inc36.us.preheader
  br i1 %cmp.zero, label %for.inc36.us.preheader122, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep87
  %bound1 = icmp ugt double* %scevgep85, %sum
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %for.inc36.us.preheader122, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br i1 %lcmp.mod131, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter132 = phi i64 [ %prol.iter132.sub, %vector.body.prol ], [ %xtraiter130, %vector.body.prol.preheader ]
  %42 = getelementptr inbounds double, double* %sum, i64 %index.prol
  %43 = bitcast double* %42 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %43, align 8, !alias.scope !6
  %44 = getelementptr double, double* %42, i64 2
  %45 = bitcast double* %44 to <2 x i64>*
  %wide.load90.prol = load <2 x i64>, <2 x i64>* %45, align 8, !alias.scope !6
  %46 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv77, i64 %indvars.iv75, i64 %index.prol
  %47 = bitcast double* %46 to <2 x i64>*
  store <2 x i64> %wide.load.prol, <2 x i64>* %47, align 8, !alias.scope !9, !noalias !6
  %48 = getelementptr double, double* %46, i64 2
  %49 = bitcast double* %48 to <2 x i64>*
  store <2 x i64> %wide.load90.prol, <2 x i64>* %49, align 8, !alias.scope !9, !noalias !6
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter132.sub = add i64 %prol.iter132, -1
  %prol.iter132.cmp = icmp eq i64 %prol.iter132.sub, 0
  br i1 %prol.iter132.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !11

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  br i1 %22, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %50 = getelementptr inbounds double, double* %sum, i64 %index
  %51 = bitcast double* %50 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %51, align 8, !alias.scope !6
  %52 = getelementptr double, double* %50, i64 2
  %53 = bitcast double* %52 to <2 x i64>*
  %wide.load90 = load <2 x i64>, <2 x i64>* %53, align 8, !alias.scope !6
  %54 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv77, i64 %indvars.iv75, i64 %index
  %55 = bitcast double* %54 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %55, align 8, !alias.scope !9, !noalias !6
  %56 = getelementptr double, double* %54, i64 2
  %57 = bitcast double* %56 to <2 x i64>*
  store <2 x i64> %wide.load90, <2 x i64>* %57, align 8, !alias.scope !9, !noalias !6
  %index.next = add i64 %index, 4
  %58 = getelementptr inbounds double, double* %sum, i64 %index.next
  %59 = bitcast double* %58 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %59, align 8, !alias.scope !6
  %60 = getelementptr double, double* %58, i64 2
  %61 = bitcast double* %60 to <2 x i64>*
  %wide.load90.1 = load <2 x i64>, <2 x i64>* %61, align 8, !alias.scope !6
  %62 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv77, i64 %indvars.iv75, i64 %index.next
  %63 = bitcast double* %62 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %63, align 8, !alias.scope !9, !noalias !6
  %64 = getelementptr double, double* %62, i64 2
  %65 = bitcast double* %64 to <2 x i64>*
  store <2 x i64> %wide.load90.1, <2 x i64>* %65, align 8, !alias.scope !9, !noalias !6
  %index.next.1 = add i64 %index, 8
  %66 = getelementptr inbounds double, double* %sum, i64 %index.next.1
  %67 = bitcast double* %66 to <2 x i64>*
  %wide.load.2 = load <2 x i64>, <2 x i64>* %67, align 8, !alias.scope !6
  %68 = getelementptr double, double* %66, i64 2
  %69 = bitcast double* %68 to <2 x i64>*
  %wide.load90.2 = load <2 x i64>, <2 x i64>* %69, align 8, !alias.scope !6
  %70 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv77, i64 %indvars.iv75, i64 %index.next.1
  %71 = bitcast double* %70 to <2 x i64>*
  store <2 x i64> %wide.load.2, <2 x i64>* %71, align 8, !alias.scope !9, !noalias !6
  %72 = getelementptr double, double* %70, i64 2
  %73 = bitcast double* %72 to <2 x i64>*
  store <2 x i64> %wide.load90.2, <2 x i64>* %73, align 8, !alias.scope !9, !noalias !6
  %index.next.2 = add i64 %index, 12
  %74 = getelementptr inbounds double, double* %sum, i64 %index.next.2
  %75 = bitcast double* %74 to <2 x i64>*
  %wide.load.3 = load <2 x i64>, <2 x i64>* %75, align 8, !alias.scope !6
  %76 = getelementptr double, double* %74, i64 2
  %77 = bitcast double* %76 to <2 x i64>*
  %wide.load90.3 = load <2 x i64>, <2 x i64>* %77, align 8, !alias.scope !6
  %78 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv77, i64 %indvars.iv75, i64 %index.next.2
  %79 = bitcast double* %78 to <2 x i64>*
  store <2 x i64> %wide.load.3, <2 x i64>* %79, align 8, !alias.scope !9, !noalias !6
  %80 = getelementptr double, double* %78, i64 2
  %81 = bitcast double* %80 to <2 x i64>*
  store <2 x i64> %wide.load90.3, <2 x i64>* %81, align 8, !alias.scope !9, !noalias !6
  %index.next.3 = add i64 %index, 16
  %82 = icmp eq i64 %index.next.3, %n.vec
  br i1 %82, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !12

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  br i1 %cmp.n, label %for.inc39.us, label %for.inc36.us.preheader122

for.body6.us.us:                                  ; preds = %for.body6.us.us.preheader, %for.cond7.for.inc22_crit_edge.us.us
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %for.cond7.for.inc22_crit_edge.us.us ], [ 0, %for.body6.us.us.preheader ]
  %arrayidx.us.us = getelementptr inbounds double, double* %sum, i64 %indvars.iv66
  store double 0.000000e+00, double* %arrayidx.us.us, align 8
  %sunkaddr79 = shl i64 %indvars.iv66, 3
  %sunkaddr80 = add i64 %sunkaddr, %sunkaddr79
  %sunkaddr81 = inttoptr i64 %sunkaddr80 to double*
  br i1 %lcmp.mod129, label %for.inc.us.us.prol.loopexit.unr-lcssa, label %for.inc.us.us.prol.preheader

for.inc.us.us.prol.preheader:                     ; preds = %for.body6.us.us
  br label %for.inc.us.us.prol

for.inc.us.us.prol:                               ; preds = %for.inc.us.us.prol.preheader
  %83 = load double, double* %arrayidx15.us.us.prol, align 8
  %arrayidx19.us.us.prol = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 0, i64 %indvars.iv66
  %84 = load double, double* %arrayidx19.us.us.prol, align 8
  %mul.us.us.prol = fmul double %83, %84
  %85 = load double, double* %sunkaddr81, align 8
  %add.us.us.prol = fadd double %85, %mul.us.us.prol
  store double %add.us.us.prol, double* %sunkaddr81, align 8
  br label %for.inc.us.us.prol.loopexit.unr-lcssa

for.inc.us.us.prol.loopexit.unr-lcssa:            ; preds = %for.body6.us.us, %for.inc.us.us.prol
  %indvars.iv62.unr.ph = phi i64 [ 1, %for.inc.us.us.prol ], [ 0, %for.body6.us.us ]
  br label %for.inc.us.us.prol.loopexit

for.inc.us.us.prol.loopexit:                      ; preds = %for.inc.us.us.prol.loopexit.unr-lcssa
  br i1 %21, label %for.cond7.for.inc22_crit_edge.us.us, label %for.body6.us.us.new

for.body6.us.us.new:                              ; preds = %for.inc.us.us.prol.loopexit
  br label %for.inc.us.us

for.cond7.for.inc22_crit_edge.us.us.unr-lcssa:    ; preds = %for.inc.us.us
  br label %for.cond7.for.inc22_crit_edge.us.us

for.cond7.for.inc22_crit_edge.us.us:              ; preds = %for.inc.us.us.prol.loopexit, %for.cond7.for.inc22_crit_edge.us.us.unr-lcssa
  %indvars.iv.next67 = add nuw i64 %indvars.iv66, 1
  %cmp5.us.us = icmp slt i64 %indvars.iv.next67, %6
  br i1 %cmp5.us.us, label %for.body6.us.us, label %for.cond4.for.cond25.preheader_crit_edge.us.loopexit

for.inc.us.us:                                    ; preds = %for.inc.us.us, %for.body6.us.us.new
  %indvars.iv62 = phi i64 [ %indvars.iv62.unr.ph, %for.body6.us.us.new ], [ %indvars.iv.next63.1, %for.inc.us.us ]
  %arrayidx15.us.us = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv77, i64 %indvars.iv75, i64 %indvars.iv62
  %86 = load double, double* %arrayidx15.us.us, align 8
  %arrayidx19.us.us = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv62, i64 %indvars.iv66
  %87 = load double, double* %arrayidx19.us.us, align 8
  %mul.us.us = fmul double %86, %87
  %88 = load double, double* %sunkaddr81, align 8
  %add.us.us = fadd double %88, %mul.us.us
  store double %add.us.us, double* %sunkaddr81, align 8
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %arrayidx15.us.us.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv77, i64 %indvars.iv75, i64 %indvars.iv.next63
  %89 = load double, double* %arrayidx15.us.us.1, align 8
  %arrayidx19.us.us.1 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv.next63, i64 %indvars.iv66
  %90 = load double, double* %arrayidx19.us.us.1, align 8
  %mul.us.us.1 = fmul double %89, %90
  %91 = load double, double* %sunkaddr81, align 8
  %add.us.us.1 = fadd double %91, %mul.us.us.1
  store double %add.us.us.1, double* %sunkaddr81, align 8
  %exitcond65.1 = icmp eq i64 %indvars.iv.next63, %wide.trip.count64
  %indvars.iv.next63.1 = add nsw i64 %indvars.iv62, 2
  br i1 %exitcond65.1, label %for.cond7.for.inc22_crit_edge.us.us.unr-lcssa, label %for.inc.us.us

for.cond4.preheader:                              ; preds = %for.cond4.preheader.preheader, %for.inc39
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %for.inc39 ], [ 0, %for.cond4.preheader.preheader ]
  %scevgep100 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv77, i64 %indvars.iv55, i64 0
  %scevgep102 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv77, i64 %indvars.iv55, i64 %14
  br i1 %13, label %for.inc36.preheader, label %for.inc39

for.inc36.preheader:                              ; preds = %for.cond4.preheader
  br i1 %min.iters.check94, label %for.inc36.preheader123, label %min.iters.checked95

min.iters.checked95:                              ; preds = %for.inc36.preheader
  br i1 %cmp.zero98, label %for.inc36.preheader123, label %vector.memcheck110

vector.memcheck110:                               ; preds = %min.iters.checked95
  %bound0106 = icmp ult double* %scevgep100, %scevgep104
  %bound1107 = icmp ugt double* %scevgep102, %sum
  %memcheck.conflict109 = and i1 %bound0106, %bound1107
  br i1 %memcheck.conflict109, label %for.inc36.preheader123, label %vector.body91.preheader

vector.body91.preheader:                          ; preds = %vector.memcheck110
  br i1 %lcmp.mod, label %vector.body91.prol.loopexit, label %vector.body91.prol.preheader

vector.body91.prol.preheader:                     ; preds = %vector.body91.preheader
  br label %vector.body91.prol

vector.body91.prol:                               ; preds = %vector.body91.prol, %vector.body91.prol.preheader
  %index112.prol = phi i64 [ %index.next113.prol, %vector.body91.prol ], [ 0, %vector.body91.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body91.prol ], [ %xtraiter, %vector.body91.prol.preheader ]
  %92 = getelementptr inbounds double, double* %sum, i64 %index112.prol
  %93 = bitcast double* %92 to <2 x i64>*
  %wide.load120.prol = load <2 x i64>, <2 x i64>* %93, align 8, !alias.scope !13
  %94 = getelementptr double, double* %92, i64 2
  %95 = bitcast double* %94 to <2 x i64>*
  %wide.load121.prol = load <2 x i64>, <2 x i64>* %95, align 8, !alias.scope !13
  %96 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv77, i64 %indvars.iv55, i64 %index112.prol
  %97 = bitcast double* %96 to <2 x i64>*
  store <2 x i64> %wide.load120.prol, <2 x i64>* %97, align 8, !alias.scope !16, !noalias !13
  %98 = getelementptr double, double* %96, i64 2
  %99 = bitcast double* %98 to <2 x i64>*
  store <2 x i64> %wide.load121.prol, <2 x i64>* %99, align 8, !alias.scope !16, !noalias !13
  %index.next113.prol = add i64 %index112.prol, 4
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body91.prol.loopexit.unr-lcssa, label %vector.body91.prol, !llvm.loop !18

vector.body91.prol.loopexit.unr-lcssa:            ; preds = %vector.body91.prol
  br label %vector.body91.prol.loopexit

vector.body91.prol.loopexit:                      ; preds = %vector.body91.preheader, %vector.body91.prol.loopexit.unr-lcssa
  %index112.unr = phi i64 [ 0, %vector.body91.preheader ], [ %index.next113.prol, %vector.body91.prol.loopexit.unr-lcssa ]
  br i1 %23, label %middle.block92, label %vector.body91.preheader.new

vector.body91.preheader.new:                      ; preds = %vector.body91.prol.loopexit
  br label %vector.body91

vector.body91:                                    ; preds = %vector.body91, %vector.body91.preheader.new
  %index112 = phi i64 [ %index112.unr, %vector.body91.preheader.new ], [ %index.next113.3, %vector.body91 ]
  %100 = getelementptr inbounds double, double* %sum, i64 %index112
  %101 = bitcast double* %100 to <2 x i64>*
  %wide.load120 = load <2 x i64>, <2 x i64>* %101, align 8, !alias.scope !13
  %102 = getelementptr double, double* %100, i64 2
  %103 = bitcast double* %102 to <2 x i64>*
  %wide.load121 = load <2 x i64>, <2 x i64>* %103, align 8, !alias.scope !13
  %104 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv77, i64 %indvars.iv55, i64 %index112
  %105 = bitcast double* %104 to <2 x i64>*
  store <2 x i64> %wide.load120, <2 x i64>* %105, align 8, !alias.scope !16, !noalias !13
  %106 = getelementptr double, double* %104, i64 2
  %107 = bitcast double* %106 to <2 x i64>*
  store <2 x i64> %wide.load121, <2 x i64>* %107, align 8, !alias.scope !16, !noalias !13
  %index.next113 = add i64 %index112, 4
  %108 = getelementptr inbounds double, double* %sum, i64 %index.next113
  %109 = bitcast double* %108 to <2 x i64>*
  %wide.load120.1 = load <2 x i64>, <2 x i64>* %109, align 8, !alias.scope !13
  %110 = getelementptr double, double* %108, i64 2
  %111 = bitcast double* %110 to <2 x i64>*
  %wide.load121.1 = load <2 x i64>, <2 x i64>* %111, align 8, !alias.scope !13
  %112 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv77, i64 %indvars.iv55, i64 %index.next113
  %113 = bitcast double* %112 to <2 x i64>*
  store <2 x i64> %wide.load120.1, <2 x i64>* %113, align 8, !alias.scope !16, !noalias !13
  %114 = getelementptr double, double* %112, i64 2
  %115 = bitcast double* %114 to <2 x i64>*
  store <2 x i64> %wide.load121.1, <2 x i64>* %115, align 8, !alias.scope !16, !noalias !13
  %index.next113.1 = add i64 %index112, 8
  %116 = getelementptr inbounds double, double* %sum, i64 %index.next113.1
  %117 = bitcast double* %116 to <2 x i64>*
  %wide.load120.2 = load <2 x i64>, <2 x i64>* %117, align 8, !alias.scope !13
  %118 = getelementptr double, double* %116, i64 2
  %119 = bitcast double* %118 to <2 x i64>*
  %wide.load121.2 = load <2 x i64>, <2 x i64>* %119, align 8, !alias.scope !13
  %120 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv77, i64 %indvars.iv55, i64 %index.next113.1
  %121 = bitcast double* %120 to <2 x i64>*
  store <2 x i64> %wide.load120.2, <2 x i64>* %121, align 8, !alias.scope !16, !noalias !13
  %122 = getelementptr double, double* %120, i64 2
  %123 = bitcast double* %122 to <2 x i64>*
  store <2 x i64> %wide.load121.2, <2 x i64>* %123, align 8, !alias.scope !16, !noalias !13
  %index.next113.2 = add i64 %index112, 12
  %124 = getelementptr inbounds double, double* %sum, i64 %index.next113.2
  %125 = bitcast double* %124 to <2 x i64>*
  %wide.load120.3 = load <2 x i64>, <2 x i64>* %125, align 8, !alias.scope !13
  %126 = getelementptr double, double* %124, i64 2
  %127 = bitcast double* %126 to <2 x i64>*
  %wide.load121.3 = load <2 x i64>, <2 x i64>* %127, align 8, !alias.scope !13
  %128 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv77, i64 %indvars.iv55, i64 %index.next113.2
  %129 = bitcast double* %128 to <2 x i64>*
  store <2 x i64> %wide.load120.3, <2 x i64>* %129, align 8, !alias.scope !16, !noalias !13
  %130 = getelementptr double, double* %128, i64 2
  %131 = bitcast double* %130 to <2 x i64>*
  store <2 x i64> %wide.load121.3, <2 x i64>* %131, align 8, !alias.scope !16, !noalias !13
  %index.next113.3 = add i64 %index112, 16
  %132 = icmp eq i64 %index.next113.3, %n.vec97
  br i1 %132, label %middle.block92.unr-lcssa, label %vector.body91, !llvm.loop !19

middle.block92.unr-lcssa:                         ; preds = %vector.body91
  br label %middle.block92

middle.block92:                                   ; preds = %vector.body91.prol.loopexit, %middle.block92.unr-lcssa
  br i1 %cmp.n115, label %for.inc39, label %for.inc36.preheader123

for.inc36.preheader123:                           ; preds = %middle.block92, %vector.memcheck110, %min.iters.checked95, %for.inc36.preheader
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck110 ], [ 0, %min.iters.checked95 ], [ 0, %for.inc36.preheader ], [ %n.vec97, %middle.block92 ]
  %133 = sub nsw i64 %19, %indvars.iv.ph
  %134 = sub nsw i64 %wide.trip.count70, %indvars.iv.ph
  %xtraiter125 = and i64 %133, 3
  %lcmp.mod126 = icmp eq i64 %xtraiter125, 0
  br i1 %lcmp.mod126, label %for.inc36.prol.loopexit, label %for.inc36.prol.preheader

for.inc36.prol.preheader:                         ; preds = %for.inc36.preheader123
  br label %for.inc36.prol

for.inc36.prol:                                   ; preds = %for.inc36.prol, %for.inc36.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %for.inc36.prol ], [ %indvars.iv.ph, %for.inc36.prol.preheader ]
  %prol.iter127 = phi i64 [ %prol.iter127.sub, %for.inc36.prol ], [ %xtraiter125, %for.inc36.prol.preheader ]
  %arrayidx29.prol = getelementptr inbounds double, double* %sum, i64 %indvars.iv.prol
  %135 = bitcast double* %arrayidx29.prol to i64*
  %136 = load i64, i64* %135, align 8
  %arrayidx35.prol = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv77, i64 %indvars.iv55, i64 %indvars.iv.prol
  %137 = bitcast double* %arrayidx35.prol to i64*
  store i64 %136, i64* %137, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter127.sub = add i64 %prol.iter127, -1
  %prol.iter127.cmp = icmp eq i64 %prol.iter127.sub, 0
  br i1 %prol.iter127.cmp, label %for.inc36.prol.loopexit.unr-lcssa, label %for.inc36.prol, !llvm.loop !20

for.inc36.prol.loopexit.unr-lcssa:                ; preds = %for.inc36.prol
  br label %for.inc36.prol.loopexit

for.inc36.prol.loopexit:                          ; preds = %for.inc36.preheader123, %for.inc36.prol.loopexit.unr-lcssa
  %indvars.iv.unr = phi i64 [ %indvars.iv.ph, %for.inc36.preheader123 ], [ %indvars.iv.next.prol, %for.inc36.prol.loopexit.unr-lcssa ]
  %138 = icmp ult i64 %134, 3
  br i1 %138, label %for.inc39.loopexit, label %for.inc36.preheader123.new

for.inc36.preheader123.new:                       ; preds = %for.inc36.prol.loopexit
  br label %for.inc36

for.inc36:                                        ; preds = %for.inc36, %for.inc36.preheader123.new
  %indvars.iv = phi i64 [ %indvars.iv.unr, %for.inc36.preheader123.new ], [ %indvars.iv.next.3, %for.inc36 ]
  %arrayidx29 = getelementptr inbounds double, double* %sum, i64 %indvars.iv
  %139 = bitcast double* %arrayidx29 to i64*
  %140 = load i64, i64* %139, align 8
  %arrayidx35 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv77, i64 %indvars.iv55, i64 %indvars.iv
  %141 = bitcast double* %arrayidx35 to i64*
  store i64 %140, i64* %141, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %arrayidx29.1 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next
  %142 = bitcast double* %arrayidx29.1 to i64*
  %143 = load i64, i64* %142, align 8
  %arrayidx35.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv77, i64 %indvars.iv55, i64 %indvars.iv.next
  %144 = bitcast double* %arrayidx35.1 to i64*
  store i64 %143, i64* %144, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %arrayidx29.2 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next.1
  %145 = bitcast double* %arrayidx29.2 to i64*
  %146 = load i64, i64* %145, align 8
  %arrayidx35.2 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv77, i64 %indvars.iv55, i64 %indvars.iv.next.1
  %147 = bitcast double* %arrayidx35.2 to i64*
  store i64 %146, i64* %147, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %arrayidx29.3 = getelementptr inbounds double, double* %sum, i64 %indvars.iv.next.2
  %148 = bitcast double* %arrayidx29.3 to i64*
  %149 = load i64, i64* %148, align 8
  %arrayidx35.3 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv77, i64 %indvars.iv55, i64 %indvars.iv.next.2
  %150 = bitcast double* %arrayidx35.3 to i64*
  store i64 %149, i64* %150, align 8
  %exitcond.3 = icmp eq i64 %indvars.iv.next.2, %wide.trip.count
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  br i1 %exitcond.3, label %for.inc39.loopexit.unr-lcssa, label %for.inc36, !llvm.loop !21

for.inc39.loopexit.unr-lcssa:                     ; preds = %for.inc36
  br label %for.inc39.loopexit

for.inc39.loopexit:                               ; preds = %for.inc36.prol.loopexit, %for.inc39.loopexit.unr-lcssa
  br label %for.inc39

for.inc39:                                        ; preds = %for.inc39.loopexit, %middle.block92, %for.cond4.preheader
  %indvars.iv.next56 = add nuw i64 %indvars.iv55, 1
  %cmp2 = icmp slt i64 %indvars.iv.next56, %2
  br i1 %cmp2, label %for.cond4.preheader, label %for.inc42.loopexit124

for.inc42.loopexit:                               ; preds = %for.inc39.us
  br label %for.inc42

for.inc42.loopexit124:                            ; preds = %for.inc39
  br label %for.inc42

for.inc42:                                        ; preds = %for.inc42.loopexit124, %for.inc42.loopexit, %for.cond1.preheader
  %indvars.iv.next78 = add nuw i64 %indvars.iv77, 1
  %cmp = icmp slt i64 %indvars.iv.next78, %8
  br i1 %cmp, label %for.cond1.preheader, label %for.end44.loopexit

for.end44.loopexit:                               ; preds = %for.inc42
  br label %for.end44

for.end44:                                        ; preds = %for.end44.loopexit, %entry
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32 %argc, i8** nocapture readonly %argv) #1 {
entry:
  %call = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %call1 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %call2 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %arraydecay = bitcast i8* %call to [140 x [160 x double]]*
  %arraydecay3 = bitcast i8* %call2 to [160 x double]*
  tail call void @init_array([140 x [160 x double]]* %arraydecay, [160 x double]* %arraydecay3)
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
  tail call void @print_array([140 x [160 x double]]* %1)
  br label %if.end

if.end:                                           ; preds = %land.lhs.true, %entry, %if.then
  tail call void @free(i8* %call) #4
  tail call void @free(i8* %call1) #4
  tail call void @free(i8* %call2) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array([140 x [160 x double]]* nocapture %A, [160 x double]* nocapture %C4) #0 {
entry:
  br label %for.cond1.preheader

for.cond1.preheader:                              ; preds = %for.inc15, %entry
  %indvars.iv36 = phi i64 [ 0, %entry ], [ %indvars.iv.next37, %for.inc15 ]
  br label %for.cond4.preheader

for.cond4.preheader:                              ; preds = %for.inc12, %for.cond1.preheader
  %indvars.iv33 = phi i64 [ 0, %for.cond1.preheader ], [ %indvars.iv.next34, %for.inc12 ]
  %0 = mul nsw i64 %indvars.iv33, %indvars.iv36
  br label %for.inc

for.inc:                                          ; preds = %for.inc, %for.cond4.preheader
  %indvars.iv29 = phi i64 [ 0, %for.cond4.preheader ], [ %indvars.iv.next30.1, %for.inc ]
  %1 = add nuw nsw i64 %indvars.iv29, %0
  %2 = trunc i64 %1 to i32
  %rem = srem i32 %2, 160
  %conv = sitofp i32 %rem to double
  %div = fdiv double %conv, 1.600000e+02
  %arrayidx11 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv36, i64 %indvars.iv33, i64 %indvars.iv29
  store double %div, double* %arrayidx11, align 8
  %indvars.iv.next30 = or i64 %indvars.iv29, 1
  %3 = add nuw nsw i64 %indvars.iv.next30, %0
  %4 = trunc i64 %3 to i32
  %rem.1 = srem i32 %4, 160
  %conv.1 = sitofp i32 %rem.1 to double
  %div.1 = fdiv double %conv.1, 1.600000e+02
  %arrayidx11.1 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv36, i64 %indvars.iv33, i64 %indvars.iv.next30
  store double %div.1, double* %arrayidx11.1, align 8
  %exitcond32.1 = icmp eq i64 %indvars.iv.next30, 159
  %indvars.iv.next30.1 = add nsw i64 %indvars.iv29, 2
  br i1 %exitcond32.1, label %for.inc12, label %for.inc

for.inc12:                                        ; preds = %for.inc
  %indvars.iv.next34 = add nuw i64 %indvars.iv33, 1
  %cmp2 = icmp slt i64 %indvars.iv.next34, 140
  br i1 %cmp2, label %for.cond4.preheader, label %for.inc15

for.inc15:                                        ; preds = %for.inc12
  %indvars.iv.next37 = add nuw i64 %indvars.iv36, 1
  %cmp = icmp slt i64 %indvars.iv.next37, 150
  br i1 %cmp, label %for.cond1.preheader, label %for.cond22.preheader.preheader

for.cond22.preheader.preheader:                   ; preds = %for.inc15
  br label %for.cond22.preheader

for.cond22.preheader:                             ; preds = %for.cond22.preheader.preheader, %for.inc38
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %for.inc38 ], [ 0, %for.cond22.preheader.preheader ]
  br label %for.inc35

for.inc35:                                        ; preds = %for.inc35, %for.cond22.preheader
  %indvars.iv = phi i64 [ 0, %for.cond22.preheader ], [ %indvars.iv.next.1, %for.inc35 ]
  %5 = mul nuw nsw i64 %indvars.iv, %indvars.iv27
  %6 = trunc i64 %5 to i32
  %rem27 = srem i32 %6, 160
  %conv28 = sitofp i32 %rem27 to double
  %div30 = fdiv double %conv28, 1.600000e+02
  %arrayidx34 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv27, i64 %indvars.iv
  store double %div30, double* %arrayidx34, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %7 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv27
  %8 = trunc i64 %7 to i32
  %rem27.1 = srem i32 %8, 160
  %conv28.1 = sitofp i32 %rem27.1 to double
  %div30.1 = fdiv double %conv28.1, 1.600000e+02
  %arrayidx34.1 = getelementptr inbounds [160 x double], [160 x double]* %C4, i64 %indvars.iv27, i64 %indvars.iv.next
  store double %div30.1, double* %arrayidx34.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 159
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %for.inc38, label %for.inc35

for.inc38:                                        ; preds = %for.inc35
  %indvars.iv.next28 = add nuw i64 %indvars.iv27, 1
  %cmp19 = icmp slt i64 %indvars.iv.next28, 160
  br i1 %cmp19, label %for.cond22.preheader, label %for.end40

for.end40:                                        ; preds = %for.inc38
  ret void
}

declare void @polybench_timer_start(...) #2

declare void @polybench_timer_stop(...) #2

declare void @polybench_timer_print(...) #2

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([140 x [160 x double]]* nocapture readonly %A) #1 {
entry:
  %0 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %1 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %0) #6
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call1 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %2, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %for.cond2.preheader

for.cond2.preheader:                              ; preds = %for.inc21, %entry
  %indvars.iv18 = phi i64 [ 0, %entry ], [ %indvars.iv.next19, %for.inc21 ]
  %3 = mul nsw i64 %indvars.iv18, 140
  br label %for.cond5.preheader

for.cond5.preheader:                              ; preds = %for.inc18, %for.cond2.preheader
  %indvars.iv16 = phi i64 [ 0, %for.cond2.preheader ], [ %indvars.iv.next17, %for.inc18 ]
  %mul83 = add i64 %indvars.iv16, %3
  %sext = mul i64 %mul83, 687194767360
  %4 = lshr exact i64 %sext, 32
  br label %for.body7

for.body7:                                        ; preds = %for.inc, %for.cond5.preheader
  %indvars.iv = phi i64 [ 0, %for.cond5.preheader ], [ %indvars.iv.next, %for.inc ]
  %5 = add i64 %indvars.iv, %4
  %6 = trunc i64 %5 to i32
  %rem = srem i32 %6, 20
  %cmp11 = icmp eq i32 %rem, 0
  br i1 %cmp11, label %if.then, label %for.inc

if.then:                                          ; preds = %for.body7
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %7) #6
  br label %for.inc

for.inc:                                          ; preds = %for.body7, %if.then
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %arrayidx16 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %A, i64 %indvars.iv18, i64 %indvars.iv16, i64 %indvars.iv
  %9 = load double, double* %arrayidx16, align 8
  %call17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %9) #7
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %cmp6 = icmp slt i64 %indvars.iv.next, 160
  br i1 %cmp6, label %for.body7, label %for.inc18

for.inc18:                                        ; preds = %for.inc
  %indvars.iv.next17 = add nuw i64 %indvars.iv16, 1
  %cmp3 = icmp slt i64 %indvars.iv.next17, 140
  br i1 %cmp3, label %for.cond5.preheader, label %for.inc21

for.inc21:                                        ; preds = %for.inc18
  %indvars.iv.next19 = add nuw i64 %indvars.iv18, 1
  %cmp = icmp slt i64 %indvars.iv.next19, 150
  br i1 %cmp, label %for.cond2.preheader, label %for.end23

for.end23:                                        ; preds = %for.inc21
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %call24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %11) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

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
!4 = distinct !{!4, !5}
!5 = !{!"llvm.loop.unroll.disable"}
!6 = !{!7}
!7 = distinct !{!7, !8}
!8 = distinct !{!8, !"LVerDomain"}
!9 = !{!10}
!10 = distinct !{!10, !8}
!11 = distinct !{!11, !5}
!12 = distinct !{!12, !2, !3}
!13 = !{!14}
!14 = distinct !{!14, !15}
!15 = distinct !{!15, !"LVerDomain"}
!16 = !{!17}
!17 = distinct !{!17, !15}
!18 = distinct !{!18, !5}
!19 = distinct !{!19, !2, !3}
!20 = distinct !{!20, !5}
!21 = distinct !{!21, !2, !3}
