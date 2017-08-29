; ModuleID = 'A.ll'
source_filename = "fdtd-2d.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [3 x i8] c"ex\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
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
  tail call void @init_array(i32 500, i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_start() #4
  tail call void @kernel_fdtd_2d(i32 500, i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9, double* %10)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %11 = icmp sgt i32 %0, 42
  br i1 %11, label %12, label %16

; <label>:12:                                     ; preds = %2
  %13 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %13, align 1
  %14 = icmp eq i8 %strcmpload, 0
  br i1 %14, label %15, label %16

; <label>:15:                                     ; preds = %12
  tail call void @print_array(i32 1000, i32 1200, [1200 x double]* %7, [1200 x double]* %8, [1200 x double]* %9)
  br label %16

; <label>:16:                                     ; preds = %12, %15, %2
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, i32, [1200 x double]* nocapture, [1200 x double]*, [1200 x double]*, double* nocapture) #2 {
.lr.ph14.preheader:
  br label %.lr.ph14.prol

.lr.ph14.prol:                                    ; preds = %.lr.ph14.preheader, %.lr.ph14.prol
  %indvars.iv512.prol = phi i64 [ %indvars.iv.next6.prol, %.lr.ph14.prol ], [ 0, %.lr.ph14.preheader ]
  %prol.iter = phi i64 [ %prol.iter.sub, %.lr.ph14.prol ], [ 4, %.lr.ph14.preheader ]
  %7 = trunc i64 %indvars.iv512.prol to i32
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds double, double* %6, i64 %indvars.iv512.prol
  store double %8, double* %9, align 8
  %indvars.iv.next6.prol = add nuw nsw i64 %indvars.iv512.prol, 1
  %prol.iter.sub = add i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph14.preheader22, label %.lr.ph14.prol, !llvm.loop !1

.lr.ph14.preheader22:                             ; preds = %.lr.ph14.prol
  br label %.lr.ph14

.lr.ph14:                                         ; preds = %.lr.ph14.preheader22, %.lr.ph14
  %indvars.iv512 = phi i64 [ %indvars.iv.next6.7, %.lr.ph14 ], [ %indvars.iv.next6.prol, %.lr.ph14.preheader22 ]
  %10 = trunc i64 %indvars.iv512 to i32
  %11 = sitofp i32 %10 to double
  %12 = getelementptr inbounds double, double* %6, i64 %indvars.iv512
  %13 = bitcast double* %12 to <2 x double>*
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv512, 1
  %14 = trunc i64 %indvars.iv.next6 to i32
  %15 = sitofp i32 %14 to double
  %16 = insertelement <2 x double> undef, double %11, i32 0
  %17 = insertelement <2 x double> %16, double %15, i32 1
  store <2 x double> %17, <2 x double>* %13, align 8
  %indvars.iv.next6.1 = add nsw i64 %indvars.iv512, 2
  %18 = trunc i64 %indvars.iv.next6.1 to i32
  %19 = sitofp i32 %18 to double
  %20 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next6.1
  %21 = bitcast double* %20 to <2 x double>*
  %indvars.iv.next6.2 = add nsw i64 %indvars.iv512, 3
  %22 = trunc i64 %indvars.iv.next6.2 to i32
  %23 = sitofp i32 %22 to double
  %24 = insertelement <2 x double> undef, double %19, i32 0
  %25 = insertelement <2 x double> %24, double %23, i32 1
  store <2 x double> %25, <2 x double>* %21, align 8
  %indvars.iv.next6.3 = add nsw i64 %indvars.iv512, 4
  %26 = trunc i64 %indvars.iv.next6.3 to i32
  %27 = sitofp i32 %26 to double
  %28 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next6.3
  %29 = bitcast double* %28 to <2 x double>*
  %indvars.iv.next6.4 = add nsw i64 %indvars.iv512, 5
  %30 = trunc i64 %indvars.iv.next6.4 to i32
  %31 = sitofp i32 %30 to double
  %32 = insertelement <2 x double> undef, double %27, i32 0
  %33 = insertelement <2 x double> %32, double %31, i32 1
  store <2 x double> %33, <2 x double>* %29, align 8
  %indvars.iv.next6.5 = add nsw i64 %indvars.iv512, 6
  %34 = trunc i64 %indvars.iv.next6.5 to i32
  %35 = sitofp i32 %34 to double
  %36 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next6.5
  %37 = bitcast double* %36 to <2 x double>*
  %indvars.iv.next6.6 = add nsw i64 %indvars.iv512, 7
  %38 = trunc i64 %indvars.iv.next6.6 to i32
  %39 = sitofp i32 %38 to double
  %40 = insertelement <2 x double> undef, double %35, i32 0
  %41 = insertelement <2 x double> %40, double %39, i32 1
  store <2 x double> %41, <2 x double>* %37, align 8
  %indvars.iv.next6.7 = add nsw i64 %indvars.iv512, 8
  %exitcond19.7 = icmp eq i64 %indvars.iv.next6.7, 500
  br i1 %exitcond19.7, label %.preheader.us.preheader, label %.lr.ph14

