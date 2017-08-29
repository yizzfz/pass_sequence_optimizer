; ModuleID = 'A.ll'
source_filename = "mvt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"x1\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"x2\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %8 = bitcast i8* %4 to double*
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  %11 = bitcast i8* %7 to double*
  %12 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(double* %8, double* %9, double* %10, double* %11, [2000 x double]* %12)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_mvt(double* %8, double* %9, double* %10, double* %11, [2000 x double]* %12)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

._crit_edge:                                      ; preds = %2
  br label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge1

._crit_edge1:                                     ; preds = %14
  br label %18

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(double* %8, double* %9)
  br label %18

; <label>:18:                                     ; preds = %._crit_edge1, %._crit_edge, %17
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, double* nocapture, double* nocapture, double* nocapture, [2000 x double]* nocapture) unnamed_addr #2 {
.lr.ph4:
  br label %.lr.ph.us

.lr.ph.us:                                        ; preds = %..loopexit_crit_edge.us..lr.ph.us_crit_edge, %.lr.ph4
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %..loopexit_crit_edge.us..lr.ph.us_crit_edge ], [ 0, %.lr.ph4 ]
  %5 = trunc i64 %indvars.iv1 to i32
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds double, double* %0, i64 %indvars.iv1
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %8 = icmp eq i64 %indvars.iv.next2, 2000
  %9 = trunc i64 %indvars.iv.next2 to i32
  %10 = sitofp i32 %9 to double
  %11 = insertelement <2 x double> undef, double %6, i32 0
  %12 = insertelement <2 x double> %11, double %10, i32 1
  %.op = fdiv <2 x double> %12, <double 2.000000e+03, double 2.000000e+03>
  %.op.v.r1 = extractelement <2 x double> %.op, i32 0
  %.op.v.r2 = extractelement <2 x double> %.op, i32 1
  store double %.op.v.r1, double* %7, align 8
  %13 = select i1 %8, double 0.000000e+00, double %.op.v.r2
  %14 = getelementptr inbounds double, double* %1, i64 %indvars.iv1
  store double %13, double* %14, align 8
  %15 = add nuw nsw i64 %indvars.iv1, 3
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 2000
  %18 = sitofp i32 %17 to double
  %19 = getelementptr inbounds double, double* %2, i64 %indvars.iv1
  %20 = add nuw nsw i64 %indvars.iv1, 4
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, 2000
  %23 = sitofp i32 %22 to double
  %24 = insertelement <2 x double> undef, double %18, i32 0
  %25 = insertelement <2 x double> %24, double %23, i32 1
  %26 = fdiv <2 x double> %25, <double 2.000000e+03, double 2.000000e+03>
  %27 = extractelement <2 x double> %26, i32 0
  %28 = extractelement <2 x double> %26, i32 1
  store double %27, double* %19, align 8
  %29 = getelementptr inbounds double, double* %3, i64 %indvars.iv1
  store double %28, double* %29, align 8
  br label %30

; <label>:30:                                     ; preds = %._crit_edge4, %.lr.ph.us
  %indvars.iv = phi i64 [ 0, %.lr.ph.us ], [ %indvars.iv.next.1, %._crit_edge4 ]
  %31 = mul nuw nsw i64 %indvars.iv, %indvars.iv1
  %32 = trunc i64 %31 to i32
  %33 = srem i32 %32, 2000
  %34 = sitofp i32 %33 to double
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %indvars.iv1, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %36 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv1
  %37 = trunc i64 %36 to i32
  %38 = srem i32 %37, 2000
  %39 = sitofp i32 %38 to double
  %40 = insertelement <2 x double> undef, double %34, i32 0
  %41 = insertelement <2 x double> %40, double %39, i32 1
  %42 = fdiv <2 x double> %41, <double 2.000000e+03, double 2.000000e+03>
  %43 = bitcast double* %35 to <2 x double>*
  store <2 x double> %42, <2 x double>* %43, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %..loopexit_crit_edge.us, label %._crit_edge4

._crit_edge4:                                     ; preds = %30
  br label %30

..loopexit_crit_edge.us:                          ; preds = %30
  br i1 %8, label %._crit_edge, label %..loopexit_crit_edge.us..lr.ph.us_crit_edge

..loopexit_crit_edge.us..lr.ph.us_crit_edge:      ; preds = %..loopexit_crit_edge.us
  br label %.lr.ph.us

._crit_edge:                                      ; preds = %..loopexit_crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_mvt(double* nocapture, double* nocapture, double* nocapture readonly, double* nocapture readonly, [2000 x double]* nocapture readonly) unnamed_addr #2 {
.preheader4.us.preheader:
  %sunkaddr = ptrtoint double* %0 to i64
  br label %.preheader4.us

.preheader4.us:                                   ; preds = %._crit_edge10.us..preheader4.us_crit_edge, %.preheader4.us.preheader
  %indvars.iv7 = phi i64 [ 0, %.preheader4.us.preheader ], [ %indvars.iv.next8, %._crit_edge10.us..preheader4.us_crit_edge ]
  %5 = getelementptr inbounds double, double* %0, i64 %indvars.iv7
  %.pre = load double, double* %5, align 8
  %sunkaddr11 = shl i64 %indvars.iv7, 3
  %sunkaddr12 = add i64 %sunkaddr, %sunkaddr11
  %sunkaddr13 = inttoptr i64 %sunkaddr12 to double*
  br label %6

