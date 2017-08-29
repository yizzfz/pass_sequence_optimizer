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

.._crit_edge_crit_edge:                           ; preds = %19, %2
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %19 ], [ 0, %2 ]
  %3 = trunc i64 %indvars.iv3 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.._crit_edge_crit_edge
  %indvars.iv = phi i64 [ 0, %.._crit_edge_crit_edge ], [ %indvars.iv.next.1, %._crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv, %indvars.iv3
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv3, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %11 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv3
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 1.200000e+03, double 1.200000e+03>
  %17 = fadd <2 x double> %6, %16
  %18 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %._crit_edge
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond = icmp eq i64 %indvars.iv.next4, 1400
  br i1 %exitcond, label %20, label %.._crit_edge_crit_edge

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
.lr.ph135.split.us.preheader:
  %sunkaddr = ptrtoint double* %3 to i64
  br label %.lr.ph135.split.us

.lr.ph135.split.us:                               ; preds = %._crit_edge.us, %.lr.ph135.split.us.preheader
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge.us ], [ 0, %.lr.ph135.split.us.preheader ]
  %5 = getelementptr inbounds double, double* %3, i64 %indvars.iv39
  store double 0.000000e+00, double* %5, align 8
  %sunkaddr3 = shl nsw i64 %indvars.iv39, 3
  %sunkaddr4 = add i64 %sunkaddr, %sunkaddr3
  %sunkaddr5 = inttoptr i64 %sunkaddr4 to double*
  br label %6

; <label>:6:                                      ; preds = %6, %.lr.ph135.split.us
  %indvars.iv189 = phi i64 [ 0, %.lr.ph135.split.us ], [ %indvars.iv.next190.1.1, %6 ]
  %7 = phi double [ 0.000000e+00, %.lr.ph135.split.us ], [ %19, %6 ]
  %8 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv189, i64 %indvars.iv39
  %9 = load double, double* %8, align 8
  %10 = fadd double %9, %7
  store double %10, double* %sunkaddr5, align 8
  %indvars.iv.next190 = or i64 %indvars.iv189, 1
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next190, i64 %indvars.iv39
  %12 = load double, double* %11, align 8
  %13 = fadd double %12, %10
  store double %13, double* %sunkaddr5, align 8
  %indvars.iv.next190.1 = or i64 %indvars.iv189, 2
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next190.1, i64 %indvars.iv39
  %15 = load double, double* %14, align 8
  %16 = fadd double %15, %13
  store double %16, double* %sunkaddr5, align 8
  %indvars.iv.next190.146 = or i64 %indvars.iv189, 3
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next190.146, i64 %indvars.iv39
  %18 = load double, double* %17, align 8
  %19 = fadd double %18, %16
  store double %19, double* %sunkaddr5, align 8
  %indvars.iv.next190.1.1 = add nsw i64 %indvars.iv189, 4
  %exitcond191.1.1 = icmp eq i64 %indvars.iv.next190.1.1, 1400
  br i1 %exitcond191.1.1, label %._crit_edge.us, label %6

._crit_edge.us:                                   ; preds = %6
  %20 = fdiv double %19, %0
  store double %20, double* %sunkaddr5, align 8
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next40, 1200
  br i1 %exitcond41, label %.lr.ph129.split.us.preheader, label %.lr.ph135.split.us

.lr.ph129.split.us.preheader:                     ; preds = %._crit_edge.us
  %sunkaddr14 = ptrtoint double* %4 to i64
  br label %.lr.ph129.split.us

.lr.ph129.split.us:                               ; preds = %._crit_edge126.us, %.lr.ph129.split.us.preheader
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %._crit_edge126.us ], [ 0, %.lr.ph129.split.us.preheader ]
  %21 = getelementptr inbounds double, double* %4, i64 %indvars.iv36
  store double 0.000000e+00, double* %21, align 8
  %sunkaddr11 = shl nsw i64 %indvars.iv36, 3
  %sunkaddr12 = add i64 %sunkaddr, %sunkaddr11
  %sunkaddr13 = inttoptr i64 %sunkaddr12 to double*
  %sunkaddr16 = add i64 %sunkaddr14, %sunkaddr11
  %sunkaddr17 = inttoptr i64 %sunkaddr16 to double*
  br label %22

; <label>:22:                                     ; preds = %22, %.lr.ph129.split.us
  %indvars.iv183 = phi i64 [ 0, %.lr.ph129.split.us ], [ %indvars.iv.next184.1, %22 ]
  %23 = phi double [ 0.000000e+00, %.lr.ph129.split.us ], [ %35, %22 ]
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv183, i64 %indvars.iv36
  %25 = load double, double* %24, align 8
  %26 = load double, double* %sunkaddr13, align 8
  %27 = fsub double %25, %26
  %28 = fmul double %27, %27
  %29 = fadd double %23, %28
  store double %29, double* %sunkaddr17, align 8
  %indvars.iv.next184 = or i64 %indvars.iv183, 1
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next184, i64 %indvars.iv36
  %31 = load double, double* %30, align 8
  %32 = load double, double* %sunkaddr13, align 8
  %33 = fsub double %31, %32
  %34 = fmul double %33, %33
  %35 = fadd double %29, %34
  store double %35, double* %sunkaddr17, align 8
  %indvars.iv.next184.1 = add nuw nsw i64 %indvars.iv183, 2
  %exitcond185.1 = icmp eq i64 %indvars.iv.next184.1, 1400
  br i1 %exitcond185.1, label %._crit_edge126.us, label %22

