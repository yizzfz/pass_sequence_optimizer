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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
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
  br i1 %13, label %14, label %20

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %20

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to double*
  %19 = bitcast i8* %4 to double*
  tail call fastcc void @print_array(double* %19, double* %18)
  br label %20

; <label>:20:                                     ; preds = %14, %17, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1900 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %4

; <label>:4:                                      ; preds = %4, %3
  %indvars.iv48 = phi i64 [ 0, %3 ], [ %indvars.iv.next5.1, %4 ]
  %5 = trunc i64 %indvars.iv48 to i32
  %6 = srem i32 %5, 1900
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds double, double* %2, i64 %indvars.iv48
  %9 = trunc i64 %indvars.iv48 to i32
  %10 = or i32 %9, 1
  %11 = srem i32 %10, 1900
  %12 = sitofp i32 %11 to double
  %13 = insertelement <2 x double> undef, double %7, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  %15 = fdiv <2 x double> %14, <double 1.900000e+03, double 1.900000e+03>
  %16 = bitcast double* %8 to <2 x double>*
  store <2 x double> %15, <2 x double>* %16, align 8
  %indvars.iv.next5.1 = add nsw i64 %indvars.iv48, 2
  %exitcond2.1 = icmp eq i64 %indvars.iv.next5.1, 1900
  br i1 %exitcond2.1, label %.preheader.preheader, label %4

.preheader.preheader:                             ; preds = %4
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %36
  %indvars.iv27 = phi i64 [ %indvars.iv.next3, %36 ], [ 0, %.preheader.preheader ]
  %17 = trunc i64 %indvars.iv27 to i32
  %18 = srem i32 %17, 2100
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, 2.100000e+03
  %21 = getelementptr inbounds double, double* %1, i64 %indvars.iv27
  store double %20, double* %21, align 8
  br label %22

; <label>:22:                                     ; preds = %22, %.preheader
  %indvars.iv6 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %22 ]
  %indvars.iv.next = or i64 %indvars.iv6, 1
  %23 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv27
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, 2100
  %26 = sitofp i32 %25 to double
  %27 = getelementptr inbounds [1900 x double], [1900 x double]* %0, i64 %indvars.iv27, i64 %indvars.iv6
  %indvars.iv.next.1 = add nsw i64 %indvars.iv6, 2
  %28 = mul nuw nsw i64 %indvars.iv.next.1, %indvars.iv27
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 2100
  %31 = sitofp i32 %30 to double
  %32 = insertelement <2 x double> undef, double %26, i32 0
  %33 = insertelement <2 x double> %32, double %31, i32 1
  %34 = fdiv <2 x double> %33, <double 2.100000e+03, double 2.100000e+03>
  %35 = bitcast double* %27 to <2 x double>*
  store <2 x double> %34, <2 x double>* %35, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1900
  br i1 %exitcond.1, label %36, label %22

; <label>:36:                                     ; preds = %22
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next3, 2100
  br i1 %exitcond1, label %37, label %.preheader

; <label>:37:                                     ; preds = %36
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_bicg([1900 x double]* nocapture readonly, double* nocapture, double* nocapture, double* nocapture readonly, double* nocapture readonly) unnamed_addr #2 {
.preheader.preheader:
  %5 = bitcast double* %1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 15200, i32 8, i1 false)
  %sunkaddr = ptrtoint double* %4 to i64
  %sunkaddr17 = ptrtoint double* %2 to i64
  br label %.preheader

.preheader:                                       ; preds = %21, %.preheader.preheader
  %indvars.iv27 = phi i64 [ %indvars.iv.next3, %21 ], [ 0, %.preheader.preheader ]
  %6 = getelementptr inbounds double, double* %2, i64 %indvars.iv27
  store double 0.000000e+00, double* %6, align 8
  %sunkaddr14 = shl i64 %indvars.iv27, 3
  %sunkaddr15 = add i64 %sunkaddr, %sunkaddr14
  %sunkaddr16 = inttoptr i64 %sunkaddr15 to double*
  %sunkaddr19 = add i64 %sunkaddr17, %sunkaddr14
  %sunkaddr20 = inttoptr i64 %sunkaddr19 to double*
  br label %7

; <label>:7:                                      ; preds = %7, %.preheader
  %indvars.iv6 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %7 ]
  %8 = getelementptr inbounds double, double* %1, i64 %indvars.iv6
  %9 = load double, double* %8, align 8
  %10 = load double, double* %sunkaddr16, align 8
  %11 = getelementptr inbounds [1900 x double], [1900 x double]* %0, i64 %indvars.iv27, i64 %indvars.iv6
  %12 = load double, double* %11, align 8
  %13 = fmul double %10, %12
  %14 = fadd double %9, %13
  store double %14, double* %8, align 8
  %15 = load double, double* %sunkaddr20, align 8
  %16 = load double, double* %11, align 8
  %17 = getelementptr inbounds double, double* %3, i64 %indvars.iv6
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fadd double %15, %19
  store double %20, double* %sunkaddr20, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv6, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1900
  br i1 %exitcond, label %21, label %7

; <label>:21:                                     ; preds = %7
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next3, 2100
  br i1 %exitcond1, label %22, label %.preheader

; <label>:22:                                     ; preds = %21
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %7

; <label>:7:                                      ; preds = %13, %2
  %indvars.iv17 = phi i64 [ 0, %2 ], [ %indvars.iv.next2, %13 ]
  %8 = trunc i64 %indvars.iv17 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %7
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc5 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %13

; <label>:13:                                     ; preds = %11, %7
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %0, i64 %indvars.iv17
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next2, 1900
  br i1 %exitcond1, label %18, label %7

; <label>:18:                                     ; preds = %13
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  br label %23

; <label>:23:                                     ; preds = %29, %18
  %indvars.iv6 = phi i64 [ 0, %18 ], [ %indvars.iv.next, %29 ]
  %24 = trunc i64 %indvars.iv6 to i32
  %25 = srem i32 %24, 20
  %26 = icmp eq i32 %25, 0
  br i1 %26, label %27, label %29

; <label>:27:                                     ; preds = %23
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %28) #6
  br label %29

; <label>:29:                                     ; preds = %27, %23
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %31 = getelementptr inbounds double, double* %1, i64 %indvars.iv6
  %32 = load double, double* %31, align 8
  %33 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %32) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv6, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2100
  br i1 %exitcond, label %34, label %23

; <label>:34:                                     ; preds = %29
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %37) #6
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
