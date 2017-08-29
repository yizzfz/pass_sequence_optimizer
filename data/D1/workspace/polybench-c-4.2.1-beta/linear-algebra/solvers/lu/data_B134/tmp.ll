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
  br label %.lr.ph94

.lr.ph94:                                         ; preds = %._crit_edge96.thread, %.preheader72.lr.ph
  %indvars.iv130 = phi i64 [ 0, %.preheader72.lr.ph ], [ %indvars.iv.next131, %._crit_edge96.thread ]
  %1 = sub i64 1998, %indvars.iv130
  %2 = shl i64 %1, 3
  %3 = and i64 %2, 34359738360
  br label %._crit_edge

.preheader71:                                     ; preds = %._crit_edge
  %indvars.iv.next131 = add nuw nsw i64 %indvars.iv130, 1
  %4 = icmp slt i64 %indvars.iv.next131, 2000
  br i1 %4, label %._crit_edge96.thread, label %.preheader70.us.preheader

._crit_edge96.thread:                             ; preds = %.preheader71
  %5 = add nuw nsw i64 %3, 8
  %scevgep128 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv130, i64 %indvars.iv.next131
  %scevgep128129 = bitcast double* %scevgep128 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep128129, i8 0, i64 %5, i32 8, i1 false)
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv130, i64 %indvars.iv130
  store double 1.000000e+00, double* %6, align 8
  br label %.lr.ph94

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph94
  %indvars.iv118 = phi i64 [ 0, %.lr.ph94 ], [ %indvars.iv.next119, %._crit_edge ]
  %7 = sub nsw i64 0, %indvars.iv118
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 2000
  %10 = sitofp i32 %9 to double
  %11 = fdiv double %10, 2.000000e+03
  %12 = fadd double %11, 1.000000e+00
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv130, i64 %indvars.iv118
  store double %12, double* %13, align 8
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  %exitcond122 = icmp eq i64 %indvars.iv118, %indvars.iv130
  br i1 %exitcond122, label %.preheader71, label %._crit_edge

.preheader70.us.preheader:                        ; preds = %.preheader71
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv130, i64 %indvars.iv130
  store double 1.000000e+00, double* %14, align 8
  %15 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge91.us

._crit_edge91.us:                                 ; preds = %._crit_edge91.us, %.preheader70.us.preheader
  %indvars.iv116 = phi i64 [ 0, %.preheader70.us.preheader ], [ %indvars.iv.next117.7, %._crit_edge91.us ]
  %16 = mul nuw nsw i64 %indvars.iv116, 16000
  %scevgep = getelementptr i8, i8* %15, i64 %16
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117 = or i64 %indvars.iv116, 1
  %17 = mul nuw nsw i64 %indvars.iv.next117, 16000
  %scevgep.1 = getelementptr i8, i8* %15, i64 %17
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.1 = or i64 %indvars.iv116, 2
  %18 = mul nuw nsw i64 %indvars.iv.next117.1, 16000
  %scevgep.2 = getelementptr i8, i8* %15, i64 %18
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.2 = or i64 %indvars.iv116, 3
  %19 = mul nuw nsw i64 %indvars.iv.next117.2, 16000
  %scevgep.3 = getelementptr i8, i8* %15, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.3 = or i64 %indvars.iv116, 4
  %20 = mul nuw nsw i64 %indvars.iv.next117.3, 16000
  %scevgep.4 = getelementptr i8, i8* %15, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.4 = or i64 %indvars.iv116, 5
  %21 = mul nuw nsw i64 %indvars.iv.next117.4, 16000
  %scevgep.5 = getelementptr i8, i8* %15, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.5 = or i64 %indvars.iv116, 6
  %22 = mul nuw nsw i64 %indvars.iv.next117.5, 16000
  %scevgep.6 = getelementptr i8, i8* %15, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.6 = or i64 %indvars.iv116, 7
  %23 = mul nuw nsw i64 %indvars.iv.next117.6, 16000
  %scevgep.7 = getelementptr i8, i8* %15, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.7 = add nsw i64 %indvars.iv116, 8
  %exitcond47.7 = icmp eq i64 %indvars.iv.next117.7, 2000
  br i1 %exitcond47.7, label %.preheader67.us.us.preheader.preheader, label %._crit_edge91.us

