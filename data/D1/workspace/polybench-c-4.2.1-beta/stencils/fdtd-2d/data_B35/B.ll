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
define internal void @init_array([1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture) #2 {
  br label %5

; <label>:5:                                      ; preds = %5, %4
  %indvars.iv4 = phi i64 [ 0, %4 ], [ %indvars.iv.next5.4, %5 ]
  %6 = trunc i64 %indvars.iv4 to i32
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds double, double* %3, i64 %indvars.iv4
  %9 = bitcast double* %8 to <2 x double>*
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %10 = trunc i64 %indvars.iv.next5 to i32
  %11 = sitofp i32 %10 to double
  %12 = insertelement <2 x double> undef, double %7, i32 0
  %13 = insertelement <2 x double> %12, double %11, i32 1
  store <2 x double> %13, <2 x double>* %9, align 8
  %indvars.iv.next5.1 = add nuw nsw i64 %indvars.iv4, 2
  %14 = trunc i64 %indvars.iv.next5.1 to i32
  %15 = sitofp i32 %14 to double
  %16 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next5.1
  %17 = bitcast double* %16 to <2 x double>*
  %indvars.iv.next5.2 = add nuw nsw i64 %indvars.iv4, 3
  %18 = trunc i64 %indvars.iv.next5.2 to i32
  %19 = sitofp i32 %18 to double
  %20 = insertelement <2 x double> undef, double %15, i32 0
  %21 = insertelement <2 x double> %20, double %19, i32 1
  store <2 x double> %21, <2 x double>* %17, align 8
  %indvars.iv.next5.3 = add nuw nsw i64 %indvars.iv4, 4
  %22 = trunc i64 %indvars.iv.next5.3 to i32
  %23 = sitofp i32 %22 to double
  %24 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next5.3
  store double %23, double* %24, align 8
  %indvars.iv.next5.4 = add nuw nsw i64 %indvars.iv4, 5
  %exitcond6.4 = icmp eq i64 %indvars.iv.next5.4, 500
  br i1 %exitcond6.4, label %.preheader.preheader, label %5

.preheader.preheader:                             ; preds = %5
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %49
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %49 ], [ 0, %.preheader.preheader ]
  %25 = trunc i64 %indvars.iv1 to i32
  %26 = sitofp i32 %25 to double
  %27 = insertelement <2 x double> undef, double %26, i32 0
  %28 = shufflevector <2 x double> %27, <2 x double> undef, <2 x i32> zeroinitializer
  br label %29

; <label>:29:                                     ; preds = %29, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %29 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %30 = trunc i64 %indvars.iv.next to i32
  %31 = sitofp i32 %30 to double
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %33 = add nuw nsw i64 %indvars.iv, 2
  %34 = trunc i64 %33 to i32
  %35 = sitofp i32 %34 to double
  %36 = insertelement <2 x double> undef, double %31, i32 0
  %37 = insertelement <2 x double> %36, double %35, i32 1
  %38 = fmul <2 x double> %28, %37
  %39 = fdiv <2 x double> %38, <double 1.000000e+03, double 1.200000e+03>
  %40 = extractelement <2 x double> %39, i32 0
  %41 = extractelement <2 x double> %39, i32 1
  store double %40, double* %32, align 8
  %42 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv1, i64 %indvars.iv
  store double %41, double* %42, align 8
  %43 = add nuw nsw i64 %indvars.iv, 3
  %44 = trunc i64 %43 to i32
  %45 = sitofp i32 %44 to double
  %46 = fmul double %26, %45
  %47 = fdiv double %46, 1.000000e+03
  %48 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv
  store double %47, double* %48, align 8
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %49, label %29

; <label>:49:                                     ; preds = %29
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1000
  br i1 %exitcond3, label %50, label %.preheader

