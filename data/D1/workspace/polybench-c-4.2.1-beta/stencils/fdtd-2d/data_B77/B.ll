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
  %16 = bitcast i8* %5 to [1200 x double]*
  %17 = bitcast i8* %4 to [1200 x double]*
  %18 = bitcast i8* %3 to [1200 x double]*
  tail call void @print_array([1200 x double]* %18, [1200 x double]* %17, [1200 x double]* %16)
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

; <label>:5:                                      ; preds = %._crit_edge, %4
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %._crit_edge ], [ 0, %4 ]
  %6 = trunc i64 %indvars.iv5 to i32
  %7 = sitofp i32 %6 to double
  %8 = getelementptr inbounds double, double* %3, i64 %indvars.iv5
  store double %7, double* %8, align 8
  %exitcond7 = icmp eq i64 %indvars.iv5, 499
  br i1 %exitcond7, label %._crit_edge1.preheader, label %._crit_edge

._crit_edge1.preheader:                           ; preds = %5
  br label %._crit_edge1

._crit_edge:                                      ; preds = %5
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  br label %5

._crit_edge1:                                     ; preds = %32, %._crit_edge1.preheader
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %32 ], [ 0, %._crit_edge1.preheader ]
  %9 = trunc i64 %indvars.iv3 to i32
  %10 = sitofp i32 %9 to double
  %11 = insertelement <2 x double> undef, double %10, i32 0
  %12 = shufflevector <2 x double> %11, <2 x double> undef, <2 x i32> zeroinitializer
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2, %._crit_edge1
  %indvars.iv = phi i64 [ 0, %._crit_edge1 ], [ %indvars.iv.next, %._crit_edge2 ]
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %13 = trunc i64 %indvars.iv.next to i32
  %14 = sitofp i32 %13 to double
  %15 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv
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
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv3, i64 %indvars.iv
  store double %24, double* %25, align 8
  %26 = add nuw nsw i64 %indvars.iv, 3
  %27 = trunc i64 %26 to i32
  %28 = sitofp i32 %27 to double
  %29 = fmul double %10, %28
  %30 = fdiv double %29, 1.000000e+03
  %31 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv3, i64 %indvars.iv
  store double %30, double* %31, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1199
  br i1 %exitcond, label %32, label %._crit_edge2

; <label>:32:                                     ; preds = %._crit_edge2
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next4, 1000
  br i1 %exitcond8, label %33, label %._crit_edge1

; <label>:33:                                     ; preds = %32
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @kernel_fdtd_2d([1200 x double]* nocapture, [1200 x double]* nocapture, [1200 x double]* nocapture, double* nocapture readonly) #2 {
  %scevgep120 = getelementptr [1200 x double], [1200 x double]* %1, i64 1, i64 0
  br label %._crit_edge

._crit_edge:                                      ; preds = %159, %4
  %indvars.iv23 = phi i64 [ 0, %4 ], [ %indvars.iv.next24, %159 ]
  %5 = getelementptr inbounds double, double* %3, i64 %indvars.iv23
  %6 = bitcast double* %5 to [1200 x double]*
  %bound0123 = icmp ugt [1200 x double]* %6, %1
  %bound1124 = icmp ult double* %5, %scevgep120
  %memcheck.conflict126 = and i1 %bound0123, %bound1124
  br i1 %memcheck.conflict126, label %scalar.ph117.preheader, label %vector.body115.preheader

vector.body115.preheader:                         ; preds = %._crit_edge
  %7 = bitcast double* %5 to i64*
  %8 = bitcast double* %5 to i64*
  %9 = bitcast double* %5 to i64*
  br label %vector.body115

scalar.ph117.preheader:                           ; preds = %._crit_edge
  %10 = bitcast double* %5 to i64*
  br label %scalar.ph117

