; ModuleID = 'A.ll'
source_filename = "gemm.c"
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
  %5 = tail call i8* @polybench_alloc_data(i64 1100000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %8 = bitcast i8* %5 to [1100 x double]*
  %9 = bitcast i8* %6 to [1200 x double]*
  %10 = bitcast i8* %7 to [1100 x double]*
  call fastcc void @init_array(i32 1000, i32 1100, i32 1200, double* nonnull %3, double* nonnull %4, [1100 x double]* %8, [1200 x double]* %9, [1100 x double]* %10)
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  call fastcc void @kernel_gemm(i32 1000, i32 1100, i32 1200, double %11, double %12, [1100 x double]* %8, [1200 x double]* %9, [1100 x double]* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  call fastcc void @print_array(i32 1000, i32 1100, [1100 x double]* %8)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, double* nocapture, double* nocapture, [1100 x double]*, [1200 x double]*, [1100 x double]*) unnamed_addr #2 {
  store double 1.500000e+00, double* %3, align 8
  store double 1.200000e+00, double* %4, align 8
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.preheader9.lr.ph, label %.preheader8.thread

.preheader8.thread:                               ; preds = %8
  br label %.preheader6

.preheader9.lr.ph:                                ; preds = %8
  %10 = icmp sgt i32 %1, 0
  %11 = sitofp i32 %0 to double
  br i1 %10, label %.preheader9.us.preheader, label %.preheader8

.preheader9.us.preheader:                         ; preds = %.preheader9.lr.ph
  %12 = sext i32 %0 to i64
  %wide.trip.count55 = zext i32 %1 to i64
  br label %.preheader9.us

.preheader9.us:                                   ; preds = %._crit_edge27.us, %.preheader9.us.preheader
  %indvars.iv57 = phi i64 [ 0, %.preheader9.us.preheader ], [ %indvars.iv.next58, %._crit_edge27.us ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader9.us
  %indvars.iv53 = phi i64 [ 0, %.preheader9.us ], [ %indvars.iv.next54, %._crit_edge ]
  %13 = mul nsw i64 %indvars.iv53, %indvars.iv57
  %14 = add nsw i64 %13, 1
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, %0
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, %11
  %19 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv57, i64 %indvars.iv53
  store double %18, double* %19, align 8
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %exitcond56 = icmp eq i64 %indvars.iv.next54, %wide.trip.count55
  br i1 %exitcond56, label %._crit_edge27.us, label %._crit_edge

._crit_edge27.us:                                 ; preds = %._crit_edge
  %indvars.iv.next58 = add nsw i64 %indvars.iv57, 1
  %20 = icmp slt i64 %indvars.iv.next58, %12
  br i1 %20, label %.preheader9.us, label %.preheader8.loopexit

.preheader8.loopexit:                             ; preds = %._crit_edge27.us
  br label %.preheader8

.preheader8:                                      ; preds = %.preheader8.loopexit, %.preheader9.lr.ph
  br i1 true, label %.preheader7.lr.ph, label %.preheader8..preheader6_crit_edge

.preheader8..preheader6_crit_edge:                ; preds = %.preheader8
  br label %.preheader6

.preheader7.lr.ph:                                ; preds = %.preheader8
  %21 = icmp sgt i32 %2, 0
  %22 = sitofp i32 %2 to double
  br i1 %21, label %.preheader7.us.preheader, label %..preheader6_crit_edge.loopexit36

.preheader7.us.preheader:                         ; preds = %.preheader7.lr.ph
  %23 = sext i32 %0 to i64
  %xtraiter = and i32 %2, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %24 = icmp eq i32 %2, 1
  %wide.trip.count47.1 = zext i32 %2 to i64
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge18.us, %.preheader7.us.preheader
  %indvars.iv49 = phi i64 [ 0, %.preheader7.us.preheader ], [ %indvars.iv.next50, %._crit_edge18.us ]
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader7.us
  %25 = trunc i64 %indvars.iv49 to i32
  %26 = srem i32 %25, %2
  %27 = sitofp i32 %26 to double
  %28 = fdiv double %27, %22
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv49, i64 0
  store double %28, double* %29, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader7.us, %.prol.preheader
  %indvars.iv45.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader7.us ]
  br i1 %24, label %._crit_edge18.us, label %.preheader7.us.new.preheader

.preheader7.us.new.preheader:                     ; preds = %.prol.loopexit
  br label %.preheader7.us.new

.preheader7.us.new:                               ; preds = %.preheader7.us.new.preheader, %.preheader7.us.new
  %indvars.iv45 = phi i64 [ %indvars.iv.next46.1, %.preheader7.us.new ], [ %indvars.iv45.unr.ph, %.preheader7.us.new.preheader ]
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %30 = mul nsw i64 %indvars.iv.next46, %indvars.iv49
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, %2
  %33 = sitofp i32 %32 to double
  %34 = fdiv double %33, %22
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv49, i64 %indvars.iv45
  store double %34, double* %35, align 8
  %indvars.iv.next46.1 = add nsw i64 %indvars.iv45, 2
  %36 = mul nsw i64 %indvars.iv.next46.1, %indvars.iv49
  %37 = trunc i64 %36 to i32
  %38 = srem i32 %37, %2
  %39 = sitofp i32 %38 to double
  %40 = fdiv double %39, %22
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv49, i64 %indvars.iv.next46
  store double %40, double* %41, align 8
  %exitcond48.1 = icmp eq i64 %indvars.iv.next46.1, %wide.trip.count47.1
  br i1 %exitcond48.1, label %._crit_edge18.us.loopexit, label %.preheader7.us.new

._crit_edge18.us.loopexit:                        ; preds = %.preheader7.us.new
  br label %._crit_edge18.us

._crit_edge18.us:                                 ; preds = %._crit_edge18.us.loopexit, %.prol.loopexit
  %indvars.iv.next50 = add nsw i64 %indvars.iv49, 1
  %42 = icmp slt i64 %indvars.iv.next50, %23
  br i1 %42, label %.preheader7.us, label %..preheader6_crit_edge.loopexit

..preheader6_crit_edge.loopexit:                  ; preds = %._crit_edge18.us
  br label %..preheader6_crit_edge

..preheader6_crit_edge.loopexit36:                ; preds = %.preheader7.lr.ph
  br label %..preheader6_crit_edge

..preheader6_crit_edge:                           ; preds = %..preheader6_crit_edge.loopexit36, %..preheader6_crit_edge.loopexit
  br label %.preheader6

.preheader6:                                      ; preds = %.preheader8..preheader6_crit_edge, %.preheader8.thread, %..preheader6_crit_edge
  %43 = icmp sgt i32 %2, 0
  br i1 %43, label %.preheader.lr.ph, label %.preheader6._crit_edge

.preheader.lr.ph:                                 ; preds = %.preheader6
  %44 = icmp sgt i32 %1, 0
  %45 = sitofp i32 %1 to double
  br i1 %44, label %.preheader.us.preheader, label %._crit_edge13.loopexit35

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %46 = sext i32 %2 to i64
  %wide.trip.count = zext i32 %1 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv43 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next44, %._crit_edge.us ]
  br label %._crit_edge61

