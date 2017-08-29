; ModuleID = 'A.ll'
source_filename = "syr2k.c"
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
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1000 x double]*
  call fastcc void @init_array(i32 1200, i32 1000, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  tail call fastcc void @kernel_syr2k(i32 1200, i32 1000, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %8)
  br label %18

; <label>:18:                                     ; preds = %14, %17, %2
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, double* nocapture, [1200 x double]* nocapture, [1000 x double]* nocapture, [1000 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  %8 = sext i32 %1 to i64
  %9 = sext i32 %0 to i64
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.preheader4.preheader.lr.ph, label %.preheader3._crit_edge

.preheader4.preheader.lr.ph:                      ; preds = %7
  %11 = icmp sgt i32 %1, 0
  %12 = sitofp i32 %0 to double
  %13 = sitofp i32 %1 to double
  br i1 %11, label %.preheader4.preheader.us.preheader, label %.preheader.preheader.preheader

.preheader4.preheader.us.preheader:               ; preds = %.preheader4.preheader.lr.ph
  br label %.preheader4.preheader.us

.preheader4.preheader.us:                         ; preds = %.preheader4.preheader.us.preheader, %.preheader4._crit_edge.us
  %indvars.iv917.us = phi i64 [ %indvars.iv.next10.us, %.preheader4._crit_edge.us ], [ 0, %.preheader4.preheader.us.preheader ]
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %.preheader4.us, %.preheader4.preheader.us
  %indvars.iv715.us = phi i64 [ 0, %.preheader4.preheader.us ], [ %indvars.iv.next8.us, %.preheader4.us ]
  %14 = mul nuw nsw i64 %indvars.iv715.us, %indvars.iv917.us
  %15 = add nuw nsw i64 %14, 1
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, %0
  %18 = sitofp i32 %17 to double
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv917.us, i64 %indvars.iv715.us
  %20 = add nuw nsw i64 %14, 2
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, %1
  %23 = sitofp i32 %22 to double
  %24 = insertelement <2 x double> undef, double %12, i32 0
  %25 = insertelement <2 x double> %24, double %13, i32 1
  %26 = insertelement <2 x double> undef, double %18, i32 0
  %27 = insertelement <2 x double> %26, double %23, i32 1
  %28 = fdiv <2 x double> %27, %25
  %29 = extractelement <2 x double> %28, i32 0
  %30 = extractelement <2 x double> %28, i32 1
  store double %29, double* %19, align 8
  %31 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv917.us, i64 %indvars.iv715.us
  store double %30, double* %31, align 8
  %indvars.iv.next8.us = add nuw nsw i64 %indvars.iv715.us, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next8.us, %8
  br i1 %exitcond22, label %.preheader4._crit_edge.us, label %.preheader4.us

.preheader4._crit_edge.us:                        ; preds = %.preheader4.us
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv917.us, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next10.us, %9
  br i1 %exitcond23, label %.preheader.preheader.preheader.loopexit, label %.preheader4.preheader.us

.preheader.preheader.preheader.loopexit:          ; preds = %.preheader4._crit_edge.us
  br label %.preheader.preheader.preheader

.preheader.preheader.preheader:                   ; preds = %.preheader.preheader.preheader.loopexit, %.preheader4.preheader.lr.ph
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader3, %.preheader.preheader.preheader
  %indvars.iv513 = phi i64 [ %indvars.iv.next6, %.preheader3 ], [ 0, %.preheader.preheader.preheader ]
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %indvars.iv12 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next, %.preheader ]
  %32 = mul nuw nsw i64 %indvars.iv12, %indvars.iv513
  %33 = add nuw nsw i64 %32, 3
  %34 = trunc i64 %33 to i32
  %35 = srem i32 %34, %0
  %36 = sitofp i32 %35 to double
  %37 = fdiv double %36, %13
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv513, i64 %indvars.iv12
  store double %37, double* %38, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv12, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %.preheader3, label %.preheader

.preheader3:                                      ; preds = %.preheader
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv513, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next6, %9
  br i1 %exitcond21, label %.preheader3._crit_edge.loopexit, label %.preheader.preheader

.preheader3._crit_edge.loopexit:                  ; preds = %.preheader3
  br label %.preheader3._crit_edge

.preheader3._crit_edge:                           ; preds = %.preheader3._crit_edge.loopexit, %7
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1000 x double]* nocapture readonly) unnamed_addr #2 {
  %8 = sext i32 %1 to i64
  %9 = sext i32 %0 to i64
  %10 = icmp sgt i32 %0, 0
  br i1 %10, label %.preheader4.preheader.lr.ph, label %._crit_edge

