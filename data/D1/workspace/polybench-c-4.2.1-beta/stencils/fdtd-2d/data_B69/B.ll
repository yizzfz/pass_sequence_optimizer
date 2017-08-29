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
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 500, i32 8) #3
  %7 = bitcast i8* %3 to [1200 x double]*
  %8 = bitcast i8* %4 to [1200 x double]*
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  tail call void @init_array([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_start() #3
  tail call void @kernel_fdtd_2d([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %._crit_edge

; <label>:15:                                     ; preds = %12
  tail call void @print_array([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  tail call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline nounwind uwtable
define internal void @init_array([1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #0 {
.lr.ph12.preheader:
  br label %.lr.ph12

.preheader.preheader.us:                          ; preds = %.preheader.preheader.us.preheader, %.preheader._crit_edge.us
  %indvars.iv38.us = phi i64 [ %indvars.iv.next4.us, %.preheader._crit_edge.us ], [ 0, %.preheader.preheader.us.preheader ]
  %4 = trunc i64 %indvars.iv38.us to i32
  %5 = sitofp i32 %4 to double
  %6 = insertelement <2 x double> undef, double %5, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us, %.preheader.preheader.us
  %indvars.iv7.us = phi i64 [ 0, %.preheader.preheader.us ], [ %indvars.iv.next.us, %.preheader.us ]
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv7.us, 1
  %8 = trunc i64 %indvars.iv.next.us to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv38.us, i64 %indvars.iv7.us
  %11 = add nuw nsw i64 %indvars.iv7.us, 2
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fmul <2 x double> %7, %15
  %17 = fdiv <2 x double> %16, <double 1.000000e+03, double 1.200000e+03>
  %18 = extractelement <2 x double> %17, i32 0
  %19 = extractelement <2 x double> %17, i32 1
  store double %18, double* %10, align 8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv38.us, i64 %indvars.iv7.us
  store double %19, double* %20, align 8
  %21 = add nuw nsw i64 %indvars.iv7.us, 3
  %22 = trunc i64 %21 to i32
  %23 = sitofp i32 %22 to double
  %24 = fmul double %5, %23
  %25 = fdiv double %24, 1.000000e+03
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv38.us, i64 %indvars.iv7.us
  store double %25, double* %26, align 8
  %exitcond = icmp eq i64 %indvars.iv7.us, 1199
  br i1 %exitcond, label %.preheader._crit_edge.us, label %.preheader.us

.preheader._crit_edge.us:                         ; preds = %.preheader.us
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv38.us, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next4.us, 1000
  br i1 %exitcond16, label %._crit_edge, label %.preheader.preheader.us

.lr.ph12:                                         ; preds = %.lr.ph12, %.lr.ph12.preheader
  %indvars.iv510 = phi i64 [ 0, %.lr.ph12.preheader ], [ %indvars.iv.next6.4, %.lr.ph12 ]
  %27 = trunc i64 %indvars.iv510 to i32
  %28 = sitofp i32 %27 to double
  %29 = getelementptr inbounds double, double* %3, i64 %indvars.iv510
  %30 = bitcast double* %29 to <2 x double>*
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv510, 1
  %31 = trunc i64 %indvars.iv.next6 to i32
  %32 = sitofp i32 %31 to double
  %33 = insertelement <2 x double> undef, double %28, i32 0
  %34 = insertelement <2 x double> %33, double %32, i32 1
  store <2 x double> %34, <2 x double>* %30, align 8
  %indvars.iv.next6.1 = add nsw i64 %indvars.iv510, 2
  %35 = trunc i64 %indvars.iv.next6.1 to i32
  %36 = sitofp i32 %35 to double
  %37 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next6.1
  %38 = bitcast double* %37 to <2 x double>*
  %indvars.iv.next6.2 = add nsw i64 %indvars.iv510, 3
  %39 = trunc i64 %indvars.iv.next6.2 to i32
  %40 = sitofp i32 %39 to double
  %41 = insertelement <2 x double> undef, double %36, i32 0
  %42 = insertelement <2 x double> %41, double %40, i32 1
  store <2 x double> %42, <2 x double>* %38, align 8
  %indvars.iv.next6.3 = add nsw i64 %indvars.iv510, 4
  %43 = trunc i64 %indvars.iv.next6.3 to i32
  %44 = sitofp i32 %43 to double
  %45 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next6.3
  store double %44, double* %45, align 8
  %exitcond15.4 = icmp eq i64 %indvars.iv.next6.3, 499
  %indvars.iv.next6.4 = add nsw i64 %indvars.iv510, 5
  br i1 %exitcond15.4, label %.preheader.preheader.us.preheader, label %.lr.ph12

.preheader.preheader.us.preheader:                ; preds = %.lr.ph12
  br label %.preheader.preheader.us

._crit_edge:                                      ; preds = %.preheader._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_fdtd_2d([1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #0 {
.preheader6.preheader.lr.ph:
  %scevgep147 = getelementptr [1200 x double], [1200 x double]* %1, i64 1, i64 0
  br label %.preheader6.preheader

.preheader6.preheader:                            ; preds = %.preheader3._crit_edge, %.preheader6.preheader.lr.ph
  %indvars.iv1934 = phi i64 [ 0, %.preheader6.preheader.lr.ph ], [ %indvars.iv.next20, %.preheader3._crit_edge ]
  %4 = getelementptr inbounds double, double* %3, i64 %indvars.iv1934
  %5 = bitcast double* %4 to [1200 x double]*
  %bound0150 = icmp ugt [1200 x double]* %5, %1
  %bound1151 = icmp ult double* %4, %scevgep147
  %memcheck.conflict153 = and i1 %bound0150, %bound1151
  br i1 %memcheck.conflict153, label %.preheader6.preheader2, label %vector.body142.preheader

vector.body142.preheader:                         ; preds = %.preheader6.preheader
  %6 = bitcast double* %4 to i64*
  br label %vector.body142

.preheader6.preheader2:                           ; preds = %.preheader6.preheader
  %7 = bitcast double* %4 to i64*
  br label %.preheader6

vector.body142:                                   ; preds = %vector.body142, %vector.body142.preheader
  %index156 = phi i64 [ 0, %vector.body142.preheader ], [ %index.next157.2, %vector.body142 ]
  %8 = load i64, i64* %6, align 8, !alias.scope !1
  %9 = insertelement <2 x i64> undef, i64 %8, i32 0
  %10 = shufflevector <2 x i64> %9, <2 x i64> undef, <2 x i32> zeroinitializer
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index156
  %12 = bitcast double* %11 to <2 x i64>*
  store <2 x i64> %10, <2 x i64>* %12, align 8, !alias.scope !4, !noalias !1
  %13 = getelementptr double, double* %11, i64 2
  %14 = bitcast double* %13 to <2 x i64>*
  store <2 x i64> %10, <2 x i64>* %14, align 8, !alias.scope !4, !noalias !1
  %index.next157 = add nuw nsw i64 %index156, 4
  %15 = load i64, i64* %6, align 8, !alias.scope !1
  %16 = insertelement <2 x i64> undef, i64 %15, i32 0
  %17 = shufflevector <2 x i64> %16, <2 x i64> undef, <2 x i32> zeroinitializer
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index.next157
  %19 = bitcast double* %18 to <2 x i64>*
  store <2 x i64> %17, <2 x i64>* %19, align 8, !alias.scope !4, !noalias !1
  %20 = getelementptr double, double* %18, i64 2
  %21 = bitcast double* %20 to <2 x i64>*
  store <2 x i64> %17, <2 x i64>* %21, align 8, !alias.scope !4, !noalias !1
  %index.next157.1 = add nsw i64 %index156, 8
  %22 = load i64, i64* %6, align 8, !alias.scope !1
  %23 = insertelement <2 x i64> undef, i64 %22, i32 0
  %24 = shufflevector <2 x i64> %23, <2 x i64> undef, <2 x i32> zeroinitializer
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index.next157.1
  %26 = bitcast double* %25 to <2 x i64>*
  store <2 x i64> %24, <2 x i64>* %26, align 8, !alias.scope !4, !noalias !1
  %27 = getelementptr double, double* %25, i64 2
  %28 = bitcast double* %27 to <2 x i64>*
  store <2 x i64> %24, <2 x i64>* %28, align 8, !alias.scope !4, !noalias !1
  %index.next157.2 = add nsw i64 %index156, 12
  %29 = icmp eq i64 %index.next157.2, 1200
  br i1 %29, label %.preheader2.preheader.us.preheader.loopexit3, label %vector.body142, !llvm.loop !6

.preheader2.preheader.us.preheader.loopexit:      ; preds = %.preheader6
  br label %.preheader2.preheader.us.preheader

.preheader2.preheader.us.preheader.loopexit3:     ; preds = %vector.body142
  br label %.preheader2.preheader.us.preheader

.preheader2.preheader.us.preheader:               ; preds = %.preheader2.preheader.us.preheader.loopexit3, %.preheader2.preheader.us.preheader.loopexit
  br label %.preheader2.preheader.us

.preheader2.preheader.us:                         ; preds = %.preheader2.preheader.us.preheader, %.preheader2._crit_edge.us
  %indvar = phi i64 [ %30, %.preheader2._crit_edge.us ], [ 0, %.preheader2.preheader.us.preheader ]
  %indvars.iv924.us = phi i64 [ %indvars.iv.next10.us, %.preheader2._crit_edge.us ], [ 1, %.preheader2.preheader.us.preheader ]
  %30 = add nuw nsw i64 %indvar, 1
  %scevgep114 = getelementptr [1200 x double], [1200 x double]* %1, i64 %30, i64 0
  %31 = add nuw nsw i64 %indvar, 2
  %scevgep116 = getelementptr [1200 x double], [1200 x double]* %1, i64 %31, i64 0
  %scevgep118 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvar, i64 0
  %scevgep120 = getelementptr [1200 x double], [1200 x double]* %2, i64 %31, i64 0
  %32 = add nsw i64 %indvars.iv924.us, -1
  %bound0122 = icmp ult double* %scevgep114, %scevgep120
  %bound1123 = icmp ult double* %scevgep118, %scevgep116
  %memcheck.conflict125 = and i1 %bound0122, %bound1123
  br i1 %memcheck.conflict125, label %.preheader2.us.preheader, label %vector.body109.preheader

vector.body109.preheader:                         ; preds = %.preheader2.preheader.us
  br label %vector.body109

.preheader2.us.preheader:                         ; preds = %.preheader2.preheader.us
  br label %.preheader2.us

vector.body109:                                   ; preds = %vector.body109.preheader, %vector.body109
  %index128 = phi i64 [ %index.next129, %vector.body109 ], [ 0, %vector.body109.preheader ]
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv924.us, i64 %index128
  %34 = bitcast double* %33 to <2 x double>*
  %wide.load136 = load <2 x double>, <2 x double>* %34, align 8, !alias.scope !9, !noalias !12
  %35 = getelementptr double, double* %33, i64 2
  %36 = bitcast double* %35 to <2 x double>*
  %wide.load137 = load <2 x double>, <2 x double>* %36, align 8, !alias.scope !9, !noalias !12
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv924.us, i64 %index128
  %38 = bitcast double* %37 to <2 x double>*
  %wide.load138 = load <2 x double>, <2 x double>* %38, align 8, !alias.scope !12
  %39 = getelementptr double, double* %37, i64 2
  %40 = bitcast double* %39 to <2 x double>*
  %wide.load139 = load <2 x double>, <2 x double>* %40, align 8, !alias.scope !12
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %32, i64 %index128
  %42 = bitcast double* %41 to <2 x double>*
  %wide.load140 = load <2 x double>, <2 x double>* %42, align 8, !alias.scope !12
  %43 = getelementptr double, double* %41, i64 2
  %44 = bitcast double* %43 to <2 x double>*
  %wide.load141 = load <2 x double>, <2 x double>* %44, align 8, !alias.scope !12
  %45 = fsub <2 x double> %wide.load138, %wide.load140
  %46 = fsub <2 x double> %wide.load139, %wide.load141
  %47 = fmul <2 x double> %45, <double 5.000000e-01, double 5.000000e-01>
  %48 = fmul <2 x double> %46, <double 5.000000e-01, double 5.000000e-01>
  %49 = fsub <2 x double> %wide.load136, %47
  %50 = fsub <2 x double> %wide.load137, %48
  store <2 x double> %49, <2 x double>* %34, align 8, !alias.scope !9, !noalias !12
  store <2 x double> %50, <2 x double>* %36, align 8, !alias.scope !9, !noalias !12
  %index.next129 = add nuw nsw i64 %index128, 4
  %51 = icmp eq i64 %index.next129, 1200
  br i1 %51, label %.preheader2._crit_edge.us.loopexit1, label %vector.body109, !llvm.loop !14

.preheader2.us:                                   ; preds = %.preheader2.us, %.preheader2.us.preheader
  %indvars.iv722.us = phi i64 [ 0, %.preheader2.us.preheader ], [ %indvars.iv.next8.us.1, %.preheader2.us ]
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv924.us, i64 %indvars.iv722.us
  %53 = load double, double* %52, align 8
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv924.us, i64 %indvars.iv722.us
  %55 = load double, double* %54, align 8
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %32, i64 %indvars.iv722.us
  %57 = load double, double* %56, align 8
  %58 = fsub double %55, %57
  %59 = fmul double %58, 5.000000e-01
  %60 = fsub double %53, %59
  store double %60, double* %52, align 8
  %indvars.iv.next8.us = or i64 %indvars.iv722.us, 1
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv924.us, i64 %indvars.iv.next8.us
  %62 = load double, double* %61, align 8
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv924.us, i64 %indvars.iv.next8.us
  %64 = load double, double* %63, align 8
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %32, i64 %indvars.iv.next8.us
  %66 = load double, double* %65, align 8
  %67 = fsub double %64, %66
  %68 = fmul double %67, 5.000000e-01
  %69 = fsub double %62, %68
  store double %69, double* %61, align 8
  %exitcond39.1 = icmp eq i64 %indvars.iv.next8.us, 1199
  %indvars.iv.next8.us.1 = add nsw i64 %indvars.iv722.us, 2
  br i1 %exitcond39.1, label %.preheader2._crit_edge.us.loopexit, label %.preheader2.us, !llvm.loop !15

.preheader2._crit_edge.us.loopexit:               ; preds = %.preheader2.us
  br label %.preheader2._crit_edge.us

.preheader2._crit_edge.us.loopexit1:              ; preds = %vector.body109
  br label %.preheader2._crit_edge.us

.preheader2._crit_edge.us:                        ; preds = %.preheader2._crit_edge.us.loopexit1, %.preheader2._crit_edge.us.loopexit
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv924.us, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next10.us, 1000
  br i1 %exitcond42, label %.preheader1.preheader.us.preheader, label %.preheader2.preheader.us

.preheader1.preheader.us.preheader:               ; preds = %.preheader2._crit_edge.us
  br label %.preheader1.preheader.us

.preheader6:                                      ; preds = %.preheader6, %.preheader6.preheader2
  %indvars.iv21 = phi i64 [ 0, %.preheader6.preheader2 ], [ %indvars.iv.next.7, %.preheader6 ]
  %70 = load i64, i64* %7, align 8
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv21
  %72 = bitcast double* %71 to i64*
  store i64 %70, i64* %72, align 8
  %indvars.iv.next = or i64 %indvars.iv21, 1
  %73 = load i64, i64* %7, align 8
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next
  %75 = bitcast double* %74 to i64*
  store i64 %73, i64* %75, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv21, 2
  %76 = load i64, i64* %7, align 8
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.1
  %78 = bitcast double* %77 to i64*
  store i64 %76, i64* %78, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv21, 3
  %79 = load i64, i64* %7, align 8
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.2
  %81 = bitcast double* %80 to i64*
  store i64 %79, i64* %81, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv21, 4
  %82 = load i64, i64* %7, align 8
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.3
  %84 = bitcast double* %83 to i64*
  store i64 %82, i64* %84, align 8
  %indvars.iv.next.4 = or i64 %indvars.iv21, 5
  %85 = load i64, i64* %7, align 8
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.4
  %87 = bitcast double* %86 to i64*
  store i64 %85, i64* %87, align 8
  %indvars.iv.next.5 = or i64 %indvars.iv21, 6
  %88 = load i64, i64* %7, align 8
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.5
  %90 = bitcast double* %89 to i64*
  store i64 %88, i64* %90, align 8
  %indvars.iv.next.6 = or i64 %indvars.iv21, 7
  %91 = load i64, i64* %7, align 8
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.6
  %93 = bitcast double* %92 to i64*
  store i64 %91, i64* %93, align 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.6, 1199
  %indvars.iv.next.7 = add nsw i64 %indvars.iv21, 8
  br i1 %exitcond.7, label %.preheader2.preheader.us.preheader.loopexit, label %.preheader6, !llvm.loop !16

.preheader1.preheader.us:                         ; preds = %.preheader1.preheader.us.preheader, %.preheader1._crit_edge.us
  %indvars.iv1328.us = phi i64 [ %94, %.preheader1._crit_edge.us ], [ 0, %.preheader1.preheader.us.preheader ]
  %scevgep81 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv1328.us, i64 1
  %94 = add nuw nsw i64 %indvars.iv1328.us, 1
  %scevgep83 = getelementptr [1200 x double], [1200 x double]* %0, i64 %94, i64 0
  %scevgep85 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv1328.us, i64 0
  %scevgep87 = getelementptr [1200 x double], [1200 x double]* %2, i64 %94, i64 0
  %bound089 = icmp ult double* %scevgep81, %scevgep87
  %bound190 = icmp ult double* %scevgep85, %scevgep83
  %memcheck.conflict92 = and i1 %bound089, %bound190
  br i1 %memcheck.conflict92, label %.preheader1.us.preheader, label %vector.body76.preheader

vector.body76.preheader:                          ; preds = %.preheader1.preheader.us
  br label %vector.body76

vector.body76:                                    ; preds = %vector.body76.preheader, %vector.body76
  %index95 = phi i64 [ %index.next96, %vector.body76 ], [ 0, %vector.body76.preheader ]
  %offset.idx = or i64 %index95, 1
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1328.us, i64 %offset.idx
  %96 = bitcast double* %95 to <2 x double>*
  %wide.load103 = load <2 x double>, <2 x double>* %96, align 8, !alias.scope !17, !noalias !20
  %97 = getelementptr double, double* %95, i64 2
  %98 = bitcast double* %97 to <2 x double>*
  %wide.load104 = load <2 x double>, <2 x double>* %98, align 8, !alias.scope !17, !noalias !20
  %99 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1328.us, i64 %offset.idx
  %100 = bitcast double* %99 to <2 x double>*
  %wide.load105 = load <2 x double>, <2 x double>* %100, align 8, !alias.scope !20
  %101 = getelementptr double, double* %99, i64 2
  %102 = bitcast double* %101 to <2 x double>*
  %wide.load106 = load <2 x double>, <2 x double>* %102, align 8, !alias.scope !20
  %103 = add nsw i64 %offset.idx, -1
  %104 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1328.us, i64 %103
  %105 = bitcast double* %104 to <2 x double>*
  %wide.load107 = load <2 x double>, <2 x double>* %105, align 8, !alias.scope !20
  %106 = getelementptr double, double* %104, i64 2
  %107 = bitcast double* %106 to <2 x double>*
  %wide.load108 = load <2 x double>, <2 x double>* %107, align 8, !alias.scope !20
  %108 = fsub <2 x double> %wide.load105, %wide.load107
  %109 = fsub <2 x double> %wide.load106, %wide.load108
  %110 = fmul <2 x double> %108, <double 5.000000e-01, double 5.000000e-01>
  %111 = fmul <2 x double> %109, <double 5.000000e-01, double 5.000000e-01>
  %112 = fsub <2 x double> %wide.load103, %110
  %113 = fsub <2 x double> %wide.load104, %111
  store <2 x double> %112, <2 x double>* %96, align 8, !alias.scope !17, !noalias !20
  store <2 x double> %113, <2 x double>* %98, align 8, !alias.scope !17, !noalias !20
  %index.next96 = add nuw nsw i64 %index95, 4
  %114 = icmp eq i64 %index.next96, 1196
  br i1 %114, label %.preheader1.us.preheader.loopexit, label %vector.body76, !llvm.loop !22

.preheader1.us.preheader.loopexit:                ; preds = %vector.body76
  br label %.preheader1.us.preheader

.preheader1.us.preheader:                         ; preds = %.preheader1.us.preheader.loopexit, %.preheader1.preheader.us
  %indvars.iv1126.us.ph = phi i64 [ 1, %.preheader1.preheader.us ], [ 1197, %.preheader1.us.preheader.loopexit ]
  br i1 true, label %.preheader1.us.prol.preheader, label %.preheader1.us.preheader..preheader1.us.prol.loopexit.unr-lcssa_crit_edge

.preheader1.us.preheader..preheader1.us.prol.loopexit.unr-lcssa_crit_edge: ; preds = %.preheader1.us.preheader
  br label %.preheader1.us.prol.loopexit.unr-lcssa

.preheader1.us.prol.preheader:                    ; preds = %.preheader1.us.preheader
  %115 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1328.us, i64 %indvars.iv1126.us.ph
  %116 = load double, double* %115, align 8
  %117 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1328.us, i64 %indvars.iv1126.us.ph
  %118 = load double, double* %117, align 8
  %119 = add nsw i64 %indvars.iv1126.us.ph, -1
  %120 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1328.us, i64 %119
  %121 = load double, double* %120, align 8
  %122 = fsub double %118, %121
  %123 = fmul double %122, 5.000000e-01
  %124 = fsub double %116, %123
  store double %124, double* %115, align 8
  %indvars.iv.next12.us.prol = add nuw nsw i64 %indvars.iv1126.us.ph, 1
  br label %.preheader1.us.prol.loopexit.unr-lcssa

.preheader1.us.prol.loopexit.unr-lcssa:           ; preds = %.preheader1.us.preheader..preheader1.us.prol.loopexit.unr-lcssa_crit_edge, %.preheader1.us.prol.preheader
  %indvars.iv1126.us.unr.ph = phi i64 [ %indvars.iv.next12.us.prol, %.preheader1.us.prol.preheader ], [ undef, %.preheader1.us.preheader..preheader1.us.prol.loopexit.unr-lcssa_crit_edge ]
  br i1 false, label %.preheader1.us.prol.loopexit.unr-lcssa..preheader1._crit_edge.us_crit_edge, label %.preheader1.us.preheader.new

.preheader1.us.prol.loopexit.unr-lcssa..preheader1._crit_edge.us_crit_edge: ; preds = %.preheader1.us.prol.loopexit.unr-lcssa
  br label %.preheader1._crit_edge.us

.preheader1.us.preheader.new:                     ; preds = %.preheader1.us.prol.loopexit.unr-lcssa
  br label %.preheader1.us

.preheader1.us:                                   ; preds = %.preheader1.us, %.preheader1.us.preheader.new
  %indvars.iv1126.us = phi i64 [ %indvars.iv1126.us.unr.ph, %.preheader1.us.preheader.new ], [ %indvars.iv.next12.us.1, %.preheader1.us ]
  %125 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1328.us, i64 %indvars.iv1126.us
  %126 = load double, double* %125, align 8
  %127 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1328.us, i64 %indvars.iv1126.us
  %128 = load double, double* %127, align 8
  %129 = add nsw i64 %indvars.iv1126.us, -1
  %130 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1328.us, i64 %129
  %131 = load double, double* %130, align 8
  %132 = fsub double %128, %131
  %133 = fmul double %132, 5.000000e-01
  %134 = fsub double %126, %133
  store double %134, double* %125, align 8
  %indvars.iv.next12.us = add nuw nsw i64 %indvars.iv1126.us, 1
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1328.us, i64 %indvars.iv.next12.us
  %136 = load double, double* %135, align 8
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1328.us, i64 %indvars.iv.next12.us
  %138 = load double, double* %137, align 8
  %139 = load double, double* %127, align 8
  %140 = fsub double %138, %139
  %141 = fmul double %140, 5.000000e-01
  %142 = fsub double %136, %141
  store double %142, double* %135, align 8
  %exitcond41.1 = icmp eq i64 %indvars.iv.next12.us, 1199
  %indvars.iv.next12.us.1 = add nsw i64 %indvars.iv1126.us, 2
  br i1 %exitcond41.1, label %.preheader1._crit_edge.us.unr-lcssa, label %.preheader1.us, !llvm.loop !23

.preheader1._crit_edge.us.unr-lcssa:              ; preds = %.preheader1.us
  br label %.preheader1._crit_edge.us

.preheader1._crit_edge.us:                        ; preds = %.preheader1.us.prol.loopexit.unr-lcssa..preheader1._crit_edge.us_crit_edge, %.preheader1._crit_edge.us.unr-lcssa
  %exitcond43 = icmp eq i64 %94, 1000
  br i1 %exitcond43, label %.preheader.preheader.us.preheader, label %.preheader1.preheader.us

.preheader.preheader.us.preheader:                ; preds = %.preheader1._crit_edge.us
  br label %.preheader.preheader.us

.preheader.preheader.us:                          ; preds = %.preheader._crit_edge.us, %.preheader.preheader.us.preheader
  %indvars.iv1732.us = phi i64 [ %143, %.preheader._crit_edge.us ], [ 0, %.preheader.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv1732.us, i64 0
  %scevgep53 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv1732.us, i64 1199
  %scevgep55 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv1732.us, i64 0
  %143 = add nuw nsw i64 %indvars.iv1732.us, 1
  %scevgep57 = getelementptr [1200 x double], [1200 x double]* %0, i64 %143, i64 0
  %scevgep59 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv1732.us, i64 0
  %scevgep61 = getelementptr [1200 x double], [1200 x double]* %1, i64 %143, i64 1199
  %bound0 = icmp ult double* %scevgep, %scevgep57
  %bound1 = icmp ult double* %scevgep55, %scevgep53
  %found.conflict = and i1 %bound0, %bound1
  %bound063 = icmp ult double* %scevgep, %scevgep61
  %bound164 = icmp ult double* %scevgep59, %scevgep53
  %found.conflict65 = and i1 %bound063, %bound164
  %conflict.rdx = or i1 %found.conflict, %found.conflict65
  br i1 %conflict.rdx, label %.preheader.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %144 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1732.us, i64 %index
  %145 = bitcast double* %144 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %145, align 8, !alias.scope !24, !noalias !27
  %146 = getelementptr double, double* %144, i64 2
  %147 = bitcast double* %146 to <2 x double>*
  %wide.load67 = load <2 x double>, <2 x double>* %147, align 8, !alias.scope !24, !noalias !27
  %148 = or i64 %index, 1
  %149 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1732.us, i64 %148
  %150 = bitcast double* %149 to <2 x double>*
  %wide.load68 = load <2 x double>, <2 x double>* %150, align 8, !alias.scope !30
  %151 = getelementptr double, double* %149, i64 2
  %152 = bitcast double* %151 to <2 x double>*
  %wide.load69 = load <2 x double>, <2 x double>* %152, align 8, !alias.scope !30
  %153 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1732.us, i64 %index
  %154 = bitcast double* %153 to <2 x double>*
  %wide.load70 = load <2 x double>, <2 x double>* %154, align 8, !alias.scope !30
  %155 = getelementptr double, double* %153, i64 2
  %156 = bitcast double* %155 to <2 x double>*
  %wide.load71 = load <2 x double>, <2 x double>* %156, align 8, !alias.scope !30
  %157 = fsub <2 x double> %wide.load68, %wide.load70
  %158 = fsub <2 x double> %wide.load69, %wide.load71
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %143, i64 %index
  %160 = bitcast double* %159 to <2 x double>*
  %wide.load72 = load <2 x double>, <2 x double>* %160, align 8, !alias.scope !31
  %161 = getelementptr double, double* %159, i64 2
  %162 = bitcast double* %161 to <2 x double>*
  %wide.load73 = load <2 x double>, <2 x double>* %162, align 8, !alias.scope !31
  %163 = fadd <2 x double> %157, %wide.load72
  %164 = fadd <2 x double> %158, %wide.load73
  %165 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1732.us, i64 %index
  %166 = bitcast double* %165 to <2 x double>*
  %wide.load74 = load <2 x double>, <2 x double>* %166, align 8, !alias.scope !31
  %167 = getelementptr double, double* %165, i64 2
  %168 = bitcast double* %167 to <2 x double>*
  %wide.load75 = load <2 x double>, <2 x double>* %168, align 8, !alias.scope !31
  %169 = fsub <2 x double> %163, %wide.load74
  %170 = fsub <2 x double> %164, %wide.load75
  %171 = fmul <2 x double> %169, <double 7.000000e-01, double 7.000000e-01>
  %172 = fmul <2 x double> %170, <double 7.000000e-01, double 7.000000e-01>
  %173 = fsub <2 x double> %wide.load, %171
  %174 = fsub <2 x double> %wide.load67, %172
  store <2 x double> %173, <2 x double>* %145, align 8, !alias.scope !24, !noalias !27
  store <2 x double> %174, <2 x double>* %147, align 8, !alias.scope !24, !noalias !27
  %index.next = add nuw nsw i64 %index, 4
  %175 = icmp eq i64 %index.next, 1196
  br i1 %175, label %.preheader.us.preheader.loopexit, label %vector.body, !llvm.loop !32

.preheader.us.preheader.loopexit:                 ; preds = %vector.body
  br label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %.preheader.us.preheader.loopexit, %.preheader.preheader.us
  %indvars.iv1530.us.ph = phi i64 [ 0, %.preheader.preheader.us ], [ 1196, %.preheader.us.preheader.loopexit ]
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %.preheader.us
  %indvars.iv1530.us = phi i64 [ %indvars.iv.next16.us, %.preheader.us ], [ %indvars.iv1530.us.ph, %.preheader.us.preheader ]
  %176 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1732.us, i64 %indvars.iv1530.us
  %177 = load double, double* %176, align 8
  %indvars.iv.next16.us = add nuw nsw i64 %indvars.iv1530.us, 1
  %178 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1732.us, i64 %indvars.iv.next16.us
  %179 = load double, double* %178, align 8
  %180 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1732.us, i64 %indvars.iv1530.us
  %181 = load double, double* %180, align 8
  %182 = fsub double %179, %181
  %183 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %143, i64 %indvars.iv1530.us
  %184 = load double, double* %183, align 8
  %185 = fadd double %182, %184
  %186 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1732.us, i64 %indvars.iv1530.us
  %187 = load double, double* %186, align 8
  %188 = fsub double %185, %187
  %189 = fmul double %188, 7.000000e-01
  %190 = fsub double %177, %189
  store double %190, double* %176, align 8
  %191 = icmp slt i64 %indvars.iv.next16.us, 1199
  br i1 %191, label %.preheader.us, label %.preheader._crit_edge.us, !llvm.loop !33

.preheader._crit_edge.us:                         ; preds = %.preheader.us
  %exitcond4 = icmp eq i64 %143, 999
  br i1 %exitcond4, label %.preheader3._crit_edge, label %.preheader.preheader.us

.preheader3._crit_edge:                           ; preds = %.preheader._crit_edge.us
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv1934, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next20, 500
  br i1 %exitcond44, label %._crit_edge, label %.preheader6.preheader

._crit_edge:                                      ; preds = %.preheader3._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]*, [1200 x double]*, [1200 x double]*) #0 {
..preheader8.preheader.us_crit_edge:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #4
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader8.preheader.us

.preheader8.preheader.us:                         ; preds = %.preheader8._crit_edge.us, %..preheader8.preheader.us_crit_edge
  %indvars.iv1729.us = phi i64 [ %indvars.iv.next18.us, %.preheader8._crit_edge.us ], [ 0, %..preheader8.preheader.us_crit_edge ]
  %7 = mul nuw nsw i64 %indvars.iv1729.us, 1000
  br label %.preheader8.us._crit_edge

.preheader8.us._crit_edge:                        ; preds = %.preheader8.us, %.preheader8.preheader.us
  %indvars.iv1527.us = phi i64 [ 0, %.preheader8.preheader.us ], [ %indvars.iv.next16.us, %.preheader8.us ]
  %8 = add nuw nsw i64 %indvars.iv1527.us, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %.preheader8.us

; <label>:12:                                     ; preds = %.preheader8.us._crit_edge
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc6.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #4
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %.preheader8.us._crit_edge, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1729.us, i64 %indvars.iv1527.us
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next16.us = add nuw nsw i64 %indvars.iv1527.us, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next16.us, 1200
  br i1 %exitcond40, label %.preheader8._crit_edge.us, label %.preheader8.us._crit_edge

.preheader8._crit_edge.us:                        ; preds = %.preheader8.us
  %indvars.iv.next18.us = add nuw nsw i64 %indvars.iv1729.us, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next18.us, 1000
  br i1 %exitcond41, label %._crit_edge31, label %.preheader8.preheader.us

._crit_edge31:                                    ; preds = %.preheader8._crit_edge.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #4
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  br label %.preheader7.preheader.us

.preheader7.preheader.us:                         ; preds = %.preheader7._crit_edge.us, %._crit_edge31
  %indvars.iv1324.us = phi i64 [ %indvars.iv.next14.us, %.preheader7._crit_edge.us ], [ 0, %._crit_edge31 ]
  %24 = mul nuw nsw i64 %indvars.iv1324.us, 1000
  br label %.preheader7.us._crit_edge

.preheader7.us._crit_edge:                        ; preds = %.preheader7.us, %.preheader7.preheader.us
  %indvars.iv1122.us = phi i64 [ 0, %.preheader7.preheader.us ], [ %indvars.iv.next12.us, %.preheader7.us ]
  %25 = add nuw nsw i64 %indvars.iv1122.us, %24
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 20
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %.preheader7.us

; <label>:29:                                     ; preds = %.preheader7.us._crit_edge
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %30) #4
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %.preheader7.us._crit_edge, %29
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1324.us, i64 %indvars.iv1122.us
  %33 = load double, double* %32, align 8
  %34 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %33) #5
  %indvars.iv.next12.us = add nuw nsw i64 %indvars.iv1122.us, 1
  %exitcond38 = icmp eq i64 %indvars.iv.next12.us, 1200
  br i1 %exitcond38, label %.preheader7._crit_edge.us, label %.preheader7.us._crit_edge

.preheader7._crit_edge.us:                        ; preds = %.preheader7.us
  %indvars.iv.next14.us = add nuw nsw i64 %indvars.iv1324.us, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next14.us, 1000
  br i1 %exitcond39, label %._crit_edge26, label %.preheader7.preheader.us

._crit_edge26:                                    ; preds = %.preheader7._crit_edge.us
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  br label %.preheader.preheader.us

.preheader.preheader.us:                          ; preds = %.preheader._crit_edge.us, %._crit_edge26
  %indvars.iv920.us = phi i64 [ %indvars.iv.next10.us, %.preheader._crit_edge.us ], [ 0, %._crit_edge26 ]
  %39 = mul nuw nsw i64 %indvars.iv920.us, 1000
  br label %.preheader.us._crit_edge

.preheader.us._crit_edge:                         ; preds = %.preheader.us, %.preheader.preheader.us
  %indvars.iv19.us = phi i64 [ 0, %.preheader.preheader.us ], [ %indvars.iv.next.us, %.preheader.us ]
  %40 = add nuw nsw i64 %indvars.iv19.us, %39
  %41 = trunc i64 %40 to i32
  %42 = srem i32 %41, 20
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %44, label %.preheader.us

; <label>:44:                                     ; preds = %.preheader.us._crit_edge
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %45) #4
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us._crit_edge, %44
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv920.us, i64 %indvars.iv19.us
  %48 = load double, double* %47, align 8
  %49 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %48) #5
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv19.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond, label %.preheader._crit_edge.us, label %.preheader.us._crit_edge

.preheader._crit_edge.us:                         ; preds = %.preheader.us
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv920.us, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next10.us, 1000
  br i1 %exitcond37, label %._crit_edge, label %.preheader.preheader.us

._crit_edge:                                      ; preds = %.preheader._crit_edge.us
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %51 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %50, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
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
!9 = !{!10}
!10 = distinct !{!10, !11}
!11 = distinct !{!11, !"LVerDomain"}
!12 = !{!13}
!13 = distinct !{!13, !11}
!14 = distinct !{!14, !7, !8}
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
