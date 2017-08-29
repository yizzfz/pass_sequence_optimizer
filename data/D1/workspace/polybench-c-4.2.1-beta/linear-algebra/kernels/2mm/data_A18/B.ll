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
  call void (...) @polybench_timer_start() #4
  %14 = load double, double* %3, align 8
  %15 = load double, double* %4, align 8
  %16 = bitcast i8* %5 to [900 x double]*
  %17 = bitcast i8* %6 to [1100 x double]*
  %18 = bitcast i8* %7 to [900 x double]*
  %19 = bitcast i8* %8 to [1200 x double]*
  %20 = bitcast i8* %9 to [1200 x double]*
  call fastcc void @kernel_2mm(double %14, double %15, [900 x double]* %16, [1100 x double]* %17, [900 x double]* %18, [1200 x double]* %19, [1200 x double]* %20)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %21 = icmp sgt i32 %0, 42
  br i1 %21, label %22, label %._crit_edge

; <label>:22:                                     ; preds = %2
  %23 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %23, align 1
  %24 = icmp eq i8 %strcmpload, 0
  br i1 %24, label %25, label %._crit_edge

; <label>:25:                                     ; preds = %22
  %26 = bitcast i8* %9 to [1200 x double]*
  call fastcc void @print_array([1200 x double]* %26)
  br label %._crit_edge

._crit_edge:                                      ; preds = %22, %2, %25
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
  br label %.preheader58

.preheader58:                                     ; preds = %15, %6
  %indvars.iv27 = phi i64 [ 0, %6 ], [ %indvars.iv.next28, %15 ]
  br label %7

; <label>:7:                                      ; preds = %7, %.preheader58
  %indvars.iv24 = phi i64 [ 0, %.preheader58 ], [ %indvars.iv.next25, %7 ]
  %8 = mul nuw nsw i64 %indvars.iv24, %indvars.iv27
  %9 = add nuw nsw i64 %8, 1
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 800
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %12, 8.000000e+02
  %14 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv27, i64 %indvars.iv24
  store double %13, double* %14, align 8
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next25, 1100
  br i1 %exitcond26, label %15, label %7

; <label>:15:                                     ; preds = %7
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next28, 800
  br i1 %exitcond29, label %.preheader56.preheader, label %.preheader58

.preheader56.preheader:                           ; preds = %15
  br label %.preheader56

.preheader56:                                     ; preds = %.preheader56.preheader, %30
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %30 ], [ 0, %.preheader56.preheader ]
  br label %16

; <label>:16:                                     ; preds = %16, %.preheader56
  %indvars.iv18 = phi i64 [ 0, %.preheader56 ], [ %indvars.iv.next19.1, %16 ]
  %indvars.iv.next19 = or i64 %indvars.iv18, 1
  %17 = mul nuw nsw i64 %indvars.iv.next19, %indvars.iv21
  %18 = trunc i64 %17 to i32
  %19 = srem i32 %18, 900
  %20 = sitofp i32 %19 to double
  %21 = getelementptr inbounds [900 x double], [900 x double]* %3, i64 %indvars.iv21, i64 %indvars.iv18
  %indvars.iv.next19.1 = add nuw nsw i64 %indvars.iv18, 2
  %22 = mul nuw nsw i64 %indvars.iv.next19.1, %indvars.iv21
  %23 = trunc i64 %22 to i32
  %24 = srem i32 %23, 900
  %25 = sitofp i32 %24 to double
  %26 = insertelement <2 x double> undef, double %20, i32 0
  %27 = insertelement <2 x double> %26, double %25, i32 1
  %28 = fdiv <2 x double> %27, <double 9.000000e+02, double 9.000000e+02>
  %29 = bitcast double* %21 to <2 x double>*
  store <2 x double> %28, <2 x double>* %29, align 8
  %exitcond20.1 = icmp eq i64 %indvars.iv.next19.1, 900
  br i1 %exitcond20.1, label %30, label %16

; <label>:30:                                     ; preds = %16
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next22, 1100
  br i1 %exitcond23, label %.preheader54.preheader, label %.preheader56

.preheader54.preheader:                           ; preds = %30
  br label %.preheader54

.preheader54:                                     ; preds = %.preheader54.preheader, %40
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %40 ], [ 0, %.preheader54.preheader ]
  br label %31

; <label>:31:                                     ; preds = %31, %.preheader54
  %indvars.iv12 = phi i64 [ 0, %.preheader54 ], [ %indvars.iv.next13, %31 ]
  %32 = add nuw nsw i64 %indvars.iv12, 3
  %33 = mul nuw nsw i64 %32, %indvars.iv15
  %34 = add nuw nsw i64 %33, 1
  %35 = trunc i64 %34 to i32
  %36 = srem i32 %35, 1200
  %37 = sitofp i32 %36 to double
  %38 = fdiv double %37, 1.200000e+03
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv15, i64 %indvars.iv12
  store double %38, double* %39, align 8
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next13, 1200
  br i1 %exitcond14, label %40, label %31

