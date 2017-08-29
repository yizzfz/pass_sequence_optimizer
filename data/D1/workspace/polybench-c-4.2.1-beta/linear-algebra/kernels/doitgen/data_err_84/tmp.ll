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
  br i1 %7, label %.lr.ph35, label %._crit_edge

.lr.ph35:                                         ; preds = %6
  %8 = icmp sgt i32 %1, 0
  %9 = icmp sgt i32 %2, 0
  %10 = sext i32 %2 to i64
  %11 = sext i32 %1 to i64
  %12 = sext i32 %0 to i64
  %xtraiter = and i32 %2, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %13 = icmp eq i32 %2, 1
  %wide.trip.count61 = zext i32 %2 to i64
  %scevgep75 = getelementptr double, double* %5, i64 %10
  %14 = add nsw i64 %11, -1
  %15 = add nsw i64 %10, -4
  %16 = lshr i64 %15, 2
  %17 = add nuw nsw i64 %16, 1
  %min.iters.check = icmp ult i32 %2, 4
  %n.vec = and i64 %10, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %xtraiter116 = and i64 %17, 3
  %lcmp.mod117 = icmp eq i64 %xtraiter116, 0
  %18 = icmp ult i64 %15, 12
  %cmp.n = icmp eq i64 %10, %n.vec
  %xtraiter114 = and i64 %11, 7
  %lcmp.mod115 = icmp eq i64 %xtraiter114, 0
  %19 = icmp ult i64 %14, 7
  br label %20

; <label>:20:                                     ; preds = %._crit_edge18, %.lr.ph35
  %indvars.iv67 = phi i64 [ 0, %.lr.ph35 ], [ %indvars.iv.next68, %._crit_edge18 ]
  br i1 %8, label %.lr.ph17, label %._crit_edge18

.lr.ph17:                                         ; preds = %20
  br i1 %9, label %.lr.ph17.split.us.preheader, label %.lr.ph17.split.preheader

.lr.ph17.split.preheader:                         ; preds = %.lr.ph17
  br i1 %lcmp.mod115, label %.lr.ph17.split.prol.loopexit, label %.lr.ph17.split.prol.preheader

.lr.ph17.split.prol.preheader:                    ; preds = %.lr.ph17.split.preheader
  br label %.lr.ph17.split.prol

.lr.ph17.split.prol:                              ; preds = %.lr.ph17.split.prol, %.lr.ph17.split.prol.preheader
  %indvars.iv51.prol = phi i64 [ %indvars.iv.next52.prol, %.lr.ph17.split.prol ], [ 0, %.lr.ph17.split.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph17.split.prol ], [ %xtraiter114, %.lr.ph17.split.prol.preheader ]
  %indvars.iv.next52.prol = add nuw nsw i64 %indvars.iv51.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph17.split.prol.loopexit.unr-lcssa, label %.lr.ph17.split.prol, !llvm.loop !1

.lr.ph17.split.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph17.split.prol
  br label %.lr.ph17.split.prol.loopexit

.lr.ph17.split.prol.loopexit:                     ; preds = %.lr.ph17.split.preheader, %.lr.ph17.split.prol.loopexit.unr-lcssa
  %indvars.iv51.unr = phi i64 [ 0, %.lr.ph17.split.preheader ], [ %indvars.iv.next52.prol, %.lr.ph17.split.prol.loopexit.unr-lcssa ]
  br i1 %19, label %._crit_edge18.loopexit111, label %.lr.ph17.split.preheader.new

.lr.ph17.split.preheader.new:                     ; preds = %.lr.ph17.split.prol.loopexit
  br label %.lr.ph17.split

.lr.ph17.split.us.preheader:                      ; preds = %.lr.ph17
  br label %.lr.ph17.split.us

.lr.ph17.split.us:                                ; preds = %._crit_edge13.us, %.lr.ph17.split.us.preheader
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %._crit_edge13.us ], [ 0, %.lr.ph17.split.us.preheader ]
  %scevgep = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 0
  br label %.lr.ph.us.us