; <label>:6:                                      ; preds = %._crit_edge, %.preheader4.us
  %7 = phi double [ %.pre, %.preheader4.us ], [ %19, %._crit_edge ]
  %indvars.iv4 = phi i64 [ 0, %.preheader4.us ], [ %indvars.iv.next5.1, %._crit_edge ]
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %indvars.iv7, i64 %indvars.iv4
  %9 = load double, double* %8, align 8
  %10 = getelementptr inbounds double, double* %2, i64 %indvars.iv4
  %11 = load double, double* %10, align 8
  %12 = fmul double %9, %11
  %13 = fadd double %7, %12
  store double %13, double* %sunkaddr13, align 8
  %indvars.iv.next5 = or i64 %indvars.iv4, 1
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %indvars.iv7, i64 %indvars.iv.next5
  %15 = load double, double* %14, align 8
  %16 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next5
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fadd double %13, %18
  store double %19, double* %sunkaddr13, align 8
  %indvars.iv.next5.1 = add nuw nsw i64 %indvars.iv4, 2
  %exitcond6.1 = icmp eq i64 %indvars.iv.next5.1, 2000
  br i1 %exitcond6.1, label %._crit_edge10.us, label %._crit_edge

._crit_edge:                                      ; preds = %6
  br label %6

._crit_edge10.us:                                 ; preds = %6
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 2000
  br i1 %exitcond9, label %.preheader.us.preheader, label %._crit_edge10.us..preheader4.us_crit_edge

._crit_edge10.us..preheader4.us_crit_edge:        ; preds = %._crit_edge10.us
  br label %.preheader4.us

.preheader.us.preheader:                          ; preds = %._crit_edge10.us
  %sunkaddr14 = ptrtoint double* %1 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge.us..preheader.us_crit_edge ], [ 0, %.preheader.us.preheader ]
  %20 = getelementptr inbounds double, double* %1, i64 %indvars.iv1
  %.pre10 = load double, double* %20, align 8
  %sunkaddr15 = shl i64 %indvars.iv1, 3
  %sunkaddr16 = add i64 %sunkaddr14, %sunkaddr15
  %sunkaddr17 = inttoptr i64 %sunkaddr16 to double*
  br label %21

; <label>:21:                                     ; preds = %._crit_edge18, %.preheader.us
  %22 = phi double [ %.pre10, %.preheader.us ], [ %34, %._crit_edge18 ]
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %._crit_edge18 ]
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %indvars.iv, i64 %indvars.iv1
  %24 = load double, double* %23, align 8
  %25 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %26 = load double, double* %25, align 8
  %27 = fmul double %24, %26
  %28 = fadd double %22, %27
  store double %28, double* %sunkaddr17, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %4, i64 %indvars.iv.next, i64 %indvars.iv1
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fadd double %28, %33
  store double %34, double* %sunkaddr17, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %._crit_edge.us, label %._crit_edge18

._crit_edge18:                                    ; preds = %21
  br label %21

._crit_edge.us:                                   ; preds = %21
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond3, label %._crit_edge7, label %._crit_edge.us..preheader.us_crit_edge

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge7:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly, double* nocapture readonly) unnamed_addr #0 {
.lr.ph7.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph7

.lr.ph7:                                          ; preds = %..lr.ph7_crit_edge, %.lr.ph7.preheader
  %indvars.iv1 = phi i64 [ 0, %.lr.ph7.preheader ], [ %indvars.iv.next2, %..lr.ph7_crit_edge ]
  %6 = trunc i64 %indvars.iv1 to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %.lr.ph7._crit_edge

.lr.ph7._crit_edge:                               ; preds = %.lr.ph7
  br label %11

; <label>:9:                                      ; preds = %.lr.ph7
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #5
  br label %11

; <label>:11:                                     ; preds = %.lr.ph7._crit_edge, %9
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds double, double* %0, i64 %indvars.iv1
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond3, label %.lr.ph.preheader, label %..lr.ph7_crit_edge

..lr.ph7_crit_edge:                               ; preds = %11
  br label %.lr.ph7

.lr.ph.preheader:                                 ; preds = %11
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #6
  br label %.lr.ph

.lr.ph:                                           ; preds = %..lr.ph_crit_edge, %.lr.ph.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %..lr.ph_crit_edge ]
  %20 = trunc i64 %indvars.iv to i32
  %21 = srem i32 %20, 20
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %.lr.ph
  br label %25

; <label>:23:                                     ; preds = %.lr.ph
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %24) #5
  br label %25

; <label>:25:                                     ; preds = %.lr.ph._crit_edge, %23
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %28 = load double, double* %27, align 8
  %29 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %28) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge, label %..lr.ph_crit_edge

..lr.ph_crit_edge:                                ; preds = %25
  br label %.lr.ph

._crit_edge:                                      ; preds = %25
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %31 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #6
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %32) #5
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