.preheader67.us.us.preheader.preheader:           ; preds = %._crit_edge91.us
  %24 = bitcast i8* %15 to [2000 x [2000 x double]]*
  %25 = bitcast i8* %15 to [2000 x [2000 x double]]*
  %26 = bitcast i8* %15 to [2000 x [2000 x double]]*
  br label %.preheader67.us.us.preheader

.preheader67.us.us.preheader:                     ; preds = %._crit_edge80.us, %.preheader67.us.us.preheader.preheader
  %indvars.iv111 = phi i64 [ %indvars.iv.next112, %._crit_edge80.us ], [ 0, %.preheader67.us.us.preheader.preheader ]
  %scevgep3 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv111
  %27 = add nuw nsw i64 %indvars.iv111, 1
  %scevgep5 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %27
  %28 = bitcast double* %scevgep5 to i8*
  %29 = bitcast double* %scevgep3 to i8*
  br label %.preheader67.us.us

._crit_edge80.us:                                 ; preds = %._crit_edge78.us.us
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv111, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next112, 2000
  br i1 %exitcond46, label %.preheader.us.preheader, label %.preheader67.us.us.preheader

.preheader.us.preheader:                          ; preds = %._crit_edge80.us
  %30 = bitcast i8* %15 to [2000 x [2000 x double]]*
  %31 = bitcast i8* %15 to [2000 x [2000 x double]]*
  %32 = bitcast i8* %15 to [2000 x [2000 x double]]*
  %33 = bitcast i8* %15 to [2000 x [2000 x double]]*
  %34 = bitcast i8* %15 to [2000 x [2000 x double]]*
  %35 = bitcast i8* %15 to [2000 x [2000 x double]]*
  %36 = bitcast i8* %15 to [2000 x [2000 x double]]*
  br label %.preheader.us

.preheader67.us.us:                               ; preds = %._crit_edge78.us.us, %.preheader67.us.us.preheader
  %indvars.iv109 = phi i64 [ 0, %.preheader67.us.us.preheader ], [ %indvars.iv.next110, %._crit_edge78.us.us ]
  %37 = mul nuw nsw i64 %indvars.iv109, 16000
  %scevgep1 = getelementptr i8, i8* %15, i64 %37
  %38 = add nuw nsw i64 %37, 16000
  %scevgep2 = getelementptr i8, i8* %15, i64 %38
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv109, i64 %indvars.iv111
  %bound0 = icmp ult i8* %scevgep1, %28
  %bound1 = icmp ult i8* %29, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %39 to i8*
  %bc7 = bitcast double* %39 to i8*
  %bound08 = icmp ult i8* %scevgep1, %bc7
  %bound19 = icmp ult i8* %bc, %scevgep2
  %found.conflict10 = and i1 %bound08, %bound19
  %conflict.rdx = or i1 %found.conflict, %found.conflict10
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader67.us.us
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader67.us.us
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %40 = or i64 %index, 1
  %41 = or i64 %index, 2
  %42 = or i64 %index, 3
  %43 = load double, double* %39, align 8, !alias.scope !1
  %44 = insertelement <2 x double> undef, double %43, i32 0
  %45 = shufflevector <2 x double> %44, <2 x double> undef, <2 x i32> zeroinitializer
  %46 = insertelement <2 x double> undef, double %43, i32 0
  %47 = shufflevector <2 x double> %46, <2 x double> undef, <2 x i32> zeroinitializer
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv111
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %40, i64 %indvars.iv111
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %41, i64 %indvars.iv111
  %51 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %42, i64 %indvars.iv111
  %52 = load double, double* %48, align 8, !alias.scope !4
  %53 = load double, double* %49, align 8, !alias.scope !4
  %54 = load double, double* %50, align 8, !alias.scope !4
  %55 = load double, double* %51, align 8, !alias.scope !4
  %56 = insertelement <2 x double> undef, double %52, i32 0
  %57 = insertelement <2 x double> %56, double %53, i32 1
  %58 = insertelement <2 x double> undef, double %54, i32 0
  %59 = insertelement <2 x double> %58, double %55, i32 1
  %60 = fmul <2 x double> %45, %57
  %61 = fmul <2 x double> %47, %59
  %62 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv109, i64 %index
  %63 = bitcast double* %62 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %63, align 8, !alias.scope !6, !noalias !8
  %64 = getelementptr double, double* %62, i64 2
  %65 = bitcast double* %64 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %65, align 8, !alias.scope !6, !noalias !8
  %66 = fadd <2 x double> %wide.load, %60
  %67 = fadd <2 x double> %wide.load12, %61
  %68 = bitcast double* %62 to <2 x double>*
  store <2 x double> %66, <2 x double>* %68, align 8, !alias.scope !6, !noalias !8
  %69 = bitcast double* %64 to <2 x double>*
  store <2 x double> %67, <2 x double>* %69, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %70 = icmp eq i64 %index.next, 2000
  br i1 %70, label %._crit_edge78.us.us.loopexit49, label %vector.body, !llvm.loop !9

