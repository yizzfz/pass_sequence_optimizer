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
  %52 = bitcast i8* %33 to double*
  call fastcc void @init_array(i32 %35, double* nonnull %6, double* nonnull %7, [2000 x double]* %37, double* %39, double* %41, double* %43, double* %45, double* %47, double* %49, double* %51, double* %52)
  call void (...) @polybench_timer_start() #4
  %53 = load i32, i32* %5, align 4
  %54 = load double, double* %6, align 8
  %55 = load double, double* %7, align 8
  %56 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %8, align 8
  %57 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %56, i64 0, i64 0
  %58 = load [2000 x double]*, [2000 x double]** %9, align 8
  %59 = getelementptr inbounds [2000 x double], [2000 x double]* %58, i64 0, i64 0
  %60 = load [2000 x double]*, [2000 x double]** %10, align 8
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %60, i64 0, i64 0
  %62 = load [2000 x double]*, [2000 x double]** %11, align 8
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %62, i64 0, i64 0
  %64 = load [2000 x double]*, [2000 x double]** %12, align 8
  %65 = getelementptr inbounds [2000 x double], [2000 x double]* %64, i64 0, i64 0
  %66 = load [2000 x double]*, [2000 x double]** %13, align 8
  %67 = getelementptr inbounds [2000 x double], [2000 x double]* %66, i64 0, i64 0
  %68 = load [2000 x double]*, [2000 x double]** %14, align 8
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %68, i64 0, i64 0
  %70 = load [2000 x double]*, [2000 x double]** %15, align 8
  %71 = getelementptr inbounds [2000 x double], [2000 x double]* %70, i64 0, i64 0
  %72 = load [2000 x double]*, [2000 x double]** %16, align 8
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %72, i64 0, i64 0
  call fastcc void @kernel_gemver(i32 %53, double %54, double %55, [2000 x double]* %57, double* %59, double* %61, double* %63, double* %65, double* %67, double* %69, double* %71, double* %73)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %74 = load i32, i32* %3, align 4
  %75 = icmp sgt i32 %74, 42
  br i1 %75, label %76, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:76:                                     ; preds = %2
  %77 = load i8**, i8*** %4, align 8
  %78 = load i8*, i8** %77, align 8
  %strcmpload = load i8, i8* %78, align 1
  %79 = icmp eq i8 %strcmpload, 0
  br i1 %79, label %80, label %.._crit_edge_crit_edge2

.._crit_edge_crit_edge2:                          ; preds = %76
  br label %._crit_edge

; <label>:80:                                     ; preds = %76
  %81 = load i32, i32* %5, align 4
  %82 = load [2000 x double]*, [2000 x double]** %13, align 8
  %83 = getelementptr inbounds [2000 x double], [2000 x double]* %82, i64 0, i64 0
  call fastcc void @print_array(i32 %81, double* %83)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge2, %.._crit_edge_crit_edge, %80
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
  br i1 %31, label %.lr.ph6, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %12
  br label %._crit_edge

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
  %wide.trip.count = zext i32 %41 to i64
  %xtraiter = and i64 %wide.trip.count, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %51 = icmp eq i32 %41, 1
  %52 = fdiv double 0.000000e+00, %50
  br label %.lr.ph6.split.us

.lr.ph6.split.us:                                 ; preds = %._crit_edge.us..lr.ph6.split.us_crit_edge, %.lr.ph6.split.us.preheader
  %indvars.iv13 = phi i64 [ %44, %.lr.ph6.split.us.preheader ], [ %indvars.iv.next14, %._crit_edge.us..lr.ph6.split.us_crit_edge ]
  %storemerge4.us = phi i32 [ 0, %.lr.ph6.split.us.preheader ], [ %101, %._crit_edge.us..lr.ph6.split.us_crit_edge ]
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
  br i1 %lcmp.mod, label %.lr.ph6.split.us.._crit_edge21.prol.loopexit.unr-lcssa_crit_edge, label %._crit_edge21.prol.preheader

.lr.ph6.split.us.._crit_edge21.prol.loopexit.unr-lcssa_crit_edge: ; preds = %.lr.ph6.split.us
  br label %._crit_edge21.prol.loopexit.unr-lcssa

._crit_edge21.prol.preheader:                     ; preds = %.lr.ph6.split.us
  br label %._crit_edge21.prol

