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
define i32 @main(i32, i8**) local_unnamed_addr #0 {
  %3 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  %4 = bitcast i8* %3 to [2000 x double]*
  tail call fastcc void @init_array(i32 2000, [2000 x double]* %4)
  tail call void (...) @polybench_timer_start() #3
  tail call fastcc void @kernel_cholesky(i32 2000, [2000 x double]* %4)
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
  tail call fastcc void @print_array(i32 2000, [2000 x double]* %4)
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %2, %9
  tail call void @free(i8* %3) #3
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @init_array(i32, [2000 x double]*) unnamed_addr #0 {
  br label %.preheader62.preheader

.preheader62.preheader:                           ; preds = %.preheader61._crit_edge, %2
  %indvars.iv93109 = phi i64 [ 1, %2 ], [ %indvars.iv.next94, %.preheader61._crit_edge ]
  %indvars.iv95108 = phi i64 [ 0, %2 ], [ %indvars.iv.next96, %.preheader61._crit_edge ]
  %3 = mul nuw nsw i64 %indvars.iv95108, 2001
  %4 = add nuw nsw i64 %3, 1
  %scevgep = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %4
  %5 = mul nsw i64 %indvars.iv95108, -8
  br label %.preheader62

.preheader61.preheader:                           ; preds = %.preheader62
  %scevgep115 = bitcast double* %scevgep to i8*
  %6 = add nsw i64 %5, 15992
  %exitcond92106 = icmp eq i64 %indvars.iv95108, 1999
  br i1 %exitcond92106, label %.preheader61._crit_edge.thread, label %.preheader61._crit_edge

.preheader61._crit_edge.thread:                   ; preds = %.preheader61.preheader
  %7 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 1999, i64 1999
  store double 1.000000e+00, double* %7, align 8
  br label %.preheader59

.preheader62:                                     ; preds = %.preheader62, %.preheader62.preheader
  %indvars.iv81104 = phi i64 [ 0, %.preheader62.preheader ], [ %indvars.iv.next82, %.preheader62 ]
  %8 = sub nsw i64 0, %indvars.iv81104
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 2000
  %11 = sitofp i32 %10 to double
  %12 = fdiv double %11, 2.000000e+03
  %13 = fadd double %12, 1.000000e+00
  %14 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv95108, i64 %indvars.iv81104
  store double %13, double* %14, align 8
  %indvars.iv.next82 = add nuw nsw i64 %indvars.iv81104, 1
  %exitcond86 = icmp eq i64 %indvars.iv.next82, %indvars.iv93109
  br i1 %exitcond86, label %.preheader61.preheader, label %.preheader62

.preheader61._crit_edge:                          ; preds = %.preheader61.preheader
  call void @llvm.memset.p0i8.i64(i8* nonnull %scevgep115, i8 0, i64 %6, i32 8, i1 false)
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv95108, i64 %indvars.iv95108
  store double 1.000000e+00, double* %15, align 8
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95108, 1
  %exitcond116 = icmp eq i64 %indvars.iv.next96, 2000
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93109, 1
  br i1 %exitcond116, label %.preheader59.loopexit, label %.preheader62.preheader

.preheader59.loopexit:                            ; preds = %.preheader61._crit_edge
  br label %.preheader59

.preheader59:                                     ; preds = %.preheader59.loopexit, %.preheader61._crit_edge.thread
  %16 = tail call i8* @polybench_alloc_data(i64 4000000, i32 8) #3
  call void @llvm.memset.p0i8.i64(i8* %16, i8 0, i64 32000000, i32 8, i1 false)
  %17 = bitcast i8* %16 to [2000 x [2000 x double]]*
  br label %.preheader58.preheader

.preheader58.preheader:                           ; preds = %67, %.preheader59
  %indvars.iv73101 = phi i64 [ 0, %.preheader59 ], [ %indvars.iv.next74, %67 ]
  %scevgep124 = getelementptr [2000 x double], [2000 x double]* %1, i64 0, i64 %indvars.iv73101
  %scevgep124125 = bitcast double* %scevgep124 to i8*
  %18 = add nuw nsw i64 %indvars.iv73101, 1
  %scevgep126 = getelementptr [2000 x double], [2000 x double]* %1, i64 1999, i64 %18
  %scevgep126127 = bitcast double* %scevgep126 to i8*
  br label %.preheader57.preheader

