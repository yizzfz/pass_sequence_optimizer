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
define internal void @init_array(i32, i32, [2100 x double]*, double* nocapture) #2 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca [2100 x double]*, align 8
  store i32 %0, i32* %5, align 4
  store i32 %1, i32* %6, align 4
  store [2100 x double]* %2, [2100 x double]** %7, align 8
  %8 = sitofp i32 %1 to double
  %9 = sext i32 %1 to i64
  %10 = icmp sgt i32 %1, 0
  br i1 %10, label %.lr.ph17.preheader, label %.preheader3

.lr.ph17.preheader:                               ; preds = %4
  %xtraiter22 = and i64 %9, 1
  %lcmp.mod23 = icmp eq i64 %xtraiter22, 0
  br i1 %lcmp.mod23, label %.lr.ph17.prol.loopexit, label %.lr.ph17.prol

.lr.ph17.prol:                                    ; preds = %.lr.ph17.preheader
  %11 = fdiv double 0.000000e+00, %8
  %12 = fadd double %11, 1.000000e+00
  store double %12, double* %3, align 8
  br label %.lr.ph17.prol.loopexit

.lr.ph17.prol.loopexit:                           ; preds = %.lr.ph17.preheader, %.lr.ph17.prol
  %indvars.iv915.unr = phi i64 [ 0, %.lr.ph17.preheader ], [ 1, %.lr.ph17.prol ]
  %13 = icmp eq i32 %1, 1
  br i1 %13, label %.preheader3, label %.lr.ph17.preheader.new

.lr.ph17.preheader.new:                           ; preds = %.lr.ph17.prol.loopexit
  br label %.lr.ph17

.preheader3.loopexit:                             ; preds = %.lr.ph17
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3.loopexit, %.lr.ph17.prol.loopexit, %4
  %14 = load i32, i32* %5, align 4
  %15 = load i32, i32* %6, align 4
  %16 = mul nsw i32 %14, 5
  %17 = sitofp i32 %16 to double
  %18 = load [2100 x double]*, [2100 x double]** %7, align 8
  %19 = sext i32 %15 to i64
  %20 = sext i32 %14 to i64
  %21 = icmp sgt i32 %14, 0
  br i1 %21, label %.preheader.preheader, label %.preheader3._crit_edge

.preheader.preheader:                             ; preds = %.preheader3
  %22 = icmp sgt i32 %15, 0
  %xtraiter = and i64 %19, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %23 = icmp eq i32 %15, 1
  br label %.preheader

.lr.ph17:                                         ; preds = %.lr.ph17, %.lr.ph17.preheader.new
  %indvars.iv915 = phi i64 [ %indvars.iv915.unr, %.lr.ph17.preheader.new ], [ %indvars.iv.next10.1, %.lr.ph17 ]
  %24 = trunc i64 %indvars.iv915 to i32
  %25 = sitofp i32 %24 to double
  %26 = getelementptr inbounds double, double* %3, i64 %indvars.iv915
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv915, 1
  %27 = trunc i64 %indvars.iv.next10 to i32
  %28 = sitofp i32 %27 to double
  %29 = insertelement <2 x double> undef, double %8, i32 0
  %30 = insertelement <2 x double> %29, double %8, i32 1
  %31 = insertelement <2 x double> undef, double %25, i32 0
  %32 = insertelement <2 x double> %31, double %28, i32 1
  %33 = fdiv <2 x double> %32, %30
  %34 = fadd <2 x double> %33, <double 1.000000e+00, double 1.000000e+00>
  %35 = bitcast double* %26 to <2 x double>*
  store <2 x double> %34, <2 x double>* %35, align 8
  %indvars.iv.next10.1 = add nsw i64 %indvars.iv915, 2
  %exitcond18.1 = icmp eq i64 %indvars.iv.next10.1, %9
  br i1 %exitcond18.1, label %.preheader3.loopexit, label %.lr.ph17

