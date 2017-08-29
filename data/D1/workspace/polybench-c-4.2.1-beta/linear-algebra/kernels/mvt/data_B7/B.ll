; ModuleID = 'A.ll'
source_filename = "mvt.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"x1\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [3 x i8] c"x2\00", align 1
@.str.8 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i32, align 4
  %6 = alloca [2000 x [2000 x double]]*, align 8
  %7 = alloca [2000 x double]*, align 8
  %8 = alloca [2000 x double]*, align 8
  %9 = alloca [2000 x double]*, align 8
  %10 = alloca [2000 x double]*, align 8
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  store i32 2000, i32* %5, align 4
  %11 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %12 = bitcast [2000 x [2000 x double]]** %6 to i8**
  store i8* %11, i8** %12, align 8
  %13 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %14 = bitcast [2000 x double]** %7 to i8**
  store i8* %13, i8** %14, align 8
  %15 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %16 = bitcast [2000 x double]** %8 to i8**
  store i8* %15, i8** %16, align 8
  %17 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %18 = bitcast [2000 x double]** %9 to i8**
  store i8* %17, i8** %18, align 8
  %19 = tail call i8* @polybench_alloc_data(i64 2000, i32 8) #4
  %20 = bitcast [2000 x double]** %10 to i8**
  store i8* %19, i8** %20, align 8
  %21 = load i32, i32* %5, align 4
  %22 = load [2000 x double]*, [2000 x double]** %7, align 8
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %22, i64 0, i64 0
  %24 = load [2000 x double]*, [2000 x double]** %8, align 8
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %24, i64 0, i64 0
  %26 = load [2000 x double]*, [2000 x double]** %9, align 8
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %26, i64 0, i64 0
  %28 = bitcast i8* %19 to double*
  %29 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %6, align 8
  %30 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %29, i64 0, i64 0
  tail call fastcc void @init_array(i32 %21, double* %23, double* %25, double* %27, double* %28, [2000 x double]* %30)
  tail call void (...) @polybench_timer_start() #4
  %31 = load i32, i32* %5, align 4
  %32 = load [2000 x double]*, [2000 x double]** %7, align 8
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %32, i64 0, i64 0
  %34 = load [2000 x double]*, [2000 x double]** %8, align 8
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %34, i64 0, i64 0
  %36 = load [2000 x double]*, [2000 x double]** %9, align 8
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %36, i64 0, i64 0
  %38 = load [2000 x double]*, [2000 x double]** %10, align 8
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %38, i64 0, i64 0
  %40 = load [2000 x [2000 x double]]*, [2000 x [2000 x double]]** %6, align 8
  %41 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 0
  tail call fastcc void @kernel_mvt(i32 %31, double* %33, double* %35, double* %37, double* %39, [2000 x double]* %41)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %42 = load i32, i32* %3, align 4
  %43 = icmp sgt i32 %42, 42
  br i1 %43, label %44, label %54

; <label>:44:                                     ; preds = %2
  %45 = load i8**, i8*** %4, align 8
  %46 = load i8*, i8** %45, align 8
  %strcmpload = load i8, i8* %46, align 1
  %47 = icmp eq i8 %strcmpload, 0
  br i1 %47, label %48, label %54

; <label>:48:                                     ; preds = %44
  %49 = load i32, i32* %5, align 4
  %50 = load [2000 x double]*, [2000 x double]** %7, align 8
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %50, i64 0, i64 0
  %52 = load [2000 x double]*, [2000 x double]** %8, align 8
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %52, i64 0, i64 0
  tail call fastcc void @print_array(i32 %49, double* %51, double* %53)
  br label %54

