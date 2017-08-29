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
  br i1 %12, label %.lr.ph11, label %._crit_edge19

.lr.ph11:                                         ; preds = %4
  %13 = load double, double* %10, align 8
  %14 = load double*, double** %8, align 8
  %15 = load i32, i32* %6, align 4
  %.promoted = load i32, i32* %9, align 4
  %16 = sext i32 %.promoted to i64
  %17 = sext i32 %15 to i64
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge20, %.lr.ph11
  %indvars.iv17 = phi i64 [ %16, %.lr.ph11 ], [ %indvars.iv.next18, %._crit_edge20 ]
  %18 = trunc i64 %indvars.iv17 to i32
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, %13
  %21 = fadd double %20, 1.000000e+00
  %22 = getelementptr inbounds double, double* %14, i64 %indvars.iv17
  store double %21, double* %22, align 8
  %indvars.iv.next18 = add nsw i64 %indvars.iv17, 1
  %23 = icmp slt i64 %indvars.iv.next18, %17
  br i1 %23, label %._crit_edge20, label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge20
  %24 = trunc i64 %indvars.iv.next18 to i32
  store i32 %24, i32* %9, align 4
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %4, %._crit_edge12
  store i32 0, i32* %9, align 4
  %25 = load i32, i32* %5, align 4
  %26 = icmp sgt i32 %25, 0
  br i1 %26, label %.lr.ph4, label %._crit_edge21

.lr.ph4:                                          ; preds = %._crit_edge19
  %27 = load i32, i32* %6, align 4
  %wide.trip.count.1 = zext i32 %27 to i64
  %28 = load i32, i32* %5, align 4
  %29 = mul nsw i32 %28, 5
  %30 = sitofp i32 %29 to double
  %31 = load [2100 x double]*, [2100 x double]** %7, align 8
  %.promoted6 = load i32, i32* %9, align 4
  %32 = sext i32 %.promoted6 to i64
  %33 = sext i32 %28 to i64
  %xtraiter = and i32 %27, 1
  %34 = insertelement <2 x double> undef, double %30, i32 0
  %35 = shufflevector <2 x double> %34, <2 x double> undef, <2 x i32> zeroinitializer
  %36 = icmp sgt i32 %27, 0
  %37 = icmp eq i32 %xtraiter, 0
  %38 = icmp eq i32 %27, 1
  br label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge, %.lr.ph4
  %indvars.iv15 = phi i64 [ %32, %.lr.ph4 ], [ %indvars.iv.next16, %._crit_edge ]
  br i1 %36, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %._crit_edge._crit_edge
  br i1 %37, label %.prol.loopexit, label %39

; <label>:39:                                     ; preds = %.lr.ph
  %40 = trunc i64 %indvars.iv15 to i32
  %41 = srem i32 %40, %27
  %42 = sitofp i32 %41 to double
  %43 = fdiv double %42, %30
  %44 = getelementptr inbounds [2100 x double], [2100 x double]* %31, i64 %indvars.iv15, i64 0
  store double %43, double* %44, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %39
  %indvars.iv.unr.ph = phi i64 [ 1, %39 ], [ 0, %.lr.ph ]
  br i1 %38, label %._crit_edge, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %45 = add nsw i64 %indvars.iv15, %indvars.iv
  %46 = trunc i64 %45 to i32
  %47 = srem i32 %46, %27
  %48 = sitofp i32 %47 to double
  %49 = getelementptr inbounds [2100 x double], [2100 x double]* %31, i64 %indvars.iv15, i64 %indvars.iv
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %50 = add nsw i64 %indvars.iv15, %indvars.iv.next
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
  %indvars.iv.next16 = add nsw i64 %indvars.iv15, 1
  %58 = icmp slt i64 %indvars.iv.next16, %33
  br i1 %58, label %._crit_edge._crit_edge, label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge
  %59 = trunc i64 %indvars.iv.next16 to i32
  store i32 %59, i32* %9, align 4
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge19, %._crit_edge5
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_atax(i32, i32, [2100 x double]*, double*, double*, double*) unnamed_addr #0 {
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
  br i1 %14, label %.lr.ph17, label %._crit_edge55