._crit_edge21.prol:                               ; preds = %._crit_edge21.prol.preheader
  %87 = getelementptr inbounds [2000 x double], [2000 x double]* %43, i64 %indvars.iv13, i64 0
  store double %52, double* %87, align 8
  br label %._crit_edge21.prol.loopexit.unr-lcssa

._crit_edge21.prol.loopexit.unr-lcssa:            ; preds = %.lr.ph6.split.us.._crit_edge21.prol.loopexit.unr-lcssa_crit_edge, %._crit_edge21.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge21.prol ], [ 0, %.lr.ph6.split.us.._crit_edge21.prol.loopexit.unr-lcssa_crit_edge ]
  br label %._crit_edge21.prol.loopexit

._crit_edge21.prol.loopexit:                      ; preds = %._crit_edge21.prol.loopexit.unr-lcssa
  br i1 %51, label %._crit_edge21.prol.loopexit.._crit_edge.us_crit_edge, label %.lr.ph6.split.us.new

._crit_edge21.prol.loopexit.._crit_edge.us_crit_edge: ; preds = %._crit_edge21.prol.loopexit
  br label %._crit_edge.us

.lr.ph6.split.us.new:                             ; preds = %._crit_edge21.prol.loopexit
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21.._crit_edge21_crit_edge, %.lr.ph6.split.us.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph6.split.us.new ], [ %indvars.iv.next.1, %._crit_edge21.._crit_edge21_crit_edge ]
  %88 = mul nsw i64 %indvars.iv13, %indvars.iv
  %89 = trunc i64 %88 to i32
  %90 = srem i32 %89, %41
  %91 = sitofp i32 %90 to double
  %92 = fdiv double %91, %50
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %43, i64 %indvars.iv13, i64 %indvars.iv
  store double %92, double* %93, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %94 = mul nsw i64 %indvars.iv13, %indvars.iv.next
  %95 = trunc i64 %94 to i32
  %96 = srem i32 %95, %41
  %97 = sitofp i32 %96 to double
  %98 = fdiv double %97, %50
  %99 = getelementptr inbounds [2000 x double], [2000 x double]* %43, i64 %indvars.iv13, i64 %indvars.iv.next
  store double %98, double* %99, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %._crit_edge.us.unr-lcssa, label %._crit_edge21.._crit_edge21_crit_edge

._crit_edge21.._crit_edge21_crit_edge:            ; preds = %._crit_edge21
  br label %._crit_edge21

._crit_edge.us.unr-lcssa:                         ; preds = %._crit_edge21
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge21.prol.loopexit.._crit_edge.us_crit_edge, %._crit_edge.us.unr-lcssa
  %100 = icmp slt i64 %indvars.iv.next14, %45
  %101 = trunc i64 %indvars.iv.next14 to i32
  br i1 %100, label %._crit_edge.us..lr.ph6.split.us_crit_edge, label %._crit_edge7.loopexit

._crit_edge.us..lr.ph6.split.us_crit_edge:        ; preds = %._crit_edge.us
  br label %.lr.ph6.split.us