; <label>:50:                                     ; preds = %49
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_fdtd_2d([1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture readonly) #2 {
  br label %.preheader6

.preheader6:                                      ; preds = %152, %4
  %indvars.iv19 = phi i64 [ 0, %4 ], [ %indvars.iv.next20, %152 ]
  %5 = getelementptr inbounds double, double* %3, i64 %indvars.iv19
  %6 = bitcast double* %5 to i64*
  br label %7

; <label>:7:                                      ; preds = %7, %.preheader6
  %indvars.iv = phi i64 [ 0, %.preheader6 ], [ %indvars.iv.next.7, %7 ]
  %8 = load i64, i64* %6, align 8
  %9 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv
  %10 = bitcast double* %9 to i64*
  store i64 %8, i64* %10, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %11 = load i64, i64* %6, align 8
  %12 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next
  %13 = bitcast double* %12 to i64*
  store i64 %11, i64* %13, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %14 = load i64, i64* %6, align 8
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.1
  %16 = bitcast double* %15 to i64*
  store i64 %14, i64* %16, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %17 = load i64, i64* %6, align 8
  %18 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.2
  %19 = bitcast double* %18 to i64*
  store i64 %17, i64* %19, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %20 = load i64, i64* %6, align 8
  %21 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.3
  %22 = bitcast double* %21 to i64*
  store i64 %20, i64* %22, align 8
  %indvars.iv.next.4 = or i64 %indvars.iv, 5
  %23 = load i64, i64* %6, align 8
  %24 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.4
  %25 = bitcast double* %24 to i64*
  store i64 %23, i64* %25, align 8
  %indvars.iv.next.5 = or i64 %indvars.iv, 6
  %26 = load i64, i64* %6, align 8
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.5
  %28 = bitcast double* %27 to i64*
  store i64 %26, i64* %28, align 8
  %indvars.iv.next.6 = or i64 %indvars.iv, 7
  %29 = load i64, i64* %6, align 8
  %30 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.6
  %31 = bitcast double* %30 to i64*
  store i64 %29, i64* %31, align 8
  %indvars.iv.next.7 = add nuw nsw i64 %indvars.iv, 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.7, 1200
  br i1 %exitcond.7, label %.preheader2.preheader, label %7

.preheader2.preheader:                            ; preds = %7
  br label %.preheader2

.preheader2:                                      ; preds = %.preheader2.preheader, %middle.block87
  %indvar = phi i64 [ %indvar.next, %middle.block87 ], [ 0, %.preheader2.preheader ]
  %indvars.iv4 = phi i64 [ %indvars.iv.next5, %middle.block87 ], [ 1, %.preheader2.preheader ]
  %32 = add i64 %indvar, 1
  %scevgep91 = getelementptr [1200 x double], [1200 x double]* %1, i64 %32, i64 0
  %33 = add i64 %indvar, 2
  %scevgep93 = getelementptr [1200 x double], [1200 x double]* %1, i64 %33, i64 0
  %scevgep95 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvar, i64 0
  %scevgep97 = getelementptr [1200 x double], [1200 x double]* %2, i64 %33, i64 0
  %34 = add nsw i64 %indvars.iv4, -1
  %bound099 = icmp ult double* %scevgep91, %scevgep97
  %bound1100 = icmp ult double* %scevgep95, %scevgep93
  %memcheck.conflict102 = and i1 %bound099, %bound1100
  br i1 %memcheck.conflict102, label %scalar.ph88.preheader, label %vector.body86.preheader

vector.body86.preheader:                          ; preds = %.preheader2
  br label %vector.body86

scalar.ph88.preheader:                            ; preds = %.preheader2
  br label %scalar.ph88

vector.body86:                                    ; preds = %vector.body86.preheader, %vector.body86
  %index105 = phi i64 [ %index.next106, %vector.body86 ], [ 0, %vector.body86.preheader ]
  %offset.idx109 = shl i64 %index105, 1
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv4, i64 %offset.idx109
  %36 = bitcast double* %35 to <4 x double>*
  %wide.vec113 = load <4 x double>, <4 x double>* %36, align 8, !alias.scope !1, !noalias !4
  %strided.vec114 = shufflevector <4 x double> %wide.vec113, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec115 = shufflevector <4 x double> %wide.vec113, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv4, i64 %offset.idx109
  %38 = bitcast double* %37 to <4 x double>*
  %wide.vec116 = load <4 x double>, <4 x double>* %38, align 8, !alias.scope !4
  %39 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %34, i64 %offset.idx109
  %40 = bitcast double* %39 to <4 x double>*
  %wide.vec119 = load <4 x double>, <4 x double>* %40, align 8, !alias.scope !4
  %41 = fsub <4 x double> %wide.vec116, %wide.vec119
  %42 = shufflevector <4 x double> %41, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %43 = fmul <2 x double> %42, <double 5.000000e-01, double 5.000000e-01>
  %44 = fsub <2 x double> %strided.vec114, %43
  %45 = or i64 %offset.idx109, 1
  %46 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv4, i64 %45
  %47 = fsub <4 x double> %wide.vec116, %wide.vec119
  %48 = shufflevector <4 x double> %47, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %49 = fmul <2 x double> %48, <double 5.000000e-01, double 5.000000e-01>
  %50 = fsub <2 x double> %strided.vec115, %49
  %51 = getelementptr double, double* %46, i64 -1
  %52 = bitcast double* %51 to <4 x double>*
  %interleaved.vec122 = shufflevector <2 x double> %44, <2 x double> %50, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec122, <4 x double>* %52, align 8, !alias.scope !1, !noalias !4
  %index.next106 = add i64 %index105, 2
  %53 = icmp eq i64 %index.next106, 600
  br i1 %53, label %middle.block87.loopexit125, label %vector.body86, !llvm.loop !6

scalar.ph88:                                      ; preds = %scalar.ph88.preheader, %scalar.ph88
  %indvars.iv1 = phi i64 [ %indvars.iv.next2.1, %scalar.ph88 ], [ 0, %scalar.ph88.preheader ]
  %54 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv4, i64 %indvars.iv1
  %55 = load double, double* %54, align 8
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv4, i64 %indvars.iv1
  %57 = load double, double* %56, align 8
  %58 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %34, i64 %indvars.iv1
  %59 = load double, double* %58, align 8
  %60 = fsub double %57, %59
  %61 = fmul double %60, 5.000000e-01
  %62 = fsub double %55, %61
  store double %62, double* %54, align 8
  %indvars.iv.next2 = or i64 %indvars.iv1, 1
  %63 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv4, i64 %indvars.iv.next2
  %64 = load double, double* %63, align 8
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv4, i64 %indvars.iv.next2
  %66 = load double, double* %65, align 8
  %67 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %34, i64 %indvars.iv.next2
  %68 = load double, double* %67, align 8
  %69 = fsub double %66, %68
  %70 = fmul double %69, 5.000000e-01
  %71 = fsub double %64, %70
  store double %71, double* %63, align 8
  %indvars.iv.next2.1 = add nuw nsw i64 %indvars.iv1, 2
  %exitcond3.1 = icmp eq i64 %indvars.iv.next2.1, 1200
  br i1 %exitcond3.1, label %middle.block87.loopexit, label %scalar.ph88, !llvm.loop !9

middle.block87.loopexit:                          ; preds = %scalar.ph88
  br label %middle.block87

middle.block87.loopexit125:                       ; preds = %vector.body86
  br label %middle.block87

middle.block87:                                   ; preds = %middle.block87.loopexit125, %middle.block87.loopexit
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1000
  %indvar.next = add i64 %indvar, 1
  br i1 %exitcond6, label %.preheader1.preheader, label %.preheader2

.preheader1.preheader:                            ; preds = %middle.block87
  br label %.preheader1

.preheader1:                                      ; preds = %.preheader1.preheader, %.loopexit123
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %.loopexit123 ], [ 0, %.preheader1.preheader ]
  %scevgep53 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv10, i64 2
  %72 = add i64 %indvars.iv10, 1
  %scevgep55 = getelementptr [1200 x double], [1200 x double]* %0, i64 %72, i64 0
  %scevgep57 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv10, i64 1
  %scevgep59 = getelementptr [1200 x double], [1200 x double]* %2, i64 %72, i64 0
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv10, i64 1
  %74 = load double, double* %73, align 8
  %75 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv10, i64 1
  %76 = load double, double* %75, align 8
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv10, i64 0
  %78 = load double, double* %77, align 8
  %79 = fsub double %76, %78
  %80 = fmul double %79, 5.000000e-01
  %81 = fsub double %74, %80
  store double %81, double* %73, align 8
  %bound061 = icmp ult double* %scevgep53, %scevgep59
  %bound162 = icmp ult double* %scevgep57, %scevgep55
  %memcheck.conflict64 = and i1 %bound061, %bound162
  br i1 %memcheck.conflict64, label %scalar.ph50.preheader, label %vector.body48.preheader

