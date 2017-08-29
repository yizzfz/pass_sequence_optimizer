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
.lr.ph7.preheader:
  %4 = alloca [1200 x double]*, align 8
  store [1200 x double]* %2, [1200 x double]** %4, align 8
  br label %.lr.ph7.prol

.lr.ph7.prol:                                     ; preds = %.lr.ph7.prol..lr.ph7.prol_crit_edge, %.lr.ph7.preheader
  %indvars.iv14.prol = phi i64 [ 0, %.lr.ph7.preheader ], [ %indvars.iv.next15.prol, %.lr.ph7.prol..lr.ph7.prol_crit_edge ]
  %prol.iter = phi i32 [ 4, %.lr.ph7.preheader ], [ %prol.iter.sub, %.lr.ph7.prol..lr.ph7.prol_crit_edge ]
  %5 = trunc i64 %indvars.iv14.prol to i32
  %6 = sitofp i32 %5 to double
  %7 = getelementptr inbounds double, double* %3, i64 %indvars.iv14.prol
  store double %6, double* %7, align 8
  %prol.iter.sub = add nsw i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph7.preheader1, label %.lr.ph7.prol..lr.ph7.prol_crit_edge, !llvm.loop !1

.lr.ph7.preheader1:                               ; preds = %.lr.ph7.prol
  br label %.lr.ph7

.lr.ph7.prol..lr.ph7.prol_crit_edge:              ; preds = %.lr.ph7.prol
  %indvars.iv.next15.prol = add nuw nsw i64 %indvars.iv14.prol, 1
  br label %.lr.ph7.prol

.preheader.lr.ph:                                 ; preds = %.lr.ph7
  %8 = load [1200 x double]*, [1200 x double]** %4, align 8
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv9 = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next10, %._crit_edge.us ]
  %9 = trunc i64 %indvars.iv9 to i32
  %10 = sitofp i32 %9 to double
  %11 = insertelement <2 x double> undef, double %10, i32 0
  %12 = shufflevector <2 x double> %11, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %13 = trunc i64 %indvars.iv.next to i32
  %14 = sitofp i32 %13 to double
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv9, i64 %indvars.iv
  %16 = add nuw nsw i64 %indvars.iv, 2
  %17 = trunc i64 %16 to i32
  %18 = sitofp i32 %17 to double
  %19 = insertelement <2 x double> undef, double %14, i32 0
  %20 = insertelement <2 x double> %19, double %18, i32 1
  %21 = fmul <2 x double> %12, %20
  %22 = fdiv <2 x double> %21, <double 1.000000e+03, double 1.200000e+03>
  %23 = extractelement <2 x double> %22, i32 0
  %24 = extractelement <2 x double> %22, i32 1
  store double %23, double* %15, align 8
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv9, i64 %indvars.iv
  store double %24, double* %25, align 8
  %26 = add nuw nsw i64 %indvars.iv, 3
  %27 = trunc i64 %26 to i32
  %28 = sitofp i32 %27 to double
  %29 = fmul double %10, %28
  %30 = fdiv double %29, 1.000000e+03
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %8, i64 %indvars.iv9, i64 %indvars.iv
  store double %30, double* %31, align 8
  %exitcond18 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond18, label %._crit_edge.us, label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond = icmp eq i64 %indvars.iv.next10, 1000
  br i1 %exitcond, label %._crit_edge5, label %.preheader.us