._crit_edge78.us.us.loopexit:                     ; preds = %scalar.ph
  br label %._crit_edge78.us.us

._crit_edge78.us.us.loopexit49:                   ; preds = %vector.body
  br label %._crit_edge78.us.us

._crit_edge78.us.us:                              ; preds = %._crit_edge78.us.us.loopexit49, %._crit_edge78.us.us.loopexit
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv109, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next110, 2000
  br i1 %exitcond45, label %._crit_edge80.us, label %.preheader67.us.us

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv106 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next107.1, %scalar.ph ]
  %71 = load double, double* %39, align 8
  %72 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv106, i64 %indvars.iv111
  %73 = load double, double* %72, align 8
  %74 = fmul double %71, %73
  %75 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %24, i64 0, i64 %indvars.iv109, i64 %indvars.iv106
  %76 = load double, double* %75, align 8
  %77 = fadd double %76, %74
  store double %77, double* %75, align 8
  %indvars.iv.next107 = or i64 %indvars.iv106, 1
  %78 = load double, double* %39, align 8
  %79 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next107, i64 %indvars.iv111
  %80 = load double, double* %79, align 8
  %81 = fmul double %78, %80
  %82 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv109, i64 %indvars.iv.next107
  %83 = load double, double* %82, align 8
  %84 = fadd double %83, %81
  store double %84, double* %82, align 8
  %indvars.iv.next107.1 = add nsw i64 %indvars.iv106, 2
  %exitcond108.1 = icmp eq i64 %indvars.iv.next107, 1999
  br i1 %exitcond108.1, label %._crit_edge78.us.us.loopexit, label %scalar.ph, !llvm.loop !12

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv104 = phi i64 [ %indvars.iv.next105, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep18 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv104, i64 0
  %scevgep1819 = bitcast double* %scevgep18 to i8*
  %85 = add nuw nsw i64 %indvars.iv104, 1
  %scevgep20 = getelementptr [2000 x double], [2000 x double]* %0, i64 %85, i64 0
  %scevgep2021 = bitcast double* %scevgep20 to i8*
  %86 = mul nuw nsw i64 %indvars.iv104, 16000
  %scevgep22 = getelementptr i8, i8* %15, i64 %86
  %87 = add nuw nsw i64 %86, 16000
  %scevgep23 = getelementptr i8, i8* %15, i64 %87
  %bound024 = icmp ult i8* %scevgep1819, %scevgep23
  %bound125 = icmp ult i8* %scevgep22, %scevgep2021
  %memcheck.conflict27 = and i1 %bound024, %bound125
  br i1 %memcheck.conflict27, label %scalar.ph15.preheader, label %vector.body13.preheader

vector.body13.preheader:                          ; preds = %.preheader.us
  br label %vector.body13

scalar.ph15.preheader:                            ; preds = %.preheader.us
  br label %scalar.ph15

vector.body13:                                    ; preds = %vector.body13, %vector.body13.preheader
  %index30 = phi i64 [ 0, %vector.body13.preheader ], [ %index.next31.1, %vector.body13 ]
  %88 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %indvars.iv104, i64 %index30
  %89 = bitcast double* %88 to <2 x i64>*
  %wide.load38 = load <2 x i64>, <2 x i64>* %89, align 8, !alias.scope !13
  %90 = getelementptr double, double* %88, i64 2
  %91 = bitcast double* %90 to <2 x i64>*
  %wide.load39 = load <2 x i64>, <2 x i64>* %91, align 8, !alias.scope !13
  %92 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv104, i64 %index30
  %93 = bitcast double* %92 to <2 x i64>*
  store <2 x i64> %wide.load38, <2 x i64>* %93, align 8, !alias.scope !16, !noalias !13
  %94 = getelementptr double, double* %92, i64 2
  %95 = bitcast double* %94 to <2 x i64>*
  store <2 x i64> %wide.load39, <2 x i64>* %95, align 8, !alias.scope !16, !noalias !13
  %index.next31 = or i64 %index30, 4
  %96 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv104, i64 %index.next31
  %97 = bitcast double* %96 to <2 x i64>*
  %wide.load38.1 = load <2 x i64>, <2 x i64>* %97, align 8, !alias.scope !13
  %98 = getelementptr double, double* %96, i64 2
  %99 = bitcast double* %98 to <2 x i64>*
  %wide.load39.1 = load <2 x i64>, <2 x i64>* %99, align 8, !alias.scope !13
  %100 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv104, i64 %index.next31
  %101 = bitcast double* %100 to <2 x i64>*
  store <2 x i64> %wide.load38.1, <2 x i64>* %101, align 8, !alias.scope !16, !noalias !13
  %102 = getelementptr double, double* %100, i64 2
  %103 = bitcast double* %102 to <2 x i64>*
  store <2 x i64> %wide.load39.1, <2 x i64>* %103, align 8, !alias.scope !16, !noalias !13
  %index.next31.1 = add nsw i64 %index30, 8
  %104 = icmp eq i64 %index.next31.1, 2000
  br i1 %104, label %._crit_edge.us.loopexit48, label %vector.body13, !llvm.loop !18

scalar.ph15:                                      ; preds = %scalar.ph15, %scalar.ph15.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph15.preheader ], [ %indvars.iv.next.4, %scalar.ph15 ]
  %105 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %30, i64 0, i64 %indvars.iv104, i64 %indvars.iv
  %106 = bitcast double* %105 to i64*
  %107 = load i64, i64* %106, align 8
  %108 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv104, i64 %indvars.iv
  %109 = bitcast double* %108 to i64*
  store i64 %107, i64* %109, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %110 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %31, i64 0, i64 %indvars.iv104, i64 %indvars.iv.next
  %111 = bitcast double* %110 to i64*
  %112 = load i64, i64* %111, align 8
  %113 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv104, i64 %indvars.iv.next
  %114 = bitcast double* %113 to i64*
  store i64 %112, i64* %114, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %115 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %32, i64 0, i64 %indvars.iv104, i64 %indvars.iv.next.1
  %116 = bitcast double* %115 to i64*
  %117 = load i64, i64* %116, align 8
  %118 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv104, i64 %indvars.iv.next.1
  %119 = bitcast double* %118 to i64*
  store i64 %117, i64* %119, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %120 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %33, i64 0, i64 %indvars.iv104, i64 %indvars.iv.next.2
  %121 = bitcast double* %120 to i64*
  %122 = load i64, i64* %121, align 8
  %123 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv104, i64 %indvars.iv.next.2
  %124 = bitcast double* %123 to i64*
  store i64 %122, i64* %124, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %125 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %34, i64 0, i64 %indvars.iv104, i64 %indvars.iv.next.3
  %126 = bitcast double* %125 to i64*
  %127 = load i64, i64* %126, align 8
  %128 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv104, i64 %indvars.iv.next.3
  %129 = bitcast double* %128 to i64*
  store i64 %127, i64* %129, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  br i1 %exitcond.4, label %._crit_edge.us.loopexit, label %scalar.ph15, !llvm.loop !19

