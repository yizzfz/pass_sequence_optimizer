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
  %16 = bitcast i8* %5 to [1200 x double]*
  %17 = bitcast i8* %4 to [1200 x double]*
  %18 = bitcast i8* %3 to [1200 x double]*
  tail call void @print_array([1200 x double]* %18, [1200 x double]* %17, [1200 x double]* %16)
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
  %indvars.iv.next10.1 = add nuw nsw i64 %indvars.iv9, 2
  %33 = trunc i64 %indvars.iv.next10.1 to i32
  %34 = sitofp i32 %33 to double
  %35 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next10.1
  store double %34, double* %35, align 8
  %indvars.iv.next10.2 = add nuw nsw i64 %indvars.iv9, 3
  %36 = trunc i64 %indvars.iv.next10.2 to i32
  %37 = sitofp i32 %36 to double
  %38 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next10.2
  store double %37, double* %38, align 8
  %indvars.iv.next10.3 = add nuw nsw i64 %indvars.iv9, 4
  %39 = trunc i64 %indvars.iv.next10.3 to i32
  %40 = sitofp i32 %39 to double
  %41 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next10.3
  store double %40, double* %41, align 8
  %exitcond12.4 = icmp eq i64 %indvars.iv.next10.3, 499
  %indvars.iv.next10.4 = add nuw nsw i64 %indvars.iv9, 5
  br i1 %exitcond12.4, label %.preheader.us.preheader, label %.lr.ph4

.preheader.us.preheader:                          ; preds = %.lr.ph4
  br label %.preheader.us

