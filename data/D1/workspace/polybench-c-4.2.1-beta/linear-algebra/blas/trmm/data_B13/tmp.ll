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
  call fastcc void @init_array(double* nonnull %3, [1000 x double]* %6, [1200 x double]* %7)
  tail call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  tail call fastcc void @kernel_trmm(double %8, [1000 x double]* %6, [1200 x double]* %7)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

._crit_edge:                                      ; preds = %2
  br label %15

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge10

._crit_edge10:                                    ; preds = %10
  br label %15

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %5 to [1200 x double]*
  tail call fastcc void @print_array([1200 x double]* %14)
  br label %15

; <label>:15:                                     ; preds = %._crit_edge10, %._crit_edge, %13
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %0, align 8
  br label %.preheader

.preheader:                                       ; preds = %..preheader_crit_edge, %3
  %indvars.iv31 = phi i64 [ 0, %3 ], [ %indvars.iv.next32, %..preheader_crit_edge ]
  %4 = icmp sgt i64 %indvars.iv31, 0
  br i1 %4, label %.lr.ph, label %.preheader.._crit_edge_crit_edge

.preheader.._crit_edge_crit_edge:                 ; preds = %.preheader
  br label %._crit_edge

.lr.ph:                                           ; preds = %.preheader
  %xtraiter = and i64 %indvars.iv31, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph..prol.loopexit_crit_edge, label %.prol.preheader

.lr.ph..prol.loopexit_crit_edge:                  ; preds = %.lr.ph
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.lr.ph
  %5 = trunc i64 %indvars.iv31 to i32
  %6 = srem i32 %5, 1000
  %7 = sitofp i32 %6 to double
  %8 = fdiv double %7, 1.000000e+03
  %9 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv31, i64 0
  store double %8, double* %9, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph..prol.loopexit_crit_edge, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph..prol.loopexit_crit_edge ]
  %10 = icmp eq i64 %indvars.iv31, 1
  br i1 %10, label %.prol.loopexit.._crit_edge_crit_edge, label %.lr.ph.new.preheader

.prol.loopexit.._crit_edge_crit_edge:             ; preds = %.prol.loopexit
  br label %._crit_edge

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new..lr.ph.new_crit_edge, %.lr.ph.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new..lr.ph.new_crit_edge ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %11 = add nuw nsw i64 %indvars.iv, %indvars.iv31
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 1000
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 1.000000e+03
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv31, i64 %indvars.iv
  store double %15, double* %16, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %17 = add nuw nsw i64 %indvars.iv.next, %indvars.iv31
  %18 = trunc i64 %17 to i32
  %19 = srem i32 %18, 1000
  %20 = sitofp i32 %19 to double
  %21 = fdiv double %20, 1.000000e+03
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv31, i64 %indvars.iv.next
  store double %21, double* %22, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv31
  br i1 %exitcond.1, label %.lr.ph.new.._crit_edge_crit_edge, label %.lr.ph.new..lr.ph.new_crit_edge

.lr.ph.new..lr.ph.new_crit_edge:                  ; preds = %.lr.ph.new
  br label %.lr.ph.new

.lr.ph.new.._crit_edge_crit_edge:                 ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph.new.._crit_edge_crit_edge, %.prol.loopexit.._crit_edge_crit_edge, %.preheader.._crit_edge_crit_edge
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv31, i64 %indvars.iv31
  store double 1.000000e+00, double* %23, align 8
  %24 = add nuw nsw i64 %indvars.iv31, 1200
  br label %25

