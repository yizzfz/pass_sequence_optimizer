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
define void @kernel_doitgen(i32, i32, i32, [140 x [160 x double]]*, [160 x double]*, double*) local_unnamed_addr #0 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader6.lr.ph, label %._crit_edge35

.preheader6.lr.ph:                                ; preds = %6
  %wide.trip.count57.1 = zext i32 %2 to i64
  %8 = sext i32 %2 to i64
  %9 = sext i32 %1 to i64
  %10 = sext i32 %0 to i64
  %xtraiter = and i32 %2, 1
  %scevgep84 = getelementptr double, double* %5, i64 %8
  %11 = add nsw i64 %9, -1
  %12 = add nsw i64 %8, -4
  %13 = lshr i64 %12, 2
  %14 = add nuw nsw i64 %13, 1
  %n.vec = and i64 %8, -4
  %xtraiter126 = and i64 %14, 3
  %xtraiter124 = and i64 %9, 7
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge18, %.preheader6.lr.ph
  %indvars.iv67 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next68, %._crit_edge18 ]
  %15 = icmp sgt i32 %1, 0
  br i1 %15, label %.preheader5.lr.ph, label %._crit_edge18

.preheader5.lr.ph:                                ; preds = %.preheader6
  %16 = icmp sgt i32 %2, 0
  br i1 %16, label %.preheader5.us.preheader, label %.preheader5.preheader

.preheader5.preheader:                            ; preds = %.preheader5.lr.ph
  %17 = icmp eq i64 %xtraiter124, 0
  br i1 %17, label %.preheader5.prol.loopexit, label %.preheader5.prol.preheader

.preheader5.prol.preheader:                       ; preds = %.preheader5.preheader
  br label %.preheader5.prol

.preheader5.prol:                                 ; preds = %.preheader5.prol, %.preheader5.prol.preheader
  %indvars.iv51.prol = phi i64 [ %indvars.iv.next52.prol, %.preheader5.prol ], [ 0, %.preheader5.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader5.prol ], [ %xtraiter124, %.preheader5.prol.preheader ]
  %indvars.iv.next52.prol = add nuw nsw i64 %indvars.iv51.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader5.prol.loopexit.loopexit, label %.preheader5.prol, !llvm.loop !1

.preheader5.prol.loopexit.loopexit:               ; preds = %.preheader5.prol
  br label %.preheader5.prol.loopexit

.preheader5.prol.loopexit:                        ; preds = %.preheader5.prol.loopexit.loopexit, %.preheader5.preheader
  %indvars.iv51.unr = phi i64 [ 0, %.preheader5.preheader ], [ %indvars.iv.next52.prol, %.preheader5.prol.loopexit.loopexit ]
  %18 = icmp ult i64 %11, 7
  br i1 %18, label %._crit_edge18, label %.preheader5.preheader.new

.preheader5.preheader.new:                        ; preds = %.preheader5.prol.loopexit
  br label %.preheader5

.preheader5.us.preheader:                         ; preds = %.preheader5.lr.ph
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %._crit_edge16.us, %.preheader5.us.preheader
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %._crit_edge16.us ], [ 0, %.preheader5.us.preheader ]
  %scevgep = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 0
  br label %.lr.ph.us.us

._crit_edge16.us.loopexit:                        ; preds = %.lr.ph15.us
  br label %._crit_edge16.us

._crit_edge16.us:                                 ; preds = %._crit_edge16.us.loopexit, %middle.block
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond122 = icmp eq i64 %indvars.iv.next66, %9
  br i1 %exitcond122, label %._crit_edge18.loopexit, label %.preheader5.us

