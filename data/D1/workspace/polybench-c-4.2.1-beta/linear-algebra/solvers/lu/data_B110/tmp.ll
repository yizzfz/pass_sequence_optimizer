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
.preheader72.lr.ph:
  br label %.preheader72

.preheader72:                                     ; preds = %.preheader72.backedge, %.preheader72.lr.ph
  %indvars.iv = phi i64 [ 0, %.preheader72.lr.ph ], [ %indvars.iv.next, %.preheader72.backedge ]
  %1 = shl i64 %indvars.iv, 32
  %sext = add i64 %1, 4294967296
  %2 = ashr exact i64 %sext, 32
  %3 = sub i64 1998, %indvars.iv
  %4 = shl i64 %3, 3
  %5 = and i64 %4, 34359738360
  br label %10

.preheader71:                                     ; preds = %10
  %indvars.iv.next = add nuw i64 %indvars.iv, 1
  %6 = icmp slt i64 %indvars.iv.next, 2000
  br i1 %6, label %._crit_edge132.thread, label %._crit_edge132

._crit_edge132.thread:                            ; preds = %.preheader71
  %7 = add nuw nsw i64 %5, 8
  %scevgep154 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv, i64 %2
  %8 = bitcast double* %scevgep154 to i8*
  call void @llvm.memset.p0i8.i64(i8* %8, i8 0, i64 %7, i32 8, i1 false)
  %9 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv
  store double 1.000000e+00, double* %9, align 8
  br label %.preheader72.backedge

; <label>:10:                                     ; preds = %10, %.preheader72
  %indvars.iv125 = phi i64 [ 0, %.preheader72 ], [ %indvars.iv.next126, %10 ]
  %11 = sub nsw i64 0, %indvars.iv125
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 2000
  %14 = sitofp i32 %13 to double
  %15 = fdiv double %14, 2.000000e+03
  %16 = fadd double %15, 1.000000e+00
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv125
  store double %16, double* %17, align 8
  %indvars.iv.next126 = add nuw nsw i64 %indvars.iv125, 1
  %exitcond = icmp eq i64 %indvars.iv125, %indvars.iv
  br i1 %exitcond, label %.preheader71, label %10

._crit_edge132:                                   ; preds = %.preheader71
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv
  store double 1.000000e+00, double* %18, align 8
  %exitcond141 = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond141, label %.preheader70.lr.ph.split.us, label %.preheader72.backedge

.preheader72.backedge:                            ; preds = %._crit_edge132, %._crit_edge132.thread
  br label %.preheader72

.preheader70.lr.ph.split.us:                      ; preds = %._crit_edge132
  %19 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge113.us

._crit_edge113.us:                                ; preds = %._crit_edge113.us, %.preheader70.lr.ph.split.us
  %indvars.iv119.us = phi i64 [ 0, %.preheader70.lr.ph.split.us ], [ %indvars.iv.next120.us.7, %._crit_edge113.us ]
  %20 = mul nuw nsw i64 %indvars.iv119.us, 16000
  %scevgep = getelementptr i8, i8* %19, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next120.us = or i64 %indvars.iv119.us, 1
  %21 = mul nuw nsw i64 %indvars.iv.next120.us, 16000
  %scevgep.1 = getelementptr i8, i8* %19, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next120.us.1 = or i64 %indvars.iv119.us, 2
  %22 = mul nuw nsw i64 %indvars.iv.next120.us.1, 16000
  %scevgep.2 = getelementptr i8, i8* %19, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next120.us.2 = or i64 %indvars.iv119.us, 3
  %23 = mul nuw nsw i64 %indvars.iv.next120.us.2, 16000
  %scevgep.3 = getelementptr i8, i8* %19, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next120.us.3 = or i64 %indvars.iv119.us, 4
  %24 = mul nuw nsw i64 %indvars.iv.next120.us.3, 16000
  %scevgep.4 = getelementptr i8, i8* %19, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next120.us.4 = or i64 %indvars.iv119.us, 5
  %25 = mul nuw nsw i64 %indvars.iv.next120.us.4, 16000
  %scevgep.5 = getelementptr i8, i8* %19, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next120.us.5 = or i64 %indvars.iv119.us, 6
  %26 = mul nuw nsw i64 %indvars.iv.next120.us.5, 16000
  %scevgep.6 = getelementptr i8, i8* %19, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next120.us.6 = or i64 %indvars.iv119.us, 7
  %27 = mul nuw nsw i64 %indvars.iv.next120.us.6, 16000
  %scevgep.7 = getelementptr i8, i8* %19, i64 %27
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next120.us.7 = add nsw i64 %indvars.iv119.us, 8
  %exitcond122.us.7 = icmp eq i64 %indvars.iv.next120.us.7, 2000
  br i1 %exitcond122.us.7, label %.preheader67.us.us.preheader.preheader, label %._crit_edge113.us

