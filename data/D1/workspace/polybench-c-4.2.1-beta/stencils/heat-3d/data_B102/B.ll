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
  br i1 %9, label %10, label %15

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %3 to [120 x [120 x double]]*
  tail call fastcc void @print_array([120 x [120 x double]]* %14)
  br label %15

; <label>:15:                                     ; preds = %10, %13, %2
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  br label %.preheader23

.preheader23:                                     ; preds = %2, %28
  %.02226 = phi i32 [ 0, %2 ], [ %29, %28 ]
  %3 = add nuw i32 %.02226, 120
  %4 = sext i32 %.02226 to i64
  %5 = sext i32 %.02226 to i64
  br label %.preheader

.preheader:                                       ; preds = %.preheader23, %25
  %.02125 = phi i32 [ 0, %.preheader23 ], [ %26, %25 ]
  %6 = add nuw i32 %3, %.02125
  %7 = sext i32 %.02125 to i64
  %8 = sext i32 %.02125 to i64
  %9 = sext i32 %6 to i64
  br label %10

; <label>:10:                                     ; preds = %10, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %10 ]
  %11 = sub nuw nsw i64 %9, %indvars.iv
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = fmul double %13, 1.000000e+01
  %15 = fdiv double %14, 1.200000e+02
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %4, i64 %7, i64 %indvars.iv
  store double %15, double* %16, align 8
  %17 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %5, i64 %8, i64 %indvars.iv
  store double %15, double* %17, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %18 = sub nuw nsw i64 %9, %indvars.iv.next
  %19 = trunc i64 %18 to i32
  %20 = sitofp i32 %19 to double
  %21 = fmul double %20, 1.000000e+01
  %22 = fdiv double %21, 1.200000e+02
  %23 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %4, i64 %7, i64 %indvars.iv.next
  store double %22, double* %23, align 8
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %5, i64 %8, i64 %indvars.iv.next
  store double %22, double* %24, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %25, label %10

; <label>:25:                                     ; preds = %10
  %26 = add nsw i32 %.02125, 1
  %27 = icmp slt i32 %26, 120
  br i1 %27, label %.preheader, label %28

; <label>:28:                                     ; preds = %25
  %29 = add nsw i32 %.02226, 1
  %30 = icmp slt i32 %29, 120
  br i1 %30, label %.preheader23, label %31

