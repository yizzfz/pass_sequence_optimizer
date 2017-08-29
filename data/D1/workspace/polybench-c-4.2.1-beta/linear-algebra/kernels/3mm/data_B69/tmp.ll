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
  tail call fastcc void @init_array([1000 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1100 x double]* %13)
  tail call void (...) @polybench_timer_start() #4
  %14 = bitcast i8* %3 to [900 x double]*
  %15 = bitcast i8* %6 to [1100 x double]*
  %16 = bitcast i8* %9 to [1100 x double]*
  tail call fastcc void @kernel_3mm([900 x double]* %14, [1000 x double]* %10, [900 x double]* %11, [1100 x double]* %15, [1200 x double]* %12, [1100 x double]* %13, [1100 x double]* %16)
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
  tail call fastcc void @print_array([1100 x double]* %16)
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
define internal fastcc void @init_array([1000 x double]* nocapture, [900 x double]* nocapture, [1200 x double]* nocapture, [1100 x double]* nocapture) unnamed_addr #2 {
  br label %.preheader6

.preheader6:                                      ; preds = %12, %4
  %indvars.iv33 = phi i64 [ 0, %4 ], [ %indvars.iv.next34, %12 ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader6
  %indvars.iv30 = phi i64 [ 0, %.preheader6 ], [ %indvars.iv.next31, %._crit_edge ]
  %5 = mul nuw nsw i64 %indvars.iv30, %indvars.iv33
  %6 = add nuw nsw i64 %5, 1
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 800
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, 4.000000e+03
  %11 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv33, i64 %indvars.iv30
  store double %10, double* %11, align 8
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next31, 1000
  br i1 %exitcond32, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next34, 800
  br i1 %exitcond35, label %.preheader4.preheader, label %.preheader6

.preheader4.preheader:                            ; preds = %12
  br label %.preheader4

.preheader4:                                      ; preds = %20, %.preheader4.preheader
  %indvars.iv27 = phi i64 [ 0, %.preheader4.preheader ], [ %indvars.iv.next28, %20 ]
  br label %._crit_edge36

._crit_edge36:                                    ; preds = %._crit_edge36, %.preheader4
  %indvars.iv24 = phi i64 [ 0, %.preheader4 ], [ %indvars.iv.next25, %._crit_edge36 ]
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %13 = mul nuw nsw i64 %indvars.iv.next25, %indvars.iv27
  %14 = add nuw nsw i64 %13, 2
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 900
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 4.500000e+03
  %19 = getelementptr inbounds [900 x double], [900 x double]* %1, i64 %indvars.iv27, i64 %indvars.iv24
  store double %18, double* %19, align 8
  %exitcond26 = icmp eq i64 %indvars.iv.next25, 900
  br i1 %exitcond26, label %20, label %._crit_edge36

; <label>:20:                                     ; preds = %._crit_edge36
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next28, 1000
  br i1 %exitcond29, label %.preheader2.preheader, label %.preheader4

.preheader2.preheader:                            ; preds = %20
  br label %.preheader2

.preheader2:                                      ; preds = %28, %.preheader2.preheader
  %indvars.iv21 = phi i64 [ 0, %.preheader2.preheader ], [ %indvars.iv.next22, %28 ]
  br label %._crit_edge37

._crit_edge37:                                    ; preds = %._crit_edge37, %.preheader2
  %indvars.iv18 = phi i64 [ 0, %.preheader2 ], [ %indvars.iv.next19, %._crit_edge37 ]
  %21 = add nuw nsw i64 %indvars.iv18, 3
  %22 = mul nuw nsw i64 %21, %indvars.iv21
  %23 = trunc i64 %22 to i32
  %24 = srem i32 %23, 1100
  %25 = sitofp i32 %24 to double
  %26 = fdiv double %25, 5.500000e+03
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv21, i64 %indvars.iv18
  store double %26, double* %27, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next19, 1200
  br i1 %exitcond20, label %28, label %._crit_edge37

; <label>:28:                                     ; preds = %._crit_edge37
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next22, 900
  br i1 %exitcond23, label %.preheader.preheader, label %.preheader2

.preheader.preheader:                             ; preds = %28
  br label %.preheader

.preheader:                                       ; preds = %37, %.preheader.preheader
  %indvars.iv15 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next16, %37 ]
  br label %._crit_edge38

