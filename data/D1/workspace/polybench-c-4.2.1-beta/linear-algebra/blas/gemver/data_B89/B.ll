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
  %17 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %18 = bitcast [2000 x [2000 x double]]** %8 to i8**
  store i8* %17, i8** %18, align 8
  %19 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %20 = bitcast [2000 x double]** %9 to i8**
  store i8* %19, i8** %20, align 8
  %21 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %22 = bitcast [2000 x double]** %10 to i8**
  store i8* %21, i8** %22, align 8
  %23 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %24 = bitcast [2000 x double]** %11 to i8**
  store i8* %23, i8** %24, align 8
  %25 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %26 = bitcast [2000 x double]** %12 to i8**
  store i8* %25, i8** %26, align 8
  %27 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %28 = bitcast [2000 x double]** %13 to i8**
  store i8* %27, i8** %28, align 8
  %29 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %30 = bitcast [2000 x double]** %14 to i8**
  store i8* %29, i8** %30, align 8
  %31 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %32 = bitcast [2000 x double]** %15 to i8**
  store i8* %31, i8** %32, align 8
  %33 = call i8* @polybench_alloc_data(i64 2000, i32 8) #4
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
  %52 = bitcast i8* %33 to double*
  call fastcc void @init_array(i32 %35, double* nonnull %6, double* nonnull %7, [2000 x double]* %37, double* %39, double* %41, double* %43, double* %45, double* %47, double* %49, double* %51, double* %52)
  call void (...) @polybench_timer_start() #4
  %53 = load i32, i32* %5, align 4
  %54 = load double, double* %6, align 8
  %55 = load double, double* %7, align 8
  %56 = bitcast [2000 x [2000 x double]]** %8 to [2000 x double]**
  %57 = load [2000 x double]*, [2000 x double]** %56, align 8
  %58 = bitcast [2000 x double]** %9 to double**
  %59 = load double*, double** %58, align 8
  %60 = bitcast [2000 x double]** %10 to double**
  %61 = load double*, double** %60, align 8
  %62 = bitcast [2000 x double]** %11 to double**
  %63 = load double*, double** %62, align 8
  %64 = bitcast [2000 x double]** %12 to double**
  %65 = load double*, double** %64, align 8
  %66 = bitcast [2000 x double]** %13 to double**
  %67 = load double*, double** %66, align 8
  %68 = bitcast [2000 x double]** %14 to double**
  %69 = load double*, double** %68, align 8
  %70 = bitcast [2000 x double]** %15 to double**
  %71 = load double*, double** %70, align 8
  %72 = bitcast [2000 x double]** %16 to double**
  %73 = load double*, double** %72, align 8
  call fastcc void @kernel_gemver(i32 %53, double %54, double %55, [2000 x double]* %57, double* %59, double* %61, double* %63, double* %65, double* %67, double* %69, double* %71, double* %73)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %74 = load i32, i32* %3, align 4
  %75 = icmp sgt i32 %74, 42
  br i1 %75, label %76, label %._crit_edge

; <label>:76:                                     ; preds = %2
  %77 = load i8**, i8*** %4, align 8
  %78 = load i8*, i8** %77, align 8
  %strcmpload = load i8, i8* %78, align 1
  %79 = icmp eq i8 %strcmpload, 0
  br i1 %79, label %80, label %._crit_edge

; <label>:80:                                     ; preds = %76
  %81 = load i32, i32* %5, align 4
  %82 = bitcast [2000 x double]** %13 to double**
  %83 = load double*, double** %82, align 8
  call fastcc void @print_array(i32 %81, double* %83)
  br label %._crit_edge

