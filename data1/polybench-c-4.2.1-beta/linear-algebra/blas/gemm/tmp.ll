; ModuleID = 'B.ll'
source_filename = "gemm.c"
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
  %5 = tail call i8* @polybench_alloc_data(i64 1100000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %8 = bitcast i8* %5 to [1100 x double]*
  %9 = bitcast i8* %6 to [1200 x double]*
  %10 = bitcast i8* %7 to [1100 x double]*
  call void @init_array(i32 1000, i32 1100, i32 1200, double* nonnull %3, double* nonnull %4, [1100 x double]* %8, [1200 x double]* %9, [1100 x double]* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  tail call void @kernel_gemm(i32 1000, i32 1100, i32 1200, double %11, double %12, [1100 x double]* %8, [1200 x double]* %9, [1100 x double]* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %19

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to [1100 x double]*
  tail call void @print_array(i32 1000, i32 1100, [1100 x double]* %18)
  br label %19

; <label>:19:                                     ; preds = %17, %14, %2
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, i32, double* nocapture, double* nocapture, [1100 x double]* nocapture, [1200 x double]* nocapture, [1100 x double]* nocapture) #2 {
  store double 1.500000e+00, double* %3, align 8
  store double 1.200000e+00, double* %4, align 8
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.preheader7.lr.ph, label %.preheader4

.preheader7.lr.ph:                                ; preds = %8
  %10 = icmp sgt i32 %1, 0
  %11 = sitofp i32 %0 to double
  br i1 %10, label %.preheader7.us.preheader, label %.preheader5.lr.ph

.preheader7.us.preheader:                         ; preds = %.preheader7.lr.ph
  %wide.trip.count41 = zext i32 %1 to i64
  %wide.trip.count45 = zext i32 %0 to i64
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge19.us, %.preheader7.us.preheader
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %._crit_edge19.us ], [ 0, %.preheader7.us.preheader ]
  br label %12

; <label>:12:                                     ; preds = %12, %.preheader7.us
  %indvars.iv39 = phi i64 [ 0, %.preheader7.us ], [ %indvars.iv.next40, %12 ]
  %13 = mul nuw nsw i64 %indvars.iv39, %indvars.iv43
  %14 = add nuw nsw i64 %13, 1
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, %0
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, %11
  %19 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv43, i64 %indvars.iv39
  store double %18, double* %19, align 8
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, %wide.trip.count41
  br i1 %exitcond42, label %._crit_edge19.us, label %12

._crit_edge19.us:                                 ; preds = %12
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next44, %wide.trip.count45
  br i1 %exitcond46, label %.preheader6, label %.preheader7.us

.preheader6:                                      ; preds = %._crit_edge19.us
  %20 = icmp sgt i32 %0, 0
  br i1 %20, label %.preheader5.lr.ph, label %.preheader4

.preheader5.lr.ph:                                ; preds = %.preheader6, %.preheader7.lr.ph
  %21 = icmp sgt i32 %2, 0
  %22 = sitofp i32 %2 to double
  br i1 %21, label %.preheader5.us.preheader, label %._crit_edge11

.preheader5.us.preheader:                         ; preds = %.preheader5.lr.ph
  %xtraiter = and i32 %2, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %23 = icmp eq i32 %2, 1
  %wide.trip.count36 = zext i32 %0 to i64
  %wide.trip.count32.1 = zext i32 %2 to i64
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %._crit_edge14.us, %.preheader5.us.preheader
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %._crit_edge14.us ], [ 0, %.preheader5.us.preheader ]
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader5.us
  %24 = trunc i64 %indvars.iv34 to i32
  %25 = srem i32 %24, %2
  %26 = sitofp i32 %25 to double
  %27 = fdiv double %26, %22
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv34, i64 0
  store double %27, double* %28, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader5.us
  %indvars.iv30.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader5.us ]
  br i1 %23, label %._crit_edge14.us, label %.preheader5.us.new.preheader

.preheader5.us.new.preheader:                     ; preds = %.prol.loopexit
  br label %.preheader5.us.new

