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
  %18 = bitcast i8* %5 to [1200 x double]*
  tail call fastcc void @print_array([1200 x double]* %18)
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
  %storemerge8 = phi i32 [ 0, %2 ], [ %20, %19 ]
  %3 = sitofp i32 %storemerge8 to double
  %4 = sext i32 %storemerge8 to i64
  %5 = insertelement <2 x double> undef, double %3, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.._crit_edge_crit_edge
  %indvars.iv = phi i64 [ 0, %.._crit_edge_crit_edge ], [ %indvars.iv.next.1, %._crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv, %4
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %4, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %11 = mul nuw nsw i64 %indvars.iv.next, %4
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 1.200000e+03, double 1.200000e+03>
  %17 = fadd <2 x double> %6, %16
  %18 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %._crit_edge
  %20 = add nsw i32 %storemerge8, 1
  %21 = icmp slt i32 %20, 1400
  br i1 %21, label %.._crit_edge_crit_edge, label %22

; <label>:22:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
.lr.ph135:
  br label %.lr.ph135.split.us

.lr.ph135.split.us:                               ; preds = %._crit_edge.us, %.lr.ph135
  %storemerge133.us = phi i32 [ 0, %.lr.ph135 ], [ %21, %._crit_edge.us ]
  %5 = sext i32 %storemerge133.us to i64
  %6 = getelementptr inbounds double, double* %3, i64 %5
  store double 0.000000e+00, double* %6, align 8
  br label %.lr.ph135.split.us.new

.lr.ph135.split.us.new:                           ; preds = %.lr.ph135.split.us.new, %.lr.ph135.split.us
  %indvars.iv199 = phi i64 [ 0, %.lr.ph135.split.us ], [ %indvars.iv.next200.1.1, %.lr.ph135.split.us.new ]
  %7 = phi double [ 0.000000e+00, %.lr.ph135.split.us ], [ %19, %.lr.ph135.split.us.new ]
  %8 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv199, i64 %5
  %9 = load double, double* %8, align 8
  %10 = fadd double %9, %7
  %sunkaddr = ptrtoint double* %3 to i64
  %sunkaddr38 = mul i64 %5, 8
  %sunkaddr39 = add i64 %sunkaddr, %sunkaddr38
  %sunkaddr40 = inttoptr i64 %sunkaddr39 to double*
  store double %10, double* %sunkaddr40, align 8
  %indvars.iv.next200 = or i64 %indvars.iv199, 1
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next200, i64 %5
  %12 = load double, double* %11, align 8
  %13 = fadd double %12, %10
  store double %13, double* %sunkaddr40, align 8
  %indvars.iv.next200.1 = or i64 %indvars.iv199, 2
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next200.1, i64 %5
  %15 = load double, double* %14, align 8
  %16 = fadd double %15, %13
  store double %16, double* %sunkaddr40, align 8
  %indvars.iv.next200.135 = or i64 %indvars.iv199, 3
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next200.135, i64 %5
  %18 = load double, double* %17, align 8
  %19 = fadd double %18, %16
  store double %19, double* %sunkaddr40, align 8
  %indvars.iv.next200.1.1 = add nsw i64 %indvars.iv199, 4
  %exitcond202.1.1 = icmp eq i64 %indvars.iv.next200.1.1, 1400
  br i1 %exitcond202.1.1, label %._crit_edge.us, label %.lr.ph135.split.us.new

._crit_edge.us:                                   ; preds = %.lr.ph135.split.us.new
  %20 = fdiv double %19, %0
  %sunkaddr41 = ptrtoint double* %3 to i64
  %sunkaddr42 = mul i64 %5, 8
  %sunkaddr43 = add i64 %sunkaddr41, %sunkaddr42
  %sunkaddr44 = inttoptr i64 %sunkaddr43 to double*
  store double %20, double* %sunkaddr44, align 8
  %21 = add nsw i32 %storemerge133.us, 1
  %22 = icmp slt i32 %21, 1200
  br i1 %22, label %.lr.ph135.split.us, label %.lr.ph129.split.us.preheader

.lr.ph129.split.us.preheader:                     ; preds = %._crit_edge.us
  br label %.lr.ph129.split.us

.lr.ph129.split.us:                               ; preds = %._crit_edge126.us, %.lr.ph129.split.us.preheader
  %storemerge1128.us = phi i32 [ 0, %.lr.ph129.split.us.preheader ], [ %42, %._crit_edge126.us ]
  %23 = sext i32 %storemerge1128.us to i64
  %24 = getelementptr inbounds double, double* %4, i64 %23
  store double 0.000000e+00, double* %24, align 8
  br label %.lr.ph129.split.us.new

.lr.ph129.split.us.new:                           ; preds = %.lr.ph129.split.us.new, %.lr.ph129.split.us
  %indvars.iv184 = phi i64 [ 0, %.lr.ph129.split.us ], [ %indvars.iv.next185.1, %.lr.ph129.split.us.new ]
  %25 = phi double [ 0.000000e+00, %.lr.ph129.split.us ], [ %37, %.lr.ph129.split.us.new ]
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv184, i64 %23
  %27 = load double, double* %26, align 8
  %sunkaddr45 = ptrtoint double* %3 to i64
  %sunkaddr46 = mul i64 %23, 8
  %sunkaddr47 = add i64 %sunkaddr45, %sunkaddr46
  %sunkaddr48 = inttoptr i64 %sunkaddr47 to double*
  %28 = load double, double* %sunkaddr48, align 8
  %29 = fsub double %27, %28
  %30 = fmul double %29, %29
  %31 = fadd double %25, %30
  %sunkaddr49 = ptrtoint double* %4 to i64
  %sunkaddr50 = mul i64 %23, 8
  %sunkaddr51 = add i64 %sunkaddr49, %sunkaddr50
  %sunkaddr52 = inttoptr i64 %sunkaddr51 to double*
  store double %31, double* %sunkaddr52, align 8
  %indvars.iv.next185 = or i64 %indvars.iv184, 1
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next185, i64 %23
  %33 = load double, double* %32, align 8
  %34 = load double, double* %sunkaddr48, align 8
  %35 = fsub double %33, %34
  %36 = fmul double %35, %35
  %37 = fadd double %31, %36
  store double %37, double* %sunkaddr52, align 8
  %indvars.iv.next185.1 = add nsw i64 %indvars.iv184, 2
  %exitcond187.1 = icmp eq i64 %indvars.iv.next185.1, 1400
  br i1 %exitcond187.1, label %._crit_edge126.us, label %.lr.ph129.split.us.new

._crit_edge126.us:                                ; preds = %.lr.ph129.split.us.new
  %38 = fdiv double %37, %0
  %sunkaddr53 = ptrtoint double* %4 to i64
  %sunkaddr54 = mul i64 %23, 8
  %sunkaddr55 = add i64 %sunkaddr53, %sunkaddr54
  %sunkaddr56 = inttoptr i64 %sunkaddr55 to double*
  store double %38, double* %sunkaddr56, align 8
  %39 = tail call double @sqrt(double %38) #4
  %40 = fcmp ugt double %39, 1.000000e-01
  %41 = select i1 %40, double %39, double 1.000000e+00
  store double %41, double* %sunkaddr56, align 8
  %42 = add nsw i32 %storemerge1128.us, 1
  %43 = icmp slt i32 %42, 1200
  br i1 %43, label %.lr.ph129.split.us, label %._crit_edge90.._crit_edge92_crit_edge.us.preheader

._crit_edge90.._crit_edge92_crit_edge.us.preheader: ; preds = %._crit_edge126.us
  br label %._crit_edge90.._crit_edge92_crit_edge.us

._crit_edge90.._crit_edge92_crit_edge.us:         ; preds = %._crit_edge90.._crit_edge92_crit_edge.us.preheader, %._crit_edge92._crit_edge.us
  %storemerge2122.us = phi i32 [ %56, %._crit_edge92._crit_edge.us ], [ 0, %._crit_edge90.._crit_edge92_crit_edge.us.preheader ]
  %44 = sext i32 %storemerge2122.us to i64
  br label %._crit_edge92.us

._crit_edge92.us:                                 ; preds = %._crit_edge92.us, %._crit_edge90.._crit_edge92_crit_edge.us
  %indvars.iv179 = phi i64 [ 0, %._crit_edge90.._crit_edge92_crit_edge.us ], [ %indvars.iv.next180, %._crit_edge92.us ]
  %45 = getelementptr inbounds double, double* %3, i64 %indvars.iv179
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %44, i64 %indvars.iv179
  %48 = load double, double* %47, align 8
  %49 = fsub double %48, %46
  store double %49, double* %47, align 8
  %50 = tail call double @sqrt(double %0) #4
  %51 = getelementptr inbounds double, double* %4, i64 %indvars.iv179
  %52 = load double, double* %51, align 8
  %53 = fmul double %50, %52
  %54 = load double, double* %47, align 8
  %55 = fdiv double %54, %53
  store double %55, double* %47, align 8
  %indvars.iv.next180 = add nuw nsw i64 %indvars.iv179, 1
  %exitcond182 = icmp eq i64 %indvars.iv.next180, 1200
  br i1 %exitcond182, label %._crit_edge92._crit_edge.us, label %._crit_edge92.us

._crit_edge92._crit_edge.us:                      ; preds = %._crit_edge92.us
  %56 = add nsw i32 %storemerge2122.us, 1
  %57 = icmp slt i32 %56, 1400
  br i1 %57, label %._crit_edge90.._crit_edge92_crit_edge.us, label %.lr.ph110.split.us.preheader

.lr.ph110.split.us.preheader:                     ; preds = %._crit_edge92._crit_edge.us
  br label %.lr.ph110.split.us

.lr.ph110.split.us:                               ; preds = %.lr.ph110.split.us.preheader, %._crit_edge93.us
  %storemerge3109.us = phi i32 [ %storemerge4104.us, %._crit_edge93.us ], [ 0, %.lr.ph110.split.us.preheader ]
  %58 = sext i32 %storemerge3109.us to i64
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %58, i64 %58
  store double 1.000000e+00, double* %59, align 8
  %storemerge4104.us = add nsw i32 %storemerge3109.us, 1
  %60 = icmp slt i32 %storemerge4104.us, 1200
  br i1 %60, label %.lr.ph.us.us.preheader, label %._crit_edge93.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph110.split.us
  br label %.lr.ph.us.us

._crit_edge93.us.loopexit:                        ; preds = %._crit_edge102.us.us
  br label %._crit_edge93.us

._crit_edge93.us:                                 ; preds = %._crit_edge93.us.loopexit, %.lr.ph110.split.us
  %61 = icmp slt i32 %storemerge4104.us, 1199
  br i1 %61, label %.lr.ph110.split.us, label %._crit_edge93._crit_edge

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge102.us.us
  %storemerge4105.us.us = phi i32 [ %storemerge4.us.us, %._crit_edge102.us.us ], [ %storemerge4104.us, %.lr.ph.us.us.preheader ]
  %62 = sext i32 %storemerge4105.us.us to i64
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %58, i64 %62
  store double 0.000000e+00, double* %63, align 8
  br label %.lr.ph.us.us.new

._crit_edge102.us.us:                             ; preds = %.lr.ph.us.us.new
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %62, i64 %58
  store double %78, double* %64, align 8
  %storemerge4.us.us = add nsw i32 %storemerge4105.us.us, 1
  %65 = icmp slt i32 %storemerge4.us.us, 1200
  br i1 %65, label %.lr.ph.us.us, label %._crit_edge93.us.loopexit

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us.new, %.lr.ph.us.us
  %indvars.iv = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.1, %.lr.ph.us.us.new ]
  %66 = phi double [ 0.000000e+00, %.lr.ph.us.us ], [ %78, %.lr.ph.us.us.new ]
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %58
  %68 = load double, double* %67, align 8
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %62
  %70 = load double, double* %69, align 8
  %71 = fmul double %68, %70
  %72 = fadd double %66, %71
  store double %72, double* %63, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %58
  %74 = load double, double* %73, align 8
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %62
  %76 = load double, double* %75, align 8
  %77 = fmul double %74, %76
  %78 = fadd double %72, %77
  store double %78, double* %63, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge102.us.us, label %.lr.ph.us.us.new

