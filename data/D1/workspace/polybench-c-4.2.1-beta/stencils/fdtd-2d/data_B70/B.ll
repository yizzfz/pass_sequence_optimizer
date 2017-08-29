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
  %16 = bitcast i8* %5 to [1200 x double]*
  %17 = bitcast i8* %4 to [1200 x double]*
  %18 = bitcast i8* %3 to [1200 x double]*
  tail call fastcc void @print_array([1200 x double]* %18, [1200 x double]* %17, [1200 x double]* %16)
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
.lr.ph5.preheader:
  br label %.lr.ph5

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %4 = trunc i64 %indvars.iv7 to i32
  %5 = sitofp i32 %4 to double
  %6 = insertelement <2 x double> undef, double %5, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %8 = trunc i64 %indvars.iv.next to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv7, i64 %indvars.iv
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
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv7, i64 %indvars.iv
  store double %19, double* %20, align 8
  %21 = add nuw nsw i64 %indvars.iv, 3
  %22 = trunc i64 %21 to i32
  %23 = sitofp i32 %22 to double
  %24 = fmul double %5, %23
  %25 = fdiv double %24, 1.000000e+03
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv7, i64 %indvars.iv
  store double %25, double* %26, align 8
  %exitcond16 = icmp eq i64 %indvars.iv, 1199
  br i1 %exitcond16, label %._crit_edge.us, label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next8, 1000
  br i1 %exitcond10, label %._crit_edge3, label %.preheader.us

.lr.ph5:                                          ; preds = %.lr.ph5, %.lr.ph5.preheader
  %indvars.iv12 = phi i64 [ 0, %.lr.ph5.preheader ], [ %indvars.iv.next13.4, %.lr.ph5 ]
  %27 = trunc i64 %indvars.iv12 to i32
  %28 = sitofp i32 %27 to double
  %29 = getelementptr inbounds double, double* %3, i64 %indvars.iv12
  store double %28, double* %29, align 8
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %30 = trunc i64 %indvars.iv.next13 to i32
  %31 = sitofp i32 %30 to double
  %32 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next13
  store double %31, double* %32, align 8
  %indvars.iv.next13.1 = add nsw i64 %indvars.iv12, 2
  %33 = trunc i64 %indvars.iv.next13.1 to i32
  %34 = sitofp i32 %33 to double
  %35 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next13.1
  store double %34, double* %35, align 8
  %indvars.iv.next13.2 = add nsw i64 %indvars.iv12, 3
  %36 = trunc i64 %indvars.iv.next13.2 to i32
  %37 = sitofp i32 %36 to double
  %38 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next13.2
  store double %37, double* %38, align 8
  %indvars.iv.next13.3 = add nsw i64 %indvars.iv12, 4
  %39 = trunc i64 %indvars.iv.next13.3 to i32
  %40 = sitofp i32 %39 to double
  %41 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next13.3
  store double %40, double* %41, align 8
  %exitcond.4 = icmp eq i64 %indvars.iv.next13.3, 499
  %indvars.iv.next13.4 = add nsw i64 %indvars.iv12, 5
  br i1 %exitcond.4, label %.preheader.us.preheader, label %.lr.ph5

.preheader.us.preheader:                          ; preds = %.lr.ph5
  br label %.preheader.us

._crit_edge3:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_fdtd_2d([1200 x double]*, [1200 x double]*, [1200 x double]*, double*) unnamed_addr #0 {
.preheader6.lr.ph:
  %scevgep156 = getelementptr [1200 x double], [1200 x double]* %1, i64 1, i64 0
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge12, %.preheader6.lr.ph
  %indvars.iv44 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next45, %._crit_edge12 ]
  %4 = getelementptr inbounds double, double* %3, i64 %indvars.iv44
  %5 = bitcast double* %4 to [1200 x double]*
  %bound0159 = icmp ugt [1200 x double]* %5, %1
  %bound1160 = icmp ult double* %4, %scevgep156
  %memcheck.conflict162 = and i1 %bound0159, %bound1160
  br i1 %memcheck.conflict162, label %scalar.ph153.preheader, label %vector.body151.preheader

