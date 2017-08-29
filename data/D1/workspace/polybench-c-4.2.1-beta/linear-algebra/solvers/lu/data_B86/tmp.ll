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
  br label %.lr.ph

.lr.ph:                                           ; preds = %._crit_edge.thread, %1
  %indvars.iv46 = phi i64 [ 0, %1 ], [ %indvars.iv.next47, %._crit_edge.thread ]
  %2 = shl i64 %indvars.iv46, 32
  %sext = add i64 %2, 4294967296
  %3 = ashr exact i64 %sext, 32
  br label %9

.preheader6:                                      ; preds = %9
  %indvars.iv.next47 = add nuw nsw i64 %indvars.iv46, 1
  %4 = icmp slt i64 %indvars.iv.next47, 2000
  br i1 %4, label %._crit_edge.thread, label %17

._crit_edge.thread:                               ; preds = %.preheader6
  %5 = ashr exact i64 %sext, 29
  %6 = sub nsw i64 16000, %5
  %scevgep50 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv46, i64 %3
  %7 = bitcast double* %scevgep50 to i8*
  call void @llvm.memset.p0i8.i64(i8* %7, i8 0, i64 %6, i32 8, i1 false)
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv46, i64 %indvars.iv46
  store double 1.000000e+00, double* %8, align 8
  br label %.lr.ph

; <label>:9:                                      ; preds = %9, %.lr.ph
  %indvars.iv36 = phi i64 [ 0, %.lr.ph ], [ %indvars.iv.next37, %9 ]
  %10 = sub nsw i64 0, %indvars.iv36
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 2000
  %13 = sitofp i32 %12 to double
  %14 = fdiv double %13, 2.000000e+03
  %15 = fadd double %14, 1.000000e+00
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv46, i64 %indvars.iv36
  store double %15, double* %16, align 8
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv36, 1
  %exitcond40 = icmp eq i64 %indvars.iv36, %indvars.iv46
  br i1 %exitcond40, label %.preheader6, label %9

; <label>:17:                                     ; preds = %.preheader6
  %18 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv46, i64 %indvars.iv46
  store double 1.000000e+00, double* %18, align 8
  %19 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #4
  br label %20

