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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i32, align 4
  %6 = alloca double, align 8
  %7 = alloca double, align 8
  %8 = alloca [2000 x [2000 x double]]*, align 8
  %9 = alloca [2000 x double]*, align 8
  %10 = alloca [2000 x double]*, align 8
  %11 = alloca [2000 x double]*, align 8
  %12 = alloca [2000 x double]*, align 8
  %13 = alloca [2000 x double]*, align 8
  %14 = alloca [2000 x double]*, align 8
  %15 = alloca [2000 x double]*, align 8
  %16 = alloca [2000 x double]*, align 8
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  store i32 2000, i32* %5, align 4
  %17 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %18 = bitcast [2000 x [2000 x double]]** %8 to i8**
  store i8* %17, i8** %18, align 8
  %19 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %20 = bitcast [2000 x double]** %9 to i8**
  store i8* %19, i8** %20, align 8
  %21 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %22 = bitcast [2000 x double]** %10 to i8**
  store i8* %21, i8** %22, align 8
  %23 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %24 = bitcast [2000 x double]** %11 to i8**
  store i8* %23, i8** %24, align 8
  %25 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %26 = bitcast [2000 x double]** %12 to i8**
  store i8* %25, i8** %26, align 8
  %27 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %28 = bitcast [2000 x double]** %13 to i8**
  store i8* %27, i8** %28, align 8
  %29 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %30 = bitcast [2000 x double]** %14 to i8**
  store i8* %29, i8** %30, align 8
  %31 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %32 = bitcast [2000 x double]** %15 to i8**
  store i8* %31, i8** %32, align 8
  %33 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %34 = bitcast [2000 x double]** %16 to i8**
  store i8* %33, i8** %34, align 8
  %35 = load i32, i32* %5, align 4
  %36 = bitcast [2000 x [2000 x double]]** %8 to [2000 x double]**
  %37 = load [2000 x double]*, [2000 x double]** %36, align 8
  %38 = bitcast [2000 x double]** %9 to double**
  %39 = load double*, double** %38, align 8
  %40 = bitcast [2000 x double]** %10 to double**
  %41 = load double*, double** %40, align 8
  %42 = bitcast [2000 x double]** %11 to double**
  %43 = load double*, double** %42, align 8
  %44 = bitcast [2000 x double]** %12 to double**
  %45 = load double*, double** %44, align 8
  %46 = bitcast [2000 x double]** %13 to double**
  %47 = load double*, double** %46, align 8
  %48 = bitcast [2000 x double]** %14 to double**
  %49 = load double*, double** %48, align 8
  %50 = bitcast [2000 x double]** %15 to double**
  %51 = load double*, double** %50, align 8
  %52 = bitcast [2000 x double]** %16 to double**
  %53 = load double*, double** %52, align 8
  call fastcc void @init_array(i32 %35, double* nonnull %6, double* nonnull %7, [2000 x double]* %37, double* %39, double* %41, double* %43, double* %45, double* %47, double* %49, double* %51, double* %53)
  call void (...) @polybench_timer_start() #4
  %54 = load i32, i32* %5, align 4
  %55 = load double, double* %6, align 8
  %56 = load double, double* %7, align 8
  %57 = bitcast [2000 x [2000 x double]]** %8 to [2000 x double]**
  %58 = load [2000 x double]*, [2000 x double]** %57, align 8
  %59 = bitcast [2000 x double]** %9 to double**
  %60 = load double*, double** %59, align 8
  %61 = bitcast [2000 x double]** %10 to double**
  %62 = load double*, double** %61, align 8
  %63 = bitcast [2000 x double]** %11 to double**
  %64 = load double*, double** %63, align 8
  %65 = bitcast [2000 x double]** %12 to double**
  %66 = load double*, double** %65, align 8
  %67 = bitcast [2000 x double]** %13 to double**
  %68 = load double*, double** %67, align 8
  %69 = bitcast [2000 x double]** %14 to double**
  %70 = load double*, double** %69, align 8
  %71 = bitcast [2000 x double]** %15 to double**
  %72 = load double*, double** %71, align 8
  %73 = bitcast [2000 x double]** %16 to double**
  %74 = load double*, double** %73, align 8
  call fastcc void @kernel_gemver(i32 %54, double %55, double %56, [2000 x double]* %58, double* %60, double* %62, double* %64, double* %66, double* %68, double* %70, double* %72, double* %74)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %75 = load i32, i32* %3, align 4
  %76 = icmp sgt i32 %75, 42
  br i1 %76, label %77, label %._crit_edge

; <label>:77:                                     ; preds = %2
  %78 = load i8**, i8*** %4, align 8
  %79 = load i8*, i8** %78, align 8
  %strcmpload = load i8, i8* %79, align 1
  %80 = icmp eq i8 %strcmpload, 0
  br i1 %80, label %81, label %._crit_edge

; <label>:81:                                     ; preds = %77
  %82 = load i32, i32* %5, align 4
  %83 = bitcast [2000 x double]** %13 to double**
  %84 = load double*, double** %83, align 8
  call fastcc void @print_array(i32 %82, double* %84)
  br label %._crit_edge