vector.body151.preheader:                         ; preds = %.preheader6
  %6 = bitcast double* %4 to i64*
  %7 = bitcast double* %4 to i64*
  %8 = bitcast double* %4 to i64*
  br label %vector.body151

scalar.ph153.preheader:                           ; preds = %.preheader6
  %9 = bitcast double* %4 to i64*
  %10 = bitcast double* %4 to i64*
  %11 = bitcast double* %4 to i64*
  %12 = bitcast double* %4 to i64*
  %13 = bitcast double* %4 to i64*
  %14 = bitcast double* %4 to i64*
  %15 = bitcast double* %4 to i64*
  %16 = bitcast double* %4 to i64*
  br label %scalar.ph153

vector.body151:                                   ; preds = %vector.body151, %vector.body151.preheader
  %index165 = phi i64 [ 0, %vector.body151.preheader ], [ %index.next166.2, %vector.body151 ]
  %17 = load i64, i64* %6, align 8, !alias.scope !1
  %18 = insertelement <2 x i64> undef, i64 %17, i32 0
  %19 = shufflevector <2 x i64> %18, <2 x i64> undef, <2 x i32> zeroinitializer
  %20 = insertelement <2 x i64> undef, i64 %17, i32 0
  %21 = shufflevector <2 x i64> %20, <2 x i64> undef, <2 x i32> zeroinitializer
  %22 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index165
  %23 = bitcast double* %22 to <2 x i64>*
  store <2 x i64> %19, <2 x i64>* %23, align 8, !alias.scope !4, !noalias !1
  %24 = getelementptr double, double* %22, i64 2
  %25 = bitcast double* %24 to <2 x i64>*
  store <2 x i64> %21, <2 x i64>* %25, align 8, !alias.scope !4, !noalias !1
  %index.next166 = add nuw nsw i64 %index165, 4
  %26 = load i64, i64* %7, align 8, !alias.scope !1
  %27 = insertelement <2 x i64> undef, i64 %26, i32 0
  %28 = shufflevector <2 x i64> %27, <2 x i64> undef, <2 x i32> zeroinitializer
  %29 = insertelement <2 x i64> undef, i64 %26, i32 0
  %30 = shufflevector <2 x i64> %29, <2 x i64> undef, <2 x i32> zeroinitializer
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index.next166
  %32 = bitcast double* %31 to <2 x i64>*
  store <2 x i64> %28, <2 x i64>* %32, align 8, !alias.scope !4, !noalias !1
  %33 = getelementptr double, double* %31, i64 2
  %34 = bitcast double* %33 to <2 x i64>*
  store <2 x i64> %30, <2 x i64>* %34, align 8, !alias.scope !4, !noalias !1
  %index.next166.1 = add nsw i64 %index165, 8
  %35 = load i64, i64* %8, align 8, !alias.scope !1
  %36 = insertelement <2 x i64> undef, i64 %35, i32 0
  %37 = shufflevector <2 x i64> %36, <2 x i64> undef, <2 x i32> zeroinitializer
  %38 = insertelement <2 x i64> undef, i64 %35, i32 0
  %39 = shufflevector <2 x i64> %38, <2 x i64> undef, <2 x i32> zeroinitializer
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index.next166.1
  %41 = bitcast double* %40 to <2 x i64>*
  store <2 x i64> %37, <2 x i64>* %41, align 8, !alias.scope !4, !noalias !1
  %42 = getelementptr double, double* %40, i64 2
  %43 = bitcast double* %42 to <2 x i64>*
  store <2 x i64> %39, <2 x i64>* %43, align 8, !alias.scope !4, !noalias !1
  %index.next166.2 = add nsw i64 %index165, 12
  %44 = icmp eq i64 %index.next166.2, 1200
  br i1 %44, label %.preheader2.us.preheader.loopexit2, label %vector.body151, !llvm.loop !6

.preheader2.us.preheader.loopexit:                ; preds = %scalar.ph153
  br label %.preheader2.us.preheader

.preheader2.us.preheader.loopexit2:               ; preds = %vector.body151
  br label %.preheader2.us.preheader

