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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %8 = bitcast i8* %5 to [1200 x double]*
  %9 = bitcast i8* %6 to [1000 x double]*
  %10 = bitcast i8* %7 to [1000 x double]*
  call fastcc void @init_array(i32 1200, i32 1000, double* nonnull %3, double* nonnull %4, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %10)
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  %13 = bitcast i8* %7 to [1000 x double]*
  call fastcc void @kernel_syr2k(i32 1200, i32 1000, double %11, double %12, [1200 x double]* %8, [1000 x double]* %9, [1000 x double]* %13)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %14 = icmp sgt i32 %0, 42
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %2
  %16 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %16, align 1
  %17 = icmp eq i8 %strcmpload, 0
  br i1 %17, label %18, label %._crit_edge

; <label>:18:                                     ; preds = %15
  %19 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @print_array(i32 1200, [1200 x double]* %19)
  br label %._crit_edge

._crit_edge:                                      ; preds = %15, %2, %18
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double*, double*, [1200 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  store double 1.200000e+00, double* %3, align 8
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %._crit_edge.lr.ph, label %.loopexit

._crit_edge.lr.ph:                                ; preds = %7
  %9 = icmp sgt i32 %1, 0
  %10 = sext i32 %0 to i64
  %11 = sitofp i32 %0 to double
  %12 = sitofp i32 %1 to double
  %13 = sext i32 %1 to i64
  br i1 %9, label %._crit_edge.us.preheader, label %._crit_edge5.us.preheader

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  %14 = insertelement <2 x double> undef, double %11, i32 0
  %15 = insertelement <2 x double> %14, double %12, i32 1
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge16.us
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %._crit_edge16.us ], [ 0, %._crit_edge.us.preheader ]
  br label %16

; <label>:16:                                     ; preds = %._crit_edge.us, %16
  %indvars.iv31 = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next32, %16 ]
  %17 = mul nsw i64 %indvars.iv33, %indvars.iv31
  %18 = add nsw i64 %17, 1
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, %0
  %21 = sitofp i32 %20 to double
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv31
  %23 = add nsw i64 %17, 2
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, %1
  %26 = sitofp i32 %25 to double
  %27 = insertelement <2 x double> undef, double %21, i32 0
  %28 = insertelement <2 x double> %27, double %26, i32 1
  %29 = fdiv <2 x double> %28, %15
  %30 = extractelement <2 x double> %29, i32 0
  %31 = extractelement <2 x double> %29, i32 1
  store double %30, double* %22, align 8
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv33, i64 %indvars.iv31
  store double %31, double* %32, align 8
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %33 = icmp slt i64 %indvars.iv.next32, %13
  br i1 %33, label %16, label %._crit_edge16.us

._crit_edge16.us:                                 ; preds = %16
  %indvars.iv.next34 = add nsw i64 %indvars.iv33, 1
  %34 = icmp slt i64 %indvars.iv.next34, %10
  br i1 %34, label %._crit_edge.us, label %._crit_edge5.us.preheader.loopexit

._crit_edge5.us.preheader.loopexit:               ; preds = %._crit_edge16.us
  br label %._crit_edge5.us.preheader

._crit_edge5.us.preheader:                        ; preds = %._crit_edge5.us.preheader.loopexit, %._crit_edge.lr.ph
  %wide.trip.count = zext i32 %0 to i64
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %._crit_edge5.us.preheader, %._crit_edge8.us
  %indvars.iv29 = phi i64 [ 0, %._crit_edge5.us.preheader ], [ %indvars.iv.next30, %._crit_edge8.us ]
  br label %35

; <label>:35:                                     ; preds = %35, %._crit_edge5.us
  %indvars.iv = phi i64 [ 0, %._crit_edge5.us ], [ %indvars.iv.next, %35 ]
  %36 = mul nsw i64 %indvars.iv29, %indvars.iv
  %37 = add nsw i64 %36, 3
  %38 = trunc i64 %37 to i32
  %39 = srem i32 %38, %0
  %40 = sitofp i32 %39 to double
  %41 = fdiv double %40, %12
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv29, i64 %indvars.iv
  store double %41, double* %42, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge8.us, label %35

