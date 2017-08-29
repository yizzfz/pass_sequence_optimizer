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
define internal fastcc void @init_array([120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  br label %.preheader23

.preheader23:                                     ; preds = %22, %2
  %indvars.iv3 = phi i64 [ 0, %2 ], [ %indvars.iv.next4, %22 ]
  %3 = add nuw i64 %indvars.iv3, 120
  br label %.preheader

.preheader:                                       ; preds = %20, %.preheader23
  %indvars.iv1 = phi i64 [ 0, %.preheader23 ], [ %indvars.iv.next2, %20 ]
  %4 = add i64 %3, %indvars.iv1
  %sext = shl i64 %4, 32
  %5 = ashr exact i64 %sext, 32
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge ]
  %6 = sub nuw nsw i64 %5, %indvars.iv
  %7 = trunc i64 %6 to i32
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv3, i64 %indvars.iv1, i64 %indvars.iv
  %10 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv3, i64 %indvars.iv1, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %11 = sub nuw nsw i64 %5, %indvars.iv.next
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
  br i1 %exitcond.1, label %20, label %._crit_edge

; <label>:20:                                     ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw i64 %indvars.iv1, 1
  %21 = icmp slt i64 %indvars.iv.next2, 120
  br i1 %21, label %.preheader, label %22

; <label>:22:                                     ; preds = %20
  %indvars.iv.next4 = add nuw i64 %indvars.iv3, 1
  %23 = icmp slt i64 %indvars.iv.next4, 120
  br i1 %23, label %.preheader23, label %24

; <label>:24:                                     ; preds = %22
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d([120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  br label %.preheader116

.preheader116:                                    ; preds = %._crit_edge131, %2
  %.0111132 = phi i32 [ 1, %2 ], [ %89, %._crit_edge131 ]
  br label %.preheader114

.preheader114:                                    ; preds = %._crit_edge120, %.preheader116
  %indvars.iv5 = phi i64 [ 1, %.preheader116 ], [ %indvars.iv.next6, %._crit_edge120 ]
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %3 = add nsw i64 %indvars.iv5, -1
  br label %.preheader112

.preheader112:                                    ; preds = %._crit_edge, %.preheader114
  %indvars.iv3 = phi i64 [ 1, %.preheader114 ], [ %indvars.iv.next4, %._crit_edge ]
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %4 = add nsw i64 %indvars.iv3, -1
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1, %.preheader112
  %indvars.iv = phi i64 [ 1, %.preheader112 ], [ %indvars.iv.next, %._crit_edge1 ]
  %5 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv.next6, i64 %indvars.iv3, i64 %indvars.iv
  %6 = load double, double* %5, align 8
  %7 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv5, i64 %indvars.iv3, i64 %indvars.iv
  %8 = load double, double* %7, align 8
  %9 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %3, i64 %indvars.iv3, i64 %indvars.iv
  %10 = load double, double* %9, align 8
  %11 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv5, i64 %indvars.iv.next4, i64 %indvars.iv
  %12 = load double, double* %11, align 8
  %13 = insertelement <2 x double> undef, double %8, i32 0
  %14 = shufflevector <2 x double> %13, <2 x double> undef, <2 x i32> zeroinitializer
  %15 = fmul <2 x double> %14, <double 2.000000e+00, double 2.000000e+00>
  %16 = insertelement <2 x double> undef, double %6, i32 0
  %17 = insertelement <2 x double> %16, double %12, i32 1
  %18 = fsub <2 x double> %17, %15
  %19 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv5, i64 %4, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = insertelement <2 x double> undef, double %10, i32 0
  %22 = insertelement <2 x double> %21, double %20, i32 1
  %23 = fadd <2 x double> %22, %18
  %24 = fmul <2 x double> %23, <double 1.250000e-01, double 1.250000e-01>
  %25 = extractelement <2 x double> %24, i32 0
  %26 = extractelement <2 x double> %24, i32 1
  %27 = fadd double %25, %26
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %28 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv5, i64 %indvars.iv3, i64 %indvars.iv.next
  %29 = load double, double* %28, align 8
  %30 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv5, i64 %indvars.iv3, i64 %indvars.iv
  %31 = load double, double* %30, align 8
  %32 = fmul double %31, 2.000000e+00
  %33 = fsub double %29, %32
  %34 = add nsw i64 %indvars.iv, -1
  %35 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv5, i64 %indvars.iv3, i64 %34
  %36 = load double, double* %35, align 8
  %37 = fadd double %36, %33
  %38 = fmul double %37, 1.250000e-01
  %39 = fadd double %27, %38
  %40 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv5, i64 %indvars.iv3, i64 %indvars.iv
  %41 = load double, double* %40, align 8
  %42 = fadd double %41, %39
  %43 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv5, i64 %indvars.iv3, i64 %indvars.iv
  store double %42, double* %43, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %._crit_edge, label %._crit_edge1

._crit_edge:                                      ; preds = %._crit_edge1
  %44 = icmp slt i64 %indvars.iv.next4, 119
  br i1 %44, label %.preheader112, label %._crit_edge120

._crit_edge120:                                   ; preds = %._crit_edge
  %45 = icmp slt i64 %indvars.iv.next6, 119
  br i1 %45, label %.preheader114, label %.preheader113.preheader

.preheader113.preheader:                          ; preds = %._crit_edge120
  br label %.preheader113

.preheader113:                                    ; preds = %.preheader113.preheader, %._crit_edge128
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %._crit_edge128 ], [ 1, %.preheader113.preheader ]
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %46 = add nsw i64 %indvars.iv9, -1
  br label %.preheader

.preheader:                                       ; preds = %._crit_edge125, %.preheader113
  %indvars.iv7 = phi i64 [ 1, %.preheader113 ], [ %indvars.iv.next8, %._crit_edge125 ]
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %47 = add nsw i64 %indvars.iv7, -1
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2, %.preheader
  %indvars.iv133 = phi i64 [ 1, %.preheader ], [ %indvars.iv.next134, %._crit_edge2 ]
  %48 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv.next10, i64 %indvars.iv7, i64 %indvars.iv133
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv9, i64 %indvars.iv7, i64 %indvars.iv133
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %46, i64 %indvars.iv7, i64 %indvars.iv133
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv9, i64 %indvars.iv.next8, i64 %indvars.iv133
  %55 = load double, double* %54, align 8
  %56 = insertelement <2 x double> undef, double %51, i32 0
  %57 = shufflevector <2 x double> %56, <2 x double> undef, <2 x i32> zeroinitializer
  %58 = fmul <2 x double> %57, <double 2.000000e+00, double 2.000000e+00>
  %59 = insertelement <2 x double> undef, double %49, i32 0
  %60 = insertelement <2 x double> %59, double %55, i32 1
  %61 = fsub <2 x double> %60, %58
  %62 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv9, i64 %47, i64 %indvars.iv133
  %63 = load double, double* %62, align 8
  %64 = insertelement <2 x double> undef, double %53, i32 0
  %65 = insertelement <2 x double> %64, double %63, i32 1
  %66 = fadd <2 x double> %65, %61
  %67 = fmul <2 x double> %66, <double 1.250000e-01, double 1.250000e-01>
  %68 = extractelement <2 x double> %67, i32 0
  %69 = extractelement <2 x double> %67, i32 1
  %70 = fadd double %68, %69
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %71 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv9, i64 %indvars.iv7, i64 %indvars.iv.next134
  %72 = load double, double* %71, align 8
  %73 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv9, i64 %indvars.iv7, i64 %indvars.iv133
  %74 = load double, double* %73, align 8
  %75 = fmul double %74, 2.000000e+00
  %76 = fsub double %72, %75
  %77 = add nsw i64 %indvars.iv133, -1
  %78 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv9, i64 %indvars.iv7, i64 %77
  %79 = load double, double* %78, align 8
  %80 = fadd double %79, %76
  %81 = fmul double %80, 1.250000e-01
  %82 = fadd double %70, %81
  %83 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv9, i64 %indvars.iv7, i64 %indvars.iv133
  %84 = load double, double* %83, align 8
  %85 = fadd double %84, %82
  %86 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv9, i64 %indvars.iv7, i64 %indvars.iv133
  store double %85, double* %86, align 8
  %exitcond135 = icmp eq i64 %indvars.iv.next134, 119
  br i1 %exitcond135, label %._crit_edge125, label %._crit_edge2

._crit_edge125:                                   ; preds = %._crit_edge2
  %87 = icmp slt i64 %indvars.iv.next8, 119
  br i1 %87, label %.preheader, label %._crit_edge128

._crit_edge128:                                   ; preds = %._crit_edge125
  %88 = icmp slt i64 %indvars.iv.next10, 119
  br i1 %88, label %.preheader113, label %._crit_edge131

._crit_edge131:                                   ; preds = %._crit_edge128
  %89 = add nuw nsw i32 %.0111132, 1
  %exitcond136 = icmp eq i32 %89, 501
  br i1 %exitcond136, label %90, label %.preheader116

; <label>:90:                                     ; preds = %._crit_edge131
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
  br label %.preheader20

.preheader20:                                     ; preds = %21, %1
  %indvars.iv4 = phi i64 [ 0, %1 ], [ %indvars.iv.next5, %21 ]
  %6 = mul nuw nsw i64 %indvars.iv4, 120
  br label %.preheader

.preheader:                                       ; preds = %19, %.preheader20
  %indvars.iv2 = phi i64 [ 0, %.preheader20 ], [ %indvars.iv.next3, %19 ]
  %7 = add i64 %indvars.iv2, %6
  %8 = mul i64 %7, 120
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %9 = add i64 %indvars.iv, %8
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %._crit_edge1
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge1, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv4, i64 %indvars.iv2, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %19, label %._crit_edge1

; <label>:19:                                     ; preds = %._crit_edge
  %indvars.iv.next3 = add nuw i64 %indvars.iv2, 1
  %20 = icmp slt i64 %indvars.iv.next3, 120
  br i1 %20, label %.preheader, label %21

; <label>:21:                                     ; preds = %19
  %indvars.iv.next5 = add nuw i64 %indvars.iv4, 1
  %22 = icmp slt i64 %indvars.iv.next5, 120
  br i1 %22, label %.preheader20, label %23

; <label>:23:                                     ; preds = %21
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %26) #5
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
