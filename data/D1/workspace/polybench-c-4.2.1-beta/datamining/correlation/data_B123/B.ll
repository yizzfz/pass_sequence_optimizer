; ModuleID = 'A.ll'
source_filename = "correlation.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [5 x i8] c"corr\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = tail call i8* @polybench_alloc_data(i64 1680000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1200, i32 8) #4
  %8 = bitcast i8* %4 to [1200 x double]*
  call fastcc void @init_array(double* nonnull %3, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  tail call fastcc void @kernel_correlation(double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array([1200 x double]* %10)
  br label %18

; <label>:18:                                     ; preds = %14, %2, %17
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %0, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %20, %2
  %indvars.iv72 = phi i64 [ 0, %2 ], [ %indvars.iv.next8, %20 ]
  %3 = trunc i64 %indvars.iv72 to i32
  %4 = sitofp i32 %3 to double
  %5 = insertelement <2 x double> undef, double %4, i32 0
  %6 = shufflevector <2 x double> %5, <2 x double> undef, <2 x i32> zeroinitializer
  br label %7

; <label>:7:                                      ; preds = %7, %._crit_edge
  %indvars.iv1 = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next.1, %7 ]
  %8 = mul nuw nsw i64 %indvars.iv1, %indvars.iv72
  %9 = trunc i64 %8 to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv72, i64 %indvars.iv1
  %indvars.iv.next = or i64 %indvars.iv1, 1
  %12 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv72
  %13 = trunc i64 %12 to i32
  %14 = sitofp i32 %13 to double
  %15 = insertelement <2 x double> undef, double %10, i32 0
  %16 = insertelement <2 x double> %15, double %14, i32 1
  %17 = fdiv <2 x double> %16, <double 1.200000e+03, double 1.200000e+03>
  %18 = fadd <2 x double> %6, %17
  %19 = bitcast double* %11 to <2 x double>*
  store <2 x double> %18, <2 x double>* %19, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv1, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %20, label %7

; <label>:20:                                     ; preds = %7
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 1400
  br i1 %exitcond9, label %21, label %._crit_edge

; <label>:21:                                     ; preds = %20
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double*) unnamed_addr #0 {
.lr.ph162.us.preheader:
  %sunkaddr257 = ptrtoint double* %3 to i64
  br label %.lr.ph162.us

; <label>:5:                                      ; preds = %7
  %6 = fdiv double %20, %0
  store double %6, double* %sunkaddr260, align 8
  %indvars.iv.next117.us = add nuw nsw i64 %indvars.iv116165.us, 1
  %exitcond244 = icmp eq i64 %indvars.iv.next117.us, 1200
  br i1 %exitcond244, label %.lr.ph155.us.preheader, label %.lr.ph162.us

.lr.ph155.us.preheader:                           ; preds = %5
  %sunkaddr269 = ptrtoint double* %4 to i64
  br label %.lr.ph155.us

; <label>:7:                                      ; preds = %7, %.lr.ph162.us
  %8 = phi double [ 0.000000e+00, %.lr.ph162.us ], [ %20, %7 ]
  %indvars.iv114160.us = phi i64 [ 0, %.lr.ph162.us ], [ %indvars.iv.next115.us.1.1, %7 ]
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv114160.us, i64 %indvars.iv116165.us
  %10 = load double, double* %9, align 8
  %11 = fadd double %10, %8
  store double %11, double* %sunkaddr260, align 8
  %indvars.iv.next115.us = or i64 %indvars.iv114160.us, 1
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next115.us, i64 %indvars.iv116165.us
  %13 = load double, double* %12, align 8
  %14 = fadd double %13, %11
  store double %14, double* %sunkaddr260, align 8
  %indvars.iv.next115.us.1 = or i64 %indvars.iv114160.us, 2
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next115.us.1, i64 %indvars.iv116165.us
  %16 = load double, double* %15, align 8
  %17 = fadd double %16, %14
  store double %17, double* %sunkaddr260, align 8
  %indvars.iv.next115.us.17 = or i64 %indvars.iv114160.us, 3
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next115.us.17, i64 %indvars.iv116165.us
  %19 = load double, double* %18, align 8
  %20 = fadd double %19, %17
  store double %20, double* %sunkaddr260, align 8
  %indvars.iv.next115.us.1.1 = add nsw i64 %indvars.iv114160.us, 4
  %exitcond243.1.1 = icmp eq i64 %indvars.iv.next115.us.1.1, 1400
  br i1 %exitcond243.1.1, label %5, label %7

