; ModuleID = 'A.ll'
source_filename = "gemm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
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
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(i32 1000, i32 1100, [1100 x double]* %8)
  br label %18

; <label>:18:                                     ; preds = %14, %17, %2
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

.preheader5.lr.ph:                                ; preds = %.preheader7.lr.ph, %.preheader6
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

.preheader5.us:                                   ; preds = %.preheader5.us.preheader, %._crit_edge14.us
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

.preheader5.us.new:                               ; preds = %.preheader5.us.new.preheader, %.preheader5.us.new
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

.preheader4:                                      ; preds = %.preheader4.loopexit, %8, %.preheader6
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

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
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
  %12 = icmp sgt i32 %1, 0
  br i1 %10, label %.preheader4.us.preheader, label %.preheader4.preheader

.preheader4.preheader:                            ; preds = %.preheader4.lr.ph
  %xtraiter44 = and i32 %1, 1
  %lcmp.mod45 = icmp eq i32 %xtraiter44, 0
  %wide.trip.count48 = zext i32 %2 to i64
  %wide.trip.count40.1 = zext i32 %1 to i64
  %wide.trip.count52 = zext i32 %0 to i64
  %13 = add nsw i64 %wide.trip.count40.1, -2
  %14 = add nsw i64 %wide.trip.count40.1, -2
  %brmerge58.demorgan = and i1 %11, %12
  %broadcast.splatinsert75 = insertelement <2 x double> undef, double %3, i32 0
  br label %.preheader4

.preheader4.us.preheader:                         ; preds = %.preheader4.lr.ph
  %15 = add i32 %1, -1
  %xtraiter = and i32 %1, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %16 = icmp ult i32 %15, 3
  %xtraiter27 = and i32 %1, 1
  %lcmp.mod28 = icmp eq i32 %xtraiter27, 0
  %17 = icmp eq i32 %15, 0
  %wide.trip.count32 = zext i32 %2 to i64
  %wide.trip.count24.1 = zext i32 %1 to i64
  %wide.trip.count35 = zext i32 %0 to i64
  %wide.trip.count.3 = zext i32 %1 to i64
  %18 = add nsw i64 %wide.trip.count24.1, -2
  %19 = add nsw i64 %wide.trip.count24.1, -2
  %20 = add nsw i64 %wide.trip.count24.1, -4
  %brmerge.demorgan = and i1 %11, %12
  %broadcast.splatinsert123 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splatinsert155 = insertelement <2 x double> undef, double %4, i32 0
  %broadcast.splat156 = shufflevector <2 x double> %broadcast.splatinsert155, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge9.us, %.preheader4.us.preheader
  %indvars.iv33 = phi i64 [ 0, %.preheader4.us.preheader ], [ %indvars.iv.next34, %._crit_edge9.us ]
  %scevgep93 = getelementptr [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 2
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader.preheader

.prol.preheader.preheader:                        ; preds = %.preheader4.us
  br label %.prol.preheader

.prol.preheader:                                  ; preds = %.prol.preheader.preheader, %.prol.preheader
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ 0, %.prol.preheader.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.prol.preheader ], [ %xtraiter, %.prol.preheader.preheader ]
  %21 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv.prol
  %22 = load double, double* %21, align 8
  %23 = fmul double %22, %4
  store double %23, double* %21, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !1

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader4.us
  %indvars.iv.unr = phi i64 [ 0, %.preheader4.us ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  br i1 %16, label %..preheader3_crit_edge.us, label %.preheader4.us.new.preheader

.preheader4.us.new.preheader:                     ; preds = %.prol.loopexit
  %24 = sub i64 %20, %indvars.iv.unr
  %25 = lshr i64 %24, 2
  %26 = add nuw nsw i64 %25, 1
  %min.iters.check135 = icmp ult i64 %26, 2
  br i1 %min.iters.check135, label %.preheader4.us.new.preheader159, label %min.iters.checked136

.preheader4.us.new.preheader159:                  ; preds = %middle.block133, %min.iters.checked136, %.preheader4.us.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked136 ], [ %indvars.iv.unr, %.preheader4.us.new.preheader ], [ %ind.end144, %middle.block133 ]
  br label %.preheader4.us.new

