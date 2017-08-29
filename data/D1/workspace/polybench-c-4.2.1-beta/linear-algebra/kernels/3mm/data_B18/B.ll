; ModuleID = 'A.ll'
source_filename = "3mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"G\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
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
  tail call fastcc void @init_array(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [1000 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1100 x double]* %13)
  tail call void (...) @polybench_timer_start() #4
  %14 = bitcast i8* %3 to [900 x double]*
  %15 = bitcast i8* %6 to [1100 x double]*
  %16 = bitcast i8* %9 to [1100 x double]*
  tail call fastcc void @kernel_3mm(i32 800, i32 900, i32 1000, i32 1100, i32 1200, [900 x double]* %14, [1000 x double]* %10, [900 x double]* %11, [1100 x double]* %15, [1200 x double]* %12, [1100 x double]* %13, [1100 x double]* %16)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %17 = icmp sgt i32 %0, 42
  br i1 %17, label %18, label %._crit_edge

; <label>:18:                                     ; preds = %2
  %19 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %19, align 1
  %20 = icmp eq i8 %strcmpload, 0
  br i1 %20, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %18
  tail call fastcc void @print_array(i32 800, i32 1100, [1100 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %2, %21
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  tail call void @free(i8* %8) #4
  tail call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, i32, i32, [1000 x double]* nocapture, [900 x double]* nocapture, [1200 x double]* nocapture, [1100 x double]* nocapture) unnamed_addr #2 {
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %17, %9
  %indvars.iv37 = phi i64 [ 0, %9 ], [ %indvars.iv.next38, %17 ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.preheader
  %indvars.iv34 = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next35, %._crit_edge ]
  %10 = mul nuw nsw i64 %indvars.iv34, %indvars.iv37
  %11 = add nuw nsw i64 %10, 1
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 800
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 4.000000e+03
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %5, i64 %indvars.iv37, i64 %indvars.iv34
  store double %15, double* %16, align 8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next35, 1000
  br i1 %exitcond36, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %._crit_edge
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next38, 800
  br i1 %exitcond39, label %._crit_edge6.preheader.preheader, label %._crit_edge.preheader

._crit_edge6.preheader.preheader:                 ; preds = %17
  br label %._crit_edge6.preheader

._crit_edge6.preheader:                           ; preds = %._crit_edge6.preheader.preheader, %._crit_edge5
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %._crit_edge5 ], [ 0, %._crit_edge6.preheader.preheader ]
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6, %._crit_edge6.preheader
  %indvars.iv28 = phi i64 [ 0, %._crit_edge6.preheader ], [ %indvars.iv.next29, %._crit_edge6 ]
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %18 = mul nuw nsw i64 %indvars.iv.next29, %indvars.iv31
  %19 = add nuw nsw i64 %18, 2
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 900
  %22 = sitofp i32 %21 to double
  %23 = fdiv double %22, 4.500000e+03
  %24 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv31, i64 %indvars.iv28
  store double %23, double* %24, align 8
  %exitcond30 = icmp eq i64 %indvars.iv.next29, 900
  br i1 %exitcond30, label %._crit_edge5, label %._crit_edge6

._crit_edge5:                                     ; preds = %._crit_edge6
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next32, 1000
  br i1 %exitcond33, label %._crit_edge8.preheader.preheader, label %._crit_edge6.preheader

._crit_edge8.preheader.preheader:                 ; preds = %._crit_edge5
  br label %._crit_edge8.preheader

._crit_edge8.preheader:                           ; preds = %._crit_edge8.preheader.preheader, %._crit_edge7
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %._crit_edge7 ], [ 0, %._crit_edge8.preheader.preheader ]
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8, %._crit_edge8.preheader
  %indvars.iv22 = phi i64 [ 0, %._crit_edge8.preheader ], [ %indvars.iv.next23, %._crit_edge8 ]
  %25 = add nuw nsw i64 %indvars.iv22, 3
  %26 = mul nuw nsw i64 %25, %indvars.iv25
  %27 = trunc i64 %26 to i32
  %28 = srem i32 %27, 1100
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, 5.500000e+03
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %7, i64 %indvars.iv25, i64 %indvars.iv22
  store double %30, double* %31, align 8
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next23, 1200
  br i1 %exitcond24, label %._crit_edge7, label %._crit_edge8

