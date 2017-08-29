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

._crit_edge:                                      ; preds = %20, %2
  %indvars.iv15 = phi i64 [ 0, %2 ], [ %indvars.iv.next2, %20 ]
  %3 = trunc i64 %indvars.iv15 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %7

; <label>:7:                                      ; preds = %7, %._crit_edge
  %indvars.iv4 = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %7 ]
  %8 = mul nuw nsw i64 %indvars.iv4, %indvars.iv15
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv4
  %indvars.iv.next = or i64 %indvars.iv4, 1
  %12 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv15
  %13 = trunc i64 %12 to i32
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %10, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 1.200000e+03, double 1.200000e+03>
  %18 = fadd <2 x double> %6, %17
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv4, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %20, label %7

; <label>:20:                                     ; preds = %7
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1400
  br i1 %exitcond3, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %20
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(double, [1200 x double]*, [1200 x double]*, double*, double*) unnamed_addr #0 {
.lr.ph85.split.us.preheader:
  %5 = alloca double, align 8
  %6 = alloca [1200 x double]*, align 8
  %7 = alloca [1200 x double]*, align 8
  %8 = alloca double*, align 8
  store double %0, double* %5, align 8
  store [1200 x double]* %1, [1200 x double]** %6, align 8
  store [1200 x double]* %2, [1200 x double]** %7, align 8
  store double* %4, double** %8, align 8
  %sunkaddr = ptrtoint double* %3 to i64
  br label %.lr.ph85.split.us

.lr.ph85.split.us:                                ; preds = %._crit_edge80.us, %.lr.ph85.split.us.preheader
  %indvars.iv3882.us = phi i64 [ 0, %.lr.ph85.split.us.preheader ], [ %indvars.iv.next39.us, %._crit_edge80.us ]
  %9 = getelementptr inbounds double, double* %3, i64 %indvars.iv3882.us
  store double 0.000000e+00, double* %9, align 8
  %sunkaddr148 = shl i64 %indvars.iv3882.us, 3
  %sunkaddr149 = add i64 %sunkaddr, %sunkaddr148
  %sunkaddr150 = inttoptr i64 %sunkaddr149 to double*
  br label %10

; <label>:10:                                     ; preds = %10, %.lr.ph85.split.us
  %11 = phi double [ 0.000000e+00, %.lr.ph85.split.us ], [ %23, %10 ]
  %indvars.iv3677.us = phi i64 [ 0, %.lr.ph85.split.us ], [ %indvars.iv.next37.us.1.1, %10 ]
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv3677.us, i64 %indvars.iv3882.us
  %13 = load double, double* %12, align 8
  %14 = fadd double %11, %13
  store double %14, double* %sunkaddr150, align 8
  %indvars.iv.next37.us = or i64 %indvars.iv3677.us, 1
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next37.us, i64 %indvars.iv3882.us
  %16 = load double, double* %15, align 8
  %17 = fadd double %14, %16
  store double %17, double* %sunkaddr150, align 8
  %indvars.iv.next37.us.1 = or i64 %indvars.iv3677.us, 2
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next37.us.1, i64 %indvars.iv3882.us
  %19 = load double, double* %18, align 8
  %20 = fadd double %17, %19
  store double %20, double* %sunkaddr150, align 8
  %indvars.iv.next37.us.117 = or i64 %indvars.iv3677.us, 3
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next37.us.117, i64 %indvars.iv3882.us
  %22 = load double, double* %21, align 8
  %23 = fadd double %20, %22
  store double %23, double* %sunkaddr150, align 8
  %indvars.iv.next37.us.1.1 = add nsw i64 %indvars.iv3677.us, 4
  %exitcond133.1.1 = icmp eq i64 %indvars.iv.next37.us.1.1, 1400
  br i1 %exitcond133.1.1, label %._crit_edge80.us, label %10

._crit_edge80.us:                                 ; preds = %10
  %24 = fdiv double %23, %0
  store double %24, double* %sunkaddr150, align 8
  %indvars.iv.next39.us = add nuw nsw i64 %indvars.iv3882.us, 1
  %exitcond134 = icmp eq i64 %indvars.iv.next39.us, 1200
  br i1 %exitcond134, label %.lr.ph76.split.us.preheader, label %.lr.ph85.split.us

.lr.ph76.split.us.preheader:                      ; preds = %._crit_edge80.us
  %sunkaddr159 = ptrtoint double* %4 to i64
  br label %.lr.ph76.split.us

.lr.ph76.split.us:                                ; preds = %.lr.ph76.split.us.preheader, %._crit_edge72.us
  %indvars.iv3474.us = phi i64 [ %indvars.iv.next35.us, %._crit_edge72.us ], [ 0, %.lr.ph76.split.us.preheader ]
  %25 = getelementptr inbounds double, double* %4, i64 %indvars.iv3474.us
  store double 0.000000e+00, double* %25, align 8
  %sunkaddr156 = shl i64 %indvars.iv3474.us, 3
  %sunkaddr157 = add i64 %sunkaddr, %sunkaddr156
  %sunkaddr158 = inttoptr i64 %sunkaddr157 to double*
  %sunkaddr161 = add i64 %sunkaddr159, %sunkaddr156
  %sunkaddr162 = inttoptr i64 %sunkaddr161 to double*
  br label %26

