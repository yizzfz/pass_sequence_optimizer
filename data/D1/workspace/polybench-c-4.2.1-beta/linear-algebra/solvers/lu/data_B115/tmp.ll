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
  br label %7

.preheader71:                                     ; preds = %7
  %indvars.iv.next131 = add nuw nsw i64 %indvars.iv130, 1
  %2 = icmp slt i64 %indvars.iv.next131, 2000
  br i1 %2, label %._crit_edge96.thread, label %.preheader70.us.preheader

._crit_edge96.thread:                             ; preds = %.preheader71
  %3 = shl i64 %1, 3
  %4 = and i64 %3, 34359738360
  %5 = add nuw nsw i64 %4, 8
  %scevgep128 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv130, i64 %indvars.iv.next131
  %scevgep128129 = bitcast double* %scevgep128 to i8*
  call void @llvm.memset.p0i8.i64(i8* %scevgep128129, i8 0, i64 %5, i32 8, i1 false)
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv130, i64 %indvars.iv130
  store double 1.000000e+00, double* %6, align 8
  br label %.lr.ph94

; <label>:7:                                      ; preds = %7, %.lr.ph94
  %indvars.iv118 = phi i64 [ 0, %.lr.ph94 ], [ %indvars.iv.next119, %7 ]
  %8 = sub nsw i64 0, %indvars.iv118
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 2000
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 2.000000e+03
  %13 = fadd double %12, 1.000000e+00
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv130, i64 %indvars.iv118
  store double %13, double* %14, align 8
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  %exitcond122 = icmp eq i64 %indvars.iv118, %indvars.iv130
  br i1 %exitcond122, label %.preheader71, label %7

.preheader70.us.preheader:                        ; preds = %.preheader71
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv130, i64 %indvars.iv130
  store double 1.000000e+00, double* %15, align 8
  %16 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge91.us

._crit_edge91.us:                                 ; preds = %._crit_edge91.us, %.preheader70.us.preheader
  %indvars.iv116 = phi i64 [ 0, %.preheader70.us.preheader ], [ %indvars.iv.next117.7, %._crit_edge91.us ]
  %17 = mul nuw nsw i64 %indvars.iv116, 16000
  %scevgep = getelementptr i8, i8* %16, i64 %17
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117 = or i64 %indvars.iv116, 1
  %18 = mul nuw nsw i64 %indvars.iv.next117, 16000
  %scevgep.1 = getelementptr i8, i8* %16, i64 %18
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.1 = or i64 %indvars.iv116, 2
  %19 = mul nuw nsw i64 %indvars.iv.next117.1, 16000
  %scevgep.2 = getelementptr i8, i8* %16, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.2 = or i64 %indvars.iv116, 3
  %20 = mul nuw nsw i64 %indvars.iv.next117.2, 16000
  %scevgep.3 = getelementptr i8, i8* %16, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.3 = or i64 %indvars.iv116, 4
  %21 = mul nuw nsw i64 %indvars.iv.next117.3, 16000
  %scevgep.4 = getelementptr i8, i8* %16, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.4 = or i64 %indvars.iv116, 5
  %22 = mul nuw nsw i64 %indvars.iv.next117.4, 16000
  %scevgep.5 = getelementptr i8, i8* %16, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.5 = or i64 %indvars.iv116, 6
  %23 = mul nuw nsw i64 %indvars.iv.next117.5, 16000
  %scevgep.6 = getelementptr i8, i8* %16, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.6 = or i64 %indvars.iv116, 7
  %24 = mul nuw nsw i64 %indvars.iv.next117.6, 16000
  %scevgep.7 = getelementptr i8, i8* %16, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next117.7 = add nsw i64 %indvars.iv116, 8
  %exitcond135.7 = icmp eq i64 %indvars.iv.next117.7, 2000
  br i1 %exitcond135.7, label %.preheader67.us.us.preheader.preheader, label %._crit_edge91.us

.preheader67.us.us.preheader.preheader:           ; preds = %._crit_edge91.us
  %25 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %26 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %27 = bitcast i8* %16 to [2000 x [2000 x double]]*
  br label %.preheader67.us.us.preheader

.preheader67.us.us.preheader:                     ; preds = %.preheader67.us.us.preheader.preheader, %._crit_edge80.us
  %indvars.iv111 = phi i64 [ %28, %._crit_edge80.us ], [ 0, %.preheader67.us.us.preheader.preheader ]
  %scevgep3 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv111
  %28 = add nuw nsw i64 %indvars.iv111, 1
  %scevgep5 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %28
  %29 = bitcast double* %scevgep5 to i8*
  %30 = bitcast double* %scevgep3 to i8*
  br label %.preheader67.us.us

