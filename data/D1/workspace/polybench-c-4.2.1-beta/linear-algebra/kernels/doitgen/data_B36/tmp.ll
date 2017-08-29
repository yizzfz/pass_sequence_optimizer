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
  br i1 %7, label %.preheader6.lr.ph, label %._crit_edge35

.preheader6.lr.ph:                                ; preds = %6
  %8 = icmp sgt i32 %1, 0
  %9 = icmp sgt i32 %2, 0
  %10 = sext i32 %2 to i64
  %11 = sext i32 %1 to i64
  %12 = sext i32 %0 to i64
  %xtraiter = and i32 %2, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %13 = icmp eq i32 %2, 1
  %wide.trip.count61 = zext i32 %2 to i64
  %scevgep76 = getelementptr double, double* %5, i64 %10
  %14 = add nsw i64 %11, -1
  %15 = add nsw i64 %10, -4
  %16 = lshr i64 %15, 2
  %17 = add nuw nsw i64 %16, 1
  %min.iters.check = icmp ult i32 %2, 4
  %n.vec = and i64 %10, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %xtraiter118 = and i64 %17, 3
  %lcmp.mod119 = icmp eq i64 %xtraiter118, 0
  %18 = icmp ult i64 %15, 12
  %cmp.n = icmp eq i64 %10, %n.vec
  %xtraiter116 = and i64 %11, 7
  %lcmp.mod117 = icmp eq i64 %xtraiter116, 0
  %19 = icmp ult i64 %14, 7
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge18, %.preheader6.lr.ph
  %indvars.iv67 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next68, %._crit_edge18 ]
  br i1 %8, label %.preheader5.lr.ph, label %._crit_edge18

.preheader5.lr.ph:                                ; preds = %.preheader6
  br i1 %9, label %.preheader5.us.preheader, label %.preheader5.preheader

.preheader5.preheader:                            ; preds = %.preheader5.lr.ph
  br i1 %lcmp.mod117, label %.preheader5.prol.loopexit, label %.preheader5.prol.preheader

.preheader5.prol.preheader:                       ; preds = %.preheader5.preheader
  br label %.preheader5.prol

.preheader5.prol:                                 ; preds = %.preheader5.prol, %.preheader5.prol.preheader
  %indvars.iv51.prol = phi i64 [ %indvars.iv.next52.prol, %.preheader5.prol ], [ 0, %.preheader5.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader5.prol ], [ %xtraiter116, %.preheader5.prol.preheader ]
  %indvars.iv.next52.prol = add nuw nsw i64 %indvars.iv51.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader5.prol.loopexit.unr-lcssa, label %.preheader5.prol, !llvm.loop !1

.preheader5.prol.loopexit.unr-lcssa:              ; preds = %.preheader5.prol
  br label %.preheader5.prol.loopexit

.preheader5.prol.loopexit:                        ; preds = %.preheader5.preheader, %.preheader5.prol.loopexit.unr-lcssa
  %indvars.iv51.unr = phi i64 [ 0, %.preheader5.preheader ], [ %indvars.iv.next52.prol, %.preheader5.prol.loopexit.unr-lcssa ]
  br i1 %19, label %._crit_edge18.loopexit113, label %.preheader5.preheader.new

.preheader5.preheader.new:                        ; preds = %.preheader5.prol.loopexit
  br label %.preheader5

.preheader5.us.preheader:                         ; preds = %.preheader5.lr.ph
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %._crit_edge16.us, %.preheader5.us.preheader
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %._crit_edge16.us ], [ 0, %.preheader5.us.preheader ]
  %scevgep = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 0
  %20 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 0
  br label %.lr.ph.us.us

._crit_edge16.us.loopexit:                        ; preds = %.lr.ph15.us
  br label %._crit_edge16.us

._crit_edge16.us:                                 ; preds = %._crit_edge16.us.loopexit, %middle.block
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond114 = icmp eq i64 %indvars.iv.next66, %11
  br i1 %exitcond114, label %._crit_edge18.loopexit, label %.preheader5.us