.preheader.us.preheader:                          ; preds = %.lr.ph14
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv39.us = phi i64 [ %indvars.iv.next4.us, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %42 = trunc i64 %indvars.iv39.us to i32
  %43 = sitofp i32 %42 to double
  %44 = insertelement <2 x double> undef, double %43, i32 0
  %45 = shufflevector <2 x double> %44, <2 x double> undef, <2 x i32> zeroinitializer
  br label %46

; <label>:46:                                     ; preds = %46, %.preheader.us
  %indvars.iv8.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %46 ]
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv8.us, 1
  %47 = trunc i64 %indvars.iv.next.us to i32
  %48 = sitofp i32 %47 to double
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv39.us, i64 %indvars.iv8.us
  %50 = add nuw nsw i64 %indvars.iv8.us, 2
  %51 = trunc i64 %50 to i32
  %52 = sitofp i32 %51 to double
  %53 = insertelement <2 x double> undef, double %48, i32 0
  %54 = insertelement <2 x double> %53, double %52, i32 1
  %55 = fmul <2 x double> %45, %54
  %56 = fdiv <2 x double> %55, <double 1.000000e+03, double 1.200000e+03>
  %57 = extractelement <2 x double> %56, i32 0
  %58 = extractelement <2 x double> %56, i32 1
  store double %57, double* %49, align 8
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv39.us, i64 %indvars.iv8.us
  store double %58, double* %59, align 8
  %60 = add nuw nsw i64 %indvars.iv8.us, 3
  %61 = trunc i64 %60 to i32
  %62 = sitofp i32 %61 to double
  %63 = fmul double %43, %62
  %64 = fdiv double %63, 1.000000e+03
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv39.us, i64 %indvars.iv8.us
  store double %64, double* %65, align 8
  %exitcond = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond, label %._crit_edge.us, label %46

._crit_edge.us:                                   ; preds = %46
  %indvars.iv.next4.us = add nuw nsw i64 %indvars.iv39.us, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next4.us, 1000
  br i1 %exitcond17, label %._crit_edge11, label %.preheader.us

._crit_edge11:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_fdtd_2d(i32, i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture, double*) #2 {
.preheader27.lr.ph:
  br label %.preheader27

.preheader27:                                     ; preds = %._crit_edge43, %.preheader27.lr.ph
  %indvars.iv2044 = phi i64 [ 0, %.preheader27.lr.ph ], [ %indvars.iv.next21, %._crit_edge43 ]
  %7 = getelementptr inbounds double, double* %6, i64 %indvars.iv2044
  %8 = bitcast double* %7 to i64*
  br label %.lr.ph.new

