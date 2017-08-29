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
  %3 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %5 = bitcast i8* %3 to [120 x [120 x double]]*
  %6 = bitcast i8* %4 to [120 x [120 x double]]*
  tail call fastcc void @init_array(i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_start() #4
  %7 = bitcast i8* %3 to [120 x [120 x double]]*
  %8 = bitcast i8* %4 to [120 x [120 x double]]*
  tail call fastcc void @kernel_heat_3d(i32 120, [120 x [120 x double]]* %7, [120 x [120 x double]]* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %15

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %3 to [120 x [120 x double]]*
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %14)
  br label %15

; <label>:15:                                     ; preds = %10, %13, %2
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
.preheader3.us.preheader:
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %.preheader3.us.preheader, %._crit_edge5.us
  %3 = phi i32 [ %5, %._crit_edge5.us ], [ 0, %.preheader3.us.preheader ]
  %4 = sext i32 %3 to i64
  br label %.preheader.us.us

._crit_edge5.us:                                  ; preds = %._crit_edge.us.us
  %5 = add nsw i32 %3, 1
  %6 = icmp slt i32 %5, 120
  br i1 %6, label %.preheader3.us, label %._crit_edge6

.preheader.us.us:                                 ; preds = %.preheader3.us, %._crit_edge.us.us
  %7 = phi i32 [ %9, %._crit_edge.us.us ], [ 0, %.preheader3.us ]
  %8 = sext i32 %7 to i64
  br label %11

._crit_edge.us.us:                                ; preds = %11
  %9 = add nsw i32 %7, 1
  %10 = icmp slt i32 %9, 120
  br i1 %10, label %.preheader.us.us, label %._crit_edge5.us

; <label>:11:                                     ; preds = %11, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %11 ], [ 0, %.preheader.us.us ]
  %12 = trunc i64 %indvars.iv to i32
  %13 = sub i32 120, %12
  %14 = add i32 %13, %3
  %15 = add i32 %14, %7
  %16 = sitofp i32 %15 to double
  %17 = fmul double %16, 1.000000e+01
  %18 = fdiv double %17, 1.200000e+02
  %19 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %4, i64 %8, i64 %indvars.iv
  store double %18, double* %19, align 8
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %4, i64 %8, i64 %indvars.iv
  store double %18, double* %20, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %._crit_edge.us.us, label %11

._crit_edge6:                                     ; preds = %._crit_edge5.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  br label %.preheader11

.preheader11:                                     ; preds = %3, %._crit_edge18
  %4 = phi i32 [ 1, %3 ], [ %102, %._crit_edge18 ]
  br label %.preheader9

.preheader9:                                      ; preds = %.preheader11, %._crit_edge13
  %indvars.iv61 = phi i64 [ %5, %._crit_edge13 ], [ 1, %.preheader11 ]
  %5 = add nuw nsw i64 %indvars.iv61, 1
  %6 = add nsw i64 %indvars.iv61, -1
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %.preheader9, %._crit_edge.us
  %7 = phi i32 [ %9, %._crit_edge.us ], [ 1, %.preheader9 ]
  %8 = sext i32 %7 to i64
  %9 = add nsw i32 %7, 1
  %10 = sext i32 %9 to i64
  %11 = add nsw i32 %7, -1
  %12 = sext i32 %11 to i64
  br label %13

; <label>:13:                                     ; preds = %13, %.preheader7.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %13 ], [ 1, %.preheader7.us ]
  %14 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %5, i64 %8, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %8, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, 2.000000e+00
  %19 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %6, i64 %8, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %10, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = insertelement <2 x double> undef, double %18, i32 0
  %24 = shufflevector <2 x double> %23, <2 x double> undef, <2 x i32> zeroinitializer
  %25 = insertelement <2 x double> undef, double %15, i32 0
  %26 = insertelement <2 x double> %25, double %22, i32 1
  %27 = fsub <2 x double> %26, %24
  %28 = extractelement <2 x double> %27, i32 0
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %12, i64 %indvars.iv
  %30 = load double, double* %29, align 8
  %31 = insertelement <2 x double> undef, double %28, i32 0
  %32 = insertelement <2 x double> %31, double %30, i32 1
  %33 = insertelement <2 x double> undef, double %20, i32 0
  %34 = shufflevector <2 x double> %33, <2 x double> %27, <2 x i32> <i32 0, i32 3>
  %35 = fadd <2 x double> %34, %32
  %36 = fmul <2 x double> %35, <double 1.250000e-01, double 1.250000e-01>
  %37 = extractelement <2 x double> %36, i32 0
  %38 = extractelement <2 x double> %36, i32 1
  %39 = fadd double %37, %38
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %40 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %8, i64 %indvars.iv.next
  %41 = load double, double* %40, align 8
  %42 = fsub double %41, %18
  %43 = add nsw i64 %indvars.iv, -1
  %44 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv61, i64 %8, i64 %43
  %45 = load double, double* %44, align 8
  %46 = fadd double %42, %45
  %47 = fmul double %46, 1.250000e-01
  %48 = fadd double %39, %47
  %49 = fadd double %17, %48
  %50 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv61, i64 %8, i64 %indvars.iv
  store double %49, double* %50, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %._crit_edge.us, label %13

._crit_edge.us:                                   ; preds = %13
  %51 = icmp slt i32 %9, 119
  br i1 %51, label %.preheader7.us, label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge.us
  %52 = icmp slt i64 %5, 119
  br i1 %52, label %.preheader9, label %.preheader8.preheader

.preheader8.preheader:                            ; preds = %._crit_edge13
  br label %.preheader8

