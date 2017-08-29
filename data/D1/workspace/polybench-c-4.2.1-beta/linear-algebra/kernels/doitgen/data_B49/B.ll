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
  %11 = zext i32 %2 to i64
  %12 = and i32 %2, 1
  %scevgep87 = getelementptr double, double* %5, i64 %8
  %13 = add nsw i64 %9, -1
  %14 = add nsw i64 %8, -4
  %15 = lshr i64 %14, 2
  %16 = add nuw nsw i64 %15, 1
  %17 = add nsw i64 %8, -1
  %18 = icmp sgt i32 %1, 0
  %19 = icmp sgt i32 %2, 0
  %20 = icmp eq i32 %12, 0
  %21 = icmp eq i32 %2, 1
  %sunkaddr79 = ptrtoint double* %5 to i64
  %sunkaddr = ptrtoint double* %5 to i64
  %min.iters.check = icmp ult i32 %2, 4
  %n.vec = and i64 %8, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %xtraiter93 = and i64 %16, 3
  %lcmp.mod94 = icmp eq i64 %xtraiter93, 0
  %22 = icmp ult i64 %14, 12
  %cmp.n = icmp eq i64 %8, %n.vec
  %xtraiter = and i64 %9, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %23 = icmp ult i64 %13, 7
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge18, %.preheader6.lr.ph
  %indvars.iv67 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next68, %._crit_edge18 ]
  br i1 %18, label %.preheader5.lr.ph, label %._crit_edge18

.preheader5.lr.ph:                                ; preds = %.preheader6
  br i1 %19, label %.lr.ph.us.us.preheader.preheader, label %.preheader5.preheader

.preheader5.preheader:                            ; preds = %.preheader5.lr.ph
  br i1 %lcmp.mod, label %.preheader5.prol.loopexit, label %.preheader5.prol.preheader

.preheader5.prol.preheader:                       ; preds = %.preheader5.preheader
  br label %.preheader5.prol

.preheader5.prol:                                 ; preds = %.preheader5.prol, %.preheader5.prol.preheader
  %indvars.iv51.prol = phi i64 [ %indvars.iv.next52.prol, %.preheader5.prol ], [ 0, %.preheader5.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader5.prol ], [ %xtraiter, %.preheader5.prol.preheader ]
  %indvars.iv.next52.prol = add nuw nsw i64 %indvars.iv51.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader5.prol.loopexit.unr-lcssa, label %.preheader5.prol, !llvm.loop !1

.preheader5.prol.loopexit.unr-lcssa:              ; preds = %.preheader5.prol
  br label %.preheader5.prol.loopexit

.preheader5.prol.loopexit:                        ; preds = %.preheader5.preheader, %.preheader5.prol.loopexit.unr-lcssa
  %indvars.iv51.unr = phi i64 [ 0, %.preheader5.preheader ], [ %indvars.iv.next52.prol, %.preheader5.prol.loopexit.unr-lcssa ]
  br i1 %23, label %._crit_edge18.loopexit92, label %.preheader5.preheader.new

.preheader5.preheader.new:                        ; preds = %.preheader5.prol.loopexit
  br label %.preheader5

.lr.ph.us.us.preheader.preheader:                 ; preds = %.preheader5.lr.ph
  br label %.lr.ph.us.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph.us.us.preheader.preheader, %._crit_edge16.us
  %indvars.iv65 = phi i64 [ %indvars.iv.next66, %._crit_edge16.us ], [ 0, %.lr.ph.us.us.preheader.preheader ]
  %scevgep = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 0
  %24 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 0
  br label %.lr.ph.us.us

._crit_edge16.us.loopexit.unr-lcssa:              ; preds = %.lr.ph15.us
  br label %._crit_edge16.us.loopexit

._crit_edge16.us.loopexit:                        ; preds = %.lr.ph15.us.prol.loopexit, %._crit_edge16.us.loopexit.unr-lcssa
  br label %._crit_edge16.us

._crit_edge16.us:                                 ; preds = %._crit_edge16.us.loopexit, %middle.block
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond74 = icmp eq i64 %indvars.iv.next66, %9
  br i1 %exitcond74, label %._crit_edge18.loopexit, label %.lr.ph.us.us.preheader