.preheader57.preheader:                           ; preds = %.preheader58, %.preheader58.preheader
  %indvars.iv69100 = phi i64 [ 0, %.preheader58.preheader ], [ %indvars.iv.next70, %.preheader58 ]
  %19 = mul nuw nsw i64 %indvars.iv69100, 16000
  %scevgep122 = getelementptr i8, i8* %16, i64 %19
  %20 = add nuw nsw i64 %19, 16000
  %scevgep123 = getelementptr i8, i8* %16, i64 %20
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv69100, i64 %indvars.iv73101
  %bound0 = icmp ult i8* %scevgep122, %scevgep126127
  %bound1 = icmp ult i8* %scevgep124125, %scevgep123
  %found.conflict = and i1 %bound0, %bound1
  %bc = bitcast double* %21 to i8*
  %bc128 = bitcast double* %21 to i8*
  %bound0129 = icmp ult i8* %scevgep122, %bc128
  %bound1130 = icmp ult i8* %bc, %scevgep123
  %found.conflict131 = and i1 %bound0129, %bound1130
  %conflict.rdx = or i1 %found.conflict, %found.conflict131
  br i1 %conflict.rdx, label %.preheader57.preheader163, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader57.preheader
  br label %vector.body

.preheader57.preheader163:                        ; preds = %.preheader57.preheader
  br label %.preheader57

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %22 = or i64 %index, 1
  %23 = or i64 %index, 2
  %24 = or i64 %index, 3
  %25 = load double, double* %21, align 8, !alias.scope !1
  %26 = insertelement <2 x double> undef, double %25, i32 0
  %27 = shufflevector <2 x double> %26, <2 x double> undef, <2 x i32> zeroinitializer
  %28 = insertelement <2 x double> undef, double %25, i32 0
  %29 = shufflevector <2 x double> %28, <2 x double> undef, <2 x i32> zeroinitializer
  %30 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %index, i64 %indvars.iv73101
  %31 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %22, i64 %indvars.iv73101
  %32 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %23, i64 %indvars.iv73101
  %33 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %24, i64 %indvars.iv73101
  %34 = load double, double* %30, align 8, !alias.scope !4
  %35 = load double, double* %31, align 8, !alias.scope !4
  %36 = load double, double* %32, align 8, !alias.scope !4
  %37 = load double, double* %33, align 8, !alias.scope !4
  %38 = insertelement <2 x double> undef, double %34, i32 0
  %39 = insertelement <2 x double> %38, double %35, i32 1
  %40 = insertelement <2 x double> undef, double %36, i32 0
  %41 = insertelement <2 x double> %40, double %37, i32 1
  %42 = fmul <2 x double> %27, %39
  %43 = fmul <2 x double> %29, %41
  %44 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv69100, i64 %index
  %45 = bitcast double* %44 to <2 x double>*
  %wide.load = load <2 x double>, <2 x double>* %45, align 8, !alias.scope !6, !noalias !8
  %46 = getelementptr double, double* %44, i64 2
  %47 = bitcast double* %46 to <2 x double>*
  %wide.load133 = load <2 x double>, <2 x double>* %47, align 8, !alias.scope !6, !noalias !8
  %48 = fadd <2 x double> %wide.load, %42
  %49 = fadd <2 x double> %wide.load133, %43
  %50 = bitcast double* %44 to <2 x double>*
  store <2 x double> %48, <2 x double>* %50, align 8, !alias.scope !6, !noalias !8
  %51 = bitcast double* %46 to <2 x double>*
  store <2 x double> %49, <2 x double>* %51, align 8, !alias.scope !6, !noalias !8
  %index.next = add nuw nsw i64 %index, 4
  %52 = icmp eq i64 %index.next, 2000
  br i1 %52, label %.preheader58.loopexit164, label %vector.body, !llvm.loop !9

