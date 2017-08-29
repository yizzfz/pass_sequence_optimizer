; ModuleID = 'A.ll'
source_filename = "atax.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca i32, align 4
  %4 = alloca i8**, align 8
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca [1900 x [2100 x double]]*, align 8
  %8 = alloca [2100 x double]*, align 8
  %9 = alloca [2100 x double]*, align 8
  %10 = alloca [1900 x double]*, align 8
  store i32 %0, i32* %3, align 4
  store i8** %1, i8*** %4, align 8
  store i32 1900, i32* %5, align 4
  store i32 2100, i32* %6, align 4
  %11 = tail call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %12 = bitcast [1900 x [2100 x double]]** %7 to i8**
  store i8* %11, i8** %12, align 8
  %13 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %14 = bitcast [2100 x double]** %8 to i8**
  store i8* %13, i8** %14, align 8
  %15 = tail call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %16 = bitcast [2100 x double]** %9 to i8**
  store i8* %15, i8** %16, align 8
  %17 = tail call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %18 = bitcast [1900 x double]** %10 to i8**
  store i8* %17, i8** %18, align 8
  %19 = load i32, i32* %5, align 4
  %20 = load i32, i32* %6, align 4
  %21 = bitcast [1900 x [2100 x double]]** %7 to [2100 x double]**
  %22 = load [2100 x double]*, [2100 x double]** %21, align 8
  %23 = bitcast [2100 x double]** %8 to double**
  %24 = load double*, double** %23, align 8
  tail call void @init_array(i32 %19, i32 %20, [2100 x double]* %22, double* %24)
  tail call void (...) @polybench_timer_start() #4
  %25 = load i32, i32* %5, align 4
  %26 = load i32, i32* %6, align 4
  %27 = bitcast [1900 x [2100 x double]]** %7 to [2100 x double]**
  %28 = load [2100 x double]*, [2100 x double]** %27, align 8
  %29 = bitcast [2100 x double]** %8 to double**
  %30 = load double*, double** %29, align 8
  %31 = bitcast [2100 x double]** %9 to double**
  %32 = load double*, double** %31, align 8
  %33 = bitcast [1900 x double]** %10 to double**
  %34 = load double*, double** %33, align 8
  tail call void @kernel_atax(i32 %25, i32 %26, [2100 x double]* %28, double* %30, double* %32, double* %34)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %35 = load i32, i32* %3, align 4
  %36 = icmp sgt i32 %35, 42
  br i1 %36, label %37, label %._crit_edge

; <label>:37:                                     ; preds = %2
  %38 = load i8**, i8*** %4, align 8
  %39 = load i8*, i8** %38, align 8
  %strcmpload = load i8, i8* %39, align 1
  %40 = icmp eq i8 %strcmpload, 0
  br i1 %40, label %41, label %._crit_edge

; <label>:41:                                     ; preds = %37
  %42 = load i32, i32* %6, align 4
  %43 = bitcast [2100 x double]** %9 to double**
  %44 = load double*, double** %43, align 8
  tail call void @print_array(i32 %42, double* %44)
  br label %._crit_edge

._crit_edge:                                      ; preds = %37, %2, %41
  %45 = bitcast [1900 x [2100 x double]]** %7 to i8**
  %46 = load i8*, i8** %45, align 8
  tail call void @free(i8* %46) #4
  %47 = bitcast [2100 x double]** %8 to i8**
  %48 = load i8*, i8** %47, align 8
  tail call void @free(i8* %48) #4
  %49 = bitcast [2100 x double]** %9 to i8**
  %50 = load i8*, i8** %49, align 8
  tail call void @free(i8* %50) #4
  %51 = bitcast [1900 x double]** %10 to i8**
  %52 = load i8*, i8** %51, align 8
  tail call void @free(i8* %52) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, [2100 x double]*, double*) #2 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca [2100 x double]*, align 8
  %8 = alloca double*, align 8
  %9 = alloca i32, align 4
  %10 = alloca double, align 8
  store i32 %0, i32* %5, align 4
  store i32 %1, i32* %6, align 4
  store [2100 x double]* %2, [2100 x double]** %7, align 8
  store double* %3, double** %8, align 8
  %11 = sitofp i32 %1 to double
  store double %11, double* %10, align 8
  store i32 0, i32* %9, align 4
  %12 = icmp sgt i32 %1, 0
  br i1 %12, label %.lr.ph5, label %._crit_edge