._crit_edge8.us:                                  ; preds = %35
  %indvars.iv.next30 = add nsw i64 %indvars.iv29, 1
  %43 = icmp slt i64 %indvars.iv.next30, %10
  br i1 %43, label %._crit_edge5.us, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge8.us
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %7
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_syr2k(i32, i32, double, double, [1200 x double]*, [1000 x double]*, [1000 x double]*) unnamed_addr #2 {
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %._crit_edge.lr.ph, label %.loopexit

._crit_edge.lr.ph:                                ; preds = %7
  %wide.trip.count47 = zext i32 %1 to i64
  %9 = icmp sgt i32 %1, 0
  %10 = sext i32 %0 to i64
  br i1 %9, label %._crit_edge.us.preheader, label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %._crit_edge.lr.ph
  %11 = insertelement <2 x double> undef, double %3, i32 0
  %12 = insertelement <2 x double> %11, double %3, i32 1
  %13 = insertelement <2 x double> undef, double %3, i32 0
  %14 = insertelement <2 x double> %13, double %3, i32 1
  %broadcast.splatinsert79 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat80 = shufflevector <2 x double> %broadcast.splatinsert79, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  %broadcast.splatinsert123 = insertelement <2 x double> undef, double %2, i32 0
  %broadcast.splat124 = shufflevector <2 x double> %broadcast.splatinsert123, <2 x double> undef, <2 x i32> zeroinitializer
  %15 = insertelement <2 x double> undef, double %3, i32 0
  %16 = insertelement <2 x double> %15, double %3, i32 1
  %17 = insertelement <2 x double> undef, double %3, i32 0
  %18 = insertelement <2 x double> %17, double %3, i32 1
  %broadcast.splatinsert148 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splat149 = shufflevector <2 x double> %broadcast.splatinsert148, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge12.us
  %indvars.iv70 = phi i64 [ %indvars.iv.next71, %._crit_edge12.us ], [ 1, %._crit_edge.us.preheader ]
  %indvars.iv68 = phi i2 [ %indvars.iv.next69, %._crit_edge12.us ], [ 1, %._crit_edge.us.preheader ]
  %indvar = phi i32 [ %.pre, %._crit_edge12.us ], [ 0, %._crit_edge.us.preheader ]
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %._crit_edge12.us ], [ 0, %._crit_edge.us.preheader ]
  %19 = add i64 %indvars.iv50, -3
  %scevgep = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 0
  %20 = mul i64 %indvars.iv50, 1201
  %21 = add i64 %20, 1
  %scevgep91 = getelementptr [1200 x double], [1200 x double]* %4, i64 0, i64 %21
  %22 = add i64 %indvars.iv50, 1
  %23 = and i64 %indvars.iv70, 4294967295
  %24 = zext i2 %indvars.iv68 to i64
  %25 = add nuw nsw i64 %24, 4294967295
  %26 = and i64 %25, 4294967295
  %27 = add nuw nsw i64 %26, 1
  %28 = icmp slt i64 %indvars.iv50, 0
  %.pre = add i32 %indvar, 1
  br i1 %28, label %._crit_edge12.us, label %.lr.ph.us.preheader

.lr.ph.us.preheader:                              ; preds = %._crit_edge.us
  %xtraiter = and i32 %.pre, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.us.prol.loopexit, label %.lr.ph.us.prol.preheader

.lr.ph.us.prol.preheader:                         ; preds = %.lr.ph.us.preheader
  br label %.lr.ph.us.prol

.lr.ph.us.prol:                                   ; preds = %.lr.ph.us.prol.preheader, %.lr.ph.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.lr.ph.us.prol ], [ 0, %.lr.ph.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph.us.prol ], [ %xtraiter, %.lr.ph.us.prol.preheader ]
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 %indvars.iv.prol
  %30 = load double, double* %29, align 8
  %31 = fmul double %30, %3
  store double %31, double* %29, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph.us.prol.loopexit.loopexit, label %.lr.ph.us.prol, !llvm.loop !1

.lr.ph.us.prol.loopexit.loopexit:                 ; preds = %.lr.ph.us.prol
  br label %.lr.ph.us.prol.loopexit

