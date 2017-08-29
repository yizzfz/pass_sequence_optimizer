; ModuleID = 'A.ll'
source_filename = "covariance.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [4 x i8] c"cov\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = alloca double, align 8
  %4 = call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = bitcast i8* %4 to [1200 x double]*
  call void @init_array(double* nonnull %3, [1200 x double]* %7)
  call void (...) @polybench_timer_start() #4
  %8 = load double, double* %3, align 8
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  call void @kernel_covariance(double %8, [1200 x double]* %7, [1200 x double]* %9, double* %10)
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
  %16 = bitcast i8* %5 to [1200 x double]*
  call void @print_array([1200 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %4) #4
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(double* nocapture, [1200 x double]* nocapture) #2 {
  store double 1.400000e+03, double* %0, align 8
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %29, %2
  %indvars.iv1 = phi i64 [ 0, %2 ], [ %indvars.iv.next2, %29 ]
  %3 = trunc i64 %indvars.iv1 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge1
  %indvars.iv = phi i64 [ 0, %._crit_edge1 ], [ %indvars.iv.next.1.1, %._crit_edge ]
  %7 = trunc i64 %indvars.iv to i32
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1, i64 %indvars.iv
  %10 = trunc i64 %indvars.iv to i32
  %11 = or i32 %10, 1
  %12 = sitofp i32 %11 to double
  %13 = insertelement <2 x double> undef, double %8, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  %15 = fmul <2 x double> %6, %14
  %16 = fdiv <2 x double> %15, <double 1.200000e+03, double 1.200000e+03>
  %17 = bitcast double* %9 to <2 x double>*
  store <2 x double> %16, <2 x double>* %17, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %18 = trunc i64 %indvars.iv.next.1 to i32
  %19 = sitofp i32 %18 to double
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1, i64 %indvars.iv.next.1
  %21 = trunc i64 %indvars.iv.next.1 to i32
  %22 = or i32 %21, 1
  %23 = sitofp i32 %22 to double
  %24 = insertelement <2 x double> undef, double %19, i32 0
  %25 = insertelement <2 x double> %24, double %23, i32 1
  %26 = fmul <2 x double> %6, %25
  %27 = fdiv <2 x double> %26, <double 1.200000e+03, double 1.200000e+03>
  %28 = bitcast double* %20 to <2 x double>*
  store <2 x double> %27, <2 x double>* %28, align 8
  %indvars.iv.next.1.1 = add nsw i64 %indvars.iv, 4
  %exitcond.1.1 = icmp eq i64 %indvars.iv.next.1.1, 1200
  br i1 %exitcond.1.1, label %29, label %._crit_edge

; <label>:29:                                     ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next2, 1400
  br i1 %exitcond, label %30, label %._crit_edge1

; <label>:30:                                     ; preds = %29
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_covariance(double, [1200 x double]*, [1200 x double]*, double*) #2 {
.lr.ph19.preheader:
  %4 = alloca double, align 8
  %5 = alloca [1200 x double]*, align 8
  %6 = alloca [1200 x double]*, align 8
  store double %0, double* %4, align 8
  store [1200 x double]* %1, [1200 x double]** %5, align 8
  store [1200 x double]* %2, [1200 x double]** %6, align 8
  %sunkaddr = ptrtoint double* %3 to i64
  %7 = ptrtoint double* %3 to i64
  br label %.lr.ph19

.lr.ph19:                                         ; preds = %._crit_edge16, %.lr.ph19.preheader
  %indvars.iv39 = phi i64 [ 0, %.lr.ph19.preheader ], [ %indvars.iv.next40, %._crit_edge16 ]
  %8 = getelementptr inbounds double, double* %3, i64 %indvars.iv39
  store double 0.000000e+00, double* %8, align 8
  %sunkaddr50 = shl nuw nsw i64 %indvars.iv39, 3
  %sunkaddr51 = add i64 %sunkaddr, %sunkaddr50
  %sunkaddr52 = inttoptr i64 %sunkaddr51 to double*
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1, %.lr.ph19
  %indvars.iv36 = phi i64 [ 0, %.lr.ph19 ], [ %indvars.iv.next37.4, %._crit_edge1 ]
  %9 = phi double [ 0.000000e+00, %.lr.ph19 ], [ %24, %._crit_edge1 ]
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv36, i64 %indvars.iv39
  %11 = load double, double* %10, align 8
  %12 = fadd double %9, %11
  store double %12, double* %sunkaddr52, align 8
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next37, i64 %indvars.iv39
  %14 = load double, double* %13, align 8
  %15 = fadd double %12, %14
  store double %15, double* %sunkaddr52, align 8
  %indvars.iv.next37.1 = add nuw nsw i64 %indvars.iv36, 2
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next37.1, i64 %indvars.iv39
  %17 = load double, double* %16, align 8
  %18 = fadd double %15, %17
  store double %18, double* %sunkaddr52, align 8
  %indvars.iv.next37.2 = add nuw nsw i64 %indvars.iv36, 3
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next37.2, i64 %indvars.iv39
  %20 = load double, double* %19, align 8
  %21 = fadd double %18, %20
  store double %21, double* %sunkaddr52, align 8
  %indvars.iv.next37.3 = add nuw nsw i64 %indvars.iv36, 4
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next37.3, i64 %indvars.iv39
  %23 = load double, double* %22, align 8
  %24 = fadd double %21, %23
  store double %24, double* %sunkaddr52, align 8
  %indvars.iv.next37.4 = add nuw nsw i64 %indvars.iv36, 5
  %exitcond38.4 = icmp eq i64 %indvars.iv.next37.4, 1400
  br i1 %exitcond38.4, label %._crit_edge16, label %._crit_edge1

._crit_edge16:                                    ; preds = %._crit_edge1
  %25 = fdiv double %24, %0
  %sunkaddr46 = shl i64 %indvars.iv39, 3
  %sunkaddr47 = add i64 %7, %sunkaddr46
  %sunkaddr48 = inttoptr i64 %sunkaddr47 to double*
  store double %25, double* %sunkaddr48, align 8
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next40, 1200
  br i1 %exitcond41, label %.lr.ph12.preheader, label %.lr.ph19

.lr.ph12.preheader:                               ; preds = %._crit_edge16
  br label %.lr.ph12

.lr.ph12:                                         ; preds = %.lr.ph12.preheader, %._crit_edge10
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %._crit_edge10 ], [ 0, %.lr.ph12.preheader ]
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2, %.lr.ph12
  %indvars.iv30 = phi i64 [ 0, %.lr.ph12 ], [ %indvars.iv.next31.3, %._crit_edge2 ]
  %26 = getelementptr inbounds double, double* %3, i64 %indvars.iv30
  %27 = load double, double* %26, align 8
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv33, i64 %indvars.iv30
  %29 = load double, double* %28, align 8
  %30 = fsub double %29, %27
  store double %30, double* %28, align 8
  %indvars.iv.next31 = or i64 %indvars.iv30, 1
  %31 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next31
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv33, i64 %indvars.iv.next31
  %34 = load double, double* %33, align 8
  %35 = fsub double %34, %32
  store double %35, double* %33, align 8
  %indvars.iv.next31.1 = or i64 %indvars.iv30, 2
  %36 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next31.1
  %37 = load double, double* %36, align 8
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv33, i64 %indvars.iv.next31.1
  %39 = load double, double* %38, align 8
  %40 = fsub double %39, %37
  store double %40, double* %38, align 8
  %indvars.iv.next31.2 = or i64 %indvars.iv30, 3
  %41 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next31.2
  %42 = load double, double* %41, align 8
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv33, i64 %indvars.iv.next31.2
  %44 = load double, double* %43, align 8
  %45 = fsub double %44, %42
  store double %45, double* %43, align 8
  %indvars.iv.next31.3 = add nuw nsw i64 %indvars.iv30, 4
  %exitcond32.3 = icmp eq i64 %indvars.iv.next31.3, 1200
  br i1 %exitcond32.3, label %._crit_edge10, label %._crit_edge2