.lr.ph5:                                          ; preds = %4
  %13 = load double, double* %10, align 8
  %14 = load double*, double** %8, align 8
  %15 = load i32, i32* %6, align 4
  %.promoted11 = load i32, i32* %9, align 4
  br label %._crit_edge23

._crit_edge23:                                    ; preds = %._crit_edge23, %.lr.ph5
  %16 = phi i32 [ %.promoted11, %.lr.ph5 ], [ %23, %._crit_edge23 ]
  %17 = phi i32 [ 0, %.lr.ph5 ], [ %23, %._crit_edge23 ]
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, %13
  %20 = fadd double %19, 1.000000e+00
  %21 = sext i32 %17 to i64
  %22 = getelementptr inbounds double, double* %14, i64 %21
  store double %20, double* %22, align 8
  %23 = add nsw i32 %16, 1
  %24 = icmp slt i32 %23, %15
  br i1 %24, label %._crit_edge23, label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge23
  store i32 %23, i32* %9, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %4, %._crit_edge6
  store i32 0, i32* %9, align 4
  %25 = load i32, i32* %5, align 4
  %26 = icmp sgt i32 %25, 0
  br i1 %26, label %.lr.ph2, label %._crit_edge24

.lr.ph2:                                          ; preds = %._crit_edge
  %27 = load i32, i32* %6, align 4
  %wide.trip.count = zext i32 %27 to i64
  %28 = load i32, i32* %5, align 4
  %29 = sext i32 %28 to i64
  %30 = mul nsw i32 %28, 5
  %31 = sitofp i32 %30 to double
  %32 = load [2100 x double]*, [2100 x double]** %7, align 8
  %.promoted = load i32, i32* %9, align 4
  %33 = icmp sgt i32 %27, 0
  br i1 %33, label %.lr.ph2.split.us.preheader, label %._crit_edge3.loopexit13

.lr.ph2.split.us.preheader:                       ; preds = %.lr.ph2
  %34 = sext i32 %.promoted to i64
  %xtraiter = and i64 %wide.trip.count, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %35 = icmp eq i32 %27, 1
  br label %.lr.ph2.split.us

.lr.ph2.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph2.split.us.preheader
  %indvars.iv16 = phi i64 [ %34, %.lr.ph2.split.us.preheader ], [ %indvars.iv.next17, %._crit_edge.us ]
  br i1 %lcmp.mod, label %._crit_edge25.prol.loopexit.unr-lcssa, label %._crit_edge25.prol.preheader

._crit_edge25.prol.preheader:                     ; preds = %.lr.ph2.split.us
  br label %._crit_edge25.prol

._crit_edge25.prol:                               ; preds = %._crit_edge25.prol.preheader
  %36 = trunc i64 %indvars.iv16 to i32
  %37 = srem i32 %36, %27
  %38 = sitofp i32 %37 to double
  %39 = fdiv double %38, %31
  %40 = getelementptr inbounds [2100 x double], [2100 x double]* %32, i64 %indvars.iv16, i64 0
  store double %39, double* %40, align 8
  br label %._crit_edge25.prol.loopexit.unr-lcssa

._crit_edge25.prol.loopexit.unr-lcssa:            ; preds = %.lr.ph2.split.us, %._crit_edge25.prol
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge25.prol ], [ 0, %.lr.ph2.split.us ]
  br label %._crit_edge25.prol.loopexit

._crit_edge25.prol.loopexit:                      ; preds = %._crit_edge25.prol.loopexit.unr-lcssa
  br i1 %35, label %._crit_edge.us, label %.lr.ph2.split.us.new

.lr.ph2.split.us.new:                             ; preds = %._crit_edge25.prol.loopexit
  br label %._crit_edge25

._crit_edge25:                                    ; preds = %._crit_edge25, %.lr.ph2.split.us.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph2.split.us.new ], [ %indvars.iv.next.1, %._crit_edge25 ]
  %41 = add nsw i64 %indvars.iv16, %indvars.iv
  %42 = trunc i64 %41 to i32
  %43 = srem i32 %42, %27
  %44 = sitofp i32 %43 to double
  %45 = getelementptr inbounds [2100 x double], [2100 x double]* %32, i64 %indvars.iv16, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %46 = add nsw i64 %indvars.iv16, %indvars.iv.next
  %47 = trunc i64 %46 to i32
  %48 = srem i32 %47, %27
  %49 = sitofp i32 %48 to double
  %50 = insertelement <2 x double> undef, double %31, i32 0
  %51 = insertelement <2 x double> %50, double %31, i32 1
  %52 = insertelement <2 x double> undef, double %44, i32 0
  %53 = insertelement <2 x double> %52, double %49, i32 1
  %54 = fdiv <2 x double> %53, %51
  %55 = bitcast double* %45 to <2 x double>*
  store <2 x double> %54, <2 x double>* %55, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count
  br i1 %exitcond.1, label %._crit_edge.us.unr-lcssa, label %._crit_edge25

