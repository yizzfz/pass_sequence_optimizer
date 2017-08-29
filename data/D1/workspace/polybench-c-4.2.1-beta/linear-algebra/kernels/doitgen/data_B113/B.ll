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
  %wide.trip.count59.1 = zext i32 %2 to i64
  %8 = sext i32 %2 to i64
  %9 = sext i32 %1 to i64
  %10 = sext i32 %0 to i64
  %11 = icmp sgt i32 %1, 0
  %12 = icmp sgt i32 %2, 0
  %xtraiter = and i32 %2, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %13 = icmp eq i32 %2, 1
  %sunkaddr76 = ptrtoint double* %5 to i64
  %scevgep91 = getelementptr double, double* %5, i64 %8
  %14 = add nsw i64 %9, -1
  %15 = add nsw i64 %8, -4
  %16 = lshr i64 %15, 2
  %17 = add nuw nsw i64 %16, 1
  %min.iters.check = icmp ult i32 %2, 4
  %n.vec = and i64 %8, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %xtraiter132 = and i64 %17, 3
  %lcmp.mod133 = icmp eq i64 %xtraiter132, 0
  %18 = icmp ult i64 %15, 12
  %cmp.n = icmp eq i64 %8, %n.vec
  %xtraiter130 = and i64 %9, 7
  %lcmp.mod131 = icmp eq i64 %xtraiter130, 0
  %19 = icmp ult i64 %14, 7
  br label %._crit_edge19._crit_edge

._crit_edge19._crit_edge:                         ; preds = %._crit_edge19, %.lr.ph36
  %indvars.iv69 = phi i64 [ 0, %.lr.ph36 ], [ %indvars.iv.next70, %._crit_edge19 ]
  br i1 %11, label %.lr.ph18, label %._crit_edge19

.lr.ph18:                                         ; preds = %._crit_edge19._crit_edge
  br i1 %12, label %.lr.ph18.split.us.preheader, label %.lr.ph18.split.preheader

.lr.ph18.split.preheader:                         ; preds = %.lr.ph18
  br i1 %lcmp.mod131, label %.lr.ph18.split.prol.loopexit, label %.lr.ph18.split.prol.preheader

.lr.ph18.split.prol.preheader:                    ; preds = %.lr.ph18.split.preheader
  br label %.lr.ph18.split.prol

.lr.ph18.split.prol:                              ; preds = %.lr.ph18.split.prol, %.lr.ph18.split.prol.preheader
  %indvars.iv53.prol = phi i64 [ %indvars.iv.next54.prol, %.lr.ph18.split.prol ], [ 0, %.lr.ph18.split.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph18.split.prol ], [ %xtraiter130, %.lr.ph18.split.prol.preheader ]
  %indvars.iv.next54.prol = add nuw nsw i64 %indvars.iv53.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph18.split.prol.loopexit.unr-lcssa, label %.lr.ph18.split.prol, !llvm.loop !1

.lr.ph18.split.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph18.split.prol
  br label %.lr.ph18.split.prol.loopexit

.lr.ph18.split.prol.loopexit:                     ; preds = %.lr.ph18.split.preheader, %.lr.ph18.split.prol.loopexit.unr-lcssa
  %indvars.iv53.unr = phi i64 [ 0, %.lr.ph18.split.preheader ], [ %indvars.iv.next54.prol, %.lr.ph18.split.prol.loopexit.unr-lcssa ]
  br i1 %19, label %._crit_edge19.loopexit127, label %.lr.ph18.split.preheader.new

.lr.ph18.split.preheader.new:                     ; preds = %.lr.ph18.split.prol.loopexit
  br label %.lr.ph18.split

.lr.ph18.split.us.preheader:                      ; preds = %.lr.ph18
  br label %.lr.ph18.split.us

.lr.ph18.split.us:                                ; preds = %._crit_edge15.us, %.lr.ph18.split.us.preheader
  %indvars.iv67 = phi i64 [ %indvars.iv.next68, %._crit_edge15.us ], [ 0, %.lr.ph18.split.us.preheader ]
  %scevgep = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 0
  br label %.lr.ph.us.us

._crit_edge15.us.loopexit:                        ; preds = %._crit_edge81
  br label %._crit_edge15.us

._crit_edge15.us:                                 ; preds = %._crit_edge15.us.loopexit, %middle.block
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond128 = icmp eq i64 %indvars.iv.next68, %9
  br i1 %exitcond128, label %._crit_edge19.loopexit, label %.lr.ph18.split.us

