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
define internal fastcc void @init_array(i32, i32, [2100 x double]*, double* nocapture) unnamed_addr #2 {
  %5 = alloca i32, align 4
  %6 = alloca i32, align 4
  %7 = alloca [2100 x double]*, align 8
  store i32 %0, i32* %5, align 4
  store i32 %1, i32* %6, align 4
  store [2100 x double]* %2, [2100 x double]** %7, align 8
  %8 = sitofp i32 %1 to double
  %9 = sext i32 %1 to i64
  %10 = icmp sgt i32 %1, 0
  br i1 %10, label %.lr.ph15.preheader, label %._crit_edge18

.lr.ph15.preheader:                               ; preds = %4
  %xtraiter22 = and i64 %9, 1
  %lcmp.mod23 = icmp eq i64 %xtraiter22, 0
  br i1 %lcmp.mod23, label %.lr.ph15.prol.loopexit, label %.lr.ph15.prol

.lr.ph15.prol:                                    ; preds = %.lr.ph15.preheader
  %11 = fdiv double 0.000000e+00, %8
  %12 = fadd double %11, 1.000000e+00
  store double %12, double* %3, align 8
  br label %.lr.ph15.prol.loopexit

.lr.ph15.prol.loopexit:                           ; preds = %.lr.ph15.preheader, %.lr.ph15.prol
  %indvars.iv813.unr = phi i64 [ 0, %.lr.ph15.preheader ], [ 1, %.lr.ph15.prol ]
  %13 = icmp eq i32 %1, 1
  br i1 %13, label %._crit_edge18, label %.lr.ph15.preheader.new

.lr.ph15.preheader.new:                           ; preds = %.lr.ph15.prol.loopexit
  br label %.lr.ph15

.lr.ph15:                                         ; preds = %.lr.ph15, %.lr.ph15.preheader.new
  %indvars.iv813 = phi i64 [ %indvars.iv813.unr, %.lr.ph15.preheader.new ], [ %indvars.iv.next9.1, %.lr.ph15 ]
  %14 = trunc i64 %indvars.iv813 to i32
  %15 = sitofp i32 %14 to double
  %16 = getelementptr inbounds double, double* %3, i64 %indvars.iv813
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv813, 1
  %17 = trunc i64 %indvars.iv.next9 to i32
  %18 = sitofp i32 %17 to double
  %19 = insertelement <2 x double> undef, double %8, i32 0
  %20 = insertelement <2 x double> %19, double %8, i32 1
  %21 = insertelement <2 x double> undef, double %15, i32 0
  %22 = insertelement <2 x double> %21, double %18, i32 1
  %23 = fdiv <2 x double> %22, %20
  %24 = fadd <2 x double> %23, <double 1.000000e+00, double 1.000000e+00>
  %25 = bitcast double* %16 to <2 x double>*
  store <2 x double> %24, <2 x double>* %25, align 8
  %indvars.iv.next9.1 = add nsw i64 %indvars.iv813, 2
  %exitcond17.1 = icmp eq i64 %indvars.iv.next9.1, %9
  br i1 %exitcond17.1, label %._crit_edge18.loopexit, label %.lr.ph15

._crit_edge18.loopexit:                           ; preds = %.lr.ph15
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge18.loopexit, %.lr.ph15.prol.loopexit, %4
  %26 = load i32, i32* %5, align 4
  %27 = load i32, i32* %6, align 4
  %28 = mul nsw i32 %26, 5
  %29 = sitofp i32 %28 to double
  %30 = load [2100 x double]*, [2100 x double]** %7, align 8
  %31 = sext i32 %27 to i64
  %32 = sext i32 %26 to i64
  %33 = icmp sgt i32 %26, 0
  br i1 %33, label %.preheader.preheader.preheader, label %._crit_edge20

.preheader.preheader.preheader:                   ; preds = %._crit_edge18
  %34 = icmp sgt i32 %27, 0
  %xtraiter = and i64 %31, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %35 = icmp eq i32 %27, 1
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.preheader, %.preheader.preheader._crit_edge
  %indvars.iv611 = phi i64 [ %indvars.iv.next7, %.preheader.preheader._crit_edge ], [ 0, %.preheader.preheader.preheader ]
  br i1 %34, label %.preheader.preheader21, label %.preheader.preheader._crit_edge