._crit_edge.us.unr-lcssa:                         ; preds = %._crit_edge25
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge25.prol.loopexit, %._crit_edge.us.unr-lcssa
  %indvars.iv.next17 = add nsw i64 %indvars.iv16, 1
  %56 = icmp slt i64 %indvars.iv.next17, %29
  br i1 %56, label %.lr.ph2.split.us, label %._crit_edge3.loopexit

._crit_edge3.loopexit:                            ; preds = %._crit_edge.us
  %57 = trunc i64 %indvars.iv.next17 to i32
  br label %._crit_edge3

._crit_edge3.loopexit13:                          ; preds = %.lr.ph2
  %58 = add i32 %.promoted, 1
  %59 = icmp sgt i32 %28, %58
  %smax = select i1 %59, i32 %28, i32 %58
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit13, %._crit_edge3.loopexit
  %.lcssa10 = phi i32 [ %57, %._crit_edge3.loopexit ], [ %smax, %._crit_edge3.loopexit13 ]
  store i32 %.lcssa10, i32* %9, align 4
  br label %._crit_edge24

._crit_edge24:                                    ; preds = %._crit_edge, %._crit_edge3
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_atax(i32, i32, [2100 x double]*, double*, double*, double*) #2 {
  %7 = alloca i32, align 4
  %8 = alloca i32, align 4
  %9 = alloca [2100 x double]*, align 8
  %10 = alloca double*, align 8
  %11 = alloca double*, align 8
  %12 = alloca double*, align 8
  %13 = alloca i32, align 4
  store i32 %0, i32* %7, align 4
  store i32 %1, i32* %8, align 4
  store [2100 x double]* %2, [2100 x double]** %9, align 8
  store double* %3, double** %10, align 8
  store double* %4, double** %11, align 8
  store double* %5, double** %12, align 8
  store i32 0, i32* %13, align 4
  %14 = icmp sgt i32 %1, 0
  br i1 %14, label %.lr.ph8, label %._crit_edge

.lr.ph8:                                          ; preds = %6
  %15 = load double*, double** %11, align 8
  %16 = load i32, i32* %8, align 4
  %.promoted = load i32, i32* %13, align 4
  br label %._crit_edge67

._crit_edge67:                                    ; preds = %._crit_edge67, %.lr.ph8
  %17 = phi i32 [ %.promoted, %.lr.ph8 ], [ %21, %._crit_edge67 ]
  %18 = phi i32 [ 0, %.lr.ph8 ], [ %21, %._crit_edge67 ]
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds double, double* %15, i64 %19
  store double 0.000000e+00, double* %20, align 8
  %21 = add nsw i32 %17, 1
  %22 = icmp slt i32 %21, %16
  br i1 %22, label %._crit_edge67, label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge67
  store i32 %21, i32* %13, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %._crit_edge9
  store i32 0, i32* %13, align 4
  %23 = load i32, i32* %7, align 4
  %24 = icmp sgt i32 %23, 0
  br i1 %24, label %.lr.ph5, label %._crit_edge68

.lr.ph5:                                          ; preds = %._crit_edge
  %25 = load double*, double** %12, align 8
  %26 = load i32, i32* %8, align 4
  %wide.trip.count30.1 = zext i32 %26 to i64
  %wide.trip.count.1 = zext i32 %26 to i64
  %27 = load [2100 x double]*, [2100 x double]** %9, align 8
  %28 = load double*, double** %10, align 8
  %29 = load double*, double** %11, align 8
  %30 = load i32, i32* %7, align 4
  %31 = sext i32 %30 to i64
  %.promoted12 = load i32, i32* %13, align 4
  %32 = icmp sgt i32 %26, 0
  br i1 %32, label %.lr.ph5.split.us.preheader, label %.lr.ph5.split.split.preheader

.lr.ph5.split.split.preheader:                    ; preds = %.lr.ph5
  br label %.lr.ph5.split.split