.preheader57:                                     ; preds = %.preheader57, %.preheader57.preheader163
  %indvars.iv6599 = phi i64 [ 0, %.preheader57.preheader163 ], [ %indvars.iv.next66.1, %.preheader57 ]
  %53 = load double, double* %21, align 8
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv6599, i64 %indvars.iv73101
  %55 = load double, double* %54, align 8
  %56 = fmul double %53, %55
  %57 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv69100, i64 %indvars.iv6599
  %58 = load double, double* %57, align 8
  %59 = fadd double %58, %56
  store double %59, double* %57, align 8
  %indvars.iv.next66 = or i64 %indvars.iv6599, 1
  %60 = load double, double* %21, align 8
  %61 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv.next66, i64 %indvars.iv73101
  %62 = load double, double* %61, align 8
  %63 = fmul double %60, %62
  %64 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv69100, i64 %indvars.iv.next66
  %65 = load double, double* %64, align 8
  %66 = fadd double %65, %63
  store double %66, double* %64, align 8
  %indvars.iv.next66.1 = add nuw nsw i64 %indvars.iv6599, 2
  %exitcond68.1 = icmp eq i64 %indvars.iv.next66.1, 2000
  br i1 %exitcond68.1, label %.preheader58.loopexit, label %.preheader57, !llvm.loop !12

.preheader58.loopexit:                            ; preds = %.preheader57
  br label %.preheader58

.preheader58.loopexit164:                         ; preds = %vector.body
  br label %.preheader58

.preheader58:                                     ; preds = %.preheader58.loopexit164, %.preheader58.loopexit
  %indvars.iv.next70 = add nuw nsw i64 %indvars.iv69100, 1
  %exitcond72 = icmp eq i64 %indvars.iv.next70, 2000
  br i1 %exitcond72, label %67, label %.preheader57.preheader

; <label>:67:                                     ; preds = %.preheader58
  %indvars.iv.next74 = add nuw nsw i64 %indvars.iv73101, 1
  %exitcond113 = icmp eq i64 %indvars.iv.next74, 2000
  br i1 %exitcond113, label %.preheader.preheader.preheader, label %.preheader58.preheader

.preheader.preheader.preheader:                   ; preds = %67
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %.preheader.preheader.preheader, %middle.block135
  %indvars.iv6398 = phi i64 [ %indvars.iv.next64, %middle.block135 ], [ 0, %.preheader.preheader.preheader ]
  %scevgep139 = getelementptr [2000 x double], [2000 x double]* %1, i64 %indvars.iv6398, i64 0
  %scevgep139140 = bitcast double* %scevgep139 to i8*
  %68 = add nuw nsw i64 %indvars.iv6398, 1
  %scevgep141 = getelementptr [2000 x double], [2000 x double]* %1, i64 %68, i64 0
  %scevgep141142 = bitcast double* %scevgep141 to i8*
  %69 = mul nuw nsw i64 %indvars.iv6398, 16000
  %scevgep143 = getelementptr i8, i8* %16, i64 %69
  %70 = add nuw nsw i64 %69, 16000
  %scevgep144 = getelementptr i8, i8* %16, i64 %70
  %bound0145 = icmp ult i8* %scevgep139140, %scevgep144
  %bound1146 = icmp ult i8* %scevgep143, %scevgep141142
  %memcheck.conflict148 = and i1 %bound0145, %bound1146
  br i1 %memcheck.conflict148, label %.preheader.preheader161, label %vector.body134.preheader

vector.body134.preheader:                         ; preds = %.preheader.preheader
  br label %vector.body134

.preheader.preheader161:                          ; preds = %.preheader.preheader
  br label %.preheader

