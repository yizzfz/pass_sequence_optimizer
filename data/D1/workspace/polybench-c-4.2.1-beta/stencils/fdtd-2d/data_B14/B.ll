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
.lr.ph8.preheader:
  br label %.lr.ph8.prol

.lr.ph8.prol:                                     ; preds = %.lr.ph8.preheader, %.lr.ph8.prol
  %indvars.iv15.prol = phi i64 [ %indvars.iv.next16.prol, %.lr.ph8.prol ], [ 0, %.lr.ph8.preheader ]
  %prol.iter = phi i32 [ %prol.iter.sub, %.lr.ph8.prol ], [ 4, %.lr.ph8.preheader ]
  %7 = trunc i64 %indvars.iv15.prol to i32
  %8 = sitofp i32 %7 to double
  %9 = getelementptr inbounds double, double* %6, i64 %indvars.iv15.prol
  store double %8, double* %9, align 8
  %indvars.iv.next16.prol = add nuw nsw i64 %indvars.iv15.prol, 1
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph8.preheader20, label %.lr.ph8.prol, !llvm.loop !1

.lr.ph8.preheader20:                              ; preds = %.lr.ph8.prol
  br label %.lr.ph8

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %10 = trunc i64 %indvars.iv10 to i32
  %11 = sitofp i32 %10 to double
  %12 = insertelement <2 x double> undef, double %11, i32 0
  %13 = shufflevector <2 x double> %12, <2 x double> undef, <2 x i32> zeroinitializer
  br label %14

; <label>:14:                                     ; preds = %14, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %14 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %15 = trunc i64 %indvars.iv.next to i32
  %16 = sitofp i32 %15 to double
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv10, i64 %indvars.iv
  %18 = add nuw nsw i64 %indvars.iv, 2
  %19 = trunc i64 %18 to i32
  %20 = sitofp i32 %19 to double
  %21 = insertelement <2 x double> undef, double %16, i32 0
  %22 = insertelement <2 x double> %21, double %20, i32 1
  %23 = fmul <2 x double> %13, %22
  %24 = fdiv <2 x double> %23, <double 1.000000e+03, double 1.200000e+03>
  %25 = extractelement <2 x double> %24, i32 0
  %26 = extractelement <2 x double> %24, i32 1
  store double %25, double* %17, align 8
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv10, i64 %indvars.iv
  store double %26, double* %27, align 8
  %28 = add nuw nsw i64 %indvars.iv, 3
  %29 = trunc i64 %28 to i32
  %30 = sitofp i32 %29 to double
  %31 = fmul double %11, %30
  %32 = fdiv double %31, 1.000000e+03
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv10, i64 %indvars.iv
  store double %32, double* %33, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %14

._crit_edge.us:                                   ; preds = %14
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next11, 1000
  br i1 %exitcond13, label %._crit_edge6, label %.preheader.us