.lr.ph15.us:                                      ; preds = %.lr.ph15.us, %.lr.ph15.us.preheader91.new
  %indvars.iv63 = phi i64 [ %indvars.iv63.unr, %.lr.ph15.us.preheader91.new ], [ %indvars.iv.next64.3, %.lr.ph15.us ]
  %25 = getelementptr inbounds double, double* %5, i64 %indvars.iv63
  %26 = bitcast double* %25 to i64*
  %27 = load i64, i64* %26, align 8
  %28 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %indvars.iv63
  %29 = bitcast double* %28 to i64*
  store i64 %27, i64* %29, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %30 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next64
  %31 = bitcast double* %30 to i64*
  %32 = load i64, i64* %31, align 8
  %33 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %indvars.iv.next64
  %34 = bitcast double* %33 to i64*
  store i64 %32, i64* %34, align 8
  %indvars.iv.next64.1 = add nsw i64 %indvars.iv63, 2
  %35 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next64.1
  %36 = bitcast double* %35 to i64*
  %37 = load i64, i64* %36, align 8
  %38 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %indvars.iv.next64.1
  %39 = bitcast double* %38 to i64*
  store i64 %37, i64* %39, align 8
  %indvars.iv.next64.2 = add nsw i64 %indvars.iv63, 3
  %40 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next64.2
  %41 = bitcast double* %40 to i64*
  %42 = load i64, i64* %41, align 8
  %43 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %indvars.iv.next64.2
  %44 = bitcast double* %43 to i64*
  store i64 %42, i64* %44, align 8
  %indvars.iv.next64.3 = add nsw i64 %indvars.iv63, 4
  %exitcond73.3 = icmp eq i64 %indvars.iv.next64.3, %8
  br i1 %exitcond73.3, label %._crit_edge16.us.loopexit.unr-lcssa, label %.lr.ph15.us, !llvm.loop !3

.lr.ph15.us.preheader:                            ; preds = %._crit_edge.us.us
  %scevgep85 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %8
  br i1 %min.iters.check, label %.lr.ph15.us.preheader91, label %min.iters.checked

.lr.ph15.us.preheader91:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph15.us.preheader
  %indvars.iv63.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph15.us.preheader ], [ %n.vec, %middle.block ]
  %45 = sub nsw i64 %8, %indvars.iv63.ph
  %46 = sub nsw i64 %17, %indvars.iv63.ph
  %xtraiter96 = and i64 %45, 3
  %lcmp.mod97 = icmp eq i64 %xtraiter96, 0
  br i1 %lcmp.mod97, label %.lr.ph15.us.prol.loopexit, label %.lr.ph15.us.prol.preheader

.lr.ph15.us.prol.preheader:                       ; preds = %.lr.ph15.us.preheader91
  br label %.lr.ph15.us.prol

.lr.ph15.us.prol:                                 ; preds = %.lr.ph15.us.prol, %.lr.ph15.us.prol.preheader
  %indvars.iv63.prol = phi i64 [ %indvars.iv.next64.prol, %.lr.ph15.us.prol ], [ %indvars.iv63.ph, %.lr.ph15.us.prol.preheader ]
  %prol.iter98 = phi i64 [ %prol.iter98.sub, %.lr.ph15.us.prol ], [ %xtraiter96, %.lr.ph15.us.prol.preheader ]
  %47 = getelementptr inbounds double, double* %5, i64 %indvars.iv63.prol
  %48 = bitcast double* %47 to i64*
  %49 = load i64, i64* %48, align 8
  %50 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %indvars.iv63.prol
  %51 = bitcast double* %50 to i64*
  store i64 %49, i64* %51, align 8
  %indvars.iv.next64.prol = add nuw nsw i64 %indvars.iv63.prol, 1
  %prol.iter98.sub = add i64 %prol.iter98, -1
  %prol.iter98.cmp = icmp eq i64 %prol.iter98.sub, 0
  br i1 %prol.iter98.cmp, label %.lr.ph15.us.prol.loopexit.unr-lcssa, label %.lr.ph15.us.prol, !llvm.loop !6

.lr.ph15.us.prol.loopexit.unr-lcssa:              ; preds = %.lr.ph15.us.prol
  br label %.lr.ph15.us.prol.loopexit

.lr.ph15.us.prol.loopexit:                        ; preds = %.lr.ph15.us.preheader91, %.lr.ph15.us.prol.loopexit.unr-lcssa
  %indvars.iv63.unr = phi i64 [ %indvars.iv63.ph, %.lr.ph15.us.preheader91 ], [ %indvars.iv.next64.prol, %.lr.ph15.us.prol.loopexit.unr-lcssa ]
  %52 = icmp ult i64 %46, 3
  br i1 %52, label %._crit_edge16.us.loopexit, label %.lr.ph15.us.preheader91.new

