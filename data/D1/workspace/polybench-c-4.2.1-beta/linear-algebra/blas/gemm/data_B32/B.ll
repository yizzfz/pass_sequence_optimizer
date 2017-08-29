; ModuleID = 'A.ll'
source_filename = "gemm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1100000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %8 = bitcast i8* %5 to [1100 x double]*
  %9 = bitcast i8* %6 to [1200 x double]*
  %10 = bitcast i8* %7 to [1100 x double]*
  call fastcc void @init_array(i32 1000, i32 1100, i32 1200, double* nonnull %3, double* nonnull %4, [1100 x double]* %8, [1200 x double]* %9, [1100 x double]* %10)
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  call fastcc void @kernel_gemm(i32 1000, i32 1100, i32 1200, double %11, double %12, [1100 x double]* %8, [1200 x double]* %9, [1100 x double]* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %.._crit_edge_crit_edge4

.._crit_edge_crit_edge4:                          ; preds = %14
  br label %._crit_edge

; <label>:17:                                     ; preds = %14
  call fastcc void @print_array(i32 1000, i32 1100, [1100 x double]* %8)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge4, %.._crit_edge_crit_edge, %17
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, double* nocapture, double* nocapture, [1100 x double]* nocapture, [1200 x double]* nocapture, [1100 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %3, align 8
  store double 1.200000e+00, double* %4, align 8
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %.._crit_edge.preheader_crit_edge, %8
  %indvars.iv26 = phi i64 [ 0, %8 ], [ %indvars.iv.next27, %.._crit_edge.preheader_crit_edge ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %._crit_edge.preheader
  %indvars.iv23 = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next24, %._crit_edge.._crit_edge_crit_edge ]
  %9 = mul nuw nsw i64 %indvars.iv23, %indvars.iv26
  %10 = add nuw nsw i64 %9, 1
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 1000
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 1.000000e+03
  %15 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv26, i64 %indvars.iv23
  store double %14, double* %15, align 8
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next24, 1100
  br i1 %exitcond25, label %16, label %._crit_edge.._crit_edge_crit_edge

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

; <label>:16:                                     ; preds = %._crit_edge
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next27, 1000
  br i1 %exitcond28, label %._crit_edge5.preheader.preheader, label %.._crit_edge.preheader_crit_edge

.._crit_edge.preheader_crit_edge:                 ; preds = %16
  br label %._crit_edge.preheader

._crit_edge5.preheader.preheader:                 ; preds = %16
  br label %._crit_edge5.preheader

._crit_edge5.preheader:                           ; preds = %._crit_edge4.._crit_edge5.preheader_crit_edge, %._crit_edge5.preheader.preheader
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %._crit_edge4.._crit_edge5.preheader_crit_edge ], [ 0, %._crit_edge5.preheader.preheader ]
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.._crit_edge5_crit_edge, %._crit_edge5.preheader
  %indvars.iv17 = phi i64 [ 0, %._crit_edge5.preheader ], [ %indvars.iv.next18.1, %._crit_edge5.._crit_edge5_crit_edge ]
  %indvars.iv.next18 = or i64 %indvars.iv17, 1
  %17 = mul nuw nsw i64 %indvars.iv.next18, %indvars.iv20
  %18 = trunc i64 %17 to i32
  %19 = srem i32 %18, 1200
  %20 = sitofp i32 %19 to double
  %21 = fdiv double %20, 1.200000e+03
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv20, i64 %indvars.iv17
  store double %21, double* %22, align 8
  %indvars.iv.next18.1 = add nsw i64 %indvars.iv17, 2
  %23 = mul nuw nsw i64 %indvars.iv.next18.1, %indvars.iv20
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, 1200
  %26 = sitofp i32 %25 to double
  %27 = fdiv double %26, 1.200000e+03
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv20, i64 %indvars.iv.next18
  store double %27, double* %28, align 8
  %exitcond19.1 = icmp eq i64 %indvars.iv.next18.1, 1200
  br i1 %exitcond19.1, label %._crit_edge4, label %._crit_edge5.._crit_edge5_crit_edge

._crit_edge5.._crit_edge5_crit_edge:              ; preds = %._crit_edge5
  br label %._crit_edge5

._crit_edge4:                                     ; preds = %._crit_edge5
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next21, 1000
  br i1 %exitcond22, label %._crit_edge7.preheader.preheader, label %._crit_edge4.._crit_edge5.preheader_crit_edge

._crit_edge4.._crit_edge5.preheader_crit_edge:    ; preds = %._crit_edge4
  br label %._crit_edge5.preheader

._crit_edge7.preheader.preheader:                 ; preds = %._crit_edge4
  br label %._crit_edge7.preheader

._crit_edge7.preheader:                           ; preds = %._crit_edge6.._crit_edge7.preheader_crit_edge, %._crit_edge7.preheader.preheader
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %._crit_edge6.._crit_edge7.preheader_crit_edge ], [ 0, %._crit_edge7.preheader.preheader ]
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.._crit_edge7_crit_edge, %._crit_edge7.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge7.preheader ], [ %indvars.iv.next, %._crit_edge7.._crit_edge7_crit_edge ]
  %29 = add nuw nsw i64 %indvars.iv, 2
  %30 = mul nuw nsw i64 %29, %indvars.iv14
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, 1100
  %33 = sitofp i32 %32 to double
  %34 = fdiv double %33, 1.100000e+03
  %35 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv14, i64 %indvars.iv
  store double %34, double* %35, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %._crit_edge6, label %._crit_edge7.._crit_edge7_crit_edge

._crit_edge7.._crit_edge7_crit_edge:              ; preds = %._crit_edge7
  br label %._crit_edge7

