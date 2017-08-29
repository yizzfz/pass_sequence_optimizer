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
  tail call fastcc void @print_array([1200 x double]* %18, [1200 x double]* %17, [1200 x double]* %16)
  br label %._crit_edge

._crit_edge:                                      ; preds = %12, %2, %15
  tail call void @free(i8* %3) #4
  tail call void @free(i8* %4) #4
  tail call void @free(i8* %5) #4
  tail call void @free(i8* %6) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array([1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture) unnamed_addr #2 {
  br label %5

; <label>:5:                                      ; preds = %5, %4
  %indvars.iv4 = phi i64 [ 0, %4 ], [ %indvars.iv.next5.4, %5 ]
  %6 = trunc i64 %indvars.iv4 to i32
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds double, double* %3, i64 %indvars.iv4
  store double %7, double* %8, align 8
  %indvars.iv.next5 = add nuw nsw i64 %indvars.iv4, 1
  %9 = trunc i64 %indvars.iv.next5 to i32
  %10 = sitofp i32 %9 to double
  %11 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next5
  store double %10, double* %11, align 8
  %indvars.iv.next5.1 = add nuw nsw i64 %indvars.iv4, 2
  %12 = trunc i64 %indvars.iv.next5.1 to i32
  %13 = sitofp i32 %12 to double
  %14 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next5.1
  store double %13, double* %14, align 8
  %indvars.iv.next5.2 = add nuw nsw i64 %indvars.iv4, 3
  %15 = trunc i64 %indvars.iv.next5.2 to i32
  %16 = sitofp i32 %15 to double
  %17 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next5.2
  store double %16, double* %17, align 8
  %indvars.iv.next5.3 = add nuw nsw i64 %indvars.iv4, 4
  %18 = trunc i64 %indvars.iv.next5.3 to i32
  %19 = sitofp i32 %18 to double
  %20 = getelementptr inbounds double, double* %3, i64 %indvars.iv.next5.3
  store double %19, double* %20, align 8
  %exitcond6.4 = icmp eq i64 %indvars.iv.next5.3, 499
  %indvars.iv.next5.4 = add nuw nsw i64 %indvars.iv4, 5
  br i1 %exitcond6.4, label %._crit_edge2.preheader, label %5

._crit_edge2.preheader:                           ; preds = %5
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2.preheader, %44
  %indvars.iv2 = phi i64 [ %indvars.iv.next3, %44 ], [ 0, %._crit_edge2.preheader ]
  %21 = trunc i64 %indvars.iv2 to i32
  %22 = sitofp i32 %21 to double
  %23 = insertelement <2 x double> undef, double %22, i32 0
  %24 = shufflevector <2 x double> %23, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1, %._crit_edge2
  %indvars.iv = phi i64 [ 0, %._crit_edge2 ], [ %indvars.iv.next, %._crit_edge1 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %25 = trunc i64 %indvars.iv.next to i32
  %26 = sitofp i32 %25 to double
  %27 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv2, i64 %indvars.iv
  %28 = add nuw nsw i64 %indvars.iv, 2
  %29 = trunc i64 %28 to i32
  %30 = sitofp i32 %29 to double
  %31 = insertelement <2 x double> undef, double %26, i32 0
  %32 = insertelement <2 x double> %31, double %30, i32 1
  %33 = fmul <2 x double> %24, %32
  %34 = fdiv <2 x double> %33, <double 1.000000e+03, double 1.200000e+03>
  %35 = extractelement <2 x double> %34, i32 0
  %36 = extractelement <2 x double> %34, i32 1
  store double %35, double* %27, align 8
  %37 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv2, i64 %indvars.iv
  store double %36, double* %37, align 8
  %38 = add nuw nsw i64 %indvars.iv, 3
  %39 = trunc i64 %38 to i32
  %40 = sitofp i32 %39 to double
  %41 = fmul double %22, %40
  %42 = fdiv double %41, 1.000000e+03
  %43 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv2, i64 %indvars.iv
  store double %42, double* %43, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1199
  br i1 %exitcond, label %44, label %._crit_edge1

; <label>:44:                                     ; preds = %._crit_edge1
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next3, 1000
  br i1 %exitcond7, label %45, label %._crit_edge2

; <label>:45:                                     ; preds = %44
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_fdtd_2d([1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture readonly) unnamed_addr #2 {
  %scevgep124 = getelementptr [1200 x double], [1200 x double]* %1, i64 1, i64 0
  br label %._crit_edge

._crit_edge:                                      ; preds = %214, %4
  %indvars.iv23 = phi i64 [ 0, %4 ], [ %indvars.iv.next24, %214 ]
  %5 = getelementptr inbounds double, double* %3, i64 %indvars.iv23
  %6 = bitcast double* %5 to [1200 x double]*
  %bound0127 = icmp ugt [1200 x double]* %6, %1
  %bound1128 = icmp ult double* %5, %scevgep124
  %memcheck.conflict130 = and i1 %bound0127, %bound1128
  br i1 %memcheck.conflict130, label %scalar.ph121.preheader, label %vector.body119.preheader

vector.body119.preheader:                         ; preds = %._crit_edge
  %7 = bitcast double* %5 to i64*
  %8 = bitcast double* %5 to i64*
  %9 = bitcast double* %5 to i64*
  br label %vector.body119

scalar.ph121.preheader:                           ; preds = %._crit_edge
  %10 = bitcast double* %5 to i64*
  %11 = bitcast double* %5 to i64*
  %12 = bitcast double* %5 to i64*
  %13 = bitcast double* %5 to i64*
  %14 = bitcast double* %5 to i64*
  %15 = bitcast double* %5 to i64*
  %16 = bitcast double* %5 to i64*
  %17 = bitcast double* %5 to i64*
  br label %scalar.ph121

vector.body119:                                   ; preds = %vector.body119, %vector.body119.preheader
  %index133 = phi i64 [ 0, %vector.body119.preheader ], [ %index.next134.2, %vector.body119 ]
  %18 = load i64, i64* %7, align 8, !alias.scope !1
  %19 = insertelement <2 x i64> undef, i64 %18, i32 0
  %20 = shufflevector <2 x i64> %19, <2 x i64> undef, <2 x i32> zeroinitializer
  %21 = insertelement <2 x i64> undef, i64 %18, i32 0
  %22 = shufflevector <2 x i64> %21, <2 x i64> undef, <2 x i32> zeroinitializer
  %23 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index133
  %24 = bitcast double* %23 to <2 x i64>*
  store <2 x i64> %20, <2 x i64>* %24, align 8, !alias.scope !4, !noalias !1
  %25 = getelementptr double, double* %23, i64 2
  %26 = bitcast double* %25 to <2 x i64>*
  store <2 x i64> %22, <2 x i64>* %26, align 8, !alias.scope !4, !noalias !1
  %index.next134 = add nuw nsw i64 %index133, 4
  %27 = load i64, i64* %8, align 8, !alias.scope !1
  %28 = insertelement <2 x i64> undef, i64 %27, i32 0
  %29 = shufflevector <2 x i64> %28, <2 x i64> undef, <2 x i32> zeroinitializer
  %30 = insertelement <2 x i64> undef, i64 %27, i32 0
  %31 = shufflevector <2 x i64> %30, <2 x i64> undef, <2 x i32> zeroinitializer
  %32 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index.next134
  %33 = bitcast double* %32 to <2 x i64>*
  store <2 x i64> %29, <2 x i64>* %33, align 8, !alias.scope !4, !noalias !1
  %34 = getelementptr double, double* %32, i64 2
  %35 = bitcast double* %34 to <2 x i64>*
  store <2 x i64> %31, <2 x i64>* %35, align 8, !alias.scope !4, !noalias !1
  %index.next134.1 = add nuw nsw i64 %index133, 8
  %36 = load i64, i64* %9, align 8, !alias.scope !1
  %37 = insertelement <2 x i64> undef, i64 %36, i32 0
  %38 = shufflevector <2 x i64> %37, <2 x i64> undef, <2 x i32> zeroinitializer
  %39 = insertelement <2 x i64> undef, i64 %36, i32 0
  %40 = shufflevector <2 x i64> %39, <2 x i64> undef, <2 x i32> zeroinitializer
  %41 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index.next134.1
  %42 = bitcast double* %41 to <2 x i64>*
  store <2 x i64> %38, <2 x i64>* %42, align 8, !alias.scope !4, !noalias !1
  %43 = getelementptr double, double* %41, i64 2
  %44 = bitcast double* %43 to <2 x i64>*
  store <2 x i64> %40, <2 x i64>* %44, align 8, !alias.scope !4, !noalias !1
  %index.next134.2 = add nuw nsw i64 %index133, 12
  %45 = icmp eq i64 %index.next134.2, 1200
  br i1 %45, label %._crit_edge2.preheader.loopexit144, label %vector.body119, !llvm.loop !6

scalar.ph121:                                     ; preds = %scalar.ph121, %scalar.ph121.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph121.preheader ], [ %indvars.iv.next.7, %scalar.ph121 ]
  %46 = load i64, i64* %10, align 8
  %47 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv
  %48 = bitcast double* %47 to i64*
  store i64 %46, i64* %48, align 8
  %indvars.iv.next = or i64 %indvars.iv, 1
  %49 = load i64, i64* %11, align 8
  %50 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next
  %51 = bitcast double* %50 to i64*
  store i64 %49, i64* %51, align 8
  %indvars.iv.next.1 = or i64 %indvars.iv, 2
  %52 = load i64, i64* %12, align 8
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.1
  %54 = bitcast double* %53 to i64*
  store i64 %52, i64* %54, align 8
  %indvars.iv.next.2 = or i64 %indvars.iv, 3
  %55 = load i64, i64* %13, align 8
  %56 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.2
  %57 = bitcast double* %56 to i64*
  store i64 %55, i64* %57, align 8
  %indvars.iv.next.3 = or i64 %indvars.iv, 4
  %58 = load i64, i64* %14, align 8
  %59 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.3
  %60 = bitcast double* %59 to i64*
  store i64 %58, i64* %60, align 8
  %indvars.iv.next.4 = or i64 %indvars.iv, 5
  %61 = load i64, i64* %15, align 8
  %62 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.4
  %63 = bitcast double* %62 to i64*
  store i64 %61, i64* %63, align 8
  %indvars.iv.next.5 = or i64 %indvars.iv, 6
  %64 = load i64, i64* %16, align 8
  %65 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.5
  %66 = bitcast double* %65 to i64*
  store i64 %64, i64* %66, align 8
  %indvars.iv.next.6 = or i64 %indvars.iv, 7
  %67 = load i64, i64* %17, align 8
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv.next.6
  %69 = bitcast double* %68 to i64*
  store i64 %67, i64* %69, align 8
  %exitcond.7 = icmp eq i64 %indvars.iv.next.6, 1199
  %indvars.iv.next.7 = add nuw nsw i64 %indvars.iv, 8
  br i1 %exitcond.7, label %._crit_edge2.preheader.loopexit, label %scalar.ph121, !llvm.loop !9

._crit_edge2.preheader.loopexit:                  ; preds = %scalar.ph121
  br label %._crit_edge2.preheader

._crit_edge2.preheader.loopexit144:               ; preds = %vector.body119
  br label %._crit_edge2.preheader

._crit_edge2.preheader:                           ; preds = %._crit_edge2.preheader.loopexit144, %._crit_edge2.preheader.loopexit
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2.preheader, %middle.block87
  %indvar = phi i64 [ %indvar.next, %middle.block87 ], [ 0, %._crit_edge2.preheader ]
  %indvars.iv11 = phi i64 [ %indvars.iv.next12, %middle.block87 ], [ 1, %._crit_edge2.preheader ]
  %70 = add nuw nsw i64 %indvar, 1
  %scevgep91 = getelementptr [1200 x double], [1200 x double]* %1, i64 %70, i64 0
  %71 = add nuw nsw i64 %indvar, 2
  %scevgep93 = getelementptr [1200 x double], [1200 x double]* %1, i64 %71, i64 0
  %scevgep95 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvar, i64 0
  %scevgep97 = getelementptr [1200 x double], [1200 x double]* %2, i64 %71, i64 0
  %72 = add nsw i64 %indvars.iv11, -1
  %bound099 = icmp ult double* %scevgep91, %scevgep97
  %bound1100 = icmp ult double* %scevgep95, %scevgep93
  %memcheck.conflict102 = and i1 %bound099, %bound1100
  br i1 %memcheck.conflict102, label %scalar.ph88.preheader, label %vector.body86.preheader

vector.body86.preheader:                          ; preds = %._crit_edge2
  br label %vector.body86

scalar.ph88.preheader:                            ; preds = %._crit_edge2
  br label %scalar.ph88

vector.body86:                                    ; preds = %vector.body86.preheader, %vector.body86
  %index105 = phi i64 [ %index.next106, %vector.body86 ], [ 0, %vector.body86.preheader ]
  %73 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv11, i64 %index105
  %74 = bitcast double* %73 to <2 x double>*
  %wide.load113 = load <2 x double>, <2 x double>* %74, align 8, !alias.scope !10, !noalias !13
  %75 = getelementptr double, double* %73, i64 2
  %76 = bitcast double* %75 to <2 x double>*
  %wide.load114 = load <2 x double>, <2 x double>* %76, align 8, !alias.scope !10, !noalias !13
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv11, i64 %index105
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load115 = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !13
  %79 = getelementptr double, double* %77, i64 2
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load116 = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !13
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %72, i64 %index105
  %82 = bitcast double* %81 to <2 x double>*
  %wide.load117 = load <2 x double>, <2 x double>* %82, align 8, !alias.scope !13
  %83 = getelementptr double, double* %81, i64 2
  %84 = bitcast double* %83 to <2 x double>*
  %wide.load118 = load <2 x double>, <2 x double>* %84, align 8, !alias.scope !13
  %85 = fsub <2 x double> %wide.load115, %wide.load117
  %86 = fsub <2 x double> %wide.load116, %wide.load118
  %87 = fmul <2 x double> %85, <double 5.000000e-01, double 5.000000e-01>
  %88 = fmul <2 x double> %86, <double 5.000000e-01, double 5.000000e-01>
  %89 = fsub <2 x double> %wide.load113, %87
  %90 = fsub <2 x double> %wide.load114, %88
  %91 = bitcast double* %73 to <2 x double>*
  store <2 x double> %89, <2 x double>* %91, align 8, !alias.scope !10, !noalias !13
  %92 = bitcast double* %75 to <2 x double>*
  store <2 x double> %90, <2 x double>* %92, align 8, !alias.scope !10, !noalias !13
  %index.next106 = add nuw nsw i64 %index105, 4
  %93 = icmp eq i64 %index.next106, 1200
  br i1 %93, label %middle.block87.loopexit143, label %vector.body86, !llvm.loop !15

scalar.ph88:                                      ; preds = %scalar.ph88, %scalar.ph88.preheader
  %indvars.iv8 = phi i64 [ 0, %scalar.ph88.preheader ], [ %indvars.iv.next9.1, %scalar.ph88 ]
  %94 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv11, i64 %indvars.iv8
  %95 = load double, double* %94, align 8
  %96 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv8
  %97 = load double, double* %96, align 8
  %98 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %72, i64 %indvars.iv8
  %99 = load double, double* %98, align 8
  %100 = fsub double %97, %99
  %101 = fmul double %100, 5.000000e-01
  %102 = fsub double %95, %101
  store double %102, double* %94, align 8
  %indvars.iv.next9 = or i64 %indvars.iv8, 1
  %103 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv11, i64 %indvars.iv.next9
  %104 = load double, double* %103, align 8
  %105 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv.next9
  %106 = load double, double* %105, align 8
  %107 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %72, i64 %indvars.iv.next9
  %108 = load double, double* %107, align 8
  %109 = fsub double %106, %108
  %110 = fmul double %109, 5.000000e-01
  %111 = fsub double %104, %110
  store double %111, double* %103, align 8
  %exitcond10.1 = icmp eq i64 %indvars.iv.next9, 1199
  %indvars.iv.next9.1 = add nuw nsw i64 %indvars.iv8, 2
  br i1 %exitcond10.1, label %middle.block87.loopexit, label %scalar.ph88, !llvm.loop !16

middle.block87.loopexit:                          ; preds = %scalar.ph88
  br label %middle.block87

middle.block87.loopexit143:                       ; preds = %vector.body86
  br label %middle.block87

middle.block87:                                   ; preds = %middle.block87.loopexit143, %middle.block87.loopexit
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next12, 1000
  %indvar.next = add nuw nsw i64 %indvar, 1
  br i1 %exitcond25, label %._crit_edge4.preheader, label %._crit_edge2

._crit_edge4.preheader:                           ; preds = %middle.block87
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.preheader, %.loopexit141
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %.loopexit141 ], [ 0, %._crit_edge4.preheader ]
  %scevgep58 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv16, i64 1
  %112 = add nuw nsw i64 %indvars.iv16, 1
  %scevgep60 = getelementptr [1200 x double], [1200 x double]* %0, i64 %112, i64 0
  %scevgep62 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv16, i64 0
  %scevgep64 = getelementptr [1200 x double], [1200 x double]* %2, i64 %112, i64 0
  %bound066 = icmp ult double* %scevgep58, %scevgep64
  %bound167 = icmp ult double* %scevgep62, %scevgep60
  %memcheck.conflict69 = and i1 %bound066, %bound167
  br i1 %memcheck.conflict69, label %scalar.ph55.preheader, label %vector.body53.preheader

vector.body53.preheader:                          ; preds = %._crit_edge4
  br label %vector.body53

vector.body53:                                    ; preds = %vector.body53.preheader, %vector.body53
  %index72 = phi i64 [ %index.next73, %vector.body53 ], [ 0, %vector.body53.preheader ]
  %offset.idx = or i64 %index72, 1
  %113 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv16, i64 %offset.idx
  %114 = bitcast double* %113 to <2 x double>*
  %wide.load80 = load <2 x double>, <2 x double>* %114, align 8, !alias.scope !17, !noalias !20
  %115 = getelementptr double, double* %113, i64 2
  %116 = bitcast double* %115 to <2 x double>*
  %wide.load81 = load <2 x double>, <2 x double>* %116, align 8, !alias.scope !17, !noalias !20
  %117 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv16, i64 %offset.idx
  %118 = bitcast double* %117 to <2 x double>*
  %wide.load82 = load <2 x double>, <2 x double>* %118, align 8, !alias.scope !20
  %119 = getelementptr double, double* %117, i64 2
  %120 = bitcast double* %119 to <2 x double>*
  %wide.load83 = load <2 x double>, <2 x double>* %120, align 8, !alias.scope !20
  %121 = add nsw i64 %offset.idx, -1
  %122 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv16, i64 %121
  %123 = bitcast double* %122 to <2 x double>*
  %wide.load84 = load <2 x double>, <2 x double>* %123, align 8, !alias.scope !20
  %124 = getelementptr double, double* %122, i64 2
  %125 = bitcast double* %124 to <2 x double>*
  %wide.load85 = load <2 x double>, <2 x double>* %125, align 8, !alias.scope !20
  %126 = fsub <2 x double> %wide.load82, %wide.load84
  %127 = fsub <2 x double> %wide.load83, %wide.load85
  %128 = fmul <2 x double> %126, <double 5.000000e-01, double 5.000000e-01>
  %129 = fmul <2 x double> %127, <double 5.000000e-01, double 5.000000e-01>
  %130 = fsub <2 x double> %wide.load80, %128
  %131 = fsub <2 x double> %wide.load81, %129
  %132 = bitcast double* %113 to <2 x double>*
  store <2 x double> %130, <2 x double>* %132, align 8, !alias.scope !17, !noalias !20
  %133 = bitcast double* %115 to <2 x double>*
  store <2 x double> %131, <2 x double>* %133, align 8, !alias.scope !17, !noalias !20
  %index.next73 = add nuw nsw i64 %index72, 4
  %134 = icmp eq i64 %index.next73, 1196
  br i1 %134, label %scalar.ph55.preheader.loopexit, label %vector.body53, !llvm.loop !22

scalar.ph55.preheader.loopexit:                   ; preds = %vector.body53
  br label %scalar.ph55.preheader

scalar.ph55.preheader:                            ; preds = %scalar.ph55.preheader.loopexit, %._crit_edge4
  %indvars.iv13.ph = phi i64 [ 1, %._crit_edge4 ], [ 1197, %scalar.ph55.preheader.loopexit ]
  br i1 true, label %scalar.ph55.prol.preheader, label %scalar.ph55.prol.loopexit.unr-lcssa

scalar.ph55.prol.preheader:                       ; preds = %scalar.ph55.preheader
  br label %scalar.ph55.prol

scalar.ph55.prol:                                 ; preds = %scalar.ph55.prol.preheader
  %135 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv16, i64 %indvars.iv13.ph
  %136 = load double, double* %135, align 8
  %137 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv13.ph
  %138 = load double, double* %137, align 8
  %139 = add nsw i64 %indvars.iv13.ph, -1
  %140 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv16, i64 %139
  %141 = load double, double* %140, align 8
  %142 = fsub double %138, %141
  %143 = fmul double %142, 5.000000e-01
  %144 = fsub double %136, %143
  store double %144, double* %135, align 8
  %indvars.iv.next14.prol = add nuw nsw i64 %indvars.iv13.ph, 1
  br label %scalar.ph55.prol.loopexit.unr-lcssa

scalar.ph55.prol.loopexit.unr-lcssa:              ; preds = %scalar.ph55.preheader, %scalar.ph55.prol
  %indvars.iv13.unr.ph = phi i64 [ %indvars.iv.next14.prol, %scalar.ph55.prol ], [ %indvars.iv13.ph, %scalar.ph55.preheader ]
  br label %scalar.ph55.prol.loopexit

scalar.ph55.prol.loopexit:                        ; preds = %scalar.ph55.prol.loopexit.unr-lcssa
  br i1 false, label %.loopexit141, label %scalar.ph55.preheader.new

scalar.ph55.preheader.new:                        ; preds = %scalar.ph55.prol.loopexit
  br label %scalar.ph55

scalar.ph55:                                      ; preds = %scalar.ph55, %scalar.ph55.preheader.new
  %indvars.iv13 = phi i64 [ %indvars.iv13.unr.ph, %scalar.ph55.preheader.new ], [ %indvars.iv.next14.1, %scalar.ph55 ]
  %145 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv16, i64 %indvars.iv13
  %146 = load double, double* %145, align 8
  %147 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv13
  %148 = load double, double* %147, align 8
  %149 = add nsw i64 %indvars.iv13, -1
  %150 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv16, i64 %149
  %151 = load double, double* %150, align 8
  %152 = fsub double %148, %151
  %153 = fmul double %152, 5.000000e-01
  %154 = fsub double %146, %153
  store double %154, double* %145, align 8
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %155 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv16, i64 %indvars.iv.next14
  %156 = load double, double* %155, align 8
  %157 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv.next14
  %158 = load double, double* %157, align 8
  %159 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv13
  %160 = load double, double* %159, align 8
  %161 = fsub double %158, %160
  %162 = fmul double %161, 5.000000e-01
  %163 = fsub double %156, %162
  store double %163, double* %155, align 8
  %exitcond15.1 = icmp eq i64 %indvars.iv.next14, 1199
  %indvars.iv.next14.1 = add nsw i64 %indvars.iv13, 2
  br i1 %exitcond15.1, label %.loopexit141.unr-lcssa, label %scalar.ph55, !llvm.loop !23

.loopexit141.unr-lcssa:                           ; preds = %scalar.ph55
  br label %.loopexit141

.loopexit141:                                     ; preds = %scalar.ph55.prol.loopexit, %.loopexit141.unr-lcssa
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond26 = icmp eq i64 %indvars.iv.next17, 1000
  br i1 %exitcond26, label %._crit_edge6.preheader, label %._crit_edge4

._crit_edge6.preheader:                           ; preds = %.loopexit141
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.preheader, %.loopexit
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %.loopexit ], [ 0, %._crit_edge6.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv21, i64 0
  %scevgep30 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv21, i64 1199
  %scevgep32 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv21, i64 0
  %164 = add nuw nsw i64 %indvars.iv21, 1
  %scevgep34 = getelementptr [1200 x double], [1200 x double]* %0, i64 %164, i64 0
  %scevgep36 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv21, i64 0
  %scevgep38 = getelementptr [1200 x double], [1200 x double]* %1, i64 %164, i64 1199
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %bound0 = icmp ult double* %scevgep, %scevgep34
  %bound1 = icmp ult double* %scevgep32, %scevgep30
  %found.conflict = and i1 %bound0, %bound1
  %bound040 = icmp ult double* %scevgep, %scevgep38
  %bound141 = icmp ult double* %scevgep36, %scevgep30
  %found.conflict42 = and i1 %bound040, %bound141
  %conflict.rdx = or i1 %found.conflict, %found.conflict42
  br i1 %conflict.rdx, label %._crit_edge7.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %._crit_edge6
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %165 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv21, i64 %index
  %166 = bitcast double* %165 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %166, align 8, !alias.scope !24, !noalias !27
  %167 = getelementptr double, double* %165, i64 2
  %168 = bitcast double* %167 to <2 x double>*
  %wide.load44 = load <2 x double>, <2 x double>* %168, align 8, !alias.scope !24, !noalias !27
  %169 = or i64 %index, 1
  %170 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv21, i64 %169
  %171 = bitcast double* %170 to <2 x double>*
  %wide.load45 = load <2 x double>, <2 x double>* %171, align 8, !alias.scope !30
  %172 = getelementptr double, double* %170, i64 2
  %173 = bitcast double* %172 to <2 x double>*
  %wide.load46 = load <2 x double>, <2 x double>* %173, align 8, !alias.scope !30
  %174 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv21, i64 %index
  %175 = bitcast double* %174 to <2 x double>*
  %wide.load47 = load <2 x double>, <2 x double>* %175, align 8, !alias.scope !30
  %176 = getelementptr double, double* %174, i64 2
  %177 = bitcast double* %176 to <2 x double>*
  %wide.load48 = load <2 x double>, <2 x double>* %177, align 8, !alias.scope !30
  %178 = fsub <2 x double> %wide.load45, %wide.load47
  %179 = fsub <2 x double> %wide.load46, %wide.load48
  %180 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next22, i64 %index
  %181 = bitcast double* %180 to <2 x double>*
  %wide.load49 = load <2 x double>, <2 x double>* %181, align 8, !alias.scope !31
  %182 = getelementptr double, double* %180, i64 2
  %183 = bitcast double* %182 to <2 x double>*
  %wide.load50 = load <2 x double>, <2 x double>* %183, align 8, !alias.scope !31
  %184 = fadd <2 x double> %178, %wide.load49
  %185 = fadd <2 x double> %179, %wide.load50
  %186 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv21, i64 %index
  %187 = bitcast double* %186 to <2 x double>*
  %wide.load51 = load <2 x double>, <2 x double>* %187, align 8, !alias.scope !31
  %188 = getelementptr double, double* %186, i64 2
  %189 = bitcast double* %188 to <2 x double>*
  %wide.load52 = load <2 x double>, <2 x double>* %189, align 8, !alias.scope !31
  %190 = fsub <2 x double> %184, %wide.load51
  %191 = fsub <2 x double> %185, %wide.load52
  %192 = fmul <2 x double> %190, <double 7.000000e-01, double 7.000000e-01>
  %193 = fmul <2 x double> %191, <double 7.000000e-01, double 7.000000e-01>
  %194 = fsub <2 x double> %wide.load, %192
  %195 = fsub <2 x double> %wide.load44, %193
  %196 = bitcast double* %165 to <2 x double>*
  store <2 x double> %194, <2 x double>* %196, align 8, !alias.scope !24, !noalias !27
  %197 = bitcast double* %167 to <2 x double>*
  store <2 x double> %195, <2 x double>* %197, align 8, !alias.scope !24, !noalias !27
  %index.next = add nuw nsw i64 %index, 4
  %198 = icmp eq i64 %index.next, 1196
  br i1 %198, label %._crit_edge7.preheader.loopexit, label %vector.body, !llvm.loop !32

._crit_edge7.preheader.loopexit:                  ; preds = %vector.body
  br label %._crit_edge7.preheader

._crit_edge7.preheader:                           ; preds = %._crit_edge7.preheader.loopexit, %._crit_edge6
  %indvars.iv18.ph = phi i64 [ 0, %._crit_edge6 ], [ 1196, %._crit_edge7.preheader.loopexit ]
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.preheader, %._crit_edge7
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %._crit_edge7 ], [ %indvars.iv18.ph, %._crit_edge7.preheader ]
  %199 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv21, i64 %indvars.iv18
  %200 = load double, double* %199, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %201 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv21, i64 %indvars.iv.next19
  %202 = load double, double* %201, align 8
  %203 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv21, i64 %indvars.iv18
  %204 = load double, double* %203, align 8
  %205 = fsub double %202, %204
  %206 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next22, i64 %indvars.iv18
  %207 = load double, double* %206, align 8
  %208 = fadd double %205, %207
  %209 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv21, i64 %indvars.iv18
  %210 = load double, double* %209, align 8
  %211 = fsub double %208, %210
  %212 = fmul double %211, 7.000000e-01
  %213 = fsub double %200, %212
  store double %213, double* %199, align 8
  %exitcond20 = icmp eq i64 %indvars.iv18, 1198
  br i1 %exitcond20, label %.loopexit, label %._crit_edge7, !llvm.loop !33