._crit_edge:                                      ; preds = %77, %2, %81
  %85 = bitcast [2000 x double]** %16 to i8**
  %86 = bitcast [2000 x double]** %15 to i8**
  %87 = bitcast [2000 x double]** %14 to i8**
  %88 = bitcast [2000 x double]** %13 to i8**
  %89 = bitcast [2000 x double]** %12 to i8**
  %90 = bitcast [2000 x double]** %11 to i8**
  %91 = bitcast [2000 x double]** %10 to i8**
  %92 = bitcast [2000 x double]** %9 to i8**
  %93 = bitcast [2000 x [2000 x double]]** %8 to i8**
  %94 = load i8*, i8** %93, align 8
  call void @free(i8* %94) #4
  %95 = load i8*, i8** %92, align 8
  call void @free(i8* %95) #4
  %96 = load i8*, i8** %91, align 8
  call void @free(i8* %96) #4
  %97 = load i8*, i8** %90, align 8
  call void @free(i8* %97) #4
  %98 = load i8*, i8** %89, align 8
  call void @free(i8* %98) #4
  %99 = load i8*, i8** %88, align 8
  call void @free(i8* %99) #4
  %100 = load i8*, i8** %87, align 8
  call void @free(i8* %100) #4
  %101 = load i8*, i8** %86, align 8
  call void @free(i8* %101) #4
  %102 = load i8*, i8** %85, align 8
  call void @free(i8* %102) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double*, double*, [2000 x double]*, double*, double*, double*, double*, double*, double*, double*, double*) unnamed_addr #2 {
  %13 = alloca i32, align 4
  %14 = alloca double*, align 8
  %15 = alloca double*, align 8
  %16 = alloca [2000 x double]*, align 8
  %17 = alloca double*, align 8
  %18 = alloca double*, align 8
  %19 = alloca double*, align 8
  %20 = alloca double*, align 8
  %21 = alloca double*, align 8
  %22 = alloca double*, align 8
  %23 = alloca double*, align 8
  %24 = alloca double*, align 8
  %25 = alloca i32, align 4
  %26 = alloca double, align 8
  store i32 %0, i32* %13, align 4
  store double* %1, double** %14, align 8
  store double* %2, double** %15, align 8
  store [2000 x double]* %3, [2000 x double]** %16, align 8
  store double* %4, double** %17, align 8
  store double* %5, double** %18, align 8
  store double* %6, double** %19, align 8
  store double* %7, double** %20, align 8
  store double* %8, double** %21, align 8
  store double* %9, double** %22, align 8
  store double* %10, double** %23, align 8
  store double* %11, double** %24, align 8
  %27 = load double*, double** %14, align 8
  store double 1.500000e+00, double* %27, align 8
  %28 = load double*, double** %15, align 8
  store double 1.200000e+00, double* %28, align 8
  %29 = load i32, i32* %13, align 4
  %30 = sitofp i32 %29 to double
  store double %30, double* %26, align 8
  store i32 0, i32* %25, align 4
  %31 = icmp sgt i32 %29, 0
  br i1 %31, label %.lr.ph6, label %._crit_edge

.lr.ph6:                                          ; preds = %12
  %32 = load double*, double** %17, align 8
  %33 = load double, double* %26, align 8
  %34 = load double*, double** %19, align 8
  %35 = load double*, double** %18, align 8
  %36 = load double*, double** %20, align 8
  %37 = load double*, double** %23, align 8
  %38 = load double*, double** %24, align 8
  %39 = load double*, double** %22, align 8
  %40 = load double*, double** %21, align 8
  %41 = load i32, i32* %13, align 4
  %wide.trip.count = zext i32 %41 to i64
  %42 = icmp sgt i32 %41, 0
  %43 = load [2000 x double]*, [2000 x double]** %16, align 8
  %.promoted = load i32, i32* %25, align 4
  %44 = sext i32 %.promoted to i64
  %45 = sext i32 %41 to i64
  %46 = insertelement <2 x double> undef, double %33, i32 0
  %47 = shufflevector <2 x double> %46, <2 x double> undef, <2 x i32> zeroinitializer
  %48 = insertelement <2 x double> undef, double %33, i32 0
  %49 = shufflevector <2 x double> %48, <2 x double> undef, <2 x i32> zeroinitializer
  br i1 %42, label %.lr.ph6.split.us.preheader, label %.lr.ph6.split.preheader

.lr.ph6.split.preheader:                          ; preds = %.lr.ph6
  br label %.lr.ph6.split

.lr.ph6.split.us.preheader:                       ; preds = %.lr.ph6
  %50 = sitofp i32 %41 to double
  %xtraiter = and i64 %wide.trip.count, 1
  %51 = fdiv double 0.000000e+00, %50
  br label %.lr.ph6.split.us