.lr.ph8:                                          ; preds = %.lr.ph8.preheader20, %.lr.ph8
  %indvars.iv15 = phi i64 [ %indvars.iv.next16.7, %.lr.ph8 ], [ 4, %.lr.ph8.preheader20 ]
  %34 = trunc i64 %indvars.iv15 to i32
  %35 = sitofp i32 %34 to double
  %36 = getelementptr inbounds double, double* %6, i64 %indvars.iv15
  %37 = bitcast double* %36 to <2 x double>*
  %38 = trunc i64 %indvars.iv15 to i32
  %39 = or i32 %38, 1
  %40 = sitofp i32 %39 to double
  %41 = insertelement <2 x double> undef, double %35, i32 0
  %42 = insertelement <2 x double> %41, double %40, i32 1
  store <2 x double> %42, <2 x double>* %37, align 8
  %indvars.iv.next16.1 = or i64 %indvars.iv15, 2
  %43 = trunc i64 %indvars.iv.next16.1 to i32
  %44 = sitofp i32 %43 to double
  %45 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next16.1
  %46 = bitcast double* %45 to <2 x double>*
  %47 = trunc i64 %indvars.iv15 to i32
  %48 = or i32 %47, 3
  %49 = sitofp i32 %48 to double
  %50 = insertelement <2 x double> undef, double %44, i32 0
  %51 = insertelement <2 x double> %50, double %49, i32 1
  store <2 x double> %51, <2 x double>* %46, align 8
  %indvars.iv.next16.3 = add nsw i64 %indvars.iv15, 4
  %52 = trunc i64 %indvars.iv.next16.3 to i32
  %53 = sitofp i32 %52 to double
  %54 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next16.3
  %55 = bitcast double* %54 to <2 x double>*
  %indvars.iv.next16.4 = add nsw i64 %indvars.iv15, 5
  %56 = trunc i64 %indvars.iv.next16.4 to i32
  %57 = sitofp i32 %56 to double
  %58 = insertelement <2 x double> undef, double %53, i32 0
  %59 = insertelement <2 x double> %58, double %57, i32 1
  store <2 x double> %59, <2 x double>* %55, align 8
  %indvars.iv.next16.5 = add nsw i64 %indvars.iv15, 6
  %60 = trunc i64 %indvars.iv.next16.5 to i32
  %61 = sitofp i32 %60 to double
  %62 = getelementptr inbounds double, double* %6, i64 %indvars.iv.next16.5
  %63 = bitcast double* %62 to <2 x double>*
  %indvars.iv.next16.6 = add nsw i64 %indvars.iv15, 7
  %64 = trunc i64 %indvars.iv.next16.6 to i32
  %65 = sitofp i32 %64 to double
  %66 = insertelement <2 x double> undef, double %61, i32 0
  %67 = insertelement <2 x double> %66, double %65, i32 1
  store <2 x double> %67, <2 x double>* %63, align 8
  %indvars.iv.next16.7 = add nsw i64 %indvars.iv15, 8
  %exitcond18.7 = icmp eq i64 %indvars.iv.next16.7, 500
  br i1 %exitcond18.7, label %.preheader.us.preheader, label %.lr.ph8

.preheader.us.preheader:                          ; preds = %.lr.ph8
  br label %.preheader.us

._crit_edge6:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_fdtd_2d(i32, i32, i32, [1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture, double*) #2 {
.preheader13.lr.ph:
  br label %.preheader13

.preheader13:                                     ; preds = %._crit_edge22, %.preheader13.lr.ph
  %indvars.iv61 = phi i64 [ 0, %.preheader13.lr.ph ], [ %indvars.iv.next62, %._crit_edge22 ]
  %7 = getelementptr inbounds double, double* %6, i64 %indvars.iv61
  %8 = bitcast double* %7 to i64*
  br label %.lr.ph.new

.preheader9.us:                                   ; preds = %.preheader9.us.preheader, %._crit_edge.us
  %indvar = phi i64 [ %indvar.next, %._crit_edge.us ], [ 0, %.preheader9.us.preheader ]
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %._crit_edge.us ], [ 1, %.preheader9.us.preheader ]
  %9 = add nuw nsw i64 %indvar, 1
  %10 = add nsw i64 %indvars.iv36, -1
  %scevgep143 = getelementptr [1200 x double], [1200 x double]* %4, i64 %9, i64 0
  %scevgep146 = getelementptr [1200 x double], [1200 x double]* %4, i64 %9, i64 1200
  %scevgep149 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvar, i64 0
  %scevgep152 = getelementptr [1200 x double], [1200 x double]* %5, i64 %9, i64 1200
  %bound0154 = icmp ult double* %scevgep143, %scevgep152
  %bound1155 = icmp ult double* %scevgep149, %scevgep146
  %memcheck.conflict157 = and i1 %bound0154, %bound1155
  br i1 %memcheck.conflict157, label %.preheader9.us.new.preheader, label %vector.body133.preheader

vector.body133.preheader:                         ; preds = %.preheader9.us
  br label %vector.body133