.preheader2.us.preheader:                         ; preds = %.preheader2.us.preheader.loopexit2, %.preheader2.us.preheader.loopexit
  br label %.preheader2.us

.preheader2.us:                                   ; preds = %.preheader2.us.preheader, %._crit_edge.us
  %indvar = phi i64 [ %indvar.next, %._crit_edge.us ], [ 0, %.preheader2.us.preheader ]
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %._crit_edge.us ], [ 1, %.preheader2.us.preheader ]
  %45 = add nuw nsw i64 %indvar, 1
  %scevgep123 = getelementptr [1200 x double], [1200 x double]* %1, i64 %45, i64 0
  %46 = add nuw nsw i64 %indvar, 2
  %scevgep125 = getelementptr [1200 x double], [1200 x double]* %1, i64 %46, i64 0
  %scevgep127 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvar, i64 0
  %scevgep129 = getelementptr [1200 x double], [1200 x double]* %2, i64 %46, i64 0
  %47 = add nsw i64 %indvars.iv22, -1
  %bound0131 = icmp ult double* %scevgep123, %scevgep129
  %bound1132 = icmp ult double* %scevgep127, %scevgep125
  %memcheck.conflict134 = and i1 %bound0131, %bound1132
  br i1 %memcheck.conflict134, label %scalar.ph120.preheader, label %vector.body118.preheader

vector.body118.preheader:                         ; preds = %.preheader2.us
  br label %vector.body118

scalar.ph120.preheader:                           ; preds = %.preheader2.us
  br label %scalar.ph120

vector.body118:                                   ; preds = %vector.body118.preheader, %vector.body118
  %index137 = phi i64 [ %index.next138, %vector.body118 ], [ 0, %vector.body118.preheader ]
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv22, i64 %index137
  %49 = bitcast double* %48 to <2 x double>*
  %wide.load145 = load <2 x double>, <2 x double>* %49, align 8, !alias.scope !9, !noalias !12
  %50 = getelementptr double, double* %48, i64 2
  %51 = bitcast double* %50 to <2 x double>*
  %wide.load146 = load <2 x double>, <2 x double>* %51, align 8, !alias.scope !9, !noalias !12
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv22, i64 %index137
  %53 = bitcast double* %52 to <2 x double>*
  %wide.load147 = load <2 x double>, <2 x double>* %53, align 8, !alias.scope !12
  %54 = getelementptr double, double* %52, i64 2
  %55 = bitcast double* %54 to <2 x double>*
  %wide.load148 = load <2 x double>, <2 x double>* %55, align 8, !alias.scope !12
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %47, i64 %index137
  %57 = bitcast double* %56 to <2 x double>*
  %wide.load149 = load <2 x double>, <2 x double>* %57, align 8, !alias.scope !12
  %58 = getelementptr double, double* %56, i64 2
  %59 = bitcast double* %58 to <2 x double>*
  %wide.load150 = load <2 x double>, <2 x double>* %59, align 8, !alias.scope !12
  %60 = fsub <2 x double> %wide.load147, %wide.load149
  %61 = fsub <2 x double> %wide.load148, %wide.load150
  %62 = fmul <2 x double> %60, <double 5.000000e-01, double 5.000000e-01>
  %63 = fmul <2 x double> %61, <double 5.000000e-01, double 5.000000e-01>
  %64 = fsub <2 x double> %wide.load145, %62
  %65 = fsub <2 x double> %wide.load146, %63
  %66 = bitcast double* %48 to <2 x double>*
  store <2 x double> %64, <2 x double>* %66, align 8, !alias.scope !9, !noalias !12
  %67 = bitcast double* %50 to <2 x double>*
  store <2 x double> %65, <2 x double>* %67, align 8, !alias.scope !9, !noalias !12
  %index.next138 = add nuw nsw i64 %index137, 4
  %68 = icmp eq i64 %index.next138, 1200
  br i1 %68, label %._crit_edge.us.loopexit1, label %vector.body118, !llvm.loop !14