.lr.ph7:                                          ; preds = %.lr.ph7.preheader1, %.lr.ph7
  %indvars.iv14 = phi i64 [ %indvars.iv.next15.7, %.lr.ph7 ], [ 4, %.lr.ph7.preheader1 ]
  %32 = trunc i64 %indvars.iv14 to i32
  %33 = sitofp i32 %32 to double
  %34 = getelementptr inbounds double, double* %3, i64 %indvars.iv14
  %35 = bitcast double* %34 to <2 x double>*
  %36 = trunc i64 %indvars.iv14 to i32
  %37 = or i32 %36, 1
  %38 = sitofp i32 %37 to double
  %39 = insertelement <2 x double> undef, double %33, i32 0
  %40 = insertelement <2 x double> %39, double %38, i32 1
  store <2 x double> %40, <2 x double>* %35, align 8
  %indvars.iv.next15.1 = or i64 %indvars.iv14, 2
  %41 = trunc i64 %indvars.iv.next15.1 to i32
  %42 = sitofp i32 %41 to double
  %43 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next15.1
  %44 = bitcast double* %43 to <2 x double>*
  %45 = trunc i64 %indvars.iv14 to i32
  %46 = or i32 %45, 3
  %47 = sitofp i32 %46 to double
  %48 = insertelement <2 x double> undef, double %42, i32 0
  %49 = insertelement <2 x double> %48, double %47, i32 1
  store <2 x double> %49, <2 x double>* %44, align 8
  %indvars.iv.next15.3 = add nuw nsw i64 %indvars.iv14, 4
  %50 = trunc i64 %indvars.iv.next15.3 to i32
  %51 = sitofp i32 %50 to double
  %52 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next15.3
  %53 = bitcast double* %52 to <2 x double>*
  %indvars.iv.next15.4 = add nuw nsw i64 %indvars.iv14, 5
  %54 = trunc i64 %indvars.iv.next15.4 to i32
  %55 = sitofp i32 %54 to double
  %56 = insertelement <2 x double> undef, double %51, i32 0
  %57 = insertelement <2 x double> %56, double %55, i32 1
  store <2 x double> %57, <2 x double>* %53, align 8
  %indvars.iv.next15.5 = add nuw nsw i64 %indvars.iv14, 6
  %58 = trunc i64 %indvars.iv.next15.5 to i32
  %59 = sitofp i32 %58 to double
  %60 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next15.5
  %61 = bitcast double* %60 to <2 x double>*
  %indvars.iv.next15.6 = add nuw nsw i64 %indvars.iv14, 7
  %62 = trunc i64 %indvars.iv.next15.6 to i32
  %63 = sitofp i32 %62 to double
  %64 = insertelement <2 x double> undef, double %59, i32 0
  %65 = insertelement <2 x double> %64, double %63, i32 1
  store <2 x double> %65, <2 x double>* %61, align 8
  %indvars.iv.next15.7 = add nuw nsw i64 %indvars.iv14, 8
  %exitcond17.7 = icmp eq i64 %indvars.iv.next15.7, 500
  br i1 %exitcond17.7, label %.preheader.lr.ph, label %.lr.ph7

._crit_edge5:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_fdtd_2d([1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture, double*) #2 {
.preheader13.lr.ph:
  br label %.preheader13

.preheader13:                                     ; preds = %._crit_edge22, %.preheader13.lr.ph
  %indvars.iv61 = phi i64 [ 0, %.preheader13.lr.ph ], [ %indvars.iv.next62, %._crit_edge22 ]
  %4 = getelementptr inbounds double, double* %3, i64 %indvars.iv61
  %5 = bitcast double* %4 to i64*
  br label %.lr.ph.new

.preheader9.us:                                   ; preds = %.preheader9.us.preheader, %._crit_edge.us
  %indvars.iv36 = phi i64 [ %indvars.iv.next37, %._crit_edge.us ], [ 1, %.preheader9.us.preheader ]
  %6 = add nsw i64 %indvars.iv36, -1
  br label %.preheader9.us.new

.preheader9.us.new:                               ; preds = %.preheader9.us.new, %.preheader9.us
  %indvars.iv28 = phi i64 [ 0, %.preheader9.us ], [ %indvars.iv.next29.1, %.preheader9.us.new ]
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv36, i64 %indvars.iv28
  %8 = load double, double* %7, align 8
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv36, i64 %indvars.iv28
  %10 = load double, double* %9, align 8
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %6, i64 %indvars.iv28
  %12 = load double, double* %11, align 8
  %13 = fsub double %10, %12
  %14 = fmul double %13, 5.000000e-01
  %15 = fsub double %8, %14
  store double %15, double* %7, align 8
  %indvars.iv.next29 = or i64 %indvars.iv28, 1
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv36, i64 %indvars.iv.next29
  %17 = load double, double* %16, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv36, i64 %indvars.iv.next29
  %19 = load double, double* %18, align 8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %6, i64 %indvars.iv.next29
  %21 = load double, double* %20, align 8
  %22 = fsub double %19, %21
  %23 = fmul double %22, 5.000000e-01
  %24 = fsub double %17, %23
  store double %24, double* %16, align 8
  %indvars.iv.next29.1 = add nuw nsw i64 %indvars.iv28, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next29.1, 1200
  br i1 %exitcond.1, label %._crit_edge.us, label %.preheader9.us.new

._crit_edge.us:                                   ; preds = %.preheader9.us.new
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next37, 1000
  br i1 %exitcond65, label %.preheader8.us.preheader, label %.preheader9.us

.preheader8.us.preheader:                         ; preds = %._crit_edge.us
  br label %.preheader8.us

.lr.ph.new:                                       ; preds = %.lr.ph.new, %.preheader13
  %indvars.iv = phi i64 [ 0, %.preheader13 ], [ %indvars.iv.next.7, %.lr.ph.new ]
  %25 = load i64, i64* %5, align 8
  %26 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv
  %27 = bitcast double* %26 to i64*
  store i64 %25, i64* %27, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %28 = load i64, i64* %5, align 8
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next
  %30 = bitcast double* %29 to i64*
  store i64 %28, i64* %30, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %31 = load i64, i64* %5, align 8
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.1
  %33 = bitcast double* %32 to i64*
  store i64 %31, i64* %33, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %34 = load i64, i64* %5, align 8
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.2
  %36 = bitcast double* %35 to i64*
  store i64 %34, i64* %36, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %37 = load i64, i64* %5, align 8
  %38 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.3
  %39 = bitcast double* %38 to i64*
  store i64 %37, i64* %39, align 8
  %indvars.iv.next.4 = or i64 %indvars.iv, 5
  %40 = load i64, i64* %5, align 8
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.4
  %42 = bitcast double* %41 to i64*
  store i64 %40, i64* %42, align 8
  %indvars.iv.next.5 = or i64 %indvars.iv, 6
  %43 = load i64, i64* %5, align 8
  %44 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.5
  %45 = bitcast double* %44 to i64*
  store i64 %43, i64* %45, align 8
  %indvars.iv.next.6 = or i64 %indvars.iv, 7
  %46 = load i64, i64* %5, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.6
  %48 = bitcast double* %47 to i64*
  store i64 %46, i64* %48, align 8
  %indvars.iv.next.7 = add nuw nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, 1200
  br i1 %exitcond.7, label %.preheader9.us.preheader, label %.lr.ph.new

.preheader9.us.preheader:                         ; preds = %.lr.ph.new
  br label %.preheader9.us

.preheader8.us:                                   ; preds = %.preheader8.us.preheader, %._crit_edge17.us
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %._crit_edge17.us ], [ 0, %.preheader8.us.preheader ]
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv48, i64 1
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv48, i64 1
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv48, i64 0
  %54 = load double, double* %53, align 8
  %55 = fsub double %52, %54
  %56 = fmul double %55, 5.000000e-01
  %57 = fsub double %50, %56
  store double %57, double* %49, align 8
  br label %.preheader8.us.new