.preheader4.preheader.lr.ph:                      ; preds = %7
  %11 = icmp sgt i32 %1, 0
  br i1 %11, label %.preheader4.preheader.us.preheader, label %.preheader4.preheader.preheader

.preheader4.preheader.preheader:                  ; preds = %.preheader4.preheader.lr.ph
  %broadcast.splatinsert39 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat40 = shufflevector <2 x double> %broadcast.splatinsert39, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader4.preheader

.preheader4.preheader.us.preheader:               ; preds = %.preheader4.preheader.lr.ph
  %broadcast.splatinsert83 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat84 = shufflevector <2 x double> %broadcast.splatinsert83, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert108 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat109 = shufflevector <2 x double> %broadcast.splatinsert108, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader4.preheader.us

.preheader4.preheader.us:                         ; preds = %.preheader4.preheader.us.preheader, %.preheader3._crit_edge.us
  %indvars.iv = phi i2 [ 1, %.preheader4.preheader.us.preheader ], [ %indvars.iv.next114, %.preheader3._crit_edge.us ]
  %indvars.iv1524.us = phi i64 [ 1, %.preheader4.preheader.us.preheader ], [ %indvars.iv.next16.us, %.preheader3._crit_edge.us ]
  %indvars.iv1722.us = phi i64 [ 0, %.preheader4.preheader.us.preheader ], [ %16, %.preheader3._crit_edge.us ]
  %12 = zext i2 %indvars.iv to i64
  %13 = add nsw i64 %indvars.iv1722.us, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722.us, i64 0
  %14 = mul i64 %indvars.iv1722.us, 1201
  %15 = add i64 %14, 1
  %scevgep51 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %15
  %16 = add nuw nsw i64 %indvars.iv1722.us, 1
  %xtraiter = and i64 %16, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader4.us.prol.loopexit, label %.preheader4.us.prol.preheader

.preheader4.us.prol.preheader:                    ; preds = %.preheader4.preheader.us
  br label %.preheader4.us.prol

.preheader4.us.prol:                              ; preds = %.preheader4.us.prol.preheader, %.preheader4.us.prol
  %indvars.iv19.us.prol = phi i64 [ %indvars.iv.next.us.prol, %.preheader4.us.prol ], [ 0, %.preheader4.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader4.us.prol ], [ %xtraiter, %.preheader4.us.prol.preheader ]
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722.us, i64 %indvars.iv19.us.prol
  %18 = load double, double* %17, align 8
  %19 = fmul double %18, %3
  store double %19, double* %17, align 8
  %indvars.iv.next.us.prol = add nuw nsw i64 %indvars.iv19.us.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader4.us.prol.loopexit.loopexit, label %.preheader4.us.prol, !llvm.loop !1

.preheader4.us.prol.loopexit.loopexit:            ; preds = %.preheader4.us.prol
  br label %.preheader4.us.prol.loopexit

.preheader4.us.prol.loopexit:                     ; preds = %.preheader4.us.prol.loopexit.loopexit, %.preheader4.preheader.us
  %indvars.iv19.us.unr = phi i64 [ 0, %.preheader4.preheader.us ], [ %12, %.preheader4.us.prol.loopexit.loopexit ]
  %20 = icmp ult i64 %indvars.iv1722.us, 3
  br i1 %20, label %.preheader.preheader.us.preheader, label %.preheader4.us.preheader

.preheader4.us.preheader:                         ; preds = %.preheader4.us.prol.loopexit
  %21 = sub i64 %13, %indvars.iv19.us.unr
  %22 = lshr i64 %21, 2
  %23 = add nuw nsw i64 %22, 1
  %min.iters.check88 = icmp ult i64 %23, 2
  br i1 %min.iters.check88, label %.preheader4.us.preheader111, label %min.iters.checked89

