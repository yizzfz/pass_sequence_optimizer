; ModuleID = 'A.ll'
source_filename = "heat-3d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
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
  br label %.preheader1

.preheader1:                                      ; preds = %24, %2
  %indvars.iv4 = phi i64 [ 0, %2 ], [ %indvars.iv.next5, %24 ]
  %3 = add nuw i64 %indvars.iv4, 120
  %4 = trunc i64 %3 to i32
  br label %.preheader

.preheader:                                       ; preds = %22, %.preheader1
  %indvars.iv2 = phi i64 [ 0, %.preheader1 ], [ %indvars.iv.next3, %22 ]
  %5 = trunc i64 %indvars.iv2 to i32
  %6 = add i32 %4, %5
  br label %7

; <label>:7:                                      ; preds = %7, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %7 ]
  %8 = trunc i64 %indvars.iv to i32
  %9 = sub nuw nsw i32 %6, %8
  %10 = sitofp i32 %9 to double
  %11 = fmul double %10, 1.000000e+01
  %12 = fdiv double %11, 1.200000e+02
  %13 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv4, i64 %indvars.iv2, i64 %indvars.iv
  store double %12, double* %13, align 8
  %14 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv4, i64 %indvars.iv2, i64 %indvars.iv
  store double %12, double* %14, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %15 = trunc i64 %indvars.iv.next to i32
  %16 = sub nuw nsw i32 %6, %15
  %17 = sitofp i32 %16 to double
  %18 = fmul double %17, 1.000000e+01
  %19 = fdiv double %18, 1.200000e+02
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv4, i64 %indvars.iv2, i64 %indvars.iv.next
  store double %19, double* %20, align 8
  %21 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv4, i64 %indvars.iv2, i64 %indvars.iv.next
  store double %19, double* %21, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 119
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %22, label %7

; <label>:22:                                     ; preds = %7
  %indvars.iv.next3 = add nuw i64 %indvars.iv2, 1
  %23 = icmp slt i64 %indvars.iv.next3, 120
  br i1 %23, label %.preheader, label %24

; <label>:24:                                     ; preds = %22
  %indvars.iv.next5 = add nuw i64 %indvars.iv4, 1
  %25 = icmp slt i64 %indvars.iv.next5, 120
  br i1 %25, label %.preheader1, label %26

