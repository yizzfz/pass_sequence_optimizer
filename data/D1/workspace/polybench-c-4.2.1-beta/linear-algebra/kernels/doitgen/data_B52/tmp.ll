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
  br i1 %7, label %.preheader6.lr.ph, label %._crit_edge31

.preheader6.lr.ph:                                ; preds = %6
  %8 = sext i32 %2 to i64
  %9 = sext i32 %1 to i64
  %10 = sext i32 %0 to i64
  %xtraiter = and i32 %2, 1
  %wide.trip.count56 = zext i32 %2 to i64
  %scevgep78 = getelementptr double, double* %5, i64 %8
  %11 = add nsw i64 %9, -1
  %12 = add nsw i64 %8, -4
  %13 = lshr i64 %12, 2
  %14 = add nuw nsw i64 %13, 1
  %15 = icmp sgt i32 %1, 0
  %16 = icmp sgt i32 %2, 0
  %17 = icmp eq i32 %xtraiter, 0
  %18 = icmp eq i32 %2, 1
  %sunkaddr70 = ptrtoint double* %5 to i64
  %sunkaddr = ptrtoint double* %5 to i64
  %min.iters.check = icmp ult i32 %2, 4
  %n.vec = and i64 %8, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %xtraiter119 = and i64 %14, 3
  %lcmp.mod120 = icmp eq i64 %xtraiter119, 0
  %19 = icmp ult i64 %12, 12
  %cmp.n = icmp eq i64 %8, %n.vec
  %xtraiter118 = and i64 %9, 7
  %lcmp.mod = icmp eq i64 %xtraiter118, 0
  %20 = icmp ult i64 %11, 7
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge15, %.preheader6.lr.ph
  %indvars.iv62 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next63, %._crit_edge15 ]
  br i1 %15, label %.preheader5.lr.ph, label %._crit_edge15

.preheader5.lr.ph:                                ; preds = %.preheader6
  br i1 %16, label %.lr.ph.us.us.preheader.preheader, label %.preheader5.preheader

.preheader5.preheader:                            ; preds = %.preheader5.lr.ph
  br i1 %lcmp.mod, label %.preheader5.prol.loopexit, label %.preheader5.prol.preheader

.preheader5.prol.preheader:                       ; preds = %.preheader5.preheader
  br label %.preheader5.prol

.preheader5.prol:                                 ; preds = %.preheader5.prol, %.preheader5.prol.preheader
  %indvars.iv46.prol = phi i64 [ %indvars.iv.next47.prol, %.preheader5.prol ], [ 0, %.preheader5.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader5.prol ], [ %xtraiter118, %.preheader5.prol.preheader ]
  %indvars.iv.next47.prol = add nuw nsw i64 %indvars.iv46.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader5.prol.loopexit.unr-lcssa, label %.preheader5.prol, !llvm.loop !1

.preheader5.prol.loopexit.unr-lcssa:              ; preds = %.preheader5.prol
  br label %.preheader5.prol.loopexit

.preheader5.prol.loopexit:                        ; preds = %.preheader5.preheader, %.preheader5.prol.loopexit.unr-lcssa
  %indvars.iv46.unr = phi i64 [ 0, %.preheader5.preheader ], [ %indvars.iv.next47.prol, %.preheader5.prol.loopexit.unr-lcssa ]
  br i1 %20, label %._crit_edge15.loopexit115, label %.preheader5.preheader.new

.preheader5.preheader.new:                        ; preds = %.preheader5.prol.loopexit
  br label %.preheader5

.lr.ph.us.us.preheader.preheader:                 ; preds = %.preheader5.lr.ph
  br label %.lr.ph.us.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %._crit_edge12.us, %.lr.ph.us.us.preheader.preheader
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %._crit_edge12.us ], [ 0, %.lr.ph.us.us.preheader.preheader ]
  %scevgep = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 0
  %21 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 0
  br label %.lr.ph.us.us

._crit_edge12.us.loopexit:                        ; preds = %.lr.ph11.us
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %._crit_edge12.us.loopexit, %middle.block
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond116 = icmp eq i64 %indvars.iv.next61, %9
  br i1 %exitcond116, label %._crit_edge15.loopexit, label %.lr.ph.us.us.preheader