._crit_edge:                                      ; preds = %76, %2, %80
  %84 = bitcast [2000 x [2000 x double]]** %8 to i8**
  %85 = load i8*, i8** %84, align 8
  call void @free(i8* %85) #4
  %86 = bitcast [2000 x double]** %9 to i8**
  %87 = load i8*, i8** %86, align 8
  call void @free(i8* %87) #4
  %88 = bitcast [2000 x double]** %10 to i8**
  %89 = load i8*, i8** %88, align 8
  call void @free(i8* %89) #4
  %90 = bitcast [2000 x double]** %11 to i8**
  %91 = load i8*, i8** %90, align 8
  call void @free(i8* %91) #4
  %92 = bitcast [2000 x double]** %12 to i8**
  %93 = load i8*, i8** %92, align 8
  call void @free(i8* %93) #4
  %94 = bitcast [2000 x double]** %13 to i8**
  %95 = load i8*, i8** %94, align 8
  call void @free(i8* %95) #4
  %96 = bitcast [2000 x double]** %14 to i8**
  %97 = load i8*, i8** %96, align 8
  call void @free(i8* %97) #4
  %98 = bitcast [2000 x double]** %15 to i8**
  %99 = load i8*, i8** %98, align 8
  call void @free(i8* %99) #4
  %100 = bitcast [2000 x double]** %16 to i8**
  %101 = load i8*, i8** %100, align 8
  call void @free(i8* %101) #4
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

.lr.ph6.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph6.split.us.preheader
  %indvars.iv13 = phi i64 [ %44, %.lr.ph6.split.us.preheader ], [ %indvars.iv.next14, %._crit_edge.us ]
  %storemerge4.us = phi i32 [ 0, %.lr.ph6.split.us.preheader ], [ %102, %._crit_edge.us ]
  %52 = icmp eq i64 %xtraiter, 0
  %53 = sitofp i32 %storemerge4.us to double
  %54 = sext i32 %storemerge4.us to i64
  %55 = getelementptr inbounds double, double* %32, i64 %54
  store double %53, double* %55, align 8
  %indvars.iv.next14 = add nsw i64 %indvars.iv13, 1
  %56 = trunc i64 %indvars.iv.next14 to i32
  %57 = sitofp i32 %56 to double
  %58 = getelementptr inbounds double, double* %34, i64 %indvars.iv13
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
  %93 = fdiv double %92, %50
  %94 = getelementptr inbounds [2000 x double], [2000 x double]* %43, i64 %indvars.iv13, i64 %indvars.iv
  store double %93, double* %94, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %95 = mul nsw i64 %indvars.iv13, %indvars.iv.next
  %96 = trunc i64 %95 to i32
  %97 = srem i32 %96, %41
  %98 = sitofp i32 %97 to double
  %99 = fdiv double %98, %50
  %100 = getelementptr inbounds [2000 x double], [2000 x double]* %43, i64 %indvars.iv13, i64 %indvars.iv.next
  store double %99, double* %100, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %._crit_edge21

._crit_edge.us.loopexit:                          ; preds = %._crit_edge21
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %._crit_edge21.prol.loopexit
  %101 = icmp slt i64 %indvars.iv.next14, %45
  %102 = trunc i64 %indvars.iv.next14 to i32
  br i1 %101, label %.lr.ph6.split.us, label %._crit_edge7.loopexit