min.iters.checked136:                             ; preds = %.preheader4.us.new.preheader
  %n.mod.vf137 = and i64 %26, 1
  %n.vec138 = sub nsw i64 %26, %n.mod.vf137
  %cmp.zero139 = icmp eq i64 %n.vec138, 0
  %27 = add i64 %indvars.iv.unr, 4
  %28 = shl nuw i64 %25, 2
  %29 = add i64 %27, %28
  %30 = shl nuw nsw i64 %n.mod.vf137, 2
  %ind.end144 = sub i64 %29, %30
  br i1 %cmp.zero139, label %.preheader4.us.new.preheader159, label %vector.ph140

vector.ph140:                                     ; preds = %min.iters.checked136
  br label %vector.body132

vector.body132:                                   ; preds = %vector.body132, %vector.ph140
  %index141 = phi i64 [ 0, %vector.ph140 ], [ %index.next142, %vector.body132 ]
  %31 = shl i64 %index141, 2
  %32 = add i64 %indvars.iv.unr, %31
  %33 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %32
  %34 = bitcast double* %33 to <8 x double>*
  %wide.vec150 = load <8 x double>, <8 x double>* %34, align 8
  %strided.vec151 = shufflevector <8 x double> %wide.vec150, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec152 = shufflevector <8 x double> %wide.vec150, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec153 = shufflevector <8 x double> %wide.vec150, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec154 = shufflevector <8 x double> %wide.vec150, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %35 = fmul <2 x double> %strided.vec151, %broadcast.splat156
  %36 = fmul <2 x double> %strided.vec152, %broadcast.splat156
  %37 = fmul <2 x double> %strided.vec153, %broadcast.splat156
  %38 = add nsw i64 %32, 3
  %39 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %38
  %40 = fmul <2 x double> %strided.vec154, %broadcast.splat156
  %41 = getelementptr double, double* %39, i64 -3
  %42 = bitcast double* %41 to <8 x double>*
  %43 = shufflevector <2 x double> %35, <2 x double> %36, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %44 = shufflevector <2 x double> %37, <2 x double> %40, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec157 = shufflevector <4 x double> %43, <4 x double> %44, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec157, <8 x double>* %42, align 8
  %index.next142 = add i64 %index141, 2
  %45 = icmp eq i64 %index.next142, %n.vec138
  br i1 %45, label %middle.block133, label %vector.body132, !llvm.loop !3

middle.block133:                                  ; preds = %vector.body132
  %cmp.n145 = icmp eq i64 %n.mod.vf137, 0
  br i1 %cmp.n145, label %..preheader3_crit_edge.us, label %.preheader4.us.new.preheader159

._crit_edge9.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %._crit_edge9.us.loopexit, %..preheader3_crit_edge.us
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next34, %wide.trip.count35
  br i1 %exitcond36, label %._crit_edge11.loopexit, label %.preheader4.us

.preheader4.us.new:                               ; preds = %.preheader4.us.new.preheader159, %.preheader4.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %.preheader4.us.new ], [ %indvars.iv.ph, %.preheader4.us.new.preheader159 ]
  %46 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv
  %47 = load double, double* %46, align 8
  %48 = fmul double %47, %4
  store double %48, double* %46, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %49 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv.next
  %50 = load double, double* %49, align 8
  %51 = fmul double %50, %4
  store double %51, double* %49, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %52 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv.next.1
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, %4
  store double %54, double* %52, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %55 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv.next.2
  %56 = load double, double* %55, align 8
  %57 = fmul double %56, %4
  store double %57, double* %55, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count.3
  br i1 %exitcond.3, label %..preheader3_crit_edge.us.loopexit, label %.preheader4.us.new, !llvm.loop !6

..preheader3_crit_edge.us.loopexit:               ; preds = %.preheader4.us.new
  br label %..preheader3_crit_edge.us

