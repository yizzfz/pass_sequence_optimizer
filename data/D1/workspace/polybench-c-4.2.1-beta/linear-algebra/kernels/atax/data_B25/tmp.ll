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
  %3 = tail call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %7 = bitcast i8* %3 to [2100 x double]*
  %8 = bitcast i8* %4 to double*
  tail call fastcc void @init_array([2100 x double]* %7, double* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @kernel_atax([2100 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %17

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to double*
  tail call fastcc void @print_array(double* %16)
  br label %17

; <label>:17:                                     ; preds = %12, %2, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([2100 x double]* nocapture, double* nocapture) unnamed_addr #2 {
.lr.ph5.preheader:
  br label %.lr.ph5

.lr.ph5:                                          ; preds = %.lr.ph5, %.lr.ph5.preheader
  %indvars.iv12 = phi i64 [ 0, %.lr.ph5.preheader ], [ %indvars.iv.next13.2, %.lr.ph5 ]
  %2 = trunc i64 %indvars.iv12 to i32
  %3 = sitofp i32 %2 to double
  %4 = getelementptr inbounds double, double* %1, i64 %indvars.iv12
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %5 = trunc i64 %indvars.iv.next13 to i32
  %6 = sitofp i32 %5 to double
  %7 = insertelement <2 x double> undef, double %3, i32 0
  %8 = insertelement <2 x double> %7, double %6, i32 1
  %9 = fdiv <2 x double> %8, <double 2.100000e+03, double 2.100000e+03>
  %10 = fadd <2 x double> %9, <double 1.000000e+00, double 1.000000e+00>
  %11 = bitcast double* %4 to <2 x double>*
  store <2 x double> %10, <2 x double>* %11, align 8
  %indvars.iv.next13.1 = add nuw nsw i64 %indvars.iv12, 2
  %12 = trunc i64 %indvars.iv.next13.1 to i32
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 2.100000e+03
  %15 = fadd double %14, 1.000000e+00
  %16 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next13.1
  store double %15, double* %16, align 8
  %indvars.iv.next13.2 = add nuw nsw i64 %indvars.iv12, 3
  %exitcond14.2 = icmp eq i64 %indvars.iv.next13.2, 2100
  br i1 %exitcond14.2, label %.lr.ph2.preheader, label %.lr.ph5

.lr.ph2.preheader:                                ; preds = %.lr.ph5
  br label %.lr.ph2

.lr.ph2:                                          ; preds = %.lr.ph2.preheader, %._crit_edge
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %._crit_edge ], [ 0, %.lr.ph2.preheader ]
  br label %17

; <label>:17:                                     ; preds = %17, %.lr.ph2
  %indvars.iv = phi i64 [ 0, %.lr.ph2 ], [ %indvars.iv.next.1, %17 ]
  %18 = add nuw nsw i64 %indvars.iv, %indvars.iv10
  %19 = trunc i64 %18 to i32
  %20 = srem i32 %19, 2100
  %21 = sitofp i32 %20 to double
  %22 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv10, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %23 = add nuw nsw i64 %indvars.iv.next, %indvars.iv10
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
  br i1 %exitcond.1, label %._crit_edge, label %17

._crit_edge:                                      ; preds = %17
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond = icmp eq i64 %indvars.iv.next11, 1900
  br i1 %exitcond, label %31, label %.lr.ph2

; <label>:31:                                     ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_atax([2100 x double]*, double*, double*, double*) unnamed_addr #0 {
.lr.ph5.preheader:
  %4 = alloca [2100 x double]*, align 8
  %5 = alloca double*, align 8
  %6 = alloca double*, align 8
  store [2100 x double]* %0, [2100 x double]** %4, align 8
  store double* %1, double** %5, align 8
  store double* %2, double** %6, align 8
  %7 = bitcast double* %2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 16800, i32 8, i1 false)
  %sunkaddr = ptrtoint double* %3 to i64
  %sunkaddr32 = ptrtoint double* %3 to i64
  br label %.lr.ph5

.lr.ph5:                                          ; preds = %._crit_edge3, %.lr.ph5.preheader
  %indvars.iv17 = phi i64 [ 0, %.lr.ph5.preheader ], [ %indvars.iv.next18, %._crit_edge3 ]
  %8 = getelementptr inbounds double, double* %3, i64 %indvars.iv17
  store double 0.000000e+00, double* %8, align 8
  %9 = load [2100 x double]*, [2100 x double]** %4, align 8
  %10 = load double*, double** %5, align 8
  %sunkaddr29 = shl nuw nsw i64 %indvars.iv17, 3
  %sunkaddr30 = add i64 %sunkaddr, %sunkaddr29
  %sunkaddr31 = inttoptr i64 %sunkaddr30 to double*
  br label %11

; <label>:11:                                     ; preds = %11, %.lr.ph5
  %indvars.iv = phi i64 [ 0, %.lr.ph5 ], [ %indvars.iv.next.2, %11 ]
  %12 = load double, double* %sunkaddr31, align 8
  %13 = getelementptr inbounds [2100 x double], [2100 x double]* %9, i64 %indvars.iv17, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = getelementptr inbounds double, double* %10, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fadd double %12, %17
  store double %18, double* %sunkaddr31, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %19 = getelementptr inbounds [2100 x double], [2100 x double]* %9, i64 %indvars.iv17, i64 %indvars.iv.next
  %20 = load double, double* %19, align 8
  %21 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next
  %22 = load double, double* %21, align 8
  %23 = fmul double %20, %22
  %24 = fadd double %18, %23
  store double %24, double* %sunkaddr31, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %25 = getelementptr inbounds [2100 x double], [2100 x double]* %9, i64 %indvars.iv17, i64 %indvars.iv.next.1
  %26 = load double, double* %25, align 8
  %27 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next.1
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = fadd double %24, %29
  store double %30, double* %sunkaddr31, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next.2, 2100
  br i1 %exitcond.2, label %.lr.ph2.preheader, label %11

.lr.ph2.preheader:                                ; preds = %11
  %sunkaddr33 = shl nuw nsw i64 %indvars.iv17, 3
  %sunkaddr34 = add i64 %sunkaddr32, %sunkaddr33
  %sunkaddr35 = inttoptr i64 %sunkaddr34 to double*
  br label %.lr.ph2

.lr.ph2:                                          ; preds = %.lr.ph2.preheader, %.lr.ph2
  %indvars.iv15 = phi i64 [ %indvars.iv.next16.1, %.lr.ph2 ], [ 0, %.lr.ph2.preheader ]
  %31 = load double*, double** %6, align 8
  %32 = getelementptr inbounds double, double* %31, i64 %indvars.iv15
  %33 = load double, double* %32, align 8
  %34 = load [2100 x double]*, [2100 x double]** %4, align 8
  %35 = getelementptr inbounds [2100 x double], [2100 x double]* %34, i64 %indvars.iv17, i64 %indvars.iv15
  %36 = load double, double* %35, align 8
  %37 = load double, double* %sunkaddr35, align 8
  %38 = fmul double %36, %37
  %39 = fadd double %33, %38
  store double %39, double* %32, align 8
  %indvars.iv.next16 = or i64 %indvars.iv15, 1
  %40 = load double*, double** %6, align 8
  %41 = getelementptr inbounds double, double* %40, i64 %indvars.iv.next16
  %42 = load double, double* %41, align 8
  %43 = load [2100 x double]*, [2100 x double]** %4, align 8
  %44 = getelementptr inbounds [2100 x double], [2100 x double]* %43, i64 %indvars.iv17, i64 %indvars.iv.next16
  %45 = load double, double* %44, align 8
  %46 = load double, double* %sunkaddr35, align 8
  %47 = fmul double %45, %46
  %48 = fadd double %42, %47
  store double %48, double* %41, align 8
  %indvars.iv.next16.1 = add nuw nsw i64 %indvars.iv15, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next16.1, 2100
  br i1 %exitcond.1, label %._crit_edge3, label %.lr.ph2

._crit_edge3:                                     ; preds = %.lr.ph2
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond = icmp eq i64 %indvars.iv.next18, 1900
  br i1 %exitcond, label %49, label %.lr.ph5

; <label>:49:                                     ; preds = %._crit_edge3
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
.lr.ph.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #6
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.lr.ph

.lr.ph:                                           ; preds = %10, %.lr.ph.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %10 ]
  %5 = trunc i64 %indvars.iv to i32
  %6 = srem i32 %5, 20
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %10

; <label>:8:                                      ; preds = %.lr.ph
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %9) #6
  br label %10

; <label>:10:                                     ; preds = %.lr.ph, %8
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2100
  br i1 %exitcond, label %15, label %.lr.ph

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #6
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
