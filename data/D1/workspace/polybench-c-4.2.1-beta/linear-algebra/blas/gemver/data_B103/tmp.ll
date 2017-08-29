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
  %5 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %6 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %7 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %8 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %9 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %10 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %11 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %12 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %13 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
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
  br label %.loopexit._crit_edge

.loopexit:                                        ; preds = %._crit_edge
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond3, label %43, label %.loopexit._crit_edge

.loopexit._crit_edge:                             ; preds = %.loopexit, %11
  %indvars.iv1 = phi i64 [ 0, %11 ], [ %indvars.iv.next2, %.loopexit ]
  %12 = trunc i64 %indvars.iv1 to i32
  %13 = sitofp i32 %12 to double
  %14 = getelementptr inbounds double, double* %3, i64 %indvars.iv1
  store double %13, double* %14, align 8
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %15 = trunc i64 %indvars.iv.next2 to i32
  %16 = sitofp i32 %15 to double
  %17 = fdiv double %16, 2.000000e+03
  %18 = fmul double %17, 5.000000e-01
  %19 = getelementptr inbounds double, double* %5, i64 %indvars.iv1
  store double %18, double* %19, align 8
  %20 = fmul double %17, 2.500000e-01
  %21 = getelementptr inbounds double, double* %4, i64 %indvars.iv1
  store double %20, double* %21, align 8
  %22 = fdiv double %17, 6.000000e+00
  %23 = getelementptr inbounds double, double* %6, i64 %indvars.iv1
  store double %22, double* %23, align 8
  %24 = fmul double %17, 1.250000e-01
  %25 = getelementptr inbounds double, double* %9, i64 %indvars.iv1
  store double %24, double* %25, align 8
  %26 = fdiv double %17, 9.000000e+00
  %27 = getelementptr inbounds double, double* %10, i64 %indvars.iv1
  store double %26, double* %27, align 8
  %28 = getelementptr inbounds double, double* %8, i64 %indvars.iv1
  store double 0.000000e+00, double* %28, align 8
  %29 = getelementptr inbounds double, double* %7, i64 %indvars.iv1
  store double 0.000000e+00, double* %29, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.loopexit._crit_edge
  %indvars.iv = phi i64 [ 0, %.loopexit._crit_edge ], [ %indvars.iv.next.1, %._crit_edge ]
  %30 = mul nuw nsw i64 %indvars.iv, %indvars.iv1
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, 2000
  %33 = sitofp i32 %32 to double
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %35 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv1
  %36 = trunc i64 %35 to i32
  %37 = srem i32 %36, 2000
  %38 = sitofp i32 %37 to double
  %39 = insertelement <2 x double> undef, double %33, i32 0
  %40 = insertelement <2 x double> %39, double %38, i32 1
  %41 = fdiv <2 x double> %40, <double 2.000000e+03, double 2.000000e+03>
  %42 = bitcast double* %34 to <2 x double>*
  store <2 x double> %41, <2 x double>* %42, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %.loopexit, label %._crit_edge

; <label>:43:                                     ; preds = %.loopexit
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemver(double, double, [2000 x double]* nocapture, double*, double* nocapture readonly, double*, double* nocapture readonly, double*, double*, double* nocapture readonly, double* nocapture readonly) unnamed_addr #2 {
  br label %._crit_edge34