._crit_edge.us.loopexit:                          ; preds = %scalar.ph15
  br label %._crit_edge.us

._crit_edge.us.loopexit48:                        ; preds = %vector.body13
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit48, %._crit_edge.us.loopexit
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next105, 2000
  br i1 %exitcond44, label %._crit_edge75, label %.preheader.us

._crit_edge75:                                    ; preds = %._crit_edge.us
  tail call void @free(i8* nonnull %15) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]* nocapture) unnamed_addr #2 {
.preheader43.preheader:
  br label %.preheader43

.preheader43:                                     ; preds = %._crit_edge50, %.preheader43.preheader
  %indvars.iv3 = phi i64 [ %indvars.iv.next4, %._crit_edge50 ], [ 0, %.preheader43.preheader ]
  %indvars.iv68 = phi i32 [ %indvars.iv.next69, %._crit_edge50 ], [ -1, %.preheader43.preheader ]
  %1 = add i64 %indvars.iv3, 4294967295
  %2 = and i64 %1, 4294967295
  %3 = icmp sgt i64 %indvars.iv3, 0
  br i1 %3, label %.preheader41.preheader, label %._crit_edge50

.preheader41.preheader:                           ; preds = %.preheader43
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 0
  br label %.preheader41

.preheader.us.preheader:                          ; preds = %._crit_edge
  %wide.trip.count70 = zext i32 %indvars.iv68 to i64
  %5 = and i64 %1, 1
  %lcmp.mod9 = icmp eq i64 %5, 0
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 0
  %7 = icmp eq i64 %2, 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge48.us, %.preheader.us.preheader
  %indvars.iv74 = phi i64 [ %indvars.iv3, %.preheader.us.preheader ], [ %indvars.iv.next75, %._crit_edge48.us ]
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv74
  %.pre60 = load double, double* %8, align 8
  br i1 %lcmp.mod9, label %._crit_edge1.prol.preheader, label %._crit_edge1.prol.loopexit.unr-lcssa