vector.body115:                                   ; preds = %vector.body115, %vector.body115.preheader
  %index129 = phi i64 [ 0, %vector.body115.preheader ], [ %index.next130.2, %vector.body115 ]
  %11 = load i64, i64* %7, align 8, !alias.scope !1
  %12 = insertelement <2 x i64> undef, i64 %11, i32 0
  %13 = shufflevector <2 x i64> %12, <2 x i64> undef, <2 x i32> zeroinitializer
  %14 = insertelement <2 x i64> undef, i64 %11, i32 0
  %15 = shufflevector <2 x i64> %14, <2 x i64> undef, <2 x i32> zeroinitializer
  %16 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index129
  %17 = bitcast double* %16 to <2 x i64>*
  store <2 x i64> %13, <2 x i64>* %17, align 8, !alias.scope !4, !noalias !1
  %18 = getelementptr double, double* %16, i64 2
  %19 = bitcast double* %18 to <2 x i64>*
  store <2 x i64> %15, <2 x i64>* %19, align 8, !alias.scope !4, !noalias !1
  %index.next130 = add nuw nsw i64 %index129, 4
  %20 = load i64, i64* %8, align 8, !alias.scope !1
  %21 = insertelement <2 x i64> undef, i64 %20, i32 0
  %22 = shufflevector <2 x i64> %21, <2 x i64> undef, <2 x i32> zeroinitializer
  %23 = insertelement <2 x i64> undef, i64 %20, i32 0
  %24 = shufflevector <2 x i64> %23, <2 x i64> undef, <2 x i32> zeroinitializer
  %25 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index.next130
  %26 = bitcast double* %25 to <2 x i64>*
  store <2 x i64> %22, <2 x i64>* %26, align 8, !alias.scope !4, !noalias !1
  %27 = getelementptr double, double* %25, i64 2
  %28 = bitcast double* %27 to <2 x i64>*
  store <2 x i64> %24, <2 x i64>* %28, align 8, !alias.scope !4, !noalias !1
  %index.next130.1 = add nsw i64 %index129, 8
  %29 = load i64, i64* %9, align 8, !alias.scope !1
  %30 = insertelement <2 x i64> undef, i64 %29, i32 0
  %31 = shufflevector <2 x i64> %30, <2 x i64> undef, <2 x i32> zeroinitializer
  %32 = insertelement <2 x i64> undef, i64 %29, i32 0
  %33 = shufflevector <2 x i64> %32, <2 x i64> undef, <2 x i32> zeroinitializer
  %34 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %index.next130.1
  %35 = bitcast double* %34 to <2 x i64>*
  store <2 x i64> %31, <2 x i64>* %35, align 8, !alias.scope !4, !noalias !1
  %36 = getelementptr double, double* %34, i64 2
  %37 = bitcast double* %36 to <2 x i64>*
  store <2 x i64> %33, <2 x i64>* %37, align 8, !alias.scope !4, !noalias !1
  %index.next130.2 = add nsw i64 %index129, 12
  %38 = icmp eq i64 %index.next130.2, 1200
  br i1 %38, label %._crit_edge2.preheader.loopexit143, label %vector.body115, !llvm.loop !6

._crit_edge2.preheader.loopexit:                  ; preds = %scalar.ph117
  br label %._crit_edge2.preheader

._crit_edge2.preheader.loopexit143:               ; preds = %vector.body115
  br label %._crit_edge2.preheader

._crit_edge2.preheader:                           ; preds = %._crit_edge2.preheader.loopexit143, %._crit_edge2.preheader.loopexit
  br label %._crit_edge2

scalar.ph117:                                     ; preds = %scalar.ph117.preheader, %._crit_edge139
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge139 ], [ 0, %scalar.ph117.preheader ]
  %39 = load i64, i64* %10, align 8
  %40 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 0, i64 %indvars.iv
  %41 = bitcast double* %40 to i64*
  store i64 %39, i64* %41, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1199
  br i1 %exitcond, label %._crit_edge2.preheader.loopexit, label %._crit_edge139, !llvm.loop !9

._crit_edge139:                                   ; preds = %scalar.ph117
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %scalar.ph117

._crit_edge2:                                     ; preds = %._crit_edge2.preheader, %.._crit_edge2_crit_edge
  %indvar = phi i64 [ %indvar.next, %.._crit_edge2_crit_edge ], [ 0, %._crit_edge2.preheader ]
  %indvars.iv11 = phi i64 [ %indvars.iv.next12, %.._crit_edge2_crit_edge ], [ 1, %._crit_edge2.preheader ]
  %42 = add i64 %indvar, 1
  %scevgep87 = getelementptr [1200 x double], [1200 x double]* %1, i64 %42, i64 0
  %43 = add i64 %indvar, 2
  %scevgep89 = getelementptr [1200 x double], [1200 x double]* %1, i64 %43, i64 0
  %scevgep91 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvar, i64 0
  %scevgep93 = getelementptr [1200 x double], [1200 x double]* %2, i64 %43, i64 0
  %44 = add nsw i64 %indvars.iv11, -1
  %bound095 = icmp ult double* %scevgep87, %scevgep93
  %bound196 = icmp ult double* %scevgep91, %scevgep89
  %memcheck.conflict98 = and i1 %bound095, %bound196
  br i1 %memcheck.conflict98, label %scalar.ph84.preheader, label %vector.body82.preheader

