; ModuleID = 'A.ll'
source_filename = "heat-3d.c"
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
  %3 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %5 = bitcast i8* %3 to [120 x [120 x double]]*
  %6 = bitcast i8* %4 to [120 x [120 x double]]*
  tail call void @init_array([120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_heat_3d([120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
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
  tail call void @print_array([120 x [120 x double]]* %5)
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %2, %11
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array([120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) #2 {
  br label %.preheader23

.preheader23:                                     ; preds = %20, %2
  %indvars.iv3 = phi i64 [ 0, %2 ], [ %indvars.iv.next4, %20 ]
  %3 = add nuw nsw i64 %indvars.iv3, 120
  br label %.preheader

.preheader:                                       ; preds = %19, %.preheader23
  %indvars.iv1 = phi i64 [ 0, %.preheader23 ], [ %indvars.iv.next2, %19 ]
  %4 = add nuw nsw i64 %3, %indvars.iv1
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge ]
  %5 = sub nuw nsw i64 %4, %indvars.iv
  %6 = trunc i64 %5 to i32
  %7 = sitofp i32 %6 to double
  %8 = fmul double %7, 1.000000e+01
  %9 = fdiv double %8, 1.200000e+02
  %10 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv3, i64 %indvars.iv1, i64 %indvars.iv
  store double %9, double* %10, align 8
  %11 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv3, i64 %indvars.iv1, i64 %indvars.iv
  store double %9, double* %11, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %12 = sub nuw nsw i64 %4, %indvars.iv.next
  %13 = trunc i64 %12 to i32
  %14 = sitofp i32 %13 to double
  %15 = fmul double %14, 1.000000e+01
  %16 = fdiv double %15, 1.200000e+02
  %17 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv3, i64 %indvars.iv1, i64 %indvars.iv.next
  store double %16, double* %17, align 8
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv3, i64 %indvars.iv1, i64 %indvars.iv.next
  store double %16, double* %18, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next2, 120
  br i1 %exitcond, label %20, label %.preheader

; <label>:20:                                     ; preds = %19
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 120
  br i1 %exitcond5, label %21, label %.preheader23

; <label>:21:                                     ; preds = %20
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_heat_3d([120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) #2 {
  br label %.preheader116

.preheader116:                                    ; preds = %75, %2
  %.0111123 = phi i32 [ 1, %2 ], [ %76, %75 ]
  br label %.preheader114

.preheader114:                                    ; preds = %38, %.preheader116
  %indvars.iv4 = phi i64 [ 1, %.preheader116 ], [ %3, %38 ]
  %3 = add nuw nsw i64 %indvars.iv4, 1
  %4 = add nsw i64 %indvars.iv4, -1
  br label %.preheader112

.preheader112:                                    ; preds = %37, %.preheader114
  %indvars.iv1 = phi i64 [ 1, %.preheader114 ], [ %5, %37 ]
  %5 = add nuw nsw i64 %indvars.iv1, 1
  %6 = add nsw i64 %indvars.iv1, -1
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader112
  %indvars.iv = phi i64 [ 1, %.preheader112 ], [ %25, %._crit_edge ]
  %7 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %3, i64 %indvars.iv1, i64 %indvars.iv
  %8 = load double, double* %7, align 8
  %9 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv4, i64 %indvars.iv1, i64 %indvars.iv
  %10 = load double, double* %9, align 8
  %11 = fmul double %10, 2.000000e+00
  %12 = fsub double %8, %11
  %13 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %4, i64 %indvars.iv1, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = fadd double %14, %12
  %16 = fmul double %15, 1.250000e-01
  %17 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv4, i64 %5, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = fsub double %18, %11
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv4, i64 %6, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = fadd double %21, %19
  %23 = fmul double %22, 1.250000e-01
  %24 = fadd double %16, %23
  %25 = add nuw nsw i64 %indvars.iv, 1
  %26 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv4, i64 %indvars.iv1, i64 %25
  %27 = load double, double* %26, align 8
  %28 = fsub double %27, %11
  %29 = add nsw i64 %indvars.iv, -1
  %30 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv4, i64 %indvars.iv1, i64 %29
  %31 = load double, double* %30, align 8
  %32 = fadd double %31, %28
  %33 = fmul double %32, 1.250000e-01
  %34 = fadd double %24, %33
  %35 = fadd double %10, %34
  %36 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv4, i64 %indvars.iv1, i64 %indvars.iv
  store double %35, double* %36, align 8
  %exitcond = icmp eq i64 %25, 119
  br i1 %exitcond, label %37, label %._crit_edge

; <label>:37:                                     ; preds = %._crit_edge
  %exitcond3 = icmp eq i64 %5, 119
  br i1 %exitcond3, label %38, label %.preheader112

; <label>:38:                                     ; preds = %37
  %exitcond6 = icmp eq i64 %3, 119
  br i1 %exitcond6, label %.preheader113.preheader, label %.preheader114

.preheader113.preheader:                          ; preds = %38
  br label %.preheader113

.preheader113:                                    ; preds = %.preheader113.preheader, %74
  %indvars.iv13 = phi i64 [ %39, %74 ], [ 1, %.preheader113.preheader ]
  %39 = add nuw nsw i64 %indvars.iv13, 1
  %40 = add nsw i64 %indvars.iv13, -1
  br label %.preheader

.preheader:                                       ; preds = %73, %.preheader113
  %indvars.iv10 = phi i64 [ 1, %.preheader113 ], [ %41, %73 ]
  %41 = add nuw nsw i64 %indvars.iv10, 1
  %42 = add nsw i64 %indvars.iv10, -1
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17, %.preheader
  %indvars.iv7 = phi i64 [ 1, %.preheader ], [ %61, %._crit_edge17 ]
  %43 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %39, i64 %indvars.iv10, i64 %indvars.iv7
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv13, i64 %indvars.iv10, i64 %indvars.iv7
  %46 = load double, double* %45, align 8
  %47 = fmul double %46, 2.000000e+00
  %48 = fsub double %44, %47
  %49 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %40, i64 %indvars.iv10, i64 %indvars.iv7
  %50 = load double, double* %49, align 8
  %51 = fadd double %50, %48
  %52 = fmul double %51, 1.250000e-01
  %53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv13, i64 %41, i64 %indvars.iv7
  %54 = load double, double* %53, align 8
  %55 = fsub double %54, %47
  %56 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv13, i64 %42, i64 %indvars.iv7
  %57 = load double, double* %56, align 8
  %58 = fadd double %57, %55
  %59 = fmul double %58, 1.250000e-01
  %60 = fadd double %52, %59
  %61 = add nuw nsw i64 %indvars.iv7, 1
  %62 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv13, i64 %indvars.iv10, i64 %61
  %63 = load double, double* %62, align 8
  %64 = fsub double %63, %47
  %65 = add nsw i64 %indvars.iv7, -1
  %66 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv13, i64 %indvars.iv10, i64 %65
  %67 = load double, double* %66, align 8
  %68 = fadd double %67, %64
  %69 = fmul double %68, 1.250000e-01
  %70 = fadd double %60, %69
  %71 = fadd double %46, %70
  %72 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv13, i64 %indvars.iv10, i64 %indvars.iv7
  store double %71, double* %72, align 8
  %exitcond9 = icmp eq i64 %61, 119
  br i1 %exitcond9, label %73, label %._crit_edge17

; <label>:73:                                     ; preds = %._crit_edge17
  %exitcond12 = icmp eq i64 %41, 119
  br i1 %exitcond12, label %74, label %.preheader

; <label>:74:                                     ; preds = %73
  %exitcond15 = icmp eq i64 %39, 119
  br i1 %exitcond15, label %75, label %.preheader113

; <label>:75:                                     ; preds = %74
  %76 = add nuw nsw i32 %.0111123, 1
  %exitcond16 = icmp eq i32 %76, 501
  br i1 %exitcond16, label %77, label %.preheader116

; <label>:77:                                     ; preds = %75
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([120 x [120 x double]]* nocapture readonly) #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader20

.preheader20:                                     ; preds = %20, %1
  %indvars.iv4 = phi i64 [ 0, %1 ], [ %indvars.iv.next5, %20 ]
  %6 = mul nuw nsw i64 %indvars.iv4, 120
  br label %.preheader

.preheader:                                       ; preds = %19, %.preheader20
  %indvars.iv1 = phi i64 [ 0, %.preheader20 ], [ %indvars.iv.next2, %19 ]
  %7 = add nuw nsw i64 %indvars.iv1, %6
  %8 = mul nuw nsw i64 %7, 120
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %9 = add nuw nsw i64 %indvars.iv, %8
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %._crit_edge7
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge7, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv4, i64 %indvars.iv1, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %19, label %._crit_edge7

; <label>:19:                                     ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 120
  br i1 %exitcond3, label %20, label %.preheader

; <label>:20:                                     ; preds = %19
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 120
  br i1 %exitcond6, label %21, label %.preheader20

; <label>:21:                                     ; preds = %20
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