.lr.ph6.split:                                    ; preds = %.lr.ph6.split..lr.ph6.split_crit_edge, %.lr.ph6.split.preheader
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %.lr.ph6.split..lr.ph6.split_crit_edge ], [ %44, %.lr.ph6.split.preheader ]
  %storemerge4 = phi i32 [ %137, %.lr.ph6.split..lr.ph6.split_crit_edge ], [ 0, %.lr.ph6.split.preheader ]
  %102 = sitofp i32 %storemerge4 to double
  %103 = sext i32 %storemerge4 to i64
  %104 = getelementptr inbounds double, double* %32, i64 %103
  store double %102, double* %104, align 8
  %indvars.iv.next16 = add nsw i64 %indvars.iv15, 1
  %105 = trunc i64 %indvars.iv.next16 to i32
  %106 = sitofp i32 %105 to double
  %107 = getelementptr inbounds double, double* %34, i64 %indvars.iv15
  %108 = trunc i64 %indvars.iv.next16 to i32
  %109 = sitofp i32 %108 to double
  %110 = insertelement <2 x double> undef, double %106, i32 0
  %111 = insertelement <2 x double> %110, double %109, i32 1
  %112 = fdiv <2 x double> %111, %47
  %113 = fmul <2 x double> %112, <double 5.000000e-01, double 2.500000e-01>
  %114 = extractelement <2 x double> %113, i32 0
  %115 = extractelement <2 x double> %113, i32 1
  store double %114, double* %107, align 8
  %116 = getelementptr inbounds double, double* %35, i64 %indvars.iv15
  store double %115, double* %116, align 8
  %117 = trunc i64 %indvars.iv.next16 to i32
  %118 = sitofp i32 %117 to double
  %119 = getelementptr inbounds double, double* %36, i64 %indvars.iv15
  %120 = trunc i64 %indvars.iv.next16 to i32
  %121 = sitofp i32 %120 to double
  %122 = fdiv double %121, %33
  %123 = fmul double %122, 1.250000e-01
  %124 = getelementptr inbounds double, double* %37, i64 %indvars.iv15
  store double %123, double* %124, align 8
  %125 = trunc i64 %indvars.iv.next16 to i32
  %126 = sitofp i32 %125 to double
  %127 = insertelement <2 x double> undef, double %118, i32 0
  %128 = insertelement <2 x double> %127, double %126, i32 1
  %129 = fdiv <2 x double> %128, %49
  %130 = fdiv <2 x double> %129, <double 6.000000e+00, double 9.000000e+00>
  %131 = extractelement <2 x double> %130, i32 0
  %132 = extractelement <2 x double> %130, i32 1
  store double %131, double* %119, align 8
  %133 = getelementptr inbounds double, double* %38, i64 %indvars.iv15
  store double %132, double* %133, align 8
  %134 = getelementptr inbounds double, double* %39, i64 %indvars.iv15
  store double 0.000000e+00, double* %134, align 8
  %135 = getelementptr inbounds double, double* %40, i64 %indvars.iv15
  store double 0.000000e+00, double* %135, align 8
  %136 = icmp slt i64 %indvars.iv.next16, %45
  %137 = trunc i64 %indvars.iv.next16 to i32
  br i1 %136, label %.lr.ph6.split..lr.ph6.split_crit_edge, label %._crit_edge7.loopexit23

.lr.ph6.split..lr.ph6.split_crit_edge:            ; preds = %.lr.ph6.split
  br label %.lr.ph6.split

._crit_edge7.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge7

._crit_edge7.loopexit23:                          ; preds = %.lr.ph6.split
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit23, %._crit_edge7.loopexit
  %.lcssa10.in = phi i64 [ %indvars.iv.next14, %._crit_edge7.loopexit ], [ %indvars.iv.next16, %._crit_edge7.loopexit23 ]
  %.lcssa10 = trunc i64 %.lcssa10.in to i32
  store i32 %.lcssa10, i32* %25, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %._crit_edge7
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
  %.promoted35 = load i32, i32* %25, align 4
  %35 = load i32, i32* %13, align 4
  %36 = sext i32 %35 to i64
  %37 = sext i32 %.promoted35 to i64
  %38 = sext i32 %28 to i64
  %39 = icmp sgt i64 %36, 1
  %smax73 = select i1 %39, i64 %36, i64 1
  %40 = icmp sgt i64 %36, 1
  %smax75 = select i1 %40, i64 %36, i64 1
  %scevgep78 = getelementptr double, double* %32, i64 %smax75
  %scevgep80 = getelementptr double, double* %34, i64 %smax75
  %min.iters.check = icmp ult i64 %smax73, 4
  %n.vec = and i64 %smax73, 9223372036854775804
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %smax73, %n.vec
  br label %.preheader11.us

.preheader11.us:                                  ; preds = %._crit_edge32.us..preheader11.us_crit_edge, %.preheader11.us.preheader
  %indvar = phi i64 [ %indvar.next, %._crit_edge32.us..preheader11.us_crit_edge ], [ 0, %.preheader11.us.preheader ]
  %indvars.iv61 = phi i64 [ %indvars.iv.next62, %._crit_edge32.us..preheader11.us_crit_edge ], [ %37, %.preheader11.us.preheader ]
  %41 = add i64 %37, %indvar
  %scevgep = getelementptr [2000 x double], [2000 x double]* %30, i64 %41, i64 0
  %scevgep76 = getelementptr [2000 x double], [2000 x double]* %30, i64 %41, i64 %smax75
  %42 = getelementptr inbounds double, double* %31, i64 %indvars.iv61
  %43 = getelementptr inbounds double, double* %33, i64 %indvars.iv61
  br i1 %min.iters.check, label %.preheader11.us.._crit_edge.preheader_crit_edge, label %min.iters.checked

