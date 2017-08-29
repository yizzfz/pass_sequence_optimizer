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
  br i1 %11, label %12, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %.._crit_edge_crit_edge2

.._crit_edge_crit_edge2:                          ; preds = %12
  br label %._crit_edge

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge2, %.._crit_edge_crit_edge, %15
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
.lr.ph15:
  store double 1.500000e+00, double* %2, align 8
  br label %.lr.ph15.split.us

.lr.ph15.split.us:                                ; preds = %._crit_edge10.us..lr.ph15.split.us_crit_edge, %.lr.ph15
  %indvars.iv40 = phi i64 [ 0, %.lr.ph15 ], [ %indvars.iv.next41, %._crit_edge10.us..lr.ph15.split.us_crit_edge ]
  %5 = icmp sgt i64 %indvars.iv40, 0
  br i1 %5, label %.lr.ph.us.preheader, label %.lr.ph15.split.us.._crit_edge.us_crit_edge

.lr.ph15.split.us.._crit_edge.us_crit_edge:       ; preds = %.lr.ph15.split.us
  br label %._crit_edge.us

.lr.ph.us.preheader:                              ; preds = %.lr.ph15.split.us
  %xtraiter = and i64 %indvars.iv40, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.us.preheader..lr.ph.us.prol.loopexit.unr-lcssa_crit_edge, label %.lr.ph.us.prol.preheader

.lr.ph.us.preheader..lr.ph.us.prol.loopexit.unr-lcssa_crit_edge: ; preds = %.lr.ph.us.preheader
  br label %.lr.ph.us.prol.loopexit.unr-lcssa

.lr.ph.us.prol.preheader:                         ; preds = %.lr.ph.us.preheader
  br label %.lr.ph.us.prol

.lr.ph.us.prol:                                   ; preds = %.lr.ph.us.prol.preheader
  %6 = trunc i64 %indvars.iv40 to i32
  %7 = srem i32 %6, 1000
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 1.000000e+03
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv40, i64 0
  store double %9, double* %10, align 8
  br label %.lr.ph.us.prol.loopexit.unr-lcssa

.lr.ph.us.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph.us.preheader..lr.ph.us.prol.loopexit.unr-lcssa_crit_edge, %.lr.ph.us.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %.lr.ph.us.prol ], [ 0, %.lr.ph.us.preheader..lr.ph.us.prol.loopexit.unr-lcssa_crit_edge ]
  br label %.lr.ph.us.prol.loopexit

.lr.ph.us.prol.loopexit:                          ; preds = %.lr.ph.us.prol.loopexit.unr-lcssa
  %11 = icmp eq i64 %indvars.iv40, 1
  br i1 %11, label %.lr.ph.us.prol.loopexit.._crit_edge.us.loopexit_crit_edge, label %.lr.ph.us.preheader.new

.lr.ph.us.prol.loopexit.._crit_edge.us.loopexit_crit_edge: ; preds = %.lr.ph.us.prol.loopexit
  br label %._crit_edge.us.loopexit

.lr.ph.us.preheader.new:                          ; preds = %.lr.ph.us.prol.loopexit
  br label %.lr.ph.us

._crit_edge.us.loopexit.unr-lcssa:                ; preds = %.lr.ph.us
  br label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %.lr.ph.us.prol.loopexit.._crit_edge.us.loopexit_crit_edge, %._crit_edge.us.loopexit.unr-lcssa
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.lr.ph15.split.us.._crit_edge.us_crit_edge, %._crit_edge.us.loopexit
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv40, i64 %indvars.iv40
  store double 1.000000e+00, double* %12, align 8
  %13 = trunc i64 %indvars.iv40 to i32
  br label %._crit_edge48

._crit_edge48:                                    ; preds = %._crit_edge48.._crit_edge48_crit_edge, %._crit_edge.us
  %indvars.iv24 = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next25, %._crit_edge48.._crit_edge48_crit_edge ]
  %14 = trunc i64 %indvars.iv24 to i32
  %15 = sub i32 1200, %14
  %16 = add i32 %15, %13
  %17 = srem i32 %16, 1200
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, 1.200000e+03
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv40, i64 %indvars.iv24
  store double %19, double* %20, align 8
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next25, 1200
  br i1 %exitcond27, label %._crit_edge10.us, label %._crit_edge48.._crit_edge48_crit_edge

