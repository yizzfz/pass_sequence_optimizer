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
.preheader4.preheader.us.preheader:
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  br label %.preheader4.preheader.us

.preheader4.preheader.us:                         ; preds = %.preheader4._crit_edge.us, %.preheader4.preheader.us.preheader
  %indvars.iv917.us = phi i64 [ %indvars.iv.next10.us, %.preheader4._crit_edge.us ], [ 0, %.preheader4.preheader.us.preheader ]
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %.preheader4.us, %.preheader4.preheader.us
  %indvars.iv715.us = phi i64 [ 0, %.preheader4.preheader.us ], [ %indvars.iv.next8.us, %.preheader4.us ]
  %7 = mul nuw nsw i64 %indvars.iv715.us, %indvars.iv917.us
  %8 = add nuw nsw i64 %7, 1
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 1200
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 1.200000e+03
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv917.us, i64 %indvars.iv715.us
  store double %12, double* %13, align 8
  %14 = add nuw nsw i64 %7, 2
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 1000
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 1.000000e+03
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv917.us, i64 %indvars.iv715.us
  store double %18, double* %19, align 8
  %indvars.iv.next8.us = add nuw nsw i64 %indvars.iv715.us, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next8.us, 1000
  br i1 %exitcond22, label %.preheader4._crit_edge.us, label %.preheader4.us

.preheader4._crit_edge.us:                        ; preds = %.preheader4.us
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv917.us, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next10.us, 1200
  br i1 %exitcond23, label %.preheader.preheader.preheader, label %.preheader4.preheader.us

.preheader.preheader.preheader:                   ; preds = %.preheader4._crit_edge.us
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.preheader, %.preheader._crit_edge
  %indvars.iv513 = phi i64 [ %indvars.iv.next6, %.preheader._crit_edge ], [ 0, %.preheader.preheader.preheader ]
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %indvars.iv12 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next, %.preheader ]
  %20 = mul nuw nsw i64 %indvars.iv12, %indvars.iv513
  %21 = add nuw nsw i64 %20, 3
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 1200
  %24 = sitofp i32 %23 to double
  %25 = fdiv double %24, 1.000000e+03
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv513, i64 %indvars.iv12
  store double %25, double* %26, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv12, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %.preheader._crit_edge, label %.preheader

.preheader._crit_edge:                            ; preds = %.preheader
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv513, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next6, 1200
  br i1 %exitcond21, label %._crit_edge, label %.preheader.preheader

._crit_edge:                                      ; preds = %.preheader._crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(i32, i32, double, double, [1200 x double]* nocapture, [1000 x double]* nocapture readonly, [1000 x double]* nocapture readonly) unnamed_addr #2 {
.preheader4.preheader.us.preheader:
  %broadcast.splatinsert53 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat54 = shufflevector <2 x double> %broadcast.splatinsert53, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert74 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat75 = shufflevector <2 x double> %broadcast.splatinsert74, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader4.preheader.us

.preheader4.preheader.us:                         ; preds = %.preheader3._crit_edge.us, %.preheader4.preheader.us.preheader
  %indvars.iv = phi i2 [ %indvars.iv.next, %.preheader3._crit_edge.us ], [ 1, %.preheader4.preheader.us.preheader ]
  %indvars.iv1524.us = phi i64 [ %indvars.iv.next16.us, %.preheader3._crit_edge.us ], [ 1, %.preheader4.preheader.us.preheader ]
  %indvars.iv1722.us = phi i64 [ %12, %.preheader3._crit_edge.us ], [ 0, %.preheader4.preheader.us.preheader ]
  %7 = zext i2 %indvars.iv to i64
  %8 = add nsw i64 %indvars.iv1722.us, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722.us, i64 0
  %9 = mul nuw nsw i64 %indvars.iv1722.us, 1201
  %10 = add nuw nsw i64 %9, 1
  %scevgep29 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %10
  %11 = add nuw nsw i64 %indvars.iv1722.us, 1
  %12 = add nuw nsw i64 %indvars.iv1722.us, 1
  %xtraiter = and i64 %12, 3
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader4.us.prol.loopexit, label %.preheader4.us.prol.preheader

.preheader4.us.prol.preheader:                    ; preds = %.preheader4.preheader.us
  br label %.preheader4.us.prol

