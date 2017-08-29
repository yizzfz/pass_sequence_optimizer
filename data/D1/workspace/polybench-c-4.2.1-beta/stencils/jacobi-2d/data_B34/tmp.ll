; ModuleID = 'A.ll'
source_filename = "jacobi-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %5 = bitcast i8* %3 to [1300 x double]*
  %6 = bitcast i8* %4 to [1300 x double]*
  tail call void @init_array(i32 1300, [1300 x double]* %5, [1300 x double]* %6)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_jacobi_2d(i32 500, i32 1300, [1300 x double]* %5, [1300 x double]* %6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %7 = icmp sgt i32 %0, 42
  br i1 %7, label %8, label %._crit_edge

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %8
  tail call void @print_array(i32 1300, [1300 x double]* %5)
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %2, %11
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, [1300 x double]* nocapture, [1300 x double]* nocapture) #2 {
  %4 = icmp sgt i32 %0, 0
  br i1 %4, label %.preheader.lr.ph, label %._crit_edge4

.preheader.lr.ph:                                 ; preds = %3
  %5 = sitofp i32 %0 to double
  %6 = add i32 %0, -1
  %7 = sext i32 %0 to i64
  %wide.trip.count = zext i32 %6 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv5 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next6, %._crit_edge.us ]
  %8 = trunc i64 %indvars.iv5 to i32
  %9 = sitofp i32 %8 to double
  br label %10

; <label>:10:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 0, %.preheader.us ]
  %11 = add nuw nsw i64 %indvars.iv, 2
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = fmul double %9, %13
  %15 = fadd double %14, 2.000000e+00
  %16 = fdiv double %15, %5
  %17 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  store double %16, double* %17, align 8
  %18 = add nuw nsw i64 %indvars.iv, 3
  %19 = trunc i64 %18 to i32
  %20 = sitofp i32 %19 to double
  %21 = fmul double %9, %20
  %22 = fadd double %21, 3.000000e+00
  %23 = fdiv double %22, %5
  %24 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv5, i64 %indvars.iv
  store double %23, double* %24, align 8
  %exitcond = icmp eq i64 %indvars.iv, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge:                                      ; preds = %10
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %10

._crit_edge.us:                                   ; preds = %10
  %indvars.iv.next6 = add nuw i64 %indvars.iv5, 1
  %25 = icmp slt i64 %indvars.iv.next6, %7
  br i1 %25, label %.preheader.us, label %._crit_edge4.loopexit

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %3
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_jacobi_2d(i32, i32, [1300 x double]* nocapture, [1300 x double]* nocapture) #2 {
  %5 = icmp sgt i32 %0, 0
  br i1 %5, label %.preheader6.lr.ph, label %._crit_edge15

.preheader6.lr.ph:                                ; preds = %4
  %6 = add nsw i32 %1, -1
  %7 = icmp sgt i32 %6, 1
  %8 = add i32 %1, -2
  %9 = sext i32 %6 to i64
  %10 = sext i32 %6 to i64
  %wide.trip.count = zext i32 %8 to i64
  %11 = icmp sgt i32 %6, 1
  %wide.trip.count21 = zext i32 %8 to i64
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge13, %.preheader6.lr.ph
  %.0314 = phi i32 [ 0, %.preheader6.lr.ph ], [ %50, %._crit_edge13 ]
  br i1 %7, label %.preheader4.us.preheader, label %._crit_edge13