.lr.ph15.us:                                      ; preds = %.lr.ph15.us.preheader120, %.lr.ph15.us
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %.lr.ph15.us ], [ %indvars.iv63.ph, %.lr.ph15.us.preheader120 ]
  %19 = getelementptr inbounds double, double* %5, i64 %indvars.iv63
  %20 = bitcast double* %19 to i64*
  %21 = load i64, i64* %20, align 8
  %22 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %indvars.iv63
  %23 = bitcast double* %22 to i64*
  store i64 %21, i64* %23, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %24 = icmp slt i64 %indvars.iv.next64, %8
  br i1 %24, label %.lr.ph15.us, label %._crit_edge16.us.loopexit, !llvm.loop !3

.lr.ph15.us.preheader:                            ; preds = %._crit_edge.us.us
  %25 = icmp ult i32 %2, 4
  %scevgep82 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %8
  br i1 %25, label %.lr.ph15.us.preheader120, label %min.iters.checked

.lr.ph15.us.preheader120:                         ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph15.us.preheader
  %indvars.iv63.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph15.us.preheader ], [ %n.vec, %middle.block ]
  br label %.lr.ph15.us

min.iters.checked:                                ; preds = %.lr.ph15.us.preheader
  %26 = icmp eq i64 %n.vec, 0
  br i1 %26, label %.lr.ph15.us.preheader120, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep84
  %bound1 = icmp ugt double* %scevgep82, %5
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.lr.ph15.us.preheader120, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  %27 = icmp eq i64 %xtraiter126, 0
  br i1 %27, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter128 = phi i64 [ %prol.iter128.sub, %vector.body.prol ], [ %xtraiter126, %vector.body.prol.preheader ]
  %28 = getelementptr inbounds double, double* %5, i64 %index.prol
  %29 = bitcast double* %28 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %29, align 8, !alias.scope !6
  %30 = getelementptr double, double* %28, i64 2
  %31 = bitcast double* %30 to <2 x i64>*
  %wide.load87.prol = load <2 x i64>, <2 x i64>* %31, align 8, !alias.scope !6
  %32 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %index.prol
  %33 = bitcast double* %32 to <2 x i64>*
  store <2 x i64> %wide.load.prol, <2 x i64>* %33, align 8, !alias.scope !9, !noalias !6
  %34 = getelementptr double, double* %32, i64 2
  %35 = bitcast double* %34 to <2 x i64>*
  store <2 x i64> %wide.load87.prol, <2 x i64>* %35, align 8, !alias.scope !9, !noalias !6
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter128.sub = add i64 %prol.iter128, -1
  %prol.iter128.cmp = icmp eq i64 %prol.iter128.sub, 0
  br i1 %prol.iter128.cmp, label %vector.body.prol.loopexit.loopexit, label %vector.body.prol, !llvm.loop !11

