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
  br i1 %17, label %18, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:18:                                     ; preds = %2
  %19 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %19, align 1
  %20 = icmp eq i8 %strcmpload, 0
  br i1 %20, label %21, label %.._crit_edge_crit_edge5

.._crit_edge_crit_edge5:                          ; preds = %18
  br label %._crit_edge

; <label>:21:                                     ; preds = %18
  call fastcc void @print_array([1200 x double]* %13)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge5, %.._crit_edge_crit_edge, %21
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
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %.._crit_edge8_crit_edge, %6
  %indvars.iv16 = phi i64 [ 0, %6 ], [ %indvars.iv.next17, %.._crit_edge8_crit_edge ]
  br label %7

; <label>:7:                                      ; preds = %._crit_edge, %._crit_edge8
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %._crit_edge ], [ 0, %._crit_edge8 ]
  %8 = mul nuw nsw i64 %indvars.iv16, %indvars.iv13
  %9 = add nuw nsw i64 %8, 1
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 800
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %12, 8.000000e+02
  %14 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv13
  store double %13, double* %14, align 8
  %exitcond15 = icmp eq i64 %indvars.iv13, 1099
  br i1 %exitcond15, label %15, label %._crit_edge

._crit_edge:                                      ; preds = %7
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  br label %7

; <label>:15:                                     ; preds = %7
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next17, 800
  br i1 %exitcond21, label %._crit_edge10.preheader, label %.._crit_edge8_crit_edge

.._crit_edge8_crit_edge:                          ; preds = %15
  br label %._crit_edge8

._crit_edge10.preheader:                          ; preds = %15
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %.._crit_edge10_crit_edge, %._crit_edge10.preheader
  %indvars.iv11 = phi i64 [ %indvars.iv.next12, %.._crit_edge10_crit_edge ], [ 0, %._crit_edge10.preheader ]
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.._crit_edge9_crit_edge, %._crit_edge10
  %indvars.iv8 = phi i64 [ 0, %._crit_edge10 ], [ %indvars.iv.next9.1, %._crit_edge9.._crit_edge9_crit_edge ]
  %indvars.iv.next9 = or i64 %indvars.iv8, 1
  %16 = mul nuw nsw i64 %indvars.iv11, %indvars.iv.next9
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 900
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, 9.000000e+02
  %21 = getelementptr inbounds [900 x double], [900 x double]* %3, i64 %indvars.iv11, i64 %indvars.iv8
  store double %20, double* %21, align 8
  %indvars.iv.next9.1 = add nsw i64 %indvars.iv8, 2
  %22 = mul nuw nsw i64 %indvars.iv11, %indvars.iv.next9.1
  %23 = trunc i64 %22 to i32
  %24 = srem i32 %23, 900
  %25 = sitofp i32 %24 to double
  %26 = fdiv double %25, 9.000000e+02
  %27 = getelementptr inbounds [900 x double], [900 x double]* %3, i64 %indvars.iv11, i64 %indvars.iv.next9
  store double %26, double* %27, align 8
  %exitcond10.1 = icmp eq i64 %indvars.iv.next9, 899
  br i1 %exitcond10.1, label %28, label %._crit_edge9.._crit_edge9_crit_edge

._crit_edge9.._crit_edge9_crit_edge:              ; preds = %._crit_edge9
  br label %._crit_edge9

; <label>:28:                                     ; preds = %._crit_edge9
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next12, 1100
  br i1 %exitcond20, label %._crit_edge12.preheader, label %.._crit_edge10_crit_edge

.._crit_edge10_crit_edge:                         ; preds = %28
  br label %._crit_edge10

._crit_edge12.preheader:                          ; preds = %28
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %.._crit_edge12_crit_edge, %._crit_edge12.preheader
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %.._crit_edge12_crit_edge ], [ 0, %._crit_edge12.preheader ]
  br label %29

; <label>:29:                                     ; preds = %._crit_edge22, %._crit_edge12
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %._crit_edge22 ], [ 0, %._crit_edge12 ]
  %30 = add nuw nsw i64 %indvars.iv3, 3
  %31 = mul nuw nsw i64 %indvars.iv6, %30
  %32 = add nuw nsw i64 %31, 1
  %33 = trunc i64 %32 to i32
  %34 = srem i32 %33, 1200
  %35 = sitofp i32 %34 to double
  %36 = fdiv double %35, 1.200000e+03
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv6, i64 %indvars.iv3
  store double %36, double* %37, align 8
  %exitcond5 = icmp eq i64 %indvars.iv3, 1199
  br i1 %exitcond5, label %38, label %._crit_edge22

._crit_edge22:                                    ; preds = %29
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  br label %29

; <label>:38:                                     ; preds = %29
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next7, 900
  br i1 %exitcond19, label %._crit_edge14.preheader, label %.._crit_edge12_crit_edge

.._crit_edge12_crit_edge:                         ; preds = %38
  br label %._crit_edge12

._crit_edge14.preheader:                          ; preds = %38
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %.._crit_edge14_crit_edge, %._crit_edge14.preheader
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %.._crit_edge14_crit_edge ], [ 0, %._crit_edge14.preheader ]
  br label %39

; <label>:39:                                     ; preds = %._crit_edge23, %._crit_edge14
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge23 ], [ 0, %._crit_edge14 ]
  %40 = add nuw nsw i64 %indvars.iv, 2
  %41 = mul nuw nsw i64 %indvars.iv1, %40
  %42 = trunc i64 %41 to i32
  %43 = srem i32 %42, 1100
  %44 = sitofp i32 %43 to double
  %45 = fdiv double %44, 1.100000e+03
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv1, i64 %indvars.iv
  store double %45, double* %46, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1199
  br i1 %exitcond, label %47, label %._crit_edge23