._crit_edge80.us:                                 ; preds = %._crit_edge78.us.us
  %exitcond134 = icmp eq i64 %28, 2000
  br i1 %exitcond134, label %.preheader.us.preheader, label %.preheader67.us.us.preheader

.preheader.us.preheader:                          ; preds = %._crit_edge80.us
  %31 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %32 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %33 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %34 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %35 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %36 = bitcast i8* %16 to [2000 x [2000 x double]]*
  %37 = bitcast i8* %16 to [2000 x [2000 x double]]*
  br label %.preheader.us

.preheader67.us.us:                               ; preds = %._crit_edge78.us.us, %.preheader67.us.us.preheader
  %indvars.iv109 = phi i64 [ 0, %.preheader67.us.us.preheader ], [ %indvars.iv.next110, %._crit_edge78.us.us ]
  %38 = mul nuw nsw i64 %indvars.iv109, 16000
  %scevgep1 = getelementptr i8, i8* %16, i64 %38
  %39 = add nuw nsw i64 %38, 16000
  %scevgep2 = getelementptr i8, i8* %16, i64 %39
  %40 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv109, i64 %indvars.iv111
  %bound0 = icmp ult i8* %scevgep1, %29
  %bound1 = icmp ult i8* %30, %scevgep2
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %40 to i8*
  %bound08 = icmp ult i8* %scevgep1, %bc
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
  %41 = or i64 %index, 1
  %42 = or i64 %index, 2
  %43 = or i64 %index, 3
  %44 = load double, double* %40, align 8, !alias.scope !1
  %45 = insertelement <2 x double> undef, double %44, i32 0
  %46 = shufflevector <2 x double> %45, <2 x double> undef, <2 x i32> zeroinitializer
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv111
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %41, i64 %indvars.iv111
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %42, i64 %indvars.iv111
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %43, i64 %indvars.iv111
  %51 = load double, double* %47, align 8, !alias.scope !4
  %52 = load double, double* %48, align 8, !alias.scope !4
  %53 = load double, double* %49, align 8, !alias.scope !4
  %54 = load double, double* %50, align 8, !alias.scope !4
  %55 = insertelement <2 x double> undef, double %51, i32 0
  %56 = insertelement <2 x double> %55, double %52, i32 1
  %57 = insertelement <2 x double> undef, double %53, i32 0
  %58 = insertelement <2 x double> %57, double %54, i32 1
  %59 = fmul <2 x double> %46, %56
  %60 = fmul <2 x double> %46, %58
  %61 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv109, i64 %index
  %62 = bitcast double* %61 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %62, align 8, !alias.scope !6, !noalias !8
  %63 = getelementptr double, double* %61, i64 2
  %64 = bitcast double* %63 to <2 x double>*
  %wide.load12 = load <2 x double>, <2 x double>* %64, align 8, !alias.scope !6, !noalias !8
  %65 = fadd <2 x double> %wide.load, %59
  %66 = fadd <2 x double> %wide.load12, %60
  store <2 x double> %65, <2 x double>* %62, align 8, !alias.scope !6, !noalias !8
  store <2 x double> %66, <2 x double>* %64, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %67 = icmp eq i64 %index.next, 2000
  br i1 %67, label %._crit_edge78.us.us.loopexit43, label %vector.body, !llvm.loop !9

._crit_edge78.us.us.loopexit:                     ; preds = %scalar.ph
  br label %._crit_edge78.us.us

._crit_edge78.us.us.loopexit43:                   ; preds = %vector.body
  br label %._crit_edge78.us.us

