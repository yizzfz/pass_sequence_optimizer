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
  br i1 %6, label %.preheader.lr.ph, label %._crit_edge43

.preheader.lr.ph:                                 ; preds = %5
  %7 = icmp sgt i32 %1, 0
  %8 = sitofp i32 %0 to double
  %9 = sext i32 %0 to i64
  br i1 %7, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  br label %.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %10 = sitofp i32 %1 to double
  %wide.trip.count23 = zext i32 %1 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge9.us, %.preheader.us.preheader
  %indvars.iv37 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next38, %._crit_edge9.us ]
  %11 = icmp sgt i64 %indvars.iv37, 0
  br i1 %11, label %.lr.ph.us.preheader, label %._crit_edge.us

.lr.ph.us.preheader:                              ; preds = %.preheader.us
  %xtraiter = and i64 %indvars.iv37, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.us.prol.loopexit.unr-lcssa, label %.lr.ph.us.prol.preheader

.lr.ph.us.prol.preheader:                         ; preds = %.lr.ph.us.preheader
  br label %.lr.ph.us.prol

.lr.ph.us.prol:                                   ; preds = %.lr.ph.us.prol.preheader
  %12 = trunc i64 %indvars.iv37 to i32
  %13 = srem i32 %12, %0
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, %8
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv37, i64 0
  store double %15, double* %16, align 8
  br label %.lr.ph.us.prol.loopexit.unr-lcssa

.lr.ph.us.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph.us.preheader, %.lr.ph.us.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %.lr.ph.us.prol ], [ 0, %.lr.ph.us.preheader ]
  br label %.lr.ph.us.prol.loopexit

.lr.ph.us.prol.loopexit:                          ; preds = %.lr.ph.us.prol.loopexit.unr-lcssa
  %17 = icmp eq i64 %indvars.iv37, 1
  br i1 %17, label %._crit_edge.us.loopexit, label %.lr.ph.us.preheader.new

.lr.ph.us.preheader.new:                          ; preds = %.lr.ph.us.prol.loopexit
  br label %.lr.ph.us

._crit_edge.us.loopexit.unr-lcssa:                ; preds = %.lr.ph.us
  br label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %.lr.ph.us.prol.loopexit, %._crit_edge.us.loopexit.unr-lcssa
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.preheader.us
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv37, i64 %indvars.iv37
  store double 1.000000e+00, double* %18, align 8
  %19 = trunc i64 %indvars.iv37 to i32
  br label %._crit_edge44

._crit_edge44:                                    ; preds = %._crit_edge44, %._crit_edge.us
  %indvars.iv21 = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next22, %._crit_edge44 ]
  %20 = trunc i64 %indvars.iv21 to i32
  %21 = sub i32 %1, %20
  %22 = add i32 %21, %19
  %23 = srem i32 %22, %1
  %24 = sitofp i32 %23 to double
  %25 = fdiv double %24, %10
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv37, i64 %indvars.iv21
  store double %25, double* %26, align 8
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next22, %wide.trip.count23
  br i1 %exitcond24, label %._crit_edge9.us, label %._crit_edge44

.lr.ph.us:                                        ; preds = %.lr.ph.us, %.lr.ph.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.us.preheader.new ], [ %indvars.iv.next.1, %.lr.ph.us ]
  %27 = add nuw nsw i64 %indvars.iv37, %indvars.iv
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, %0
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, %8
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv37, i64 %indvars.iv
  store double %31, double* %32, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %33 = add nuw nsw i64 %indvars.iv37, %indvars.iv.next
  %34 = trunc i64 %33 to i32
  %35 = srem i32 %34, %0
  %36 = sitofp i32 %35 to double
  %37 = fdiv double %36, %8
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv37, i64 %indvars.iv.next
  store double %37, double* %38, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv37
  br i1 %exitcond.1, label %._crit_edge.us.loopexit.unr-lcssa, label %.lr.ph.us

._crit_edge9.us:                                  ; preds = %._crit_edge44
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next38, %9
  br i1 %exitcond39, label %._crit_edge43.loopexit, label %.preheader.us

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %._crit_edge ], [ 0, %.preheader.preheader ]
  %39 = icmp sgt i64 %indvars.iv40, 0
  br i1 %39, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  %xtraiter46 = and i64 %indvars.iv40, 1
  %lcmp.mod47 = icmp eq i64 %xtraiter46, 0
  br i1 %lcmp.mod47, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader
  %40 = trunc i64 %indvars.iv40 to i32
  %41 = srem i32 %40, %0
  %42 = sitofp i32 %41 to double
  %43 = fdiv double %42, %8
  %44 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv40, i64 0
  store double %43, double* %44, align 8
  br label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.preheader, %.lr.ph.prol
  %indvars.iv27.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader ]
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.unr-lcssa
  %45 = icmp eq i64 %indvars.iv40, 1
  br i1 %45, label %._crit_edge.loopexit, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %indvars.iv27 = phi i64 [ %indvars.iv27.unr.ph, %.lr.ph.preheader.new ], [ %indvars.iv.next28.1, %.lr.ph ]
  %46 = add nuw nsw i64 %indvars.iv40, %indvars.iv27
  %47 = trunc i64 %46 to i32
  %48 = srem i32 %47, %0
  %49 = sitofp i32 %48 to double
  %50 = fdiv double %49, %8
  %51 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv40, i64 %indvars.iv27
  store double %50, double* %51, align 8
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %52 = add nuw nsw i64 %indvars.iv40, %indvars.iv.next28
  %53 = trunc i64 %52 to i32
  %54 = srem i32 %53, %0
  %55 = sitofp i32 %54 to double
  %56 = fdiv double %55, %8
  %57 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv40, i64 %indvars.iv.next28
  store double %56, double* %57, align 8
  %indvars.iv.next28.1 = add nsw i64 %indvars.iv27, 2
  %exitcond32.1 = icmp eq i64 %indvars.iv.next28.1, %indvars.iv40
  br i1 %exitcond32.1, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %58 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv40, i64 %indvars.iv40
  store double 1.000000e+00, double* %58, align 8
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next41, %9
  br i1 %exitcond42, label %._crit_edge43.loopexit45, label %.preheader

