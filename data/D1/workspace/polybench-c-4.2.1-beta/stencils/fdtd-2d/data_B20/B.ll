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
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 500, i32 8) #4
  %7 = bitcast i8* %3 to [1200 x double]*
  %8 = bitcast i8* %4 to [1200 x double]*
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  tail call void @init_array(i32 500, i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_fdtd_2d(i32 500, i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
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
  tail call void @print_array(i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9)
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
define internal void @init_array(i32, i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #2 {
.lr.ph7.preheader:
  br label %.lr.ph7.prol

.lr.ph7.prol:                                     ; preds = %.lr.ph7.preheader, %.lr.ph7.prol
  %indvars.iv14.prol = phi i64 [ %indvars.iv.next15.prol, %.lr.ph7.prol ], [ 0, %.lr.ph7.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph7.prol ], [ 4, %.lr.ph7.preheader ]
  %7 = trunc i64 %indvars.iv14.prol to i32
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds double, double* %6, i64 %indvars.iv14.prol
  store double %8, double* %9, align 8
  %indvars.iv.next15.prol = add nuw nsw i64 %indvars.iv14.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph7.preheader19, label %.lr.ph7.prol, !llvm.loop !1

.lr.ph7.preheader19:                              ; preds = %.lr.ph7.prol
  br label %.lr.ph7

._crit_edge4.preheader.us:                        ; preds = %._crit_edge4.preheader.us.preheader, %._crit_edge4._crit_edge.us
  %indvars.iv9 = phi i64 [ %indvars.iv.next10, %._crit_edge4._crit_edge.us ], [ 0, %._crit_edge4.preheader.us.preheader ]
  %10 = trunc i64 %indvars.iv9 to i32
  %11 = sitofp i32 %10 to double
  %12 = insertelement <2 x double> undef, double %11, i32 0
  %13 = shufflevector <2 x double> %12, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge4.us

._crit_edge4.us:                                  ; preds = %._crit_edge4.us, %._crit_edge4.preheader.us
  %indvars.iv = phi i64 [ 0, %._crit_edge4.preheader.us ], [ %indvars.iv.next, %._crit_edge4.us ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %14 = trunc i64 %indvars.iv.next to i32
  %15 = sitofp i32 %14 to double
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv9, i64 %indvars.iv
  %17 = add nuw nsw i64 %indvars.iv, 2
  %18 = trunc i64 %17 to i32
  %19 = sitofp i32 %18 to double
  %20 = insertelement <2 x double> undef, double %15, i32 0
  %21 = insertelement <2 x double> %20, double %19, i32 1
  %22 = fmul <2 x double> %13, %21
  %23 = fdiv <2 x double> %22, <double 1.000000e+03, double 1.200000e+03>
  %24 = extractelement <2 x double> %23, i32 0
  %25 = extractelement <2 x double> %23, i32 1
  store double %24, double* %16, align 8
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv9, i64 %indvars.iv
  store double %25, double* %26, align 8
  %27 = add nuw nsw i64 %indvars.iv, 3
  %28 = trunc i64 %27 to i32
  %29 = sitofp i32 %28 to double
  %30 = fmul double %11, %29
  %31 = fdiv double %30, 1.000000e+03
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv9, i64 %indvars.iv
  store double %31, double* %32, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge4._crit_edge.us, label %._crit_edge4.us

._crit_edge4._crit_edge.us:                       ; preds = %._crit_edge4.us
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next10, 1000
  br i1 %exitcond12, label %._crit_edge._crit_edge, label %._crit_edge4.preheader.us

.lr.ph7:                                          ; preds = %.lr.ph7.preheader19, %.lr.ph7
  %indvars.iv14 = phi i64 [ %indvars.iv.next15.7, %.lr.ph7 ], [ %indvars.iv.next15.prol, %.lr.ph7.preheader19 ]
  %33 = trunc i64 %indvars.iv14 to i32
  %34 = sitofp i32 %33 to double
  %35 = getelementptr inbounds double, double* %6, i64 %indvars.iv14
  %36 = bitcast double* %35 to <2 x double>*
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %37 = trunc i64 %indvars.iv.next15 to i32
  %38 = sitofp i32 %37 to double
  %39 = insertelement <2 x double> undef, double %34, i32 0
  %40 = insertelement <2 x double> %39, double %38, i32 1
  store <2 x double> %40, <2 x double>* %36, align 8
  %indvars.iv.next15.1 = add nsw i64 %indvars.iv14, 2
  %41 = trunc i64 %indvars.iv.next15.1 to i32
  %42 = sitofp i32 %41 to double
  %43 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next15.1
  %44 = bitcast double* %43 to <2 x double>*
  %indvars.iv.next15.2 = add nsw i64 %indvars.iv14, 3
  %45 = trunc i64 %indvars.iv.next15.2 to i32
  %46 = sitofp i32 %45 to double
  %47 = insertelement <2 x double> undef, double %42, i32 0
  %48 = insertelement <2 x double> %47, double %46, i32 1
  store <2 x double> %48, <2 x double>* %44, align 8
  %indvars.iv.next15.3 = add nsw i64 %indvars.iv14, 4
  %49 = trunc i64 %indvars.iv.next15.3 to i32
  %50 = sitofp i32 %49 to double
  %51 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next15.3
  %52 = bitcast double* %51 to <2 x double>*
  %indvars.iv.next15.4 = add nsw i64 %indvars.iv14, 5
  %53 = trunc i64 %indvars.iv.next15.4 to i32
  %54 = sitofp i32 %53 to double
  %55 = insertelement <2 x double> undef, double %50, i32 0
  %56 = insertelement <2 x double> %55, double %54, i32 1
  store <2 x double> %56, <2 x double>* %52, align 8
  %indvars.iv.next15.5 = add nsw i64 %indvars.iv14, 6
  %57 = trunc i64 %indvars.iv.next15.5 to i32
  %58 = sitofp i32 %57 to double
  %59 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next15.5
  %60 = bitcast double* %59 to <2 x double>*
  %indvars.iv.next15.6 = add nsw i64 %indvars.iv14, 7
  %61 = trunc i64 %indvars.iv.next15.6 to i32
  %62 = sitofp i32 %61 to double
  %63 = insertelement <2 x double> undef, double %58, i32 0
  %64 = insertelement <2 x double> %63, double %62, i32 1
  store <2 x double> %64, <2 x double>* %60, align 8
  %indvars.iv.next15.7 = add nsw i64 %indvars.iv14, 8
  %exitcond17.7 = icmp eq i64 %indvars.iv.next15.7, 500
  br i1 %exitcond17.7, label %._crit_edge4.preheader.us.preheader, label %.lr.ph7

._crit_edge4.preheader.us.preheader:              ; preds = %.lr.ph7
  br label %._crit_edge4.preheader.us

._crit_edge._crit_edge:                           ; preds = %._crit_edge4._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_fdtd_2d(i32, i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*, double*) #2 {
._crit_edge.preheader.lr.ph:
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %._crit_edge12._crit_edge, %._crit_edge.preheader.lr.ph
  %indvars.iv54 = phi i64 [ 0, %._crit_edge.preheader.lr.ph ], [ %indvars.iv.next55, %._crit_edge12._crit_edge ]
  %7 = getelementptr inbounds double, double* %6, i64 %indvars.iv54
  %8 = bitcast double* %7 to i64*
  br label %._crit_edge

._crit_edge9.preheader.us:                        ; preds = %._crit_edge9.preheader.us.preheader, %._crit_edge9._crit_edge.us
  %indvar = phi i64 [ %indvar.next, %._crit_edge9._crit_edge.us ], [ 0, %._crit_edge9.preheader.us.preheader ]
  %indvars.iv31 = phi i64 [ %indvars.iv.next32, %._crit_edge9._crit_edge.us ], [ 1, %._crit_edge9.preheader.us.preheader ]
  %9 = add i64 %indvar, 1
  %10 = add nsw i64 %indvars.iv31, -1
  %scevgep138 = getelementptr [1200 x double], [1200 x double]* %4, i64 %9, i64 0
  %scevgep141 = getelementptr [1200 x double], [1200 x double]* %4, i64 %9, i64 1200
  %scevgep144 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvar, i64 0
  %scevgep147 = getelementptr [1200 x double], [1200 x double]* %5, i64 %9, i64 1200
  %bound0149 = icmp ult double* %scevgep138, %scevgep147
  %bound1150 = icmp ult double* %scevgep144, %scevgep141
  %memcheck.conflict152 = and i1 %bound0149, %bound1150
  br i1 %memcheck.conflict152, label %._crit_edge9.us.preheader, label %vector.body128.preheader

vector.body128.preheader:                         ; preds = %._crit_edge9.preheader.us
  br label %vector.body128

vector.body128:                                   ; preds = %vector.body128.preheader, %vector.body128
  %index155 = phi i64 [ %index.next156, %vector.body128 ], [ 0, %vector.body128.preheader ]
  %11 = shl i64 %index155, 1
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %11
  %13 = bitcast double* %12 to <4 x double>*
  %wide.vec164 = load <4 x double>, <4 x double>* %13, align 8, !alias.scope !3, !noalias !6
  %strided.vec165 = shufflevector <4 x double> %wide.vec164, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec166 = shufflevector <4 x double> %wide.vec164, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv31, i64 %11
  %15 = bitcast double* %14 to <4 x double>*
  %wide.vec167 = load <4 x double>, <4 x double>* %15, align 8, !alias.scope !6
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %10, i64 %11
  %17 = bitcast double* %16 to <4 x double>*
  %wide.vec170 = load <4 x double>, <4 x double>* %17, align 8, !alias.scope !6
  %18 = fsub <4 x double> %wide.vec167, %wide.vec170
  %19 = shufflevector <4 x double> %18, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %20 = fmul <2 x double> %19, <double 5.000000e-01, double 5.000000e-01>
  %21 = fsub <2 x double> %strided.vec165, %20
  %22 = or i64 %11, 1
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %22
  %24 = fsub <4 x double> %wide.vec167, %wide.vec170
  %25 = shufflevector <4 x double> %24, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %26 = fmul <2 x double> %25, <double 5.000000e-01, double 5.000000e-01>
  %27 = fsub <2 x double> %strided.vec166, %26
  %28 = getelementptr double, double* %23, i64 -1
  %29 = bitcast double* %28 to <4 x double>*
  %interleaved.vec173 = shufflevector <2 x double> %21, <2 x double> %27, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec173, <4 x double>* %29, align 8, !alias.scope !3, !noalias !6
  %index.next156 = add i64 %index155, 2
  %30 = icmp eq i64 %index.next156, 600
  br i1 %30, label %middle.block129, label %vector.body128, !llvm.loop !8

middle.block129:                                  ; preds = %vector.body128
  br i1 true, label %._crit_edge9._crit_edge.us, label %._crit_edge9.us.preheader

._crit_edge9.us.preheader:                        ; preds = %middle.block129, %._crit_edge9.preheader.us
  %indvars.iv25.ph = phi i64 [ 0, %._crit_edge9.preheader.us ], [ 1200, %middle.block129 ]
  br label %._crit_edge9.us

._crit_edge9.us:                                  ; preds = %._crit_edge9.us.preheader, %._crit_edge9.us
  %indvars.iv25 = phi i64 [ %indvars.iv.next26.1, %._crit_edge9.us ], [ %indvars.iv25.ph, %._crit_edge9.us.preheader ]
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv25
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv31, i64 %indvars.iv25
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %10, i64 %indvars.iv25
  %36 = load double, double* %35, align 8
  %37 = fsub double %34, %36
  %38 = fmul double %37, 5.000000e-01
  %39 = fsub double %32, %38
  store double %39, double* %31, align 8
  %indvars.iv.next26 = or i64 %indvars.iv25, 1
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv31, i64 %indvars.iv.next26
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv31, i64 %indvars.iv.next26
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %10, i64 %indvars.iv.next26
  %45 = load double, double* %44, align 8
  %46 = fsub double %43, %45
  %47 = fmul double %46, 5.000000e-01
  %48 = fsub double %41, %47
  store double %48, double* %40, align 8
  %indvars.iv.next26.1 = add nsw i64 %indvars.iv25, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next26.1, 1200
  br i1 %exitcond.1, label %._crit_edge9._crit_edge.us.loopexit, label %._crit_edge9.us, !llvm.loop !11

._crit_edge9._crit_edge.us.loopexit:              ; preds = %._crit_edge9.us
  br label %._crit_edge9._crit_edge.us

._crit_edge9._crit_edge.us:                       ; preds = %._crit_edge9._crit_edge.us.loopexit, %middle.block129
  %indvars.iv.next32 = add nuw nsw i64 %indvars.iv31, 1
  %exitcond = icmp eq i64 %indvars.iv.next32, 1000
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond, label %._crit_edge11.preheader.us.preheader, label %._crit_edge9.preheader.us

._crit_edge11.preheader.us.preheader:             ; preds = %._crit_edge9._crit_edge.us
  br label %._crit_edge11.preheader.us

._crit_edge:                                      ; preds = %._crit_edge.preheader, %._crit_edge
  %indvars.iv = phi i64 [ %indvars.iv.next.7, %._crit_edge ], [ 0, %._crit_edge.preheader ]
  %49 = load i64, i64* %8, align 8
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv
  %51 = bitcast double* %50 to i64*
  store i64 %49, i64* %51, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %52 = load i64, i64* %8, align 8
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next
  %54 = bitcast double* %53 to i64*
  store i64 %52, i64* %54, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %55 = load i64, i64* %8, align 8
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.1
  %57 = bitcast double* %56 to i64*
  store i64 %55, i64* %57, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %58 = load i64, i64* %8, align 8
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.2
  %60 = bitcast double* %59 to i64*
  store i64 %58, i64* %60, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %61 = load i64, i64* %8, align 8
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.3
  %63 = bitcast double* %62 to i64*
  store i64 %61, i64* %63, align 8
  %indvars.iv.next.4 = or i64 %indvars.iv, 5
  %64 = load i64, i64* %8, align 8
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.4
  %66 = bitcast double* %65 to i64*
  store i64 %64, i64* %66, align 8
  %indvars.iv.next.5 = or i64 %indvars.iv, 6
  %67 = load i64, i64* %8, align 8
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.5
  %69 = bitcast double* %68 to i64*
  store i64 %67, i64* %69, align 8
  %indvars.iv.next.6 = or i64 %indvars.iv, 7
  %70 = load i64, i64* %8, align 8
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.6
  %72 = bitcast double* %71 to i64*
  store i64 %70, i64* %72, align 8
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, 1200
  br i1 %exitcond.7, label %._crit_edge9.preheader.us.preheader, label %._crit_edge

._crit_edge9.preheader.us.preheader:              ; preds = %._crit_edge
  br label %._crit_edge9.preheader.us

._crit_edge11.preheader.us:                       ; preds = %._crit_edge11.preheader.us.preheader, %._crit_edge11._crit_edge.us
  %indvars.iv41 = phi i64 [ %indvars.iv.next42, %._crit_edge11._crit_edge.us ], [ 0, %._crit_edge11.preheader.us.preheader ]
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv41, i64 1
  %74 = load double, double* %73, align 8
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv41, i64 1
  %76 = load double, double* %75, align 8
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv41, i64 0
  %78 = load double, double* %77, align 8
  %79 = fsub double %76, %78
  %80 = fmul double %79, 5.000000e-01
  %81 = fsub double %74, %80
  store double %81, double* %73, align 8
  %scevgep97 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv41, i64 2
  %scevgep100 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv41, i64 1200
  %scevgep103 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv41, i64 1
  %scevgep106 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv41, i64 1200
  %bound0108 = icmp ult double* %scevgep97, %scevgep106
  %bound1109 = icmp ult double* %scevgep103, %scevgep100
  %memcheck.conflict111 = and i1 %bound0108, %bound1109
  br i1 %memcheck.conflict111, label %._crit_edge11.us.preheader, label %vector.body91.preheader

vector.body91.preheader:                          ; preds = %._crit_edge11.preheader.us
  br label %vector.body91

vector.body91:                                    ; preds = %vector.body91.preheader, %vector.body91
  %index114 = phi i64 [ %index.next115, %vector.body91 ], [ 0, %vector.body91.preheader ]
  %82 = shl i64 %index114, 1
  %offset.idx = or i64 %82, 2
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv41, i64 %offset.idx
  %84 = bitcast double* %83 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %84, align 8, !alias.scope !12, !noalias !15
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec121 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv41, i64 %offset.idx
  %86 = getelementptr double, double* %85, i64 -1
  %87 = bitcast double* %86 to <4 x double>*
  %wide.vec122 = load <4 x double>, <4 x double>* %87, align 8, !alias.scope !15
  %strided.vec123 = shufflevector <4 x double> %wide.vec122, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec124 = shufflevector <4 x double> %wide.vec122, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %88 = fsub <2 x double> %strided.vec124, %strided.vec123
  %89 = fmul <2 x double> %88, <double 5.000000e-01, double 5.000000e-01>
  %90 = fsub <2 x double> %strided.vec, %89
  %91 = or i64 %82, 3
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv41, i64 %91
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv41, i64 %91
  %94 = getelementptr double, double* %93, i64 -1
  %95 = bitcast double* %94 to <4 x double>*
  %wide.vec125 = load <4 x double>, <4 x double>* %95, align 8, !alias.scope !15
  %strided.vec126 = shufflevector <4 x double> %wide.vec125, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec127 = shufflevector <4 x double> %wide.vec125, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %96 = fsub <2 x double> %strided.vec127, %strided.vec126
  %97 = fmul <2 x double> %96, <double 5.000000e-01, double 5.000000e-01>
  %98 = fsub <2 x double> %strided.vec121, %97
  %99 = getelementptr double, double* %92, i64 -1
  %100 = bitcast double* %99 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %90, <2 x double> %98, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %100, align 8, !alias.scope !12, !noalias !15
  %index.next115 = add i64 %index114, 2
  %101 = icmp eq i64 %index.next115, 598
  br i1 %101, label %middle.block92, label %vector.body91, !llvm.loop !17

middle.block92:                                   ; preds = %vector.body91
  br i1 false, label %._crit_edge11._crit_edge.us, label %._crit_edge11.us.preheader

._crit_edge11.us.preheader:                       ; preds = %middle.block92, %._crit_edge11.preheader.us
  %indvars.iv35.ph = phi i64 [ 2, %._crit_edge11.preheader.us ], [ 1198, %middle.block92 ]
  br label %._crit_edge11.us

._crit_edge11.us:                                 ; preds = %._crit_edge11.us.preheader, %._crit_edge11.us
  %indvars.iv35 = phi i64 [ %indvars.iv.next36.1, %._crit_edge11.us ], [ %indvars.iv35.ph, %._crit_edge11.us.preheader ]
  %102 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv41, i64 %indvars.iv35
  %103 = load double, double* %102, align 8
  %104 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv41, i64 %indvars.iv35
  %105 = load double, double* %104, align 8
  %106 = add nsw i64 %indvars.iv35, -1
  %107 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv41, i64 %106
  %108 = load double, double* %107, align 8
  %109 = fsub double %105, %108
  %110 = fmul double %109, 5.000000e-01
  %111 = fsub double %103, %110
  store double %111, double* %102, align 8
  %indvars.iv.next36 = or i64 %indvars.iv35, 1
  %112 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv41, i64 %indvars.iv.next36
  %113 = load double, double* %112, align 8
  %114 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv41, i64 %indvars.iv.next36
  %115 = load double, double* %114, align 8
  %116 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv41, i64 %indvars.iv35
  %117 = load double, double* %116, align 8
  %118 = fsub double %115, %117
  %119 = fmul double %118, 5.000000e-01
  %120 = fsub double %113, %119
  store double %120, double* %112, align 8
  %indvars.iv.next36.1 = add nsw i64 %indvars.iv35, 2
  %exitcond38.1 = icmp eq i64 %indvars.iv.next36.1, 1200
  br i1 %exitcond38.1, label %._crit_edge11._crit_edge.us.loopexit, label %._crit_edge11.us, !llvm.loop !18

._crit_edge11._crit_edge.us.loopexit:             ; preds = %._crit_edge11.us
  br label %._crit_edge11._crit_edge.us

._crit_edge11._crit_edge.us:                      ; preds = %._crit_edge11._crit_edge.us.loopexit, %middle.block92
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next42, 1000
  br i1 %exitcond44, label %._crit_edge13.preheader.us.preheader, label %._crit_edge11.preheader.us

._crit_edge13.preheader.us.preheader:             ; preds = %._crit_edge11._crit_edge.us
  br label %._crit_edge13.preheader.us

._crit_edge13.preheader.us:                       ; preds = %._crit_edge13.preheader.us.preheader, %._crit_edge13._crit_edge.us
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %._crit_edge13._crit_edge.us ], [ 0, %._crit_edge13.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv50, i64 0
  %scevgep68 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv50, i64 1199
  %scevgep70 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv50, i64 0
  %121 = add i64 %indvars.iv50, 1
  %scevgep72 = getelementptr [1200 x double], [1200 x double]* %3, i64 %121, i64 0
  %scevgep74 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 0
  %scevgep76 = getelementptr [1200 x double], [1200 x double]* %4, i64 %121, i64 1199
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %bound0 = icmp ult double* %scevgep, %scevgep72
  %bound1 = icmp ult double* %scevgep70, %scevgep68
  %found.conflict = and i1 %bound0, %bound1
  %bound078 = icmp ult double* %scevgep, %scevgep76
  %bound179 = icmp ult double* %scevgep74, %scevgep68
  %found.conflict80 = and i1 %bound078, %bound179
  %conflict.rdx = or i1 %found.conflict, %found.conflict80
  br i1 %conflict.rdx, label %._crit_edge13.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %._crit_edge13.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %122 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv50, i64 %index
  %123 = bitcast double* %122 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %123, align 8, !alias.scope !19, !noalias !22
  %124 = getelementptr double, double* %122, i64 2
  %125 = bitcast double* %124 to <2 x double>*
  %wide.load82 = load <2 x double>, <2 x double>* %125, align 8, !alias.scope !19, !noalias !22
  %126 = or i64 %index, 1
  %127 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv50, i64 %126
  %128 = bitcast double* %127 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %128, align 8, !alias.scope !25
  %129 = getelementptr double, double* %127, i64 2
  %130 = bitcast double* %129 to <2 x double>*
  %wide.load84 = load <2 x double>, <2 x double>* %130, align 8, !alias.scope !25
  %131 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv50, i64 %index
  %132 = bitcast double* %131 to <2 x double>*
  %wide.load85 = load <2 x double>, <2 x double>* %132, align 8, !alias.scope !25
  %133 = getelementptr double, double* %131, i64 2
  %134 = bitcast double* %133 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %134, align 8, !alias.scope !25
  %135 = fsub <2 x double> %wide.load83, %wide.load85
  %136 = fsub <2 x double> %wide.load84, %wide.load86
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next51, i64 %index
  %138 = bitcast double* %137 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %138, align 8, !alias.scope !26
  %139 = getelementptr double, double* %137, i64 2
  %140 = bitcast double* %139 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %140, align 8, !alias.scope !26
  %141 = fadd <2 x double> %135, %wide.load87
  %142 = fadd <2 x double> %136, %wide.load88
  %143 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 %index
  %144 = bitcast double* %143 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %144, align 8, !alias.scope !26
  %145 = getelementptr double, double* %143, i64 2
  %146 = bitcast double* %145 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %146, align 8, !alias.scope !26
  %147 = fsub <2 x double> %141, %wide.load89
  %148 = fsub <2 x double> %142, %wide.load90
  %149 = fmul <2 x double> %147, <double 7.000000e-01, double 7.000000e-01>
  %150 = fmul <2 x double> %148, <double 7.000000e-01, double 7.000000e-01>
  %151 = fsub <2 x double> %wide.load, %149
  %152 = fsub <2 x double> %wide.load82, %150
  %153 = bitcast double* %122 to <2 x double>*
  store <2 x double> %151, <2 x double>* %153, align 8, !alias.scope !19, !noalias !22
  %154 = bitcast double* %124 to <2 x double>*
  store <2 x double> %152, <2 x double>* %154, align 8, !alias.scope !19, !noalias !22
  %index.next = add i64 %index, 4
  %155 = icmp eq i64 %index.next, 1196
  br i1 %155, label %._crit_edge13.us.preheader.loopexit, label %vector.body, !llvm.loop !27

._crit_edge13.us.preheader.loopexit:              ; preds = %vector.body
  br label %._crit_edge13.us.preheader

._crit_edge13.us.preheader:                       ; preds = %._crit_edge13.us.preheader.loopexit, %._crit_edge13.preheader.us
  %indvars.iv46.ph = phi i64 [ 0, %._crit_edge13.preheader.us ], [ 1196, %._crit_edge13.us.preheader.loopexit ]
  br label %._crit_edge13.us

._crit_edge13.us:                                 ; preds = %._crit_edge13.us.preheader, %._crit_edge13.us
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %._crit_edge13.us ], [ %indvars.iv46.ph, %._crit_edge13.us.preheader ]
  %156 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv50, i64 %indvars.iv46
  %157 = load double, double* %156, align 8
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %158 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv50, i64 %indvars.iv.next47
  %159 = load double, double* %158, align 8
  %160 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv50, i64 %indvars.iv46
  %161 = load double, double* %160, align 8
  %162 = fsub double %159, %161
  %163 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next51, i64 %indvars.iv46
  %164 = load double, double* %163, align 8
  %165 = fadd double %162, %164
  %166 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv50, i64 %indvars.iv46
  %167 = load double, double* %166, align 8
  %168 = fsub double %165, %167
  %169 = fmul double %168, 7.000000e-01
  %170 = fsub double %157, %169
  store double %170, double* %156, align 8
  %exitcond49 = icmp eq i64 %indvars.iv.next47, 1199
  br i1 %exitcond49, label %._crit_edge13._crit_edge.us, label %._crit_edge13.us, !llvm.loop !28

._crit_edge13._crit_edge.us:                      ; preds = %._crit_edge13.us
  %exitcond53 = icmp eq i64 %indvars.iv.next51, 999
  br i1 %exitcond53, label %._crit_edge12._crit_edge, label %._crit_edge13.preheader.us

._crit_edge12._crit_edge:                         ; preds = %._crit_edge13._crit_edge.us
  %indvars.iv.next55 = add nuw nsw i64 %indvars.iv54, 1
  %exitcond57 = icmp eq i64 %indvars.iv.next55, 500
  br i1 %exitcond57, label %._crit_edge21, label %._crit_edge.preheader

._crit_edge21:                                    ; preds = %._crit_edge12._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1200 x double]*, [1200 x double]*, [1200 x double]*) #0 {
._crit_edge.preheader.us.preheader:
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #5
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge.preheader.us

._crit_edge.preheader.us:                         ; preds = %._crit_edge._crit_edge.us, %._crit_edge.preheader.us.preheader
  %indvars.iv45 = phi i64 [ 0, %._crit_edge.preheader.us.preheader ], [ %indvars.iv.next46, %._crit_edge._crit_edge.us ]
  %9 = mul nsw i64 %indvars.iv45, 1000
  br label %10

; <label>:10:                                     ; preds = %._crit_edge12.us, %._crit_edge.preheader.us
  %indvars.iv41 = phi i64 [ 0, %._crit_edge.preheader.us ], [ %indvars.iv.next42, %._crit_edge12.us ]
  %11 = add nsw i64 %indvars.iv41, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %._crit_edge12.us

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc11.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %15, %10
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv45, i64 %indvars.iv41
  %19 = load double, double* %18, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next42, 1200
  br i1 %exitcond44, label %._crit_edge._crit_edge.us, label %10

._crit_edge._crit_edge.us:                        ; preds = %._crit_edge12.us
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next46, 1000
  br i1 %exitcond48, label %._crit_edge, label %._crit_edge.preheader.us

._crit_edge:                                      ; preds = %._crit_edge._crit_edge.us
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  br label %._crit_edge13.preheader.us

._crit_edge13.preheader.us:                       ; preds = %._crit_edge13._crit_edge.us, %._crit_edge
  %indvars.iv36 = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next37, %._crit_edge13._crit_edge.us ]
  %27 = mul nsw i64 %indvars.iv36, 1000
  br label %28

