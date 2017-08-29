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
  %8 = sext i32 %2 to i64
  %9 = sext i32 %1 to i64
  %10 = sext i32 %0 to i64
  %xtraiter = and i32 %2, 1
  %wide.trip.count62 = zext i32 %2 to i64
  %scevgep77 = getelementptr double, double* %5, i64 %8
  %11 = add nsw i64 %9, -1
  %12 = add nsw i64 %8, -4
  %13 = lshr i64 %12, 2
  %14 = add nuw nsw i64 %13, 1
  %15 = icmp sgt i32 %1, 0
  %16 = icmp sgt i32 %2, 0
  %17 = icmp eq i32 %xtraiter, 0
  %18 = icmp eq i32 %2, 1
  %sunkaddr126 = ptrtoint double* %5 to i64
  %sunkaddr = ptrtoint double* %5 to i64
  %min.iters.check = icmp ult i32 %2, 4
  %n.vec = and i64 %8, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %xtraiter120 = and i64 %14, 3
  %lcmp.mod121 = icmp eq i64 %xtraiter120, 0
  %19 = icmp ult i64 %12, 12
  %cmp.n = icmp eq i64 %8, %n.vec
  %xtraiter118 = and i64 %9, 7
  %lcmp.mod119 = icmp eq i64 %xtraiter118, 0
  %20 = icmp ult i64 %11, 7
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge18, %.preheader6.lr.ph
  %indvars.iv70 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next71, %._crit_edge18 ]
  br i1 %15, label %.preheader5.lr.ph, label %._crit_edge18

.preheader5.lr.ph:                                ; preds = %.preheader6
  br i1 %16, label %.preheader5.us.preheader, label %.preheader5.preheader

.preheader5.preheader:                            ; preds = %.preheader5.lr.ph
  br i1 %lcmp.mod119, label %.preheader5.prol.loopexit, label %.preheader5.prol.preheader

.preheader5.prol.preheader:                       ; preds = %.preheader5.preheader
  br label %.preheader5.prol

.preheader5.prol:                                 ; preds = %.preheader5.prol, %.preheader5.prol.preheader
  %indvars.iv54.prol = phi i64 [ %indvars.iv.next55.prol, %.preheader5.prol ], [ 0, %.preheader5.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader5.prol ], [ %xtraiter118, %.preheader5.prol.preheader ]
  %indvars.iv.next55.prol = add nuw nsw i64 %indvars.iv54.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader5.prol.loopexit.loopexit, label %.preheader5.prol, !llvm.loop !1

.preheader5.prol.loopexit.loopexit:               ; preds = %.preheader5.prol
  br label %.preheader5.prol.loopexit

.preheader5.prol.loopexit:                        ; preds = %.preheader5.prol.loopexit.loopexit, %.preheader5.preheader
  %indvars.iv54.unr = phi i64 [ 0, %.preheader5.preheader ], [ %indvars.iv.next55.prol, %.preheader5.prol.loopexit.loopexit ]
  br i1 %20, label %._crit_edge18, label %.preheader5.preheader.new

.preheader5.preheader.new:                        ; preds = %.preheader5.prol.loopexit
  br label %.preheader5

.preheader5.us.preheader:                         ; preds = %.preheader5.lr.ph
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %._crit_edge16.us, %.preheader5.us.preheader
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %._crit_edge16.us ], [ 0, %.preheader5.us.preheader ]
  %scevgep = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv70, i64 %indvars.iv68, i64 0
  %21 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv70, i64 %indvars.iv68, i64 0
  br label %.lr.ph.us.us

._crit_edge16.us.loopexit:                        ; preds = %.lr.ph15.us
  br label %._crit_edge16.us

._crit_edge16.us:                                 ; preds = %._crit_edge16.us.loopexit, %middle.block
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond116 = icmp eq i64 %indvars.iv.next69, %9
  br i1 %exitcond116, label %._crit_edge18.loopexit, label %.preheader5.us

.lr.ph15.us:                                      ; preds = %.lr.ph15.us.preheader113, %.lr.ph15.us
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %.lr.ph15.us ], [ %indvars.iv63.ph, %.lr.ph15.us.preheader113 ]
  %22 = getelementptr inbounds double, double* %5, i64 %indvars.iv63
  %23 = bitcast double* %22 to i64*
  %24 = load i64, i64* %23, align 8
  %25 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv70, i64 %indvars.iv68, i64 %indvars.iv63
  %26 = bitcast double* %25 to i64*
  store i64 %24, i64* %26, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %27 = icmp slt i64 %indvars.iv.next64, %8
  br i1 %27, label %.lr.ph15.us, label %._crit_edge16.us.loopexit, !llvm.loop !3

