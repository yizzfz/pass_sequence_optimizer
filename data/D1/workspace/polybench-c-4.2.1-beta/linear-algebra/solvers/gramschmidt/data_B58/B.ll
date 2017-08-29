; ModuleID = 'A.ll'
source_filename = "gramschmidt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"R\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"Q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %3 to [1200 x double]*
  %7 = bitcast i8* %4 to [1200 x double]*
  %8 = bitcast i8* %5 to [1200 x double]*
  tail call fastcc void @init_array([1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_gramschmidt([1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %16

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %16

; <label>:13:                                     ; preds = %10
  %14 = bitcast i8* %5 to [1200 x double]*
  %15 = bitcast i8* %4 to [1200 x double]*
  tail call fastcc void @print_array([1200 x double]* %15, [1200 x double]* %14)
  br label %16

; <label>:16:                                     ; preds = %10, %13, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #2 {
  br label %4

; <label>:4:                                      ; preds = %15, %3
  %indvars.iv7 = phi i64 [ 0, %3 ], [ %indvars.iv.next8, %15 ]
  br label %5

; <label>:5:                                      ; preds = %5, %4
  %indvars.iv4 = phi i64 [ 0, %4 ], [ %indvars.iv.next5, %5 ]
  %6 = mul nuw nsw i64 %indvars.iv4, %indvars.iv7
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 1000
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, 1.000000e+03
  %11 = fmul double %10, 1.000000e+02
  %12 = fadd double %11, 1.000000e+01
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv7, i64 %indvars.iv4
  store double %12, double* %13, align 8
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv7, i64 %indvars.iv4
  store double 0.000000e+00, double* %14, align 8
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1200
  br i1 %exitcond6, label %15, label %5

; <label>:15:                                     ; preds = %5
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 1000
  br i1 %exitcond9, label %16, label %4

; <label>:16:                                     ; preds = %15
  %17 = bitcast [1200 x double]* %1 to i8*
  call void @llvm.memset.p0i8.i64(i8* %17, i8 0, i64 11520000, i32 8, i1 false)
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_gramschmidt([1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) unnamed_addr #0 {
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge15, %3
  %indvars.iv34 = phi i64 [ 0, %3 ], [ %indvars.iv.next35, %._crit_edge15 ]
  %indvars.iv29 = phi i64 [ 1, %3 ], [ %indvars.iv.next30, %._crit_edge15 ]
  br label %4

; <label>:4:                                      ; preds = %4, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next.4, %4 ]
  %5 = phi double [ 0.000000e+00, %.lr.ph ], [ %25, %4 ]
  %6 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv, i64 %indvars.iv34
  %7 = load double, double* %6, align 8
  %8 = fmul double %7, %7
  %9 = fadd double %5, %8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv34
  %11 = load double, double* %10, align 8
  %12 = fmul double %11, %11
  %13 = fadd double %9, %12
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next.1, i64 %indvars.iv34
  %15 = load double, double* %14, align 8
  %16 = fmul double %15, %15
  %17 = fadd double %13, %16
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next.2, i64 %indvars.iv34
  %19 = load double, double* %18, align 8
  %20 = fmul double %19, %19
  %21 = fadd double %17, %20
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next.3, i64 %indvars.iv34
  %23 = load double, double* %22, align 8
  %24 = fmul double %23, %23
  %25 = fadd double %21, %24
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 1000
  br i1 %exitcond.4, label %._crit_edge, label %4

._crit_edge:                                      ; preds = %4
  %26 = tail call double @sqrt(double %25) #4
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv34, i64 %indvars.iv34
  store double %26, double* %27, align 8
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv34, i64 %indvars.iv34
  br label %29

; <label>:29:                                     ; preds = %29, %._crit_edge
  %indvars.iv20 = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next21.1, %29 ]
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv20, i64 %indvars.iv34
  %31 = load double, double* %30, align 8
  %32 = load double, double* %28, align 8
  %33 = fdiv double %31, %32
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv20, i64 %indvars.iv34
  store double %33, double* %34, align 8
  %indvars.iv.next21 = or i64 %indvars.iv20, 1
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next21, i64 %indvars.iv34
  %36 = load double, double* %35, align 8
  %37 = load double, double* %28, align 8
  %38 = fdiv double %36, %37
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next21, i64 %indvars.iv34
  store double %38, double* %39, align 8
  %indvars.iv.next21.1 = add nuw nsw i64 %indvars.iv20, 2
  %exitcond22.1 = icmp eq i64 %indvars.iv.next21.1, 1000
  br i1 %exitcond22.1, label %._crit_edge10, label %29

._crit_edge10:                                    ; preds = %29
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %40 = icmp slt i64 %indvars.iv.next35, 1200
  br i1 %40, label %.lr.ph14.preheader, label %._crit_edge15

.lr.ph14.preheader:                               ; preds = %._crit_edge10
  br label %.lr.ph14

.lr.ph14:                                         ; preds = %.lr.ph14.preheader, %75
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %75 ], [ %indvars.iv29, %.lr.ph14.preheader ]
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv34, i64 %indvars.iv31
  store double 0.000000e+00, double* %41, align 8
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv34, i64 %indvars.iv31
  br label %43

; <label>:43:                                     ; preds = %43, %.lr.ph14
  %indvars.iv23 = phi i64 [ 0, %.lr.ph14 ], [ %indvars.iv.next24.1, %43 ]
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv23, i64 %indvars.iv34
  %45 = load double, double* %44, align 8
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv23, i64 %indvars.iv31
  %47 = load double, double* %46, align 8
  %48 = fmul double %45, %47
  %49 = load double, double* %42, align 8
  %50 = fadd double %49, %48
  store double %50, double* %42, align 8
  %indvars.iv.next24 = or i64 %indvars.iv23, 1
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next24, i64 %indvars.iv34
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next24, i64 %indvars.iv31
  %54 = load double, double* %53, align 8
  %55 = fmul double %52, %54
  %56 = load double, double* %42, align 8
  %57 = fadd double %56, %55
  store double %57, double* %42, align 8
  %indvars.iv.next24.1 = add nuw nsw i64 %indvars.iv23, 2
  %exitcond25.1 = icmp eq i64 %indvars.iv.next24.1, 1000
  br i1 %exitcond25.1, label %58, label %43

; <label>:58:                                     ; preds = %43
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv34, i64 %indvars.iv31
  br label %60

; <label>:60:                                     ; preds = %60, %58
  %indvars.iv26 = phi i64 [ 0, %58 ], [ %indvars.iv.next27.1, %60 ]
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv26, i64 %indvars.iv31
  %62 = load double, double* %61, align 8
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv26, i64 %indvars.iv34
  %64 = load double, double* %63, align 8
  %65 = load double, double* %59, align 8
  %66 = fmul double %64, %65
  %67 = fsub double %62, %66
  store double %67, double* %61, align 8
  %indvars.iv.next27 = or i64 %indvars.iv26, 1
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv.next27, i64 %indvars.iv31
  %69 = load double, double* %68, align 8
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next27, i64 %indvars.iv34
  %71 = load double, double* %70, align 8
  %72 = load double, double* %59, align 8
  %73 = fmul double %71, %72
  %74 = fsub double %69, %73
  store double %74, double* %68, align 8
  %indvars.iv.next27.1 = add nuw nsw i64 %indvars.iv26, 2
  %exitcond28.1 = icmp eq i64 %indvars.iv.next27.1, 1000
  br i1 %exitcond28.1, label %75, label %60

; <label>:75:                                     ; preds = %60
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond33 = icmp eq i64 %indvars.iv.next32, 1200
  br i1 %exitcond33, label %._crit_edge15.loopexit, label %.lr.ph14

._crit_edge15.loopexit:                           ; preds = %75
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %._crit_edge10
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next35, 1200
  br i1 %exitcond36, label %76, label %.lr.ph

; <label>:76:                                     ; preds = %._crit_edge15
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %7

; <label>:7:                                      ; preds = %21, %2
  %indvars.iv10 = phi i64 [ 0, %2 ], [ %indvars.iv.next11, %21 ]
  %8 = mul nuw nsw i64 %indvars.iv10, 1200
  br label %9

; <label>:9:                                      ; preds = %16, %7
  %indvars.iv7 = phi i64 [ 0, %7 ], [ %indvars.iv.next8, %16 ]
  %10 = add nuw nsw i64 %indvars.iv7, %8
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3 = call i32 @fputc(i32 10, %struct._IO_FILE* %15) #6
  br label %16

; <label>:16:                                     ; preds = %14, %9
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv10, i64 %indvars.iv7
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 1200
  br i1 %exitcond9, label %21, label %9

; <label>:21:                                     ; preds = %16
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 1200
  br i1 %exitcond12, label %22, label %7

; <label>:22:                                     ; preds = %21
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  br label %27

; <label>:27:                                     ; preds = %41, %22
  %indvars.iv4 = phi i64 [ 0, %22 ], [ %indvars.iv.next5, %41 ]
  %28 = mul nuw nsw i64 %indvars.iv4, 1200
  br label %29

; <label>:29:                                     ; preds = %36, %27
  %indvars.iv = phi i64 [ 0, %27 ], [ %indvars.iv.next, %36 ]
  %30 = add nuw nsw i64 %indvars.iv, %28
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, 20
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %36

; <label>:34:                                     ; preds = %29
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %35) #6
  br label %36

; <label>:36:                                     ; preds = %34, %29
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv4, i64 %indvars.iv
  %39 = load double, double* %38, align 8
  %40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %39) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %41, label %29

; <label>:41:                                     ; preds = %36
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1000
  br i1 %exitcond6, label %42, label %27

; <label>:42:                                     ; preds = %41
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %44 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %43, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #6
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %46 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %45) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
