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
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(double* %11, double* %12)
  br label %18

; <label>:18:                                     ; preds = %14, %17, %2
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
.lr.ph4:
  br label %.lr.ph4.new

.lr.ph1.split.us:                                 ; preds = %.lr.ph1.split.us.preheader, %._crit_edge.us
  %3 = phi i32 [ %21, %._crit_edge.us ], [ 0, %.lr.ph1.split.us.preheader ]
  %4 = sitofp i32 %3 to double
  %5 = fdiv double %4, 2.100000e+03
  %6 = sext i32 %3 to i64
  %7 = getelementptr inbounds double, double* %1, i64 %6
  store double %5, double* %7, align 8
  br label %8

; <label>:8:                                      ; preds = %8, %.lr.ph1.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph1.split.us ], [ %indvars.iv.next.1, %8 ]
  %indvars.iv.next = or i64 %indvars.iv, 1
  %9 = mul nuw nsw i64 %indvars.iv.next, %6
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 2100
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %12, 2.100000e+03
  %14 = getelementptr inbounds [1900 x double], [1900 x double]* %0, i64 %6, i64 %indvars.iv
  store double %13, double* %14, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %15 = mul nuw nsw i64 %indvars.iv.next.1, %6
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 2100
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, 2.100000e+03
  %20 = getelementptr inbounds [1900 x double], [1900 x double]* %0, i64 %6, i64 %indvars.iv.next
  store double %19, double* %20, align 8
  %exitcond15.1 = icmp eq i64 %indvars.iv.next.1, 1900
  br i1 %exitcond15.1, label %._crit_edge.us, label %8

._crit_edge.us:                                   ; preds = %8
  %21 = add nsw i32 %3, 1
  %22 = icmp slt i32 %21, 2100
  br i1 %22, label %.lr.ph1.split.us, label %._crit_edge2

.lr.ph4.new:                                      ; preds = %.lr.ph4.new, %.lr.ph4
  %indvars.iv11 = phi i64 [ 0, %.lr.ph4 ], [ %indvars.iv.next12.1.1, %.lr.ph4.new ]
  %23 = trunc i64 %indvars.iv11 to i32
  %24 = sitofp i32 %23 to double
  %25 = getelementptr inbounds double, double* %2, i64 %indvars.iv11
  %26 = trunc i64 %indvars.iv11 to i32
  %27 = or i32 %26, 1
  %28 = sitofp i32 %27 to double
  %29 = insertelement <2 x double> undef, double %24, i32 0
  %30 = insertelement <2 x double> %29, double %28, i32 1
  %31 = fdiv <2 x double> %30, <double 1.900000e+03, double 1.900000e+03>
  %32 = bitcast double* %25 to <2 x double>*
  store <2 x double> %31, <2 x double>* %32, align 8
  %indvars.iv.next12.1 = or i64 %indvars.iv11, 2
  %33 = trunc i64 %indvars.iv.next12.1 to i32
  %34 = sitofp i32 %33 to double
  %35 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next12.1
  %36 = trunc i64 %indvars.iv.next12.1 to i32
  %37 = or i32 %36, 1
  %38 = sitofp i32 %37 to double
  %39 = insertelement <2 x double> undef, double %34, i32 0
  %40 = insertelement <2 x double> %39, double %38, i32 1
  %41 = fdiv <2 x double> %40, <double 1.900000e+03, double 1.900000e+03>
  %42 = bitcast double* %35 to <2 x double>*
  store <2 x double> %41, <2 x double>* %42, align 8
  %indvars.iv.next12.1.1 = add nsw i64 %indvars.iv11, 4
  %exitcond16.1.1 = icmp eq i64 %indvars.iv.next12.1.1, 1900
  br i1 %exitcond16.1.1, label %.lr.ph1.split.us.preheader, label %.lr.ph4.new

.lr.ph1.split.us.preheader:                       ; preds = %.lr.ph4.new
  br label %.lr.ph1.split.us

._crit_edge2:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_bicg([1900 x double]* nocapture readonly, double* nocapture, double*, double* nocapture readonly, double*) unnamed_addr #2 {
.lr.ph4.preheader:
  %5 = bitcast double* %1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 15200, i32 8, i1 false)
  %sunkaddr = ptrtoint double* %4 to i64
  %sunkaddr9 = ptrtoint double* %2 to i64
  br label %.lr.ph1.split.us

.lr.ph1.split.us:                                 ; preds = %.lr.ph4.preheader, %._crit_edge.us
  %6 = phi i32 [ %23, %._crit_edge.us ], [ 0, %.lr.ph4.preheader ]
  %7 = sext i32 %6 to i64
  %8 = getelementptr inbounds double, double* %2, i64 %7
  store double 0.000000e+00, double* %8, align 8
  %sunkaddr6 = shl nsw i64 %7, 3
  %sunkaddr7 = add i64 %sunkaddr, %sunkaddr6
  %sunkaddr8 = inttoptr i64 %sunkaddr7 to double*
  %sunkaddr11 = add i64 %sunkaddr9, %sunkaddr6
  %sunkaddr12 = inttoptr i64 %sunkaddr11 to double*
  br label %9

; <label>:9:                                      ; preds = %9, %.lr.ph1.split.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %9 ], [ 0, %.lr.ph1.split.us ]
  %10 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %11 = load double, double* %10, align 8
  %12 = load double, double* %sunkaddr8, align 8
  %13 = getelementptr inbounds [1900 x double], [1900 x double]* %0, i64 %7, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = fmul double %12, %14
  %16 = fadd double %11, %15
  store double %16, double* %10, align 8
  %17 = load double, double* %sunkaddr12, align 8
  %18 = load double, double* %13, align 8
  %19 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fadd double %17, %21
  store double %22, double* %sunkaddr12, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next, 1900
  br i1 %exitcond22, label %._crit_edge.us, label %9

._crit_edge.us:                                   ; preds = %9
  %23 = add nsw i32 %6, 1
  %24 = icmp slt i32 %23, 2100
  br i1 %24, label %.lr.ph1.split.us, label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly, double* nocapture readonly) unnamed_addr #0 {
.lr.ph5.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.lr.ph5

.lr.ph5:                                          ; preds = %11, %.lr.ph5.preheader
  %indvars.iv7 = phi i64 [ 0, %.lr.ph5.preheader ], [ %indvars.iv.next8, %11 ]
  %6 = trunc i64 %indvars.iv7 to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %11

; <label>:9:                                      ; preds = %.lr.ph5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #6
  br label %11

; <label>:11:                                     ; preds = %9, %.lr.ph5
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds double, double* %0, i64 %indvars.iv7
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #7
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond = icmp eq i64 %indvars.iv.next8, 1900
  br i1 %exitcond, label %._crit_edge6, label %.lr.ph5

._crit_edge6:                                     ; preds = %11
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  br label %.lr.ph

.lr.ph:                                           ; preds = %25, %._crit_edge6
  %indvars.iv = phi i64 [ 0, %._crit_edge6 ], [ %indvars.iv.next, %25 ]
  %20 = trunc i64 %indvars.iv to i32
  %21 = srem i32 %20, 20
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %25

; <label>:23:                                     ; preds = %.lr.ph
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %24) #6
  br label %25

; <label>:25:                                     ; preds = %23, %.lr.ph
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %28 = load double, double* %27, align 8
  %29 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %28) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next, 2100
  br i1 %exitcond11, label %._crit_edge, label %.lr.ph

._crit_edge:                                      ; preds = %25
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %31 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %32) #6
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