.lr.ph11.us:                                      ; preds = %.lr.ph11.us.preheader, %.lr.ph11.us
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %.lr.ph11.us ], [ %indvars.iv58.ph, %.lr.ph11.us.preheader ]
  %22 = getelementptr inbounds double, double* %5, i64 %indvars.iv58
  %23 = bitcast double* %22 to i64*
  %24 = load i64, i64* %23, align 8
  %25 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 %indvars.iv58
  %26 = bitcast double* %25 to i64*
  store i64 %24, i64* %26, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %27 = icmp slt i64 %indvars.iv.next59, %8
  br i1 %27, label %.lr.ph11.us, label %._crit_edge12.us.loopexit, !llvm.loop !3

..preheader_crit_edge.us..lr.ph11.us_crit_edge:   ; preds = %._crit_edge.us.us
  %scevgep76 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 %8
  br i1 %min.iters.check, label %.lr.ph11.us.preheader, label %min.iters.checked

.lr.ph11.us.preheader:                            ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %..preheader_crit_edge.us..lr.ph11.us_crit_edge
  %indvars.iv58.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %..preheader_crit_edge.us..lr.ph11.us_crit_edge ], [ %n.vec, %middle.block ]
  br label %.lr.ph11.us

min.iters.checked:                                ; preds = %..preheader_crit_edge.us..lr.ph11.us_crit_edge
  br i1 %cmp.zero, label %.lr.ph11.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep78
  %bound1 = icmp ugt double* %scevgep76, %5
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.lr.ph11.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br i1 %lcmp.mod120, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter121 = phi i64 [ %prol.iter121.sub, %vector.body.prol ], [ %xtraiter119, %vector.body.prol.preheader ]
  %28 = getelementptr inbounds double, double* %5, i64 %index.prol
  %29 = bitcast double* %28 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %29, align 8, !alias.scope !6
  %30 = getelementptr double, double* %28, i64 2
  %31 = bitcast double* %30 to <2 x i64>*
  %wide.load81.prol = load <2 x i64>, <2 x i64>* %31, align 8, !alias.scope !6
  %32 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 %index.prol
  %33 = bitcast double* %32 to <2 x i64>*
  store <2 x i64> %wide.load.prol, <2 x i64>* %33, align 8, !alias.scope !9, !noalias !6
  %34 = getelementptr double, double* %32, i64 2
  %35 = bitcast double* %34 to <2 x i64>*
  store <2 x i64> %wide.load81.prol, <2 x i64>* %35, align 8, !alias.scope !9, !noalias !6
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter121.sub = add i64 %prol.iter121, -1
  %prol.iter121.cmp = icmp eq i64 %prol.iter121.sub, 0
  br i1 %prol.iter121.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !11

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  br i1 %19, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %36 = getelementptr inbounds double, double* %5, i64 %index
  %37 = bitcast double* %36 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %37, align 8, !alias.scope !6
  %38 = getelementptr double, double* %36, i64 2
  %39 = bitcast double* %38 to <2 x i64>*
  %wide.load81 = load <2 x i64>, <2 x i64>* %39, align 8, !alias.scope !6
  %40 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 %index
  %41 = bitcast double* %40 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %41, align 8, !alias.scope !9, !noalias !6
  %42 = getelementptr double, double* %40, i64 2
  %43 = bitcast double* %42 to <2 x i64>*
  store <2 x i64> %wide.load81, <2 x i64>* %43, align 8, !alias.scope !9, !noalias !6
  %index.next = add i64 %index, 4
  %44 = getelementptr inbounds double, double* %5, i64 %index.next
  %45 = bitcast double* %44 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %45, align 8, !alias.scope !6
  %46 = getelementptr double, double* %44, i64 2
  %47 = bitcast double* %46 to <2 x i64>*
  %wide.load81.1 = load <2 x i64>, <2 x i64>* %47, align 8, !alias.scope !6
  %48 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 %index.next
  %49 = bitcast double* %48 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %49, align 8, !alias.scope !9, !noalias !6
  %50 = getelementptr double, double* %48, i64 2
  %51 = bitcast double* %50 to <2 x i64>*
  store <2 x i64> %wide.load81.1, <2 x i64>* %51, align 8, !alias.scope !9, !noalias !6
  %index.next.1 = add i64 %index, 8
  %52 = getelementptr inbounds double, double* %5, i64 %index.next.1
  %53 = bitcast double* %52 to <2 x i64>*
  %wide.load.2 = load <2 x i64>, <2 x i64>* %53, align 8, !alias.scope !6
  %54 = getelementptr double, double* %52, i64 2
  %55 = bitcast double* %54 to <2 x i64>*
  %wide.load81.2 = load <2 x i64>, <2 x i64>* %55, align 8, !alias.scope !6
  %56 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 %index.next.1
  %57 = bitcast double* %56 to <2 x i64>*
  store <2 x i64> %wide.load.2, <2 x i64>* %57, align 8, !alias.scope !9, !noalias !6
  %58 = getelementptr double, double* %56, i64 2
  %59 = bitcast double* %58 to <2 x i64>*
  store <2 x i64> %wide.load81.2, <2 x i64>* %59, align 8, !alias.scope !9, !noalias !6
  %index.next.2 = add i64 %index, 12
  %60 = getelementptr inbounds double, double* %5, i64 %index.next.2
  %61 = bitcast double* %60 to <2 x i64>*
  %wide.load.3 = load <2 x i64>, <2 x i64>* %61, align 8, !alias.scope !6
  %62 = getelementptr double, double* %60, i64 2
  %63 = bitcast double* %62 to <2 x i64>*
  %wide.load81.3 = load <2 x i64>, <2 x i64>* %63, align 8, !alias.scope !6
  %64 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 %index.next.2
  %65 = bitcast double* %64 to <2 x i64>*
  store <2 x i64> %wide.load.3, <2 x i64>* %65, align 8, !alias.scope !9, !noalias !6
  %66 = getelementptr double, double* %64, i64 2
  %67 = bitcast double* %66 to <2 x i64>*
  store <2 x i64> %wide.load81.3, <2 x i64>* %67, align 8, !alias.scope !9, !noalias !6
  %index.next.3 = add i64 %index, 16
  %68 = icmp eq i64 %index.next.3, %n.vec
  br i1 %68, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !12

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  br i1 %cmp.n, label %._crit_edge12.us, label %.lr.ph11.us.preheader

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph.us.us.preheader
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %._crit_edge.us.us ], [ 0, %.lr.ph.us.us.preheader ]
  %69 = getelementptr inbounds double, double* %5, i64 %indvars.iv54
  store double 0.000000e+00, double* %69, align 8
  br i1 %17, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %70 = load double, double* %21, align 8
  %71 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv54
  %72 = load double, double* %71, align 8
  %73 = fmul double %70, %72
  %sunkaddr67 = shl i64 %indvars.iv54, 3
  %sunkaddr68 = add i64 %sunkaddr, %sunkaddr67
  %sunkaddr69 = inttoptr i64 %sunkaddr68 to double*
  %74 = load double, double* %sunkaddr69, align 8
  %75 = fadd double %73, %74
  store double %75, double* %sunkaddr69, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us.us, %.prol.preheader
  %indvars.iv50.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %18, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  %sunkaddr71 = shl i64 %indvars.iv54, 3
  %sunkaddr72 = add i64 %sunkaddr70, %sunkaddr71
  %sunkaddr73 = inttoptr i64 %sunkaddr72 to double*
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next55, %wide.trip.count56
  br i1 %exitcond57, label %..preheader_crit_edge.us..lr.ph11.us_crit_edge, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %indvars.iv50 = phi i64 [ %indvars.iv.next51.1, %.lr.ph.us.us.new ], [ %indvars.iv50.unr.ph, %.lr.ph.us.us.new.preheader ]
  %76 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 %indvars.iv50
  %77 = load double, double* %76, align 8
  %78 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv50, i64 %indvars.iv54
  %79 = load double, double* %78, align 8
  %80 = fmul double %77, %79
  %81 = load double, double* %sunkaddr73, align 8
  %82 = fadd double %80, %81
  store double %82, double* %sunkaddr73, align 8
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %83 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 %indvars.iv.next51
  %84 = load double, double* %83, align 8
  %85 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next51, i64 %indvars.iv54
  %86 = load double, double* %85, align 8
  %87 = fmul double %84, %86
  %88 = fadd double %87, %82
  store double %88, double* %sunkaddr73, align 8
  %indvars.iv.next51.1 = add nuw nsw i64 %indvars.iv50, 2
  %exitcond53.1 = icmp eq i64 %indvars.iv.next51.1, %wide.trip.count56
  br i1 %exitcond53.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.preheader5:                                      ; preds = %.preheader5, %.preheader5.preheader.new
  %indvars.iv46 = phi i64 [ %indvars.iv46.unr, %.preheader5.preheader.new ], [ %indvars.iv.next47.7, %.preheader5 ]
  %indvars.iv.next47.7 = add nsw i64 %indvars.iv46, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next47.7, %9
  br i1 %exitcond.7, label %._crit_edge15.loopexit115.unr-lcssa, label %.preheader5