vector.body133:                                   ; preds = %vector.body133.preheader, %vector.body133
  %index160 = phi i64 [ %index.next161, %vector.body133 ], [ 0, %vector.body133.preheader ]
  %11 = shl i64 %index160, 1
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv36, i64 %11
  %13 = bitcast double* %12 to <4 x double>*
  %wide.vec169 = load <4 x double>, <4 x double>* %13, align 8, !alias.scope !3, !noalias !6
  %strided.vec170 = shufflevector <4 x double> %wide.vec169, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec171 = shufflevector <4 x double> %wide.vec169, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %14 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv36, i64 %11
  %15 = bitcast double* %14 to <4 x double>*
  %wide.vec172 = load <4 x double>, <4 x double>* %15, align 8, !alias.scope !6
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %10, i64 %11
  %17 = bitcast double* %16 to <4 x double>*
  %wide.vec175 = load <4 x double>, <4 x double>* %17, align 8, !alias.scope !6
  %18 = fsub <4 x double> %wide.vec172, %wide.vec175
  %19 = shufflevector <4 x double> %18, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %20 = fmul <2 x double> %19, <double 5.000000e-01, double 5.000000e-01>
  %21 = fsub <2 x double> %strided.vec170, %20
  %22 = or i64 %11, 1
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv36, i64 %22
  %24 = fsub <4 x double> %wide.vec172, %wide.vec175
  %25 = shufflevector <4 x double> %24, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %26 = fmul <2 x double> %25, <double 5.000000e-01, double 5.000000e-01>
  %27 = fsub <2 x double> %strided.vec171, %26
  %28 = getelementptr double, double* %23, i64 -1
  %29 = bitcast double* %28 to <4 x double>*
  %interleaved.vec178 = shufflevector <2 x double> %21, <2 x double> %27, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec178, <4 x double>* %29, align 8, !alias.scope !3, !noalias !6
  %index.next161 = add i64 %index160, 2
  %30 = icmp eq i64 %index.next161, 600
  br i1 %30, label %middle.block134, label %vector.body133, !llvm.loop !8

middle.block134:                                  ; preds = %vector.body133
  br i1 true, label %._crit_edge.us, label %.preheader9.us.new.preheader

.preheader9.us.new.preheader:                     ; preds = %middle.block134, %.preheader9.us
  %indvars.iv28.ph = phi i64 [ 0, %.preheader9.us ], [ 1200, %middle.block134 ]
  br label %.preheader9.us.new

.preheader9.us.new:                               ; preds = %.preheader9.us.new.preheader, %.preheader9.us.new
  %indvars.iv28 = phi i64 [ %indvars.iv.next29.1, %.preheader9.us.new ], [ %indvars.iv28.ph, %.preheader9.us.new.preheader ]
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv36, i64 %indvars.iv28
  %32 = load double, double* %31, align 8
  %33 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv36, i64 %indvars.iv28
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %10, i64 %indvars.iv28
  %36 = load double, double* %35, align 8
  %37 = fsub double %34, %36
  %38 = fmul double %37, 5.000000e-01
  %39 = fsub double %32, %38
  store double %39, double* %31, align 8
  %indvars.iv.next29 = or i64 %indvars.iv28, 1
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv36, i64 %indvars.iv.next29
  %41 = load double, double* %40, align 8
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv36, i64 %indvars.iv.next29
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %10, i64 %indvars.iv.next29
  %45 = load double, double* %44, align 8
  %46 = fsub double %43, %45
  %47 = fmul double %46, 5.000000e-01
  %48 = fsub double %41, %47
  store double %48, double* %40, align 8
  %indvars.iv.next29.1 = add nsw i64 %indvars.iv28, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next29.1, 1200
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader9.us.new, !llvm.loop !11

._crit_edge.us.loopexit:                          ; preds = %.preheader9.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block134
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond = icmp eq i64 %indvars.iv.next37, 1000
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %exitcond, label %.preheader8.us.preheader, label %.preheader9.us

