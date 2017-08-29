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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1100000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %8 = bitcast i8* %5 to [1100 x double]*
  %9 = bitcast i8* %6 to [1200 x double]*
  %10 = bitcast i8* %7 to [1100 x double]*
  call fastcc void @init_array(i32 1000, i32 1100, i32 1200, double* nonnull %3, double* nonnull %4, [1100 x double]* %8, [1200 x double]* %9, [1100 x double]* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  tail call fastcc void @kernel_gemm(i32 1000, i32 1100, i32 1200, double %11, double %12, [1100 x double]* %8, [1200 x double]* %9, [1100 x double]* %10)
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
  tail call fastcc void @print_array(i32 1000, i32 1100, [1100 x double]* %8)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, double* nocapture, double* nocapture, [1100 x double]* nocapture, [1200 x double]* nocapture, [1100 x double]* nocapture) unnamed_addr #2 {
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

.preheader7.us:                                   ; preds = %.preheader7.us.preheader, %._crit_edge19.us
  %indvars.iv43 = phi i64 [ %indvars.iv.next44, %._crit_edge19.us ], [ 0, %.preheader7.us.preheader ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader7.us
  %indvars.iv39 = phi i64 [ 0, %.preheader7.us ], [ %indvars.iv.next40, %._crit_edge ]
  %12 = mul nuw nsw i64 %indvars.iv39, %indvars.iv43
  %13 = add nuw nsw i64 %12, 1
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, %0
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, %11
  %18 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv43, i64 %indvars.iv39
  store double %17, double* %18, align 8
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, %wide.trip.count41
  br i1 %exitcond42, label %._crit_edge19.us, label %._crit_edge

._crit_edge19.us:                                 ; preds = %._crit_edge
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next44, %wide.trip.count45
  br i1 %exitcond46, label %.preheader6, label %.preheader7.us

.preheader6:                                      ; preds = %._crit_edge19.us
  br i1 true, label %.preheader5.lr.ph, label %.preheader6..preheader4_crit_edge

.preheader6..preheader4_crit_edge:                ; preds = %.preheader6
  br label %.preheader4

.preheader5.lr.ph:                                ; preds = %.preheader7.lr.ph, %.preheader6
  %19 = icmp sgt i32 %2, 0
  %20 = sitofp i32 %2 to double
  br i1 %19, label %.preheader5.us.preheader, label %._crit_edge11

.preheader5.us.preheader:                         ; preds = %.preheader5.lr.ph
  %wide.trip.count32 = zext i32 %2 to i64
  %wide.trip.count36 = zext i32 %0 to i64
  %xtraiter = and i64 %wide.trip.count32, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %21 = icmp eq i32 %2, 1
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %.preheader5.us.preheader, %._crit_edge14.us
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %._crit_edge14.us ], [ 0, %.preheader5.us.preheader ]
  br i1 %lcmp.mod, label %._crit_edge48.prol.loopexit.unr-lcssa, label %._crit_edge48.prol.preheader

._crit_edge48.prol.preheader:                     ; preds = %.preheader5.us
  br label %._crit_edge48.prol

._crit_edge48.prol:                               ; preds = %._crit_edge48.prol.preheader
  %22 = trunc i64 %indvars.iv34 to i32
  %23 = srem i32 %22, %2
  %24 = sitofp i32 %23 to double
  %25 = fdiv double %24, %20
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv34, i64 0
  store double %25, double* %26, align 8
  br label %._crit_edge48.prol.loopexit.unr-lcssa

._crit_edge48.prol.loopexit.unr-lcssa:            ; preds = %.preheader5.us, %._crit_edge48.prol
  %indvars.iv30.unr.ph = phi i64 [ 1, %._crit_edge48.prol ], [ 0, %.preheader5.us ]
  br label %._crit_edge48.prol.loopexit

._crit_edge48.prol.loopexit:                      ; preds = %._crit_edge48.prol.loopexit.unr-lcssa
  br i1 %21, label %._crit_edge14.us, label %.preheader5.us.new

.preheader5.us.new:                               ; preds = %._crit_edge48.prol.loopexit
  br label %._crit_edge48

