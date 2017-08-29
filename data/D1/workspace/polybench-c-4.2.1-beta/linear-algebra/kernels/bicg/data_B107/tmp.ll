; ModuleID = 'A.ll'
source_filename = "bicg.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"s\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %8 = bitcast i8* %3 to [1900 x double]*
  %9 = bitcast i8* %7 to double*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array([1900 x double]* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = bitcast i8* %4 to double*
  %12 = bitcast i8* %5 to double*
  tail call fastcc void @kernel_bicg([1900 x double]* %8, double* %11, double* %12, double* %10, double* %9)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(double* %11, double* %12)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1900 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #2 {
.lr.ph10:
  br label %.lr.ph10.new

.lr.ph7.split.us:                                 ; preds = %.lr.ph7.split.us.preheader, %._crit_edge.us
  %.15.us = phi i32 [ %20, %._crit_edge.us ], [ 0, %.lr.ph7.split.us.preheader ]
  %3 = sitofp i32 %.15.us to double
  %4 = fdiv double %3, 2.100000e+03
  %5 = sext i32 %.15.us to i64
  %6 = getelementptr inbounds double, double* %1, i64 %5
  store double %4, double* %6, align 8
  br label %7

; <label>:7:                                      ; preds = %7, %.lr.ph7.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph7.split.us ], [ %indvars.iv.next.1, %7 ]
  %indvars.iv.next = or i64 %indvars.iv, 1
  %8 = mul nuw nsw i64 %indvars.iv.next, %5
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 2100
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 2.100000e+03
  %13 = getelementptr inbounds [1900 x double], [1900 x double]* %0, i64 %5, i64 %indvars.iv
  store double %12, double* %13, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %14 = mul nuw nsw i64 %indvars.iv.next.1, %5
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 2100
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 2.100000e+03
  %19 = getelementptr inbounds [1900 x double], [1900 x double]* %0, i64 %5, i64 %indvars.iv.next
  store double %18, double* %19, align 8
  %exitcond22.1 = icmp eq i64 %indvars.iv.next.1, 1900
  br i1 %exitcond22.1, label %._crit_edge.us, label %7

._crit_edge.us:                                   ; preds = %7
  %20 = add nsw i32 %.15.us, 1
  %21 = icmp slt i32 %20, 2100
  br i1 %21, label %.lr.ph7.split.us, label %._crit_edge._crit_edge

.lr.ph10.new:                                     ; preds = %.lr.ph10.new, %.lr.ph10
  %indvars.iv17 = phi i64 [ 0, %.lr.ph10 ], [ %indvars.iv.next18.1.1, %.lr.ph10.new ]
  %22 = trunc i64 %indvars.iv17 to i32
  %23 = sitofp i32 %22 to double
  %24 = getelementptr inbounds double, double* %2, i64 %indvars.iv17
  %25 = trunc i64 %indvars.iv17 to i32
  %26 = or i32 %25, 1
  %27 = sitofp i32 %26 to double
  %28 = insertelement <2 x double> undef, double %23, i32 0
  %29 = insertelement <2 x double> %28, double %27, i32 1
  %30 = fdiv <2 x double> %29, <double 1.900000e+03, double 1.900000e+03>
  %31 = bitcast double* %24 to <2 x double>*
  store <2 x double> %30, <2 x double>* %31, align 8
  %indvars.iv.next18.1 = or i64 %indvars.iv17, 2
  %32 = trunc i64 %indvars.iv.next18.1 to i32
  %33 = sitofp i32 %32 to double
  %34 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next18.1
  %35 = trunc i64 %indvars.iv.next18.1 to i32
  %36 = or i32 %35, 1
  %37 = sitofp i32 %36 to double
  %38 = insertelement <2 x double> undef, double %33, i32 0
  %39 = insertelement <2 x double> %38, double %37, i32 1
  %40 = fdiv <2 x double> %39, <double 1.900000e+03, double 1.900000e+03>
  %41 = bitcast double* %34 to <2 x double>*
  store <2 x double> %40, <2 x double>* %41, align 8
  %indvars.iv.next18.1.1 = add nsw i64 %indvars.iv17, 4
  %exitcond23.1.1 = icmp eq i64 %indvars.iv.next18.1.1, 1900
  br i1 %exitcond23.1.1, label %.lr.ph7.split.us.preheader, label %.lr.ph10.new