.lr.ph15.us.preheader91.new:                      ; preds = %.lr.ph15.us.prol.loopexit
  br label %.lr.ph15.us

min.iters.checked:                                ; preds = %.lr.ph15.us.preheader
  br i1 %cmp.zero, label %.lr.ph15.us.preheader91, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep87
  %bound1 = icmp ugt double* %scevgep85, %5
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.lr.ph15.us.preheader91, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br i1 %lcmp.mod94, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter95 = phi i64 [ %prol.iter95.sub, %vector.body.prol ], [ %xtraiter93, %vector.body.prol.preheader ]
  %53 = getelementptr inbounds double, double* %5, i64 %index.prol
  %54 = bitcast double* %53 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %54, align 8, !alias.scope !7
  %55 = getelementptr double, double* %53, i64 2
  %56 = bitcast double* %55 to <2 x i64>*
  %wide.load90.prol = load <2 x i64>, <2 x i64>* %56, align 8, !alias.scope !7
  %57 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %index.prol
  %58 = bitcast double* %57 to <2 x i64>*
  store <2 x i64> %wide.load.prol, <2 x i64>* %58, align 8, !alias.scope !10, !noalias !7
  %59 = getelementptr double, double* %57, i64 2
  %60 = bitcast double* %59 to <2 x i64>*
  store <2 x i64> %wide.load90.prol, <2 x i64>* %60, align 8, !alias.scope !10, !noalias !7
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter95.sub = add i64 %prol.iter95, -1
  %prol.iter95.cmp = icmp eq i64 %prol.iter95.sub, 0
  br i1 %prol.iter95.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !12

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  br i1 %22, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %61 = getelementptr inbounds double, double* %5, i64 %index
  %62 = bitcast double* %61 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %62, align 8, !alias.scope !7
  %63 = getelementptr double, double* %61, i64 2
  %64 = bitcast double* %63 to <2 x i64>*
  %wide.load90 = load <2 x i64>, <2 x i64>* %64, align 8, !alias.scope !7
  %65 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %index
  %66 = bitcast double* %65 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %66, align 8, !alias.scope !10, !noalias !7
  %67 = getelementptr double, double* %65, i64 2
  %68 = bitcast double* %67 to <2 x i64>*
  store <2 x i64> %wide.load90, <2 x i64>* %68, align 8, !alias.scope !10, !noalias !7
  %index.next = add i64 %index, 4
  %69 = getelementptr inbounds double, double* %5, i64 %index.next
  %70 = bitcast double* %69 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %70, align 8, !alias.scope !7
  %71 = getelementptr double, double* %69, i64 2
  %72 = bitcast double* %71 to <2 x i64>*
  %wide.load90.1 = load <2 x i64>, <2 x i64>* %72, align 8, !alias.scope !7
  %73 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %index.next
  %74 = bitcast double* %73 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %74, align 8, !alias.scope !10, !noalias !7
  %75 = getelementptr double, double* %73, i64 2
  %76 = bitcast double* %75 to <2 x i64>*
  store <2 x i64> %wide.load90.1, <2 x i64>* %76, align 8, !alias.scope !10, !noalias !7
  %index.next.1 = add i64 %index, 8
  %77 = getelementptr inbounds double, double* %5, i64 %index.next.1
  %78 = bitcast double* %77 to <2 x i64>*
  %wide.load.2 = load <2 x i64>, <2 x i64>* %78, align 8, !alias.scope !7
  %79 = getelementptr double, double* %77, i64 2
  %80 = bitcast double* %79 to <2 x i64>*
  %wide.load90.2 = load <2 x i64>, <2 x i64>* %80, align 8, !alias.scope !7
  %81 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %index.next.1
  %82 = bitcast double* %81 to <2 x i64>*
  store <2 x i64> %wide.load.2, <2 x i64>* %82, align 8, !alias.scope !10, !noalias !7
  %83 = getelementptr double, double* %81, i64 2
  %84 = bitcast double* %83 to <2 x i64>*
  store <2 x i64> %wide.load90.2, <2 x i64>* %84, align 8, !alias.scope !10, !noalias !7
  %index.next.2 = add i64 %index, 12
  %85 = getelementptr inbounds double, double* %5, i64 %index.next.2
  %86 = bitcast double* %85 to <2 x i64>*
  %wide.load.3 = load <2 x i64>, <2 x i64>* %86, align 8, !alias.scope !7
  %87 = getelementptr double, double* %85, i64 2
  %88 = bitcast double* %87 to <2 x i64>*
  %wide.load90.3 = load <2 x i64>, <2 x i64>* %88, align 8, !alias.scope !7
  %89 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %index.next.2
  %90 = bitcast double* %89 to <2 x i64>*
  store <2 x i64> %wide.load.3, <2 x i64>* %90, align 8, !alias.scope !10, !noalias !7
  %91 = getelementptr double, double* %89, i64 2
  %92 = bitcast double* %91 to <2 x i64>*
  store <2 x i64> %wide.load90.3, <2 x i64>* %92, align 8, !alias.scope !10, !noalias !7
  %index.next.3 = add i64 %index, 16
  %93 = icmp eq i64 %index.next.3, %n.vec
  br i1 %93, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !13

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  br i1 %cmp.n, label %._crit_edge16.us, label %.lr.ph15.us.preheader91

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge.us.us
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %._crit_edge.us.us ], [ 0, %.lr.ph.us.us.preheader ]
  %94 = getelementptr inbounds double, double* %5, i64 %indvars.iv59
  store double 0.000000e+00, double* %94, align 8
  br i1 %20, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  %95 = load double, double* %24, align 8
  %96 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv59
  %97 = load double, double* %96, align 8
  %98 = fmul double %95, %97
  %99 = fadd double %98, 0.000000e+00
  %sunkaddr76 = shl i64 %indvars.iv59, 3
  %sunkaddr77 = add i64 %sunkaddr, %sunkaddr76
  %sunkaddr78 = inttoptr i64 %sunkaddr77 to double*
  store double %99, double* %sunkaddr78, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph.us.us
  %100 = phi double [ %99, %.prol.preheader ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv55.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph.us.us ]
  br i1 %21, label %._crit_edge.us.us, label %.lr.ph.us.us.new.preheader

