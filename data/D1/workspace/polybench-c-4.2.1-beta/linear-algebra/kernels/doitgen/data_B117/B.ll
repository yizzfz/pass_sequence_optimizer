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
  br i1 %7, label %.lr.ph36, label %._crit_edge

.lr.ph36:                                         ; preds = %6
  %8 = icmp sgt i32 %1, 0
  %9 = icmp sgt i32 %2, 0
  %10 = sext i32 %2 to i64
  %11 = sext i32 %1 to i64
  %12 = sext i32 %0 to i64
  %wide.trip.count59 = zext i32 %2 to i64
  %scevgep81 = getelementptr double, double* %5, i64 %10
  %13 = add nsw i64 %11, -1
  %14 = add nsw i64 %10, -4
  %15 = lshr i64 %14, 2
  %16 = add nuw nsw i64 %15, 1
  %xtraiter121 = and i64 %wide.trip.count59, 1
  %lcmp.mod122 = icmp eq i64 %xtraiter121, 0
  %17 = icmp eq i32 %2, 1
  %min.iters.check = icmp ult i32 %2, 4
  %n.vec = and i64 %10, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %xtraiter123 = and i64 %16, 3
  %lcmp.mod124 = icmp eq i64 %xtraiter123, 0
  %18 = icmp ult i64 %14, 12
  %cmp.n = icmp eq i64 %10, %n.vec
  %xtraiter = and i64 %11, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %19 = icmp ult i64 %13, 7
  br label %._crit_edge19._crit_edge

._crit_edge19._crit_edge:                         ; preds = %._crit_edge19, %.lr.ph36
  %indvars.iv69 = phi i64 [ 0, %.lr.ph36 ], [ %indvars.iv.next70, %._crit_edge19 ]
  br i1 %8, label %.lr.ph18, label %._crit_edge19

.lr.ph18:                                         ; preds = %._crit_edge19._crit_edge
  br i1 %9, label %.lr.ph18.split.us.preheader, label %.lr.ph18.split.preheader

.lr.ph18.split.preheader:                         ; preds = %.lr.ph18
  br i1 %lcmp.mod, label %.lr.ph18.split.prol.loopexit, label %.lr.ph18.split.prol.preheader

.lr.ph18.split.prol.preheader:                    ; preds = %.lr.ph18.split.preheader
  br label %.lr.ph18.split.prol

.lr.ph18.split.prol:                              ; preds = %.lr.ph18.split.prol, %.lr.ph18.split.prol.preheader
  %indvars.iv53.prol = phi i64 [ %indvars.iv.next54.prol, %.lr.ph18.split.prol ], [ 0, %.lr.ph18.split.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph18.split.prol ], [ %xtraiter, %.lr.ph18.split.prol.preheader ]
  %indvars.iv.next54.prol = add nuw nsw i64 %indvars.iv53.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph18.split.prol.loopexit.unr-lcssa, label %.lr.ph18.split.prol, !llvm.loop !1

.lr.ph18.split.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph18.split.prol
  br label %.lr.ph18.split.prol.loopexit

.lr.ph18.split.prol.loopexit:                     ; preds = %.lr.ph18.split.preheader, %.lr.ph18.split.prol.loopexit.unr-lcssa
  %indvars.iv53.unr = phi i64 [ 0, %.lr.ph18.split.preheader ], [ %indvars.iv.next54.prol, %.lr.ph18.split.prol.loopexit.unr-lcssa ]
  br i1 %19, label %._crit_edge19.loopexit118, label %.lr.ph18.split.preheader.new

.lr.ph18.split.preheader.new:                     ; preds = %.lr.ph18.split.prol.loopexit
  br label %.lr.ph18.split

.lr.ph18.split.us.preheader:                      ; preds = %.lr.ph18
  br label %.lr.ph18.split.us

.lr.ph18.split.us:                                ; preds = %._crit_edge15.us, %.lr.ph18.split.us.preheader
  %indvars.iv67 = phi i64 [ %indvars.iv.next68, %._crit_edge15.us ], [ 0, %.lr.ph18.split.us.preheader ]
  %scevgep = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 0
  %20 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 0
  br label %.lr.ph.us.us

