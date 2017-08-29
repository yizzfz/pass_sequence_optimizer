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
define void @kernel_doitgen(i32, i32, i32, [140 x [160 x double]]* nocapture, [160 x double]* nocapture readonly, double* nocapture) local_unnamed_addr #0 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader6.lr.ph, label %._crit_edge

.preheader6.lr.ph:                                ; preds = %6
  %8 = icmp sgt i32 %1, 0
  %9 = icmp sgt i32 %2, 0
  %10 = sext i32 %2 to i64
  %11 = sext i32 %1 to i64
  %12 = sext i32 %0 to i64
  %13 = zext i32 %2 to i64
  %scevgep76 = getelementptr double, double* %5, i64 %10
  %14 = add nsw i64 %11, -1
  %15 = add nsw i64 %10, -4
  %16 = lshr i64 %15, 2
  %17 = add nuw nsw i64 %16, 1
  %xtraiter84 = and i64 %13, 1
  %lcmp.mod85 = icmp eq i64 %xtraiter84, 0
  %18 = icmp eq i32 %2, 1
  %min.iters.check = icmp ult i32 %2, 4
  %n.vec = and i64 %10, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %xtraiter86 = and i64 %17, 3
  %lcmp.mod87 = icmp eq i64 %xtraiter86, 0
  %19 = icmp ult i64 %15, 12
  %cmp.n = icmp eq i64 %10, %n.vec
  %xtraiter = and i64 %11, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %20 = icmp ult i64 %14, 7
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge16, %.preheader6.lr.ph
  %indvars.iv64 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next65, %._crit_edge16 ]
  br i1 %8, label %.preheader5.lr.ph, label %._crit_edge16

.preheader5.lr.ph:                                ; preds = %.preheader6
  br i1 %9, label %.lr.ph.us.us.preheader.preheader, label %._crit_edge14.preheader

._crit_edge14.preheader:                          ; preds = %.preheader5.lr.ph
  br i1 %lcmp.mod, label %._crit_edge14.prol.loopexit, label %._crit_edge14.prol.preheader

._crit_edge14.prol.preheader:                     ; preds = %._crit_edge14.preheader
  br label %._crit_edge14.prol

._crit_edge14.prol:                               ; preds = %._crit_edge14.prol, %._crit_edge14.prol.preheader
  %indvars.iv48.prol = phi i64 [ %indvars.iv.next49.prol, %._crit_edge14.prol ], [ 0, %._crit_edge14.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %._crit_edge14.prol ], [ %xtraiter, %._crit_edge14.prol.preheader ]
  %indvars.iv.next49.prol = add nuw nsw i64 %indvars.iv48.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge14.prol.loopexit.unr-lcssa, label %._crit_edge14.prol, !llvm.loop !1

._crit_edge14.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge14.prol
  br label %._crit_edge14.prol.loopexit

._crit_edge14.prol.loopexit:                      ; preds = %._crit_edge14.preheader, %._crit_edge14.prol.loopexit.unr-lcssa
  %indvars.iv48.unr = phi i64 [ 0, %._crit_edge14.preheader ], [ %indvars.iv.next49.prol, %._crit_edge14.prol.loopexit.unr-lcssa ]
  br i1 %20, label %._crit_edge16.loopexit81, label %._crit_edge14.preheader.new

._crit_edge14.preheader.new:                      ; preds = %._crit_edge14.prol.loopexit
  br label %._crit_edge14

.lr.ph.us.us.preheader.preheader:                 ; preds = %.preheader5.lr.ph
  br label %.lr.ph.us.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %._crit_edge14.us, %.lr.ph.us.us.preheader.preheader
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %._crit_edge14.us ], [ 0, %.lr.ph.us.us.preheader.preheader ]
  %scevgep = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv64, i64 %indvars.iv62, i64 0
  %21 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv64, i64 %indvars.iv62, i64 0
  br label %.lr.ph.us.us

._crit_edge14.us.loopexit:                        ; preds = %._crit_edge66
  br label %._crit_edge14.us

._crit_edge14.us:                                 ; preds = %._crit_edge14.us.loopexit, %middle.block
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond82 = icmp eq i64 %indvars.iv.next63, %11
  br i1 %exitcond82, label %._crit_edge16.loopexit, label %.lr.ph.us.us.preheader