.lr.ph.us.us.new.preheader:                       ; preds = %.prol.loopexit
  %sunkaddr80 = shl i64 %indvars.iv59, 3
  %sunkaddr81 = add i64 %sunkaddr79, %sunkaddr80
  %sunkaddr82 = inttoptr i64 %sunkaddr81 to double*
  br label %.lr.ph.us.us.new

._crit_edge.us.us.loopexit:                       ; preds = %.lr.ph.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %.prol.loopexit
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next60, %11
  br i1 %exitcond62, label %.lr.ph15.us.preheader, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new.preheader, %.lr.ph.us.us.new
  %101 = phi double [ %113, %.lr.ph.us.us.new ], [ %100, %.lr.ph.us.us.new.preheader ]
  %indvars.iv55 = phi i64 [ %indvars.iv.next56.1, %.lr.ph.us.us.new ], [ %indvars.iv55.unr.ph, %.lr.ph.us.us.new.preheader ]
  %102 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %indvars.iv55
  %103 = load double, double* %102, align 8
  %104 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv55, i64 %indvars.iv59
  %105 = load double, double* %104, align 8
  %106 = fmul double %103, %105
  %107 = fadd double %106, %101
  store double %107, double* %sunkaddr82, align 8
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %108 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv67, i64 %indvars.iv65, i64 %indvars.iv.next56
  %109 = load double, double* %108, align 8
  %110 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next56, i64 %indvars.iv59
  %111 = load double, double* %110, align 8
  %112 = fmul double %109, %111
  %113 = fadd double %112, %107
  store double %113, double* %sunkaddr82, align 8
  %indvars.iv.next56.1 = add nuw nsw i64 %indvars.iv55, 2
  %exitcond58.1 = icmp eq i64 %indvars.iv.next56.1, %11
  br i1 %exitcond58.1, label %._crit_edge.us.us.loopexit, label %.lr.ph.us.us.new

.preheader5:                                      ; preds = %.preheader5, %.preheader5.preheader.new
  %indvars.iv51 = phi i64 [ %indvars.iv51.unr, %.preheader5.preheader.new ], [ %indvars.iv.next52.7, %.preheader5 ]
  %indvars.iv.next52.7 = add nsw i64 %indvars.iv51, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next52.7, %9
  br i1 %exitcond.7, label %._crit_edge18.loopexit92.unr-lcssa, label %.preheader5

._crit_edge18.loopexit:                           ; preds = %._crit_edge16.us
  br label %._crit_edge18

._crit_edge18.loopexit92.unr-lcssa:               ; preds = %.preheader5
  br label %._crit_edge18.loopexit92