scalar.ph120:                                     ; preds = %scalar.ph120, %scalar.ph120.preheader
  %indvars.iv18 = phi i64 [ 0, %scalar.ph120.preheader ], [ %indvars.iv.next19.1, %scalar.ph120 ]
  %69 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv22, i64 %indvars.iv18
  %70 = load double, double* %69, align 8
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv22, i64 %indvars.iv18
  %72 = load double, double* %71, align 8
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %47, i64 %indvars.iv18
  %74 = load double, double* %73, align 8
  %75 = fsub double %72, %74
  %76 = fmul double %75, 5.000000e-01
  %77 = fsub double %70, %76
  store double %77, double* %69, align 8
  %indvars.iv.next19 = or i64 %indvars.iv18, 1
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv22, i64 %indvars.iv.next19
  %79 = load double, double* %78, align 8
  %80 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv22, i64 %indvars.iv.next19
  %81 = load double, double* %80, align 8
  %82 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %47, i64 %indvars.iv.next19
  %83 = load double, double* %82, align 8
  %84 = fsub double %81, %83
  %85 = fmul double %84, 5.000000e-01
  %86 = fsub double %79, %85
  store double %86, double* %78, align 8
  %exitcond.1 = icmp eq i64 %indvars.iv.next19, 1199
  %indvars.iv.next19.1 = add nsw i64 %indvars.iv18, 2
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %scalar.ph120, !llvm.loop !15

._crit_edge.us.loopexit:                          ; preds = %scalar.ph120
  br label %._crit_edge.us

._crit_edge.us.loopexit1:                         ; preds = %vector.body118
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit1, %._crit_edge.us.loopexit
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next23, 1000
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %exitcond25, label %.preheader1.us.preheader, label %.preheader2.us

.preheader1.us.preheader:                         ; preds = %._crit_edge.us
  br label %.preheader1.us

scalar.ph153:                                     ; preds = %scalar.ph153, %scalar.ph153.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph153.preheader ], [ %indvars.iv.next.7, %scalar.ph153 ]
  %87 = load i64, i64* %9, align 8
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv
  %89 = bitcast double* %88 to i64*
  store i64 %87, i64* %89, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %90 = load i64, i64* %10, align 8
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next
  %92 = bitcast double* %91 to i64*
  store i64 %90, i64* %92, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %93 = load i64, i64* %11, align 8
  %94 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.1
  %95 = bitcast double* %94 to i64*
  store i64 %93, i64* %95, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %96 = load i64, i64* %12, align 8
  %97 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.2
  %98 = bitcast double* %97 to i64*
  store i64 %96, i64* %98, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %99 = load i64, i64* %13, align 8
  %100 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.3
  %101 = bitcast double* %100 to i64*
  store i64 %99, i64* %101, align 8
  %indvars.iv.next.4 = or i64 %indvars.iv, 5
  %102 = load i64, i64* %14, align 8
  %103 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.4
  %104 = bitcast double* %103 to i64*
  store i64 %102, i64* %104, align 8
  %indvars.iv.next.5 = or i64 %indvars.iv, 6
  %105 = load i64, i64* %15, align 8
  %106 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.5
  %107 = bitcast double* %106 to i64*
  store i64 %105, i64* %107, align 8
  %indvars.iv.next.6 = or i64 %indvars.iv, 7
  %108 = load i64, i64* %16, align 8
  %109 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.6
  %110 = bitcast double* %109 to i64*
  store i64 %108, i64* %110, align 8
  %exitcond51.7 = icmp eq i64 %indvars.iv.next.6, 1199
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  br i1 %exitcond51.7, label %.preheader2.us.preheader.loopexit, label %scalar.ph153, !llvm.loop !16

.preheader1.us:                                   ; preds = %.preheader1.us.preheader, %._crit_edge9.us
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %._crit_edge9.us ], [ 0, %.preheader1.us.preheader ]
  %scevgep90 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv31, i64 1
  %111 = add nuw nsw i64 %indvars.iv31, 1
  %scevgep92 = getelementptr [1200 x double], [1200 x double]* %0, i64 %111, i64 0
  %scevgep94 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv31, i64 0
  %scevgep96 = getelementptr [1200 x double], [1200 x double]* %2, i64 %111, i64 0
  %bound098 = icmp ult double* %scevgep90, %scevgep96
  %bound199 = icmp ult double* %scevgep94, %scevgep92
  %memcheck.conflict101 = and i1 %bound098, %bound199
  br i1 %memcheck.conflict101, label %scalar.ph87.preheader, label %vector.body85.preheader

