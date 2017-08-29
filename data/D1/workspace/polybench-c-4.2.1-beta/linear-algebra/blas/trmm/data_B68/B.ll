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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %4 to [1000 x double]*
  %7 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %3, [1000 x double]* %6, [1200 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  %9 = bitcast i8* %4 to [1000 x double]*
  %10 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @kernel_trmm(i32 1000, i32 1200, double %8, [1000 x double]* %9, [1200 x double]* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.lr.ph10, label %._crit_edge34

.lr.ph10:                                         ; preds = %5
  %7 = sitofp i32 %0 to double
  %8 = icmp sgt i32 %1, 0
  %9 = sext i32 %0 to i64
  br i1 %8, label %.lr.ph10.split.us.preheader, label %.lr.ph10.split.preheader

.lr.ph10.split.preheader:                         ; preds = %.lr.ph10
  br label %.lr.ph10.split

.lr.ph10.split.us.preheader:                      ; preds = %.lr.ph10
  %10 = sitofp i32 %1 to double
  %wide.trip.count21 = zext i32 %1 to i64
  br label %.lr.ph10.split.us

.lr.ph10.split.us:                                ; preds = %._crit_edge5.us..lr.ph10.split.us_crit_edge, %.lr.ph10.split.us.preheader
  %indvars.iv23 = phi i64 [ 0, %.lr.ph10.split.us.preheader ], [ %indvars.iv.next24, %._crit_edge5.us..lr.ph10.split.us_crit_edge ]
  %indvars.iv17 = phi i32 [ 0, %.lr.ph10.split.us.preheader ], [ %indvars.iv.next18, %._crit_edge5.us..lr.ph10.split.us_crit_edge ]
  %11 = and i64 %indvars.iv23, 4294967295
  %12 = icmp sgt i64 %indvars.iv23, 0
  br i1 %12, label %.lr.ph.us.preheader, label %._crit_edge.us

.lr.ph.us.preheader:                              ; preds = %.lr.ph10.split.us
  %wide.trip.count = zext i32 %indvars.iv17 to i64
  %xtraiter = and i64 %indvars.iv23, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.us.prol.loopexit.unr-lcssa, label %.lr.ph.us.prol.preheader

.lr.ph.us.prol.preheader:                         ; preds = %.lr.ph.us.preheader
  br label %.lr.ph.us.prol

.lr.ph.us.prol:                                   ; preds = %.lr.ph.us.prol.preheader
  %13 = trunc i64 %indvars.iv23 to i32
  %14 = srem i32 %13, %0
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, %7
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv23, i64 0
  store double %16, double* %17, align 8
  br label %.lr.ph.us.prol.loopexit.unr-lcssa

.lr.ph.us.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph.us.preheader, %.lr.ph.us.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %.lr.ph.us.prol ], [ 0, %.lr.ph.us.preheader ]
  br label %.lr.ph.us.prol.loopexit

.lr.ph.us.prol.loopexit:                          ; preds = %.lr.ph.us.prol.loopexit.unr-lcssa
  %18 = icmp eq i64 %11, 1
  br i1 %18, label %._crit_edge.us.loopexit, label %.lr.ph.us.preheader.new

.lr.ph.us.preheader.new:                          ; preds = %.lr.ph.us.prol.loopexit
  br label %.lr.ph.us

._crit_edge.us.loopexit.unr-lcssa:                ; preds = %.lr.ph.us
  br label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %.lr.ph.us.prol.loopexit, %._crit_edge.us.loopexit.unr-lcssa
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.lr.ph10.split.us
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv23, i64 %indvars.iv23
  store double 1.000000e+00, double* %19, align 8
  %20 = trunc i64 %indvars.iv23 to i32
  br label %._crit_edge36

._crit_edge36:                                    ; preds = %._crit_edge36, %._crit_edge.us
  %indvars.iv19 = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next20, %._crit_edge36 ]
  %21 = trunc i64 %indvars.iv19 to i32
  %22 = sub i32 %1, %21
  %23 = add i32 %22, %20
  %24 = srem i32 %23, %1
  %25 = sitofp i32 %24 to double
  %26 = fdiv double %25, %10
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv23, i64 %indvars.iv19
  store double %26, double* %27, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next20, %wide.trip.count21
  br i1 %exitcond22, label %._crit_edge5.us, label %._crit_edge36

