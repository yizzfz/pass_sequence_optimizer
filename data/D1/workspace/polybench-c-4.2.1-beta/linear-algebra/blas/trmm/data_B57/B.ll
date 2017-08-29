; ModuleID = 'A.ll'
source_filename = "trmm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %4 to [1000 x double]*
  %7 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @init_array(i32 1000, i32 1200, double* nonnull %3, [1000 x double]* %6, [1200 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  call fastcc void @kernel_trmm(i32 1000, i32 1200, double %8, [1000 x double]* %6, [1200 x double]* %7)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %7)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  br i1 true, label %.lr.ph6, label %._crit_edge11

.lr.ph6:                                          ; preds = %5
  br i1 true, label %.lr.ph6.split.us.preheader, label %.lr.ph6.split.preheader

.lr.ph6.split.preheader:                          ; preds = %.lr.ph6
  br label %.lr.ph6.split

.lr.ph6.split.us.preheader:                       ; preds = %.lr.ph6
  br label %.lr.ph6.split.us

.lr.ph6.split.us:                                 ; preds = %._crit_edge3.us..lr.ph6.split.us_crit_edge, %.lr.ph6.split.us.preheader
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %._crit_edge3.us..lr.ph6.split.us_crit_edge ], [ 0, %.lr.ph6.split.us.preheader ]
  %indvars.iv15 = phi i32 [ %indvars.iv.next16, %._crit_edge3.us..lr.ph6.split.us_crit_edge ], [ -1, %.lr.ph6.split.us.preheader ]
  %6 = icmp sgt i64 %indvars.iv21, 0
  br i1 %6, label %.lr.ph.us.preheader, label %._crit_edge.us

.lr.ph.us.preheader:                              ; preds = %.lr.ph6.split.us
  %wide.trip.count = zext i32 %indvars.iv15 to i64
  br label %.lr.ph.us

._crit_edge.us.loopexit:                          ; preds = %.lr.ph.us
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.lr.ph6.split.us
  %7 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv21, i64 %indvars.iv21
  store double 1.000000e+00, double* %7, align 8
  %8 = trunc i64 %indvars.iv21 to i32
  %9 = add i32 %8, 1200
  br label %10

; <label>:10:                                     ; preds = %._crit_edge33, %._crit_edge.us
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %._crit_edge33 ], [ 0, %._crit_edge.us ]
  %11 = trunc i64 %indvars.iv17 to i32
  %12 = sub i32 %9, %11
  %13 = srem i32 %12, 1200
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 1.200000e+03
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv21, i64 %indvars.iv17
  store double %15, double* %16, align 8
  %exitcond20 = icmp eq i64 %indvars.iv17, 1199
  br i1 %exitcond20, label %._crit_edge3.us, label %._crit_edge33

._crit_edge33:                                    ; preds = %10
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  br label %10

.lr.ph.us:                                        ; preds = %.lr.ph.us..lr.ph.us_crit_edge, %.lr.ph.us.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph.us..lr.ph.us_crit_edge ], [ 0, %.lr.ph.us.preheader ]
  %17 = add nuw nsw i64 %indvars.iv, %indvars.iv21
  %18 = trunc i64 %17 to i32
  %19 = srem i32 %18, 1000
  %20 = sitofp i32 %19 to double
  %21 = fdiv double %20, 1.000000e+03
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv21, i64 %indvars.iv
  store double %21, double* %22, align 8
  %exitcond = icmp eq i64 %indvars.iv, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.loopexit, label %.lr.ph.us..lr.ph.us_crit_edge

.lr.ph.us..lr.ph.us_crit_edge:                    ; preds = %.lr.ph.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %.lr.ph.us

._crit_edge3.us:                                  ; preds = %10
  %indvars.iv.next22 = add nuw i64 %indvars.iv21, 1
  %23 = icmp slt i64 %indvars.iv.next22, 1000
  br i1 %23, label %._crit_edge3.us..lr.ph6.split.us_crit_edge, label %._crit_edge11.loopexit

