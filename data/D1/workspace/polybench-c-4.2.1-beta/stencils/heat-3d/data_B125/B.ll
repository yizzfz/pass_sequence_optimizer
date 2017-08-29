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
  br label %._crit_edge

._crit_edge:                                      ; preds = %27, %2
  %.02226 = phi i32 [ 0, %2 ], [ %28, %27 ]
  %3 = add nuw i32 %.02226, 120
  %4 = sext i32 %.02226 to i64
  %5 = sext i32 %.02226 to i64
  br label %._crit_edge23

._crit_edge23:                                    ; preds = %24, %._crit_edge
  %.02125 = phi i32 [ 0, %._crit_edge ], [ %25, %24 ]
  %6 = add nuw i32 %3, %.02125
  %7 = sext i32 %.02125 to i64
  %8 = sext i32 %.02125 to i64
  %9 = sext i32 %6 to i64
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2, %._crit_edge23
  %indvars.iv = phi i64 [ 0, %._crit_edge23 ], [ %indvars.iv.next.1, %._crit_edge2 ]
  %10 = sub nuw nsw i64 %9, %indvars.iv
  %11 = trunc i64 %10 to i32
  %12 = sitofp i32 %11 to double
  %13 = fmul double %12, 1.000000e+01
  %14 = fdiv double %13, 1.200000e+02
  %15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %4, i64 %7, i64 %indvars.iv
  store double %14, double* %15, align 8
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %5, i64 %8, i64 %indvars.iv
  store double %14, double* %16, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %17 = sub nuw nsw i64 %9, %indvars.iv.next
  %18 = trunc i64 %17 to i32
  %19 = sitofp i32 %18 to double
  %20 = fmul double %19, 1.000000e+01
  %21 = fdiv double %20, 1.200000e+02
  %22 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %4, i64 %7, i64 %indvars.iv.next
  store double %21, double* %22, align 8
  %23 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %5, i64 %8, i64 %indvars.iv.next
  store double %21, double* %23, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %24, label %._crit_edge2

; <label>:24:                                     ; preds = %._crit_edge2
  %25 = add nsw i32 %.02125, 1
  %26 = icmp slt i32 %25, 120
  br i1 %26, label %._crit_edge23, label %27

; <label>:27:                                     ; preds = %24
  %28 = add nsw i32 %.02226, 1
  %29 = icmp slt i32 %28, 120
  br i1 %29, label %._crit_edge, label %30

