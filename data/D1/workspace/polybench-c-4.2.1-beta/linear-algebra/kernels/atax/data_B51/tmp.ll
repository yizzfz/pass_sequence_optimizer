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
  br i1 %12, label %.lr.ph5, label %._crit_edge17

.lr.ph5:                                          ; preds = %4
  %13 = load double, double* %10, align 8
  %14 = load double*, double** %8, align 8
  %15 = load i32, i32* %6, align 4
  %.promoted = load i32, i32* %9, align 4
  %16 = sext i32 %.promoted to i64
  %17 = sext i32 %15 to i64
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge18, %.lr.ph5
  %indvars.iv15 = phi i64 [ %16, %.lr.ph5 ], [ %indvars.iv.next16, %._crit_edge18 ]
  %18 = trunc i64 %indvars.iv15 to i32
  %19 = sitofp i32 %18 to double
  %20 = fdiv double %19, %13
  %21 = fadd double %20, 1.000000e+00
  %22 = getelementptr inbounds double, double* %14, i64 %indvars.iv15
  store double %21, double* %22, align 8
  %indvars.iv.next16 = add nsw i64 %indvars.iv15, 1
  %23 = icmp slt i64 %indvars.iv.next16, %17
  br i1 %23, label %._crit_edge18, label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge18
  %24 = trunc i64 %indvars.iv.next16 to i32
  store i32 %24, i32* %9, align 4
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %4, %._crit_edge6
  store i32 0, i32* %9, align 4
  %25 = load i32, i32* %5, align 4
  %26 = icmp sgt i32 %25, 0
  br i1 %26, label %.lr.ph2, label %._crit_edge19

.lr.ph2:                                          ; preds = %._crit_edge17
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
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge17, %._crit_edge3
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
  br i1 %14, label %.lr.ph8, label %._crit_edge60

.lr.ph8:                                          ; preds = %6
  %15 = load double*, double** %11, align 8
  %16 = load i32, i32* %8, align 4
  %.promoted = load i32, i32* %13, align 4
  %17 = sext i32 %.promoted to i64
  %18 = sext i32 %16 to i64
  %scevgep = getelementptr double, double* %15, i64 %17
  %scevgep37 = bitcast double* %scevgep to i8*
  %19 = add i32 %.promoted, 1
  %20 = icmp sgt i32 %16, %19
  %smax = select i1 %20, i32 %16, i32 %19
  %21 = add i32 %smax, -1
  %22 = sub i32 %21, %.promoted
  %23 = zext i32 %22 to i64
  %24 = shl nuw nsw i64 %23, 3
  %25 = add nuw nsw i64 %24, 8
  call void @llvm.memset.p0i8.i64(i8* %scevgep37, i8 0, i64 %25, i32 8, i1 false)
  %26 = add nsw i64 %17, 1
  br label %._crit_edge61

._crit_edge61:                                    ; preds = %._crit_edge61, %.lr.ph8
  %indvars.iv35 = phi i64 [ %17, %.lr.ph8 ], [ %indvars.iv.next36, %._crit_edge61 ]
  %indvars.iv.next36 = add nsw i64 %indvars.iv35, 1
  %27 = icmp slt i64 %indvars.iv.next36, %18
  br i1 %27, label %._crit_edge61, label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge61
  %28 = icmp sgt i64 %26, %18
  %smax58 = select i1 %28, i64 %26, i64 %18
  %29 = trunc i64 %smax58 to i32
  store i32 %29, i32* %13, align 4
  br label %._crit_edge60

._crit_edge60:                                    ; preds = %6, %._crit_edge9
  store i32 0, i32* %13, align 4
  %30 = load i32, i32* %7, align 4
  %31 = icmp sgt i32 %30, 0
  br i1 %31, label %.lr.ph5, label %._crit_edge62

.lr.ph5:                                          ; preds = %._crit_edge60
  %32 = load double*, double** %12, align 8
  %33 = load i32, i32* %8, align 4
  %wide.trip.count.1 = zext i32 %33 to i64
  %34 = load [2100 x double]*, [2100 x double]** %9, align 8
  %35 = load double*, double** %10, align 8
  %36 = load double*, double** %11, align 8
  %37 = bitcast double** %12 to i64*
  %38 = load i64, i64* %37, align 8
  %39 = load i32, i32* %8, align 4
  %40 = load i32, i32* %7, align 4
  %.promoted12 = load i32, i32* %13, align 4
  %41 = sext i32 %39 to i64
  %42 = sext i32 %.promoted12 to i64
  %43 = sext i32 %40 to i64
  %xtraiter = and i32 %33, 1
  %44 = icmp sgt i32 %33, 0
  %45 = icmp eq i32 %xtraiter, 0
  %46 = icmp eq i32 %33, 1
  %sunkaddr = ptrtoint double* %32 to i64
  %sunkaddr42 = ptrtoint double* %32 to i64
  %sunkaddr46 = ptrtoint double* %32 to i64
  %sunkaddr50 = ptrtoint double* %32 to i64
  %47 = icmp sgt i32 %33, 0
  %48 = ptrtoint double* %32 to i64
  %49 = ptrtoint double* %32 to i64
  br label %._crit_edge3._crit_edge

._crit_edge3._crit_edge:                          ; preds = %._crit_edge3, %.lr.ph5
  %indvars.iv32 = phi i64 [ %42, %.lr.ph5 ], [ %indvars.iv.next33, %._crit_edge3 ]
  %50 = getelementptr inbounds double, double* %32, i64 %indvars.iv32
  store double 0.000000e+00, double* %50, align 8
  br i1 %44, label %.lr.ph, label %._crit_edge3

