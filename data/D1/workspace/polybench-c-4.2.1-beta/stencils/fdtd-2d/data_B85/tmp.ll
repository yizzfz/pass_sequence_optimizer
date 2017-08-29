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
  call fastcc void @print_array([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9)
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
  %7 = load i64, i64* %6, align 8, !alias.scope !1
  %8 = insertelement <2 x i64> undef, i64 %7, i32 0
  %9 = shufflevector <2 x i64> %8, <2 x i64> undef, <2 x i32> zeroinitializer
  %10 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index183
  %11 = bitcast double* %10 to <2 x i64>*
  store <2 x i64> %9, <2 x i64>* %11, align 8, !alias.scope !4, !noalias !1
  %12 = getelementptr double, double* %10, i64 2
  %13 = bitcast double* %12 to <2 x i64>*
  store <2 x i64> %9, <2 x i64>* %13, align 8, !alias.scope !4, !noalias !1
  %index.next184 = add nuw nsw i64 %index183, 4
  %14 = load i64, i64* %6, align 8, !alias.scope !1
  %15 = insertelement <2 x i64> undef, i64 %14, i32 0
  %16 = shufflevector <2 x i64> %15, <2 x i64> undef, <2 x i32> zeroinitializer
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index.next184
  %18 = bitcast double* %17 to <2 x i64>*
  store <2 x i64> %16, <2 x i64>* %18, align 8, !alias.scope !4, !noalias !1
  %19 = getelementptr double, double* %17, i64 2
  %20 = bitcast double* %19 to <2 x i64>*
  store <2 x i64> %16, <2 x i64>* %20, align 8, !alias.scope !4, !noalias !1
  %index.next184.1 = add nsw i64 %index183, 8
  %21 = load i64, i64* %6, align 8, !alias.scope !1
  %22 = insertelement <2 x i64> undef, i64 %21, i32 0
  %23 = shufflevector <2 x i64> %22, <2 x i64> undef, <2 x i32> zeroinitializer
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index.next184.1
  %25 = bitcast double* %24 to <2 x i64>*
  store <2 x i64> %23, <2 x i64>* %25, align 8, !alias.scope !4, !noalias !1
  %26 = getelementptr double, double* %24, i64 2
  %27 = bitcast double* %26 to <2 x i64>*
  store <2 x i64> %23, <2 x i64>* %27, align 8, !alias.scope !4, !noalias !1
  %index.next184.2 = add nsw i64 %index183, 12
  %28 = icmp eq i64 %index.next184.2, 1200
  br i1 %28, label %.preheader9.us.preheader.loopexit9, label %vector.body169, !llvm.loop !6

.preheader9.us.preheader.loopexit:                ; preds = %scalar.ph171
  br label %.preheader9.us.preheader

.preheader9.us.preheader.loopexit9:               ; preds = %vector.body169
  br label %.preheader9.us.preheader

.preheader9.us.preheader:                         ; preds = %.preheader9.us.preheader.loopexit9, %.preheader9.us.preheader.loopexit
  br label %.preheader9.us

.preheader9.us:                                   ; preds = %._crit_edge.us, %.preheader9.us.preheader
  %indvar = phi i64 [ %29, %._crit_edge.us ], [ 0, %.preheader9.us.preheader ]
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %._crit_edge.us ], [ 1, %.preheader9.us.preheader ]
  %29 = add nuw nsw i64 %indvar, 1
  %scevgep141 = getelementptr [1200 x double], [1200 x double]* %1, i64 %29, i64 0
  %30 = add nuw nsw i64 %indvar, 2
  %scevgep143 = getelementptr [1200 x double], [1200 x double]* %1, i64 %30, i64 0
  %scevgep145 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvar, i64 0
  %scevgep147 = getelementptr [1200 x double], [1200 x double]* %2, i64 %30, i64 0
  %31 = add nsw i64 %indvars.iv57, -1
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
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv57, i64 %index155
  %33 = bitcast double* %32 to <2 x double>*
  %wide.load163 = load <2 x double>, <2 x double>* %33, align 8, !alias.scope !9, !noalias !12
  %34 = getelementptr double, double* %32, i64 2
  %35 = bitcast double* %34 to <2 x double>*
  %wide.load164 = load <2 x double>, <2 x double>* %35, align 8, !alias.scope !9, !noalias !12
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv57, i64 %index155
  %37 = bitcast double* %36 to <2 x double>*
  %wide.load165 = load <2 x double>, <2 x double>* %37, align 8, !alias.scope !12
  %38 = getelementptr double, double* %36, i64 2
  %39 = bitcast double* %38 to <2 x double>*
  %wide.load166 = load <2 x double>, <2 x double>* %39, align 8, !alias.scope !12
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %31, i64 %index155
  %41 = bitcast double* %40 to <2 x double>*
  %wide.load167 = load <2 x double>, <2 x double>* %41, align 8, !alias.scope !12
  %42 = getelementptr double, double* %40, i64 2
  %43 = bitcast double* %42 to <2 x double>*
  %wide.load168 = load <2 x double>, <2 x double>* %43, align 8, !alias.scope !12
  %44 = fsub <2 x double> %wide.load165, %wide.load167
  %45 = fsub <2 x double> %wide.load166, %wide.load168
  %46 = fmul <2 x double> %44, <double 5.000000e-01, double 5.000000e-01>
  %47 = fmul <2 x double> %45, <double 5.000000e-01, double 5.000000e-01>
  %48 = fsub <2 x double> %wide.load163, %46
  %49 = fsub <2 x double> %wide.load164, %47
  store <2 x double> %48, <2 x double>* %33, align 8, !alias.scope !9, !noalias !12
  store <2 x double> %49, <2 x double>* %35, align 8, !alias.scope !9, !noalias !12
  %index.next156 = add nuw nsw i64 %index155, 4
  %50 = icmp eq i64 %index.next156, 1200
  br i1 %50, label %._crit_edge.us.loopexit8, label %vector.body136, !llvm.loop !14

