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
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(double* %11, double* %12)
  br label %18

; <label>:18:                                     ; preds = %14, %2, %17
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
.lr.ph14:
  br label %3

; <label>:3:                                      ; preds = %3, %.lr.ph14
  %indvars.iv412 = phi i64 [ 0, %.lr.ph14 ], [ %indvars.iv.next5.1, %3 ]
  %4 = trunc i64 %indvars.iv412 to i32
  %5 = srem i32 %4, 1900
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds double, double* %2, i64 %indvars.iv412
  %8 = trunc i64 %indvars.iv412 to i32
  %9 = or i32 %8, 1
  %10 = srem i32 %9, 1900
  %11 = sitofp i32 %10 to double
  %12 = insertelement <2 x double> undef, double %6, i32 0
  %13 = insertelement <2 x double> %12, double %11, i32 1
  %14 = fdiv <2 x double> %13, <double 1.900000e+03, double 1.900000e+03>
  %15 = bitcast double* %7 to <2 x double>*
  store <2 x double> %14, <2 x double>* %15, align 8
  %indvars.iv.next5.1 = add nsw i64 %indvars.iv412, 2
  %exitcond21.1 = icmp eq i64 %indvars.iv.next5.1, 1900
  br i1 %exitcond21.1, label %.lr.ph10.split.us.preheader, label %3

.lr.ph10.split.us.preheader:                      ; preds = %3
  br label %.lr.ph10.split.us

.lr.ph10.split.us:                                ; preds = %.lr.ph10.split.us.preheader, %._crit_edge.us
  %indvars.iv27.us = phi i64 [ %indvars.iv.next3.us, %._crit_edge.us ], [ 0, %.lr.ph10.split.us.preheader ]
  %16 = trunc i64 %indvars.iv27.us to i32
  %17 = srem i32 %16, 2100
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, 2.100000e+03
  %20 = getelementptr inbounds double, double* %1, i64 %indvars.iv27.us
  store double %19, double* %20, align 8
  br label %21

; <label>:21:                                     ; preds = %21, %.lr.ph10.split.us
  %indvars.iv6.us = phi i64 [ 0, %.lr.ph10.split.us ], [ %indvars.iv.next.us.1, %21 ]
  %indvars.iv.next.us = or i64 %indvars.iv6.us, 1
  %22 = mul nuw nsw i64 %indvars.iv.next.us, %indvars.iv27.us
  %23 = trunc i64 %22 to i32
  %24 = srem i32 %23, 2100
  %25 = sitofp i32 %24 to double
  %26 = getelementptr inbounds [1900 x double], [1900 x double]* %0, i64 %indvars.iv27.us, i64 %indvars.iv6.us
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv6.us, 2
  %27 = mul nuw nsw i64 %indvars.iv.next.us.1, %indvars.iv27.us
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, 2100
  %30 = sitofp i32 %29 to double
  %31 = insertelement <2 x double> undef, double %25, i32 0
  %32 = insertelement <2 x double> %31, double %30, i32 1
  %33 = fdiv <2 x double> %32, <double 2.100000e+03, double 2.100000e+03>
  %34 = bitcast double* %26 to <2 x double>*
  store <2 x double> %33, <2 x double>* %34, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.us.1, 1900
  br i1 %exitcond.1, label %._crit_edge.us, label %21

._crit_edge.us:                                   ; preds = %21
  %indvars.iv.next3.us = add nuw nsw i64 %indvars.iv27.us, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next3.us, 2100
  br i1 %exitcond19, label %._crit_edge11, label %.lr.ph10.split.us

._crit_edge11:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_bicg([1900 x double]* nocapture readonly, double* nocapture, double* nocapture, double* nocapture readonly, double* nocapture readonly) unnamed_addr #2 {
.lr.ph10..lr.ph10.split.us_crit_edge:
  %5 = bitcast double* %1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 15200, i32 8, i1 false)
  %sunkaddr = ptrtoint double* %4 to i64
  %sunkaddr19 = ptrtoint double* %2 to i64
  br label %.lr.ph10.split.us

