; ModuleID = 'B.ll'
source_filename = "heat-3d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %5 = bitcast i8* %3 to [120 x [120 x double]]*
  %6 = bitcast i8* %4 to [120 x [120 x double]]*
  tail call void @init_array(i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_start() #4
  %7 = bitcast i8* %3 to [120 x [120 x double]]*
  %8 = bitcast i8* %4 to [120 x [120 x double]]*
  tail call void @kernel_heat_3d(i32 120, [120 x [120 x double]]* %7, [120 x [120 x double]]* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %3 to [120 x [120 x double]]*
  tail call void @print_array(i32 120, [120 x [120 x double]]* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %13, %10, %2
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, [120 x [120 x double]]*, [120 x [120 x double]]*) #2 {
.preheader3.lr.ph..preheader3.us_crit_edge:
  br label %.preheader3.us..preheader.us.us_crit_edge

.preheader3.us..preheader.us.us_crit_edge:        ; preds = %.loopexit7.us, %.preheader3.lr.ph..preheader3.us_crit_edge
  %indvars.iv36 = phi i64 [ 0, %.preheader3.lr.ph..preheader3.us_crit_edge ], [ %indvars.iv.next37, %.loopexit7.us ]
  %3 = trunc i64 %indvars.iv36 to i32
  br label %.preheader.us.us

.loopexit7.us:                                    ; preds = %.loopexit.us.us
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next37, 120
  br i1 %exitcond38, label %._crit_edge, label %.preheader3.us..preheader.us.us_crit_edge

.preheader.us.us:                                 ; preds = %.loopexit.us.us, %.preheader3.us..preheader.us.us_crit_edge
  %indvars.iv34 = phi i64 [ 0, %.preheader3.us..preheader.us.us_crit_edge ], [ %indvars.iv.next35, %.loopexit.us.us ]
  %4 = trunc i64 %indvars.iv34 to i32
  br label %5

.loopexit.us.us:                                  ; preds = %5
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond = icmp eq i64 %indvars.iv.next35, 120
  br i1 %exitcond, label %.loopexit7.us, label %.preheader.us.us

; <label>:5:                                      ; preds = %5, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %5 ], [ 0, %.preheader.us.us ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = sub i32 120, %6
  %8 = add i32 %7, %3
  %9 = add i32 %8, %4
  %10 = sitofp i32 %9 to double
  %11 = fmul double %10, 1.000000e+01
  %12 = fdiv double %11, 1.200000e+02
  %13 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv36, i64 %indvars.iv34, i64 %indvars.iv
  store double %12, double* %13, align 8
  %14 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv36, i64 %indvars.iv34, i64 %indvars.iv
  store double %12, double* %14, align 8
  %exitcond33 = icmp eq i64 %indvars.iv, 119
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond33, label %.loopexit.us.us, label %5

._crit_edge:                                      ; preds = %.loopexit7.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_heat_3d(i32, [120 x [120 x double]]*, [120 x [120 x double]]*) #2 {
  br label %.preheader11

.preheader11:                                     ; preds = %.loopexit22, %3
  %4 = phi i32 [ 1, %3 ], [ %87, %.loopexit22 ]
  br label %.preheader7.lr.ph..preheader7.us_crit_edge

.preheader7.lr.ph..preheader7.us_crit_edge:       ; preds = %.loopexit21, %.preheader11
  %indvars.iv66 = phi i64 [ %5, %.loopexit21 ], [ 1, %.preheader11 ]
  %5 = add nuw nsw i64 %indvars.iv66, 1
  %6 = add nsw i64 %indvars.iv66, -1
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %.loopexit19.us, %.preheader7.lr.ph..preheader7.us_crit_edge
  %indvars.iv64 = phi i64 [ 1, %.preheader7.lr.ph..preheader7.us_crit_edge ], [ %7, %.loopexit19.us ]
  %7 = add nuw nsw i64 %indvars.iv64, 1
  %8 = add nsw i64 %indvars.iv64, -1
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader7.us
  %indvars.iv = phi i64 [ 1, %.preheader7.us ], [ %indvars.iv.next, %._crit_edge ]
  %9 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %5, i64 %indvars.iv64, i64 %indvars.iv
  %10 = load double, double* %9, align 8
  %11 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %indvars.iv64, i64 %indvars.iv
  %12 = load double, double* %11, align 8
  %13 = fmul double %12, 2.000000e+00
  %14 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %6, i64 %indvars.iv64, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %7, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = insertelement <2 x double> undef, double %13, i32 0
  %19 = shufflevector <2 x double> %18, <2 x double> undef, <2 x i32> zeroinitializer
  %20 = insertelement <2 x double> undef, double %10, i32 0
  %21 = insertelement <2 x double> %20, double %17, i32 1
  %22 = fsub <2 x double> %21, %19
  %23 = extractelement <2 x double> %22, i32 0
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %8, i64 %indvars.iv
  %25 = load double, double* %24, align 8
  %26 = insertelement <2 x double> undef, double %23, i32 0
  %27 = insertelement <2 x double> %26, double %25, i32 1
  %28 = insertelement <2 x double> undef, double %15, i32 0
  %29 = shufflevector <2 x double> %28, <2 x double> %22, <2 x i32> <i32 0, i32 3>
  %30 = fadd <2 x double> %29, %27
  %31 = fmul <2 x double> %30, <double 1.250000e-01, double 1.250000e-01>
  %32 = extractelement <2 x double> %31, i32 0
  %33 = extractelement <2 x double> %31, i32 1
  %34 = fadd double %32, %33
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %35 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %indvars.iv64, i64 %indvars.iv.next
  %36 = load double, double* %35, align 8
  %37 = fsub double %36, %13
  %38 = add nsw i64 %indvars.iv, -1
  %39 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %indvars.iv64, i64 %38
  %40 = load double, double* %39, align 8
  %41 = fadd double %37, %40
  %42 = fmul double %41, 1.250000e-01
  %43 = fadd double %34, %42
  %44 = fadd double %12, %43
  %45 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv66, i64 %indvars.iv64, i64 %indvars.iv
  store double %44, double* %45, align 8
  %exitcond = icmp eq i64 %indvars.iv, 118
  br i1 %exitcond, label %.loopexit19.us, label %._crit_edge

.loopexit19.us:                                   ; preds = %._crit_edge
  %exitcond80 = icmp eq i64 %7, 119
  br i1 %exitcond80, label %.loopexit21, label %.preheader7.us

.loopexit21:                                      ; preds = %.loopexit19.us
  %exitcond81 = icmp eq i64 %5, 119
  br i1 %exitcond81, label %.preheader.lr.ph..preheader.us_crit_edge.preheader, label %.preheader7.lr.ph..preheader7.us_crit_edge

.preheader.lr.ph..preheader.us_crit_edge.preheader: ; preds = %.loopexit21
  br label %.preheader.lr.ph..preheader.us_crit_edge

.preheader.lr.ph..preheader.us_crit_edge:         ; preds = %.loopexit20, %.preheader.lr.ph..preheader.us_crit_edge.preheader
  %indvars.iv74 = phi i64 [ %46, %.loopexit20 ], [ 1, %.preheader.lr.ph..preheader.us_crit_edge.preheader ]
  %46 = add nuw nsw i64 %indvars.iv74, 1
  %47 = add nsw i64 %indvars.iv74, -1
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us, %.preheader.lr.ph..preheader.us_crit_edge
  %indvars.iv72 = phi i64 [ 1, %.preheader.lr.ph..preheader.us_crit_edge ], [ %48, %.loopexit.us ]
  %48 = add nuw nsw i64 %indvars.iv72, 1
  %49 = add nsw i64 %indvars.iv72, -1
  br label %._crit_edge57

._crit_edge57:                                    ; preds = %._crit_edge57, %.preheader.us
  %indvars.iv69 = phi i64 [ 1, %.preheader.us ], [ %indvars.iv.next70, %._crit_edge57 ]
  %50 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %46, i64 %indvars.iv72, i64 %indvars.iv69
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv74, i64 %indvars.iv72, i64 %indvars.iv69
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, 2.000000e+00
  %55 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %47, i64 %indvars.iv72, i64 %indvars.iv69
  %56 = load double, double* %55, align 8
  %57 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv74, i64 %48, i64 %indvars.iv69
  %58 = load double, double* %57, align 8
  %59 = insertelement <2 x double> undef, double %54, i32 0
  %60 = shufflevector <2 x double> %59, <2 x double> undef, <2 x i32> zeroinitializer
  %61 = insertelement <2 x double> undef, double %51, i32 0
  %62 = insertelement <2 x double> %61, double %58, i32 1
  %63 = fsub <2 x double> %62, %60
  %64 = extractelement <2 x double> %63, i32 0
  %65 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv74, i64 %49, i64 %indvars.iv69
  %66 = load double, double* %65, align 8
  %67 = insertelement <2 x double> undef, double %64, i32 0
  %68 = insertelement <2 x double> %67, double %66, i32 1
  %69 = insertelement <2 x double> undef, double %56, i32 0
  %70 = shufflevector <2 x double> %69, <2 x double> %63, <2 x i32> <i32 0, i32 3>
  %71 = fadd <2 x double> %70, %68
  %72 = fmul <2 x double> %71, <double 1.250000e-01, double 1.250000e-01>
  %73 = extractelement <2 x double> %72, i32 0
  %74 = extractelement <2 x double> %72, i32 1
  %75 = fadd double %73, %74
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %76 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv74, i64 %indvars.iv72, i64 %indvars.iv.next70
  %77 = load double, double* %76, align 8
  %78 = fsub double %77, %54
  %79 = add nsw i64 %indvars.iv69, -1
  %80 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv74, i64 %indvars.iv72, i64 %79
  %81 = load double, double* %80, align 8
  %82 = fadd double %78, %81
  %83 = fmul double %82, 1.250000e-01
  %84 = fadd double %75, %83
  %85 = fadd double %53, %84
  %86 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv74, i64 %indvars.iv72, i64 %indvars.iv69
  store double %85, double* %86, align 8
  %exitcond82 = icmp eq i64 %indvars.iv.next70, 119
  br i1 %exitcond82, label %.loopexit.us, label %._crit_edge57

.loopexit.us:                                     ; preds = %._crit_edge57
  %exitcond83 = icmp eq i64 %48, 119
  br i1 %exitcond83, label %.loopexit20, label %.preheader.us

.loopexit20:                                      ; preds = %.loopexit.us
  %exitcond84 = icmp eq i64 %46, 119
  br i1 %exitcond84, label %.loopexit22, label %.preheader.lr.ph..preheader.us_crit_edge

.loopexit22:                                      ; preds = %.loopexit20
  %87 = add nuw nsw i32 %4, 1
  %exitcond85 = icmp eq i32 %87, 501
  br i1 %exitcond85, label %88, label %.preheader11

; <label>:88:                                     ; preds = %.loopexit22
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [120 x [120 x double]]*) #0 {
.preheader3.lr.ph..preheader3.us_crit_edge:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader3.us..preheader.us.us_crit_edge

.preheader3.us..preheader.us.us_crit_edge:        ; preds = %.loopexit7.us, %.preheader3.lr.ph..preheader3.us_crit_edge
  %indvars.iv36 = phi i64 [ 0, %.preheader3.lr.ph..preheader3.us_crit_edge ], [ %indvars.iv.next37, %.loopexit7.us ]
  %6 = mul nuw nsw i64 %indvars.iv36, 120
  br label %.preheader.us.us

.loopexit7.us:                                    ; preds = %.loopexit.us.us
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next37, 120
  br i1 %exitcond39, label %._crit_edge, label %.preheader3.us..preheader.us.us_crit_edge

.preheader.us.us:                                 ; preds = %.loopexit.us.us, %.preheader3.us..preheader.us.us_crit_edge
  %indvars.iv34 = phi i64 [ 0, %.preheader3.us..preheader.us.us_crit_edge ], [ %indvars.iv.next35, %.loopexit.us.us ]
  %7 = add i64 %6, %indvars.iv34
  %8 = mul i64 %7, 120
  br label %._crit_edge31

.loopexit.us.us:                                  ; preds = %._crit_edge30
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next35, 120
  br i1 %exitcond38, label %.loopexit7.us, label %.preheader.us.us

._crit_edge31:                                    ; preds = %._crit_edge30, %.preheader.us.us
  %indvars.iv = phi i64 [ 0, %.preheader.us.us ], [ %indvars.iv.next, %._crit_edge30 ]
  %9 = add i64 %8, %indvars.iv
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge30

; <label>:13:                                     ; preds = %._crit_edge31
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %13, %._crit_edge31
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv36, i64 %indvars.iv34, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %.loopexit.us.us, label %._crit_edge31

._crit_edge:                                      ; preds = %.loopexit7.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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