vector.body82.preheader:                          ; preds = %._crit_edge2
  br label %vector.body82

scalar.ph84.preheader:                            ; preds = %._crit_edge2
  br label %scalar.ph84

vector.body82:                                    ; preds = %vector.body82.preheader, %vector.body82
  %index101 = phi i64 [ %index.next102, %vector.body82 ], [ 0, %vector.body82.preheader ]
  %45 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv11, i64 %index101
  %46 = bitcast double* %45 to <2 x double>*
  %wide.load109 = load <2 x double>, <2 x double>* %46, align 8, !alias.scope !10, !noalias !13
  %47 = getelementptr double, double* %45, i64 2
  %48 = bitcast double* %47 to <2 x double>*
  %wide.load110 = load <2 x double>, <2 x double>* %48, align 8, !alias.scope !10, !noalias !13
  %49 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv11, i64 %index101
  %50 = bitcast double* %49 to <2 x double>*
  %wide.load111 = load <2 x double>, <2 x double>* %50, align 8, !alias.scope !13
  %51 = getelementptr double, double* %49, i64 2
  %52 = bitcast double* %51 to <2 x double>*
  %wide.load112 = load <2 x double>, <2 x double>* %52, align 8, !alias.scope !13
  %53 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %44, i64 %index101
  %54 = bitcast double* %53 to <2 x double>*
  %wide.load113 = load <2 x double>, <2 x double>* %54, align 8, !alias.scope !13
  %55 = getelementptr double, double* %53, i64 2
  %56 = bitcast double* %55 to <2 x double>*
  %wide.load114 = load <2 x double>, <2 x double>* %56, align 8, !alias.scope !13
  %57 = fsub <2 x double> %wide.load111, %wide.load113
  %58 = fsub <2 x double> %wide.load112, %wide.load114
  %59 = fmul <2 x double> %57, <double 5.000000e-01, double 5.000000e-01>
  %60 = fmul <2 x double> %58, <double 5.000000e-01, double 5.000000e-01>
  %61 = fsub <2 x double> %wide.load109, %59
  %62 = fsub <2 x double> %wide.load110, %60
  %63 = bitcast double* %45 to <2 x double>*
  store <2 x double> %61, <2 x double>* %63, align 8, !alias.scope !10, !noalias !13
  %64 = bitcast double* %47 to <2 x double>*
  store <2 x double> %62, <2 x double>* %64, align 8, !alias.scope !10, !noalias !13
  %index.next102 = add nuw nsw i64 %index101, 4
  %65 = icmp eq i64 %index.next102, 1200
  br i1 %65, label %middle.block83._crit_edge.loopexit142, label %vector.body82, !llvm.loop !15

scalar.ph84:                                      ; preds = %scalar.ph84.preheader, %._crit_edge140
  %indvars.iv8 = phi i64 [ %indvars.iv.next9, %._crit_edge140 ], [ 0, %scalar.ph84.preheader ]
  %66 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv11, i64 %indvars.iv8
  %67 = load double, double* %66, align 8
  %68 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv11, i64 %indvars.iv8
  %69 = load double, double* %68, align 8
  %70 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %44, i64 %indvars.iv8
  %71 = load double, double* %70, align 8
  %72 = fsub double %69, %71
  %73 = fmul double %72, 5.000000e-01
  %74 = fsub double %67, %73
  store double %74, double* %66, align 8
  %exitcond10 = icmp eq i64 %indvars.iv8, 1199
  br i1 %exitcond10, label %middle.block83._crit_edge.loopexit, label %._crit_edge140, !llvm.loop !16

._crit_edge140:                                   ; preds = %scalar.ph84
  %indvars.iv.next9 = add nuw nsw i64 %indvars.iv8, 1
  br label %scalar.ph84

middle.block83._crit_edge.loopexit:               ; preds = %scalar.ph84
  br label %middle.block83._crit_edge

middle.block83._crit_edge.loopexit142:            ; preds = %vector.body82
  br label %middle.block83._crit_edge

