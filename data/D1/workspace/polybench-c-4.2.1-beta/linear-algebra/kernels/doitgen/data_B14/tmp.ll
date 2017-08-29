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

; Function Attrs: noinline norecurse nounwind uwtable
define void @kernel_doitgen(i32, i32, i32, [140 x [160 x double]]*, [160 x double]* nocapture readonly, double*) #0 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader6.lr.ph, label %._crit_edge31

.preheader6.lr.ph:                                ; preds = %6
  %8 = icmp sgt i32 %1, 0
  %9 = icmp sgt i32 %2, 0
  %10 = sext i32 %2 to i64
  %11 = sext i32 %1 to i64
  %12 = sext i32 %0 to i64
  %13 = zext i32 %2 to i64
  %14 = and i32 %2, 1
  %lcmp.mod = icmp eq i32 %14, 0
  %15 = icmp eq i32 %2, 1
  %scevgep74 = getelementptr double, double* %5, i64 %10
  %16 = add nsw i64 %11, -1
  %17 = add nsw i64 %10, -4
  %18 = lshr i64 %17, 2
  %19 = add nuw nsw i64 %18, 1
  %20 = add nsw i64 %10, -1
  %min.iters.check = icmp ult i32 %2, 4
  %n.vec = and i64 %10, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %xtraiter81 = and i64 %19, 3
  %lcmp.mod82 = icmp eq i64 %xtraiter81, 0
  %21 = icmp ult i64 %17, 12
  %cmp.n = icmp eq i64 %10, %n.vec
  %xtraiter = and i64 %11, 7
  %lcmp.mod80 = icmp eq i64 %xtraiter, 0
  %22 = icmp ult i64 %16, 7
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge15, %.preheader6.lr.ph
  %indvars.iv62 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next63, %._crit_edge15 ]
  br i1 %8, label %.preheader5.lr.ph, label %._crit_edge15

.preheader5.lr.ph:                                ; preds = %.preheader6
  br i1 %9, label %.preheader5.us.preheader, label %.preheader5.preheader

.preheader5.preheader:                            ; preds = %.preheader5.lr.ph
  br i1 %lcmp.mod80, label %.preheader5.prol.loopexit, label %.preheader5.prol.preheader

.preheader5.prol.preheader:                       ; preds = %.preheader5.preheader
  br label %.preheader5.prol

.preheader5.prol:                                 ; preds = %.preheader5.prol, %.preheader5.prol.preheader
  %indvars.iv46.prol = phi i64 [ %indvars.iv.next47.prol, %.preheader5.prol ], [ 0, %.preheader5.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader5.prol ], [ %xtraiter, %.preheader5.prol.preheader ]
  %indvars.iv.next47.prol = add nuw nsw i64 %indvars.iv46.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader5.prol.loopexit.unr-lcssa, label %.preheader5.prol, !llvm.loop !1

.preheader5.prol.loopexit.unr-lcssa:              ; preds = %.preheader5.prol
  br label %.preheader5.prol.loopexit

.preheader5.prol.loopexit:                        ; preds = %.preheader5.preheader, %.preheader5.prol.loopexit.unr-lcssa
  %indvars.iv46.unr = phi i64 [ 0, %.preheader5.preheader ], [ %indvars.iv.next47.prol, %.preheader5.prol.loopexit.unr-lcssa ]
  br i1 %22, label %._crit_edge15.loopexit79, label %.preheader5.preheader.new

.preheader5.preheader.new:                        ; preds = %.preheader5.prol.loopexit
  br label %.preheader5

.preheader5.us.preheader:                         ; preds = %.preheader5.lr.ph
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %.preheader5.us.preheader, %._crit_edge12.us
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %._crit_edge12.us ], [ 0, %.preheader5.us.preheader ]
  %scevgep = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 0
  %23 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 0
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
  %24 = getelementptr inbounds double, double* %5, i64 %indvars.iv58
  %25 = bitcast double* %24 to i64*
  %26 = load i64, i64* %25, align 8
  %27 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 %indvars.iv58
  %28 = bitcast double* %27 to i64*
  store i64 %26, i64* %28, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %29 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next59
  %30 = bitcast double* %29 to i64*
  %31 = load i64, i64* %30, align 8
  %32 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 %indvars.iv.next59
  %33 = bitcast double* %32 to i64*
  store i64 %31, i64* %33, align 8
  %indvars.iv.next59.1 = add nsw i64 %indvars.iv58, 2
  %34 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next59.1
  %35 = bitcast double* %34 to i64*
  %36 = load i64, i64* %35, align 8
  %37 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 %indvars.iv.next59.1
  %38 = bitcast double* %37 to i64*
  store i64 %36, i64* %38, align 8
  %indvars.iv.next59.2 = add nsw i64 %indvars.iv58, 3
  %39 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next59.2
  %40 = bitcast double* %39 to i64*
  %41 = load i64, i64* %40, align 8
  %42 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 %indvars.iv.next59.2
  %43 = bitcast double* %42 to i64*
  store i64 %41, i64* %43, align 8
  %indvars.iv.next59.3 = add nsw i64 %indvars.iv58, 4
  %exitcond68.3 = icmp eq i64 %indvars.iv.next59.3, %10
  br i1 %exitcond68.3, label %._crit_edge12.us.loopexit.unr-lcssa, label %.lr.ph11.us, !llvm.loop !3

