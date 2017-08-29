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
  br i1 %9, label %._crit_edge.preheader.lr.ph, label %._crit_edge6.preheader

._crit_edge.preheader.lr.ph:                      ; preds = %8
  %10 = icmp sgt i32 %1, 0
  %11 = sitofp i32 %0 to double
  br i1 %10, label %._crit_edge.preheader.us.preheader, label %._crit_edge5.preheader.lr.ph

._crit_edge.preheader.us.preheader:               ; preds = %._crit_edge.preheader.lr.ph
  %wide.trip.count38 = zext i32 %1 to i64
  %wide.trip.count42 = zext i32 %0 to i64
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge.preheader.us.preheader, %._crit_edge._crit_edge.us
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %._crit_edge._crit_edge.us ], [ 0, %._crit_edge.preheader.us.preheader ]
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us, %._crit_edge.preheader.us
  %indvars.iv36 = phi i64 [ 0, %._crit_edge.preheader.us ], [ %indvars.iv.next37, %._crit_edge.us ]
  %12 = mul nuw nsw i64 %indvars.iv36, %indvars.iv40
  %13 = add nuw nsw i64 %12, 1
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, %0
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, %11
  %18 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv40, i64 %indvars.iv36
  store double %17, double* %18, align 8
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next37, %wide.trip.count38
  br i1 %exitcond39, label %._crit_edge._crit_edge.us, label %._crit_edge.us

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge.us
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next41, %wide.trip.count42
  br i1 %exitcond43, label %._crit_edge4.preheader, label %._crit_edge.preheader.us

._crit_edge4.preheader:                           ; preds = %._crit_edge._crit_edge.us
  br i1 true, label %._crit_edge5.preheader.lr.ph, label %._crit_edge4.preheader.._crit_edge6.preheader_crit_edge

._crit_edge4.preheader.._crit_edge6.preheader_crit_edge: ; preds = %._crit_edge4.preheader
  br label %._crit_edge6.preheader

._crit_edge5.preheader.lr.ph:                     ; preds = %._crit_edge.preheader.lr.ph, %._crit_edge4.preheader
  %19 = icmp sgt i32 %2, 0
  %20 = sitofp i32 %2 to double
  br i1 %19, label %._crit_edge5.preheader.us.preheader, label %._crit_edge6._crit_edge

._crit_edge5.preheader.us.preheader:              ; preds = %._crit_edge5.preheader.lr.ph
  %xtraiter = and i32 %2, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %21 = icmp eq i32 %2, 1
  %wide.trip.count33 = zext i32 %0 to i64
  %wide.trip.count29.1 = zext i32 %2 to i64
  br label %._crit_edge5.preheader.us

._crit_edge5.preheader.us:                        ; preds = %._crit_edge5.preheader.us.preheader, %._crit_edge5._crit_edge.us
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %._crit_edge5._crit_edge.us ], [ 0, %._crit_edge5.preheader.us.preheader ]
  br i1 %lcmp.mod, label %._crit_edge5.us.prol.loopexit, label %._crit_edge5.us.prol

._crit_edge5.us.prol:                             ; preds = %._crit_edge5.preheader.us
  %22 = trunc i64 %indvars.iv31 to i32
  %23 = srem i32 %22, %2
  %24 = sitofp i32 %23 to double
  %25 = fdiv double %24, %20
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv31, i64 0
  store double %25, double* %26, align 8
  br label %._crit_edge5.us.prol.loopexit

._crit_edge5.us.prol.loopexit:                    ; preds = %._crit_edge5.us.prol, %._crit_edge5.preheader.us
  %indvars.iv27.unr.ph = phi i64 [ 1, %._crit_edge5.us.prol ], [ 0, %._crit_edge5.preheader.us ]
  br i1 %21, label %._crit_edge5._crit_edge.us, label %._crit_edge5.us.preheader

._crit_edge5.us.preheader:                        ; preds = %._crit_edge5.us.prol.loopexit
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %._crit_edge5.us.preheader, %._crit_edge5.us
  %indvars.iv27 = phi i64 [ %indvars.iv.next28.1, %._crit_edge5.us ], [ %indvars.iv27.unr.ph, %._crit_edge5.us.preheader ]
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %27 = mul nuw nsw i64 %indvars.iv.next28, %indvars.iv31
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, %2
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, %20
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv31, i64 %indvars.iv27
  store double %31, double* %32, align 8
  %indvars.iv.next28.1 = add nsw i64 %indvars.iv27, 2
  %33 = mul nuw nsw i64 %indvars.iv.next28.1, %indvars.iv31
  %34 = trunc i64 %33 to i32
  %35 = srem i32 %34, %2
  %36 = sitofp i32 %35 to double
  %37 = fdiv double %36, %20
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv31, i64 %indvars.iv.next28
  store double %37, double* %38, align 8
  %exitcond30.1 = icmp eq i64 %indvars.iv.next28.1, %wide.trip.count29.1
  br i1 %exitcond30.1, label %._crit_edge5._crit_edge.us.loopexit, label %._crit_edge5.us

