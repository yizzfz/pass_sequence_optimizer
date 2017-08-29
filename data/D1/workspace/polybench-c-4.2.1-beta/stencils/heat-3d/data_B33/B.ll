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
  %7 = bitcast i8* %3 to [120 x [120 x double]]*
  %8 = bitcast i8* %4 to [120 x [120 x double]]*
  tail call fastcc void @kernel_heat_3d([120 x [120 x double]]* %7, [120 x [120 x double]]* %8)
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
  tail call fastcc void @print_array([120 x [120 x double]]* %14)
  br label %._crit_edge

._crit_edge:                                      ; preds = %10, %2, %13
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  br label %.preheader23

.preheader23:                                     ; preds = %21, %2
  %indvars.iv6 = phi i64 [ 0, %2 ], [ %indvars.iv.next7, %21 ]
  %3 = add nuw nsw i64 %indvars.iv6, 120
  br label %.preheader

.preheader:                                       ; preds = %20, %.preheader23
  %indvars.iv4 = phi i64 [ 0, %.preheader23 ], [ %indvars.iv.next5, %20 ]
  %4 = add nuw nsw i64 %3, %indvars.iv4
  br label %5

; <label>:5:                                      ; preds = %5, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %5 ]
  %6 = sub nuw nsw i64 %4, %indvars.iv
  %7 = trunc i64 %6 to i32
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv6, i64 %indvars.iv4, i64 %indvars.iv
  %10 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv6, i64 %indvars.iv4, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %11 = sub nuw nsw i64 %4, %indvars.iv.next
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %8, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fmul <2 x double> %15, <double 1.000000e+01, double 1.000000e+01>
  %17 = fdiv <2 x double> %16, <double 1.200000e+02, double 1.200000e+02>
  %18 = bitcast double* %9 to <2 x double>*
  %19 = bitcast double* %10 to <2 x double>*
  store <2 x double> %17, <2 x double>* %18, align 8
  store <2 x double> %17, <2 x double>* %19, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %20, label %5

; <label>:20:                                     ; preds = %5
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond = icmp eq i64 %indvars.iv.next5, 120
  br i1 %exitcond, label %21, label %.preheader

; <label>:21:                                     ; preds = %20
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next7, 120
  br i1 %exitcond8, label %22, label %.preheader23

