; ModuleID = 'A.ll'
source_filename = "symm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  tail call fastcc void @kernel_symm(i32 1000, i32 1200, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %8)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
.preheader36.lr.ph:
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br label %.preheader36.us

.preheader36.us:                                  ; preds = %._crit_edge45.us, %.preheader36.lr.ph
  %indvars.iv65 = phi i64 [ 0, %.preheader36.lr.ph ], [ %indvars.iv.next66, %._crit_edge45.us ]
  %7 = add i64 %indvars.iv65, 1200
  %8 = trunc i64 %7 to i32
  br label %9

; <label>:9:                                      ; preds = %9, %.preheader36.us
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %9 ], [ 0, %.preheader36.us ]
  %10 = add nuw nsw i64 %indvars.iv62, %indvars.iv65
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 100
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 1.000000e+03
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv65, i64 %indvars.iv62
  store double %14, double* %15, align 8
  %16 = trunc i64 %indvars.iv62 to i32
  %17 = sub i32 %8, %16
  %18 = srem i32 %17, 100
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, 1.000000e+03
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv65, i64 %indvars.iv62
  store double %20, double* %21, align 8
  %exitcond64 = icmp eq i64 %indvars.iv62, 1199
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  br i1 %exitcond64, label %._crit_edge45.us, label %9

._crit_edge45.us:                                 ; preds = %9
  %indvars.iv.next66 = add nuw i64 %indvars.iv65, 1
  %22 = icmp slt i64 %indvars.iv.next66, 1000
  br i1 %22, label %.preheader36.us, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %._crit_edge45.us
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %._crit_edge ], [ 0, %.lr.ph.preheader ]
  %indvars.iv54 = phi i32 [ %indvars.iv.next55, %._crit_edge ], [ 1, %.lr.ph.preheader ]
  %23 = sub i64 999, %indvars.iv60
  %24 = add i64 %23, -4
  %25 = lshr i64 %24, 2
  %26 = add nuw nsw i64 %25, 1
  %27 = sub i64 999, %indvars.iv60
  %28 = sext i32 %indvars.iv54 to i64
  %29 = and i64 %indvars.iv60, 1
  %lcmp.mod = icmp eq i64 %29, 0
  br i1 %lcmp.mod, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.lr.ph
  br label %30

