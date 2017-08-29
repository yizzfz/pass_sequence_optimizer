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
  %indvars.iv8 = phi i64 [ 0, %2 ], [ %indvars.iv.next9, %20 ]
  %3 = trunc i64 %indvars.iv8 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %7

; <label>:7:                                      ; preds = %7, %._crit_edge
  %indvars.iv = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %7 ]
  %8 = mul nuw nsw i64 %indvars.iv, %indvars.iv8
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv8, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %12 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv8
  %13 = trunc i64 %12 to i32
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %10, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 1.200000e+03, double 1.200000e+03>
  %18 = fadd <2 x double> %6, %17
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %20, label %7

; <label>:20:                                     ; preds = %7
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond = icmp eq i64 %indvars.iv.next9, 1400
  br i1 %exitcond, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %20
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
.lr.ph137:
  %sunkaddr230 = ptrtoint double* %3 to i64
  br label %.lr.ph137.split.us

.lr.ph137.split.us:                               ; preds = %._crit_edge133.us, %.lr.ph137
  %indvars.iv205 = phi i64 [ 0, %.lr.ph137 ], [ %indvars.iv.next206, %._crit_edge133.us ]
  %5 = getelementptr inbounds double, double* %3, i64 %indvars.iv205
  store double 0.000000e+00, double* %5, align 8
  %sunkaddr231 = shl i64 %indvars.iv205, 3
  %sunkaddr232 = add i64 %sunkaddr230, %sunkaddr231
  %sunkaddr233 = inttoptr i64 %sunkaddr232 to double*
  br label %.lr.ph137.split.us.new

.lr.ph137.split.us.new:                           ; preds = %.lr.ph137.split.us, %.lr.ph137.split.us.new
  %indvars.iv195 = phi i64 [ %indvars.iv.next196.3, %.lr.ph137.split.us.new ], [ 0, %.lr.ph137.split.us ]
  %6 = phi double [ %18, %.lr.ph137.split.us.new ], [ 0.000000e+00, %.lr.ph137.split.us ]
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv195, i64 %indvars.iv205
  %8 = load double, double* %7, align 8
  %9 = fadd double %6, %8
  store double %9, double* %sunkaddr233, align 8
  %indvars.iv.next196 = or i64 %indvars.iv195, 1
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next196, i64 %indvars.iv205
  %11 = load double, double* %10, align 8
  %12 = fadd double %9, %11
  store double %12, double* %sunkaddr233, align 8
  %indvars.iv.next196.1 = or i64 %indvars.iv195, 2
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next196.1, i64 %indvars.iv205
  %14 = load double, double* %13, align 8
  %15 = fadd double %12, %14
  store double %15, double* %sunkaddr233, align 8
  %indvars.iv.next196.2 = or i64 %indvars.iv195, 3
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next196.2, i64 %indvars.iv205
  %17 = load double, double* %16, align 8
  %18 = fadd double %15, %17
  store double %18, double* %sunkaddr233, align 8
  %indvars.iv.next196.3 = add nsw i64 %indvars.iv195, 4
  %exitcond198.3 = icmp eq i64 %indvars.iv.next196.3, 1400
  br i1 %exitcond198.3, label %._crit_edge133.us, label %.lr.ph137.split.us.new

._crit_edge133.us:                                ; preds = %.lr.ph137.split.us.new
  %19 = fdiv double %18, %0
  store double %19, double* %sunkaddr233, align 8
  %indvars.iv.next206 = add nuw nsw i64 %indvars.iv205, 1
  %exitcond208 = icmp eq i64 %indvars.iv.next206, 1200
  br i1 %exitcond208, label %.lr.ph129.split.us.preheader, label %.lr.ph137.split.us

.lr.ph129.split.us.preheader:                     ; preds = %._crit_edge133.us
  %sunkaddr250 = ptrtoint double* %4 to i64
  br label %.lr.ph129.split.us

