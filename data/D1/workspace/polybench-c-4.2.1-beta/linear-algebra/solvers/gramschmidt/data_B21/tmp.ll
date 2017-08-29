; ModuleID = 'A.ll'
source_filename = "gramschmidt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"R\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"Q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %6 = bitcast i8* %3 to [1200 x double]*
  %7 = bitcast i8* %4 to [1200 x double]*
  %8 = bitcast i8* %5 to [1200 x double]*
  tail call fastcc void @init_array([1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_gramschmidt([1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %16

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %16

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %5 to [1200 x double]*
  %15 = bitcast i8* %4 to [1200 x double]*
  tail call fastcc void @print_array([1200 x double]* %15, [1200 x double]* %14)
  br label %16

; <label>:16:                                     ; preds = %10, %13, %2
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #0 {
.preheader27.lr.ph.split.us:
  br label %.preheader27.us

.preheader27.us:                                  ; preds = %._crit_edge33.us, %.preheader27.lr.ph.split.us
  %indvars.iv52 = phi i64 [ %indvars.iv.next53, %._crit_edge33.us ], [ 0, %.preheader27.lr.ph.split.us ]
  br label %3

; <label>:3:                                      ; preds = %3, %.preheader27.us
  %indvars.iv40.us = phi i64 [ 0, %.preheader27.us ], [ %indvars.iv.next41.us, %3 ]
  %4 = mul nuw nsw i64 %indvars.iv40.us, %indvars.iv52
  %5 = trunc i64 %4 to i32
  %6 = srem i32 %5, 1000
  %7 = sitofp i32 %6 to double
  %8 = fdiv double %7, 1.000000e+03
  %9 = fmul double %8, 1.000000e+02
  %10 = fadd double %9, 1.000000e+01
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv52, i64 %indvars.iv40.us
  store double %10, double* %11, align 8
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv52, i64 %indvars.iv40.us
  store double 0.000000e+00, double* %12, align 8
  %indvars.iv.next41.us = add nuw nsw i64 %indvars.iv40.us, 1
  %exitcond43.us = icmp eq i64 %indvars.iv.next41.us, 1200
  br i1 %exitcond43.us, label %._crit_edge33.us, label %3

._crit_edge33.us:                                 ; preds = %3
  %indvars.iv.next53 = add nuw nsw i64 %indvars.iv52, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next53, 1000
  br i1 %exitcond57, label %._crit_edge30, label %.preheader27.us

._crit_edge30:                                    ; preds = %._crit_edge33.us
  %13 = bitcast [1200 x double]* %1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %13, i8 0, i64 11520000, i32 8, i1 false)
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt([1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #0 {
.preheader65.lr.ph:
  br label %.lr.ph.preheader

.loopexit.loopexit:                               ; preds = %._crit_edge77.us
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge71
  %indvars.iv.next122 = add nuw nsw i64 %indvars.iv121, 1
  %exitcond135 = icmp eq i64 %indvars.iv.next128, 1200
  br i1 %exitcond135, label %._crit_edge82, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.preheader65.lr.ph, %.loopexit
  %indvars.iv127 = phi i64 [ 0, %.preheader65.lr.ph ], [ %indvars.iv.next128, %.loopexit ]
  %indvars.iv121 = phi i64 [ 1, %.preheader65.lr.ph ], [ %indvars.iv.next122, %.loopexit ]
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next.4, %.lr.ph ]
  %.067 = phi double [ 0.000000e+00, %.lr.ph.preheader ], [ %22, %.lr.ph ]
  %3 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv, i64 %indvars.iv127
  %4 = load double, double* %3, align 8
  %5 = fmul double %4, %4
  %6 = fadd double %.067, %5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv127
  %8 = load double, double* %7, align 8
  %9 = fmul double %8, %8
  %10 = fadd double %6, %9
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next.1, i64 %indvars.iv127
  %12 = load double, double* %11, align 8
  %13 = fmul double %12, %12
  %14 = fadd double %10, %13
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next.2, i64 %indvars.iv127
  %16 = load double, double* %15, align 8
  %17 = fmul double %16, %16
  %18 = fadd double %14, %17
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next.3, i64 %indvars.iv127
  %20 = load double, double* %19, align 8
  %21 = fmul double %20, %20
  %22 = fadd double %18, %21
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  %exitcond132.4 = icmp eq i64 %indvars.iv.next.4, 1000
  br i1 %exitcond132.4, label %.lr.ph70.preheader, label %.lr.ph

.lr.ph70.preheader:                               ; preds = %.lr.ph
  %23 = tail call double @sqrt(double %22) #3
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv127, i64 %indvars.iv127
  store double %23, double* %24, align 8
  br label %.lr.ph70

.lr.ph70:                                         ; preds = %.lr.ph70, %.lr.ph70.preheader
  %indvars.iv83 = phi i64 [ 0, %.lr.ph70.preheader ], [ %indvars.iv.next84.1, %.lr.ph70 ]
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv83, i64 %indvars.iv127
  %26 = load double, double* %25, align 8
  %27 = load double, double* %24, align 8
  %28 = fdiv double %26, %27
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv83, i64 %indvars.iv127
  store double %28, double* %29, align 8
  %indvars.iv.next84 = or i64 %indvars.iv83, 1
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next84, i64 %indvars.iv127
  %31 = load double, double* %30, align 8
  %32 = load double, double* %24, align 8
  %33 = fdiv double %31, %32
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next84, i64 %indvars.iv127
  store double %33, double* %34, align 8
  %indvars.iv.next84.1 = add nuw nsw i64 %indvars.iv83, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next84.1, 1000
  br i1 %exitcond.1, label %._crit_edge71, label %.lr.ph70

._crit_edge71:                                    ; preds = %.lr.ph70
  %indvars.iv.next128 = add nuw nsw i64 %indvars.iv127, 1
  %35 = icmp slt i64 %indvars.iv.next128, 1200
  br i1 %35, label %.lr.ph80.split.us.preheader, label %.loopexit

.lr.ph80.split.us.preheader:                      ; preds = %._crit_edge71
  br label %.lr.ph80.split.us

.lr.ph80.split.us:                                ; preds = %.lr.ph80.split.us.preheader, %._crit_edge77.us
  %indvars.iv117 = phi i64 [ %indvars.iv.next118, %._crit_edge77.us ], [ %indvars.iv121, %.lr.ph80.split.us.preheader ]
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv127, i64 %indvars.iv117
  store double 0.000000e+00, double* %36, align 8
  br label %37

; <label>:37:                                     ; preds = %37, %.lr.ph80.split.us
  %indvars.iv87.us = phi i64 [ 0, %.lr.ph80.split.us ], [ %indvars.iv.next88.us.1, %37 ]
  %38 = phi double [ 0.000000e+00, %.lr.ph80.split.us ], [ %50, %37 ]
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv87.us, i64 %indvars.iv127
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv87.us, i64 %indvars.iv117
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fadd double %38, %43
  store double %44, double* %36, align 8
  %indvars.iv.next88.us = or i64 %indvars.iv87.us, 1
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next88.us, i64 %indvars.iv127
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next88.us, i64 %indvars.iv117
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = fadd double %44, %49
  store double %50, double* %36, align 8
  %indvars.iv.next88.us.1 = add nuw nsw i64 %indvars.iv87.us, 2
  %exitcond90.us.1 = icmp eq i64 %indvars.iv.next88.us.1, 1000
  br i1 %exitcond90.us.1, label %.lr.ph76.us.preheader, label %37

.lr.ph76.us.preheader:                            ; preds = %37
  br label %.lr.ph76.us

.lr.ph76.us:                                      ; preds = %.lr.ph76.us.preheader, %.lr.ph76.us
  %indvars.iv91.us = phi i64 [ %indvars.iv.next92.us.1, %.lr.ph76.us ], [ 0, %.lr.ph76.us.preheader ]
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv91.us, i64 %indvars.iv117
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv91.us, i64 %indvars.iv127
  %54 = load double, double* %53, align 8
  %55 = load double, double* %36, align 8
  %56 = fmul double %54, %55
  %57 = fsub double %52, %56
  store double %57, double* %51, align 8
  %indvars.iv.next92.us = or i64 %indvars.iv91.us, 1
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next92.us, i64 %indvars.iv117
  %59 = load double, double* %58, align 8
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next92.us, i64 %indvars.iv127
  %61 = load double, double* %60, align 8
  %62 = load double, double* %36, align 8
  %63 = fmul double %61, %62
  %64 = fsub double %59, %63
  store double %64, double* %58, align 8
  %indvars.iv.next92.us.1 = add nuw nsw i64 %indvars.iv91.us, 2
  %exitcond94.us.1 = icmp eq i64 %indvars.iv.next92.us.1, 1000
  br i1 %exitcond94.us.1, label %._crit_edge77.us, label %.lr.ph76.us

._crit_edge77.us:                                 ; preds = %.lr.ph76.us
  %indvars.iv.next118 = add nuw nsw i64 %indvars.iv117, 1
  %exitcond134 = icmp eq i64 %indvars.iv.next118, 1200
  br i1 %exitcond134, label %.loopexit.loopexit, label %.lr.ph80.split.us

._crit_edge82:                                    ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader28.lr.ph.split.us:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader28.us

.preheader28.us:                                  ; preds = %._crit_edge35.us, %.preheader28.lr.ph.split.us
  %indvars.iv55 = phi i64 [ %indvars.iv.next56, %._crit_edge35.us ], [ 0, %.preheader28.lr.ph.split.us ]
  %6 = mul nuw nsw i64 %indvars.iv55, 1200
  br label %7

; <label>:7:                                      ; preds = %14, %.preheader28.us
  %indvars.iv43.us = phi i64 [ 0, %.preheader28.us ], [ %indvars.iv.next44.us, %14 ]
  %8 = add nuw nsw i64 %indvars.iv43.us, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc27.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %14

; <label>:14:                                     ; preds = %12, %7
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv55, i64 %indvars.iv43.us
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next44.us = add nuw nsw i64 %indvars.iv43.us, 1
  %exitcond46.us = icmp eq i64 %indvars.iv.next44.us, 1200
  br i1 %exitcond46.us, label %._crit_edge35.us, label %7

._crit_edge35.us:                                 ; preds = %14
  %indvars.iv.next56 = add nuw nsw i64 %indvars.iv55, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next56, 1200
  br i1 %exitcond61, label %.preheader.lr.ph.split.us, label %.preheader28.us

.preheader.lr.ph.split.us:                        ; preds = %._crit_edge35.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph.split.us
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %._crit_edge.us ], [ 0, %.preheader.lr.ph.split.us ]
  %23 = mul nuw nsw i64 %indvars.iv51, 1200
  br label %24

; <label>:24:                                     ; preds = %31, %.preheader.us
  %indvars.iv.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %31 ]
  %25 = add nuw nsw i64 %indvars.iv.us, %23
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 20
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %31

; <label>:29:                                     ; preds = %24
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %30) #5
  br label %31

; <label>:31:                                     ; preds = %29, %24
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv51, i64 %indvars.iv.us
  %34 = load double, double* %33, align 8
  %35 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %34) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond.us, label %._crit_edge.us, label %24

._crit_edge.us:                                   ; preds = %31
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond = icmp eq i64 %indvars.iv.next52, 1000
  br i1 %exitcond, label %._crit_edge32, label %.preheader.us

._crit_edge32:                                    ; preds = %._crit_edge.us
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %37 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %36, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %38 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %39 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %38) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