middle.block83._crit_edge:                        ; preds = %middle.block83._crit_edge.loopexit142, %middle.block83._crit_edge.loopexit
  %indvars.iv.next12 = add nuw i64 %indvars.iv11, 1
  %75 = icmp slt i64 %indvars.iv.next12, 1000
  br i1 %75, label %.._crit_edge2_crit_edge, label %._crit_edge4.preheader

._crit_edge4.preheader:                           ; preds = %middle.block83._crit_edge
  br label %._crit_edge4

.._crit_edge2_crit_edge:                          ; preds = %middle.block83._crit_edge
  %indvar.next = add i64 %indvar, 1
  br label %._crit_edge2

._crit_edge4:                                     ; preds = %.loopexit137, %._crit_edge4.preheader
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %.loopexit137 ], [ 0, %._crit_edge4.preheader ]
  %scevgep54 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv16, i64 1
  %76 = add nuw nsw i64 %indvars.iv16, 1
  %scevgep56 = getelementptr [1200 x double], [1200 x double]* %0, i64 %76, i64 0
  %scevgep58 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv16, i64 0
  %scevgep60 = getelementptr [1200 x double], [1200 x double]* %2, i64 %76, i64 0
  %bound062 = icmp ult double* %scevgep54, %scevgep60
  %bound163 = icmp ult double* %scevgep58, %scevgep56
  %memcheck.conflict65 = and i1 %bound062, %bound163
  br i1 %memcheck.conflict65, label %scalar.ph51.preheader, label %vector.body49.preheader

vector.body49.preheader:                          ; preds = %._crit_edge4
  br label %vector.body49

vector.body49:                                    ; preds = %vector.body49.preheader, %vector.body49
  %index68 = phi i64 [ %index.next69, %vector.body49 ], [ 0, %vector.body49.preheader ]
  %offset.idx = or i64 %index68, 1
  %77 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv16, i64 %offset.idx
  %78 = bitcast double* %77 to <2 x double>*
  %wide.load76 = load <2 x double>, <2 x double>* %78, align 8, !alias.scope !17, !noalias !20
  %79 = getelementptr double, double* %77, i64 2
  %80 = bitcast double* %79 to <2 x double>*
  %wide.load77 = load <2 x double>, <2 x double>* %80, align 8, !alias.scope !17, !noalias !20
  %81 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv16, i64 %offset.idx
  %82 = bitcast double* %81 to <2 x double>*
  %wide.load78 = load <2 x double>, <2 x double>* %82, align 8, !alias.scope !20
  %83 = getelementptr double, double* %81, i64 2
  %84 = bitcast double* %83 to <2 x double>*
  %wide.load79 = load <2 x double>, <2 x double>* %84, align 8, !alias.scope !20
  %85 = add nsw i64 %offset.idx, -1
  %86 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv16, i64 %85
  %87 = bitcast double* %86 to <2 x double>*
  %wide.load80 = load <2 x double>, <2 x double>* %87, align 8, !alias.scope !20
  %88 = getelementptr double, double* %86, i64 2
  %89 = bitcast double* %88 to <2 x double>*
  %wide.load81 = load <2 x double>, <2 x double>* %89, align 8, !alias.scope !20
  %90 = fsub <2 x double> %wide.load78, %wide.load80
  %91 = fsub <2 x double> %wide.load79, %wide.load81
  %92 = fmul <2 x double> %90, <double 5.000000e-01, double 5.000000e-01>
  %93 = fmul <2 x double> %91, <double 5.000000e-01, double 5.000000e-01>
  %94 = fsub <2 x double> %wide.load76, %92
  %95 = fsub <2 x double> %wide.load77, %93
  %96 = bitcast double* %77 to <2 x double>*
  store <2 x double> %94, <2 x double>* %96, align 8, !alias.scope !17, !noalias !20
  %97 = bitcast double* %79 to <2 x double>*
  store <2 x double> %95, <2 x double>* %97, align 8, !alias.scope !17, !noalias !20
  %index.next69 = add nuw nsw i64 %index68, 4
  %98 = icmp eq i64 %index.next69, 1196
  br i1 %98, label %scalar.ph51.preheader.loopexit, label %vector.body49, !llvm.loop !22

scalar.ph51.preheader.loopexit:                   ; preds = %vector.body49
  br label %scalar.ph51.preheader

