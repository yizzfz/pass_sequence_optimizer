; ModuleID = 'A.ll'
source_filename = "cholesky.c"
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
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array([2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_cholesky([2000 x double]* %4)
  tail call void (...) @polybench_timer_stop() #3
  tail call void (...) @polybench_timer_print() #3
  %5 = icmp sgt i32 %0, 42
  br i1 %5, label %6, label %._crit_edge

; <label>:6:                                      ; preds = %2
  %7 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %7, align 1
  %8 = icmp eq i8 %strcmpload, 0
  br i1 %8, label %9, label %._crit_edge

; <label>:9:                                      ; preds = %6
  tail call fastcc void @print_array([2000 x double]* %4)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array([2000 x double]* nocapture) unnamed_addr #0 {
.preheader14.lr.ph:
  br label %.lr.ph36

.lr.ph36:                                         ; preds = %.preheader14.lr.ph, %._crit_edge40..preheader14_crit_edge
  %indvars.iv81 = phi i64 [ 0, %.preheader14.lr.ph ], [ %indvars.iv.next82, %._crit_edge40..preheader14_crit_edge ]
  %indvars.iv79 = phi i64 [ 1, %.preheader14.lr.ph ], [ %indvars.iv.next80, %._crit_edge40..preheader14_crit_edge ]
  %1 = mul nuw nsw i64 %indvars.iv81, 2001
  %2 = add nuw nsw i64 %1, 1
  %3 = sub i64 1998, %indvars.iv81
  %4 = shl i64 %3, 3
  br label %._crit_edge

.preheader13:                                     ; preds = %._crit_edge
  %scevgep75 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %2
  %5 = and i64 %4, 34359738360
  %scevgep7576 = bitcast double* %scevgep75 to i8*
  %6 = add nuw nsw i64 %5, 8
  %indvars.iv.next82 = add nuw nsw i64 %indvars.iv81, 1
  %7 = icmp slt i64 %indvars.iv.next82, 2000
  br i1 %7, label %._crit_edge40.thread, label %._crit_edge40

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph36
  %indvars.iv61 = phi i64 [ 0, %.lr.ph36 ], [ %indvars.iv.next62, %._crit_edge ]
  %8 = sub nsw i64 0, %indvars.iv61
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 2000
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 2.000000e+03
  %13 = fadd double %12, 1.000000e+00
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv81, i64 %indvars.iv61
  store double %13, double* %14, align 8
  %indvars.iv.next62 = add nuw nsw i64 %indvars.iv61, 1
  %exitcond68 = icmp eq i64 %indvars.iv.next62, %indvars.iv79
  br i1 %exitcond68, label %.preheader13, label %._crit_edge

._crit_edge40.thread:                             ; preds = %.preheader13
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep7576, i8 0, i64 %6, i32 8, i1 false)
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv81, i64 %indvars.iv81
  store double 1.000000e+00, double* %15, align 8
  br label %._crit_edge40..preheader14_crit_edge

._crit_edge40:                                    ; preds = %.preheader13
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv81, i64 %indvars.iv81
  store double 1.000000e+00, double* %16, align 8
  %exitcond84 = icmp eq i64 %indvars.iv.next82, 2000
  br i1 %exitcond84, label %.preheader12.us.preheader, label %._crit_edge40..preheader14_crit_edge

._crit_edge40..preheader14_crit_edge:             ; preds = %._crit_edge40.thread, %._crit_edge40
  %indvars.iv.next80 = add nuw nsw i64 %indvars.iv79, 1
  br label %.lr.ph36

.preheader12.us.preheader:                        ; preds = %._crit_edge40
  %17 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  br label %._crit_edge33.us

._crit_edge33.us:                                 ; preds = %._crit_edge33.us, %.preheader12.us.preheader
  %indvar55 = phi i64 [ 0, %.preheader12.us.preheader ], [ %indvar.next56.7, %._crit_edge33.us ]
  %18 = mul nuw nsw i64 %indvar55, 16000
  %scevgep = getelementptr i8, i8* %17, i64 %18
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next56 = or i64 %indvar55, 1
  %19 = mul nuw nsw i64 %indvar.next56, 16000
  %scevgep.1 = getelementptr i8, i8* %17, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next56.1 = or i64 %indvar55, 2
  %20 = mul nuw nsw i64 %indvar.next56.1, 16000
  %scevgep.2 = getelementptr i8, i8* %17, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next56.2 = or i64 %indvar55, 3
  %21 = mul nuw nsw i64 %indvar.next56.2, 16000
  %scevgep.3 = getelementptr i8, i8* %17, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next56.3 = or i64 %indvar55, 4
  %22 = mul nuw nsw i64 %indvar.next56.3, 16000
  %scevgep.4 = getelementptr i8, i8* %17, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next56.4 = or i64 %indvar55, 5
  %23 = mul nuw nsw i64 %indvar.next56.4, 16000
  %scevgep.5 = getelementptr i8, i8* %17, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next56.5 = or i64 %indvar55, 6
  %24 = mul nuw nsw i64 %indvar.next56.5, 16000
  %scevgep.6 = getelementptr i8, i8* %17, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next56.6 = or i64 %indvar55, 7
  %25 = mul nuw nsw i64 %indvar.next56.6, 16000
  %scevgep.7 = getelementptr i8, i8* %17, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvar.next56.7 = add nuw nsw i64 %indvar55, 8
  %exitcond60.7 = icmp eq i64 %indvar.next56.7, 2000
  br i1 %exitcond60.7, label %.preheader9.us.us.preheader.preheader, label %._crit_edge33.us

.preheader9.us.us.preheader.preheader:            ; preds = %._crit_edge33.us
  %26 = bitcast i8* %17 to [2000 x [2000 x double]]*
  br label %.preheader9.us.us.preheader

.preheader9.us.us.preheader:                      ; preds = %.preheader9.us.us.preheader.preheader, %._crit_edge22.us
  %indvars.iv50 = phi i64 [ 0, %.preheader9.us.us.preheader.preheader ], [ %indvars.iv.next51, %._crit_edge22.us ]
  %scevgep7 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv50
  %scevgep78 = bitcast double* %scevgep7 to i8*
  %27 = add nuw nsw i64 %indvars.iv50, 1
  %scevgep9 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %27
  %scevgep910 = bitcast double* %scevgep9 to i8*
  br label %.preheader9.us.us

._crit_edge22.us:                                 ; preds = %._crit_edge20.us.us
  %indvars.iv.next51 = add nuw nsw i64 %indvars.iv50, 1
  %exitcond52 = icmp ne i64 %indvars.iv.next51, 2000
  br i1 %exitcond52, label %.preheader9.us.us.preheader, label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %._crit_edge22.us
  %scevgep28 = getelementptr i8, i8* %17, i64 16000
  br label %.preheader.us

.preheader9.us.us:                                ; preds = %._crit_edge20.us.us, %.preheader9.us.us.preheader
  %indvars.iv48 = phi i64 [ %indvars.iv.next49, %._crit_edge20.us.us ], [ 0, %.preheader9.us.us.preheader ]
  %28 = mul nuw nsw i64 %indvars.iv48, 16000
  %scevgep3 = getelementptr i8, i8* %17, i64 %28
  %29 = add nuw nsw i64 %28, 16000
  %scevgep4 = getelementptr i8, i8* %17, i64 %29
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv48, i64 %indvars.iv50
  %bound0 = icmp ult i8* %scevgep3, %scevgep910
  %bound1 = icmp ult i8* %scevgep78, %scevgep4
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %30 to i8*
  %bc11 = bitcast double* %30 to i8*
  %bound012 = icmp ult i8* %scevgep3, %bc11
  %bound113 = icmp ult i8* %bc, %scevgep4
  %found.conflict14 = and i1 %bound012, %bound113
  %conflict.rdx = or i1 %found.conflict, %found.conflict14
  br i1 %conflict.rdx, label %._crit_edge85.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader9.us.us
  %31 = load double, double* %30, align 8, !alias.scope !1
  %32 = insertelement <2 x double> undef, double %31, i32 0
  %33 = shufflevector <2 x double> %32, <2 x double> undef, <2 x i32> zeroinitializer
  %34 = insertelement <2 x double> undef, double %31, i32 0
  %35 = shufflevector <2 x double> %34, <2 x double> undef, <2 x i32> zeroinitializer
  br label %vector.body

._crit_edge85.preheader:                          ; preds = %.preheader9.us.us
  br label %._crit_edge85

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %36 = or i64 %index, 1
  %37 = or i64 %index, 2
  %38 = or i64 %index, 3
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv50
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %36, i64 %indvars.iv50
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %37, i64 %indvars.iv50
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %38, i64 %indvars.iv50
  %43 = load double, double* %39, align 8, !alias.scope !4
  %44 = load double, double* %40, align 8, !alias.scope !4
  %45 = load double, double* %41, align 8, !alias.scope !4
  %46 = load double, double* %42, align 8, !alias.scope !4
  %47 = insertelement <2 x double> undef, double %43, i32 0
  %48 = insertelement <2 x double> %47, double %44, i32 1
  %49 = insertelement <2 x double> undef, double %45, i32 0
  %50 = insertelement <2 x double> %49, double %46, i32 1
  %51 = fmul <2 x double> %33, %48
  %52 = fmul <2 x double> %35, %50
  %53 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv48, i64 %index
  %54 = bitcast double* %53 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %54, align 8, !alias.scope !6, !noalias !8
  %55 = getelementptr double, double* %53, i64 2
  %56 = bitcast double* %55 to <2 x double>*
  %wide.load16 = load <2 x double>, <2 x double>* %56, align 8, !alias.scope !6, !noalias !8
  %57 = fadd <2 x double> %wide.load, %51
  %58 = fadd <2 x double> %wide.load16, %52
  %59 = bitcast double* %53 to <2 x double>*
  store <2 x double> %57, <2 x double>* %59, align 8, !alias.scope !6, !noalias !8
  %60 = bitcast double* %55 to <2 x double>*
  store <2 x double> %58, <2 x double>* %60, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %61 = icmp eq i64 %index.next, 2000
  br i1 %61, label %._crit_edge20.us.us.loopexit47, label %vector.body, !llvm.loop !9

._crit_edge20.us.us.loopexit:                     ; preds = %._crit_edge85
  br label %._crit_edge20.us.us

._crit_edge20.us.us.loopexit47:                   ; preds = %vector.body
  br label %._crit_edge20.us.us

._crit_edge20.us.us:                              ; preds = %._crit_edge20.us.us.loopexit47, %._crit_edge20.us.us.loopexit
  %indvars.iv.next49 = add nuw nsw i64 %indvars.iv48, 1
  %exitcond = icmp ne i64 %indvars.iv.next49, 2000
  br i1 %exitcond, label %.preheader9.us.us, label %._crit_edge22.us

._crit_edge85:                                    ; preds = %._crit_edge85, %._crit_edge85.preheader
  %indvars.iv49 = phi i64 [ 0, %._crit_edge85.preheader ], [ %indvars.iv.next50.1, %._crit_edge85 ]
  %62 = load double, double* %30, align 8
  %63 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv49, i64 %indvars.iv50
  %64 = load double, double* %63, align 8
  %65 = fmul double %62, %64
  %66 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv48, i64 %indvars.iv49
  %67 = load double, double* %66, align 8
  %68 = fadd double %67, %65
  store double %68, double* %66, align 8
  %indvars.iv.next50 = or i64 %indvars.iv49, 1
  %69 = load double, double* %30, align 8
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next50, i64 %indvars.iv50
  %71 = load double, double* %70, align 8
  %72 = fmul double %69, %71
  %73 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv48, i64 %indvars.iv.next50
  %74 = load double, double* %73, align 8
  %75 = fadd double %74, %72
  store double %75, double* %73, align 8
  %indvars.iv.next50.1 = add nuw nsw i64 %indvars.iv49, 2
  %exitcond52.1 = icmp eq i64 %indvars.iv.next50.1, 2000
  br i1 %exitcond52.1, label %._crit_edge20.us.us.loopexit, label %._crit_edge85, !llvm.loop !12

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvar = phi i64 [ %indvar.next, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %.2716.us = phi i64 [ %121, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %sext = shl i64 %.2716.us, 32
  %76 = ashr exact i64 %sext, 32
  %scevgep22 = getelementptr [2000 x double], [2000 x double]* %0, i64 %76, i64 0
  %scevgep2223 = bitcast double* %scevgep22 to i8*
  %77 = mul nsw i64 %76, 2000
  %scevgep25 = getelementptr [2000 x double], [2000 x double]* %0, i64 1, i64 %77
  %scevgep2526 = bitcast double* %scevgep25 to i8*
  %78 = mul nsw i64 %76, 16000
  %scevgep27 = getelementptr i8, i8* %17, i64 %78
  %scevgep29 = getelementptr i8, i8* %scevgep28, i64 %78
  %bound030 = icmp ult i8* %scevgep2223, %scevgep29
  %bound131 = icmp ult i8* %scevgep27, %scevgep2526
  %memcheck.conflict33 = and i1 %bound030, %bound131
  br i1 %memcheck.conflict33, label %._crit_edge86.preheader, label %vector.body17.preheader

vector.body17.preheader:                          ; preds = %.preheader.us
  br label %vector.body17

._crit_edge86.preheader:                          ; preds = %.preheader.us
  br label %._crit_edge86

vector.body17:                                    ; preds = %vector.body17, %vector.body17.preheader
  %index36 = phi i64 [ 0, %vector.body17.preheader ], [ %index.next37.1, %vector.body17 ]
  %79 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %76, i64 %index36
  %80 = bitcast double* %79 to <2 x i64>*
  %wide.load44 = load <2 x i64>, <2 x i64>* %80, align 8, !alias.scope !13
  %81 = getelementptr double, double* %79, i64 2
  %82 = bitcast double* %81 to <2 x i64>*
  %wide.load45 = load <2 x i64>, <2 x i64>* %82, align 8, !alias.scope !13
  %83 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %76, i64 %index36
  %84 = bitcast double* %83 to <2 x i64>*
  store <2 x i64> %wide.load44, <2 x i64>* %84, align 8, !alias.scope !16, !noalias !13
  %85 = getelementptr double, double* %83, i64 2
  %86 = bitcast double* %85 to <2 x i64>*
  store <2 x i64> %wide.load45, <2 x i64>* %86, align 8, !alias.scope !16, !noalias !13
  %index.next37 = or i64 %index36, 4
  %87 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %76, i64 %index.next37
  %88 = bitcast double* %87 to <2 x i64>*
  %wide.load44.1 = load <2 x i64>, <2 x i64>* %88, align 8, !alias.scope !13
  %89 = getelementptr double, double* %87, i64 2
  %90 = bitcast double* %89 to <2 x i64>*
  %wide.load45.1 = load <2 x i64>, <2 x i64>* %90, align 8, !alias.scope !13
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %76, i64 %index.next37
  %92 = bitcast double* %91 to <2 x i64>*
  store <2 x i64> %wide.load44.1, <2 x i64>* %92, align 8, !alias.scope !16, !noalias !13
  %93 = getelementptr double, double* %91, i64 2
  %94 = bitcast double* %93 to <2 x i64>*
  store <2 x i64> %wide.load45.1, <2 x i64>* %94, align 8, !alias.scope !16, !noalias !13
  %index.next37.1 = add nuw nsw i64 %index36, 8
  %95 = icmp eq i64 %index.next37.1, 2000
  br i1 %95, label %._crit_edge.us.loopexit46, label %vector.body17, !llvm.loop !18

._crit_edge86:                                    ; preds = %._crit_edge86, %._crit_edge86.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge86.preheader ], [ %indvars.iv.next.4, %._crit_edge86 ]
  %96 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %76, i64 %indvars.iv
  %97 = bitcast double* %96 to i64*
  %98 = load i64, i64* %97, align 8
  %99 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %76, i64 %indvars.iv
  %100 = bitcast double* %99 to i64*
  store i64 %98, i64* %100, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %101 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %76, i64 %indvars.iv.next
  %102 = bitcast double* %101 to i64*
  %103 = load i64, i64* %102, align 8
  %104 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %76, i64 %indvars.iv.next
  %105 = bitcast double* %104 to i64*
  store i64 %103, i64* %105, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %106 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %76, i64 %indvars.iv.next.1
  %107 = bitcast double* %106 to i64*
  %108 = load i64, i64* %107, align 8
  %109 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %76, i64 %indvars.iv.next.1
  %110 = bitcast double* %109 to i64*
  store i64 %108, i64* %110, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %111 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %76, i64 %indvars.iv.next.2
  %112 = bitcast double* %111 to i64*
  %113 = load i64, i64* %112, align 8
  %114 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %76, i64 %indvars.iv.next.2
  %115 = bitcast double* %114 to i64*
  store i64 %113, i64* %115, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv, 4
  %116 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %76, i64 %indvars.iv.next.3
  %117 = bitcast double* %116 to i64*
  %118 = load i64, i64* %117, align 8
  %119 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %76, i64 %indvars.iv.next.3
  %120 = bitcast double* %119 to i64*
  store i64 %118, i64* %120, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv, 5
  %exitcond46.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond46.4, label %._crit_edge.us.loopexit, label %._crit_edge86, !llvm.loop !19

._crit_edge.us.loopexit:                          ; preds = %._crit_edge86
  br label %._crit_edge.us

._crit_edge.us.loopexit46:                        ; preds = %vector.body17
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit46, %._crit_edge.us.loopexit
  %indvar.next = add nuw nsw i64 %indvar, 1
  %exitcond48 = icmp eq i64 %indvar.next, 2000
  %121 = add nsw i64 %76, 1
  br i1 %exitcond48, label %._crit_edge17, label %.preheader.us

._crit_edge17:                                    ; preds = %._crit_edge.us
  tail call void @free(i8* nonnull %17) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky([2000 x double]* nocapture) unnamed_addr #0 {
.preheader4.preheader:
  br label %.preheader4

.preheader4:                                      ; preds = %._crit_edge9, %.preheader4.preheader
  %indvars.iv8 = phi i2 [ %indvars.iv.next9, %._crit_edge9 ], [ 0, %.preheader4.preheader ]
  %indvars.iv34 = phi i64 [ 0, %.preheader4.preheader ], [ %indvars.iv.next35, %._crit_edge9 ]
  %1 = zext i2 %indvars.iv8 to i64
  %2 = add nsw i64 %indvars.iv34, -1
  %3 = icmp sgt i64 %indvars.iv34, 0
  br i1 %3, label %.preheader.preheader, label %._crit_edge9

.preheader.preheader:                             ; preds = %.preheader4
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv34, i64 0
  br label %.preheader

.lr.ph8:                                          ; preds = %._crit_edge
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv34, i64 %indvars.iv34
  %.pre2 = load double, double* %5, align 8
  %xtraiter3 = and i64 %indvars.iv34, 3
  %lcmp.mod4 = icmp eq i64 %xtraiter3, 0
  br i1 %lcmp.mod4, label %._crit_edge39.prol.loopexit, label %._crit_edge39.prol.preheader

._crit_edge39.prol.preheader:                     ; preds = %.lr.ph8
  br label %._crit_edge39.prol

._crit_edge39.prol:                               ; preds = %._crit_edge39.prol, %._crit_edge39.prol.preheader
  %6 = phi double [ %.pre2, %._crit_edge39.prol.preheader ], [ %10, %._crit_edge39.prol ]
  %indvars.iv26.prol = phi i64 [ 0, %._crit_edge39.prol.preheader ], [ %indvars.iv.next27.prol, %._crit_edge39.prol ]
  %prol.iter = phi i64 [ %xtraiter3, %._crit_edge39.prol.preheader ], [ %prol.iter.sub, %._crit_edge39.prol ]
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv34, i64 %indvars.iv26.prol
  %8 = load double, double* %7, align 8
  %9 = fmul double %8, %8
  %10 = fsub double %6, %9
  store double %10, double* %5, align 8
  %indvars.iv.next27.prol = add nuw nsw i64 %indvars.iv26.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %._crit_edge39.prol.loopexit.unr-lcssa, label %._crit_edge39.prol, !llvm.loop !20

._crit_edge39.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge39.prol
  br label %._crit_edge39.prol.loopexit

._crit_edge39.prol.loopexit:                      ; preds = %.lr.ph8, %._crit_edge39.prol.loopexit.unr-lcssa
  %.unr5 = phi double [ %.pre2, %.lr.ph8 ], [ %10, %._crit_edge39.prol.loopexit.unr-lcssa ]
  %indvars.iv26.unr = phi i64 [ 0, %.lr.ph8 ], [ %1, %._crit_edge39.prol.loopexit.unr-lcssa ]
  %11 = icmp ult i64 %2, 3
  br i1 %11, label %._crit_edge9.loopexit, label %.lr.ph8.new

.lr.ph8.new:                                      ; preds = %._crit_edge39.prol.loopexit
  br label %._crit_edge39

.preheader:                                       ; preds = %.preheader.preheader, %._crit_edge
  %indvars.iv18 = phi i64 [ %indvars.iv.next19, %._crit_edge ], [ 0, %.preheader.preheader ]
  %12 = icmp sgt i64 %indvars.iv18, 0
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv34, i64 %indvars.iv18
  %.pre = load double, double* %13, align 8
  br i1 %12, label %._crit_edge38.preheader, label %._crit_edge

._crit_edge38.preheader:                          ; preds = %.preheader
  %xtraiter = and i64 %indvars.iv18, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %._crit_edge38.prol.loopexit.unr-lcssa, label %._crit_edge38.prol.preheader

._crit_edge38.prol.preheader:                     ; preds = %._crit_edge38.preheader
  br label %._crit_edge38.prol

._crit_edge38.prol:                               ; preds = %._crit_edge38.prol.preheader
  %14 = load double, double* %4, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv18, i64 0
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fsub double %.pre, %17
  store double %18, double* %13, align 8
  br label %._crit_edge38.prol.loopexit.unr-lcssa

._crit_edge38.prol.loopexit.unr-lcssa:            ; preds = %._crit_edge38.preheader, %._crit_edge38.prol
  %.lcssa.unr.ph = phi double [ %18, %._crit_edge38.prol ], [ undef, %._crit_edge38.preheader ]
  %.unr.ph = phi double [ %18, %._crit_edge38.prol ], [ %.pre, %._crit_edge38.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge38.prol ], [ 0, %._crit_edge38.preheader ]
  br label %._crit_edge38.prol.loopexit

._crit_edge38.prol.loopexit:                      ; preds = %._crit_edge38.prol.loopexit.unr-lcssa
  %19 = icmp eq i64 %indvars.iv18, 1
  br i1 %19, label %._crit_edge.loopexit, label %._crit_edge38.preheader.new

._crit_edge38.preheader.new:                      ; preds = %._crit_edge38.prol.loopexit
  br label %._crit_edge38

._crit_edge38:                                    ; preds = %._crit_edge38, %._crit_edge38.preheader.new
  %20 = phi double [ %.unr.ph, %._crit_edge38.preheader.new ], [ %32, %._crit_edge38 ]
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %._crit_edge38.preheader.new ], [ %indvars.iv.next.1, %._crit_edge38 ]
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv34, i64 %indvars.iv
  %22 = load double, double* %21, align 8
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv18, i64 %indvars.iv
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = fsub double %20, %25
  store double %26, double* %13, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv34, i64 %indvars.iv.next
  %28 = load double, double* %27, align 8
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv18, i64 %indvars.iv.next
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = fsub double %26, %31
  store double %32, double* %13, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond17.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv18
  br i1 %exitcond17.1, label %._crit_edge.loopexit.unr-lcssa, label %._crit_edge38

._crit_edge.loopexit.unr-lcssa:                   ; preds = %._crit_edge38
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge38.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %._crit_edge38.prol.loopexit ], [ %32, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader
  %33 = phi double [ %.pre, %.preheader ], [ %.lcssa, %._crit_edge.loopexit ]
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv18, i64 %indvars.iv18
  %35 = load double, double* %34, align 8
  %36 = fdiv double %33, %35
  store double %36, double* %13, align 8
  %indvars.iv.next19 = add nuw nsw i64 %indvars.iv18, 1
  %exitcond25 = icmp eq i64 %indvars.iv.next19, %indvars.iv34
  br i1 %exitcond25, label %.lr.ph8, label %.preheader

._crit_edge39:                                    ; preds = %._crit_edge39, %.lr.ph8.new
  %37 = phi double [ %.unr5, %.lr.ph8.new ], [ %53, %._crit_edge39 ]
  %indvars.iv26 = phi i64 [ %indvars.iv26.unr, %.lr.ph8.new ], [ %indvars.iv.next27.3, %._crit_edge39 ]
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv34, i64 %indvars.iv26
  %39 = load double, double* %38, align 8
  %40 = fmul double %39, %39
  %41 = fsub double %37, %40
  store double %41, double* %5, align 8
  %indvars.iv.next27 = add nuw nsw i64 %indvars.iv26, 1
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv34, i64 %indvars.iv.next27
  %43 = load double, double* %42, align 8
  %44 = fmul double %43, %43
  %45 = fsub double %41, %44
  store double %45, double* %5, align 8
  %indvars.iv.next27.1 = add nsw i64 %indvars.iv26, 2
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv34, i64 %indvars.iv.next27.1
  %47 = load double, double* %46, align 8
  %48 = fmul double %47, %47
  %49 = fsub double %45, %48
  store double %49, double* %5, align 8
  %indvars.iv.next27.2 = add nsw i64 %indvars.iv26, 3
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv34, i64 %indvars.iv.next27.2
  %51 = load double, double* %50, align 8
  %52 = fmul double %51, %51
  %53 = fsub double %49, %52
  store double %53, double* %5, align 8
  %indvars.iv.next27.3 = add nuw nsw i64 %indvars.iv26, 4
  %exitcond33.3 = icmp eq i64 %indvars.iv.next27.3, %indvars.iv34
  br i1 %exitcond33.3, label %._crit_edge9.loopexit.unr-lcssa, label %._crit_edge39

._crit_edge9.loopexit.unr-lcssa:                  ; preds = %._crit_edge39
  br label %._crit_edge9.loopexit

._crit_edge9.loopexit:                            ; preds = %._crit_edge39.prol.loopexit, %._crit_edge9.loopexit.unr-lcssa
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %.preheader4
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv34, i64 %indvars.iv34
  %55 = load double, double* %54, align 8
  %56 = tail call double @sqrt(double %55) #3
  store double %56, double* %54, align 8
  %indvars.iv.next35 = add nuw nsw i64 %indvars.iv34, 1
  %exitcond37 = icmp eq i64 %indvars.iv.next35, 2000
  %indvars.iv.next9 = add i2 %indvars.iv8, 1
  br i1 %exitcond37, label %._crit_edge11, label %.preheader4

._crit_edge11:                                    ; preds = %._crit_edge9
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #5
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge, %.preheader.preheader
  %indvars.iv13 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next14, %._crit_edge ]
  %indvars.iv11 = phi i64 [ 1, %.preheader.preheader ], [ %indvars.iv.next12, %._crit_edge ]
  %5 = mul nuw nsw i64 %indvars.iv13, 2000
  br label %._crit_edge18

._crit_edge18:                                    ; preds = %._crit_edge17, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge17 ]
  %6 = add nuw nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge17

; <label>:10:                                     ; preds = %._crit_edge18
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #5
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge18, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv13, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next, %indvars.iv11
  br i1 %exitcond10, label %._crit_edge, label %._crit_edge18

._crit_edge:                                      ; preds = %._crit_edge17
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next14, 2000
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  br i1 %exitcond16, label %._crit_edge4, label %.lr.ph

._crit_edge4:                                     ; preds = %._crit_edge
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #5
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #2

; Function Attrs: nounwind
declare double @sqrt(double) local_unnamed_addr #2

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #3

; Function Attrs: argmemonly nounwind
declare void @llvm.memset.p0i8.i64(i8* nocapture writeonly, i8, i64, i32, i1) #4

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind }
attributes #4 = { argmemonly nounwind }
attributes #5 = { cold }
attributes #6 = { cold nounwind }

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
!20 = distinct !{!20, !21}
!21 = !{!"llvm.loop.unroll.disable"}