._crit_edge66:                                    ; preds = %._crit_edge66.preheader80, %._crit_edge66
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %._crit_edge66 ], [ %indvars.iv60.ph, %._crit_edge66.preheader80 ]
  %22 = getelementptr inbounds double, double* %5, i64 %indvars.iv60
  %23 = bitcast double* %22 to i64*
  %24 = load i64, i64* %23, align 8
  %25 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv64, i64 %indvars.iv62, i64 %indvars.iv60
  %26 = bitcast double* %25 to i64*
  store i64 %24, i64* %26, align 8
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %27 = icmp slt i64 %indvars.iv.next61, %10
  br i1 %27, label %._crit_edge66, label %._crit_edge14.us.loopexit, !llvm.loop !3

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.lr.ph.us.us.preheader
  %indvars.iv56 = phi i64 [ 0, %.lr.ph.us.us.preheader ], [ %indvars.iv.next57, %._crit_edge.us.us ]
  %28 = getelementptr inbounds double, double* %5, i64 %indvars.iv56
  store double 0.000000e+00, double* %28, align 8
  br i1 %lcmp.mod85, label %._crit_edge67.prol.loopexit.unr-lcssa, label %._crit_edge67.prol.preheader

._crit_edge67.prol.preheader:                     ; preds = %.lr.ph.us.us
  br label %._crit_edge67.prol

._crit_edge67.prol:                               ; preds = %._crit_edge67.prol.preheader
  %29 = load double, double* %21, align 8
  %30 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv56
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = fadd double %32, 0.000000e+00
  store double %33, double* %28, align 8
  br label %._crit_edge67.prol.loopexit.unr-lcssa

._crit_edge67.prol.loopexit.unr-lcssa:            ; preds = %.lr.ph.us.us, %._crit_edge67.prol
  %.unr.ph = phi double [ %33, %._crit_edge67.prol ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv52.unr.ph = phi i64 [ 1, %._crit_edge67.prol ], [ 0, %.lr.ph.us.us ]
  br label %._crit_edge67.prol.loopexit

._crit_edge67.prol.loopexit:                      ; preds = %._crit_edge67.prol.loopexit.unr-lcssa
  br i1 %18, label %._crit_edge.us.us, label %.lr.ph.us.us.new

.lr.ph.us.us.new:                                 ; preds = %._crit_edge67.prol.loopexit
  br label %._crit_edge67

._crit_edge.us.us.unr-lcssa:                      ; preds = %._crit_edge67
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge67.prol.loopexit, %._crit_edge.us.us.unr-lcssa
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond59 = icmp eq i64 %indvars.iv.next57, %13
  br i1 %exitcond59, label %._crit_edge66.preheader, label %.lr.ph.us.us

._crit_edge66.preheader:                          ; preds = %._crit_edge.us.us
  %scevgep74 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv64, i64 %indvars.iv62, i64 %10
  br i1 %min.iters.check, label %._crit_edge66.preheader80, label %min.iters.checked

._crit_edge66.preheader80:                        ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %._crit_edge66.preheader
  %indvars.iv60.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %._crit_edge66.preheader ], [ %n.vec, %middle.block ]
  br label %._crit_edge66