vector.body.prol.loopexit.loopexit:               ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.loopexit, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.loopexit ]
  %36 = icmp ult i64 %12, 12
  br i1 %36, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %37 = getelementptr inbounds double, double* %5, i64 %index
  %38 = bitcast double* %37 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %38, align 8, !alias.scope !6
  %39 = getelementptr double, double* %37, i64 2
  %40 = bitcast double* %39 to <2 x i64>*
  %wide.load87 = load <2 x i64>, <2 x i64>* %40, align 8, !alias.scope !6
  %41 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %index
  %42 = bitcast double* %41 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %42, align 8, !alias.scope !9, !noalias !6
  %43 = getelementptr double, double* %41, i64 2
  %44 = bitcast double* %43 to <2 x i64>*
  store <2 x i64> %wide.load87, <2 x i64>* %44, align 8, !alias.scope !9, !noalias !6
  %index.next = add i64 %index, 4
  %45 = getelementptr inbounds double, double* %5, i64 %index.next
  %46 = bitcast double* %45 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %46, align 8, !alias.scope !6
  %47 = getelementptr double, double* %45, i64 2
  %48 = bitcast double* %47 to <2 x i64>*
  %wide.load87.1 = load <2 x i64>, <2 x i64>* %48, align 8, !alias.scope !6
  %49 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %index.next
  %50 = bitcast double* %49 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %50, align 8, !alias.scope !9, !noalias !6
  %51 = getelementptr double, double* %49, i64 2
  %52 = bitcast double* %51 to <2 x i64>*
  store <2 x i64> %wide.load87.1, <2 x i64>* %52, align 8, !alias.scope !9, !noalias !6
  %index.next.1 = add i64 %index, 8
  %53 = getelementptr inbounds double, double* %5, i64 %index.next.1
  %54 = bitcast double* %53 to <2 x i64>*
  %wide.load.2 = load <2 x i64>, <2 x i64>* %54, align 8, !alias.scope !6
  %55 = getelementptr double, double* %53, i64 2
  %56 = bitcast double* %55 to <2 x i64>*
  %wide.load87.2 = load <2 x i64>, <2 x i64>* %56, align 8, !alias.scope !6
  %57 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %index.next.1
  %58 = bitcast double* %57 to <2 x i64>*
  store <2 x i64> %wide.load.2, <2 x i64>* %58, align 8, !alias.scope !9, !noalias !6
  %59 = getelementptr double, double* %57, i64 2
  %60 = bitcast double* %59 to <2 x i64>*
  store <2 x i64> %wide.load87.2, <2 x i64>* %60, align 8, !alias.scope !9, !noalias !6
  %index.next.2 = add i64 %index, 12
  %61 = getelementptr inbounds double, double* %5, i64 %index.next.2
  %62 = bitcast double* %61 to <2 x i64>*
  %wide.load.3 = load <2 x i64>, <2 x i64>* %62, align 8, !alias.scope !6
  %63 = getelementptr double, double* %61, i64 2
  %64 = bitcast double* %63 to <2 x i64>*
  %wide.load87.3 = load <2 x i64>, <2 x i64>* %64, align 8, !alias.scope !6
  %65 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %index.next.2
  %66 = bitcast double* %65 to <2 x i64>*
  store <2 x i64> %wide.load.3, <2 x i64>* %66, align 8, !alias.scope !9, !noalias !6
  %67 = getelementptr double, double* %65, i64 2
  %68 = bitcast double* %67 to <2 x i64>*
  store <2 x i64> %wide.load87.3, <2 x i64>* %68, align 8, !alias.scope !9, !noalias !6
  %index.next.3 = add i64 %index, 16
  %69 = icmp eq i64 %index.next.3, %n.vec
  br i1 %69, label %middle.block.loopexit, label %vector.body, !llvm.loop !12

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.body.prol.loopexit
  %70 = icmp eq i64 %8, %n.vec
  br i1 %70, label %._crit_edge16.us, label %.lr.ph15.us.preheader120