.lr.ph6.split.us:                                 ; preds = %._crit_edge.us..lr.ph6.split.us_crit_edge, %.lr.ph6.split.us.preheader
  %indvars.iv13 = phi i64 [ %44, %.lr.ph6.split.us.preheader ], [ %indvars.iv.next14, %._crit_edge.us..lr.ph6.split.us_crit_edge ]
  %storemerge4.us = phi i32 [ 0, %.lr.ph6.split.us.preheader ], [ %105, %._crit_edge.us..lr.ph6.split.us_crit_edge ]
  %52 = icmp eq i64 %xtraiter, 0
  %53 = sitofp i32 %storemerge4.us to double
  %54 = sext i32 %storemerge4.us to i64
  %55 = getelementptr inbounds double, double* %32, i64 %54
  store double %53, double* %55, align 8
  %56 = add nsw i32 %storemerge4.us, 1
  %57 = sitofp i32 %56 to double
  %58 = getelementptr inbounds double, double* %34, i64 %indvars.iv13
  %indvars.iv.next14 = add nsw i64 %indvars.iv13, 1
  %59 = trunc i64 %indvars.iv.next14 to i32
  %60 = sitofp i32 %59 to double
  %61 = insertelement <2 x double> undef, double %57, i32 0
  %62 = insertelement <2 x double> %61, double %60, i32 1
  %63 = fdiv <2 x double> %62, %47
  %64 = fmul <2 x double> %63, <double 5.000000e-01, double 2.500000e-01>
  %65 = extractelement <2 x double> %64, i32 0
  %66 = extractelement <2 x double> %64, i32 1
  store double %65, double* %58, align 8
  %67 = getelementptr inbounds double, double* %35, i64 %indvars.iv13
  store double %66, double* %67, align 8
  %68 = trunc i64 %indvars.iv.next14 to i32
  %69 = sitofp i32 %68 to double
  %70 = getelementptr inbounds double, double* %36, i64 %indvars.iv13
  %71 = trunc i64 %indvars.iv.next14 to i32
  %72 = sitofp i32 %71 to double
  %73 = fdiv double %72, %33
  %74 = fmul double %73, 1.250000e-01
  %75 = getelementptr inbounds double, double* %37, i64 %indvars.iv13
  store double %74, double* %75, align 8
  %76 = trunc i64 %indvars.iv.next14 to i32
  %77 = sitofp i32 %76 to double
  %78 = insertelement <2 x double> undef, double %69, i32 0
  %79 = insertelement <2 x double> %78, double %77, i32 1
  %80 = fdiv <2 x double> %79, %49
  %81 = fdiv <2 x double> %80, <double 6.000000e+00, double 9.000000e+00>
  %82 = extractelement <2 x double> %81, i32 0
  %83 = extractelement <2 x double> %81, i32 1
  store double %82, double* %70, align 8
  %84 = getelementptr inbounds double, double* %38, i64 %indvars.iv13
  store double %83, double* %84, align 8
  %85 = getelementptr inbounds double, double* %39, i64 %indvars.iv13
  store double 0.000000e+00, double* %85, align 8
  %86 = getelementptr inbounds double, double* %40, i64 %indvars.iv13
  store double 0.000000e+00, double* %86, align 8
  br i1 %52, label %._crit_edge21.prol.loopexit, label %._crit_edge21.prol

._crit_edge21.prol:                               ; preds = %.lr.ph6.split.us
  %87 = getelementptr inbounds [2000 x double], [2000 x double]* %43, i64 %indvars.iv13, i64 0
  store double %51, double* %87, align 8
  br label %._crit_edge21.prol.loopexit

._crit_edge21.prol.loopexit:                      ; preds = %._crit_edge21.prol, %.lr.ph6.split.us
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge21.prol ], [ 0, %.lr.ph6.split.us ]
  %88 = icmp eq i32 %41, 1
  br i1 %88, label %._crit_edge.us, label %.lr.ph6.split.us.new

.lr.ph6.split.us.new:                             ; preds = %._crit_edge21.prol.loopexit
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21, %.lr.ph6.split.us.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph6.split.us.new ], [ %indvars.iv.next.1, %._crit_edge21 ]
  %89 = mul nsw i64 %indvars.iv13, %indvars.iv
  %90 = trunc i64 %89 to i32
  %91 = srem i32 %90, %41
  %92 = sitofp i32 %91 to double
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %43, i64 %indvars.iv13, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %94 = mul nsw i64 %indvars.iv13, %indvars.iv.next
  %95 = trunc i64 %94 to i32
  %96 = srem i32 %95, %41
  %97 = sitofp i32 %96 to double
  %98 = insertelement <2 x double> undef, double %50, i32 0
  %99 = shufflevector <2 x double> %98, <2 x double> undef, <2 x i32> zeroinitializer
  %100 = insertelement <2 x double> undef, double %92, i32 0
  %101 = insertelement <2 x double> %100, double %97, i32 1
  %102 = fdiv <2 x double> %101, %99
  %103 = bitcast double* %93 to <2 x double>*
  store <2 x double> %102, <2 x double>* %103, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %._crit_edge21

._crit_edge.us.loopexit:                          ; preds = %._crit_edge21
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %._crit_edge21.prol.loopexit
  %104 = icmp slt i64 %indvars.iv.next14, %45
  br i1 %104, label %._crit_edge.us..lr.ph6.split.us_crit_edge, label %._crit_edge7.loopexit

._crit_edge.us..lr.ph6.split.us_crit_edge:        ; preds = %._crit_edge.us
  %105 = trunc i64 %indvars.iv.next14 to i32
  br label %.lr.ph6.split.us