._crit_edge10:                                    ; preds = %._crit_edge2
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next34, 1400
  br i1 %exitcond35, label %.lr.ph3.preheader, label %.lr.ph12

.lr.ph3.preheader:                                ; preds = %._crit_edge10
  br label %.lr.ph3

.lr.ph3:                                          ; preds = %.lr.ph3.preheader, %._crit_edge4
  %indvars.iv27 = phi i64 [ %indvars.iv.next28, %._crit_edge4 ], [ 0, %.lr.ph3.preheader ]
  %46 = phi [1200 x double]* [ %68, %._crit_edge4 ], [ %2, %.lr.ph3.preheader ]
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.lr.ph3
  %indvars.iv25 = phi i64 [ %indvars.iv27, %.lr.ph3 ], [ %indvars.iv.next26, %._crit_edge ]
  %47 = phi [1200 x double]* [ %46, %.lr.ph3 ], [ %68, %._crit_edge ]
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %47, i64 %indvars.iv27, i64 %indvars.iv25
  store double 0.000000e+00, double* %48, align 8
  %49 = load [1200 x double]*, [1200 x double]** %5, align 8
  %50 = load [1200 x double]*, [1200 x double]** %6, align 8
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %50, i64 %indvars.iv27, i64 %indvars.iv25
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.1, %._crit_edge3 ]
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %49, i64 %indvars.iv, i64 %indvars.iv27
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %49, i64 %indvars.iv, i64 %indvars.iv25
  %55 = load double, double* %54, align 8
  %56 = fmul double %53, %55
  %57 = load double, double* %51, align 8
  %58 = fadd double %57, %56
  store double %58, double* %51, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %49, i64 %indvars.iv.next, i64 %indvars.iv27
  %60 = load double, double* %59, align 8
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %49, i64 %indvars.iv.next, i64 %indvars.iv25
  %62 = load double, double* %61, align 8
  %63 = fmul double %60, %62
  %64 = load double, double* %51, align 8
  %65 = fadd double %64, %63
  store double %65, double* %51, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %._crit_edge, label %._crit_edge3