._crit_edge15.us.loopexit:                        ; preds = %._crit_edge73
  br label %._crit_edge15.us

._crit_edge15.us:                                 ; preds = %._crit_edge15.us.loopexit, %middle.block
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond119 = icmp eq i64 %indvars.iv.next68, %11
  br i1 %exitcond119, label %._crit_edge19.loopexit, label %.lr.ph18.split.us

._crit_edge73:                                    ; preds = %._crit_edge73.preheader117, %._crit_edge73
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %._crit_edge73 ], [ %indvars.iv65.ph, %._crit_edge73.preheader117 ]
  %21 = getelementptr inbounds double, double* %5, i64 %indvars.iv65
  %22 = bitcast double* %21 to i64*
  %23 = load i64, i64* %22, align 8
  %24 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 %indvars.iv65
  %25 = bitcast double* %24 to i64*
  store i64 %23, i64* %25, align 8
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %26 = icmp slt i64 %indvars.iv.next66, %10
  br i1 %26, label %._crit_edge73, label %._crit_edge15.us.loopexit, !llvm.loop !3

._crit_edge73.preheader:                          ; preds = %._crit_edge.us.us
  %scevgep79 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 %10
  br i1 %min.iters.check, label %._crit_edge73.preheader117, label %min.iters.checked

._crit_edge73.preheader117:                       ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %._crit_edge73.preheader
  %indvars.iv65.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %._crit_edge73.preheader ], [ %n.vec, %middle.block ]
  br label %._crit_edge73

min.iters.checked:                                ; preds = %._crit_edge73.preheader
  br i1 %cmp.zero, label %._crit_edge73.preheader117, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep81
  %bound1 = icmp ugt double* %scevgep79, %5
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge73.preheader117, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br i1 %lcmp.mod124, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter125 = phi i64 [ %prol.iter125.sub, %vector.body.prol ], [ %xtraiter123, %vector.body.prol.preheader ]
  %27 = getelementptr inbounds double, double* %5, i64 %index.prol
  %28 = bitcast double* %27 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %28, align 8, !alias.scope !6
  %29 = getelementptr double, double* %27, i64 2
  %30 = bitcast double* %29 to <2 x i64>*
  %wide.load84.prol = load <2 x i64>, <2 x i64>* %30, align 8, !alias.scope !6
  %31 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 %index.prol
  %32 = bitcast double* %31 to <2 x i64>*
  store <2 x i64> %wide.load.prol, <2 x i64>* %32, align 8, !alias.scope !9, !noalias !6
  %33 = getelementptr double, double* %31, i64 2
  %34 = bitcast double* %33 to <2 x i64>*
  store <2 x i64> %wide.load84.prol, <2 x i64>* %34, align 8, !alias.scope !9, !noalias !6
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter125.sub = add i64 %prol.iter125, -1
  %prol.iter125.cmp = icmp eq i64 %prol.iter125.sub, 0
  br i1 %prol.iter125.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !11

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  br i1 %18, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %35 = getelementptr inbounds double, double* %5, i64 %index
  %36 = bitcast double* %35 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %36, align 8, !alias.scope !6
  %37 = getelementptr double, double* %35, i64 2
  %38 = bitcast double* %37 to <2 x i64>*
  %wide.load84 = load <2 x i64>, <2 x i64>* %38, align 8, !alias.scope !6
  %39 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 %index
  %40 = bitcast double* %39 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %40, align 8, !alias.scope !9, !noalias !6
  %41 = getelementptr double, double* %39, i64 2
  %42 = bitcast double* %41 to <2 x i64>*
  store <2 x i64> %wide.load84, <2 x i64>* %42, align 8, !alias.scope !9, !noalias !6
  %index.next = add i64 %index, 4
  %43 = getelementptr inbounds double, double* %5, i64 %index.next
  %44 = bitcast double* %43 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %44, align 8, !alias.scope !6
  %45 = getelementptr double, double* %43, i64 2
  %46 = bitcast double* %45 to <2 x i64>*
  %wide.load84.1 = load <2 x i64>, <2 x i64>* %46, align 8, !alias.scope !6
  %47 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 %index.next
  %48 = bitcast double* %47 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %48, align 8, !alias.scope !9, !noalias !6
  %49 = getelementptr double, double* %47, i64 2
  %50 = bitcast double* %49 to <2 x i64>*
  store <2 x i64> %wide.load84.1, <2 x i64>* %50, align 8, !alias.scope !9, !noalias !6
  %index.next.1 = add i64 %index, 8
  %51 = getelementptr inbounds double, double* %5, i64 %index.next.1
  %52 = bitcast double* %51 to <2 x i64>*
  %wide.load.2 = load <2 x i64>, <2 x i64>* %52, align 8, !alias.scope !6
  %53 = getelementptr double, double* %51, i64 2
  %54 = bitcast double* %53 to <2 x i64>*
  %wide.load84.2 = load <2 x i64>, <2 x i64>* %54, align 8, !alias.scope !6
  %55 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 %index.next.1
  %56 = bitcast double* %55 to <2 x i64>*
  store <2 x i64> %wide.load.2, <2 x i64>* %56, align 8, !alias.scope !9, !noalias !6
  %57 = getelementptr double, double* %55, i64 2
  %58 = bitcast double* %57 to <2 x i64>*
  store <2 x i64> %wide.load84.2, <2 x i64>* %58, align 8, !alias.scope !9, !noalias !6
  %index.next.2 = add i64 %index, 12
  %59 = getelementptr inbounds double, double* %5, i64 %index.next.2
  %60 = bitcast double* %59 to <2 x i64>*
  %wide.load.3 = load <2 x i64>, <2 x i64>* %60, align 8, !alias.scope !6
  %61 = getelementptr double, double* %59, i64 2
  %62 = bitcast double* %61 to <2 x i64>*
  %wide.load84.3 = load <2 x i64>, <2 x i64>* %62, align 8, !alias.scope !6
  %63 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 %index.next.2
  %64 = bitcast double* %63 to <2 x i64>*
  store <2 x i64> %wide.load.3, <2 x i64>* %64, align 8, !alias.scope !9, !noalias !6
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x i64>*
  store <2 x i64> %wide.load84.3, <2 x i64>* %66, align 8, !alias.scope !9, !noalias !6
  %index.next.3 = add i64 %index, 16
  %67 = icmp eq i64 %index.next.3, %n.vec
  br i1 %67, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !12

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  br i1 %cmp.n, label %._crit_edge15.us, label %._crit_edge73.preheader117

