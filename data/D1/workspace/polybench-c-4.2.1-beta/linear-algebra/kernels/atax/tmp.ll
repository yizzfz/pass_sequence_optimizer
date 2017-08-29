; ModuleID = 'B.ll'
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
define i32 @main(i32, i8**) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %7 = bitcast i8* %3 to [2100 x double]*
  %8 = bitcast i8* %4 to double*
  tail call void @init_array(i32 1900, i32 2100, [2100 x double]* %7, double* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  tail call void @kernel_atax(i32 1900, i32 2100, [2100 x double]* %7, double* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to double*
  tail call void @print_array(i32 2100, double* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %15, %12, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, [2100 x double]*, double*) #2 {
.lr.ph8.preheader:
  br label %.lr.ph8

.preheader.us:                                    ; preds = %.preheader.us.preheader, %.loopexit.us
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %.loopexit.us ], [ 0, %.preheader.us.preheader ]
  br label %4

; <label>:4:                                      ; preds = %4, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.1, %4 ]
  %5 = add nuw nsw i64 %indvars.iv20, %indvars.iv
  %6 = trunc i64 %5 to i32
  %7 = srem i32 %6, 2100
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv20, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %10 = add nuw nsw i64 %indvars.iv20, %indvars.iv.next
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 2100
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %8, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fdiv <2 x double> %15, <double 9.500000e+03, double 9.500000e+03>
  %17 = bitcast double* %9 to <2 x double>*
  store <2 x double> %16, <2 x double>* %17, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 2099
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %.loopexit.us, label %4

.loopexit.us:                                     ; preds = %4
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next21, 1900
  br i1 %exitcond23, label %.preheader3._crit_edge, label %.preheader.us

.lr.ph8:                                          ; preds = %.lr.ph8, %.lr.ph8.preheader
  %indvars.iv24 = phi i64 [ 0, %.lr.ph8.preheader ], [ %indvars.iv.next25.2, %.lr.ph8 ]
  %18 = trunc i64 %indvars.iv24 to i32
  %19 = sitofp i32 %18 to double
  %20 = getelementptr inbounds double, double* %3, i64 %indvars.iv24
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %21 = trunc i64 %indvars.iv.next25 to i32
  %22 = sitofp i32 %21 to double
  %23 = insertelement <2 x double> undef, double %19, i32 0
  %24 = insertelement <2 x double> %23, double %22, i32 1
  %25 = fdiv <2 x double> %24, <double 2.100000e+03, double 2.100000e+03>
  %26 = fadd <2 x double> %25, <double 1.000000e+00, double 1.000000e+00>
  %27 = bitcast double* %20 to <2 x double>*
  store <2 x double> %26, <2 x double>* %27, align 8
  %indvars.iv.next25.1 = add nsw i64 %indvars.iv24, 2
  %28 = trunc i64 %indvars.iv.next25.1 to i32
  %29 = sitofp i32 %28 to double
  %30 = fdiv double %29, 2.100000e+03
  %31 = fadd double %30, 1.000000e+00
  %32 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next25.1
  store double %31, double* %32, align 8
  %indvars.iv.next25.2 = add nsw i64 %indvars.iv24, 3
  %exitcond28.2 = icmp eq i64 %indvars.iv.next25.2, 2100
  br i1 %exitcond28.2, label %.preheader.us.preheader, label %.lr.ph8

.preheader.us.preheader:                          ; preds = %.lr.ph8
  br label %.preheader.us

.preheader3._crit_edge:                           ; preds = %.loopexit.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_atax(i32, i32, [2100 x double]*, double*, double*, double*) #2 {
.lr.ph13:
  %6 = bitcast double* %4 to i8*
  call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 16800, i32 8, i1 false)
  br label %._crit_edge34

.lr.ph9.split.us:                                 ; preds = %.lr.ph9.split.us.preheader, %.loopexit.us
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %.loopexit.us ], [ 0, %.lr.ph9.split.us.preheader ]
  %sext = shl i64 %indvars.iv39, 32
  %7 = ashr exact i64 %sext, 32
  %8 = getelementptr inbounds double, double* %5, i64 %7
  store double 0.000000e+00, double* %8, align 8
  %9 = getelementptr inbounds double, double* %5, i64 %indvars.iv39
  %.pre = load double, double* %9, align 8
  %sunkaddr50 = shl nuw nsw i64 %indvars.iv39, 3
  %sunkaddr51 = add i64 %sunkaddr, %sunkaddr50
  %sunkaddr52 = inttoptr i64 %sunkaddr51 to double*
  %sunkaddr50.1 = shl nuw nsw i64 %indvars.iv39, 3
  %sunkaddr51.1 = add i64 %sunkaddr.1, %sunkaddr50.1
  %sunkaddr52.1 = inttoptr i64 %sunkaddr51.1 to double*
  br label %10

