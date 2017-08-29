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
  br i1 %31, label %.lr.ph3, label %._crit_edge

.lr.ph3:                                          ; preds = %12
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
  %42 = load [2000 x double]*, [2000 x double]** %16, align 8
  %.promoted = load i32, i32* %25, align 4
  %43 = icmp sgt i32 %41, 0
  %44 = sext i32 %.promoted to i64
  %45 = sext i32 %41 to i64
  %46 = insertelement <2 x double> undef, double %33, i32 0
  %47 = shufflevector <2 x double> %46, <2 x double> undef, <2 x i32> zeroinitializer
  %48 = insertelement <2 x double> undef, double %33, i32 0
  %49 = shufflevector <2 x double> %48, <2 x double> undef, <2 x i32> zeroinitializer
  br i1 %43, label %.lr.ph3.split.us.preheader, label %.lr.ph3.split.preheader

.lr.ph3.split.preheader:                          ; preds = %.lr.ph3
  br label %.lr.ph3.split

.lr.ph3.split.us.preheader:                       ; preds = %.lr.ph3
  %50 = sitofp i32 %41 to double
  %xtraiter = and i64 %wide.trip.count, 1
  %51 = fdiv double 0.000000e+00, %50
  br label %.lr.ph3.split.us

.lr.ph3.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph3.split.us.preheader
  %indvars.iv10 = phi i64 [ %44, %.lr.ph3.split.us.preheader ], [ %indvars.iv.next11, %._crit_edge.us ]
  %52 = phi i32 [ 0, %.lr.ph3.split.us.preheader ], [ %103, %._crit_edge.us ]
  %53 = icmp eq i64 %xtraiter, 0
  %54 = sitofp i32 %52 to double
  %55 = sext i32 %52 to i64
  %56 = getelementptr inbounds double, double* %32, i64 %55
  store double %54, double* %56, align 8
  %indvars.iv.next11 = add nsw i64 %indvars.iv10, 1
  %57 = trunc i64 %indvars.iv.next11 to i32
  %58 = sitofp i32 %57 to double
  %59 = getelementptr inbounds double, double* %34, i64 %indvars.iv10
  %60 = trunc i64 %indvars.iv.next11 to i32
  %61 = sitofp i32 %60 to double
  %62 = insertelement <2 x double> undef, double %58, i32 0
  %63 = insertelement <2 x double> %62, double %61, i32 1
  %64 = fdiv <2 x double> %63, %47
  %65 = fdiv <2 x double> %64, <double 2.000000e+00, double 4.000000e+00>
  %66 = extractelement <2 x double> %65, i32 0
  %67 = extractelement <2 x double> %65, i32 1
  store double %66, double* %59, align 8
  %68 = getelementptr inbounds double, double* %35, i64 %indvars.iv10
  store double %67, double* %68, align 8
  %69 = trunc i64 %indvars.iv.next11 to i32
  %70 = sitofp i32 %69 to double
  %71 = getelementptr inbounds double, double* %36, i64 %indvars.iv10
  %72 = trunc i64 %indvars.iv.next11 to i32
  %73 = sitofp i32 %72 to double
  %74 = insertelement <2 x double> undef, double %70, i32 0
  %75 = insertelement <2 x double> %74, double %73, i32 1
  %76 = fdiv <2 x double> %75, %49
  %77 = fdiv <2 x double> %76, <double 6.000000e+00, double 8.000000e+00>
  %78 = extractelement <2 x double> %77, i32 0
  %79 = extractelement <2 x double> %77, i32 1
  store double %78, double* %71, align 8
  %80 = getelementptr inbounds double, double* %37, i64 %indvars.iv10
  store double %79, double* %80, align 8
  %81 = trunc i64 %indvars.iv.next11 to i32
  %82 = sitofp i32 %81 to double
  %83 = fdiv double %82, %33
  %84 = fdiv double %83, 9.000000e+00
  %85 = getelementptr inbounds double, double* %38, i64 %indvars.iv10
  store double %84, double* %85, align 8
  %86 = getelementptr inbounds double, double* %39, i64 %indvars.iv10
  store double 0.000000e+00, double* %86, align 8
  %87 = getelementptr inbounds double, double* %40, i64 %indvars.iv10
  store double 0.000000e+00, double* %87, align 8
  br i1 %53, label %._crit_edge18.prol.loopexit, label %._crit_edge18.prol