.lr.ph.us.us:                                     ; preds = %.lr.ph18.split.us, %._crit_edge.us.us
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge.us.us ], [ 0, %.lr.ph18.split.us ]
  %68 = getelementptr inbounds double, double* %5, i64 %indvars.iv61
  store double 0.000000e+00, double* %68, align 8
  br i1 %lcmp.mod122, label %._crit_edge74.prol.loopexit.unr-lcssa, label %._crit_edge74.prol.preheader

._crit_edge74.prol.preheader:                     ; preds = %.lr.ph.us.us
  br label %._crit_edge74.prol

._crit_edge74.prol:                               ; preds = %._crit_edge74.prol.preheader
  %69 = load double, double* %20, align 8
  %70 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv61
  %71 = load double, double* %70, align 8
  %72 = fmul double %69, %71
  %73 = fadd double %72, 0.000000e+00
  store double %73, double* %68, align 8
  br label %._crit_edge74.prol.loopexit.unr-lcssa

._crit_edge74.prol.loopexit.unr-lcssa:            ; preds = %.lr.ph.us.us, %._crit_edge74.prol
  %.unr.ph = phi double [ %73, %._crit_edge74.prol ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv57.unr.ph = phi i64 [ 1, %._crit_edge74.prol ], [ 0, %.lr.ph.us.us ]
  br label %._crit_edge74.prol.loopexit

._crit_edge74.prol.loopexit:                      ; preds = %._crit_edge74.prol.loopexit.unr-lcssa
  br i1 %17, label %._crit_edge.us.us, label %.lr.ph.us.us.new

.lr.ph.us.us.new:                                 ; preds = %._crit_edge74.prol.loopexit
  br label %._crit_edge74

._crit_edge.us.us.unr-lcssa:                      ; preds = %._crit_edge74
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge74.prol.loopexit, %._crit_edge.us.us.unr-lcssa
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next62, %wide.trip.count59
  br i1 %exitcond64, label %._crit_edge73.preheader, label %.lr.ph.us.us

._crit_edge74:                                    ; preds = %._crit_edge74, %.lr.ph.us.us.new
  %74 = phi double [ %.unr.ph, %.lr.ph.us.us.new ], [ %86, %._crit_edge74 ]
  %indvars.iv57 = phi i64 [ %indvars.iv57.unr.ph, %.lr.ph.us.us.new ], [ %indvars.iv.next58.1, %._crit_edge74 ]
  %75 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 %indvars.iv57
  %76 = load double, double* %75, align 8
  %77 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv57, i64 %indvars.iv61
  %78 = load double, double* %77, align 8
  %79 = fmul double %76, %78
  %80 = fadd double %74, %79
  store double %80, double* %68, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %81 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 %indvars.iv.next58
  %82 = load double, double* %81, align 8
  %83 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next58, i64 %indvars.iv61
  %84 = load double, double* %83, align 8
  %85 = fmul double %82, %84
  %86 = fadd double %80, %85
  store double %86, double* %68, align 8
  %indvars.iv.next58.1 = add nsw i64 %indvars.iv57, 2
  %exitcond60.1 = icmp eq i64 %indvars.iv.next58.1, %wide.trip.count59
  br i1 %exitcond60.1, label %._crit_edge.us.us.unr-lcssa, label %._crit_edge74

.lr.ph18.split:                                   ; preds = %.lr.ph18.split, %.lr.ph18.split.preheader.new
  %indvars.iv53 = phi i64 [ %indvars.iv53.unr, %.lr.ph18.split.preheader.new ], [ %indvars.iv.next54.7, %.lr.ph18.split ]
  %indvars.iv.next54.7 = add nsw i64 %indvars.iv53, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next54.7, %11
  br i1 %exitcond.7, label %._crit_edge19.loopexit118.unr-lcssa, label %.lr.ph18.split

._crit_edge19.loopexit:                           ; preds = %._crit_edge15.us
  br label %._crit_edge19

._crit_edge19.loopexit118.unr-lcssa:              ; preds = %.lr.ph18.split
  br label %._crit_edge19.loopexit118

._crit_edge19.loopexit118:                        ; preds = %.lr.ph18.split.prol.loopexit, %._crit_edge19.loopexit118.unr-lcssa
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit118, %._crit_edge19.loopexit, %._crit_edge19._crit_edge
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond120 = icmp eq i64 %indvars.iv.next70, %12
  br i1 %exitcond120, label %._crit_edge.loopexit, label %._crit_edge19._crit_edge

._crit_edge.loopexit:                             ; preds = %._crit_edge19
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #1 {
  %3 = call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %6 = bitcast i8* %3 to [140 x [160 x double]]*
  %7 = bitcast i8* %5 to [160 x double]*
  call fastcc void @init_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %5 to [160 x double]*
  %9 = bitcast i8* %4 to double*
  call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %8, double* %9)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %10 = icmp sgt i32 %0, 42
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %2
  %12 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %12, align 1
  %13 = icmp eq i8 %strcmpload, 0
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %11
  call fastcc void @print_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6)
  br label %._crit_edge

