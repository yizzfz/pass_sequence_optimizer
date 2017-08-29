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
  br i1 %11, label %12, label %17

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to double*
  call fastcc void @print_array(double* %16)
  br label %17

; <label>:17:                                     ; preds = %12, %2, %15
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([2100 x double]* nocapture, double* nocapture) unnamed_addr #2 {
  br label %3

; <label>:3:                                      ; preds = %3, %2
  %indvars.iv812 = phi i64 [ 0, %2 ], [ %indvars.iv.next9.2, %3 ]
  %4 = trunc i64 %indvars.iv812 to i32
  %5 = sitofp i32 %4 to double
  %6 = getelementptr inbounds double, double* %1, i64 %indvars.iv812
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv812, 1
  %7 = trunc i64 %indvars.iv.next9 to i32
  %8 = sitofp i32 %7 to double
  %9 = insertelement <2 x double> undef, double %5, i32 0
  %10 = insertelement <2 x double> %9, double %8, i32 1
  %11 = fdiv <2 x double> %10, <double 2.100000e+03, double 2.100000e+03>
  %12 = fadd <2 x double> %11, <double 1.000000e+00, double 1.000000e+00>
  %13 = bitcast double* %6 to <2 x double>*
  store <2 x double> %12, <2 x double>* %13, align 8
  %indvars.iv.next9.1 = add nsw i64 %indvars.iv812, 2
  %14 = trunc i64 %indvars.iv.next9.1 to i32
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, 2.100000e+03
  %17 = fadd double %16, 1.000000e+00
  %18 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next9.1
  store double %17, double* %18, align 8
  %indvars.iv.next9.2 = add nsw i64 %indvars.iv812, 3
  %exitcond2.2 = icmp eq i64 %indvars.iv.next9.2, 2100
  br i1 %exitcond2.2, label %.preheader.preheader.preheader, label %3

.preheader.preheader.preheader:                   ; preds = %3
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.preheader, %32
  %indvars.iv611 = phi i64 [ %indvars.iv.next7, %32 ], [ 0, %.preheader.preheader.preheader ]
  br label %.preheader

.preheader:                                       ; preds = %.preheader, %.preheader.preheader
  %indvars.iv10 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next.1, %.preheader ]
  %19 = add nuw nsw i64 %indvars.iv611, %indvars.iv10
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 2100
  %22 = sitofp i32 %21 to double
  %23 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv611, i64 %indvars.iv10
  %indvars.iv.next = or i64 %indvars.iv10, 1
  %24 = add nuw nsw i64 %indvars.iv611, %indvars.iv.next
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, 2100
  %27 = sitofp i32 %26 to double
  %28 = insertelement <2 x double> undef, double %22, i32 0
  %29 = insertelement <2 x double> %28, double %27, i32 1
  %30 = fdiv <2 x double> %29, <double 9.500000e+03, double 9.500000e+03>
  %31 = bitcast double* %23 to <2 x double>*
  store <2 x double> %30, <2 x double>* %31, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv10, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2100
  br i1 %exitcond.1, label %32, label %.preheader

; <label>:32:                                     ; preds = %.preheader
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv611, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next7, 1900
  br i1 %exitcond1, label %33, label %.preheader.preheader

; <label>:33:                                     ; preds = %32
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_atax([2100 x double]*, double*, double*, double*) unnamed_addr #2 {
  %5 = alloca [2100 x double]*, align 8
  %6 = alloca double*, align 8
  %7 = alloca double*, align 8
  store [2100 x double]* %0, [2100 x double]** %5, align 8
  store double* %1, double** %6, align 8
  store double* %2, double** %7, align 8
  br label %8

; <label>:8:                                      ; preds = %8, %4
  %indvars.iv1332 = phi i64 [ 0, %4 ], [ %indvars.iv.next14.11, %8 ]
  %9 = getelementptr inbounds double, double* %2, i64 %indvars.iv1332
  store double 0.000000e+00, double* %9, align 8
  %indvars.iv.next14 = or i64 %indvars.iv1332, 1
  %10 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next14
  store double 0.000000e+00, double* %10, align 8
  %indvars.iv.next14.1 = or i64 %indvars.iv1332, 2
  %11 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next14.1
  store double 0.000000e+00, double* %11, align 8
  %indvars.iv.next14.2 = or i64 %indvars.iv1332, 3
  %12 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next14.2
  store double 0.000000e+00, double* %12, align 8
  %indvars.iv.next14.3 = add nsw i64 %indvars.iv1332, 4
  %13 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next14.3
  store double 0.000000e+00, double* %13, align 8
  %indvars.iv.next14.4 = add nsw i64 %indvars.iv1332, 5
  %14 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next14.4
  store double 0.000000e+00, double* %14, align 8
  %indvars.iv.next14.5 = add nsw i64 %indvars.iv1332, 6
  %15 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next14.5
  store double 0.000000e+00, double* %15, align 8
  %indvars.iv.next14.6 = add nsw i64 %indvars.iv1332, 7
  %16 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next14.6
  store double 0.000000e+00, double* %16, align 8
  %indvars.iv.next14.7 = add nsw i64 %indvars.iv1332, 8
  %17 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next14.7
  store double 0.000000e+00, double* %17, align 8
  %indvars.iv.next14.8 = add nsw i64 %indvars.iv1332, 9
  %18 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next14.8
  store double 0.000000e+00, double* %18, align 8
  %indvars.iv.next14.9 = add nsw i64 %indvars.iv1332, 10
  %19 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next14.9
  store double 0.000000e+00, double* %19, align 8
  %indvars.iv.next14.10 = add nsw i64 %indvars.iv1332, 11
  %20 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next14.10
  store double 0.000000e+00, double* %20, align 8
  %indvars.iv.next14.11 = add nsw i64 %indvars.iv1332, 12
  %exitcond3.11 = icmp eq i64 %indvars.iv.next14.11, 2100
  br i1 %exitcond3.11, label %.preheader14, label %8

