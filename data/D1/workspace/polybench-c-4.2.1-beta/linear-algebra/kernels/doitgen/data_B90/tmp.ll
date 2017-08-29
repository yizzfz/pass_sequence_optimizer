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
  %11 = zext i32 %2 to i64
  %xtraiter = and i32 %2, 1
  %scevgep71 = getelementptr double, double* %5, i64 %8
  %12 = add nsw i64 %9, -1
  %13 = add nsw i64 %8, -4
  %14 = lshr i64 %13, 2
  %15 = add nuw nsw i64 %14, 1
  %16 = icmp sgt i32 %1, 0
  %17 = icmp sgt i32 %2, 0
  %18 = icmp eq i32 %xtraiter, 0
  %19 = icmp eq i32 %2, 1
  %sunkaddr110 = ptrtoint double* %5 to i64
  %sunkaddr = ptrtoint double* %5 to i64
  %min.iters.check = icmp ult i32 %2, 4
  %n.vec = and i64 %8, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %xtraiter120 = and i64 %15, 3
  %lcmp.mod121 = icmp eq i64 %xtraiter120, 0
  %20 = icmp ult i64 %13, 12
  %cmp.n = icmp eq i64 %8, %n.vec
  %xtraiter119 = and i64 %9, 7
  %lcmp.mod = icmp eq i64 %xtraiter119, 0
  %21 = icmp ult i64 %12, 7
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge15, %.preheader6.lr.ph
  %indvars.iv62 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next63, %._crit_edge15 ]
  br i1 %16, label %.preheader5.lr.ph, label %._crit_edge15

.preheader5.lr.ph:                                ; preds = %.preheader6
  br i1 %17, label %.preheader5.us.preheader, label %.preheader5.preheader

.preheader5.preheader:                            ; preds = %.preheader5.lr.ph
  br i1 %lcmp.mod, label %.preheader5.prol.loopexit, label %.preheader5.prol.preheader

.preheader5.prol.preheader:                       ; preds = %.preheader5.preheader
  br label %.preheader5.prol

.preheader5.prol:                                 ; preds = %.preheader5.prol, %.preheader5.prol.preheader
  %indvars.iv46.prol = phi i64 [ %indvars.iv.next47.prol, %.preheader5.prol ], [ 0, %.preheader5.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader5.prol ], [ %xtraiter119, %.preheader5.prol.preheader ]
  %indvars.iv.next47.prol = add nuw nsw i64 %indvars.iv46.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader5.prol.loopexit.unr-lcssa, label %.preheader5.prol, !llvm.loop !1

.preheader5.prol.loopexit.unr-lcssa:              ; preds = %.preheader5.prol
  br label %.preheader5.prol.loopexit

.preheader5.prol.loopexit:                        ; preds = %.preheader5.preheader, %.preheader5.prol.loopexit.unr-lcssa
  %indvars.iv46.unr = phi i64 [ 0, %.preheader5.preheader ], [ %indvars.iv.next47.prol, %.preheader5.prol.loopexit.unr-lcssa ]
  br i1 %21, label %._crit_edge15.loopexit115, label %.preheader5.preheader.new

.preheader5.preheader.new:                        ; preds = %.preheader5.prol.loopexit
  br label %.preheader5

.preheader5.us.preheader:                         ; preds = %.preheader5.lr.ph
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %._crit_edge12.us, %.preheader5.us.preheader
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %._crit_edge12.us ], [ 0, %.preheader5.us.preheader ]
  %scevgep = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 0
  %22 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 0
  br label %.lr.ph.us.us

._crit_edge12.us.loopexit:                        ; preds = %.lr.ph11.us
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %._crit_edge12.us.loopexit, %middle.block
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond117 = icmp eq i64 %indvars.iv.next61, %9
  br i1 %exitcond117, label %._crit_edge15.loopexit, label %.preheader5.us