vector.body134:                                   ; preds = %vector.body134, %vector.body134.preheader
  %index151 = phi i64 [ 0, %vector.body134.preheader ], [ %index.next152.1, %vector.body134 ]
  %71 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv6398, i64 %index151
  %72 = bitcast double* %71 to <2 x i64>*
  %wide.load159 = load <2 x i64>, <2 x i64>* %72, align 8, !alias.scope !13
  %73 = getelementptr double, double* %71, i64 2
  %74 = bitcast double* %73 to <2 x i64>*
  %wide.load160 = load <2 x i64>, <2 x i64>* %74, align 8, !alias.scope !13
  %75 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv6398, i64 %index151
  %76 = bitcast double* %75 to <2 x i64>*
  store <2 x i64> %wide.load159, <2 x i64>* %76, align 8, !alias.scope !16, !noalias !13
  %77 = getelementptr double, double* %75, i64 2
  %78 = bitcast double* %77 to <2 x i64>*
  store <2 x i64> %wide.load160, <2 x i64>* %78, align 8, !alias.scope !16, !noalias !13
  %index.next152 = or i64 %index151, 4
  %79 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv6398, i64 %index.next152
  %80 = bitcast double* %79 to <2 x i64>*
  %wide.load159.1 = load <2 x i64>, <2 x i64>* %80, align 8, !alias.scope !13
  %81 = getelementptr double, double* %79, i64 2
  %82 = bitcast double* %81 to <2 x i64>*
  %wide.load160.1 = load <2 x i64>, <2 x i64>* %82, align 8, !alias.scope !13
  %83 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv6398, i64 %index.next152
  %84 = bitcast double* %83 to <2 x i64>*
  store <2 x i64> %wide.load159.1, <2 x i64>* %84, align 8, !alias.scope !16, !noalias !13
  %85 = getelementptr double, double* %83, i64 2
  %86 = bitcast double* %85 to <2 x i64>*
  store <2 x i64> %wide.load160.1, <2 x i64>* %86, align 8, !alias.scope !16, !noalias !13
  %index.next152.1 = add nuw nsw i64 %index151, 8
  %87 = icmp eq i64 %index.next152.1, 2000
  br i1 %87, label %middle.block135.loopexit162, label %vector.body134, !llvm.loop !18

.preheader:                                       ; preds = %.preheader, %.preheader.preheader161
  %indvars.iv97 = phi i64 [ 0, %.preheader.preheader161 ], [ %indvars.iv.next.4, %.preheader ]
  %88 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv6398, i64 %indvars.iv97
  %89 = bitcast double* %88 to i64*
  %90 = load i64, i64* %89, align 8
  %91 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv6398, i64 %indvars.iv97
  %92 = bitcast double* %91 to i64*
  store i64 %90, i64* %92, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv97, 1
  %93 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv6398, i64 %indvars.iv.next
  %94 = bitcast double* %93 to i64*
  %95 = load i64, i64* %94, align 8
  %96 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv6398, i64 %indvars.iv.next
  %97 = bitcast double* %96 to i64*
  store i64 %95, i64* %97, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv97, 2
  %98 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv6398, i64 %indvars.iv.next.1
  %99 = bitcast double* %98 to i64*
  %100 = load i64, i64* %99, align 8
  %101 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv6398, i64 %indvars.iv.next.1
  %102 = bitcast double* %101 to i64*
  store i64 %100, i64* %102, align 8
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv97, 3
  %103 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv6398, i64 %indvars.iv.next.2
  %104 = bitcast double* %103 to i64*
  %105 = load i64, i64* %104, align 8
  %106 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv6398, i64 %indvars.iv.next.2
  %107 = bitcast double* %106 to i64*
  store i64 %105, i64* %107, align 8
  %indvars.iv.next.3 = add nuw nsw i64 %indvars.iv97, 4
  %108 = getelementptr inbounds [2000 x [2000 x double]], [2000 x [2000 x double]]* %17, i64 0, i64 %indvars.iv6398, i64 %indvars.iv.next.3
  %109 = bitcast double* %108 to i64*
  %110 = load i64, i64* %109, align 8
  %111 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv6398, i64 %indvars.iv.next.3
  %112 = bitcast double* %111 to i64*
  store i64 %110, i64* %112, align 8
  %indvars.iv.next.4 = add nuw nsw i64 %indvars.iv97, 5
  %exitcond.4 = icmp eq i64 %indvars.iv.next.4, 2000
  br i1 %exitcond.4, label %middle.block135.loopexit, label %.preheader, !llvm.loop !19

middle.block135.loopexit:                         ; preds = %.preheader
  br label %middle.block135

middle.block135.loopexit162:                      ; preds = %vector.body134
  br label %middle.block135

middle.block135:                                  ; preds = %middle.block135.loopexit162, %middle.block135.loopexit
  %indvars.iv.next64 = add nuw nsw i64 %indvars.iv6398, 1
  %exitcond112 = icmp eq i64 %indvars.iv.next64, 2000
  br i1 %exitcond112, label %113, label %.preheader.preheader