._crit_edge48:                                    ; preds = %._crit_edge48, %.preheader5.us.new
  %indvars.iv30 = phi i64 [ %indvars.iv30.unr.ph, %.preheader5.us.new ], [ %indvars.iv.next31.1, %._crit_edge48 ]
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %27 = mul nuw nsw i64 %indvars.iv.next31, %indvars.iv34
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, %2
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, %20
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv34, i64 %indvars.iv30
  store double %31, double* %32, align 8
  %indvars.iv.next31.1 = add nsw i64 %indvars.iv30, 2
  %33 = mul nuw nsw i64 %indvars.iv.next31.1, %indvars.iv34
  %34 = trunc i64 %33 to i32
  %35 = srem i32 %34, %2
  %36 = sitofp i32 %35 to double
  %37 = fdiv double %36, %20
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv34, i64 %indvars.iv.next31
  store double %37, double* %38, align 8
  %exitcond33.1 = icmp eq i64 %indvars.iv.next31.1, %wide.trip.count32
  br i1 %exitcond33.1, label %._crit_edge14.us.unr-lcssa, label %._crit_edge48

._crit_edge14.us.unr-lcssa:                       ; preds = %._crit_edge48
  br label %._crit_edge14.us

._crit_edge14.us:                                 ; preds = %._crit_edge48.prol.loopexit, %._crit_edge14.us.unr-lcssa
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next35, %wide.trip.count36
  br i1 %exitcond37, label %.preheader4.loopexit, label %.preheader5.us

.preheader4.loopexit:                             ; preds = %._crit_edge14.us
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader6..preheader4_crit_edge, %.preheader4.loopexit, %8
  %39 = icmp sgt i32 %2, 0
  br i1 %39, label %.preheader.lr.ph, label %._crit_edge11

.preheader.lr.ph:                                 ; preds = %.preheader4
  %40 = icmp sgt i32 %1, 0
  %41 = sitofp i32 %1 to double
  br i1 %40, label %.preheader.us.preheader, label %._crit_edge11

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count27 = zext i32 %2 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %._crit_edge49

._crit_edge49:                                    ; preds = %._crit_edge49, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge49 ]
  %42 = add nuw nsw i64 %indvars.iv, 2
  %43 = mul nuw nsw i64 %42, %indvars.iv25
  %44 = trunc i64 %43 to i32
  %45 = srem i32 %44, %1
  %46 = sitofp i32 %45 to double
  %47 = fdiv double %46, %41
  %48 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv25, i64 %indvars.iv
  store double %47, double* %48, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge49

._crit_edge.us:                                   ; preds = %._crit_edge49
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next26, %wide.trip.count27
  br i1 %exitcond28, label %._crit_edge11.loopexit, label %.preheader.us

._crit_edge11.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %.preheader5.lr.ph, %.preheader.lr.ph, %.preheader4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemm(i32, i32, i32, double, double, [1100 x double]* nocapture, [1200 x double]* nocapture readonly, [1100 x double]* nocapture readonly) unnamed_addr #2 {
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.preheader4.lr.ph, label %._crit_edge11

.preheader4.lr.ph:                                ; preds = %8
  %10 = icmp sgt i32 %1, 0
  %11 = icmp sgt i32 %2, 0
  %wide.trip.count = zext i32 %1 to i64
  br i1 %10, label %.preheader4.us.preheader, label %.preheader4.preheader

.preheader4.preheader:                            ; preds = %.preheader4.lr.ph
  %wide.trip.count46 = zext i32 %0 to i64
  br label %.preheader4

.preheader4.us.preheader:                         ; preds = %.preheader4.lr.ph
  %wide.trip.count29 = zext i32 %2 to i64
  %wide.trip.count33 = zext i32 %0 to i64
  %12 = add nsw i64 %wide.trip.count, -1
  %min.iters.check119 = icmp ult i32 %1, 4
  %13 = and i32 %1, 3
  %n.mod.vf78 = zext i32 %13 to i64
  %n.vec79 = sub nsw i64 %wide.trip.count, %n.mod.vf78
  %cmp.zero80 = icmp eq i64 %n.vec79, 0
  %broadcast.splatinsert110 = insertelement <2 x double> undef, double %3, i32 0
  %cmp.n105 = icmp eq i32 %13, 0
  %14 = and i32 %1, 3
  %n.mod.vf121 = zext i32 %14 to i64
  %n.vec122 = sub nsw i64 %wide.trip.count, %n.mod.vf121
  %cmp.zero123 = icmp eq i64 %n.vec122, 0
  %broadcast.splatinsert135 = insertelement <2 x double> undef, double %4, i32 0
  %broadcast.splat136 = shufflevector <2 x double> %broadcast.splatinsert135, <2 x double> undef, <2 x i32> zeroinitializer
  %cmp.n128 = icmp eq i32 %14, 0
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %.preheader4.us.preheader, %._crit_edge9.us
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %._crit_edge9.us ], [ 0, %.preheader4.us.preheader ]
  %scevgep82 = getelementptr [1100 x double], [1100 x double]* %5, i64 %indvars.iv31, i64 0
  %scevgep84 = getelementptr [1100 x double], [1100 x double]* %5, i64 %indvars.iv31, i64 %wide.trip.count
  br i1 %min.iters.check119, label %._crit_edge.preheader, label %min.iters.checked120