._crit_edge78.us.us:                              ; preds = %._crit_edge78.us.us.loopexit43, %._crit_edge78.us.us.loopexit
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv109, 1
  %exitcond133 = icmp eq i64 %indvars.iv.next110, 2000
  br i1 %exitcond133, label %._crit_edge80.us, label %.preheader67.us.us

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv106 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next107.1, %scalar.ph ]
  %68 = load double, double* %40, align 8
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv106, i64 %indvars.iv111
  %70 = load double, double* %69, align 8
  %71 = fmul double %68, %70
  %72 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %25, i64 0, i64 %indvars.iv109, i64 %indvars.iv106
  %73 = load double, double* %72, align 8
  %74 = fadd double %73, %71
  store double %74, double* %72, align 8
  %indvars.iv.next107 = or i64 %indvars.iv106, 1
  %75 = load double, double* %40, align 8
  %76 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next107, i64 %indvars.iv111
  %77 = load double, double* %76, align 8
  %78 = fmul double %75, %77
  %79 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv109, i64 %indvars.iv.next107
  %80 = load double, double* %79, align 8
  %81 = fadd double %80, %78
  store double %81, double* %79, align 8
  %indvars.iv.next107.1 = add nsw i64 %indvars.iv106, 2
  %exitcond108.1 = icmp eq i64 %indvars.iv.next107, 1999
  br i1 %exitcond108.1, label %._crit_edge78.us.us.loopexit, label %scalar.ph, !llvm.loop !12

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv104 = phi i64 [ %82, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep18 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv104, i64 0
  %scevgep1819 = bitcast double* %scevgep18 to i8*
  %82 = add nuw nsw i64 %indvars.iv104, 1
  %scevgep20 = getelementptr [2000 x double], [2000 x double]* %0, i64 %82, i64 0
  %scevgep2021 = bitcast double* %scevgep20 to i8*
  %83 = mul nuw nsw i64 %indvars.iv104, 16000
  %scevgep22 = getelementptr i8, i8* %16, i64 %83
  %84 = add nuw nsw i64 %83, 16000
  %scevgep23 = getelementptr i8, i8* %16, i64 %84
  %bound024 = icmp ult i8* %scevgep1819, %scevgep23
  %bound125 = icmp ult i8* %scevgep22, %scevgep2021
  %found.conflict26 = and i1 %bound024, %bound125
  br i1 %found.conflict26, label %scalar.ph15.preheader, label %vector.body13.preheader

vector.body13.preheader:                          ; preds = %.preheader.us
  br label %vector.body13

scalar.ph15.preheader:                            ; preds = %.preheader.us
  br label %scalar.ph15

vector.body13:                                    ; preds = %vector.body13, %vector.body13.preheader
  %index30 = phi i64 [ 0, %vector.body13.preheader ], [ %index.next31.1, %vector.body13 ]
  %85 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %36, i64 0, i64 %indvars.iv104, i64 %index30
  %86 = bitcast double* %85 to <2 x i64>*
  %wide.load38 = load <2 x i64>, <2 x i64>* %86, align 8, !alias.scope !13
  %87 = getelementptr double, double* %85, i64 2
  %88 = bitcast double* %87 to <2 x i64>*
  %wide.load39 = load <2 x i64>, <2 x i64>* %88, align 8, !alias.scope !13
  %89 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv104, i64 %index30
  %90 = bitcast double* %89 to <2 x i64>*
  store <2 x i64> %wide.load38, <2 x i64>* %90, align 8, !alias.scope !16, !noalias !13
  %91 = getelementptr double, double* %89, i64 2
  %92 = bitcast double* %91 to <2 x i64>*
  store <2 x i64> %wide.load39, <2 x i64>* %92, align 8, !alias.scope !16, !noalias !13
  %index.next31 = or i64 %index30, 4
  %93 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %37, i64 0, i64 %indvars.iv104, i64 %index.next31
  %94 = bitcast double* %93 to <2 x i64>*
  %wide.load38.1 = load <2 x i64>, <2 x i64>* %94, align 8, !alias.scope !13
  %95 = getelementptr double, double* %93, i64 2
  %96 = bitcast double* %95 to <2 x i64>*
  %wide.load39.1 = load <2 x i64>, <2 x i64>* %96, align 8, !alias.scope !13
  %97 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv104, i64 %index.next31
  %98 = bitcast double* %97 to <2 x i64>*
  store <2 x i64> %wide.load38.1, <2 x i64>* %98, align 8, !alias.scope !16, !noalias !13
  %99 = getelementptr double, double* %97, i64 2
  %100 = bitcast double* %99 to <2 x i64>*
  store <2 x i64> %wide.load39.1, <2 x i64>* %100, align 8, !alias.scope !16, !noalias !13
  %index.next31.1 = add nsw i64 %index30, 8
  %101 = icmp eq i64 %index.next31.1, 2000
  br i1 %101, label %._crit_edge.us.loopexit42, label %vector.body13, !llvm.loop !18

scalar.ph15:                                      ; preds = %scalar.ph15, %scalar.ph15.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph15.preheader ], [ %indvars.iv.next.4, %scalar.ph15 ]
  %102 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %31, i64 0, i64 %indvars.iv104, i64 %indvars.iv
  %103 = bitcast double* %102 to i64*
  %104 = load i64, i64* %103, align 8
  %105 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv104, i64 %indvars.iv
  %106 = bitcast double* %105 to i64*
  store i64 %104, i64* %106, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %107 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %32, i64 0, i64 %indvars.iv104, i64 %indvars.iv.next
  %108 = bitcast double* %107 to i64*
  %109 = load i64, i64* %108, align 8
  %110 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv104, i64 %indvars.iv.next
  %111 = bitcast double* %110 to i64*
  store i64 %109, i64* %111, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %112 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %33, i64 0, i64 %indvars.iv104, i64 %indvars.iv.next.1
  %113 = bitcast double* %112 to i64*
  %114 = load i64, i64* %113, align 8
  %115 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv104, i64 %indvars.iv.next.1
  %116 = bitcast double* %115 to i64*
  store i64 %114, i64* %116, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %117 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %34, i64 0, i64 %indvars.iv104, i64 %indvars.iv.next.2
  %118 = bitcast double* %117 to i64*
  %119 = load i64, i64* %118, align 8
  %120 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv104, i64 %indvars.iv.next.2
  %121 = bitcast double* %120 to i64*
  store i64 %119, i64* %121, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %122 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %35, i64 0, i64 %indvars.iv104, i64 %indvars.iv.next.3
  %123 = bitcast double* %122 to i64*
  %124 = load i64, i64* %123, align 8
  %125 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv104, i64 %indvars.iv.next.3
  %126 = bitcast double* %125 to i64*
  store i64 %124, i64* %126, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  br i1 %exitcond.4, label %._crit_edge.us.loopexit, label %scalar.ph15, !llvm.loop !19