._crit_edge2:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_fdtd_2d([1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #0 {
.preheader6.lr.ph:
  %scevgep97 = getelementptr [1200 x double], [1200 x double]* %1, i64 1, i64 0
  %4 = bitcast double* %scevgep97 to i8*
  %5 = ptrtoint double* %3 to i64
  %6 = bitcast [1200 x double]* %1 to i8*
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge12, %.preheader6.lr.ph
  %indvars.iv41 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next42, %._crit_edge12 ]
  %sunkaddr43 = shl i64 %indvars.iv41, 3
  %sunkaddr44 = add i64 %5, %sunkaddr43
  %bc = inttoptr i64 %sunkaddr44 to i8*
  %bc99 = inttoptr i64 %sunkaddr44 to i8*
  %bound0100 = icmp ult i8* %6, %bc99
  %bound1101 = icmp ult i8* %bc, %4
  %memcheck.conflict103 = and i1 %bound0100, %bound1101
  br i1 %memcheck.conflict103, label %scalar.ph94.preheader, label %vector.body92.preheader

vector.body92.preheader:                          ; preds = %.preheader6
  %7 = inttoptr i64 %sunkaddr44 to i64*
  %8 = inttoptr i64 %sunkaddr44 to i64*
  %9 = inttoptr i64 %sunkaddr44 to i64*
  br label %vector.body92

scalar.ph94.preheader:                            ; preds = %.preheader6
  %10 = inttoptr i64 %sunkaddr44 to i64*
  %11 = inttoptr i64 %sunkaddr44 to i64*
  %12 = inttoptr i64 %sunkaddr44 to i64*
  %13 = inttoptr i64 %sunkaddr44 to i64*
  %14 = inttoptr i64 %sunkaddr44 to i64*
  %15 = inttoptr i64 %sunkaddr44 to i64*
  %16 = inttoptr i64 %sunkaddr44 to i64*
  %17 = inttoptr i64 %sunkaddr44 to i64*
  br label %scalar.ph94

vector.body92:                                    ; preds = %vector.body92, %vector.body92.preheader
  %index106 = phi i64 [ 0, %vector.body92.preheader ], [ %index.next107.2, %vector.body92 ]
  %18 = load i64, i64* %7, align 8, !alias.scope !1
  %19 = insertelement <2 x i64> undef, i64 %18, i32 0
  %20 = shufflevector <2 x i64> %19, <2 x i64> undef, <2 x i32> zeroinitializer
  %21 = insertelement <2 x i64> undef, i64 %18, i32 0
  %22 = shufflevector <2 x i64> %21, <2 x i64> undef, <2 x i32> zeroinitializer
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index106
  %24 = bitcast double* %23 to <2 x i64>*
  store <2 x i64> %20, <2 x i64>* %24, align 8, !alias.scope !4, !noalias !1
  %25 = getelementptr double, double* %23, i64 2
  %26 = bitcast double* %25 to <2 x i64>*
  store <2 x i64> %22, <2 x i64>* %26, align 8, !alias.scope !4, !noalias !1
  %index.next107 = add nuw nsw i64 %index106, 4
  %27 = load i64, i64* %8, align 8, !alias.scope !1
  %28 = insertelement <2 x i64> undef, i64 %27, i32 0
  %29 = shufflevector <2 x i64> %28, <2 x i64> undef, <2 x i32> zeroinitializer
  %30 = insertelement <2 x i64> undef, i64 %27, i32 0
  %31 = shufflevector <2 x i64> %30, <2 x i64> undef, <2 x i32> zeroinitializer
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index.next107
  %33 = bitcast double* %32 to <2 x i64>*
  store <2 x i64> %29, <2 x i64>* %33, align 8, !alias.scope !4, !noalias !1
  %34 = getelementptr double, double* %32, i64 2
  %35 = bitcast double* %34 to <2 x i64>*
  store <2 x i64> %31, <2 x i64>* %35, align 8, !alias.scope !4, !noalias !1
  %index.next107.1 = add nuw nsw i64 %index106, 8
  %36 = load i64, i64* %9, align 8, !alias.scope !1
  %37 = insertelement <2 x i64> undef, i64 %36, i32 0
  %38 = shufflevector <2 x i64> %37, <2 x i64> undef, <2 x i32> zeroinitializer
  %39 = insertelement <2 x i64> undef, i64 %36, i32 0
  %40 = shufflevector <2 x i64> %39, <2 x i64> undef, <2 x i32> zeroinitializer
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index.next107.1
  %42 = bitcast double* %41 to <2 x i64>*
  store <2 x i64> %38, <2 x i64>* %42, align 8, !alias.scope !4, !noalias !1
  %43 = getelementptr double, double* %41, i64 2
  %44 = bitcast double* %43 to <2 x i64>*
  store <2 x i64> %40, <2 x i64>* %44, align 8, !alias.scope !4, !noalias !1
  %index.next107.2 = add nuw nsw i64 %index106, 12
  %45 = icmp eq i64 %index.next107.2, 1200
  br i1 %45, label %.preheader2.us.preheader.loopexit115, label %vector.body92, !llvm.loop !6

.preheader2.us.preheader.loopexit:                ; preds = %scalar.ph94
  br label %.preheader2.us.preheader

.preheader2.us.preheader.loopexit115:             ; preds = %vector.body92
  br label %.preheader2.us.preheader

.preheader2.us.preheader:                         ; preds = %.preheader2.us.preheader.loopexit115, %.preheader2.us.preheader.loopexit
  br label %.preheader2.us

.preheader2.us:                                   ; preds = %._crit_edge.us, %.preheader2.us.preheader
  %indvar = phi i64 [ %indvar.next, %._crit_edge.us ], [ 0, %.preheader2.us.preheader ]
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %._crit_edge.us ], [ 1, %.preheader2.us.preheader ]
  %46 = add nuw nsw i64 %indvar, 1
  %scevgep63 = getelementptr [1200 x double], [1200 x double]* %1, i64 %46, i64 0
  %47 = add nuw nsw i64 %indvar, 2
  %scevgep65 = getelementptr [1200 x double], [1200 x double]* %1, i64 %47, i64 0
  %scevgep68 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvar, i64 0
  %scevgep70 = getelementptr [1200 x double], [1200 x double]* %2, i64 %47, i64 0
  %48 = add nsw i64 %indvars.iv25, -1
  %bound072 = icmp ult double* %scevgep63, %scevgep70
  %bound173 = icmp ult double* %scevgep68, %scevgep65
  %memcheck.conflict75 = and i1 %bound072, %bound173
  br i1 %memcheck.conflict75, label %scalar.ph60.preheader, label %vector.body58.preheader