.lr.ph6.split:                                    ; preds = %.lr.ph6.split..lr.ph6.split_crit_edge, %.lr.ph6.split.preheader
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %.lr.ph6.split..lr.ph6.split_crit_edge ], [ %44, %.lr.ph6.split.preheader ]
  %storemerge4 = phi i32 [ %141, %.lr.ph6.split..lr.ph6.split_crit_edge ], [ 0, %.lr.ph6.split.preheader ]
  %106 = sitofp i32 %storemerge4 to double
  %107 = sext i32 %storemerge4 to i64
  %108 = getelementptr inbounds double, double* %32, i64 %107
  store double %106, double* %108, align 8
  %109 = add nsw i32 %storemerge4, 1
  %110 = sitofp i32 %109 to double
  %111 = getelementptr inbounds double, double* %34, i64 %indvars.iv15
  %indvars.iv.next16 = add nsw i64 %indvars.iv15, 1
  %112 = trunc i64 %indvars.iv.next16 to i32
  %113 = sitofp i32 %112 to double
  %114 = insertelement <2 x double> undef, double %110, i32 0
  %115 = insertelement <2 x double> %114, double %113, i32 1
  %116 = fdiv <2 x double> %115, %47
  %117 = fmul <2 x double> %116, <double 5.000000e-01, double 2.500000e-01>
  %118 = extractelement <2 x double> %117, i32 0
  %119 = extractelement <2 x double> %117, i32 1
  store double %118, double* %111, align 8
  %120 = getelementptr inbounds double, double* %35, i64 %indvars.iv15
  store double %119, double* %120, align 8
  %121 = trunc i64 %indvars.iv.next16 to i32
  %122 = sitofp i32 %121 to double
  %123 = getelementptr inbounds double, double* %36, i64 %indvars.iv15
  %124 = trunc i64 %indvars.iv.next16 to i32
  %125 = sitofp i32 %124 to double
  %126 = fdiv double %125, %33
  %127 = fmul double %126, 1.250000e-01
  %128 = getelementptr inbounds double, double* %37, i64 %indvars.iv15
  store double %127, double* %128, align 8
  %129 = trunc i64 %indvars.iv.next16 to i32
  %130 = sitofp i32 %129 to double
  %131 = insertelement <2 x double> undef, double %122, i32 0
  %132 = insertelement <2 x double> %131, double %130, i32 1
  %133 = fdiv <2 x double> %132, %49
  %134 = fdiv <2 x double> %133, <double 6.000000e+00, double 9.000000e+00>
  %135 = extractelement <2 x double> %134, i32 0
  %136 = extractelement <2 x double> %134, i32 1
  store double %135, double* %123, align 8
  %137 = getelementptr inbounds double, double* %38, i64 %indvars.iv15
  store double %136, double* %137, align 8
  %138 = getelementptr inbounds double, double* %39, i64 %indvars.iv15
  store double 0.000000e+00, double* %138, align 8
  %139 = getelementptr inbounds double, double* %40, i64 %indvars.iv15
  store double 0.000000e+00, double* %139, align 8
  %140 = icmp slt i64 %indvars.iv.next16, %45
  br i1 %140, label %.lr.ph6.split..lr.ph6.split_crit_edge, label %._crit_edge7.loopexit24

.lr.ph6.split..lr.ph6.split_crit_edge:            ; preds = %.lr.ph6.split
  %141 = trunc i64 %indvars.iv.next16 to i32
  br label %.lr.ph6.split

._crit_edge7.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge7

._crit_edge7.loopexit24:                          ; preds = %.lr.ph6.split
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit24, %._crit_edge7.loopexit
  %.lcssa10.in = phi i64 [ %indvars.iv.next14, %._crit_edge7.loopexit ], [ %indvars.iv.next16, %._crit_edge7.loopexit24 ]
  %.lcssa10 = trunc i64 %.lcssa10.in to i32
  store i32 %.lcssa10, i32* %25, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %._crit_edge7
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_gemver(i32, double, double, [2000 x double]*, double*, double*, double*, double*, double*, double*, double*, double*) unnamed_addr #2 {
  %13 = alloca i32, align 4
  %14 = alloca double, align 8
  %15 = alloca double, align 8
  %16 = alloca [2000 x double]*, align 8
  %17 = alloca double*, align 8
  %18 = alloca double*, align 8
  %19 = alloca double*, align 8
  %20 = alloca double*, align 8
  %21 = alloca double*, align 8
  %22 = alloca double*, align 8
  %23 = alloca double*, align 8
  %24 = alloca double*, align 8
  %25 = alloca i32, align 4
  store i32 %0, i32* %13, align 4
  store double %1, double* %14, align 8
  store double %2, double* %15, align 8
  store [2000 x double]* %3, [2000 x double]** %16, align 8
  store double* %4, double** %17, align 8
  store double* %5, double** %18, align 8
  store double* %6, double** %19, align 8
  store double* %7, double** %20, align 8
  store double* %8, double** %21, align 8
  store double* %9, double** %22, align 8
  store double* %10, double** %23, align 8
  store double* %11, double** %24, align 8
  store i32 0, i32* %25, align 4
  %26 = load i32, i32* %13, align 4
  %27 = icmp sgt i32 %26, 0
  br i1 %27, label %.preheader11.lr.ph, label %.preheader8

.preheader11.lr.ph:                               ; preds = %12
  %28 = load i32, i32* %13, align 4
  %29 = sext i32 %28 to i64
  %30 = icmp sgt i32 %28, 0
  %31 = load [2000 x double]*, [2000 x double]** %16, align 8
  %32 = load double*, double** %17, align 8
  %33 = load double*, double** %18, align 8
  %34 = load double*, double** %19, align 8
  %35 = load double*, double** %20, align 8
  br i1 %30, label %.preheader11.us.preheader, label %.preheader10