.lr.ph129.split.us:                               ; preds = %.lr.ph129.split.us.preheader, %._crit_edge126.us
  %indvars.iv185 = phi i64 [ %indvars.iv.next186, %._crit_edge126.us ], [ 0, %.lr.ph129.split.us.preheader ]
  %20 = getelementptr inbounds double, double* %4, i64 %indvars.iv185
  store double 0.000000e+00, double* %20, align 8
  %sunkaddr247 = shl i64 %indvars.iv185, 3
  %sunkaddr248 = add i64 %sunkaddr230, %sunkaddr247
  %sunkaddr249 = inttoptr i64 %sunkaddr248 to double*
  %sunkaddr252 = add i64 %sunkaddr250, %sunkaddr247
  %sunkaddr253 = inttoptr i64 %sunkaddr252 to double*
  br label %.lr.ph129.split.us.new

.lr.ph129.split.us.new:                           ; preds = %.lr.ph129.split.us, %.lr.ph129.split.us.new
  %indvars.iv176 = phi i64 [ %indvars.iv.next177.1, %.lr.ph129.split.us.new ], [ 0, %.lr.ph129.split.us ]
  %21 = phi double [ %33, %.lr.ph129.split.us.new ], [ 0.000000e+00, %.lr.ph129.split.us ]
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv176, i64 %indvars.iv185
  %23 = load double, double* %22, align 8
  %24 = load double, double* %sunkaddr249, align 8
  %25 = fsub double %23, %24
  %26 = fmul double %25, %25
  %27 = fadd double %21, %26
  store double %27, double* %sunkaddr253, align 8
  %indvars.iv.next177 = or i64 %indvars.iv176, 1
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next177, i64 %indvars.iv185
  %29 = load double, double* %28, align 8
  %30 = load double, double* %sunkaddr249, align 8
  %31 = fsub double %29, %30
  %32 = fmul double %31, %31
  %33 = fadd double %27, %32
  store double %33, double* %sunkaddr253, align 8
  %indvars.iv.next177.1 = add nsw i64 %indvars.iv176, 2
  %exitcond179.1 = icmp eq i64 %indvars.iv.next177.1, 1400
  br i1 %exitcond179.1, label %._crit_edge126.us, label %.lr.ph129.split.us.new

._crit_edge126.us:                                ; preds = %.lr.ph129.split.us.new
  %34 = fdiv double %33, %0
  store double %34, double* %sunkaddr253, align 8
  %35 = tail call double @sqrt(double %34) #4
  %36 = fcmp ugt double %35, 1.000000e-01
  %37 = select i1 %36, double %35, double 1.000000e+00
  store double %37, double* %sunkaddr253, align 8
  %indvars.iv.next186 = add nuw nsw i64 %indvars.iv185, 1
  %exitcond188 = icmp eq i64 %indvars.iv.next186, 1200
  br i1 %exitcond188, label %._crit_edge90.us.preheader, label %.lr.ph129.split.us

._crit_edge90.us.preheader:                       ; preds = %._crit_edge126.us
  br label %._crit_edge90.us

._crit_edge90.us:                                 ; preds = %._crit_edge90.us.preheader, %._crit_edge121.us
  %indvars.iv171 = phi i64 [ %indvars.iv.next172, %._crit_edge121.us ], [ 0, %._crit_edge90.us.preheader ]
  br label %38

; <label>:38:                                     ; preds = %38, %._crit_edge90.us
  %indvars.iv167 = phi i64 [ 0, %._crit_edge90.us ], [ %indvars.iv.next168, %38 ]
  %39 = getelementptr inbounds double, double* %3, i64 %indvars.iv167
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv171, i64 %indvars.iv167
  %42 = load double, double* %41, align 8
  %43 = fsub double %42, %40
  store double %43, double* %41, align 8
  %44 = tail call double @sqrt(double %0) #4
  %45 = getelementptr inbounds double, double* %4, i64 %indvars.iv167
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = load double, double* %41, align 8
  %49 = fdiv double %48, %47
  store double %49, double* %41, align 8
  %indvars.iv.next168 = add nuw nsw i64 %indvars.iv167, 1
  %exitcond170 = icmp eq i64 %indvars.iv.next168, 1200
  br i1 %exitcond170, label %._crit_edge121.us, label %38

._crit_edge121.us:                                ; preds = %38
  %indvars.iv.next172 = add nuw nsw i64 %indvars.iv171, 1
  %exitcond174 = icmp eq i64 %indvars.iv.next172, 1400
  br i1 %exitcond174, label %.lr.ph108.split.us.preheader, label %._crit_edge90.us

