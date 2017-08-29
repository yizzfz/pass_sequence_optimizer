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
  tail call fastcc void @kernel_heat_3d(i32 120, [120 x [120 x double]]* %5, [120 x [120 x double]]* %6)
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
.preheader3.lr.ph:
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %._crit_edge6.us-lcssa.us.us, %.preheader3.lr.ph
  %indvars.iv20 = phi i64 [ 0, %.preheader3.lr.ph ], [ %indvars.iv.next21, %._crit_edge6.us-lcssa.us.us ]
  %3 = trunc i64 %indvars.iv20 to i32
  %4 = add i32 %3, 120
  br label %.preheader.us.us

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader3.us
  %indvars.iv17 = phi i64 [ 0, %.preheader3.us ], [ %indvars.iv.next18, %._crit_edge.us.us ]
  %5 = trunc i64 %indvars.iv17 to i32
  %6 = add i32 %4, %5
  br label %.preheader.us.us.new

._crit_edge.us.us:                                ; preds = %.preheader.us.us.new
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond = icmp eq i64 %indvars.iv.next18, 120
  br i1 %exitcond, label %._crit_edge6.us-lcssa.us.us, label %.preheader.us.us

.preheader.us.us.new:                             ; preds = %.preheader.us.us, %.preheader.us.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.us.new ], [ 0, %.preheader.us.us ]
  %7 = trunc i64 %indvars.iv to i32
  %8 = sub i32 %6, %7
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv20, i64 %indvars.iv17, i64 %indvars.iv
  %11 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv20, i64 %indvars.iv17, i64 %indvars.iv
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
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 120
  br i1 %exitcond.1, label %._crit_edge.us.us, label %.preheader.us.us.new

._crit_edge6.us-lcssa.us.us:                      ; preds = %._crit_edge.us.us
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond23 = icmp eq i64 %indvars.iv.next21, 120
  br i1 %exitcond23, label %._crit_edge8, label %.preheader3.us

._crit_edge8:                                     ; preds = %._crit_edge6.us-lcssa.us.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_heat_3d(i32, [120 x [120 x double]]* nocapture, [120 x [120 x double]]* nocapture) unnamed_addr #2 {
  br label %.preheader5

.preheader5:                                      ; preds = %._crit_edge16, %3
  %.0517 = phi i32 [ 1, %3 ], [ %82, %._crit_edge16 ]
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader5, %._crit_edge8
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %._crit_edge8 ], [ 1, %.preheader5 ]
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %4 = add nsw i64 %indvars.iv32, -1
  br label %.preheader1.us

.preheader1.us:                                   ; preds = %._crit_edge.us, %.preheader3
  %indvars.iv28 = phi i64 [ 1, %.preheader3 ], [ %indvars.iv.next29, %._crit_edge.us ]
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %5 = add nsw i64 %indvars.iv28, -1
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader1.us
  %indvars.iv = phi i64 [ 1, %.preheader1.us ], [ %indvars.iv.next, %._crit_edge ]
  %6 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv.next33, i64 %indvars.iv28, i64 %indvars.iv
  %7 = load double, double* %6, align 8
  %8 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv32, i64 %indvars.iv28, i64 %indvars.iv
  %9 = load double, double* %8, align 8
  %10 = fmul double %9, 2.000000e+00
  %11 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %4, i64 %indvars.iv28, i64 %indvars.iv
  %12 = load double, double* %11, align 8
  %13 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv32, i64 %indvars.iv.next29, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = insertelement <2 x double> undef, double %10, i32 0
  %16 = shufflevector <2 x double> %15, <2 x double> undef, <2 x i32> zeroinitializer
  %17 = insertelement <2 x double> undef, double %7, i32 0
  %18 = insertelement <2 x double> %17, double %14, i32 1
  %19 = fsub <2 x double> %18, %16
  %20 = extractelement <2 x double> %19, i32 0
  %21 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv32, i64 %5, i64 %indvars.iv
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
  %32 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv32, i64 %indvars.iv28, i64 %indvars.iv.next
  %33 = load double, double* %32, align 8
  %34 = fsub double %33, %10
  %35 = add nsw i64 %indvars.iv, -1
  %36 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv32, i64 %indvars.iv28, i64 %35
  %37 = load double, double* %36, align 8
  %38 = fadd double %34, %37
  %39 = fmul double %38, 1.250000e-01
  %40 = fadd double %31, %39
  %41 = fadd double %9, %40
  %42 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv32, i64 %indvars.iv28, i64 %indvars.iv
  store double %41, double* %42, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 119
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %exitcond31 = icmp eq i64 %indvars.iv.next29, 119
  br i1 %exitcond31, label %._crit_edge8, label %.preheader1.us

._crit_edge8:                                     ; preds = %._crit_edge.us
  %exitcond35 = icmp eq i64 %indvars.iv.next33, 119
  br i1 %exitcond35, label %.preheader2.preheader, label %.preheader3

.preheader2.preheader:                            ; preds = %._crit_edge8
  br label %.preheader2

.preheader2:                                      ; preds = %.preheader2.preheader, %._crit_edge14
  %indvars.iv44 = phi i64 [ %indvars.iv.next45, %._crit_edge14 ], [ 1, %.preheader2.preheader ]
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %43 = add nsw i64 %indvars.iv44, -1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge12.us, %.preheader2
  %indvars.iv40 = phi i64 [ 1, %.preheader2 ], [ %indvars.iv.next41, %._crit_edge12.us ]
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %44 = add nsw i64 %indvars.iv40, -1
  br label %._crit_edge49

