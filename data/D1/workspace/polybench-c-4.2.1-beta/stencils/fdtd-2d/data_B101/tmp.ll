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
  %3 = call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %4 = call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %5 = call i8* @polybench_alloc_data(i64 1200000, i32 8) #3
  %6 = call i8* @polybench_alloc_data(i64 500, i32 8) #3
  %7 = bitcast i8* %3 to [1200 x double]*
  %8 = bitcast i8* %4 to [1200 x double]*
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  call fastcc void @init_array([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  call void (...) @polybench_timer_start() #3
  call fastcc void @kernel_fdtd_2d([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
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
  call fastcc void @print_array([1200 x double]* %18, [1200 x double]* %17, [1200 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  call void @free(i8* %3) #3
  call void @free(i8* %4) #3
  call void @free(i8* %5) #3
  call void @free(i8* %6) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([1200 x double]*, [1200 x double]*, [1200 x double]*, double*) unnamed_addr #0 {
.lr.ph10:
  br label %._crit_edge17

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %4 = trunc i64 %indvars.iv18 to i32
  %5 = sitofp i32 %4 to double
  %6 = insertelement <2 x double> undef, double %5, i32 0
  %7 = shufflevector <2 x double> %6, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %8 = trunc i64 %indvars.iv.next to i32
  %9 = sitofp i32 %8 to double
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv18, i64 %indvars.iv
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
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv18, i64 %indvars.iv
  store double %19, double* %20, align 8
  %21 = add nuw nsw i64 %indvars.iv, 3
  %22 = trunc i64 %21 to i32
  %23 = sitofp i32 %22 to double
  %24 = fmul double %5, %23
  %25 = fdiv double %24, 1.000000e+03
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv18, i64 %indvars.iv
  store double %25, double* %26, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next19, 1000
  br i1 %exitcond1, label %.preheader3._crit_edge, label %.preheader.us

._crit_edge17:                                    ; preds = %._crit_edge17, %.lr.ph10
  %indvars.iv20 = phi i64 [ 0, %.lr.ph10 ], [ %indvars.iv.next21.4, %._crit_edge17 ]
  %27 = trunc i64 %indvars.iv20 to i32
  %28 = sitofp i32 %27 to double
  %29 = getelementptr inbounds double, double* %3, i64 %indvars.iv20
  store double %28, double* %29, align 8
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv20, 1
  %30 = trunc i64 %indvars.iv.next21 to i32
  %31 = sitofp i32 %30 to double
  %32 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next21
  store double %31, double* %32, align 8
  %indvars.iv.next21.1 = add nsw i64 %indvars.iv20, 2
  %33 = trunc i64 %indvars.iv.next21.1 to i32
  %34 = sitofp i32 %33 to double
  %35 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next21.1
  store double %34, double* %35, align 8
  %indvars.iv.next21.2 = add nsw i64 %indvars.iv20, 3
  %36 = trunc i64 %indvars.iv.next21.2 to i32
  %37 = sitofp i32 %36 to double
  %38 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next21.2
  store double %37, double* %38, align 8
  %indvars.iv.next21.3 = add nsw i64 %indvars.iv20, 4
  %39 = trunc i64 %indvars.iv.next21.3 to i32
  %40 = sitofp i32 %39 to double
  %41 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next21.3
  store double %40, double* %41, align 8
  %indvars.iv.next21.4 = add nsw i64 %indvars.iv20, 5
  %exitcond2.4 = icmp eq i64 %indvars.iv.next21.4, 500
  br i1 %exitcond2.4, label %.preheader.us.preheader, label %._crit_edge17

.preheader.us.preheader:                          ; preds = %._crit_edge17
  br label %.preheader.us

.preheader3._crit_edge:                           ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_fdtd_2d([1200 x double]*, [1200 x double]*, [1200 x double]*, double*) unnamed_addr #0 {
.preheader13.lr.ph:
  %scevgep174 = getelementptr [1200 x double], [1200 x double]* %1, i64 1, i64 0
  br label %.preheader13

.preheader13:                                     ; preds = %._crit_edge33, %.preheader13.lr.ph
  %indvars.iv70 = phi i64 [ 0, %.preheader13.lr.ph ], [ %indvars.iv.next71, %._crit_edge33 ]
  %4 = getelementptr inbounds double, double* %3, i64 %indvars.iv70
  %5 = bitcast double* %4 to [1200 x double]*
  %bound0177 = icmp ugt [1200 x double]* %5, %1
  %bound1178 = icmp ult double* %4, %scevgep174
  %memcheck.conflict180 = and i1 %bound0177, %bound1178
  br i1 %memcheck.conflict180, label %scalar.ph171.preheader, label %vector.body169.preheader

vector.body169.preheader:                         ; preds = %.preheader13
  br label %vector.body169

scalar.ph171.preheader:                           ; preds = %.preheader13
  br label %scalar.ph171

vector.body169:                                   ; preds = %vector.body169, %vector.body169.preheader
  %index183 = phi i64 [ 0, %vector.body169.preheader ], [ %index.next184.2, %vector.body169 ]
  %6 = bitcast double* %4 to i64*
  %7 = bitcast double* %4 to i64*
  %8 = bitcast double* %4 to i64*
  %9 = load i64, i64* %8, align 8, !alias.scope !1
  %10 = insertelement <2 x i64> undef, i64 %9, i32 0
  %11 = shufflevector <2 x i64> %10, <2 x i64> undef, <2 x i32> zeroinitializer
  %12 = insertelement <2 x i64> undef, i64 %9, i32 0
  %13 = shufflevector <2 x i64> %12, <2 x i64> undef, <2 x i32> zeroinitializer
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index183
  %15 = bitcast double* %14 to <2 x i64>*
  store <2 x i64> %11, <2 x i64>* %15, align 8, !alias.scope !4, !noalias !1
  %16 = getelementptr double, double* %14, i64 2
  %17 = bitcast double* %16 to <2 x i64>*
  store <2 x i64> %13, <2 x i64>* %17, align 8, !alias.scope !4, !noalias !1
  %index.next184 = add nuw nsw i64 %index183, 4
  %18 = load i64, i64* %7, align 8, !alias.scope !1
  %19 = insertelement <2 x i64> undef, i64 %18, i32 0
  %20 = shufflevector <2 x i64> %19, <2 x i64> undef, <2 x i32> zeroinitializer
  %21 = insertelement <2 x i64> undef, i64 %18, i32 0
  %22 = shufflevector <2 x i64> %21, <2 x i64> undef, <2 x i32> zeroinitializer
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index.next184
  %24 = bitcast double* %23 to <2 x i64>*
  store <2 x i64> %20, <2 x i64>* %24, align 8, !alias.scope !4, !noalias !1
  %25 = getelementptr double, double* %23, i64 2
  %26 = bitcast double* %25 to <2 x i64>*
  store <2 x i64> %22, <2 x i64>* %26, align 8, !alias.scope !4, !noalias !1
  %index.next184.1 = add nsw i64 %index183, 8
  %27 = load i64, i64* %6, align 8, !alias.scope !1
  %28 = insertelement <2 x i64> undef, i64 %27, i32 0
  %29 = shufflevector <2 x i64> %28, <2 x i64> undef, <2 x i32> zeroinitializer
  %30 = insertelement <2 x i64> undef, i64 %27, i32 0
  %31 = shufflevector <2 x i64> %30, <2 x i64> undef, <2 x i32> zeroinitializer
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index.next184.1
  %33 = bitcast double* %32 to <2 x i64>*
  store <2 x i64> %29, <2 x i64>* %33, align 8, !alias.scope !4, !noalias !1
  %34 = getelementptr double, double* %32, i64 2
  %35 = bitcast double* %34 to <2 x i64>*
  store <2 x i64> %31, <2 x i64>* %35, align 8, !alias.scope !4, !noalias !1
  %index.next184.2 = add nsw i64 %index183, 12
  %36 = icmp eq i64 %index.next184.2, 1200
  br i1 %36, label %.preheader9.us.preheader.loopexit9, label %vector.body169, !llvm.loop !6

.preheader9.us.preheader.loopexit:                ; preds = %scalar.ph171
  br label %.preheader9.us.preheader

.preheader9.us.preheader.loopexit9:               ; preds = %vector.body169
  br label %.preheader9.us.preheader

.preheader9.us.preheader:                         ; preds = %.preheader9.us.preheader.loopexit9, %.preheader9.us.preheader.loopexit
  br label %.preheader9.us

.preheader9.us:                                   ; preds = %._crit_edge.us, %.preheader9.us.preheader
  %indvar = phi i64 [ %indvar.next, %._crit_edge.us ], [ 0, %.preheader9.us.preheader ]
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %._crit_edge.us ], [ 1, %.preheader9.us.preheader ]
  %37 = add nuw nsw i64 %indvar, 1
  %scevgep141 = getelementptr [1200 x double], [1200 x double]* %1, i64 %37, i64 0
  %38 = add nuw nsw i64 %indvar, 2
  %scevgep143 = getelementptr [1200 x double], [1200 x double]* %1, i64 %38, i64 0
  %scevgep145 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvar, i64 0
  %scevgep147 = getelementptr [1200 x double], [1200 x double]* %2, i64 %38, i64 0
  %39 = add nsw i64 %indvars.iv57, -1
  %bound0149 = icmp ult double* %scevgep141, %scevgep147
  %bound1150 = icmp ult double* %scevgep145, %scevgep143
  %memcheck.conflict152 = and i1 %bound0149, %bound1150
  br i1 %memcheck.conflict152, label %._crit_edge50.preheader, label %vector.body136.preheader

vector.body136.preheader:                         ; preds = %.preheader9.us
  br label %vector.body136

._crit_edge50.preheader:                          ; preds = %.preheader9.us
  br label %._crit_edge50

vector.body136:                                   ; preds = %vector.body136.preheader, %vector.body136
  %index155 = phi i64 [ %index.next156, %vector.body136 ], [ 0, %vector.body136.preheader ]
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv57, i64 %index155
  %41 = bitcast double* %40 to <2 x double>*
  %wide.load163 = load <2 x double>, <2 x double>* %41, align 8, !alias.scope !9, !noalias !12
  %42 = getelementptr double, double* %40, i64 2
  %43 = bitcast double* %42 to <2 x double>*
  %wide.load164 = load <2 x double>, <2 x double>* %43, align 8, !alias.scope !9, !noalias !12
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv57, i64 %index155
  %45 = bitcast double* %44 to <2 x double>*
  %wide.load165 = load <2 x double>, <2 x double>* %45, align 8, !alias.scope !12
  %46 = getelementptr double, double* %44, i64 2
  %47 = bitcast double* %46 to <2 x double>*
  %wide.load166 = load <2 x double>, <2 x double>* %47, align 8, !alias.scope !12
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %39, i64 %index155
  %49 = bitcast double* %48 to <2 x double>*
  %wide.load167 = load <2 x double>, <2 x double>* %49, align 8, !alias.scope !12
  %50 = getelementptr double, double* %48, i64 2
  %51 = bitcast double* %50 to <2 x double>*
  %wide.load168 = load <2 x double>, <2 x double>* %51, align 8, !alias.scope !12
  %52 = fsub <2 x double> %wide.load165, %wide.load167
  %53 = fsub <2 x double> %wide.load166, %wide.load168
  %54 = fmul <2 x double> %52, <double 5.000000e-01, double 5.000000e-01>
  %55 = fmul <2 x double> %53, <double 5.000000e-01, double 5.000000e-01>
  %56 = fsub <2 x double> %wide.load163, %54
  %57 = fsub <2 x double> %wide.load164, %55
  %58 = bitcast double* %40 to <2 x double>*
  store <2 x double> %56, <2 x double>* %58, align 8, !alias.scope !9, !noalias !12
  %59 = bitcast double* %42 to <2 x double>*
  store <2 x double> %57, <2 x double>* %59, align 8, !alias.scope !9, !noalias !12
  %index.next156 = add nuw nsw i64 %index155, 4
  %60 = icmp eq i64 %index.next156, 1200
  br i1 %60, label %._crit_edge.us.loopexit8, label %vector.body136, !llvm.loop !14

._crit_edge50:                                    ; preds = %._crit_edge50, %._crit_edge50.preheader
  %indvars.iv55 = phi i64 [ 0, %._crit_edge50.preheader ], [ %indvars.iv.next56.1, %._crit_edge50 ]
  %61 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv57, i64 %indvars.iv55
  %62 = load double, double* %61, align 8
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv57, i64 %indvars.iv55
  %64 = load double, double* %63, align 8
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %39, i64 %indvars.iv55
  %66 = load double, double* %65, align 8
  %67 = fsub double %64, %66
  %68 = fmul double %67, 5.000000e-01
  %69 = fsub double %62, %68
  store double %69, double* %61, align 8
  %indvars.iv.next56 = or i64 %indvars.iv55, 1
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv57, i64 %indvars.iv.next56
  %71 = load double, double* %70, align 8
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv57, i64 %indvars.iv.next56
  %73 = load double, double* %72, align 8
  %74 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %39, i64 %indvars.iv.next56
  %75 = load double, double* %74, align 8
  %76 = fsub double %73, %75
  %77 = fmul double %76, 5.000000e-01
  %78 = fsub double %71, %77
  store double %78, double* %70, align 8
  %indvars.iv.next56.1 = add nsw i64 %indvars.iv55, 2
  %exitcond3.1 = icmp eq i64 %indvars.iv.next56.1, 1200
  br i1 %exitcond3.1, label %._crit_edge.us.loopexit, label %._crit_edge50, !llvm.loop !15

._crit_edge.us.loopexit:                          ; preds = %._crit_edge50
  br label %._crit_edge.us

._crit_edge.us.loopexit8:                         ; preds = %vector.body136
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit8, %._crit_edge.us.loopexit
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond4 = icmp eq i64 %indvar.next, 999
  br i1 %exitcond4, label %.preheader8.us.preheader, label %.preheader9.us

.preheader8.us.preheader:                         ; preds = %._crit_edge.us
  br label %.preheader8.us

scalar.ph171:                                     ; preds = %scalar.ph171, %scalar.ph171.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph171.preheader ], [ %indvars.iv.next.7, %scalar.ph171 ]
  %79 = bitcast double* %4 to i64*
  %80 = bitcast double* %4 to i64*
  %81 = bitcast double* %4 to i64*
  %82 = bitcast double* %4 to i64*
  %83 = bitcast double* %4 to i64*
  %84 = bitcast double* %4 to i64*
  %85 = bitcast double* %4 to i64*
  %86 = bitcast double* %4 to i64*
  %87 = load i64, i64* %86, align 8
  %88 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv
  %89 = bitcast double* %88 to i64*
  store i64 %87, i64* %89, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %90 = load i64, i64* %85, align 8
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next
  %92 = bitcast double* %91 to i64*
  store i64 %90, i64* %92, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %93 = load i64, i64* %84, align 8
  %94 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.1
  %95 = bitcast double* %94 to i64*
  store i64 %93, i64* %95, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %96 = load i64, i64* %83, align 8
  %97 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.2
  %98 = bitcast double* %97 to i64*
  store i64 %96, i64* %98, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %99 = load i64, i64* %82, align 8
  %100 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.3
  %101 = bitcast double* %100 to i64*
  store i64 %99, i64* %101, align 8
  %indvars.iv.next.4 = or i64 %indvars.iv, 5
  %102 = load i64, i64* %81, align 8
  %103 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.4
  %104 = bitcast double* %103 to i64*
  store i64 %102, i64* %104, align 8
  %indvars.iv.next.5 = or i64 %indvars.iv, 6
  %105 = load i64, i64* %80, align 8
  %106 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.5
  %107 = bitcast double* %106 to i64*
  store i64 %105, i64* %107, align 8
  %indvars.iv.next.6 = or i64 %indvars.iv, 7
  %108 = load i64, i64* %79, align 8
  %109 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.6
  %110 = bitcast double* %109 to i64*
  store i64 %108, i64* %110, align 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.6, 1199
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  br i1 %exitcond.7, label %.preheader9.us.preheader.loopexit, label %scalar.ph171, !llvm.loop !16

.preheader8.us:                                   ; preds = %._crit_edge22.us, %.preheader8.us.preheader
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %._crit_edge22.us ], [ 0, %.preheader8.us.preheader ]
  %scevgep108 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv63, i64 1
  %111 = add nuw nsw i64 %indvars.iv63, 1
  %scevgep110 = getelementptr [1200 x double], [1200 x double]* %0, i64 %111, i64 0
  %scevgep112 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv63, i64 0
  %scevgep114 = getelementptr [1200 x double], [1200 x double]* %2, i64 %111, i64 0
  %bound0116 = icmp ult double* %scevgep108, %scevgep114
  %bound1117 = icmp ult double* %scevgep112, %scevgep110
  %memcheck.conflict119 = and i1 %bound0116, %bound1117
  br i1 %memcheck.conflict119, label %scalar.ph105.preheader.new, label %vector.body103.preheader

vector.body103.preheader:                         ; preds = %.preheader8.us
  br label %vector.body103

vector.body103:                                   ; preds = %vector.body103.preheader, %vector.body103
  %index122 = phi i64 [ %index.next123, %vector.body103 ], [ 0, %vector.body103.preheader ]
  %offset.idx = or i64 %index122, 1
  %112 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv63, i64 %offset.idx
  %113 = bitcast double* %112 to <2 x double>*
  %wide.load130 = load <2 x double>, <2 x double>* %113, align 8, !alias.scope !17, !noalias !20
  %114 = getelementptr double, double* %112, i64 2
  %115 = bitcast double* %114 to <2 x double>*
  %wide.load131 = load <2 x double>, <2 x double>* %115, align 8, !alias.scope !17, !noalias !20
  %116 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv63, i64 %offset.idx
  %117 = bitcast double* %116 to <2 x double>*
  %wide.load132 = load <2 x double>, <2 x double>* %117, align 8, !alias.scope !20
  %118 = getelementptr double, double* %116, i64 2
  %119 = bitcast double* %118 to <2 x double>*
  %wide.load133 = load <2 x double>, <2 x double>* %119, align 8, !alias.scope !20
  %120 = add nsw i64 %offset.idx, -1
  %121 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv63, i64 %120
  %122 = bitcast double* %121 to <2 x double>*
  %wide.load134 = load <2 x double>, <2 x double>* %122, align 8, !alias.scope !20
  %123 = getelementptr double, double* %121, i64 2
  %124 = bitcast double* %123 to <2 x double>*
  %wide.load135 = load <2 x double>, <2 x double>* %124, align 8, !alias.scope !20
  %125 = fsub <2 x double> %wide.load132, %wide.load134
  %126 = fsub <2 x double> %wide.load133, %wide.load135
  %127 = fmul <2 x double> %125, <double 5.000000e-01, double 5.000000e-01>
  %128 = fmul <2 x double> %126, <double 5.000000e-01, double 5.000000e-01>
  %129 = fsub <2 x double> %wide.load130, %127
  %130 = fsub <2 x double> %wide.load131, %128
  %131 = bitcast double* %112 to <2 x double>*
  store <2 x double> %129, <2 x double>* %131, align 8, !alias.scope !17, !noalias !20
  %132 = bitcast double* %114 to <2 x double>*
  store <2 x double> %130, <2 x double>* %132, align 8, !alias.scope !17, !noalias !20
  %index.next123 = add nuw nsw i64 %index122, 4
  %133 = icmp eq i64 %index.next123, 1196
  br i1 %133, label %scalar.ph105.preheader.new.loopexit, label %vector.body103, !llvm.loop !22

scalar.ph105.preheader.new.loopexit:              ; preds = %vector.body103
  br label %scalar.ph105.preheader.new

scalar.ph105.preheader.new:                       ; preds = %scalar.ph105.preheader.new.loopexit, %.preheader8.us
  %indvars.iv59.ph = phi i64 [ 1, %.preheader8.us ], [ 1197, %scalar.ph105.preheader.new.loopexit ]
  %134 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv63, i64 %indvars.iv59.ph
  %135 = load double, double* %134, align 8
  %136 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv63, i64 %indvars.iv59.ph
  %137 = load double, double* %136, align 8
  %138 = add nsw i64 %indvars.iv59.ph, -1
  %139 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv63, i64 %138
  %140 = load double, double* %139, align 8
  %141 = fsub double %137, %140
  %142 = fmul double %141, 5.000000e-01
  %143 = fsub double %135, %142
  store double %143, double* %134, align 8
  %indvars.iv.next60.prol = add nuw nsw i64 %indvars.iv59.ph, 1
  br label %scalar.ph105

scalar.ph105:                                     ; preds = %scalar.ph105, %scalar.ph105.preheader.new
  %indvars.iv59 = phi i64 [ %indvars.iv.next60.prol, %scalar.ph105.preheader.new ], [ %indvars.iv.next60.1, %scalar.ph105 ]
  %144 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv63, i64 %indvars.iv59
  %145 = load double, double* %144, align 8
  %146 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv63, i64 %indvars.iv59
  %147 = load double, double* %146, align 8
  %148 = add nsw i64 %indvars.iv59, -1
  %149 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv63, i64 %148
  %150 = load double, double* %149, align 8
  %151 = fsub double %147, %150
  %152 = fmul double %151, 5.000000e-01
  %153 = fsub double %145, %152
  store double %153, double* %144, align 8
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %154 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv63, i64 %indvars.iv.next60
  %155 = load double, double* %154, align 8
  %156 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv63, i64 %indvars.iv.next60
  %157 = load double, double* %156, align 8
  %158 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv63, i64 %indvars.iv59
  %159 = load double, double* %158, align 8
  %160 = fsub double %157, %159
  %161 = fmul double %160, 5.000000e-01
  %162 = fsub double %155, %161
  store double %162, double* %154, align 8
  %exitcond62.1 = icmp eq i64 %indvars.iv.next60, 1199
  %indvars.iv.next60.1 = add nsw i64 %indvars.iv59, 2
  br i1 %exitcond62.1, label %._crit_edge22.us, label %scalar.ph105, !llvm.loop !23

._crit_edge22.us:                                 ; preds = %scalar.ph105
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next64, 1000
  br i1 %exitcond5, label %.preheader.us.preheader, label %.preheader8.us

.preheader.us.preheader:                          ; preds = %._crit_edge22.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge30.us, %.preheader.us.preheader
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %._crit_edge30.us ], [ 0, %.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv68, i64 0
  %scevgep80 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv68, i64 1199
  %scevgep82 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv68, i64 0
  %163 = add nuw nsw i64 %indvars.iv68, 1
  %scevgep84 = getelementptr [1200 x double], [1200 x double]* %0, i64 %163, i64 0
  %scevgep86 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv68, i64 0
  %scevgep88 = getelementptr [1200 x double], [1200 x double]* %1, i64 %163, i64 1199
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %bound0 = icmp ult double* %scevgep, %scevgep84
  %bound1 = icmp ult double* %scevgep82, %scevgep80
  %found.conflict = and i1 %bound0, %bound1
  %bound090 = icmp ult double* %scevgep, %scevgep88
  %bound191 = icmp ult double* %scevgep86, %scevgep80
  %found.conflict92 = and i1 %bound090, %bound191
  %conflict.rdx = or i1 %found.conflict, %found.conflict92
  br i1 %conflict.rdx, label %._crit_edge53.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %164 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv68, i64 %index
  %165 = bitcast double* %164 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %165, align 8, !alias.scope !24, !noalias !27
  %166 = getelementptr double, double* %164, i64 2
  %167 = bitcast double* %166 to <2 x double>*
  %wide.load94 = load <2 x double>, <2 x double>* %167, align 8, !alias.scope !24, !noalias !27
  %168 = or i64 %index, 1
  %169 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv68, i64 %168
  %170 = bitcast double* %169 to <2 x double>*
  %wide.load95 = load <2 x double>, <2 x double>* %170, align 8, !alias.scope !30
  %171 = getelementptr double, double* %169, i64 2
  %172 = bitcast double* %171 to <2 x double>*
  %wide.load96 = load <2 x double>, <2 x double>* %172, align 8, !alias.scope !30
  %173 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv68, i64 %index
  %174 = bitcast double* %173 to <2 x double>*
  %wide.load97 = load <2 x double>, <2 x double>* %174, align 8, !alias.scope !30
  %175 = getelementptr double, double* %173, i64 2
  %176 = bitcast double* %175 to <2 x double>*
  %wide.load98 = load <2 x double>, <2 x double>* %176, align 8, !alias.scope !30
  %177 = fsub <2 x double> %wide.load95, %wide.load97
  %178 = fsub <2 x double> %wide.load96, %wide.load98
  %179 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next69, i64 %index
  %180 = bitcast double* %179 to <2 x double>*
  %wide.load99 = load <2 x double>, <2 x double>* %180, align 8, !alias.scope !31
  %181 = getelementptr double, double* %179, i64 2
  %182 = bitcast double* %181 to <2 x double>*
  %wide.load100 = load <2 x double>, <2 x double>* %182, align 8, !alias.scope !31
  %183 = fadd <2 x double> %177, %wide.load99
  %184 = fadd <2 x double> %178, %wide.load100
  %185 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv68, i64 %index
  %186 = bitcast double* %185 to <2 x double>*
  %wide.load101 = load <2 x double>, <2 x double>* %186, align 8, !alias.scope !31
  %187 = getelementptr double, double* %185, i64 2
  %188 = bitcast double* %187 to <2 x double>*
  %wide.load102 = load <2 x double>, <2 x double>* %188, align 8, !alias.scope !31
  %189 = fsub <2 x double> %183, %wide.load101
  %190 = fsub <2 x double> %184, %wide.load102
  %191 = fmul <2 x double> %189, <double 7.000000e-01, double 7.000000e-01>
  %192 = fmul <2 x double> %190, <double 7.000000e-01, double 7.000000e-01>
  %193 = fsub <2 x double> %wide.load, %191
  %194 = fsub <2 x double> %wide.load94, %192
  %195 = bitcast double* %164 to <2 x double>*
  store <2 x double> %193, <2 x double>* %195, align 8, !alias.scope !24, !noalias !27
  %196 = bitcast double* %166 to <2 x double>*
  store <2 x double> %194, <2 x double>* %196, align 8, !alias.scope !24, !noalias !27
  %index.next = add nuw nsw i64 %index, 4
  %197 = icmp eq i64 %index.next, 1196
  br i1 %197, label %._crit_edge53.preheader.loopexit, label %vector.body, !llvm.loop !32

._crit_edge53.preheader.loopexit:                 ; preds = %vector.body
  br label %._crit_edge53.preheader

._crit_edge53.preheader:                          ; preds = %._crit_edge53.preheader.loopexit, %.preheader.us
  %indvars.iv66.ph = phi i64 [ 0, %.preheader.us ], [ 1196, %._crit_edge53.preheader.loopexit ]
  br label %._crit_edge53

._crit_edge53:                                    ; preds = %._crit_edge53.preheader, %._crit_edge53
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %._crit_edge53 ], [ %indvars.iv66.ph, %._crit_edge53.preheader ]
  %198 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv68, i64 %indvars.iv66
  %199 = load double, double* %198, align 8
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %200 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv68, i64 %indvars.iv.next67
  %201 = load double, double* %200, align 8
  %202 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv68, i64 %indvars.iv66
  %203 = load double, double* %202, align 8
  %204 = fsub double %201, %203
  %205 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next69, i64 %indvars.iv66
  %206 = load double, double* %205, align 8
  %207 = fadd double %204, %206
  %208 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv68, i64 %indvars.iv66
  %209 = load double, double* %208, align 8
  %210 = fsub double %207, %209
  %211 = fmul double %210, 7.000000e-01
  %212 = fsub double %199, %211
  store double %212, double* %198, align 8
  %213 = icmp slt i64 %indvars.iv.next67, 1199
  br i1 %213, label %._crit_edge53, label %._crit_edge30.us, !llvm.loop !33

._crit_edge30.us:                                 ; preds = %._crit_edge53
  %exitcond6 = icmp eq i64 %indvars.iv.next69, 999
  br i1 %exitcond6, label %._crit_edge33, label %.preheader.us

._crit_edge33:                                    ; preds = %._crit_edge30.us
  %indvars.iv.next71 = add nuw nsw i64 %indvars.iv70, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next71, 500
  br i1 %exitcond7, label %._crit_edge, label %.preheader13

._crit_edge:                                      ; preds = %._crit_edge33
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]*, [1200 x double]*, [1200 x double]*) unnamed_addr #0 {
.preheader13.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #4
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  br label %.preheader13.us