; <label>:30:                                     ; preds = %27
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d([120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge132, %2
  %.0111133 = phi i32 [ 1, %2 ], [ %145, %._crit_edge132 ]
  br label %._crit_edge112

._crit_edge112:                                   ; preds = %._crit_edge121, %._crit_edge
  %.0109122 = phi i32 [ 1, %._crit_edge ], [ %72, %._crit_edge121 ]
  %3 = add nuw nsw i32 %.0109122, 1
  %4 = sext i32 %3 to i64
  %5 = sext i32 %.0109122 to i64
  %6 = add nsw i32 %.0109122, -1
  %7 = sext i32 %6 to i64
  %8 = sext i32 %.0109122 to i64
  %9 = sext i32 %.0109122 to i64
  %10 = sext i32 %.0109122 to i64
  %11 = sext i32 %.0109122 to i64
  %12 = sext i32 %.0109122 to i64
  %13 = sext i32 %.0109122 to i64
  %14 = sext i32 %.0109122 to i64
  %15 = sext i32 %.0109122 to i64
  br label %._crit_edge114

._crit_edge114:                                   ; preds = %._crit_edge118, %._crit_edge112
  %.0107119 = phi i32 [ 1, %._crit_edge112 ], [ %70, %._crit_edge118 ]
  %16 = sext i32 %.0107119 to i64
  %17 = sext i32 %.0107119 to i64
  %18 = sext i32 %.0107119 to i64
  %19 = add nuw nsw i32 %.0107119, 1
  %20 = sext i32 %19 to i64
  %21 = sext i32 %.0107119 to i64
  %22 = add nsw i32 %.0107119, -1
  %23 = sext i32 %22 to i64
  %24 = sext i32 %.0107119 to i64
  %25 = sext i32 %.0107119 to i64
  %26 = sext i32 %.0107119 to i64
  %27 = sext i32 %.0107119 to i64
  %28 = sext i32 %.0107119 to i64
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3, %._crit_edge114
  %indvars.iv = phi i64 [ 1, %._crit_edge114 ], [ %indvars.iv.next, %._crit_edge3 ]
  %29 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %4, i64 %16, i64 %indvars.iv
  %30 = load double, double* %29, align 8
  %31 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %5, i64 %17, i64 %indvars.iv
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %7, i64 %18, i64 %indvars.iv
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %8, i64 %20, i64 %indvars.iv
  %36 = load double, double* %35, align 8
  %37 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %9, i64 %21, i64 %indvars.iv
  %38 = load double, double* %37, align 8
  %39 = insertelement <2 x double> undef, double %32, i32 0
  %40 = insertelement <2 x double> %39, double %38, i32 1
  %41 = fmul <2 x double> %40, <double 2.000000e+00, double 2.000000e+00>
  %42 = insertelement <2 x double> undef, double %30, i32 0
  %43 = insertelement <2 x double> %42, double %36, i32 1
  %44 = fsub <2 x double> %43, %41
  %45 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %10, i64 %23, i64 %indvars.iv
  %46 = load double, double* %45, align 8
  %47 = insertelement <2 x double> undef, double %34, i32 0
  %48 = insertelement <2 x double> %47, double %46, i32 1
  %49 = fadd <2 x double> %48, %44
  %50 = fmul <2 x double> %49, <double 1.250000e-01, double 1.250000e-01>
  %51 = extractelement <2 x double> %50, i32 0
  %52 = extractelement <2 x double> %50, i32 1
  %53 = fadd double %51, %52
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %54 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %11, i64 %24, i64 %indvars.iv.next
  %55 = load double, double* %54, align 8
  %56 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %12, i64 %25, i64 %indvars.iv
  %57 = load double, double* %56, align 8
  %58 = fmul double %57, 2.000000e+00
  %59 = fsub double %55, %58
  %60 = add nsw i64 %indvars.iv, -1
  %61 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %13, i64 %26, i64 %60
  %62 = load double, double* %61, align 8
  %63 = fadd double %62, %59
  %64 = fmul double %63, 1.250000e-01
  %65 = fadd double %53, %64
  %66 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %14, i64 %27, i64 %indvars.iv
  %67 = load double, double* %66, align 8
  %68 = fadd double %67, %65
  %69 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %15, i64 %28, i64 %indvars.iv
  store double %68, double* %69, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %._crit_edge118, label %._crit_edge3

._crit_edge118:                                   ; preds = %._crit_edge3
  %70 = add nsw i32 %.0107119, 1
  %71 = icmp slt i32 %70, 119
  br i1 %71, label %._crit_edge114, label %._crit_edge121

._crit_edge121:                                   ; preds = %._crit_edge118
  %72 = add nsw i32 %.0109122, 1
  %73 = icmp slt i32 %72, 119
  br i1 %73, label %._crit_edge112, label %._crit_edge115.preheader

._crit_edge115.preheader:                         ; preds = %._crit_edge121
  br label %._crit_edge115

._crit_edge115:                                   ; preds = %._crit_edge115.preheader, %._crit_edge129
  %.1110130 = phi i32 [ %143, %._crit_edge129 ], [ 1, %._crit_edge115.preheader ]
  %74 = add nuw nsw i32 %.1110130, 1
  %75 = sext i32 %74 to i64
  %76 = sext i32 %.1110130 to i64
  %77 = add nsw i32 %.1110130, -1
  %78 = sext i32 %77 to i64
  %79 = sext i32 %.1110130 to i64
  %80 = sext i32 %.1110130 to i64
  %81 = sext i32 %.1110130 to i64
  %82 = sext i32 %.1110130 to i64
  %83 = sext i32 %.1110130 to i64
  %84 = sext i32 %.1110130 to i64
  %85 = sext i32 %.1110130 to i64
  %86 = sext i32 %.1110130 to i64
  br label %._crit_edge116

._crit_edge116:                                   ; preds = %._crit_edge126, %._crit_edge115
  %.1108127 = phi i32 [ 1, %._crit_edge115 ], [ %141, %._crit_edge126 ]
  %87 = sext i32 %.1108127 to i64
  %88 = sext i32 %.1108127 to i64
  %89 = sext i32 %.1108127 to i64
  %90 = add nuw nsw i32 %.1108127, 1
  %91 = sext i32 %90 to i64
  %92 = sext i32 %.1108127 to i64
  %93 = add nsw i32 %.1108127, -1
  %94 = sext i32 %93 to i64
  %95 = sext i32 %.1108127 to i64
  %96 = sext i32 %.1108127 to i64
  %97 = sext i32 %.1108127 to i64
  %98 = sext i32 %.1108127 to i64
  %99 = sext i32 %.1108127 to i64
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4, %._crit_edge116
  %indvars.iv134 = phi i64 [ 1, %._crit_edge116 ], [ %indvars.iv.next135, %._crit_edge4 ]
  %100 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %75, i64 %87, i64 %indvars.iv134
  %101 = load double, double* %100, align 8
  %102 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %76, i64 %88, i64 %indvars.iv134
  %103 = load double, double* %102, align 8
  %104 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %78, i64 %89, i64 %indvars.iv134
  %105 = load double, double* %104, align 8
  %106 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %79, i64 %91, i64 %indvars.iv134
  %107 = load double, double* %106, align 8
  %108 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %80, i64 %92, i64 %indvars.iv134
  %109 = load double, double* %108, align 8
  %110 = insertelement <2 x double> undef, double %103, i32 0
  %111 = insertelement <2 x double> %110, double %109, i32 1
  %112 = fmul <2 x double> %111, <double 2.000000e+00, double 2.000000e+00>
  %113 = insertelement <2 x double> undef, double %101, i32 0
  %114 = insertelement <2 x double> %113, double %107, i32 1
  %115 = fsub <2 x double> %114, %112
  %116 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %81, i64 %94, i64 %indvars.iv134
  %117 = load double, double* %116, align 8
  %118 = insertelement <2 x double> undef, double %105, i32 0
  %119 = insertelement <2 x double> %118, double %117, i32 1
  %120 = fadd <2 x double> %119, %115
  %121 = fmul <2 x double> %120, <double 1.250000e-01, double 1.250000e-01>
  %122 = extractelement <2 x double> %121, i32 0
  %123 = extractelement <2 x double> %121, i32 1
  %124 = fadd double %122, %123
  %indvars.iv.next135 = add nuw nsw i64 %indvars.iv134, 1
  %125 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %82, i64 %95, i64 %indvars.iv.next135
  %126 = load double, double* %125, align 8
  %127 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %83, i64 %96, i64 %indvars.iv134
  %128 = load double, double* %127, align 8
  %129 = fmul double %128, 2.000000e+00
  %130 = fsub double %126, %129
  %131 = add nsw i64 %indvars.iv134, -1
  %132 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %84, i64 %97, i64 %131
  %133 = load double, double* %132, align 8
  %134 = fadd double %133, %130
  %135 = fmul double %134, 1.250000e-01
  %136 = fadd double %124, %135
  %137 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %85, i64 %98, i64 %indvars.iv134
  %138 = load double, double* %137, align 8
  %139 = fadd double %138, %136
  %140 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %86, i64 %99, i64 %indvars.iv134
  store double %139, double* %140, align 8
  %exitcond136 = icmp eq i64 %indvars.iv.next135, 119
  br i1 %exitcond136, label %._crit_edge126, label %._crit_edge4

._crit_edge126:                                   ; preds = %._crit_edge4
  %141 = add nsw i32 %.1108127, 1
  %142 = icmp slt i32 %141, 119
  br i1 %142, label %._crit_edge116, label %._crit_edge129

._crit_edge129:                                   ; preds = %._crit_edge126
  %143 = add nsw i32 %.1110130, 1
  %144 = icmp slt i32 %143, 119
  br i1 %144, label %._crit_edge115, label %._crit_edge132

._crit_edge132:                                   ; preds = %._crit_edge129
  %145 = add nuw nsw i32 %.0111133, 1
  %exitcond137 = icmp eq i32 %145, 501
  br i1 %exitcond137, label %146, label %._crit_edge

; <label>:146:                                    ; preds = %._crit_edge132
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
  br label %._crit_edge

._crit_edge:                                      ; preds = %25, %1
  %.01924 = phi i32 [ 0, %1 ], [ %26, %25 ]
  %6 = mul nuw nsw i32 %.01924, 120
  %7 = sext i32 %.01924 to i64
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %22, %._crit_edge
  %.01823 = phi i32 [ 0, %._crit_edge ], [ %23, %22 ]
  %8 = add nuw i32 %.01823, %6
  %9 = mul nuw nsw i32 %8, 120
  %10 = sext i32 %.01823 to i64
  %11 = zext i32 %9 to i64
  br label %._crit_edge21._crit_edge

._crit_edge21._crit_edge:                         ; preds = %._crit_edge21, %._crit_edge20
  %indvars.iv = phi i64 [ 0, %._crit_edge20 ], [ %indvars.iv.next, %._crit_edge21 ]
  %12 = add i64 %indvars.iv, %11
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge21

; <label>:16:                                     ; preds = %._crit_edge21._crit_edge
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #5
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21._crit_edge, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %7, i64 %10, i64 %indvars.iv
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %22, label %._crit_edge21._crit_edge

; <label>:22:                                     ; preds = %._crit_edge21
  %23 = add nsw i32 %.01823, 1
  %24 = icmp slt i32 %23, 120
  br i1 %24, label %._crit_edge20, label %25

; <label>:25:                                     ; preds = %22
  %26 = add nsw i32 %.01924, 1
  %27 = icmp slt i32 %26, 120
  br i1 %27, label %._crit_edge, label %28

; <label>:28:                                     ; preds = %25
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %29, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %31) #5
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