.lr.ph17:                                         ; preds = %6
  %15 = load double*, double** %11, align 8
  %16 = load i32, i32* %8, align 4
  %.promoted = load i32, i32* %13, align 4
  %17 = sext i32 %.promoted to i64
  %18 = sext i32 %16 to i64
  %scevgep = getelementptr double, double* %15, i64 %17
  %scevgep28 = bitcast double* %scevgep to i8*
  %19 = add i32 %.promoted, 1
  %20 = icmp sgt i32 %16, %19
  %smax = select i1 %20, i32 %16, i32 %19
  %21 = add i32 %smax, -1
  %22 = sub i32 %21, %.promoted
  %23 = zext i32 %22 to i64
  %24 = shl nuw nsw i64 %23, 3
  %25 = add nuw nsw i64 %24, 8
  call void @llvm.memset.p0i8.i64(i8* %scevgep28, i8 0, i64 %25, i32 8, i1 false)
  %26 = add nsw i64 %17, 1
  br label %._crit_edge56

._crit_edge56:                                    ; preds = %._crit_edge56, %.lr.ph17
  %indvars.iv26 = phi i64 [ %17, %.lr.ph17 ], [ %indvars.iv.next27, %._crit_edge56 ]
  %indvars.iv.next27 = add nsw i64 %indvars.iv26, 1
  %27 = icmp slt i64 %indvars.iv.next27, %18
  br i1 %27, label %._crit_edge56, label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge56
  %28 = icmp sgt i64 %26, %18
  %smax53 = select i1 %28, i64 %26, i64 %18
  %29 = trunc i64 %smax53 to i32
  store i32 %29, i32* %13, align 4
  br label %._crit_edge55

._crit_edge55:                                    ; preds = %6, %._crit_edge18
  store i32 0, i32* %13, align 4
  %30 = load i32, i32* %7, align 4
  %31 = icmp sgt i32 %30, 0
  br i1 %31, label %.lr.ph10, label %._crit_edge57

.lr.ph10:                                         ; preds = %._crit_edge55
  %32 = load double*, double** %12, align 8
  %33 = load i32, i32* %8, align 4
  %34 = load i32, i32* %7, align 4
  %35 = load double*, double** %11, align 8
  %36 = load [2100 x double]*, [2100 x double]** %9, align 8
  %37 = load double*, double** %10, align 8
  %.promoted12 = load i32, i32* %13, align 4
  %38 = sext i32 %33 to i64
  %39 = sext i32 %.promoted12 to i64
  %40 = sext i32 %34 to i64
  %41 = add nsw i64 %38, -1
  %42 = icmp sgt i32 %33, 0
  %xtraiter = and i64 %38, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %43 = icmp eq i64 %41, 0
  %44 = icmp sgt i32 %33, 0
  %xtraiter58 = and i64 %38, 1
  %lcmp.mod59 = icmp eq i64 %xtraiter58, 0
  %45 = icmp eq i64 %41, 0
  %sunkaddr47 = ptrtoint double* %32 to i64
  %sunkaddr47.1 = ptrtoint double* %32 to i64
  %sunkaddr47.prol = ptrtoint double* %32 to i64
  %sunkaddr = ptrtoint double* %32 to i64
  %sunkaddr43 = ptrtoint double* %32 to i64
  %sunkaddr.1 = ptrtoint double* %32 to i64
  %sunkaddr43.1 = ptrtoint double* %32 to i64
  %sunkaddr.prol = ptrtoint double* %32 to i64
  %sunkaddr43.prol = ptrtoint double* %32 to i64
  br label %._crit_edge6._crit_edge

