; ModuleID = 'A.ll'
source_filename = "bicg.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"s\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %8 = bitcast i8* %3 to [1900 x double]*
  %9 = bitcast i8* %7 to double*
  %10 = bitcast i8* %6 to double*
  tail call void @init_array(i32 1900, i32 2100, [1900 x double]* %8, double* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  %11 = bitcast i8* %4 to double*
  %12 = bitcast i8* %5 to double*
  %13 = bitcast i8* %7 to double*
  tail call void @kernel_bicg(i32 1900, i32 2100, [1900 x double]* %8, double* %11, double* %12, double* %10, double* %13)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %14 = icmp sgt i32 %0, 42
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %2
  %16 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %16, align 1
  %17 = icmp eq i8 %strcmpload, 0
  br i1 %17, label %18, label %._crit_edge

; <label>:18:                                     ; preds = %15
  %19 = bitcast i8* %5 to double*
  %20 = bitcast i8* %4 to double*
  tail call void @print_array(i32 1900, i32 2100, double* %20, double* %19)
  br label %._crit_edge

._crit_edge:                                      ; preds = %15, %2, %18
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, [1900 x double]*, double*, double*) #2 {
.lr.ph9.preheader:
  br label %.lr.ph9

.lr.ph5.split.us:                                 ; preds = %.lr.ph5.split.us.preheader, %.loopexit.us
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %.loopexit.us ], [ 0, %.lr.ph5.split.us.preheader ]
  %5 = trunc i64 %indvars.iv35 to i32
  %6 = srem i32 %5, 2100
  %7 = sitofp i32 %6 to double
  %8 = fdiv double %7, 2.100000e+03
  %9 = getelementptr inbounds double, double* %3, i64 %indvars.iv35
  store double %8, double* %9, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph5.split.us
  %indvars.iv = phi i64 [ 0, %.lr.ph5.split.us ], [ %indvars.iv.next.1, %._crit_edge ]
  %indvars.iv.next = or i64 %indvars.iv, 1
  %10 = mul nuw nsw i64 %indvars.iv35, %indvars.iv.next
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 2100
  %13 = sitofp i32 %12 to double
  %14 = getelementptr inbounds [1900 x double], [1900 x double]* %2, i64 %indvars.iv35, i64 %indvars.iv
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %15 = mul nuw nsw i64 %indvars.iv35, %indvars.iv.next.1
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 2100
  %18 = sitofp i32 %17 to double
  %19 = insertelement <2 x double> undef, double %13, i32 0
  %20 = insertelement <2 x double> %19, double %18, i32 1
  %21 = fdiv <2 x double> %20, <double 2.100000e+03, double 2.100000e+03>
  %22 = bitcast double* %14 to <2 x double>*
  store <2 x double> %21, <2 x double>* %22, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 1899
  br i1 %exitcond.1, label %.loopexit.us, label %._crit_edge

.loopexit.us:                                     ; preds = %._crit_edge
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next36, 2100
  br i1 %exitcond37, label %.preheader._crit_edge, label %.lr.ph5.split.us

.lr.ph9:                                          ; preds = %.lr.ph9, %.lr.ph9.preheader
  %indvars.iv30 = phi i64 [ 0, %.lr.ph9.preheader ], [ %indvars.iv.next31.1, %.lr.ph9 ]
  %23 = trunc i64 %indvars.iv30 to i32
  %24 = sitofp i32 %23 to double
  %25 = getelementptr inbounds double, double* %4, i64 %indvars.iv30
  %indvars.iv.next31 = or i64 %indvars.iv30, 1
  %26 = trunc i64 %indvars.iv.next31 to i32
  %27 = sitofp i32 %26 to double
  %28 = insertelement <2 x double> undef, double %24, i32 0
  %29 = insertelement <2 x double> %28, double %27, i32 1
  %30 = fdiv <2 x double> %29, <double 1.900000e+03, double 1.900000e+03>
  %31 = bitcast double* %25 to <2 x double>*
  store <2 x double> %30, <2 x double>* %31, align 8
  %indvars.iv.next31.1 = add nsw i64 %indvars.iv30, 2
  %exitcond39.1 = icmp eq i64 %indvars.iv.next31.1, 1900
  br i1 %exitcond39.1, label %.lr.ph5.split.us.preheader, label %.lr.ph9

.lr.ph5.split.us.preheader:                       ; preds = %.lr.ph9
  br label %.lr.ph5.split.us