; <label>:26:                                     ; preds = %24
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d([120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  br label %.preheader5

.preheader5:                                      ; preds = %85, %2
  %.06 = phi i32 [ 1, %2 ], [ %86, %85 ]
  br label %.preheader3

.preheader3:                                      ; preds = %42, %.preheader5
  %indvars.iv10 = phi i64 [ 1, %.preheader5 ], [ %indvars.iv.next11, %42 ]
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %3 = add nsw i64 %indvars.iv10, -1
  br label %.preheader1

.preheader1:                                      ; preds = %40, %.preheader3
  %indvars.iv8 = phi i64 [ 1, %.preheader3 ], [ %indvars.iv.next9, %40 ]
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  %4 = add nsw i64 %indvars.iv8, -1
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader1
  %indvars.iv = phi i64 [ 1, %.preheader1 ], [ %indvars.iv.next, %._crit_edge ]
  %5 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv.next11, i64 %indvars.iv8, i64 %indvars.iv
  %6 = load double, double* %5, align 8
  %7 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv10, i64 %indvars.iv8, i64 %indvars.iv
  %8 = load double, double* %7, align 8
  %9 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %3, i64 %indvars.iv8, i64 %indvars.iv
  %10 = load double, double* %9, align 8
  %11 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv10, i64 %indvars.iv.next9, i64 %indvars.iv
  %12 = load double, double* %11, align 8
  %13 = insertelement <2 x double> undef, double %8, i32 0
  %14 = shufflevector <2 x double> %13, <2 x double> undef, <2 x i32> zeroinitializer
  %15 = fmul <2 x double> %14, <double 2.000000e+00, double 2.000000e+00>
  %16 = insertelement <2 x double> undef, double %6, i32 0
  %17 = insertelement <2 x double> %16, double %12, i32 1
  %18 = fsub <2 x double> %17, %15
  %19 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv10, i64 %4, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = insertelement <2 x double> undef, double %10, i32 0
  %22 = insertelement <2 x double> %21, double %20, i32 1
  %23 = fadd <2 x double> %18, %22
  %24 = fmul <2 x double> %23, <double 1.250000e-01, double 1.250000e-01>
  %25 = extractelement <2 x double> %24, i32 0
  %26 = extractelement <2 x double> %24, i32 1
  %27 = fadd double %25, %26
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %28 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv10, i64 %indvars.iv8, i64 %indvars.iv.next
  %29 = load double, double* %28, align 8
  %30 = fmul double %8, 2.000000e+00
  %31 = fsub double %29, %30
  %32 = add nsw i64 %indvars.iv, -1
  %33 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv10, i64 %indvars.iv8, i64 %32
  %34 = load double, double* %33, align 8
  %35 = fadd double %31, %34
  %36 = fmul double %35, 1.250000e-01
  %37 = fadd double %36, %27
  %38 = fadd double %8, %37
  %39 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv10, i64 %indvars.iv8, i64 %indvars.iv
  store double %38, double* %39, align 8
  %exitcond = icmp eq i64 %indvars.iv, 118
  br i1 %exitcond, label %40, label %._crit_edge

; <label>:40:                                     ; preds = %._crit_edge
  %41 = icmp slt i64 %indvars.iv.next9, 119
  br i1 %41, label %.preheader1, label %42

; <label>:42:                                     ; preds = %40
  %43 = icmp slt i64 %indvars.iv.next11, 119
  br i1 %43, label %.preheader3, label %.preheader2.preheader

.preheader2.preheader:                            ; preds = %42
  br label %.preheader2

.preheader2:                                      ; preds = %.preheader2.preheader, %83
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %83 ], [ 1, %.preheader2.preheader ]
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %44 = add nsw i64 %indvars.iv17, -1
  br label %.preheader

.preheader:                                       ; preds = %81, %.preheader2
  %indvars.iv15 = phi i64 [ 1, %.preheader2 ], [ %indvars.iv.next16, %81 ]
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %45 = add nsw i64 %indvars.iv15, -1
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7, %.preheader
  %indvars.iv12 = phi i64 [ 1, %.preheader ], [ %indvars.iv.next13, %._crit_edge7 ]
  %46 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv.next18, i64 %indvars.iv15, i64 %indvars.iv12
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv17, i64 %indvars.iv15, i64 %indvars.iv12
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %44, i64 %indvars.iv15, i64 %indvars.iv12
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv17, i64 %indvars.iv.next16, i64 %indvars.iv12
  %53 = load double, double* %52, align 8
  %54 = insertelement <2 x double> undef, double %49, i32 0
  %55 = shufflevector <2 x double> %54, <2 x double> undef, <2 x i32> zeroinitializer
  %56 = fmul <2 x double> %55, <double 2.000000e+00, double 2.000000e+00>
  %57 = insertelement <2 x double> undef, double %47, i32 0
  %58 = insertelement <2 x double> %57, double %53, i32 1
  %59 = fsub <2 x double> %58, %56
  %60 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv17, i64 %45, i64 %indvars.iv12
  %61 = load double, double* %60, align 8
  %62 = insertelement <2 x double> undef, double %51, i32 0
  %63 = insertelement <2 x double> %62, double %61, i32 1
  %64 = fadd <2 x double> %59, %63
  %65 = fmul <2 x double> %64, <double 1.250000e-01, double 1.250000e-01>
  %66 = extractelement <2 x double> %65, i32 0
  %67 = extractelement <2 x double> %65, i32 1
  %68 = fadd double %66, %67
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %69 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv17, i64 %indvars.iv15, i64 %indvars.iv.next13
  %70 = load double, double* %69, align 8
  %71 = fmul double %49, 2.000000e+00
  %72 = fsub double %70, %71
  %73 = add nsw i64 %indvars.iv12, -1
  %74 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv17, i64 %indvars.iv15, i64 %73
  %75 = load double, double* %74, align 8
  %76 = fadd double %72, %75
  %77 = fmul double %76, 1.250000e-01
  %78 = fadd double %77, %68
  %79 = fadd double %49, %78
  %80 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv17, i64 %indvars.iv15, i64 %indvars.iv12
  store double %79, double* %80, align 8
  %exitcond14 = icmp eq i64 %indvars.iv12, 118
  br i1 %exitcond14, label %81, label %._crit_edge7

; <label>:81:                                     ; preds = %._crit_edge7
  %82 = icmp slt i64 %indvars.iv.next16, 119
  br i1 %82, label %.preheader, label %83

; <label>:83:                                     ; preds = %81
  %84 = icmp slt i64 %indvars.iv.next18, 119
  br i1 %84, label %.preheader2, label %85

; <label>:85:                                     ; preds = %83
  %86 = add nuw nsw i32 %.06, 1
  %87 = icmp slt i32 %86, 501
  br i1 %87, label %.preheader5, label %88

; <label>:88:                                     ; preds = %85
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([120 x [120 x double]]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader1

.preheader1:                                      ; preds = %22, %1
  %indvars.iv4 = phi i64 [ 0, %1 ], [ %indvars.iv.next5, %22 ]
  %sext = mul i64 %indvars.iv4, 61847529062400
  %6 = lshr exact i64 %sext, 32
  br label %.preheader

.preheader:                                       ; preds = %20, %.preheader1
  %indvars.iv2 = phi i64 [ 0, %.preheader1 ], [ %indvars.iv.next3, %20 ]
  %7 = mul nsw i64 %indvars.iv2, 120
  %8 = add i64 %7, %6
  br label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %9 = add i64 %8, %indvars.iv
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %._crit_edge._crit_edge
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge._crit_edge, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv4, i64 %indvars.iv2, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #5
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %19 = icmp slt i64 %indvars.iv.next, 120
  br i1 %19, label %._crit_edge._crit_edge, label %20

; <label>:20:                                     ; preds = %._crit_edge
  %indvars.iv.next3 = add nuw i64 %indvars.iv2, 1
  %21 = icmp slt i64 %indvars.iv.next3, 120
  br i1 %21, label %.preheader, label %22

; <label>:22:                                     ; preds = %20
  %indvars.iv.next5 = add nuw i64 %indvars.iv4, 1
  %23 = icmp slt i64 %indvars.iv.next5, 120
  br i1 %23, label %.preheader1, label %24

; <label>:24:                                     ; preds = %22
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %27) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
