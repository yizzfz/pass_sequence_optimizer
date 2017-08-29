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
  %9 = bitcast i8* %4 to [1000 x double]*
  %10 = bitcast i8* %5 to [1200 x double]*
  call fastcc void @kernel_trmm(i32 1000, i32 1200, double %8, [1000 x double]* %9, [1200 x double]* %10)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  call fastcc void @print_array(i32 1000, i32 1200, [1200 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1000 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %2, align 8
  %6 = icmp sgt i32 %0, 0
  br i1 %6, label %.preheader.lr.ph, label %._crit_edge15

.preheader.lr.ph:                                 ; preds = %5
  %7 = icmp sgt i32 %1, 0
  %8 = sitofp i32 %1 to double
  %9 = sitofp i32 %0 to double
  br i1 %7, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  %10 = sext i32 %0 to i64
  br label %.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %11 = add i32 %1, -1
  %12 = sext i32 %0 to i64
  %wide.trip.count23 = zext i32 %11 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge5.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %._crit_edge5.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  %indvars.iv19 = phi i32 [ %indvars.iv.next20, %._crit_edge5.us..preheader.us_crit_edge ], [ -1, %.preheader.us.preheader ]
  %13 = icmp sgt i64 %indvars.iv25, 0
  br i1 %13, label %.lr.ph.us.preheader, label %._crit_edge.us

.lr.ph.us.preheader:                              ; preds = %.preheader.us
  %wide.trip.count = zext i32 %indvars.iv19 to i64
  br label %.lr.ph.us

.lr.ph.us:                                        ; preds = %.lr.ph.us..lr.ph.us_crit_edge, %.lr.ph.us.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %.lr.ph.us..lr.ph.us_crit_edge ], [ 0, %.lr.ph.us.preheader ]
  %14 = add nsw i64 %indvars.iv, %indvars.iv25
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, %0
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, %9
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv25, i64 %indvars.iv
  store double %18, double* %19, align 8
  %exitcond = icmp eq i64 %indvars.iv, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.loopexit, label %.lr.ph.us..lr.ph.us_crit_edge

.lr.ph.us..lr.ph.us_crit_edge:                    ; preds = %.lr.ph.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %.lr.ph.us

._crit_edge.us.loopexit:                          ; preds = %.lr.ph.us
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.preheader.us
  %20 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv25, i64 %indvars.iv25
  store double 1.000000e+00, double* %20, align 8
  %21 = trunc i64 %indvars.iv25 to i32
  %22 = add i32 %21, %1
  br label %23

; <label>:23:                                     ; preds = %._crit_edge37, %._crit_edge.us
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %._crit_edge37 ], [ 0, %._crit_edge.us ]
  %24 = trunc i64 %indvars.iv21 to i32
  %25 = sub i32 %22, %24
  %26 = srem i32 %25, %1
  %27 = sitofp i32 %26 to double
  %28 = fdiv double %27, %8
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 %indvars.iv21
  store double %28, double* %29, align 8
  %exitcond24 = icmp eq i64 %indvars.iv21, %wide.trip.count23
  br i1 %exitcond24, label %._crit_edge5.us, label %._crit_edge37

._crit_edge37:                                    ; preds = %23
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  br label %23

._crit_edge5.us:                                  ; preds = %23
  %indvars.iv.next26 = add i64 %indvars.iv25, 1
  %30 = icmp slt i64 %indvars.iv.next26, %12
  br i1 %30, label %._crit_edge5.us..preheader.us_crit_edge, label %._crit_edge15.loopexit

._crit_edge5.us..preheader.us_crit_edge:          ; preds = %._crit_edge5.us
  %indvars.iv.next20 = add i32 %indvars.iv19, 1
  br label %.preheader.us

.preheader:                                       ; preds = %._crit_edge..preheader_crit_edge, %.preheader.preheader
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %._crit_edge..preheader_crit_edge ], [ 0, %.preheader.preheader ]
  %indvars.iv29 = phi i32 [ %indvars.iv.next30, %._crit_edge..preheader_crit_edge ], [ -1, %.preheader.preheader ]
  %31 = icmp sgt i64 %indvars.iv33, 0
  br i1 %31, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  %wide.trip.count31 = zext i32 %indvars.iv29 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph..lr.ph_crit_edge, %.lr.ph.preheader
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %.lr.ph..lr.ph_crit_edge ], [ 0, %.lr.ph.preheader ]
  %32 = add nsw i64 %indvars.iv27, %indvars.iv33
  %33 = trunc i64 %32 to i32
  %34 = srem i32 %33, %0
  %35 = sitofp i32 %34 to double
  %36 = fdiv double %35, %9
  %37 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv33, i64 %indvars.iv27
  store double %36, double* %37, align 8
  %exitcond32 = icmp eq i64 %indvars.iv27, %wide.trip.count31
  br i1 %exitcond32, label %._crit_edge.loopexit, label %.lr.ph..lr.ph_crit_edge

.lr.ph..lr.ph_crit_edge:                          ; preds = %.lr.ph
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  br label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %38 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv33, i64 %indvars.iv33
  store double 1.000000e+00, double* %38, align 8
  %indvars.iv.next34 = add i64 %indvars.iv33, 1
  %39 = icmp slt i64 %indvars.iv.next34, %10
  br i1 %39, label %._crit_edge..preheader_crit_edge, label %._crit_edge15.loopexit38