.preheader11.us.._crit_edge.preheader_crit_edge:  ; preds = %.preheader11.us
  br label %._crit_edge.preheader

min.iters.checked:                                ; preds = %.preheader11.us
  br i1 %cmp.zero, label %min.iters.checked.._crit_edge.preheader_crit_edge, label %vector.memcheck

min.iters.checked.._crit_edge.preheader_crit_edge: ; preds = %min.iters.checked
  br label %._crit_edge.preheader

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult double* %scevgep, %42
  %bound1 = icmp ult double* %42, %scevgep76
  %found.conflict = and i1 %bound0, %bound1
  %bound083 = icmp ult double* %scevgep, %scevgep78
  %bound184 = icmp ult double* %32, %scevgep76
  %found.conflict85 = and i1 %bound083, %bound184
  %conflict.rdx = or i1 %found.conflict, %found.conflict85
  %bound088 = icmp ult double* %scevgep, %43
  %bound189 = icmp ult double* %43, %scevgep76
  %found.conflict90 = and i1 %bound088, %bound189
  %conflict.rdx91 = or i1 %conflict.rdx, %found.conflict90
  %bound092 = icmp ult double* %scevgep, %scevgep80
  %bound193 = icmp ult double* %34, %scevgep76
  %found.conflict94 = and i1 %bound092, %bound193
  %conflict.rdx95 = or i1 %conflict.rdx91, %found.conflict94
  br i1 %conflict.rdx95, label %vector.memcheck.._crit_edge.preheader_crit_edge, label %vector.body.preheader

vector.memcheck.._crit_edge.preheader_crit_edge:  ; preds = %vector.memcheck
  br label %._crit_edge.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %30, i64 %indvars.iv61, i64 %index
  %45 = bitcast double* %44 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %45, align 8, !alias.scope !1, !noalias !4
  %46 = getelementptr double, double* %44, i64 2
  %47 = bitcast double* %46 to <2 x double>*
  %wide.load97 = load <2 x double>, <2 x double>* %47, align 8, !alias.scope !1, !noalias !4
  %48 = load double, double* %42, align 8, !alias.scope !9
  %49 = insertelement <2 x double> undef, double %48, i32 0
  %50 = shufflevector <2 x double> %49, <2 x double> undef, <2 x i32> zeroinitializer
  %51 = insertelement <2 x double> undef, double %48, i32 0
  %52 = shufflevector <2 x double> %51, <2 x double> undef, <2 x i32> zeroinitializer
  %53 = getelementptr inbounds double, double* %32, i64 %index
  %54 = bitcast double* %53 to <2 x double>*
  %wide.load98 = load <2 x double>, <2 x double>* %54, align 8, !alias.scope !10
  %55 = getelementptr double, double* %53, i64 2
  %56 = bitcast double* %55 to <2 x double>*
  %wide.load99 = load <2 x double>, <2 x double>* %56, align 8, !alias.scope !10
  %57 = fmul <2 x double> %50, %wide.load98
  %58 = fmul <2 x double> %52, %wide.load99
  %59 = fadd <2 x double> %wide.load, %57
  %60 = fadd <2 x double> %wide.load97, %58
  %61 = load double, double* %43, align 8, !alias.scope !11
  %62 = insertelement <2 x double> undef, double %61, i32 0
  %63 = shufflevector <2 x double> %62, <2 x double> undef, <2 x i32> zeroinitializer
  %64 = insertelement <2 x double> undef, double %61, i32 0
  %65 = shufflevector <2 x double> %64, <2 x double> undef, <2 x i32> zeroinitializer
  %66 = getelementptr inbounds double, double* %34, i64 %index
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load100 = load <2 x double>, <2 x double>* %67, align 8, !alias.scope !12
  %68 = getelementptr double, double* %66, i64 2
  %69 = bitcast double* %68 to <2 x double>*
  %wide.load101 = load <2 x double>, <2 x double>* %69, align 8, !alias.scope !12
  %70 = fmul <2 x double> %63, %wide.load100
  %71 = fmul <2 x double> %65, %wide.load101
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
  br i1 %cmp.n, label %middle.block.._crit_edge32.us_crit_edge, label %middle.block.._crit_edge.preheader_crit_edge

