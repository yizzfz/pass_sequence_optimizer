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
  %85 = bitcast [2000 x [2000 x double]]** %8 to i8**
  %86 = load i8*, i8** %85, align 8
  call void @free(i8* %86) #4
  %87 = bitcast [2000 x double]** %9 to i8**
  %88 = load i8*, i8** %87, align 8
  call void @free(i8* %88) #4
  %89 = bitcast [2000 x double]** %10 to i8**
  %90 = load i8*, i8** %89, align 8
  call void @free(i8* %90) #4
  %91 = bitcast [2000 x double]** %11 to i8**
  %92 = load i8*, i8** %91, align 8
  call void @free(i8* %92) #4
  %93 = bitcast [2000 x double]** %12 to i8**
  %94 = load i8*, i8** %93, align 8
  call void @free(i8* %94) #4
  %95 = bitcast [2000 x double]** %13 to i8**
  %96 = load i8*, i8** %95, align 8
  call void @free(i8* %96) #4
  %97 = bitcast [2000 x double]** %14 to i8**
  %98 = load i8*, i8** %97, align 8
  call void @free(i8* %98) #4
  %99 = bitcast [2000 x double]** %15 to i8**
  %100 = load i8*, i8** %99, align 8
  call void @free(i8* %100) #4
  %101 = bitcast [2000 x double]** %16 to i8**
  %102 = load i8*, i8** %101, align 8
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
  br i1 %31, label %.lr.ph4, label %._crit_edge

.lr.ph4:                                          ; preds = %12
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
  %wide.trip.count.1 = zext i32 %41 to i64
  %42 = icmp sgt i32 %41, 0
  %43 = sitofp i32 %41 to double
  %44 = load [2000 x double]*, [2000 x double]** %16, align 8
  %.promoted = load i32, i32* %25, align 4
  %45 = sext i32 %.promoted to i64
  %46 = sext i32 %41 to i64
  %47 = insertelement <2 x double> undef, double %33, i32 0
  %48 = shufflevector <2 x double> %47, <2 x double> undef, <2 x i32> zeroinitializer
  %49 = insertelement <2 x double> undef, double %33, i32 0
  %50 = shufflevector <2 x double> %49, <2 x double> undef, <2 x i32> zeroinitializer
  br i1 %42, label %.lr.ph4.split.us.preheader, label %.lr.ph4.split.preheader

.lr.ph4.split.preheader:                          ; preds = %.lr.ph4
  br label %.lr.ph4.split

.lr.ph4.split.us.preheader:                       ; preds = %.lr.ph4
  %51 = and i32 %41, 1
  %52 = insertelement <2 x double> undef, double %43, i32 0
  %53 = shufflevector <2 x double> %52, <2 x double> undef, <2 x i32> zeroinitializer
  %54 = fdiv double 0.000000e+00, %43
  br label %.lr.ph4.split.us

.lr.ph4.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph4.split.us.preheader
  %indvars.iv11 = phi i64 [ %45, %.lr.ph4.split.us.preheader ], [ %indvars.iv.next12, %._crit_edge.us ]
  %55 = icmp eq i32 %51, 0
  %56 = trunc i64 %indvars.iv11 to i32
  %57 = sitofp i32 %56 to double
  %58 = getelementptr inbounds double, double* %32, i64 %indvars.iv11
  store double %57, double* %58, align 8
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, 1
  %59 = trunc i64 %indvars.iv.next12 to i32
  %60 = sitofp i32 %59 to double
  %61 = getelementptr inbounds double, double* %34, i64 %indvars.iv11
  %62 = trunc i64 %indvars.iv.next12 to i32
  %63 = sitofp i32 %62 to double
  %64 = insertelement <2 x double> undef, double %60, i32 0
  %65 = insertelement <2 x double> %64, double %63, i32 1
  %66 = fdiv <2 x double> %65, %48
  %67 = fmul <2 x double> %66, <double 5.000000e-01, double 2.500000e-01>
  %68 = extractelement <2 x double> %67, i32 0
  %69 = extractelement <2 x double> %67, i32 1
  store double %68, double* %61, align 8
  %70 = getelementptr inbounds double, double* %35, i64 %indvars.iv11
  store double %69, double* %70, align 8
  %71 = trunc i64 %indvars.iv.next12 to i32
  %72 = sitofp i32 %71 to double
  %73 = getelementptr inbounds double, double* %36, i64 %indvars.iv11
  %74 = trunc i64 %indvars.iv.next12 to i32
  %75 = sitofp i32 %74 to double
  %76 = fdiv double %75, %33
  %77 = fmul double %76, 1.250000e-01
  %78 = getelementptr inbounds double, double* %37, i64 %indvars.iv11
  store double %77, double* %78, align 8
  %79 = trunc i64 %indvars.iv.next12 to i32
  %80 = sitofp i32 %79 to double
  %81 = insertelement <2 x double> undef, double %72, i32 0
  %82 = insertelement <2 x double> %81, double %80, i32 1
  %83 = fdiv <2 x double> %82, %50
  %84 = fdiv <2 x double> %83, <double 6.000000e+00, double 9.000000e+00>
  %85 = extractelement <2 x double> %84, i32 0
  %86 = extractelement <2 x double> %84, i32 1
  store double %85, double* %73, align 8
  %87 = getelementptr inbounds double, double* %38, i64 %indvars.iv11
  store double %86, double* %87, align 8
  %88 = getelementptr inbounds double, double* %39, i64 %indvars.iv11
  store double 0.000000e+00, double* %88, align 8
  %89 = getelementptr inbounds double, double* %40, i64 %indvars.iv11
  store double 0.000000e+00, double* %89, align 8
  br i1 %55, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph4.split.us
  %90 = getelementptr inbounds [2000 x double], [2000 x double]* %44, i64 %indvars.iv11, i64 0
  store double %54, double* %90, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph4.split.us, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph4.split.us ]
  %91 = icmp eq i32 %41, 1
  br i1 %91, label %._crit_edge.us, label %.lr.ph4.split.us.new.preheader