.preheader4.us.prol:                              ; preds = %.preheader4.us.prol.preheader, %.preheader4.us.prol
  %indvars.iv19.us.prol = phi i64 [ %indvars.iv.next.us.prol, %.preheader4.us.prol ], [ 0, %.preheader4.us.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.preheader4.us.prol ], [ %xtraiter, %.preheader4.us.prol.preheader ]
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722.us, i64 %indvars.iv19.us.prol
  %14 = load double, double* %13, align 8
  %15 = fmul double %14, %3
  store double %15, double* %13, align 8
  %indvars.iv.next.us.prol = add nuw nsw i64 %indvars.iv19.us.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader4.us.prol.loopexit.loopexit, label %.preheader4.us.prol, !llvm.loop !1

.preheader4.us.prol.loopexit.loopexit:            ; preds = %.preheader4.us.prol
  br label %.preheader4.us.prol.loopexit

.preheader4.us.prol.loopexit:                     ; preds = %.preheader4.us.prol.loopexit.loopexit, %.preheader4.preheader.us
  %indvars.iv19.us.unr = phi i64 [ 0, %.preheader4.preheader.us ], [ %7, %.preheader4.us.prol.loopexit.loopexit ]
  %16 = icmp ult i64 %indvars.iv1722.us, 3
  br i1 %16, label %.preheader.preheader.us.preheader, label %.preheader4.us.preheader

.preheader4.us.preheader:                         ; preds = %.preheader4.us.prol.loopexit
  %17 = sub i64 %8, %indvars.iv19.us.unr
  %18 = lshr i64 %17, 2
  %19 = add nuw nsw i64 %18, 1
  %min.iters.check58 = icmp ult i64 %19, 2
  br i1 %min.iters.check58, label %.preheader4.us.preheader76, label %min.iters.checked59

min.iters.checked59:                              ; preds = %.preheader4.us.preheader
  %n.mod.vf60 = and i64 %19, 1
  %n.vec61 = sub nsw i64 %19, %n.mod.vf60
  %cmp.zero62 = icmp eq i64 %n.vec61, 0
  %20 = or i64 %indvars.iv19.us.unr, 4
  %21 = shl nuw i64 %18, 2
  %22 = add i64 %20, %21
  %23 = shl nuw nsw i64 %n.mod.vf60, 2
  %ind.end = sub i64 %22, %23
  br i1 %cmp.zero62, label %.preheader4.us.preheader76, label %vector.ph63

vector.ph63:                                      ; preds = %min.iters.checked59
  br label %vector.body55

vector.body55:                                    ; preds = %vector.body55, %vector.ph63
  %index64 = phi i64 [ 0, %vector.ph63 ], [ %index.next65, %vector.body55 ]
  %24 = shl i64 %index64, 2
  %offset.idx = or i64 %indvars.iv19.us.unr, %24
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722.us, i64 %offset.idx
  %26 = bitcast double* %25 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %26, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec71 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec72 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec73 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %27 = fmul <2 x double> %strided.vec, %broadcast.splat75
  %28 = fmul <2 x double> %strided.vec71, %broadcast.splat75
  %29 = fmul <2 x double> %strided.vec72, %broadcast.splat75
  %30 = add nsw i64 %offset.idx, 3
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722.us, i64 %30
  %32 = fmul <2 x double> %strided.vec73, %broadcast.splat75
  %33 = getelementptr double, double* %31, i64 -3
  %34 = bitcast double* %33 to <8 x double>*
  %35 = shufflevector <2 x double> %27, <2 x double> %28, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %36 = shufflevector <2 x double> %29, <2 x double> %32, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %35, <4 x double> %36, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %34, align 8
  %index.next65 = add i64 %index64, 2
  %37 = icmp eq i64 %index.next65, %n.vec61
  br i1 %37, label %middle.block56, label %vector.body55, !llvm.loop !3

middle.block56:                                   ; preds = %vector.body55
  %cmp.n67 = icmp eq i64 %n.mod.vf60, 0
  br i1 %cmp.n67, label %.preheader.preheader.us.preheader, label %.preheader4.us.preheader76

