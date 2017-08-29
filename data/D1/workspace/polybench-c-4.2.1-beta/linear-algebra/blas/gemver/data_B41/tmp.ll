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
  %exitcond5 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond5, label %45, label %12

; <label>:12:                                     ; preds = %.loopexit, %11
  %indvars.iv14 = phi i64 [ 0, %11 ], [ %indvars.iv.next2, %.loopexit ]
  %13 = trunc i64 %indvars.iv14 to i32
  %14 = sitofp i32 %13 to double
  %15 = getelementptr inbounds double, double* %3, i64 %indvars.iv14
  store double %14, double* %15, align 8
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv14, 1
  %16 = trunc i64 %indvars.iv.next2 to i32
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 2.000000e+03
  %19 = fmul double %18, 5.000000e-01
  %20 = getelementptr inbounds double, double* %5, i64 %indvars.iv14
  store double %19, double* %20, align 8
  %21 = fmul double %18, 2.500000e-01
  %22 = getelementptr inbounds double, double* %4, i64 %indvars.iv14
  store double %21, double* %22, align 8
  %23 = fdiv double %18, 6.000000e+00
  %24 = getelementptr inbounds double, double* %6, i64 %indvars.iv14
  store double %23, double* %24, align 8
  %25 = fmul double %18, 1.250000e-01
  %26 = getelementptr inbounds double, double* %9, i64 %indvars.iv14
  store double %25, double* %26, align 8
  %27 = fdiv double %18, 9.000000e+00
  %28 = getelementptr inbounds double, double* %10, i64 %indvars.iv14
  store double %27, double* %28, align 8
  %29 = getelementptr inbounds double, double* %8, i64 %indvars.iv14
  store double 0.000000e+00, double* %29, align 8
  %30 = getelementptr inbounds double, double* %7, i64 %indvars.iv14
  store double 0.000000e+00, double* %30, align 8
  br label %31

; <label>:31:                                     ; preds = %31, %12
  %indvars.iv3 = phi i64 [ 0, %12 ], [ %indvars.iv.next.1, %31 ]
  %32 = mul nuw nsw i64 %indvars.iv3, %indvars.iv14
  %33 = trunc i64 %32 to i32
  %34 = srem i32 %33, 2000
  %35 = sitofp i32 %34 to double
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv14, i64 %indvars.iv3
  %indvars.iv.next = or i64 %indvars.iv3, 1
  %37 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv14
  %38 = trunc i64 %37 to i32
  %39 = srem i32 %38, 2000
  %40 = sitofp i32 %39 to double
  %41 = insertelement <2 x double> undef, double %35, i32 0
  %42 = insertelement <2 x double> %41, double %40, i32 1
  %43 = fdiv <2 x double> %42, <double 2.000000e+03, double 2.000000e+03>
  %44 = bitcast double* %36 to <2 x double>*
  store <2 x double> %43, <2 x double>* %44, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv3, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %.loopexit, label %31

; <label>:45:                                     ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemver(double, double, [2000 x double]* nocapture, double* nocapture readonly, double* nocapture readonly, double* nocapture readonly, double* nocapture readonly, double* nocapture, double* nocapture, double* nocapture readonly, double* nocapture readonly) unnamed_addr #2 {
  br label %.preheader18

.preheader18:                                     ; preds = %37, %11
  %indvars.iv1525 = phi i64 [ 0, %11 ], [ %indvars.iv.next16, %37 ]
  br label %12

; <label>:12:                                     ; preds = %12, %.preheader18
  %indvars.iv1124 = phi i64 [ 0, %.preheader18 ], [ %indvars.iv.next12.1, %12 ]
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1525, i64 %indvars.iv1124
  %14 = load double, double* %13, align 8
  %sunkaddr = ptrtoint double* %3 to i64
  %sunkaddr24 = mul i64 %indvars.iv1525, 8
  %sunkaddr25 = add i64 %sunkaddr, %sunkaddr24
  %sunkaddr26 = inttoptr i64 %sunkaddr25 to double*
  %15 = load double, double* %sunkaddr26, align 8
  %16 = getelementptr inbounds double, double* %4, i64 %indvars.iv1124
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fadd double %14, %18
  %sunkaddr27 = ptrtoint double* %5 to i64
  %sunkaddr28 = mul i64 %indvars.iv1525, 8
  %sunkaddr29 = add i64 %sunkaddr27, %sunkaddr28
  %sunkaddr30 = inttoptr i64 %sunkaddr29 to double*
  %20 = load double, double* %sunkaddr30, align 8
  %21 = getelementptr inbounds double, double* %6, i64 %indvars.iv1124
  %22 = load double, double* %21, align 8
  %23 = fmul double %20, %22
  %24 = fadd double %19, %23
  store double %24, double* %13, align 8
  %indvars.iv.next12 = or i64 %indvars.iv1124, 1
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1525, i64 %indvars.iv.next12
  %26 = load double, double* %25, align 8
  %27 = load double, double* %sunkaddr26, align 8
  %28 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next12
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = fadd double %26, %30
  %32 = load double, double* %sunkaddr30, align 8
  %33 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next12
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = fadd double %31, %35
  store double %36, double* %25, align 8
  %indvars.iv.next12.1 = add nuw nsw i64 %indvars.iv1124, 2
  %exitcond14.1 = icmp eq i64 %indvars.iv.next12.1, 2000
  br i1 %exitcond14.1, label %37, label %12

; <label>:37:                                     ; preds = %12
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv1525, 1
  %exitcond29 = icmp eq i64 %indvars.iv.next16, 2000
  br i1 %exitcond29, label %.preheader17.preheader, label %.preheader18