vector.body58.preheader:                          ; preds = %.preheader2.us
  br label %vector.body58

scalar.ph60.preheader:                            ; preds = %.preheader2.us
  br label %scalar.ph60

vector.body58:                                    ; preds = %vector.body58.preheader, %vector.body58
  %index78 = phi i64 [ %index.next79, %vector.body58 ], [ 0, %vector.body58.preheader ]
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv25, i64 %index78
  %50 = bitcast double* %49 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %50, align 8, !alias.scope !9, !noalias !12
  %51 = getelementptr double, double* %49, i64 2
  %52 = bitcast double* %51 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %52, align 8, !alias.scope !9, !noalias !12
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv25, i64 %index78
  %54 = bitcast double* %53 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %54, align 8, !alias.scope !12
  %55 = getelementptr double, double* %53, i64 2
  %56 = bitcast double* %55 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %56, align 8, !alias.scope !12
  %57 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %48, i64 %index78
  %58 = bitcast double* %57 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %58, align 8, !alias.scope !12
  %59 = getelementptr double, double* %57, i64 2
  %60 = bitcast double* %59 to <2 x double>*
  %wide.load91 = load <2 x double>, <2 x double>* %60, align 8, !alias.scope !12
  %61 = fsub <2 x double> %wide.load88, %wide.load90
  %62 = fsub <2 x double> %wide.load89, %wide.load91
  %63 = fmul <2 x double> %61, <double 5.000000e-01, double 5.000000e-01>
  %64 = fmul <2 x double> %62, <double 5.000000e-01, double 5.000000e-01>
  %65 = fsub <2 x double> %wide.load86, %63
  %66 = fsub <2 x double> %wide.load87, %64
  %67 = bitcast double* %49 to <2 x double>*
  store <2 x double> %65, <2 x double>* %67, align 8, !alias.scope !9, !noalias !12
  %68 = bitcast double* %51 to <2 x double>*
  store <2 x double> %66, <2 x double>* %68, align 8, !alias.scope !9, !noalias !12
  %index.next79 = add nuw nsw i64 %index78, 4
  %69 = icmp eq i64 %index.next79, 1200
  br i1 %69, label %._crit_edge.us.loopexit114, label %vector.body58, !llvm.loop !14

scalar.ph60:                                      ; preds = %scalar.ph60, %scalar.ph60.preheader
  %indvars.iv21 = phi i64 [ 0, %scalar.ph60.preheader ], [ %indvars.iv.next22.1, %scalar.ph60 ]
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv21
  %71 = load double, double* %70, align 8
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv25, i64 %indvars.iv21
  %73 = load double, double* %72, align 8
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %48, i64 %indvars.iv21
  %75 = load double, double* %74, align 8
  %76 = fsub double %73, %75
  %77 = fmul double %76, 5.000000e-01
  %78 = fsub double %71, %77
  store double %78, double* %70, align 8
  %indvars.iv.next22 = or i64 %indvars.iv21, 1
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv.next22
  %80 = load double, double* %79, align 8
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv25, i64 %indvars.iv.next22
  %82 = load double, double* %81, align 8
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %48, i64 %indvars.iv.next22
  %84 = load double, double* %83, align 8
  %85 = fsub double %82, %84
  %86 = fmul double %85, 5.000000e-01
  %87 = fsub double %80, %86
  store double %87, double* %79, align 8
  %exitcond24.1 = icmp eq i64 %indvars.iv.next22, 1199
  %indvars.iv.next22.1 = add nuw nsw i64 %indvars.iv21, 2
  br i1 %exitcond24.1, label %._crit_edge.us.loopexit, label %scalar.ph60, !llvm.loop !15

._crit_edge.us.loopexit:                          ; preds = %scalar.ph60
  br label %._crit_edge.us