._crit_edge18.prol:                               ; preds = %.lr.ph3.split.us
  %88 = getelementptr inbounds [2000 x double], [2000 x double]* %42, i64 %indvars.iv10, i64 0
  store double %51, double* %88, align 8
  br label %._crit_edge18.prol.loopexit

._crit_edge18.prol.loopexit:                      ; preds = %._crit_edge18.prol, %.lr.ph3.split.us
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge18.prol ], [ 0, %.lr.ph3.split.us ]
  %89 = icmp eq i32 %41, 1
  br i1 %89, label %._crit_edge.us, label %.lr.ph3.split.us.new

.lr.ph3.split.us.new:                             ; preds = %._crit_edge18.prol.loopexit
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge18, %.lr.ph3.split.us.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph3.split.us.new ], [ %indvars.iv.next.1, %._crit_edge18 ]
  %90 = mul nsw i64 %indvars.iv10, %indvars.iv
  %91 = trunc i64 %90 to i32
  %92 = srem i32 %91, %41
  %93 = sitofp i32 %92 to double
  %94 = fdiv double %93, %50
  %95 = getelementptr inbounds [2000 x double], [2000 x double]* %42, i64 %indvars.iv10, i64 %indvars.iv
  store double %94, double* %95, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %96 = mul nsw i64 %indvars.iv10, %indvars.iv.next
  %97 = trunc i64 %96 to i32
  %98 = srem i32 %97, %41
  %99 = sitofp i32 %98 to double
  %100 = fdiv double %99, %50
  %101 = getelementptr inbounds [2000 x double], [2000 x double]* %42, i64 %indvars.iv10, i64 %indvars.iv.next
  store double %100, double* %101, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %._crit_edge18

._crit_edge.us.loopexit:                          ; preds = %._crit_edge18
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %._crit_edge18.prol.loopexit
  %102 = icmp slt i64 %indvars.iv.next11, %45
  %103 = trunc i64 %indvars.iv.next11 to i32
  br i1 %102, label %.lr.ph3.split.us, label %._crit_edge4.loopexit

.lr.ph3.split:                                    ; preds = %.lr.ph3.split, %.lr.ph3.split.preheader
  %indvars.iv12 = phi i64 [ %44, %.lr.ph3.split.preheader ], [ %indvars.iv.next13, %.lr.ph3.split ]
  %104 = phi i32 [ 0, %.lr.ph3.split.preheader ], [ %140, %.lr.ph3.split ]
  %105 = sitofp i32 %104 to double
  %106 = sext i32 %104 to i64
  %107 = getelementptr inbounds double, double* %32, i64 %106
  store double %105, double* %107, align 8
  %indvars.iv.next13 = add nsw i64 %indvars.iv12, 1
  %108 = trunc i64 %indvars.iv.next13 to i32
  %109 = sitofp i32 %108 to double
  %110 = getelementptr inbounds double, double* %34, i64 %indvars.iv12
  %111 = trunc i64 %indvars.iv.next13 to i32
  %112 = sitofp i32 %111 to double
  %113 = insertelement <2 x double> undef, double %109, i32 0
  %114 = insertelement <2 x double> %113, double %112, i32 1
  %115 = fdiv <2 x double> %114, %47
  %116 = fdiv <2 x double> %115, <double 2.000000e+00, double 4.000000e+00>
  %117 = extractelement <2 x double> %116, i32 0
  %118 = extractelement <2 x double> %116, i32 1
  store double %117, double* %110, align 8
  %119 = getelementptr inbounds double, double* %35, i64 %indvars.iv12
  store double %118, double* %119, align 8
  %120 = trunc i64 %indvars.iv.next13 to i32
  %121 = sitofp i32 %120 to double
  %122 = getelementptr inbounds double, double* %36, i64 %indvars.iv12
  %123 = trunc i64 %indvars.iv.next13 to i32
  %124 = sitofp i32 %123 to double
  %125 = insertelement <2 x double> undef, double %121, i32 0
  %126 = insertelement <2 x double> %125, double %124, i32 1
  %127 = fdiv <2 x double> %126, %49
  %128 = fdiv <2 x double> %127, <double 6.000000e+00, double 8.000000e+00>
  %129 = extractelement <2 x double> %128, i32 0
  %130 = extractelement <2 x double> %128, i32 1
  store double %129, double* %122, align 8
  %131 = getelementptr inbounds double, double* %37, i64 %indvars.iv12
  store double %130, double* %131, align 8
  %132 = trunc i64 %indvars.iv.next13 to i32
  %133 = sitofp i32 %132 to double
  %134 = fdiv double %133, %33
  %135 = fdiv double %134, 9.000000e+00
  %136 = getelementptr inbounds double, double* %38, i64 %indvars.iv12
  store double %135, double* %136, align 8
  %137 = getelementptr inbounds double, double* %39, i64 %indvars.iv12
  store double 0.000000e+00, double* %137, align 8
  %138 = getelementptr inbounds double, double* %40, i64 %indvars.iv12
  store double 0.000000e+00, double* %138, align 8
  %139 = icmp slt i64 %indvars.iv.next13, %45
  %140 = trunc i64 %indvars.iv.next13 to i32
  br i1 %139, label %.lr.ph3.split, label %._crit_edge4.loopexit21

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4.loopexit21:                          ; preds = %.lr.ph3.split
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit21, %._crit_edge4.loopexit
  %.lcssa7.in = phi i64 [ %indvars.iv.next11, %._crit_edge4.loopexit ], [ %indvars.iv.next13, %._crit_edge4.loopexit21 ]
  %.lcssa7 = trunc i64 %.lcssa7.in to i32
  store i32 %.lcssa7, i32* %25, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %._crit_edge4
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
  br i1 %27, label %.lr.ph30, label %.thread