; <label>:10:                                     ; preds = %10, %.lr.ph9.split.us
  %11 = phi double [ %.pre, %.lr.ph9.split.us ], [ %23, %10 ]
  %indvars.iv = phi i64 [ 0, %.lr.ph9.split.us ], [ %indvars.iv.next.1, %10 ]
  %12 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = fmul double %13, %15
  %17 = fadd double %11, %16
  store double %17, double* %sunkaddr52, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %18 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv.next
  %19 = load double, double* %18, align 8
  %20 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = fadd double %17, %22
  store double %23, double* %sunkaddr52.1, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 2099
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %.lr.ph7.us.preheader, label %10

.lr.ph7.us.preheader:                             ; preds = %10
  %24 = load double, double* %4, align 8
  %25 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv39, i64 0
  %26 = load double, double* %25, align 8
  %27 = fmul double %26, %23
  %28 = fadd double %24, %27
  store double %28, double* %4, align 8
  %sunkaddr54 = shl nuw nsw i64 %indvars.iv39, 3
  %sunkaddr55 = add i64 %sunkaddr53, %sunkaddr54
  %sunkaddr56 = inttoptr i64 %sunkaddr55 to double*
  %sunkaddr54.1 = shl nuw nsw i64 %indvars.iv39, 3
  %sunkaddr55.1 = add i64 %sunkaddr53.1, %sunkaddr54.1
  %sunkaddr56.1 = inttoptr i64 %sunkaddr55.1 to double*
  br label %._crit_edge33

._crit_edge33:                                    ; preds = %._crit_edge33.1, %.lr.ph7.us.preheader
  %indvars.iv.next3859 = phi i64 [ 1, %.lr.ph7.us.preheader ], [ %indvars.iv.next38.1, %._crit_edge33.1 ]
  %.pre41 = load double, double* %sunkaddr56, align 8
  %29 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next3859
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv.next3859
  %32 = load double, double* %31, align 8
  %33 = fmul double %32, %.pre41
  %34 = fadd double %30, %33
  store double %34, double* %29, align 8
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv.next3859, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next3859, 2099
  br i1 %exitcond46, label %.loopexit.us, label %._crit_edge33.1

.loopexit.us:                                     ; preds = %._crit_edge33
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next40, 1900
  br i1 %exitcond47, label %.preheader4._crit_edge, label %.lr.ph9.split.us

._crit_edge34:                                    ; preds = %._crit_edge34, %.lr.ph13
  %35 = phi i32 [ 0, %.lr.ph13 ], [ %36, %._crit_edge34 ]
  %36 = add nsw i32 %35, 25
  %exitcond49.24 = icmp eq i32 %36, 2100
  br i1 %exitcond49.24, label %.lr.ph9.split.us.preheader, label %._crit_edge34

.lr.ph9.split.us.preheader:                       ; preds = %._crit_edge34
  %sunkaddr = ptrtoint double* %5 to i64
  %sunkaddr.1 = ptrtoint double* %5 to i64
  %sunkaddr53 = ptrtoint double* %5 to i64
  %sunkaddr53.1 = ptrtoint double* %5 to i64
  br label %.lr.ph9.split.us

.preheader4._crit_edge:                           ; preds = %.loopexit.us
  ret void

._crit_edge33.1:                                  ; preds = %._crit_edge33
  %.pre41.1 = load double, double* %sunkaddr56.1, align 8
  %37 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next38
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds [2100 x double], [2100 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv.next38
  %40 = load double, double* %39, align 8
  %41 = fmul double %40, %.pre41.1
  %42 = fadd double %38, %41
  store double %42, double* %37, align 8
  %indvars.iv.next38.1 = add nsw i64 %indvars.iv.next3859, 2
  br label %._crit_edge33
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, double*) #0 {
.lr.ph:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %6

; <label>:6:                                      ; preds = %._crit_edge2, %.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge2 ], [ 0, %.lr.ph ]
  %storemerge1 = phi i32 [ %15, %._crit_edge2 ], [ 0, %.lr.ph ]
  %7 = srem i32 %storemerge1, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge2

; <label>:9:                                      ; preds = %6
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #6
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %9, %6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %15 = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i64 %indvars.iv.next, 2100
  br i1 %exitcond, label %._crit_edge, label %6

._crit_edge:                                      ; preds = %._crit_edge2
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #6
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
