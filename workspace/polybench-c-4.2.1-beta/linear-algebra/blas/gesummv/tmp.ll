; ModuleID = 'B.ll'
source_filename = "gesummv.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1300, i32 8) #4
  %8 = tail call i8* @polybench_alloc_data(i64 1300, i32 8) #4
  %9 = tail call i8* @polybench_alloc_data(i64 1300, i32 8) #4
  %10 = bitcast i8* %5 to [1300 x double]*
  %11 = bitcast i8* %6 to [1300 x double]*
  %12 = bitcast i8* %8 to double*
  call fastcc void @init_array(i32 1300, double* nonnull %3, double* nonnull %4, [1300 x double]* %10, [1300 x double]* %11, double* %12)
  tail call void (...) @polybench_timer_start() #4
  %13 = load double, double* %3, align 8
  %14 = load double, double* %4, align 8
  %15 = bitcast i8* %7 to double*
  %16 = bitcast i8* %9 to double*
  tail call fastcc void @kernel_gesummv(i32 1300, double %13, double %14, [1300 x double]* %10, [1300 x double]* %11, double* %15, double* %12, double* %16)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %17 = icmp sgt i32 %0, 42
  br i1 %17, label %18, label %22

; <label>:18:                                     ; preds = %2
  %19 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %19, align 1
  %20 = icmp eq i8 %strcmpload, 0
  br i1 %20, label %21, label %22

; <label>:21:                                     ; preds = %18
  tail call fastcc void @print_array(i32 1300, double* %16)
  br label %22

; <label>:22:                                     ; preds = %21, %18, %2
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  tail call void @free(i8* %8) #4
  tail call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double* nocapture, double* nocapture, [1300 x double]* nocapture, [1300 x double]* nocapture, double* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %1, align 8
  store double 1.200000e+00, double* %2, align 8
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph6, label %._crit_edge7

.lr.ph6:                                          ; preds = %6
  %8 = sitofp i32 %0 to double
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count10 = zext i32 %0 to i64
  br label %.lr.ph.us

.lr.ph.us:                                        ; preds = %._crit_edge.us, %.lr.ph6
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %._crit_edge.us ], [ 0, %.lr.ph6 ]
  %9 = trunc i64 %indvars.iv8 to i32
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, %8
  %12 = getelementptr inbounds double, double* %5, i64 %indvars.iv8
  store double %11, double* %12, align 8
  br label %13

; <label>:13:                                     ; preds = %13, %.lr.ph.us
  %indvars.iv = phi i64 [ 0, %.lr.ph.us ], [ %indvars.iv.next, %13 ]
  %14 = mul nuw nsw i64 %indvars.iv, %indvars.iv8
  %15 = add nuw nsw i64 %14, 1
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, %0
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, %8
  %20 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv8, i64 %indvars.iv
  store double %19, double* %20, align 8
  %21 = add nuw nsw i64 %14, 2
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, %0
  %24 = sitofp i32 %23 to double
  %25 = fdiv double %24, %8
  %26 = getelementptr inbounds [1300 x double], [1300 x double]* %4, i64 %indvars.iv8, i64 %indvars.iv
  store double %25, double* %26, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %13

._crit_edge.us:                                   ; preds = %13
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next9, %wide.trip.count10
  br i1 %exitcond11, label %._crit_edge7.loopexit, label %.lr.ph.us

._crit_edge7.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit, %6
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gesummv(i32, double, double, [1300 x double]* nocapture readonly, [1300 x double]* nocapture readonly, double* nocapture, double* nocapture readonly, double* nocapture) unnamed_addr #2 {
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.lr.ph5.split.us.preheader, label %._crit_edge6

.lr.ph5.split.us.preheader:                       ; preds = %8
  %wide.trip.count = zext i32 %0 to i64
  %wide.trip.count9 = zext i32 %0 to i64
  br label %.lr.ph5.split.us

.lr.ph5.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph5.split.us.preheader
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %._crit_edge.us ], [ 0, %.lr.ph5.split.us.preheader ]
  %10 = getelementptr inbounds double, double* %5, i64 %indvars.iv7
  store double 0.000000e+00, double* %10, align 8
  %11 = getelementptr inbounds double, double* %7, i64 %indvars.iv7
  store double 0.000000e+00, double* %11, align 8
  br label %12

; <label>:12:                                     ; preds = %12, %.lr.ph5.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph5.split.us ], [ %indvars.iv.next, %12 ]
  %13 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv7, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = getelementptr inbounds double, double* %6, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = load double, double* %10, align 8
  %19 = fadd double %17, %18
  store double %19, double* %10, align 8
  %20 = getelementptr inbounds [1300 x double], [1300 x double]* %4, i64 %indvars.iv7, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = load double, double* %15, align 8
  %23 = fmul double %21, %22
  %24 = load double, double* %11, align 8
  %25 = fadd double %23, %24
  store double %25, double* %11, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %12

._crit_edge.us:                                   ; preds = %12
  %26 = load double, double* %10, align 8
  %27 = fmul double %26, %1
  %28 = load double, double* %11, align 8
  %29 = fmul double %28, %2
  %30 = fadd double %27, %29
  store double %30, double* %11, align 8
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next8, %wide.trip.count9
  br i1 %exitcond10, label %._crit_edge6.loopexit, label %.lr.ph5.split.us

._crit_edge6.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit, %8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %2
  %wide.trip.count = zext i32 %0 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %13, %.lr.ph.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %13 ], [ 0, %.lr.ph.preheader ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %.lr.ph
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %13

; <label>:13:                                     ; preds = %11, %.lr.ph
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %13
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
