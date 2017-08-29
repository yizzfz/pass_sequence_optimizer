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
  tail call fastcc void @init_array(i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_heat_3d(i32 500, i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %7 = icmp sgt i32 %0, 42
  br i1 %7, label %8, label %._crit_edge

; <label>:8:                                      ; preds = %2
  %9 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %9, align 1
  %10 = icmp eq i8 %strcmpload, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %8
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %5)
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %2, %11
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #0 {
.preheader19.lr.ph:
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %._crit_edge22.us, %.preheader19.lr.ph
  %indvars.iv37 = phi i64 [ 0, %.preheader19.lr.ph ], [ %indvars.iv.next38, %._crit_edge22.us ]
  %3 = trunc i64 %indvars.iv37 to i32
  %4 = add i32 %3, 120
  br label %.preheader.us.us

._crit_edge22.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next38, 120
  br i1 %exitcond40, label %._crit_edge24, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv34 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next35, %._crit_edge.us.us ]
  %5 = trunc i64 %indvars.iv34 to i32
  %6 = add i32 %4, %5
  br label %.preheader.us.us.new

._crit_edge.us.us:                                ; preds = %.preheader.us.us.new
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond = icmp eq i64 %indvars.iv.next35, 120
  br i1 %exitcond, label %._crit_edge22.us, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us.new, %.preheader.us.us
  %indvars.iv = phi i64 [ 0, %.preheader.us.us ], [ %indvars.iv.next.1, %.preheader.us.us.new ]
  %7 = trunc i64 %indvars.iv to i32
  %8 = sub i32 %6, %7
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv37, i64 %indvars.iv34, i64 %indvars.iv
  %11 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv37, i64 %indvars.iv34, i64 %indvars.iv
  %12 = or i32 %7, 1
  %13 = sub i32 %6, %12
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %9, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fmul <2 x double> %16, <double 1.000000e+01, double 1.000000e+01>
  %18 = fdiv <2 x double> %17, <double 1.200000e+02, double 1.200000e+02>
  %19 = bitcast double* %10 to <2 x double>*
  %20 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  store <2 x double> %18, <2 x double>* %20, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %._crit_edge.us.us, label %.preheader.us.us.new

._crit_edge24:                                    ; preds = %._crit_edge22.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32, i32, [120 x [120 x double]]*, [120 x [120 x double]]*) unnamed_addr #0 {
  br label %.preheader110

.preheader110:                                    ; preds = %._crit_edge121, %4
  %storemerge122 = phi i32 [ 1, %4 ], [ %81, %._crit_edge121 ]
  br label %.preheader106.us.preheader

.preheader106.us.preheader:                       ; preds = %._crit_edge113, %.preheader110
  %indvars.iv129 = phi i64 [ 1, %.preheader110 ], [ %5, %._crit_edge113 ]
  %5 = add nuw nsw i64 %indvars.iv129, 1
  %6 = add nsw i64 %indvars.iv129, -1
  br label %.preheader106.us

.preheader106.us:                                 ; preds = %._crit_edge.us, %.preheader106.us.preheader
  %indvars.iv125 = phi i64 [ 1, %.preheader106.us.preheader ], [ %indvars.iv.next126, %._crit_edge.us ]
  %indvars.iv.next126 = add nuw nsw i64 %indvars.iv125, 1
  %7 = add nsw i64 %indvars.iv125, -1
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader106.us
  %indvars.iv = phi i64 [ 1, %.preheader106.us ], [ %indvars.iv.next, %._crit_edge ]
  %8 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %5, i64 %indvars.iv125, i64 %indvars.iv
  %9 = load double, double* %8, align 8
  %10 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv129, i64 %indvars.iv125, i64 %indvars.iv
  %11 = load double, double* %10, align 8
  %12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %6, i64 %indvars.iv125, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv129, i64 %indvars.iv.next126, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = insertelement <2 x double> undef, double %11, i32 0
  %17 = shufflevector <2 x double> %16, <2 x double> undef, <2 x i32> zeroinitializer
  %18 = fmul <2 x double> %17, <double 2.000000e+00, double 2.000000e+00>
  %19 = insertelement <2 x double> undef, double %9, i32 0
  %20 = insertelement <2 x double> %19, double %15, i32 1
  %21 = fsub <2 x double> %20, %18
  %22 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv129, i64 %7, i64 %indvars.iv
  %23 = load double, double* %22, align 8
  %24 = insertelement <2 x double> undef, double %13, i32 0
  %25 = insertelement <2 x double> %24, double %23, i32 1
  %26 = fadd <2 x double> %25, %21
  %27 = fmul <2 x double> %26, <double 1.250000e-01, double 1.250000e-01>
  %28 = extractelement <2 x double> %27, i32 0
  %29 = extractelement <2 x double> %27, i32 1
  %30 = fadd double %28, %29
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %31 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv129, i64 %indvars.iv125, i64 %indvars.iv.next
  %32 = load double, double* %31, align 8
  %33 = fmul double %11, 2.000000e+00
  %34 = fsub double %32, %33
  %35 = add nsw i64 %indvars.iv, -1
  %36 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv129, i64 %indvars.iv125, i64 %35
  %37 = load double, double* %36, align 8
  %38 = fadd double %37, %34
  %39 = fmul double %38, 1.250000e-01
  %40 = fadd double %30, %39
  %41 = fadd double %11, %40
  %42 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv129, i64 %indvars.iv125, i64 %indvars.iv
  store double %41, double* %42, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %exitcond128 = icmp eq i64 %indvars.iv.next126, 119
  br i1 %exitcond128, label %._crit_edge113, label %.preheader106.us