._crit_edge5._crit_edge.us.loopexit:              ; preds = %._crit_edge5.us
  br label %._crit_edge5._crit_edge.us

._crit_edge5._crit_edge.us:                       ; preds = %._crit_edge5._crit_edge.us.loopexit, %._crit_edge5.us.prol.loopexit
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next32, %wide.trip.count33
  br i1 %exitcond34, label %._crit_edge6.preheader.loopexit, label %._crit_edge5.preheader.us

._crit_edge6.preheader.loopexit:                  ; preds = %._crit_edge5._crit_edge.us
  br label %._crit_edge6.preheader

._crit_edge6.preheader:                           ; preds = %._crit_edge6.preheader.loopexit, %._crit_edge4.preheader.._crit_edge6.preheader_crit_edge, %8
  %39 = icmp sgt i32 %2, 0
  br i1 %39, label %._crit_edge7.preheader.lr.ph, label %._crit_edge6._crit_edge

._crit_edge7.preheader.lr.ph:                     ; preds = %._crit_edge6.preheader
  %40 = icmp sgt i32 %1, 0
  %41 = sitofp i32 %1 to double
  br i1 %40, label %._crit_edge7.preheader.us.preheader, label %._crit_edge6._crit_edge

._crit_edge7.preheader.us.preheader:              ; preds = %._crit_edge7.preheader.lr.ph
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count24 = zext i32 %2 to i64
  br label %._crit_edge7.preheader.us

._crit_edge7.preheader.us:                        ; preds = %._crit_edge7.preheader.us.preheader, %._crit_edge7._crit_edge.us
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %._crit_edge7._crit_edge.us ], [ 0, %._crit_edge7.preheader.us.preheader ]
  br label %._crit_edge7.us

._crit_edge7.us:                                  ; preds = %._crit_edge7.us, %._crit_edge7.preheader.us
  %indvars.iv = phi i64 [ 0, %._crit_edge7.preheader.us ], [ %indvars.iv.next, %._crit_edge7.us ]
  %42 = add nuw nsw i64 %indvars.iv, 2
  %43 = mul nuw nsw i64 %42, %indvars.iv22
  %44 = trunc i64 %43 to i32
  %45 = srem i32 %44, %1
  %46 = sitofp i32 %45 to double
  %47 = fdiv double %46, %41
  %48 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv22, i64 %indvars.iv
  store double %47, double* %48, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge7._crit_edge.us, label %._crit_edge7.us

._crit_edge7._crit_edge.us:                       ; preds = %._crit_edge7.us
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next23, %wide.trip.count24
  br i1 %exitcond25, label %._crit_edge6._crit_edge.loopexit, label %._crit_edge7.preheader.us

._crit_edge6._crit_edge.loopexit:                 ; preds = %._crit_edge7._crit_edge.us
  br label %._crit_edge6._crit_edge

._crit_edge6._crit_edge:                          ; preds = %._crit_edge6._crit_edge.loopexit, %._crit_edge5.preheader.lr.ph, %._crit_edge7.preheader.lr.ph, %._crit_edge6.preheader
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemm(i32, i32, i32, double, double, [1100 x double]* nocapture, [1200 x double]* nocapture readonly, [1100 x double]* nocapture readonly) unnamed_addr #2 {
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %._crit_edge.preheader.lr.ph, label %._crit_edge10

._crit_edge.preheader.lr.ph:                      ; preds = %8
  %10 = icmp sgt i32 %1, 0
  %11 = icmp sgt i32 %2, 0
  br i1 %10, label %._crit_edge.preheader.us.preheader, label %._crit_edge.preheader.preheader

._crit_edge.preheader.preheader:                  ; preds = %._crit_edge.preheader.lr.ph
  %xtraiter41 = and i32 %1, 1
  %lcmp.mod42 = icmp eq i32 %xtraiter41, 0
  %wide.trip.count49 = zext i32 %0 to i64
  %xtraiter159 = and i64 %wide.trip.count49, 1
  %lcmp.mod160 = icmp eq i64 %xtraiter159, 0
  br i1 %lcmp.mod160, label %._crit_edge.preheader.prol.loopexit, label %._crit_edge.preheader.prol.preheader