.preheader8.us.preheader:                         ; preds = %._crit_edge.us
  br label %.preheader8.us

.lr.ph.new:                                       ; preds = %.preheader13, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.next.7, %.lr.ph.new ], [ 0, %.preheader13 ]
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
  br i1 %exitcond.7, label %.preheader9.us.preheader, label %.lr.ph.new

.preheader9.us.preheader:                         ; preds = %.lr.ph.new
  br label %.preheader9.us

.preheader8.us:                                   ; preds = %.preheader8.us.preheader, %._crit_edge17.us
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %._crit_edge17.us ], [ 0, %.preheader8.us.preheader ]
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv48, i64 1
  %74 = load double, double* %73, align 8
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv48, i64 1
  %76 = load double, double* %75, align 8
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv48, i64 0
  %78 = load double, double* %77, align 8
  %79 = fsub double %76, %78
  %80 = fmul double %79, 5.000000e-01
  %81 = fsub double %74, %80
  store double %81, double* %73, align 8
  %scevgep102 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv48, i64 2
  %scevgep105 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv48, i64 1200
  %scevgep108 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv48, i64 1
  %scevgep111 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv48, i64 1200
  %bound0113 = icmp ult double* %scevgep102, %scevgep111
  %bound1114 = icmp ult double* %scevgep108, %scevgep105
  %memcheck.conflict116 = and i1 %bound0113, %bound1114
  br i1 %memcheck.conflict116, label %.preheader8.us.new.preheader, label %vector.body96.preheader

vector.body96.preheader:                          ; preds = %.preheader8.us
  br label %vector.body96

vector.body96:                                    ; preds = %vector.body96.preheader, %vector.body96
  %index119 = phi i64 [ %index.next120, %vector.body96 ], [ 0, %vector.body96.preheader ]
  %82 = shl i64 %index119, 1
  %offset.idx = or i64 %82, 2
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv48, i64 %offset.idx
  %84 = bitcast double* %83 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %84, align 8, !alias.scope !12, !noalias !15
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec126 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv48, i64 %offset.idx
  %86 = getelementptr double, double* %85, i64 -1
  %87 = bitcast double* %86 to <4 x double>*
  %wide.vec127 = load <4 x double>, <4 x double>* %87, align 8, !alias.scope !15
  %strided.vec128 = shufflevector <4 x double> %wide.vec127, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec129 = shufflevector <4 x double> %wide.vec127, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %88 = fsub <2 x double> %strided.vec129, %strided.vec128
  %89 = fmul <2 x double> %88, <double 5.000000e-01, double 5.000000e-01>
  %90 = fsub <2 x double> %strided.vec, %89
  %91 = or i64 %82, 3
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv48, i64 %91
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv48, i64 %91
  %94 = getelementptr double, double* %93, i64 -1
  %95 = bitcast double* %94 to <4 x double>*
  %wide.vec130 = load <4 x double>, <4 x double>* %95, align 8, !alias.scope !15
  %strided.vec131 = shufflevector <4 x double> %wide.vec130, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec132 = shufflevector <4 x double> %wide.vec130, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %96 = fsub <2 x double> %strided.vec132, %strided.vec131
  %97 = fmul <2 x double> %96, <double 5.000000e-01, double 5.000000e-01>
  %98 = fsub <2 x double> %strided.vec126, %97
  %99 = getelementptr double, double* %92, i64 -1
  %100 = bitcast double* %99 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %90, <2 x double> %98, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %100, align 8, !alias.scope !12, !noalias !15
  %index.next120 = add i64 %index119, 2
  %101 = icmp eq i64 %index.next120, 598
  br i1 %101, label %middle.block97, label %vector.body96, !llvm.loop !17

middle.block97:                                   ; preds = %vector.body96
  br i1 false, label %._crit_edge17.us, label %.preheader8.us.new.preheader