.preheader5.us.new:                               ; preds = %.preheader5.us.new, %.preheader5.us.new.preheader
  %indvars.iv30 = phi i64 [ %indvars.iv.next31.1, %.preheader5.us.new ], [ %indvars.iv30.unr.ph, %.preheader5.us.new.preheader ]
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %29 = mul nuw nsw i64 %indvars.iv.next31, %indvars.iv34
  %30 = trunc i64 %29 to i32
  %31 = srem i32 %30, %2
  %32 = sitofp i32 %31 to double
  %33 = fdiv double %32, %22
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv34, i64 %indvars.iv30
  store double %33, double* %34, align 8
  %indvars.iv.next31.1 = add nsw i64 %indvars.iv30, 2
  %35 = mul nuw nsw i64 %indvars.iv.next31.1, %indvars.iv34
  %36 = trunc i64 %35 to i32
  %37 = srem i32 %36, %2
  %38 = sitofp i32 %37 to double
  %39 = fdiv double %38, %22
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv34, i64 %indvars.iv.next31
  store double %39, double* %40, align 8
  %exitcond33.1 = icmp eq i64 %indvars.iv.next31.1, %wide.trip.count32.1
  br i1 %exitcond33.1, label %._crit_edge14.us.loopexit, label %.preheader5.us.new

._crit_edge14.us.loopexit:                        ; preds = %.preheader5.us.new
  br label %._crit_edge14.us

._crit_edge14.us:                                 ; preds = %._crit_edge14.us.loopexit, %.prol.loopexit
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next35, %wide.trip.count36
  br i1 %exitcond37, label %.preheader4.loopexit, label %.preheader5.us

.preheader4.loopexit:                             ; preds = %._crit_edge14.us
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.loopexit, %.preheader6, %8
  %41 = icmp sgt i32 %2, 0
  br i1 %41, label %.preheader.lr.ph, label %._crit_edge11

.preheader.lr.ph:                                 ; preds = %.preheader4
  %42 = icmp sgt i32 %1, 0
  %43 = sitofp i32 %1 to double
  br i1 %42, label %.preheader.us.preheader, label %._crit_edge11

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count27 = zext i32 %2 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %44

; <label>:44:                                     ; preds = %44, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %44 ]
  %45 = add nuw nsw i64 %indvars.iv, 2
  %46 = mul nuw nsw i64 %45, %indvars.iv25
  %47 = trunc i64 %46 to i32
  %48 = srem i32 %47, %1
  %49 = sitofp i32 %48 to double
  %50 = fdiv double %49, %43
  %51 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv25, i64 %indvars.iv
  store double %50, double* %51, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %44

._crit_edge.us:                                   ; preds = %44
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next26, %wide.trip.count27
  br i1 %exitcond28, label %._crit_edge11.loopexit, label %.preheader.us

._crit_edge11.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %.preheader.lr.ph, %.preheader4, %.preheader5.lr.ph
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_gemm(i32, i32, i32, double, double, [1100 x double]* nocapture, [1200 x double]* nocapture readonly, [1100 x double]* nocapture readonly) #2 {
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.preheader4.lr.ph, label %._crit_edge11

.preheader4.lr.ph:                                ; preds = %8
  %10 = icmp sgt i32 %1, 0
  br i1 %10, label %.preheader4.us.preheader, label %.preheader4.preheader

.preheader4.preheader:                            ; preds = %.preheader4.lr.ph
  %wide.trip.count52 = zext i32 %0 to i64
  %11 = add nsw i64 %wide.trip.count52, -1
  %xtraiter111 = and i64 %wide.trip.count52, 7
  %lcmp.mod112 = icmp eq i64 %xtraiter111, 0
  br i1 %lcmp.mod112, label %.preheader4.prol.loopexit, label %.preheader4.prol.preheader

.preheader4.prol.preheader:                       ; preds = %.preheader4.preheader
  br label %.preheader4.prol

