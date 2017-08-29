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
  %36 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %8, align 8
  %37 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 0
  %38 = load [2000 x double]*, [2000 x double]** %9, align 8
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %38, i64 0, i64 0
  %40 = load [2000 x double]*, [2000 x double]** %10, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %40, i64 0, i64 0
  %42 = load [2000 x double]*, [2000 x double]** %11, align 8
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %42, i64 0, i64 0
  %44 = load [2000 x double]*, [2000 x double]** %12, align 8
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %44, i64 0, i64 0
  %46 = load [2000 x double]*, [2000 x double]** %13, align 8
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %46, i64 0, i64 0
  %48 = load [2000 x double]*, [2000 x double]** %14, align 8
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %48, i64 0, i64 0
  %50 = load [2000 x double]*, [2000 x double]** %15, align 8
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %50, i64 0, i64 0
  %52 = load [2000 x double]*, [2000 x double]** %16, align 8
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %52, i64 0, i64 0
  call fastcc void @init_array(i32 %35, double* nonnull %6, double* nonnull %7, [2000 x double]* %37, double* %39, double* %41, double* %43, double* %45, double* %47, double* %49, double* %51, double* %53)
  call void (...) @polybench_timer_start() #4
  %54 = load i32, i32* %5, align 4
  %55 = load double, double* %6, align 8
  %56 = load double, double* %7, align 8
  %57 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %8, align 8
  %58 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %57, i64 0, i64 0
  %59 = load [2000 x double]*, [2000 x double]** %9, align 8
  %60 = getelementptr inbounds [2000 x double], [2000 x double]* %59, i64 0, i64 0
  %61 = load [2000 x double]*, [2000 x double]** %10, align 8
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %61, i64 0, i64 0
  %63 = load [2000 x double]*, [2000 x double]** %11, align 8
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %63, i64 0, i64 0
  %65 = load [2000 x double]*, [2000 x double]** %12, align 8
  %66 = getelementptr inbounds [2000 x double], [2000 x double]* %65, i64 0, i64 0
  %67 = load [2000 x double]*, [2000 x double]** %13, align 8
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %67, i64 0, i64 0
  %69 = load [2000 x double]*, [2000 x double]** %14, align 8
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %69, i64 0, i64 0
  %71 = load [2000 x double]*, [2000 x double]** %15, align 8
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %71, i64 0, i64 0
  %73 = load [2000 x double]*, [2000 x double]** %16, align 8
  %74 = getelementptr inbounds [2000 x double], [2000 x double]* %73, i64 0, i64 0
  call fastcc void @kernel_gemver(i32 %54, double %55, double %56, [2000 x double]* %58, double* %60, double* %62, double* %64, double* %66, double* %68, double* %70, double* %72, double* %74)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %75 = load i32, i32* %3, align 4
  %76 = icmp sgt i32 %75, 42
  br i1 %76, label %77, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:77:                                     ; preds = %2
  %78 = load i8**, i8*** %4, align 8
  %79 = load i8*, i8** %78, align 8
  %strcmpload = load i8, i8* %79, align 1
  %80 = icmp eq i8 %strcmpload, 0
  br i1 %80, label %81, label %.._crit_edge_crit_edge2

.._crit_edge_crit_edge2:                          ; preds = %77
  br label %._crit_edge

; <label>:81:                                     ; preds = %77
  %82 = load i32, i32* %5, align 4
  %83 = load [2000 x double]*, [2000 x double]** %13, align 8
  %84 = getelementptr inbounds [2000 x double], [2000 x double]* %83, i64 0, i64 0
  call fastcc void @print_array(i32 %82, double* %84)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge2, %.._crit_edge_crit_edge, %81
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
  br i1 %31, label %.lr.ph4, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %12
  br label %._crit_edge

.lr.ph4:                                          ; preds = %12
  %32 = load double*, double** %17, align 8
  %33 = load double, double* %26, align 8
  %34 = load double*, double** %19, align 8
  %35 = insertelement <2 x double> undef, double %33, i32 0
  %36 = shufflevector <2 x double> %35, <2 x double> undef, <2 x i32> zeroinitializer
  %37 = load double*, double** %18, align 8
  %38 = load double*, double** %20, align 8
  %39 = insertelement <2 x double> undef, double %33, i32 0
  %40 = shufflevector <2 x double> %39, <2 x double> undef, <2 x i32> zeroinitializer
  %41 = load double*, double** %23, align 8
  %42 = load double, double* %26, align 8
  %43 = load double*, double** %24, align 8
  %44 = load double*, double** %22, align 8
  %45 = load double*, double** %21, align 8
  %46 = load i32, i32* %13, align 4
  %47 = icmp sgt i32 %46, 0
  %48 = sitofp i32 %46 to double
  %49 = load [2000 x double]*, [2000 x double]** %16, align 8
  %.promoted = load i32, i32* %25, align 4
  %50 = sext i32 %.promoted to i64
  %51 = sext i32 %46 to i64
  br i1 %47, label %.lr.ph4.split.us.preheader, label %.lr.ph4.split.preheader

.lr.ph4.split.preheader:                          ; preds = %.lr.ph4
  br label %.lr.ph4.split

.lr.ph4.split.us.preheader:                       ; preds = %.lr.ph4
  %52 = and i32 %46, 1
  %lcmp.mod = icmp eq i32 %52, 0
  %53 = icmp eq i32 %46, 1
  %wide.trip.count.1 = zext i32 %46 to i64
  %54 = fdiv double 0.000000e+00, %48
  %55 = insertelement <2 x double> undef, double %48, i32 0
  %56 = shufflevector <2 x double> %55, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.lr.ph4.split.us