vector.body48.preheader:                          ; preds = %.preheader1
  br label %vector.body48

scalar.ph50.preheader.loopexit:                   ; preds = %vector.body48
  br label %scalar.ph50.preheader

scalar.ph50.preheader:                            ; preds = %scalar.ph50.preheader.loopexit, %.preheader1
  %indvars.iv.next823.ph = phi i64 [ 2, %.preheader1 ], [ 1198, %scalar.ph50.preheader.loopexit ]
  %indvars.iv722.ph = phi i64 [ 1, %.preheader1 ], [ 1197, %scalar.ph50.preheader.loopexit ]
  br label %scalar.ph50

vector.body48:                                    ; preds = %vector.body48.preheader, %vector.body48
  %index67 = phi i64 [ %index.next68, %vector.body48 ], [ 0, %vector.body48.preheader ]
  %82 = shl i64 %index67, 1
  %offset.idx = or i64 %82, 2
  %83 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv10, i64 %offset.idx
  %84 = bitcast double* %83 to <4 x double>*
  %wide.vec = load <4 x double>, <4 x double>* %84, align 8, !alias.scope !10, !noalias !13
  %strided.vec = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec79 = shufflevector <4 x double> %wide.vec, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %85 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv10, i64 %offset.idx
  %86 = getelementptr double, double* %85, i64 -1
  %87 = bitcast double* %86 to <4 x double>*
  %wide.vec80 = load <4 x double>, <4 x double>* %87, align 8, !alias.scope !13
  %strided.vec81 = shufflevector <4 x double> %wide.vec80, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec82 = shufflevector <4 x double> %wide.vec80, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %88 = fsub <2 x double> %strided.vec82, %strided.vec81
  %89 = fmul <2 x double> %88, <double 5.000000e-01, double 5.000000e-01>
  %90 = fsub <2 x double> %strided.vec, %89
  %91 = or i64 %82, 3
  %92 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv10, i64 %91
  %93 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv10, i64 %91
  %94 = getelementptr double, double* %93, i64 -1
  %95 = bitcast double* %94 to <4 x double>*
  %wide.vec83 = load <4 x double>, <4 x double>* %95, align 8, !alias.scope !13
  %strided.vec84 = shufflevector <4 x double> %wide.vec83, <4 x double> undef, <2 x i32> <i32 0, i32 2>
  %strided.vec85 = shufflevector <4 x double> %wide.vec83, <4 x double> undef, <2 x i32> <i32 1, i32 3>
  %96 = fsub <2 x double> %strided.vec85, %strided.vec84
  %97 = fmul <2 x double> %96, <double 5.000000e-01, double 5.000000e-01>
  %98 = fsub <2 x double> %strided.vec79, %97
  %99 = getelementptr double, double* %92, i64 -1
  %100 = bitcast double* %99 to <4 x double>*
  %interleaved.vec = shufflevector <2 x double> %90, <2 x double> %98, <4 x i32> <i32 0, i32 2, i32 1, i32 3>
  store <4 x double> %interleaved.vec, <4 x double>* %100, align 8, !alias.scope !10, !noalias !13
  %index.next68 = add i64 %index67, 2
  %101 = icmp eq i64 %index.next68, 598
  br i1 %101, label %scalar.ph50.preheader.loopexit, label %vector.body48, !llvm.loop !15