.lr.ph.us.prol.loopexit:                          ; preds = %.lr.ph.us.prol.loopexit.loopexit, %.lr.ph.us.preheader
  %indvars.iv.unr = phi i64 [ 0, %.lr.ph.us.preheader ], [ %27, %.lr.ph.us.prol.loopexit.loopexit ]
  %32 = icmp ult i32 %indvar, 3
  br i1 %32, label %._crit_edge5.us24.preheader, label %.lr.ph.us.preheader65

.lr.ph.us.preheader65:                            ; preds = %.lr.ph.us.prol.loopexit
  %33 = sub i64 %19, %indvars.iv.unr
  %34 = lshr i64 %33, 2
  %35 = add nuw nsw i64 %34, 1
  %min.iters.check128 = icmp ult i64 %35, 2
  br i1 %min.iters.check128, label %.lr.ph.us.preheader152, label %min.iters.checked129

min.iters.checked129:                             ; preds = %.lr.ph.us.preheader65
  %n.mod.vf130 = and i64 %35, 1
  %n.vec131 = sub nsw i64 %35, %n.mod.vf130
  %cmp.zero132 = icmp eq i64 %n.vec131, 0
  %36 = add nsw i64 %indvars.iv.unr, 4
  %37 = shl nuw i64 %34, 2
  %38 = add i64 %36, %37
  %39 = shl nuw nsw i64 %n.mod.vf130, 2
  %ind.end137 = sub i64 %38, %39
  br i1 %cmp.zero132, label %.lr.ph.us.preheader152, label %vector.ph133

vector.ph133:                                     ; preds = %min.iters.checked129
  br label %vector.body125

vector.body125:                                   ; preds = %vector.body125, %vector.ph133
  %index134 = phi i64 [ 0, %vector.ph133 ], [ %index.next135, %vector.body125 ]
  %40 = shl i64 %index134, 2
  %41 = add i64 %indvars.iv.unr, %40
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 %41
  %43 = bitcast double* %42 to <8 x double>*
  %wide.vec143 = load <8 x double>, <8 x double>* %43, align 8
  %strided.vec144 = shufflevector <8 x double> %wide.vec143, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec145 = shufflevector <8 x double> %wide.vec143, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec146 = shufflevector <8 x double> %wide.vec143, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec147 = shufflevector <8 x double> %wide.vec143, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %44 = fmul <2 x double> %strided.vec144, %broadcast.splat149
  %45 = fmul <2 x double> %strided.vec145, %broadcast.splat149
  %46 = fmul <2 x double> %strided.vec146, %broadcast.splat149
  %47 = add nsw i64 %41, 3
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 %47
  %49 = fmul <2 x double> %strided.vec147, %broadcast.splat149
  %50 = getelementptr double, double* %48, i64 -3
  %51 = bitcast double* %50 to <8 x double>*
  %52 = shufflevector <2 x double> %44, <2 x double> %45, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %53 = shufflevector <2 x double> %46, <2 x double> %49, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec150 = shufflevector <4 x double> %52, <4 x double> %53, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec150, <8 x double>* %51, align 8
  %index.next135 = add i64 %index134, 2
  %54 = icmp eq i64 %index.next135, %n.vec131
  br i1 %54, label %middle.block126, label %vector.body125, !llvm.loop !3

middle.block126:                                  ; preds = %vector.body125
  %cmp.n138 = icmp eq i64 %n.mod.vf130, 0
  br i1 %cmp.n138, label %._crit_edge5.us24.preheader, label %.lr.ph.us.preheader152