._crit_edge61:                                    ; preds = %._crit_edge61, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge61 ]
  %47 = add nuw nsw i64 %indvars.iv, 2
  %48 = mul nsw i64 %47, %indvars.iv43
  %49 = trunc i64 %48 to i32
  %50 = srem i32 %49, %1
  %51 = sitofp i32 %50 to double
  %52 = fdiv double %51, %45
  %53 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv43, i64 %indvars.iv
  store double %52, double* %53, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge61

._crit_edge.us:                                   ; preds = %._crit_edge61
  %indvars.iv.next44 = add nsw i64 %indvars.iv43, 1
  %54 = icmp slt i64 %indvars.iv.next44, %46
  br i1 %54, label %.preheader.us, label %._crit_edge13.loopexit

._crit_edge13.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge13

._crit_edge13.loopexit35:                         ; preds = %.preheader.lr.ph
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit35, %._crit_edge13.loopexit
  br label %.preheader6._crit_edge

.preheader6._crit_edge:                           ; preds = %.preheader6, %._crit_edge13
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemm(i32, i32, i32, double, double, [1100 x double]*, [1200 x double]*, [1100 x double]*) unnamed_addr #2 {
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.preheader5.lr.ph, label %._crit_edge

.preheader5.lr.ph:                                ; preds = %8
  %10 = icmp sgt i32 %1, 0
  %11 = icmp sgt i32 %2, 0
  br i1 %10, label %.preheader5.us.preheader, label %.preheader5.preheader