.preheader8.us.new.preheader:                     ; preds = %middle.block97, %.preheader8.us
  %indvars.iv40.ph = phi i64 [ 2, %.preheader8.us ], [ 1198, %middle.block97 ]
  br label %.preheader8.us.new

.preheader8.us.new:                               ; preds = %.preheader8.us.new.preheader, %.preheader8.us.new
  %indvars.iv40 = phi i64 [ %indvars.iv.next41.1, %.preheader8.us.new ], [ %indvars.iv40.ph, %.preheader8.us.new.preheader ]
  %102 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv48, i64 %indvars.iv40
  %103 = load double, double* %102, align 8
  %104 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv48, i64 %indvars.iv40
  %105 = load double, double* %104, align 8
  %106 = add nsw i64 %indvars.iv40, -1
  %107 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv48, i64 %106
  %108 = load double, double* %107, align 8
  %109 = fsub double %105, %108
  %110 = fmul double %109, 5.000000e-01
  %111 = fsub double %103, %110
  store double %111, double* %102, align 8
  %indvars.iv.next41 = or i64 %indvars.iv40, 1
  %112 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv48, i64 %indvars.iv.next41
  %113 = load double, double* %112, align 8
  %114 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv48, i64 %indvars.iv.next41
  %115 = load double, double* %114, align 8
  %116 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv48, i64 %indvars.iv40
  %117 = load double, double* %116, align 8
  %118 = fsub double %115, %117
  %119 = fmul double %118, 5.000000e-01
  %120 = fsub double %113, %119
  store double %120, double* %112, align 8
  %indvars.iv.next41.1 = add nsw i64 %indvars.iv40, 2
  %exitcond43.1 = icmp eq i64 %indvars.iv.next41.1, 1200
  br i1 %exitcond43.1, label %._crit_edge17.us.loopexit, label %.preheader8.us.new, !llvm.loop !18

._crit_edge17.us.loopexit:                        ; preds = %.preheader8.us.new
  br label %._crit_edge17.us

._crit_edge17.us:                                 ; preds = %._crit_edge17.us.loopexit, %middle.block97
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next49, 1000
  br i1 %exitcond51, label %.preheader.us.preheader, label %.preheader8.us