.preheader4.prol:                                 ; preds = %.preheader4.prol, %.preheader4.prol.preheader
  %indvars.iv50.prol = phi i64 [ %indvars.iv.next51.prol, %.preheader4.prol ], [ 0, %.preheader4.prol.preheader ]
  %prol.iter113 = phi i64 [ %prol.iter113.sub, %.preheader4.prol ], [ %xtraiter111, %.preheader4.prol.preheader ]
  %indvars.iv.next51.prol = add nuw nsw i64 %indvars.iv50.prol, 1
  %prol.iter113.sub = add i64 %prol.iter113, -1
  %prol.iter113.cmp = icmp eq i64 %prol.iter113.sub, 0
  br i1 %prol.iter113.cmp, label %.preheader4.prol.loopexit.unr-lcssa, label %.preheader4.prol, !llvm.loop !1

.preheader4.prol.loopexit.unr-lcssa:              ; preds = %.preheader4.prol
  br label %.preheader4.prol.loopexit

.preheader4.prol.loopexit:                        ; preds = %.preheader4.prol.loopexit.unr-lcssa, %.preheader4.preheader
  %indvars.iv50.unr = phi i64 [ 0, %.preheader4.preheader ], [ %indvars.iv.next51.prol, %.preheader4.prol.loopexit.unr-lcssa ]
  %12 = icmp ult i64 %11, 7
  br i1 %12, label %._crit_edge11.loopexit110, label %.preheader4.preheader.new

.preheader4.preheader.new:                        ; preds = %.preheader4.prol.loopexit
  br label %.preheader4