min.iters.checked89:                              ; preds = %.preheader4.us.preheader
  %n.mod.vf90 = and i64 %23, 1
  %n.vec91 = sub nsw i64 %23, %n.mod.vf90
  %cmp.zero92 = icmp eq i64 %n.vec91, 0
  %24 = or i64 %indvars.iv19.us.unr, 4
  %25 = shl nuw i64 %22, 2
  %26 = add i64 %24, %25
  %27 = shl nuw nsw i64 %n.mod.vf90, 2
  %ind.end97 = sub i64 %26, %27
  br i1 %cmp.zero92, label %.preheader4.us.preheader111, label %vector.ph93

vector.ph93:                                      ; preds = %min.iters.checked89
  br label %vector.body85

vector.body85:                                    ; preds = %vector.body85, %vector.ph93
  %index94 = phi i64 [ 0, %vector.ph93 ], [ %index.next95, %vector.body85 ]
  %28 = shl i64 %index94, 2
  %29 = or i64 %indvars.iv19.us.unr, %28
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722.us, i64 %29
  %31 = bitcast double* %30 to <8 x double>*
  %wide.vec103 = load <8 x double>, <8 x double>* %31, align 8
  %strided.vec104 = shufflevector <8 x double> %wide.vec103, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec105 = shufflevector <8 x double> %wide.vec103, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec106 = shufflevector <8 x double> %wide.vec103, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec107 = shufflevector <8 x double> %wide.vec103, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %32 = fmul <2 x double> %strided.vec104, %broadcast.splat109
  %33 = fmul <2 x double> %strided.vec105, %broadcast.splat109
  %34 = fmul <2 x double> %strided.vec106, %broadcast.splat109
  %35 = add nsw i64 %29, 3
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722.us, i64 %35
  %37 = fmul <2 x double> %strided.vec107, %broadcast.splat109
  %38 = getelementptr double, double* %36, i64 -3
  %39 = bitcast double* %38 to <8 x double>*
  %40 = shufflevector <2 x double> %32, <2 x double> %33, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %41 = shufflevector <2 x double> %34, <2 x double> %37, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec110 = shufflevector <4 x double> %40, <4 x double> %41, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec110, <8 x double>* %39, align 8
  %index.next95 = add i64 %index94, 2
  %42 = icmp eq i64 %index.next95, %n.vec91
  br i1 %42, label %middle.block86, label %vector.body85, !llvm.loop !3

middle.block86:                                   ; preds = %vector.body85
  %cmp.n98 = icmp eq i64 %n.mod.vf90, 0
  br i1 %cmp.n98, label %.preheader.preheader.us.preheader, label %.preheader4.us.preheader111

.preheader4.us.preheader111:                      ; preds = %middle.block86, %min.iters.checked89, %.preheader4.us.preheader
  %indvars.iv19.us.ph = phi i64 [ %indvars.iv19.us.unr, %min.iters.checked89 ], [ %indvars.iv19.us.unr, %.preheader4.us.preheader ], [ %ind.end97, %middle.block86 ]
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %.preheader4.us.preheader111, %.preheader4.us
  %indvars.iv19.us = phi i64 [ %indvars.iv.next.us.3, %.preheader4.us ], [ %indvars.iv19.us.ph, %.preheader4.us.preheader111 ]
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722.us, i64 %indvars.iv19.us
  %44 = bitcast double* %43 to <2 x double>*
  %45 = load <2 x double>, <2 x double>* %44, align 8
  %46 = insertelement <2 x double> undef, double %3, i32 0
  %47 = insertelement <2 x double> %46, double %3, i32 1
  %48 = fmul <2 x double> %45, %47
  %49 = bitcast double* %43 to <2 x double>*
  store <2 x double> %48, <2 x double>* %49, align 8
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv19.us, 2
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722.us, i64 %indvars.iv.next.us.1
  %51 = bitcast double* %50 to <2 x double>*
  %52 = load <2 x double>, <2 x double>* %51, align 8
  %53 = insertelement <2 x double> undef, double %3, i32 0
  %54 = insertelement <2 x double> %53, double %3, i32 1
  %55 = fmul <2 x double> %52, %54
  %56 = bitcast double* %50 to <2 x double>*
  store <2 x double> %55, <2 x double>* %56, align 8
  %indvars.iv.next.us.3 = add nsw i64 %indvars.iv19.us, 4
  %exitcond.us.3 = icmp eq i64 %indvars.iv.next.us.3, %indvars.iv1524.us
  br i1 %exitcond.us.3, label %.preheader.preheader.us.preheader.loopexit, label %.preheader4.us, !llvm.loop !6

