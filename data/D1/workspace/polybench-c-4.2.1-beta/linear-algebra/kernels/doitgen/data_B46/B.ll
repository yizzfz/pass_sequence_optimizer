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
  br i1 %7, label %.preheader6.lr.ph, label %._crit_edge31

.preheader6.lr.ph:                                ; preds = %6
  %8 = icmp sgt i32 %1, 0
  %9 = icmp sgt i32 %2, 0
  %10 = sext i32 %2 to i64
  %11 = sext i32 %1 to i64
  %12 = sext i32 %0 to i64
  %xtraiter = and i32 %2, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %13 = icmp eq i32 %2, 1
  %wide.trip.count56 = zext i32 %2 to i64
  %scevgep74 = getelementptr double, double* %5, i64 %10
  %14 = add nsw i64 %11, -1
  %15 = add nsw i64 %10, -4
  %16 = lshr i64 %15, 2
  %17 = add nuw nsw i64 %16, 1
  %18 = add nsw i64 %10, -1
  %min.iters.check = icmp ult i32 %2, 4
  %n.vec = and i64 %10, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %xtraiter82 = and i64 %17, 3
  %lcmp.mod83 = icmp eq i64 %xtraiter82, 0
  %19 = icmp ult i64 %15, 12
  %cmp.n = icmp eq i64 %10, %n.vec
  %xtraiter80 = and i64 %11, 7
  %lcmp.mod81 = icmp eq i64 %xtraiter80, 0
  %20 = icmp ult i64 %14, 7
  %21 = shl i64 %xtraiter82, 2
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge15, %.preheader6.lr.ph
  %indvars.iv62 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next63, %._crit_edge15 ]
  br i1 %8, label %.preheader5.lr.ph, label %._crit_edge15

.preheader5.lr.ph:                                ; preds = %.preheader6
  br i1 %9, label %.preheader5.us.preheader, label %.preheader5.preheader

.preheader5.preheader:                            ; preds = %.preheader5.lr.ph
  br i1 %lcmp.mod81, label %.preheader5.prol.loopexit, label %.preheader5.prol.preheader

.preheader5.prol.preheader:                       ; preds = %.preheader5.preheader
  br label %.preheader5.prol

.preheader5.prol:                                 ; preds = %.preheader5.prol, %.preheader5.prol.preheader
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader5.prol ], [ %xtraiter80, %.preheader5.prol.preheader ]
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader5.prol.loopexit.unr-lcssa, label %.preheader5.prol, !llvm.loop !1

.preheader5.prol.loopexit.unr-lcssa:              ; preds = %.preheader5.prol
  br label %.preheader5.prol.loopexit

.preheader5.prol.loopexit:                        ; preds = %.preheader5.preheader, %.preheader5.prol.loopexit.unr-lcssa
  %indvars.iv46.unr = phi i64 [ 0, %.preheader5.preheader ], [ %xtraiter80, %.preheader5.prol.loopexit.unr-lcssa ]
  br i1 %20, label %._crit_edge15.loopexit79, label %.preheader5.preheader.new

.preheader5.preheader.new:                        ; preds = %.preheader5.prol.loopexit
  br label %.preheader5

.preheader5.us.preheader:                         ; preds = %.preheader5.lr.ph
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %.preheader5.us.preheader, %._crit_edge12.us
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %._crit_edge12.us ], [ 0, %.preheader5.us.preheader ]
  %22 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 0
  br label %.lr.ph.us.us

._crit_edge12.us.loopexit.unr-lcssa:              ; preds = %.lr.ph11.us
  br label %._crit_edge12.us.loopexit

._crit_edge12.us.loopexit:                        ; preds = %.lr.ph11.us.prol.loopexit, %._crit_edge12.us.loopexit.unr-lcssa
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %._crit_edge12.us.loopexit, %middle.block
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next61, %11
  br i1 %exitcond69, label %._crit_edge15.loopexit, label %.preheader5.us

