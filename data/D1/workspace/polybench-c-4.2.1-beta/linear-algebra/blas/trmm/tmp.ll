; ModuleID = 'B.ll'
source_filename = "trmm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"B\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1000000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %4 to [1000 x double]*
  %7 = bitcast i8* %5 to [1200 x double]*
  call void @init_array(i32 1000, i32 1200, double* nonnull %3, [1000 x double]* %6, [1200 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  %9 = bitcast i8* %4 to [1000 x double]*
  %10 = bitcast i8* %5 to [1200 x double]*
  call void @kernel_trmm(i32 1000, i32 1200, double %8, [1000 x double]* %9, [1200 x double]* %10)
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
  %16 = bitcast i8* %5 to [1200 x double]*
  call void @print_array(i32 1000, i32 1200, [1200 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %15, %12, %2
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, double*, [1000 x double]*, [1200 x double]*) #2 {
.preheader.lr.ph:
  store double 1.500000e+00, double* %2, align 8
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us, %.preheader.lr.ph
  %indvars.iv29 = phi i64 [ %indvars.iv.next30, %.loopexit.us ], [ 0, %.preheader.lr.ph ]
  %indvars.iv23 = phi i32 [ %indvars.iv.next24, %.loopexit.us ], [ -1, %.preheader.lr.ph ]
  %5 = add i64 %indvars.iv29, 4294967295
  %6 = and i64 %5, 4294967295
  %7 = icmp sgt i64 %indvars.iv29, 0
  br i1 %7, label %.lr.ph.us.preheader, label %.lr.ph7.us

.lr.ph.us.preheader:                              ; preds = %.preheader.us
  %wide.trip.count = zext i32 %indvars.iv23 to i64
  %8 = and i64 %5, 1
  %lcmp.mod = icmp eq i64 %8, 0
  br i1 %lcmp.mod, label %.lr.ph.us.prol.preheader, label %.lr.ph.us.prol.loopexit.unr-lcssa

.lr.ph.us.prol.preheader:                         ; preds = %.lr.ph.us.preheader
  br label %.lr.ph.us.prol

.lr.ph.us.prol:                                   ; preds = %.lr.ph.us.prol.preheader
  %9 = trunc i64 %indvars.iv29 to i32
  %10 = srem i32 %9, 1000
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 1.000000e+03
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv29, i64 0
  store double %12, double* %13, align 8
  br label %.lr.ph.us.prol.loopexit.unr-lcssa

.lr.ph.us.prol.loopexit.unr-lcssa:                ; preds = %.lr.ph.us.prol, %.lr.ph.us.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.lr.ph.us.prol ], [ 0, %.lr.ph.us.preheader ]
  br label %.lr.ph.us.prol.loopexit

.lr.ph.us.prol.loopexit:                          ; preds = %.lr.ph.us.prol.loopexit.unr-lcssa
  %14 = icmp eq i64 %6, 0
  br i1 %14, label %.lr.ph7.us.loopexit, label %.lr.ph.us.preheader.new

.lr.ph.us.preheader.new:                          ; preds = %.lr.ph.us.prol.loopexit
  br label %.lr.ph.us

.lr.ph.us:                                        ; preds = %.lr.ph.us, %.lr.ph.us.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.us.preheader.new ], [ %indvars.iv.next.1, %.lr.ph.us ]
  %15 = add nuw nsw i64 %indvars.iv29, %indvars.iv
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 1000
  %18 = sitofp i32 %17 to double
  %19 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv29, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %20 = add nuw nsw i64 %indvars.iv29, %indvars.iv.next
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, 1000
  %23 = sitofp i32 %22 to double
  %24 = insertelement <2 x double> undef, double %18, i32 0
  %25 = insertelement <2 x double> %24, double %23, i32 1
  %26 = fdiv <2 x double> %25, <double 1.000000e+03, double 1.000000e+03>
  %27 = bitcast double* %19 to <2 x double>*
  store <2 x double> %26, <2 x double>* %27, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %.lr.ph7.us.loopexit.unr-lcssa, label %.lr.ph.us

.lr.ph7.us.loopexit.unr-lcssa:                    ; preds = %.lr.ph.us
  br label %.lr.ph7.us.loopexit

.lr.ph7.us.loopexit:                              ; preds = %.lr.ph7.us.loopexit.unr-lcssa, %.lr.ph.us.prol.loopexit
  br label %.lr.ph7.us

.lr.ph7.us:                                       ; preds = %.lr.ph7.us.loopexit, %.preheader.us
  %28 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv29, i64 %indvars.iv29
  store double 1.000000e+00, double* %28, align 8
  %29 = trunc i64 %indvars.iv29 to i32
  br label %30

; <label>:30:                                     ; preds = %30, %.lr.ph7.us
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %30 ], [ 0, %.lr.ph7.us ]
  %31 = trunc i64 %indvars.iv25 to i32
  %32 = sub i32 1200, %31
  %33 = add i32 %32, %29
  %34 = srem i32 %33, 1200
  %35 = sitofp i32 %34 to double
  %36 = fdiv double %35, 1.200000e+03
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv29, i64 %indvars.iv25
  store double %36, double* %37, align 8
  %exitcond28 = icmp eq i64 %indvars.iv25, 1199
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  br i1 %exitcond28, label %.loopexit.us, label %30

.loopexit.us:                                     ; preds = %30
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %indvars.iv.next24 = add nsw i32 %indvars.iv23, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next30, 1000
  br i1 %exitcond42, label %._crit_edge, label %.preheader.us