._crit_edge1.prol.preheader:                      ; preds = %.preheader.us
  br label %._crit_edge1.prol

._crit_edge1.prol:                                ; preds = %._crit_edge1.prol.preheader
  %9 = load double, double* %6, align 8
  %10 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv74
  %11 = load double, double* %10, align 8
  %12 = fmul double %9, %11
  %13 = fsub double %.pre60, %12
  store double %13, double* %8, align 8
  br label %._crit_edge1.prol.loopexit.unr-lcssa

._crit_edge1.prol.loopexit.unr-lcssa:             ; preds = %.preheader.us, %._crit_edge1.prol
  %indvars.iv66.unr.ph = phi i64 [ 1, %._crit_edge1.prol ], [ 0, %.preheader.us ]
  %.unr10.ph = phi double [ %13, %._crit_edge1.prol ], [ %.pre60, %.preheader.us ]
  br label %._crit_edge1.prol.loopexit

._crit_edge1.prol.loopexit:                       ; preds = %._crit_edge1.prol.loopexit.unr-lcssa
  br i1 %7, label %._crit_edge48.us, label %.preheader.us.new

.preheader.us.new:                                ; preds = %._crit_edge1.prol.loopexit
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1, %.preheader.us.new
  %indvars.iv66 = phi i64 [ %indvars.iv66.unr.ph, %.preheader.us.new ], [ %indvars.iv.next67.1, %._crit_edge1 ]
  %14 = phi double [ %.unr10.ph, %.preheader.us.new ], [ %26, %._crit_edge1 ]
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv66
  %16 = load double, double* %15, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv66, i64 %indvars.iv74
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fsub double %14, %19
  store double %20, double* %8, align 8
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv.next67
  %22 = load double, double* %21, align 8
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next67, i64 %indvars.iv74
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = fsub double %20, %25
  store double %26, double* %8, align 8
  %indvars.iv.next67.1 = add nsw i64 %indvars.iv66, 2
  %exitcond71.1 = icmp eq i64 %indvars.iv.next67, %wide.trip.count70
  br i1 %exitcond71.1, label %._crit_edge48.us.unr-lcssa, label %._crit_edge1

._crit_edge48.us.unr-lcssa:                       ; preds = %._crit_edge1
  br label %._crit_edge48.us

._crit_edge48.us:                                 ; preds = %._crit_edge1.prol.loopexit, %._crit_edge48.us.unr-lcssa
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond6 = icmp eq i64 %indvars.iv.next75, 2000
  br i1 %exitcond6, label %._crit_edge50.loopexit, label %.preheader.us

.preheader41:                                     ; preds = %._crit_edge, %.preheader41.preheader
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %._crit_edge ], [ 0, %.preheader41.preheader ]
  %indvars.iv61 = phi i32 [ %indvars.iv.next62, %._crit_edge ], [ -1, %.preheader41.preheader ]
  %27 = add i64 %indvars.iv63, 4294967295
  %28 = and i64 %27, 4294967295
  %29 = icmp sgt i64 %indvars.iv63, 0
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv63
  %.pre = load double, double* %30, align 8
  br i1 %29, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader41
  %wide.trip.count = zext i32 %indvars.iv61 to i64
  %31 = and i64 %27, 1
  %lcmp.mod = icmp eq i64 %31, 0
  br i1 %lcmp.mod, label %._crit_edge2.prol.preheader, label %._crit_edge2.prol.loopexit.unr-lcssa