.preheader._crit_edge:                            ; preds = %.loopexit.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_bicg(i32, i32, [1900 x double]*, double*, double*, double*, double*) #2 {
.lr.ph9:
  %7 = bitcast double* %3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 15200, i32 8, i1 false)
  br label %._crit_edge16

.lr.ph5.split.us:                                 ; preds = %.lr.ph5.split.us.preheader, %.loopexit.us
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %.loopexit.us ], [ 0, %.lr.ph5.split.us.preheader ]
  %sext = shl i64 %indvars.iv19, 32
  %8 = ashr exact i64 %sext, 32
  %9 = getelementptr inbounds double, double* %4, i64 %8
  store double 0.000000e+00, double* %9, align 8
  %sunkaddr27 = shl nuw nsw i64 %indvars.iv19, 3
  %sunkaddr28 = add i64 %sunkaddr, %sunkaddr27
  %sunkaddr29 = inttoptr i64 %sunkaddr28 to double*
  %sunkaddr31 = shl nuw nsw i64 %indvars.iv19, 3
  %sunkaddr32 = add i64 %sunkaddr30, %sunkaddr31
  %sunkaddr33 = inttoptr i64 %sunkaddr32 to double*
  br label %10

; <label>:10:                                     ; preds = %10, %.lr.ph5.split.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %10 ], [ 0, %.lr.ph5.split.us ]
  %11 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %12 = load double, double* %11, align 8
  %13 = load double, double* %sunkaddr29, align 8
  %14 = getelementptr inbounds [1900 x double], [1900 x double]* %2, i64 %indvars.iv19, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = fmul double %13, %15
  %17 = fadd double %12, %16
  store double %17, double* %11, align 8
  %18 = load double, double* %sunkaddr33, align 8
  %19 = load double, double* %14, align 8
  %20 = getelementptr inbounds double, double* %5, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = fadd double %18, %22
  store double %23, double* %sunkaddr33, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1899
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %.loopexit.us, label %10

.loopexit.us:                                     ; preds = %10
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next20, 2100
  br i1 %exitcond24, label %.preheader._crit_edge, label %.lr.ph5.split.us

._crit_edge16:                                    ; preds = %._crit_edge16, %.lr.ph9
  %24 = phi i32 [ 0, %.lr.ph9 ], [ %25, %._crit_edge16 ]
  %25 = add nsw i32 %24, 25
  %exitcond26.24 = icmp eq i32 %25, 1900
  br i1 %exitcond26.24, label %.lr.ph5.split.us.preheader, label %._crit_edge16

.lr.ph5.split.us.preheader:                       ; preds = %._crit_edge16
  %sunkaddr = ptrtoint double* %6 to i64
  %sunkaddr30 = ptrtoint double* %4 to i64
  br label %.lr.ph5.split.us

.preheader._crit_edge:                            ; preds = %.loopexit.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, double*, double*) #0 {
.lr.ph8:
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %8

; <label>:8:                                      ; preds = %._crit_edge13, %.lr.ph8
  %indvars.iv19 = phi i64 [ %indvars.iv.next20, %._crit_edge13 ], [ 0, %.lr.ph8 ]
  %storemerge6 = phi i32 [ %17, %._crit_edge13 ], [ 0, %.lr.ph8 ]
  %9 = srem i32 %storemerge6, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge13

; <label>:11:                                     ; preds = %8
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc4 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %8, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds double, double* %2, i64 %indvars.iv19
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #7
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %17 = trunc i64 %indvars.iv.next20 to i32
  %exitcond21 = icmp eq i64 %indvars.iv.next20, 1900
  br i1 %exitcond21, label %._crit_edge, label %8

._crit_edge:                                      ; preds = %._crit_edge13
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  br label %22

; <label>:22:                                     ; preds = %._crit_edge16, %._crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge16 ], [ 0, %._crit_edge ]
  %storemerge15 = phi i32 [ %31, %._crit_edge16 ], [ 0, %._crit_edge ]
  %23 = srem i32 %storemerge15, 20
  %24 = icmp eq i32 %23, 0
  br i1 %24, label %25, label %._crit_edge16

; <label>:25:                                     ; preds = %22
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %26) #6
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %22, %25
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = getelementptr inbounds double, double* %3, i64 %indvars.iv
  %29 = load double, double* %28, align 8
  %30 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %29) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %31 = trunc i64 %indvars.iv.next to i32
  %exitcond = icmp eq i64 %indvars.iv.next, 2100
  br i1 %exitcond, label %._crit_edge15, label %22

._crit_edge15:                                    ; preds = %._crit_edge16
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %35 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %34) #6
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
