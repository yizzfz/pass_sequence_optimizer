; ModuleID = 'A.ll'
source_filename = "atax.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %7 = bitcast i8* %3 to [2100 x double]*
  %8 = bitcast i8* %4 to double*
  call fastcc void @init_array([2100 x double]* %7, double* %8)
  call void (...) @polybench_timer_start() #4
  %9 = bitcast i8* %5 to double*
  %10 = bitcast i8* %6 to double*
  call fastcc void @kernel_atax([2100 x double]* %7, double* %8, double* %9, double* %10)
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
  call fastcc void @print_array(double* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %3) #4
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([2100 x double]* nocapture, double* nocapture) unnamed_addr #2 {
.lr.ph5.preheader18:
  br label %.lr.ph5

.lr.ph5:                                          ; preds = %.lr.ph5, %.lr.ph5.preheader18
  %indvars.iv14 = phi i64 [ 0, %.lr.ph5.preheader18 ], [ %indvars.iv.next15.1.1, %.lr.ph5 ]
  %2 = trunc i64 %indvars.iv14 to i32
  %3 = sitofp i32 %2 to double
  %4 = getelementptr inbounds double, double* %1, i64 %indvars.iv14
  %5 = trunc i64 %indvars.iv14 to i32
  %6 = or i32 %5, 1
  %7 = sitofp i32 %6 to double
  %8 = insertelement <2 x double> undef, double %3, i32 0
  %9 = insertelement <2 x double> %8, double %7, i32 1
  %10 = fdiv <2 x double> %9, <double 2.100000e+03, double 2.100000e+03>
  %11 = fadd <2 x double> %10, <double 1.000000e+00, double 1.000000e+00>
  %12 = bitcast double* %4 to <2 x double>*
  store <2 x double> %11, <2 x double>* %12, align 8
  %indvars.iv.next15.1 = or i64 %indvars.iv14, 2
  %13 = trunc i64 %indvars.iv.next15.1 to i32
  %14 = sitofp i32 %13 to double
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next15.1
  %16 = trunc i64 %indvars.iv.next15.1 to i32
  %17 = or i32 %16, 1
  %18 = sitofp i32 %17 to double
  %19 = insertelement <2 x double> undef, double %14, i32 0
  %20 = insertelement <2 x double> %19, double %18, i32 1
  %21 = fdiv <2 x double> %20, <double 2.100000e+03, double 2.100000e+03>
  %22 = fadd <2 x double> %21, <double 1.000000e+00, double 1.000000e+00>
  %23 = bitcast double* %15 to <2 x double>*
  store <2 x double> %22, <2 x double>* %23, align 8
  %indvars.iv.next15.1.1 = add nsw i64 %indvars.iv14, 4
  %exitcond17.1.1 = icmp eq i64 %indvars.iv.next15.1.1, 2100
  br i1 %exitcond17.1.1, label %.lr.ph2.split.us.preheader, label %.lr.ph5

.lr.ph2.split.us.preheader:                       ; preds = %.lr.ph5
  br label %.lr.ph2.split.us

.lr.ph2.split.us:                                 ; preds = %.lr.ph2.split.us.preheader, %._crit_edge.us
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %._crit_edge.us ], [ 0, %.lr.ph2.split.us.preheader ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph2.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph2.split.us ], [ %indvars.iv.next.1, %._crit_edge ]
  %24 = add nuw nsw i64 %indvars.iv10, %indvars.iv
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, 2100
  %27 = sitofp i32 %26 to double
  %28 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv10, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %29 = add nuw nsw i64 %indvars.iv10, %indvars.iv.next
  %30 = trunc i64 %29 to i32
  %31 = srem i32 %30, 2100
  %32 = sitofp i32 %31 to double
  %33 = insertelement <2 x double> undef, double %27, i32 0
  %34 = insertelement <2 x double> %33, double %32, i32 1
  %35 = fdiv <2 x double> %34, <double 9.500000e+03, double 9.500000e+03>
  %36 = bitcast double* %28 to <2 x double>*
  store <2 x double> %35, <2 x double>* %36, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond9.1 = icmp eq i64 %indvars.iv.next.1, 2100
  br i1 %exitcond9.1, label %._crit_edge.us, label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next11, 1900
  br i1 %exitcond13, label %._crit_edge3, label %.lr.ph2.split.us

