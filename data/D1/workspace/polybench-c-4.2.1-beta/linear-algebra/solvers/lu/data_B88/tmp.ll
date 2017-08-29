; ModuleID = 'A.ll'
source_filename = "lu.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [2 x i8] c"A\00", align 1
@.str.5 = private unnamed_addr constant [8 x i8] c"%0.2lf \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  call fastcc void @init_array([2000 x double]* %4)
  call void (...) @polybench_timer_start() #4
  call fastcc void @kernel_lu([2000 x double]* %4)
  call void (...) @polybench_timer_stop() #4
  call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  call fastcc void @print_array([2000 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture) unnamed_addr #0 {
.preheader72.lr.ph:
  br label %.preheader72

.preheader72:                                     ; preds = %._crit_edge143, %.preheader72.lr.ph
  %indvars.iv101146 = phi [2000 x double]* [ %0, %.preheader72.lr.ph ], [ %16, %._crit_edge143 ]
  %indvars.iv104145 = phi i64 [ 1, %.preheader72.lr.ph ], [ %indvars.iv.next105, %._crit_edge143 ]
  %indvars.iv106144 = phi i64 [ 0, %.preheader72.lr.ph ], [ %indvars.iv.next107, %._crit_edge143 ]
  %1 = mul nuw nsw i64 %indvars.iv106144, 2001
  %2 = add nuw nsw i64 %1, 1
  %3 = mul nsw i64 %indvars.iv106144, -8
  br label %5

.preheader71:                                     ; preds = %5
  %exitcond103140 = icmp eq i64 %indvars.iv106144, 1999
  br i1 %exitcond103140, label %._crit_edge143.thread, label %._crit_edge143

._crit_edge143.thread:                            ; preds = %.preheader71
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %indvars.iv101146, i64 0, i64 1999
  store double 1.000000e+00, double* %4, align 8
  br label %.preheader70.lr.ph

; <label>:5:                                      ; preds = %5, %.preheader72
  %indvars.iv91138 = phi i64 [ 0, %.preheader72 ], [ %indvars.iv.next92, %5 ]
  %6 = sub nsw i64 0, %indvars.iv91138
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 2000
  %9 = sitofp i32 %8 to double
  %10 = fdiv double %9, 2.000000e+03
  %11 = fadd double %10, 1.000000e+00
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv106144, i64 %indvars.iv91138
  store double %11, double* %12, align 8
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91138, 1
  %exitcond96 = icmp eq i64 %indvars.iv.next92, %indvars.iv104145
  br i1 %exitcond96, label %.preheader71, label %5

._crit_edge143:                                   ; preds = %.preheader71
  %13 = add nsw i64 %3, 15992
  %scevgep154 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %2
  %14 = bitcast double* %scevgep154 to i8*
  call void @llvm.memset.p0i8.i64(i8* %14, i8 0, i64 %13, i32 8, i1 false)
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %indvars.iv101146, i64 0, i64 %indvars.iv106144
  store double 1.000000e+00, double* %15, align 8
  %indvars.iv.next107 = add nuw nsw i64 %indvars.iv106144, 1
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104145, 1
  %scevgep = getelementptr [2000 x double], [2000 x double]* %indvars.iv101146, i64 1, i64 0
  %16 = bitcast double* %scevgep to [2000 x double]*
  %17 = icmp slt i64 %indvars.iv.next107, 2000
  br i1 %17, label %.preheader72, label %.preheader70.lr.ph.loopexit

.preheader70.lr.ph.loopexit:                      ; preds = %._crit_edge143
  br label %.preheader70.lr.ph

.preheader70.lr.ph:                               ; preds = %.preheader70.lr.ph.loopexit, %._crit_edge143.thread
  %18 = call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge136.us

._crit_edge136.us:                                ; preds = %._crit_edge136.us, %.preheader70.lr.ph
  %indvars.iv89137.us = phi i64 [ 0, %.preheader70.lr.ph ], [ %indvars.iv.next90.us.7, %._crit_edge136.us ]
  %19 = mul nuw nsw i64 %indvars.iv89137.us, 16000
  %scevgep153 = getelementptr i8, i8* %18, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep153, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90.us = or i64 %indvars.iv89137.us, 1
  %20 = mul nuw nsw i64 %indvars.iv.next90.us, 16000
  %scevgep153.1 = getelementptr i8, i8* %18, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep153.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90.us.1 = or i64 %indvars.iv89137.us, 2
  %21 = mul nuw nsw i64 %indvars.iv.next90.us.1, 16000
  %scevgep153.2 = getelementptr i8, i8* %18, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep153.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90.us.2 = or i64 %indvars.iv89137.us, 3
  %22 = mul nuw nsw i64 %indvars.iv.next90.us.2, 16000
  %scevgep153.3 = getelementptr i8, i8* %18, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep153.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90.us.3 = or i64 %indvars.iv89137.us, 4
  %23 = mul nuw nsw i64 %indvars.iv.next90.us.3, 16000
  %scevgep153.4 = getelementptr i8, i8* %18, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep153.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90.us.4 = or i64 %indvars.iv89137.us, 5
  %24 = mul nuw nsw i64 %indvars.iv.next90.us.4, 16000
  %scevgep153.5 = getelementptr i8, i8* %18, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep153.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90.us.5 = or i64 %indvars.iv89137.us, 6
  %25 = mul nuw nsw i64 %indvars.iv.next90.us.5, 16000
  %scevgep153.6 = getelementptr i8, i8* %18, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep153.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90.us.6 = or i64 %indvars.iv89137.us, 7
  %26 = mul nuw nsw i64 %indvars.iv.next90.us.6, 16000
  %scevgep153.7 = getelementptr i8, i8* %18, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep153.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next90.us.7 = add nsw i64 %indvars.iv89137.us, 8
  %exitcond53.7 = icmp eq i64 %indvars.iv.next90.us.7, 2000
  br i1 %exitcond53.7, label %.preheader68.us.preheader, label %._crit_edge136.us

.preheader68.us.preheader:                        ; preds = %._crit_edge136.us
  %27 = bitcast i8* %18 to [2000 x [2000 x double]]*
  %28 = bitcast i8* %18 to [2000 x [2000 x double]]*
  %29 = bitcast i8* %18 to [2000 x [2000 x double]]*
  br label %.preheader68.us

.preheader68.us:                                  ; preds = %._crit_edge118.us-lcssa.us.us, %.preheader68.us.preheader
  %indvars.iv83119.us = phi i64 [ %indvars.iv.next84.us, %._crit_edge118.us-lcssa.us.us ], [ 0, %.preheader68.us.preheader ]
  %scevgep12 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv83119.us
  %30 = add nuw nsw i64 %indvars.iv83119.us, 1
  %scevgep14 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %30
  %31 = bitcast double* %scevgep14 to i8*
  %32 = bitcast double* %scevgep12 to i8*
  br label %.preheader67.us.us

.preheader67.us.us:                               ; preds = %._crit_edge115.us.us, %.preheader68.us
  %indvars.iv79117.us.us = phi i64 [ 0, %.preheader68.us ], [ %indvars.iv.next80.us.us, %._crit_edge115.us.us ]
  %33 = mul nuw nsw i64 %indvars.iv79117.us.us, 16000
  %scevgep10 = getelementptr i8, i8* %18, i64 %33
  %34 = add nuw nsw i64 %33, 16000
  %scevgep11 = getelementptr i8, i8* %18, i64 %34
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv79117.us.us, i64 %indvars.iv83119.us
  %bound0 = icmp ult i8* %scevgep10, %31
  %bound1 = icmp ult i8* %32, %scevgep11
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %35 to i8*
  %bc16 = bitcast double* %35 to i8*
  %bound017 = icmp ult i8* %scevgep10, %bc16
  %bound118 = icmp ult i8* %bc, %scevgep11
  %found.conflict19 = and i1 %bound017, %bound118
  %conflict.rdx = or i1 %found.conflict, %found.conflict19
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader67.us.us
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader67.us.us
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %36 = or i64 %index, 1
  %37 = or i64 %index, 2
  %38 = or i64 %index, 3
  %39 = load double, double* %35, align 8, !alias.scope !1
  %40 = insertelement <2 x double> undef, double %39, i32 0
  %41 = shufflevector <2 x double> %40, <2 x double> undef, <2 x i32> zeroinitializer
  %42 = insertelement <2 x double> undef, double %39, i32 0
  %43 = shufflevector <2 x double> %42, <2 x double> undef, <2 x i32> zeroinitializer
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv83119.us
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %36, i64 %indvars.iv83119.us
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %37, i64 %indvars.iv83119.us
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %38, i64 %indvars.iv83119.us
  %48 = load double, double* %44, align 8, !alias.scope !4
  %49 = load double, double* %45, align 8, !alias.scope !4
  %50 = load double, double* %46, align 8, !alias.scope !4
  %51 = load double, double* %47, align 8, !alias.scope !4
  %52 = insertelement <2 x double> undef, double %48, i32 0
  %53 = insertelement <2 x double> %52, double %49, i32 1
  %54 = insertelement <2 x double> undef, double %50, i32 0
  %55 = insertelement <2 x double> %54, double %51, i32 1
  %56 = fmul <2 x double> %41, %53
  %57 = fmul <2 x double> %43, %55
  %58 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %29, i64 0, i64 %indvars.iv79117.us.us, i64 %index
  %59 = bitcast double* %58 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %59, align 8, !alias.scope !6, !noalias !8
  %60 = getelementptr double, double* %58, i64 2
  %61 = bitcast double* %60 to <2 x double>*
  %wide.load21 = load <2 x double>, <2 x double>* %61, align 8, !alias.scope !6, !noalias !8
  %62 = fadd <2 x double> %wide.load, %56
  %63 = fadd <2 x double> %wide.load21, %57
  %64 = bitcast double* %58 to <2 x double>*
  store <2 x double> %62, <2 x double>* %64, align 8, !alias.scope !6, !noalias !8
  %65 = bitcast double* %60 to <2 x double>*
  store <2 x double> %63, <2 x double>* %65, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %66 = icmp eq i64 %index.next, 2000
  br i1 %66, label %._crit_edge115.us.us.loopexit55, label %vector.body, !llvm.loop !9

._crit_edge115.us.us.loopexit:                    ; preds = %scalar.ph
  br label %._crit_edge115.us.us

._crit_edge115.us.us.loopexit55:                  ; preds = %vector.body
  br label %._crit_edge115.us.us

._crit_edge115.us.us:                             ; preds = %._crit_edge115.us.us.loopexit55, %._crit_edge115.us.us.loopexit
  %indvars.iv.next80.us.us = add nuw nsw i64 %indvars.iv79117.us.us, 1
  %exitcond82.us.us = icmp eq i64 %indvars.iv.next80.us.us, 2000
  br i1 %exitcond82.us.us, label %._crit_edge118.us-lcssa.us.us, label %.preheader67.us.us

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv75113.us.us = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next76.us.us.1, %scalar.ph ]
  %67 = load double, double* %35, align 8
  %68 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv75113.us.us, i64 %indvars.iv83119.us
  %69 = load double, double* %68, align 8
  %70 = fmul double %67, %69
  %71 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv79117.us.us, i64 %indvars.iv75113.us.us
  %72 = load double, double* %71, align 8
  %73 = fadd double %72, %70
  store double %73, double* %71, align 8
  %indvars.iv.next76.us.us = or i64 %indvars.iv75113.us.us, 1
  %74 = load double, double* %35, align 8
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next76.us.us, i64 %indvars.iv83119.us
  %76 = load double, double* %75, align 8
  %77 = fmul double %74, %76
  %78 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %28, i64 0, i64 %indvars.iv79117.us.us, i64 %indvars.iv.next76.us.us
  %79 = load double, double* %78, align 8
  %80 = fadd double %79, %77
  store double %80, double* %78, align 8
  %indvars.iv.next76.us.us.1 = add nsw i64 %indvars.iv75113.us.us, 2
  %exitcond78.us.us.1 = icmp eq i64 %indvars.iv.next76.us.us.1, 2000
  br i1 %exitcond78.us.us.1, label %._crit_edge115.us.us.loopexit, label %scalar.ph, !llvm.loop !12

