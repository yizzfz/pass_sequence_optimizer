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
  %3 = call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %4 = call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %.cast = bitcast i8* %3 to [120 x [120 x double]]*
  %5 = bitcast i8* %4 to [120 x [120 x double]]*
  call fastcc void @init_array(i32 120, [120 x [120 x double]]* %.cast, [120 x [120 x double]]* %5)
  call void (...) @polybench_timer_start() #4
  %6 = bitcast i8* %3 to [120 x [120 x double]]*
  %7 = bitcast i8* %4 to [120 x [120 x double]]*
  call fastcc void @kernel_heat_3d(i32 120, [120 x [120 x double]]* %6, [120 x [120 x double]]* %7)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %8 = icmp sgt i32 %0, 42
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %2
  %10 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %10, align 1
  %11 = icmp eq i8 %strcmpload, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %9
  call fastcc void @print_array(i32 120, [120 x [120 x double]]* %6)
  br label %._crit_edge

._crit_edge:                                      ; preds = %9, %2, %12
  call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
.preheader3.lr.ph:
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %._crit_edge5.us, %.preheader3.lr.ph
  %indvars.iv37 = phi i64 [ 0, %.preheader3.lr.ph ], [ %indvars.iv.next38, %._crit_edge5.us ]
  %3 = trunc i64 %indvars.iv37 to i32
  br label %.preheader.us.us

._crit_edge5.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond = icmp eq i64 %indvars.iv.next38, 120
  br i1 %exitcond, label %._crit_edge10, label %.preheader3.us

.preheader.us.us:                                 ; preds = %.preheader3.us, %._crit_edge.us.us
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %._crit_edge.us.us ], [ 0, %.preheader3.us ]
  %4 = trunc i64 %indvars.iv33 to i32
  br label %5

._crit_edge.us.us:                                ; preds = %5
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next34, 120
  br i1 %exitcond36, label %._crit_edge5.us, label %.preheader.us.us

