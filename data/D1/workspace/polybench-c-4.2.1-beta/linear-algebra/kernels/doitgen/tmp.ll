; ModuleID = 'B.ll'
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
define void @kernel_doitgen(i32, i32, i32, [140 x [160 x double]]*, [160 x double]*, double*) #0 {
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader6.lr.ph, label %._crit_edge

.preheader6.lr.ph:                                ; preds = %6
  %8 = sext i32 %2 to i64
  %9 = sext i32 %1 to i64
  %10 = add i32 %2, -1
  %11 = zext i32 %10 to i64
  %12 = sext i32 %0 to i64
  %scevgep87 = getelementptr double, double* %5, i64 %8
  %13 = add nsw i64 %9, -1
  %14 = add nsw i64 %8, -4
  %15 = lshr i64 %14, 2
  %16 = add nuw nsw i64 %15, 1
  %17 = add nsw i64 %8, -1
  %18 = icmp sgt i32 %1, 0
  %19 = icmp sgt i32 %2, 0
  %20 = and i64 %11, 1
  %lcmp.mod94 = icmp eq i64 %20, 0
  %sunkaddr.prol = ptrtoint double* %5 to i64
  %21 = icmp eq i32 %10, 0
  %sunkaddr = ptrtoint double* %5 to i64
  %sunkaddr.1 = ptrtoint double* %5 to i64
  %min.iters.check = icmp ult i32 %2, 4
  %n.vec = and i64 %8, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %xtraiter95 = and i64 %16, 3
  %lcmp.mod96 = icmp eq i64 %xtraiter95, 0
  %22 = icmp ult i64 %14, 12
  %cmp.n = icmp eq i64 %8, %n.vec
  %xtraiter = and i64 %9, 7
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %23 = icmp ult i64 %13, 7
  br label %.preheader6

.preheader6:                                      ; preds = %.loopexit16, %.preheader6.lr.ph
  %indvars.iv69 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next70, %.loopexit16 ]
  br i1 %18, label %.preheader5.lr.ph, label %.loopexit16

.preheader5.lr.ph:                                ; preds = %.preheader6
  br i1 %19, label %.preheader5.us..lr.ph.us.us_crit_edge.preheader, label %.loopexit15.preheader

.loopexit15.preheader:                            ; preds = %.preheader5.lr.ph
  br i1 %lcmp.mod, label %.loopexit15.prol.loopexit, label %.loopexit15.prol.preheader

.loopexit15.prol.preheader:                       ; preds = %.loopexit15.preheader
  br label %.loopexit15.prol

.loopexit15.prol:                                 ; preds = %.loopexit15.prol, %.loopexit15.prol.preheader
  %indvars.iv55.prol = phi i64 [ %indvars.iv.next56.prol, %.loopexit15.prol ], [ 0, %.loopexit15.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.loopexit15.prol ], [ %xtraiter, %.loopexit15.prol.preheader ]
  %indvars.iv.next56.prol = add nuw nsw i64 %indvars.iv55.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.loopexit15.prol.loopexit.unr-lcssa, label %.loopexit15.prol, !llvm.loop !1

.loopexit15.prol.loopexit.unr-lcssa:              ; preds = %.loopexit15.prol
  br label %.loopexit15.prol.loopexit

.loopexit15.prol.loopexit:                        ; preds = %.loopexit15.prol.loopexit.unr-lcssa, %.loopexit15.preheader
  %indvars.iv55.unr = phi i64 [ 0, %.loopexit15.preheader ], [ %indvars.iv.next56.prol, %.loopexit15.prol.loopexit.unr-lcssa ]
  br i1 %23, label %.loopexit16.loopexit92, label %.loopexit15.preheader.new

.loopexit15.preheader.new:                        ; preds = %.loopexit15.prol.loopexit
  br label %.loopexit15

.preheader5.us..lr.ph.us.us_crit_edge.preheader:  ; preds = %.preheader5.lr.ph
  br label %.preheader5.us..lr.ph.us.us_crit_edge