.loopexit123:                                     ; preds = %scalar.ph50
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 1000
  br i1 %exitcond12, label %.preheader.preheader, label %.preheader1

.preheader.preheader:                             ; preds = %.loopexit123
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %.loopexit
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %.loopexit ], [ 0, %.preheader.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv16, i64 0
  %scevgep25 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv16, i64 1199
  %scevgep27 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv16, i64 0
  %102 = add i64 %indvars.iv16, 1
  %scevgep29 = getelementptr [1200 x double], [1200 x double]* %0, i64 %102, i64 0
  %scevgep31 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv16, i64 0
  %scevgep33 = getelementptr [1200 x double], [1200 x double]* %1, i64 %102, i64 1199
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %bound0 = icmp ult double* %scevgep, %scevgep29
  %bound1 = icmp ult double* %scevgep27, %scevgep25
  %found.conflict = and i1 %bound0, %bound1
  %bound035 = icmp ult double* %scevgep, %scevgep33
  %bound136 = icmp ult double* %scevgep31, %scevgep25
  %found.conflict37 = and i1 %bound035, %bound136
  %conflict.rdx = or i1 %found.conflict, %found.conflict37
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %103 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv16, i64 %index
  %104 = bitcast double* %103 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %104, align 8, !alias.scope !16, !noalias !19
  %105 = getelementptr double, double* %103, i64 2
  %106 = bitcast double* %105 to <2 x double>*
  %wide.load39 = load <2 x double>, <2 x double>* %106, align 8, !alias.scope !16, !noalias !19
  %107 = or i64 %index, 1
  %108 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv16, i64 %107
  %109 = bitcast double* %108 to <2 x double>*
  %wide.load40 = load <2 x double>, <2 x double>* %109, align 8, !alias.scope !22
  %110 = getelementptr double, double* %108, i64 2
  %111 = bitcast double* %110 to <2 x double>*
  %wide.load41 = load <2 x double>, <2 x double>* %111, align 8, !alias.scope !22
  %112 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv16, i64 %index
  %113 = bitcast double* %112 to <2 x double>*
  %wide.load42 = load <2 x double>, <2 x double>* %113, align 8, !alias.scope !22
  %114 = getelementptr double, double* %112, i64 2
  %115 = bitcast double* %114 to <2 x double>*
  %wide.load43 = load <2 x double>, <2 x double>* %115, align 8, !alias.scope !22
  %116 = fsub <2 x double> %wide.load40, %wide.load42
  %117 = fsub <2 x double> %wide.load41, %wide.load43
  %118 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next17, i64 %index
  %119 = bitcast double* %118 to <2 x double>*
  %wide.load44 = load <2 x double>, <2 x double>* %119, align 8, !alias.scope !23
  %120 = getelementptr double, double* %118, i64 2
  %121 = bitcast double* %120 to <2 x double>*
  %wide.load45 = load <2 x double>, <2 x double>* %121, align 8, !alias.scope !23
  %122 = fadd <2 x double> %116, %wide.load44
  %123 = fadd <2 x double> %117, %wide.load45
  %124 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv16, i64 %index
  %125 = bitcast double* %124 to <2 x double>*
  %wide.load46 = load <2 x double>, <2 x double>* %125, align 8, !alias.scope !23
  %126 = getelementptr double, double* %124, i64 2
  %127 = bitcast double* %126 to <2 x double>*
  %wide.load47 = load <2 x double>, <2 x double>* %127, align 8, !alias.scope !23
  %128 = fsub <2 x double> %122, %wide.load46
  %129 = fsub <2 x double> %123, %wide.load47
  %130 = fmul <2 x double> %128, <double 7.000000e-01, double 7.000000e-01>
  %131 = fmul <2 x double> %129, <double 7.000000e-01, double 7.000000e-01>
  %132 = fsub <2 x double> %wide.load, %130
  %133 = fsub <2 x double> %wide.load39, %131
  %134 = bitcast double* %103 to <2 x double>*
  store <2 x double> %132, <2 x double>* %134, align 8, !alias.scope !16, !noalias !19
  %135 = bitcast double* %105 to <2 x double>*
  store <2 x double> %133, <2 x double>* %135, align 8, !alias.scope !16, !noalias !19
  %index.next = add i64 %index, 4
  %136 = icmp eq i64 %index.next, 1196
  br i1 %136, label %scalar.ph.preheader.loopexit, label %vector.body, !llvm.loop !24

scalar.ph.preheader.loopexit:                     ; preds = %vector.body
  br label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %scalar.ph.preheader.loopexit, %.preheader
  %indvars.iv13.ph = phi i64 [ 0, %.preheader ], [ 1196, %scalar.ph.preheader.loopexit ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %scalar.ph ], [ %indvars.iv13.ph, %scalar.ph.preheader ]
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv13
  %138 = load double, double* %137, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %139 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv16, i64 %indvars.iv.next14
  %140 = load double, double* %139, align 8
  %141 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv16, i64 %indvars.iv13
  %142 = load double, double* %141, align 8
  %143 = fsub double %140, %142
  %144 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next17, i64 %indvars.iv13
  %145 = load double, double* %144, align 8
  %146 = fadd double %143, %145
  %147 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv16, i64 %indvars.iv13
  %148 = load double, double* %147, align 8
  %149 = fsub double %146, %148
  %150 = fmul double %149, 7.000000e-01
  %151 = fsub double %138, %150
  store double %151, double* %137, align 8
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 1199
  br i1 %exitcond15, label %.loopexit, label %scalar.ph, !llvm.loop !25

.loopexit:                                        ; preds = %scalar.ph
  %exitcond18 = icmp eq i64 %indvars.iv.next17, 999
  br i1 %exitcond18, label %152, label %.preheader

; <label>:152:                                    ; preds = %.loopexit
  %indvars.iv.next20 = add nuw nsw i64 %indvars.iv19, 1
  %exitcond21 = icmp eq i64 %indvars.iv.next20, 500
  br i1 %exitcond21, label %153, label %.preheader6

; <label>:153:                                    ; preds = %152
  ret void

scalar.ph50:                                      ; preds = %scalar.ph50.preheader, %scalar.ph50
  %indvars.iv.next823 = phi i64 [ %indvars.iv.next8, %scalar.ph50 ], [ %indvars.iv.next823.ph, %scalar.ph50.preheader ]
  %indvars.iv722 = phi i64 [ %indvars.iv.next8.1, %scalar.ph50 ], [ %indvars.iv722.ph, %scalar.ph50.preheader ]
  %154 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv10, i64 %indvars.iv.next823
  %155 = load double, double* %154, align 8
  %156 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv.next823
  %157 = load double, double* %156, align 8
  %158 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv722
  %159 = load double, double* %158, align 8
  %160 = fsub double %157, %159
  %161 = fmul double %160, 5.000000e-01
  %162 = fsub double %155, %161
  store double %162, double* %154, align 8
  %indvars.iv.next8.1 = add nuw nsw i64 %indvars.iv722, 2
  %163 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv10, i64 %indvars.iv.next8.1
  %164 = load double, double* %163, align 8
  %165 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv10, i64 %indvars.iv.next8.1
  %166 = load double, double* %165, align 8
  %167 = add nsw i64 %indvars.iv722, 1
  %168 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv10, i64 %167
  %169 = load double, double* %168, align 8
  %170 = fsub double %166, %169
  %171 = fmul double %170, 5.000000e-01
  %172 = fsub double %164, %171
  store double %172, double* %163, align 8
  %indvars.iv.next8 = add nsw i64 %indvars.iv722, 3
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 1200
  br i1 %exitcond9, label %.loopexit123, label %scalar.ph50, !llvm.loop !26
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader8

.preheader8:                                      ; preds = %20, %3
  %indvars.iv13 = phi i64 [ 0, %3 ], [ %indvars.iv.next14, %20 ]
  %8 = mul nuw nsw i64 %indvars.iv13, 1000
  br label %9

; <label>:9:                                      ; preds = %._crit_edge, %.preheader8
  %indvars.iv10 = phi i64 [ 0, %.preheader8 ], [ %indvars.iv.next11, %._crit_edge ]
  %10 = add nuw nsw i64 %indvars.iv10, %8
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc6 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #5
  br label %._crit_edge

._crit_edge:                                      ; preds = %9, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv13, i64 %indvars.iv10
  %18 = load double, double* %17, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next11, 1200
  br i1 %exitcond12, label %20, label %9

; <label>:20:                                     ; preds = %._crit_edge
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next14, 1000
  br i1 %exitcond15, label %21, label %.preheader8

; <label>:21:                                     ; preds = %20
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #5
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  br label %.preheader7

.preheader7:                                      ; preds = %40, %21
  %indvars.iv7 = phi i64 [ 0, %21 ], [ %indvars.iv.next8, %40 ]
  %28 = mul nuw nsw i64 %indvars.iv7, 1000
  br label %29

; <label>:29:                                     ; preds = %._crit_edge9, %.preheader7
  %indvars.iv4 = phi i64 [ 0, %.preheader7 ], [ %indvars.iv.next5, %._crit_edge9 ]
  %30 = add nuw nsw i64 %indvars.iv4, %28
  %31 = trunc i64 %30 to i32
  %32 = srem i32 %31, 20
  %33 = icmp eq i32 %32, 0
  br i1 %33, label %34, label %._crit_edge9

; <label>:34:                                     ; preds = %29
  %35 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %35) #5
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %29, %34
  %36 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv7, i64 %indvars.iv4
  %38 = load double, double* %37, align 8
  %39 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %36, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %38) #6
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next5, 1200
  br i1 %exitcond6, label %40, label %29