.preheader:                                       ; preds = %.preheader.preheader, %.preheader._crit_edge
  %indvars.iv712 = phi i64 [ %indvars.iv.next8, %.preheader._crit_edge ], [ 0, %.preheader.preheader ]
  br i1 %22, label %.lr.ph.preheader, label %.preheader._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %36 = trunc i64 %indvars.iv712 to i32
  %37 = srem i32 %36, %15
  %38 = sitofp i32 %37 to double
  %39 = fdiv double %38, %17
  %40 = getelementptr inbounds [2100 x double], [2100 x double]* %18, i64 %indvars.iv712, i64 0
  store double %39, double* %40, align 8
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol, %.lr.ph.preheader
  %indvars.iv11.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader ]
  br i1 %23, label %.preheader._crit_edge, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %indvars.iv11 = phi i64 [ %indvars.iv11.unr.ph, %.lr.ph.preheader.new ], [ %indvars.iv.next.1, %.lr.ph ]
  %41 = add nuw nsw i64 %indvars.iv712, %indvars.iv11
  %42 = trunc i64 %41 to i32
  %43 = srem i32 %42, %15
  %44 = sitofp i32 %43 to double
  %45 = getelementptr inbounds [2100 x double], [2100 x double]* %18, i64 %indvars.iv712, i64 %indvars.iv11
  %indvars.iv.next = add nuw nsw i64 %indvars.iv11, 1
  %46 = add nuw nsw i64 %indvars.iv712, %indvars.iv.next
  %47 = trunc i64 %46 to i32
  %48 = srem i32 %47, %15
  %49 = sitofp i32 %48 to double
  %50 = insertelement <2 x double> undef, double %17, i32 0
  %51 = insertelement <2 x double> %50, double %17, i32 1
  %52 = insertelement <2 x double> undef, double %44, i32 0
  %53 = insertelement <2 x double> %52, double %49, i32 1
  %54 = fdiv <2 x double> %53, %51
  %55 = bitcast double* %45 to <2 x double>*
  store <2 x double> %54, <2 x double>* %55, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv11, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %19
  br i1 %exitcond.1, label %.preheader._crit_edge.loopexit, label %.lr.ph

.preheader._crit_edge.loopexit:                   ; preds = %.lr.ph
  br label %.preheader._crit_edge

.preheader._crit_edge:                            ; preds = %.preheader._crit_edge.loopexit, %.lr.ph.prol.loopexit, %.preheader
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv712, 1
  %56 = icmp slt i64 %indvars.iv.next8, %20
  br i1 %56, label %.preheader, label %.preheader3._crit_edge.loopexit

.preheader3._crit_edge.loopexit:                  ; preds = %.preheader._crit_edge
  br label %.preheader3._crit_edge

.preheader3._crit_edge:                           ; preds = %.preheader3._crit_edge.loopexit, %.preheader3
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
  store i32 %0, i32* %7, align 4
  store i32 %1, i32* %8, align 4
  store [2100 x double]* %2, [2100 x double]** %9, align 8
  store double* %3, double** %10, align 8
  store double* %4, double** %11, align 8
  store double* %5, double** %12, align 8
  %13 = sext i32 %1 to i64
  %14 = icmp sgt i32 %1, 0
  br i1 %14, label %.lr.ph35.preheader, label %.preheader4

.lr.ph35.preheader:                               ; preds = %6
  %15 = add nsw i64 %13, -1
  %xtraiter46 = and i64 %13, 7
  %lcmp.mod47 = icmp eq i64 %xtraiter46, 0
  br i1 %lcmp.mod47, label %.lr.ph35.prol.loopexit, label %.lr.ph35.prol.preheader

.lr.ph35.prol.preheader:                          ; preds = %.lr.ph35.preheader
  br label %.lr.ph35.prol

.lr.ph35.prol:                                    ; preds = %.lr.ph35.prol, %.lr.ph35.prol.preheader
  %indvars.iv2333.prol = phi i64 [ %indvars.iv.next24.prol, %.lr.ph35.prol ], [ 0, %.lr.ph35.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph35.prol ], [ %xtraiter46, %.lr.ph35.prol.preheader ]
  %16 = getelementptr inbounds double, double* %4, i64 %indvars.iv2333.prol
  store double 0.000000e+00, double* %16, align 8
  %indvars.iv.next24.prol = add nuw nsw i64 %indvars.iv2333.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph35.prol.loopexit.loopexit, label %.lr.ph35.prol, !llvm.loop !1

.lr.ph35.prol.loopexit.loopexit:                  ; preds = %.lr.ph35.prol
  br label %.lr.ph35.prol.loopexit

.lr.ph35.prol.loopexit:                           ; preds = %.lr.ph35.prol.loopexit.loopexit, %.lr.ph35.preheader
  %indvars.iv2333.unr = phi i64 [ 0, %.lr.ph35.preheader ], [ %indvars.iv.next24.prol, %.lr.ph35.prol.loopexit.loopexit ]
  %17 = icmp ult i64 %15, 7
  br i1 %17, label %.preheader4, label %.lr.ph35.preheader.new

