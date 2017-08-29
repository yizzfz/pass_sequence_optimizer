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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  %13 = bitcast i8* %5 to [1200 x double]*
  %14 = bitcast i8* %6 to [1000 x double]*
  %15 = bitcast i8* %7 to [1200 x double]*
  call fastcc void @kernel_symm(i32 1000, i32 1200, double %11, double %12, [1200 x double]* %13, [1000 x double]* %14, [1200 x double]* %15)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %16 = icmp sgt i32 %0, 42
  br i1 %16, label %17, label %22

; <label>:17:                                     ; preds = %2
  %18 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %18, align 1
  %19 = icmp eq i8 %strcmpload, 0
  br i1 %19, label %20, label %22

; <label>:20:                                     ; preds = %17
  %21 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %21)
  br label %22

; <label>:22:                                     ; preds = %17, %20, %2
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double*, double*, [1200 x double]*, [1000 x double]*, [1200 x double]*) unnamed_addr #2 {
.preheader41.us.preheader:
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br label %.preheader41.us

.preheader41.us:                                  ; preds = %._crit_edge48.us, %.preheader41.us.preheader
  %indvars.iv69 = phi i64 [ 0, %.preheader41.us.preheader ], [ %indvars.iv.next70, %._crit_edge48.us ]
  %7 = add nsw i64 %indvars.iv69, 1200
  %8 = trunc i64 %7 to i32
  br label %9

; <label>:9:                                      ; preds = %9, %.preheader41.us
  %indvars.iv66 = phi i64 [ 0, %.preheader41.us ], [ %indvars.iv.next67, %9 ]
  %10 = add nuw nsw i64 %indvars.iv66, %indvars.iv69
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 100
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 1.000000e+03
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv69, i64 %indvars.iv66
  store double %14, double* %15, align 8
  %16 = trunc i64 %indvars.iv66 to i32
  %17 = sub i32 %8, %16
  %18 = srem i32 %17, 100
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, 1.000000e+03
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv69, i64 %indvars.iv66
  store double %20, double* %21, align 8
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next67, 1200
  br i1 %exitcond68, label %._crit_edge48.us, label %9

._crit_edge48.us:                                 ; preds = %9
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next70, 1000
  br i1 %exitcond72, label %.lr.ph.preheader, label %.preheader41.us

.lr.ph.preheader:                                 ; preds = %._crit_edge48.us
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge
  %indvars.iv62 = phi i64 [ %indvars.iv.next6379, %._crit_edge ], [ 0, %.lr.ph.preheader ]
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %._crit_edge ], [ 1, %.lr.ph.preheader ]
  %22 = sub i64 999, %indvars.iv62
  %23 = sub i64 998, %indvars.iv62
  %24 = and i64 %indvars.iv62, 1
  %lcmp.mod = icmp eq i64 %24, 0
  br i1 %lcmp.mod, label %.prol.preheader, label %.prol.loopexit

.prol.preheader:                                  ; preds = %.lr.ph
  %25 = trunc i64 %indvars.iv62 to i32
  %26 = srem i32 %25, 100
  %27 = sitofp i32 %26 to double
  %28 = fdiv double %27, 1.000000e+03
  %29 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv62, i64 0
  store double %28, double* %29, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %30 = icmp eq i64 %indvars.iv62, 0
  br i1 %30, label %.lr.ph43, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.preheader:                                       ; preds = %.lr.ph.new
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %31 = icmp slt i64 %indvars.iv.next63, 1000
  br i1 %31, label %.lr.ph43, label %._crit_edge

.lr.ph43:                                         ; preds = %.prol.loopexit, %.preheader
  %indvars.iv.next6380 = phi i64 [ %indvars.iv.next63, %.preheader ], [ 1, %.prol.loopexit ]
  %xtraiter76 = and i64 %22, 7
  %lcmp.mod77 = icmp eq i64 %xtraiter76, 0
  br i1 %lcmp.mod77, label %.prol.loopexit75, label %.prol.preheader74.preheader

.prol.preheader74.preheader:                      ; preds = %.lr.ph43
  br label %.prol.preheader74

.prol.preheader74:                                ; preds = %.prol.preheader74.preheader, %.prol.preheader74
  %indvars.iv56.prol = phi i64 [ %indvars.iv.next57.prol, %.prol.preheader74 ], [ %indvars.iv60, %.prol.preheader74.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader74 ], [ %xtraiter76, %.prol.preheader74.preheader ]
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv62, i64 %indvars.iv56.prol
  store double -9.990000e+02, double* %32, align 8
  %indvars.iv.next57.prol = add nuw nsw i64 %indvars.iv56.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit75.loopexit, label %.prol.preheader74, !llvm.loop !1

