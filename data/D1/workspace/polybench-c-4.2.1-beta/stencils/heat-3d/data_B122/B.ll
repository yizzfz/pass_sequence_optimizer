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
  %12 = bitcast i8* %3 to [120 x [120 x double]]*
  tail call fastcc void @print_array([120 x [120 x double]]* %12)
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %2, %11
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  br label %.preheader23

.preheader23:                                     ; preds = %21, %2
  %indvars.iv3 = phi i64 [ 0, %2 ], [ %indvars.iv.next4, %21 ]
  %3 = add nuw nsw i64 %indvars.iv3, 120
  br label %.preheader

.preheader:                                       ; preds = %20, %.preheader23
  %indvars.iv1 = phi i64 [ 0, %.preheader23 ], [ %indvars.iv.next2, %20 ]
  %4 = add nuw nsw i64 %3, %indvars.iv1
  br label %5

; <label>:5:                                      ; preds = %5, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %5 ]
  %6 = sub nuw nsw i64 %4, %indvars.iv
  %7 = trunc i64 %6 to i32
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv3, i64 %indvars.iv1, i64 %indvars.iv
  %10 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv3, i64 %indvars.iv1, i64 %indvars.iv
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
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next2, 120
  br i1 %exitcond, label %21, label %.preheader

; <label>:21:                                     ; preds = %20
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 120
  br i1 %exitcond5, label %22, label %.preheader23

; <label>:22:                                     ; preds = %21
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d([120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  br label %.preheader116

.preheader116:                                    ; preds = %._crit_edge127, %2
  %.0111128 = phi i32 [ 1, %2 ], [ %89, %._crit_edge127 ]
  br label %.preheader114

.preheader114:                                    ; preds = %._crit_edge119, %.preheader116
  %indvars.iv4 = phi i64 [ 1, %.preheader116 ], [ %indvars.iv.next5, %._crit_edge119 ]
  %3 = add nuw nsw i64 %indvars.iv4, 1
  %4 = add nsw i64 %indvars.iv4, -1
  br label %.preheader112.us

.preheader112.us:                                 ; preds = %._crit_edge.us, %.preheader114
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge.us ], [ 1, %.preheader114 ]
  %5 = add nuw nsw i64 %indvars.iv1, 1
  %6 = add nsw i64 %indvars.iv1, -1
  br label %7

; <label>:7:                                      ; preds = %7, %.preheader112.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %7 ], [ 1, %.preheader112.us ]
  %8 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %3, i64 %indvars.iv1, i64 %indvars.iv
  %9 = load double, double* %8, align 8
  %10 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv4, i64 %indvars.iv1, i64 %indvars.iv
  %11 = load double, double* %10, align 8
  %12 = fmul double %11, 2.000000e+00
  %13 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %4, i64 %indvars.iv1, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv4, i64 %5, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = insertelement <2 x double> undef, double %12, i32 0
  %18 = shufflevector <2 x double> %17, <2 x double> undef, <2 x i32> zeroinitializer
  %19 = insertelement <2 x double> undef, double %9, i32 0
  %20 = insertelement <2 x double> %19, double %16, i32 1
  %21 = fsub <2 x double> %20, %18
  %22 = extractelement <2 x double> %21, i32 0
  %23 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv4, i64 %6, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = insertelement <2 x double> undef, double %22, i32 0
  %26 = insertelement <2 x double> %25, double %24, i32 1
  %27 = insertelement <2 x double> undef, double %14, i32 0
  %28 = shufflevector <2 x double> %27, <2 x double> %21, <2 x i32> <i32 0, i32 3>
  %29 = fadd <2 x double> %28, %26
  %30 = fmul <2 x double> %29, <double 1.250000e-01, double 1.250000e-01>
  %31 = extractelement <2 x double> %30, i32 0
  %32 = extractelement <2 x double> %30, i32 1
  %33 = fadd double %31, %32
  %34 = add nuw nsw i64 %indvars.iv, 1
  %35 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv4, i64 %indvars.iv1, i64 %34
  %36 = load double, double* %35, align 8
  %37 = fsub double %36, %12
  %38 = add nsw i64 %indvars.iv, -1
  %39 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv4, i64 %indvars.iv1, i64 %38
  %40 = load double, double* %39, align 8
  %41 = fadd double %37, %40
  %42 = fmul double %41, 1.250000e-01
  %43 = fadd double %33, %42
  %44 = fadd double %11, %43
  %45 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv4, i64 %indvars.iv1, i64 %indvars.iv
  store double %44, double* %45, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %._crit_edge.us, label %7

._crit_edge.us:                                   ; preds = %7
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 119
  br i1 %exitcond3, label %._crit_edge119, label %.preheader112.us

._crit_edge119:                                   ; preds = %._crit_edge.us
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 119
  br i1 %exitcond6, label %.preheader113.preheader, label %.preheader114