scalar.ph51.preheader:                            ; preds = %scalar.ph51.preheader.loopexit, %._crit_edge4
  %indvars.iv13.ph = phi i64 [ 1, %._crit_edge4 ], [ 1197, %scalar.ph51.preheader.loopexit ]
  br label %scalar.ph51

scalar.ph51:                                      ; preds = %scalar.ph51.preheader, %._crit_edge141
  %indvars.iv13 = phi i64 [ %indvars.iv.next14, %._crit_edge141 ], [ %indvars.iv13.ph, %scalar.ph51.preheader ]
  %99 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv16, i64 %indvars.iv13
  %100 = load double, double* %99, align 8
  %101 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv16, i64 %indvars.iv13
  %102 = load double, double* %101, align 8
  %103 = add nsw i64 %indvars.iv13, -1
  %104 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv16, i64 %103
  %105 = load double, double* %104, align 8
  %106 = fsub double %102, %105
  %107 = fmul double %106, 5.000000e-01
  %108 = fsub double %100, %107
  store double %108, double* %99, align 8
  %exitcond15 = icmp eq i64 %indvars.iv13, 1199
  br i1 %exitcond15, label %.loopexit137, label %._crit_edge141, !llvm.loop !23

._crit_edge141:                                   ; preds = %scalar.ph51
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  br label %scalar.ph51

.loopexit137:                                     ; preds = %scalar.ph51
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond144 = icmp eq i64 %indvars.iv.next17, 1000
  br i1 %exitcond144, label %._crit_edge6.preheader, label %._crit_edge4

._crit_edge6.preheader:                           ; preds = %.loopexit137
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %.loopexit, %._crit_edge6.preheader
  %indvars.iv21 = phi i64 [ %indvars.iv.next22, %.loopexit ], [ 0, %._crit_edge6.preheader ]
  %scevgep = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv21, i64 0
  %scevgep26 = getelementptr [1200 x double], [1200 x double]* %2, i64 %indvars.iv21, i64 1199
  %scevgep28 = getelementptr [1200 x double], [1200 x double]* %0, i64 %indvars.iv21, i64 0
  %109 = add nuw nsw i64 %indvars.iv21, 1
  %scevgep30 = getelementptr [1200 x double], [1200 x double]* %0, i64 %109, i64 0
  %scevgep32 = getelementptr [1200 x double], [1200 x double]* %1, i64 %indvars.iv21, i64 0
  %scevgep34 = getelementptr [1200 x double], [1200 x double]* %1, i64 %109, i64 1199
  %indvars.iv.next22 = add nuw nsw i64 %indvars.iv21, 1
  %bound0 = icmp ult double* %scevgep, %scevgep30
  %bound1 = icmp ult double* %scevgep28, %scevgep26
  %found.conflict = and i1 %bound0, %bound1
  %bound036 = icmp ult double* %scevgep, %scevgep34
  %bound137 = icmp ult double* %scevgep32, %scevgep26
  %found.conflict38 = and i1 %bound036, %bound137
  %conflict.rdx = or i1 %found.conflict, %found.conflict38
  br i1 %conflict.rdx, label %._crit_edge7.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %._crit_edge6
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %110 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv21, i64 %index
  %111 = bitcast double* %110 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %111, align 8, !alias.scope !24, !noalias !27
  %112 = getelementptr double, double* %110, i64 2
  %113 = bitcast double* %112 to <2 x double>*
  %wide.load40 = load <2 x double>, <2 x double>* %113, align 8, !alias.scope !24, !noalias !27
  %114 = or i64 %index, 1
  %115 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv21, i64 %114
  %116 = bitcast double* %115 to <2 x double>*
  %wide.load41 = load <2 x double>, <2 x double>* %116, align 8, !alias.scope !30
  %117 = getelementptr double, double* %115, i64 2
  %118 = bitcast double* %117 to <2 x double>*
  %wide.load42 = load <2 x double>, <2 x double>* %118, align 8, !alias.scope !30
  %119 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv21, i64 %index
  %120 = bitcast double* %119 to <2 x double>*
  %wide.load43 = load <2 x double>, <2 x double>* %120, align 8, !alias.scope !30
  %121 = getelementptr double, double* %119, i64 2
  %122 = bitcast double* %121 to <2 x double>*
  %wide.load44 = load <2 x double>, <2 x double>* %122, align 8, !alias.scope !30
  %123 = fsub <2 x double> %wide.load41, %wide.load43
  %124 = fsub <2 x double> %wide.load42, %wide.load44
  %125 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next22, i64 %index
  %126 = bitcast double* %125 to <2 x double>*
  %wide.load45 = load <2 x double>, <2 x double>* %126, align 8, !alias.scope !31
  %127 = getelementptr double, double* %125, i64 2
  %128 = bitcast double* %127 to <2 x double>*
  %wide.load46 = load <2 x double>, <2 x double>* %128, align 8, !alias.scope !31
  %129 = fadd <2 x double> %123, %wide.load45
  %130 = fadd <2 x double> %124, %wide.load46
  %131 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv21, i64 %index
  %132 = bitcast double* %131 to <2 x double>*
  %wide.load47 = load <2 x double>, <2 x double>* %132, align 8, !alias.scope !31
  %133 = getelementptr double, double* %131, i64 2
  %134 = bitcast double* %133 to <2 x double>*
  %wide.load48 = load <2 x double>, <2 x double>* %134, align 8, !alias.scope !31
  %135 = fsub <2 x double> %129, %wide.load47
  %136 = fsub <2 x double> %130, %wide.load48
  %137 = fmul <2 x double> %135, <double 7.000000e-01, double 7.000000e-01>
  %138 = fmul <2 x double> %136, <double 7.000000e-01, double 7.000000e-01>
  %139 = fsub <2 x double> %wide.load, %137
  %140 = fsub <2 x double> %wide.load40, %138
  %141 = bitcast double* %110 to <2 x double>*
  store <2 x double> %139, <2 x double>* %141, align 8, !alias.scope !24, !noalias !27
  %142 = bitcast double* %112 to <2 x double>*
  store <2 x double> %140, <2 x double>* %142, align 8, !alias.scope !24, !noalias !27
  %index.next = add nuw nsw i64 %index, 4
  %143 = icmp eq i64 %index.next, 1196
  br i1 %143, label %._crit_edge7.preheader.loopexit, label %vector.body, !llvm.loop !32

