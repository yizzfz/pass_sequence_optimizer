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
  %5 = tail call i8* @polybench_alloc_data(i64 720000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 880000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 990000, i32 8) #4
  %8 = tail call i8* @polybench_alloc_data(i64 1080000, i32 8) #4
  %9 = tail call i8* @polybench_alloc_data(i64 960000, i32 8) #4
  %10 = bitcast i8* %6 to [1100 x double]*
  %11 = bitcast i8* %7 to [900 x double]*
  %12 = bitcast i8* %8 to [1200 x double]*
  %13 = bitcast i8* %9 to [1200 x double]*
  call fastcc void @init_array(i32 800, i32 900, i32 1100, i32 1200, double* nonnull %3, double* nonnull %4, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %13)
  tail call void (...) @polybench_timer_start() #4
  %14 = load double, double* %3, align 8
  %15 = load double, double* %4, align 8
  %16 = bitcast i8* %5 to [900 x double]*
  tail call fastcc void @kernel_2mm(i32 800, i32 900, i32 1100, i32 1200, double %14, double %15, [900 x double]* %16, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %13)
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
  tail call fastcc void @print_array(i32 800, i32 1200, [1200 x double]* %13)
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %2, %21
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  tail call void @free(i8* %8) #4
  tail call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, i32, i32, double* nocapture, double* nocapture, [1100 x double]* nocapture, [900 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %4, align 8
  store double 1.200000e+00, double* %5, align 8
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %18, %10
  %indvars.iv37 = phi i64 [ 0, %10 ], [ %indvars.iv.next38, %18 ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.preheader
  %indvars.iv34 = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next35, %._crit_edge ]
  %11 = mul nuw nsw i64 %indvars.iv34, %indvars.iv37
  %12 = add nuw nsw i64 %11, 1
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 800
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, 8.000000e+02
  %17 = getelementptr inbounds [1100 x double], [1100 x double]* %6, i64 %indvars.iv37, i64 %indvars.iv34
  store double %16, double* %17, align 8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next35, 1100
  br i1 %exitcond36, label %18, label %._crit_edge

; <label>:18:                                     ; preds = %._crit_edge
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next38, 800
  br i1 %exitcond39, label %._crit_edge6.preheader.preheader, label %._crit_edge.preheader

._crit_edge6.preheader.preheader:                 ; preds = %18
  br label %._crit_edge6.preheader

._crit_edge6.preheader:                           ; preds = %._crit_edge6.preheader.preheader, %._crit_edge5
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %._crit_edge5 ], [ 0, %._crit_edge6.preheader.preheader ]
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6, %._crit_edge6.preheader
  %indvars.iv28 = phi i64 [ 0, %._crit_edge6.preheader ], [ %indvars.iv.next29.1, %._crit_edge6 ]
  %indvars.iv.next29 = or i64 %indvars.iv28, 1
  %19 = mul nuw nsw i64 %indvars.iv.next29, %indvars.iv31
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 900
  %22 = sitofp i32 %21 to double
  %23 = fdiv double %22, 9.000000e+02
  %24 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv31, i64 %indvars.iv28
  store double %23, double* %24, align 8
  %indvars.iv.next29.1 = add nsw i64 %indvars.iv28, 2
  %25 = mul nuw nsw i64 %indvars.iv.next29.1, %indvars.iv31
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 900
  %28 = sitofp i32 %27 to double
  %29 = fdiv double %28, 9.000000e+02
  %30 = getelementptr inbounds [900 x double], [900 x double]* %7, i64 %indvars.iv31, i64 %indvars.iv.next29
  store double %29, double* %30, align 8
  %exitcond30.1 = icmp eq i64 %indvars.iv.next29.1, 900
  br i1 %exitcond30.1, label %._crit_edge5, label %._crit_edge6

._crit_edge5:                                     ; preds = %._crit_edge6
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next32, 1100
  br i1 %exitcond33, label %._crit_edge8.preheader.preheader, label %._crit_edge6.preheader

._crit_edge8.preheader.preheader:                 ; preds = %._crit_edge5
  br label %._crit_edge8.preheader