._crit_edge93._crit_edge:                         ; preds = %._crit_edge93.us
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 1199, i64 1199
  store double 1.000000e+00, double* %79, align 8
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
  %storemerge12.us = phi i32 [ 0, %.._crit_edge_crit_edge.us.preheader ], [ %18, %._crit_edge._crit_edge.us ]
  %5 = mul nsw i32 %storemerge12.us, 1200
  %6 = sext i32 %storemerge12.us to i64
  %7 = zext i32 %5 to i64
  br label %._crit_edge10.us._crit_edge

._crit_edge10.us._crit_edge:                      ; preds = %._crit_edge10.us, %.._crit_edge_crit_edge.us
  %indvars.iv = phi i64 [ 0, %.._crit_edge_crit_edge.us ], [ %indvars.iv.next, %._crit_edge10.us ]
  %8 = add i64 %indvars.iv, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge10.us

; <label>:12:                                     ; preds = %._crit_edge10.us._crit_edge
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge10.us

._crit_edge10.us:                                 ; preds = %._crit_edge10.us._crit_edge, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %6, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge._crit_edge.us, label %._crit_edge10.us._crit_edge

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge10.us
  %18 = add nsw i32 %storemerge12.us, 1
  %19 = icmp slt i32 %18, 1200
  br i1 %19, label %.._crit_edge_crit_edge.us, label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge._crit_edge.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
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