._crit_edge6._crit_edge:                          ; preds = %._crit_edge6, %.lr.ph10
  %indvars.iv23 = phi i64 [ %39, %.lr.ph10 ], [ %indvars.iv.next24, %._crit_edge6 ]
  %46 = getelementptr inbounds double, double* %32, i64 %indvars.iv23
  store double 0.000000e+00, double* %46, align 8
  br i1 %42, label %.lr.ph.preheader, label %._crit_edge6

.lr.ph.preheader:                                 ; preds = %._crit_edge6._crit_edge
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %sunkaddr40.prol = shl i64 %indvars.iv23, 3
  %sunkaddr41.prol = add i64 %sunkaddr.prol, %sunkaddr40.prol
  %sunkaddr42.prol = inttoptr i64 %sunkaddr41.prol to double*
  %47 = load double, double* %sunkaddr42.prol, align 8
  %48 = getelementptr inbounds [2100 x double], [2100 x double]* %36, i64 %indvars.iv23, i64 0
  %49 = load double, double* %48, align 8
  %50 = load double, double* %37, align 8
  %51 = fmul double %49, %50
  %52 = fadd double %47, %51
  %sunkaddr44.prol = shl i64 %indvars.iv23, 3
  %sunkaddr45.prol = add i64 %sunkaddr43.prol, %sunkaddr44.prol
  %sunkaddr46.prol = inttoptr i64 %sunkaddr45.prol to double*
  store double %52, double* %sunkaddr46.prol, align 8
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol, %.lr.ph.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader ]
  br i1 %43, label %._crit_edge, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  %sunkaddr40 = shl i64 %indvars.iv23, 3
  %sunkaddr41 = add i64 %sunkaddr, %sunkaddr40
  %sunkaddr42 = inttoptr i64 %sunkaddr41 to double*
  %sunkaddr44 = shl i64 %indvars.iv23, 3
  %sunkaddr45 = add i64 %sunkaddr43, %sunkaddr44
  %sunkaddr46 = inttoptr i64 %sunkaddr45 to double*
  %sunkaddr40.1 = shl i64 %indvars.iv23, 3
  %sunkaddr41.1 = add i64 %sunkaddr.1, %sunkaddr40.1
  %sunkaddr42.1 = inttoptr i64 %sunkaddr41.1 to double*
  %sunkaddr44.1 = shl i64 %indvars.iv23, 3
  %sunkaddr45.1 = add i64 %sunkaddr43.1, %sunkaddr44.1
  %sunkaddr46.1 = inttoptr i64 %sunkaddr45.1 to double*
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.preheader.new ], [ %indvars.iv.next.1, %.lr.ph ]
  %53 = load double, double* %sunkaddr42, align 8
  %54 = getelementptr inbounds [2100 x double], [2100 x double]* %36, i64 %indvars.iv23, i64 %indvars.iv
  %55 = load double, double* %54, align 8
  %56 = getelementptr inbounds double, double* %37, i64 %indvars.iv
  %57 = load double, double* %56, align 8
  %58 = fmul double %55, %57
  %59 = fadd double %53, %58
  store double %59, double* %sunkaddr46, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %60 = load double, double* %sunkaddr42.1, align 8
  %61 = getelementptr inbounds [2100 x double], [2100 x double]* %36, i64 %indvars.iv23, i64 %indvars.iv.next
  %62 = load double, double* %61, align 8
  %63 = getelementptr inbounds double, double* %37, i64 %indvars.iv.next
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = fadd double %60, %65
  store double %66, double* %sunkaddr46.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %38
  br i1 %exitcond.1, label %._crit_edge.loopexit, label %.lr.ph

._crit_edge.loopexit:                             ; preds = %.lr.ph
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.lr.ph.prol.loopexit
  br i1 %44, label %.lr.ph5.preheader, label %._crit_edge6

.lr.ph5.preheader:                                ; preds = %._crit_edge
  br i1 %lcmp.mod59, label %.lr.ph5.prol.loopexit, label %.lr.ph5.prol