.preheader23.us:                                  ; preds = %.preheader23.us.preheader, %._crit_edge.us
  %indvar = phi i64 [ %indvar.next, %._crit_edge.us ], [ 0, %.preheader23.us.preheader ]
  %indvars.iv1031.us = phi i64 [ %indvars.iv.next11.us, %._crit_edge.us ], [ 1, %.preheader23.us.preheader ]
  %9 = add i64 %indvar, 1
  %10 = add nsw i64 %indvars.iv1031.us, -1
  %scevgep140 = getelementptr [1200 x double], [1200 x double]* %4, i64 %9, i64 0
  %scevgep143 = getelementptr [1200 x double], [1200 x double]* %4, i64 %9, i64 1200
  %scevgep146 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvar, i64 0
  %scevgep149 = getelementptr [1200 x double], [1200 x double]* %5, i64 %9, i64 1200
  %bound0151 = icmp ult double* %scevgep140, %scevgep149
  %bound1152 = icmp ult double* %scevgep146, %scevgep143
  %memcheck.conflict154 = and i1 %bound0151, %bound1152
  br i1 %memcheck.conflict154, label %.preheader23.us.new.preheader, label %vector.body130.preheader

vector.body130.preheader:                         ; preds = %.preheader23.us
  br label %vector.body130

vector.body130:                                   ; preds = %vector.body130.preheader, %vector.body130
  %index157 = phi i64 [ %index.next158, %vector.body130 ], [ 0, %vector.body130.preheader ]
  %11 = shl i64 %index157, 1
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1031.us, i64 %11
  %13 = bitcast double* %12 to <4 x double>*
  %wide.vec166 = load <4 x double>, <4 x double>* %13, align 8, !alias.scope !3, !noalias !6
  %strided.vec167 = shufflevector <4 x double> %wide.vec166, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec168 = shufflevector <4 x double> %wide.vec166, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv1031.us, i64 %11
  %15 = bitcast double* %14 to <4 x double>*
  %wide.vec169 = load <4 x double>, <4 x double>* %15, align 8, !alias.scope !6
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %10, i64 %11
  %17 = bitcast double* %16 to <4 x double>*
  %wide.vec172 = load <4 x double>, <4 x double>* %17, align 8, !alias.scope !6
  %18 = fsub <4 x double> %wide.vec169, %wide.vec172
  %19 = shufflevector <4 x double> %18, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %20 = fmul <2 x double> %19, <double 5.000000e-01, double 5.000000e-01>
  %21 = fsub <2 x double> %strided.vec167, %20
  %22 = or i64 %11, 1
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1031.us, i64 %22
  %24 = fsub <4 x double> %wide.vec169, %wide.vec172
  %25 = shufflevector <4 x double> %24, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %26 = fmul <2 x double> %25, <double 5.000000e-01, double 5.000000e-01>
  %27 = fsub <2 x double> %strided.vec168, %26
  %28 = getelementptr double, double* %23, i64 -1
  %29 = bitcast double* %28 to <4 x double>*
  %interleaved.vec175 = shufflevector <2 x double> %21, <2 x double> %27, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec175, <4 x double>* %29, align 8, !alias.scope !3, !noalias !6
  %index.next158 = add i64 %index157, 2
  %30 = icmp eq i64 %index.next158, 600
  br i1 %30, label %middle.block131, label %vector.body130, !llvm.loop !8

middle.block131:                                  ; preds = %vector.body130
  br i1 true, label %._crit_edge.us, label %.preheader23.us.new.preheader

.preheader23.us.new.preheader:                    ; preds = %middle.block131, %.preheader23.us
  %indvars.iv829.us.ph = phi i64 [ 0, %.preheader23.us ], [ 1200, %middle.block131 ]
  br label %.preheader23.us.new