._crit_edge48.._crit_edge48_crit_edge:            ; preds = %._crit_edge48
  br label %._crit_edge48

.lr.ph.us:                                        ; preds = %.lr.ph.us..lr.ph.us_crit_edge, %.lr.ph.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.us.preheader.new ], [ %indvars.iv.next.1, %.lr.ph.us..lr.ph.us_crit_edge ]
  %21 = add nuw nsw i64 %indvars.iv40, %indvars.iv
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 1000
  %24 = sitofp i32 %23 to double
  %25 = fdiv double %24, 1.000000e+03
  %26 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv40, i64 %indvars.iv
  store double %25, double* %26, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %27 = add nuw nsw i64 %indvars.iv40, %indvars.iv.next
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, 1000
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, 1.000000e+03
  %32 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv40, i64 %indvars.iv.next
  store double %31, double* %32, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv40
  br i1 %exitcond.1, label %._crit_edge.us.loopexit.unr-lcssa, label %.lr.ph.us..lr.ph.us_crit_edge

.lr.ph.us..lr.ph.us_crit_edge:                    ; preds = %.lr.ph.us
  br label %.lr.ph.us

._crit_edge10.us:                                 ; preds = %._crit_edge48
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next41, 1000
  br i1 %exitcond42, label %._crit_edge16, label %._crit_edge10.us..lr.ph15.split.us_crit_edge

._crit_edge10.us..lr.ph15.split.us_crit_edge:     ; preds = %._crit_edge10.us
  br label %.lr.ph15.split.us