.preheader11.us.preheader:                        ; preds = %.preheader11.lr.ph
  %.promoted35 = load i32, i32* %25, align 4
  %36 = load i32, i32* %13, align 4
  %37 = sext i32 %36 to i64
  %38 = sext i32 %.promoted35 to i64
  %39 = icmp sgt i64 %37, 1
  %smax73 = select i1 %39, i64 %37, i64 1
  %40 = icmp sgt i64 %37, 1
  %smax75 = select i1 %40, i64 %37, i64 1
  %scevgep78 = getelementptr double, double* %33, i64 %smax75
  %scevgep80 = getelementptr double, double* %35, i64 %smax75
  %n.vec = and i64 %smax73, 9223372036854775804
  br label %.preheader11.us

.preheader11.us:                                  ; preds = %._crit_edge32.us..preheader11.us_crit_edge, %.preheader11.us.preheader
  %indvar = phi i64 [ %indvar.next, %._crit_edge32.us..preheader11.us_crit_edge ], [ 0, %.preheader11.us.preheader ]
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge32.us..preheader11.us_crit_edge ], [ %38, %.preheader11.us.preheader ]
  %41 = icmp ult i64 %smax73, 4
  %42 = add i64 %38, %indvar
  %scevgep = getelementptr [2000 x double], [2000 x double]* %31, i64 %42, i64 0
  %scevgep76 = getelementptr [2000 x double], [2000 x double]* %31, i64 %42, i64 %smax75
  %43 = getelementptr inbounds double, double* %32, i64 %indvars.iv61
  %44 = getelementptr inbounds double, double* %34, i64 %indvars.iv61
  br i1 %41, label %._crit_edge.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader11.us
  %45 = icmp eq i64 %n.vec, 0
  br i1 %45, label %._crit_edge.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %43
  %bound1 = icmp ult double* %43, %scevgep76
  %found.conflict = and i1 %bound0, %bound1
  %bound083 = icmp ult double* %scevgep, %scevgep78
  %bound184 = icmp ult double* %33, %scevgep76
  %found.conflict85 = and i1 %bound083, %bound184
  %conflict.rdx = or i1 %found.conflict, %found.conflict85
  %bound088 = icmp ult double* %scevgep, %44
  %bound189 = icmp ult double* %44, %scevgep76
  %found.conflict90 = and i1 %bound088, %bound189
  %conflict.rdx91 = or i1 %conflict.rdx, %found.conflict90
  %bound092 = icmp ult double* %scevgep, %scevgep80
  %bound193 = icmp ult double* %35, %scevgep76
  %found.conflict94 = and i1 %bound092, %bound193
  %conflict.rdx95 = or i1 %conflict.rdx91, %found.conflict94
  br i1 %conflict.rdx95, label %._crit_edge.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next, %vector.body ]
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %31, i64 %indvars.iv61, i64 %index
  %47 = bitcast double* %46 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %47, align 8, !alias.scope !1, !noalias !4
  %48 = getelementptr double, double* %46, i64 2
  %49 = bitcast double* %48 to <2 x double>*
  %wide.load97 = load <2 x double>, <2 x double>* %49, align 8, !alias.scope !1, !noalias !4
  %50 = load double, double* %43, align 8, !alias.scope !9
  %51 = insertelement <2 x double> undef, double %50, i32 0
  %52 = shufflevector <2 x double> %51, <2 x double> undef, <2 x i32> zeroinitializer
  %53 = insertelement <2 x double> undef, double %50, i32 0
  %54 = shufflevector <2 x double> %53, <2 x double> undef, <2 x i32> zeroinitializer
  %55 = getelementptr inbounds double, double* %33, i64 %index
  %56 = bitcast double* %55 to <2 x double>*
  %wide.load98 = load <2 x double>, <2 x double>* %56, align 8, !alias.scope !10
  %57 = getelementptr double, double* %55, i64 2
  %58 = bitcast double* %57 to <2 x double>*
  %wide.load99 = load <2 x double>, <2 x double>* %58, align 8, !alias.scope !10
  %59 = fmul <2 x double> %52, %wide.load98
  %60 = fmul <2 x double> %54, %wide.load99
  %61 = fadd <2 x double> %wide.load, %59
  %62 = fadd <2 x double> %wide.load97, %60
  %63 = load double, double* %44, align 8, !alias.scope !11
  %64 = insertelement <2 x double> undef, double %63, i32 0
  %65 = shufflevector <2 x double> %64, <2 x double> undef, <2 x i32> zeroinitializer
  %66 = insertelement <2 x double> undef, double %63, i32 0
  %67 = shufflevector <2 x double> %66, <2 x double> undef, <2 x i32> zeroinitializer
  %68 = getelementptr inbounds double, double* %35, i64 %index
  %69 = bitcast double* %68 to <2 x double>*
  %wide.load100 = load <2 x double>, <2 x double>* %69, align 8, !alias.scope !12
  %70 = getelementptr double, double* %68, i64 2
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load101 = load <2 x double>, <2 x double>* %71, align 8, !alias.scope !12
  %72 = fmul <2 x double> %65, %wide.load100
  %73 = fmul <2 x double> %67, %wide.load101
  %74 = fadd <2 x double> %61, %72
  %75 = fadd <2 x double> %62, %73
  %76 = bitcast double* %46 to <2 x double>*
  store <2 x double> %74, <2 x double>* %76, align 8, !alias.scope !1, !noalias !4
  %77 = bitcast double* %48 to <2 x double>*
  store <2 x double> %75, <2 x double>* %77, align 8, !alias.scope !1, !noalias !4
  %index.next = add i64 %index, 4
  %78 = icmp eq i64 %index.next, %n.vec
  br i1 %78, label %middle.block, label %vector.body, !llvm.loop !13