vector.body85.preheader:                          ; preds = %.preheader1.us
  br label %vector.body85

vector.body85:                                    ; preds = %vector.body85.preheader, %vector.body85
  %index104 = phi i64 [ %index.next105, %vector.body85 ], [ 0, %vector.body85.preheader ]
  %offset.idx = or i64 %index104, 1
  %112 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv31, i64 %offset.idx
  %113 = bitcast double* %112 to <2 x double>*
  %wide.load112 = load <2 x double>, <2 x double>* %113, align 8, !alias.scope !17, !noalias !20
  %114 = getelementptr double, double* %112, i64 2
  %115 = bitcast double* %114 to <2 x double>*
  %wide.load113 = load <2 x double>, <2 x double>* %115, align 8, !alias.scope !17, !noalias !20
  %116 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv31, i64 %offset.idx
  %117 = bitcast double* %116 to <2 x double>*
  %wide.load114 = load <2 x double>, <2 x double>* %117, align 8, !alias.scope !20
  %118 = getelementptr double, double* %116, i64 2
  %119 = bitcast double* %118 to <2 x double>*
  %wide.load115 = load <2 x double>, <2 x double>* %119, align 8, !alias.scope !20
  %120 = add nsw i64 %offset.idx, -1
  %121 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv31, i64 %120
  %122 = bitcast double* %121 to <2 x double>*
  %wide.load116 = load <2 x double>, <2 x double>* %122, align 8, !alias.scope !20
  %123 = getelementptr double, double* %121, i64 2
  %124 = bitcast double* %123 to <2 x double>*
  %wide.load117 = load <2 x double>, <2 x double>* %124, align 8, !alias.scope !20
  %125 = fsub <2 x double> %wide.load114, %wide.load116
  %126 = fsub <2 x double> %wide.load115, %wide.load117
  %127 = fmul <2 x double> %125, <double 5.000000e-01, double 5.000000e-01>
  %128 = fmul <2 x double> %126, <double 5.000000e-01, double 5.000000e-01>
  %129 = fsub <2 x double> %wide.load112, %127
  %130 = fsub <2 x double> %wide.load113, %128
  %131 = bitcast double* %112 to <2 x double>*
  store <2 x double> %129, <2 x double>* %131, align 8, !alias.scope !17, !noalias !20
  %132 = bitcast double* %114 to <2 x double>*
  store <2 x double> %130, <2 x double>* %132, align 8, !alias.scope !17, !noalias !20
  %index.next105 = add nuw nsw i64 %index104, 4
  %133 = icmp eq i64 %index.next105, 1196
  br i1 %133, label %scalar.ph87.preheader.loopexit, label %vector.body85, !llvm.loop !22

scalar.ph87.preheader.loopexit:                   ; preds = %vector.body85
  br label %scalar.ph87.preheader

scalar.ph87.preheader:                            ; preds = %scalar.ph87.preheader.loopexit, %.preheader1.us
  %indvars.iv27.ph = phi i64 [ 1, %.preheader1.us ], [ 1197, %scalar.ph87.preheader.loopexit ]
  br i1 true, label %scalar.ph87.prol.preheader, label %scalar.ph87.prol.loopexit.unr-lcssa

scalar.ph87.prol.preheader:                       ; preds = %scalar.ph87.preheader
  br label %scalar.ph87.prol

