; ModuleID = 'A.ll'
source_filename = "symm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1200 x double]*
  call void @init_array(i32 1000, i32 1200, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  %13 = bitcast i8* %5 to [1200 x double]*
  %14 = bitcast i8* %6 to [1000 x double]*
  %15 = bitcast i8* %7 to [1200 x double]*
  tail call void @kernel_symm(i32 1000, i32 1200, double %11, double %12, [1200 x double]* %13, [1000 x double]* %14, [1200 x double]* %15)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %16 = icmp sgt i32 %0, 42
  br i1 %16, label %17, label %22

; <label>:17:                                     ; preds = %2
  %18 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %18, align 1
  %19 = icmp eq i8 %strcmpload, 0
  br i1 %19, label %20, label %22

; <label>:20:                                     ; preds = %17
  %21 = bitcast i8* %5 to [1200 x double]*
  tail call void @print_array(i32 1000, i32 1200, [1200 x double]* %21)
  br label %22

; <label>:22:                                     ; preds = %17, %20, %2
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) #2 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br label %.preheader43

.preheader43:                                     ; preds = %22, %7
  %indvars.iv68 = phi i64 [ 0, %7 ], [ %indvars.iv.next69, %22 ]
  %8 = add nuw nsw i64 %indvars.iv68, 1200
  br label %9

; <label>:9:                                      ; preds = %9, %.preheader43
  %indvars.iv65 = phi i64 [ 0, %.preheader43 ], [ %indvars.iv.next66, %9 ]
  %10 = add nuw nsw i64 %indvars.iv65, %indvars.iv68
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 100
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 1.000000e+03
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv68, i64 %indvars.iv65
  store double %14, double* %15, align 8
  %16 = sub nuw nsw i64 %8, %indvars.iv65
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 100
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, 1.000000e+03
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv68, i64 %indvars.iv65
  store double %20, double* %21, align 8
  %indvars.iv.next66 = add nuw nsw i64 %indvars.iv65, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next66, 1200
  br i1 %exitcond67, label %22, label %9

; <label>:22:                                     ; preds = %9
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond70 = icmp eq i64 %indvars.iv.next69, 1000
  br i1 %exitcond70, label %.lr.ph.preheader, label %.preheader43

.lr.ph.preheader:                                 ; preds = %22
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %._crit_edge ], [ 0, %.lr.ph.preheader ]
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge ], [ 1, %.lr.ph.preheader ]
  %23 = sub i64 999, %indvars.iv63
  %24 = sub i64 998, %indvars.iv63
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %xtraiter71 = and i64 %indvars.iv.next64, 1
  %lcmp.mod = icmp eq i64 %xtraiter71, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %25 = trunc i64 %indvars.iv63 to i32
  %26 = srem i32 %25, 100
  %27 = sitofp i32 %26 to double
  %28 = fdiv double %27, 1.000000e+03
  %29 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv63, i64 0
  store double %28, double* %29, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %30 = icmp eq i64 %indvars.iv63, 0
  br i1 %30, label %.preheader, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.preheader.loopexit:                              ; preds = %.lr.ph.new
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.prol.loopexit
  %31 = icmp slt i64 %indvars.iv.next64, 1000
  br i1 %31, label %.lr.ph45, label %._crit_edge

.lr.ph45:                                         ; preds = %.preheader
  %32 = trunc i64 %23 to i32
  %xtraiter57 = and i32 %32, 7
  %lcmp.mod58 = icmp eq i32 %xtraiter57, 0
  br i1 %lcmp.mod58, label %.prol.loopexit56, label %.prol.preheader55.preheader

.prol.preheader55.preheader:                      ; preds = %.lr.ph45
  br label %.prol.preheader55

.prol.preheader55:                                ; preds = %.prol.preheader55.preheader, %.prol.preheader55
  %indvars.iv53.prol = phi i64 [ %indvars.iv.next54.prol, %.prol.preheader55 ], [ %indvars.iv61, %.prol.preheader55.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader55 ], [ %xtraiter57, %.prol.preheader55.preheader ]
  %33 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv63, i64 %indvars.iv53.prol
  store double -9.990000e+02, double* %33, align 8
  %indvars.iv.next54.prol = add nuw nsw i64 %indvars.iv53.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit56.loopexit, label %.prol.preheader55, !llvm.loop !1

