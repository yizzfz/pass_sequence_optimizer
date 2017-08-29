; ModuleID = 'A.ll'
source_filename = "gemver.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"w\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %8 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %9 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %10 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %11 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %12 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %13 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %14 = bitcast i8* %5 to [2000 x double]*
  %15 = bitcast i8* %6 to double*
  %16 = bitcast i8* %7 to double*
  %17 = bitcast i8* %8 to double*
  %18 = bitcast i8* %9 to double*
  %19 = bitcast i8* %10 to double*
  %20 = bitcast i8* %11 to double*
  %21 = bitcast i8* %12 to double*
  %22 = bitcast i8* %13 to double*
  call fastcc void @init_array(double* nonnull %3, double* nonnull %4, [2000 x double]* %14, double* %15, double* %16, double* %17, double* %18, double* %19, double* %20, double* %21, double* %22)
  call void (...) @polybench_timer_start() #4
  %23 = load double, double* %3, align 8
  %24 = load double, double* %4, align 8
  call fastcc void @kernel_gemver(double %23, double %24, [2000 x double]* %14, double* %15, double* %16, double* %17, double* %18, double* %19, double* %20, double* %21, double* %22)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %25 = icmp sgt i32 %0, 42
  br i1 %25, label %26, label %31

; <label>:26:                                     ; preds = %2
  %27 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %27, align 1
  %28 = icmp eq i8 %strcmpload, 0
  br i1 %28, label %29, label %31

; <label>:29:                                     ; preds = %26
  %30 = bitcast i8* %10 to double*
  call fastcc void @print_array(double* %30)
  br label %31

; <label>:31:                                     ; preds = %26, %2, %29
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  call void @free(i8* %8) #4
  call void @free(i8* %9) #4
  call void @free(i8* %10) #4
  call void @free(i8* %11) #4
  call void @free(i8* %12) #4
  call void @free(i8* %13) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(double* nocapture, double* nocapture, [2000 x double]* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture, double* nocapture) unnamed_addr #2 {
  store double 1.500000e+00, double* %0, align 8
  store double 1.200000e+00, double* %1, align 8
  br label %12

.loopexit:                                        ; preds = %31
  %exitcond1 = icmp eq i64 %indvars.iv.next34, 2000
  br i1 %exitcond1, label %45, label %12

; <label>:12:                                     ; preds = %.loopexit, %11
  %indvars.iv3336 = phi i64 [ 0, %11 ], [ %indvars.iv.next34, %.loopexit ]
  %13 = trunc i64 %indvars.iv3336 to i32
  %14 = sitofp i32 %13 to double
  %15 = getelementptr inbounds double, double* %3, i64 %indvars.iv3336
  store double %14, double* %15, align 8
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv3336, 1
  %16 = trunc i64 %indvars.iv.next34 to i32
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 2.000000e+03
  %19 = fmul double %18, 5.000000e-01
  %20 = getelementptr inbounds double, double* %5, i64 %indvars.iv3336
  store double %19, double* %20, align 8
  %21 = fmul double %18, 2.500000e-01
  %22 = getelementptr inbounds double, double* %4, i64 %indvars.iv3336
  store double %21, double* %22, align 8
  %23 = fdiv double %18, 6.000000e+00
  %24 = getelementptr inbounds double, double* %6, i64 %indvars.iv3336
  store double %23, double* %24, align 8
  %25 = fmul double %18, 1.250000e-01
  %26 = getelementptr inbounds double, double* %9, i64 %indvars.iv3336
  store double %25, double* %26, align 8
  %27 = fdiv double %18, 9.000000e+00
  %28 = getelementptr inbounds double, double* %10, i64 %indvars.iv3336
  store double %27, double* %28, align 8
  %29 = getelementptr inbounds double, double* %8, i64 %indvars.iv3336
  store double 0.000000e+00, double* %29, align 8
  %30 = getelementptr inbounds double, double* %7, i64 %indvars.iv3336
  store double 0.000000e+00, double* %30, align 8
  br label %31

; <label>:31:                                     ; preds = %31, %12
  %indvars.iv35 = phi i64 [ 0, %12 ], [ %indvars.iv.next.1, %31 ]
  %32 = mul nuw nsw i64 %indvars.iv35, %indvars.iv3336
  %33 = trunc i64 %32 to i32
  %34 = srem i32 %33, 2000
  %35 = sitofp i32 %34 to double
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv3336, i64 %indvars.iv35
  %indvars.iv.next = or i64 %indvars.iv35, 1
  %37 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv3336
  %38 = trunc i64 %37 to i32
  %39 = srem i32 %38, 2000
  %40 = sitofp i32 %39 to double
  %41 = insertelement <2 x double> undef, double %35, i32 0
  %42 = insertelement <2 x double> %41, double %40, i32 1
  %43 = fdiv <2 x double> %42, <double 2.000000e+03, double 2.000000e+03>
  %44 = bitcast double* %36 to <2 x double>*
  store <2 x double> %43, <2 x double>* %44, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv35, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %.loopexit, label %31