.lr.ph30:                                         ; preds = %12
  %28 = load i32, i32* %13, align 4
  %wide.trip.count58.1 = zext i32 %28 to i64
  %29 = sext i32 %28 to i64
  %30 = load [2000 x double]*, [2000 x double]** %16, align 8
  %31 = load double*, double** %17, align 8
  %32 = load double*, double** %18, align 8
  %33 = load double*, double** %19, align 8
  %34 = load double*, double** %20, align 8
  %35 = icmp sgt i32 %28, 0
  br i1 %35, label %.lr.ph30.split.us.preheader, label %._crit_edge31.loopexit

.lr.ph30.split.us.preheader:                      ; preds = %.lr.ph30
  %.promoted32 = load i32, i32* %25, align 4
  %36 = sext i32 %.promoted32 to i64
  %37 = and i32 %28, 1
  %38 = add nsw i64 %wide.trip.count58.1, -2
  %39 = add nsw i64 %wide.trip.count58.1, -2
  %scevgep86 = getelementptr double, double* %32, i64 2
  %scevgep91 = getelementptr double, double* %34, i64 2
  br label %.lr.ph30.split.us

.lr.ph30.split.us:                                ; preds = %._crit_edge26.us, %.lr.ph30.split.us.preheader
  %indvar = phi i64 [ 0, %.lr.ph30.split.us.preheader ], [ %indvar.next, %._crit_edge26.us ]
  %indvars.iv60 = phi i64 [ %36, %.lr.ph30.split.us.preheader ], [ %indvars.iv.next61, %._crit_edge26.us ]
  %40 = icmp eq i32 %37, 0
  %41 = add i64 %36, %indvar
  %scevgep81 = getelementptr [2000 x double], [2000 x double]* %30, i64 %41, i64 2
  %42 = getelementptr inbounds double, double* %31, i64 %indvars.iv60
  %43 = getelementptr inbounds double, double* %33, i64 %indvars.iv60
  br i1 %40, label %.prol.loopexit69, label %.prol.preheader68

.prol.preheader68:                                ; preds = %.lr.ph30.split.us
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %30, i64 %indvars.iv60, i64 0
  %45 = load double, double* %44, align 8
  %46 = load double, double* %42, align 8
  %47 = load double, double* %32, align 8
  %48 = fmul double %46, %47
  %49 = fadd double %45, %48
  %50 = load double, double* %43, align 8
  %51 = load double, double* %34, align 8
  %52 = fmul double %50, %51
  %53 = fadd double %49, %52
  store double %53, double* %44, align 8
  br label %.prol.loopexit69

.prol.loopexit69:                                 ; preds = %.lr.ph30.split.us, %.prol.preheader68
  %indvars.iv56.unr.ph = phi i64 [ 1, %.prol.preheader68 ], [ 0, %.lr.ph30.split.us ]
  %54 = icmp eq i32 %28, 1
  br i1 %54, label %._crit_edge26.us, label %.lr.ph30.split.us.new.preheader