.preheader23.us.new:                              ; preds = %.preheader23.us.new.preheader, %.preheader23.us.new
  %indvars.iv829.us = phi i64 [ %indvars.iv.next9.us.1, %.preheader23.us.new ], [ %indvars.iv829.us.ph, %.preheader23.us.new.preheader ]
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1031.us, i64 %indvars.iv829.us
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv1031.us, i64 %indvars.iv829.us
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %10, i64 %indvars.iv829.us
  %36 = load double, double* %35, align 8
  %37 = fsub double %34, %36
  %38 = fmul double %37, 5.000000e-01
  %39 = fsub double %32, %38
  store double %39, double* %31, align 8
  %indvars.iv.next9.us = or i64 %indvars.iv829.us, 1
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1031.us, i64 %indvars.iv.next9.us
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv1031.us, i64 %indvars.iv.next9.us
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %10, i64 %indvars.iv.next9.us
  %45 = load double, double* %44, align 8
  %46 = fsub double %43, %45
  %47 = fmul double %46, 5.000000e-01
  %48 = fsub double %41, %47
  store double %48, double* %40, align 8
  %indvars.iv.next9.us.1 = add nsw i64 %indvars.iv829.us, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next9.us.1, 1200
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader23.us.new, !llvm.loop !11

._crit_edge.us.loopexit:                          ; preds = %.preheader23.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block131
  %indvars.iv.next11.us = add nuw nsw i64 %indvars.iv1031.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next11.us, 1000
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond, label %.preheader22.us.preheader, label %.preheader23.us

.preheader22.us.preheader:                        ; preds = %._crit_edge.us
  br label %.preheader22.us

.lr.ph.new:                                       ; preds = %.preheader27, %.lr.ph.new
  %indvars.iv28 = phi i64 [ %indvars.iv.next.7, %.lr.ph.new ], [ 0, %.preheader27 ]
  %49 = load i64, i64* %8, align 8
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv28
  %51 = bitcast double* %50 to i64*
  store i64 %49, i64* %51, align 8
  %indvars.iv.next = or i64 %indvars.iv28, 1
  %52 = load i64, i64* %8, align 8
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next
  %54 = bitcast double* %53 to i64*
  store i64 %52, i64* %54, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv28, 2
  %55 = load i64, i64* %8, align 8
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.1
  %57 = bitcast double* %56 to i64*
  store i64 %55, i64* %57, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv28, 3
  %58 = load i64, i64* %8, align 8
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.2
  %60 = bitcast double* %59 to i64*
  store i64 %58, i64* %60, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv28, 4
  %61 = load i64, i64* %8, align 8
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.3
  %63 = bitcast double* %62 to i64*
  store i64 %61, i64* %63, align 8
  %indvars.iv.next.4 = or i64 %indvars.iv28, 5
  %64 = load i64, i64* %8, align 8
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.4
  %66 = bitcast double* %65 to i64*
  store i64 %64, i64* %66, align 8
  %indvars.iv.next.5 = or i64 %indvars.iv28, 6
  %67 = load i64, i64* %8, align 8
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.5
  %69 = bitcast double* %68 to i64*
  store i64 %67, i64* %69, align 8
  %indvars.iv.next.6 = or i64 %indvars.iv28, 7
  %70 = load i64, i64* %8, align 8
  %71 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 0, i64 %indvars.iv.next.6
  %72 = bitcast double* %71 to i64*
  store i64 %70, i64* %72, align 8
  %indvars.iv.next.7 = add nsw i64 %indvars.iv28, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, 1200
  br i1 %exitcond.7, label %.preheader23.us.preheader, label %.lr.ph.new

.preheader23.us.preheader:                        ; preds = %.lr.ph.new
  br label %.preheader23.us

.preheader22.us:                                  ; preds = %.preheader22.us.preheader, %._crit_edge35.us
  %indvars.iv1436.us = phi i64 [ %indvars.iv.next15.us, %._crit_edge35.us ], [ 0, %.preheader22.us.preheader ]
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv1436.us, i64 1
  %74 = load double, double* %73, align 8
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv1436.us, i64 1
  %76 = load double, double* %75, align 8
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv1436.us, i64 0
  %78 = load double, double* %77, align 8
  %79 = fsub double %76, %78
  %80 = fmul double %79, 5.000000e-01
  %81 = fsub double %74, %80
  store double %81, double* %73, align 8
  %scevgep99 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv1436.us, i64 2
  %scevgep102 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv1436.us, i64 1200
  %scevgep105 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv1436.us, i64 1
  %scevgep108 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv1436.us, i64 1200
  %bound0110 = icmp ult double* %scevgep99, %scevgep108
  %bound1111 = icmp ult double* %scevgep105, %scevgep102
  %memcheck.conflict113 = and i1 %bound0110, %bound1111
  br i1 %memcheck.conflict113, label %.preheader22.us.new.preheader, label %vector.body93.preheader