.lr.ph4.split.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.lr.ph4.split.us.new

.lr.ph4.split.us.new:                             ; preds = %.lr.ph4.split.us.new, %.lr.ph4.split.us.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph4.split.us.new.preheader ], [ %indvars.iv.next.1, %.lr.ph4.split.us.new ]
  %92 = mul nsw i64 %indvars.iv, %indvars.iv11
  %93 = trunc i64 %92 to i32
  %94 = srem i32 %93, %41
  %95 = sitofp i32 %94 to double
  %96 = getelementptr inbounds [2000 x double], [2000 x double]* %44, i64 %indvars.iv11, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %97 = mul nsw i64 %indvars.iv.next, %indvars.iv11
  %98 = trunc i64 %97 to i32
  %99 = srem i32 %98, %41
  %100 = sitofp i32 %99 to double
  %101 = insertelement <2 x double> undef, double %95, i32 0
  %102 = insertelement <2 x double> %101, double %100, i32 1
  %103 = fdiv <2 x double> %102, %53
  %104 = bitcast double* %96 to <2 x double>*
  store <2 x double> %103, <2 x double>* %104, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph4.split.us.new

._crit_edge.us.loopexit:                          ; preds = %.lr.ph4.split.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %105 = icmp slt i64 %indvars.iv.next12, %46
  br i1 %105, label %.lr.ph4.split.us, label %._crit_edge5.loopexit

.lr.ph4.split:                                    ; preds = %.lr.ph4.split, %.lr.ph4.split.preheader
  %indvars.iv13 = phi i64 [ %45, %.lr.ph4.split.preheader ], [ %indvars.iv.next14, %.lr.ph4.split ]
  %106 = trunc i64 %indvars.iv13 to i32
  %107 = sitofp i32 %106 to double
  %108 = getelementptr inbounds double, double* %32, i64 %indvars.iv13
  store double %107, double* %108, align 8
  %indvars.iv.next14 = add nsw i64 %indvars.iv13, 1
  %109 = trunc i64 %indvars.iv.next14 to i32
  %110 = sitofp i32 %109 to double
  %111 = getelementptr inbounds double, double* %34, i64 %indvars.iv13
  %112 = trunc i64 %indvars.iv.next14 to i32
  %113 = sitofp i32 %112 to double
  %114 = insertelement <2 x double> undef, double %110, i32 0
  %115 = insertelement <2 x double> %114, double %113, i32 1
  %116 = fdiv <2 x double> %115, %48
  %117 = fmul <2 x double> %116, <double 5.000000e-01, double 2.500000e-01>
  %118 = extractelement <2 x double> %117, i32 0
  %119 = extractelement <2 x double> %117, i32 1
  store double %118, double* %111, align 8
  %120 = getelementptr inbounds double, double* %35, i64 %indvars.iv13
  store double %119, double* %120, align 8
  %121 = trunc i64 %indvars.iv.next14 to i32
  %122 = sitofp i32 %121 to double
  %123 = getelementptr inbounds double, double* %36, i64 %indvars.iv13
  %124 = trunc i64 %indvars.iv.next14 to i32
  %125 = sitofp i32 %124 to double
  %126 = fdiv double %125, %33
  %127 = fmul double %126, 1.250000e-01
  %128 = getelementptr inbounds double, double* %37, i64 %indvars.iv13
  store double %127, double* %128, align 8
  %129 = trunc i64 %indvars.iv.next14 to i32
  %130 = sitofp i32 %129 to double
  %131 = insertelement <2 x double> undef, double %122, i32 0
  %132 = insertelement <2 x double> %131, double %130, i32 1
  %133 = fdiv <2 x double> %132, %50
  %134 = fdiv <2 x double> %133, <double 6.000000e+00, double 9.000000e+00>
  %135 = extractelement <2 x double> %134, i32 0
  %136 = extractelement <2 x double> %134, i32 1
  store double %135, double* %123, align 8
  %137 = getelementptr inbounds double, double* %38, i64 %indvars.iv13
  store double %136, double* %137, align 8
  %138 = getelementptr inbounds double, double* %39, i64 %indvars.iv13
  store double 0.000000e+00, double* %138, align 8
  %139 = getelementptr inbounds double, double* %40, i64 %indvars.iv13
  store double 0.000000e+00, double* %139, align 8
  %140 = icmp slt i64 %indvars.iv.next14, %46
  br i1 %140, label %.lr.ph4.split, label %._crit_edge5.loopexit21