.lr.ph35.preheader.new:                           ; preds = %.lr.ph35.prol.loopexit
  br label %.lr.ph35

.preheader4.loopexit:                             ; preds = %.lr.ph35
  br label %.preheader4

.preheader4:                                      ; preds = %.preheader4.loopexit, %.lr.ph35.prol.loopexit, %6
  %18 = load i32, i32* %7, align 4
  %19 = load double*, double** %12, align 8
  %20 = load i32, i32* %8, align 4
  %21 = load [2100 x double]*, [2100 x double]** %9, align 8
  %22 = load double*, double** %10, align 8
  %23 = load double*, double** %11, align 8
  %24 = sext i32 %20 to i64
  %25 = sext i32 %18 to i64
  %26 = icmp sgt i32 %18, 0
  br i1 %26, label %.lr.ph31.preheader, label %.preheader4._crit_edge

.lr.ph31.preheader:                               ; preds = %.preheader4
  %27 = add nsw i64 %24, -1
  %28 = icmp sgt i32 %20, 0
  %xtraiter = and i64 %24, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %29 = icmp eq i64 %27, 0
  %sunkaddr = ptrtoint double* %19 to i64
  %sunkaddr11 = ptrtoint double* %19 to i64
  %sunkaddr.1 = ptrtoint double* %19 to i64
  %sunkaddr11.1 = ptrtoint double* %19 to i64
  %sunkaddr.prol = ptrtoint double* %19 to i64
  %sunkaddr11.prol = ptrtoint double* %19 to i64
  %30 = icmp sgt i32 %20, 0
  %xtraiter44 = and i64 %24, 1
  %lcmp.mod45 = icmp eq i64 %xtraiter44, 0
  %31 = icmp eq i64 %27, 0
  %sunkaddr15 = ptrtoint double* %19 to i64
  %sunkaddr15.1 = ptrtoint double* %19 to i64
  %sunkaddr15.prol = ptrtoint double* %19 to i64
  br label %.lr.ph31

.lr.ph35:                                         ; preds = %.lr.ph35, %.lr.ph35.preheader.new
  %indvars.iv2333 = phi i64 [ %indvars.iv2333.unr, %.lr.ph35.preheader.new ], [ %indvars.iv.next24.7, %.lr.ph35 ]
  %32 = getelementptr inbounds double, double* %4, i64 %indvars.iv2333
  store double 0.000000e+00, double* %32, align 8
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv2333, 1
  %33 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next24
  store double 0.000000e+00, double* %33, align 8
  %indvars.iv.next24.1 = add nsw i64 %indvars.iv2333, 2
  %34 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next24.1
  store double 0.000000e+00, double* %34, align 8
  %indvars.iv.next24.2 = add nsw i64 %indvars.iv2333, 3
  %35 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next24.2
  store double 0.000000e+00, double* %35, align 8
  %indvars.iv.next24.3 = add nsw i64 %indvars.iv2333, 4
  %36 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next24.3
  store double 0.000000e+00, double* %36, align 8
  %indvars.iv.next24.4 = add nsw i64 %indvars.iv2333, 5
  %37 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next24.4
  store double 0.000000e+00, double* %37, align 8
  %indvars.iv.next24.5 = add nsw i64 %indvars.iv2333, 6
  %38 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next24.5
  store double 0.000000e+00, double* %38, align 8
  %indvars.iv.next24.6 = add nsw i64 %indvars.iv2333, 7
  %39 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next24.6
  store double 0.000000e+00, double* %39, align 8
  %indvars.iv.next24.7 = add nsw i64 %indvars.iv2333, 8
  %exitcond37.7 = icmp eq i64 %indvars.iv.next24.7, %13
  br i1 %exitcond37.7, label %.preheader4.loopexit, label %.lr.ph35

.lr.ph31:                                         ; preds = %.lr.ph31.preheader, %.preheader._crit_edge
  %indvars.iv2128 = phi i64 [ %indvars.iv.next22, %.preheader._crit_edge ], [ 0, %.lr.ph31.preheader ]
  %40 = getelementptr inbounds double, double* %19, i64 %indvars.iv2128
  store double 0.000000e+00, double* %40, align 8
  br i1 %28, label %.lr.ph.preheader, label %.preheader

