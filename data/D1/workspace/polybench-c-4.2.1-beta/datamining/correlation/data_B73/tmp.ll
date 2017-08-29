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
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2, %19
  %indvars.iv1014 = phi i64 [ 0, %2 ], [ %indvars.iv.next11, %19 ]
  %3 = trunc i64 %indvars.iv1014 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.._crit_edge_crit_edge
  %indvars.iv13 = phi i64 [ 0, %.._crit_edge_crit_edge ], [ %indvars.iv.next.1, %._crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv13, %indvars.iv1014
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1014, i64 %indvars.iv13
  %indvars.iv.next = or i64 %indvars.iv13, 1
  %11 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv1014
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 1.200000e+03, double 1.200000e+03>
  %17 = fadd <2 x double> %6, %16
  %18 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv13, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %._crit_edge
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv1014, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 1400
  br i1 %exitcond12, label %20, label %.._crit_edge_crit_edge

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
.lr.ph166:
  %sunkaddr187 = ptrtoint double* %3 to i64
  br label %.lr.ph166.split.us

.lr.ph166.split.us:                               ; preds = %.lr.ph166, %._crit_edge161.us
  %indvars.iv120163.us = phi i64 [ %indvars.iv.next121.us, %._crit_edge161.us ], [ 0, %.lr.ph166 ]
  %5 = getelementptr inbounds double, double* %3, i64 %indvars.iv120163.us
  store double 0.000000e+00, double* %5, align 8
  %sunkaddr184 = shl nuw nsw i64 %indvars.iv120163.us, 3
  %sunkaddr185 = add i64 %sunkaddr187, %sunkaddr184
  %sunkaddr186 = inttoptr i64 %sunkaddr185 to double*
  br label %.lr.ph166.split.us.new

.lr.ph166.split.us.new:                           ; preds = %.lr.ph166.split.us.new, %.lr.ph166.split.us
  %indvars.iv118158.us = phi i64 [ 0, %.lr.ph166.split.us ], [ %indvars.iv.next119.us.1.1, %.lr.ph166.split.us.new ]
  %6 = phi double [ 0.000000e+00, %.lr.ph166.split.us ], [ %18, %.lr.ph166.split.us.new ]
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv118158.us, i64 %indvars.iv120163.us
  %8 = load double, double* %7, align 8
  %9 = fadd double %8, %6
  store double %9, double* %sunkaddr186, align 8
  %indvars.iv.next119.us = or i64 %indvars.iv118158.us, 1
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next119.us, i64 %indvars.iv120163.us
  %11 = load double, double* %10, align 8
  %12 = fadd double %11, %9
  store double %12, double* %sunkaddr186, align 8
  %indvars.iv.next119.us.1 = or i64 %indvars.iv118158.us, 2
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next119.us.1, i64 %indvars.iv120163.us
  %14 = load double, double* %13, align 8
  %15 = fadd double %14, %12
  store double %15, double* %sunkaddr186, align 8
  %indvars.iv.next119.us.129 = or i64 %indvars.iv118158.us, 3
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next119.us.129, i64 %indvars.iv120163.us
  %17 = load double, double* %16, align 8
  %18 = fadd double %17, %15
  store double %18, double* %sunkaddr186, align 8
  %indvars.iv.next119.us.1.1 = add nsw i64 %indvars.iv118158.us, 4
  %exitcond229.1.1 = icmp eq i64 %indvars.iv.next119.us.1.1, 1400
  br i1 %exitcond229.1.1, label %._crit_edge161.us, label %.lr.ph166.split.us.new

._crit_edge161.us:                                ; preds = %.lr.ph166.split.us.new
  %19 = fdiv double %18, %0
  store double %19, double* %sunkaddr186, align 8
  %indvars.iv.next121.us = add nuw nsw i64 %indvars.iv120163.us, 1
  %exitcond235 = icmp eq i64 %indvars.iv.next121.us, 1200
  br i1 %exitcond235, label %.lr.ph156.split.us.preheader, label %.lr.ph166.split.us

.lr.ph156.split.us.preheader:                     ; preds = %._crit_edge161.us
  %sunkaddr199 = ptrtoint double* %4 to i64
  br label %.lr.ph156.split.us

.lr.ph156.split.us:                               ; preds = %.lr.ph156.split.us.preheader, %._crit_edge151.us
  %indvars.iv116153.us = phi i64 [ %indvars.iv.next117.us, %._crit_edge151.us ], [ 0, %.lr.ph156.split.us.preheader ]
  %20 = getelementptr inbounds double, double* %4, i64 %indvars.iv116153.us
  store double 0.000000e+00, double* %20, align 8
  %sunkaddr192 = shl nuw nsw i64 %indvars.iv116153.us, 3
  %sunkaddr193 = add i64 %sunkaddr187, %sunkaddr192
  %sunkaddr194 = inttoptr i64 %sunkaddr193 to double*
  %sunkaddr197 = add i64 %sunkaddr199, %sunkaddr192
  %sunkaddr198 = inttoptr i64 %sunkaddr197 to double*
  br label %.lr.ph156.split.us.new

.lr.ph156.split.us.new:                           ; preds = %.lr.ph156.split.us, %.lr.ph156.split.us.new
  %indvars.iv114148.us = phi i64 [ %indvars.iv.next115.us.1, %.lr.ph156.split.us.new ], [ 0, %.lr.ph156.split.us ]
  %21 = phi double [ %33, %.lr.ph156.split.us.new ], [ 0.000000e+00, %.lr.ph156.split.us ]
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv114148.us, i64 %indvars.iv116153.us
  %23 = load double, double* %22, align 8
  %24 = load double, double* %sunkaddr194, align 8
  %25 = fsub double %23, %24
  %26 = fmul double %25, %25
  %27 = fadd double %21, %26
  store double %27, double* %sunkaddr198, align 8
  %indvars.iv.next115.us = or i64 %indvars.iv114148.us, 1
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next115.us, i64 %indvars.iv116153.us
  %29 = load double, double* %28, align 8
  %30 = load double, double* %sunkaddr194, align 8
  %31 = fsub double %29, %30
  %32 = fmul double %31, %31
  %33 = fadd double %27, %32
  store double %33, double* %sunkaddr198, align 8
  %indvars.iv.next115.us.1 = add nsw i64 %indvars.iv114148.us, 2
  %exitcond219.1 = icmp eq i64 %indvars.iv.next115.us.1, 1400
  br i1 %exitcond219.1, label %._crit_edge151.us, label %.lr.ph156.split.us.new

._crit_edge151.us:                                ; preds = %.lr.ph156.split.us.new
  %34 = fdiv double %33, %0
  store double %34, double* %sunkaddr198, align 8
  %35 = tail call double @sqrt(double %34) #4
  %36 = fcmp ugt double %35, 1.000000e-01
  %. = select i1 %36, double %35, double 1.000000e+00
  store double %., double* %sunkaddr198, align 8
  %indvars.iv.next117.us = add nuw nsw i64 %indvars.iv116153.us, 1
  %exitcond225 = icmp eq i64 %indvars.iv.next117.us, 1200
  br i1 %exitcond225, label %.._crit_edge122_crit_edge.us.preheader, label %.lr.ph156.split.us

.._crit_edge122_crit_edge.us.preheader:           ; preds = %._crit_edge151.us
  br label %.._crit_edge122_crit_edge.us

.._crit_edge122_crit_edge.us:                     ; preds = %.._crit_edge122_crit_edge.us.preheader, %._crit_edge122._crit_edge.us
  %indvars.iv112145.us = phi i64 [ %indvars.iv.next113.us, %._crit_edge122._crit_edge.us ], [ 0, %.._crit_edge122_crit_edge.us.preheader ]
  br label %._crit_edge122.us

._crit_edge122.us:                                ; preds = %._crit_edge122.us, %.._crit_edge122_crit_edge.us
  %indvars.iv110143.us = phi i64 [ 0, %.._crit_edge122_crit_edge.us ], [ %indvars.iv.next111.us, %._crit_edge122.us ]
  %37 = getelementptr inbounds double, double* %3, i64 %indvars.iv110143.us
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv112145.us, i64 %indvars.iv110143.us
  %40 = load double, double* %39, align 8
  %41 = fsub double %40, %38
  store double %41, double* %39, align 8
  %42 = tail call double @sqrt(double %0) #4
  %43 = getelementptr inbounds double, double* %4, i64 %indvars.iv110143.us
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = load double, double* %39, align 8
  %47 = fdiv double %46, %45
  store double %47, double* %39, align 8
  %indvars.iv.next111.us = add nuw nsw i64 %indvars.iv110143.us, 1
  %exitcond216 = icmp eq i64 %indvars.iv.next111.us, 1200
  br i1 %exitcond216, label %._crit_edge122._crit_edge.us, label %._crit_edge122.us

._crit_edge122._crit_edge.us:                     ; preds = %._crit_edge122.us
  %indvars.iv.next113.us = add nuw nsw i64 %indvars.iv112145.us, 1
  %exitcond217 = icmp eq i64 %indvars.iv.next113.us, 1400
  br i1 %exitcond217, label %.lr.ph141.split.us.preheader, label %.._crit_edge122_crit_edge.us

.lr.ph141.split.us.preheader:                     ; preds = %._crit_edge122._crit_edge.us
  br label %.lr.ph141.split.us

.lr.ph141.split.us:                               ; preds = %.lr.ph141.split.us.preheader, %._crit_edge136.us-lcssa.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge136.us-lcssa.us.us ], [ 1, %.lr.ph141.split.us.preheader ]
  %indvars.iv108137.us = phi i64 [ %indvars.iv.next109.us, %._crit_edge136.us-lcssa.us.us ], [ 0, %.lr.ph141.split.us.preheader ]
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv108137.us, i64 %indvars.iv108137.us
  store double 1.000000e+00, double* %48, align 8
  %49 = icmp slt i64 %indvars.iv, 1200
  br i1 %49, label %.lr.ph.us.us.preheader, label %._crit_edge136.us-lcssa.us.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph141.split.us
  br label %.lr.ph.us.us