.lr.ph30.split.us.new.preheader:                  ; preds = %.prol.loopexit69
  %55 = sub nsw i64 %38, %indvars.iv56.unr.ph
  %56 = lshr i64 %55, 1
  %57 = add nuw i64 %56, 1
  %min.iters.check = icmp ult i64 %57, 2
  br i1 %min.iters.check, label %.lr.ph30.split.us.new.preheader130, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph30.split.us.new.preheader
  %n.mod.vf = and i64 %57, 1
  %n.vec = sub i64 %57, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.lr.ph30.split.us.new.preheader130, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep79 = getelementptr [2000 x double], [2000 x double]* %30, i64 %41, i64 %indvars.iv56.unr.ph
  %58 = sub nsw i64 %39, %indvars.iv56.unr.ph
  %59 = and i64 %58, -2
  %60 = or i64 %indvars.iv56.unr.ph, %59
  %scevgep82 = getelementptr double, double* %scevgep81, i64 %60
  %scevgep84 = getelementptr double, double* %32, i64 %indvars.iv56.unr.ph
  %scevgep87 = getelementptr double, double* %scevgep86, i64 %60
  %scevgep89 = getelementptr double, double* %34, i64 %indvars.iv56.unr.ph
  %scevgep92 = getelementptr double, double* %scevgep91, i64 %60
  %bound0 = icmp ult double* %scevgep79, %42
  %bound1 = icmp ult double* %42, %scevgep82
  %found.conflict = and i1 %bound0, %bound1
  %bound095 = icmp ult double* %scevgep79, %scevgep87
  %bound196 = icmp ult double* %scevgep84, %scevgep82
  %found.conflict97 = and i1 %bound095, %bound196
  %conflict.rdx = or i1 %found.conflict, %found.conflict97
  %bound0100 = icmp ult double* %scevgep79, %43
  %bound1101 = icmp ult double* %43, %scevgep82
  %found.conflict102 = and i1 %bound0100, %bound1101
  %conflict.rdx103 = or i1 %conflict.rdx, %found.conflict102
  %bound0104 = icmp ult double* %scevgep79, %scevgep92
  %bound1105 = icmp ult double* %scevgep89, %scevgep82
  %found.conflict106 = and i1 %bound0104, %bound1105
  %conflict.rdx107 = or i1 %conflict.rdx103, %found.conflict106
  %61 = or i64 %indvars.iv56.unr.ph, 2
  %62 = shl nuw i64 %56, 1
  %63 = add i64 %61, %62
  %64 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %63, %64
  br i1 %conflict.rdx107, label %.lr.ph30.split.us.new.preheader130, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next, %vector.body ]
  %65 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv56.unr.ph, %65
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %30, i64 %indvars.iv60, i64 %offset.idx
  %67 = bitcast double* %66 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %67, align 8, !alias.scope !1, !noalias !4
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec108 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %68 = load double, double* %42, align 8, !alias.scope !9
  %69 = insertelement <2 x double> undef, double %68, i32 0
  %70 = shufflevector <2 x double> %69, <2 x double> undef, <2 x i32> zeroinitializer
  %71 = getelementptr inbounds double, double* %32, i64 %offset.idx
  %72 = bitcast double* %71 to <4 x double>*
  %wide.vec109 = load <4 x double>, <4 x double>* %72, align 8, !alias.scope !10
  %strided.vec110 = shufflevector <4 x double> %wide.vec109, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec111 = shufflevector <4 x double> %wide.vec109, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %73 = fmul <2 x double> %70, %strided.vec110
  %74 = fadd <2 x double> %strided.vec, %73
  %75 = load double, double* %43, align 8, !alias.scope !11
  %76 = insertelement <2 x double> undef, double %75, i32 0
  %77 = shufflevector <2 x double> %76, <2 x double> undef, <2 x i32> zeroinitializer
  %78 = getelementptr inbounds double, double* %34, i64 %offset.idx
  %79 = bitcast double* %78 to <4 x double>*
  %wide.vec112 = load <4 x double>, <4 x double>* %79, align 8, !alias.scope !12
  %strided.vec113 = shufflevector <4 x double> %wide.vec112, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec114 = shufflevector <4 x double> %wide.vec112, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %80 = fmul <2 x double> %77, %strided.vec113
  %81 = fadd <2 x double> %74, %80
  %82 = add nuw nsw i64 %offset.idx, 1
  %83 = getelementptr inbounds [2000 x double], [2000 x double]* %30, i64 %indvars.iv60, i64 %82
  %84 = load double, double* %42, align 8, !alias.scope !9
  %85 = insertelement <2 x double> undef, double %84, i32 0
  %86 = shufflevector <2 x double> %85, <2 x double> undef, <2 x i32> zeroinitializer
  %87 = fmul <2 x double> %86, %strided.vec111
  %88 = fadd <2 x double> %strided.vec108, %87
  %89 = load double, double* %43, align 8, !alias.scope !11
  %90 = insertelement <2 x double> undef, double %89, i32 0
  %91 = shufflevector <2 x double> %90, <2 x double> undef, <2 x i32> zeroinitializer
  %92 = fmul <2 x double> %91, %strided.vec114
  %93 = fadd <2 x double> %88, %92
  %94 = getelementptr double, double* %83, i64 -1
  %95 = bitcast double* %94 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %81, <2 x double> %93, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %95, align 8, !alias.scope !1, !noalias !4
  %index.next = add i64 %index, 2
  %96 = icmp eq i64 %index.next, %n.vec
  br i1 %96, label %middle.block, label %vector.body, !llvm.loop !13

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge26.us, label %.lr.ph30.split.us.new.preheader130

