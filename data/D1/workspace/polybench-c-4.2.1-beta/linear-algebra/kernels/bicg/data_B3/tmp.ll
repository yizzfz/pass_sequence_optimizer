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
  %13 = bitcast i8* %7 to double*
  tail call fastcc void @kernel_bicg([1900 x double]* %8, double* %11, double* %12, double* %10, double* %13)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %14 = icmp sgt i32 %0, 42
  br i1 %14, label %15, label %._crit_edge

._crit_edge:                                      ; preds = %2
  br label %19

; <label>:15:                                     ; preds = %2
  %16 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %16, align 1
  %17 = icmp eq i8 %strcmpload, 0
  br i1 %17, label %18, label %._crit_edge21

._crit_edge21:                                    ; preds = %15
  br label %19

; <label>:18:                                     ; preds = %15
  tail call fastcc void @print_array(double* %11, double* %12)
  br label %19

; <label>:19:                                     ; preds = %._crit_edge21, %._crit_edge, %18
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
.lr.ph27:
  br label %.lr.ph27.new

.lr.ph23.split.us:                                ; preds = %._crit_edge.us..lr.ph23.split.us_crit_edge, %.lr.ph23.split.us.preheader
  %indvars.iv29 = phi i64 [ %indvars.iv.next30, %._crit_edge.us..lr.ph23.split.us_crit_edge ], [ 0, %.lr.ph23.split.us.preheader ]
  %3 = trunc i64 %indvars.iv29 to i32
  %4 = sitofp i32 %3 to double
  %5 = fdiv double %4, 2.100000e+03
  %6 = getelementptr inbounds double, double* %1, i64 %indvars.iv29
  store double %5, double* %6, align 8
  br label %.lr.ph23.split.us.new

.lr.ph23.split.us.new:                            ; preds = %.lr.ph23.split.us.new..lr.ph23.split.us.new_crit_edge, %.lr.ph23.split.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph23.split.us.new..lr.ph23.split.us.new_crit_edge ], [ 0, %.lr.ph23.split.us ]
  %indvars.iv.next = or i64 %indvars.iv, 1
  %7 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv29
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 2100
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 2.100000e+03
  %12 = getelementptr inbounds [1900 x double], [1900 x double]* %0, i64 %indvars.iv29, i64 %indvars.iv
  store double %11, double* %12, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %13 = mul nuw nsw i64 %indvars.iv.next.1, %indvars.iv29
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 2100
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 2.100000e+03
  %18 = getelementptr inbounds [1900 x double], [1900 x double]* %0, i64 %indvars.iv29, i64 %indvars.iv.next
  store double %17, double* %18, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1900
  br i1 %exitcond.1, label %._crit_edge.us, label %.lr.ph23.split.us.new..lr.ph23.split.us.new_crit_edge

.lr.ph23.split.us.new..lr.ph23.split.us.new_crit_edge: ; preds = %.lr.ph23.split.us.new
  br label %.lr.ph23.split.us.new

._crit_edge.us:                                   ; preds = %.lr.ph23.split.us.new
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond = icmp eq i64 %indvars.iv.next30, 2100
  br i1 %exitcond, label %._crit_edge24, label %._crit_edge.us..lr.ph23.split.us_crit_edge

._crit_edge.us..lr.ph23.split.us_crit_edge:       ; preds = %._crit_edge.us
  br label %.lr.ph23.split.us

.lr.ph27.new:                                     ; preds = %.lr.ph27.new..lr.ph27.new_crit_edge, %.lr.ph27
  %indvars.iv38 = phi i64 [ %indvars.iv.next39.1, %.lr.ph27.new..lr.ph27.new_crit_edge ], [ 0, %.lr.ph27 ]
  %19 = trunc i64 %indvars.iv38 to i32
  %20 = sitofp i32 %19 to double
  %21 = fdiv double %20, 1.900000e+03
  %22 = getelementptr inbounds double, double* %2, i64 %indvars.iv38
  store double %21, double* %22, align 8
  %indvars.iv.next39 = or i64 %indvars.iv38, 1
  %23 = trunc i64 %indvars.iv.next39 to i32
  %24 = sitofp i32 %23 to double
  %25 = fdiv double %24, 1.900000e+03
  %26 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next39
  store double %25, double* %26, align 8
  %indvars.iv.next39.1 = add nsw i64 %indvars.iv38, 2
  %exitcond41.1 = icmp eq i64 %indvars.iv.next39.1, 1900
  br i1 %exitcond41.1, label %.lr.ph23.split.us.preheader, label %.lr.ph27.new..lr.ph27.new_crit_edge

