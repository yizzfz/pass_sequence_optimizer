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
  %3 = call i8* @polybench_alloc_data(i64 720000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 800000, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 900000, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 990000, i32 8) #4
  %7 = call i8* @polybench_alloc_data(i64 1080000, i32 8) #4
  %8 = call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %9 = call i8* @polybench_alloc_data(i64 880000, i32 8) #4
  %10 = bitcast i8* %4 to [1000 x double]*
  %11 = bitcast i8* %5 to [900 x double]*
  %12 = bitcast i8* %7 to [1200 x double]*
  %13 = bitcast i8* %8 to [1100 x double]*
  call fastcc void @init_array([1000 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1100 x double]* %13)
  call void (...) @polybench_timer_start() #4
  %14 = bitcast i8* %3 to [900 x double]*
  %15 = bitcast i8* %6 to [1100 x double]*
  %16 = bitcast i8* %9 to [1100 x double]*
  call fastcc void @kernel_3mm([900 x double]* %14, [1000 x double]* %10, [900 x double]* %11, [1100 x double]* %15, [1200 x double]* %12, [1100 x double]* %13, [1100 x double]* %16)
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
  %22 = bitcast i8* %9 to [1100 x double]*
  call fastcc void @print_array([1100 x double]* %22)
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %2, %21
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  call void @free(i8* %8) #4
  call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1000 x double]* nocapture, [900 x double]* nocapture, [1200 x double]* nocapture, [1100 x double]* nocapture) unnamed_addr #2 {
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %12, %4
  %indvars.iv1315 = phi i64 [ 0, %4 ], [ %indvars.iv.next14, %12 ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.._crit_edge_crit_edge
  %indvars.iv1114 = phi i64 [ 0, %.._crit_edge_crit_edge ], [ %indvars.iv.next12, %._crit_edge ]
  %5 = mul nuw nsw i64 %indvars.iv1315, %indvars.iv1114
  %6 = add nuw nsw i64 %5, 1
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 800
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, 4.000000e+03
  %11 = getelementptr inbounds [1000 x double], [1000 x double]* %0, i64 %indvars.iv1315, i64 %indvars.iv1114
  store double %10, double* %11, align 8
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv1114, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next12, 1000
  br i1 %exitcond6, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv1315, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next14, 800
  br i1 %exitcond7, label %..._crit_edge15_crit_edge_crit_edge, label %.._crit_edge_crit_edge

..._crit_edge15_crit_edge_crit_edge:              ; preds = %12
  br label %.._crit_edge15_crit_edge

.._crit_edge15_crit_edge:                         ; preds = %20, %..._crit_edge15_crit_edge_crit_edge
  %indvars.iv913 = phi i64 [ 0, %..._crit_edge15_crit_edge_crit_edge ], [ %indvars.iv.next10, %20 ]
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15, %.._crit_edge15_crit_edge
  %indvars.iv712 = phi i64 [ 0, %.._crit_edge15_crit_edge ], [ %indvars.iv.next8, %._crit_edge15 ]
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv712, 1
  %13 = mul nuw nsw i64 %indvars.iv913, %indvars.iv.next8
  %14 = add nuw nsw i64 %13, 2
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 900
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 4.500000e+03
  %19 = getelementptr inbounds [900 x double], [900 x double]* %1, i64 %indvars.iv913, i64 %indvars.iv712
  store double %18, double* %19, align 8
  %exitcond4 = icmp eq i64 %indvars.iv.next8, 900
  br i1 %exitcond4, label %20, label %._crit_edge15

; <label>:20:                                     ; preds = %._crit_edge15
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv913, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next10, 1000
  br i1 %exitcond5, label %..._crit_edge16_crit_edge_crit_edge, label %.._crit_edge15_crit_edge

..._crit_edge16_crit_edge_crit_edge:              ; preds = %20
  br label %.._crit_edge16_crit_edge

.._crit_edge16_crit_edge:                         ; preds = %28, %..._crit_edge16_crit_edge_crit_edge
  %indvars.iv511 = phi i64 [ 0, %..._crit_edge16_crit_edge_crit_edge ], [ %indvars.iv.next6, %28 ]
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16, %.._crit_edge16_crit_edge
  %indvars.iv310 = phi i64 [ 0, %.._crit_edge16_crit_edge ], [ %indvars.iv.next4, %._crit_edge16 ]
  %21 = add nuw nsw i64 %indvars.iv310, 3
  %22 = mul nuw nsw i64 %indvars.iv511, %21
  %23 = trunc i64 %22 to i32
  %24 = srem i32 %23, 1100
  %25 = sitofp i32 %24 to double
  %26 = fdiv double %25, 5.500000e+03
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv511, i64 %indvars.iv310
  store double %26, double* %27, align 8
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv310, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next4, 1200
  br i1 %exitcond2, label %28, label %._crit_edge16

; <label>:28:                                     ; preds = %._crit_edge16
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv511, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next6, 900
  br i1 %exitcond3, label %..._crit_edge17_crit_edge_crit_edge, label %.._crit_edge16_crit_edge

..._crit_edge17_crit_edge_crit_edge:              ; preds = %28
  br label %.._crit_edge17_crit_edge

.._crit_edge17_crit_edge:                         ; preds = %37, %..._crit_edge17_crit_edge_crit_edge
  %indvars.iv19 = phi i64 [ 0, %..._crit_edge17_crit_edge_crit_edge ], [ %indvars.iv.next2, %37 ]
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17, %.._crit_edge17_crit_edge
  %indvars.iv8 = phi i64 [ 0, %.._crit_edge17_crit_edge ], [ %indvars.iv.next, %._crit_edge17 ]
  %29 = add nuw nsw i64 %indvars.iv8, 2
  %30 = mul nuw nsw i64 %indvars.iv19, %29
  %31 = add nuw nsw i64 %30, 2
  %32 = trunc i64 %31 to i32
  %33 = srem i32 %32, 1000
  %34 = sitofp i32 %33 to double
  %35 = fdiv double %34, 5.000000e+03
  %36 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv19, i64 %indvars.iv8
  store double %35, double* %36, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv8, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %37, label %._crit_edge17

; <label>:37:                                     ; preds = %._crit_edge17
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next2, 1200
  br i1 %exitcond1, label %38, label %.._crit_edge17_crit_edge

; <label>:38:                                     ; preds = %37
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_3mm([900 x double]* nocapture, [1000 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1100 x double]* nocapture, [1200 x double]* nocapture readonly, [1100 x double]* nocapture readonly, [1100 x double]* nocapture) unnamed_addr #2 {
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %24, %7
  %indvars.iv1518 = phi i64 [ 0, %7 ], [ %indvars.iv.next16, %24 ]
  br label %8

; <label>:8:                                      ; preds = %._crit_edge, %.._crit_edge_crit_edge
  %indvars.iv1317 = phi i64 [ 0, %.._crit_edge_crit_edge ], [ %indvars.iv.next14, %._crit_edge ]
  %9 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %indvars.iv1518, i64 %indvars.iv1317
  store double 0.000000e+00, double* %9, align 8
  br label %10

; <label>:10:                                     ; preds = %10, %8
  %11 = phi double [ 0.000000e+00, %8 ], [ %23, %10 ]
  %indvars.iv1116 = phi i64 [ 0, %8 ], [ %indvars.iv.next12.1, %10 ]
  %12 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv1518, i64 %indvars.iv1116
  %13 = load double, double* %12, align 8
  %14 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv1116, i64 %indvars.iv1317
  %15 = load double, double* %14, align 8
  %16 = fmul double %13, %15
  %17 = fadd double %11, %16
  store double %17, double* %9, align 8
  %indvars.iv.next12 = or i64 %indvars.iv1116, 1
  %18 = getelementptr inbounds [1000 x double], [1000 x double]* %1, i64 %indvars.iv1518, i64 %indvars.iv.next12
  %19 = load double, double* %18, align 8
  %20 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv.next12, i64 %indvars.iv1317
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = fadd double %17, %22
  store double %23, double* %9, align 8
  %indvars.iv.next12.1 = add nsw i64 %indvars.iv1116, 2
  %exitcond6.1 = icmp eq i64 %indvars.iv.next12.1, 1000
  br i1 %exitcond6.1, label %._crit_edge, label %10

._crit_edge:                                      ; preds = %10
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv1317, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next14, 900
  br i1 %exitcond7, label %24, label %8

; <label>:24:                                     ; preds = %._crit_edge
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv1518, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next16, 800
  br i1 %exitcond8, label %..._crit_edge17_crit_edge_crit_edge, label %.._crit_edge_crit_edge

..._crit_edge17_crit_edge_crit_edge:              ; preds = %24
  br label %.._crit_edge17_crit_edge

.._crit_edge17_crit_edge:                         ; preds = %47, %..._crit_edge17_crit_edge_crit_edge
  %indvars.iv915 = phi i64 [ 0, %..._crit_edge17_crit_edge_crit_edge ], [ %indvars.iv.next10, %47 ]
  br label %25

; <label>:25:                                     ; preds = %._crit_edge17, %.._crit_edge17_crit_edge
  %indvars.iv714 = phi i64 [ 0, %.._crit_edge17_crit_edge ], [ %indvars.iv.next8, %._crit_edge17 ]
  %26 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv915, i64 %indvars.iv714
  store double 0.000000e+00, double* %26, align 8
  br label %27

; <label>:27:                                     ; preds = %27, %25
  %28 = phi double [ 0.000000e+00, %25 ], [ %46, %27 ]
  %indvars.iv513 = phi i64 [ 0, %25 ], [ %indvars.iv.next6.2, %27 ]
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv915, i64 %indvars.iv513
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv513, i64 %indvars.iv714
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fadd double %28, %33
  store double %34, double* %26, align 8
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv513, 1
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv915, i64 %indvars.iv.next6
  %36 = load double, double* %35, align 8
  %37 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv.next6, i64 %indvars.iv714
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = fadd double %34, %39
  store double %40, double* %26, align 8
  %indvars.iv.next6.1 = add nsw i64 %indvars.iv513, 2
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv915, i64 %indvars.iv.next6.1
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv.next6.1, i64 %indvars.iv714
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = fadd double %40, %45
  store double %46, double* %26, align 8
  %indvars.iv.next6.2 = add nsw i64 %indvars.iv513, 3
  %exitcond3.2 = icmp eq i64 %indvars.iv.next6.2, 1200
  br i1 %exitcond3.2, label %._crit_edge17, label %27

._crit_edge17:                                    ; preds = %27
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv714, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next8, 1100
  br i1 %exitcond4, label %47, label %25

; <label>:47:                                     ; preds = %._crit_edge17
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv915, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next10, 900
  br i1 %exitcond5, label %..._crit_edge18_crit_edge_crit_edge, label %.._crit_edge17_crit_edge

..._crit_edge18_crit_edge_crit_edge:              ; preds = %47
  br label %.._crit_edge18_crit_edge

.._crit_edge18_crit_edge:                         ; preds = %70, %..._crit_edge18_crit_edge_crit_edge
  %indvars.iv312 = phi i64 [ 0, %..._crit_edge18_crit_edge_crit_edge ], [ %indvars.iv.next4, %70 ]
  br label %48

; <label>:48:                                     ; preds = %._crit_edge18, %.._crit_edge18_crit_edge
  %indvars.iv111 = phi i64 [ 0, %.._crit_edge18_crit_edge ], [ %indvars.iv.next2, %._crit_edge18 ]
  %49 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %indvars.iv312, i64 %indvars.iv111
  store double 0.000000e+00, double* %49, align 8
  br label %50

; <label>:50:                                     ; preds = %50, %48
  %51 = phi double [ 0.000000e+00, %48 ], [ %69, %50 ]
  %indvars.iv10 = phi i64 [ 0, %48 ], [ %indvars.iv.next.2, %50 ]
  %52 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %indvars.iv312, i64 %indvars.iv10
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv10, i64 %indvars.iv111
  %55 = load double, double* %54, align 8
  %56 = fmul double %53, %55
  %57 = fadd double %51, %56
  store double %57, double* %49, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv10, 1
  %58 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %indvars.iv312, i64 %indvars.iv.next
  %59 = load double, double* %58, align 8
  %60 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv111
  %61 = load double, double* %60, align 8
  %62 = fmul double %59, %61
  %63 = fadd double %57, %62
  store double %63, double* %49, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv10, 2
  %64 = getelementptr inbounds [900 x double], [900 x double]* %0, i64 %indvars.iv312, i64 %indvars.iv.next.1
  %65 = load double, double* %64, align 8
  %66 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv.next.1, i64 %indvars.iv111
  %67 = load double, double* %66, align 8
  %68 = fmul double %65, %67
  %69 = fadd double %63, %68
  store double %69, double* %49, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv10, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next.2, 900
  br i1 %exitcond.2, label %._crit_edge18, label %50

._crit_edge18:                                    ; preds = %50
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv111, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next2, 1100
  br i1 %exitcond1, label %70, label %48

; <label>:70:                                     ; preds = %._crit_edge18
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv312, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next4, 800
  br i1 %exitcond2, label %71, label %.._crit_edge18_crit_edge

; <label>:71:                                     ; preds = %70
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1100 x double]* nocapture readonly) unnamed_addr #0 {
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
  %15 = getelementptr inbounds [1100 x double], [1100 x double]* %0, i64 %indvars.iv13, i64 %indvars.iv2
  %16 = load double, double* %15, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv2, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
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