.lr.ph4.split.us:                                 ; preds = %._crit_edge.us..lr.ph4.split.us_crit_edge, %.lr.ph4.split.us.preheader
  %indvars.iv11 = phi i64 [ %50, %.lr.ph4.split.us.preheader ], [ %indvars.iv.next12, %._crit_edge.us..lr.ph4.split.us_crit_edge ]
  %57 = trunc i64 %indvars.iv11 to i32
  %58 = sitofp i32 %57 to double
  %59 = getelementptr inbounds double, double* %32, i64 %indvars.iv11
  store double %58, double* %59, align 8
  %indvars.iv.next12 = add nsw i64 %indvars.iv11, 1
  %60 = trunc i64 %indvars.iv.next12 to i32
  %61 = sitofp i32 %60 to double
  %62 = getelementptr inbounds double, double* %34, i64 %indvars.iv11
  %63 = trunc i64 %indvars.iv.next12 to i32
  %64 = sitofp i32 %63 to double
  %65 = insertelement <2 x double> undef, double %61, i32 0
  %66 = insertelement <2 x double> %65, double %64, i32 1
  %67 = fdiv <2 x double> %66, %36
  %68 = fdiv <2 x double> %67, <double 2.000000e+00, double 4.000000e+00>
  %69 = extractelement <2 x double> %68, i32 0
  %70 = extractelement <2 x double> %68, i32 1
  store double %69, double* %62, align 8
  %71 = getelementptr inbounds double, double* %37, i64 %indvars.iv11
  store double %70, double* %71, align 8
  %72 = trunc i64 %indvars.iv.next12 to i32
  %73 = sitofp i32 %72 to double
  %74 = getelementptr inbounds double, double* %38, i64 %indvars.iv11
  %75 = trunc i64 %indvars.iv.next12 to i32
  %76 = sitofp i32 %75 to double
  %77 = insertelement <2 x double> undef, double %73, i32 0
  %78 = insertelement <2 x double> %77, double %76, i32 1
  %79 = fdiv <2 x double> %78, %40
  %80 = fdiv <2 x double> %79, <double 6.000000e+00, double 8.000000e+00>
  %81 = extractelement <2 x double> %80, i32 0
  %82 = extractelement <2 x double> %80, i32 1
  store double %81, double* %74, align 8
  %83 = getelementptr inbounds double, double* %41, i64 %indvars.iv11
  store double %82, double* %83, align 8
  %84 = trunc i64 %indvars.iv.next12 to i32
  %85 = sitofp i32 %84 to double
  %86 = fdiv double %85, %42
  %87 = fdiv double %86, 9.000000e+00
  %88 = getelementptr inbounds double, double* %43, i64 %indvars.iv11
  store double %87, double* %88, align 8
  %89 = getelementptr inbounds double, double* %44, i64 %indvars.iv11
  store double 0.000000e+00, double* %89, align 8
  %90 = getelementptr inbounds double, double* %45, i64 %indvars.iv11
  store double 0.000000e+00, double* %90, align 8
  br i1 %lcmp.mod, label %.lr.ph4.split.us..prol.loopexit_crit_edge, label %.prol.preheader

.lr.ph4.split.us..prol.loopexit_crit_edge:        ; preds = %.lr.ph4.split.us
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.lr.ph4.split.us
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %49, i64 %indvars.iv11, i64 0
  store double %54, double* %91, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph4.split.us..prol.loopexit_crit_edge, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph4.split.us..prol.loopexit_crit_edge ]
  br i1 %53, label %.prol.loopexit.._crit_edge.us_crit_edge, label %.lr.ph4.split.us.new.preheader

.prol.loopexit.._crit_edge.us_crit_edge:          ; preds = %.prol.loopexit
  br label %._crit_edge.us

.lr.ph4.split.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.lr.ph4.split.us.new

.lr.ph4.split.us.new:                             ; preds = %.lr.ph4.split.us.new..lr.ph4.split.us.new_crit_edge, %.lr.ph4.split.us.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph4.split.us.new..lr.ph4.split.us.new_crit_edge ], [ %indvars.iv.unr.ph, %.lr.ph4.split.us.new.preheader ]
  %92 = mul nsw i64 %indvars.iv, %indvars.iv11
  %93 = trunc i64 %92 to i32
  %94 = srem i32 %93, %46
  %95 = sitofp i32 %94 to double
  %96 = getelementptr inbounds [2000 x double], [2000 x double]* %49, i64 %indvars.iv11, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %97 = mul nsw i64 %indvars.iv.next, %indvars.iv11
  %98 = trunc i64 %97 to i32
  %99 = srem i32 %98, %46
  %100 = sitofp i32 %99 to double
  %101 = insertelement <2 x double> undef, double %95, i32 0
  %102 = insertelement <2 x double> %101, double %100, i32 1
  %103 = fdiv <2 x double> %102, %56
  %104 = bitcast double* %96 to <2 x double>*
  store <2 x double> %103, <2 x double>* %104, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph4.split.us.new..lr.ph4.split.us.new_crit_edge

.lr.ph4.split.us.new..lr.ph4.split.us.new_crit_edge: ; preds = %.lr.ph4.split.us.new
  br label %.lr.ph4.split.us.new

._crit_edge.us.loopexit:                          ; preds = %.lr.ph4.split.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.prol.loopexit.._crit_edge.us_crit_edge, %._crit_edge.us.loopexit
  %105 = icmp slt i64 %indvars.iv.next12, %51
  br i1 %105, label %._crit_edge.us..lr.ph4.split.us_crit_edge, label %._crit_edge5.loopexit

._crit_edge.us..lr.ph4.split.us_crit_edge:        ; preds = %._crit_edge.us
  br label %.lr.ph4.split.us

