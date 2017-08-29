; ModuleID = 'A.ll'
source_filename = "3mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"G\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 720000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 800000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 900000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 990000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1080000, i32 8) #4
  %8 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %9 = tail call i8* @polybench_alloc_data(i64 880000, i32 8) #4
  %10 = bitcast i8* %4 to [1000 x double]*
  %11 = bitcast i8* %5 to [900 x double]*
  %12 = bitcast i8* %7 to [1200 x double]*
  %13 = bitcast i8* %8 to [1100 x double]*
  tail call void @init_array([1000 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1100 x double]* %13)
  tail call void (...) @polybench_timer_start() #4
  %14 = bitcast i8* %3 to [900 x double]*
  %15 = bitcast i8* %6 to [1100 x double]*
  %16 = bitcast i8* %9 to [1100 x double]*
  tail call void @kernel_3mm([900 x double]* %14, [1000 x double]* %10, [900 x double]* %11, [1100 x double]* %15, [1200 x double]* %12, [1100 x double]* %13, [1100 x double]* %16)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %17 = icmp sgt i32 %0, 42
  br i1 %17, label %18, label %22

; <label>:18:                                     ; preds = %2
  %19 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %19, align 1
  %20 = icmp eq i8 %strcmpload, 0
  br i1 %20, label %21, label %22

; <label>:21:                                     ; preds = %18
  tail call void @print_array([1100 x double]* %16)
  br label %22

; <label>:22:                                     ; preds = %18, %2, %21
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  tail call void @free(i8* %8) #4
  tail call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array([1000 x double]* nocapture, [900 x double]* nocapture, [1200 x double]* nocapture, [1100 x double]* nocapture) #2 {
  br label %.preheader60

.preheader60:                                     ; preds = %13, %4
  %indvars.iv19 = phi i64 [ 0, %4 ], [ %indvars.iv.next20, %13 ]
  br label %5

; <label>:5:                                      ; preds = %5, %.preheader60
  %indvars.iv16 = phi i64 [ 0, %.preheader60 ], [ %indvars.iv.next17, %5 ]
  %6 = mul nuw nsw i64 %indvars.iv16, %indvars.iv19
  %7 = add nuw nsw i64 %6, 1
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 800
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 4.000000e+03
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv19, i64 %indvars.iv16
  store double %11, double* %12, align 8
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 1000
  br i1 %exitcond18, label %13, label %5

; <label>:13:                                     ; preds = %5
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next20, 800
  br i1 %exitcond21, label %.preheader58.preheader, label %.preheader60

.preheader58.preheader:                           ; preds = %13
  br label %.preheader58

.preheader58:                                     ; preds = %.preheader58.preheader, %22
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %22 ], [ 0, %.preheader58.preheader ]
  br label %14

; <label>:14:                                     ; preds = %14, %.preheader58
  %indvars.iv10 = phi i64 [ 0, %.preheader58 ], [ %indvars.iv.next11, %14 ]
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %15 = mul nuw nsw i64 %indvars.iv.next11, %indvars.iv13
  %16 = add nuw nsw i64 %15, 2
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 900
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, 4.500000e+03
  %21 = getelementptr inbounds [900 x double], [900 x double]* %1, i64 %indvars.iv13, i64 %indvars.iv10
  store double %20, double* %21, align 8
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 900
  br i1 %exitcond12, label %22, label %14

; <label>:22:                                     ; preds = %14
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 1000
  br i1 %exitcond15, label %.preheader56.preheader, label %.preheader58

.preheader56.preheader:                           ; preds = %22
  br label %.preheader56

.preheader56:                                     ; preds = %.preheader56.preheader, %31
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %31 ], [ 0, %.preheader56.preheader ]
  br label %23

