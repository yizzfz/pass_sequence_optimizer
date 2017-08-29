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

.lr.ph94:                                         ; preds = %._crit_edge98.thread, %.preheader72.lr.ph
  %indvars.iv129 = phi i64 [ 0, %.preheader72.lr.ph ], [ %indvars.iv.next130, %._crit_edge98.thread ]
  %1 = shl i64 %indvars.iv129, 32
  %sext = add i64 %1, 4294967296
  %2 = ashr exact i64 %sext, 32
  br label %8

.preheader71:                                     ; preds = %8
  %indvars.iv.next130 = add nuw nsw i64 %indvars.iv129, 1
  %3 = icmp slt i64 %indvars.iv.next130, 2000
  br i1 %3, label %._crit_edge98.thread, label %.preheader70.us.preheader

._crit_edge98.thread:                             ; preds = %.preheader71
  %4 = ashr exact i64 %sext, 29
  %5 = sub nsw i64 16000, %4
  %scevgep133 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv129, i64 %2
  %6 = bitcast double* %scevgep133 to i8*
  call void @llvm.memset.p0i8.i64(i8* %6, i8 0, i64 %5, i32 8, i1 false)
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv129, i64 %indvars.iv129
  store double 1.000000e+00, double* %7, align 8
  br label %.lr.ph94

; <label>:8:                                      ; preds = %._crit_edge, %.lr.ph94
  %indvars.iv119 = phi i64 [ 0, %.lr.ph94 ], [ %indvars.iv.next120, %._crit_edge ]
  %9 = sub nsw i64 0, %indvars.iv119
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 2000
  %12 = sitofp i32 %11 to double
  %13 = fdiv double %12, 2.000000e+03
  %14 = fadd double %13, 1.000000e+00
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv129, i64 %indvars.iv119
  store double %14, double* %15, align 8
  %exitcond123 = icmp eq i64 %indvars.iv119, %indvars.iv129
  br i1 %exitcond123, label %.preheader71, label %._crit_edge

._crit_edge:                                      ; preds = %8
  %indvars.iv.next120 = add nuw nsw i64 %indvars.iv119, 1
  br label %8

.preheader70.us.preheader:                        ; preds = %.preheader71
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv129, i64 %indvars.iv129
  store double 1.000000e+00, double* %16, align 8
  %17 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %._crit_edge91.us

._crit_edge91.us:                                 ; preds = %._crit_edge91.us, %.preheader70.us.preheader
  %indvars.iv117 = phi i64 [ 0, %.preheader70.us.preheader ], [ %indvars.iv.next118.7, %._crit_edge91.us ]
  %18 = mul nuw nsw i64 %indvars.iv117, 16000
  %scevgep = getelementptr i8, i8* %17, i64 %18
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next118 = or i64 %indvars.iv117, 1
  %19 = mul nuw nsw i64 %indvars.iv.next118, 16000
  %scevgep.1 = getelementptr i8, i8* %17, i64 %19
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next118.1 = or i64 %indvars.iv117, 2
  %20 = mul nuw nsw i64 %indvars.iv.next118.1, 16000
  %scevgep.2 = getelementptr i8, i8* %17, i64 %20
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next118.2 = or i64 %indvars.iv117, 3
  %21 = mul nuw nsw i64 %indvars.iv.next118.2, 16000
  %scevgep.3 = getelementptr i8, i8* %17, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next118.3 = or i64 %indvars.iv117, 4
  %22 = mul nuw nsw i64 %indvars.iv.next118.3, 16000
  %scevgep.4 = getelementptr i8, i8* %17, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next118.4 = or i64 %indvars.iv117, 5
  %23 = mul nuw nsw i64 %indvars.iv.next118.4, 16000
  %scevgep.5 = getelementptr i8, i8* %17, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next118.5 = or i64 %indvars.iv117, 6
  %24 = mul nuw nsw i64 %indvars.iv.next118.5, 16000
  %scevgep.6 = getelementptr i8, i8* %17, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next118.6 = or i64 %indvars.iv117, 7
  %25 = mul nuw nsw i64 %indvars.iv.next118.6, 16000
  %scevgep.7 = getelementptr i8, i8* %17, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next118.7 = add nsw i64 %indvars.iv117, 8
  %exitcond4.7 = icmp eq i64 %indvars.iv.next118.7, 2000
  br i1 %exitcond4.7, label %.preheader67.us.us.preheader.preheader, label %._crit_edge91.us

