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
  br i1 %7, label %.lr.ph39, label %._crit_edge40

.lr.ph39:                                         ; preds = %6
  %wide.trip.count62.1 = zext i32 %2 to i64
  %8 = sext i32 %2 to i64
  %9 = sext i32 %1 to i64
  %10 = sext i32 %0 to i64
  %11 = icmp sgt i32 %1, 0
  %12 = icmp sgt i32 %2, 0
  %xtraiter = and i32 %2, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %13 = icmp eq i32 %2, 1
  %sunkaddr79 = ptrtoint double* %5 to i64
  %scevgep88 = getelementptr double, double* %5, i64 %8
  %14 = add nsw i64 %9, -1
  %15 = add nsw i64 %8, -4
  %16 = lshr i64 %15, 2
  %17 = add nuw nsw i64 %16, 1
  %min.iters.check = icmp ult i32 %2, 4
  %n.vec = and i64 %8, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %xtraiter130 = and i64 %17, 3
  %lcmp.mod131 = icmp eq i64 %xtraiter130, 0
  %18 = icmp ult i64 %15, 12
  %cmp.n = icmp eq i64 %8, %n.vec
  %xtraiter128 = and i64 %9, 7
  %lcmp.mod129 = icmp eq i64 %xtraiter128, 0
  %19 = icmp ult i64 %14, 7
  br label %20

; <label>:20:                                     ; preds = %._crit_edge21, %.lr.ph39
  %indvars.iv72 = phi i64 [ 0, %.lr.ph39 ], [ %indvars.iv.next73, %._crit_edge21 ]
  br i1 %11, label %.lr.ph20, label %._crit_edge21

.lr.ph20:                                         ; preds = %20
  br i1 %12, label %.lr.ph20.split.us.preheader, label %.lr.ph20.split.preheader

.lr.ph20.split.preheader:                         ; preds = %.lr.ph20
  br i1 %lcmp.mod129, label %.lr.ph20.split.prol.loopexit, label %.lr.ph20.split.prol.preheader

.lr.ph20.split.prol.preheader:                    ; preds = %.lr.ph20.split.preheader
  br label %.lr.ph20.split.prol

.lr.ph20.split.prol:                              ; preds = %.lr.ph20.split.prol, %.lr.ph20.split.prol.preheader
  %indvars.iv56.prol = phi i64 [ %indvars.iv.next57.prol, %.lr.ph20.split.prol ], [ 0, %.lr.ph20.split.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph20.split.prol ], [ %xtraiter128, %.lr.ph20.split.prol.preheader ]
  %indvars.iv.next57.prol = add nuw nsw i64 %indvars.iv56.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph20.split.prol.loopexit.unr-lcssa, label %.lr.ph20.split.prol, !llvm.loop !1

.lr.ph20.split.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph20.split.prol
  br label %.lr.ph20.split.prol.loopexit

.lr.ph20.split.prol.loopexit:                     ; preds = %.lr.ph20.split.preheader, %.lr.ph20.split.prol.loopexit.unr-lcssa
  %indvars.iv56.unr = phi i64 [ 0, %.lr.ph20.split.preheader ], [ %indvars.iv.next57.prol, %.lr.ph20.split.prol.loopexit.unr-lcssa ]
  br i1 %19, label %._crit_edge21.loopexit125, label %.lr.ph20.split.preheader.new

.lr.ph20.split.preheader.new:                     ; preds = %.lr.ph20.split.prol.loopexit
  br label %.lr.ph20.split

.lr.ph20.split.us.preheader:                      ; preds = %.lr.ph20
  br label %.lr.ph20.split.us

.lr.ph20.split.us:                                ; preds = %._crit_edge17.us, %.lr.ph20.split.us.preheader
  %indvars.iv70 = phi i64 [ %indvars.iv.next71, %._crit_edge17.us ], [ 0, %.lr.ph20.split.us.preheader ]
  %scevgep = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv72, i64 %indvars.iv70, i64 0
  %21 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv72, i64 %indvars.iv70, i64 0
  br label %.lr.ph.us.us

._crit_edge17.us.loopexit:                        ; preds = %.lr.ph16.us
  br label %._crit_edge17.us

._crit_edge17.us:                                 ; preds = %._crit_edge17.us.loopexit, %middle.block
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond126 = icmp eq i64 %indvars.iv.next71, %9
  br i1 %exitcond126, label %._crit_edge21.loopexit, label %.lr.ph20.split.us

