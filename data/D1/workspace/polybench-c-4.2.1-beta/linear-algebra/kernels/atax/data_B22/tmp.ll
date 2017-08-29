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
  %11 = call i8* @polybench_alloc_data(i64 3990000, i32 8) #4
  %12 = bitcast [1900 x [2100 x double]]** %7 to i8**
  store i8* %11, i8** %12, align 8
  %13 = call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %14 = bitcast [2100 x double]** %8 to i8**
  store i8* %13, i8** %14, align 8
  %15 = call i8* @polybench_alloc_data(i64 2100, i32 8) #4
  %16 = bitcast [2100 x double]** %9 to i8**
  store i8* %15, i8** %16, align 8
  %17 = call i8* @polybench_alloc_data(i64 1900, i32 8) #4
  %18 = bitcast [1900 x double]** %10 to i8**
  store i8* %17, i8** %18, align 8
  %19 = load i32, i32* %5, align 4
  %20 = load i32, i32* %6, align 4
  %21 = bitcast [1900 x [2100 x double]]** %7 to [2100 x double]**
  %22 = load [2100 x double]*, [2100 x double]** %21, align 8
  %23 = bitcast [2100 x double]** %8 to double**
  %24 = load double*, double** %23, align 8
  call void @init_array(i32 %19, i32 %20, [2100 x double]* %22, double* %24)
  call void (...) @polybench_timer_start() #4
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
  call void @kernel_atax(i32 %25, i32 %26, [2100 x double]* %28, double* %30, double* %32, double* %34)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
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
  call void @print_array(i32 %42, double* %44)
  br label %._crit_edge

._crit_edge:                                      ; preds = %37, %2, %41
  %45 = bitcast [1900 x [2100 x double]]** %7 to i8**
  %46 = load i8*, i8** %45, align 8
  call void @free(i8* %46) #4
  %47 = bitcast [2100 x double]** %8 to i8**
  %48 = load i8*, i8** %47, align 8
  call void @free(i8* %48) #4
  %49 = bitcast [2100 x double]** %9 to i8**
  %50 = load i8*, i8** %49, align 8
  call void @free(i8* %50) #4
  %51 = bitcast [1900 x double]** %10 to i8**
  %52 = load i8*, i8** %51, align 8
  call void @free(i8* %52) #4
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
  br i1 %12, label %.lr.ph7, label %._crit_edge

.lr.ph7:                                          ; preds = %4
  %13 = load double, double* %10, align 8
  %14 = load double*, double** %8, align 8
  %15 = load i32, i32* %6, align 4
  %.promoted13 = load i32, i32* %9, align 4
  %16 = sext i32 %.promoted13 to i64
  %17 = sext i32 %15 to i64
  br label %._crit_edge29

._crit_edge29:                                    ; preds = %._crit_edge29, %.lr.ph7
  %indvars.iv20 = phi i64 [ %16, %.lr.ph7 ], [ %indvars.iv.next21, %._crit_edge29 ]
  %18 = trunc i64 %indvars.iv20 to i32
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, %13
  %21 = fadd double %20, 1.000000e+00
  %22 = getelementptr inbounds double, double* %14, i64 %indvars.iv20
  store double %21, double* %22, align 8
  %indvars.iv.next21 = add nsw i64 %indvars.iv20, 1
  %23 = icmp slt i64 %indvars.iv.next21, %17
  br i1 %23, label %._crit_edge29, label %._crit_edge8

._crit_edge8:                                     ; preds = %._crit_edge29
  %24 = trunc i64 %indvars.iv.next21 to i32
  store i32 %24, i32* %9, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %4, %._crit_edge8
  store i32 0, i32* %9, align 4
  %25 = load i32, i32* %5, align 4
  %26 = icmp sgt i32 %25, 0
  br i1 %26, label %.lr.ph4, label %._crit_edge30