.preheader5.preheader:                            ; preds = %.preheader5.lr.ph
  %12 = sext i32 %0 to i64
  br label %.preheader5

.preheader5.us.preheader:                         ; preds = %.preheader5.lr.ph
  %13 = add i32 %1, -1
  %14 = sext i32 %1 to i64
  %15 = sext i32 %0 to i64
  %xtraiter = and i32 %1, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %16 = icmp ult i32 %13, 3
  %wide.trip.count38 = zext i32 %2 to i64
  %wide.trip.count.3 = zext i32 %1 to i64
  %17 = icmp sgt i64 %14, 1
  %smax77 = select i1 %17, i64 %14, i64 1
  %18 = add nsw i64 %wide.trip.count.3, -4
  %min.iters.check78 = icmp ult i64 %smax77, 4
  %n.vec81 = and i64 %smax77, 9223372036854775804
  %cmp.zero82 = icmp eq i64 %n.vec81, 0
  %broadcast.splatinsert115 = insertelement <2 x double> undef, double %3, i32 0
  %cmp.n110 = icmp eq i64 %smax77, %n.vec81
  %broadcast.splatinsert140 = insertelement <2 x double> undef, double %4, i32 0
  %broadcast.splat141 = shufflevector <2 x double> %broadcast.splatinsert140, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %._crit_edge9.us..preheader5.us_crit_edge, %.preheader5.us.preheader
  %indvar84 = phi i64 [ 0, %.preheader5.us.preheader ], [ %indvar.next85, %._crit_edge9.us..preheader5.us_crit_edge ]
  %indvars.iv39 = phi i64 [ 0, %.preheader5.us.preheader ], [ %indvars.iv.next40, %._crit_edge9.us..preheader5.us_crit_edge ]
  %scevgep86 = getelementptr [1100 x double], [1100 x double]* %5, i64 %indvar84, i64 0
  %scevgep89 = getelementptr [1100 x double], [1100 x double]* %5, i64 %indvar84, i64 %smax77
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader5.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %19 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv.prol
  %20 = load double, double* %19, align 8
  %21 = fmul double %20, %4
  store double %21, double* %19, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader5.us
  %indvars.iv.unr = phi i64 [ 0, %.preheader5.us ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  br i1 %16, label %..preheader4_crit_edge.us, label %.preheader5.us.new.preheader

.preheader5.us.new.preheader:                     ; preds = %.prol.loopexit
  %22 = sub i64 %18, %indvars.iv.unr
  %23 = lshr i64 %22, 2
  %24 = add nuw nsw i64 %23, 1
  %min.iters.check124 = icmp ult i64 %24, 2
  br i1 %min.iters.check124, label %.preheader5.us.new.preheader144, label %min.iters.checked125

.preheader5.us.new.preheader144:                  ; preds = %middle.block122, %min.iters.checked125, %.preheader5.us.new.preheader
  %indvars.iv.ph = phi i64 [ %ind.end, %middle.block122 ], [ %indvars.iv.unr, %min.iters.checked125 ], [ %indvars.iv.unr, %.preheader5.us.new.preheader ]
  br label %.preheader5.us.new

min.iters.checked125:                             ; preds = %.preheader5.us.new.preheader
  %n.mod.vf126 = and i64 %24, 1
  %n.vec127 = sub nsw i64 %24, %n.mod.vf126
  %cmp.zero128 = icmp eq i64 %n.vec127, 0
  %25 = add i64 %indvars.iv.unr, 4
  %26 = shl nuw i64 %23, 2
  %27 = add i64 %25, %26
  %28 = shl nuw nsw i64 %n.mod.vf126, 2
  %ind.end = sub i64 %27, %28
  br i1 %cmp.zero128, label %.preheader5.us.new.preheader144, label %vector.ph129

vector.ph129:                                     ; preds = %min.iters.checked125
  br label %vector.body121

vector.body121:                                   ; preds = %vector.body121, %vector.ph129
  %index130 = phi i64 [ 0, %vector.ph129 ], [ %index.next131, %vector.body121 ]
  %29 = shl i64 %index130, 2
  %30 = add i64 %indvars.iv.unr, %29
  %31 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv39, i64 %30
  %32 = bitcast double* %31 to <8 x double>*
  %wide.vec = load <8 x double>, <8 x double>* %32, align 8
  %strided.vec = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec137 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec138 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec139 = shufflevector <8 x double> %wide.vec, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %33 = fmul <2 x double> %broadcast.splat141, %strided.vec
  %34 = fmul <2 x double> %broadcast.splat141, %strided.vec137
  %35 = fmul <2 x double> %broadcast.splat141, %strided.vec138
  %36 = add nsw i64 %30, 3
  %37 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv39, i64 %36
  %38 = fmul <2 x double> %broadcast.splat141, %strided.vec139
  %39 = getelementptr double, double* %37, i64 -3
  %40 = bitcast double* %39 to <8 x double>*
  %41 = shufflevector <2 x double> %33, <2 x double> %34, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %42 = shufflevector <2 x double> %35, <2 x double> %38, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec = shufflevector <4 x double> %41, <4 x double> %42, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec, <8 x double>* %40, align 8
  %index.next131 = add i64 %index130, 2
  %43 = icmp eq i64 %index.next131, %n.vec127
  br i1 %43, label %middle.block122, label %vector.body121, !llvm.loop !3

middle.block122:                                  ; preds = %vector.body121
  %cmp.n133 = icmp eq i64 %n.mod.vf126, 0
  br i1 %cmp.n133, label %..preheader4_crit_edge.us, label %.preheader5.us.new.preheader144

._crit_edge9.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %._crit_edge9.us.loopexit, %..preheader4_crit_edge.us
  %indvars.iv.next40 = add nsw i64 %indvars.iv39, 1
  %44 = icmp slt i64 %indvars.iv.next40, %15
  br i1 %44, label %._crit_edge9.us..preheader5.us_crit_edge, label %._crit_edge14.loopexit

._crit_edge9.us..preheader5.us_crit_edge:         ; preds = %._crit_edge9.us
  %indvar.next85 = add i64 %indvar84, 1
  br label %.preheader5.us

.preheader5.us.new:                               ; preds = %.preheader5.us.new.preheader144, %.preheader5.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader5.us.new ], [ %indvars.iv.ph, %.preheader5.us.new.preheader144 ]
  %45 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv
  %46 = load double, double* %45, align 8
  %47 = fmul double %46, %4
  store double %47, double* %45, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %48 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv.next
  %49 = load double, double* %48, align 8
  %50 = fmul double %49, %4
  store double %50, double* %48, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %51 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv.next.1
  %52 = load double, double* %51, align 8
  %53 = fmul double %52, %4
  store double %53, double* %51, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %54 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv.next.2
  %55 = load double, double* %54, align 8
  %56 = fmul double %55, %4
  store double %56, double* %54, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %..preheader4_crit_edge.us.loopexit, label %.preheader5.us.new, !llvm.loop !6

