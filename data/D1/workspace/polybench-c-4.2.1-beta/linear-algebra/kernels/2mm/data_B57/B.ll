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
define i32 @main(i32, i8**) #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 720000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 880000, i32 8) #3
  %7 = tail call i8* @polybench_alloc_data(i64 990000, i32 8) #3
  %8 = tail call i8* @polybench_alloc_data(i64 1080000, i32 8) #3
  %9 = tail call i8* @polybench_alloc_data(i64 960000, i32 8) #3
  %10 = bitcast i8* %6 to [1100 x double]*
  %11 = bitcast i8* %7 to [900 x double]*
  %12 = bitcast i8* %8 to [1200 x double]*
  %13 = bitcast i8* %9 to [1200 x double]*
  call void @init_array(double* nonnull %3, double* nonnull %4, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %13)
  call void (...) @polybench_timer_start() #3
  %14 = load double, double* %3, align 8
  %15 = load double, double* %4, align 8
  %16 = bitcast i8* %5 to [900 x double]*
  call void @kernel_2mm(double %14, double %15, [900 x double]* %16, [1100 x double]* %10, [900 x double]* %11, [1200 x double]* %12, [1200 x double]* %13)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %17 = icmp sgt i32 %0, 42
  br i1 %17, label %18, label %._crit_edge

; <label>:18:                                     ; preds = %2
  %19 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %19, align 1
  %20 = icmp eq i8 %strcmpload, 0
  br i1 %20, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %18
  %22 = bitcast i8* %9 to [1200 x double]*
  call void @print_array([1200 x double]* %22)
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %2, %21
  call void @free(i8* %5) #3
  call void @free(i8* %6) #3
  call void @free(i8* %7) #3
  call void @free(i8* %8) #3
  call void @free(i8* %9) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(double*, double*, [1100 x double]*, [900 x double]*, [1200 x double]*, [1200 x double]*) #0 {
.preheader6.lr.ph:
  store double 1.500000e+00, double* %0, align 8
  store double 1.200000e+00, double* %1, align 8
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %._crit_edge13.us, %.preheader6.lr.ph
  %indvars.iv42 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next43, %._crit_edge13.us ]
  br label %6

; <label>:6:                                      ; preds = %6, %.preheader6.us
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %6 ], [ 0, %.preheader6.us ]
  %7 = mul nuw nsw i64 %indvars.iv38, %indvars.iv42
  %8 = add nuw nsw i64 %7, 1
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 800
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 8.000000e+02
  %13 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv42, i64 %indvars.iv38
  store double %12, double* %13, align 8
  %exitcond41 = icmp eq i64 %indvars.iv38, 1099
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  br i1 %exitcond41, label %._crit_edge13.us, label %6

._crit_edge13.us:                                 ; preds = %6
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next43, 800
  br i1 %exitcond4, label %.preheader4.us.preheader, label %.preheader6.us

.preheader4.us.preheader:                         ; preds = %._crit_edge13.us
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge11.us, %.preheader4.us.preheader
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %._crit_edge11.us ], [ 0, %.preheader4.us.preheader ]
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge18, %.preheader4.us
  %indvars.iv31 = phi i64 [ 0, %.preheader4.us ], [ %indvars.iv.next32.1, %._crit_edge18 ]
  %indvars.iv.next32 = or i64 %indvars.iv31, 1
  %14 = mul nuw nsw i64 %indvars.iv.next32, %indvars.iv35
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 900
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 9.000000e+02
  %19 = getelementptr inbounds [900 x double], [900 x double]* %3, i64 %indvars.iv35, i64 %indvars.iv31
  store double %18, double* %19, align 8
  %indvars.iv.next32.1 = add nsw i64 %indvars.iv31, 2
  %20 = mul nuw nsw i64 %indvars.iv.next32.1, %indvars.iv35
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, 900
  %23 = sitofp i32 %22 to double
  %24 = fdiv double %23, 9.000000e+02
  %25 = getelementptr inbounds [900 x double], [900 x double]* %3, i64 %indvars.iv35, i64 %indvars.iv.next32
  store double %24, double* %25, align 8
  %exitcond34.1 = icmp eq i64 %indvars.iv.next32, 899
  br i1 %exitcond34.1, label %._crit_edge11.us, label %._crit_edge18

._crit_edge11.us:                                 ; preds = %._crit_edge18
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next36, 1100
  br i1 %exitcond3, label %.preheader2.us.preheader, label %.preheader4.us

.preheader2.us.preheader:                         ; preds = %._crit_edge11.us
  br label %.preheader2.us

.preheader2.us:                                   ; preds = %._crit_edge9.us, %.preheader2.us.preheader
  %indvars.iv28 = phi i64 [ %indvars.iv.next29, %._crit_edge9.us ], [ 0, %.preheader2.us.preheader ]
  br label %26

; <label>:26:                                     ; preds = %26, %.preheader2.us
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %26 ], [ 0, %.preheader2.us ]
  %27 = add nuw nsw i64 %indvars.iv24, 3
  %28 = mul nuw nsw i64 %27, %indvars.iv28
  %29 = add nuw nsw i64 %28, 1
  %30 = trunc i64 %29 to i32
  %31 = srem i32 %30, 1200
  %32 = sitofp i32 %31 to double
  %33 = fdiv double %32, 1.200000e+03
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv28, i64 %indvars.iv24
  store double %33, double* %34, align 8
  %exitcond27 = icmp eq i64 %indvars.iv24, 1199
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  br i1 %exitcond27, label %._crit_edge9.us, label %26

._crit_edge9.us:                                  ; preds = %26
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next29, 900
  br i1 %exitcond2, label %.preheader.us.preheader, label %.preheader2.us