._crit_edge13.us.loopexit:                        ; preds = %.lr.ph12.us
  br label %._crit_edge13.us

._crit_edge13.us:                                 ; preds = %._crit_edge13.us.loopexit, %middle.block
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond112 = icmp eq i64 %indvars.iv.next66, %11
  br i1 %exitcond112, label %._crit_edge18.loopexit, label %.lr.ph17.split.us

.lr.ph12.us:                                      ; preds = %.lr.ph12.us.preheader, %.lr.ph12.us
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %.lr.ph12.us ], [ %indvars.iv63.ph, %.lr.ph12.us.preheader ]
  %21 = getelementptr inbounds double, double* %5, i64 %indvars.iv63
  %22 = bitcast double* %21 to i64*
  %23 = load i64, i64* %22, align 8
  %24 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %indvars.iv63
  %25 = bitcast double* %24 to i64*
  store i64 %23, i64* %25, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %26 = icmp slt i64 %indvars.iv.next64, %10
  br i1 %26, label %.lr.ph12.us, label %._crit_edge13.us.loopexit, !llvm.loop !3

min.iters.checked:                                ; preds = %._crit_edge.us.us.._crit_edge7.us_crit_edge
  br i1 %cmp.zero, label %.lr.ph12.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep75
  %bound1 = icmp ugt double* %scevgep73, %5
  %found.conflict = and i1 %bound0, %bound1
  br i1 %found.conflict, label %.lr.ph12.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br i1 %lcmp.mod117, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter118 = phi i64 [ %prol.iter118.sub, %vector.body.prol ], [ %xtraiter116, %vector.body.prol.preheader ]
  %27 = getelementptr inbounds double, double* %5, i64 %index.prol
  %28 = bitcast double* %27 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %28, align 8, !alias.scope !6
  %29 = getelementptr double, double* %27, i64 2
  %30 = bitcast double* %29 to <2 x i64>*
  %wide.load78.prol = load <2 x i64>, <2 x i64>* %30, align 8, !alias.scope !6
  %31 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %index.prol
  %32 = bitcast double* %31 to <2 x i64>*
  store <2 x i64> %wide.load.prol, <2 x i64>* %32, align 8, !alias.scope !9, !noalias !6
  %33 = getelementptr double, double* %31, i64 2
  %34 = bitcast double* %33 to <2 x i64>*
  store <2 x i64> %wide.load78.prol, <2 x i64>* %34, align 8, !alias.scope !9, !noalias !6
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter118.sub = add i64 %prol.iter118, -1
  %prol.iter118.cmp = icmp eq i64 %prol.iter118.sub, 0
  br i1 %prol.iter118.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !11

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
  %wide.load78 = load <2 x i64>, <2 x i64>* %38, align 8, !alias.scope !6
  %39 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %index
  %40 = bitcast double* %39 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %40, align 8, !alias.scope !9, !noalias !6
  %41 = getelementptr double, double* %39, i64 2
  %42 = bitcast double* %41 to <2 x i64>*
  store <2 x i64> %wide.load78, <2 x i64>* %42, align 8, !alias.scope !9, !noalias !6
  %index.next = add i64 %index, 4
  %43 = getelementptr inbounds double, double* %5, i64 %index.next
  %44 = bitcast double* %43 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %44, align 8, !alias.scope !6
  %45 = getelementptr double, double* %43, i64 2
  %46 = bitcast double* %45 to <2 x i64>*
  %wide.load78.1 = load <2 x i64>, <2 x i64>* %46, align 8, !alias.scope !6
  %47 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %index.next
  %48 = bitcast double* %47 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %48, align 8, !alias.scope !9, !noalias !6
  %49 = getelementptr double, double* %47, i64 2
  %50 = bitcast double* %49 to <2 x i64>*
  store <2 x i64> %wide.load78.1, <2 x i64>* %50, align 8, !alias.scope !9, !noalias !6
  %index.next.1 = add i64 %index, 8
  %51 = getelementptr inbounds double, double* %5, i64 %index.next.1
  %52 = bitcast double* %51 to <2 x i64>*
  %wide.load.2 = load <2 x i64>, <2 x i64>* %52, align 8, !alias.scope !6
  %53 = getelementptr double, double* %51, i64 2
  %54 = bitcast double* %53 to <2 x i64>*
  %wide.load78.2 = load <2 x i64>, <2 x i64>* %54, align 8, !alias.scope !6
  %55 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %index.next.1
  %56 = bitcast double* %55 to <2 x i64>*
  store <2 x i64> %wide.load.2, <2 x i64>* %56, align 8, !alias.scope !9, !noalias !6
  %57 = getelementptr double, double* %55, i64 2
  %58 = bitcast double* %57 to <2 x i64>*
  store <2 x i64> %wide.load78.2, <2 x i64>* %58, align 8, !alias.scope !9, !noalias !6
  %index.next.2 = add i64 %index, 12
  %59 = getelementptr inbounds double, double* %5, i64 %index.next.2
  %60 = bitcast double* %59 to <2 x i64>*
  %wide.load.3 = load <2 x i64>, <2 x i64>* %60, align 8, !alias.scope !6
  %61 = getelementptr double, double* %59, i64 2
  %62 = bitcast double* %61 to <2 x i64>*
  %wide.load78.3 = load <2 x i64>, <2 x i64>* %62, align 8, !alias.scope !6
  %63 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %index.next.2
  %64 = bitcast double* %63 to <2 x i64>*
  store <2 x i64> %wide.load.3, <2 x i64>* %64, align 8, !alias.scope !9, !noalias !6
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x i64>*
  store <2 x i64> %wide.load78.3, <2 x i64>* %66, align 8, !alias.scope !9, !noalias !6
  %index.next.3 = add i64 %index, 16
  %67 = icmp eq i64 %index.next.3, %n.vec
  br i1 %67, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !12

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  br i1 %cmp.n, label %._crit_edge13.us, label %.lr.ph12.us.preheader

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph17.split.us
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %._crit_edge.us.us ], [ 0, %.lr.ph17.split.us ]
  %68 = getelementptr inbounds double, double* %5, i64 %indvars.iv59
  store double 0.000000e+00, double* %68, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %69 = load double, double* %scevgep, align 8
  %70 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv59
  %71 = load double, double* %70, align 8
  %72 = fmul double %69, %71
  %73 = fadd double %72, 0.000000e+00
  store double %73, double* %68, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us.us, %.prol.preheader
  %74 = phi double [ %73, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv55.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %13, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next60, %wide.trip.count61
  br i1 %exitcond62, label %._crit_edge.us.us.._crit_edge7.us_crit_edge, label %.lr.ph.us.us

._crit_edge.us.us.._crit_edge7.us_crit_edge:      ; preds = %._crit_edge.us.us
  %scevgep73 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %10
  br i1 %min.iters.check, label %.lr.ph12.us.preheader, label %min.iters.checked

.lr.ph12.us.preheader:                            ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %._crit_edge.us.us.._crit_edge7.us_crit_edge
  %indvars.iv63.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %._crit_edge.us.us.._crit_edge7.us_crit_edge ], [ %n.vec, %middle.block ]
  br label %.lr.ph12.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %75 = phi double [ %87, %.lr.ph.us.us.new ], [ %74, %.lr.ph.us.us.new.preheader ]
  %indvars.iv55 = phi i64 [ %indvars.iv.next56.1, %.lr.ph.us.us.new ], [ %indvars.iv55.unr.ph, %.lr.ph.us.us.new.preheader ]
  %76 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %indvars.iv55
  %77 = load double, double* %76, align 8
  %78 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv55, i64 %indvars.iv59
  %79 = load double, double* %78, align 8
  %80 = fmul double %77, %79
  %81 = fadd double %80, %75
  store double %81, double* %68, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %82 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %indvars.iv.next56
  %83 = load double, double* %82, align 8
  %84 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next56, i64 %indvars.iv59
  %85 = load double, double* %84, align 8
  %86 = fmul double %83, %85
  %87 = fadd double %86, %81
  store double %87, double* %68, align 8
  %indvars.iv.next56.1 = add nuw nsw i64 %indvars.iv55, 2
  %exitcond58.1 = icmp eq i64 %indvars.iv.next56.1, %wide.trip.count61
  br i1 %exitcond58.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph17.split:                                   ; preds = %.lr.ph17.split, %.lr.ph17.split.preheader.new
  %indvars.iv51 = phi i64 [ %indvars.iv51.unr, %.lr.ph17.split.preheader.new ], [ %indvars.iv.next52.7, %.lr.ph17.split ]
  %indvars.iv.next52.7 = add nsw i64 %indvars.iv51, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next52.7, %11
  br i1 %exitcond.7, label %._crit_edge18.loopexit111.unr-lcssa, label %.lr.ph17.split