; <label>:54:                                     ; preds = %44, %48, %2
  %55 = bitcast [2000 x [2000 x double]]** %6 to i8**
  %56 = load i8*, i8** %55, align 8
  tail call void @free(i8* %56) #4
  %57 = bitcast [2000 x double]** %7 to i8**
  %58 = load i8*, i8** %57, align 8
  tail call void @free(i8* %58) #4
  %59 = bitcast [2000 x double]** %8 to i8**
  %60 = load i8*, i8** %59, align 8
  tail call void @free(i8* %60) #4
  %61 = bitcast [2000 x double]** %9 to i8**
  %62 = load i8*, i8** %61, align 8
  tail call void @free(i8* %62) #4
  %63 = bitcast [2000 x double]** %10 to i8**
  %64 = load i8*, i8** %63, align 8
  tail call void @free(i8* %64) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, double*, double*, double*, double*, [2000 x double]*) unnamed_addr #2 {
  %7 = alloca i32, align 4
  %8 = alloca double*, align 8
  %9 = alloca double*, align 8
  %10 = alloca double*, align 8
  %11 = alloca double*, align 8
  %12 = alloca [2000 x double]*, align 8
  %13 = alloca i32, align 4
  store i32 %0, i32* %7, align 4
  store double* %1, double** %8, align 8
  store double* %2, double** %9, align 8
  store double* %3, double** %10, align 8
  store double* %4, double** %11, align 8
  store [2000 x double]* %5, [2000 x double]** %12, align 8
  store i32 0, i32* %13, align 4
  %14 = load i32, i32* %7, align 4
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %.lr.ph6, label %99

.lr.ph6:                                          ; preds = %6
  %16 = load double*, double** %8, align 8
  %17 = load i32, i32* %7, align 4
  %18 = sitofp i32 %17 to double
  %19 = load double*, double** %9, align 8
  %20 = sitofp i32 %17 to double
  %21 = load double*, double** %10, align 8
  %22 = sitofp i32 %17 to double
  %23 = load double*, double** %11, align 8
  %24 = load i32, i32* %7, align 4
  %25 = icmp sgt i32 %24, 0
  %26 = load [2000 x double]*, [2000 x double]** %12, align 8
  %.promoted = load i32, i32* %13, align 4
  %27 = sext i32 %.promoted to i64
  %28 = sext i32 %24 to i64
  br i1 %25, label %.lr.ph6.split.us.preheader, label %.lr.ph6.split.preheader

.lr.ph6.split.preheader:                          ; preds = %.lr.ph6
  br label %.lr.ph6.split

.lr.ph6.split.us.preheader:                       ; preds = %.lr.ph6
  %29 = sitofp i32 %24 to double
  %wide.trip.count = zext i32 %24 to i64
  %xtraiter = and i64 %wide.trip.count, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %30 = icmp eq i32 %24, 1
  %31 = fdiv double 0.000000e+00, %29
  br label %.lr.ph6.split.us

.lr.ph6.split.us:                                 ; preds = %.lr.ph6.split.us.preheader, %._crit_edge.us
  %indvars.iv13 = phi i64 [ %27, %.lr.ph6.split.us.preheader ], [ %indvars.iv.next14, %._crit_edge.us ]
  %32 = phi i32 [ %14, %.lr.ph6.split.us.preheader ], [ %24, %._crit_edge.us ]
  %storemerge4.us = phi i32 [ 0, %.lr.ph6.split.us.preheader ], [ %72, %._crit_edge.us ]
  %33 = srem i32 %storemerge4.us, %32
  %34 = sitofp i32 %33 to double
  %35 = sitofp i32 %32 to double
  %36 = fdiv double %34, %35
  %37 = sext i32 %storemerge4.us to i64
  %38 = getelementptr inbounds double, double* %16, i64 %37
  store double %36, double* %38, align 8
  %indvars.iv.next14 = add nsw i64 %indvars.iv13, 1
  %39 = trunc i64 %indvars.iv.next14 to i32
  %40 = srem i32 %39, %17
  %41 = sitofp i32 %40 to double
  %42 = fdiv double %41, %18
  %43 = getelementptr inbounds double, double* %19, i64 %indvars.iv13
  store double %42, double* %43, align 8
  %44 = add nsw i64 %indvars.iv13, 3
  %45 = trunc i64 %44 to i32
  %46 = srem i32 %45, %17
  %47 = sitofp i32 %46 to double
  %48 = fdiv double %47, %20
  %49 = getelementptr inbounds double, double* %21, i64 %indvars.iv13
  store double %48, double* %49, align 8
  %50 = add nsw i64 %indvars.iv13, 4
  %51 = trunc i64 %50 to i32
  %52 = srem i32 %51, %17
  %53 = sitofp i32 %52 to double
  %54 = fdiv double %53, %22
  %55 = getelementptr inbounds double, double* %23, i64 %indvars.iv13
  store double %54, double* %55, align 8
  br i1 %lcmp.mod, label %.prol.loopexit.unr-lcssa, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph6.split.us
  br label %56

