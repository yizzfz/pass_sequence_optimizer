; ModuleID = 'A.ll'
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
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %14
  tail call void @print_array(i32 1000, i32 1100, [1100 x double]* %8)
  br label %18

; <label>:18:                                     ; preds = %14, %17, %2
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
  br i1 %exitcond46, label %.preheader5.lr.ph.loopexit, label %.preheader7.us

.preheader5.lr.ph.loopexit:                       ; preds = %._crit_edge19.us
  br label %.preheader5.lr.ph

.preheader5.lr.ph:                                ; preds = %.preheader5.lr.ph.loopexit, %.preheader7.lr.ph
  %20 = icmp sgt i32 %2, 0
  %21 = sitofp i32 %2 to double
  br i1 %20, label %.preheader5.us.preheader, label %._crit_edge11

.preheader5.us.preheader:                         ; preds = %.preheader5.lr.ph
  %xtraiter = and i32 %2, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %22 = icmp eq i32 %2, 1
  %wide.trip.count36 = zext i32 %0 to i64
  %23 = insertelement <2 x double> undef, double %21, i32 0
  %24 = shufflevector <2 x double> %23, <2 x double> undef, <2 x i32> zeroinitializer
  %wide.trip.count32.1 = zext i32 %2 to i64
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %.preheader5.us.preheader, %._crit_edge14.us
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %._crit_edge14.us ], [ 0, %.preheader5.us.preheader ]
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader5.us
  %25 = trunc i64 %indvars.iv34 to i32
  %26 = srem i32 %25, %2
  %27 = sitofp i32 %26 to double
  %28 = fdiv double %27, %21
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv34, i64 0
  store double %28, double* %29, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader5.us
  %indvars.iv30.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader5.us ]
  br i1 %22, label %._crit_edge14.us, label %.preheader5.us.new.preheader

.preheader5.us.new.preheader:                     ; preds = %.prol.loopexit
  br label %.preheader5.us.new

.preheader5.us.new:                               ; preds = %.preheader5.us.new.preheader, %.preheader5.us.new
  %indvars.iv30 = phi i64 [ %indvars.iv.next31.1, %.preheader5.us.new ], [ %indvars.iv30.unr.ph, %.preheader5.us.new.preheader ]
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %30 = mul nuw nsw i64 %indvars.iv.next31, %indvars.iv34
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, %2
  %33 = sitofp i32 %32 to double
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv34, i64 %indvars.iv30
  %indvars.iv.next31.1 = add nsw i64 %indvars.iv30, 2
  %35 = mul nuw nsw i64 %indvars.iv.next31.1, %indvars.iv34
  %36 = trunc i64 %35 to i32
  %37 = srem i32 %36, %2
  %38 = sitofp i32 %37 to double
  %39 = insertelement <2 x double> undef, double %33, i32 0
  %40 = insertelement <2 x double> %39, double %38, i32 1
  %41 = fdiv <2 x double> %40, %24
  %42 = bitcast double* %34 to <2 x double>*
  store <2 x double> %41, <2 x double>* %42, align 8
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

.preheader4:                                      ; preds = %.preheader4.loopexit, %8
  %43 = icmp sgt i32 %2, 0
  br i1 %43, label %.preheader.lr.ph, label %._crit_edge11

.preheader.lr.ph:                                 ; preds = %.preheader4
  %44 = icmp sgt i32 %1, 0
  %45 = sitofp i32 %1 to double
  br i1 %44, label %.preheader.us.preheader, label %._crit_edge11

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count27 = zext i32 %2 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %46

; <label>:46:                                     ; preds = %46, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %46 ]
  %47 = add nuw nsw i64 %indvars.iv, 2
  %48 = mul nuw nsw i64 %47, %indvars.iv25
  %49 = trunc i64 %48 to i32
  %50 = srem i32 %49, %1
  %51 = sitofp i32 %50 to double
  %52 = fdiv double %51, %45
  %53 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv25, i64 %indvars.iv
  store double %52, double* %53, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %46

._crit_edge.us:                                   ; preds = %46
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next26, %wide.trip.count27
  br i1 %exitcond28, label %._crit_edge11.loopexit, label %.preheader.us

._crit_edge11.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit, %.preheader5.lr.ph, %.preheader.lr.ph, %.preheader4
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_gemm(i32, i32, i32, double, double, [1100 x double]* nocapture, [1200 x double]* nocapture readonly, [1100 x double]* nocapture readonly) #2 {
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.preheader4.lr.ph, label %._crit_edge11