.preheader5.us..lr.ph.us.us_crit_edge:            ; preds = %.loopexit15.us, %.preheader5.us..lr.ph.us.us_crit_edge.preheader
  %indvars.iv67 = phi i64 [ %indvars.iv.next68, %.loopexit15.us ], [ 0, %.preheader5.us..lr.ph.us.us_crit_edge.preheader ]
  %scevgep = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 0
  %scevgep85 = getelementptr [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 %8
  %24 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 0
  br label %.lr.ph.us.us

.lr.ph11.us:                                      ; preds = %.lr.ph11.us.preheader91.new, %.lr.ph11.us
  %indvars.iv65 = phi i64 [ %indvars.iv65.unr, %.lr.ph11.us.preheader91.new ], [ %indvars.iv.next66.3, %.lr.ph11.us ]
  %25 = getelementptr inbounds double, double* %5, i64 %indvars.iv65
  %26 = bitcast double* %25 to i64*
  %27 = load i64, i64* %26, align 8
  %28 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 %indvars.iv65
  %29 = bitcast double* %28 to i64*
  store i64 %27, i64* %29, align 8
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %30 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next66
  %31 = bitcast double* %30 to i64*
  %32 = load i64, i64* %31, align 8
  %33 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 %indvars.iv.next66
  %34 = bitcast double* %33 to i64*
  store i64 %32, i64* %34, align 8
  %indvars.iv.next66.1 = add nsw i64 %indvars.iv65, 2
  %35 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next66.1
  %36 = bitcast double* %35 to i64*
  %37 = load i64, i64* %36, align 8
  %38 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 %indvars.iv.next66.1
  %39 = bitcast double* %38 to i64*
  store i64 %37, i64* %39, align 8
  %indvars.iv.next66.2 = add nsw i64 %indvars.iv65, 3
  %40 = getelementptr inbounds double, double* %5, i64 %indvars.iv.next66.2
  %41 = bitcast double* %40 to i64*
  %42 = load i64, i64* %41, align 8
  %43 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 %indvars.iv.next66.2
  %44 = bitcast double* %43 to i64*
  store i64 %42, i64* %44, align 8
  %indvars.iv.next66.3 = add nsw i64 %indvars.iv65, 4
  %exitcond76.3 = icmp eq i64 %indvars.iv.next66.3, %8
  br i1 %exitcond76.3, label %.loopexit15.us.loopexit.unr-lcssa, label %.lr.ph11.us, !llvm.loop !3

.loopexit15.us.loopexit.unr-lcssa:                ; preds = %.lr.ph11.us
  br label %.loopexit15.us.loopexit

.loopexit15.us.loopexit:                          ; preds = %.lr.ph11.us.prol.loopexit, %.loopexit15.us.loopexit.unr-lcssa
  br label %.loopexit15.us

.loopexit15.us:                                   ; preds = %middle.block, %.loopexit15.us.loopexit
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next68, %9
  br i1 %exitcond77, label %.loopexit16.loopexit, label %.preheader5.us..lr.ph.us.us_crit_edge

.lr.ph.us.us:                                     ; preds = %.loopexit.us.us, %.preheader5.us..lr.ph.us.us_crit_edge
  %indvars.iv63 = phi i64 [ 0, %.preheader5.us..lr.ph.us.us_crit_edge ], [ %indvars.iv.next64, %.loopexit.us.us ]
  %45 = getelementptr inbounds double, double* %5, i64 %indvars.iv63
  store double 0.000000e+00, double* %45, align 8
  br i1 %lcmp.mod94, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph.us.us
  br label %46

; <label>:46:                                     ; preds = %.prol.preheader
  %47 = load double, double* %24, align 8
  %48 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 0, i64 %indvars.iv63
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = fadd double %50, 0.000000e+00
  %sunkaddr79.prol = shl nuw nsw i64 %indvars.iv63, 3
  %sunkaddr80.prol = add i64 %sunkaddr.prol, %sunkaddr79.prol
  %sunkaddr81.prol = inttoptr i64 %sunkaddr80.prol to double*
  store double %51, double* %sunkaddr81.prol, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %46, %.lr.ph.us.us
  %.unr.ph = phi double [ %51, %46 ], [ 0.000000e+00, %.lr.ph.us.us ]
  %indvars.iv59.unr.ph = phi i64 [ 1, %46 ], [ 0, %.lr.ph.us.us ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %21, label %.loopexit.us.us, label %.lr.ph.us.us.new

.lr.ph.us.us.new:                                 ; preds = %.prol.loopexit
  %sunkaddr79 = shl nuw nsw i64 %indvars.iv63, 3
  %sunkaddr80 = add i64 %sunkaddr, %sunkaddr79
  %sunkaddr81 = inttoptr i64 %sunkaddr80 to double*
  %sunkaddr79.1 = shl nuw nsw i64 %indvars.iv63, 3
  %sunkaddr80.1 = add i64 %sunkaddr.1, %sunkaddr79.1
  %sunkaddr81.1 = inttoptr i64 %sunkaddr80.1 to double*
  br label %101

.loopexit.us.us.unr-lcssa:                        ; preds = %101
  br label %.loopexit.us.us

.loopexit.us.us:                                  ; preds = %.loopexit.us.us.unr-lcssa, %.prol.loopexit
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond75 = icmp eq i64 %indvars.iv.next64, %8
  br i1 %exitcond75, label %.lr.ph11.us.preheader, label %.lr.ph.us.us

.lr.ph11.us.preheader:                            ; preds = %.loopexit.us.us
  br i1 %min.iters.check, label %.lr.ph11.us.preheader91, label %min.iters.checked

.lr.ph11.us.preheader91:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph11.us.preheader
  %indvars.iv65.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.lr.ph11.us.preheader ], [ %n.vec, %middle.block ]
  %52 = sub nsw i64 %8, %indvars.iv65.ph
  %53 = sub nsw i64 %17, %indvars.iv65.ph
  %xtraiter98 = and i64 %52, 3
  %lcmp.mod99 = icmp eq i64 %xtraiter98, 0
  br i1 %lcmp.mod99, label %.lr.ph11.us.prol.loopexit, label %.lr.ph11.us.prol.preheader

.lr.ph11.us.prol.preheader:                       ; preds = %.lr.ph11.us.preheader91
  br label %.lr.ph11.us.prol

.lr.ph11.us.prol:                                 ; preds = %.lr.ph11.us.prol, %.lr.ph11.us.prol.preheader
  %indvars.iv65.prol = phi i64 [ %indvars.iv.next66.prol, %.lr.ph11.us.prol ], [ %indvars.iv65.ph, %.lr.ph11.us.prol.preheader ]
  %prol.iter100 = phi i64 [ %prol.iter100.sub, %.lr.ph11.us.prol ], [ %xtraiter98, %.lr.ph11.us.prol.preheader ]
  %54 = getelementptr inbounds double, double* %5, i64 %indvars.iv65.prol
  %55 = bitcast double* %54 to i64*
  %56 = load i64, i64* %55, align 8
  %57 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 %indvars.iv65.prol
  %58 = bitcast double* %57 to i64*
  store i64 %56, i64* %58, align 8
  %indvars.iv.next66.prol = add nuw nsw i64 %indvars.iv65.prol, 1
  %prol.iter100.sub = add i64 %prol.iter100, -1
  %prol.iter100.cmp = icmp eq i64 %prol.iter100.sub, 0
  br i1 %prol.iter100.cmp, label %.lr.ph11.us.prol.loopexit.unr-lcssa, label %.lr.ph11.us.prol, !llvm.loop !6

.lr.ph11.us.prol.loopexit.unr-lcssa:              ; preds = %.lr.ph11.us.prol
  br label %.lr.ph11.us.prol.loopexit

.lr.ph11.us.prol.loopexit:                        ; preds = %.lr.ph11.us.prol.loopexit.unr-lcssa, %.lr.ph11.us.preheader91
  %indvars.iv65.unr = phi i64 [ %indvars.iv65.ph, %.lr.ph11.us.preheader91 ], [ %indvars.iv.next66.prol, %.lr.ph11.us.prol.loopexit.unr-lcssa ]
  %59 = icmp ult i64 %53, 3
  br i1 %59, label %.loopexit15.us.loopexit, label %.lr.ph11.us.preheader91.new

.lr.ph11.us.preheader91.new:                      ; preds = %.lr.ph11.us.prol.loopexit
  br label %.lr.ph11.us

min.iters.checked:                                ; preds = %.lr.ph11.us.preheader
  br i1 %cmp.zero, label %.lr.ph11.us.preheader91, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %scevgep87
  %bound1 = icmp ugt double* %scevgep85, %5
  %memcheck.conflict = and i1 %bound0, %bound1
  br i1 %memcheck.conflict, label %.lr.ph11.us.preheader91, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br i1 %lcmp.mod96, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter97 = phi i64 [ %prol.iter97.sub, %vector.body.prol ], [ %xtraiter95, %vector.body.prol.preheader ]
  %60 = getelementptr inbounds double, double* %5, i64 %index.prol
  %61 = bitcast double* %60 to <2 x i64>*
  %wide.load.prol = load <2 x i64>, <2 x i64>* %61, align 8, !alias.scope !7
  %62 = getelementptr double, double* %60, i64 2
  %63 = bitcast double* %62 to <2 x i64>*
  %wide.load90.prol = load <2 x i64>, <2 x i64>* %63, align 8, !alias.scope !7
  %64 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 %index.prol
  %65 = bitcast double* %64 to <2 x i64>*
  store <2 x i64> %wide.load.prol, <2 x i64>* %65, align 8, !alias.scope !10, !noalias !7
  %66 = getelementptr double, double* %64, i64 2
  %67 = bitcast double* %66 to <2 x i64>*
  store <2 x i64> %wide.load90.prol, <2 x i64>* %67, align 8, !alias.scope !10, !noalias !7
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter97.sub = add i64 %prol.iter97, -1
  %prol.iter97.cmp = icmp eq i64 %prol.iter97.sub, 0
  br i1 %prol.iter97.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !12

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.prol.loopexit.unr-lcssa, %vector.body.preheader
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  br i1 %22, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %68 = getelementptr inbounds double, double* %5, i64 %index
  %69 = bitcast double* %68 to <2 x i64>*
  %wide.load = load <2 x i64>, <2 x i64>* %69, align 8, !alias.scope !7
  %70 = getelementptr double, double* %68, i64 2
  %71 = bitcast double* %70 to <2 x i64>*
  %wide.load90 = load <2 x i64>, <2 x i64>* %71, align 8, !alias.scope !7
  %72 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 %index
  %73 = bitcast double* %72 to <2 x i64>*
  store <2 x i64> %wide.load, <2 x i64>* %73, align 8, !alias.scope !10, !noalias !7
  %74 = getelementptr double, double* %72, i64 2
  %75 = bitcast double* %74 to <2 x i64>*
  store <2 x i64> %wide.load90, <2 x i64>* %75, align 8, !alias.scope !10, !noalias !7
  %index.next = add i64 %index, 4
  %76 = getelementptr inbounds double, double* %5, i64 %index.next
  %77 = bitcast double* %76 to <2 x i64>*
  %wide.load.1 = load <2 x i64>, <2 x i64>* %77, align 8, !alias.scope !7
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x i64>*
  %wide.load90.1 = load <2 x i64>, <2 x i64>* %79, align 8, !alias.scope !7
  %80 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 %index.next
  %81 = bitcast double* %80 to <2 x i64>*
  store <2 x i64> %wide.load.1, <2 x i64>* %81, align 8, !alias.scope !10, !noalias !7
  %82 = getelementptr double, double* %80, i64 2
  %83 = bitcast double* %82 to <2 x i64>*
  store <2 x i64> %wide.load90.1, <2 x i64>* %83, align 8, !alias.scope !10, !noalias !7
  %index.next.1 = add i64 %index, 8
  %84 = getelementptr inbounds double, double* %5, i64 %index.next.1
  %85 = bitcast double* %84 to <2 x i64>*
  %wide.load.2 = load <2 x i64>, <2 x i64>* %85, align 8, !alias.scope !7
  %86 = getelementptr double, double* %84, i64 2
  %87 = bitcast double* %86 to <2 x i64>*
  %wide.load90.2 = load <2 x i64>, <2 x i64>* %87, align 8, !alias.scope !7
  %88 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 %index.next.1
  %89 = bitcast double* %88 to <2 x i64>*
  store <2 x i64> %wide.load.2, <2 x i64>* %89, align 8, !alias.scope !10, !noalias !7
  %90 = getelementptr double, double* %88, i64 2
  %91 = bitcast double* %90 to <2 x i64>*
  store <2 x i64> %wide.load90.2, <2 x i64>* %91, align 8, !alias.scope !10, !noalias !7
  %index.next.2 = add i64 %index, 12
  %92 = getelementptr inbounds double, double* %5, i64 %index.next.2
  %93 = bitcast double* %92 to <2 x i64>*
  %wide.load.3 = load <2 x i64>, <2 x i64>* %93, align 8, !alias.scope !7
  %94 = getelementptr double, double* %92, i64 2
  %95 = bitcast double* %94 to <2 x i64>*
  %wide.load90.3 = load <2 x i64>, <2 x i64>* %95, align 8, !alias.scope !7
  %96 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 %index.next.2
  %97 = bitcast double* %96 to <2 x i64>*
  store <2 x i64> %wide.load.3, <2 x i64>* %97, align 8, !alias.scope !10, !noalias !7
  %98 = getelementptr double, double* %96, i64 2
  %99 = bitcast double* %98 to <2 x i64>*
  store <2 x i64> %wide.load90.3, <2 x i64>* %99, align 8, !alias.scope !10, !noalias !7
  %index.next.3 = add i64 %index, 16
  %100 = icmp eq i64 %index.next.3, %n.vec
  br i1 %100, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !13

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.unr-lcssa, %vector.body.prol.loopexit
  br i1 %cmp.n, label %.loopexit15.us, label %.lr.ph11.us.preheader91

; <label>:101:                                    ; preds = %101, %.lr.ph.us.us.new
  %102 = phi double [ %.unr.ph, %.lr.ph.us.us.new ], [ %114, %101 ]
  %indvars.iv59 = phi i64 [ %indvars.iv59.unr.ph, %.lr.ph.us.us.new ], [ %indvars.iv.next60.1, %101 ]
  %103 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 %indvars.iv59
  %104 = load double, double* %103, align 8
  %105 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv59, i64 %indvars.iv63
  %106 = load double, double* %105, align 8
  %107 = fmul double %104, %106
  %108 = fadd double %107, %102
  store double %108, double* %sunkaddr81, align 8
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %109 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv69, i64 %indvars.iv67, i64 %indvars.iv.next60
  %110 = load double, double* %109, align 8
  %111 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv.next60, i64 %indvars.iv63
  %112 = load double, double* %111, align 8
  %113 = fmul double %110, %112
  %114 = fadd double %113, %108
  store double %114, double* %sunkaddr81.1, align 8
  %exitcond62.1 = icmp eq i64 %indvars.iv.next60, %11
  %indvars.iv.next60.1 = add nsw i64 %indvars.iv59, 2
  br i1 %exitcond62.1, label %.loopexit.us.us.unr-lcssa, label %101

.loopexit15:                                      ; preds = %.loopexit15, %.loopexit15.preheader.new
  %indvars.iv55 = phi i64 [ %indvars.iv55.unr, %.loopexit15.preheader.new ], [ %indvars.iv.next56.7, %.loopexit15 ]
  %indvars.iv.next56.7 = add nsw i64 %indvars.iv55, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next56.7, %9
  br i1 %exitcond.7, label %.loopexit16.loopexit92.unr-lcssa, label %.loopexit15

.loopexit16.loopexit:                             ; preds = %.loopexit15.us
  br label %.loopexit16

.loopexit16.loopexit92.unr-lcssa:                 ; preds = %.loopexit15
  br label %.loopexit16.loopexit92

.loopexit16.loopexit92:                           ; preds = %.loopexit16.loopexit92.unr-lcssa, %.loopexit15.prol.loopexit
  br label %.loopexit16

.loopexit16:                                      ; preds = %.loopexit16.loopexit92, %.loopexit16.loopexit, %.preheader6
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond78 = icmp eq i64 %indvars.iv.next70, %12
  br i1 %exitcond78, label %._crit_edge.loopexit, label %.preheader6

._crit_edge.loopexit:                             ; preds = %.loopexit16
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %6
  ret void
}

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #1 {
  %3 = tail call i8* @polybench_alloc_data(i64 3360000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 160, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 25600, i32 8) #4
  %6 = bitcast i8* %3 to [140 x [160 x double]]*
  %7 = bitcast i8* %5 to [160 x double]*
  tail call void @init_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = bitcast i8* %5 to [160 x double]*
  %9 = bitcast i8* %4 to double*
  tail call void @kernel_doitgen(i32 150, i32 140, i32 160, [140 x [160 x double]]* %6, [160 x double]* %8, double* %9)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %10 = icmp sgt i32 %0, 42
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %2
  %12 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %12, align 1
  %13 = icmp eq i8 %strcmpload, 0
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %11
  %15 = bitcast i8* %3 to [140 x [160 x double]]*
  tail call void @print_array(i32 150, i32 140, i32 160, [140 x [160 x double]]* %15)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %11, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #2

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, i32, [140 x [160 x double]]*, [160 x double]*) #0 {
.preheader7.lr.ph:
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %.loopexit16.us, %.preheader7.lr.ph
  %indvars.iv59 = phi i64 [ 0, %.preheader7.lr.ph ], [ %indvars.iv.next60, %.loopexit16.us ]
  br label %.preheader6.us.us

