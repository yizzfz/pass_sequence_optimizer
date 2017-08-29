; ModuleID = 'A.ll'
source_filename = "fdtd-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"ex\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1
@.str.8 = private unnamed_addr constant [3 x i8] c"ey\00", align 1
@.str.9 = private unnamed_addr constant [3 x i8] c"hz\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %4 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %6 = tail call i8* @polybench_alloc_data(i64 500, i32 8) #3
  %7 = bitcast i8* %3 to [1200 x double]*
  %8 = bitcast i8* %4 to [1200 x double]*
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_fdtd_2d([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
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
  tail call fastcc void @print_array([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #3
  tail call void @free(i8* %4) #3
  tail call void @free(i8* %5) #3
  tail call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([1200 x double]*, [1200 x double]*, [1200 x double]*, double*) unnamed_addr #0 {
.lr.ph4.preheader:
  br label %.lr.ph4

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %4 = trunc i64 %indvars.iv6 to i32
  %5 = sitofp i32 %4 to double
  %6 = insertelement <2 x double> undef, double %5, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %8 = trunc i64 %indvars.iv.next to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv6, i64 %indvars.iv
  %11 = add nuw nsw i64 %indvars.iv, 2
  %12 = trunc i64 %11 to i32
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %9, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  %16 = fmul <2 x double> %7, %15
  %17 = fdiv <2 x double> %16, <double 1.000000e+03, double 1.200000e+03>
  %18 = extractelement <2 x double> %17, i32 0
  %19 = extractelement <2 x double> %17, i32 1
  store double %18, double* %10, align 8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv6, i64 %indvars.iv
  store double %19, double* %20, align 8
  %21 = add nuw nsw i64 %indvars.iv, 3
  %22 = trunc i64 %21 to i32
  %23 = sitofp i32 %22 to double
  %24 = fmul double %5, %23
  %25 = fdiv double %24, 1.000000e+03
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv6, i64 %indvars.iv
  store double %25, double* %26, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1199
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next7, 1000
  br i1 %exitcond1, label %._crit_edge2, label %.preheader.us

.lr.ph4:                                          ; preds = %.lr.ph4, %.lr.ph4.preheader
  %indvars.iv9 = phi i64 [ 0, %.lr.ph4.preheader ], [ %indvars.iv.next10.4, %.lr.ph4 ]
  %27 = trunc i64 %indvars.iv9 to i32
  %28 = sitofp i32 %27 to double
  %29 = getelementptr inbounds double, double* %3, i64 %indvars.iv9
  store double %28, double* %29, align 8
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %30 = trunc i64 %indvars.iv.next10 to i32
  %31 = sitofp i32 %30 to double
  %32 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next10
  store double %31, double* %32, align 8
  %indvars.iv.next10.1 = add nsw i64 %indvars.iv9, 2
  %33 = trunc i64 %indvars.iv.next10.1 to i32
  %34 = sitofp i32 %33 to double
  %35 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next10.1
  store double %34, double* %35, align 8
  %indvars.iv.next10.2 = add nsw i64 %indvars.iv9, 3
  %36 = trunc i64 %indvars.iv.next10.2 to i32
  %37 = sitofp i32 %36 to double
  %38 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next10.2
  store double %37, double* %38, align 8
  %indvars.iv.next10.3 = add nsw i64 %indvars.iv9, 4
  %39 = trunc i64 %indvars.iv.next10.3 to i32
  %40 = sitofp i32 %39 to double
  %41 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next10.3
  store double %40, double* %41, align 8
  %exitcond12.4 = icmp eq i64 %indvars.iv.next10.3, 499
  %indvars.iv.next10.4 = add nsw i64 %indvars.iv9, 5
  br i1 %exitcond12.4, label %.preheader.us.preheader, label %.lr.ph4

.preheader.us.preheader:                          ; preds = %.lr.ph4
  br label %.preheader.us

._crit_edge2:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_fdtd_2d([1200 x double]*, [1200 x double]*, [1200 x double]*, double*) unnamed_addr #0 {
.preheader6.lr.ph:
  %scevgep145 = getelementptr [1200 x double], [1200 x double]* %1, i64 1, i64 0
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge12, %.preheader6.lr.ph
  %indvars.iv41 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next42, %._crit_edge12 ]
  %4 = getelementptr inbounds double, double* %3, i64 %indvars.iv41
  %5 = bitcast double* %4 to [1200 x double]*
  %bound0148 = icmp ugt [1200 x double]* %5, %1
  %bound1149 = icmp ult double* %4, %scevgep145
  %memcheck.conflict151 = and i1 %bound0148, %bound1149
  br i1 %memcheck.conflict151, label %scalar.ph142.preheader, label %vector.body140.preheader

vector.body140.preheader:                         ; preds = %.preheader6
  br label %vector.body140

scalar.ph142.preheader:                           ; preds = %.preheader6
  br label %scalar.ph142

vector.body140:                                   ; preds = %vector.body140, %vector.body140.preheader
  %index154 = phi i64 [ 0, %vector.body140.preheader ], [ %index.next155.2, %vector.body140 ]
  %6 = bitcast double* %4 to i64*
  %7 = load i64, i64* %6, align 8, !alias.scope !1
  %8 = insertelement <2 x i64> undef, i64 %7, i32 0
  %9 = shufflevector <2 x i64> %8, <2 x i64> undef, <2 x i32> zeroinitializer
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index154
  %11 = bitcast double* %10 to <2 x i64>*
  store <2 x i64> %9, <2 x i64>* %11, align 8, !alias.scope !4, !noalias !1
  %12 = getelementptr double, double* %10, i64 2
  %13 = bitcast double* %12 to <2 x i64>*
  store <2 x i64> %9, <2 x i64>* %13, align 8, !alias.scope !4, !noalias !1
  %index.next155 = add nuw nsw i64 %index154, 4
  %14 = load i64, i64* %6, align 8, !alias.scope !1
  %15 = insertelement <2 x i64> undef, i64 %14, i32 0
  %16 = shufflevector <2 x i64> %15, <2 x i64> undef, <2 x i32> zeroinitializer
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index.next155
  %18 = bitcast double* %17 to <2 x i64>*
  store <2 x i64> %16, <2 x i64>* %18, align 8, !alias.scope !4, !noalias !1
  %19 = getelementptr double, double* %17, i64 2
  %20 = bitcast double* %19 to <2 x i64>*
  store <2 x i64> %16, <2 x i64>* %20, align 8, !alias.scope !4, !noalias !1
  %index.next155.1 = add nsw i64 %index154, 8
  %21 = load i64, i64* %6, align 8, !alias.scope !1
  %22 = insertelement <2 x i64> undef, i64 %21, i32 0
  %23 = shufflevector <2 x i64> %22, <2 x i64> undef, <2 x i32> zeroinitializer
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index.next155.1
  %25 = bitcast double* %24 to <2 x i64>*
  store <2 x i64> %23, <2 x i64>* %25, align 8, !alias.scope !4, !noalias !1
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x i64>*
  store <2 x i64> %23, <2 x i64>* %27, align 8, !alias.scope !4, !noalias !1
  %index.next155.2 = add nsw i64 %index154, 12
  %28 = icmp eq i64 %index.next155.2, 1200
  br i1 %28, label %.preheader2.us.preheader.loopexit8, label %vector.body140, !llvm.loop !6

.preheader2.us.preheader.loopexit:                ; preds = %scalar.ph142
  br label %.preheader2.us.preheader

.preheader2.us.preheader.loopexit8:               ; preds = %vector.body140
  br label %.preheader2.us.preheader

.preheader2.us.preheader:                         ; preds = %.preheader2.us.preheader.loopexit8, %.preheader2.us.preheader.loopexit
  br label %.preheader2.us

.preheader2.us:                                   ; preds = %._crit_edge.us, %.preheader2.us.preheader
  %indvar = phi i64 [ %29, %._crit_edge.us ], [ 0, %.preheader2.us.preheader ]
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %._crit_edge.us ], [ 1, %.preheader2.us.preheader ]
  %29 = add nuw nsw i64 %indvar, 1
  %scevgep112 = getelementptr [1200 x double], [1200 x double]* %1, i64 %29, i64 0
  %30 = add nuw nsw i64 %indvar, 2
  %scevgep114 = getelementptr [1200 x double], [1200 x double]* %1, i64 %30, i64 0
  %scevgep116 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvar, i64 0
  %scevgep118 = getelementptr [1200 x double], [1200 x double]* %2, i64 %30, i64 0
  %31 = add nsw i64 %indvars.iv25, -1
  %bound0120 = icmp ult double* %scevgep112, %scevgep118
  %bound1121 = icmp ult double* %scevgep116, %scevgep114
  %memcheck.conflict123 = and i1 %bound0120, %bound1121
  br i1 %memcheck.conflict123, label %scalar.ph109.preheader, label %vector.body107.preheader

vector.body107.preheader:                         ; preds = %.preheader2.us
  br label %vector.body107

scalar.ph109.preheader:                           ; preds = %.preheader2.us
  br label %scalar.ph109

vector.body107:                                   ; preds = %vector.body107.preheader, %vector.body107
  %index126 = phi i64 [ %index.next127, %vector.body107 ], [ 0, %vector.body107.preheader ]
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv25, i64 %index126
  %33 = bitcast double* %32 to <2 x double>*
  %wide.load134 = load <2 x double>, <2 x double>* %33, align 8, !alias.scope !9, !noalias !12
  %34 = getelementptr double, double* %32, i64 2
  %35 = bitcast double* %34 to <2 x double>*
  %wide.load135 = load <2 x double>, <2 x double>* %35, align 8, !alias.scope !9, !noalias !12
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv25, i64 %index126
  %37 = bitcast double* %36 to <2 x double>*
  %wide.load136 = load <2 x double>, <2 x double>* %37, align 8, !alias.scope !12
  %38 = getelementptr double, double* %36, i64 2
  %39 = bitcast double* %38 to <2 x double>*
  %wide.load137 = load <2 x double>, <2 x double>* %39, align 8, !alias.scope !12
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %31, i64 %index126
  %41 = bitcast double* %40 to <2 x double>*
  %wide.load138 = load <2 x double>, <2 x double>* %41, align 8, !alias.scope !12
  %42 = getelementptr double, double* %40, i64 2
  %43 = bitcast double* %42 to <2 x double>*
  %wide.load139 = load <2 x double>, <2 x double>* %43, align 8, !alias.scope !12
  %44 = fsub <2 x double> %wide.load136, %wide.load138
  %45 = fsub <2 x double> %wide.load137, %wide.load139
  %46 = fmul <2 x double> %44, <double 5.000000e-01, double 5.000000e-01>
  %47 = fmul <2 x double> %45, <double 5.000000e-01, double 5.000000e-01>
  %48 = fsub <2 x double> %wide.load134, %46
  %49 = fsub <2 x double> %wide.load135, %47
  store <2 x double> %48, <2 x double>* %33, align 8, !alias.scope !9, !noalias !12
  store <2 x double> %49, <2 x double>* %35, align 8, !alias.scope !9, !noalias !12
  %index.next127 = add nuw nsw i64 %index126, 4
  %50 = icmp eq i64 %index.next127, 1200
  br i1 %50, label %._crit_edge.us.loopexit7, label %vector.body107, !llvm.loop !14

scalar.ph109:                                     ; preds = %scalar.ph109, %scalar.ph109.preheader
  %indvars.iv21 = phi i64 [ 0, %scalar.ph109.preheader ], [ %indvars.iv.next22.1, %scalar.ph109 ]
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv21
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv25, i64 %indvars.iv21
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %31, i64 %indvars.iv21
  %56 = load double, double* %55, align 8
  %57 = fsub double %54, %56
  %58 = fmul double %57, 5.000000e-01
  %59 = fsub double %52, %58
  store double %59, double* %51, align 8
  %indvars.iv.next22 = or i64 %indvars.iv21, 1
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv.next22
  %61 = load double, double* %60, align 8
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv25, i64 %indvars.iv.next22
  %63 = load double, double* %62, align 8
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %31, i64 %indvars.iv.next22
  %65 = load double, double* %64, align 8
  %66 = fsub double %63, %65
  %67 = fmul double %66, 5.000000e-01
  %68 = fsub double %61, %67
  store double %68, double* %60, align 8
  %exitcond24.1 = icmp eq i64 %indvars.iv.next22, 1199
  %indvars.iv.next22.1 = add nsw i64 %indvars.iv21, 2
  br i1 %exitcond24.1, label %._crit_edge.us.loopexit, label %scalar.ph109, !llvm.loop !15

._crit_edge.us.loopexit:                          ; preds = %scalar.ph109
  br label %._crit_edge.us

._crit_edge.us.loopexit7:                         ; preds = %vector.body107
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit7, %._crit_edge.us.loopexit
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond3 = icmp eq i64 %29, 999
  br i1 %exitcond3, label %.preheader1.us.preheader, label %.preheader2.us

.preheader1.us.preheader:                         ; preds = %._crit_edge.us
  br label %.preheader1.us

scalar.ph142:                                     ; preds = %scalar.ph142, %scalar.ph142.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph142.preheader ], [ %indvars.iv.next.7, %scalar.ph142 ]
  %69 = bitcast double* %4 to i64*
  %70 = load i64, i64* %69, align 8
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv
  %72 = bitcast double* %71 to i64*
  store i64 %70, i64* %72, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %73 = load i64, i64* %69, align 8
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next
  %75 = bitcast double* %74 to i64*
  store i64 %73, i64* %75, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %76 = load i64, i64* %69, align 8
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.1
  %78 = bitcast double* %77 to i64*
  store i64 %76, i64* %78, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %79 = load i64, i64* %69, align 8
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.2
  %81 = bitcast double* %80 to i64*
  store i64 %79, i64* %81, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %82 = load i64, i64* %69, align 8
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.3
  %84 = bitcast double* %83 to i64*
  store i64 %82, i64* %84, align 8
  %indvars.iv.next.4 = or i64 %indvars.iv, 5
  %85 = load i64, i64* %69, align 8
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.4
  %87 = bitcast double* %86 to i64*
  store i64 %85, i64* %87, align 8
  %indvars.iv.next.5 = or i64 %indvars.iv, 6
  %88 = load i64, i64* %69, align 8
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.5
  %90 = bitcast double* %89 to i64*
  store i64 %88, i64* %90, align 8
  %indvars.iv.next.6 = or i64 %indvars.iv, 7
  %91 = load i64, i64* %69, align 8
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.6
  %93 = bitcast double* %92 to i64*
  store i64 %91, i64* %93, align 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.6, 1199
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  br i1 %exitcond.7, label %.preheader2.us.preheader.loopexit, label %scalar.ph142, !llvm.loop !16

.preheader1.us:                                   ; preds = %._crit_edge9.us, %.preheader1.us.preheader
  %indvars.iv32 = phi i64 [ %94, %._crit_edge9.us ], [ 0, %.preheader1.us.preheader ]
  %scevgep79 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv32, i64 1
  %94 = add nuw nsw i64 %indvars.iv32, 1
  %scevgep81 = getelementptr [1200 x double], [1200 x double]* %0, i64 %94, i64 0
  %scevgep83 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv32, i64 0
  %scevgep85 = getelementptr [1200 x double], [1200 x double]* %2, i64 %94, i64 0
  %bound087 = icmp ult double* %scevgep79, %scevgep85
  %bound188 = icmp ult double* %scevgep83, %scevgep81
  %memcheck.conflict90 = and i1 %bound087, %bound188
  br i1 %memcheck.conflict90, label %scalar.ph76.preheader.new, label %vector.body74.preheader

vector.body74.preheader:                          ; preds = %.preheader1.us
  br label %vector.body74

vector.body74:                                    ; preds = %vector.body74.preheader, %vector.body74
  %index93 = phi i64 [ %index.next94, %vector.body74 ], [ 0, %vector.body74.preheader ]
  %offset.idx = or i64 %index93, 1
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv32, i64 %offset.idx
  %96 = bitcast double* %95 to <2 x double>*
  %wide.load101 = load <2 x double>, <2 x double>* %96, align 8, !alias.scope !17, !noalias !20
  %97 = getelementptr double, double* %95, i64 2
  %98 = bitcast double* %97 to <2 x double>*
  %wide.load102 = load <2 x double>, <2 x double>* %98, align 8, !alias.scope !17, !noalias !20
  %99 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv32, i64 %offset.idx
  %100 = bitcast double* %99 to <2 x double>*
  %wide.load103 = load <2 x double>, <2 x double>* %100, align 8, !alias.scope !20
  %101 = getelementptr double, double* %99, i64 2
  %102 = bitcast double* %101 to <2 x double>*
  %wide.load104 = load <2 x double>, <2 x double>* %102, align 8, !alias.scope !20
  %103 = add nsw i64 %offset.idx, -1
  %104 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv32, i64 %103
  %105 = bitcast double* %104 to <2 x double>*
  %wide.load105 = load <2 x double>, <2 x double>* %105, align 8, !alias.scope !20
  %106 = getelementptr double, double* %104, i64 2
  %107 = bitcast double* %106 to <2 x double>*
  %wide.load106 = load <2 x double>, <2 x double>* %107, align 8, !alias.scope !20
  %108 = fsub <2 x double> %wide.load103, %wide.load105
  %109 = fsub <2 x double> %wide.load104, %wide.load106
  %110 = fmul <2 x double> %108, <double 5.000000e-01, double 5.000000e-01>
  %111 = fmul <2 x double> %109, <double 5.000000e-01, double 5.000000e-01>
  %112 = fsub <2 x double> %wide.load101, %110
  %113 = fsub <2 x double> %wide.load102, %111
  store <2 x double> %112, <2 x double>* %96, align 8, !alias.scope !17, !noalias !20
  store <2 x double> %113, <2 x double>* %98, align 8, !alias.scope !17, !noalias !20
  %index.next94 = add nuw nsw i64 %index93, 4
  %114 = icmp eq i64 %index.next94, 1196
  br i1 %114, label %scalar.ph76.preheader.new.loopexit, label %vector.body74, !llvm.loop !22

scalar.ph76.preheader.new.loopexit:               ; preds = %vector.body74
  br label %scalar.ph76.preheader.new

scalar.ph76.preheader.new:                        ; preds = %scalar.ph76.preheader.new.loopexit, %.preheader1.us
  %indvars.iv28.ph = phi i64 [ 1, %.preheader1.us ], [ 1197, %scalar.ph76.preheader.new.loopexit ]
  %115 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv32, i64 %indvars.iv28.ph
  %116 = load double, double* %115, align 8
  %117 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv32, i64 %indvars.iv28.ph
  %118 = load double, double* %117, align 8
  %119 = add nsw i64 %indvars.iv28.ph, -1
  %120 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv32, i64 %119
  %121 = load double, double* %120, align 8
  %122 = fsub double %118, %121
  %123 = fmul double %122, 5.000000e-01
  %124 = fsub double %116, %123
  store double %124, double* %115, align 8
  %indvars.iv.next29.prol = add nuw nsw i64 %indvars.iv28.ph, 1
  br label %scalar.ph76

scalar.ph76:                                      ; preds = %scalar.ph76, %scalar.ph76.preheader.new
  %indvars.iv28 = phi i64 [ %indvars.iv.next29.prol, %scalar.ph76.preheader.new ], [ %indvars.iv.next29.1, %scalar.ph76 ]
  %125 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv32, i64 %indvars.iv28
  %126 = load double, double* %125, align 8
  %127 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv32, i64 %indvars.iv28
  %128 = load double, double* %127, align 8
  %129 = add nsw i64 %indvars.iv28, -1
  %130 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv32, i64 %129
  %131 = load double, double* %130, align 8
  %132 = fsub double %128, %131
  %133 = fmul double %132, 5.000000e-01
  %134 = fsub double %126, %133
  store double %134, double* %125, align 8
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv32, i64 %indvars.iv.next29
  %136 = load double, double* %135, align 8
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv32, i64 %indvars.iv.next29
  %138 = load double, double* %137, align 8
  %139 = load double, double* %127, align 8
  %140 = fsub double %138, %139
  %141 = fmul double %140, 5.000000e-01
  %142 = fsub double %136, %141
  store double %142, double* %135, align 8
  %exitcond31.1 = icmp eq i64 %indvars.iv.next29, 1199
  %indvars.iv.next29.1 = add nsw i64 %indvars.iv28, 2
  br i1 %exitcond31.1, label %._crit_edge9.us, label %scalar.ph76, !llvm.loop !23

._crit_edge9.us:                                  ; preds = %scalar.ph76
  %exitcond4 = icmp eq i64 %94, 1000
  br i1 %exitcond4, label %.preheader.us.preheader, label %.preheader1.us

.preheader.us.preheader:                          ; preds = %._crit_edge9.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge11.us, %.preheader.us.preheader
  %indvars.iv39 = phi i64 [ %143, %._crit_edge11.us ], [ 0, %.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 0
  %scevgep51 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 1199
  %scevgep53 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv39, i64 0
  %143 = add nuw nsw i64 %indvars.iv39, 1
  %scevgep55 = getelementptr [1200 x double], [1200 x double]* %0, i64 %143, i64 0
  %scevgep57 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv39, i64 0
  %scevgep59 = getelementptr [1200 x double], [1200 x double]* %1, i64 %143, i64 1199
  %bound0 = icmp ult double* %scevgep, %scevgep55
  %bound1 = icmp ult double* %scevgep53, %scevgep51
  %found.conflict = and i1 %bound0, %bound1
  %bound061 = icmp ult double* %scevgep, %scevgep59
  %bound162 = icmp ult double* %scevgep57, %scevgep51
  %found.conflict63 = and i1 %bound061, %bound162
  %conflict.rdx = or i1 %found.conflict, %found.conflict63
  br i1 %conflict.rdx, label %._crit_edge19.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %144 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 %index
  %145 = bitcast double* %144 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %145, align 8, !alias.scope !24, !noalias !27
  %146 = getelementptr double, double* %144, i64 2
  %147 = bitcast double* %146 to <2 x double>*
  %wide.load65 = load <2 x double>, <2 x double>* %147, align 8, !alias.scope !24, !noalias !27
  %148 = or i64 %index, 1
  %149 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv39, i64 %148
  %150 = bitcast double* %149 to <2 x double>*
  %wide.load66 = load <2 x double>, <2 x double>* %150, align 8, !alias.scope !30
  %151 = getelementptr double, double* %149, i64 2
  %152 = bitcast double* %151 to <2 x double>*
  %wide.load67 = load <2 x double>, <2 x double>* %152, align 8, !alias.scope !30
  %153 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv39, i64 %index
  %154 = bitcast double* %153 to <2 x double>*
  %wide.load68 = load <2 x double>, <2 x double>* %154, align 8, !alias.scope !30
  %155 = getelementptr double, double* %153, i64 2
  %156 = bitcast double* %155 to <2 x double>*
  %wide.load69 = load <2 x double>, <2 x double>* %156, align 8, !alias.scope !30
  %157 = fsub <2 x double> %wide.load66, %wide.load68
  %158 = fsub <2 x double> %wide.load67, %wide.load69
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %143, i64 %index
  %160 = bitcast double* %159 to <2 x double>*
  %wide.load70 = load <2 x double>, <2 x double>* %160, align 8, !alias.scope !31
  %161 = getelementptr double, double* %159, i64 2
  %162 = bitcast double* %161 to <2 x double>*
  %wide.load71 = load <2 x double>, <2 x double>* %162, align 8, !alias.scope !31
  %163 = fadd <2 x double> %157, %wide.load70
  %164 = fadd <2 x double> %158, %wide.load71
  %165 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv39, i64 %index
  %166 = bitcast double* %165 to <2 x double>*
  %wide.load72 = load <2 x double>, <2 x double>* %166, align 8, !alias.scope !31
  %167 = getelementptr double, double* %165, i64 2
  %168 = bitcast double* %167 to <2 x double>*
  %wide.load73 = load <2 x double>, <2 x double>* %168, align 8, !alias.scope !31
  %169 = fsub <2 x double> %163, %wide.load72
  %170 = fsub <2 x double> %164, %wide.load73
  %171 = fmul <2 x double> %169, <double 7.000000e-01, double 7.000000e-01>
  %172 = fmul <2 x double> %170, <double 7.000000e-01, double 7.000000e-01>
  %173 = fsub <2 x double> %wide.load, %171
  %174 = fsub <2 x double> %wide.load65, %172
  store <2 x double> %173, <2 x double>* %145, align 8, !alias.scope !24, !noalias !27
  store <2 x double> %174, <2 x double>* %147, align 8, !alias.scope !24, !noalias !27
  %index.next = add nuw nsw i64 %index, 4
  %175 = icmp eq i64 %index.next, 1196
  br i1 %175, label %._crit_edge19.preheader.loopexit, label %vector.body, !llvm.loop !32

._crit_edge19.preheader.loopexit:                 ; preds = %vector.body
  br label %._crit_edge19.preheader

._crit_edge19.preheader:                          ; preds = %._crit_edge19.preheader.loopexit, %.preheader.us
  %indvars.iv35.ph = phi i64 [ 0, %.preheader.us ], [ 1196, %._crit_edge19.preheader.loopexit ]
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.preheader, %._crit_edge19
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %._crit_edge19 ], [ %indvars.iv35.ph, %._crit_edge19.preheader ]
  %176 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv35
  %177 = load double, double* %176, align 8
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %178 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv39, i64 %indvars.iv.next36
  %179 = load double, double* %178, align 8
  %180 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv39, i64 %indvars.iv35
  %181 = load double, double* %180, align 8
  %182 = fsub double %179, %181
  %183 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %143, i64 %indvars.iv35
  %184 = load double, double* %183, align 8
  %185 = fadd double %182, %184
  %186 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv39, i64 %indvars.iv35
  %187 = load double, double* %186, align 8
  %188 = fsub double %185, %187
  %189 = fmul double %188, 7.000000e-01
  %190 = fsub double %177, %189
  store double %190, double* %176, align 8
  %exitcond38 = icmp eq i64 %indvars.iv35, 1198
  br i1 %exitcond38, label %._crit_edge11.us, label %._crit_edge19, !llvm.loop !33

._crit_edge11.us:                                 ; preds = %._crit_edge19
  %exitcond5 = icmp eq i64 %143, 999
  br i1 %exitcond5, label %._crit_edge12, label %.preheader.us

._crit_edge12:                                    ; preds = %._crit_edge11.us
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next42, 500
  br i1 %exitcond6, label %._crit_edge13, label %.preheader6

._crit_edge13:                                    ; preds = %._crit_edge12
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]*, [1200 x double]*, [1200 x double]*) unnamed_addr #0 {
.preheader8.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #4
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader8.us

