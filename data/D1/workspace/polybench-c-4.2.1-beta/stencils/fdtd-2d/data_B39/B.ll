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
define internal void @init_array([1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture) #2 {
.lr.ph5.preheader:
  br label %.lr.ph5.prol

.lr.ph5.prol:                                     ; preds = %.lr.ph5.prol, %.lr.ph5.preheader
  %indvars.iv12.prol = phi i64 [ 0, %.lr.ph5.preheader ], [ %indvars.iv.next13.prol, %.lr.ph5.prol ]
  %prol.iter = phi i32 [ 4, %.lr.ph5.preheader ], [ %prol.iter.sub, %.lr.ph5.prol ]
  %4 = trunc i64 %indvars.iv12.prol to i32
  %5 = sitofp i32 %4 to double
  %6 = getelementptr inbounds double, double* %3, i64 %indvars.iv12.prol
  store double %5, double* %6, align 8
  %indvars.iv.next13.prol = add nuw nsw i64 %indvars.iv12.prol, 1
  %prol.iter.sub = add i32 %prol.iter, -1
  %prol.iter.cmp = icmp eq i32 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.lr.ph5.preheader1, label %.lr.ph5.prol, !llvm.loop !1

.lr.ph5.preheader1:                               ; preds = %.lr.ph5.prol
  br label %.lr.ph5

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %7 = trunc i64 %indvars.iv7 to i32
  %8 = sitofp i32 %7 to double
  %9 = insertelement <2 x double> undef, double %8, i32 0
  %10 = shufflevector <2 x double> %9, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %11 = trunc i64 %indvars.iv.next to i32
  %12 = sitofp i32 %11 to double
  %13 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv7, i64 %indvars.iv
  %14 = add nuw nsw i64 %indvars.iv, 2
  %15 = trunc i64 %14 to i32
  %16 = sitofp i32 %15 to double
  %17 = insertelement <2 x double> undef, double %12, i32 0
  %18 = insertelement <2 x double> %17, double %16, i32 1
  %19 = fmul <2 x double> %10, %18
  %20 = fdiv <2 x double> %19, <double 1.000000e+03, double 1.200000e+03>
  %21 = extractelement <2 x double> %20, i32 0
  %22 = extractelement <2 x double> %20, i32 1
  store double %21, double* %13, align 8
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv7, i64 %indvars.iv
  store double %22, double* %23, align 8
  %24 = add nuw nsw i64 %indvars.iv, 3
  %25 = trunc i64 %24 to i32
  %26 = sitofp i32 %25 to double
  %27 = fmul double %8, %26
  %28 = fdiv double %27, 1.000000e+03
  %29 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv7, i64 %indvars.iv
  store double %28, double* %29, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next8, 1000
  br i1 %exitcond10, label %._crit_edge3, label %.preheader.us

.lr.ph5:                                          ; preds = %.lr.ph5.preheader1, %.lr.ph5
  %indvars.iv12 = phi i64 [ %indvars.iv.next13.7, %.lr.ph5 ], [ %indvars.iv.next13.prol, %.lr.ph5.preheader1 ]
  %30 = trunc i64 %indvars.iv12 to i32
  %31 = sitofp i32 %30 to double
  %32 = getelementptr inbounds double, double* %3, i64 %indvars.iv12
  %33 = bitcast double* %32 to <2 x double>*
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %34 = trunc i64 %indvars.iv.next13 to i32
  %35 = sitofp i32 %34 to double
  %36 = insertelement <2 x double> undef, double %31, i32 0
  %37 = insertelement <2 x double> %36, double %35, i32 1
  store <2 x double> %37, <2 x double>* %33, align 8
  %indvars.iv.next13.1 = add nsw i64 %indvars.iv12, 2
  %38 = trunc i64 %indvars.iv.next13.1 to i32
  %39 = sitofp i32 %38 to double
  %40 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next13.1
  %41 = bitcast double* %40 to <2 x double>*
  %indvars.iv.next13.2 = add nsw i64 %indvars.iv12, 3
  %42 = trunc i64 %indvars.iv.next13.2 to i32
  %43 = sitofp i32 %42 to double
  %44 = insertelement <2 x double> undef, double %39, i32 0
  %45 = insertelement <2 x double> %44, double %43, i32 1
  store <2 x double> %45, <2 x double>* %41, align 8
  %indvars.iv.next13.3 = add nsw i64 %indvars.iv12, 4
  %46 = trunc i64 %indvars.iv.next13.3 to i32
  %47 = sitofp i32 %46 to double
  %48 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next13.3
  %49 = bitcast double* %48 to <2 x double>*
  %indvars.iv.next13.4 = add nsw i64 %indvars.iv12, 5
  %50 = trunc i64 %indvars.iv.next13.4 to i32
  %51 = sitofp i32 %50 to double
  %52 = insertelement <2 x double> undef, double %47, i32 0
  %53 = insertelement <2 x double> %52, double %51, i32 1
  store <2 x double> %53, <2 x double>* %49, align 8
  %indvars.iv.next13.5 = add nsw i64 %indvars.iv12, 6
  %54 = trunc i64 %indvars.iv.next13.5 to i32
  %55 = sitofp i32 %54 to double
  %56 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next13.5
  %57 = bitcast double* %56 to <2 x double>*
  %indvars.iv.next13.6 = add nsw i64 %indvars.iv12, 7
  %58 = trunc i64 %indvars.iv.next13.6 to i32
  %59 = sitofp i32 %58 to double
  %60 = insertelement <2 x double> undef, double %55, i32 0
  %61 = insertelement <2 x double> %60, double %59, i32 1
  store <2 x double> %61, <2 x double>* %57, align 8
  %indvars.iv.next13.7 = add nsw i64 %indvars.iv12, 8
  %exitcond15.7 = icmp eq i64 %indvars.iv.next13.7, 500
  br i1 %exitcond15.7, label %.preheader.us.preheader, label %.lr.ph5

.preheader.us.preheader:                          ; preds = %.lr.ph5
  br label %.preheader.us

._crit_edge3:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_fdtd_2d([1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture readonly) #2 {
.preheader6.lr.ph:
  br label %.preheader6

.preheader6:                                      ; preds = %._crit_edge12, %.preheader6.lr.ph
  %indvars.iv50 = phi i64 [ 0, %.preheader6.lr.ph ], [ %indvars.iv.next51, %._crit_edge12 ]
  %4 = getelementptr inbounds double, double* %3, i64 %indvars.iv50
  %5 = bitcast double* %4 to i64*
  br label %.lr.ph.new

.preheader2.us:                                   ; preds = %.preheader2.us.preheader, %._crit_edge.us
  %indvars.iv25 = phi i64 [ %indvars.iv.next26, %._crit_edge.us ], [ 1, %.preheader2.us.preheader ]
  %6 = add nsw i64 %indvars.iv25, -1
  br label %.preheader2.us.new

.preheader2.us.new:                               ; preds = %.preheader2.us.new, %.preheader2.us
  %indvars.iv17 = phi i64 [ 0, %.preheader2.us ], [ %indvars.iv.next18.1, %.preheader2.us.new ]
  %7 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv17
  %8 = load double, double* %7, align 8
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv25, i64 %indvars.iv17
  %10 = load double, double* %9, align 8
  %11 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %6, i64 %indvars.iv17
  %12 = load double, double* %11, align 8
  %13 = fsub double %10, %12
  %14 = fmul double %13, 5.000000e-01
  %15 = fsub double %8, %14
  store double %15, double* %7, align 8
  %indvars.iv.next18 = or i64 %indvars.iv17, 1
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv25, i64 %indvars.iv.next18
  %17 = load double, double* %16, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv25, i64 %indvars.iv.next18
  %19 = load double, double* %18, align 8
  %20 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %6, i64 %indvars.iv.next18
  %21 = load double, double* %20, align 8
  %22 = fsub double %19, %21
  %23 = fmul double %22, 5.000000e-01
  %24 = fsub double %17, %23
  store double %24, double* %16, align 8
  %indvars.iv.next18.1 = add nsw i64 %indvars.iv17, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next18.1, 1200
  br i1 %exitcond.1, label %._crit_edge.us, label %.preheader2.us.new

._crit_edge.us:                                   ; preds = %.preheader2.us.new
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %exitcond = icmp eq i64 %indvars.iv.next26, 1000
  br i1 %exitcond, label %.preheader1.us.preheader, label %.preheader2.us

.preheader1.us.preheader:                         ; preds = %._crit_edge.us
  br label %.preheader1.us

.lr.ph.new:                                       ; preds = %.lr.ph.new, %.preheader6
  %indvars.iv = phi i64 [ 0, %.preheader6 ], [ %indvars.iv.next.7, %.lr.ph.new ]
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
  %indvars.iv.next.7 = add nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, 1200
  br i1 %exitcond.7, label %.preheader2.us.preheader, label %.lr.ph.new

.preheader2.us.preheader:                         ; preds = %.lr.ph.new
  br label %.preheader2.us

.preheader1.us:                                   ; preds = %.preheader1.us.preheader, %._crit_edge9.us
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %._crit_edge9.us ], [ 0, %.preheader1.us.preheader ]
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv37, i64 1
  %50 = load double, double* %49, align 8
  %51 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv37, i64 1
  %52 = load double, double* %51, align 8
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv37, i64 0
  %54 = load double, double* %53, align 8
  %55 = fsub double %52, %54
  %56 = fmul double %55, 5.000000e-01
  %57 = fsub double %50, %56
  store double %57, double* %49, align 8
  br label %.preheader1.us.new

.preheader1.us.new:                               ; preds = %.preheader1.us.new, %.preheader1.us
  %indvars.iv29 = phi i64 [ 2, %.preheader1.us ], [ %indvars.iv.next30.1, %.preheader1.us.new ]
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv37, i64 %indvars.iv29
  %59 = load double, double* %58, align 8
  %60 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv37, i64 %indvars.iv29
  %61 = load double, double* %60, align 8
  %62 = add nsw i64 %indvars.iv29, -1
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv37, i64 %62
  %64 = load double, double* %63, align 8
  %65 = fsub double %61, %64
  %66 = fmul double %65, 5.000000e-01
  %67 = fsub double %59, %66
  store double %67, double* %58, align 8
  %indvars.iv.next30 = or i64 %indvars.iv29, 1
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv37, i64 %indvars.iv.next30
  %69 = load double, double* %68, align 8
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv37, i64 %indvars.iv.next30
  %71 = load double, double* %70, align 8
  %72 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv37, i64 %indvars.iv29
  %73 = load double, double* %72, align 8
  %74 = fsub double %71, %73
  %75 = fmul double %74, 5.000000e-01
  %76 = fsub double %69, %75
  store double %76, double* %68, align 8
  %indvars.iv.next30.1 = add nsw i64 %indvars.iv29, 2
  %exitcond32.1 = icmp eq i64 %indvars.iv.next30.1, 1200
  br i1 %exitcond32.1, label %._crit_edge9.us, label %.preheader1.us.new

._crit_edge9.us:                                  ; preds = %.preheader1.us.new
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next38, 1000
  br i1 %exitcond40, label %.preheader.us.preheader, label %.preheader1.us

.preheader.us.preheader:                          ; preds = %._crit_edge9.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge11.us
  %indvars.iv46 = phi i64 [ %indvars.iv.next47, %._crit_edge11.us ], [ 0, %.preheader.us.preheader ]
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.preheader.us
  %indvars.iv42 = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next43, %._crit_edge ]
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv46, i64 %indvars.iv42
  %78 = load double, double* %77, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %79 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv46, i64 %indvars.iv.next43
  %80 = load double, double* %79, align 8
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv46, i64 %indvars.iv42
  %82 = load double, double* %81, align 8
  %83 = fsub double %80, %82
  %84 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next47, i64 %indvars.iv42
  %85 = load double, double* %84, align 8
  %86 = fadd double %83, %85
  %87 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv46, i64 %indvars.iv42
  %88 = load double, double* %87, align 8
  %89 = fsub double %86, %88
  %90 = fmul double %89, 7.000000e-01
  %91 = fsub double %78, %90
  store double %91, double* %77, align 8
  %exitcond45 = icmp eq i64 %indvars.iv.next43, 1199
  br i1 %exitcond45, label %._crit_edge11.us, label %._crit_edge