; <label>:113:                                    ; preds = %middle.block135
  tail call void @free(i8* nonnull %16) #3
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_cholesky(i32, [2000 x double]*) unnamed_addr #0 {
  br label %.preheader33.preheader

.preheader33.preheader:                           ; preds = %.preheader32._crit_edge, %2
  %indvars.iv = phi i2 [ %indvars.iv.next68, %.preheader32._crit_edge ], [ 0, %2 ]
  %indvars.iv4757 = phi i64 [ 0, %2 ], [ %indvars.iv.next48, %.preheader32._crit_edge ]
  %3 = zext i2 %indvars.iv to i64
  %4 = add nsw i64 %indvars.iv4757, -1
  %exitcond4151 = icmp eq i64 %indvars.iv4757, 0
  br i1 %exitcond4151, label %.preheader32._crit_edge, label %.preheader.preheader.preheader

.preheader.preheader.preheader:                   ; preds = %.preheader33.preheader
  %.phi.trans.insert = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4757, i64 0
  %.pre62 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4757, i64 0
  %5 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4757, i64 0
  br label %.preheader.preheader

.lr.ph56:                                         ; preds = %.preheader33
  %6 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4757, i64 %indvars.iv4757
  %.pre61 = load double, double* %6, align 8
  %xtraiter63 = and i64 %indvars.iv4757, 3
  %lcmp.mod64 = icmp eq i64 %xtraiter63, 0
  br i1 %lcmp.mod64, label %.preheader32.prol.loopexit, label %.preheader32.prol.preheader

.preheader32.prol.preheader:                      ; preds = %.lr.ph56
  br label %.preheader32.prol

.preheader32.prol:                                ; preds = %.preheader32.prol, %.preheader32.prol.preheader
  %7 = phi double [ %.pre61, %.preheader32.prol.preheader ], [ %11, %.preheader32.prol ]
  %indvars.iv4255.prol = phi i64 [ 0, %.preheader32.prol.preheader ], [ %indvars.iv.next43.prol, %.preheader32.prol ]
  %prol.iter = phi i64 [ %xtraiter63, %.preheader32.prol.preheader ], [ %prol.iter.sub, %.preheader32.prol ]
  %8 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4757, i64 %indvars.iv4255.prol
  %9 = load double, double* %8, align 8
  %10 = fmul double %9, %9
  %11 = fsub double %7, %10
  store double %11, double* %6, align 8
  %indvars.iv.next43.prol = add nuw nsw i64 %indvars.iv4255.prol, 1
  %prol.iter.sub = add nsw i64 %prol.iter, -1
  %prol.iter.cmp = icmp eq i64 %prol.iter.sub, 0
  br i1 %prol.iter.cmp, label %.preheader32.prol.loopexit.unr-lcssa, label %.preheader32.prol, !llvm.loop !20

.preheader32.prol.loopexit.unr-lcssa:             ; preds = %.preheader32.prol
  br label %.preheader32.prol.loopexit

.preheader32.prol.loopexit:                       ; preds = %.lr.ph56, %.preheader32.prol.loopexit.unr-lcssa
  %.unr65 = phi double [ %.pre61, %.lr.ph56 ], [ %11, %.preheader32.prol.loopexit.unr-lcssa ]
  %indvars.iv4255.unr = phi i64 [ 0, %.lr.ph56 ], [ %3, %.preheader32.prol.loopexit.unr-lcssa ]
  %12 = icmp ult i64 %4, 3
  br i1 %12, label %.preheader32._crit_edge.loopexit, label %.lr.ph56.new

.lr.ph56.new:                                     ; preds = %.preheader32.prol.loopexit
  br label %.preheader32

.preheader.preheader:                             ; preds = %.preheader.preheader.preheader, %.preheader33
  %indvars.iv3652 = phi i64 [ %indvars.iv.next37, %.preheader33 ], [ 0, %.preheader.preheader.preheader ]
  %exitcond49 = icmp eq i64 %indvars.iv3652, 0
  br i1 %exitcond49, label %.preheader.preheader..preheader33_crit_edge, label %.lr.ph

.preheader.preheader..preheader33_crit_edge:      ; preds = %.preheader.preheader
  %.pre60 = load double, double* %.phi.trans.insert, align 8
  br label %.preheader33

