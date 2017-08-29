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
  br i1 %12, label %.lr.ph6, label %.preheader3

.lr.ph6:                                          ; preds = %4
  %13 = load double, double* %10, align 8
  %14 = load double*, double** %8, align 8
  %15 = load i32, i32* %6, align 4
  %.promoted11 = load i32, i32* %9, align 4
  %16 = sext i32 %.promoted11 to i64
  %17 = sext i32 %15 to i64
  br label %._crit_edge

..preheader3_crit_edge:                           ; preds = %._crit_edge
  %18 = trunc i64 %indvars.iv.next19 to i32
  store i32 %18, i32* %9, align 4
  br label %.preheader3

.preheader3:                                      ; preds = %4, %..preheader3_crit_edge
  store i32 0, i32* %9, align 4
  %19 = load i32, i32* %5, align 4
  %20 = icmp sgt i32 %19, 0
  br i1 %20, label %.preheader.lr.ph, label %.preheader3._crit_edge

.preheader.lr.ph:                                 ; preds = %.preheader3
  %21 = load i32, i32* %6, align 4
  %wide.trip.count21.1 = zext i32 %21 to i64
  %22 = icmp sgt i32 %21, 0
  %23 = load i32, i32* %5, align 4
  %24 = sext i32 %23 to i64
  %25 = mul nsw i32 %23, 5
  %26 = sitofp i32 %25 to double
  %27 = load [2100 x double]*, [2100 x double]** %7, align 8
  %.promoted = load i32, i32* %9, align 4
  br i1 %22, label %.preheader.us.preheader, label %._crit_edge4.loopexit13

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  %28 = sext i32 %.promoted to i64
  %xtraiter = and i32 %21, 1
  %29 = insertelement <2 x double> undef, double %26, i32 0
  %30 = shufflevector <2 x double> %29, <2 x double> undef, <2 x i32> zeroinitializer
  %31 = icmp eq i32 %xtraiter, 0
  %32 = icmp eq i32 %21, 1
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv16 = phi i64 [ %28, %.preheader.us.preheader ], [ %indvars.iv.next17, %._crit_edge.us ]
  br i1 %31, label %.prol.loopexit, label %33

; <label>:33:                                     ; preds = %.preheader.us
  %34 = trunc i64 %indvars.iv16 to i32
  %35 = srem i32 %34, %21
  %36 = sitofp i32 %35 to double
  %37 = fdiv double %36, %26
  %38 = getelementptr inbounds [2100 x double], [2100 x double]* %27, i64 %indvars.iv16, i64 0
  store double %37, double* %38, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us, %33
  %indvars.iv.unr.ph = phi i64 [ 1, %33 ], [ 0, %.preheader.us ]
  br i1 %32, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new ], [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ]
  %39 = add nsw i64 %indvars.iv, %indvars.iv16
  %40 = trunc i64 %39 to i32
  %41 = srem i32 %40, %21
  %42 = sitofp i32 %41 to double
  %43 = getelementptr inbounds [2100 x double], [2100 x double]* %27, i64 %indvars.iv16, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %44 = add nsw i64 %indvars.iv.next, %indvars.iv16
  %45 = trunc i64 %44 to i32
  %46 = srem i32 %45, %21
  %47 = sitofp i32 %46 to double
  %48 = insertelement <2 x double> undef, double %42, i32 0
  %49 = insertelement <2 x double> %48, double %47, i32 1
  %50 = fdiv <2 x double> %49, %30
  %51 = bitcast double* %43 to <2 x double>*
  store <2 x double> %50, <2 x double>* %51, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond22.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count21.1
  br i1 %exitcond22.1, label %._crit_edge.us.loopexit, label %.preheader.us.new

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %.prol.loopexit
  %indvars.iv.next17 = add nsw i64 %indvars.iv16, 1
  %52 = icmp slt i64 %indvars.iv.next17, %24
  br i1 %52, label %.preheader.us, label %._crit_edge4.loopexit

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph6
  %indvars.iv18 = phi i64 [ %16, %.lr.ph6 ], [ %indvars.iv.next19, %._crit_edge ]
  %53 = trunc i64 %indvars.iv18 to i32
  %54 = sitofp i32 %53 to double
  %55 = fdiv double %54, %13
  %56 = fadd double %55, 1.000000e+00
  %57 = getelementptr inbounds double, double* %14, i64 %indvars.iv18
  store double %56, double* %57, align 8
  %indvars.iv.next19 = add nsw i64 %indvars.iv18, 1
  %58 = icmp slt i64 %indvars.iv.next19, %17
  br i1 %58, label %._crit_edge, label %..preheader3_crit_edge

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  %59 = trunc i64 %indvars.iv.next17 to i32
  br label %._crit_edge4

._crit_edge4.loopexit13:                          ; preds = %.preheader.lr.ph
  %60 = add i32 %.promoted, 1
  %61 = icmp sgt i32 %23, %60
  %smax = select i1 %61, i32 %23, i32 %60
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit13, %._crit_edge4.loopexit
  %.lcssa10 = phi i32 [ %59, %._crit_edge4.loopexit ], [ %smax, %._crit_edge4.loopexit13 ]
  store i32 %.lcssa10, i32* %9, align 4
  br label %.preheader3._crit_edge

