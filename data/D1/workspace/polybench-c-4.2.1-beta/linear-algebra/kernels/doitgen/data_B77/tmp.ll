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
  br i1 %7, label %.preheader6.lr.ph, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %6
  br label %._crit_edge

.preheader6.lr.ph:                                ; preds = %6
  %wide.trip.count54.1 = zext i32 %2 to i64
  %8 = sext i32 %2 to i64
  %9 = sext i32 %1 to i64
  %10 = sext i32 %0 to i64
  %11 = icmp sgt i32 %1, 0
  %12 = icmp sgt i32 %2, 0
  %13 = and i32 %2, 1
  %lcmp.mod = icmp eq i32 %13, 0
  %14 = icmp eq i32 %2, 1
  %sunkaddr71 = ptrtoint double* %5 to i64
  %scevgep80 = getelementptr double, double* %5, i64 %8
  %15 = add nsw i64 %9, -1
  %16 = add nsw i64 %8, -4
  %17 = lshr i64 %16, 2
  %18 = add nuw nsw i64 %17, 1
  %min.iters.check = icmp ult i32 %2, 4
  %n.vec = and i64 %8, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %xtraiter124 = and i64 %18, 3
  %lcmp.mod125 = icmp eq i64 %xtraiter124, 0
  %19 = icmp ult i64 %16, 12
  %cmp.n = icmp eq i64 %8, %n.vec
  %xtraiter = and i64 %9, 7
  %lcmp.mod123 = icmp eq i64 %xtraiter, 0
  %20 = icmp ult i64 %15, 7
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge16..preheader6_crit_edge, %.preheader6.lr.ph
  %indvars.iv64 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next65, %._crit_edge16..preheader6_crit_edge ]
  br i1 %11, label %.preheader5.lr.ph, label %.preheader6.._crit_edge16_crit_edge

.preheader6.._crit_edge16_crit_edge:              ; preds = %.preheader6
  br label %._crit_edge16

.preheader5.lr.ph:                                ; preds = %.preheader6
  br i1 %12, label %.preheader5.us.preheader, label %.preheader5.preheader

.preheader5.preheader:                            ; preds = %.preheader5.lr.ph
  br i1 %lcmp.mod123, label %.preheader5.preheader..preheader5.prol.loopexit_crit_edge, label %.preheader5.prol.preheader

.preheader5.preheader..preheader5.prol.loopexit_crit_edge: ; preds = %.preheader5.preheader
  br label %.preheader5.prol.loopexit

.preheader5.prol.preheader:                       ; preds = %.preheader5.preheader
  br label %.preheader5.prol

.preheader5.prol:                                 ; preds = %.preheader5.prol..preheader5.prol_crit_edge, %.preheader5.prol.preheader
  %indvars.iv48.prol = phi i64 [ %indvars.iv.next49.prol, %.preheader5.prol..preheader5.prol_crit_edge ], [ 0, %.preheader5.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader5.prol..preheader5.prol_crit_edge ], [ %xtraiter, %.preheader5.prol.preheader ]
  %indvars.iv.next49.prol = add nuw nsw i64 %indvars.iv48.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader5.prol.loopexit.unr-lcssa, label %.preheader5.prol..preheader5.prol_crit_edge, !llvm.loop !1

.preheader5.prol..preheader5.prol_crit_edge:      ; preds = %.preheader5.prol
  br label %.preheader5.prol

.preheader5.prol.loopexit.unr-lcssa:              ; preds = %.preheader5.prol
  br label %.preheader5.prol.loopexit

.preheader5.prol.loopexit:                        ; preds = %.preheader5.preheader..preheader5.prol.loopexit_crit_edge, %.preheader5.prol.loopexit.unr-lcssa
  %indvars.iv48.unr = phi i64 [ 0, %.preheader5.preheader..preheader5.prol.loopexit_crit_edge ], [ %indvars.iv.next49.prol, %.preheader5.prol.loopexit.unr-lcssa ]
  br i1 %20, label %.preheader5.prol.loopexit.._crit_edge16.loopexit122_crit_edge, label %.preheader5.preheader.new