min.iters.checked:                                ; preds = %._crit_edge66.preheader
  br i1 %cmp.zero, label %._crit_edge66.preheader80, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep76
  %bound1 = icmp ugt double* %scevgep74, %5
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %._crit_edge66.preheader80, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br i1 %lcmp.mod87, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter88 = phi i64 [ %prol.iter88.sub, %vector.body.prol ], [ %xtraiter86, %vector.body.prol.preheader ]
  %34 = getelementptr inbounds double, double* %5, i64 %index.prol
  %35 = bitcast double* %34 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %35, align 8, !alias.scope !6
  %36 = getelementptr double, double* %34, i64 2
  %37 = bitcast double* %36 to <2 x i64>*
  %wide.load79.prol = load <2 x i64>, <2 x i64>* %37, align 8, !alias.scope !6
  %38 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv64, i64 %indvars.iv62, i64 %index.prol
  %39 = bitcast double* %38 to <2 x i64>*
  store <2 x i64> %wide.load.prol, <2 x i64>* %39, align 8, !alias.scope !9, !noalias !6
  %40 = getelementptr double, double* %38, i64 2
  %41 = bitcast double* %40 to <2 x i64>*
  store <2 x i64> %wide.load79.prol, <2 x i64>* %41, align 8, !alias.scope !9, !noalias !6
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter88.sub = add i64 %prol.iter88, -1
  %prol.iter88.cmp = icmp eq i64 %prol.iter88.sub, 0
  br i1 %prol.iter88.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !11

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  br i1 %19, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %42 = getelementptr inbounds double, double* %5, i64 %index
  %43 = bitcast double* %42 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %43, align 8, !alias.scope !6
  %44 = getelementptr double, double* %42, i64 2
  %45 = bitcast double* %44 to <2 x i64>*
  %wide.load79 = load <2 x i64>, <2 x i64>* %45, align 8, !alias.scope !6
  %46 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv64, i64 %indvars.iv62, i64 %index
  %47 = bitcast double* %46 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %47, align 8, !alias.scope !9, !noalias !6
  %48 = getelementptr double, double* %46, i64 2
  %49 = bitcast double* %48 to <2 x i64>*
  store <2 x i64> %wide.load79, <2 x i64>* %49, align 8, !alias.scope !9, !noalias !6
  %index.next = add i64 %index, 4
  %50 = getelementptr inbounds double, double* %5, i64 %index.next
  %51 = bitcast double* %50 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %51, align 8, !alias.scope !6
  %52 = getelementptr double, double* %50, i64 2
  %53 = bitcast double* %52 to <2 x i64>*
  %wide.load79.1 = load <2 x i64>, <2 x i64>* %53, align 8, !alias.scope !6
  %54 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv64, i64 %indvars.iv62, i64 %index.next
  %55 = bitcast double* %54 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %55, align 8, !alias.scope !9, !noalias !6
  %56 = getelementptr double, double* %54, i64 2
  %57 = bitcast double* %56 to <2 x i64>*
  store <2 x i64> %wide.load79.1, <2 x i64>* %57, align 8, !alias.scope !9, !noalias !6
  %index.next.1 = add i64 %index, 8
  %58 = getelementptr inbounds double, double* %5, i64 %index.next.1
  %59 = bitcast double* %58 to <2 x i64>*
  %wide.load.2 = load <2 x i64>, <2 x i64>* %59, align 8, !alias.scope !6
  %60 = getelementptr double, double* %58, i64 2
  %61 = bitcast double* %60 to <2 x i64>*
  %wide.load79.2 = load <2 x i64>, <2 x i64>* %61, align 8, !alias.scope !6
  %62 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv64, i64 %indvars.iv62, i64 %index.next.1
  %63 = bitcast double* %62 to <2 x i64>*
  store <2 x i64> %wide.load.2, <2 x i64>* %63, align 8, !alias.scope !9, !noalias !6
  %64 = getelementptr double, double* %62, i64 2
  %65 = bitcast double* %64 to <2 x i64>*
  store <2 x i64> %wide.load79.2, <2 x i64>* %65, align 8, !alias.scope !9, !noalias !6
  %index.next.2 = add i64 %index, 12
  %66 = getelementptr inbounds double, double* %5, i64 %index.next.2
  %67 = bitcast double* %66 to <2 x i64>*
  %wide.load.3 = load <2 x i64>, <2 x i64>* %67, align 8, !alias.scope !6
  %68 = getelementptr double, double* %66, i64 2
  %69 = bitcast double* %68 to <2 x i64>*
  %wide.load79.3 = load <2 x i64>, <2 x i64>* %69, align 8, !alias.scope !6
  %70 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv64, i64 %indvars.iv62, i64 %index.next.2
  %71 = bitcast double* %70 to <2 x i64>*
  store <2 x i64> %wide.load.3, <2 x i64>* %71, align 8, !alias.scope !9, !noalias !6
  %72 = getelementptr double, double* %70, i64 2
  %73 = bitcast double* %72 to <2 x i64>*
  store <2 x i64> %wide.load79.3, <2 x i64>* %73, align 8, !alias.scope !9, !noalias !6
  %index.next.3 = add i64 %index, 16
  %74 = icmp eq i64 %index.next.3, %n.vec
  br i1 %74, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !12

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  br i1 %cmp.n, label %._crit_edge14.us, label %._crit_edge66.preheader80