.lr.ph6.split:                                    ; preds = %.lr.ph6.split, %.lr.ph6.split.preheader
  %indvars.iv15 = phi i64 [ %44, %.lr.ph6.split.preheader ], [ %indvars.iv.next16, %.lr.ph6.split ]
  %storemerge4 = phi i32 [ 0, %.lr.ph6.split.preheader ], [ %138, %.lr.ph6.split ]
  %103 = sitofp i32 %storemerge4 to double
  %104 = sext i32 %storemerge4 to i64
  %105 = getelementptr inbounds double, double* %32, i64 %104
  store double %103, double* %105, align 8
  %indvars.iv.next16 = add nsw i64 %indvars.iv15, 1
  %106 = trunc i64 %indvars.iv.next16 to i32
  %107 = sitofp i32 %106 to double
  %108 = getelementptr inbounds double, double* %34, i64 %indvars.iv15
  %109 = trunc i64 %indvars.iv.next16 to i32
  %110 = sitofp i32 %109 to double
  %111 = insertelement <2 x double> undef, double %107, i32 0
  %112 = insertelement <2 x double> %111, double %110, i32 1
  %113 = fdiv <2 x double> %112, %47
  %114 = fmul <2 x double> %113, <double 5.000000e-01, double 2.500000e-01>
  %115 = extractelement <2 x double> %114, i32 0
  %116 = extractelement <2 x double> %114, i32 1
  store double %115, double* %108, align 8
  %117 = getelementptr inbounds double, double* %35, i64 %indvars.iv15
  store double %116, double* %117, align 8
  %118 = trunc i64 %indvars.iv.next16 to i32
  %119 = sitofp i32 %118 to double
  %120 = getelementptr inbounds double, double* %36, i64 %indvars.iv15
  %121 = trunc i64 %indvars.iv.next16 to i32
  %122 = sitofp i32 %121 to double
  %123 = fdiv double %122, %33
  %124 = fmul double %123, 1.250000e-01
  %125 = getelementptr inbounds double, double* %37, i64 %indvars.iv15
  store double %124, double* %125, align 8
  %126 = trunc i64 %indvars.iv.next16 to i32
  %127 = sitofp i32 %126 to double
  %128 = insertelement <2 x double> undef, double %119, i32 0
  %129 = insertelement <2 x double> %128, double %127, i32 1
  %130 = fdiv <2 x double> %129, %49
  %131 = fdiv <2 x double> %130, <double 6.000000e+00, double 9.000000e+00>
  %132 = extractelement <2 x double> %131, i32 0
  %133 = extractelement <2 x double> %131, i32 1
  store double %132, double* %120, align 8
  %134 = getelementptr inbounds double, double* %38, i64 %indvars.iv15
  store double %133, double* %134, align 8
  %135 = getelementptr inbounds double, double* %39, i64 %indvars.iv15
  store double 0.000000e+00, double* %135, align 8
  %136 = getelementptr inbounds double, double* %40, i64 %indvars.iv15
  store double 0.000000e+00, double* %136, align 8
  %137 = icmp slt i64 %indvars.iv.next16, %45
  %138 = trunc i64 %indvars.iv.next16 to i32
  br i1 %137, label %.lr.ph6.split, label %._crit_edge7.loopexit25

._crit_edge7.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge7

._crit_edge7.loopexit25:                          ; preds = %.lr.ph6.split
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit25, %._crit_edge7.loopexit
  %.lcssa10.in = phi i64 [ %indvars.iv.next14, %._crit_edge7.loopexit ], [ %indvars.iv.next16, %._crit_edge7.loopexit25 ]
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
  %32 = bitcast double** %17 to i64*
  %33 = load i64, i64* %32, align 8
  %34 = load double*, double** %18, align 8
  %35 = bitcast double** %19 to i64*
  %36 = load i64, i64* %35, align 8
  %37 = load double*, double** %20, align 8
  br i1 %30, label %.preheader11.us.preheader, label %.preheader10

.preheader11.us.preheader:                        ; preds = %.preheader11.lr.ph
  %.promoted35 = load i32, i32* %25, align 4
  %38 = load i32, i32* %13, align 4
  %39 = sext i32 %38 to i64
  %40 = sext i32 %.promoted35 to i64
  br label %.preheader11.us