.prol.loopexit56.loopexit:                        ; preds = %.prol.preheader55
  br label %.prol.loopexit56

.prol.loopexit56:                                 ; preds = %.prol.loopexit56.loopexit, %.lr.ph45
  %indvars.iv53.unr = phi i64 [ %indvars.iv61, %.lr.ph45 ], [ %indvars.iv.next54.prol, %.prol.loopexit56.loopexit ]
  %34 = trunc i64 %24 to i32
  %35 = icmp ult i32 %34, 7
  br i1 %35, label %._crit_edge, label %.lr.ph45.new.preheader

.lr.ph45.new.preheader:                           ; preds = %.prol.loopexit56
  %36 = sub i64 992, %indvars.iv53.unr
  %37 = lshr i64 %36, 3
  %38 = add nuw nsw i64 %37, 1
  %min.iters.check = icmp ult i64 %38, 2
  br i1 %min.iters.check, label %.lr.ph45.new.preheader72, label %min.iters.checked

.lr.ph45.new.preheader72:                         ; preds = %middle.block, %min.iters.checked, %.lr.ph45.new.preheader
  %indvars.iv53.ph = phi i64 [ %indvars.iv53.unr, %min.iters.checked ], [ %indvars.iv53.unr, %.lr.ph45.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph45.new

min.iters.checked:                                ; preds = %.lr.ph45.new.preheader
  %n.mod.vf = and i64 %38, 1
  %n.vec = sub nsw i64 %38, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %39 = add i64 %indvars.iv53.unr, 8
  %40 = shl nuw i64 %37, 3
  %41 = add i64 %39, %40
  %42 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %41, %42
  br i1 %cmp.zero, label %.lr.ph45.new.preheader72, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %43 = shl i64 %index, 3
  %44 = add i64 %indvars.iv53.unr, %43
  %45 = add nsw i64 %44, 7
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv63, i64 %45
  %47 = getelementptr double, double* %46, i64 -7
  %48 = bitcast double* %47 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %48, align 8
  %index.next = add i64 %index, 2
  %49 = icmp eq i64 %index.next, %n.vec
  br i1 %49, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge, label %.lr.ph45.new.preheader72

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %50 = add nuw nsw i64 %indvars.iv, %indvars.iv63
  %51 = trunc i64 %50 to i32
  %52 = srem i32 %51, 100
  %53 = sitofp i32 %52 to double
  %54 = fdiv double %53, 1.000000e+03
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv63, i64 %indvars.iv
  store double %54, double* %55, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %56 = add nuw nsw i64 %indvars.iv.next, %indvars.iv63
  %57 = trunc i64 %56 to i32
  %58 = srem i32 %57, 100
  %59 = sitofp i32 %58 to double
  %60 = fdiv double %59, 1.000000e+03
  %61 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv63, i64 %indvars.iv.next
  store double %60, double* %61, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv61
  br i1 %exitcond.1, label %.preheader.loopexit, label %.lr.ph.new

.lr.ph45.new:                                     ; preds = %.lr.ph45.new.preheader72, %.lr.ph45.new
  %indvars.iv53 = phi i64 [ %indvars.iv.next54.7, %.lr.ph45.new ], [ %indvars.iv53.ph, %.lr.ph45.new.preheader72 ]
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv63, i64 %indvars.iv53
  store double -9.990000e+02, double* %62, align 8
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv63, i64 %indvars.iv.next54
  store double -9.990000e+02, double* %63, align 8
  %indvars.iv.next54.1 = add nsw i64 %indvars.iv53, 2
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv63, i64 %indvars.iv.next54.1
  store double -9.990000e+02, double* %64, align 8
  %indvars.iv.next54.2 = add nsw i64 %indvars.iv53, 3
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv63, i64 %indvars.iv.next54.2
  store double -9.990000e+02, double* %65, align 8
  %indvars.iv.next54.3 = add nsw i64 %indvars.iv53, 4
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv63, i64 %indvars.iv.next54.3
  store double -9.990000e+02, double* %66, align 8
  %indvars.iv.next54.4 = add nsw i64 %indvars.iv53, 5
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv63, i64 %indvars.iv.next54.4
  store double -9.990000e+02, double* %67, align 8
  %indvars.iv.next54.5 = add nsw i64 %indvars.iv53, 6
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv63, i64 %indvars.iv.next54.5
  store double -9.990000e+02, double* %68, align 8
  %indvars.iv.next54.6 = add nsw i64 %indvars.iv53, 7
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv63, i64 %indvars.iv.next54.6
  store double -9.990000e+02, double* %69, align 8
  %indvars.iv.next54.7 = add nsw i64 %indvars.iv53, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next54.7, 1000
  br i1 %exitcond.7, label %._crit_edge.loopexit, label %.lr.ph45.new, !llvm.loop !6

._crit_edge.loopexit:                             ; preds = %.lr.ph45.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %middle.block, %.prol.loopexit56, %.preheader
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond = icmp eq i64 %indvars.iv.next64, 1000
  br i1 %exitcond, label %70, label %.lr.ph

; <label>:70:                                     ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_symm(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1200 x double]* nocapture readonly) #2 {
  %8 = fmul double %2, 0.000000e+00
  %broadcast.splatinsert80 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat81 = shufflevector <2 x double> %broadcast.splatinsert80, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert84 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat85 = shufflevector <2 x double> %broadcast.splatinsert84, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert86 = insertelement <2 x double> undef, double %8, i32 0
  %broadcast.splat87 = shufflevector <2 x double> %broadcast.splatinsert86, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader44