.lr.ph4.split:                                    ; preds = %.lr.ph4.split..lr.ph4.split_crit_edge, %.lr.ph4.split.preheader
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %.lr.ph4.split..lr.ph4.split_crit_edge ], [ %50, %.lr.ph4.split.preheader ]
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
  %116 = fdiv <2 x double> %115, %36
  %117 = fdiv <2 x double> %116, <double 2.000000e+00, double 4.000000e+00>
  %118 = extractelement <2 x double> %117, i32 0
  %119 = extractelement <2 x double> %117, i32 1
  store double %118, double* %111, align 8
  %120 = getelementptr inbounds double, double* %37, i64 %indvars.iv13
  store double %119, double* %120, align 8
  %121 = trunc i64 %indvars.iv.next14 to i32
  %122 = sitofp i32 %121 to double
  %123 = getelementptr inbounds double, double* %38, i64 %indvars.iv13
  %124 = trunc i64 %indvars.iv.next14 to i32
  %125 = sitofp i32 %124 to double
  %126 = insertelement <2 x double> undef, double %122, i32 0
  %127 = insertelement <2 x double> %126, double %125, i32 1
  %128 = fdiv <2 x double> %127, %40
  %129 = fdiv <2 x double> %128, <double 6.000000e+00, double 8.000000e+00>
  %130 = extractelement <2 x double> %129, i32 0
  %131 = extractelement <2 x double> %129, i32 1
  store double %130, double* %123, align 8
  %132 = getelementptr inbounds double, double* %41, i64 %indvars.iv13
  store double %131, double* %132, align 8
  %133 = trunc i64 %indvars.iv.next14 to i32
  %134 = sitofp i32 %133 to double
  %135 = fdiv double %134, %42
  %136 = fdiv double %135, 9.000000e+00
  %137 = getelementptr inbounds double, double* %43, i64 %indvars.iv13
  store double %136, double* %137, align 8
  %138 = getelementptr inbounds double, double* %44, i64 %indvars.iv13
  store double 0.000000e+00, double* %138, align 8
  %139 = getelementptr inbounds double, double* %45, i64 %indvars.iv13
  store double 0.000000e+00, double* %139, align 8
  %140 = icmp slt i64 %indvars.iv.next14, %51
  br i1 %140, label %.lr.ph4.split..lr.ph4.split_crit_edge, label %._crit_edge5.loopexit20

.lr.ph4.split..lr.ph4.split_crit_edge:            ; preds = %.lr.ph4.split
  br label %.lr.ph4.split

._crit_edge5.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge5

._crit_edge5.loopexit20:                          ; preds = %.lr.ph4.split
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit20, %._crit_edge5.loopexit
  %.lcssa8.in = phi i64 [ %indvars.iv.next12, %._crit_edge5.loopexit ], [ %indvars.iv.next14, %._crit_edge5.loopexit20 ]
  %.lcssa8 = trunc i64 %.lcssa8.in to i32
  store i32 %.lcssa8, i32* %25, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %._crit_edge5
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
  br i1 %27, label %.preheader11.lr.ph, label %..preheader8_crit_edge

..preheader8_crit_edge:                           ; preds = %12
  br label %.preheader8

.preheader11.lr.ph:                               ; preds = %12
  %28 = load i32, i32* %13, align 4
  %29 = icmp sgt i32 %28, 0
  %30 = load [2000 x double]*, [2000 x double]** %16, align 8
  %31 = load double*, double** %17, align 8
  %32 = load double*, double** %18, align 8
  %33 = load double*, double** %19, align 8
  %34 = load double*, double** %20, align 8
  br i1 %29, label %.preheader11.us.preheader, label %.preheader11.lr.ph..preheader10_crit_edge

.preheader11.lr.ph..preheader10_crit_edge:        ; preds = %.preheader11.lr.ph
  br label %.preheader10

.preheader11.us.preheader:                        ; preds = %.preheader11.lr.ph
  %.promoted31 = load i32, i32* %25, align 4
  %35 = load i32, i32* %13, align 4
  %36 = sext i32 %35 to i64
  %37 = sext i32 %.promoted31 to i64
  %38 = sext i32 %28 to i64
  %39 = icmp sgt i64 %36, 1
  %smax71 = select i1 %39, i64 %36, i64 1
  %40 = icmp sgt i64 %36, 1
  %smax73 = select i1 %40, i64 %36, i64 1
  %scevgep76 = getelementptr double, double* %32, i64 %smax73
  %scevgep78 = getelementptr double, double* %34, i64 %smax73
  %min.iters.check = icmp ult i64 %smax71, 4
  %n.vec = and i64 %smax71, 9223372036854775804
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %smax71, %n.vec
  br label %.preheader11.us

.preheader11.us:                                  ; preds = %._crit_edge28.us..preheader11.us_crit_edge, %.preheader11.us.preheader
  %indvar = phi i64 [ %indvar.next, %._crit_edge28.us..preheader11.us_crit_edge ], [ 0, %.preheader11.us.preheader ]
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %._crit_edge28.us..preheader11.us_crit_edge ], [ %37, %.preheader11.us.preheader ]
  %41 = add i64 %37, %indvar
  %scevgep = getelementptr [2000 x double], [2000 x double]* %30, i64 %41, i64 0
  %scevgep74 = getelementptr [2000 x double], [2000 x double]* %30, i64 %41, i64 %smax73
  %42 = getelementptr inbounds double, double* %31, i64 %indvars.iv59
  %43 = getelementptr inbounds double, double* %33, i64 %indvars.iv59
  br i1 %min.iters.check, label %.preheader11.us.._crit_edge.preheader_crit_edge, label %min.iters.checked

.preheader11.us.._crit_edge.preheader_crit_edge:  ; preds = %.preheader11.us
  br label %._crit_edge.preheader

min.iters.checked:                                ; preds = %.preheader11.us
  br i1 %cmp.zero, label %min.iters.checked.._crit_edge.preheader_crit_edge, label %vector.memcheck

min.iters.checked.._crit_edge.preheader_crit_edge: ; preds = %min.iters.checked
  br label %._crit_edge.preheader

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %42
  %bound1 = icmp ult double* %42, %scevgep74
  %found.conflict = and i1 %bound0, %bound1
  %bound081 = icmp ult double* %scevgep, %scevgep76
  %bound182 = icmp ult double* %32, %scevgep74
  %found.conflict83 = and i1 %bound081, %bound182
  %conflict.rdx = or i1 %found.conflict, %found.conflict83
  %bound086 = icmp ult double* %scevgep, %43
  %bound187 = icmp ult double* %43, %scevgep74
  %found.conflict88 = and i1 %bound086, %bound187
  %conflict.rdx89 = or i1 %conflict.rdx, %found.conflict88
  %bound090 = icmp ult double* %scevgep, %scevgep78
  %bound191 = icmp ult double* %34, %scevgep74
  %found.conflict92 = and i1 %bound090, %bound191
  %conflict.rdx93 = or i1 %conflict.rdx89, %found.conflict92
  br i1 %conflict.rdx93, label %vector.memcheck.._crit_edge.preheader_crit_edge, label %vector.body.preheader

