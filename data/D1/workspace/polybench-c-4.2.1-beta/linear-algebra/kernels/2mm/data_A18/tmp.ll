; ModuleID = 'A.ll'
source_filename = "2mm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"D\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
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
  call void @init_array(double* nonnull %3, double* nonnull %4, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %13)
  tail call void (...) @polybench_timer_start() #4
  %14 = load double, double* %3, align 8
  %15 = load double, double* %4, align 8
  %16 = bitcast i8* %5 to [900 x double]*
  tail call void @kernel_2mm(double %14, double %15, [900 x double]* %16, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %13)
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
  tail call void @print_array([1200 x double]* %13)
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %2, %21
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  tail call void @free(i8* %8) #4
  tail call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(double* nocapture, double* nocapture, [1100 x double]* nocapture, [900 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) #2 {
.preheader13.preheader:
  store double 1.500000e+00, double* %0, align 8
  store double 1.200000e+00, double* %1, align 8
  br label %.preheader13

.preheader13:                                     ; preds = %._crit_edge26, %.preheader13.preheader
  %indvars.iv19 = phi i64 [ 0, %.preheader13.preheader ], [ %indvars.iv.next20, %._crit_edge26 ]
  br label %._crit_edge23

._crit_edge23:                                    ; preds = %._crit_edge23, %.preheader13
  %indvars.iv16 = phi i64 [ 0, %.preheader13 ], [ %indvars.iv.next17, %._crit_edge23 ]
  %6 = mul nuw nsw i64 %indvars.iv16, %indvars.iv19
  %7 = add nuw nsw i64 %6, 1
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 800
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 8.000000e+02
  %12 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv19, i64 %indvars.iv16
  store double %11, double* %12, align 8
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 1100
  br i1 %exitcond18, label %._crit_edge26, label %._crit_edge23

._crit_edge26:                                    ; preds = %._crit_edge23
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next20, 800
  br i1 %exitcond21, label %.preheader11.preheader, label %.preheader13

.preheader11.preheader:                           ; preds = %._crit_edge26
  br label %.preheader11

.preheader11:                                     ; preds = %.preheader11.preheader, %._crit_edge22
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %._crit_edge22 ], [ 0, %.preheader11.preheader ]
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge24, %.preheader11
  %indvars.iv10 = phi i64 [ 0, %.preheader11 ], [ %indvars.iv.next11.1, %._crit_edge24 ]
  %indvars.iv.next11 = or i64 %indvars.iv10, 1
  %13 = mul nuw nsw i64 %indvars.iv.next11, %indvars.iv13
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 900
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 9.000000e+02
  %18 = getelementptr inbounds [900 x double], [900 x double]* %3, i64 %indvars.iv13, i64 %indvars.iv10
  store double %17, double* %18, align 8
  %indvars.iv.next11.1 = add nuw nsw i64 %indvars.iv10, 2
  %19 = mul nuw nsw i64 %indvars.iv.next11.1, %indvars.iv13
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 900
  %22 = sitofp i32 %21 to double
  %23 = fdiv double %22, 9.000000e+02
  %24 = getelementptr inbounds [900 x double], [900 x double]* %3, i64 %indvars.iv13, i64 %indvars.iv.next11
  store double %23, double* %24, align 8
  %exitcond12.1 = icmp eq i64 %indvars.iv.next11.1, 900
  br i1 %exitcond12.1, label %._crit_edge22, label %._crit_edge24

._crit_edge22:                                    ; preds = %._crit_edge24
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 1100
  br i1 %exitcond15, label %.preheader9.preheader, label %.preheader11

.preheader9.preheader:                            ; preds = %._crit_edge22
  br label %.preheader9

.preheader9:                                      ; preds = %.preheader9.preheader, %._crit_edge18
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %._crit_edge18 ], [ 0, %.preheader9.preheader ]
  br label %._crit_edge25

._crit_edge25:                                    ; preds = %._crit_edge25, %.preheader9
  %indvars.iv4 = phi i64 [ 0, %.preheader9 ], [ %indvars.iv.next5, %._crit_edge25 ]
  %25 = add nuw nsw i64 %indvars.iv4, 3
  %26 = mul nuw nsw i64 %25, %indvars.iv7
  %27 = add nuw nsw i64 %26, 1
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, 1200
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, 1.200000e+03
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv7, i64 %indvars.iv4
  store double %31, double* %32, align 8
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1200
  br i1 %exitcond6, label %._crit_edge18, label %._crit_edge25

._crit_edge18:                                    ; preds = %._crit_edge25
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 900
  br i1 %exitcond9, label %.preheader.preheader, label %.preheader9

.preheader.preheader:                             ; preds = %._crit_edge18
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge ], [ 0, %.preheader.preheader ]
  br label %._crit_edge27