.preheader11.us:                                  ; preds = %._crit_edge32.us, %.preheader11.us.preheader
  %indvars.iv61 = phi i64 [ %40, %.preheader11.us.preheader ], [ %indvars.iv.next62, %._crit_edge32.us ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader11.us
  %indvars.iv59 = phi i64 [ 0, %.preheader11.us ], [ %indvars.iv.next60, %._crit_edge ]
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %31, i64 %indvars.iv61, i64 %indvars.iv59
  %42 = load double, double* %41, align 8
  %sunkaddr = mul i64 %indvars.iv61, 8
  %sunkaddr97 = add i64 %33, %sunkaddr
  %sunkaddr98 = inttoptr i64 %sunkaddr97 to double*
  %43 = load double, double* %sunkaddr98, align 8
  %44 = getelementptr inbounds double, double* %34, i64 %indvars.iv59
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = fadd double %42, %46
  %sunkaddr99 = mul i64 %indvars.iv61, 8
  %sunkaddr100 = add i64 %36, %sunkaddr99
  %sunkaddr101 = inttoptr i64 %sunkaddr100 to double*
  %48 = load double, double* %sunkaddr101, align 8
  %49 = getelementptr inbounds double, double* %37, i64 %indvars.iv59
  %50 = load double, double* %49, align 8
  %51 = fmul double %48, %50
  %52 = fadd double %47, %51
  store double %52, double* %41, align 8
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %53 = icmp slt i64 %indvars.iv.next60, %39
  br i1 %53, label %._crit_edge, label %._crit_edge32.us

._crit_edge32.us:                                 ; preds = %._crit_edge
  %indvars.iv.next62 = add nsw i64 %indvars.iv61, 1
  %54 = icmp slt i64 %indvars.iv.next62, %29
  br i1 %54, label %.preheader11.us, label %.preheader10.loopexit

.preheader10.loopexit:                            ; preds = %._crit_edge32.us
  br label %.preheader10

.preheader10:                                     ; preds = %.preheader10.loopexit, %.preheader11.lr.ph
  %.pr = load i32, i32* %13, align 4
  store i32 0, i32* %25, align 4
  %55 = icmp sgt i32 %.pr, 0
  br i1 %55, label %.preheader9.lr.ph, label %.preheader7

.preheader9.lr.ph:                                ; preds = %.preheader10
  %56 = load i32, i32* %13, align 4
  %wide.trip.count53.1 = zext i32 %56 to i64
  %57 = sext i32 %56 to i64
  %58 = icmp sgt i32 %56, 0
  %59 = load double*, double** %22, align 8
  %60 = load double, double* %15, align 8
  %61 = load [2000 x double]*, [2000 x double]** %16, align 8
  %62 = load double*, double** %23, align 8
  br i1 %58, label %.preheader9.us.preheader, label %.preheader8

.preheader9.us.preheader:                         ; preds = %.preheader9.lr.ph
  %.promoted26 = load i32, i32* %25, align 4
  %63 = sext i32 %.promoted26 to i64
  %64 = and i32 %56, 1
  br label %.preheader9.us

.preheader9.us:                                   ; preds = %._crit_edge23.us, %.preheader9.us.preheader
  %indvars.iv55 = phi i64 [ %63, %.preheader9.us.preheader ], [ %indvars.iv.next56, %._crit_edge23.us ]
  %65 = icmp eq i32 %64, 0
  br i1 %65, label %.prol.loopexit66, label %.prol.preheader65

.prol.preheader65:                                ; preds = %.preheader9.us
  %66 = ptrtoint double* %59 to i64
  %sunkaddr81 = shl i64 %indvars.iv55, 3
  %sunkaddr82 = add i64 %66, %sunkaddr81
  %sunkaddr83 = inttoptr i64 %sunkaddr82 to double*
  %67 = load double, double* %sunkaddr83, align 8
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %61, i64 0, i64 %indvars.iv55
  %69 = load double, double* %68, align 8
  %70 = fmul double %60, %69
  %71 = load double, double* %62, align 8
  %72 = fmul double %70, %71
  %73 = fadd double %67, %72
  store double %73, double* %sunkaddr83, align 8
  br label %.prol.loopexit66

.prol.loopexit66:                                 ; preds = %.preheader9.us, %.prol.preheader65
  %indvars.iv51.unr.ph = phi i64 [ 1, %.prol.preheader65 ], [ 0, %.preheader9.us ]
  %74 = icmp eq i32 %56, 1
  br i1 %74, label %._crit_edge23.us, label %.preheader9.us.new.preheader

.preheader9.us.new.preheader:                     ; preds = %.prol.loopexit66
  br label %.preheader9.us.new

.preheader9.us.new:                               ; preds = %.preheader9.us.new, %.preheader9.us.new.preheader
  %indvars.iv51 = phi i64 [ %indvars.iv51.unr.ph, %.preheader9.us.new.preheader ], [ %indvars.iv.next52.1, %.preheader9.us.new ]
  %sunkaddr102 = ptrtoint double* %59 to i64
  %sunkaddr103 = mul i64 %indvars.iv55, 8
  %sunkaddr104 = add i64 %sunkaddr102, %sunkaddr103
  %sunkaddr105 = inttoptr i64 %sunkaddr104 to double*
  %75 = load double, double* %sunkaddr105, align 8
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %61, i64 %indvars.iv51, i64 %indvars.iv55
  %77 = load double, double* %76, align 8
  %78 = fmul double %60, %77
  %79 = getelementptr inbounds double, double* %62, i64 %indvars.iv51
  %80 = load double, double* %79, align 8
  %81 = fmul double %78, %80
  %82 = fadd double %75, %81
  store double %82, double* %sunkaddr105, align 8
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %83 = getelementptr inbounds [2000 x double], [2000 x double]* %61, i64 %indvars.iv.next52, i64 %indvars.iv55
  %84 = load double, double* %83, align 8
  %85 = fmul double %60, %84
  %86 = getelementptr inbounds double, double* %62, i64 %indvars.iv.next52
  %87 = load double, double* %86, align 8
  %88 = fmul double %85, %87
  %89 = fadd double %82, %88
  store double %89, double* %sunkaddr105, align 8
  %indvars.iv.next52.1 = add nuw nsw i64 %indvars.iv51, 2
  %exitcond54.1 = icmp eq i64 %indvars.iv.next52.1, %wide.trip.count53.1
  br i1 %exitcond54.1, label %._crit_edge23.us.loopexit, label %.preheader9.us.new

._crit_edge23.us.loopexit:                        ; preds = %.preheader9.us.new
  br label %._crit_edge23.us

._crit_edge23.us:                                 ; preds = %._crit_edge23.us.loopexit, %.prol.loopexit66
  %indvars.iv.next56 = add nsw i64 %indvars.iv55, 1
  %90 = icmp slt i64 %indvars.iv.next56, %57
  br i1 %90, label %.preheader9.us, label %.preheader8.loopexit

.preheader8.loopexit:                             ; preds = %._crit_edge23.us
  br label %.preheader8

.preheader8:                                      ; preds = %.preheader8.loopexit, %.preheader9.lr.ph, %12
  %.pr69 = load i32, i32* %13, align 4
  store i32 0, i32* %25, align 4
  %91 = icmp sgt i32 %.pr69, 0
  br i1 %91, label %.lr.ph19, label %.preheader7.thread

.preheader7.thread:                               ; preds = %.preheader8
  store i32 0, i32* %25, align 4
  br label %.preheader7._crit_edge

.lr.ph19:                                         ; preds = %.preheader8
  %92 = load double*, double** %22, align 8
  %93 = load double*, double** %24, align 8
  %94 = load i32, i32* %13, align 4
  %.promoted = load i32, i32* %25, align 4
  br label %._crit_edge71

.preheader7.loopexit:                             ; preds = %._crit_edge71
  br label %.preheader7

.preheader7:                                      ; preds = %.preheader7.loopexit, %.preheader10
  %.pr70 = load i32, i32* %13, align 4
  store i32 0, i32* %25, align 4
  %95 = icmp sgt i32 %.pr70, 0
  br i1 %95, label %.preheader.lr.ph, label %.preheader7._crit_edge

.preheader.lr.ph:                                 ; preds = %.preheader7
  %96 = load i32, i32* %13, align 4
  %wide.trip.count.1 = zext i32 %96 to i64
  %97 = sext i32 %96 to i64
  %98 = icmp sgt i32 %96, 0
  %99 = load double*, double** %21, align 8
  %100 = load double, double* %14, align 8
  %101 = load [2000 x double]*, [2000 x double]** %16, align 8
  %102 = load double*, double** %22, align 8
  %.promoted14 = load i32, i32* %25, align 4
  %103 = sext i32 %.promoted14 to i64
  br i1 %98, label %.preheader.us.preheader, label %._crit_edge13.loopexit39

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %104 = and i32 %96, 1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv48 = phi i64 [ %103, %.preheader.us.preheader ], [ %indvars.iv.next49, %._crit_edge.us ]
  %105 = icmp eq i32 %104, 0
  br i1 %105, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  %106 = ptrtoint double* %99 to i64
  %sunkaddr89 = shl i64 %indvars.iv48, 3
  %sunkaddr90 = add i64 %106, %sunkaddr89
  %sunkaddr91 = inttoptr i64 %sunkaddr90 to double*
  %107 = load double, double* %sunkaddr91, align 8
  %108 = getelementptr inbounds [2000 x double], [2000 x double]* %101, i64 %indvars.iv48, i64 0
  %109 = load double, double* %108, align 8
  %110 = fmul double %100, %109
  %111 = load double, double* %102, align 8
  %112 = fmul double %110, %111
  %113 = fadd double %107, %112
  store double %113, double* %sunkaddr91, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us ]
  %114 = icmp eq i32 %96, 1
  br i1 %114, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new, %.preheader.us.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ], [ %indvars.iv.next.1, %.preheader.us.new ]
  %sunkaddr106 = ptrtoint double* %99 to i64
  %sunkaddr107 = mul i64 %indvars.iv48, 8
  %sunkaddr108 = add i64 %sunkaddr106, %sunkaddr107
  %sunkaddr109 = inttoptr i64 %sunkaddr108 to double*
  %115 = load double, double* %sunkaddr109, align 8
  %116 = getelementptr inbounds [2000 x double], [2000 x double]* %101, i64 %indvars.iv48, i64 %indvars.iv
  %117 = load double, double* %116, align 8
  %118 = fmul double %100, %117
  %119 = getelementptr inbounds double, double* %102, i64 %indvars.iv
  %120 = load double, double* %119, align 8
  %121 = fmul double %118, %120
  %122 = fadd double %115, %121
  store double %122, double* %sunkaddr109, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %123 = getelementptr inbounds [2000 x double], [2000 x double]* %101, i64 %indvars.iv48, i64 %indvars.iv.next
  %124 = load double, double* %123, align 8
  %125 = fmul double %100, %124
  %126 = getelementptr inbounds double, double* %102, i64 %indvars.iv.next
  %127 = load double, double* %126, align 8
  %128 = fmul double %125, %127
  %129 = fadd double %122, %128
  store double %129, double* %sunkaddr109, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next49 = add nsw i64 %indvars.iv48, 1
  %130 = icmp slt i64 %indvars.iv.next49, %97
  br i1 %130, label %.preheader.us, label %._crit_edge13.loopexit