vector.body93.preheader:                          ; preds = %.preheader22.us
  br label %vector.body93

vector.body93:                                    ; preds = %vector.body93.preheader, %vector.body93
  %index116 = phi i64 [ %index.next117, %vector.body93 ], [ 0, %vector.body93.preheader ]
  %82 = shl i64 %index116, 1
  %offset.idx = or i64 %82, 2
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv1436.us, i64 %offset.idx
  %84 = bitcast double* %83 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %84, align 8, !alias.scope !12, !noalias !15
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec123 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv1436.us, i64 %offset.idx
  %86 = getelementptr double, double* %85, i64 -1
  %87 = bitcast double* %86 to <4 x double>*
  %wide.vec124 = load <4 x double>, <4 x double>* %87, align 8, !alias.scope !15
  %strided.vec125 = shufflevector <4 x double> %wide.vec124, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec126 = shufflevector <4 x double> %wide.vec124, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %88 = fsub <2 x double> %strided.vec126, %strided.vec125
  %89 = fmul <2 x double> %88, <double 5.000000e-01, double 5.000000e-01>
  %90 = fsub <2 x double> %strided.vec, %89
  %91 = or i64 %82, 3
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv1436.us, i64 %91
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv1436.us, i64 %91
  %94 = getelementptr double, double* %93, i64 -1
  %95 = bitcast double* %94 to <4 x double>*
  %wide.vec127 = load <4 x double>, <4 x double>* %95, align 8, !alias.scope !15
  %strided.vec128 = shufflevector <4 x double> %wide.vec127, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec129 = shufflevector <4 x double> %wide.vec127, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %96 = fsub <2 x double> %strided.vec129, %strided.vec128
  %97 = fmul <2 x double> %96, <double 5.000000e-01, double 5.000000e-01>
  %98 = fsub <2 x double> %strided.vec123, %97
  %99 = getelementptr double, double* %92, i64 -1
  %100 = bitcast double* %99 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %90, <2 x double> %98, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %100, align 8, !alias.scope !12, !noalias !15
  %index.next117 = add i64 %index116, 2
  %101 = icmp eq i64 %index.next117, 598
  br i1 %101, label %middle.block94, label %vector.body93, !llvm.loop !17

middle.block94:                                   ; preds = %vector.body93
  br i1 false, label %._crit_edge35.us, label %.preheader22.us.new.preheader

.preheader22.us.new.preheader:                    ; preds = %middle.block94, %.preheader22.us
  %indvars.iv1233.us.ph = phi i64 [ 2, %.preheader22.us ], [ 1198, %middle.block94 ]
  br label %.preheader22.us.new

.preheader22.us.new:                              ; preds = %.preheader22.us.new.preheader, %.preheader22.us.new
  %indvars.iv1233.us = phi i64 [ %indvars.iv.next13.us.1, %.preheader22.us.new ], [ %indvars.iv1233.us.ph, %.preheader22.us.new.preheader ]
  %102 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv1436.us, i64 %indvars.iv1233.us
  %103 = load double, double* %102, align 8
  %104 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv1436.us, i64 %indvars.iv1233.us
  %105 = load double, double* %104, align 8
  %106 = add nsw i64 %indvars.iv1233.us, -1
  %107 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv1436.us, i64 %106
  %108 = load double, double* %107, align 8
  %109 = fsub double %105, %108
  %110 = fmul double %109, 5.000000e-01
  %111 = fsub double %103, %110
  store double %111, double* %102, align 8
  %indvars.iv.next13.us = or i64 %indvars.iv1233.us, 1
  %112 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv1436.us, i64 %indvars.iv.next13.us
  %113 = load double, double* %112, align 8
  %114 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv1436.us, i64 %indvars.iv.next13.us
  %115 = load double, double* %114, align 8
  %116 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv1436.us, i64 %indvars.iv1233.us
  %117 = load double, double* %116, align 8
  %118 = fsub double %115, %117
  %119 = fmul double %118, 5.000000e-01
  %120 = fsub double %113, %119
  store double %120, double* %112, align 8
  %indvars.iv.next13.us.1 = add nsw i64 %indvars.iv1233.us, 2
  %exitcond55.1 = icmp eq i64 %indvars.iv.next13.us.1, 1200
  br i1 %exitcond55.1, label %._crit_edge35.us.loopexit, label %.preheader22.us.new, !llvm.loop !18