scalar.ph87.prol:                                 ; preds = %scalar.ph87.prol.preheader
  %134 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv31, i64 %indvars.iv27.ph
  %135 = load double, double* %134, align 8
  %136 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv31, i64 %indvars.iv27.ph
  %137 = load double, double* %136, align 8
  %138 = add nsw i64 %indvars.iv27.ph, -1
  %139 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv31, i64 %138
  %140 = load double, double* %139, align 8
  %141 = fsub double %137, %140
  %142 = fmul double %141, 5.000000e-01
  %143 = fsub double %135, %142
  store double %143, double* %134, align 8
  %indvars.iv.next28.prol = add nuw nsw i64 %indvars.iv27.ph, 1
  br label %scalar.ph87.prol.loopexit.unr-lcssa

scalar.ph87.prol.loopexit.unr-lcssa:              ; preds = %scalar.ph87.preheader, %scalar.ph87.prol
  %indvars.iv27.unr.ph = phi i64 [ %indvars.iv.next28.prol, %scalar.ph87.prol ], [ %indvars.iv27.ph, %scalar.ph87.preheader ]
  br label %scalar.ph87.prol.loopexit

scalar.ph87.prol.loopexit:                        ; preds = %scalar.ph87.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge9.us, label %scalar.ph87.preheader.new

scalar.ph87.preheader.new:                        ; preds = %scalar.ph87.prol.loopexit
  br label %scalar.ph87

scalar.ph87:                                      ; preds = %scalar.ph87, %scalar.ph87.preheader.new
  %indvars.iv27 = phi i64 [ %indvars.iv27.unr.ph, %scalar.ph87.preheader.new ], [ %indvars.iv.next28.1, %scalar.ph87 ]
  %144 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv31, i64 %indvars.iv27
  %145 = load double, double* %144, align 8
  %146 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv31, i64 %indvars.iv27
  %147 = load double, double* %146, align 8
  %148 = add nsw i64 %indvars.iv27, -1
  %149 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv31, i64 %148
  %150 = load double, double* %149, align 8
  %151 = fsub double %147, %150
  %152 = fmul double %151, 5.000000e-01
  %153 = fsub double %145, %152
  store double %153, double* %144, align 8
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %154 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv31, i64 %indvars.iv.next28
  %155 = load double, double* %154, align 8
  %156 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv31, i64 %indvars.iv.next28
  %157 = load double, double* %156, align 8
  %158 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv31, i64 %indvars.iv27
  %159 = load double, double* %158, align 8
  %160 = fsub double %157, %159
  %161 = fmul double %160, 5.000000e-01
  %162 = fsub double %155, %161
  store double %162, double* %154, align 8
  %exitcond52.1 = icmp eq i64 %indvars.iv.next28, 1199
  %indvars.iv.next28.1 = add nsw i64 %indvars.iv27, 2
  br i1 %exitcond52.1, label %._crit_edge9.us.unr-lcssa, label %scalar.ph87, !llvm.loop !23

._crit_edge9.us.unr-lcssa:                        ; preds = %scalar.ph87
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %scalar.ph87.prol.loopexit, %._crit_edge9.us.unr-lcssa
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond34 = icmp eq i64 %indvars.iv.next32, 1000
  br i1 %exitcond34, label %.preheader.us.preheader, label %.preheader1.us

