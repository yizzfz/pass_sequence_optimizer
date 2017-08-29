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
  br i1 %16, label %17, label %.._crit_edge_crit_edge16

.._crit_edge_crit_edge16:                         ; preds = %14
  br label %._crit_edge

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to [1200 x double]*
  tail call fastcc void @print_array([1200 x double]* %18)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge16, %.._crit_edge_crit_edge, %17
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
  %indvars.iv3 = phi i64 [ 0, %2 ], [ %indvars.iv.next4, %..._crit_edge_crit_edge_crit_edge ]
  %3 = trunc i64 %indvars.iv3 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %.._crit_edge_crit_edge
  %indvars.iv = phi i64 [ 0, %.._crit_edge_crit_edge ], [ %indvars.iv.next.1, %._crit_edge.._crit_edge_crit_edge ]
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
  br i1 %exitcond.1, label %19, label %._crit_edge.._crit_edge_crit_edge

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

; <label>:19:                                     ; preds = %._crit_edge
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond = icmp eq i64 %indvars.iv.next4, 1400
  br i1 %exitcond, label %20, label %..._crit_edge_crit_edge_crit_edge

..._crit_edge_crit_edge_crit_edge:                ; preds = %19
  br label %.._crit_edge_crit_edge

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
.lr.ph135.split.us.preheader:
  %sunkaddr = ptrtoint double* %3 to i64
  %sunkaddr.1 = ptrtoint double* %3 to i64
  %sunkaddr22 = ptrtoint double* %3 to i64
  br label %.lr.ph135.split.us

.lr.ph135.split.us:                               ; preds = %._crit_edge.us..lr.ph135.split.us_crit_edge, %.lr.ph135.split.us.preheader
  %indvars.iv16 = phi i64 [ 0, %.lr.ph135.split.us.preheader ], [ %indvars.iv.next17, %._crit_edge.us..lr.ph135.split.us_crit_edge ]
  %5 = getelementptr inbounds double, double* %3, i64 %indvars.iv16
  store double 0.000000e+00, double* %5, align 8
  %sunkaddr199 = shl nsw i64 %indvars.iv16, 3
  %sunkaddr200 = add i64 %sunkaddr, %sunkaddr199
  %sunkaddr201 = inttoptr i64 %sunkaddr200 to double*
  %sunkaddr199.1 = shl nsw i64 %indvars.iv16, 3
  %sunkaddr200.1 = add i64 %sunkaddr.1, %sunkaddr199.1
  %sunkaddr201.1 = inttoptr i64 %sunkaddr200.1 to double*
  br label %6

; <label>:6:                                      ; preds = %._crit_edge, %.lr.ph135.split.us
  %indvars.iv189 = phi i64 [ 0, %.lr.ph135.split.us ], [ %indvars.iv.next190.1.1, %._crit_edge ]
  %7 = phi double [ 0.000000e+00, %.lr.ph135.split.us ], [ %19, %._crit_edge ]
  %8 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv189, i64 %indvars.iv16
  %9 = load double, double* %8, align 8
  %10 = fadd double %9, %7
  store double %10, double* %sunkaddr201, align 8
  %indvars.iv.next190 = or i64 %indvars.iv189, 1
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next190, i64 %indvars.iv16
  %12 = load double, double* %11, align 8
  %13 = fadd double %12, %10
  store double %13, double* %sunkaddr201, align 8
  %indvars.iv.next190.1 = or i64 %indvars.iv189, 2
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next190.1, i64 %indvars.iv16
  %15 = load double, double* %14, align 8
  %16 = fadd double %15, %13
  store double %16, double* %sunkaddr201.1, align 8
  %indvars.iv.next190.121 = or i64 %indvars.iv189, 3
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next190.121, i64 %indvars.iv16
  %18 = load double, double* %17, align 8
  %19 = fadd double %18, %16
  store double %19, double* %sunkaddr201.1, align 8
  %indvars.iv.next190.1.1 = add nsw i64 %indvars.iv189, 4
  %exitcond191.1.1 = icmp eq i64 %indvars.iv.next190.1.1, 1400
  br i1 %exitcond191.1.1, label %._crit_edge.us, label %._crit_edge