.preheader.us.preheader:                          ; preds = %._crit_edge17.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge20.us
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %._crit_edge20.us ], [ 0, %.preheader.us.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv57, i64 0
  %scevgep73 = getelementptr [1200 x double], [1200 x double]* %5, i64 %indvars.iv57, i64 1199
  %scevgep75 = getelementptr [1200 x double], [1200 x double]* %3, i64 %indvars.iv57, i64 0
  %121 = add nuw nsw i64 %indvars.iv57, 1
  %scevgep77 = getelementptr [1200 x double], [1200 x double]* %3, i64 %121, i64 0
  %scevgep79 = getelementptr [1200 x double], [1200 x double]* %4, i64 %indvars.iv57, i64 0
  %scevgep81 = getelementptr [1200 x double], [1200 x double]* %4, i64 %121, i64 1199
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %bound0 = icmp ult double* %scevgep, %scevgep77
  %bound1 = icmp ult double* %scevgep75, %scevgep73
  %found.conflict = and i1 %bound0, %bound1
  %bound083 = icmp ult double* %scevgep, %scevgep81
  %bound184 = icmp ult double* %scevgep79, %scevgep73
  %found.conflict85 = and i1 %bound083, %bound184
  %conflict.rdx = or i1 %found.conflict, %found.conflict85
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %122 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv57, i64 %index
  %123 = bitcast double* %122 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %123, align 8, !alias.scope !19, !noalias !22
  %124 = getelementptr double, double* %122, i64 2
  %125 = bitcast double* %124 to <2 x double>*
  %wide.load87 = load <2 x double>, <2 x double>* %125, align 8, !alias.scope !19, !noalias !22
  %126 = or i64 %index, 1
  %127 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv57, i64 %126
  %128 = bitcast double* %127 to <2 x double>*
  %wide.load88 = load <2 x double>, <2 x double>* %128, align 8, !alias.scope !25
  %129 = getelementptr double, double* %127, i64 2
  %130 = bitcast double* %129 to <2 x double>*
  %wide.load89 = load <2 x double>, <2 x double>* %130, align 8, !alias.scope !25
  %131 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv57, i64 %index
  %132 = bitcast double* %131 to <2 x double>*
  %wide.load90 = load <2 x double>, <2 x double>* %132, align 8, !alias.scope !25
  %133 = getelementptr double, double* %131, i64 2
  %134 = bitcast double* %133 to <2 x double>*
  %wide.load91 = load <2 x double>, <2 x double>* %134, align 8, !alias.scope !25
  %135 = fsub <2 x double> %wide.load88, %wide.load90
  %136 = fsub <2 x double> %wide.load89, %wide.load91
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next58, i64 %index
  %138 = bitcast double* %137 to <2 x double>*
  %wide.load92 = load <2 x double>, <2 x double>* %138, align 8, !alias.scope !26
  %139 = getelementptr double, double* %137, i64 2
  %140 = bitcast double* %139 to <2 x double>*
  %wide.load93 = load <2 x double>, <2 x double>* %140, align 8, !alias.scope !26
  %141 = fadd <2 x double> %135, %wide.load92
  %142 = fadd <2 x double> %136, %wide.load93
  %143 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv57, i64 %index
  %144 = bitcast double* %143 to <2 x double>*
  %wide.load94 = load <2 x double>, <2 x double>* %144, align 8, !alias.scope !26
  %145 = getelementptr double, double* %143, i64 2
  %146 = bitcast double* %145 to <2 x double>*
  %wide.load95 = load <2 x double>, <2 x double>* %146, align 8, !alias.scope !26
  %147 = fsub <2 x double> %141, %wide.load94
  %148 = fsub <2 x double> %142, %wide.load95
  %149 = fmul <2 x double> %147, <double 7.000000e-01, double 7.000000e-01>
  %150 = fmul <2 x double> %148, <double 7.000000e-01, double 7.000000e-01>
  %151 = fsub <2 x double> %wide.load, %149
  %152 = fsub <2 x double> %wide.load87, %150
  %153 = bitcast double* %122 to <2 x double>*
  store <2 x double> %151, <2 x double>* %153, align 8, !alias.scope !19, !noalias !22
  %154 = bitcast double* %124 to <2 x double>*
  store <2 x double> %152, <2 x double>* %154, align 8, !alias.scope !19, !noalias !22
  %index.next = add nuw nsw i64 %index, 4
  %155 = icmp eq i64 %index.next, 1196
  br i1 %155, label %scalar.ph.preheader.loopexit, label %vector.body, !llvm.loop !27

scalar.ph.preheader.loopexit:                     ; preds = %vector.body
  br label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %scalar.ph.preheader.loopexit, %.preheader.us
  %indvars.iv53.ph = phi i64 [ 0, %.preheader.us ], [ 1196, %scalar.ph.preheader.loopexit ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv53 = phi i64 [ %indvars.iv.next54, %scalar.ph ], [ %indvars.iv53.ph, %scalar.ph.preheader ]
  %156 = getelementptr inbounds [1200 x double], [1200 x double]* %5, i64 %indvars.iv57, i64 %indvars.iv53
  %157 = load double, double* %156, align 8
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %158 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv57, i64 %indvars.iv.next54
  %159 = load double, double* %158, align 8
  %160 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv57, i64 %indvars.iv53
  %161 = load double, double* %160, align 8
  %162 = fsub double %159, %161
  %163 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv.next58, i64 %indvars.iv53
  %164 = load double, double* %163, align 8
  %165 = fadd double %162, %164
  %166 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv57, i64 %indvars.iv53
  %167 = load double, double* %166, align 8
  %168 = fsub double %165, %167
  %169 = fmul double %168, 7.000000e-01
  %170 = fsub double %157, %169
  store double %170, double* %156, align 8
  %exitcond56 = icmp eq i64 %indvars.iv.next54, 1199
  br i1 %exitcond56, label %._crit_edge20.us, label %scalar.ph, !llvm.loop !28

._crit_edge20.us:                                 ; preds = %scalar.ph
  %exitcond60 = icmp eq i64 %indvars.iv.next58, 999
  br i1 %exitcond60, label %._crit_edge22, label %.preheader.us

._crit_edge22:                                    ; preds = %._crit_edge20.us
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next62, 500
  br i1 %exitcond64, label %._crit_edge24, label %.preheader13

._crit_edge24:                                    ; preds = %._crit_edge22
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) #0 {
.preheader13.us.preheader:
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %5) #5
  %7 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %8 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %7, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader13.us

