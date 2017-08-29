; ModuleID = 'A.ll'
source_filename = "jacobi-1d.c"
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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %.cast = bitcast i8* %3 to double*
  %5 = bitcast i8* %4 to double*
  tail call fastcc void @init_array(i32 2000, double* %.cast, double* %5)
  tail call void (...) @polybench_timer_start() #4
  %6 = bitcast i8* %3 to double*
  %7 = bitcast i8* %4 to double*
  tail call fastcc void @kernel_jacobi_1d(i32 500, i32 2000, double* %6, double* %7)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %8 = icmp sgt i32 %0, 42
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %2
  %10 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %10, align 1
  %11 = icmp eq i8 %strcmpload, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %9
  %13 = bitcast i8* %3 to double*
  tail call fastcc void @print_array(i32 2000, double* %13)
  br label %._crit_edge

._crit_edge:                                      ; preds = %9, %2, %12
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double*, double*) unnamed_addr #2 {
  br i1 true, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %3
  br label %4

; <label>:4:                                      ; preds = %._crit_edge4, %.lr.ph
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %._crit_edge4 ], [ 0, %.lr.ph ]
  %5 = trunc i64 %indvars.iv6 to i32
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds double, double* %1, i64 %indvars.iv6
  %8 = trunc i64 %indvars.iv6 to i32
  %9 = sitofp i32 %8 to double
  %10 = insertelement <2 x double> undef, double %6, i32 0
  %11 = insertelement <2 x double> %10, double %9, i32 1
  %12 = fadd <2 x double> %11, <double 2.000000e+00, double 3.000000e+00>
  %13 = fdiv <2 x double> %12, <double 2.000000e+03, double 2.000000e+03>
  %14 = extractelement <2 x double> %13, i32 0
  %15 = extractelement <2 x double> %13, i32 1
  store double %14, double* %7, align 8
  %16 = getelementptr inbounds double, double* %2, i64 %indvars.iv6
  store double %15, double* %16, align 8
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond = icmp ne i64 %indvars.iv6, 1999
  br i1 %exitcond, label %._crit_edge4, label %._crit_edge.loopexit

._crit_edge4:                                     ; preds = %4
  br label %4

._crit_edge.loopexit:                             ; preds = %4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_jacobi_1d(i32, i32, double*, double*) unnamed_addr #2 {
  br i1 true, label %._crit_edge.lr.ph, label %._crit_edge

._crit_edge.lr.ph:                                ; preds = %4
  br i1 true, label %._crit_edge.us.preheader, label %._crit_edge

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge7.us
  %5 = phi i32 [ %6, %._crit_edge7.us ], [ 0, %._crit_edge.us.preheader ]
  br label %._crit_edge41

._crit_edge7.us:                                  ; preds = %.lr.ph6.us
  %6 = add nuw nsw i32 %5, 1
  %exitcond43 = icmp ne i32 %6, 500
  br i1 %exitcond43, label %._crit_edge.us, label %._crit_edge.loopexit

.lr.ph6.us:                                       ; preds = %.lr.ph6.us.preheader, %.lr.ph6.us
  %indvars.iv29 = phi i64 [ %13, %.lr.ph6.us ], [ 1, %.lr.ph6.us.preheader ]
  %7 = add nsw i64 %indvars.iv29, -1
  %8 = getelementptr inbounds double, double* %3, i64 %7
  %9 = load double, double* %8, align 8
  %10 = getelementptr inbounds double, double* %3, i64 %indvars.iv29
  %11 = load double, double* %10, align 8
  %12 = fadd double %9, %11
  %13 = add nuw nsw i64 %indvars.iv29, 1
  %14 = getelementptr inbounds double, double* %3, i64 %13
  %15 = load double, double* %14, align 8
  %16 = fadd double %12, %15
  %17 = fmul double %16, 3.333300e-01
  %18 = getelementptr inbounds double, double* %2, i64 %indvars.iv29
  store double %17, double* %18, align 8
  %exitcond42 = icmp ne i64 %13, 1999
  br i1 %exitcond42, label %.lr.ph6.us, label %._crit_edge7.us

._crit_edge41:                                    ; preds = %._crit_edge41, %._crit_edge.us
  %indvars.iv = phi i64 [ 1, %._crit_edge.us ], [ %25, %._crit_edge41 ]
  %19 = add nsw i64 %indvars.iv, -1
  %20 = getelementptr inbounds double, double* %2, i64 %19
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %23 = load double, double* %22, align 8
  %24 = fadd double %21, %23
  %25 = add nuw nsw i64 %indvars.iv, 1
  %26 = getelementptr inbounds double, double* %2, i64 %25
  %27 = load double, double* %26, align 8
  %28 = fadd double %24, %27
  %29 = fmul double %28, 3.333300e-01
  %30 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  store double %29, double* %30, align 8
  %exitcond = icmp ne i64 %25, 1999
  br i1 %exitcond, label %._crit_edge41, label %.lr.ph6.us.preheader

.lr.ph6.us.preheader:                             ; preds = %._crit_edge41
  br label %.lr.ph6.us

._crit_edge.loopexit:                             ; preds = %._crit_edge7.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge.lr.ph, %4
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %2
  br label %7

; <label>:7:                                      ; preds = %._crit_edge6, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge6 ]
  %storemerge1 = phi i32 [ 0, %.lr.ph ], [ %17, %._crit_edge6 ]
  %8 = srem i32 %storemerge1, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge5

; <label>:10:                                     ; preds = %7
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %7, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %16 = icmp slt i64 %indvars.iv.next, 2000
  br i1 %16, label %._crit_edge6, label %._crit_edge.loopexit

._crit_edge6:                                     ; preds = %._crit_edge5
  %17 = trunc i64 %indvars.iv.next to i32
  br label %7

._crit_edge.loopexit:                             ; preds = %._crit_edge5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