.lr.ph15.us.preheader:                            ; preds = %._crit_edge.us.us
  %scevgep75 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv70, i64 %indvars.iv68, i64 %8
  br i1 %min.iters.check, label %.lr.ph15.us.preheader113, label %min.iters.checked

.lr.ph15.us.preheader113:                         ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph15.us.preheader
  %indvars.iv63.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph15.us.preheader ], [ %n.vec, %middle.block ]
  br label %.lr.ph15.us

min.iters.checked:                                ; preds = %.lr.ph15.us.preheader
  br i1 %cmp.zero, label %.lr.ph15.us.preheader113, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep77
  %bound1 = icmp ugt double* %scevgep75, %5
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.lr.ph15.us.preheader113, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br i1 %lcmp.mod121, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter122 = phi i64 [ %prol.iter122.sub, %vector.body.prol ], [ %xtraiter120, %vector.body.prol.preheader ]
  %28 = getelementptr inbounds double, double* %5, i64 %index.prol
  %29 = bitcast double* %28 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %29, align 8, !alias.scope !6
  %30 = getelementptr double, double* %28, i64 2
  %31 = bitcast double* %30 to <2 x i64>*
  %wide.load80.prol = load <2 x i64>, <2 x i64>* %31, align 8, !alias.scope !6
  %32 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv70, i64 %indvars.iv68, i64 %index.prol
  %33 = bitcast double* %32 to <2 x i64>*
  store <2 x i64> %wide.load.prol, <2 x i64>* %33, align 8, !alias.scope !9, !noalias !6
  %34 = getelementptr double, double* %32, i64 2
  %35 = bitcast double* %34 to <2 x i64>*
  store <2 x i64> %wide.load80.prol, <2 x i64>* %35, align 8, !alias.scope !9, !noalias !6
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter122.sub = add i64 %prol.iter122, -1
  %prol.iter122.cmp = icmp eq i64 %prol.iter122.sub, 0
  br i1 %prol.iter122.cmp, label %vector.body.prol.loopexit.loopexit, label %vector.body.prol, !llvm.loop !11

vector.body.prol.loopexit.loopexit:               ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.loopexit, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.loopexit ]
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
  %wide.load80 = load <2 x i64>, <2 x i64>* %39, align 8, !alias.scope !6
  %40 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv70, i64 %indvars.iv68, i64 %index
  %41 = bitcast double* %40 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %41, align 8, !alias.scope !9, !noalias !6
  %42 = getelementptr double, double* %40, i64 2
  %43 = bitcast double* %42 to <2 x i64>*
  store <2 x i64> %wide.load80, <2 x i64>* %43, align 8, !alias.scope !9, !noalias !6
  %index.next = add i64 %index, 4
  %44 = getelementptr inbounds double, double* %5, i64 %index.next
  %45 = bitcast double* %44 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %45, align 8, !alias.scope !6
  %46 = getelementptr double, double* %44, i64 2
  %47 = bitcast double* %46 to <2 x i64>*
  %wide.load80.1 = load <2 x i64>, <2 x i64>* %47, align 8, !alias.scope !6
  %48 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv70, i64 %indvars.iv68, i64 %index.next
  %49 = bitcast double* %48 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %49, align 8, !alias.scope !9, !noalias !6
  %50 = getelementptr double, double* %48, i64 2
  %51 = bitcast double* %50 to <2 x i64>*
  store <2 x i64> %wide.load80.1, <2 x i64>* %51, align 8, !alias.scope !9, !noalias !6
  %index.next.1 = add i64 %index, 8
  %52 = getelementptr inbounds double, double* %5, i64 %index.next.1
  %53 = bitcast double* %52 to <2 x i64>*
  %wide.load.2 = load <2 x i64>, <2 x i64>* %53, align 8, !alias.scope !6
  %54 = getelementptr double, double* %52, i64 2
  %55 = bitcast double* %54 to <2 x i64>*
  %wide.load80.2 = load <2 x i64>, <2 x i64>* %55, align 8, !alias.scope !6
  %56 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv70, i64 %indvars.iv68, i64 %index.next.1
  %57 = bitcast double* %56 to <2 x i64>*
  store <2 x i64> %wide.load.2, <2 x i64>* %57, align 8, !alias.scope !9, !noalias !6
  %58 = getelementptr double, double* %56, i64 2
  %59 = bitcast double* %58 to <2 x i64>*
  store <2 x i64> %wide.load80.2, <2 x i64>* %59, align 8, !alias.scope !9, !noalias !6
  %index.next.2 = add i64 %index, 12
  %60 = getelementptr inbounds double, double* %5, i64 %index.next.2
  %61 = bitcast double* %60 to <2 x i64>*
  %wide.load.3 = load <2 x i64>, <2 x i64>* %61, align 8, !alias.scope !6
  %62 = getelementptr double, double* %60, i64 2
  %63 = bitcast double* %62 to <2 x i64>*
  %wide.load80.3 = load <2 x i64>, <2 x i64>* %63, align 8, !alias.scope !6
  %64 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv70, i64 %indvars.iv68, i64 %index.next.2
  %65 = bitcast double* %64 to <2 x i64>*
  store <2 x i64> %wide.load.3, <2 x i64>* %65, align 8, !alias.scope !9, !noalias !6
  %66 = getelementptr double, double* %64, i64 2
  %67 = bitcast double* %66 to <2 x i64>*
  store <2 x i64> %wide.load80.3, <2 x i64>* %67, align 8, !alias.scope !9, !noalias !6
  %index.next.3 = add i64 %index, 16
  %68 = icmp eq i64 %index.next.3, %n.vec
  br i1 %68, label %middle.block.loopexit, label %vector.body, !llvm.loop !12