.lr.ph11.us.preheader:                            ; preds = %._crit_edge.us.us
  %scevgep72 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 %10
  br i1 %min.iters.check, label %.lr.ph11.us.preheader78, label %min.iters.checked

.lr.ph11.us.preheader78:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph11.us.preheader
  %indvars.iv58.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph11.us.preheader ], [ %n.vec, %middle.block ]
  %44 = sub nsw i64 %10, %indvars.iv58.ph
  %45 = sub nsw i64 %20, %indvars.iv58.ph
  %xtraiter84 = and i64 %44, 3
  %lcmp.mod85 = icmp eq i64 %xtraiter84, 0
  br i1 %lcmp.mod85, label %.lr.ph11.us.prol.loopexit, label %.lr.ph11.us.prol.preheader

.lr.ph11.us.prol.preheader:                       ; preds = %.lr.ph11.us.preheader78
  br label %.lr.ph11.us.prol

.lr.ph11.us.prol:                                 ; preds = %.lr.ph11.us.prol, %.lr.ph11.us.prol.preheader
  %indvars.iv58.prol = phi i64 [ %indvars.iv.next59.prol, %.lr.ph11.us.prol ], [ %indvars.iv58.ph, %.lr.ph11.us.prol.preheader ]
  %prol.iter86 = phi i64 [ %prol.iter86.sub, %.lr.ph11.us.prol ], [ %xtraiter84, %.lr.ph11.us.prol.preheader ]
  %46 = getelementptr inbounds double, double* %5, i64 %indvars.iv58.prol
  %47 = bitcast double* %46 to i64*
  %48 = load i64, i64* %47, align 8
  %49 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv62, i64 %indvars.iv60, i64 %indvars.iv58.prol
  %50 = bitcast double* %49 to i64*
  store i64 %48, i64* %50, align 8
  %indvars.iv.next59.prol = add nuw nsw i64 %indvars.iv58.prol, 1
  %prol.iter86.sub = add i64 %prol.iter86, -1
  %prol.iter86.cmp = icmp eq i64 %prol.iter86.sub, 0
  br i1 %prol.iter86.cmp, label %.lr.ph11.us.prol.loopexit.unr-lcssa, label %.lr.ph11.us.prol, !llvm.loop !6

.lr.ph11.us.prol.loopexit.unr-lcssa:              ; preds = %.lr.ph11.us.prol
  br label %.lr.ph11.us.prol.loopexit

.lr.ph11.us.prol.loopexit:                        ; preds = %.lr.ph11.us.preheader78, %.lr.ph11.us.prol.loopexit.unr-lcssa
  %indvars.iv58.unr = phi i64 [ %indvars.iv58.ph, %.lr.ph11.us.preheader78 ], [ %indvars.iv.next59.prol, %.lr.ph11.us.prol.loopexit.unr-lcssa ]
  %51 = icmp ult i64 %45, 3
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
  br i1 %lcmp.mod82, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter83 = phi i64 [ %prol.iter83.sub, %vector.body.prol ], [ %xtraiter81, %vector.body.prol.preheader ]
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
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter83.sub = add i64 %prol.iter83, -1
  %prol.iter83.cmp = icmp eq i64 %prol.iter83.sub, 0
  br i1 %prol.iter83.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !12

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  br i1 %21, label %middle.block, label %vector.body.preheader.new

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
  %94 = load double, double* %23, align 8
  %95 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv54
  %96 = load double, double* %95, align 8
  %97 = fmul double %94, %96
  %98 = fadd double %97, 0.000000e+00
  store double %98, double* %93, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %99 = phi double [ %98, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv50.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %15, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next55, %13
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
  %exitcond53.1 = icmp eq i64 %indvars.iv.next51.1, %13
  br i1 %exitcond53.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.preheader5:                                      ; preds = %.preheader5, %.preheader5.preheader.new
  %indvars.iv46 = phi i64 [ %indvars.iv46.unr, %.preheader5.preheader.new ], [ %indvars.iv.next47.7, %.preheader5 ]
  %indvars.iv.next47.7 = add nsw i64 %indvars.iv46, 8
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
define i32 @main(i32, i8** nocapture readonly) #1 {
  %3 = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %6 = bitcast i8* %3 to [140 x [160 x double]]*
  %7 = bitcast i8* %5 to [160 x double]*
  tail call void @init_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %4 to double*
  tail call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7, double* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %14

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %14

; <label>:13:                                     ; preds = %10
  tail call void @print_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6)
  br label %14