._crit_edge.us.loopexit:                          ; preds = %scalar.ph15
  br label %._crit_edge.us

._crit_edge.us.loopexit42:                        ; preds = %vector.body13
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit42, %._crit_edge.us.loopexit
  %exitcond132 = icmp eq i64 %82, 2000
  br i1 %exitcond132, label %._crit_edge75, label %.preheader.us

._crit_edge75:                                    ; preds = %._crit_edge.us
  tail call void @free(i8* nonnull %16) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]* nocapture) unnamed_addr #2 {
.preheader43.preheader:
  br label %.preheader43

.preheader43:                                     ; preds = %._crit_edge50, %.preheader43.preheader
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge50 ], [ 0, %.preheader43.preheader ]
  %indvars.iv81 = phi i64 [ %indvars.iv.next82, %._crit_edge50 ], [ 4294967295, %.preheader43.preheader ]
  %1 = and i64 %indvars.iv81, 4294967295
  %2 = icmp sgt i64 %indvars.iv1, 0
  br i1 %2, label %.preheader41.preheader, label %._crit_edge50

.preheader41.preheader:                           ; preds = %.preheader43
  %3 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 0
  br label %.preheader41

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge48.us
  %indvars.iv74 = phi i64 [ %indvars.iv.next75, %._crit_edge48.us ], [ %indvars.iv1, %.preheader.us.preheader ]
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv74
  %.pre60 = load double, double* %4, align 8
  br i1 %lcmp.mod6, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.preheader.us
  br label %5

