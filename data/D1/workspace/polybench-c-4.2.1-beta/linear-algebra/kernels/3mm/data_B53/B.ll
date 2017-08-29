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
  br label %5

; <label>:5:                                      ; preds = %14, %4
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %14 ], [ 0, %4 ]
  br label %6

; <label>:6:                                      ; preds = %6, %5
  %indvars.iv7 = phi i64 [ 0, %5 ], [ %indvars.iv.next8, %6 ]
  %7 = mul nuw nsw i64 %indvars.iv7, %indvars.iv23
  %8 = add nuw nsw i64 %7, 1
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 800
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 4.000000e+03
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv23, i64 %indvars.iv7
  store double %12, double* %13, align 8
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 1000
  br i1 %exitcond9, label %14, label %6

; <label>:14:                                     ; preds = %6
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond25 = icmp ne i64 %indvars.iv.next24, 800
  br i1 %exitcond25, label %5, label %.preheader64.preheader

.preheader64.preheader:                           ; preds = %14
  br label %.preheader64

.preheader64:                                     ; preds = %.preheader64.preheader, %23
  %indvars.iv20 = phi i64 [ 0, %.preheader64.preheader ], [ %indvars.iv.next21, %23 ]
  br label %15

; <label>:15:                                     ; preds = %15, %.preheader64
  %indvars.iv4 = phi i64 [ 0, %.preheader64 ], [ %indvars.iv.next5, %15 ]
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %16 = mul nuw nsw i64 %indvars.iv.next5, %indvars.iv20
  %17 = add nuw nsw i64 %16, 2
  %18 = trunc i64 %17 to i32
  %19 = srem i32 %18, 900
  %20 = sitofp i32 %19 to double
  %21 = fdiv double %20, 4.500000e+03
  %22 = getelementptr inbounds [900 x double], [900 x double]* %1, i64 %indvars.iv20, i64 %indvars.iv4
  store double %21, double* %22, align 8
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 900
  br i1 %exitcond6, label %23, label %15

; <label>:23:                                     ; preds = %15
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond22 = icmp ne i64 %indvars.iv.next21, 1000
  br i1 %exitcond22, label %.preheader64, label %.preheader63.preheader

.preheader63.preheader:                           ; preds = %23
  br label %.preheader63

.preheader63:                                     ; preds = %.preheader63.preheader, %32
  %indvars.iv17 = phi i64 [ 0, %.preheader63.preheader ], [ %indvars.iv.next18, %32 ]
  br label %24

; <label>:24:                                     ; preds = %24, %.preheader63
  %indvars.iv1 = phi i64 [ 0, %.preheader63 ], [ %indvars.iv.next2, %24 ]
  %25 = add nuw nsw i64 %indvars.iv1, 3
  %26 = mul nuw nsw i64 %25, %indvars.iv17
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 1100
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, 5.500000e+03
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv17, i64 %indvars.iv1
  store double %30, double* %31, align 8
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1200
  br i1 %exitcond3, label %32, label %24

; <label>:32:                                     ; preds = %24
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond19 = icmp ne i64 %indvars.iv.next18, 900
  br i1 %exitcond19, label %.preheader63, label %.preheader.preheader

.preheader.preheader:                             ; preds = %32
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %42
  %indvars.iv14 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next15, %42 ]
  br label %33

; <label>:33:                                     ; preds = %33, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %33 ]
  %34 = add nuw nsw i64 %indvars.iv, 2
  %35 = mul nuw nsw i64 %34, %indvars.iv14
  %36 = add nuw nsw i64 %35, 2
  %37 = trunc i64 %36 to i32
  %38 = srem i32 %37, 1000
  %39 = sitofp i32 %38 to double
  %40 = fdiv double %39, 5.000000e+03
  %41 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv14, i64 %indvars.iv
  store double %40, double* %41, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %42, label %33

; <label>:42:                                     ; preds = %33
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp ne i64 %indvars.iv.next15, 1200
  br i1 %exitcond16, label %.preheader, label %43

; <label>:43:                                     ; preds = %42
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_3mm([900 x double]* nocapture, [1000 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1100 x double]* nocapture, [1200 x double]* nocapture readonly, [1100 x double]* nocapture readonly, [1100 x double]* nocapture) #2 {
  br label %8

; <label>:8:                                      ; preds = %26, %7
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %26 ], [ 0, %7 ]
  br label %9

; <label>:9:                                      ; preds = %25, %8
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %25 ], [ 0, %8 ]
  %10 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %indvars.iv34, i64 %indvars.iv31
  store double 0.000000e+00, double* %10, align 8
  br label %11

; <label>:11:                                     ; preds = %11, %9
  %indvars.iv4 = phi i64 [ 0, %9 ], [ %indvars.iv.next5.1, %11 ]
  %12 = phi double [ 0.000000e+00, %9 ], [ %24, %11 ]
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv34, i64 %indvars.iv4
  %14 = load double, double* %13, align 8
  %15 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv4, i64 %indvars.iv31
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fadd double %12, %17
  store double %18, double* %10, align 8
  %indvars.iv.next5 = or i64 %indvars.iv4, 1
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv34, i64 %indvars.iv.next5
  %20 = load double, double* %19, align 8
  %21 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv.next5, i64 %indvars.iv31
  %22 = load double, double* %21, align 8
  %23 = fmul double %20, %22
  %24 = fadd double %18, %23
  store double %24, double* %10, align 8
  %indvars.iv.next5.1 = add nuw nsw i64 %indvars.iv4, 2
  %exitcond6.1 = icmp eq i64 %indvars.iv.next5.1, 1000
  br i1 %exitcond6.1, label %25, label %11