._crit_edge.us.loopexit114:                       ; preds = %vector.body58
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit114, %._crit_edge.us.loopexit
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond116 = icmp eq i64 %indvar.next, 999
  br i1 %exitcond116, label %.preheader1.us.preheader, label %.preheader2.us

.preheader1.us.preheader:                         ; preds = %._crit_edge.us
  br label %.preheader1.us

scalar.ph94:                                      ; preds = %scalar.ph94, %scalar.ph94.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph94.preheader ], [ %indvars.iv.next.7, %scalar.ph94 ]
  %88 = load i64, i64* %10, align 8
  %89 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv
  %90 = bitcast double* %89 to i64*
  store i64 %88, i64* %90, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %91 = load i64, i64* %11, align 8
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next
  %93 = bitcast double* %92 to i64*
  store i64 %91, i64* %93, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %94 = load i64, i64* %12, align 8
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.1
  %96 = bitcast double* %95 to i64*
  store i64 %94, i64* %96, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %97 = load i64, i64* %13, align 8
  %98 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.2
  %99 = bitcast double* %98 to i64*
  store i64 %97, i64* %99, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %100 = load i64, i64* %14, align 8
  %101 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.3
  %102 = bitcast double* %101 to i64*
  store i64 %100, i64* %102, align 8
  %indvars.iv.next.4 = or i64 %indvars.iv, 5
  %103 = load i64, i64* %15, align 8
  %104 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.4
  %105 = bitcast double* %104 to i64*
  store i64 %103, i64* %105, align 8
  %indvars.iv.next.5 = or i64 %indvars.iv, 6
  %106 = load i64, i64* %16, align 8
  %107 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.5
  %108 = bitcast double* %107 to i64*
  store i64 %106, i64* %108, align 8
  %indvars.iv.next.6 = or i64 %indvars.iv, 7
  %109 = load i64, i64* %17, align 8
  %110 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.6
  %111 = bitcast double* %110 to i64*
  store i64 %109, i64* %111, align 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.6, 1199
  %indvars.iv.next.7 = add nuw nsw i64 %indvars.iv, 8
  br i1 %exitcond.7, label %.preheader2.us.preheader.loopexit, label %scalar.ph94, !llvm.loop !16

.preheader1.us:                                   ; preds = %._crit_edge9.us, %.preheader1.us.preheader
  %indvars.iv32 = phi i64 [ %indvars.iv.next33, %._crit_edge9.us ], [ 0, %.preheader1.us.preheader ]
  %scevgep30 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv32, i64 1
  %112 = add nuw nsw i64 %indvars.iv32, 1
  %scevgep32 = getelementptr [1200 x double], [1200 x double]* %0, i64 %112, i64 0
  %scevgep34 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv32, i64 0
  %scevgep36 = getelementptr [1200 x double], [1200 x double]* %2, i64 %112, i64 0
  %bound038 = icmp ult double* %scevgep30, %scevgep36
  %bound139 = icmp ult double* %scevgep34, %scevgep32
  %memcheck.conflict41 = and i1 %bound038, %bound139
  br i1 %memcheck.conflict41, label %scalar.ph27.preheader, label %vector.body25.preheader

vector.body25.preheader:                          ; preds = %.preheader1.us
  br label %vector.body25

