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
  %8 = sext i32 %2 to i64
  %9 = sext i32 %1 to i64
  %10 = sext i32 %0 to i64
  %xtraiter = and i32 %2, 1
  %wide.trip.count66 = zext i32 %2 to i64
  %scevgep81 = getelementptr double, double* %5, i64 %8
  %11 = add nsw i64 %9, -1
  %12 = add nsw i64 %8, -4
  %13 = lshr i64 %12, 2
  %14 = add nuw nsw i64 %13, 1
  %15 = icmp sgt i32 %1, 0
  %16 = icmp sgt i32 %2, 0
  %17 = icmp eq i32 %xtraiter, 0
  %18 = icmp eq i32 %2, 1
  %sunkaddr124 = ptrtoint double* %5 to i64
  %sunkaddr = ptrtoint double* %5 to i64
  %min.iters.check = icmp ult i32 %2, 4
  %n.vec = and i64 %8, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %xtraiter130 = and i64 %14, 3
  %lcmp.mod131 = icmp eq i64 %xtraiter130, 0
  %19 = icmp ult i64 %12, 12
  %cmp.n = icmp eq i64 %8, %n.vec
  %xtraiter129 = and i64 %9, 7
  %lcmp.mod = icmp eq i64 %xtraiter129, 0
  %20 = icmp ult i64 %11, 7
  br label %21

; <label>:21:                                     ; preds = %._crit_edge21, %.lr.ph39
  %indvars.iv72 = phi i64 [ 0, %.lr.ph39 ], [ %indvars.iv.next73, %._crit_edge21 ]
  br i1 %15, label %.lr.ph20, label %._crit_edge21

.lr.ph20:                                         ; preds = %21
  br i1 %16, label %.lr.ph20.split.us.preheader, label %.lr.ph20.split.preheader

.lr.ph20.split.preheader:                         ; preds = %.lr.ph20
  br i1 %lcmp.mod, label %.lr.ph20.split.prol.loopexit, label %.lr.ph20.split.prol.preheader

.lr.ph20.split.prol.preheader:                    ; preds = %.lr.ph20.split.preheader
  br label %.lr.ph20.split.prol

.lr.ph20.split.prol:                              ; preds = %.lr.ph20.split.prol, %.lr.ph20.split.prol.preheader
  %indvars.iv56.prol = phi i64 [ %indvars.iv.next57.prol, %.lr.ph20.split.prol ], [ 0, %.lr.ph20.split.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph20.split.prol ], [ %xtraiter129, %.lr.ph20.split.prol.preheader ]
  %indvars.iv.next57.prol = add nuw nsw i64 %indvars.iv56.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph20.split.prol.loopexit.unr-lcssa, label %.lr.ph20.split.prol, !llvm.loop !1

.lr.ph20.split.prol.loopexit.unr-lcssa:           ; preds = %.lr.ph20.split.prol
  br label %.lr.ph20.split.prol.loopexit

.lr.ph20.split.prol.loopexit:                     ; preds = %.lr.ph20.split.preheader, %.lr.ph20.split.prol.loopexit.unr-lcssa
  %indvars.iv56.unr = phi i64 [ 0, %.lr.ph20.split.preheader ], [ %indvars.iv.next57.prol, %.lr.ph20.split.prol.loopexit.unr-lcssa ]
  br i1 %20, label %._crit_edge21.loopexit128, label %.lr.ph20.split.preheader.new

.lr.ph20.split.preheader.new:                     ; preds = %.lr.ph20.split.prol.loopexit
  br label %.lr.ph20.split

.lr.ph20.split.us.preheader:                      ; preds = %.lr.ph20
  br label %.lr.ph20.split.us

.lr.ph20.split.us:                                ; preds = %._crit_edge17.us, %.lr.ph20.split.us.preheader
  %indvars.iv70 = phi i64 [ %indvars.iv.next71, %._crit_edge17.us ], [ 0, %.lr.ph20.split.us.preheader ]
  %scevgep = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv72, i64 %indvars.iv70, i64 0
  %22 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv72, i64 %indvars.iv70, i64 0
  br label %.lr.ph.us.us