._crit_edge:                                      ; preds = %11, %2, %14
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, [140 x [160 x double]]*, [160 x double]*) unnamed_addr #0 {
.lr.ph26:
  br label %.lr.ph26.split.us

.lr.ph26.split.us:                                ; preds = %._crit_edge20.us, %.lr.ph26
  %indvars.iv61 = phi i64 [ 0, %.lr.ph26 ], [ %indvars.iv.next62, %._crit_edge20.us ]
  br label %.lr.ph15.us.us

._crit_edge20.us:                                 ; preds = %._crit_edge16.us.us
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond70 = icmp eq i64 %indvars.iv.next62, 150
  br i1 %exitcond70, label %.lr.ph7.split.us.preheader, label %.lr.ph26.split.us

.lr.ph7.split.us.preheader:                       ; preds = %._crit_edge20.us
  br label %.lr.ph7.split.us

.lr.ph15.us.us:                                   ; preds = %.lr.ph26.split.us, %._crit_edge16.us.us
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %._crit_edge16.us.us ], [ 0, %.lr.ph26.split.us ]
  %5 = mul nuw nsw i64 %indvars.iv61, %indvars.iv57
  br label %._crit_edge66

._crit_edge16.us.us:                              ; preds = %._crit_edge66
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next58, 140
  br i1 %exitcond60, label %._crit_edge20.us, label %.lr.ph15.us.us