vector.body25:                                    ; preds = %vector.body25.preheader, %vector.body25
  %index44 = phi i64 [ %index.next45, %vector.body25 ], [ 0, %vector.body25.preheader ]
  %offset.idx = or i64 %index44, 1
  %113 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv32, i64 %offset.idx
  %114 = bitcast double* %113 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %114, align 8, !alias.scope !17, !noalias !20
  %115 = getelementptr double, double* %113, i64 2
  %116 = bitcast double* %115 to <2 x double>*
  %wide.load53 = load <2 x double>, <2 x double>* %116, align 8, !alias.scope !17, !noalias !20
  %117 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv32, i64 %offset.idx
  %118 = bitcast double* %117 to <2 x double>*
  %wide.load54 = load <2 x double>, <2 x double>* %118, align 8, !alias.scope !20
  %119 = getelementptr double, double* %117, i64 2
  %120 = bitcast double* %119 to <2 x double>*
  %wide.load55 = load <2 x double>, <2 x double>* %120, align 8, !alias.scope !20
  %121 = add nsw i64 %offset.idx, -1
  %122 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv32, i64 %121
  %123 = bitcast double* %122 to <2 x double>*
  %wide.load56 = load <2 x double>, <2 x double>* %123, align 8, !alias.scope !20
  %124 = getelementptr double, double* %122, i64 2
  %125 = bitcast double* %124 to <2 x double>*
  %wide.load57 = load <2 x double>, <2 x double>* %125, align 8, !alias.scope !20
  %126 = fsub <2 x double> %wide.load54, %wide.load56
  %127 = fsub <2 x double> %wide.load55, %wide.load57
  %128 = fmul <2 x double> %126, <double 5.000000e-01, double 5.000000e-01>
  %129 = fmul <2 x double> %127, <double 5.000000e-01, double 5.000000e-01>
  %130 = fsub <2 x double> %wide.load52, %128
  %131 = fsub <2 x double> %wide.load53, %129
  %132 = bitcast double* %113 to <2 x double>*
  store <2 x double> %130, <2 x double>* %132, align 8, !alias.scope !17, !noalias !20
  %133 = bitcast double* %115 to <2 x double>*
  store <2 x double> %131, <2 x double>* %133, align 8, !alias.scope !17, !noalias !20
  %index.next45 = add nuw nsw i64 %index44, 4
  %134 = icmp eq i64 %index.next45, 1196
  br i1 %134, label %scalar.ph27.preheader.loopexit, label %vector.body25, !llvm.loop !22

scalar.ph27.preheader.loopexit:                   ; preds = %vector.body25
  br label %scalar.ph27.preheader

scalar.ph27.preheader:                            ; preds = %scalar.ph27.preheader.loopexit, %.preheader1.us
  %indvars.iv28.ph = phi i64 [ 1, %.preheader1.us ], [ 1197, %scalar.ph27.preheader.loopexit ]
  br i1 true, label %scalar.ph27.prol.preheader, label %scalar.ph27.prol.loopexit.unr-lcssa

scalar.ph27.prol.preheader:                       ; preds = %scalar.ph27.preheader
  br label %scalar.ph27.prol

scalar.ph27.prol:                                 ; preds = %scalar.ph27.prol.preheader
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv32, i64 %indvars.iv28.ph
  %136 = load double, double* %135, align 8
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv32, i64 %indvars.iv28.ph
  %138 = load double, double* %137, align 8
  %139 = add nsw i64 %indvars.iv28.ph, -1
  %140 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv32, i64 %139
  %141 = load double, double* %140, align 8
  %142 = fsub double %138, %141
  %143 = fmul double %142, 5.000000e-01
  %144 = fsub double %136, %143
  store double %144, double* %135, align 8
  %indvars.iv.next29.prol = add nuw nsw i64 %indvars.iv28.ph, 1
  br label %scalar.ph27.prol.loopexit.unr-lcssa

scalar.ph27.prol.loopexit.unr-lcssa:              ; preds = %scalar.ph27.preheader, %scalar.ph27.prol
  %indvars.iv28.unr.ph = phi i64 [ %indvars.iv.next29.prol, %scalar.ph27.prol ], [ %indvars.iv28.ph, %scalar.ph27.preheader ]
  br label %scalar.ph27.prol.loopexit

scalar.ph27.prol.loopexit:                        ; preds = %scalar.ph27.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge9.us, label %scalar.ph27.preheader.new

scalar.ph27.preheader.new:                        ; preds = %scalar.ph27.prol.loopexit
  br label %scalar.ph27

