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
  call fastcc void @print_array([1200 x double]* %13)
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
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %15, %6
  %indvars.iv30 = phi i64 [ 0, %6 ], [ %indvars.iv.next31, %15 ]
  br label %7

; <label>:7:                                      ; preds = %._crit_edge, %._crit_edge8
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %._crit_edge ], [ 0, %._crit_edge8 ]
  %8 = mul nuw nsw i64 %indvars.iv27, %indvars.iv30
  %9 = add nuw nsw i64 %8, 1
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 800
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %12, 8.000000e+02
  %14 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv30, i64 %indvars.iv27
  store double %13, double* %14, align 8
  %exitcond29 = icmp eq i64 %indvars.iv27, 1099
  br i1 %exitcond29, label %15, label %._crit_edge

._crit_edge:                                      ; preds = %7
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  br label %7

; <label>:15:                                     ; preds = %7
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next31, 800
  br i1 %exitcond35, label %._crit_edge10.preheader, label %._crit_edge8

._crit_edge10.preheader:                          ; preds = %15
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.preheader, %28
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %28 ], [ 0, %._crit_edge10.preheader ]
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9, %._crit_edge10
  %indvars.iv22 = phi i64 [ 0, %._crit_edge10 ], [ %indvars.iv.next23.1, %._crit_edge9 ]
  %indvars.iv.next23 = or i64 %indvars.iv22, 1
  %16 = mul nuw nsw i64 %indvars.iv.next23, %indvars.iv25
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 900
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, 9.000000e+02
  %21 = getelementptr inbounds [900 x double], [900 x double]* %3, i64 %indvars.iv25, i64 %indvars.iv22
  store double %20, double* %21, align 8
  %indvars.iv.next23.1 = add nsw i64 %indvars.iv22, 2
  %22 = mul nuw nsw i64 %indvars.iv.next23.1, %indvars.iv25
  %23 = trunc i64 %22 to i32
  %24 = srem i32 %23, 900
  %25 = sitofp i32 %24 to double
  %26 = fdiv double %25, 9.000000e+02
  %27 = getelementptr inbounds [900 x double], [900 x double]* %3, i64 %indvars.iv25, i64 %indvars.iv.next23
  store double %26, double* %27, align 8
  %exitcond24.1 = icmp eq i64 %indvars.iv.next23, 899
  br i1 %exitcond24.1, label %28, label %._crit_edge9

; <label>:28:                                     ; preds = %._crit_edge9
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next26, 1100
  br i1 %exitcond34, label %._crit_edge12.preheader, label %._crit_edge10

._crit_edge12.preheader:                          ; preds = %28
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.preheader, %38
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %38 ], [ 0, %._crit_edge12.preheader ]
  br label %29

; <label>:29:                                     ; preds = %._crit_edge36, %._crit_edge12
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %._crit_edge36 ], [ 0, %._crit_edge12 ]
  %30 = add nuw nsw i64 %indvars.iv17, 3
  %31 = mul nuw nsw i64 %30, %indvars.iv20
  %32 = add nuw nsw i64 %31, 1
  %33 = trunc i64 %32 to i32
  %34 = srem i32 %33, 1200
  %35 = sitofp i32 %34 to double
  %36 = fdiv double %35, 1.200000e+03
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv20, i64 %indvars.iv17
  store double %36, double* %37, align 8
  %exitcond19 = icmp eq i64 %indvars.iv17, 1199
  br i1 %exitcond19, label %38, label %._crit_edge36

._crit_edge36:                                    ; preds = %29
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  br label %29

; <label>:38:                                     ; preds = %29
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next21, 900
  br i1 %exitcond33, label %._crit_edge14.preheader, label %._crit_edge12

._crit_edge14.preheader:                          ; preds = %38
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.preheader, %47
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %47 ], [ 0, %._crit_edge14.preheader ]
  br label %39

; <label>:39:                                     ; preds = %._crit_edge37, %._crit_edge14
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge37 ], [ 0, %._crit_edge14 ]
  %40 = add nuw nsw i64 %indvars.iv, 2
  %41 = mul nuw nsw i64 %40, %indvars.iv15
  %42 = trunc i64 %41 to i32
  %43 = srem i32 %42, 1100
  %44 = sitofp i32 %43 to double
  %45 = fdiv double %44, 1.100000e+03
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv15, i64 %indvars.iv
  store double %45, double* %46, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1199
  br i1 %exitcond, label %47, label %._crit_edge37

