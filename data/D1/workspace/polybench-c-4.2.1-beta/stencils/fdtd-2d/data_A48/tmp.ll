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
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 500, i32 8) #4
  %7 = bitcast i8* %3 to [1200 x double]*
  %8 = bitcast i8* %4 to [1200 x double]*
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  tail call void @init_array([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_fdtd_2d([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
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
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array([1200 x double]* nocapture, [1200 x double]*, [1200 x double]*, double* nocapture) #2 {
.lr.ph5.preheader:
  br label %.lr.ph5

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
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
  %exitcond = icmp eq i64 %indvars.iv, 1199
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next8, 1000
  br i1 %exitcond1, label %._crit_edge3, label %.preheader.us

.lr.ph5:                                          ; preds = %.lr.ph5, %.lr.ph5.preheader
  %indvars.iv10 = phi i64 [ 0, %.lr.ph5.preheader ], [ %indvars.iv.next11.4, %.lr.ph5 ]
  %27 = trunc i64 %indvars.iv10 to i32
  %28 = sitofp i32 %27 to double
  %29 = getelementptr inbounds double, double* %3, i64 %indvars.iv10
  store double %28, double* %29, align 8
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %30 = trunc i64 %indvars.iv.next11 to i32
  %31 = sitofp i32 %30 to double
  %32 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next11
  store double %31, double* %32, align 8
  %indvars.iv.next11.1 = add nsw i64 %indvars.iv10, 2
  %33 = trunc i64 %indvars.iv.next11.1 to i32
  %34 = sitofp i32 %33 to double
  %35 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next11.1
  store double %34, double* %35, align 8
  %indvars.iv.next11.2 = add nsw i64 %indvars.iv10, 3
  %36 = trunc i64 %indvars.iv.next11.2 to i32
  %37 = sitofp i32 %36 to double
  %38 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next11.2
  store double %37, double* %38, align 8
  %indvars.iv.next11.3 = add nsw i64 %indvars.iv10, 4
  %39 = trunc i64 %indvars.iv.next11.3 to i32
  %40 = sitofp i32 %39 to double
  %41 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next11.3
  store double %40, double* %41, align 8
  %exitcond13.4 = icmp eq i64 %indvars.iv.next11.3, 499
  %indvars.iv.next11.4 = add nsw i64 %indvars.iv10, 5
  br i1 %exitcond13.4, label %.preheader.us.preheader, label %.lr.ph5

.preheader.us.preheader:                          ; preds = %.lr.ph5
  br label %.preheader.us

._crit_edge3:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_fdtd_2d([1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture, double*) #2 {
.preheader6.lr.ph:
  %scevgep145 = getelementptr [1200 x double], [1200 x double]* %1, i64 1, i64 0
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge12, %.preheader6.lr.ph
  %indvars.iv41 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next42, %._crit_edge12 ]
  %4 = getelementptr inbounds double, double* %3, i64 %indvars.iv41
  %5 = bitcast double* %4 to i64*
  %6 = bitcast double* %4 to [1200 x double]*
  %bound0148 = icmp ugt [1200 x double]* %6, %1
  %bound1149 = icmp ult double* %4, %scevgep145
  %memcheck.conflict151 = and i1 %bound0148, %bound1149
  br i1 %memcheck.conflict151, label %scalar.ph142.preheader, label %vector.body140.preheader

vector.body140.preheader:                         ; preds = %.preheader6
  br label %vector.body140

scalar.ph142.preheader:                           ; preds = %.preheader6
  br label %scalar.ph142

vector.body140:                                   ; preds = %vector.body140, %vector.body140.preheader
  %index154 = phi i64 [ 0, %vector.body140.preheader ], [ %index.next155.2, %vector.body140 ]
  %7 = load i64, i64* %5, align 8, !alias.scope !1
  %8 = insertelement <2 x i64> undef, i64 %7, i32 0
  %9 = shufflevector <2 x i64> %8, <2 x i64> undef, <2 x i32> zeroinitializer
  %10 = insertelement <2 x i64> undef, i64 %7, i32 0
  %11 = shufflevector <2 x i64> %10, <2 x i64> undef, <2 x i32> zeroinitializer
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index154
  %13 = bitcast double* %12 to <2 x i64>*
  store <2 x i64> %9, <2 x i64>* %13, align 8, !alias.scope !4, !noalias !1
  %14 = getelementptr double, double* %12, i64 2
  %15 = bitcast double* %14 to <2 x i64>*
  store <2 x i64> %11, <2 x i64>* %15, align 8, !alias.scope !4, !noalias !1
  %index.next155 = add nuw nsw i64 %index154, 4
  %16 = load i64, i64* %5, align 8, !alias.scope !1
  %17 = insertelement <2 x i64> undef, i64 %16, i32 0
  %18 = shufflevector <2 x i64> %17, <2 x i64> undef, <2 x i32> zeroinitializer
  %19 = insertelement <2 x i64> undef, i64 %16, i32 0
  %20 = shufflevector <2 x i64> %19, <2 x i64> undef, <2 x i32> zeroinitializer
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index.next155
  %22 = bitcast double* %21 to <2 x i64>*
  store <2 x i64> %18, <2 x i64>* %22, align 8, !alias.scope !4, !noalias !1
  %23 = getelementptr double, double* %21, i64 2
  %24 = bitcast double* %23 to <2 x i64>*
  store <2 x i64> %20, <2 x i64>* %24, align 8, !alias.scope !4, !noalias !1
  %index.next155.1 = add nsw i64 %index154, 8
  %25 = load i64, i64* %5, align 8, !alias.scope !1
  %26 = insertelement <2 x i64> undef, i64 %25, i32 0
  %27 = shufflevector <2 x i64> %26, <2 x i64> undef, <2 x i32> zeroinitializer
  %28 = insertelement <2 x i64> undef, i64 %25, i32 0
  %29 = shufflevector <2 x i64> %28, <2 x i64> undef, <2 x i32> zeroinitializer
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index.next155.1
  %31 = bitcast double* %30 to <2 x i64>*
  store <2 x i64> %27, <2 x i64>* %31, align 8, !alias.scope !4, !noalias !1
  %32 = getelementptr double, double* %30, i64 2
  %33 = bitcast double* %32 to <2 x i64>*
  store <2 x i64> %29, <2 x i64>* %33, align 8, !alias.scope !4, !noalias !1
  %index.next155.2 = add nsw i64 %index154, 12
  %34 = icmp eq i64 %index.next155.2, 1200
  br i1 %34, label %.preheader2.us.preheader.loopexit2, label %vector.body140, !llvm.loop !6

.preheader2.us.preheader.loopexit:                ; preds = %scalar.ph142
  br label %.preheader2.us.preheader

.preheader2.us.preheader.loopexit2:               ; preds = %vector.body140
  br label %.preheader2.us.preheader

.preheader2.us.preheader:                         ; preds = %.preheader2.us.preheader.loopexit2, %.preheader2.us.preheader.loopexit
  br label %.preheader2.us

.preheader2.us:                                   ; preds = %._crit_edge.us, %.preheader2.us.preheader
  %indvar = phi i64 [ %indvar.next, %._crit_edge.us ], [ 0, %.preheader2.us.preheader ]
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %._crit_edge.us ], [ 1, %.preheader2.us.preheader ]
  %35 = add nuw nsw i64 %indvar, 1
  %scevgep112 = getelementptr [1200 x double], [1200 x double]* %1, i64 %35, i64 0
  %36 = add nuw nsw i64 %indvar, 2
  %scevgep114 = getelementptr [1200 x double], [1200 x double]* %1, i64 %36, i64 0
  %scevgep116 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvar, i64 0
  %scevgep118 = getelementptr [1200 x double], [1200 x double]* %2, i64 %36, i64 0
  %37 = add nsw i64 %indvars.iv25, -1
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
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv25, i64 %index126
  %39 = bitcast double* %38 to <2 x double>*
  %wide.load134 = load <2 x double>, <2 x double>* %39, align 8, !alias.scope !9, !noalias !12
  %40 = getelementptr double, double* %38, i64 2
  %41 = bitcast double* %40 to <2 x double>*
  %wide.load135 = load <2 x double>, <2 x double>* %41, align 8, !alias.scope !9, !noalias !12
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv25, i64 %index126
  %43 = bitcast double* %42 to <2 x double>*
  %wide.load136 = load <2 x double>, <2 x double>* %43, align 8, !alias.scope !12
  %44 = getelementptr double, double* %42, i64 2
  %45 = bitcast double* %44 to <2 x double>*
  %wide.load137 = load <2 x double>, <2 x double>* %45, align 8, !alias.scope !12
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %37, i64 %index126
  %47 = bitcast double* %46 to <2 x double>*
  %wide.load138 = load <2 x double>, <2 x double>* %47, align 8, !alias.scope !12
  %48 = getelementptr double, double* %46, i64 2
  %49 = bitcast double* %48 to <2 x double>*
  %wide.load139 = load <2 x double>, <2 x double>* %49, align 8, !alias.scope !12
  %50 = fsub <2 x double> %wide.load136, %wide.load138
  %51 = fsub <2 x double> %wide.load137, %wide.load139
  %52 = fmul <2 x double> %50, <double 5.000000e-01, double 5.000000e-01>
  %53 = fmul <2 x double> %51, <double 5.000000e-01, double 5.000000e-01>
  %54 = fsub <2 x double> %wide.load134, %52
  %55 = fsub <2 x double> %wide.load135, %53
  %56 = bitcast double* %38 to <2 x double>*
  store <2 x double> %54, <2 x double>* %56, align 8, !alias.scope !9, !noalias !12
  %57 = bitcast double* %40 to <2 x double>*
  store <2 x double> %55, <2 x double>* %57, align 8, !alias.scope !9, !noalias !12
  %index.next127 = add nuw nsw i64 %index126, 4
  %58 = icmp eq i64 %index.next127, 1200
  br i1 %58, label %._crit_edge.us.loopexit1, label %vector.body107, !llvm.loop !14

scalar.ph109:                                     ; preds = %scalar.ph109, %scalar.ph109.preheader
  %indvars.iv21 = phi i64 [ 0, %scalar.ph109.preheader ], [ %indvars.iv.next22.1, %scalar.ph109 ]
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv21
  %60 = load double, double* %59, align 8
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv25, i64 %indvars.iv21
  %62 = load double, double* %61, align 8
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %37, i64 %indvars.iv21
  %64 = load double, double* %63, align 8
  %65 = fsub double %62, %64
  %66 = fmul double %65, 5.000000e-01
  %67 = fsub double %60, %66
  store double %67, double* %59, align 8
  %indvars.iv.next22 = or i64 %indvars.iv21, 1
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv.next22
  %69 = load double, double* %68, align 8
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv25, i64 %indvars.iv.next22
  %71 = load double, double* %70, align 8
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %37, i64 %indvars.iv.next22
  %73 = load double, double* %72, align 8
  %74 = fsub double %71, %73
  %75 = fmul double %74, 5.000000e-01
  %76 = fsub double %69, %75
  store double %76, double* %68, align 8
  %exitcond24.1 = icmp eq i64 %indvars.iv.next22, 1199
  %indvars.iv.next22.1 = add nsw i64 %indvars.iv21, 2
  br i1 %exitcond24.1, label %._crit_edge.us.loopexit, label %scalar.ph109, !llvm.loop !15

._crit_edge.us.loopexit:                          ; preds = %scalar.ph109
  br label %._crit_edge.us

._crit_edge.us.loopexit1:                         ; preds = %vector.body107
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit1, %._crit_edge.us.loopexit
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond3 = icmp eq i64 %indvar.next, 999
  br i1 %exitcond3, label %.preheader1.us.preheader, label %.preheader2.us

.preheader1.us.preheader:                         ; preds = %._crit_edge.us
  br label %.preheader1.us

scalar.ph142:                                     ; preds = %scalar.ph142, %scalar.ph142.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph142.preheader ], [ %indvars.iv.next.7, %scalar.ph142 ]
  %77 = load i64, i64* %5, align 8
  %78 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv
  %79 = bitcast double* %78 to i64*
  store i64 %77, i64* %79, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %80 = load i64, i64* %5, align 8
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next
  %82 = bitcast double* %81 to i64*
  store i64 %80, i64* %82, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %83 = load i64, i64* %5, align 8
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.1
  %85 = bitcast double* %84 to i64*
  store i64 %83, i64* %85, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %86 = load i64, i64* %5, align 8
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.2
  %88 = bitcast double* %87 to i64*
  store i64 %86, i64* %88, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %89 = load i64, i64* %5, align 8
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.3
  %91 = bitcast double* %90 to i64*
  store i64 %89, i64* %91, align 8
  %indvars.iv.next.4 = or i64 %indvars.iv, 5
  %92 = load i64, i64* %5, align 8
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.4
  %94 = bitcast double* %93 to i64*
  store i64 %92, i64* %94, align 8
  %indvars.iv.next.5 = or i64 %indvars.iv, 6
  %95 = load i64, i64* %5, align 8
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.5
  %97 = bitcast double* %96 to i64*
  store i64 %95, i64* %97, align 8
  %indvars.iv.next.6 = or i64 %indvars.iv, 7
  %98 = load i64, i64* %5, align 8
  %99 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.6
  %100 = bitcast double* %99 to i64*
  store i64 %98, i64* %100, align 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.6, 1199
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  br i1 %exitcond.7, label %.preheader2.us.preheader.loopexit, label %scalar.ph142, !llvm.loop !16

.preheader1.us:                                   ; preds = %._crit_edge9.us, %.preheader1.us.preheader
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %._crit_edge9.us ], [ 0, %.preheader1.us.preheader ]
  %scevgep79 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv32, i64 1
  %101 = add nuw nsw i64 %indvars.iv32, 1
  %scevgep81 = getelementptr [1200 x double], [1200 x double]* %0, i64 %101, i64 0
  %scevgep83 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv32, i64 0
  %scevgep85 = getelementptr [1200 x double], [1200 x double]* %2, i64 %101, i64 0
  %bound087 = icmp ult double* %scevgep79, %scevgep85
  %bound188 = icmp ult double* %scevgep83, %scevgep81
  %memcheck.conflict90 = and i1 %bound087, %bound188
  br i1 %memcheck.conflict90, label %scalar.ph76.preheader, label %vector.body74.preheader

vector.body74.preheader:                          ; preds = %.preheader1.us
  br label %vector.body74

vector.body74:                                    ; preds = %vector.body74.preheader, %vector.body74
  %index93 = phi i64 [ %index.next94, %vector.body74 ], [ 0, %vector.body74.preheader ]
  %offset.idx = or i64 %index93, 1
  %102 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv32, i64 %offset.idx
  %103 = bitcast double* %102 to <2 x double>*
  %wide.load101 = load <2 x double>, <2 x double>* %103, align 8, !alias.scope !17, !noalias !20
  %104 = getelementptr double, double* %102, i64 2
  %105 = bitcast double* %104 to <2 x double>*
  %wide.load102 = load <2 x double>, <2 x double>* %105, align 8, !alias.scope !17, !noalias !20
  %106 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv32, i64 %offset.idx
  %107 = bitcast double* %106 to <2 x double>*
  %wide.load103 = load <2 x double>, <2 x double>* %107, align 8, !alias.scope !20
  %108 = getelementptr double, double* %106, i64 2
  %109 = bitcast double* %108 to <2 x double>*
  %wide.load104 = load <2 x double>, <2 x double>* %109, align 8, !alias.scope !20
  %110 = add nsw i64 %offset.idx, -1
  %111 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv32, i64 %110
  %112 = bitcast double* %111 to <2 x double>*
  %wide.load105 = load <2 x double>, <2 x double>* %112, align 8, !alias.scope !20
  %113 = getelementptr double, double* %111, i64 2
  %114 = bitcast double* %113 to <2 x double>*
  %wide.load106 = load <2 x double>, <2 x double>* %114, align 8, !alias.scope !20
  %115 = fsub <2 x double> %wide.load103, %wide.load105
  %116 = fsub <2 x double> %wide.load104, %wide.load106
  %117 = fmul <2 x double> %115, <double 5.000000e-01, double 5.000000e-01>
  %118 = fmul <2 x double> %116, <double 5.000000e-01, double 5.000000e-01>
  %119 = fsub <2 x double> %wide.load101, %117
  %120 = fsub <2 x double> %wide.load102, %118
  %121 = bitcast double* %102 to <2 x double>*
  store <2 x double> %119, <2 x double>* %121, align 8, !alias.scope !17, !noalias !20
  %122 = bitcast double* %104 to <2 x double>*
  store <2 x double> %120, <2 x double>* %122, align 8, !alias.scope !17, !noalias !20
  %index.next94 = add nuw nsw i64 %index93, 4
  %123 = icmp eq i64 %index.next94, 1196
  br i1 %123, label %scalar.ph76.preheader.loopexit, label %vector.body74, !llvm.loop !22

scalar.ph76.preheader.loopexit:                   ; preds = %vector.body74
  br label %scalar.ph76.preheader

scalar.ph76.preheader:                            ; preds = %scalar.ph76.preheader.loopexit, %.preheader1.us
  %indvars.iv28.ph = phi i64 [ 1, %.preheader1.us ], [ 1197, %scalar.ph76.preheader.loopexit ]
  br i1 true, label %scalar.ph76.prol.preheader, label %scalar.ph76.prol.loopexit.unr-lcssa

scalar.ph76.prol.preheader:                       ; preds = %scalar.ph76.preheader
  br label %scalar.ph76.prol

scalar.ph76.prol:                                 ; preds = %scalar.ph76.prol.preheader
  %124 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv32, i64 %indvars.iv28.ph
  %125 = load double, double* %124, align 8
  %126 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv32, i64 %indvars.iv28.ph
  %127 = load double, double* %126, align 8
  %128 = add nsw i64 %indvars.iv28.ph, -1
  %129 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv32, i64 %128
  %130 = load double, double* %129, align 8
  %131 = fsub double %127, %130
  %132 = fmul double %131, 5.000000e-01
  %133 = fsub double %125, %132
  store double %133, double* %124, align 8
  %indvars.iv.next29.prol = add nuw nsw i64 %indvars.iv28.ph, 1
  br label %scalar.ph76.prol.loopexit.unr-lcssa

scalar.ph76.prol.loopexit.unr-lcssa:              ; preds = %scalar.ph76.preheader, %scalar.ph76.prol
  %indvars.iv28.unr.ph = phi i64 [ %indvars.iv.next29.prol, %scalar.ph76.prol ], [ %indvars.iv28.ph, %scalar.ph76.preheader ]
  br label %scalar.ph76.prol.loopexit

scalar.ph76.prol.loopexit:                        ; preds = %scalar.ph76.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge9.us, label %scalar.ph76.preheader.new

scalar.ph76.preheader.new:                        ; preds = %scalar.ph76.prol.loopexit
  br label %scalar.ph76

scalar.ph76:                                      ; preds = %scalar.ph76, %scalar.ph76.preheader.new
  %indvars.iv28 = phi i64 [ %indvars.iv28.unr.ph, %scalar.ph76.preheader.new ], [ %indvars.iv.next29.1, %scalar.ph76 ]
  %134 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv32, i64 %indvars.iv28
  %135 = load double, double* %134, align 8
  %136 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv32, i64 %indvars.iv28
  %137 = load double, double* %136, align 8
  %138 = add nsw i64 %indvars.iv28, -1
  %139 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv32, i64 %138
  %140 = load double, double* %139, align 8
  %141 = fsub double %137, %140
  %142 = fmul double %141, 5.000000e-01
  %143 = fsub double %135, %142
  store double %143, double* %134, align 8
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %144 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv32, i64 %indvars.iv.next29
  %145 = load double, double* %144, align 8
  %146 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv32, i64 %indvars.iv.next29
  %147 = load double, double* %146, align 8
  %148 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv32, i64 %indvars.iv28
  %149 = load double, double* %148, align 8
  %150 = fsub double %147, %149
  %151 = fmul double %150, 5.000000e-01
  %152 = fsub double %145, %151
  store double %152, double* %144, align 8
  %exitcond31.1 = icmp eq i64 %indvars.iv.next29, 1199
  %indvars.iv.next29.1 = add nsw i64 %indvars.iv28, 2
  br i1 %exitcond31.1, label %._crit_edge9.us.unr-lcssa, label %scalar.ph76, !llvm.loop !23

._crit_edge9.us.unr-lcssa:                        ; preds = %scalar.ph76
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %scalar.ph76.prol.loopexit, %._crit_edge9.us.unr-lcssa
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next33, 1000
  br i1 %exitcond4, label %.preheader.us.preheader, label %.preheader1.us

.preheader.us.preheader:                          ; preds = %._crit_edge9.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge11.us, %.preheader.us.preheader
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge11.us ], [ 0, %.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 0
  %scevgep51 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 1199
  %scevgep53 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv39, i64 0
  %153 = add nuw nsw i64 %indvars.iv39, 1
  %scevgep55 = getelementptr [1200 x double], [1200 x double]* %0, i64 %153, i64 0
  %scevgep57 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv39, i64 0
  %scevgep59 = getelementptr [1200 x double], [1200 x double]* %1, i64 %153, i64 1199
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
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
  %154 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 %index
  %155 = bitcast double* %154 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %155, align 8, !alias.scope !24, !noalias !27
  %156 = getelementptr double, double* %154, i64 2
  %157 = bitcast double* %156 to <2 x double>*
  %wide.load65 = load <2 x double>, <2 x double>* %157, align 8, !alias.scope !24, !noalias !27
  %158 = or i64 %index, 1
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv39, i64 %158
  %160 = bitcast double* %159 to <2 x double>*
  %wide.load66 = load <2 x double>, <2 x double>* %160, align 8, !alias.scope !30
  %161 = getelementptr double, double* %159, i64 2
  %162 = bitcast double* %161 to <2 x double>*
  %wide.load67 = load <2 x double>, <2 x double>* %162, align 8, !alias.scope !30
  %163 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv39, i64 %index
  %164 = bitcast double* %163 to <2 x double>*
  %wide.load68 = load <2 x double>, <2 x double>* %164, align 8, !alias.scope !30
  %165 = getelementptr double, double* %163, i64 2
  %166 = bitcast double* %165 to <2 x double>*
  %wide.load69 = load <2 x double>, <2 x double>* %166, align 8, !alias.scope !30
  %167 = fsub <2 x double> %wide.load66, %wide.load68
  %168 = fsub <2 x double> %wide.load67, %wide.load69
  %169 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next40, i64 %index
  %170 = bitcast double* %169 to <2 x double>*
  %wide.load70 = load <2 x double>, <2 x double>* %170, align 8, !alias.scope !31
  %171 = getelementptr double, double* %169, i64 2
  %172 = bitcast double* %171 to <2 x double>*
  %wide.load71 = load <2 x double>, <2 x double>* %172, align 8, !alias.scope !31
  %173 = fadd <2 x double> %167, %wide.load70
  %174 = fadd <2 x double> %168, %wide.load71
  %175 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv39, i64 %index
  %176 = bitcast double* %175 to <2 x double>*
  %wide.load72 = load <2 x double>, <2 x double>* %176, align 8, !alias.scope !31
  %177 = getelementptr double, double* %175, i64 2
  %178 = bitcast double* %177 to <2 x double>*
  %wide.load73 = load <2 x double>, <2 x double>* %178, align 8, !alias.scope !31
  %179 = fsub <2 x double> %173, %wide.load72
  %180 = fsub <2 x double> %174, %wide.load73
  %181 = fmul <2 x double> %179, <double 7.000000e-01, double 7.000000e-01>
  %182 = fmul <2 x double> %180, <double 7.000000e-01, double 7.000000e-01>
  %183 = fsub <2 x double> %wide.load, %181
  %184 = fsub <2 x double> %wide.load65, %182
  %185 = bitcast double* %154 to <2 x double>*
  store <2 x double> %183, <2 x double>* %185, align 8, !alias.scope !24, !noalias !27
  %186 = bitcast double* %156 to <2 x double>*
  store <2 x double> %184, <2 x double>* %186, align 8, !alias.scope !24, !noalias !27
  %index.next = add nuw nsw i64 %index, 4
  %187 = icmp eq i64 %index.next, 1196
  br i1 %187, label %._crit_edge19.preheader.loopexit, label %vector.body, !llvm.loop !32

._crit_edge19.preheader.loopexit:                 ; preds = %vector.body
  br label %._crit_edge19.preheader

._crit_edge19.preheader:                          ; preds = %._crit_edge19.preheader.loopexit, %.preheader.us
  %indvars.iv35.ph = phi i64 [ 0, %.preheader.us ], [ 1196, %._crit_edge19.preheader.loopexit ]
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.preheader, %._crit_edge19
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %._crit_edge19 ], [ %indvars.iv35.ph, %._crit_edge19.preheader ]
  %188 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv35
  %189 = load double, double* %188, align 8
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %190 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv39, i64 %indvars.iv.next36
  %191 = load double, double* %190, align 8
  %192 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv39, i64 %indvars.iv35
  %193 = load double, double* %192, align 8
  %194 = fsub double %191, %193
  %195 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next40, i64 %indvars.iv35
  %196 = load double, double* %195, align 8
  %197 = fadd double %194, %196
  %198 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv39, i64 %indvars.iv35
  %199 = load double, double* %198, align 8
  %200 = fsub double %197, %199
  %201 = fmul double %200, 7.000000e-01
  %202 = fsub double %189, %201
  store double %202, double* %188, align 8
  %exitcond38 = icmp eq i64 %indvars.iv35, 1198
  br i1 %exitcond38, label %._crit_edge11.us, label %._crit_edge19, !llvm.loop !33

