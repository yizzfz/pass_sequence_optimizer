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
  call fastcc void @init_array(i32 1200, i32 1400, double* nonnull %3, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  %9 = load double, double* %3, align 8
  %10 = bitcast i8* %5 to [1200 x double]*
  %11 = bitcast i8* %6 to double*
  %12 = bitcast i8* %7 to double*
  tail call fastcc void @kernel_correlation(i32 1200, i32 1400, double %9, [1200 x double]* %8, [1200 x double]* %10, double* %11, double* %12)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(i32 1200, [1200 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  tail call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, double* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  store double 1.400000e+03, double* %2, align 8
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %19, %4
  %indvars.iv4 = phi i64 [ 0, %4 ], [ %indvars.iv.next5, %19 ]
  %5 = trunc i64 %indvars.iv4 to i32
  %6 = sitofp i32 %5 to double
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next.1, %._crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv, %indvars.iv4
  %8 = trunc i64 %7 to i32
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, 1.200000e+03
  %11 = fadd double %6, %10
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv4, i64 %indvars.iv
  store double %11, double* %12, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %13 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv4
  %14 = trunc i64 %13 to i32
  %15 = sitofp i32 %14 to double
  %16 = fdiv double %15, 1.200000e+03
  %17 = fadd double %6, %16
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv4, i64 %indvars.iv.next
  store double %17, double* %18, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1200
  br i1 %exitcond.1, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %._crit_edge
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond = icmp eq i64 %indvars.iv.next5, 1400
  br i1 %exitcond, label %20, label %._crit_edge.preheader

; <label>:20:                                     ; preds = %19
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_correlation(i32, i32, double, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture, double* nocapture) unnamed_addr #0 {
  br label %8

; <label>:8:                                      ; preds = %24, %7
  %indvars.iv43 = phi i64 [ 0, %7 ], [ %indvars.iv.next44, %24 ]
  %9 = getelementptr inbounds double, double* %5, i64 %indvars.iv43
  store double 0.000000e+00, double* %9, align 8
  br label %10

; <label>:10:                                     ; preds = %10, %8
  %11 = phi double [ 0.000000e+00, %8 ], [ %23, %10 ]
  %indvars.iv40 = phi i64 [ 0, %8 ], [ %indvars.iv.next41.3, %10 ]
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv40, i64 %indvars.iv43
  %13 = load double, double* %12, align 8
  %14 = fadd double %13, %11
  store double %14, double* %9, align 8
  %indvars.iv.next41 = or i64 %indvars.iv40, 1
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next41, i64 %indvars.iv43
  %16 = load double, double* %15, align 8
  %17 = fadd double %16, %14
  store double %17, double* %9, align 8
  %indvars.iv.next41.1 = or i64 %indvars.iv40, 2
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next41.1, i64 %indvars.iv43
  %19 = load double, double* %18, align 8
  %20 = fadd double %19, %17
  store double %20, double* %9, align 8
  %indvars.iv.next41.2 = or i64 %indvars.iv40, 3
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next41.2, i64 %indvars.iv43
  %22 = load double, double* %21, align 8
  %23 = fadd double %22, %20
  store double %23, double* %9, align 8
  %indvars.iv.next41.3 = add nsw i64 %indvars.iv40, 4
  %exitcond42.3 = icmp eq i64 %indvars.iv.next41.3, 1400
  br i1 %exitcond42.3, label %24, label %10

; <label>:24:                                     ; preds = %10
  %25 = fdiv double %23, %2
  store double %25, double* %9, align 8
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next44, 1200
  br i1 %exitcond45, label %._crit_edge.preheader.preheader, label %8

._crit_edge.preheader.preheader:                  ; preds = %24
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %._crit_edge.preheader.preheader, %._crit_edge
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %._crit_edge ], [ 0, %._crit_edge.preheader.preheader ]
  %26 = getelementptr inbounds double, double* %6, i64 %indvars.iv37
  store double 0.000000e+00, double* %26, align 8
  %27 = getelementptr inbounds double, double* %5, i64 %indvars.iv37
  br label %28

; <label>:28:                                     ; preds = %28, %._crit_edge.preheader
  %29 = phi double [ 0.000000e+00, %._crit_edge.preheader ], [ %41, %28 ]
  %indvars.iv34 = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next35.1, %28 ]
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv34, i64 %indvars.iv37
  %31 = load double, double* %30, align 8
  %32 = load double, double* %27, align 8
  %33 = fsub double %31, %32
  %34 = fmul double %33, %33
  %35 = fadd double %29, %34
  store double %35, double* %26, align 8
  %indvars.iv.next35 = or i64 %indvars.iv34, 1
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next35, i64 %indvars.iv37
  %37 = load double, double* %36, align 8
  %38 = load double, double* %27, align 8
  %39 = fsub double %37, %38
  %40 = fmul double %39, %39
  %41 = fadd double %35, %40
  store double %41, double* %26, align 8
  %indvars.iv.next35.1 = add nsw i64 %indvars.iv34, 2
  %exitcond36.1 = icmp eq i64 %indvars.iv.next35.1, 1400
  br i1 %exitcond36.1, label %._crit_edge, label %28

._crit_edge:                                      ; preds = %28
  %42 = fdiv double %41, %2
  store double %42, double* %26, align 8
  %43 = tail call double @sqrt(double %42) #4
  %44 = fcmp ole double %43, 1.000000e-01
  %45 = select i1 %44, double 1.000000e+00, double %43
  store double %45, double* %26, align 8
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next38, 1200
  br i1 %exitcond39, label %._crit_edge7.preheader.preheader, label %._crit_edge.preheader

._crit_edge7.preheader.preheader:                 ; preds = %._crit_edge
  br label %._crit_edge7.preheader

._crit_edge7.preheader:                           ; preds = %._crit_edge7.preheader.preheader, %._crit_edge6
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %._crit_edge6 ], [ 0, %._crit_edge7.preheader.preheader ]
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7, %._crit_edge7.preheader
  %indvars.iv28 = phi i64 [ 0, %._crit_edge7.preheader ], [ %indvars.iv.next29, %._crit_edge7 ]
  %46 = getelementptr inbounds double, double* %5, i64 %indvars.iv28
  %47 = load double, double* %46, align 8
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv31, i64 %indvars.iv28
  %49 = load double, double* %48, align 8
  %50 = fsub double %49, %47
  store double %50, double* %48, align 8
  %51 = tail call double @sqrt(double %2) #4
  %52 = getelementptr inbounds double, double* %6, i64 %indvars.iv28
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = load double, double* %48, align 8
  %56 = fdiv double %55, %54
  store double %56, double* %48, align 8
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next29, 1200
  br i1 %exitcond30, label %._crit_edge6, label %._crit_edge7