._crit_edge.preheader:                            ; preds = %middle.block117, %min.iters.checked120, %.preheader4.us
  %indvars.iv.ph = phi i64 [ 0, %min.iters.checked120 ], [ 0, %.preheader4.us ], [ %n.vec122, %middle.block117 ]
  br label %._crit_edge

min.iters.checked120:                             ; preds = %.preheader4.us
  br i1 %cmp.zero123, label %._crit_edge.preheader, label %vector.ph124

vector.ph124:                                     ; preds = %min.iters.checked120
  br label %vector.body116

vector.body116:                                   ; preds = %vector.body116, %vector.ph124
  %index125 = phi i64 [ 0, %vector.ph124 ], [ %index.next126, %vector.body116 ]
  %15 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv31, i64 %index125
  %16 = bitcast double* %15 to <2 x double>*
  %wide.load133 = load <2 x double>, <2 x double>* %16, align 8
  %17 = getelementptr double, double* %15, i64 2
  %18 = bitcast double* %17 to <2 x double>*
  %wide.load134 = load <2 x double>, <2 x double>* %18, align 8
  %19 = fmul <2 x double> %wide.load133, %broadcast.splat136
  %20 = fmul <2 x double> %wide.load134, %broadcast.splat136
  store <2 x double> %19, <2 x double>* %16, align 8
  store <2 x double> %20, <2 x double>* %18, align 8
  %index.next126 = add i64 %index125, 4
  %21 = icmp eq i64 %index.next126, %n.vec122
  br i1 %21, label %middle.block117, label %vector.body116, !llvm.loop !1

middle.block117:                                  ; preds = %vector.body116
  br i1 %cmp.n128, label %..preheader3_crit_edge.us, label %._crit_edge.preheader

._crit_edge9.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %._crit_edge9.us.loopexit, %..preheader3_crit_edge.us
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next32, %wide.trip.count33
  br i1 %exitcond34, label %._crit_edge11.loopexit, label %.preheader4.us

._crit_edge:                                      ; preds = %._crit_edge.preheader, %._crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ %indvars.iv.ph, %._crit_edge.preheader ]
  %22 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv31, i64 %indvars.iv
  %23 = load double, double* %22, align 8
  %24 = fmul double %23, %4
  store double %24, double* %22, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %..preheader3_crit_edge.us.loopexit, label %._crit_edge, !llvm.loop !4

..preheader3_crit_edge.us.loopexit:               ; preds = %._crit_edge
  br label %..preheader3_crit_edge.us

..preheader3_crit_edge.us:                        ; preds = %..preheader3_crit_edge.us.loopexit, %middle.block117
  br i1 %11, label %.preheader.us.us.preheader, label %._crit_edge9.us

.preheader.us.us.preheader:                       ; preds = %..preheader3_crit_edge.us
  br label %.preheader.us.us

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %scevgep86 = getelementptr [1100 x double], [1100 x double]* %7, i64 %indvars.iv27, i64 0
  %scevgep88 = getelementptr [1100 x double], [1100 x double]* %7, i64 %indvars.iv27, i64 %wide.trip.count
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv31, i64 %indvars.iv27
  br i1 %min.iters.check119, label %._crit_edge48.preheader, label %min.iters.checked77

._crit_edge48.preheader:                          ; preds = %middle.block74, %vector.memcheck100, %min.iters.checked77, %.preheader.us.us
  %indvars.iv23.ph = phi i64 [ 0, %vector.memcheck100 ], [ 0, %min.iters.checked77 ], [ 0, %.preheader.us.us ], [ %n.vec79, %middle.block74 ]
  %26 = sub nsw i64 %wide.trip.count, %indvars.iv23.ph
  %xtraiter = and i64 %26, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge48.prol.loopexit.unr-lcssa, label %._crit_edge48.prol.preheader

._crit_edge48.prol.preheader:                     ; preds = %._crit_edge48.preheader
  br label %._crit_edge48.prol

._crit_edge48.prol:                               ; preds = %._crit_edge48.prol.preheader
  %27 = load double, double* %25, align 8
  %28 = fmul double %27, %3
  %29 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv27, i64 %indvars.iv23.ph
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv31, i64 %indvars.iv23.ph
  %33 = load double, double* %32, align 8
  %34 = fadd double %33, %31
  store double %34, double* %32, align 8
  %indvars.iv.next24.prol = add nuw nsw i64 %indvars.iv23.ph, 1
  br label %._crit_edge48.prol.loopexit.unr-lcssa