._crit_edge50:                                    ; preds = %._crit_edge50, %._crit_edge50.preheader
  %indvars.iv55 = phi i64 [ 0, %._crit_edge50.preheader ], [ %indvars.iv.next56.1, %._crit_edge50 ]
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv57, i64 %indvars.iv55
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv57, i64 %indvars.iv55
  %54 = load double, double* %53, align 8
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %31, i64 %indvars.iv55
  %56 = load double, double* %55, align 8
  %57 = fsub double %54, %56
  %58 = fmul double %57, 5.000000e-01
  %59 = fsub double %52, %58
  store double %59, double* %51, align 8
  %indvars.iv.next56 = or i64 %indvars.iv55, 1
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv57, i64 %indvars.iv.next56
  %61 = load double, double* %60, align 8
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv57, i64 %indvars.iv.next56
  %63 = load double, double* %62, align 8
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %31, i64 %indvars.iv.next56
  %65 = load double, double* %64, align 8
  %66 = fsub double %63, %65
  %67 = fmul double %66, 5.000000e-01
  %68 = fsub double %61, %67
  store double %68, double* %60, align 8
  %indvars.iv.next56.1 = add nsw i64 %indvars.iv55, 2
  %exitcond3.1 = icmp eq i64 %indvars.iv.next56.1, 1200
  br i1 %exitcond3.1, label %._crit_edge.us.loopexit, label %._crit_edge50, !llvm.loop !15

._crit_edge.us.loopexit:                          ; preds = %._crit_edge50
  br label %._crit_edge.us

._crit_edge.us.loopexit8:                         ; preds = %vector.body136
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit8, %._crit_edge.us.loopexit
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond4 = icmp eq i64 %29, 999
  br i1 %exitcond4, label %.preheader8.us.preheader, label %.preheader9.us

.preheader8.us.preheader:                         ; preds = %._crit_edge.us
  br label %.preheader8.us