.lr.ph:                                           ; preds = %.preheader.preheader
  %13 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4757, i64 %indvars.iv3652
  %.pre = load double, double* %13, align 8
  %xtraiter = and i64 %indvars.iv3652, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  br i1 %lcmp.mod, label %.preheader.prol.loopexit.unr-lcssa, label %.preheader.prol.preheader

.preheader.prol.preheader:                        ; preds = %.lr.ph
  br label %.preheader.prol

.preheader.prol:                                  ; preds = %.preheader.prol.preheader
  %14 = load double, double* %5, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv3652, i64 0
  %16 = load double, double* %15, align 8
  %17 = fmul double %14, %16
  %18 = fsub double %.pre, %17
  store double %18, double* %13, align 8
  br label %.preheader.prol.loopexit.unr-lcssa

.preheader.prol.loopexit.unr-lcssa:               ; preds = %.lr.ph, %.preheader.prol
  %.lcssa.unr.ph = phi double [ %18, %.preheader.prol ], [ undef, %.lr.ph ]
  %.unr.ph = phi double [ %18, %.preheader.prol ], [ %.pre, %.lr.ph ]
  %indvars.iv50.unr.ph = phi i64 [ 1, %.preheader.prol ], [ 0, %.lr.ph ]
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %.preheader.prol.loopexit.unr-lcssa
  %19 = icmp eq i64 %indvars.iv3652, 1
  br i1 %19, label %.preheader33.loopexit, label %.lr.ph.new

.lr.ph.new:                                       ; preds = %.preheader.prol.loopexit
  br label %.preheader

.preheader:                                       ; preds = %.preheader, %.lr.ph.new
  %20 = phi double [ %.unr.ph, %.lr.ph.new ], [ %32, %.preheader ]
  %indvars.iv50 = phi i64 [ %indvars.iv50.unr.ph, %.lr.ph.new ], [ %indvars.iv.next.1, %.preheader ]
  %21 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4757, i64 %indvars.iv50
  %22 = load double, double* %21, align 8
  %23 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv3652, i64 %indvars.iv50
  %24 = load double, double* %23, align 8
  %25 = fmul double %22, %24
  %26 = fsub double %20, %25
  store double %26, double* %13, align 8
  %indvars.iv.next = add nuw nsw i64 %indvars.iv50, 1
  %27 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4757, i64 %indvars.iv.next
  %28 = load double, double* %27, align 8
  %29 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv3652, i64 %indvars.iv.next
  %30 = load double, double* %29, align 8
  %31 = fmul double %28, %30
  %32 = fsub double %26, %31
  store double %32, double* %13, align 8
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv50, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %indvars.iv3652
  br i1 %exitcond.1, label %.preheader33.loopexit.unr-lcssa, label %.preheader

.preheader33.loopexit.unr-lcssa:                  ; preds = %.preheader
  br label %.preheader33.loopexit

.preheader33.loopexit:                            ; preds = %.preheader.prol.loopexit, %.preheader33.loopexit.unr-lcssa
  %.lcssa = phi double [ %.lcssa.unr.ph, %.preheader.prol.loopexit ], [ %32, %.preheader33.loopexit.unr-lcssa ]
  br label %.preheader33

.preheader33:                                     ; preds = %.preheader33.loopexit, %.preheader.preheader..preheader33_crit_edge
  %.pre-phi = phi double* [ %.pre62, %.preheader.preheader..preheader33_crit_edge ], [ %13, %.preheader33.loopexit ]
  %33 = phi double [ %.pre60, %.preheader.preheader..preheader33_crit_edge ], [ %.lcssa, %.preheader33.loopexit ]
  %34 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv3652, i64 %indvars.iv3652
  %35 = load double, double* %34, align 8
  %36 = fdiv double %33, %35
  store double %36, double* %.pre-phi, align 8
  %indvars.iv.next37 = add nuw nsw i64 %indvars.iv3652, 1
  %exitcond41 = icmp eq i64 %indvars.iv.next37, %indvars.iv4757
  br i1 %exitcond41, label %.lr.ph56, label %.preheader.preheader