.lr.ph15.us:                                      ; preds = %.lr.ph15.us.preheader112, %.lr.ph15.us
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %.lr.ph15.us ], [ %indvars.iv63.ph, %.lr.ph15.us.preheader112 ]
  %21 = getelementptr inbounds double, double* %5, i64 %indvars.iv63
  %22 = bitcast double* %21 to i64*
  %23 = load i64, i64* %22, align 8
  %24 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %indvars.iv63
  %25 = bitcast double* %24 to i64*
  store i64 %23, i64* %25, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %26 = icmp slt i64 %indvars.iv.next64, %10
  br i1 %26, label %.lr.ph15.us, label %._crit_edge16.us.loopexit, !llvm.loop !3

.lr.ph15.us.preheader:                            ; preds = %._crit_edge.us.us
  %scevgep74 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %10
  br i1 %min.iters.check, label %.lr.ph15.us.preheader112, label %min.iters.checked

.lr.ph15.us.preheader112:                         ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph15.us.preheader
  %indvars.iv63.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph15.us.preheader ], [ %n.vec, %middle.block ]
  br label %.lr.ph15.us

min.iters.checked:                                ; preds = %.lr.ph15.us.preheader
  br i1 %cmp.zero, label %.lr.ph15.us.preheader112, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep76
  %bound1 = icmp ugt double* %scevgep74, %5
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.lr.ph15.us.preheader112, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br i1 %lcmp.mod119, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter120 = phi i64 [ %prol.iter120.sub, %vector.body.prol ], [ %xtraiter118, %vector.body.prol.preheader ]
  %27 = getelementptr inbounds double, double* %5, i64 %index.prol
  %28 = bitcast double* %27 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %28, align 8, !alias.scope !6
  %29 = getelementptr double, double* %27, i64 2
  %30 = bitcast double* %29 to <2 x i64>*
  %wide.load79.prol = load <2 x i64>, <2 x i64>* %30, align 8, !alias.scope !6
  %31 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %index.prol
  %32 = bitcast double* %31 to <2 x i64>*
  store <2 x i64> %wide.load.prol, <2 x i64>* %32, align 8, !alias.scope !9, !noalias !6
  %33 = getelementptr double, double* %31, i64 2
  %34 = bitcast double* %33 to <2 x i64>*
  store <2 x i64> %wide.load79.prol, <2 x i64>* %34, align 8, !alias.scope !9, !noalias !6
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter120.sub = add i64 %prol.iter120, -1
  %prol.iter120.cmp = icmp eq i64 %prol.iter120.sub, 0
  br i1 %prol.iter120.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !11

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
  %wide.load79 = load <2 x i64>, <2 x i64>* %38, align 8, !alias.scope !6
  %39 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %index
  %40 = bitcast double* %39 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %40, align 8, !alias.scope !9, !noalias !6
  %41 = getelementptr double, double* %39, i64 2
  %42 = bitcast double* %41 to <2 x i64>*
  store <2 x i64> %wide.load79, <2 x i64>* %42, align 8, !alias.scope !9, !noalias !6
  %index.next = add i64 %index, 4
  %43 = getelementptr inbounds double, double* %5, i64 %index.next
  %44 = bitcast double* %43 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %44, align 8, !alias.scope !6
  %45 = getelementptr double, double* %43, i64 2
  %46 = bitcast double* %45 to <2 x i64>*
  %wide.load79.1 = load <2 x i64>, <2 x i64>* %46, align 8, !alias.scope !6
  %47 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %index.next
  %48 = bitcast double* %47 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %48, align 8, !alias.scope !9, !noalias !6
  %49 = getelementptr double, double* %47, i64 2
  %50 = bitcast double* %49 to <2 x i64>*
  store <2 x i64> %wide.load79.1, <2 x i64>* %50, align 8, !alias.scope !9, !noalias !6
  %index.next.1 = add i64 %index, 8
  %51 = getelementptr inbounds double, double* %5, i64 %index.next.1
  %52 = bitcast double* %51 to <2 x i64>*
  %wide.load.2 = load <2 x i64>, <2 x i64>* %52, align 8, !alias.scope !6
  %53 = getelementptr double, double* %51, i64 2
  %54 = bitcast double* %53 to <2 x i64>*
  %wide.load79.2 = load <2 x i64>, <2 x i64>* %54, align 8, !alias.scope !6
  %55 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %index.next.1
  %56 = bitcast double* %55 to <2 x i64>*
  store <2 x i64> %wide.load.2, <2 x i64>* %56, align 8, !alias.scope !9, !noalias !6
  %57 = getelementptr double, double* %55, i64 2
  %58 = bitcast double* %57 to <2 x i64>*
  store <2 x i64> %wide.load79.2, <2 x i64>* %58, align 8, !alias.scope !9, !noalias !6
  %index.next.2 = add i64 %index, 12
  %59 = getelementptr inbounds double, double* %5, i64 %index.next.2
  %60 = bitcast double* %59 to <2 x i64>*
  %wide.load.3 = load <2 x i64>, <2 x i64>* %60, align 8, !alias.scope !6
  %61 = getelementptr double, double* %59, i64 2
  %62 = bitcast double* %61 to <2 x i64>*
  %wide.load79.3 = load <2 x i64>, <2 x i64>* %62, align 8, !alias.scope !6
  %63 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %index.next.2
  %64 = bitcast double* %63 to <2 x i64>*
  store <2 x i64> %wide.load.3, <2 x i64>* %64, align 8, !alias.scope !9, !noalias !6
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x i64>*
  store <2 x i64> %wide.load79.3, <2 x i64>* %66, align 8, !alias.scope !9, !noalias !6
  %index.next.3 = add i64 %index, 16
  %67 = icmp eq i64 %index.next.3, %n.vec
  br i1 %67, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !12

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  br i1 %cmp.n, label %._crit_edge16.us, label %.lr.ph15.us.preheader112

