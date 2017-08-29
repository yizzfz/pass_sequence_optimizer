; ModuleID = 'A.ll'
source_filename = "trmm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %4 to [1000 x double]*
  %7 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %3, [1000 x double]* %6, [1200 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  %9 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @kernel_trmm(i32 1000, i32 1200, double %8, [1000 x double]* %6, [1200 x double]* %9)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %10 = icmp sgt i32 %0, 42
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %2
  %12 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %12, align 1
  %13 = icmp eq i8 %strcmpload, 0
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %11
  %15 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %15)
  br label %._crit_edge

._crit_edge:                                      ; preds = %11, %2, %14
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double*, [1000 x double]*, [1200 x double]*) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %._crit_edge.lr.ph, label %.loopexit

._crit_edge.lr.ph:                                ; preds = %5
  %wide.trip.count24 = zext i32 %1 to i64
  %7 = icmp sgt i32 %1, 0
  %8 = sext i32 %0 to i64
  %9 = sitofp i32 %0 to double
  br i1 %7, label %._crit_edge.us.preheader, label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %._crit_edge.lr.ph
  %10 = insertelement <2 x double> undef, double %9, i32 0
  %11 = insertelement <2 x double> %10, double %9, i32 1
  br label %._crit_edge

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  %12 = sitofp i32 %1 to double
  %13 = insertelement <2 x double> undef, double %9, i32 0
  %14 = insertelement <2 x double> %13, double %9, i32 1
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge10.us
  %indvar = phi i32 [ 0, %._crit_edge.us.preheader ], [ %indvar.next, %._crit_edge10.us ]
  %indvars.iv26 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next27, %._crit_edge10.us ]
  %indvars.iv20 = phi i32 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next21, %._crit_edge10.us ]
  %15 = icmp sgt i64 %indvars.iv26, 0
  br i1 %15, label %.lr.ph.us.preheader, label %._crit_edge5.us

.lr.ph.us.preheader:                              ; preds = %._crit_edge.us
  %xtraiter = and i32 %indvar, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.us.prol.loopexit, label %.lr.ph.us.prol

.lr.ph.us.prol:                                   ; preds = %.lr.ph.us.preheader
  %16 = trunc i64 %indvars.iv26 to i32
  %17 = srem i32 %16, %0
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, %9
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv26, i64 0
  store double %19, double* %20, align 8
  br label %.lr.ph.us.prol.loopexit

.lr.ph.us.prol.loopexit:                          ; preds = %.lr.ph.us.preheader, %.lr.ph.us.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %.lr.ph.us.prol ], [ 0, %.lr.ph.us.preheader ]
  %21 = icmp eq i32 %indvar, 1
  br i1 %21, label %._crit_edge5.us, label %.lr.ph.us.preheader40

.lr.ph.us.preheader40:                            ; preds = %.lr.ph.us.prol.loopexit
  %wide.trip.count.1 = zext i32 %indvars.iv20 to i64
  br label %.lr.ph.us

._crit_edge5.us.loopexit:                         ; preds = %.lr.ph.us
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %._crit_edge5.us.loopexit, %.lr.ph.us.prol.loopexit, %._crit_edge.us
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv26, i64 %indvars.iv26
  store double 1.000000e+00, double* %22, align 8
  %23 = trunc i64 %indvars.iv26 to i32
  br label %24

; <label>:24:                                     ; preds = %24, %._crit_edge5.us
  %indvars.iv22 = phi i64 [ 0, %._crit_edge5.us ], [ %indvars.iv.next23, %24 ]
  %25 = trunc i64 %indvars.iv22 to i32
  %26 = sub i32 %1, %25
  %27 = add i32 %26, %23
  %28 = srem i32 %27, %1
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, %12
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv26, i64 %indvars.iv22
  store double %30, double* %31, align 8
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next23, %wide.trip.count24
  br i1 %exitcond25, label %._crit_edge10.us, label %24

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader40, %.lr.ph.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us ], [ %indvars.iv.unr.ph, %.lr.ph.us.preheader40 ]
  %32 = add nsw i64 %indvars.iv26, %indvars.iv
  %33 = trunc i64 %32 to i32
  %34 = srem i32 %33, %0
  %35 = sitofp i32 %34 to double
  %36 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv26, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %37 = add nsw i64 %indvars.iv26, %indvars.iv.next
  %38 = trunc i64 %37 to i32
  %39 = srem i32 %38, %0
  %40 = sitofp i32 %39 to double
  %41 = insertelement <2 x double> undef, double %35, i32 0
  %42 = insertelement <2 x double> %41, double %40, i32 1
  %43 = fdiv <2 x double> %42, %14
  %44 = bitcast double* %36 to <2 x double>*
  store <2 x double> %43, <2 x double>* %44, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge5.us.loopexit, label %.lr.ph.us

