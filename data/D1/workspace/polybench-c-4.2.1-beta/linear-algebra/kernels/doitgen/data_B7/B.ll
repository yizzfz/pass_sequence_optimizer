; ModuleID = 'A.ll'
source_filename = "doitgen.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define void @kernel_doitgen(i32, i32, i32, [140 x [160 x double]]*, [160 x double]*, double*) #0 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader6.lr.ph, label %.._crit_edge35_crit_edge

.._crit_edge35_crit_edge:                         ; preds = %6
  br label %._crit_edge35

.preheader6.lr.ph:                                ; preds = %6
  %wide.trip.count.1 = zext i32 %2 to i64
  %8 = sext i32 %2 to i64
  %9 = sext i32 %1 to i64
  %10 = sext i32 %0 to i64
  %11 = icmp sgt i32 %1, 0
  %12 = icmp sgt i32 %2, 0
  %xtraiter = and i32 %2, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %13 = icmp eq i32 %2, 1
  %sunkaddr75 = ptrtoint double* %5 to i64
  %scevgep85 = getelementptr double, double* %5, i64 %8
  %14 = add nsw i64 %9, -1
  %15 = add nsw i64 %8, -4
  %16 = lshr i64 %15, 2
  %17 = add nuw nsw i64 %16, 1
  %min.iters.check = icmp ult i32 %2, 4
  %n.vec = and i64 %8, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %xtraiter125 = and i64 %17, 3
  %lcmp.mod126 = icmp eq i64 %xtraiter125, 0
  %18 = icmp ult i64 %15, 12
  %cmp.n = icmp eq i64 %8, %n.vec
  %xtraiter123 = and i64 %9, 7
  %lcmp.mod124 = icmp eq i64 %xtraiter123, 0
  %19 = icmp ult i64 %14, 7
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge18..preheader6_crit_edge, %.preheader6.lr.ph
  %indvars.iv70 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next71, %._crit_edge18..preheader6_crit_edge ]
  %.lcssa13.lcssa24.lcssa45 = phi i32 [ undef, %.preheader6.lr.ph ], [ %.lcssa13.lcssa24.lcssa44, %._crit_edge18..preheader6_crit_edge ]
  br i1 %11, label %.preheader5.lr.ph, label %.preheader6.._crit_edge18_crit_edge

.preheader6.._crit_edge18_crit_edge:              ; preds = %.preheader6
  br label %._crit_edge18

.preheader5.lr.ph:                                ; preds = %.preheader6
  br i1 %12, label %.preheader5.us.preheader, label %.preheader5.preheader

.preheader5.preheader:                            ; preds = %.preheader5.lr.ph
  br i1 %lcmp.mod124, label %.preheader5.preheader..preheader5.prol.loopexit_crit_edge, label %.preheader5.prol.preheader

.preheader5.preheader..preheader5.prol.loopexit_crit_edge: ; preds = %.preheader5.preheader
  br label %.preheader5.prol.loopexit

.preheader5.prol.preheader:                       ; preds = %.preheader5.preheader
  br label %.preheader5.prol

.preheader5.prol:                                 ; preds = %.preheader5.prol..preheader5.prol_crit_edge, %.preheader5.prol.preheader
  %indvars.iv54.prol = phi i64 [ %indvars.iv.next55.prol, %.preheader5.prol..preheader5.prol_crit_edge ], [ 0, %.preheader5.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader5.prol..preheader5.prol_crit_edge ], [ %xtraiter123, %.preheader5.prol.preheader ]
  %indvars.iv.next55.prol = add nuw nsw i64 %indvars.iv54.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader5.prol.loopexit.unr-lcssa, label %.preheader5.prol..preheader5.prol_crit_edge, !llvm.loop !1

.preheader5.prol..preheader5.prol_crit_edge:      ; preds = %.preheader5.prol
  br label %.preheader5.prol

.preheader5.prol.loopexit.unr-lcssa:              ; preds = %.preheader5.prol
  br label %.preheader5.prol.loopexit

.preheader5.prol.loopexit:                        ; preds = %.preheader5.preheader..preheader5.prol.loopexit_crit_edge, %.preheader5.prol.loopexit.unr-lcssa
  %indvars.iv54.unr = phi i64 [ 0, %.preheader5.preheader..preheader5.prol.loopexit_crit_edge ], [ %indvars.iv.next55.prol, %.preheader5.prol.loopexit.unr-lcssa ]
  br i1 %19, label %.preheader5.prol.loopexit.._crit_edge18.loopexit122_crit_edge, label %.preheader5.preheader.new