middle.block.loopexit:                            ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit, %vector.body.prol.loopexit
  br i1 %cmp.n, label %._crit_edge16.us, label %.lr.ph15.us.preheader113

.lr.ph.us.us:                                     ; preds = %.preheader5.us, %._crit_edge.us.us
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %._crit_edge.us.us ], [ 0, %.preheader5.us ]
  %69 = getelementptr inbounds double, double* %5, i64 %indvars.iv60
  store double 0.000000e+00, double* %69, align 8
  br i1 %17, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %70 = load double, double* %21, align 8
  %71 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv60
  %72 = load double, double* %71, align 8
  %73 = fmul double %70, %72
  %74 = fadd double %73, 0.000000e+00
  %sunkaddr123 = mul i64 %indvars.iv60, 8
  %sunkaddr124 = add i64 %sunkaddr, %sunkaddr123
  %sunkaddr125 = inttoptr i64 %sunkaddr124 to double*
  store double %74, double* %sunkaddr125, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %75 = phi double [ %74, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv58.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %18, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  %sunkaddr127 = mul i64 %indvars.iv60, 8
  %sunkaddr128 = add i64 %sunkaddr126, %sunkaddr127
  %sunkaddr129 = inttoptr i64 %sunkaddr128 to double*
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond = icmp eq i64 %indvars.iv.next61, %wide.trip.count62
  br i1 %exitcond, label %.lr.ph15.us.preheader, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %76 = phi double [ %88, %.lr.ph.us.us.new ], [ %75, %.lr.ph.us.us.new.preheader ]
  %indvars.iv58 = phi i64 [ %indvars.iv.next59.1, %.lr.ph.us.us.new ], [ %indvars.iv58.unr.ph, %.lr.ph.us.us.new.preheader ]
  %77 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv70, i64 %indvars.iv68, i64 %indvars.iv58
  %78 = load double, double* %77, align 8
  %79 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv58, i64 %indvars.iv60
  %80 = load double, double* %79, align 8
  %81 = fmul double %78, %80
  %82 = fadd double %81, %76
  store double %82, double* %sunkaddr129, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %83 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv70, i64 %indvars.iv68, i64 %indvars.iv.next59
  %84 = load double, double* %83, align 8
  %85 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next59, i64 %indvars.iv60
  %86 = load double, double* %85, align 8
  %87 = fmul double %84, %86
  %88 = fadd double %87, %82
  store double %88, double* %sunkaddr129, align 8
  %indvars.iv.next59.1 = add nuw nsw i64 %indvars.iv58, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next59.1, %wide.trip.count62
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.preheader5:                                      ; preds = %.preheader5, %.preheader5.preheader.new
  %indvars.iv54 = phi i64 [ %indvars.iv54.unr, %.preheader5.preheader.new ], [ %indvars.iv.next55.7, %.preheader5 ]
  %indvars.iv.next55.7 = add nsw i64 %indvars.iv54, 8
  %exitcond115.7 = icmp eq i64 %indvars.iv.next55.7, %9
  br i1 %exitcond115.7, label %._crit_edge18.loopexit130, label %.preheader5

._crit_edge18.loopexit:                           ; preds = %._crit_edge16.us
  br label %._crit_edge18

._crit_edge18.loopexit130:                        ; preds = %.preheader5
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge18.loopexit130, %._crit_edge18.loopexit, %.preheader5.prol.loopexit, %.preheader6
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond117 = icmp eq i64 %indvars.iv.next71, %10
  br i1 %exitcond117, label %._crit_edge35.loopexit, label %.preheader6

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
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader7.lr.ph, label %.preheader5

.preheader7.lr.ph:                                ; preds = %5
  %7 = icmp sgt i32 %1, 0
  br i1 %7, label %.preheader7.us.preheader, label %.preheader5

.preheader7.us.preheader:                         ; preds = %.preheader7.lr.ph
  %8 = sext i32 %0 to i64
  %9 = sitofp i32 %2 to double
  %wide.trip.count53 = zext i32 %2 to i64
  %wide.trip.count57 = zext i32 %1 to i64
  %10 = icmp sgt i32 %2, 0
  %xtraiter71 = and i64 %wide.trip.count53, 1
  %lcmp.mod72 = icmp eq i64 %xtraiter71, 0
  %11 = icmp eq i32 %2, 1
  %12 = insertelement <2 x double> undef, double %9, i32 0
  %13 = insertelement <2 x double> %12, double %9, i32 1
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge19.us, %.preheader7.us.preheader
  %indvars.iv59 = phi i64 [ 0, %.preheader7.us.preheader ], [ %indvars.iv.next60, %._crit_edge19.us ]
  br i1 %10, label %.preheader6.us.us.preheader, label %._crit_edge19.us

.preheader6.us.us.preheader:                      ; preds = %.preheader7.us
  br label %.preheader6.us.us

._crit_edge19.us.loopexit:                        ; preds = %._crit_edge16.us.us
  br label %._crit_edge19.us

._crit_edge19.us:                                 ; preds = %._crit_edge19.us.loopexit, %.preheader7.us
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next60, %8
  br i1 %exitcond68, label %.preheader5.loopexit, label %.preheader7.us

.preheader6.us.us:                                ; preds = %.preheader6.us.us.preheader, %._crit_edge16.us.us
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %._crit_edge16.us.us ], [ 0, %.preheader6.us.us.preheader ]
  %14 = mul nsw i64 %indvars.iv55, %indvars.iv59
  br i1 %lcmp.mod72, label %.prol.loopexit70, label %15