; <label>:22:                                     ; preds = %21
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d([120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  br label %.preheader116

.preheader116:                                    ; preds = %91, %2
  %.01117 = phi i32 [ 1, %2 ], [ %92, %91 ]
  br label %.preheader114

.preheader114:                                    ; preds = %46, %.preheader116
  %indvars.iv11 = phi i64 [ 1, %.preheader116 ], [ %indvars.iv.next12, %46 ]
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %3 = add nsw i64 %indvars.iv11, -1
  br label %.preheader112

.preheader112:                                    ; preds = %45, %.preheader114
  %indvars.iv8 = phi i64 [ 1, %.preheader114 ], [ %indvars.iv.next9, %45 ]
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %4 = add nsw i64 %indvars.iv8, -1
  br label %5

; <label>:5:                                      ; preds = %5, %.preheader112
  %indvars.iv = phi i64 [ 1, %.preheader112 ], [ %indvars.iv.next, %5 ]
  %6 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv.next12, i64 %indvars.iv8, i64 %indvars.iv
  %7 = load double, double* %6, align 8
  %8 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv11, i64 %indvars.iv8, i64 %indvars.iv
  %9 = load double, double* %8, align 8
  %10 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %3, i64 %indvars.iv8, i64 %indvars.iv
  %11 = load double, double* %10, align 8
  %12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv11, i64 %indvars.iv.next9, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = shufflevector <2 x double> %14, <2 x double> undef, <2 x i32> zeroinitializer
  %16 = fmul <2 x double> %15, <double 2.000000e+00, double 2.000000e+00>
  %17 = insertelement <2 x double> undef, double %7, i32 0
  %18 = insertelement <2 x double> %17, double %13, i32 1
  %19 = fsub <2 x double> %18, %16
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv11, i64 %4, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = insertelement <2 x double> undef, double %11, i32 0
  %23 = insertelement <2 x double> %22, double %21, i32 1
  %24 = fadd <2 x double> %23, %19
  %25 = fmul <2 x double> %24, <double 1.250000e-01, double 1.250000e-01>
  %26 = extractelement <2 x double> %25, i32 0
  %27 = extractelement <2 x double> %25, i32 1
  %28 = fadd double %26, %27
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv11, i64 %indvars.iv8, i64 %indvars.iv.next
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv11, i64 %indvars.iv8, i64 %indvars.iv
  %32 = load double, double* %31, align 8
  %33 = fmul double %32, 2.000000e+00
  %34 = fsub double %30, %33
  %35 = add nsw i64 %indvars.iv, -1
  %36 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv11, i64 %indvars.iv8, i64 %35
  %37 = load double, double* %36, align 8
  %38 = fadd double %37, %34
  %39 = fmul double %38, 1.250000e-01
  %40 = fadd double %28, %39
  %41 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv11, i64 %indvars.iv8, i64 %indvars.iv
  %42 = load double, double* %41, align 8
  %43 = fadd double %42, %40
  %44 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv11, i64 %indvars.iv8, i64 %indvars.iv
  store double %43, double* %44, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %45, label %5

; <label>:45:                                     ; preds = %5
  %exitcond10 = icmp eq i64 %indvars.iv.next9, 119
  br i1 %exitcond10, label %46, label %.preheader112

; <label>:46:                                     ; preds = %45
  %exitcond13 = icmp eq i64 %indvars.iv.next12, 119
  br i1 %exitcond13, label %.preheader113.preheader, label %.preheader114

.preheader113.preheader:                          ; preds = %46
  br label %.preheader113

.preheader113:                                    ; preds = %.preheader113.preheader, %90
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %90 ], [ 1, %.preheader113.preheader ]
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %47 = add nsw i64 %indvars.iv20, -1
  br label %.preheader

.preheader:                                       ; preds = %89, %.preheader113
  %indvars.iv17 = phi i64 [ 1, %.preheader113 ], [ %indvars.iv.next18, %89 ]
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %48 = add nsw i64 %indvars.iv17, -1
  br label %49

; <label>:49:                                     ; preds = %49, %.preheader
  %indvars.iv14 = phi i64 [ 1, %.preheader ], [ %indvars.iv.next15, %49 ]
  %50 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv.next21, i64 %indvars.iv17, i64 %indvars.iv14
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv20, i64 %indvars.iv17, i64 %indvars.iv14
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %47, i64 %indvars.iv17, i64 %indvars.iv14
  %55 = load double, double* %54, align 8
  %56 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv20, i64 %indvars.iv.next18, i64 %indvars.iv14
  %57 = load double, double* %56, align 8
  %58 = insertelement <2 x double> undef, double %53, i32 0
  %59 = shufflevector <2 x double> %58, <2 x double> undef, <2 x i32> zeroinitializer
  %60 = fmul <2 x double> %59, <double 2.000000e+00, double 2.000000e+00>
  %61 = insertelement <2 x double> undef, double %51, i32 0
  %62 = insertelement <2 x double> %61, double %57, i32 1
  %63 = fsub <2 x double> %62, %60
  %64 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv20, i64 %48, i64 %indvars.iv14
  %65 = load double, double* %64, align 8
  %66 = insertelement <2 x double> undef, double %55, i32 0
  %67 = insertelement <2 x double> %66, double %65, i32 1
  %68 = fadd <2 x double> %67, %63
  %69 = fmul <2 x double> %68, <double 1.250000e-01, double 1.250000e-01>
  %70 = extractelement <2 x double> %69, i32 0
  %71 = extractelement <2 x double> %69, i32 1
  %72 = fadd double %70, %71
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %73 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv20, i64 %indvars.iv17, i64 %indvars.iv.next15
  %74 = load double, double* %73, align 8
  %75 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv20, i64 %indvars.iv17, i64 %indvars.iv14
  %76 = load double, double* %75, align 8
  %77 = fmul double %76, 2.000000e+00
  %78 = fsub double %74, %77
  %79 = add nsw i64 %indvars.iv14, -1
  %80 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv20, i64 %indvars.iv17, i64 %79
  %81 = load double, double* %80, align 8
  %82 = fadd double %81, %78
  %83 = fmul double %82, 1.250000e-01
  %84 = fadd double %72, %83
  %85 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv20, i64 %indvars.iv17, i64 %indvars.iv14
  %86 = load double, double* %85, align 8
  %87 = fadd double %86, %84
  %88 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv20, i64 %indvars.iv17, i64 %indvars.iv14
  store double %87, double* %88, align 8
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 119
  br i1 %exitcond16, label %89, label %49

; <label>:89:                                     ; preds = %49
  %exitcond19 = icmp eq i64 %indvars.iv.next18, 119
  br i1 %exitcond19, label %90, label %.preheader

; <label>:90:                                     ; preds = %89
  %exitcond22 = icmp eq i64 %indvars.iv.next21, 119
  br i1 %exitcond22, label %91, label %.preheader113

; <label>:91:                                     ; preds = %90
  %92 = add nuw nsw i32 %.01117, 1
  %exitcond23 = icmp eq i32 %92, 501
  br i1 %exitcond23, label %93, label %.preheader116

; <label>:93:                                     ; preds = %91
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

.preheader20:                                     ; preds = %21, %1
  %indvars.iv7 = phi i64 [ 0, %1 ], [ %indvars.iv.next8, %21 ]
  %6 = mul nuw nsw i64 %indvars.iv7, 14400
  br label %.preheader

.preheader:                                       ; preds = %20, %.preheader20
  %indvars.iv4 = phi i64 [ 0, %.preheader20 ], [ %indvars.iv.next5, %20 ]
  %7 = mul nuw nsw i64 %indvars.iv4, 120
  %8 = add nuw nsw i64 %7, %6
  br label %9

; <label>:9:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %10 = add nuw nsw i64 %8, %indvars.iv
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %9, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv7, i64 %indvars.iv4, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %20, label %9

; <label>:20:                                     ; preds = %._crit_edge
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 120
  br i1 %exitcond6, label %21, label %.preheader

; <label>:21:                                     ; preds = %20
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 120
  br i1 %exitcond9, label %22, label %.preheader20

; <label>:22:                                     ; preds = %21
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %25) #5
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
