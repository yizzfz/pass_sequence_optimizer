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
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %14, %6
  %indvars.iv19 = phi i64 [ 0, %6 ], [ %indvars.iv.next20, %14 ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge24
  %indvars.iv16 = phi i64 [ 0, %._crit_edge24 ], [ %indvars.iv.next17, %._crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv16, %indvars.iv19
  %8 = add nuw nsw i64 %7, 1
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 800
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 8.000000e+02
  %13 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv19, i64 %indvars.iv16
  store double %12, double* %13, align 8
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 1100
  br i1 %exitcond18, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %._crit_edge
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next20, 800
  br i1 %exitcond21, label %.preheader23.preheader, label %._crit_edge24

.preheader23.preheader:                           ; preds = %14
  br label %.preheader23

.preheader23:                                     ; preds = %.preheader23.preheader, %27
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %27 ], [ 0, %.preheader23.preheader ]
  br label %._crit_edge25

._crit_edge25:                                    ; preds = %._crit_edge25, %.preheader23
  %indvars.iv10 = phi i64 [ 0, %.preheader23 ], [ %indvars.iv.next11.1, %._crit_edge25 ]
  %indvars.iv.next11 = or i64 %indvars.iv10, 1
  %15 = mul nuw nsw i64 %indvars.iv.next11, %indvars.iv13
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 900
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, 9.000000e+02
  %20 = getelementptr inbounds [900 x double], [900 x double]* %3, i64 %indvars.iv13, i64 %indvars.iv10
  store double %19, double* %20, align 8
  %indvars.iv.next11.1 = add nuw nsw i64 %indvars.iv10, 2
  %21 = mul nuw nsw i64 %indvars.iv.next11.1, %indvars.iv13
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 900
  %24 = sitofp i32 %23 to double
  %25 = fdiv double %24, 9.000000e+02
  %26 = getelementptr inbounds [900 x double], [900 x double]* %3, i64 %indvars.iv13, i64 %indvars.iv.next11
  store double %25, double* %26, align 8
  %exitcond12.1 = icmp eq i64 %indvars.iv.next11.1, 900
  br i1 %exitcond12.1, label %27, label %._crit_edge25

; <label>:27:                                     ; preds = %._crit_edge25
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 1100
  br i1 %exitcond15, label %.preheader22.preheader, label %.preheader23

.preheader22.preheader:                           ; preds = %27
  br label %.preheader22

.preheader22:                                     ; preds = %.preheader22.preheader, %36
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %36 ], [ 0, %.preheader22.preheader ]
  br label %._crit_edge26

._crit_edge26:                                    ; preds = %._crit_edge26, %.preheader22
  %indvars.iv4 = phi i64 [ 0, %.preheader22 ], [ %indvars.iv.next5, %._crit_edge26 ]
  %28 = add nuw nsw i64 %indvars.iv4, 3
  %29 = mul nuw nsw i64 %28, %indvars.iv7
  %30 = add nuw nsw i64 %29, 1
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, 1200
  %33 = sitofp i32 %32 to double
  %34 = fdiv double %33, 1.200000e+03
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv7, i64 %indvars.iv4
  store double %34, double* %35, align 8
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1200
  br i1 %exitcond6, label %36, label %._crit_edge26

; <label>:36:                                     ; preds = %._crit_edge26
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 900
  br i1 %exitcond9, label %.preheader.preheader, label %.preheader22

.preheader.preheader:                             ; preds = %36
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %44
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %44 ], [ 0, %.preheader.preheader ]
  br label %._crit_edge27

._crit_edge27:                                    ; preds = %._crit_edge27, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge27 ]
  %37 = add nuw nsw i64 %indvars.iv, 2
  %38 = mul nuw nsw i64 %37, %indvars.iv1
  %39 = trunc i64 %38 to i32
  %40 = srem i32 %39, 1100
  %41 = sitofp i32 %40 to double
  %42 = fdiv double %41, 1.100000e+03
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv1, i64 %indvars.iv
  store double %42, double* %43, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %44, label %._crit_edge27

; <label>:44:                                     ; preds = %._crit_edge27
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 800
  br i1 %exitcond3, label %45, label %.preheader