.lr.ph.us.us:                                     ; preds = %.preheader5.us, %._crit_edge.us.us
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %._crit_edge.us.us ], [ 0, %.preheader5.us ]
  %71 = icmp eq i32 %xtraiter, 0
  %72 = getelementptr inbounds double, double* %5, i64 %indvars.iv59
  store double 0.000000e+00, double* %72, align 8
  br i1 %71, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %73 = ptrtoint double* %5 to i64
  %74 = load double, double* %scevgep, align 8
  %75 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv59
  %76 = load double, double* %75, align 8
  %77 = fmul double %74, %76
  %sunkaddr72 = shl i64 %indvars.iv59, 3
  %sunkaddr73 = add i64 %73, %sunkaddr72
  %sunkaddr74 = inttoptr i64 %sunkaddr73 to double*
  %78 = load double, double* %sunkaddr74, align 8
  %79 = fadd double %77, %78
  store double %79, double* %sunkaddr74, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %indvars.iv55.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  %80 = icmp eq i32 %2, 1
  br i1 %80, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  %81 = ptrtoint double* %5 to i64
  %sunkaddr76 = shl i64 %indvars.iv59, 3
  %sunkaddr77 = add i64 %81, %sunkaddr76
  %sunkaddr78 = inttoptr i64 %sunkaddr77 to double*
  %.pre = load double, double* %sunkaddr78, align 8
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next60, %wide.trip.count57.1
  br i1 %exitcond62, label %.lr.ph15.us.preheader, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %82 = phi double [ %94, %.lr.ph.us.us.new ], [ %.pre, %.lr.ph.us.us.new.preheader ]
  %indvars.iv55 = phi i64 [ %indvars.iv.next56.1, %.lr.ph.us.us.new ], [ %indvars.iv55.unr.ph, %.lr.ph.us.us.new.preheader ]
  %83 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %indvars.iv55
  %84 = load double, double* %83, align 8
  %85 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv55, i64 %indvars.iv59
  %86 = load double, double* %85, align 8
  %87 = fmul double %84, %86
  %88 = fadd double %87, %82
  %sunkaddr = ptrtoint double* %5 to i64
  %sunkaddr129 = mul i64 %indvars.iv59, 8
  %sunkaddr130 = add i64 %sunkaddr, %sunkaddr129
  %sunkaddr131 = inttoptr i64 %sunkaddr130 to double*
  store double %88, double* %sunkaddr131, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %89 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %indvars.iv.next56
  %90 = load double, double* %89, align 8
  %91 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next56, i64 %indvars.iv59
  %92 = load double, double* %91, align 8
  %93 = fmul double %90, %92
  %94 = fadd double %93, %88
  store double %94, double* %sunkaddr131, align 8
  %indvars.iv.next56.1 = add nuw nsw i64 %indvars.iv55, 2
  %exitcond58.1 = icmp eq i64 %indvars.iv.next56.1, %wide.trip.count57.1
  br i1 %exitcond58.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.preheader5:                                      ; preds = %.preheader5, %.preheader5.preheader.new
  %indvars.iv51 = phi i64 [ %indvars.iv51.unr, %.preheader5.preheader.new ], [ %indvars.iv.next52.7, %.preheader5 ]
  %indvars.iv.next52.7 = add nsw i64 %indvars.iv51, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next52.7, %9
  br i1 %exitcond.7, label %._crit_edge18.loopexit132, label %.preheader5

._crit_edge18.loopexit:                           ; preds = %._crit_edge16.us
  br label %._crit_edge18

._crit_edge18.loopexit132:                        ; preds = %.preheader5
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge18.loopexit132, %._crit_edge18.loopexit, %.preheader5.prol.loopexit, %.preheader6
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond123 = icmp eq i64 %indvars.iv.next68, %10
  br i1 %exitcond123, label %._crit_edge35.loopexit, label %.preheader6

._crit_edge35.loopexit:                           ; preds = %._crit_edge18
  br label %._crit_edge35