.lr.ph5.split.us.preheader:                       ; preds = %.lr.ph5
  %33 = sext i32 %.promoted12 to i64
  %34 = add i32 %26, -1
  %xtraiter = and i32 %26, 1
  %xtraiter33 = and i32 %26, 1
  %35 = icmp eq i32 %xtraiter, 0
  %36 = icmp eq i32 %34, 0
  %37 = ptrtoint double* %25 to i64
  %38 = icmp eq i32 %34, 0
  %sunkaddr61 = ptrtoint double* %25 to i64
  %sunkaddr = ptrtoint double* %25 to i64
  %39 = icmp eq i32 %xtraiter33, 0
  %40 = ptrtoint double* %25 to i64
  br label %.lr.ph5.split.us

.lr.ph5.split.us:                                 ; preds = %._crit_edge3.us, %.lr.ph5.split.us.preheader
  %indvars.iv37 = phi i64 [ %33, %.lr.ph5.split.us.preheader ], [ %indvars.iv.next38, %._crit_edge3.us ]
  %41 = phi i64 [ 0, %.lr.ph5.split.us.preheader ], [ %indvars.iv.next38, %._crit_edge3.us ]
  %sext = shl i64 %41, 32
  %42 = ashr exact i64 %sext, 32
  %43 = getelementptr inbounds double, double* %25, i64 %42
  store double 0.000000e+00, double* %43, align 8
  br i1 %35, label %.prol.loopexit, label %44

; <label>:44:                                     ; preds = %.lr.ph5.split.us
  %sunkaddr39 = shl i64 %indvars.iv37, 3
  %sunkaddr40 = add i64 %40, %sunkaddr39
  %sunkaddr41 = inttoptr i64 %sunkaddr40 to double*
  %45 = load double, double* %sunkaddr41, align 8
  %46 = getelementptr inbounds [2100 x double], [2100 x double]* %27, i64 %indvars.iv37, i64 0
  %47 = load double, double* %46, align 8
  %48 = load double, double* %28, align 8
  %49 = fmul double %47, %48
  %50 = fadd double %45, %49
  store double %50, double* %sunkaddr41, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph5.split.us, %44
  %indvars.iv.unr.ph = phi i64 [ 1, %44 ], [ 0, %.lr.ph5.split.us ]
  br i1 %36, label %.lr.ph2.us.thread, label %.lr.ph5.split.us.new.preheader

.lr.ph5.split.us.new.preheader:                   ; preds = %.prol.loopexit
  %sunkaddr58 = shl i64 %indvars.iv37, 3
  %sunkaddr59 = add i64 %sunkaddr, %sunkaddr58
  %sunkaddr60 = inttoptr i64 %sunkaddr59 to double*
  br label %.lr.ph5.split.us.new

.lr.ph5.split.us.new:                             ; preds = %.lr.ph5.split.us.new.preheader, %.lr.ph5.split.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph5.split.us.new ], [ %indvars.iv.unr.ph, %.lr.ph5.split.us.new.preheader ]
  %51 = load double, double* %sunkaddr60, align 8
  %52 = getelementptr inbounds [2100 x double], [2100 x double]* %27, i64 %indvars.iv37, i64 %indvars.iv
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds double, double* %28, i64 %indvars.iv
  %55 = load double, double* %54, align 8
  %56 = fmul double %53, %55
  %57 = fadd double %51, %56
  store double %57, double* %sunkaddr60, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %58 = getelementptr inbounds [2100 x double], [2100 x double]* %27, i64 %indvars.iv37, i64 %indvars.iv.next
  %59 = load double, double* %58, align 8
  %60 = getelementptr inbounds double, double* %28, i64 %indvars.iv.next
  %61 = load double, double* %60, align 8
  %62 = fmul double %59, %61
  %63 = fadd double %57, %62
  store double %63, double* %sunkaddr60, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %.lr.ph2.us, label %.lr.ph5.split.us.new

.lr.ph2.us:                                       ; preds = %.lr.ph5.split.us.new
  br i1 %39, label %.prol.loopexit32, label %.lr.ph2.us.thread

.lr.ph2.us.thread:                                ; preds = %.lr.ph2.us, %.prol.loopexit
  %64 = load double, double* %29, align 8
  %65 = getelementptr inbounds [2100 x double], [2100 x double]* %27, i64 %indvars.iv37, i64 0
  %66 = load double, double* %65, align 8
  %sunkaddr47 = shl i64 %indvars.iv37, 3
  %sunkaddr48 = add i64 %37, %sunkaddr47
  %sunkaddr49 = inttoptr i64 %sunkaddr48 to double*
  %67 = load double, double* %sunkaddr49, align 8
  %68 = fmul double %66, %67
  %69 = fadd double %64, %68
  store double %69, double* %29, align 8
  br label %.prol.loopexit32