.preheader4.us.preheader:                         ; preds = %.preheader6
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %.preheader4.us.preheader, %._crit_edge.us
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %._crit_edge.us ], [ 1, %.preheader4.us.preheader ]
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %12 = add nsw i64 %indvars.iv17, -1
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader4.us
  %indvars.iv = phi i64 [ 1, %.preheader4.us ], [ %indvars.iv.next, %._crit_edge ]
  %13 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv17, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = add nsw i64 %indvars.iv, -1
  %16 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv17, i64 %15
  %17 = load double, double* %16, align 8
  %18 = fadd double %14, %17
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %19 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv17, i64 %indvars.iv.next
  %20 = load double, double* %19, align 8
  %21 = fadd double %18, %20
  %22 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv.next18, i64 %indvars.iv
  %23 = load double, double* %22, align 8
  %24 = fadd double %21, %23
  %25 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %12, i64 %indvars.iv
  %26 = load double, double* %25, align 8
  %27 = fadd double %24, %26
  %28 = fmul double %27, 2.000000e-01
  %29 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv17, i64 %indvars.iv
  store double %28, double* %29, align 8
  %exitcond = icmp eq i64 %indvars.iv, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %30 = icmp slt i64 %indvars.iv.next18, %9
  br i1 %30, label %.preheader4.us, label %.preheader5

.preheader5:                                      ; preds = %._crit_edge.us
  br i1 %11, label %.preheader.us.preheader, label %._crit_edge13

.preheader.us.preheader:                          ; preds = %.preheader5
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge11.us
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %._crit_edge11.us ], [ 1, %.preheader.us.preheader ]
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %31 = add nsw i64 %indvars.iv23, -1
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16, %.preheader.us
  %indvars.iv19 = phi i64 [ 1, %.preheader.us ], [ %indvars.iv.next20, %._crit_edge16 ]
  %32 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv23, i64 %indvars.iv19
  %33 = load double, double* %32, align 8
  %34 = add nsw i64 %indvars.iv19, -1
  %35 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv23, i64 %34
  %36 = load double, double* %35, align 8
  %37 = fadd double %33, %36
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %38 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv23, i64 %indvars.iv.next20
  %39 = load double, double* %38, align 8
  %40 = fadd double %37, %39
  %41 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv.next24, i64 %indvars.iv19
  %42 = load double, double* %41, align 8
  %43 = fadd double %40, %42
  %44 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %31, i64 %indvars.iv19
  %45 = load double, double* %44, align 8
  %46 = fadd double %43, %45
  %47 = fmul double %46, 2.000000e-01
  %48 = getelementptr inbounds [1300 x double], [1300 x double]* %2, i64 %indvars.iv23, i64 %indvars.iv19
  store double %47, double* %48, align 8
  %exitcond22 = icmp eq i64 %indvars.iv19, %wide.trip.count21
  br i1 %exitcond22, label %._crit_edge11.us, label %._crit_edge16

._crit_edge11.us:                                 ; preds = %._crit_edge16
  %49 = icmp slt i64 %indvars.iv.next24, %10
  br i1 %49, label %.preheader.us, label %._crit_edge13.loopexit

._crit_edge13.loopexit:                           ; preds = %._crit_edge11.us
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit, %.preheader5, %.preheader6
  %50 = add nuw nsw i32 %.0314, 1
  %51 = icmp slt i32 %50, %0
  br i1 %51, label %.preheader6, label %._crit_edge15.loopexit

._crit_edge15.loopexit:                           ; preds = %._crit_edge13
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %4
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [1300 x double]* nocapture readonly) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.preheader.us.preheader, label %._crit_edge4

.preheader.us.preheader:                          ; preds = %2
  %8 = sext i32 %0 to i64
  %9 = sext i32 %0 to i64
  %10 = sext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv6 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next7, %._crit_edge.us ]
  %11 = mul nsw i64 %indvars.iv6, %10
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %12 = add nsw i64 %indvars.iv, %11
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge

; <label>:16:                                     ; preds = %._crit_edge5
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge5, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1300 x double], [1300 x double]* %1, i64 %indvars.iv6, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #5
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %22 = icmp slt i64 %indvars.iv.next, %8
  br i1 %22, label %._crit_edge5, label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next7 = add nuw i64 %indvars.iv6, 1
  %23 = icmp slt i64 %indvars.iv.next7, %9
  br i1 %23, label %.preheader.us, label %._crit_edge4.loopexit

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %2
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %26) #5
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

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