..preheader3_crit_edge.us:                        ; preds = %..preheader3_crit_edge.us.loopexit, %middle.block133, %.prol.loopexit
  br i1 %brmerge.demorgan, label %.preheader.us.us.preheader, label %._crit_edge9.us

.preheader.us.us.preheader:                       ; preds = %..preheader3_crit_edge.us
  %58 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 0
  br label %.preheader.us.us

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %scevgep99 = getelementptr [1100 x double], [1100 x double]* %7, i64 %indvars.iv30, i64 2
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv33, i64 %indvars.iv30
  br i1 %lcmp.mod28, label %.prol.loopexit26, label %.prol.preheader25

.prol.preheader25:                                ; preds = %.preheader.us.us
  %60 = load double, double* %59, align 8
  %61 = fmul double %60, %3
  %62 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv30, i64 0
  %63 = load double, double* %62, align 8
  %64 = fmul double %61, %63
  %65 = load double, double* %58, align 8
  %66 = fadd double %65, %64
  store double %66, double* %58, align 8
  br label %.prol.loopexit26

.prol.loopexit26:                                 ; preds = %.prol.preheader25, %.preheader.us.us
  %indvars.iv22.unr.ph = phi i64 [ 1, %.prol.preheader25 ], [ 0, %.preheader.us.us ]
  br i1 %17, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit26
  %67 = sub nsw i64 %18, %indvars.iv22.unr.ph
  %68 = lshr i64 %67, 1
  %69 = add nuw i64 %68, 1
  %min.iters.check84 = icmp ult i64 %69, 2
  br i1 %min.iters.check84, label %.preheader.us.us.new.preheader158, label %min.iters.checked85

.preheader.us.us.new.preheader158:                ; preds = %middle.block82, %vector.memcheck112, %min.iters.checked85, %.preheader.us.us.new.preheader
  %indvars.iv22.ph = phi i64 [ %indvars.iv22.unr.ph, %vector.memcheck112 ], [ %indvars.iv22.unr.ph, %min.iters.checked85 ], [ %indvars.iv22.unr.ph, %.preheader.us.us.new.preheader ], [ %ind.end117, %middle.block82 ]
  br label %.preheader.us.us.new

min.iters.checked85:                              ; preds = %.preheader.us.us.new.preheader
  %n.mod.vf86 = and i64 %69, 1
  %n.vec87 = sub i64 %69, %n.mod.vf86
  %cmp.zero88 = icmp eq i64 %n.vec87, 0
  br i1 %cmp.zero88, label %.preheader.us.us.new.preheader158, label %vector.memcheck112