._crit_edge35:                                    ; preds = %._crit_edge35.loopexit, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %6 = bitcast i8* %3 to [140 x [160 x double]]*
  %7 = bitcast i8* %5 to [160 x double]*
  tail call fastcc void @init_array([140 x [160 x double]]* %6, [160 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to double*
  tail call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7, double* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %15

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %3 to [140 x [160 x double]]*
  tail call fastcc void @print_array([140 x [160 x double]]* %14)
  br label %15

; <label>:15:                                     ; preds = %10, %13, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([140 x [160 x double]]*, [160 x double]*) unnamed_addr #2 {
.preheader7.lr.ph:
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge19.us, %.preheader7.lr.ph
  %indvars.iv59 = phi i64 [ 0, %.preheader7.lr.ph ], [ %indvars.iv.next60, %._crit_edge19.us ]
  br label %.preheader6.us.us

._crit_edge19.us:                                 ; preds = %._crit_edge16.us.us
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next60, 150
  br i1 %exitcond2, label %.preheader.us.preheader, label %.preheader7.us

.preheader.us.preheader:                          ; preds = %._crit_edge19.us
  br label %.preheader.us

.preheader6.us.us:                                ; preds = %.preheader7.us, %._crit_edge16.us.us
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %._crit_edge16.us.us ], [ 0, %.preheader7.us ]
  %2 = mul nuw nsw i64 %indvars.iv55, %indvars.iv59
  br label %3

._crit_edge16.us.us:                              ; preds = %3
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next56, 140
  br i1 %exitcond58, label %._crit_edge19.us, label %.preheader6.us.us

; <label>:3:                                      ; preds = %3, %.preheader6.us.us
  %indvars.iv51 = phi i64 [ 0, %.preheader6.us.us ], [ %indvars.iv.next52.1, %3 ]
  %4 = add nuw nsw i64 %2, %indvars.iv51
  %5 = trunc i64 %4 to i32
  %6 = srem i32 %5, 160
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %0, i64 %indvars.iv59, i64 %indvars.iv55, i64 %indvars.iv51
  %indvars.iv.next52 = or i64 %indvars.iv51, 1
  %9 = add nuw nsw i64 %2, %indvars.iv.next52
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 160
  %12 = sitofp i32 %11 to double
  %13 = insertelement <2 x double> undef, double %7, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  %15 = fdiv <2 x double> %14, <double 1.600000e+02, double 1.600000e+02>
  %16 = bitcast double* %8 to <2 x double>*
  store <2 x double> %15, <2 x double>* %16, align 8
  %indvars.iv.next52.1 = add nsw i64 %indvars.iv51, 2
  %exitcond54.1 = icmp eq i64 %indvars.iv.next52.1, 160
  br i1 %exitcond54.1, label %._crit_edge16.us.us, label %3

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %17

; <label>:17:                                     ; preds = %17, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %17 ]
  %18 = mul nuw nsw i64 %indvars.iv48, %indvars.iv
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, 160
  %21 = sitofp i32 %20 to double
  %22 = getelementptr inbounds [160 x double], [160 x double]* %1, i64 %indvars.iv48, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %23 = mul nuw nsw i64 %indvars.iv48, %indvars.iv.next
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, 160
  %26 = sitofp i32 %25 to double
  %27 = insertelement <2 x double> undef, double %21, i32 0
  %28 = insertelement <2 x double> %27, double %26, i32 1
  %29 = fdiv <2 x double> %28, <double 1.600000e+02, double 1.600000e+02>
  %30 = bitcast double* %22 to <2 x double>*
  store <2 x double> %29, <2 x double>* %30, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %._crit_edge.us, label %17

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next49, 160
  br i1 %exitcond1, label %._crit_edge10, label %.preheader.us

._crit_edge10:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([140 x [160 x double]]*) unnamed_addr #0 {
.preheader3.lr.ph:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %._crit_edge5.us, %.preheader3.lr.ph
  %indvars.iv37 = phi i64 [ 0, %.preheader3.lr.ph ], [ %indvars.iv.next38, %._crit_edge5.us ]
  %5 = mul nuw nsw i64 %indvars.iv37, 140
  br label %.preheader.us.us

._crit_edge5.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond = icmp eq i64 %indvars.iv.next38, 150
  br i1 %exitcond, label %._crit_edge10, label %.preheader3.us

.preheader.us.us:                                 ; preds = %.preheader3.us, %._crit_edge.us.us
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %._crit_edge.us.us ], [ 0, %.preheader3.us ]
  %6 = add nuw nsw i64 %5, %indvars.iv33
  %7 = mul nuw nsw i64 %6, 160
  br label %8

._crit_edge.us.us:                                ; preds = %15
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next34, 140
  br i1 %exitcond36, label %._crit_edge5.us, label %.preheader.us.us

; <label>:8:                                      ; preds = %15, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %15 ], [ 0, %.preheader.us.us ]
  %9 = add nuw nsw i64 %7, %indvars.iv
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %15

; <label>:15:                                     ; preds = %13, %8
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %0, i64 %indvars.iv37, i64 %indvars.iv33, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond32, label %._crit_edge.us.us, label %8

._crit_edge10:                                    ; preds = %._crit_edge5.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
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

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
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
