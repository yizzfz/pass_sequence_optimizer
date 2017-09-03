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
._crit_edge.lr.ph:
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge13.us, %._crit_edge.lr.ph
  %indvars.iv34 = phi i64 [ 0, %._crit_edge.lr.ph ], [ %indvars.iv.next35, %._crit_edge13.us ]
  %7 = add i64 %indvars.iv34, 1200
  %8 = trunc i64 %7 to i32
  br label %9

; <label>:9:                                      ; preds = %9, %._crit_edge.us
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %9 ], [ 0, %._crit_edge.us ]
  %10 = add nuw nsw i64 %indvars.iv31, %indvars.iv34
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 100
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 1.000000e+03
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv34, i64 %indvars.iv31
  store double %14, double* %15, align 8
  %16 = trunc i64 %indvars.iv31 to i32
  %17 = sub i32 %8, %16
  %18 = srem i32 %17, 100
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, 1.000000e+03
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv34, i64 %indvars.iv31
  store double %20, double* %21, align 8
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next32, 1200
  br i1 %exitcond44, label %._crit_edge13.us, label %9

._crit_edge13.us:                                 ; preds = %9
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next35, 1000
  br i1 %exitcond45, label %.lr.ph.preheader, label %._crit_edge.us

.lr.ph.preheader:                                 ; preds = %._crit_edge13.us
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge8
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %._crit_edge8 ], [ 0, %.lr.ph.preheader ]
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %._crit_edge8 ], [ 1, %.lr.ph.preheader ]
  %22 = sub i64 1007, %indvars.iv27
  %23 = sub i64 998, %indvars.iv27
  %24 = and i64 %indvars.iv27, 1
  %lcmp.mod = icmp eq i64 %24, 0
  br i1 %lcmp.mod, label %.prol.preheader, label %.prol.loopexit

.prol.preheader:                                  ; preds = %.lr.ph
  %25 = trunc i64 %indvars.iv27 to i32
  %26 = srem i32 %25, 100
  %27 = sitofp i32 %26 to double
  %28 = fdiv double %27, 1.000000e+03
  %29 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 0
  store double %28, double* %29, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph ]
  %30 = icmp eq i64 %indvars.iv27, 0
  br i1 %30, label %._crit_edge5, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

._crit_edge5.loopexit:                            ; preds = %.lr.ph.new
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit, %.prol.loopexit
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %31 = icmp slt i64 %indvars.iv.next28, 1000
  br i1 %31, label %.lr.ph7, label %._crit_edge8

.lr.ph7:                                          ; preds = %._crit_edge5
  %xtraiter48 = and i64 %22, 7
  %lcmp.mod49 = icmp eq i64 %xtraiter48, 0
  br i1 %lcmp.mod49, label %.prol.loopexit47, label %.prol.preheader46.preheader

.prol.preheader46.preheader:                      ; preds = %.lr.ph7
  br label %.prol.preheader46

.prol.preheader46:                                ; preds = %.prol.preheader46.preheader, %.prol.preheader46
  %indvars.iv21.prol = phi i64 [ %indvars.iv.next22.prol, %.prol.preheader46 ], [ %indvars.iv25, %.prol.preheader46.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.prol.preheader46 ], [ %xtraiter48, %.prol.preheader46.preheader ]
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv21.prol
  store double -9.990000e+02, double* %32, align 8
  %indvars.iv.next22.prol = add nuw nsw i64 %indvars.iv21.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit47.loopexit, label %.prol.preheader46, !llvm.loop !1

.prol.loopexit47.loopexit:                        ; preds = %.prol.preheader46
  br label %.prol.loopexit47

.prol.loopexit47:                                 ; preds = %.prol.loopexit47.loopexit, %.lr.ph7
  %indvars.iv21.unr = phi i64 [ %indvars.iv25, %.lr.ph7 ], [ %indvars.iv.next22.prol, %.prol.loopexit47.loopexit ]
  %33 = icmp ult i64 %23, 7
  br i1 %33, label %._crit_edge8, label %.lr.ph7.new.preheader

.lr.ph7.new.preheader:                            ; preds = %.prol.loopexit47
  %34 = sub i64 992, %indvars.iv21.unr
  %35 = lshr i64 %34, 3
  %36 = add nuw nsw i64 %35, 1
  %min.iters.check = icmp ult i64 %36, 2
  br i1 %min.iters.check, label %.lr.ph7.new.preheader51, label %min.iters.checked

