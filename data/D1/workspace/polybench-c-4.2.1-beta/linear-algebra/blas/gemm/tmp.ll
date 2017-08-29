; ModuleID = 'B.ll'
source_filename = "gemm.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"C\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = alloca double, align 8
  %4 = alloca double, align 8
  %5 = tail call i8* @polybench_alloc_data(i64 1100000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %7 = tail call i8* @polybench_alloc_data(i64 1320000, i32 8) #4
  %8 = bitcast i8* %5 to [1100 x double]*
  %9 = bitcast i8* %6 to [1200 x double]*
  %10 = bitcast i8* %7 to [1100 x double]*
  call void @init_array(i32 1000, i32 1100, i32 1200, double* nonnull %3, double* nonnull %4, [1100 x double]* %8, [1200 x double]* %9, [1100 x double]* %10)
  call void (...) @polybench_timer_start() #4
  %11 = load double, double* %3, align 8
  %12 = load double, double* %4, align 8
  %13 = bitcast i8* %7 to [1100 x double]*
  call void @kernel_gemm(i32 1000, i32 1100, i32 1200, double %11, double %12, [1100 x double]* %8, [1200 x double]* %9, [1100 x double]* %13)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %14 = icmp sgt i32 %0, 42
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %2
  %16 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %16, align 1
  %17 = icmp eq i8 %strcmpload, 0
  br i1 %17, label %18, label %._crit_edge

; <label>:18:                                     ; preds = %15
  %19 = bitcast i8* %5 to [1100 x double]*
  call void @print_array(i32 1000, i32 1100, [1100 x double]* %19)
  br label %._crit_edge

._crit_edge:                                      ; preds = %18, %15, %2
  call void @free(i8* %5) #4
  call void @free(i8* %6) #4
  call void @free(i8* %7) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, i32, double*, double*, [1100 x double]*, [1200 x double]*, [1100 x double]*) #2 {
.preheader9.lr.ph:
  store double 1.500000e+00, double* %3, align 8
  store double 1.200000e+00, double* %4, align 8
  br label %.preheader9.us

.preheader9.us:                                   ; preds = %.loopexit24.us, %.preheader9.lr.ph
  %indvars.iv64 = phi i64 [ 0, %.preheader9.lr.ph ], [ %indvars.iv.next65, %.loopexit24.us ]
  br label %8

; <label>:8:                                      ; preds = %8, %.preheader9.us
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %8 ], [ 0, %.preheader9.us ]
  %9 = mul nuw nsw i64 %indvars.iv64, %indvars.iv60
  %10 = add nuw nsw i64 %9, 1
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 1000
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 1.000000e+03
  %15 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv64, i64 %indvars.iv60
  store double %14, double* %15, align 8
  %exitcond63 = icmp eq i64 %indvars.iv60, 1099
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv60, 1
  br i1 %exitcond63, label %.loopexit24.us, label %8

.loopexit24.us:                                   ; preds = %8
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond69 = icmp eq i64 %indvars.iv.next65, 1000
  br i1 %exitcond69, label %.preheader7.us.preheader, label %.preheader9.us

.preheader7.us.preheader:                         ; preds = %.loopexit24.us
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %.loopexit23.us, %.preheader7.us.preheader
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %.loopexit23.us ], [ 0, %.preheader7.us.preheader ]
  br label %._crit_edge44