; <label>:14:                                     ; preds = %10, %13, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, i32, [140 x [160 x double]]* nocapture, [160 x double]* nocapture) #0 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader7.lr.ph, label %.preheader5

.preheader7.lr.ph:                                ; preds = %5
  %7 = icmp sgt i32 %1, 0
  %8 = icmp sgt i32 %2, 0
  %9 = sitofp i32 %2 to double
  br i1 %7, label %.preheader7.us.preheader, label %.preheader5

.preheader7.us.preheader:                         ; preds = %.preheader7.lr.ph
  %10 = sext i32 %0 to i64
  %11 = and i32 %2, 1
  %lcmp.mod64 = icmp eq i32 %11, 0
  %12 = icmp eq i32 %2, 1
  %wide.trip.count54 = zext i32 %1 to i64
  %wide.trip.count50.1 = zext i32 %2 to i64
  %13 = insertelement <2 x double> undef, double %9, i32 0
  %14 = shufflevector <2 x double> %13, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge17.us, %.preheader7.us.preheader
  %indvars.iv56 = phi i64 [ 0, %.preheader7.us.preheader ], [ %indvars.iv.next57, %._crit_edge17.us ]
  br i1 %8, label %.preheader6.us.us.preheader, label %._crit_edge17.us

.preheader6.us.us.preheader:                      ; preds = %.preheader7.us
  br label %.preheader6.us.us

._crit_edge17.us.loopexit:                        ; preds = %._crit_edge14.us.us
  br label %._crit_edge17.us

._crit_edge17.us:                                 ; preds = %._crit_edge17.us.loopexit, %.preheader7.us
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next57, %10
  br i1 %exitcond65, label %.preheader5.loopexit, label %.preheader7.us

.preheader6.us.us:                                ; preds = %.preheader6.us.us.preheader, %._crit_edge14.us.us
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %._crit_edge14.us.us ], [ 0, %.preheader6.us.us.preheader ]
  %15 = mul nsw i64 %indvars.iv52, %indvars.iv56
  br i1 %lcmp.mod64, label %.prol.loopexit62, label %.prol.preheader61

.prol.preheader61:                                ; preds = %.preheader6.us.us
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, %2
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, %9
  %20 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv56, i64 %indvars.iv52, i64 0
  store double %19, double* %20, align 8
  br label %.prol.loopexit62

.prol.loopexit62:                                 ; preds = %.prol.preheader61, %.preheader6.us.us
  %indvars.iv48.unr.ph = phi i64 [ 1, %.prol.preheader61 ], [ 0, %.preheader6.us.us ]
  br i1 %12, label %._crit_edge14.us.us, label %.preheader6.us.us.new.preheader

.preheader6.us.us.new.preheader:                  ; preds = %.prol.loopexit62
  br label %.preheader6.us.us.new

._crit_edge14.us.us.loopexit:                     ; preds = %.preheader6.us.us.new
  br label %._crit_edge14.us.us

._crit_edge14.us.us:                              ; preds = %._crit_edge14.us.us.loopexit, %.prol.loopexit62
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next53, %wide.trip.count54
  br i1 %exitcond55, label %._crit_edge17.us.loopexit, label %.preheader6.us.us

.preheader6.us.us.new:                            ; preds = %.preheader6.us.us.new.preheader, %.preheader6.us.us.new
  %indvars.iv48 = phi i64 [ %indvars.iv.next49.1, %.preheader6.us.us.new ], [ %indvars.iv48.unr.ph, %.preheader6.us.us.new.preheader ]
  %21 = add nsw i64 %15, %indvars.iv48
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, %2
  %24 = sitofp i32 %23 to double
  %25 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv56, i64 %indvars.iv52, i64 %indvars.iv48
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %26 = add nsw i64 %15, %indvars.iv.next49
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, %2
  %29 = sitofp i32 %28 to double
  %30 = insertelement <2 x double> undef, double %24, i32 0
  %31 = insertelement <2 x double> %30, double %29, i32 1
  %32 = fdiv <2 x double> %31, %14
  %33 = bitcast double* %25 to <2 x double>*
  store <2 x double> %32, <2 x double>* %33, align 8
  %indvars.iv.next49.1 = add nuw nsw i64 %indvars.iv48, 2
  %exitcond51.1 = icmp eq i64 %indvars.iv.next49.1, %wide.trip.count50.1
  br i1 %exitcond51.1, label %._crit_edge14.us.us.loopexit, label %.preheader6.us.us.new