.lr.ph.us.preheader152:                           ; preds = %middle.block126, %min.iters.checked129, %.lr.ph.us.preheader65
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked129 ], [ %indvars.iv.unr, %.lr.ph.us.preheader65 ], [ %ind.end137, %middle.block126 ]
  br label %.lr.ph.us

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader152, %.lr.ph.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.lr.ph.us ], [ %indvars.iv.ph, %.lr.ph.us.preheader152 ]
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 %indvars.iv
  %56 = bitcast double* %55 to <2 x double>*
  %57 = load <2 x double>, <2 x double>* %56, align 8
  %58 = fmul <2 x double> %57, %16
  %59 = bitcast double* %55 to <2 x double>*
  store <2 x double> %58, <2 x double>* %59, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 %indvars.iv.next.1
  %61 = bitcast double* %60 to <2 x double>*
  %62 = load <2 x double>, <2 x double>* %61, align 8
  %63 = fmul <2 x double> %62, %18
  %64 = bitcast double* %60 to <2 x double>*
  store <2 x double> %63, <2 x double>* %64, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %23
  br i1 %exitcond.3, label %._crit_edge5.us24.preheader.loopexit, label %.lr.ph.us, !llvm.loop !6

._crit_edge5.us24.preheader.loopexit:             ; preds = %.lr.ph.us
  br label %._crit_edge5.us24.preheader

._crit_edge5.us24.preheader:                      ; preds = %._crit_edge5.us24.preheader.loopexit, %.lr.ph.us.prol.loopexit, %middle.block126
  %min.iters.check84 = icmp ult i64 %22, 2
  %n.vec87 = and i64 %22, -2
  %cmp.zero88 = icmp eq i64 %n.vec87, 0
  %cmp.n119 = icmp eq i64 %22, %n.vec87
  br label %._crit_edge5.us24

._crit_edge5.us24:                                ; preds = %._crit_edge5.us24.preheader, %._crit_edge9.us28
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %._crit_edge9.us28 ], [ 0, %._crit_edge5.us24.preheader ]
  %scevgep93 = getelementptr [1000 x double], [1000 x double]* %5, i64 0, i64 %indvars.iv45
  %65 = add i64 %indvars.iv45, 1
  %scevgep95 = getelementptr [1000 x double], [1000 x double]* %5, i64 %indvars.iv50, i64 %65
  %scevgep97 = getelementptr [1000 x double], [1000 x double]* %6, i64 0, i64 %indvars.iv45
  %scevgep99 = getelementptr [1000 x double], [1000 x double]* %6, i64 %indvars.iv50, i64 %65
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv50, i64 %indvars.iv45
  %67 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv50, i64 %indvars.iv45
  br i1 %min.iters.check84, label %scalar.ph83.preheader, label %min.iters.checked85

min.iters.checked85:                              ; preds = %._crit_edge5.us24
  br i1 %cmp.zero88, label %scalar.ph83.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked85
  %bound0 = icmp ult double* %scevgep, %67
  %bound1 = icmp ult double* %67, %scevgep91
  %found.conflict = and i1 %bound0, %bound1
  %bound0102 = icmp ult double* %scevgep, %scevgep95
  %bound1103 = icmp ult double* %scevgep93, %scevgep91
  %found.conflict104 = and i1 %bound0102, %bound1103
  %conflict.rdx = or i1 %found.conflict, %found.conflict104
  %bound0105 = icmp ult double* %scevgep, %scevgep99
  %bound1106 = icmp ult double* %scevgep97, %scevgep91
  %found.conflict107 = and i1 %bound0105, %bound1106
  %conflict.rdx108 = or i1 %conflict.rdx, %found.conflict107
  %bound0111 = icmp ult double* %scevgep, %66
  %bound1112 = icmp ult double* %66, %scevgep91
  %found.conflict113 = and i1 %bound0111, %bound1112
  %conflict.rdx114 = or i1 %conflict.rdx108, %found.conflict113
  br i1 %conflict.rdx114, label %scalar.ph83.preheader, label %vector.ph115

vector.ph115:                                     ; preds = %vector.memcheck
  br label %vector.body81