._crit_edge48.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge48.preheader, %._crit_edge48.prol
  %indvars.iv23.unr.ph = phi i64 [ %indvars.iv.next24.prol, %._crit_edge48.prol ], [ %indvars.iv23.ph, %._crit_edge48.preheader ]
  br label %._crit_edge48.prol.loopexit

._crit_edge48.prol.loopexit:                      ; preds = %._crit_edge48.prol.loopexit.unr-lcssa
  %35 = icmp eq i64 %12, %indvars.iv23.ph
  br i1 %35, label %._crit_edge.us.us.loopexit, label %._crit_edge48.preheader.new

._crit_edge48.preheader.new:                      ; preds = %._crit_edge48.prol.loopexit
  br label %._crit_edge48

min.iters.checked77:                              ; preds = %.preheader.us.us
  br i1 %cmp.zero80, label %._crit_edge48.preheader, label %vector.memcheck100

vector.memcheck100:                               ; preds = %min.iters.checked77
  %bound092 = icmp ult double* %scevgep82, %25
  %bound193 = icmp ult double* %25, %scevgep84
  %found.conflict94 = and i1 %bound092, %bound193
  %bound095 = icmp ult double* %scevgep82, %scevgep88
  %bound196 = icmp ult double* %scevgep86, %scevgep84
  %found.conflict97 = and i1 %bound095, %bound196
  %conflict.rdx98 = or i1 %found.conflict94, %found.conflict97
  br i1 %conflict.rdx98, label %._crit_edge48.preheader, label %vector.ph101

vector.ph101:                                     ; preds = %vector.memcheck100
  %.pre = load double, double* %25, align 8, !alias.scope !6
  %36 = insertelement <2 x double> undef, double %.pre, i32 0
  %37 = fmul <2 x double> %36, %broadcast.splatinsert110
  %38 = shufflevector <2 x double> %37, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body73

vector.body73:                                    ; preds = %vector.body73, %vector.ph101
  %index102 = phi i64 [ 0, %vector.ph101 ], [ %index.next103, %vector.body73 ]
  %39 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv27, i64 %index102
  %40 = bitcast double* %39 to <2 x double>*
  %wide.load112 = load <2 x double>, <2 x double>* %40, align 8, !alias.scope !9
  %41 = getelementptr double, double* %39, i64 2
  %42 = bitcast double* %41 to <2 x double>*
  %wide.load113 = load <2 x double>, <2 x double>* %42, align 8, !alias.scope !9
  %43 = fmul <2 x double> %38, %wide.load112
  %44 = fmul <2 x double> %38, %wide.load113
  %45 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv31, i64 %index102
  %46 = bitcast double* %45 to <2 x double>*
  %wide.load114 = load <2 x double>, <2 x double>* %46, align 8, !alias.scope !11, !noalias !13
  %47 = getelementptr double, double* %45, i64 2
  %48 = bitcast double* %47 to <2 x double>*
  %wide.load115 = load <2 x double>, <2 x double>* %48, align 8, !alias.scope !11, !noalias !13
  %49 = fadd <2 x double> %wide.load114, %43
  %50 = fadd <2 x double> %wide.load115, %44
  store <2 x double> %49, <2 x double>* %46, align 8, !alias.scope !11, !noalias !13
  store <2 x double> %50, <2 x double>* %48, align 8, !alias.scope !11, !noalias !13
  %index.next103 = add i64 %index102, 4
  %51 = icmp eq i64 %index.next103, %n.vec79
  br i1 %51, label %middle.block74, label %vector.body73, !llvm.loop !14

middle.block74:                                   ; preds = %vector.body73
  br i1 %cmp.n105, label %._crit_edge.us.us, label %._crit_edge48.preheader

._crit_edge.us.us.loopexit.unr-lcssa:             ; preds = %._crit_edge48
  br label %._crit_edge.us.us.loopexit

._crit_edge.us.us.loopexit:                       ; preds = %._crit_edge48.prol.loopexit, %._crit_edge.us.us.loopexit.unr-lcssa
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %middle.block74
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next28, %wide.trip.count29
  br i1 %exitcond30, label %._crit_edge9.us.loopexit, label %.preheader.us.us