._crit_edge15.loopexit:                           ; preds = %._crit_edge12.us
  br label %._crit_edge15

._crit_edge15.loopexit115.unr-lcssa:              ; preds = %.preheader5
  br label %._crit_edge15.loopexit115

._crit_edge15.loopexit115:                        ; preds = %.preheader5.prol.loopexit, %._crit_edge15.loopexit115.unr-lcssa
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit115, %._crit_edge15.loopexit, %.preheader6
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond117 = icmp eq i64 %indvars.iv.next63, %10
  br i1 %exitcond117, label %._crit_edge31.loopexit, label %.preheader6

._crit_edge31.loopexit:                           ; preds = %._crit_edge15
  br label %._crit_edge31

._crit_edge31:                                    ; preds = %._crit_edge31.loopexit, %6
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

; <label>:16:                                     ; preds = %11, %2, %14
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

.preheader7.us:                                   ; preds = %._crit_edge17.us, %.preheader7.lr.ph
  %indvars.iv56 = phi i64 [ 0, %.preheader7.lr.ph ], [ %indvars.iv.next57, %._crit_edge17.us ]
  br label %.preheader6.us.us

._crit_edge17.us:                                 ; preds = %._crit_edge14.us.us
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next57, 150
  br i1 %exitcond66, label %.preheader.us.preheader, label %.preheader7.us