.loopexit:                                        ; preds = %._crit_edge7
  %exitcond27 = icmp eq i64 %indvars.iv.next22, 999
  br i1 %exitcond27, label %214, label %._crit_edge6

; <label>:214:                                    ; preds = %.loopexit
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond28 = icmp eq i64 %indvars.iv.next24, 500
  br i1 %exitcond28, label %215, label %._crit_edge

; <label>:215:                                    ; preds = %214
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #5
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %19, %3
  %indvars.iv9 = phi i64 [ 0, %3 ], [ %indvars.iv.next10, %19 ]
  %8 = mul nuw nsw i64 %indvars.iv9, 1000
  br label %._crit_edge7._crit_edge

._crit_edge7._crit_edge:                          ; preds = %._crit_edge7, %._crit_edge
  %indvars.iv7 = phi i64 [ 0, %._crit_edge ], [ %indvars.iv.next8, %._crit_edge7 ]
  %9 = add nuw nsw i64 %indvars.iv7, %8
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge7

; <label>:13:                                     ; preds = %._crit_edge7._crit_edge
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc6 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #5
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7._crit_edge, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv9, i64 %indvars.iv7
  %17 = load double, double* %16, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next8, 1200
  br i1 %exitcond14, label %19, label %._crit_edge7._crit_edge