.preheader4.us.preheader:                         ; preds = %.preheader4.lr.ph
  %13 = add i32 %1, -1
  %xtraiter = and i32 %1, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %14 = icmp ult i32 %13, 3
  %xtraiter27 = and i32 %1, 1
  %lcmp.mod28 = icmp eq i32 %xtraiter27, 0
  %15 = icmp eq i32 %13, 0
  %wide.trip.count32 = zext i32 %2 to i64
  %wide.trip.count24.1 = zext i32 %1 to i64
  %wide.trip.count35 = zext i32 %0 to i64
  %wide.trip.count.3 = zext i32 %1 to i64
  %16 = add nsw i64 %wide.trip.count24.1, -2
  %17 = add nsw i64 %wide.trip.count24.1, -2
  %18 = add nsw i64 %wide.trip.count24.1, -4
  %.not = icmp slt i32 %2, 1
  %broadcast.splatinsert76 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splatinsert105 = insertelement <2 x double> undef, double %4, i32 0
  %broadcast.splat106 = shufflevector <2 x double> %broadcast.splatinsert105, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge9.us, %.preheader4.us.preheader
  %indvars.iv33 = phi i64 [ 0, %.preheader4.us.preheader ], [ %indvars.iv.next34, %._crit_edge9.us ]
  %scevgep63 = getelementptr [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 2
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader4.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader, %.prol.preheader.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %19 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv.prol
  %20 = load double, double* %19, align 8
  %21 = fmul double %20, %4
  store double %21, double* %19, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader4.us
  %indvars.iv.unr = phi i64 [ 0, %.preheader4.us ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  br i1 %14, label %..preheader3_crit_edge.us, label %.preheader4.us.new.preheader

.preheader4.us.new.preheader:                     ; preds = %.prol.loopexit
  %22 = sub i64 %18, %indvars.iv.unr
  %23 = lshr i64 %22, 2
  %24 = add nuw nsw i64 %23, 1
  %min.iters.check85 = icmp ult i64 %24, 2
  br i1 %min.iters.check85, label %.preheader4.us.new.preheader109, label %min.iters.checked86

.preheader4.us.new.preheader109:                  ; preds = %middle.block83, %min.iters.checked86, %.preheader4.us.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked86 ], [ %indvars.iv.unr, %.preheader4.us.new.preheader ], [ %ind.end94, %middle.block83 ]
  br label %.preheader4.us.new

min.iters.checked86:                              ; preds = %.preheader4.us.new.preheader
  %n.mod.vf87 = and i64 %24, 1
  %n.vec88 = sub nsw i64 %24, %n.mod.vf87
  %cmp.zero89 = icmp eq i64 %n.vec88, 0
  %25 = add i64 %indvars.iv.unr, 4
  %26 = shl nuw i64 %23, 2
  %27 = add i64 %25, %26
  %28 = shl nuw nsw i64 %n.mod.vf87, 2
  %ind.end94 = sub i64 %27, %28
  br i1 %cmp.zero89, label %.preheader4.us.new.preheader109, label %vector.ph90

vector.ph90:                                      ; preds = %min.iters.checked86
  br label %vector.body82

vector.body82:                                    ; preds = %vector.body82, %vector.ph90
  %index91 = phi i64 [ 0, %vector.ph90 ], [ %index.next92, %vector.body82 ]
  %29 = shl i64 %index91, 2
  %30 = add i64 %indvars.iv.unr, %29
  %31 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %30
  %32 = bitcast double* %31 to <8 x double>*
  %wide.vec100 = load <8 x double>, <8 x double>* %32, align 8
  %strided.vec101 = shufflevector <8 x double> %wide.vec100, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec102 = shufflevector <8 x double> %wide.vec100, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec103 = shufflevector <8 x double> %wide.vec100, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec104 = shufflevector <8 x double> %wide.vec100, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %33 = fmul <2 x double> %strided.vec101, %broadcast.splat106
  %34 = fmul <2 x double> %strided.vec102, %broadcast.splat106
  %35 = fmul <2 x double> %strided.vec103, %broadcast.splat106
  %36 = add nsw i64 %30, 3
  %37 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %36
  %38 = fmul <2 x double> %strided.vec104, %broadcast.splat106
  %39 = getelementptr double, double* %37, i64 -3
  %40 = bitcast double* %39 to <8 x double>*
  %41 = shufflevector <2 x double> %33, <2 x double> %34, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %42 = shufflevector <2 x double> %35, <2 x double> %38, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec107 = shufflevector <4 x double> %41, <4 x double> %42, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec107, <8 x double>* %40, align 8
  %index.next92 = add i64 %index91, 2
  %43 = icmp eq i64 %index.next92, %n.vec88
  br i1 %43, label %middle.block83, label %vector.body82, !llvm.loop !4

middle.block83:                                   ; preds = %vector.body82
  %cmp.n95 = icmp eq i64 %n.mod.vf87, 0
  br i1 %cmp.n95, label %..preheader3_crit_edge.us, label %.preheader4.us.new.preheader109

._crit_edge9.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %..preheader3_crit_edge.us, %._crit_edge9.us.loopexit
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next34, %wide.trip.count35
  br i1 %exitcond36, label %._crit_edge11.loopexit, label %.preheader4.us

.preheader4.us.new:                               ; preds = %.preheader4.us.new, %.preheader4.us.new.preheader109
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader4.us.new ], [ %indvars.iv.ph, %.preheader4.us.new.preheader109 ]
  %44 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, %4
  store double %46, double* %44, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %47 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv.next
  %48 = load double, double* %47, align 8
  %49 = fmul double %48, %4
  store double %49, double* %47, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %50 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv.next.1
  %51 = load double, double* %50, align 8
  %52 = fmul double %51, %4
  store double %52, double* %50, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %53 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv.next.2
  %54 = load double, double* %53, align 8
  %55 = fmul double %54, %4
  store double %55, double* %53, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %..preheader3_crit_edge.us.loopexit, label %.preheader4.us.new, !llvm.loop !7

..preheader3_crit_edge.us.loopexit:               ; preds = %.preheader4.us.new
  br label %..preheader3_crit_edge.us

..preheader3_crit_edge.us:                        ; preds = %..preheader3_crit_edge.us.loopexit, %middle.block83, %.prol.loopexit
  br i1 %.not, label %._crit_edge9.us, label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %..preheader3_crit_edge.us
  %56 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 0
  br label %.preheader.us.us

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %scevgep69 = getelementptr [1100 x double], [1100 x double]* %7, i64 %indvars.iv30, i64 2
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv33, i64 %indvars.iv30
  br i1 %lcmp.mod28, label %.prol.loopexit26, label %.prol.preheader25