; <label>:40:                                     ; preds = %._crit_edge9
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 1000
  br i1 %exitcond9, label %41, label %.preheader7

; <label>:41:                                     ; preds = %40
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %43 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %42, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %44 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %45 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %44, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  br label %.preheader

.preheader:                                       ; preds = %58, %41
  %indvars.iv1 = phi i64 [ 0, %41 ], [ %indvars.iv.next2, %58 ]
  %46 = mul nuw nsw i64 %indvars.iv1, 1000
  br label %47

; <label>:47:                                     ; preds = %._crit_edge10, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge10 ]
  %48 = add nuw nsw i64 %indvars.iv, %46
  %49 = trunc i64 %48 to i32
  %50 = srem i32 %49, 20
  %51 = icmp eq i32 %50, 0
  br i1 %51, label %52, label %._crit_edge10

; <label>:52:                                     ; preds = %47
  %53 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %53) #5
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %47, %52
  %54 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %55 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv
  %56 = load double, double* %55, align 8
  %57 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %54, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %56) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %58, label %47

; <label>:58:                                     ; preds = %._crit_edge10
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 1000
  br i1 %exitcond3, label %59, label %.preheader

; <label>:59:                                     ; preds = %58
  %60 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %61 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %60, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
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
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = distinct !{!6, !7, !8}
!7 = !{!"llvm.loop.vectorize.width", i32 1}
!8 = !{!"llvm.loop.interleave.count", i32 1}
!9 = distinct !{!9, !7, !8}
!10 = !{!11}
!11 = distinct !{!11, !12}
!12 = distinct !{!12, !"LVerDomain"}
!13 = !{!14}
!14 = distinct !{!14, !12}
!15 = distinct !{!15, !7, !8}
!16 = !{!17}
!17 = distinct !{!17, !18}
!18 = distinct !{!18, !"LVerDomain"}
!19 = !{!20, !21}
!20 = distinct !{!20, !18}
!21 = distinct !{!21, !18}
!22 = !{!20}
!23 = !{!21}
!24 = distinct !{!24, !7, !8}
!25 = distinct !{!25, !7, !8}
!26 = distinct !{!26, !7, !8}