; <label>:45:                                     ; preds = %44
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_2mm(double, double, [900 x double]* nocapture, [1100 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1200 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %25, %7
  %indvars.iv13 = phi i64 [ 0, %7 ], [ %indvars.iv.next14, %25 ]
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %24, %._crit_edge18
  %indvars.iv10 = phi i64 [ 0, %._crit_edge18 ], [ %indvars.iv.next11, %24 ]
  %8 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv13, i64 %indvars.iv10
  store double 0.000000e+00, double* %8, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge17
  %indvars.iv7 = phi i64 [ 0, %._crit_edge17 ], [ %indvars.iv.next8.1, %._crit_edge ]
  %9 = phi double [ 0.000000e+00, %._crit_edge17 ], [ %23, %._crit_edge ]
  %10 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv13, i64 %indvars.iv7
  %11 = load double, double* %10, align 8
  %12 = fmul double %11, %0
  %13 = getelementptr inbounds [900 x double], [900 x double]* %4, i64 %indvars.iv7, i64 %indvars.iv10
  %14 = load double, double* %13, align 8
  %15 = fmul double %12, %14
  %16 = fadd double %15, %9
  store double %16, double* %8, align 8
  %indvars.iv.next8 = or i64 %indvars.iv7, 1
  %17 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv13, i64 %indvars.iv.next8
  %18 = load double, double* %17, align 8
  %19 = fmul double %18, %0
  %20 = getelementptr inbounds [900 x double], [900 x double]* %4, i64 %indvars.iv.next8, i64 %indvars.iv10
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = fadd double %22, %16
  store double %23, double* %8, align 8
  %indvars.iv.next8.1 = add nuw nsw i64 %indvars.iv7, 2
  %exitcond9.1 = icmp eq i64 %indvars.iv.next8.1, 1100
  br i1 %exitcond9.1, label %24, label %._crit_edge

; <label>:24:                                     ; preds = %._crit_edge
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 900
  br i1 %exitcond12, label %25, label %._crit_edge17

; <label>:25:                                     ; preds = %24
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 800
  br i1 %exitcond15, label %._crit_edge21.preheader, label %._crit_edge18

._crit_edge21.preheader:                          ; preds = %25
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21.preheader, %49
  %indvars.iv4 = phi i64 [ %indvars.iv.next5, %49 ], [ 0, %._crit_edge21.preheader ]
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %48, %._crit_edge21
  %indvars.iv1 = phi i64 [ 0, %._crit_edge21 ], [ %indvars.iv.next2, %48 ]
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv4, i64 %indvars.iv1
  %27 = load double, double* %26, align 8
  %28 = fmul double %27, %1
  store double %28, double* %26, align 8
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19, %._crit_edge20
  %indvars.iv = phi i64 [ 0, %._crit_edge20 ], [ %indvars.iv.next.2, %._crit_edge19 ]
  %29 = phi double [ %28, %._crit_edge20 ], [ %47, %._crit_edge19 ]
  %30 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv4, i64 %indvars.iv
  %31 = load double, double* %30, align 8
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv, i64 %indvars.iv1
  %33 = load double, double* %32, align 8
  %34 = fmul double %31, %33
  %35 = fadd double %34, %29
  store double %35, double* %26, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %36 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv4, i64 %indvars.iv.next
  %37 = load double, double* %36, align 8
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv.next, i64 %indvars.iv1
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = fadd double %40, %35
  store double %41, double* %26, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %42 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv4, i64 %indvars.iv.next.1
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv.next.1, i64 %indvars.iv1
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = fadd double %46, %41
  store double %47, double* %26, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next.2, 900
  br i1 %exitcond.2, label %48, label %._crit_edge19

; <label>:48:                                     ; preds = %._crit_edge19
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1200
  br i1 %exitcond3, label %49, label %._crit_edge20

; <label>:49:                                     ; preds = %48
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 800
  br i1 %exitcond6, label %50, label %._crit_edge21

; <label>:50:                                     ; preds = %49
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
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %17, %1
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %17 ]
  %6 = mul nuw nsw i64 %indvars.iv1, 800
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge, %._crit_edge5
  %indvars.iv = phi i64 [ 0, %._crit_edge5 ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %6, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge4
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge4, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %17, label %._crit_edge4

; <label>:17:                                     ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 800
  br i1 %exitcond3, label %18, label %._crit_edge5

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