.preheader5.prol.loopexit.._crit_edge16.loopexit122_crit_edge: ; preds = %.preheader5.prol.loopexit
  br label %._crit_edge16.loopexit122

.preheader5.preheader.new:                        ; preds = %.preheader5.prol.loopexit
  br label %.preheader5

.preheader5.us.preheader:                         ; preds = %.preheader5.lr.ph
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %._crit_edge14.us..preheader5.us_crit_edge, %.preheader5.us.preheader
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %._crit_edge14.us..preheader5.us_crit_edge ], [ 0, %.preheader5.us.preheader ]
  %scevgep = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv64, i64 %indvars.iv62, i64 0
  %21 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv64, i64 %indvars.iv62, i64 0
  br label %.lr.ph.us.us

._crit_edge14.us.loopexit:                        ; preds = %.lr.ph13.us
  br label %._crit_edge14.us

._crit_edge14.us:                                 ; preds = %middle.block.._crit_edge14.us_crit_edge, %._crit_edge14.us.loopexit
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond118 = icmp eq i64 %indvars.iv.next63, %9
  br i1 %exitcond118, label %._crit_edge16.loopexit, label %._crit_edge14.us..preheader5.us_crit_edge

._crit_edge14.us..preheader5.us_crit_edge:        ; preds = %._crit_edge14.us
  br label %.preheader5.us

.lr.ph13.us:                                      ; preds = %.lr.ph13.us..lr.ph13.us_crit_edge, %.lr.ph13.us.preheader121
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %.lr.ph13.us..lr.ph13.us_crit_edge ], [ %indvars.iv60.ph, %.lr.ph13.us.preheader121 ]
  %22 = getelementptr inbounds double, double* %5, i64 %indvars.iv60
  %23 = bitcast double* %22 to i64*
  %24 = load i64, i64* %23, align 8
  %25 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv64, i64 %indvars.iv62, i64 %indvars.iv60
  %26 = bitcast double* %25 to i64*
  store i64 %24, i64* %26, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %27 = icmp slt i64 %indvars.iv.next61, %8
  br i1 %27, label %.lr.ph13.us..lr.ph13.us_crit_edge, label %._crit_edge14.us.loopexit, !llvm.loop !3

.lr.ph13.us..lr.ph13.us_crit_edge:                ; preds = %.lr.ph13.us
  br label %.lr.ph13.us

.lr.ph13.us.preheader:                            ; preds = %._crit_edge.us.us
  %scevgep78 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv64, i64 %indvars.iv62, i64 %8
  br i1 %min.iters.check, label %.lr.ph13.us.preheader..lr.ph13.us.preheader121_crit_edge, label %min.iters.checked

.lr.ph13.us.preheader..lr.ph13.us.preheader121_crit_edge: ; preds = %.lr.ph13.us.preheader
  br label %.lr.ph13.us.preheader121

.lr.ph13.us.preheader121:                         ; preds = %middle.block..lr.ph13.us.preheader121_crit_edge, %vector.memcheck..lr.ph13.us.preheader121_crit_edge, %min.iters.checked..lr.ph13.us.preheader121_crit_edge, %.lr.ph13.us.preheader..lr.ph13.us.preheader121_crit_edge
  %indvars.iv60.ph = phi i64 [ 0, %vector.memcheck..lr.ph13.us.preheader121_crit_edge ], [ 0, %min.iters.checked..lr.ph13.us.preheader121_crit_edge ], [ 0, %.lr.ph13.us.preheader..lr.ph13.us.preheader121_crit_edge ], [ %n.vec, %middle.block..lr.ph13.us.preheader121_crit_edge ]
  br label %.lr.ph13.us

min.iters.checked:                                ; preds = %.lr.ph13.us.preheader
  br i1 %cmp.zero, label %min.iters.checked..lr.ph13.us.preheader121_crit_edge, label %vector.memcheck