._crit_edge44:                                    ; preds = %._crit_edge44, %.preheader7.us
  %indvars.iv53 = phi i64 [ 0, %.preheader7.us ], [ %indvars.iv.next54.1, %._crit_edge44 ]
  %indvars.iv.next54 = or i64 %indvars.iv53, 1
  %16 = mul nuw nsw i64 %indvars.iv57, %indvars.iv.next54
  %17 = trunc i64 %16 to i32
  %18 = srem i32 %17, 1200
  %19 = sitofp i32 %18 to double
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv57, i64 %indvars.iv53
  %indvars.iv.next54.1 = add nsw i64 %indvars.iv53, 2
  %21 = mul nuw nsw i64 %indvars.iv57, %indvars.iv.next54.1
  %22 = trunc i64 %21 to i32
  %23 = srem i32 %22, 1200
  %24 = sitofp i32 %23 to double
  %25 = insertelement <2 x double> undef, double %19, i32 0
  %26 = insertelement <2 x double> %25, double %24, i32 1
  %27 = fdiv <2 x double> %26, <double 1.200000e+03, double 1.200000e+03>
  %28 = bitcast double* %20 to <2 x double>*
  store <2 x double> %27, <2 x double>* %28, align 8
  %exitcond56.1 = icmp eq i64 %indvars.iv.next54, 1199
  br i1 %exitcond56.1, label %.loopexit23.us, label %._crit_edge44

.loopexit23.us:                                   ; preds = %._crit_edge44
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond70 = icmp eq i64 %indvars.iv.next58, 1000
  br i1 %exitcond70, label %.preheader.us.preheader, label %.preheader7.us

.preheader.us.preheader:                          ; preds = %.loopexit23.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us, %.preheader.us.preheader
  %indvars.iv51 = phi i64 [ %indvars.iv.next52, %.loopexit.us ], [ 0, %.preheader.us.preheader ]
  br label %29

; <label>:29:                                     ; preds = %29, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %29 ], [ 0, %.preheader.us ]
  %30 = add nuw nsw i64 %indvars.iv, 2
  %31 = mul nuw nsw i64 %indvars.iv51, %30
  %32 = trunc i64 %31 to i32
  %33 = srem i32 %32, 1100
  %34 = sitofp i32 %33 to double
  %35 = fdiv double %34, 1.100000e+03
  %36 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv51, i64 %indvars.iv
  store double %35, double* %36, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1099
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br i1 %exitcond, label %.loopexit.us, label %29

.loopexit.us:                                     ; preds = %29
  %indvars.iv.next52 = add nuw nsw i64 %indvars.iv51, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next52, 1200
  br i1 %exitcond68, label %.preheader6._crit_edge, label %.preheader.us

.preheader6._crit_edge:                           ; preds = %.loopexit.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_gemm(i32, i32, i32, double, double, [1100 x double]*, [1200 x double]*, [1100 x double]*) #2 {
.preheader5.lr.ph:
  %broadcast.splatinsert91 = insertelement <2 x double> undef, double %4, i32 0
  %broadcast.splat92 = shufflevector <2 x double> %broadcast.splatinsert91, <2 x double> undef, <2 x i32> zeroinitializer
  %broadcast.splatinsert71 = insertelement <2 x double> undef, double %3, i32 0
  br label %.preheader5.us

.preheader5.us:                                   ; preds = %.loopexit11.us, %.preheader5.lr.ph
  %indvars.iv43 = phi i64 [ 0, %.preheader5.lr.ph ], [ %indvars.iv.next44, %.loopexit11.us ]
  %scevgep = getelementptr [1100 x double], [1100 x double]* %5, i64 %indvars.iv43, i64 0
  %8 = add nuw nsw i64 %indvars.iv43, 1
  %scevgep60 = getelementptr [1100 x double], [1100 x double]* %5, i64 %8, i64 0
  br label %vector.body76

vector.body76:                                    ; preds = %vector.body76.1, %.preheader5.us
  %index81 = phi i64 [ 0, %.preheader5.us ], [ %index.next82.1, %vector.body76.1 ]
  %9 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv43, i64 %index81
  %10 = bitcast double* %9 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %10, align 8
  %11 = getelementptr double, double* %9, i64 2
  %12 = bitcast double* %11 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %12, align 8
  %13 = fmul <2 x double> %wide.load89, %broadcast.splat92
  %14 = fmul <2 x double> %wide.load90, %broadcast.splat92
  %15 = bitcast double* %9 to <2 x double>*
  store <2 x double> %13, <2 x double>* %15, align 8
  %16 = bitcast double* %11 to <2 x double>*
  store <2 x double> %14, <2 x double>* %16, align 8
  %index.next82 = or i64 %index81, 4
  %17 = icmp eq i64 %index.next82, 1100
  br i1 %17, label %.preheader.us.us.preheader, label %vector.body76.1, !llvm.loop !1