.preheader.preheader.us.preheader.loopexit:       ; preds = %.preheader4.us
  br label %.preheader.preheader.us.preheader

.preheader.preheader.us.preheader:                ; preds = %.preheader.preheader.us.preheader.loopexit, %middle.block86, %.preheader4.us.prol.loopexit
  %min.iters.check44 = icmp ult i64 %16, 2
  %n.vec47 = and i64 %16, -2
  %cmp.zero48 = icmp eq i64 %n.vec47, 0
  %cmp.n79 = icmp eq i64 %16, %n.vec47
  br label %.preheader.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %.preheader.us
  %indvars.iv720.us = phi i64 [ %indvars.iv.next8.us, %.preheader.us ], [ %indvars.iv720.us.ph, %.preheader.us.preheader ]
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv720.us, i64 %indvars.iv1321.us
  %58 = load double, double* %57, align 8
  %59 = fmul double %58, %2
  %60 = load double, double* %72, align 8
  %61 = fmul double %59, %60
  %62 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv720.us, i64 %indvars.iv1321.us
  %63 = load double, double* %62, align 8
  %64 = fmul double %63, %2
  %65 = load double, double* %73, align 8
  %66 = fmul double %64, %65
  %67 = fadd double %61, %66
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722.us, i64 %indvars.iv720.us
  %69 = load double, double* %68, align 8
  %70 = fadd double %69, %67
  store double %70, double* %68, align 8
  %indvars.iv.next8.us = add nuw nsw i64 %indvars.iv720.us, 1
  %exitcond12.us = icmp eq i64 %indvars.iv.next8.us, %indvars.iv1524.us
  br i1 %exitcond12.us, label %.preheader3.us.loopexit, label %.preheader.us, !llvm.loop !8

.preheader3.us.loopexit:                          ; preds = %.preheader.us
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %.preheader3.us.loopexit, %middle.block42
  %exitcond27 = icmp eq i64 %71, %8
  br i1 %exitcond27, label %.preheader3._crit_edge.us, label %.preheader.preheader.us

.preheader.preheader.us:                          ; preds = %.preheader.preheader.us.preheader, %.preheader3.us
  %indvars.iv1321.us = phi i64 [ %71, %.preheader3.us ], [ 0, %.preheader.preheader.us.preheader ]
  %scevgep53 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv1321.us
  %71 = add nuw nsw i64 %indvars.iv1321.us, 1
  %scevgep55 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv1722.us, i64 %71
  %scevgep57 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv1321.us
  %scevgep59 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv1722.us, i64 %71
  %72 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv1722.us, i64 %indvars.iv1321.us
  %73 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv1722.us, i64 %indvars.iv1321.us
  br i1 %min.iters.check44, label %.preheader.us.preheader, label %min.iters.checked45

.preheader.us.preheader:                          ; preds = %middle.block42, %vector.memcheck, %min.iters.checked45, %.preheader.preheader.us
  %indvars.iv720.us.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked45 ], [ 0, %.preheader.preheader.us ], [ %n.vec47, %middle.block42 ]
  br label %.preheader.us