._crit_edge5.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge5

._crit_edge5.loopexit21:                          ; preds = %.lr.ph4.split
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit21, %._crit_edge5.loopexit
  %.lcssa8.in = phi i64 [ %indvars.iv.next12, %._crit_edge5.loopexit ], [ %indvars.iv.next14, %._crit_edge5.loopexit21 ]
  %.lcssa8 = trunc i64 %.lcssa8.in to i32
  store i32 %.lcssa8, i32* %25, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %._crit_edge5
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
  %.promoted31 = load i32, i32* %25, align 4
  %36 = load i32, i32* %13, align 4
  %37 = sext i32 %36 to i64
  %38 = sext i32 %.promoted31 to i64
  %39 = icmp sgt i64 %37, 1
  %smax71 = select i1 %39, i64 %37, i64 1
  %40 = icmp sgt i64 %37, 1
  %smax73 = select i1 %40, i64 %37, i64 1
  %scevgep76 = getelementptr double, double* %33, i64 %smax73
  %scevgep78 = getelementptr double, double* %35, i64 %smax73
  %n.vec = and i64 %smax71, 9223372036854775804
  br label %.preheader11.us

.preheader11.us:                                  ; preds = %._crit_edge28.us, %.preheader11.us.preheader
  %indvar = phi i64 [ 0, %.preheader11.us.preheader ], [ %indvar.next, %._crit_edge28.us ]
  %indvars.iv59 = phi i64 [ %38, %.preheader11.us.preheader ], [ %indvars.iv.next60, %._crit_edge28.us ]
  %41 = icmp ult i64 %smax71, 4
  %42 = add i64 %38, %indvar
  %scevgep = getelementptr [2000 x double], [2000 x double]* %31, i64 %42, i64 0
  %scevgep74 = getelementptr [2000 x double], [2000 x double]* %31, i64 %42, i64 %smax73
  %43 = getelementptr inbounds double, double* %32, i64 %indvars.iv59
  %44 = getelementptr inbounds double, double* %34, i64 %indvars.iv59
  br i1 %41, label %._crit_edge.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader11.us
  %45 = icmp eq i64 %n.vec, 0
  br i1 %45, label %._crit_edge.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %43
  %bound1 = icmp ult double* %43, %scevgep74
  %found.conflict = and i1 %bound0, %bound1
  %bound081 = icmp ult double* %scevgep, %scevgep76
  %bound182 = icmp ult double* %33, %scevgep74
  %found.conflict83 = and i1 %bound081, %bound182
  %conflict.rdx = or i1 %found.conflict, %found.conflict83
  %bound086 = icmp ult double* %scevgep, %44
  %bound187 = icmp ult double* %44, %scevgep74
  %found.conflict88 = and i1 %bound086, %bound187
  %conflict.rdx89 = or i1 %conflict.rdx, %found.conflict88
  %bound090 = icmp ult double* %scevgep, %scevgep78
  %bound191 = icmp ult double* %35, %scevgep74
  %found.conflict92 = and i1 %bound090, %bound191
  %conflict.rdx93 = or i1 %conflict.rdx89, %found.conflict92
  br i1 %conflict.rdx93, label %._crit_edge.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next, %vector.body ]
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %31, i64 %indvars.iv59, i64 %index
  %47 = bitcast double* %46 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %47, align 8, !alias.scope !1, !noalias !4
  %48 = getelementptr double, double* %46, i64 2
  %49 = bitcast double* %48 to <2 x double>*
  %wide.load95 = load <2 x double>, <2 x double>* %49, align 8, !alias.scope !1, !noalias !4
  %50 = load double, double* %43, align 8, !alias.scope !9
  %51 = insertelement <2 x double> undef, double %50, i32 0
  %52 = shufflevector <2 x double> %51, <2 x double> undef, <2 x i32> zeroinitializer
  %53 = insertelement <2 x double> undef, double %50, i32 0
  %54 = shufflevector <2 x double> %53, <2 x double> undef, <2 x i32> zeroinitializer
  %55 = getelementptr inbounds double, double* %33, i64 %index
  %56 = bitcast double* %55 to <2 x double>*
  %wide.load96 = load <2 x double>, <2 x double>* %56, align 8, !alias.scope !10
  %57 = getelementptr double, double* %55, i64 2
  %58 = bitcast double* %57 to <2 x double>*
  %wide.load97 = load <2 x double>, <2 x double>* %58, align 8, !alias.scope !10
  %59 = fmul <2 x double> %52, %wide.load96
  %60 = fmul <2 x double> %54, %wide.load97
  %61 = fadd <2 x double> %wide.load, %59
  %62 = fadd <2 x double> %wide.load95, %60
  %63 = load double, double* %44, align 8, !alias.scope !11
  %64 = insertelement <2 x double> undef, double %63, i32 0
  %65 = shufflevector <2 x double> %64, <2 x double> undef, <2 x i32> zeroinitializer
  %66 = insertelement <2 x double> undef, double %63, i32 0
  %67 = shufflevector <2 x double> %66, <2 x double> undef, <2 x i32> zeroinitializer
  %68 = getelementptr inbounds double, double* %35, i64 %index
  %69 = bitcast double* %68 to <2 x double>*
  %wide.load98 = load <2 x double>, <2 x double>* %69, align 8, !alias.scope !12
  %70 = getelementptr double, double* %68, i64 2
  %71 = bitcast double* %70 to <2 x double>*
  %wide.load99 = load <2 x double>, <2 x double>* %71, align 8, !alias.scope !12
  %72 = fmul <2 x double> %65, %wide.load98
  %73 = fmul <2 x double> %67, %wide.load99
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
  %79 = icmp eq i64 %smax71, %n.vec
  br i1 %79, label %._crit_edge28.us, label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader11.us
  %indvars.iv57.ph = phi i64 [ 0, %.preheader11.us ], [ 0, %min.iters.checked ], [ 0, %vector.memcheck ], [ %n.vec, %middle.block ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %._crit_edge.preheader
  %indvars.iv57 = phi i64 [ %indvars.iv57.ph, %._crit_edge.preheader ], [ %indvars.iv.next58, %._crit_edge ]
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %31, i64 %indvars.iv59, i64 %indvars.iv57
  %81 = load double, double* %80, align 8
  %82 = load double, double* %43, align 8
  %83 = getelementptr inbounds double, double* %33, i64 %indvars.iv57
  %84 = load double, double* %83, align 8
  %85 = fmul double %82, %84
  %86 = fadd double %81, %85
  %87 = load double, double* %44, align 8
  %88 = getelementptr inbounds double, double* %35, i64 %indvars.iv57
  %89 = load double, double* %88, align 8
  %90 = fmul double %87, %89
  %91 = fadd double %86, %90
  %92 = getelementptr inbounds [2000 x double], [2000 x double]* %31, i64 %indvars.iv59, i64 %indvars.iv57
  store double %91, double* %92, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %93 = icmp slt i64 %indvars.iv.next58, %37
  br i1 %93, label %._crit_edge, label %._crit_edge28.us.loopexit, !llvm.loop !16

._crit_edge28.us.loopexit:                        ; preds = %._crit_edge
  br label %._crit_edge28.us

._crit_edge28.us:                                 ; preds = %._crit_edge28.us.loopexit, %middle.block
  %indvars.iv.next60 = add nsw i64 %indvars.iv59, 1
  %94 = icmp slt i64 %indvars.iv.next60, %29
  %indvar.next = add i64 %indvar, 1
  br i1 %94, label %.preheader11.us, label %.preheader10.loopexit

.preheader10.loopexit:                            ; preds = %._crit_edge28.us
  br label %.preheader10

.preheader10:                                     ; preds = %.preheader10.loopexit, %.preheader11.lr.ph
  %.pr = load i32, i32* %13, align 4
  store i32 0, i32* %25, align 4
  %95 = icmp sgt i32 %.pr, 0
  br i1 %95, label %.preheader9.lr.ph, label %.preheader7

.preheader9.lr.ph:                                ; preds = %.preheader10
  %96 = load i32, i32* %13, align 4
  %wide.trip.count51.1 = zext i32 %96 to i64
  %97 = sext i32 %96 to i64
  %98 = icmp sgt i32 %96, 0
  %99 = load double*, double** %22, align 8
  %100 = load double, double* %15, align 8
  %101 = load [2000 x double]*, [2000 x double]** %16, align 8
  %102 = load double*, double** %23, align 8
  br i1 %98, label %.preheader9.us.preheader, label %.preheader8

.preheader9.us.preheader:                         ; preds = %.preheader9.lr.ph
  %.promoted23 = load i32, i32* %25, align 4
  %103 = sext i32 %.promoted23 to i64
  %104 = and i32 %96, 1
  br label %.preheader9.us

.preheader9.us:                                   ; preds = %._crit_edge20.us, %.preheader9.us.preheader
  %indvars.iv53 = phi i64 [ %103, %.preheader9.us.preheader ], [ %indvars.iv.next54, %._crit_edge20.us ]
  %105 = icmp eq i32 %104, 0
  br i1 %105, label %.prol.loopexit64, label %.prol.preheader63

.prol.preheader63:                                ; preds = %.preheader9.us
  %106 = ptrtoint double* %99 to i64
  %107 = ptrtoint double* %99 to i64
  %sunkaddr137 = shl i64 %indvars.iv53, 3
  %sunkaddr138 = add i64 %107, %sunkaddr137
  %sunkaddr139 = inttoptr i64 %sunkaddr138 to double*
  %108 = load double, double* %sunkaddr139, align 8
  %109 = getelementptr inbounds [2000 x double], [2000 x double]* %101, i64 0, i64 %indvars.iv53
  %110 = load double, double* %109, align 8
  %111 = fmul double %100, %110
  %112 = load double, double* %102, align 8
  %113 = fmul double %111, %112
  %114 = fadd double %108, %113
  %sunkaddr141 = shl i64 %indvars.iv53, 3
  %sunkaddr142 = add i64 %106, %sunkaddr141
  %sunkaddr143 = inttoptr i64 %sunkaddr142 to double*
  store double %114, double* %sunkaddr143, align 8
  br label %.prol.loopexit64

.prol.loopexit64:                                 ; preds = %.preheader9.us, %.prol.preheader63
  %indvars.iv49.unr.ph = phi i64 [ 1, %.prol.preheader63 ], [ 0, %.preheader9.us ]
  %115 = icmp eq i32 %96, 1
  br i1 %115, label %._crit_edge20.us, label %.preheader9.us.new.preheader

.preheader9.us.new.preheader:                     ; preds = %.prol.loopexit64
  br label %.preheader9.us.new

.preheader9.us.new:                               ; preds = %.preheader9.us.new, %.preheader9.us.new.preheader
  %indvars.iv49 = phi i64 [ %indvars.iv49.unr.ph, %.preheader9.us.new.preheader ], [ %indvars.iv.next50.1, %.preheader9.us.new ]
  %sunkaddr = ptrtoint double* %99 to i64
  %sunkaddr168 = mul i64 %indvars.iv53, 8
  %sunkaddr169 = add i64 %sunkaddr, %sunkaddr168
  %sunkaddr170 = inttoptr i64 %sunkaddr169 to double*
  %116 = load double, double* %sunkaddr170, align 8
  %117 = getelementptr inbounds [2000 x double], [2000 x double]* %101, i64 %indvars.iv49, i64 %indvars.iv53
  %118 = load double, double* %117, align 8
  %119 = fmul double %100, %118
  %120 = getelementptr inbounds double, double* %102, i64 %indvars.iv49
  %121 = load double, double* %120, align 8
  %122 = fmul double %119, %121
  %123 = fadd double %116, %122
  %sunkaddr171 = ptrtoint double* %99 to i64
  %sunkaddr172 = mul i64 %indvars.iv53, 8
  %sunkaddr173 = add i64 %sunkaddr171, %sunkaddr172
  %sunkaddr174 = inttoptr i64 %sunkaddr173 to double*
  store double %123, double* %sunkaddr174, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %124 = getelementptr inbounds [2000 x double], [2000 x double]* %101, i64 %indvars.iv.next50, i64 %indvars.iv53
  %125 = load double, double* %124, align 8
  %126 = fmul double %100, %125
  %127 = getelementptr inbounds double, double* %102, i64 %indvars.iv.next50
  %128 = load double, double* %127, align 8
  %129 = fmul double %126, %128
  %130 = fadd double %123, %129
  store double %130, double* %sunkaddr174, align 8
  %indvars.iv.next50.1 = add nsw i64 %indvars.iv49, 2
  %exitcond52.1 = icmp eq i64 %indvars.iv.next50.1, %wide.trip.count51.1
  br i1 %exitcond52.1, label %._crit_edge20.us.loopexit, label %.preheader9.us.new

._crit_edge20.us.loopexit:                        ; preds = %.preheader9.us.new
  br label %._crit_edge20.us

._crit_edge20.us:                                 ; preds = %._crit_edge20.us.loopexit, %.prol.loopexit64
  %indvars.iv.next54 = add nsw i64 %indvars.iv53, 1
  %131 = icmp slt i64 %indvars.iv.next54, %97
  br i1 %131, label %.preheader9.us, label %.preheader8.loopexit

.preheader8.loopexit:                             ; preds = %._crit_edge20.us
  br label %.preheader8

.preheader8:                                      ; preds = %.preheader8.loopexit, %.preheader9.lr.ph, %12
  %.pr67 = load i32, i32* %13, align 4
  store i32 0, i32* %25, align 4
  %132 = icmp sgt i32 %.pr67, 0
  br i1 %132, label %.lr.ph17, label %.preheader7.thread

.preheader7.thread:                               ; preds = %.preheader8
  store i32 0, i32* %25, align 4
  br label %.preheader7._crit_edge

.lr.ph17:                                         ; preds = %.preheader8
  %133 = load double*, double** %22, align 8
  %134 = load double*, double** %24, align 8
  %135 = load i32, i32* %13, align 4
  %.promoted = load i32, i32* %25, align 4
  %136 = sext i32 %.promoted to i64
  %137 = sext i32 %135 to i64
  %138 = add nsw i64 %136, 1
  %139 = icmp sgt i64 %138, %137
  %smax103 = select i1 %139, i64 %138, i64 %137
  %140 = sub nsw i64 %smax103, %136
  %min.iters.check104 = icmp ult i64 %140, 4
  br i1 %min.iters.check104, label %._crit_edge69.preheader, label %min.iters.checked105

._crit_edge69.preheader:                          ; preds = %middle.block101, %vector.memcheck123, %min.iters.checked105, %.lr.ph17
  %indvars.iv46.ph = phi i64 [ %136, %.lr.ph17 ], [ %136, %min.iters.checked105 ], [ %136, %vector.memcheck123 ], [ %ind.end, %middle.block101 ]
  br label %._crit_edge69

min.iters.checked105:                             ; preds = %.lr.ph17
  %n.vec107 = and i64 %140, -4
  %cmp.zero108 = icmp eq i64 %n.vec107, 0
  br i1 %cmp.zero108, label %._crit_edge69.preheader, label %vector.memcheck123

vector.memcheck123:                               ; preds = %min.iters.checked105
  %scevgep110 = getelementptr double, double* %133, i64 %136
  %141 = add nsw i64 %136, 1
  %142 = icmp sgt i64 %141, %137
  %smax112 = select i1 %142, i64 %141, i64 %137
  %scevgep113 = getelementptr double, double* %133, i64 %smax112
  %scevgep115 = getelementptr double, double* %134, i64 %136
  %scevgep117 = getelementptr double, double* %134, i64 %smax112
  %bound0119 = icmp ult double* %scevgep110, %scevgep117
  %bound1120 = icmp ult double* %scevgep115, %scevgep113
  %memcheck.conflict122 = and i1 %bound0119, %bound1120
  %ind.end = add nsw i64 %136, %n.vec107
  br i1 %memcheck.conflict122, label %._crit_edge69.preheader, label %vector.body100.preheader

vector.body100.preheader:                         ; preds = %vector.memcheck123
  %143 = add nsw i64 %n.vec107, -4
  %144 = lshr exact i64 %143, 2
  %145 = and i64 %144, 1
  %lcmp.mod = icmp eq i64 %145, 0
  br i1 %lcmp.mod, label %vector.body100.prol, label %vector.body100.prol.loopexit

vector.body100.prol:                              ; preds = %vector.body100.preheader
  %146 = getelementptr inbounds double, double* %133, i64 %136
  %147 = bitcast double* %146 to <2 x double>*
  %wide.load133.prol = load <2 x double>, <2 x double>* %147, align 8, !alias.scope !17, !noalias !20
  %148 = getelementptr double, double* %146, i64 2
  %149 = bitcast double* %148 to <2 x double>*
  %wide.load134.prol = load <2 x double>, <2 x double>* %149, align 8, !alias.scope !17, !noalias !20
  %150 = getelementptr inbounds double, double* %134, i64 %136
  %151 = bitcast double* %150 to <2 x double>*
  %wide.load135.prol = load <2 x double>, <2 x double>* %151, align 8, !alias.scope !20
  %152 = getelementptr double, double* %150, i64 2
  %153 = bitcast double* %152 to <2 x double>*
  %wide.load136.prol = load <2 x double>, <2 x double>* %153, align 8, !alias.scope !20
  %154 = fadd <2 x double> %wide.load133.prol, %wide.load135.prol
  %155 = fadd <2 x double> %wide.load134.prol, %wide.load136.prol
  %156 = bitcast double* %146 to <2 x double>*
  store <2 x double> %154, <2 x double>* %156, align 8, !alias.scope !17, !noalias !20
  %157 = bitcast double* %148 to <2 x double>*
  store <2 x double> %155, <2 x double>* %157, align 8, !alias.scope !17, !noalias !20
  br label %vector.body100.prol.loopexit

vector.body100.prol.loopexit:                     ; preds = %vector.body100.preheader, %vector.body100.prol
  %index125.unr = phi i64 [ 4, %vector.body100.prol ], [ 0, %vector.body100.preheader ]
  %158 = icmp eq i64 %144, 0
  br i1 %158, label %middle.block101, label %vector.body100.preheader.new

vector.body100.preheader.new:                     ; preds = %vector.body100.prol.loopexit
  br label %vector.body100

vector.body100:                                   ; preds = %vector.body100, %vector.body100.preheader.new
  %index125 = phi i64 [ %index125.unr, %vector.body100.preheader.new ], [ %index.next126.1, %vector.body100 ]
  %159 = add i64 %136, %index125
  %160 = getelementptr inbounds double, double* %133, i64 %159
  %161 = bitcast double* %160 to <2 x double>*
  %wide.load133 = load <2 x double>, <2 x double>* %161, align 8, !alias.scope !17, !noalias !20
  %162 = getelementptr double, double* %160, i64 2
  %163 = bitcast double* %162 to <2 x double>*
  %wide.load134 = load <2 x double>, <2 x double>* %163, align 8, !alias.scope !17, !noalias !20
  %164 = getelementptr inbounds double, double* %134, i64 %159
  %165 = bitcast double* %164 to <2 x double>*
  %wide.load135 = load <2 x double>, <2 x double>* %165, align 8, !alias.scope !20
  %166 = getelementptr double, double* %164, i64 2
  %167 = bitcast double* %166 to <2 x double>*
  %wide.load136 = load <2 x double>, <2 x double>* %167, align 8, !alias.scope !20
  %168 = fadd <2 x double> %wide.load133, %wide.load135
  %169 = fadd <2 x double> %wide.load134, %wide.load136
  %170 = bitcast double* %160 to <2 x double>*
  store <2 x double> %168, <2 x double>* %170, align 8, !alias.scope !17, !noalias !20
  %171 = bitcast double* %162 to <2 x double>*
  store <2 x double> %169, <2 x double>* %171, align 8, !alias.scope !17, !noalias !20
  %index.next126 = add i64 %index125, 4
  %172 = add i64 %136, %index.next126
  %173 = getelementptr inbounds double, double* %133, i64 %172
  %174 = bitcast double* %173 to <2 x double>*
  %wide.load133.1 = load <2 x double>, <2 x double>* %174, align 8, !alias.scope !17, !noalias !20
  %175 = getelementptr double, double* %173, i64 2
  %176 = bitcast double* %175 to <2 x double>*
  %wide.load134.1 = load <2 x double>, <2 x double>* %176, align 8, !alias.scope !17, !noalias !20
  %177 = getelementptr inbounds double, double* %134, i64 %172
  %178 = bitcast double* %177 to <2 x double>*
  %wide.load135.1 = load <2 x double>, <2 x double>* %178, align 8, !alias.scope !20
  %179 = getelementptr double, double* %177, i64 2
  %180 = bitcast double* %179 to <2 x double>*
  %wide.load136.1 = load <2 x double>, <2 x double>* %180, align 8, !alias.scope !20
  %181 = fadd <2 x double> %wide.load133.1, %wide.load135.1
  %182 = fadd <2 x double> %wide.load134.1, %wide.load136.1
  %183 = bitcast double* %173 to <2 x double>*
  store <2 x double> %181, <2 x double>* %183, align 8, !alias.scope !17, !noalias !20
  %184 = bitcast double* %175 to <2 x double>*
  store <2 x double> %182, <2 x double>* %184, align 8, !alias.scope !17, !noalias !20
  %index.next126.1 = add i64 %index125, 8
  %185 = icmp eq i64 %index.next126.1, %n.vec107
  br i1 %185, label %middle.block101.loopexit, label %vector.body100, !llvm.loop !22

middle.block101.loopexit:                         ; preds = %vector.body100
  br label %middle.block101

middle.block101:                                  ; preds = %middle.block101.loopexit, %vector.body100.prol.loopexit
  %cmp.n128 = icmp eq i64 %140, %n.vec107
  br i1 %cmp.n128, label %.preheader7, label %._crit_edge69.preheader

.preheader7.loopexit:                             ; preds = %._crit_edge69
  br label %.preheader7

.preheader7:                                      ; preds = %.preheader7.loopexit, %middle.block101, %.preheader10
  %.pr68 = load i32, i32* %13, align 4
  store i32 0, i32* %25, align 4
  %186 = icmp sgt i32 %.pr68, 0
  br i1 %186, label %.preheader.lr.ph, label %.preheader7._crit_edge

.preheader.lr.ph:                                 ; preds = %.preheader7
  %187 = load i32, i32* %13, align 4
  %wide.trip.count.1 = zext i32 %187 to i64
  %188 = sext i32 %187 to i64
  %189 = icmp sgt i32 %187, 0
  %190 = load double*, double** %21, align 8
  %191 = load double, double* %14, align 8
  %192 = load [2000 x double]*, [2000 x double]** %16, align 8
  %193 = load double*, double** %22, align 8
  %.promoted13 = load i32, i32* %25, align 4
  %194 = sext i32 %.promoted13 to i64
  br i1 %189, label %.preheader.us.preheader, label %._crit_edge12.loopexit35

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %195 = and i32 %187, 1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv44 = phi i64 [ %194, %.preheader.us.preheader ], [ %indvars.iv.next45, %._crit_edge.us ]
  %196 = icmp eq i32 %195, 0
  br i1 %196, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  %197 = ptrtoint double* %190 to i64
  %198 = ptrtoint double* %190 to i64
  %sunkaddr153 = shl i64 %indvars.iv44, 3
  %sunkaddr154 = add i64 %198, %sunkaddr153
  %sunkaddr155 = inttoptr i64 %sunkaddr154 to double*
  %199 = load double, double* %sunkaddr155, align 8
  %200 = getelementptr inbounds [2000 x double], [2000 x double]* %192, i64 %indvars.iv44, i64 0
  %201 = load double, double* %200, align 8
  %202 = fmul double %191, %201
  %203 = load double, double* %193, align 8
  %204 = fmul double %202, %203
  %205 = fadd double %199, %204
  %sunkaddr157 = shl i64 %indvars.iv44, 3
  %sunkaddr158 = add i64 %197, %sunkaddr157
  %sunkaddr159 = inttoptr i64 %sunkaddr158 to double*
  store double %205, double* %sunkaddr159, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us ]
  %206 = icmp eq i32 %187, 1
  br i1 %206, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new, %.preheader.us.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ], [ %indvars.iv.next.1, %.preheader.us.new ]
  %sunkaddr175 = ptrtoint double* %190 to i64
  %sunkaddr176 = mul i64 %indvars.iv44, 8
  %sunkaddr177 = add i64 %sunkaddr175, %sunkaddr176
  %sunkaddr178 = inttoptr i64 %sunkaddr177 to double*
  %207 = load double, double* %sunkaddr178, align 8
  %208 = getelementptr inbounds [2000 x double], [2000 x double]* %192, i64 %indvars.iv44, i64 %indvars.iv
  %209 = load double, double* %208, align 8
  %210 = fmul double %191, %209
  %211 = getelementptr inbounds double, double* %193, i64 %indvars.iv
  %212 = load double, double* %211, align 8
  %213 = fmul double %210, %212
  %214 = fadd double %207, %213
  %sunkaddr179 = ptrtoint double* %190 to i64
  %sunkaddr180 = mul i64 %indvars.iv44, 8
  %sunkaddr181 = add i64 %sunkaddr179, %sunkaddr180
  %sunkaddr182 = inttoptr i64 %sunkaddr181 to double*
  store double %214, double* %sunkaddr182, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %215 = getelementptr inbounds [2000 x double], [2000 x double]* %192, i64 %indvars.iv44, i64 %indvars.iv.next
  %216 = load double, double* %215, align 8
  %217 = fmul double %191, %216
  %218 = getelementptr inbounds double, double* %193, i64 %indvars.iv.next
  %219 = load double, double* %218, align 8
  %220 = fmul double %217, %219
  %221 = fadd double %214, %220
  store double %221, double* %sunkaddr182, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next45 = add nsw i64 %indvars.iv44, 1
  %222 = icmp slt i64 %indvars.iv.next45, %188
  br i1 %222, label %.preheader.us, label %._crit_edge12.loopexit