middle.block.._crit_edge.preheader_crit_edge:     ; preds = %middle.block
  br label %._crit_edge.preheader

middle.block.._crit_edge32.us_crit_edge:          ; preds = %middle.block
  br label %._crit_edge32.us

._crit_edge.preheader:                            ; preds = %middle.block.._crit_edge.preheader_crit_edge, %vector.memcheck.._crit_edge.preheader_crit_edge, %min.iters.checked.._crit_edge.preheader_crit_edge, %.preheader11.us.._crit_edge.preheader_crit_edge
  %indvars.iv59.ph = phi i64 [ 0, %vector.memcheck.._crit_edge.preheader_crit_edge ], [ 0, %min.iters.checked.._crit_edge.preheader_crit_edge ], [ 0, %.preheader11.us.._crit_edge.preheader_crit_edge ], [ %n.vec, %middle.block.._crit_edge.preheader_crit_edge ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.._crit_edge_crit_edge, %._crit_edge.preheader
  %indvars.iv59 = phi i64 [ %indvars.iv.next60, %._crit_edge.._crit_edge_crit_edge ], [ %indvars.iv59.ph, %._crit_edge.preheader ]
  %77 = getelementptr inbounds [2000 x double], [2000 x double]* %30, i64 %indvars.iv61, i64 %indvars.iv59
  %78 = load double, double* %77, align 8
  %79 = load double, double* %42, align 8
  %80 = getelementptr inbounds double, double* %32, i64 %indvars.iv59
  %81 = load double, double* %80, align 8
  %82 = fmul double %79, %81
  %83 = fadd double %78, %82
  %84 = load double, double* %43, align 8
  %85 = getelementptr inbounds double, double* %34, i64 %indvars.iv59
  %86 = load double, double* %85, align 8
  %87 = fmul double %84, %86
  %88 = fadd double %83, %87
  store double %88, double* %77, align 8
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %89 = icmp slt i64 %indvars.iv.next60, %36
  br i1 %89, label %._crit_edge.._crit_edge_crit_edge, label %._crit_edge32.us.loopexit, !llvm.loop !16

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge
  br label %._crit_edge

._crit_edge32.us.loopexit:                        ; preds = %._crit_edge
  br label %._crit_edge32.us

._crit_edge32.us:                                 ; preds = %middle.block.._crit_edge32.us_crit_edge, %._crit_edge32.us.loopexit
  %indvars.iv.next62 = add nsw i64 %indvars.iv61, 1
  %90 = icmp slt i64 %indvars.iv.next62, %38
  %indvar.next = add i64 %indvar, 1
  br i1 %90, label %._crit_edge32.us..preheader11.us_crit_edge, label %.preheader10.loopexit

._crit_edge32.us..preheader11.us_crit_edge:       ; preds = %._crit_edge32.us
  br label %.preheader11.us

.preheader10.loopexit:                            ; preds = %._crit_edge32.us
  br label %.preheader10

.preheader10:                                     ; preds = %.preheader11.lr.ph..preheader10_crit_edge, %.preheader10.loopexit
  %.pr = load i32, i32* %13, align 4
  store i32 0, i32* %25, align 4
  %91 = icmp sgt i32 %.pr, 0
  br i1 %91, label %.preheader9.lr.ph, label %.preheader10..preheader7_crit_edge

.preheader10..preheader7_crit_edge:               ; preds = %.preheader10
  br label %.preheader7

.preheader9.lr.ph:                                ; preds = %.preheader10
  %92 = load i32, i32* %13, align 4
  %93 = icmp sgt i32 %92, 0
  %94 = load double*, double** %22, align 8
  %95 = load double, double* %15, align 8
  %96 = load [2000 x double]*, [2000 x double]** %16, align 8
  %97 = load double*, double** %23, align 8
  br i1 %93, label %.preheader9.us.preheader, label %.preheader9.lr.ph..preheader8_crit_edge

.preheader9.lr.ph..preheader8_crit_edge:          ; preds = %.preheader9.lr.ph
  br label %.preheader8

.preheader9.us.preheader:                         ; preds = %.preheader9.lr.ph
  %.promoted26 = load i32, i32* %25, align 4
  %98 = sext i32 %.promoted26 to i64
  %99 = sext i32 %92 to i64
  %100 = and i32 %92, 1
  %lcmp.mod68 = icmp eq i32 %100, 0
  %101 = icmp eq i32 %92, 1
  %wide.trip.count53.1 = zext i32 %92 to i64
  br label %.preheader9.us

.preheader9.us:                                   ; preds = %._crit_edge23.us..preheader9.us_crit_edge, %.preheader9.us.preheader
  %indvars.iv55 = phi i64 [ %98, %.preheader9.us.preheader ], [ %indvars.iv.next56, %._crit_edge23.us..preheader9.us_crit_edge ]
  %102 = getelementptr inbounds double, double* %94, i64 %indvars.iv55
  br i1 %lcmp.mod68, label %.preheader9.us..prol.loopexit66_crit_edge, label %.prol.preheader65

.preheader9.us..prol.loopexit66_crit_edge:        ; preds = %.preheader9.us
  br label %.prol.loopexit66

.prol.preheader65:                                ; preds = %.preheader9.us
  %103 = load double, double* %102, align 8
  %104 = getelementptr inbounds [2000 x double], [2000 x double]* %96, i64 0, i64 %indvars.iv55
  %105 = load double, double* %104, align 8
  %106 = fmul double %95, %105
  %107 = load double, double* %97, align 8
  %108 = fmul double %106, %107
  %109 = fadd double %103, %108
  store double %109, double* %102, align 8
  br label %.prol.loopexit66

.prol.loopexit66:                                 ; preds = %.preheader9.us..prol.loopexit66_crit_edge, %.prol.preheader65
  %indvars.iv51.unr.ph = phi i64 [ 1, %.prol.preheader65 ], [ 0, %.preheader9.us..prol.loopexit66_crit_edge ]
  br i1 %101, label %.prol.loopexit66.._crit_edge23.us_crit_edge, label %.preheader9.us.new.preheader

.prol.loopexit66.._crit_edge23.us_crit_edge:      ; preds = %.prol.loopexit66
  br label %._crit_edge23.us

.preheader9.us.new.preheader:                     ; preds = %.prol.loopexit66
  br label %.preheader9.us.new

.preheader9.us.new:                               ; preds = %.preheader9.us.new..preheader9.us.new_crit_edge, %.preheader9.us.new.preheader
  %indvars.iv51 = phi i64 [ %indvars.iv.next52.1, %.preheader9.us.new..preheader9.us.new_crit_edge ], [ %indvars.iv51.unr.ph, %.preheader9.us.new.preheader ]
  %110 = load double, double* %102, align 8
  %111 = getelementptr inbounds [2000 x double], [2000 x double]* %96, i64 %indvars.iv51, i64 %indvars.iv55
  %112 = load double, double* %111, align 8
  %113 = fmul double %95, %112
  %114 = getelementptr inbounds double, double* %97, i64 %indvars.iv51
  %115 = load double, double* %114, align 8
  %116 = fmul double %113, %115
  %117 = fadd double %110, %116
  store double %117, double* %102, align 8
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %118 = getelementptr inbounds [2000 x double], [2000 x double]* %96, i64 %indvars.iv.next52, i64 %indvars.iv55
  %119 = load double, double* %118, align 8
  %120 = fmul double %95, %119
  %121 = getelementptr inbounds double, double* %97, i64 %indvars.iv.next52
  %122 = load double, double* %121, align 8
  %123 = fmul double %120, %122
  %124 = fadd double %117, %123
  store double %124, double* %102, align 8
  %indvars.iv.next52.1 = add nsw i64 %indvars.iv51, 2
  %exitcond54.1 = icmp eq i64 %indvars.iv.next52.1, %wide.trip.count53.1
  br i1 %exitcond54.1, label %._crit_edge23.us.loopexit, label %.preheader9.us.new..preheader9.us.new_crit_edge

.preheader9.us.new..preheader9.us.new_crit_edge:  ; preds = %.preheader9.us.new
  br label %.preheader9.us.new

._crit_edge23.us.loopexit:                        ; preds = %.preheader9.us.new
  br label %._crit_edge23.us

._crit_edge23.us:                                 ; preds = %.prol.loopexit66.._crit_edge23.us_crit_edge, %._crit_edge23.us.loopexit
  %indvars.iv.next56 = add nsw i64 %indvars.iv55, 1
  %125 = icmp slt i64 %indvars.iv.next56, %99
  br i1 %125, label %._crit_edge23.us..preheader9.us_crit_edge, label %.preheader8.loopexit

._crit_edge23.us..preheader9.us_crit_edge:        ; preds = %._crit_edge23.us
  br label %.preheader9.us

.preheader8.loopexit:                             ; preds = %._crit_edge23.us
  br label %.preheader8

.preheader8:                                      ; preds = %.preheader9.lr.ph..preheader8_crit_edge, %..preheader8_crit_edge, %.preheader8.loopexit
  %.pr69 = load i32, i32* %13, align 4
  store i32 0, i32* %25, align 4
  %126 = icmp sgt i32 %.pr69, 0
  br i1 %126, label %.lr.ph19, label %.preheader7.thread

.preheader7.thread:                               ; preds = %.preheader8
  store i32 0, i32* %25, align 4
  br label %.preheader7._crit_edge

.lr.ph19:                                         ; preds = %.preheader8
  %127 = load double*, double** %22, align 8
  %128 = load double*, double** %24, align 8
  %129 = load i32, i32* %13, align 4
  %.promoted = load i32, i32* %25, align 4
  br label %._crit_edge71

.preheader7.loopexit:                             ; preds = %._crit_edge71
  br label %.preheader7

.preheader7:                                      ; preds = %.preheader10..preheader7_crit_edge, %.preheader7.loopexit
  %.pr70 = load i32, i32* %13, align 4
  store i32 0, i32* %25, align 4
  %130 = icmp sgt i32 %.pr70, 0
  br i1 %130, label %.preheader.lr.ph, label %.preheader7..preheader7._crit_edge_crit_edge

.preheader7..preheader7._crit_edge_crit_edge:     ; preds = %.preheader7
  br label %.preheader7._crit_edge

.preheader.lr.ph:                                 ; preds = %.preheader7
  %131 = load i32, i32* %13, align 4
  %132 = icmp sgt i32 %131, 0
  %133 = load double*, double** %21, align 8
  %134 = load double, double* %14, align 8
  %135 = load [2000 x double]*, [2000 x double]** %16, align 8
  %136 = load double*, double** %22, align 8
  %.promoted14 = load i32, i32* %25, align 4
  br i1 %132, label %.preheader.us.preheader, label %._crit_edge13.loopexit39

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %137 = sext i32 %.promoted14 to i64
  %138 = sext i32 %131 to i64
  %139 = and i32 %131, 1
  %lcmp.mod = icmp eq i32 %139, 0
  %140 = icmp eq i32 %131, 1
  %wide.trip.count.1 = zext i32 %131 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us..preheader.us_crit_edge, %.preheader.us.preheader
  %indvars.iv48 = phi i64 [ %137, %.preheader.us.preheader ], [ %indvars.iv.next49, %._crit_edge.us..preheader.us_crit_edge ]
  %141 = getelementptr inbounds double, double* %133, i64 %indvars.iv48
  br i1 %lcmp.mod, label %.preheader.us..prol.loopexit_crit_edge, label %.prol.preheader

.preheader.us..prol.loopexit_crit_edge:           ; preds = %.preheader.us
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.preheader.us
  %142 = load double, double* %141, align 8
  %143 = getelementptr inbounds [2000 x double], [2000 x double]* %135, i64 %indvars.iv48, i64 0
  %144 = load double, double* %143, align 8
  %145 = fmul double %134, %144
  %146 = load double, double* %136, align 8
  %147 = fmul double %145, %146
  %148 = fadd double %142, %147
  store double %148, double* %141, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us..prol.loopexit_crit_edge, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us..prol.loopexit_crit_edge ]
  br i1 %140, label %.prol.loopexit.._crit_edge.us_crit_edge, label %.preheader.us.new.preheader