.preheader67.us.us.preheader.preheader:           ; preds = %._crit_edge91.us
  %26 = bitcast i8* %17 to [2000 x [2000 x double]]*
  %27 = bitcast i8* %17 to [2000 x [2000 x double]]*
  br label %.preheader67.us.us.preheader

.preheader67.us.us.preheader:                     ; preds = %.preheader67.us.us.preheader.preheader, %._crit_edge80.us
  %indvars.iv112 = phi i64 [ %indvars.iv.next113, %._crit_edge80.us ], [ 0, %.preheader67.us.us.preheader.preheader ]
  %scevgep7 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv112
  %28 = add nuw nsw i64 %indvars.iv112, 1
  %scevgep9 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %28
  %29 = bitcast double* %scevgep9 to i8*
  %30 = bitcast double* %scevgep7 to i8*
  br label %.preheader67.us.us

._crit_edge80.us:                                 ; preds = %._crit_edge78.us.us
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next113, 2000
  br i1 %exitcond3, label %.preheader.us.preheader, label %.preheader67.us.us.preheader

.preheader.us.preheader:                          ; preds = %._crit_edge80.us
  %31 = bitcast i8* %17 to [2000 x [2000 x double]]*
  %32 = bitcast i8* %17 to [2000 x [2000 x double]]*
  %33 = bitcast i8* %17 to [2000 x [2000 x double]]*
  br label %.preheader.us

.preheader67.us.us:                               ; preds = %._crit_edge78.us.us, %.preheader67.us.us.preheader
  %indvars.iv110 = phi i64 [ 0, %.preheader67.us.us.preheader ], [ %indvars.iv.next111, %._crit_edge78.us.us ]
  %34 = mul nuw nsw i64 %indvars.iv110, 16000
  %scevgep5 = getelementptr i8, i8* %17, i64 %34
  %35 = add nuw nsw i64 %34, 16000
  %scevgep6 = getelementptr i8, i8* %17, i64 %35
  %36 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv110, i64 %indvars.iv112
  %bound0 = icmp ult i8* %scevgep5, %29
  %bound1 = icmp ult i8* %30, %scevgep6
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %36 to i8*
  %bc11 = bitcast double* %36 to i8*
  %bound012 = icmp ult i8* %scevgep5, %bc11
  %bound113 = icmp ult i8* %bc, %scevgep6
  %found.conflict14 = and i1 %bound012, %bound113
  %conflict.rdx = or i1 %found.conflict, %found.conflict14
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader67.us.us
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader67.us.us
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %37 = or i64 %index, 1
  %38 = or i64 %index, 2
  %39 = or i64 %index, 3
  %40 = load double, double* %36, align 8, !alias.scope !1
  %41 = insertelement <2 x double> undef, double %40, i32 0
  %42 = shufflevector <2 x double> %41, <2 x double> undef, <2 x i32> zeroinitializer
  %43 = insertelement <2 x double> undef, double %40, i32 0
  %44 = shufflevector <2 x double> %43, <2 x double> undef, <2 x i32> zeroinitializer
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv112
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %37, i64 %indvars.iv112
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %38, i64 %indvars.iv112
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %39, i64 %indvars.iv112
  %49 = load double, double* %45, align 8, !alias.scope !4
  %50 = load double, double* %46, align 8, !alias.scope !4
  %51 = load double, double* %47, align 8, !alias.scope !4
  %52 = load double, double* %48, align 8, !alias.scope !4
  %53 = insertelement <2 x double> undef, double %49, i32 0
  %54 = insertelement <2 x double> %53, double %50, i32 1
  %55 = insertelement <2 x double> undef, double %51, i32 0
  %56 = insertelement <2 x double> %55, double %52, i32 1
  %57 = fmul <2 x double> %42, %54
  %58 = fmul <2 x double> %44, %56
  %59 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %27, i64 0, i64 %indvars.iv110, i64 %index
  %60 = bitcast double* %59 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %60, align 8, !alias.scope !6, !noalias !8
  %61 = getelementptr double, double* %59, i64 2
  %62 = bitcast double* %61 to <2 x double>*
  %wide.load16 = load <2 x double>, <2 x double>* %62, align 8, !alias.scope !6, !noalias !8
  %63 = fadd <2 x double> %wide.load, %57
  %64 = fadd <2 x double> %wide.load16, %58
  %65 = bitcast double* %59 to <2 x double>*
  store <2 x double> %63, <2 x double>* %65, align 8, !alias.scope !6, !noalias !8
  %66 = bitcast double* %61 to <2 x double>*
  store <2 x double> %64, <2 x double>* %66, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %67 = icmp eq i64 %index.next, 2000
  br i1 %67, label %._crit_edge78.us.us.loopexit49, label %vector.body, !llvm.loop !9