._crit_edge.preheader.prol.preheader:             ; preds = %._crit_edge.preheader.preheader
  br label %._crit_edge.preheader.prol

._crit_edge.preheader.prol:                       ; preds = %._crit_edge.preheader.prol.preheader
  br i1 false, label %._crit_edge4.preheader.us.preheader.prol, label %._crit_edge3._crit_edge.prol

._crit_edge4.preheader.us.preheader.prol:         ; preds = %._crit_edge.preheader.prol
  br label %._crit_edge4.preheader.us.prol

._crit_edge4.preheader.us.prol:                   ; preds = %._crit_edge4.preheader.us.preheader.prol
  br i1 %lcmp.mod42, label %._crit_edge4.us.preheader.prol, label %._crit_edge4.us.prol.prol

._crit_edge4.us.prol.prol:                        ; preds = %._crit_edge4.preheader.us.prol
  br label %._crit_edge4.us.preheader.prol

._crit_edge4.us.preheader.prol:                   ; preds = %._crit_edge4.us.prol.prol, %._crit_edge4.preheader.us.prol
  br i1 undef, label %._crit_edge4.us.preheader157.prol, label %min.iters.checked.prol

min.iters.checked.prol:                           ; preds = %._crit_edge4.us.preheader.prol
  br i1 undef, label %._crit_edge4.us.preheader157.prol, label %vector.memcheck.prol

vector.memcheck.prol:                             ; preds = %min.iters.checked.prol
  br i1 undef, label %._crit_edge4.us.preheader157.prol, label %vector.ph.prol

vector.ph.prol:                                   ; preds = %vector.memcheck.prol
  br label %vector.body.prol

vector.body.prol:                                 ; preds = %vector.ph.prol
  br i1 undef, label %._crit_edge4._crit_edge.us.prol, label %._crit_edge4.us.preheader157.prol

._crit_edge4.us.preheader157.prol:                ; preds = %vector.body.prol, %vector.memcheck.prol, %min.iters.checked.prol, %._crit_edge4.us.preheader.prol
  br label %._crit_edge4.us.prol161

._crit_edge4.us.prol161:                          ; preds = %._crit_edge4.us.preheader157.prol
  br label %._crit_edge4._crit_edge.us.prol

._crit_edge4._crit_edge.us.prol:                  ; preds = %._crit_edge4.us.prol161, %vector.body.prol
  br label %._crit_edge3._crit_edge.prol

._crit_edge3._crit_edge.prol:                     ; preds = %._crit_edge4._crit_edge.us.prol, %._crit_edge.preheader.prol
  br label %._crit_edge.preheader.prol.loopexit

._crit_edge.preheader.prol.loopexit:              ; preds = %._crit_edge.preheader.preheader, %._crit_edge3._crit_edge.prol
  %indvars.iv47.unr = phi i64 [ 0, %._crit_edge.preheader.preheader ], [ 1, %._crit_edge3._crit_edge.prol ]
  %12 = icmp eq i32 %0, 1
  br i1 %12, label %._crit_edge10.loopexit158, label %._crit_edge.preheader.preheader.new

._crit_edge.preheader.preheader.new:              ; preds = %._crit_edge.preheader.prol.loopexit
  br label %._crit_edge.preheader

._crit_edge.preheader.us.preheader:               ; preds = %._crit_edge.preheader.lr.ph
  %13 = add i32 %1, -1
  %xtraiter = and i32 %1, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %14 = icmp ult i32 %13, 3
  %xtraiter26 = and i32 %1, 1
  %lcmp.mod27 = icmp eq i32 %xtraiter26, 0
  %15 = icmp eq i32 %13, 0
  %wide.trip.count31 = zext i32 %2 to i64
  %wide.trip.count25.1 = zext i32 %1 to i64
  %wide.trip.count34 = zext i32 %0 to i64
  %16 = add nsw i64 %wide.trip.count25.1, -2
  %17 = add nsw i64 %wide.trip.count25.1, -4
  %broadcast.splatinsert120 = insertelement <2 x double> undef, double %3, i32 0
  %broadcast.splatinsert152 = insertelement <2 x double> undef, double %4, i32 0
  %broadcast.splat153 = shufflevector <2 x double> %broadcast.splatinsert152, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge3._crit_edge.us, %._crit_edge.preheader.us.preheader
  %indvars.iv32 = phi i64 [ 0, %._crit_edge.preheader.us.preheader ], [ %indvars.iv.next33, %._crit_edge3._crit_edge.us ]
  %scevgep90 = getelementptr [1100 x double], [1100 x double]* %5, i64 %indvars.iv32, i64 2
  br i1 %lcmp.mod, label %._crit_edge.us.prol.loopexit, label %._crit_edge.us.prol.preheader

