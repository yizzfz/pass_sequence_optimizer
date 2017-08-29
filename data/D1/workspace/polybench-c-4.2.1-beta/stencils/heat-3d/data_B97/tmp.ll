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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %5 = bitcast i8* %3 to [120 x [120 x double]]*
  %6 = bitcast i8* %4 to [120 x [120 x double]]*
  tail call fastcc void @init_array([120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_heat_3d([120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %7 = icmp sgt i32 %0, 42
  br i1 %7, label %8, label %._crit_edge

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %8
  tail call fastcc void @print_array([120 x [120 x double]]* %5)
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %2, %11
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  br label %.preheader23

.preheader23:                                     ; preds = %2, %26
  %.02226 = phi i32 [ 0, %2 ], [ %27, %26 ]
  %3 = add nuw i32 %.02226, 120
  %4 = sext i32 %.02226 to i64
  br label %.preheader

.preheader:                                       ; preds = %.preheader23, %23
  %.02125 = phi i32 [ 0, %.preheader23 ], [ %24, %23 ]
  %5 = add nuw i32 %3, %.02125
  %6 = sext i32 %.02125 to i64
  %7 = sext i32 %5 to i64
  br label %8

; <label>:8:                                      ; preds = %8, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %8 ]
  %9 = sub nuw nsw i64 %7, %indvars.iv
  %10 = trunc i64 %9 to i32
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %4, i64 %6, i64 %indvars.iv
  %13 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %4, i64 %6, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %14 = sub nuw nsw i64 %7, %indvars.iv.next
  %15 = trunc i64 %14 to i32
  %16 = sitofp i32 %15 to double
  %17 = insertelement <2 x double> undef, double %11, i32 0
  %18 = insertelement <2 x double> %17, double %16, i32 1
  %19 = fmul <2 x double> %18, <double 1.000000e+01, double 1.000000e+01>
  %20 = fdiv <2 x double> %19, <double 1.200000e+02, double 1.200000e+02>
  %21 = bitcast double* %12 to <2 x double>*
  %22 = bitcast double* %13 to <2 x double>*
  store <2 x double> %20, <2 x double>* %21, align 8
  store <2 x double> %20, <2 x double>* %22, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %23, label %8

; <label>:23:                                     ; preds = %8
  %24 = add nsw i32 %.02125, 1
  %25 = icmp slt i32 %24, 120
  br i1 %25, label %.preheader, label %26

; <label>:26:                                     ; preds = %23
  %27 = add nsw i32 %.02226, 1
  %28 = icmp slt i32 %27, 120
  br i1 %28, label %.preheader23, label %29

; <label>:29:                                     ; preds = %26
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d([120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  br label %.preheader116

.preheader116:                                    ; preds = %101, %2
  %.0111123 = phi i32 [ 1, %2 ], [ %102, %101 ]
  br label %.preheader114

.preheader114:                                    ; preds = %.preheader116, %50
  %.0109119 = phi i32 [ 1, %.preheader116 ], [ %3, %50 ]
  %3 = add nsw i32 %.0109119, 1
  %4 = sext i32 %3 to i64
  %5 = sext i32 %.0109119 to i64
  %6 = add nsw i32 %.0109119, -1
  %7 = sext i32 %6 to i64
  br label %.preheader112

.preheader112:                                    ; preds = %.preheader114, %48
  %.0107118 = phi i32 [ 1, %.preheader114 ], [ %9, %48 ]
  %8 = sext i32 %.0107118 to i64
  %9 = add nsw i32 %.0107118, 1
  %10 = sext i32 %9 to i64
  %11 = add nsw i32 %.0107118, -1
  %12 = sext i32 %11 to i64
  br label %13

; <label>:13:                                     ; preds = %13, %.preheader112
  %indvars.iv = phi i64 [ 1, %.preheader112 ], [ %indvars.iv.next, %13 ]
  %14 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %4, i64 %8, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %5, i64 %8, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = fmul double %17, 2.000000e+00
  %19 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %7, i64 %8, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %5, i64 %10, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = insertelement <2 x double> undef, double %18, i32 0
  %24 = shufflevector <2 x double> %23, <2 x double> undef, <2 x i32> zeroinitializer
  %25 = insertelement <2 x double> undef, double %15, i32 0
  %26 = insertelement <2 x double> %25, double %22, i32 1
  %27 = fsub <2 x double> %26, %24
  %28 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %5, i64 %12, i64 %indvars.iv
  %29 = load double, double* %28, align 8
  %30 = insertelement <2 x double> undef, double %20, i32 0
  %31 = insertelement <2 x double> %30, double %29, i32 1
  %32 = fadd <2 x double> %31, %27
  %33 = fmul <2 x double> %32, <double 1.250000e-01, double 1.250000e-01>
  %34 = extractelement <2 x double> %33, i32 0
  %35 = extractelement <2 x double> %33, i32 1
  %36 = fadd double %34, %35
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %37 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %5, i64 %8, i64 %indvars.iv.next
  %38 = load double, double* %37, align 8
  %39 = fsub double %38, %18
  %40 = add nsw i64 %indvars.iv, -1
  %41 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %5, i64 %8, i64 %40
  %42 = load double, double* %41, align 8
  %43 = fadd double %42, %39
  %44 = fmul double %43, 1.250000e-01
  %45 = fadd double %36, %44
  %46 = fadd double %17, %45
  %47 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %5, i64 %8, i64 %indvars.iv
  store double %46, double* %47, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %48, label %13

; <label>:48:                                     ; preds = %13
  %49 = icmp slt i32 %9, 119
  br i1 %49, label %.preheader112, label %50

; <label>:50:                                     ; preds = %48
  %51 = icmp slt i32 %3, 119
  br i1 %51, label %.preheader114, label %.preheader113.preheader

.preheader113.preheader:                          ; preds = %50
  br label %.preheader113

.preheader113:                                    ; preds = %.preheader113.preheader, %99
  %.1110122 = phi i32 [ %52, %99 ], [ 1, %.preheader113.preheader ]
  %52 = add nsw i32 %.1110122, 1
  %53 = sext i32 %52 to i64
  %54 = sext i32 %.1110122 to i64
  %55 = add nsw i32 %.1110122, -1
  %56 = sext i32 %55 to i64
  br label %.preheader

.preheader:                                       ; preds = %.preheader113, %97
  %.1108121 = phi i32 [ 1, %.preheader113 ], [ %58, %97 ]
  %57 = sext i32 %.1108121 to i64
  %58 = add nsw i32 %.1108121, 1
  %59 = sext i32 %58 to i64
  %60 = add nsw i32 %.1108121, -1
  %61 = sext i32 %60 to i64
  br label %62

; <label>:62:                                     ; preds = %62, %.preheader
  %indvars.iv124 = phi i64 [ 1, %.preheader ], [ %indvars.iv.next125, %62 ]
  %63 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %53, i64 %57, i64 %indvars.iv124
  %64 = load double, double* %63, align 8
  %65 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %54, i64 %57, i64 %indvars.iv124
  %66 = load double, double* %65, align 8
  %67 = fmul double %66, 2.000000e+00
  %68 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %56, i64 %57, i64 %indvars.iv124
  %69 = load double, double* %68, align 8
  %70 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %54, i64 %59, i64 %indvars.iv124
  %71 = load double, double* %70, align 8
  %72 = insertelement <2 x double> undef, double %67, i32 0
  %73 = shufflevector <2 x double> %72, <2 x double> undef, <2 x i32> zeroinitializer
  %74 = insertelement <2 x double> undef, double %64, i32 0
  %75 = insertelement <2 x double> %74, double %71, i32 1
  %76 = fsub <2 x double> %75, %73
  %77 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %54, i64 %61, i64 %indvars.iv124
  %78 = load double, double* %77, align 8
  %79 = insertelement <2 x double> undef, double %69, i32 0
  %80 = insertelement <2 x double> %79, double %78, i32 1
  %81 = fadd <2 x double> %80, %76
  %82 = fmul <2 x double> %81, <double 1.250000e-01, double 1.250000e-01>
  %83 = extractelement <2 x double> %82, i32 0
  %84 = extractelement <2 x double> %82, i32 1
  %85 = fadd double %83, %84
  %indvars.iv.next125 = add nuw nsw i64 %indvars.iv124, 1
  %86 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %54, i64 %57, i64 %indvars.iv.next125
  %87 = load double, double* %86, align 8
  %88 = fsub double %87, %67
  %89 = add nsw i64 %indvars.iv124, -1
  %90 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %54, i64 %57, i64 %89
  %91 = load double, double* %90, align 8
  %92 = fadd double %91, %88
  %93 = fmul double %92, 1.250000e-01
  %94 = fadd double %85, %93
  %95 = fadd double %66, %94
  %96 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %54, i64 %57, i64 %indvars.iv124
  store double %95, double* %96, align 8
  %exitcond126 = icmp eq i64 %indvars.iv.next125, 119
  br i1 %exitcond126, label %97, label %62

; <label>:97:                                     ; preds = %62
  %98 = icmp slt i32 %58, 119
  br i1 %98, label %.preheader, label %99

; <label>:99:                                     ; preds = %97
  %100 = icmp slt i32 %52, 119
  br i1 %100, label %.preheader113, label %101

; <label>:101:                                    ; preds = %99
  %102 = add nuw nsw i32 %.0111123, 1
  %exitcond127 = icmp eq i32 %102, 501
  br i1 %exitcond127, label %103, label %.preheader116

; <label>:103:                                    ; preds = %101
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([120 x [120 x double]]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader20

.preheader20:                                     ; preds = %1, %27
  %.01923 = phi i32 [ 0, %1 ], [ %28, %27 ]
  %6 = mul nuw nsw i32 %.01923, 120
  %7 = sext i32 %.01923 to i64
  br label %.preheader

.preheader:                                       ; preds = %.preheader20, %24
  %.01822 = phi i32 [ 0, %.preheader20 ], [ %25, %24 ]
  %8 = add nuw i32 %.01822, %6
  %9 = mul nuw nsw i32 %8, 120
  %10 = sext i32 %.01822 to i64
  %11 = zext i32 %9 to i64
  br label %12

; <label>:12:                                     ; preds = %19, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %19 ]
  %13 = add i64 %indvars.iv, %11
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #5
  br label %19

; <label>:19:                                     ; preds = %17, %12
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %7, i64 %10, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %22) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %24, label %12

; <label>:24:                                     ; preds = %19
  %25 = add nsw i32 %.01822, 1
  %26 = icmp slt i32 %25, 120
  br i1 %26, label %.preheader, label %27

; <label>:27:                                     ; preds = %24
  %28 = add nsw i32 %.01923, 1
  %29 = icmp slt i32 %28, 120
  br i1 %29, label %.preheader20, label %30

; <label>:30:                                     ; preds = %27
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %33) #5
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