._crit_edge78.us.us.loopexit:                     ; preds = %scalar.ph
  br label %._crit_edge78.us.us

._crit_edge78.us.us.loopexit49:                   ; preds = %vector.body
  br label %._crit_edge78.us.us

._crit_edge78.us.us:                              ; preds = %._crit_edge78.us.us.loopexit49, %._crit_edge78.us.us.loopexit
  %indvars.iv.next111 = add nuw nsw i64 %indvars.iv110, 1
  %exitcond2 = icmp eq i64 %indvars.iv.next111, 2000
  br i1 %exitcond2, label %._crit_edge80.us, label %.preheader67.us.us

scalar.ph:                                        ; preds = %scalar.ph.preheader, %._crit_edge44
  %indvars.iv107 = phi i64 [ %indvars.iv.next108, %._crit_edge44 ], [ 0, %scalar.ph.preheader ]
  %68 = load double, double* %36, align 8
  %69 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv107, i64 %indvars.iv112
  %70 = load double, double* %69, align 8
  %71 = fmul double %68, %70
  %72 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %26, i64 0, i64 %indvars.iv110, i64 %indvars.iv107
  %73 = load double, double* %72, align 8
  %74 = fadd double %73, %71
  store double %74, double* %72, align 8
  %exitcond109 = icmp eq i64 %indvars.iv107, 1999
  br i1 %exitcond109, label %._crit_edge78.us.us.loopexit, label %._crit_edge44, !llvm.loop !12