.lr.ph4:                                          ; preds = %._crit_edge
  %27 = load i32, i32* %6, align 4
  %wide.trip.count.1 = zext i32 %27 to i64
  %28 = icmp sgt i32 %27, 0
  %29 = load i32, i32* %5, align 4
  %30 = sext i32 %29 to i64
  %31 = mul nsw i32 %29, 5
  %32 = sitofp i32 %31 to double
  %33 = load [2100 x double]*, [2100 x double]** %7, align 8
  %.promoted = load i32, i32* %9, align 4
  br i1 %28, label %.lr.ph4.split.us.preheader, label %._crit_edge5.loopexit15

.lr.ph4.split.us.preheader:                       ; preds = %.lr.ph4
  %34 = sext i32 %.promoted to i64
  %xtraiter = and i32 %27, 1
  %35 = insertelement <2 x double> undef, double %32, i32 0
  %36 = shufflevector <2 x double> %35, <2 x double> undef, <2 x i32> zeroinitializer
  %37 = icmp eq i32 %xtraiter, 0
  %38 = icmp eq i32 %27, 1
  br label %.lr.ph4.split.us

.lr.ph4.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph4.split.us.preheader
  %indvars.iv18 = phi i64 [ %34, %.lr.ph4.split.us.preheader ], [ %indvars.iv.next19, %._crit_edge.us ]
  br i1 %37, label %.prol.loopexit, label %39

; <label>:39:                                     ; preds = %.lr.ph4.split.us
  %40 = trunc i64 %indvars.iv18 to i32
  %41 = srem i32 %40, %27
  %42 = sitofp i32 %41 to double
  %43 = fdiv double %42, %32
  %44 = getelementptr inbounds [2100 x double], [2100 x double]* %33, i64 %indvars.iv18, i64 0
  store double %43, double* %44, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph4.split.us, %39
  %indvars.iv.unr.ph = phi i64 [ 1, %39 ], [ 0, %.lr.ph4.split.us ]
  br i1 %38, label %._crit_edge.us, label %.lr.ph4.split.us.new.preheader

.lr.ph4.split.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %.lr.ph4.split.us.new

.lr.ph4.split.us.new:                             ; preds = %.lr.ph4.split.us.new.preheader, %.lr.ph4.split.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph4.split.us.new ], [ %indvars.iv.unr.ph, %.lr.ph4.split.us.new.preheader ]
  %45 = add nsw i64 %indvars.iv, %indvars.iv18
  %46 = trunc i64 %45 to i32
  %47 = srem i32 %46, %27
  %48 = sitofp i32 %47 to double
  %49 = getelementptr inbounds [2100 x double], [2100 x double]* %33, i64 %indvars.iv18, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %50 = add nsw i64 %indvars.iv.next, %indvars.iv18
  %51 = trunc i64 %50 to i32
  %52 = srem i32 %51, %27
  %53 = sitofp i32 %52 to double
  %54 = insertelement <2 x double> undef, double %48, i32 0
  %55 = insertelement <2 x double> %54, double %53, i32 1
  %56 = fdiv <2 x double> %55, %36
  %57 = bitcast double* %49 to <2 x double>*
  store <2 x double> %56, <2 x double>* %57, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph4.split.us.new

._crit_edge.us.loopexit:                          ; preds = %.lr.ph4.split.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next19 = add nsw i64 %indvars.iv18, 1
  %58 = icmp slt i64 %indvars.iv.next19, %30
  br i1 %58, label %.lr.ph4.split.us, label %._crit_edge5.loopexit

._crit_edge5.loopexit:                            ; preds = %._crit_edge.us
  %59 = trunc i64 %indvars.iv.next19 to i32
  br label %._crit_edge5

._crit_edge5.loopexit15:                          ; preds = %.lr.ph4
  %60 = add i32 %.promoted, 1
  %61 = icmp sgt i32 %29, %60
  %smax = select i1 %61, i32 %29, i32 %60
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit15, %._crit_edge5.loopexit
  %.lcssa12 = phi i32 [ %59, %._crit_edge5.loopexit ], [ %smax, %._crit_edge5.loopexit15 ]
  store i32 %.lcssa12, i32* %9, align 4
  br label %._crit_edge30