.preheader8.us:                                   ; preds = %._crit_edge14.us, %.preheader8.us.preheader
  %indvars.iv33 = phi i64 [ 0, %.preheader8.us.preheader ], [ %indvars.iv.next34, %._crit_edge14.us ]
  %7 = mul nuw nsw i64 %indvars.iv33, 1000
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge, %.preheader8.us
  %indvars.iv31 = phi i64 [ 0, %.preheader8.us ], [ %indvars.iv.next32, %._crit_edge ]
  %8 = add nuw nsw i64 %indvars.iv31, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge19
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc6.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge19, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv33, i64 %indvars.iv31
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next32, 1200
  br i1 %exitcond4, label %._crit_edge14.us, label %._crit_edge19

._crit_edge14.us:                                 ; preds = %._crit_edge
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next34, 1000
  br i1 %exitcond5, label %._crit_edge15, label %.preheader8.us

._crit_edge15:                                    ; preds = %._crit_edge14.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #4
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  br label %.preheader7.us

.preheader7.us:                                   ; preds = %._crit_edge11.us, %._crit_edge15
  %indvars.iv28 = phi i64 [ 0, %._crit_edge15 ], [ %indvars.iv.next29, %._crit_edge11.us ]
  %24 = mul nuw nsw i64 %indvars.iv28, 1000
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge20, %.preheader7.us
  %indvars.iv26 = phi i64 [ 0, %.preheader7.us ], [ %indvars.iv.next27, %._crit_edge20 ]
  %25 = add nuw nsw i64 %indvars.iv26, %24
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 20
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %._crit_edge20

