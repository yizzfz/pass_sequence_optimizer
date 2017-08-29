; ModuleID = 'A.ll'
source_filename = "heat-3d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = call i8* @polybench_alloc_data(i64 1728000, i32 8) #3
  %4 = call i8* @polybench_alloc_data(i64 1728000, i32 8) #3
  %5 = bitcast i8* %3 to [120 x [120 x double]]*
  %6 = bitcast i8* %4 to [120 x [120 x double]]*
  call fastcc void @init_array([120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  call void (...) @polybench_timer_start() #3
  call fastcc void @kernel_heat_3d([120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %7 = icmp sgt i32 %0, 42
  br i1 %7, label %8, label %._crit_edge

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %8
  %12 = bitcast i8* %3 to [120 x [120 x double]]*
  call fastcc void @print_array([120 x [120 x double]]* %12)
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %2, %11
  call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #0 {
.preheader3.lr.ph:
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %._crit_edge6.us, %.preheader3.lr.ph
  %indvars.iv24 = phi i64 [ 0, %.preheader3.lr.ph ], [ %indvars.iv.next25, %._crit_edge6.us ]
  %2 = trunc i64 %indvars.iv24 to i32
  %3 = add i32 %2, 120
  br label %.preheader.us.us

._crit_edge6.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next25, 120
  br i1 %exitcond27, label %._crit_edge8, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv20 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next21, %._crit_edge.us.us ]
  %4 = trunc i64 %indvars.iv20 to i32
  %5 = add i32 %3, %4
  br label %._crit_edge

._crit_edge.us.us:                                ; preds = %._crit_edge
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next21, 120
  br i1 %exitcond23, label %._crit_edge6.us, label %.preheader.us.us

._crit_edge:                                      ; preds = %._crit_edge, %.preheader.us.us
  %indvars.iv = phi i64 [ 0, %.preheader.us.us ], [ %indvars.iv.next.1, %._crit_edge ]
  %6 = sub nsw i64 0, %indvars.iv
  %7 = trunc i64 %6 to i32
  %8 = add nsw i32 %5, %7
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv24, i64 %indvars.iv20, i64 %indvars.iv
  %11 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv24, i64 %indvars.iv20, i64 %indvars.iv
  %12 = trunc i64 %indvars.iv to i32
  %13 = xor i32 %12, -1
  %14 = add nsw i32 %5, %13
  %15 = sitofp i32 %14 to double
  %16 = insertelement <2 x double> undef, double %9, i32 0
  %17 = insertelement <2 x double> %16, double %15, i32 1
  %18 = fmul <2 x double> %17, <double 1.000000e+01, double 1.000000e+01>
  %19 = fdiv <2 x double> %18, <double 1.200000e+02, double 1.200000e+02>
  %20 = bitcast double* %10 to <2 x double>*
  %21 = bitcast double* %11 to <2 x double>*
  store <2 x double> %19, <2 x double>* %20, align 8
  store <2 x double> %19, <2 x double>* %21, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %._crit_edge.us.us, label %._crit_edge

._crit_edge8:                                     ; preds = %._crit_edge6.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_heat_3d([120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #0 {
  br label %.preheader8.preheader

.preheader8.preheader:                            ; preds = %._crit_edge12, %2
  %.0513 = phi i32 [ 1, %2 ], [ %79, %._crit_edge12 ]
  br label %.preheader6.lr.ph

.preheader6.lr.ph:                                ; preds = %._crit_edge4, %.preheader8.preheader
  %indvars.iv18 = phi i64 [ 1, %.preheader8.preheader ], [ %3, %._crit_edge4 ]
  %3 = add nuw nsw i64 %indvars.iv18, 1
  %4 = add nsw i64 %indvars.iv18, -1
  br label %.preheader6.us

.preheader6.us:                                   ; preds = %._crit_edge.us, %.preheader6.lr.ph
  %indvars.iv14 = phi i64 [ 1, %.preheader6.lr.ph ], [ %indvars.iv.next15, %._crit_edge.us ]
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %5 = add nsw i64 %indvars.iv14, -1
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader6.us
  %indvars.iv = phi i64 [ 1, %.preheader6.us ], [ %indvars.iv.next, %._crit_edge ]
  %6 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %3, i64 %indvars.iv14, i64 %indvars.iv
  %7 = load double, double* %6, align 8
  %8 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv18, i64 %indvars.iv14, i64 %indvars.iv
  %9 = load double, double* %8, align 8
  %10 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %4, i64 %indvars.iv14, i64 %indvars.iv
  %11 = load double, double* %10, align 8
  %12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv18, i64 %indvars.iv.next15, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = shufflevector <2 x double> %14, <2 x double> undef, <2 x i32> zeroinitializer
  %16 = fmul <2 x double> %15, <double 2.000000e+00, double 2.000000e+00>
  %17 = insertelement <2 x double> undef, double %7, i32 0
  %18 = insertelement <2 x double> %17, double %13, i32 1
  %19 = fsub <2 x double> %18, %16
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv18, i64 %5, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = insertelement <2 x double> undef, double %11, i32 0
  %23 = insertelement <2 x double> %22, double %21, i32 1
  %24 = fadd <2 x double> %19, %23
  %25 = fmul <2 x double> %24, <double 1.250000e-01, double 1.250000e-01>
  %26 = extractelement <2 x double> %25, i32 0
  %27 = extractelement <2 x double> %25, i32 1
  %28 = fadd double %26, %27
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv18, i64 %indvars.iv14, i64 %indvars.iv.next
  %30 = load double, double* %29, align 8
  %31 = fmul double %9, 2.000000e+00
  %32 = fsub double %30, %31
  %33 = add nsw i64 %indvars.iv, -1
  %34 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv18, i64 %indvars.iv14, i64 %33
  %35 = load double, double* %34, align 8
  %36 = fadd double %32, %35
  %37 = fmul double %36, 1.250000e-01
  %38 = fadd double %37, %28
  %39 = fadd double %9, %38
  %40 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv18, i64 %indvars.iv14, i64 %indvars.iv
  store double %39, double* %40, align 8
  %exitcond38 = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond38, label %._crit_edge.us, label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %exitcond17 = icmp eq i64 %indvars.iv.next15, 119
  br i1 %exitcond17, label %._crit_edge4, label %.preheader6.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  %exitcond21 = icmp eq i64 %3, 119
  br i1 %exitcond21, label %.preheader.lr.ph.preheader, label %.preheader6.lr.ph

.preheader.lr.ph.preheader:                       ; preds = %._crit_edge4
  br label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.preheader, %._crit_edge10
  %indvars.iv30 = phi i64 [ %41, %._crit_edge10 ], [ 1, %.preheader.lr.ph.preheader ]
  %41 = add nuw nsw i64 %indvars.iv30, 1
  %42 = add nsw i64 %indvars.iv30, -1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge8.us, %.preheader.lr.ph
  %indvars.iv26 = phi i64 [ 1, %.preheader.lr.ph ], [ %indvars.iv.next27, %._crit_edge8.us ]
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %43 = add nsw i64 %indvars.iv26, -1
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2, %.preheader.us
  %indvars.iv22 = phi i64 [ 1, %.preheader.us ], [ %indvars.iv.next23, %._crit_edge2 ]
  %44 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %41, i64 %indvars.iv26, i64 %indvars.iv22
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv30, i64 %indvars.iv26, i64 %indvars.iv22
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %42, i64 %indvars.iv26, i64 %indvars.iv22
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv30, i64 %indvars.iv.next27, i64 %indvars.iv22
  %51 = load double, double* %50, align 8
  %52 = insertelement <2 x double> undef, double %47, i32 0
  %53 = shufflevector <2 x double> %52, <2 x double> undef, <2 x i32> zeroinitializer
  %54 = fmul <2 x double> %53, <double 2.000000e+00, double 2.000000e+00>
  %55 = insertelement <2 x double> undef, double %45, i32 0
  %56 = insertelement <2 x double> %55, double %51, i32 1
  %57 = fsub <2 x double> %56, %54
  %58 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv30, i64 %43, i64 %indvars.iv22
  %59 = load double, double* %58, align 8
  %60 = insertelement <2 x double> undef, double %49, i32 0
  %61 = insertelement <2 x double> %60, double %59, i32 1
  %62 = fadd <2 x double> %57, %61
  %63 = fmul <2 x double> %62, <double 1.250000e-01, double 1.250000e-01>
  %64 = extractelement <2 x double> %63, i32 0
  %65 = extractelement <2 x double> %63, i32 1
  %66 = fadd double %64, %65
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %67 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv30, i64 %indvars.iv26, i64 %indvars.iv.next23
  %68 = load double, double* %67, align 8
  %69 = fmul double %47, 2.000000e+00
  %70 = fsub double %68, %69
  %71 = add nsw i64 %indvars.iv22, -1
  %72 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv30, i64 %indvars.iv26, i64 %71
  %73 = load double, double* %72, align 8
  %74 = fadd double %70, %73
  %75 = fmul double %74, 1.250000e-01
  %76 = fadd double %75, %66
  %77 = fadd double %47, %76
  %78 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv30, i64 %indvars.iv26, i64 %indvars.iv22
  store double %77, double* %78, align 8
  %exitcond = icmp eq i64 %indvars.iv.next23, 119
  br i1 %exitcond, label %._crit_edge8.us, label %._crit_edge2

._crit_edge8.us:                                  ; preds = %._crit_edge2
  %exitcond29 = icmp eq i64 %indvars.iv.next27, 119
  br i1 %exitcond29, label %._crit_edge10, label %.preheader.us

._crit_edge10:                                    ; preds = %._crit_edge8.us
  %exitcond33 = icmp eq i64 %41, 119
  br i1 %exitcond33, label %._crit_edge12, label %.preheader.lr.ph

._crit_edge12:                                    ; preds = %._crit_edge10
  %79 = add nuw nsw i32 %.0513, 1
  %exitcond34 = icmp eq i32 %79, 501
  br i1 %exitcond34, label %80, label %.preheader8.preheader

; <label>:80:                                     ; preds = %._crit_edge12
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([120 x [120 x double]]*) unnamed_addr #0 {
.preheader3.lr.ph:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #4
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %._crit_edge6.us, %.preheader3.lr.ph
  %indvars.iv23 = phi i64 [ 0, %.preheader3.lr.ph ], [ %indvars.iv.next24, %._crit_edge6.us ]
  %5 = mul nuw nsw i64 %indvars.iv23, 120
  br label %.preheader.us.us

._crit_edge6.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next24, 120
  br i1 %exitcond26, label %._crit_edge8, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv19 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next20, %._crit_edge.us.us ]
  %6 = add nuw nsw i64 %indvars.iv19, %5
  %7 = mul nuw nsw i64 %6, 120
  br label %._crit_edge2

._crit_edge.us.us:                                ; preds = %._crit_edge
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next20, 120
  br i1 %exitcond22, label %._crit_edge6.us, label %.preheader.us.us

._crit_edge2:                                     ; preds = %._crit_edge, %.preheader.us.us
  %indvars.iv = phi i64 [ 0, %.preheader.us.us ], [ %indvars.iv.next, %._crit_edge ]
  %8 = add nuw nsw i64 %indvars.iv, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge2
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = call i32 @fputc(i32 10, %struct._IO_FILE* %13) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge2, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv23, i64 %indvars.iv19, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %._crit_edge.us.us, label %._crit_edge2

._crit_edge8:                                     ; preds = %._crit_edge6.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