.lr.ph.us:                                        ; preds = %.lr.ph.us, %.lr.ph.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.us.preheader.new ], [ %indvars.iv.next.1, %.lr.ph.us ]
  %28 = add nsw i64 %indvars.iv23, %indvars.iv
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, %0
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %31, %7
  %33 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv23, i64 %indvars.iv
  store double %32, double* %33, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %34 = add nsw i64 %indvars.iv23, %indvars.iv.next
  %35 = trunc i64 %34 to i32
  %36 = srem i32 %35, %0
  %37 = sitofp i32 %36 to double
  %38 = fdiv double %37, %7
  %39 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv23, i64 %indvars.iv.next
  store double %38, double* %39, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %._crit_edge.us.loopexit.unr-lcssa, label %.lr.ph.us

._crit_edge5.us:                                  ; preds = %._crit_edge36
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %40 = icmp slt i64 %indvars.iv.next24, %9
  br i1 %40, label %._crit_edge5.us..lr.ph10.split.us_crit_edge, label %._crit_edge34.loopexit

._crit_edge5.us..lr.ph10.split.us_crit_edge:      ; preds = %._crit_edge5.us
  %indvars.iv.next18 = add i32 %indvars.iv17, 1
  br label %.lr.ph10.split.us

.lr.ph10.split:                                   ; preds = %.lr.ph10.split.preheader, %._crit_edge..lr.ph10.split_crit_edge
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %._crit_edge..lr.ph10.split_crit_edge ], [ 0, %.lr.ph10.split.preheader ]
  %indvars.iv27 = phi i32 [ %indvars.iv.next28, %._crit_edge..lr.ph10.split_crit_edge ], [ 0, %.lr.ph10.split.preheader ]
  %41 = and i64 %indvars.iv31, 4294967295
  %42 = icmp sgt i64 %indvars.iv31, 0
  br i1 %42, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.lr.ph10.split
  %wide.trip.count29 = zext i32 %indvars.iv27 to i64
  %xtraiter38 = and i64 %indvars.iv31, 1
  %lcmp.mod39 = icmp eq i64 %xtraiter38, 0
  br i1 %lcmp.mod39, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader
  %43 = trunc i64 %indvars.iv31 to i32
  %44 = srem i32 %43, %0
  %45 = sitofp i32 %44 to double
  %46 = fdiv double %45, %7
  %47 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv31, i64 0
  store double %46, double* %47, align 8
  br label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.preheader, %.lr.ph.prol
  %indvars.iv25.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader ]
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.unr-lcssa
  %48 = icmp eq i64 %41, 1
  br i1 %48, label %._crit_edge.loopexit, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %indvars.iv25 = phi i64 [ %indvars.iv25.unr.ph, %.lr.ph.preheader.new ], [ %indvars.iv.next26.1, %.lr.ph ]
  %49 = add nsw i64 %indvars.iv31, %indvars.iv25
  %50 = trunc i64 %49 to i32
  %51 = srem i32 %50, %0
  %52 = sitofp i32 %51 to double
  %53 = fdiv double %52, %7
  %54 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv31, i64 %indvars.iv25
  store double %53, double* %54, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %55 = add nsw i64 %indvars.iv31, %indvars.iv.next26
  %56 = trunc i64 %55 to i32
  %57 = srem i32 %56, %0
  %58 = sitofp i32 %57 to double
  %59 = fdiv double %58, %7
  %60 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv31, i64 %indvars.iv.next26
  store double %59, double* %60, align 8
  %indvars.iv.next26.1 = add nsw i64 %indvars.iv25, 2
  %exitcond30.1 = icmp eq i64 %indvars.iv.next26.1, %wide.trip.count29
  br i1 %exitcond30.1, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph10.split
  %61 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv31, i64 %indvars.iv31
  store double 1.000000e+00, double* %61, align 8
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %62 = icmp slt i64 %indvars.iv.next32, %9
  br i1 %62, label %._crit_edge..lr.ph10.split_crit_edge, label %._crit_edge34.loopexit37

._crit_edge..lr.ph10.split_crit_edge:             ; preds = %._crit_edge
  %indvars.iv.next28 = add i32 %indvars.iv27, 1
  br label %.lr.ph10.split

._crit_edge34.loopexit:                           ; preds = %._crit_edge5.us
  br label %._crit_edge34

._crit_edge34.loopexit37:                         ; preds = %._crit_edge
  br label %._crit_edge34

