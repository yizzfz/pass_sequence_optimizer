; ModuleID = 'A.ll'
source_filename = "atax.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"y\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
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
  call fastcc void @init_array(i32 %19, i32 %20, [2100 x double]* %22, double* %24)
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
  call fastcc void @kernel_atax(i32 %25, i32 %26, [2100 x double]* %28, double* %30, double* %32, double* %34)
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
  call fastcc void @print_array(i32 %42, double* %44)
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

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, [2100 x double]*, double*) unnamed_addr #2 {
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
  br i1 %12, label %.lr.ph5, label %._crit_edge15

.lr.ph5:                                          ; preds = %4
  %13 = load double, double* %10, align 8
  %14 = load double*, double** %8, align 8
  %15 = load i32, i32* %6, align 4
  %.promoted = load i32, i32* %9, align 4
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16, %.lr.ph5
  %16 = phi i32 [ %.promoted, %.lr.ph5 ], [ %23, %._crit_edge16 ]
  %17 = phi i32 [ 0, %.lr.ph5 ], [ %23, %._crit_edge16 ]
  %18 = sitofp i32 %17 to double
  %19 = fdiv double %18, %13
  %20 = fadd double %19, 1.000000e+00
  %21 = sext i32 %17 to i64
  %22 = getelementptr inbounds double, double* %14, i64 %21
  store double %20, double* %22, align 8
  %23 = add nsw i32 %16, 1
  %24 = icmp slt i32 %23, %15
  br i1 %24, label %._crit_edge16, label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge16
  store i32 %23, i32* %9, align 4
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %4, %._crit_edge6
  store i32 0, i32* %9, align 4
  %25 = load i32, i32* %5, align 4
  %26 = icmp sgt i32 %25, 0
  br i1 %26, label %.lr.ph2, label %._crit_edge17

.lr.ph2:                                          ; preds = %._crit_edge15
  %27 = load i32, i32* %6, align 4
  %wide.trip.count.1 = zext i32 %27 to i64
  %28 = load i32, i32* %5, align 4
  %29 = mul nsw i32 %28, 5
  %30 = sitofp i32 %29 to double
  %31 = load [2100 x double]*, [2100 x double]** %7, align 8
  %.promoted7 = load i32, i32* %9, align 4
  %32 = sext i32 %.promoted7 to i64
  %33 = sext i32 %28 to i64
  %xtraiter = and i32 %27, 1
  %34 = insertelement <2 x double> undef, double %30, i32 0
  %35 = shufflevector <2 x double> %34, <2 x double> undef, <2 x i32> zeroinitializer
  %36 = icmp sgt i32 %27, 0
  %37 = icmp eq i32 %xtraiter, 0
  %38 = icmp eq i32 %27, 1
  br label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge, %.lr.ph2
  %indvars.iv13 = phi i64 [ %32, %.lr.ph2 ], [ %indvars.iv.next14, %._crit_edge ]
  br i1 %36, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %._crit_edge._crit_edge
  br i1 %37, label %.prol.loopexit, label %39

; <label>:39:                                     ; preds = %.lr.ph
  %40 = trunc i64 %indvars.iv13 to i32
  %41 = srem i32 %40, %27
  %42 = sitofp i32 %41 to double
  %43 = fdiv double %42, %30
  %44 = getelementptr inbounds [2100 x double], [2100 x double]* %31, i64 %indvars.iv13, i64 0
  store double %43, double* %44, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %39
  %indvars.iv.unr.ph = phi i64 [ 1, %39 ], [ 0, %.lr.ph ]
  br i1 %38, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %45 = add nsw i64 %indvars.iv13, %indvars.iv
  %46 = trunc i64 %45 to i32
  %47 = srem i32 %46, %27
  %48 = sitofp i32 %47 to double
  %49 = getelementptr inbounds [2100 x double], [2100 x double]* %31, i64 %indvars.iv13, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %50 = add nsw i64 %indvars.iv13, %indvars.iv.next
  %51 = trunc i64 %50 to i32
  %52 = srem i32 %51, %27
  %53 = sitofp i32 %52 to double
  %54 = insertelement <2 x double> undef, double %48, i32 0
  %55 = insertelement <2 x double> %54, double %53, i32 1
  %56 = fdiv <2 x double> %55, %35
  %57 = bitcast double* %49 to <2 x double>*
  store <2 x double> %56, <2 x double>* %57, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph.new

._crit_edge.loopexit:                             ; preds = %.lr.ph.new
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.prol.loopexit, %._crit_edge._crit_edge
  %indvars.iv.next14 = add nsw i64 %indvars.iv13, 1
  %58 = icmp slt i64 %indvars.iv.next14, %33
  br i1 %58, label %._crit_edge._crit_edge, label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge
  %59 = trunc i64 %indvars.iv.next14 to i32
  store i32 %59, i32* %9, align 4
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge15, %._crit_edge3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_atax(i32, i32, [2100 x double]*, double*, double*, double*) unnamed_addr #2 {
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
  br i1 %14, label %.lr.ph8, label %._crit_edge54