.preheader.us.preheader:                          ; preds = %._crit_edge9.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  br label %35

; <label>:35:                                     ; preds = %35, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %35 ], [ 0, %.preheader.us ]
  %36 = add nuw nsw i64 %indvars.iv, 2
  %37 = mul nuw nsw i64 %36, %indvars.iv21
  %38 = trunc i64 %37 to i32
  %39 = srem i32 %38, 1100
  %40 = sitofp i32 %39 to double
  %41 = fdiv double %40, 1.100000e+03
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv21, i64 %indvars.iv
  store double %41, double* %42, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1199
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %._crit_edge.us, label %35

._crit_edge.us:                                   ; preds = %35
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next22, 800
  br i1 %exitcond1, label %._crit_edge7, label %.preheader.us

._crit_edge7:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_2mm(double, double, [900 x double]*, [1100 x double]*, [900 x double]*, [1200 x double]*, [1200 x double]*) #0 {
.preheader6.lr.ph:
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %._crit_edge18.us, %.preheader6.lr.ph
  %indvars.iv47 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next48, %._crit_edge18.us ]
  br label %.lr.ph15.us.us

._crit_edge18.us:                                 ; preds = %._crit_edge16.us.us
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv47, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next48, 800
  br i1 %exitcond3, label %.preheader.us.preheader, label %.preheader6.us

.preheader.us.preheader:                          ; preds = %._crit_edge18.us
  br label %.preheader.us

.lr.ph15.us.us:                                   ; preds = %._crit_edge16.us.us, %.preheader6.us
  %indvars.iv45 = phi i64 [ %indvars.iv.next46, %._crit_edge16.us.us ], [ 0, %.preheader6.us ]
  %7 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv47, i64 %indvars.iv45
  store double 0.000000e+00, double* %7, align 8
  br label %8

._crit_edge16.us.us:                              ; preds = %8
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next46, 900
  br i1 %exitcond2, label %._crit_edge18.us, label %.lr.ph15.us.us

; <label>:8:                                      ; preds = %8, %.lr.ph15.us.us
  %indvars.iv41 = phi i64 [ 0, %.lr.ph15.us.us ], [ %indvars.iv.next42.1, %8 ]
  %9 = phi double [ 0.000000e+00, %.lr.ph15.us.us ], [ %23, %8 ]
  %10 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv47, i64 %indvars.iv41
  %11 = load double, double* %10, align 8
  %12 = fmul double %11, %0
  %13 = getelementptr inbounds [900 x double], [900 x double]* %4, i64 %indvars.iv41, i64 %indvars.iv45
  %14 = load double, double* %13, align 8
  %15 = fmul double %12, %14
  %16 = fadd double %9, %15
  store double %16, double* %7, align 8
  %indvars.iv.next42 = or i64 %indvars.iv41, 1
  %17 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv47, i64 %indvars.iv.next42
  %18 = load double, double* %17, align 8
  %19 = fmul double %18, %0
  %20 = getelementptr inbounds [900 x double], [900 x double]* %4, i64 %indvars.iv.next42, i64 %indvars.iv45
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = fadd double %16, %22
  store double %23, double* %7, align 8
  %exitcond44.1 = icmp eq i64 %indvars.iv.next42, 1099
  %indvars.iv.next42.1 = add nsw i64 %indvars.iv41, 2
  br i1 %exitcond44.1, label %._crit_edge16.us.us, label %8

.preheader.us:                                    ; preds = %._crit_edge8.us, %.preheader.us.preheader
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %._crit_edge8.us ], [ 0, %.preheader.us.preheader ]
  br label %.lr.ph.us.us

._crit_edge8.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next35, 800
  br i1 %exitcond1, label %._crit_edge9, label %.preheader.us

.lr.ph.us.us:                                     ; preds = %._crit_edge.us.us, %.preheader.us
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %._crit_edge.us.us ], [ 0, %.preheader.us ]
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv34, i64 %indvars.iv32
  %25 = load double, double* %24, align 8
  %26 = fmul double %25, %1
  store double %26, double* %24, align 8
  br label %27

._crit_edge.us.us:                                ; preds = %27
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond = icmp eq i64 %indvars.iv.next33, 1200
  br i1 %exitcond, label %._crit_edge8.us, label %.lr.ph.us.us

; <label>:27:                                     ; preds = %27, %.lr.ph.us.us
  %indvars.iv28 = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next29.2, %27 ]
  %28 = phi double [ %26, %.lr.ph.us.us ], [ %46, %27 ]
  %29 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv34, i64 %indvars.iv28
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv28, i64 %indvars.iv32
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fadd double %28, %33
  store double %34, double* %24, align 8
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %35 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv34, i64 %indvars.iv.next29
  %36 = load double, double* %35, align 8
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv.next29, i64 %indvars.iv32
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = fadd double %34, %39
  store double %40, double* %24, align 8
  %indvars.iv.next29.1 = add nsw i64 %indvars.iv28, 2
  %41 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv34, i64 %indvars.iv.next29.1
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv.next29.1, i64 %indvars.iv32
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = fadd double %40, %45
  store double %46, double* %24, align 8
  %exitcond31.2 = icmp eq i64 %indvars.iv.next29.1, 899
  %indvars.iv.next29.2 = add nsw i64 %indvars.iv28, 3
  br i1 %exitcond31.2, label %._crit_edge.us.us, label %27

._crit_edge9:                                     ; preds = %._crit_edge8.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]*) #0 {
.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #4
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv4 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next5, %._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv4, 800
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %6 = add nuw nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge3
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge3, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge3

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next5, 800
  br i1 %exitcond1, label %._crit_edge1, label %.preheader.us

._crit_edge1:                                     ; preds = %._crit_edge.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
