; ModuleID = 'B.ll'
source_filename = "mvt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"x1\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"x2\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
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
  tail call void @init_array(i32 2000, double* %8, double* %9, double* %10, double* %11, [2000 x double]* %12)
  tail call void (...) @polybench_timer_start() #4
  %13 = bitcast i8* %7 to double*
  tail call void @kernel_mvt(i32 2000, double* %8, double* %9, double* %10, double* %13, [2000 x double]* %12)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %14 = icmp sgt i32 %0, 42
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %2
  %16 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %16, align 1
  %17 = icmp eq i8 %strcmpload, 0
  br i1 %17, label %18, label %._crit_edge

; <label>:18:                                     ; preds = %15
  %19 = bitcast i8* %5 to double*
  %20 = bitcast i8* %4 to double*
  tail call void @print_array(i32 2000, double* %20, double* %19)
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %15, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, double*, double*, double*, double*, [2000 x double]*) #2 {
.lr.ph5..lr.ph5.split.us_crit_edge:
  br label %.lr.ph5.split.us

.lr.ph5.split.us:                                 ; preds = %.loopexit.us, %.lr.ph5..lr.ph5.split.us_crit_edge
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %.loopexit.us ], [ 0, %.lr.ph5..lr.ph5.split.us_crit_edge ]
  %6 = trunc i64 %indvars.iv19 to i32
  %7 = srem i32 %6, 2000
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds double, double* %1, i64 %indvars.iv19
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %10 = trunc i64 %indvars.iv.next20 to i32
  %11 = srem i32 %10, 2000
  %12 = sitofp i32 %11 to double
  %13 = insertelement <2 x double> undef, double %8, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  %15 = fdiv <2 x double> %14, <double 2.000000e+03, double 2.000000e+03>
  %16 = extractelement <2 x double> %15, i32 0
  %17 = extractelement <2 x double> %15, i32 1
  store double %16, double* %9, align 8
  %18 = getelementptr inbounds double, double* %2, i64 %indvars.iv19
  store double %17, double* %18, align 8
  %19 = add nuw nsw i64 %indvars.iv19, 3
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 2000
  %22 = sitofp i32 %21 to double
  %23 = getelementptr inbounds double, double* %3, i64 %indvars.iv19
  %24 = add nuw nsw i64 %indvars.iv19, 4
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, 2000
  %27 = sitofp i32 %26 to double
  %28 = insertelement <2 x double> undef, double %22, i32 0
  %29 = insertelement <2 x double> %28, double %27, i32 1
  %30 = fdiv <2 x double> %29, <double 2.000000e+03, double 2.000000e+03>
  %31 = extractelement <2 x double> %30, i32 0
  %32 = extractelement <2 x double> %30, i32 1
  store double %31, double* %23, align 8
  %33 = getelementptr inbounds double, double* %4, i64 %indvars.iv19
  store double %32, double* %33, align 8
  br label %34

; <label>:34:                                     ; preds = %34, %.lr.ph5.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph5.split.us ], [ %indvars.iv.next.1, %34 ]
  %35 = mul nuw nsw i64 %indvars.iv19, %indvars.iv
  %36 = trunc i64 %35 to i32
  %37 = srem i32 %36, 2000
  %38 = sitofp i32 %37 to double
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv19, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %40 = mul nuw nsw i64 %indvars.iv19, %indvars.iv.next
  %41 = trunc i64 %40 to i32
  %42 = srem i32 %41, 2000
  %43 = sitofp i32 %42 to double
  %44 = insertelement <2 x double> undef, double %38, i32 0
  %45 = insertelement <2 x double> %44, double %43, i32 1
  %46 = fdiv <2 x double> %45, <double 2.000000e+03, double 2.000000e+03>
  %47 = bitcast double* %39 to <2 x double>*
  store <2 x double> %46, <2 x double>* %47, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 1999
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %.loopexit.us, label %34

.loopexit.us:                                     ; preds = %34
  %exitcond21 = icmp eq i64 %indvars.iv.next20, 2000
  br i1 %exitcond21, label %._crit_edge, label %.lr.ph5.split.us

._crit_edge:                                      ; preds = %.loopexit.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_mvt(i32, double*, double*, double*, double*, [2000 x double]*) #2 {
.preheader5.lr.ph..preheader5.us_crit_edge:
  %sunkaddr = ptrtoint double* %1 to i64
  %sunkaddr.1 = ptrtoint double* %1 to i64
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %.loopexit12.us, %.preheader5.lr.ph..preheader5.us_crit_edge
  %indvars.iv32 = phi i64 [ 0, %.preheader5.lr.ph..preheader5.us_crit_edge ], [ %indvars.iv.next33, %.loopexit12.us ]
  %6 = getelementptr inbounds double, double* %1, i64 %indvars.iv32
  %.pre = load double, double* %6, align 8
  %sunkaddr38 = shl nuw nsw i64 %indvars.iv32, 3
  %sunkaddr39 = add i64 %sunkaddr, %sunkaddr38
  %sunkaddr40 = inttoptr i64 %sunkaddr39 to double*
  %sunkaddr38.1 = shl nuw nsw i64 %indvars.iv32, 3
  %sunkaddr39.1 = add i64 %sunkaddr.1, %sunkaddr38.1
  %sunkaddr40.1 = inttoptr i64 %sunkaddr39.1 to double*
  br label %7

