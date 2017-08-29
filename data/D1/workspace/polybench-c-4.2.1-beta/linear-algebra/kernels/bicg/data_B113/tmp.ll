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
  br label %._crit_edge22

.lr.ph4.split.us:                                 ; preds = %.lr.ph4.split.us.preheader, %._crit_edge.us
  %3 = phi i32 [ %21, %._crit_edge.us ], [ 0, %.lr.ph4.split.us.preheader ]
  %4 = srem i32 %3, 2100
  %5 = sitofp i32 %4 to double
  %6 = fdiv double %5, 2.100000e+03
  %7 = sext i32 %3 to i64
  %8 = getelementptr inbounds double, double* %1, i64 %7
  store double %6, double* %8, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph4.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph4.split.us ], [ %indvars.iv.next.1, %._crit_edge ]
  %indvars.iv.next = or i64 %indvars.iv, 1
  %9 = mul nuw nsw i64 %indvars.iv.next, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 2100
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %12, 2.100000e+03
  %14 = getelementptr inbounds [1900 x double], [1900 x double]* %0, i64 %7, i64 %indvars.iv
  store double %13, double* %14, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %15 = mul nuw nsw i64 %indvars.iv.next.1, %7
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 2100
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, 2.100000e+03
  %20 = getelementptr inbounds [1900 x double], [1900 x double]* %0, i64 %7, i64 %indvars.iv.next
  store double %19, double* %20, align 8
  %exitcond20.1 = icmp eq i64 %indvars.iv.next.1, 1900
  br i1 %exitcond20.1, label %._crit_edge.us, label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %21 = add nsw i32 %3, 1
  %22 = icmp slt i32 %21, 2100
  br i1 %22, label %.lr.ph4.split.us, label %._crit_edge5

._crit_edge22:                                    ; preds = %._crit_edge22, %.lr.ph10
  %indvars.iv18 = phi i64 [ 0, %.lr.ph10 ], [ %indvars.iv.next19.1, %._crit_edge22 ]
  %23 = trunc i64 %indvars.iv18 to i32
  %24 = srem i32 %23, 1900
  %25 = sitofp i32 %24 to double
  %26 = fdiv double %25, 1.900000e+03
  %27 = getelementptr inbounds double, double* %2, i64 %indvars.iv18
  store double %26, double* %27, align 8
  %indvars.iv.next19 = or i64 %indvars.iv18, 1
  %28 = trunc i64 %indvars.iv.next19 to i32
  %29 = srem i32 %28, 1900
  %30 = sitofp i32 %29 to double
  %31 = fdiv double %30, 1.900000e+03
  %32 = getelementptr inbounds double, double* %2, i64 %indvars.iv.next19
  store double %31, double* %32, align 8
  %indvars.iv.next19.1 = add nsw i64 %indvars.iv18, 2
  %33 = icmp slt i64 %indvars.iv.next19.1, 1900
  br i1 %33, label %._crit_edge22, label %.lr.ph4.split.us.preheader

.lr.ph4.split.us.preheader:                       ; preds = %._crit_edge22
  br label %.lr.ph4.split.us

._crit_edge5:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_bicg([1900 x double]* nocapture readonly, double* nocapture, double*, double* nocapture readonly, double*) unnamed_addr #2 {
.lr.ph9:
  %scevgep3132 = bitcast double* %1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep3132, i8 0, i64 15200, i32 8, i1 false)
  br label %._crit_edge35

.lr.ph3.split.us.preheader:                       ; preds = %._crit_edge35
  %sunkaddr = ptrtoint double* %4 to i64
  %sunkaddr16 = ptrtoint double* %2 to i64
  br label %.lr.ph3.split.us

.lr.ph3.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph3.split.us.preheader
  %5 = phi i32 [ 0, %.lr.ph3.split.us.preheader ], [ %22, %._crit_edge.us ]
  %6 = sext i32 %5 to i64
  %7 = getelementptr inbounds double, double* %2, i64 %6
  store double 0.000000e+00, double* %7, align 8
  %sunkaddr13 = shl nsw i64 %6, 3
  %sunkaddr14 = add i64 %sunkaddr, %sunkaddr13
  %sunkaddr15 = inttoptr i64 %sunkaddr14 to double*
  %sunkaddr18 = add i64 %sunkaddr16, %sunkaddr13
  %sunkaddr19 = inttoptr i64 %sunkaddr18 to double*
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph3.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph3.split.us ], [ %indvars.iv.next, %._crit_edge ]
  %8 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %9 = load double, double* %8, align 8
  %10 = load double, double* %sunkaddr15, align 8
  %11 = getelementptr inbounds [1900 x double], [1900 x double]* %0, i64 %6, i64 %indvars.iv
  %12 = load double, double* %11, align 8
  %13 = fmul double %10, %12
  %14 = fadd double %9, %13
  store double %14, double* %8, align 8
  %15 = load double, double* %sunkaddr19, align 8
  %16 = load double, double* %11, align 8
  %17 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fadd double %15, %19
  store double %20, double* %sunkaddr19, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %21 = icmp slt i64 %indvars.iv.next, 1900
  br i1 %21, label %._crit_edge, label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge
  %22 = add nsw i32 %5, 1
  %23 = icmp slt i32 %22, 2100
  br i1 %23, label %.lr.ph3.split.us, label %._crit_edge4

._crit_edge35:                                    ; preds = %._crit_edge35, %.lr.ph9
  %indvars.iv28 = phi i64 [ 0, %.lr.ph9 ], [ %indvars.iv.next29.24, %._crit_edge35 ]
  %indvars.iv.next29.24 = add nsw i64 %indvars.iv28, 25
  %24 = icmp slt i64 %indvars.iv.next29.24, 1900
  br i1 %24, label %._crit_edge35, label %.lr.ph3.split.us.preheader

._crit_edge4:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly, double* nocapture readonly) unnamed_addr #0 {
.lr.ph6:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge13, %.lr.ph6
  %indvars.iv11 = phi i64 [ 0, %.lr.ph6 ], [ %indvars.iv.next12, %._crit_edge13 ]
  %6 = trunc i64 %indvars.iv11 to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge13

; <label>:9:                                      ; preds = %._crit_edge14
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc4 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #6
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge14, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %0, i64 %indvars.iv11
  %13 = load double, double* %12, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #7
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, 1
  %15 = icmp slt i64 %indvars.iv.next12, 1900
  br i1 %15, label %._crit_edge14, label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge13
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge15, %._crit_edge7
  %indvars.iv = phi i64 [ 0, %._crit_edge7 ], [ %indvars.iv.next, %._crit_edge15 ]
  %20 = trunc i64 %indvars.iv to i32
  %21 = srem i32 %20, 20
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %._crit_edge15

; <label>:23:                                     ; preds = %._crit_edge16
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %24) #6
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge16, %23
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %27 = load double, double* %26, align 8
  %28 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %27) #7
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %29 = icmp slt i64 %indvars.iv.next, 2100
  br i1 %29, label %._crit_edge16, label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge15
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