.preheader67.us.us.preheader.preheader:           ; preds = %._crit_edge113.us
  %28 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %29 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %30 = bitcast i8* %19 to [2000 x [2000 x double]]*
  br label %.preheader67.us.us.preheader

.preheader67.us.us.preheader:                     ; preds = %.preheader67.us.us.preheader.preheader, %._crit_edge88.us
  %indvars.iv94.us = phi i64 [ %indvars.iv.next95.us, %._crit_edge88.us ], [ 0, %.preheader67.us.us.preheader.preheader ]
  %scevgep4 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv94.us
  %31 = add nuw nsw i64 %indvars.iv94.us, 1
  %scevgep6 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %31
  %32 = bitcast double* %scevgep6 to i8*
  %33 = bitcast double* %scevgep4 to i8*
  br label %.preheader67.us.us

._crit_edge88.us:                                 ; preds = %._crit_edge82.us.us
  %indvars.iv.next95.us = add nuw nsw i64 %indvars.iv94.us, 1
  %exitcond97.us = icmp eq i64 %indvars.iv.next95.us, 2000
  br i1 %exitcond97.us, label %.preheader.us.preheader, label %.preheader67.us.us.preheader

.preheader.us.preheader:                          ; preds = %._crit_edge88.us
  %34 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %35 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %36 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %37 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %38 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %39 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %40 = bitcast i8* %19 to [2000 x [2000 x double]]*
  br label %.preheader.us

.preheader67.us.us:                               ; preds = %._crit_edge82.us.us, %.preheader67.us.us.preheader
  %indvars.iv89.us.us = phi i64 [ 0, %.preheader67.us.us.preheader ], [ %indvars.iv.next90.us.us, %._crit_edge82.us.us ]
  %41 = mul nuw nsw i64 %indvars.iv89.us.us, 16000
  %scevgep2 = getelementptr i8, i8* %19, i64 %41
  %42 = add nuw nsw i64 %41, 16000
  %scevgep3 = getelementptr i8, i8* %19, i64 %42
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv89.us.us, i64 %indvars.iv94.us
  %bound0 = icmp ult i8* %scevgep2, %32
  %bound1 = icmp ult i8* %33, %scevgep3
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %43 to i8*
  %bc8 = bitcast double* %43 to i8*
  %bound09 = icmp ult i8* %scevgep2, %bc8
  %bound110 = icmp ult i8* %bc, %scevgep3
  %found.conflict11 = and i1 %bound09, %bound110
  %conflict.rdx = or i1 %found.conflict, %found.conflict11
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader67.us.us
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader67.us.us
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %44 = or i64 %index, 1
  %45 = or i64 %index, 2
  %46 = or i64 %index, 3
  %47 = load double, double* %43, align 8, !alias.scope !1
  %48 = insertelement <2 x double> undef, double %47, i32 0
  %49 = shufflevector <2 x double> %48, <2 x double> undef, <2 x i32> zeroinitializer
  %50 = insertelement <2 x double> undef, double %47, i32 0
  %51 = shufflevector <2 x double> %50, <2 x double> undef, <2 x i32> zeroinitializer
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv94.us
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %44, i64 %indvars.iv94.us
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %45, i64 %indvars.iv94.us
  %55 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %46, i64 %indvars.iv94.us
  %56 = load double, double* %52, align 8, !alias.scope !4
  %57 = load double, double* %53, align 8, !alias.scope !4
  %58 = load double, double* %54, align 8, !alias.scope !4
  %59 = load double, double* %55, align 8, !alias.scope !4
  %60 = insertelement <2 x double> undef, double %56, i32 0
  %61 = insertelement <2 x double> %60, double %57, i32 1
  %62 = insertelement <2 x double> undef, double %58, i32 0
  %63 = insertelement <2 x double> %62, double %59, i32 1
  %64 = fmul <2 x double> %49, %61
  %65 = fmul <2 x double> %51, %63
  %66 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %30, i64 0, i64 %indvars.iv89.us.us, i64 %index
  %67 = bitcast double* %66 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %67, align 8, !alias.scope !6, !noalias !8
  %68 = getelementptr double, double* %66, i64 2
  %69 = bitcast double* %68 to <2 x double>*
  %wide.load13 = load <2 x double>, <2 x double>* %69, align 8, !alias.scope !6, !noalias !8
  %70 = fadd <2 x double> %wide.load, %64
  %71 = fadd <2 x double> %wide.load13, %65
  %72 = bitcast double* %66 to <2 x double>*
  store <2 x double> %70, <2 x double>* %72, align 8, !alias.scope !6, !noalias !8
  %73 = bitcast double* %68 to <2 x double>*
  store <2 x double> %71, <2 x double>* %73, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %74 = icmp eq i64 %index.next, 2000
  br i1 %74, label %._crit_edge82.us.us.loopexit44, label %vector.body, !llvm.loop !9

