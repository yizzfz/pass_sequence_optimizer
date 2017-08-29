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
  br i1 %25, label %26, label %._crit_edge

; <label>:26:                                     ; preds = %2
  %27 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %27, align 1
  %28 = icmp eq i8 %strcmpload, 0
  br i1 %28, label %29, label %._crit_edge

; <label>:29:                                     ; preds = %26
  %30 = bitcast i8* %10 to double*
  call fastcc void @print_array(double* %30)
  br label %._crit_edge

._crit_edge:                                      ; preds = %26, %2, %29
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
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond3, label %45, label %12

; <label>:12:                                     ; preds = %.loopexit, %11
  %indvars.iv1 = phi i64 [ 0, %11 ], [ %indvars.iv.next2, %.loopexit ]
  %13 = trunc i64 %indvars.iv1 to i32
  %14 = sitofp i32 %13 to double
  %15 = getelementptr inbounds double, double* %3, i64 %indvars.iv1
  store double %14, double* %15, align 8
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %16 = trunc i64 %indvars.iv.next2 to i32
  %17 = sitofp i32 %16 to double
  %18 = fdiv double %17, 2.000000e+03
  %19 = fmul double %18, 5.000000e-01
  %20 = getelementptr inbounds double, double* %5, i64 %indvars.iv1
  store double %19, double* %20, align 8
  %21 = fmul double %18, 2.500000e-01
  %22 = getelementptr inbounds double, double* %4, i64 %indvars.iv1
  store double %21, double* %22, align 8
  %23 = fdiv double %18, 6.000000e+00
  %24 = getelementptr inbounds double, double* %6, i64 %indvars.iv1
  store double %23, double* %24, align 8
  %25 = fmul double %18, 1.250000e-01
  %26 = getelementptr inbounds double, double* %9, i64 %indvars.iv1
  store double %25, double* %26, align 8
  %27 = fdiv double %18, 9.000000e+00
  %28 = getelementptr inbounds double, double* %10, i64 %indvars.iv1
  store double %27, double* %28, align 8
  %29 = getelementptr inbounds double, double* %8, i64 %indvars.iv1
  store double 0.000000e+00, double* %29, align 8
  %30 = getelementptr inbounds double, double* %7, i64 %indvars.iv1
  store double 0.000000e+00, double* %30, align 8
  br label %31

; <label>:31:                                     ; preds = %31, %12
  %indvars.iv = phi i64 [ 0, %12 ], [ %indvars.iv.next.1, %31 ]
  %32 = mul nuw nsw i64 %indvars.iv, %indvars.iv1
  %33 = trunc i64 %32 to i32
  %34 = srem i32 %33, 2000
  %35 = sitofp i32 %34 to double
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %37 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv1
  %38 = trunc i64 %37 to i32
  %39 = srem i32 %38, 2000
  %40 = sitofp i32 %39 to double
  %41 = insertelement <2 x double> undef, double %35, i32 0
  %42 = insertelement <2 x double> %41, double %40, i32 1
  %43 = fdiv <2 x double> %42, <double 2.000000e+03, double 2.000000e+03>
  %44 = bitcast double* %36 to <2 x double>*
  store <2 x double> %43, <2 x double>* %44, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %.loopexit, label %31

; <label>:45:                                     ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemver(double, double, [2000 x double]* nocapture, double*, double* nocapture readonly, double*, double* nocapture readonly, double*, double*, double* nocapture readonly, double* nocapture readonly) unnamed_addr #2 {
  br label %.preheader5

.preheader5:                                      ; preds = %37, %11
  %indvars.iv16 = phi i64 [ 0, %11 ], [ %indvars.iv.next17, %37 ]
  br label %12

; <label>:12:                                     ; preds = %12, %.preheader5
  %indvars.iv13 = phi i64 [ 0, %.preheader5 ], [ %indvars.iv.next14.1, %12 ]
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv13
  %14 = load double, double* %13, align 8
  %sunkaddr = ptrtoint double* %3 to i64
  %sunkaddr41 = mul i64 %indvars.iv16, 8
  %sunkaddr42 = add i64 %sunkaddr, %sunkaddr41
  %sunkaddr43 = inttoptr i64 %sunkaddr42 to double*
  %15 = load double, double* %sunkaddr43, align 8
  %16 = getelementptr inbounds double, double* %4, i64 %indvars.iv13
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fadd double %14, %18
  %sunkaddr44 = ptrtoint double* %5 to i64
  %sunkaddr45 = mul i64 %indvars.iv16, 8
  %sunkaddr46 = add i64 %sunkaddr44, %sunkaddr45
  %sunkaddr47 = inttoptr i64 %sunkaddr46 to double*
  %20 = load double, double* %sunkaddr47, align 8
  %21 = getelementptr inbounds double, double* %6, i64 %indvars.iv13
  %22 = load double, double* %21, align 8
  %23 = fmul double %20, %22
  %24 = fadd double %19, %23
  store double %24, double* %13, align 8
  %indvars.iv.next14 = or i64 %indvars.iv13, 1
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv.next14
  %26 = load double, double* %25, align 8
  %27 = load double, double* %sunkaddr43, align 8
  %28 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next14
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = fadd double %26, %30
  %32 = load double, double* %sunkaddr47, align 8
  %33 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next14
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = fadd double %31, %35
  store double %36, double* %25, align 8
  %indvars.iv.next14.1 = add nsw i64 %indvars.iv13, 2
  %exitcond15.1 = icmp eq i64 %indvars.iv.next14.1, 2000
  br i1 %exitcond15.1, label %37, label %12