._crit_edge30:                                    ; preds = %._crit_edge, %._crit_edge5
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_atax(i32, i32, [2100 x double]*, double*, double*, double*) #0 {
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
  br i1 %14, label %.lr.ph11, label %._crit_edge

.lr.ph11:                                         ; preds = %6
  %15 = load double*, double** %11, align 8
  %16 = load i32, i32* %8, align 4
  %.promoted = load i32, i32* %13, align 4
  %17 = sext i32 %.promoted to i64
  %18 = sext i32 %16 to i64
  %scevgep48 = getelementptr double, double* %15, i64 %17
  %scevgep4849 = bitcast double* %scevgep48 to i8*
  %19 = add i32 %.promoted, 1
  %20 = icmp sgt i32 %16, %19
  %smax50 = select i1 %20, i32 %16, i32 %19
  %21 = add i32 %smax50, -1
  %22 = sub i32 %21, %.promoted
  %23 = zext i32 %22 to i64
  %24 = shl nuw nsw i64 %23, 3
  %25 = add nuw nsw i64 %24, 8
  call void @llvm.memset.p0i8.i64(i8* %scevgep4849, i8 0, i64 %25, i32 8, i1 false)
  br label %._crit_edge90

._crit_edge90:                                    ; preds = %._crit_edge90, %.lr.ph11
  %indvars.iv45 = phi i64 [ %17, %.lr.ph11 ], [ %indvars.iv.next46, %._crit_edge90 ]
  %indvars.iv.next46 = add nsw i64 %indvars.iv45, 1
  %26 = icmp slt i64 %indvars.iv.next46, %18
  br i1 %26, label %._crit_edge90, label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge90
  %27 = add nsw i64 %17, 1
  %28 = icmp sgt i64 %27, %18
  %smax54 = select i1 %28, i64 %27, i64 %18
  %29 = trunc i64 %smax54 to i32
  store i32 %29, i32* %13, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %._crit_edge12
  store i32 0, i32* %13, align 4
  %30 = load i32, i32* %7, align 4
  %31 = icmp sgt i32 %30, 0
  br i1 %31, label %.lr.ph8, label %._crit_edge91

.lr.ph8:                                          ; preds = %._crit_edge
  %32 = load double*, double** %12, align 8
  %33 = load i32, i32* %8, align 4
  %wide.trip.count.1 = zext i32 %33 to i64
  %34 = icmp sgt i32 %33, 0
  %35 = load [2100 x double]*, [2100 x double]** %9, align 8
  %36 = load double*, double** %10, align 8
  %37 = load double*, double** %11, align 8
  %38 = bitcast double** %12 to i64*
  %39 = load i64, i64* %38, align 8
  %40 = load i32, i32* %8, align 4
  %41 = sext i32 %40 to i64
  %42 = load i32, i32* %7, align 4
  %43 = sext i32 %42 to i64
  %44 = sext i32 %42 to i64
  %.promoted15 = load i32, i32* %13, align 4
  %45 = sext i32 %.promoted15 to i64
  br i1 %34, label %.lr.ph8.split.us.preheader, label %.lr.ph8.split.split.preheader

.lr.ph8.split.us.preheader:                       ; preds = %.lr.ph8
  %46 = sext i32 %.promoted15 to i64
  %xtraiter = and i32 %33, 1
  %47 = icmp eq i32 %xtraiter, 0
  %48 = icmp eq i32 %33, 1
  %sunkaddr = ptrtoint double* %32 to i64
  %sunkaddr81 = ptrtoint double* %32 to i64
  %49 = ptrtoint double* %32 to i64
  %50 = ptrtoint double* %32 to i64
  br label %.lr.ph8.split.us