.lr.ph8:                                          ; preds = %6
  %15 = load double*, double** %11, align 8
  %16 = load i32, i32* %8, align 4
  %.promoted = load i32, i32* %13, align 4
  br label %._crit_edge55

._crit_edge55:                                    ; preds = %._crit_edge55, %.lr.ph8
  %17 = phi i32 [ %.promoted, %.lr.ph8 ], [ %21, %._crit_edge55 ]
  %18 = phi i32 [ 0, %.lr.ph8 ], [ %21, %._crit_edge55 ]
  %19 = sext i32 %18 to i64
  %20 = getelementptr inbounds double, double* %15, i64 %19
  store double 0.000000e+00, double* %20, align 8
  %21 = add nsw i32 %17, 1
  %22 = icmp slt i32 %21, %16
  br i1 %22, label %._crit_edge55, label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge55
  store i32 %21, i32* %13, align 4
  br label %._crit_edge54

._crit_edge54:                                    ; preds = %6, %._crit_edge9
  store i32 0, i32* %13, align 4
  %23 = load i32, i32* %7, align 4
  %24 = icmp sgt i32 %23, 0
  br i1 %24, label %.lr.ph5, label %._crit_edge56

.lr.ph5:                                          ; preds = %._crit_edge54
  %25 = load double*, double** %12, align 8
  %26 = load i32, i32* %8, align 4
  %wide.trip.count20.1 = zext i32 %26 to i64
  %wide.trip.count.1 = zext i32 %26 to i64
  %27 = load [2100 x double]*, [2100 x double]** %9, align 8
  %28 = load double*, double** %10, align 8
  %29 = load double*, double** %11, align 8
  %30 = load i32, i32* %7, align 4
  %.promoted12 = load i32, i32* %13, align 4
  %31 = add i32 %26, -1
  %32 = sext i32 %.promoted12 to i64
  %33 = sext i32 %30 to i64
  %xtraiter = and i32 %26, 1
  %xtraiter23 = and i32 %26, 1
  %34 = icmp sgt i32 %26, 0
  %35 = icmp eq i32 %xtraiter, 0
  %36 = icmp eq i32 %31, 0
  %37 = ptrtoint double* %25 to i64
  %38 = icmp eq i32 %31, 0
  %sunkaddr50 = ptrtoint double* %25 to i64
  %sunkaddr = ptrtoint double* %25 to i64
  %39 = icmp sgt i32 %26, 0
  %40 = icmp eq i32 %xtraiter23, 0
  %41 = ptrtoint double* %25 to i64
  br label %._crit_edge3._crit_edge

._crit_edge3._crit_edge:                          ; preds = %._crit_edge3, %.lr.ph5
  %indvars.iv27 = phi i64 [ %32, %.lr.ph5 ], [ %indvars.iv.next28, %._crit_edge3 ]
  %42 = phi i64 [ 0, %.lr.ph5 ], [ %indvars.iv.next28, %._crit_edge3 ]
  %sext = shl i64 %42, 32
  %43 = ashr exact i64 %sext, 32
  %44 = getelementptr inbounds double, double* %25, i64 %43
  store double 0.000000e+00, double* %44, align 8
  br i1 %34, label %.lr.ph, label %._crit_edge3

.lr.ph:                                           ; preds = %._crit_edge3._crit_edge
  br i1 %35, label %.prol.loopexit, label %45

; <label>:45:                                     ; preds = %.lr.ph
  %sunkaddr29 = shl i64 %indvars.iv27, 3
  %sunkaddr30 = add i64 %41, %sunkaddr29
  %sunkaddr31 = inttoptr i64 %sunkaddr30 to double*
  %46 = load double, double* %sunkaddr31, align 8
  %47 = getelementptr inbounds [2100 x double], [2100 x double]* %27, i64 %indvars.iv27, i64 0
  %48 = load double, double* %47, align 8
  %49 = load double, double* %28, align 8
  %50 = fmul double %48, %49
  %51 = fadd double %46, %50
  store double %51, double* %sunkaddr31, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %45
  %indvars.iv.unr.ph = phi i64 [ 1, %45 ], [ 0, %.lr.ph ]
  br i1 %36, label %.lr.ph2.thread, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %sunkaddr47 = shl i64 %indvars.iv27, 3
  %sunkaddr48 = add i64 %sunkaddr, %sunkaddr47
  %sunkaddr49 = inttoptr i64 %sunkaddr48 to double*
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %52 = load double, double* %sunkaddr49, align 8
  %53 = getelementptr inbounds [2100 x double], [2100 x double]* %27, i64 %indvars.iv27, i64 %indvars.iv
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds double, double* %28, i64 %indvars.iv
  %56 = load double, double* %55, align 8
  %57 = fmul double %54, %56
  %58 = fadd double %52, %57
  store double %58, double* %sunkaddr49, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %59 = getelementptr inbounds [2100 x double], [2100 x double]* %27, i64 %indvars.iv27, i64 %indvars.iv.next
  %60 = load double, double* %59, align 8
  %61 = getelementptr inbounds double, double* %28, i64 %indvars.iv.next
  %62 = load double, double* %61, align 8
  %63 = fmul double %60, %62
  %64 = fadd double %58, %63
  store double %64, double* %sunkaddr49, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge, label %.lr.ph.new