.preheader8.us.new:                               ; preds = %.preheader8.us.new, %.preheader8.us
  %indvars.iv40 = phi i64 [ 2, %.preheader8.us ], [ %indvars.iv.next41.1, %.preheader8.us.new ]
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv40
  %59 = load double, double* %58, align 8
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv48, i64 %indvars.iv40
  %61 = load double, double* %60, align 8
  %62 = add nsw i64 %indvars.iv40, -1
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv48, i64 %62
  %64 = load double, double* %63, align 8
  %65 = fsub double %61, %64
  %66 = fmul double %65, 5.000000e-01
  %67 = fsub double %59, %66
  store double %67, double* %58, align 8
  %indvars.iv.next41 = or i64 %indvars.iv40, 1
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv.next41
  %69 = load double, double* %68, align 8
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv48, i64 %indvars.iv.next41
  %71 = load double, double* %70, align 8
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv48, i64 %indvars.iv40
  %73 = load double, double* %72, align 8
  %74 = fsub double %71, %73
  %75 = fmul double %74, 5.000000e-01
  %76 = fsub double %69, %75
  store double %76, double* %68, align 8
  %indvars.iv.next41.1 = add nuw nsw i64 %indvars.iv40, 2
  %exitcond43.1 = icmp eq i64 %indvars.iv.next41.1, 1200
  br i1 %exitcond43.1, label %._crit_edge17.us, label %.preheader8.us.new

._crit_edge17.us:                                 ; preds = %.preheader8.us.new
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond = icmp eq i64 %indvars.iv.next49, 1000
  br i1 %exitcond, label %.preheader.us.preheader, label %.preheader8.us

.preheader.us.preheader:                          ; preds = %._crit_edge17.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge20.us
  %indvars.iv57 = phi i64 [ %indvars.iv.next58, %._crit_edge20.us ], [ 0, %.preheader.us.preheader ]
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader.us
  %indvars.iv53 = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next54, %._crit_edge ]
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv57, i64 %indvars.iv53
  %78 = load double, double* %77, align 8
  %indvars.iv.next54 = add nuw nsw i64 %indvars.iv53, 1
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv57, i64 %indvars.iv.next54
  %80 = load double, double* %79, align 8
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv57, i64 %indvars.iv53
  %82 = load double, double* %81, align 8
  %83 = fsub double %80, %82
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next58, i64 %indvars.iv53
  %85 = load double, double* %84, align 8
  %86 = fadd double %83, %85
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv57, i64 %indvars.iv53
  %88 = load double, double* %87, align 8
  %89 = fsub double %86, %88
  %90 = fmul double %89, 7.000000e-01
  %91 = fsub double %78, %90
  store double %91, double* %77, align 8
  %exitcond66 = icmp eq i64 %indvars.iv.next54, 1199
  br i1 %exitcond66, label %._crit_edge20.us, label %._crit_edge