.preheader17.preheader:                           ; preds = %37
  br label %.preheader17

.preheader17:                                     ; preds = %54, %.preheader17.preheader
  %indvars.iv923 = phi i64 [ 0, %.preheader17.preheader ], [ %indvars.iv.next10, %54 ]
  br label %38

; <label>:38:                                     ; preds = %38, %.preheader17
  %indvars.iv522 = phi i64 [ 0, %.preheader17 ], [ %indvars.iv.next6.1, %38 ]
  %sunkaddr31 = ptrtoint double* %8 to i64
  %sunkaddr32 = mul i64 %indvars.iv923, 8
  %sunkaddr33 = add i64 %sunkaddr31, %sunkaddr32
  %sunkaddr34 = inttoptr i64 %sunkaddr33 to double*
  %39 = load double, double* %sunkaddr34, align 8
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv522, i64 %indvars.iv923
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %1
  %43 = getelementptr inbounds double, double* %9, i64 %indvars.iv522
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = fadd double %39, %45
  store double %46, double* %sunkaddr34, align 8
  %indvars.iv.next6 = or i64 %indvars.iv522, 1
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv.next6, i64 %indvars.iv923
  %48 = load double, double* %47, align 8
  %49 = fmul double %48, %1
  %50 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next6
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = fadd double %46, %52
  store double %53, double* %sunkaddr34, align 8
  %indvars.iv.next6.1 = add nuw nsw i64 %indvars.iv522, 2
  %exitcond8.1 = icmp eq i64 %indvars.iv.next6.1, 2000
  br i1 %exitcond8.1, label %54, label %38

; <label>:54:                                     ; preds = %38
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv923, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next10, 2000
  br i1 %exitcond28, label %._crit_edge2.preheader, label %.preheader17

._crit_edge2.preheader:                           ; preds = %54
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2, %._crit_edge2.preheader
  %indvars.iv321 = phi i64 [ 0, %._crit_edge2.preheader ], [ %indvars.iv.next4.4, %._crit_edge2 ]
  %55 = getelementptr inbounds double, double* %8, i64 %indvars.iv321
  %56 = load double, double* %55, align 8
  %57 = getelementptr inbounds double, double* %10, i64 %indvars.iv321
  %58 = load double, double* %57, align 8
  %59 = fadd double %56, %58
  store double %59, double* %55, align 8
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv321, 1
  %60 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next4
  %61 = load double, double* %60, align 8
  %62 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next4
  %63 = load double, double* %62, align 8
  %64 = fadd double %61, %63
  store double %64, double* %60, align 8
  %indvars.iv.next4.1 = add nuw nsw i64 %indvars.iv321, 2
  %65 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next4.1
  %66 = load double, double* %65, align 8
  %67 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next4.1
  %68 = load double, double* %67, align 8
  %69 = fadd double %66, %68
  store double %69, double* %65, align 8
  %indvars.iv.next4.2 = add nuw nsw i64 %indvars.iv321, 3
  %70 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next4.2
  %71 = load double, double* %70, align 8
  %72 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next4.2
  %73 = load double, double* %72, align 8
  %74 = fadd double %71, %73
  store double %74, double* %70, align 8
  %indvars.iv.next4.3 = add nuw nsw i64 %indvars.iv321, 4
  %75 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next4.3
  %76 = load double, double* %75, align 8
  %77 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next4.3
  %78 = load double, double* %77, align 8
  %79 = fadd double %76, %78
  store double %79, double* %75, align 8
  %indvars.iv.next4.4 = add nuw nsw i64 %indvars.iv321, 5
  %exitcond27.4 = icmp eq i64 %indvars.iv.next4.4, 2000
  br i1 %exitcond27.4, label %.preheader.preheader, label %._crit_edge2

.preheader.preheader:                             ; preds = %._crit_edge2
  br label %.preheader

.preheader:                                       ; preds = %96, %.preheader.preheader
  %indvars.iv120 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next2, %96 ]
  br label %80

; <label>:80:                                     ; preds = %80, %.preheader
  %indvars.iv19 = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %80 ]
  %sunkaddr35 = ptrtoint double* %7 to i64
  %sunkaddr36 = mul i64 %indvars.iv120, 8
  %sunkaddr37 = add i64 %sunkaddr35, %sunkaddr36
  %sunkaddr38 = inttoptr i64 %sunkaddr37 to double*
  %81 = load double, double* %sunkaddr38, align 8
  %82 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv120, i64 %indvars.iv19
  %83 = load double, double* %82, align 8
  %84 = fmul double %83, %0
  %85 = getelementptr inbounds double, double* %8, i64 %indvars.iv19
  %86 = load double, double* %85, align 8
  %87 = fmul double %84, %86
  %88 = fadd double %81, %87
  store double %88, double* %sunkaddr38, align 8
  %indvars.iv.next = or i64 %indvars.iv19, 1
  %89 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv120, i64 %indvars.iv.next
  %90 = load double, double* %89, align 8
  %91 = fmul double %90, %0
  %92 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next
  %93 = load double, double* %92, align 8
  %94 = fmul double %91, %93
  %95 = fadd double %88, %94
  store double %95, double* %sunkaddr38, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv19, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %96, label %80

; <label>:96:                                     ; preds = %80
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv120, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond26, label %97, label %.preheader

; <label>:97:                                     ; preds = %96
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
  %indvars.iv1 = phi i64 [ 0, %1 ], [ %indvars.iv.next, %12 ]
  %7 = trunc i64 %indvars.iv1 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %12

; <label>:10:                                     ; preds = %6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %12

; <label>:12:                                     ; preds = %6, %10
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds double, double* %0, i64 %indvars.iv1
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
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