scalar.ph27:                                      ; preds = %scalar.ph27, %scalar.ph27.preheader.new
  %indvars.iv28 = phi i64 [ %indvars.iv28.unr.ph, %scalar.ph27.preheader.new ], [ %indvars.iv.next29.1, %scalar.ph27 ]
  %145 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv32, i64 %indvars.iv28
  %146 = load double, double* %145, align 8
  %147 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv32, i64 %indvars.iv28
  %148 = load double, double* %147, align 8
  %149 = add nsw i64 %indvars.iv28, -1
  %150 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv32, i64 %149
  %151 = load double, double* %150, align 8
  %152 = fsub double %148, %151
  %153 = fmul double %152, 5.000000e-01
  %154 = fsub double %146, %153
  store double %154, double* %145, align 8
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %155 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv32, i64 %indvars.iv.next29
  %156 = load double, double* %155, align 8
  %157 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv32, i64 %indvars.iv.next29
  %158 = load double, double* %157, align 8
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv32, i64 %indvars.iv28
  %160 = load double, double* %159, align 8
  %161 = fsub double %158, %160
  %162 = fmul double %161, 5.000000e-01
  %163 = fsub double %156, %162
  store double %163, double* %155, align 8
  %exitcond31.1 = icmp eq i64 %indvars.iv.next29, 1199
  %indvars.iv.next29.1 = add nsw i64 %indvars.iv28, 2
  br i1 %exitcond31.1, label %._crit_edge9.us.unr-lcssa, label %scalar.ph27, !llvm.loop !23

._crit_edge9.us.unr-lcssa:                        ; preds = %scalar.ph27
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %scalar.ph27.prol.loopexit, %._crit_edge9.us.unr-lcssa
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond117 = icmp eq i64 %indvars.iv.next33, 1000
  br i1 %exitcond117, label %.preheader.us.preheader, label %.preheader1.us