.preheader.us.us.preheader:                       ; preds = %vector.body76
  br label %.preheader.us.us

.loopexit11.us:                                   ; preds = %.loopexit.us.us
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv43, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next44, 1000
  br i1 %exitcond55, label %._crit_edge, label %.preheader5.us

.preheader.us.us:                                 ; preds = %.loopexit.us.us, %.preheader.us.us.preheader
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %.loopexit.us.us ], [ 0, %.preheader.us.us.preheader ]
  %scevgep62 = getelementptr [1100 x double], [1100 x double]* %7, i64 %indvars.iv41, i64 0
  %18 = add nuw nsw i64 %indvars.iv41, 1
  %scevgep64 = getelementptr [1100 x double], [1100 x double]* %7, i64 %18, i64 0
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %6, i64 %indvars.iv43, i64 %indvars.iv41
  %bound0 = icmp ult double* %scevgep, %19
  %bound1 = icmp ult double* %19, %scevgep60
  %found.conflict = and i1 %bound0, %bound1
  %bound067 = icmp ult double* %scevgep, %scevgep64
  %bound168 = icmp ult double* %scevgep62, %scevgep60
  %found.conflict69 = and i1 %bound067, %bound168
  %conflict.rdx = or i1 %found.conflict, %found.conflict69
  br i1 %conflict.rdx, label %._crit_edge36.preheader, label %vector.ph

._crit_edge36.preheader:                          ; preds = %.preheader.us.us
  br label %._crit_edge36

vector.ph:                                        ; preds = %.preheader.us.us
  %20 = load double, double* %19, align 8, !alias.scope !4
  %21 = insertelement <2 x double> undef, double %20, i32 0
  %22 = insertelement <2 x double> undef, double %20, i32 0
  %23 = fmul <2 x double> %21, %broadcast.splatinsert71
  %24 = shufflevector <2 x double> %23, <2 x double> undef, <2 x i32> zeroinitializer
  %25 = fmul <2 x double> %22, %broadcast.splatinsert71
  %26 = shufflevector <2 x double> %25, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %27 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv41, i64 %index
  %28 = bitcast double* %27 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %28, align 8, !alias.scope !7
  %29 = getelementptr double, double* %27, i64 2
  %30 = bitcast double* %29 to <2 x double>*
  %wide.load73 = load <2 x double>, <2 x double>* %30, align 8, !alias.scope !7
  %31 = fmul <2 x double> %24, %wide.load
  %32 = fmul <2 x double> %26, %wide.load73
  %33 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv43, i64 %index
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load74 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !9, !noalias !11
  %35 = getelementptr double, double* %33, i64 2
  %36 = bitcast double* %35 to <2 x double>*
  %wide.load75 = load <2 x double>, <2 x double>* %36, align 8, !alias.scope !9, !noalias !11
  %37 = fadd <2 x double> %31, %wide.load74
  %38 = fadd <2 x double> %32, %wide.load75
  %39 = bitcast double* %33 to <2 x double>*
  store <2 x double> %37, <2 x double>* %39, align 8, !alias.scope !9, !noalias !11
  %40 = bitcast double* %35 to <2 x double>*
  store <2 x double> %38, <2 x double>* %40, align 8, !alias.scope !9, !noalias !11
  %index.next = add nuw nsw i64 %index, 4
  %41 = icmp eq i64 %index.next, 1100
  br i1 %41, label %.loopexit.us.us.loopexit93, label %vector.body, !llvm.loop !12

.loopexit.us.us.loopexit:                         ; preds = %._crit_edge36
  br label %.loopexit.us.us

.loopexit.us.us.loopexit93:                       ; preds = %vector.body
  br label %.loopexit.us.us