.lr.ph11.us:                                      ; preds = %.lr.ph11.us.preheader114, %.lr.ph11.us
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %.lr.ph11.us ], [ %indvars.iv58.ph, %.lr.ph11.us.preheader114 ]
  %23 = getelementptr inbounds double, double* %5, i64 %indvars.iv58
  %24 = bitcast double* %23 to i64*
  %25 = load i64, i64* %24, align 8
  %26 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 %indvars.iv58
  %27 = bitcast double* %26 to i64*
  store i64 %25, i64* %27, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %28 = icmp slt i64 %indvars.iv.next59, %8
  br i1 %28, label %.lr.ph11.us, label %._crit_edge12.us.loopexit, !llvm.loop !3

.lr.ph11.us.preheader:                            ; preds = %._crit_edge.us.us
  %scevgep69 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 %8
  br i1 %min.iters.check, label %.lr.ph11.us.preheader114, label %min.iters.checked

.lr.ph11.us.preheader114:                         ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph11.us.preheader
  %indvars.iv58.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph11.us.preheader ], [ %n.vec, %middle.block ]
  br label %.lr.ph11.us

min.iters.checked:                                ; preds = %.lr.ph11.us.preheader
  br i1 %cmp.zero, label %.lr.ph11.us.preheader114, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep71
  %bound1 = icmp ugt double* %scevgep69, %5
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.lr.ph11.us.preheader114, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br i1 %lcmp.mod121, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter122 = phi i64 [ %prol.iter122.sub, %vector.body.prol ], [ %xtraiter120, %vector.body.prol.preheader ]
  %29 = getelementptr inbounds double, double* %5, i64 %index.prol
  %30 = bitcast double* %29 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %30, align 8, !alias.scope !6
  %31 = getelementptr double, double* %29, i64 2
  %32 = bitcast double* %31 to <2 x i64>*
  %wide.load74.prol = load <2 x i64>, <2 x i64>* %32, align 8, !alias.scope !6
  %33 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 %index.prol
  %34 = bitcast double* %33 to <2 x i64>*
  store <2 x i64> %wide.load.prol, <2 x i64>* %34, align 8, !alias.scope !9, !noalias !6
  %35 = getelementptr double, double* %33, i64 2
  %36 = bitcast double* %35 to <2 x i64>*
  store <2 x i64> %wide.load74.prol, <2 x i64>* %36, align 8, !alias.scope !9, !noalias !6
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter122.sub = add i64 %prol.iter122, -1
  %prol.iter122.cmp = icmp eq i64 %prol.iter122.sub, 0
  br i1 %prol.iter122.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !11

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  br i1 %20, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %37 = getelementptr inbounds double, double* %5, i64 %index
  %38 = bitcast double* %37 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %38, align 8, !alias.scope !6
  %39 = getelementptr double, double* %37, i64 2
  %40 = bitcast double* %39 to <2 x i64>*
  %wide.load74 = load <2 x i64>, <2 x i64>* %40, align 8, !alias.scope !6
  %41 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 %index
  %42 = bitcast double* %41 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %42, align 8, !alias.scope !9, !noalias !6
  %43 = getelementptr double, double* %41, i64 2
  %44 = bitcast double* %43 to <2 x i64>*
  store <2 x i64> %wide.load74, <2 x i64>* %44, align 8, !alias.scope !9, !noalias !6
  %index.next = add i64 %index, 4
  %45 = getelementptr inbounds double, double* %5, i64 %index.next
  %46 = bitcast double* %45 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %46, align 8, !alias.scope !6
  %47 = getelementptr double, double* %45, i64 2
  %48 = bitcast double* %47 to <2 x i64>*
  %wide.load74.1 = load <2 x i64>, <2 x i64>* %48, align 8, !alias.scope !6
  %49 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 %index.next
  %50 = bitcast double* %49 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %50, align 8, !alias.scope !9, !noalias !6
  %51 = getelementptr double, double* %49, i64 2
  %52 = bitcast double* %51 to <2 x i64>*
  store <2 x i64> %wide.load74.1, <2 x i64>* %52, align 8, !alias.scope !9, !noalias !6
  %index.next.1 = add i64 %index, 8
  %53 = getelementptr inbounds double, double* %5, i64 %index.next.1
  %54 = bitcast double* %53 to <2 x i64>*
  %wide.load.2 = load <2 x i64>, <2 x i64>* %54, align 8, !alias.scope !6
  %55 = getelementptr double, double* %53, i64 2
  %56 = bitcast double* %55 to <2 x i64>*
  %wide.load74.2 = load <2 x i64>, <2 x i64>* %56, align 8, !alias.scope !6
  %57 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 %index.next.1
  %58 = bitcast double* %57 to <2 x i64>*
  store <2 x i64> %wide.load.2, <2 x i64>* %58, align 8, !alias.scope !9, !noalias !6
  %59 = getelementptr double, double* %57, i64 2
  %60 = bitcast double* %59 to <2 x i64>*
  store <2 x i64> %wide.load74.2, <2 x i64>* %60, align 8, !alias.scope !9, !noalias !6
  %index.next.2 = add i64 %index, 12
  %61 = getelementptr inbounds double, double* %5, i64 %index.next.2
  %62 = bitcast double* %61 to <2 x i64>*
  %wide.load.3 = load <2 x i64>, <2 x i64>* %62, align 8, !alias.scope !6
  %63 = getelementptr double, double* %61, i64 2
  %64 = bitcast double* %63 to <2 x i64>*
  %wide.load74.3 = load <2 x i64>, <2 x i64>* %64, align 8, !alias.scope !6
  %65 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 %index.next.2
  %66 = bitcast double* %65 to <2 x i64>*
  store <2 x i64> %wide.load.3, <2 x i64>* %66, align 8, !alias.scope !9, !noalias !6
  %67 = getelementptr double, double* %65, i64 2
  %68 = bitcast double* %67 to <2 x i64>*
  store <2 x i64> %wide.load74.3, <2 x i64>* %68, align 8, !alias.scope !9, !noalias !6
  %index.next.3 = add i64 %index, 16
  %69 = icmp eq i64 %index.next.3, %n.vec
  br i1 %69, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !12

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  br i1 %cmp.n, label %._crit_edge12.us, label %.lr.ph11.us.preheader114