.lr.ph.us.us:                                     ; preds = %.preheader5.us, %._crit_edge.us.us
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %._crit_edge.us.us ], [ 0, %.preheader5.us ]
  %68 = getelementptr inbounds double, double* %5, i64 %indvars.iv59
  store double 0.000000e+00, double* %68, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %69 = load double, double* %20, align 8
  %70 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv59
  %71 = load double, double* %70, align 8
  %72 = fmul double %69, %71
  %73 = fadd double %72, 0.000000e+00
  store double %73, double* %68, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
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
  br i1 %exitcond62, label %.lr.ph15.us.preheader, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %75 = phi double [ %87, %.lr.ph.us.us.new ], [ %74, %.lr.ph.us.us.new.preheader ]
  %indvars.iv55 = phi i64 [ %indvars.iv.next56.1, %.lr.ph.us.us.new ], [ %indvars.iv55.unr.ph, %.lr.ph.us.us.new.preheader ]
  %76 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %indvars.iv55
  %77 = load double, double* %76, align 8
  %78 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv55, i64 %indvars.iv59
  %79 = load double, double* %78, align 8
  %80 = fmul double %77, %79
  %81 = fadd double %75, %80
  store double %81, double* %68, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %82 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %indvars.iv.next56
  %83 = load double, double* %82, align 8
  %84 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next56, i64 %indvars.iv59
  %85 = load double, double* %84, align 8
  %86 = fmul double %83, %85
  %87 = fadd double %81, %86
  store double %87, double* %68, align 8
  %indvars.iv.next56.1 = add nuw nsw i64 %indvars.iv55, 2
  %exitcond58.1 = icmp eq i64 %indvars.iv.next56.1, %wide.trip.count61
  br i1 %exitcond58.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.preheader5:                                      ; preds = %.preheader5, %.preheader5.preheader.new
  %indvars.iv51 = phi i64 [ %indvars.iv51.unr, %.preheader5.preheader.new ], [ %indvars.iv.next52.7, %.preheader5 ]
  %indvars.iv.next52.7 = add nsw i64 %indvars.iv51, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next52.7, %11
  br i1 %exitcond.7, label %._crit_edge18.loopexit113.unr-lcssa, label %.preheader5

._crit_edge18.loopexit:                           ; preds = %._crit_edge16.us
  br label %._crit_edge18

._crit_edge18.loopexit113.unr-lcssa:              ; preds = %.preheader5
  br label %._crit_edge18.loopexit113

._crit_edge18.loopexit113:                        ; preds = %.preheader5.prol.loopexit, %._crit_edge18.loopexit113.unr-lcssa
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge18.loopexit113, %._crit_edge18.loopexit, %.preheader6
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond115 = icmp eq i64 %indvars.iv.next68, %12
  br i1 %exitcond115, label %._crit_edge35.loopexit, label %.preheader6

._crit_edge35.loopexit:                           ; preds = %._crit_edge18
  br label %._crit_edge35

._crit_edge35:                                    ; preds = %._crit_edge35.loopexit, %6
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
  br i1 %10, label %11, label %15