.prol.preheader25:                                ; preds = %.preheader.us.us
  %58 = load double, double* %57, align 8
  %59 = fmul double %58, %3
  %60 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv30, i64 0
  %61 = load double, double* %60, align 8
  %62 = fmul double %59, %61
  %63 = load double, double* %56, align 8
  %64 = fadd double %63, %62
  store double %64, double* %56, align 8
  br label %.prol.loopexit26

.prol.loopexit26:                                 ; preds = %.prol.preheader25, %.preheader.us.us
  %indvars.iv22.unr.ph = phi i64 [ 1, %.prol.preheader25 ], [ 0, %.preheader.us.us ]
  br i1 %15, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit26
  %65 = sub nsw i64 %16, %indvars.iv22.unr.ph
  %66 = lshr i64 %65, 1
  %67 = add nuw i64 %66, 1
  %min.iters.check = icmp ult i64 %67, 2
  br i1 %min.iters.check, label %.preheader.us.us.new.preheader108, label %min.iters.checked

.preheader.us.us.new.preheader108:                ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us.us.new.preheader
  %indvars.iv22.ph = phi i64 [ %indvars.iv22.unr.ph, %vector.memcheck ], [ %indvars.iv22.unr.ph, %min.iters.checked ], [ %indvars.iv22.unr.ph, %.preheader.us.us.new.preheader ], [ %ind.end, %middle.block ]
  br label %.preheader.us.us.new

min.iters.checked:                                ; preds = %.preheader.us.us.new.preheader
  %n.mod.vf = and i64 %67, 1
  %n.vec = sub i64 %67, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.preheader.us.us.new.preheader108, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep61 = getelementptr [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv22.unr.ph
  %68 = sub nsw i64 %17, %indvars.iv22.unr.ph
  %69 = and i64 %68, -2
  %70 = or i64 %indvars.iv22.unr.ph, %69
  %scevgep64 = getelementptr double, double* %scevgep63, i64 %70
  %scevgep67 = getelementptr [1100 x double], [1100 x double]* %7, i64 %indvars.iv30, i64 %indvars.iv22.unr.ph
  %scevgep70 = getelementptr double, double* %scevgep69, i64 %70
  %bound0 = icmp ult double* %scevgep61, %57
  %bound1 = icmp ult double* %57, %scevgep64
  %found.conflict = and i1 %bound0, %bound1
  %bound073 = icmp ult double* %scevgep61, %scevgep70
  %bound174 = icmp ult double* %scevgep67, %scevgep64
  %found.conflict75 = and i1 %bound073, %bound174
  %conflict.rdx = or i1 %found.conflict, %found.conflict75
  %71 = or i64 %indvars.iv22.unr.ph, 2
  %72 = shl nuw i64 %66, 1
  %73 = add i64 %71, %72
  %74 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %73, %74
  br i1 %conflict.rdx, label %.preheader.us.us.new.preheader108, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %75 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv22.unr.ph, %75
  %76 = load double, double* %57, align 8, !alias.scope !9
  %77 = insertelement <2 x double> undef, double %76, i32 0
  %78 = fmul <2 x double> %77, %broadcast.splatinsert76
  %79 = shufflevector <2 x double> %78, <2 x double> undef, <2 x i32> zeroinitializer
  %80 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv30, i64 %offset.idx
  %81 = bitcast double* %80 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %81, align 8, !alias.scope !12
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec78 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %82 = fmul <2 x double> %79, %strided.vec
  %83 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %offset.idx
  %84 = bitcast double* %83 to <4 x double>*
  %wide.vec79 = load <4 x double>, <4 x double>* %84, align 8, !alias.scope !14, !noalias !16
  %strided.vec80 = shufflevector <4 x double> %wide.vec79, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec81 = shufflevector <4 x double> %wide.vec79, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %85 = fadd <2 x double> %strided.vec80, %82
  %86 = add nuw nsw i64 %offset.idx, 1
  %87 = load double, double* %57, align 8, !alias.scope !9
  %88 = insertelement <2 x double> undef, double %87, i32 0
  %89 = fmul <2 x double> %88, %broadcast.splatinsert76
  %90 = shufflevector <2 x double> %89, <2 x double> undef, <2 x i32> zeroinitializer
  %91 = fmul <2 x double> %90, %strided.vec78
  %92 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %86
  %93 = fadd <2 x double> %strided.vec81, %91
  %94 = getelementptr double, double* %92, i64 -1
  %95 = bitcast double* %94 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %85, <2 x double> %93, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %95, align 8, !alias.scope !14, !noalias !16
  %index.next = add i64 %index, 2
  %96 = icmp eq i64 %index.next, %n.vec
  br i1 %96, label %middle.block, label %vector.body, !llvm.loop !17

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader108

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %middle.block, %.prol.loopexit26
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond = icmp eq i64 %indvars.iv.next31, %wide.trip.count32
  br i1 %exitcond, label %._crit_edge9.us.loopexit, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new, %.preheader.us.us.new.preheader108
  %indvars.iv22 = phi i64 [ %indvars.iv.next23.1, %.preheader.us.us.new ], [ %indvars.iv22.ph, %.preheader.us.us.new.preheader108 ]
  %97 = load double, double* %57, align 8
  %98 = fmul double %97, %3
  %99 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv30, i64 %indvars.iv22
  %100 = load double, double* %99, align 8
  %101 = fmul double %98, %100
  %102 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv22
  %103 = load double, double* %102, align 8
  %104 = fadd double %103, %101
  store double %104, double* %102, align 8
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %105 = load double, double* %57, align 8
  %106 = fmul double %105, %3
  %107 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv30, i64 %indvars.iv.next23
  %108 = load double, double* %107, align 8
  %109 = fmul double %106, %108
  %110 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv.next23
  %111 = load double, double* %110, align 8
  %112 = fadd double %111, %109
  store double %112, double* %110, align 8
  %indvars.iv.next23.1 = add nsw i64 %indvars.iv22, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next23.1, %wide.trip.count24.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new, !llvm.loop !18

.preheader4:                                      ; preds = %.preheader4, %.preheader4.preheader.new
  %indvars.iv50 = phi i64 [ %indvars.iv50.unr, %.preheader4.preheader.new ], [ %indvars.iv.next51.7, %.preheader4 ]
  %indvars.iv.next51.7 = add nsw i64 %indvars.iv50, 8
  %exitcond53.7 = icmp eq i64 %indvars.iv.next51.7, %wide.trip.count52
  br i1 %exitcond53.7, label %._crit_edge11.loopexit110.unr-lcssa, label %.preheader4

._crit_edge11.loopexit:                           ; preds = %._crit_edge9.us
  br label %._crit_edge11

._crit_edge11.loopexit110.unr-lcssa:              ; preds = %.preheader4
  br label %._crit_edge11.loopexit110

._crit_edge11.loopexit110:                        ; preds = %._crit_edge11.loopexit110.unr-lcssa, %.preheader4.prol.loopexit
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit110, %._crit_edge11.loopexit, %8
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1100 x double]* nocapture readonly) #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge4