.preheader4.lr.ph:                                ; preds = %8
  %10 = icmp sgt i32 %1, 0
  %11 = icmp sgt i32 %2, 0
  br i1 %10, label %.preheader4.us.preheader, label %.preheader4.preheader

.preheader4.preheader:                            ; preds = %.preheader4.lr.ph
  %wide.trip.count52 = zext i32 %0 to i64
  %12 = add nsw i64 %wide.trip.count52, -1
  %xtraiter138 = and i64 %wide.trip.count52, 7
  %lcmp.mod139 = icmp eq i64 %xtraiter138, 0
  br i1 %lcmp.mod139, label %.preheader4.prol.loopexit, label %.preheader4.prol.preheader

.preheader4.prol.preheader:                       ; preds = %.preheader4.preheader
  br label %.preheader4.prol

.preheader4.prol:                                 ; preds = %.preheader4.prol, %.preheader4.prol.preheader
  %indvars.iv50.prol = phi i64 [ %indvars.iv.next51.prol, %.preheader4.prol ], [ 0, %.preheader4.prol.preheader ]
  %prol.iter140 = phi i64 [ %prol.iter140.sub, %.preheader4.prol ], [ %xtraiter138, %.preheader4.prol.preheader ]
  %indvars.iv.next51.prol = add nuw nsw i64 %indvars.iv50.prol, 1
  %prol.iter140.sub = add i64 %prol.iter140, -1
  %prol.iter140.cmp = icmp eq i64 %prol.iter140.sub, 0
  br i1 %prol.iter140.cmp, label %.preheader4.prol.loopexit.unr-lcssa, label %.preheader4.prol, !llvm.loop !1

.preheader4.prol.loopexit.unr-lcssa:              ; preds = %.preheader4.prol
  br label %.preheader4.prol.loopexit

.preheader4.prol.loopexit:                        ; preds = %.preheader4.preheader, %.preheader4.prol.loopexit.unr-lcssa
  %indvars.iv50.unr = phi i64 [ 0, %.preheader4.preheader ], [ %indvars.iv.next51.prol, %.preheader4.prol.loopexit.unr-lcssa ]
  %13 = icmp ult i64 %12, 7
  br i1 %13, label %._crit_edge11.loopexit133, label %.preheader4.preheader.new

.preheader4.preheader.new:                        ; preds = %.preheader4.prol.loopexit
  br label %.preheader4

.preheader4.us.preheader:                         ; preds = %.preheader4.lr.ph
  %14 = add i32 %1, -1
  %xtraiter = and i32 %1, 3
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %15 = icmp ult i32 %14, 3
  %xtraiter27 = and i32 %1, 1
  %lcmp.mod28 = icmp eq i32 %xtraiter27, 0
  %16 = icmp eq i32 %14, 0
  %wide.trip.count32 = zext i32 %2 to i64
  %wide.trip.count24.1 = zext i32 %1 to i64
  %wide.trip.count35 = zext i32 %0 to i64
  %17 = insertelement <2 x double> undef, double %4, i32 0
  %18 = shufflevector <2 x double> %17, <2 x double> undef, <2 x i32> zeroinitializer
  %19 = add nsw i64 %wide.trip.count24.1, -2
  %20 = add nsw i64 %wide.trip.count24.1, -2
  %21 = add nsw i64 %wide.trip.count24.1, -4
  %broadcast.splatinsert123 = insertelement <2 x double> undef, double %3, i32 0
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
  %22 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv.prol
  %23 = load double, double* %22, align 8
  %24 = fmul double %23, %4
  store double %24, double* %22, align 8
  %indvars.iv.next.prol = add nuw nsw i64 %indvars.iv.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.prol.loopexit.loopexit, label %.prol.preheader, !llvm.loop !3

.prol.loopexit.loopexit:                          ; preds = %.prol.preheader
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.loopexit, %.preheader4.us
  %indvars.iv.unr = phi i64 [ 0, %.preheader4.us ], [ %indvars.iv.next.prol, %.prol.loopexit.loopexit ]
  br i1 %15, label %..preheader3_crit_edge.us, label %.preheader4.us.new.preheader

.preheader4.us.new.preheader:                     ; preds = %.prol.loopexit
  %25 = sub i64 %21, %indvars.iv.unr
  %26 = lshr i64 %25, 2
  %27 = and i64 %26, 1
  %lcmp.mod135 = icmp eq i64 %27, 0
  br i1 %lcmp.mod135, label %.preheader4.us.new.prol.preheader, label %.preheader4.us.new.prol.loopexit.unr-lcssa

.preheader4.us.new.prol.preheader:                ; preds = %.preheader4.us.new.preheader
  br label %.preheader4.us.new.prol