._crit_edge71:                                    ; preds = %._crit_edge71, %.lr.ph19
  %131 = phi i32 [ %.promoted, %.lr.ph19 ], [ %138, %._crit_edge71 ]
  %storemerge218 = phi i32 [ 0, %.lr.ph19 ], [ %138, %._crit_edge71 ]
  %132 = sext i32 %storemerge218 to i64
  %133 = getelementptr inbounds double, double* %92, i64 %132
  %134 = load double, double* %133, align 8
  %135 = getelementptr inbounds double, double* %93, i64 %132
  %136 = load double, double* %135, align 8
  %137 = fadd double %134, %136
  store double %137, double* %133, align 8
  %138 = add nsw i32 %131, 1
  %139 = icmp slt i32 %138, %94
  br i1 %139, label %._crit_edge71, label %.preheader7.loopexit

._crit_edge13.loopexit:                           ; preds = %._crit_edge.us
  %140 = trunc i64 %indvars.iv.next49 to i32
  br label %._crit_edge13

._crit_edge13.loopexit39:                         ; preds = %.preheader.lr.ph
  %141 = add i32 %.promoted14, 1
  %142 = icmp sgt i32 %96, %141
  %smax = select i1 %142, i32 %96, i32 %141
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit39, %._crit_edge13.loopexit
  %.lcssa15 = phi i32 [ %140, %._crit_edge13.loopexit ], [ %smax, %._crit_edge13.loopexit39 ]
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
  %7 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %6) #5
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
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

._crit_edge4:                                     ; preds = %._crit_edge3, %.lr.ph
  %indvars.iv = phi i64 [ %14, %.lr.ph ], [ %indvars.iv.next, %._crit_edge3 ]
  %storemerge1 = phi i32 [ 0, %.lr.ph ], [ %25, %._crit_edge3 ]
  %16 = srem i32 %storemerge1, 20
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %._crit_edge3

; <label>:18:                                     ; preds = %._crit_edge4
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %19) #5
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge4, %18
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = getelementptr inbounds double, double* %12, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %22) #6
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %24 = icmp slt i64 %indvars.iv.next, %15
  %25 = trunc i64 %indvars.iv.next to i32
  br i1 %24, label %._crit_edge4, label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge3
  %26 = trunc i64 %indvars.iv.next to i32
  store i32 %26, i32* %5, align 4
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %2, %._crit_edge
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %29) #5
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