.lr.ph7.new.preheader51:                          ; preds = %middle.block, %min.iters.checked, %.lr.ph7.new.preheader
  %indvars.iv21.ph = phi i64 [ %indvars.iv21.unr, %min.iters.checked ], [ %indvars.iv21.unr, %.lr.ph7.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph7.new

min.iters.checked:                                ; preds = %.lr.ph7.new.preheader
  %n.mod.vf = and i64 %36, 1
  %n.vec = sub nsw i64 %36, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %37 = add i64 %indvars.iv21.unr, 8
  %38 = shl nuw i64 %35, 3
  %39 = add i64 %37, %38
  %40 = shl nuw nsw i64 %n.mod.vf, 3
  %ind.end = sub i64 %39, %40
  br i1 %cmp.zero, label %.lr.ph7.new.preheader51, label %vector.body.preheader

vector.body.preheader:                            ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %41 = shl i64 %index, 3
  %42 = add i64 %indvars.iv21.unr, %41
  %43 = add nsw i64 %42, 7
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %43
  %45 = getelementptr double, double* %44, i64 -7
  %46 = bitcast double* %45 to <16 x double>*
  store <16 x double> <double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02, double -9.990000e+02>, <16 x double>* %46, align 8
  %index.next = add i64 %index, 2
  %47 = icmp eq i64 %index.next, %n.vec
  br i1 %47, label %middle.block, label %vector.body, !llvm.loop !3

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge8, label %.lr.ph7.new.preheader51

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %48 = add nuw nsw i64 %indvars.iv, %indvars.iv27
  %49 = trunc i64 %48 to i32
  %50 = srem i32 %49, 100
  %51 = sitofp i32 %50 to double
  %52 = fdiv double %51, 1.000000e+03
  %53 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv
  store double %52, double* %53, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %54 = add nuw nsw i64 %indvars.iv.next, %indvars.iv27
  %55 = trunc i64 %54 to i32
  %56 = srem i32 %55, 100
  %57 = sitofp i32 %56 to double
  %58 = fdiv double %57, 1.000000e+03
  %59 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv.next
  store double %58, double* %59, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv25
  br i1 %exitcond.1, label %._crit_edge5.loopexit, label %.lr.ph.new

.lr.ph7.new:                                      ; preds = %.lr.ph7.new.preheader51, %.lr.ph7.new
  %indvars.iv21 = phi i64 [ %indvars.iv.next22.7, %.lr.ph7.new ], [ %indvars.iv21.ph, %.lr.ph7.new.preheader51 ]
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv21
  store double -9.990000e+02, double* %60, align 8
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %61 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv.next22
  store double -9.990000e+02, double* %61, align 8
  %indvars.iv.next22.1 = add nsw i64 %indvars.iv21, 2
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv.next22.1
  store double -9.990000e+02, double* %62, align 8
  %indvars.iv.next22.2 = add nsw i64 %indvars.iv21, 3
  %63 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv.next22.2
  store double -9.990000e+02, double* %63, align 8
  %indvars.iv.next22.3 = add nsw i64 %indvars.iv21, 4
  %64 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv.next22.3
  store double -9.990000e+02, double* %64, align 8
  %indvars.iv.next22.4 = add nsw i64 %indvars.iv21, 5
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv.next22.4
  store double -9.990000e+02, double* %65, align 8
  %indvars.iv.next22.5 = add nsw i64 %indvars.iv21, 6
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv.next22.5
  store double -9.990000e+02, double* %66, align 8
  %indvars.iv.next22.6 = add nsw i64 %indvars.iv21, 7
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv27, i64 %indvars.iv.next22.6
  store double -9.990000e+02, double* %67, align 8
  %indvars.iv.next22.7 = add nsw i64 %indvars.iv21, 8
  %exitcond40.7 = icmp eq i64 %indvars.iv.next22.7, 1000
  br i1 %exitcond40.7, label %._crit_edge8.loopexit, label %.lr.ph7.new, !llvm.loop !6

._crit_edge8.loopexit:                            ; preds = %.lr.ph7.new
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8.loopexit, %middle.block, %.prol.loopexit47, %._crit_edge5
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next28, 1000
  br i1 %exitcond42, label %._crit_edge10, label %.lr.ph

._crit_edge10:                                    ; preds = %._crit_edge8
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_symm(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #2 {
._crit_edge.us.preheader:
  %7 = fmul double %2, 0.000000e+00
  %broadcast.splatinsert65 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat66 = shufflevector <2 x double> %broadcast.splatinsert65, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert69 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat70 = shufflevector <2 x double> %broadcast.splatinsert69, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert71 = insertelement <2 x double> undef, double %7, i32 0
  %broadcast.splat72 = shufflevector <2 x double> %broadcast.splatinsert71, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge12.us
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %._crit_edge12.us ], [ 0, %._crit_edge.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv41, i64 0
  %8 = add i64 %indvars.iv41, 1
  %scevgep53 = getelementptr [1200 x double], [1200 x double]* %4, i64 %8, i64 0
  %9 = icmp sgt i64 %indvars.iv41, 0
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv41, i64 %indvars.iv41
  br i1 %9, label %._crit_edge4.us.us.preheader, label %vector.memcheck

._crit_edge4.us.us.preheader:                     ; preds = %._crit_edge.us
  br label %._crit_edge4.us.us

vector.memcheck:                                  ; preds = %._crit_edge.us
  %scevgep57 = getelementptr [1200 x double], [1200 x double]* %6, i64 %8, i64 0
  %scevgep55 = getelementptr [1200 x double], [1200 x double]* %6, i64 %indvars.iv41, i64 0
  %bound0 = icmp ult double* %scevgep, %scevgep57
  %bound1 = icmp ult double* %scevgep55, %scevgep53
  %found.conflict = and i1 %bound0, %bound1
  %bound060 = icmp ult double* %scevgep, %10
  %bound161 = icmp ult double* %10, %scevgep53
  %found.conflict62 = and i1 %bound060, %bound161
  %conflict.rdx = or i1 %found.conflict, %found.conflict62
  br i1 %conflict.rdx, label %._crit_edge4.us15.preheader, label %vector.ph

._crit_edge4.us15.preheader:                      ; preds = %vector.memcheck
  br label %._crit_edge4.us15

vector.ph:                                        ; preds = %vector.memcheck
  %11 = load double, double* %10, align 8, !alias.scope !8
  %12 = insertelement <2 x double> undef, double %11, i32 0
  %13 = shufflevector <2 x double> %12, <2 x double> undef, <2 x i32> zeroinitializer
  %14 = insertelement <2 x double> undef, double %11, i32 0
  %15 = shufflevector <2 x double> %14, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv41, i64 %index
  %17 = bitcast double* %16 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %17, align 8, !alias.scope !11, !noalias !13
  %18 = getelementptr double, double* %16, i64 2
  %19 = bitcast double* %18 to <2 x double>*
  %wide.load64 = load <2 x double>, <2 x double>* %19, align 8, !alias.scope !11, !noalias !13
  %20 = fmul <2 x double> %wide.load, %broadcast.splat66
  %21 = fmul <2 x double> %wide.load64, %broadcast.splat66
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv41, i64 %index
  %23 = bitcast double* %22 to <2 x double>*
  %wide.load67 = load <2 x double>, <2 x double>* %23, align 8, !alias.scope !15
  %24 = getelementptr double, double* %22, i64 2
  %25 = bitcast double* %24 to <2 x double>*
  %wide.load68 = load <2 x double>, <2 x double>* %25, align 8, !alias.scope !15
  %26 = fmul <2 x double> %wide.load67, %broadcast.splat70
  %27 = fmul <2 x double> %wide.load68, %broadcast.splat70
  %28 = fmul <2 x double> %26, %13
  %29 = fmul <2 x double> %27, %15
  %30 = fadd <2 x double> %20, %28
  %31 = fadd <2 x double> %21, %29
  %32 = fadd <2 x double> %broadcast.splat72, %30
  %33 = fadd <2 x double> %broadcast.splat72, %31
  %34 = bitcast double* %16 to <2 x double>*
  store <2 x double> %32, <2 x double>* %34, align 8, !alias.scope !11, !noalias !13
  %35 = bitcast double* %18 to <2 x double>*
  store <2 x double> %33, <2 x double>* %35, align 8, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %36 = icmp eq i64 %index.next, 1200
  br i1 %36, label %._crit_edge12.us.loopexit74, label %vector.body, !llvm.loop !16

._crit_edge4.us15:                                ; preds = %._crit_edge4.us15, %._crit_edge4.us15.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge4.us15.preheader ], [ %indvars.iv.next.1, %._crit_edge4.us15 ]
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv41, i64 %indvars.iv
  %38 = load double, double* %37, align 8
  %39 = fmul double %38, %3
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv41, i64 %indvars.iv
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %2
  %43 = load double, double* %10, align 8
  %44 = fmul double %42, %43
  %45 = fadd double %39, %44
  %46 = fadd double %7, %45
  store double %46, double* %37, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv41, i64 %indvars.iv.next
  %48 = load double, double* %47, align 8
  %49 = fmul double %48, %3
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv41, i64 %indvars.iv.next
  %51 = load double, double* %50, align 8
  %52 = fmul double %51, %2
  %53 = load double, double* %10, align 8
  %54 = fmul double %52, %53
  %55 = fadd double %49, %54
  %56 = fadd double %7, %55
  store double %56, double* %47, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond47.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond47.1, label %._crit_edge12.us.loopexit73, label %._crit_edge4.us15, !llvm.loop !17

._crit_edge12.us.loopexit:                        ; preds = %._crit_edge8.us.us
  br label %._crit_edge12.us

._crit_edge12.us.loopexit73:                      ; preds = %._crit_edge4.us15
  br label %._crit_edge12.us

._crit_edge12.us.loopexit74:                      ; preds = %vector.body
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %._crit_edge12.us.loopexit74, %._crit_edge12.us.loopexit73, %._crit_edge12.us.loopexit
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next42, 1000
  br i1 %exitcond49, label %._crit_edge14, label %._crit_edge.us

._crit_edge4.us.us:                               ; preds = %._crit_edge4.us.us.preheader, %._crit_edge8.us.us
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %._crit_edge8.us.us ], [ 0, %._crit_edge4.us.us.preheader ]
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv41, i64 %indvars.iv37
  br label %69