; <label>:25:                                     ; preds = %._crit_edge1, %._crit_edge
  %indvars.iv28 = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next29.1, %._crit_edge1 ]
  %26 = sub nuw nsw i64 %24, %indvars.iv28
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 1200
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, 1.200000e+03
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv31, i64 %indvars.iv28
  store double %30, double* %31, align 8
  %indvars.iv.next29 = or i64 %indvars.iv28, 1
  %32 = sub nuw nsw i64 %24, %indvars.iv.next29
  %33 = trunc i64 %32 to i32
  %34 = srem i32 %33, 1200
  %35 = sitofp i32 %34 to double
  %36 = fdiv double %35, 1.200000e+03
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv31, i64 %indvars.iv.next29
  store double %36, double* %37, align 8
  %indvars.iv.next29.1 = add nuw nsw i64 %indvars.iv28, 2
  %exitcond30.1 = icmp eq i64 %indvars.iv.next29.1, 1200
  br i1 %exitcond30.1, label %38, label %._crit_edge1

._crit_edge1:                                     ; preds = %25
  br label %25

; <label>:38:                                     ; preds = %25
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next32, 1000
  br i1 %exitcond33, label %39, label %..preheader_crit_edge

..preheader_crit_edge:                            ; preds = %38
  br label %.preheader

