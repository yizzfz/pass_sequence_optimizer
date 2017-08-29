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
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
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
  br i1 %6, label %.preheader.lr.ph, label %._crit_edge44

.preheader.lr.ph:                                 ; preds = %5
  %wide.trip.count23 = zext i32 %1 to i64
  %7 = icmp sgt i32 %1, 0
  %8 = sext i32 %0 to i64
  %9 = sitofp i32 %0 to double
  br i1 %7, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  br label %.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %10 = sitofp i32 %1 to double
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge9.us, %.preheader.us.preheader
  %indvars.iv38 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next39, %._crit_edge9.us ]
  %11 = icmp sgt i64 %indvars.iv38, 0
  br i1 %11, label %.lr.ph.us.preheader, label %._crit_edge.us

.lr.ph.us.preheader:                              ; preds = %.preheader.us
  %xtraiter = and i64 %indvars.iv38, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.us.prol.loopexit.unr-lcssa, label %.lr.ph.us.prol.preheader

.lr.ph.us.prol.preheader:                         ; preds = %.lr.ph.us.preheader
  br label %.lr.ph.us.prol

.lr.ph.us.prol:                                   ; preds = %.lr.ph.us.prol.preheader
  %12 = trunc i64 %indvars.iv38 to i32
  %13 = srem i32 %12, %0
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, %9
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv38, i64 0
  store double %15, double* %16, align 8
  br label %.lr.ph.us.prol.loopexit.unr-lcssa

.lr.ph.us.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph.us.preheader, %.lr.ph.us.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %.lr.ph.us.prol ], [ 0, %.lr.ph.us.preheader ]
  br label %.lr.ph.us.prol.loopexit

.lr.ph.us.prol.loopexit:                          ; preds = %.lr.ph.us.prol.loopexit.unr-lcssa
  %17 = icmp eq i64 %indvars.iv38, 1
  br i1 %17, label %._crit_edge.us.loopexit, label %.lr.ph.us.preheader.new

.lr.ph.us.preheader.new:                          ; preds = %.lr.ph.us.prol.loopexit
  br label %.lr.ph.us

._crit_edge.us.loopexit.unr-lcssa:                ; preds = %.lr.ph.us
  br label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %.lr.ph.us.prol.loopexit, %._crit_edge.us.loopexit.unr-lcssa
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.preheader.us
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv38, i64 %indvars.iv38
  store double 1.000000e+00, double* %18, align 8
  %19 = trunc i64 %indvars.iv38 to i32
  br label %._crit_edge45

._crit_edge45:                                    ; preds = %._crit_edge45, %._crit_edge.us
  %indvars.iv21 = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next22, %._crit_edge45 ]
  %20 = trunc i64 %indvars.iv21 to i32
  %21 = sub i32 %1, %20
  %22 = add i32 %21, %19
  %23 = srem i32 %22, %1
  %24 = sitofp i32 %23 to double
  %25 = fdiv double %24, %10
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv38, i64 %indvars.iv21
  store double %25, double* %26, align 8
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next22, %wide.trip.count23
  br i1 %exitcond24, label %._crit_edge9.us, label %._crit_edge45

.lr.ph.us:                                        ; preds = %.lr.ph.us, %.lr.ph.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.us.preheader.new ], [ %indvars.iv.next.1, %.lr.ph.us ]
  %27 = add nuw nsw i64 %indvars.iv38, %indvars.iv
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, %0
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, %9
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv38, i64 %indvars.iv
  store double %31, double* %32, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %33 = add nuw nsw i64 %indvars.iv38, %indvars.iv.next
  %34 = trunc i64 %33 to i32
  %35 = srem i32 %34, %0
  %36 = sitofp i32 %35 to double
  %37 = fdiv double %36, %9
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv38, i64 %indvars.iv.next
  store double %37, double* %38, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv38
  br i1 %exitcond.1, label %._crit_edge.us.loopexit.unr-lcssa, label %.lr.ph.us

._crit_edge9.us:                                  ; preds = %._crit_edge45
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next39, %8
  br i1 %exitcond40, label %._crit_edge44.loopexit, label %.preheader.us

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %._crit_edge ], [ 0, %.preheader.preheader ]
  %39 = icmp sgt i64 %indvars.iv41, 0
  br i1 %39, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  %xtraiter47 = and i64 %indvars.iv41, 1
  %lcmp.mod48 = icmp eq i64 %xtraiter47, 0
  br i1 %lcmp.mod48, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader
  %40 = trunc i64 %indvars.iv41 to i32
  %41 = srem i32 %40, %0
  %42 = sitofp i32 %41 to double
  %43 = fdiv double %42, %9
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv41, i64 0
  store double %43, double* %44, align 8
  br label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.preheader, %.lr.ph.prol
  %indvars.iv27.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader ]
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.unr-lcssa
  %45 = icmp eq i64 %indvars.iv41, 1
  br i1 %45, label %._crit_edge.loopexit, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %indvars.iv27 = phi i64 [ %indvars.iv27.unr.ph, %.lr.ph.preheader.new ], [ %indvars.iv.next28.1, %.lr.ph ]
  %46 = add nuw nsw i64 %indvars.iv41, %indvars.iv27
  %47 = trunc i64 %46 to i32
  %48 = srem i32 %47, %0
  %49 = sitofp i32 %48 to double
  %50 = fdiv double %49, %9
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv41, i64 %indvars.iv27
  store double %50, double* %51, align 8
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %52 = add nuw nsw i64 %indvars.iv41, %indvars.iv.next28
  %53 = trunc i64 %52 to i32
  %54 = srem i32 %53, %0
  %55 = sitofp i32 %54 to double
  %56 = fdiv double %55, %9
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv41, i64 %indvars.iv.next28
  store double %56, double* %57, align 8
  %indvars.iv.next28.1 = add nsw i64 %indvars.iv27, 2
  %exitcond32.1 = icmp eq i64 %indvars.iv.next28.1, %indvars.iv41
  br i1 %exitcond32.1, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv41, i64 %indvars.iv41
  store double 1.000000e+00, double* %58, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next42, %8
  br i1 %exitcond43, label %._crit_edge44.loopexit46, label %.preheader

