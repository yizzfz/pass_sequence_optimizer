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
.lr.ph36.preheader:
  br label %.lr.ph36

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv38 = phi i64 [ %indvars.iv.next39, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %4 = trunc i64 %indvars.iv38 to i32
  %5 = sitofp i32 %4 to double
  %6 = insertelement <2 x double> undef, double %5, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %8 = trunc i64 %indvars.iv.next to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv38, i64 %indvars.iv
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
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv38, i64 %indvars.iv
  store double %19, double* %20, align 8
  %21 = add nuw nsw i64 %indvars.iv, 3
  %22 = trunc i64 %21 to i32
  %23 = sitofp i32 %22 to double
  %24 = fmul double %5, %23
  %25 = fdiv double %24, 1.000000e+03
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv38, i64 %indvars.iv
  store double %25, double* %26, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1199
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next39 = add nuw nsw i64 %indvars.iv38, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next39, 1000
  br i1 %exitcond1, label %._crit_edge33, label %.preheader.us

.lr.ph36:                                         ; preds = %.lr.ph36, %.lr.ph36.preheader
  %indvars.iv41 = phi i64 [ 0, %.lr.ph36.preheader ], [ %indvars.iv.next42.4, %.lr.ph36 ]
  %27 = trunc i64 %indvars.iv41 to i32
  %28 = sitofp i32 %27 to double
  %29 = getelementptr inbounds double, double* %3, i64 %indvars.iv41
  store double %28, double* %29, align 8
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %30 = trunc i64 %indvars.iv.next42 to i32
  %31 = sitofp i32 %30 to double
  %32 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next42
  store double %31, double* %32, align 8
  %indvars.iv.next42.1 = add nsw i64 %indvars.iv41, 2
  %33 = trunc i64 %indvars.iv.next42.1 to i32
  %34 = sitofp i32 %33 to double
  %35 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next42.1
  store double %34, double* %35, align 8
  %indvars.iv.next42.2 = add nsw i64 %indvars.iv41, 3
  %36 = trunc i64 %indvars.iv.next42.2 to i32
  %37 = sitofp i32 %36 to double
  %38 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next42.2
  store double %37, double* %38, align 8
  %indvars.iv.next42.3 = add nsw i64 %indvars.iv41, 4
  %39 = trunc i64 %indvars.iv.next42.3 to i32
  %40 = sitofp i32 %39 to double
  %41 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next42.3
  store double %40, double* %41, align 8
  %exitcond43.4 = icmp eq i64 %indvars.iv.next42.3, 499
  %indvars.iv.next42.4 = add nsw i64 %indvars.iv41, 5
  br i1 %exitcond43.4, label %.preheader.us.preheader, label %.lr.ph36

.preheader.us.preheader:                          ; preds = %.lr.ph36
  br label %.preheader.us

._crit_edge33:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_fdtd_2d([1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #0 {
.preheader78.lr.ph:
  %scevgep97 = getelementptr [1200 x double], [1200 x double]* %1, i64 1, i64 0
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge91, %.preheader78.lr.ph
  %indvars.iv118 = phi i64 [ 0, %.preheader78.lr.ph ], [ %indvars.iv.next119, %._crit_edge91 ]
  %4 = getelementptr inbounds double, double* %3, i64 %indvars.iv118
  %5 = bitcast double* %4 to i64*
  %6 = bitcast double* %4 to [1200 x double]*
  %bound0100 = icmp ugt [1200 x double]* %6, %1
  %bound1101 = icmp ult double* %4, %scevgep97
  %memcheck.conflict103 = and i1 %bound0100, %bound1101
  br i1 %memcheck.conflict103, label %scalar.ph94.preheader, label %vector.body92.preheader

vector.body92.preheader:                          ; preds = %.lr.ph
  br label %vector.body92

scalar.ph94.preheader:                            ; preds = %.lr.ph
  br label %scalar.ph94

vector.body92:                                    ; preds = %vector.body92, %vector.body92.preheader
  %index106 = phi i64 [ 0, %vector.body92.preheader ], [ %index.next107.2, %vector.body92 ]
  %7 = load i64, i64* %5, align 8, !alias.scope !1
  %8 = insertelement <2 x i64> undef, i64 %7, i32 0
  %9 = shufflevector <2 x i64> %8, <2 x i64> undef, <2 x i32> zeroinitializer
  %10 = insertelement <2 x i64> undef, i64 %7, i32 0
  %11 = shufflevector <2 x i64> %10, <2 x i64> undef, <2 x i32> zeroinitializer
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index106
  %13 = bitcast double* %12 to <2 x i64>*
  store <2 x i64> %9, <2 x i64>* %13, align 8, !alias.scope !4, !noalias !1
  %14 = getelementptr double, double* %12, i64 2
  %15 = bitcast double* %14 to <2 x i64>*
  store <2 x i64> %11, <2 x i64>* %15, align 8, !alias.scope !4, !noalias !1
  %index.next107 = add nuw nsw i64 %index106, 4
  %16 = load i64, i64* %5, align 8, !alias.scope !1
  %17 = insertelement <2 x i64> undef, i64 %16, i32 0
  %18 = shufflevector <2 x i64> %17, <2 x i64> undef, <2 x i32> zeroinitializer
  %19 = insertelement <2 x i64> undef, i64 %16, i32 0
  %20 = shufflevector <2 x i64> %19, <2 x i64> undef, <2 x i32> zeroinitializer
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index.next107
  %22 = bitcast double* %21 to <2 x i64>*
  store <2 x i64> %18, <2 x i64>* %22, align 8, !alias.scope !4, !noalias !1
  %23 = getelementptr double, double* %21, i64 2
  %24 = bitcast double* %23 to <2 x i64>*
  store <2 x i64> %20, <2 x i64>* %24, align 8, !alias.scope !4, !noalias !1
  %index.next107.1 = add nsw i64 %index106, 8
  %25 = load i64, i64* %5, align 8, !alias.scope !1
  %26 = insertelement <2 x i64> undef, i64 %25, i32 0
  %27 = shufflevector <2 x i64> %26, <2 x i64> undef, <2 x i32> zeroinitializer
  %28 = insertelement <2 x i64> undef, i64 %25, i32 0
  %29 = shufflevector <2 x i64> %28, <2 x i64> undef, <2 x i32> zeroinitializer
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index.next107.1
  %31 = bitcast double* %30 to <2 x i64>*
  store <2 x i64> %27, <2 x i64>* %31, align 8, !alias.scope !4, !noalias !1
  %32 = getelementptr double, double* %30, i64 2
  %33 = bitcast double* %32 to <2 x i64>*
  store <2 x i64> %29, <2 x i64>* %33, align 8, !alias.scope !4, !noalias !1
  %index.next107.2 = add nsw i64 %index106, 12
  %34 = icmp eq i64 %index.next107.2, 1200
  br i1 %34, label %.preheader74.us.preheader.loopexit115, label %vector.body92, !llvm.loop !6

.preheader74.us.preheader.loopexit:               ; preds = %scalar.ph94
  br label %.preheader74.us.preheader

.preheader74.us.preheader.loopexit115:            ; preds = %vector.body92
  br label %.preheader74.us.preheader

.preheader74.us.preheader:                        ; preds = %.preheader74.us.preheader.loopexit115, %.preheader74.us.preheader.loopexit
  br label %.preheader74.us

.preheader74.us:                                  ; preds = %._crit_edge.us, %.preheader74.us.preheader
  %indvar = phi i64 [ %indvar.next, %._crit_edge.us ], [ 0, %.preheader74.us.preheader ]
  %indvars.iv104 = phi i64 [ %indvars.iv.next105, %._crit_edge.us ], [ 1, %.preheader74.us.preheader ]
  %35 = add nuw nsw i64 %indvar, 1
  %scevgep63 = getelementptr [1200 x double], [1200 x double]* %1, i64 %35, i64 0
  %36 = add nuw nsw i64 %indvar, 2
  %scevgep65 = getelementptr [1200 x double], [1200 x double]* %1, i64 %36, i64 0
  %scevgep68 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvar, i64 0
  %scevgep70 = getelementptr [1200 x double], [1200 x double]* %2, i64 %36, i64 0
  %37 = add nsw i64 %indvars.iv104, -1
  %bound072 = icmp ult double* %scevgep63, %scevgep70
  %bound173 = icmp ult double* %scevgep68, %scevgep65
  %memcheck.conflict75 = and i1 %bound072, %bound173
  br i1 %memcheck.conflict75, label %scalar.ph60.preheader, label %vector.body58.preheader

vector.body58.preheader:                          ; preds = %.preheader74.us
  br label %vector.body58

scalar.ph60.preheader:                            ; preds = %.preheader74.us
  br label %scalar.ph60

vector.body58:                                    ; preds = %vector.body58.preheader, %vector.body58
  %index78 = phi i64 [ %index.next79, %vector.body58 ], [ 0, %vector.body58.preheader ]
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv104, i64 %index78
  %39 = bitcast double* %38 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %39, align 8, !alias.scope !9, !noalias !12
  %40 = getelementptr double, double* %38, i64 2
  %41 = bitcast double* %40 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %41, align 8, !alias.scope !9, !noalias !12
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv104, i64 %index78
  %43 = bitcast double* %42 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %43, align 8, !alias.scope !12
  %44 = getelementptr double, double* %42, i64 2
  %45 = bitcast double* %44 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %45, align 8, !alias.scope !12
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %37, i64 %index78
  %47 = bitcast double* %46 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %47, align 8, !alias.scope !12
  %48 = getelementptr double, double* %46, i64 2
  %49 = bitcast double* %48 to <2 x double>*
  %wide.load91 = load <2 x double>, <2 x double>* %49, align 8, !alias.scope !12
  %50 = fsub <2 x double> %wide.load88, %wide.load90
  %51 = fsub <2 x double> %wide.load89, %wide.load91
  %52 = fmul <2 x double> %50, <double 5.000000e-01, double 5.000000e-01>
  %53 = fmul <2 x double> %51, <double 5.000000e-01, double 5.000000e-01>
  %54 = fsub <2 x double> %wide.load86, %52
  %55 = fsub <2 x double> %wide.load87, %53
  %56 = bitcast double* %38 to <2 x double>*
  store <2 x double> %54, <2 x double>* %56, align 8, !alias.scope !9, !noalias !12
  %57 = bitcast double* %40 to <2 x double>*
  store <2 x double> %55, <2 x double>* %57, align 8, !alias.scope !9, !noalias !12
  %index.next79 = add nuw nsw i64 %index78, 4
  %58 = icmp eq i64 %index.next79, 1200
  br i1 %58, label %._crit_edge.us.loopexit114, label %vector.body58, !llvm.loop !14

scalar.ph60:                                      ; preds = %scalar.ph60, %scalar.ph60.preheader
  %indvars.iv101 = phi i64 [ 0, %scalar.ph60.preheader ], [ %indvars.iv.next102.1, %scalar.ph60 ]
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv104, i64 %indvars.iv101
  %60 = load double, double* %59, align 8
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv104, i64 %indvars.iv101
  %62 = load double, double* %61, align 8
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %37, i64 %indvars.iv101
  %64 = load double, double* %63, align 8
  %65 = fsub double %62, %64
  %66 = fmul double %65, 5.000000e-01
  %67 = fsub double %60, %66
  store double %67, double* %59, align 8
  %indvars.iv.next102 = or i64 %indvars.iv101, 1
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv104, i64 %indvars.iv.next102
  %69 = load double, double* %68, align 8
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv104, i64 %indvars.iv.next102
  %71 = load double, double* %70, align 8
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %37, i64 %indvars.iv.next102
  %73 = load double, double* %72, align 8
  %74 = fsub double %71, %73
  %75 = fmul double %74, 5.000000e-01
  %76 = fsub double %69, %75
  store double %76, double* %68, align 8
  %exitcond103.1 = icmp eq i64 %indvars.iv.next102, 1199
  %indvars.iv.next102.1 = add nsw i64 %indvars.iv101, 2
  br i1 %exitcond103.1, label %._crit_edge.us.loopexit, label %scalar.ph60, !llvm.loop !15

._crit_edge.us.loopexit:                          ; preds = %scalar.ph60
  br label %._crit_edge.us

._crit_edge.us.loopexit114:                       ; preds = %vector.body58
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit114, %._crit_edge.us.loopexit
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond116 = icmp eq i64 %indvar.next, 999
  br i1 %exitcond116, label %.preheader73.us.preheader, label %.preheader74.us

.preheader73.us.preheader:                        ; preds = %._crit_edge.us
  br label %.preheader73.us

scalar.ph94:                                      ; preds = %scalar.ph94, %scalar.ph94.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph94.preheader ], [ %indvars.iv.next.7, %scalar.ph94 ]
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
  br i1 %exitcond.7, label %.preheader74.us.preheader.loopexit, label %scalar.ph94, !llvm.loop !16

.preheader73.us:                                  ; preds = %._crit_edge85.us, %.preheader73.us.preheader
  %indvars.iv110 = phi i64 [ %indvars.iv.next111, %._crit_edge85.us ], [ 0, %.preheader73.us.preheader ]
  %scevgep30 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv110, i64 1
  %101 = add nuw nsw i64 %indvars.iv110, 1
  %scevgep32 = getelementptr [1200 x double], [1200 x double]* %0, i64 %101, i64 0
  %scevgep34 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv110, i64 0
  %scevgep36 = getelementptr [1200 x double], [1200 x double]* %2, i64 %101, i64 0
  %bound038 = icmp ult double* %scevgep30, %scevgep36
  %bound139 = icmp ult double* %scevgep34, %scevgep32
  %memcheck.conflict41 = and i1 %bound038, %bound139
  br i1 %memcheck.conflict41, label %scalar.ph27.preheader, label %vector.body25.preheader

vector.body25.preheader:                          ; preds = %.preheader73.us
  br label %vector.body25

vector.body25:                                    ; preds = %vector.body25.preheader, %vector.body25
  %index44 = phi i64 [ %index.next45, %vector.body25 ], [ 0, %vector.body25.preheader ]
  %offset.idx = or i64 %index44, 1
  %102 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv110, i64 %offset.idx
  %103 = bitcast double* %102 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %103, align 8, !alias.scope !17, !noalias !20
  %104 = getelementptr double, double* %102, i64 2
  %105 = bitcast double* %104 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %105, align 8, !alias.scope !17, !noalias !20
  %106 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv110, i64 %offset.idx
  %107 = bitcast double* %106 to <2 x double>*
  %wide.load54 = load <2 x double>, <2 x double>* %107, align 8, !alias.scope !20
  %108 = getelementptr double, double* %106, i64 2
  %109 = bitcast double* %108 to <2 x double>*
  %wide.load55 = load <2 x double>, <2 x double>* %109, align 8, !alias.scope !20
  %110 = add nsw i64 %offset.idx, -1
  %111 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv110, i64 %110
  %112 = bitcast double* %111 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %112, align 8, !alias.scope !20
  %113 = getelementptr double, double* %111, i64 2
  %114 = bitcast double* %113 to <2 x double>*
  %wide.load57 = load <2 x double>, <2 x double>* %114, align 8, !alias.scope !20
  %115 = fsub <2 x double> %wide.load54, %wide.load56
  %116 = fsub <2 x double> %wide.load55, %wide.load57
  %117 = fmul <2 x double> %115, <double 5.000000e-01, double 5.000000e-01>
  %118 = fmul <2 x double> %116, <double 5.000000e-01, double 5.000000e-01>
  %119 = fsub <2 x double> %wide.load52, %117
  %120 = fsub <2 x double> %wide.load53, %118
  %121 = bitcast double* %102 to <2 x double>*
  store <2 x double> %119, <2 x double>* %121, align 8, !alias.scope !17, !noalias !20
  %122 = bitcast double* %104 to <2 x double>*
  store <2 x double> %120, <2 x double>* %122, align 8, !alias.scope !17, !noalias !20
  %index.next45 = add nuw nsw i64 %index44, 4
  %123 = icmp eq i64 %index.next45, 1196
  br i1 %123, label %scalar.ph27.preheader.loopexit, label %vector.body25, !llvm.loop !22

scalar.ph27.preheader.loopexit:                   ; preds = %vector.body25
  br label %scalar.ph27.preheader

scalar.ph27.preheader:                            ; preds = %scalar.ph27.preheader.loopexit, %.preheader73.us
  %indvars.iv107.ph = phi i64 [ 1, %.preheader73.us ], [ 1197, %scalar.ph27.preheader.loopexit ]
  br i1 true, label %scalar.ph27.prol.preheader, label %scalar.ph27.prol.loopexit.unr-lcssa

scalar.ph27.prol.preheader:                       ; preds = %scalar.ph27.preheader
  br label %scalar.ph27.prol

scalar.ph27.prol:                                 ; preds = %scalar.ph27.prol.preheader
  %124 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv110, i64 %indvars.iv107.ph
  %125 = load double, double* %124, align 8
  %126 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv110, i64 %indvars.iv107.ph
  %127 = load double, double* %126, align 8
  %128 = add nsw i64 %indvars.iv107.ph, -1
  %129 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv110, i64 %128
  %130 = load double, double* %129, align 8
  %131 = fsub double %127, %130
  %132 = fmul double %131, 5.000000e-01
  %133 = fsub double %125, %132
  store double %133, double* %124, align 8
  %indvars.iv.next108.prol = add nuw nsw i64 %indvars.iv107.ph, 1
  br label %scalar.ph27.prol.loopexit.unr-lcssa

scalar.ph27.prol.loopexit.unr-lcssa:              ; preds = %scalar.ph27.preheader, %scalar.ph27.prol
  %indvars.iv107.unr.ph = phi i64 [ %indvars.iv.next108.prol, %scalar.ph27.prol ], [ %indvars.iv107.ph, %scalar.ph27.preheader ]
  br label %scalar.ph27.prol.loopexit

scalar.ph27.prol.loopexit:                        ; preds = %scalar.ph27.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge85.us, label %scalar.ph27.preheader.new

scalar.ph27.preheader.new:                        ; preds = %scalar.ph27.prol.loopexit
  br label %scalar.ph27

scalar.ph27:                                      ; preds = %scalar.ph27, %scalar.ph27.preheader.new
  %indvars.iv107 = phi i64 [ %indvars.iv107.unr.ph, %scalar.ph27.preheader.new ], [ %indvars.iv.next108.1, %scalar.ph27 ]
  %134 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv110, i64 %indvars.iv107
  %135 = load double, double* %134, align 8
  %136 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv110, i64 %indvars.iv107
  %137 = load double, double* %136, align 8
  %138 = add nsw i64 %indvars.iv107, -1
  %139 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv110, i64 %138
  %140 = load double, double* %139, align 8
  %141 = fsub double %137, %140
  %142 = fmul double %141, 5.000000e-01
  %143 = fsub double %135, %142
  store double %143, double* %134, align 8
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  %144 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv110, i64 %indvars.iv.next108
  %145 = load double, double* %144, align 8
  %146 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv110, i64 %indvars.iv.next108
  %147 = load double, double* %146, align 8
  %148 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv110, i64 %indvars.iv107
  %149 = load double, double* %148, align 8
  %150 = fsub double %147, %149
  %151 = fmul double %150, 5.000000e-01
  %152 = fsub double %145, %151
  store double %152, double* %144, align 8
  %exitcond109.1 = icmp eq i64 %indvars.iv.next108, 1199
  %indvars.iv.next108.1 = add nsw i64 %indvars.iv107, 2
  br i1 %exitcond109.1, label %._crit_edge85.us.unr-lcssa, label %scalar.ph27, !llvm.loop !23

._crit_edge85.us.unr-lcssa:                       ; preds = %scalar.ph27
  br label %._crit_edge85.us

._crit_edge85.us:                                 ; preds = %scalar.ph27.prol.loopexit, %._crit_edge85.us.unr-lcssa
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1
  %exitcond117 = icmp eq i64 %indvars.iv.next111, 1000
  br i1 %exitcond117, label %.preheader.us.preheader, label %.preheader73.us

.preheader.us.preheader:                          ; preds = %._crit_edge85.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge89.us, %.preheader.us.preheader
  %indvars.iv116 = phi i64 [ %indvars.iv.next117, %._crit_edge89.us ], [ 0, %.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv116, i64 0
  %scevgep2 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv116, i64 1199
  %scevgep4 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv116, i64 0
  %153 = add nuw nsw i64 %indvars.iv116, 1
  %scevgep6 = getelementptr [1200 x double], [1200 x double]* %0, i64 %153, i64 0
  %scevgep8 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv116, i64 0
  %scevgep10 = getelementptr [1200 x double], [1200 x double]* %1, i64 %153, i64 1199
  %indvars.iv.next117 = add nuw nsw i64 %indvars.iv116, 1
  %bound0 = icmp ult double* %scevgep, %scevgep6
  %bound1 = icmp ult double* %scevgep4, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bound012 = icmp ult double* %scevgep, %scevgep10
  %bound113 = icmp ult double* %scevgep8, %scevgep2
  %found.conflict14 = and i1 %bound012, %bound113
  %conflict.rdx = or i1 %found.conflict, %found.conflict14
  br i1 %conflict.rdx, label %._crit_edge99.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %154 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv116, i64 %index
  %155 = bitcast double* %154 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %155, align 8, !alias.scope !24, !noalias !27
  %156 = getelementptr double, double* %154, i64 2
  %157 = bitcast double* %156 to <2 x double>*
  %wide.load16 = load <2 x double>, <2 x double>* %157, align 8, !alias.scope !24, !noalias !27
  %158 = or i64 %index, 1
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv116, i64 %158
  %160 = bitcast double* %159 to <2 x double>*
  %wide.load17 = load <2 x double>, <2 x double>* %160, align 8, !alias.scope !30
  %161 = getelementptr double, double* %159, i64 2
  %162 = bitcast double* %161 to <2 x double>*
  %wide.load18 = load <2 x double>, <2 x double>* %162, align 8, !alias.scope !30
  %163 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv116, i64 %index
  %164 = bitcast double* %163 to <2 x double>*
  %wide.load19 = load <2 x double>, <2 x double>* %164, align 8, !alias.scope !30
  %165 = getelementptr double, double* %163, i64 2
  %166 = bitcast double* %165 to <2 x double>*
  %wide.load20 = load <2 x double>, <2 x double>* %166, align 8, !alias.scope !30
  %167 = fsub <2 x double> %wide.load17, %wide.load19
  %168 = fsub <2 x double> %wide.load18, %wide.load20
  %169 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next117, i64 %index
  %170 = bitcast double* %169 to <2 x double>*
  %wide.load21 = load <2 x double>, <2 x double>* %170, align 8, !alias.scope !31
  %171 = getelementptr double, double* %169, i64 2
  %172 = bitcast double* %171 to <2 x double>*
  %wide.load22 = load <2 x double>, <2 x double>* %172, align 8, !alias.scope !31
  %173 = fadd <2 x double> %167, %wide.load21
  %174 = fadd <2 x double> %168, %wide.load22
  %175 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv116, i64 %index
  %176 = bitcast double* %175 to <2 x double>*
  %wide.load23 = load <2 x double>, <2 x double>* %176, align 8, !alias.scope !31
  %177 = getelementptr double, double* %175, i64 2
  %178 = bitcast double* %177 to <2 x double>*
  %wide.load24 = load <2 x double>, <2 x double>* %178, align 8, !alias.scope !31
  %179 = fsub <2 x double> %173, %wide.load23
  %180 = fsub <2 x double> %174, %wide.load24
  %181 = fmul <2 x double> %179, <double 7.000000e-01, double 7.000000e-01>
  %182 = fmul <2 x double> %180, <double 7.000000e-01, double 7.000000e-01>
  %183 = fsub <2 x double> %wide.load, %181
  %184 = fsub <2 x double> %wide.load16, %182
  %185 = bitcast double* %154 to <2 x double>*
  store <2 x double> %183, <2 x double>* %185, align 8, !alias.scope !24, !noalias !27
  %186 = bitcast double* %156 to <2 x double>*
  store <2 x double> %184, <2 x double>* %186, align 8, !alias.scope !24, !noalias !27
  %index.next = add nuw nsw i64 %index, 4
  %187 = icmp eq i64 %index.next, 1196
  br i1 %187, label %._crit_edge99.preheader.loopexit, label %vector.body, !llvm.loop !32

._crit_edge99.preheader.loopexit:                 ; preds = %vector.body
  br label %._crit_edge99.preheader

._crit_edge99.preheader:                          ; preds = %._crit_edge99.preheader.loopexit, %.preheader.us
  %indvars.iv113.ph = phi i64 [ 0, %.preheader.us ], [ 1196, %._crit_edge99.preheader.loopexit ]
  br label %._crit_edge99

._crit_edge99:                                    ; preds = %._crit_edge99.preheader, %._crit_edge99
  %indvars.iv113 = phi i64 [ %indvars.iv.next114, %._crit_edge99 ], [ %indvars.iv113.ph, %._crit_edge99.preheader ]
  %188 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv116, i64 %indvars.iv113
  %189 = load double, double* %188, align 8
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113, 1
  %190 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv116, i64 %indvars.iv.next114
  %191 = load double, double* %190, align 8
  %192 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv116, i64 %indvars.iv113
  %193 = load double, double* %192, align 8
  %194 = fsub double %191, %193
  %195 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next117, i64 %indvars.iv113
  %196 = load double, double* %195, align 8
  %197 = fadd double %194, %196
  %198 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv116, i64 %indvars.iv113
  %199 = load double, double* %198, align 8
  %200 = fsub double %197, %199
  %201 = fmul double %200, 7.000000e-01
  %202 = fsub double %189, %201
  store double %202, double* %188, align 8
  %exitcond115 = icmp eq i64 %indvars.iv113, 1198
  br i1 %exitcond115, label %._crit_edge89.us, label %._crit_edge99, !llvm.loop !33

._crit_edge89.us:                                 ; preds = %._crit_edge99
  %exitcond118 = icmp eq i64 %indvars.iv.next117, 999
  br i1 %exitcond118, label %._crit_edge91, label %.preheader.us

._crit_edge91:                                    ; preds = %._crit_edge89.us
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  %exitcond119 = icmp eq i64 %indvars.iv.next119, 500
  br i1 %exitcond119, label %._crit_edge93, label %.lr.ph

._crit_edge93:                                    ; preds = %._crit_edge91
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]*, [1200 x double]*, [1200 x double]*) #0 {
.preheader45.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #4
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader45.us

.preheader45.us:                                  ; preds = %._crit_edge56.us, %.preheader45.us.preheader
  %indvars.iv76 = phi i64 [ 0, %.preheader45.us.preheader ], [ %indvars.iv.next77, %._crit_edge56.us ]
  %7 = mul nuw nsw i64 %indvars.iv76, 1000
  br label %._crit_edge62

._crit_edge62:                                    ; preds = %._crit_edge, %.preheader45.us
  %indvars.iv74 = phi i64 [ 0, %.preheader45.us ], [ %indvars.iv.next75, %._crit_edge ]
  %8 = add nuw nsw i64 %indvars.iv74, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge62
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc43.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge62, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv76, i64 %indvars.iv74
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next75, 1200
  br i1 %exitcond4, label %._crit_edge56.us, label %._crit_edge62

._crit_edge56.us:                                 ; preds = %._crit_edge
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next77, 1000
  br i1 %exitcond5, label %.preheader44.us.preheader, label %.preheader45.us

.preheader44.us.preheader:                        ; preds = %._crit_edge56.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #4
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  br label %.preheader44.us

.preheader44.us:                                  ; preds = %._crit_edge51.us, %.preheader44.us.preheader
  %indvars.iv71 = phi i64 [ 0, %.preheader44.us.preheader ], [ %indvars.iv.next72, %._crit_edge51.us ]
  %24 = mul nuw nsw i64 %indvars.iv71, 1000
  br label %._crit_edge64

._crit_edge64:                                    ; preds = %._crit_edge63, %.preheader44.us
  %indvars.iv69 = phi i64 [ 0, %.preheader44.us ], [ %indvars.iv.next70, %._crit_edge63 ]
  %25 = add nuw nsw i64 %indvars.iv69, %24
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 20
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %._crit_edge63

; <label>:29:                                     ; preds = %._crit_edge64
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc40.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %30) #4
  br label %._crit_edge63