._crit_edge.us.prol.preheader:                    ; preds = %._crit_edge.preheader.us
  br label %._crit_edge.us.prol

._crit_edge.us.prol:                              ; preds = %._crit_edge.us.prol.preheader, %._crit_edge.us.prol
  %indvars.iv.prol = phi i64 [ %indvars.iv.next.prol, %._crit_edge.us.prol ], [ 0, %._crit_edge.us.prol.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %._crit_edge.us.prol ], [ %xtraiter, %._crit_edge.us.prol.preheader ]
  %18 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv32, i64 %indvars.iv.prol
  %19 = load double, double* %18, align 8
  %20 = fmul double %19, %4
  store double %20, double* %18, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge.us.prol.loopexit.loopexit, label %._crit_edge.us.prol, !llvm.loop !1

._crit_edge.us.prol.loopexit.loopexit:            ; preds = %._crit_edge.us.prol
  br label %._crit_edge.us.prol.loopexit

._crit_edge.us.prol.loopexit:                     ; preds = %._crit_edge.us.prol.loopexit.loopexit, %._crit_edge.preheader.us
  %indvars.iv.unr = phi i64 [ 0, %._crit_edge.preheader.us ], [ %indvars.iv.next.prol, %._crit_edge.us.prol.loopexit.loopexit ]
  br i1 %14, label %._crit_edge.._crit_edge3.preheader_crit_edge.us, label %._crit_edge.us.preheader

._crit_edge.us.preheader:                         ; preds = %._crit_edge.us.prol.loopexit
  %21 = sub i64 %17, %indvars.iv.unr
  %22 = lshr i64 %21, 2
  %23 = add nuw nsw i64 %22, 1
  %min.iters.check132 = icmp ult i64 %23, 2
  br i1 %min.iters.check132, label %._crit_edge.us.preheader156, label %min.iters.checked133

._crit_edge.us.preheader156:                      ; preds = %middle.block130, %min.iters.checked133, %._crit_edge.us.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr, %min.iters.checked133 ], [ %indvars.iv.unr, %._crit_edge.us.preheader ], [ %ind.end141, %middle.block130 ]
  br label %._crit_edge.us

min.iters.checked133:                             ; preds = %._crit_edge.us.preheader
  %n.mod.vf134 = and i64 %23, 1
  %n.vec135 = sub nsw i64 %23, %n.mod.vf134
  %cmp.zero136 = icmp eq i64 %n.vec135, 0
  %24 = add i64 %indvars.iv.unr, 4
  %25 = shl nuw i64 %22, 2
  %26 = add i64 %24, %25
  %27 = shl nuw nsw i64 %n.mod.vf134, 2
  %ind.end141 = sub i64 %26, %27
  br i1 %cmp.zero136, label %._crit_edge.us.preheader156, label %vector.ph137

vector.ph137:                                     ; preds = %min.iters.checked133
  br label %vector.body129

vector.body129:                                   ; preds = %vector.body129, %vector.ph137
  %index138 = phi i64 [ 0, %vector.ph137 ], [ %index.next139, %vector.body129 ]
  %28 = shl i64 %index138, 2
  %29 = add i64 %indvars.iv.unr, %28
  %30 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv32, i64 %29
  %31 = bitcast double* %30 to <8 x double>*
  %wide.vec147 = load <8 x double>, <8 x double>* %31, align 8
  %strided.vec148 = shufflevector <8 x double> %wide.vec147, <8 x double> undef, <2 x i32> <i32 0, i32 4>
  %strided.vec149 = shufflevector <8 x double> %wide.vec147, <8 x double> undef, <2 x i32> <i32 1, i32 5>
  %strided.vec150 = shufflevector <8 x double> %wide.vec147, <8 x double> undef, <2 x i32> <i32 2, i32 6>
  %strided.vec151 = shufflevector <8 x double> %wide.vec147, <8 x double> undef, <2 x i32> <i32 3, i32 7>
  %32 = fmul <2 x double> %strided.vec148, %broadcast.splat153
  %33 = fmul <2 x double> %strided.vec149, %broadcast.splat153
  %34 = fmul <2 x double> %strided.vec150, %broadcast.splat153
  %35 = add nsw i64 %29, 3
  %36 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv32, i64 %35
  %37 = fmul <2 x double> %strided.vec151, %broadcast.splat153
  %38 = getelementptr double, double* %36, i64 -3
  %39 = bitcast double* %38 to <8 x double>*
  %40 = shufflevector <2 x double> %32, <2 x double> %33, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %41 = shufflevector <2 x double> %34, <2 x double> %37, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %interleaved.vec154 = shufflevector <4 x double> %40, <4 x double> %41, <8 x i32> <i32 0, i32 2, i32 4, i32 6, i32 1, i32 3, i32 5, i32 7>
  store <8 x double> %interleaved.vec154, <8 x double>* %39, align 8
  %index.next139 = add i64 %index138, 2
  %42 = icmp eq i64 %index.next139, %n.vec135
  br i1 %42, label %middle.block130, label %vector.body129, !llvm.loop !3