.preheader.us.preheader:                          ; preds = %._crit_edge9.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge11.us
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %._crit_edge11.us ], [ 0, %.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv40, i64 0
  %scevgep62 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv40, i64 1199
  %scevgep64 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv40, i64 0
  %163 = add nuw nsw i64 %indvars.iv40, 1
  %scevgep66 = getelementptr [1200 x double], [1200 x double]* %0, i64 %163, i64 0
  %scevgep68 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv40, i64 0
  %scevgep70 = getelementptr [1200 x double], [1200 x double]* %1, i64 %163, i64 1199
  %indvars.iv.next41 = add nuw nsw i64 %indvars.iv40, 1
  %bound0 = icmp ult double* %scevgep, %scevgep66
  %bound1 = icmp ult double* %scevgep64, %scevgep62
  %found.conflict = and i1 %bound0, %bound1
  %bound072 = icmp ult double* %scevgep, %scevgep70
  %bound173 = icmp ult double* %scevgep68, %scevgep62
  %found.conflict74 = and i1 %bound072, %bound173
  %conflict.rdx = or i1 %found.conflict, %found.conflict74
  br i1 %conflict.rdx, label %._crit_edge50.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %164 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv40, i64 %index
  %165 = bitcast double* %164 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %165, align 8, !alias.scope !24, !noalias !27
  %166 = getelementptr double, double* %164, i64 2
  %167 = bitcast double* %166 to <2 x double>*
  %wide.load76 = load <2 x double>, <2 x double>* %167, align 8, !alias.scope !24, !noalias !27
  %168 = or i64 %index, 1
  %169 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv40, i64 %168
  %170 = bitcast double* %169 to <2 x double>*
  %wide.load77 = load <2 x double>, <2 x double>* %170, align 8, !alias.scope !30
  %171 = getelementptr double, double* %169, i64 2
  %172 = bitcast double* %171 to <2 x double>*
  %wide.load78 = load <2 x double>, <2 x double>* %172, align 8, !alias.scope !30
  %173 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv40, i64 %index
  %174 = bitcast double* %173 to <2 x double>*
  %wide.load79 = load <2 x double>, <2 x double>* %174, align 8, !alias.scope !30
  %175 = getelementptr double, double* %173, i64 2
  %176 = bitcast double* %175 to <2 x double>*
  %wide.load80 = load <2 x double>, <2 x double>* %176, align 8, !alias.scope !30
  %177 = fsub <2 x double> %wide.load77, %wide.load79
  %178 = fsub <2 x double> %wide.load78, %wide.load80
  %179 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next41, i64 %index
  %180 = bitcast double* %179 to <2 x double>*
  %wide.load81 = load <2 x double>, <2 x double>* %180, align 8, !alias.scope !31
  %181 = getelementptr double, double* %179, i64 2
  %182 = bitcast double* %181 to <2 x double>*
  %wide.load82 = load <2 x double>, <2 x double>* %182, align 8, !alias.scope !31
  %183 = fadd <2 x double> %177, %wide.load81
  %184 = fadd <2 x double> %178, %wide.load82
  %185 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv40, i64 %index
  %186 = bitcast double* %185 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %186, align 8, !alias.scope !31
  %187 = getelementptr double, double* %185, i64 2
  %188 = bitcast double* %187 to <2 x double>*
  %wide.load84 = load <2 x double>, <2 x double>* %188, align 8, !alias.scope !31
  %189 = fsub <2 x double> %183, %wide.load83
  %190 = fsub <2 x double> %184, %wide.load84
  %191 = fmul <2 x double> %189, <double 7.000000e-01, double 7.000000e-01>
  %192 = fmul <2 x double> %190, <double 7.000000e-01, double 7.000000e-01>
  %193 = fsub <2 x double> %wide.load, %191
  %194 = fsub <2 x double> %wide.load76, %192
  %195 = bitcast double* %164 to <2 x double>*
  store <2 x double> %193, <2 x double>* %195, align 8, !alias.scope !24, !noalias !27
  %196 = bitcast double* %166 to <2 x double>*
  store <2 x double> %194, <2 x double>* %196, align 8, !alias.scope !24, !noalias !27
  %index.next = add nuw nsw i64 %index, 4
  %197 = icmp eq i64 %index.next, 1196
  br i1 %197, label %._crit_edge50.preheader.loopexit, label %vector.body, !llvm.loop !32

._crit_edge50.preheader.loopexit:                 ; preds = %vector.body
  br label %._crit_edge50.preheader

._crit_edge50.preheader:                          ; preds = %._crit_edge50.preheader.loopexit, %.preheader.us
  %indvars.iv36.ph = phi i64 [ 0, %.preheader.us ], [ 1196, %._crit_edge50.preheader.loopexit ]
  br label %._crit_edge50

._crit_edge50:                                    ; preds = %._crit_edge50.preheader, %._crit_edge50
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %._crit_edge50 ], [ %indvars.iv36.ph, %._crit_edge50.preheader ]
  %198 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv40, i64 %indvars.iv36
  %199 = load double, double* %198, align 8
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %200 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv40, i64 %indvars.iv.next37
  %201 = load double, double* %200, align 8
  %202 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv40, i64 %indvars.iv36
  %203 = load double, double* %202, align 8
  %204 = fsub double %201, %203
  %205 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next41, i64 %indvars.iv36
  %206 = load double, double* %205, align 8
  %207 = fadd double %204, %206
  %208 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv40, i64 %indvars.iv36
  %209 = load double, double* %208, align 8
  %210 = fsub double %207, %209
  %211 = fmul double %210, 7.000000e-01
  %212 = fsub double %199, %211
  store double %212, double* %198, align 8
  %exitcond53 = icmp eq i64 %indvars.iv36, 1198
  br i1 %exitcond53, label %._crit_edge11.us, label %._crit_edge50, !llvm.loop !33