._crit_edge8.us.us:                               ; preds = %69
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv41, i64 %indvars.iv37
  %59 = load double, double* %58, align 8
  %60 = fmul double %59, %3
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv41, i64 %indvars.iv37
  %62 = load double, double* %61, align 8
  %63 = fmul double %62, %2
  %64 = load double, double* %10, align 8
  %65 = fmul double %63, %64
  %66 = fadd double %60, %65
  %67 = fmul double %82, %2
  %68 = fadd double %67, %66
  store double %68, double* %58, align 8
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond = icmp eq i64 %indvars.iv.next38, 1200
  br i1 %exitcond, label %._crit_edge12.us.loopexit, label %._crit_edge4.us.us

; <label>:69:                                     ; preds = %69, %._crit_edge4.us.us
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %69 ], [ 0, %._crit_edge4.us.us ]
  %.07.us.us = phi double [ %82, %69 ], [ 0.000000e+00, %._crit_edge4.us.us ]
  %70 = load double, double* %57, align 8
  %71 = fmul double %70, %2
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv41, i64 %indvars.iv31
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv37
  %76 = load double, double* %75, align 8
  %77 = fadd double %76, %74
  store double %77, double* %75, align 8
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv31, i64 %indvars.iv37
  %79 = load double, double* %78, align 8
  %80 = load double, double* %72, align 8
  %81 = fmul double %79, %80
  %82 = fadd double %.07.us.us, %81
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next32, %indvars.iv41
  br i1 %exitcond36, label %._crit_edge8.us.us, label %69

._crit_edge14:                                    ; preds = %._crit_edge12.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
._crit_edge.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge4.us, %._crit_edge.us.preheader
  %indvars.iv8 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next9, %._crit_edge4.us ]
  %7 = mul nsw i64 %indvars.iv8, 1000
  br label %8

; <label>:8:                                      ; preds = %._crit_edge2.us, %._crit_edge.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge2.us ], [ 0, %._crit_edge.us ]
  %9 = add nsw i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge2.us

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %8, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv8, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond14, label %._crit_edge4.us, label %8

._crit_edge4.us:                                  ; preds = %._crit_edge2.us
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond = icmp eq i64 %indvars.iv.next9, 1000
  br i1 %exitcond, label %._crit_edge6, label %._crit_edge.us

._crit_edge6:                                     ; preds = %._crit_edge4.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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
!11 = !{!12}
!12 = distinct !{!12, !10}
!13 = !{!14, !9}
!14 = distinct !{!14, !10}
!15 = !{!14}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}