scalar.ph171:                                     ; preds = %scalar.ph171, %scalar.ph171.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph171.preheader ], [ %indvars.iv.next.7, %scalar.ph171 ]
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
  br i1 %exitcond.7, label %.preheader9.us.preheader.loopexit, label %scalar.ph171, !llvm.loop !16

.preheader8.us:                                   ; preds = %._crit_edge22.us, %.preheader8.us.preheader
  %indvars.iv63 = phi i64 [ %94, %._crit_edge22.us ], [ 0, %.preheader8.us.preheader ]
  %scevgep108 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv63, i64 1
  %94 = add nuw nsw i64 %indvars.iv63, 1
  %scevgep110 = getelementptr [1200 x double], [1200 x double]* %0, i64 %94, i64 0
  %scevgep112 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv63, i64 0
  %scevgep114 = getelementptr [1200 x double], [1200 x double]* %2, i64 %94, i64 0
  %bound0116 = icmp ult double* %scevgep108, %scevgep114
  %bound1117 = icmp ult double* %scevgep112, %scevgep110
  %memcheck.conflict119 = and i1 %bound0116, %bound1117
  br i1 %memcheck.conflict119, label %scalar.ph105.preheader.new, label %vector.body103.preheader

vector.body103.preheader:                         ; preds = %.preheader8.us
  br label %vector.body103

vector.body103:                                   ; preds = %vector.body103.preheader, %vector.body103
  %index122 = phi i64 [ %index.next123, %vector.body103 ], [ 0, %vector.body103.preheader ]
  %offset.idx = or i64 %index122, 1
  %95 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv63, i64 %offset.idx
  %96 = bitcast double* %95 to <2 x double>*
  %wide.load130 = load <2 x double>, <2 x double>* %96, align 8, !alias.scope !17, !noalias !20
  %97 = getelementptr double, double* %95, i64 2
  %98 = bitcast double* %97 to <2 x double>*
  %wide.load131 = load <2 x double>, <2 x double>* %98, align 8, !alias.scope !17, !noalias !20
  %99 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv63, i64 %offset.idx
  %100 = bitcast double* %99 to <2 x double>*
  %wide.load132 = load <2 x double>, <2 x double>* %100, align 8, !alias.scope !20
  %101 = getelementptr double, double* %99, i64 2
  %102 = bitcast double* %101 to <2 x double>*
  %wide.load133 = load <2 x double>, <2 x double>* %102, align 8, !alias.scope !20
  %103 = add nsw i64 %offset.idx, -1
  %104 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv63, i64 %103
  %105 = bitcast double* %104 to <2 x double>*
  %wide.load134 = load <2 x double>, <2 x double>* %105, align 8, !alias.scope !20
  %106 = getelementptr double, double* %104, i64 2
  %107 = bitcast double* %106 to <2 x double>*
  %wide.load135 = load <2 x double>, <2 x double>* %107, align 8, !alias.scope !20
  %108 = fsub <2 x double> %wide.load132, %wide.load134
  %109 = fsub <2 x double> %wide.load133, %wide.load135
  %110 = fmul <2 x double> %108, <double 5.000000e-01, double 5.000000e-01>
  %111 = fmul <2 x double> %109, <double 5.000000e-01, double 5.000000e-01>
  %112 = fsub <2 x double> %wide.load130, %110
  %113 = fsub <2 x double> %wide.load131, %111
  store <2 x double> %112, <2 x double>* %96, align 8, !alias.scope !17, !noalias !20
  store <2 x double> %113, <2 x double>* %98, align 8, !alias.scope !17, !noalias !20
  %index.next123 = add nuw nsw i64 %index122, 4
  %114 = icmp eq i64 %index.next123, 1196
  br i1 %114, label %scalar.ph105.preheader.new.loopexit, label %vector.body103, !llvm.loop !22

scalar.ph105.preheader.new.loopexit:              ; preds = %vector.body103
  br label %scalar.ph105.preheader.new