.preheader.us.preheader:                          ; preds = %._crit_edge9.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge11.us, %.preheader.us.preheader
  %indvars.iv39 = phi i64 [ %indvars.iv.next40, %._crit_edge11.us ], [ 0, %.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 0
  %scevgep2 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 1199
  %scevgep4 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv39, i64 0
  %164 = add nuw nsw i64 %indvars.iv39, 1
  %scevgep6 = getelementptr [1200 x double], [1200 x double]* %0, i64 %164, i64 0
  %scevgep8 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv39, i64 0
  %scevgep10 = getelementptr [1200 x double], [1200 x double]* %1, i64 %164, i64 1199
  %indvars.iv.next40 = add nuw nsw i64 %indvars.iv39, 1
  %bound0 = icmp ult double* %scevgep, %scevgep6
  %bound1 = icmp ult double* %scevgep4, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bound012 = icmp ult double* %scevgep, %scevgep10
  %bound113 = icmp ult double* %scevgep8, %scevgep2
  %found.conflict14 = and i1 %bound012, %bound113
  %conflict.rdx = or i1 %found.conflict, %found.conflict14
  br i1 %conflict.rdx, label %._crit_edge19.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %165 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 %index
  %166 = bitcast double* %165 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %166, align 8, !alias.scope !24, !noalias !27
  %167 = getelementptr double, double* %165, i64 2
  %168 = bitcast double* %167 to <2 x double>*
  %wide.load16 = load <2 x double>, <2 x double>* %168, align 8, !alias.scope !24, !noalias !27
  %169 = or i64 %index, 1
  %170 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv39, i64 %169
  %171 = bitcast double* %170 to <2 x double>*
  %wide.load17 = load <2 x double>, <2 x double>* %171, align 8, !alias.scope !30
  %172 = getelementptr double, double* %170, i64 2
  %173 = bitcast double* %172 to <2 x double>*
  %wide.load18 = load <2 x double>, <2 x double>* %173, align 8, !alias.scope !30
  %174 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv39, i64 %index
  %175 = bitcast double* %174 to <2 x double>*
  %wide.load19 = load <2 x double>, <2 x double>* %175, align 8, !alias.scope !30
  %176 = getelementptr double, double* %174, i64 2
  %177 = bitcast double* %176 to <2 x double>*
  %wide.load20 = load <2 x double>, <2 x double>* %177, align 8, !alias.scope !30
  %178 = fsub <2 x double> %wide.load17, %wide.load19
  %179 = fsub <2 x double> %wide.load18, %wide.load20
  %180 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next40, i64 %index
  %181 = bitcast double* %180 to <2 x double>*
  %wide.load21 = load <2 x double>, <2 x double>* %181, align 8, !alias.scope !31
  %182 = getelementptr double, double* %180, i64 2
  %183 = bitcast double* %182 to <2 x double>*
  %wide.load22 = load <2 x double>, <2 x double>* %183, align 8, !alias.scope !31
  %184 = fadd <2 x double> %178, %wide.load21
  %185 = fadd <2 x double> %179, %wide.load22
  %186 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv39, i64 %index
  %187 = bitcast double* %186 to <2 x double>*
  %wide.load23 = load <2 x double>, <2 x double>* %187, align 8, !alias.scope !31
  %188 = getelementptr double, double* %186, i64 2
  %189 = bitcast double* %188 to <2 x double>*
  %wide.load24 = load <2 x double>, <2 x double>* %189, align 8, !alias.scope !31
  %190 = fsub <2 x double> %184, %wide.load23
  %191 = fsub <2 x double> %185, %wide.load24
  %192 = fmul <2 x double> %190, <double 7.000000e-01, double 7.000000e-01>
  %193 = fmul <2 x double> %191, <double 7.000000e-01, double 7.000000e-01>
  %194 = fsub <2 x double> %wide.load, %192
  %195 = fsub <2 x double> %wide.load16, %193
  %196 = bitcast double* %165 to <2 x double>*
  store <2 x double> %194, <2 x double>* %196, align 8, !alias.scope !24, !noalias !27
  %197 = bitcast double* %167 to <2 x double>*
  store <2 x double> %195, <2 x double>* %197, align 8, !alias.scope !24, !noalias !27
  %index.next = add nuw nsw i64 %index, 4
  %198 = icmp eq i64 %index.next, 1196
  br i1 %198, label %._crit_edge19.preheader.loopexit, label %vector.body, !llvm.loop !32

._crit_edge19.preheader.loopexit:                 ; preds = %vector.body
  br label %._crit_edge19.preheader

._crit_edge19.preheader:                          ; preds = %._crit_edge19.preheader.loopexit, %.preheader.us
  %indvars.iv35.ph = phi i64 [ 0, %.preheader.us ], [ 1196, %._crit_edge19.preheader.loopexit ]
  br label %._crit_edge19

._crit_edge19:                                    ; preds = %._crit_edge19.preheader, %._crit_edge19
  %indvars.iv35 = phi i64 [ %indvars.iv.next36, %._crit_edge19 ], [ %indvars.iv35.ph, %._crit_edge19.preheader ]
  %199 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv39, i64 %indvars.iv35
  %200 = load double, double* %199, align 8
  %indvars.iv.next36 = add nuw nsw i64 %indvars.iv35, 1
  %201 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv39, i64 %indvars.iv.next36
  %202 = load double, double* %201, align 8
  %203 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv39, i64 %indvars.iv35
  %204 = load double, double* %203, align 8
  %205 = fsub double %202, %204
  %206 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next40, i64 %indvars.iv35
  %207 = load double, double* %206, align 8
  %208 = fadd double %205, %207
  %209 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv39, i64 %indvars.iv35
  %210 = load double, double* %209, align 8
  %211 = fsub double %208, %210
  %212 = fmul double %211, 7.000000e-01
  %213 = fsub double %200, %212
  store double %213, double* %199, align 8
  %exitcond38 = icmp eq i64 %indvars.iv35, 1198
  br i1 %exitcond38, label %._crit_edge11.us, label %._crit_edge19, !llvm.loop !33

._crit_edge11.us:                                 ; preds = %._crit_edge19
  %exitcond118 = icmp eq i64 %indvars.iv.next40, 999
  br i1 %exitcond118, label %._crit_edge12, label %.preheader.us

._crit_edge12:                                    ; preds = %._crit_edge11.us
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond119 = icmp eq i64 %indvars.iv.next42, 500
  br i1 %exitcond119, label %._crit_edge13, label %.preheader6

._crit_edge13:                                    ; preds = %._crit_edge12
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]*, [1200 x double]*, [1200 x double]*) #0 {
.preheader10.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #4
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader10.us