._crit_edge113:                                   ; preds = %._crit_edge.us
  %exitcond132 = icmp eq i64 %5, 119
  br i1 %exitcond132, label %.preheader.us.preheader.preheader, label %.preheader106.us.preheader

.preheader.us.preheader.preheader:                ; preds = %._crit_edge113
  br label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %.preheader.us.preheader.preheader, %._crit_edge119
  %indvars.iv142 = phi i64 [ %43, %._crit_edge119 ], [ 1, %.preheader.us.preheader.preheader ]
  %43 = add nuw nsw i64 %indvars.iv142, 1
  %44 = add nsw i64 %indvars.iv142, -1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge117.us, %.preheader.us.preheader
  %indvars.iv138 = phi i64 [ 1, %.preheader.us.preheader ], [ %indvars.iv.next139, %._crit_edge117.us ]
  %indvars.iv.next139 = add nuw nsw i64 %indvars.iv138, 1
  %45 = add nsw i64 %indvars.iv138, -1
  br label %._crit_edge149

._crit_edge149:                                   ; preds = %._crit_edge149, %.preheader.us
  %indvars.iv134 = phi i64 [ 1, %.preheader.us ], [ %indvars.iv.next135, %._crit_edge149 ]
  %46 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %43, i64 %indvars.iv138, i64 %indvars.iv134
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv142, i64 %indvars.iv138, i64 %indvars.iv134
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %44, i64 %indvars.iv138, i64 %indvars.iv134
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv142, i64 %indvars.iv.next139, i64 %indvars.iv134
  %53 = load double, double* %52, align 8
  %54 = insertelement <2 x double> undef, double %49, i32 0
  %55 = shufflevector <2 x double> %54, <2 x double> undef, <2 x i32> zeroinitializer
  %56 = fmul <2 x double> %55, <double 2.000000e+00, double 2.000000e+00>
  %57 = insertelement <2 x double> undef, double %47, i32 0
  %58 = insertelement <2 x double> %57, double %53, i32 1
  %59 = fsub <2 x double> %58, %56
  %60 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv142, i64 %45, i64 %indvars.iv134
  %61 = load double, double* %60, align 8
  %62 = insertelement <2 x double> undef, double %51, i32 0
  %63 = insertelement <2 x double> %62, double %61, i32 1
  %64 = fadd <2 x double> %63, %59
  %65 = fmul <2 x double> %64, <double 1.250000e-01, double 1.250000e-01>
  %66 = extractelement <2 x double> %65, i32 0
  %67 = extractelement <2 x double> %65, i32 1
  %68 = fadd double %66, %67
  %indvars.iv.next135 = add nuw nsw i64 %indvars.iv134, 1
  %69 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv142, i64 %indvars.iv138, i64 %indvars.iv.next135
  %70 = load double, double* %69, align 8
  %71 = fmul double %49, 2.000000e+00
  %72 = fsub double %70, %71
  %73 = add nsw i64 %indvars.iv134, -1
  %74 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv142, i64 %indvars.iv138, i64 %73
  %75 = load double, double* %74, align 8
  %76 = fadd double %75, %72
  %77 = fmul double %76, 1.250000e-01
  %78 = fadd double %68, %77
  %79 = fadd double %49, %78
  %80 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv142, i64 %indvars.iv138, i64 %indvars.iv134
  store double %79, double* %80, align 8
  %exitcond137 = icmp eq i64 %indvars.iv.next135, 119
  br i1 %exitcond137, label %._crit_edge117.us, label %._crit_edge149

._crit_edge117.us:                                ; preds = %._crit_edge149
  %exitcond141 = icmp eq i64 %indvars.iv.next139, 119
  br i1 %exitcond141, label %._crit_edge119, label %.preheader.us

._crit_edge119:                                   ; preds = %._crit_edge117.us
  %exitcond145 = icmp eq i64 %43, 119
  br i1 %exitcond145, label %._crit_edge121, label %.preheader.us.preheader

._crit_edge121:                                   ; preds = %._crit_edge119
  %81 = add nuw nsw i32 %storemerge122, 1
  %exitcond146 = icmp eq i32 %81, 501
  br i1 %exitcond146, label %82, label %.preheader110

; <label>:82:                                     ; preds = %._crit_edge121
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [120 x [120 x double]]*) unnamed_addr #0 {
.preheader15.lr.ph:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #4
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %._crit_edge18.us, %.preheader15.lr.ph
  %indvars.iv34 = phi i64 [ 0, %.preheader15.lr.ph ], [ %indvars.iv.next35, %._crit_edge18.us ]
  %6 = mul nsw i64 %indvars.iv34, 120
  br label %.preheader.us.us

._crit_edge18.us:                                 ; preds = %._crit_edge.us.us
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next35, 120
  br i1 %exitcond37, label %._crit_edge20, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv30 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next31, %._crit_edge.us.us ]
  %7 = add i64 %indvars.iv30, %6
  %8 = mul i64 %7, 120
  br label %._crit_edge39

._crit_edge.us.us:                                ; preds = %._crit_edge
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next31, 120
  br i1 %exitcond33, label %._crit_edge18.us, label %.preheader.us.us

._crit_edge39:                                    ; preds = %._crit_edge, %.preheader.us.us
  %indvars.iv = phi i64 [ 0, %.preheader.us.us ], [ %indvars.iv.next, %._crit_edge ]
  %9 = add i64 %indvars.iv, %8
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %._crit_edge39
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge39, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv34, i64 %indvars.iv30, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %._crit_edge.us.us, label %._crit_edge39

._crit_edge20:                                    ; preds = %._crit_edge18.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #5
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #4
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