._crit_edge7.preheader.loopexit:                  ; preds = %vector.body
  br label %._crit_edge7.preheader

._crit_edge7.preheader:                           ; preds = %._crit_edge7.preheader.loopexit, %._crit_edge6
  %indvars.iv18.ph = phi i64 [ 0, %._crit_edge6 ], [ 1196, %._crit_edge7.preheader.loopexit ]
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.preheader, %._crit_edge7
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %._crit_edge7 ], [ %indvars.iv18.ph, %._crit_edge7.preheader ]
  %144 = getelementptr inbounds [1200 x double], [1200 x double]* %2, i64 %indvars.iv21, i64 %indvars.iv18
  %145 = load double, double* %144, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %146 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv21, i64 %indvars.iv.next19
  %147 = load double, double* %146, align 8
  %148 = getelementptr inbounds [1200 x double], [1200 x double]* %0, i64 %indvars.iv21, i64 %indvars.iv18
  %149 = load double, double* %148, align 8
  %150 = fsub double %147, %149
  %151 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv.next22, i64 %indvars.iv18
  %152 = load double, double* %151, align 8
  %153 = fadd double %150, %152
  %154 = getelementptr inbounds [1200 x double], [1200 x double]* %1, i64 %indvars.iv21, i64 %indvars.iv18
  %155 = load double, double* %154, align 8
  %156 = fsub double %153, %155
  %157 = fmul double %156, 7.000000e-01
  %158 = fsub double %145, %157
  store double %158, double* %144, align 8
  %exitcond20 = icmp eq i64 %indvars.iv18, 1198
  br i1 %exitcond20, label %.loopexit, label %._crit_edge7, !llvm.loop !33

.loopexit:                                        ; preds = %._crit_edge7
  %exitcond145 = icmp eq i64 %indvars.iv.next22, 999
  br i1 %exitcond145, label %159, label %._crit_edge6

; <label>:159:                                    ; preds = %.loopexit
  %indvars.iv.next24 = add nuw nsw i64 %indvars.iv23, 1
  %exitcond146 = icmp eq i64 %indvars.iv.next24, 500
  br i1 %exitcond146, label %160, label %._crit_edge

; <label>:160:                                    ; preds = %159
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly, [1200 x double]* nocapture readonly) #0 {
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