; <label>:56:                                     ; preds = %.prol.preheader
  %57 = getelementptr inbounds [2000 x double], [2000 x double]* %26, i64 %indvars.iv13, i64 0
  store double %31, double* %57, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph6.split.us, %56
  %indvars.iv.unr.ph = phi i64 [ 1, %56 ], [ 0, %.lr.ph6.split.us ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %30, label %._crit_edge.us, label %.lr.ph6.split.us.new

.lr.ph6.split.us.new:                             ; preds = %.prol.loopexit
  br label %58

; <label>:58:                                     ; preds = %58, %.lr.ph6.split.us.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph6.split.us.new ], [ %indvars.iv.next.1, %58 ]
  %59 = mul nsw i64 %indvars.iv13, %indvars.iv
  %60 = trunc i64 %59 to i32
  %61 = srem i32 %60, %24
  %62 = sitofp i32 %61 to double
  %63 = fdiv double %62, %29
  %64 = getelementptr inbounds [2000 x double], [2000 x double]* %26, i64 %indvars.iv13, i64 %indvars.iv
  store double %63, double* %64, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %65 = mul nsw i64 %indvars.iv13, %indvars.iv.next
  %66 = trunc i64 %65 to i32
  %67 = srem i32 %66, %24
  %68 = sitofp i32 %67 to double
  %69 = fdiv double %68, %29
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %26, i64 %indvars.iv13, i64 %indvars.iv.next
  store double %69, double* %70, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %._crit_edge.us.unr-lcssa, label %58

._crit_edge.us.unr-lcssa:                         ; preds = %58
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.prol.loopexit, %._crit_edge.us.unr-lcssa
  %71 = icmp slt i64 %indvars.iv.next14, %28
  %72 = trunc i64 %indvars.iv.next14 to i32
  br i1 %71, label %.lr.ph6.split.us, label %._crit_edge7.loopexit

.lr.ph6.split:                                    ; preds = %.lr.ph6.split.preheader, %.lr.ph6.split
  %indvars.iv15 = phi i64 [ %indvars.iv.next16, %.lr.ph6.split ], [ %27, %.lr.ph6.split.preheader ]
  %73 = phi i32 [ %24, %.lr.ph6.split ], [ %14, %.lr.ph6.split.preheader ]
  %storemerge4 = phi i32 [ %98, %.lr.ph6.split ], [ 0, %.lr.ph6.split.preheader ]
  %74 = srem i32 %storemerge4, %73
  %75 = sitofp i32 %74 to double
  %76 = sitofp i32 %73 to double
  %77 = fdiv double %75, %76
  %78 = sext i32 %storemerge4 to i64
  %79 = getelementptr inbounds double, double* %16, i64 %78
  store double %77, double* %79, align 8
  %indvars.iv.next16 = add nsw i64 %indvars.iv15, 1
  %80 = trunc i64 %indvars.iv.next16 to i32
  %81 = srem i32 %80, %17
  %82 = sitofp i32 %81 to double
  %83 = fdiv double %82, %18
  %84 = getelementptr inbounds double, double* %19, i64 %indvars.iv15
  store double %83, double* %84, align 8
  %85 = add nsw i64 %indvars.iv15, 3
  %86 = trunc i64 %85 to i32
  %87 = srem i32 %86, %17
  %88 = sitofp i32 %87 to double
  %89 = fdiv double %88, %20
  %90 = getelementptr inbounds double, double* %21, i64 %indvars.iv15
  store double %89, double* %90, align 8
  %91 = add nsw i64 %indvars.iv15, 4
  %92 = trunc i64 %91 to i32
  %93 = srem i32 %92, %17
  %94 = sitofp i32 %93 to double
  %95 = fdiv double %94, %22
  %96 = getelementptr inbounds double, double* %23, i64 %indvars.iv15
  store double %95, double* %96, align 8
  %97 = icmp slt i64 %indvars.iv.next16, %28
  %98 = trunc i64 %indvars.iv.next16 to i32
  br i1 %97, label %.lr.ph6.split, label %._crit_edge7.loopexit19

._crit_edge7.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge7

