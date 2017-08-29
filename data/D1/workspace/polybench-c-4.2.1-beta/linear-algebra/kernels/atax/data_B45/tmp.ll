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
.lr.ph7:
  br label %.lr.ph7.new

.lr.ph7.new:                                      ; preds = %.lr.ph7.new, %.lr.ph7
  %indvars.iv23 = phi i64 [ 0, %.lr.ph7 ], [ %indvars.iv.next24.1.1, %.lr.ph7.new ]
  %2 = trunc i64 %indvars.iv23 to i32
  %3 = sitofp i32 %2 to double
  %4 = getelementptr inbounds double, double* %1, i64 %indvars.iv23
  %5 = trunc i64 %indvars.iv23 to i32
  %6 = or i32 %5, 1
  %7 = sitofp i32 %6 to double
  %8 = insertelement <2 x double> undef, double %3, i32 0
  %9 = insertelement <2 x double> %8, double %7, i32 1
  %10 = fdiv <2 x double> %9, <double 2.100000e+03, double 2.100000e+03>
  %11 = fadd <2 x double> %10, <double 1.000000e+00, double 1.000000e+00>
  %12 = bitcast double* %4 to <2 x double>*
  store <2 x double> %11, <2 x double>* %12, align 8
  %indvars.iv.next24.1 = or i64 %indvars.iv23, 2
  %13 = trunc i64 %indvars.iv.next24.1 to i32
  %14 = sitofp i32 %13 to double
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next24.1
  %16 = trunc i64 %indvars.iv.next24.1 to i32
  %17 = or i32 %16, 1
  %18 = sitofp i32 %17 to double
  %19 = insertelement <2 x double> undef, double %14, i32 0
  %20 = insertelement <2 x double> %19, double %18, i32 1
  %21 = fdiv <2 x double> %20, <double 2.100000e+03, double 2.100000e+03>
  %22 = fadd <2 x double> %21, <double 1.000000e+00, double 1.000000e+00>
  %23 = bitcast double* %15 to <2 x double>*
  store <2 x double> %22, <2 x double>* %23, align 8
  %indvars.iv.next24.1.1 = add nsw i64 %indvars.iv23, 4
  %exitcond26.1.1 = icmp eq i64 %indvars.iv.next24.1.1, 2100
  br i1 %exitcond26.1.1, label %.lr.ph4.split.us.preheader, label %.lr.ph7.new

.lr.ph4.split.us.preheader:                       ; preds = %.lr.ph7.new
  br label %.lr.ph4.split.us

.lr.ph4.split.us:                                 ; preds = %.lr.ph4.split.us.preheader, %._crit_edge.us
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %._crit_edge.us ], [ 0, %.lr.ph4.split.us.preheader ]
  br label %.lr.ph4.split.us.new

.lr.ph4.split.us.new:                             ; preds = %.lr.ph4.split.us.new, %.lr.ph4.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph4.split.us ], [ %indvars.iv.next.1, %.lr.ph4.split.us.new ]
  %24 = add nuw nsw i64 %indvars.iv19, %indvars.iv
  %25 = trunc i64 %24 to i32
  %26 = srem i32 %25, 2100
  %27 = sitofp i32 %26 to double
  %28 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv19, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %29 = add nuw nsw i64 %indvars.iv19, %indvars.iv.next
  %30 = trunc i64 %29 to i32
  %31 = srem i32 %30, 2100
  %32 = sitofp i32 %31 to double
  %33 = insertelement <2 x double> undef, double %27, i32 0
  %34 = insertelement <2 x double> %33, double %32, i32 1
  %35 = fdiv <2 x double> %34, <double 9.500000e+03, double 9.500000e+03>
  %36 = bitcast double* %28 to <2 x double>*
  store <2 x double> %35, <2 x double>* %36, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2100
  br i1 %exitcond.1, label %._crit_edge.us, label %.lr.ph4.split.us.new

._crit_edge.us:                                   ; preds = %.lr.ph4.split.us.new
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond = icmp eq i64 %indvars.iv.next20, 1900
  br i1 %exitcond, label %.loopexit, label %.lr.ph4.split.us

.loopexit:                                        ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_atax([2100 x double]* nocapture readonly, double* nocapture readonly, double* nocapture, double*) unnamed_addr #2 {
.lr.ph11:
  %4 = bitcast double* %2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 16800, i32 8, i1 false)
  %sunkaddr = ptrtoint double* %3 to i64
  %sunkaddr72 = ptrtoint double* %3 to i64
  %sunkaddr72.1 = ptrtoint double* %3 to i64
  br label %.lr.ph8.split.us