middle.block:                                     ; preds = %vector.body
  %79 = icmp eq i64 %smax73, %n.vec
  br i1 %79, label %._crit_edge32.us, label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader11.us
  %indvars.iv59.ph = phi i64 [ 0, %.preheader11.us ], [ 0, %min.iters.checked ], [ 0, %vector.memcheck ], [ %n.vec, %middle.block ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.preheader
  %indvars.iv59 = phi i64 [ %indvars.iv59.ph, %._crit_edge.preheader ], [ %indvars.iv.next60, %._crit_edge ]
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %31, i64 %indvars.iv61, i64 %indvars.iv59
  %81 = load double, double* %80, align 8
  %82 = load double, double* %43, align 8
  %83 = getelementptr inbounds double, double* %33, i64 %indvars.iv59
  %84 = load double, double* %83, align 8
  %85 = fmul double %82, %84
  %86 = fadd double %81, %85
  %87 = load double, double* %44, align 8
  %88 = getelementptr inbounds double, double* %35, i64 %indvars.iv59
  %89 = load double, double* %88, align 8
  %90 = fmul double %87, %89
  %91 = fadd double %86, %90
  store double %91, double* %80, align 8
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %92 = icmp slt i64 %indvars.iv.next60, %37
  br i1 %92, label %._crit_edge, label %._crit_edge32.us.loopexit, !llvm.loop !16

._crit_edge32.us.loopexit:                        ; preds = %._crit_edge
  br label %._crit_edge32.us

._crit_edge32.us:                                 ; preds = %._crit_edge32.us.loopexit, %middle.block
  %indvars.iv.next62 = add nsw i64 %indvars.iv61, 1
  %93 = icmp slt i64 %indvars.iv.next62, %29
  br i1 %93, label %._crit_edge32.us..preheader11.us_crit_edge, label %.preheader10.loopexit

._crit_edge32.us..preheader11.us_crit_edge:       ; preds = %._crit_edge32.us
  %indvar.next = add i64 %indvar, 1
  br label %.preheader11.us

.preheader10.loopexit:                            ; preds = %._crit_edge32.us
  br label %.preheader10

.preheader10:                                     ; preds = %.preheader10.loopexit, %.preheader11.lr.ph
  %.pr = load i32, i32* %13, align 4
  store i32 0, i32* %25, align 4
  %94 = icmp sgt i32 %.pr, 0
  br i1 %94, label %.preheader9.lr.ph, label %.preheader7

.preheader9.lr.ph:                                ; preds = %.preheader10
  %95 = load i32, i32* %13, align 4
  %wide.trip.count53.1 = zext i32 %95 to i64
  %96 = sext i32 %95 to i64
  %97 = icmp sgt i32 %95, 0
  %98 = load double*, double** %22, align 8
  %99 = load double, double* %15, align 8
  %100 = load [2000 x double]*, [2000 x double]** %16, align 8
  %101 = load double*, double** %23, align 8
  br i1 %97, label %.preheader9.us.preheader, label %.preheader8

.preheader9.us.preheader:                         ; preds = %.preheader9.lr.ph
  %.promoted26 = load i32, i32* %25, align 4
  %102 = sext i32 %.promoted26 to i64
  %103 = and i32 %95, 1
  br label %.preheader9.us

.preheader9.us:                                   ; preds = %._crit_edge23.us, %.preheader9.us.preheader
  %indvars.iv55 = phi i64 [ %102, %.preheader9.us.preheader ], [ %indvars.iv.next56, %._crit_edge23.us ]
  %104 = icmp eq i32 %103, 0
  br i1 %104, label %.prol.loopexit66, label %.prol.preheader65

.prol.preheader65:                                ; preds = %.preheader9.us
  %105 = ptrtoint double* %98 to i64
  %sunkaddr102 = shl i64 %indvars.iv55, 3
  %sunkaddr103 = add i64 %105, %sunkaddr102
  %sunkaddr104 = inttoptr i64 %sunkaddr103 to double*
  %106 = load double, double* %sunkaddr104, align 8
  %107 = getelementptr inbounds [2000 x double], [2000 x double]* %100, i64 0, i64 %indvars.iv55
  %108 = load double, double* %107, align 8
  %109 = fmul double %99, %108
  %110 = load double, double* %101, align 8
  %111 = fmul double %109, %110
  %112 = fadd double %106, %111
  store double %112, double* %sunkaddr104, align 8
  br label %.prol.loopexit66

.prol.loopexit66:                                 ; preds = %.preheader9.us, %.prol.preheader65
  %indvars.iv51.unr.ph = phi i64 [ 1, %.prol.preheader65 ], [ 0, %.preheader9.us ]
  %113 = icmp eq i32 %95, 1
  br i1 %113, label %._crit_edge23.us, label %.preheader9.us.new.preheader

.preheader9.us.new.preheader:                     ; preds = %.prol.loopexit66
  br label %.preheader9.us.new

.preheader9.us.new:                               ; preds = %.preheader9.us.new, %.preheader9.us.new.preheader
  %indvars.iv51 = phi i64 [ %indvars.iv51.unr.ph, %.preheader9.us.new.preheader ], [ %indvars.iv.next52.1, %.preheader9.us.new ]
  %sunkaddr = ptrtoint double* %98 to i64
  %sunkaddr117 = mul i64 %indvars.iv55, 8
  %sunkaddr118 = add i64 %sunkaddr, %sunkaddr117
  %sunkaddr119 = inttoptr i64 %sunkaddr118 to double*
  %114 = load double, double* %sunkaddr119, align 8
  %115 = getelementptr inbounds [2000 x double], [2000 x double]* %100, i64 %indvars.iv51, i64 %indvars.iv55
  %116 = load double, double* %115, align 8
  %117 = fmul double %99, %116
  %118 = getelementptr inbounds double, double* %101, i64 %indvars.iv51
  %119 = load double, double* %118, align 8
  %120 = fmul double %117, %119
  %121 = fadd double %114, %120
  store double %121, double* %sunkaddr119, align 8
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %122 = getelementptr inbounds [2000 x double], [2000 x double]* %100, i64 %indvars.iv.next52, i64 %indvars.iv55
  %123 = load double, double* %122, align 8
  %124 = fmul double %99, %123
  %125 = getelementptr inbounds double, double* %101, i64 %indvars.iv.next52
  %126 = load double, double* %125, align 8
  %127 = fmul double %124, %126
  %128 = fadd double %121, %127
  store double %128, double* %sunkaddr119, align 8
  %indvars.iv.next52.1 = add nsw i64 %indvars.iv51, 2
  %exitcond54.1 = icmp eq i64 %indvars.iv.next52.1, %wide.trip.count53.1
  br i1 %exitcond54.1, label %._crit_edge23.us.loopexit, label %.preheader9.us.new

._crit_edge23.us.loopexit:                        ; preds = %.preheader9.us.new
  br label %._crit_edge23.us

._crit_edge23.us:                                 ; preds = %._crit_edge23.us.loopexit, %.prol.loopexit66
  %indvars.iv.next56 = add nsw i64 %indvars.iv55, 1
  %129 = icmp slt i64 %indvars.iv.next56, %96
  br i1 %129, label %.preheader9.us, label %.preheader8.loopexit

.preheader8.loopexit:                             ; preds = %._crit_edge23.us
  br label %.preheader8

.preheader8:                                      ; preds = %.preheader8.loopexit, %.preheader9.lr.ph, %12
  %.pr69 = load i32, i32* %13, align 4
  store i32 0, i32* %25, align 4
  %130 = icmp sgt i32 %.pr69, 0
  br i1 %130, label %.lr.ph19, label %.preheader7.thread

.preheader7.thread:                               ; preds = %.preheader8
  store i32 0, i32* %25, align 4
  br label %.preheader7._crit_edge

.lr.ph19:                                         ; preds = %.preheader8
  %131 = load double*, double** %22, align 8
  %132 = load double*, double** %24, align 8
  %133 = load i32, i32* %13, align 4
  %.promoted = load i32, i32* %25, align 4
  br label %._crit_edge71

.preheader7.loopexit:                             ; preds = %._crit_edge71
  br label %.preheader7

.preheader7:                                      ; preds = %.preheader7.loopexit, %.preheader10
  %.pr70 = load i32, i32* %13, align 4
  store i32 0, i32* %25, align 4
  %134 = icmp sgt i32 %.pr70, 0
  br i1 %134, label %.preheader.lr.ph, label %.preheader7._crit_edge

.preheader.lr.ph:                                 ; preds = %.preheader7
  %135 = load i32, i32* %13, align 4
  %wide.trip.count.1 = zext i32 %135 to i64
  %136 = sext i32 %135 to i64
  %137 = icmp sgt i32 %135, 0
  %138 = load double*, double** %21, align 8
  %139 = load double, double* %14, align 8
  %140 = load [2000 x double]*, [2000 x double]** %16, align 8
  %141 = load double*, double** %22, align 8
  %.promoted14 = load i32, i32* %25, align 4
  %142 = sext i32 %.promoted14 to i64
  br i1 %137, label %.preheader.us.preheader, label %._crit_edge13.loopexit39

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %143 = and i32 %135, 1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv48 = phi i64 [ %142, %.preheader.us.preheader ], [ %indvars.iv.next49, %._crit_edge.us ]
  %144 = icmp eq i32 %143, 0
  br i1 %144, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  %145 = ptrtoint double* %138 to i64
  %sunkaddr110 = shl i64 %indvars.iv48, 3
  %sunkaddr111 = add i64 %145, %sunkaddr110
  %sunkaddr112 = inttoptr i64 %sunkaddr111 to double*
  %146 = load double, double* %sunkaddr112, align 8
  %147 = getelementptr inbounds [2000 x double], [2000 x double]* %140, i64 %indvars.iv48, i64 0
  %148 = load double, double* %147, align 8
  %149 = fmul double %139, %148
  %150 = load double, double* %141, align 8
  %151 = fmul double %149, %150
  %152 = fadd double %146, %151
  store double %152, double* %sunkaddr112, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us ]
  %153 = icmp eq i32 %135, 1
  br i1 %153, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new, %.preheader.us.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ], [ %indvars.iv.next.1, %.preheader.us.new ]
  %sunkaddr120 = ptrtoint double* %138 to i64
  %sunkaddr121 = mul i64 %indvars.iv48, 8
  %sunkaddr122 = add i64 %sunkaddr120, %sunkaddr121
  %sunkaddr123 = inttoptr i64 %sunkaddr122 to double*
  %154 = load double, double* %sunkaddr123, align 8
  %155 = getelementptr inbounds [2000 x double], [2000 x double]* %140, i64 %indvars.iv48, i64 %indvars.iv
  %156 = load double, double* %155, align 8
  %157 = fmul double %139, %156
  %158 = getelementptr inbounds double, double* %141, i64 %indvars.iv
  %159 = load double, double* %158, align 8
  %160 = fmul double %157, %159
  %161 = fadd double %154, %160
  store double %161, double* %sunkaddr123, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %162 = getelementptr inbounds [2000 x double], [2000 x double]* %140, i64 %indvars.iv48, i64 %indvars.iv.next
  %163 = load double, double* %162, align 8
  %164 = fmul double %139, %163
  %165 = getelementptr inbounds double, double* %141, i64 %indvars.iv.next
  %166 = load double, double* %165, align 8
  %167 = fmul double %164, %166
  %168 = fadd double %161, %167
  store double %168, double* %sunkaddr123, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next49 = add nsw i64 %indvars.iv48, 1
  %169 = icmp slt i64 %indvars.iv.next49, %136
  br i1 %169, label %.preheader.us, label %._crit_edge13.loopexit