._crit_edge:                                      ; preds = %.lr.ph.new
  br i1 %39, label %.lr.ph2, label %._crit_edge3

.lr.ph2:                                          ; preds = %._crit_edge
  br i1 %40, label %.prol.loopexit22, label %.lr.ph2.thread

.lr.ph2.thread:                                   ; preds = %.lr.ph2, %.prol.loopexit
  %65 = load double, double* %29, align 8
  %66 = getelementptr inbounds [2100 x double], [2100 x double]* %27, i64 %indvars.iv27, i64 0
  %67 = load double, double* %66, align 8
  %sunkaddr37 = shl i64 %indvars.iv27, 3
  %sunkaddr38 = add i64 %37, %sunkaddr37
  %sunkaddr39 = inttoptr i64 %sunkaddr38 to double*
  %68 = load double, double* %sunkaddr39, align 8
  %69 = fmul double %67, %68
  %70 = fadd double %65, %69
  store double %70, double* %29, align 8
  br label %.prol.loopexit22

.prol.loopexit22:                                 ; preds = %.lr.ph2, %.lr.ph2.thread
  %indvars.iv18.unr.ph = phi i64 [ 1, %.lr.ph2.thread ], [ 0, %.lr.ph2 ]
  br i1 %38, label %._crit_edge3, label %.lr.ph2.new.preheader

.lr.ph2.new.preheader:                            ; preds = %.prol.loopexit22
  %sunkaddr51 = shl i64 %indvars.iv27, 3
  %sunkaddr52 = add i64 %sunkaddr50, %sunkaddr51
  %sunkaddr53 = inttoptr i64 %sunkaddr52 to double*
  br label %.lr.ph2.new

.lr.ph2.new:                                      ; preds = %.lr.ph2.new.preheader, %.lr.ph2.new
  %indvars.iv18 = phi i64 [ %indvars.iv.next19.1, %.lr.ph2.new ], [ %indvars.iv18.unr.ph, %.lr.ph2.new.preheader ]
  %71 = getelementptr inbounds double, double* %29, i64 %indvars.iv18
  %72 = load double, double* %71, align 8
  %73 = getelementptr inbounds [2100 x double], [2100 x double]* %27, i64 %indvars.iv27, i64 %indvars.iv18
  %74 = load double, double* %73, align 8
  %75 = load double, double* %sunkaddr53, align 8
  %76 = fmul double %74, %75
  %77 = fadd double %72, %76
  store double %77, double* %71, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %78 = getelementptr inbounds double, double* %29, i64 %indvars.iv.next19
  %79 = load double, double* %78, align 8
  %80 = getelementptr inbounds [2100 x double], [2100 x double]* %27, i64 %indvars.iv27, i64 %indvars.iv.next19
  %81 = load double, double* %80, align 8
  %82 = load double, double* %sunkaddr53, align 8
  %83 = fmul double %81, %82
  %84 = fadd double %79, %83
  store double %84, double* %78, align 8
  %indvars.iv.next19.1 = add nuw nsw i64 %indvars.iv18, 2
  %exitcond.126 = icmp eq i64 %indvars.iv.next19.1, %wide.trip.count20.1
  br i1 %exitcond.126, label %._crit_edge3.loopexit, label %.lr.ph2.new

._crit_edge3.loopexit:                            ; preds = %.lr.ph2.new
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit, %.prol.loopexit22, %._crit_edge, %._crit_edge3._crit_edge
  %indvars.iv.next28 = add nsw i64 %indvars.iv27, 1
  %85 = icmp slt i64 %indvars.iv.next28, %33
  br i1 %85, label %._crit_edge3._crit_edge, label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge3
  %86 = trunc i64 %indvars.iv.next28 to i32
  store i32 %86, i32* %13, align 4
  br label %._crit_edge56

._crit_edge56:                                    ; preds = %._crit_edge54, %._crit_edge6
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
  %24 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %23) #6
  %indvars.iv.next = add nsw i64 %indvars.iv, 1
  %25 = icmp slt i64 %indvars.iv.next, %15
  %26 = trunc i64 %indvars.iv.next to i32
  br i1 %25, label %._crit_edge3, label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge2
  store i32 %26, i32* %5, align 4
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %2, %._crit_edge
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