._crit_edge34:                                    ; preds = %24, %11
  %indvars.iv16 = phi i64 [ 0, %11 ], [ %indvars.iv.next17, %24 ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge34
  %indvars.iv13 = phi i64 [ 0, %._crit_edge34 ], [ %indvars.iv.next14, %._crit_edge ]
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv13
  %13 = load double, double* %12, align 8
  %sunkaddr = ptrtoint double* %3 to i64
  %sunkaddr61 = mul i64 %indvars.iv16, 8
  %sunkaddr62 = add i64 %sunkaddr, %sunkaddr61
  %sunkaddr63 = inttoptr i64 %sunkaddr62 to double*
  %14 = load double, double* %sunkaddr63, align 8
  %15 = getelementptr inbounds double, double* %4, i64 %indvars.iv13
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fadd double %13, %17
  %sunkaddr64 = ptrtoint double* %5 to i64
  %sunkaddr65 = mul i64 %indvars.iv16, 8
  %sunkaddr66 = add i64 %sunkaddr64, %sunkaddr65
  %sunkaddr67 = inttoptr i64 %sunkaddr66 to double*
  %19 = load double, double* %sunkaddr67, align 8
  %20 = getelementptr inbounds double, double* %6, i64 %indvars.iv13
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = fadd double %18, %22
  store double %23, double* %12, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 2000
  br i1 %exitcond15, label %24, label %._crit_edge

; <label>:24:                                     ; preds = %._crit_edge
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 2000
  br i1 %exitcond18, label %.preheader2.preheader, label %._crit_edge34

.preheader2.preheader:                            ; preds = %24
  br label %.preheader2

.preheader2:                                      ; preds = %41, %.preheader2.preheader
  %indvars.iv10 = phi i64 [ 0, %.preheader2.preheader ], [ %indvars.iv.next11, %41 ]
  br label %._crit_edge35

._crit_edge35:                                    ; preds = %._crit_edge35, %.preheader2
  %indvars.iv7 = phi i64 [ 0, %.preheader2 ], [ %indvars.iv.next8.1, %._crit_edge35 ]
  %sunkaddr68 = ptrtoint double* %8 to i64
  %sunkaddr69 = mul i64 %indvars.iv10, 8
  %sunkaddr70 = add i64 %sunkaddr68, %sunkaddr69
  %sunkaddr71 = inttoptr i64 %sunkaddr70 to double*
  %25 = load double, double* %sunkaddr71, align 8
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv7, i64 %indvars.iv10
  %27 = load double, double* %26, align 8
  %28 = fmul double %27, %1
  %29 = getelementptr inbounds double, double* %9, i64 %indvars.iv7
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = fadd double %25, %31
  store double %32, double* %sunkaddr71, align 8
  %indvars.iv.next8 = or i64 %indvars.iv7, 1
  %sunkaddr72 = ptrtoint double* %8 to i64
  %sunkaddr73 = mul i64 %indvars.iv10, 8
  %sunkaddr74 = add i64 %sunkaddr72, %sunkaddr73
  %sunkaddr75 = inttoptr i64 %sunkaddr74 to double*
  %33 = load double, double* %sunkaddr75, align 8
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv.next8, i64 %indvars.iv10
  %35 = load double, double* %34, align 8
  %36 = fmul double %35, %1
  %37 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next8
  %38 = load double, double* %37, align 8
  %39 = fmul double %36, %38
  %40 = fadd double %33, %39
  store double %40, double* %sunkaddr75, align 8
  %indvars.iv.next8.1 = add nuw nsw i64 %indvars.iv7, 2
  %exitcond9.1 = icmp eq i64 %indvars.iv.next8.1, 2000
  br i1 %exitcond9.1, label %41, label %._crit_edge35

; <label>:41:                                     ; preds = %._crit_edge35
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 2000
  br i1 %exitcond12, label %.preheader1.preheader, label %.preheader2

.preheader1.preheader:                            ; preds = %41
  br label %.preheader1

.preheader1:                                      ; preds = %.preheader1, %.preheader1.preheader
  %indvars.iv4 = phi i64 [ 0, %.preheader1.preheader ], [ %indvars.iv.next5.4, %.preheader1 ]
  %42 = getelementptr inbounds double, double* %8, i64 %indvars.iv4
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds double, double* %10, i64 %indvars.iv4
  %45 = load double, double* %44, align 8
  %46 = fadd double %43, %45
  store double %46, double* %42, align 8
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %47 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5
  %48 = load double, double* %47, align 8
  %49 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5
  %50 = load double, double* %49, align 8
  %51 = fadd double %48, %50
  store double %51, double* %47, align 8
  %indvars.iv.next5.1 = add nuw nsw i64 %indvars.iv4, 2
  %52 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.1
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5.1
  %55 = load double, double* %54, align 8
  %56 = fadd double %53, %55
  store double %56, double* %52, align 8
  %indvars.iv.next5.2 = add nuw nsw i64 %indvars.iv4, 3
  %57 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.2
  %58 = load double, double* %57, align 8
  %59 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5.2
  %60 = load double, double* %59, align 8
  %61 = fadd double %58, %60
  store double %61, double* %57, align 8
  %indvars.iv.next5.3 = add nuw nsw i64 %indvars.iv4, 4
  %62 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.3
  %63 = load double, double* %62, align 8
  %64 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5.3
  %65 = load double, double* %64, align 8
  %66 = fadd double %63, %65
  store double %66, double* %62, align 8
  %indvars.iv.next5.4 = add nuw nsw i64 %indvars.iv4, 5
  %exitcond6.4 = icmp eq i64 %indvars.iv.next5.4, 2000
  br i1 %exitcond6.4, label %.preheader.preheader, label %.preheader1

.preheader.preheader:                             ; preds = %.preheader1
  br label %.preheader

.preheader:                                       ; preds = %83, %.preheader.preheader
  %indvars.iv1 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next2, %83 ]
  br label %._crit_edge37

._crit_edge37:                                    ; preds = %._crit_edge37, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge37 ]
  %sunkaddr76 = ptrtoint double* %7 to i64
  %sunkaddr77 = mul i64 %indvars.iv1, 8
  %sunkaddr78 = add i64 %sunkaddr76, %sunkaddr77
  %sunkaddr79 = inttoptr i64 %sunkaddr78 to double*
  %67 = load double, double* %sunkaddr79, align 8
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv
  %69 = load double, double* %68, align 8
  %70 = fmul double %69, %0
  %71 = getelementptr inbounds double, double* %8, i64 %indvars.iv
  %72 = load double, double* %71, align 8
  %73 = fmul double %70, %72
  %74 = fadd double %67, %73
  store double %74, double* %sunkaddr79, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %sunkaddr80 = ptrtoint double* %7 to i64
  %sunkaddr81 = mul i64 %indvars.iv1, 8
  %sunkaddr82 = add i64 %sunkaddr80, %sunkaddr81
  %sunkaddr83 = inttoptr i64 %sunkaddr82 to double*
  %75 = load double, double* %sunkaddr83, align 8
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv.next
  %77 = load double, double* %76, align 8
  %78 = fmul double %77, %0
  %79 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next
  %80 = load double, double* %79, align 8
  %81 = fmul double %78, %80
  %82 = fadd double %75, %81
  store double %82, double* %sunkaddr83, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %83, label %._crit_edge37

; <label>:83:                                     ; preds = %._crit_edge37
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond3, label %84, label %.preheader

; <label>:84:                                     ; preds = %83
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge, %1
  %indvars.iv = phi i64 [ 0, %1 ], [ %indvars.iv.next, %._crit_edge ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %._crit_edge1
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %10) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge1, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %15, label %._crit_edge1

; <label>:15:                                     ; preds = %._crit_edge
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
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