._crit_edge118.us-lcssa.us.us:                    ; preds = %._crit_edge115.us.us
  %indvars.iv.next84.us = add nuw nsw i64 %indvars.iv83119.us, 1
  %exitcond52 = icmp eq i64 %indvars.iv.next84.us, 2000
  br i1 %exitcond52, label %.preheader.us.preheader, label %.preheader68.us

.preheader.us.preheader:                          ; preds = %._crit_edge118.us-lcssa.us.us
  %81 = bitcast i8* %18 to [2000 x [2000 x double]]*
  %82 = bitcast i8* %18 to [2000 x [2000 x double]]*
  %83 = bitcast i8* %18 to [2000 x [2000 x double]]*
  %84 = bitcast i8* %18 to [2000 x [2000 x double]]*
  %85 = bitcast i8* %18 to [2000 x [2000 x double]]*
  %86 = bitcast i8* %18 to [2000 x [2000 x double]]*
  %87 = bitcast i8* %18 to [2000 x [2000 x double]]*
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv73110.us = phi i64 [ %indvars.iv.next74.us, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep27 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv73110.us, i64 0
  %scevgep2728 = bitcast double* %scevgep27 to i8*
  %88 = add nuw nsw i64 %indvars.iv73110.us, 1
  %scevgep29 = getelementptr [2000 x double], [2000 x double]* %0, i64 %88, i64 0
  %scevgep2930 = bitcast double* %scevgep29 to i8*
  %89 = mul nuw nsw i64 %indvars.iv73110.us, 16000
  %scevgep31 = getelementptr i8, i8* %18, i64 %89
  %90 = add nuw nsw i64 %89, 16000
  %scevgep32 = getelementptr i8, i8* %18, i64 %90
  %bound033 = icmp ult i8* %scevgep2728, %scevgep32
  %bound134 = icmp ult i8* %scevgep31, %scevgep2930
  %memcheck.conflict36 = and i1 %bound033, %bound134
  br i1 %memcheck.conflict36, label %scalar.ph24.preheader, label %vector.body22.preheader

vector.body22.preheader:                          ; preds = %.preheader.us
  br label %vector.body22

scalar.ph24.preheader:                            ; preds = %.preheader.us
  br label %scalar.ph24

vector.body22:                                    ; preds = %vector.body22, %vector.body22.preheader
  %index39 = phi i64 [ 0, %vector.body22.preheader ], [ %index.next40.1, %vector.body22 ]
  %91 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %86, i64 0, i64 %indvars.iv73110.us, i64 %index39
  %92 = bitcast double* %91 to <2 x i64>*
  %wide.load47 = load <2 x i64>, <2 x i64>* %92, align 8, !alias.scope !13
  %93 = getelementptr double, double* %91, i64 2
  %94 = bitcast double* %93 to <2 x i64>*
  %wide.load48 = load <2 x i64>, <2 x i64>* %94, align 8, !alias.scope !13
  %95 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv73110.us, i64 %index39
  %96 = bitcast double* %95 to <2 x i64>*
  store <2 x i64> %wide.load47, <2 x i64>* %96, align 8, !alias.scope !16, !noalias !13
  %97 = getelementptr double, double* %95, i64 2
  %98 = bitcast double* %97 to <2 x i64>*
  store <2 x i64> %wide.load48, <2 x i64>* %98, align 8, !alias.scope !16, !noalias !13
  %index.next40 = or i64 %index39, 4
  %99 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %87, i64 0, i64 %indvars.iv73110.us, i64 %index.next40
  %100 = bitcast double* %99 to <2 x i64>*
  %wide.load47.1 = load <2 x i64>, <2 x i64>* %100, align 8, !alias.scope !13
  %101 = getelementptr double, double* %99, i64 2
  %102 = bitcast double* %101 to <2 x i64>*
  %wide.load48.1 = load <2 x i64>, <2 x i64>* %102, align 8, !alias.scope !13
  %103 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv73110.us, i64 %index.next40
  %104 = bitcast double* %103 to <2 x i64>*
  store <2 x i64> %wide.load47.1, <2 x i64>* %104, align 8, !alias.scope !16, !noalias !13
  %105 = getelementptr double, double* %103, i64 2
  %106 = bitcast double* %105 to <2 x i64>*
  store <2 x i64> %wide.load48.1, <2 x i64>* %106, align 8, !alias.scope !16, !noalias !13
  %index.next40.1 = add nsw i64 %index39, 8
  %107 = icmp eq i64 %index.next40.1, 2000
  br i1 %107, label %._crit_edge.us.loopexit54, label %vector.body22, !llvm.loop !18

scalar.ph24:                                      ; preds = %scalar.ph24, %scalar.ph24.preheader
  %indvars.iv109.us = phi i64 [ 0, %scalar.ph24.preheader ], [ %indvars.iv.next.us.4, %scalar.ph24 ]
  %108 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %81, i64 0, i64 %indvars.iv73110.us, i64 %indvars.iv109.us
  %109 = bitcast double* %108 to i64*
  %110 = load i64, i64* %109, align 8
  %111 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv73110.us, i64 %indvars.iv109.us
  %112 = bitcast double* %111 to i64*
  store i64 %110, i64* %112, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv109.us, 1
  %113 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %82, i64 0, i64 %indvars.iv73110.us, i64 %indvars.iv.next.us
  %114 = bitcast double* %113 to i64*
  %115 = load i64, i64* %114, align 8
  %116 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv73110.us, i64 %indvars.iv.next.us
  %117 = bitcast double* %116 to i64*
  store i64 %115, i64* %117, align 8
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv109.us, 2
  %118 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %83, i64 0, i64 %indvars.iv73110.us, i64 %indvars.iv.next.us.1
  %119 = bitcast double* %118 to i64*
  %120 = load i64, i64* %119, align 8
  %121 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv73110.us, i64 %indvars.iv.next.us.1
  %122 = bitcast double* %121 to i64*
  store i64 %120, i64* %122, align 8
  %indvars.iv.next.us.2 = add nsw i64 %indvars.iv109.us, 3
  %123 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %84, i64 0, i64 %indvars.iv73110.us, i64 %indvars.iv.next.us.2
  %124 = bitcast double* %123 to i64*
  %125 = load i64, i64* %124, align 8
  %126 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv73110.us, i64 %indvars.iv.next.us.2
  %127 = bitcast double* %126 to i64*
  store i64 %125, i64* %127, align 8
  %indvars.iv.next.us.3 = add nsw i64 %indvars.iv109.us, 4
  %128 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %85, i64 0, i64 %indvars.iv73110.us, i64 %indvars.iv.next.us.3
  %129 = bitcast double* %128 to i64*
  %130 = load i64, i64* %129, align 8
  %131 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv73110.us, i64 %indvars.iv.next.us.3
  %132 = bitcast double* %131 to i64*
  store i64 %130, i64* %132, align 8
  %indvars.iv.next.us.4 = add nsw i64 %indvars.iv109.us, 5
  %exitcond.us.4 = icmp eq i64 %indvars.iv.next.us.4, 2000
  br i1 %exitcond.us.4, label %._crit_edge.us.loopexit, label %scalar.ph24, !llvm.loop !19

._crit_edge.us.loopexit:                          ; preds = %scalar.ph24
  br label %._crit_edge.us

._crit_edge.us.loopexit54:                        ; preds = %vector.body22
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit54, %._crit_edge.us.loopexit
  %indvars.iv.next74.us = add nuw nsw i64 %indvars.iv73110.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next74.us, 2000
  br i1 %exitcond, label %._crit_edge111, label %.preheader.us

._crit_edge111:                                   ; preds = %._crit_edge.us
  call void @free(i8* nonnull %18) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]* nocapture) unnamed_addr #2 {