.preheader5.prol.loopexit.._crit_edge18.loopexit122_crit_edge: ; preds = %.preheader5.prol.loopexit
  br label %._crit_edge18.loopexit122

.preheader5.preheader.new:                        ; preds = %.preheader5.prol.loopexit
  br label %.preheader5

.preheader5.us.preheader:                         ; preds = %.preheader5.lr.ph
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %._crit_edge16.us..preheader5.us_crit_edge, %.preheader5.us.preheader
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %._crit_edge16.us..preheader5.us_crit_edge ], [ 0, %.preheader5.us.preheader ]
  %scevgep = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv70, i64 %indvars.iv68, i64 0
  %scevgep83 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv70, i64 %indvars.iv68, i64 %8
  %20 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv70, i64 %indvars.iv68, i64 0
  br label %.lr.ph.us.us

._crit_edge16.us.loopexit:                        ; preds = %.lr.ph15.us
  br label %._crit_edge16.us

._crit_edge16.us:                                 ; preds = %middle.block.._crit_edge16.us_crit_edge, %._crit_edge16.us.loopexit
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %21 = icmp slt i64 %indvars.iv.next69, %9
  br i1 %21, label %._crit_edge16.us..preheader5.us_crit_edge, label %._crit_edge18.loopexit

._crit_edge16.us..preheader5.us_crit_edge:        ; preds = %._crit_edge16.us
  br label %.preheader5.us

.lr.ph15.us:                                      ; preds = %.lr.ph15.us..lr.ph15.us_crit_edge, %.lr.ph15.us.preheader121
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %.lr.ph15.us..lr.ph15.us_crit_edge ], [ %indvars.iv63.ph, %.lr.ph15.us.preheader121 ]
  %22 = getelementptr inbounds double, double* %5, i64 %indvars.iv63
  %23 = bitcast double* %22 to i64*
  %24 = load i64, i64* %23, align 8
  %25 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv70, i64 %indvars.iv68, i64 %indvars.iv63
  %26 = bitcast double* %25 to i64*
  store i64 %24, i64* %26, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %27 = icmp slt i64 %indvars.iv.next64, %8
  br i1 %27, label %.lr.ph15.us..lr.ph15.us_crit_edge, label %._crit_edge16.us.loopexit, !llvm.loop !3

.lr.ph15.us..lr.ph15.us_crit_edge:                ; preds = %.lr.ph15.us
  br label %.lr.ph15.us

.lr.ph15.us.preheader:                            ; preds = %._crit_edge.us.us
  br i1 %min.iters.check, label %.lr.ph15.us.preheader..lr.ph15.us.preheader121_crit_edge, label %min.iters.checked

.lr.ph15.us.preheader..lr.ph15.us.preheader121_crit_edge: ; preds = %.lr.ph15.us.preheader
  br label %.lr.ph15.us.preheader121

.lr.ph15.us.preheader121:                         ; preds = %middle.block..lr.ph15.us.preheader121_crit_edge, %vector.memcheck..lr.ph15.us.preheader121_crit_edge, %min.iters.checked..lr.ph15.us.preheader121_crit_edge, %.lr.ph15.us.preheader..lr.ph15.us.preheader121_crit_edge
  %indvars.iv63.ph = phi i64 [ 0, %vector.memcheck..lr.ph15.us.preheader121_crit_edge ], [ 0, %min.iters.checked..lr.ph15.us.preheader121_crit_edge ], [ 0, %.lr.ph15.us.preheader..lr.ph15.us.preheader121_crit_edge ], [ %n.vec, %middle.block..lr.ph15.us.preheader121_crit_edge ]
  br label %.lr.ph15.us

min.iters.checked:                                ; preds = %.lr.ph15.us.preheader
  br i1 %cmp.zero, label %min.iters.checked..lr.ph15.us.preheader121_crit_edge, label %vector.memcheck

min.iters.checked..lr.ph15.us.preheader121_crit_edge: ; preds = %min.iters.checked
  br label %.lr.ph15.us.preheader121

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep85
  %bound1 = icmp ugt double* %scevgep83, %5
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %vector.memcheck..lr.ph15.us.preheader121_crit_edge, label %vector.body.preheader

vector.memcheck..lr.ph15.us.preheader121_crit_edge: ; preds = %vector.memcheck
  br label %.lr.ph15.us.preheader121