vector.memcheck.._crit_edge.preheader_crit_edge:  ; preds = %vector.memcheck
  br label %._crit_edge.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %30, i64 %indvars.iv59, i64 %index
  %45 = bitcast double* %44 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %45, align 8, !alias.scope !1, !noalias !4
  %46 = getelementptr double, double* %44, i64 2
  %47 = bitcast double* %46 to <2 x double>*
  %wide.load95 = load <2 x double>, <2 x double>* %47, align 8, !alias.scope !1, !noalias !4
  %48 = load double, double* %42, align 8, !alias.scope !9
  %49 = insertelement <2 x double> undef, double %48, i32 0
  %50 = shufflevector <2 x double> %49, <2 x double> undef, <2 x i32> zeroinitializer
  %51 = insertelement <2 x double> undef, double %48, i32 0
  %52 = shufflevector <2 x double> %51, <2 x double> undef, <2 x i32> zeroinitializer
  %53 = getelementptr inbounds double, double* %32, i64 %index
  %54 = bitcast double* %53 to <2 x double>*
  %wide.load96 = load <2 x double>, <2 x double>* %54, align 8, !alias.scope !10
  %55 = getelementptr double, double* %53, i64 2
  %56 = bitcast double* %55 to <2 x double>*
  %wide.load97 = load <2 x double>, <2 x double>* %56, align 8, !alias.scope !10
  %57 = fmul <2 x double> %50, %wide.load96
  %58 = fmul <2 x double> %52, %wide.load97
  %59 = fadd <2 x double> %wide.load, %57
  %60 = fadd <2 x double> %wide.load95, %58
  %61 = load double, double* %43, align 8, !alias.scope !11
  %62 = insertelement <2 x double> undef, double %61, i32 0
  %63 = shufflevector <2 x double> %62, <2 x double> undef, <2 x i32> zeroinitializer
  %64 = insertelement <2 x double> undef, double %61, i32 0
  %65 = shufflevector <2 x double> %64, <2 x double> undef, <2 x i32> zeroinitializer
  %66 = getelementptr inbounds double, double* %34, i64 %index
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load98 = load <2 x double>, <2 x double>* %67, align 8, !alias.scope !12
  %68 = getelementptr double, double* %66, i64 2
  %69 = bitcast double* %68 to <2 x double>*
  %wide.load99 = load <2 x double>, <2 x double>* %69, align 8, !alias.scope !12
  %70 = fmul <2 x double> %63, %wide.load98
  %71 = fmul <2 x double> %65, %wide.load99
  %72 = fadd <2 x double> %59, %70
  %73 = fadd <2 x double> %60, %71
  %74 = bitcast double* %44 to <2 x double>*
  store <2 x double> %72, <2 x double>* %74, align 8, !alias.scope !1, !noalias !4
  %75 = bitcast double* %46 to <2 x double>*
  store <2 x double> %73, <2 x double>* %75, align 8, !alias.scope !1, !noalias !4
  %index.next = add i64 %index, 4
  %76 = icmp eq i64 %index.next, %n.vec
  br i1 %76, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !13

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %middle.block.._crit_edge28.us_crit_edge, label %middle.block.._crit_edge.preheader_crit_edge

middle.block.._crit_edge.preheader_crit_edge:     ; preds = %middle.block
  br label %._crit_edge.preheader

middle.block.._crit_edge28.us_crit_edge:          ; preds = %middle.block
  br label %._crit_edge28.us

._crit_edge.preheader:                            ; preds = %middle.block.._crit_edge.preheader_crit_edge, %vector.memcheck.._crit_edge.preheader_crit_edge, %min.iters.checked.._crit_edge.preheader_crit_edge, %.preheader11.us.._crit_edge.preheader_crit_edge
  %indvars.iv57.ph = phi i64 [ 0, %vector.memcheck.._crit_edge.preheader_crit_edge ], [ 0, %min.iters.checked.._crit_edge.preheader_crit_edge ], [ 0, %.preheader11.us.._crit_edge.preheader_crit_edge ], [ %n.vec, %middle.block.._crit_edge.preheader_crit_edge ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %._crit_edge.preheader
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %._crit_edge.._crit_edge_crit_edge ], [ %indvars.iv57.ph, %._crit_edge.preheader ]
  %77 = getelementptr inbounds [2000 x double], [2000 x double]* %30, i64 %indvars.iv59, i64 %indvars.iv57
  %78 = load double, double* %77, align 8
  %79 = load double, double* %42, align 8
  %80 = getelementptr inbounds double, double* %32, i64 %indvars.iv57
  %81 = load double, double* %80, align 8
  %82 = fmul double %79, %81
  %83 = fadd double %78, %82
  %84 = load double, double* %43, align 8
  %85 = getelementptr inbounds double, double* %34, i64 %indvars.iv57
  %86 = load double, double* %85, align 8
  %87 = fmul double %84, %86
  %88 = fadd double %83, %87
  %89 = getelementptr inbounds [2000 x double], [2000 x double]* %30, i64 %indvars.iv59, i64 %indvars.iv57
  store double %88, double* %89, align 8
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %90 = icmp slt i64 %indvars.iv.next58, %36
  br i1 %90, label %._crit_edge.._crit_edge_crit_edge, label %._crit_edge28.us.loopexit, !llvm.loop !16

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

._crit_edge28.us.loopexit:                        ; preds = %._crit_edge
  br label %._crit_edge28.us

._crit_edge28.us:                                 ; preds = %middle.block.._crit_edge28.us_crit_edge, %._crit_edge28.us.loopexit
  %indvars.iv.next60 = add nsw i64 %indvars.iv59, 1
  %91 = icmp slt i64 %indvars.iv.next60, %38
  %indvar.next = add i64 %indvar, 1
  br i1 %91, label %._crit_edge28.us..preheader11.us_crit_edge, label %.preheader10.loopexit

._crit_edge28.us..preheader11.us_crit_edge:       ; preds = %._crit_edge28.us
  br label %.preheader11.us

.preheader10.loopexit:                            ; preds = %._crit_edge28.us
  br label %.preheader10

.preheader10:                                     ; preds = %.preheader11.lr.ph..preheader10_crit_edge, %.preheader10.loopexit
  %.pr = load i32, i32* %13, align 4
  store i32 0, i32* %25, align 4
  %92 = icmp sgt i32 %.pr, 0
  br i1 %92, label %.preheader9.lr.ph, label %.preheader10..preheader7_crit_edge