.loopexit16.us:                                   ; preds = %.loopexit15.us.us
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next60, 150
  br i1 %exitcond64, label %.preheader.us.preheader, label %.preheader7.us

.preheader.us.preheader:                          ; preds = %.loopexit16.us
  br label %.preheader.us

.preheader6.us.us:                                ; preds = %.loopexit15.us.us, %.preheader7.us
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %.loopexit15.us.us ], [ 0, %.preheader7.us ]
  %5 = mul nuw nsw i64 %indvars.iv57, %indvars.iv59
  br label %6

.loopexit15.us.us:                                ; preds = %6
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond63 = icmp eq i64 %indvars.iv.next58, 140
  br i1 %exitcond63, label %.loopexit16.us, label %.preheader6.us.us

; <label>:6:                                      ; preds = %6, %.preheader6.us.us
  %indvars.iv53 = phi i64 [ 0, %.preheader6.us.us ], [ %indvars.iv.next54.1, %6 ]
  %7 = add nuw nsw i64 %5, %indvars.iv53
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 160
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv59, i64 %indvars.iv57, i64 %indvars.iv53
  %indvars.iv.next54 = or i64 %indvars.iv53, 1
  %12 = add nuw nsw i64 %5, %indvars.iv.next54
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 160
  %15 = sitofp i32 %14 to double
  %16 = insertelement <2 x double> undef, double %10, i32 0
  %17 = insertelement <2 x double> %16, double %15, i32 1
  %18 = fdiv <2 x double> %17, <double 1.600000e+02, double 1.600000e+02>
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %exitcond56.1 = icmp eq i64 %indvars.iv.next54, 159
  %indvars.iv.next54.1 = add nsw i64 %indvars.iv53, 2
  br i1 %exitcond56.1, label %.loopexit15.us.us, label %6

