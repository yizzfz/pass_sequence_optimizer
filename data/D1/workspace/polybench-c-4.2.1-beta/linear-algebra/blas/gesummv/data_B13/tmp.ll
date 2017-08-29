; ModuleID = 'A.ll'
source_filename = "gesummv.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 1690000, i32 8) #3
  %7 = tail call i8* @polybench_alloc_data(i64 1300, i32 8) #3
  %8 = tail call i8* @polybench_alloc_data(i64 1300, i32 8) #3
  %9 = tail call i8* @polybench_alloc_data(i64 1300, i32 8) #3
  %10 = bitcast i8* %5 to [1300 x double]*
  %11 = bitcast i8* %6 to [1300 x double]*
  %12 = bitcast i8* %8 to double*
  call void @init_array(i32 1300, double* nonnull %3, double* nonnull %4, [1300 x double]* %10, [1300 x double]* %11, double* %12)
  call void (...) @polybench_timer_start() #3
  %13 = load double, double* %3, align 8
  %14 = load double, double* %4, align 8
  %15 = bitcast i8* %7 to double*
  %16 = bitcast i8* %9 to double*
  call void @kernel_gesummv(i32 1300, double %13, double %14, [1300 x double]* %10, [1300 x double]* %11, double* %15, double* %12, double* %16)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %17 = icmp sgt i32 %0, 42
  br i1 %17, label %18, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:18:                                     ; preds = %2
  %19 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %19, align 1
  %20 = icmp eq i8 %strcmpload, 0
  br i1 %20, label %21, label %.._crit_edge_crit_edge19

.._crit_edge_crit_edge19:                         ; preds = %18
  br label %._crit_edge

; <label>:21:                                     ; preds = %18
  %22 = bitcast i8* %9 to double*
  call void @print_array(i32 1300, double* %22)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge19, %.._crit_edge_crit_edge, %21
  call void @free(i8* %5) #3
  call void @free(i8* %6) #3
  call void @free(i8* %7) #3
  call void @free(i8* %8) #3
  call void @free(i8* %9) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array(i32, double*, double*, [1300 x double]*, [1300 x double]*, double*) #0 {
.lr.ph21:
  store double 1.500000e+00, double* %1, align 8
  store double 1.200000e+00, double* %2, align 8
  br label %.lr.ph.us

.lr.ph.us:                                        ; preds = %._crit_edge.us..lr.ph.us_crit_edge, %.lr.ph21
  %indvars.iv23 = phi i64 [ %indvars.iv.next24, %._crit_edge.us..lr.ph.us_crit_edge ], [ 0, %.lr.ph21 ]
  %6 = trunc i64 %indvars.iv23 to i32
  %7 = sitofp i32 %6 to double
  %8 = fdiv double %7, 1.300000e+03
  %9 = getelementptr inbounds double, double* %5, i64 %indvars.iv23
  store double %8, double* %9, align 8
  br label %10

; <label>:10:                                     ; preds = %._crit_edge, %.lr.ph.us
  %indvars.iv = phi i64 [ 0, %.lr.ph.us ], [ %indvars.iv.next, %._crit_edge ]
  %11 = mul nuw nsw i64 %indvars.iv, %indvars.iv23
  %12 = add nuw nsw i64 %11, 1
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 1300
  %15 = sitofp i32 %14 to double
  %16 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv23, i64 %indvars.iv
  %17 = add nuw nsw i64 %11, 2
  %18 = trunc i64 %17 to i32
  %19 = srem i32 %18, 1300
  %20 = sitofp i32 %19 to double
  %21 = insertelement <2 x double> undef, double %15, i32 0
  %22 = insertelement <2 x double> %21, double %20, i32 1
  %23 = fdiv <2 x double> %22, <double 1.300000e+03, double 1.300000e+03>
  %24 = extractelement <2 x double> %23, i32 0
  %25 = extractelement <2 x double> %23, i32 1
  store double %24, double* %16, align 8
  %26 = getelementptr inbounds [1300 x double], [1300 x double]* %4, i64 %indvars.iv23, i64 %indvars.iv
  store double %25, double* %26, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge:                                      ; preds = %10
  br label %10

._crit_edge.us:                                   ; preds = %10
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next24, 1300
  br i1 %exitcond26, label %._crit_edge22, label %._crit_edge.us..lr.ph.us_crit_edge