.preheader3._crit_edge:                           ; preds = %.preheader3, %._crit_edge4
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
  br i1 %14, label %.lr.ph9, label %.preheader4

.lr.ph9:                                          ; preds = %6
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
  br label %._crit_edge

..preheader4_crit_edge:                           ; preds = %._crit_edge
  %26 = add nsw i64 %17, 1
  %27 = icmp sgt i64 %26, %18
  %smax79 = select i1 %27, i64 %26, i64 %18
  %28 = trunc i64 %smax79 to i32
  store i32 %28, i32* %13, align 4
  br label %.preheader4

.preheader4:                                      ; preds = %6, %..preheader4_crit_edge
  store i32 0, i32* %13, align 4
  %29 = load i32, i32* %7, align 4
  %30 = icmp sgt i32 %29, 0
  br i1 %30, label %.lr.ph6, label %.preheader4._crit_edge

.lr.ph6:                                          ; preds = %.preheader4
  %31 = load double*, double** %12, align 8
  %32 = load i32, i32* %8, align 4
  %wide.trip.count42.1 = zext i32 %32 to i64
  %33 = icmp sgt i32 %32, 0
  %34 = load [2100 x double]*, [2100 x double]** %9, align 8
  %35 = load double*, double** %10, align 8
  %36 = load double*, double** %11, align 8
  %37 = bitcast double** %12 to i64*
  %38 = load i64, i64* %37, align 8
  %39 = load i32, i32* %8, align 4
  %40 = sext i32 %39 to i64
  %41 = load i32, i32* %7, align 4
  %42 = sext i32 %41 to i64
  %43 = sext i32 %41 to i64
  %.promoted12 = load i32, i32* %13, align 4
  %44 = sext i32 %.promoted12 to i64
  %45 = sext i32 %.promoted12 to i64
  br i1 %33, label %.lr.ph6.split.us.preheader, label %.lr.ph6.split.split.preheader

.lr.ph6.split.us.preheader:                       ; preds = %.lr.ph6
  %xtraiter = and i32 %32, 1
  %46 = icmp eq i32 %xtraiter, 0
  %47 = icmp eq i32 %32, 1
  %sunkaddr = ptrtoint double* %31 to i64
  %sunkaddr84 = ptrtoint double* %31 to i64
  %48 = ptrtoint double* %31 to i64
  %49 = ptrtoint double* %31 to i64
  br label %.lr.ph6.split.us

.lr.ph6.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph6.split.us.preheader
  %indvars.iv32 = phi i64 [ %45, %.lr.ph6.split.us.preheader ], [ %indvars.iv.next33, %._crit_edge.us ]
  %50 = getelementptr inbounds double, double* %31, i64 %indvars.iv32
  store double 0.000000e+00, double* %50, align 8
  br i1 %46, label %.prol.loopexit, label %51

; <label>:51:                                     ; preds = %.lr.ph6.split.us
  %sunkaddr51 = shl i64 %indvars.iv32, 3
  %sunkaddr52 = add i64 %49, %sunkaddr51
  %sunkaddr53 = inttoptr i64 %sunkaddr52 to double*
  %52 = load double, double* %sunkaddr53, align 8
  %53 = getelementptr inbounds [2100 x double], [2100 x double]* %34, i64 %indvars.iv32, i64 0
  %54 = load double, double* %53, align 8
  %55 = load double, double* %35, align 8
  %56 = fmul double %54, %55
  %57 = fadd double %52, %56
  %sunkaddr55 = shl i64 %indvars.iv32, 3
  %sunkaddr56 = add i64 %48, %sunkaddr55
  %sunkaddr57 = inttoptr i64 %sunkaddr56 to double*
  store double %57, double* %sunkaddr57, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph6.split.us, %51
  %indvars.iv.unr.ph = phi i64 [ 1, %51 ], [ 0, %.lr.ph6.split.us ]
  br i1 %47, label %.lr.ph5.us.preheader, label %.lr.ph6.split.us.new.preheader

.lr.ph6.split.us.new.preheader:                   ; preds = %.prol.loopexit
  %sunkaddr81 = shl i64 %indvars.iv32, 3
  %sunkaddr82 = add i64 %sunkaddr, %sunkaddr81
  %sunkaddr83 = inttoptr i64 %sunkaddr82 to double*
  %sunkaddr85 = shl i64 %indvars.iv32, 3
  %sunkaddr86 = add i64 %sunkaddr84, %sunkaddr85
  %sunkaddr87 = inttoptr i64 %sunkaddr86 to double*
  br label %.lr.ph6.split.us.new