._crit_edge20.us:                                 ; preds = %._crit_edge
  %exitcond60 = icmp eq i64 %indvars.iv.next58, 999
  br i1 %exitcond60, label %._crit_edge22, label %.preheader.us

._crit_edge22:                                    ; preds = %._crit_edge20.us
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond67 = icmp eq i64 %indvars.iv.next62, 500
  br i1 %exitcond67, label %._crit_edge24, label %.preheader13

._crit_edge24:                                    ; preds = %._crit_edge22
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) #0 {
.preheader13.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader13.us

.preheader13.us:                                  ; preds = %._crit_edge21.us, %.preheader13.us.preheader
  %indvars.iv45 = phi i64 [ 0, %.preheader13.us.preheader ], [ %indvars.iv.next46, %._crit_edge21.us ]
  %7 = mul nuw nsw i64 %indvars.iv45, 1000
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge, %.preheader13.us
  %indvars.iv41 = phi i64 [ 0, %.preheader13.us ], [ %indvars.iv.next42, %._crit_edge ]
  %8 = add nuw nsw i64 %indvars.iv41, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge1
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc11.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge1, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv45, i64 %indvars.iv41
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next42 = add nuw nsw i64 %indvars.iv41, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next42, 1200
  br i1 %exitcond53, label %._crit_edge21.us, label %._crit_edge1

._crit_edge21.us:                                 ; preds = %._crit_edge
  %indvars.iv.next46 = add nuw nsw i64 %indvars.iv45, 1
  %exitcond54 = icmp eq i64 %indvars.iv.next46, 1000
  br i1 %exitcond54, label %._crit_edge23, label %.preheader13.us

._crit_edge23:                                    ; preds = %._crit_edge21.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #5
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  br label %.preheader12.us

.preheader12.us:                                  ; preds = %._crit_edge17.us, %._crit_edge23
  %indvars.iv36 = phi i64 [ 0, %._crit_edge23 ], [ %indvars.iv.next37, %._crit_edge17.us ]
  %24 = mul nuw nsw i64 %indvars.iv36, 1000
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge2, %.preheader12.us
  %indvars.iv32 = phi i64 [ 0, %.preheader12.us ], [ %indvars.iv.next33, %._crit_edge2 ]
  %25 = add nuw nsw i64 %indvars.iv32, %24
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 20
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %._crit_edge2

; <label>:29:                                     ; preds = %._crit_edge3
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc8.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %30) #5
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge3, %29
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv36, i64 %indvars.iv32
  %33 = load double, double* %32, align 8
  %34 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %33) #6
  %indvars.iv.next33 = add nuw nsw i64 %indvars.iv32, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next33, 1200
  br i1 %exitcond51, label %._crit_edge17.us, label %._crit_edge3

._crit_edge17.us:                                 ; preds = %._crit_edge2
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next37, 1000
  br i1 %exitcond52, label %._crit_edge19, label %.preheader12.us

._crit_edge19:                                    ; preds = %._crit_edge17.us
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %._crit_edge19
  %indvars.iv27 = phi i64 [ 0, %._crit_edge19 ], [ %indvars.iv.next28, %._crit_edge.us ]
  %39 = mul nuw nsw i64 %indvars.iv27, 1000
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge4, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge4 ]
  %40 = add nuw nsw i64 %indvars.iv, %39
  %41 = trunc i64 %40 to i32
  %42 = srem i32 %41, 20
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %44, label %._crit_edge4

; <label>:44:                                     ; preds = %._crit_edge5
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %45) #5
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge5, %44
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv27, i64 %indvars.iv
  %48 = load double, double* %47, align 8
  %49 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %48) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond50 = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond50, label %._crit_edge.us, label %._crit_edge5

._crit_edge.us:                                   ; preds = %._crit_edge4
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond = icmp eq i64 %indvars.iv.next28, 1000
  br i1 %exitcond, label %._crit_edge15, label %.preheader.us

._crit_edge15:                                    ; preds = %._crit_edge.us
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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