._crit_edge11.us:                                 ; preds = %._crit_edge19
  %exitcond5 = icmp eq i64 %indvars.iv.next40, 999
  br i1 %exitcond5, label %._crit_edge12, label %.preheader.us

._crit_edge12:                                    ; preds = %._crit_edge11.us
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next42, 500
  br i1 %exitcond6, label %._crit_edge13, label %.preheader6

._crit_edge13:                                    ; preds = %._crit_edge12
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) #0 {
.preheader8.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
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
  %fputc6.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge19, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv33, i64 %indvars.iv31
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next32, 1200
  br i1 %exitcond4, label %._crit_edge14.us, label %._crit_edge19

._crit_edge14.us:                                 ; preds = %._crit_edge
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next34, 1000
  br i1 %exitcond5, label %._crit_edge15, label %.preheader8.us

._crit_edge15:                                    ; preds = %._crit_edge14.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
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
  %fputc3.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %30) #5
  br label %._crit_edge20

._crit_edge20:                                    ; preds = %._crit_edge21, %29
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv26
  %33 = load double, double* %32, align 8
  %34 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %33) #6
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next27, 1200
  br i1 %exitcond2, label %._crit_edge11.us, label %._crit_edge21

._crit_edge11.us:                                 ; preds = %._crit_edge20
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next29, 1000
  br i1 %exitcond3, label %._crit_edge12, label %.preheader7.us

._crit_edge12:                                    ; preds = %._crit_edge11.us
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
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
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %45) #5
  br label %._crit_edge22

._crit_edge22:                                    ; preds = %._crit_edge23, %44
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv24, i64 %indvars.iv
  %48 = load double, double* %47, align 8
  %49 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %48) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge23

._crit_edge.us:                                   ; preds = %._crit_edge22
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next25, 1000
  br i1 %exitcond1, label %._crit_edge9, label %.preheader.us

._crit_edge9:                                     ; preds = %._crit_edge.us
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %51 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %50, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
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