.lr.ph30.split.us.new.preheader130:               ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph30.split.us.new.preheader
  %indvars.iv56.ph = phi i64 [ %indvars.iv56.unr.ph, %.lr.ph30.split.us.new.preheader ], [ %indvars.iv56.unr.ph, %min.iters.checked ], [ %indvars.iv56.unr.ph, %vector.memcheck ], [ %ind.end, %middle.block ]
  br label %.lr.ph30.split.us.new

.lr.ph30.split.us.new:                            ; preds = %.lr.ph30.split.us.new, %.lr.ph30.split.us.new.preheader130
  %indvars.iv56 = phi i64 [ %indvars.iv56.ph, %.lr.ph30.split.us.new.preheader130 ], [ %indvars.iv.next57.1, %.lr.ph30.split.us.new ]
  %97 = getelementptr inbounds [2000 x double], [2000 x double]* %30, i64 %indvars.iv60, i64 %indvars.iv56
  %98 = load double, double* %97, align 8
  %99 = load double, double* %42, align 8
  %100 = getelementptr inbounds double, double* %32, i64 %indvars.iv56
  %101 = load double, double* %100, align 8
  %102 = fmul double %99, %101
  %103 = fadd double %98, %102
  %104 = load double, double* %43, align 8
  %105 = getelementptr inbounds double, double* %34, i64 %indvars.iv56
  %106 = load double, double* %105, align 8
  %107 = fmul double %104, %106
  %108 = fadd double %103, %107
  store double %108, double* %97, align 8
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %109 = getelementptr inbounds [2000 x double], [2000 x double]* %30, i64 %indvars.iv60, i64 %indvars.iv.next57
  %110 = load double, double* %109, align 8
  %111 = load double, double* %42, align 8
  %112 = getelementptr inbounds double, double* %32, i64 %indvars.iv.next57
  %113 = load double, double* %112, align 8
  %114 = fmul double %111, %113
  %115 = fadd double %110, %114
  %116 = load double, double* %43, align 8
  %117 = getelementptr inbounds double, double* %34, i64 %indvars.iv.next57
  %118 = load double, double* %117, align 8
  %119 = fmul double %116, %118
  %120 = fadd double %115, %119
  store double %120, double* %109, align 8
  %indvars.iv.next57.1 = add nuw nsw i64 %indvars.iv56, 2
  %exitcond59.1 = icmp eq i64 %indvars.iv.next57.1, %wide.trip.count58.1
  br i1 %exitcond59.1, label %._crit_edge26.us.loopexit, label %.lr.ph30.split.us.new, !llvm.loop !16

._crit_edge26.us.loopexit:                        ; preds = %.lr.ph30.split.us.new
  br label %._crit_edge26.us

._crit_edge26.us:                                 ; preds = %._crit_edge26.us.loopexit, %middle.block, %.prol.loopexit69
  %indvars.iv.next61 = add nsw i64 %indvars.iv60, 1
  %121 = icmp slt i64 %indvars.iv.next61, %29
  %indvar.next = add i64 %indvar, 1
  br i1 %121, label %.lr.ph30.split.us, label %._crit_edge31.loopexit.loopexit