._crit_edge34:                                    ; preds = %._crit_edge34.loopexit37, %._crit_edge34.loopexit, %5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(i32, i32, double, [1000 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  %7 = icmp sgt i32 %1, 0
  %or.cond = and i1 %6, %7
  br i1 %or.cond, label %.lr.ph10.split.us.preheader, label %._crit_edge

.lr.ph10.split.us.preheader:                      ; preds = %5
  %8 = add i32 %0, -1
  %9 = sext i32 %0 to i64
  %wide.trip.count22 = zext i32 %1 to i64
  br label %.lr.ph10.split.us

.lr.ph10.split.us:                                ; preds = %._crit_edge4.us, %.lr.ph10.split.us.preheader
  %indvars.iv23 = phi i64 [ 0, %.lr.ph10.split.us.preheader ], [ %indvars.iv.next24, %._crit_edge4.us ]
  %10 = phi i32 [ 0, %.lr.ph10.split.us.preheader ], [ %11, %._crit_edge4.us ]
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %11 = add nuw nsw i32 %10, 1
  %12 = trunc i64 %indvars.iv.next24 to i32
  br label %._crit_edge.us._crit_edge

._crit_edge.us._crit_edge:                        ; preds = %._crit_edge.us, %.lr.ph10.split.us
  %indvars.iv20 = phi i64 [ 0, %.lr.ph10.split.us ], [ %indvars.iv.next21, %._crit_edge.us ]
  %13 = phi i32 [ %12, %.lr.ph10.split.us ], [ %11, %._crit_edge.us ]
  %14 = icmp slt i32 %13, %0
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv23, i64 %indvars.iv20
  br i1 %14, label %.lr.ph.us, label %._crit_edge.us

._crit_edge.us.loopexit:                          ; preds = %.lr.ph.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit, %._crit_edge.us._crit_edge
  %16 = load double, double* %15, align 8
  %17 = fmul double %16, %2
  store double %17, double* %15, align 8
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond = icmp eq i64 %indvars.iv.next21, %wide.trip.count22
  br i1 %exitcond, label %._crit_edge4.us, label %._crit_edge.us._crit_edge

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new, %.prol.loopexit..lr.ph.us.new_crit_edge
  %18 = phi double [ %.pre, %.prol.loopexit..lr.ph.us.new_crit_edge ], [ %30, %.lr.ph.us.new ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.prol.loopexit..lr.ph.us.new_crit_edge ], [ %indvars.iv.next.1, %.lr.ph.us.new ]
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv, i64 %indvars.iv23
  %20 = load double, double* %19, align 8
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv, i64 %indvars.iv20
  %22 = load double, double* %21, align 8
  %23 = fmul double %20, %22
  %24 = fadd double %18, %23
  store double %24, double* %15, align 8
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %25 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv23
  %26 = load double, double* %25, align 8
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next, i64 %indvars.iv20
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = fadd double %24, %29
  store double %30, double* %15, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %9
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph.us.new

.lr.ph.us:                                        ; preds = %._crit_edge.us._crit_edge
  %31 = sext i32 %13 to i64
  %32 = sub i32 %0, %13
  %xtraiter = and i32 %32, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us
  %33 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %31, i64 %indvars.iv23
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %31, i64 %indvars.iv20
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = load double, double* %15, align 8
  %39 = fadd double %38, %37
  store double %39, double* %15, align 8
  %indvars.iv.next.prol = add nsw i64 %31, 1
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ %31, %.lr.ph.us ]
  %40 = icmp eq i32 %8, %13
  br i1 %40, label %._crit_edge.us, label %.prol.loopexit..lr.ph.us.new_crit_edge

.prol.loopexit..lr.ph.us.new_crit_edge:           ; preds = %.prol.loopexit
  %.pre = load double, double* %15, align 8
  br label %.lr.ph.us.new

._crit_edge4.us:                                  ; preds = %._crit_edge.us
  %41 = icmp slt i64 %indvars.iv.next24, %9
  br i1 %41, label %.lr.ph10.split.us, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge4.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %5
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.lr.ph3.split.us.preheader, label %._crit_edge

.lr.ph3.split.us.preheader:                       ; preds = %3
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  br label %.lr.ph3.split.us

.lr.ph3.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph3.split.us.preheader
  %indvars.iv11 = phi i64 [ 0, %.lr.ph3.split.us.preheader ], [ %indvars.iv.next12, %._crit_edge.us ]
  %11 = mul nsw i64 %10, %indvars.iv11
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge13, %.lr.ph3.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph3.split.us ], [ %indvars.iv.next, %._crit_edge13 ]
  %12 = add nsw i64 %11, %indvars.iv
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge13

; <label>:16:                                     ; preds = %._crit_edge15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge15, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge15

._crit_edge.us:                                   ; preds = %._crit_edge13
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %22 = icmp slt i64 %indvars.iv.next12, %10
  br i1 %22, label %.lr.ph3.split.us, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %25) #5
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