.lr.ph10.split.us:                                ; preds = %._crit_edge.us, %.lr.ph10..lr.ph10.split.us_crit_edge
  %indvars.iv27.us = phi i64 [ 0, %.lr.ph10..lr.ph10.split.us_crit_edge ], [ %indvars.iv.next3.us, %._crit_edge.us ]
  %6 = getelementptr inbounds double, double* %2, i64 %indvars.iv27.us
  store double 0.000000e+00, double* %6, align 8
  %sunkaddr16 = shl nuw nsw i64 %indvars.iv27.us, 3
  %sunkaddr17 = add i64 %sunkaddr, %sunkaddr16
  %sunkaddr18 = inttoptr i64 %sunkaddr17 to double*
  %sunkaddr21 = add i64 %sunkaddr19, %sunkaddr16
  %sunkaddr22 = inttoptr i64 %sunkaddr21 to double*
  br label %7

; <label>:7:                                      ; preds = %7, %.lr.ph10.split.us
  %indvars.iv6.us = phi i64 [ 0, %.lr.ph10.split.us ], [ %indvars.iv.next.us, %7 ]
  %8 = getelementptr inbounds double, double* %1, i64 %indvars.iv6.us
  %9 = load double, double* %8, align 8
  %10 = load double, double* %sunkaddr18, align 8
  %11 = getelementptr inbounds [1900 x double], [1900 x double]* %0, i64 %indvars.iv27.us, i64 %indvars.iv6.us
  %12 = load double, double* %11, align 8
  %13 = fmul double %10, %12
  %14 = fadd double %9, %13
  store double %14, double* %8, align 8
  %15 = load double, double* %sunkaddr22, align 8
  %16 = load double, double* %11, align 8
  %17 = getelementptr inbounds double, double* %3, i64 %indvars.iv6.us
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fadd double %15, %19
  store double %20, double* %sunkaddr22, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv6.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, 1900
  br i1 %exitcond, label %._crit_edge.us, label %7

._crit_edge.us:                                   ; preds = %7
  %indvars.iv.next3.us = add nuw nsw i64 %indvars.iv27.us, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next3.us, 2100
  br i1 %exitcond24, label %._crit_edge11, label %.lr.ph10.split.us

._crit_edge11:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly, double* nocapture readonly) unnamed_addr #0 {
..lr.ph9_crit_edge:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.lr.ph9

.lr.ph9:                                          ; preds = %11, %..lr.ph9_crit_edge
  %indvars.iv17 = phi i64 [ 0, %..lr.ph9_crit_edge ], [ %indvars.iv.next2, %11 ]
  %6 = trunc i64 %indvars.iv17 to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %.lr.ph9
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc5 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #6
  br label %11

; <label>:11:                                     ; preds = %.lr.ph9, %9
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds double, double* %0, i64 %indvars.iv17
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #7
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next2, 1900
  br i1 %exitcond13, label %._crit_edge10..lr.ph_crit_edge, label %.lr.ph9

._crit_edge10..lr.ph_crit_edge:                   ; preds = %11
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  br label %.lr.ph

.lr.ph:                                           ; preds = %25, %._crit_edge10..lr.ph_crit_edge
  %indvars.iv6 = phi i64 [ 0, %._crit_edge10..lr.ph_crit_edge ], [ %indvars.iv.next, %25 ]
  %20 = trunc i64 %indvars.iv6 to i32
  %21 = srem i32 %20, 20
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %25

; <label>:23:                                     ; preds = %.lr.ph
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %24) #6
  br label %25

; <label>:25:                                     ; preds = %.lr.ph, %23
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = getelementptr inbounds double, double* %1, i64 %indvars.iv6
  %28 = load double, double* %27, align 8
  %29 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %28) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv6, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2100
  br i1 %exitcond, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %25
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