.lr.ph11.us:                                      ; preds = %.lr.ph11.us, %.lr.ph11.us.preheader78.new
  %indvars.iv58 = phi i64 [ %indvars.iv58.unr, %.lr.ph11.us.preheader78.new ], [ %indvars.iv.next59.3, %.lr.ph11.us ]
  %23 = getelementptr inbounds double, double* %5, i64 %indvars.iv58
  %24 = bitcast double* %23 to i64*
  %25 = load i64, i64* %24, align 8
  %26 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 %indvars.iv58
  %27 = bitcast double* %26 to i64*
  store i64 %25, i64* %27, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %28 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next59
  %29 = bitcast double* %28 to i64*
  %30 = load i64, i64* %29, align 8
  %31 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 %indvars.iv.next59
  %32 = bitcast double* %31 to i64*
  store i64 %30, i64* %32, align 8
  %indvars.iv.next59.1 = add nsw i64 %indvars.iv58, 2
  %33 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next59.1
  %34 = bitcast double* %33 to i64*
  %35 = load i64, i64* %34, align 8
  %36 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 %indvars.iv.next59.1
  %37 = bitcast double* %36 to i64*
  store i64 %35, i64* %37, align 8
  %indvars.iv.next59.2 = add nsw i64 %indvars.iv58, 3
  %38 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next59.2
  %39 = bitcast double* %38 to i64*
  %40 = load i64, i64* %39, align 8
  %41 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 %indvars.iv.next59.2
  %42 = bitcast double* %41 to i64*
  store i64 %40, i64* %42, align 8
  %indvars.iv.next59.3 = add nsw i64 %indvars.iv58, 4
  %exitcond68.3 = icmp eq i64 %indvars.iv.next59.3, %10
  br i1 %exitcond68.3, label %._crit_edge12.us.loopexit.unr-lcssa, label %.lr.ph11.us, !llvm.loop !3

.lr.ph11.us.preheader:                            ; preds = %._crit_edge.us.us
  %scevgep = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 0
  %scevgep72 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 %10
  br i1 %min.iters.check, label %.lr.ph11.us.preheader78, label %min.iters.checked

.lr.ph11.us.preheader78:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph11.us.preheader
  %indvars.iv58.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph11.us.preheader ], [ %n.vec, %middle.block ]
  %43 = sub nsw i64 %10, %indvars.iv58.ph
  %44 = sub nsw i64 %18, %indvars.iv58.ph
  %xtraiter85 = and i64 %43, 3
  %lcmp.mod86 = icmp eq i64 %xtraiter85, 0
  br i1 %lcmp.mod86, label %.lr.ph11.us.prol.loopexit, label %.lr.ph11.us.prol.preheader

.lr.ph11.us.prol.preheader:                       ; preds = %.lr.ph11.us.preheader78
  br label %.lr.ph11.us.prol

.lr.ph11.us.prol:                                 ; preds = %.lr.ph11.us.prol, %.lr.ph11.us.prol.preheader
  %indvars.iv58.prol = phi i64 [ %indvars.iv.next59.prol, %.lr.ph11.us.prol ], [ %indvars.iv58.ph, %.lr.ph11.us.prol.preheader ]
  %prol.iter87 = phi i64 [ %prol.iter87.sub, %.lr.ph11.us.prol ], [ %xtraiter85, %.lr.ph11.us.prol.preheader ]
  %45 = getelementptr inbounds double, double* %5, i64 %indvars.iv58.prol
  %46 = bitcast double* %45 to i64*
  %47 = load i64, i64* %46, align 8
  %48 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 %indvars.iv58.prol
  %49 = bitcast double* %48 to i64*
  store i64 %47, i64* %49, align 8
  %indvars.iv.next59.prol = add nuw nsw i64 %indvars.iv58.prol, 1
  %prol.iter87.sub = add nsw i64 %prol.iter87, -1
  %prol.iter87.cmp = icmp eq i64 %prol.iter87.sub, 0
  br i1 %prol.iter87.cmp, label %.lr.ph11.us.prol.loopexit.unr-lcssa, label %.lr.ph11.us.prol, !llvm.loop !6

.lr.ph11.us.prol.loopexit.unr-lcssa:              ; preds = %.lr.ph11.us.prol
  %50 = add i64 %indvars.iv58.ph, %xtraiter85
  br label %.lr.ph11.us.prol.loopexit

.lr.ph11.us.prol.loopexit:                        ; preds = %.lr.ph11.us.preheader78, %.lr.ph11.us.prol.loopexit.unr-lcssa
  %indvars.iv58.unr = phi i64 [ %indvars.iv58.ph, %.lr.ph11.us.preheader78 ], [ %50, %.lr.ph11.us.prol.loopexit.unr-lcssa ]
  %51 = icmp ult i64 %44, 3
  br i1 %51, label %._crit_edge12.us.loopexit, label %.lr.ph11.us.preheader78.new

