; ModuleID = 'A.ll'
source_filename = "atax.c"
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
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %7 = bitcast i8* %3 to [2100 x double]*
  %8 = bitcast i8* %4 to double*
  call void @init_array([2100 x double]* %7, double* %8)
  call void (...) @polybench_timer_start() #4
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  call void @kernel_atax([2100 x double]* %7, double* %8, double* %9, double* %10)
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
  %16 = bitcast i8* %5 to double*
  call void @print_array(double* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array([2100 x double]* nocapture, double* nocapture) #2 {
.lr.ph13.preheader:
  br label %.lr.ph13

.lr.ph13:                                         ; preds = %.lr.ph13, %.lr.ph13.preheader
  %indvars.iv311 = phi i64 [ 0, %.lr.ph13.preheader ], [ %indvars.iv.next4.1.1, %.lr.ph13 ]
  %2 = trunc i64 %indvars.iv311 to i32
  %3 = sitofp i32 %2 to double
  %4 = getelementptr inbounds double, double* %1, i64 %indvars.iv311
  %5 = trunc i64 %indvars.iv311 to i32
  %6 = or i32 %5, 1
  %7 = sitofp i32 %6 to double
  %8 = insertelement <2 x double> undef, double %3, i32 0
  %9 = insertelement <2 x double> %8, double %7, i32 1
  %10 = fdiv <2 x double> %9, <double 2.100000e+03, double 2.100000e+03>
  %11 = fadd <2 x double> %10, <double 1.000000e+00, double 1.000000e+00>
  %12 = bitcast double* %4 to <2 x double>*
  store <2 x double> %11, <2 x double>* %12, align 8
  %indvars.iv.next4.1 = or i64 %indvars.iv311, 2
  %13 = trunc i64 %indvars.iv.next4.1 to i32
  %14 = sitofp i32 %13 to double
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next4.1
  %16 = trunc i64 %indvars.iv.next4.1 to i32
  %17 = or i32 %16, 1
  %18 = sitofp i32 %17 to double
  %19 = insertelement <2 x double> undef, double %14, i32 0
  %20 = insertelement <2 x double> %19, double %18, i32 1
  %21 = fdiv <2 x double> %20, <double 2.100000e+03, double 2.100000e+03>
  %22 = fadd <2 x double> %21, <double 1.000000e+00, double 1.000000e+00>
  %23 = bitcast double* %15 to <2 x double>*
  store <2 x double> %22, <2 x double>* %23, align 8
  %indvars.iv.next4.1.1 = add nsw i64 %indvars.iv311, 4
  %exitcond15.1.1 = icmp eq i64 %indvars.iv.next4.1.1, 2100
  br i1 %exitcond15.1.1, label %.lr.ph9.preheader, label %.lr.ph13

.lr.ph9.preheader:                                ; preds = %.lr.ph13
  br label %.lr.ph9

.lr.ph9:                                          ; preds = %.lr.ph9.preheader, %._crit_edge
  %indvars.iv16 = phi i64 [ %indvars.iv.next2, %._crit_edge ], [ 0, %.lr.ph9.preheader ]
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph9
  %indvars.iv5 = phi i64 [ 0, %.lr.ph9 ], [ %indvars.iv.next.1, %.lr.ph ]
  %24 = add nuw nsw i64 %indvars.iv16, %indvars.iv5
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, 2100
  %27 = sitofp i32 %26 to double
  %28 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv16, i64 %indvars.iv5
  %indvars.iv.next = or i64 %indvars.iv5, 1
  %29 = add nuw nsw i64 %indvars.iv16, %indvars.iv.next
  %30 = trunc i64 %29 to i32
  %31 = srem i32 %30, 2100
  %32 = sitofp i32 %31 to double
  %33 = insertelement <2 x double> undef, double %27, i32 0
  %34 = insertelement <2 x double> %33, double %32, i32 1
  %35 = fdiv <2 x double> %34, <double 9.500000e+03, double 9.500000e+03>
  %36 = bitcast double* %28 to <2 x double>*
  store <2 x double> %35, <2 x double>* %36, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv5, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2100
  br i1 %exitcond.1, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %.lr.ph
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond = icmp eq i64 %indvars.iv.next2, 1900
  br i1 %exitcond, label %._crit_edge10, label %.lr.ph9

._crit_edge10:                                    ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_atax([2100 x double]* nocapture readonly, double* nocapture readonly, double* nocapture, double*) #0 {
.lr.ph19.preheader:
  %4 = bitcast double* %2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 16800, i32 8, i1 false)
  %sunkaddr = ptrtoint double* %3 to i64
  %sunkaddr49 = ptrtoint double* %3 to i64
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge11, %.lr.ph19.preheader
  %indvars.iv312 = phi i64 [ 0, %.lr.ph19.preheader ], [ %indvars.iv.next4, %._crit_edge11 ]
  %5 = getelementptr inbounds double, double* %3, i64 %indvars.iv312
  store double 0.000000e+00, double* %5, align 8
  %sunkaddr46 = shl nuw nsw i64 %indvars.iv312, 3
  %sunkaddr47 = add i64 %sunkaddr, %sunkaddr46
  %sunkaddr48 = inttoptr i64 %sunkaddr47 to double*
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new, %.lr.ph
  %indvars.iv7 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.1, %.lr.ph.new ]
  %6 = load double, double* %sunkaddr48, align 8
  %7 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv312, i64 %indvars.iv7
  %8 = load double, double* %7, align 8
  %9 = getelementptr inbounds double, double* %1, i64 %indvars.iv7
  %10 = load double, double* %9, align 8
  %11 = fmul double %8, %10
  %12 = fadd double %6, %11
  store double %12, double* %sunkaddr48, align 8
  %indvars.iv.next = or i64 %indvars.iv7, 1
  %13 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv312, i64 %indvars.iv.next
  %14 = load double, double* %13, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fadd double %12, %17
  store double %18, double* %sunkaddr48, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv7, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2100
  br i1 %exitcond.1, label %.lr.ph10.new.preheader, label %.lr.ph.new