min.iters.checked..lr.ph13.us.preheader121_crit_edge: ; preds = %min.iters.checked
  br label %.lr.ph13.us.preheader121

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep80
  %bound1 = icmp ugt double* %scevgep78, %5
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %vector.memcheck..lr.ph13.us.preheader121_crit_edge, label %vector.body.preheader

vector.memcheck..lr.ph13.us.preheader121_crit_edge: ; preds = %vector.memcheck
  br label %.lr.ph13.us.preheader121

vector.body.preheader:                            ; preds = %vector.memcheck
  br i1 %lcmp.mod125, label %vector.body.preheader.vector.body.prol.loopexit_crit_edge, label %vector.body.prol.preheader

vector.body.preheader.vector.body.prol.loopexit_crit_edge: ; preds = %vector.body.preheader
  br label %vector.body.prol.loopexit

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.vector.body.prol_crit_edge, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol.vector.body.prol_crit_edge ], [ 0, %vector.body.prol.preheader ]
  %prol.iter126 = phi i64 [ %prol.iter126.sub, %vector.body.prol.vector.body.prol_crit_edge ], [ %xtraiter124, %vector.body.prol.preheader ]
  %28 = getelementptr inbounds double, double* %5, i64 %index.prol
  %29 = bitcast double* %28 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %29, align 8, !alias.scope !6
  %30 = getelementptr double, double* %28, i64 2
  %31 = bitcast double* %30 to <2 x i64>*
  %wide.load83.prol = load <2 x i64>, <2 x i64>* %31, align 8, !alias.scope !6
  %32 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv64, i64 %indvars.iv62, i64 %index.prol
  %33 = bitcast double* %32 to <2 x i64>*
  store <2 x i64> %wide.load.prol, <2 x i64>* %33, align 8, !alias.scope !9, !noalias !6
  %34 = getelementptr double, double* %32, i64 2
  %35 = bitcast double* %34 to <2 x i64>*
  store <2 x i64> %wide.load83.prol, <2 x i64>* %35, align 8, !alias.scope !9, !noalias !6
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter126.sub = add i64 %prol.iter126, -1
  %prol.iter126.cmp = icmp eq i64 %prol.iter126.sub, 0
  br i1 %prol.iter126.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol.vector.body.prol_crit_edge, !llvm.loop !11

vector.body.prol.vector.body.prol_crit_edge:      ; preds = %vector.body.prol
  br label %vector.body.prol

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader.vector.body.prol.loopexit_crit_edge, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader.vector.body.prol.loopexit_crit_edge ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  br i1 %19, label %vector.body.prol.loopexit.middle.block_crit_edge, label %vector.body.preheader.new