vector.body.preheader:                            ; preds = %vector.memcheck
  br i1 %lcmp.mod126, label %vector.body.preheader.vector.body.prol.loopexit_crit_edge, label %vector.body.prol.preheader

vector.body.preheader.vector.body.prol.loopexit_crit_edge: ; preds = %vector.body.preheader
  br label %vector.body.prol.loopexit

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol.vector.body.prol_crit_edge, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol.vector.body.prol_crit_edge ], [ 0, %vector.body.prol.preheader ]
  %prol.iter127 = phi i64 [ %prol.iter127.sub, %vector.body.prol.vector.body.prol_crit_edge ], [ %xtraiter125, %vector.body.prol.preheader ]
  %28 = getelementptr inbounds double, double* %5, i64 %index.prol
  %29 = bitcast double* %28 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %29, align 8, !alias.scope !6
  %30 = getelementptr double, double* %28, i64 2
  %31 = bitcast double* %30 to <2 x i64>*
  %wide.load88.prol = load <2 x i64>, <2 x i64>* %31, align 8, !alias.scope !6
  %32 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv70, i64 %indvars.iv68, i64 %index.prol
  %33 = bitcast double* %32 to <2 x i64>*
  store <2 x i64> %wide.load.prol, <2 x i64>* %33, align 8, !alias.scope !9, !noalias !6
  %34 = getelementptr double, double* %32, i64 2
  %35 = bitcast double* %34 to <2 x i64>*
  store <2 x i64> %wide.load88.prol, <2 x i64>* %35, align 8, !alias.scope !9, !noalias !6
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter127.sub = add i64 %prol.iter127, -1
  %prol.iter127.cmp = icmp eq i64 %prol.iter127.sub, 0
  br i1 %prol.iter127.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol.vector.body.prol_crit_edge, !llvm.loop !11

vector.body.prol.vector.body.prol_crit_edge:      ; preds = %vector.body.prol
  br label %vector.body.prol

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader.vector.body.prol.loopexit_crit_edge, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader.vector.body.prol.loopexit_crit_edge ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  br i1 %18, label %vector.body.prol.loopexit.middle.block_crit_edge, label %vector.body.preheader.new

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
  %wide.load88 = load <2 x i64>, <2 x i64>* %39, align 8, !alias.scope !6
  %40 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv70, i64 %indvars.iv68, i64 %index
  %41 = bitcast double* %40 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %41, align 8, !alias.scope !9, !noalias !6
  %42 = getelementptr double, double* %40, i64 2
  %43 = bitcast double* %42 to <2 x i64>*
  store <2 x i64> %wide.load88, <2 x i64>* %43, align 8, !alias.scope !9, !noalias !6
  %index.next = add i64 %index, 4
  %44 = getelementptr inbounds double, double* %5, i64 %index.next
  %45 = bitcast double* %44 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %45, align 8, !alias.scope !6
  %46 = getelementptr double, double* %44, i64 2
  %47 = bitcast double* %46 to <2 x i64>*
  %wide.load88.1 = load <2 x i64>, <2 x i64>* %47, align 8, !alias.scope !6
  %48 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv70, i64 %indvars.iv68, i64 %index.next
  %49 = bitcast double* %48 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %49, align 8, !alias.scope !9, !noalias !6
  %50 = getelementptr double, double* %48, i64 2
  %51 = bitcast double* %50 to <2 x i64>*
  store <2 x i64> %wide.load88.1, <2 x i64>* %51, align 8, !alias.scope !9, !noalias !6
  %index.next.1 = add i64 %index, 8
  %52 = getelementptr inbounds double, double* %5, i64 %index.next.1
  %53 = bitcast double* %52 to <2 x i64>*
  %wide.load.2 = load <2 x i64>, <2 x i64>* %53, align 8, !alias.scope !6
  %54 = getelementptr double, double* %52, i64 2
  %55 = bitcast double* %54 to <2 x i64>*
  %wide.load88.2 = load <2 x i64>, <2 x i64>* %55, align 8, !alias.scope !6
  %56 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv70, i64 %indvars.iv68, i64 %index.next.1
  %57 = bitcast double* %56 to <2 x i64>*
  store <2 x i64> %wide.load.2, <2 x i64>* %57, align 8, !alias.scope !9, !noalias !6
  %58 = getelementptr double, double* %56, i64 2
  %59 = bitcast double* %58 to <2 x i64>*
  store <2 x i64> %wide.load88.2, <2 x i64>* %59, align 8, !alias.scope !9, !noalias !6
  %index.next.2 = add i64 %index, 12
  %60 = getelementptr inbounds double, double* %5, i64 %index.next.2
  %61 = bitcast double* %60 to <2 x i64>*
  %wide.load.3 = load <2 x i64>, <2 x i64>* %61, align 8, !alias.scope !6
  %62 = getelementptr double, double* %60, i64 2
  %63 = bitcast double* %62 to <2 x i64>*
  %wide.load88.3 = load <2 x i64>, <2 x i64>* %63, align 8, !alias.scope !6
  %64 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv70, i64 %indvars.iv68, i64 %index.next.2
  %65 = bitcast double* %64 to <2 x i64>*
  store <2 x i64> %wide.load.3, <2 x i64>* %65, align 8, !alias.scope !9, !noalias !6
  %66 = getelementptr double, double* %64, i64 2
  %67 = bitcast double* %66 to <2 x i64>*
  store <2 x i64> %wide.load88.3, <2 x i64>* %67, align 8, !alias.scope !9, !noalias !6
  %index.next.3 = add i64 %index, 16
  %68 = icmp eq i64 %index.next.3, %n.vec
  br i1 %68, label %middle.block.unr-lcssa, label %vector.body.vector.body_crit_edge, !llvm.loop !12

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit.middle.block_crit_edge, %middle.block.unr-lcssa
  br i1 %cmp.n, label %middle.block.._crit_edge16.us_crit_edge, label %middle.block..lr.ph15.us.preheader121_crit_edge