._crit_edge44:                                    ; preds = %scalar.ph
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  br label %scalar.ph

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv105 = phi i64 [ %indvars.iv.next106, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep22 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv105, i64 0
  %scevgep2223 = bitcast double* %scevgep22 to i8*
  %75 = add nuw nsw i64 %indvars.iv105, 1
  %scevgep24 = getelementptr [2000 x double], [2000 x double]* %0, i64 %75, i64 0
  %scevgep2425 = bitcast double* %scevgep24 to i8*
  %76 = mul nuw nsw i64 %indvars.iv105, 16000
  %scevgep26 = getelementptr i8, i8* %17, i64 %76
  %77 = add nuw nsw i64 %76, 16000
  %scevgep27 = getelementptr i8, i8* %17, i64 %77
  %bound028 = icmp ult i8* %scevgep2223, %scevgep27
  %bound129 = icmp ult i8* %scevgep26, %scevgep2425
  %memcheck.conflict31 = and i1 %bound028, %bound129
  br i1 %memcheck.conflict31, label %scalar.ph19.preheader, label %vector.body17.preheader

vector.body17.preheader:                          ; preds = %.preheader.us
  br label %vector.body17

scalar.ph19.preheader:                            ; preds = %.preheader.us
  br label %scalar.ph19

vector.body17:                                    ; preds = %vector.body17, %vector.body17.preheader
  %index34 = phi i64 [ 0, %vector.body17.preheader ], [ %index.next35.1, %vector.body17 ]
  %78 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %32, i64 0, i64 %indvars.iv105, i64 %index34
  %79 = bitcast double* %78 to <2 x i64>*
  %wide.load42 = load <2 x i64>, <2 x i64>* %79, align 8, !alias.scope !13
  %80 = getelementptr double, double* %78, i64 2
  %81 = bitcast double* %80 to <2 x i64>*
  %wide.load43 = load <2 x i64>, <2 x i64>* %81, align 8, !alias.scope !13
  %82 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv105, i64 %index34
  %83 = bitcast double* %82 to <2 x i64>*
  store <2 x i64> %wide.load42, <2 x i64>* %83, align 8, !alias.scope !16, !noalias !13
  %84 = getelementptr double, double* %82, i64 2
  %85 = bitcast double* %84 to <2 x i64>*
  store <2 x i64> %wide.load43, <2 x i64>* %85, align 8, !alias.scope !16, !noalias !13
  %index.next35 = or i64 %index34, 4
  %86 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %33, i64 0, i64 %indvars.iv105, i64 %index.next35
  %87 = bitcast double* %86 to <2 x i64>*
  %wide.load42.1 = load <2 x i64>, <2 x i64>* %87, align 8, !alias.scope !13
  %88 = getelementptr double, double* %86, i64 2
  %89 = bitcast double* %88 to <2 x i64>*
  %wide.load43.1 = load <2 x i64>, <2 x i64>* %89, align 8, !alias.scope !13
  %90 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv105, i64 %index.next35
  %91 = bitcast double* %90 to <2 x i64>*
  store <2 x i64> %wide.load42.1, <2 x i64>* %91, align 8, !alias.scope !16, !noalias !13
  %92 = getelementptr double, double* %90, i64 2
  %93 = bitcast double* %92 to <2 x i64>*
  store <2 x i64> %wide.load43.1, <2 x i64>* %93, align 8, !alias.scope !16, !noalias !13
  %index.next35.1 = add nsw i64 %index34, 8
  %94 = icmp eq i64 %index.next35.1, 2000
  br i1 %94, label %._crit_edge.us.loopexit48, label %vector.body17, !llvm.loop !18

scalar.ph19:                                      ; preds = %scalar.ph19.preheader, %._crit_edge45
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge45 ], [ 0, %scalar.ph19.preheader ]
  %95 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %31, i64 0, i64 %indvars.iv105, i64 %indvars.iv
  %96 = bitcast double* %95 to i64*
  %97 = load i64, i64* %96, align 8
  %98 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv105, i64 %indvars.iv
  %99 = bitcast double* %98 to i64*
  store i64 %97, i64* %99, align 8
  %exitcond = icmp eq i64 %indvars.iv, 1999
  br i1 %exitcond, label %._crit_edge.us.loopexit, label %._crit_edge45, !llvm.loop !19

._crit_edge45:                                    ; preds = %scalar.ph19
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %scalar.ph19

._crit_edge.us.loopexit:                          ; preds = %scalar.ph19
  br label %._crit_edge.us

._crit_edge.us.loopexit48:                        ; preds = %vector.body17
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit48, %._crit_edge.us.loopexit
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv105, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next106, 2000
  br i1 %exitcond1, label %._crit_edge75, label %.preheader.us

._crit_edge75:                                    ; preds = %._crit_edge.us
  tail call void @free(i8* nonnull %17) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]* nocapture) unnamed_addr #2 {
.preheader43.preheader:
  br label %.preheader43

.preheader43:                                     ; preds = %._crit_edge50..preheader43_crit_edge, %.preheader43.preheader
  %indvars.iv1 = phi i64 [ %indvars.iv.next2, %._crit_edge50..preheader43_crit_edge ], [ 0, %.preheader43.preheader ]
  %indvars.iv68 = phi i32 [ %indvars.iv.next69, %._crit_edge50..preheader43_crit_edge ], [ -1, %.preheader43.preheader ]
  %1 = icmp sgt i64 %indvars.iv1, 0
  br i1 %1, label %.preheader41.preheader, label %._crit_edge50

.preheader41.preheader:                           ; preds = %.preheader43
  br label %.preheader41

.preheader.us.preheader:                          ; preds = %._crit_edge
  %wide.trip.count70 = zext i32 %indvars.iv68 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge48.us, %.preheader.us.preheader
  %indvars.iv74 = phi i64 [ %indvars.iv1, %.preheader.us.preheader ], [ %indvars.iv.next75, %._crit_edge48.us ]
  %2 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv74
  %.pre60 = load double, double* %2, align 8
  br label %3