.lr.ph.preheader:                                 ; preds = %.lr.ph31
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %sunkaddr8.prol = shl nuw nsw i64 %indvars.iv2128, 3
  %sunkaddr9.prol = add i64 %sunkaddr.prol, %sunkaddr8.prol
  %sunkaddr10.prol = inttoptr i64 %sunkaddr9.prol to double*
  %41 = load double, double* %sunkaddr10.prol, align 8
  %42 = getelementptr inbounds [2100 x double], [2100 x double]* %21, i64 %indvars.iv2128, i64 0
  %43 = load double, double* %42, align 8
  %44 = load double, double* %22, align 8
  %45 = fmul double %43, %44
  %46 = fadd double %41, %45
  %sunkaddr12.prol = shl nuw nsw i64 %indvars.iv2128, 3
  %sunkaddr13.prol = add i64 %sunkaddr11.prol, %sunkaddr12.prol
  %sunkaddr14.prol = inttoptr i64 %sunkaddr13.prol to double*
  store double %46, double* %sunkaddr14.prol, align 8
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol, %.lr.ph.preheader
  %indvars.iv25.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader ]
  br i1 %29, label %.preheader, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  %sunkaddr8 = shl nuw nsw i64 %indvars.iv2128, 3
  %sunkaddr9 = add i64 %sunkaddr, %sunkaddr8
  %sunkaddr10 = inttoptr i64 %sunkaddr9 to double*
  %sunkaddr12 = shl nuw nsw i64 %indvars.iv2128, 3
  %sunkaddr13 = add i64 %sunkaddr11, %sunkaddr12
  %sunkaddr14 = inttoptr i64 %sunkaddr13 to double*
  %sunkaddr8.1 = shl nuw nsw i64 %indvars.iv2128, 3
  %sunkaddr9.1 = add i64 %sunkaddr.1, %sunkaddr8.1
  %sunkaddr10.1 = inttoptr i64 %sunkaddr9.1 to double*
  %sunkaddr12.1 = shl nuw nsw i64 %indvars.iv2128, 3
  %sunkaddr13.1 = add i64 %sunkaddr11.1, %sunkaddr12.1
  %sunkaddr14.1 = inttoptr i64 %sunkaddr13.1 to double*
  br label %.lr.ph

.preheader.loopexit:                              ; preds = %.lr.ph
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.lr.ph.prol.loopexit, %.lr.ph31
  br i1 %30, label %.lr.ph27.preheader, label %.preheader._crit_edge

.lr.ph27.preheader:                               ; preds = %.preheader
  br i1 %lcmp.mod45, label %.lr.ph27.prol.loopexit, label %.lr.ph27.prol

.lr.ph27.prol:                                    ; preds = %.lr.ph27.preheader
  %47 = load double, double* %23, align 8
  %48 = getelementptr inbounds [2100 x double], [2100 x double]* %21, i64 %indvars.iv2128, i64 0
  %49 = load double, double* %48, align 8
  %sunkaddr16.prol = shl nuw nsw i64 %indvars.iv2128, 3
  %sunkaddr17.prol = add i64 %sunkaddr15.prol, %sunkaddr16.prol
  %sunkaddr18.prol = inttoptr i64 %sunkaddr17.prol to double*
  %50 = load double, double* %sunkaddr18.prol, align 8
  %51 = fmul double %49, %50
  %52 = fadd double %47, %51
  store double %52, double* %23, align 8
  br label %.lr.ph27.prol.loopexit

.lr.ph27.prol.loopexit:                           ; preds = %.lr.ph27.prol, %.lr.ph27.preheader
  %indvars.iv1926.unr.ph = phi i64 [ 1, %.lr.ph27.prol ], [ 0, %.lr.ph27.preheader ]
  br i1 %31, label %.preheader._crit_edge, label %.lr.ph27.preheader.new