._crit_edge6:                                     ; preds = %._crit_edge7
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next32, 1400
  br i1 %exitcond33, label %.lr.ph.preheader.preheader, label %._crit_edge7.preheader

.lr.ph.preheader.preheader:                       ; preds = %._crit_edge6
  br label %.lr.ph.preheader

._crit_edge8.loopexit:                            ; preds = %73
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next26, 1199
  br i1 %exitcond27, label %75, label %.lr.ph.preheader

.lr.ph.preheader:                                 ; preds = %.lr.ph.preheader.preheader, %._crit_edge8.loopexit
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %._crit_edge8.loopexit ], [ 0, %.lr.ph.preheader.preheader ]
  %indvars.iv20 = phi i64 [ %indvars.iv.next21, %._crit_edge8.loopexit ], [ 1, %.lr.ph.preheader.preheader ]
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 %indvars.iv25
  store double 1.000000e+00, double* %57, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  br label %.lr.ph

.lr.ph:                                           ; preds = %73, %.lr.ph.preheader
  %indvars.iv22 = phi i64 [ %indvars.iv20, %.lr.ph.preheader ], [ %indvars.iv.next23, %73 ]
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv25, i64 %indvars.iv22
  store double 0.000000e+00, double* %58, align 8
  br label %59

; <label>:59:                                     ; preds = %59, %.lr.ph
  %60 = phi double [ 0.000000e+00, %.lr.ph ], [ %72, %59 ]
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.1, %59 ]
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv25
  %62 = load double, double* %61, align 8
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv, i64 %indvars.iv22
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = fadd double %60, %65
  store double %66, double* %58, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv25
  %68 = load double, double* %67, align 8
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv.next, i64 %indvars.iv22
  %70 = load double, double* %69, align 8
  %71 = fmul double %68, %70
  %72 = fadd double %66, %71
  store double %72, double* %58, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 1400
  br i1 %exitcond.1, label %73, label %59

; <label>:73:                                     ; preds = %59
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv22, i64 %indvars.iv25
  store double %72, double* %74, align 8
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond = icmp eq i64 %indvars.iv.next23, 1200
  br i1 %exitcond, label %._crit_edge8.loopexit, label %.lr.ph

; <label>:75:                                     ; preds = %._crit_edge8.loopexit
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 1199, i64 1199
  store double 1.000000e+00, double* %76, align 8
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %19, %2
  %indvars.iv5 = phi i64 [ 0, %2 ], [ %indvars.iv.next6, %19 ]
  %7 = mul nuw nsw i64 %indvars.iv5, 1200
  br label %8

; <label>:8:                                      ; preds = %._crit_edge2, %._crit_edge.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next, %._crit_edge2 ]
  %9 = add nuw nsw i64 %indvars.iv, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge2

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %8, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %19, label %8

; <label>:19:                                     ; preds = %._crit_edge2
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next6, 1200
  br i1 %exitcond7, label %20, label %._crit_edge.preheader

; <label>:20:                                     ; preds = %19
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([5 x i8], [5 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