; <label>:20:                                     ; preds = %20, %17
  %indvars.iv34 = phi i64 [ 0, %17 ], [ %indvars.iv.next35.7, %20 ]
  %21 = mul nuw nsw i64 %indvars.iv34, 16000
  %scevgep = getelementptr i8, i8* %19, i64 %21
  call void @llvm.memset.p0i8.i64(i8* %scevgep, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next35 = or i64 %indvars.iv34, 1
  %22 = mul nuw nsw i64 %indvars.iv.next35, 16000
  %scevgep.1 = getelementptr i8, i8* %19, i64 %22
  call void @llvm.memset.p0i8.i64(i8* %scevgep.1, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next35.1 = or i64 %indvars.iv34, 2
  %23 = mul nuw nsw i64 %indvars.iv.next35.1, 16000
  %scevgep.2 = getelementptr i8, i8* %19, i64 %23
  call void @llvm.memset.p0i8.i64(i8* %scevgep.2, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next35.2 = or i64 %indvars.iv34, 3
  %24 = mul nuw nsw i64 %indvars.iv.next35.2, 16000
  %scevgep.3 = getelementptr i8, i8* %19, i64 %24
  call void @llvm.memset.p0i8.i64(i8* %scevgep.3, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next35.3 = or i64 %indvars.iv34, 4
  %25 = mul nuw nsw i64 %indvars.iv.next35.3, 16000
  %scevgep.4 = getelementptr i8, i8* %19, i64 %25
  call void @llvm.memset.p0i8.i64(i8* %scevgep.4, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next35.4 = or i64 %indvars.iv34, 5
  %26 = mul nuw nsw i64 %indvars.iv.next35.4, 16000
  %scevgep.5 = getelementptr i8, i8* %19, i64 %26
  call void @llvm.memset.p0i8.i64(i8* %scevgep.5, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next35.5 = or i64 %indvars.iv34, 6
  %27 = mul nuw nsw i64 %indvars.iv.next35.5, 16000
  %scevgep.6 = getelementptr i8, i8* %19, i64 %27
  call void @llvm.memset.p0i8.i64(i8* %scevgep.6, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next35.6 = or i64 %indvars.iv34, 7
  %28 = mul nuw nsw i64 %indvars.iv.next35.6, 16000
  %scevgep.7 = getelementptr i8, i8* %19, i64 %28
  call void @llvm.memset.p0i8.i64(i8* %scevgep.7, i8 0, i64 16000, i32 8, i1 false)
  %indvars.iv.next35.7 = add nsw i64 %indvars.iv34, 8
  %exitcond95.7 = icmp eq i64 %indvars.iv.next35.7, 2000
  br i1 %exitcond95.7, label %.preheader3.preheader, label %20

.preheader3.preheader:                            ; preds = %20
  %29 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %30 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %31 = bitcast i8* %19 to [2000 x [2000 x double]]*
  br label %.preheader3

.preheader3:                                      ; preds = %.preheader3.preheader, %83
  %indvars.iv29 = phi i64 [ %indvars.iv.next30, %83 ], [ 0, %.preheader3.preheader ]
  %scevgep54 = getelementptr [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv29
  %32 = add nuw nsw i64 %indvars.iv29, 1
  %scevgep56 = getelementptr [2000 x double], [2000 x double]* %0, i64 1999, i64 %32
  %33 = bitcast double* %scevgep56 to i8*
  %34 = bitcast double* %scevgep54 to i8*
  br label %.preheader2

.preheader2:                                      ; preds = %middle.block, %.preheader3
  %indvars.iv27 = phi i64 [ 0, %.preheader3 ], [ %indvars.iv.next28, %middle.block ]
  %35 = mul nuw nsw i64 %indvars.iv27, 16000
  %scevgep52 = getelementptr i8, i8* %19, i64 %35
  %36 = add nuw nsw i64 %35, 16000
  %scevgep53 = getelementptr i8, i8* %19, i64 %36
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv27, i64 %indvars.iv29
  %bound0 = icmp ult i8* %scevgep52, %33
  %bound1 = icmp ult i8* %34, %scevgep53
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %37 to i8*
  %bc58 = bitcast double* %37 to i8*
  %bound059 = icmp ult i8* %scevgep52, %bc58
  %bound160 = icmp ult i8* %bc, %scevgep53
  %found.conflict61 = and i1 %bound059, %bound160
  %conflict.rdx = or i1 %found.conflict, %found.conflict61
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader2
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader2
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %38 = or i64 %index, 1
  %39 = or i64 %index, 2
  %40 = or i64 %index, 3
  %41 = load double, double* %37, align 8, !alias.scope !1
  %42 = insertelement <2 x double> undef, double %41, i32 0
  %43 = shufflevector <2 x double> %42, <2 x double> undef, <2 x i32> zeroinitializer
  %44 = insertelement <2 x double> undef, double %41, i32 0
  %45 = shufflevector <2 x double> %44, <2 x double> undef, <2 x i32> zeroinitializer
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %index, i64 %indvars.iv29
  %47 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %38, i64 %indvars.iv29
  %48 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %39, i64 %indvars.iv29
  %49 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %40, i64 %indvars.iv29
  %50 = load double, double* %46, align 8, !alias.scope !4
  %51 = load double, double* %47, align 8, !alias.scope !4
  %52 = load double, double* %48, align 8, !alias.scope !4
  %53 = load double, double* %49, align 8, !alias.scope !4
  %54 = insertelement <2 x double> undef, double %50, i32 0
  %55 = insertelement <2 x double> %54, double %51, i32 1
  %56 = insertelement <2 x double> undef, double %52, i32 0
  %57 = insertelement <2 x double> %56, double %53, i32 1
  %58 = fmul <2 x double> %43, %55
  %59 = fmul <2 x double> %45, %57
  %60 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %31, i64 0, i64 %indvars.iv27, i64 %index
  %61 = bitcast double* %60 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %61, align 8, !alias.scope !6, !noalias !8
  %62 = getelementptr double, double* %60, i64 2
  %63 = bitcast double* %62 to <2 x double>*
  %wide.load63 = load <2 x double>, <2 x double>* %63, align 8, !alias.scope !6, !noalias !8
  %64 = fadd <2 x double> %wide.load, %58
  %65 = fadd <2 x double> %wide.load63, %59
  %66 = bitcast double* %60 to <2 x double>*
  store <2 x double> %64, <2 x double>* %66, align 8, !alias.scope !6, !noalias !8
  %67 = bitcast double* %62 to <2 x double>*
  store <2 x double> %65, <2 x double>* %67, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %68 = icmp eq i64 %index.next, 2000
  br i1 %68, label %middle.block.loopexit99, label %vector.body, !llvm.loop !9

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv24 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next25.1, %scalar.ph ]
  %69 = load double, double* %37, align 8
  %70 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv24, i64 %indvars.iv29
  %71 = load double, double* %70, align 8
  %72 = fmul double %69, %71
  %73 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %29, i64 0, i64 %indvars.iv27, i64 %indvars.iv24
  %74 = load double, double* %73, align 8
  %75 = fadd double %74, %72
  store double %75, double* %73, align 8
  %indvars.iv.next25 = or i64 %indvars.iv24, 1
  %76 = load double, double* %37, align 8
  %77 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next25, i64 %indvars.iv29
  %78 = load double, double* %77, align 8
  %79 = fmul double %76, %78
  %80 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %30, i64 0, i64 %indvars.iv27, i64 %indvars.iv.next25
  %81 = load double, double* %80, align 8
  %82 = fadd double %81, %79
  store double %82, double* %80, align 8
  %indvars.iv.next25.1 = add nsw i64 %indvars.iv24, 2
  %exitcond26.1 = icmp eq i64 %indvars.iv.next25, 1999
  br i1 %exitcond26.1, label %middle.block.loopexit, label %scalar.ph, !llvm.loop !12

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block.loopexit99:                          ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit99, %middle.block.loopexit
  %indvars.iv.next28 = add nuw nsw i64 %indvars.iv27, 1
  %exitcond93 = icmp eq i64 %indvars.iv.next28, 2000
  br i1 %exitcond93, label %83, label %.preheader2

; <label>:83:                                     ; preds = %middle.block
  %indvars.iv.next30 = add nuw nsw i64 %indvars.iv29, 1
  %exitcond94 = icmp eq i64 %indvars.iv.next30, 2000
  br i1 %exitcond94, label %.preheader.preheader, label %.preheader3

.preheader.preheader:                             ; preds = %83
  %84 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %85 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %86 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %87 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %88 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %89 = bitcast i8* %19 to [2000 x [2000 x double]]*
  %90 = bitcast i8* %19 to [2000 x [2000 x double]]*
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %middle.block65
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %middle.block65 ], [ 0, %.preheader.preheader ]
  %scevgep69 = getelementptr [2000 x double], [2000 x double]* %0, i64 %indvars.iv22, i64 0
  %scevgep6970 = bitcast double* %scevgep69 to i8*
  %91 = add nuw nsw i64 %indvars.iv22, 1
  %scevgep71 = getelementptr [2000 x double], [2000 x double]* %0, i64 %91, i64 0
  %scevgep7172 = bitcast double* %scevgep71 to i8*
  %92 = mul nuw nsw i64 %indvars.iv22, 16000
  %scevgep73 = getelementptr i8, i8* %19, i64 %92
  %93 = add nuw nsw i64 %92, 16000
  %scevgep74 = getelementptr i8, i8* %19, i64 %93
  %bound075 = icmp ult i8* %scevgep6970, %scevgep74
  %bound176 = icmp ult i8* %scevgep73, %scevgep7172
  %memcheck.conflict78 = and i1 %bound075, %bound176
  br i1 %memcheck.conflict78, label %scalar.ph66.preheader, label %vector.body64.preheader

vector.body64.preheader:                          ; preds = %.preheader
  br label %vector.body64

scalar.ph66.preheader:                            ; preds = %.preheader
  br label %scalar.ph66

vector.body64:                                    ; preds = %vector.body64, %vector.body64.preheader
  %index81 = phi i64 [ 0, %vector.body64.preheader ], [ %index.next82.1, %vector.body64 ]
  %94 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %89, i64 0, i64 %indvars.iv22, i64 %index81
  %95 = bitcast double* %94 to <2 x i64>*
  %wide.load89 = load <2 x i64>, <2 x i64>* %95, align 8, !alias.scope !13
  %96 = getelementptr double, double* %94, i64 2
  %97 = bitcast double* %96 to <2 x i64>*
  %wide.load90 = load <2 x i64>, <2 x i64>* %97, align 8, !alias.scope !13
  %98 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv22, i64 %index81
  %99 = bitcast double* %98 to <2 x i64>*
  store <2 x i64> %wide.load89, <2 x i64>* %99, align 8, !alias.scope !16, !noalias !13
  %100 = getelementptr double, double* %98, i64 2
  %101 = bitcast double* %100 to <2 x i64>*
  store <2 x i64> %wide.load90, <2 x i64>* %101, align 8, !alias.scope !16, !noalias !13
  %index.next82 = or i64 %index81, 4
  %102 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %90, i64 0, i64 %indvars.iv22, i64 %index.next82
  %103 = bitcast double* %102 to <2 x i64>*
  %wide.load89.1 = load <2 x i64>, <2 x i64>* %103, align 8, !alias.scope !13
  %104 = getelementptr double, double* %102, i64 2
  %105 = bitcast double* %104 to <2 x i64>*
  %wide.load90.1 = load <2 x i64>, <2 x i64>* %105, align 8, !alias.scope !13
  %106 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv22, i64 %index.next82
  %107 = bitcast double* %106 to <2 x i64>*
  store <2 x i64> %wide.load89.1, <2 x i64>* %107, align 8, !alias.scope !16, !noalias !13
  %108 = getelementptr double, double* %106, i64 2
  %109 = bitcast double* %108 to <2 x i64>*
  store <2 x i64> %wide.load90.1, <2 x i64>* %109, align 8, !alias.scope !16, !noalias !13
  %index.next82.1 = add nsw i64 %index81, 8
  %110 = icmp eq i64 %index.next82.1, 2000
  br i1 %110, label %middle.block65.loopexit98, label %vector.body64, !llvm.loop !18

scalar.ph66:                                      ; preds = %scalar.ph66, %scalar.ph66.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph66.preheader ], [ %indvars.iv.next.4, %scalar.ph66 ]
  %111 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %84, i64 0, i64 %indvars.iv22, i64 %indvars.iv
  %112 = bitcast double* %111 to i64*
  %113 = load i64, i64* %112, align 8
  %114 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv22, i64 %indvars.iv
  %115 = bitcast double* %114 to i64*
  store i64 %113, i64* %115, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %116 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %85, i64 0, i64 %indvars.iv22, i64 %indvars.iv.next
  %117 = bitcast double* %116 to i64*
  %118 = load i64, i64* %117, align 8
  %119 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv22, i64 %indvars.iv.next
  %120 = bitcast double* %119 to i64*
  store i64 %118, i64* %120, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %121 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %86, i64 0, i64 %indvars.iv22, i64 %indvars.iv.next.1
  %122 = bitcast double* %121 to i64*
  %123 = load i64, i64* %122, align 8
  %124 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv22, i64 %indvars.iv.next.1
  %125 = bitcast double* %124 to i64*
  store i64 %123, i64* %125, align 8
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %126 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %87, i64 0, i64 %indvars.iv22, i64 %indvars.iv.next.2
  %127 = bitcast double* %126 to i64*
  %128 = load i64, i64* %127, align 8
  %129 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv22, i64 %indvars.iv.next.2
  %130 = bitcast double* %129 to i64*
  store i64 %128, i64* %130, align 8
  %indvars.iv.next.3 = add nsw i64 %indvars.iv, 4
  %131 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %88, i64 0, i64 %indvars.iv22, i64 %indvars.iv.next.3
  %132 = bitcast double* %131 to i64*
  %133 = load i64, i64* %132, align 8
  %134 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv22, i64 %indvars.iv.next.3
  %135 = bitcast double* %134 to i64*
  store i64 %133, i64* %135, align 8
  %indvars.iv.next.4 = add nsw i64 %indvars.iv, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.3, 1999
  br i1 %exitcond.4, label %middle.block65.loopexit, label %scalar.ph66, !llvm.loop !19

middle.block65.loopexit:                          ; preds = %scalar.ph66
  br label %middle.block65

middle.block65.loopexit98:                        ; preds = %vector.body64
  br label %middle.block65

middle.block65:                                   ; preds = %middle.block65.loopexit98, %middle.block65.loopexit
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %exitcond92 = icmp eq i64 %indvars.iv.next23, 2000
  br i1 %exitcond92, label %136, label %.preheader

; <label>:136:                                    ; preds = %middle.block65
  tail call void @free(i8* nonnull %19) #4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @kernel_lu([2000 x double]* nocapture) unnamed_addr #2 {
  br label %.preheader3

.preheader3:                                      ; preds = %._crit_edge10, %1
  %indvars.iv42 = phi i64 [ %indvars.iv.next43, %._crit_edge10 ], [ 0, %1 ]
  %indvars.iv40 = phi i64 [ %indvars.iv.next41, %._crit_edge10 ], [ 4294967295, %1 ]
  %2 = and i64 %indvars.iv40, 4294967295
  %3 = icmp sgt i64 %indvars.iv42, 0
  br i1 %3, label %.preheader1.preheader, label %._crit_edge10

.preheader1.preheader:                            ; preds = %.preheader3
  %4 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv42, i64 0
  br label %.preheader1

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge8.us
  %indvars.iv33 = phi i64 [ %indvars.iv.next34, %._crit_edge8.us ], [ %indvars.iv42, %.preheader.us.preheader ]
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv42, i64 %indvars.iv33
  %.pre19 = load double, double* %5, align 8
  br i1 %lcmp.mod48, label %.prol.preheader, label %.prol.loopexit.unr-lcssa

.prol.preheader:                                  ; preds = %.preheader.us
  br label %6

; <label>:6:                                      ; preds = %.prol.preheader
  %7 = load double, double* %54, align 8
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv33
  %9 = load double, double* %8, align 8
  %10 = fmul double %7, %9
  %11 = fsub double %.pre19, %10
  store double %11, double* %5, align 8
  br label %.prol.loopexit.unr-lcssa

.prol.loopexit.unr-lcssa:                         ; preds = %.preheader.us, %6
  %indvars.iv25.unr.ph = phi i64 [ 1, %6 ], [ 0, %.preheader.us ]
  %.unr49.ph = phi double [ %11, %6 ], [ %.pre19, %.preheader.us ]
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.loopexit.unr-lcssa
  br i1 %55, label %._crit_edge8.us, label %.preheader.us.new

.preheader.us.new:                                ; preds = %.prol.loopexit
  br label %12

; <label>:12:                                     ; preds = %12, %.preheader.us.new
  %indvars.iv25 = phi i64 [ %indvars.iv25.unr.ph, %.preheader.us.new ], [ %indvars.iv.next26.1, %12 ]
  %13 = phi double [ %.unr49.ph, %.preheader.us.new ], [ %25, %12 ]
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv42, i64 %indvars.iv25
  %15 = load double, double* %14, align 8
  %16 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv25, i64 %indvars.iv33
  %17 = load double, double* %16, align 8
  %18 = fmul double %15, %17
  %19 = fsub double %13, %18
  store double %19, double* %5, align 8
  %indvars.iv.next26 = add nuw nsw i64 %indvars.iv25, 1
  %20 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv42, i64 %indvars.iv.next26
  %21 = load double, double* %20, align 8
  %22 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next26, i64 %indvars.iv33
  %23 = load double, double* %22, align 8
  %24 = fmul double %21, %23
  %25 = fsub double %19, %24
  store double %25, double* %5, align 8
  %indvars.iv.next26.1 = add nsw i64 %indvars.iv25, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next26, %2
  br i1 %exitcond.1, label %._crit_edge8.us.unr-lcssa, label %12

._crit_edge8.us.unr-lcssa:                        ; preds = %12
  br label %._crit_edge8.us

._crit_edge8.us:                                  ; preds = %.prol.loopexit, %._crit_edge8.us.unr-lcssa
  %indvars.iv.next34 = add nuw nsw i64 %indvars.iv33, 1
  %exitcond45 = icmp eq i64 %indvars.iv.next34, 2000
  br i1 %exitcond45, label %._crit_edge10.loopexit, label %.preheader.us

.preheader1:                                      ; preds = %.preheader1.preheader, %._crit_edge
  %indvars.iv37 = phi i64 [ %indvars.iv.next38, %._crit_edge ], [ 4294967295, %.preheader1.preheader ]
  %indvars.iv22 = phi i64 [ %indvars.iv.next23, %._crit_edge ], [ 0, %.preheader1.preheader ]
  %26 = and i64 %indvars.iv37, 4294967295
  %27 = icmp sgt i64 %indvars.iv22, 0
  %28 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv42, i64 %indvars.iv22
  %.pre = load double, double* %28, align 8
  br i1 %27, label %.lr.ph.preheader, label %._crit_edge

.lr.ph.preheader:                                 ; preds = %.preheader1
  %29 = and i64 %indvars.iv37, 1
  %lcmp.mod = icmp eq i64 %29, 0
  br i1 %lcmp.mod, label %.lr.ph.prol.preheader, label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.preheader:                            ; preds = %.lr.ph.preheader
  br label %.lr.ph.prol

.lr.ph.prol:                                      ; preds = %.lr.ph.prol.preheader
  %30 = load double, double* %4, align 8
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 0, i64 %indvars.iv22
  %32 = load double, double* %31, align 8
  %33 = fmul double %30, %32
  %34 = fsub double %.pre, %33
  store double %34, double* %28, align 8
  br label %.lr.ph.prol.loopexit.unr-lcssa

.lr.ph.prol.loopexit.unr-lcssa:                   ; preds = %.lr.ph.preheader, %.lr.ph.prol
  %.lcssa.unr.ph = phi double [ %34, %.lr.ph.prol ], [ undef, %.lr.ph.preheader ]
  %indvars.iv.unr.ph = phi i64 [ 1, %.lr.ph.prol ], [ 0, %.lr.ph.preheader ]
  %.unr.ph = phi double [ %34, %.lr.ph.prol ], [ %.pre, %.lr.ph.preheader ]
  br label %.lr.ph.prol.loopexit

.lr.ph.prol.loopexit:                             ; preds = %.lr.ph.prol.loopexit.unr-lcssa
  %35 = icmp eq i64 %26, 0
  br i1 %35, label %._crit_edge.loopexit, label %.lr.ph.preheader.new

.lr.ph.preheader.new:                             ; preds = %.lr.ph.prol.loopexit
  br label %.lr.ph

.lr.ph:                                           ; preds = %.lr.ph, %.lr.ph.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.unr.ph, %.lr.ph.preheader.new ], [ %indvars.iv.next.1, %.lr.ph ]
  %36 = phi double [ %.unr.ph, %.lr.ph.preheader.new ], [ %48, %.lr.ph ]
  %37 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv42, i64 %indvars.iv
  %38 = load double, double* %37, align 8
  %39 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv, i64 %indvars.iv22
  %40 = load double, double* %39, align 8
  %41 = fmul double %38, %40
  %42 = fsub double %36, %41
  store double %42, double* %28, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %43 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv42, i64 %indvars.iv.next
  %44 = load double, double* %43, align 8
  %45 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv.next, i64 %indvars.iv22
  %46 = load double, double* %45, align 8
  %47 = fmul double %44, %46
  %48 = fsub double %42, %47
  store double %48, double* %28, align 8
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond39.1 = icmp eq i64 %indvars.iv.next, %26
  br i1 %exitcond39.1, label %._crit_edge.loopexit.unr-lcssa, label %.lr.ph

._crit_edge.loopexit.unr-lcssa:                   ; preds = %.lr.ph
  br label %._crit_edge.loopexit

._crit_edge.loopexit:                             ; preds = %.lr.ph.prol.loopexit, %._crit_edge.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %.lr.ph.prol.loopexit ], [ %48, %._crit_edge.loopexit.unr-lcssa ]
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %.preheader1
  %49 = phi double [ %.pre, %.preheader1 ], [ %.lcssa, %._crit_edge.loopexit ]
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv22, i64 %indvars.iv22
  %51 = load double, double* %50, align 8
  %52 = fdiv double %49, %51
  store double %52, double* %28, align 8
  %indvars.iv.next23 = add nuw nsw i64 %indvars.iv22, 1
  %indvars.iv.next38 = add nuw nsw i64 %26, 1
  %exitcond44 = icmp eq i64 %indvars.iv.next23, %indvars.iv42
  br i1 %exitcond44, label %.preheader.us.preheader, label %.preheader1

.preheader.us.preheader:                          ; preds = %._crit_edge
  %53 = and i64 %indvars.iv40, 1
  %lcmp.mod48 = icmp eq i64 %53, 0
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv42, i64 0
  %55 = icmp eq i64 %2, 0
  br label %.preheader.us

._crit_edge10.loopexit:                           ; preds = %._crit_edge8.us
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit, %.preheader3
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv42, 1
  %indvars.iv.next41 = add nuw nsw i64 %2, 1
  %exitcond46 = icmp eq i64 %indvars.iv.next43, 2000
  br i1 %exitcond46, label %56, label %.preheader3

; <label>:56:                                     ; preds = %._crit_edge10
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2000 x double]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.preheader

.preheader:                                       ; preds = %18, %1
  %indvars.iv3 = phi i64 [ 0, %1 ], [ %indvars.iv.next4, %18 ]
  %6 = mul nuw nsw i64 %indvars.iv3, 2000
  br label %7

; <label>:7:                                      ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %8 = add nuw nsw i64 %indvars.iv, %6
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %13) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %7, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %0, i64 %indvars.iv3, i64 %indvars.iv
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2000
  br i1 %exitcond, label %18, label %7

; <label>:18:                                     ; preds = %._crit_edge
  %indvars.iv.next4 = add nuw nsw i64 %indvars.iv3, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next4, 2000
  br i1 %exitcond5, label %19, label %.preheader

; <label>:19:                                     ; preds = %18
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #7
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #6
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