._crit_edge27:                                    ; preds = %._crit_edge27, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge27 ]
  %33 = add nuw nsw i64 %indvars.iv, 2
  %34 = mul nuw nsw i64 %33, %indvars.iv1
  %35 = trunc i64 %34 to i32
  %36 = srem i32 %35, 1100
  %37 = sitofp i32 %36 to double
  %38 = fdiv double %37, 1.100000e+03
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv1, i64 %indvars.iv
  store double %38, double* %39, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge, label %._crit_edge27

._crit_edge:                                      ; preds = %._crit_edge27
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 800
  br i1 %exitcond3, label %._crit_edge16, label %.preheader

._crit_edge16:                                    ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_2mm(double, double, [900 x double]*, [1100 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1200 x double]*, [1200 x double]* nocapture) #2 {
.preheader7.lr.ph:
  br label %.preheader7

.preheader7:                                      ; preds = %._crit_edge16, %.preheader7.lr.ph
  %indvars.iv13 = phi i64 [ 0, %.preheader7.lr.ph ], [ %indvars.iv.next14, %._crit_edge16 ]
  br label %.lr.ph13

.lr.ph13:                                         ; preds = %._crit_edge14, %.preheader7
  %indvars.iv9 = phi i64 [ 0, %.preheader7 ], [ %indvars.iv.next10, %._crit_edge14 ]
  %7 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv13, i64 %indvars.iv9
  store double 0.000000e+00, double* %7, align 8
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17, %.lr.ph13
  %indvars.iv6 = phi i64 [ 0, %.lr.ph13 ], [ %indvars.iv.next7.1, %._crit_edge17 ]
  %8 = phi double [ 0.000000e+00, %.lr.ph13 ], [ %22, %._crit_edge17 ]
  %9 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv13, i64 %indvars.iv6
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, %0
  %12 = getelementptr inbounds [900 x double], [900 x double]* %4, i64 %indvars.iv6, i64 %indvars.iv9
  %13 = load double, double* %12, align 8
  %14 = fmul double %11, %13
  %15 = fadd double %14, %8
  store double %15, double* %7, align 8
  %indvars.iv.next7 = or i64 %indvars.iv6, 1
  %16 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv13, i64 %indvars.iv.next7
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, %0
  %19 = getelementptr inbounds [900 x double], [900 x double]* %4, i64 %indvars.iv.next7, i64 %indvars.iv9
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fadd double %21, %15
  store double %22, double* %7, align 8
  %indvars.iv.next7.1 = add nuw nsw i64 %indvars.iv6, 2
  %exitcond8.1 = icmp eq i64 %indvars.iv.next7.1, 1100
  br i1 %exitcond8.1, label %._crit_edge14, label %._crit_edge17

._crit_edge14:                                    ; preds = %._crit_edge17
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next10, 900
  br i1 %exitcond11, label %._crit_edge16, label %.lr.ph13

._crit_edge16:                                    ; preds = %._crit_edge14
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 800
  br i1 %exitcond15, label %.preheader.preheader, label %.preheader7

.preheader.preheader:                             ; preds = %._crit_edge16
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge9
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %._crit_edge9 ], [ 0, %.preheader.preheader ]
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.preheader
  %indvars.iv1 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next2, %._crit_edge ]
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv3, i64 %indvars.iv1
  %24 = load double, double* %23, align 8
  %25 = fmul double %24, %1
  store double %25, double* %23, align 8
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge18, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.2, %._crit_edge18 ]
  %26 = phi double [ %25, %.lr.ph ], [ %44, %._crit_edge18 ]
  %27 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv3, i64 %indvars.iv
  %28 = load double, double* %27, align 8
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv, i64 %indvars.iv1
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = fadd double %31, %26
  store double %32, double* %23, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %33 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv3, i64 %indvars.iv.next
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv.next, i64 %indvars.iv1
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = fadd double %37, %32
  store double %38, double* %23, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %39 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv3, i64 %indvars.iv.next.1
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv.next.1, i64 %indvars.iv1
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fadd double %43, %38
  store double %44, double* %23, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next.2, 900
  br i1 %exitcond.2, label %._crit_edge, label %._crit_edge18

._crit_edge:                                      ; preds = %._crit_edge18
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next2, 1200
  br i1 %exitcond, label %._crit_edge9, label %.lr.ph

._crit_edge9:                                     ; preds = %._crit_edge
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 800
  br i1 %exitcond5, label %._crit_edge11, label %.preheader

._crit_edge11:                                    ; preds = %._crit_edge9
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]* nocapture readonly) #0 {
.preheader.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv1 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next2, %._crit_edge ]
  %5 = mul nuw nsw i64 %indvars.iv1, 800
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge5, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge5 ]
  %6 = add nuw nsw i64 %5, %indvars.iv
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge5

; <label>:10:                                     ; preds = %._crit_edge6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge6, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge, label %._crit_edge6

._crit_edge:                                      ; preds = %._crit_edge5
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 800
  br i1 %exitcond3, label %._crit_edge4, label %.preheader

._crit_edge4:                                     ; preds = %._crit_edge
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