.lr.ph27.preheader.new:                           ; preds = %.lr.ph27.prol.loopexit
  %sunkaddr16 = shl nuw nsw i64 %indvars.iv2128, 3
  %sunkaddr17 = add i64 %sunkaddr15, %sunkaddr16
  %sunkaddr18 = inttoptr i64 %sunkaddr17 to double*
  %sunkaddr16.1 = shl nuw nsw i64 %indvars.iv2128, 3
  %sunkaddr17.1 = add i64 %sunkaddr15.1, %sunkaddr16.1
  %sunkaddr18.1 = inttoptr i64 %sunkaddr17.1 to double*
  br label %.lr.ph27

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %indvars.iv25 = phi i64 [ %indvars.iv25.unr.ph, %.lr.ph.preheader.new ], [ %indvars.iv.next.1, %.lr.ph ]
  %53 = load double, double* %sunkaddr10, align 8
  %54 = getelementptr inbounds [2100 x double], [2100 x double]* %21, i64 %indvars.iv2128, i64 %indvars.iv25
  %55 = load double, double* %54, align 8
  %56 = getelementptr inbounds double, double* %22, i64 %indvars.iv25
  %57 = load double, double* %56, align 8
  %58 = fmul double %55, %57
  %59 = fadd double %53, %58
  store double %59, double* %sunkaddr14, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv25, 1
  %60 = load double, double* %sunkaddr10.1, align 8
  %61 = getelementptr inbounds [2100 x double], [2100 x double]* %21, i64 %indvars.iv2128, i64 %indvars.iv.next
  %62 = load double, double* %61, align 8
  %63 = getelementptr inbounds double, double* %22, i64 %indvars.iv.next
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = fadd double %60, %65
  store double %66, double* %sunkaddr14.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv25, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %24
  br i1 %exitcond.1, label %.preheader.loopexit, label %.lr.ph

.lr.ph27:                                         ; preds = %.lr.ph27, %.lr.ph27.preheader.new
  %indvars.iv1926 = phi i64 [ %indvars.iv1926.unr.ph, %.lr.ph27.preheader.new ], [ %indvars.iv.next20.1, %.lr.ph27 ]
  %67 = getelementptr inbounds double, double* %23, i64 %indvars.iv1926
  %68 = load double, double* %67, align 8
  %69 = getelementptr inbounds [2100 x double], [2100 x double]* %21, i64 %indvars.iv2128, i64 %indvars.iv1926
  %70 = load double, double* %69, align 8
  %71 = load double, double* %sunkaddr18, align 8
  %72 = fmul double %70, %71
  %73 = fadd double %68, %72
  %74 = getelementptr inbounds double, double* %23, i64 %indvars.iv1926
  store double %73, double* %74, align 8
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv1926, 1
  %75 = getelementptr inbounds double, double* %23, i64 %indvars.iv.next20
  %76 = load double, double* %75, align 8
  %77 = getelementptr inbounds [2100 x double], [2100 x double]* %21, i64 %indvars.iv2128, i64 %indvars.iv.next20
  %78 = load double, double* %77, align 8
  %79 = load double, double* %sunkaddr18.1, align 8
  %80 = fmul double %78, %79
  %81 = fadd double %76, %80
  %82 = getelementptr inbounds double, double* %23, i64 %indvars.iv.next20
  store double %81, double* %82, align 8
  %indvars.iv.next20.1 = add nsw i64 %indvars.iv1926, 2
  %exitcond36.1 = icmp eq i64 %indvars.iv.next20.1, %24
  br i1 %exitcond36.1, label %.preheader._crit_edge.loopexit, label %.lr.ph27

.preheader._crit_edge.loopexit:                   ; preds = %.lr.ph27
  br label %.preheader._crit_edge

.preheader._crit_edge:                            ; preds = %.preheader._crit_edge.loopexit, %.lr.ph27.prol.loopexit, %.preheader
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv2128, 1
  %83 = icmp slt i64 %indvars.iv.next22, %25
  br i1 %83, label %.lr.ph31, label %.preheader4._crit_edge.loopexit

.preheader4._crit_edge.loopexit:                  ; preds = %.preheader._crit_edge
  br label %.preheader4._crit_edge

.preheader4._crit_edge:                           ; preds = %.preheader4._crit_edge.loopexit, %.preheader4
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, double* nocapture readonly) #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %7 = sext i32 %0 to i64
  %8 = icmp sgt i32 %0, 0
  br i1 %8, label %.lr.ph.preheader, label %._crit_edge2

.lr.ph.preheader:                                 ; preds = %2
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph.preheader, %._crit_edge3
  %indvars.iv1 = phi i64 [ %indvars.iv.next, %._crit_edge3 ], [ 0, %.lr.ph.preheader ]
  %9 = trunc i64 %indvars.iv1 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge3

; <label>:12:                                     ; preds = %.lr.ph
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %.lr.ph, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds double, double* %1, i64 %indvars.iv1
  %16 = load double, double* %15, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv1, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %7
  br i1 %exitcond, label %._crit_edge2.loopexit, label %.lr.ph

._crit_edge2.loopexit:                            ; preds = %._crit_edge3
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2.loopexit, %2
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