.preheader.preheader21:                           ; preds = %.preheader.preheader
  br i1 %lcmp.mod, label %.preheader.prol.loopexit, label %.preheader.prol

.preheader.prol:                                  ; preds = %.preheader.preheader21
  %36 = trunc i64 %indvars.iv611 to i32
  %37 = srem i32 %36, %27
  %38 = sitofp i32 %37 to double
  %39 = fdiv double %38, %29
  %40 = getelementptr inbounds [2100 x double], [2100 x double]* %30, i64 %indvars.iv611, i64 0
  store double %39, double* %40, align 8
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %.preheader.prol, %.preheader.preheader21
  %indvars.iv10.unr.ph = phi i64 [ 1, %.preheader.prol ], [ 0, %.preheader.preheader21 ]
  br i1 %35, label %.preheader.preheader._crit_edge, label %.preheader.preheader21.new

.preheader.preheader21.new:                       ; preds = %.preheader.prol.loopexit
  br label %.preheader

.preheader:                                       ; preds = %.preheader, %.preheader.preheader21.new
  %indvars.iv10 = phi i64 [ %indvars.iv10.unr.ph, %.preheader.preheader21.new ], [ %indvars.iv.next.1, %.preheader ]
  %41 = add nuw nsw i64 %indvars.iv611, %indvars.iv10
  %42 = trunc i64 %41 to i32
  %43 = srem i32 %42, %27
  %44 = sitofp i32 %43 to double
  %45 = getelementptr inbounds [2100 x double], [2100 x double]* %30, i64 %indvars.iv611, i64 %indvars.iv10
  %indvars.iv.next = add nuw nsw i64 %indvars.iv10, 1
  %46 = add nuw nsw i64 %indvars.iv611, %indvars.iv.next
  %47 = trunc i64 %46 to i32
  %48 = srem i32 %47, %27
  %49 = sitofp i32 %48 to double
  %50 = insertelement <2 x double> undef, double %29, i32 0
  %51 = insertelement <2 x double> %50, double %29, i32 1
  %52 = insertelement <2 x double> undef, double %44, i32 0
  %53 = insertelement <2 x double> %52, double %49, i32 1
  %54 = fdiv <2 x double> %53, %51
  %55 = bitcast double* %45 to <2 x double>*
  store <2 x double> %54, <2 x double>* %55, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv10, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %31
  br i1 %exitcond.1, label %.preheader.preheader._crit_edge.loopexit, label %.preheader

.preheader.preheader._crit_edge.loopexit:         ; preds = %.preheader
  br label %.preheader.preheader._crit_edge

.preheader.preheader._crit_edge:                  ; preds = %.preheader.preheader._crit_edge.loopexit, %.preheader.prol.loopexit, %.preheader.preheader
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv611, 1
  %56 = icmp slt i64 %indvars.iv.next7, %32
  br i1 %56, label %.preheader.preheader, label %._crit_edge20.loopexit

._crit_edge20.loopexit:                           ; preds = %.preheader.preheader._crit_edge
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge20.loopexit, %._crit_edge18
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
  store i32 %0, i32* %7, align 4
  store i32 %1, i32* %8, align 4
  store [2100 x double]* %2, [2100 x double]** %9, align 8
  store double* %3, double** %10, align 8
  store double* %4, double** %11, align 8
  store double* %5, double** %12, align 8
  %13 = sext i32 %1 to i64
  %14 = icmp sgt i32 %1, 0
  br i1 %14, label %.lr.ph37.preheader, label %._crit_edge41

.lr.ph37.preheader:                               ; preds = %6
  %15 = add nsw i64 %13, -1
  %xtraiter50 = and i64 %13, 7
  %lcmp.mod51 = icmp eq i64 %xtraiter50, 0
  br i1 %lcmp.mod51, label %.lr.ph37.prol.loopexit, label %.lr.ph37.prol.preheader

.lr.ph37.prol.preheader:                          ; preds = %.lr.ph37.preheader
  br label %.lr.ph37.prol