; <label>:28:                                     ; preds = %._crit_edge14.us, %._crit_edge13.preheader.us
  %indvars.iv32 = phi i64 [ 0, %._crit_edge13.preheader.us ], [ %indvars.iv.next33, %._crit_edge14.us ]
  %29 = add nsw i64 %indvars.iv32, %27
  %30 = trunc i64 %29 to i32
  %31 = srem i32 %30, 20
  %32 = icmp eq i32 %31, 0
  br i1 %32, label %33, label %._crit_edge14.us

; <label>:33:                                     ; preds = %28
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc8.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %34) #5
  br label %._crit_edge14.us

._crit_edge14.us:                                 ; preds = %33, %28
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv36, i64 %indvars.iv32
  %37 = load double, double* %36, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %37) #6
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next33, 1200
  br i1 %exitcond35, label %._crit_edge13._crit_edge.us, label %28

._crit_edge13._crit_edge.us:                      ; preds = %._crit_edge14.us
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next37, 1000
  br i1 %exitcond39, label %._crit_edge21, label %._crit_edge13.preheader.us

._crit_edge21:                                    ; preds = %._crit_edge13._crit_edge.us
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  br label %._crit_edge15.preheader.us

._crit_edge15.preheader.us:                       ; preds = %._crit_edge15._crit_edge.us, %._crit_edge21
  %indvars.iv27 = phi i64 [ 0, %._crit_edge21 ], [ %indvars.iv.next28, %._crit_edge15._crit_edge.us ]
  %43 = mul nsw i64 %indvars.iv27, 1000
  br label %44