._crit_edge16:                                    ; preds = %._crit_edge10.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(i32, i32, double, [1000 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
.lr.ph13:
  br label %.lr.ph13.split.us

.lr.ph13.split.us:                                ; preds = %._crit_edge7.us..lr.ph13.split.us_crit_edge, %.lr.ph13
  %indvars.iv26 = phi i64 [ 0, %.lr.ph13 ], [ %indvars.iv.next27, %._crit_edge7.us..lr.ph13.split.us_crit_edge ]
  %5 = phi i32 [ 0, %.lr.ph13 ], [ %6, %._crit_edge7.us..lr.ph13.split.us_crit_edge ]
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %6 = add nuw nsw i32 %5, 1
  %7 = trunc i64 %indvars.iv.next27 to i32
  br label %._crit_edge.us._crit_edge

._crit_edge.us._crit_edge:                        ; preds = %._crit_edge.us.._crit_edge.us._crit_edge_crit_edge, %.lr.ph13.split.us
  %indvars.iv23 = phi i64 [ 0, %.lr.ph13.split.us ], [ %indvars.iv.next24, %._crit_edge.us.._crit_edge.us._crit_edge_crit_edge ]
  %8 = phi i32 [ %7, %.lr.ph13.split.us ], [ %6, %._crit_edge.us.._crit_edge.us._crit_edge_crit_edge ]
  %9 = icmp slt i32 %8, 1000
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv26, i64 %indvars.iv23
  br i1 %9, label %.lr.ph.us, label %._crit_edge.us._crit_edge.._crit_edge.us_crit_edge

._crit_edge.us._crit_edge.._crit_edge.us_crit_edge: ; preds = %._crit_edge.us._crit_edge
  br label %._crit_edge.us

._crit_edge.us.loopexit:                          ; preds = %.lr.ph.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.prol.loopexit.._crit_edge.us_crit_edge, %._crit_edge.us._crit_edge.._crit_edge.us_crit_edge, %._crit_edge.us.loopexit
  %11 = load double, double* %10, align 8
  %12 = fmul double %11, %2
  store double %12, double* %10, align 8
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond = icmp eq i64 %indvars.iv.next24, 1200
  br i1 %exitcond, label %._crit_edge7.us, label %._crit_edge.us.._crit_edge.us._crit_edge_crit_edge

._crit_edge.us.._crit_edge.us._crit_edge_crit_edge: ; preds = %._crit_edge.us
  br label %._crit_edge.us._crit_edge

.lr.ph.us.new:                                    ; preds = %.lr.ph.us.new..lr.ph.us.new_crit_edge, %.lr.ph.us.new.preheader
  %13 = phi double [ %.pre, %.lr.ph.us.new.preheader ], [ %25, %.lr.ph.us.new..lr.ph.us.new_crit_edge ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.us.new.preheader ], [ %indvars.iv.next.1, %.lr.ph.us.new..lr.ph.us.new_crit_edge ]
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv, i64 %indvars.iv26
  %15 = load double, double* %14, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv, i64 %indvars.iv23
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fadd double %13, %18
  store double %19, double* %10, align 8
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv26
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next, i64 %indvars.iv23
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = fadd double %19, %24
  store double %25, double* %10, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1000
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph.us.new..lr.ph.us.new_crit_edge

.lr.ph.us.new..lr.ph.us.new_crit_edge:            ; preds = %.lr.ph.us.new
  br label %.lr.ph.us.new

.lr.ph.us:                                        ; preds = %._crit_edge.us._crit_edge
  %26 = sext i32 %8 to i64
  %xtraiter = and i32 %8, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.us..prol.loopexit_crit_edge, label %.prol.preheader

.lr.ph.us..prol.loopexit_crit_edge:               ; preds = %.lr.ph.us
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.lr.ph.us
  %27 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %26, i64 %indvars.iv26
  %28 = load double, double* %27, align 8
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %26, i64 %indvars.iv23
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = load double, double* %10, align 8
  %33 = fadd double %32, %31
  store double %33, double* %10, align 8
  %indvars.iv.next.prol = add nsw i64 %26, 1
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph.us..prol.loopexit_crit_edge, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %.prol.preheader ], [ %26, %.lr.ph.us..prol.loopexit_crit_edge ]
  %34 = icmp eq i32 %8, 999
  br i1 %34, label %.prol.loopexit.._crit_edge.us_crit_edge, label %.lr.ph.us.new.preheader

.prol.loopexit.._crit_edge.us_crit_edge:          ; preds = %.prol.loopexit
  br label %._crit_edge.us

.lr.ph.us.new.preheader:                          ; preds = %.prol.loopexit
  %.pre = load double, double* %10, align 8
  br label %.lr.ph.us.new

._crit_edge7.us:                                  ; preds = %._crit_edge.us
  %exitcond30 = icmp eq i64 %indvars.iv.next27, 1000
  br i1 %exitcond30, label %._crit_edge14, label %._crit_edge7.us..lr.ph13.split.us_crit_edge

._crit_edge7.us..lr.ph13.split.us_crit_edge:      ; preds = %._crit_edge7.us
  br label %.lr.ph13.split.us

._crit_edge14:                                    ; preds = %._crit_edge7.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
.lr.ph5:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph5.split.us

.lr.ph5.split.us:                                 ; preds = %._crit_edge.us..lr.ph5.split.us_crit_edge, %.lr.ph5
  %indvars.iv13 = phi i64 [ 0, %.lr.ph5 ], [ %indvars.iv.next14, %._crit_edge.us..lr.ph5.split.us_crit_edge ]
  %7 = mul nsw i64 %indvars.iv13, 1000
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge17.._crit_edge18_crit_edge, %.lr.ph5.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph5.split.us ], [ %indvars.iv.next, %._crit_edge17.._crit_edge18_crit_edge ]
  %8 = add nsw i64 %7, %indvars.iv
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge18.._crit_edge17_crit_edge

._crit_edge18.._crit_edge17_crit_edge:            ; preds = %._crit_edge18
  br label %._crit_edge17

; <label>:12:                                     ; preds = %._crit_edge18
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge18.._crit_edge17_crit_edge, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv13, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge17.._crit_edge18_crit_edge

._crit_edge17.._crit_edge18_crit_edge:            ; preds = %._crit_edge17
  br label %._crit_edge18

._crit_edge.us:                                   ; preds = %._crit_edge17
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next14, 1000
  br i1 %exitcond16, label %._crit_edge6, label %._crit_edge.us..lr.ph5.split.us_crit_edge

._crit_edge.us..lr.ph5.split.us_crit_edge:        ; preds = %._crit_edge.us
  br label %.lr.ph5.split.us

._crit_edge6:                                     ; preds = %._crit_edge.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