.prol.loopexit32:                                 ; preds = %.lr.ph2.us, %.lr.ph2.us.thread
  %indvars.iv28.unr.ph = phi i64 [ 1, %.lr.ph2.us.thread ], [ 0, %.lr.ph2.us ]
  br i1 %38, label %._crit_edge3.us, label %.lr.ph2.us.new.preheader

.lr.ph2.us.new.preheader:                         ; preds = %.prol.loopexit32
  %sunkaddr62 = shl i64 %indvars.iv37, 3
  %sunkaddr63 = add i64 %sunkaddr61, %sunkaddr62
  %sunkaddr64 = inttoptr i64 %sunkaddr63 to double*
  br label %.lr.ph2.us.new

.lr.ph2.us.new:                                   ; preds = %.lr.ph2.us.new.preheader, %.lr.ph2.us.new
  %indvars.iv28 = phi i64 [ %indvars.iv.next29.1, %.lr.ph2.us.new ], [ %indvars.iv28.unr.ph, %.lr.ph2.us.new.preheader ]
  %70 = getelementptr inbounds double, double* %29, i64 %indvars.iv28
  %71 = load double, double* %70, align 8
  %72 = getelementptr inbounds [2100 x double], [2100 x double]* %27, i64 %indvars.iv37, i64 %indvars.iv28
  %73 = load double, double* %72, align 8
  %74 = load double, double* %sunkaddr64, align 8
  %75 = fmul double %73, %74
  %76 = fadd double %71, %75
  store double %76, double* %70, align 8
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %77 = getelementptr inbounds double, double* %29, i64 %indvars.iv.next29
  %78 = load double, double* %77, align 8
  %79 = getelementptr inbounds [2100 x double], [2100 x double]* %27, i64 %indvars.iv37, i64 %indvars.iv.next29
  %80 = load double, double* %79, align 8
  %81 = load double, double* %sunkaddr64, align 8
  %82 = fmul double %80, %81
  %83 = fadd double %78, %82
  store double %83, double* %77, align 8
  %indvars.iv.next29.1 = add nuw nsw i64 %indvars.iv28, 2
  %exitcond.136 = icmp eq i64 %indvars.iv.next29.1, %wide.trip.count30.1
  br i1 %exitcond.136, label %._crit_edge3.us.loopexit, label %.lr.ph2.us.new

._crit_edge3.us.loopexit:                         ; preds = %.lr.ph2.us.new
  br label %._crit_edge3.us

._crit_edge3.us:                                  ; preds = %._crit_edge3.us.loopexit, %.prol.loopexit32
  %indvars.iv.next38 = add nsw i64 %indvars.iv37, 1
  %84 = icmp slt i64 %indvars.iv.next38, %31
  br i1 %84, label %.lr.ph5.split.us, label %._crit_edge6.loopexit

.lr.ph5.split.split:                              ; preds = %.lr.ph5.split.split.preheader, %.lr.ph5.split.split
  %85 = phi i32 [ %89, %.lr.ph5.split.split ], [ %.promoted12, %.lr.ph5.split.split.preheader ]
  %86 = phi i32 [ %89, %.lr.ph5.split.split ], [ 0, %.lr.ph5.split.split.preheader ]
  %87 = sext i32 %86 to i64
  %88 = getelementptr inbounds double, double* %25, i64 %87
  store double 0.000000e+00, double* %88, align 8
  %89 = add nsw i32 %85, 1
  %90 = icmp slt i32 %89, %30
  br i1 %90, label %.lr.ph5.split.split, label %._crit_edge6.loopexit69

._crit_edge6.loopexit:                            ; preds = %._crit_edge3.us
  %91 = trunc i64 %indvars.iv.next38 to i32
  br label %._crit_edge6

._crit_edge6.loopexit69:                          ; preds = %.lr.ph5.split.split
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit69, %._crit_edge6.loopexit
  %.lcssa13 = phi i32 [ %91, %._crit_edge6.loopexit ], [ %89, %._crit_edge6.loopexit69 ]
  store i32 %.lcssa13, i32* %13, align 4
  br label %._crit_edge68

._crit_edge68:                                    ; preds = %._crit_edge, %._crit_edge6
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, double*) #0 {
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
  store i32 %26, i32* %5, align 4
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %2, %._crit_edge
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %29) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