._crit_edge:                                      ; preds = %6
  br label %6

._crit_edge.us:                                   ; preds = %6
  %20 = fdiv double %19, %0
  %sunkaddr23 = mul i64 %indvars.iv16, 8
  %sunkaddr24 = add i64 %sunkaddr22, %sunkaddr23
  %sunkaddr25 = inttoptr i64 %sunkaddr24 to double*
  store double %20, double* %sunkaddr25, align 8
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 1200
  br i1 %exitcond18, label %.lr.ph129.split.us.preheader, label %._crit_edge.us..lr.ph135.split.us_crit_edge

._crit_edge.us..lr.ph135.split.us_crit_edge:      ; preds = %._crit_edge.us
  br label %.lr.ph135.split.us

.lr.ph129.split.us.preheader:                     ; preds = %._crit_edge.us
  %21 = ptrtoint double* %3 to i64
  %sunkaddr210 = ptrtoint double* %4 to i64
  %sunkaddr26 = ptrtoint double* %4 to i64
  br label %.lr.ph129.split.us

.lr.ph129.split.us:                               ; preds = %._crit_edge126.us..lr.ph129.split.us_crit_edge, %.lr.ph129.split.us.preheader
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %._crit_edge126.us..lr.ph129.split.us_crit_edge ], [ 0, %.lr.ph129.split.us.preheader ]
  %22 = getelementptr inbounds double, double* %4, i64 %indvars.iv13
  store double 0.000000e+00, double* %22, align 8
  %sunkaddr207 = shl nsw i64 %indvars.iv13, 3
  %sunkaddr208 = add i64 %21, %sunkaddr207
  %sunkaddr209 = inttoptr i64 %sunkaddr208 to double*
  %sunkaddr212 = add i64 %sunkaddr210, %sunkaddr207
  %sunkaddr213 = inttoptr i64 %sunkaddr212 to double*
  br label %23

; <label>:23:                                     ; preds = %._crit_edge32, %.lr.ph129.split.us
  %indvars.iv183 = phi i64 [ 0, %.lr.ph129.split.us ], [ %indvars.iv.next184.1, %._crit_edge32 ]
  %24 = phi double [ 0.000000e+00, %.lr.ph129.split.us ], [ %36, %._crit_edge32 ]
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv183, i64 %indvars.iv13
  %26 = load double, double* %25, align 8
  %27 = load double, double* %sunkaddr209, align 8
  %28 = fsub double %26, %27
  %29 = fmul double %28, %28
  %30 = fadd double %24, %29
  store double %30, double* %sunkaddr213, align 8
  %indvars.iv.next184 = or i64 %indvars.iv183, 1
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next184, i64 %indvars.iv13
  %32 = load double, double* %31, align 8
  %33 = load double, double* %sunkaddr209, align 8
  %34 = fsub double %32, %33
  %35 = fmul double %34, %34
  %36 = fadd double %30, %35
  store double %36, double* %sunkaddr213, align 8
  %indvars.iv.next184.1 = add nuw nsw i64 %indvars.iv183, 2
  %exitcond185.1 = icmp eq i64 %indvars.iv.next184.1, 1400
  br i1 %exitcond185.1, label %._crit_edge126.us, label %._crit_edge32

._crit_edge32:                                    ; preds = %23
  br label %23

._crit_edge126.us:                                ; preds = %23
  %37 = fdiv double %36, %0
  %sunkaddr27 = mul i64 %indvars.iv13, 8
  %sunkaddr28 = add i64 %sunkaddr26, %sunkaddr27
  %sunkaddr29 = inttoptr i64 %sunkaddr28 to double*
  store double %37, double* %sunkaddr29, align 8
  %38 = tail call double @sqrt(double %37) #4
  %39 = fcmp ugt double %38, 1.000000e-01
  %40 = select i1 %39, double %38, double 1.000000e+00
  store double %40, double* %sunkaddr29, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 1200
  br i1 %exitcond15, label %._crit_edge90.._crit_edge92_crit_edge.us.preheader, label %._crit_edge126.us..lr.ph129.split.us_crit_edge

