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
  tail call fastcc void @init_array(i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_heat_3d(i32 500, i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
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
  tail call fastcc void @print_array(i32 120, [120 x [120 x double]]* %5)
  br label %._crit_edge

._crit_edge:                                      ; preds = %8, %2, %11
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, [120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
.preheader1.lr.ph:
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader1.lr.ph, %._crit_edge2.us
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %._crit_edge2.us ], [ 0, %.preheader1.lr.ph ]
  %3 = trunc i64 %indvars.iv14 to i32
  %4 = add i32 %3, 120
  br label %.preheader.us.us

._crit_edge2.us:                                  ; preds = %._crit_edge.us.us
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond = icmp eq i64 %indvars.iv.next15, 120
  br i1 %exitcond, label %._crit_edge3, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader.us.us.preheader
  %indvars.iv11 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next12, %._crit_edge.us.us ]
  %5 = trunc i64 %indvars.iv11 to i32
  %6 = add i32 %4, %5
  br label %.preheader.us.us.new

._crit_edge.us.us:                                ; preds = %.preheader.us.us.new
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next12, 120
  br i1 %exitcond18, label %._crit_edge2.us, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us, %.preheader.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.us.new ], [ 0, %.preheader.us.us ]
  %7 = trunc i64 %indvars.iv to i32
  %8 = sub i32 %6, %7
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv14, i64 %indvars.iv11, i64 %indvars.iv
  %11 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv14, i64 %indvars.iv11, i64 %indvars.iv
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
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %._crit_edge.us.us, label %.preheader.us.us.new

._crit_edge3:                                     ; preds = %._crit_edge2.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32, i32, [120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge11, %4
  %5 = phi i32 [ 1, %4 ], [ %82, %._crit_edge11 ]
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader6, %._crit_edge7
  %indvars.iv17 = phi i64 [ %6, %._crit_edge7 ], [ 1, %.preheader6 ]
  %6 = add nuw nsw i64 %indvars.iv17, 1
  %7 = add nsw i64 %indvars.iv17, -1
  br label %.preheader2.us

.preheader2.us:                                   ; preds = %._crit_edge.us, %.preheader4
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %._crit_edge.us ], [ 1, %.preheader4 ]
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %8 = add nsw i64 %indvars.iv13, -1
  br label %9

; <label>:9:                                      ; preds = %9, %.preheader2.us
  %indvars.iv = phi i64 [ 1, %.preheader2.us ], [ %indvars.iv.next, %9 ]
  %10 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %6, i64 %indvars.iv13, i64 %indvars.iv
  %11 = load double, double* %10, align 8
  %12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv17, i64 %indvars.iv13, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = fmul double %13, 2.000000e+00
  %15 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %7, i64 %indvars.iv13, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv17, i64 %indvars.iv.next14, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = insertelement <2 x double> undef, double %14, i32 0
  %20 = shufflevector <2 x double> %19, <2 x double> undef, <2 x i32> zeroinitializer
  %21 = insertelement <2 x double> undef, double %11, i32 0
  %22 = insertelement <2 x double> %21, double %18, i32 1
  %23 = fsub <2 x double> %22, %20
  %24 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv17, i64 %8, i64 %indvars.iv
  %25 = load double, double* %24, align 8
  %26 = insertelement <2 x double> undef, double %16, i32 0
  %27 = insertelement <2 x double> %26, double %25, i32 1
  %28 = fadd <2 x double> %23, %27
  %29 = fmul <2 x double> %28, <double 1.250000e-01, double 1.250000e-01>
  %30 = extractelement <2 x double> %29, i32 0
  %31 = extractelement <2 x double> %29, i32 1
  %32 = fadd double %30, %31
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %33 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv17, i64 %indvars.iv13, i64 %indvars.iv.next
  %34 = load double, double* %33, align 8
  %35 = fsub double %34, %14
  %36 = add nsw i64 %indvars.iv, -1
  %37 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv17, i64 %indvars.iv13, i64 %36
  %38 = load double, double* %37, align 8
  %39 = fadd double %35, %38
  %40 = fmul double %39, 1.250000e-01
  %41 = fadd double %40, %32
  %42 = fadd double %13, %41
  %43 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv17, i64 %indvars.iv13, i64 %indvars.iv
  store double %42, double* %43, align 8
  %exitcond34 = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond34, label %._crit_edge.us, label %9

._crit_edge.us:                                   ; preds = %9
  %exitcond16 = icmp eq i64 %indvars.iv.next14, 119
  br i1 %exitcond16, label %._crit_edge7, label %.preheader2.us

._crit_edge7:                                     ; preds = %._crit_edge.us
  %exitcond = icmp eq i64 %6, 119
  br i1 %exitcond, label %.preheader.lr.ph.preheader, label %.preheader4

.preheader.lr.ph.preheader:                       ; preds = %._crit_edge7
  br label %.preheader.lr.ph

.preheader.lr.ph:                                 ; preds = %.preheader.lr.ph.preheader, %._crit_edge10
  %indvars.iv29 = phi i64 [ %44, %._crit_edge10 ], [ 1, %.preheader.lr.ph.preheader ]
  %44 = add nuw nsw i64 %indvars.iv29, 1
  %45 = add nsw i64 %indvars.iv29, -1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge9.us, %.preheader.lr.ph
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %._crit_edge9.us ], [ 1, %.preheader.lr.ph ]
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %46 = add nsw i64 %indvars.iv25, -1
  br label %47