.preheader5.loopexit:                             ; preds = %._crit_edge17.us
  br label %.preheader5

.preheader5:                                      ; preds = %.preheader5.loopexit, %.preheader7.lr.ph, %5
  %34 = icmp sgt i32 %2, 0
  br i1 %34, label %.preheader.lr.ph, label %._crit_edge9

.preheader.lr.ph:                                 ; preds = %.preheader5
  %35 = sitofp i32 %2 to double
  %36 = sext i32 %2 to i64
  %37 = and i32 %2, 1
  %lcmp.mod = icmp eq i32 %37, 0
  %38 = icmp eq i32 %2, 1
  %wide.trip.count.1 = zext i32 %2 to i64
  %39 = fdiv double 0.000000e+00, %35
  %40 = insertelement <2 x double> undef, double %35, i32 0
  %41 = shufflevector <2 x double> %40, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv45 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next46, %._crit_edge.us ]
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  %42 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv45, i64 0
  store double %39, double* %42, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us ]
  br i1 %38, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ]
  %43 = mul nsw i64 %indvars.iv, %indvars.iv45
  %44 = trunc i64 %43 to i32
  %45 = srem i32 %44, %2
  %46 = sitofp i32 %45 to double
  %47 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv45, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %48 = mul nsw i64 %indvars.iv.next, %indvars.iv45
  %49 = trunc i64 %48 to i32
  %50 = srem i32 %49, %2
  %51 = sitofp i32 %50 to double
  %52 = insertelement <2 x double> undef, double %46, i32 0
  %53 = insertelement <2 x double> %52, double %51, i32 1
  %54 = fdiv <2 x double> %53, %41
  %55 = bitcast double* %47 to <2 x double>*
  store <2 x double> %54, <2 x double>* %55, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond = icmp eq i64 %indvars.iv.next46, %36
  br i1 %exitcond, label %._crit_edge9.loopexit, label %.preheader.us

._crit_edge9.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %.preheader5
  ret void
}

declare void @polybench_timer_start(...) #2

declare void @polybench_timer_stop(...) #2

declare void @polybench_timer_print(...) #2

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, i32, [140 x [160 x double]]* nocapture readonly) #1 {
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #5
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.preheader3.lr.ph, label %._crit_edge9

.preheader3.lr.ph:                                ; preds = %4
  %10 = icmp sgt i32 %1, 0
  %11 = icmp sgt i32 %2, 0
  br i1 %10, label %.preheader3.us.preheader, label %._crit_edge9

.preheader3.us.preheader:                         ; preds = %.preheader3.lr.ph
  %12 = sext i32 %0 to i64
  %13 = sext i32 %1 to i64
  %wide.trip.count = zext i32 %2 to i64
  %wide.trip.count33 = zext i32 %1 to i64
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %._crit_edge4.us, %.preheader3.us.preheader
  %indvars.iv35 = phi i64 [ 0, %.preheader3.us.preheader ], [ %indvars.iv.next36, %._crit_edge4.us ]
  br i1 %11, label %.preheader.us.us.preheader, label %._crit_edge4.us

.preheader.us.us.preheader:                       ; preds = %.preheader3.us
  %14 = mul nsw i64 %13, %indvars.iv35
  %15 = trunc i64 %14 to i32
  br label %.preheader.us.us

._crit_edge4.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge4.us

._crit_edge4.us:                                  ; preds = %._crit_edge4.us.loopexit, %.preheader3.us
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond = icmp eq i64 %indvars.iv.next36, %12
  br i1 %exitcond, label %._crit_edge9.loopexit, label %.preheader3.us

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %16 = trunc i64 %indvars.iv31 to i32
  %17 = add i32 %16, %15
  %18 = mul i32 %17, %2
  %19 = zext i32 %18 to i64
  br label %20

._crit_edge.us.us:                                ; preds = %27
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next32, %wide.trip.count33
  br i1 %exitcond34, label %._crit_edge4.us.loopexit, label %.preheader.us.us

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
  %29 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv35, i64 %indvars.iv31, i64 %indvars.iv
  %30 = load double, double* %29, align 8
  %31 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %30) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond30, label %._crit_edge.us.us, label %20

._crit_edge9.loopexit:                            ; preds = %._crit_edge4.us
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %.preheader3.lr.ph, %4
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %35 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %34) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

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
!6 = distinct !{!6, !2}
!7 = !{!8}
!8 = distinct !{!8, !9}
!9 = distinct !{!9, !"LVerDomain"}
!10 = !{!11}
!11 = distinct !{!11, !9}
!12 = distinct !{!12, !2}
!13 = distinct !{!13, !4, !5}