; <label>:15:                                     ; preds = %.preheader6.us.us
  %16 = trunc i64 %14 to i32
  %17 = srem i32 %16, %2
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, %9
  %20 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv59, i64 %indvars.iv55, i64 0
  store double %19, double* %20, align 8
  br label %.prol.loopexit70

.prol.loopexit70:                                 ; preds = %15, %.preheader6.us.us
  %indvars.iv51.unr.ph = phi i64 [ 1, %15 ], [ 0, %.preheader6.us.us ]
  br i1 %11, label %._crit_edge16.us.us, label %.preheader6.us.us.new

.preheader6.us.us.new:                            ; preds = %.prol.loopexit70
  br label %21

._crit_edge16.us.us.loopexit:                     ; preds = %21
  br label %._crit_edge16.us.us

._crit_edge16.us.us:                              ; preds = %._crit_edge16.us.us.loopexit, %.prol.loopexit70
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next56, %wide.trip.count57
  br i1 %exitcond58, label %._crit_edge19.us.loopexit, label %.preheader6.us.us

; <label>:21:                                     ; preds = %21, %.preheader6.us.us.new
  %indvars.iv51 = phi i64 [ %indvars.iv51.unr.ph, %.preheader6.us.us.new ], [ %indvars.iv.next52.1, %21 ]
  %22 = add nsw i64 %14, %indvars.iv51
  %23 = trunc i64 %22 to i32
  %24 = srem i32 %23, %2
  %25 = sitofp i32 %24 to double
  %26 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv59, i64 %indvars.iv55, i64 %indvars.iv51
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %27 = add nsw i64 %14, %indvars.iv.next52
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, %2
  %30 = sitofp i32 %29 to double
  %31 = insertelement <2 x double> undef, double %25, i32 0
  %32 = insertelement <2 x double> %31, double %30, i32 1
  %33 = fdiv <2 x double> %32, %13
  %34 = bitcast double* %26 to <2 x double>*
  store <2 x double> %33, <2 x double>* %34, align 8
  %indvars.iv.next52.1 = add nsw i64 %indvars.iv51, 2
  %exitcond54.1 = icmp eq i64 %indvars.iv.next52.1, %wide.trip.count53
  br i1 %exitcond54.1, label %._crit_edge16.us.us.loopexit, label %21

