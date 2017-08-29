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
  br label %25

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %22
  %3 = phi i32 [ %23, %22 ], [ 0, %.lr.ph.us.preheader ]
  %4 = srem i32 %3, 2100
  %5 = sitofp i32 %4 to double
  %6 = fdiv double %5, 2.100000e+03
  %7 = sext i32 %3 to i64
  %8 = getelementptr inbounds double, double* %1, i64 %7
  store double %6, double* %8, align 8
  br label %9

; <label>:9:                                      ; preds = %9, %.lr.ph.us
  %indvars.iv = phi i64 [ 0, %.lr.ph.us ], [ %indvars.iv.next.1, %9 ]
  %indvars.iv.next = or i64 %indvars.iv, 1
  %10 = mul nuw nsw i64 %indvars.iv.next, %7
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 2100
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 2.100000e+03
  %15 = getelementptr inbounds [1900 x double], [1900 x double]* %0, i64 %7, i64 %indvars.iv
  store double %14, double* %15, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %16 = mul nuw nsw i64 %indvars.iv.next.1, %7
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 2100
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, 2.100000e+03
  %21 = getelementptr inbounds [1900 x double], [1900 x double]* %0, i64 %7, i64 %indvars.iv.next
  store double %20, double* %21, align 8
  %exitcond20.1 = icmp eq i64 %indvars.iv.next.1, 1900
  br i1 %exitcond20.1, label %22, label %9

; <label>:22:                                     ; preds = %9
  %23 = add nsw i32 %3, 1
  %24 = icmp slt i32 %23, 2100
  br i1 %24, label %.lr.ph.us, label %._crit_edge5

; <label>:25:                                     ; preds = %25, %.lr.ph10
  %indvars.iv18 = phi i64 [ 0, %.lr.ph10 ], [ %indvars.iv.next19.1, %25 ]
  %26 = trunc i64 %indvars.iv18 to i32
  %27 = srem i32 %26, 1900
  %28 = sitofp i32 %27 to double
  %29 = fdiv double %28, 1.900000e+03
  %30 = getelementptr inbounds double, double* %2, i64 %indvars.iv18
  store double %29, double* %30, align 8
  %indvars.iv.next19 = or i64 %indvars.iv18, 1
  %31 = trunc i64 %indvars.iv.next19 to i32
  %32 = srem i32 %31, 1900
  %33 = sitofp i32 %32 to double
  %34 = fdiv double %33, 1.900000e+03
  %35 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next19
  store double %34, double* %35, align 8
  %indvars.iv.next19.1 = add nsw i64 %indvars.iv18, 2
  %36 = icmp slt i64 %indvars.iv.next19.1, 1900
  br i1 %36, label %25, label %.lr.ph.us.preheader

.lr.ph.us.preheader:                              ; preds = %25
  br label %.lr.ph.us

._crit_edge5:                                     ; preds = %22
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_bicg([1900 x double]* nocapture readonly, double* nocapture, double*, double* nocapture readonly, double*) unnamed_addr #2 {
.lr.ph9:
  %5 = ptrtoint double* %4 to i64
  %6 = ptrtoint double* %2 to i64
  %scevgep4344 = bitcast double* %1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep4344, i8 0, i64 15200, i32 8, i1 false)
  br label %28

.lr.ph.us:                                        ; preds = %.lr.ph.us.preheader, %25
  %7 = phi i32 [ %26, %25 ], [ 0, %.lr.ph.us.preheader ]
  %8 = sext i32 %7 to i64
  %9 = getelementptr inbounds double, double* %2, i64 %8
  store double 0.000000e+00, double* %9, align 8
  %sunkaddr12 = shl nsw i64 %8, 3
  %sunkaddr13 = add i64 %5, %sunkaddr12
  %sunkaddr14 = inttoptr i64 %sunkaddr13 to double*
  %sunkaddr17 = add i64 %6, %sunkaddr12
  %sunkaddr18 = inttoptr i64 %sunkaddr17 to double*
  br label %10

; <label>:10:                                     ; preds = %10, %.lr.ph.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %10 ], [ 0, %.lr.ph.us ]
  %11 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %12 = load double, double* %11, align 8
  %13 = load double, double* %sunkaddr14, align 8
  %14 = getelementptr inbounds [1900 x double], [1900 x double]* %0, i64 %8, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = fmul double %13, %15
  %17 = fadd double %12, %16
  store double %17, double* %11, align 8
  %18 = load double, double* %sunkaddr18, align 8
  %19 = load double, double* %14, align 8
  %20 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = fadd double %18, %22
  store double %23, double* %sunkaddr18, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %24 = icmp slt i64 %indvars.iv.next, 1900
  br i1 %24, label %10, label %25

; <label>:25:                                     ; preds = %10
  %26 = add nsw i32 %7, 1
  %27 = icmp slt i32 %26, 2100
  br i1 %27, label %.lr.ph.us, label %._crit_edge4

; <label>:28:                                     ; preds = %28, %.lr.ph9
  %indvars.iv40 = phi i64 [ 0, %.lr.ph9 ], [ %indvars.iv.next41.24, %28 ]
  %indvars.iv.next41.24 = add nsw i64 %indvars.iv40, 25
  %29 = icmp slt i64 %indvars.iv.next41.24, 1900
  br i1 %29, label %28, label %.lr.ph.us.preheader

.lr.ph.us.preheader:                              ; preds = %28
  br label %.lr.ph.us

._crit_edge4:                                     ; preds = %25
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly, double* nocapture readonly) unnamed_addr #0 {
.lr.ph9:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %6

; <label>:6:                                      ; preds = %.lr.ph9, %._crit_edge
  %indvars.iv14 = phi i64 [ 0, %.lr.ph9 ], [ %indvars.iv.next15, %._crit_edge ]
  %7 = trunc i64 %indvars.iv14 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc5 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds double, double* %0, i64 %indvars.iv14
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #7
  %indvars.iv.next15 = add nsw i64 %indvars.iv14, 1
  %16 = icmp slt i64 %indvars.iv.next15, 1900
  br i1 %16, label %6, label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  br label %21

; <label>:21:                                     ; preds = %._crit_edge10, %._crit_edge1
  %indvars.iv = phi i64 [ 0, %._crit_edge10 ], [ %indvars.iv.next, %._crit_edge1 ]
  %22 = trunc i64 %indvars.iv to i32
  %23 = srem i32 %22, 20
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %._crit_edge1

; <label>:25:                                     ; preds = %21
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %26) #6
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %21, %25
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %29 = load double, double* %28, align 8
  %30 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %29) #7
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %31 = icmp slt i64 %indvars.iv.next, 2100
  br i1 %31, label %21, label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge1
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %35 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %34) #6
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