.lr.ph16.us:                                      ; preds = %.lr.ph16.us.preheader124, %.lr.ph16.us
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %.lr.ph16.us ], [ %indvars.iv68.ph, %.lr.ph16.us.preheader124 ]
  %22 = getelementptr inbounds double, double* %5, i64 %indvars.iv68
  %23 = bitcast double* %22 to i64*
  %24 = load i64, i64* %23, align 8
  %25 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv72, i64 %indvars.iv70, i64 %indvars.iv68
  %26 = bitcast double* %25 to i64*
  store i64 %24, i64* %26, align 8
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %27 = icmp slt i64 %indvars.iv.next69, %8
  br i1 %27, label %.lr.ph16.us, label %._crit_edge17.us.loopexit, !llvm.loop !3

.lr.ph16.us.preheader:                            ; preds = %._crit_edge.us.us
  %scevgep86 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv72, i64 %indvars.iv70, i64 %8
  br i1 %min.iters.check, label %.lr.ph16.us.preheader124, label %min.iters.checked

.lr.ph16.us.preheader124:                         ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph16.us.preheader
  %indvars.iv68.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph16.us.preheader ], [ %n.vec, %middle.block ]
  br label %.lr.ph16.us

min.iters.checked:                                ; preds = %.lr.ph16.us.preheader
  br i1 %cmp.zero, label %.lr.ph16.us.preheader124, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep88
  %bound1 = icmp ugt double* %scevgep86, %5
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.lr.ph16.us.preheader124, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br i1 %lcmp.mod131, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter132 = phi i64 [ %prol.iter132.sub, %vector.body.prol ], [ %xtraiter130, %vector.body.prol.preheader ]
  %28 = getelementptr inbounds double, double* %5, i64 %index.prol
  %29 = bitcast double* %28 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %29, align 8, !alias.scope !6
  %30 = getelementptr double, double* %28, i64 2
  %31 = bitcast double* %30 to <2 x i64>*
  %wide.load91.prol = load <2 x i64>, <2 x i64>* %31, align 8, !alias.scope !6
  %32 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv72, i64 %indvars.iv70, i64 %index.prol
  %33 = bitcast double* %32 to <2 x i64>*
  store <2 x i64> %wide.load.prol, <2 x i64>* %33, align 8, !alias.scope !9, !noalias !6
  %34 = getelementptr double, double* %32, i64 2
  %35 = bitcast double* %34 to <2 x i64>*
  store <2 x i64> %wide.load91.prol, <2 x i64>* %35, align 8, !alias.scope !9, !noalias !6
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter132.sub = add i64 %prol.iter132, -1
  %prol.iter132.cmp = icmp eq i64 %prol.iter132.sub, 0
  br i1 %prol.iter132.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !11

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  br i1 %18, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %36 = getelementptr inbounds double, double* %5, i64 %index
  %37 = bitcast double* %36 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %37, align 8, !alias.scope !6
  %38 = getelementptr double, double* %36, i64 2
  %39 = bitcast double* %38 to <2 x i64>*
  %wide.load91 = load <2 x i64>, <2 x i64>* %39, align 8, !alias.scope !6
  %40 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv72, i64 %indvars.iv70, i64 %index
  %41 = bitcast double* %40 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %41, align 8, !alias.scope !9, !noalias !6
  %42 = getelementptr double, double* %40, i64 2
  %43 = bitcast double* %42 to <2 x i64>*
  store <2 x i64> %wide.load91, <2 x i64>* %43, align 8, !alias.scope !9, !noalias !6
  %index.next = add i64 %index, 4
  %44 = getelementptr inbounds double, double* %5, i64 %index.next
  %45 = bitcast double* %44 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %45, align 8, !alias.scope !6
  %46 = getelementptr double, double* %44, i64 2
  %47 = bitcast double* %46 to <2 x i64>*
  %wide.load91.1 = load <2 x i64>, <2 x i64>* %47, align 8, !alias.scope !6
  %48 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv72, i64 %indvars.iv70, i64 %index.next
  %49 = bitcast double* %48 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %49, align 8, !alias.scope !9, !noalias !6
  %50 = getelementptr double, double* %48, i64 2
  %51 = bitcast double* %50 to <2 x i64>*
  store <2 x i64> %wide.load91.1, <2 x i64>* %51, align 8, !alias.scope !9, !noalias !6
  %index.next.1 = add i64 %index, 8
  %52 = getelementptr inbounds double, double* %5, i64 %index.next.1
  %53 = bitcast double* %52 to <2 x i64>*
  %wide.load.2 = load <2 x i64>, <2 x i64>* %53, align 8, !alias.scope !6
  %54 = getelementptr double, double* %52, i64 2
  %55 = bitcast double* %54 to <2 x i64>*
  %wide.load91.2 = load <2 x i64>, <2 x i64>* %55, align 8, !alias.scope !6
  %56 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv72, i64 %indvars.iv70, i64 %index.next.1
  %57 = bitcast double* %56 to <2 x i64>*
  store <2 x i64> %wide.load.2, <2 x i64>* %57, align 8, !alias.scope !9, !noalias !6
  %58 = getelementptr double, double* %56, i64 2
  %59 = bitcast double* %58 to <2 x i64>*
  store <2 x i64> %wide.load91.2, <2 x i64>* %59, align 8, !alias.scope !9, !noalias !6
  %index.next.2 = add i64 %index, 12
  %60 = getelementptr inbounds double, double* %5, i64 %index.next.2
  %61 = bitcast double* %60 to <2 x i64>*
  %wide.load.3 = load <2 x i64>, <2 x i64>* %61, align 8, !alias.scope !6
  %62 = getelementptr double, double* %60, i64 2
  %63 = bitcast double* %62 to <2 x i64>*
  %wide.load91.3 = load <2 x i64>, <2 x i64>* %63, align 8, !alias.scope !6
  %64 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv72, i64 %indvars.iv70, i64 %index.next.2
  %65 = bitcast double* %64 to <2 x i64>*
  store <2 x i64> %wide.load.3, <2 x i64>* %65, align 8, !alias.scope !9, !noalias !6
  %66 = getelementptr double, double* %64, i64 2
  %67 = bitcast double* %66 to <2 x i64>*
  store <2 x i64> %wide.load91.3, <2 x i64>* %67, align 8, !alias.scope !9, !noalias !6
  %index.next.3 = add i64 %index, 16
  %68 = icmp eq i64 %index.next.3, %n.vec
  br i1 %68, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !12

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  br i1 %cmp.n, label %._crit_edge17.us, label %.lr.ph16.us.preheader124

