; ModuleID = 'A.ll'
source_filename = "2mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"D\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = call i8* @polybench_alloc_data(i64 720000, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 880000, i32 8) #4
  %7 = call i8* @polybench_alloc_data(i64 990000, i32 8) #4
  %8 = call i8* @polybench_alloc_data(i64 1080000, i32 8) #4
  %9 = call i8* @polybench_alloc_data(i64 960000, i32 8) #4
  %10 = bitcast i8* %6 to [1100 x double]*
  %11 = bitcast i8* %7 to [900 x double]*
  %12 = bitcast i8* %8 to [1200 x double]*
  %13 = bitcast i8* %9 to [1200 x double]*
  call fastcc void @init_array(double* nonnull %3, double* nonnull %4, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %13)
  call void (...) @polybench_timer_start() #4
  %14 = load double, double* %3, align 8
  %15 = load double, double* %4, align 8
  %16 = bitcast i8* %5 to [900 x double]*
  call fastcc void @kernel_2mm(double %14, double %15, [900 x double]* %16, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %13)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %17 = icmp sgt i32 %0, 42
  br i1 %17, label %18, label %._crit_edge

; <label>:18:                                     ; preds = %2
  %19 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %19, align 1
  %20 = icmp eq i8 %strcmpload, 0
  br i1 %20, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %18
  %22 = bitcast i8* %9 to [1200 x double]*
  call fastcc void @print_array([1200 x double]* %22)
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %2, %21
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  call void @free(i8* %8) #4
  call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, double* nocapture, [1100 x double]* nocapture, [900 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %0, align 8
  store double 1.200000e+00, double* %1, align 8
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %14, %6
  %indvars.iv1315 = phi i64 [ 0, %6 ], [ %indvars.iv.next14, %14 ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.._crit_edge_crit_edge
  %indvars.iv1114 = phi i64 [ 0, %.._crit_edge_crit_edge ], [ %indvars.iv.next12, %._crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv1315, %indvars.iv1114
  %8 = add nuw nsw i64 %7, 1
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 800
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 8.000000e+02
  %13 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv1315, i64 %indvars.iv1114
  store double %12, double* %13, align 8
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv1114, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next12, 1100
  br i1 %exitcond6, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %._crit_edge
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv1315, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next14, 800
  br i1 %exitcond7, label %..._crit_edge15_crit_edge_crit_edge, label %.._crit_edge_crit_edge

..._crit_edge15_crit_edge_crit_edge:              ; preds = %14
  br label %.._crit_edge15_crit_edge

.._crit_edge15_crit_edge:                         ; preds = %27, %..._crit_edge15_crit_edge_crit_edge
  %indvars.iv913 = phi i64 [ 0, %..._crit_edge15_crit_edge_crit_edge ], [ %indvars.iv.next10, %27 ]
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15, %.._crit_edge15_crit_edge
  %indvars.iv712 = phi i64 [ 0, %.._crit_edge15_crit_edge ], [ %indvars.iv.next8.1, %._crit_edge15 ]
  %indvars.iv.next8 = or i64 %indvars.iv712, 1
  %15 = mul nuw nsw i64 %indvars.iv913, %indvars.iv.next8
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 900
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, 9.000000e+02
  %20 = getelementptr inbounds [900 x double], [900 x double]* %3, i64 %indvars.iv913, i64 %indvars.iv712
  store double %19, double* %20, align 8
  %indvars.iv.next8.1 = add nsw i64 %indvars.iv712, 2
  %21 = mul nuw nsw i64 %indvars.iv913, %indvars.iv.next8.1
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 900
  %24 = sitofp i32 %23 to double
  %25 = fdiv double %24, 9.000000e+02
  %26 = getelementptr inbounds [900 x double], [900 x double]* %3, i64 %indvars.iv913, i64 %indvars.iv.next8
  store double %25, double* %26, align 8
  %exitcond4.1 = icmp eq i64 %indvars.iv.next8.1, 900
  br i1 %exitcond4.1, label %27, label %._crit_edge15

; <label>:27:                                     ; preds = %._crit_edge15
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv913, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next10, 1100
  br i1 %exitcond5, label %..._crit_edge16_crit_edge_crit_edge, label %.._crit_edge15_crit_edge

..._crit_edge16_crit_edge_crit_edge:              ; preds = %27
  br label %.._crit_edge16_crit_edge

.._crit_edge16_crit_edge:                         ; preds = %36, %..._crit_edge16_crit_edge_crit_edge
  %indvars.iv511 = phi i64 [ 0, %..._crit_edge16_crit_edge_crit_edge ], [ %indvars.iv.next6, %36 ]
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16, %.._crit_edge16_crit_edge
  %indvars.iv310 = phi i64 [ 0, %.._crit_edge16_crit_edge ], [ %indvars.iv.next4, %._crit_edge16 ]
  %28 = add nuw nsw i64 %indvars.iv310, 3
  %29 = mul nuw nsw i64 %indvars.iv511, %28
  %30 = add nuw nsw i64 %29, 1
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, 1200
  %33 = sitofp i32 %32 to double
  %34 = fdiv double %33, 1.200000e+03
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv511, i64 %indvars.iv310
  store double %34, double* %35, align 8
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv310, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next4, 1200
  br i1 %exitcond2, label %36, label %._crit_edge16

; <label>:36:                                     ; preds = %._crit_edge16
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv511, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next6, 900
  br i1 %exitcond3, label %..._crit_edge17_crit_edge_crit_edge, label %.._crit_edge16_crit_edge

..._crit_edge17_crit_edge_crit_edge:              ; preds = %36
  br label %.._crit_edge17_crit_edge

.._crit_edge17_crit_edge:                         ; preds = %44, %..._crit_edge17_crit_edge_crit_edge
  %indvars.iv19 = phi i64 [ 0, %..._crit_edge17_crit_edge_crit_edge ], [ %indvars.iv.next2, %44 ]
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17, %.._crit_edge17_crit_edge
  %indvars.iv8 = phi i64 [ 0, %.._crit_edge17_crit_edge ], [ %indvars.iv.next, %._crit_edge17 ]
  %37 = add nuw nsw i64 %indvars.iv8, 2
  %38 = mul nuw nsw i64 %indvars.iv19, %37
  %39 = trunc i64 %38 to i32
  %40 = srem i32 %39, 1100
  %41 = sitofp i32 %40 to double
  %42 = fdiv double %41, 1.100000e+03
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv19, i64 %indvars.iv8
  store double %42, double* %43, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv8, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %44, label %._crit_edge17

; <label>:44:                                     ; preds = %._crit_edge17
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next2, 800
  br i1 %exitcond1, label %45, label %.._crit_edge17_crit_edge

; <label>:45:                                     ; preds = %44
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_2mm(double, double, [900 x double]* nocapture, [1100 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1200 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %26, %7
  %indvars.iv911 = phi i64 [ 0, %7 ], [ %indvars.iv.next10, %26 ]
  br label %8

; <label>:8:                                      ; preds = %._crit_edge, %.._crit_edge_crit_edge
  %indvars.iv710 = phi i64 [ 0, %.._crit_edge_crit_edge ], [ %indvars.iv.next8, %._crit_edge ]
  %9 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv911, i64 %indvars.iv710
  store double 0.000000e+00, double* %9, align 8
  br label %10

; <label>:10:                                     ; preds = %10, %8
  %11 = phi double [ 0.000000e+00, %8 ], [ %25, %10 ]
  %indvars.iv59 = phi i64 [ 0, %8 ], [ %indvars.iv.next6.1, %10 ]
  %12 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv911, i64 %indvars.iv59
  %13 = load double, double* %12, align 8
  %14 = fmul double %13, %0
  %15 = getelementptr inbounds [900 x double], [900 x double]* %4, i64 %indvars.iv59, i64 %indvars.iv710
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fadd double %11, %17
  store double %18, double* %9, align 8
  %indvars.iv.next6 = or i64 %indvars.iv59, 1
  %19 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv911, i64 %indvars.iv.next6
  %20 = load double, double* %19, align 8
  %21 = fmul double %20, %0
  %22 = getelementptr inbounds [900 x double], [900 x double]* %4, i64 %indvars.iv.next6, i64 %indvars.iv710
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = fadd double %18, %24
  store double %25, double* %9, align 8
  %indvars.iv.next6.1 = add nsw i64 %indvars.iv59, 2
  %exitcond3.1 = icmp eq i64 %indvars.iv.next6.1, 1100
  br i1 %exitcond3.1, label %._crit_edge, label %10

._crit_edge:                                      ; preds = %10
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv710, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next8, 900
  br i1 %exitcond4, label %26, label %8

; <label>:26:                                     ; preds = %._crit_edge
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv911, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next10, 800
  br i1 %exitcond5, label %..._crit_edge11_crit_edge_crit_edge, label %.._crit_edge_crit_edge

..._crit_edge11_crit_edge_crit_edge:              ; preds = %26
  br label %.._crit_edge11_crit_edge

.._crit_edge11_crit_edge:                         ; preds = %51, %..._crit_edge11_crit_edge_crit_edge
  %indvars.iv38 = phi i64 [ 0, %..._crit_edge11_crit_edge_crit_edge ], [ %indvars.iv.next4, %51 ]
  br label %27

; <label>:27:                                     ; preds = %._crit_edge11, %.._crit_edge11_crit_edge
  %indvars.iv17 = phi i64 [ 0, %.._crit_edge11_crit_edge ], [ %indvars.iv.next2, %._crit_edge11 ]
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv38, i64 %indvars.iv17
  %29 = load double, double* %28, align 8
  %30 = fmul double %29, %1
  store double %30, double* %28, align 8
  br label %31

; <label>:31:                                     ; preds = %31, %27
  %32 = phi double [ %30, %27 ], [ %50, %31 ]
  %indvars.iv6 = phi i64 [ 0, %27 ], [ %indvars.iv.next.2, %31 ]
  %33 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv38, i64 %indvars.iv6
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv6, i64 %indvars.iv17
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = fadd double %32, %37
  store double %38, double* %28, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv6, 1
  %39 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv38, i64 %indvars.iv.next
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv.next, i64 %indvars.iv17
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fadd double %38, %43
  store double %44, double* %28, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv6, 2
  %45 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv38, i64 %indvars.iv.next.1
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv.next.1, i64 %indvars.iv17
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = fadd double %44, %49
  store double %50, double* %28, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv6, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next.2, 900
  br i1 %exitcond.2, label %._crit_edge11, label %31

._crit_edge11:                                    ; preds = %31
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next2, 1200
  br i1 %exitcond1, label %51, label %27

; <label>:51:                                     ; preds = %._crit_edge11
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next4, 800
  br i1 %exitcond2, label %52, label %.._crit_edge11_crit_edge

; <label>:52:                                     ; preds = %51
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %1
  %indvars.iv13 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %18 ]
  %6 = mul nuw nsw i64 %indvars.iv13, 800
  br label %7

; <label>:7:                                      ; preds = %._crit_edge4, %._crit_edge
  %indvars.iv2 = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next, %._crit_edge4 ]
  %8 = add nuw nsw i64 %6, %indvars.iv2
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge4

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %7, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv13, i64 %indvars.iv2
  %16 = load double, double* %15, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv2, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %18, label %7

; <label>:18:                                     ; preds = %._crit_edge4
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next2, 800
  br i1 %exitcond1, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %18
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

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