._crit_edge8.preheader:                           ; preds = %._crit_edge8.preheader.preheader, %._crit_edge7
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %._crit_edge7 ], [ 0, %._crit_edge8.preheader.preheader ]
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8, %._crit_edge8.preheader
  %indvars.iv22 = phi i64 [ 0, %._crit_edge8.preheader ], [ %indvars.iv.next23, %._crit_edge8 ]
  %31 = add nuw nsw i64 %indvars.iv22, 3
  %32 = mul nuw nsw i64 %31, %indvars.iv25
  %33 = add nuw nsw i64 %32, 1
  %34 = trunc i64 %33 to i32
  %35 = srem i32 %34, 1200
  %36 = sitofp i32 %35 to double
  %37 = fdiv double %36, 1.200000e+03
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %8, i64 %indvars.iv25, i64 %indvars.iv22
  store double %37, double* %38, align 8
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
  %39 = add nuw nsw i64 %indvars.iv, 2
  %40 = mul nuw nsw i64 %39, %indvars.iv19
  %41 = trunc i64 %40 to i32
  %42 = srem i32 %41, 1100
  %43 = sitofp i32 %42 to double
  %44 = fdiv double %43, 1.100000e+03
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv19, i64 %indvars.iv
  store double %44, double* %45, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge9, label %._crit_edge10

._crit_edge9:                                     ; preds = %._crit_edge10
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next20, 800
  br i1 %exitcond21, label %46, label %._crit_edge10.preheader

; <label>:46:                                     ; preds = %._crit_edge9
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_2mm(i32, i32, i32, i32, double, double, [900 x double]* nocapture, [1100 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1200 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %30, %11
  %indvars.iv25 = phi i64 [ 0, %11 ], [ %indvars.iv.next26, %30 ]
  br label %12

; <label>:12:                                     ; preds = %._crit_edge, %._crit_edge.preheader
  %indvars.iv21 = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next22, %._crit_edge ]
  %13 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv25, i64 %indvars.iv21
  store double 0.000000e+00, double* %13, align 8
  br label %14

; <label>:14:                                     ; preds = %14, %12
  %15 = phi double [ 0.000000e+00, %12 ], [ %29, %14 ]
  %indvars.iv18 = phi i64 [ 0, %12 ], [ %indvars.iv.next19.1, %14 ]
  %16 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv25, i64 %indvars.iv18
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, %4
  %19 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 %indvars.iv18, i64 %indvars.iv21
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fadd double %15, %21
  store double %22, double* %13, align 8
  %indvars.iv.next19 = or i64 %indvars.iv18, 1
  %23 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv25, i64 %indvars.iv.next19
  %24 = load double, double* %23, align 8
  %25 = fmul double %24, %4
  %26 = getelementptr inbounds [900 x double], [900 x double]* %8, i64 %indvars.iv.next19, i64 %indvars.iv21
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = fadd double %22, %28
  store double %29, double* %13, align 8
  %indvars.iv.next19.1 = add nsw i64 %indvars.iv18, 2
  %exitcond20.1 = icmp eq i64 %indvars.iv.next19.1, 1100
  br i1 %exitcond20.1, label %._crit_edge, label %14

._crit_edge:                                      ; preds = %14
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next22, 900
  br i1 %exitcond23, label %30, label %12

; <label>:30:                                     ; preds = %._crit_edge
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next26, 800
  br i1 %exitcond27, label %._crit_edge6.preheader.preheader, label %._crit_edge.preheader

._crit_edge6.preheader.preheader:                 ; preds = %30
  br label %._crit_edge6.preheader

._crit_edge6.preheader:                           ; preds = %._crit_edge6.preheader.preheader, %._crit_edge5
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %._crit_edge5 ], [ 0, %._crit_edge6.preheader.preheader ]
  br label %31

; <label>:31:                                     ; preds = %._crit_edge6, %._crit_edge6.preheader
  %indvars.iv13 = phi i64 [ 0, %._crit_edge6.preheader ], [ %indvars.iv.next14, %._crit_edge6 ]
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %10, i64 %indvars.iv15, i64 %indvars.iv13
  %33 = load double, double* %32, align 8
  %34 = fmul double %33, %5
  store double %34, double* %32, align 8
  br label %35

; <label>:35:                                     ; preds = %35, %31
  %36 = phi double [ %34, %31 ], [ %48, %35 ]
  %indvars.iv = phi i64 [ 0, %31 ], [ %indvars.iv.next.1, %35 ]
  %37 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv15, i64 %indvars.iv
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv, i64 %indvars.iv13
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = fadd double %36, %41
  store double %42, double* %32, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %43 = getelementptr inbounds [900 x double], [900 x double]* %6, i64 %indvars.iv15, i64 %indvars.iv.next
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %9, i64 %indvars.iv.next, i64 %indvars.iv13
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = fadd double %42, %47
  store double %48, double* %32, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 900
  br i1 %exitcond.1, label %._crit_edge6, label %35

._crit_edge6:                                     ; preds = %35
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next14, 1200
  br i1 %exitcond, label %._crit_edge5, label %31

._crit_edge5:                                     ; preds = %._crit_edge6
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 800
  br i1 %exitcond17, label %49, label %._crit_edge6.preheader

; <label>:49:                                     ; preds = %._crit_edge5
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
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
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv5, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
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