._crit_edge35.us.loopexit:                        ; preds = %.preheader22.us.new
  br label %._crit_edge35.us

._crit_edge35.us:                                 ; preds = %._crit_edge35.us.loopexit, %middle.block94
  %indvars.iv.next15.us = add nuw nsw i64 %indvars.iv1436.us, 1
  %exitcond60 = icmp eq i64 %indvars.iv.next15.us, 1000
  br i1 %exitcond60, label %.preheader.us.preheader, label %.preheader22.us

.preheader.us.preheader:                          ; preds = %._crit_edge35.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge40.us
  %indvars.iv1841.us = phi i64 [ %indvars.iv.next19.us, %._crit_edge40.us ], [ 0, %.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv1841.us, i64 0
  %scevgep70 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv1841.us, i64 1199
  %scevgep72 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv1841.us, i64 0
  %121 = add i64 %indvars.iv1841.us, 1
  %scevgep74 = getelementptr [1200 x double], [1200 x double]* %3, i64 %121, i64 0
  %scevgep76 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv1841.us, i64 0
  %scevgep78 = getelementptr [1200 x double], [1200 x double]* %4, i64 %121, i64 1199
  %122 = add nuw nsw i64 %indvars.iv1841.us, 1
  %bound0 = icmp ult double* %scevgep, %scevgep74
  %bound1 = icmp ult double* %scevgep72, %scevgep70
  %found.conflict = and i1 %bound0, %bound1
  %bound080 = icmp ult double* %scevgep, %scevgep78
  %bound181 = icmp ult double* %scevgep76, %scevgep70
  %found.conflict82 = and i1 %bound080, %bound181
  %conflict.rdx = or i1 %found.conflict, %found.conflict82
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %123 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv1841.us, i64 %index
  %124 = bitcast double* %123 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %124, align 8, !alias.scope !19, !noalias !22
  %125 = getelementptr double, double* %123, i64 2
  %126 = bitcast double* %125 to <2 x double>*
  %wide.load84 = load <2 x double>, <2 x double>* %126, align 8, !alias.scope !19, !noalias !22
  %127 = or i64 %index, 1
  %128 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv1841.us, i64 %127
  %129 = bitcast double* %128 to <2 x double>*
  %wide.load85 = load <2 x double>, <2 x double>* %129, align 8, !alias.scope !25
  %130 = getelementptr double, double* %128, i64 2
  %131 = bitcast double* %130 to <2 x double>*
  %wide.load86 = load <2 x double>, <2 x double>* %131, align 8, !alias.scope !25
  %132 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv1841.us, i64 %index
  %133 = bitcast double* %132 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %133, align 8, !alias.scope !25
  %134 = getelementptr double, double* %132, i64 2
  %135 = bitcast double* %134 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %135, align 8, !alias.scope !25
  %136 = fsub <2 x double> %wide.load85, %wide.load87
  %137 = fsub <2 x double> %wide.load86, %wide.load88
  %138 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %122, i64 %index
  %139 = bitcast double* %138 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %139, align 8, !alias.scope !26
  %140 = getelementptr double, double* %138, i64 2
  %141 = bitcast double* %140 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %141, align 8, !alias.scope !26
  %142 = fadd <2 x double> %136, %wide.load89
  %143 = fadd <2 x double> %137, %wide.load90
  %144 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1841.us, i64 %index
  %145 = bitcast double* %144 to <2 x double>*
  %wide.load91 = load <2 x double>, <2 x double>* %145, align 8, !alias.scope !26
  %146 = getelementptr double, double* %144, i64 2
  %147 = bitcast double* %146 to <2 x double>*
  %wide.load92 = load <2 x double>, <2 x double>* %147, align 8, !alias.scope !26
  %148 = fsub <2 x double> %142, %wide.load91
  %149 = fsub <2 x double> %143, %wide.load92
  %150 = fmul <2 x double> %148, <double 7.000000e-01, double 7.000000e-01>
  %151 = fmul <2 x double> %149, <double 7.000000e-01, double 7.000000e-01>
  %152 = fsub <2 x double> %wide.load, %150
  %153 = fsub <2 x double> %wide.load84, %151
  %154 = bitcast double* %123 to <2 x double>*
  store <2 x double> %152, <2 x double>* %154, align 8, !alias.scope !19, !noalias !22
  %155 = bitcast double* %125 to <2 x double>*
  store <2 x double> %153, <2 x double>* %155, align 8, !alias.scope !19, !noalias !22
  %index.next = add i64 %index, 4
  %156 = icmp eq i64 %index.next, 1196
  br i1 %156, label %scalar.ph.preheader.loopexit, label %vector.body, !llvm.loop !27

scalar.ph.preheader.loopexit:                     ; preds = %vector.body
  br label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %scalar.ph.preheader.loopexit, %.preheader.us
  %indvars.iv1638.us.ph = phi i64 [ 0, %.preheader.us ], [ 1196, %scalar.ph.preheader.loopexit ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv1638.us = phi i64 [ %indvars.iv.next17.us, %scalar.ph ], [ %indvars.iv1638.us.ph, %scalar.ph.preheader ]
  %157 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv1841.us, i64 %indvars.iv1638.us
  %158 = load double, double* %157, align 8
  %indvars.iv.next17.us = add nuw nsw i64 %indvars.iv1638.us, 1
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv1841.us, i64 %indvars.iv.next17.us
  %160 = load double, double* %159, align 8
  %161 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv1841.us, i64 %indvars.iv1638.us
  %162 = load double, double* %161, align 8
  %163 = fsub double %160, %162
  %164 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %122, i64 %indvars.iv1638.us
  %165 = load double, double* %164, align 8
  %166 = fadd double %163, %165
  %167 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1841.us, i64 %indvars.iv1638.us
  %168 = load double, double* %167, align 8
  %169 = fsub double %166, %168
  %170 = fmul double %169, 7.000000e-01
  %171 = fsub double %158, %170
  store double %171, double* %157, align 8
  %172 = icmp slt i64 %indvars.iv.next17.us, 1199
  br i1 %172, label %scalar.ph, label %._crit_edge40.us, !llvm.loop !28

._crit_edge40.us:                                 ; preds = %scalar.ph
  %indvars.iv.next19.us = add nuw nsw i64 %indvars.iv1841.us, 1
  %173 = icmp slt i64 %indvars.iv.next19.us, 999
  br i1 %173, label %.preheader.us, label %._crit_edge43

._crit_edge43:                                    ; preds = %._crit_edge40.us
  %indvars.iv.next21 = add nuw nsw i64 %indvars.iv2044, 1
  %exitcond61 = icmp eq i64 %indvars.iv.next21, 500
  br i1 %exitcond61, label %._crit_edge45, label %.preheader27

._crit_edge45:                                    ; preds = %._crit_edge43
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) #0 {
.preheader23.us.preheader:
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #5
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader23.us

.preheader23.us:                                  ; preds = %.preheader23.us.preheader, %._crit_edge36.us
  %indvars.iv2037.us = phi i64 [ %indvars.iv.next21.us, %._crit_edge36.us ], [ 0, %.preheader23.us.preheader ]
  %9 = mul nsw i64 %indvars.iv2037.us, 1000
  br label %10

; <label>:10:                                     ; preds = %17, %.preheader23.us
  %indvars.iv1834.us = phi i64 [ 0, %.preheader23.us ], [ %indvars.iv.next19.us, %17 ]
  %11 = add nsw i64 %indvars.iv1834.us, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc11.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %16) #5
  br label %17

