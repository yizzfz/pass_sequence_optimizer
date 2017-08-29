; ModuleID = 'A.ll'
source_filename = "bicg.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"s\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %8 = bitcast i8* %3 to [1900 x double]*
  %9 = bitcast i8* %7 to double*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array([1900 x double]* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = bitcast i8* %4 to double*
  %12 = bitcast i8* %5 to double*
  tail call fastcc void @kernel_bicg([1900 x double]* %8, double* %11, double* %12, double* %10, double* %9)
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
  tail call fastcc void @print_array(double* %11, double* %12)
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
define internal fastcc void @init_array([1900 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #2 {
  br label %4

; <label>:4:                                      ; preds = %4, %3
  %indvars.iv5 = phi i64 [ 0, %3 ], [ %indvars.iv.next6.1, %4 ]
  %5 = trunc i64 %indvars.iv5 to i32
  %6 = sitofp i32 %5 to double
  %7 = fdiv double %6, 1.900000e+03
  %8 = getelementptr inbounds double, double* %2, i64 %indvars.iv5
  store double %7, double* %8, align 8
  %indvars.iv.next6 = or i64 %indvars.iv5, 1
  %9 = trunc i64 %indvars.iv.next6 to i32
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 1.900000e+03
  %12 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next6
  store double %11, double* %12, align 8
  %exitcond7.1 = icmp eq i64 %indvars.iv.next6, 1899
  %indvars.iv.next6.1 = add nsw i64 %indvars.iv5, 2
  br i1 %exitcond7.1, label %.preheader.preheader, label %4

.preheader.preheader:                             ; preds = %4
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %29
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %29 ], [ 0, %.preheader.preheader ]
  %13 = trunc i64 %indvars.iv3 to i32
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 2.100000e+03
  %16 = getelementptr inbounds double, double* %1, i64 %indvars.iv3
  store double %15, double* %16, align 8
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge1 ]
  %indvars.iv.next = or i64 %indvars.iv, 1
  %17 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv3
  %18 = trunc i64 %17 to i32
  %19 = srem i32 %18, 2100
  %20 = sitofp i32 %19 to double
  %21 = fdiv double %20, 2.100000e+03
  %22 = getelementptr inbounds [1900 x double], [1900 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv
  store double %21, double* %22, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %23 = mul nuw nsw i64 %indvars.iv.next.1, %indvars.iv3
  %24 = trunc i64 %23 to i32
  %25 = srem i32 %24, 2100
  %26 = sitofp i32 %25 to double
  %27 = fdiv double %26, 2.100000e+03
  %28 = getelementptr inbounds [1900 x double], [1900 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv.next
  store double %27, double* %28, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 1899
  br i1 %exitcond.1, label %29, label %._crit_edge1

; <label>:29:                                     ; preds = %._crit_edge1
  %indvars.iv.next4 = add nuw i64 %indvars.iv3, 1
  %30 = icmp slt i64 %indvars.iv.next4, 2100
  br i1 %30, label %.preheader, label %31

; <label>:31:                                     ; preds = %29
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_bicg([1900 x double]* nocapture readonly, double* nocapture, double* nocapture, double* nocapture readonly, double* nocapture readonly) unnamed_addr #0 {
..preheader_crit_edge:
  %5 = bitcast double* %1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 15200, i32 8, i1 false)
  br label %.preheader

.preheader:                                       ; preds = %22, %..preheader_crit_edge
  %indvars.iv3 = phi i64 [ 0, %..preheader_crit_edge ], [ %indvars.iv.next4, %22 ]
  %6 = getelementptr inbounds double, double* %2, i64 %indvars.iv3
  store double 0.000000e+00, double* %6, align 8
  %7 = getelementptr inbounds double, double* %4, i64 %indvars.iv3
  br label %8

; <label>:8:                                      ; preds = %8, %.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %8 ], [ 0, %.preheader ]
  %9 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %10 = load double, double* %9, align 8
  %11 = load double, double* %7, align 8
  %12 = getelementptr inbounds [1900 x double], [1900 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = fmul double %11, %13
  %15 = fadd double %10, %14
  store double %15, double* %9, align 8
  %16 = load double, double* %6, align 8
  %17 = load double, double* %12, align 8
  %18 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = fmul double %17, %19
  %21 = fadd double %16, %20
  store double %21, double* %6, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1899
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %22, label %8

; <label>:22:                                     ; preds = %8
  %indvars.iv.next4 = add nuw i64 %indvars.iv3, 1
  %23 = icmp slt i64 %indvars.iv.next4, 2100
  br i1 %23, label %.preheader, label %24

; <label>:24:                                     ; preds = %22
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge, %2
  %indvars.iv4 = phi i64 [ 0, %2 ], [ %indvars.iv.next5, %._crit_edge ]
  %7 = trunc i64 %indvars.iv4 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %._crit_edge1
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge1, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds double, double* %0, i64 %indvars.iv4
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #7
  %indvars.iv.next5 = add nuw i64 %indvars.iv4, 1
  %16 = icmp slt i64 %indvars.iv.next5, 1900
  br i1 %16, label %._crit_edge1, label %17

; <label>:17:                                     ; preds = %._crit_edge
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge2, %17
  %indvars.iv = phi i64 [ 0, %17 ], [ %indvars.iv.next, %._crit_edge2 ]
  %22 = trunc i64 %indvars.iv to i32
  %23 = srem i32 %22, 20
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %._crit_edge2

; <label>:25:                                     ; preds = %._crit_edge3
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %26) #6
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge3, %25
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %29 = load double, double* %28, align 8
  %30 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %29) #7
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %31 = icmp slt i64 %indvars.iv.next, 2100
  br i1 %31, label %._crit_edge3, label %32

; <label>:32:                                     ; preds = %._crit_edge2
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %33, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %35) #6
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
