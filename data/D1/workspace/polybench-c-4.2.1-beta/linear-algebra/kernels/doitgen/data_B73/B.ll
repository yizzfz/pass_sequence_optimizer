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
define void @kernel_doitgen(i32, i32, i32, [140 x [160 x double]]*, [160 x double]*, double*) local_unnamed_addr #0 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %._crit_edge.lr.ph, label %.loopexit

._crit_edge.lr.ph:                                ; preds = %6
  %wide.trip.count62.1 = zext i32 %2 to i64
  %8 = sext i32 %2 to i64
  %9 = sext i32 %1 to i64
  %10 = sext i32 %0 to i64
  %xtraiter = and i32 %2, 1
  %scevgep90 = getelementptr double, double* %5, i64 %8
  %11 = add nsw i64 %9, -1
  %12 = add nsw i64 %8, -4
  %13 = lshr i64 %12, 2
  %14 = add nuw nsw i64 %13, 1
  %15 = icmp sgt i32 %1, 0
  %16 = icmp sgt i32 %2, 0
  %17 = icmp eq i32 %xtraiter, 0
  %18 = icmp eq i32 %2, 1
  %19 = ptrtoint double* %5 to i64
  %sunkaddr = ptrtoint double* %5 to i64
  %20 = ptrtoint double* %5 to i64
  %min.iters.check = icmp ult i32 %2, 4
  %n.vec = and i64 %8, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %xtraiter101 = and i64 %14, 3
  %lcmp.mod102 = icmp eq i64 %xtraiter101, 0
  %21 = icmp ult i64 %12, 12
  %cmp.n = icmp eq i64 %8, %n.vec
  %xtraiter100 = and i64 %9, 7
  %lcmp.mod = icmp eq i64 %xtraiter100, 0
  %22 = icmp ult i64 %11, 7
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.lr.ph, %._crit_edge20
  %indvars.iv75 = phi i64 [ 0, %._crit_edge.lr.ph ], [ %indvars.iv.next76, %._crit_edge20 ]
  br i1 %15, label %._crit_edge5.lr.ph, label %._crit_edge20

._crit_edge5.lr.ph:                               ; preds = %._crit_edge
  br i1 %16, label %.lr.ph.us.us.preheader.preheader, label %._crit_edge18.preheader

._crit_edge18.preheader:                          ; preds = %._crit_edge5.lr.ph
  br i1 %lcmp.mod, label %._crit_edge18.prol.loopexit, label %._crit_edge18.prol.preheader

._crit_edge18.prol.preheader:                     ; preds = %._crit_edge18.preheader
  br label %._crit_edge18.prol

._crit_edge18.prol:                               ; preds = %._crit_edge18.prol, %._crit_edge18.prol.preheader
  %indvars.iv56.prol = phi i64 [ %indvars.iv.next57.prol, %._crit_edge18.prol ], [ 0, %._crit_edge18.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge18.prol ], [ %xtraiter100, %._crit_edge18.prol.preheader ]
  %indvars.iv.next57.prol = add nuw nsw i64 %indvars.iv56.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge18.prol.loopexit.unr-lcssa, label %._crit_edge18.prol, !llvm.loop !1

._crit_edge18.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge18.prol
  br label %._crit_edge18.prol.loopexit

._crit_edge18.prol.loopexit:                      ; preds = %._crit_edge18.preheader, %._crit_edge18.prol.loopexit.unr-lcssa
  %indvars.iv56.unr = phi i64 [ 0, %._crit_edge18.preheader ], [ %indvars.iv.next57.prol, %._crit_edge18.prol.loopexit.unr-lcssa ]
  br i1 %22, label %._crit_edge20.loopexit99, label %._crit_edge18.preheader.new

._crit_edge18.preheader.new:                      ; preds = %._crit_edge18.prol.loopexit
  br label %._crit_edge18

.lr.ph.us.us.preheader.preheader:                 ; preds = %._crit_edge5.lr.ph
  br label %.lr.ph.us.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph.us.us.preheader.preheader, %._crit_edge18.us
  %indvars.iv73 = phi i64 [ %indvars.iv.next74, %._crit_edge18.us ], [ 0, %.lr.ph.us.us.preheader.preheader ]
  %scevgep = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv75, i64 %indvars.iv73, i64 0
  %scevgep88 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv75, i64 %indvars.iv73, i64 %8
  %23 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv75, i64 %indvars.iv73, i64 0
  br label %.lr.ph.us.us