vector.memcheck112:                               ; preds = %min.iters.checked85
  %scevgep91 = getelementptr [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv22.unr.ph
  %70 = sub nsw i64 %19, %indvars.iv22.unr.ph
  %71 = and i64 %70, -2
  %72 = or i64 %indvars.iv22.unr.ph, %71
  %scevgep94 = getelementptr double, double* %scevgep93, i64 %72
  %scevgep97 = getelementptr [1100 x double], [1100 x double]* %7, i64 %indvars.iv30, i64 %indvars.iv22.unr.ph
  %scevgep100 = getelementptr double, double* %scevgep99, i64 %72
  %bound0104 = icmp ult double* %scevgep91, %59
  %bound1105 = icmp ult double* %59, %scevgep94
  %found.conflict106 = and i1 %bound0104, %bound1105
  %bound0107 = icmp ult double* %scevgep91, %scevgep100
  %bound1108 = icmp ult double* %scevgep97, %scevgep94
  %found.conflict109 = and i1 %bound0107, %bound1108
  %conflict.rdx110 = or i1 %found.conflict106, %found.conflict109
  %73 = or i64 %indvars.iv22.unr.ph, 2
  %74 = shl nuw i64 %68, 1
  %75 = add i64 %73, %74
  %76 = shl nuw nsw i64 %n.mod.vf86, 1
  %ind.end117 = sub i64 %75, %76
  br i1 %conflict.rdx110, label %.preheader.us.us.new.preheader158, label %vector.ph113

vector.ph113:                                     ; preds = %vector.memcheck112
  %77 = load double, double* %59, align 8, !alias.scope !8
  %78 = insertelement <2 x double> undef, double %77, i32 0
  %79 = fmul <2 x double> %78, %broadcast.splatinsert123
  %80 = shufflevector <2 x double> %79, <2 x double> undef, <2 x i32> zeroinitializer
  %81 = load double, double* %59, align 8, !alias.scope !8
  %82 = insertelement <2 x double> undef, double %81, i32 0
  %83 = fmul <2 x double> %82, %broadcast.splatinsert123
  %84 = shufflevector <2 x double> %83, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body81

vector.body81:                                    ; preds = %vector.body81, %vector.ph113
  %index114 = phi i64 [ 0, %vector.ph113 ], [ %index.next115, %vector.body81 ]
  %85 = shl i64 %index114, 1
  %offset.idx119 = or i64 %indvars.iv22.unr.ph, %85
  %86 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv30, i64 %offset.idx119
  %87 = bitcast double* %86 to <4 x double>*
  %wide.vec125 = load <4 x double>, <4 x double>* %87, align 8, !alias.scope !11
  %strided.vec126 = shufflevector <4 x double> %wide.vec125, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec127 = shufflevector <4 x double> %wide.vec125, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %88 = fmul <2 x double> %80, %strided.vec126
  %89 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %offset.idx119
  %90 = bitcast double* %89 to <4 x double>*
  %wide.vec128 = load <4 x double>, <4 x double>* %90, align 8, !alias.scope !13, !noalias !15
  %strided.vec129 = shufflevector <4 x double> %wide.vec128, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec130 = shufflevector <4 x double> %wide.vec128, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %91 = fadd <2 x double> %strided.vec129, %88
  %92 = add nuw nsw i64 %offset.idx119, 1
  %93 = fmul <2 x double> %84, %strided.vec127
  %94 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %92
  %95 = fadd <2 x double> %strided.vec130, %93
  %96 = getelementptr double, double* %94, i64 -1
  %97 = bitcast double* %96 to <4 x double>*
  %interleaved.vec131 = shufflevector <2 x double> %91, <2 x double> %95, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec131, <4 x double>* %97, align 8, !alias.scope !13, !noalias !15
  %index.next115 = add i64 %index114, 2
  %98 = icmp eq i64 %index.next115, %n.vec87
  br i1 %98, label %middle.block82, label %vector.body81, !llvm.loop !16

middle.block82:                                   ; preds = %vector.body81
  %cmp.n118 = icmp eq i64 %n.mod.vf86, 0
  br i1 %cmp.n118, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader158

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %middle.block82, %.prol.loopexit26
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond = icmp eq i64 %indvars.iv.next31, %wide.trip.count32
  br i1 %exitcond, label %._crit_edge9.us.loopexit, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new.preheader158, %.preheader.us.us.new
  %indvars.iv22 = phi i64 [ %indvars.iv.next23.1, %.preheader.us.us.new ], [ %indvars.iv22.ph, %.preheader.us.us.new.preheader158 ]
  %99 = load double, double* %59, align 8
  %100 = fmul double %99, %3
  %101 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv30, i64 %indvars.iv22
  %102 = load double, double* %101, align 8
  %103 = fmul double %100, %102
  %104 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv22
  %105 = load double, double* %104, align 8
  %106 = fadd double %105, %103
  store double %106, double* %104, align 8
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %107 = load double, double* %59, align 8
  %108 = fmul double %107, %3
  %109 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv30, i64 %indvars.iv.next23
  %110 = load double, double* %109, align 8
  %111 = fmul double %108, %110
  %112 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv.next23
  %113 = load double, double* %112, align 8
  %114 = fadd double %113, %111
  store double %114, double* %112, align 8
  %indvars.iv.next23.1 = add nsw i64 %indvars.iv22, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next23.1, %wide.trip.count24.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new, !llvm.loop !17

.preheader4:                                      ; preds = %.preheader4.preheader, %._crit_edge9
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %._crit_edge9 ], [ 0, %.preheader4.preheader ]
  %scevgep62 = getelementptr [1100 x double], [1100 x double]* %5, i64 %indvars.iv50, i64 2
  br i1 %brmerge58.demorgan, label %.preheader.us.preheader, label %._crit_edge9

