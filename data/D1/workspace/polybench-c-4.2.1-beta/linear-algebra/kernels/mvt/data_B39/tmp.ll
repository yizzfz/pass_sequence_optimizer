; ModuleID = 'A.ll'
source_filename = "mvt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"x1\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"x2\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  %11 = bitcast i8* %7 to double*
  %12 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(double* %8, double* %9, double* %10, double* %11, [2000 x double]* %12)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_mvt(double* %8, double* %9, double* %10, double* %11, [2000 x double]* %12)
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
  tail call fastcc void @print_array(double* %8, double* %9)
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
define internal fastcc void @init_array(double* nocapture, double* nocapture, double* nocapture, double* nocapture, [2000 x double]* nocapture) unnamed_addr #2 {
  br label %6

.loopexit:                                        ; preds = %32
  br i1 %10, label %46, label %6

; <label>:6:                                      ; preds = %.loopexit, %5
  %indvars.iv4 = phi i64 [ 0, %5 ], [ %indvars.iv.next5, %.loopexit ]
  %7 = trunc i64 %indvars.iv4 to i32
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds double, double* %0, i64 %indvars.iv4
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %10 = icmp eq i64 %indvars.iv.next5, 2000
  %11 = trunc i64 %indvars.iv.next5 to i32
  %12 = sitofp i32 %11 to double
  %13 = insertelement <2 x double> undef, double %8, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  %.op = fdiv <2 x double> %14, <double 2.000000e+03, double 2.000000e+03>
  %.op.v.r1 = extractelement <2 x double> %.op, i32 0
  %.op.v.r2 = extractelement <2 x double> %.op, i32 1
  store double %.op.v.r1, double* %9, align 8
  %15 = select i1 %10, double 0.000000e+00, double %.op.v.r2
  %16 = getelementptr inbounds double, double* %1, i64 %indvars.iv4
  store double %15, double* %16, align 8
  %17 = add nuw nsw i64 %indvars.iv4, 3
  %18 = trunc i64 %17 to i32
  %19 = srem i32 %18, 2000
  %20 = sitofp i32 %19 to double
  %21 = getelementptr inbounds double, double* %2, i64 %indvars.iv4
  %22 = add nuw nsw i64 %indvars.iv4, 4
  %23 = trunc i64 %22 to i32
  %24 = srem i32 %23, 2000
  %25 = sitofp i32 %24 to double
  %26 = insertelement <2 x double> undef, double %20, i32 0
  %27 = insertelement <2 x double> %26, double %25, i32 1
  %28 = fdiv <2 x double> %27, <double 2.000000e+03, double 2.000000e+03>
  %29 = extractelement <2 x double> %28, i32 0
  %30 = extractelement <2 x double> %28, i32 1
  store double %29, double* %21, align 8
  %31 = getelementptr inbounds double, double* %3, i64 %indvars.iv4
  store double %30, double* %31, align 8
  br label %32

; <label>:32:                                     ; preds = %32, %6
  %indvars.iv = phi i64 [ 0, %6 ], [ %indvars.iv.next.1, %32 ]
  %33 = mul nuw nsw i64 %indvars.iv, %indvars.iv4
  %34 = trunc i64 %33 to i32
  %35 = srem i32 %34, 2000
  %36 = sitofp i32 %35 to double
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %indvars.iv4, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %38 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv4
  %39 = trunc i64 %38 to i32
  %40 = srem i32 %39, 2000
  %41 = sitofp i32 %40 to double
  %42 = insertelement <2 x double> undef, double %36, i32 0
  %43 = insertelement <2 x double> %42, double %41, i32 1
  %44 = fdiv <2 x double> %43, <double 2.000000e+03, double 2.000000e+03>
  %45 = bitcast double* %37 to <2 x double>*
  store <2 x double> %44, <2 x double>* %45, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %.loopexit, label %32

; <label>:46:                                     ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_mvt(double* nocapture, double* nocapture, double* nocapture readonly, double* nocapture readonly, [2000 x double]* nocapture readonly) unnamed_addr #2 {
  br label %.preheader4

.preheader4:                                      ; preds = %21, %5
  %indvars.iv14 = phi i64 [ 0, %5 ], [ %indvars.iv.next15, %21 ]
  %6 = getelementptr inbounds double, double* %0, i64 %indvars.iv14
  %.pre = load double, double* %6, align 8
  br label %7

; <label>:7:                                      ; preds = %7, %.preheader4
  %8 = phi double [ %.pre, %.preheader4 ], [ %20, %7 ]
  %indvars.iv11 = phi i64 [ 0, %.preheader4 ], [ %indvars.iv.next12.1, %7 ]
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %indvars.iv14, i64 %indvars.iv11
  %10 = load double, double* %9, align 8
  %11 = getelementptr inbounds double, double* %2, i64 %indvars.iv11
  %12 = load double, double* %11, align 8
  %13 = fmul double %10, %12
  %14 = fadd double %8, %13
  store double %14, double* %6, align 8
  %indvars.iv.next12 = or i64 %indvars.iv11, 1
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %indvars.iv14, i64 %indvars.iv.next12
  %16 = load double, double* %15, align 8
  %17 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next12
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fadd double %14, %19
  store double %20, double* %6, align 8
  %indvars.iv.next12.1 = add nuw nsw i64 %indvars.iv11, 2
  %exitcond13.1 = icmp eq i64 %indvars.iv.next12.1, 2000
  br i1 %exitcond13.1, label %21, label %7

; <label>:21:                                     ; preds = %7
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 2000
  br i1 %exitcond16, label %.preheader.preheader, label %.preheader4

.preheader.preheader:                             ; preds = %21
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %37
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %37 ], [ 0, %.preheader.preheader ]
  %22 = getelementptr inbounds double, double* %1, i64 %indvars.iv9
  %.pre17 = load double, double* %22, align 8
  br label %23

; <label>:23:                                     ; preds = %23, %.preheader
  %24 = phi double [ %.pre17, %.preheader ], [ %36, %23 ]
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %23 ]
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %indvars.iv, i64 %indvars.iv9
  %26 = load double, double* %25, align 8
  %27 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = fadd double %24, %29
  store double %30, double* %22, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %indvars.iv.next, i64 %indvars.iv9
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = fadd double %30, %35
  store double %36, double* %22, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %37, label %23

; <label>:37:                                     ; preds = %23
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond = icmp eq i64 %indvars.iv.next10, 2000
  br i1 %exitcond, label %38, label %.preheader

; <label>:38:                                     ; preds = %37
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %7

; <label>:7:                                      ; preds = %._crit_edge, %2
  %indvars.iv6 = phi i64 [ 0, %2 ], [ %indvars.iv.next7, %._crit_edge ]
  %8 = trunc i64 %indvars.iv6 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %7
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %7, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds double, double* %0, i64 %indvars.iv6
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 2000
  br i1 %exitcond8, label %17, label %7

; <label>:17:                                     ; preds = %._crit_edge
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #6
  br label %22

; <label>:22:                                     ; preds = %._crit_edge10, %17
  %indvars.iv = phi i64 [ 0, %17 ], [ %indvars.iv.next, %._crit_edge10 ]
  %23 = trunc i64 %indvars.iv to i32
  %24 = srem i32 %23, 20
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %26, label %._crit_edge10

; <label>:26:                                     ; preds = %22
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %27) #5
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %22, %26
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %30 = load double, double* %29, align 8
  %31 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %30) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %32, label %22

; <label>:32:                                     ; preds = %._crit_edge10
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #6
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %35) #5
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