._crit_edge18.us.loopexit:                        ; preds = %.lr.ph17.us
  br label %._crit_edge18.us

._crit_edge18.us:                                 ; preds = %._crit_edge18.us.loopexit, %middle.block
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73, 1
  %24 = icmp slt i64 %indvars.iv.next74, %9
  br i1 %24, label %.lr.ph.us.us.preheader, label %._crit_edge20.loopexit

.lr.ph17.us:                                      ; preds = %.lr.ph17.us.preheader98, %.lr.ph17.us
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %.lr.ph17.us ], [ %indvars.iv68.ph, %.lr.ph17.us.preheader98 ]
  %25 = getelementptr inbounds double, double* %5, i64 %indvars.iv68
  %26 = bitcast double* %25 to i64*
  %27 = load i64, i64* %26, align 8
  %28 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv75, i64 %indvars.iv73, i64 %indvars.iv68
  %29 = bitcast double* %28 to i64*
  store i64 %27, i64* %29, align 8
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %30 = icmp slt i64 %indvars.iv.next69, %8
  br i1 %30, label %.lr.ph17.us, label %._crit_edge18.us.loopexit, !llvm.loop !3

.lr.ph17.us.preheader:                            ; preds = %._crit_edge9.us.us
  br i1 %min.iters.check, label %.lr.ph17.us.preheader98, label %min.iters.checked

.lr.ph17.us.preheader98:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph17.us.preheader
  %indvars.iv68.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph17.us.preheader ], [ %n.vec, %middle.block ]
  br label %.lr.ph17.us

min.iters.checked:                                ; preds = %.lr.ph17.us.preheader
  br i1 %cmp.zero, label %.lr.ph17.us.preheader98, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep90
  %bound1 = icmp ugt double* %scevgep88, %5
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.lr.ph17.us.preheader98, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br i1 %lcmp.mod102, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter103 = phi i64 [ %prol.iter103.sub, %vector.body.prol ], [ %xtraiter101, %vector.body.prol.preheader ]
  %31 = getelementptr inbounds double, double* %5, i64 %index.prol
  %32 = bitcast double* %31 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %32, align 8, !alias.scope !6
  %33 = getelementptr double, double* %31, i64 2
  %34 = bitcast double* %33 to <2 x i64>*
  %wide.load93.prol = load <2 x i64>, <2 x i64>* %34, align 8, !alias.scope !6
  %35 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv75, i64 %indvars.iv73, i64 %index.prol
  %36 = bitcast double* %35 to <2 x i64>*
  store <2 x i64> %wide.load.prol, <2 x i64>* %36, align 8, !alias.scope !9, !noalias !6
  %37 = getelementptr double, double* %35, i64 2
  %38 = bitcast double* %37 to <2 x i64>*
  store <2 x i64> %wide.load93.prol, <2 x i64>* %38, align 8, !alias.scope !9, !noalias !6
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter103.sub = add i64 %prol.iter103, -1
  %prol.iter103.cmp = icmp eq i64 %prol.iter103.sub, 0
  br i1 %prol.iter103.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !11

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  br i1 %21, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %39 = getelementptr inbounds double, double* %5, i64 %index
  %40 = bitcast double* %39 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %40, align 8, !alias.scope !6
  %41 = getelementptr double, double* %39, i64 2
  %42 = bitcast double* %41 to <2 x i64>*
  %wide.load93 = load <2 x i64>, <2 x i64>* %42, align 8, !alias.scope !6
  %43 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv75, i64 %indvars.iv73, i64 %index
  %44 = bitcast double* %43 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %44, align 8, !alias.scope !9, !noalias !6
  %45 = getelementptr double, double* %43, i64 2
  %46 = bitcast double* %45 to <2 x i64>*
  store <2 x i64> %wide.load93, <2 x i64>* %46, align 8, !alias.scope !9, !noalias !6
  %index.next = add i64 %index, 4
  %47 = getelementptr inbounds double, double* %5, i64 %index.next
  %48 = bitcast double* %47 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %48, align 8, !alias.scope !6
  %49 = getelementptr double, double* %47, i64 2
  %50 = bitcast double* %49 to <2 x i64>*
  %wide.load93.1 = load <2 x i64>, <2 x i64>* %50, align 8, !alias.scope !6
  %51 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv75, i64 %indvars.iv73, i64 %index.next
  %52 = bitcast double* %51 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %52, align 8, !alias.scope !9, !noalias !6
  %53 = getelementptr double, double* %51, i64 2
  %54 = bitcast double* %53 to <2 x i64>*
  store <2 x i64> %wide.load93.1, <2 x i64>* %54, align 8, !alias.scope !9, !noalias !6
  %index.next.1 = add i64 %index, 8
  %55 = getelementptr inbounds double, double* %5, i64 %index.next.1
  %56 = bitcast double* %55 to <2 x i64>*
  %wide.load.2 = load <2 x i64>, <2 x i64>* %56, align 8, !alias.scope !6
  %57 = getelementptr double, double* %55, i64 2
  %58 = bitcast double* %57 to <2 x i64>*
  %wide.load93.2 = load <2 x i64>, <2 x i64>* %58, align 8, !alias.scope !6
  %59 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv75, i64 %indvars.iv73, i64 %index.next.1
  %60 = bitcast double* %59 to <2 x i64>*
  store <2 x i64> %wide.load.2, <2 x i64>* %60, align 8, !alias.scope !9, !noalias !6
  %61 = getelementptr double, double* %59, i64 2
  %62 = bitcast double* %61 to <2 x i64>*
  store <2 x i64> %wide.load93.2, <2 x i64>* %62, align 8, !alias.scope !9, !noalias !6
  %index.next.2 = add i64 %index, 12
  %63 = getelementptr inbounds double, double* %5, i64 %index.next.2
  %64 = bitcast double* %63 to <2 x i64>*
  %wide.load.3 = load <2 x i64>, <2 x i64>* %64, align 8, !alias.scope !6
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x i64>*
  %wide.load93.3 = load <2 x i64>, <2 x i64>* %66, align 8, !alias.scope !6
  %67 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv75, i64 %indvars.iv73, i64 %index.next.2
  %68 = bitcast double* %67 to <2 x i64>*
  store <2 x i64> %wide.load.3, <2 x i64>* %68, align 8, !alias.scope !9, !noalias !6
  %69 = getelementptr double, double* %67, i64 2
  %70 = bitcast double* %69 to <2 x i64>*
  store <2 x i64> %wide.load93.3, <2 x i64>* %70, align 8, !alias.scope !9, !noalias !6
  %index.next.3 = add i64 %index, 16
  %71 = icmp eq i64 %index.next.3, %n.vec
  br i1 %71, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !12

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  br i1 %cmp.n, label %._crit_edge18.us, label %.lr.ph17.us.preheader98

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge9.us.us
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %._crit_edge9.us.us ], [ 0, %.lr.ph.us.us.preheader ]
  %72 = getelementptr inbounds double, double* %5, i64 %indvars.iv64
  store double 0.000000e+00, double* %72, align 8
  br i1 %17, label %.prol.loopexit, label %73