._crit_edge82.us.us.loopexit:                     ; preds = %scalar.ph
  br label %._crit_edge82.us.us

._crit_edge82.us.us.loopexit44:                   ; preds = %vector.body
  br label %._crit_edge82.us.us

._crit_edge82.us.us:                              ; preds = %._crit_edge82.us.us.loopexit44, %._crit_edge82.us.us.loopexit
  %indvars.iv.next90.us.us = add nuw nsw i64 %indvars.iv89.us.us, 1
  %exitcond92.us.us = icmp eq i64 %indvars.iv.next90.us.us, 2000
  br i1 %exitcond92.us.us, label %._crit_edge88.us, label %.preheader67.us.us

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv83.us.us = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next84.us.us.1, %scalar.ph ]
  %75 = load double, double* %43, align 8
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv83.us.us, i64 %indvars.iv94.us
  %77 = load double, double* %76, align 8
  %78 = fmul double %75, %77
  %79 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %28, i64 0, i64 %indvars.iv89.us.us, i64 %indvars.iv83.us.us
  %80 = load double, double* %79, align 8
  %81 = fadd double %80, %78
  store double %81, double* %79, align 8
  %indvars.iv.next84.us.us = or i64 %indvars.iv83.us.us, 1
  %82 = load double, double* %43, align 8
  %83 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next84.us.us, i64 %indvars.iv94.us
  %84 = load double, double* %83, align 8
  %85 = fmul double %82, %84
  %86 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %29, i64 0, i64 %indvars.iv89.us.us, i64 %indvars.iv.next84.us.us
  %87 = load double, double* %86, align 8
  %88 = fadd double %87, %85
  store double %88, double* %86, align 8
  %indvars.iv.next84.us.us.1 = add nsw i64 %indvars.iv83.us.us, 2
  %exitcond86.us.us.1 = icmp eq i64 %indvars.iv.next84.us.us.1, 2000
  br i1 %exitcond86.us.us.1, label %._crit_edge82.us.us.loopexit, label %scalar.ph, !llvm.loop !12

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv76.us = phi i64 [ %indvars.iv.next77.us, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep19 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv76.us, i64 0
  %scevgep1920 = bitcast double* %scevgep19 to i8*
  %89 = add nuw nsw i64 %indvars.iv76.us, 1
  %scevgep21 = getelementptr [2000 x double], [2000 x double]* %0, i64 %89, i64 0
  %scevgep2122 = bitcast double* %scevgep21 to i8*
  %90 = mul nuw nsw i64 %indvars.iv76.us, 16000
  %scevgep23 = getelementptr i8, i8* %19, i64 %90
  %91 = add nuw nsw i64 %90, 16000
  %scevgep24 = getelementptr i8, i8* %19, i64 %91
  %bound025 = icmp ult i8* %scevgep1920, %scevgep24
  %bound126 = icmp ult i8* %scevgep23, %scevgep2122
  %memcheck.conflict28 = and i1 %bound025, %bound126
  br i1 %memcheck.conflict28, label %scalar.ph16.preheader, label %vector.body14.preheader

vector.body14.preheader:                          ; preds = %.preheader.us
  br label %vector.body14

scalar.ph16.preheader:                            ; preds = %.preheader.us
  br label %scalar.ph16

vector.body14:                                    ; preds = %vector.body14, %vector.body14.preheader
  %index31 = phi i64 [ 0, %vector.body14.preheader ], [ %index.next32.1, %vector.body14 ]
  %92 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %39, i64 0, i64 %indvars.iv76.us, i64 %index31
  %93 = bitcast double* %92 to <2 x i64>*
  %wide.load39 = load <2 x i64>, <2 x i64>* %93, align 8, !alias.scope !13
  %94 = getelementptr double, double* %92, i64 2
  %95 = bitcast double* %94 to <2 x i64>*
  %wide.load40 = load <2 x i64>, <2 x i64>* %95, align 8, !alias.scope !13
  %96 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv76.us, i64 %index31
  %97 = bitcast double* %96 to <2 x i64>*
  store <2 x i64> %wide.load39, <2 x i64>* %97, align 8, !alias.scope !16, !noalias !13
  %98 = getelementptr double, double* %96, i64 2
  %99 = bitcast double* %98 to <2 x i64>*
  store <2 x i64> %wide.load40, <2 x i64>* %99, align 8, !alias.scope !16, !noalias !13
  %index.next32 = or i64 %index31, 4
  %100 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %40, i64 0, i64 %indvars.iv76.us, i64 %index.next32
  %101 = bitcast double* %100 to <2 x i64>*
  %wide.load39.1 = load <2 x i64>, <2 x i64>* %101, align 8, !alias.scope !13
  %102 = getelementptr double, double* %100, i64 2
  %103 = bitcast double* %102 to <2 x i64>*
  %wide.load40.1 = load <2 x i64>, <2 x i64>* %103, align 8, !alias.scope !13
  %104 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv76.us, i64 %index.next32
  %105 = bitcast double* %104 to <2 x i64>*
  store <2 x i64> %wide.load39.1, <2 x i64>* %105, align 8, !alias.scope !16, !noalias !13
  %106 = getelementptr double, double* %104, i64 2
  %107 = bitcast double* %106 to <2 x i64>*
  store <2 x i64> %wide.load40.1, <2 x i64>* %107, align 8, !alias.scope !16, !noalias !13
  %index.next32.1 = add nsw i64 %index31, 8
  %108 = icmp eq i64 %index.next32.1, 2000
  br i1 %108, label %._crit_edge.us.loopexit43, label %vector.body14, !llvm.loop !18

scalar.ph16:                                      ; preds = %scalar.ph16, %scalar.ph16.preheader
  %indvars.iv.us = phi i64 [ 0, %scalar.ph16.preheader ], [ %indvars.iv.next.us.4, %scalar.ph16 ]
  %109 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %34, i64 0, i64 %indvars.iv76.us, i64 %indvars.iv.us
  %110 = bitcast double* %109 to i64*
  %111 = load i64, i64* %110, align 8
  %112 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv76.us, i64 %indvars.iv.us
  %113 = bitcast double* %112 to i64*
  store i64 %111, i64* %113, align 8
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %114 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %indvars.iv76.us, i64 %indvars.iv.next.us
  %115 = bitcast double* %114 to i64*
  %116 = load i64, i64* %115, align 8
  %117 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv76.us, i64 %indvars.iv.next.us
  %118 = bitcast double* %117 to i64*
  store i64 %116, i64* %118, align 8
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv.us, 2
  %119 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv76.us, i64 %indvars.iv.next.us.1
  %120 = bitcast double* %119 to i64*
  %121 = load i64, i64* %120, align 8
  %122 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv76.us, i64 %indvars.iv.next.us.1
  %123 = bitcast double* %122 to i64*
  store i64 %121, i64* %123, align 8
  %indvars.iv.next.us.2 = add nsw i64 %indvars.iv.us, 3
  %124 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv76.us, i64 %indvars.iv.next.us.2
  %125 = bitcast double* %124 to i64*
  %126 = load i64, i64* %125, align 8
  %127 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv76.us, i64 %indvars.iv.next.us.2
  %128 = bitcast double* %127 to i64*
  store i64 %126, i64* %128, align 8
  %indvars.iv.next.us.3 = add nsw i64 %indvars.iv.us, 4
  %129 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %38, i64 0, i64 %indvars.iv76.us, i64 %indvars.iv.next.us.3
  %130 = bitcast double* %129 to i64*
  %131 = load i64, i64* %130, align 8
  %132 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv76.us, i64 %indvars.iv.next.us.3
  %133 = bitcast double* %132 to i64*
  store i64 %131, i64* %133, align 8
  %indvars.iv.next.us.4 = add nsw i64 %indvars.iv.us, 5
  %exitcond.us.4 = icmp eq i64 %indvars.iv.next.us.4, 2000
  br i1 %exitcond.us.4, label %._crit_edge.us.loopexit, label %scalar.ph16, !llvm.loop !19

._crit_edge.us.loopexit:                          ; preds = %scalar.ph16
  br label %._crit_edge.us

._crit_edge.us.loopexit43:                        ; preds = %vector.body14
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit43, %._crit_edge.us.loopexit
  %indvars.iv.next77.us = add nuw nsw i64 %indvars.iv76.us, 1
  %exitcond79.us = icmp eq i64 %indvars.iv.next77.us, 2000
  br i1 %exitcond79.us, label %._crit_edge75, label %.preheader.us

._crit_edge75:                                    ; preds = %._crit_edge.us
  tail call void @free(i8* nonnull %19) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]* nocapture) unnamed_addr #2 {