.prol.loopexit75.loopexit:                        ; preds = %.prol.preheader74
  br label %.prol.loopexit75

.prol.loopexit75:                                 ; preds = %.prol.loopexit75.loopexit, %.lr.ph43
  %indvars.iv56.unr = phi i64 [ %indvars.iv60, %.lr.ph43 ], [ %indvars.iv.next57.prol, %.prol.loopexit75.loopexit ]
  %33 = icmp ult i64 %23, 7
  br i1 %33, label %._crit_edge, label %.lr.ph43.new.preheader

.lr.ph43.new.preheader:                           ; preds = %.prol.loopexit75
  %34 = sub i64 992, %indvars.iv56.unr
  %35 = lshr i64 %34, 3
  %36 = add nuw nsw i64 %35, 1
  %min.iters.check = icmp ult i64 %36, 2
  br i1 %min.iters.check, label %.lr.ph43.new.preheader81, label %min.iters.checked

.lr.ph43.new.preheader81:                         ; preds = %middle.block, %min.iters.checked, %.lr.ph43.new.preheader
  %indvars.iv56.ph = phi i64 [ %indvars.iv56.unr, %min.iters.checked ], [ %indvars.iv56.unr, %.lr.ph43.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph43.new

min.iters.checked:                                ; preds = %.lr.ph43.new.preheader
  %n.mod.vf = and i64 %36, 1
  %n.vec = sub nsw i64 %36, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %37 = add i64 %indvars.iv56.unr, 8
  %38 = shl nuw i64 %35, 3
  %39 = add i64 %37, %38
  %40 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %39, %40
  br i1 %cmp.zero, label %.lr.ph43.new.preheader81, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %41 = shl i64 %index, 3
  %42 = add i64 %indvars.iv56.unr, %41
  %43 = add nsw i64 %42, 7
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv62, i64 %43
  %45 = getelementptr double, double* %44, i64 -7
  %46 = bitcast double* %45 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %46, align 8
  %index.next = add i64 %index, 2
  %47 = icmp eq i64 %index.next, %n.vec
  br i1 %47, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph43.new.preheader81

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %48 = add nuw nsw i64 %indvars.iv, %indvars.iv62
  %49 = trunc i64 %48 to i32
  %50 = srem i32 %49, 100
  %51 = sitofp i32 %50 to double
  %52 = fdiv double %51, 1.000000e+03
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv62, i64 %indvars.iv
  store double %52, double* %53, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %54 = add nuw nsw i64 %indvars.iv.next, %indvars.iv62
  %55 = trunc i64 %54 to i32
  %56 = srem i32 %55, 100
  %57 = sitofp i32 %56 to double
  %58 = fdiv double %57, 1.000000e+03
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv62, i64 %indvars.iv.next
  store double %58, double* %59, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv60
  br i1 %exitcond.1, label %.preheader, label %.lr.ph.new

.lr.ph43.new:                                     ; preds = %.lr.ph43.new.preheader81, %.lr.ph43.new
  %indvars.iv56 = phi i64 [ %indvars.iv.next57.7, %.lr.ph43.new ], [ %indvars.iv56.ph, %.lr.ph43.new.preheader81 ]
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv62, i64 %indvars.iv56
  store double -9.990000e+02, double* %60, align 8
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %61 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv62, i64 %indvars.iv.next57
  store double -9.990000e+02, double* %61, align 8
  %indvars.iv.next57.1 = add nsw i64 %indvars.iv56, 2
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv62, i64 %indvars.iv.next57.1
  store double -9.990000e+02, double* %62, align 8
  %indvars.iv.next57.2 = add nsw i64 %indvars.iv56, 3
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv62, i64 %indvars.iv.next57.2
  store double -9.990000e+02, double* %63, align 8
  %indvars.iv.next57.3 = add nsw i64 %indvars.iv56, 4
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv62, i64 %indvars.iv.next57.3
  store double -9.990000e+02, double* %64, align 8
  %indvars.iv.next57.4 = add nsw i64 %indvars.iv56, 5
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv62, i64 %indvars.iv.next57.4
  store double -9.990000e+02, double* %65, align 8
  %indvars.iv.next57.5 = add nsw i64 %indvars.iv56, 6
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv62, i64 %indvars.iv.next57.5
  store double -9.990000e+02, double* %66, align 8
  %indvars.iv.next57.6 = add nsw i64 %indvars.iv56, 7
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv62, i64 %indvars.iv.next57.6
  store double -9.990000e+02, double* %67, align 8
  %indvars.iv.next57.7 = add nsw i64 %indvars.iv56, 8
  %exitcond59.7 = icmp eq i64 %indvars.iv.next57.7, 1000
  br i1 %exitcond59.7, label %._crit_edge.loopexit, label %.lr.ph43.new, !llvm.loop !6

._crit_edge.loopexit:                             ; preds = %.lr.ph43.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %middle.block, %.prol.loopexit75, %.preheader
  %indvars.iv.next6379 = phi i64 [ %indvars.iv.next63, %.preheader ], [ %indvars.iv.next6380, %.prol.loopexit75 ], [ %indvars.iv.next6380, %middle.block ], [ %indvars.iv.next6380, %._crit_edge.loopexit ]
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next6379, 1000
  br i1 %exitcond65, label %._crit_edge45, label %.lr.ph

._crit_edge45:                                    ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_symm(i32, i32, double, double, [1200 x double]*, [1000 x double]*, [1200 x double]*) unnamed_addr #2 {
.preheader44.lr.ph:
  %7 = fmul double %2, 0.000000e+00
  %broadcast.splatinsert86 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat87 = shufflevector <2 x double> %broadcast.splatinsert86, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert90 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat91 = shufflevector <2 x double> %broadcast.splatinsert90, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert92 = insertelement <2 x double> undef, double %7, i32 0
  %broadcast.splat93 = shufflevector <2 x double> %broadcast.splatinsert92, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %.preheader44.lr.ph, %._crit_edge51
  %indvars.iv67 = phi i64 [ 0, %.preheader44.lr.ph ], [ %indvars.iv.next68, %._crit_edge51 ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv67, i64 0
  %8 = add i64 %indvars.iv67, 1
  %scevgep74 = getelementptr [1200 x double], [1200 x double]* %4, i64 %8, i64 0
  %9 = icmp sgt i64 %indvars.iv67, 0
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv67, i64 %indvars.iv67
  br i1 %9, label %.preheader.us.preheader, label %vector.memcheck

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

vector.memcheck:                                  ; preds = %.preheader.lr.ph
  %scevgep78 = getelementptr [1200 x double], [1200 x double]* %6, i64 %8, i64 0
  %scevgep76 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv67, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep78
  %bound1 = icmp ult double* %scevgep76, %scevgep74
  %found.conflict = and i1 %bound0, %bound1
  %bound081 = icmp ult double* %scevgep, %10
  %bound182 = icmp ult double* %10, %scevgep74
  %found.conflict83 = and i1 %bound081, %bound182
  %conflict.rdx = or i1 %found.conflict, %found.conflict83
  br i1 %conflict.rdx, label %.preheader.preheader, label %vector.ph

.preheader.preheader:                             ; preds = %vector.memcheck
  br label %.preheader

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv67, i64 %index
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !8, !noalias !11
  %13 = getelementptr double, double* %11, i64 2
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load85 = load <2 x double>, <2 x double>* %14, align 8, !alias.scope !8, !noalias !11
  %15 = fmul <2 x double> %wide.load, %broadcast.splat87
  %16 = fmul <2 x double> %wide.load85, %broadcast.splat87
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv67, i64 %index
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !14
  %19 = getelementptr double, double* %17, i64 2
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !14
  %21 = fmul <2 x double> %wide.load88, %broadcast.splat91
  %22 = fmul <2 x double> %wide.load89, %broadcast.splat91
  %23 = load double, double* %10, align 8, !alias.scope !15
  %24 = insertelement <2 x double> undef, double %23, i32 0
  %25 = shufflevector <2 x double> %24, <2 x double> undef, <2 x i32> zeroinitializer
  %26 = insertelement <2 x double> undef, double %23, i32 0
  %27 = shufflevector <2 x double> %26, <2 x double> undef, <2 x i32> zeroinitializer
  %28 = fmul <2 x double> %21, %25
  %29 = fmul <2 x double> %22, %27
  %30 = fadd <2 x double> %15, %28
  %31 = fadd <2 x double> %16, %29
  %32 = fadd <2 x double> %broadcast.splat93, %30
  %33 = fadd <2 x double> %broadcast.splat93, %31
  %34 = bitcast double* %11 to <2 x double>*
  store <2 x double> %32, <2 x double>* %34, align 8, !alias.scope !8, !noalias !11
  %35 = bitcast double* %13 to <2 x double>*
  store <2 x double> %33, <2 x double>* %35, align 8, !alias.scope !8, !noalias !11
  %index.next = add i64 %index, 4
  %36 = icmp eq i64 %index.next, 1200
  br i1 %36, label %._crit_edge51.loopexit95, label %vector.body, !llvm.loop !16

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv67, i64 %indvars.iv63
  br label %38

; <label>:38:                                     ; preds = %38, %.preheader.us
  %indvars.iv57 = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next58, %38 ]
  %.047.us = phi double [ 0.000000e+00, %.preheader.us ], [ %52, %38 ]
  %39 = load double, double* %37, align 8
  %40 = fmul double %39, %2
  %41 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv67, i64 %indvars.iv57
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv57, i64 %indvars.iv63
  %45 = load double, double* %44, align 8
  %46 = fadd double %45, %43
  store double %46, double* %44, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv57, i64 %indvars.iv63
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv67, i64 %indvars.iv57
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = fadd double %.047.us, %51
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond62 = icmp eq i64 %indvars.iv.next58, %indvars.iv67
  br i1 %exitcond62, label %._crit_edge.us, label %38

._crit_edge.us:                                   ; preds = %38
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv67, i64 %indvars.iv63
  %54 = load double, double* %53, align 8
  %55 = fmul double %54, %3
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv67, i64 %indvars.iv63
  %57 = load double, double* %56, align 8
  %58 = fmul double %57, %2
  %59 = load double, double* %10, align 8
  %60 = fmul double %58, %59
  %61 = fadd double %55, %60
  %62 = fmul double %52, %2
  %63 = fadd double %62, %61
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv67, i64 %indvars.iv63
  store double %63, double* %64, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond66 = icmp eq i64 %indvars.iv.next64, 1200
  br i1 %exitcond66, label %._crit_edge51.loopexit, label %.preheader.us

.preheader:                                       ; preds = %.preheader, %.preheader.preheader
  %indvars.iv = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next.1, %.preheader ]
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv67, i64 %indvars.iv
  %66 = load double, double* %65, align 8
  %67 = fmul double %66, %3
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv67, i64 %indvars.iv
  %69 = load double, double* %68, align 8
  %70 = fmul double %69, %2
  %71 = load double, double* %10, align 8
  %72 = fmul double %70, %71
  %73 = fadd double %67, %72
  %74 = fadd double %7, %73
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv67, i64 %indvars.iv
  store double %74, double* %75, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv67, i64 %indvars.iv.next
  %77 = load double, double* %76, align 8
  %78 = fmul double %77, %3
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv67, i64 %indvars.iv.next
  %80 = load double, double* %79, align 8
  %81 = fmul double %80, %2
  %82 = load double, double* %10, align 8
  %83 = fmul double %81, %82
  %84 = fadd double %78, %83
  %85 = fadd double %7, %84
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv67, i64 %indvars.iv.next
  store double %85, double* %86, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %._crit_edge51.loopexit94, label %.preheader, !llvm.loop !17