.preheader10..preheader7_crit_edge:               ; preds = %.preheader10
  br label %.preheader7

.preheader9.lr.ph:                                ; preds = %.preheader10
  %93 = load i32, i32* %13, align 4
  %94 = icmp sgt i32 %93, 0
  %95 = load double*, double** %22, align 8
  %96 = load double, double* %15, align 8
  %97 = load [2000 x double]*, [2000 x double]** %16, align 8
  %98 = load double*, double** %23, align 8
  br i1 %94, label %.preheader9.us.preheader, label %.preheader9.lr.ph..preheader8_crit_edge

.preheader9.lr.ph..preheader8_crit_edge:          ; preds = %.preheader9.lr.ph
  br label %.preheader8

.preheader9.us.preheader:                         ; preds = %.preheader9.lr.ph
  %.promoted23 = load i32, i32* %25, align 4
  %99 = sext i32 %.promoted23 to i64
  %100 = sext i32 %93 to i64
  %101 = and i32 %93, 1
  %lcmp.mod66 = icmp eq i32 %101, 0
  %102 = icmp eq i32 %93, 1
  %wide.trip.count51.1 = zext i32 %93 to i64
  br label %.preheader9.us

.preheader9.us:                                   ; preds = %._crit_edge20.us..preheader9.us_crit_edge, %.preheader9.us.preheader
  %indvars.iv53 = phi i64 [ %99, %.preheader9.us.preheader ], [ %indvars.iv.next54, %._crit_edge20.us..preheader9.us_crit_edge ]
  %103 = getelementptr inbounds double, double* %95, i64 %indvars.iv53
  %104 = getelementptr inbounds double, double* %95, i64 %indvars.iv53
  br i1 %lcmp.mod66, label %.preheader9.us..prol.loopexit64_crit_edge, label %.prol.preheader63

.preheader9.us..prol.loopexit64_crit_edge:        ; preds = %.preheader9.us
  br label %.prol.loopexit64

.prol.preheader63:                                ; preds = %.preheader9.us
  %105 = load double, double* %103, align 8
  %106 = getelementptr inbounds [2000 x double], [2000 x double]* %97, i64 0, i64 %indvars.iv53
  %107 = load double, double* %106, align 8
  %108 = fmul double %96, %107
  %109 = load double, double* %98, align 8
  %110 = fmul double %108, %109
  %111 = fadd double %105, %110
  store double %111, double* %104, align 8
  br label %.prol.loopexit64

.prol.loopexit64:                                 ; preds = %.preheader9.us..prol.loopexit64_crit_edge, %.prol.preheader63
  %indvars.iv49.unr.ph = phi i64 [ 1, %.prol.preheader63 ], [ 0, %.preheader9.us..prol.loopexit64_crit_edge ]
  br i1 %102, label %.prol.loopexit64.._crit_edge20.us_crit_edge, label %.preheader9.us.new.preheader

.prol.loopexit64.._crit_edge20.us_crit_edge:      ; preds = %.prol.loopexit64
  br label %._crit_edge20.us

.preheader9.us.new.preheader:                     ; preds = %.prol.loopexit64
  br label %.preheader9.us.new

.preheader9.us.new:                               ; preds = %.preheader9.us.new..preheader9.us.new_crit_edge, %.preheader9.us.new.preheader
  %indvars.iv49 = phi i64 [ %indvars.iv.next50.1, %.preheader9.us.new..preheader9.us.new_crit_edge ], [ %indvars.iv49.unr.ph, %.preheader9.us.new.preheader ]
  %112 = load double, double* %103, align 8
  %113 = getelementptr inbounds [2000 x double], [2000 x double]* %97, i64 %indvars.iv49, i64 %indvars.iv53
  %114 = load double, double* %113, align 8
  %115 = fmul double %96, %114
  %116 = getelementptr inbounds double, double* %98, i64 %indvars.iv49
  %117 = load double, double* %116, align 8
  %118 = fmul double %115, %117
  %119 = fadd double %112, %118
  store double %119, double* %104, align 8
  %indvars.iv.next50 = add nuw nsw i64 %indvars.iv49, 1
  %120 = getelementptr inbounds [2000 x double], [2000 x double]* %97, i64 %indvars.iv.next50, i64 %indvars.iv53
  %121 = load double, double* %120, align 8
  %122 = fmul double %96, %121
  %123 = getelementptr inbounds double, double* %98, i64 %indvars.iv.next50
  %124 = load double, double* %123, align 8
  %125 = fmul double %122, %124
  %126 = fadd double %119, %125
  store double %126, double* %104, align 8
  %indvars.iv.next50.1 = add nsw i64 %indvars.iv49, 2
  %exitcond52.1 = icmp eq i64 %indvars.iv.next50.1, %wide.trip.count51.1
  br i1 %exitcond52.1, label %._crit_edge20.us.loopexit, label %.preheader9.us.new..preheader9.us.new_crit_edge

.preheader9.us.new..preheader9.us.new_crit_edge:  ; preds = %.preheader9.us.new
  br label %.preheader9.us.new

._crit_edge20.us.loopexit:                        ; preds = %.preheader9.us.new
  br label %._crit_edge20.us

._crit_edge20.us:                                 ; preds = %.prol.loopexit64.._crit_edge20.us_crit_edge, %._crit_edge20.us.loopexit
  %indvars.iv.next54 = add nsw i64 %indvars.iv53, 1
  %127 = icmp slt i64 %indvars.iv.next54, %100
  br i1 %127, label %._crit_edge20.us..preheader9.us_crit_edge, label %.preheader8.loopexit

._crit_edge20.us..preheader9.us_crit_edge:        ; preds = %._crit_edge20.us
  br label %.preheader9.us

.preheader8.loopexit:                             ; preds = %._crit_edge20.us
  br label %.preheader8

.preheader8:                                      ; preds = %.preheader9.lr.ph..preheader8_crit_edge, %..preheader8_crit_edge, %.preheader8.loopexit
  %.pr67 = load i32, i32* %13, align 4
  store i32 0, i32* %25, align 4
  %128 = icmp sgt i32 %.pr67, 0
  br i1 %128, label %.lr.ph17, label %.preheader7.thread