.prol.loopexit.._crit_edge.us_crit_edge:          ; preds = %.prol.loopexit
  br label %._crit_edge.us

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new..preheader.us.new_crit_edge, %.preheader.us.new.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new..preheader.us.new_crit_edge ], [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ]
  %149 = load double, double* %141, align 8
  %150 = getelementptr inbounds [2000 x double], [2000 x double]* %135, i64 %indvars.iv48, i64 %indvars.iv
  %151 = load double, double* %150, align 8
  %152 = fmul double %134, %151
  %153 = getelementptr inbounds double, double* %136, i64 %indvars.iv
  %154 = load double, double* %153, align 8
  %155 = fmul double %152, %154
  %156 = fadd double %149, %155
  store double %156, double* %141, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %157 = getelementptr inbounds [2000 x double], [2000 x double]* %135, i64 %indvars.iv48, i64 %indvars.iv.next
  %158 = load double, double* %157, align 8
  %159 = fmul double %134, %158
  %160 = getelementptr inbounds double, double* %136, i64 %indvars.iv.next
  %161 = load double, double* %160, align 8
  %162 = fmul double %159, %161
  %163 = fadd double %156, %162
  store double %163, double* %141, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader.us.new..preheader.us.new_crit_edge

.preheader.us.new..preheader.us.new_crit_edge:    ; preds = %.preheader.us.new
  br label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.prol.loopexit.._crit_edge.us_crit_edge, %._crit_edge.us.loopexit
  %indvars.iv.next49 = add nsw i64 %indvars.iv48, 1
  %164 = icmp slt i64 %indvars.iv.next49, %138
  br i1 %164, label %._crit_edge.us..preheader.us_crit_edge, label %._crit_edge13.loopexit

