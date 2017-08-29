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
  %indvars.iv915 = phi i64 [ 0, %2 ], [ %indvars.iv.next10.2, %._crit_edge ]
  %3 = trunc i64 %indvars.iv915 to i32
  %4 = sitofp i32 %3 to double
  %5 = getelementptr inbounds double, double* %1, i64 %indvars.iv915
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv915, 1
  %6 = trunc i64 %indvars.iv.next10 to i32
  %7 = sitofp i32 %6 to double
  %8 = insertelement <2 x double> undef, double %4, i32 0
  %9 = insertelement <2 x double> %8, double %7, i32 1
  %10 = fdiv <2 x double> %9, <double 2.100000e+03, double 2.100000e+03>
  %11 = fadd <2 x double> %10, <double 1.000000e+00, double 1.000000e+00>
  %12 = bitcast double* %5 to <2 x double>*
  store <2 x double> %11, <2 x double>* %12, align 8
  %indvars.iv.next10.1 = add nsw i64 %indvars.iv915, 2
  %13 = trunc i64 %indvars.iv.next10.1 to i32
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 2.100000e+03
  %16 = fadd double %15, 1.000000e+00
  %17 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next10.1
  store double %16, double* %17, align 8
  %indvars.iv.next10.2 = add nsw i64 %indvars.iv915, 3
  %exitcond11.2 = icmp eq i64 %indvars.iv.next10.2, 2100
  br i1 %exitcond11.2, label %.preheader.preheader.preheader, label %._crit_edge

.preheader.preheader.preheader:                   ; preds = %._crit_edge
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.preheader, %.preheader12
  %indvars.iv614 = phi i64 [ %indvars.iv.next7, %.preheader12 ], [ 0, %.preheader.preheader.preheader ]
  br label %.preheader

.preheader:                                       ; preds = %.preheader, %.preheader.preheader
  %indvars.iv13 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next.1, %.preheader ]
  %18 = add nuw nsw i64 %indvars.iv614, %indvars.iv13
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, 2100
  %21 = sitofp i32 %20 to double
  %22 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv614, i64 %indvars.iv13
  %indvars.iv.next = or i64 %indvars.iv13, 1
  %23 = add nuw nsw i64 %indvars.iv614, %indvars.iv.next
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, 2100
  %26 = sitofp i32 %25 to double
  %27 = insertelement <2 x double> undef, double %21, i32 0
  %28 = insertelement <2 x double> %27, double %26, i32 1
  %29 = fdiv <2 x double> %28, <double 9.500000e+03, double 9.500000e+03>
  %30 = bitcast double* %22 to <2 x double>*
  store <2 x double> %29, <2 x double>* %30, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv13, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2100
  br i1 %exitcond.1, label %.preheader12, label %.preheader

.preheader12:                                     ; preds = %.preheader
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv614, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 1900
  br i1 %exitcond8, label %31, label %.preheader.preheader

; <label>:31:                                     ; preds = %.preheader12
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
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %4
  %indvars.iv1536 = phi i64 [ 0, %4 ], [ %indvars.iv.next16.11, %._crit_edge ]
  %8 = getelementptr inbounds double, double* %2, i64 %indvars.iv1536
  store double 0.000000e+00, double* %8, align 8
  %indvars.iv.next16 = or i64 %indvars.iv1536, 1
  %9 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next16
  store double 0.000000e+00, double* %9, align 8
  %indvars.iv.next16.1 = or i64 %indvars.iv1536, 2
  %10 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next16.1
  store double 0.000000e+00, double* %10, align 8
  %indvars.iv.next16.2 = or i64 %indvars.iv1536, 3
  %11 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next16.2
  store double 0.000000e+00, double* %11, align 8
  %indvars.iv.next16.3 = add nsw i64 %indvars.iv1536, 4
  %12 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next16.3
  store double 0.000000e+00, double* %12, align 8
  %indvars.iv.next16.4 = add nsw i64 %indvars.iv1536, 5
  %13 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next16.4
  store double 0.000000e+00, double* %13, align 8
  %indvars.iv.next16.5 = add nsw i64 %indvars.iv1536, 6
  %14 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next16.5
  store double 0.000000e+00, double* %14, align 8
  %indvars.iv.next16.6 = add nsw i64 %indvars.iv1536, 7
  %15 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next16.6
  store double 0.000000e+00, double* %15, align 8
  %indvars.iv.next16.7 = add nsw i64 %indvars.iv1536, 8
  %16 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next16.7
  store double 0.000000e+00, double* %16, align 8
  %indvars.iv.next16.8 = add nsw i64 %indvars.iv1536, 9
  %17 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next16.8
  store double 0.000000e+00, double* %17, align 8
  %indvars.iv.next16.9 = add nsw i64 %indvars.iv1536, 10
  %18 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next16.9
  store double 0.000000e+00, double* %18, align 8
  %indvars.iv.next16.10 = add nsw i64 %indvars.iv1536, 11
  %19 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next16.10
  store double 0.000000e+00, double* %19, align 8
  %indvars.iv.next16.11 = add nsw i64 %indvars.iv1536, 12
  %exitcond17.11 = icmp eq i64 %indvars.iv.next16.11, 2100
  br i1 %exitcond17.11, label %.preheader25.preheader, label %._crit_edge