..preheader4_crit_edge.us.loopexit:               ; preds = %.preheader5.us.new
  br label %..preheader4_crit_edge.us

..preheader4_crit_edge.us:                        ; preds = %..preheader4_crit_edge.us.loopexit, %middle.block122, %.prol.loopexit
  br i1 %11, label %.preheader.us.us.preheader, label %._crit_edge9.us

.preheader.us.us.preheader:                       ; preds = %..preheader4_crit_edge.us
  br label %.preheader.us.us

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %scevgep91 = getelementptr [1100 x double], [1100 x double]* %7, i64 %indvars.iv36, i64 0
  %scevgep93 = getelementptr [1100 x double], [1100 x double]* %7, i64 %indvars.iv36, i64 %smax77
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv39, i64 %indvars.iv36
  br i1 %min.iters.check78, label %scalar.ph76.preheader, label %min.iters.checked79

scalar.ph76.preheader:                            ; preds = %middle.block75, %vector.memcheck105, %min.iters.checked79, %.preheader.us.us
  %indvars.iv34.ph = phi i64 [ %n.vec81, %middle.block75 ], [ 0, %vector.memcheck105 ], [ 0, %min.iters.checked79 ], [ 0, %.preheader.us.us ]
  br label %scalar.ph76

min.iters.checked79:                              ; preds = %.preheader.us.us
  br i1 %cmp.zero82, label %scalar.ph76.preheader, label %vector.memcheck105