; <label>:45:                                     ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemver(double, double, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture readonly, double* nocapture readonly, double* nocapture readonly, double* nocapture, double* nocapture, double* nocapture readonly, double* nocapture readonly) unnamed_addr #2 {
  br label %.preheader73

.preheader73:                                     ; preds = %37, %11
  %indvars.iv7080 = phi i64 [ 0, %11 ], [ %indvars.iv.next71, %37 ]
  br label %12

; <label>:12:                                     ; preds = %12, %.preheader73
  %indvars.iv6679 = phi i64 [ 0, %.preheader73 ], [ %indvars.iv.next67.1, %12 ]
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv7080, i64 %indvars.iv6679
  %14 = load double, double* %13, align 8
  %sunkaddr = ptrtoint double* %3 to i64
  %sunkaddr29 = mul i64 %indvars.iv7080, 8
  %sunkaddr30 = add i64 %sunkaddr, %sunkaddr29
  %sunkaddr31 = inttoptr i64 %sunkaddr30 to double*
  %15 = load double, double* %sunkaddr31, align 8
  %16 = getelementptr inbounds double, double* %4, i64 %indvars.iv6679
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fadd double %14, %18
  %sunkaddr32 = ptrtoint double* %5 to i64
  %sunkaddr33 = mul i64 %indvars.iv7080, 8
  %sunkaddr34 = add i64 %sunkaddr32, %sunkaddr33
  %sunkaddr35 = inttoptr i64 %sunkaddr34 to double*
  %20 = load double, double* %sunkaddr35, align 8
  %21 = getelementptr inbounds double, double* %6, i64 %indvars.iv6679
  %22 = load double, double* %21, align 8
  %23 = fmul double %20, %22
  %24 = fadd double %19, %23
  store double %24, double* %13, align 8
  %indvars.iv.next67 = or i64 %indvars.iv6679, 1
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv7080, i64 %indvars.iv.next67
  %26 = load double, double* %25, align 8
  %27 = load double, double* %sunkaddr31, align 8
  %28 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next67
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = fadd double %26, %30
  %32 = load double, double* %sunkaddr35, align 8
  %33 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next67
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = fadd double %31, %35
  store double %36, double* %25, align 8
  %indvars.iv.next67.1 = add nuw nsw i64 %indvars.iv6679, 2
  %exitcond69.1 = icmp eq i64 %indvars.iv.next67.1, 2000
  br i1 %exitcond69.1, label %37, label %12

; <label>:37:                                     ; preds = %12
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv7080, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next71, 2000
  br i1 %exitcond4, label %.preheader72.preheader, label %.preheader73

.preheader72.preheader:                           ; preds = %37
  br label %.preheader72

.preheader72:                                     ; preds = %55, %.preheader72.preheader
  %indvars.iv6478 = phi i64 [ 0, %.preheader72.preheader ], [ %indvars.iv.next65, %55 ]
  %38 = getelementptr inbounds double, double* %8, i64 %indvars.iv6478
  %.pre = load double, double* %38, align 8
  br label %39

; <label>:39:                                     ; preds = %39, %.preheader72
  %40 = phi double [ %.pre, %.preheader72 ], [ %54, %39 ]
  %indvars.iv6077 = phi i64 [ 0, %.preheader72 ], [ %indvars.iv.next61.1, %39 ]
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv6077, i64 %indvars.iv6478
  %42 = load double, double* %41, align 8
  %43 = fmul double %42, %1
  %44 = getelementptr inbounds double, double* %9, i64 %indvars.iv6077
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = fadd double %40, %46
  %sunkaddr36 = ptrtoint double* %8 to i64
  %sunkaddr37 = mul i64 %indvars.iv6478, 8
  %sunkaddr38 = add i64 %sunkaddr36, %sunkaddr37
  %sunkaddr39 = inttoptr i64 %sunkaddr38 to double*
  store double %47, double* %sunkaddr39, align 8
  %indvars.iv.next61 = or i64 %indvars.iv6077, 1
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv.next61, i64 %indvars.iv6478
  %49 = load double, double* %48, align 8
  %50 = fmul double %49, %1
  %51 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next61
  %52 = load double, double* %51, align 8
  %53 = fmul double %50, %52
  %54 = fadd double %47, %53
  store double %54, double* %sunkaddr39, align 8
  %indvars.iv.next61.1 = add nuw nsw i64 %indvars.iv6077, 2
  %exitcond63.1 = icmp eq i64 %indvars.iv.next61.1, 2000
  br i1 %exitcond63.1, label %55, label %39