; <label>:17:                                     ; preds = %15, %10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv2037.us, i64 %indvars.iv1834.us
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next19.us = add nuw nsw i64 %indvars.iv1834.us, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next19.us, 1200
  br i1 %exitcond48, label %._crit_edge36.us, label %10

._crit_edge36.us:                                 ; preds = %17
  %indvars.iv.next21.us = add nuw nsw i64 %indvars.iv2037.us, 1
  %exitcond49 = icmp eq i64 %indvars.iv.next21.us, 1000
  br i1 %exitcond49, label %._crit_edge39, label %.preheader23.us

._crit_edge39:                                    ; preds = %._crit_edge36.us
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  br label %.preheader22.us

.preheader22.us:                                  ; preds = %._crit_edge39, %._crit_edge30.us
  %indvars.iv1631.us = phi i64 [ %indvars.iv.next17.us, %._crit_edge30.us ], [ 0, %._crit_edge39 ]
  %28 = mul nsw i64 %indvars.iv1631.us, 1000
  br label %29

; <label>:29:                                     ; preds = %36, %.preheader22.us
  %indvars.iv1428.us = phi i64 [ 0, %.preheader22.us ], [ %indvars.iv.next15.us, %36 ]
  %30 = add nsw i64 %indvars.iv1428.us, %28
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, 20
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %36

