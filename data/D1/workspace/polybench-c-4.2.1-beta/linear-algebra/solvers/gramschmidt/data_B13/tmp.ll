; ModuleID = 'A.ll'
source_filename = "gramschmidt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"R\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [2 x i8] c"Q\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1440000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = bitcast i8* %3 to [1200 x double]*
  %7 = bitcast i8* %4 to [1200 x double]*
  %8 = bitcast i8* %5 to [1200 x double]*
  tail call void @init_array(i32 1000, i32 1200, [1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_gramschmidt(i32 1000, i32 1200, [1200 x double]* %6, [1200 x double]* %7, [1200 x double]* %8)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %9 = icmp sgt i32 %0, 42
  br i1 %9, label %10, label %14

; <label>:10:                                     ; preds = %2
  %11 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %11, align 1
  %12 = icmp eq i8 %strcmpload, 0
  br i1 %12, label %13, label %14

; <label>:13:                                     ; preds = %10
  tail call void @print_array(i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8)
  br label %14

; <label>:14:                                     ; preds = %10, %13, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) #2 {
  br label %.preheader4

.preheader4:                                      ; preds = %16, %5
  %indvars.iv15 = phi i64 [ 0, %5 ], [ %indvars.iv.next16, %16 ]
  br label %6

; <label>:6:                                      ; preds = %6, %.preheader4
  %indvars.iv12 = phi i64 [ 0, %.preheader4 ], [ %indvars.iv.next13, %6 ]
  %7 = mul nuw nsw i64 %indvars.iv12, %indvars.iv15
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 1000
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 1.000000e+03
  %12 = fmul double %11, 1.000000e+02
  %13 = fadd double %12, 1.000000e+01
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv15, i64 %indvars.iv12
  store double %13, double* %14, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv15, i64 %indvars.iv12
  store double 0.000000e+00, double* %15, align 8
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next13, 1200
  br i1 %exitcond14, label %16, label %6

; <label>:16:                                     ; preds = %6
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 1000
  br i1 %exitcond17, label %17, label %.preheader4

; <label>:17:                                     ; preds = %16
  %18 = bitcast [1200 x double]* %3 to i8*
  call void @llvm.memset.p0i8.i64(i8* %18, i8 0, i64 11520000, i32 8, i1 false)
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_gramschmidt(i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture) #0 {
  br label %.preheader5

.preheader5:                                      ; preds = %._crit_edge, %5
  %indvars.iv28 = phi i64 [ 0, %5 ], [ %indvars.iv.next29, %._crit_edge ]
  %indvars.iv23 = phi i64 [ 1, %5 ], [ %indvars.iv.next24, %._crit_edge ]
  br label %6

; <label>:6:                                      ; preds = %6, %.preheader5
  %indvars.iv = phi i64 [ 0, %.preheader5 ], [ %indvars.iv.next.4, %6 ]
  %.07 = phi double [ 0.000000e+00, %.preheader5 ], [ %26, %6 ]
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv, i64 %indvars.iv28
  %8 = load double, double* %7, align 8
  %9 = fmul double %8, %8
  %10 = fadd double %.07, %9
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next, i64 %indvars.iv28
  %12 = load double, double* %11, align 8
  %13 = fmul double %12, %12
  %14 = fadd double %10, %13
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.1, i64 %indvars.iv28
  %16 = load double, double* %15, align 8
  %17 = fmul double %16, %16
  %18 = fadd double %14, %17
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.2, i64 %indvars.iv28
  %20 = load double, double* %19, align 8
  %21 = fmul double %20, %20
  %22 = fadd double %18, %21
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next.3, i64 %indvars.iv28
  %24 = load double, double* %23, align 8
  %25 = fmul double %24, %24
  %26 = fadd double %22, %25
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 1000
  br i1 %exitcond.4, label %27, label %6

; <label>:27:                                     ; preds = %6
  %28 = tail call double @sqrt(double %26) #4
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv28, i64 %indvars.iv28
  store double %28, double* %29, align 8
  br label %31

.preheader4:                                      ; preds = %31
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %30 = icmp slt i64 %indvars.iv.next29, 1200
  br i1 %30, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader4
  br label %.lr.ph

; <label>:31:                                     ; preds = %._crit_edge32, %27
  %32 = phi double [ %28, %27 ], [ %.pre, %._crit_edge32 ]
  %indvars.iv14 = phi i64 [ 0, %27 ], [ %indvars.iv.next15.1, %._crit_edge32 ]
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv14, i64 %indvars.iv28
  %34 = load double, double* %33, align 8
  %35 = fdiv double %34, %32
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv14, i64 %indvars.iv28
  store double %35, double* %36, align 8
  %indvars.iv.next15 = or i64 %indvars.iv14, 1
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next15, i64 %indvars.iv28
  %38 = load double, double* %37, align 8
  %39 = load double, double* %29, align 8
  %40 = fdiv double %38, %39
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next15, i64 %indvars.iv28
  store double %40, double* %41, align 8
  %indvars.iv.next15.1 = add nuw nsw i64 %indvars.iv14, 2
  %exitcond16.1 = icmp eq i64 %indvars.iv.next15.1, 1000
  br i1 %exitcond16.1, label %.preheader4, label %._crit_edge32

._crit_edge32:                                    ; preds = %31
  %.pre = load double, double* %29, align 8
  br label %31

.loopexit:                                        ; preds = %.preheader
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next26, 1200
  br i1 %exitcond27, label %._crit_edge.loopexit, label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %.loopexit
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %.loopexit ], [ %indvars.iv23, %.lr.ph.preheader ]
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv28, i64 %indvars.iv25
  store double 0.000000e+00, double* %42, align 8
  br label %43