._crit_edge63:                                    ; preds = %._crit_edge64, %29
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv71, i64 %indvars.iv69
  %33 = load double, double* %32, align 8
  %34 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %33) #5
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next70, 1200
  br i1 %exitcond2, label %._crit_edge51.us, label %._crit_edge64

._crit_edge51.us:                                 ; preds = %._crit_edge63
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next72, 1000
  br i1 %exitcond3, label %.preheader.us.preheader, label %.preheader44.us

.preheader.us.preheader:                          ; preds = %._crit_edge51.us
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv67 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next68, %._crit_edge.us ]
  %39 = mul nuw nsw i64 %indvars.iv67, 1000
  br label %._crit_edge66

._crit_edge66:                                    ; preds = %._crit_edge65, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge65 ]
  %40 = add nuw nsw i64 %indvars.iv, %39
  %41 = trunc i64 %40 to i32
  %42 = srem i32 %41, 20
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %44, label %._crit_edge65

; <label>:44:                                     ; preds = %._crit_edge66
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %45) #4
  br label %._crit_edge65

._crit_edge65:                                    ; preds = %._crit_edge66, %44
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv67, i64 %indvars.iv
  %48 = load double, double* %47, align 8
  %49 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %48) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge66

._crit_edge.us:                                   ; preds = %._crit_edge65
  %indvars.iv.next68 = add nuw nsw i64 %indvars.iv67, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next68, 1000
  br i1 %exitcond1, label %._crit_edge48, label %.preheader.us

._crit_edge48:                                    ; preds = %._crit_edge.us
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