; <label>:26:                                     ; preds = %26, %.lr.ph76.split.us
  %27 = phi double [ 0.000000e+00, %.lr.ph76.split.us ], [ %39, %26 ]
  %indvars.iv3269.us = phi i64 [ 0, %.lr.ph76.split.us ], [ %indvars.iv.next33.us.1, %26 ]
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv3269.us, i64 %indvars.iv3474.us
  %29 = load double, double* %28, align 8
  %30 = load double, double* %sunkaddr158, align 8
  %31 = fsub double %29, %30
  %32 = fmul double %31, %31
  %33 = fadd double %27, %32
  store double %33, double* %sunkaddr162, align 8
  %indvars.iv.next33.us = or i64 %indvars.iv3269.us, 1
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next33.us, i64 %indvars.iv3474.us
  %35 = load double, double* %34, align 8
  %36 = load double, double* %sunkaddr158, align 8
  %37 = fsub double %35, %36
  %38 = fmul double %37, %37
  %39 = fadd double %33, %38
  store double %39, double* %sunkaddr162, align 8
  %indvars.iv.next33.us.1 = add nuw nsw i64 %indvars.iv3269.us, 2
  %exitcond130.1 = icmp eq i64 %indvars.iv.next33.us.1, 1400
  br i1 %exitcond130.1, label %._crit_edge72.us, label %26

._crit_edge72.us:                                 ; preds = %26
  %40 = fdiv double %39, %0
  store double %40, double* %sunkaddr162, align 8
  %41 = tail call double @sqrt(double %40) #4
  %42 = fcmp ugt double %41, 1.000000e-01
  %43 = select i1 %42, double %41, double 1.000000e+00
  store double %43, double* %sunkaddr162, align 8
  %indvars.iv.next35.us = add nuw nsw i64 %indvars.iv3474.us, 1
  %exitcond131 = icmp eq i64 %indvars.iv.next35.us, 1200
  br i1 %exitcond131, label %._crit_edge10.us.preheader, label %.lr.ph76.split.us

._crit_edge10.us.preheader:                       ; preds = %._crit_edge72.us
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %._crit_edge10.us.preheader, %._crit_edge65.us
  %44 = phi [1200 x double]* [ %58, %._crit_edge65.us ], [ %1, %._crit_edge10.us.preheader ]
  %indvars.iv3067.us = phi i64 [ %indvars.iv.next31.us, %._crit_edge65.us ], [ 0, %._crit_edge10.us.preheader ]
  br label %45

; <label>:45:                                     ; preds = %45, %._crit_edge10.us
  %46 = phi [1200 x double]* [ %44, %._crit_edge10.us ], [ %58, %45 ]
  %indvars.iv2863.us = phi i64 [ 0, %._crit_edge10.us ], [ %indvars.iv.next29.us, %45 ]
  %47 = getelementptr inbounds double, double* %3, i64 %indvars.iv2863.us
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %46, i64 %indvars.iv3067.us, i64 %indvars.iv2863.us
  %50 = load double, double* %49, align 8
  %51 = fsub double %50, %48
  store double %51, double* %49, align 8
  %52 = load double, double* %5, align 8
  %53 = tail call double @sqrt(double %52) #4
  %54 = load double*, double** %8, align 8
  %55 = getelementptr inbounds double, double* %54, i64 %indvars.iv2863.us
  %56 = load double, double* %55, align 8
  %57 = fmul double %53, %56
  %58 = load [1200 x double]*, [1200 x double]** %6, align 8
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %58, i64 %indvars.iv3067.us, i64 %indvars.iv2863.us
  %60 = load double, double* %59, align 8
  %61 = fdiv double %60, %57
  store double %61, double* %59, align 8
  %indvars.iv.next29.us = add nuw nsw i64 %indvars.iv2863.us, 1
  %exitcond127 = icmp eq i64 %indvars.iv.next29.us, 1200
  br i1 %exitcond127, label %._crit_edge65.us, label %45

._crit_edge65.us:                                 ; preds = %45
  %indvars.iv.next31.us = add nuw nsw i64 %indvars.iv3067.us, 1
  %exitcond128 = icmp eq i64 %indvars.iv.next31.us, 1400
  br i1 %exitcond128, label %.lr.ph.us.us.preheader.preheader, label %._crit_edge10.us

