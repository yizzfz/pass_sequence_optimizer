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
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %4 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %5 = tail call i8* @polybench_alloc_data(i64 1200000, i32 8) #4
  %6 = tail call i8* @polybench_alloc_data(i64 500, i32 8) #4
  %7 = bitcast i8* %3 to [1200 x double]*
  %8 = bitcast i8* %4 to [1200 x double]*
  %9 = bitcast i8* %5 to [1200 x double]*
  %10 = bitcast i8* %6 to double*
  tail call fastcc void @init_array([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_fdtd_2d([1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %19

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %19

; <label>:15:                                     ; preds = %12
  %16 = bitcast i8* %5 to [1200 x double]*
  %17 = bitcast i8* %4 to [1200 x double]*
  %18 = bitcast i8* %3 to [1200 x double]*
  tail call fastcc void @print_array([1200 x double]* %18, [1200 x double]* %17, [1200 x double]* %16)
  br label %19

; <label>:19:                                     ; preds = %12, %15, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture) unnamed_addr #2 {
.lr.ph14.preheader:
  br label %.lr.ph14.prol

.lr.ph14.prol:                                    ; preds = %.lr.ph14.preheader, %.lr.ph14.prol
  %indvars.iv612.prol = phi i64 [ %indvars.iv.next7.prol, %.lr.ph14.prol ], [ 0, %.lr.ph14.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph14.prol ], [ 4, %.lr.ph14.preheader ]
  %4 = trunc i64 %indvars.iv612.prol to i32
  %5 = sitofp i32 %4 to double
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv612.prol
  store double %5, double* %6, align 8
  %indvars.iv.next7.prol = add nuw nsw i64 %indvars.iv612.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph14.preheader22, label %.lr.ph14.prol, !llvm.loop !1

.lr.ph14.preheader22:                             ; preds = %.lr.ph14.prol
  br label %.lr.ph14

.lr.ph14:                                         ; preds = %.lr.ph14.preheader22, %.lr.ph14
  %indvars.iv612 = phi i64 [ %indvars.iv.next7.7, %.lr.ph14 ], [ 4, %.lr.ph14.preheader22 ]
  %7 = trunc i64 %indvars.iv612 to i32
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds double, double* %3, i64 %indvars.iv612
  %10 = bitcast double* %9 to <2 x double>*
  %11 = trunc i64 %indvars.iv612 to i32
  %12 = or i32 %11, 1
  %13 = sitofp i32 %12 to double
  %14 = insertelement <2 x double> undef, double %8, i32 0
  %15 = insertelement <2 x double> %14, double %13, i32 1
  store <2 x double> %15, <2 x double>* %10, align 8
  %indvars.iv.next7.1 = or i64 %indvars.iv612, 2
  %16 = trunc i64 %indvars.iv.next7.1 to i32
  %17 = sitofp i32 %16 to double
  %18 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next7.1
  %19 = bitcast double* %18 to <2 x double>*
  %20 = trunc i64 %indvars.iv612 to i32
  %21 = or i32 %20, 3
  %22 = sitofp i32 %21 to double
  %23 = insertelement <2 x double> undef, double %17, i32 0
  %24 = insertelement <2 x double> %23, double %22, i32 1
  store <2 x double> %24, <2 x double>* %19, align 8
  %indvars.iv.next7.3 = add nuw nsw i64 %indvars.iv612, 4
  %25 = trunc i64 %indvars.iv.next7.3 to i32
  %26 = sitofp i32 %25 to double
  %27 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next7.3
  %28 = bitcast double* %27 to <2 x double>*
  %indvars.iv.next7.4 = add nuw nsw i64 %indvars.iv612, 5
  %29 = trunc i64 %indvars.iv.next7.4 to i32
  %30 = sitofp i32 %29 to double
  %31 = insertelement <2 x double> undef, double %26, i32 0
  %32 = insertelement <2 x double> %31, double %30, i32 1
  store <2 x double> %32, <2 x double>* %28, align 8
  %indvars.iv.next7.5 = add nuw nsw i64 %indvars.iv612, 6
  %33 = trunc i64 %indvars.iv.next7.5 to i32
  %34 = sitofp i32 %33 to double
  %35 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next7.5
  %36 = bitcast double* %35 to <2 x double>*
  %indvars.iv.next7.6 = add nuw nsw i64 %indvars.iv612, 7
  %37 = trunc i64 %indvars.iv.next7.6 to i32
  %38 = sitofp i32 %37 to double
  %39 = insertelement <2 x double> undef, double %34, i32 0
  %40 = insertelement <2 x double> %39, double %38, i32 1
  store <2 x double> %40, <2 x double>* %36, align 8
  %indvars.iv.next7.7 = add nuw nsw i64 %indvars.iv612, 8
  %exitcond19.7 = icmp eq i64 %indvars.iv.next7.7, 500
  br i1 %exitcond19.7, label %.preheader.us.preheader, label %.lr.ph14

.preheader.us.preheader:                          ; preds = %.lr.ph14
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv49.us = phi i64 [ %indvars.iv.next5.us, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %41 = trunc i64 %indvars.iv49.us to i32
  %42 = sitofp i32 %41 to double
  %43 = insertelement <2 x double> undef, double %42, i32 0
  %44 = shufflevector <2 x double> %43, <2 x double> undef, <2 x i32> zeroinitializer
  br label %45

; <label>:45:                                     ; preds = %45, %.preheader.us
  %indvars.iv8.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %45 ]
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv8.us, 1
  %46 = trunc i64 %indvars.iv.next.us to i32
  %47 = sitofp i32 %46 to double
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv49.us, i64 %indvars.iv8.us
  %49 = add nuw nsw i64 %indvars.iv8.us, 2
  %50 = trunc i64 %49 to i32
  %51 = sitofp i32 %50 to double
  %52 = insertelement <2 x double> undef, double %47, i32 0
  %53 = insertelement <2 x double> %52, double %51, i32 1
  %54 = fmul <2 x double> %44, %53
  %55 = fdiv <2 x double> %54, <double 1.000000e+03, double 1.200000e+03>
  %56 = extractelement <2 x double> %55, i32 0
  %57 = extractelement <2 x double> %55, i32 1
  store double %56, double* %48, align 8
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv49.us, i64 %indvars.iv8.us
  store double %57, double* %58, align 8
  %59 = add nuw nsw i64 %indvars.iv8.us, 3
  %60 = trunc i64 %59 to i32
  %61 = sitofp i32 %60 to double
  %62 = fmul double %42, %61
  %63 = fdiv double %62, 1.000000e+03
  %64 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv49.us, i64 %indvars.iv8.us
  store double %63, double* %64, align 8
  %exitcond = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond, label %._crit_edge.us, label %45

._crit_edge.us:                                   ; preds = %45
  %indvars.iv.next5.us = add nuw nsw i64 %indvars.iv49.us, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next5.us, 1000
  br i1 %exitcond17, label %._crit_edge11, label %.preheader.us

._crit_edge11:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_fdtd_2d([1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture readonly) unnamed_addr #2 {
.preheader27.lr.ph:
  br label %.preheader27

.preheader27:                                     ; preds = %._crit_edge43, %.preheader27.lr.ph
  %indvars.iv2044 = phi i64 [ 0, %.preheader27.lr.ph ], [ %indvars.iv.next21, %._crit_edge43 ]
  %4 = getelementptr inbounds double, double* %3, i64 %indvars.iv2044
  %5 = bitcast double* %4 to i64*
  br label %.lr.ph.new

.preheader23.us:                                  ; preds = %.preheader23.us.preheader, %._crit_edge.us
  %indvar = phi i64 [ %indvar.next, %._crit_edge.us ], [ 0, %.preheader23.us.preheader ]
  %indvars.iv1031.us = phi i64 [ %indvars.iv.next11.us, %._crit_edge.us ], [ 1, %.preheader23.us.preheader ]
  %6 = add nuw nsw i64 %indvar, 1
  %scevgep133 = getelementptr [1200 x double], [1200 x double]* %1, i64 %6, i64 0
  %7 = add nuw nsw i64 %indvar, 2
  %scevgep135 = getelementptr [1200 x double], [1200 x double]* %1, i64 %7, i64 0
  %scevgep137 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvar, i64 0
  %scevgep139 = getelementptr [1200 x double], [1200 x double]* %2, i64 %7, i64 0
  %8 = add nsw i64 %indvars.iv1031.us, -1
  %bound0141 = icmp ult double* %scevgep133, %scevgep139
  %bound1142 = icmp ult double* %scevgep137, %scevgep135
  %memcheck.conflict144 = and i1 %bound0141, %bound1142
  br i1 %memcheck.conflict144, label %.preheader23.us.new.preheader, label %vector.body128.preheader

vector.body128.preheader:                         ; preds = %.preheader23.us
  br label %vector.body128

.preheader23.us.new.preheader:                    ; preds = %.preheader23.us
  br label %.preheader23.us.new

vector.body128:                                   ; preds = %vector.body128.preheader, %vector.body128
  %index147 = phi i64 [ %index.next148, %vector.body128 ], [ 0, %vector.body128.preheader ]
  %offset.idx151 = shl i64 %index147, 1
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1031.us, i64 %offset.idx151
  %10 = bitcast double* %9 to <4 x double>*
  %wide.vec155 = load <4 x double>, <4 x double>* %10, align 8, !alias.scope !3, !noalias !6
  %strided.vec156 = shufflevector <4 x double> %wide.vec155, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec157 = shufflevector <4 x double> %wide.vec155, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1031.us, i64 %offset.idx151
  %12 = bitcast double* %11 to <4 x double>*
  %wide.vec158 = load <4 x double>, <4 x double>* %12, align 8, !alias.scope !6
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %8, i64 %offset.idx151
  %14 = bitcast double* %13 to <4 x double>*
  %wide.vec161 = load <4 x double>, <4 x double>* %14, align 8, !alias.scope !6
  %15 = fsub <4 x double> %wide.vec158, %wide.vec161
  %16 = shufflevector <4 x double> %15, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %17 = fmul <2 x double> %16, <double 5.000000e-01, double 5.000000e-01>
  %18 = fsub <2 x double> %strided.vec156, %17
  %19 = or i64 %offset.idx151, 1
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1031.us, i64 %19
  %21 = fsub <4 x double> %wide.vec158, %wide.vec161
  %22 = shufflevector <4 x double> %21, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %23 = fmul <2 x double> %22, <double 5.000000e-01, double 5.000000e-01>
  %24 = fsub <2 x double> %strided.vec157, %23
  %25 = getelementptr double, double* %20, i64 -1
  %26 = bitcast double* %25 to <4 x double>*
  %interleaved.vec164 = shufflevector <2 x double> %18, <2 x double> %24, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec164, <4 x double>* %26, align 8, !alias.scope !3, !noalias !6
  %index.next148 = add nuw nsw i64 %index147, 2
  %27 = icmp eq i64 %index.next148, 600
  br i1 %27, label %._crit_edge.us.loopexit165, label %vector.body128, !llvm.loop !8

.preheader23.us.new:                              ; preds = %.preheader23.us.new.preheader, %.preheader23.us.new
  %indvars.iv829.us = phi i64 [ %indvars.iv.next9.us.1, %.preheader23.us.new ], [ 0, %.preheader23.us.new.preheader ]
  %28 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1031.us, i64 %indvars.iv829.us
  %29 = load double, double* %28, align 8
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1031.us, i64 %indvars.iv829.us
  %31 = load double, double* %30, align 8
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %8, i64 %indvars.iv829.us
  %33 = load double, double* %32, align 8
  %34 = fsub double %31, %33
  %35 = fmul double %34, 5.000000e-01
  %36 = fsub double %29, %35
  store double %36, double* %28, align 8
  %indvars.iv.next9.us = or i64 %indvars.iv829.us, 1
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1031.us, i64 %indvars.iv.next9.us
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1031.us, i64 %indvars.iv.next9.us
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %8, i64 %indvars.iv.next9.us
  %42 = load double, double* %41, align 8
  %43 = fsub double %40, %42
  %44 = fmul double %43, 5.000000e-01
  %45 = fsub double %38, %44
  store double %45, double* %37, align 8
  %indvars.iv.next9.us.1 = add nuw nsw i64 %indvars.iv829.us, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next9.us.1, 1200
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader23.us.new, !llvm.loop !11

._crit_edge.us.loopexit:                          ; preds = %.preheader23.us.new
  br label %._crit_edge.us

._crit_edge.us.loopexit165:                       ; preds = %vector.body128
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit165, %._crit_edge.us.loopexit
  %indvars.iv.next11.us = add nuw nsw i64 %indvars.iv1031.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next11.us, 1000
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %exitcond, label %.preheader22.us.preheader, label %.preheader23.us

.preheader22.us.preheader:                        ; preds = %._crit_edge.us
  br label %.preheader22.us

.lr.ph.new:                                       ; preds = %.preheader27, %.lr.ph.new
  %indvars.iv28 = phi i64 [ %indvars.iv.next.7, %.lr.ph.new ], [ 0, %.preheader27 ]
  %46 = load i64, i64* %5, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv28
  %48 = bitcast double* %47 to i64*
  store i64 %46, i64* %48, align 8
  %indvars.iv.next = or i64 %indvars.iv28, 1
  %49 = load i64, i64* %5, align 8
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next
  %51 = bitcast double* %50 to i64*
  store i64 %49, i64* %51, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv28, 2
  %52 = load i64, i64* %5, align 8
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.1
  %54 = bitcast double* %53 to i64*
  store i64 %52, i64* %54, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv28, 3
  %55 = load i64, i64* %5, align 8
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.2
  %57 = bitcast double* %56 to i64*
  store i64 %55, i64* %57, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv28, 4
  %58 = load i64, i64* %5, align 8
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.3
  %60 = bitcast double* %59 to i64*
  store i64 %58, i64* %60, align 8
  %indvars.iv.next.4 = or i64 %indvars.iv28, 5
  %61 = load i64, i64* %5, align 8
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.4
  %63 = bitcast double* %62 to i64*
  store i64 %61, i64* %63, align 8
  %indvars.iv.next.5 = or i64 %indvars.iv28, 6
  %64 = load i64, i64* %5, align 8
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.5
  %66 = bitcast double* %65 to i64*
  store i64 %64, i64* %66, align 8
  %indvars.iv.next.6 = or i64 %indvars.iv28, 7
  %67 = load i64, i64* %5, align 8
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.6
  %69 = bitcast double* %68 to i64*
  store i64 %67, i64* %69, align 8
  %indvars.iv.next.7 = add nuw nsw i64 %indvars.iv28, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, 1200
  br i1 %exitcond.7, label %.preheader23.us.preheader, label %.lr.ph.new

.preheader23.us.preheader:                        ; preds = %.lr.ph.new
  br label %.preheader23.us

.preheader22.us:                                  ; preds = %.preheader22.us.preheader, %._crit_edge35.us
  %indvars.iv1436.us = phi i64 [ %indvars.iv.next15.us, %._crit_edge35.us ], [ 0, %.preheader22.us.preheader ]
  %scevgep100 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv1436.us, i64 2
  %70 = add nuw nsw i64 %indvars.iv1436.us, 1
  %scevgep102 = getelementptr [1200 x double], [1200 x double]* %0, i64 %70, i64 0
  %scevgep104 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv1436.us, i64 1
  %scevgep106 = getelementptr [1200 x double], [1200 x double]* %2, i64 %70, i64 0
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1436.us, i64 1
  %72 = load double, double* %71, align 8
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1436.us, i64 1
  %74 = load double, double* %73, align 8
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1436.us, i64 0
  %76 = load double, double* %75, align 8
  %77 = fsub double %74, %76
  %78 = fmul double %77, 5.000000e-01
  %79 = fsub double %72, %78
  store double %79, double* %71, align 8
  %bound0108 = icmp ult double* %scevgep100, %scevgep106
  %bound1109 = icmp ult double* %scevgep104, %scevgep102
  %memcheck.conflict111 = and i1 %bound0108, %bound1109
  br i1 %memcheck.conflict111, label %.preheader22.us.new.preheader, label %vector.body95.preheader

vector.body95.preheader:                          ; preds = %.preheader22.us
  br label %vector.body95

vector.body95:                                    ; preds = %vector.body95.preheader, %vector.body95
  %index114 = phi i64 [ %index.next115, %vector.body95 ], [ 0, %vector.body95.preheader ]
  %80 = shl i64 %index114, 1
  %offset.idx = or i64 %80, 2
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1436.us, i64 %offset.idx
  %82 = bitcast double* %81 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %82, align 8, !alias.scope !12, !noalias !15
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec121 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1436.us, i64 %offset.idx
  %84 = getelementptr double, double* %83, i64 -1
  %85 = bitcast double* %84 to <4 x double>*
  %wide.vec122 = load <4 x double>, <4 x double>* %85, align 8, !alias.scope !15
  %strided.vec123 = shufflevector <4 x double> %wide.vec122, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec124 = shufflevector <4 x double> %wide.vec122, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %86 = fsub <2 x double> %strided.vec124, %strided.vec123
  %87 = fmul <2 x double> %86, <double 5.000000e-01, double 5.000000e-01>
  %88 = fsub <2 x double> %strided.vec, %87
  %89 = or i64 %80, 3
  %90 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1436.us, i64 %89
  %91 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1436.us, i64 %89
  %92 = getelementptr double, double* %91, i64 -1
  %93 = bitcast double* %92 to <4 x double>*
  %wide.vec125 = load <4 x double>, <4 x double>* %93, align 8, !alias.scope !15
  %strided.vec126 = shufflevector <4 x double> %wide.vec125, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec127 = shufflevector <4 x double> %wide.vec125, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %94 = fsub <2 x double> %strided.vec127, %strided.vec126
  %95 = fmul <2 x double> %94, <double 5.000000e-01, double 5.000000e-01>
  %96 = fsub <2 x double> %strided.vec121, %95
  %97 = getelementptr double, double* %90, i64 -1
  %98 = bitcast double* %97 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %88, <2 x double> %96, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %98, align 8, !alias.scope !12, !noalias !15
  %index.next115 = add nuw nsw i64 %index114, 2
  %99 = icmp eq i64 %index.next115, 598
  br i1 %99, label %.preheader22.us.new.preheader.loopexit, label %vector.body95, !llvm.loop !17

.preheader22.us.new.preheader.loopexit:           ; preds = %vector.body95
  br label %.preheader22.us.new.preheader

.preheader22.us.new.preheader:                    ; preds = %.preheader22.us.new.preheader.loopexit, %.preheader22.us
  %indvars.iv1233.us.ph = phi i64 [ 2, %.preheader22.us ], [ 1198, %.preheader22.us.new.preheader.loopexit ]
  br label %.preheader22.us.new

.preheader22.us.new:                              ; preds = %.preheader22.us.new.preheader, %.preheader22.us.new
  %indvars.iv1233.us = phi i64 [ %indvars.iv.next13.us.1, %.preheader22.us.new ], [ %indvars.iv1233.us.ph, %.preheader22.us.new.preheader ]
  %100 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1436.us, i64 %indvars.iv1233.us
  %101 = load double, double* %100, align 8
  %102 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1436.us, i64 %indvars.iv1233.us
  %103 = load double, double* %102, align 8
  %104 = add nsw i64 %indvars.iv1233.us, -1
  %105 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1436.us, i64 %104
  %106 = load double, double* %105, align 8
  %107 = fsub double %103, %106
  %108 = fmul double %107, 5.000000e-01
  %109 = fsub double %101, %108
  store double %109, double* %100, align 8
  %indvars.iv.next13.us = or i64 %indvars.iv1233.us, 1
  %110 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1436.us, i64 %indvars.iv.next13.us
  %111 = load double, double* %110, align 8
  %112 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1436.us, i64 %indvars.iv.next13.us
  %113 = load double, double* %112, align 8
  %114 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1436.us, i64 %indvars.iv1233.us
  %115 = load double, double* %114, align 8
  %116 = fsub double %113, %115
  %117 = fmul double %116, 5.000000e-01
  %118 = fsub double %111, %117
  store double %118, double* %110, align 8
  %indvars.iv.next13.us.1 = add nuw nsw i64 %indvars.iv1233.us, 2
  %exitcond55.1 = icmp eq i64 %indvars.iv.next13.us.1, 1200
  br i1 %exitcond55.1, label %._crit_edge35.us, label %.preheader22.us.new, !llvm.loop !18

._crit_edge35.us:                                 ; preds = %.preheader22.us.new
  %indvars.iv.next15.us = add nuw nsw i64 %indvars.iv1436.us, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next15.us, 1000
  br i1 %exitcond60, label %.preheader.us.preheader, label %.preheader22.us

.preheader.us.preheader:                          ; preds = %._crit_edge35.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge40.us
  %indvars.iv1841.us = phi i64 [ %indvars.iv.next19.us, %._crit_edge40.us ], [ 0, %.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv1841.us, i64 0
  %scevgep72 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv1841.us, i64 1199
  %scevgep74 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv1841.us, i64 0
  %119 = add nuw nsw i64 %indvars.iv1841.us, 1
  %scevgep76 = getelementptr [1200 x double], [1200 x double]* %0, i64 %119, i64 0
  %scevgep78 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv1841.us, i64 0
  %scevgep80 = getelementptr [1200 x double], [1200 x double]* %1, i64 %119, i64 1199
  %120 = add nuw nsw i64 %indvars.iv1841.us, 1
  %bound0 = icmp ult double* %scevgep, %scevgep76
  %bound1 = icmp ult double* %scevgep74, %scevgep72
  %found.conflict = and i1 %bound0, %bound1
  %bound082 = icmp ult double* %scevgep, %scevgep80
  %bound183 = icmp ult double* %scevgep78, %scevgep72
  %found.conflict84 = and i1 %bound082, %bound183
  %conflict.rdx = or i1 %found.conflict, %found.conflict84
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %121 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1841.us, i64 %index
  %122 = bitcast double* %121 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %122, align 8, !alias.scope !19, !noalias !22
  %123 = getelementptr double, double* %121, i64 2
  %124 = bitcast double* %123 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %124, align 8, !alias.scope !19, !noalias !22
  %125 = or i64 %index, 1
  %126 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1841.us, i64 %125
  %127 = bitcast double* %126 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %127, align 8, !alias.scope !25
  %128 = getelementptr double, double* %126, i64 2
  %129 = bitcast double* %128 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %129, align 8, !alias.scope !25
  %130 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1841.us, i64 %index
  %131 = bitcast double* %130 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %131, align 8, !alias.scope !25
  %132 = getelementptr double, double* %130, i64 2
  %133 = bitcast double* %132 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %133, align 8, !alias.scope !25
  %134 = fsub <2 x double> %wide.load87, %wide.load89
  %135 = fsub <2 x double> %wide.load88, %wide.load90
  %136 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %120, i64 %index
  %137 = bitcast double* %136 to <2 x double>*
  %wide.load91 = load <2 x double>, <2 x double>* %137, align 8, !alias.scope !26
  %138 = getelementptr double, double* %136, i64 2
  %139 = bitcast double* %138 to <2 x double>*
  %wide.load92 = load <2 x double>, <2 x double>* %139, align 8, !alias.scope !26
  %140 = fadd <2 x double> %134, %wide.load91
  %141 = fadd <2 x double> %135, %wide.load92
  %142 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1841.us, i64 %index
  %143 = bitcast double* %142 to <2 x double>*
  %wide.load93 = load <2 x double>, <2 x double>* %143, align 8, !alias.scope !26
  %144 = getelementptr double, double* %142, i64 2
  %145 = bitcast double* %144 to <2 x double>*
  %wide.load94 = load <2 x double>, <2 x double>* %145, align 8, !alias.scope !26
  %146 = fsub <2 x double> %140, %wide.load93
  %147 = fsub <2 x double> %141, %wide.load94
  %148 = fmul <2 x double> %146, <double 7.000000e-01, double 7.000000e-01>
  %149 = fmul <2 x double> %147, <double 7.000000e-01, double 7.000000e-01>
  %150 = fsub <2 x double> %wide.load, %148
  %151 = fsub <2 x double> %wide.load86, %149
  %152 = bitcast double* %121 to <2 x double>*
  store <2 x double> %150, <2 x double>* %152, align 8, !alias.scope !19, !noalias !22
  %153 = bitcast double* %123 to <2 x double>*
  store <2 x double> %151, <2 x double>* %153, align 8, !alias.scope !19, !noalias !22
  %index.next = add nuw nsw i64 %index, 4
  %154 = icmp eq i64 %index.next, 1196
  br i1 %154, label %scalar.ph.preheader.loopexit, label %vector.body, !llvm.loop !27

scalar.ph.preheader.loopexit:                     ; preds = %vector.body
  br label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %scalar.ph.preheader.loopexit, %.preheader.us
  %indvars.iv1638.us.ph = phi i64 [ 0, %.preheader.us ], [ 1196, %scalar.ph.preheader.loopexit ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv1638.us = phi i64 [ %indvars.iv.next17.us, %scalar.ph ], [ %indvars.iv1638.us.ph, %scalar.ph.preheader ]
  %155 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1841.us, i64 %indvars.iv1638.us
  %156 = load double, double* %155, align 8
  %indvars.iv.next17.us = add nuw nsw i64 %indvars.iv1638.us, 1
  %157 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1841.us, i64 %indvars.iv.next17.us
  %158 = load double, double* %157, align 8
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1841.us, i64 %indvars.iv1638.us
  %160 = load double, double* %159, align 8
  %161 = fsub double %158, %160
  %162 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %120, i64 %indvars.iv1638.us
  %163 = load double, double* %162, align 8
  %164 = fadd double %161, %163
  %165 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1841.us, i64 %indvars.iv1638.us
  %166 = load double, double* %165, align 8
  %167 = fsub double %164, %166
  %168 = fmul double %167, 7.000000e-01
  %169 = fsub double %156, %168
  store double %169, double* %155, align 8
  %exitcond69 = icmp eq i64 %indvars.iv.next17.us, 1199
  br i1 %exitcond69, label %._crit_edge40.us, label %scalar.ph, !llvm.loop !28

._crit_edge40.us:                                 ; preds = %scalar.ph
  %indvars.iv.next19.us = add nuw nsw i64 %indvars.iv1841.us, 1
  %exitcond70 = icmp eq i64 %indvars.iv.next19.us, 999
  br i1 %exitcond70, label %._crit_edge43, label %.preheader.us

._crit_edge43:                                    ; preds = %._crit_edge40.us
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv2044, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next21, 500
  br i1 %exitcond61, label %._crit_edge45, label %.preheader27

._crit_edge45:                                    ; preds = %._crit_edge43
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
.preheader23.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader23.us

.preheader23.us:                                  ; preds = %.preheader23.us.preheader, %._crit_edge36.us
  %indvars.iv2037.us = phi i64 [ %indvars.iv.next21.us, %._crit_edge36.us ], [ 0, %.preheader23.us.preheader ]
  %7 = mul nuw nsw i64 %indvars.iv2037.us, 1000
  br label %8

; <label>:8:                                      ; preds = %15, %.preheader23.us
  %indvars.iv1834.us = phi i64 [ 0, %.preheader23.us ], [ %indvars.iv.next19.us, %15 ]
  %9 = add nuw nsw i64 %indvars.iv1834.us, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc11.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %15

; <label>:15:                                     ; preds = %13, %8
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv2037.us, i64 %indvars.iv1834.us
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next19.us = add nuw nsw i64 %indvars.iv1834.us, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next19.us, 1200
  br i1 %exitcond48, label %._crit_edge36.us, label %8

._crit_edge36.us:                                 ; preds = %15
  %indvars.iv.next21.us = add nuw nsw i64 %indvars.iv2037.us, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next21.us, 1000
  br i1 %exitcond49, label %._crit_edge39, label %.preheader23.us

._crit_edge39:                                    ; preds = %._crit_edge36.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  br label %.preheader22.us

.preheader22.us:                                  ; preds = %._crit_edge39, %._crit_edge30.us
  %indvars.iv1631.us = phi i64 [ %indvars.iv.next17.us, %._crit_edge30.us ], [ 0, %._crit_edge39 ]
  %26 = mul nuw nsw i64 %indvars.iv1631.us, 1000
  br label %27

; <label>:27:                                     ; preds = %34, %.preheader22.us
  %indvars.iv1428.us = phi i64 [ 0, %.preheader22.us ], [ %indvars.iv.next15.us, %34 ]
  %28 = add nuw nsw i64 %indvars.iv1428.us, %26
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 20
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %34

; <label>:32:                                     ; preds = %27
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc8.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %33) #5
  br label %34

; <label>:34:                                     ; preds = %32, %27
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1631.us, i64 %indvars.iv1428.us
  %37 = load double, double* %36, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %37) #6
  %indvars.iv.next15.us = add nuw nsw i64 %indvars.iv1428.us, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next15.us, 1200
  br i1 %exitcond45, label %._crit_edge30.us, label %27

._crit_edge30.us:                                 ; preds = %34
  %indvars.iv.next17.us = add nuw nsw i64 %indvars.iv1631.us, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next17.us, 1000
  br i1 %exitcond46, label %._crit_edge33, label %.preheader22.us

._crit_edge33:                                    ; preds = %._crit_edge30.us
  %39 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %39, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge33, %._crit_edge.us
  %indvars.iv1225.us = phi i64 [ %indvars.iv.next13.us, %._crit_edge.us ], [ 0, %._crit_edge33 ]
  %43 = mul nuw nsw i64 %indvars.iv1225.us, 1000
  br label %44

; <label>:44:                                     ; preds = %51, %.preheader.us
  %indvars.iv24.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %51 ]
  %45 = add nuw nsw i64 %indvars.iv24.us, %43
  %46 = trunc i64 %45 to i32
  %47 = srem i32 %46, 20
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %49, label %51

; <label>:49:                                     ; preds = %44
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %50) #5
  br label %51

; <label>:51:                                     ; preds = %49, %44
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1225.us, i64 %indvars.iv24.us
  %54 = load double, double* %53, align 8
  %55 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %52, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %54) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv24.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond, label %._crit_edge.us, label %44

._crit_edge.us:                                   ; preds = %51
  %indvars.iv.next13.us = add nuw nsw i64 %indvars.iv1225.us, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next13.us, 1000
  br i1 %exitcond43, label %._crit_edge27, label %.preheader.us

._crit_edge27:                                    ; preds = %._crit_edge.us
  %56 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %57 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %56, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

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