vector.body.prol.loopexit.middle.block_crit_edge: ; preds = %vector.body.prol.loopexit
  br label %middle.block

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body.vector.body_crit_edge ]
  %36 = getelementptr inbounds double, double* %5, i64 %index
  %37 = bitcast double* %36 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %37, align 8, !alias.scope !6
  %38 = getelementptr double, double* %36, i64 2
  %39 = bitcast double* %38 to <2 x i64>*
  %wide.load83 = load <2 x i64>, <2 x i64>* %39, align 8, !alias.scope !6
  %40 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv64, i64 %indvars.iv62, i64 %index
  %41 = bitcast double* %40 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %41, align 8, !alias.scope !9, !noalias !6
  %42 = getelementptr double, double* %40, i64 2
  %43 = bitcast double* %42 to <2 x i64>*
  store <2 x i64> %wide.load83, <2 x i64>* %43, align 8, !alias.scope !9, !noalias !6
  %index.next = add i64 %index, 4
  %44 = getelementptr inbounds double, double* %5, i64 %index.next
  %45 = bitcast double* %44 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %45, align 8, !alias.scope !6
  %46 = getelementptr double, double* %44, i64 2
  %47 = bitcast double* %46 to <2 x i64>*
  %wide.load83.1 = load <2 x i64>, <2 x i64>* %47, align 8, !alias.scope !6
  %48 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv64, i64 %indvars.iv62, i64 %index.next
  %49 = bitcast double* %48 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %49, align 8, !alias.scope !9, !noalias !6
  %50 = getelementptr double, double* %48, i64 2
  %51 = bitcast double* %50 to <2 x i64>*
  store <2 x i64> %wide.load83.1, <2 x i64>* %51, align 8, !alias.scope !9, !noalias !6
  %index.next.1 = add i64 %index, 8
  %52 = getelementptr inbounds double, double* %5, i64 %index.next.1
  %53 = bitcast double* %52 to <2 x i64>*
  %wide.load.2 = load <2 x i64>, <2 x i64>* %53, align 8, !alias.scope !6
  %54 = getelementptr double, double* %52, i64 2
  %55 = bitcast double* %54 to <2 x i64>*
  %wide.load83.2 = load <2 x i64>, <2 x i64>* %55, align 8, !alias.scope !6
  %56 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv64, i64 %indvars.iv62, i64 %index.next.1
  %57 = bitcast double* %56 to <2 x i64>*
  store <2 x i64> %wide.load.2, <2 x i64>* %57, align 8, !alias.scope !9, !noalias !6
  %58 = getelementptr double, double* %56, i64 2
  %59 = bitcast double* %58 to <2 x i64>*
  store <2 x i64> %wide.load83.2, <2 x i64>* %59, align 8, !alias.scope !9, !noalias !6
  %index.next.2 = add i64 %index, 12
  %60 = getelementptr inbounds double, double* %5, i64 %index.next.2
  %61 = bitcast double* %60 to <2 x i64>*
  %wide.load.3 = load <2 x i64>, <2 x i64>* %61, align 8, !alias.scope !6
  %62 = getelementptr double, double* %60, i64 2
  %63 = bitcast double* %62 to <2 x i64>*
  %wide.load83.3 = load <2 x i64>, <2 x i64>* %63, align 8, !alias.scope !6
  %64 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv64, i64 %indvars.iv62, i64 %index.next.2
  %65 = bitcast double* %64 to <2 x i64>*
  store <2 x i64> %wide.load.3, <2 x i64>* %65, align 8, !alias.scope !9, !noalias !6
  %66 = getelementptr double, double* %64, i64 2
  %67 = bitcast double* %66 to <2 x i64>*
  store <2 x i64> %wide.load83.3, <2 x i64>* %67, align 8, !alias.scope !9, !noalias !6
  %index.next.3 = add i64 %index, 16
  %68 = icmp eq i64 %index.next.3, %n.vec
  br i1 %68, label %middle.block.unr-lcssa, label %vector.body.vector.body_crit_edge, !llvm.loop !12

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit.middle.block_crit_edge, %middle.block.unr-lcssa
  br i1 %cmp.n, label %middle.block.._crit_edge14.us_crit_edge, label %middle.block..lr.ph13.us.preheader121_crit_edge

middle.block..lr.ph13.us.preheader121_crit_edge:  ; preds = %middle.block
  br label %.lr.ph13.us.preheader121

middle.block.._crit_edge14.us_crit_edge:          ; preds = %middle.block
  br label %._crit_edge14.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us..lr.ph.us.us_crit_edge, %.preheader5.us
  %indvars.iv56 = phi i64 [ 0, %.preheader5.us ], [ %indvars.iv.next57, %._crit_edge.us.us..lr.ph.us.us_crit_edge ]
  %69 = getelementptr inbounds double, double* %5, i64 %indvars.iv56
  store double 0.000000e+00, double* %69, align 8
  br i1 %lcmp.mod, label %.lr.ph.us.us..prol.loopexit_crit_edge, label %70

.lr.ph.us.us..prol.loopexit_crit_edge:            ; preds = %.lr.ph.us.us
  br label %.prol.loopexit