._crit_edge10.us:                                 ; preds = %24
  %indvars.iv.next27 = add nsw i64 %indvars.iv26, 1
  %indvars.iv.next21 = add i32 %indvars.iv20, 1
  %45 = icmp slt i64 %indvars.iv.next27, %8
  %indvar.next = add nuw i32 %indvar, 1
  br i1 %45, label %._crit_edge.us, label %.loopexit.loopexit

._crit_edge:                                      ; preds = %._crit_edge.preheader, %._crit_edge5
  %indvar36 = phi i32 [ %indvar.next37, %._crit_edge5 ], [ 0, %._crit_edge.preheader ]
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %._crit_edge5 ], [ 0, %._crit_edge.preheader ]
  %indvars.iv30 = phi i32 [ %indvars.iv.next31, %._crit_edge5 ], [ 0, %._crit_edge.preheader ]
  %46 = icmp sgt i64 %indvars.iv34, 0
  br i1 %46, label %.lr.ph.preheader, label %._crit_edge5

.lr.ph.preheader:                                 ; preds = %._crit_edge
  %xtraiter38 = and i32 %indvar36, 1
  %lcmp.mod39 = icmp eq i32 %xtraiter38, 0
  br i1 %lcmp.mod39, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %47 = trunc i64 %indvars.iv34 to i32
  %48 = srem i32 %47, %0
  %49 = sitofp i32 %48 to double
  %50 = fdiv double %49, %9
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv34, i64 0
  store double %50, double* %51, align 8
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.preheader, %.lr.ph.prol
  %indvars.iv28.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader ]
  %52 = icmp eq i32 %indvar36, 1
  br i1 %52, label %._crit_edge5, label %.lr.ph.preheader41

.lr.ph.preheader41:                               ; preds = %.lr.ph.prol.loopexit
  %wide.trip.count32.1 = zext i32 %indvars.iv30 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader41, %.lr.ph
  %indvars.iv28 = phi i64 [ %indvars.iv.next29.1, %.lr.ph ], [ %indvars.iv28.unr.ph, %.lr.ph.preheader41 ]
  %53 = add nsw i64 %indvars.iv34, %indvars.iv28
  %54 = trunc i64 %53 to i32
  %55 = srem i32 %54, %0
  %56 = sitofp i32 %55 to double
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv34, i64 %indvars.iv28
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %58 = add nsw i64 %indvars.iv34, %indvars.iv.next29
  %59 = trunc i64 %58 to i32
  %60 = srem i32 %59, %0
  %61 = sitofp i32 %60 to double
  %62 = insertelement <2 x double> undef, double %56, i32 0
  %63 = insertelement <2 x double> %62, double %61, i32 1
  %64 = fdiv <2 x double> %63, %11
  %65 = bitcast double* %57 to <2 x double>*
  store <2 x double> %64, <2 x double>* %65, align 8
  %indvars.iv.next29.1 = add nuw nsw i64 %indvars.iv28, 2
  %exitcond33.1 = icmp eq i64 %indvars.iv.next29.1, %wide.trip.count32.1
  br i1 %exitcond33.1, label %._crit_edge5.loopexit, label %.lr.ph

._crit_edge5.loopexit:                            ; preds = %.lr.ph
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit, %.lr.ph.prol.loopexit, %._crit_edge
  %66 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv34, i64 %indvars.iv34
  store double 1.000000e+00, double* %66, align 8
  %indvars.iv.next35 = add nsw i64 %indvars.iv34, 1
  %indvars.iv.next31 = add i32 %indvars.iv30, 1
  %67 = icmp slt i64 %indvars.iv.next35, %8
  %indvar.next37 = add nuw i32 %indvar36, 1
  br i1 %67, label %._crit_edge, label %.loopexit.loopexit45

.loopexit.loopexit:                               ; preds = %._crit_edge10.us
  br label %.loopexit

.loopexit.loopexit45:                             ; preds = %._crit_edge5
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit45, %.loopexit.loopexit, %5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(i32, i32, double, [1000 x double]*, [1200 x double]*) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %._crit_edge.lr.ph, label %.loopexit