.lr.ph11.us.preheader78.new:                      ; preds = %.lr.ph11.us.prol.loopexit
  br label %.lr.ph11.us

min.iters.checked:                                ; preds = %.lr.ph11.us.preheader
  br i1 %cmp.zero, label %.lr.ph11.us.preheader78, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep74
  %bound1 = icmp ugt double* %scevgep72, %5
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.lr.ph11.us.preheader78, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br i1 %lcmp.mod83, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter84 = phi i64 [ %prol.iter84.sub, %vector.body.prol ], [ %xtraiter82, %vector.body.prol.preheader ]
  %52 = getelementptr inbounds double, double* %5, i64 %index.prol
  %53 = bitcast double* %52 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %53, align 8, !alias.scope !7
  %54 = getelementptr double, double* %52, i64 2
  %55 = bitcast double* %54 to <2 x i64>*
  %wide.load77.prol = load <2 x i64>, <2 x i64>* %55, align 8, !alias.scope !7
  %56 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 %index.prol
  %57 = bitcast double* %56 to <2 x i64>*
  store <2 x i64> %wide.load.prol, <2 x i64>* %57, align 8, !alias.scope !10, !noalias !7
  %58 = getelementptr double, double* %56, i64 2
  %59 = bitcast double* %58 to <2 x i64>*
  store <2 x i64> %wide.load77.prol, <2 x i64>* %59, align 8, !alias.scope !10, !noalias !7
  %index.next.prol = add nuw nsw i64 %index.prol, 4
  %prol.iter84.sub = add nsw i64 %prol.iter84, -1
  %prol.iter84.cmp = icmp eq i64 %prol.iter84.sub, 0
  br i1 %prol.iter84.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !12

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %21, %vector.body.prol.loopexit.unr-lcssa ]
  br i1 %19, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %60 = getelementptr inbounds double, double* %5, i64 %index
  %61 = bitcast double* %60 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %61, align 8, !alias.scope !7
  %62 = getelementptr double, double* %60, i64 2
  %63 = bitcast double* %62 to <2 x i64>*
  %wide.load77 = load <2 x i64>, <2 x i64>* %63, align 8, !alias.scope !7
  %64 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 %index
  %65 = bitcast double* %64 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %65, align 8, !alias.scope !10, !noalias !7
  %66 = getelementptr double, double* %64, i64 2
  %67 = bitcast double* %66 to <2 x i64>*
  store <2 x i64> %wide.load77, <2 x i64>* %67, align 8, !alias.scope !10, !noalias !7
  %index.next = add i64 %index, 4
  %68 = getelementptr inbounds double, double* %5, i64 %index.next
  %69 = bitcast double* %68 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %69, align 8, !alias.scope !7
  %70 = getelementptr double, double* %68, i64 2
  %71 = bitcast double* %70 to <2 x i64>*
  %wide.load77.1 = load <2 x i64>, <2 x i64>* %71, align 8, !alias.scope !7
  %72 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 %index.next
  %73 = bitcast double* %72 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %73, align 8, !alias.scope !10, !noalias !7
  %74 = getelementptr double, double* %72, i64 2
  %75 = bitcast double* %74 to <2 x i64>*
  store <2 x i64> %wide.load77.1, <2 x i64>* %75, align 8, !alias.scope !10, !noalias !7
  %index.next.1 = add i64 %index, 8
  %76 = getelementptr inbounds double, double* %5, i64 %index.next.1
  %77 = bitcast double* %76 to <2 x i64>*
  %wide.load.2 = load <2 x i64>, <2 x i64>* %77, align 8, !alias.scope !7
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x i64>*
  %wide.load77.2 = load <2 x i64>, <2 x i64>* %79, align 8, !alias.scope !7
  %80 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 %index.next.1
  %81 = bitcast double* %80 to <2 x i64>*
  store <2 x i64> %wide.load.2, <2 x i64>* %81, align 8, !alias.scope !10, !noalias !7
  %82 = getelementptr double, double* %80, i64 2
  %83 = bitcast double* %82 to <2 x i64>*
  store <2 x i64> %wide.load77.2, <2 x i64>* %83, align 8, !alias.scope !10, !noalias !7
  %index.next.2 = add i64 %index, 12
  %84 = getelementptr inbounds double, double* %5, i64 %index.next.2
  %85 = bitcast double* %84 to <2 x i64>*
  %wide.load.3 = load <2 x i64>, <2 x i64>* %85, align 8, !alias.scope !7
  %86 = getelementptr double, double* %84, i64 2
  %87 = bitcast double* %86 to <2 x i64>*
  %wide.load77.3 = load <2 x i64>, <2 x i64>* %87, align 8, !alias.scope !7
  %88 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 %index.next.2
  %89 = bitcast double* %88 to <2 x i64>*
  store <2 x i64> %wide.load.3, <2 x i64>* %89, align 8, !alias.scope !10, !noalias !7
  %90 = getelementptr double, double* %88, i64 2
  %91 = bitcast double* %90 to <2 x i64>*
  store <2 x i64> %wide.load77.3, <2 x i64>* %91, align 8, !alias.scope !10, !noalias !7
  %index.next.3 = add i64 %index, 16
  %92 = icmp eq i64 %index.next.3, %n.vec
  br i1 %92, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !13

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  br i1 %cmp.n, label %._crit_edge12.us, label %.lr.ph11.us.preheader78

