; ModuleID = 'B.ll'
source_filename = "gesummv.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 1690000, i32 8) #4
  %7 = call i8* @polybench_alloc_data(i64 1300, i32 8) #4
  %8 = call i8* @polybench_alloc_data(i64 1300, i32 8) #4
  %9 = call i8* @polybench_alloc_data(i64 1300, i32 8) #4
  %10 = bitcast i8* %5 to [1300 x double]*
  %11 = bitcast i8* %6 to [1300 x double]*
  %12 = bitcast i8* %8 to double*
  call void @init_array(i32 1300, double* nonnull %3, double* nonnull %4, [1300 x double]* %10, [1300 x double]* %11, double* %12)
  call void (...) @polybench_timer_start() #4
  %13 = load double, double* %3, align 8
  %14 = load double, double* %4, align 8
  %15 = bitcast i8* %7 to double*
  %16 = bitcast i8* %9 to double*
  call void @kernel_gesummv(i32 1300, double %13, double %14, [1300 x double]* %10, [1300 x double]* %11, double* %15, double* %12, double* %16)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %17 = icmp sgt i32 %0, 42
  br i1 %17, label %18, label %23

; <label>:18:                                     ; preds = %2
  %19 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %19, align 1
  %20 = icmp eq i8 %strcmpload, 0
  br i1 %20, label %21, label %23

; <label>:21:                                     ; preds = %18
  %22 = bitcast i8* %9 to double*
  call void @print_array(i32 1300, double* %22)
  br label %23

; <label>:23:                                     ; preds = %21, %18, %2
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  call void @free(i8* %8) #4
  call void @free(i8* %9) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, double* nocapture, double* nocapture, [1300 x double]*, [1300 x double]*, double*) #2 {
  store double 1.500000e+00, double* %1, align 8
  store double 1.200000e+00, double* %2, align 8
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph4.split.us.preheader, label %._crit_edge5

.lr.ph4.split.us.preheader:                       ; preds = %6
  %8 = sitofp i32 %0 to double
  %9 = sext i32 %0 to i64
  %10 = insertelement <2 x double> undef, double %8, i32 0
  %11 = shufflevector <2 x double> %10, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph4.split.us

.lr.ph4.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph4.split.us.preheader
  %indvars.iv11 = phi i64 [ 0, %.lr.ph4.split.us.preheader ], [ %indvars.iv.next12, %._crit_edge.us ]
  %12 = trunc i64 %indvars.iv11 to i32
  %13 = srem i32 %12, %0
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, %8
  %16 = getelementptr inbounds double, double* %5, i64 %indvars.iv11
  store double %15, double* %16, align 8
  br label %17

; <label>:17:                                     ; preds = %17, %.lr.ph4.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph4.split.us ], [ %indvars.iv.next, %17 ]
  %18 = mul nsw i64 %indvars.iv, %indvars.iv11
  %19 = add nsw i64 %18, 1
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, %0
  %22 = sitofp i32 %21 to double
  %23 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv11, i64 %indvars.iv
  %24 = add nsw i64 %18, 2
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, %0
  %27 = sitofp i32 %26 to double
  %28 = insertelement <2 x double> undef, double %22, i32 0
  %29 = insertelement <2 x double> %28, double %27, i32 1
  %30 = fdiv <2 x double> %29, %11
  %31 = extractelement <2 x double> %30, i32 0
  %32 = extractelement <2 x double> %30, i32 1
  store double %31, double* %23, align 8
  %33 = getelementptr inbounds [1300 x double], [1300 x double]* %4, i64 %indvars.iv11, i64 %indvars.iv
  store double %32, double* %33, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %34 = icmp slt i64 %indvars.iv.next, %9
  br i1 %34, label %17, label %._crit_edge.us

._crit_edge.us:                                   ; preds = %17
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, 1
  %35 = icmp slt i64 %indvars.iv.next12, %9
  br i1 %35, label %.lr.ph4.split.us, label %._crit_edge5.loopexit