middle.block130:                                  ; preds = %vector.body129
  %cmp.n142 = icmp eq i64 %n.mod.vf134, 0
  br i1 %cmp.n142, label %._crit_edge.._crit_edge3.preheader_crit_edge.us, label %._crit_edge.us.preheader156

._crit_edge3._crit_edge.us.loopexit:              ; preds = %._crit_edge4._crit_edge.us.us
  br label %._crit_edge3._crit_edge.us

._crit_edge3._crit_edge.us:                       ; preds = %._crit_edge3._crit_edge.us.loopexit, %._crit_edge.._crit_edge3.preheader_crit_edge.us
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next33, %wide.trip.count34
  br i1 %exitcond35, label %._crit_edge10.loopexit, label %._crit_edge.preheader.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader156, %._crit_edge.us
  %indvars.iv = phi i64 [ %indvars.iv.next.3, %._crit_edge.us ], [ %indvars.iv.ph, %._crit_edge.us.preheader156 ]
  %43 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv32, i64 %indvars.iv
  %44 = load double, double* %43, align 8
  %45 = fmul double %44, %4
  store double %45, double* %43, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %46 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv32, i64 %indvars.iv.next
  %47 = load double, double* %46, align 8
  %48 = fmul double %47, %4
  store double %48, double* %46, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %49 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv32, i64 %indvars.iv.next.1
  %50 = load double, double* %49, align 8
  %51 = fmul double %50, %4
  store double %51, double* %49, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %52 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv32, i64 %indvars.iv.next.2
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, %4
  store double %54, double* %52, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %exitcond.3 = icmp eq i64 %indvars.iv.next.3, %wide.trip.count25.1
  br i1 %exitcond.3, label %._crit_edge.._crit_edge3.preheader_crit_edge.us.loopexit, label %._crit_edge.us, !llvm.loop !6

._crit_edge.._crit_edge3.preheader_crit_edge.us.loopexit: ; preds = %._crit_edge.us
  br label %._crit_edge.._crit_edge3.preheader_crit_edge.us

._crit_edge.._crit_edge3.preheader_crit_edge.us:  ; preds = %._crit_edge.._crit_edge3.preheader_crit_edge.us.loopexit, %middle.block130, %._crit_edge.us.prol.loopexit
  br i1 %11, label %._crit_edge4.preheader.us.us.preheader, label %._crit_edge3._crit_edge.us

._crit_edge4.preheader.us.us.preheader:           ; preds = %._crit_edge.._crit_edge3.preheader_crit_edge.us
  %55 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv32, i64 0
  br label %._crit_edge4.preheader.us.us

._crit_edge4.preheader.us.us:                     ; preds = %._crit_edge4.preheader.us.us.preheader, %._crit_edge4._crit_edge.us.us
  %indvars.iv29 = phi i64 [ %indvars.iv.next30, %._crit_edge4._crit_edge.us.us ], [ 0, %._crit_edge4.preheader.us.us.preheader ]
  %scevgep96 = getelementptr [1100 x double], [1100 x double]* %7, i64 %indvars.iv29, i64 2
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv32, i64 %indvars.iv29
  br i1 %lcmp.mod27, label %._crit_edge4.us.us.prol.loopexit, label %._crit_edge4.us.us.prol

._crit_edge4.us.us.prol:                          ; preds = %._crit_edge4.preheader.us.us
  %57 = load double, double* %56, align 8
  %58 = fmul double %57, %3
  %59 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv29, i64 0
  %60 = load double, double* %59, align 8
  %61 = fmul double %58, %60
  %62 = load double, double* %55, align 8
  %63 = fadd double %62, %61
  store double %63, double* %55, align 8
  br label %._crit_edge4.us.us.prol.loopexit