.preheader13.us:                                  ; preds = %._crit_edge21.us, %.preheader13.us.preheader
  %indvars.iv45 = phi i64 [ 0, %.preheader13.us.preheader ], [ %indvars.iv.next46, %._crit_edge21.us ]
  %9 = mul nuw nsw i64 %indvars.iv45, 1000
  br label %10

; <label>:10:                                     ; preds = %17, %.preheader13.us
  %indvars.iv41 = phi i64 [ 0, %.preheader13.us ], [ %indvars.iv.next42, %17 ]
  %11 = add nuw nsw i64 %indvars.iv41, %9
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
  %19 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv45, i64 %indvars.iv41
  %20 = load double, double* %19, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next42, 1200
  br i1 %exitcond44, label %._crit_edge21.us, label %10

._crit_edge21.us:                                 ; preds = %17
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next46, 1000
  br i1 %exitcond48, label %._crit_edge23, label %.preheader13.us

._crit_edge23:                                    ; preds = %._crit_edge21.us
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  br label %.preheader12.us

.preheader12.us:                                  ; preds = %._crit_edge17.us, %._crit_edge23
  %indvars.iv36 = phi i64 [ 0, %._crit_edge23 ], [ %indvars.iv.next37, %._crit_edge17.us ]
  %28 = mul nuw nsw i64 %indvars.iv36, 1000
  br label %29

; <label>:29:                                     ; preds = %36, %.preheader12.us
  %indvars.iv32 = phi i64 [ 0, %.preheader12.us ], [ %indvars.iv.next33, %36 ]
  %30 = add nuw nsw i64 %indvars.iv32, %28
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
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %3, i64 %indvars.iv36, i64 %indvars.iv32
  %39 = load double, double* %38, align 8
  %40 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %39) #6
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond35 = icmp eq i64 %indvars.iv.next33, 1200
  br i1 %exitcond35, label %._crit_edge17.us, label %29

._crit_edge17.us:                                 ; preds = %36
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond39 = icmp eq i64 %indvars.iv.next37, 1000
  br i1 %exitcond39, label %._crit_edge19, label %.preheader12.us

._crit_edge19:                                    ; preds = %._crit_edge17.us
  %41 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %42 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %41, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %43 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %44 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %43, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %._crit_edge19
  %indvars.iv27 = phi i64 [ 0, %._crit_edge19 ], [ %indvars.iv.next28, %._crit_edge.us ]
  %45 = mul nuw nsw i64 %indvars.iv27, 1000
  br label %46

; <label>:46:                                     ; preds = %53, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %53 ]
  %47 = add nuw nsw i64 %indvars.iv, %45
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
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %4, i64 %indvars.iv27, i64 %indvars.iv
  %56 = load double, double* %55, align 8
  %57 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %54, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %56) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %46

._crit_edge.us:                                   ; preds = %53
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond30 = icmp eq i64 %indvars.iv.next28, 1000
  br i1 %exitcond30, label %._crit_edge15, label %.preheader.us

._crit_edge15:                                    ; preds = %._crit_edge.us
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