; <label>:29:                                     ; preds = %._crit_edge21
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %30) #4
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge21, %29
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv26
  %33 = load double, double* %32, align 8
  %34 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %33) #5
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next27, 1200
  br i1 %exitcond2, label %._crit_edge11.us, label %._crit_edge21

._crit_edge11.us:                                 ; preds = %._crit_edge20
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next29, 1000
  br i1 %exitcond3, label %._crit_edge12, label %.preheader7.us

._crit_edge12:                                    ; preds = %._crit_edge11.us
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %._crit_edge12
  %indvars.iv24 = phi i64 [ 0, %._crit_edge12 ], [ %indvars.iv.next25, %._crit_edge.us ]
  %39 = mul nuw nsw i64 %indvars.iv24, 1000
  br label %._crit_edge23

._crit_edge23:                                    ; preds = %._crit_edge22, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge22 ]
  %40 = add nuw nsw i64 %indvars.iv, %39
  %41 = trunc i64 %40 to i32
  %42 = srem i32 %41, 20
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %44, label %._crit_edge22

; <label>:44:                                     ; preds = %._crit_edge23
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %45) #4
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %._crit_edge23, %44
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv24, i64 %indvars.iv
  %48 = load double, double* %47, align 8
  %49 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %48) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge23

._crit_edge.us:                                   ; preds = %._crit_edge22
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next25, 1000
  br i1 %exitcond1, label %._crit_edge9, label %.preheader.us

._crit_edge9:                                     ; preds = %._crit_edge.us
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %51 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %50, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

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