._crit_edge23:                                    ; preds = %39
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %39

; <label>:47:                                     ; preds = %39
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next2, 800
  br i1 %exitcond18, label %48, label %.._crit_edge14_crit_edge

.._crit_edge14_crit_edge:                         ; preds = %47
  br label %._crit_edge14

; <label>:48:                                     ; preds = %47
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_2mm(double, double, [900 x double]*, [1100 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1200 x double]*, [1200 x double]* nocapture) unnamed_addr #2 {
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %.._crit_edge7_crit_edge, %7
  %indvars.iv10 = phi i64 [ 0, %7 ], [ %indvars.iv.next11, %.._crit_edge7_crit_edge ]
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %.._crit_edge6_crit_edge, %._crit_edge7
  %indvars.iv8 = phi i64 [ 0, %._crit_edge7 ], [ %indvars.iv.next9, %.._crit_edge6_crit_edge ]
  %8 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv8
  store double 0.000000e+00, double* %8, align 8
  br label %9

; <label>:9:                                      ; preds = %._crit_edge, %._crit_edge6
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %._crit_edge ], [ 0, %._crit_edge6 ]
  %10 = phi double [ %17, %._crit_edge ], [ 0.000000e+00, %._crit_edge6 ]
  %11 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv10, i64 %indvars.iv5
  %12 = load double, double* %11, align 8
  %13 = fmul double %12, %0
  %14 = getelementptr inbounds [900 x double], [900 x double]* %4, i64 %indvars.iv5, i64 %indvars.iv8
  %15 = load double, double* %14, align 8
  %16 = fmul double %13, %15
  %17 = fadd double %10, %16
  store double %17, double* %8, align 8
  %exitcond7 = icmp eq i64 %indvars.iv5, 1099
  br i1 %exitcond7, label %18, label %._crit_edge

._crit_edge:                                      ; preds = %9
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  br label %9

; <label>:18:                                     ; preds = %9
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next9, 900
  br i1 %exitcond14, label %19, label %.._crit_edge6_crit_edge

.._crit_edge6_crit_edge:                          ; preds = %18
  br label %._crit_edge6

; <label>:19:                                     ; preds = %18
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next11, 800
  br i1 %exitcond15, label %._crit_edge10.preheader, label %.._crit_edge7_crit_edge

.._crit_edge7_crit_edge:                          ; preds = %19
  br label %._crit_edge7

._crit_edge10.preheader:                          ; preds = %19
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %.._crit_edge10_crit_edge, %._crit_edge10.preheader
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %.._crit_edge10_crit_edge ], [ 0, %._crit_edge10.preheader ]
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %.._crit_edge9_crit_edge, %._crit_edge10
  %indvars.iv1 = phi i64 [ 0, %._crit_edge10 ], [ %indvars.iv.next2, %.._crit_edge9_crit_edge ]
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv3, i64 %indvars.iv1
  %21 = load double, double* %20, align 8
  %22 = fmul double %21, %1
  store double %22, double* %20, align 8
  br label %23

; <label>:23:                                     ; preds = %._crit_edge16, %._crit_edge9
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge16 ], [ 0, %._crit_edge9 ]
  %24 = phi double [ %30, %._crit_edge16 ], [ %22, %._crit_edge9 ]
  %25 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv3, i64 %indvars.iv
  %26 = load double, double* %25, align 8
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv, i64 %indvars.iv1
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = fadd double %24, %29
  store double %30, double* %20, align 8
  %exitcond = icmp eq i64 %indvars.iv, 899
  br i1 %exitcond, label %31, label %._crit_edge16

._crit_edge16:                                    ; preds = %23
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %23

; <label>:31:                                     ; preds = %23
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next2, 1200
  br i1 %exitcond12, label %32, label %.._crit_edge9_crit_edge

.._crit_edge9_crit_edge:                          ; preds = %31
  br label %._crit_edge9

; <label>:32:                                     ; preds = %31
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next4, 800
  br i1 %exitcond13, label %33, label %.._crit_edge10_crit_edge

.._crit_edge10_crit_edge:                         ; preds = %32
  br label %._crit_edge10

; <label>:33:                                     ; preds = %32
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %.._crit_edge2_crit_edge, %1
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %.._crit_edge2_crit_edge ]
  %6 = mul nuw nsw i64 %indvars.iv1, 800
  br label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge.._crit_edge._crit_edge_crit_edge, %._crit_edge2
  %indvars.iv = phi i64 [ 0, %._crit_edge2 ], [ %indvars.iv.next, %._crit_edge.._crit_edge._crit_edge_crit_edge ]
  %7 = add nuw nsw i64 %6, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge._crit_edge.._crit_edge_crit_edge

._crit_edge._crit_edge.._crit_edge_crit_edge:     ; preds = %._crit_edge._crit_edge
  br label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge._crit_edge
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge._crit_edge.._crit_edge_crit_edge, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %17, label %._crit_edge.._crit_edge._crit_edge_crit_edge

._crit_edge.._crit_edge._crit_edge_crit_edge:     ; preds = %._crit_edge
  br label %._crit_edge._crit_edge

; <label>:17:                                     ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 800
  br i1 %exitcond3, label %18, label %.._crit_edge2_crit_edge

.._crit_edge2_crit_edge:                          ; preds = %17
  br label %._crit_edge2

; <label>:18:                                     ; preds = %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

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