._crit_edge31.loopexit.loopexit:                  ; preds = %._crit_edge26.us
  br label %._crit_edge31.loopexit

._crit_edge31.loopexit:                           ; preds = %._crit_edge31.loopexit.loopexit, %.lr.ph30
  %.pr = load i32, i32* %13, align 4
  store i32 0, i32* %25, align 4
  %122 = icmp sgt i32 %.pr, 0
  br i1 %122, label %.lr.ph18, label %.thread73

.lr.ph18:                                         ; preds = %._crit_edge31.loopexit
  %123 = load i32, i32* %13, align 4
  %wide.trip.count50.1 = zext i32 %123 to i64
  %124 = sext i32 %123 to i64
  %125 = load double*, double** %22, align 8
  %126 = load double, double* %15, align 8
  %127 = load [2000 x double]*, [2000 x double]** %16, align 8
  %128 = load double*, double** %23, align 8
  %129 = icmp sgt i32 %123, 0
  br i1 %129, label %.lr.ph18.split.us.preheader, label %.thread

.lr.ph18.split.us.preheader:                      ; preds = %.lr.ph18
  %.promoted20 = load i32, i32* %25, align 4
  %130 = sext i32 %.promoted20 to i64
  %131 = and i32 %123, 1
  br label %.lr.ph18.split.us

.lr.ph18.split.us:                                ; preds = %._crit_edge14.us, %.lr.ph18.split.us.preheader
  %indvars.iv52 = phi i64 [ %130, %.lr.ph18.split.us.preheader ], [ %indvars.iv.next53, %._crit_edge14.us ]
  %132 = icmp eq i32 %131, 0
  br i1 %132, label %.prol.loopexit65, label %.prol.preheader64

.prol.preheader64:                                ; preds = %.lr.ph18.split.us
  %133 = ptrtoint double* %125 to i64
  %sunkaddr115 = shl i64 %indvars.iv52, 3
  %sunkaddr116 = add i64 %133, %sunkaddr115
  %sunkaddr117 = inttoptr i64 %sunkaddr116 to double*
  %134 = load double, double* %sunkaddr117, align 8
  %135 = getelementptr inbounds [2000 x double], [2000 x double]* %127, i64 0, i64 %indvars.iv52
  %136 = load double, double* %135, align 8
  %137 = fmul double %126, %136
  %138 = load double, double* %128, align 8
  %139 = fmul double %137, %138
  %140 = fadd double %134, %139
  store double %140, double* %sunkaddr117, align 8
  br label %.prol.loopexit65

.prol.loopexit65:                                 ; preds = %.lr.ph18.split.us, %.prol.preheader64
  %indvars.iv48.unr.ph = phi i64 [ 1, %.prol.preheader64 ], [ 0, %.lr.ph18.split.us ]
  %141 = icmp eq i32 %123, 1
  br i1 %141, label %._crit_edge14.us, label %.lr.ph18.split.us.new.preheader

.lr.ph18.split.us.new.preheader:                  ; preds = %.prol.loopexit65
  br label %.lr.ph18.split.us.new

.lr.ph18.split.us.new:                            ; preds = %.lr.ph18.split.us.new, %.lr.ph18.split.us.new.preheader
  %indvars.iv48 = phi i64 [ %indvars.iv48.unr.ph, %.lr.ph18.split.us.new.preheader ], [ %indvars.iv.next49.1, %.lr.ph18.split.us.new ]
  %sunkaddr = ptrtoint double* %125 to i64
  %sunkaddr131 = mul i64 %indvars.iv52, 8
  %sunkaddr132 = add i64 %sunkaddr, %sunkaddr131
  %sunkaddr133 = inttoptr i64 %sunkaddr132 to double*
  %142 = load double, double* %sunkaddr133, align 8
  %143 = getelementptr inbounds [2000 x double], [2000 x double]* %127, i64 %indvars.iv48, i64 %indvars.iv52
  %144 = load double, double* %143, align 8
  %145 = fmul double %126, %144
  %146 = getelementptr inbounds double, double* %128, i64 %indvars.iv48
  %147 = load double, double* %146, align 8
  %148 = fmul double %145, %147
  %149 = fadd double %142, %148
  store double %149, double* %sunkaddr133, align 8
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %150 = getelementptr inbounds [2000 x double], [2000 x double]* %127, i64 %indvars.iv.next49, i64 %indvars.iv52
  %151 = load double, double* %150, align 8
  %152 = fmul double %126, %151
  %153 = getelementptr inbounds double, double* %128, i64 %indvars.iv.next49
  %154 = load double, double* %153, align 8
  %155 = fmul double %152, %154
  %156 = fadd double %149, %155
  store double %156, double* %sunkaddr133, align 8
  %indvars.iv.next49.1 = add nuw nsw i64 %indvars.iv48, 2
  %exitcond51.1 = icmp eq i64 %indvars.iv.next49.1, %wide.trip.count50.1
  br i1 %exitcond51.1, label %._crit_edge14.us.loopexit, label %.lr.ph18.split.us.new