; <label>:5:                                      ; preds = %5, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %5 ], [ 0, %.preheader.us.us ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = sub i32 120, %6
  %8 = add i32 %7, %3
  %9 = add i32 %8, %4
  %10 = sitofp i32 %9 to double
  %11 = fmul double %10, 1.000000e+01
  %12 = fdiv double %11, 1.200000e+02
  %13 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv37, i64 %indvars.iv33, i64 %indvars.iv
  store double %12, double* %13, align 8
  %14 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv37, i64 %indvars.iv33, i64 %indvars.iv
  store double %12, double* %14, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond32 = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond32, label %._crit_edge.us.us, label %5

._crit_edge10:                                    ; preds = %._crit_edge5.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  br label %.preheader11

.preheader11:                                     ; preds = %._crit_edge34, %3
  %4 = phi i32 [ 1, %3 ], [ %91, %._crit_edge34 ]
  br label %.preheader9

.preheader9:                                      ; preds = %._crit_edge13, %.preheader11
  %indvars.iv65 = phi i64 [ %5, %._crit_edge13 ], [ 1, %.preheader11 ]
  %5 = add nuw nsw i64 %indvars.iv65, 1
  %6 = add nsw i64 %indvars.iv65, -1
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %.preheader9, %._crit_edge.us
  %indvars.iv61 = phi i64 [ %7, %._crit_edge.us ], [ 1, %.preheader9 ]
  %7 = add nuw nsw i64 %indvars.iv61, 1
  %8 = add nsw i64 %indvars.iv61, -1
  br label %9

; <label>:9:                                      ; preds = %9, %.preheader7.us
  %indvars.iv = phi i64 [ 1, %.preheader7.us ], [ %36, %9 ]
  %10 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %5, i64 %indvars.iv61, i64 %indvars.iv
  %11 = load double, double* %10, align 8
  %12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv65, i64 %indvars.iv61, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = fmul double %13, 2.000000e+00
  %15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %6, i64 %indvars.iv61, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv65, i64 %7, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = insertelement <2 x double> undef, double %14, i32 0
  %20 = shufflevector <2 x double> %19, <2 x double> undef, <2 x i32> zeroinitializer
  %21 = insertelement <2 x double> undef, double %11, i32 0
  %22 = insertelement <2 x double> %21, double %18, i32 1
  %23 = fsub <2 x double> %22, %20
  %24 = extractelement <2 x double> %23, i32 0
  %25 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv65, i64 %8, i64 %indvars.iv
  %26 = load double, double* %25, align 8
  %27 = insertelement <2 x double> undef, double %24, i32 0
  %28 = insertelement <2 x double> %27, double %26, i32 1
  %29 = insertelement <2 x double> undef, double %16, i32 0
  %30 = shufflevector <2 x double> %29, <2 x double> %23, <2 x i32> <i32 0, i32 3>
  %31 = fadd <2 x double> %30, %28
  %32 = fmul <2 x double> %31, <double 1.250000e-01, double 1.250000e-01>
  %33 = extractelement <2 x double> %32, i32 0
  %34 = extractelement <2 x double> %32, i32 1
  %35 = fadd double %33, %34
  %36 = add nuw nsw i64 %indvars.iv, 1
  %37 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv65, i64 %indvars.iv61, i64 %36
  %38 = load double, double* %37, align 8
  %39 = fsub double %38, %14
  %40 = add nsw i64 %indvars.iv, -1
  %41 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv65, i64 %indvars.iv61, i64 %40
  %42 = load double, double* %41, align 8
  %43 = fadd double %39, %42
  %44 = fmul double %43, 1.250000e-01
  %45 = fadd double %35, %44
  %46 = fadd double %13, %45
  %47 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv65, i64 %indvars.iv61, i64 %indvars.iv
  store double %46, double* %47, align 8
  %exitcond = icmp eq i64 %36, 119
  br i1 %exitcond, label %._crit_edge.us, label %9

._crit_edge.us:                                   ; preds = %9
  %exitcond64 = icmp eq i64 %7, 119
  br i1 %exitcond64, label %._crit_edge13, label %.preheader7.us

._crit_edge13:                                    ; preds = %._crit_edge.us
  %exitcond2 = icmp eq i64 %5, 119
  br i1 %exitcond2, label %.preheader8.preheader, label %.preheader9

.preheader8.preheader:                            ; preds = %._crit_edge13
  br label %.preheader8

.preheader8:                                      ; preds = %._crit_edge29, %.preheader8.preheader
  %indvars.iv74 = phi i64 [ %48, %._crit_edge29 ], [ 1, %.preheader8.preheader ]
  %48 = add nuw nsw i64 %indvars.iv74, 1
  %49 = add nsw i64 %indvars.iv74, -1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge26.us, %.preheader8
  %indvars.iv71 = phi i64 [ %50, %._crit_edge26.us ], [ 1, %.preheader8 ]
  %50 = add nuw nsw i64 %indvars.iv71, 1
  %51 = add nsw i64 %indvars.iv71, -1
  br label %52

; <label>:52:                                     ; preds = %52, %.preheader.us
  %indvars.iv68 = phi i64 [ 1, %.preheader.us ], [ %79, %52 ]
  %53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %48, i64 %indvars.iv71, i64 %indvars.iv68
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv74, i64 %indvars.iv71, i64 %indvars.iv68
  %56 = load double, double* %55, align 8
  %57 = fmul double %56, 2.000000e+00
  %58 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %49, i64 %indvars.iv71, i64 %indvars.iv68
  %59 = load double, double* %58, align 8
  %60 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv74, i64 %50, i64 %indvars.iv68
  %61 = load double, double* %60, align 8
  %62 = insertelement <2 x double> undef, double %57, i32 0
  %63 = shufflevector <2 x double> %62, <2 x double> undef, <2 x i32> zeroinitializer
  %64 = insertelement <2 x double> undef, double %54, i32 0
  %65 = insertelement <2 x double> %64, double %61, i32 1
  %66 = fsub <2 x double> %65, %63
  %67 = extractelement <2 x double> %66, i32 0
  %68 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv74, i64 %51, i64 %indvars.iv68
  %69 = load double, double* %68, align 8
  %70 = insertelement <2 x double> undef, double %67, i32 0
  %71 = insertelement <2 x double> %70, double %69, i32 1
  %72 = insertelement <2 x double> undef, double %59, i32 0
  %73 = shufflevector <2 x double> %72, <2 x double> %66, <2 x i32> <i32 0, i32 3>
  %74 = fadd <2 x double> %73, %71
  %75 = fmul <2 x double> %74, <double 1.250000e-01, double 1.250000e-01>
  %76 = extractelement <2 x double> %75, i32 0
  %77 = extractelement <2 x double> %75, i32 1
  %78 = fadd double %76, %77
  %79 = add nuw nsw i64 %indvars.iv68, 1
  %80 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv74, i64 %indvars.iv71, i64 %79
  %81 = load double, double* %80, align 8
  %82 = fsub double %81, %57
  %83 = add nsw i64 %indvars.iv68, -1
  %84 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv74, i64 %indvars.iv71, i64 %83
  %85 = load double, double* %84, align 8
  %86 = fadd double %82, %85
  %87 = fmul double %86, 1.250000e-01
  %88 = fadd double %78, %87
  %89 = fadd double %56, %88
  %90 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv74, i64 %indvars.iv71, i64 %indvars.iv68
  store double %89, double* %90, align 8
  %exitcond3 = icmp eq i64 %79, 119
  br i1 %exitcond3, label %._crit_edge26.us, label %52

._crit_edge26.us:                                 ; preds = %52
  %exitcond4 = icmp eq i64 %50, 119
  br i1 %exitcond4, label %._crit_edge29, label %.preheader.us

._crit_edge29:                                    ; preds = %._crit_edge26.us
  %exitcond5 = icmp eq i64 %48, 119
  br i1 %exitcond5, label %._crit_edge34, label %.preheader8

._crit_edge34:                                    ; preds = %._crit_edge29
  %91 = add nuw nsw i32 %4, 1
  %exitcond6 = icmp eq i32 %91, 501
  br i1 %exitcond6, label %92, label %.preheader11

; <label>:92:                                     ; preds = %._crit_edge34
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [120 x [120 x double]]*) unnamed_addr #0 {
.preheader3.lr.ph:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %._crit_edge6.us, %.preheader3.lr.ph
  %indvars.iv39 = phi i64 [ 0, %.preheader3.lr.ph ], [ %indvars.iv.next40, %._crit_edge6.us ]
  %6 = mul nuw nsw i64 %indvars.iv39, 120
  br label %.preheader.us.us

._crit_edge6.us:                                  ; preds = %._crit_edge5.us.us
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond = icmp eq i64 %indvars.iv.next40, 120
  br i1 %exitcond, label %._crit_edge11, label %.preheader3.us

.preheader.us.us:                                 ; preds = %.preheader3.us, %._crit_edge5.us.us
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %._crit_edge5.us.us ], [ 0, %.preheader3.us ]
  %7 = add nuw nsw i64 %6, %indvars.iv35
  %8 = mul nuw nsw i64 %7, 120
  br label %9

._crit_edge5.us.us:                               ; preds = %._crit_edge.us.us
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next36, 120
  br i1 %exitcond38, label %._crit_edge6.us, label %.preheader.us.us

; <label>:9:                                      ; preds = %._crit_edge.us.us, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us.us ], [ 0, %.preheader.us.us ]
  %10 = add nuw nsw i64 %8, %indvars.iv
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge.us.us

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %14, %9
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv39, i64 %indvars.iv35, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond34, label %._crit_edge5.us.us, label %9

._crit_edge11:                                    ; preds = %._crit_edge6.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