.lr.ph.us.us:                                     ; preds = %.preheader5.us, %._crit_edge.us.us
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %._crit_edge.us.us ], [ 0, %.preheader5.us ]
  %93 = getelementptr inbounds double, double* %5, i64 %indvars.iv54
  store double 0.000000e+00, double* %93, align 8
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %94 = load double, double* %22, align 8
  %95 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv54
  %96 = load double, double* %95, align 8
  %97 = fmul double %94, %96
  %98 = fadd double %97, 0.000000e+00
  store double %98, double* %93, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %99 = phi double [ %98, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv50.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %13, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next55, %wide.trip.count56
  br i1 %exitcond57, label %.lr.ph11.us.preheader, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %100 = phi double [ %112, %.lr.ph.us.us.new ], [ %99, %.lr.ph.us.us.new.preheader ]
  %indvars.iv50 = phi i64 [ %indvars.iv.next51.1, %.lr.ph.us.us.new ], [ %indvars.iv50.unr.ph, %.lr.ph.us.us.new.preheader ]
  %101 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 %indvars.iv50
  %102 = load double, double* %101, align 8
  %103 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv50, i64 %indvars.iv54
  %104 = load double, double* %103, align 8
  %105 = fmul double %102, %104
  %106 = fadd double %105, %100
  store double %106, double* %93, align 8
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %107 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 %indvars.iv.next51
  %108 = load double, double* %107, align 8
  %109 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next51, i64 %indvars.iv54
  %110 = load double, double* %109, align 8
  %111 = fmul double %108, %110
  %112 = fadd double %111, %106
  store double %112, double* %93, align 8
  %indvars.iv.next51.1 = add nuw nsw i64 %indvars.iv50, 2
  %exitcond53.1 = icmp eq i64 %indvars.iv.next51.1, %wide.trip.count56
  br i1 %exitcond53.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.preheader5:                                      ; preds = %.preheader5, %.preheader5.preheader.new
  %indvars.iv46 = phi i64 [ %indvars.iv46.unr, %.preheader5.preheader.new ], [ %indvars.iv.next47.7, %.preheader5 ]
  %indvars.iv.next47.7 = add nuw nsw i64 %indvars.iv46, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next47.7, %11
  br i1 %exitcond.7, label %._crit_edge15.loopexit79.unr-lcssa, label %.preheader5

._crit_edge15.loopexit:                           ; preds = %._crit_edge12.us
  br label %._crit_edge15

._crit_edge15.loopexit79.unr-lcssa:               ; preds = %.preheader5
  br label %._crit_edge15.loopexit79

._crit_edge15.loopexit79:                         ; preds = %.preheader5.prol.loopexit, %._crit_edge15.loopexit79.unr-lcssa
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit79, %._crit_edge15.loopexit, %.preheader6
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond70 = icmp eq i64 %indvars.iv.next63, %12
  br i1 %exitcond70, label %._crit_edge31.loopexit, label %.preheader6

._crit_edge31.loopexit:                           ; preds = %._crit_edge15
  br label %._crit_edge31

._crit_edge31:                                    ; preds = %._crit_edge31.loopexit, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
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
  br i1 %9, label %10, label %14

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %14

; <label>:13:                                     ; preds = %10
  call fastcc void @print_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6)
  br label %14

