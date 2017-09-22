; ModuleID = 'B.ll'
source_filename = "seidel-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  call fastcc void @init_array([2000 x double]* %4)
  call void (...) @polybench_timer_start() #4
  call fastcc void @kernel_seidel_2d([2000 x double]* %4)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  call fastcc void @print_array([2000 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %9, %6, %2
  call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture) unnamed_addr #2 {
  br label %._crit_edge

._crit_edge:                                      ; preds = %19, %1
  %indvars.iv13 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %19 ]
  %2 = trunc i64 %indvars.iv13 to i32
  %3 = sitofp i32 %2 to double
  br label %4

; <label>:4:                                      ; preds = %4, %._crit_edge
  %indvars.iv2 = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %4 ]
  %5 = add nuw nsw i64 %indvars.iv2, 2
  %6 = trunc i64 %5 to i32
  %7 = sitofp i32 %6 to double
  %8 = fmul double %3, %7
  %9 = fadd double %8, 2.000000e+00
  %10 = fdiv double %9, 2.000000e+03
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv13, i64 %indvars.iv2
  store double %10, double* %11, align 8
  %indvars.iv.next = or i64 %indvars.iv2, 1
  %12 = add nsw i64 %indvars.iv2, 3
  %13 = trunc i64 %12 to i32
  %14 = sitofp i32 %13 to double
  %15 = fmul double %3, %14
  %16 = fadd double %15, 2.000000e+00
  %17 = fdiv double %16, 2.000000e+03
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv13, i64 %indvars.iv.next
  store double %17, double* %18, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv2, 2
  %exitcond3.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond3.1, label %19, label %4

; <label>:19:                                     ; preds = %4
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond, label %20, label %._crit_edge

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_seidel_2d([2000 x double]* nocapture) unnamed_addr #2 {
  br label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %34, %1
  %2 = phi i32 [ 0, %1 ], [ %35, %34 ]
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge, %.._crit_edge_crit_edge
  %indvar = phi i64 [ 0, %.._crit_edge_crit_edge ], [ %indvar.next, %._crit_edge ]
  %indvars.iv22 = phi i64 [ 1, %.._crit_edge_crit_edge ], [ %5, %._crit_edge ]
  %3 = add nuw nsw i64 %indvar, 1
  %scevgep = getelementptr [2000 x double], [2000 x double]* %0, i64 %3, i64 0
  %4 = add nsw i64 %indvars.iv22, -1
  %5 = add nuw nsw i64 %indvars.iv22, 1
  %load_initial = load double, double* %scevgep, align 8
  br label %6

; <label>:6:                                      ; preds = %6, %._crit_edge5
  %store_forwarded = phi double [ %load_initial, %._crit_edge5 ], [ %33, %6 ]
  %indvars.iv1 = phi i64 [ 1, %._crit_edge5 ], [ %13, %6 ]
  %7 = add nsw i64 %indvars.iv1, -1
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %4, i64 %7
  %9 = load double, double* %8, align 8
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %4, i64 %indvars.iv1
  %11 = load double, double* %10, align 8
  %12 = fadd double %9, %11
  %13 = add nuw nsw i64 %indvars.iv1, 1
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %4, i64 %13
  %15 = load double, double* %14, align 8
  %16 = fadd double %12, %15
  %17 = fadd double %16, %store_forwarded
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv22, i64 %indvars.iv1
  %19 = load double, double* %18, align 8
  %20 = fadd double %17, %19
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv22, i64 %13
  %22 = load double, double* %21, align 8
  %23 = fadd double %20, %22
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %5, i64 %7
  %25 = load double, double* %24, align 8
  %26 = fadd double %23, %25
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %5, i64 %indvars.iv1
  %28 = load double, double* %27, align 8
  %29 = fadd double %26, %28
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %5, i64 %13
  %31 = load double, double* %30, align 8
  %32 = fadd double %29, %31
  %33 = fdiv double %32, 9.000000e+00
  store double %33, double* %18, align 8
  %exitcond4 = icmp eq i64 %13, 1999
  br i1 %exitcond4, label %._crit_edge, label %6

._crit_edge:                                      ; preds = %6
  %exitcond = icmp eq i64 %5, 1999
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %exitcond, label %34, label %._crit_edge5

; <label>:34:                                     ; preds = %._crit_edge
  %35 = add nuw nsw i32 %2, 1
  %exitcond3 = icmp eq i32 %35, 500
  br i1 %exitcond3, label %36, label %.._crit_edge_crit_edge

; <label>:36:                                     ; preds = %34
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %1
  %indvars.iv13 = phi i64 [ 0, %1 ], [ %indvars.iv.next2, %18 ]
  %6 = mul nuw nsw i64 %indvars.iv13, 2000
  br label %7

; <label>:7:                                      ; preds = %._crit_edge5, %._crit_edge
  %indvars.iv2 = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next, %._crit_edge5 ]
  %8 = add nuw nsw i64 %6, %indvars.iv2
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge5

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %12, %7
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv13, i64 %indvars.iv2
  %16 = load double, double* %15, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv2, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond3, label %18, label %7

; <label>:18:                                     ; preds = %._crit_edge5
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %18
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