.preheader13.us:                                  ; preds = %._crit_edge32.us, %.preheader13.us.preheader
  %indvars.iv66 = phi i64 [ 0, %.preheader13.us.preheader ], [ %indvars.iv.next67, %._crit_edge32.us ]
  %7 = mul nuw nsw i64 %indvars.iv66, 1000
  br label %._crit_edge50

._crit_edge50:                                    ; preds = %._crit_edge49, %.preheader13.us
  %indvars.iv64 = phi i64 [ 0, %.preheader13.us ], [ %indvars.iv.next65, %._crit_edge49 ]
  %8 = add nuw nsw i64 %7, %indvars.iv64
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge49

; <label>:12:                                     ; preds = %._crit_edge50
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc11.us = call i32 @fputc(i32 10, %struct._IO_FILE* %13) #4
  br label %._crit_edge49

._crit_edge49:                                    ; preds = %._crit_edge50, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv66, i64 %indvars.iv64
  %16 = load double, double* %15, align 8
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #5
  %indvars.iv.next65 = add nuw nsw i64 %indvars.iv64, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next65, 1200
  br i1 %exitcond4, label %._crit_edge32.us, label %._crit_edge50

._crit_edge32.us:                                 ; preds = %._crit_edge49
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next67, 1000
  br i1 %exitcond5, label %._crit_edge, label %.preheader13.us