.preheader113.preheader:                          ; preds = %._crit_edge119
  br label %.preheader113

.preheader113:                                    ; preds = %.preheader113.preheader, %._crit_edge125
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %._crit_edge125 ], [ 1, %.preheader113.preheader ]
  %46 = add nuw nsw i64 %indvars.iv10, 1
  %47 = add nsw i64 %indvars.iv10, -1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge123.us, %.preheader113
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %._crit_edge123.us ], [ 1, %.preheader113 ]
  %48 = add nuw nsw i64 %indvars.iv7, 1
  %49 = add nsw i64 %indvars.iv7, -1
  br label %50

; <label>:50:                                     ; preds = %50, %.preheader.us
  %indvars.iv129 = phi i64 [ %indvars.iv.next130, %50 ], [ 1, %.preheader.us ]
  %51 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %46, i64 %indvars.iv7, i64 %indvars.iv129
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv10, i64 %indvars.iv7, i64 %indvars.iv129
  %54 = load double, double* %53, align 8
  %55 = fmul double %54, 2.000000e+00
  %56 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %47, i64 %indvars.iv7, i64 %indvars.iv129
  %57 = load double, double* %56, align 8
  %58 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv10, i64 %48, i64 %indvars.iv129
  %59 = load double, double* %58, align 8
  %60 = insertelement <2 x double> undef, double %55, i32 0
  %61 = shufflevector <2 x double> %60, <2 x double> undef, <2 x i32> zeroinitializer
  %62 = insertelement <2 x double> undef, double %52, i32 0
  %63 = insertelement <2 x double> %62, double %59, i32 1
  %64 = fsub <2 x double> %63, %61
  %65 = extractelement <2 x double> %64, i32 0
  %66 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv10, i64 %49, i64 %indvars.iv129
  %67 = load double, double* %66, align 8
  %68 = insertelement <2 x double> undef, double %65, i32 0
  %69 = insertelement <2 x double> %68, double %67, i32 1
  %70 = insertelement <2 x double> undef, double %57, i32 0
  %71 = shufflevector <2 x double> %70, <2 x double> %64, <2 x i32> <i32 0, i32 3>
  %72 = fadd <2 x double> %71, %69
  %73 = fmul <2 x double> %72, <double 1.250000e-01, double 1.250000e-01>
  %74 = extractelement <2 x double> %73, i32 0
  %75 = extractelement <2 x double> %73, i32 1
  %76 = fadd double %74, %75
  %77 = add nuw nsw i64 %indvars.iv129, 1
  %78 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv10, i64 %indvars.iv7, i64 %77
  %79 = load double, double* %78, align 8
  %80 = fsub double %79, %55
  %81 = add nsw i64 %indvars.iv129, -1
  %82 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv10, i64 %indvars.iv7, i64 %81
  %83 = load double, double* %82, align 8
  %84 = fadd double %80, %83
  %85 = fmul double %84, 1.250000e-01
  %86 = fadd double %76, %85
  %87 = fadd double %54, %86
  %88 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv10, i64 %indvars.iv7, i64 %indvars.iv129
  store double %87, double* %88, align 8
  %indvars.iv.next130 = add nuw nsw i64 %indvars.iv129, 1
  %exitcond131 = icmp eq i64 %indvars.iv.next130, 119
  br i1 %exitcond131, label %._crit_edge123.us, label %50

._crit_edge123.us:                                ; preds = %50
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 119
  br i1 %exitcond9, label %._crit_edge125, label %.preheader.us

._crit_edge125:                                   ; preds = %._crit_edge123.us
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 119
  br i1 %exitcond12, label %._crit_edge127, label %.preheader113

._crit_edge127:                                   ; preds = %._crit_edge125
  %89 = add nuw nsw i32 %.0111128, 1
  %exitcond132 = icmp eq i32 %89, 501
  br i1 %exitcond132, label %90, label %.preheader116

; <label>:90:                                     ; preds = %._crit_edge127
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
  %indvars.iv4 = phi i64 [ 0, %1 ], [ %indvars.iv.next5, %21 ]
  %6 = mul nuw nsw i64 %indvars.iv4, 120
  br label %.preheader

.preheader:                                       ; preds = %20, %.preheader20
  %indvars.iv1 = phi i64 [ 0, %.preheader20 ], [ %indvars.iv.next2, %20 ]
  %7 = add nuw nsw i64 %indvars.iv1, %6
  %8 = mul nuw nsw i64 %7, 120
  br label %9

; <label>:9:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %10 = add nuw nsw i64 %indvars.iv, %8
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
  %17 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv4, i64 %indvars.iv1, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %20, label %9

; <label>:20:                                     ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 120
  br i1 %exitcond3, label %21, label %.preheader

; <label>:21:                                     ; preds = %20
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 120
  br i1 %exitcond6, label %22, label %.preheader20

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