.preheader43.lr.ph:
  br label %.preheader43

.preheader43:                                     ; preds = %._crit_edge66, %.preheader43.lr.ph
  %indvars.iv93 = phi i64 [ 0, %.preheader43.lr.ph ], [ %indvars.iv.next94, %._crit_edge66 ]
  %1 = icmp sgt i64 %indvars.iv93, 0
  br i1 %1, label %.preheader41.preheader, label %._crit_edge66

.preheader41.preheader:                           ; preds = %.preheader43
  %2 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv93, i64 0
  br label %.preheader41

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge58.us
  %indvars.iv69.us = phi i64 [ %indvars.iv.next70.us, %._crit_edge58.us ], [ %indvars.iv93, %.preheader.us.preheader ]
  %3 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv93, i64 %indvars.iv69.us
  %.pre89 = load double, double* %3, align 8
  br i1 %lcmp.mod2, label %.prol.loopexit.unr-lcssa, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  br label %4

; <label>:4:                                      ; preds = %.prol.preheader
  %5 = load double, double* %50, align 8
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv69.us
  %7 = load double, double* %6, align 8
  %8 = fmul double %5, %7
  %9 = fsub double %.pre89, %8
  store double %9, double* %3, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.preheader.us, %4
  %.unr3.ph = phi double [ %9, %4 ], [ %.pre89, %.preheader.us ]
  %indvars.iv59.us.unr.ph = phi i64 [ 1, %4 ], [ 0, %.preheader.us ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %49, label %._crit_edge58.us, label %.preheader.us.new

.preheader.us.new:                                ; preds = %.prol.loopexit
  br label %10

; <label>:10:                                     ; preds = %10, %.preheader.us.new
  %11 = phi double [ %.unr3.ph, %.preheader.us.new ], [ %23, %10 ]
  %indvars.iv59.us = phi i64 [ %indvars.iv59.us.unr.ph, %.preheader.us.new ], [ %indvars.iv.next60.us.1, %10 ]
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv93, i64 %indvars.iv59.us
  %13 = load double, double* %12, align 8
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv59.us, i64 %indvars.iv69.us
  %15 = load double, double* %14, align 8
  %16 = fmul double %13, %15
  %17 = fsub double %11, %16
  store double %17, double* %3, align 8
  %indvars.iv.next60.us = add nuw nsw i64 %indvars.iv59.us, 1
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv93, i64 %indvars.iv.next60.us
  %19 = load double, double* %18, align 8
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next60.us, i64 %indvars.iv69.us
  %21 = load double, double* %20, align 8
  %22 = fmul double %19, %21
  %23 = fsub double %17, %22
  store double %23, double* %3, align 8
  %indvars.iv.next60.us.1 = add nsw i64 %indvars.iv59.us, 2
  %exitcond64.us.1 = icmp eq i64 %indvars.iv.next60.us.1, %indvars.iv93
  br i1 %exitcond64.us.1, label %._crit_edge58.us.unr-lcssa, label %10

._crit_edge58.us.unr-lcssa:                       ; preds = %10
  br label %._crit_edge58.us

._crit_edge58.us:                                 ; preds = %.prol.loopexit, %._crit_edge58.us.unr-lcssa
  %indvars.iv.next70.us = add nuw nsw i64 %indvars.iv69.us, 1
  %exitcond72.us = icmp eq i64 %indvars.iv.next70.us, 2000
  br i1 %exitcond72.us, label %._crit_edge66.loopexit, label %.preheader.us

.preheader41:                                     ; preds = %.preheader41.preheader, %._crit_edge
  %indvars.iv90 = phi i64 [ %indvars.iv.next91, %._crit_edge ], [ -1, %.preheader41.preheader ]
  %indvars.iv50 = phi i64 [ %indvars.iv.next51, %._crit_edge ], [ 0, %.preheader41.preheader ]
  %24 = icmp sgt i64 %indvars.iv50, 0
  %25 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv93, i64 %indvars.iv50
  %.pre = load double, double* %25, align 8
  br i1 %24, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader41
  %xtraiter = and i64 %indvars.iv50, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.loopexit.unr-lcssa, label %.lr.ph.prol.preheader

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader
  %26 = load double, double* %2, align 8
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv50
  %28 = load double, double* %27, align 8
  %29 = fmul double %26, %28
  %30 = fsub double %.pre, %29
  store double %30, double* %25, align 8
  br label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.preheader, %.lr.ph.prol
  %.lcssa.unr.ph = phi double [ %30, %.lr.ph.prol ], [ undef, %.lr.ph.preheader ]
  %.unr.ph = phi double [ %30, %.lr.ph.prol ], [ %.pre, %.lr.ph.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader ]
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.unr-lcssa
  %31 = icmp eq i64 %indvars.iv50, 1
  br i1 %31, label %._crit_edge.loopexit, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %32 = phi double [ %.unr.ph, %.lr.ph.preheader.new ], [ %44, %.lr.ph ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.preheader.new ], [ %indvars.iv.next.1, %.lr.ph ]
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv93, i64 %indvars.iv
  %34 = load double, double* %33, align 8
  %35 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv50
  %36 = load double, double* %35, align 8
  %37 = fmul double %34, %36
  %38 = fsub double %32, %37
  store double %38, double* %25, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv93, i64 %indvars.iv.next
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv50
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fsub double %38, %43
  store double %44, double* %25, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond92.1 = icmp eq i64 %indvars.iv.next, %indvars.iv90
  br i1 %exitcond92.1, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %.lr.ph.prol.loopexit ], [ %44, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader41
  %45 = phi double [ %.pre, %.preheader41 ], [ %.lcssa, %._crit_edge.loopexit ]
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv50, i64 %indvars.iv50
  %47 = load double, double* %46, align 8
  %48 = fdiv double %45, %47
  store double %48, double* %25, align 8
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond55 = icmp eq i64 %indvars.iv.next51, %indvars.iv93
  %indvars.iv.next91 = add nsw i64 %indvars.iv90, 1
  br i1 %exitcond55, label %.preheader.us.preheader, label %.preheader41

.preheader.us.preheader:                          ; preds = %._crit_edge
  %xtraiter1 = and i64 %indvars.iv93, 1
  %lcmp.mod2 = icmp eq i64 %xtraiter1, 0
  %49 = icmp eq i64 %indvars.iv93, 1
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv93, i64 0
  br label %.preheader.us

._crit_edge66.loopexit:                           ; preds = %._crit_edge58.us
  br label %._crit_edge66

._crit_edge66:                                    ; preds = %._crit_edge66.loopexit, %.preheader43
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %exitcond84 = icmp eq i64 %indvars.iv.next94, 2000
  br i1 %exitcond84, label %._crit_edge80, label %.preheader43

._crit_edge80:                                    ; preds = %._crit_edge66
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
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge12.us, %.preheader.lr.ph
  %indvars.iv15.us = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next16.us, %._crit_edge12.us ]
  %5 = mul nuw nsw i64 %indvars.iv15.us, 2000
  br label %6

; <label>:6:                                      ; preds = %._crit_edge.us, %.preheader.us
  %indvars.iv.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %._crit_edge.us ]
  %7 = add nuw nsw i64 %indvars.iv.us, %5
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
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv15.us, i64 %indvars.iv.us
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #7
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 2000
  br i1 %exitcond.us, label %._crit_edge12.us, label %6

._crit_edge12.us:                                 ; preds = %._crit_edge.us
  %indvars.iv.next16.us = add nuw nsw i64 %indvars.iv15.us, 1
  %exitcond18.us = icmp eq i64 %indvars.iv.next16.us, 2000
  br i1 %exitcond18.us, label %._crit_edge14, label %.preheader.us

._crit_edge14:                                    ; preds = %._crit_edge12.us
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