; <label>:73:                                     ; preds = %.lr.ph.us.us
  %74 = load double, double* %23, align 8
  %75 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv64
  %76 = load double, double* %75, align 8
  %77 = fmul double %74, %76
  %sunkaddr77 = shl i64 %indvars.iv64, 3
  %sunkaddr78 = add i64 %20, %sunkaddr77
  %sunkaddr79 = inttoptr i64 %sunkaddr78 to double*
  %78 = load double, double* %sunkaddr79, align 8
  %79 = fadd double %77, %78
  store double %79, double* %sunkaddr79, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us.us, %73
  %indvars.iv60.unr.ph = phi i64 [ 1, %73 ], [ 0, %.lr.ph.us.us ]
  br i1 %18, label %._crit_edge9.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  %sunkaddr81 = shl i64 %indvars.iv64, 3
  %sunkaddr82 = add i64 %19, %sunkaddr81
  %sunkaddr83 = inttoptr i64 %sunkaddr82 to double*
  %.pre = load double, double* %sunkaddr83, align 8
  %sunkaddr94 = shl i64 %indvars.iv64, 3
  %sunkaddr95 = add i64 %sunkaddr, %sunkaddr94
  %sunkaddr96 = inttoptr i64 %sunkaddr95 to double*
  br label %.lr.ph.us.us.new

._crit_edge9.us.us.loopexit:                      ; preds = %.lr.ph.us.us.new
  br label %._crit_edge9.us.us