._crit_edge17.us.loopexit:                        ; preds = %.lr.ph16.us
  br label %._crit_edge17.us

._crit_edge17.us:                                 ; preds = %._crit_edge17.us.loopexit, %middle.block
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond119 = icmp eq i64 %indvars.iv.next71, %9
  br i1 %exitcond119, label %._crit_edge21.loopexit, label %.lr.ph20.split.us

.lr.ph16.us:                                      ; preds = %.lr.ph16.us.preheader117, %.lr.ph16.us
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %.lr.ph16.us ], [ %indvars.iv68.ph, %.lr.ph16.us.preheader117 ]
  %23 = getelementptr inbounds double, double* %5, i64 %indvars.iv68
  %24 = bitcast double* %23 to i64*
  %25 = load i64, i64* %24, align 8
  %26 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv72, i64 %indvars.iv70, i64 %indvars.iv68
  %27 = bitcast double* %26 to i64*
  store i64 %25, i64* %27, align 8
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %28 = icmp slt i64 %indvars.iv.next69, %8
  br i1 %28, label %.lr.ph16.us, label %._crit_edge17.us.loopexit, !llvm.loop !3

.lr.ph16.us.preheader:                            ; preds = %._crit_edge.us.us
  %scevgep79 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv72, i64 %indvars.iv70, i64 %8
  br i1 %min.iters.check, label %.lr.ph16.us.preheader117, label %min.iters.checked

.lr.ph16.us.preheader117:                         ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph16.us.preheader
  %indvars.iv68.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph16.us.preheader ], [ %n.vec, %middle.block ]
  br label %.lr.ph16.us

