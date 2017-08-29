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
  br i1 %13, label %14, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %.._crit_edge_crit_edge17

.._crit_edge_crit_edge17:                         ; preds = %14
  br label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array([1200 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge17, %.._crit_edge_crit_edge, %17
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

.._crit_edge_crit_edge:                           ; preds = %..._crit_edge_crit_edge_crit_edge, %2
  %indvars.iv15 = phi i64 [ 0, %2 ], [ %indvars.iv.next2, %..._crit_edge_crit_edge_crit_edge ]
  %3 = trunc i64 %indvars.iv15 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %.._crit_edge_crit_edge
  %indvars.iv4 = phi i64 [ 0, %.._crit_edge_crit_edge ], [ %indvars.iv.next.1, %._crit_edge.._crit_edge_crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv4, %indvars.iv15
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv15, i64 %indvars.iv4
  %indvars.iv.next = or i64 %indvars.iv4, 1
  %11 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv15
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 1.200000e+03, double 1.200000e+03>
  %17 = fadd <2 x double> %6, %16
  %18 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv4, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %19, label %._crit_edge.._crit_edge_crit_edge

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

; <label>:19:                                     ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1400
  br i1 %exitcond3, label %20, label %..._crit_edge_crit_edge_crit_edge

..._crit_edge_crit_edge_crit_edge:                ; preds = %19
  br label %.._crit_edge_crit_edge

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
.lr.ph157.split.us.preheader:
  %sunkaddr = ptrtoint double* %3 to i64
  br label %.lr.ph157.split.us

.lr.ph157.split.us:                               ; preds = %._crit_edge.us..lr.ph157.split.us_crit_edge, %.lr.ph157.split.us.preheader
  %indvars.iv113154.us = phi i64 [ 0, %.lr.ph157.split.us.preheader ], [ %indvars.iv.next114.us, %._crit_edge.us..lr.ph157.split.us_crit_edge ]
  %5 = getelementptr inbounds double, double* %3, i64 %indvars.iv113154.us
  store double 0.000000e+00, double* %5, align 8
  %sunkaddr209 = shl i64 %indvars.iv113154.us, 3
  %sunkaddr210 = add i64 %sunkaddr, %sunkaddr209
  %sunkaddr211 = inttoptr i64 %sunkaddr210 to double*
  br label %6

; <label>:6:                                      ; preds = %._crit_edge, %.lr.ph157.split.us
  %7 = phi double [ 0.000000e+00, %.lr.ph157.split.us ], [ %19, %._crit_edge ]
  %indvars.iv111151.us = phi i64 [ 0, %.lr.ph157.split.us ], [ %indvars.iv.next112.us.1.1, %._crit_edge ]
  %8 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv111151.us, i64 %indvars.iv113154.us
  %9 = load double, double* %8, align 8
  %10 = fadd double %7, %9
  store double %10, double* %sunkaddr211, align 8
  %indvars.iv.next112.us = or i64 %indvars.iv111151.us, 1
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next112.us, i64 %indvars.iv113154.us
  %12 = load double, double* %11, align 8
  %13 = fadd double %10, %12
  store double %13, double* %sunkaddr211, align 8
  %indvars.iv.next112.us.1 = or i64 %indvars.iv111151.us, 2
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next112.us.1, i64 %indvars.iv113154.us
  %15 = load double, double* %14, align 8
  %16 = fadd double %13, %15
  store double %16, double* %sunkaddr211, align 8
  %indvars.iv.next112.us.17 = or i64 %indvars.iv111151.us, 3
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next112.us.17, i64 %indvars.iv113154.us
  %18 = load double, double* %17, align 8
  %19 = fadd double %16, %18
  store double %19, double* %sunkaddr211, align 8
  %indvars.iv.next112.us.1.1 = add nsw i64 %indvars.iv111151.us, 4
  %exitcond200.1.1 = icmp eq i64 %indvars.iv.next112.us.1.1, 1400
  br i1 %exitcond200.1.1, label %._crit_edge.us, label %._crit_edge

._crit_edge:                                      ; preds = %6
  br label %6

._crit_edge.us:                                   ; preds = %6
  %20 = fdiv double %19, %0
  store double %20, double* %sunkaddr211, align 8
  %indvars.iv.next114.us = add nuw nsw i64 %indvars.iv113154.us, 1
  %exitcond201 = icmp eq i64 %indvars.iv.next114.us, 1200
  br i1 %exitcond201, label %.lr.ph150.split.us.preheader, label %._crit_edge.us..lr.ph157.split.us_crit_edge

._crit_edge.us..lr.ph157.split.us_crit_edge:      ; preds = %._crit_edge.us
  br label %.lr.ph157.split.us

.lr.ph150.split.us.preheader:                     ; preds = %._crit_edge.us
  %sunkaddr220 = ptrtoint double* %4 to i64
  br label %.lr.ph150.split.us

.lr.ph150.split.us:                               ; preds = %._crit_edge147.us..lr.ph150.split.us_crit_edge, %.lr.ph150.split.us.preheader
  %indvars.iv109148.us = phi i64 [ %indvars.iv.next110.us, %._crit_edge147.us..lr.ph150.split.us_crit_edge ], [ 0, %.lr.ph150.split.us.preheader ]
  %21 = getelementptr inbounds double, double* %4, i64 %indvars.iv109148.us
  store double 0.000000e+00, double* %21, align 8
  %sunkaddr217 = shl i64 %indvars.iv109148.us, 3
  %sunkaddr218 = add i64 %sunkaddr, %sunkaddr217
  %sunkaddr219 = inttoptr i64 %sunkaddr218 to double*
  %sunkaddr222 = add i64 %sunkaddr220, %sunkaddr217
  %sunkaddr223 = inttoptr i64 %sunkaddr222 to double*
  br label %22

; <label>:22:                                     ; preds = %._crit_edge10, %.lr.ph150.split.us
  %23 = phi double [ 0.000000e+00, %.lr.ph150.split.us ], [ %35, %._crit_edge10 ]
  %indvars.iv107144.us = phi i64 [ 0, %.lr.ph150.split.us ], [ %indvars.iv.next108.us.1, %._crit_edge10 ]
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv107144.us, i64 %indvars.iv109148.us
  %25 = load double, double* %24, align 8
  %26 = load double, double* %sunkaddr219, align 8
  %27 = fsub double %25, %26
  %28 = fmul double %27, %27
  %29 = fadd double %23, %28
  store double %29, double* %sunkaddr223, align 8
  %indvars.iv.next108.us = or i64 %indvars.iv107144.us, 1
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next108.us, i64 %indvars.iv109148.us
  %31 = load double, double* %30, align 8
  %32 = load double, double* %sunkaddr219, align 8
  %33 = fsub double %31, %32
  %34 = fmul double %33, %33
  %35 = fadd double %29, %34
  store double %35, double* %sunkaddr223, align 8
  %indvars.iv.next108.us.1 = add nuw nsw i64 %indvars.iv107144.us, 2
  %exitcond197.1 = icmp eq i64 %indvars.iv.next108.us.1, 1400
  br i1 %exitcond197.1, label %._crit_edge147.us, label %._crit_edge10

._crit_edge10:                                    ; preds = %22
  br label %22

._crit_edge147.us:                                ; preds = %22
  %36 = fdiv double %35, %0
  store double %36, double* %sunkaddr223, align 8
  %37 = tail call double @sqrt(double %36) #4
  %38 = fcmp ugt double %37, 1.000000e-01
  %39 = select i1 %38, double %37, double 1.000000e+00
  store double %39, double* %sunkaddr223, align 8
  %indvars.iv.next110.us = add nuw nsw i64 %indvars.iv109148.us, 1
  %exitcond198 = icmp eq i64 %indvars.iv.next110.us, 1200
  br i1 %exitcond198, label %._crit_edge90.._crit_edge92_crit_edge.us.preheader, label %._crit_edge147.us..lr.ph150.split.us_crit_edge

._crit_edge147.us..lr.ph150.split.us_crit_edge:   ; preds = %._crit_edge147.us
  br label %.lr.ph150.split.us

._crit_edge90.._crit_edge92_crit_edge.us.preheader: ; preds = %._crit_edge147.us
  br label %._crit_edge90.._crit_edge92_crit_edge.us

._crit_edge90.._crit_edge92_crit_edge.us:         ; preds = %._crit_edge92._crit_edge.us.._crit_edge90.._crit_edge92_crit_edge.us_crit_edge, %._crit_edge90.._crit_edge92_crit_edge.us.preheader
  %indvars.iv105142.us = phi i64 [ %indvars.iv.next106.us, %._crit_edge92._crit_edge.us.._crit_edge90.._crit_edge92_crit_edge.us_crit_edge ], [ 0, %._crit_edge90.._crit_edge92_crit_edge.us.preheader ]
  br label %._crit_edge92.us

._crit_edge92.us:                                 ; preds = %._crit_edge92.us.._crit_edge92.us_crit_edge, %._crit_edge90.._crit_edge92_crit_edge.us
  %indvars.iv103140.us = phi i64 [ 0, %._crit_edge90.._crit_edge92_crit_edge.us ], [ %indvars.iv.next104.us, %._crit_edge92.us.._crit_edge92.us_crit_edge ]
  %40 = getelementptr inbounds double, double* %3, i64 %indvars.iv103140.us
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv105142.us, i64 %indvars.iv103140.us
  %43 = load double, double* %42, align 8
  %44 = fsub double %43, %41
  store double %44, double* %42, align 8
  %45 = tail call double @sqrt(double %0) #4
  %46 = getelementptr inbounds double, double* %4, i64 %indvars.iv103140.us
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = load double, double* %42, align 8
  %50 = fdiv double %49, %48
  store double %50, double* %42, align 8
  %indvars.iv.next104.us = add nuw nsw i64 %indvars.iv103140.us, 1
  %exitcond194 = icmp eq i64 %indvars.iv.next104.us, 1200
  br i1 %exitcond194, label %._crit_edge92._crit_edge.us, label %._crit_edge92.us.._crit_edge92.us_crit_edge

._crit_edge92.us.._crit_edge92.us_crit_edge:      ; preds = %._crit_edge92.us
  br label %._crit_edge92.us

._crit_edge92._crit_edge.us:                      ; preds = %._crit_edge92.us
  %indvars.iv.next106.us = add nuw nsw i64 %indvars.iv105142.us, 1
  %exitcond195 = icmp eq i64 %indvars.iv.next106.us, 1400
  br i1 %exitcond195, label %.lr.ph.us.us.preheader.preheader, label %._crit_edge92._crit_edge.us.._crit_edge90.._crit_edge92_crit_edge.us_crit_edge

._crit_edge92._crit_edge.us.._crit_edge90.._crit_edge92_crit_edge.us_crit_edge: ; preds = %._crit_edge92._crit_edge.us
  br label %._crit_edge90.._crit_edge92_crit_edge.us

.lr.ph.us.us.preheader.preheader:                 ; preds = %._crit_edge92._crit_edge.us
  br label %.lr.ph.us.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %._crit_edge93.us..lr.ph.us.us.preheader_crit_edge, %.lr.ph.us.us.preheader.preheader
  %indvars.iv101126.us = phi i64 [ %indvars.iv.next100121.us, %._crit_edge93.us..lr.ph.us.us.preheader_crit_edge ], [ 0, %.lr.ph.us.us.preheader.preheader ]
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv101126.us, i64 %indvars.iv101126.us
  store double 1.000000e+00, double* %51, align 8
  %indvars.iv.next100121.us = add nuw nsw i64 %indvars.iv101126.us, 1
  br label %.lr.ph.us.us

._crit_edge93.us:                                 ; preds = %._crit_edge119.us.us
  %exitcond190 = icmp eq i64 %indvars.iv.next100121.us, 1199
  br i1 %exitcond190, label %._crit_edge93._crit_edge, label %._crit_edge93.us..lr.ph.us.us.preheader_crit_edge

._crit_edge93.us..lr.ph.us.us.preheader_crit_edge: ; preds = %._crit_edge93.us
  br label %.lr.ph.us.us.preheader

.lr.ph.us.us:                                     ; preds = %._crit_edge119.us.us..lr.ph.us.us_crit_edge, %.lr.ph.us.us.preheader
  %indvars.iv.next100122.us.us = phi i64 [ %indvars.iv.next100121.us, %.lr.ph.us.us.preheader ], [ %indvars.iv.next100.us.us, %._crit_edge119.us.us..lr.ph.us.us_crit_edge ]
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv101126.us, i64 %indvars.iv.next100122.us.us
  store double 0.000000e+00, double* %52, align 8
  br label %54

._crit_edge119.us.us:                             ; preds = %54
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next100122.us.us, i64 %indvars.iv101126.us
  store double %67, double* %53, align 8
  %indvars.iv.next100.us.us = add nuw nsw i64 %indvars.iv.next100122.us.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next100.us.us, 1200
  br i1 %exitcond, label %._crit_edge93.us, label %._crit_edge119.us.us..lr.ph.us.us_crit_edge

._crit_edge119.us.us..lr.ph.us.us_crit_edge:      ; preds = %._crit_edge119.us.us
  br label %.lr.ph.us.us

; <label>:54:                                     ; preds = %._crit_edge11, %.lr.ph.us.us
  %55 = phi double [ 0.000000e+00, %.lr.ph.us.us ], [ %67, %._crit_edge11 ]
  %indvars.iv117.us.us = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.us.us.1, %._crit_edge11 ]
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv117.us.us, i64 %indvars.iv101126.us
  %57 = load double, double* %56, align 8
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv117.us.us, i64 %indvars.iv.next100122.us.us
  %59 = load double, double* %58, align 8
  %60 = fmul double %57, %59
  %61 = fadd double %55, %60
  store double %61, double* %52, align 8
  %indvars.iv.next.us.us = or i64 %indvars.iv117.us.us, 1
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next.us.us, i64 %indvars.iv101126.us
  %63 = load double, double* %62, align 8
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next.us.us, i64 %indvars.iv.next100122.us.us
  %65 = load double, double* %64, align 8
  %66 = fmul double %63, %65
  %67 = fadd double %61, %66
  store double %67, double* %52, align 8
  %indvars.iv.next.us.us.1 = add nuw nsw i64 %indvars.iv117.us.us, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.us.us.1, 1400
  br i1 %exitcond.1, label %._crit_edge119.us.us, label %._crit_edge11

._crit_edge11:                                    ; preds = %54
  br label %54

._crit_edge93._crit_edge:                         ; preds = %._crit_edge93.us
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 1199, i64 1199
  store double 1.000000e+00, double* %68, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
.._crit_edge_crit_edge.lr.ph:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %._crit_edge._crit_edge..._crit_edge_crit_edge_crit_edge, %.._crit_edge_crit_edge.lr.ph
  %indvars.iv1115 = phi i64 [ 0, %.._crit_edge_crit_edge.lr.ph ], [ %indvars.iv.next12, %._crit_edge._crit_edge..._crit_edge_crit_edge_crit_edge ]
  %5 = mul nuw nsw i64 %indvars.iv1115, 1200
  br label %6

; <label>:6:                                      ; preds = %._crit_edge10._crit_edge, %.._crit_edge_crit_edge
  %indvars.iv14 = phi i64 [ 0, %.._crit_edge_crit_edge ], [ %indvars.iv.next, %._crit_edge10._crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv14, %5
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %.._crit_edge10_crit_edge

.._crit_edge10_crit_edge:                         ; preds = %6
  br label %._crit_edge10

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %.._crit_edge10_crit_edge, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1115, i64 %indvars.iv14
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv14, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge._crit_edge, label %._crit_edge10._crit_edge

._crit_edge10._crit_edge:                         ; preds = %._crit_edge10
  br label %6

._crit_edge._crit_edge:                           ; preds = %._crit_edge10
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv1115, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next12, 1200
  br i1 %exitcond17, label %._crit_edge, label %._crit_edge._crit_edge..._crit_edge_crit_edge_crit_edge

._crit_edge._crit_edge..._crit_edge_crit_edge_crit_edge: ; preds = %._crit_edge._crit_edge
  br label %.._crit_edge_crit_edge

._crit_edge:                                      ; preds = %._crit_edge._crit_edge
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