._crit_edge4.us.us.prol.loopexit:                 ; preds = %._crit_edge4.us.us.prol, %._crit_edge4.preheader.us.us
  %indvars.iv23.unr.ph = phi i64 [ 1, %._crit_edge4.us.us.prol ], [ 0, %._crit_edge4.preheader.us.us ]
  br i1 %15, label %._crit_edge4._crit_edge.us.us, label %._crit_edge4.us.us.preheader

._crit_edge4.us.us.preheader:                     ; preds = %._crit_edge4.us.us.prol.loopexit
  %64 = sub nsw i64 %16, %indvars.iv23.unr.ph
  %65 = lshr i64 %64, 1
  %66 = add nuw i64 %65, 1
  %min.iters.check81 = icmp ult i64 %66, 2
  br i1 %min.iters.check81, label %._crit_edge4.us.us.preheader155, label %min.iters.checked82

._crit_edge4.us.us.preheader155:                  ; preds = %middle.block79, %vector.memcheck109, %min.iters.checked82, %._crit_edge4.us.us.preheader
  %indvars.iv23.ph = phi i64 [ %indvars.iv23.unr.ph, %vector.memcheck109 ], [ %indvars.iv23.unr.ph, %min.iters.checked82 ], [ %indvars.iv23.unr.ph, %._crit_edge4.us.us.preheader ], [ %ind.end114, %middle.block79 ]
  br label %._crit_edge4.us.us

min.iters.checked82:                              ; preds = %._crit_edge4.us.us.preheader
  %n.mod.vf83 = and i64 %66, 1
  %n.vec84 = sub i64 %66, %n.mod.vf83
  %cmp.zero85 = icmp eq i64 %n.vec84, 0
  br i1 %cmp.zero85, label %._crit_edge4.us.us.preheader155, label %vector.memcheck109

vector.memcheck109:                               ; preds = %min.iters.checked82
  %scevgep88 = getelementptr [1100 x double], [1100 x double]* %5, i64 %indvars.iv32, i64 %indvars.iv23.unr.ph
  %67 = and i64 %64, -2
  %68 = or i64 %indvars.iv23.unr.ph, %67
  %scevgep91 = getelementptr double, double* %scevgep90, i64 %68
  %scevgep94 = getelementptr [1100 x double], [1100 x double]* %7, i64 %indvars.iv29, i64 %indvars.iv23.unr.ph
  %scevgep97 = getelementptr double, double* %scevgep96, i64 %68
  %bound0101 = icmp ult double* %scevgep88, %56
  %bound1102 = icmp ult double* %56, %scevgep91
  %found.conflict103 = and i1 %bound0101, %bound1102
  %bound0104 = icmp ult double* %scevgep88, %scevgep97
  %bound1105 = icmp ult double* %scevgep94, %scevgep91
  %found.conflict106 = and i1 %bound0104, %bound1105
  %conflict.rdx107 = or i1 %found.conflict103, %found.conflict106
  %69 = or i64 %indvars.iv23.unr.ph, 2
  %70 = shl nuw i64 %65, 1
  %71 = add i64 %69, %70
  %72 = shl nuw nsw i64 %n.mod.vf83, 1
  %ind.end114 = sub i64 %71, %72
  br i1 %conflict.rdx107, label %._crit_edge4.us.us.preheader155, label %vector.ph110

vector.ph110:                                     ; preds = %vector.memcheck109
  %73 = load double, double* %56, align 8, !alias.scope !8
  %74 = insertelement <2 x double> undef, double %73, i32 0
  %75 = fmul <2 x double> %74, %broadcast.splatinsert120
  %76 = shufflevector <2 x double> %75, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body78

vector.body78:                                    ; preds = %vector.body78, %vector.ph110
  %index111 = phi i64 [ 0, %vector.ph110 ], [ %index.next112, %vector.body78 ]
  %77 = shl i64 %index111, 1
  %offset.idx116 = or i64 %indvars.iv23.unr.ph, %77
  %78 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv29, i64 %offset.idx116
  %79 = bitcast double* %78 to <4 x double>*
  %wide.vec122 = load <4 x double>, <4 x double>* %79, align 8, !alias.scope !11
  %strided.vec123 = shufflevector <4 x double> %wide.vec122, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec124 = shufflevector <4 x double> %wide.vec122, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %80 = fmul <2 x double> %76, %strided.vec123
  %81 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv32, i64 %offset.idx116
  %82 = bitcast double* %81 to <4 x double>*
  %wide.vec125 = load <4 x double>, <4 x double>* %82, align 8, !alias.scope !13, !noalias !15
  %strided.vec126 = shufflevector <4 x double> %wide.vec125, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec127 = shufflevector <4 x double> %wide.vec125, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %83 = fadd <2 x double> %strided.vec126, %80
  %84 = add nuw nsw i64 %offset.idx116, 1
  %85 = fmul <2 x double> %76, %strided.vec124
  %86 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv32, i64 %84
  %87 = fadd <2 x double> %strided.vec127, %85
  %88 = getelementptr double, double* %86, i64 -1
  %89 = bitcast double* %88 to <4 x double>*
  %interleaved.vec128 = shufflevector <2 x double> %83, <2 x double> %87, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec128, <4 x double>* %89, align 8, !alias.scope !13, !noalias !15
  %index.next112 = add i64 %index111, 2
  %90 = icmp eq i64 %index.next112, %n.vec84
  br i1 %90, label %middle.block79, label %vector.body78, !llvm.loop !16

