; ModuleID = 'A.ll'
source_filename = "correlation.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"corr\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %8 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(double* nonnull %3, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  tail call fastcc void @kernel_correlation(double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
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
  tail call fastcc void @print_array([1200 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %0, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %19, %2
  %indvars.iv1 = phi i64 [ 0, %2 ], [ %indvars.iv.next2, %19 ]
  %3 = trunc i64 %indvars.iv1 to i32
  %4 = sitofp i32 %3 to double
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %._crit_edge3 ]
  %5 = mul nuw nsw i64 %indvars.iv, %indvars.iv1
  %6 = trunc i64 %5 to i32
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %9 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv1
  %10 = trunc i64 %9 to i32
  %11 = sitofp i32 %10 to double
  %12 = insertelement <2 x double> undef, double %7, i32 0
  %13 = insertelement <2 x double> %12, double %11, i32 1
  %14 = fdiv <2 x double> %13, <double 1.200000e+03, double 1.200000e+03>
  %15 = insertelement <2 x double> undef, double %4, i32 0
  %16 = insertelement <2 x double> %15, double %4, i32 1
  %17 = fadd <2 x double> %16, %14
  %18 = bitcast double* %8 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %19, label %._crit_edge3

; <label>:19:                                     ; preds = %._crit_edge3
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next2, 1400
  br i1 %exitcond, label %20, label %._crit_edge

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
.lr.ph45.split.us.preheader:
  br label %.lr.ph45.split.us

.lr.ph45.split.us:                                ; preds = %._crit_edge41.us, %.lr.ph45.split.us.preheader
  %indvars.iv29 = phi i64 [ 0, %.lr.ph45.split.us.preheader ], [ %indvars.iv.next30, %._crit_edge41.us ]
  %5 = getelementptr inbounds double, double* %3, i64 %indvars.iv29
  store double 0.000000e+00, double* %5, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph45.split.us
  %indvars.iv26 = phi i64 [ 0, %.lr.ph45.split.us ], [ %indvars.iv.next27.4, %._crit_edge ]
  %6 = phi double [ 0.000000e+00, %.lr.ph45.split.us ], [ %21, %._crit_edge ]
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv29
  %8 = load double, double* %7, align 8
  %9 = fadd double %6, %8
  store double %9, double* %5, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next27, i64 %indvars.iv29
  %11 = load double, double* %10, align 8
  %12 = fadd double %9, %11
  store double %12, double* %5, align 8
  %indvars.iv.next27.1 = add nsw i64 %indvars.iv26, 2
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next27.1, i64 %indvars.iv29
  %14 = load double, double* %13, align 8
  %15 = fadd double %12, %14
  store double %15, double* %5, align 8
  %indvars.iv.next27.2 = add nsw i64 %indvars.iv26, 3
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next27.2, i64 %indvars.iv29
  %17 = load double, double* %16, align 8
  %18 = fadd double %15, %17
  store double %18, double* %5, align 8
  %indvars.iv.next27.3 = add nsw i64 %indvars.iv26, 4
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next27.3, i64 %indvars.iv29
  %20 = load double, double* %19, align 8
  %21 = fadd double %18, %20
  store double %21, double* %5, align 8
  %indvars.iv.next27.4 = add nsw i64 %indvars.iv26, 5
  %exitcond28.4 = icmp eq i64 %indvars.iv.next27.4, 1400
  br i1 %exitcond28.4, label %._crit_edge41.us, label %._crit_edge

._crit_edge41.us:                                 ; preds = %._crit_edge
  %22 = fdiv double %21, %0
  store double %22, double* %5, align 8
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next30, 1200
  br i1 %exitcond31, label %.lr.ph38.split.us.preheader, label %.lr.ph45.split.us

.lr.ph38.split.us.preheader:                      ; preds = %._crit_edge41.us
  br label %.lr.ph38.split.us

.lr.ph38.split.us:                                ; preds = %.lr.ph38.split.us.preheader, %._crit_edge35.us
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %._crit_edge35.us ], [ 0, %.lr.ph38.split.us.preheader ]
  %23 = getelementptr inbounds double, double* %4, i64 %indvars.iv23
  store double 0.000000e+00, double* %23, align 8
  %24 = getelementptr inbounds double, double* %3, i64 %indvars.iv23
  br label %._crit_edge34

._crit_edge34:                                    ; preds = %._crit_edge34, %.lr.ph38.split.us
  %indvars.iv20 = phi i64 [ 0, %.lr.ph38.split.us ], [ %indvars.iv.next21.1, %._crit_edge34 ]
  %25 = phi double [ 0.000000e+00, %.lr.ph38.split.us ], [ %37, %._crit_edge34 ]
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv20, i64 %indvars.iv23
  %27 = load double, double* %26, align 8
  %28 = load double, double* %24, align 8
  %29 = fsub double %27, %28
  %30 = fmul double %29, %29
  %31 = fadd double %25, %30
  store double %31, double* %23, align 8
  %indvars.iv.next21 = or i64 %indvars.iv20, 1
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next21, i64 %indvars.iv23
  %33 = load double, double* %32, align 8
  %34 = load double, double* %24, align 8
  %35 = fsub double %33, %34
  %36 = fmul double %35, %35
  %37 = fadd double %31, %36
  store double %37, double* %23, align 8
  %indvars.iv.next21.1 = add nsw i64 %indvars.iv20, 2
  %exitcond22.1 = icmp eq i64 %indvars.iv.next21.1, 1400
  br i1 %exitcond22.1, label %._crit_edge35.us, label %._crit_edge34

._crit_edge35.us:                                 ; preds = %._crit_edge34
  %38 = fdiv double %37, %0
  store double %38, double* %23, align 8
  %39 = tail call double @sqrt(double %38) #4
  %40 = fcmp ugt double %39, 1.000000e-01
  %..us = select i1 %40, double %39, double 1.000000e+00
  store double %..us, double* %23, align 8
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next24, 1200
  br i1 %exitcond25, label %._crit_edge13.us.preheader, label %.lr.ph38.split.us

._crit_edge13.us.preheader:                       ; preds = %._crit_edge35.us
  br label %._crit_edge13.us

._crit_edge13.us:                                 ; preds = %._crit_edge13.us.preheader, %._crit_edge32.us
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %._crit_edge32.us ], [ 0, %._crit_edge13.us.preheader ]
  br label %._crit_edge35

._crit_edge35:                                    ; preds = %._crit_edge35, %._crit_edge13.us
  %indvars.iv14 = phi i64 [ 0, %._crit_edge13.us ], [ %indvars.iv.next15, %._crit_edge35 ]
  %41 = getelementptr inbounds double, double* %3, i64 %indvars.iv14
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv17, i64 %indvars.iv14
  %44 = load double, double* %43, align 8
  %45 = fsub double %44, %42
  store double %45, double* %43, align 8
  %46 = tail call double @sqrt(double %0) #4
  %47 = getelementptr inbounds double, double* %4, i64 %indvars.iv14
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = load double, double* %43, align 8
  %51 = fdiv double %50, %49
  store double %51, double* %43, align 8
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 1200
  br i1 %exitcond16, label %._crit_edge32.us, label %._crit_edge35

._crit_edge32.us:                                 ; preds = %._crit_edge35
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next18, 1400
  br i1 %exitcond19, label %.lr.ph.us.us.preheader.preheader, label %._crit_edge13.us

.lr.ph.us.us.preheader.preheader:                 ; preds = %._crit_edge32.us
  br label %.lr.ph.us.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph.us.us.preheader.preheader, %._crit_edge15.us..lr.ph.us.us.preheader_crit_edge
  %indvars.iv11 = phi i64 [ %indvars.iv.next12, %._crit_edge15.us..lr.ph.us.us.preheader_crit_edge ], [ 0, %.lr.ph.us.us.preheader.preheader ]
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %._crit_edge15.us..lr.ph.us.us.preheader_crit_edge ], [ 1, %.lr.ph.us.us.preheader.preheader ]
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv11
  store double 1.000000e+00, double* %52, align 8
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  br label %.lr.ph.us.us

