; ModuleID = 'A.ll'
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
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array([2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #4
  %5 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @kernel_seidel_2d([2000 x double]* %5)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %6 = icmp sgt i32 %0, 42
  br i1 %6, label %7, label %._crit_edge

; <label>:7:                                      ; preds = %2
  %8 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %8, align 1
  %9 = icmp eq i8 %strcmpload, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %7
  %11 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array([2000 x double]* %11)
  br label %._crit_edge

._crit_edge:                                      ; preds = %7, %2, %10
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture) unnamed_addr #2 {
  br label %.preheader

.preheader:                                       ; preds = %20, %1
  %indvars.iv3 = phi i64 [ 0, %1 ], [ %indvars.iv.next4, %20 ]
  %2 = trunc i64 %indvars.iv3 to i32
  %3 = sitofp i32 %2 to double
  %4 = insertelement <2 x double> undef, double %3, i32 0
  %5 = shufflevector <2 x double> %4, <2 x double> undef, <2 x i32> zeroinitializer
  br label %6

; <label>:6:                                      ; preds = %6, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %6 ]
  %7 = add nuw nsw i64 %indvars.iv, 2
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv
  %11 = add nuw nsw i64 %indvars.iv, 3
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fmul <2 x double> %5, %15
  %17 = fadd <2 x double> %16, <double 2.000000e+00, double 2.000000e+00>
  %18 = fdiv <2 x double> %17, <double 2.000000e+03, double 2.000000e+03>
  %19 = bitcast double* %10 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %20, label %6

; <label>:20:                                     ; preds = %6
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond = icmp eq i64 %indvars.iv.next4, 2000
  br i1 %exitcond, label %21, label %.preheader

; <label>:21:                                     ; preds = %20
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_seidel_2d([2000 x double]* nocapture) unnamed_addr #2 {
  br label %.preheader40

.preheader40:                                     ; preds = %36, %1
  %.0393 = phi i32 [ 0, %1 ], [ %37, %36 ]
  br label %.preheader

.preheader:                                       ; preds = %35, %.preheader40
  %indvar = phi i64 [ %indvar.next, %35 ], [ 0, %.preheader40 ]
  %indvars.iv4 = phi i64 [ %indvars.iv.next5, %35 ], [ 1, %.preheader40 ]
  %2 = add i64 %indvar, 1
  %scevgep = getelementptr [2000 x double], [2000 x double]* %0, i64 %2, i64 0
  %3 = add nsw i64 %indvars.iv4, -1
  %4 = add nsw i64 %indvars.iv4, -1
  %5 = add nsw i64 %indvars.iv4, -1
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %load_initial = load double, double* %scevgep, align 8
  br label %6

; <label>:6:                                      ; preds = %6, %.preheader
  %store_forwarded = phi double [ %load_initial, %.preheader ], [ %33, %6 ]
  %indvars.iv = phi i64 [ 1, %.preheader ], [ %indvars.iv.next, %6 ]
  %7 = add nsw i64 %indvars.iv, -1
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %3, i64 %7
  %9 = load double, double* %8, align 8
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %4, i64 %indvars.iv
  %11 = load double, double* %10, align 8
  %12 = fadd double %9, %11
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %5, i64 %indvars.iv.next
  %14 = load double, double* %13, align 8
  %15 = fadd double %12, %14
  %16 = fadd double %15, %store_forwarded
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = fadd double %16, %18
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv.next
  %21 = load double, double* %20, align 8
  %22 = fadd double %19, %21
  %23 = add nsw i64 %indvars.iv, -1
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next5, i64 %23
  %25 = load double, double* %24, align 8
  %26 = fadd double %22, %25
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next5, i64 %indvars.iv
  %28 = load double, double* %27, align 8
  %29 = fadd double %26, %28
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next5, i64 %indvars.iv.next
  %31 = load double, double* %30, align 8
  %32 = fadd double %29, %31
  %33 = fdiv double %32, 9.000000e+00
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv
  store double %33, double* %34, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1999
  br i1 %exitcond, label %35, label %6

; <label>:35:                                     ; preds = %6
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1999
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond6, label %36, label %.preheader

; <label>:36:                                     ; preds = %35
  %37 = add nuw nsw i32 %.0393, 1
  %exitcond7 = icmp eq i32 %37, 500
  br i1 %exitcond7, label %38, label %.preheader40

; <label>:38:                                     ; preds = %36
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader

.preheader:                                       ; preds = %18, %1
  %indvars.iv3 = phi i64 [ 0, %1 ], [ %indvars.iv.next4, %18 ]
  %6 = mul nuw nsw i64 %indvars.iv3, 2000
  br label %7

; <label>:7:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %8 = add nuw nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %7, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %18, label %7

; <label>:18:                                     ; preds = %._crit_edge
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 2000
  br i1 %exitcond5, label %19, label %.preheader

; <label>:19:                                     ; preds = %18
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
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