middle.block79:                                   ; preds = %vector.body78
  %cmp.n115 = icmp eq i64 %n.mod.vf83, 0
  br i1 %cmp.n115, label %._crit_edge4._crit_edge.us.us, label %._crit_edge4.us.us.preheader155

._crit_edge4._crit_edge.us.us.loopexit:           ; preds = %._crit_edge4.us.us
  br label %._crit_edge4._crit_edge.us.us

._crit_edge4._crit_edge.us.us:                    ; preds = %._crit_edge4._crit_edge.us.us.loopexit, %middle.block79, %._crit_edge4.us.us.prol.loopexit
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond = icmp eq i64 %indvars.iv.next30, %wide.trip.count31
  br i1 %exitcond, label %._crit_edge3._crit_edge.us.loopexit, label %._crit_edge4.preheader.us.us

._crit_edge4.us.us:                               ; preds = %._crit_edge4.us.us.preheader155, %._crit_edge4.us.us
  %indvars.iv23 = phi i64 [ %indvars.iv.next24.1, %._crit_edge4.us.us ], [ %indvars.iv23.ph, %._crit_edge4.us.us.preheader155 ]
  %91 = load double, double* %56, align 8
  %92 = fmul double %91, %3
  %93 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv29, i64 %indvars.iv23
  %94 = load double, double* %93, align 8
  %95 = fmul double %92, %94
  %96 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv32, i64 %indvars.iv23
  %97 = load double, double* %96, align 8
  %98 = fadd double %97, %95
  store double %98, double* %96, align 8
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %99 = load double, double* %56, align 8
  %100 = fmul double %99, %3
  %101 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv29, i64 %indvars.iv.next24
  %102 = load double, double* %101, align 8
  %103 = fmul double %100, %102
  %104 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv32, i64 %indvars.iv.next24
  %105 = load double, double* %104, align 8
  %106 = fadd double %105, %103
  store double %106, double* %104, align 8
  %indvars.iv.next24.1 = add nsw i64 %indvars.iv23, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next24.1, %wide.trip.count25.1
  br i1 %exitcond.1, label %._crit_edge4._crit_edge.us.us.loopexit, label %._crit_edge4.us.us, !llvm.loop !17

._crit_edge.preheader:                            ; preds = %._crit_edge3._crit_edge.1, %._crit_edge.preheader.preheader.new
  %indvars.iv47 = phi i64 [ %indvars.iv47.unr, %._crit_edge.preheader.preheader.new ], [ %indvars.iv.next48.1, %._crit_edge3._crit_edge.1 ]
  br i1 false, label %._crit_edge4.preheader.us.preheader, label %._crit_edge3._crit_edge

._crit_edge4.preheader.us.preheader:              ; preds = %._crit_edge.preheader
  br label %._crit_edge4.preheader.us

._crit_edge4.preheader.us:                        ; preds = %._crit_edge4.preheader.us.preheader
  br i1 %lcmp.mod42, label %._crit_edge4.us.preheader, label %._crit_edge4.us.prol

._crit_edge4.us.prol:                             ; preds = %._crit_edge4.preheader.us
  br label %._crit_edge4.us.preheader

._crit_edge4.us.preheader:                        ; preds = %._crit_edge4.preheader.us, %._crit_edge4.us.prol
  br i1 undef, label %._crit_edge4.us.preheader157, label %min.iters.checked

min.iters.checked:                                ; preds = %._crit_edge4.us.preheader
  br i1 undef, label %._crit_edge4.us.preheader157, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  br i1 undef, label %._crit_edge4.us.preheader157, label %vector.ph

vector.ph:                                        ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.ph
  br i1 undef, label %._crit_edge4._crit_edge.us, label %._crit_edge4.us.preheader157

._crit_edge4.us.preheader157:                     ; preds = %vector.body, %vector.memcheck, %min.iters.checked, %._crit_edge4.us.preheader
  br label %._crit_edge4.us