; <label>:14:                                     ; preds = %10, %13, %2
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, [140 x [160 x double]]*, [160 x double]*) unnamed_addr #2 {
.preheader7.lr.ph:
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge17.us, %.preheader7.lr.ph
  %indvars.iv56 = phi i64 [ 0, %.preheader7.lr.ph ], [ %indvars.iv.next57, %._crit_edge17.us ]
  br label %.preheader6.us.us

._crit_edge17.us:                                 ; preds = %._crit_edge14.us.us
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next57, 150
  br i1 %exitcond65, label %.preheader.us.preheader, label %.preheader7.us

.preheader.us.preheader:                          ; preds = %._crit_edge17.us
  br label %.preheader.us

.preheader6.us.us:                                ; preds = %.preheader7.us, %._crit_edge14.us.us
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %._crit_edge14.us.us ], [ 0, %.preheader7.us ]
  %5 = mul nuw nsw i64 %indvars.iv52, %indvars.iv56
  br label %.preheader6.us.us.new

._crit_edge14.us.us:                              ; preds = %.preheader6.us.us.new
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, 140
  br i1 %exitcond55, label %._crit_edge17.us, label %.preheader6.us.us

.preheader6.us.us.new:                            ; preds = %.preheader6.us.us, %.preheader6.us.us.new
  %indvars.iv48 = phi i64 [ %indvars.iv.next49.1, %.preheader6.us.us.new ], [ 0, %.preheader6.us.us ]
  %6 = add nuw nsw i64 %5, %indvars.iv48
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 160
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv56, i64 %indvars.iv52, i64 %indvars.iv48
  %indvars.iv.next49 = or i64 %indvars.iv48, 1
  %11 = add nuw nsw i64 %5, %indvars.iv.next49
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 160
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %9, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 1.600000e+02, double 1.600000e+02>
  %18 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %indvars.iv.next49.1 = add nuw nsw i64 %indvars.iv48, 2
  %exitcond51.1 = icmp eq i64 %indvars.iv.next49.1, 160
  br i1 %exitcond51.1, label %._crit_edge14.us.us, label %.preheader6.us.us.new

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new ], [ 0, %.preheader.us ]
  %19 = mul nuw nsw i64 %indvars.iv, %indvars.iv45
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 160
  %22 = sitofp i32 %21 to double
  %23 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv45, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %24 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv45
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
  br i1 %exitcond.1, label %._crit_edge.us, label %.preheader.us.new

._crit_edge.us:                                   ; preds = %.preheader.us.new
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond = icmp eq i64 %indvars.iv.next46, 160
  br i1 %exitcond, label %._crit_edge9, label %.preheader.us

._crit_edge9:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, i32, [140 x [160 x double]]*) unnamed_addr #0 {
.preheader3.lr.ph:
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %._crit_edge4.us, %.preheader3.lr.ph
  %indvars.iv35 = phi i64 [ 0, %.preheader3.lr.ph ], [ %indvars.iv.next36, %._crit_edge4.us ]
  %8 = mul nuw nsw i64 %indvars.iv35, 140
  br label %.preheader.us.us

._crit_edge4.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond = icmp eq i64 %indvars.iv.next36, 150
  br i1 %exitcond, label %._crit_edge9, label %.preheader3.us

.preheader.us.us:                                 ; preds = %.preheader3.us, %._crit_edge.us.us
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %._crit_edge.us.us ], [ 0, %.preheader3.us ]
  %9 = add nuw nsw i64 %indvars.iv31, %8
  %10 = mul nuw nsw i64 %9, 160
  br label %11

._crit_edge.us.us:                                ; preds = %18
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next32, 140
  br i1 %exitcond34, label %._crit_edge4.us, label %.preheader.us.us

; <label>:11:                                     ; preds = %18, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %18 ], [ 0, %.preheader.us.us ]
  %12 = add nuw nsw i64 %10, %indvars.iv
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %18

; <label>:16:                                     ; preds = %11
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %18

; <label>:18:                                     ; preds = %16, %11
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv35, i64 %indvars.iv31, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond30, label %._crit_edge.us.us, label %11

._crit_edge9:                                     ; preds = %._crit_edge4.us
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %25) #5
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
!6 = distinct !{!6, !2}
!7 = !{!8}
!8 = distinct !{!8, !9}
!9 = distinct !{!9, !"LVerDomain"}
!10 = !{!11}
!11 = distinct !{!11, !9}
!12 = distinct !{!12, !2}
!13 = distinct !{!13, !4, !5}