middle.block..lr.ph15.us.preheader121_crit_edge:  ; preds = %middle.block
  br label %.lr.ph15.us.preheader121

middle.block.._crit_edge16.us_crit_edge:          ; preds = %middle.block
  br label %._crit_edge16.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us..lr.ph.us.us_crit_edge, %.preheader5.us
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %._crit_edge.us.us..lr.ph.us.us_crit_edge ], [ 0, %.preheader5.us ]
  %69 = getelementptr inbounds double, double* %5, i64 %indvars.iv60
  store double 0.000000e+00, double* %69, align 8
  br i1 %lcmp.mod, label %.lr.ph.us.us..prol.loopexit_crit_edge, label %70

.lr.ph.us.us..prol.loopexit_crit_edge:            ; preds = %.lr.ph.us.us
  br label %.prol.loopexit

; <label>:70:                                     ; preds = %.lr.ph.us.us
  %71 = load double, double* %20, align 8
  %72 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv60
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %sunkaddr72 = shl i64 %indvars.iv60, 3
  %sunkaddr73 = add i64 %sunkaddr75, %sunkaddr72
  %sunkaddr74 = inttoptr i64 %sunkaddr73 to double*
  %75 = load double, double* %sunkaddr74, align 8
  %76 = fadd double %74, %75
  store double %76, double* %sunkaddr74, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us.us..prol.loopexit_crit_edge, %70
  %indvars.iv58.unr.ph = phi i64 [ 1, %70 ], [ 0, %.lr.ph.us.us..prol.loopexit_crit_edge ]
  br i1 %13, label %.prol.loopexit.._crit_edge.us.us_crit_edge, label %.lr.ph.us.us.new.preheader

.prol.loopexit.._crit_edge.us.us_crit_edge:       ; preds = %.prol.loopexit
  br label %._crit_edge.us.us

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  %sunkaddr76 = shl i64 %indvars.iv60, 3
  %sunkaddr77 = add i64 %sunkaddr75, %sunkaddr76
  %sunkaddr78 = inttoptr i64 %sunkaddr77 to double*
  %.pre = load double, double* %sunkaddr78, align 8
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %.prol.loopexit.._crit_edge.us.us_crit_edge, %._crit_edge.us.us.loopexit
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond = icmp eq i64 %indvars.iv.next61, %wide.trip.count.1
  br i1 %exitcond, label %.lr.ph15.us.preheader, label %._crit_edge.us.us..lr.ph.us.us_crit_edge