._crit_edge37:                                    ; preds = %39
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %39

; <label>:47:                                     ; preds = %39
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next16, 800
  br i1 %exitcond32, label %48, label %._crit_edge14

; <label>:48:                                     ; preds = %47
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_2mm(double, double, [900 x double]*, [1100 x double]* nocapture readonly, [900 x double]* nocapture readonly, [1200 x double]*, [1200 x double]* nocapture) unnamed_addr #2 {
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %19, %7
  %indvars.iv20 = phi i64 [ 0, %7 ], [ %indvars.iv.next21, %19 ]
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %18, %._crit_edge7
  %indvars.iv18 = phi i64 [ 0, %._crit_edge7 ], [ %indvars.iv.next19, %18 ]
  %8 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv20, i64 %indvars.iv18
  store double 0.000000e+00, double* %8, align 8
  br label %9

; <label>:9:                                      ; preds = %._crit_edge, %._crit_edge6
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %._crit_edge ], [ 0, %._crit_edge6 ]
  %10 = phi double [ %17, %._crit_edge ], [ 0.000000e+00, %._crit_edge6 ]
  %11 = getelementptr inbounds [1100 x double], [1100 x double]* %3, i64 %indvars.iv20, i64 %indvars.iv15
  %12 = load double, double* %11, align 8
  %13 = fmul double %12, %0
  %14 = getelementptr inbounds [900 x double], [900 x double]* %4, i64 %indvars.iv15, i64 %indvars.iv18
  %15 = load double, double* %14, align 8
  %16 = fmul double %13, %15
  %17 = fadd double %16, %10
  store double %17, double* %8, align 8
  %exitcond17 = icmp eq i64 %indvars.iv15, 1099
  br i1 %exitcond17, label %18, label %._crit_edge

._crit_edge:                                      ; preds = %9
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  br label %9

; <label>:18:                                     ; preds = %9
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next19, 900
  br i1 %exitcond24, label %19, label %._crit_edge6

; <label>:19:                                     ; preds = %18
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next21, 800
  br i1 %exitcond25, label %._crit_edge10.preheader, label %._crit_edge7

._crit_edge10.preheader:                          ; preds = %19
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.preheader, %32
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %32 ], [ 0, %._crit_edge10.preheader ]
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %31, %._crit_edge10
  %indvars.iv11 = phi i64 [ 0, %._crit_edge10 ], [ %indvars.iv.next12, %31 ]
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv13, i64 %indvars.iv11
  %21 = load double, double* %20, align 8
  %22 = fmul double %21, %1
  store double %22, double* %20, align 8
  br label %23

; <label>:23:                                     ; preds = %._crit_edge26, %._crit_edge9
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge26 ], [ 0, %._crit_edge9 ]
  %24 = phi double [ %30, %._crit_edge26 ], [ %22, %._crit_edge9 ]
  %25 = getelementptr inbounds [900 x double], [900 x double]* %2, i64 %indvars.iv13, i64 %indvars.iv
  %26 = load double, double* %25, align 8
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv, i64 %indvars.iv11
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = fadd double %29, %24
  store double %30, double* %20, align 8
  %exitcond = icmp eq i64 %indvars.iv, 899
  br i1 %exitcond, label %31, label %._crit_edge26

._crit_edge26:                                    ; preds = %23
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %23

; <label>:31:                                     ; preds = %23
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next12, 1200
  br i1 %exitcond22, label %32, label %._crit_edge9

; <label>:32:                                     ; preds = %31
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next14, 800
  br i1 %exitcond23, label %33, label %._crit_edge10

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
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %17, %1
  %indvars.iv4 = phi i64 [ 0, %1 ], [ %indvars.iv.next5, %17 ]
  %6 = mul nuw nsw i64 %indvars.iv4, 800
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge, %._crit_edge3
  %indvars.iv = phi i64 [ 0, %._crit_edge3 ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %6, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge2
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge2, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %17, label %._crit_edge2

; <label>:17:                                     ; preds = %._crit_edge
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 800
  br i1 %exitcond6, label %18, label %._crit_edge3

; <label>:18:                                     ; preds = %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
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