._crit_edge14.us.loopexit:                        ; preds = %.lr.ph18.split.us.new
  br label %._crit_edge14.us

._crit_edge14.us:                                 ; preds = %._crit_edge14.us.loopexit, %.prol.loopexit65
  %indvars.iv.next53 = add nsw i64 %indvars.iv52, 1
  %157 = icmp slt i64 %indvars.iv.next53, %124
  br i1 %157, label %.lr.ph18.split.us, label %.thread.loopexit

.thread.loopexit:                                 ; preds = %._crit_edge14.us
  br label %.thread

.thread:                                          ; preds = %.thread.loopexit, %.lr.ph18, %12
  %.pr72 = load i32, i32* %13, align 4
  store i32 0, i32* %25, align 4
  %158 = icmp sgt i32 %.pr72, 0
  br i1 %158, label %.lr.ph9, label %.thread75

.thread75:                                        ; preds = %.thread
  store i32 0, i32* %25, align 4
  br label %._crit_edge76

.lr.ph9:                                          ; preds = %.thread
  %159 = load double*, double** %22, align 8
  %160 = load double*, double** %24, align 8
  %161 = load i32, i32* %13, align 4
  %.promoted = load i32, i32* %25, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph9
  %162 = phi i32 [ %.promoted, %.lr.ph9 ], [ %170, %._crit_edge ]
  %163 = phi i32 [ 0, %.lr.ph9 ], [ %170, %._crit_edge ]
  %164 = sext i32 %163 to i64
  %165 = getelementptr inbounds double, double* %159, i64 %164
  %166 = load double, double* %165, align 8
  %167 = getelementptr inbounds double, double* %160, i64 %164
  %168 = load double, double* %167, align 8
  %169 = fadd double %166, %168
  store double %169, double* %165, align 8
  %170 = add nsw i32 %162, 1
  %171 = icmp slt i32 %170, %161
  br i1 %171, label %._crit_edge, label %.thread73.loopexit

.thread73.loopexit:                               ; preds = %._crit_edge
  br label %.thread73

.thread73:                                        ; preds = %.thread73.loopexit, %._crit_edge31.loopexit
  %.pr74 = load i32, i32* %13, align 4
  store i32 0, i32* %25, align 4
  %172 = icmp sgt i32 %.pr74, 0
  br i1 %172, label %.lr.ph2, label %._crit_edge76

.lr.ph2:                                          ; preds = %.thread73
  %173 = load i32, i32* %13, align 4
  %wide.trip.count.1 = zext i32 %173 to i64
  %174 = sext i32 %173 to i64
  %175 = load double*, double** %21, align 8
  %176 = load double, double* %14, align 8
  %177 = load [2000 x double]*, [2000 x double]** %16, align 8
  %178 = load double*, double** %22, align 8
  %.promoted4 = load i32, i32* %25, align 4
  %179 = sext i32 %.promoted4 to i64
  %180 = icmp sgt i32 %173, 0
  br i1 %180, label %.lr.ph2.split.us.preheader, label %._crit_edge3.loopexit36

.lr.ph2.split.us.preheader:                       ; preds = %.lr.ph2
  %181 = and i32 %173, 1
  br label %.lr.ph2.split.us