._crit_edge.us.us..lr.ph.us.us_crit_edge:         ; preds = %._crit_edge.us.us
  br label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge, %.lr.ph.us.us.new.preheader
  %77 = phi double [ %89, %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge ], [ %.pre, %.lr.ph.us.us.new.preheader ]
  %indvars.iv58 = phi i64 [ %indvars.iv.next59.1, %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge ], [ %indvars.iv58.unr.ph, %.lr.ph.us.us.new.preheader ]
  %78 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv70, i64 %indvars.iv68, i64 %indvars.iv58
  %79 = load double, double* %78, align 8
  %80 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv58, i64 %indvars.iv60
  %81 = load double, double* %80, align 8
  %82 = fmul double %79, %81
  %83 = fadd double %82, %77
  store double %83, double* %sunkaddr78, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %84 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv70, i64 %indvars.iv68, i64 %indvars.iv.next59
  %85 = load double, double* %84, align 8
  %86 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next59, i64 %indvars.iv60
  %87 = load double, double* %86, align 8
  %88 = fmul double %85, %87
  %89 = fadd double %88, %83
  store double %89, double* %sunkaddr78, align 8
  %indvars.iv.next59.1 = add nsw i64 %indvars.iv58, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next59.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge

.lr.ph.us.us.new..lr.ph.us.us.new_crit_edge:      ; preds = %.lr.ph.us.us.new
  br label %.lr.ph.us.us.new

.preheader5:                                      ; preds = %.preheader5..preheader5_crit_edge, %.preheader5.preheader.new
  %indvars.iv54 = phi i64 [ %indvars.iv54.unr, %.preheader5.preheader.new ], [ %indvars.iv.next55.7, %.preheader5..preheader5_crit_edge ]
  %indvars.iv.next55.7 = add nsw i64 %indvars.iv54, 8
  %90 = icmp slt i64 %indvars.iv.next55.7, %9
  br i1 %90, label %.preheader5..preheader5_crit_edge, label %._crit_edge18.loopexit122.unr-lcssa

.preheader5..preheader5_crit_edge:                ; preds = %.preheader5
  br label %.preheader5

._crit_edge18.loopexit:                           ; preds = %._crit_edge16.us
  br label %._crit_edge18

._crit_edge18.loopexit122.unr-lcssa:              ; preds = %.preheader5
  br label %._crit_edge18.loopexit122

._crit_edge18.loopexit122:                        ; preds = %.preheader5.prol.loopexit.._crit_edge18.loopexit122_crit_edge, %._crit_edge18.loopexit122.unr-lcssa
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %.preheader6.._crit_edge18_crit_edge, %._crit_edge18.loopexit122, %._crit_edge18.loopexit
  %.lcssa13.lcssa24.lcssa44 = phi i32 [ %.lcssa13.lcssa24.lcssa45, %.preheader6.._crit_edge18_crit_edge ], [ %2, %._crit_edge18.loopexit ], [ %.lcssa13.lcssa24.lcssa45, %._crit_edge18.loopexit122 ]
  %indvars.iv.next71 = add nsw i64 %indvars.iv70, 1
  %91 = icmp slt i64 %indvars.iv.next71, %10
  br i1 %91, label %._crit_edge18..preheader6_crit_edge, label %._crit_edge35.loopexit

._crit_edge18..preheader6_crit_edge:              ; preds = %._crit_edge18
  br label %.preheader6

._crit_edge35.loopexit:                           ; preds = %._crit_edge18
  br label %._crit_edge35

._crit_edge35:                                    ; preds = %.._crit_edge35_crit_edge, %._crit_edge35.loopexit
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #3
  %6 = bitcast i8* %3 to [140 x [160 x double]]*
  %7 = bitcast i8* %5 to [160 x double]*
  tail call void @init_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7)
  tail call void (...) @polybench_timer_start() #3
  %8 = bitcast i8* %5 to [160 x double]*
  %9 = bitcast i8* %4 to double*
  tail call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %8, double* %9)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %10 = icmp sgt i32 %0, 42
  br i1 %10, label %11, label %._crit_edge

._crit_edge:                                      ; preds = %2
  br label %15

; <label>:11:                                     ; preds = %2
  %12 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %12, align 1
  %13 = icmp eq i8 %strcmpload, 0
  br i1 %13, label %14, label %._crit_edge1

._crit_edge1:                                     ; preds = %11
  br label %15

; <label>:14:                                     ; preds = %11
  tail call void @print_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6)
  br label %15

; <label>:15:                                     ; preds = %._crit_edge1, %._crit_edge, %14
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, i32, i32, [140 x [160 x double]]*, [160 x double]*) #0 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader7.lr.ph, label %..preheader5_crit_edge

..preheader5_crit_edge:                           ; preds = %5
  br label %.preheader5

.preheader7.lr.ph:                                ; preds = %5
  %wide.trip.count57 = zext i32 %1 to i64
  %7 = icmp sgt i32 %1, 0
  %wide.trip.count53 = zext i32 %2 to i64
  %8 = sext i32 %0 to i64
  br i1 %7, label %.preheader7.us.preheader, label %.preheader7.lr.ph..preheader5_crit_edge