; <label>:55:                                     ; preds = %39
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv6478, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next65, 2000
  br i1 %exitcond3, label %._crit_edge7.preheader, label %.preheader72

._crit_edge7.preheader:                           ; preds = %55
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7, %._crit_edge7.preheader
  %indvars.iv5876 = phi i64 [ 0, %._crit_edge7.preheader ], [ %indvars.iv.next59.4, %._crit_edge7 ]
  %56 = getelementptr inbounds double, double* %8, i64 %indvars.iv5876
  %57 = load double, double* %56, align 8
  %58 = getelementptr inbounds double, double* %10, i64 %indvars.iv5876
  %59 = load double, double* %58, align 8
  %60 = fadd double %57, %59
  store double %60, double* %56, align 8
  %indvars.iv.next59 = add nuw nsw i64 %indvars.iv5876, 1
  %61 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next59
  %62 = load double, double* %61, align 8
  %63 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next59
  %64 = load double, double* %63, align 8
  %65 = fadd double %62, %64
  store double %65, double* %61, align 8
  %indvars.iv.next59.1 = add nuw nsw i64 %indvars.iv5876, 2
  %66 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next59.1
  %67 = load double, double* %66, align 8
  %68 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next59.1
  %69 = load double, double* %68, align 8
  %70 = fadd double %67, %69
  store double %70, double* %66, align 8
  %indvars.iv.next59.2 = add nuw nsw i64 %indvars.iv5876, 3
  %71 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next59.2
  %72 = load double, double* %71, align 8
  %73 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next59.2
  %74 = load double, double* %73, align 8
  %75 = fadd double %72, %74
  store double %75, double* %71, align 8
  %indvars.iv.next59.3 = add nuw nsw i64 %indvars.iv5876, 4
  %76 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next59.3
  %77 = load double, double* %76, align 8
  %78 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next59.3
  %79 = load double, double* %78, align 8
  %80 = fadd double %77, %79
  store double %80, double* %76, align 8
  %indvars.iv.next59.4 = add nuw nsw i64 %indvars.iv5876, 5
  %exitcond2.4 = icmp eq i64 %indvars.iv.next59.4, 2000
  br i1 %exitcond2.4, label %.preheader.preheader, label %._crit_edge7

.preheader.preheader:                             ; preds = %._crit_edge7
  br label %.preheader

.preheader:                                       ; preds = %98, %.preheader.preheader
  %indvars.iv5675 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next57, %98 ]
  %81 = getelementptr inbounds double, double* %7, i64 %indvars.iv5675
  %.pre5 = load double, double* %81, align 8
  br label %82

; <label>:82:                                     ; preds = %82, %.preheader
  %83 = phi double [ %.pre5, %.preheader ], [ %97, %82 ]
  %indvars.iv74 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %82 ]
  %84 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv5675, i64 %indvars.iv74
  %85 = load double, double* %84, align 8
  %86 = fmul double %85, %0
  %87 = getelementptr inbounds double, double* %8, i64 %indvars.iv74
  %88 = load double, double* %87, align 8
  %89 = fmul double %86, %88
  %90 = fadd double %83, %89
  %sunkaddr40 = ptrtoint double* %7 to i64
  %sunkaddr41 = mul i64 %indvars.iv5675, 8
  %sunkaddr42 = add i64 %sunkaddr40, %sunkaddr41
  %sunkaddr43 = inttoptr i64 %sunkaddr42 to double*
  store double %90, double* %sunkaddr43, align 8
  %indvars.iv.next = or i64 %indvars.iv74, 1
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv5675, i64 %indvars.iv.next
  %92 = load double, double* %91, align 8
  %93 = fmul double %92, %0
  %94 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next
  %95 = load double, double* %94, align 8
  %96 = fmul double %93, %95
  %97 = fadd double %90, %96
  store double %97, double* %sunkaddr43, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv74, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %98, label %82

; <label>:98:                                     ; preds = %82
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv5675, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next57, 2000
  br i1 %exitcond1, label %99, label %.preheader

; <label>:99:                                     ; preds = %98
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %6

; <label>:6:                                      ; preds = %12, %1
  %indvars.iv4 = phi i64 [ 0, %1 ], [ %indvars.iv.next, %12 ]
  %7 = trunc i64 %indvars.iv4 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %12

; <label>:10:                                     ; preds = %6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %12

; <label>:12:                                     ; preds = %6, %10
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds double, double* %0, i64 %indvars.iv4
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv4, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %17, label %6

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