.lr.ph162.us:                                     ; preds = %5, %.lr.ph162.us.preheader
  %indvars.iv116165.us = phi i64 [ 0, %.lr.ph162.us.preheader ], [ %indvars.iv.next117.us, %5 ]
  %21 = getelementptr inbounds double, double* %3, i64 %indvars.iv116165.us
  store double 0.000000e+00, double* %21, align 8
  %sunkaddr258 = shl i64 %indvars.iv116165.us, 3
  %sunkaddr259 = add i64 %sunkaddr257, %sunkaddr258
  %sunkaddr260 = inttoptr i64 %sunkaddr259 to double*
  br label %7

; <label>:22:                                     ; preds = %27
  %23 = fdiv double %40, %0
  store double %23, double* %sunkaddr272, align 8
  %24 = tail call double @sqrt(double %23) #4
  %25 = fcmp ugt double %24, 1.000000e-01
  %26 = select i1 %25, double %24, double 1.000000e+00
  store double %26, double* %sunkaddr272, align 8
  %indvars.iv.next113.us = add nuw nsw i64 %indvars.iv112158.us, 1
  %exitcond241 = icmp eq i64 %indvars.iv.next113.us, 1200
  br i1 %exitcond241, label %.lr.ph149.us.preheader, label %.lr.ph155.us

.lr.ph149.us.preheader:                           ; preds = %22
  br label %.lr.ph149.us

; <label>:27:                                     ; preds = %27, %.lr.ph155.us
  %28 = phi double [ 0.000000e+00, %.lr.ph155.us ], [ %40, %27 ]
  %indvars.iv110153.us = phi i64 [ 0, %.lr.ph155.us ], [ %indvars.iv.next111.us.1, %27 ]
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv110153.us, i64 %indvars.iv112158.us
  %30 = load double, double* %29, align 8
  %31 = load double, double* %sunkaddr268, align 8
  %32 = fsub double %30, %31
  %33 = fmul double %32, %32
  %34 = fadd double %28, %33
  store double %34, double* %sunkaddr272, align 8
  %indvars.iv.next111.us = or i64 %indvars.iv110153.us, 1
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next111.us, i64 %indvars.iv112158.us
  %36 = load double, double* %35, align 8
  %37 = load double, double* %sunkaddr268, align 8
  %38 = fsub double %36, %37
  %39 = fmul double %38, %38
  %40 = fadd double %34, %39
  store double %40, double* %sunkaddr272, align 8
  %indvars.iv.next111.us.1 = add nuw nsw i64 %indvars.iv110153.us, 2
  %exitcond240.1 = icmp eq i64 %indvars.iv.next111.us.1, 1400
  br i1 %exitcond240.1, label %22, label %27

.lr.ph155.us:                                     ; preds = %.lr.ph155.us.preheader, %22
  %indvars.iv112158.us = phi i64 [ %indvars.iv.next113.us, %22 ], [ 0, %.lr.ph155.us.preheader ]
  %41 = getelementptr inbounds double, double* %4, i64 %indvars.iv112158.us
  store double 0.000000e+00, double* %41, align 8
  %sunkaddr266 = shl i64 %indvars.iv112158.us, 3
  %sunkaddr267 = add i64 %sunkaddr257, %sunkaddr266
  %sunkaddr268 = inttoptr i64 %sunkaddr267 to double*
  %sunkaddr271 = add i64 %sunkaddr269, %sunkaddr266
  %sunkaddr272 = inttoptr i64 %sunkaddr271 to double*
  br label %27

; <label>:42:                                     ; preds = %43
  %indvars.iv.next109.us = add nuw nsw i64 %indvars.iv108151.us, 1
  %exitcond238 = icmp eq i64 %indvars.iv.next109.us, 1400
  br i1 %exitcond238, label %.lr.ph.us.us.preheader.preheader, label %.lr.ph149.us

.lr.ph.us.us.preheader.preheader:                 ; preds = %42
  br label %.lr.ph.us.us.preheader

; <label>:43:                                     ; preds = %43, %.lr.ph149.us
  %indvars.iv106148.us = phi i64 [ 0, %.lr.ph149.us ], [ %indvars.iv.next107.us, %43 ]
  %44 = getelementptr inbounds double, double* %3, i64 %indvars.iv106148.us
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv108151.us, i64 %indvars.iv106148.us
  %47 = load double, double* %46, align 8
  %48 = fsub double %47, %45
  store double %48, double* %46, align 8
  %49 = tail call double @sqrt(double %0) #4
  %50 = getelementptr inbounds double, double* %4, i64 %indvars.iv106148.us
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = load double, double* %46, align 8
  %54 = fdiv double %53, %52
  store double %54, double* %46, align 8
  %indvars.iv.next107.us = add nuw nsw i64 %indvars.iv106148.us, 1
  %exitcond237 = icmp eq i64 %indvars.iv.next107.us, 1200
  br i1 %exitcond237, label %42, label %43