.preheader44:                                     ; preds = %.us-lcssa.us, %7
  %indvars.iv62 = phi i64 [ 0, %7 ], [ %indvars.iv.next63, %.us-lcssa.us ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv62, i64 0
  %9 = add i64 %indvars.iv62, 1
  %scevgep68 = getelementptr [1200 x double], [1200 x double]* %4, i64 %9, i64 0
  %10 = icmp sgt i64 %indvars.iv62, 0
  %11 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv62, i64 %indvars.iv62
  br i1 %10, label %.preheader.us.preheader, label %vector.memcheck

.preheader.us.preheader:                          ; preds = %.preheader44
  br label %.preheader.us

vector.memcheck:                                  ; preds = %.preheader44
  %scevgep72 = getelementptr [1200 x double], [1200 x double]* %6, i64 %9, i64 0
  %scevgep70 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv62, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep72
  %bound1 = icmp ult double* %scevgep70, %scevgep68
  %found.conflict = and i1 %bound0, %bound1
  %bound075 = icmp ult double* %scevgep, %11
  %bound176 = icmp ult double* %11, %scevgep68
  %found.conflict77 = and i1 %bound075, %bound176
  %conflict.rdx = or i1 %found.conflict, %found.conflict77
  br i1 %conflict.rdx, label %.preheader.preheader, label %vector.ph

.preheader.preheader:                             ; preds = %vector.memcheck
  br label %.preheader

vector.ph:                                        ; preds = %vector.memcheck
  %12 = load double, double* %11, align 8, !alias.scope !8
  %13 = insertelement <2 x double> undef, double %12, i32 0
  %14 = shufflevector <2 x double> %13, <2 x double> undef, <2 x i32> zeroinitializer
  %15 = insertelement <2 x double> undef, double %12, i32 0
  %16 = shufflevector <2 x double> %15, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv62, i64 %index
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !11, !noalias !13
  %19 = getelementptr double, double* %17, i64 2
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load79 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !11, !noalias !13
  %21 = fmul <2 x double> %wide.load, %broadcast.splat81
  %22 = fmul <2 x double> %wide.load79, %broadcast.splat81
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv62, i64 %index
  %24 = bitcast double* %23 to <2 x double>*
  %wide.load82 = load <2 x double>, <2 x double>* %24, align 8, !alias.scope !15
  %25 = getelementptr double, double* %23, i64 2
  %26 = bitcast double* %25 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %26, align 8, !alias.scope !15
  %27 = fmul <2 x double> %wide.load82, %broadcast.splat85
  %28 = fmul <2 x double> %wide.load83, %broadcast.splat85
  %29 = fmul <2 x double> %27, %14
  %30 = fmul <2 x double> %28, %16
  %31 = fadd <2 x double> %21, %29
  %32 = fadd <2 x double> %22, %30
  %33 = fadd <2 x double> %broadcast.splat87, %31
  %34 = fadd <2 x double> %broadcast.splat87, %32
  %35 = bitcast double* %17 to <2 x double>*
  store <2 x double> %33, <2 x double>* %35, align 8, !alias.scope !11, !noalias !13
  %36 = bitcast double* %19 to <2 x double>*
  store <2 x double> %34, <2 x double>* %36, align 8, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %37 = icmp eq i64 %index.next, 1200
  br i1 %37, label %.us-lcssa.us.loopexit89, label %vector.body, !llvm.loop !16

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv62, i64 %indvars.iv59
  br label %39

; <label>:39:                                     ; preds = %39, %.preheader.us
  %indvars.iv54 = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next55, %39 ]
  %.047.us = phi double [ 0.000000e+00, %.preheader.us ], [ %53, %39 ]
  %40 = load double, double* %38, align 8
  %41 = fmul double %40, %2
  %42 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv62, i64 %indvars.iv54
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv54, i64 %indvars.iv59
  %46 = load double, double* %45, align 8
  %47 = fadd double %46, %44
  store double %47, double* %45, align 8
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv54, i64 %indvars.iv59
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv62, i64 %indvars.iv54
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = fadd double %.047.us, %52
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next55, %indvars.iv62
  br i1 %exitcond58, label %._crit_edge.us, label %39

