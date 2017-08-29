; ModuleID = 'A.ll'
source_filename = "atax.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %7 = bitcast i8* %3 to [2100 x double]*
  %8 = bitcast i8* %4 to double*
  call fastcc void @init_array([2100 x double]* %7, double* %8)
  call void (...) @polybench_timer_start() #4
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  call fastcc void @kernel_atax([2100 x double]* %7, double* %8, double* %9, double* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to double*
  call fastcc void @print_array(double* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([2100 x double]* nocapture, double* nocapture) unnamed_addr #2 {
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %2
  %indvars.iv510 = phi i64 [ 0, %2 ], [ %indvars.iv.next6.2, %._crit_edge ]
  %3 = trunc i64 %indvars.iv510 to i32
  %4 = sitofp i32 %3 to double
  %5 = getelementptr inbounds double, double* %1, i64 %indvars.iv510
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv510, 1
  %6 = trunc i64 %indvars.iv.next6 to i32
  %7 = sitofp i32 %6 to double
  %8 = insertelement <2 x double> undef, double %4, i32 0
  %9 = insertelement <2 x double> %8, double %7, i32 1
  %10 = fdiv <2 x double> %9, <double 2.100000e+03, double 2.100000e+03>
  %11 = fadd <2 x double> %10, <double 1.000000e+00, double 1.000000e+00>
  %12 = bitcast double* %5 to <2 x double>*
  store <2 x double> %11, <2 x double>* %12, align 8
  %indvars.iv.next6.1 = add nsw i64 %indvars.iv510, 2
  %13 = trunc i64 %indvars.iv.next6.1 to i32
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 2.100000e+03
  %16 = fadd double %15, 1.000000e+00
  %17 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next6.1
  store double %16, double* %17, align 8
  %indvars.iv.next6.2 = add nsw i64 %indvars.iv510, 3
  %exitcond7.2 = icmp eq i64 %indvars.iv.next6.2, 2100
  br i1 %exitcond7.2, label %.preheader.preheader.preheader, label %._crit_edge

.preheader.preheader.preheader:                   ; preds = %._crit_edge
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.preheader, %.preheader1
  %indvars.iv29 = phi i64 [ %indvars.iv.next3, %.preheader1 ], [ 0, %.preheader.preheader.preheader ]
  br label %.preheader

.preheader:                                       ; preds = %.preheader, %.preheader.preheader
  %indvars.iv8 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next.1, %.preheader ]
  %18 = add nuw nsw i64 %indvars.iv29, %indvars.iv8
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, 2100
  %21 = sitofp i32 %20 to double
  %22 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv29, i64 %indvars.iv8
  %indvars.iv.next = or i64 %indvars.iv8, 1
  %23 = add nuw nsw i64 %indvars.iv29, %indvars.iv.next
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, 2100
  %26 = sitofp i32 %25 to double
  %27 = insertelement <2 x double> undef, double %21, i32 0
  %28 = insertelement <2 x double> %27, double %26, i32 1
  %29 = fdiv <2 x double> %28, <double 9.500000e+03, double 9.500000e+03>
  %30 = bitcast double* %22 to <2 x double>*
  store <2 x double> %29, <2 x double>* %30, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv8, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2100
  br i1 %exitcond.1, label %.preheader1, label %.preheader

.preheader1:                                      ; preds = %.preheader
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next3, 1900
  br i1 %exitcond4, label %31, label %.preheader.preheader

; <label>:31:                                     ; preds = %.preheader1
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_atax([2100 x double]* nocapture readonly, double* nocapture readonly, double* nocapture, double*) unnamed_addr #2 {
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %4
  %indvars.iv821 = phi i64 [ 0, %4 ], [ %indvars.iv.next9.11, %._crit_edge ]
  %5 = getelementptr inbounds double, double* %2, i64 %indvars.iv821
  store double 0.000000e+00, double* %5, align 8
  %indvars.iv.next9 = or i64 %indvars.iv821, 1
  %6 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next9
  store double 0.000000e+00, double* %6, align 8
  %indvars.iv.next9.1 = or i64 %indvars.iv821, 2
  %7 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next9.1
  store double 0.000000e+00, double* %7, align 8
  %indvars.iv.next9.2 = or i64 %indvars.iv821, 3
  %8 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next9.2
  store double 0.000000e+00, double* %8, align 8
  %indvars.iv.next9.3 = add nsw i64 %indvars.iv821, 4
  %9 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next9.3
  store double 0.000000e+00, double* %9, align 8
  %indvars.iv.next9.4 = add nsw i64 %indvars.iv821, 5
  %10 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next9.4
  store double 0.000000e+00, double* %10, align 8
  %indvars.iv.next9.5 = add nsw i64 %indvars.iv821, 6
  %11 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next9.5
  store double 0.000000e+00, double* %11, align 8
  %indvars.iv.next9.6 = add nsw i64 %indvars.iv821, 7
  %12 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next9.6
  store double 0.000000e+00, double* %12, align 8
  %indvars.iv.next9.7 = add nsw i64 %indvars.iv821, 8
  %13 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next9.7
  store double 0.000000e+00, double* %13, align 8
  %indvars.iv.next9.8 = add nsw i64 %indvars.iv821, 9
  %14 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next9.8
  store double 0.000000e+00, double* %14, align 8
  %indvars.iv.next9.9 = add nsw i64 %indvars.iv821, 10
  %15 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next9.9
  store double 0.000000e+00, double* %15, align 8
  %indvars.iv.next9.10 = add nsw i64 %indvars.iv821, 11
  %16 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next9.10
  store double 0.000000e+00, double* %16, align 8
  %indvars.iv.next9.11 = add nsw i64 %indvars.iv821, 12
  %exitcond10.11 = icmp eq i64 %indvars.iv.next9.11, 2100
  br i1 %exitcond10.11, label %.preheader1.preheader.preheader, label %._crit_edge

.preheader1.preheader.preheader:                  ; preds = %._crit_edge
  %sunkaddr = ptrtoint double* %3 to i64
  %sunkaddr.1 = ptrtoint double* %3 to i64
  %sunkaddr14 = ptrtoint double* %3 to i64
  %sunkaddr14.1 = ptrtoint double* %3 to i64
  br label %.preheader1.preheader

.preheader1.preheader:                            ; preds = %.preheader1.preheader.preheader, %.preheader1
  %indvars.iv520 = phi i64 [ %indvars.iv.next6, %.preheader1 ], [ 0, %.preheader1.preheader.preheader ]
  %17 = getelementptr inbounds double, double* %3, i64 %indvars.iv520
  store double 0.000000e+00, double* %17, align 8
  %sunkaddr11 = shl nuw nsw i64 %indvars.iv520, 3
  %sunkaddr12 = add i64 %sunkaddr, %sunkaddr11
  %sunkaddr13 = inttoptr i64 %sunkaddr12 to double*
  %sunkaddr11.1 = shl nuw nsw i64 %indvars.iv520, 3
  %sunkaddr12.1 = add i64 %sunkaddr.1, %sunkaddr11.1
  %sunkaddr13.1 = inttoptr i64 %sunkaddr12.1 to double*
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1, %.preheader1.preheader
  %indvars.iv18 = phi i64 [ 0, %.preheader1.preheader ], [ %indvars.iv.next.1, %._crit_edge1 ]
  %18 = phi double [ 0.000000e+00, %.preheader1.preheader ], [ %30, %._crit_edge1 ]
  %19 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv520, i64 %indvars.iv18
  %20 = load double, double* %19, align 8
  %21 = getelementptr inbounds double, double* %1, i64 %indvars.iv18
  %22 = load double, double* %21, align 8
  %23 = fmul double %20, %22
  %24 = fadd double %18, %23
  store double %24, double* %sunkaddr13, align 8
  %indvars.iv.next = or i64 %indvars.iv18, 1
  %25 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv520, i64 %indvars.iv.next
  %26 = load double, double* %25, align 8
  %27 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = fadd double %24, %29
  store double %30, double* %sunkaddr13.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv18, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2100
  br i1 %exitcond.1, label %.preheader.preheader, label %._crit_edge1

.preheader.preheader:                             ; preds = %._crit_edge1
  %sunkaddr15 = shl nuw nsw i64 %indvars.iv520, 3
  %sunkaddr16 = add i64 %sunkaddr14, %sunkaddr15
  %sunkaddr17 = inttoptr i64 %sunkaddr16 to double*
  %sunkaddr15.1 = shl nuw nsw i64 %indvars.iv520, 3
  %sunkaddr16.1 = add i64 %sunkaddr14.1, %sunkaddr15.1
  %sunkaddr17.1 = inttoptr i64 %sunkaddr16.1 to double*
  br label %.preheader

.preheader:                                       ; preds = %.preheader, %.preheader.preheader
  %indvars.iv219 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next3.1, %.preheader ]
  %31 = getelementptr inbounds double, double* %2, i64 %indvars.iv219
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv520, i64 %indvars.iv219
  %34 = load double, double* %33, align 8
  %35 = load double, double* %sunkaddr17, align 8
  %36 = fmul double %34, %35
  %37 = fadd double %32, %36
  store double %37, double* %31, align 8
  %indvars.iv.next3 = or i64 %indvars.iv219, 1
  %38 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next3
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv520, i64 %indvars.iv.next3
  %41 = load double, double* %40, align 8
  %42 = load double, double* %sunkaddr17.1, align 8
  %43 = fmul double %41, %42
  %44 = fadd double %39, %43
  store double %44, double* %38, align 8
  %indvars.iv.next3.1 = add nsw i64 %indvars.iv219, 2
  %exitcond4.1 = icmp eq i64 %indvars.iv.next3.1, 2100
  br i1 %exitcond4.1, label %.preheader1, label %.preheader

.preheader1:                                      ; preds = %.preheader
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv520, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1900
  br i1 %exitcond7, label %45, label %.preheader1.preheader

; <label>:45:                                     ; preds = %.preheader1
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge, %1
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next, %._crit_edge ]
  %6 = trunc i64 %indvars.iv1 to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %._crit_edge1
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %10) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge1, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %0, i64 %indvars.iv1
  %13 = load double, double* %12, align 8
  %14 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2100
  br i1 %exitcond, label %15, label %._crit_edge1

; <label>:15:                                     ; preds = %._crit_edge
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
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