.lr.ph10.new.preheader:                           ; preds = %.lr.ph.new
  %sunkaddr50 = shl nuw nsw i64 %indvars.iv312, 3
  %sunkaddr51 = add i64 %sunkaddr49, %sunkaddr50
  %sunkaddr52 = inttoptr i64 %sunkaddr51 to double*
  br label %.lr.ph10.new

.lr.ph10.new:                                     ; preds = %.lr.ph10.new.preheader, %.lr.ph10.new
  %indvars.iv18 = phi i64 [ %indvars.iv.next2.1, %.lr.ph10.new ], [ 0, %.lr.ph10.new.preheader ]
  %19 = getelementptr inbounds double, double* %2, i64 %indvars.iv18
  %20 = load double, double* %19, align 8
  %21 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv312, i64 %indvars.iv18
  %22 = load double, double* %21, align 8
  %23 = load double, double* %sunkaddr52, align 8
  %24 = fmul double %22, %23
  %25 = fadd double %20, %24
  store double %25, double* %19, align 8
  %indvars.iv.next2 = or i64 %indvars.iv18, 1
  %26 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next2
  %27 = load double, double* %26, align 8
  %28 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv312, i64 %indvars.iv.next2
  %29 = load double, double* %28, align 8
  %30 = load double, double* %sunkaddr52, align 8
  %31 = fmul double %29, %30
  %32 = fadd double %27, %31
  store double %32, double* %26, align 8
  %indvars.iv.next2.1 = add nuw nsw i64 %indvars.iv18, 2
  %exitcond.126 = icmp eq i64 %indvars.iv.next2.1, 2100
  br i1 %exitcond.126, label %._crit_edge11, label %.lr.ph10.new

._crit_edge11:                                    ; preds = %.lr.ph10.new
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv312, 1
  %exitcond = icmp eq i64 %indvars.iv.next4, 1900
  br i1 %exitcond, label %._crit_edge16, label %.lr.ph

._crit_edge16:                                    ; preds = %._crit_edge11
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(double* nocapture readonly) #0 {
.lr.ph.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #6
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph._crit_edge, %.lr.ph.preheader
  %indvars.iv1 = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %.lr.ph._crit_edge ]
  %5 = trunc i64 %indvars.iv1 to i32
  %6 = srem i32 %5, 20
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %.lr.ph._crit_edge

; <label>:8:                                      ; preds = %.lr.ph
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %9) #6
  br label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %.lr.ph, %8
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = getelementptr inbounds double, double* %0, i64 %indvars.iv1
  %12 = load double, double* %11, align 8
  %13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %12) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2100
  br i1 %exitcond, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %.lr.ph._crit_edge
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %16) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
