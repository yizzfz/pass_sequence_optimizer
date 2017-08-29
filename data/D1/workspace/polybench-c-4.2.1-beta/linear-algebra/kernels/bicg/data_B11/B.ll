; ModuleID = 'A.ll'
source_filename = "bicg.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"s\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %8 = bitcast i8* %3 to [1900 x double]*
  %9 = bitcast i8* %7 to double*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array([1900 x double]* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = bitcast i8* %4 to double*
  %12 = bitcast i8* %5 to double*
  tail call fastcc void @kernel_bicg([1900 x double]* %8, double* %11, double* %12, double* %10, double* %9)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(double* %11, double* %12)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1900 x double]*, double*, double*) unnamed_addr #2 {
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %3
  %indvars.iv27 = phi i64 [ 0, %3 ], [ %indvars.iv.next28.1, %._crit_edge ]
  %4 = trunc i64 %indvars.iv27 to i32
  %5 = sitofp i32 %4 to double
  %6 = fdiv double %5, 1.900000e+03
  %7 = getelementptr inbounds double, double* %2, i64 %indvars.iv27
  store double %6, double* %7, align 8
  %indvars.iv.next28 = or i64 %indvars.iv27, 1
  %8 = trunc i64 %indvars.iv.next28 to i32
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, 1.900000e+03
  %11 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next28
  store double %10, double* %11, align 8
  %indvars.iv.next28.1 = add nsw i64 %indvars.iv27, 2
  %exitcond29.1 = icmp eq i64 %indvars.iv.next28.1, 1900
  br i1 %exitcond29.1, label %.preheader.preheader, label %._crit_edge

.preheader.preheader:                             ; preds = %._crit_edge
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %28
  %indvars.iv24 = phi i64 [ %indvars.iv.next25, %28 ], [ 0, %.preheader.preheader ]
  %12 = trunc i64 %indvars.iv24 to i32
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 2.100000e+03
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv24
  store double %14, double* %15, align 8
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge30, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge30 ]
  %indvars.iv.next = or i64 %indvars.iv, 1
  %16 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv24
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 2100
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, 2.100000e+03
  %21 = getelementptr inbounds [1900 x double], [1900 x double]* %0, i64 %indvars.iv24, i64 %indvars.iv
  store double %20, double* %21, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %22 = mul nuw nsw i64 %indvars.iv.next.1, %indvars.iv24
  %23 = trunc i64 %22 to i32
  %24 = srem i32 %23, 2100
  %25 = sitofp i32 %24 to double
  %26 = fdiv double %25, 2.100000e+03
  %27 = getelementptr inbounds [1900 x double], [1900 x double]* %0, i64 %indvars.iv24, i64 %indvars.iv.next
  store double %26, double* %27, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1900
  br i1 %exitcond.1, label %28, label %._crit_edge30

; <label>:28:                                     ; preds = %._crit_edge30
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next25, 2100
  br i1 %exitcond26, label %29, label %.preheader

; <label>:29:                                     ; preds = %28
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_bicg([1900 x double]*, double*, double*, double*, double*) unnamed_addr #2 {
.preheader.preheader:
  %5 = bitcast double* %1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 15200, i32 8, i1 false)
  br label %.preheader

.preheader:                                       ; preds = %21, %.preheader.preheader
  %indvars.iv29 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next30, %21 ]
  %6 = getelementptr inbounds double, double* %2, i64 %indvars.iv29
  store double 0.000000e+00, double* %6, align 8
  %7 = getelementptr inbounds double, double* %4, i64 %indvars.iv29
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %8 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %9 = load double, double* %8, align 8
  %10 = load double, double* %7, align 8
  %11 = getelementptr inbounds [1900 x double], [1900 x double]* %0, i64 %indvars.iv29, i64 %indvars.iv
  %12 = load double, double* %11, align 8
  %13 = fmul double %10, %12
  %14 = fadd double %9, %13
  store double %14, double* %8, align 8
  %15 = load double, double* %6, align 8
  %16 = load double, double* %11, align 8
  %17 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fadd double %15, %19
  store double %20, double* %6, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1900
  br i1 %exitcond, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %._crit_edge
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next30, 2100
  br i1 %exitcond31, label %22, label %.preheader

; <label>:22:                                     ; preds = %21
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double*, double*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge, %2
  %indvars.iv16 = phi i64 [ 0, %2 ], [ %indvars.iv.next17, %._crit_edge ]
  %7 = trunc i64 %indvars.iv16 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge._crit_edge
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc4 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge._crit_edge, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds double, double* %0, i64 %indvars.iv16
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #7
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 1900
  br i1 %exitcond18, label %16, label %._crit_edge._crit_edge

; <label>:16:                                     ; preds = %._crit_edge
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  br label %._crit_edge13._crit_edge

._crit_edge13._crit_edge:                         ; preds = %._crit_edge13, %16
  %indvars.iv = phi i64 [ 0, %16 ], [ %indvars.iv.next, %._crit_edge13 ]
  %21 = trunc i64 %indvars.iv to i32
  %22 = srem i32 %21, 20
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %._crit_edge13

; <label>:24:                                     ; preds = %._crit_edge13._crit_edge
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %25) #6
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13._crit_edge, %24
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %28 = load double, double* %27, align 8
  %29 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %28) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2100
  br i1 %exitcond, label %30, label %._crit_edge13._crit_edge

; <label>:30:                                     ; preds = %._crit_edge13
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %33) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