._crit_edge.us..preheader.us_crit_edge:           ; preds = %._crit_edge.us
  br label %.preheader.us

._crit_edge71:                                    ; preds = %._crit_edge71.._crit_edge71_crit_edge, %.lr.ph19
  %165 = phi i32 [ %.promoted, %.lr.ph19 ], [ %172, %._crit_edge71.._crit_edge71_crit_edge ]
  %storemerge218 = phi i32 [ 0, %.lr.ph19 ], [ %172, %._crit_edge71.._crit_edge71_crit_edge ]
  %166 = sext i32 %storemerge218 to i64
  %167 = getelementptr inbounds double, double* %127, i64 %166
  %168 = load double, double* %167, align 8
  %169 = getelementptr inbounds double, double* %128, i64 %166
  %170 = load double, double* %169, align 8
  %171 = fadd double %168, %170
  store double %171, double* %167, align 8
  %172 = add nsw i32 %165, 1
  %173 = icmp slt i32 %172, %129
  br i1 %173, label %._crit_edge71.._crit_edge71_crit_edge, label %.preheader7.loopexit

._crit_edge71.._crit_edge71_crit_edge:            ; preds = %._crit_edge71
  br label %._crit_edge71

._crit_edge13.loopexit:                           ; preds = %._crit_edge.us
  %174 = trunc i64 %indvars.iv.next49 to i32
  br label %._crit_edge13