._crit_edge69:                                    ; preds = %._crit_edge69, %._crit_edge69.preheader
  %indvars.iv46 = phi i64 [ %indvars.iv46.ph, %._crit_edge69.preheader ], [ %indvars.iv.next47, %._crit_edge69 ]
  %223 = getelementptr inbounds double, double* %133, i64 %indvars.iv46
  %224 = load double, double* %223, align 8
  %225 = getelementptr inbounds double, double* %134, i64 %indvars.iv46
  %226 = load double, double* %225, align 8
  %227 = fadd double %224, %226
  %228 = getelementptr inbounds double, double* %133, i64 %indvars.iv46
  store double %227, double* %228, align 8
  %indvars.iv.next47 = add nsw i64 %indvars.iv46, 1
  %229 = icmp slt i64 %indvars.iv.next47, %137
  br i1 %229, label %._crit_edge69, label %.preheader7.loopexit, !llvm.loop !23

._crit_edge12.loopexit:                           ; preds = %._crit_edge.us
  %230 = trunc i64 %indvars.iv.next45 to i32
  br label %._crit_edge12

._crit_edge12.loopexit35:                         ; preds = %.preheader.lr.ph
  %231 = add i32 %.promoted13, 1
  %232 = icmp sgt i32 %187, %231
  %smax = select i1 %232, i32 %187, i32 %231
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit35, %._crit_edge12.loopexit
  %.lcssa14 = phi i32 [ %230, %._crit_edge12.loopexit ], [ %smax, %._crit_edge12.loopexit35 ]
  store i32 %.lcssa14, i32* %25, align 4
  br label %.preheader7._crit_edge