.lr.ph.us.us:                                     ; preds = %.preheader5.us, %._crit_edge.us.us
  %indvars.iv54 = phi i64 [ %indvars.iv.next55, %._crit_edge.us.us ], [ 0, %.preheader5.us ]
  %70 = getelementptr inbounds double, double* %5, i64 %indvars.iv54
  store double 0.000000e+00, double* %70, align 8
  br i1 %18, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %71 = load double, double* %22, align 8
  %72 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv54
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = fadd double %74, 0.000000e+00
  %sunkaddr107 = shl i64 %indvars.iv54, 3
  %sunkaddr108 = add i64 %sunkaddr, %sunkaddr107
  %sunkaddr109 = inttoptr i64 %sunkaddr108 to double*
  store double %75, double* %sunkaddr109, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %76 = phi double [ %75, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv50.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %19, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  %sunkaddr111 = shl i64 %indvars.iv54, 3
  %sunkaddr112 = add i64 %sunkaddr110, %sunkaddr111
  %sunkaddr113 = inttoptr i64 %sunkaddr112 to double*
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond = icmp eq i64 %indvars.iv.next55, %11
  br i1 %exitcond, label %.lr.ph11.us.preheader, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %77 = phi double [ %89, %.lr.ph.us.us.new ], [ %76, %.lr.ph.us.us.new.preheader ]
  %indvars.iv50 = phi i64 [ %indvars.iv.next51.1, %.lr.ph.us.us.new ], [ %indvars.iv50.unr.ph, %.lr.ph.us.us.new.preheader ]
  %78 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 %indvars.iv50
  %79 = load double, double* %78, align 8
  %80 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv50, i64 %indvars.iv54
  %81 = load double, double* %80, align 8
  %82 = fmul double %79, %81
  %83 = fadd double %82, %77
  store double %83, double* %sunkaddr113, align 8
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %84 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 %indvars.iv.next51
  %85 = load double, double* %84, align 8
  %86 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next51, i64 %indvars.iv54
  %87 = load double, double* %86, align 8
  %88 = fmul double %85, %87
  %89 = fadd double %88, %83
  store double %89, double* %sunkaddr113, align 8
  %indvars.iv.next51.1 = add nuw nsw i64 %indvars.iv50, 2
  %exitcond53.1 = icmp eq i64 %indvars.iv.next51.1, %11
  br i1 %exitcond53.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.preheader5:                                      ; preds = %.preheader5, %.preheader5.preheader.new
  %indvars.iv46 = phi i64 [ %indvars.iv46.unr, %.preheader5.preheader.new ], [ %indvars.iv.next47.7, %.preheader5 ]
  %indvars.iv.next47.7 = add nsw i64 %indvars.iv46, 8
  %exitcond116.7 = icmp eq i64 %indvars.iv.next47.7, %9
  br i1 %exitcond116.7, label %._crit_edge15.loopexit115.unr-lcssa, label %.preheader5

._crit_edge15.loopexit:                           ; preds = %._crit_edge12.us
  br label %._crit_edge15

._crit_edge15.loopexit115.unr-lcssa:              ; preds = %.preheader5
  br label %._crit_edge15.loopexit115

._crit_edge15.loopexit115:                        ; preds = %.preheader5.prol.loopexit, %._crit_edge15.loopexit115.unr-lcssa
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit115, %._crit_edge15.loopexit, %.preheader6
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond118 = icmp eq i64 %indvars.iv.next63, %10
  br i1 %exitcond118, label %._crit_edge31.loopexit, label %.preheader6

._crit_edge31.loopexit:                           ; preds = %._crit_edge15
  br label %._crit_edge31

._crit_edge31:                                    ; preds = %._crit_edge31.loopexit, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #1 {
  %3 = call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %6 = bitcast i8* %3 to [140 x [160 x double]]*
  %7 = bitcast i8* %5 to [160 x double]*
  call fastcc void @init_array([140 x [160 x double]]* %6, [160 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %5 to [160 x double]*
  %9 = bitcast i8* %4 to double*
  call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %8, double* %9)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %10 = icmp sgt i32 %0, 42
  br i1 %10, label %11, label %16

; <label>:11:                                     ; preds = %2
  %12 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %12, align 1
  %13 = icmp eq i8 %strcmpload, 0
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %11
  %15 = bitcast i8* %3 to [140 x [160 x double]]*
  call fastcc void @print_array([140 x [160 x double]]* %15)
  br label %16

; <label>:16:                                     ; preds = %11, %14, %2
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([140 x [160 x double]]*, [160 x double]*) unnamed_addr #0 {
.preheader7.lr.ph:
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge17.us, %.preheader7.lr.ph
  %indvars.iv56 = phi i64 [ 0, %.preheader7.lr.ph ], [ %indvars.iv.next57, %._crit_edge17.us ]
  br label %.preheader6.us.us

._crit_edge17.us:                                 ; preds = %._crit_edge14.us.us
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next57, 150
  br i1 %exitcond2, label %.preheader.us.preheader, label %.preheader7.us

.preheader.us.preheader:                          ; preds = %._crit_edge17.us
  br label %.preheader.us

.preheader6.us.us:                                ; preds = %.preheader7.us, %._crit_edge14.us.us
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %._crit_edge14.us.us ], [ 0, %.preheader7.us ]
  %2 = mul nuw nsw i64 %indvars.iv52, %indvars.iv56
  br label %.preheader6.us.us.new

._crit_edge14.us.us:                              ; preds = %.preheader6.us.us.new
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond = icmp eq i64 %indvars.iv.next53, 140
  br i1 %exitcond, label %._crit_edge17.us, label %.preheader6.us.us

.preheader6.us.us.new:                            ; preds = %.preheader6.us.us, %.preheader6.us.us.new
  %indvars.iv48 = phi i64 [ %indvars.iv.next49.1, %.preheader6.us.us.new ], [ 0, %.preheader6.us.us ]
  %3 = add nuw nsw i64 %2, %indvars.iv48
  %4 = trunc i64 %3 to i32
  %5 = srem i32 %4, 160
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %0, i64 %indvars.iv56, i64 %indvars.iv52, i64 %indvars.iv48
  %indvars.iv.next49 = or i64 %indvars.iv48, 1
  %8 = add nuw nsw i64 %2, %indvars.iv.next49
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 160
  %11 = sitofp i32 %10 to double
  %12 = insertelement <2 x double> undef, double %6, i32 0
  %13 = insertelement <2 x double> %12, double %11, i32 1
  %14 = fdiv <2 x double> %13, <double 1.600000e+02, double 1.600000e+02>
  %15 = bitcast double* %7 to <2 x double>*
  store <2 x double> %14, <2 x double>* %15, align 8
  %indvars.iv.next49.1 = add nuw nsw i64 %indvars.iv48, 2
  %exitcond51.1 = icmp eq i64 %indvars.iv.next49.1, 160
  br i1 %exitcond51.1, label %._crit_edge14.us.us, label %.preheader6.us.us.new

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new ], [ 0, %.preheader.us ]
  %16 = mul nuw nsw i64 %indvars.iv, %indvars.iv45
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 160
  %19 = sitofp i32 %18 to double
  %20 = getelementptr inbounds [160 x double], [160 x double]* %1, i64 %indvars.iv45, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %21 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv45
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 160
  %24 = sitofp i32 %23 to double
  %25 = insertelement <2 x double> undef, double %19, i32 0
  %26 = insertelement <2 x double> %25, double %24, i32 1
  %27 = fdiv <2 x double> %26, <double 1.600000e+02, double 1.600000e+02>
  %28 = bitcast double* %20 to <2 x double>*
  store <2 x double> %27, <2 x double>* %28, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %._crit_edge.us, label %.preheader.us.new