scalar.ph105.preheader.new:                       ; preds = %scalar.ph105.preheader.new.loopexit, %.preheader8.us
  %indvars.iv59.ph = phi i64 [ 1, %.preheader8.us ], [ 1197, %scalar.ph105.preheader.new.loopexit ]
  %115 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv63, i64 %indvars.iv59.ph
  %116 = load double, double* %115, align 8
  %117 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv63, i64 %indvars.iv59.ph
  %118 = load double, double* %117, align 8
  %119 = add nsw i64 %indvars.iv59.ph, -1
  %120 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv63, i64 %119
  %121 = load double, double* %120, align 8
  %122 = fsub double %118, %121
  %123 = fmul double %122, 5.000000e-01
  %124 = fsub double %116, %123
  store double %124, double* %115, align 8
  %indvars.iv.next60.prol = add nuw nsw i64 %indvars.iv59.ph, 1
  br label %scalar.ph105

scalar.ph105:                                     ; preds = %scalar.ph105, %scalar.ph105.preheader.new
  %indvars.iv59 = phi i64 [ %indvars.iv.next60.prol, %scalar.ph105.preheader.new ], [ %indvars.iv.next60.1, %scalar.ph105 ]
  %125 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv63, i64 %indvars.iv59
  %126 = load double, double* %125, align 8
  %127 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv63, i64 %indvars.iv59
  %128 = load double, double* %127, align 8
  %129 = add nsw i64 %indvars.iv59, -1
  %130 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv63, i64 %129
  %131 = load double, double* %130, align 8
  %132 = fsub double %128, %131
  %133 = fmul double %132, 5.000000e-01
  %134 = fsub double %126, %133
  store double %134, double* %125, align 8
  %indvars.iv.next60 = add nuw nsw i64 %indvars.iv59, 1
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv63, i64 %indvars.iv.next60
  %136 = load double, double* %135, align 8
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv63, i64 %indvars.iv.next60
  %138 = load double, double* %137, align 8
  %139 = load double, double* %127, align 8
  %140 = fsub double %138, %139
  %141 = fmul double %140, 5.000000e-01
  %142 = fsub double %136, %141
  store double %142, double* %135, align 8
  %exitcond62.1 = icmp eq i64 %indvars.iv.next60, 1199
  %indvars.iv.next60.1 = add nsw i64 %indvars.iv59, 2
  br i1 %exitcond62.1, label %._crit_edge22.us, label %scalar.ph105, !llvm.loop !23

._crit_edge22.us:                                 ; preds = %scalar.ph105
  %exitcond5 = icmp eq i64 %94, 1000
  br i1 %exitcond5, label %.preheader.us.preheader, label %.preheader8.us