.preheader7._crit_edge:                           ; preds = %.preheader7, %.preheader7.thread, %._crit_edge12
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
  br i1 %11, label %.lr.ph, label %._crit_edge1

.lr.ph:                                           ; preds = %2
  %12 = load double*, double** %4, align 8
  %13 = load i32, i32* %3, align 4
  %.promoted = load i32, i32* %5, align 4
  %14 = sext i32 %.promoted to i64
  %15 = sext i32 %13 to i64
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge2, %.lr.ph
  %indvars.iv = phi i64 [ %14, %.lr.ph ], [ %indvars.iv.next, %._crit_edge2 ]
  %16 = trunc i64 %indvars.iv to i32
  %17 = srem i32 %16, 20
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %._crit_edge2

; <label>:19:                                     ; preds = %._crit_edge3
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %20) #5
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge3, %19
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = getelementptr inbounds double, double* %12, i64 %indvars.iv
  %23 = load double, double* %22, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %23) #6
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %25 = icmp slt i64 %indvars.iv.next, %15
  br i1 %25, label %._crit_edge3, label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge2
  %26 = trunc i64 %indvars.iv.next to i32
  store i32 %26, i32* %5, align 4
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %2, %._crit_edge
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
!17 = !{!18}
!18 = distinct !{!18, !19}
!19 = distinct !{!19, !"LVerDomain"}
!20 = !{!21}
!21 = distinct !{!21, !19}
!22 = distinct !{!22, !14, !15}
!23 = distinct !{!23, !14, !15}