._crit_edge7:                                     ; preds = %._crit_edge8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next26, 900
  br i1 %exitcond27, label %._crit_edge10.preheader.preheader, label %._crit_edge8.preheader

._crit_edge10.preheader.preheader:                ; preds = %._crit_edge7
  br label %._crit_edge10.preheader

._crit_edge10.preheader:                          ; preds = %._crit_edge10.preheader.preheader, %._crit_edge9
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %._crit_edge9 ], [ 0, %._crit_edge10.preheader.preheader ]
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10, %._crit_edge10.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge10.preheader ], [ %indvars.iv.next, %._crit_edge10 ]
  %32 = add nuw nsw i64 %indvars.iv, 2
  %33 = mul nuw nsw i64 %32, %indvars.iv19
  %34 = add nuw nsw i64 %33, 2
  %35 = trunc i64 %34 to i32
  %36 = srem i32 %35, 1000
  %37 = sitofp i32 %36 to double
  %38 = fdiv double %37, 5.000000e+03
  %39 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv19, i64 %indvars.iv
  store double %38, double* %39, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %._crit_edge9, label %._crit_edge10

._crit_edge9:                                     ; preds = %._crit_edge10
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next20, 1200
  br i1 %exitcond21, label %40, label %._crit_edge10.preheader

; <label>:40:                                     ; preds = %._crit_edge9
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_3mm(i32, i32, i32, i32, i32, [900 x double]* nocapture, [1000 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1100 x double]* nocapture, [1200 x double]* nocapture readonly, [1100 x double]* nocapture readonly, [1100 x double]* nocapture) unnamed_addr #2 {
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %29, %12
  %indvars.iv43 = phi i64 [ 0, %12 ], [ %indvars.iv.next44, %29 ]
  br label %13

; <label>:13:                                     ; preds = %._crit_edge, %._crit_edge.preheader
  %indvars.iv39 = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next40, %._crit_edge ]
  %14 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv43, i64 %indvars.iv39
  store double 0.000000e+00, double* %14, align 8
  br label %15

; <label>:15:                                     ; preds = %15, %13
  %16 = phi double [ 0.000000e+00, %13 ], [ %28, %15 ]
  %indvars.iv36 = phi i64 [ 0, %13 ], [ %indvars.iv.next37.1, %15 ]
  %17 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv43, i64 %indvars.iv36
  %18 = load double, double* %17, align 8
  %19 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv36, i64 %indvars.iv39
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fadd double %16, %21
  store double %22, double* %14, align 8
  %indvars.iv.next37 = or i64 %indvars.iv36, 1
  %23 = getelementptr inbounds [1000 x double], [1000 x double]* %6, i64 %indvars.iv43, i64 %indvars.iv.next37
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv.next37, i64 %indvars.iv39
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fadd double %22, %27
  store double %28, double* %14, align 8
  %indvars.iv.next37.1 = add nsw i64 %indvars.iv36, 2
  %exitcond38.1 = icmp eq i64 %indvars.iv.next37.1, 1000
  br i1 %exitcond38.1, label %._crit_edge, label %15

._crit_edge:                                      ; preds = %15
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next40, 900
  br i1 %exitcond41, label %29, label %13

; <label>:29:                                     ; preds = %._crit_edge
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next44, 800
  br i1 %exitcond45, label %._crit_edge8.preheader.preheader, label %._crit_edge.preheader

._crit_edge8.preheader.preheader:                 ; preds = %29
  br label %._crit_edge8.preheader

._crit_edge8.preheader:                           ; preds = %._crit_edge8.preheader.preheader, %._crit_edge7
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %._crit_edge7 ], [ 0, %._crit_edge8.preheader.preheader ]
  br label %30

; <label>:30:                                     ; preds = %._crit_edge8, %._crit_edge8.preheader
  %indvars.iv29 = phi i64 [ 0, %._crit_edge8.preheader ], [ %indvars.iv.next30, %._crit_edge8 ]
  %31 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv33, i64 %indvars.iv29
  store double 0.000000e+00, double* %31, align 8
  br label %32

