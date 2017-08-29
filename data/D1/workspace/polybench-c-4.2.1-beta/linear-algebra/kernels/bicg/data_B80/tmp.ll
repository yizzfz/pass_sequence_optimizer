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

._crit_edge:                                      ; preds = %2
  br label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge1

._crit_edge1:                                     ; preds = %14
  br label %18

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(double* %11, double* %12)
  br label %18

; <label>:18:                                     ; preds = %._crit_edge1, %._crit_edge, %17
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
  br label %22

.lr.ph4.split.us:                                 ; preds = %..lr.ph4.split.us_crit_edge, %._crit_edge.us..lr.ph4.split.us_crit_edge
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %._crit_edge.us..lr.ph4.split.us_crit_edge ], [ 0, %..lr.ph4.split.us_crit_edge ]
  %3 = trunc i64 %indvars.iv16 to i32
  %4 = srem i32 %3, 2100
  %5 = sitofp i32 %4 to double
  %6 = fdiv double %5, 2.100000e+03
  %7 = getelementptr inbounds double, double* %1, i64 %indvars.iv16
  store double %6, double* %7, align 8
  br label %.lr.ph4.split.us.new

.lr.ph4.split.us.new:                             ; preds = %.lr.ph4.split.us.new..lr.ph4.split.us.new_crit_edge, %.lr.ph4.split.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph4.split.us.new..lr.ph4.split.us.new_crit_edge ], [ 0, %.lr.ph4.split.us ]
  %indvars.iv.next = or i64 %indvars.iv, 1
  %8 = mul nsw i64 %indvars.iv.next, %indvars.iv16
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 2100
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds [1900 x double], [1900 x double]* %0, i64 %indvars.iv16, i64 %indvars.iv
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %13 = mul nsw i64 %indvars.iv.next.1, %indvars.iv16
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 2100
  %16 = sitofp i32 %15 to double
  %17 = insertelement <2 x double> undef, double %11, i32 0
  %18 = insertelement <2 x double> %17, double %16, i32 1
  %19 = fdiv <2 x double> %18, <double 2.100000e+03, double 2.100000e+03>
  %20 = bitcast double* %12 to <2 x double>*
  store <2 x double> %19, <2 x double>* %20, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1900
  br i1 %exitcond.1, label %._crit_edge.us, label %.lr.ph4.split.us.new..lr.ph4.split.us.new_crit_edge

.lr.ph4.split.us.new..lr.ph4.split.us.new_crit_edge: ; preds = %.lr.ph4.split.us.new
  br label %.lr.ph4.split.us.new

._crit_edge.us:                                   ; preds = %.lr.ph4.split.us.new
  %indvars.iv.next17 = add nsw i64 %indvars.iv16, 1
  %21 = icmp slt i64 %indvars.iv.next17, 2100
  br i1 %21, label %._crit_edge.us..lr.ph4.split.us_crit_edge, label %._crit_edge5

._crit_edge.us..lr.ph4.split.us_crit_edge:        ; preds = %._crit_edge.us
  br label %.lr.ph4.split.us

; <label>:22:                                     ; preds = %._crit_edge, %.lr.ph10
  %indvars.iv20 = phi i64 [ 0, %.lr.ph10 ], [ %indvars.iv.next21, %._crit_edge ]
  %23 = trunc i64 %indvars.iv20 to i32
  %24 = srem i32 %23, 1900
  %25 = sitofp i32 %24 to double
  %26 = fdiv double %25, 1.900000e+03
  %27 = getelementptr inbounds double, double* %2, i64 %indvars.iv20
  store double %26, double* %27, align 8
  %indvars.iv.next21 = add nsw i64 %indvars.iv20, 1
  %28 = icmp slt i64 %indvars.iv.next21, 1900
  br i1 %28, label %._crit_edge, label %..lr.ph4.split.us_crit_edge

..lr.ph4.split.us_crit_edge:                      ; preds = %22
  br label %.lr.ph4.split.us

._crit_edge:                                      ; preds = %22
  br label %22

._crit_edge5:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_bicg([1900 x double]* nocapture readonly, double* nocapture, double*, double* nocapture readonly, double*) unnamed_addr #2 {
.lr.ph9:
  %scevgep3435 = bitcast double* %1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep3435, i8 0, i64 15200, i32 8, i1 false)
  br label %22

.lr.ph3.split.us.preheader:                       ; preds = %22
  %sunkaddr = ptrtoint double* %4 to i64
  %sunkaddr24 = ptrtoint double* %2 to i64
  br label %.lr.ph3.split.us