min.iters.checked:                                ; preds = %.lr.ph16.us.preheader
  br i1 %cmp.zero, label %.lr.ph16.us.preheader117, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep81
  %bound1 = icmp ugt double* %scevgep79, %5
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.lr.ph16.us.preheader117, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br i1 %lcmp.mod131, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter132 = phi i64 [ %prol.iter132.sub, %vector.body.prol ], [ %xtraiter130, %vector.body.prol.preheader ]
  %29 = getelementptr inbounds double, double* %5, i64 %index.prol
  %30 = bitcast double* %29 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %30, align 8, !alias.scope !6
  %31 = getelementptr double, double* %29, i64 2
  %32 = bitcast double* %31 to <2 x i64>*
  %wide.load84.prol = load <2 x i64>, <2 x i64>* %32, align 8, !alias.scope !6
  %33 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv72, i64 %indvars.iv70, i64 %index.prol
  %34 = bitcast double* %33 to <2 x i64>*
  store <2 x i64> %wide.load.prol, <2 x i64>* %34, align 8, !alias.scope !9, !noalias !6
  %35 = getelementptr double, double* %33, i64 2
  %36 = bitcast double* %35 to <2 x i64>*
  store <2 x i64> %wide.load84.prol, <2 x i64>* %36, align 8, !alias.scope !9, !noalias !6
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter132.sub = add i64 %prol.iter132, -1
  %prol.iter132.cmp = icmp eq i64 %prol.iter132.sub, 0
  br i1 %prol.iter132.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !11

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  br i1 %19, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %37 = getelementptr inbounds double, double* %5, i64 %index
  %38 = bitcast double* %37 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %38, align 8, !alias.scope !6
  %39 = getelementptr double, double* %37, i64 2
  %40 = bitcast double* %39 to <2 x i64>*
  %wide.load84 = load <2 x i64>, <2 x i64>* %40, align 8, !alias.scope !6
  %41 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv72, i64 %indvars.iv70, i64 %index
  %42 = bitcast double* %41 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %42, align 8, !alias.scope !9, !noalias !6
  %43 = getelementptr double, double* %41, i64 2
  %44 = bitcast double* %43 to <2 x i64>*
  store <2 x i64> %wide.load84, <2 x i64>* %44, align 8, !alias.scope !9, !noalias !6
  %index.next = add i64 %index, 4
  %45 = getelementptr inbounds double, double* %5, i64 %index.next
  %46 = bitcast double* %45 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %46, align 8, !alias.scope !6
  %47 = getelementptr double, double* %45, i64 2
  %48 = bitcast double* %47 to <2 x i64>*
  %wide.load84.1 = load <2 x i64>, <2 x i64>* %48, align 8, !alias.scope !6
  %49 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv72, i64 %indvars.iv70, i64 %index.next
  %50 = bitcast double* %49 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %50, align 8, !alias.scope !9, !noalias !6
  %51 = getelementptr double, double* %49, i64 2
  %52 = bitcast double* %51 to <2 x i64>*
  store <2 x i64> %wide.load84.1, <2 x i64>* %52, align 8, !alias.scope !9, !noalias !6
  %index.next.1 = add i64 %index, 8
  %53 = getelementptr inbounds double, double* %5, i64 %index.next.1
  %54 = bitcast double* %53 to <2 x i64>*
  %wide.load.2 = load <2 x i64>, <2 x i64>* %54, align 8, !alias.scope !6
  %55 = getelementptr double, double* %53, i64 2
  %56 = bitcast double* %55 to <2 x i64>*
  %wide.load84.2 = load <2 x i64>, <2 x i64>* %56, align 8, !alias.scope !6
  %57 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv72, i64 %indvars.iv70, i64 %index.next.1
  %58 = bitcast double* %57 to <2 x i64>*
  store <2 x i64> %wide.load.2, <2 x i64>* %58, align 8, !alias.scope !9, !noalias !6
  %59 = getelementptr double, double* %57, i64 2
  %60 = bitcast double* %59 to <2 x i64>*
  store <2 x i64> %wide.load84.2, <2 x i64>* %60, align 8, !alias.scope !9, !noalias !6
  %index.next.2 = add i64 %index, 12
  %61 = getelementptr inbounds double, double* %5, i64 %index.next.2
  %62 = bitcast double* %61 to <2 x i64>*
  %wide.load.3 = load <2 x i64>, <2 x i64>* %62, align 8, !alias.scope !6
  %63 = getelementptr double, double* %61, i64 2
  %64 = bitcast double* %63 to <2 x i64>*
  %wide.load84.3 = load <2 x i64>, <2 x i64>* %64, align 8, !alias.scope !6
  %65 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv72, i64 %indvars.iv70, i64 %index.next.2
  %66 = bitcast double* %65 to <2 x i64>*
  store <2 x i64> %wide.load.3, <2 x i64>* %66, align 8, !alias.scope !9, !noalias !6
  %67 = getelementptr double, double* %65, i64 2
  %68 = bitcast double* %67 to <2 x i64>*
  store <2 x i64> %wide.load84.3, <2 x i64>* %68, align 8, !alias.scope !9, !noalias !6
  %index.next.3 = add i64 %index, 16
  %69 = icmp eq i64 %index.next.3, %n.vec
  br i1 %69, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !12

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  br i1 %cmp.n, label %._crit_edge17.us, label %.lr.ph16.us.preheader117