vector.memcheck105:                               ; preds = %min.iters.checked79
  %bound097 = icmp ult double* %scevgep86, %57
  %bound198 = icmp ult double* %57, %scevgep89
  %found.conflict99 = and i1 %bound097, %bound198
  %bound0100 = icmp ult double* %scevgep86, %scevgep93
  %bound1101 = icmp ult double* %scevgep91, %scevgep89
  %found.conflict102 = and i1 %bound0100, %bound1101
  %conflict.rdx103 = or i1 %found.conflict99, %found.conflict102
  br i1 %conflict.rdx103, label %scalar.ph76.preheader, label %vector.ph106

vector.ph106:                                     ; preds = %vector.memcheck105
  br label %vector.body74

vector.body74:                                    ; preds = %vector.body74, %vector.ph106
  %index107 = phi i64 [ 0, %vector.ph106 ], [ %index.next108, %vector.body74 ]
  %58 = load double, double* %57, align 8, !alias.scope !8
  %59 = insertelement <2 x double> undef, double %58, i32 0
  %60 = fmul <2 x double> %broadcast.splatinsert115, %59
  %61 = shufflevector <2 x double> %60, <2 x double> undef, <2 x i32> zeroinitializer
  %62 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv36, i64 %index107
  %63 = bitcast double* %62 to <2 x double>*
  %wide.load117 = load <2 x double>, <2 x double>* %63, align 8, !alias.scope !11
  %64 = getelementptr double, double* %62, i64 2
  %65 = bitcast double* %64 to <2 x double>*
  %wide.load118 = load <2 x double>, <2 x double>* %65, align 8, !alias.scope !11
  %66 = fmul <2 x double> %61, %wide.load117
  %67 = fmul <2 x double> %61, %wide.load118
  %68 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv39, i64 %index107
  %69 = bitcast double* %68 to <2 x double>*
  %wide.load119 = load <2 x double>, <2 x double>* %69, align 8, !alias.scope !13, !noalias !15
  %70 = getelementptr double, double* %68, i64 2
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load120 = load <2 x double>, <2 x double>* %71, align 8, !alias.scope !13, !noalias !15
  %72 = fadd <2 x double> %66, %wide.load119
  %73 = fadd <2 x double> %67, %wide.load120
  store <2 x double> %72, <2 x double>* %69, align 8, !alias.scope !13, !noalias !15
  store <2 x double> %73, <2 x double>* %71, align 8, !alias.scope !13, !noalias !15
  %index.next108 = add i64 %index107, 4
  %74 = icmp eq i64 %index.next108, %n.vec81
  br i1 %74, label %middle.block75, label %vector.body74, !llvm.loop !16