.preheader4.us.new.prol:                          ; preds = %.preheader4.us.new.prol.preheader
  %28 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv.unr
  %29 = bitcast double* %28 to <2 x double>*
  %30 = load <2 x double>, <2 x double>* %29, align 8
  %31 = fmul <2 x double> %30, %18
  store <2 x double> %31, <2 x double>* %29, align 8
  %indvars.iv.next.1.prol = add nsw i64 %indvars.iv.unr, 2
  %32 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv.next.1.prol
  %33 = bitcast double* %32 to <2 x double>*
  %34 = load <2 x double>, <2 x double>* %33, align 8
  %35 = fmul <2 x double> %34, %18
  store <2 x double> %35, <2 x double>* %33, align 8
  %indvars.iv.next.3.prol = add nsw i64 %indvars.iv.unr, 4
  br label %.preheader4.us.new.prol.loopexit.unr-lcssa

.preheader4.us.new.prol.loopexit.unr-lcssa:       ; preds = %.preheader4.us.new.preheader, %.preheader4.us.new.prol
  %indvars.iv.unr137.ph = phi i64 [ %indvars.iv.next.3.prol, %.preheader4.us.new.prol ], [ %indvars.iv.unr, %.preheader4.us.new.preheader ]
  br label %.preheader4.us.new.prol.loopexit

.preheader4.us.new.prol.loopexit:                 ; preds = %.preheader4.us.new.prol.loopexit.unr-lcssa
  %36 = icmp eq i64 %26, 0
  br i1 %36, label %..preheader3_crit_edge.us.loopexit, label %.preheader4.us.new.preheader.new

.preheader4.us.new.preheader.new:                 ; preds = %.preheader4.us.new.prol.loopexit
  br label %.preheader4.us.new

._crit_edge9.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %._crit_edge9.us.loopexit, %..preheader3_crit_edge.us
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next34, %wide.trip.count35
  br i1 %exitcond36, label %._crit_edge11.loopexit, label %.preheader4.us

.preheader4.us.new:                               ; preds = %.preheader4.us.new, %.preheader4.us.new.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr137.ph, %.preheader4.us.new.preheader.new ], [ %indvars.iv.next.3.1, %.preheader4.us.new ]
  %37 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv
  %38 = bitcast double* %37 to <2 x double>*
  %39 = load <2 x double>, <2 x double>* %38, align 8
  %40 = fmul <2 x double> %39, %18
  store <2 x double> %40, <2 x double>* %38, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %41 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv.next.1
  %42 = bitcast double* %41 to <2 x double>*
  %43 = load <2 x double>, <2 x double>* %42, align 8
  %44 = fmul <2 x double> %43, %18
  store <2 x double> %44, <2 x double>* %42, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %45 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv.next.3
  %46 = bitcast double* %45 to <2 x double>*
  %47 = load <2 x double>, <2 x double>* %46, align 8
  %48 = fmul <2 x double> %47, %18
  store <2 x double> %48, <2 x double>* %46, align 8
  %indvars.iv.next.1.1 = add nsw i64 %indvars.iv, 6
  %49 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv.next.1.1
  %50 = bitcast double* %49 to <2 x double>*
  %51 = load <2 x double>, <2 x double>* %50, align 8
  %52 = fmul <2 x double> %51, %18
  store <2 x double> %52, <2 x double>* %50, align 8
  %indvars.iv.next.3.1 = add nsw i64 %indvars.iv, 8
  %exitcond.3.1 = icmp eq i64 %indvars.iv.next.3.1, %wide.trip.count24.1
  br i1 %exitcond.3.1, label %..preheader3_crit_edge.us.loopexit.unr-lcssa, label %.preheader4.us.new

..preheader3_crit_edge.us.loopexit.unr-lcssa:     ; preds = %.preheader4.us.new
  br label %..preheader3_crit_edge.us.loopexit

..preheader3_crit_edge.us.loopexit:               ; preds = %.preheader4.us.new.prol.loopexit, %..preheader3_crit_edge.us.loopexit.unr-lcssa
  br label %..preheader3_crit_edge.us

..preheader3_crit_edge.us:                        ; preds = %..preheader3_crit_edge.us.loopexit, %.prol.loopexit
  br i1 %11, label %.preheader.us.us.preheader, label %._crit_edge9.us

.preheader.us.us.preheader:                       ; preds = %..preheader3_crit_edge.us
  %53 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 0
  br label %.preheader.us.us

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %scevgep99 = getelementptr [1100 x double], [1100 x double]* %7, i64 %indvars.iv30, i64 2
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv33, i64 %indvars.iv30
  br i1 %lcmp.mod28, label %.prol.loopexit26, label %.prol.preheader25