._crit_edge136.us-lcssa.us.us.loopexit:           ; preds = %._crit_edge131.us.us
  br label %._crit_edge136.us-lcssa.us.us

._crit_edge136.us-lcssa.us.us:                    ; preds = %._crit_edge136.us-lcssa.us.us.loopexit, %.lr.ph141.split.us
  %indvars.iv.next109.us = add nuw nsw i64 %indvars.iv108137.us, 1
  %50 = icmp slt i64 %indvars.iv.next109.us, 1199
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %50, label %.lr.ph141.split.us, label %._crit_edge142

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge131.us.us
  %indvars.iv106133.us.us = phi i64 [ %indvars.iv.next107.us.us, %._crit_edge131.us.us ], [ %indvars.iv, %.lr.ph.us.us.preheader ]
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv108137.us, i64 %indvars.iv106133.us.us
  store double 0.000000e+00, double* %51, align 8
  br label %.lr.ph.us.us.new

._crit_edge131.us.us:                             ; preds = %.lr.ph.us.us.new
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv106133.us.us, i64 %indvars.iv108137.us
  store double %65, double* %52, align 8
  %indvars.iv.next107.us.us = add nuw nsw i64 %indvars.iv106133.us.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next107.us.us, 1200
  br i1 %exitcond, label %._crit_edge136.us-lcssa.us.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us, %.lr.ph.us.us.new
  %indvars.iv129.us.us = phi i64 [ %indvars.iv.next.us.us.1, %.lr.ph.us.us.new ], [ 0, %.lr.ph.us.us ]
  %53 = phi double [ %65, %.lr.ph.us.us.new ], [ 0.000000e+00, %.lr.ph.us.us ]
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv129.us.us, i64 %indvars.iv108137.us
  %55 = load double, double* %54, align 8
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv129.us.us, i64 %indvars.iv106133.us.us
  %57 = load double, double* %56, align 8
  %58 = fmul double %55, %57
  %59 = fadd double %53, %58
  store double %59, double* %51, align 8
  %indvars.iv.next.us.us = or i64 %indvars.iv129.us.us, 1
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next.us.us, i64 %indvars.iv108137.us
  %61 = load double, double* %60, align 8
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next.us.us, i64 %indvars.iv106133.us.us
  %63 = load double, double* %62, align 8
  %64 = fmul double %61, %63
  %65 = fadd double %59, %64
  store double %65, double* %51, align 8
  %indvars.iv.next.us.us.1 = add nsw i64 %indvars.iv129.us.us, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.us.us.1, 1400
  br i1 %exitcond.1, label %._crit_edge131.us.us, label %.lr.ph.us.us.new

._crit_edge142:                                   ; preds = %._crit_edge136.us-lcssa.us.us
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 1199, i64 1199
  store double 1.000000e+00, double* %66, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
.._crit_edge13_crit_edge.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.._crit_edge13_crit_edge

.._crit_edge13_crit_edge:                         ; preds = %._crit_edge13._crit_edge, %.._crit_edge13_crit_edge.preheader
  %indvars.iv1116 = phi i64 [ %indvars.iv.next12, %._crit_edge13._crit_edge ], [ 0, %.._crit_edge13_crit_edge.preheader ]
  %5 = mul nsw i64 %indvars.iv1116, 1200
  br label %6

; <label>:6:                                      ; preds = %.._crit_edge13_crit_edge, %._crit_edge
  %indvars.iv15 = phi i64 [ 0, %.._crit_edge13_crit_edge ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nsw i64 %indvars.iv15, %5
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1116, i64 %indvars.iv15
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv15, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge13._crit_edge, label %6

._crit_edge13._crit_edge:                         ; preds = %._crit_edge
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv1116, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next12, 1200
  br i1 %exitcond20, label %._crit_edge18, label %.._crit_edge13_crit_edge

._crit_edge18:                                    ; preds = %._crit_edge13._crit_edge
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

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