._crit_edge.us:                                   ; preds = %.preheader.us.new
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next46, 160
  br i1 %exitcond1, label %._crit_edge9, label %.preheader.us

._crit_edge9:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([140 x [160 x double]]*) unnamed_addr #1 {
.preheader3.lr.ph:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %._crit_edge4.us, %.preheader3.lr.ph
  %indvars.iv35 = phi i64 [ 0, %.preheader3.lr.ph ], [ %indvars.iv.next36, %._crit_edge4.us ]
  %5 = mul nuw nsw i64 %indvars.iv35, 140
  br label %.preheader.us.us

._crit_edge4.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next36, 150
  br i1 %exitcond1, label %._crit_edge9, label %.preheader3.us

.preheader.us.us:                                 ; preds = %.preheader3.us, %._crit_edge.us.us
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %._crit_edge.us.us ], [ 0, %.preheader3.us ]
  %6 = add nuw nsw i64 %indvars.iv31, %5
  %7 = mul nuw nsw i64 %6, 160
  br label %8

._crit_edge.us.us:                                ; preds = %15
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next32, 140
  br i1 %exitcond38, label %._crit_edge4.us, label %.preheader.us.us

; <label>:8:                                      ; preds = %15, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %15 ], [ 0, %.preheader.us.us ]
  %9 = add nuw nsw i64 %7, %indvars.iv
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %15

; <label>:15:                                     ; preds = %13, %8
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %0, i64 %indvars.iv35, i64 %indvars.iv31, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond, label %._crit_edge.us.us, label %8

._crit_edge9:                                     ; preds = %._crit_edge4.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
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
