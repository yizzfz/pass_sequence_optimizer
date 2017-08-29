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
  %3 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1728000, i32 8) #3
  %5 = bitcast i8* %3 to [120 x [120 x double]]*
  %6 = bitcast i8* %4 to [120 x [120 x double]]*
  tail call fastcc void @init_array([120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_start() #3
  %7 = bitcast i8* %3 to [120 x [120 x double]]*
  %8 = bitcast i8* %4 to [120 x [120 x double]]*
  tail call fastcc void @kernel_heat_3d([120 x [120 x double]]* %7, [120 x [120 x double]]* %8)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
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
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #0 {
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
  %14 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %4, i64 %7, i64 %indvars.iv
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

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_heat_3d([120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #0 {
  br label %.preheader116

.preheader116:                                    ; preds = %151, %2
  %.0111123 = phi i32 [ 1, %2 ], [ %152, %151 ]
  br label %.preheader114

.preheader114:                                    ; preds = %.preheader116, %74
  %.0109119 = phi i32 [ 1, %.preheader116 ], [ %75, %74 ]
  %3 = add nuw nsw i32 %.0109119, 1
  %4 = sext i32 %3 to i64
  %5 = sext i32 %.0109119 to i64
  %6 = add nsw i32 %.0109119, -1
  %7 = sext i32 %6 to i64
  %8 = sext i32 %.0109119 to i64
  %9 = sext i32 %.0109119 to i64
  %10 = sext i32 %.0109119 to i64
  %11 = sext i32 %.0109119 to i64
  %12 = sext i32 %.0109119 to i64
  %13 = sext i32 %.0109119 to i64
  %14 = sext i32 %.0109119 to i64
  %15 = sext i32 %.0109119 to i64
  br label %.preheader112

.preheader112:                                    ; preds = %.preheader114, %71
  %.0107118 = phi i32 [ 1, %.preheader114 ], [ %72, %71 ]
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
  br i1 %exitcond, label %71, label %29

; <label>:71:                                     ; preds = %29
  %72 = add nsw i32 %.0107118, 1
  %73 = icmp slt i32 %72, 119
  br i1 %73, label %.preheader112, label %74

; <label>:74:                                     ; preds = %71
  %75 = add nsw i32 %.0109119, 1
  %76 = icmp slt i32 %75, 119
  br i1 %76, label %.preheader114, label %.preheader113.preheader

.preheader113.preheader:                          ; preds = %74
  br label %.preheader113

.preheader113:                                    ; preds = %.preheader113.preheader, %148
  %.1110122 = phi i32 [ %149, %148 ], [ 1, %.preheader113.preheader ]
  %77 = add nuw nsw i32 %.1110122, 1
  %78 = sext i32 %77 to i64
  %79 = sext i32 %.1110122 to i64
  %80 = add nsw i32 %.1110122, -1
  %81 = sext i32 %80 to i64
  %82 = sext i32 %.1110122 to i64
  %83 = sext i32 %.1110122 to i64
  %84 = sext i32 %.1110122 to i64
  %85 = sext i32 %.1110122 to i64
  %86 = sext i32 %.1110122 to i64
  %87 = sext i32 %.1110122 to i64
  %88 = sext i32 %.1110122 to i64
  %89 = sext i32 %.1110122 to i64
  br label %.preheader

.preheader:                                       ; preds = %.preheader113, %145
  %.1108121 = phi i32 [ 1, %.preheader113 ], [ %146, %145 ]
  %90 = sext i32 %.1108121 to i64
  %91 = sext i32 %.1108121 to i64
  %92 = sext i32 %.1108121 to i64
  %93 = add nuw nsw i32 %.1108121, 1
  %94 = sext i32 %93 to i64
  %95 = sext i32 %.1108121 to i64
  %96 = add nsw i32 %.1108121, -1
  %97 = sext i32 %96 to i64
  %98 = sext i32 %.1108121 to i64
  %99 = sext i32 %.1108121 to i64
  %100 = sext i32 %.1108121 to i64
  %101 = sext i32 %.1108121 to i64
  %102 = sext i32 %.1108121 to i64
  br label %103

; <label>:103:                                    ; preds = %103, %.preheader
  %indvars.iv1 = phi i64 [ 1, %.preheader ], [ %indvars.iv.next2, %103 ]
  %104 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %78, i64 %90, i64 %indvars.iv1
  %105 = load double, double* %104, align 8
  %106 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %79, i64 %91, i64 %indvars.iv1
  %107 = load double, double* %106, align 8
  %108 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %81, i64 %92, i64 %indvars.iv1
  %109 = load double, double* %108, align 8
  %110 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %82, i64 %94, i64 %indvars.iv1
  %111 = load double, double* %110, align 8
  %112 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %83, i64 %95, i64 %indvars.iv1
  %113 = load double, double* %112, align 8
  %114 = insertelement <2 x double> undef, double %107, i32 0
  %115 = insertelement <2 x double> %114, double %113, i32 1
  %116 = fmul <2 x double> %115, <double 2.000000e+00, double 2.000000e+00>
  %117 = insertelement <2 x double> undef, double %105, i32 0
  %118 = insertelement <2 x double> %117, double %111, i32 1
  %119 = fsub <2 x double> %118, %116
  %120 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %84, i64 %97, i64 %indvars.iv1
  %121 = load double, double* %120, align 8
  %122 = insertelement <2 x double> undef, double %109, i32 0
  %123 = insertelement <2 x double> %122, double %121, i32 1
  %124 = fadd <2 x double> %123, %119
  %125 = fmul <2 x double> %124, <double 1.250000e-01, double 1.250000e-01>
  %126 = extractelement <2 x double> %125, i32 0
  %127 = extractelement <2 x double> %125, i32 1
  %128 = fadd double %126, %127
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %129 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %85, i64 %98, i64 %indvars.iv.next2
  %130 = load double, double* %129, align 8
  %131 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %86, i64 %99, i64 %indvars.iv1
  %132 = load double, double* %131, align 8
  %133 = fmul double %132, 2.000000e+00
  %134 = fsub double %130, %133
  %135 = add nsw i64 %indvars.iv1, -1
  %136 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %87, i64 %100, i64 %135
  %137 = load double, double* %136, align 8
  %138 = fadd double %137, %134
  %139 = fmul double %138, 1.250000e-01
  %140 = fadd double %128, %139
  %141 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %88, i64 %101, i64 %indvars.iv1
  %142 = load double, double* %141, align 8
  %143 = fadd double %142, %140
  %144 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %89, i64 %102, i64 %indvars.iv1
  store double %143, double* %144, align 8
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 119
  br i1 %exitcond3, label %145, label %103

; <label>:145:                                    ; preds = %103
  %146 = add nsw i32 %.1108121, 1
  %147 = icmp slt i32 %146, 119
  br i1 %147, label %.preheader, label %148

; <label>:148:                                    ; preds = %145
  %149 = add nsw i32 %.1110122, 1
  %150 = icmp slt i32 %149, 119
  br i1 %150, label %.preheader113, label %151

; <label>:151:                                    ; preds = %148
  %152 = add nuw nsw i32 %.0111123, 1
  %exitcond4 = icmp eq i32 %152, 501
  br i1 %exitcond4, label %153, label %.preheader116

; <label>:153:                                    ; preds = %151
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([120 x [120 x double]]*) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader20

.preheader20:                                     ; preds = %1, %27
  %.01923 = phi i32 [ 0, %1 ], [ %28, %27 ]
  %6 = mul nuw i32 %.01923, 14400
  %7 = sext i32 %.01923 to i64
  br label %.preheader

.preheader:                                       ; preds = %.preheader20, %24
  %.01822 = phi i32 [ 0, %.preheader20 ], [ %25, %24 ]
  %8 = mul nuw nsw i32 %.01822, 120
  %9 = add nuw nsw i32 %8, %6
  %10 = sext i32 %.01822 to i64
  %11 = zext i32 %9 to i64
  br label %12

; <label>:12:                                     ; preds = %19, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %19 ]
  %13 = add i64 %11, %indvars.iv
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #4
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
  %34 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %33) #4
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