.lr.ph.us.us.preheader.preheader:                 ; preds = %._crit_edge65.us
  br label %.lr.ph.us.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph.us.us.preheader.preheader, %._crit_edge47.us-lcssa.us.us
  %62 = phi [1200 x double]* [ %67, %._crit_edge47.us-lcssa.us.us ], [ %2, %.lr.ph.us.us.preheader.preheader ]
  %indvars.iv2648.us = phi i64 [ %indvars.iv.next2543.us, %._crit_edge47.us-lcssa.us.us ], [ 0, %.lr.ph.us.us.preheader.preheader ]
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %62, i64 %indvars.iv2648.us, i64 %indvars.iv2648.us
  store double 1.000000e+00, double* %63, align 8
  %indvars.iv.next2543.us = add nuw nsw i64 %indvars.iv2648.us, 1
  br label %.lr.ph.us.us

._crit_edge47.us-lcssa.us.us:                     ; preds = %._crit_edge42.us.us
  %exitcond124 = icmp eq i64 %indvars.iv.next2543.us, 1199
  br i1 %exitcond124, label %._crit_edge52, label %.lr.ph.us.us.preheader

.lr.ph.us.us:                                     ; preds = %._crit_edge42.us.us, %.lr.ph.us.us.preheader
  %indvars.iv.next2544.us.us = phi i64 [ %indvars.iv.next2543.us, %.lr.ph.us.us.preheader ], [ %indvars.iv.next25.us.us, %._crit_edge42.us.us ]
  %64 = phi [1200 x double]* [ %62, %.lr.ph.us.us.preheader ], [ %67, %._crit_edge42.us.us ]
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %64, i64 %indvars.iv2648.us, i64 %indvars.iv.next2544.us.us
  store double 0.000000e+00, double* %65, align 8
  %66 = load [1200 x double]*, [1200 x double]** %6, align 8
  %67 = load [1200 x double]*, [1200 x double]** %7, align 8
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %67, i64 %indvars.iv2648.us, i64 %indvars.iv.next2544.us.us
  %.pre = load double, double* %68, align 8
  br label %70

._crit_edge42.us.us:                              ; preds = %70
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %67, i64 %indvars.iv.next2544.us.us, i64 %indvars.iv2648.us
  store double %83, double* %69, align 8
  %indvars.iv.next25.us.us = add nuw nsw i64 %indvars.iv.next2544.us.us, 1
  %exitcond123 = icmp eq i64 %indvars.iv.next25.us.us, 1200
  br i1 %exitcond123, label %._crit_edge47.us-lcssa.us.us, label %.lr.ph.us.us

; <label>:70:                                     ; preds = %70, %.lr.ph.us.us
  %71 = phi double [ %.pre, %.lr.ph.us.us ], [ %83, %70 ]
  %indvars.iv40.us.us = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.us.us.1, %70 ]
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %66, i64 %indvars.iv40.us.us, i64 %indvars.iv2648.us
  %73 = load double, double* %72, align 8
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %66, i64 %indvars.iv40.us.us, i64 %indvars.iv.next2544.us.us
  %75 = load double, double* %74, align 8
  %76 = fmul double %73, %75
  %77 = fadd double %76, %71
  store double %77, double* %68, align 8
  %indvars.iv.next.us.us = or i64 %indvars.iv40.us.us, 1
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %66, i64 %indvars.iv.next.us.us, i64 %indvars.iv2648.us
  %79 = load double, double* %78, align 8
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %66, i64 %indvars.iv.next.us.us, i64 %indvars.iv.next2544.us.us
  %81 = load double, double* %80, align 8
  %82 = fmul double %79, %81
  %83 = fadd double %82, %77
  store double %83, double* %68, align 8
  %indvars.iv.next.us.us.1 = add nuw nsw i64 %indvars.iv40.us.us, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.us.us.1, 1400
  br i1 %exitcond.1, label %._crit_edge42.us.us, label %70

._crit_edge52:                                    ; preds = %._crit_edge47.us-lcssa.us.us
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %67, i64 1199, i64 1199
  store double 1.000000e+00, double* %84, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
._crit_edge.lr.ph:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge7.us, %._crit_edge.lr.ph
  %indvars.iv38.us = phi i64 [ 0, %._crit_edge.lr.ph ], [ %indvars.iv.next4.us, %._crit_edge7.us ]
  %5 = mul nuw nsw i64 %indvars.iv38.us, 1200
  br label %6

; <label>:6:                                      ; preds = %._crit_edge2.us, %._crit_edge.us
  %indvars.iv6.us = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next.us, %._crit_edge2.us ]
  %7 = add nuw nsw i64 %indvars.iv6.us, %5
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge2.us

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %6, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv38.us, i64 %indvars.iv6.us
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv6.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond.us, label %._crit_edge7.us, label %6

._crit_edge7.us:                                  ; preds = %._crit_edge2.us
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv38.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next4.us, 1200
  br i1 %exitcond, label %._crit_edge10, label %._crit_edge.us

._crit_edge10:                                    ; preds = %._crit_edge7.us
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