._crit_edge..preheader_crit_edge:                 ; preds = %._crit_edge
  %indvars.iv.next30 = add i32 %indvars.iv29, 1
  br label %.preheader

._crit_edge15.loopexit:                           ; preds = %._crit_edge5.us
  br label %._crit_edge15

._crit_edge15.loopexit38:                         ; preds = %._crit_edge
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit38, %._crit_edge15.loopexit, %5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_trmm(i32, i32, double, [1000 x double]* nocapture readonly, [1200 x double]* nocapture) unnamed_addr #2 {
  %6 = icmp sgt i32 %0, 0
  %7 = icmp sgt i32 %1, 0
  %or.cond = and i1 %6, %7
  br i1 %or.cond, label %.preheader3.us.preheader, label %._crit_edge

.preheader3.us.preheader:                         ; preds = %5
  %8 = add i32 %1, -1
  %9 = add i32 %0, -1
  %10 = sext i32 %1 to i64
  %11 = sext i32 %0 to i64
  %wide.trip.count40 = sext i32 %9 to i64
  %wide.trip.count = zext i32 %8 to i64
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %._crit_edge6.us, %.preheader3.us.preheader
  %indvars.iv44 = phi i64 [ 0, %.preheader3.us.preheader ], [ %indvars.iv.next45, %._crit_edge6.us ]
  %indvars.iv34.in = phi i32 [ 0, %.preheader3.us.preheader ], [ %indvars.iv34, %._crit_edge6.us ]
  %indvars.iv34 = add i32 %indvars.iv34.in, 1
  %12 = sext i32 %indvars.iv34 to i64
  %indvars.iv.next45 = add i64 %indvars.iv44, 1
  %13 = icmp slt i64 %indvars.iv.next45, %11
  br i1 %13, label %.preheader.us.us.preheader, label %.preheader.us18.preheader

.preheader.us18.preheader:                        ; preds = %.preheader3.us
  br label %.preheader.us18

.preheader.us.us.preheader:                       ; preds = %.preheader3.us
  br label %.preheader.us.us

.preheader.us18:                                  ; preds = %.preheader.us18.preheader, %.preheader.us18..preheader.us18_crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %.preheader.us18..preheader.us18_crit_edge ], [ 0, %.preheader.us18.preheader ]
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv44, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = fmul double %15, %2
  store double %16, double* %14, align 8
  %exitcond = icmp eq i64 %indvars.iv, %wide.trip.count
  br i1 %exitcond, label %._crit_edge6.us.loopexit48, label %.preheader.us18..preheader.us18_crit_edge

.preheader.us18..preheader.us18_crit_edge:        ; preds = %.preheader.us18
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %.preheader.us18

._crit_edge6.us.loopexit:                         ; preds = %._crit_edge.us.us
  br label %._crit_edge6.us

._crit_edge6.us.loopexit48:                       ; preds = %.preheader.us18
  br label %._crit_edge6.us

._crit_edge6.us:                                  ; preds = %._crit_edge6.us.loopexit48, %._crit_edge6.us.loopexit
  br i1 %13, label %.preheader3.us, label %._crit_edge.loopexit

.preheader.us.us:                                 ; preds = %.preheader.us.us.preheader, %._crit_edge.us.us
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %._crit_edge.us.us ], [ 0, %.preheader.us.us.preheader ]
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv44, i64 %indvars.iv42
  %.pre = load double, double* %17, align 8
  br label %19

._crit_edge.us.us:                                ; preds = %19
  %18 = fmul double %26, %2
  store double %18, double* %17, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next43, %10
  br i1 %exitcond46, label %._crit_edge6.us.loopexit, label %.preheader.us.us

; <label>:19:                                     ; preds = %._crit_edge47, %.preheader.us.us
  %20 = phi double [ %26, %._crit_edge47 ], [ %.pre, %.preheader.us.us ]
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %._crit_edge47 ], [ %12, %.preheader.us.us ]
  %21 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv36, i64 %indvars.iv44
  %22 = load double, double* %21, align 8
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv36, i64 %indvars.iv42
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = fadd double %25, %20
  store double %26, double* %17, align 8
  %exitcond41 = icmp eq i64 %indvars.iv36, %wide.trip.count40
  br i1 %exitcond41, label %._crit_edge.us.us, label %._crit_edge47

._crit_edge47:                                    ; preds = %19
  %indvars.iv.next37 = add nsw i64 %indvars.iv36, 1
  br label %19

._crit_edge.loopexit:                             ; preds = %._crit_edge6.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %5
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge

.preheader.us.preheader:                          ; preds = %3
  %10 = sext i32 %1 to i64
  %11 = sext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv11 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next12, %._crit_edge.us ]
  %12 = mul nsw i64 %11, %indvars.iv11
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge9, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge9 ]
  %13 = add nsw i64 %12, %indvars.iv
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %._crit_edge9

; <label>:17:                                     ; preds = %._crit_edge10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #5
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge10, %17
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %21) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %10
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge10

._crit_edge.us:                                   ; preds = %._crit_edge9
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next12, %11
  br i1 %exitcond14, label %._crit_edge.loopexit, label %.preheader.us

._crit_edge.loopexit:                             ; preds = %._crit_edge.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %3
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %25) #5
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
