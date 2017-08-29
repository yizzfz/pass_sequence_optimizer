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
  tail call fastcc void @kernel_heat_3d(i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %7 = icmp sgt i32 %0, 42
  br i1 %7, label %8, label %13

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %8
  %12 = bitcast i8* %3 to [120 x [120 x double]]*
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %12)
  br label %13

; <label>:13:                                     ; preds = %8, %11, %2
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
.preheader3.lr.ph:
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %.preheader3.lr.ph, %._crit_edge4.us
  %3 = phi i32 [ %5, %._crit_edge4.us ], [ 0, %.preheader3.lr.ph ]
  %4 = sext i32 %3 to i64
  br label %.preheader.us.us

._crit_edge4.us:                                  ; preds = %._crit_edge.us.us
  %5 = add nsw i32 %3, 1
  %6 = icmp slt i32 %5, 120
  br i1 %6, label %.preheader3.us, label %._crit_edge5

.preheader.us.us:                                 ; preds = %.preheader3.us, %._crit_edge.us.us
  %7 = phi i32 [ %11, %._crit_edge.us.us ], [ 0, %.preheader3.us ]
  %8 = add i32 %7, %3
  %9 = add i32 %8, 120
  %10 = sext i32 %7 to i64
  br label %.preheader.us.us.new

._crit_edge.us.us:                                ; preds = %.preheader.us.us.new
  %11 = add nsw i32 %7, 1
  %12 = icmp slt i32 %11, 120
  br i1 %12, label %.preheader.us.us, label %._crit_edge4.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us, %.preheader.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.us.new ], [ 0, %.preheader.us.us ]
  %13 = trunc i64 %indvars.iv to i32
  %14 = sub i32 %9, %13
  %15 = sitofp i32 %14 to double
  %16 = fmul double %15, 1.000000e+01
  %17 = fdiv double %16, 1.200000e+02
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %4, i64 %10, i64 %indvars.iv
  store double %17, double* %18, align 8
  %19 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %4, i64 %10, i64 %indvars.iv
  store double %17, double* %19, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %20 = trunc i64 %indvars.iv.next to i32
  %21 = sub i32 %9, %20
  %22 = sitofp i32 %21 to double
  %23 = fmul double %22, 1.000000e+01
  %24 = fdiv double %23, 1.200000e+02
  %25 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %4, i64 %10, i64 %indvars.iv.next
  store double %24, double* %25, align 8
  %26 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %4, i64 %10, i64 %indvars.iv.next
  store double %24, double* %26, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %._crit_edge.us.us, label %.preheader.us.us.new

._crit_edge5:                                     ; preds = %._crit_edge4.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  br label %.preheader11

.preheader11:                                     ; preds = %3, %._crit_edge16
  %4 = phi i32 [ 1, %3 ], [ %98, %._crit_edge16 ]
  br label %.preheader9

.preheader9:                                      ; preds = %.preheader11, %._crit_edge12
  %indvars.iv59 = phi i64 [ %5, %._crit_edge12 ], [ 1, %.preheader11 ]
  %5 = add nuw nsw i64 %indvars.iv59, 1
  %6 = add nsw i64 %indvars.iv59, -1
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
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv59, i64 %8, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %6, i64 %8, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv59, i64 %10, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = insertelement <2 x double> undef, double %17, i32 0
  %23 = shufflevector <2 x double> %22, <2 x double> undef, <2 x i32> zeroinitializer
  %24 = fmul <2 x double> %23, <double 2.000000e+00, double 2.000000e+00>
  %25 = insertelement <2 x double> undef, double %15, i32 0
  %26 = insertelement <2 x double> %25, double %21, i32 1
  %27 = fsub <2 x double> %26, %24
  %28 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv59, i64 %12, i64 %indvars.iv
  %29 = load double, double* %28, align 8
  %30 = insertelement <2 x double> undef, double %19, i32 0
  %31 = insertelement <2 x double> %30, double %29, i32 1
  %32 = fadd <2 x double> %27, %31
  %33 = fmul <2 x double> %32, <double 1.250000e-01, double 1.250000e-01>
  %34 = extractelement <2 x double> %33, i32 0
  %35 = extractelement <2 x double> %33, i32 1
  %36 = fadd double %34, %35
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %37 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv59, i64 %8, i64 %indvars.iv.next
  %38 = load double, double* %37, align 8
  %39 = fmul double %17, 2.000000e+00
  %40 = fsub double %38, %39
  %41 = add nsw i64 %indvars.iv, -1
  %42 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv59, i64 %8, i64 %41
  %43 = load double, double* %42, align 8
  %44 = fadd double %40, %43
  %45 = fmul double %44, 1.250000e-01
  %46 = fadd double %36, %45
  %47 = fadd double %46, %17
  %48 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv59, i64 %8, i64 %indvars.iv
  store double %47, double* %48, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %._crit_edge.us, label %13

._crit_edge.us:                                   ; preds = %13
  %49 = icmp slt i32 %9, 119
  br i1 %49, label %.preheader7.us, label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge.us
  %50 = icmp slt i64 %5, 119
  br i1 %50, label %.preheader9, label %.preheader8.preheader