vector.body81:                                    ; preds = %vector.body81, %vector.ph115
  %index116 = phi i64 [ 0, %vector.ph115 ], [ %index.next117, %vector.body81 ]
  %68 = or i64 %index116, 1
  %69 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %index116, i64 %indvars.iv45
  %70 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %68, i64 %indvars.iv45
  %71 = load double, double* %69, align 8, !alias.scope !8
  %72 = load double, double* %70, align 8, !alias.scope !8
  %73 = insertelement <2 x double> undef, double %71, i32 0
  %74 = insertelement <2 x double> %73, double %72, i32 1
  %75 = fmul <2 x double> %74, %broadcast.splat124
  %76 = load double, double* %66, align 8, !alias.scope !11
  %77 = insertelement <2 x double> undef, double %76, i32 0
  %78 = shufflevector <2 x double> %77, <2 x double> undef, <2 x i32> zeroinitializer
  %79 = fmul <2 x double> %75, %78
  %80 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %index116, i64 %indvars.iv45
  %81 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %68, i64 %indvars.iv45
  %82 = load double, double* %80, align 8, !alias.scope !13
  %83 = load double, double* %81, align 8, !alias.scope !13
  %84 = insertelement <2 x double> undef, double %82, i32 0
  %85 = insertelement <2 x double> %84, double %83, i32 1
  %86 = fmul <2 x double> %85, %broadcast.splat124
  %87 = load double, double* %67, align 8, !alias.scope !15
  %88 = insertelement <2 x double> undef, double %87, i32 0
  %89 = shufflevector <2 x double> %88, <2 x double> undef, <2 x i32> zeroinitializer
  %90 = fmul <2 x double> %86, %89
  %91 = fadd <2 x double> %79, %90
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 %index116
  %93 = bitcast double* %92 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %93, align 8, !alias.scope !17, !noalias !19
  %94 = fadd <2 x double> %wide.load, %91
  %95 = bitcast double* %92 to <2 x double>*
  store <2 x double> %94, <2 x double>* %95, align 8, !alias.scope !17, !noalias !19
  %index.next117 = add i64 %index116, 2
  %96 = icmp eq i64 %index.next117, %n.vec87
  br i1 %96, label %middle.block82, label %vector.body81, !llvm.loop !20

middle.block82:                                   ; preds = %vector.body81
  br i1 %cmp.n119, label %._crit_edge9.us28, label %scalar.ph83.preheader

scalar.ph83.preheader:                            ; preds = %middle.block82, %vector.memcheck, %min.iters.checked85, %._crit_edge5.us24
  %indvars.iv39.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked85 ], [ 0, %._crit_edge5.us24 ], [ %n.vec87, %middle.block82 ]
  br label %scalar.ph83

scalar.ph83:                                      ; preds = %scalar.ph83.preheader, %scalar.ph83
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %scalar.ph83 ], [ %indvars.iv39.ph, %scalar.ph83.preheader ]
  %97 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv45
  %98 = load double, double* %97, align 8
  %99 = fmul double %98, %2
  %100 = load double, double* %66, align 8
  %101 = fmul double %99, %100
  %102 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv39, i64 %indvars.iv45
  %103 = load double, double* %102, align 8
  %104 = fmul double %103, %2
  %105 = load double, double* %67, align 8
  %106 = fmul double %104, %105
  %107 = fadd double %101, %106
  %108 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 %indvars.iv39
  %109 = load double, double* %108, align 8
  %110 = fadd double %109, %107
  store double %110, double* %108, align 8
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond = icmp eq i64 %indvars.iv.next40, %23
  br i1 %exitcond, label %._crit_edge9.us28.loopexit, label %scalar.ph83, !llvm.loop !21

._crit_edge9.us28.loopexit:                       ; preds = %scalar.ph83
  br label %._crit_edge9.us28

._crit_edge9.us28:                                ; preds = %._crit_edge9.us28.loopexit, %middle.block82
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next46, %wide.trip.count47
  br i1 %exitcond48, label %._crit_edge12.us.loopexit, label %._crit_edge5.us24

._crit_edge12.us.loopexit:                        ; preds = %._crit_edge9.us28
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %._crit_edge12.us.loopexit, %._crit_edge.us
  %indvars.iv.next51 = add nsw i64 %indvars.iv50, 1
  %111 = icmp slt i64 %indvars.iv.next51, %10
  %indvars.iv.next71 = add nuw nsw i64 %23, 1
  %indvars.iv.next69 = add i2 %indvars.iv68, 1
  br i1 %111, label %._crit_edge.us, label %.loopexit.loopexit