.prol.preheader25:                                ; preds = %.preheader.us.us
  %55 = load double, double* %54, align 8
  %56 = fmul double %55, %3
  %57 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv30, i64 0
  %58 = load double, double* %57, align 8
  %59 = fmul double %56, %58
  %60 = load double, double* %53, align 8
  %61 = fadd double %60, %59
  store double %61, double* %53, align 8
  br label %.prol.loopexit26

.prol.loopexit26:                                 ; preds = %.prol.preheader25, %.preheader.us.us
  %indvars.iv22.unr.ph = phi i64 [ 1, %.prol.preheader25 ], [ 0, %.preheader.us.us ]
  br i1 %16, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader

.preheader.us.us.new.preheader:                   ; preds = %.prol.loopexit26
  %62 = sub nsw i64 %19, %indvars.iv22.unr.ph
  %63 = lshr i64 %62, 1
  %64 = add nuw i64 %63, 1
  %min.iters.check84 = icmp ult i64 %64, 2
  br i1 %min.iters.check84, label %.preheader.us.us.new.preheader132, label %min.iters.checked85

.preheader.us.us.new.preheader132:                ; preds = %middle.block82, %vector.memcheck112, %min.iters.checked85, %.preheader.us.us.new.preheader
  %indvars.iv22.ph = phi i64 [ %indvars.iv22.unr.ph, %vector.memcheck112 ], [ %indvars.iv22.unr.ph, %min.iters.checked85 ], [ %indvars.iv22.unr.ph, %.preheader.us.us.new.preheader ], [ %ind.end117, %middle.block82 ]
  br label %.preheader.us.us.new

min.iters.checked85:                              ; preds = %.preheader.us.us.new.preheader
  %n.mod.vf86 = and i64 %64, 1
  %n.vec87 = sub i64 %64, %n.mod.vf86
  %cmp.zero88 = icmp eq i64 %n.vec87, 0
  br i1 %cmp.zero88, label %.preheader.us.us.new.preheader132, label %vector.memcheck112