.lr.ph.us.us:                                     ; preds = %.lr.ph20.split.us, %._crit_edge.us.us
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %._crit_edge.us.us ], [ 0, %.lr.ph20.split.us ]
  %70 = getelementptr inbounds double, double* %5, i64 %indvars.iv64
  store double 0.000000e+00, double* %70, align 8
  br i1 %17, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %71 = load double, double* %22, align 8
  %72 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv64
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = fadd double %74, 0.000000e+00
  %sunkaddr121 = shl i64 %indvars.iv64, 3
  %sunkaddr122 = add i64 %sunkaddr, %sunkaddr121
  %sunkaddr123 = inttoptr i64 %sunkaddr122 to double*
  store double %75, double* %sunkaddr123, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %76 = phi double [ %75, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv60.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %18, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  %sunkaddr125 = shl i64 %indvars.iv64, 3
  %sunkaddr126 = add i64 %sunkaddr124, %sunkaddr125
  %sunkaddr127 = inttoptr i64 %sunkaddr126 to double*
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next65, %wide.trip.count66
  br i1 %exitcond67, label %.lr.ph16.us.preheader, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %77 = phi double [ %89, %.lr.ph.us.us.new ], [ %76, %.lr.ph.us.us.new.preheader ]
  %indvars.iv60 = phi i64 [ %indvars.iv.next61.1, %.lr.ph.us.us.new ], [ %indvars.iv60.unr.ph, %.lr.ph.us.us.new.preheader ]
  %78 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv72, i64 %indvars.iv70, i64 %indvars.iv60
  %79 = load double, double* %78, align 8
  %80 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv60, i64 %indvars.iv64
  %81 = load double, double* %80, align 8
  %82 = fmul double %79, %81
  %83 = fadd double %77, %82
  store double %83, double* %sunkaddr127, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %84 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv72, i64 %indvars.iv70, i64 %indvars.iv.next61
  %85 = load double, double* %84, align 8
  %86 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next61, i64 %indvars.iv64
  %87 = load double, double* %86, align 8
  %88 = fmul double %85, %87
  %89 = fadd double %83, %88
  store double %89, double* %sunkaddr127, align 8
  %indvars.iv.next61.1 = add nuw nsw i64 %indvars.iv60, 2
  %exitcond63.1 = icmp eq i64 %indvars.iv.next61.1, %wide.trip.count66
  br i1 %exitcond63.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.lr.ph20.split:                                   ; preds = %.lr.ph20.split, %.lr.ph20.split.preheader.new
  %indvars.iv56 = phi i64 [ %indvars.iv56.unr, %.lr.ph20.split.preheader.new ], [ %indvars.iv.next57.7, %.lr.ph20.split ]
  %indvars.iv.next57.7 = add nsw i64 %indvars.iv56, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next57.7, %9
  br i1 %exitcond.7, label %._crit_edge21.loopexit128.unr-lcssa, label %.lr.ph20.split

._crit_edge21.loopexit:                           ; preds = %._crit_edge17.us
  br label %._crit_edge21

._crit_edge21.loopexit128.unr-lcssa:              ; preds = %.lr.ph20.split
  br label %._crit_edge21.loopexit128

._crit_edge21.loopexit128:                        ; preds = %.lr.ph20.split.prol.loopexit, %._crit_edge21.loopexit128.unr-lcssa
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21.loopexit128, %._crit_edge21.loopexit, %21
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond120 = icmp eq i64 %indvars.iv.next73, %10
  br i1 %exitcond120, label %._crit_edge40.loopexit, label %21

._crit_edge40.loopexit:                           ; preds = %._crit_edge21
  br label %._crit_edge40

._crit_edge40:                                    ; preds = %._crit_edge40.loopexit, %6
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
  br i1 %10, label %11, label %16

; <label>:11:                                     ; preds = %2
  %12 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %12, align 1
  %13 = icmp eq i8 %strcmpload, 0
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %11
  %15 = bitcast i8* %3 to [140 x [160 x double]]*
  tail call fastcc void @print_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %15)
  br label %16

; <label>:16:                                     ; preds = %11, %14, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, [140 x [160 x double]]*, [160 x double]*) unnamed_addr #0 {
.lr.ph27:
  br label %.lr.ph27.split.us

.lr.ph27.split.us:                                ; preds = %._crit_edge21.us, %.lr.ph27
  %indvars.iv63 = phi i64 [ 0, %.lr.ph27 ], [ %indvars.iv.next64, %._crit_edge21.us ]
  br label %.lr.ph15.us.us