._crit_edge:                                      ; preds = %._crit_edge32.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #5
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #4
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  br label %.preheader12.us

.preheader12.us:                                  ; preds = %._crit_edge22.us, %._crit_edge
  %indvars.iv61 = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next62, %._crit_edge22.us ]
  %24 = mul nuw nsw i64 %indvars.iv61, 1000
  br label %._crit_edge53

._crit_edge53:                                    ; preds = %._crit_edge52, %.preheader12.us
  %indvars.iv59 = phi i64 [ 0, %.preheader12.us ], [ %indvars.iv.next60, %._crit_edge52 ]
  %25 = add nuw nsw i64 %24, %indvars.iv59
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 20
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %._crit_edge52

; <label>:29:                                     ; preds = %._crit_edge53
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc8.us = call i32 @fputc(i32 10, %struct._IO_FILE* %30) #4
  br label %._crit_edge52

._crit_edge52:                                    ; preds = %._crit_edge53, %29
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv61, i64 %indvars.iv59
  %33 = load double, double* %32, align 8
  %34 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %33) #5
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next60, 1200
  br i1 %exitcond2, label %._crit_edge22.us, label %._crit_edge53

._crit_edge22.us:                                 ; preds = %._crit_edge52
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next62, 1000
  br i1 %exitcond3, label %._crit_edge51, label %.preheader12.us

._crit_edge51:                                    ; preds = %._crit_edge22.us
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #5
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %._crit_edge51
  %indvars.iv57 = phi i64 [ 0, %._crit_edge51 ], [ %indvars.iv.next58, %._crit_edge.us ]
  %39 = mul nuw nsw i64 %indvars.iv57, 1000
  br label %._crit_edge56

._crit_edge56:                                    ; preds = %._crit_edge55, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge55 ]
  %40 = add nuw nsw i64 %39, %indvars.iv
  %41 = trunc i64 %40 to i32
  %42 = srem i32 %41, 20
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %44, label %._crit_edge55

; <label>:44:                                     ; preds = %._crit_edge56
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %45) #4
  br label %._crit_edge55

._crit_edge55:                                    ; preds = %._crit_edge56, %44
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv57, i64 %indvars.iv
  %48 = load double, double* %47, align 8
  %49 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %48) #5
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge56

._crit_edge.us:                                   ; preds = %._crit_edge55
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next58, 1000
  br i1 %exitcond1, label %._crit_edge54, label %.preheader.us

._crit_edge54:                                    ; preds = %._crit_edge.us
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %51 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %50, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #5
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