.preheader4.us.preheader76:                       ; preds = %middle.block56, %min.iters.checked59, %.preheader4.us.preheader
  %indvars.iv19.us.ph = phi i64 [ %indvars.iv19.us.unr, %min.iters.checked59 ], [ %indvars.iv19.us.unr, %.preheader4.us.preheader ], [ %ind.end, %middle.block56 ]
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %.preheader4.us.preheader76, %.preheader4.us
  %indvars.iv19.us = phi i64 [ %indvars.iv.next.us.3, %.preheader4.us ], [ %indvars.iv19.us.ph, %.preheader4.us.preheader76 ]
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722.us, i64 %indvars.iv19.us
  %39 = load double, double* %38, align 8
  %40 = fmul double %39, %3
  store double %40, double* %38, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv19.us, 1
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722.us, i64 %indvars.iv.next.us
  %42 = load double, double* %41, align 8
  %43 = fmul double %42, %3
  store double %43, double* %41, align 8
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv19.us, 2
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722.us, i64 %indvars.iv.next.us.1
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, %3
  store double %46, double* %44, align 8
  %indvars.iv.next.us.2 = add nsw i64 %indvars.iv19.us, 3
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722.us, i64 %indvars.iv.next.us.2
  %48 = load double, double* %47, align 8
  %49 = fmul double %48, %3
  store double %49, double* %47, align 8
  %indvars.iv.next.us.3 = add nsw i64 %indvars.iv19.us, 4
  %exitcond.us.3 = icmp eq i64 %indvars.iv.next.us.3, %indvars.iv1524.us
  br i1 %exitcond.us.3, label %.preheader.preheader.us.preheader.loopexit, label %.preheader4.us, !llvm.loop !6

.preheader.preheader.us.preheader.loopexit:       ; preds = %.preheader4.us
  br label %.preheader.preheader.us.preheader

.preheader.preheader.us.preheader:                ; preds = %.preheader.preheader.us.preheader.loopexit, %middle.block56, %.preheader4.us.prol.loopexit
  %min.iters.check = icmp ult i64 %11, 2
  %n.vec = and i64 %11, -2
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %11, %n.vec
  br label %.preheader.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %.preheader.us
  %indvars.iv720.us = phi i64 [ %indvars.iv.next8.us, %.preheader.us ], [ %indvars.iv720.us.ph, %.preheader.us.preheader ]
  %50 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv720.us, i64 %indvars.iv1321.us
  %51 = load double, double* %50, align 8
  %52 = fmul double %51, %2
  %53 = load double, double* %65, align 8
  %54 = fmul double %52, %53
  %55 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv720.us, i64 %indvars.iv1321.us
  %56 = load double, double* %55, align 8
  %57 = fmul double %56, %2
  %58 = load double, double* %66, align 8
  %59 = fmul double %57, %58
  %60 = fadd double %54, %59
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722.us, i64 %indvars.iv720.us
  %62 = load double, double* %61, align 8
  %63 = fadd double %62, %60
  store double %63, double* %61, align 8
  %indvars.iv.next8.us = add nuw nsw i64 %indvars.iv720.us, 1
  %exitcond12.us = icmp eq i64 %indvars.iv.next8.us, %indvars.iv1524.us
  br i1 %exitcond12.us, label %.preheader3.us.loopexit, label %.preheader.us, !llvm.loop !8

.preheader3.us.loopexit:                          ; preds = %.preheader.us
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %.preheader3.us.loopexit, %middle.block
  %indvars.iv.next14.us = add nuw nsw i64 %indvars.iv1321.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next14.us, 1000
  br i1 %exitcond, label %.preheader3._crit_edge.us, label %.preheader.preheader.us

.preheader.preheader.us:                          ; preds = %.preheader.preheader.us.preheader, %.preheader3.us
  %indvars.iv1321.us = phi i64 [ %indvars.iv.next14.us, %.preheader3.us ], [ 0, %.preheader.preheader.us.preheader ]
  %scevgep31 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv1321.us
  %64 = add nuw nsw i64 %indvars.iv1321.us, 1
  %scevgep33 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv1722.us, i64 %64
  %scevgep35 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv1321.us
  %scevgep37 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv1722.us, i64 %64
  %65 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv1722.us, i64 %indvars.iv1321.us
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv1722.us, i64 %indvars.iv1321.us
  br i1 %min.iters.check, label %.preheader.us.preheader, label %min.iters.checked

.preheader.us.preheader:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.preheader.us
  %indvars.iv720.us.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader.preheader.us ], [ %n.vec, %middle.block ]
  br label %.preheader.us