._crit_edge126.us..lr.ph129.split.us_crit_edge:   ; preds = %._crit_edge126.us
  br label %.lr.ph129.split.us

._crit_edge90.._crit_edge92_crit_edge.us.preheader: ; preds = %._crit_edge126.us
  br label %._crit_edge90.._crit_edge92_crit_edge.us

._crit_edge90.._crit_edge92_crit_edge.us:         ; preds = %._crit_edge92._crit_edge.us.._crit_edge90.._crit_edge92_crit_edge.us_crit_edge, %._crit_edge90.._crit_edge92_crit_edge.us.preheader
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %._crit_edge92._crit_edge.us.._crit_edge90.._crit_edge92_crit_edge.us_crit_edge ], [ 0, %._crit_edge90.._crit_edge92_crit_edge.us.preheader ]
  br label %._crit_edge92.us

._crit_edge92.us:                                 ; preds = %._crit_edge92.us.._crit_edge92.us_crit_edge, %._crit_edge90.._crit_edge92_crit_edge.us
  %indvars.iv179 = phi i64 [ 0, %._crit_edge90.._crit_edge92_crit_edge.us ], [ %indvars.iv.next180, %._crit_edge92.us.._crit_edge92.us_crit_edge ]
  %41 = getelementptr inbounds double, double* %3, i64 %indvars.iv179
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv10, i64 %indvars.iv179
  %44 = load double, double* %43, align 8
  %45 = fsub double %44, %42
  store double %45, double* %43, align 8
  %46 = tail call double @sqrt(double %0) #4
  %47 = getelementptr inbounds double, double* %4, i64 %indvars.iv179
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = load double, double* %43, align 8
  %51 = fdiv double %50, %49
  store double %51, double* %43, align 8
  %indvars.iv.next180 = add nuw nsw i64 %indvars.iv179, 1
  %exitcond181 = icmp eq i64 %indvars.iv.next180, 1200
  br i1 %exitcond181, label %._crit_edge92._crit_edge.us, label %._crit_edge92.us.._crit_edge92.us_crit_edge

._crit_edge92.us.._crit_edge92.us_crit_edge:      ; preds = %._crit_edge92.us
  br label %._crit_edge92.us

._crit_edge92._crit_edge.us:                      ; preds = %._crit_edge92.us
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 1400
  br i1 %exitcond12, label %.lr.ph.us.us.preheader.preheader, label %._crit_edge92._crit_edge.us.._crit_edge90.._crit_edge92_crit_edge.us_crit_edge

._crit_edge92._crit_edge.us.._crit_edge90.._crit_edge92_crit_edge.us_crit_edge: ; preds = %._crit_edge92._crit_edge.us
  br label %._crit_edge90.._crit_edge92_crit_edge.us

.lr.ph.us.us.preheader.preheader:                 ; preds = %._crit_edge92._crit_edge.us
  br label %.lr.ph.us.us.preheader

.lr.ph.us.us.preheader:                           ; preds = %._crit_edge93.us..lr.ph.us.us.preheader_crit_edge, %.lr.ph.us.us.preheader.preheader
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %._crit_edge93.us..lr.ph.us.us.preheader_crit_edge ], [ 0, %.lr.ph.us.us.preheader.preheader ]
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %._crit_edge93.us..lr.ph.us.us.preheader_crit_edge ], [ 1, %.lr.ph.us.us.preheader.preheader ]
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv8, i64 %indvars.iv8
  store double 1.000000e+00, double* %52, align 8
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  br label %.lr.ph.us.us

._crit_edge93.us:                                 ; preds = %._crit_edge102.us.us
  %exitcond = icmp eq i64 %indvars.iv.next9, 1199
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  br i1 %exitcond, label %._crit_edge93._crit_edge, label %._crit_edge93.us..lr.ph.us.us.preheader_crit_edge

