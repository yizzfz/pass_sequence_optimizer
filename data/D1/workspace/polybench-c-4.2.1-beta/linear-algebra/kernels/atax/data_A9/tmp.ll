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
  %3 = tail call i8* @polybench_alloc_data(i64 3990000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #3
  %7 = bitcast i8* %3 to [2100 x double]*
  %8 = bitcast i8* %4 to double*
  tail call void @init_array([2100 x double]* %7, double* %8)
  tail call void (...) @polybench_timer_start() #3
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  tail call void @kernel_atax([2100 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
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
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  tail call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array([2100 x double]*, double*) #0 {
.lr.ph28.preheader:
  br label %.lr.ph28

.lr.ph28:                                         ; preds = %.lr.ph28, %.lr.ph28.preheader
  %indvars.iv31 = phi i64 [ 0, %.lr.ph28.preheader ], [ %indvars.iv.next32.2, %.lr.ph28 ]
  %2 = trunc i64 %indvars.iv31 to i32
  %3 = sitofp i32 %2 to double
  %4 = getelementptr inbounds double, double* %1, i64 %indvars.iv31
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %5 = trunc i64 %indvars.iv.next32 to i32
  %6 = sitofp i32 %5 to double
  %7 = insertelement <2 x double> undef, double %3, i32 0
  %8 = insertelement <2 x double> %7, double %6, i32 1
  %9 = fdiv <2 x double> %8, <double 2.100000e+03, double 2.100000e+03>
  %10 = fadd <2 x double> %9, <double 1.000000e+00, double 1.000000e+00>
  %11 = bitcast double* %4 to <2 x double>*
  store <2 x double> %10, <2 x double>* %11, align 8
  %indvars.iv.next32.1 = add nuw nsw i64 %indvars.iv31, 2
  %12 = trunc i64 %indvars.iv.next32.1 to i32
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 2.100000e+03
  %15 = fadd double %14, 1.000000e+00
  %16 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next32.1
  store double %15, double* %16, align 8
  %indvars.iv.next32.2 = add nuw nsw i64 %indvars.iv31, 3
  %exitcond33.2 = icmp eq i64 %indvars.iv.next32.2, 2100
  br i1 %exitcond33.2, label %.preheader.preheader, label %.lr.ph28

.preheader.preheader:                             ; preds = %.lr.ph28
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv29 = phi i64 [ %indvars.iv.next30, %._crit_edge ], [ 0, %.preheader.preheader ]
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge1 ]
  %17 = add nuw nsw i64 %indvars.iv, %indvars.iv29
  %18 = trunc i64 %17 to i32
  %19 = srem i32 %18, 2100
  %20 = sitofp i32 %19 to double
  %21 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv29, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %22 = add nuw nsw i64 %indvars.iv.next, %indvars.iv29
  %23 = trunc i64 %22 to i32
  %24 = srem i32 %23, 2100
  %25 = sitofp i32 %24 to double
  %26 = insertelement <2 x double> undef, double %20, i32 0
  %27 = insertelement <2 x double> %26, double %25, i32 1
  %28 = fdiv <2 x double> %27, <double 9.500000e+03, double 9.500000e+03>
  %29 = bitcast double* %21 to <2 x double>*
  store <2 x double> %28, <2 x double>* %29, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2100
  br i1 %exitcond.1, label %._crit_edge, label %._crit_edge1

._crit_edge:                                      ; preds = %._crit_edge1
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond = icmp eq i64 %indvars.iv.next30, 1900
  br i1 %exitcond, label %._crit_edge25, label %.preheader

._crit_edge25:                                    ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_atax([2100 x double]*, double*, double*, double*) #0 {
.lr.ph40.preheader:
  %4 = bitcast double* %2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 16800, i32 8, i1 false)
  %sunkaddr = ptrtoint double* %3 to i64
  %sunkaddr56 = ptrtoint double* %3 to i64
  br label %.lr.ph40

.lr.ph40:                                         ; preds = %._crit_edge, %.lr.ph40.preheader
  %indvars.iv48 = phi i64 [ 0, %.lr.ph40.preheader ], [ %indvars.iv.next49, %._crit_edge ]
  %5 = getelementptr inbounds double, double* %3, i64 %indvars.iv48
  store double 0.000000e+00, double* %5, align 8
  %sunkaddr53 = shl i64 %indvars.iv48, 3
  %sunkaddr54 = add i64 %sunkaddr, %sunkaddr53
  %sunkaddr55 = inttoptr i64 %sunkaddr54 to double*
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1, %.lr.ph40
  %indvars.iv = phi i64 [ 0, %.lr.ph40 ], [ %indvars.iv.next.2, %._crit_edge1 ]
  %6 = load double, double* %sunkaddr55, align 8
  %7 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv
  %8 = load double, double* %7, align 8
  %9 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %10 = load double, double* %9, align 8
  %11 = fmul double %8, %10
  %12 = fadd double %6, %11
  store double %12, double* %sunkaddr55, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %13 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv.next
  %14 = load double, double* %13, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fadd double %12, %17
  store double %18, double* %sunkaddr55, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %19 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv.next.1
  %20 = load double, double* %19, align 8
  %21 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next.1
  %22 = load double, double* %21, align 8
  %23 = fmul double %20, %22
  %24 = fadd double %18, %23
  store double %24, double* %sunkaddr55, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next.2, 2100
  br i1 %exitcond.2, label %.lr.ph38.preheader, label %._crit_edge1

.lr.ph38.preheader:                               ; preds = %._crit_edge1
  %sunkaddr57 = shl i64 %indvars.iv48, 3
  %sunkaddr58 = add i64 %sunkaddr56, %sunkaddr57
  %sunkaddr59 = inttoptr i64 %sunkaddr58 to double*
  br label %.lr.ph38

.lr.ph38:                                         ; preds = %.lr.ph38, %.lr.ph38.preheader
  %indvars.iv45 = phi i64 [ 0, %.lr.ph38.preheader ], [ %indvars.iv.next46.2, %.lr.ph38 ]
  %25 = getelementptr inbounds double, double* %2, i64 %indvars.iv45
  %26 = load double, double* %25, align 8
  %27 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv45
  %28 = load double, double* %27, align 8
  %29 = load double, double* %sunkaddr59, align 8
  %30 = fmul double %28, %29
  %31 = fadd double %26, %30
  store double %31, double* %25, align 8
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %32 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next46
  %33 = load double, double* %32, align 8
  %34 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv.next46
  %35 = load double, double* %34, align 8
  %36 = load double, double* %sunkaddr59, align 8
  %37 = fmul double %35, %36
  %38 = fadd double %33, %37
  store double %38, double* %32, align 8
  %indvars.iv.next46.1 = add nuw nsw i64 %indvars.iv45, 2
  %39 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next46.1
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv.next46.1
  %42 = load double, double* %41, align 8
  %43 = load double, double* %sunkaddr59, align 8
  %44 = fmul double %42, %43
  %45 = fadd double %40, %44
  store double %45, double* %39, align 8
  %indvars.iv.next46.2 = add nuw nsw i64 %indvars.iv45, 3
  %exitcond.247 = icmp eq i64 %indvars.iv.next46.2, 2100
  br i1 %exitcond.247, label %._crit_edge, label %.lr.ph38

._crit_edge:                                      ; preds = %.lr.ph38
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond = icmp eq i64 %indvars.iv.next49, 1900
  br i1 %exitcond, label %._crit_edge41, label %.lr.ph40

._crit_edge41:                                    ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(double*) #0 {
.lr.ph.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph._crit_edge, %.lr.ph.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %.lr.ph._crit_edge ]
  %5 = trunc i64 %indvars.iv to i32
  %6 = srem i32 %5, 20
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %.lr.ph._crit_edge

; <label>:8:                                      ; preds = %.lr.ph
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %9) #5
  br label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %.lr.ph, %8
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %12 = load double, double* %11, align 8
  %13 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %12) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2100
  br i1 %exitcond, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %.lr.ph._crit_edge
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %16) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #2

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #2

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