._crit_edge11.us:                                 ; preds = %._crit_edge50
  %exitcond43 = icmp eq i64 %indvars.iv.next41, 999
  br i1 %exitcond43, label %._crit_edge12, label %.preheader.us

._crit_edge12:                                    ; preds = %._crit_edge11.us
  %indvars.iv.next45 = add nuw nsw i64 %indvars.iv44, 1
  %exitcond47 = icmp eq i64 %indvars.iv.next45, 500
  br i1 %exitcond47, label %._crit_edge13, label %.preheader6

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
  %indvars.iv37 = phi i64 [ 0, %.preheader8.us.preheader ], [ %indvars.iv.next38, %._crit_edge14.us ]
  %7 = mul nuw nsw i64 %indvars.iv37, 1000
  br label %._crit_edge42

._crit_edge42:                                    ; preds = %._crit_edge, %.preheader8.us
  %indvars.iv33 = phi i64 [ 0, %.preheader8.us ], [ %indvars.iv.next34, %._crit_edge ]
  %8 = add nuw nsw i64 %indvars.iv33, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge42
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc6.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge42, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv37, i64 %indvars.iv33
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next34, 1200
  br i1 %exitcond36, label %._crit_edge14.us, label %._crit_edge42

._crit_edge14.us:                                 ; preds = %._crit_edge
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next38, 1000
  br i1 %exitcond40, label %._crit_edge15, label %.preheader8.us

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
  br label %._crit_edge44

._crit_edge44:                                    ; preds = %._crit_edge43, %.preheader7.us
  %indvars.iv24 = phi i64 [ 0, %.preheader7.us ], [ %indvars.iv.next25, %._crit_edge43 ]
  %25 = add nuw nsw i64 %indvars.iv24, %24
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 20
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %._crit_edge43

; <label>:29:                                     ; preds = %._crit_edge44
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %30) #4
  br label %._crit_edge43

._crit_edge43:                                    ; preds = %._crit_edge44, %29
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv24
  %33 = load double, double* %32, align 8
  %34 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %33) #5
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next25, 1200
  br i1 %exitcond27, label %._crit_edge11.us, label %._crit_edge44

._crit_edge11.us:                                 ; preds = %._crit_edge43
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next29, 1000
  br i1 %exitcond31, label %._crit_edge12, label %.preheader7.us

._crit_edge12:                                    ; preds = %._crit_edge11.us
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %._crit_edge12
  %indvars.iv19 = phi i64 [ 0, %._crit_edge12 ], [ %indvars.iv.next20, %._crit_edge.us ]
  %39 = mul nuw nsw i64 %indvars.iv19, 1000
  br label %._crit_edge46

._crit_edge46:                                    ; preds = %._crit_edge45, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge45 ]
  %40 = add nuw nsw i64 %indvars.iv, %39
  %41 = trunc i64 %40 to i32
  %42 = srem i32 %41, 20
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %44, label %._crit_edge45

; <label>:44:                                     ; preds = %._crit_edge46
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %45) #4
  br label %._crit_edge45

._crit_edge45:                                    ; preds = %._crit_edge46, %44
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv19, i64 %indvars.iv
  %48 = load double, double* %47, align 8
  %49 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %48) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge46

._crit_edge.us:                                   ; preds = %._crit_edge45
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next20, 1000
  br i1 %exitcond22, label %._crit_edge9, label %.preheader.us

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