._crit_edge81:                                    ; preds = %._crit_edge81.preheader, %._crit_edge81
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %._crit_edge81 ], [ %indvars.iv65.ph, %._crit_edge81.preheader ]
  %20 = getelementptr inbounds double, double* %5, i64 %indvars.iv65
  %21 = bitcast double* %20 to i64*
  %22 = load i64, i64* %21, align 8
  %23 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 %indvars.iv65
  %24 = bitcast double* %23 to i64*
  store i64 %22, i64* %24, align 8
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %25 = icmp slt i64 %indvars.iv.next66, %8
  br i1 %25, label %._crit_edge81, label %._crit_edge15.us.loopexit, !llvm.loop !3

._crit_edge8.us.._crit_edge81_crit_edge:          ; preds = %._crit_edge.us.us
  %scevgep89 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 %8
  br i1 %min.iters.check, label %._crit_edge81.preheader, label %min.iters.checked

._crit_edge81.preheader:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %._crit_edge8.us.._crit_edge81_crit_edge
  %indvars.iv65.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %._crit_edge8.us.._crit_edge81_crit_edge ], [ %n.vec, %middle.block ]
  br label %._crit_edge81

min.iters.checked:                                ; preds = %._crit_edge8.us.._crit_edge81_crit_edge
  br i1 %cmp.zero, label %._crit_edge81.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep91
  %bound1 = icmp ugt double* %scevgep89, %5
  %found.conflict = and i1 %bound0, %bound1
  br i1 %found.conflict, label %._crit_edge81.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br i1 %lcmp.mod133, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter134 = phi i64 [ %prol.iter134.sub, %vector.body.prol ], [ %xtraiter132, %vector.body.prol.preheader ]
  %26 = getelementptr inbounds double, double* %5, i64 %index.prol
  %27 = bitcast double* %26 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %27, align 8, !alias.scope !6
  %28 = getelementptr double, double* %26, i64 2
  %29 = bitcast double* %28 to <2 x i64>*
  %wide.load94.prol = load <2 x i64>, <2 x i64>* %29, align 8, !alias.scope !6
  %30 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 %index.prol
  %31 = bitcast double* %30 to <2 x i64>*
  store <2 x i64> %wide.load.prol, <2 x i64>* %31, align 8, !alias.scope !9, !noalias !6
  %32 = getelementptr double, double* %30, i64 2
  %33 = bitcast double* %32 to <2 x i64>*
  store <2 x i64> %wide.load94.prol, <2 x i64>* %33, align 8, !alias.scope !9, !noalias !6
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter134.sub = add i64 %prol.iter134, -1
  %prol.iter134.cmp = icmp eq i64 %prol.iter134.sub, 0
  br i1 %prol.iter134.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !11

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  br i1 %18, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %34 = getelementptr inbounds double, double* %5, i64 %index
  %35 = bitcast double* %34 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %35, align 8, !alias.scope !6
  %36 = getelementptr double, double* %34, i64 2
  %37 = bitcast double* %36 to <2 x i64>*
  %wide.load94 = load <2 x i64>, <2 x i64>* %37, align 8, !alias.scope !6
  %38 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 %index
  %39 = bitcast double* %38 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %39, align 8, !alias.scope !9, !noalias !6
  %40 = getelementptr double, double* %38, i64 2
  %41 = bitcast double* %40 to <2 x i64>*
  store <2 x i64> %wide.load94, <2 x i64>* %41, align 8, !alias.scope !9, !noalias !6
  %index.next = add i64 %index, 4
  %42 = getelementptr inbounds double, double* %5, i64 %index.next
  %43 = bitcast double* %42 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %43, align 8, !alias.scope !6
  %44 = getelementptr double, double* %42, i64 2
  %45 = bitcast double* %44 to <2 x i64>*
  %wide.load94.1 = load <2 x i64>, <2 x i64>* %45, align 8, !alias.scope !6
  %46 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 %index.next
  %47 = bitcast double* %46 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %47, align 8, !alias.scope !9, !noalias !6
  %48 = getelementptr double, double* %46, i64 2
  %49 = bitcast double* %48 to <2 x i64>*
  store <2 x i64> %wide.load94.1, <2 x i64>* %49, align 8, !alias.scope !9, !noalias !6
  %index.next.1 = add i64 %index, 8
  %50 = getelementptr inbounds double, double* %5, i64 %index.next.1
  %51 = bitcast double* %50 to <2 x i64>*
  %wide.load.2 = load <2 x i64>, <2 x i64>* %51, align 8, !alias.scope !6
  %52 = getelementptr double, double* %50, i64 2
  %53 = bitcast double* %52 to <2 x i64>*
  %wide.load94.2 = load <2 x i64>, <2 x i64>* %53, align 8, !alias.scope !6
  %54 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 %index.next.1
  %55 = bitcast double* %54 to <2 x i64>*
  store <2 x i64> %wide.load.2, <2 x i64>* %55, align 8, !alias.scope !9, !noalias !6
  %56 = getelementptr double, double* %54, i64 2
  %57 = bitcast double* %56 to <2 x i64>*
  store <2 x i64> %wide.load94.2, <2 x i64>* %57, align 8, !alias.scope !9, !noalias !6
  %index.next.2 = add i64 %index, 12
  %58 = getelementptr inbounds double, double* %5, i64 %index.next.2
  %59 = bitcast double* %58 to <2 x i64>*
  %wide.load.3 = load <2 x i64>, <2 x i64>* %59, align 8, !alias.scope !6
  %60 = getelementptr double, double* %58, i64 2
  %61 = bitcast double* %60 to <2 x i64>*
  %wide.load94.3 = load <2 x i64>, <2 x i64>* %61, align 8, !alias.scope !6
  %62 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 %index.next.2
  %63 = bitcast double* %62 to <2 x i64>*
  store <2 x i64> %wide.load.3, <2 x i64>* %63, align 8, !alias.scope !9, !noalias !6
  %64 = getelementptr double, double* %62, i64 2
  %65 = bitcast double* %64 to <2 x i64>*
  store <2 x i64> %wide.load94.3, <2 x i64>* %65, align 8, !alias.scope !9, !noalias !6
  %index.next.3 = add i64 %index, 16
  %66 = icmp eq i64 %index.next.3, %n.vec
  br i1 %66, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !12

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  br i1 %cmp.n, label %._crit_edge15.us, label %._crit_edge81.preheader

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph18.split.us
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge.us.us ], [ 0, %.lr.ph18.split.us ]
  %67 = getelementptr inbounds double, double* %5, i64 %indvars.iv61
  store double 0.000000e+00, double* %67, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %68

