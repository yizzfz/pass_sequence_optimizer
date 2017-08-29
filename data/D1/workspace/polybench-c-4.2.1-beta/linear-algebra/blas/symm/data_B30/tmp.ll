; ModuleID = 'A.ll'
source_filename = "symm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
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
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  call void @kernel_symm(i32 1000, i32 1200, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1200 x double]* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %14
  call void @print_array(i32 1000, i32 1200, [1200 x double]* %8)
  br label %18

; <label>:18:                                     ; preds = %14, %17, %2
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) #2 {
.preheader40.lr.ph:
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br label %.preheader40.us

.preheader40.us:                                  ; preds = %._crit_edge50.us, %.preheader40.lr.ph
  %indvars.iv75 = phi i64 [ 0, %.preheader40.lr.ph ], [ %indvars.iv.next76, %._crit_edge50.us ]
  %7 = add i64 %indvars.iv75, 1200
  %8 = trunc i64 %7 to i32
  br label %9

; <label>:9:                                      ; preds = %9, %.preheader40.us
  %indvars.iv72 = phi i64 [ 0, %.preheader40.us ], [ %indvars.iv.next73, %9 ]
  %10 = add nuw nsw i64 %indvars.iv72, %indvars.iv75
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 100
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 1.000000e+03
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv75, i64 %indvars.iv72
  store double %14, double* %15, align 8
  %16 = trunc i64 %indvars.iv72 to i32
  %17 = sub i32 %8, %16
  %18 = srem i32 %17, 100
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, 1.000000e+03
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv75, i64 %indvars.iv72
  store double %20, double* %21, align 8
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond74 = icmp eq i64 %indvars.iv.next73, 1200
  br i1 %exitcond74, label %._crit_edge50.us, label %9

._crit_edge50.us:                                 ; preds = %9
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond78 = icmp eq i64 %indvars.iv.next76, 1000
  br i1 %exitcond78, label %.lr.ph.preheader, label %.preheader40.us

.lr.ph.preheader:                                 ; preds = %._crit_edge50.us
  br label %.lr.ph

.loopexit.loopexit:                               ; preds = %.lr.ph44.new
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %middle.block, %.prol.loopexit62, %._crit_edge
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond = icmp eq i64 %indvars.iv.next70, 1000
  br i1 %exitcond, label %._crit_edge47, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.loopexit
  %indvars.iv69 = phi i64 [ %indvars.iv.next70, %.loopexit ], [ 0, %.lr.ph.preheader ]
  %indvars.iv67 = phi i64 [ %indvars.iv.next68, %.loopexit ], [ 1, %.lr.ph.preheader ]
  %22 = sub nsw i64 0, %indvars.iv69
  %23 = trunc i64 %22 to i32
  %24 = add i32 %23, 7
  %25 = trunc i64 %22 to i32
  %26 = add i32 %25, 998
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %xtraiter80 = and i64 %indvars.iv.next70, 1
  %lcmp.mod = icmp eq i64 %xtraiter80, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  %27 = trunc i64 %indvars.iv69 to i32
  %28 = srem i32 %27, 100
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, 1.000000e+03
  %31 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 0
  store double %30, double* %31, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %32 = icmp eq i64 %indvars.iv69, 0
  br i1 %32, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %33 = add nuw nsw i64 %indvars.iv, %indvars.iv69
  %34 = trunc i64 %33 to i32
  %35 = srem i32 %34, 100
  %36 = sitofp i32 %35 to double
  %37 = fdiv double %36, 1.000000e+03
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %indvars.iv
  store double %37, double* %38, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %39 = add nuw nsw i64 %indvars.iv.next, %indvars.iv69
  %40 = trunc i64 %39 to i32
  %41 = srem i32 %40, 100
  %42 = sitofp i32 %41 to double
  %43 = fdiv double %42, 1.000000e+03
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %indvars.iv.next
  store double %43, double* %44, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv67
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit
  %45 = icmp slt i64 %indvars.iv.next70, 1000
  br i1 %45, label %.lr.ph44, label %.loopexit

.lr.ph44:                                         ; preds = %._crit_edge
  %xtraiter63 = and i32 %24, 7
  %lcmp.mod64 = icmp eq i32 %xtraiter63, 0
  br i1 %lcmp.mod64, label %.prol.loopexit62, label %.prol.preheader61.preheader