.preheader7.lr.ph..preheader5_crit_edge:          ; preds = %.preheader7.lr.ph
  br label %.preheader5

.preheader7.us.preheader:                         ; preds = %.preheader7.lr.ph
  %9 = icmp sgt i32 %2, 0
  %10 = sitofp i32 %2 to double
  %xtraiter66 = and i64 %wide.trip.count53, 1
  %lcmp.mod67 = icmp eq i64 %xtraiter66, 0
  %11 = icmp eq i32 %2, 1
  %12 = insertelement <2 x double> undef, double %10, i32 0
  %13 = insertelement <2 x double> %12, double %10, i32 1
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge19.us..preheader7.us_crit_edge, %.preheader7.us.preheader
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %._crit_edge19.us..preheader7.us_crit_edge ], [ 0, %.preheader7.us.preheader ]
  br i1 %9, label %.preheader6.us.us.preheader, label %.preheader7.us.._crit_edge19.us_crit_edge

.preheader7.us.._crit_edge19.us_crit_edge:        ; preds = %.preheader7.us
  br label %._crit_edge19.us

.preheader6.us.us.preheader:                      ; preds = %.preheader7.us
  br label %.preheader6.us.us

._crit_edge19.us.loopexit:                        ; preds = %._crit_edge16.us.us
  br label %._crit_edge19.us

._crit_edge19.us:                                 ; preds = %.preheader7.us.._crit_edge19.us_crit_edge, %._crit_edge19.us.loopexit
  %indvars.iv.next60 = add nsw i64 %indvars.iv59, 1
  %14 = icmp slt i64 %indvars.iv.next60, %8
  br i1 %14, label %._crit_edge19.us..preheader7.us_crit_edge, label %.preheader5.loopexit

._crit_edge19.us..preheader7.us_crit_edge:        ; preds = %._crit_edge19.us
  br label %.preheader7.us

.preheader6.us.us:                                ; preds = %._crit_edge16.us.us..preheader6.us.us_crit_edge, %.preheader6.us.us.preheader
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %._crit_edge16.us.us..preheader6.us.us_crit_edge ], [ 0, %.preheader6.us.us.preheader ]
  %15 = mul nsw i64 %indvars.iv55, %indvars.iv59
  br i1 %lcmp.mod67, label %.preheader6.us.us..prol.loopexit65.unr-lcssa_crit_edge, label %.prol.preheader64

.preheader6.us.us..prol.loopexit65.unr-lcssa_crit_edge: ; preds = %.preheader6.us.us
  br label %.prol.loopexit65.unr-lcssa

.prol.preheader64:                                ; preds = %.preheader6.us.us
  br label %16

; <label>:16:                                     ; preds = %.prol.preheader64
  %17 = trunc i64 %15 to i32
  %18 = srem i32 %17, %2
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, %10
  %21 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv59, i64 %indvars.iv55, i64 0
  store double %20, double* %21, align 8
  br label %.prol.loopexit65.unr-lcssa

.prol.loopexit65.unr-lcssa:                       ; preds = %.preheader6.us.us..prol.loopexit65.unr-lcssa_crit_edge, %16
  %indvars.iv51.unr.ph = phi i64 [ 1, %16 ], [ 0, %.preheader6.us.us..prol.loopexit65.unr-lcssa_crit_edge ]
  br label %.prol.loopexit65

.prol.loopexit65:                                 ; preds = %.prol.loopexit65.unr-lcssa
  br i1 %11, label %.prol.loopexit65.._crit_edge16.us.us_crit_edge, label %.preheader6.us.us.new

.prol.loopexit65.._crit_edge16.us.us_crit_edge:   ; preds = %.prol.loopexit65
  br label %._crit_edge16.us.us

.preheader6.us.us.new:                            ; preds = %.prol.loopexit65
  br label %22

._crit_edge16.us.us.unr-lcssa:                    ; preds = %22
  br label %._crit_edge16.us.us

._crit_edge16.us.us:                              ; preds = %.prol.loopexit65.._crit_edge16.us.us_crit_edge, %._crit_edge16.us.us.unr-lcssa
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next56, %wide.trip.count57
  br i1 %exitcond58, label %._crit_edge19.us.loopexit, label %._crit_edge16.us.us..preheader6.us.us_crit_edge