.lr.ph8.split.us:                                 ; preds = %._crit_edge6.us, %.lr.ph11
  %indvars.iv38 = phi i64 [ 0, %.lr.ph11 ], [ %indvars.iv.next39, %._crit_edge6.us ]
  %5 = getelementptr inbounds double, double* %3, i64 %indvars.iv38
  store double 0.000000e+00, double* %5, align 8
  %sunkaddr69 = shl nuw nsw i64 %indvars.iv38, 3
  %sunkaddr70 = add i64 %sunkaddr, %sunkaddr69
  %sunkaddr71 = inttoptr i64 %sunkaddr70 to double*
  br label %.lr.ph8.split.us.new

.lr.ph8.split.us.new:                             ; preds = %.lr.ph8.split.us.new, %.lr.ph8.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph8.split.us ], [ %indvars.iv.next.1, %.lr.ph8.split.us.new ]
  %6 = phi double [ 0.000000e+00, %.lr.ph8.split.us ], [ %18, %.lr.ph8.split.us.new ]
  %7 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv38, i64 %indvars.iv
  %8 = load double, double* %7, align 8
  %9 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %10 = load double, double* %9, align 8
  %11 = fmul double %8, %10
  %12 = fadd double %6, %11
  store double %12, double* %sunkaddr71, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %13 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv38, i64 %indvars.iv.next
  %14 = load double, double* %13, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fadd double %12, %17
  store double %18, double* %sunkaddr71, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2100
  br i1 %exitcond.1, label %.lr.ph5.us.preheader, label %.lr.ph8.split.us.new

.lr.ph5.us.preheader:                             ; preds = %.lr.ph8.split.us.new
  %19 = load double, double* %2, align 8
  %20 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv38, i64 0
  %21 = load double, double* %20, align 8
  %22 = fmul double %21, %18
  %23 = fadd double %19, %22
  store double %23, double* %2, align 8
  %sunkaddr73 = shl nuw nsw i64 %indvars.iv38, 3
  %sunkaddr74 = add i64 %sunkaddr72, %sunkaddr73
  %sunkaddr75 = inttoptr i64 %sunkaddr74 to double*
  %sunkaddr73.1 = shl nuw nsw i64 %indvars.iv38, 3
  %sunkaddr74.1 = add i64 %sunkaddr72.1, %sunkaddr73.1
  %sunkaddr75.1 = inttoptr i64 %sunkaddr74.1 to double*
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.1, %.lr.ph5.us.preheader
  %indvars.iv3576 = phi i64 [ 0, %.lr.ph5.us.preheader ], [ %indvars.iv.next36.1, %._crit_edge.1 ]
  %indvars.iv.next36 = or i64 %indvars.iv3576, 1
  %.pre = load double, double* %sunkaddr75, align 8
  %24 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next36
  %25 = load double, double* %24, align 8
  %26 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv38, i64 %indvars.iv.next36
  %27 = load double, double* %26, align 8
  %28 = fmul double %27, %.pre
  %29 = fadd double %25, %28
  store double %29, double* %24, align 8
  %exitcond = icmp eq i64 %indvars.iv.next36, 2099
  br i1 %exitcond, label %._crit_edge6.us, label %._crit_edge.1

._crit_edge6.us:                                  ; preds = %._crit_edge
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next39, 1900
  br i1 %exitcond41, label %.loopexit, label %.lr.ph8.split.us

.loopexit:                                        ; preds = %._crit_edge6.us
  ret void

._crit_edge.1:                                    ; preds = %._crit_edge
  %indvars.iv.next36.1 = add nsw i64 %indvars.iv3576, 2
  %.pre.1 = load double, double* %sunkaddr75.1, align 8
  %30 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next36.1
  %31 = load double, double* %30, align 8
  %32 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv38, i64 %indvars.iv.next36.1
  %33 = load double, double* %32, align 8
  %34 = fmul double %33, %.pre.1
  %35 = fadd double %31, %34
  store double %35, double* %30, align 8
  br label %._crit_edge
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
.lr.ph.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #6
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph._crit_edge, %.lr.ph.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph.preheader ], [ %indvars.iv.next, %.lr.ph._crit_edge ]
  %5 = trunc i64 %indvars.iv to i32
  %6 = srem i32 %5, 20
  %7 = icmp eq i32 %6, 0
  br i1 %7, label %8, label %.lr.ph._crit_edge

; <label>:8:                                      ; preds = %.lr.ph
  %9 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %9) #6
  br label %.lr.ph._crit_edge

.lr.ph._crit_edge:                                ; preds = %.lr.ph, %8
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %12 = load double, double* %11, align 8
  %13 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %12) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2100
  br i1 %exitcond, label %.loopexit, label %.lr.ph

.loopexit:                                        ; preds = %.lr.ph._crit_edge
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %16) #6
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
