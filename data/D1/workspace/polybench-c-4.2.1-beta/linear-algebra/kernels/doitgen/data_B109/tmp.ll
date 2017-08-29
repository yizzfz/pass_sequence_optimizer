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
  br i1 %7, label %.preheader6.lr.ph, label %._crit_edge32

.preheader6.lr.ph:                                ; preds = %6
  %8 = icmp sgt i32 %1, 0
  %9 = icmp sgt i32 %2, 0
  %10 = sext i32 %2 to i64
  %11 = sext i32 %1 to i64
  %12 = sext i32 %0 to i64
  %xtraiter = and i64 %10, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %13 = icmp eq i32 %2, 1
  %scevgep71 = getelementptr double, double* %5, i64 %10
  %14 = add nsw i64 %11, -1
  %15 = add nsw i64 %10, -4
  %16 = lshr i64 %15, 2
  %17 = add nuw nsw i64 %16, 1
  %min.iters.check = icmp ult i32 %2, 4
  %n.vec = and i64 %10, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %xtraiter113 = and i64 %17, 3
  %lcmp.mod114 = icmp eq i64 %xtraiter113, 0
  %18 = icmp ult i64 %15, 12
  %cmp.n = icmp eq i64 %10, %n.vec
  %xtraiter111 = and i64 %11, 7
  %lcmp.mod112 = icmp eq i64 %xtraiter111, 0
  %19 = icmp ult i64 %14, 7
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge16, %.preheader6.lr.ph
  %indvars.iv60 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next61, %._crit_edge16 ]
  br i1 %8, label %.preheader5.lr.ph, label %._crit_edge16

.preheader5.lr.ph:                                ; preds = %.preheader6
  br i1 %9, label %.preheader5.us.preheader, label %.preheader5.preheader

.preheader5.preheader:                            ; preds = %.preheader5.lr.ph
  br i1 %lcmp.mod112, label %.preheader5.prol.loopexit, label %.preheader5.prol.preheader

.preheader5.prol.preheader:                       ; preds = %.preheader5.preheader
  br label %.preheader5.prol

.preheader5.prol:                                 ; preds = %.preheader5.prol, %.preheader5.prol.preheader
  %indvars.iv48.prol = phi i64 [ %indvars.iv.next49.prol, %.preheader5.prol ], [ 0, %.preheader5.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader5.prol ], [ %xtraiter111, %.preheader5.prol.preheader ]
  %indvars.iv.next49.prol = add nuw nsw i64 %indvars.iv48.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader5.prol.loopexit.unr-lcssa, label %.preheader5.prol, !llvm.loop !1

.preheader5.prol.loopexit.unr-lcssa:              ; preds = %.preheader5.prol
  br label %.preheader5.prol.loopexit

.preheader5.prol.loopexit:                        ; preds = %.preheader5.preheader, %.preheader5.prol.loopexit.unr-lcssa
  %indvars.iv48.unr = phi i64 [ 0, %.preheader5.preheader ], [ %indvars.iv.next49.prol, %.preheader5.prol.loopexit.unr-lcssa ]
  br i1 %19, label %._crit_edge16.loopexit108, label %.preheader5.preheader.new

.preheader5.preheader.new:                        ; preds = %.preheader5.prol.loopexit
  br label %.preheader5

.preheader5.us.preheader:                         ; preds = %.preheader5.lr.ph
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %._crit_edge14.us, %.preheader5.us.preheader
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %._crit_edge14.us ], [ 0, %.preheader5.us.preheader ]
  %scevgep = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv60, i64 %indvars.iv58, i64 0
  %20 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv60, i64 %indvars.iv58, i64 0
  br label %.lr.ph.us.us

._crit_edge14.us.loopexit:                        ; preds = %.lr.ph13.us
  br label %._crit_edge14.us

._crit_edge14.us:                                 ; preds = %._crit_edge14.us.loopexit, %middle.block
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond109 = icmp eq i64 %indvars.iv.next59, %11
  br i1 %exitcond109, label %._crit_edge16.loopexit, label %.preheader5.us

.lr.ph13.us:                                      ; preds = %.lr.ph13.us.preheader107, %.lr.ph13.us
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %.lr.ph13.us ], [ %indvars.iv56.ph, %.lr.ph13.us.preheader107 ]
  %21 = getelementptr inbounds double, double* %5, i64 %indvars.iv56
  %22 = bitcast double* %21 to i64*
  %23 = load i64, i64* %22, align 8
  %24 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv60, i64 %indvars.iv58, i64 %indvars.iv56
  %25 = bitcast double* %24 to i64*
  store i64 %23, i64* %25, align 8
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %26 = icmp slt i64 %indvars.iv.next57, %10
  br i1 %26, label %.lr.ph13.us, label %._crit_edge14.us.loopexit, !llvm.loop !3