._crit_edge67:                                    ; preds = %._crit_edge67, %.lr.ph.us.us.new
  %75 = phi double [ %.unr.ph, %.lr.ph.us.us.new ], [ %87, %._crit_edge67 ]
  %indvars.iv52 = phi i64 [ %indvars.iv52.unr.ph, %.lr.ph.us.us.new ], [ %indvars.iv.next53.1, %._crit_edge67 ]
  %76 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv64, i64 %indvars.iv62, i64 %indvars.iv52
  %77 = load double, double* %76, align 8
  %78 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv52, i64 %indvars.iv56
  %79 = load double, double* %78, align 8
  %80 = fmul double %77, %79
  %81 = fadd double %80, %75
  store double %81, double* %28, align 8
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %82 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv64, i64 %indvars.iv62, i64 %indvars.iv.next53
  %83 = load double, double* %82, align 8
  %84 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next53, i64 %indvars.iv56
  %85 = load double, double* %84, align 8
  %86 = fmul double %83, %85
  %87 = fadd double %86, %81
  store double %87, double* %28, align 8
  %indvars.iv.next53.1 = add nsw i64 %indvars.iv52, 2
  %exitcond55.1 = icmp eq i64 %indvars.iv.next53.1, %13
  br i1 %exitcond55.1, label %._crit_edge.us.us.unr-lcssa, label %._crit_edge67

._crit_edge14:                                    ; preds = %._crit_edge14, %._crit_edge14.preheader.new
  %indvars.iv48 = phi i64 [ %indvars.iv48.unr, %._crit_edge14.preheader.new ], [ %indvars.iv.next49.7, %._crit_edge14 ]
  %indvars.iv.next49.7 = add nsw i64 %indvars.iv48, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next49.7, %11
  br i1 %exitcond.7, label %._crit_edge16.loopexit81.unr-lcssa, label %._crit_edge14

._crit_edge16.loopexit:                           ; preds = %._crit_edge14.us
  br label %._crit_edge16

._crit_edge16.loopexit81.unr-lcssa:               ; preds = %._crit_edge14
  br label %._crit_edge16.loopexit81

._crit_edge16.loopexit81:                         ; preds = %._crit_edge14.prol.loopexit, %._crit_edge16.loopexit81.unr-lcssa
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit81, %._crit_edge16.loopexit, %.preheader6
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond83 = icmp eq i64 %indvars.iv.next65, %12
  br i1 %exitcond83, label %._crit_edge.loopexit, label %.preheader6

