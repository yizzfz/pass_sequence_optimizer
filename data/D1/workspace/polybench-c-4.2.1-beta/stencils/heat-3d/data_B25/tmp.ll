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
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #4
  %5 = bitcast i8* %3 to [120 x [120 x double]]*
  %6 = bitcast i8* %4 to [120 x [120 x double]]*
  tail call void @init_array([120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_heat_3d([120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
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
  tail call void @print_array([120 x [120 x double]]* %12)
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %2, %11
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array([120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) #2 {
.preheader23.lr.ph:
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %._crit_edge26.us, %.preheader23.lr.ph
  %indvars.iv41 = phi i64 [ 0, %.preheader23.lr.ph ], [ %indvars.iv.next42, %._crit_edge26.us ]
  %2 = trunc i64 %indvars.iv41 to i32
  %3 = add i32 %2, 120
  br label %.preheader.us.us

._crit_edge26.us:                                 ; preds = %.preheader.us.us.new.._crit_edge.us.us_crit_edge
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next42, 120
  br i1 %exitcond44, label %._crit_edge28, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %.preheader.us.us.new.._crit_edge.us.us_crit_edge, %.preheader.us.us.preheader
  %indvars.iv38 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next39, %.preheader.us.us.new.._crit_edge.us.us_crit_edge ]
  %4 = trunc i64 %indvars.iv38 to i32
  %5 = add i32 %3, %4
  br label %.preheader.us.us.new

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new, %.preheader.us.us
  %indvars.iv = phi i64 [ 0, %.preheader.us.us ], [ %indvars.iv.next.1, %.preheader.us.us.new ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = sub i32 %5, %6
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv41, i64 %indvars.iv38, i64 %indvars.iv
  %10 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv41, i64 %indvars.iv38, i64 %indvars.iv
  %11 = trunc i64 %indvars.iv to i32
  %12 = or i32 %11, 1
  %13 = sub i32 %5, %12
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %8, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fmul <2 x double> %16, <double 1.000000e+01, double 1.000000e+01>
  %18 = fdiv <2 x double> %17, <double 1.200000e+02, double 1.200000e+02>
  %19 = bitcast double* %9 to <2 x double>*
  %20 = bitcast double* %10 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  store <2 x double> %18, <2 x double>* %20, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %.preheader.us.us.new.._crit_edge.us.us_crit_edge, label %.preheader.us.us.new

.preheader.us.us.new.._crit_edge.us.us_crit_edge: ; preds = %.preheader.us.us.new
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond = icmp eq i64 %indvars.iv.next39, 120
  br i1 %exitcond, label %._crit_edge26.us, label %.preheader.us.us

._crit_edge28:                                    ; preds = %._crit_edge26.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_heat_3d([120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) #2 {
  br label %.preheader114.preheader

.preheader114.preheader:                          ; preds = %2, %._crit_edge127
  %.0111128 = phi i32 [ 1, %2 ], [ %83, %._crit_edge127 ]
  br label %.preheader112.lr.ph

.preheader112.lr.ph:                              ; preds = %._crit_edge119, %.preheader114.preheader
  %indvars.iv133 = phi i64 [ %indvars.iv.next134, %._crit_edge119 ], [ 1, %.preheader114.preheader ]
  %3 = add nuw nsw i64 %indvars.iv133, 1
  %4 = add nsw i64 %indvars.iv133, -1
  br label %.preheader112.us

.preheader112.us:                                 ; preds = %._crit_edge.us, %.preheader112.lr.ph
  %indvars.iv129 = phi i64 [ 1, %.preheader112.lr.ph ], [ %indvars.iv.next130, %._crit_edge.us ]
  %indvars.iv.next130 = add nuw nsw i64 %indvars.iv129, 1
  %5 = add nsw i64 %indvars.iv129, -1
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader112.us
  %indvars.iv = phi i64 [ 1, %.preheader112.us ], [ %indvars.iv.next, %._crit_edge ]
  %6 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %3, i64 %indvars.iv129, i64 %indvars.iv
  %7 = load double, double* %6, align 8
  %8 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv133, i64 %indvars.iv129, i64 %indvars.iv
  %9 = load double, double* %8, align 8
  %10 = fmul double %9, 2.000000e+00
  %11 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %4, i64 %indvars.iv129, i64 %indvars.iv
  %12 = load double, double* %11, align 8
  %13 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv133, i64 %indvars.iv.next130, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = insertelement <2 x double> undef, double %10, i32 0
  %16 = shufflevector <2 x double> %15, <2 x double> undef, <2 x i32> zeroinitializer
  %17 = insertelement <2 x double> undef, double %7, i32 0
  %18 = insertelement <2 x double> %17, double %14, i32 1
  %19 = fsub <2 x double> %18, %16
  %20 = extractelement <2 x double> %19, i32 0
  %21 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv133, i64 %5, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = insertelement <2 x double> undef, double %20, i32 0
  %24 = insertelement <2 x double> %23, double %22, i32 1
  %25 = insertelement <2 x double> undef, double %12, i32 0
  %26 = shufflevector <2 x double> %25, <2 x double> %19, <2 x i32> <i32 0, i32 3>
  %27 = fadd <2 x double> %26, %24
  %28 = fmul <2 x double> %27, <double 1.250000e-01, double 1.250000e-01>
  %29 = extractelement <2 x double> %28, i32 0
  %30 = extractelement <2 x double> %28, i32 1
  %31 = fadd double %29, %30
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %32 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv133, i64 %indvars.iv129, i64 %indvars.iv.next
  %33 = load double, double* %32, align 8
  %34 = fsub double %33, %10
  %35 = add nsw i64 %indvars.iv, -1
  %36 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv133, i64 %indvars.iv129, i64 %35
  %37 = load double, double* %36, align 8
  %38 = fadd double %34, %37
  %39 = fmul double %38, 1.250000e-01
  %40 = fadd double %31, %39
  %41 = fadd double %9, %40
  %42 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv133, i64 %indvars.iv129, i64 %indvars.iv
  store double %41, double* %42, align 8
  %exitcond151 = icmp eq i64 %indvars.iv, 118
  br i1 %exitcond151, label %._crit_edge.us, label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %exitcond132 = icmp eq i64 %indvars.iv.next130, 119
  br i1 %exitcond132, label %._crit_edge119, label %.preheader112.us

._crit_edge119:                                   ; preds = %._crit_edge.us
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %exitcond136 = icmp eq i64 %indvars.iv.next134, 119
  br i1 %exitcond136, label %.preheader.lr.ph.preheader, label %.preheader112.lr.ph

.preheader.lr.ph.preheader:                       ; preds = %._crit_edge119
  br label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.preheader, %._crit_edge125
  %indvars.iv145 = phi i64 [ %indvars.iv.next146, %._crit_edge125 ], [ 1, %.preheader.lr.ph.preheader ]
  %43 = add nuw nsw i64 %indvars.iv145, 1
  %44 = add nsw i64 %indvars.iv145, -1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge123.us, %.preheader.lr.ph
  %indvars.iv141 = phi i64 [ 1, %.preheader.lr.ph ], [ %indvars.iv.next142, %._crit_edge123.us ]
  %indvars.iv.next142 = add nuw nsw i64 %indvars.iv141, 1
  %45 = add nsw i64 %indvars.iv141, -1
  br label %._crit_edge150

._crit_edge150:                                   ; preds = %._crit_edge150, %.preheader.us
  %indvars.iv137 = phi i64 [ 1, %.preheader.us ], [ %indvars.iv.next138, %._crit_edge150 ]
  %46 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %43, i64 %indvars.iv141, i64 %indvars.iv137
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv145, i64 %indvars.iv141, i64 %indvars.iv137
  %49 = load double, double* %48, align 8
  %50 = fmul double %49, 2.000000e+00
  %51 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %44, i64 %indvars.iv141, i64 %indvars.iv137
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv145, i64 %indvars.iv.next142, i64 %indvars.iv137
  %54 = load double, double* %53, align 8
  %55 = insertelement <2 x double> undef, double %50, i32 0
  %56 = shufflevector <2 x double> %55, <2 x double> undef, <2 x i32> zeroinitializer
  %57 = insertelement <2 x double> undef, double %47, i32 0
  %58 = insertelement <2 x double> %57, double %54, i32 1
  %59 = fsub <2 x double> %58, %56
  %60 = extractelement <2 x double> %59, i32 0
  %61 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv145, i64 %45, i64 %indvars.iv137
  %62 = load double, double* %61, align 8
  %63 = insertelement <2 x double> undef, double %60, i32 0
  %64 = insertelement <2 x double> %63, double %62, i32 1
  %65 = insertelement <2 x double> undef, double %52, i32 0
  %66 = shufflevector <2 x double> %65, <2 x double> %59, <2 x i32> <i32 0, i32 3>
  %67 = fadd <2 x double> %66, %64
  %68 = fmul <2 x double> %67, <double 1.250000e-01, double 1.250000e-01>
  %69 = extractelement <2 x double> %68, i32 0
  %70 = extractelement <2 x double> %68, i32 1
  %71 = fadd double %69, %70
  %indvars.iv.next138 = add nuw nsw i64 %indvars.iv137, 1
  %72 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv145, i64 %indvars.iv141, i64 %indvars.iv.next138
  %73 = load double, double* %72, align 8
  %74 = fsub double %73, %50
  %75 = add nsw i64 %indvars.iv137, -1
  %76 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv145, i64 %indvars.iv141, i64 %75
  %77 = load double, double* %76, align 8
  %78 = fadd double %74, %77
  %79 = fmul double %78, 1.250000e-01
  %80 = fadd double %71, %79
  %81 = fadd double %49, %80
  %82 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv145, i64 %indvars.iv141, i64 %indvars.iv137
  store double %81, double* %82, align 8
  %exitcond = icmp eq i64 %indvars.iv137, 118
  br i1 %exitcond, label %._crit_edge123.us, label %._crit_edge150

._crit_edge123.us:                                ; preds = %._crit_edge150
  %exitcond144 = icmp eq i64 %indvars.iv.next142, 119
  br i1 %exitcond144, label %._crit_edge125, label %.preheader.us

._crit_edge125:                                   ; preds = %._crit_edge123.us
  %indvars.iv.next146 = add nuw nsw i64 %indvars.iv145, 1
  %exitcond148 = icmp eq i64 %indvars.iv.next146, 119
  br i1 %exitcond148, label %._crit_edge127, label %.preheader.lr.ph

._crit_edge127:                                   ; preds = %._crit_edge125
  %83 = add nuw nsw i32 %.0111128, 1
  %exitcond149 = icmp eq i32 %83, 501
  br i1 %exitcond149, label %84, label %.preheader114.preheader

; <label>:84:                                     ; preds = %._crit_edge127
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([120 x [120 x double]]* nocapture readonly) #0 {
.preheader20.lr.ph:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %._crit_edge23.us, %.preheader20.lr.ph
  %indvars.iv39 = phi i64 [ 0, %.preheader20.lr.ph ], [ %indvars.iv.next40, %._crit_edge23.us ]
  %5 = mul nsw i64 %indvars.iv39, 120
  br label %.preheader.us.us

._crit_edge23.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next40, 120
  br i1 %exitcond42, label %._crit_edge25, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv35 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next36, %._crit_edge.us.us ]
  %6 = add i64 %indvars.iv35, %5
  %7 = mul i64 %6, 120
  br label %._crit_edge43

._crit_edge.us.us:                                ; preds = %._crit_edge
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next36, 120
  br i1 %exitcond38, label %._crit_edge23.us, label %.preheader.us.us

._crit_edge43:                                    ; preds = %._crit_edge, %.preheader.us.us
  %indvars.iv = phi i64 [ 0, %.preheader.us.us ], [ %indvars.iv.next, %._crit_edge ]
  %8 = add i64 %indvars.iv, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge43
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge43, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv39, i64 %indvars.iv35, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %._crit_edge.us.us, label %._crit_edge43

._crit_edge25:                                    ; preds = %._crit_edge23.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