._crit_edge3.us..lr.ph6.split.us_crit_edge:       ; preds = %._crit_edge3.us
  %indvars.iv.next16 = add nsw i32 %indvars.iv15, 1
  br label %.lr.ph6.split.us

.lr.ph6.split:                                    ; preds = %._crit_edge..lr.ph6.split_crit_edge, %.lr.ph6.split.preheader
  %indvars.iv29 = phi i64 [ %indvars.iv.next30, %._crit_edge..lr.ph6.split_crit_edge ], [ 0, %.lr.ph6.split.preheader ]
  %indvars.iv25 = phi i32 [ %indvars.iv.next26, %._crit_edge..lr.ph6.split_crit_edge ], [ -1, %.lr.ph6.split.preheader ]
  %24 = icmp sgt i64 %indvars.iv29, 0
  br i1 %24, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.lr.ph6.split
  %wide.trip.count27 = zext i32 %indvars.iv25 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph..lr.ph_crit_edge, %.lr.ph.preheader
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %.lr.ph..lr.ph_crit_edge ], [ 0, %.lr.ph.preheader ]
  %25 = add nuw nsw i64 %indvars.iv23, %indvars.iv29
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 1000
  %28 = sitofp i32 %27 to double
  %29 = fdiv double %28, 1.000000e+03
  %30 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv29, i64 %indvars.iv23
  store double %29, double* %30, align 8
  %exitcond28 = icmp eq i64 %indvars.iv23, %wide.trip.count27
  br i1 %exitcond28, label %._crit_edge.loopexit, label %.lr.ph..lr.ph_crit_edge

.lr.ph..lr.ph_crit_edge:                          ; preds = %.lr.ph
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  br label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph6.split
  %31 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv29, i64 %indvars.iv29
  store double 1.000000e+00, double* %31, align 8
  %indvars.iv.next30 = add nuw i64 %indvars.iv29, 1
  %32 = icmp slt i64 %indvars.iv.next30, 1000
  br i1 %32, label %._crit_edge..lr.ph6.split_crit_edge, label %._crit_edge11.loopexit34

._crit_edge..lr.ph6.split_crit_edge:              ; preds = %._crit_edge
  %indvars.iv.next26 = add nsw i32 %indvars.iv25, 1
  br label %.lr.ph6.split

._crit_edge11.loopexit:                           ; preds = %._crit_edge3.us
  br label %._crit_edge11

._crit_edge11.loopexit34:                         ; preds = %._crit_edge
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11.loopexit34, %._crit_edge11.loopexit, %5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(i32, i32, double, [1000 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
  br i1 true, label %.lr.ph8.split.us.preheader, label %._crit_edge

.lr.ph8.split.us.preheader:                       ; preds = %5
  br label %.lr.ph8.split.us

.lr.ph8.split.us:                                 ; preds = %._crit_edge4.us..lr.ph8.split.us_crit_edge, %.lr.ph8.split.us.preheader
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge4.us..lr.ph8.split.us_crit_edge ], [ 0, %.lr.ph8.split.us.preheader ]
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %._crit_edge4.us..lr.ph8.split.us_crit_edge ], [ 1, %.lr.ph8.split.us.preheader ]
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %6 = icmp slt i64 %indvars.iv.next40, 1000
  br i1 %6, label %.lr.ph.us.us.preheader, label %.lr.ph3..lr.ph3.split_crit_edge.us.preheader

.lr.ph3..lr.ph3.split_crit_edge.us.preheader:     ; preds = %.lr.ph8.split.us
  br label %.lr.ph3..lr.ph3.split_crit_edge.us

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph8.split.us
  br label %.lr.ph.us.us