._crit_edge126.us:                                ; preds = %22
  %36 = fdiv double %35, %0
  store double %36, double* %sunkaddr17, align 8
  %37 = tail call double @sqrt(double %36) #4
  %38 = fcmp ugt double %37, 1.000000e-01
  %39 = select i1 %38, double %37, double 1.000000e+00
  store double %39, double* %sunkaddr17, align 8
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next37, 1200
  br i1 %exitcond38, label %._crit_edge90.._crit_edge92_crit_edge.us.preheader, label %.lr.ph129.split.us

._crit_edge90.._crit_edge92_crit_edge.us.preheader: ; preds = %._crit_edge126.us
  br label %._crit_edge90.._crit_edge92_crit_edge.us

._crit_edge90.._crit_edge92_crit_edge.us:         ; preds = %._crit_edge92._crit_edge.us, %._crit_edge90.._crit_edge92_crit_edge.us.preheader
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %._crit_edge92._crit_edge.us ], [ 0, %._crit_edge90.._crit_edge92_crit_edge.us.preheader ]
  br label %._crit_edge92.us

._crit_edge92.us:                                 ; preds = %._crit_edge92.us, %._crit_edge90.._crit_edge92_crit_edge.us
  %indvars.iv179 = phi i64 [ 0, %._crit_edge90.._crit_edge92_crit_edge.us ], [ %indvars.iv.next180, %._crit_edge92.us ]
  %40 = getelementptr inbounds double, double* %3, i64 %indvars.iv179
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv33, i64 %indvars.iv179
  %43 = load double, double* %42, align 8
  %44 = fsub double %43, %41
  store double %44, double* %42, align 8
  %45 = tail call double @sqrt(double %0) #4
  %46 = getelementptr inbounds double, double* %4, i64 %indvars.iv179
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = load double, double* %42, align 8
  %50 = fdiv double %49, %48
  store double %50, double* %42, align 8
  %indvars.iv.next180 = add nuw nsw i64 %indvars.iv179, 1
  %exitcond181 = icmp eq i64 %indvars.iv.next180, 1200
  br i1 %exitcond181, label %._crit_edge92._crit_edge.us, label %._crit_edge92.us

._crit_edge92._crit_edge.us:                      ; preds = %._crit_edge92.us
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next34, 1400
  br i1 %exitcond35, label %.lr.ph.us.us.preheader.preheader, label %._crit_edge90.._crit_edge92_crit_edge.us

.lr.ph.us.us.preheader.preheader:                 ; preds = %._crit_edge92._crit_edge.us
  br label %.lr.ph.us.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph.us.us.preheader.preheader, %._crit_edge93.us
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %._crit_edge93.us ], [ 0, %.lr.ph.us.us.preheader.preheader ]
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %._crit_edge93.us ], [ 1, %.lr.ph.us.us.preheader.preheader ]
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv31, i64 %indvars.iv31
  store double 1.000000e+00, double* %51, align 8
  br label %.lr.ph.us.us

._crit_edge93.us:                                 ; preds = %._crit_edge102.us.us
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond = icmp eq i64 %indvars.iv.next32, 1199
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  br i1 %exitcond, label %._crit_edge93._crit_edge, label %.lr.ph.us.us.preheader

.lr.ph.us.us:                                     ; preds = %._crit_edge102.us.us, %.lr.ph.us.us.preheader
  %indvars.iv28 = phi i64 [ %indvars.iv.next29, %._crit_edge102.us.us ], [ %indvars.iv26, %.lr.ph.us.us.preheader ]
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv31, i64 %indvars.iv28
  store double 0.000000e+00, double* %52, align 8
  br label %54

._crit_edge102.us.us:                             ; preds = %54
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv28, i64 %indvars.iv31
  store double %67, double* %53, align 8
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next29, 1200
  br i1 %exitcond30, label %._crit_edge93.us, label %.lr.ph.us.us

; <label>:54:                                     ; preds = %54, %.lr.ph.us.us
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %54 ]
  %55 = phi double [ 0.000000e+00, %.lr.ph.us.us ], [ %67, %54 ]
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv31
  %57 = load double, double* %56, align 8
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv28
  %59 = load double, double* %58, align 8
  %60 = fmul double %57, %59
  %61 = fadd double %55, %60
  store double %61, double* %52, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv31
  %63 = load double, double* %62, align 8
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv28
  %65 = load double, double* %64, align 8
  %66 = fmul double %63, %65
  %67 = fadd double %61, %66
  store double %67, double* %52, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge102.us.us, label %54

._crit_edge93._crit_edge:                         ; preds = %._crit_edge93.us
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 1199, i64 1199
  store double 1.000000e+00, double* %68, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
.._crit_edge_crit_edge.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.._crit_edge_crit_edge.us

.._crit_edge_crit_edge.us:                        ; preds = %._crit_edge._crit_edge.us, %.._crit_edge_crit_edge.us.preheader
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge._crit_edge.us ], [ 0, %.._crit_edge_crit_edge.us.preheader ]
  %5 = mul nuw nsw i64 %indvars.iv1, 1200
  br label %6

; <label>:6:                                      ; preds = %._crit_edge10.us, %.._crit_edge_crit_edge.us
  %indvars.iv = phi i64 [ 0, %.._crit_edge_crit_edge.us ], [ %indvars.iv.next, %._crit_edge10.us ]
  %7 = add nuw nsw i64 %indvars.iv, %5
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge10.us

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %6, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge._crit_edge.us, label %6

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge10.us
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1200
  br i1 %exitcond3, label %._crit_edge, label %.._crit_edge_crit_edge.us

._crit_edge:                                      ; preds = %._crit_edge._crit_edge.us
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