._crit_edge71:                                    ; preds = %._crit_edge71, %.lr.ph19
  %170 = phi i32 [ %.promoted, %.lr.ph19 ], [ %177, %._crit_edge71 ]
  %storemerge218 = phi i32 [ 0, %.lr.ph19 ], [ %177, %._crit_edge71 ]
  %171 = sext i32 %storemerge218 to i64
  %172 = getelementptr inbounds double, double* %131, i64 %171
  %173 = load double, double* %172, align 8
  %174 = getelementptr inbounds double, double* %132, i64 %171
  %175 = load double, double* %174, align 8
  %176 = fadd double %173, %175
  store double %176, double* %172, align 8
  %177 = add nsw i32 %170, 1
  %178 = icmp slt i32 %177, %133
  br i1 %178, label %._crit_edge71, label %.preheader7.loopexit

._crit_edge13.loopexit:                           ; preds = %._crit_edge.us
  %179 = trunc i64 %indvars.iv.next49 to i32
  br label %._crit_edge13

._crit_edge13.loopexit39:                         ; preds = %.preheader.lr.ph
  %180 = add i32 %.promoted14, 1
  %181 = icmp sgt i32 %135, %180
  %smax = select i1 %181, i32 %135, i32 %180
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit39, %._crit_edge13.loopexit
  %.lcssa15 = phi i32 [ %179, %._crit_edge13.loopexit ], [ %smax, %._crit_edge13.loopexit39 ]
  store i32 %.lcssa15, i32* %25, align 4
  br label %.preheader7._crit_edge