; <label>:44:                                     ; preds = %._crit_edge16.us, %._crit_edge15.preheader.us
  %indvars.iv = phi i64 [ 0, %._crit_edge15.preheader.us ], [ %indvars.iv.next, %._crit_edge16.us ]
  %45 = add nsw i64 %indvars.iv, %43
  %46 = trunc i64 %45 to i32
  %47 = srem i32 %46, 20
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %49, label %._crit_edge16.us

; <label>:49:                                     ; preds = %44
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %50) #5
  br label %._crit_edge16.us

._crit_edge16.us:                                 ; preds = %49, %44
  %51 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv
  %53 = load double, double* %52, align 8
  %54 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %51, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %53) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge15._crit_edge.us, label %44

._crit_edge15._crit_edge.us:                      ; preds = %._crit_edge16.us
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next28, 1000
  br i1 %exitcond30, label %._crit_edge18, label %._crit_edge15.preheader.us

._crit_edge18:                                    ; preds = %._crit_edge15._crit_edge.us
  %55 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %56 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %55, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
!3 = !{!4}
!4 = distinct !{!4, !5}
!5 = distinct !{!5, !"LVerDomain"}
!6 = !{!7}
!7 = distinct !{!7, !5}
!8 = distinct !{!8, !9, !10}
!9 = !{!"llvm.loop.vectorize.width", i32 1}
!10 = !{!"llvm.loop.interleave.count", i32 1}
!11 = distinct !{!11, !9, !10}
!12 = !{!13}
!13 = distinct !{!13, !14}
!14 = distinct !{!14, !"LVerDomain"}
!15 = !{!16}
!16 = distinct !{!16, !14}
!17 = distinct !{!17, !9, !10}
!18 = distinct !{!18, !9, !10}
!19 = !{!20}
!20 = distinct !{!20, !21}
!21 = distinct !{!21, !"LVerDomain"}
!22 = !{!23, !24}
!23 = distinct !{!23, !21}
!24 = distinct !{!24, !21}
!25 = !{!23}
!26 = !{!24}
!27 = distinct !{!27, !9, !10}
!28 = distinct !{!28, !9, !10}