.lr.ph:                                           ; preds = %._crit_edge3._crit_edge
  br i1 %45, label %.prol.loopexit, label %51

; <label>:51:                                     ; preds = %.lr.ph
  %sunkaddr17.prol = shl nsw i64 %indvars.iv32, 3
  %sunkaddr18.prol = add i64 %48, %sunkaddr17.prol
  %sunkaddr19.prol = inttoptr i64 %sunkaddr18.prol to double*
  %52 = load double, double* %sunkaddr19.prol, align 8
  %53 = getelementptr inbounds [2100 x double], [2100 x double]* %34, i64 %indvars.iv32, i64 0
  %54 = load double, double* %53, align 8
  %55 = load double, double* %35, align 8
  %56 = fmul double %54, %55
  %57 = fadd double %52, %56
  %sunkaddr21.prol = shl nsw i64 %indvars.iv32, 3
  %sunkaddr22.prol = add i64 %49, %sunkaddr21.prol
  %sunkaddr23.prol = inttoptr i64 %sunkaddr22.prol to double*
  store double %57, double* %sunkaddr23.prol, align 8
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph, %51
  %indvars.iv.unr.ph = phi i64 [ 1, %51 ], [ 0, %.lr.ph ]
  br i1 %46, label %.lr.ph2.preheader, label %.lr.ph.new.preheader

.lr.ph.new.preheader:                             ; preds = %.prol.loopexit
  %sunkaddr39 = shl i64 %indvars.iv32, 3
  %sunkaddr40 = add i64 %sunkaddr, %sunkaddr39
  %sunkaddr41 = inttoptr i64 %sunkaddr40 to double*
  %sunkaddr43 = shl i64 %indvars.iv32, 3
  %sunkaddr44 = add i64 %sunkaddr42, %sunkaddr43
  %sunkaddr45 = inttoptr i64 %sunkaddr44 to double*
  %sunkaddr47 = shl i64 %indvars.iv32, 3
  %sunkaddr48 = add i64 %sunkaddr46, %sunkaddr47
  %sunkaddr49 = inttoptr i64 %sunkaddr48 to double*
  %sunkaddr51 = shl i64 %indvars.iv32, 3
  %sunkaddr52 = add i64 %sunkaddr50, %sunkaddr51
  %sunkaddr53 = inttoptr i64 %sunkaddr52 to double*
  br label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.lr.ph.new.preheader, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph.new ], [ %indvars.iv.unr.ph, %.lr.ph.new.preheader ]
  %58 = load double, double* %sunkaddr41, align 8
  %59 = getelementptr inbounds [2100 x double], [2100 x double]* %34, i64 %indvars.iv32, i64 %indvars.iv
  %60 = load double, double* %59, align 8
  %61 = getelementptr inbounds double, double* %35, i64 %indvars.iv
  %62 = load double, double* %61, align 8
  %63 = fmul double %60, %62
  %64 = fadd double %58, %63
  store double %64, double* %sunkaddr45, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %65 = load double, double* %sunkaddr49, align 8
  %66 = getelementptr inbounds [2100 x double], [2100 x double]* %34, i64 %indvars.iv32, i64 %indvars.iv.next
  %67 = load double, double* %66, align 8
  %68 = getelementptr inbounds double, double* %35, i64 %indvars.iv.next
  %69 = load double, double* %68, align 8
  %70 = fmul double %67, %69
  %71 = fadd double %65, %70
  store double %71, double* %sunkaddr53, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge, label %.lr.ph.new

._crit_edge:                                      ; preds = %.lr.ph.new
  br i1 %47, label %.lr.ph2.preheader, label %._crit_edge3

.lr.ph2.preheader:                                ; preds = %._crit_edge, %.prol.loopexit
  %sunkaddr54 = shl i64 %indvars.iv32, 3
  %sunkaddr55 = add i64 %38, %sunkaddr54
  %sunkaddr56 = inttoptr i64 %sunkaddr55 to double*
  br label %.lr.ph2

.lr.ph2:                                          ; preds = %.lr.ph2.preheader, %.lr.ph2
  %indvars.iv30 = phi i64 [ %indvars.iv.next31, %.lr.ph2 ], [ 0, %.lr.ph2.preheader ]
  %72 = getelementptr inbounds double, double* %36, i64 %indvars.iv30
  %73 = load double, double* %72, align 8
  %74 = getelementptr inbounds [2100 x double], [2100 x double]* %34, i64 %indvars.iv32, i64 %indvars.iv30
  %75 = load double, double* %74, align 8
  %76 = load double, double* %sunkaddr56, align 8
  %77 = fmul double %75, %76
  %78 = fadd double %73, %77
  %79 = getelementptr inbounds double, double* %36, i64 %indvars.iv30
  store double %78, double* %79, align 8
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv30, 1
  %80 = icmp slt i64 %indvars.iv.next31, %41
  br i1 %80, label %.lr.ph2, label %._crit_edge3.loopexit

._crit_edge3.loopexit:                            ; preds = %.lr.ph2
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit, %._crit_edge, %._crit_edge3._crit_edge
  %indvars.iv.next33 = add nsw i64 %indvars.iv32, 1
  %81 = icmp slt i64 %indvars.iv.next33, %43
  br i1 %81, label %._crit_edge3._crit_edge, label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge3
  %82 = trunc i64 %indvars.iv.next33 to i32
  store i32 %82, i32* %13, align 4
  br label %._crit_edge62

._crit_edge62:                                    ; preds = %._crit_edge60, %._crit_edge6
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