.lr.ph.us.us:                                     ; preds = %.lr.ph20.split.us, %._crit_edge.us.us
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %._crit_edge.us.us ], [ 0, %.lr.ph20.split.us ]
  %69 = getelementptr inbounds double, double* %5, i64 %indvars.iv64
  store double 0.000000e+00, double* %69, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %70 = load double, double* %21, align 8
  %71 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv64
  %72 = load double, double* %71, align 8
  %73 = fmul double %70, %72
  %sunkaddr76 = shl i64 %indvars.iv64, 3
  %sunkaddr77 = add i64 %sunkaddr79, %sunkaddr76
  %sunkaddr78 = inttoptr i64 %sunkaddr77 to double*
  %74 = load double, double* %sunkaddr78, align 8
  %75 = fadd double %74, %73
  store double %75, double* %sunkaddr78, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %indvars.iv60.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %13, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  %sunkaddr80 = shl i64 %indvars.iv64, 3
  %sunkaddr81 = add i64 %sunkaddr79, %sunkaddr80
  %sunkaddr82 = inttoptr i64 %sunkaddr81 to double*
  %.pre = load double, double* %sunkaddr82, align 8
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next65, %wide.trip.count62.1
  br i1 %exitcond67, label %.lr.ph16.us.preheader, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %76 = phi double [ %88, %.lr.ph.us.us.new ], [ %.pre, %.lr.ph.us.us.new.preheader ]
  %indvars.iv60 = phi i64 [ %indvars.iv.next61.1, %.lr.ph.us.us.new ], [ %indvars.iv60.unr.ph, %.lr.ph.us.us.new.preheader ]
  %77 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv72, i64 %indvars.iv70, i64 %indvars.iv60
  %78 = load double, double* %77, align 8
  %79 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv60, i64 %indvars.iv64
  %80 = load double, double* %79, align 8
  %81 = fmul double %78, %80
  %82 = fadd double %76, %81
  store double %82, double* %sunkaddr82, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %83 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv72, i64 %indvars.iv70, i64 %indvars.iv.next61
  %84 = load double, double* %83, align 8
  %85 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next61, i64 %indvars.iv64
  %86 = load double, double* %85, align 8
  %87 = fmul double %84, %86
  %88 = fadd double %82, %87
  store double %88, double* %sunkaddr82, align 8
  %indvars.iv.next61.1 = add nuw nsw i64 %indvars.iv60, 2
  %exitcond63.1 = icmp eq i64 %indvars.iv.next61.1, %wide.trip.count62.1
  br i1 %exitcond63.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph20.split:                                   ; preds = %.lr.ph20.split, %.lr.ph20.split.preheader.new
  %indvars.iv56 = phi i64 [ %indvars.iv56.unr, %.lr.ph20.split.preheader.new ], [ %indvars.iv.next57.7, %.lr.ph20.split ]
  %indvars.iv.next57.7 = add nsw i64 %indvars.iv56, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next57.7, %9
  br i1 %exitcond.7, label %._crit_edge21.loopexit125.unr-lcssa, label %.lr.ph20.split

._crit_edge21.loopexit:                           ; preds = %._crit_edge17.us
  br label %._crit_edge21