._crit_edge38:                                    ; preds = %._crit_edge38, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge38 ]
  %29 = add nuw nsw i64 %indvars.iv, 2
  %30 = mul nuw nsw i64 %29, %indvars.iv15
  %31 = add nuw nsw i64 %30, 2
  %32 = trunc i64 %31 to i32
  %33 = srem i32 %32, 1000
  %34 = sitofp i32 %33 to double
  %35 = fdiv double %34, 5.000000e+03
  %36 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv15, i64 %indvars.iv
  store double %35, double* %36, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %37, label %._crit_edge38

; <label>:37:                                     ; preds = %._crit_edge38
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 1200
  br i1 %exitcond17, label %38, label %.preheader

; <label>:38:                                     ; preds = %37
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_3mm([900 x double]* nocapture, [1000 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1100 x double]* nocapture, [1200 x double]* nocapture readonly, [1100 x double]* nocapture readonly, [1100 x double]* nocapture) unnamed_addr #2 {
  br label %.preheader4

.preheader4:                                      ; preds = %23, %7
  %indvars.iv38 = phi i64 [ 0, %7 ], [ %indvars.iv.next39, %23 ]
  br label %._crit_edge41

._crit_edge41:                                    ; preds = %22, %.preheader4
  %indvars.iv34 = phi i64 [ 0, %.preheader4 ], [ %indvars.iv.next35, %22 ]
  %8 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %indvars.iv38, i64 %indvars.iv34
  store double 0.000000e+00, double* %8, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge41
  %indvars.iv31 = phi i64 [ 0, %._crit_edge41 ], [ %indvars.iv.next32.1, %._crit_edge ]
  %9 = phi double [ 0.000000e+00, %._crit_edge41 ], [ %21, %._crit_edge ]
  %10 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv38, i64 %indvars.iv31
  %11 = load double, double* %10, align 8
  %12 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv31, i64 %indvars.iv34
  %13 = load double, double* %12, align 8
  %14 = fmul double %11, %13
  %15 = fadd double %9, %14
  store double %15, double* %8, align 8
  %indvars.iv.next32 = or i64 %indvars.iv31, 1
  %16 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv38, i64 %indvars.iv.next32
  %17 = load double, double* %16, align 8
  %18 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv.next32, i64 %indvars.iv34
  %19 = load double, double* %18, align 8
  %20 = fmul double %17, %19
  %21 = fadd double %15, %20
  store double %21, double* %8, align 8
  %indvars.iv.next32.1 = add nsw i64 %indvars.iv31, 2
  %exitcond33.1 = icmp eq i64 %indvars.iv.next32.1, 1000
  br i1 %exitcond33.1, label %22, label %._crit_edge

; <label>:22:                                     ; preds = %._crit_edge
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next35, 900
  br i1 %exitcond36, label %23, label %._crit_edge41

; <label>:23:                                     ; preds = %22
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next39, 800
  br i1 %exitcond40, label %.preheader2.preheader, label %.preheader4

.preheader2.preheader:                            ; preds = %23
  br label %.preheader2

.preheader2:                                      ; preds = %45, %.preheader2.preheader
  %indvars.iv28 = phi i64 [ 0, %.preheader2.preheader ], [ %indvars.iv.next29, %45 ]
  br label %._crit_edge43