; <label>:32:                                     ; preds = %32, %30
  %33 = phi double [ 0.000000e+00, %30 ], [ %45, %32 ]
  %indvars.iv26 = phi i64 [ 0, %30 ], [ %indvars.iv.next27.1, %32 ]
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv33, i64 %indvars.iv26
  %35 = load double, double* %34, align 8
  %36 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 %indvars.iv26, i64 %indvars.iv29
  %37 = load double, double* %36, align 8
  %38 = fmul double %35, %37
  %39 = fadd double %33, %38
  store double %39, double* %31, align 8
  %indvars.iv.next27 = or i64 %indvars.iv26, 1
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv33, i64 %indvars.iv.next27
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [1100 x double], [1100 x double]* %10, i64 %indvars.iv.next27, i64 %indvars.iv29
  %43 = load double, double* %42, align 8
  %44 = fmul double %41, %43
  %45 = fadd double %39, %44
  store double %45, double* %31, align 8
  %indvars.iv.next27.1 = add nsw i64 %indvars.iv26, 2
  %exitcond28.1 = icmp eq i64 %indvars.iv.next27.1, 1200
  br i1 %exitcond28.1, label %._crit_edge8, label %32

._crit_edge8:                                     ; preds = %32
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next30, 1100
  br i1 %exitcond31, label %._crit_edge7, label %30

._crit_edge7:                                     ; preds = %._crit_edge8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next34, 900
  br i1 %exitcond35, label %._crit_edge10.preheader.preheader, label %._crit_edge8.preheader

._crit_edge10.preheader.preheader:                ; preds = %._crit_edge7
  br label %._crit_edge10.preheader

._crit_edge10.preheader:                          ; preds = %._crit_edge10.preheader.preheader, %._crit_edge9
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %._crit_edge9 ], [ 0, %._crit_edge10.preheader.preheader ]
  br label %46

; <label>:46:                                     ; preds = %._crit_edge10, %._crit_edge10.preheader
  %indvars.iv20 = phi i64 [ 0, %._crit_edge10.preheader ], [ %indvars.iv.next21, %._crit_edge10 ]
  %47 = getelementptr inbounds [1100 x double], [1100 x double]* %11, i64 %indvars.iv23, i64 %indvars.iv20
  store double 0.000000e+00, double* %47, align 8
  br label %48

; <label>:48:                                     ; preds = %48, %46
  %49 = phi double [ 0.000000e+00, %46 ], [ %61, %48 ]
  %indvars.iv = phi i64 [ 0, %46 ], [ %indvars.iv.next.1, %48 ]
  %50 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv23, i64 %indvars.iv
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv, i64 %indvars.iv20
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = fadd double %49, %54
  store double %55, double* %47, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %56 = getelementptr inbounds [900 x double], [900 x double]* %5, i64 %indvars.iv23, i64 %indvars.iv.next
  %57 = load double, double* %56, align 8
  %58 = getelementptr inbounds [1100 x double], [1100 x double]* %8, i64 %indvars.iv.next, i64 %indvars.iv20
  %59 = load double, double* %58, align 8
  %60 = fmul double %57, %59
  %61 = fadd double %55, %60
  store double %61, double* %47, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 900
  br i1 %exitcond.1, label %._crit_edge10, label %48

._crit_edge10:                                    ; preds = %48
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond = icmp eq i64 %indvars.iv.next21, 1100
  br i1 %exitcond, label %._crit_edge9, label %46

._crit_edge9:                                     ; preds = %._crit_edge10
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next24, 800
  br i1 %exitcond25, label %62, label %._crit_edge10.preheader

; <label>:62:                                     ; preds = %._crit_edge9
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1100 x double]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %20, %3
  %indvars.iv5 = phi i64 [ 0, %3 ], [ %indvars.iv.next6, %20 ]
  %8 = mul nuw nsw i64 %indvars.iv5, 800
  br label %9

; <label>:9:                                      ; preds = %._crit_edge2, %._crit_edge.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next, %._crit_edge2 ]
  %10 = add nuw nsw i64 %indvars.iv, %8
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge2

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %9, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv5, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %20, label %9

; <label>:20:                                     ; preds = %._crit_edge2
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 800
  br i1 %exitcond7, label %21, label %._crit_edge.preheader

; <label>:21:                                     ; preds = %20
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