.lr.ph37.prol:                                    ; preds = %.lr.ph37.prol, %.lr.ph37.prol.preheader
  %indvars.iv1135.prol = phi i64 [ %indvars.iv.next12.prol, %.lr.ph37.prol ], [ 0, %.lr.ph37.prol.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph37.prol ], [ %xtraiter50, %.lr.ph37.prol.preheader ]
  %16 = getelementptr inbounds double, double* %4, i64 %indvars.iv1135.prol
  store double 0.000000e+00, double* %16, align 8
  %indvars.iv.next12.prol = add nuw nsw i64 %indvars.iv1135.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph37.prol.loopexit.loopexit, label %.lr.ph37.prol, !llvm.loop !1

.lr.ph37.prol.loopexit.loopexit:                  ; preds = %.lr.ph37.prol
  br label %.lr.ph37.prol.loopexit

.lr.ph37.prol.loopexit:                           ; preds = %.lr.ph37.prol.loopexit.loopexit, %.lr.ph37.preheader
  %indvars.iv1135.unr = phi i64 [ 0, %.lr.ph37.preheader ], [ %indvars.iv.next12.prol, %.lr.ph37.prol.loopexit.loopexit ]
  %17 = icmp ult i64 %15, 7
  br i1 %17, label %._crit_edge41, label %.lr.ph37.preheader.new

.lr.ph37.preheader.new:                           ; preds = %.lr.ph37.prol.loopexit
  br label %.lr.ph37

.lr.ph37:                                         ; preds = %.lr.ph37, %.lr.ph37.preheader.new
  %indvars.iv1135 = phi i64 [ %indvars.iv1135.unr, %.lr.ph37.preheader.new ], [ %indvars.iv.next12.7, %.lr.ph37 ]
  %18 = getelementptr inbounds double, double* %4, i64 %indvars.iv1135
  store double 0.000000e+00, double* %18, align 8
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv1135, 1
  %19 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next12
  store double 0.000000e+00, double* %19, align 8
  %indvars.iv.next12.1 = add nsw i64 %indvars.iv1135, 2
  %20 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next12.1
  store double 0.000000e+00, double* %20, align 8
  %indvars.iv.next12.2 = add nsw i64 %indvars.iv1135, 3
  %21 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next12.2
  store double 0.000000e+00, double* %21, align 8
  %indvars.iv.next12.3 = add nsw i64 %indvars.iv1135, 4
  %22 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next12.3
  store double 0.000000e+00, double* %22, align 8
  %indvars.iv.next12.4 = add nsw i64 %indvars.iv1135, 5
  %23 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next12.4
  store double 0.000000e+00, double* %23, align 8
  %indvars.iv.next12.5 = add nsw i64 %indvars.iv1135, 6
  %24 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next12.5
  store double 0.000000e+00, double* %24, align 8
  %indvars.iv.next12.6 = add nsw i64 %indvars.iv1135, 7
  %25 = getelementptr inbounds double, double* %4, i64 %indvars.iv.next12.6
  store double 0.000000e+00, double* %25, align 8
  %indvars.iv.next12.7 = add nsw i64 %indvars.iv1135, 8
  %exitcond40.7 = icmp eq i64 %indvars.iv.next12.7, %13
  br i1 %exitcond40.7, label %._crit_edge41.loopexit, label %.lr.ph37

._crit_edge41.loopexit:                           ; preds = %.lr.ph37
  br label %._crit_edge41

._crit_edge41:                                    ; preds = %._crit_edge41.loopexit, %.lr.ph37.prol.loopexit, %6
  %26 = load i32, i32* %7, align 4
  %27 = load double*, double** %12, align 8
  %28 = load i32, i32* %8, align 4
  %29 = load [2100 x double]*, [2100 x double]** %9, align 8
  %30 = load double*, double** %10, align 8
  %31 = load double*, double** %11, align 8
  %32 = sext i32 %28 to i64
  %33 = sext i32 %26 to i64
  %34 = icmp sgt i32 %26, 0
  br i1 %34, label %.lr.ph33.preheader, label %._crit_edge43