; <label>:70:                                     ; preds = %.lr.ph.us.us
  %71 = load double, double* %21, align 8
  %72 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv56
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %sunkaddr68 = shl i64 %indvars.iv56, 3
  %sunkaddr69 = add i64 %sunkaddr71, %sunkaddr68
  %sunkaddr70 = inttoptr i64 %sunkaddr69 to double*
  %75 = load double, double* %sunkaddr70, align 8
  %76 = fadd double %75, %74
  store double %76, double* %sunkaddr70, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us.us..prol.loopexit_crit_edge, %70
  %indvars.iv52.unr.ph = phi i64 [ 1, %70 ], [ 0, %.lr.ph.us.us..prol.loopexit_crit_edge ]
  br i1 %14, label %.prol.loopexit.._crit_edge.us.us_crit_edge, label %.prol.loopexit..lr.ph.us.us.new_crit_edge

.prol.loopexit.._crit_edge.us.us_crit_edge:       ; preds = %.prol.loopexit
  br label %._crit_edge.us.us

.prol.loopexit..lr.ph.us.us.new_crit_edge:        ; preds = %.prol.loopexit
  %sunkaddr72 = shl i64 %indvars.iv56, 3
  %sunkaddr73 = add i64 %sunkaddr71, %sunkaddr72
  %sunkaddr74 = inttoptr i64 %sunkaddr73 to double*
  %.pre = load double, double* %sunkaddr74, align 8
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %.prol.loopexit.._crit_edge.us.us_crit_edge, %._crit_edge.us.us.loopexit
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next57, %wide.trip.count54.1
  br i1 %exitcond59, label %.lr.ph13.us.preheader, label %._crit_edge.us.us..lr.ph.us.us_crit_edge

._crit_edge.us.us..lr.ph.us.us_crit_edge:         ; preds = %._crit_edge.us.us
  br label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge, %.prol.loopexit..lr.ph.us.us.new_crit_edge
  %77 = phi double [ %.pre, %.prol.loopexit..lr.ph.us.us.new_crit_edge ], [ %89, %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge ]
  %indvars.iv52 = phi i64 [ %indvars.iv52.unr.ph, %.prol.loopexit..lr.ph.us.us.new_crit_edge ], [ %indvars.iv.next53.1, %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge ]
  %78 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv64, i64 %indvars.iv62, i64 %indvars.iv52
  %79 = load double, double* %78, align 8
  %80 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv52, i64 %indvars.iv56
  %81 = load double, double* %80, align 8
  %82 = fmul double %79, %81
  %83 = fadd double %77, %82
  store double %83, double* %sunkaddr74, align 8
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %84 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv64, i64 %indvars.iv62, i64 %indvars.iv.next53
  %85 = load double, double* %84, align 8
  %86 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next53, i64 %indvars.iv56
  %87 = load double, double* %86, align 8
  %88 = fmul double %85, %87
  %89 = fadd double %83, %88
  store double %89, double* %sunkaddr74, align 8
  %indvars.iv.next53.1 = add nuw nsw i64 %indvars.iv52, 2
  %exitcond55.1 = icmp eq i64 %indvars.iv.next53.1, %wide.trip.count54.1
  br i1 %exitcond55.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge

.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge:      ; preds = %.lr.ph.us.us.new
  br label %.lr.ph.us.us.new

.preheader5:                                      ; preds = %.preheader5..preheader5_crit_edge, %.preheader5.preheader.new
  %indvars.iv48 = phi i64 [ %indvars.iv48.unr, %.preheader5.preheader.new ], [ %indvars.iv.next49.7, %.preheader5..preheader5_crit_edge ]
  %indvars.iv.next49.7 = add nsw i64 %indvars.iv48, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next49.7, %9
  br i1 %exitcond.7, label %._crit_edge16.loopexit122.unr-lcssa, label %.preheader5..preheader5_crit_edge

.preheader5..preheader5_crit_edge:                ; preds = %.preheader5
  br label %.preheader5