._crit_edge9.us.us:                               ; preds = %._crit_edge9.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next65, %wide.trip.count62.1
  br i1 %exitcond67, label %.lr.ph17.us.preheader, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %80 = phi double [ %92, %.lr.ph.us.us.new ], [ %.pre, %.lr.ph.us.us.new.preheader ]
  %indvars.iv60 = phi i64 [ %indvars.iv.next61.1, %.lr.ph.us.us.new ], [ %indvars.iv60.unr.ph, %.lr.ph.us.us.new.preheader ]
  %81 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv75, i64 %indvars.iv73, i64 %indvars.iv60
  %82 = load double, double* %81, align 8
  %83 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv60, i64 %indvars.iv64
  %84 = load double, double* %83, align 8
  %85 = fmul double %82, %84
  %86 = fadd double %85, %80
  store double %86, double* %sunkaddr96, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %87 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv75, i64 %indvars.iv73, i64 %indvars.iv.next61
  %88 = load double, double* %87, align 8
  %89 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next61, i64 %indvars.iv64
  %90 = load double, double* %89, align 8
  %91 = fmul double %88, %90
  %92 = fadd double %91, %86
  store double %92, double* %sunkaddr96, align 8
  %indvars.iv.next61.1 = add nuw nsw i64 %indvars.iv60, 2
  %exitcond63.1 = icmp eq i64 %indvars.iv.next61.1, %wide.trip.count62.1
  br i1 %exitcond63.1, label %._crit_edge9.us.us.loopexit, label %.lr.ph.us.us.new

._crit_edge18:                                    ; preds = %._crit_edge18, %._crit_edge18.preheader.new
  %indvars.iv56 = phi i64 [ %indvars.iv56.unr, %._crit_edge18.preheader.new ], [ %indvars.iv.next57.7, %._crit_edge18 ]
  %indvars.iv.next57.7 = add nsw i64 %indvars.iv56, 8
  %93 = icmp slt i64 %indvars.iv.next57.7, %9
  br i1 %93, label %._crit_edge18, label %._crit_edge20.loopexit99.unr-lcssa

._crit_edge20.loopexit:                           ; preds = %._crit_edge18.us
  br label %._crit_edge20

._crit_edge20.loopexit99.unr-lcssa:               ; preds = %._crit_edge18
  br label %._crit_edge20.loopexit99

._crit_edge20.loopexit99:                         ; preds = %._crit_edge18.prol.loopexit, %._crit_edge20.loopexit99.unr-lcssa
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge20.loopexit99, %._crit_edge20.loopexit, %._crit_edge
  %indvars.iv.next76 = add nsw i64 %indvars.iv75, 1
  %94 = icmp slt i64 %indvars.iv.next76, %10
  br i1 %94, label %._crit_edge, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge20
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #1 {
  %3 = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %6 = bitcast i8* %3 to [140 x [160 x double]]*
  %7 = bitcast i8* %5 to [160 x double]*
  tail call fastcc void @init_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %5 to [160 x double]*
  %9 = bitcast i8* %4 to double*
  tail call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %8, double* %9)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %10 = icmp sgt i32 %0, 42
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %2
  %12 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %12, align 1
  %13 = icmp eq i8 %strcmpload, 0
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %11
  %15 = bitcast i8* %3 to [140 x [160 x double]]*
  tail call fastcc void @print_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %15)
  br label %._crit_edge

._crit_edge:                                      ; preds = %11, %2, %14
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, [140 x [160 x double]]*, [160 x double]*) unnamed_addr #0 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %._crit_edge.lr.ph, label %._crit_edge5

._crit_edge.lr.ph:                                ; preds = %5
  %wide.trip.count58 = zext i32 %1 to i64
  %7 = icmp sgt i32 %1, 0
  %wide.trip.count54 = zext i32 %2 to i64
  %8 = sext i32 %0 to i64
  br i1 %7, label %._crit_edge.us.preheader, label %._crit_edge5

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  %9 = sitofp i32 %2 to double
  %10 = icmp sgt i32 %2, 0
  %xtraiter70 = and i64 %wide.trip.count54, 1
  %lcmp.mod71 = icmp eq i64 %xtraiter70, 0
  %11 = icmp eq i32 %2, 1
  %12 = insertelement <2 x double> undef, double %9, i32 0
  %13 = insertelement <2 x double> %12, double %9, i32 1
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge20.us
  %indvars.iv60 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next61, %._crit_edge20.us ]
  br i1 %10, label %._crit_edge6.us.us.preheader, label %._crit_edge20.us

._crit_edge6.us.us.preheader:                     ; preds = %._crit_edge.us
  br label %._crit_edge6.us.us

._crit_edge20.us.loopexit:                        ; preds = %._crit_edge17.us.us
  br label %._crit_edge20.us