.lr.ph7.split.us.preheader:                       ; preds = %.lr.ph10.new
  br label %.lr.ph7.split.us

._crit_edge._crit_edge:                           ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_bicg([1900 x double]* nocapture readonly, double* nocapture, double* nocapture, double* nocapture readonly, double* nocapture readonly) unnamed_addr #2 {
.lr.ph9.preheader:
  %5 = bitcast double* %1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 15200, i32 8, i1 false)
  %sunkaddr = ptrtoint double* %4 to i64
  %sunkaddr14 = ptrtoint double* %2 to i64
  br label %.lr.ph6.split.us

.lr.ph6.split.us:                                 ; preds = %.lr.ph9.preheader, %._crit_edge.us
  %.15.us = phi i32 [ %22, %._crit_edge.us ], [ 0, %.lr.ph9.preheader ]
  %6 = sext i32 %.15.us to i64
  %7 = getelementptr inbounds double, double* %2, i64 %6
  store double 0.000000e+00, double* %7, align 8
  %sunkaddr11 = shl nsw i64 %6, 3
  %sunkaddr12 = add i64 %sunkaddr, %sunkaddr11
  %sunkaddr13 = inttoptr i64 %sunkaddr12 to double*
  %sunkaddr16 = add i64 %sunkaddr14, %sunkaddr11
  %sunkaddr17 = inttoptr i64 %sunkaddr16 to double*
  br label %8

; <label>:8:                                      ; preds = %8, %.lr.ph6.split.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %8 ], [ 0, %.lr.ph6.split.us ]
  %9 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %10 = load double, double* %9, align 8
  %11 = load double, double* %sunkaddr13, align 8
  %12 = getelementptr inbounds [1900 x double], [1900 x double]* %0, i64 %6, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = fmul double %11, %13
  %15 = fadd double %10, %14
  store double %15, double* %9, align 8
  %16 = load double, double* %sunkaddr17, align 8
  %17 = load double, double* %12, align 8
  %18 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = fmul double %17, %19
  %21 = fadd double %16, %20
  store double %21, double* %sunkaddr17, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next, 1900
  br i1 %exitcond32, label %._crit_edge.us, label %8

._crit_edge.us:                                   ; preds = %8
  %22 = add nsw i32 %.15.us, 1
  %23 = icmp slt i32 %22, 2100
  br i1 %23, label %.lr.ph6.split.us, label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly, double* nocapture readonly) unnamed_addr #0 {
.lr.ph10.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.lr.ph10

.lr.ph10:                                         ; preds = %._crit_edge, %.lr.ph10.preheader
  %indvars.iv12 = phi i64 [ 0, %.lr.ph10.preheader ], [ %indvars.iv.next13, %._crit_edge ]
  %6 = trunc i64 %indvars.iv12 to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %.lr.ph10
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc4 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %.lr.ph10, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %0, i64 %indvars.iv12
  %13 = load double, double* %12, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #7
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond = icmp eq i64 %indvars.iv.next13, 1900
  br i1 %exitcond, label %._crit_edge11, label %.lr.ph10

._crit_edge11:                                    ; preds = %._crit_edge
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge1, %._crit_edge11
  %indvars.iv = phi i64 [ 0, %._crit_edge11 ], [ %indvars.iv.next, %._crit_edge1 ]
  %19 = trunc i64 %indvars.iv to i32
  %20 = srem i32 %19, 20
  %21 = icmp eq i32 %20, 0
  br i1 %21, label %22, label %._crit_edge1

; <label>:22:                                     ; preds = %.lr.ph
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %23) #6
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %.lr.ph, %22
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %26 = load double, double* %25, align 8
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %26) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next, 2100
  br i1 %exitcond16, label %._crit_edge7, label %.lr.ph

._crit_edge7:                                     ; preds = %._crit_edge1
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %31 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %30) #6
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