._crit_edge11.us:                                 ; preds = %._crit_edge
  %exitcond49 = icmp eq i64 %indvars.iv.next47, 999
  br i1 %exitcond49, label %._crit_edge12, label %.preheader.us

._crit_edge12:                                    ; preds = %._crit_edge11.us
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond53 = icmp eq i64 %indvars.iv.next51, 500
  br i1 %exitcond53, label %._crit_edge13, label %.preheader6

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
  %indvars.iv37 = phi i64 [ 0, %.preheader8.us.preheader ], [ %indvars.iv.next38, %._crit_edge14.us ]
  %7 = mul nsw i64 %indvars.iv37, 1000
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge, %.preheader8.us
  %indvars.iv33 = phi i64 [ 0, %.preheader8.us ], [ %indvars.iv.next34, %._crit_edge ]
  %8 = add nsw i64 %indvars.iv33, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge3
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc6.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge3, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv37, i64 %indvars.iv33
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond36 = icmp eq i64 %indvars.iv.next34, 1200
  br i1 %exitcond36, label %._crit_edge14.us, label %._crit_edge3

._crit_edge14.us:                                 ; preds = %._crit_edge
  %indvars.iv.next38 = add nuw nsw i64 %indvars.iv37, 1
  %exitcond40 = icmp eq i64 %indvars.iv.next38, 1000
  br i1 %exitcond40, label %._crit_edge15, label %.preheader8.us

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
  %24 = mul nsw i64 %indvars.iv28, 1000
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge4, %.preheader7.us
  %indvars.iv24 = phi i64 [ 0, %.preheader7.us ], [ %indvars.iv.next25, %._crit_edge4 ]
  %25 = add nsw i64 %indvars.iv24, %24
  %26 = trunc i64 %25 to i32
  %27 = srem i32 %26, 20
  %28 = icmp eq i32 %27, 0
  br i1 %28, label %29, label %._crit_edge4