._crit_edge16.us.us..preheader6.us.us_crit_edge:  ; preds = %._crit_edge16.us.us
  br label %.preheader6.us.us

; <label>:22:                                     ; preds = %._crit_edge, %.preheader6.us.us.new
  %indvars.iv51 = phi i64 [ %indvars.iv51.unr.ph, %.preheader6.us.us.new ], [ %indvars.iv.next52.1, %._crit_edge ]
  %23 = add nsw i64 %15, %indvars.iv51
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, %2
  %26 = sitofp i32 %25 to double
  %27 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv59, i64 %indvars.iv55, i64 %indvars.iv51
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %28 = add nsw i64 %15, %indvars.iv.next52
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, %2
  %31 = sitofp i32 %30 to double
  %32 = insertelement <2 x double> undef, double %26, i32 0
  %33 = insertelement <2 x double> %32, double %31, i32 1
  %34 = fdiv <2 x double> %33, %13
  %35 = bitcast double* %27 to <2 x double>*
  store <2 x double> %34, <2 x double>* %35, align 8
  %indvars.iv.next52.1 = add nsw i64 %indvars.iv51, 2
  %exitcond54.1 = icmp eq i64 %indvars.iv.next52.1, %wide.trip.count53
  br i1 %exitcond54.1, label %._crit_edge16.us.us.unr-lcssa, label %._crit_edge

._crit_edge:                                      ; preds = %22
  br label %22

.preheader5.loopexit:                             ; preds = %._crit_edge19.us
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader7.lr.ph..preheader5_crit_edge, %..preheader5_crit_edge, %.preheader5.loopexit
  %36 = icmp sgt i32 %2, 0
  br i1 %36, label %.preheader.lr.ph, label %.preheader5.._crit_edge10_crit_edge

.preheader5.._crit_edge10_crit_edge:              ; preds = %.preheader5
  br label %._crit_edge10

.preheader.lr.ph:                                 ; preds = %.preheader5
  %wide.trip.count = zext i32 %2 to i64
  %37 = sext i32 %2 to i64
  %38 = sitofp i32 %2 to double
  %xtraiter = and i64 %wide.trip.count, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %39 = fdiv double 0.000000e+00, %38
  %40 = icmp eq i32 %2, 1
  %41 = insertelement <2 x double> undef, double %38, i32 0
  %42 = insertelement <2 x double> %41, double %38, i32 1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.lr.ph
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %.preheader.lr.ph ]
  br i1 %lcmp.mod, label %.preheader.us..prol.loopexit.unr-lcssa_crit_edge, label %.prol.preheader

.preheader.us..prol.loopexit.unr-lcssa_crit_edge: ; preds = %.preheader.us
  br label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.preheader.us
  br label %43

; <label>:43:                                     ; preds = %.prol.preheader
  %44 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv48, i64 0
  store double %39, double* %44, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.preheader.us..prol.loopexit.unr-lcssa_crit_edge, %43
  %indvars.iv.unr.ph = phi i64 [ 1, %43 ], [ 0, %.preheader.us..prol.loopexit.unr-lcssa_crit_edge ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %40, label %.prol.loopexit.._crit_edge.us_crit_edge, label %.preheader.us.new

.prol.loopexit.._crit_edge.us_crit_edge:          ; preds = %.prol.loopexit
  br label %._crit_edge.us

.preheader.us.new:                                ; preds = %.prol.loopexit
  br label %45

; <label>:45:                                     ; preds = %._crit_edge68, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.preheader.us.new ], [ %indvars.iv.next.1, %._crit_edge68 ]
  %46 = mul nsw i64 %indvars.iv48, %indvars.iv
  %47 = trunc i64 %46 to i32
  %48 = srem i32 %47, %2
  %49 = sitofp i32 %48 to double
  %50 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv48, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %51 = mul nsw i64 %indvars.iv48, %indvars.iv.next
  %52 = trunc i64 %51 to i32
  %53 = srem i32 %52, %2
  %54 = sitofp i32 %53 to double
  %55 = insertelement <2 x double> undef, double %49, i32 0
  %56 = insertelement <2 x double> %55, double %54, i32 1
  %57 = fdiv <2 x double> %56, %42
  %58 = bitcast double* %50 to <2 x double>*
  store <2 x double> %57, <2 x double>* %58, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %._crit_edge.us.unr-lcssa, label %._crit_edge68

._crit_edge68:                                    ; preds = %45
  br label %45

