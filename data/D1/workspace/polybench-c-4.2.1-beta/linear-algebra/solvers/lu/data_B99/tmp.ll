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
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array([2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #4
  tail call fastcc void @kernel_lu([2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #4
  tail call void (...) @polybench_timer_print() #4
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  %10 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @print_array([2000 x double]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #4
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture) unnamed_addr #0 {
.preheader106.lr.ph:
  br label %.preheader106

.preheader106:                                    ; preds = %._crit_edge132, %.preheader106.lr.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge132 ], [ 1, %.preheader106.lr.ph ]
  %indvars.iv95135 = phi [2000 x double]* [ %15, %._crit_edge132 ], [ %0, %.preheader106.lr.ph ]
  %indvars.iv100133 = phi i64 [ %indvars.iv.next101, %._crit_edge132 ], [ 0, %.preheader106.lr.ph ]
  %1 = shl i64 %indvars.iv100133, 32
  %sext = add nuw nsw i64 %1, 4294967296
  %2 = ashr exact i64 %sext, 32
  %3 = ashr exact i64 %sext, 29
  br label %6

.preheader105:                                    ; preds = %6
  %exitcond97129 = icmp eq i64 %indvars.iv, 2000
  br i1 %exitcond97129, label %._crit_edge132, label %.lr.ph131.preheader

.lr.ph131.preheader:                              ; preds = %.preheader105
  %4 = sub nsw i64 16000, %3
  %scevgep162 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv100133, i64 %2
  %5 = bitcast double* %scevgep162 to i8*
  call void @llvm.memset.p0i8.i64(i8* %5, i8 0, i64 %4, i32 8, i1 false)
  br label %._crit_edge132

; <label>:6:                                      ; preds = %6, %.preheader106
  %indvars.iv85128 = phi i64 [ 0, %.preheader106 ], [ %indvars.iv.next86, %6 ]
  %7 = sub nsw i64 0, %indvars.iv85128
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 2000
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 2.000000e+03
  %12 = fadd double %11, 1.000000e+00
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv100133, i64 %indvars.iv85128
  store double %12, double* %13, align 8
  %indvars.iv.next86 = add nuw nsw i64 %indvars.iv85128, 1
  %exitcond90 = icmp eq i64 %indvars.iv.next86, %indvars.iv
  br i1 %exitcond90, label %.preheader105, label %6

._crit_edge132:                                   ; preds = %.lr.ph131.preheader, %.preheader105
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %indvars.iv95135, i64 0, i64 %indvars.iv100133
  store double 1.000000e+00, double* %14, align 8
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100133, 1
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %scevgep = getelementptr [2000 x double], [2000 x double]* %indvars.iv95135, i64 1, i64 0
  %15 = bitcast double* %scevgep to [2000 x double]*
  %exitcond44 = icmp eq i64 %indvars.iv.next101, 2000
  br i1 %exitcond44, label %.preheader104.us.preheader, label %.preheader106

.preheader104.us.preheader:                       ; preds = %._crit_edge132
  %16 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge124.us

._crit_edge124.us:                                ; preds = %._crit_edge124.us, %.preheader104.us.preheader
  %indvars.iv83125.us = phi i64 [ 0, %.preheader104.us.preheader ], [ %indvars.iv.next84.us.7, %._crit_edge124.us ]
  %17 = mul nuw nsw i64 %indvars.iv83125.us, 16000
  %scevgep160 = getelementptr i8, i8* %16, i64 %17
  call void @llvm.memset.p0i8.i64(i8* %scevgep160, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next84.us = or i64 %indvars.iv83125.us, 1
  %18 = mul nuw nsw i64 %indvars.iv.next84.us, 16000
  %scevgep160.1 = getelementptr i8, i8* %16, i64 %18
  call void @llvm.memset.p0i8.i64(i8* %scevgep160.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next84.us.1 = or i64 %indvars.iv83125.us, 2
  %19 = mul nuw nsw i64 %indvars.iv.next84.us.1, 16000
  %scevgep160.2 = getelementptr i8, i8* %16, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep160.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next84.us.2 = or i64 %indvars.iv83125.us, 3
  %20 = mul nuw nsw i64 %indvars.iv.next84.us.2, 16000
  %scevgep160.3 = getelementptr i8, i8* %16, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep160.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next84.us.3 = or i64 %indvars.iv83125.us, 4
  %21 = mul nuw nsw i64 %indvars.iv.next84.us.3, 16000
  %scevgep160.4 = getelementptr i8, i8* %16, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep160.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next84.us.4 = or i64 %indvars.iv83125.us, 5
  %22 = mul nuw nsw i64 %indvars.iv.next84.us.4, 16000
  %scevgep160.5 = getelementptr i8, i8* %16, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep160.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next84.us.5 = or i64 %indvars.iv83125.us, 6
  %23 = mul nuw nsw i64 %indvars.iv.next84.us.5, 16000
  %scevgep160.6 = getelementptr i8, i8* %16, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep160.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next84.us.6 = or i64 %indvars.iv83125.us, 7
  %24 = mul nuw nsw i64 %indvars.iv.next84.us.6, 16000
  %scevgep160.7 = getelementptr i8, i8* %16, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep160.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next84.us.7 = add nsw i64 %indvars.iv83125.us, 8
  %exitcond43.7 = icmp eq i64 %indvars.iv.next84.us.7, 2000
  br i1 %exitcond43.7, label %.preheader103.us.us.preheader.preheader, label %._crit_edge124.us

.preheader103.us.us.preheader.preheader:          ; preds = %._crit_edge124.us
  %25 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %26 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %27 = bitcast i8* %16 to [2000 x [2000 x double]]*
  br label %.preheader103.us.us.preheader

.preheader103.us.us.preheader:                    ; preds = %.preheader66._crit_edge.us, %.preheader103.us.us.preheader.preheader
  %indvars.iv77119.us = phi i64 [ %indvars.iv.next78.us, %.preheader66._crit_edge.us ], [ 0, %.preheader103.us.us.preheader.preheader ]
  %scevgep3 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv77119.us
  %28 = add nuw nsw i64 %indvars.iv77119.us, 1
  %scevgep5 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %28
  %29 = bitcast double* %scevgep5 to i8*
  %30 = bitcast double* %scevgep3 to i8*
  br label %.preheader103.us.us

.preheader66._crit_edge.us:                       ; preds = %.preheader66.us.us
  %indvars.iv.next78.us = add nuw nsw i64 %indvars.iv77119.us, 1
  %exitcond42 = icmp eq i64 %indvars.iv.next78.us, 2000
  br i1 %exitcond42, label %.preheader102.us.preheader, label %.preheader103.us.us.preheader

.preheader102.us.preheader:                       ; preds = %.preheader66._crit_edge.us
  %31 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %32 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %33 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %34 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %35 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %36 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %37 = bitcast i8* %16 to [2000 x [2000 x double]]*
  br label %.preheader102.us

.preheader103.us.us:                              ; preds = %.preheader66.us.us, %.preheader103.us.us.preheader
  %indvars.iv73117.us.us = phi i64 [ 0, %.preheader103.us.us.preheader ], [ %indvars.iv.next74.us.us, %.preheader66.us.us ]
  %38 = mul nuw nsw i64 %indvars.iv73117.us.us, 16000
  %scevgep1 = getelementptr i8, i8* %16, i64 %38
  %39 = add nuw nsw i64 %38, 16000
  %scevgep2 = getelementptr i8, i8* %16, i64 %39
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv73117.us.us, i64 %indvars.iv77119.us
  %bound0 = icmp ult i8* %scevgep1, %29
  %bound1 = icmp ult i8* %30, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %40 to i8*
  %bc7 = bitcast double* %40 to i8*
  %bound08 = icmp ult i8* %scevgep1, %bc7
  %bound19 = icmp ult i8* %bc, %scevgep2
  %found.conflict10 = and i1 %bound08, %bound19
  %conflict.rdx = or i1 %found.conflict, %found.conflict10
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader103.us.us
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader103.us.us
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %41 = or i64 %index, 1
  %42 = or i64 %index, 2
  %43 = or i64 %index, 3
  %44 = load double, double* %40, align 8, !alias.scope !1
  %45 = insertelement <2 x double> undef, double %44, i32 0
  %46 = shufflevector <2 x double> %45, <2 x double> undef, <2 x i32> zeroinitializer
  %47 = insertelement <2 x double> undef, double %44, i32 0
  %48 = shufflevector <2 x double> %47, <2 x double> undef, <2 x i32> zeroinitializer
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv77119.us
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %41, i64 %indvars.iv77119.us
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %42, i64 %indvars.iv77119.us
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %43, i64 %indvars.iv77119.us
  %53 = load double, double* %49, align 8, !alias.scope !4
  %54 = load double, double* %50, align 8, !alias.scope !4
  %55 = load double, double* %51, align 8, !alias.scope !4
  %56 = load double, double* %52, align 8, !alias.scope !4
  %57 = insertelement <2 x double> undef, double %53, i32 0
  %58 = insertelement <2 x double> %57, double %54, i32 1
  %59 = insertelement <2 x double> undef, double %55, i32 0
  %60 = insertelement <2 x double> %59, double %56, i32 1
  %61 = fmul <2 x double> %46, %58
  %62 = fmul <2 x double> %48, %60
  %63 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv73117.us.us, i64 %index
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !6, !noalias !8
  %65 = getelementptr double, double* %63, i64 2
  %66 = bitcast double* %65 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %66, align 8, !alias.scope !6, !noalias !8
  %67 = fadd <2 x double> %wide.load, %61
  %68 = fadd <2 x double> %wide.load12, %62
  %69 = bitcast double* %63 to <2 x double>*
  store <2 x double> %67, <2 x double>* %69, align 8, !alias.scope !6, !noalias !8
  %70 = bitcast double* %65 to <2 x double>*
  store <2 x double> %68, <2 x double>* %70, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %71 = icmp eq i64 %index.next, 2000
  br i1 %71, label %.preheader66.us.us.loopexit46, label %vector.body, !llvm.loop !9

.preheader66.us.us.loopexit:                      ; preds = %scalar.ph
  br label %.preheader66.us.us

.preheader66.us.us.loopexit46:                    ; preds = %vector.body
  br label %.preheader66.us.us

.preheader66.us.us:                               ; preds = %.preheader66.us.us.loopexit46, %.preheader66.us.us.loopexit
  %indvars.iv.next74.us.us = add nuw nsw i64 %indvars.iv73117.us.us, 1
  %exitcond76.us.us = icmp eq i64 %indvars.iv.next74.us.us, 2000
  br i1 %exitcond76.us.us, label %.preheader66._crit_edge.us, label %.preheader103.us.us

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv69113.us.us = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next70.us.us.1, %scalar.ph ]
  %72 = load double, double* %40, align 8
  %73 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv69113.us.us, i64 %indvars.iv77119.us
  %74 = load double, double* %73, align 8
  %75 = fmul double %72, %74
  %76 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv73117.us.us, i64 %indvars.iv69113.us.us
  %77 = load double, double* %76, align 8
  %78 = fadd double %77, %75
  store double %78, double* %76, align 8
  %indvars.iv.next70.us.us = or i64 %indvars.iv69113.us.us, 1
  %79 = load double, double* %40, align 8
  %80 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next70.us.us, i64 %indvars.iv77119.us
  %81 = load double, double* %80, align 8
  %82 = fmul double %79, %81
  %83 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv73117.us.us, i64 %indvars.iv.next70.us.us
  %84 = load double, double* %83, align 8
  %85 = fadd double %84, %82
  store double %85, double* %83, align 8
  %indvars.iv.next70.us.us.1 = add nsw i64 %indvars.iv69113.us.us, 2
  %exitcond72.us.us.1 = icmp eq i64 %indvars.iv.next70.us.us.1, 2000
  br i1 %exitcond72.us.us.1, label %.preheader66.us.us.loopexit, label %scalar.ph, !llvm.loop !12

.preheader102.us:                                 ; preds = %._crit_edge.us, %.preheader102.us.preheader
  %indvars.iv67109.us = phi i64 [ %indvars.iv.next68.us, %._crit_edge.us ], [ 0, %.preheader102.us.preheader ]
  %scevgep18 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv67109.us, i64 0
  %scevgep1819 = bitcast double* %scevgep18 to i8*
  %86 = add nuw nsw i64 %indvars.iv67109.us, 1
  %scevgep20 = getelementptr [2000 x double], [2000 x double]* %0, i64 %86, i64 0
  %scevgep2021 = bitcast double* %scevgep20 to i8*
  %87 = mul nuw nsw i64 %indvars.iv67109.us, 16000
  %scevgep22 = getelementptr i8, i8* %16, i64 %87
  %88 = add nuw nsw i64 %87, 16000
  %scevgep23 = getelementptr i8, i8* %16, i64 %88
  %bound024 = icmp ult i8* %scevgep1819, %scevgep23
  %bound125 = icmp ult i8* %scevgep22, %scevgep2021
  %memcheck.conflict27 = and i1 %bound024, %bound125
  br i1 %memcheck.conflict27, label %scalar.ph15.preheader, label %vector.body13.preheader

vector.body13.preheader:                          ; preds = %.preheader102.us
  br label %vector.body13

scalar.ph15.preheader:                            ; preds = %.preheader102.us
  br label %scalar.ph15

vector.body13:                                    ; preds = %vector.body13, %vector.body13.preheader
  %index30 = phi i64 [ 0, %vector.body13.preheader ], [ %index.next31.1, %vector.body13 ]
  %89 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv67109.us, i64 %index30
  %90 = bitcast double* %89 to <2 x i64>*
  %wide.load38 = load <2 x i64>, <2 x i64>* %90, align 8, !alias.scope !13
  %91 = getelementptr double, double* %89, i64 2
  %92 = bitcast double* %91 to <2 x i64>*
  %wide.load39 = load <2 x i64>, <2 x i64>* %92, align 8, !alias.scope !13
  %93 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv67109.us, i64 %index30
  %94 = bitcast double* %93 to <2 x i64>*
  store <2 x i64> %wide.load38, <2 x i64>* %94, align 8, !alias.scope !16, !noalias !13
  %95 = getelementptr double, double* %93, i64 2
  %96 = bitcast double* %95 to <2 x i64>*
  store <2 x i64> %wide.load39, <2 x i64>* %96, align 8, !alias.scope !16, !noalias !13
  %index.next31 = or i64 %index30, 4
  %97 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv67109.us, i64 %index.next31
  %98 = bitcast double* %97 to <2 x i64>*
  %wide.load38.1 = load <2 x i64>, <2 x i64>* %98, align 8, !alias.scope !13
  %99 = getelementptr double, double* %97, i64 2
  %100 = bitcast double* %99 to <2 x i64>*
  %wide.load39.1 = load <2 x i64>, <2 x i64>* %100, align 8, !alias.scope !13
  %101 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv67109.us, i64 %index.next31
  %102 = bitcast double* %101 to <2 x i64>*
  store <2 x i64> %wide.load38.1, <2 x i64>* %102, align 8, !alias.scope !16, !noalias !13
  %103 = getelementptr double, double* %101, i64 2
  %104 = bitcast double* %103 to <2 x i64>*
  store <2 x i64> %wide.load39.1, <2 x i64>* %104, align 8, !alias.scope !16, !noalias !13
  %index.next31.1 = add nsw i64 %index30, 8
  %105 = icmp eq i64 %index.next31.1, 2000
  br i1 %105, label %._crit_edge.us.loopexit45, label %vector.body13, !llvm.loop !18

scalar.ph15:                                      ; preds = %scalar.ph15, %scalar.ph15.preheader
  %indvars.iv108.us = phi i64 [ 0, %scalar.ph15.preheader ], [ %indvars.iv.next.us.4, %scalar.ph15 ]
  %106 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %31, i64 0, i64 %indvars.iv67109.us, i64 %indvars.iv108.us
  %107 = bitcast double* %106 to i64*
  %108 = load i64, i64* %107, align 8
  %109 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv67109.us, i64 %indvars.iv108.us
  %110 = bitcast double* %109 to i64*
  store i64 %108, i64* %110, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv108.us, 1
  %111 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %32, i64 0, i64 %indvars.iv67109.us, i64 %indvars.iv.next.us
  %112 = bitcast double* %111 to i64*
  %113 = load i64, i64* %112, align 8
  %114 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv67109.us, i64 %indvars.iv.next.us
  %115 = bitcast double* %114 to i64*
  store i64 %113, i64* %115, align 8
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv108.us, 2
  %116 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %33, i64 0, i64 %indvars.iv67109.us, i64 %indvars.iv.next.us.1
  %117 = bitcast double* %116 to i64*
  %118 = load i64, i64* %117, align 8
  %119 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv67109.us, i64 %indvars.iv.next.us.1
  %120 = bitcast double* %119 to i64*
  store i64 %118, i64* %120, align 8
  %indvars.iv.next.us.2 = add nsw i64 %indvars.iv108.us, 3
  %121 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %34, i64 0, i64 %indvars.iv67109.us, i64 %indvars.iv.next.us.2
  %122 = bitcast double* %121 to i64*
  %123 = load i64, i64* %122, align 8
  %124 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv67109.us, i64 %indvars.iv.next.us.2
  %125 = bitcast double* %124 to i64*
  store i64 %123, i64* %125, align 8
  %indvars.iv.next.us.3 = add nsw i64 %indvars.iv108.us, 4
  %126 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %indvars.iv67109.us, i64 %indvars.iv.next.us.3
  %127 = bitcast double* %126 to i64*
  %128 = load i64, i64* %127, align 8
  %129 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv67109.us, i64 %indvars.iv.next.us.3
  %130 = bitcast double* %129 to i64*
  store i64 %128, i64* %130, align 8
  %indvars.iv.next.us.4 = add nsw i64 %indvars.iv108.us, 5
  %exitcond.us.4 = icmp eq i64 %indvars.iv.next.us.4, 2000
  br i1 %exitcond.us.4, label %._crit_edge.us.loopexit, label %scalar.ph15, !llvm.loop !19

._crit_edge.us.loopexit:                          ; preds = %scalar.ph15
  br label %._crit_edge.us

._crit_edge.us.loopexit45:                        ; preds = %vector.body13
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit45, %._crit_edge.us.loopexit
  %indvars.iv.next68.us = add nuw nsw i64 %indvars.iv67109.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next68.us, 2000
  br i1 %exitcond, label %._crit_edge111, label %.preheader102.us

._crit_edge111:                                   ; preds = %._crit_edge.us
  tail call void @free(i8* nonnull %16) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]* nocapture) unnamed_addr #2 {
.preheader64.lr.ph:
  br label %.preheader64

.preheader64:                                     ; preds = %.preheader64.backedge, %.preheader64.lr.ph
  %indvars.iv6077 = phi i64 [ 0, %.preheader64.lr.ph ], [ %indvars.iv6077.be, %.preheader64.backedge ]
  %exitcond4867 = icmp eq i64 %indvars.iv6077, 0
  br i1 %exitcond4867, label %.preheader64.backedge, label %.preheader62.preheader

.preheader64.backedge:                            ; preds = %.preheader64, %._crit_edge76
  %indvars.iv6077.be = phi i64 [ %indvars.iv.next61, %._crit_edge76 ], [ 1, %.preheader64 ]
  br label %.preheader64

.preheader62.preheader:                           ; preds = %.preheader64
  %.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv6077, i64 0
  %1 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv6077, i64 0
  br label %.preheader62

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge72.us
  %indvars.iv5674.us = phi i64 [ %indvars.iv.next57.us, %._crit_edge72.us ], [ %indvars.iv6077, %.preheader.us.preheader ]
  %2 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv6077, i64 %indvars.iv5674.us
  %.pre84 = load double, double* %2, align 8
  br i1 %lcmp.mod5, label %.prol.loopexit3.unr-lcssa, label %.prol.preheader2

.prol.preheader2:                                 ; preds = %.preheader.us
  br label %3

; <label>:3:                                      ; preds = %.prol.preheader2
  %4 = load double, double* %50, align 8
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv5674.us
  %6 = load double, double* %5, align 8
  %7 = fmul double %4, %6
  %8 = fsub double %.pre84, %7
  store double %8, double* %2, align 8
  br label %.prol.loopexit3.unr-lcssa

.prol.loopexit3.unr-lcssa:                        ; preds = %.preheader.us, %3
  %.unr6.ph = phi double [ %8, %3 ], [ %.pre84, %.preheader.us ]
  %indvars.iv4970.us.unr.ph = phi i64 [ 1, %3 ], [ 0, %.preheader.us ]
  br label %.prol.loopexit3

.prol.loopexit3:                                  ; preds = %.prol.loopexit3.unr-lcssa
  br i1 %49, label %._crit_edge72.us, label %.preheader.us.new

.preheader.us.new:                                ; preds = %.prol.loopexit3
  br label %9

; <label>:9:                                      ; preds = %9, %.preheader.us.new
  %10 = phi double [ %.unr6.ph, %.preheader.us.new ], [ %22, %9 ]
  %indvars.iv4970.us = phi i64 [ %indvars.iv4970.us.unr.ph, %.preheader.us.new ], [ %indvars.iv.next50.us.1, %9 ]
  %11 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv6077, i64 %indvars.iv4970.us
  %12 = load double, double* %11, align 8
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv4970.us, i64 %indvars.iv5674.us
  %14 = load double, double* %13, align 8
  %15 = fmul double %12, %14
  %16 = fsub double %10, %15
  store double %16, double* %2, align 8
  %indvars.iv.next50.us = add nuw nsw i64 %indvars.iv4970.us, 1
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv6077, i64 %indvars.iv.next50.us
  %18 = load double, double* %17, align 8
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next50.us, i64 %indvars.iv5674.us
  %20 = load double, double* %19, align 8
  %21 = fmul double %18, %20
  %22 = fsub double %16, %21
  store double %22, double* %2, align 8
  %indvars.iv.next50.us.1 = add nsw i64 %indvars.iv4970.us, 2
  %exitcond53.us.1 = icmp eq i64 %indvars.iv.next50.us.1, %indvars.iv6077
  br i1 %exitcond53.us.1, label %._crit_edge72.us.unr-lcssa, label %9

._crit_edge72.us.unr-lcssa:                       ; preds = %9
  br label %._crit_edge72.us

._crit_edge72.us:                                 ; preds = %.prol.loopexit3, %._crit_edge72.us.unr-lcssa
  %indvars.iv.next57.us = add nuw nsw i64 %indvars.iv5674.us, 1
  %exitcond59.us = icmp eq i64 %indvars.iv.next57.us, 2000
  br i1 %exitcond59.us, label %._crit_edge76, label %.preheader.us

.preheader62:                                     ; preds = %.preheader62.preheader, %._crit_edge
  %indvars.iv4368 = phi i64 [ %indvars.iv.next44, %._crit_edge ], [ 0, %.preheader62.preheader ]
  %exitcond65 = icmp eq i64 %indvars.iv4368, 0
  br i1 %exitcond65, label %.preheader62.._crit_edge_crit_edge, label %.lr.ph

.preheader62.._crit_edge_crit_edge:               ; preds = %.preheader62
  %.pre83 = load double, double* %.phi.trans.insert, align 8
  br label %._crit_edge

.lr.ph:                                           ; preds = %.preheader62
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv6077, i64 %indvars.iv4368
  %.pre = load double, double* %23, align 8
  %xtraiter = and i64 %indvars.iv4368, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.prol.loopexit.unr-lcssa, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph
  br label %24

; <label>:24:                                     ; preds = %.prol.preheader
  %25 = load double, double* %1, align 8
  %26 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv4368
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
  %30 = icmp eq i64 %indvars.iv4368, 1
  br i1 %30, label %._crit_edge.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.prol.loopexit
  br label %31

; <label>:31:                                     ; preds = %31, %.lr.ph.new
  %32 = phi double [ %.unr.ph, %.lr.ph.new ], [ %44, %31 ]
  %indvars.iv66 = phi i64 [ %indvars.iv66.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %31 ]
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv6077, i64 %indvars.iv66
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv66, i64 %indvars.iv4368
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = fsub double %32, %37
  store double %38, double* %23, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv66, 1
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv6077, i64 %indvars.iv.next
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv4368
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fsub double %38, %43
  store double %44, double* %23, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv66, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv4368
  br i1 %exitcond.1, label %._crit_edge.loopexit.unr-lcssa, label %31

._crit_edge.loopexit.unr-lcssa:                   ; preds = %31
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %.prol.loopexit ], [ %44, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader62.._crit_edge_crit_edge
  %.pre-phi = phi double* [ %.phi.trans.insert, %.preheader62.._crit_edge_crit_edge ], [ %23, %._crit_edge.loopexit ]
  %45 = phi double [ %.pre83, %.preheader62.._crit_edge_crit_edge ], [ %.lcssa, %._crit_edge.loopexit ]
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv4368, i64 %indvars.iv4368
  %47 = load double, double* %46, align 8
  %48 = fdiv double %45, %47
  store double %48, double* %.pre-phi, align 8
  %indvars.iv.next44 = add nuw nsw i64 %indvars.iv4368, 1
  %exitcond48 = icmp eq i64 %indvars.iv.next44, %indvars.iv6077
  br i1 %exitcond48, label %.preheader.us.preheader, label %.preheader62

.preheader.us.preheader:                          ; preds = %._crit_edge
  %xtraiter4 = and i64 %indvars.iv6077, 1
  %lcmp.mod5 = icmp eq i64 %xtraiter4, 0
  %49 = icmp eq i64 %indvars.iv6077, 1
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv6077, i64 0
  br label %.preheader.us

._crit_edge76:                                    ; preds = %._crit_edge72.us
  %indvars.iv.next61 = add nuw nsw i64 %indvars.iv6077, 1
  %51 = icmp slt i64 %indvars.iv.next61, 2000
  br i1 %51, label %.preheader64.backedge, label %._crit_edge79

._crit_edge79:                                    ; preds = %._crit_edge76
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #6
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge15.us, %.preheader.us.preheader
  %indvars.iv1116.us = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next12.us, %._crit_edge15.us ]
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
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #7
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv14.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 2000
  br i1 %exitcond.us, label %._crit_edge15.us, label %6

._crit_edge15.us:                                 ; preds = %._crit_edge.us
  %indvars.iv.next12.us = add nuw nsw i64 %indvars.iv1116.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next12.us, 2000
  br i1 %exitcond, label %._crit_edge18, label %.preheader.us

._crit_edge18:                                    ; preds = %._crit_edge15.us
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
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