.preheader14:                                     ; preds = %8
  %sunkaddr = ptrtoint double* %3 to i64
  %sunkaddr.1 = ptrtoint double* %3 to i64
  %sunkaddr10 = ptrtoint double* %3 to i64
  br label %21

; <label>:21:                                     ; preds = %.preheader14, %._crit_edge6
  %22 = phi double* [ %.pre, %._crit_edge6 ], [ %1, %.preheader14 ]
  %23 = phi [2100 x double]* [ %.pre8, %._crit_edge6 ], [ %0, %.preheader14 ]
  %indvars.iv1131 = phi i64 [ %indvars.iv.next12, %._crit_edge6 ], [ 0, %.preheader14 ]
  %24 = getelementptr inbounds double, double* %3, i64 %indvars.iv1131
  store double 0.000000e+00, double* %24, align 8
  %sunkaddr22 = shl nuw nsw i64 %indvars.iv1131, 3
  %sunkaddr23 = add i64 %sunkaddr, %sunkaddr22
  %sunkaddr24 = inttoptr i64 %sunkaddr23 to double*
  %sunkaddr22.1 = shl nuw nsw i64 %indvars.iv1131, 3
  %sunkaddr23.1 = add i64 %sunkaddr.1, %sunkaddr22.1
  %sunkaddr24.1 = inttoptr i64 %sunkaddr23.1 to double*
  br label %25

.preheader:                                       ; preds = %25
  %.pre7 = load double*, double** %7, align 8
  %.pre8 = load [2100 x double]*, [2100 x double]** %5, align 8
  %sunkaddr11 = shl i64 %indvars.iv1131, 3
  %sunkaddr12 = add i64 %sunkaddr10, %sunkaddr11
  %sunkaddr13 = inttoptr i64 %sunkaddr12 to double*
  br label %40

; <label>:25:                                     ; preds = %25, %21
  %indvars.iv29 = phi i64 [ 0, %21 ], [ %indvars.iv.next.1, %25 ]
  %26 = load double, double* %sunkaddr24, align 8
  %27 = getelementptr inbounds [2100 x double], [2100 x double]* %23, i64 %indvars.iv1131, i64 %indvars.iv29
  %28 = load double, double* %27, align 8
  %29 = getelementptr inbounds double, double* %22, i64 %indvars.iv29
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = fadd double %26, %31
  store double %32, double* %sunkaddr24, align 8
  %indvars.iv.next = or i64 %indvars.iv29, 1
  %33 = load double, double* %sunkaddr24.1, align 8
  %34 = getelementptr inbounds [2100 x double], [2100 x double]* %23, i64 %indvars.iv1131, i64 %indvars.iv.next
  %35 = load double, double* %34, align 8
  %36 = getelementptr inbounds double, double* %22, i64 %indvars.iv.next
  %37 = load double, double* %36, align 8
  %38 = fmul double %35, %37
  %39 = fadd double %33, %38
  store double %39, double* %sunkaddr24.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv29, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2100
  br i1 %exitcond.1, label %.preheader, label %25

; <label>:40:                                     ; preds = %._crit_edge5, %.preheader
  %41 = phi double [ %39, %.preheader ], [ %.pre9, %._crit_edge5 ]
  %indvars.iv930 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next10, %._crit_edge5 ]
  %42 = getelementptr inbounds double, double* %.pre7, i64 %indvars.iv930
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [2100 x double], [2100 x double]* %.pre8, i64 %indvars.iv1131, i64 %indvars.iv930
  %45 = load double, double* %44, align 8
  %46 = fmul double %45, %41
  %47 = fadd double %43, %46
  store double %47, double* %42, align 8
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv930, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next10, 2100
  br i1 %exitcond1, label %48, label %._crit_edge5

._crit_edge5:                                     ; preds = %40
  %.pre9 = load double, double* %sunkaddr13, align 8
  br label %40

; <label>:48:                                     ; preds = %40
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv1131, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next12, 1900
  br i1 %exitcond2, label %49, label %._crit_edge6

._crit_edge6:                                     ; preds = %48
  %.pre = load double*, double** %6, align 8
  br label %21

; <label>:49:                                     ; preds = %48
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
  br label %6

; <label>:6:                                      ; preds = %12, %1
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next, %12 ]
  %7 = trunc i64 %indvars.iv1 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %12

; <label>:10:                                     ; preds = %6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %12

; <label>:12:                                     ; preds = %6, %10
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds double, double* %0, i64 %indvars.iv1
  %15 = load double, double* %14, align 8
  %16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2100
  br i1 %exitcond, label %17, label %6

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