.preheader.us.preheader:                          ; preds = %.preheader4
  %115 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv50, i64 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep68 = getelementptr [1100 x double], [1100 x double]* %7, i64 %indvars.iv46, i64 2
  %116 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv50, i64 %indvars.iv46
  br i1 %lcmp.mod45, label %.preheader.us.new.preheader, label %.prol.preheader42

.prol.preheader42:                                ; preds = %.preheader.us
  %117 = load double, double* %116, align 8
  %118 = fmul double %117, %3
  %119 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv46, i64 0
  %120 = load double, double* %119, align 8
  %121 = fmul double %118, %120
  %122 = load double, double* %115, align 8
  %123 = fadd double %122, %121
  store double %123, double* %115, align 8
  br label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.preheader.us, %.prol.preheader42
  %indvars.iv38.unr.ph = phi i64 [ 1, %.prol.preheader42 ], [ 0, %.preheader.us ]
  %124 = sub nsw i64 %13, %indvars.iv38.unr.ph
  %125 = lshr i64 %124, 1
  %126 = add nuw i64 %125, 1
  %min.iters.check = icmp ult i64 %126, 2
  br i1 %min.iters.check, label %.preheader.us.new.preheader160, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us.new.preheader
  %n.mod.vf = and i64 %126, 1
  %n.vec = sub i64 %126, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.preheader.us.new.preheader160, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep60 = getelementptr [1100 x double], [1100 x double]* %5, i64 %indvars.iv50, i64 %indvars.iv38.unr.ph
  %127 = sub nsw i64 %14, %indvars.iv38.unr.ph
  %128 = and i64 %127, -2
  %129 = or i64 %indvars.iv38.unr.ph, %128
  %scevgep63 = getelementptr double, double* %scevgep62, i64 %129
  %scevgep66 = getelementptr [1100 x double], [1100 x double]* %7, i64 %indvars.iv46, i64 %indvars.iv38.unr.ph
  %scevgep69 = getelementptr double, double* %scevgep68, i64 %129
  %bound0 = icmp ult double* %scevgep60, %116
  %bound1 = icmp ult double* %116, %scevgep63
  %found.conflict = and i1 %bound0, %bound1
  %bound072 = icmp ult double* %scevgep60, %scevgep69
  %bound173 = icmp ult double* %scevgep66, %scevgep63
  %found.conflict74 = and i1 %bound072, %bound173
  %conflict.rdx = or i1 %found.conflict, %found.conflict74
  %130 = or i64 %indvars.iv38.unr.ph, 2
  %131 = shl nuw i64 %125, 1
  %132 = add i64 %130, %131
  %133 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %132, %133
  br i1 %conflict.rdx, label %.preheader.us.new.preheader160, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  %134 = load double, double* %116, align 8, !alias.scope !18
  %135 = insertelement <2 x double> undef, double %134, i32 0
  %136 = fmul <2 x double> %135, %broadcast.splatinsert75
  %137 = shufflevector <2 x double> %136, <2 x double> undef, <2 x i32> zeroinitializer
  %138 = load double, double* %116, align 8, !alias.scope !18
  %139 = insertelement <2 x double> undef, double %138, i32 0
  %140 = fmul <2 x double> %139, %broadcast.splatinsert75
  %141 = shufflevector <2 x double> %140, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %142 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv38.unr.ph, %142
  %143 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv46, i64 %offset.idx
  %144 = bitcast double* %143 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %144, align 8, !alias.scope !21
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec77 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %145 = fmul <2 x double> %137, %strided.vec
  %146 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv50, i64 %offset.idx
  %147 = bitcast double* %146 to <4 x double>*
  %wide.vec78 = load <4 x double>, <4 x double>* %147, align 8, !alias.scope !23, !noalias !25
  %strided.vec79 = shufflevector <4 x double> %wide.vec78, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec80 = shufflevector <4 x double> %wide.vec78, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %148 = fadd <2 x double> %strided.vec79, %145
  %149 = add nuw nsw i64 %offset.idx, 1
  %150 = fmul <2 x double> %141, %strided.vec77
  %151 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv50, i64 %149
  %152 = fadd <2 x double> %strided.vec80, %150
  %153 = getelementptr double, double* %151, i64 -1
  %154 = bitcast double* %153 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %148, <2 x double> %152, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %154, align 8, !alias.scope !23, !noalias !25
  %index.next = add i64 %index, 2
  %155 = icmp eq i64 %index.next, %n.vec
  br i1 %155, label %middle.block, label %vector.body, !llvm.loop !26

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge.us, label %.preheader.us.new.preheader160