._crit_edge5.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit, %6
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_gesummv(i32, double, double, [1300 x double]*, [1300 x double]*, double*, double*, double*) #2 {
  %9 = icmp sgt i32 %0, 0
  br i1 %9, label %.lr.ph3.split.us.preheader, label %._crit_edge4

.lr.ph3.split.us.preheader:                       ; preds = %8
  %10 = sext i32 %0 to i64
  %sunkaddr37 = ptrtoint double* %5 to i64
  %sunkaddr = ptrtoint double* %5 to i64
  %sunkaddr33 = ptrtoint double* %7 to i64
  %sunkaddr41 = ptrtoint double* %7 to i64
  br label %.lr.ph3.split.us

.lr.ph3.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph3.split.us.preheader
  %indvars.iv11 = phi i64 [ 0, %.lr.ph3.split.us.preheader ], [ %indvars.iv.next12, %._crit_edge.us ]
  %11 = getelementptr inbounds double, double* %5, i64 %indvars.iv11
  store double 0.000000e+00, double* %11, align 8
  %12 = getelementptr inbounds double, double* %7, i64 %indvars.iv11
  store double 0.000000e+00, double* %12, align 8
  %sunkaddr30 = shl i64 %indvars.iv11, 3
  %sunkaddr31 = add i64 %sunkaddr, %sunkaddr30
  %sunkaddr32 = inttoptr i64 %sunkaddr31 to double*
  %sunkaddr34 = shl i64 %indvars.iv11, 3
  %sunkaddr35 = add i64 %sunkaddr33, %sunkaddr34
  %sunkaddr36 = inttoptr i64 %sunkaddr35 to double*
  br label %13

; <label>:13:                                     ; preds = %13, %.lr.ph3.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph3.split.us ], [ %indvars.iv.next, %13 ]
  %14 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv11, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = getelementptr inbounds double, double* %6, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = load double, double* %sunkaddr32, align 8
  %20 = fadd double %18, %19
  store double %20, double* %sunkaddr32, align 8
  %21 = getelementptr inbounds [1300 x double], [1300 x double]* %4, i64 %indvars.iv11, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = load double, double* %16, align 8
  %24 = fmul double %22, %23
  %25 = load double, double* %sunkaddr36, align 8
  %26 = fadd double %24, %25
  store double %26, double* %sunkaddr36, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %27 = icmp slt i64 %indvars.iv.next, %10
  br i1 %27, label %13, label %._crit_edge.us

._crit_edge.us:                                   ; preds = %13
  %sunkaddr38 = shl i64 %indvars.iv11, 3
  %sunkaddr39 = add i64 %sunkaddr37, %sunkaddr38
  %sunkaddr40 = inttoptr i64 %sunkaddr39 to double*
  %28 = load double, double* %sunkaddr40, align 8
  %29 = fmul double %28, %1
  %30 = fmul double %26, %2
  %31 = fadd double %29, %30
  %sunkaddr42 = shl i64 %indvars.iv11, 3
  %sunkaddr43 = add i64 %sunkaddr41, %sunkaddr42
  %sunkaddr44 = inttoptr i64 %sunkaddr43 to double*
  store double %31, double* %sunkaddr44, align 8
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, 1
  %32 = icmp slt i64 %indvars.iv.next12, %10
  br i1 %32, label %.lr.ph3.split.us, label %._crit_edge4.loopexit

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %8
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, double*) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = icmp sgt i32 %0, 0
  br i1 %7, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %2
  %8 = sext i32 %0 to i64
  br label %9

; <label>:9:                                      ; preds = %15, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %15 ]
  %10 = trunc i64 %indvars.iv to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %9
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %15

; <label>:15:                                     ; preds = %13, %9
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %20 = icmp slt i64 %indvars.iv.next, %8
  br i1 %20, label %9, label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %15
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %2
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
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