._crit_edge:                                      ; preds = %.loopexit.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_trmm(i32, i32, double, [1000 x double]*, [1200 x double]*) #2 {
.preheader3.lr.ph..preheader3.us_crit_edge:
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %.loopexit.loopexit.us, %.preheader3.lr.ph..preheader3.us_crit_edge
  %indvars.iv24 = phi i64 [ 0, %.preheader3.lr.ph..preheader3.us_crit_edge ], [ %indvars.iv.next25, %.loopexit.loopexit.us ]
  %5 = phi i32 [ 0, %.preheader3.lr.ph..preheader3.us_crit_edge ], [ %6, %.loopexit.loopexit.us ]
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %6 = add nuw nsw i32 %5, 1
  %7 = trunc i64 %indvars.iv.next25 to i32
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit6.us, %.preheader3.us
  %indvars.iv22 = phi i64 [ 0, %.preheader3.us ], [ %indvars.iv.next23, %.loopexit6.us ]
  %8 = phi i32 [ %7, %.preheader3.us ], [ %6, %.loopexit6.us ]
  %9 = icmp slt i32 %8, 1000
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv24, i64 %indvars.iv22
  br i1 %9, label %.lr.ph.us, label %.preheader.us..loopexit6.us_crit_edge

.preheader.us..loopexit6.us_crit_edge:            ; preds = %.preheader.us
  %.pre26 = load double, double* %10, align 8
  br label %.loopexit6.us

.lr.ph.us:                                        ; preds = %.preheader.us
  %11 = sext i32 %8 to i64
  %.pre = load double, double* %10, align 8
  %xtraiter = and i64 %11, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit.unr-lcssa, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph.us
  br label %12

; <label>:12:                                     ; preds = %.prol.preheader
  %13 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %11, i64 %indvars.iv24
  %14 = load double, double* %13, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %11, i64 %indvars.iv22
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fadd double %.pre, %17
  store double %18, double* %10, align 8
  %indvars.iv.next.prol = add nsw i64 %11, 1
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %12, %.lr.ph.us
  %.lcssa.unr.ph = phi double [ %18, %12 ], [ undef, %.lr.ph.us ]
  %.unr.ph = phi double [ %18, %12 ], [ %.pre, %.lr.ph.us ]
  %indvars.iv.unr.ph = phi i64 [ %indvars.iv.next.prol, %12 ], [ %11, %.lr.ph.us ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  %19 = icmp eq i32 %8, 999
  br i1 %19, label %.loopexit6.us.loopexit, label %.lr.ph.us.new

.lr.ph.us.new:                                    ; preds = %.prol.loopexit
  br label %20

; <label>:20:                                     ; preds = %20, %.lr.ph.us.new
  %21 = phi double [ %.unr.ph, %.lr.ph.us.new ], [ %33, %20 ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.us.new ], [ %indvars.iv.next.1, %20 ]
  %22 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv, i64 %indvars.iv24
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv, i64 %indvars.iv22
  %25 = load double, double* %24, align 8
  %26 = fmul double %23, %25
  %27 = fadd double %21, %26
  store double %27, double* %10, align 8
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %28 = getelementptr inbounds [1000 x double], [1000 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv24
  %29 = load double, double* %28, align 8
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next, i64 %indvars.iv22
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = fadd double %27, %32
  store double %33, double* %10, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 999
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %.loopexit6.us.loopexit.unr-lcssa, label %20

.loopexit6.us.loopexit.unr-lcssa:                 ; preds = %20
  br label %.loopexit6.us.loopexit

.loopexit6.us.loopexit:                           ; preds = %.loopexit6.us.loopexit.unr-lcssa, %.prol.loopexit
  %.lcssa = phi double [ %.lcssa.unr.ph, %.prol.loopexit ], [ %33, %.loopexit6.us.loopexit.unr-lcssa ]
  br label %.loopexit6.us

.loopexit6.us:                                    ; preds = %.loopexit6.us.loopexit, %.preheader.us..loopexit6.us_crit_edge
  %34 = phi double [ %.pre26, %.preheader.us..loopexit6.us_crit_edge ], [ %.lcssa, %.loopexit6.us.loopexit ]
  %35 = fmul double %34, %2
  store double %35, double* %10, align 8
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next23, 1200
  br i1 %exitcond28, label %.loopexit.loopexit.us, label %.preheader.us

.loopexit.loopexit.us:                            ; preds = %.loopexit6.us
  %exitcond29 = icmp eq i64 %indvars.iv.next25, 1000
  br i1 %exitcond29, label %._crit_edge, label %.preheader3.us

._crit_edge:                                      ; preds = %.loopexit.loopexit.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1200 x double]*) #0 {
.preheader.lr.ph..preheader.us_crit_edge:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us, %.preheader.lr.ph..preheader.us_crit_edge
  %indvars.iv14 = phi i64 [ 0, %.preheader.lr.ph..preheader.us_crit_edge ], [ %indvars.iv.next15, %.loopexit.us ]
  %7 = mul nuw nsw i64 %indvars.iv14, 1000
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge11, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge11 ]
  %8 = add nuw nsw i64 %7, %indvars.iv
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge11

; <label>:12:                                     ; preds = %._crit_edge12
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %12, %._crit_edge12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv14, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %.loopexit.us, label %._crit_edge12

.loopexit.us:                                     ; preds = %._crit_edge11
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 1000
  br i1 %exitcond16, label %._crit_edge, label %.preheader.us

._crit_edge:                                      ; preds = %.loopexit.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