._crit_edge13.loopexit39:                         ; preds = %.preheader.lr.ph
  %175 = add i32 %.promoted14, 1
  %176 = icmp sgt i32 %131, %175
  %smax = select i1 %176, i32 %131, i32 %175
  br label %._crit_edge13

._crit_edge13:                                    ; preds = %._crit_edge13.loopexit39, %._crit_edge13.loopexit
  %.lcssa15 = phi i32 [ %174, %._crit_edge13.loopexit ], [ %smax, %._crit_edge13.loopexit39 ]
  store i32 %.lcssa15, i32* %25, align 4
  br label %.preheader7._crit_edge

.preheader7._crit_edge:                           ; preds = %.preheader7..preheader7._crit_edge_crit_edge, %.preheader7.thread, %._crit_edge13
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
  br i1 %11, label %.lr.ph, label %.._crit_edge2_crit_edge

.._crit_edge2_crit_edge:                          ; preds = %2
  br label %._crit_edge2

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
  br i1 %17, label %18, label %._crit_edge4.._crit_edge3_crit_edge

._crit_edge4.._crit_edge3_crit_edge:              ; preds = %._crit_edge4
  br label %._crit_edge3

; <label>:18:                                     ; preds = %._crit_edge4
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %19) #5
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge4.._crit_edge3_crit_edge, %18
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = getelementptr inbounds double, double* %12, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %22) #6
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %24 = icmp slt i64 %indvars.iv.next, %15
  %25 = trunc i64 %indvars.iv.next to i32
  br i1 %24, label %._crit_edge3.._crit_edge4_crit_edge, label %._crit_edge

._crit_edge3.._crit_edge4_crit_edge:              ; preds = %._crit_edge3
  br label %._crit_edge4

._crit_edge:                                      ; preds = %._crit_edge3
  %26 = trunc i64 %indvars.iv.next to i32
  store i32 %26, i32* %5, align 4
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %.._crit_edge2_crit_edge, %._crit_edge
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