.preheader43.lr.ph:
  br label %.preheader43

.preheader43:                                     ; preds = %.preheader43.backedge, %.preheader43.lr.ph
  %indvars.iv6377 = phi i64 [ 0, %.preheader43.lr.ph ], [ %indvars.iv6377.be, %.preheader43.backedge ]
  %exitcond5167 = icmp eq i64 %indvars.iv6377, 0
  br i1 %exitcond5167, label %.preheader43.backedge, label %.preheader41.preheader

.preheader43.backedge:                            ; preds = %.preheader43, %._crit_edge76
  %indvars.iv6377.be = phi i64 [ %indvars.iv.next64, %._crit_edge76 ], [ 1, %.preheader43 ]
  br label %.preheader43

.preheader41.preheader:                           ; preds = %.preheader43
  %.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv6377, i64 0
  %1 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv6377, i64 0
  br label %.preheader41

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge72.us
  %indvars.iv5974.us = phi i64 [ %indvars.iv.next60.us, %._crit_edge72.us ], [ %indvars.iv6377, %.preheader.us.preheader ]
  %2 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv6377, i64 %indvars.iv5974.us
  %.pre85 = load double, double* %2, align 8
  br i1 %lcmp.mod5, label %.prol.loopexit3.unr-lcssa, label %.prol.preheader2