._crit_edge.us.unr-lcssa:                         ; preds = %45
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.prol.loopexit.._crit_edge.us_crit_edge, %._crit_edge.us.unr-lcssa
  %indvars.iv.next49 = add nsw i64 %indvars.iv48, 1
  %59 = icmp slt i64 %indvars.iv.next49, %37
  br i1 %59, label %._crit_edge.us..preheader.us_crit_edge, label %._crit_edge10.loopexit

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge10.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %.preheader5.._crit_edge10_crit_edge, %._crit_edge10.loopexit
  ret void
}

declare void @polybench_timer_start(...) #1

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, i32, [140 x [160 x double]]*) #0 {
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #4
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.preheader3.lr.ph, label %.._crit_edge10_crit_edge

.._crit_edge10_crit_edge:                         ; preds = %4
  br label %._crit_edge10

.preheader3.lr.ph:                                ; preds = %4
  %10 = sext i32 %1 to i64
  %11 = icmp sgt i32 %1, 0
  %wide.trip.count = zext i32 %2 to i64
  %12 = sext i32 %0 to i64
  br i1 %11, label %.preheader3.us.preheader, label %.preheader3.lr.ph.._crit_edge10_crit_edge

.preheader3.lr.ph.._crit_edge10_crit_edge:        ; preds = %.preheader3.lr.ph
  br label %._crit_edge10

.preheader3.us.preheader:                         ; preds = %.preheader3.lr.ph
  %13 = icmp sgt i32 %2, 0
  %wide.trip.count34 = zext i32 %1 to i64
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %._crit_edge5.us..preheader3.us_crit_edge, %.preheader3.us.preheader
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %._crit_edge5.us..preheader3.us_crit_edge ], [ 0, %.preheader3.us.preheader ]
  br i1 %13, label %.preheader.us.us.preheader, label %.preheader3.us.._crit_edge5.us_crit_edge

.preheader3.us.._crit_edge5.us_crit_edge:         ; preds = %.preheader3.us
  br label %._crit_edge5.us

.preheader.us.us.preheader:                       ; preds = %.preheader3.us
  %14 = mul nsw i64 %10, %indvars.iv36
  %15 = trunc i64 %14 to i32
  br label %.preheader.us.us

._crit_edge5.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %.preheader3.us.._crit_edge5.us_crit_edge, %._crit_edge5.us.loopexit
  %indvars.iv.next37 = add nsw i64 %indvars.iv36, 1
  %16 = icmp slt i64 %indvars.iv.next37, %12
  br i1 %16, label %._crit_edge5.us..preheader3.us_crit_edge, label %._crit_edge10.loopexit

._crit_edge5.us..preheader3.us_crit_edge:         ; preds = %._crit_edge5.us
  br label %.preheader3.us

.preheader.us.us:                                 ; preds = %._crit_edge.us.us..preheader.us.us_crit_edge, %.preheader.us.us.preheader
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %._crit_edge.us.us..preheader.us.us_crit_edge ], [ 0, %.preheader.us.us.preheader ]
  %17 = trunc i64 %indvars.iv32 to i32
  %18 = add i32 %15, %17
  %19 = mul i32 %18, %2
  %20 = zext i32 %19 to i64
  br label %21

._crit_edge.us.us:                                ; preds = %28
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next33, %wide.trip.count34
  br i1 %exitcond35, label %._crit_edge5.us.loopexit, label %._crit_edge.us.us..preheader.us.us_crit_edge

._crit_edge.us.us..preheader.us.us_crit_edge:     ; preds = %._crit_edge.us.us
  br label %.preheader.us.us

; <label>:21:                                     ; preds = %._crit_edge39, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge39 ], [ 0, %.preheader.us.us ]
  %22 = add i64 %20, %indvars.iv
  %23 = trunc i64 %22 to i32
  %24 = srem i32 %23, 20
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %26, label %._crit_edge

._crit_edge:                                      ; preds = %21
  br label %28

; <label>:26:                                     ; preds = %21
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %27) #4
  br label %28

; <label>:28:                                     ; preds = %._crit_edge, %26
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv36, i64 %indvars.iv32, i64 %indvars.iv
  %31 = load double, double* %30, align 8
  %32 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %31) #4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.us, label %._crit_edge39

._crit_edge39:                                    ; preds = %28
  br label %21

._crit_edge10.loopexit:                           ; preds = %._crit_edge5.us
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %.preheader3.lr.ph.._crit_edge10_crit_edge, %.._crit_edge10_crit_edge, %._crit_edge10.loopexit
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #4
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %35) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }

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