.lr.ph8.split.us:                                 ; preds = %._crit_edge6.us, %.lr.ph8.split.us.preheader
  %indvars.iv34 = phi i64 [ %46, %.lr.ph8.split.us.preheader ], [ %indvars.iv.next35, %._crit_edge6.us ]
  %51 = getelementptr inbounds double, double* %32, i64 %indvars.iv34
  store double 0.000000e+00, double* %51, align 8
  br i1 %47, label %.prol.loopexit, label %52

; <label>:52:                                     ; preds = %.lr.ph8.split.us
  %sunkaddr55 = shl i64 %indvars.iv34, 3
  %sunkaddr56 = add i64 %50, %sunkaddr55
  %sunkaddr57 = inttoptr i64 %sunkaddr56 to double*
  %53 = load double, double* %sunkaddr57, align 8
  %54 = getelementptr inbounds [2100 x double], [2100 x double]* %35, i64 %indvars.iv34, i64 0
  %55 = load double, double* %54, align 8
  %56 = load double, double* %36, align 8
  %57 = fmul double %55, %56
  %58 = fadd double %53, %57
  %sunkaddr59 = shl i64 %indvars.iv34, 3
  %sunkaddr60 = add i64 %49, %sunkaddr59
  %sunkaddr61 = inttoptr i64 %sunkaddr60 to double*
  store double %58, double* %sunkaddr61, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph8.split.us, %52
  %indvars.iv.unr.ph = phi i64 [ 1, %52 ], [ 0, %.lr.ph8.split.us ]
  br i1 %48, label %.lr.ph5.us.preheader, label %.lr.ph8.split.us.new.preheader

.lr.ph8.split.us.new.preheader:                   ; preds = %.prol.loopexit
  %sunkaddr78 = shl i64 %indvars.iv34, 3
  %sunkaddr79 = add i64 %sunkaddr, %sunkaddr78
  %sunkaddr80 = inttoptr i64 %sunkaddr79 to double*
  %sunkaddr82 = shl i64 %indvars.iv34, 3
  %sunkaddr83 = add i64 %sunkaddr81, %sunkaddr82
  %sunkaddr84 = inttoptr i64 %sunkaddr83 to double*
  br label %.lr.ph8.split.us.new

.lr.ph8.split.us.new:                             ; preds = %.lr.ph8.split.us.new.preheader, %.lr.ph8.split.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph8.split.us.new ], [ %indvars.iv.unr.ph, %.lr.ph8.split.us.new.preheader ]
  %59 = load double, double* %sunkaddr80, align 8
  %60 = getelementptr inbounds [2100 x double], [2100 x double]* %35, i64 %indvars.iv34, i64 %indvars.iv
  %61 = load double, double* %60, align 8
  %62 = getelementptr inbounds double, double* %36, i64 %indvars.iv
  %63 = load double, double* %62, align 8
  %64 = fmul double %61, %63
  %65 = fadd double %59, %64
  store double %65, double* %sunkaddr84, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %66 = getelementptr inbounds [2100 x double], [2100 x double]* %35, i64 %indvars.iv34, i64 %indvars.iv.next
  %67 = load double, double* %66, align 8
  %68 = getelementptr inbounds double, double* %36, i64 %indvars.iv.next
  %69 = load double, double* %68, align 8
  %70 = fmul double %67, %69
  %71 = fadd double %65, %70
  store double %71, double* %sunkaddr84, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %.lr.ph5.us.preheader.loopexit, label %.lr.ph8.split.us.new

.lr.ph5.us.preheader.loopexit:                    ; preds = %.lr.ph8.split.us.new
  br label %.lr.ph5.us.preheader

.lr.ph5.us.preheader:                             ; preds = %.lr.ph5.us.preheader.loopexit, %.prol.loopexit
  %sunkaddr85 = shl i64 %indvars.iv34, 3
  %sunkaddr86 = add i64 %39, %sunkaddr85
  %sunkaddr87 = inttoptr i64 %sunkaddr86 to double*
  br label %.lr.ph5.us