.prol.preheader2:                                 ; preds = %.preheader.us
  br label %3

; <label>:3:                                      ; preds = %.prol.preheader2
  %4 = load double, double* %50, align 8
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv5974.us
  %6 = load double, double* %5, align 8
  %7 = fmul double %4, %6
  %8 = fsub double %.pre85, %7
  store double %8, double* %2, align 8
  br label %.prol.loopexit3.unr-lcssa

.prol.loopexit3.unr-lcssa:                        ; preds = %.preheader.us, %3
  %.unr6.ph = phi double [ %8, %3 ], [ %.pre85, %.preheader.us ]
  %indvars.iv5270.us.unr.ph = phi i64 [ 1, %3 ], [ 0, %.preheader.us ]
  br label %.prol.loopexit3

.prol.loopexit3:                                  ; preds = %.prol.loopexit3.unr-lcssa
  br i1 %49, label %._crit_edge72.us, label %.preheader.us.new

.preheader.us.new:                                ; preds = %.prol.loopexit3
  br label %9

; <label>:9:                                      ; preds = %9, %.preheader.us.new
  %10 = phi double [ %.unr6.ph, %.preheader.us.new ], [ %22, %9 ]
  %indvars.iv5270.us = phi i64 [ %indvars.iv5270.us.unr.ph, %.preheader.us.new ], [ %indvars.iv.next53.us.1, %9 ]
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv6377, i64 %indvars.iv5270.us
  %12 = load double, double* %11, align 8
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv5270.us, i64 %indvars.iv5974.us
  %14 = load double, double* %13, align 8
  %15 = fmul double %12, %14
  %16 = fsub double %10, %15
  store double %16, double* %2, align 8
  %indvars.iv.next53.us = add nuw nsw i64 %indvars.iv5270.us, 1
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv6377, i64 %indvars.iv.next53.us
  %18 = load double, double* %17, align 8
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next53.us, i64 %indvars.iv5974.us
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fsub double %16, %21
  store double %22, double* %2, align 8
  %indvars.iv.next53.us.1 = add nsw i64 %indvars.iv5270.us, 2
  %exitcond56.us.1 = icmp eq i64 %indvars.iv.next53.us.1, %indvars.iv6377
  br i1 %exitcond56.us.1, label %._crit_edge72.us.unr-lcssa, label %9