.preheader7.thread:                               ; preds = %.preheader8
  store i32 0, i32* %25, align 4
  br label %.preheader7._crit_edge

.lr.ph17:                                         ; preds = %.preheader8
  %129 = load double*, double** %22, align 8
  %130 = load double*, double** %24, align 8
  %131 = load i32, i32* %13, align 4
  %.promoted = load i32, i32* %25, align 4
  %132 = sext i32 %.promoted to i64
  %133 = sext i32 %131 to i64
  %134 = add nsw i64 %132, 1
  %135 = icmp sgt i64 %134, %133
  %smax103 = select i1 %135, i64 %134, i64 %133
  %136 = sub nsw i64 %smax103, %132
  %min.iters.check104 = icmp ult i64 %136, 4
  br i1 %min.iters.check104, label %.lr.ph17.._crit_edge69.preheader_crit_edge, label %min.iters.checked105

.lr.ph17.._crit_edge69.preheader_crit_edge:       ; preds = %.lr.ph17
  br label %._crit_edge69.preheader

._crit_edge69.preheader:                          ; preds = %middle.block101.._crit_edge69.preheader_crit_edge, %vector.memcheck123.._crit_edge69.preheader_crit_edge, %min.iters.checked105.._crit_edge69.preheader_crit_edge, %.lr.ph17.._crit_edge69.preheader_crit_edge
  %indvars.iv46.ph = phi i64 [ %132, %vector.memcheck123.._crit_edge69.preheader_crit_edge ], [ %132, %min.iters.checked105.._crit_edge69.preheader_crit_edge ], [ %132, %.lr.ph17.._crit_edge69.preheader_crit_edge ], [ %ind.end, %middle.block101.._crit_edge69.preheader_crit_edge ]
  br label %._crit_edge69

min.iters.checked105:                             ; preds = %.lr.ph17
  %n.vec107 = and i64 %136, -4
  %cmp.zero108 = icmp eq i64 %n.vec107, 0
  br i1 %cmp.zero108, label %min.iters.checked105.._crit_edge69.preheader_crit_edge, label %vector.memcheck123

min.iters.checked105.._crit_edge69.preheader_crit_edge: ; preds = %min.iters.checked105
  br label %._crit_edge69.preheader

vector.memcheck123:                               ; preds = %min.iters.checked105
  %scevgep110 = getelementptr double, double* %129, i64 %132
  %137 = add nsw i64 %132, 1
  %138 = icmp sgt i64 %137, %133
  %smax112 = select i1 %138, i64 %137, i64 %133
  %scevgep113 = getelementptr double, double* %129, i64 %smax112
  %scevgep115 = getelementptr double, double* %130, i64 %132
  %scevgep117 = getelementptr double, double* %130, i64 %smax112
  %bound0119 = icmp ult double* %scevgep110, %scevgep117
  %bound1120 = icmp ult double* %scevgep115, %scevgep113
  %memcheck.conflict122 = and i1 %bound0119, %bound1120
  %ind.end = add nsw i64 %132, %n.vec107
  br i1 %memcheck.conflict122, label %vector.memcheck123.._crit_edge69.preheader_crit_edge, label %vector.body100.preheader

vector.memcheck123.._crit_edge69.preheader_crit_edge: ; preds = %vector.memcheck123
  br label %._crit_edge69.preheader

vector.body100.preheader:                         ; preds = %vector.memcheck123
  %139 = add nsw i64 %n.vec107, -4
  %140 = lshr exact i64 %139, 2
  %141 = and i64 %140, 1
  %lcmp.mod137 = icmp eq i64 %141, 0
  br i1 %lcmp.mod137, label %vector.body100.prol.preheader, label %vector.body100.preheader.vector.body100.prol.loopexit_crit_edge

vector.body100.preheader.vector.body100.prol.loopexit_crit_edge: ; preds = %vector.body100.preheader
  br label %vector.body100.prol.loopexit

vector.body100.prol.preheader:                    ; preds = %vector.body100.preheader
  br label %vector.body100.prol

vector.body100.prol:                              ; preds = %vector.body100.prol.preheader
  %142 = getelementptr inbounds double, double* %129, i64 %132
  %143 = bitcast double* %142 to <2 x double>*
  %wide.load133.prol = load <2 x double>, <2 x double>* %143, align 8, !alias.scope !17, !noalias !20
  %144 = getelementptr double, double* %142, i64 2
  %145 = bitcast double* %144 to <2 x double>*
  %wide.load134.prol = load <2 x double>, <2 x double>* %145, align 8, !alias.scope !17, !noalias !20
  %146 = getelementptr inbounds double, double* %130, i64 %132
  %147 = bitcast double* %146 to <2 x double>*
  %wide.load135.prol = load <2 x double>, <2 x double>* %147, align 8, !alias.scope !20
  %148 = getelementptr double, double* %146, i64 2
  %149 = bitcast double* %148 to <2 x double>*
  %wide.load136.prol = load <2 x double>, <2 x double>* %149, align 8, !alias.scope !20
  %150 = fadd <2 x double> %wide.load133.prol, %wide.load135.prol
  %151 = fadd <2 x double> %wide.load134.prol, %wide.load136.prol
  %152 = bitcast double* %142 to <2 x double>*
  store <2 x double> %150, <2 x double>* %152, align 8, !alias.scope !17, !noalias !20
  %153 = bitcast double* %144 to <2 x double>*
  store <2 x double> %151, <2 x double>* %153, align 8, !alias.scope !17, !noalias !20
  br label %vector.body100.prol.loopexit

vector.body100.prol.loopexit:                     ; preds = %vector.body100.preheader.vector.body100.prol.loopexit_crit_edge, %vector.body100.prol
  %index125.unr = phi i64 [ 0, %vector.body100.preheader.vector.body100.prol.loopexit_crit_edge ], [ 4, %vector.body100.prol ]
  %154 = icmp eq i64 %140, 0
  br i1 %154, label %vector.body100.prol.loopexit.middle.block101_crit_edge, label %vector.body100.preheader.new

vector.body100.prol.loopexit.middle.block101_crit_edge: ; preds = %vector.body100.prol.loopexit
  br label %middle.block101