._crit_edge43:                                    ; preds = %44, %.preheader2
  %indvars.iv24 = phi i64 [ 0, %.preheader2 ], [ %indvars.iv.next25, %44 ]
  %24 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv28, i64 %indvars.iv24
  store double 0.000000e+00, double* %24, align 8
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge42, %._crit_edge43
  %indvars.iv21 = phi i64 [ 0, %._crit_edge43 ], [ %indvars.iv.next22.2, %._crit_edge42 ]
  %25 = phi double [ 0.000000e+00, %._crit_edge43 ], [ %43, %._crit_edge42 ]
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv28, i64 %indvars.iv21
  %27 = load double, double* %26, align 8
  %28 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv21, i64 %indvars.iv24
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = fadd double %25, %30
  store double %31, double* %24, align 8
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv28, i64 %indvars.iv.next22
  %33 = load double, double* %32, align 8
  %34 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv.next22, i64 %indvars.iv24
  %35 = load double, double* %34, align 8
  %36 = fmul double %33, %35
  %37 = fadd double %31, %36
  store double %37, double* %24, align 8
  %indvars.iv.next22.1 = add nsw i64 %indvars.iv21, 2
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv28, i64 %indvars.iv.next22.1
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv.next22.1, i64 %indvars.iv24
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = fadd double %37, %42
  store double %43, double* %24, align 8
  %indvars.iv.next22.2 = add nsw i64 %indvars.iv21, 3
  %exitcond23.2 = icmp eq i64 %indvars.iv.next22.2, 1200
  br i1 %exitcond23.2, label %44, label %._crit_edge42

; <label>:44:                                     ; preds = %._crit_edge42
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next25, 1100
  br i1 %exitcond26, label %45, label %._crit_edge43

; <label>:45:                                     ; preds = %44
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next29, 900
  br i1 %exitcond30, label %.preheader.preheader, label %.preheader2

.preheader.preheader:                             ; preds = %45
  br label %.preheader

.preheader:                                       ; preds = %67, %.preheader.preheader
  %indvars.iv18 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next19, %67 ]
  br label %._crit_edge45

._crit_edge45:                                    ; preds = %66, %.preheader
  %indvars.iv14 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next15, %66 ]
  %46 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %indvars.iv18, i64 %indvars.iv14
  store double 0.000000e+00, double* %46, align 8
  br label %._crit_edge44

._crit_edge44:                                    ; preds = %._crit_edge44, %._crit_edge45
  %indvars.iv = phi i64 [ 0, %._crit_edge45 ], [ %indvars.iv.next.2, %._crit_edge44 ]
  %47 = phi double [ 0.000000e+00, %._crit_edge45 ], [ %65, %._crit_edge44 ]
  %48 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %indvars.iv18, i64 %indvars.iv
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv, i64 %indvars.iv14
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = fadd double %47, %52
  store double %53, double* %46, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %54 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %indvars.iv18, i64 %indvars.iv.next
  %55 = load double, double* %54, align 8
  %56 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv14
  %57 = load double, double* %56, align 8
  %58 = fmul double %55, %57
  %59 = fadd double %53, %58
  store double %59, double* %46, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %60 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %indvars.iv18, i64 %indvars.iv.next.1
  %61 = load double, double* %60, align 8
  %62 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv.next.1, i64 %indvars.iv14
  %63 = load double, double* %62, align 8
  %64 = fmul double %61, %63
  %65 = fadd double %59, %64
  store double %65, double* %46, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next.2, 900
  br i1 %exitcond.2, label %66, label %._crit_edge44

; <label>:66:                                     ; preds = %._crit_edge44
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 1100
  br i1 %exitcond16, label %67, label %._crit_edge45

; <label>:67:                                     ; preds = %66
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next19, 800
  br i1 %exitcond20, label %68, label %.preheader

; <label>:68:                                     ; preds = %67
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1100 x double]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader

.preheader:                                       ; preds = %17, %1
  %indvars.iv3 = phi i64 [ 0, %1 ], [ %indvars.iv.next4, %17 ]
  %6 = mul nuw nsw i64 %indvars.iv3, 800
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge6, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1100 x double], [1100 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %17, label %._crit_edge6

; <label>:17:                                     ; preds = %._crit_edge
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 800
  br i1 %exitcond5, label %18, label %.preheader

; <label>:18:                                     ; preds = %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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