._crit_edge72.us.unr-lcssa:                       ; preds = %9
  br label %._crit_edge72.us

._crit_edge72.us:                                 ; preds = %.prol.loopexit3, %._crit_edge72.us.unr-lcssa
  %indvars.iv.next60.us = add nuw nsw i64 %indvars.iv5974.us, 1
  %exitcond62.us = icmp eq i64 %indvars.iv.next60.us, 2000
  br i1 %exitcond62.us, label %._crit_edge76, label %.preheader.us

.preheader41:                                     ; preds = %.preheader41.preheader, %._crit_edge
  %indvars.iv4668 = phi i64 [ %indvars.iv.next47, %._crit_edge ], [ 0, %.preheader41.preheader ]
  %exitcond65 = icmp eq i64 %indvars.iv4668, 0
  br i1 %exitcond65, label %.preheader41.._crit_edge_crit_edge, label %.lr.ph

.preheader41.._crit_edge_crit_edge:               ; preds = %.preheader41
  %.pre84 = load double, double* %.phi.trans.insert, align 8
  br label %._crit_edge

.lr.ph:                                           ; preds = %.preheader41
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv6377, i64 %indvars.iv4668
  %.pre = load double, double* %23, align 8
  %xtraiter = and i64 %indvars.iv4668, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit.unr-lcssa, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  br label %24