._crit_edge21.us:                                 ; preds = %._crit_edge16.us.us
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next64, 150
  br i1 %exitcond69, label %.lr.ph8.split.us.preheader, label %.lr.ph27.split.us

.lr.ph8.split.us.preheader:                       ; preds = %._crit_edge21.us
  br label %.lr.ph8.split.us

.lr.ph15.us.us:                                   ; preds = %.lr.ph27.split.us, %._crit_edge16.us.us
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %._crit_edge16.us.us ], [ 0, %.lr.ph27.split.us ]
  %5 = mul nuw nsw i64 %indvars.iv63, %indvars.iv59
  br label %6

._crit_edge16.us.us:                              ; preds = %6
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next60, 140
  br i1 %exitcond62, label %._crit_edge21.us, label %.lr.ph15.us.us

; <label>:6:                                      ; preds = %6, %.lr.ph15.us.us
  %indvars.iv55 = phi i64 [ 0, %.lr.ph15.us.us ], [ %indvars.iv.next56.1, %6 ]
  %7 = add nuw nsw i64 %5, %indvars.iv55
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 160
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv63, i64 %indvars.iv59, i64 %indvars.iv55
  %indvars.iv.next56 = or i64 %indvars.iv55, 1
  %12 = add nuw nsw i64 %5, %indvars.iv.next56
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 160
  %15 = sitofp i32 %14 to double
  %16 = insertelement <2 x double> undef, double %10, i32 0
  %17 = insertelement <2 x double> %16, double %15, i32 1
  %18 = fdiv <2 x double> %17, <double 1.600000e+02, double 1.600000e+02>
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %indvars.iv.next56.1 = add nsw i64 %indvars.iv55, 2
  %exitcond58.1 = icmp eq i64 %indvars.iv.next56.1, 160
  br i1 %exitcond58.1, label %._crit_edge16.us.us, label %6

.lr.ph8.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph8.split.us.preheader
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %._crit_edge.us ], [ 0, %.lr.ph8.split.us.preheader ]
  br label %20

; <label>:20:                                     ; preds = %20, %.lr.ph8.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph8.split.us ], [ %indvars.iv.next.1, %20 ]
  %21 = mul nuw nsw i64 %indvars.iv52, %indvars.iv
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 160
  %24 = sitofp i32 %23 to double
  %25 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv52, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %26 = mul nuw nsw i64 %indvars.iv52, %indvars.iv.next
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
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next53, 160
  br i1 %exitcond68, label %._crit_edge9, label %.lr.ph8.split.us

._crit_edge9:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, i32, [140 x [160 x double]]*) unnamed_addr #1 {
.lr.ph12:
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.lr.ph12.split.us

.lr.ph12.split.us:                                ; preds = %._crit_edge6.us, %.lr.ph12
  %indvars.iv39 = phi i64 [ 0, %.lr.ph12 ], [ %indvars.iv.next40, %._crit_edge6.us ]
  %8 = mul nuw nsw i64 %indvars.iv39, 140
  br label %.lr.ph.us.us

._crit_edge6.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond = icmp eq i64 %indvars.iv.next40, 150
  br i1 %exitcond, label %._crit_edge13, label %.lr.ph12.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph12.split.us, %._crit_edge.us.us
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %._crit_edge.us.us ], [ 0, %.lr.ph12.split.us ]
  %9 = add nuw nsw i64 %8, %indvars.iv35
  %10 = mul nuw nsw i64 %9, 160
  br label %11

._crit_edge.us.us:                                ; preds = %18
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next36, 140
  br i1 %exitcond38, label %._crit_edge6.us, label %.lr.ph.us.us

; <label>:11:                                     ; preds = %18, %.lr.ph.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %18 ], [ 0, %.lr.ph.us.us ]
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
  %20 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv39, i64 %indvars.iv35, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond34, label %._crit_edge.us.us, label %11

._crit_edge13:                                    ; preds = %._crit_edge6.us
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