.lr.ph13.us.preheader:                            ; preds = %._crit_edge.us.us
  %scevgep69 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv60, i64 %indvars.iv58, i64 %10
  br i1 %min.iters.check, label %.lr.ph13.us.preheader107, label %min.iters.checked

.lr.ph13.us.preheader107:                         ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph13.us.preheader
  %indvars.iv56.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph13.us.preheader ], [ %n.vec, %middle.block ]
  br label %.lr.ph13.us

min.iters.checked:                                ; preds = %.lr.ph13.us.preheader
  br i1 %cmp.zero, label %.lr.ph13.us.preheader107, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep71
  %bound1 = icmp ugt double* %scevgep69, %5
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.lr.ph13.us.preheader107, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br i1 %lcmp.mod114, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter115 = phi i64 [ %prol.iter115.sub, %vector.body.prol ], [ %xtraiter113, %vector.body.prol.preheader ]
  %27 = getelementptr inbounds double, double* %5, i64 %index.prol
  %28 = bitcast double* %27 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %28, align 8, !alias.scope !6
  %29 = getelementptr double, double* %27, i64 2
  %30 = bitcast double* %29 to <2 x i64>*
  %wide.load74.prol = load <2 x i64>, <2 x i64>* %30, align 8, !alias.scope !6
  %31 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv60, i64 %indvars.iv58, i64 %index.prol
  %32 = bitcast double* %31 to <2 x i64>*
  store <2 x i64> %wide.load.prol, <2 x i64>* %32, align 8, !alias.scope !9, !noalias !6
  %33 = getelementptr double, double* %31, i64 2
  %34 = bitcast double* %33 to <2 x i64>*
  store <2 x i64> %wide.load74.prol, <2 x i64>* %34, align 8, !alias.scope !9, !noalias !6
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter115.sub = add i64 %prol.iter115, -1
  %prol.iter115.cmp = icmp eq i64 %prol.iter115.sub, 0
  br i1 %prol.iter115.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !11

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
  %wide.load74 = load <2 x i64>, <2 x i64>* %38, align 8, !alias.scope !6
  %39 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv60, i64 %indvars.iv58, i64 %index
  %40 = bitcast double* %39 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %40, align 8, !alias.scope !9, !noalias !6
  %41 = getelementptr double, double* %39, i64 2
  %42 = bitcast double* %41 to <2 x i64>*
  store <2 x i64> %wide.load74, <2 x i64>* %42, align 8, !alias.scope !9, !noalias !6
  %index.next = add i64 %index, 4
  %43 = getelementptr inbounds double, double* %5, i64 %index.next
  %44 = bitcast double* %43 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %44, align 8, !alias.scope !6
  %45 = getelementptr double, double* %43, i64 2
  %46 = bitcast double* %45 to <2 x i64>*
  %wide.load74.1 = load <2 x i64>, <2 x i64>* %46, align 8, !alias.scope !6
  %47 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv60, i64 %indvars.iv58, i64 %index.next
  %48 = bitcast double* %47 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %48, align 8, !alias.scope !9, !noalias !6
  %49 = getelementptr double, double* %47, i64 2
  %50 = bitcast double* %49 to <2 x i64>*
  store <2 x i64> %wide.load74.1, <2 x i64>* %50, align 8, !alias.scope !9, !noalias !6
  %index.next.1 = add i64 %index, 8
  %51 = getelementptr inbounds double, double* %5, i64 %index.next.1
  %52 = bitcast double* %51 to <2 x i64>*
  %wide.load.2 = load <2 x i64>, <2 x i64>* %52, align 8, !alias.scope !6
  %53 = getelementptr double, double* %51, i64 2
  %54 = bitcast double* %53 to <2 x i64>*
  %wide.load74.2 = load <2 x i64>, <2 x i64>* %54, align 8, !alias.scope !6
  %55 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv60, i64 %indvars.iv58, i64 %index.next.1
  %56 = bitcast double* %55 to <2 x i64>*
  store <2 x i64> %wide.load.2, <2 x i64>* %56, align 8, !alias.scope !9, !noalias !6
  %57 = getelementptr double, double* %55, i64 2
  %58 = bitcast double* %57 to <2 x i64>*
  store <2 x i64> %wide.load74.2, <2 x i64>* %58, align 8, !alias.scope !9, !noalias !6
  %index.next.2 = add i64 %index, 12
  %59 = getelementptr inbounds double, double* %5, i64 %index.next.2
  %60 = bitcast double* %59 to <2 x i64>*
  %wide.load.3 = load <2 x i64>, <2 x i64>* %60, align 8, !alias.scope !6
  %61 = getelementptr double, double* %59, i64 2
  %62 = bitcast double* %61 to <2 x i64>*
  %wide.load74.3 = load <2 x i64>, <2 x i64>* %62, align 8, !alias.scope !6
  %63 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv60, i64 %indvars.iv58, i64 %index.next.2
  %64 = bitcast double* %63 to <2 x i64>*
  store <2 x i64> %wide.load.3, <2 x i64>* %64, align 8, !alias.scope !9, !noalias !6
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x i64>*
  store <2 x i64> %wide.load74.3, <2 x i64>* %66, align 8, !alias.scope !9, !noalias !6
  %index.next.3 = add i64 %index, 16
  %67 = icmp eq i64 %index.next.3, %n.vec
  br i1 %67, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !12

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  br i1 %cmp.n, label %._crit_edge14.us, label %.lr.ph13.us.preheader107