.lr.ph6.split.us.new:                             ; preds = %.lr.ph6.split.us.new.preheader, %.lr.ph6.split.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph6.split.us.new ], [ %indvars.iv.unr.ph, %.lr.ph6.split.us.new.preheader ]
  %58 = load double, double* %sunkaddr83, align 8
  %59 = getelementptr inbounds [2100 x double], [2100 x double]* %34, i64 %indvars.iv32, i64 %indvars.iv
  %60 = load double, double* %59, align 8
  %61 = getelementptr inbounds double, double* %35, i64 %indvars.iv
  %62 = load double, double* %61, align 8
  %63 = fmul double %60, %62
  %64 = fadd double %58, %63
  store double %64, double* %sunkaddr87, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %65 = getelementptr inbounds [2100 x double], [2100 x double]* %34, i64 %indvars.iv32, i64 %indvars.iv.next
  %66 = load double, double* %65, align 8
  %67 = getelementptr inbounds double, double* %35, i64 %indvars.iv.next
  %68 = load double, double* %67, align 8
  %69 = fmul double %66, %68
  %70 = fadd double %64, %69
  store double %70, double* %sunkaddr87, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond43.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count42.1
  br i1 %exitcond43.1, label %.lr.ph5.us.preheader.loopexit, label %.lr.ph6.split.us.new

.lr.ph5.us.preheader.loopexit:                    ; preds = %.lr.ph6.split.us.new
  br label %.lr.ph5.us.preheader

.lr.ph5.us.preheader:                             ; preds = %.lr.ph5.us.preheader.loopexit, %.prol.loopexit
  %sunkaddr88 = shl i64 %indvars.iv32, 3
  %sunkaddr89 = add i64 %38, %sunkaddr88
  %sunkaddr90 = inttoptr i64 %sunkaddr89 to double*
  br label %.lr.ph5.us

.lr.ph5.us:                                       ; preds = %.lr.ph5.us.preheader, %.lr.ph5.us
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %.lr.ph5.us ], [ 0, %.lr.ph5.us.preheader ]
  %71 = getelementptr inbounds double, double* %36, i64 %indvars.iv30
  %72 = load double, double* %71, align 8
  %73 = getelementptr inbounds [2100 x double], [2100 x double]* %34, i64 %indvars.iv32, i64 %indvars.iv30
  %74 = load double, double* %73, align 8
  %75 = load double, double* %sunkaddr90, align 8
  %76 = fmul double %74, %75
  %77 = fadd double %72, %76
  %78 = getelementptr inbounds double, double* %36, i64 %indvars.iv30
  store double %77, double* %78, align 8
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %79 = icmp slt i64 %indvars.iv.next31, %40
  br i1 %79, label %.lr.ph5.us, label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.lr.ph5.us
  %indvars.iv.next33 = add nsw i64 %indvars.iv32, 1
  %80 = icmp slt i64 %indvars.iv.next33, %43
  br i1 %80, label %.lr.ph6.split.us, label %._crit_edge7.loopexit

.lr.ph6.split.split.preheader:                    ; preds = %.lr.ph6
  %scevgep = getelementptr double, double* %31, i64 %44
  %scevgep46 = bitcast double* %scevgep to i8*
  %81 = add i32 %.promoted12, 1
  %82 = icmp sgt i32 %41, %81
  %smax = select i1 %82, i32 %41, i32 %81
  %83 = add i32 %smax, -1
  %84 = sub i32 %83, %.promoted12
  %85 = zext i32 %84 to i64
  %86 = shl nuw nsw i64 %85, 3
  %87 = add nuw nsw i64 %86, 8
  call void @llvm.memset.p0i8.i64(i8* %scevgep46, i8 0, i64 %87, i32 8, i1 false)
  br label %.lr.ph6.split.split

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph9
  %indvars.iv40 = phi i64 [ %17, %.lr.ph9 ], [ %indvars.iv.next41, %._crit_edge ]
  %indvars.iv.next41 = add nsw i64 %indvars.iv40, 1
  %88 = icmp slt i64 %indvars.iv.next41, %18
  br i1 %88, label %._crit_edge, label %..preheader4_crit_edge

.lr.ph6.split.split:                              ; preds = %.lr.ph6.split.split, %.lr.ph6.split.split.preheader
  %indvars.iv38 = phi i64 [ %44, %.lr.ph6.split.split.preheader ], [ %indvars.iv.next39, %.lr.ph6.split.split ]
  %indvars.iv.next39 = add nsw i64 %indvars.iv38, 1
  %89 = icmp slt i64 %indvars.iv.next39, %42
  br i1 %89, label %.lr.ph6.split.split, label %._crit_edge7.loopexit75

._crit_edge7.loopexit75:                          ; preds = %.lr.ph6.split.split
  %90 = add nsw i64 %45, 1
  %91 = icmp sgt i64 %90, %43
  %smax78 = select i1 %91, i64 %90, i64 %43
  br label %._crit_edge7

._crit_edge7.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit, %._crit_edge7.loopexit75
  %.lcssa13.in = phi i64 [ %smax78, %._crit_edge7.loopexit75 ], [ %indvars.iv.next33, %._crit_edge7.loopexit ]
  %.lcssa13 = trunc i64 %.lcssa13.in to i32
  store i32 %.lcssa13, i32* %13, align 4
  br label %.preheader4._crit_edge

.preheader4._crit_edge:                           ; preds = %.preheader4, %._crit_edge7
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