; <label>:23:                                     ; preds = %23, %.preheader56
  %indvars.iv4 = phi i64 [ 0, %.preheader56 ], [ %indvars.iv.next5, %23 ]
  %24 = add nuw nsw i64 %indvars.iv4, 3
  %25 = mul nuw nsw i64 %24, %indvars.iv7
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 1100
  %28 = sitofp i32 %27 to double
  %29 = fdiv double %28, 5.500000e+03
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv7, i64 %indvars.iv4
  store double %29, double* %30, align 8
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1200
  br i1 %exitcond6, label %31, label %23

; <label>:31:                                     ; preds = %23
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 900
  br i1 %exitcond9, label %.preheader.preheader, label %.preheader56

.preheader.preheader:                             ; preds = %31
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %41
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %41 ], [ 0, %.preheader.preheader ]
  br label %32

; <label>:32:                                     ; preds = %32, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %32 ]
  %33 = add nuw nsw i64 %indvars.iv, 2
  %34 = mul nuw nsw i64 %33, %indvars.iv1
  %35 = add nuw nsw i64 %34, 2
  %36 = trunc i64 %35 to i32
  %37 = srem i32 %36, 1000
  %38 = sitofp i32 %37 to double
  %39 = fdiv double %38, 5.000000e+03
  %40 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv1, i64 %indvars.iv
  store double %39, double* %40, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %41, label %32

; <label>:41:                                     ; preds = %32
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1200
  br i1 %exitcond3, label %42, label %.preheader

; <label>:42:                                     ; preds = %41
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_3mm([900 x double]* nocapture, [1000 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1100 x double]* nocapture, [1200 x double]* nocapture readonly, [1100 x double]* nocapture readonly, [1100 x double]* nocapture) #2 {
  br label %.preheader71

.preheader71:                                     ; preds = %25, %7
  %indvars.iv24 = phi i64 [ 0, %7 ], [ %indvars.iv.next25, %25 ]
  br label %8

; <label>:8:                                      ; preds = %24, %.preheader71
  %indvars.iv20 = phi i64 [ 0, %.preheader71 ], [ %indvars.iv.next21, %24 ]
  %9 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %indvars.iv24, i64 %indvars.iv20
  store double 0.000000e+00, double* %9, align 8
  br label %10

; <label>:10:                                     ; preds = %10, %8
  %indvars.iv17 = phi i64 [ 0, %8 ], [ %indvars.iv.next18.1, %10 ]
  %11 = phi double [ 0.000000e+00, %8 ], [ %23, %10 ]
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv24, i64 %indvars.iv17
  %13 = load double, double* %12, align 8
  %14 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv17, i64 %indvars.iv20
  %15 = load double, double* %14, align 8
  %16 = fmul double %13, %15
  %17 = fadd double %11, %16
  store double %17, double* %9, align 8
  %indvars.iv.next18 = or i64 %indvars.iv17, 1
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv24, i64 %indvars.iv.next18
  %19 = load double, double* %18, align 8
  %20 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv.next18, i64 %indvars.iv20
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = fadd double %17, %22
  store double %23, double* %9, align 8
  %indvars.iv.next18.1 = add nsw i64 %indvars.iv17, 2
  %exitcond19.1 = icmp eq i64 %indvars.iv.next18.1, 1000
  br i1 %exitcond19.1, label %24, label %10

; <label>:24:                                     ; preds = %10
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next21, 900
  br i1 %exitcond22, label %25, label %8

; <label>:25:                                     ; preds = %24
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next25, 800
  br i1 %exitcond26, label %.preheader69.preheader, label %.preheader71

.preheader69.preheader:                           ; preds = %25
  br label %.preheader69

.preheader69:                                     ; preds = %.preheader69.preheader, %49
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %49 ], [ 0, %.preheader69.preheader ]
  br label %26

; <label>:26:                                     ; preds = %48, %.preheader69
  %indvars.iv10 = phi i64 [ 0, %.preheader69 ], [ %indvars.iv.next11, %48 ]
  %27 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv14, i64 %indvars.iv10
  store double 0.000000e+00, double* %27, align 8
  br label %28