._crit_edge.lr.ph:                                ; preds = %5
  %wide.trip.count23 = zext i32 %1 to i64
  %7 = icmp sgt i32 %1, 0
  %wide.trip.count.1 = sext i32 %0 to i64
  br i1 %7, label %._crit_edge.us.preheader, label %.loopexit

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  %8 = add i32 %0, -1
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %.._crit_edge4_crit_edge.us
  %indvars.iv25 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next26, %.._crit_edge4_crit_edge.us ]
  %9 = phi i32 [ 0, %._crit_edge.us.preheader ], [ %10, %.._crit_edge4_crit_edge.us ]
  %indvars.iv.next26 = add nsw i64 %indvars.iv25, 1
  %10 = add nsw i32 %9, 1
  %11 = trunc i64 %indvars.iv.next26 to i32
  br label %._crit_edge3.us

._crit_edge3.us:                                  ; preds = %._crit_edge6.us, %._crit_edge.us
  %indvars.iv21 = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next22, %._crit_edge6.us ]
  %12 = phi i32 [ %11, %._crit_edge.us ], [ %10, %._crit_edge6.us ]
  %13 = icmp slt i32 %12, %0
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 %indvars.iv21
  br i1 %13, label %.lr.ph.us, label %._crit_edge6.us

._crit_edge6.us.loopexit:                         ; preds = %.lr.ph.us.new
  br label %._crit_edge6.us

._crit_edge6.us:                                  ; preds = %._crit_edge6.us.loopexit, %._crit_edge3.us, %.prol.loopexit
  %15 = load double, double* %14, align 8
  %16 = fmul double %15, %2
  store double %16, double* %14, align 8
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next22, %wide.trip.count23
  br i1 %exitcond24, label %.._crit_edge4_crit_edge.us, label %._crit_edge3.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new.preheader, %.lr.ph.us.new
  %17 = phi double [ %29, %.lr.ph.us.new ], [ %.pre, %.lr.ph.us.new.preheader ]
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.new ], [ %indvars.iv.unr.ph, %.lr.ph.us.new.preheader ]
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv, i64 %indvars.iv25
  %19 = load double, double* %18, align 8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv, i64 %indvars.iv21
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = fadd double %17, %22
  store double %23, double* %14, align 8
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %24 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv25
  %25 = load double, double* %24, align 8
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next, i64 %indvars.iv21
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = fadd double %23, %28
  store double %29, double* %14, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge6.us.loopexit, label %.lr.ph.us.new

.lr.ph.us:                                        ; preds = %._crit_edge3.us
  %30 = sext i32 %12 to i64
  %31 = sub i32 %0, %12
  %xtraiter = and i32 %31, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %32

; <label>:32:                                     ; preds = %.lr.ph.us
  %33 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %30, i64 %indvars.iv25
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %30, i64 %indvars.iv21
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = load double, double* %14, align 8
  %39 = fadd double %38, %37
  store double %39, double* %14, align 8
  %indvars.iv.next.prol = add nsw i64 %30, 1
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us, %32
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %32 ], [ %30, %.lr.ph.us ]
  %40 = icmp eq i32 %8, %12
  br i1 %40, label %._crit_edge6.us, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  %.pre = load double, double* %14, align 8
  br label %.lr.ph.us.new

.._crit_edge4_crit_edge.us:                       ; preds = %._crit_edge6.us
  %41 = icmp slt i64 %indvars.iv.next26, %wide.trip.count.1
  br i1 %41, label %._crit_edge.us, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %.._crit_edge4_crit_edge.us
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge.lr.ph, %5
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]*) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %._crit_edge.lr.ph, label %.loopexit

._crit_edge.lr.ph:                                ; preds = %3
  %wide.trip.count = zext i32 %1 to i64
  %9 = icmp sgt i32 %1, 0
  %10 = sext i32 %0 to i64
  br i1 %9, label %._crit_edge.us.preheader, label %.loopexit

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge4.us
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %._crit_edge4.us ], [ 0, %._crit_edge.us.preheader ]
  %11 = mul nsw i64 %10, %indvars.iv13
  br label %12

; <label>:12:                                     ; preds = %._crit_edge2.us, %._crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next, %._crit_edge2.us ]
  %13 = add nsw i64 %11, %indvars.iv
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %._crit_edge2.us

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #5
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %12, %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv13, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge4.us, label %12

._crit_edge4.us:                                  ; preds = %._crit_edge2.us
  %indvars.iv.next14 = add nsw i64 %indvars.iv13, 1
  %23 = icmp slt i64 %indvars.iv.next14, %10
  br i1 %23, label %._crit_edge.us, label %.loopexit.loopexit

.loopexit.loopexit:                               ; preds = %._crit_edge4.us
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge.lr.ph, %3
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %26) #5
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
