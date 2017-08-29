; ModuleID = 'A.ll'
source_filename = "seidel-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_seidel_2d(i32 500, i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call void @print_array(i32 2000, [2000 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, [2000 x double]* nocapture) #2 {
  br label %.preheader

.preheader:                                       ; preds = %20, %2
  %indvars.iv1 = phi i64 [ 0, %2 ], [ %indvars.iv.next2, %20 ]
  %3 = trunc i64 %indvars.iv1 to i32
  %4 = sitofp i32 %3 to double
  br label %5

; <label>:5:                                      ; preds = %5, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %5 ]
  %6 = add nuw nsw i64 %indvars.iv, 2
  %7 = trunc i64 %6 to i32
  %8 = sitofp i32 %7 to double
  %9 = fmul double %4, %8
  %10 = fadd double %9, 2.000000e+00
  %11 = fdiv double %10, 2.000000e+03
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1, i64 %indvars.iv
  store double %11, double* %12, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %13 = add nuw nsw i64 %indvars.iv, 3
  %14 = trunc i64 %13 to i32
  %15 = sitofp i32 %14 to double
  %16 = fmul double %4, %15
  %17 = fadd double %16, 2.000000e+00
  %18 = fdiv double %17, 2.000000e+03
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1, i64 %indvars.iv.next
  store double %18, double* %19, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %20, label %5

; <label>:20:                                     ; preds = %5
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond, label %21, label %.preheader

; <label>:21:                                     ; preds = %20
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_seidel_2d(i32, i32, [2000 x double]* nocapture) #2 {
  br label %.preheader2

.preheader2:                                      ; preds = %._crit_edge3, %3
  %.04 = phi i32 [ 0, %3 ], [ %33, %._crit_edge3 ]
  br label %.preheader

.preheader:                                       ; preds = %.preheader2, %._crit_edge
  %indvar = phi i64 [ 0, %.preheader2 ], [ %indvar.next, %._crit_edge ]
  %indvars.iv5 = phi i64 [ 1, %.preheader2 ], [ %indvars.iv.next6, %._crit_edge ]
  %4 = add nuw nsw i64 %indvar, 1
  %scevgep = getelementptr [2000 x double], [2000 x double]* %2, i64 %4, i64 0
  %5 = add nsw i64 %indvars.iv5, -1
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %load_initial = load double, double* %scevgep, align 8
  br label %6

; <label>:6:                                      ; preds = %.preheader, %6
  %store_forwarded = phi double [ %load_initial, %.preheader ], [ %32, %6 ]
  %indvars.iv = phi i64 [ 1, %.preheader ], [ %indvars.iv.next, %6 ]
  %7 = add nsw i64 %indvars.iv, -1
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %5, i64 %7
  %9 = load double, double* %8, align 8
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %5, i64 %indvars.iv
  %11 = load double, double* %10, align 8
  %12 = fadd double %9, %11
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %5, i64 %indvars.iv.next
  %14 = load double, double* %13, align 8
  %15 = fadd double %12, %14
  %16 = fadd double %15, %store_forwarded
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv5, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = fadd double %16, %18
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv5, i64 %indvars.iv.next
  %21 = load double, double* %20, align 8
  %22 = fadd double %19, %21
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv.next6, i64 %7
  %24 = load double, double* %23, align 8
  %25 = fadd double %22, %24
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv.next6, i64 %indvars.iv
  %27 = load double, double* %26, align 8
  %28 = fadd double %25, %27
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv.next6, i64 %indvars.iv.next
  %30 = load double, double* %29, align 8
  %31 = fadd double %28, %30
  %32 = fdiv double %31, 9.000000e+00
  store double %32, double* %17, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1999
  br i1 %exitcond, label %._crit_edge, label %6

._crit_edge:                                      ; preds = %6
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1999
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %exitcond7, label %._crit_edge3, label %.preheader

._crit_edge3:                                     ; preds = %._crit_edge
  %33 = add nuw nsw i32 %.04, 1
  %exitcond8 = icmp eq i32 %33, 500
  br i1 %exitcond8, label %34, label %.preheader2

; <label>:34:                                     ; preds = %._crit_edge3
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [2000 x double]* nocapture readonly) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader

.preheader:                                       ; preds = %19, %2
  %indvars.iv1 = phi i64 [ 0, %2 ], [ %indvars.iv.next2, %19 ]
  %7 = mul nuw nsw i64 %indvars.iv1, 2000
  br label %8

; <label>:8:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %9 = add nuw nsw i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %19, label %8

; <label>:19:                                     ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond3, label %20, label %.preheader

; <label>:20:                                     ; preds = %19
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
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
