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
  %25 = bitcast i8* %5 to [2000 x double]*
  %26 = bitcast i8* %6 to double*
  %27 = bitcast i8* %7 to double*
  %28 = bitcast i8* %8 to double*
  %29 = bitcast i8* %9 to double*
  %30 = bitcast i8* %10 to double*
  %31 = bitcast i8* %11 to double*
  %32 = bitcast i8* %12 to double*
  %33 = bitcast i8* %13 to double*
  call fastcc void @kernel_gemver(double %23, double %24, [2000 x double]* %25, double* %26, double* %27, double* %28, double* %29, double* %30, double* %31, double* %32, double* %33)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %34 = icmp sgt i32 %0, 42
  br i1 %34, label %35, label %._crit_edge

; <label>:35:                                     ; preds = %2
  %36 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %36, align 1
  %37 = icmp eq i8 %strcmpload, 0
  br i1 %37, label %38, label %._crit_edge

; <label>:38:                                     ; preds = %35
  %39 = bitcast i8* %10 to double*
  call fastcc void @print_array(double* %39)
  br label %._crit_edge

._crit_edge:                                      ; preds = %35, %2, %38
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

._crit_edge4:                                     ; preds = %59, %11
  %indvars.iv1 = phi i64 [ 0, %11 ], [ %indvars.iv.next2, %59 ]
  %12 = trunc i64 %indvars.iv1 to i32
  %13 = sitofp i32 %12 to double
  %14 = getelementptr inbounds double, double* %3, i64 %indvars.iv1
  store double %13, double* %14, align 8
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %15 = trunc i64 %indvars.iv.next2 to i32
  %16 = sitofp i32 %15 to double
  %17 = getelementptr inbounds double, double* %5, i64 %indvars.iv1
  %18 = trunc i64 %indvars.iv.next2 to i32
  %19 = sitofp i32 %18 to double
  %20 = insertelement <2 x double> undef, double %16, i32 0
  %21 = insertelement <2 x double> %20, double %19, i32 1
  %22 = fdiv <2 x double> %21, <double 2.000000e+03, double 2.000000e+03>
  %23 = fmul <2 x double> %22, <double 5.000000e-01, double 2.500000e-01>
  %24 = extractelement <2 x double> %23, i32 0
  %25 = extractelement <2 x double> %23, i32 1
  store double %24, double* %17, align 8
  %26 = getelementptr inbounds double, double* %4, i64 %indvars.iv1
  store double %25, double* %26, align 8
  %27 = trunc i64 %indvars.iv.next2 to i32
  %28 = sitofp i32 %27 to double
  %29 = getelementptr inbounds double, double* %6, i64 %indvars.iv1
  %30 = trunc i64 %indvars.iv.next2 to i32
  %31 = sitofp i32 %30 to double
  %32 = fdiv double %31, 2.000000e+03
  %33 = fmul double %32, 1.250000e-01
  %34 = getelementptr inbounds double, double* %9, i64 %indvars.iv1
  store double %33, double* %34, align 8
  %35 = trunc i64 %indvars.iv.next2 to i32
  %36 = sitofp i32 %35 to double
  %37 = insertelement <2 x double> undef, double %28, i32 0
  %38 = insertelement <2 x double> %37, double %36, i32 1
  %39 = fdiv <2 x double> %38, <double 2.000000e+03, double 2.000000e+03>
  %40 = fdiv <2 x double> %39, <double 6.000000e+00, double 9.000000e+00>
  %41 = extractelement <2 x double> %40, i32 0
  %42 = extractelement <2 x double> %40, i32 1
  store double %41, double* %29, align 8
  %43 = getelementptr inbounds double, double* %10, i64 %indvars.iv1
  store double %42, double* %43, align 8
  %44 = getelementptr inbounds double, double* %8, i64 %indvars.iv1
  store double 0.000000e+00, double* %44, align 8
  %45 = getelementptr inbounds double, double* %7, i64 %indvars.iv1
  store double 0.000000e+00, double* %45, align 8
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge4
  %indvars.iv = phi i64 [ 0, %._crit_edge4 ], [ %indvars.iv.next.1, %._crit_edge ]
  %46 = mul nuw nsw i64 %indvars.iv, %indvars.iv1
  %47 = trunc i64 %46 to i32
  %48 = srem i32 %47, 2000
  %49 = sitofp i32 %48 to double
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv
  %indvars.iv.next = or i64 %indvars.iv, 1
  %51 = mul nuw nsw i64 %indvars.iv.next, %indvars.iv1
  %52 = trunc i64 %51 to i32
  %53 = srem i32 %52, 2000
  %54 = sitofp i32 %53 to double
  %55 = insertelement <2 x double> undef, double %49, i32 0
  %56 = insertelement <2 x double> %55, double %54, i32 1
  %57 = fdiv <2 x double> %56, <double 2.000000e+03, double 2.000000e+03>
  %58 = bitcast double* %50 to <2 x double>*
  store <2 x double> %57, <2 x double>* %58, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %59, label %._crit_edge