.preheader10.us:                                  ; preds = %._crit_edge17.us, %.preheader10.us.preheader
  %indvars.iv31 = phi i64 [ 0, %.preheader10.us.preheader ], [ %indvars.iv.next32, %._crit_edge17.us ]
  %7 = mul nuw nsw i64 %indvars.iv31, 1000
  br label %._crit_edge.us._crit_edge

._crit_edge.us._crit_edge:                        ; preds = %._crit_edge.us, %.preheader10.us
  %indvars.iv29 = phi i64 [ 0, %.preheader10.us ], [ %indvars.iv.next30, %._crit_edge.us ]
  %8 = add nuw nsw i64 %indvars.iv29, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge.us

; <label>:12:                                     ; preds = %._crit_edge.us._crit_edge
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc8.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #4
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us._crit_edge, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv31, i64 %indvars.iv29
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next30, 1200
  br i1 %exitcond4, label %._crit_edge17.us, label %._crit_edge.us._crit_edge

._crit_edge17.us:                                 ; preds = %._crit_edge.us
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next32, 1000
  br i1 %exitcond5, label %._crit_edge18, label %.preheader10.us

._crit_edge18:                                    ; preds = %._crit_edge17.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #4
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  br label %.preheader9.us

.preheader9.us:                                   ; preds = %._crit_edge14.us, %._crit_edge18
  %indvars.iv26 = phi i64 [ 0, %._crit_edge18 ], [ %indvars.iv.next27, %._crit_edge14.us ]
  %24 = mul nuw nsw i64 %indvars.iv26, 1000
  br label %._crit_edge1.us._crit_edge

._crit_edge1.us._crit_edge:                       ; preds = %._crit_edge1.us, %.preheader9.us
  %indvars.iv24 = phi i64 [ 0, %.preheader9.us ], [ %indvars.iv.next25, %._crit_edge1.us ]
  %25 = add nuw nsw i64 %indvars.iv24, %24
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 20
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %._crit_edge1.us

; <label>:29:                                     ; preds = %._crit_edge1.us._crit_edge
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc5.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %30) #4
  br label %._crit_edge1.us

._crit_edge1.us:                                  ; preds = %._crit_edge1.us._crit_edge, %29
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv26, i64 %indvars.iv24
  %33 = load double, double* %32, align 8
  %34 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %33) #5
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next25, 1200
  br i1 %exitcond2, label %._crit_edge14.us, label %._crit_edge1.us._crit_edge

._crit_edge14.us:                                 ; preds = %._crit_edge1.us
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next27, 1000
  br i1 %exitcond3, label %._crit_edge15, label %.preheader9.us

._crit_edge15:                                    ; preds = %._crit_edge14.us
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge11.us, %._crit_edge15
  %indvars.iv22 = phi i64 [ 0, %._crit_edge15 ], [ %indvars.iv.next23, %._crit_edge11.us ]
  %39 = mul nuw nsw i64 %indvars.iv22, 1000
  br label %._crit_edge2.us._crit_edge

._crit_edge2.us._crit_edge:                       ; preds = %._crit_edge2.us, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge2.us ]
  %40 = add nuw nsw i64 %indvars.iv, %39
  %41 = trunc i64 %40 to i32
  %42 = srem i32 %41, 20
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %44, label %._crit_edge2.us

; <label>:44:                                     ; preds = %._crit_edge2.us._crit_edge
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %45) #4
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %._crit_edge2.us._crit_edge, %44
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv22, i64 %indvars.iv
  %48 = load double, double* %47, align 8
  %49 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %48) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge11.us, label %._crit_edge2.us._crit_edge

._crit_edge11.us:                                 ; preds = %._crit_edge2.us
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next23, 1000
  br i1 %exitcond1, label %._crit_edge12, label %.preheader.us

._crit_edge12:                                    ; preds = %._crit_edge11.us
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