.preheader8:                                      ; preds = %.preheader8.preheader, %._crit_edge17
  %indvars.iv68 = phi i64 [ %53, %._crit_edge17 ], [ 1, %.preheader8.preheader ]
  %53 = add nuw nsw i64 %indvars.iv68, 1
  %54 = add nsw i64 %indvars.iv68, -1
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader8, %._crit_edge16.us
  %55 = phi i32 [ %57, %._crit_edge16.us ], [ 1, %.preheader8 ]
  %56 = sext i32 %55 to i64
  %57 = add nsw i32 %55, 1
  %58 = sext i32 %57 to i64
  %59 = add nsw i32 %55, -1
  %60 = sext i32 %59 to i64
  br label %61

; <label>:61:                                     ; preds = %61, %.preheader.us
  %indvars.iv64 = phi i64 [ %indvars.iv.next65, %61 ], [ 1, %.preheader.us ]
  %62 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %53, i64 %56, i64 %indvars.iv64
  %63 = load double, double* %62, align 8
  %64 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv68, i64 %56, i64 %indvars.iv64
  %65 = load double, double* %64, align 8
  %66 = fmul double %65, 2.000000e+00
  %67 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %54, i64 %56, i64 %indvars.iv64
  %68 = load double, double* %67, align 8
  %69 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv68, i64 %58, i64 %indvars.iv64
  %70 = load double, double* %69, align 8
  %71 = insertelement <2 x double> undef, double %66, i32 0
  %72 = shufflevector <2 x double> %71, <2 x double> undef, <2 x i32> zeroinitializer
  %73 = insertelement <2 x double> undef, double %63, i32 0
  %74 = insertelement <2 x double> %73, double %70, i32 1
  %75 = fsub <2 x double> %74, %72
  %76 = extractelement <2 x double> %75, i32 0
  %77 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv68, i64 %60, i64 %indvars.iv64
  %78 = load double, double* %77, align 8
  %79 = insertelement <2 x double> undef, double %76, i32 0
  %80 = insertelement <2 x double> %79, double %78, i32 1
  %81 = insertelement <2 x double> undef, double %68, i32 0
  %82 = shufflevector <2 x double> %81, <2 x double> %75, <2 x i32> <i32 0, i32 3>
  %83 = fadd <2 x double> %82, %80
  %84 = fmul <2 x double> %83, <double 1.250000e-01, double 1.250000e-01>
  %85 = extractelement <2 x double> %84, i32 0
  %86 = extractelement <2 x double> %84, i32 1
  %87 = fadd double %85, %86
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %88 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv68, i64 %56, i64 %indvars.iv.next65
  %89 = load double, double* %88, align 8
  %90 = fsub double %89, %66
  %91 = add nsw i64 %indvars.iv64, -1
  %92 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv68, i64 %56, i64 %91
  %93 = load double, double* %92, align 8
  %94 = fadd double %90, %93
  %95 = fmul double %94, 1.250000e-01
  %96 = fadd double %87, %95
  %97 = fadd double %65, %96
  %98 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv68, i64 %56, i64 %indvars.iv64
  store double %97, double* %98, align 8
  %99 = icmp slt i64 %indvars.iv.next65, 119
  br i1 %99, label %61, label %._crit_edge16.us

._crit_edge16.us:                                 ; preds = %61
  %100 = icmp slt i32 %57, 119
  br i1 %100, label %.preheader.us, label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge16.us
  %101 = icmp slt i64 %53, 119
  br i1 %101, label %.preheader8, label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge17
  %102 = add nsw i32 %4, 1
  %103 = icmp slt i32 %102, 501
  br i1 %103, label %.preheader11, label %104

; <label>:104:                                    ; preds = %._crit_edge18
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [120 x [120 x double]]*) unnamed_addr #0 {
.preheader3.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %.preheader3.us.preheader, %._crit_edge5.us
  %6 = phi i32 [ %9, %._crit_edge5.us ], [ 0, %.preheader3.us.preheader ]
  %7 = sext i32 %6 to i64
  %8 = mul nsw i32 %6, 120
  br label %.preheader.us.us

._crit_edge5.us:                                  ; preds = %._crit_edge.us.us
  %9 = add nsw i32 %6, 1
  %10 = icmp slt i32 %9, 120
  br i1 %10, label %.preheader3.us, label %._crit_edge6

.preheader.us.us:                                 ; preds = %.preheader3.us, %._crit_edge.us.us
  %11 = phi i32 [ %16, %._crit_edge.us.us ], [ 0, %.preheader3.us ]
  %12 = sext i32 %11 to i64
  %13 = add i32 %8, %11
  %14 = mul i32 %13, 120
  %15 = zext i32 %14 to i64
  br label %18

._crit_edge.us.us:                                ; preds = %25
  %16 = add nsw i32 %11, 1
  %17 = icmp slt i32 %16, 120
  br i1 %17, label %.preheader.us.us, label %._crit_edge5.us

; <label>:18:                                     ; preds = %25, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %25 ], [ 0, %.preheader.us.us ]
  %19 = add i64 %15, %indvars.iv
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 20
  %22 = icmp eq i32 %21, 0
  br i1 %22, label %23, label %25

; <label>:23:                                     ; preds = %18
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %24) #5
  br label %25

; <label>:25:                                     ; preds = %23, %18
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %7, i64 %12, i64 %indvars.iv
  %28 = load double, double* %27, align 8
  %29 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %28) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %._crit_edge.us.us, label %18

._crit_edge6:                                     ; preds = %._crit_edge5.us
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %31 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %32) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