vector.body100.preheader.new:                     ; preds = %vector.body100.prol.loopexit
  br label %vector.body100

vector.body100:                                   ; preds = %vector.body100.vector.body100_crit_edge, %vector.body100.preheader.new
  %index125 = phi i64 [ %index125.unr, %vector.body100.preheader.new ], [ %index.next126.1, %vector.body100.vector.body100_crit_edge ]
  %155 = add i64 %132, %index125
  %156 = getelementptr inbounds double, double* %129, i64 %155
  %157 = bitcast double* %156 to <2 x double>*
  %wide.load133 = load <2 x double>, <2 x double>* %157, align 8, !alias.scope !17, !noalias !20
  %158 = getelementptr double, double* %156, i64 2
  %159 = bitcast double* %158 to <2 x double>*
  %wide.load134 = load <2 x double>, <2 x double>* %159, align 8, !alias.scope !17, !noalias !20
  %160 = getelementptr inbounds double, double* %130, i64 %155
  %161 = bitcast double* %160 to <2 x double>*
  %wide.load135 = load <2 x double>, <2 x double>* %161, align 8, !alias.scope !20
  %162 = getelementptr double, double* %160, i64 2
  %163 = bitcast double* %162 to <2 x double>*
  %wide.load136 = load <2 x double>, <2 x double>* %163, align 8, !alias.scope !20
  %164 = fadd <2 x double> %wide.load133, %wide.load135
  %165 = fadd <2 x double> %wide.load134, %wide.load136
  %166 = bitcast double* %156 to <2 x double>*
  store <2 x double> %164, <2 x double>* %166, align 8, !alias.scope !17, !noalias !20
  %167 = bitcast double* %158 to <2 x double>*
  store <2 x double> %165, <2 x double>* %167, align 8, !alias.scope !17, !noalias !20
  %index.next126 = add i64 %index125, 4
  %168 = add i64 %132, %index.next126
  %169 = getelementptr inbounds double, double* %129, i64 %168
  %170 = bitcast double* %169 to <2 x double>*
  %wide.load133.1 = load <2 x double>, <2 x double>* %170, align 8, !alias.scope !17, !noalias !20
  %171 = getelementptr double, double* %169, i64 2
  %172 = bitcast double* %171 to <2 x double>*
  %wide.load134.1 = load <2 x double>, <2 x double>* %172, align 8, !alias.scope !17, !noalias !20
  %173 = getelementptr inbounds double, double* %130, i64 %168
  %174 = bitcast double* %173 to <2 x double>*
  %wide.load135.1 = load <2 x double>, <2 x double>* %174, align 8, !alias.scope !20
  %175 = getelementptr double, double* %173, i64 2
  %176 = bitcast double* %175 to <2 x double>*
  %wide.load136.1 = load <2 x double>, <2 x double>* %176, align 8, !alias.scope !20
  %177 = fadd <2 x double> %wide.load133.1, %wide.load135.1
  %178 = fadd <2 x double> %wide.load134.1, %wide.load136.1
  %179 = bitcast double* %169 to <2 x double>*
  store <2 x double> %177, <2 x double>* %179, align 8, !alias.scope !17, !noalias !20
  %180 = bitcast double* %171 to <2 x double>*
  store <2 x double> %178, <2 x double>* %180, align 8, !alias.scope !17, !noalias !20
  %index.next126.1 = add i64 %index125, 8
  %181 = icmp eq i64 %index.next126.1, %n.vec107
  br i1 %181, label %middle.block101.unr-lcssa, label %vector.body100.vector.body100_crit_edge, !llvm.loop !22

vector.body100.vector.body100_crit_edge:          ; preds = %vector.body100
  br label %vector.body100

middle.block101.unr-lcssa:                        ; preds = %vector.body100
  br label %middle.block101

middle.block101:                                  ; preds = %vector.body100.prol.loopexit.middle.block101_crit_edge, %middle.block101.unr-lcssa
  %cmp.n128 = icmp eq i64 %136, %n.vec107
  br i1 %cmp.n128, label %middle.block101..preheader7_crit_edge, label %middle.block101.._crit_edge69.preheader_crit_edge

middle.block101.._crit_edge69.preheader_crit_edge: ; preds = %middle.block101
  br label %._crit_edge69.preheader

middle.block101..preheader7_crit_edge:            ; preds = %middle.block101
  br label %.preheader7

.preheader7.loopexit:                             ; preds = %._crit_edge69
  br label %.preheader7

.preheader7:                                      ; preds = %middle.block101..preheader7_crit_edge, %.preheader10..preheader7_crit_edge, %.preheader7.loopexit
  %.pr68 = load i32, i32* %13, align 4
  store i32 0, i32* %25, align 4
  %182 = icmp sgt i32 %.pr68, 0
  br i1 %182, label %.preheader.lr.ph, label %.preheader7..preheader7._crit_edge_crit_edge

.preheader7..preheader7._crit_edge_crit_edge:     ; preds = %.preheader7
  br label %.preheader7._crit_edge

.preheader.lr.ph:                                 ; preds = %.preheader7
  %183 = load i32, i32* %13, align 4
  %184 = icmp sgt i32 %183, 0
  %185 = load double*, double** %21, align 8
  %186 = load double, double* %14, align 8
  %187 = load [2000 x double]*, [2000 x double]** %16, align 8
  %188 = load double*, double** %22, align 8
  %.promoted13 = load i32, i32* %25, align 4
  br i1 %184, label %.preheader.us.preheader, label %._crit_edge12.loopexit35

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %189 = sext i32 %.promoted13 to i64
  %190 = sext i32 %183 to i64
  %191 = and i32 %183, 1
  %lcmp.mod = icmp eq i32 %191, 0
  %192 = icmp eq i32 %183, 1
  %wide.trip.count.1 = zext i32 %183 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv44 = phi i64 [ %189, %.preheader.us.preheader ], [ %indvars.iv.next45, %._crit_edge.us..preheader.us_crit_edge ]
  %193 = getelementptr inbounds double, double* %185, i64 %indvars.iv44
  %194 = getelementptr inbounds double, double* %185, i64 %indvars.iv44
  br i1 %lcmp.mod, label %.preheader.us..prol.loopexit_crit_edge, label %.prol.preheader