.preheader25.preheader:                           ; preds = %._crit_edge
  %sunkaddr = ptrtoint double* %3 to i64
  %sunkaddr.1 = ptrtoint double* %3 to i64
  %sunkaddr29 = ptrtoint double* %3 to i64
  %sunkaddr29.1 = ptrtoint double* %3 to i64
  br label %.preheader25

.preheader25:                                     ; preds = %.preheader25.preheader, %55
  %indvars.iv1235 = phi i64 [ %indvars.iv.next13, %55 ], [ 0, %.preheader25.preheader ]
  %20 = getelementptr inbounds double, double* %3, i64 %indvars.iv1235
  store double 0.000000e+00, double* %20, align 8
  %21 = load [2100 x double]*, [2100 x double]** %5, align 8
  %22 = load double*, double** %6, align 8
  %sunkaddr26 = shl nuw nsw i64 %indvars.iv1235, 3
  %sunkaddr27 = add i64 %sunkaddr, %sunkaddr26
  %sunkaddr28 = inttoptr i64 %sunkaddr27 to double*
  %sunkaddr26.1 = shl nuw nsw i64 %indvars.iv1235, 3
  %sunkaddr27.1 = add i64 %sunkaddr.1, %sunkaddr26.1
  %sunkaddr28.1 = inttoptr i64 %sunkaddr27.1 to double*
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1, %.preheader25
  %indvars.iv33 = phi i64 [ 0, %.preheader25 ], [ %indvars.iv.next.1, %._crit_edge1 ]
  %23 = load double, double* %sunkaddr28, align 8
  %24 = getelementptr inbounds [2100 x double], [2100 x double]* %21, i64 %indvars.iv1235, i64 %indvars.iv33
  %25 = load double, double* %24, align 8
  %26 = getelementptr inbounds double, double* %22, i64 %indvars.iv33
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = fadd double %23, %28
  store double %29, double* %sunkaddr28, align 8
  %indvars.iv.next = or i64 %indvars.iv33, 1
  %30 = load double, double* %sunkaddr28.1, align 8
  %31 = getelementptr inbounds [2100 x double], [2100 x double]* %21, i64 %indvars.iv1235, i64 %indvars.iv.next
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds double, double* %22, i64 %indvars.iv.next
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = fadd double %30, %35
  store double %36, double* %sunkaddr28.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv33, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2100
  br i1 %exitcond.1, label %.preheader.preheader, label %._crit_edge1

.preheader.preheader:                             ; preds = %._crit_edge1
  %sunkaddr30 = shl nuw nsw i64 %indvars.iv1235, 3
  %sunkaddr31 = add i64 %sunkaddr29, %sunkaddr30
  %sunkaddr32 = inttoptr i64 %sunkaddr31 to double*
  %sunkaddr30.1 = shl nuw nsw i64 %indvars.iv1235, 3
  %sunkaddr31.1 = add i64 %sunkaddr29.1, %sunkaddr30.1
  %sunkaddr32.1 = inttoptr i64 %sunkaddr31.1 to double*
  br label %.preheader

.preheader:                                       ; preds = %.preheader, %.preheader.preheader
  %indvars.iv934 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next10.1, %.preheader ]
  %37 = load double*, double** %7, align 8
  %38 = getelementptr inbounds double, double* %37, i64 %indvars.iv934
  %39 = load double, double* %38, align 8
  %40 = load [2100 x double]*, [2100 x double]** %5, align 8
  %41 = getelementptr inbounds [2100 x double], [2100 x double]* %40, i64 %indvars.iv1235, i64 %indvars.iv934
  %42 = load double, double* %41, align 8
  %43 = load double, double* %sunkaddr32, align 8
  %44 = fmul double %42, %43
  %45 = fadd double %39, %44
  store double %45, double* %38, align 8
  %indvars.iv.next10 = or i64 %indvars.iv934, 1
  %46 = load double*, double** %7, align 8
  %47 = getelementptr inbounds double, double* %46, i64 %indvars.iv.next10
  %48 = load double, double* %47, align 8
  %49 = load [2100 x double]*, [2100 x double]** %5, align 8
  %50 = getelementptr inbounds [2100 x double], [2100 x double]* %49, i64 %indvars.iv1235, i64 %indvars.iv.next10
  %51 = load double, double* %50, align 8
  %52 = load double, double* %sunkaddr32.1, align 8
  %53 = fmul double %51, %52
  %54 = fadd double %48, %53
  store double %54, double* %47, align 8
  %indvars.iv.next10.1 = add nsw i64 %indvars.iv934, 2
  %exitcond11.1 = icmp eq i64 %indvars.iv.next10.1, 2100
  br i1 %exitcond11.1, label %55, label %.preheader

; <label>:55:                                     ; preds = %.preheader
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv1235, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next13, 1900
  br i1 %exitcond14, label %56, label %.preheader25

; <label>:56:                                     ; preds = %55
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