._crit_edge6:                                     ; preds = %._crit_edge7
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 1200
  br i1 %exitcond16, label %36, label %._crit_edge6.._crit_edge7.preheader_crit_edge

._crit_edge6.._crit_edge7.preheader_crit_edge:    ; preds = %._crit_edge6
  br label %._crit_edge7.preheader

; <label>:36:                                     ; preds = %._crit_edge6
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemm(i32, i32, i32, double, double, [1100 x double]* nocapture, [1200 x double]* nocapture readonly, [1100 x double]* nocapture readonly) unnamed_addr #2 {
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %.._crit_edge.preheader_crit_edge, %8
  %indvars.iv13 = phi i64 [ 0, %8 ], [ %indvars.iv.next14, %.._crit_edge.preheader_crit_edge ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %._crit_edge.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next.4, %._crit_edge.._crit_edge_crit_edge ]
  %9 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv13, i64 %indvars.iv
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, %4
  store double %11, double* %9, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %12 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv13, i64 %indvars.iv.next
  %13 = load double, double* %12, align 8
  %14 = fmul double %13, %4
  store double %14, double* %12, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %15 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv13, i64 %indvars.iv.next.1
  %16 = load double, double* %15, align 8
  %17 = fmul double %16, %4
  store double %17, double* %15, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %18 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv13, i64 %indvars.iv.next.2
  %19 = load double, double* %18, align 8
  %20 = fmul double %19, %4
  store double %20, double* %18, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %21 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv13, i64 %indvars.iv.next.3
  %22 = load double, double* %21, align 8
  %23 = fmul double %22, %4
  store double %23, double* %21, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 1100
  br i1 %exitcond.4, label %._crit_edge4.preheader.preheader, label %._crit_edge.._crit_edge_crit_edge

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

._crit_edge4.preheader.preheader:                 ; preds = %._crit_edge
  br label %._crit_edge4.preheader

._crit_edge4.preheader:                           ; preds = %._crit_edge3.._crit_edge4.preheader_crit_edge, %._crit_edge4.preheader.preheader
  %indvars.iv11 = phi i64 [ %indvars.iv.next12, %._crit_edge3.._crit_edge4.preheader_crit_edge ], [ 0, %._crit_edge4.preheader.preheader ]
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv13, i64 %indvars.iv11
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.._crit_edge4_crit_edge, %._crit_edge4.preheader
  %indvars.iv9 = phi i64 [ 0, %._crit_edge4.preheader ], [ %indvars.iv.next10.1, %._crit_edge4.._crit_edge4_crit_edge ]
  %25 = load double, double* %24, align 8
  %26 = fmul double %25, %3
  %27 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv11, i64 %indvars.iv9
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv13, i64 %indvars.iv9
  %31 = load double, double* %30, align 8
  %32 = fadd double %31, %29
  store double %32, double* %30, align 8
  %indvars.iv.next10 = or i64 %indvars.iv9, 1
  %33 = load double, double* %24, align 8
  %34 = fmul double %33, %3
  %35 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv11, i64 %indvars.iv.next10
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv13, i64 %indvars.iv.next10
  %39 = load double, double* %38, align 8
  %40 = fadd double %39, %37
  store double %40, double* %38, align 8
  %indvars.iv.next10.1 = add nsw i64 %indvars.iv9, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next10.1, 1100
  br i1 %exitcond.1, label %._crit_edge3, label %._crit_edge4.._crit_edge4_crit_edge

._crit_edge4.._crit_edge4_crit_edge:              ; preds = %._crit_edge4
  br label %._crit_edge4

._crit_edge3:                                     ; preds = %._crit_edge4
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond = icmp eq i64 %indvars.iv.next12, 1200
  br i1 %exitcond, label %41, label %._crit_edge3.._crit_edge4.preheader_crit_edge

._crit_edge3.._crit_edge4.preheader_crit_edge:    ; preds = %._crit_edge3
  br label %._crit_edge4.preheader

; <label>:41:                                     ; preds = %._crit_edge3
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 1000
  br i1 %exitcond15, label %42, label %.._crit_edge.preheader_crit_edge

.._crit_edge.preheader_crit_edge:                 ; preds = %41
  br label %._crit_edge.preheader

; <label>:42:                                     ; preds = %41
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

._crit_edge.preheader:                            ; preds = %.._crit_edge.preheader_crit_edge, %3
  %indvars.iv5 = phi i64 [ 0, %3 ], [ %indvars.iv.next6, %.._crit_edge.preheader_crit_edge ]
  %8 = mul nuw nsw i64 %indvars.iv5, 1000
  br label %._crit_edge2._crit_edge

._crit_edge2._crit_edge:                          ; preds = %._crit_edge2.._crit_edge2._crit_edge_crit_edge, %._crit_edge.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next, %._crit_edge2.._crit_edge2._crit_edge_crit_edge ]
  %9 = add nuw nsw i64 %indvars.iv, %8
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge2._crit_edge.._crit_edge2_crit_edge

._crit_edge2._crit_edge.._crit_edge2_crit_edge:   ; preds = %._crit_edge2._crit_edge
  br label %._crit_edge2

; <label>:13:                                     ; preds = %._crit_edge2._crit_edge
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2._crit_edge.._crit_edge2_crit_edge, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv5, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %19, label %._crit_edge2.._crit_edge2._crit_edge_crit_edge

._crit_edge2.._crit_edge2._crit_edge_crit_edge:   ; preds = %._crit_edge2
  br label %._crit_edge2._crit_edge

; <label>:19:                                     ; preds = %._crit_edge2
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond7, label %20, label %.._crit_edge.preheader_crit_edge

.._crit_edge.preheader_crit_edge:                 ; preds = %19
  br label %._crit_edge.preheader

; <label>:20:                                     ; preds = %19
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
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
