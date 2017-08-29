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
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %43, %11
  %indvars.iv1 = phi i64 [ 0, %11 ], [ %indvars.iv.next2, %43 ]
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

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge4
  %indvars.iv = phi i64 [ 0, %._crit_edge4 ], [ %indvars.iv.next.1, %._crit_edge ]
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
  br i1 %exitcond.1, label %43, label %._crit_edge

; <label>:43:                                     ; preds = %._crit_edge
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond3, label %44, label %._crit_edge4

; <label>:44:                                     ; preds = %43
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemver(double, double, [2000 x double]* nocapture, double*, double* nocapture readonly, double*, double* nocapture readonly, double*, double*, double* nocapture readonly, double* nocapture readonly) unnamed_addr #2 {
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %36, %11
  %indvars.iv16 = phi i64 [ 0, %11 ], [ %indvars.iv.next17, %36 ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge19
  %indvars.iv13 = phi i64 [ 0, %._crit_edge19 ], [ %indvars.iv.next14.1, %._crit_edge ]
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv13
  %13 = load double, double* %12, align 8
  %sunkaddr = ptrtoint double* %3 to i64
  %sunkaddr41 = mul i64 %indvars.iv16, 8
  %sunkaddr42 = add i64 %sunkaddr, %sunkaddr41
  %sunkaddr43 = inttoptr i64 %sunkaddr42 to double*
  %14 = load double, double* %sunkaddr43, align 8
  %15 = getelementptr inbounds double, double* %4, i64 %indvars.iv13
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fadd double %13, %17
  %sunkaddr44 = ptrtoint double* %5 to i64
  %sunkaddr45 = mul i64 %indvars.iv16, 8
  %sunkaddr46 = add i64 %sunkaddr44, %sunkaddr45
  %sunkaddr47 = inttoptr i64 %sunkaddr46 to double*
  %19 = load double, double* %sunkaddr47, align 8
  %20 = getelementptr inbounds double, double* %6, i64 %indvars.iv13
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = fadd double %18, %22
  store double %23, double* %12, align 8
  %indvars.iv.next14 = or i64 %indvars.iv13, 1
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv.next14
  %25 = load double, double* %24, align 8
  %26 = load double, double* %sunkaddr43, align 8
  %27 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next14
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = fadd double %25, %29
  %31 = load double, double* %sunkaddr47, align 8
  %32 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next14
  %33 = load double, double* %32, align 8
  %34 = fmul double %31, %33
  %35 = fadd double %30, %34
  store double %35, double* %24, align 8
  %indvars.iv.next14.1 = add nuw nsw i64 %indvars.iv13, 2
  %exitcond15.1 = icmp eq i64 %indvars.iv.next14.1, 2000
  br i1 %exitcond15.1, label %36, label %._crit_edge

; <label>:36:                                     ; preds = %._crit_edge
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 2000
  br i1 %exitcond18, label %._crit_edge21.preheader, label %._crit_edge19

._crit_edge21.preheader:                          ; preds = %36
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %52, %._crit_edge21.preheader
  %indvars.iv10 = phi i64 [ 0, %._crit_edge21.preheader ], [ %indvars.iv.next11, %52 ]
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge20, %._crit_edge21
  %indvars.iv7 = phi i64 [ 0, %._crit_edge21 ], [ %indvars.iv.next8.1, %._crit_edge20 ]
  %sunkaddr48 = ptrtoint double* %8 to i64
  %sunkaddr49 = mul i64 %indvars.iv10, 8
  %sunkaddr50 = add i64 %sunkaddr48, %sunkaddr49
  %sunkaddr51 = inttoptr i64 %sunkaddr50 to double*
  %37 = load double, double* %sunkaddr51, align 8
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv7, i64 %indvars.iv10
  %39 = load double, double* %38, align 8
  %40 = fmul double %39, %1
  %41 = getelementptr inbounds double, double* %9, i64 %indvars.iv7
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fadd double %37, %43
  store double %44, double* %sunkaddr51, align 8
  %indvars.iv.next8 = or i64 %indvars.iv7, 1
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv.next8, i64 %indvars.iv10
  %46 = load double, double* %45, align 8
  %47 = fmul double %46, %1
  %48 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next8
  %49 = load double, double* %48, align 8
  %50 = fmul double %47, %49
  %51 = fadd double %44, %50
  store double %51, double* %sunkaddr51, align 8
  %indvars.iv.next8.1 = add nuw nsw i64 %indvars.iv7, 2
  %exitcond9.1 = icmp eq i64 %indvars.iv.next8.1, 2000
  br i1 %exitcond9.1, label %52, label %._crit_edge20

; <label>:52:                                     ; preds = %._crit_edge20
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 2000
  br i1 %exitcond12, label %._crit_edge22.preheader, label %._crit_edge21

._crit_edge22.preheader:                          ; preds = %52
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %._crit_edge22, %._crit_edge22.preheader
  %indvars.iv4 = phi i64 [ 0, %._crit_edge22.preheader ], [ %indvars.iv.next5.4, %._crit_edge22 ]
  %53 = getelementptr inbounds double, double* %8, i64 %indvars.iv4
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds double, double* %10, i64 %indvars.iv4
  %56 = load double, double* %55, align 8
  %57 = fadd double %54, %56
  store double %57, double* %53, align 8
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %58 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5
  %59 = load double, double* %58, align 8
  %60 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5
  %61 = load double, double* %60, align 8
  %62 = fadd double %59, %61
  store double %62, double* %58, align 8
  %indvars.iv.next5.1 = add nuw nsw i64 %indvars.iv4, 2
  %63 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.1
  %64 = load double, double* %63, align 8
  %65 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5.1
  %66 = load double, double* %65, align 8
  %67 = fadd double %64, %66
  store double %67, double* %63, align 8
  %indvars.iv.next5.2 = add nuw nsw i64 %indvars.iv4, 3
  %68 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.2
  %69 = load double, double* %68, align 8
  %70 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5.2
  %71 = load double, double* %70, align 8
  %72 = fadd double %69, %71
  store double %72, double* %68, align 8
  %indvars.iv.next5.3 = add nuw nsw i64 %indvars.iv4, 4
  %73 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.3
  %74 = load double, double* %73, align 8
  %75 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5.3
  %76 = load double, double* %75, align 8
  %77 = fadd double %74, %76
  store double %77, double* %73, align 8
  %indvars.iv.next5.4 = add nuw nsw i64 %indvars.iv4, 5
  %exitcond6.4 = icmp eq i64 %indvars.iv.next5.4, 2000
  br i1 %exitcond6.4, label %._crit_edge24.preheader, label %._crit_edge22

._crit_edge24.preheader:                          ; preds = %._crit_edge22
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %93, %._crit_edge24.preheader
  %indvars.iv1 = phi i64 [ 0, %._crit_edge24.preheader ], [ %indvars.iv.next2, %93 ]
  br label %._crit_edge23

._crit_edge23:                                    ; preds = %._crit_edge23, %._crit_edge24
  %indvars.iv = phi i64 [ 0, %._crit_edge24 ], [ %indvars.iv.next.1, %._crit_edge23 ]
  %sunkaddr52 = ptrtoint double* %7 to i64
  %sunkaddr53 = mul i64 %indvars.iv1, 8
  %sunkaddr54 = add i64 %sunkaddr52, %sunkaddr53
  %sunkaddr55 = inttoptr i64 %sunkaddr54 to double*
  %78 = load double, double* %sunkaddr55, align 8
  %79 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv
  %80 = load double, double* %79, align 8
  %81 = fmul double %80, %0
  %82 = getelementptr inbounds double, double* %8, i64 %indvars.iv
  %83 = load double, double* %82, align 8
  %84 = fmul double %81, %83
  %85 = fadd double %78, %84
  store double %85, double* %sunkaddr55, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %86 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv.next
  %87 = load double, double* %86, align 8
  %88 = fmul double %87, %0
  %89 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next
  %90 = load double, double* %89, align 8
  %91 = fmul double %88, %90
  %92 = fadd double %85, %91
  store double %92, double* %sunkaddr55, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %93, label %._crit_edge23

; <label>:93:                                     ; preds = %._crit_edge23
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond3, label %94, label %._crit_edge24

; <label>:94:                                     ; preds = %93
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(double* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #5
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
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
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %15, label %._crit_edge1

; <label>:15:                                     ; preds = %._crit_edge
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
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