._crit_edge16.loopexit:                           ; preds = %._crit_edge14.us
  br label %._crit_edge16

._crit_edge16.loopexit122.unr-lcssa:              ; preds = %.preheader5
  br label %._crit_edge16.loopexit122

._crit_edge16.loopexit122:                        ; preds = %.preheader5.prol.loopexit.._crit_edge16.loopexit122_crit_edge, %._crit_edge16.loopexit122.unr-lcssa
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %.preheader6.._crit_edge16_crit_edge, %._crit_edge16.loopexit122, %._crit_edge16.loopexit
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond119 = icmp eq i64 %indvars.iv.next65, %10
  br i1 %exitcond119, label %._crit_edge.loopexit, label %._crit_edge16..preheader6_crit_edge

._crit_edge16..preheader6_crit_edge:              ; preds = %._crit_edge16
  br label %.preheader6

._crit_edge.loopexit:                             ; preds = %._crit_edge16
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %._crit_edge.loopexit
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
  %8 = bitcast i8* %5 to [160 x double]*
  %9 = bitcast i8* %4 to double*
  call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %8, double* %9)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %10 = icmp sgt i32 %0, 42
  br i1 %10, label %11, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:11:                                     ; preds = %2
  %12 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %12, align 1
  %13 = icmp eq i8 %strcmpload, 0
  br i1 %13, label %14, label %.._crit_edge_crit_edge3

.._crit_edge_crit_edge3:                          ; preds = %11
  br label %._crit_edge

; <label>:14:                                     ; preds = %11
  call fastcc void @print_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge3, %.._crit_edge_crit_edge, %14
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

.preheader7.us:                                   ; preds = %._crit_edge18.us..preheader7.us_crit_edge, %.preheader7.lr.ph
  %indvars.iv57 = phi i64 [ 0, %.preheader7.lr.ph ], [ %indvars.iv.next58, %._crit_edge18.us..preheader7.us_crit_edge ]
  br label %.preheader6.us.us

._crit_edge18.us:                                 ; preds = %._crit_edge16.us.us
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next58, 150
  br i1 %exitcond65, label %.preheader.us.preheader, label %._crit_edge18.us..preheader7.us_crit_edge

._crit_edge18.us..preheader7.us_crit_edge:        ; preds = %._crit_edge18.us
  br label %.preheader7.us

.preheader.us.preheader:                          ; preds = %._crit_edge18.us
  br label %.preheader.us

.preheader6.us.us:                                ; preds = %._crit_edge16.us.us..preheader6.us.us_crit_edge, %.preheader7.us
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %._crit_edge16.us.us..preheader6.us.us_crit_edge ], [ 0, %.preheader7.us ]
  %5 = mul nuw nsw i64 %indvars.iv57, %indvars.iv53
  br label %._crit_edge

._crit_edge16.us.us:                              ; preds = %._crit_edge
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next54, 140
  br i1 %exitcond56, label %._crit_edge18.us, label %._crit_edge16.us.us..preheader6.us.us_crit_edge

._crit_edge16.us.us..preheader6.us.us_crit_edge:  ; preds = %._crit_edge16.us.us
  br label %.preheader6.us.us

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %.preheader6.us.us
  %indvars.iv49 = phi i64 [ 0, %.preheader6.us.us ], [ %indvars.iv.next50.1, %._crit_edge.._crit_edge_crit_edge ]
  %6 = add nuw nsw i64 %5, %indvars.iv49
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 160
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv57, i64 %indvars.iv53, i64 %indvars.iv49
  %indvars.iv.next50 = or i64 %indvars.iv49, 1
  %11 = add nuw nsw i64 %5, %indvars.iv.next50
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 160
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %9, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 1.600000e+02, double 1.600000e+02>
  %18 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %indvars.iv.next50.1 = add nsw i64 %indvars.iv49, 2
  %exitcond52.1 = icmp eq i64 %indvars.iv.next50.1, 160
  br i1 %exitcond52.1, label %._crit_edge16.us.us, label %._crit_edge.._crit_edge_crit_edge

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  br label %._crit_edge63