.lr.ph27.new..lr.ph27.new_crit_edge:              ; preds = %.lr.ph27.new
  br label %.lr.ph27.new

.lr.ph23.split.us.preheader:                      ; preds = %.lr.ph27.new
  br label %.lr.ph23.split.us

._crit_edge24:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_bicg([1900 x double]* nocapture readonly, double* nocapture, double* nocapture, double* nocapture readonly, double* nocapture readonly) unnamed_addr #2 {
.preheader.loopexit:
  %5 = bitcast double* %1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 15200, i32 8, i1 false)
  br label %.lr.ph28.split.us

.lr.ph28.split.us:                                ; preds = %._crit_edge.us..lr.ph28.split.us_crit_edge, %.preheader.loopexit
  %indvars.iv34 = phi i64 [ %indvars.iv.next35, %._crit_edge.us..lr.ph28.split.us_crit_edge ], [ 0, %.preheader.loopexit ]
  %6 = getelementptr inbounds double, double* %2, i64 %indvars.iv34
  store double 0.000000e+00, double* %6, align 8
  %7 = getelementptr inbounds double, double* %4, i64 %indvars.iv34
  br label %8

; <label>:8:                                      ; preds = %._crit_edge, %.lr.ph28.split.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 0, %.lr.ph28.split.us ]
  %9 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %10 = load double, double* %9, align 8
  %11 = load double, double* %7, align 8
  %12 = getelementptr inbounds [1900 x double], [1900 x double]* %0, i64 %indvars.iv34, i64 %indvars.iv
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
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1900
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge:                                      ; preds = %8
  br label %8

._crit_edge.us:                                   ; preds = %8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next35, 2100
  br i1 %exitcond37, label %._crit_edge29, label %._crit_edge.us..lr.ph28.split.us_crit_edge

._crit_edge.us..lr.ph28.split.us_crit_edge:       ; preds = %._crit_edge.us
  br label %.lr.ph28.split.us

._crit_edge29:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly, double* nocapture readonly) unnamed_addr #0 {
.lr.ph16.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph16

.lr.ph16:                                         ; preds = %..lr.ph16_crit_edge, %.lr.ph16.preheader
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %..lr.ph16_crit_edge ], [ 0, %.lr.ph16.preheader ]
  %6 = trunc i64 %indvars.iv18 to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %.lr.ph16._crit_edge

.lr.ph16._crit_edge:                              ; preds = %.lr.ph16
  br label %11

; <label>:9:                                      ; preds = %.lr.ph16
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc4 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #6
  br label %11

; <label>:11:                                     ; preds = %.lr.ph16._crit_edge, %9
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds double, double* %0, i64 %indvars.iv18
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next19, 1900
  br i1 %exitcond21, label %._crit_edge17, label %..lr.ph16_crit_edge

..lr.ph16_crit_edge:                              ; preds = %11
  br label %.lr.ph16

._crit_edge17:                                    ; preds = %11
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  br label %.lr.ph

.lr.ph:                                           ; preds = %..lr.ph_crit_edge, %._crit_edge17
  %indvars.iv = phi i64 [ %indvars.iv.next, %..lr.ph_crit_edge ], [ 0, %._crit_edge17 ]
  %20 = trunc i64 %indvars.iv to i32
  %21 = srem i32 %20, 20
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %.lr.ph
  br label %25

; <label>:23:                                     ; preds = %.lr.ph
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %24) #6
  br label %25

; <label>:25:                                     ; preds = %.lr.ph._crit_edge, %23
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %28 = load double, double* %27, align 8
  %29 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %28) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2100
  br i1 %exitcond, label %._crit_edge, label %..lr.ph_crit_edge

..lr.ph_crit_edge:                                ; preds = %25
  br label %.lr.ph

._crit_edge:                                      ; preds = %25
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %31 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %32) #6
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

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