._crit_edge18.loopexit:                           ; preds = %._crit_edge13.us
  br label %._crit_edge18

._crit_edge18.loopexit111.unr-lcssa:              ; preds = %.lr.ph17.split
  br label %._crit_edge18.loopexit111

._crit_edge18.loopexit111:                        ; preds = %.lr.ph17.split.prol.loopexit, %._crit_edge18.loopexit111.unr-lcssa
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge18.loopexit111, %._crit_edge18.loopexit, %20
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond113 = icmp eq i64 %indvars.iv.next68, %12
  br i1 %exitcond113, label %._crit_edge.loopexit, label %20

._crit_edge.loopexit:                             ; preds = %._crit_edge18
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
  %8 = bitcast i8* %4 to double*
  call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7, double* %8)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  call fastcc void @print_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, [140 x [160 x double]]*, [160 x double]*) unnamed_addr #0 {
.lr.ph24:
  br label %.lr.ph24.split.us

.lr.ph24.split.us:                                ; preds = %._crit_edge14.us.us.._crit_edge18.us_crit_edge, %.lr.ph24
  %indvars.iv58 = phi i64 [ 0, %.lr.ph24 ], [ %indvars.iv.next59, %._crit_edge14.us.us.._crit_edge18.us_crit_edge ]
  br label %.lr.ph13.us.us