._crit_edge3:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_atax([2100 x double]* nocapture readonly, double* nocapture readonly, double* nocapture, double*) unnamed_addr #2 {
.lr.ph5.split.us.preheader:
  %4 = bitcast double* %2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 16800, i32 8, i1 false)
  %sunkaddr45 = ptrtoint double* %3 to i64
  %sunkaddr49 = ptrtoint double* %3 to i64
  %sunkaddr = ptrtoint double* %3 to i64
  %sunkaddr41 = ptrtoint double* %3 to i64
  br label %.lr.ph5.split.us.new.preheader

.lr.ph5.split.us.new.preheader:                   ; preds = %._crit_edge3.us, %.lr.ph5.split.us.preheader
  %indvars.iv23 = phi i64 [ 0, %.lr.ph5.split.us.preheader ], [ %indvars.iv.next24, %._crit_edge3.us ]
  %5 = getelementptr inbounds double, double* %3, i64 %indvars.iv23
  store double 0.000000e+00, double* %5, align 8
  %sunkaddr46 = shl nuw nsw i64 %indvars.iv23, 3
  %sunkaddr47 = add i64 %sunkaddr45, %sunkaddr46
  %sunkaddr48 = inttoptr i64 %sunkaddr47 to double*
  %sunkaddr50 = shl nuw nsw i64 %indvars.iv23, 3
  %sunkaddr51 = add i64 %sunkaddr49, %sunkaddr50
  %sunkaddr52 = inttoptr i64 %sunkaddr51 to double*
  br label %.lr.ph5.split.us.new

._crit_edge3.us:                                  ; preds = %.lr.ph2.us
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next24, 1900
  br i1 %exitcond26, label %._crit_edge6, label %.lr.ph5.split.us.new.preheader

.lr.ph2.us:                                       ; preds = %.lr.ph2.us.preheader, %.lr.ph2.us
  %indvars.iv17 = phi i64 [ %indvars.iv.next18.1, %.lr.ph2.us ], [ 0, %.lr.ph2.us.preheader ]
  %6 = getelementptr inbounds double, double* %2, i64 %indvars.iv17
  %7 = load double, double* %6, align 8
  %8 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv23, i64 %indvars.iv17
  %9 = load double, double* %8, align 8
  %10 = load double, double* %sunkaddr40, align 8
  %11 = fmul double %9, %10
  %12 = fadd double %7, %11
  store double %12, double* %6, align 8
  %indvars.iv.next18 = or i64 %indvars.iv17, 1
  %13 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next18
  %14 = load double, double* %13, align 8
  %15 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv23, i64 %indvars.iv.next18
  %16 = load double, double* %15, align 8
  %17 = load double, double* %sunkaddr44, align 8
  %18 = fmul double %16, %17
  %19 = fadd double %14, %18
  store double %19, double* %13, align 8
  %indvars.iv.next18.1 = add nuw nsw i64 %indvars.iv17, 2
  %exitcond20.1 = icmp eq i64 %indvars.iv.next18.1, 2100
  br i1 %exitcond20.1, label %._crit_edge3.us, label %.lr.ph2.us

.lr.ph5.split.us.new:                             ; preds = %.lr.ph5.split.us.new, %.lr.ph5.split.us.new.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph5.split.us.new.preheader ], [ %indvars.iv.next.1, %.lr.ph5.split.us.new ]
  %20 = load double, double* %sunkaddr48, align 8
  %21 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv23, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = fadd double %20, %25
  store double %26, double* %sunkaddr48, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %27 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv23, i64 %indvars.iv.next
  %28 = load double, double* %27, align 8
  %29 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = fadd double %26, %31
  store double %32, double* %sunkaddr52, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond16.1 = icmp eq i64 %indvars.iv.next.1, 2100
  br i1 %exitcond16.1, label %.lr.ph2.us.preheader, label %.lr.ph5.split.us.new

.lr.ph2.us.preheader:                             ; preds = %.lr.ph5.split.us.new
  %sunkaddr38 = shl nuw nsw i64 %indvars.iv23, 3
  %sunkaddr39 = add i64 %sunkaddr, %sunkaddr38
  %sunkaddr40 = inttoptr i64 %sunkaddr39 to double*
  %sunkaddr42 = shl nuw nsw i64 %indvars.iv23, 3
  %sunkaddr43 = add i64 %sunkaddr41, %sunkaddr42
  %sunkaddr44 = inttoptr i64 %sunkaddr43 to double*
  br label %.lr.ph2.us

._crit_edge6:                                     ; preds = %._crit_edge3.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %1
  %indvars.iv = phi i64 [ 0, %1 ], [ %indvars.iv.next, %._crit_edge ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %.lr.ph
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %10) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next, 2100
  br i1 %exitcond4, label %._crit_edge2, label %.lr.ph

._crit_edge2:                                     ; preds = %._crit_edge
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %17) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