._crit_edge4.us:                                  ; preds = %._crit_edge4.us.preheader157
  br label %._crit_edge4._crit_edge.us

._crit_edge4._crit_edge.us:                       ; preds = %._crit_edge4.us, %vector.body
  br label %._crit_edge3._crit_edge

._crit_edge3._crit_edge:                          ; preds = %._crit_edge4._crit_edge.us, %._crit_edge.preheader
  br i1 false, label %._crit_edge4.preheader.us.preheader.1, label %._crit_edge3._crit_edge.1

._crit_edge10.loopexit:                           ; preds = %._crit_edge3._crit_edge.us
  br label %._crit_edge10

._crit_edge10.loopexit158.unr-lcssa:              ; preds = %._crit_edge3._crit_edge.1
  br label %._crit_edge10.loopexit158

._crit_edge10.loopexit158:                        ; preds = %._crit_edge.preheader.prol.loopexit, %._crit_edge10.loopexit158.unr-lcssa
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit158, %._crit_edge10.loopexit, %8
  ret void

._crit_edge4.preheader.us.preheader.1:            ; preds = %._crit_edge3._crit_edge
  br label %._crit_edge4.preheader.us.1

._crit_edge4.preheader.us.1:                      ; preds = %._crit_edge4.preheader.us.preheader.1
  br i1 %lcmp.mod42, label %._crit_edge4.us.preheader.1, label %._crit_edge4.us.prol.1

._crit_edge4.us.prol.1:                           ; preds = %._crit_edge4.preheader.us.1
  br label %._crit_edge4.us.preheader.1

._crit_edge4.us.preheader.1:                      ; preds = %._crit_edge4.us.prol.1, %._crit_edge4.preheader.us.1
  br i1 undef, label %._crit_edge4.us.preheader157.1, label %min.iters.checked.1

min.iters.checked.1:                              ; preds = %._crit_edge4.us.preheader.1
  br i1 undef, label %._crit_edge4.us.preheader157.1, label %vector.memcheck.1

vector.memcheck.1:                                ; preds = %min.iters.checked.1
  br i1 undef, label %._crit_edge4.us.preheader157.1, label %vector.ph.1

vector.ph.1:                                      ; preds = %vector.memcheck.1
  br label %vector.body.1

vector.body.1:                                    ; preds = %vector.ph.1
  br i1 undef, label %._crit_edge4._crit_edge.us.1, label %._crit_edge4.us.preheader157.1

._crit_edge4.us.preheader157.1:                   ; preds = %vector.body.1, %vector.memcheck.1, %min.iters.checked.1, %._crit_edge4.us.preheader.1
  br label %._crit_edge4.us.1

._crit_edge4.us.1:                                ; preds = %._crit_edge4.us.preheader157.1
  br label %._crit_edge4._crit_edge.us.1

._crit_edge4._crit_edge.us.1:                     ; preds = %._crit_edge4.us.1, %vector.body.1
  br label %._crit_edge3._crit_edge.1

._crit_edge3._crit_edge.1:                        ; preds = %._crit_edge4._crit_edge.us.1, %._crit_edge3._crit_edge
  %indvars.iv.next48.1 = add nsw i64 %indvars.iv47, 2
  %exitcond50.1 = icmp eq i64 %indvars.iv.next48.1, %wide.trip.count49
  br i1 %exitcond50.1, label %._crit_edge10.loopexit158.unr-lcssa, label %._crit_edge.preheader
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
  br i1 %or.cond, label %._crit_edge.preheader.us.preheader, label %._crit_edge

._crit_edge.preheader.us.preheader:               ; preds = %3
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count8 = zext i32 %0 to i64
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge._crit_edge.us, %._crit_edge.preheader.us.preheader
  %indvars.iv6 = phi i64 [ 0, %._crit_edge.preheader.us.preheader ], [ %indvars.iv.next7, %._crit_edge._crit_edge.us ]
  %11 = mul nsw i64 %indvars.iv6, %10
  br label %12

; <label>:12:                                     ; preds = %._crit_edge2.us, %._crit_edge.preheader.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.preheader.us ], [ %indvars.iv.next, %._crit_edge2.us ]
  %13 = add nsw i64 %indvars.iv, %11
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %._crit_edge2.us

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #5
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %17, %12
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv6, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge._crit_edge.us, label %12

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge2.us
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, %wide.trip.count8
  br i1 %exitcond9, label %._crit_edge.loopexit, label %._crit_edge.preheader.us

._crit_edge.loopexit:                             ; preds = %._crit_edge._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
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