min.iters.checked45:                              ; preds = %.preheader.preheader.us
  br i1 %cmp.zero48, label %.preheader.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked45
  %bound0 = icmp ult double* %scevgep, %73
  %bound1 = icmp ult double* %73, %scevgep51
  %found.conflict = and i1 %bound0, %bound1
  %bound062 = icmp ult double* %scevgep, %scevgep55
  %bound163 = icmp ult double* %scevgep53, %scevgep51
  %found.conflict64 = and i1 %bound062, %bound163
  %conflict.rdx = or i1 %found.conflict, %found.conflict64
  %bound065 = icmp ult double* %scevgep, %scevgep59
  %bound166 = icmp ult double* %scevgep57, %scevgep51
  %found.conflict67 = and i1 %bound065, %bound166
  %conflict.rdx68 = or i1 %conflict.rdx, %found.conflict67
  %bound071 = icmp ult double* %scevgep, %72
  %bound172 = icmp ult double* %72, %scevgep51
  %found.conflict73 = and i1 %bound071, %bound172
  %conflict.rdx74 = or i1 %conflict.rdx68, %found.conflict73
  br i1 %conflict.rdx74, label %.preheader.us.preheader, label %vector.ph75

vector.ph75:                                      ; preds = %vector.memcheck
  %74 = load double, double* %72, align 8, !alias.scope !9
  %75 = insertelement <2 x double> undef, double %74, i32 0
  %76 = shufflevector <2 x double> %75, <2 x double> undef, <2 x i32> zeroinitializer
  %77 = load double, double* %73, align 8, !alias.scope !12
  %78 = insertelement <2 x double> undef, double %77, i32 0
  %79 = shufflevector <2 x double> %78, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body41

vector.body41:                                    ; preds = %vector.body41, %vector.ph75
  %index76 = phi i64 [ 0, %vector.ph75 ], [ %index.next77, %vector.body41 ]
  %80 = or i64 %index76, 1
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index76, i64 %indvars.iv1321.us
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %80, i64 %indvars.iv1321.us
  %83 = load double, double* %81, align 8, !alias.scope !14
  %84 = load double, double* %82, align 8, !alias.scope !14
  %85 = insertelement <2 x double> undef, double %83, i32 0
  %86 = insertelement <2 x double> %85, double %84, i32 1
  %87 = fmul <2 x double> %86, %broadcast.splat84
  %88 = fmul <2 x double> %87, %76
  %89 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index76, i64 %indvars.iv1321.us
  %90 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %80, i64 %indvars.iv1321.us
  %91 = load double, double* %89, align 8, !alias.scope !16
  %92 = load double, double* %90, align 8, !alias.scope !16
  %93 = insertelement <2 x double> undef, double %91, i32 0
  %94 = insertelement <2 x double> %93, double %92, i32 1
  %95 = fmul <2 x double> %94, %broadcast.splat84
  %96 = fmul <2 x double> %95, %79
  %97 = fadd <2 x double> %88, %96
  %98 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722.us, i64 %index76
  %99 = bitcast double* %98 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %99, align 8, !alias.scope !18, !noalias !20
  %100 = fadd <2 x double> %wide.load, %97
  store <2 x double> %100, <2 x double>* %99, align 8, !alias.scope !18, !noalias !20
  %index.next77 = add i64 %index76, 2
  %101 = icmp eq i64 %index.next77, %n.vec47
  br i1 %101, label %middle.block42, label %vector.body41, !llvm.loop !21

middle.block42:                                   ; preds = %vector.body41
  br i1 %cmp.n79, label %.preheader3.us, label %.preheader.us.preheader

.preheader3._crit_edge.us:                        ; preds = %.preheader3.us
  %indvars.iv.next16.us = add nuw nsw i64 %indvars.iv1524.us, 1
  %exitcond28 = icmp eq i64 %16, %9
  %indvars.iv.next114 = add i2 %indvars.iv, 1
  br i1 %exitcond28, label %._crit_edge.loopexit, label %.preheader4.preheader.us

.preheader4.preheader:                            ; preds = %.preheader4.preheader.preheader, %.preheader3.preheader
  %indvars.iv115 = phi i2 [ 1, %.preheader4.preheader.preheader ], [ %indvars.iv.next116, %.preheader3.preheader ]
  %indvars.iv1524 = phi i64 [ 1, %.preheader4.preheader.preheader ], [ %indvars.iv.next16, %.preheader3.preheader ]
  %indvars.iv1722 = phi i64 [ 0, %.preheader4.preheader.preheader ], [ %104, %.preheader3.preheader ]
  %102 = zext i2 %indvars.iv115 to i64
  %103 = add nsw i64 %indvars.iv1722, -3
  %104 = add nuw nsw i64 %indvars.iv1722, 1
  %xtraiter29 = and i64 %104, 3
  %lcmp.mod30 = icmp eq i64 %xtraiter29, 0
  br i1 %lcmp.mod30, label %.preheader4.prol.loopexit, label %.preheader4.prol.preheader