; <label>:28:                                     ; preds = %28, %26
  %indvars.iv7 = phi i64 [ 0, %26 ], [ %indvars.iv.next8.2, %28 ]
  %29 = phi double [ 0.000000e+00, %26 ], [ %47, %28 ]
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv14, i64 %indvars.iv7
  %31 = load double, double* %30, align 8
  %32 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv7, i64 %indvars.iv10
  %33 = load double, double* %32, align 8
  %34 = fmul double %31, %33
  %35 = fadd double %29, %34
  store double %35, double* %27, align 8
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv14, i64 %indvars.iv.next8
  %37 = load double, double* %36, align 8
  %38 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv.next8, i64 %indvars.iv10
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = fadd double %35, %40
  store double %41, double* %27, align 8
  %indvars.iv.next8.1 = add nsw i64 %indvars.iv7, 2
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv14, i64 %indvars.iv.next8.1
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv.next8.1, i64 %indvars.iv10
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = fadd double %41, %46
  store double %47, double* %27, align 8
  %indvars.iv.next8.2 = add nsw i64 %indvars.iv7, 3
  %exitcond9.2 = icmp eq i64 %indvars.iv.next8.2, 1200
  br i1 %exitcond9.2, label %48, label %28

; <label>:48:                                     ; preds = %28
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 1100
  br i1 %exitcond12, label %49, label %26

; <label>:49:                                     ; preds = %48
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 900
  br i1 %exitcond16, label %.preheader.preheader, label %.preheader69

.preheader.preheader:                             ; preds = %49
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %73
  %indvars.iv4 = phi i64 [ %indvars.iv.next5, %73 ], [ 0, %.preheader.preheader ]
  br label %50

; <label>:50:                                     ; preds = %72, %.preheader
  %indvars.iv1 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next2, %72 ]
  %51 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %indvars.iv4, i64 %indvars.iv1
  store double 0.000000e+00, double* %51, align 8
  br label %52

; <label>:52:                                     ; preds = %52, %50
  %indvars.iv = phi i64 [ 0, %50 ], [ %indvars.iv.next.2, %52 ]
  %53 = phi double [ 0.000000e+00, %50 ], [ %71, %52 ]
  %54 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv
  %55 = load double, double* %54, align 8
  %56 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv, i64 %indvars.iv1
  %57 = load double, double* %56, align 8
  %58 = fmul double %55, %57
  %59 = fadd double %53, %58
  store double %59, double* %51, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %60 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv.next
  %61 = load double, double* %60, align 8
  %62 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv1
  %63 = load double, double* %62, align 8
  %64 = fmul double %61, %63
  %65 = fadd double %59, %64
  store double %65, double* %51, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %66 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv.next.1
  %67 = load double, double* %66, align 8
  %68 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv.next.1, i64 %indvars.iv1
  %69 = load double, double* %68, align 8
  %70 = fmul double %67, %69
  %71 = fadd double %65, %70
  store double %71, double* %51, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next.2, 900
  br i1 %exitcond.2, label %72, label %52

; <label>:72:                                     ; preds = %52
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next2, 1100
  br i1 %exitcond, label %73, label %50

; <label>:73:                                     ; preds = %72
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 800
  br i1 %exitcond6, label %74, label %.preheader

; <label>:74:                                     ; preds = %73
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1100 x double]* nocapture readonly) #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader

.preheader:                                       ; preds = %19, %1
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %19 ]
  %6 = mul nuw nsw i64 %indvars.iv1, 800
  br label %7

; <label>:7:                                      ; preds = %14, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %14 ]
  %8 = add nuw nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %14

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %14

; <label>:14:                                     ; preds = %7, %12
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1100 x double], [1100 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %19, label %7

; <label>:19:                                     ; preds = %14
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 800
  br i1 %exitcond3, label %20, label %.preheader

; <label>:20:                                     ; preds = %19
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