._crit_edge18.loopexit92:                         ; preds = %.preheader5.prol.loopexit, %._crit_edge18.loopexit92.unr-lcssa
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge18.loopexit92, %._crit_edge18.loopexit, %.preheader6
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond75 = icmp eq i64 %indvars.iv.next68, %10
  br i1 %exitcond75, label %._crit_edge35.loopexit, label %.preheader6

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
.preheader7.lr.ph:
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge19.us, %.preheader7.lr.ph
  %indvars.iv59 = phi i64 [ 0, %.preheader7.lr.ph ], [ %indvars.iv.next60, %._crit_edge19.us ]
  br label %.preheader6.us.us

._crit_edge19.us:                                 ; preds = %._crit_edge16.us.us
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next60, 150
  br i1 %exitcond65, label %.preheader.us.preheader, label %.preheader7.us

.preheader.us.preheader:                          ; preds = %._crit_edge19.us
  br label %.preheader.us

.preheader6.us.us:                                ; preds = %.preheader7.us, %._crit_edge16.us.us
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %._crit_edge16.us.us ], [ 0, %.preheader7.us ]
  %5 = mul nuw nsw i64 %indvars.iv55, %indvars.iv59
  br label %6

._crit_edge16.us.us:                              ; preds = %6
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next56, 140
  br i1 %exitcond58, label %._crit_edge19.us, label %.preheader6.us.us

; <label>:6:                                      ; preds = %6, %.preheader6.us.us
  %indvars.iv51 = phi i64 [ 0, %.preheader6.us.us ], [ %indvars.iv.next52.1, %6 ]
  %7 = add nuw nsw i64 %5, %indvars.iv51
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 160
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv59, i64 %indvars.iv55, i64 %indvars.iv51
  %indvars.iv.next52 = or i64 %indvars.iv51, 1
  %12 = add nuw nsw i64 %5, %indvars.iv.next52
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 160
  %15 = sitofp i32 %14 to double
  %16 = insertelement <2 x double> undef, double %10, i32 0
  %17 = insertelement <2 x double> %16, double %15, i32 1
  %18 = fdiv <2 x double> %17, <double 1.600000e+02, double 1.600000e+02>
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %indvars.iv.next52.1 = add nsw i64 %indvars.iv51, 2
  %exitcond54.1 = icmp eq i64 %indvars.iv.next52.1, 160
  br i1 %exitcond54.1, label %._crit_edge16.us.us, label %6

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %20

; <label>:20:                                     ; preds = %20, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %20 ]
  %21 = mul nuw nsw i64 %indvars.iv48, %indvars.iv
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 160
  %24 = sitofp i32 %23 to double
  %25 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv48, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %26 = mul nuw nsw i64 %indvars.iv48, %indvars.iv.next
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
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next49, 160
  br i1 %exitcond64, label %._crit_edge10, label %.preheader.us

._crit_edge10:                                    ; preds = %._crit_edge.us
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

.preheader3.us:                                   ; preds = %._crit_edge5.us, %.preheader3.lr.ph
  %indvars.iv37 = phi i64 [ 0, %.preheader3.lr.ph ], [ %indvars.iv.next38, %._crit_edge5.us ]
  %8 = mul nuw nsw i64 %indvars.iv37, 140
  br label %.preheader.us.us

._crit_edge5.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond = icmp eq i64 %indvars.iv.next38, 150
  br i1 %exitcond, label %._crit_edge10, label %.preheader3.us

.preheader.us.us:                                 ; preds = %.preheader3.us, %._crit_edge.us.us
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %._crit_edge.us.us ], [ 0, %.preheader3.us ]
  %9 = add nuw nsw i64 %8, %indvars.iv33
  %10 = mul nuw nsw i64 %9, 160
  br label %11

._crit_edge.us.us:                                ; preds = %18
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next34, 140
  br i1 %exitcond36, label %._crit_edge5.us, label %.preheader.us.us

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

; <label>:18:                                     ; preds = %16, %11
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv37, i64 %indvars.iv33, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond32, label %._crit_edge.us.us, label %11

._crit_edge10:                                    ; preds = %._crit_edge5.us
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
!6 = distinct !{!6, !2}
!7 = !{!8}
!8 = distinct !{!8, !9}
!9 = distinct !{!9, !"LVerDomain"}
!10 = !{!11}
!11 = distinct !{!11, !9}
!12 = distinct !{!12, !2}
!13 = distinct !{!13, !4, !5}