.lr.ph33.preheader:                               ; preds = %._crit_edge41
  %35 = add nsw i64 %32, -1
  %36 = icmp sgt i32 %28, 0
  %xtraiter = and i64 %32, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %37 = icmp eq i64 %35, 0
  %sunkaddr = ptrtoint double* %27 to i64
  %sunkaddr.1 = ptrtoint double* %27 to i64
  %sunkaddr.prol = ptrtoint double* %27 to i64
  %38 = icmp sgt i32 %28, 0
  %xtraiter48 = and i64 %32, 1
  %lcmp.mod49 = icmp eq i64 %xtraiter48, 0
  %39 = icmp eq i64 %35, 0
  %sunkaddr23 = ptrtoint double* %27 to i64
  %sunkaddr23.1 = ptrtoint double* %27 to i64
  %sunkaddr23.prol = ptrtoint double* %27 to i64
  br label %.lr.ph33

.lr.ph33:                                         ; preds = %.lr.ph33.preheader, %.preheader._crit_edge
  %indvars.iv930 = phi i64 [ %indvars.iv.next10, %.preheader._crit_edge ], [ 0, %.lr.ph33.preheader ]
  %40 = getelementptr inbounds double, double* %27, i64 %indvars.iv930
  store double 0.000000e+00, double* %40, align 8
  br i1 %36, label %.lr.ph.preheader, label %.preheader

.lr.ph.preheader:                                 ; preds = %.lr.ph33
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit, label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.preheader
  %sunkaddr20.prol = shl nuw nsw i64 %indvars.iv930, 3
  %sunkaddr21.prol = add i64 %sunkaddr.prol, %sunkaddr20.prol
  %sunkaddr22.prol = inttoptr i64 %sunkaddr21.prol to double*
  %41 = load double, double* %sunkaddr22.prol, align 8
  %42 = getelementptr inbounds [2100 x double], [2100 x double]* %29, i64 %indvars.iv930, i64 0
  %43 = load double, double* %42, align 8
  %44 = load double, double* %30, align 8
  %45 = fmul double %43, %44
  %46 = fadd double %41, %45
  store double %46, double* %sunkaddr22.prol, align 8
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol, %.lr.ph.preheader
  %indvars.iv27.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader ]
  br i1 %37, label %.preheader, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  %sunkaddr20 = shl nuw nsw i64 %indvars.iv930, 3
  %sunkaddr21 = add i64 %sunkaddr, %sunkaddr20
  %sunkaddr22 = inttoptr i64 %sunkaddr21 to double*
  %sunkaddr20.1 = shl nuw nsw i64 %indvars.iv930, 3
  %sunkaddr21.1 = add i64 %sunkaddr.1, %sunkaddr20.1
  %sunkaddr22.1 = inttoptr i64 %sunkaddr21.1 to double*
  br label %.lr.ph

.preheader.loopexit:                              ; preds = %.lr.ph
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %.lr.ph.prol.loopexit, %.lr.ph33
  br i1 %38, label %.lr.ph29.preheader, label %.preheader._crit_edge

.lr.ph29.preheader:                               ; preds = %.preheader
  br i1 %lcmp.mod49, label %.lr.ph29.prol.loopexit, label %.lr.ph29.prol

.lr.ph29.prol:                                    ; preds = %.lr.ph29.preheader
  %47 = load double, double* %31, align 8
  %48 = getelementptr inbounds [2100 x double], [2100 x double]* %29, i64 %indvars.iv930, i64 0
  %49 = load double, double* %48, align 8
  %sunkaddr24.prol = shl nuw nsw i64 %indvars.iv930, 3
  %sunkaddr25.prol = add i64 %sunkaddr23.prol, %sunkaddr24.prol
  %sunkaddr26.prol = inttoptr i64 %sunkaddr25.prol to double*
  %50 = load double, double* %sunkaddr26.prol, align 8
  %51 = fmul double %49, %50
  %52 = fadd double %47, %51
  store double %52, double* %31, align 8
  br label %.lr.ph29.prol.loopexit

.lr.ph29.prol.loopexit:                           ; preds = %.lr.ph29.prol, %.lr.ph29.preheader
  %indvars.iv728.unr.ph = phi i64 [ 1, %.lr.ph29.prol ], [ 0, %.lr.ph29.preheader ]
  br i1 %39, label %.preheader._crit_edge, label %.lr.ph29.preheader.new