; <label>:31:                                     ; preds = %28
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d([120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #2 {
  br label %.preheader116

.preheader116:                                    ; preds = %._crit_edge131, %2
  %.0111132 = phi i32 [ 1, %2 ], [ %147, %._crit_edge131 ]
  br label %.preheader114

.preheader114:                                    ; preds = %.preheader116, %._crit_edge120
  %.0109121 = phi i32 [ 1, %.preheader116 ], [ %73, %._crit_edge120 ]
  %3 = add nuw nsw i32 %.0109121, 1
  %4 = sext i32 %3 to i64
  %5 = sext i32 %.0109121 to i64
  %6 = add nsw i32 %.0109121, -1
  %7 = sext i32 %6 to i64
  %8 = sext i32 %.0109121 to i64
  %9 = sext i32 %.0109121 to i64
  %10 = sext i32 %.0109121 to i64
  %11 = sext i32 %.0109121 to i64
  %12 = sext i32 %.0109121 to i64
  %13 = sext i32 %.0109121 to i64
  %14 = sext i32 %.0109121 to i64
  %15 = sext i32 %.0109121 to i64
  br label %.preheader112

.preheader112:                                    ; preds = %.preheader114, %._crit_edge
  %.0107118 = phi i32 [ 1, %.preheader114 ], [ %71, %._crit_edge ]
  %16 = sext i32 %.0107118 to i64
  %17 = sext i32 %.0107118 to i64
  %18 = sext i32 %.0107118 to i64
  %19 = add nuw nsw i32 %.0107118, 1
  %20 = sext i32 %19 to i64
  %21 = sext i32 %.0107118 to i64
  %22 = add nsw i32 %.0107118, -1
  %23 = sext i32 %22 to i64
  %24 = sext i32 %.0107118 to i64
  %25 = sext i32 %.0107118 to i64
  %26 = sext i32 %.0107118 to i64
  %27 = sext i32 %.0107118 to i64
  %28 = sext i32 %.0107118 to i64
  br label %29

; <label>:29:                                     ; preds = %29, %.preheader112
  %indvars.iv = phi i64 [ 1, %.preheader112 ], [ %indvars.iv.next, %29 ]
  %30 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %4, i64 %16, i64 %indvars.iv
  %31 = load double, double* %30, align 8
  %32 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %5, i64 %17, i64 %indvars.iv
  %33 = load double, double* %32, align 8
  %34 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %7, i64 %18, i64 %indvars.iv
  %35 = load double, double* %34, align 8
  %36 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %8, i64 %20, i64 %indvars.iv
  %37 = load double, double* %36, align 8
  %38 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %9, i64 %21, i64 %indvars.iv
  %39 = load double, double* %38, align 8
  %40 = insertelement <2 x double> undef, double %33, i32 0
  %41 = insertelement <2 x double> %40, double %39, i32 1
  %42 = fmul <2 x double> %41, <double 2.000000e+00, double 2.000000e+00>
  %43 = insertelement <2 x double> undef, double %31, i32 0
  %44 = insertelement <2 x double> %43, double %37, i32 1
  %45 = fsub <2 x double> %44, %42
  %46 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %10, i64 %23, i64 %indvars.iv
  %47 = load double, double* %46, align 8
  %48 = insertelement <2 x double> undef, double %35, i32 0
  %49 = insertelement <2 x double> %48, double %47, i32 1
  %50 = fadd <2 x double> %49, %45
  %51 = fmul <2 x double> %50, <double 1.250000e-01, double 1.250000e-01>
  %52 = extractelement <2 x double> %51, i32 0
  %53 = extractelement <2 x double> %51, i32 1
  %54 = fadd double %52, %53
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %55 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %11, i64 %24, i64 %indvars.iv.next
  %56 = load double, double* %55, align 8
  %57 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %12, i64 %25, i64 %indvars.iv
  %58 = load double, double* %57, align 8
  %59 = fmul double %58, 2.000000e+00
  %60 = fsub double %56, %59
  %61 = add nsw i64 %indvars.iv, -1
  %62 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %13, i64 %26, i64 %61
  %63 = load double, double* %62, align 8
  %64 = fadd double %63, %60
  %65 = fmul double %64, 1.250000e-01
  %66 = fadd double %54, %65
  %67 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %14, i64 %27, i64 %indvars.iv
  %68 = load double, double* %67, align 8
  %69 = fadd double %68, %66
  %70 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %15, i64 %28, i64 %indvars.iv
  store double %69, double* %70, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %._crit_edge, label %29

._crit_edge:                                      ; preds = %29
  %71 = add nsw i32 %.0107118, 1
  %72 = icmp slt i32 %71, 119
  br i1 %72, label %.preheader112, label %._crit_edge120

._crit_edge120:                                   ; preds = %._crit_edge
  %73 = add nsw i32 %.0109121, 1
  %74 = icmp slt i32 %73, 119
  br i1 %74, label %.preheader114, label %.preheader113.preheader

.preheader113.preheader:                          ; preds = %._crit_edge120
  br label %.preheader113

.preheader113:                                    ; preds = %.preheader113.preheader, %._crit_edge128
  %.1110129 = phi i32 [ %145, %._crit_edge128 ], [ 1, %.preheader113.preheader ]
  %75 = add nuw nsw i32 %.1110129, 1
  %76 = sext i32 %75 to i64
  %77 = sext i32 %.1110129 to i64
  %78 = add nsw i32 %.1110129, -1
  %79 = sext i32 %78 to i64
  %80 = sext i32 %.1110129 to i64
  %81 = sext i32 %.1110129 to i64
  %82 = sext i32 %.1110129 to i64
  %83 = sext i32 %.1110129 to i64
  %84 = sext i32 %.1110129 to i64
  %85 = sext i32 %.1110129 to i64
  %86 = sext i32 %.1110129 to i64
  %87 = sext i32 %.1110129 to i64
  br label %.preheader

.preheader:                                       ; preds = %.preheader113, %._crit_edge125
  %.1108126 = phi i32 [ 1, %.preheader113 ], [ %143, %._crit_edge125 ]
  %88 = sext i32 %.1108126 to i64
  %89 = sext i32 %.1108126 to i64
  %90 = sext i32 %.1108126 to i64
  %91 = add nuw nsw i32 %.1108126, 1
  %92 = sext i32 %91 to i64
  %93 = sext i32 %.1108126 to i64
  %94 = add nsw i32 %.1108126, -1
  %95 = sext i32 %94 to i64
  %96 = sext i32 %.1108126 to i64
  %97 = sext i32 %.1108126 to i64
  %98 = sext i32 %.1108126 to i64
  %99 = sext i32 %.1108126 to i64
  %100 = sext i32 %.1108126 to i64
  br label %101

; <label>:101:                                    ; preds = %101, %.preheader
  %indvars.iv133 = phi i64 [ 1, %.preheader ], [ %indvars.iv.next134, %101 ]
  %102 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %76, i64 %88, i64 %indvars.iv133
  %103 = load double, double* %102, align 8
  %104 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %77, i64 %89, i64 %indvars.iv133
  %105 = load double, double* %104, align 8
  %106 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %79, i64 %90, i64 %indvars.iv133
  %107 = load double, double* %106, align 8
  %108 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %80, i64 %92, i64 %indvars.iv133
  %109 = load double, double* %108, align 8
  %110 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %81, i64 %93, i64 %indvars.iv133
  %111 = load double, double* %110, align 8
  %112 = insertelement <2 x double> undef, double %105, i32 0
  %113 = insertelement <2 x double> %112, double %111, i32 1
  %114 = fmul <2 x double> %113, <double 2.000000e+00, double 2.000000e+00>
  %115 = insertelement <2 x double> undef, double %103, i32 0
  %116 = insertelement <2 x double> %115, double %109, i32 1
  %117 = fsub <2 x double> %116, %114
  %118 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %82, i64 %95, i64 %indvars.iv133
  %119 = load double, double* %118, align 8
  %120 = insertelement <2 x double> undef, double %107, i32 0
  %121 = insertelement <2 x double> %120, double %119, i32 1
  %122 = fadd <2 x double> %121, %117
  %123 = fmul <2 x double> %122, <double 1.250000e-01, double 1.250000e-01>
  %124 = extractelement <2 x double> %123, i32 0
  %125 = extractelement <2 x double> %123, i32 1
  %126 = fadd double %124, %125
  %indvars.iv.next134 = add nuw nsw i64 %indvars.iv133, 1
  %127 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %83, i64 %96, i64 %indvars.iv.next134
  %128 = load double, double* %127, align 8
  %129 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %84, i64 %97, i64 %indvars.iv133
  %130 = load double, double* %129, align 8
  %131 = fmul double %130, 2.000000e+00
  %132 = fsub double %128, %131
  %133 = add nsw i64 %indvars.iv133, -1
  %134 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %85, i64 %98, i64 %133
  %135 = load double, double* %134, align 8
  %136 = fadd double %135, %132
  %137 = fmul double %136, 1.250000e-01
  %138 = fadd double %126, %137
  %139 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %86, i64 %99, i64 %indvars.iv133
  %140 = load double, double* %139, align 8
  %141 = fadd double %140, %138
  %142 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %87, i64 %100, i64 %indvars.iv133
  store double %141, double* %142, align 8
  %exitcond135 = icmp eq i64 %indvars.iv.next134, 119
  br i1 %exitcond135, label %._crit_edge125, label %101

._crit_edge125:                                   ; preds = %101
  %143 = add nsw i32 %.1108126, 1
  %144 = icmp slt i32 %143, 119
  br i1 %144, label %.preheader, label %._crit_edge128

._crit_edge128:                                   ; preds = %._crit_edge125
  %145 = add nsw i32 %.1110129, 1
  %146 = icmp slt i32 %145, 119
  br i1 %146, label %.preheader113, label %._crit_edge131

._crit_edge131:                                   ; preds = %._crit_edge128
  %147 = add nuw nsw i32 %.0111132, 1
  %exitcond136 = icmp eq i32 %147, 501
  br i1 %exitcond136, label %148, label %.preheader116

; <label>:148:                                    ; preds = %._crit_edge131
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([120 x [120 x double]]*) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
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

; <label>:19:                                     ; preds = %12, %17
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %7, i64 %10, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %22) #5
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
  %32 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %34 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %33) #5
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