._crit_edge20.us:                                 ; preds = %._crit_edge20.us.loopexit, %._crit_edge.us
  %indvars.iv.next61 = add nsw i64 %indvars.iv60, 1
  %14 = icmp slt i64 %indvars.iv.next61, %8
  br i1 %14, label %._crit_edge.us, label %._crit_edge5.loopexit

._crit_edge6.us.us:                               ; preds = %._crit_edge6.us.us.preheader, %._crit_edge17.us.us
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %._crit_edge17.us.us ], [ 0, %._crit_edge6.us.us.preheader ]
  %15 = mul nsw i64 %indvars.iv56, %indvars.iv60
  br i1 %lcmp.mod71, label %.prol.loopexit69.unr-lcssa, label %.prol.preheader68

.prol.preheader68:                                ; preds = %._crit_edge6.us.us
  br label %16

; <label>:16:                                     ; preds = %.prol.preheader68
  %17 = trunc i64 %15 to i32
  %18 = srem i32 %17, %2
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, %9
  %21 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv60, i64 %indvars.iv56, i64 0
  store double %20, double* %21, align 8
  br label %.prol.loopexit69.unr-lcssa

.prol.loopexit69.unr-lcssa:                       ; preds = %._crit_edge6.us.us, %16
  %indvars.iv52.unr.ph = phi i64 [ 1, %16 ], [ 0, %._crit_edge6.us.us ]
  br label %.prol.loopexit69

.prol.loopexit69:                                 ; preds = %.prol.loopexit69.unr-lcssa
  br i1 %11, label %._crit_edge17.us.us, label %._crit_edge6.us.us.new

._crit_edge6.us.us.new:                           ; preds = %.prol.loopexit69
  br label %22

._crit_edge17.us.us.unr-lcssa:                    ; preds = %22
  br label %._crit_edge17.us.us

._crit_edge17.us.us:                              ; preds = %.prol.loopexit69, %._crit_edge17.us.us.unr-lcssa
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next57, %wide.trip.count58
  br i1 %exitcond59, label %._crit_edge20.us.loopexit, label %._crit_edge6.us.us

; <label>:22:                                     ; preds = %22, %._crit_edge6.us.us.new
  %indvars.iv52 = phi i64 [ %indvars.iv52.unr.ph, %._crit_edge6.us.us.new ], [ %indvars.iv.next53.1, %22 ]
  %23 = add nsw i64 %15, %indvars.iv52
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, %2
  %26 = sitofp i32 %25 to double
  %27 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv60, i64 %indvars.iv56, i64 %indvars.iv52
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %28 = add nsw i64 %15, %indvars.iv.next53
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, %2
  %31 = sitofp i32 %30 to double
  %32 = insertelement <2 x double> undef, double %26, i32 0
  %33 = insertelement <2 x double> %32, double %31, i32 1
  %34 = fdiv <2 x double> %33, %13
  %35 = bitcast double* %27 to <2 x double>*
  store <2 x double> %34, <2 x double>* %35, align 8
  %indvars.iv.next53.1 = add nsw i64 %indvars.iv52, 2
  %exitcond55.1 = icmp eq i64 %indvars.iv.next53.1, %wide.trip.count54
  br i1 %exitcond55.1, label %._crit_edge17.us.us.unr-lcssa, label %22

._crit_edge5.loopexit:                            ; preds = %._crit_edge20.us
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit, %._crit_edge.lr.ph, %5
  %36 = icmp sgt i32 %2, 0
  br i1 %36, label %._crit_edge7.us.preheader, label %.loopexit

._crit_edge7.us.preheader:                        ; preds = %._crit_edge5
  %wide.trip.count = zext i32 %2 to i64
  %37 = sext i32 %2 to i64
  %38 = sitofp i32 %2 to double
  %xtraiter = and i64 %wide.trip.count, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %39 = icmp eq i32 %2, 1
  %40 = insertelement <2 x double> undef, double %38, i32 0
  %41 = insertelement <2 x double> %40, double %38, i32 1
  %42 = fdiv double 0.000000e+00, %38
  br label %._crit_edge7.us

._crit_edge7.us:                                  ; preds = %._crit_edge7.us.preheader, %._crit_edge9.us
  %indvars.iv49 = phi i64 [ 0, %._crit_edge7.us.preheader ], [ %indvars.iv.next50, %._crit_edge9.us ]
  br i1 %lcmp.mod, label %.prol.loopexit.unr-lcssa, label %.prol.preheader

.prol.preheader:                                  ; preds = %._crit_edge7.us
  br label %43

