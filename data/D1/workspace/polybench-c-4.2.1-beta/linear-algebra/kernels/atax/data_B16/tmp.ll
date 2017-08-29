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
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %7 = bitcast i8* %3 to [2100 x double]*
  %8 = bitcast i8* %4 to double*
  call void @init_array([2100 x double]* %7, double* %8)
  call void (...) @polybench_timer_start() #4
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  call void @kernel_atax([2100 x double]* %7, double* %8, double* %9, double* %10)
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
  call void @print_array(double* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array([2100 x double]* nocapture, double* nocapture) #2 {
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %2
  %indvars.iv3 = phi i64 [ 0, %2 ], [ %indvars.iv.next4.2, %._crit_edge ]
  %3 = trunc i64 %indvars.iv3 to i32
  %4 = sitofp i32 %3 to double
  %5 = getelementptr inbounds double, double* %1, i64 %indvars.iv3
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %6 = trunc i64 %indvars.iv.next4 to i32
  %7 = sitofp i32 %6 to double
  %8 = insertelement <2 x double> undef, double %4, i32 0
  %9 = insertelement <2 x double> %8, double %7, i32 1
  %10 = fdiv <2 x double> %9, <double 2.100000e+03, double 2.100000e+03>
  %11 = fadd <2 x double> %10, <double 1.000000e+00, double 1.000000e+00>
  %12 = bitcast double* %5 to <2 x double>*
  store <2 x double> %11, <2 x double>* %12, align 8
  %indvars.iv.next4.1 = add nuw nsw i64 %indvars.iv3, 2
  %13 = trunc i64 %indvars.iv.next4.1 to i32
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 2.100000e+03
  %16 = fadd double %15, 1.000000e+00
  %17 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next4.1
  store double %16, double* %17, align 8
  %indvars.iv.next4.2 = add nuw nsw i64 %indvars.iv3, 3
  %exitcond5.2 = icmp eq i64 %indvars.iv.next4.2, 2100
  br i1 %exitcond5.2, label %.preheader.preheader, label %._crit_edge

.preheader.preheader:                             ; preds = %._crit_edge
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %31
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %31 ], [ 0, %.preheader.preheader ]
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge1 ]
  %18 = add nuw nsw i64 %indvars.iv1, %indvars.iv
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, 2100
  %21 = sitofp i32 %20 to double
  %22 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %23 = add nuw nsw i64 %indvars.iv1, %indvars.iv.next
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, 2100
  %26 = sitofp i32 %25 to double
  %27 = insertelement <2 x double> undef, double %21, i32 0
  %28 = insertelement <2 x double> %27, double %26, i32 1
  %29 = fdiv <2 x double> %28, <double 9.500000e+03, double 9.500000e+03>
  %30 = bitcast double* %22 to <2 x double>*
  store <2 x double> %29, <2 x double>* %30, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2100
  br i1 %exitcond.1, label %31, label %._crit_edge1

; <label>:31:                                     ; preds = %._crit_edge1
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next2, 1900
  br i1 %exitcond, label %32, label %.preheader

; <label>:32:                                     ; preds = %31
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_atax([2100 x double]* nocapture readonly, double* nocapture readonly, double* nocapture, double* nocapture) #2 {
  %5 = bitcast double* %2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 16800, i32 8, i1 false)
  %sunkaddr = ptrtoint double* %3 to i64
  %sunkaddr19 = ptrtoint double* %3 to i64
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %47, %4
  %indvars.iv4 = phi i64 [ 0, %4 ], [ %indvars.iv.next5, %47 ]
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv4
  store double 0.000000e+00, double* %6, align 8
  %sunkaddr16 = shl nuw nsw i64 %indvars.iv4, 3
  %sunkaddr17 = add i64 %sunkaddr, %sunkaddr16
  %sunkaddr18 = inttoptr i64 %sunkaddr17 to double*
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge2
  %indvars.iv = phi i64 [ 0, %._crit_edge2 ], [ %indvars.iv.next.2, %._crit_edge ]
  %7 = load double, double* %sunkaddr18, align 8
  %8 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv
  %9 = load double, double* %8, align 8
  %10 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %11 = load double, double* %10, align 8
  %12 = fmul double %9, %11
  %13 = fadd double %7, %12
  store double %13, double* %sunkaddr18, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %14 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv.next
  %15 = load double, double* %14, align 8
  %16 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fadd double %13, %18
  store double %19, double* %sunkaddr18, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %20 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv.next.1
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.1
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = fadd double %19, %24
  store double %25, double* %sunkaddr18, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next.2, 2100
  br i1 %exitcond.2, label %.preheader.preheader, label %._crit_edge

.preheader.preheader:                             ; preds = %._crit_edge
  %sunkaddr20 = shl nuw nsw i64 %indvars.iv4, 3
  %sunkaddr21 = add i64 %sunkaddr19, %sunkaddr20
  %sunkaddr22 = inttoptr i64 %sunkaddr21 to double*
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.preheader
  %indvars.iv1 = phi i64 [ %indvars.iv.next2.2, %.preheader ], [ 0, %.preheader.preheader ]
  %26 = getelementptr inbounds double, double* %2, i64 %indvars.iv1
  %27 = load double, double* %26, align 8
  %28 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv1
  %29 = load double, double* %28, align 8
  %30 = load double, double* %sunkaddr22, align 8
  %31 = fmul double %29, %30
  %32 = fadd double %27, %31
  store double %32, double* %26, align 8
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %33 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next2
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv.next2
  %36 = load double, double* %35, align 8
  %37 = load double, double* %sunkaddr22, align 8
  %38 = fmul double %36, %37
  %39 = fadd double %34, %38
  store double %39, double* %33, align 8
  %indvars.iv.next2.1 = add nuw nsw i64 %indvars.iv1, 2
  %40 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next2.1
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv.next2.1
  %43 = load double, double* %42, align 8
  %44 = load double, double* %sunkaddr22, align 8
  %45 = fmul double %43, %44
  %46 = fadd double %41, %45
  store double %46, double* %40, align 8
  %indvars.iv.next2.2 = add nuw nsw i64 %indvars.iv1, 3
  %exitcond.23 = icmp eq i64 %indvars.iv.next2.2, 2100
  br i1 %exitcond.23, label %47, label %.preheader

; <label>:47:                                     ; preds = %.preheader
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond = icmp eq i64 %indvars.iv.next5, 1900
  br i1 %exitcond, label %48, label %._crit_edge2

; <label>:48:                                     ; preds = %47
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(double* nocapture readonly) #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge, %1
  %indvars.iv = phi i64 [ 0, %1 ], [ %indvars.iv.next, %._crit_edge ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %._crit_edge1
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %10) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge1, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2100
  br i1 %exitcond, label %15, label %._crit_edge1

; <label>:15:                                     ; preds = %._crit_edge
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