; <label>:40:                                     ; preds = %31
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 900
  br i1 %exitcond17, label %.preheader.preheader, label %.preheader54

.preheader.preheader:                             ; preds = %40
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %49
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %49 ], [ 0, %.preheader.preheader ]
  br label %41

; <label>:41:                                     ; preds = %41, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %41 ]
  %42 = add nuw nsw i64 %indvars.iv, 2
  %43 = mul nuw nsw i64 %42, %indvars.iv9
  %44 = trunc i64 %43 to i32
  %45 = srem i32 %44, 1100
  %46 = sitofp i32 %45 to double
  %47 = fdiv double %46, 1.100000e+03
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv9, i64 %indvars.iv
  store double %47, double* %48, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %49, label %41

; <label>:49:                                     ; preds = %41
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next10, 800
  br i1 %exitcond11, label %50, label %.preheader

; <label>:50:                                     ; preds = %49
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_2mm(double, double, [900 x double]* nocapture, [1100 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1200 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
  br label %.preheader48

.preheader48:                                     ; preds = %29, %7
  %indvars.iv19 = phi i64 [ 0, %7 ], [ %indvars.iv.next20, %29 ]
  br label %8

; <label>:8:                                      ; preds = %28, %.preheader48
  %indvars.iv15 = phi i64 [ 0, %.preheader48 ], [ %indvars.iv.next16, %28 ]
  %9 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv19, i64 %indvars.iv15
  store double 0.000000e+00, double* %9, align 8
  %10 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv19, i64 %indvars.iv15
  br label %11

; <label>:11:                                     ; preds = %11, %8
  %indvars.iv12 = phi i64 [ 0, %8 ], [ %indvars.iv.next13.1, %11 ]
  %12 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv19, i64 %indvars.iv12
  %13 = load double, double* %12, align 8
  %14 = fmul double %13, %0
  %15 = getelementptr inbounds [900 x double], [900 x double]* %4, i64 %indvars.iv12, i64 %indvars.iv15
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = load double, double* %10, align 8
  %19 = fadd double %18, %17
  store double %19, double* %10, align 8
  %indvars.iv.next13 = or i64 %indvars.iv12, 1
  %20 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv19, i64 %indvars.iv.next13
  %21 = load double, double* %20, align 8
  %22 = fmul double %21, %0
  %23 = getelementptr inbounds [900 x double], [900 x double]* %4, i64 %indvars.iv.next13, i64 %indvars.iv15
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = load double, double* %10, align 8
  %27 = fadd double %26, %25
  store double %27, double* %10, align 8
  %indvars.iv.next13.1 = add nuw nsw i64 %indvars.iv12, 2
  %exitcond14.1 = icmp eq i64 %indvars.iv.next13.1, 1100
  br i1 %exitcond14.1, label %28, label %11

; <label>:28:                                     ; preds = %11
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 900
  br i1 %exitcond17, label %29, label %8

; <label>:29:                                     ; preds = %28
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next20, 800
  br i1 %exitcond21, label %.preheader.preheader, label %.preheader48

.preheader.preheader:                             ; preds = %29
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %51
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %51 ], [ 0, %.preheader.preheader ]
  br label %30

; <label>:30:                                     ; preds = %50, %.preheader
  %indvars.iv7 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next8, %50 ]
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv9, i64 %indvars.iv7
  %32 = load double, double* %31, align 8
  %33 = fmul double %32, %1
  store double %33, double* %31, align 8
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv9, i64 %indvars.iv7
  br label %35

; <label>:35:                                     ; preds = %35, %30
  %indvars.iv = phi i64 [ 0, %30 ], [ %indvars.iv.next.1, %35 ]
  %36 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv9, i64 %indvars.iv
  %37 = load double, double* %36, align 8
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv, i64 %indvars.iv7
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = load double, double* %34, align 8
  %42 = fadd double %41, %40
  store double %42, double* %34, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %43 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv9, i64 %indvars.iv.next
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv.next, i64 %indvars.iv7
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = load double, double* %34, align 8
  %49 = fadd double %48, %47
  store double %49, double* %34, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 900
  br i1 %exitcond.1, label %50, label %35

; <label>:50:                                     ; preds = %35
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond = icmp eq i64 %indvars.iv.next8, 1200
  br i1 %exitcond, label %51, label %30

; <label>:51:                                     ; preds = %50
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next10, 800
  br i1 %exitcond11, label %52, label %.preheader

; <label>:52:                                     ; preds = %51
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

.preheader:                                       ; preds = %18, %1
  %indvars.iv3 = phi i64 [ 0, %1 ], [ %indvars.iv.next4, %18 ]
  %6 = mul nuw nsw i64 %indvars.iv3, 800
  br label %7

; <label>:7:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %8 = add nuw nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %7, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %18, label %7

; <label>:18:                                     ; preds = %._crit_edge
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 800
  br i1 %exitcond5, label %19, label %.preheader

; <label>:19:                                     ; preds = %18
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
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