._crit_edge63:                                    ; preds = %._crit_edge63.._crit_edge63_crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %._crit_edge63.._crit_edge63_crit_edge ]
  %19 = mul nuw nsw i64 %indvars.iv46, %indvars.iv
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 160
  %22 = sitofp i32 %21 to double
  %23 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv46, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %24 = mul nuw nsw i64 %indvars.iv46, %indvars.iv.next
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
  br i1 %exitcond.1, label %._crit_edge.us, label %._crit_edge63.._crit_edge63_crit_edge

._crit_edge63.._crit_edge63_crit_edge:            ; preds = %._crit_edge63
  br label %._crit_edge63

._crit_edge.us:                                   ; preds = %._crit_edge63
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next47, 160
  br i1 %exitcond64, label %.preheader5._crit_edge, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

.preheader5._crit_edge:                           ; preds = %._crit_edge.us
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
  %7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %._crit_edge6.us..preheader3.us_crit_edge, %.preheader3.lr.ph
  %indvars.iv39 = phi i64 [ 0, %.preheader3.lr.ph ], [ %indvars.iv.next40, %._crit_edge6.us..preheader3.us_crit_edge ]
  %8 = mul nuw nsw i64 %indvars.iv39, 140
  br label %.preheader.us.us

._crit_edge6.us:                                  ; preds = %._crit_edge5.us.us
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond = icmp eq i64 %indvars.iv.next40, 150
  br i1 %exitcond, label %._crit_edge, label %._crit_edge6.us..preheader3.us_crit_edge

._crit_edge6.us..preheader3.us_crit_edge:         ; preds = %._crit_edge6.us
  br label %.preheader3.us

.preheader.us.us:                                 ; preds = %._crit_edge5.us.us..preheader.us.us_crit_edge, %.preheader3.us
  %indvars.iv35 = phi i64 [ 0, %.preheader3.us ], [ %indvars.iv.next36, %._crit_edge5.us.us..preheader.us.us_crit_edge ]
  %9 = add nuw nsw i64 %8, %indvars.iv35
  %10 = mul nuw nsw i64 %9, 160
  br label %._crit_edge.us.us._crit_edge

._crit_edge5.us.us:                               ; preds = %._crit_edge.us.us
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next36, 140
  br i1 %exitcond38, label %._crit_edge6.us, label %._crit_edge5.us.us..preheader.us.us_crit_edge

._crit_edge5.us.us..preheader.us.us_crit_edge:    ; preds = %._crit_edge5.us.us
  br label %.preheader.us.us

._crit_edge.us.us._crit_edge:                     ; preds = %._crit_edge.us.us.._crit_edge.us.us._crit_edge_crit_edge, %.preheader.us.us
  %indvars.iv = phi i64 [ 0, %.preheader.us.us ], [ %indvars.iv.next, %._crit_edge.us.us.._crit_edge.us.us._crit_edge_crit_edge ]
  %11 = add nuw nsw i64 %10, %indvars.iv
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge.us.us._crit_edge.._crit_edge.us.us_crit_edge

._crit_edge.us.us._crit_edge.._crit_edge.us.us_crit_edge: ; preds = %._crit_edge.us.us._crit_edge
  br label %._crit_edge.us.us

; <label>:15:                                     ; preds = %._crit_edge.us.us._crit_edge
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us._crit_edge.._crit_edge.us.us_crit_edge, %15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv39, i64 %indvars.iv35, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond34, label %._crit_edge5.us.us, label %._crit_edge.us.us.._crit_edge.us.us._crit_edge_crit_edge

._crit_edge.us.us.._crit_edge.us.us._crit_edge_crit_edge: ; preds = %._crit_edge.us.us
  br label %._crit_edge.us.us._crit_edge

._crit_edge:                                      ; preds = %._crit_edge6.us
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