; <label>:24:                                     ; preds = %.prol.preheader
  %25 = load double, double* %1, align 8
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv4668
  %27 = load double, double* %26, align 8
  %28 = fmul double %25, %27
  %29 = fsub double %.pre, %28
  store double %29, double* %23, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.lr.ph, %24
  %.lcssa.unr.ph = phi double [ %29, %24 ], [ undef, %.lr.ph ]
  %.unr.ph = phi double [ %29, %24 ], [ %.pre, %.lr.ph ]
  %indvars.iv66.unr.ph = phi i64 [ 1, %24 ], [ 0, %.lr.ph ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  %30 = icmp eq i64 %indvars.iv4668, 1
  br i1 %30, label %._crit_edge.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %31

; <label>:31:                                     ; preds = %31, %.lr.ph.new
  %32 = phi double [ %.unr.ph, %.lr.ph.new ], [ %44, %31 ]
  %indvars.iv66 = phi i64 [ %indvars.iv66.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %31 ]
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv6377, i64 %indvars.iv66
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv66, i64 %indvars.iv4668
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = fsub double %32, %37
  store double %38, double* %23, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv66, 1
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv6377, i64 %indvars.iv.next
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv4668
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fsub double %38, %43
  store double %44, double* %23, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv66, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv4668
  br i1 %exitcond.1, label %._crit_edge.loopexit.unr-lcssa, label %31

._crit_edge.loopexit.unr-lcssa:                   ; preds = %31
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %.prol.loopexit ], [ %44, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader41.._crit_edge_crit_edge
  %.pre-phi = phi double* [ %.phi.trans.insert, %.preheader41.._crit_edge_crit_edge ], [ %23, %._crit_edge.loopexit ]
  %45 = phi double [ %.pre84, %.preheader41.._crit_edge_crit_edge ], [ %.lcssa, %._crit_edge.loopexit ]
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv4668, i64 %indvars.iv4668
  %47 = load double, double* %46, align 8
  %48 = fdiv double %45, %47
  store double %48, double* %.pre-phi, align 8
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv4668, 1
  %exitcond51 = icmp eq i64 %indvars.iv.next47, %indvars.iv6377
  br i1 %exitcond51, label %.preheader.us.preheader, label %.preheader41

.preheader.us.preheader:                          ; preds = %._crit_edge
  %xtraiter4 = and i64 %indvars.iv6377, 1
  %lcmp.mod5 = icmp eq i64 %xtraiter4, 0
  %49 = icmp eq i64 %indvars.iv6377, 1
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv6377, i64 0
  br label %.preheader.us

._crit_edge76:                                    ; preds = %._crit_edge72.us
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv6377, 1
  %51 = icmp slt i64 %indvars.iv.next64, 2000
  br i1 %51, label %.preheader43.backedge, label %._crit_edge80

._crit_edge80:                                    ; preds = %._crit_edge76
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.lr.ph:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #6
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge15.us, %.preheader.lr.ph
  %indvars.iv1116.us = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next12.us, %._crit_edge15.us ]
  %5 = mul nuw nsw i64 %indvars.iv1116.us, 2000
  br label %6