.prol.preheader61.preheader:                      ; preds = %.lr.ph44
  br label %.prol.preheader61

.prol.preheader61:                                ; preds = %.prol.preheader61.preheader, %.prol.preheader61
  %indvars.iv58.prol = phi i64 [ %indvars.iv.next59.prol, %.prol.preheader61 ], [ %indvars.iv67, %.prol.preheader61.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader61 ], [ %xtraiter63, %.prol.preheader61.preheader ]
  %46 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %indvars.iv58.prol
  store double -9.990000e+02, double* %46, align 8
  %indvars.iv.next59.prol = add nuw nsw i64 %indvars.iv58.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit62.loopexit, label %.prol.preheader61, !llvm.loop !1

.prol.loopexit62.loopexit:                        ; preds = %.prol.preheader61
  br label %.prol.loopexit62

.prol.loopexit62:                                 ; preds = %.prol.loopexit62.loopexit, %.lr.ph44
  %indvars.iv58.unr = phi i64 [ %indvars.iv67, %.lr.ph44 ], [ %indvars.iv.next59.prol, %.prol.loopexit62.loopexit ]
  %47 = icmp ult i32 %26, 7
  br i1 %47, label %.loopexit, label %.lr.ph44.new.preheader

.lr.ph44.new.preheader:                           ; preds = %.prol.loopexit62
  %48 = sub i64 992, %indvars.iv58.unr
  %49 = lshr i64 %48, 3
  %50 = add nuw nsw i64 %49, 1
  %min.iters.check = icmp ult i64 %50, 2
  br i1 %min.iters.check, label %.lr.ph44.new.preheader82, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph44.new.preheader
  %n.mod.vf = and i64 %50, 1
  %n.vec = sub nsw i64 %50, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %51 = add i64 %indvars.iv58.unr, 8
  %52 = shl nuw i64 %49, 3
  %53 = add i64 %51, %52
  %54 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %53, %54
  br i1 %cmp.zero, label %.lr.ph44.new.preheader82, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %55 = shl i64 %index, 3
  %56 = add i64 %indvars.iv58.unr, %55
  %57 = add nsw i64 %56, 7
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %57
  %59 = getelementptr double, double* %58, i64 -7
  %60 = bitcast double* %59 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %60, align 8
  %index.next = add i64 %index, 2
  %61 = icmp eq i64 %index.next, %n.vec
  br i1 %61, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.loopexit, label %.lr.ph44.new.preheader82

.lr.ph44.new.preheader82:                         ; preds = %middle.block, %min.iters.checked, %.lr.ph44.new.preheader
  %indvars.iv58.ph = phi i64 [ %indvars.iv58.unr, %min.iters.checked ], [ %indvars.iv58.unr, %.lr.ph44.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph44.new

.lr.ph44.new:                                     ; preds = %.lr.ph44.new.preheader82, %.lr.ph44.new
  %indvars.iv58 = phi i64 [ %indvars.iv.next59.7, %.lr.ph44.new ], [ %indvars.iv58.ph, %.lr.ph44.new.preheader82 ]
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %indvars.iv58
  store double -9.990000e+02, double* %62, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv58, 1
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %indvars.iv.next59
  store double -9.990000e+02, double* %63, align 8
  %indvars.iv.next59.1 = add nsw i64 %indvars.iv58, 2
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %indvars.iv.next59.1
  store double -9.990000e+02, double* %64, align 8
  %indvars.iv.next59.2 = add nsw i64 %indvars.iv58, 3
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %indvars.iv.next59.2
  store double -9.990000e+02, double* %65, align 8
  %indvars.iv.next59.3 = add nsw i64 %indvars.iv58, 4
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %indvars.iv.next59.3
  store double -9.990000e+02, double* %66, align 8
  %indvars.iv.next59.4 = add nsw i64 %indvars.iv58, 5
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %indvars.iv.next59.4
  store double -9.990000e+02, double* %67, align 8
  %indvars.iv.next59.5 = add nsw i64 %indvars.iv58, 6
  %68 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %indvars.iv.next59.5
  store double -9.990000e+02, double* %68, align 8
  %indvars.iv.next59.6 = add nsw i64 %indvars.iv58, 7
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv69, i64 %indvars.iv.next59.6
  store double -9.990000e+02, double* %69, align 8
  %indvars.iv.next59.7 = add nsw i64 %indvars.iv58, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next59.7, 1000
  br i1 %exitcond.7, label %.loopexit.loopexit, label %.lr.ph44.new, !llvm.loop !6

._crit_edge47:                                    ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_symm(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1200 x double]* nocapture readonly) #2 {
.preheader44.lr.ph:
  %7 = fmul double %2, 0.000000e+00
  %broadcast.splatinsert102 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat103 = shufflevector <2 x double> %broadcast.splatinsert102, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert106 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat107 = shufflevector <2 x double> %broadcast.splatinsert106, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert108 = insertelement <2 x double> undef, double %7, i32 0
  %broadcast.splat109 = shufflevector <2 x double> %broadcast.splatinsert108, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader44.us