._crit_edge49:                                    ; preds = %._crit_edge49, %.preheader.us
  %indvars.iv36 = phi i64 [ 1, %.preheader.us ], [ %indvars.iv.next37, %._crit_edge49 ]
  %45 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv.next45, i64 %indvars.iv40, i64 %indvars.iv36
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv44, i64 %indvars.iv40, i64 %indvars.iv36
  %48 = load double, double* %47, align 8
  %49 = fmul double %48, 2.000000e+00
  %50 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %43, i64 %indvars.iv40, i64 %indvars.iv36
  %51 = load double, double* %50, align 8
  %52 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv44, i64 %indvars.iv.next41, i64 %indvars.iv36
  %53 = load double, double* %52, align 8
  %54 = insertelement <2 x double> undef, double %49, i32 0
  %55 = shufflevector <2 x double> %54, <2 x double> undef, <2 x i32> zeroinitializer
  %56 = insertelement <2 x double> undef, double %46, i32 0
  %57 = insertelement <2 x double> %56, double %53, i32 1
  %58 = fsub <2 x double> %57, %55
  %59 = extractelement <2 x double> %58, i32 0
  %60 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv44, i64 %44, i64 %indvars.iv36
  %61 = load double, double* %60, align 8
  %62 = insertelement <2 x double> undef, double %59, i32 0
  %63 = insertelement <2 x double> %62, double %61, i32 1
  %64 = insertelement <2 x double> undef, double %51, i32 0
  %65 = shufflevector <2 x double> %64, <2 x double> %58, <2 x i32> <i32 0, i32 3>
  %66 = fadd <2 x double> %65, %63
  %67 = fmul <2 x double> %66, <double 1.250000e-01, double 1.250000e-01>
  %68 = extractelement <2 x double> %67, i32 0
  %69 = extractelement <2 x double> %67, i32 1
  %70 = fadd double %68, %69
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %71 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv44, i64 %indvars.iv40, i64 %indvars.iv.next37
  %72 = load double, double* %71, align 8
  %73 = fsub double %72, %49
  %74 = add nsw i64 %indvars.iv36, -1
  %75 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %2, i64 %indvars.iv44, i64 %indvars.iv40, i64 %74
  %76 = load double, double* %75, align 8
  %77 = fadd double %73, %76
  %78 = fmul double %77, 1.250000e-01
  %79 = fadd double %70, %78
  %80 = fadd double %48, %79
  %81 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv44, i64 %indvars.iv40, i64 %indvars.iv36
  store double %80, double* %81, align 8
  %exitcond39 = icmp eq i64 %indvars.iv.next37, 119
  br i1 %exitcond39, label %._crit_edge12.us, label %._crit_edge49

._crit_edge12.us:                                 ; preds = %._crit_edge49
  %exitcond43 = icmp eq i64 %indvars.iv.next41, 119
  br i1 %exitcond43, label %._crit_edge14, label %.preheader.us

._crit_edge14:                                    ; preds = %._crit_edge12.us
  %exitcond47 = icmp eq i64 %indvars.iv.next45, 119
  br i1 %exitcond47, label %._crit_edge16, label %.preheader2

._crit_edge16:                                    ; preds = %._crit_edge14
  %82 = add nuw nsw i32 %.0517, 1
  %exitcond48 = icmp eq i32 %82, 501
  br i1 %exitcond48, label %83, label %.preheader5

; <label>:83:                                     ; preds = %._crit_edge16
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [120 x [120 x double]]* nocapture readonly) unnamed_addr #0 {
.preheader3.us.preheader:
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader3.us

.preheader3.us:                                   ; preds = %._crit_edge6.us-lcssa.us.us, %.preheader3.us.preheader
  %indvars.iv21 = phi i64 [ 0, %.preheader3.us.preheader ], [ %indvars.iv.next22, %._crit_edge6.us-lcssa.us.us ]
  %6 = mul nsw i64 %indvars.iv21, 120
  br label %.preheader.us.us

.preheader.us.us:                                 ; preds = %._crit_edge.us.us, %.preheader3.us
  %indvars.iv17 = phi i64 [ 0, %.preheader3.us ], [ %indvars.iv.next18, %._crit_edge.us.us ]
  %7 = add i64 %indvars.iv17, %6
  %8 = mul i64 %7, 120
  br label %._crit_edge25

._crit_edge.us.us:                                ; preds = %._crit_edge
  %indvars.iv.next18 = add nuw nsw i64 %indvars.iv17, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next18, 120
  br i1 %exitcond20, label %._crit_edge6.us-lcssa.us.us, label %.preheader.us.us

._crit_edge25:                                    ; preds = %._crit_edge, %.preheader.us.us
  %indvars.iv = phi i64 [ 0, %.preheader.us.us ], [ %indvars.iv.next, %._crit_edge ]
  %9 = add i64 %indvars.iv, %8
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %._crit_edge25
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge25, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [120 x [120 x double]], [120 x [120 x double]]* %1, i64 %indvars.iv21, i64 %indvars.iv17, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 120
  br i1 %exitcond, label %._crit_edge.us.us, label %._crit_edge25

._crit_edge6.us-lcssa.us.us:                      ; preds = %._crit_edge.us.us
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %exitcond24 = icmp eq i64 %indvars.iv.next22, 120
  br i1 %exitcond24, label %._crit_edge8, label %.preheader3.us

._crit_edge8:                                     ; preds = %._crit_edge6.us-lcssa.us.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
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