._crit_edge7.loopexit19:                          ; preds = %.lr.ph6.split
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit19, %._crit_edge7.loopexit
  %.lcssa10.in = phi i64 [ %indvars.iv.next14, %._crit_edge7.loopexit ], [ %indvars.iv.next16, %._crit_edge7.loopexit19 ]
  %.lcssa10 = trunc i64 %.lcssa10.in to i32
  store i32 %.lcssa10, i32* %13, align 4
  br label %99

; <label>:99:                                     ; preds = %._crit_edge7, %6
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_mvt(i32, double*, double*, double*, double*, [2000 x double]*) unnamed_addr #2 {
  %7 = alloca i32, align 4
  %8 = alloca double*, align 8
  %9 = alloca double*, align 8
  %10 = alloca double*, align 8
  %11 = alloca double*, align 8
  %12 = alloca [2000 x double]*, align 8
  %13 = alloca i32, align 4
  store i32 %0, i32* %7, align 4
  store double* %1, double** %8, align 8
  store double* %2, double** %9, align 8
  store double* %3, double** %10, align 8
  store double* %4, double** %11, align 8
  store [2000 x double]* %5, [2000 x double]** %12, align 8
  store i32 0, i32* %13, align 4
  %14 = load i32, i32* %7, align 4
  %15 = icmp sgt i32 %14, 0
  br i1 %15, label %.preheader5.lr.ph, label %.preheader4.thread

.preheader4.thread:                               ; preds = %6
  store i32 0, i32* %13, align 4
  br label %78

.preheader5.lr.ph:                                ; preds = %6
  %16 = load i32, i32* %7, align 4
  %17 = icmp sgt i32 %16, 0
  %18 = load double*, double** %8, align 8
  %19 = load [2000 x double]*, [2000 x double]** %12, align 8
  %20 = load double*, double** %10, align 8
  br i1 %17, label %.preheader5.us.preheader, label %.preheader4

.preheader5.us.preheader:                         ; preds = %.preheader5.lr.ph
  %.promoted16 = load i32, i32* %13, align 4
  %21 = sext i32 %.promoted16 to i64
  %22 = sext i32 %16 to i64
  %xtraiter32 = and i32 %16, 1
  %lcmp.mod33 = icmp eq i32 %xtraiter32, 0
  %23 = icmp eq i32 %16, 1
  %wide.trip.count29.1 = zext i32 %16 to i64
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %.preheader5.us.preheader, %._crit_edge14.us
  %indvars.iv36 = phi i64 [ %21, %.preheader5.us.preheader ], [ %indvars.iv.next37, %._crit_edge14.us ]
  %24 = getelementptr inbounds double, double* %18, i64 %indvars.iv36
  br i1 %lcmp.mod33, label %.prol.loopexit31, label %.prol.preheader30

.prol.preheader30:                                ; preds = %.preheader5.us
  %25 = load double, double* %24, align 8
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %19, i64 %indvars.iv36, i64 0
  %27 = load double, double* %26, align 8
  %28 = load double, double* %20, align 8
  %29 = fmul double %27, %28
  %30 = fadd double %25, %29
  store double %30, double* %24, align 8
  br label %.prol.loopexit31

.prol.loopexit31:                                 ; preds = %.prol.preheader30, %.preheader5.us
  %indvars.iv27.unr.ph = phi i64 [ 1, %.prol.preheader30 ], [ 0, %.preheader5.us ]
  br i1 %23, label %._crit_edge14.us, label %.preheader5.us.new.preheader

.preheader5.us.new.preheader:                     ; preds = %.prol.loopexit31
  br label %.preheader5.us.new