; <label>:43:                                     ; preds = %43, %.lr.ph
  %indvars.iv17 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next18.1, %43 ]
  %44 = phi double [ 0.000000e+00, %.lr.ph ], [ %56, %43 ]
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv17, i64 %indvars.iv28
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv17, i64 %indvars.iv25
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = fadd double %44, %49
  store double %50, double* %42, align 8
  %indvars.iv.next18 = or i64 %indvars.iv17, 1
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next18, i64 %indvars.iv28
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next18, i64 %indvars.iv25
  %54 = load double, double* %53, align 8
  %55 = fmul double %52, %54
  %56 = fadd double %50, %55
  store double %56, double* %42, align 8
  %indvars.iv.next18.1 = add nuw nsw i64 %indvars.iv17, 2
  %exitcond19.1 = icmp eq i64 %indvars.iv.next18.1, 1000
  br i1 %exitcond19.1, label %.preheader.preheader, label %43

.preheader.preheader:                             ; preds = %43
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.preheader..preheader_crit_edge
  %57 = phi double [ %.pre33, %.preheader..preheader_crit_edge ], [ %56, %.preheader.preheader ]
  %indvars.iv20 = phi i64 [ %indvars.iv.next21.1, %.preheader..preheader_crit_edge ], [ 0, %.preheader.preheader ]
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv20, i64 %indvars.iv25
  %59 = load double, double* %58, align 8
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv20, i64 %indvars.iv28
  %61 = load double, double* %60, align 8
  %62 = fmul double %61, %57
  %63 = fsub double %59, %62
  store double %63, double* %58, align 8
  %indvars.iv.next21 = or i64 %indvars.iv20, 1
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv.next21, i64 %indvars.iv25
  %65 = load double, double* %64, align 8
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next21, i64 %indvars.iv28
  %67 = load double, double* %66, align 8
  %68 = load double, double* %42, align 8
  %69 = fmul double %67, %68
  %70 = fsub double %65, %69
  store double %70, double* %64, align 8
  %indvars.iv.next21.1 = add nuw nsw i64 %indvars.iv20, 2
  %exitcond22.1 = icmp eq i64 %indvars.iv.next21.1, 1000
  br i1 %exitcond22.1, label %.loopexit, label %.preheader..preheader_crit_edge

.preheader..preheader_crit_edge:                  ; preds = %.preheader
  %.pre33 = load double, double* %42, align 8
  br label %.preheader

._crit_edge.loopexit:                             ; preds = %.loopexit
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader4
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next29, 1200
  br i1 %exitcond30, label %71, label %.preheader5

; <label>:71:                                     ; preds = %._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) #0 {
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #6
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.preheader4

.preheader4:                                      ; preds = %22, %4
  %indvars.iv15 = phi i64 [ 0, %4 ], [ %indvars.iv.next16, %22 ]
  %9 = mul nuw nsw i64 %indvars.iv15, 1200
  br label %10

; <label>:10:                                     ; preds = %17, %.preheader4
  %indvars.iv12 = phi i64 [ 0, %.preheader4 ], [ %indvars.iv.next13, %17 ]
  %11 = add nuw nsw i64 %indvars.iv12, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #6
  br label %17

; <label>:17:                                     ; preds = %10, %15
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv15, i64 %indvars.iv12
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #7
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next13, 1200
  br i1 %exitcond14, label %22, label %10

; <label>:22:                                     ; preds = %17
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 1200
  br i1 %exitcond17, label %23, label %.preheader4

; <label>:23:                                     ; preds = %22
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  br label %.preheader

.preheader:                                       ; preds = %41, %23
  %indvars.iv9 = phi i64 [ 0, %23 ], [ %indvars.iv.next10, %41 ]
  %28 = mul nuw nsw i64 %indvars.iv9, 1200
  br label %29

; <label>:29:                                     ; preds = %36, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %36 ]
  %30 = add nuw nsw i64 %indvars.iv, %28
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, 20
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %36

; <label>:34:                                     ; preds = %29
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %35) #6
  br label %36

; <label>:36:                                     ; preds = %29, %34
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv9, i64 %indvars.iv
  %39 = load double, double* %38, align 8
  %40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %39) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %41, label %29

; <label>:41:                                     ; preds = %36
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next10, 1000
  br i1 %exitcond11, label %42, label %.preheader

; <label>:42:                                     ; preds = %41
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %44 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %43, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.7, i64 0, i64 0)) #7
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %46 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %45) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

; Function Attrs: nounwind
declare double @sqrt(double) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