.lr.ph108.split.us.preheader:                     ; preds = %._crit_edge121.us
  br label %.lr.ph108.split.us

.lr.ph108.split.us:                               ; preds = %.lr.ph108.split.us.preheader, %._crit_edge106.us-lcssa.us.us
  %indvars.iv150 = phi i64 [ %indvars.iv.next151, %._crit_edge106.us-lcssa.us.us ], [ 0, %.lr.ph108.split.us.preheader ]
  %indvars.iv144 = phi i64 [ %indvars.iv.next145, %._crit_edge106.us-lcssa.us.us ], [ 1, %.lr.ph108.split.us.preheader ]
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv150, i64 %indvars.iv150
  store double 1.000000e+00, double* %50, align 8
  %indvars.iv.next151 = add nuw nsw i64 %indvars.iv150, 1
  %51 = icmp slt i64 %indvars.iv.next151, 1200
  br i1 %51, label %.lr.ph.us.us.preheader, label %._crit_edge106.us-lcssa.us.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph108.split.us
  br label %.lr.ph.us.us

._crit_edge106.us-lcssa.us.us.loopexit:           ; preds = %._crit_edge100.us.us
  br label %._crit_edge106.us-lcssa.us.us

._crit_edge106.us-lcssa.us.us:                    ; preds = %._crit_edge106.us-lcssa.us.us.loopexit, %.lr.ph108.split.us
  %indvars.iv.next145 = add nuw nsw i64 %indvars.iv144, 1
  %exitcond153 = icmp eq i64 %indvars.iv.next151, 1199
  br i1 %exitcond153, label %._crit_edge109, label %.lr.ph108.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge100.us.us
  %indvars.iv146 = phi i64 [ %indvars.iv.next147, %._crit_edge100.us.us ], [ %indvars.iv144, %.lr.ph.us.us.preheader ]
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv150, i64 %indvars.iv146
  store double 0.000000e+00, double* %52, align 8
  br label %.lr.ph.us.us.new

._crit_edge100.us.us:                             ; preds = %.lr.ph.us.us.new
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv146, i64 %indvars.iv150
  store double %66, double* %53, align 8
  %indvars.iv.next147 = add nuw nsw i64 %indvars.iv146, 1
  %exitcond = icmp eq i64 %indvars.iv.next147, 1200
  br i1 %exitcond, label %._crit_edge106.us-lcssa.us.us.loopexit, label %.lr.ph.us.us

.lr.ph.us.us.new:                                 ; preds = %.lr.ph.us.us, %.lr.ph.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.us.us.new ], [ 0, %.lr.ph.us.us ]
  %54 = phi double [ %66, %.lr.ph.us.us.new ], [ 0.000000e+00, %.lr.ph.us.us ]
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv150
  %56 = load double, double* %55, align 8
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv, i64 %indvars.iv146
  %58 = load double, double* %57, align 8
  %59 = fmul double %56, %58
  %60 = fadd double %54, %59
  store double %60, double* %52, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv150
  %62 = load double, double* %61, align 8
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next, i64 %indvars.iv146
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = fadd double %60, %65
  store double %66, double* %52, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge100.us.us, label %.lr.ph.us.us.new

._crit_edge109:                                   ; preds = %._crit_edge106.us-lcssa.us.us
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 1199, i64 1199
  store double 1.000000e+00, double* %67, align 8
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

._crit_edge.us:                                   ; preds = %._crit_edge11.us, %._crit_edge.us.preheader
  %indvars.iv14 = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next15, %._crit_edge11.us ]
  %5 = mul nsw i64 %indvars.iv14, 1200
  br label %6

; <label>:6:                                      ; preds = %._crit_edge9.us, %._crit_edge.us
  %indvars.iv = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next, %._crit_edge9.us ]
  %7 = add nsw i64 %indvars.iv, %5
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge9.us

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %6, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv14, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge11.us, label %6

._crit_edge11.us:                                 ; preds = %._crit_edge9.us
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next15, 1200
  br i1 %exitcond17, label %._crit_edge13, label %._crit_edge.us

._crit_edge13:                                    ; preds = %._crit_edge11.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #5
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
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