; <label>:37:                                     ; preds = %12
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 2000
  br i1 %exitcond18, label %.preheader3.preheader, label %.preheader5

.preheader3.preheader:                            ; preds = %37
  br label %.preheader3

.preheader3:                                      ; preds = %54, %.preheader3.preheader
  %indvars.iv10 = phi i64 [ 0, %.preheader3.preheader ], [ %indvars.iv.next11, %54 ]
  br label %38

; <label>:38:                                     ; preds = %38, %.preheader3
  %indvars.iv7 = phi i64 [ 0, %.preheader3 ], [ %indvars.iv.next8.1, %38 ]
  %sunkaddr48 = ptrtoint double* %8 to i64
  %sunkaddr49 = mul i64 %indvars.iv10, 8
  %sunkaddr50 = add i64 %sunkaddr48, %sunkaddr49
  %sunkaddr51 = inttoptr i64 %sunkaddr50 to double*
  %39 = load double, double* %sunkaddr51, align 8
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv7, i64 %indvars.iv10
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %1
  %43 = getelementptr inbounds double, double* %9, i64 %indvars.iv7
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = fadd double %39, %45
  store double %46, double* %sunkaddr51, align 8
  %indvars.iv.next8 = or i64 %indvars.iv7, 1
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv.next8, i64 %indvars.iv10
  %48 = load double, double* %47, align 8
  %49 = fmul double %48, %1
  %50 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next8
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = fadd double %46, %52
  store double %53, double* %sunkaddr51, align 8
  %indvars.iv.next8.1 = add nsw i64 %indvars.iv7, 2
  %exitcond9.1 = icmp eq i64 %indvars.iv.next8.1, 2000
  br i1 %exitcond9.1, label %54, label %38

; <label>:54:                                     ; preds = %38
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 2000
  br i1 %exitcond12, label %.preheader2.preheader, label %.preheader3

.preheader2.preheader:                            ; preds = %54
  br label %.preheader2

.preheader2:                                      ; preds = %.preheader2, %.preheader2.preheader
  %indvars.iv4 = phi i64 [ 0, %.preheader2.preheader ], [ %indvars.iv.next5.4, %.preheader2 ]
  %55 = getelementptr inbounds double, double* %8, i64 %indvars.iv4
  %56 = load double, double* %55, align 8
  %57 = getelementptr inbounds double, double* %10, i64 %indvars.iv4
  %58 = load double, double* %57, align 8
  %59 = fadd double %56, %58
  store double %59, double* %55, align 8
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %60 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5
  %61 = load double, double* %60, align 8
  %62 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5
  %63 = load double, double* %62, align 8
  %64 = fadd double %61, %63
  store double %64, double* %60, align 8
  %indvars.iv.next5.1 = add nsw i64 %indvars.iv4, 2
  %65 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.1
  %66 = load double, double* %65, align 8
  %67 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5.1
  %68 = load double, double* %67, align 8
  %69 = fadd double %66, %68
  store double %69, double* %65, align 8
  %indvars.iv.next5.2 = add nsw i64 %indvars.iv4, 3
  %70 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.2
  %71 = load double, double* %70, align 8
  %72 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5.2
  %73 = load double, double* %72, align 8
  %74 = fadd double %71, %73
  store double %74, double* %70, align 8
  %indvars.iv.next5.3 = add nsw i64 %indvars.iv4, 4
  %75 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.3
  %76 = load double, double* %75, align 8
  %77 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5.3
  %78 = load double, double* %77, align 8
  %79 = fadd double %76, %78
  store double %79, double* %75, align 8
  %indvars.iv.next5.4 = add nsw i64 %indvars.iv4, 5
  %exitcond6.4 = icmp eq i64 %indvars.iv.next5.4, 2000
  br i1 %exitcond6.4, label %.preheader.preheader, label %.preheader2

.preheader.preheader:                             ; preds = %.preheader2
  br label %.preheader

.preheader:                                       ; preds = %96, %.preheader.preheader
  %indvars.iv1 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next2, %96 ]
  br label %80

; <label>:80:                                     ; preds = %80, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %80 ]
  %sunkaddr52 = ptrtoint double* %7 to i64
  %sunkaddr53 = mul i64 %indvars.iv1, 8
  %sunkaddr54 = add i64 %sunkaddr52, %sunkaddr53
  %sunkaddr55 = inttoptr i64 %sunkaddr54 to double*
  %81 = load double, double* %sunkaddr55, align 8
  %82 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv
  %83 = load double, double* %82, align 8
  %84 = fmul double %83, %0
  %85 = getelementptr inbounds double, double* %8, i64 %indvars.iv
  %86 = load double, double* %85, align 8
  %87 = fmul double %84, %86
  %88 = fadd double %81, %87
  store double %88, double* %sunkaddr55, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %89 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv.next
  %90 = load double, double* %89, align 8
  %91 = fmul double %90, %0
  %92 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next
  %93 = load double, double* %92, align 8
  %94 = fmul double %91, %93
  %95 = fadd double %88, %94
  store double %95, double* %sunkaddr55, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %96, label %80

; <label>:96:                                     ; preds = %80
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond3, label %97, label %.preheader

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

; <label>:6:                                      ; preds = %._crit_edge, %1
  %indvars.iv = phi i64 [ 0, %1 ], [ %indvars.iv.next, %._crit_edge ]
  %7 = trunc i64 %indvars.iv to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge

; <label>:10:                                     ; preds = %6
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %16, label %6

; <label>:16:                                     ; preds = %._crit_edge
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #5
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