._crit_edge.us:                                   ; preds = %39
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv62, i64 %indvars.iv59
  %55 = load double, double* %54, align 8
  %56 = fmul double %55, %3
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv62, i64 %indvars.iv59
  %58 = load double, double* %57, align 8
  %59 = fmul double %58, %2
  %60 = load double, double* %11, align 8
  %61 = fmul double %59, %60
  %62 = fadd double %56, %61
  %63 = fmul double %53, %2
  %64 = fadd double %63, %62
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv62, i64 %indvars.iv59
  store double %64, double* %65, align 8
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next60, 1200
  br i1 %exitcond61, label %.us-lcssa.us.loopexit, label %.preheader.us

.preheader:                                       ; preds = %.preheader, %.preheader.preheader
  %indvars.iv = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next.1, %.preheader ]
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv62, i64 %indvars.iv
  %67 = load double, double* %66, align 8
  %68 = fmul double %67, %3
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv62, i64 %indvars.iv
  %70 = load double, double* %69, align 8
  %71 = fmul double %70, %2
  %72 = load double, double* %11, align 8
  %73 = fmul double %71, %72
  %74 = fadd double %68, %73
  %75 = fadd double %8, %74
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv62, i64 %indvars.iv
  store double %75, double* %76, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv62, i64 %indvars.iv.next
  %78 = load double, double* %77, align 8
  %79 = fmul double %78, %3
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv62, i64 %indvars.iv.next
  %81 = load double, double* %80, align 8
  %82 = fmul double %81, %2
  %83 = load double, double* %11, align 8
  %84 = fmul double %82, %83
  %85 = fadd double %79, %84
  %86 = fadd double %8, %85
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv62, i64 %indvars.iv.next
  store double %86, double* %87, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %.us-lcssa.us.loopexit88, label %.preheader, !llvm.loop !17

.us-lcssa.us.loopexit:                            ; preds = %._crit_edge.us
  br label %.us-lcssa.us

.us-lcssa.us.loopexit88:                          ; preds = %.preheader
  br label %.us-lcssa.us

.us-lcssa.us.loopexit89:                          ; preds = %vector.body
  br label %.us-lcssa.us

.us-lcssa.us:                                     ; preds = %.us-lcssa.us.loopexit89, %.us-lcssa.us.loopexit88, %.us-lcssa.us.loopexit
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next63, 1000
  br i1 %exitcond64, label %88, label %.preheader44

; <label>:88:                                     ; preds = %.us-lcssa.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1200 x double]* nocapture readonly) #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader

.preheader:                                       ; preds = %21, %3
  %indvars.iv14 = phi i64 [ 0, %3 ], [ %indvars.iv.next15, %21 ]
  %8 = mul nuw nsw i64 %indvars.iv14, 1000
  br label %9

; <label>:9:                                      ; preds = %16, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %16 ]
  %10 = add nuw nsw i64 %indvars.iv, %8
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %16

; <label>:16:                                     ; preds = %9, %14
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv14, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %21, label %9

; <label>:21:                                     ; preds = %16
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 1000
  br i1 %exitcond16, label %22, label %.preheader

; <label>:22:                                     ; preds = %21
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %25) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

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