.lr.ph29.preheader.new:                           ; preds = %.lr.ph29.prol.loopexit
  %sunkaddr24 = shl nuw nsw i64 %indvars.iv930, 3
  %sunkaddr25 = add i64 %sunkaddr23, %sunkaddr24
  %sunkaddr26 = inttoptr i64 %sunkaddr25 to double*
  %sunkaddr24.1 = shl nuw nsw i64 %indvars.iv930, 3
  %sunkaddr25.1 = add i64 %sunkaddr23.1, %sunkaddr24.1
  %sunkaddr26.1 = inttoptr i64 %sunkaddr25.1 to double*
  br label %.lr.ph29

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %indvars.iv27 = phi i64 [ %indvars.iv27.unr.ph, %.lr.ph.preheader.new ], [ %indvars.iv.next.1, %.lr.ph ]
  %53 = load double, double* %sunkaddr22, align 8
  %54 = getelementptr inbounds [2100 x double], [2100 x double]* %29, i64 %indvars.iv930, i64 %indvars.iv27
  %55 = load double, double* %54, align 8
  %56 = getelementptr inbounds double, double* %30, i64 %indvars.iv27
  %57 = load double, double* %56, align 8
  %58 = fmul double %55, %57
  %59 = fadd double %53, %58
  store double %59, double* %sunkaddr22, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv27, 1
  %60 = load double, double* %sunkaddr22.1, align 8
  %61 = getelementptr inbounds [2100 x double], [2100 x double]* %29, i64 %indvars.iv930, i64 %indvars.iv.next
  %62 = load double, double* %61, align 8
  %63 = getelementptr inbounds double, double* %30, i64 %indvars.iv.next
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = fadd double %60, %65
  store double %66, double* %sunkaddr22.1, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv27, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %32
  br i1 %exitcond.1, label %.preheader.loopexit, label %.lr.ph

.lr.ph29:                                         ; preds = %.lr.ph29, %.lr.ph29.preheader.new
  %indvars.iv728 = phi i64 [ %indvars.iv728.unr.ph, %.lr.ph29.preheader.new ], [ %indvars.iv.next8.1, %.lr.ph29 ]
  %67 = getelementptr inbounds double, double* %31, i64 %indvars.iv728
  %68 = load double, double* %67, align 8
  %69 = getelementptr inbounds [2100 x double], [2100 x double]* %29, i64 %indvars.iv930, i64 %indvars.iv728
  %70 = load double, double* %69, align 8
  %71 = load double, double* %sunkaddr26, align 8
  %72 = fmul double %70, %71
  %73 = fadd double %68, %72
  store double %73, double* %67, align 8
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv728, 1
  %74 = getelementptr inbounds double, double* %31, i64 %indvars.iv.next8
  %75 = load double, double* %74, align 8
  %76 = getelementptr inbounds [2100 x double], [2100 x double]* %29, i64 %indvars.iv930, i64 %indvars.iv.next8
  %77 = load double, double* %76, align 8
  %78 = load double, double* %sunkaddr26.1, align 8
  %79 = fmul double %77, %78
  %80 = fadd double %75, %79
  store double %80, double* %74, align 8
  %indvars.iv.next8.1 = add nsw i64 %indvars.iv728, 2
  %exitcond39.1 = icmp eq i64 %indvars.iv.next8.1, %32
  br i1 %exitcond39.1, label %.preheader._crit_edge.loopexit, label %.lr.ph29

.preheader._crit_edge.loopexit:                   ; preds = %.lr.ph29
  br label %.preheader._crit_edge

.preheader._crit_edge:                            ; preds = %.preheader._crit_edge.loopexit, %.lr.ph29.prol.loopexit, %.preheader
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv930, 1
  %81 = icmp slt i64 %indvars.iv.next10, %33
  br i1 %81, label %.lr.ph33, label %._crit_edge43.loopexit

._crit_edge43.loopexit:                           ; preds = %.preheader._crit_edge
  br label %._crit_edge43

._crit_edge43:                                    ; preds = %._crit_edge43.loopexit, %._crit_edge41
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, double* nocapture readonly) unnamed_addr #0 {
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