; <label>:7:                                      ; preds = %7, %.preheader5.us
  %8 = phi double [ %.pre, %.preheader5.us ], [ %20, %7 ]
  %indvars.iv28 = phi i64 [ 0, %.preheader5.us ], [ %indvars.iv.next29.1, %7 ]
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv32, i64 %indvars.iv28
  %10 = load double, double* %9, align 8
  %11 = getelementptr inbounds double, double* %3, i64 %indvars.iv28
  %12 = load double, double* %11, align 8
  %13 = fmul double %10, %12
  %14 = fadd double %8, %13
  store double %14, double* %sunkaddr40, align 8
  %indvars.iv.next29 = or i64 %indvars.iv28, 1
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv32, i64 %indvars.iv.next29
  %16 = load double, double* %15, align 8
  %17 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next29
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fadd double %14, %19
  store double %20, double* %sunkaddr40.1, align 8
  %exitcond31.1 = icmp eq i64 %indvars.iv.next29, 1999
  %indvars.iv.next29.1 = add nsw i64 %indvars.iv28, 2
  br i1 %exitcond31.1, label %.loopexit12.us, label %7

.loopexit12.us:                                   ; preds = %7
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next33, 2000
  br i1 %exitcond37, label %.preheader.us.preheader, label %.preheader5.us

.preheader.us.preheader:                          ; preds = %.loopexit12.us
  %sunkaddr41 = ptrtoint double* %2 to i64
  %sunkaddr41.1 = ptrtoint double* %2 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us, %.preheader.us.preheader
  %indvars.iv26 = phi i64 [ %indvars.iv.next27, %.loopexit.us ], [ 0, %.preheader.us.preheader ]
  %21 = getelementptr inbounds double, double* %2, i64 %indvars.iv26
  %.pre35 = load double, double* %21, align 8
  %sunkaddr42 = shl nuw nsw i64 %indvars.iv26, 3
  %sunkaddr43 = add i64 %sunkaddr41, %sunkaddr42
  %sunkaddr44 = inttoptr i64 %sunkaddr43 to double*
  %sunkaddr42.1 = shl nuw nsw i64 %indvars.iv26, 3
  %sunkaddr43.1 = add i64 %sunkaddr41.1, %sunkaddr42.1
  %sunkaddr44.1 = inttoptr i64 %sunkaddr43.1 to double*
  br label %22

; <label>:22:                                     ; preds = %22, %.preheader.us
  %23 = phi double [ %.pre35, %.preheader.us ], [ %35, %22 ]
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %22 ]
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv, i64 %indvars.iv26
  %25 = load double, double* %24, align 8
  %26 = getelementptr inbounds double, double* %4, i64 %indvars.iv
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = fadd double %23, %28
  store double %29, double* %sunkaddr44, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %5, i64 %indvars.iv.next, i64 %indvars.iv26
  %31 = load double, double* %30, align 8
  %32 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next
  %33 = load double, double* %32, align 8
  %34 = fmul double %31, %33
  %35 = fadd double %29, %34
  store double %35, double* %sunkaddr44.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 1999
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %.loopexit.us, label %22

.loopexit.us:                                     ; preds = %22
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next27, 2000
  br i1 %exitcond36, label %.preheader4._crit_edge, label %.preheader.us

.preheader4._crit_edge:                           ; preds = %.loopexit.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, double*, double*) #0 {
.lr.ph8:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %7

; <label>:7:                                      ; preds = %._crit_edge13, %.lr.ph8
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %._crit_edge13 ], [ 0, %.lr.ph8 ]
  %storemerge6 = phi i32 [ %16, %._crit_edge13 ], [ 0, %.lr.ph8 ]
  %8 = srem i32 %storemerge6, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge13

; <label>:10:                                     ; preds = %7
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc4 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %10, %7
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds double, double* %1, i64 %indvars.iv19
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %16 = trunc i64 %indvars.iv.next20 to i32
  %exitcond21 = icmp eq i64 %indvars.iv.next20, 2000
  br i1 %exitcond21, label %._crit_edge, label %7

._crit_edge:                                      ; preds = %._crit_edge13
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #6
  br label %21

; <label>:21:                                     ; preds = %._crit_edge16, %._crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge16 ], [ 0, %._crit_edge ]
  %storemerge15 = phi i32 [ %30, %._crit_edge16 ], [ 0, %._crit_edge ]
  %22 = srem i32 %storemerge15, 20
  %23 = icmp eq i32 %22, 0
  br i1 %23, label %24, label %._crit_edge16

; <label>:24:                                     ; preds = %21
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %25) #5
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %24, %21
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = getelementptr inbounds double, double* %2, i64 %indvars.iv
  %28 = load double, double* %27, align 8
  %29 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %28) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %30 = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge15, label %21

._crit_edge15:                                    ; preds = %._crit_edge16
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #6
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %33) #5
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
