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
define internal fastcc void @init_array([120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  br label %.preheader1

.preheader1:                                      ; preds = %2, %28
  %3 = phi i32 [ 0, %2 ], [ %29, %28 ]
  %4 = add nuw i32 %3, 120
  %5 = sext i32 %3 to i64
  br label %.preheader

.preheader:                                       ; preds = %.preheader1, %25
  %6 = phi i32 [ 0, %.preheader1 ], [ %26, %25 ]
  %7 = add nuw i32 %4, %6
  %8 = sext i32 %6 to i64
  %9 = sext i32 %7 to i64
  br label %10

; <label>:10:                                     ; preds = %10, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %10 ]
  %11 = sub nuw nsw i64 %9, %indvars.iv
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %5, i64 %8, i64 %indvars.iv
  %15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %5, i64 %8, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %16 = sub nuw nsw i64 %9, %indvars.iv.next
  %17 = trunc i64 %16 to i32
  %18 = sitofp i32 %17 to double
  %19 = insertelement <2 x double> undef, double %13, i32 0
  %20 = insertelement <2 x double> %19, double %18, i32 1
  %21 = fmul <2 x double> %20, <double 1.000000e+01, double 1.000000e+01>
  %22 = fdiv <2 x double> %21, <double 1.200000e+02, double 1.200000e+02>
  %23 = bitcast double* %14 to <2 x double>*
  %24 = bitcast double* %15 to <2 x double>*
  store <2 x double> %22, <2 x double>* %23, align 8
  store <2 x double> %22, <2 x double>* %24, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %25, label %10

; <label>:25:                                     ; preds = %10
  %26 = add nsw i32 %6, 1
  %27 = icmp slt i32 %26, 120
  br i1 %27, label %.preheader, label %28

; <label>:28:                                     ; preds = %25
  %29 = add nsw i32 %3, 1
  %30 = icmp slt i32 %29, 120
  br i1 %30, label %.preheader1, label %31

; <label>:31:                                     ; preds = %28
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d([120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge11, %2
  %3 = phi i32 [ 1, %2 ], [ %112, %._crit_edge11 ]
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader6, %._crit_edge7
  %4 = phi i32 [ 1, %.preheader6 ], [ %56, %._crit_edge7 ]
  %5 = add nuw nsw i32 %4, 1
  %6 = sext i32 %5 to i64
  %7 = sext i32 %4 to i64
  %8 = add nsw i32 %4, -1
  %9 = sext i32 %8 to i64
  br label %.preheader2.us

.preheader2.us:                                   ; preds = %._crit_edge.us, %.preheader4
  %10 = phi i32 [ 1, %.preheader4 ], [ %54, %._crit_edge.us ]
  %11 = sext i32 %10 to i64
  %12 = add nuw nsw i32 %10, 1
  %13 = sext i32 %12 to i64
  %14 = add nsw i32 %10, -1
  %15 = sext i32 %14 to i64
  br label %16

; <label>:16:                                     ; preds = %16, %.preheader2.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %16 ], [ 1, %.preheader2.us ]
  %17 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %6, i64 %11, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %7, i64 %11, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = fmul double %20, 2.000000e+00
  %22 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %9, i64 %11, i64 %indvars.iv
  %23 = load double, double* %22, align 8
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %7, i64 %13, i64 %indvars.iv
  %25 = load double, double* %24, align 8
  %26 = insertelement <2 x double> undef, double %21, i32 0
  %27 = shufflevector <2 x double> %26, <2 x double> undef, <2 x i32> zeroinitializer
  %28 = insertelement <2 x double> undef, double %18, i32 0
  %29 = insertelement <2 x double> %28, double %25, i32 1
  %30 = fsub <2 x double> %29, %27
  %31 = extractelement <2 x double> %30, i32 0
  %32 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %7, i64 %15, i64 %indvars.iv
  %33 = load double, double* %32, align 8
  %34 = insertelement <2 x double> undef, double %31, i32 0
  %35 = insertelement <2 x double> %34, double %33, i32 1
  %36 = insertelement <2 x double> undef, double %23, i32 0
  %37 = shufflevector <2 x double> %36, <2 x double> %30, <2 x i32> <i32 0, i32 3>
  %38 = fadd <2 x double> %37, %35
  %39 = fmul <2 x double> %38, <double 1.250000e-01, double 1.250000e-01>
  %40 = extractelement <2 x double> %39, i32 0
  %41 = extractelement <2 x double> %39, i32 1
  %42 = fadd double %40, %41
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %43 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %7, i64 %11, i64 %indvars.iv.next
  %44 = load double, double* %43, align 8
  %45 = fsub double %44, %21
  %46 = add nsw i64 %indvars.iv, -1
  %47 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %7, i64 %11, i64 %46
  %48 = load double, double* %47, align 8
  %49 = fadd double %45, %48
  %50 = fmul double %49, 1.250000e-01
  %51 = fadd double %42, %50
  %52 = fadd double %20, %51
  %53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %7, i64 %11, i64 %indvars.iv
  store double %52, double* %53, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %._crit_edge.us, label %16

._crit_edge.us:                                   ; preds = %16
  %54 = add nsw i32 %10, 1
  %55 = icmp slt i32 %54, 119
  br i1 %55, label %.preheader2.us, label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge.us
  %56 = add nsw i32 %4, 1
  %57 = icmp slt i32 %56, 119
  br i1 %57, label %.preheader4, label %.preheader3.preheader

.preheader3.preheader:                            ; preds = %._crit_edge7
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3.preheader, %._crit_edge10
  %58 = phi i32 [ %110, %._crit_edge10 ], [ 1, %.preheader3.preheader ]
  %59 = add nuw nsw i32 %58, 1
  %60 = sext i32 %59 to i64
  %61 = sext i32 %58 to i64
  %62 = add nsw i32 %58, -1
  %63 = sext i32 %62 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge9.us, %.preheader3
  %64 = phi i32 [ 1, %.preheader3 ], [ %108, %._crit_edge9.us ]
  %65 = sext i32 %64 to i64
  %66 = add nuw nsw i32 %64, 1
  %67 = sext i32 %66 to i64
  %68 = add nsw i32 %64, -1
  %69 = sext i32 %68 to i64
  br label %70

; <label>:70:                                     ; preds = %70, %.preheader.us
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %70 ], [ 1, %.preheader.us ]
  %71 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %60, i64 %65, i64 %indvars.iv12
  %72 = load double, double* %71, align 8
  %73 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %61, i64 %65, i64 %indvars.iv12
  %74 = load double, double* %73, align 8
  %75 = fmul double %74, 2.000000e+00
  %76 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %63, i64 %65, i64 %indvars.iv12
  %77 = load double, double* %76, align 8
  %78 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %61, i64 %67, i64 %indvars.iv12
  %79 = load double, double* %78, align 8
  %80 = insertelement <2 x double> undef, double %75, i32 0
  %81 = shufflevector <2 x double> %80, <2 x double> undef, <2 x i32> zeroinitializer
  %82 = insertelement <2 x double> undef, double %72, i32 0
  %83 = insertelement <2 x double> %82, double %79, i32 1
  %84 = fsub <2 x double> %83, %81
  %85 = extractelement <2 x double> %84, i32 0
  %86 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %61, i64 %69, i64 %indvars.iv12
  %87 = load double, double* %86, align 8
  %88 = insertelement <2 x double> undef, double %85, i32 0
  %89 = insertelement <2 x double> %88, double %87, i32 1
  %90 = insertelement <2 x double> undef, double %77, i32 0
  %91 = shufflevector <2 x double> %90, <2 x double> %84, <2 x i32> <i32 0, i32 3>
  %92 = fadd <2 x double> %91, %89
  %93 = fmul <2 x double> %92, <double 1.250000e-01, double 1.250000e-01>
  %94 = extractelement <2 x double> %93, i32 0
  %95 = extractelement <2 x double> %93, i32 1
  %96 = fadd double %94, %95
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %97 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %61, i64 %65, i64 %indvars.iv.next13
  %98 = load double, double* %97, align 8
  %99 = fsub double %98, %75
  %100 = add nsw i64 %indvars.iv12, -1
  %101 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %61, i64 %65, i64 %100
  %102 = load double, double* %101, align 8
  %103 = fadd double %99, %102
  %104 = fmul double %103, 1.250000e-01
  %105 = fadd double %96, %104
  %106 = fadd double %74, %105
  %107 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %61, i64 %65, i64 %indvars.iv12
  store double %106, double* %107, align 8
  %exitcond14 = icmp eq i64 %indvars.iv.next13, 119
  br i1 %exitcond14, label %._crit_edge9.us, label %70

._crit_edge9.us:                                  ; preds = %70
  %108 = add nsw i32 %64, 1
  %109 = icmp slt i32 %108, 119
  br i1 %109, label %.preheader.us, label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge9.us
  %110 = add nsw i32 %58, 1
  %111 = icmp slt i32 %110, 119
  br i1 %111, label %.preheader3, label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge10
  %112 = add nuw nsw i32 %3, 1
  %exitcond15 = icmp eq i32 %112, 501
  br i1 %exitcond15, label %113, label %.preheader6

; <label>:113:                                    ; preds = %._crit_edge11
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([120 x [120 x double]]*) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader1

.preheader1:                                      ; preds = %1, %28
  %6 = phi i32 [ 0, %1 ], [ %29, %28 ]
  %7 = mul nuw nsw i32 %6, 120
  %8 = sext i32 %6 to i64
  br label %.preheader

.preheader:                                       ; preds = %.preheader1, %25
  %9 = phi i32 [ 0, %.preheader1 ], [ %26, %25 ]
  %10 = add nuw i32 %9, %7
  %11 = mul nuw nsw i32 %10, 120
  %12 = sext i32 %9 to i64
  %13 = zext i32 %11 to i64
  br label %14

; <label>:14:                                     ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %15 = add i64 %indvars.iv, %13
  %16 = trunc i64 %15 to i32
  %17 = srem i32 %16, 20
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %14
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %20) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %19
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %8, i64 %12, i64 %indvars.iv
  %23 = load double, double* %22, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %23) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %25, label %14

; <label>:25:                                     ; preds = %._crit_edge
  %26 = add nsw i32 %9, 1
  %27 = icmp slt i32 %26, 120
  br i1 %27, label %.preheader, label %28

; <label>:28:                                     ; preds = %25
  %29 = add nsw i32 %6, 1
  %30 = icmp slt i32 %29, 120
  br i1 %30, label %.preheader1, label %31

; <label>:31:                                     ; preds = %28
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %35 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %34) #5
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