; <label>:19:                                     ; preds = %._crit_edge7
  %indvars.iv.next10 = add nuw nsw i64 %indvars.iv9, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next10, 1000
  br i1 %exitcond15, label %20, label %._crit_edge

; <label>:20:                                     ; preds = %19
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #5
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  br label %._crit_edge8

._crit_edge8:                                     ; preds = %38, %20
  %indvars.iv5 = phi i64 [ 0, %20 ], [ %indvars.iv.next6, %38 ]
  %27 = mul nuw nsw i64 %indvars.iv5, 1000
  br label %._crit_edge9._crit_edge

._crit_edge9._crit_edge:                          ; preds = %._crit_edge9, %._crit_edge8
  %indvars.iv3 = phi i64 [ 0, %._crit_edge8 ], [ %indvars.iv.next4, %._crit_edge9 ]
  %28 = add nuw nsw i64 %indvars.iv3, %27
  %29 = trunc i64 %28 to i32
  %30 = srem i32 %29, 20
  %31 = icmp eq i32 %30, 0
  br i1 %31, label %32, label %._crit_edge9

; <label>:32:                                     ; preds = %._crit_edge9._crit_edge
  %33 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc3 = tail call i32 @fputc(i32 10, %struct._IO_FILE* %33) #5
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9._crit_edge, %32
  %34 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %35 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv5, i64 %indvars.iv3
  %36 = load double, double* %35, align 8
  %37 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %34, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %36) #6
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond12 = icmp eq i64 %indvars.iv.next4, 1200
  br i1 %exitcond12, label %38, label %._crit_edge9._crit_edge