.preheader.us:                                    ; preds = %.loopexit.us, %.preheader.us.preheader
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %.loopexit.us ], [ 0, %.preheader.us.preheader ]
  br label %20

; <label>:20:                                     ; preds = %20, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %20 ]
  %21 = mul nuw nsw i64 %indvars.iv50, %indvars.iv
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 160
  %24 = sitofp i32 %23 to double
  %25 = getelementptr inbounds [160 x double], [160 x double]* %4, i64 %indvars.iv50, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %26 = mul nuw nsw i64 %indvars.iv50, %indvars.iv.next
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 160
  %29 = sitofp i32 %28 to double
  %30 = insertelement <2 x double> undef, double %24, i32 0
  %31 = insertelement <2 x double> %30, double %29, i32 1
  %32 = fdiv <2 x double> %31, <double 1.600000e+02, double 1.600000e+02>
  %33 = bitcast double* %25 to <2 x double>*
  store <2 x double> %32, <2 x double>* %33, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 159
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %.loopexit.us, label %20

.loopexit.us:                                     ; preds = %20
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next51, 160
  br i1 %exitcond62, label %.preheader5._crit_edge, label %.preheader.us

.preheader5._crit_edge:                           ; preds = %.loopexit.us
  ret void
}

declare void @polybench_timer_start(...) #2