; <label>:39:                                     ; preds = %38
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(double, [1000 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
  br label %.preheader24

.preheader24:                                     ; preds = %.us-lcssa.us..preheader24_crit_edge, %3
  %indvars.iv39 = phi i64 [ 0, %3 ], [ %indvars.iv.next40, %.us-lcssa.us..preheader24_crit_edge ]
  %indvars.iv31 = phi i64 [ 1, %3 ], [ %indvars.iv.next32.pre-phi, %.us-lcssa.us..preheader24_crit_edge ]
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %4 = icmp slt i64 %indvars.iv.next40, 1000
  br i1 %4, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader24
  br label %.preheader

.preheader.us.preheader:                          ; preds = %.preheader24
  %5 = sub nuw nsw i64 999, %indvars.iv39
  %xtraiter = and i64 %5, 1
  %6 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv31, i64 %indvars.iv39
  %indvars.iv.next34.prol = add nuw nsw i64 %indvars.iv31, 1
  %7 = icmp eq i64 %xtraiter, 0
  %8 = icmp eq i64 %indvars.iv39, 998
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv36
  br i1 %7, label %.preheader.us..prol.loopexit_crit_edge, label %.prol.preheader

.preheader.us..prol.loopexit_crit_edge:           ; preds = %.preheader.us
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.preheader.us
  %10 = load double, double* %6, align 8
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv31, i64 %indvars.iv36
  %12 = load double, double* %11, align 8
  %13 = fmul double %10, %12
  %14 = load double, double* %9, align 8
  %15 = fadd double %14, %13
  store double %15, double* %9, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us..prol.loopexit_crit_edge, %.prol.preheader
  %indvars.iv33.unr.ph = phi i64 [ %indvars.iv.next34.prol, %.prol.preheader ], [ %indvars.iv31, %.preheader.us..prol.loopexit_crit_edge ]
  %.pre3 = load double, double* %9, align 8
  br i1 %8, label %.prol.loopexit.._crit_edge.us_crit_edge, label %.preheader.us.new.preheader

.prol.loopexit.._crit_edge.us_crit_edge:          ; preds = %.prol.loopexit
  br label %._crit_edge.us

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new..preheader.us.new_crit_edge, %.preheader.us.new.preheader
  %16 = phi double [ %28, %.preheader.us.new..preheader.us.new_crit_edge ], [ %.pre3, %.preheader.us.new.preheader ]
  %indvars.iv33 = phi i64 [ %indvars.iv.next34.1, %.preheader.us.new..preheader.us.new_crit_edge ], [ %indvars.iv33.unr.ph, %.preheader.us.new.preheader ]
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv33, i64 %indvars.iv39
  %18 = load double, double* %17, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv33, i64 %indvars.iv36
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fadd double %16, %21
  store double %22, double* %9, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv.next34, i64 %indvars.iv39
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next34, i64 %indvars.iv36
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fadd double %22, %27
  store double %28, double* %9, align 8
  %indvars.iv.next34.1 = add nsw i64 %indvars.iv33, 2
  %exitcond35.1 = icmp eq i64 %indvars.iv.next34.1, 1000
  br i1 %exitcond35.1, label %.preheader.us.new.._crit_edge.us_crit_edge, label %.preheader.us.new..preheader.us.new_crit_edge

.preheader.us.new..preheader.us.new_crit_edge:    ; preds = %.preheader.us.new
  br label %.preheader.us.new

.preheader.us.new.._crit_edge.us_crit_edge:       ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.preheader.us.new.._crit_edge.us_crit_edge, %.prol.loopexit.._crit_edge.us_crit_edge
  %29 = phi double [ %.pre3, %.prol.loopexit.._crit_edge.us_crit_edge ], [ %28, %.preheader.us.new.._crit_edge.us_crit_edge ]
  %30 = fmul double %29, %0
  store double %30, double* %9, align 8
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next37, 1200
  br i1 %exitcond38, label %._crit_edge.us..us-lcssa.us_crit_edge, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge.us..us-lcssa.us_crit_edge:            ; preds = %._crit_edge.us
  br label %.us-lcssa.us

.preheader:                                       ; preds = %.preheader..preheader_crit_edge, %.preheader.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.4, %.preheader..preheader_crit_edge ], [ 0, %.preheader.preheader ]
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv
  %32 = load double, double* %31, align 8
  %33 = fmul double %32, %0
  store double %33, double* %31, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv.next
  %35 = load double, double* %34, align 8
  %36 = fmul double %35, %0
  store double %36, double* %34, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv.next.1
  %38 = load double, double* %37, align 8
  %39 = fmul double %38, %0
  store double %39, double* %37, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv.next.2
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %0
  store double %42, double* %40, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv.next.3
  %44 = load double, double* %43, align 8
  %45 = fmul double %44, %0
  store double %45, double* %43, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 1200
  br i1 %exitcond.4, label %.us-lcssa.us.loopexit2, label %.preheader..preheader_crit_edge

.preheader..preheader_crit_edge:                  ; preds = %.preheader
  br label %.preheader

.us-lcssa.us.loopexit2:                           ; preds = %.preheader
  %.pre4 = add nuw nsw i64 %indvars.iv31, 1
  br label %.us-lcssa.us

.us-lcssa.us:                                     ; preds = %._crit_edge.us..us-lcssa.us_crit_edge, %.us-lcssa.us.loopexit2
  %indvars.iv.next32.pre-phi = phi i64 [ %.pre4, %.us-lcssa.us.loopexit2 ], [ %indvars.iv.next34.prol, %._crit_edge.us..us-lcssa.us_crit_edge ]
  %exitcond41 = icmp eq i64 %indvars.iv.next40, 1000
  br i1 %exitcond41, label %46, label %.us-lcssa.us..preheader24_crit_edge

.us-lcssa.us..preheader24_crit_edge:              ; preds = %.us-lcssa.us
  br label %.preheader24

; <label>:46:                                     ; preds = %.us-lcssa.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader

.preheader:                                       ; preds = %..preheader_crit_edge, %1
  %indvars.iv12 = phi i64 [ 0, %1 ], [ %indvars.iv.next13, %..preheader_crit_edge ]
  %6 = mul nuw nsw i64 %indvars.iv12, 1000
  br label %7

; <label>:7:                                      ; preds = %._crit_edge1, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge1 ]
  %8 = add nuw nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

._crit_edge:                                      ; preds = %7
  br label %14

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %14

; <label>:14:                                     ; preds = %._crit_edge, %12
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv12, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %19, label %._crit_edge1

._crit_edge1:                                     ; preds = %14
  br label %7

; <label>:19:                                     ; preds = %14
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next13, 1000
  br i1 %exitcond14, label %20, label %..preheader_crit_edge

..preheader_crit_edge:                            ; preds = %19
  br label %.preheader

; <label>:20:                                     ; preds = %19
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
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