; <label>:11:                                     ; preds = %2
  %12 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %12, align 1
  %13 = icmp eq i8 %strcmpload, 0
  br i1 %13, label %14, label %15

; <label>:14:                                     ; preds = %11
  tail call fastcc void @print_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6)
  br label %15

; <label>:15:                                     ; preds = %11, %14, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, [140 x [160 x double]]*, [160 x double]*) unnamed_addr #0 {
.preheader7.lr.ph:
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge19.us, %.preheader7.lr.ph
  %indvars.iv59 = phi i64 [ 0, %.preheader7.lr.ph ], [ %indvars.iv.next60, %._crit_edge19.us ]
  br label %.preheader6.us.us

._crit_edge19.us:                                 ; preds = %._crit_edge16.us.us
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next60, 150
  br i1 %exitcond65, label %.preheader.us.preheader, label %.preheader7.us

.preheader.us.preheader:                          ; preds = %._crit_edge19.us
  br label %.preheader.us

.preheader6.us.us:                                ; preds = %.preheader7.us, %._crit_edge16.us.us
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %._crit_edge16.us.us ], [ 0, %.preheader7.us ]
  %5 = mul nuw nsw i64 %indvars.iv59, %indvars.iv55
  br label %6

._crit_edge16.us.us:                              ; preds = %6
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next56, 140
  br i1 %exitcond58, label %._crit_edge19.us, label %.preheader6.us.us

; <label>:6:                                      ; preds = %6, %.preheader6.us.us
  %indvars.iv51 = phi i64 [ 0, %.preheader6.us.us ], [ %indvars.iv.next52.1, %6 ]
  %7 = add nuw nsw i64 %5, %indvars.iv51
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 160
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv59, i64 %indvars.iv55, i64 %indvars.iv51
  %indvars.iv.next52 = or i64 %indvars.iv51, 1
  %12 = add nuw nsw i64 %5, %indvars.iv.next52
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 160
  %15 = sitofp i32 %14 to double
  %16 = insertelement <2 x double> undef, double %10, i32 0
  %17 = insertelement <2 x double> %16, double %15, i32 1
  %18 = fdiv <2 x double> %17, <double 1.600000e+02, double 1.600000e+02>
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %indvars.iv.next52.1 = add nsw i64 %indvars.iv51, 2
  %exitcond54.1 = icmp eq i64 %indvars.iv.next52.1, 160
  br i1 %exitcond54.1, label %._crit_edge16.us.us, label %6

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %20

; <label>:20:                                     ; preds = %20, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %20 ]
  %21 = mul nuw nsw i64 %indvars.iv48, %indvars.iv
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 160
  %24 = sitofp i32 %23 to double
  %25 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv48, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %26 = mul nuw nsw i64 %indvars.iv48, %indvars.iv.next
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
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next49, 160
  br i1 %exitcond64, label %._crit_edge10, label %.preheader.us

._crit_edge10:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, i32, [140 x [160 x double]]*) unnamed_addr #1 {
.preheader3.lr.ph:
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %._crit_edge5.us, %.preheader3.lr.ph
  %indvars.iv37 = phi i64 [ 0, %.preheader3.lr.ph ], [ %indvars.iv.next38, %._crit_edge5.us ]
  %8 = mul nuw nsw i64 %indvars.iv37, 140
  br label %.preheader.us.us

._crit_edge5.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond = icmp eq i64 %indvars.iv.next38, 150
  br i1 %exitcond, label %._crit_edge10, label %.preheader3.us

.preheader.us.us:                                 ; preds = %.preheader3.us, %._crit_edge.us.us
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %._crit_edge.us.us ], [ 0, %.preheader3.us ]
  %9 = add nuw nsw i64 %8, %indvars.iv33
  %10 = mul nuw nsw i64 %9, 160
  br label %11

._crit_edge.us.us:                                ; preds = %18
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next34, 140
  br i1 %exitcond36, label %._crit_edge5.us, label %.preheader.us.us

; <label>:11:                                     ; preds = %18, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %18 ], [ 0, %.preheader.us.us ]
  %12 = add nuw nsw i64 %10, %indvars.iv
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %18

; <label>:16:                                     ; preds = %11
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %18

; <label>:18:                                     ; preds = %16, %11
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv37, i64 %indvars.iv33, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond32, label %._crit_edge.us.us, label %11

._crit_edge10:                                    ; preds = %._crit_edge5.us
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %25) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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