.lr.ph13.us.us:                                   ; preds = %.lr.ph13.us.us.new.._crit_edge14.us.us_crit_edge, %.lr.ph24.split.us
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %.lr.ph13.us.us.new.._crit_edge14.us.us_crit_edge ], [ 0, %.lr.ph24.split.us ]
  %5 = mul nuw nsw i64 %indvars.iv54, %indvars.iv58
  br label %.lr.ph13.us.us.new

._crit_edge14.us.us.._crit_edge18.us_crit_edge:   ; preds = %.lr.ph13.us.us.new.._crit_edge14.us.us_crit_edge
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next59, 150
  br i1 %exitcond68, label %.lr.ph6.split.us.preheader, label %.lr.ph24.split.us

.lr.ph6.split.us.preheader:                       ; preds = %._crit_edge14.us.us.._crit_edge18.us_crit_edge
  br label %.lr.ph6.split.us

.lr.ph13.us.us.new:                               ; preds = %.lr.ph13.us.us.new, %.lr.ph13.us.us
  %indvars.iv50 = phi i64 [ %indvars.iv.next51.1, %.lr.ph13.us.us.new ], [ 0, %.lr.ph13.us.us ]
  %6 = add nuw nsw i64 %5, %indvars.iv50
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 160
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv58, i64 %indvars.iv54, i64 %indvars.iv50
  %indvars.iv.next51 = or i64 %indvars.iv50, 1
  %11 = add nuw nsw i64 %5, %indvars.iv.next51
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 160
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %9, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 1.600000e+02, double 1.600000e+02>
  %18 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %indvars.iv.next51.1 = add nuw nsw i64 %indvars.iv50, 2
  %exitcond53.1 = icmp eq i64 %indvars.iv.next51.1, 160
  br i1 %exitcond53.1, label %.lr.ph13.us.us.new.._crit_edge14.us.us_crit_edge, label %.lr.ph13.us.us.new