.preheader5.us.new:                               ; preds = %.preheader5.us.new.preheader, %.preheader5.us.new
  %indvars.iv27 = phi i64 [ %indvars.iv.next28.1, %.preheader5.us.new ], [ %indvars.iv27.unr.ph, %.preheader5.us.new.preheader ]
  %31 = load double, double* %24, align 8
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %19, i64 %indvars.iv36, i64 %indvars.iv27
  %33 = load double, double* %32, align 8
  %34 = getelementptr inbounds double, double* %20, i64 %indvars.iv27
  %35 = load double, double* %34, align 8
  %36 = fmul double %33, %35
  %37 = fadd double %31, %36
  store double %37, double* %24, align 8
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %19, i64 %indvars.iv36, i64 %indvars.iv.next28
  %39 = load double, double* %38, align 8
  %40 = getelementptr inbounds double, double* %20, i64 %indvars.iv.next28
  %41 = load double, double* %40, align 8
  %42 = fmul double %39, %41
  %43 = fadd double %37, %42
  store double %43, double* %24, align 8
  %indvars.iv.next28.1 = add nuw nsw i64 %indvars.iv27, 2
  %exitcond.135 = icmp eq i64 %indvars.iv.next28.1, %wide.trip.count29.1
  br i1 %exitcond.135, label %._crit_edge14.us.loopexit, label %.preheader5.us.new

._crit_edge14.us.loopexit:                        ; preds = %.preheader5.us.new
  br label %._crit_edge14.us

._crit_edge14.us:                                 ; preds = %._crit_edge14.us.loopexit, %.prol.loopexit31
  %indvars.iv.next37 = add nsw i64 %indvars.iv36, 1
  %44 = icmp slt i64 %indvars.iv.next37, %22
  br i1 %44, label %.preheader5.us, label %.preheader4.loopexit

.preheader4.loopexit:                             ; preds = %._crit_edge14.us
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.loopexit, %.preheader5.lr.ph
  %.pr = load i32, i32* %7, align 4
  store i32 0, i32* %13, align 4
  %45 = icmp sgt i32 %.pr, 0
  br i1 %45, label %.preheader.lr.ph, label %78

.preheader.lr.ph:                                 ; preds = %.preheader4
  %46 = load i32, i32* %7, align 4
  %47 = icmp sgt i32 %46, 0
  %48 = load double*, double** %9, align 8
  %49 = load [2000 x double]*, [2000 x double]** %12, align 8
  %50 = load double*, double** %11, align 8
  %.promoted8 = load i32, i32* %13, align 4
  br i1 %47, label %.preheader.us.preheader, label %._crit_edge7.loopexit20

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %51 = sext i32 %.promoted8 to i64
  %52 = sext i32 %46 to i64
  %xtraiter = and i32 %46, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %53 = icmp eq i32 %46, 1
  %wide.trip.count.1 = zext i32 %46 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv25 = phi i64 [ %51, %.preheader.us.preheader ], [ %indvars.iv.next26, %._crit_edge.us ]
  %54 = getelementptr inbounds double, double* %48, i64 %indvars.iv25
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  %55 = load double, double* %54, align 8
  %56 = getelementptr inbounds [2000 x double], [2000 x double]* %49, i64 0, i64 %indvars.iv25
  %57 = load double, double* %56, align 8
  %58 = load double, double* %50, align 8
  %59 = fmul double %57, %58
  %60 = fadd double %55, %59
  store double %60, double* %54, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us ]
  br i1 %53, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ]
  %61 = load double, double* %54, align 8
  %62 = getelementptr inbounds [2000 x double], [2000 x double]* %49, i64 %indvars.iv, i64 %indvars.iv25
  %63 = load double, double* %62, align 8
  %64 = getelementptr inbounds double, double* %50, i64 %indvars.iv
  %65 = load double, double* %64, align 8
  %66 = fmul double %63, %65
  %67 = fadd double %61, %66
  store double %67, double* %54, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %49, i64 %indvars.iv.next, i64 %indvars.iv25
  %69 = load double, double* %68, align 8
  %70 = getelementptr inbounds double, double* %50, i64 %indvars.iv.next
  %71 = load double, double* %70, align 8
  %72 = fmul double %69, %71
  %73 = fadd double %67, %72
  store double %73, double* %54, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next26 = add nsw i64 %indvars.iv25, 1
  %74 = icmp slt i64 %indvars.iv.next26, %52
  br i1 %74, label %.preheader.us, label %._crit_edge7.loopexit

._crit_edge7.loopexit:                            ; preds = %._crit_edge.us
  %75 = trunc i64 %indvars.iv.next26 to i32
  br label %._crit_edge7

._crit_edge7.loopexit20:                          ; preds = %.preheader.lr.ph
  %76 = add i32 %.promoted8, 1
  %77 = icmp sgt i32 %46, %76
  %smax = select i1 %77, i32 %46, i32 %76
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit20, %._crit_edge7.loopexit
  %.lcssa9 = phi i32 [ %75, %._crit_edge7.loopexit ], [ %smax, %._crit_edge7.loopexit20 ]
  store i32 %.lcssa9, i32* %13, align 4
  br label %78