.lr.ph.us.us:                                     ; preds = %.preheader5.us, %._crit_edge.us.us
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %._crit_edge.us.us ], [ 0, %.preheader5.us ]
  %68 = getelementptr inbounds double, double* %5, i64 %indvars.iv54
  store double 0.000000e+00, double* %68, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %69 = load double, double* %20, align 8
  %70 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv54
  %71 = load double, double* %70, align 8
  %72 = fmul double %69, %71
  %73 = fadd double %72, 0.000000e+00
  store double %73, double* %68, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %74 = phi double [ %73, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv52.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %13, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond63 = icmp eq i64 %indvars.iv.next55, %10
  br i1 %exitcond63, label %.lr.ph13.us.preheader, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %75 = phi double [ %87, %.lr.ph.us.us.new ], [ %74, %.lr.ph.us.us.new.preheader ]
  %indvars.iv52 = phi i64 [ %indvars.iv.next53.1, %.lr.ph.us.us.new ], [ %indvars.iv52.unr.ph, %.lr.ph.us.us.new.preheader ]
  %76 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv60, i64 %indvars.iv58, i64 %indvars.iv52
  %77 = load double, double* %76, align 8
  %78 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv52, i64 %indvars.iv54
  %79 = load double, double* %78, align 8
  %80 = fmul double %77, %79
  %81 = fadd double %80, %75
  store double %81, double* %68, align 8
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %82 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv60, i64 %indvars.iv58, i64 %indvars.iv.next53
  %83 = load double, double* %82, align 8
  %84 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next53, i64 %indvars.iv54
  %85 = load double, double* %84, align 8
  %86 = fmul double %83, %85
  %87 = fadd double %86, %81
  store double %87, double* %68, align 8
  %indvars.iv.next53.1 = add nuw nsw i64 %indvars.iv52, 2
  %exitcond62.1 = icmp eq i64 %indvars.iv.next53.1, %10
  br i1 %exitcond62.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.preheader5:                                      ; preds = %.preheader5, %.preheader5.preheader.new
  %indvars.iv48 = phi i64 [ %indvars.iv48.unr, %.preheader5.preheader.new ], [ %indvars.iv.next49.7, %.preheader5 ]
  %indvars.iv.next49.7 = add nsw i64 %indvars.iv48, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next49.7, %11
  br i1 %exitcond.7, label %._crit_edge16.loopexit108.unr-lcssa, label %.preheader5

._crit_edge16.loopexit:                           ; preds = %._crit_edge14.us
  br label %._crit_edge16

._crit_edge16.loopexit108.unr-lcssa:              ; preds = %.preheader5
  br label %._crit_edge16.loopexit108

._crit_edge16.loopexit108:                        ; preds = %.preheader5.prol.loopexit, %._crit_edge16.loopexit108.unr-lcssa
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit108, %._crit_edge16.loopexit, %.preheader6
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond110 = icmp eq i64 %indvars.iv.next61, %12
  br i1 %exitcond110, label %._crit_edge32.loopexit, label %.preheader6

._crit_edge32.loopexit:                           ; preds = %._crit_edge16
  br label %._crit_edge32

._crit_edge32:                                    ; preds = %._crit_edge32.loopexit, %6
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
.preheader7.lr.ph:
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge18.us, %.preheader7.lr.ph
  %indvars.iv56 = phi i64 [ 0, %.preheader7.lr.ph ], [ %indvars.iv.next57, %._crit_edge18.us ]
  br label %.preheader6.us.us

._crit_edge18.us:                                 ; preds = %._crit_edge16.us.us
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next57, 150
  br i1 %exitcond68, label %.preheader.us.preheader, label %.preheader7.us

.preheader.us.preheader:                          ; preds = %._crit_edge18.us
  br label %.preheader.us

.preheader6.us.us:                                ; preds = %.preheader7.us, %._crit_edge16.us.us
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %._crit_edge16.us.us ], [ 0, %.preheader7.us ]
  %5 = mul nuw nsw i64 %indvars.iv53, %indvars.iv56
  br label %6