.preheader.us..prol.loopexit_crit_edge:           ; preds = %.preheader.us
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.preheader.us
  %195 = load double, double* %193, align 8
  %196 = getelementptr inbounds [2000 x double], [2000 x double]* %187, i64 %indvars.iv44, i64 0
  %197 = load double, double* %196, align 8
  %198 = fmul double %186, %197
  %199 = load double, double* %188, align 8
  %200 = fmul double %198, %199
  %201 = fadd double %195, %200
  store double %201, double* %194, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us..prol.loopexit_crit_edge, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us..prol.loopexit_crit_edge ]
  br i1 %192, label %.prol.loopexit.._crit_edge.us_crit_edge, label %.preheader.us.new.preheader

.prol.loopexit.._crit_edge.us_crit_edge:          ; preds = %.prol.loopexit
  br label %._crit_edge.us

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new..preheader.us.new_crit_edge, %.preheader.us.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new..preheader.us.new_crit_edge ], [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ]
  %202 = load double, double* %193, align 8
  %203 = getelementptr inbounds [2000 x double], [2000 x double]* %187, i64 %indvars.iv44, i64 %indvars.iv
  %204 = load double, double* %203, align 8
  %205 = fmul double %186, %204
  %206 = getelementptr inbounds double, double* %188, i64 %indvars.iv
  %207 = load double, double* %206, align 8
  %208 = fmul double %205, %207
  %209 = fadd double %202, %208
  store double %209, double* %194, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %210 = getelementptr inbounds [2000 x double], [2000 x double]* %187, i64 %indvars.iv44, i64 %indvars.iv.next
  %211 = load double, double* %210, align 8
  %212 = fmul double %186, %211
  %213 = getelementptr inbounds double, double* %188, i64 %indvars.iv.next
  %214 = load double, double* %213, align 8
  %215 = fmul double %212, %214
  %216 = fadd double %209, %215
  store double %216, double* %194, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader.us.new..preheader.us.new_crit_edge

.preheader.us.new..preheader.us.new_crit_edge:    ; preds = %.preheader.us.new
  br label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.prol.loopexit.._crit_edge.us_crit_edge, %._crit_edge.us.loopexit
  %indvars.iv.next45 = add nsw i64 %indvars.iv44, 1
  %217 = icmp slt i64 %indvars.iv.next45, %190
  br i1 %217, label %._crit_edge.us..preheader.us_crit_edge, label %._crit_edge12.loopexit

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge69:                                    ; preds = %._crit_edge69.._crit_edge69_crit_edge, %._crit_edge69.preheader
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %._crit_edge69.._crit_edge69_crit_edge ], [ %indvars.iv46.ph, %._crit_edge69.preheader ]
  %218 = getelementptr inbounds double, double* %129, i64 %indvars.iv46
  %219 = load double, double* %218, align 8
  %220 = getelementptr inbounds double, double* %130, i64 %indvars.iv46
  %221 = load double, double* %220, align 8
  %222 = fadd double %219, %221
  %223 = getelementptr inbounds double, double* %129, i64 %indvars.iv46
  store double %222, double* %223, align 8
  %indvars.iv.next47 = add nsw i64 %indvars.iv46, 1
  %224 = icmp slt i64 %indvars.iv.next47, %133
  br i1 %224, label %._crit_edge69.._crit_edge69_crit_edge, label %.preheader7.loopexit, !llvm.loop !23

._crit_edge69.._crit_edge69_crit_edge:            ; preds = %._crit_edge69
  br label %._crit_edge69

._crit_edge12.loopexit:                           ; preds = %._crit_edge.us
  %225 = trunc i64 %indvars.iv.next45 to i32
  br label %._crit_edge12

._crit_edge12.loopexit35:                         ; preds = %.preheader.lr.ph
  %226 = add i32 %.promoted13, 1
  %227 = icmp sgt i32 %183, %226
  %smax = select i1 %227, i32 %183, i32 %226
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit35, %._crit_edge12.loopexit
  %.lcssa14 = phi i32 [ %225, %._crit_edge12.loopexit ], [ %smax, %._crit_edge12.loopexit35 ]
  store i32 %.lcssa14, i32* %25, align 4
  br label %.preheader7._crit_edge

.preheader7._crit_edge:                           ; preds = %.preheader7..preheader7._crit_edge_crit_edge, %.preheader7.thread, %._crit_edge12
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
  br i1 %11, label %.lr.ph, label %.._crit_edge1_crit_edge

.._crit_edge1_crit_edge:                          ; preds = %2
  br label %._crit_edge1

.lr.ph:                                           ; preds = %2
  %12 = load double*, double** %4, align 8
  %13 = load i32, i32* %3, align 4
  %.promoted = load i32, i32* %5, align 4
  %14 = sext i32 %.promoted to i64
  %15 = sext i32 %13 to i64
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge2.._crit_edge3_crit_edge, %.lr.ph
  %indvars.iv = phi i64 [ %14, %.lr.ph ], [ %indvars.iv.next, %._crit_edge2.._crit_edge3_crit_edge ]
  %16 = trunc i64 %indvars.iv to i32
  %17 = srem i32 %16, 20
  %18 = icmp eq i32 %17, 0
  br i1 %18, label %19, label %._crit_edge3.._crit_edge2_crit_edge

._crit_edge3.._crit_edge2_crit_edge:              ; preds = %._crit_edge3
  br label %._crit_edge2

; <label>:19:                                     ; preds = %._crit_edge3
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %20) #5
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge3.._crit_edge2_crit_edge, %19
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = getelementptr inbounds double, double* %12, i64 %indvars.iv
  %23 = load double, double* %22, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %23) #6
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %25 = icmp slt i64 %indvars.iv.next, %15
  br i1 %25, label %._crit_edge2.._crit_edge3_crit_edge, label %._crit_edge

._crit_edge2.._crit_edge3_crit_edge:              ; preds = %._crit_edge2
  br label %._crit_edge3

._crit_edge:                                      ; preds = %._crit_edge2
  %26 = trunc i64 %indvars.iv.next to i32
  store i32 %26, i32* %5, align 4
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %.._crit_edge1_crit_edge, %._crit_edge
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