.preheader.us.preheader:                          ; preds = %3
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count8 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv6 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next7, %._crit_edge.us ]
  %11 = mul nsw i64 %indvars.iv6, %10
  br label %12

; <label>:12:                                     ; preds = %19, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %19 ]
  %13 = add nsw i64 %indvars.iv, %11
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #5
  br label %19

; <label>:19:                                     ; preds = %17, %12
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv6, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %22) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %12

._crit_edge.us:                                   ; preds = %19
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, %wide.trip.count8
  br i1 %exitcond9, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %3
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %26) #5
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
!3 = distinct !{!3, !2}
!4 = distinct !{!4, !5, !6}
!5 = !{!"llvm.loop.vectorize.width", i32 1}
!6 = !{!"llvm.loop.interleave.count", i32 1}
!7 = distinct !{!7, !8, !5, !6}
!8 = !{!"llvm.loop.unroll.runtime.disable"}
!9 = !{!10}
!10 = distinct !{!10, !11}
!11 = distinct !{!11, !"LVerDomain"}
!12 = !{!13}
!13 = distinct !{!13, !11}
!14 = !{!15}
!15 = distinct !{!15, !11}
!16 = !{!10, !13}
!17 = distinct !{!17, !5, !6}
!18 = distinct !{!18, !5, !6}
