; ModuleID = 'A.ll'
source_filename = "heat-3d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
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
  tail call void @kernel_heat_3d(i32 500, i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %7 = icmp sgt i32 %0, 42
  br i1 %7, label %8, label %12

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %12

; <label>:11:                                     ; preds = %8
  tail call void @print_array(i32 120, [120 x [120 x double]]* %5)
  br label %12

; <label>:12:                                     ; preds = %8, %11, %2
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, [120 x [120 x double]]*, [120 x [120 x double]]*) #2 {
.preheader23.lr.ph:
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader23.lr.ph, %._crit_edge26.us
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %._crit_edge26.us ], [ 0, %.preheader23.lr.ph ]
  %3 = trunc i64 %indvars.iv41 to i32
  %4 = add i32 %3, 120
  br label %.preheader.us.us

._crit_edge26.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next42, 120
  br i1 %exitcond44, label %._crit_edge28, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv38 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next39, %._crit_edge.us.us ]
  %5 = trunc i64 %indvars.iv38 to i32
  %6 = add i32 %4, %5
  br label %.preheader.us.us.new

._crit_edge.us.us:                                ; preds = %.preheader.us.us.new
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond = icmp eq i64 %indvars.iv.next39, 120
  br i1 %exitcond, label %._crit_edge26.us, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us, %.preheader.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.us.new ], [ 0, %.preheader.us.us ]
  %7 = trunc i64 %indvars.iv to i32
  %8 = sub i32 %6, %7
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv41, i64 %indvars.iv38, i64 %indvars.iv
  %11 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv41, i64 %indvars.iv38, i64 %indvars.iv
  %12 = trunc i64 %indvars.iv to i32
  %13 = or i32 %12, 1
  %14 = sub i32 %6, %13
  %15 = sitofp i32 %14 to double
  %16 = insertelement <2 x double> undef, double %9, i32 0
  %17 = insertelement <2 x double> %16, double %15, i32 1
  %18 = fmul <2 x double> %17, <double 1.000000e+01, double 1.000000e+01>
  %19 = fdiv <2 x double> %18, <double 1.200000e+02, double 1.200000e+02>
  %20 = bitcast double* %10 to <2 x double>*
  %21 = bitcast double* %11 to <2 x double>*
  store <2 x double> %19, <2 x double>* %20, align 8
  store <2 x double> %19, <2 x double>* %21, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %._crit_edge.us.us, label %.preheader.us.us.new

._crit_edge28:                                    ; preds = %._crit_edge26.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_heat_3d(i32, i32, [120 x [120 x double]]*, [120 x [120 x double]]*) #2 {
  br label %.preheader116

.preheader116:                                    ; preds = %._crit_edge127, %4
  %.0111128 = phi i32 [ 1, %4 ], [ %87, %._crit_edge127 ]
  br label %.preheader114

.preheader114:                                    ; preds = %.preheader116, %._crit_edge119
  %indvars.iv133 = phi i64 [ %indvars.iv.next134, %._crit_edge119 ], [ 1, %.preheader116 ]
  %5 = add nuw nsw i64 %indvars.iv133, 1
  %6 = add nsw i64 %indvars.iv133, -1
  br label %.preheader112.us

.preheader112.us:                                 ; preds = %._crit_edge.us, %.preheader114
  %indvars.iv129 = phi i64 [ %indvars.iv.next130, %._crit_edge.us ], [ 1, %.preheader114 ]
  %indvars.iv.next130 = add nuw nsw i64 %indvars.iv129, 1
  %7 = add nsw i64 %indvars.iv129, -1
  br label %8

; <label>:8:                                      ; preds = %8, %.preheader112.us
  %indvars.iv = phi i64 [ 1, %.preheader112.us ], [ %indvars.iv.next, %8 ]
  %9 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %5, i64 %indvars.iv129, i64 %indvars.iv
  %10 = load double, double* %9, align 8
  %11 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %indvars.iv129, i64 %indvars.iv
  %12 = load double, double* %11, align 8
  %13 = fmul double %12, 2.000000e+00
  %14 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %6, i64 %indvars.iv129, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %indvars.iv.next130, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = insertelement <2 x double> undef, double %13, i32 0
  %19 = shufflevector <2 x double> %18, <2 x double> undef, <2 x i32> zeroinitializer
  %20 = insertelement <2 x double> undef, double %10, i32 0
  %21 = insertelement <2 x double> %20, double %17, i32 1
  %22 = fsub <2 x double> %21, %19
  %23 = extractelement <2 x double> %22, i32 0
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %7, i64 %indvars.iv
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
  %35 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %indvars.iv129, i64 %indvars.iv.next
  %36 = load double, double* %35, align 8
  %37 = fsub double %36, %13
  %38 = add nsw i64 %indvars.iv, -1
  %39 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv133, i64 %indvars.iv129, i64 %38
  %40 = load double, double* %39, align 8
  %41 = fadd double %37, %40
  %42 = fmul double %41, 1.250000e-01
  %43 = fadd double %34, %42
  %44 = fadd double %12, %43
  %45 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv133, i64 %indvars.iv129, i64 %indvars.iv
  store double %44, double* %45, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %._crit_edge.us, label %8