; <label>:43:                                     ; preds = %.prol.preheader
  %44 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv49, i64 0
  store double %42, double* %44, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %._crit_edge7.us, %43
  %indvars.iv.unr.ph = phi i64 [ 1, %43 ], [ 0, %._crit_edge7.us ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %39, label %._crit_edge9.us, label %._crit_edge7.us.new

._crit_edge7.us.new:                              ; preds = %.prol.loopexit
  br label %45

; <label>:45:                                     ; preds = %45, %._crit_edge7.us.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %._crit_edge7.us.new ], [ %indvars.iv.next.1, %45 ]
  %46 = mul nsw i64 %indvars.iv49, %indvars.iv
  %47 = trunc i64 %46 to i32
  %48 = srem i32 %47, %2
  %49 = sitofp i32 %48 to double
  %50 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv49, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %51 = mul nsw i64 %indvars.iv49, %indvars.iv.next
  %52 = trunc i64 %51 to i32
  %53 = srem i32 %52, %2
  %54 = sitofp i32 %53 to double
  %55 = insertelement <2 x double> undef, double %49, i32 0
  %56 = insertelement <2 x double> %55, double %54, i32 1
  %57 = fdiv <2 x double> %56, %41
  %58 = bitcast double* %50 to <2 x double>*
  store <2 x double> %57, <2 x double>* %58, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %._crit_edge9.us.unr-lcssa, label %45

._crit_edge9.us.unr-lcssa:                        ; preds = %45
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %.prol.loopexit, %._crit_edge9.us.unr-lcssa
  %indvars.iv.next50 = add nsw i64 %indvars.iv49, 1
  %59 = icmp slt i64 %indvars.iv.next50, %37
  br i1 %59, label %._crit_edge7.us, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge9.us
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, i32, [140 x [160 x double]]*) unnamed_addr #1 {
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #5
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %._crit_edge.lr.ph, label %.loopexit

._crit_edge.lr.ph:                                ; preds = %4
  %10 = sext i32 %1 to i64
  %11 = icmp sgt i32 %1, 0
  %wide.trip.count = zext i32 %2 to i64
  %12 = sext i32 %0 to i64
  br i1 %11, label %._crit_edge.us.preheader, label %.loopexit

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  %13 = zext i32 %1 to i64
  %14 = icmp sgt i32 %2, 0
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge7.us
  %indvars.iv40 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next41, %._crit_edge7.us ]
  br i1 %14, label %._crit_edge3.us.us.preheader, label %._crit_edge7.us

._crit_edge3.us.us.preheader:                     ; preds = %._crit_edge.us
  %15 = mul nsw i64 %10, %indvars.iv40
  %16 = trunc i64 %15 to i32
  br label %._crit_edge3.us.us

._crit_edge7.us.loopexit:                         ; preds = %._crit_edge6.us.us
  br label %._crit_edge7.us

._crit_edge7.us:                                  ; preds = %._crit_edge7.us.loopexit, %._crit_edge.us
  %indvars.iv.next41 = add nsw i64 %indvars.iv40, 1
  %17 = icmp slt i64 %indvars.iv.next41, %12
  br i1 %17, label %._crit_edge.us, label %.loopexit.loopexit

._crit_edge3.us.us:                               ; preds = %._crit_edge3.us.us.preheader, %._crit_edge6.us.us
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %._crit_edge6.us.us ], [ 0, %._crit_edge3.us.us.preheader ]
  %18 = trunc i64 %indvars.iv36 to i32
  %19 = add i32 %16, %18
  %20 = mul i32 %19, %2
  %21 = zext i32 %20 to i64
  br label %22

._crit_edge6.us.us:                               ; preds = %._crit_edge4.us.us
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond = icmp eq i64 %indvars.iv.next37, %13
  br i1 %exitcond, label %._crit_edge7.us.loopexit, label %._crit_edge3.us.us

; <label>:22:                                     ; preds = %._crit_edge4.us.us, %._crit_edge3.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge4.us.us ], [ 0, %._crit_edge3.us.us ]
  %23 = add i64 %21, %indvars.iv
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, 20
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %._crit_edge4.us.us

; <label>:27:                                     ; preds = %22
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %28) #5
  br label %._crit_edge4.us.us

._crit_edge4.us.us:                               ; preds = %22, %27
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv40, i64 %indvars.iv36, i64 %indvars.iv
  %31 = load double, double* %30, align 8
  %32 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %31) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond35, label %._crit_edge6.us.us, label %22

.loopexit.loopexit:                               ; preds = %._crit_edge7.us
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge.lr.ph, %4
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %35) #5
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