; <label>:68:                                     ; preds = %.lr.ph.us.us
  %69 = load double, double* %scevgep, align 8
  %70 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv61
  %71 = load double, double* %70, align 8
  %72 = fmul double %69, %71
  %sunkaddr73 = shl nuw nsw i64 %indvars.iv61, 3
  %sunkaddr74 = add i64 %sunkaddr76, %sunkaddr73
  %sunkaddr75 = inttoptr i64 %sunkaddr74 to double*
  %73 = load double, double* %sunkaddr75, align 8
  %74 = fadd double %72, %73
  store double %74, double* %sunkaddr75, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us.us, %68
  %indvars.iv57.unr.ph = phi i64 [ 1, %68 ], [ 0, %.lr.ph.us.us ]
  br i1 %13, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  %sunkaddr77 = shl nuw nsw i64 %indvars.iv61, 3
  %sunkaddr78 = add i64 %sunkaddr76, %sunkaddr77
  %sunkaddr79 = inttoptr i64 %sunkaddr78 to double*
  %.pre = load double, double* %sunkaddr79, align 8
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next62, %wide.trip.count59.1
  br i1 %exitcond64, label %._crit_edge8.us.._crit_edge81_crit_edge, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new, %.lr.ph.us.us.new.preheader
  %75 = phi double [ %87, %.lr.ph.us.us.new ], [ %.pre, %.lr.ph.us.us.new.preheader ]
  %indvars.iv57 = phi i64 [ %indvars.iv.next58.1, %.lr.ph.us.us.new ], [ %indvars.iv57.unr.ph, %.lr.ph.us.us.new.preheader ]
  %76 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 %indvars.iv57
  %77 = load double, double* %76, align 8
  %78 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv57, i64 %indvars.iv61
  %79 = load double, double* %78, align 8
  %80 = fmul double %77, %79
  %81 = fadd double %80, %75
  store double %81, double* %sunkaddr79, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %82 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 %indvars.iv.next58
  %83 = load double, double* %82, align 8
  %84 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next58, i64 %indvars.iv61
  %85 = load double, double* %84, align 8
  %86 = fmul double %83, %85
  %87 = fadd double %86, %81
  store double %87, double* %sunkaddr79, align 8
  %indvars.iv.next58.1 = add nuw nsw i64 %indvars.iv57, 2
  %exitcond60.1 = icmp eq i64 %indvars.iv.next58.1, %wide.trip.count59.1
  br i1 %exitcond60.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph18.split:                                   ; preds = %.lr.ph18.split, %.lr.ph18.split.preheader.new
  %indvars.iv53 = phi i64 [ %indvars.iv53.unr, %.lr.ph18.split.preheader.new ], [ %indvars.iv.next54.7, %.lr.ph18.split ]
  %indvars.iv.next54.7 = add nsw i64 %indvars.iv53, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next54.7, %9
  br i1 %exitcond.7, label %._crit_edge19.loopexit127.unr-lcssa, label %.lr.ph18.split

._crit_edge19.loopexit:                           ; preds = %._crit_edge15.us
  br label %._crit_edge19

._crit_edge19.loopexit127.unr-lcssa:              ; preds = %.lr.ph18.split
  br label %._crit_edge19.loopexit127