min.iters.checked:                                ; preds = %.preheader.preheader.us
  br i1 %cmp.zero, label %.preheader.us.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %66
  %bound1 = icmp ult double* %66, %scevgep29
  %found.conflict = and i1 %bound0, %bound1
  %bound040 = icmp ult double* %scevgep, %scevgep33
  %bound141 = icmp ult double* %scevgep31, %scevgep29
  %found.conflict42 = and i1 %bound040, %bound141
  %conflict.rdx = or i1 %found.conflict, %found.conflict42
  %bound043 = icmp ult double* %scevgep, %scevgep37
  %bound144 = icmp ult double* %scevgep35, %scevgep29
  %found.conflict45 = and i1 %bound043, %bound144
  %conflict.rdx46 = or i1 %conflict.rdx, %found.conflict45
  %bound049 = icmp ult double* %scevgep, %65
  %bound150 = icmp ult double* %65, %scevgep29
  %found.conflict51 = and i1 %bound049, %bound150
  %conflict.rdx52 = or i1 %conflict.rdx46, %found.conflict51
  br i1 %conflict.rdx52, label %.preheader.us.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %67 = load double, double* %65, align 8, !alias.scope !9
  %68 = insertelement <2 x double> undef, double %67, i32 0
  %69 = shufflevector <2 x double> %68, <2 x double> undef, <2 x i32> zeroinitializer
  %70 = load double, double* %66, align 8, !alias.scope !12
  %71 = insertelement <2 x double> undef, double %70, i32 0
  %72 = shufflevector <2 x double> %71, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %73 = or i64 %index, 1
  %74 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index, i64 %indvars.iv1321.us
  %75 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %73, i64 %indvars.iv1321.us
  %76 = load double, double* %74, align 8, !alias.scope !14
  %77 = load double, double* %75, align 8, !alias.scope !14
  %78 = insertelement <2 x double> undef, double %76, i32 0
  %79 = insertelement <2 x double> %78, double %77, i32 1
  %80 = fmul <2 x double> %79, %broadcast.splat54
  %81 = fmul <2 x double> %80, %69
  %82 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index, i64 %indvars.iv1321.us
  %83 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %73, i64 %indvars.iv1321.us
  %84 = load double, double* %82, align 8, !alias.scope !16
  %85 = load double, double* %83, align 8, !alias.scope !16
  %86 = insertelement <2 x double> undef, double %84, i32 0
  %87 = insertelement <2 x double> %86, double %85, i32 1
  %88 = fmul <2 x double> %87, %broadcast.splat54
  %89 = fmul <2 x double> %88, %72
  %90 = fadd <2 x double> %81, %89
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1722.us, i64 %index
  %92 = bitcast double* %91 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %92, align 8, !alias.scope !18, !noalias !20
  %93 = fadd <2 x double> %wide.load, %90
  %94 = bitcast double* %91 to <2 x double>*
  store <2 x double> %93, <2 x double>* %94, align 8, !alias.scope !18, !noalias !20
  %index.next = add i64 %index, 2
  %95 = icmp eq i64 %index.next, %n.vec
  br i1 %95, label %middle.block, label %vector.body, !llvm.loop !21

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %.preheader3.us, label %.preheader.us.preheader

.preheader3._crit_edge.us:                        ; preds = %.preheader3.us
  %indvars.iv.next16.us = add nuw nsw i64 %indvars.iv1524.us, 1
  %exitcond27 = icmp eq i64 %12, 1200
  %indvars.iv.next = add i2 %indvars.iv, 1
  br i1 %exitcond27, label %._crit_edge, label %.preheader4.preheader.us

._crit_edge:                                      ; preds = %.preheader3._crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.preheader.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader._crit_edge, %.preheader.preheader.preheader
  %indvars.iv26 = phi i64 [ %indvars.iv.next3, %.preheader._crit_edge ], [ 0, %.preheader.preheader.preheader ]
  %6 = mul nuw nsw i64 %indvars.iv26, 1200
  br label %7

; <label>:7:                                      ; preds = %.preheader.preheader, %.preheader
  %indvars.iv5 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next, %.preheader ]
  %8 = add nuw nsw i64 %indvars.iv5, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %.preheader

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %.preheader

.preheader:                                       ; preds = %12, %7
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv5
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv5, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %.preheader._crit_edge, label %7

.preheader._crit_edge:                            ; preds = %.preheader
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next3, 1200
  br i1 %exitcond9, label %._crit_edge, label %.preheader.preheader

._crit_edge:                                      ; preds = %.preheader._crit_edge
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