; <label>:29:                                     ; preds = %._crit_edge5
  %30 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %30) #5
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge5, %29
  %31 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv28, i64 %indvars.iv24
  %33 = load double, double* %32, align 8
  %34 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %31, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %33) #6
  %indvars.iv.next25 = add nuw nsw i64 %indvars.iv24, 1
  %exitcond27 = icmp eq i64 %indvars.iv.next25, 1200
  br i1 %exitcond27, label %._crit_edge11.us, label %._crit_edge5

._crit_edge11.us:                                 ; preds = %._crit_edge4
  %indvars.iv.next29 = add nuw nsw i64 %indvars.iv28, 1
  %exitcond31 = icmp eq i64 %indvars.iv.next29, 1000
  br i1 %exitcond31, label %._crit_edge12, label %.preheader7.us

._crit_edge12:                                    ; preds = %._crit_edge11.us
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %36 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %35, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %37 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %38 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %37, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %._crit_edge12
  %indvars.iv19 = phi i64 [ 0, %._crit_edge12 ], [ %indvars.iv.next20, %._crit_edge.us ]
  %39 = mul nsw i64 %indvars.iv19, 1000
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge6, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge6 ]
  %40 = add nsw i64 %indvars.iv, %39
  %41 = trunc i64 %40 to i32
  %42 = srem i32 %41, 20
  %43 = icmp eq i32 %42, 0
  br i1 %43, label %44, label %._crit_edge6

; <label>:44:                                     ; preds = %._crit_edge7
  %45 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %45) #5
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge7, %44
  %46 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv19, i64 %indvars.iv
  %48 = load double, double* %47, align 8
  %49 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %46, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %48) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge7

._crit_edge.us:                                   ; preds = %._crit_edge6
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond22 = icmp eq i64 %indvars.iv.next20, 1000
  br i1 %exitcond22, label %._crit_edge9, label %.preheader.us

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
!1 = distinct !{!1, !2}
!2 = !{!"llvm.loop.unroll.disable"}
