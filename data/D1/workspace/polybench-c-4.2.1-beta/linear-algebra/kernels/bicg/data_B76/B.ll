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
.lr.ph15:
  br label %3

; <label>:3:                                      ; preds = %3, %.lr.ph15
  %indvars.iv513 = phi i64 [ 0, %.lr.ph15 ], [ %indvars.iv.next6.1, %3 ]
  %4 = trunc i64 %indvars.iv513 to i32
  %5 = srem i32 %4, 1900
  %6 = sitofp i32 %5 to double
  %7 = fdiv double %6, 1.900000e+03
  %8 = getelementptr inbounds double, double* %2, i64 %indvars.iv513
  store double %7, double* %8, align 8
  %indvars.iv.next6 = or i64 %indvars.iv513, 1
  %9 = trunc i64 %indvars.iv.next6 to i32
  %10 = srem i32 %9, 1900
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 1.900000e+03
  %13 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next6
  store double %12, double* %13, align 8
  %exitcond20.1 = icmp eq i64 %indvars.iv.next6, 1899
  %indvars.iv.next6.1 = add nsw i64 %indvars.iv513, 2
  br i1 %exitcond20.1, label %.lr.ph11.split.us.preheader, label %3

.lr.ph11.split.us.preheader:                      ; preds = %3
  br label %.lr.ph11.split.us

.lr.ph11.split.us:                                ; preds = %.lr.ph11.split.us.preheader, %._crit_edge.us
  %indvars.iv38.us = phi i64 [ %indvars.iv.next4.us, %._crit_edge.us ], [ 0, %.lr.ph11.split.us.preheader ]
  %14 = trunc i64 %indvars.iv38.us to i32
  %15 = srem i32 %14, 2100
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 2.100000e+03
  %18 = getelementptr inbounds double, double* %1, i64 %indvars.iv38.us
  store double %17, double* %18, align 8
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge18, %.lr.ph11.split.us
  %indvars.iv7.us = phi i64 [ 0, %.lr.ph11.split.us ], [ %indvars.iv.next.us.1, %._crit_edge18 ]
  %indvars.iv.next.us = or i64 %indvars.iv7.us, 1
  %19 = mul nuw nsw i64 %indvars.iv.next.us, %indvars.iv38.us
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 2100
  %22 = sitofp i32 %21 to double
  %23 = fdiv double %22, 2.100000e+03
  %24 = getelementptr inbounds [1900 x double], [1900 x double]* %0, i64 %indvars.iv38.us, i64 %indvars.iv7.us
  store double %23, double* %24, align 8
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv7.us, 2
  %25 = mul nuw nsw i64 %indvars.iv.next.us.1, %indvars.iv38.us
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 2100
  %28 = sitofp i32 %27 to double
  %29 = fdiv double %28, 2.100000e+03
  %30 = getelementptr inbounds [1900 x double], [1900 x double]* %0, i64 %indvars.iv38.us, i64 %indvars.iv.next.us
  store double %29, double* %30, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.us, 1899
  br i1 %exitcond.1, label %._crit_edge.us, label %._crit_edge18

._crit_edge.us:                                   ; preds = %._crit_edge18
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv38.us, 1
  %31 = icmp slt i64 %indvars.iv.next4.us, 2100
  br i1 %31, label %.lr.ph11.split.us, label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_bicg([1900 x double]* nocapture readonly, double* nocapture, double* nocapture, double* nocapture readonly, double* nocapture readonly) unnamed_addr #2 {
..lr.ph15_crit_edge:
  %5 = bitcast double* %1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 15200, i32 8, i1 false)
  br label %.lr.ph11.split.us

.lr.ph11.split.us:                                ; preds = %._crit_edge.us, %..lr.ph15_crit_edge
  %indvars.iv38.us = phi i64 [ 0, %..lr.ph15_crit_edge ], [ %indvars.iv.next4.us, %._crit_edge.us ]
  %6 = getelementptr inbounds double, double* %2, i64 %indvars.iv38.us
  store double 0.000000e+00, double* %6, align 8
  %7 = getelementptr inbounds double, double* %4, i64 %indvars.iv38.us
  br label %8

; <label>:8:                                      ; preds = %8, %.lr.ph11.split.us
  %indvars.iv7.us = phi i64 [ 0, %.lr.ph11.split.us ], [ %indvars.iv.next.us, %8 ]
  %9 = getelementptr inbounds double, double* %1, i64 %indvars.iv7.us
  %10 = load double, double* %9, align 8
  %11 = load double, double* %7, align 8
  %12 = getelementptr inbounds [1900 x double], [1900 x double]* %0, i64 %indvars.iv38.us, i64 %indvars.iv7.us
  %13 = load double, double* %12, align 8
  %14 = fmul double %11, %13
  %15 = fadd double %10, %14
  store double %15, double* %9, align 8
  %16 = load double, double* %6, align 8
  %17 = load double, double* %12, align 8
  %18 = getelementptr inbounds double, double* %3, i64 %indvars.iv7.us
  %19 = load double, double* %18, align 8
  %20 = fmul double %17, %19
  %21 = fadd double %16, %20
  store double %21, double* %6, align 8
  %exitcond = icmp eq i64 %indvars.iv7.us, 1899
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv7.us, 1
  br i1 %exitcond, label %._crit_edge.us, label %8

._crit_edge.us:                                   ; preds = %8
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv38.us, 1
  %22 = icmp slt i64 %indvars.iv.next4.us, 2100
  br i1 %22, label %.lr.ph11.split.us, label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly, double* nocapture readonly) unnamed_addr #0 {
.lr.ph10.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.lr.ph10

.lr.ph10:                                         ; preds = %.lr.ph10.preheader, %.lr.ph10._crit_edge
  %indvars.iv58 = phi i64 [ %indvars.iv.next6, %.lr.ph10._crit_edge ], [ 0, %.lr.ph10.preheader ]
  %6 = trunc i64 %indvars.iv58 to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %.lr.ph10._crit_edge

; <label>:9:                                      ; preds = %.lr.ph10
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc4 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #6
  br label %.lr.ph10._crit_edge

.lr.ph10._crit_edge:                              ; preds = %.lr.ph10, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %0, i64 %indvars.iv58
  %13 = load double, double* %12, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #7
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv58, 1
  %15 = icmp slt i64 %indvars.iv.next6, 1900
  br i1 %15, label %.lr.ph10, label %._crit_edge11

._crit_edge11:                                    ; preds = %.lr.ph10._crit_edge
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge11, %.lr.ph._crit_edge
  %indvars.iv7 = phi i64 [ %indvars.iv.next, %.lr.ph._crit_edge ], [ 0, %._crit_edge11 ]
  %20 = trunc i64 %indvars.iv7 to i32
  %21 = srem i32 %20, 20
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %.lr.ph._crit_edge

; <label>:23:                                     ; preds = %.lr.ph
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %24) #6
  br label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %.lr.ph, %23
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = getelementptr inbounds double, double* %1, i64 %indvars.iv7
  %27 = load double, double* %26, align 8
  %28 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %27) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv7, 1
  %29 = icmp slt i64 %indvars.iv.next, 2100
  br i1 %29, label %.lr.ph, label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph._crit_edge
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %31 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %32) #6
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