._crit_edge2.prol.preheader:                      ; preds = %.lr.ph
  br label %._crit_edge2.prol

._crit_edge2.prol:                                ; preds = %._crit_edge2.prol.preheader
  %32 = load double, double* %4, align 8
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv63
  %34 = load double, double* %33, align 8
  %35 = fmul double %32, %34
  %36 = fsub double %.pre, %35
  store double %36, double* %30, align 8
  br label %._crit_edge2.prol.loopexit.unr-lcssa

._crit_edge2.prol.loopexit.unr-lcssa:             ; preds = %.lr.ph, %._crit_edge2.prol
  %.lcssa.unr.ph = phi double [ %36, %._crit_edge2.prol ], [ undef, %.lr.ph ]
  %indvars.iv.unr.ph = phi i64 [ 1, %._crit_edge2.prol ], [ 0, %.lr.ph ]
  %.unr.ph = phi double [ %36, %._crit_edge2.prol ], [ %.pre, %.lr.ph ]
  br label %._crit_edge2.prol.loopexit

._crit_edge2.prol.loopexit:                       ; preds = %._crit_edge2.prol.loopexit.unr-lcssa
  %37 = icmp eq i64 %28, 0
  br i1 %37, label %._crit_edge.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %._crit_edge2.prol.loopexit
  br label %._crit_edge2

._crit_edge2:                                     ; preds = %._crit_edge2, %.lr.ph.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %._crit_edge2 ]
  %38 = phi double [ %.unr.ph, %.lr.ph.new ], [ %50, %._crit_edge2 ]
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv
  %40 = load double, double* %39, align 8
  %41 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv63
  %42 = load double, double* %41, align 8
  %43 = fmul double %40, %42
  %44 = fsub double %38, %43
  store double %44, double* %30, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv.next
  %46 = load double, double* %45, align 8
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv63
  %48 = load double, double* %47, align 8
  %49 = fmul double %46, %48
  %50 = fsub double %44, %49
  store double %50, double* %30, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond.1, label %._crit_edge.loopexit.unr-lcssa, label %._crit_edge2

._crit_edge.loopexit.unr-lcssa:                   ; preds = %._crit_edge2
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %._crit_edge2.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %._crit_edge2.prol.loopexit ], [ %50, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader41
  %51 = phi double [ %.pre, %.preheader41 ], [ %.lcssa, %._crit_edge.loopexit ]
  %52 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv63, i64 %indvars.iv63
  %53 = load double, double* %52, align 8
  %54 = fdiv double %51, %53
  store double %54, double* %30, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %indvars.iv.next62 = add nsw i32 %indvars.iv61, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next64, %indvars.iv3
  br i1 %exitcond5, label %.preheader.us.preheader, label %.preheader41

._crit_edge50.loopexit:                           ; preds = %._crit_edge48.us
  br label %._crit_edge50

._crit_edge50:                                    ; preds = %._crit_edge50.loopexit, %.preheader43
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %indvars.iv.next69 = add nsw i32 %indvars.iv68, 1
  %exitcond7 = icmp eq i64 %indvars.iv.next4, 2000
  br i1 %exitcond7, label %._crit_edge54, label %.preheader43

._crit_edge54:                                    ; preds = %._crit_edge50
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

.preheader.us:                                    ; preds = %._crit_edge12.us, %.preheader.us.preheader
  %indvars.iv15 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next16, %._crit_edge12.us ]
  %5 = mul nuw nsw i64 %indvars.iv15, 2000
  br label %._crit_edge.us._crit_edge

._crit_edge.us._crit_edge:                        ; preds = %._crit_edge.us, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %6 = add nuw nsw i64 %indvars.iv, %5
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 20
  %9 = icmp eq i32 %8, 0
  br i1 %9, label %10, label %._crit_edge.us

; <label>:10:                                     ; preds = %._crit_edge.us._crit_edge
  %11 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %11) #6
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us._crit_edge, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv15, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge12.us, label %._crit_edge.us._crit_edge

._crit_edge12.us:                                 ; preds = %._crit_edge.us
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next16, 2000
  br i1 %exitcond1, label %._crit_edge14, label %.preheader.us

._crit_edge14:                                    ; preds = %._crit_edge12.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #6
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