; <label>:30:                                     ; preds = %.prol.preheader
  %31 = trunc i64 %indvars.iv60 to i32
  %32 = srem i32 %31, 100
  %33 = sitofp i32 %32 to double
  %34 = fdiv double %33, 1.000000e+03
  %35 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv60, i64 0
  store double %34, double* %35, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph, %30
  %indvars.iv.unr.ph = phi i64 [ 1, %30 ], [ 0, %.lr.ph ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  %36 = icmp eq i64 %indvars.iv60, 0
  br i1 %36, label %.preheader, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %65

.preheader.unr-lcssa:                             ; preds = %65
  br label %.preheader

.preheader:                                       ; preds = %.prol.loopexit, %.preheader.unr-lcssa
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %37 = icmp slt i64 %indvars.iv.next61, 1000
  br i1 %37, label %.lr.ph40.preheader, label %._crit_edge

.lr.ph40.preheader:                               ; preds = %.preheader
  %min.iters.check = icmp ult i64 %27, 4
  br i1 %min.iters.check, label %.lr.ph40.preheader70, label %min.iters.checked

.lr.ph40.preheader70:                             ; preds = %middle.block, %min.iters.checked, %.lr.ph40.preheader
  %indvars.iv56.ph = phi i64 [ %28, %min.iters.checked ], [ %28, %.lr.ph40.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph40

min.iters.checked:                                ; preds = %.lr.ph40.preheader
  %n.vec = and i64 %27, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %ind.end = add i64 %28, %n.vec
  br i1 %cmp.zero, label %.lr.ph40.preheader70, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  %xtraiter71 = and i64 %26, 3
  %lcmp.mod72 = icmp eq i64 %xtraiter71, 0
  br i1 %lcmp.mod72, label %vector.body.prol.loopexit, label %vector.body.prol.preheader

vector.body.prol.preheader:                       ; preds = %vector.body.preheader
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.body.prol, %vector.body.prol.preheader
  %index.prol = phi i64 [ %index.next.prol, %vector.body.prol ], [ 0, %vector.body.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %vector.body.prol ], [ %xtraiter71, %vector.body.prol.preheader ]
  %38 = add i64 %28, %index.prol
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv60, i64 %38
  %40 = bitcast double* %39 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %40, align 8
  %41 = getelementptr double, double* %39, i64 2
  %42 = bitcast double* %41 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %42, align 8
  %index.next.prol = add i64 %index.prol, 4
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %vector.body.prol.loopexit.unr-lcssa, label %vector.body.prol, !llvm.loop !1

vector.body.prol.loopexit.unr-lcssa:              ; preds = %vector.body.prol
  br label %vector.body.prol.loopexit

vector.body.prol.loopexit:                        ; preds = %vector.body.preheader, %vector.body.prol.loopexit.unr-lcssa
  %index.unr = phi i64 [ 0, %vector.body.preheader ], [ %index.next.prol, %vector.body.prol.loopexit.unr-lcssa ]
  %43 = icmp ult i64 %24, 12
  br i1 %43, label %middle.block, label %vector.body.preheader.new

vector.body.preheader.new:                        ; preds = %vector.body.prol.loopexit
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader.new
  %index = phi i64 [ %index.unr, %vector.body.preheader.new ], [ %index.next.3, %vector.body ]
  %44 = add i64 %28, %index
  %45 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv60, i64 %44
  %46 = bitcast double* %45 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %46, align 8
  %47 = getelementptr double, double* %45, i64 2
  %48 = bitcast double* %47 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %48, align 8
  %index.next = add i64 %index, 4
  %49 = add i64 %28, %index.next
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv60, i64 %49
  %51 = bitcast double* %50 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %51, align 8
  %52 = getelementptr double, double* %50, i64 2
  %53 = bitcast double* %52 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %53, align 8
  %index.next.1 = add i64 %index, 8
  %54 = add i64 %28, %index.next.1
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv60, i64 %54
  %56 = bitcast double* %55 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %56, align 8
  %57 = getelementptr double, double* %55, i64 2
  %58 = bitcast double* %57 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %58, align 8
  %index.next.2 = add i64 %index, 12
  %59 = add i64 %28, %index.next.2
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv60, i64 %59
  %61 = bitcast double* %60 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %61, align 8
  %62 = getelementptr double, double* %60, i64 2
  %63 = bitcast double* %62 to <2 x double>*
  store <2 x double> <double -9.990000e+02, double -9.990000e+02>, <2 x double>* %63, align 8
  %index.next.3 = add i64 %index, 16
  %64 = icmp eq i64 %index.next.3, %n.vec
  br i1 %64, label %middle.block.unr-lcssa, label %vector.body, !llvm.loop !3

middle.block.unr-lcssa:                           ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %vector.body.prol.loopexit, %middle.block.unr-lcssa
  %cmp.n = icmp eq i64 %27, %n.vec
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph40.preheader70

; <label>:65:                                     ; preds = %65, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %65 ]
  %66 = add nuw nsw i64 %indvars.iv, %indvars.iv60
  %67 = trunc i64 %66 to i32
  %68 = srem i32 %67, 100
  %69 = sitofp i32 %68 to double
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv60, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %71 = add nuw nsw i64 %indvars.iv.next, %indvars.iv60
  %72 = trunc i64 %71 to i32
  %73 = srem i32 %72, 100
  %74 = sitofp i32 %73 to double
  %75 = insertelement <2 x double> undef, double %69, i32 0
  %76 = insertelement <2 x double> %75, double %74, i32 1
  %77 = fdiv <2 x double> %76, <double 1.000000e+03, double 1.000000e+03>
  %78 = bitcast double* %70 to <2 x double>*
  store <2 x double> %77, <2 x double>* %78, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %indvars.iv60
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %.preheader.unr-lcssa, label %65

.lr.ph40:                                         ; preds = %.lr.ph40.preheader70, %.lr.ph40
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %.lr.ph40 ], [ %indvars.iv56.ph, %.lr.ph40.preheader70 ]
  %79 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv60, i64 %indvars.iv56
  store double -9.990000e+02, double* %79, align 8
  %exitcond59 = icmp eq i64 %indvars.iv56, 999
  %indvars.iv.next57 = add nsw i64 %indvars.iv56, 1
  br i1 %exitcond59, label %._crit_edge.loopexit, label %.lr.ph40, !llvm.loop !6