; <label>:3:                                      ; preds = %._crit_edge6, %.preheader.us
  %indvars.iv66 = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next67, %._crit_edge6 ]
  %4 = phi double [ %.pre60, %.preheader.us ], [ %10, %._crit_edge6 ]
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv66
  %6 = load double, double* %5, align 8
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv66, i64 %indvars.iv74
  %8 = load double, double* %7, align 8
  %9 = fmul double %6, %8
  %10 = fsub double %4, %9
  store double %10, double* %2, align 8
  %exitcond71 = icmp eq i64 %indvars.iv66, %wide.trip.count70
  br i1 %exitcond71, label %._crit_edge48.us, label %._crit_edge6

._crit_edge6:                                     ; preds = %3
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  br label %3

._crit_edge48.us:                                 ; preds = %3
  %indvars.iv.next75 = add nuw nsw i64 %indvars.iv74, 1
  %exitcond4 = icmp eq i64 %indvars.iv.next75, 2000
  br i1 %exitcond4, label %._crit_edge50.loopexit, label %.preheader.us

.preheader41:                                     ; preds = %.preheader41.preheader, %._crit_edge..preheader41_crit_edge
  %indvars.iv63 = phi i64 [ %indvars.iv.next64, %._crit_edge..preheader41_crit_edge ], [ 0, %.preheader41.preheader ]
  %indvars.iv61 = phi i32 [ %indvars.iv.next62, %._crit_edge..preheader41_crit_edge ], [ -1, %.preheader41.preheader ]
  %11 = icmp sgt i64 %indvars.iv63, 0
  %12 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv63
  %.pre = load double, double* %12, align 8
  br i1 %11, label %.lr.ph, label %._crit_edge

.lr.ph:                                           ; preds = %.preheader41
  %wide.trip.count = zext i32 %indvars.iv61 to i64
  br label %13

; <label>:13:                                     ; preds = %._crit_edge7, %.lr.ph
  %indvars.iv = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next, %._crit_edge7 ]
  %14 = phi double [ %.pre, %.lr.ph ], [ %20, %._crit_edge7 ]
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv1, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv63
  %18 = load double, double* %17, align 8
  %19 = fmul double %16, %18
  %20 = fsub double %14, %19
  store double %20, double* %12, align 8
  %exitcond = icmp eq i64 %indvars.iv, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.loopexit, label %._crit_edge7

._crit_edge7:                                     ; preds = %13
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  br label %13

._crit_edge.loopexit:                             ; preds = %13
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader41
  %21 = phi double [ %.pre, %.preheader41 ], [ %20, %._crit_edge.loopexit ]
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv63, i64 %indvars.iv63
  %23 = load double, double* %22, align 8
  %24 = fdiv double %21, %23
  store double %24, double* %12, align 8
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv63, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next64, %indvars.iv1
  br i1 %exitcond3, label %.preheader.us.preheader, label %._crit_edge..preheader41_crit_edge

._crit_edge..preheader41_crit_edge:               ; preds = %._crit_edge
  %indvars.iv.next62 = add nsw i32 %indvars.iv61, 1
  br label %.preheader41

._crit_edge50.loopexit:                           ; preds = %._crit_edge48.us
  br label %._crit_edge50

._crit_edge50:                                    ; preds = %._crit_edge50.loopexit, %.preheader43
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next2, 2000
  br i1 %exitcond5, label %._crit_edge54, label %._crit_edge50..preheader43_crit_edge

._crit_edge50..preheader43_crit_edge:             ; preds = %._crit_edge50
  %indvars.iv.next69 = add nsw i32 %indvars.iv68, 1
  br label %.preheader43

._crit_edge54:                                    ; preds = %._crit_edge50
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #6
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
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
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %11) #6
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us._crit_edge, %10
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv15, i64 %indvars.iv
  %14 = load double, double* %13, align 8
  %15 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %12, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %14) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %._crit_edge12.us, label %._crit_edge.us._crit_edge

._crit_edge12.us:                                 ; preds = %._crit_edge.us
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond1 = icmp eq i64 %indvars.iv.next16, 2000
  br i1 %exitcond1, label %._crit_edge14, label %.preheader.us

._crit_edge14:                                    ; preds = %._crit_edge12.us
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %18) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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