.loopexit.us.us:                                  ; preds = %.loopexit.us.us.loopexit93, %.loopexit.us.us.loopexit
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next42, 1200
  br i1 %exitcond54, label %.loopexit11.us, label %.preheader.us.us

._crit_edge36:                                    ; preds = %._crit_edge36, %._crit_edge36.preheader
  %indvars.iv39 = phi i64 [ 0, %._crit_edge36.preheader ], [ %indvars.iv.next40.1, %._crit_edge36 ]
  %42 = load double, double* %19, align 8
  %43 = fmul double %42, %3
  %44 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv41, i64 %indvars.iv39
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv43, i64 %indvars.iv39
  %48 = load double, double* %47, align 8
  %49 = fadd double %46, %48
  store double %49, double* %47, align 8
  %indvars.iv.next40 = or i64 %indvars.iv39, 1
  %50 = load double, double* %19, align 8
  %51 = fmul double %50, %3
  %52 = getelementptr inbounds [1100 x double], [1100 x double]* %7, i64 %indvars.iv41, i64 %indvars.iv.next40
  %53 = load double, double* %52, align 8
  %54 = fmul double %51, %53
  %55 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv43, i64 %indvars.iv.next40
  %56 = load double, double* %55, align 8
  %57 = fadd double %54, %56
  store double %57, double* %55, align 8
  %indvars.iv.next40.1 = add nsw i64 %indvars.iv39, 2
  %exitcond53.1 = icmp eq i64 %indvars.iv.next40.1, 1100
  br i1 %exitcond53.1, label %.loopexit.us.us.loopexit, label %._crit_edge36, !llvm.loop !13

._crit_edge:                                      ; preds = %.loopexit11.us
  ret void

vector.body76.1:                                  ; preds = %vector.body76
  %58 = getelementptr inbounds [1100 x double], [1100 x double]* %5, i64 %indvars.iv43, i64 %index.next82
  %59 = bitcast double* %58 to <2 x double>*
  %wide.load89.1 = load <2 x double>, <2 x double>* %59, align 8
  %60 = getelementptr double, double* %58, i64 2
  %61 = bitcast double* %60 to <2 x double>*
  %wide.load90.1 = load <2 x double>, <2 x double>* %61, align 8
  %62 = fmul <2 x double> %wide.load89.1, %broadcast.splat92
  %63 = fmul <2 x double> %wide.load90.1, %broadcast.splat92
  %64 = bitcast double* %58 to <2 x double>*
  store <2 x double> %62, <2 x double>* %64, align 8
  %65 = bitcast double* %60 to <2 x double>*
  store <2 x double> %63, <2 x double>* %65, align 8
  %index.next82.1 = add nsw i64 %index81, 8
  br label %vector.body76
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1100 x double]*) #0 {
.preheader.lr.ph..preheader.us_crit_edge:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %.loopexit.us, %.preheader.lr.ph..preheader.us_crit_edge
  %indvars.iv14 = phi i64 [ 0, %.preheader.lr.ph..preheader.us_crit_edge ], [ %indvars.iv.next15, %.loopexit.us ]
  %7 = mul nuw nsw i64 %indvars.iv14, 1000
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge11, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge11 ]
  %8 = add nuw nsw i64 %7, %indvars.iv
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge11

; <label>:12:                                     ; preds = %._crit_edge12
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %12, %._crit_edge12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1100 x double], [1100 x double]* %2, i64 %indvars.iv14, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1100
  br i1 %exitcond, label %.loopexit.us, label %._crit_edge12

.loopexit.us:                                     ; preds = %._crit_edge11
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 1000
  br i1 %exitcond16, label %._crit_edge, label %.preheader.us

._crit_edge:                                      ; preds = %.loopexit.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
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
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8}
!8 = distinct !{!8, !6}
!9 = !{!10}
!10 = distinct !{!10, !6}
!11 = !{!5, !8}
!12 = distinct !{!12, !2, !3}
!13 = distinct !{!13, !2, !3}