; <label>:34:                                     ; preds = %29
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc8.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %35) #5
  br label %36

; <label>:36:                                     ; preds = %34, %29
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv1631.us, i64 %indvars.iv1428.us
  %39 = load double, double* %38, align 8
  %40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %39) #6
  %indvars.iv.next15.us = add nuw nsw i64 %indvars.iv1428.us, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next15.us, 1200
  br i1 %exitcond45, label %._crit_edge30.us, label %29

._crit_edge30.us:                                 ; preds = %36
  %indvars.iv.next17.us = add nuw nsw i64 %indvars.iv1631.us, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next17.us, 1000
  br i1 %exitcond46, label %._crit_edge33, label %.preheader22.us

._crit_edge33:                                    ; preds = %._crit_edge30.us
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %44 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %43, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge33, %._crit_edge.us
  %indvars.iv1225.us = phi i64 [ %indvars.iv.next13.us, %._crit_edge.us ], [ 0, %._crit_edge33 ]
  %45 = mul nsw i64 %indvars.iv1225.us, 1000
  br label %46

; <label>:46:                                     ; preds = %53, %.preheader.us
  %indvars.iv24.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %53 ]
  %47 = add nsw i64 %indvars.iv24.us, %45
  %48 = trunc i64 %47 to i32
  %49 = srem i32 %48, 20
  %50 = icmp eq i32 %49, 0
  br i1 %50, label %51, label %53

; <label>:51:                                     ; preds = %46
  %52 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %52) #5
  br label %53

; <label>:53:                                     ; preds = %51, %46
  %54 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv1225.us, i64 %indvars.iv24.us
  %56 = load double, double* %55, align 8
  %57 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %54, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %56) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv24.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, 1200
  br i1 %exitcond, label %._crit_edge.us, label %46

._crit_edge.us:                                   ; preds = %53
  %indvars.iv.next13.us = add nuw nsw i64 %indvars.iv1225.us, 1
  %exitcond43 = icmp eq i64 %indvars.iv.next13.us, 1000
  br i1 %exitcond43, label %._crit_edge27, label %.preheader.us

._crit_edge27:                                    ; preds = %._crit_edge.us
  %58 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %59 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %58, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
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