vector.memcheck112:                               ; preds = %min.iters.checked85
  %scevgep91 = getelementptr [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv22.unr.ph
  %65 = sub nsw i64 %20, %indvars.iv22.unr.ph
  %66 = and i64 %65, -2
  %67 = or i64 %indvars.iv22.unr.ph, %66
  %scevgep94 = getelementptr double, double* %scevgep93, i64 %67
  %scevgep97 = getelementptr [1100 x double], [1100 x double]* %7, i64 %indvars.iv30, i64 %indvars.iv22.unr.ph
  %scevgep100 = getelementptr double, double* %scevgep99, i64 %67
  %bound0104 = icmp ult double* %scevgep91, %54
  %bound1105 = icmp ult double* %54, %scevgep94
  %found.conflict106 = and i1 %bound0104, %bound1105
  %bound0107 = icmp ult double* %scevgep91, %scevgep100
  %bound1108 = icmp ult double* %scevgep97, %scevgep94
  %found.conflict109 = and i1 %bound0107, %bound1108
  %conflict.rdx110 = or i1 %found.conflict106, %found.conflict109
  %68 = or i64 %indvars.iv22.unr.ph, 2
  %69 = shl nuw i64 %63, 1
  %70 = add i64 %68, %69
  %71 = shl nuw nsw i64 %n.mod.vf86, 1
  %ind.end117 = sub i64 %70, %71
  br i1 %conflict.rdx110, label %.preheader.us.us.new.preheader132, label %vector.ph113

vector.ph113:                                     ; preds = %vector.memcheck112
  br label %vector.body81

vector.body81:                                    ; preds = %vector.body81, %vector.ph113
  %index114 = phi i64 [ 0, %vector.ph113 ], [ %index.next115, %vector.body81 ]
  %72 = shl i64 %index114, 1
  %offset.idx119 = or i64 %indvars.iv22.unr.ph, %72
  %73 = load double, double* %54, align 8, !alias.scope !4
  %74 = insertelement <2 x double> undef, double %73, i32 0
  %75 = fmul <2 x double> %74, %broadcast.splatinsert123
  %76 = shufflevector <2 x double> %75, <2 x double> undef, <2 x i32> zeroinitializer
  %77 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv30, i64 %offset.idx119
  %78 = bitcast double* %77 to <4 x double>*
  %wide.vec125 = load <4 x double>, <4 x double>* %78, align 8, !alias.scope !7
  %strided.vec126 = shufflevector <4 x double> %wide.vec125, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec127 = shufflevector <4 x double> %wide.vec125, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %79 = fmul <2 x double> %76, %strided.vec126
  %80 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %offset.idx119
  %81 = bitcast double* %80 to <4 x double>*
  %wide.vec128 = load <4 x double>, <4 x double>* %81, align 8, !alias.scope !9, !noalias !11
  %strided.vec129 = shufflevector <4 x double> %wide.vec128, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec130 = shufflevector <4 x double> %wide.vec128, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %82 = fadd <2 x double> %strided.vec129, %79
  %83 = add nuw nsw i64 %offset.idx119, 1
  %84 = load double, double* %54, align 8, !alias.scope !4
  %85 = insertelement <2 x double> undef, double %84, i32 0
  %86 = fmul <2 x double> %85, %broadcast.splatinsert123
  %87 = shufflevector <2 x double> %86, <2 x double> undef, <2 x i32> zeroinitializer
  %88 = fmul <2 x double> %87, %strided.vec127
  %89 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %83
  %90 = fadd <2 x double> %strided.vec130, %88
  %91 = getelementptr double, double* %89, i64 -1
  %92 = bitcast double* %91 to <4 x double>*
  %interleaved.vec131 = shufflevector <2 x double> %82, <2 x double> %90, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec131, <4 x double>* %92, align 8, !alias.scope !9, !noalias !11
  %index.next115 = add i64 %index114, 2
  %93 = icmp eq i64 %index.next115, %n.vec87
  br i1 %93, label %middle.block82, label %vector.body81, !llvm.loop !12

middle.block82:                                   ; preds = %vector.body81
  %cmp.n118 = icmp eq i64 %n.mod.vf86, 0
  br i1 %cmp.n118, label %._crit_edge.us.us, label %.preheader.us.us.new.preheader132

._crit_edge.us.us.loopexit:                       ; preds = %.preheader.us.us.new
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %._crit_edge.us.us.loopexit, %middle.block82, %.prol.loopexit26
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond = icmp eq i64 %indvars.iv.next31, %wide.trip.count32
  br i1 %exitcond, label %._crit_edge9.us.loopexit, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new.preheader132, %.preheader.us.us.new
  %indvars.iv22 = phi i64 [ %indvars.iv.next23.1, %.preheader.us.us.new ], [ %indvars.iv22.ph, %.preheader.us.us.new.preheader132 ]
  %94 = load double, double* %54, align 8
  %95 = fmul double %94, %3
  %96 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv30, i64 %indvars.iv22
  %97 = load double, double* %96, align 8
  %98 = fmul double %95, %97
  %99 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv22
  %100 = load double, double* %99, align 8
  %101 = fadd double %100, %98
  store double %101, double* %99, align 8
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %102 = load double, double* %54, align 8
  %103 = fmul double %102, %3
  %104 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv30, i64 %indvars.iv.next23
  %105 = load double, double* %104, align 8
  %106 = fmul double %103, %105
  %107 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv33, i64 %indvars.iv.next23
  %108 = load double, double* %107, align 8
  %109 = fadd double %108, %106
  store double %109, double* %107, align 8
  %indvars.iv.next23.1 = add nsw i64 %indvars.iv22, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next23.1, %wide.trip.count24.1
  br i1 %exitcond.1, label %._crit_edge.us.us.loopexit, label %.preheader.us.us.new, !llvm.loop !15

.preheader4:                                      ; preds = %.preheader4, %.preheader4.preheader.new
  %indvars.iv50 = phi i64 [ %indvars.iv50.unr, %.preheader4.preheader.new ], [ %indvars.iv.next51.7, %.preheader4 ]
  %indvars.iv.next51.7 = add nsw i64 %indvars.iv50, 8
  %exitcond53.7 = icmp eq i64 %indvars.iv.next51.7, %wide.trip.count52
  br i1 %exitcond53.7, label %._crit_edge11.loopexit133.unr-lcssa, label %.preheader4

._crit_edge11.loopexit:                           ; preds = %._crit_edge9.us
  br label %._crit_edge11

._crit_edge11.loopexit133.unr-lcssa:              ; preds = %.preheader4
  br label %._crit_edge11.loopexit133

._crit_edge11.loopexit133:                        ; preds = %.preheader4.prol.loopexit, %._crit_edge11.loopexit133.unr-lcssa
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit133, %._crit_edge11.loopexit, %8
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
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8}
!8 = distinct !{!8, !6}
!9 = !{!10}
!10 = distinct !{!10, !6}
!11 = !{!5, !8}
!12 = distinct !{!12, !13, !14}
!13 = !{!"llvm.loop.vectorize.width", i32 1}
!14 = !{!"llvm.loop.interleave.count", i32 1}
!15 = distinct !{!15, !13, !14}