.preheader4.prol.preheader:                       ; preds = %.preheader4.preheader
  br label %.preheader4.prol

.preheader4.prol:                                 ; preds = %.preheader4.prol.preheader, %.preheader4.prol
  %indvars.iv19.prol = phi i64 [ %indvars.iv.next.prol, %.preheader4.prol ], [ 0, %.preheader4.prol.preheader ]
  %prol.iter31 = phi i64 [ %prol.iter31.sub, %.preheader4.prol ], [ %xtraiter29, %.preheader4.prol.preheader ]
  %105 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722, i64 %indvars.iv19.prol
  %106 = load double, double* %105, align 8
  %107 = fmul double %106, %3
  store double %107, double* %105, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv19.prol, 1
  %prol.iter31.sub = add nsw i64 %prol.iter31, -1
  %prol.iter31.cmp = icmp eq i64 %prol.iter31.sub, 0
  br i1 %prol.iter31.cmp, label %.preheader4.prol.loopexit.loopexit, label %.preheader4.prol, !llvm.loop !22

.preheader4.prol.loopexit.loopexit:               ; preds = %.preheader4.prol
  br label %.preheader4.prol.loopexit

.preheader4.prol.loopexit:                        ; preds = %.preheader4.prol.loopexit.loopexit, %.preheader4.preheader
  %indvars.iv19.unr = phi i64 [ 0, %.preheader4.preheader ], [ %102, %.preheader4.prol.loopexit.loopexit ]
  %108 = icmp ult i64 %indvars.iv1722, 3
  br i1 %108, label %.preheader3.preheader, label %.preheader4.preheader34

.preheader4.preheader34:                          ; preds = %.preheader4.prol.loopexit
  %109 = sub i64 %103, %indvars.iv19.unr
  %110 = lshr i64 %109, 2
  %111 = add nuw nsw i64 %110, 1
  %min.iters.check = icmp ult i64 %111, 2
  br i1 %min.iters.check, label %.preheader4.preheader112, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader4.preheader34
  %n.mod.vf = and i64 %111, 1
  %n.vec = sub nsw i64 %111, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %112 = or i64 %indvars.iv19.unr, 4
  %113 = shl nuw i64 %110, 2
  %114 = add i64 %112, %113
  %115 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %114, %115
  br i1 %cmp.zero, label %.preheader4.preheader112, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %116 = shl i64 %index, 2
  %117 = or i64 %indvars.iv19.unr, %116
  %118 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722, i64 %117
  %119 = bitcast double* %118 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %119, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec36 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec37 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec38 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %120 = fmul <2 x double> %strided.vec, %broadcast.splat40
  %121 = fmul <2 x double> %strided.vec36, %broadcast.splat40
  %122 = fmul <2 x double> %strided.vec37, %broadcast.splat40
  %123 = add nsw i64 %117, 3
  %124 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722, i64 %123
  %125 = fmul <2 x double> %strided.vec38, %broadcast.splat40
  %126 = getelementptr double, double* %124, i64 -3
  %127 = bitcast double* %126 to <8 x double>*
  %128 = shufflevector <2 x double> %120, <2 x double> %121, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %129 = shufflevector <2 x double> %122, <2 x double> %125, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %128, <4 x double> %129, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %127, align 8
  %index.next = add i64 %index, 2
  %130 = icmp eq i64 %index.next, %n.vec
  br i1 %130, label %middle.block, label %vector.body, !llvm.loop !23

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %.preheader3.preheader, label %.preheader4.preheader112