; <label>:78:                                     ; preds = %.preheader4.thread, %._crit_edge7, %.preheader4
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double*, double*) unnamed_addr #0 {
  %4 = alloca i32, align 4
  %5 = alloca double*, align 8
  %6 = alloca double*, align 8
  %7 = alloca i32, align 4
  store i32 %0, i32* %4, align 4
  store double* %1, double** %5, align 8
  store double* %2, double** %6, align 8
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %8) #5
  %10 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %11 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %10, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  store i32 0, i32* %7, align 4
  %12 = load i32, i32* %4, align 4
  %13 = icmp sgt i32 %12, 0
  br i1 %13, label %.lr.ph8, label %31

.lr.ph8:                                          ; preds = %3
  %14 = load double*, double** %5, align 8
  %15 = load i32, i32* %4, align 4
  %.promoted10 = load i32, i32* %7, align 4
  %16 = sext i32 %.promoted10 to i64
  %17 = sext i32 %15 to i64
  br label %18

; <label>:18:                                     ; preds = %.lr.ph8, %23
  %indvars.iv13 = phi i64 [ %16, %.lr.ph8 ], [ %indvars.iv.next14, %23 ]
  %storemerge6 = phi i32 [ 0, %.lr.ph8 ], [ %29, %23 ]
  %19 = srem i32 %storemerge6, 20
  %20 = icmp eq i32 %19, 0
  br i1 %20, label %21, label %23

; <label>:21:                                     ; preds = %18
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc4 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %22) #5
  br label %23

; <label>:23:                                     ; preds = %18, %21
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = getelementptr inbounds double, double* %14, i64 %indvars.iv13
  %26 = load double, double* %25, align 8
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %26) #5
  %indvars.iv.next14 = add nsw i64 %indvars.iv13, 1
  %28 = icmp slt i64 %indvars.iv.next14, %17
  %29 = trunc i64 %indvars.iv.next14 to i32
  br i1 %28, label %18, label %._crit_edge9

._crit_edge9:                                     ; preds = %23
  %30 = trunc i64 %indvars.iv.next14 to i32
  store i32 %30, i32* %7, align 4
  br label %31

; <label>:31:                                     ; preds = %._crit_edge9, %3
  %32 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %33 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %32, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %35 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %34, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #5
  store i32 0, i32* %7, align 4
  %36 = load i32, i32* %4, align 4
  %37 = icmp sgt i32 %36, 0
  br i1 %37, label %.lr.ph, label %55

.lr.ph:                                           ; preds = %31
  %38 = load double*, double** %6, align 8
  %39 = load i32, i32* %4, align 4
  %.promoted = load i32, i32* %7, align 4
  %40 = sext i32 %.promoted to i64
  %41 = sext i32 %39 to i64
  br label %42

; <label>:42:                                     ; preds = %.lr.ph, %47
  %indvars.iv = phi i64 [ %40, %.lr.ph ], [ %indvars.iv.next, %47 ]
  %storemerge15 = phi i32 [ 0, %.lr.ph ], [ %53, %47 ]
  %43 = srem i32 %storemerge15, 20
  %44 = icmp eq i32 %43, 0
  br i1 %44, label %45, label %47

; <label>:45:                                     ; preds = %42
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %46) #5
  br label %47

; <label>:47:                                     ; preds = %42, %45
  %48 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %49 = getelementptr inbounds double, double* %38, i64 %indvars.iv
  %50 = load double, double* %49, align 8
  %51 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %48, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %50) #5
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %52 = icmp slt i64 %indvars.iv.next, %41
  %53 = trunc i64 %indvars.iv.next to i32
  br i1 %52, label %42, label %._crit_edge

._crit_edge:                                      ; preds = %47
  %54 = trunc i64 %indvars.iv.next to i32
  store i32 %54, i32* %7, align 4
  br label %55

; <label>:55:                                     ; preds = %._crit_edge, %31
  %56 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %57 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %56, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.7, i64 0, i64 0)) #5
  %58 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %59 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.8, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %58) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