.preheader5.loopexit:                             ; preds = %._crit_edge19.us
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.loopexit, %.preheader7.lr.ph, %5
  %35 = icmp sgt i32 %2, 0
  br i1 %35, label %.preheader.us.preheader, label %._crit_edge10

.preheader.us.preheader:                          ; preds = %.preheader5
  %36 = sext i32 %2 to i64
  %37 = sitofp i32 %2 to double
  %wide.trip.count = zext i32 %2 to i64
  %xtraiter = and i64 %wide.trip.count, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %38 = icmp eq i32 %2, 1
  %39 = insertelement <2 x double> undef, double %37, i32 0
  %40 = insertelement <2 x double> %39, double %37, i32 1
  %41 = fdiv double 0.000000e+00, %37
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv48 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next49, %._crit_edge.us ]
  br i1 %lcmp.mod, label %.prol.loopexit, label %42

; <label>:42:                                     ; preds = %.preheader.us
  %43 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv48, i64 0
  store double %41, double* %43, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %42, %.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %42 ], [ 0, %.preheader.us ]
  br i1 %38, label %._crit_edge.us, label %.preheader.us.new

.preheader.us.new:                                ; preds = %.prol.loopexit
  br label %44

; <label>:44:                                     ; preds = %44, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.preheader.us.new ], [ %indvars.iv.next.1, %44 ]
  %45 = mul nsw i64 %indvars.iv48, %indvars.iv
  %46 = trunc i64 %45 to i32
  %47 = srem i32 %46, %2
  %48 = sitofp i32 %47 to double
  %49 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv48, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %50 = mul nsw i64 %indvars.iv48, %indvars.iv.next
  %51 = trunc i64 %50 to i32
  %52 = srem i32 %51, %2
  %53 = sitofp i32 %52 to double
  %54 = insertelement <2 x double> undef, double %48, i32 0
  %55 = insertelement <2 x double> %54, double %53, i32 1
  %56 = fdiv <2 x double> %55, %40
  %57 = bitcast double* %49 to <2 x double>*
  store <2 x double> %56, <2 x double>* %57, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %44

._crit_edge.us.loopexit:                          ; preds = %44
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next49, %36
  br i1 %exitcond67, label %._crit_edge10.loopexit, label %.preheader.us

._crit_edge10.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit, %.preheader5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, i32, [140 x [160 x double]]*) unnamed_addr #1 {
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #5
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.preheader3.lr.ph, label %._crit_edge10

.preheader3.lr.ph:                                ; preds = %4
  %10 = icmp sgt i32 %1, 0
  br i1 %10, label %.preheader3.us.preheader, label %._crit_edge10

.preheader3.us.preheader:                         ; preds = %.preheader3.lr.ph
  %11 = sext i32 %0 to i64
  %12 = sext i32 %1 to i64
  %wide.trip.count = zext i32 %2 to i64
  %wide.trip.count34 = zext i32 %1 to i64
  %13 = icmp sgt i32 %2, 0
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %._crit_edge5.us, %.preheader3.us.preheader
  %indvars.iv36 = phi i64 [ 0, %.preheader3.us.preheader ], [ %indvars.iv.next37, %._crit_edge5.us ]
  br i1 %13, label %.preheader.us.us.preheader, label %._crit_edge5.us

.preheader.us.us.preheader:                       ; preds = %.preheader3.us
  %14 = mul nsw i64 %12, %indvars.iv36
  %15 = trunc i64 %14 to i32
  br label %.preheader.us.us

._crit_edge5.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %._crit_edge5.us.loopexit, %.preheader3.us
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next37, %11
  br i1 %exitcond41, label %._crit_edge10.loopexit, label %.preheader3.us

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %16 = trunc i64 %indvars.iv32 to i32
  %17 = add i32 %15, %16
  %18 = mul i32 %17, %2
  %19 = zext i32 %18 to i64
  br label %20

._crit_edge.us.us:                                ; preds = %27
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next33, %wide.trip.count34
  br i1 %exitcond35, label %._crit_edge5.us.loopexit, label %.preheader.us.us

; <label>:20:                                     ; preds = %27, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %27 ], [ 0, %.preheader.us.us ]
  %21 = add i64 %19, %indvars.iv
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 20
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %27

; <label>:25:                                     ; preds = %20
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %26) #5
  br label %27

; <label>:27:                                     ; preds = %25, %20
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv36, i64 %indvars.iv32, i64 %indvars.iv
  %30 = load double, double* %29, align 8
  %31 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %30) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.us, label %20

._crit_edge10.loopexit:                           ; preds = %._crit_edge5.us
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit, %.preheader3.lr.ph, %4
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %35 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %34) #5
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