._crit_edge51.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge51

._crit_edge51.loopexit94:                         ; preds = %.preheader
  br label %._crit_edge51

._crit_edge51.loopexit95:                         ; preds = %vector.body
  br label %._crit_edge51

._crit_edge51:                                    ; preds = %._crit_edge51.loopexit95, %._crit_edge51.loopexit94, %._crit_edge51.loopexit
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond70 = icmp eq i64 %indvars.iv.next68, 1000
  br i1 %exitcond70, label %._crit_edge55, label %.preheader.lr.ph

._crit_edge55:                                    ; preds = %._crit_edge51
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]*) unnamed_addr #0 {
.preheader.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv15 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next16, %._crit_edge.us ]
  %7 = mul nsw i64 %indvars.iv15, 1000
  br label %8

; <label>:8:                                      ; preds = %15, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %15 ]
  %9 = add nsw i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %15

; <label>:15:                                     ; preds = %13, %8
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv15, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %8

._crit_edge.us:                                   ; preds = %15
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, 1000
  br i1 %exitcond18, label %._crit_edge13, label %.preheader.us

._crit_edge13:                                    ; preds = %._crit_edge.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
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
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
!8 = !{!9}
!9 = distinct !{!9, !10}
!10 = distinct !{!10, !"LVerDomain"}
!11 = !{!12, !13}
!12 = distinct !{!12, !10}
!13 = distinct !{!13, !10}
!14 = !{!12}
!15 = !{!13}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}