; <label>:38:                                     ; preds = %._crit_edge9
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next6, 1000
  br i1 %exitcond13, label %39, label %._crit_edge8

; <label>:39:                                     ; preds = %38
  %40 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %41 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %40, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.8, i64 0, i64 0)) #6
  %42 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %43 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %42, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %55, %39
  %indvars.iv1 = phi i64 [ 0, %39 ], [ %indvars.iv.next2, %55 ]
  %44 = mul nuw nsw i64 %indvars.iv1, 1000
  br label %._crit_edge11._crit_edge

._crit_edge11._crit_edge:                         ; preds = %._crit_edge11, %._crit_edge10
  %indvars.iv = phi i64 [ 0, %._crit_edge10 ], [ %indvars.iv.next, %._crit_edge11 ]
  %45 = add nuw nsw i64 %indvars.iv, %44
  %46 = trunc i64 %45 to i32
  %47 = srem i32 %46, 20
  %48 = icmp eq i32 %47, 0
  br i1 %48, label %49, label %._crit_edge11

; <label>:49:                                     ; preds = %._crit_edge11._crit_edge
  %50 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %50) #5
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge11._crit_edge, %49
  %51 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %52 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv1, i64 %indvars.iv
  %53 = load double, double* %52, align 8
  %54 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %51, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %53) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 1200
  br i1 %exitcond, label %55, label %._crit_edge11._crit_edge

; <label>:55:                                     ; preds = %._crit_edge11
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond11 = icmp eq i64 %indvars.iv.next2, 1000
  br i1 %exitcond11, label %56, label %._crit_edge10

; <label>:56:                                     ; preds = %55
  %57 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %58 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %57, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([3 x i8], [3 x i8]* @.str.9, i64 0, i64 0)) #6
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