._crit_edge44.loopexit:                           ; preds = %._crit_edge9.us
  br label %._crit_edge44

._crit_edge44.loopexit46:                         ; preds = %._crit_edge
  br label %._crit_edge44

._crit_edge44:                                    ; preds = %._crit_edge44.loopexit46, %._crit_edge44.loopexit, %5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(i32, i32, double, [1000 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader3.lr.ph, label %._crit_edge

.preheader3.lr.ph:                                ; preds = %5
  %wide.trip.count21 = zext i32 %1 to i64
  %7 = icmp sgt i32 %1, 0
  %wide.trip.count.1 = sext i32 %0 to i64
  br i1 %7, label %.preheader3.us.preheader, label %._crit_edge

.preheader3.us.preheader:                         ; preds = %.preheader3.lr.ph
  %8 = add i32 %0, -1
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %..loopexit_crit_edge.us, %.preheader3.us.preheader
  %indvars.iv22 = phi i64 [ 0, %.preheader3.us.preheader ], [ %indvars.iv.next23, %..loopexit_crit_edge.us ]
  %9 = phi i32 [ 0, %.preheader3.us.preheader ], [ %10, %..loopexit_crit_edge.us ]
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %10 = add nuw nsw i32 %9, 1
  %11 = trunc i64 %indvars.iv.next23 to i32
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader3.us
  %indvars.iv19 = phi i64 [ 0, %.preheader3.us ], [ %indvars.iv.next20, %._crit_edge.us ]
  %12 = phi i32 [ %11, %.preheader3.us ], [ %10, %._crit_edge.us ]
  %13 = icmp slt i32 %12, %0
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv22, i64 %indvars.iv19
  br i1 %13, label %.lr.ph.us, label %._crit_edge.us

._crit_edge.us.loopexit:                          ; preds = %.lr.ph.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit, %.preheader.us
  %15 = load double, double* %14, align 8
  %16 = fmul double %15, %2
  store double %16, double* %14, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond = icmp eq i64 %indvars.iv.next20, %wide.trip.count21
  br i1 %exitcond, label %..loopexit_crit_edge.us, label %.preheader.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new, %.lr.ph.us.new.preheader
  %17 = phi double [ %.pre, %.lr.ph.us.new.preheader ], [ %29, %.lr.ph.us.new ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.us.new.preheader ], [ %indvars.iv.next.1, %.lr.ph.us.new ]
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv, i64 %indvars.iv22
  %19 = load double, double* %18, align 8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv, i64 %indvars.iv19
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = fadd double %17, %22
  store double %23, double* %14, align 8
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %24 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv22
  %25 = load double, double* %24, align 8
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next, i64 %indvars.iv19
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = fadd double %23, %28
  store double %29, double* %14, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph.us.new

.lr.ph.us:                                        ; preds = %.preheader.us
  %30 = sext i32 %12 to i64
  %31 = sub i32 %0, %12
  %xtraiter = and i32 %31, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %30, i64 %indvars.iv22
  %33 = load double, double* %32, align 8
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %30, i64 %indvars.iv19
  %35 = load double, double* %34, align 8
  %36 = fmul double %33, %35
  %37 = load double, double* %14, align 8
  %38 = fadd double %37, %36
  store double %38, double* %14, align 8
  %indvars.iv.next.prol = add nsw i64 %30, 1
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ %30, %.lr.ph.us ]
  %39 = icmp eq i32 %8, %12
  br i1 %39, label %._crit_edge.us, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  %.pre = load double, double* %14, align 8
  br label %.lr.ph.us.new

..loopexit_crit_edge.us:                          ; preds = %._crit_edge.us
  %exitcond26 = icmp eq i64 %indvars.iv.next23, %wide.trip.count.1
  br i1 %exitcond26, label %._crit_edge.loopexit, label %.preheader3.us

._crit_edge.loopexit:                             ; preds = %..loopexit_crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader3.lr.ph, %5
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.preheader.lr.ph, label %._crit_edge

.preheader.lr.ph:                                 ; preds = %3
  %wide.trip.count = zext i32 %1 to i64
  %9 = icmp sgt i32 %1, 0
  %10 = sext i32 %0 to i64
  br i1 %9, label %.preheader.us.preheader, label %._crit_edge

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv11 = phi i64 [ %indvars.iv.next12, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %11 = mul nsw i64 %10, %indvars.iv11
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge15, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge15 ]
  %12 = add nsw i64 %11, %indvars.iv
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge15

; <label>:16:                                     ; preds = %._crit_edge16
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge16, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge16

._crit_edge.us:                                   ; preds = %._crit_edge15
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next12, %10
  br i1 %exitcond14, label %._crit_edge.loopexit, label %.preheader.us

._crit_edge.loopexit:                             ; preds = %._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader.lr.ph, %3
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