._crit_edge.loopexit:                             ; preds = %._crit_edge16
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #1 {
  %3 = call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %6 = bitcast i8* %3 to [140 x [160 x double]]*
  %7 = bitcast i8* %5 to [160 x double]*
  call fastcc void @init_array([140 x [160 x double]]* %6, [160 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to double*
  call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7, double* %8)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  call fastcc void @print_array([140 x [160 x double]]* %6)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([140 x [160 x double]]* nocapture, [160 x double]* nocapture) unnamed_addr #0 {
.preheader7.us.preheader:
  br label %.preheader6.us.us.preheader

.preheader6.us.us.preheader:                      ; preds = %._crit_edge18.us, %.preheader7.us.preheader
  %indvars.iv57 = phi i64 [ 0, %.preheader7.us.preheader ], [ %indvars.iv.next58, %._crit_edge18.us ]
  br label %.preheader6.us.us

._crit_edge18.us:                                 ; preds = %._crit_edge16.us.us
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next58, 150
  br i1 %exitcond2, label %.preheader.us.preheader, label %.preheader6.us.us.preheader

.preheader.us.preheader:                          ; preds = %._crit_edge18.us
  br label %.preheader.us

.preheader6.us.us:                                ; preds = %._crit_edge16.us.us, %.preheader6.us.us.preheader
  %indvars.iv53 = phi i64 [ 0, %.preheader6.us.us.preheader ], [ %indvars.iv.next54, %._crit_edge16.us.us ]
  %2 = mul nuw nsw i64 %indvars.iv53, %indvars.iv57
  br label %._crit_edge

._crit_edge16.us.us:                              ; preds = %._crit_edge
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next54, 140
  br i1 %exitcond56, label %._crit_edge18.us, label %.preheader6.us.us

._crit_edge:                                      ; preds = %._crit_edge, %.preheader6.us.us
  %indvars.iv49 = phi i64 [ 0, %.preheader6.us.us ], [ %indvars.iv.next50.1, %._crit_edge ]
  %3 = add nuw nsw i64 %2, %indvars.iv49
  %4 = trunc i64 %3 to i32
  %5 = srem i32 %4, 160
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %0, i64 %indvars.iv57, i64 %indvars.iv53, i64 %indvars.iv49
  %indvars.iv.next50 = or i64 %indvars.iv49, 1
  %8 = add nuw nsw i64 %2, %indvars.iv.next50
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 160
  %11 = sitofp i32 %10 to double
  %12 = insertelement <2 x double> undef, double %6, i32 0
  %13 = insertelement <2 x double> %12, double %11, i32 1
  %14 = fdiv <2 x double> %13, <double 1.600000e+02, double 1.600000e+02>
  %15 = bitcast double* %7 to <2 x double>*
  store <2 x double> %14, <2 x double>* %15, align 8
  %indvars.iv.next50.1 = add nsw i64 %indvars.iv49, 2
  %exitcond52.1 = icmp eq i64 %indvars.iv.next50.1, 160
  br i1 %exitcond52.1, label %._crit_edge16.us.us, label %._crit_edge

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %._crit_edge63

._crit_edge63:                                    ; preds = %._crit_edge63, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %._crit_edge63 ]
  %16 = mul nuw nsw i64 %indvars.iv46, %indvars.iv
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 160
  %19 = sitofp i32 %18 to double
  %20 = getelementptr inbounds [160 x double], [160 x double]* %1, i64 %indvars.iv46, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %21 = mul nuw nsw i64 %indvars.iv46, %indvars.iv.next
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 160
  %24 = sitofp i32 %23 to double
  %25 = insertelement <2 x double> undef, double %19, i32 0
  %26 = insertelement <2 x double> %25, double %24, i32 1
  %27 = fdiv <2 x double> %26, <double 1.600000e+02, double 1.600000e+02>
  %28 = bitcast double* %20 to <2 x double>*
  store <2 x double> %27, <2 x double>* %28, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 160
  br i1 %exitcond.1, label %._crit_edge.us, label %._crit_edge63

._crit_edge.us:                                   ; preds = %._crit_edge63
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next47, 160
  br i1 %exitcond1, label %._crit_edge9, label %.preheader.us

._crit_edge9:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #2

declare void @polybench_timer_stop(...) local_unnamed_addr #2

declare void @polybench_timer_print(...) local_unnamed_addr #2

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([140 x [160 x double]]* nocapture readonly) unnamed_addr #1 {
.preheader3.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %._crit_edge6.us, %.preheader3.us.preheader
  %indvars.iv39 = phi i64 [ 0, %.preheader3.us.preheader ], [ %indvars.iv.next40, %._crit_edge6.us ]
  %5 = mul nuw nsw i64 %indvars.iv39, 140
  br label %.preheader.us.us

._crit_edge6.us:                                  ; preds = %._crit_edge5.us.us
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond = icmp eq i64 %indvars.iv.next40, 150
  br i1 %exitcond, label %._crit_edge11, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge5.us.us, %.preheader.us.us.preheader
  %indvars.iv35 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next36, %._crit_edge5.us.us ]
  %6 = add nuw nsw i64 %5, %indvars.iv35
  %sext = mul nuw nsw i64 %6, 687194767360
  %7 = lshr exact i64 %sext, 32
  br label %._crit_edge.us.us._crit_edge

._crit_edge5.us.us:                               ; preds = %._crit_edge.us.us
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next36, 140
  br i1 %exitcond38, label %._crit_edge6.us, label %.preheader.us.us

._crit_edge.us.us._crit_edge:                     ; preds = %._crit_edge.us.us, %.preheader.us.us
  %indvars.iv = phi i64 [ 0, %.preheader.us.us ], [ %indvars.iv.next, %._crit_edge.us.us ]
  %8 = add nuw nsw i64 %7, %indvars.iv
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge.us.us

; <label>:12:                                     ; preds = %._crit_edge.us.us._crit_edge
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us._crit_edge, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %0, i64 %indvars.iv39, i64 %indvars.iv35, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond34, label %._crit_edge5.us.us, label %._crit_edge.us.us._crit_edge

._crit_edge11:                                    ; preds = %._crit_edge6.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