._crit_edge:                                      ; preds = %._crit_edge3
  %66 = load double, double* %4, align 8
  %67 = fadd double %66, -1.000000e+00
  %68 = load [1200 x double]*, [1200 x double]** %6, align 8
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %68, i64 %indvars.iv27, i64 %indvars.iv25
  %70 = load double, double* %69, align 8
  %71 = fdiv double %70, %67
  store double %71, double* %69, align 8
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %68, i64 %indvars.iv25, i64 %indvars.iv27
  store double %71, double* %72, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond = icmp eq i64 %indvars.iv.next26, 1200
  br i1 %exitcond, label %._crit_edge4, label %.lr.ph

._crit_edge4:                                     ; preds = %._crit_edge
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next28, 1200
  br i1 %exitcond29, label %._crit_edge7, label %.lr.ph3

._crit_edge7:                                     ; preds = %._crit_edge4
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]* nocapture readonly) #0 {
.lr.ph2.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph2

.lr.ph2:                                          ; preds = %._crit_edge, %.lr.ph2.preheader
  %indvars.iv4 = phi i64 [ 0, %.lr.ph2.preheader ], [ %indvars.iv.next5, %._crit_edge ]
  %5 = mul nuw nsw i64 %indvars.iv4, 1200
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge1, %.lr.ph2
  %indvars.iv = phi i64 [ 0, %.lr.ph2 ], [ %indvars.iv.next, %._crit_edge1 ]
  %6 = add nuw nsw i64 %5, %indvars.iv
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge1

; <label>:10:                                     ; preds = %._crit_edge2
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge2, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv4, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge, label %._crit_edge2

._crit_edge:                                      ; preds = %._crit_edge1
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1200
  br i1 %exitcond6, label %._crit_edge3, label %.lr.ph2

._crit_edge3:                                     ; preds = %._crit_edge
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([4 x i8], [4 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