._crit_edge.us..lr.ph.us_crit_edge:               ; preds = %._crit_edge.us
  br label %.lr.ph.us

._crit_edge22:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_gesummv(i32, double, double, [1300 x double]*, [1300 x double]*, double*, double*, double*) #0 {
.lr.ph30.split.us.preheader:
  %8 = ptrtoint double* %5 to i64
  %sunkaddr = ptrtoint double* %5 to i64
  %sunkaddr39 = ptrtoint double* %7 to i64
  %sunkaddr47 = ptrtoint double* %7 to i64
  br label %.lr.ph30.split.us

.lr.ph30.split.us:                                ; preds = %._crit_edge.us..lr.ph30.split.us_crit_edge, %.lr.ph30.split.us.preheader
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %._crit_edge.us..lr.ph30.split.us_crit_edge ], [ 0, %.lr.ph30.split.us.preheader ]
  %9 = getelementptr inbounds double, double* %5, i64 %indvars.iv32
  store double 0.000000e+00, double* %9, align 8
  %10 = getelementptr inbounds double, double* %7, i64 %indvars.iv32
  store double 0.000000e+00, double* %10, align 8
  %sunkaddr36 = shl i64 %indvars.iv32, 3
  %sunkaddr37 = add i64 %sunkaddr, %sunkaddr36
  %sunkaddr38 = inttoptr i64 %sunkaddr37 to double*
  %sunkaddr40 = shl i64 %indvars.iv32, 3
  %sunkaddr41 = add i64 %sunkaddr39, %sunkaddr40
  %sunkaddr42 = inttoptr i64 %sunkaddr41 to double*
  br label %11

; <label>:11:                                     ; preds = %._crit_edge, %.lr.ph30.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph30.split.us ], [ %indvars.iv.next, %._crit_edge ]
  %12 = getelementptr inbounds [1300 x double], [1300 x double]* %3, i64 %indvars.iv32, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = getelementptr inbounds double, double* %6, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = fmul double %13, %15
  %17 = load double, double* %sunkaddr38, align 8
  %18 = fadd double %16, %17
  store double %18, double* %sunkaddr38, align 8
  %19 = getelementptr inbounds [1300 x double], [1300 x double]* %4, i64 %indvars.iv32, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = load double, double* %14, align 8
  %22 = fmul double %20, %21
  %23 = load double, double* %sunkaddr42, align 8
  %24 = fadd double %22, %23
  store double %24, double* %sunkaddr42, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge:                                      ; preds = %11
  br label %11

._crit_edge.us:                                   ; preds = %11
  %sunkaddr44 = shl i64 %indvars.iv32, 3
  %sunkaddr45 = add i64 %8, %sunkaddr44
  %sunkaddr46 = inttoptr i64 %sunkaddr45 to double*
  %25 = load double, double* %sunkaddr46, align 8
  %26 = fmul double %25, %1
  %sunkaddr48 = shl i64 %indvars.iv32, 3
  %sunkaddr49 = add i64 %sunkaddr47, %sunkaddr48
  %sunkaddr50 = inttoptr i64 %sunkaddr49 to double*
  %27 = load double, double* %sunkaddr50, align 8
  %28 = fmul double %27, %2
  %29 = fadd double %26, %28
  store double %29, double* %sunkaddr50, align 8
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next33, 1300
  br i1 %exitcond35, label %._crit_edge31, label %._crit_edge.us..lr.ph30.split.us_crit_edge

._crit_edge.us..lr.ph30.split.us_crit_edge:       ; preds = %._crit_edge.us
  br label %.lr.ph30.split.us

._crit_edge31:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, double*) #0 {
.lr.ph.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge..lr.ph_crit_edge, %.lr.ph.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge..lr.ph_crit_edge ], [ 0, %.lr.ph.preheader ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %.lr.ph.._crit_edge_crit_edge

.lr.ph.._crit_edge_crit_edge:                     ; preds = %.lr.ph
  br label %._crit_edge

; <label>:9:                                      ; preds = %.lr.ph
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph.._crit_edge_crit_edge, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1300
  br i1 %exitcond, label %._crit_edge6, label %._crit_edge..lr.ph_crit_edge

._crit_edge..lr.ph_crit_edge:                     ; preds = %._crit_edge
  br label %.lr.ph

._crit_edge6:                                     ; preds = %._crit_edge
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %17) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