; <label>:6:                                      ; preds = %._crit_edge.us, %.preheader.us
  %indvars.iv14.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %._crit_edge.us ]
  %7 = add nuw nsw i64 %indvars.iv14.us, %5
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge.us

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %6, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1116.us, i64 %indvars.iv14.us
  %15 = load double, double* %14, align 8
  %16 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #7
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv14.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 2000
  br i1 %exitcond.us, label %._crit_edge15.us, label %6

._crit_edge15.us:                                 ; preds = %._crit_edge.us
  %indvars.iv.next12.us = add nuw nsw i64 %indvars.iv1116.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next12.us, 2000
  br i1 %exitcond, label %._crit_edge17, label %.preheader.us

._crit_edge17:                                    ; preds = %._crit_edge15.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %19) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #4

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind }
attributes #5 = { argmemonly nounwind }
attributes #6 = { cold }
attributes #7 = { cold nounwind }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = !{!2}
!2 = distinct !{!2, !3}
!3 = distinct !{!3, !"LVerDomain"}
!4 = !{!5}
!5 = distinct !{!5, !3}
!6 = !{!7}
!7 = distinct !{!7, !3}
!8 = !{!5, !2}
!9 = distinct !{!9, !10, !11}
!10 = !{!"llvm.loop.vectorize.width", i32 1}
!11 = !{!"llvm.loop.interleave.count", i32 1}
!12 = distinct !{!12, !10, !11}
!13 = !{!14}
!14 = distinct !{!14, !15}
!15 = distinct !{!15, !"LVerDomain"}
!16 = !{!17}
!17 = distinct !{!17, !15}
!18 = distinct !{!18, !10, !11}
!19 = distinct !{!19, !10, !11}