; <label>:47:                                     ; preds = %47, %.preheader.us
  %indvars.iv21 = phi i64 [ 1, %.preheader.us ], [ %indvars.iv.next22, %47 ]
  %48 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %44, i64 %indvars.iv25, i64 %indvars.iv21
  %49 = load double, double* %48, align 8
  %50 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv29, i64 %indvars.iv25, i64 %indvars.iv21
  %51 = load double, double* %50, align 8
  %52 = fmul double %51, 2.000000e+00
  %53 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %45, i64 %indvars.iv25, i64 %indvars.iv21
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv29, i64 %indvars.iv.next26, i64 %indvars.iv21
  %56 = load double, double* %55, align 8
  %57 = insertelement <2 x double> undef, double %52, i32 0
  %58 = shufflevector <2 x double> %57, <2 x double> undef, <2 x i32> zeroinitializer
  %59 = insertelement <2 x double> undef, double %49, i32 0
  %60 = insertelement <2 x double> %59, double %56, i32 1
  %61 = fsub <2 x double> %60, %58
  %62 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv29, i64 %46, i64 %indvars.iv21
  %63 = load double, double* %62, align 8
  %64 = insertelement <2 x double> undef, double %54, i32 0
  %65 = insertelement <2 x double> %64, double %63, i32 1
  %66 = fadd <2 x double> %61, %65
  %67 = fmul <2 x double> %66, <double 1.250000e-01, double 1.250000e-01>
  %68 = extractelement <2 x double> %67, i32 0
  %69 = extractelement <2 x double> %67, i32 1
  %70 = fadd double %68, %69
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %71 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv29, i64 %indvars.iv25, i64 %indvars.iv.next22
  %72 = load double, double* %71, align 8
  %73 = fsub double %72, %52
  %74 = add nsw i64 %indvars.iv21, -1
  %75 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %3, i64 %indvars.iv29, i64 %indvars.iv25, i64 %74
  %76 = load double, double* %75, align 8
  %77 = fadd double %73, %76
  %78 = fmul double %77, 1.250000e-01
  %79 = fadd double %78, %70
  %80 = fadd double %51, %79
  %81 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv29, i64 %indvars.iv25, i64 %indvars.iv21
  store double %80, double* %81, align 8
  %exitcond35 = icmp eq i64 %indvars.iv.next22, 119
  br i1 %exitcond35, label %._crit_edge9.us, label %47

._crit_edge9.us:                                  ; preds = %47
  %exitcond28 = icmp eq i64 %indvars.iv.next26, 119
  br i1 %exitcond28, label %._crit_edge10, label %.preheader.us

._crit_edge10:                                    ; preds = %._crit_edge9.us
  %exitcond36 = icmp eq i64 %44, 119
  br i1 %exitcond36, label %._crit_edge11, label %.preheader.lr.ph

._crit_edge11:                                    ; preds = %._crit_edge10
  %82 = add nuw nsw i32 %5, 1
  %exitcond33 = icmp eq i32 %82, 501
  br i1 %exitcond33, label %83, label %.preheader6

; <label>:83:                                     ; preds = %._crit_edge11
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [120 x [120 x double]]* nocapture readonly) unnamed_addr #0 {
.preheader1.lr.ph:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us.us.preheader

.preheader.us.us.preheader:                       ; preds = %.preheader1.lr.ph, %._crit_edge3.us
  %indvars.iv17 = phi i64 [ %indvars.iv.next18, %._crit_edge3.us ], [ 0, %.preheader1.lr.ph ]
  %6 = mul nsw i64 %indvars.iv17, 120
  br label %.preheader.us.us

._crit_edge3.us:                                  ; preds = %._crit_edge2.us.us
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next18, 120
  br i1 %exitcond22, label %._crit_edge4, label %.preheader.us.us.preheader

.preheader.us.us:                                 ; preds = %._crit_edge2.us.us, %.preheader.us.us.preheader
  %indvars.iv13 = phi i64 [ 0, %.preheader.us.us.preheader ], [ %indvars.iv.next14, %._crit_edge2.us.us ]
  %7 = add i64 %indvars.iv13, %6
  %8 = mul i64 %7, 120
  br label %9

._crit_edge2.us.us:                               ; preds = %._crit_edge.us.us
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond = icmp eq i64 %indvars.iv.next14, 120
  br i1 %exitcond, label %._crit_edge3.us, label %.preheader.us.us

; <label>:9:                                      ; preds = %._crit_edge.us.us, %.preheader.us.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us.us ], [ 0, %.preheader.us.us ]
  %10 = add i64 %indvars.iv, %8
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge.us.us

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %._crit_edge.us.us

._crit_edge.us.us:                                ; preds = %14, %9
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv17, i64 %indvars.iv13, i64 %indvars.iv
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond21, label %._crit_edge2.us.us, label %9

._crit_edge4:                                     ; preds = %._crit_edge3.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
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