.preheader7._crit_edge:                           ; preds = %.preheader7, %.preheader7.thread, %._crit_edge13
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double*) unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = alloca double*, align 8
  %5 = alloca i32, align 4
  store i32 %0, i32* %3, align 4
  store double* %1, double** %4, align 8
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %6) #5
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  store i32 0, i32* %5, align 4
  %10 = load i32, i32* %3, align 4
  %11 = icmp sgt i32 %10, 0
  br i1 %11, label %.lr.ph, label %._crit_edge2

.lr.ph:                                           ; preds = %2
  %12 = load double*, double** %4, align 8
  %13 = load i32, i32* %3, align 4
  %.promoted = load i32, i32* %5, align 4
  %14 = sext i32 %.promoted to i64
  %15 = sext i32 %13 to i64
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge3.._crit_edge4_crit_edge, %.lr.ph
  %indvars.iv = phi i64 [ %14, %.lr.ph ], [ %indvars.iv.next, %._crit_edge3.._crit_edge4_crit_edge ]
  %storemerge1 = phi i32 [ 0, %.lr.ph ], [ %25, %._crit_edge3.._crit_edge4_crit_edge ]
  %16 = srem i32 %storemerge1, 20
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %._crit_edge3

; <label>:18:                                     ; preds = %._crit_edge4
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %19) #5
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge4, %18
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = getelementptr inbounds double, double* %12, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %22) #6
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %24 = icmp slt i64 %indvars.iv.next, %15
  br i1 %24, label %._crit_edge3.._crit_edge4_crit_edge, label %._crit_edge

._crit_edge3.._crit_edge4_crit_edge:              ; preds = %._crit_edge3
  %25 = trunc i64 %indvars.iv.next to i32
  br label %._crit_edge4

._crit_edge:                                      ; preds = %._crit_edge3
  %26 = trunc i64 %indvars.iv.next to i32
  store i32 %26, i32* %5, align 4
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %2, %._crit_edge
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %29) #5
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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5, !6, !7, !8}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !3}
!7 = distinct !{!7, !3}
!8 = distinct !{!8, !3}
!9 = !{!5}
!10 = !{!6}
!11 = !{!7}
!12 = !{!8}
!13 = distinct !{!13, !14, !15}
!14 = !{!"llvm.loop.vectorize.width", i32 1}
!15 = !{!"llvm.loop.interleave.count", i32 1}
!16 = distinct !{!16, !14, !15}