; <label>:59:                                     ; preds = %._crit_edge
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond3, label %60, label %._crit_edge4

; <label>:60:                                     ; preds = %59
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemver(double, double, [2000 x double]* nocapture, double*, double* nocapture readonly, double*, double* nocapture readonly, double*, double*, double* nocapture readonly, double* nocapture readonly) unnamed_addr #2 {
  br label %.preheader67

.preheader67:                                     ; preds = %38, %11
  %indvars.iv16 = phi i64 [ 0, %11 ], [ %indvars.iv.next17, %38 ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader67
  %indvars.iv13 = phi i64 [ 0, %.preheader67 ], [ %indvars.iv.next14.1, %._crit_edge ]
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv13
  %13 = load double, double* %12, align 8
  %sunkaddr = ptrtoint double* %3 to i64
  %sunkaddr45 = mul i64 %indvars.iv16, 8
  %sunkaddr46 = add i64 %sunkaddr, %sunkaddr45
  %sunkaddr47 = inttoptr i64 %sunkaddr46 to double*
  %14 = load double, double* %sunkaddr47, align 8
  %15 = getelementptr inbounds double, double* %4, i64 %indvars.iv13
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fadd double %13, %17
  %sunkaddr48 = ptrtoint double* %5 to i64
  %sunkaddr49 = mul i64 %indvars.iv16, 8
  %sunkaddr50 = add i64 %sunkaddr48, %sunkaddr49
  %sunkaddr51 = inttoptr i64 %sunkaddr50 to double*
  %19 = load double, double* %sunkaddr51, align 8
  %20 = getelementptr inbounds double, double* %6, i64 %indvars.iv13
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = fadd double %18, %22
  %24 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv13
  store double %23, double* %24, align 8
  %indvars.iv.next14 = or i64 %indvars.iv13, 1
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv.next14
  %26 = load double, double* %25, align 8
  %27 = load double, double* %sunkaddr47, align 8
  %28 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next14
  %29 = load double, double* %28, align 8
  %30 = fmul double %27, %29
  %31 = fadd double %26, %30
  %32 = load double, double* %sunkaddr51, align 8
  %33 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next14
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = fadd double %31, %35
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv.next14
  store double %36, double* %37, align 8
  %indvars.iv.next14.1 = add nuw nsw i64 %indvars.iv13, 2
  %exitcond15.1 = icmp eq i64 %indvars.iv.next14.1, 2000
  br i1 %exitcond15.1, label %38, label %._crit_edge

; <label>:38:                                     ; preds = %._crit_edge
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 2000
  br i1 %exitcond18, label %.preheader65.preheader, label %.preheader67

.preheader65.preheader:                           ; preds = %38
  br label %.preheader65

.preheader65:                                     ; preds = %54, %.preheader65.preheader
  %indvars.iv10 = phi i64 [ 0, %.preheader65.preheader ], [ %indvars.iv.next11, %54 ]
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19, %.preheader65
  %indvars.iv7 = phi i64 [ 0, %.preheader65 ], [ %indvars.iv.next8.1, %._crit_edge19 ]
  %sunkaddr52 = ptrtoint double* %8 to i64
  %sunkaddr53 = mul i64 %indvars.iv10, 8
  %sunkaddr54 = add i64 %sunkaddr52, %sunkaddr53
  %sunkaddr55 = inttoptr i64 %sunkaddr54 to double*
  %39 = load double, double* %sunkaddr55, align 8
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv7, i64 %indvars.iv10
  %41 = load double, double* %40, align 8
  %42 = fmul double %41, %1
  %43 = getelementptr inbounds double, double* %9, i64 %indvars.iv7
  %44 = load double, double* %43, align 8
  %45 = fmul double %42, %44
  %46 = fadd double %39, %45
  %sunkaddr56 = ptrtoint double* %8 to i64
  %sunkaddr57 = mul i64 %indvars.iv10, 8
  %sunkaddr58 = add i64 %sunkaddr56, %sunkaddr57
  %sunkaddr59 = inttoptr i64 %sunkaddr58 to double*
  store double %46, double* %sunkaddr59, align 8
  %indvars.iv.next8 = or i64 %indvars.iv7, 1
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv.next8, i64 %indvars.iv10
  %48 = load double, double* %47, align 8
  %49 = fmul double %48, %1
  %50 = getelementptr inbounds double, double* %9, i64 %indvars.iv.next8
  %51 = load double, double* %50, align 8
  %52 = fmul double %49, %51
  %53 = fadd double %46, %52
  store double %53, double* %sunkaddr59, align 8
  %indvars.iv.next8.1 = add nuw nsw i64 %indvars.iv7, 2
  %exitcond9.1 = icmp eq i64 %indvars.iv.next8.1, 2000
  br i1 %exitcond9.1, label %54, label %._crit_edge19

; <label>:54:                                     ; preds = %._crit_edge19
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 2000
  br i1 %exitcond12, label %.preheader64.preheader, label %.preheader65

.preheader64.preheader:                           ; preds = %54
  br label %.preheader64

.preheader64:                                     ; preds = %.preheader64, %.preheader64.preheader
  %indvars.iv4 = phi i64 [ 0, %.preheader64.preheader ], [ %indvars.iv.next5.4, %.preheader64 ]
  %55 = getelementptr inbounds double, double* %8, i64 %indvars.iv4
  %56 = load double, double* %55, align 8
  %57 = getelementptr inbounds double, double* %10, i64 %indvars.iv4
  %58 = load double, double* %57, align 8
  %59 = fadd double %56, %58
  %60 = getelementptr inbounds double, double* %8, i64 %indvars.iv4
  store double %59, double* %60, align 8
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %61 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5
  %62 = load double, double* %61, align 8
  %63 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5
  %64 = load double, double* %63, align 8
  %65 = fadd double %62, %64
  %66 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5
  store double %65, double* %66, align 8
  %indvars.iv.next5.1 = add nuw nsw i64 %indvars.iv4, 2
  %67 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.1
  %68 = load double, double* %67, align 8
  %69 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5.1
  %70 = load double, double* %69, align 8
  %71 = fadd double %68, %70
  %72 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.1
  store double %71, double* %72, align 8
  %indvars.iv.next5.2 = add nuw nsw i64 %indvars.iv4, 3
  %73 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.2
  %74 = load double, double* %73, align 8
  %75 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5.2
  %76 = load double, double* %75, align 8
  %77 = fadd double %74, %76
  %78 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.2
  store double %77, double* %78, align 8
  %indvars.iv.next5.3 = add nuw nsw i64 %indvars.iv4, 4
  %79 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.3
  %80 = load double, double* %79, align 8
  %81 = getelementptr inbounds double, double* %10, i64 %indvars.iv.next5.3
  %82 = load double, double* %81, align 8
  %83 = fadd double %80, %82
  %84 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next5.3
  store double %83, double* %84, align 8
  %indvars.iv.next5.4 = add nuw nsw i64 %indvars.iv4, 5
  %exitcond6.4 = icmp eq i64 %indvars.iv.next5.4, 2000
  br i1 %exitcond6.4, label %.preheader.preheader, label %.preheader64

.preheader.preheader:                             ; preds = %.preheader64
  br label %.preheader

.preheader:                                       ; preds = %100, %.preheader.preheader
  %indvars.iv1 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next2, %100 ]
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.1, %._crit_edge21 ]
  %sunkaddr60 = ptrtoint double* %7 to i64
  %sunkaddr61 = mul i64 %indvars.iv1, 8
  %sunkaddr62 = add i64 %sunkaddr60, %sunkaddr61
  %sunkaddr63 = inttoptr i64 %sunkaddr62 to double*
  %85 = load double, double* %sunkaddr63, align 8
  %86 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv
  %87 = load double, double* %86, align 8
  %88 = fmul double %87, %0
  %89 = getelementptr inbounds double, double* %8, i64 %indvars.iv
  %90 = load double, double* %89, align 8
  %91 = fmul double %88, %90
  %92 = fadd double %85, %91
  %sunkaddr64 = ptrtoint double* %7 to i64
  %sunkaddr65 = mul i64 %indvars.iv1, 8
  %sunkaddr66 = add i64 %sunkaddr64, %sunkaddr65
  %sunkaddr67 = inttoptr i64 %sunkaddr66 to double*
  store double %92, double* %sunkaddr67, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv.next
  %94 = load double, double* %93, align 8
  %95 = fmul double %94, %0
  %96 = getelementptr inbounds double, double* %8, i64 %indvars.iv.next
  %97 = load double, double* %96, align 8
  %98 = fmul double %95, %97
  %99 = fadd double %92, %98
  store double %99, double* %sunkaddr67, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2000
  br i1 %exitcond.1, label %100, label %._crit_edge21

; <label>:100:                                    ; preds = %._crit_edge21
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond3, label %101, label %.preheader

; <label>:101:                                    ; preds = %100
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
  br label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge, %1
  %indvars.iv = phi i64 [ 0, %1 ], [ %indvars.iv.next, %._crit_edge ]
  %6 = trunc i64 %indvars.iv to i32
  %7 = srem i32 %6, 20
  %8 = icmp eq i32 %7, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %._crit_edge._crit_edge
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %10) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge._crit_edge, %9
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %12 = getelementptr inbounds double, double* %0, i64 %indvars.iv
  %13 = load double, double* %12, align 8
  %14 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %11, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %13) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %15, label %._crit_edge._crit_edge

; <label>:15:                                     ; preds = %._crit_edge
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
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
