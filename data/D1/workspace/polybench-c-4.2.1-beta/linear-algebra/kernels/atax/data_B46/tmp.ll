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
.lr.ph5.preheader:
  br label %.lr.ph5

.lr.ph5:                                          ; preds = %.lr.ph5, %.lr.ph5.preheader
  %indvars.iv12 = phi i64 [ 0, %.lr.ph5.preheader ], [ %indvars.iv.next13.1.1, %.lr.ph5 ]
  %2 = trunc i64 %indvars.iv12 to i32
  %3 = sitofp i32 %2 to double
  %4 = getelementptr inbounds double, double* %1, i64 %indvars.iv12
  %5 = or i32 %2, 1
  %6 = sitofp i32 %5 to double
  %7 = insertelement <2 x double> undef, double %3, i32 0
  %8 = insertelement <2 x double> %7, double %6, i32 1
  %9 = fdiv <2 x double> %8, <double 2.100000e+03, double 2.100000e+03>
  %10 = fadd <2 x double> %9, <double 1.000000e+00, double 1.000000e+00>
  %11 = bitcast double* %4 to <2 x double>*
  store <2 x double> %10, <2 x double>* %11, align 8
  %indvars.iv.next13.1 = or i64 %indvars.iv12, 2
  %12 = trunc i64 %indvars.iv.next13.1 to i32
  %13 = sitofp i32 %12 to double
  %14 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next13.1
  %15 = or i32 %12, 1
  %16 = sitofp i32 %15 to double
  %17 = insertelement <2 x double> undef, double %13, i32 0
  %18 = insertelement <2 x double> %17, double %16, i32 1
  %19 = fdiv <2 x double> %18, <double 2.100000e+03, double 2.100000e+03>
  %20 = fadd <2 x double> %19, <double 1.000000e+00, double 1.000000e+00>
  %21 = bitcast double* %14 to <2 x double>*
  store <2 x double> %20, <2 x double>* %21, align 8
  %indvars.iv.next13.1.1 = add nsw i64 %indvars.iv12, 4
  %exitcond15.1.1 = icmp eq i64 %indvars.iv.next13.1.1, 2100
  br i1 %exitcond15.1.1, label %.lr.ph2.split.us.preheader, label %.lr.ph5

.lr.ph2.split.us.preheader:                       ; preds = %.lr.ph5
  br label %.lr.ph2.split.us

.lr.ph2.split.us:                                 ; preds = %.lr.ph2.split.us.preheader, %._crit_edge.us
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %._crit_edge.us ], [ 0, %.lr.ph2.split.us.preheader ]
  br label %.lr.ph2.split.us.new

.lr.ph2.split.us.new:                             ; preds = %.lr.ph2.split.us.new, %.lr.ph2.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph2.split.us ], [ %indvars.iv.next.1, %.lr.ph2.split.us.new ]
  %22 = add nuw nsw i64 %indvars.iv8, %indvars.iv
  %23 = trunc i64 %22 to i32
  %24 = srem i32 %23, 2100
  %25 = sitofp i32 %24 to double
  %26 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv8, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %27 = add nuw nsw i64 %indvars.iv8, %indvars.iv.next
  %28 = trunc i64 %27 to i32
  %29 = srem i32 %28, 2100
  %30 = sitofp i32 %29 to double
  %31 = insertelement <2 x double> undef, double %25, i32 0
  %32 = insertelement <2 x double> %31, double %30, i32 1
  %33 = fdiv <2 x double> %32, <double 9.500000e+03, double 9.500000e+03>
  %34 = bitcast double* %26 to <2 x double>*
  store <2 x double> %33, <2 x double>* %34, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2100
  br i1 %exitcond.1, label %._crit_edge.us, label %.lr.ph2.split.us.new

._crit_edge.us:                                   ; preds = %.lr.ph2.split.us.new
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %exitcond = icmp eq i64 %indvars.iv.next9, 1900
  br i1 %exitcond, label %._crit_edge3, label %.lr.ph2.split.us

._crit_edge3:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_atax([2100 x double]* nocapture readonly, double* nocapture readonly, double* nocapture, double* nocapture) unnamed_addr #2 {
.lr.ph8.preheader:
  %4 = bitcast double* %2 to i8*
  call void @llvm.memset.p0i8.i64(i8* %4, i8 0, i64 16800, i32 8, i1 false)
  %sunkaddr = ptrtoint double* %3 to i64
  %sunkaddr1 = ptrtoint double* %3 to i64
  %sunkaddr5 = ptrtoint double* %3 to i64
  br label %.lr.ph5.split.us

