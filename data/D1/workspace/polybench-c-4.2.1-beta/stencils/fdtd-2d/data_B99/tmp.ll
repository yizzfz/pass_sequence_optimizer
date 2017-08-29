; ModuleID = 'A.ll'
source_filename = "fdtd-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"ex\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"ey\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"hz\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) #0 {
  %3 = call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %4 = call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %5 = call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %6 = call i8* @polybench_alloc_data(i64 500, i32 8) #3
  %7 = bitcast i8* %3 to [1200 x double]*
  %8 = bitcast i8* %4 to [1200 x double]*
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  call void @init_array([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  call void (...) @polybench_timer_start() #3
  call void @kernel_fdtd_2d([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  call void (...) @polybench_timer_stop() #3
  call void (...) @polybench_timer_print() #3
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to [1200 x double]*
  %17 = bitcast i8* %4 to [1200 x double]*
  %18 = bitcast i8* %3 to [1200 x double]*
  call void @print_array([1200 x double]* %18, [1200 x double]* %17, [1200 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %3) #3
  call void @free(i8* %4) #3
  call void @free(i8* %5) #3
  call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array([1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #0 {
.lr.ph14.preheader:
  br label %.lr.ph14

.lr.ph14:                                         ; preds = %.lr.ph14, %.lr.ph14.preheader
  %indvars.iv312 = phi i64 [ 0, %.lr.ph14.preheader ], [ %indvars.iv.next4.4, %.lr.ph14 ]
  %4 = trunc i64 %indvars.iv312 to i32
  %5 = sitofp i32 %4 to double
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv312
  store double %5, double* %6, align 8
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv312, 1
  %7 = trunc i64 %indvars.iv.next4 to i32
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next4
  store double %8, double* %9, align 8
  %indvars.iv.next4.1 = add nsw i64 %indvars.iv312, 2
  %10 = trunc i64 %indvars.iv.next4.1 to i32
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next4.1
  store double %11, double* %12, align 8
  %indvars.iv.next4.2 = add nsw i64 %indvars.iv312, 3
  %13 = trunc i64 %indvars.iv.next4.2 to i32
  %14 = sitofp i32 %13 to double
  %15 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next4.2
  store double %14, double* %15, align 8
  %indvars.iv.next4.3 = add nsw i64 %indvars.iv312, 4
  %16 = trunc i64 %indvars.iv.next4.3 to i32
  %17 = sitofp i32 %16 to double
  %18 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next4.3
  store double %17, double* %18, align 8
  %exitcond20.4 = icmp eq i64 %indvars.iv.next4.3, 499
  %indvars.iv.next4.4 = add nsw i64 %indvars.iv312, 5
  br i1 %exitcond20.4, label %.lr.ph8.split.us.preheader, label %.lr.ph14

.lr.ph8.split.us.preheader:                       ; preds = %.lr.ph14
  br label %.lr.ph8.split.us

.lr.ph8.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph8.split.us.preheader
  %indvars.iv16.us = phi i64 [ %indvars.iv.next2.us, %._crit_edge.us ], [ 0, %.lr.ph8.split.us.preheader ]
  %19 = trunc i64 %indvars.iv16.us to i32
  %20 = sitofp i32 %19 to double
  %21 = insertelement <2 x double> undef, double %20, i32 0
  %22 = shufflevector <2 x double> %21, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge18, %.lr.ph8.split.us
  %indvars.iv5.us = phi i64 [ 0, %.lr.ph8.split.us ], [ %indvars.iv.next.us, %._crit_edge18 ]
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv5.us, 1
  %23 = trunc i64 %indvars.iv.next.us to i32
  %24 = sitofp i32 %23 to double
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv16.us, i64 %indvars.iv5.us
  %26 = add nuw nsw i64 %indvars.iv5.us, 2
  %27 = trunc i64 %26 to i32
  %28 = sitofp i32 %27 to double
  %29 = insertelement <2 x double> undef, double %24, i32 0
  %30 = insertelement <2 x double> %29, double %28, i32 1
  %31 = fmul <2 x double> %22, %30
  %32 = fdiv <2 x double> %31, <double 1.000000e+03, double 1.200000e+03>
  %33 = extractelement <2 x double> %32, i32 0
  %34 = extractelement <2 x double> %32, i32 1
  store double %33, double* %25, align 8
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv16.us, i64 %indvars.iv5.us
  store double %34, double* %35, align 8
  %36 = add nuw nsw i64 %indvars.iv5.us, 3
  %37 = trunc i64 %36 to i32
  %38 = sitofp i32 %37 to double
  %39 = fmul double %20, %38
  %40 = fdiv double %39, 1.000000e+03
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv16.us, i64 %indvars.iv5.us
  store double %40, double* %41, align 8
  %exitcond = icmp eq i64 %indvars.iv5.us, 1199
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge18

._crit_edge.us:                                   ; preds = %._crit_edge18
  %indvars.iv.next2.us = add nuw nsw i64 %indvars.iv16.us, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next2.us, 1000
  br i1 %exitcond1, label %._crit_edge17, label %.lr.ph8.split.us

._crit_edge17:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_fdtd_2d([1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #0 {
.lr.ph86:
  %scevgep205 = getelementptr [1200 x double], [1200 x double]* %1, i64 1, i64 0
  br label %._crit_edge80._crit_edge

._crit_edge80._crit_edge:                         ; preds = %._crit_edge80, %.lr.ph86
  %indvars.iv3084 = phi i64 [ 0, %.lr.ph86 ], [ %indvars.iv.next31, %._crit_edge80 ]
  %4 = getelementptr inbounds double, double* %3, i64 %indvars.iv3084
  %5 = bitcast double* %4 to [1200 x double]*
  %bound0208 = icmp ugt [1200 x double]* %5, %1
  %bound1209 = icmp ult double* %4, %scevgep205
  %memcheck.conflict211 = and i1 %bound0208, %bound1209
  br i1 %memcheck.conflict211, label %scalar.ph202.preheader, label %vector.body200.preheader

vector.body200.preheader:                         ; preds = %._crit_edge80._crit_edge
  %6 = bitcast double* %4 to i64*
  %7 = bitcast double* %4 to i64*
  %8 = bitcast double* %4 to i64*
  br label %vector.body200

scalar.ph202.preheader:                           ; preds = %._crit_edge80._crit_edge
  %9 = bitcast double* %4 to i64*
  %10 = bitcast double* %4 to i64*
  %11 = bitcast double* %4 to i64*
  %12 = bitcast double* %4 to i64*
  %13 = bitcast double* %4 to i64*
  %14 = bitcast double* %4 to i64*
  %15 = bitcast double* %4 to i64*
  %16 = bitcast double* %4 to i64*
  br label %scalar.ph202

vector.body200:                                   ; preds = %vector.body200, %vector.body200.preheader
  %index214 = phi i64 [ 0, %vector.body200.preheader ], [ %index.next215.2, %vector.body200 ]
  %17 = load i64, i64* %6, align 8, !alias.scope !1
  %18 = insertelement <2 x i64> undef, i64 %17, i32 0
  %19 = shufflevector <2 x i64> %18, <2 x i64> undef, <2 x i32> zeroinitializer
  %20 = insertelement <2 x i64> undef, i64 %17, i32 0
  %21 = shufflevector <2 x i64> %20, <2 x i64> undef, <2 x i32> zeroinitializer
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index214
  %23 = bitcast double* %22 to <2 x i64>*
  store <2 x i64> %19, <2 x i64>* %23, align 8, !alias.scope !4, !noalias !1
  %24 = getelementptr double, double* %22, i64 2
  %25 = bitcast double* %24 to <2 x i64>*
  store <2 x i64> %21, <2 x i64>* %25, align 8, !alias.scope !4, !noalias !1
  %index.next215 = add nuw nsw i64 %index214, 4
  %26 = load i64, i64* %7, align 8, !alias.scope !1
  %27 = insertelement <2 x i64> undef, i64 %26, i32 0
  %28 = shufflevector <2 x i64> %27, <2 x i64> undef, <2 x i32> zeroinitializer
  %29 = insertelement <2 x i64> undef, i64 %26, i32 0
  %30 = shufflevector <2 x i64> %29, <2 x i64> undef, <2 x i32> zeroinitializer
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index.next215
  %32 = bitcast double* %31 to <2 x i64>*
  store <2 x i64> %28, <2 x i64>* %32, align 8, !alias.scope !4, !noalias !1
  %33 = getelementptr double, double* %31, i64 2
  %34 = bitcast double* %33 to <2 x i64>*
  store <2 x i64> %30, <2 x i64>* %34, align 8, !alias.scope !4, !noalias !1
  %index.next215.1 = add nsw i64 %index214, 8
  %35 = load i64, i64* %8, align 8, !alias.scope !1
  %36 = insertelement <2 x i64> undef, i64 %35, i32 0
  %37 = shufflevector <2 x i64> %36, <2 x i64> undef, <2 x i32> zeroinitializer
  %38 = insertelement <2 x i64> undef, i64 %35, i32 0
  %39 = shufflevector <2 x i64> %38, <2 x i64> undef, <2 x i32> zeroinitializer
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index.next215.1
  %41 = bitcast double* %40 to <2 x i64>*
  store <2 x i64> %37, <2 x i64>* %41, align 8, !alias.scope !4, !noalias !1
  %42 = getelementptr double, double* %40, i64 2
  %43 = bitcast double* %42 to <2 x i64>*
  store <2 x i64> %39, <2 x i64>* %43, align 8, !alias.scope !4, !noalias !1
  %index.next215.2 = add nsw i64 %index214, 12
  %44 = icmp eq i64 %index.next215.2, 1200
  br i1 %44, label %.lr.ph45.split.us.preheader.loopexit2, label %vector.body200, !llvm.loop !6

scalar.ph202:                                     ; preds = %scalar.ph202, %scalar.ph202.preheader
  %indvars.iv32 = phi i64 [ 0, %scalar.ph202.preheader ], [ %indvars.iv.next.7, %scalar.ph202 ]
  %45 = load i64, i64* %9, align 8
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv32
  %47 = bitcast double* %46 to i64*
  store i64 %45, i64* %47, align 8
  %indvars.iv.next = or i64 %indvars.iv32, 1
  %48 = load i64, i64* %10, align 8
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next
  %50 = bitcast double* %49 to i64*
  store i64 %48, i64* %50, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv32, 2
  %51 = load i64, i64* %11, align 8
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.1
  %53 = bitcast double* %52 to i64*
  store i64 %51, i64* %53, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv32, 3
  %54 = load i64, i64* %12, align 8
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.2
  %56 = bitcast double* %55 to i64*
  store i64 %54, i64* %56, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv32, 4
  %57 = load i64, i64* %13, align 8
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.3
  %59 = bitcast double* %58 to i64*
  store i64 %57, i64* %59, align 8
  %indvars.iv.next.4 = or i64 %indvars.iv32, 5
  %60 = load i64, i64* %14, align 8
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.4
  %62 = bitcast double* %61 to i64*
  store i64 %60, i64* %62, align 8
  %indvars.iv.next.5 = or i64 %indvars.iv32, 6
  %63 = load i64, i64* %15, align 8
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.5
  %65 = bitcast double* %64 to i64*
  store i64 %63, i64* %65, align 8
  %indvars.iv.next.6 = or i64 %indvars.iv32, 7
  %66 = load i64, i64* %16, align 8
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.6
  %68 = bitcast double* %67 to i64*
  store i64 %66, i64* %68, align 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.6, 1199
  %indvars.iv.next.7 = add nsw i64 %indvars.iv32, 8
  br i1 %exitcond.7, label %.lr.ph45.split.us.preheader.loopexit, label %scalar.ph202, !llvm.loop !9

.lr.ph45.split.us.preheader.loopexit:             ; preds = %scalar.ph202
  br label %.lr.ph45.split.us.preheader

.lr.ph45.split.us.preheader.loopexit2:            ; preds = %vector.body200
  br label %.lr.ph45.split.us.preheader

.lr.ph45.split.us.preheader:                      ; preds = %.lr.ph45.split.us.preheader.loopexit2, %.lr.ph45.split.us.preheader.loopexit
  br label %.lr.ph45.split.us

.lr.ph45.split.us:                                ; preds = %._crit_edge38.us, %.lr.ph45.split.us.preheader
  %indvar = phi i64 [ %indvar.next, %._crit_edge38.us ], [ 0, %.lr.ph45.split.us.preheader ]
  %indvars.iv2043.us = phi i64 [ %indvars.iv.next21.us, %._crit_edge38.us ], [ 1, %.lr.ph45.split.us.preheader ]
  %69 = add nuw nsw i64 %indvar, 1
  %scevgep172 = getelementptr [1200 x double], [1200 x double]* %1, i64 %69, i64 0
  %70 = add nuw nsw i64 %indvar, 2
  %scevgep174 = getelementptr [1200 x double], [1200 x double]* %1, i64 %70, i64 0
  %scevgep176 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvar, i64 0
  %scevgep178 = getelementptr [1200 x double], [1200 x double]* %2, i64 %70, i64 0
  %71 = add nsw i64 %indvars.iv2043.us, -1
  %bound0180 = icmp ult double* %scevgep172, %scevgep178
  %bound1181 = icmp ult double* %scevgep176, %scevgep174
  %memcheck.conflict183 = and i1 %bound0180, %bound1181
  br i1 %memcheck.conflict183, label %scalar.ph169.preheader, label %vector.body167.preheader

vector.body167.preheader:                         ; preds = %.lr.ph45.split.us
  br label %vector.body167

scalar.ph169.preheader:                           ; preds = %.lr.ph45.split.us
  br label %scalar.ph169

vector.body167:                                   ; preds = %vector.body167.preheader, %vector.body167
  %index186 = phi i64 [ %index.next187, %vector.body167 ], [ 0, %vector.body167.preheader ]
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv2043.us, i64 %index186
  %73 = bitcast double* %72 to <2 x double>*
  %wide.load194 = load <2 x double>, <2 x double>* %73, align 8, !alias.scope !10, !noalias !13
  %74 = getelementptr double, double* %72, i64 2
  %75 = bitcast double* %74 to <2 x double>*
  %wide.load195 = load <2 x double>, <2 x double>* %75, align 8, !alias.scope !10, !noalias !13
  %76 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv2043.us, i64 %index186
  %77 = bitcast double* %76 to <2 x double>*
  %wide.load196 = load <2 x double>, <2 x double>* %77, align 8, !alias.scope !13
  %78 = getelementptr double, double* %76, i64 2
  %79 = bitcast double* %78 to <2 x double>*
  %wide.load197 = load <2 x double>, <2 x double>* %79, align 8, !alias.scope !13
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %71, i64 %index186
  %81 = bitcast double* %80 to <2 x double>*
  %wide.load198 = load <2 x double>, <2 x double>* %81, align 8, !alias.scope !13
  %82 = getelementptr double, double* %80, i64 2
  %83 = bitcast double* %82 to <2 x double>*
  %wide.load199 = load <2 x double>, <2 x double>* %83, align 8, !alias.scope !13
  %84 = fsub <2 x double> %wide.load196, %wide.load198
  %85 = fsub <2 x double> %wide.load197, %wide.load199
  %86 = fmul <2 x double> %84, <double 5.000000e-01, double 5.000000e-01>
  %87 = fmul <2 x double> %85, <double 5.000000e-01, double 5.000000e-01>
  %88 = fsub <2 x double> %wide.load194, %86
  %89 = fsub <2 x double> %wide.load195, %87
  %90 = bitcast double* %72 to <2 x double>*
  store <2 x double> %88, <2 x double>* %90, align 8, !alias.scope !10, !noalias !13
  %91 = bitcast double* %74 to <2 x double>*
  store <2 x double> %89, <2 x double>* %91, align 8, !alias.scope !10, !noalias !13
  %index.next187 = add nuw nsw i64 %index186, 4
  %92 = icmp eq i64 %index.next187, 1200
  br i1 %92, label %._crit_edge38.us.loopexit1, label %vector.body167, !llvm.loop !15

scalar.ph169:                                     ; preds = %scalar.ph169, %scalar.ph169.preheader
  %indvars.iv1835.us = phi i64 [ 0, %scalar.ph169.preheader ], [ %indvars.iv.next19.us.1, %scalar.ph169 ]
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv2043.us, i64 %indvars.iv1835.us
  %94 = load double, double* %93, align 8
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv2043.us, i64 %indvars.iv1835.us
  %96 = load double, double* %95, align 8
  %97 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %71, i64 %indvars.iv1835.us
  %98 = load double, double* %97, align 8
  %99 = fsub double %96, %98
  %100 = fmul double %99, 5.000000e-01
  %101 = fsub double %94, %100
  store double %101, double* %93, align 8
  %indvars.iv.next19.us = or i64 %indvars.iv1835.us, 1
  %102 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv2043.us, i64 %indvars.iv.next19.us
  %103 = load double, double* %102, align 8
  %104 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv2043.us, i64 %indvars.iv.next19.us
  %105 = load double, double* %104, align 8
  %106 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %71, i64 %indvars.iv.next19.us
  %107 = load double, double* %106, align 8
  %108 = fsub double %105, %107
  %109 = fmul double %108, 5.000000e-01
  %110 = fsub double %103, %109
  store double %110, double* %102, align 8
  %exitcond100.1 = icmp eq i64 %indvars.iv.next19.us, 1199
  %indvars.iv.next19.us.1 = add nsw i64 %indvars.iv1835.us, 2
  br i1 %exitcond100.1, label %._crit_edge38.us.loopexit, label %scalar.ph169, !llvm.loop !16

._crit_edge38.us.loopexit:                        ; preds = %scalar.ph169
  br label %._crit_edge38.us

._crit_edge38.us.loopexit1:                       ; preds = %vector.body167
  br label %._crit_edge38.us

._crit_edge38.us:                                 ; preds = %._crit_edge38.us.loopexit1, %._crit_edge38.us.loopexit
  %indvars.iv.next21.us = add nuw nsw i64 %indvars.iv2043.us, 1
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond3 = icmp eq i64 %indvar.next, 999
  br i1 %exitcond3, label %.lr.ph64.split.us.preheader, label %.lr.ph45.split.us

.lr.ph64.split.us.preheader:                      ; preds = %._crit_edge38.us
  br label %.lr.ph64.split.us

.lr.ph64.split.us:                                ; preds = %._crit_edge58.us, %.lr.ph64.split.us.preheader
  %indvars.iv2462.us = phi i64 [ %indvars.iv.next25.us, %._crit_edge58.us ], [ 0, %.lr.ph64.split.us.preheader ]
  %scevgep139 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv2462.us, i64 1
  %111 = add nuw nsw i64 %indvars.iv2462.us, 1
  %scevgep141 = getelementptr [1200 x double], [1200 x double]* %0, i64 %111, i64 0
  %scevgep143 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv2462.us, i64 0
  %scevgep145 = getelementptr [1200 x double], [1200 x double]* %2, i64 %111, i64 0
  %bound0147 = icmp ult double* %scevgep139, %scevgep145
  %bound1148 = icmp ult double* %scevgep143, %scevgep141
  %memcheck.conflict150 = and i1 %bound0147, %bound1148
  br i1 %memcheck.conflict150, label %scalar.ph136.preheader, label %vector.body134.preheader

vector.body134.preheader:                         ; preds = %.lr.ph64.split.us
  br label %vector.body134

vector.body134:                                   ; preds = %vector.body134.preheader, %vector.body134
  %index153 = phi i64 [ %index.next154, %vector.body134 ], [ 0, %vector.body134.preheader ]
  %offset.idx = or i64 %index153, 1
  %112 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv2462.us, i64 %offset.idx
  %113 = bitcast double* %112 to <2 x double>*
  %wide.load161 = load <2 x double>, <2 x double>* %113, align 8, !alias.scope !17, !noalias !20
  %114 = getelementptr double, double* %112, i64 2
  %115 = bitcast double* %114 to <2 x double>*
  %wide.load162 = load <2 x double>, <2 x double>* %115, align 8, !alias.scope !17, !noalias !20
  %116 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv2462.us, i64 %offset.idx
  %117 = bitcast double* %116 to <2 x double>*
  %wide.load163 = load <2 x double>, <2 x double>* %117, align 8, !alias.scope !20
  %118 = getelementptr double, double* %116, i64 2
  %119 = bitcast double* %118 to <2 x double>*
  %wide.load164 = load <2 x double>, <2 x double>* %119, align 8, !alias.scope !20
  %120 = add nsw i64 %offset.idx, -1
  %121 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv2462.us, i64 %120
  %122 = bitcast double* %121 to <2 x double>*
  %wide.load165 = load <2 x double>, <2 x double>* %122, align 8, !alias.scope !20
  %123 = getelementptr double, double* %121, i64 2
  %124 = bitcast double* %123 to <2 x double>*
  %wide.load166 = load <2 x double>, <2 x double>* %124, align 8, !alias.scope !20
  %125 = fsub <2 x double> %wide.load163, %wide.load165
  %126 = fsub <2 x double> %wide.load164, %wide.load166
  %127 = fmul <2 x double> %125, <double 5.000000e-01, double 5.000000e-01>
  %128 = fmul <2 x double> %126, <double 5.000000e-01, double 5.000000e-01>
  %129 = fsub <2 x double> %wide.load161, %127
  %130 = fsub <2 x double> %wide.load162, %128
  %131 = bitcast double* %112 to <2 x double>*
  store <2 x double> %129, <2 x double>* %131, align 8, !alias.scope !17, !noalias !20
  %132 = bitcast double* %114 to <2 x double>*
  store <2 x double> %130, <2 x double>* %132, align 8, !alias.scope !17, !noalias !20
  %index.next154 = add nuw nsw i64 %index153, 4
  %133 = icmp eq i64 %index.next154, 1196
  br i1 %133, label %scalar.ph136.preheader.loopexit, label %vector.body134, !llvm.loop !22

scalar.ph136.preheader.loopexit:                  ; preds = %vector.body134
  br label %scalar.ph136.preheader

scalar.ph136.preheader:                           ; preds = %scalar.ph136.preheader.loopexit, %.lr.ph64.split.us
  %indvars.iv2255.us.ph = phi i64 [ 1, %.lr.ph64.split.us ], [ 1197, %scalar.ph136.preheader.loopexit ]
  br i1 true, label %scalar.ph136.prol.preheader, label %scalar.ph136.prol.loopexit.unr-lcssa

scalar.ph136.prol.preheader:                      ; preds = %scalar.ph136.preheader
  br label %scalar.ph136.prol

scalar.ph136.prol:                                ; preds = %scalar.ph136.prol.preheader
  %134 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv2462.us, i64 %indvars.iv2255.us.ph
  %135 = load double, double* %134, align 8
  %136 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv2462.us, i64 %indvars.iv2255.us.ph
  %137 = load double, double* %136, align 8
  %138 = add nsw i64 %indvars.iv2255.us.ph, -1
  %139 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv2462.us, i64 %138
  %140 = load double, double* %139, align 8
  %141 = fsub double %137, %140
  %142 = fmul double %141, 5.000000e-01
  %143 = fsub double %135, %142
  store double %143, double* %134, align 8
  %indvars.iv.next23.us.prol = add nuw nsw i64 %indvars.iv2255.us.ph, 1
  br label %scalar.ph136.prol.loopexit.unr-lcssa

scalar.ph136.prol.loopexit.unr-lcssa:             ; preds = %scalar.ph136.preheader, %scalar.ph136.prol
  %indvars.iv2255.us.unr.ph = phi i64 [ %indvars.iv.next23.us.prol, %scalar.ph136.prol ], [ %indvars.iv2255.us.ph, %scalar.ph136.preheader ]
  br label %scalar.ph136.prol.loopexit

scalar.ph136.prol.loopexit:                       ; preds = %scalar.ph136.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge58.us, label %scalar.ph136.preheader.new

scalar.ph136.preheader.new:                       ; preds = %scalar.ph136.prol.loopexit
  br label %scalar.ph136

scalar.ph136:                                     ; preds = %scalar.ph136, %scalar.ph136.preheader.new
  %indvars.iv2255.us = phi i64 [ %indvars.iv2255.us.unr.ph, %scalar.ph136.preheader.new ], [ %indvars.iv.next23.us.1, %scalar.ph136 ]
  %144 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv2462.us, i64 %indvars.iv2255.us
  %145 = load double, double* %144, align 8
  %146 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv2462.us, i64 %indvars.iv2255.us
  %147 = load double, double* %146, align 8
  %148 = add nsw i64 %indvars.iv2255.us, -1
  %149 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv2462.us, i64 %148
  %150 = load double, double* %149, align 8
  %151 = fsub double %147, %150
  %152 = fmul double %151, 5.000000e-01
  %153 = fsub double %145, %152
  store double %153, double* %144, align 8
  %indvars.iv.next23.us = add nuw nsw i64 %indvars.iv2255.us, 1
  %154 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv2462.us, i64 %indvars.iv.next23.us
  %155 = load double, double* %154, align 8
  %156 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv2462.us, i64 %indvars.iv.next23.us
  %157 = load double, double* %156, align 8
  %158 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv2462.us, i64 %indvars.iv2255.us
  %159 = load double, double* %158, align 8
  %160 = fsub double %157, %159
  %161 = fmul double %160, 5.000000e-01
  %162 = fsub double %155, %161
  store double %162, double* %154, align 8
  %exitcond102.1 = icmp eq i64 %indvars.iv.next23.us, 1199
  %indvars.iv.next23.us.1 = add nsw i64 %indvars.iv2255.us, 2
  br i1 %exitcond102.1, label %._crit_edge58.us.unr-lcssa, label %scalar.ph136, !llvm.loop !23

._crit_edge58.us.unr-lcssa:                       ; preds = %scalar.ph136
  br label %._crit_edge58.us

._crit_edge58.us:                                 ; preds = %scalar.ph136.prol.loopexit, %._crit_edge58.us.unr-lcssa
  %indvars.iv.next25.us = add nuw nsw i64 %indvars.iv2462.us, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next25.us, 1000
  br i1 %exitcond4, label %.lr.ph79.split.us.preheader, label %.lr.ph64.split.us

.lr.ph79.split.us.preheader:                      ; preds = %._crit_edge58.us
  br label %.lr.ph79.split.us

.lr.ph79.split.us:                                ; preds = %._crit_edge75.us, %.lr.ph79.split.us.preheader
  %indvars.iv2877.us = phi i64 [ %164, %._crit_edge75.us ], [ 0, %.lr.ph79.split.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv2877.us, i64 0
  %scevgep111 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv2877.us, i64 1199
  %scevgep113 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv2877.us, i64 0
  %163 = add nuw nsw i64 %indvars.iv2877.us, 1
  %scevgep115 = getelementptr [1200 x double], [1200 x double]* %0, i64 %163, i64 0
  %scevgep117 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv2877.us, i64 0
  %scevgep119 = getelementptr [1200 x double], [1200 x double]* %1, i64 %163, i64 1199
  %164 = add nuw nsw i64 %indvars.iv2877.us, 1
  %bound0 = icmp ult double* %scevgep, %scevgep115
  %bound1 = icmp ult double* %scevgep113, %scevgep111
  %found.conflict = and i1 %bound0, %bound1
  %bound0121 = icmp ult double* %scevgep, %scevgep119
  %bound1122 = icmp ult double* %scevgep117, %scevgep111
  %found.conflict123 = and i1 %bound0121, %bound1122
  %conflict.rdx = or i1 %found.conflict, %found.conflict123
  br i1 %conflict.rdx, label %._crit_edge98.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.lr.ph79.split.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %165 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv2877.us, i64 %index
  %166 = bitcast double* %165 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %166, align 8, !alias.scope !24, !noalias !27
  %167 = getelementptr double, double* %165, i64 2
  %168 = bitcast double* %167 to <2 x double>*
  %wide.load125 = load <2 x double>, <2 x double>* %168, align 8, !alias.scope !24, !noalias !27
  %169 = or i64 %index, 1
  %170 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv2877.us, i64 %169
  %171 = bitcast double* %170 to <2 x double>*
  %wide.load126 = load <2 x double>, <2 x double>* %171, align 8, !alias.scope !30
  %172 = getelementptr double, double* %170, i64 2
  %173 = bitcast double* %172 to <2 x double>*
  %wide.load127 = load <2 x double>, <2 x double>* %173, align 8, !alias.scope !30
  %174 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv2877.us, i64 %index
  %175 = bitcast double* %174 to <2 x double>*
  %wide.load128 = load <2 x double>, <2 x double>* %175, align 8, !alias.scope !30
  %176 = getelementptr double, double* %174, i64 2
  %177 = bitcast double* %176 to <2 x double>*
  %wide.load129 = load <2 x double>, <2 x double>* %177, align 8, !alias.scope !30
  %178 = fsub <2 x double> %wide.load126, %wide.load128
  %179 = fsub <2 x double> %wide.load127, %wide.load129
  %180 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %164, i64 %index
  %181 = bitcast double* %180 to <2 x double>*
  %wide.load130 = load <2 x double>, <2 x double>* %181, align 8, !alias.scope !31
  %182 = getelementptr double, double* %180, i64 2
  %183 = bitcast double* %182 to <2 x double>*
  %wide.load131 = load <2 x double>, <2 x double>* %183, align 8, !alias.scope !31
  %184 = fadd <2 x double> %178, %wide.load130
  %185 = fadd <2 x double> %179, %wide.load131
  %186 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv2877.us, i64 %index
  %187 = bitcast double* %186 to <2 x double>*
  %wide.load132 = load <2 x double>, <2 x double>* %187, align 8, !alias.scope !31
  %188 = getelementptr double, double* %186, i64 2
  %189 = bitcast double* %188 to <2 x double>*
  %wide.load133 = load <2 x double>, <2 x double>* %189, align 8, !alias.scope !31
  %190 = fsub <2 x double> %184, %wide.load132
  %191 = fsub <2 x double> %185, %wide.load133
  %192 = fmul <2 x double> %190, <double 7.000000e-01, double 7.000000e-01>
  %193 = fmul <2 x double> %191, <double 7.000000e-01, double 7.000000e-01>
  %194 = fsub <2 x double> %wide.load, %192
  %195 = fsub <2 x double> %wide.load125, %193
  %196 = bitcast double* %165 to <2 x double>*
  store <2 x double> %194, <2 x double>* %196, align 8, !alias.scope !24, !noalias !27
  %197 = bitcast double* %167 to <2 x double>*
  store <2 x double> %195, <2 x double>* %197, align 8, !alias.scope !24, !noalias !27
  %index.next = add nuw nsw i64 %index, 4
  %198 = icmp eq i64 %index.next, 1196
  br i1 %198, label %._crit_edge98.preheader.loopexit, label %vector.body, !llvm.loop !32

._crit_edge98.preheader.loopexit:                 ; preds = %vector.body
  br label %._crit_edge98.preheader

._crit_edge98.preheader:                          ; preds = %._crit_edge98.preheader.loopexit, %.lr.ph79.split.us
  %indvars.iv2672.us.ph = phi i64 [ 0, %.lr.ph79.split.us ], [ 1196, %._crit_edge98.preheader.loopexit ]
  br label %._crit_edge98

._crit_edge98:                                    ; preds = %._crit_edge98.preheader, %._crit_edge98
  %indvars.iv2672.us = phi i64 [ %indvars.iv.next27.us, %._crit_edge98 ], [ %indvars.iv2672.us.ph, %._crit_edge98.preheader ]
  %199 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv2877.us, i64 %indvars.iv2672.us
  %200 = load double, double* %199, align 8
  %indvars.iv.next27.us = add nuw nsw i64 %indvars.iv2672.us, 1
  %201 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv2877.us, i64 %indvars.iv.next27.us
  %202 = load double, double* %201, align 8
  %203 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv2877.us, i64 %indvars.iv2672.us
  %204 = load double, double* %203, align 8
  %205 = fsub double %202, %204
  %206 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %164, i64 %indvars.iv2672.us
  %207 = load double, double* %206, align 8
  %208 = fadd double %205, %207
  %209 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv2877.us, i64 %indvars.iv2672.us
  %210 = load double, double* %209, align 8
  %211 = fsub double %208, %210
  %212 = fmul double %211, 7.000000e-01
  %213 = fsub double %200, %212
  store double %213, double* %199, align 8
  %214 = icmp slt i64 %indvars.iv.next27.us, 1199
  br i1 %214, label %._crit_edge98, label %._crit_edge75.us, !llvm.loop !33

._crit_edge75.us:                                 ; preds = %._crit_edge98
  %exitcond5 = icmp eq i64 %164, 999
  br i1 %exitcond5, label %._crit_edge80, label %.lr.ph79.split.us

._crit_edge80:                                    ; preds = %._crit_edge75.us
  %indvars.iv.next31 = add nuw nsw i64 %indvars.iv3084, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next31, 500
  br i1 %exitcond6, label %._crit_edge94, label %._crit_edge80._crit_edge

._crit_edge94:                                    ; preds = %._crit_edge80
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]*, [1200 x double]*, [1200 x double]*) #0 {
.lr.ph36.split.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #4
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.lr.ph36.split.us

.lr.ph36.split.us:                                ; preds = %._crit_edge32.us, %.lr.ph36.split.us.preheader
  %indvars.iv934.us = phi i64 [ %indvars.iv.next10.us, %._crit_edge32.us ], [ 0, %.lr.ph36.split.us.preheader ]
  %7 = mul nuw nsw i64 %indvars.iv934.us, 1000
  br label %._crit_edge47

._crit_edge47:                                    ; preds = %._crit_edge46, %.lr.ph36.split.us
  %indvars.iv729.us = phi i64 [ 0, %.lr.ph36.split.us ], [ %indvars.iv.next8.us, %._crit_edge46 ]
  %8 = add nuw nsw i64 %indvars.iv729.us, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge46

; <label>:12:                                     ; preds = %._crit_edge47
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc45 = call i32 @fputc(i32 10, %struct._IO_FILE* %13) #4
  br label %._crit_edge46

._crit_edge46:                                    ; preds = %._crit_edge47, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv934.us, i64 %indvars.iv729.us
  %16 = load double, double* %15, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next8.us = add nuw nsw i64 %indvars.iv729.us, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next8.us, 1200
  br i1 %exitcond4, label %._crit_edge32.us, label %._crit_edge47

._crit_edge32.us:                                 ; preds = %._crit_edge46
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv934.us, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next10.us, 1000
  br i1 %exitcond5, label %._crit_edge, label %.lr.ph36.split.us

._crit_edge:                                      ; preds = %._crit_edge32.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #4
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  br label %.lr.ph25.split.us

.lr.ph25.split.us:                                ; preds = %._crit_edge21.us, %._crit_edge
  %indvars.iv523.us = phi i64 [ %indvars.iv.next6.us, %._crit_edge21.us ], [ 0, %._crit_edge ]
  %24 = mul nuw nsw i64 %indvars.iv523.us, 1000
  br label %._crit_edge50

._crit_edge50:                                    ; preds = %._crit_edge49, %.lr.ph25.split.us
  %indvars.iv318.us = phi i64 [ 0, %.lr.ph25.split.us ], [ %indvars.iv.next4.us, %._crit_edge49 ]
  %25 = add nuw nsw i64 %indvars.iv318.us, %24
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 20
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %._crit_edge49

; <label>:29:                                     ; preds = %._crit_edge50
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc42 = call i32 @fputc(i32 10, %struct._IO_FILE* %30) #4
  br label %._crit_edge49

._crit_edge49:                                    ; preds = %._crit_edge50, %29
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv523.us, i64 %indvars.iv318.us
  %33 = load double, double* %32, align 8
  %34 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %33) #5
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv318.us, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next4.us, 1200
  br i1 %exitcond2, label %._crit_edge21.us, label %._crit_edge50

._crit_edge21.us:                                 ; preds = %._crit_edge49
  %indvars.iv.next6.us = add nuw nsw i64 %indvars.iv523.us, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next6.us, 1000
  br i1 %exitcond3, label %._crit_edge48, label %.lr.ph25.split.us

._crit_edge48:                                    ; preds = %._crit_edge21.us
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  br label %.lr.ph14.split.us

.lr.ph14.split.us:                                ; preds = %._crit_edge.us, %._crit_edge48
  %indvars.iv112.us = phi i64 [ %indvars.iv.next2.us, %._crit_edge.us ], [ 0, %._crit_edge48 ]
  %39 = mul nuw nsw i64 %indvars.iv112.us, 1000
  br label %._crit_edge53

._crit_edge53:                                    ; preds = %._crit_edge52, %.lr.ph14.split.us
  %indvars.iv11.us = phi i64 [ 0, %.lr.ph14.split.us ], [ %indvars.iv.next.us, %._crit_edge52 ]
  %40 = add nuw nsw i64 %indvars.iv11.us, %39
  %41 = trunc i64 %40 to i32
  %42 = srem i32 %41, 20
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %44, label %._crit_edge52

; <label>:44:                                     ; preds = %._crit_edge53
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %45) #4
  br label %._crit_edge52

._crit_edge52:                                    ; preds = %._crit_edge53, %44
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv112.us, i64 %indvars.iv11.us
  %48 = load double, double* %47, align 8
  %49 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %48) #5
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv11.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge53

._crit_edge.us:                                   ; preds = %._crit_edge52
  %indvars.iv.next2.us = add nuw nsw i64 %indvars.iv112.us, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next2.us, 1000
  br i1 %exitcond1, label %._crit_edge51, label %.lr.ph14.split.us

._crit_edge51:                                    ; preds = %._crit_edge.us
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %51 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %50, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #3

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { cold }
attributes #5 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !7, !8}
!16 = distinct !{!16, !7, !8}
!17 = !{!18}
!18 = distinct !{!18, !19}
!19 = distinct !{!19, !"LVerDomain"}
!20 = !{!21}
!21 = distinct !{!21, !19}
!22 = distinct !{!22, !7, !8}
!23 = distinct !{!23, !7, !8}
!24 = !{!25}
!25 = distinct !{!25, !26}
!26 = distinct !{!26, !"LVerDomain"}
!27 = !{!28, !29}
!28 = distinct !{!28, !26}
!29 = distinct !{!29, !26}
!30 = !{!28}
!31 = !{!29}
!32 = distinct !{!32, !7, !8}
!33 = distinct !{!33, !7, !8}