.lr.ph149.us:                                     ; preds = %.lr.ph149.us.preheader, %42
  %indvars.iv108151.us = phi i64 [ %indvars.iv.next109.us, %42 ], [ 0, %.lr.ph149.us.preheader ]
  br label %43

.lr.ph.us.us.preheader:                           ; preds = %.lr.ph.us.us.preheader.preheader, %.loopexit
  %indvars.iv104133.us = phi i64 [ %indvars.iv.next103128.us, %.loopexit ], [ 0, %.lr.ph.us.us.preheader.preheader ]
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv104133.us, i64 %indvars.iv104133.us
  store double 1.000000e+00, double* %55, align 8
  %indvars.iv.next103128.us = add nuw nsw i64 %indvars.iv104133.us, 1
  br label %.lr.ph.us.us

.loopexit:                                        ; preds = %56
  %exitcond233 = icmp eq i64 %indvars.iv.next103128.us, 1199
  br i1 %exitcond233, label %.loopexit224, label %.lr.ph.us.us.preheader

; <label>:56:                                     ; preds = %59
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next103129.us.us, i64 %indvars.iv104133.us
  store double %72, double* %57, align 8
  %indvars.iv.next103.us.us = add nuw nsw i64 %indvars.iv.next103129.us.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next103.us.us, 1200
  br i1 %exitcond, label %.loopexit, label %.lr.ph.us.us

.lr.ph.us.us:                                     ; preds = %56, %.lr.ph.us.us.preheader
  %indvars.iv.next103129.us.us = phi i64 [ %indvars.iv.next103128.us, %.lr.ph.us.us.preheader ], [ %indvars.iv.next103.us.us, %56 ]
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv104133.us, i64 %indvars.iv.next103129.us.us
  store double 0.000000e+00, double* %58, align 8
  br label %59

; <label>:59:                                     ; preds = %59, %.lr.ph.us.us
  %60 = phi double [ 0.000000e+00, %.lr.ph.us.us ], [ %72, %59 ]
  %indvars.iv124.us.us = phi i64 [ 0, %.lr.ph.us.us ], [ %indvars.iv.next.us.us.1, %59 ]
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv124.us.us, i64 %indvars.iv104133.us
  %62 = load double, double* %61, align 8
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv124.us.us, i64 %indvars.iv.next103129.us.us
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = fadd double %60, %65
  store double %66, double* %58, align 8
  %indvars.iv.next.us.us = or i64 %indvars.iv124.us.us, 1
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next.us.us, i64 %indvars.iv104133.us
  %68 = load double, double* %67, align 8
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next.us.us, i64 %indvars.iv.next103129.us.us
  %70 = load double, double* %69, align 8
  %71 = fmul double %68, %70
  %72 = fadd double %66, %71
  store double %72, double* %58, align 8
  %indvars.iv.next.us.us.1 = add nuw nsw i64 %indvars.iv124.us.us, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.us.us.1, 1400
  br i1 %exitcond.1, label %56, label %59

.loopexit224:                                     ; preds = %.loopexit
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 1199, i64 1199
  store double 1.000000e+00, double* %73, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly) unnamed_addr #0 {
._crit_edge.lr.ph:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph

.lr.ph:                                           ; preds = %18, %._crit_edge.lr.ph
  %indvars.iv1116 = phi i64 [ 0, %._crit_edge.lr.ph ], [ %indvars.iv.next12, %18 ]
  %5 = mul nuw nsw i64 %indvars.iv1116, 1200
  br label %6

; <label>:6:                                      ; preds = %13, %.lr.ph
  %indvars.iv14 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %13 ]
  %7 = add nuw nsw i64 %indvars.iv14, %5
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #5
  br label %13

; <label>:13:                                     ; preds = %6, %11
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1116, i64 %indvars.iv14
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv14, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %18, label %6

; <label>:18:                                     ; preds = %13
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv1116, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next12, 1200
  br i1 %exitcond19, label %.loopexit, label %.lr.ph

.loopexit:                                        ; preds = %18
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

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