.lr.ph5.split.us:                                 ; preds = %._crit_edge3.us, %.lr.ph8.preheader
  %indvars.iv24 = phi i64 [ 0, %.lr.ph8.preheader ], [ %indvars.iv.next25, %._crit_edge3.us ]
  %5 = getelementptr inbounds double, double* %3, i64 %indvars.iv24
  store double 0.000000e+00, double* %5, align 8
  %sunkaddr52 = shl nuw nsw i64 %indvars.iv24, 3
  %sunkaddr53 = add i64 %sunkaddr, %sunkaddr52
  %sunkaddr54 = inttoptr i64 %sunkaddr53 to double*
  br label %.lr.ph5.split.us.new

.lr.ph5.split.us.new:                             ; preds = %.lr.ph5.split.us.new, %.lr.ph5.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph5.split.us ], [ %indvars.iv.next.1, %.lr.ph5.split.us.new ]
  %6 = load double, double* %sunkaddr54, align 8
  %7 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv24, i64 %indvars.iv
  %8 = load double, double* %7, align 8
  %9 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %10 = load double, double* %9, align 8
  %11 = fmul double %8, %10
  %12 = fadd double %6, %11
  store double %12, double* %sunkaddr54, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %13 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv24, i64 %indvars.iv.next
  %14 = load double, double* %13, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv.next
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fadd double %12, %17
  store double %18, double* %sunkaddr54, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2100
  br i1 %exitcond.1, label %.lr.ph2.us.new.preheader, label %.lr.ph5.split.us.new

.lr.ph2.us.new.preheader:                         ; preds = %.lr.ph5.split.us.new
  %sunkaddr2 = mul i64 %indvars.iv24, 8
  %sunkaddr3 = add i64 %sunkaddr1, %sunkaddr2
  %sunkaddr4 = inttoptr i64 %sunkaddr3 to double*
  %sunkaddr6 = mul i64 %indvars.iv24, 8
  %sunkaddr7 = add i64 %sunkaddr5, %sunkaddr6
  %sunkaddr8 = inttoptr i64 %sunkaddr7 to double*
  br label %.lr.ph2.us.new

.lr.ph2.us.new:                                   ; preds = %.lr.ph2.us.new..lr.ph2.us.new_crit_edge, %.lr.ph2.us.new.preheader
  %19 = phi double [ %.pre, %.lr.ph2.us.new..lr.ph2.us.new_crit_edge ], [ %18, %.lr.ph2.us.new.preheader ]
  %indvars.iv15 = phi i64 [ %indvars.iv.next16.1, %.lr.ph2.us.new..lr.ph2.us.new_crit_edge ], [ 0, %.lr.ph2.us.new.preheader ]
  %20 = getelementptr inbounds double, double* %2, i64 %indvars.iv15
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv24, i64 %indvars.iv15
  %23 = load double, double* %22, align 8
  %24 = fmul double %23, %19
  %25 = fadd double %21, %24
  store double %25, double* %20, align 8
  %indvars.iv.next16 = or i64 %indvars.iv15, 1
  %26 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next16
  %27 = load double, double* %26, align 8
  %28 = getelementptr inbounds [2100 x double], [2100 x double]* %0, i64 %indvars.iv24, i64 %indvars.iv.next16
  %29 = load double, double* %28, align 8
  %30 = load double, double* %sunkaddr4, align 8
  %31 = fmul double %29, %30
  %32 = fadd double %27, %31
  store double %32, double* %26, align 8
  %indvars.iv.next16.1 = add nuw nsw i64 %indvars.iv15, 2
  %exitcond.123 = icmp eq i64 %indvars.iv.next16.1, 2100
  br i1 %exitcond.123, label %._crit_edge3.us, label %.lr.ph2.us.new..lr.ph2.us.new_crit_edge

.lr.ph2.us.new..lr.ph2.us.new_crit_edge:          ; preds = %.lr.ph2.us.new
  %.pre = load double, double* %sunkaddr8, align 8
  br label %.lr.ph2.us.new

._crit_edge3.us:                                  ; preds = %.lr.ph2.us.new
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond = icmp eq i64 %indvars.iv.next25, 1900
  br i1 %exitcond, label %._crit_edge6, label %.lr.ph5.split.us

._crit_edge6:                                     ; preds = %._crit_edge3.us
  ret void
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
  br i1 %exitcond, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %.lr.ph._crit_edge
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