declare void @polybench_timer_stop(...) #2

declare void @polybench_timer_print(...) #2

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, i32, [140 x [160 x double]]*) #1 {
.preheader3.lr.ph:
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %.loopexit7.us, %.preheader3.lr.ph
  %indvars.iv36 = phi i64 [ 0, %.preheader3.lr.ph ], [ %indvars.iv.next37, %.loopexit7.us ]
  %8 = mul nuw nsw i64 %indvars.iv36, 140
  br label %.preheader.us.us

.loopexit7.us:                                    ; preds = %.loopexit.us.us
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next37, 150
  br i1 %exitcond39, label %._crit_edge, label %.preheader3.us

.preheader.us.us:                                 ; preds = %.loopexit.us.us, %.preheader3.us
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %.loopexit.us.us ], [ 0, %.preheader3.us ]
  %9 = add i64 %8, %indvars.iv34
  %10 = mul i64 %9, 160
  br label %._crit_edge31

.loopexit.us.us:                                  ; preds = %._crit_edge30
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next35, 140
  br i1 %exitcond38, label %.loopexit7.us, label %.preheader.us.us

._crit_edge31:                                    ; preds = %._crit_edge30, %.preheader.us.us
  %indvars.iv = phi i64 [ 0, %.preheader.us.us ], [ %indvars.iv.next, %._crit_edge30 ]
  %11 = add i64 %10, %indvars.iv
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge30

; <label>:15:                                     ; preds = %._crit_edge31
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %15, %._crit_edge31
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [140 x [160 x double]], [140 x [160 x double]]* %3, i64 %indvars.iv36, i64 %indvars.iv34, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 160
  br i1 %exitcond, label %.loopexit.us.us, label %._crit_edge31

._crit_edge:                                      ; preds = %.loopexit7.us
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
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