.lr.ph3..lr.ph3.split_crit_edge.us:               ; preds = %.lr.ph3..lr.ph3.split_crit_edge.us.preheader, %.lr.ph3..lr.ph3.split_crit_edge.us..lr.ph3..lr.ph3.split_crit_edge.us_crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph3..lr.ph3.split_crit_edge.us..lr.ph3..lr.ph3.split_crit_edge.us_crit_edge ], [ 0, %.lr.ph3..lr.ph3.split_crit_edge.us.preheader ]
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv
  %8 = load double, double* %7, align 8
  %9 = fmul double %8, %2
  store double %9, double* %7, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1199
  br i1 %exitcond, label %._crit_edge4.us.loopexit46, label %.lr.ph3..lr.ph3.split_crit_edge.us..lr.ph3..lr.ph3.split_crit_edge.us_crit_edge

.lr.ph3..lr.ph3.split_crit_edge.us..lr.ph3..lr.ph3.split_crit_edge.us_crit_edge: ; preds = %.lr.ph3..lr.ph3.split_crit_edge.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %.lr.ph3..lr.ph3.split_crit_edge.us

._crit_edge4.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge4.us

._crit_edge4.us.loopexit46:                       ; preds = %.lr.ph3..lr.ph3.split_crit_edge.us
  br label %._crit_edge4.us

._crit_edge4.us:                                  ; preds = %._crit_edge4.us.loopexit46, %._crit_edge4.us.loopexit
  br i1 %6, label %._crit_edge4.us..lr.ph8.split.us_crit_edge, label %._crit_edge.loopexit

._crit_edge4.us..lr.ph8.split.us_crit_edge:       ; preds = %._crit_edge4.us
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  br label %.lr.ph8.split.us

.lr.ph.us.us:                                     ; preds = %.lr.ph.us.us.preheader, %._crit_edge.us.us
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %._crit_edge.us.us ], [ 0, %.lr.ph.us.us.preheader ]
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv39, i64 %indvars.iv37
  %.pre = load double, double* %10, align 8
  br label %12

._crit_edge.us.us:                                ; preds = %12
  %11 = fmul double %19, %2
  store double %11, double* %10, align 8
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next38, 1200
  br i1 %exitcond44, label %._crit_edge4.us.loopexit, label %.lr.ph.us.us

; <label>:12:                                     ; preds = %._crit_edge45, %.lr.ph.us.us
  %13 = phi double [ %19, %._crit_edge45 ], [ %.pre, %.lr.ph.us.us ]
  %indvars.iv29 = phi i64 [ %indvars.iv.next30, %._crit_edge45 ], [ %indvars.iv27, %.lr.ph.us.us ]
  %14 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv29, i64 %indvars.iv39
  %15 = load double, double* %14, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv29, i64 %indvars.iv37
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fadd double %13, %18
  store double %19, double* %10, align 8
  %exitcond36 = icmp eq i64 %indvars.iv29, 999
  br i1 %exitcond36, label %._crit_edge.us.us, label %._crit_edge45

._crit_edge45:                                    ; preds = %12
  %indvars.iv.next30 = add nuw i64 %indvars.iv29, 1
  br label %12

._crit_edge.loopexit:                             ; preds = %._crit_edge4.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %5
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %.lr.ph4.split.us.preheader, label %._crit_edge

.lr.ph4.split.us.preheader:                       ; preds = %3
  br label %.lr.ph4.split.us

.lr.ph4.split.us:                                 ; preds = %._crit_edge2.us, %.lr.ph4.split.us.preheader
  %indvars.iv9 = phi i64 [ 0, %.lr.ph4.split.us.preheader ], [ %indvars.iv.next10, %._crit_edge2.us ]
  %8 = mul nsw i64 %indvars.iv9, 1000
  br label %._crit_edge.us._crit_edge

._crit_edge.us._crit_edge:                        ; preds = %._crit_edge.us, %.lr.ph4.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph4.split.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %9 = add nsw i64 %indvars.iv, %8
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge.us

; <label>:13:                                     ; preds = %._crit_edge.us._crit_edge
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us._crit_edge, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv9, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge2.us, label %._crit_edge.us._crit_edge

._crit_edge2.us:                                  ; preds = %._crit_edge.us
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next10, 1000
  br i1 %exitcond11, label %._crit_edge.loopexit, label %.lr.ph4.split.us

._crit_edge.loopexit:                             ; preds = %._crit_edge2.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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