._crit_edge:                                      ; preds = %._crit_edge.preheader, %._crit_edge4
  %indvars.iv72 = phi i2 [ %indvars.iv.next73, %._crit_edge4 ], [ 1, %._crit_edge.preheader ]
  %indvar60 = phi i32 [ %.pre75, %._crit_edge4 ], [ 0, %._crit_edge.preheader ]
  %indvars.iv58 = phi i64 [ %indvars.iv.next59, %._crit_edge4 ], [ 0, %._crit_edge.preheader ]
  %indvars.iv54 = phi i32 [ %indvars.iv.next55, %._crit_edge4 ], [ 1, %._crit_edge.preheader ]
  %112 = add i64 %indvars.iv58, -3
  %113 = zext i2 %indvars.iv72 to i64
  %114 = add nuw nsw i64 %113, 4294967295
  %115 = and i64 %114, 4294967295
  %116 = add nuw nsw i64 %115, 1
  %117 = icmp slt i64 %indvars.iv58, 0
  %.pre75 = add i32 %indvar60, 1
  br i1 %117, label %._crit_edge4, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %._crit_edge
  %xtraiter62 = and i32 %.pre75, 3
  %lcmp.mod63 = icmp eq i32 %xtraiter62, 0
  br i1 %lcmp.mod63, label %.lr.ph.prol.loopexit, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader, %.lr.ph.prol
  %indvars.iv52.prol = phi i64 [ %indvars.iv.next53.prol, %.lr.ph.prol ], [ 0, %.lr.ph.prol.preheader ]
  %prol.iter64 = phi i32 [ %prol.iter64.sub, %.lr.ph.prol ], [ %xtraiter62, %.lr.ph.prol.preheader ]
  %118 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv58, i64 %indvars.iv52.prol
  %119 = load double, double* %118, align 8
  %120 = fmul double %119, %3
  store double %120, double* %118, align 8
  %indvars.iv.next53.prol = add nuw nsw i64 %indvars.iv52.prol, 1
  %prol.iter64.sub = add nsw i32 %prol.iter64, -1
  %prol.iter64.cmp = icmp eq i32 %prol.iter64.sub, 0
  br i1 %prol.iter64.cmp, label %.lr.ph.prol.loopexit.loopexit, label %.lr.ph.prol, !llvm.loop !22

.lr.ph.prol.loopexit.loopexit:                    ; preds = %.lr.ph.prol
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.loopexit, %.lr.ph.preheader
  %indvars.iv52.unr = phi i64 [ 0, %.lr.ph.preheader ], [ %116, %.lr.ph.prol.loopexit.loopexit ]
  %121 = icmp ult i32 %indvar60, 3
  br i1 %121, label %._crit_edge4, label %.lr.ph.preheader66

.lr.ph.preheader66:                               ; preds = %.lr.ph.prol.loopexit
  %wide.trip.count56.3 = zext i32 %indvars.iv54 to i64
  %122 = sub i64 %112, %indvars.iv52.unr
  %123 = lshr i64 %122, 2
  %124 = add nuw nsw i64 %123, 1
  %min.iters.check = icmp ult i64 %124, 2
  br i1 %min.iters.check, label %.lr.ph.preheader153, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph.preheader66
  %n.mod.vf = and i64 %124, 1
  %n.vec = sub nsw i64 %124, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %125 = add nsw i64 %indvars.iv52.unr, 4
  %126 = shl nuw i64 %123, 2
  %127 = add i64 %125, %126
  %128 = shl nuw nsw i64 %n.mod.vf, 2
  %ind.end = sub i64 %127, %128
  br i1 %cmp.zero, label %.lr.ph.preheader153, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %129 = shl i64 %index, 2
  %130 = add i64 %indvars.iv52.unr, %129
  %131 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv58, i64 %130
  %132 = bitcast double* %131 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %132, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec76 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec77 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec78 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %133 = fmul <2 x double> %strided.vec, %broadcast.splat80
  %134 = fmul <2 x double> %strided.vec76, %broadcast.splat80
  %135 = fmul <2 x double> %strided.vec77, %broadcast.splat80
  %136 = add nsw i64 %130, 3
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv58, i64 %136
  %138 = fmul <2 x double> %strided.vec78, %broadcast.splat80
  %139 = getelementptr double, double* %137, i64 -3
  %140 = bitcast double* %139 to <8 x double>*
  %141 = shufflevector <2 x double> %133, <2 x double> %134, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %142 = shufflevector <2 x double> %135, <2 x double> %138, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %141, <4 x double> %142, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %140, align 8
  %index.next = add i64 %index, 2
  %143 = icmp eq i64 %index.next, %n.vec
  br i1 %143, label %middle.block, label %vector.body, !llvm.loop !23

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge4, label %.lr.ph.preheader153

