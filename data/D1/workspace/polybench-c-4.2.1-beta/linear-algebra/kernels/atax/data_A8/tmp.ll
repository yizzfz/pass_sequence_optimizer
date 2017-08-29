; ModuleID = 'A.ll'
source_filename = "atax.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %7 = bitcast i8* %3 to [2100 x double]*
  %8 = bitcast i8* %4 to double*
  tail call void @init_array([2100 x double]* %7, double* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  tail call void @kernel_atax([2100 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to double*
  tail call void @print_array(double* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array([2100 x double]*, double*) #2 {
  br label %3

; <label>:3:                                      ; preds = %3, %2
  %indvars.iv23 = phi i64 [ 0, %2 ], [ %indvars.iv.next24.2, %3 ]
  %4 = trunc i64 %indvars.iv23 to i32
  %5 = sitofp i32 %4 to double
  %6 = getelementptr inbounds double, double* %1, i64 %indvars.iv23
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %7 = trunc i64 %indvars.iv.next24 to i32
  %8 = sitofp i32 %7 to double
  %9 = insertelement <2 x double> undef, double %5, i32 0
  %10 = insertelement <2 x double> %9, double %8, i32 1
  %11 = fdiv <2 x double> %10, <double 2.100000e+03, double 2.100000e+03>
  %12 = fadd <2 x double> %11, <double 1.000000e+00, double 1.000000e+00>
  %13 = bitcast double* %6 to <2 x double>*
  store <2 x double> %12, <2 x double>* %13, align 8
  %indvars.iv.next24.1 = add nuw nsw i64 %indvars.iv23, 2
  %14 = trunc i64 %indvars.iv.next24.1 to i32
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, 2.100000e+03
  %17 = fadd double %16, 1.000000e+00
  %18 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next24.1
  store double %17, double* %18, align 8
  %indvars.iv.next24.2 = add nuw nsw i64 %indvars.iv23, 3
  %exitcond25.2 = icmp eq i64 %indvars.iv.next24.2, 2100
  br i1 %exitcond25.2, label %.preheader.preheader, label %3

.preheader.preheader:                             ; preds = %3
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %33
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %33 ], [ 0, %.preheader.preheader ]
  br label %19

; <label>:19:                                     ; preds = %19, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %19 ]
  %20 = add nuw nsw i64 %indvars.iv, %indvars.iv21
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, 2100
  %23 = sitofp i32 %22 to double
  %24 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv21, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %25 = add nuw nsw i64 %indvars.iv.next, %indvars.iv21
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 2100
  %28 = sitofp i32 %27 to double
  %29 = insertelement <2 x double> undef, double %23, i32 0
  %30 = insertelement <2 x double> %29, double %28, i32 1
  %31 = fdiv <2 x double> %30, <double 9.500000e+03, double 9.500000e+03>
  %32 = bitcast double* %24 to <2 x double>*
  store <2 x double> %31, <2 x double>* %32, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2100
  br i1 %exitcond.1, label %33, label %19

; <label>:33:                                     ; preds = %19
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond = icmp eq i64 %indvars.iv.next22, 1900
  br i1 %exitcond, label %34, label %.preheader

; <label>:34:                                     ; preds = %33
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_atax([2100 x double]*, double*, double*, double*) #2 {
  %5 = bitcast double* %2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 16800, i32 8, i1 false)
  %sunkaddr = ptrtoint double* %3 to i64
  %sunkaddr46 = ptrtoint double* %3 to i64
  br label %.preheader30

.preheader30:                                     ; preds = %48, %4
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %48 ], [ 0, %4 ]
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv38
  store double 0.000000e+00, double* %6, align 8
  %sunkaddr43 = shl i64 %indvars.iv38, 3
  %sunkaddr44 = add i64 %sunkaddr, %sunkaddr43
  %sunkaddr45 = inttoptr i64 %sunkaddr44 to double*
  br label %7

; <label>:7:                                      ; preds = %7, %.preheader30
  %indvars.iv = phi i64 [ 0, %.preheader30 ], [ %indvars.iv.next.2, %7 ]
  %8 = phi double [ 0.000000e+00, %.preheader30 ], [ %26, %7 ]
  %9 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv38, i64 %indvars.iv
  %10 = load double, double* %9, align 8
  %11 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %12 = load double, double* %11, align 8
  %13 = fmul double %10, %12
  %14 = fadd double %8, %13
  store double %14, double* %sunkaddr45, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %15 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv38, i64 %indvars.iv.next
  %16 = load double, double* %15, align 8
  %17 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fadd double %14, %19
  store double %20, double* %sunkaddr45, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %21 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv38, i64 %indvars.iv.next.1
  %22 = load double, double* %21, align 8
  %23 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.1
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = fadd double %20, %25
  store double %26, double* %sunkaddr45, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next.2, 2100
  br i1 %exitcond.2, label %.preheader.preheader, label %7

.preheader.preheader:                             ; preds = %7
  %sunkaddr47 = shl i64 %indvars.iv38, 3
  %sunkaddr48 = add i64 %sunkaddr46, %sunkaddr47
  %sunkaddr49 = inttoptr i64 %sunkaddr48 to double*
  br label %.preheader

.preheader:                                       ; preds = %.preheader, %.preheader.preheader
  %indvars.iv35 = phi i64 [ %indvars.iv.next36.2, %.preheader ], [ 0, %.preheader.preheader ]
  %27 = getelementptr inbounds double, double* %2, i64 %indvars.iv35
  %28 = load double, double* %27, align 8
  %29 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv38, i64 %indvars.iv35
  %30 = load double, double* %29, align 8
  %31 = load double, double* %sunkaddr49, align 8
  %32 = fmul double %30, %31
  %33 = fadd double %28, %32
  store double %33, double* %27, align 8
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %34 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next36
  %35 = load double, double* %34, align 8
  %36 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv38, i64 %indvars.iv.next36
  %37 = load double, double* %36, align 8
  %38 = load double, double* %sunkaddr49, align 8
  %39 = fmul double %37, %38
  %40 = fadd double %35, %39
  store double %40, double* %34, align 8
  %indvars.iv.next36.1 = add nuw nsw i64 %indvars.iv35, 2
  %41 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next36.1
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv38, i64 %indvars.iv.next36.1
  %44 = load double, double* %43, align 8
  %45 = load double, double* %sunkaddr49, align 8
  %46 = fmul double %44, %45
  %47 = fadd double %42, %46
  store double %47, double* %41, align 8
  %indvars.iv.next36.2 = add nuw nsw i64 %indvars.iv35, 3
  %exitcond.237 = icmp eq i64 %indvars.iv.next36.2, 2100
  br i1 %exitcond.237, label %48, label %.preheader

; <label>:48:                                     ; preds = %.preheader
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond = icmp eq i64 %indvars.iv.next39, 1900
  br i1 %exitcond, label %49, label %.preheader30

; <label>:49:                                     ; preds = %48
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(double*) #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %6

; <label>:6:                                      ; preds = %._crit_edge, %1
  %indvars.iv = phi i64 [ 0, %1 ], [ %indvars.iv.next, %._crit_edge ]
  %7 = trunc i64 %indvars.iv to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2100
  br i1 %exitcond, label %16, label %6

; <label>:16:                                     ; preds = %._crit_edge
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #6
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

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