; <label>:5:                                      ; preds = %.prol.preheader
  %6 = load double, double* %53, align 8
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv74
  %8 = load double, double* %7, align 8
  %9 = fmul double %6, %8
  %10 = fsub double %.pre60, %9
  store double %10, double* %4, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.preheader.us, %5
  %indvars.iv66.unr.ph = phi i64 [ 1, %5 ], [ 0, %.preheader.us ]
  %.unr7.ph = phi double [ %10, %5 ], [ %.pre60, %.preheader.us ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %54, label %._crit_edge48.us, label %.preheader.us.new

.preheader.us.new:                                ; preds = %.prol.loopexit
  br label %11

; <label>:11:                                     ; preds = %11, %.preheader.us.new
  %indvars.iv66 = phi i64 [ %indvars.iv66.unr.ph, %.preheader.us.new ], [ %indvars.iv.next67.1, %11 ]
  %12 = phi double [ %.unr7.ph, %.preheader.us.new ], [ %24, %11 ]
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv66
  %14 = load double, double* %13, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv66, i64 %indvars.iv74
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fsub double %12, %17
  store double %18, double* %4, align 8
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %19 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv.next67
  %20 = load double, double* %19, align 8
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next67, i64 %indvars.iv74
  %22 = load double, double* %21, align 8
  %23 = fmul double %20, %22
  %24 = fsub double %18, %23
  store double %24, double* %4, align 8
  %indvars.iv.next67.1 = add nsw i64 %indvars.iv66, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next67, %1
  br i1 %exitcond.1, label %._crit_edge48.us.unr-lcssa, label %11

._crit_edge48.us.unr-lcssa:                       ; preds = %11
  br label %._crit_edge48.us

._crit_edge48.us:                                 ; preds = %.prol.loopexit, %._crit_edge48.us.unr-lcssa
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond83 = icmp eq i64 %indvars.iv.next75, 2000
  br i1 %exitcond83, label %._crit_edge50.loopexit, label %.preheader.us

.preheader41:                                     ; preds = %.preheader41.preheader, %._crit_edge
  %indvars.iv78 = phi i64 [ %indvars.iv.next79, %._crit_edge ], [ 4294967295, %.preheader41.preheader ]
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %._crit_edge ], [ 0, %.preheader41.preheader ]
  %25 = and i64 %indvars.iv78, 4294967295
  %26 = icmp sgt i64 %indvars.iv63, 0
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv63
  %.pre = load double, double* %27, align 8
  br i1 %26, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader41
  %28 = and i64 %indvars.iv78, 1
  %lcmp.mod = icmp eq i64 %28, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.preheader, label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader
  %29 = load double, double* %3, align 8
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv63
  %31 = load double, double* %30, align 8
  %32 = fmul double %29, %31
  %33 = fsub double %.pre, %32
  store double %33, double* %27, align 8
  br label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.preheader, %.lr.ph.prol
  %.lcssa.unr.ph = phi double [ %33, %.lr.ph.prol ], [ undef, %.lr.ph.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader ]
  %.unr.ph = phi double [ %33, %.lr.ph.prol ], [ %.pre, %.lr.ph.preheader ]
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.unr-lcssa
  %34 = icmp eq i64 %25, 0
  br i1 %34, label %._crit_edge.loopexit, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.preheader.new ], [ %indvars.iv.next.1, %.lr.ph ]
  %35 = phi double [ %.unr.ph, %.lr.ph.preheader.new ], [ %47, %.lr.ph ]
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %37 = load double, double* %36, align 8
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv63
  %39 = load double, double* %38, align 8
  %40 = fmul double %37, %39
  %41 = fsub double %35, %40
  store double %41, double* %27, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv.next
  %43 = load double, double* %42, align 8
  %44 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv63
  %45 = load double, double* %44, align 8
  %46 = fmul double %43, %45
  %47 = fsub double %41, %46
  store double %47, double* %27, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond80.1 = icmp eq i64 %indvars.iv.next, %25
  br i1 %exitcond80.1, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %.lr.ph.prol.loopexit ], [ %47, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader41
  %48 = phi double [ %.pre, %.preheader41 ], [ %.lcssa, %._crit_edge.loopexit ]
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv63, i64 %indvars.iv63
  %50 = load double, double* %49, align 8
  %51 = fdiv double %48, %50
  store double %51, double* %27, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %indvars.iv.next79 = add nuw nsw i64 %25, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next64, %indvars.iv1
  br i1 %exitcond3, label %.preheader.us.preheader, label %.preheader41

.preheader.us.preheader:                          ; preds = %._crit_edge
  %52 = and i64 %indvars.iv81, 1
  %lcmp.mod6 = icmp eq i64 %52, 0
  %53 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 0
  %54 = icmp eq i64 %1, 0
  br label %.preheader.us

._crit_edge50.loopexit:                           ; preds = %._crit_edge48.us
  br label %._crit_edge50

._crit_edge50:                                    ; preds = %._crit_edge50.loopexit, %.preheader43
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %indvars.iv.next82 = add nuw nsw i64 %1, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond4, label %._crit_edge54, label %.preheader43

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
  br label %6

; <label>:6:                                      ; preds = %._crit_edge.us, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge.us ]
  %7 = add nuw nsw i64 %indvars.iv, %5
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
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv15, i64 %indvars.iv
  %15 = load double, double* %14, align 8
  %16 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %15) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge12.us, label %6

._crit_edge12.us:                                 ; preds = %._crit_edge.us
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next16, 2000
  br i1 %exitcond17, label %._crit_edge14, label %.preheader.us

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
