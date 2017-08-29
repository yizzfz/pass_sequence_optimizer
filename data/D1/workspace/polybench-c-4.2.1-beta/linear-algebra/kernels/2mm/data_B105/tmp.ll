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
  call fastcc void @init_array(double* nonnull %3, double* nonnull %4, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %13)
  tail call void (...) @polybench_timer_start() #4
  %14 = load double, double* %3, align 8
  %15 = load double, double* %4, align 8
  %16 = bitcast i8* %5 to [900 x double]*
  tail call fastcc void @kernel_2mm(double %14, double %15, [900 x double]* %16, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %13)
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
  tail call fastcc void @print_array([1200 x double]* %13)
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
define internal fastcc void @init_array(double* nocapture, double* nocapture, [1100 x double]* nocapture, [900 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %0, align 8
  store double 1.200000e+00, double* %1, align 8
  br label %.preheader17

.preheader17:                                     ; preds = %14, %6
  %indvars.iv1325 = phi i64 [ 0, %6 ], [ %indvars.iv.next14, %14 ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader17
  %indvars.iv1124 = phi i64 [ 0, %.preheader17 ], [ %indvars.iv.next12, %._crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv1124, %indvars.iv1325
  %8 = add nuw nsw i64 %7, 1
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 800
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 8.000000e+02
  %13 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv1325, i64 %indvars.iv1124
  store double %12, double* %13, align 8
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv1124, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next12, 1100
  br i1 %exitcond6, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %._crit_edge
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv1325, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next14, 800
  br i1 %exitcond7, label %.preheader16.preheader, label %.preheader17

.preheader16.preheader:                           ; preds = %14
  br label %.preheader16

.preheader16:                                     ; preds = %.preheader16.preheader, %28
  %indvars.iv923 = phi i64 [ %indvars.iv.next10, %28 ], [ 0, %.preheader16.preheader ]
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8, %.preheader16
  %indvars.iv722 = phi i64 [ 0, %.preheader16 ], [ %indvars.iv.next8.1, %._crit_edge8 ]
  %indvars.iv.next8 = or i64 %indvars.iv722, 1
  %15 = mul nuw nsw i64 %indvars.iv.next8, %indvars.iv923
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 900
  %18 = sitofp i32 %17 to double
  %19 = getelementptr inbounds [900 x double], [900 x double]* %3, i64 %indvars.iv923, i64 %indvars.iv722
  %indvars.iv.next8.1 = add nuw nsw i64 %indvars.iv722, 2
  %20 = mul nuw nsw i64 %indvars.iv.next8.1, %indvars.iv923
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, 900
  %23 = sitofp i32 %22 to double
  %24 = insertelement <2 x double> undef, double %18, i32 0
  %25 = insertelement <2 x double> %24, double %23, i32 1
  %26 = fdiv <2 x double> %25, <double 9.000000e+02, double 9.000000e+02>
  %27 = bitcast double* %19 to <2 x double>*
  store <2 x double> %26, <2 x double>* %27, align 8
  %exitcond4.1 = icmp eq i64 %indvars.iv.next8.1, 900
  br i1 %exitcond4.1, label %28, label %._crit_edge8

; <label>:28:                                     ; preds = %._crit_edge8
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv923, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next10, 1100
  br i1 %exitcond5, label %.preheader15.preheader, label %.preheader16

.preheader15.preheader:                           ; preds = %28
  br label %.preheader15

.preheader15:                                     ; preds = %.preheader15.preheader, %37
  %indvars.iv521 = phi i64 [ %indvars.iv.next6, %37 ], [ 0, %.preheader15.preheader ]
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9, %.preheader15
  %indvars.iv320 = phi i64 [ 0, %.preheader15 ], [ %indvars.iv.next4, %._crit_edge9 ]
  %29 = add nuw nsw i64 %indvars.iv320, 3
  %30 = mul nuw nsw i64 %29, %indvars.iv521
  %31 = add nuw nsw i64 %30, 1
  %32 = trunc i64 %31 to i32
  %33 = srem i32 %32, 1200
  %34 = sitofp i32 %33 to double
  %35 = fdiv double %34, 1.200000e+03
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv521, i64 %indvars.iv320
  store double %35, double* %36, align 8
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv320, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next4, 1200
  br i1 %exitcond2, label %37, label %._crit_edge9

; <label>:37:                                     ; preds = %._crit_edge9
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv521, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next6, 900
  br i1 %exitcond3, label %.preheader.preheader, label %.preheader15

.preheader.preheader:                             ; preds = %37
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %45
  %indvars.iv119 = phi i64 [ %indvars.iv.next2, %45 ], [ 0, %.preheader.preheader ]
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10, %.preheader
  %indvars.iv18 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge10 ]
  %38 = add nuw nsw i64 %indvars.iv18, 2
  %39 = mul nuw nsw i64 %38, %indvars.iv119
  %40 = trunc i64 %39 to i32
  %41 = srem i32 %40, 1100
  %42 = sitofp i32 %41 to double
  %43 = fdiv double %42, 1.100000e+03
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv119, i64 %indvars.iv18
  store double %43, double* %44, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv18, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %45, label %._crit_edge10

; <label>:45:                                     ; preds = %._crit_edge10
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv119, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next2, 800
  br i1 %exitcond1, label %46, label %.preheader

; <label>:46:                                     ; preds = %45
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_2mm(double, double, [900 x double]* nocapture, [1100 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1200 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
  br label %.preheader11

.preheader11:                                     ; preds = %25, %7
  %indvars.iv917 = phi i64 [ 0, %7 ], [ %indvars.iv.next10, %25 ]
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %24, %.preheader11
  %indvars.iv716 = phi i64 [ 0, %.preheader11 ], [ %indvars.iv.next8, %24 ]
  %8 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv917, i64 %indvars.iv716
  store double 0.000000e+00, double* %8, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge7
  %9 = phi double [ 0.000000e+00, %._crit_edge7 ], [ %23, %._crit_edge ]
  %indvars.iv515 = phi i64 [ 0, %._crit_edge7 ], [ %indvars.iv.next6.1, %._crit_edge ]
  %10 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv917, i64 %indvars.iv515
  %11 = load double, double* %10, align 8
  %12 = fmul double %11, %0
  %13 = getelementptr inbounds [900 x double], [900 x double]* %4, i64 %indvars.iv515, i64 %indvars.iv716
  %14 = load double, double* %13, align 8
  %15 = fmul double %12, %14
  %16 = fadd double %9, %15
  store double %16, double* %8, align 8
  %indvars.iv.next6 = or i64 %indvars.iv515, 1
  %17 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv917, i64 %indvars.iv.next6
  %18 = load double, double* %17, align 8
  %19 = fmul double %18, %0
  %20 = getelementptr inbounds [900 x double], [900 x double]* %4, i64 %indvars.iv.next6, i64 %indvars.iv716
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = fadd double %16, %22
  store double %23, double* %8, align 8
  %indvars.iv.next6.1 = add nuw nsw i64 %indvars.iv515, 2
  %exitcond3.1 = icmp eq i64 %indvars.iv.next6.1, 1100
  br i1 %exitcond3.1, label %24, label %._crit_edge

; <label>:24:                                     ; preds = %._crit_edge
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv716, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next8, 900
  br i1 %exitcond4, label %25, label %._crit_edge7

; <label>:25:                                     ; preds = %24
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv917, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next10, 800
  br i1 %exitcond5, label %.preheader.preheader, label %.preheader11

.preheader.preheader:                             ; preds = %25
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %49
  %indvars.iv314 = phi i64 [ %indvars.iv.next4, %49 ], [ 0, %.preheader.preheader ]
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %48, %.preheader
  %indvars.iv113 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next2, %48 ]
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv314, i64 %indvars.iv113
  %27 = load double, double* %26, align 8
  %28 = fmul double %27, %1
  store double %28, double* %26, align 8
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge8, %._crit_edge9
  %29 = phi double [ %28, %._crit_edge9 ], [ %47, %._crit_edge8 ]
  %indvars.iv12 = phi i64 [ 0, %._crit_edge9 ], [ %indvars.iv.next.2, %._crit_edge8 ]
  %30 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv314, i64 %indvars.iv12
  %31 = load double, double* %30, align 8
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv12, i64 %indvars.iv113
  %33 = load double, double* %32, align 8
  %34 = fmul double %31, %33
  %35 = fadd double %29, %34
  store double %35, double* %26, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv12, 1
  %36 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv314, i64 %indvars.iv.next
  %37 = load double, double* %36, align 8
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv.next, i64 %indvars.iv113
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = fadd double %35, %40
  store double %41, double* %26, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv12, 2
  %42 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv314, i64 %indvars.iv.next.1
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv.next.1, i64 %indvars.iv113
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = fadd double %41, %46
  store double %47, double* %26, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv12, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next.2, 900
  br i1 %exitcond.2, label %48, label %._crit_edge8

; <label>:48:                                     ; preds = %._crit_edge8
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv113, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next2, 1200
  br i1 %exitcond1, label %49, label %._crit_edge9

; <label>:49:                                     ; preds = %48
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv314, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next4, 800
  br i1 %exitcond2, label %50, label %.preheader

; <label>:50:                                     ; preds = %49
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader

.preheader:                                       ; preds = %17, %1
  %indvars.iv14 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %17 ]
  %6 = mul nuw nsw i64 %indvars.iv14, 800
  br label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge, %.preheader
  %indvars.iv3 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %indvars.iv3, %6
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge._crit_edge
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge._crit_edge, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv14, i64 %indvars.iv3
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv3, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %17, label %._crit_edge._crit_edge

; <label>:17:                                     ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next2, 800
  br i1 %exitcond1, label %18, label %.preheader

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
