; ModuleID = 'A.ll'
source_filename = "gesummv.c"
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
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1300, i32 8) #4
  %8 = tail call i8* @polybench_alloc_data(i64 1300, i32 8) #4
  %9 = tail call i8* @polybench_alloc_data(i64 1300, i32 8) #4
  %10 = bitcast i8* %5 to [1300 x double]*
  %11 = bitcast i8* %6 to [1300 x double]*
  %12 = bitcast i8* %8 to double*
  call fastcc void @init_array(double* nonnull %3, double* nonnull %4, [1300 x double]* %10, [1300 x double]* %11, double* %12)
  call void (...) @polybench_timer_start() #4
  %13 = load double, double* %3, align 8
  %14 = load double, double* %4, align 8
  %15 = bitcast i8* %5 to [1300 x double]*
  %16 = bitcast i8* %6 to [1300 x double]*
  %17 = bitcast i8* %7 to double*
  %18 = bitcast i8* %8 to double*
  %19 = bitcast i8* %9 to double*
  call fastcc void @kernel_gesummv(double %13, double %14, [1300 x double]* %15, [1300 x double]* %16, double* %17, double* %18, double* %19)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %20 = icmp sgt i32 %0, 42
  br i1 %20, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %2
  %22 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %22, align 1
  %23 = icmp eq i8 %strcmpload, 0
  br i1 %23, label %24, label %._crit_edge

; <label>:24:                                     ; preds = %21
  %25 = bitcast i8* %9 to double*
  call fastcc void @print_array(double* %25)
  br label %._crit_edge

._crit_edge:                                      ; preds = %21, %2, %24
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  call void @free(i8* %8) #4
  call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, double* nocapture, [1300 x double]* nocapture, [1300 x double]* nocapture, double* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %0, align 8
  store double 1.200000e+00, double* %1, align 8
  br label %6

; <label>:6:                                      ; preds = %29, %5
  %indvars.iv3 = phi i64 [ 0, %5 ], [ %indvars.iv.next4, %29 ]
  %7 = trunc i64 %indvars.iv3 to i32
  %8 = sitofp i32 %7 to double
  %9 = fdiv double %8, 1.300000e+03
  %10 = getelementptr inbounds double, double* %4, i64 %indvars.iv3
  store double %9, double* %10, align 8
  br label %11

; <label>:11:                                     ; preds = %11, %6
  %indvars.iv = phi i64 [ 0, %6 ], [ %indvars.iv.next, %11 ]
  %12 = mul nuw nsw i64 %indvars.iv, %indvars.iv3
  %13 = add nuw nsw i64 %12, 1
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 1300
  %16 = sitofp i32 %15 to double
  %17 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv3, i64 %indvars.iv
  %18 = mul nuw nsw i64 %indvars.iv, %indvars.iv3
  %19 = add nuw nsw i64 %18, 2
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 1300
  %22 = sitofp i32 %21 to double
  %23 = insertelement <2 x double> undef, double %16, i32 0
  %24 = insertelement <2 x double> %23, double %22, i32 1
  %25 = fdiv <2 x double> %24, <double 1.300000e+03, double 1.300000e+03>
  %26 = extractelement <2 x double> %25, i32 0
  %27 = extractelement <2 x double> %25, i32 1
  store double %26, double* %17, align 8
  %28 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv3, i64 %indvars.iv
  store double %27, double* %28, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %29, label %11

; <label>:29:                                     ; preds = %11
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 1300
  br i1 %exitcond5, label %30, label %6

; <label>:30:                                     ; preds = %29
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gesummv(double, double, [1300 x double]* nocapture readonly, [1300 x double]* nocapture readonly, double* nocapture, double* nocapture readonly, double* nocapture) unnamed_addr #2 {
  %sunkaddr = ptrtoint double* %4 to i64
  %sunkaddr9 = ptrtoint double* %4 to i64
  %sunkaddr13 = ptrtoint double* %6 to i64
  %sunkaddr17 = ptrtoint double* %6 to i64
  br label %8

; <label>:8:                                      ; preds = %26, %7
  %indvars.iv3 = phi i64 [ 0, %7 ], [ %indvars.iv.next4, %26 ]
  %9 = getelementptr inbounds double, double* %4, i64 %indvars.iv3
  store double 0.000000e+00, double* %9, align 8
  %10 = getelementptr inbounds double, double* %6, i64 %indvars.iv3
  store double 0.000000e+00, double* %10, align 8
  %sunkaddr6 = shl i64 %indvars.iv3, 3
  %sunkaddr7 = add i64 %sunkaddr, %sunkaddr6
  %sunkaddr8 = inttoptr i64 %sunkaddr7 to double*
  %sunkaddr10 = shl i64 %indvars.iv3, 3
  %sunkaddr11 = add i64 %sunkaddr9, %sunkaddr10
  %sunkaddr12 = inttoptr i64 %sunkaddr11 to double*
  %sunkaddr14 = shl i64 %indvars.iv3, 3
  %sunkaddr15 = add i64 %sunkaddr13, %sunkaddr14
  %sunkaddr16 = inttoptr i64 %sunkaddr15 to double*
  %sunkaddr18 = shl i64 %indvars.iv3, 3
  %sunkaddr19 = add i64 %sunkaddr17, %sunkaddr18
  %sunkaddr20 = inttoptr i64 %sunkaddr19 to double*
  br label %11

; <label>:11:                                     ; preds = %11, %8
  %indvars.iv = phi i64 [ 0, %8 ], [ %indvars.iv.next, %11 ]
  %12 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv3, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = getelementptr inbounds double, double* %5, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = fmul double %13, %15
  %17 = load double, double* %sunkaddr8, align 8
  %18 = fadd double %16, %17
  store double %18, double* %sunkaddr12, align 8
  %19 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv3, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = getelementptr inbounds double, double* %5, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = fmul double %20, %22
  %24 = load double, double* %sunkaddr16, align 8
  %25 = fadd double %23, %24
  store double %25, double* %sunkaddr20, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %26, label %11

; <label>:26:                                     ; preds = %11
  %27 = getelementptr inbounds double, double* %4, i64 %indvars.iv3
  %28 = load double, double* %27, align 8
  %29 = fmul double %28, %0
  %30 = getelementptr inbounds double, double* %6, i64 %indvars.iv3
  %31 = load double, double* %30, align 8
  %32 = fmul double %31, %1
  %33 = fadd double %29, %32
  %34 = getelementptr inbounds double, double* %6, i64 %indvars.iv3
  store double %33, double* %34, align 8
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 1300
  br i1 %exitcond5, label %35, label %8

; <label>:35:                                     ; preds = %26
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
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
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %16, label %6

; <label>:16:                                     ; preds = %._crit_edge
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
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