.lr.ph.preheader153:                              ; preds = %middle.block, %min.iters.checked, %.lr.ph.preheader66
  %indvars.iv52.ph = phi i64 [ %indvars.iv52.unr, %min.iters.checked ], [ %indvars.iv52.unr, %.lr.ph.preheader66 ], [ %ind.end, %middle.block ]
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader153, %.lr.ph
  %indvars.iv52 = phi i64 [ %indvars.iv.next53.3, %.lr.ph ], [ %indvars.iv52.ph, %.lr.ph.preheader153 ]
  %144 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv58, i64 %indvars.iv52
  %145 = bitcast double* %144 to <2 x double>*
  %146 = load <2 x double>, <2 x double>* %145, align 8
  %147 = fmul <2 x double> %146, %12
  %148 = bitcast double* %144 to <2 x double>*
  store <2 x double> %147, <2 x double>* %148, align 8
  %indvars.iv.next53.1 = add nsw i64 %indvars.iv52, 2
  %149 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv58, i64 %indvars.iv.next53.1
  %150 = bitcast double* %149 to <2 x double>*
  %151 = load <2 x double>, <2 x double>* %150, align 8
  %152 = fmul <2 x double> %151, %14
  %153 = bitcast double* %149 to <2 x double>*
  store <2 x double> %152, <2 x double>* %153, align 8
  %indvars.iv.next53.3 = add nsw i64 %indvars.iv52, 4
  %exitcond57.3 = icmp eq i64 %indvars.iv.next53.3, %wide.trip.count56.3
  br i1 %exitcond57.3, label %._crit_edge4.loopexit, label %.lr.ph, !llvm.loop !24

._crit_edge4.loopexit:                            ; preds = %.lr.ph
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %._crit_edge, %middle.block, %.lr.ph.prol.loopexit
  %indvars.iv.next59 = add nsw i64 %indvars.iv58, 1
  %154 = icmp slt i64 %indvars.iv.next59, %10
  %indvars.iv.next55 = add i32 %indvars.iv54, 1
  %indvars.iv.next73 = add i2 %indvars.iv72, 1
  br i1 %154, label %._crit_edge, label %.loopexit.loopexit154

.loopexit.loopexit:                               ; preds = %._crit_edge12.us
  br label %.loopexit

.loopexit.loopexit154:                            ; preds = %._crit_edge4
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit154, %.loopexit.loopexit, %7
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %._crit_edge.us.preheader, label %.loopexit

._crit_edge.us.preheader:                         ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  %8 = sext i32 %0 to i64
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge4.us
  %indvars.iv13 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next14, %._crit_edge4.us ]
  %9 = mul nsw i64 %indvars.iv13, %8
  br label %10

; <label>:10:                                     ; preds = %._crit_edge2.us, %._crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next, %._crit_edge2.us ]
  %11 = add nsw i64 %9, %indvars.iv
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge2.us

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %10, %15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge4.us, label %10

._crit_edge4.us:                                  ; preds = %._crit_edge2.us
  %indvars.iv.next14 = add nsw i64 %indvars.iv13, 1
  %21 = icmp slt i64 %indvars.iv.next14, %8
  br i1 %21, label %._crit_edge.us, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge4.us
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %2
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
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
!13 = !{!14}
!14 = distinct !{!14, !10}
!15 = !{!16}
!16 = distinct !{!16, !10}
!17 = !{!18}
!18 = distinct !{!18, !10}
!19 = !{!16, !9, !14, !12}
!20 = distinct !{!20, !4, !5}
!21 = distinct !{!21, !4, !5}
!22 = distinct !{!22, !2}
!23 = distinct !{!23, !4, !5}
!24 = distinct !{!24, !7, !4, !5}