._crit_edge16.us.us:                              ; preds = %6
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond63 = icmp eq i64 %indvars.iv.next54, 140
  br i1 %exitcond63, label %._crit_edge18.us, label %.preheader6.us.us

; <label>:6:                                      ; preds = %6, %.preheader6.us.us
  %indvars.iv50 = phi i64 [ 0, %.preheader6.us.us ], [ %indvars.iv.next51.1, %6 ]
  %7 = add nuw nsw i64 %5, %indvars.iv50
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 160
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv56, i64 %indvars.iv53, i64 %indvars.iv50
  %indvars.iv.next51 = or i64 %indvars.iv50, 1
  %12 = add nuw nsw i64 %5, %indvars.iv.next51
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 160
  %15 = sitofp i32 %14 to double
  %16 = insertelement <2 x double> undef, double %10, i32 0
  %17 = insertelement <2 x double> %16, double %15, i32 1
  %18 = fdiv <2 x double> %17, <double 1.600000e+02, double 1.600000e+02>
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %indvars.iv.next51.1 = add nsw i64 %indvars.iv50, 2
  %exitcond62.1 = icmp eq i64 %indvars.iv.next51.1, 160
  br i1 %exitcond62.1, label %._crit_edge16.us.us, label %6

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %20

; <label>:20:                                     ; preds = %20, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %20 ]
  %21 = mul nuw nsw i64 %indvars.iv47, %indvars.iv
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 160
  %24 = sitofp i32 %23 to double
  %25 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv47, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %26 = mul nuw nsw i64 %indvars.iv47, %indvars.iv.next
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 160
  %29 = sitofp i32 %28 to double
  %30 = insertelement <2 x double> undef, double %24, i32 0
  %31 = insertelement <2 x double> %30, double %29, i32 1
  %32 = fdiv <2 x double> %31, <double 1.600000e+02, double 1.600000e+02>
  %33 = bitcast double* %25 to <2 x double>*
  store <2 x double> %32, <2 x double>* %33, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %._crit_edge.us, label %20

._crit_edge.us:                                   ; preds = %20
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next48, 160
  br i1 %exitcond67, label %._crit_edge9, label %.preheader.us

._crit_edge9:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, i32, [140 x [160 x double]]*) unnamed_addr #1 {
.preheader3.lr.ph:
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %._crit_edge6.us, %.preheader3.lr.ph
  %indvars.iv39 = phi i64 [ 0, %.preheader3.lr.ph ], [ %indvars.iv.next40, %._crit_edge6.us ]
  %8 = mul nuw nsw i64 %indvars.iv39, 140
  %9 = trunc i64 %8 to i32
  br label %.preheader.us.us

._crit_edge6.us:                                  ; preds = %._crit_edge5.us.us
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond = icmp eq i64 %indvars.iv.next40, 150
  br i1 %exitcond, label %._crit_edge11, label %.preheader3.us

.preheader.us.us:                                 ; preds = %.preheader3.us, %._crit_edge5.us.us
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %._crit_edge5.us.us ], [ 0, %.preheader3.us ]
  %10 = trunc i64 %indvars.iv36 to i32
  %11 = add i32 %9, %10
  %12 = mul i32 %11, 160
  br label %13

._crit_edge5.us.us:                               ; preds = %._crit_edge.us.us
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next37, 140
  br i1 %exitcond44, label %._crit_edge6.us, label %.preheader.us.us

; <label>:13:                                     ; preds = %._crit_edge.us.us, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us.us ], [ 0, %.preheader.us.us ]
  %14 = trunc i64 %indvars.iv to i32
  %15 = add nsw i32 %12, %14
  %16 = srem i32 %15, 20
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %._crit_edge.us.us

; <label>:18:                                     ; preds = %13
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = call i32 @fputc(i32 10, %struct._IO_FILE* %19) #5
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %18, %13
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv39, i64 %indvars.iv36, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %22) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond43, label %._crit_edge5.us.us, label %13

._crit_edge11:                                    ; preds = %._crit_edge6.us
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %26) #5
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