.lr.ph13.us.us.new.._crit_edge14.us.us_crit_edge: ; preds = %.lr.ph13.us.us.new
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next55, 140
  br i1 %exitcond57, label %._crit_edge14.us.us.._crit_edge18.us_crit_edge, label %.lr.ph13.us.us

.lr.ph6.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph6.split.us.preheader
  %indvars.iv47 = phi i64 [ %indvars.iv.next48, %._crit_edge.us ], [ 0, %.lr.ph6.split.us.preheader ]
  br label %.lr.ph6.split.us.new

.lr.ph6.split.us.new:                             ; preds = %.lr.ph6.split.us.new, %.lr.ph6.split.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph6.split.us.new ], [ 0, %.lr.ph6.split.us ]
  %19 = mul nuw nsw i64 %indvars.iv, %indvars.iv47
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 160
  %22 = sitofp i32 %21 to double
  %23 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv47, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %24 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv47
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, 160
  %27 = sitofp i32 %26 to double
  %28 = insertelement <2 x double> undef, double %22, i32 0
  %29 = insertelement <2 x double> %28, double %27, i32 1
  %30 = fdiv <2 x double> %29, <double 1.600000e+02, double 1.600000e+02>
  %31 = bitcast double* %23 to <2 x double>*
  store <2 x double> %30, <2 x double>* %31, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %._crit_edge.us, label %.lr.ph6.split.us.new

._crit_edge.us:                                   ; preds = %.lr.ph6.split.us.new
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond = icmp eq i64 %indvars.iv.next48, 160
  br i1 %exitcond, label %._crit_edge7, label %.lr.ph6.split.us

._crit_edge7:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, i32, [140 x [160 x double]]*) unnamed_addr #1 {
.lr.ph11:
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph11.split.us

.lr.ph11.split.us:                                ; preds = %._crit_edge.us.us.._crit_edge5.us_crit_edge, %.lr.ph11
  %indvars.iv37 = phi i64 [ 0, %.lr.ph11 ], [ %indvars.iv.next38, %._crit_edge.us.us.._crit_edge5.us_crit_edge ]
  %8 = mul nuw nsw i64 %indvars.iv37, 140
  br label %.lr.ph.us.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph11.split.us
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %._crit_edge.us.us ], [ 0, %.lr.ph11.split.us ]
  %9 = add nuw nsw i64 %indvars.iv33, %8
  %10 = mul nuw nsw i64 %9, 160
  br label %11

._crit_edge.us.us:                                ; preds = %._crit_edge40
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next34, 140
  br i1 %exitcond36, label %._crit_edge.us.us.._crit_edge5.us_crit_edge, label %.lr.ph.us.us

._crit_edge.us.us.._crit_edge5.us_crit_edge:      ; preds = %._crit_edge.us.us
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond = icmp eq i64 %indvars.iv.next38, 150
  br i1 %exitcond, label %._crit_edge12, label %.lr.ph11.split.us

; <label>:11:                                     ; preds = %._crit_edge40, %.lr.ph.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge40 ], [ 0, %.lr.ph.us.us ]
  %12 = add nuw nsw i64 %10, %indvars.iv
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge40

; <label>:16:                                     ; preds = %11
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge40

._crit_edge40:                                    ; preds = %11, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv37, i64 %indvars.iv33, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond32, label %._crit_edge.us.us, label %11

._crit_edge12:                                    ; preds = %._crit_edge.us.us.._crit_edge5.us_crit_edge
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
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