._crit_edge19.loopexit127:                        ; preds = %.lr.ph18.split.prol.loopexit, %._crit_edge19.loopexit127.unr-lcssa
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.loopexit127, %._crit_edge19.loopexit, %._crit_edge19._crit_edge
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond129 = icmp eq i64 %indvars.iv.next70, %10
  br i1 %exitcond129, label %._crit_edge.loopexit, label %._crit_edge19._crit_edge

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

.lr.ph26.split.us:                                ; preds = %._crit_edge16.us.us.._crit_edge20.us_crit_edge, %.lr.ph26
  %indvars.iv61 = phi i64 [ 0, %.lr.ph26 ], [ %indvars.iv.next62, %._crit_edge16.us.us.._crit_edge20.us_crit_edge ]
  br label %.lr.ph15.us.us

.lr.ph15.us.us:                                   ; preds = %._crit_edge16.us.us, %.lr.ph26.split.us
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %._crit_edge16.us.us ], [ 0, %.lr.ph26.split.us ]
  %5 = mul nuw nsw i64 %indvars.iv57, %indvars.iv61
  br label %._crit_edge69

._crit_edge16.us.us:                              ; preds = %._crit_edge69
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next58, 140
  br i1 %exitcond60, label %._crit_edge16.us.us.._crit_edge20.us_crit_edge, label %.lr.ph15.us.us

._crit_edge16.us.us.._crit_edge20.us_crit_edge:   ; preds = %._crit_edge16.us.us
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond76 = icmp eq i64 %indvars.iv.next62, 150
  br i1 %exitcond76, label %.lr.ph7.split.us.preheader, label %.lr.ph26.split.us

.lr.ph7.split.us.preheader:                       ; preds = %._crit_edge16.us.us.._crit_edge20.us_crit_edge
  br label %.lr.ph7.split.us

._crit_edge69:                                    ; preds = %._crit_edge69, %.lr.ph15.us.us
  %indvars.iv53 = phi i64 [ 0, %.lr.ph15.us.us ], [ %indvars.iv.next54.1, %._crit_edge69 ]
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
  br i1 %exitcond56.1, label %._crit_edge16.us.us, label %._crit_edge69

.lr.ph7.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph7.split.us.preheader
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %._crit_edge.us ], [ 0, %.lr.ph7.split.us.preheader ]
  br label %._crit_edge71

._crit_edge71:                                    ; preds = %._crit_edge71, %.lr.ph7.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph7.split.us ], [ %indvars.iv.next.1, %._crit_edge71 ]
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
  br i1 %exitcond.1, label %._crit_edge.us, label %._crit_edge71

._crit_edge.us:                                   ; preds = %._crit_edge71
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond75 = icmp eq i64 %indvars.iv.next51, 160
  br i1 %exitcond75, label %._crit_edge70, label %.lr.ph7.split.us

._crit_edge70:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, i32, [140 x [160 x double]]*) unnamed_addr #1 {
.lr.ph14:
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph14.split.us

.lr.ph14.split.us:                                ; preds = %._crit_edge5.us.us.._crit_edge8.us_crit_edge, %.lr.ph14
  %indvars.iv42 = phi i64 [ 0, %.lr.ph14 ], [ %indvars.iv.next43, %._crit_edge5.us.us.._crit_edge8.us_crit_edge ]
  %8 = mul nuw nsw i64 %indvars.iv42, 140
  br label %.lr.ph.us.us

.lr.ph.us.us:                                     ; preds = %._crit_edge5.us.us, %.lr.ph14.split.us
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %._crit_edge5.us.us ], [ 0, %.lr.ph14.split.us ]
  %9 = add nuw nsw i64 %8, %indvars.iv38
  %10 = mul nuw nsw i64 %9, 160
  br label %._crit_edge.us.us._crit_edge

._crit_edge5.us.us:                               ; preds = %._crit_edge.us.us
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond = icmp eq i64 %indvars.iv.next39, 140
  br i1 %exitcond, label %._crit_edge5.us.us.._crit_edge8.us_crit_edge, label %.lr.ph.us.us

._crit_edge5.us.us.._crit_edge8.us_crit_edge:     ; preds = %._crit_edge5.us.us
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next43, 150
  br i1 %exitcond49, label %._crit_edge, label %.lr.ph14.split.us

._crit_edge.us.us._crit_edge:                     ; preds = %._crit_edge.us.us, %.lr.ph.us.us
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next, %._crit_edge.us.us ]
  %11 = add nuw nsw i64 %10, %indvars.iv
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge.us.us

; <label>:15:                                     ; preds = %._crit_edge.us.us._crit_edge
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us._crit_edge, %15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv42, i64 %indvars.iv38, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond37, label %._crit_edge5.us.us, label %._crit_edge.us.us._crit_edge

._crit_edge:                                      ; preds = %._crit_edge5.us.us.._crit_edge8.us_crit_edge
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