.preheader8.preheader:                            ; preds = %._crit_edge12
  br label %.preheader8

.preheader8:                                      ; preds = %.preheader8.preheader, %._crit_edge15
  %indvars.iv66 = phi i64 [ %51, %._crit_edge15 ], [ 1, %.preheader8.preheader ]
  %51 = add nuw nsw i64 %indvars.iv66, 1
  %52 = add nsw i64 %indvars.iv66, -1
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader8, %._crit_edge14.us
  %53 = phi i32 [ %55, %._crit_edge14.us ], [ 1, %.preheader8 ]
  %54 = sext i32 %53 to i64
  %55 = add nsw i32 %53, 1
  %56 = sext i32 %55 to i64
  %57 = add nsw i32 %53, -1
  %58 = sext i32 %57 to i64
  br label %59

; <label>:59:                                     ; preds = %59, %.preheader.us
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %59 ], [ 1, %.preheader.us ]
  %60 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %51, i64 %54, i64 %indvars.iv62
  %61 = load double, double* %60, align 8
  %62 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv66, i64 %54, i64 %indvars.iv62
  %63 = load double, double* %62, align 8
  %64 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %52, i64 %54, i64 %indvars.iv62
  %65 = load double, double* %64, align 8
  %66 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv66, i64 %56, i64 %indvars.iv62
  %67 = load double, double* %66, align 8
  %68 = insertelement <2 x double> undef, double %63, i32 0
  %69 = shufflevector <2 x double> %68, <2 x double> undef, <2 x i32> zeroinitializer
  %70 = fmul <2 x double> %69, <double 2.000000e+00, double 2.000000e+00>
  %71 = insertelement <2 x double> undef, double %61, i32 0
  %72 = insertelement <2 x double> %71, double %67, i32 1
  %73 = fsub <2 x double> %72, %70
  %74 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv66, i64 %58, i64 %indvars.iv62
  %75 = load double, double* %74, align 8
  %76 = insertelement <2 x double> undef, double %65, i32 0
  %77 = insertelement <2 x double> %76, double %75, i32 1
  %78 = fadd <2 x double> %73, %77
  %79 = fmul <2 x double> %78, <double 1.250000e-01, double 1.250000e-01>
  %80 = extractelement <2 x double> %79, i32 0
  %81 = extractelement <2 x double> %79, i32 1
  %82 = fadd double %80, %81
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %83 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv66, i64 %54, i64 %indvars.iv.next63
  %84 = load double, double* %83, align 8
  %85 = fmul double %63, 2.000000e+00
  %86 = fsub double %84, %85
  %87 = add nsw i64 %indvars.iv62, -1
  %88 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv66, i64 %54, i64 %87
  %89 = load double, double* %88, align 8
  %90 = fadd double %86, %89
  %91 = fmul double %90, 1.250000e-01
  %92 = fadd double %82, %91
  %93 = fadd double %92, %63
  %94 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv66, i64 %54, i64 %indvars.iv62
  store double %93, double* %94, align 8
  %95 = icmp slt i64 %indvars.iv.next63, 119
  br i1 %95, label %59, label %._crit_edge14.us

._crit_edge14.us:                                 ; preds = %59
  %96 = icmp slt i32 %55, 119
  br i1 %96, label %.preheader.us, label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge14.us
  %97 = icmp slt i64 %51, 119
  br i1 %97, label %.preheader8, label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge15
  %98 = add nsw i32 %4, 1
  %99 = icmp slt i32 %98, 501
  br i1 %99, label %.preheader11, label %100

; <label>:100:                                    ; preds = %._crit_edge16
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
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %.preheader3.us.preheader, %._crit_edge4.us
  %6 = phi i32 [ %9, %._crit_edge4.us ], [ 0, %.preheader3.us.preheader ]
  %7 = mul nsw i32 %6, 120
  %8 = sext i32 %6 to i64
  br label %.preheader.us.us

._crit_edge4.us:                                  ; preds = %._crit_edge.us.us
  %9 = add nsw i32 %6, 1
  %10 = icmp slt i32 %9, 120
  br i1 %10, label %.preheader3.us, label %._crit_edge5

.preheader.us.us:                                 ; preds = %.preheader3.us, %._crit_edge.us.us
  %11 = phi i32 [ %16, %._crit_edge.us.us ], [ 0, %.preheader3.us ]
  %12 = add i32 %7, %11
  %13 = mul i32 %12, 120
  %14 = sext i32 %11 to i64
  %15 = zext i32 %13 to i64
  br label %18

._crit_edge.us.us:                                ; preds = %25
  %16 = add nsw i32 %11, 1
  %17 = icmp slt i32 %16, 120
  br i1 %17, label %.preheader.us.us, label %._crit_edge4.us

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
  %27 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %8, i64 %14, i64 %indvars.iv
  %28 = load double, double* %27, align 8
  %29 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %28) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %._crit_edge.us.us, label %18

._crit_edge5:                                     ; preds = %._crit_edge4.us
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %31 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %30, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %32) #5
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