.preheader.us.new.preheader160:                   ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader.us.new.preheader
  %indvars.iv38.ph = phi i64 [ %indvars.iv38.unr.ph, %vector.memcheck ], [ %indvars.iv38.unr.ph, %min.iters.checked ], [ %indvars.iv38.unr.ph, %.preheader.us.new.preheader ], [ %ind.end, %middle.block ]
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader160, %.preheader.us.new
  %indvars.iv38 = phi i64 [ %indvars.iv.next39.1, %.preheader.us.new ], [ %indvars.iv38.ph, %.preheader.us.new.preheader160 ]
  %156 = load double, double* %116, align 8
  %157 = fmul double %156, %3
  %158 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv46, i64 %indvars.iv38
  %159 = load double, double* %158, align 8
  %160 = fmul double %157, %159
  %161 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv50, i64 %indvars.iv38
  %162 = load double, double* %161, align 8
  %163 = fadd double %162, %160
  store double %163, double* %161, align 8
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %164 = load double, double* %116, align 8
  %165 = fmul double %164, %3
  %166 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv46, i64 %indvars.iv.next39
  %167 = load double, double* %166, align 8
  %168 = fmul double %165, %167
  %169 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv50, i64 %indvars.iv.next39
  %170 = load double, double* %169, align 8
  %171 = fadd double %170, %168
  store double %171, double* %169, align 8
  %indvars.iv.next39.1 = add nsw i64 %indvars.iv38, 2
  %exitcond41.1 = icmp eq i64 %indvars.iv.next39.1, %wide.trip.count40.1
  br i1 %exitcond41.1, label %._crit_edge.us.loopexit, label %.preheader.us.new, !llvm.loop !27

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next47, %wide.trip.count48
  br i1 %exitcond49, label %._crit_edge9.loopexit, label %.preheader.us

._crit_edge9.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %.preheader4
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next51, %wide.trip.count52
  br i1 %exitcond53, label %._crit_edge11.loopexit161, label %.preheader4

._crit_edge11.loopexit:                           ; preds = %._crit_edge9.us
  br label %._crit_edge11

._crit_edge11.loopexit161:                        ; preds = %._crit_edge9
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit161, %._crit_edge11.loopexit, %8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1100 x double]* nocapture readonly) unnamed_addr #0 {
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
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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
!11 = !{!12}
!12 = distinct !{!12, !10}
!13 = !{!14}
!14 = distinct !{!14, !10}
!15 = !{!9, !12}
!16 = distinct !{!16, !4, !5}
!17 = distinct !{!17, !4, !5}
!18 = !{!19}
!19 = distinct !{!19, !20}
!20 = distinct !{!20, !"LVerDomain"}
!21 = !{!22}
!22 = distinct !{!22, !20}
!23 = !{!24}
!24 = distinct !{!24, !20}
!25 = !{!19, !22}
!26 = distinct !{!26, !4, !5}
!27 = distinct !{!27, !4, !5}