.lr.ph3.split.us:                                 ; preds = %._crit_edge.us..lr.ph3.split.us_crit_edge, %.lr.ph3.split.us.preheader
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %._crit_edge.us..lr.ph3.split.us_crit_edge ], [ 0, %.lr.ph3.split.us.preheader ]
  %5 = getelementptr inbounds double, double* %2, i64 %indvars.iv15
  store double 0.000000e+00, double* %5, align 8
  %sunkaddr21 = shl i64 %indvars.iv15, 3
  %sunkaddr22 = add i64 %sunkaddr, %sunkaddr21
  %sunkaddr23 = inttoptr i64 %sunkaddr22 to double*
  %sunkaddr26 = add i64 %sunkaddr24, %sunkaddr21
  %sunkaddr27 = inttoptr i64 %sunkaddr26 to double*
  br label %6

; <label>:6:                                      ; preds = %._crit_edge, %.lr.ph3.split.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 0, %.lr.ph3.split.us ]
  %7 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %8 = load double, double* %7, align 8
  %9 = load double, double* %sunkaddr23, align 8
  %10 = getelementptr inbounds [1900 x double], [1900 x double]* %0, i64 %indvars.iv15, i64 %indvars.iv
  %11 = load double, double* %10, align 8
  %12 = fmul double %9, %11
  %13 = fadd double %8, %12
  store double %13, double* %7, align 8
  %14 = load double, double* %sunkaddr27, align 8
  %15 = load double, double* %10, align 8
  %16 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fadd double %14, %18
  store double %19, double* %sunkaddr27, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %20 = icmp slt i64 %indvars.iv.next, 1900
  br i1 %20, label %._crit_edge, label %._crit_edge.us

._crit_edge:                                      ; preds = %6
  br label %6

._crit_edge.us:                                   ; preds = %6
  %indvars.iv.next16 = add nsw i64 %indvars.iv15, 1
  %21 = icmp slt i64 %indvars.iv.next16, 2100
  br i1 %21, label %._crit_edge.us..lr.ph3.split.us_crit_edge, label %._crit_edge4

._crit_edge.us..lr.ph3.split.us_crit_edge:        ; preds = %._crit_edge.us
  br label %.lr.ph3.split.us

; <label>:22:                                     ; preds = %._crit_edge38, %.lr.ph9
  %indvars.iv19 = phi i64 [ 0, %.lr.ph9 ], [ %indvars.iv.next20, %._crit_edge38 ]
  %indvars.iv.next20 = add nsw i64 %indvars.iv19, 1
  %23 = icmp slt i64 %indvars.iv.next20, 1900
  br i1 %23, label %._crit_edge38, label %.lr.ph3.split.us.preheader

._crit_edge38:                                    ; preds = %22
  br label %22

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
  br label %6

; <label>:6:                                      ; preds = %._crit_edge14, %.lr.ph6
  %indvars.iv11 = phi i64 [ 0, %.lr.ph6 ], [ %indvars.iv.next12, %._crit_edge14 ]
  %7 = trunc i64 %indvars.iv11 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge13

._crit_edge13:                                    ; preds = %6
  br label %12

; <label>:10:                                     ; preds = %6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc4 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #6
  br label %12

; <label>:12:                                     ; preds = %._crit_edge13, %10
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds double, double* %0, i64 %indvars.iv11
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #7
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, 1
  %17 = icmp slt i64 %indvars.iv.next12, 1900
  br i1 %17, label %._crit_edge14, label %._crit_edge7

._crit_edge14:                                    ; preds = %12
  br label %6

._crit_edge7:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  br label %22

; <label>:22:                                     ; preds = %._crit_edge16, %._crit_edge7
  %indvars.iv = phi i64 [ 0, %._crit_edge7 ], [ %indvars.iv.next, %._crit_edge16 ]
  %23 = trunc i64 %indvars.iv to i32
  %24 = srem i32 %23, 20
  %25 = icmp eq i32 %24, 0
  br i1 %25, label %26, label %._crit_edge15

._crit_edge15:                                    ; preds = %22
  br label %28

; <label>:26:                                     ; preds = %22
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %27) #6
  br label %28

; <label>:28:                                     ; preds = %._crit_edge15, %26
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = getelementptr inbounds double, double* %1, i64 %indvars.iv
  %31 = load double, double* %30, align 8
  %32 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %31) #7
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %33 = icmp slt i64 %indvars.iv.next, 2100
  br i1 %33, label %._crit_edge16, label %._crit_edge

._crit_edge16:                                    ; preds = %28
  br label %22

._crit_edge:                                      ; preds = %28
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %35 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %34, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %37 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %36) #6
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