; <label>:25:                                     ; preds = %11
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond33 = icmp ne i64 %indvars.iv.next32, 900
  br i1 %exitcond33, label %9, label %26

; <label>:26:                                     ; preds = %25
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond36 = icmp ne i64 %indvars.iv.next35, 800
  br i1 %exitcond36, label %8, label %.preheader77.preheader

.preheader77.preheader:                           ; preds = %26
  br label %.preheader77

.preheader77:                                     ; preds = %.preheader77.preheader, %50
  %indvars.iv28 = phi i64 [ 0, %.preheader77.preheader ], [ %indvars.iv.next29, %50 ]
  br label %27

; <label>:27:                                     ; preds = %49, %.preheader77
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %49 ], [ 0, %.preheader77 ]
  %28 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv28, i64 %indvars.iv25
  store double 0.000000e+00, double* %28, align 8
  br label %29

; <label>:29:                                     ; preds = %29, %27
  %indvars.iv1 = phi i64 [ 0, %27 ], [ %indvars.iv.next2.2, %29 ]
  %30 = phi double [ 0.000000e+00, %27 ], [ %48, %29 ]
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv28, i64 %indvars.iv1
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv1, i64 %indvars.iv25
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = fadd double %30, %35
  store double %36, double* %28, align 8
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv28, i64 %indvars.iv.next2
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv.next2, i64 %indvars.iv25
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = fadd double %36, %41
  store double %42, double* %28, align 8
  %indvars.iv.next2.1 = add nuw nsw i64 %indvars.iv1, 2
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv28, i64 %indvars.iv.next2.1
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv.next2.1, i64 %indvars.iv25
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = fadd double %42, %47
  store double %48, double* %28, align 8
  %indvars.iv.next2.2 = add nuw nsw i64 %indvars.iv1, 3
  %exitcond3.2 = icmp eq i64 %indvars.iv.next2.2, 1200
  br i1 %exitcond3.2, label %49, label %29

; <label>:49:                                     ; preds = %29
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond27 = icmp ne i64 %indvars.iv.next26, 1100
  br i1 %exitcond27, label %27, label %50

; <label>:50:                                     ; preds = %49
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond30 = icmp ne i64 %indvars.iv.next29, 900
  br i1 %exitcond30, label %.preheader77, label %.preheader.preheader

.preheader.preheader:                             ; preds = %50
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %74
  %indvars.iv22 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next23, %74 ]
  br label %51

; <label>:51:                                     ; preds = %73, %.preheader
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %73 ], [ 0, %.preheader ]
  %52 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %indvars.iv22, i64 %indvars.iv20
  store double 0.000000e+00, double* %52, align 8
  br label %53

; <label>:53:                                     ; preds = %53, %51
  %indvars.iv = phi i64 [ 0, %51 ], [ %indvars.iv.next.2, %53 ]
  %54 = phi double [ 0.000000e+00, %51 ], [ %72, %53 ]
  %55 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %indvars.iv22, i64 %indvars.iv
  %56 = load double, double* %55, align 8
  %57 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv, i64 %indvars.iv20
  %58 = load double, double* %57, align 8
  %59 = fmul double %56, %58
  %60 = fadd double %54, %59
  store double %60, double* %52, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %61 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %indvars.iv22, i64 %indvars.iv.next
  %62 = load double, double* %61, align 8
  %63 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv20
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = fadd double %60, %65
  store double %66, double* %52, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %67 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %indvars.iv22, i64 %indvars.iv.next.1
  %68 = load double, double* %67, align 8
  %69 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv.next.1, i64 %indvars.iv20
  %70 = load double, double* %69, align 8
  %71 = fmul double %68, %70
  %72 = fadd double %66, %71
  store double %72, double* %52, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next.2, 900
  br i1 %exitcond.2, label %73, label %53

; <label>:73:                                     ; preds = %53
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond = icmp ne i64 %indvars.iv.next21, 1100
  br i1 %exitcond, label %51, label %74

; <label>:74:                                     ; preds = %73
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond24 = icmp ne i64 %indvars.iv.next23, 800
  br i1 %exitcond24, label %.preheader, label %75

; <label>:75:                                     ; preds = %74
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
  br label %6

; <label>:6:                                      ; preds = %20, %1
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %20 ], [ 0, %1 ]
  %7 = mul nuw nsw i64 %indvars.iv3, 800
  br label %8

; <label>:8:                                      ; preds = %15, %6
  %indvars.iv = phi i64 [ 0, %6 ], [ %indvars.iv.next, %15 ]
  %9 = add nuw nsw i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %15

; <label>:15:                                     ; preds = %8, %13
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1100 x double], [1100 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %20, label %8

; <label>:20:                                     ; preds = %15
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond5 = icmp ne i64 %indvars.iv.next4, 800
  br i1 %exitcond5, label %6, label %21

; <label>:21:                                     ; preds = %20
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
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