._crit_edge93.us..lr.ph.us.us.preheader_crit_edge: ; preds = %._crit_edge93.us
  br label %.lr.ph.us.us.preheader

.lr.ph.us.us:                                     ; preds = %._crit_edge102.us.us..lr.ph.us.us_crit_edge, %.lr.ph.us.us.preheader
  %indvars.iv5 = phi i64 [ %indvars.iv3, %.lr.ph.us.us.preheader ], [ %indvars.iv.next6, %._crit_edge102.us.us..lr.ph.us.us_crit_edge ]
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv8, i64 %indvars.iv5
  store double 0.000000e+00, double* %53, align 8
  br label %55

._crit_edge102.us.us:                             ; preds = %55
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv5, i64 %indvars.iv8
  store double %68, double* %54, align 8
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1200
  br i1 %exitcond7, label %._crit_edge93.us, label %._crit_edge102.us.us..lr.ph.us.us_crit_edge

._crit_edge102.us.us..lr.ph.us.us_crit_edge:      ; preds = %._crit_edge102.us.us
  br label %.lr.ph.us.us

; <label>:55:                                     ; preds = %._crit_edge33, %.lr.ph.us.us
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %._crit_edge33 ]
  %56 = phi double [ 0.000000e+00, %.lr.ph.us.us ], [ %68, %._crit_edge33 ]
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv8
  %58 = load double, double* %57, align 8
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv5
  %60 = load double, double* %59, align 8
  %61 = fmul double %58, %60
  %62 = fadd double %56, %61
  store double %62, double* %53, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv8
  %64 = load double, double* %63, align 8
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv5
  %66 = load double, double* %65, align 8
  %67 = fmul double %64, %66
  %68 = fadd double %62, %67
  store double %68, double* %53, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge102.us.us, label %._crit_edge33

._crit_edge33:                                    ; preds = %55
  br label %55

._crit_edge93._crit_edge:                         ; preds = %._crit_edge93.us
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 1199, i64 1199
  store double 1.000000e+00, double* %69, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
.._crit_edge10_crit_edge.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.._crit_edge10_crit_edge.us

.._crit_edge10_crit_edge.us:                      ; preds = %._crit_edge10._crit_edge.us..._crit_edge10_crit_edge.us_crit_edge, %.._crit_edge10_crit_edge.us.preheader
  %indvars.iv1 = phi i64 [ 0, %.._crit_edge10_crit_edge.us.preheader ], [ %indvars.iv.next2, %._crit_edge10._crit_edge.us..._crit_edge10_crit_edge.us_crit_edge ]
  %5 = mul nuw nsw i64 %indvars.iv1, 1200
  br label %6

; <label>:6:                                      ; preds = %._crit_edge.us._crit_edge, %.._crit_edge10_crit_edge.us
  %indvars.iv = phi i64 [ 0, %.._crit_edge10_crit_edge.us ], [ %indvars.iv.next, %._crit_edge.us._crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv, %5
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %.._crit_edge.us_crit_edge

.._crit_edge.us_crit_edge:                        ; preds = %6
  br label %._crit_edge.us

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.._crit_edge.us_crit_edge, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge10._crit_edge.us, label %._crit_edge.us._crit_edge

._crit_edge.us._crit_edge:                        ; preds = %._crit_edge.us
  br label %6

._crit_edge10._crit_edge.us:                      ; preds = %._crit_edge.us
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1200
  br i1 %exitcond3, label %._crit_edge13, label %._crit_edge10._crit_edge.us..._crit_edge10_crit_edge.us_crit_edge

._crit_edge10._crit_edge.us..._crit_edge10_crit_edge.us_crit_edge: ; preds = %._crit_edge10._crit_edge.us
  br label %.._crit_edge10_crit_edge.us

._crit_edge13:                                    ; preds = %._crit_edge10._crit_edge.us
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