._crit_edge.us:                                   ; preds = %8
  %exitcond132 = icmp eq i64 %indvars.iv.next130, 119
  br i1 %exitcond132, label %._crit_edge119, label %.preheader112.us

._crit_edge119:                                   ; preds = %._crit_edge.us
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %exitcond136 = icmp eq i64 %indvars.iv.next134, 119
  br i1 %exitcond136, label %.preheader.lr.ph.preheader, label %.preheader114

.preheader.lr.ph.preheader:                       ; preds = %._crit_edge119
  br label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.preheader, %._crit_edge125
  %indvars.iv145 = phi i64 [ %indvars.iv.next146, %._crit_edge125 ], [ 1, %.preheader.lr.ph.preheader ]
  %46 = add nuw nsw i64 %indvars.iv145, 1
  %47 = add nsw i64 %indvars.iv145, -1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge123.us, %.preheader.lr.ph
  %indvars.iv141 = phi i64 [ %indvars.iv.next142, %._crit_edge123.us ], [ 1, %.preheader.lr.ph ]
  %indvars.iv.next142 = add nuw nsw i64 %indvars.iv141, 1
  %48 = add nsw i64 %indvars.iv141, -1
  br label %49

; <label>:49:                                     ; preds = %49, %.preheader.us
  %indvars.iv137 = phi i64 [ 1, %.preheader.us ], [ %indvars.iv.next138, %49 ]
  %50 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %46, i64 %indvars.iv141, i64 %indvars.iv137
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %indvars.iv141, i64 %indvars.iv137
  %53 = load double, double* %52, align 8
  %54 = fmul double %53, 2.000000e+00
  %55 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %47, i64 %indvars.iv141, i64 %indvars.iv137
  %56 = load double, double* %55, align 8
  %57 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %indvars.iv.next142, i64 %indvars.iv137
  %58 = load double, double* %57, align 8
  %59 = insertelement <2 x double> undef, double %54, i32 0
  %60 = shufflevector <2 x double> %59, <2 x double> undef, <2 x i32> zeroinitializer
  %61 = insertelement <2 x double> undef, double %51, i32 0
  %62 = insertelement <2 x double> %61, double %58, i32 1
  %63 = fsub <2 x double> %62, %60
  %64 = extractelement <2 x double> %63, i32 0
  %65 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %48, i64 %indvars.iv137
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
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %76 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %indvars.iv141, i64 %indvars.iv.next138
  %77 = load double, double* %76, align 8
  %78 = fsub double %77, %54
  %79 = add nsw i64 %indvars.iv137, -1
  %80 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv145, i64 %indvars.iv141, i64 %79
  %81 = load double, double* %80, align 8
  %82 = fadd double %78, %81
  %83 = fmul double %82, 1.250000e-01
  %84 = fadd double %75, %83
  %85 = fadd double %53, %84
  %86 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv145, i64 %indvars.iv141, i64 %indvars.iv137
  store double %85, double* %86, align 8
  %exitcond140 = icmp eq i64 %indvars.iv.next138, 119
  br i1 %exitcond140, label %._crit_edge123.us, label %49

._crit_edge123.us:                                ; preds = %49
  %exitcond144 = icmp eq i64 %indvars.iv.next142, 119
  br i1 %exitcond144, label %._crit_edge125, label %.preheader.us

._crit_edge125:                                   ; preds = %._crit_edge123.us
  %indvars.iv.next146 = add nuw nsw i64 %indvars.iv145, 1
  %exitcond148 = icmp eq i64 %indvars.iv.next146, 119
  br i1 %exitcond148, label %._crit_edge127, label %.preheader.lr.ph

._crit_edge127:                                   ; preds = %._crit_edge125
  %87 = add nuw nsw i32 %.0111128, 1
  %exitcond149 = icmp eq i32 %87, 501
  br i1 %exitcond149, label %88, label %.preheader116

; <label>:88:                                     ; preds = %._crit_edge127
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, [120 x [120 x double]]*) #0 {
.preheader20.lr.ph:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader20.lr.ph, %._crit_edge23.us
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge23.us ], [ 0, %.preheader20.lr.ph ]
  %6 = mul nsw i64 %indvars.iv39, 120
  br label %.preheader.us.us

._crit_edge23.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, 120
  br i1 %exitcond42, label %._crit_edge25, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv35 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next36, %._crit_edge.us.us ]
  %7 = add i64 %indvars.iv35, %6
  %8 = mul i64 %7, 120
  br label %9

._crit_edge.us.us:                                ; preds = %16
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next36, 120
  br i1 %exitcond38, label %._crit_edge23.us, label %.preheader.us.us

; <label>:9:                                      ; preds = %16, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %16 ], [ 0, %.preheader.us.us ]
  %10 = add i64 %indvars.iv, %8
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %16

; <label>:16:                                     ; preds = %14, %9
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv39, i64 %indvars.iv35, i64 %indvars.iv
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %._crit_edge.us.us, label %9

._crit_edge25:                                    ; preds = %._crit_edge23.us
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

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