.lr.ph5.prol:                                     ; preds = %.lr.ph5.preheader
  %67 = load double, double* %35, align 8
  %68 = getelementptr inbounds [2100 x double], [2100 x double]* %36, i64 %indvars.iv23, i64 0
  %69 = load double, double* %68, align 8
  %sunkaddr48.prol = shl i64 %indvars.iv23, 3
  %sunkaddr49.prol = add i64 %sunkaddr47.prol, %sunkaddr48.prol
  %sunkaddr50.prol = inttoptr i64 %sunkaddr49.prol to double*
  %70 = load double, double* %sunkaddr50.prol, align 8
  %71 = fmul double %69, %70
  %72 = fadd double %67, %71
  store double %72, double* %35, align 8
  br label %.lr.ph5.prol.loopexit

.lr.ph5.prol.loopexit:                            ; preds = %.lr.ph5.prol, %.lr.ph5.preheader
  %indvars.iv21.unr.ph = phi i64 [ 1, %.lr.ph5.prol ], [ 0, %.lr.ph5.preheader ]
  br i1 %45, label %._crit_edge6, label %.lr.ph5.preheader.new

.lr.ph5.preheader.new:                            ; preds = %.lr.ph5.prol.loopexit
  %sunkaddr48 = shl i64 %indvars.iv23, 3
  %sunkaddr49 = add i64 %sunkaddr47, %sunkaddr48
  %sunkaddr50 = inttoptr i64 %sunkaddr49 to double*
  %sunkaddr48.1 = shl i64 %indvars.iv23, 3
  %sunkaddr49.1 = add i64 %sunkaddr47.1, %sunkaddr48.1
  %sunkaddr50.1 = inttoptr i64 %sunkaddr49.1 to double*
  br label %.lr.ph5

.lr.ph5:                                          ; preds = %.lr.ph5, %.lr.ph5.preheader.new
  %indvars.iv21 = phi i64 [ %indvars.iv21.unr.ph, %.lr.ph5.preheader.new ], [ %indvars.iv.next22.1, %.lr.ph5 ]
  %73 = getelementptr inbounds double, double* %35, i64 %indvars.iv21
  %74 = load double, double* %73, align 8
  %75 = getelementptr inbounds [2100 x double], [2100 x double]* %36, i64 %indvars.iv23, i64 %indvars.iv21
  %76 = load double, double* %75, align 8
  %77 = load double, double* %sunkaddr50, align 8
  %78 = fmul double %76, %77
  %79 = fadd double %74, %78
  %80 = getelementptr inbounds double, double* %35, i64 %indvars.iv21
  store double %79, double* %80, align 8
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %81 = getelementptr inbounds double, double* %35, i64 %indvars.iv.next22
  %82 = load double, double* %81, align 8
  %83 = getelementptr inbounds [2100 x double], [2100 x double]* %36, i64 %indvars.iv23, i64 %indvars.iv.next22
  %84 = load double, double* %83, align 8
  %85 = load double, double* %sunkaddr50.1, align 8
  %86 = fmul double %84, %85
  %87 = fadd double %82, %86
  %88 = getelementptr inbounds double, double* %35, i64 %indvars.iv.next22
  store double %87, double* %88, align 8
  %indvars.iv.next22.1 = add nsw i64 %indvars.iv21, 2
  %exitcond51.1 = icmp eq i64 %indvars.iv.next22.1, %38
  br i1 %exitcond51.1, label %._crit_edge6.loopexit, label %.lr.ph5

._crit_edge6.loopexit:                            ; preds = %.lr.ph5
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit, %.lr.ph5.prol.loopexit, %._crit_edge, %._crit_edge6._crit_edge
  %indvars.iv.next24 = add nsw i64 %indvars.iv23, 1
  %89 = icmp slt i64 %indvars.iv.next24, %40
  br i1 %89, label %._crit_edge6._crit_edge, label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge6
  %90 = trunc i64 %indvars.iv.next24 to i32
  store i32 %90, i32* %13, align 4
  br label %._crit_edge57

._crit_edge57:                                    ; preds = %._crit_edge55, %._crit_edge11
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
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

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