._crit_edge.loopexit:                             ; preds = %.lr.ph40
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %middle.block, %.preheader
  %80 = icmp slt i64 %indvars.iv.next61, 1000
  %indvars.iv.next55 = add nuw i32 %indvars.iv54, 1
  br i1 %80, label %.lr.ph, label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_symm(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #2 {
.preheader38.us.preheader:
  %7 = fmul double %2, 0.000000e+00
  %broadcast.splatinsert92 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat93 = shufflevector <2 x double> %broadcast.splatinsert92, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert96 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat97 = shufflevector <2 x double> %broadcast.splatinsert96, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert98 = insertelement <2 x double> undef, double %7, i32 0
  %broadcast.splat99 = shufflevector <2 x double> %broadcast.splatinsert98, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader38.us

.preheader38.us:                                  ; preds = %._crit_edge45.us, %.preheader38.us.preheader
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %._crit_edge45.us ], [ 0, %.preheader38.us.preheader ]
  %indvars.iv68 = phi i32 [ %indvars.iv.next69, %._crit_edge45.us ], [ -1, %.preheader38.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv74, i64 0
  %8 = add i64 %indvars.iv74, 1
  %scevgep80 = getelementptr [1200 x double], [1200 x double]* %4, i64 %8, i64 0
  %9 = icmp sgt i64 %indvars.iv74, 0
  br i1 %9, label %.preheader.us.us.preheader, label %.preheader.us55.preheader

.preheader.us55.preheader:                        ; preds = %.preheader38.us
  %scevgep84 = getelementptr [1200 x double], [1200 x double]* %6, i64 %8, i64 0
  %scevgep82 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv74, i64 0
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv74, i64 %indvars.iv74
  %bound0 = icmp ult double* %scevgep, %scevgep84
  %bound1 = icmp ult double* %scevgep82, %scevgep80
  %found.conflict = and i1 %bound0, %bound1
  %bound087 = icmp ult double* %scevgep, %10
  %bound188 = icmp ult double* %10, %scevgep80
  %found.conflict89 = and i1 %bound087, %bound188
  %conflict.rdx = or i1 %found.conflict, %found.conflict89
  br i1 %conflict.rdx, label %.preheader.us55.preheader100, label %vector.ph

.preheader.us55.preheader100:                     ; preds = %.preheader.us55.preheader
  br label %.preheader.us55

vector.ph:                                        ; preds = %.preheader.us55.preheader
  %11 = load double, double* %10, align 8, !alias.scope !8
  %12 = insertelement <2 x double> undef, double %11, i32 0
  %13 = shufflevector <2 x double> %12, <2 x double> undef, <2 x i32> zeroinitializer
  %14 = insertelement <2 x double> undef, double %11, i32 0
  %15 = shufflevector <2 x double> %14, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv74, i64 %index
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !11, !noalias !13
  %18 = getelementptr double, double* %16, i64 2
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load91 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !11, !noalias !13
  %20 = fmul <2 x double> %wide.load, %broadcast.splat93
  %21 = fmul <2 x double> %wide.load91, %broadcast.splat93
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv74, i64 %index
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load94 = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !15
  %24 = getelementptr double, double* %22, i64 2
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load95 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !15
  %26 = fmul <2 x double> %wide.load94, %broadcast.splat97
  %27 = fmul <2 x double> %wide.load95, %broadcast.splat97
  %28 = fmul <2 x double> %26, %13
  %29 = fmul <2 x double> %27, %15
  %30 = fadd <2 x double> %20, %28
  %31 = fadd <2 x double> %21, %29
  %32 = fadd <2 x double> %broadcast.splat99, %30
  %33 = fadd <2 x double> %broadcast.splat99, %31
  %34 = bitcast double* %16 to <2 x double>*
  store <2 x double> %32, <2 x double>* %34, align 8, !alias.scope !11, !noalias !13
  %35 = bitcast double* %18 to <2 x double>*
  store <2 x double> %33, <2 x double>* %35, align 8, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %36 = icmp eq i64 %index.next, 1200
  br i1 %36, label %._crit_edge45.us.loopexit102, label %vector.body, !llvm.loop !16

.preheader.us.us.preheader:                       ; preds = %.preheader38.us
  %wide.trip.count70 = zext i32 %indvars.iv68 to i64
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv74, i64 %indvars.iv74
  br label %.preheader.us.us

.preheader.us55:                                  ; preds = %.preheader.us55, %.preheader.us55.preheader100
  %indvars.iv = phi i64 [ 0, %.preheader.us55.preheader100 ], [ %indvars.iv.next.1, %.preheader.us55 ]
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv74, i64 %indvars.iv
  %39 = bitcast double* %38 to <2 x double>*
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv74, i64 %indvars.iv
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %2
  %43 = load double, double* %10, align 8
  %44 = fmul double %42, %43
  %indvars.iv.next = or i64 %indvars.iv, 1
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv74, i64 %indvars.iv.next
  %46 = load <2 x double>, <2 x double>* %39, align 8
  %47 = insertelement <2 x double> undef, double %3, i32 0
  %48 = insertelement <2 x double> %47, double %3, i32 1
  %49 = fmul <2 x double> %46, %48
  %50 = extractelement <2 x double> %49, i32 0
  %51 = extractelement <2 x double> %49, i32 1
  %52 = fadd double %50, %44
  %53 = fadd double %7, %52
  store double %53, double* %38, align 8
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv74, i64 %indvars.iv.next
  %55 = load double, double* %54, align 8
  %56 = fmul double %55, %2
  %57 = load double, double* %10, align 8
  %58 = fmul double %56, %57
  %59 = fadd double %51, %58
  %60 = fadd double %7, %59
  store double %60, double* %45, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 1199
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %._crit_edge45.us.loopexit101, label %.preheader.us55, !llvm.loop !17

._crit_edge45.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge45.us

._crit_edge45.us.loopexit101:                     ; preds = %.preheader.us55
  br label %._crit_edge45.us

._crit_edge45.us.loopexit102:                     ; preds = %vector.body
  br label %._crit_edge45.us

._crit_edge45.us:                                 ; preds = %._crit_edge45.us.loopexit102, %._crit_edge45.us.loopexit101, %._crit_edge45.us.loopexit
  %indvars.iv.next75 = add nuw i64 %indvars.iv74, 1
  %61 = icmp slt i64 %indvars.iv.next75, 1000
  %indvars.iv.next69 = add nsw i32 %indvars.iv68, 1
  br i1 %61, label %.preheader38.us, label %._crit_edge49

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv74, i64 %indvars.iv72
  br label %75

._crit_edge.us.us:                                ; preds = %75
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv74, i64 %indvars.iv72
  %64 = load double, double* %63, align 8
  %65 = fmul double %64, %3
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv74, i64 %indvars.iv72
  %67 = load double, double* %66, align 8
  %68 = fmul double %67, %2
  %69 = load double, double* %37, align 8
  %70 = fmul double %68, %69
  %71 = fadd double %65, %70
  %72 = fmul double %88, %2
  %73 = fadd double %72, %71
  store double %73, double* %63, align 8
  %indvars.iv.next73 = add nuw i64 %indvars.iv72, 1
  %74 = icmp slt i64 %indvars.iv.next73, 1200
  br i1 %74, label %.preheader.us.us, label %._crit_edge45.us.loopexit

; <label>:75:                                     ; preds = %75, %.preheader.us.us
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %75 ], [ 0, %.preheader.us.us ]
  %.040.us.us = phi double [ %88, %75 ], [ 0.000000e+00, %.preheader.us.us ]
  %76 = load double, double* %62, align 8
  %77 = fmul double %76, %2
  %78 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv74, i64 %indvars.iv66
  %79 = load double, double* %78, align 8
  %80 = fmul double %77, %79
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv66, i64 %indvars.iv72
  %82 = load double, double* %81, align 8
  %83 = fadd double %82, %80
  store double %83, double* %81, align 8
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv66, i64 %indvars.iv72
  %85 = load double, double* %84, align 8
  %86 = load double, double* %78, align 8
  %87 = fmul double %85, %86
  %88 = fadd double %.040.us.us, %87
  %exitcond71 = icmp eq i64 %indvars.iv66, %wide.trip.count70
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  br i1 %exitcond71, label %._crit_edge.us.us, label %75

._crit_edge49:                                    ; preds = %._crit_edge45.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv14 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next15, %._crit_edge.us ]
  %7 = mul nsw i64 %indvars.iv14, 1000
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %8 = add nsw i64 %indvars.iv, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge13
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge13, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv14, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %18 = icmp slt i64 %indvars.iv.next, 1200
  br i1 %18, label %._crit_edge13, label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next15 = add nuw i64 %indvars.iv14, 1
  %19 = icmp slt i64 %indvars.iv.next15, 1000
  br i1 %19, label %.preheader.us, label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
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
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12}
!12 = distinct !{!12, !10}
!13 = !{!14, !9}
!14 = distinct !{!14, !10}
!15 = !{!14}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}