._crit_edge43.loopexit:                           ; preds = %._crit_edge9.us
  br label %._crit_edge43

._crit_edge43.loopexit45:                         ; preds = %._crit_edge
  br label %._crit_edge43

._crit_edge43:                                    ; preds = %._crit_edge43.loopexit45, %._crit_edge43.loopexit, %5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(i32, i32, double, [1000 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  %7 = icmp sgt i32 %1, 0
  %or.cond = and i1 %6, %7
  br i1 %or.cond, label %.preheader3.us.preheader, label %._crit_edge

.preheader3.us.preheader:                         ; preds = %5
  %8 = add i32 %0, -2
  %9 = add i32 %0, 1
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %._crit_edge7.us..preheader3.us_crit_edge, %.preheader3.us.preheader
  %indvars.iv31 = phi i64 [ 0, %.preheader3.us.preheader ], [ %12, %._crit_edge7.us..preheader3.us_crit_edge ]
  %indvar = phi i32 [ 0, %.preheader3.us.preheader ], [ %indvar.next, %._crit_edge7.us..preheader3.us_crit_edge ]
  %indvars.iv23.in = phi i64 [ 1, %.preheader3.us.preheader ], [ %indvars.iv23, %._crit_edge7.us..preheader3.us_crit_edge ]
  %indvars.iv23 = add nuw nsw i64 %indvars.iv23.in, 1
  %11 = sub i32 %9, %indvar
  %12 = add nuw nsw i64 %indvars.iv31, 1
  %13 = icmp slt i64 %12, %10
  %xtraiter = and i32 %11, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %14 = icmp eq i32 %8, %indvar
  %15 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv23.in, i64 %indvars.iv31
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader3.us
  %indvars.iv27 = phi i64 [ 0, %.preheader3.us ], [ %indvars.iv.next28, %._crit_edge.us ]
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv27
  br i1 %13, label %.lr.ph.us, label %._crit_edge.us

._crit_edge.us.loopexit:                          ; preds = %.lr.ph.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit, %.preheader.us
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, %2
  store double %18, double* %16, align 8
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond = icmp eq i64 %indvars.iv.next28, %wide.trip.count
  br i1 %exitcond, label %._crit_edge7.us, label %.preheader.us

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new, %.lr.ph.us.new.preheader
  %19 = phi double [ %.pre, %.lr.ph.us.new.preheader ], [ %31, %.lr.ph.us.new ]
  %indvars.iv21 = phi i64 [ %indvars.iv21.unr.ph, %.lr.ph.us.new.preheader ], [ %indvars.iv.next22.1, %.lr.ph.us.new ]
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv21, i64 %indvars.iv31
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv21, i64 %indvars.iv27
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = fadd double %19, %24
  store double %25, double* %16, align 8
  %indvars.iv.next22 = add nsw i64 %indvars.iv21, 1
  %26 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next22, i64 %indvars.iv31
  %27 = load double, double* %26, align 8
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next22, i64 %indvars.iv27
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = fadd double %25, %30
  store double %31, double* %16, align 8
  %indvars.iv.next22.1 = add nsw i64 %indvars.iv21, 2
  %lftr.wideiv.1 = trunc i64 %indvars.iv.next22.1 to i32
  %exitcond.1 = icmp eq i32 %lftr.wideiv.1, %0
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph.us.new

.lr.ph.us:                                        ; preds = %.preheader.us
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us
  %32 = load double, double* %15, align 8
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv23.in, i64 %indvars.iv27
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = load double, double* %16, align 8
  %37 = fadd double %36, %35
  store double %37, double* %16, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us, %.prol.preheader
  %indvars.iv21.unr.ph = phi i64 [ %indvars.iv23, %.prol.preheader ], [ %indvars.iv23.in, %.lr.ph.us ]
  br i1 %14, label %._crit_edge.us, label %.lr.ph.us.new.preheader

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  %.pre = load double, double* %16, align 8
  br label %.lr.ph.us.new

._crit_edge7.us:                                  ; preds = %._crit_edge.us
  %exitcond36 = icmp eq i64 %12, %10
  br i1 %exitcond36, label %._crit_edge.loopexit, label %._crit_edge7.us..preheader3.us_crit_edge

._crit_edge7.us..preheader3.us_crit_edge:         ; preds = %._crit_edge7.us
  %indvar.next = add nuw nsw i32 %indvar, 1
  br label %.preheader3.us

._crit_edge.loopexit:                             ; preds = %._crit_edge7.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %5
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
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge

.preheader.us.preheader:                          ; preds = %3
  %10 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %1 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv11 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next12, %._crit_edge.us ]
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

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
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