.preheader44.us:                                  ; preds = %.preheader44.lr.ph, %._crit_edge51.us
  %indvars.iv82 = phi i64 [ %indvars.iv.next83, %._crit_edge51.us ], [ 0, %.preheader44.lr.ph ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 0
  %8 = add i64 %indvars.iv82, 1
  %scevgep90 = getelementptr [1200 x double], [1200 x double]* %4, i64 %8, i64 0
  %9 = icmp sgt i64 %indvars.iv82, 0
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv82, i64 %indvars.iv82
  br i1 %9, label %.preheader.us.us.preheader, label %vector.memcheck

.preheader.us.us.preheader:                       ; preds = %.preheader44.us
  br label %.preheader.us.us

vector.memcheck:                                  ; preds = %.preheader44.us
  %scevgep94 = getelementptr [1200 x double], [1200 x double]* %6, i64 %8, i64 0
  %scevgep92 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep94
  %bound1 = icmp ult double* %scevgep92, %scevgep90
  %found.conflict = and i1 %bound0, %bound1
  %bound097 = icmp ult double* %scevgep, %10
  %bound198 = icmp ult double* %10, %scevgep90
  %found.conflict99 = and i1 %bound097, %bound198
  %conflict.rdx = or i1 %found.conflict, %found.conflict99
  br i1 %conflict.rdx, label %.preheader.us61.preheader, label %vector.ph

.preheader.us61.preheader:                        ; preds = %vector.memcheck
  br label %.preheader.us61

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 %index
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %12, align 8, !alias.scope !8, !noalias !11
  %13 = getelementptr double, double* %11, i64 2
  %14 = bitcast double* %13 to <2 x double>*
  %wide.load101 = load <2 x double>, <2 x double>* %14, align 8, !alias.scope !8, !noalias !11
  %15 = fmul <2 x double> %wide.load, %broadcast.splat103
  %16 = fmul <2 x double> %wide.load101, %broadcast.splat103
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 %index
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load104 = load <2 x double>, <2 x double>* %18, align 8, !alias.scope !14
  %19 = getelementptr double, double* %17, i64 2
  %20 = bitcast double* %19 to <2 x double>*
  %wide.load105 = load <2 x double>, <2 x double>* %20, align 8, !alias.scope !14
  %21 = fmul <2 x double> %wide.load104, %broadcast.splat107
  %22 = fmul <2 x double> %wide.load105, %broadcast.splat107
  %23 = load double, double* %10, align 8, !alias.scope !15
  %24 = insertelement <2 x double> undef, double %23, i32 0
  %25 = shufflevector <2 x double> %24, <2 x double> undef, <2 x i32> zeroinitializer
  %26 = insertelement <2 x double> undef, double %23, i32 0
  %27 = shufflevector <2 x double> %26, <2 x double> undef, <2 x i32> zeroinitializer
  %28 = fmul <2 x double> %21, %25
  %29 = fmul <2 x double> %22, %27
  %30 = fadd <2 x double> %15, %28
  %31 = fadd <2 x double> %16, %29
  %32 = fadd <2 x double> %broadcast.splat109, %30
  %33 = fadd <2 x double> %broadcast.splat109, %31
  %34 = bitcast double* %11 to <2 x double>*
  store <2 x double> %32, <2 x double>* %34, align 8, !alias.scope !8, !noalias !11
  %35 = bitcast double* %13 to <2 x double>*
  store <2 x double> %33, <2 x double>* %35, align 8, !alias.scope !8, !noalias !11
  %index.next = add i64 %index, 4
  %36 = icmp eq i64 %index.next, 1200
  br i1 %36, label %._crit_edge51.us.loopexit111, label %vector.body, !llvm.loop !16

.preheader.us61:                                  ; preds = %.preheader.us61, %.preheader.us61.preheader
  %indvars.iv = phi i64 [ 0, %.preheader.us61.preheader ], [ %indvars.iv.next.1, %.preheader.us61 ]
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 %indvars.iv
  %38 = load double, double* %37, align 8
  %39 = fmul double %38, %3
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 %indvars.iv
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %2
  %43 = load double, double* %10, align 8
  %44 = fmul double %42, %43
  %45 = fadd double %39, %44
  %46 = fadd double %7, %45
  store double %46, double* %37, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 %indvars.iv.next
  %48 = load double, double* %47, align 8
  %49 = fmul double %48, %3
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 %indvars.iv.next
  %51 = load double, double* %50, align 8
  %52 = fmul double %51, %2
  %53 = load double, double* %10, align 8
  %54 = fmul double %52, %53
  %55 = fadd double %49, %54
  %56 = fadd double %7, %55
  store double %56, double* %47, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %._crit_edge51.us.loopexit110, label %.preheader.us61, !llvm.loop !17

._crit_edge51.us.loopexit:                        ; preds = %._crit_edge.us.us
  br label %._crit_edge51.us

._crit_edge51.us.loopexit110:                     ; preds = %.preheader.us61
  br label %._crit_edge51.us

._crit_edge51.us.loopexit111:                     ; preds = %vector.body
  br label %._crit_edge51.us

._crit_edge51.us:                                 ; preds = %._crit_edge51.us.loopexit111, %._crit_edge51.us.loopexit110, %._crit_edge51.us.loopexit
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond85 = icmp eq i64 %indvars.iv.next83, 1000
  br i1 %exitcond85, label %._crit_edge55, label %.preheader44.us

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv78 = phi i64 [ %indvars.iv.next79, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 %indvars.iv78
  br label %69

._crit_edge.us.us:                                ; preds = %69
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv82, i64 %indvars.iv78
  %59 = load double, double* %58, align 8
  %60 = fmul double %59, %3
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv82, i64 %indvars.iv78
  %62 = load double, double* %61, align 8
  %63 = fmul double %62, %2
  %64 = load double, double* %10, align 8
  %65 = fmul double %63, %64
  %66 = fadd double %60, %65
  %67 = fmul double %82, %2
  %68 = fadd double %67, %66
  store double %68, double* %58, align 8
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %exitcond81 = icmp eq i64 %indvars.iv.next79, 1200
  br i1 %exitcond81, label %._crit_edge51.us.loopexit, label %.preheader.us.us

; <label>:69:                                     ; preds = %69, %.preheader.us.us
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %69 ], [ 0, %.preheader.us.us ]
  %.047.us.us = phi double [ %82, %69 ], [ 0.000000e+00, %.preheader.us.us ]
  %70 = load double, double* %57, align 8
  %71 = fmul double %70, %2
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv82, i64 %indvars.iv72
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv72, i64 %indvars.iv78
  %76 = load double, double* %75, align 8
  %77 = fadd double %76, %74
  store double %77, double* %75, align 8
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv72, i64 %indvars.iv78
  %79 = load double, double* %78, align 8
  %80 = load double, double* %72, align 8
  %81 = fmul double %79, %80
  %82 = fadd double %.047.us.us, %81
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond77 = icmp eq i64 %indvars.iv.next73, %indvars.iv82
  br i1 %exitcond77, label %._crit_edge.us.us, label %69

._crit_edge55:                                    ; preds = %._crit_edge51.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1200 x double]* nocapture readonly) #0 {
.preheader.lr.ph:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv15 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next16, %._crit_edge.us ]
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
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %8

._crit_edge.us:                                   ; preds = %15
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next16, 1000
  br i1 %exitcond18, label %._crit_edge13, label %.preheader.us

._crit_edge13:                                    ; preds = %._crit_edge.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

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