.preheader.us.preheader:                          ; preds = %._crit_edge17.us
  br label %.preheader.us

.preheader6.us.us:                                ; preds = %._crit_edge14.us.us, %.preheader7.us
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %._crit_edge14.us.us ], [ 0, %.preheader7.us ]
  %5 = mul nuw nsw i64 %indvars.iv52, %indvars.iv56
  br label %.preheader6.us.us.new

._crit_edge14.us.us:                              ; preds = %.preheader6.us.us.new
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, 140
  br i1 %exitcond55, label %._crit_edge17.us, label %.preheader6.us.us

.preheader6.us.us.new:                            ; preds = %.preheader6.us.us.new, %.preheader6.us.us
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

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new, %.preheader.us
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

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, i32, [140 x [160 x double]]*) unnamed_addr #1 {
.preheader3.lr.ph:
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %._crit_edge4.us, %.preheader3.lr.ph
  %indvars.iv35 = phi i64 [ 0, %.preheader3.lr.ph ], [ %indvars.iv.next36, %._crit_edge4.us ]
  %8 = mul nuw nsw i64 %indvars.iv35, 140
  br label %.preheader.us.us

._crit_edge4.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond = icmp eq i64 %indvars.iv.next36, 150
  br i1 %exitcond, label %._crit_edge9, label %.preheader3.us

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader3.us
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
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %18

; <label>:18:                                     ; preds = %11, %16
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv35, i64 %indvars.iv31, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond30, label %._crit_edge.us.us, label %11

._crit_edge9:                                     ; preds = %._crit_edge4.us
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %25) #5
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
