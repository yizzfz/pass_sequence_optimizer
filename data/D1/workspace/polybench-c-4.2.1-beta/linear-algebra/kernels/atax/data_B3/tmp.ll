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
  tail call fastcc void @init_array(i32 1900, i32 2100, [2100 x double]* %7, double* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @kernel_atax(i32 1900, i32 2100, [2100 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %16

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %12
  tail call fastcc void @print_array(i32 2100, double* %9)
  br label %16

; <label>:16:                                     ; preds = %12, %15, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, [2100 x double]* nocapture, double* nocapture) unnamed_addr #2 {
  br label %5

; <label>:5:                                      ; preds = %5, %4
  %indvars.iv8 = phi i64 [ 0, %4 ], [ %indvars.iv.next9.2, %5 ]
  %6 = trunc i64 %indvars.iv8 to i32
  %7 = sitofp i32 %6 to double
  %8 = fdiv double %7, 2.100000e+03
  %9 = fadd double %8, 1.000000e+00
  %10 = getelementptr inbounds double, double* %3, i64 %indvars.iv8
  store double %9, double* %10, align 8
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %11 = trunc i64 %indvars.iv.next9 to i32
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %12, 2.100000e+03
  %14 = fadd double %13, 1.000000e+00
  %15 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next9
  store double %14, double* %15, align 8
  %indvars.iv.next9.1 = add nsw i64 %indvars.iv8, 2
  %16 = trunc i64 %indvars.iv.next9.1 to i32
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 2.100000e+03
  %19 = fadd double %18, 1.000000e+00
  %20 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next9.1
  store double %19, double* %20, align 8
  %indvars.iv.next9.2 = add nsw i64 %indvars.iv8, 3
  %exitcond10.2 = icmp eq i64 %indvars.iv.next9.2, 2100
  br i1 %exitcond10.2, label %.preheader.preheader, label %5

.preheader.preheader:                             ; preds = %5
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %34
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %34 ], [ 0, %.preheader.preheader ]
  br label %21

; <label>:21:                                     ; preds = %21, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %21 ]
  %22 = add nuw nsw i64 %indvars.iv, %indvars.iv6
  %23 = trunc i64 %22 to i32
  %24 = srem i32 %23, 2100
  %25 = sitofp i32 %24 to double
  %26 = fdiv double %25, 9.500000e+03
  %27 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv6, i64 %indvars.iv
  store double %26, double* %27, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %28 = add nuw nsw i64 %indvars.iv.next, %indvars.iv6
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 2100
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %31, 9.500000e+03
  %33 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv6, i64 %indvars.iv.next
  store double %32, double* %33, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2100
  br i1 %exitcond.1, label %34, label %21

; <label>:34:                                     ; preds = %21
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond = icmp eq i64 %indvars.iv.next7, 1900
  br i1 %exitcond, label %35, label %.preheader

; <label>:35:                                     ; preds = %34
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_atax(i32, i32, [2100 x double]* nocapture readonly, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
.preheader3.preheader:
  %6 = bitcast double* %4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 16800, i32 8, i1 false)
  br label %.preheader3

.preheader3:                                      ; preds = %49, %.preheader3.preheader
  %indvars.iv11 = phi i64 [ 0, %.preheader3.preheader ], [ %indvars.iv.next12, %49 ]
  %7 = getelementptr inbounds double, double* %5, i64 %indvars.iv11
  store double 0.000000e+00, double* %7, align 8
  br label %8

; <label>:8:                                      ; preds = %8, %.preheader3
  %9 = phi double [ 0.000000e+00, %.preheader3 ], [ %27, %8 ]
  %indvars.iv = phi i64 [ 0, %.preheader3 ], [ %indvars.iv.next.2, %8 ]
  %10 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv
  %11 = load double, double* %10, align 8
  %12 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = fmul double %11, %13
  %15 = fadd double %9, %14
  store double %15, double* %7, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %16 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv.next
  %17 = load double, double* %16, align 8
  %18 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next
  %19 = load double, double* %18, align 8
  %20 = fmul double %17, %19
  %21 = fadd double %15, %20
  store double %21, double* %7, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %22 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv.next.1
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next.1
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fadd double %21, %26
  store double %27, double* %7, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next.2, 2100
  br i1 %exitcond.2, label %.preheader.preheader, label %8

.preheader.preheader:                             ; preds = %8
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.preheader..preheader_crit_edge
  %28 = phi double [ %.pre, %.preheader..preheader_crit_edge ], [ %27, %.preheader.preheader ]
  %indvars.iv8 = phi i64 [ %indvars.iv.next9.2, %.preheader..preheader_crit_edge ], [ 0, %.preheader.preheader ]
  %29 = getelementptr inbounds double, double* %4, i64 %indvars.iv8
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv8
  %32 = load double, double* %31, align 8
  %33 = fmul double %32, %28
  %34 = fadd double %30, %33
  store double %34, double* %29, align 8
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %35 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next9
  %36 = load double, double* %35, align 8
  %37 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv.next9
  %38 = load double, double* %37, align 8
  %39 = load double, double* %7, align 8
  %40 = fmul double %38, %39
  %41 = fadd double %36, %40
  store double %41, double* %35, align 8
  %indvars.iv.next9.1 = add nsw i64 %indvars.iv8, 2
  %42 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next9.1
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv.next9.1
  %45 = load double, double* %44, align 8
  %46 = load double, double* %7, align 8
  %47 = fmul double %45, %46
  %48 = fadd double %43, %47
  store double %48, double* %42, align 8
  %indvars.iv.next9.2 = add nsw i64 %indvars.iv8, 3
  %exitcond.210 = icmp eq i64 %indvars.iv.next9.2, 2100
  br i1 %exitcond.210, label %49, label %.preheader..preheader_crit_edge

.preheader..preheader_crit_edge:                  ; preds = %.preheader
  %.pre = load double, double* %7, align 8
  br label %.preheader

; <label>:49:                                     ; preds = %.preheader
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond = icmp eq i64 %indvars.iv.next12, 1900
  br i1 %exitcond, label %50, label %.preheader3

; <label>:50:                                     ; preds = %49
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %7

; <label>:7:                                      ; preds = %13, %2
  %indvars.iv = phi i64 [ 0, %2 ], [ %indvars.iv.next, %13 ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %7
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %13

; <label>:13:                                     ; preds = %11, %7
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2100
  br i1 %exitcond, label %18, label %7

; <label>:18:                                     ; preds = %13
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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