.preheader32:                                     ; preds = %.preheader32, %.lr.ph56.new
  %37 = phi double [ %.unr65, %.lr.ph56.new ], [ %53, %.preheader32 ]
  %indvars.iv4255 = phi i64 [ %indvars.iv4255.unr, %.lr.ph56.new ], [ %indvars.iv.next43.3, %.preheader32 ]
  %38 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4757, i64 %indvars.iv4255
  %39 = load double, double* %38, align 8
  %40 = fmul double %39, %39
  %41 = fsub double %37, %40
  store double %41, double* %6, align 8
  %indvars.iv.next43 = add nuw nsw i64 %indvars.iv4255, 1
  %42 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4757, i64 %indvars.iv.next43
  %43 = load double, double* %42, align 8
  %44 = fmul double %43, %43
  %45 = fsub double %41, %44
  store double %45, double* %6, align 8
  %indvars.iv.next43.1 = add nsw i64 %indvars.iv4255, 2
  %46 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4757, i64 %indvars.iv.next43.1
  %47 = load double, double* %46, align 8
  %48 = fmul double %47, %47
  %49 = fsub double %45, %48
  store double %49, double* %6, align 8
  %indvars.iv.next43.2 = add nsw i64 %indvars.iv4255, 3
  %50 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4757, i64 %indvars.iv.next43.2
  %51 = load double, double* %50, align 8
  %52 = fmul double %51, %51
  %53 = fsub double %49, %52
  store double %53, double* %6, align 8
  %indvars.iv.next43.3 = add nuw nsw i64 %indvars.iv4255, 4
  %exitcond46.3 = icmp eq i64 %indvars.iv.next43.3, %indvars.iv4757
  br i1 %exitcond46.3, label %.preheader32._crit_edge.loopexit.unr-lcssa, label %.preheader32

.preheader32._crit_edge.loopexit.unr-lcssa:       ; preds = %.preheader32
  br label %.preheader32._crit_edge.loopexit

.preheader32._crit_edge.loopexit:                 ; preds = %.preheader32.prol.loopexit, %.preheader32._crit_edge.loopexit.unr-lcssa
  br label %.preheader32._crit_edge

.preheader32._crit_edge:                          ; preds = %.preheader32._crit_edge.loopexit, %.preheader33.preheader
  %54 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv4757, i64 %indvars.iv4757
  %55 = load double, double* %54, align 8
  %56 = tail call double @sqrt(double %55) #3
  store double %56, double* %54, align 8
  %indvars.iv.next48 = add nuw nsw i64 %indvars.iv4757, 1
  %exitcond58 = icmp eq i64 %indvars.iv.next48, 2000
  %indvars.iv.next68 = add i2 %indvars.iv, 1
  br i1 %exitcond58, label %57, label %.preheader33.preheader

; <label>:57:                                     ; preds = %.preheader32._crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, [2000 x double]*) unnamed_addr #0 {
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #5
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.preheader

.preheader.preheader:                             ; preds = %18, %2
  %indvars.iv1117 = phi i64 [ 1, %2 ], [ %indvars.iv.next12, %18 ]
  %indvars.iv1316 = phi i64 [ 0, %2 ], [ %indvars.iv.next14, %18 ]
  %7 = mul nuw nsw i64 %indvars.iv1316, 2000
  br label %.preheader._crit_edge

.preheader._crit_edge:                            ; preds = %.preheader, %.preheader.preheader
  %indvars.iv15 = phi i64 [ 0, %.preheader.preheader ], [ %indvars.iv.next, %.preheader ]
  %8 = add nuw nsw i64 %indvars.iv15, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %.preheader

; <label>:12:                                     ; preds = %.preheader._crit_edge
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #5
  br label %.preheader

.preheader:                                       ; preds = %.preheader._crit_edge, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2000 x double], [2000 x double]* %1, i64 %indvars.iv1316, i64 %indvars.iv15
  %16 = load double, double* %15, align 8
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([8 x i8], [8 x i8]* @.str.5, i64 0, i64 0), double %16) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv15, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %indvars.iv1117
  br i1 %exitcond, label %18, label %.preheader._crit_edge

; <label>:18:                                     ; preds = %.preheader
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv1316, 1
  %exitcond18 = icmp eq i64 %indvars.iv.next14, 2000
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv1117, 1
  br i1 %exitcond18, label %19, label %.preheader.preheader

; <label>:19:                                     ; preds = %18
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([2 x i8], [2 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #5
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