middle.block75:                                   ; preds = %vector.body74
  br i1 %cmp.n110, label %._crit_edge.us.us, label %scalar.ph76.preheader

._crit_edge.us.us.loopexit:                       ; preds = %scalar.ph76
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %middle.block75
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond = icmp eq i64 %indvars.iv.next37, %wide.trip.count38
  br i1 %exitcond, label %._crit_edge9.us.loopexit, label %.preheader.us.us

scalar.ph76:                                      ; preds = %scalar.ph76.preheader, %scalar.ph76
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %scalar.ph76 ], [ %indvars.iv34.ph, %scalar.ph76.preheader ]
  %75 = load double, double* %57, align 8
  %76 = fmul double %75, %3
  %77 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv36, i64 %indvars.iv34
  %78 = load double, double* %77, align 8
  %79 = fmul double %76, %78
  %80 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv39, i64 %indvars.iv34
  %81 = load double, double* %80, align 8
  %82 = fadd double %79, %81
  store double %82, double* %80, align 8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %83 = icmp slt i64 %indvars.iv.next35, %14
  br i1 %83, label %scalar.ph76, label %._crit_edge.us.us.loopexit, !llvm.loop !17

.preheader5:                                      ; preds = %._crit_edge9..preheader5_crit_edge, %.preheader5.preheader
  %indvars.iv48 = phi i64 [ 0, %.preheader5.preheader ], [ %indvars.iv.next49, %._crit_edge9..preheader5_crit_edge ]
  br i1 false, label %.preheader5..preheader.us_crit_edge, label %._crit_edge9

.preheader5..preheader.us_crit_edge:              ; preds = %.preheader5
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader5..preheader.us_crit_edge
  br i1 undef, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 undef, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  br i1 undef, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.ph
  br i1 undef, label %._crit_edge.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %vector.body, %vector.memcheck, %min.iters.checked, %.preheader.us
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %scalar.ph, %vector.body
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge.us, %.preheader5
  %indvars.iv.next49 = add nsw i64 %indvars.iv48, 1
  %84 = icmp slt i64 %indvars.iv.next49, %12
  br i1 %84, label %._crit_edge9..preheader5_crit_edge, label %._crit_edge14.loopexit145

._crit_edge9..preheader5_crit_edge:               ; preds = %._crit_edge9
  br label %.preheader5

._crit_edge14.loopexit:                           ; preds = %._crit_edge9.us
  br label %._crit_edge14

._crit_edge14.loopexit145:                        ; preds = %._crit_edge9
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit145, %._crit_edge14.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %._crit_edge14
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1100 x double]*) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader.lr.ph, label %._crit_edge

.preheader.lr.ph:                                 ; preds = %3
  %9 = icmp sgt i32 %1, 0
  br i1 %9, label %.preheader.us.preheader, label %._crit_edge4.loopexit8

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge2.us, %.preheader.us.preheader
  %indvars.iv10 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next11, %._crit_edge2.us ]
  %11 = mul nsw i64 %10, %indvars.iv10
  br label %._crit_edge.us._crit_edge

._crit_edge.us._crit_edge:                        ; preds = %._crit_edge.us, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %12 = add nsw i64 %11, %indvars.iv
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge.us

; <label>:16:                                     ; preds = %._crit_edge.us._crit_edge
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us._crit_edge, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge2.us, label %._crit_edge.us._crit_edge

._crit_edge2.us:                                  ; preds = %._crit_edge.us
  %indvars.iv.next11 = add nsw i64 %indvars.iv10, 1
  %22 = icmp slt i64 %indvars.iv.next11, %10
  br i1 %22, label %.preheader.us, label %._crit_edge4.loopexit

._crit_edge4.loopexit:                            ; preds = %._crit_edge2.us
  br label %._crit_edge4

._crit_edge4.loopexit8:                           ; preds = %.preheader.lr.ph
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit8, %._crit_edge4.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %3, %._crit_edge4
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %25) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
!13 = !{!14}
!14 = distinct !{!14, !10}
!15 = !{!9, !12}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}