.preheader4.preheader112:                         ; preds = %middle.block, %min.iters.checked, %.preheader4.preheader34
  %indvars.iv19.ph = phi i64 [ %indvars.iv19.unr, %min.iters.checked ], [ %indvars.iv19.unr, %.preheader4.preheader34 ], [ %ind.end, %middle.block ]
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.preheader112, %.preheader4
  %indvars.iv19 = phi i64 [ %indvars.iv.next.3, %.preheader4 ], [ %indvars.iv19.ph, %.preheader4.preheader112 ]
  %131 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722, i64 %indvars.iv19
  %132 = bitcast double* %131 to <2 x double>*
  %133 = load <2 x double>, <2 x double>* %132, align 8
  %134 = insertelement <2 x double> undef, double %3, i32 0
  %135 = insertelement <2 x double> %134, double %3, i32 1
  %136 = fmul <2 x double> %133, %135
  %137 = bitcast double* %131 to <2 x double>*
  store <2 x double> %136, <2 x double>* %137, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv19, 2
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722, i64 %indvars.iv.next.1
  %139 = bitcast double* %138 to <2 x double>*
  %140 = load <2 x double>, <2 x double>* %139, align 8
  %141 = insertelement <2 x double> undef, double %3, i32 0
  %142 = insertelement <2 x double> %141, double %3, i32 1
  %143 = fmul <2 x double> %140, %142
  %144 = bitcast double* %138 to <2 x double>*
  store <2 x double> %143, <2 x double>* %144, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv19, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %indvars.iv1524
  br i1 %exitcond.3, label %.preheader3.preheader.loopexit, label %.preheader4, !llvm.loop !24

.preheader3.preheader.loopexit:                   ; preds = %.preheader4
  br label %.preheader3.preheader

.preheader3.preheader:                            ; preds = %.preheader3.preheader.loopexit, %middle.block, %.preheader4.prol.loopexit
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv1524, 1
  %exitcond = icmp eq i64 %104, %9
  %indvars.iv.next116 = add i2 %indvars.iv115, 1
  br i1 %exitcond, label %._crit_edge.loopexit113, label %.preheader4.preheader

._crit_edge.loopexit:                             ; preds = %.preheader3._crit_edge.us
  br label %._crit_edge

._crit_edge.loopexit113:                          ; preds = %.preheader3.preheader
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit113, %._crit_edge.loopexit, %7
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = sext i32 %0 to i64
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader.preheader.preheader, label %._crit_edge

.preheader.preheader.preheader:                   ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader._crit_edge, %.preheader.preheader.preheader
  %indvars.iv26 = phi i64 [ %indvars.iv.next3, %.preheader._crit_edge ], [ 0, %.preheader.preheader.preheader ]
  %9 = mul nsw i64 %indvars.iv26, %7
  br label %10

; <label>:10:                                     ; preds = %.preheader.preheader, %.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next, %.preheader ]
  %11 = add nsw i64 %indvars.iv5, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %.preheader

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %.preheader

.preheader:                                       ; preds = %15, %10
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv5
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %.preheader._crit_edge, label %10

.preheader._crit_edge:                            ; preds = %.preheader
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next3, %7
  br i1 %exitcond9, label %._crit_edge.loopexit, label %.preheader.preheader

._crit_edge.loopexit:                             ; preds = %.preheader._crit_edge
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = distinct !{!3, !4, !5}
!4 = !{!"llvm.loop.vectorize.width", i32 1}
!5 = !{!"llvm.loop.interleave.count", i32 1}
!6 = distinct !{!6, !7, !4, !5}
!7 = !{!"llvm.loop.unroll.runtime.disable"}
!8 = distinct !{!8, !4, !5}
!9 = !{!10}
!10 = distinct !{!10, !11}
!11 = distinct !{!11, !"LVerDomain"}
!12 = !{!13}
!13 = distinct !{!13, !11}
!14 = !{!15}
!15 = distinct !{!15, !11}
!16 = !{!17}
!17 = distinct !{!17, !11}
!18 = !{!19}
!19 = distinct !{!19, !11}
!20 = !{!13, !15, !17, !10}
!21 = distinct !{!21, !4, !5}
!22 = distinct !{!22, !2}
!23 = distinct !{!23, !4, !5}
!24 = distinct !{!24, !7, !4, !5}