._crit_edge66:                                    ; preds = %._crit_edge66, %.lr.ph15.us.us
  %indvars.iv53 = phi i64 [ 0, %.lr.ph15.us.us ], [ %indvars.iv.next54.1, %._crit_edge66 ]
  %6 = add nuw nsw i64 %5, %indvars.iv53
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 160
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv61, i64 %indvars.iv57, i64 %indvars.iv53
  %indvars.iv.next54 = or i64 %indvars.iv53, 1
  %11 = add nuw nsw i64 %5, %indvars.iv.next54
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 160
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %9, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 1.600000e+02, double 1.600000e+02>
  %18 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %indvars.iv.next54.1 = add nsw i64 %indvars.iv53, 2
  %exitcond56.1 = icmp eq i64 %indvars.iv.next54.1, 160
  br i1 %exitcond56.1, label %._crit_edge16.us.us, label %._crit_edge66

.lr.ph7.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph7.split.us.preheader
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %._crit_edge.us ], [ 0, %.lr.ph7.split.us.preheader ]
  br label %._crit_edge68

._crit_edge68:                                    ; preds = %._crit_edge68, %.lr.ph7.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph7.split.us ], [ %indvars.iv.next.1, %._crit_edge68 ]
  %19 = mul nuw nsw i64 %indvars.iv50, %indvars.iv
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 160
  %22 = sitofp i32 %21 to double
  %23 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv50, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %24 = mul nuw nsw i64 %indvars.iv50, %indvars.iv.next
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, 160
  %27 = sitofp i32 %26 to double
  %28 = insertelement <2 x double> undef, double %22, i32 0
  %29 = insertelement <2 x double> %28, double %27, i32 1
  %30 = fdiv <2 x double> %29, <double 1.600000e+02, double 1.600000e+02>
  %31 = bitcast double* %23 to <2 x double>*
  store <2 x double> %30, <2 x double>* %31, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %._crit_edge.us, label %._crit_edge68

._crit_edge.us:                                   ; preds = %._crit_edge68
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next51, 160
  br i1 %exitcond69, label %._crit_edge67, label %.lr.ph7.split.us

._crit_edge67:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, i32, [140 x [160 x double]]*) unnamed_addr #1 {
.lr.ph12:
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph12.split.us

.lr.ph12.split.us:                                ; preds = %._crit_edge6.us, %.lr.ph12
  %indvars.iv39 = phi i64 [ 0, %.lr.ph12 ], [ %indvars.iv.next40, %._crit_edge6.us ]
  %8 = mul nuw nsw i64 %indvars.iv39, 140
  br label %.lr.ph.us.us

._crit_edge6.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond = icmp eq i64 %indvars.iv.next40, 150
  br i1 %exitcond, label %._crit_edge, label %.lr.ph12.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph12.split.us, %._crit_edge.us.us
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %._crit_edge.us.us ], [ 0, %.lr.ph12.split.us ]
  %9 = add nuw nsw i64 %8, %indvars.iv35
  %10 = mul nuw nsw i64 %9, 160
  br label %._crit_edge43

._crit_edge.us.us:                                ; preds = %._crit_edge42
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next36, 140
  br i1 %exitcond38, label %._crit_edge6.us, label %.lr.ph.us.us

._crit_edge43:                                    ; preds = %._crit_edge42, %.lr.ph.us.us
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next, %._crit_edge42 ]
  %11 = add nuw nsw i64 %10, %indvars.iv
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge42

; <label>:15:                                     ; preds = %._crit_edge43
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge43, %15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv39, i64 %indvars.iv35, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond34, label %._crit_edge.us.us, label %._crit_edge43

._crit_edge:                                      ; preds = %._crit_edge6.us
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
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