._crit_edge15.us:                                 ; preds = %._crit_edge19.us.us
  %exitcond13 = icmp eq i64 %indvars.iv.next12, 1199
  br i1 %exitcond13, label %._crit_edge24, label %._crit_edge15.us..lr.ph.us.us.preheader_crit_edge

._crit_edge15.us..lr.ph.us.us.preheader_crit_edge: ; preds = %._crit_edge15.us
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  br label %.lr.ph.us.us.preheader

.lr.ph.us.us:                                     ; preds = %._crit_edge19.us.us, %.lr.ph.us.us.preheader
  %indvars.iv8 = phi i64 [ %indvars.iv6, %.lr.ph.us.us.preheader ], [ %indvars.iv.next9, %._crit_edge19.us.us ]
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv8
  store double 0.000000e+00, double* %53, align 8
  br label %._crit_edge36

._crit_edge19.us.us:                              ; preds = %._crit_edge36
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv8, i64 %indvars.iv11
  store double %67, double* %54, align 8
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond = icmp eq i64 %indvars.iv.next9, 1200
  br i1 %exitcond, label %._crit_edge15.us, label %.lr.ph.us.us

._crit_edge36:                                    ; preds = %._crit_edge36, %.lr.ph.us.us
  %55 = phi double [ 0.000000e+00, %.lr.ph.us.us ], [ %67, %._crit_edge36 ]
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %._crit_edge36 ]
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv11
  %57 = load double, double* %56, align 8
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv8
  %59 = load double, double* %58, align 8
  %60 = fmul double %57, %59
  %61 = fadd double %55, %60
  store double %61, double* %53, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv11
  %63 = load double, double* %62, align 8
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv8
  %65 = load double, double* %64, align 8
  %66 = fmul double %63, %65
  %67 = fadd double %61, %66
  store double %67, double* %53, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge19.us.us, label %._crit_edge36

._crit_edge24:                                    ; preds = %._crit_edge15.us
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 1199, i64 1199
  store double 1.000000e+00, double* %68, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
._crit_edge.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge2.us, %._crit_edge.us.preheader
  %indvars.iv1 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next2, %._crit_edge2.us ]
  %5 = mul nuw nsw i64 %indvars.iv1, 1200
  br label %._crit_edge1.us._crit_edge

._crit_edge1.us._crit_edge:                       ; preds = %._crit_edge1.us, %._crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next, %._crit_edge1.us ]
  %6 = add nuw nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge1.us

; <label>:10:                                     ; preds = %._crit_edge1.us._crit_edge
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge1.us

._crit_edge1.us:                                  ; preds = %._crit_edge1.us._crit_edge, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge2.us, label %._crit_edge1.us._crit_edge

._crit_edge2.us:                                  ; preds = %._crit_edge1.us
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1200
  br i1 %exitcond3, label %._crit_edge3, label %._crit_edge.us

._crit_edge3:                                     ; preds = %._crit_edge2.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