._crit_edge48:                                    ; preds = %._crit_edge48, %._crit_edge48.preheader.new
  %indvars.iv23 = phi i64 [ %indvars.iv23.unr.ph, %._crit_edge48.preheader.new ], [ %indvars.iv.next24.1, %._crit_edge48 ]
  %52 = load double, double* %25, align 8
  %53 = fmul double %52, %3
  %54 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv27, i64 %indvars.iv23
  %55 = load double, double* %54, align 8
  %56 = fmul double %53, %55
  %57 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv31, i64 %indvars.iv23
  %58 = load double, double* %57, align 8
  %59 = fadd double %58, %56
  store double %59, double* %57, align 8
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %60 = load double, double* %25, align 8
  %61 = fmul double %60, %3
  %62 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv27, i64 %indvars.iv.next24
  %63 = load double, double* %62, align 8
  %64 = fmul double %61, %63
  %65 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv31, i64 %indvars.iv.next24
  %66 = load double, double* %65, align 8
  %67 = fadd double %66, %64
  store double %67, double* %65, align 8
  %indvars.iv.next24.1 = add nsw i64 %indvars.iv23, 2
  %exitcond26.1 = icmp eq i64 %indvars.iv.next24.1, %wide.trip.count
  br i1 %exitcond26.1, label %._crit_edge.us.us.loopexit.unr-lcssa, label %._crit_edge48, !llvm.loop !15

.preheader4:                                      ; preds = %.preheader4.preheader, %._crit_edge9
  %indvars.iv44 = phi i64 [ %indvars.iv.next45, %._crit_edge9 ], [ 0, %.preheader4.preheader ]
  br i1 false, label %.preheader.us.preheader, label %._crit_edge9

.preheader.us.preheader:                          ; preds = %.preheader4
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  br i1 undef, label %._crit_edge49.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 undef, label %._crit_edge49.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  br i1 undef, label %._crit_edge49.preheader, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  br i1 true, label %middle.block, label %vector.body, !llvm.loop !16

middle.block:                                     ; preds = %vector.body
  br i1 undef, label %._crit_edge.us, label %._crit_edge49.preheader

._crit_edge49.preheader:                          ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us
  br i1 undef, label %._crit_edge49.prol.preheader, label %._crit_edge49.prol.loopexit.unr-lcssa

._crit_edge49.prol.preheader:                     ; preds = %._crit_edge49.preheader
  br label %._crit_edge49.prol

._crit_edge49.prol:                               ; preds = %._crit_edge49.prol.preheader
  br label %._crit_edge49.prol.loopexit.unr-lcssa

._crit_edge49.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge49.preheader, %._crit_edge49.prol
  br label %._crit_edge49.prol.loopexit

._crit_edge49.prol.loopexit:                      ; preds = %._crit_edge49.prol.loopexit.unr-lcssa
  br i1 undef, label %._crit_edge.us.loopexit, label %._crit_edge49.preheader.new

._crit_edge49.preheader.new:                      ; preds = %._crit_edge49.prol.loopexit
  br label %._crit_edge49

._crit_edge49:                                    ; preds = %._crit_edge49, %._crit_edge49.preheader.new
  br i1 true, label %._crit_edge.us.loopexit.unr-lcssa, label %._crit_edge49, !llvm.loop !17

._crit_edge.us.loopexit.unr-lcssa:                ; preds = %._crit_edge49
  br label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %._crit_edge49.prol.loopexit, %._crit_edge.us.loopexit.unr-lcssa
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block
  br i1 true, label %._crit_edge9.loopexit, label %.preheader.us

._crit_edge9.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %.preheader4
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next45, %wide.trip.count46
  br i1 %exitcond47, label %._crit_edge11.loopexit137, label %.preheader4

._crit_edge11.loopexit:                           ; preds = %._crit_edge9.us
  br label %._crit_edge11

._crit_edge11.loopexit137:                        ; preds = %._crit_edge9
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit137, %._crit_edge11.loopexit, %8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1100 x double]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
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
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %12 = add nsw i64 %indvars.iv, %11
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge

; <label>:16:                                     ; preds = %._crit_edge11
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge11, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv6, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge11

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, %wide.trip.count8
  br i1 %exitcond9, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %3
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
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = distinct !{!4, !5, !2, !3}
!5 = !{!"llvm.loop.unroll.runtime.disable"}
!6 = !{!7}
!7 = distinct !{!7, !8}
!8 = distinct !{!8, !"LVerDomain"}
!9 = !{!10}
!10 = distinct !{!10, !8}
!11 = !{!12}
!12 = distinct !{!12, !8}
!13 = !{!7, !10}
!14 = distinct !{!14, !2, !3}
!15 = distinct !{!15, !2, !3}
!16 = distinct !{!16, !2, !3}
!17 = distinct !{!17, !2, !3}