.lr.ph5.us:                                       ; preds = %.lr.ph5.us.preheader, %.lr.ph5.us
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %.lr.ph5.us ], [ 0, %.lr.ph5.us.preheader ]
  %72 = getelementptr inbounds double, double* %37, i64 %indvars.iv32
  %73 = load double, double* %72, align 8
  %74 = getelementptr inbounds [2100 x double], [2100 x double]* %35, i64 %indvars.iv34, i64 %indvars.iv32
  %75 = load double, double* %74, align 8
  %76 = load double, double* %sunkaddr87, align 8
  %77 = fmul double %75, %76
  %78 = fadd double %73, %77
  %79 = getelementptr inbounds double, double* %37, i64 %indvars.iv32
  store double %78, double* %79, align 8
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %80 = icmp slt i64 %indvars.iv.next33, %41
  br i1 %80, label %.lr.ph5.us, label %._crit_edge6.us

._crit_edge6.us:                                  ; preds = %.lr.ph5.us
  %indvars.iv.next35 = add nsw i64 %indvars.iv34, 1
  %81 = icmp slt i64 %indvars.iv.next35, %44
  br i1 %81, label %.lr.ph8.split.us, label %._crit_edge9.loopexit

.lr.ph8.split.split.preheader:                    ; preds = %.lr.ph8
  %scevgep = getelementptr double, double* %32, i64 %45
  %scevgep44 = bitcast double* %scevgep to i8*
  %82 = add i32 %.promoted15, 1
  %83 = icmp sgt i32 %42, %82
  %smax = select i1 %83, i32 %42, i32 %82
  %84 = add i32 %smax, -1
  %85 = sub i32 %84, %.promoted15
  %86 = zext i32 %85 to i64
  %87 = shl nuw nsw i64 %86, 3
  %88 = add nuw nsw i64 %87, 8
  call void @llvm.memset.p0i8.i64(i8* %scevgep44, i8 0, i64 %88, i32 8, i1 false)
  br label %.lr.ph8.split.split

.lr.ph8.split.split:                              ; preds = %.lr.ph8.split.split, %.lr.ph8.split.split.preheader
  %indvars.iv42 = phi i64 [ %45, %.lr.ph8.split.split.preheader ], [ %indvars.iv.next43, %.lr.ph8.split.split ]
  %indvars.iv.next43 = add nsw i64 %indvars.iv42, 1
  %89 = icmp slt i64 %indvars.iv.next43, %43
  br i1 %89, label %.lr.ph8.split.split, label %._crit_edge9.loopexit28

._crit_edge9.loopexit28:                          ; preds = %.lr.ph8.split.split
  %90 = add nsw i64 %45, 1
  %91 = icmp sgt i64 %90, %43
  %smax53 = select i1 %91, i64 %90, i64 %43
  br label %._crit_edge9

._crit_edge9.loopexit:                            ; preds = %._crit_edge6.us
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %._crit_edge9.loopexit28
  %.lcssa16.in = phi i64 [ %smax53, %._crit_edge9.loopexit28 ], [ %indvars.iv.next35, %._crit_edge9.loopexit ]
  %.lcssa16 = trunc i64 %.lcssa16.in to i32
  store i32 %.lcssa16, i32* %13, align 4
  br label %._crit_edge91

._crit_edge91:                                    ; preds = %._crit_edge, %._crit_edge9
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
  %7 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %6) #6
  %8 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %9 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %8, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
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
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %20) #6
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge3, %19
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = getelementptr inbounds double, double* %12, i64 %indvars.iv
  %23 = load double, double* %22, align 8
  %24 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %23) #7
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %25 = icmp slt i64 %indvars.iv.next, %15
  br i1 %25, label %._crit_edge3, label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge2
  %26 = trunc i64 %indvars.iv.next to i32
  store i32 %26, i32* %5, align 4
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %2, %._crit_edge
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %27, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %29 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %30 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %29) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