.lr.ph2.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph2.split.us.preheader
  %indvars.iv45 = phi i64 [ %179, %.lr.ph2.split.us.preheader ], [ %indvars.iv.next46, %._crit_edge.us ]
  %182 = icmp eq i32 %181, 0
  br i1 %182, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph2.split.us
  %183 = ptrtoint double* %175 to i64
  %sunkaddr123 = shl i64 %indvars.iv45, 3
  %sunkaddr124 = add i64 %183, %sunkaddr123
  %sunkaddr125 = inttoptr i64 %sunkaddr124 to double*
  %184 = load double, double* %sunkaddr125, align 8
  %185 = getelementptr inbounds [2000 x double], [2000 x double]* %177, i64 %indvars.iv45, i64 0
  %186 = load double, double* %185, align 8
  %187 = fmul double %176, %186
  %188 = load double, double* %178, align 8
  %189 = fmul double %187, %188
  %190 = fadd double %184, %189
  store double %190, double* %sunkaddr125, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph2.split.us, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph2.split.us ]
  %191 = icmp eq i32 %173, 1
  br i1 %191, label %._crit_edge.us, label %.lr.ph2.split.us.new.preheader

.lr.ph2.split.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.lr.ph2.split.us.new

.lr.ph2.split.us.new:                             ; preds = %.lr.ph2.split.us.new, %.lr.ph2.split.us.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph2.split.us.new.preheader ], [ %indvars.iv.next.1, %.lr.ph2.split.us.new ]
  %sunkaddr134 = ptrtoint double* %175 to i64
  %sunkaddr135 = mul i64 %indvars.iv45, 8
  %sunkaddr136 = add i64 %sunkaddr134, %sunkaddr135
  %sunkaddr137 = inttoptr i64 %sunkaddr136 to double*
  %192 = load double, double* %sunkaddr137, align 8
  %193 = getelementptr inbounds [2000 x double], [2000 x double]* %177, i64 %indvars.iv45, i64 %indvars.iv
  %194 = load double, double* %193, align 8
  %195 = fmul double %176, %194
  %196 = getelementptr inbounds double, double* %178, i64 %indvars.iv
  %197 = load double, double* %196, align 8
  %198 = fmul double %195, %197
  %199 = fadd double %192, %198
  store double %199, double* %sunkaddr137, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %200 = getelementptr inbounds [2000 x double], [2000 x double]* %177, i64 %indvars.iv45, i64 %indvars.iv.next
  %201 = load double, double* %200, align 8
  %202 = fmul double %176, %201
  %203 = getelementptr inbounds double, double* %178, i64 %indvars.iv.next
  %204 = load double, double* %203, align 8
  %205 = fmul double %202, %204
  %206 = fadd double %199, %205
  store double %206, double* %sunkaddr137, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph2.split.us.new

._crit_edge.us.loopexit:                          ; preds = %.lr.ph2.split.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next46 = add nsw i64 %indvars.iv45, 1
  %207 = icmp slt i64 %indvars.iv.next46, %174
  br i1 %207, label %.lr.ph2.split.us, label %._crit_edge3.loopexit

._crit_edge3.loopexit:                            ; preds = %._crit_edge.us
  %208 = trunc i64 %indvars.iv.next46 to i32
  br label %._crit_edge3

._crit_edge3.loopexit36:                          ; preds = %.lr.ph2
  %209 = add i32 %.promoted4, 1
  %210 = icmp sgt i32 %173, %209
  %smax = select i1 %210, i32 %173, i32 %209
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit36, %._crit_edge3.loopexit
  %.lcssa5 = phi i32 [ %208, %._crit_edge3.loopexit ], [ %smax, %._crit_edge3.loopexit36 ]
  store i32 %.lcssa5, i32* %25, align 4
  br label %._crit_edge76

._crit_edge76:                                    ; preds = %.thread73, %.thread75, %._crit_edge3
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
  %16 = phi i32 [ 0, %.lr.ph ], [ %26, %._crit_edge2 ]
  %17 = srem i32 %16, 20
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %._crit_edge2

; <label>:19:                                     ; preds = %._crit_edge3
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %20) #5
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge3, %19
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = getelementptr inbounds double, double* %12, i64 %indvars.iv
  %23 = load double, double* %22, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %23) #6
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %25 = icmp slt i64 %indvars.iv.next, %15
  %26 = trunc i64 %indvars.iv.next to i32
  br i1 %25, label %._crit_edge3, label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge2
  %27 = trunc i64 %indvars.iv.next to i32
  store i32 %27, i32* %5, align 4
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %2, %._crit_edge
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %28, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %31 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %30) #5
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
