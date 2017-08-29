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
define internal fastcc void @init_array([120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  br label %.preheader1

.preheader1:                                      ; preds = %20, %2
  %indvars.iv4 = phi i64 [ 0, %2 ], [ %indvars.iv.next5, %20 ]
  %3 = add nuw nsw i64 %indvars.iv4, 120
  br label %.preheader

.preheader:                                       ; preds = %19, %.preheader1
  %indvars.iv1 = phi i64 [ 0, %.preheader1 ], [ %indvars.iv.next2, %19 ]
  %4 = add nuw nsw i64 %3, %indvars.iv1
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge ]
  %5 = sub nuw nsw i64 %4, %indvars.iv
  %6 = trunc i64 %5 to i32
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv4, i64 %indvars.iv1, i64 %indvars.iv
  %9 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv4, i64 %indvars.iv1, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %10 = sub nuw nsw i64 %4, %indvars.iv.next
  %11 = trunc i64 %10 to i32
  %12 = sitofp i32 %11 to double
  %13 = insertelement <2 x double> undef, double %7, i32 0
  %14 = insertelement <2 x double> %13, double %12, i32 1
  %15 = fmul <2 x double> %14, <double 1.000000e+01, double 1.000000e+01>
  %16 = fdiv <2 x double> %15, <double 1.200000e+02, double 1.200000e+02>
  %17 = bitcast double* %8 to <2 x double>*
  %18 = bitcast double* %9 to <2 x double>*
  store <2 x double> %16, <2 x double>* %17, align 8
  store <2 x double> %16, <2 x double>* %18, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 120
  br i1 %exitcond3, label %20, label %.preheader

; <label>:20:                                     ; preds = %19
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 120
  br i1 %exitcond6, label %21, label %.preheader1

; <label>:21:                                     ; preds = %20
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d([120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge11, %2
  %.012 = phi i32 [ 1, %2 ], [ %81, %._crit_edge11 ]
  br label %.preheader4

.preheader4:                                      ; preds = %._crit_edge7, %.preheader6
  %indvars.iv4 = phi i64 [ 1, %.preheader6 ], [ %indvars.iv.next5, %._crit_edge7 ]
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %3 = add nsw i64 %indvars.iv4, -1
  br label %.preheader2.us

.preheader2.us:                                   ; preds = %._crit_edge.us, %.preheader4
  %indvars.iv1 = phi i64 [ 1, %.preheader4 ], [ %indvars.iv.next2, %._crit_edge.us ]
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %4 = add nsw i64 %indvars.iv1, -1
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader2.us
  %indvars.iv = phi i64 [ 1, %.preheader2.us ], [ %indvars.iv.next, %._crit_edge ]
  %5 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv.next5, i64 %indvars.iv1, i64 %indvars.iv
  %6 = load double, double* %5, align 8
  %7 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv4, i64 %indvars.iv1, i64 %indvars.iv
  %8 = load double, double* %7, align 8
  %9 = fmul double %8, 2.000000e+00
  %10 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %3, i64 %indvars.iv1, i64 %indvars.iv
  %11 = load double, double* %10, align 8
  %12 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv4, i64 %indvars.iv.next2, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = shufflevector <2 x double> %14, <2 x double> undef, <2 x i32> zeroinitializer
  %16 = insertelement <2 x double> undef, double %6, i32 0
  %17 = insertelement <2 x double> %16, double %13, i32 1
  %18 = fsub <2 x double> %17, %15
  %19 = extractelement <2 x double> %18, i32 0
  %20 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv4, i64 %4, i64 %indvars.iv
  %21 = load double, double* %20, align 8
  %22 = insertelement <2 x double> undef, double %19, i32 0
  %23 = insertelement <2 x double> %22, double %21, i32 1
  %24 = insertelement <2 x double> undef, double %11, i32 0
  %25 = shufflevector <2 x double> %24, <2 x double> %18, <2 x i32> <i32 0, i32 3>
  %26 = fadd <2 x double> %25, %23
  %27 = fmul <2 x double> %26, <double 1.250000e-01, double 1.250000e-01>
  %28 = extractelement <2 x double> %27, i32 0
  %29 = extractelement <2 x double> %27, i32 1
  %30 = fadd double %28, %29
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %31 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv4, i64 %indvars.iv1, i64 %indvars.iv.next
  %32 = load double, double* %31, align 8
  %33 = fsub double %32, %9
  %34 = add nsw i64 %indvars.iv, -1
  %35 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv4, i64 %indvars.iv1, i64 %34
  %36 = load double, double* %35, align 8
  %37 = fadd double %33, %36
  %38 = fmul double %37, 1.250000e-01
  %39 = fadd double %30, %38
  %40 = fadd double %8, %39
  %41 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv4, i64 %indvars.iv1, i64 %indvars.iv
  store double %40, double* %41, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 119
  br i1 %exitcond3, label %._crit_edge7, label %.preheader2.us

._crit_edge7:                                     ; preds = %._crit_edge.us
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 119
  br i1 %exitcond6, label %.preheader3.preheader, label %.preheader4

.preheader3.preheader:                            ; preds = %._crit_edge7
  br label %.preheader3

.preheader3:                                      ; preds = %._crit_edge10, %.preheader3.preheader
  %indvars.iv13 = phi i64 [ 1, %.preheader3.preheader ], [ %indvars.iv.next14, %._crit_edge10 ]
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %42 = add nsw i64 %indvars.iv13, -1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge9.us, %.preheader3
  %indvars.iv10 = phi i64 [ 1, %.preheader3 ], [ %indvars.iv.next11, %._crit_edge9.us ]
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %43 = add nsw i64 %indvars.iv10, -1
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17, %.preheader.us
  %indvars.iv7 = phi i64 [ 1, %.preheader.us ], [ %indvars.iv.next8, %._crit_edge17 ]
  %44 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv.next14, i64 %indvars.iv10, i64 %indvars.iv7
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv13, i64 %indvars.iv10, i64 %indvars.iv7
  %47 = load double, double* %46, align 8
  %48 = fmul double %47, 2.000000e+00
  %49 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %42, i64 %indvars.iv10, i64 %indvars.iv7
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv13, i64 %indvars.iv.next11, i64 %indvars.iv7
  %52 = load double, double* %51, align 8
  %53 = insertelement <2 x double> undef, double %48, i32 0
  %54 = shufflevector <2 x double> %53, <2 x double> undef, <2 x i32> zeroinitializer
  %55 = insertelement <2 x double> undef, double %45, i32 0
  %56 = insertelement <2 x double> %55, double %52, i32 1
  %57 = fsub <2 x double> %56, %54
  %58 = extractelement <2 x double> %57, i32 0
  %59 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv13, i64 %43, i64 %indvars.iv7
  %60 = load double, double* %59, align 8
  %61 = insertelement <2 x double> undef, double %58, i32 0
  %62 = insertelement <2 x double> %61, double %60, i32 1
  %63 = insertelement <2 x double> undef, double %50, i32 0
  %64 = shufflevector <2 x double> %63, <2 x double> %57, <2 x i32> <i32 0, i32 3>
  %65 = fadd <2 x double> %64, %62
  %66 = fmul <2 x double> %65, <double 1.250000e-01, double 1.250000e-01>
  %67 = extractelement <2 x double> %66, i32 0
  %68 = extractelement <2 x double> %66, i32 1
  %69 = fadd double %67, %68
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %70 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv13, i64 %indvars.iv10, i64 %indvars.iv.next8
  %71 = load double, double* %70, align 8
  %72 = fsub double %71, %48
  %73 = add nsw i64 %indvars.iv7, -1
  %74 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv13, i64 %indvars.iv10, i64 %73
  %75 = load double, double* %74, align 8
  %76 = fadd double %72, %75
  %77 = fmul double %76, 1.250000e-01
  %78 = fadd double %69, %77
  %79 = fadd double %47, %78
  %80 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv13, i64 %indvars.iv10, i64 %indvars.iv7
  store double %79, double* %80, align 8
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 119
  br i1 %exitcond9, label %._crit_edge9.us, label %._crit_edge17

._crit_edge9.us:                                  ; preds = %._crit_edge17
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 119
  br i1 %exitcond12, label %._crit_edge10, label %.preheader.us

._crit_edge10:                                    ; preds = %._crit_edge9.us
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 119
  br i1 %exitcond15, label %._crit_edge11, label %.preheader3

._crit_edge11:                                    ; preds = %._crit_edge10
  %81 = add nuw nsw i32 %.012, 1
  %exitcond16 = icmp eq i32 %81, 501
  br i1 %exitcond16, label %82, label %.preheader6

; <label>:82:                                     ; preds = %._crit_edge11
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([120 x [120 x double]]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader1

.preheader1:                                      ; preds = %20, %1
  %indvars.iv4 = phi i64 [ 0, %1 ], [ %indvars.iv.next5, %20 ]
  %6 = mul nuw nsw i64 %indvars.iv4, 120
  br label %.preheader

.preheader:                                       ; preds = %19, %.preheader1
  %indvars.iv1 = phi i64 [ 0, %.preheader1 ], [ %indvars.iv.next2, %19 ]
  %7 = add nuw nsw i64 %indvars.iv1, %6
  %8 = mul nuw nsw i64 %7, 120
  br label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %9 = add nuw nsw i64 %indvars.iv, %8
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
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %0, i64 %indvars.iv4, i64 %indvars.iv1, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %19, label %._crit_edge._crit_edge

; <label>:19:                                     ; preds = %._crit_edge
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 120
  br i1 %exitcond3, label %20, label %.preheader

; <label>:20:                                     ; preds = %19
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 120
  br i1 %exitcond6, label %21, label %.preheader1

; <label>:21:                                     ; preds = %20
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
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