.preheader.us.preheader:                          ; preds = %._crit_edge22.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge30.us, %.preheader.us.preheader
  %indvars.iv68 = phi i64 [ %143, %._crit_edge30.us ], [ 0, %.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv68, i64 0
  %scevgep80 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv68, i64 1199
  %scevgep82 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv68, i64 0
  %143 = add nuw nsw i64 %indvars.iv68, 1
  %scevgep84 = getelementptr [1200 x double], [1200 x double]* %0, i64 %143, i64 0
  %scevgep86 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv68, i64 0
  %scevgep88 = getelementptr [1200 x double], [1200 x double]* %1, i64 %143, i64 1199
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
  %144 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv68, i64 %index
  %145 = bitcast double* %144 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %145, align 8, !alias.scope !24, !noalias !27
  %146 = getelementptr double, double* %144, i64 2
  %147 = bitcast double* %146 to <2 x double>*
  %wide.load94 = load <2 x double>, <2 x double>* %147, align 8, !alias.scope !24, !noalias !27
  %148 = or i64 %index, 1
  %149 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv68, i64 %148
  %150 = bitcast double* %149 to <2 x double>*
  %wide.load95 = load <2 x double>, <2 x double>* %150, align 8, !alias.scope !30
  %151 = getelementptr double, double* %149, i64 2
  %152 = bitcast double* %151 to <2 x double>*
  %wide.load96 = load <2 x double>, <2 x double>* %152, align 8, !alias.scope !30
  %153 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv68, i64 %index
  %154 = bitcast double* %153 to <2 x double>*
  %wide.load97 = load <2 x double>, <2 x double>* %154, align 8, !alias.scope !30
  %155 = getelementptr double, double* %153, i64 2
  %156 = bitcast double* %155 to <2 x double>*
  %wide.load98 = load <2 x double>, <2 x double>* %156, align 8, !alias.scope !30
  %157 = fsub <2 x double> %wide.load95, %wide.load97
  %158 = fsub <2 x double> %wide.load96, %wide.load98
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %143, i64 %index
  %160 = bitcast double* %159 to <2 x double>*
  %wide.load99 = load <2 x double>, <2 x double>* %160, align 8, !alias.scope !31
  %161 = getelementptr double, double* %159, i64 2
  %162 = bitcast double* %161 to <2 x double>*
  %wide.load100 = load <2 x double>, <2 x double>* %162, align 8, !alias.scope !31
  %163 = fadd <2 x double> %157, %wide.load99
  %164 = fadd <2 x double> %158, %wide.load100
  %165 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv68, i64 %index
  %166 = bitcast double* %165 to <2 x double>*
  %wide.load101 = load <2 x double>, <2 x double>* %166, align 8, !alias.scope !31
  %167 = getelementptr double, double* %165, i64 2
  %168 = bitcast double* %167 to <2 x double>*
  %wide.load102 = load <2 x double>, <2 x double>* %168, align 8, !alias.scope !31
  %169 = fsub <2 x double> %163, %wide.load101
  %170 = fsub <2 x double> %164, %wide.load102
  %171 = fmul <2 x double> %169, <double 7.000000e-01, double 7.000000e-01>
  %172 = fmul <2 x double> %170, <double 7.000000e-01, double 7.000000e-01>
  %173 = fsub <2 x double> %wide.load, %171
  %174 = fsub <2 x double> %wide.load94, %172
  store <2 x double> %173, <2 x double>* %145, align 8, !alias.scope !24, !noalias !27
  store <2 x double> %174, <2 x double>* %147, align 8, !alias.scope !24, !noalias !27
  %index.next = add nuw nsw i64 %index, 4
  %175 = icmp eq i64 %index.next, 1196
  br i1 %175, label %._crit_edge53.preheader.loopexit, label %vector.body, !llvm.loop !32

._crit_edge53.preheader.loopexit:                 ; preds = %vector.body
  br label %._crit_edge53.preheader

._crit_edge53.preheader:                          ; preds = %._crit_edge53.preheader.loopexit, %.preheader.us
  %indvars.iv66.ph = phi i64 [ 0, %.preheader.us ], [ 1196, %._crit_edge53.preheader.loopexit ]
  br label %._crit_edge53

._crit_edge53:                                    ; preds = %._crit_edge53.preheader, %._crit_edge53
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %._crit_edge53 ], [ %indvars.iv66.ph, %._crit_edge53.preheader ]
  %176 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv68, i64 %indvars.iv66
  %177 = load double, double* %176, align 8
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %178 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv68, i64 %indvars.iv.next67
  %179 = load double, double* %178, align 8
  %180 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv68, i64 %indvars.iv66
  %181 = load double, double* %180, align 8
  %182 = fsub double %179, %181
  %183 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %143, i64 %indvars.iv66
  %184 = load double, double* %183, align 8
  %185 = fadd double %182, %184
  %186 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv68, i64 %indvars.iv66
  %187 = load double, double* %186, align 8
  %188 = fsub double %185, %187
  %189 = fmul double %188, 7.000000e-01
  %190 = fsub double %177, %189
  store double %190, double* %176, align 8
  %191 = icmp slt i64 %indvars.iv.next67, 1199
  br i1 %191, label %._crit_edge53, label %._crit_edge30.us, !llvm.loop !33

._crit_edge30.us:                                 ; preds = %._crit_edge53
  %exitcond6 = icmp eq i64 %143, 999
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