._crit_edge21.loopexit125.unr-lcssa:              ; preds = %.lr.ph20.split
  br label %._crit_edge21.loopexit125

._crit_edge21.loopexit125:                        ; preds = %.lr.ph20.split.prol.loopexit, %._crit_edge21.loopexit125.unr-lcssa
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21.loopexit125, %._crit_edge21.loopexit, %20
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond127 = icmp eq i64 %indvars.iv.next73, %10
  br i1 %exitcond127, label %._crit_edge40.loopexit, label %20

._crit_edge40.loopexit:                           ; preds = %._crit_edge21
  br label %._crit_edge40

._crit_edge40:                                    ; preds = %._crit_edge40.loopexit, %6
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
  %exitcond67 = icmp eq i64 %indvars.iv.next62, 150
  br i1 %exitcond67, label %.lr.ph7.split.us.preheader, label %.lr.ph26.split.us

.lr.ph7.split.us.preheader:                       ; preds = %._crit_edge20.us
  br label %.lr.ph7.split.us

.lr.ph15.us.us:                                   ; preds = %.lr.ph26.split.us, %._crit_edge16.us.us
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %._crit_edge16.us.us ], [ 0, %.lr.ph26.split.us ]
  %5 = mul nuw nsw i64 %indvars.iv61, %indvars.iv57
  br label %6

._crit_edge16.us.us:                              ; preds = %6
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next58, 140
  br i1 %exitcond60, label %._crit_edge20.us, label %.lr.ph15.us.us

; <label>:6:                                      ; preds = %6, %.lr.ph15.us.us
  %indvars.iv53 = phi i64 [ 0, %.lr.ph15.us.us ], [ %indvars.iv.next54.1, %6 ]
  %7 = add nuw nsw i64 %5, %indvars.iv53
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 160
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv61, i64 %indvars.iv57, i64 %indvars.iv53
  %indvars.iv.next54 = or i64 %indvars.iv53, 1
  %12 = add nuw nsw i64 %5, %indvars.iv.next54
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 160
  %15 = sitofp i32 %14 to double
  %16 = insertelement <2 x double> undef, double %10, i32 0
  %17 = insertelement <2 x double> %16, double %15, i32 1
  %18 = fdiv <2 x double> %17, <double 1.600000e+02, double 1.600000e+02>
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %indvars.iv.next54.1 = add nsw i64 %indvars.iv53, 2
  %exitcond56.1 = icmp eq i64 %indvars.iv.next54.1, 160
  br i1 %exitcond56.1, label %._crit_edge16.us.us, label %6

.lr.ph7.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph7.split.us.preheader
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %._crit_edge.us ], [ 0, %.lr.ph7.split.us.preheader ]
  br label %20

; <label>:20:                                     ; preds = %20, %.lr.ph7.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph7.split.us ], [ %indvars.iv.next.1, %20 ]
  %21 = mul nuw nsw i64 %indvars.iv50, %indvars.iv
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 160
  %24 = sitofp i32 %23 to double
  %25 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv50, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %26 = mul nuw nsw i64 %indvars.iv50, %indvars.iv.next
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
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next51, 160
  br i1 %exitcond66, label %._crit_edge8, label %.lr.ph7.split.us

._crit_edge8:                                     ; preds = %._crit_edge.us
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

.lr.ph14.split.us:                                ; preds = %._crit_edge8.us, %.lr.ph14
  %indvars.iv42 = phi i64 [ 0, %.lr.ph14 ], [ %indvars.iv.next43, %._crit_edge8.us ]
  %8 = mul nuw nsw i64 %indvars.iv42, 140
  br label %.lr.ph.us.us

._crit_edge8.us:                                  ; preds = %._crit_edge5.us.us
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond = icmp eq i64 %indvars.iv.next43, 150
  br i1 %exitcond, label %._crit_edge15, label %.lr.ph14.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph14.split.us, %._crit_edge5.us.us
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %._crit_edge5.us.us ], [ 0, %.lr.ph14.split.us ]
  %9 = add nuw nsw i64 %8, %indvars.iv38
  %10 = mul nuw nsw i64 %9, 160
  br label %11

._crit_edge5.us.us:                               ; preds = %._crit_edge.us.us
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next39, 140
  br i1 %exitcond41, label %._crit_edge8.us, label %.lr.ph.us.us

; <label>:11:                                     ; preds = %._crit_edge.us.us, %.lr.ph.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us.us ], [ 0, %.lr.ph.us.us ]
  %12 = add nuw nsw i64 %10, %indvars.iv
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge.us.us

; <label>:16:                                     ; preds = %11
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %11, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv42, i64 %indvars.iv38, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond37, label %._crit_edge5.us.us, label %11

._crit_edge15:                                    ; preds = %._crit_edge8.us
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
