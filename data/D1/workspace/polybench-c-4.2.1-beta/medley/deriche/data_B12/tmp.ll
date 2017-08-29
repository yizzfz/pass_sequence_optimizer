; ModuleID = 'A.ll'
source_filename = "deriche.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"imgOut\00", align 1
@.str.5 = private unnamed_addr constant [7 x i8] c"%0.2f \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) #0 {
  %3 = alloca float, align 4
  %4 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %5 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %6 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %7 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %8 = bitcast i8* %4 to [2160 x float]*
  %9 = bitcast i8* %5 to [2160 x float]*
  call void @init_array(i32 4096, i32 2160, float* nonnull %3, [2160 x float]* %8)
  call void (...) @polybench_timer_start() #5
  %10 = load float, float* %3, align 4
  %11 = bitcast i8* %6 to [2160 x float]*
  %12 = bitcast i8* %7 to [2160 x float]*
  call void @kernel_deriche(i32 4096, i32 2160, float %10, [2160 x float]* %8, [2160 x float]* %9, [2160 x float]* %11, [2160 x float]* %12)
  call void (...) @polybench_timer_stop() #5
  call void (...) @polybench_timer_print() #5
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %19

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to [2160 x float]*
  call void @print_array(i32 4096, i32 2160, [2160 x float]* %18)
  br label %19

; <label>:19:                                     ; preds = %14, %17, %2
  call void @free(i8* %4) #5
  call void @free(i8* %5) #5
  call void @free(i8* %6) #5
  call void @free(i8* %7) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, float* nocapture, [2160 x float]* nocapture) #2 {
.preheader.lr.ph.split.us:
  store float 2.500000e-01, float* %2, align 4
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph.split.us
  %indvars.iv5 = phi i64 [ %indvars.iv.next6, %._crit_edge.us ], [ 0, %.preheader.lr.ph.split.us ]
  %4 = mul nuw nsw i64 %indvars.iv5, 313
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %4, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %.preheader.us
  %index = phi i64 [ 0, %.preheader.us ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %.preheader.us ], [ %vec.ind.next, %vector.body ]
  %5 = mul nuw nsw <4 x i64> %vec.ind, <i64 991, i64 991, i64 991, i64 991>
  %6 = add nsw <4 x i64> %5, %broadcast.splat
  %7 = trunc <4 x i64> %6 to <4 x i32>
  %8 = srem <4 x i32> %7, <i32 65536, i32 65536, i32 65536, i32 65536>
  %9 = sitofp <4 x i32> %8 to <4 x float>
  %10 = fdiv <4 x float> %9, <float 6.553500e+04, float 6.553500e+04, float 6.553500e+04, float 6.553500e+04>
  %11 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv5, i64 %index
  %12 = bitcast float* %11 to <4 x float>*
  store <4 x float> %10, <4 x float>* %12, align 4
  %index.next = add nuw nsw i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %13 = icmp eq i64 %index.next, 2160
  br i1 %13, label %._crit_edge.us, label %vector.body, !llvm.loop !1

._crit_edge.us:                                   ; preds = %vector.body
  %indvars.iv.next6 = add nuw nsw i64 %indvars.iv5, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next6, 4096
  br i1 %exitcond8, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_deriche(i32, i32, float, [2160 x float]* nocapture readonly, [2160 x float]* nocapture, [2160 x float]* nocapture, [2160 x float]* nocapture) #0 {
.preheader178.us.preheader:
  %7 = fsub float -0.000000e+00, %2
  %8 = tail call float @expf(float %7) #5
  %9 = fsub float 1.000000e+00, %8
  %10 = tail call float @expf(float %7) #5
  %11 = fsub float 1.000000e+00, %10
  %12 = fmul float %9, %11
  %13 = fmul float %2, 2.000000e+00
  %14 = tail call float @expf(float %7) #5
  %15 = fmul float %13, %14
  %16 = fadd float %15, 1.000000e+00
  %17 = tail call float @expf(float %13) #5
  %18 = fsub float %16, %17
  %19 = fdiv float %12, %18
  %20 = tail call float @expf(float %7) #5
  %21 = fmul float %20, %19
  %22 = fadd float %2, -1.000000e+00
  %23 = fmul float %22, %21
  %24 = tail call float @expf(float %7) #5
  %25 = fmul float %2, -2.000000e+00
  %26 = tail call float @expf(float %25) #5
  %exp2 = tail call float @llvm.exp2.f32(float %7)
  %27 = tail call float @expf(float %25) #5
  %28 = fsub float -0.000000e+00, %27
  br label %.preheader178.us.new

.preheader178.us.new:                             ; preds = %._crit_edge216.us, %.preheader178.us.preheader
  %indvars.iv254.us = phi i64 [ %indvars.iv.next255.us, %._crit_edge216.us ], [ 0, %.preheader178.us.preheader ]
  br label %29

; <label>:29:                                     ; preds = %29, %.preheader178.us.new
  %indvars.iv250.us = phi i64 [ 0, %.preheader178.us.new ], [ %indvars.iv.next251.us.1, %29 ]
  %.0155213.us = phi float [ 0.000000e+00, %.preheader178.us.new ], [ %51, %29 ]
  %.0157212.us = phi float [ 0.000000e+00, %.preheader178.us.new ], [ %49, %29 ]
  %.0159211.us = phi float [ 0.000000e+00, %.preheader178.us.new ], [ %38, %29 ]
  %30 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv254.us, i64 %indvars.iv250.us
  %31 = load float, float* %30, align 4
  %32 = fmul float %19, %31
  %33 = fmul float %23, %.0155213.us
  %34 = fadd float %33, %32
  %35 = fmul float %exp2, %.0157212.us
  %36 = fadd float %35, %34
  %37 = fmul float %.0159211.us, %28
  %38 = fadd float %37, %36
  %39 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv254.us, i64 %indvars.iv250.us
  store float %38, float* %39, align 4
  %40 = load float, float* %30, align 4
  %indvars.iv.next251.us = or i64 %indvars.iv250.us, 1
  %41 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv254.us, i64 %indvars.iv.next251.us
  %42 = load float, float* %41, align 4
  %43 = fmul float %19, %42
  %44 = fmul float %23, %40
  %45 = fadd float %44, %43
  %46 = fmul float %exp2, %38
  %47 = fadd float %46, %45
  %48 = fmul float %.0157212.us, %28
  %49 = fadd float %48, %47
  %50 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv254.us, i64 %indvars.iv.next251.us
  store float %49, float* %50, align 4
  %51 = load float, float* %41, align 4
  %indvars.iv.next251.us.1 = add nuw nsw i64 %indvars.iv250.us, 2
  %exitcond253.us.1 = icmp eq i64 %indvars.iv.next251.us.1, 2160
  br i1 %exitcond253.us.1, label %._crit_edge216.us, label %29

._crit_edge216.us:                                ; preds = %29
  %indvars.iv.next255.us = add nuw nsw i64 %indvars.iv254.us, 1
  %exitcond257.us = icmp eq i64 %indvars.iv.next255.us, 4096
  br i1 %exitcond257.us, label %.preheader176.us.new.preheader, label %.preheader178.us.new

.preheader176.us.new.preheader:                   ; preds = %._crit_edge216.us
  %52 = fadd float %2, 1.000000e+00
  %53 = fmul float %19, %26
  %54 = fmul float %24, %19
  %55 = fmul float %52, %54
  %56 = fsub float -0.000000e+00, %53
  br label %.preheader176.us.new

.preheader176.us.new:                             ; preds = %.preheader176.us.new.preheader, %._crit_edge209.us
  %indvars.iv246.us = phi i64 [ %indvars.iv.next247.us, %._crit_edge209.us ], [ 0, %.preheader176.us.new.preheader ]
  br label %57

; <label>:57:                                     ; preds = %57, %.preheader176.us.new
  %indvars.iv244.us.in = phi i64 [ 2160, %.preheader176.us.new ], [ %indvars.iv244.us.1, %57 ]
  %.0161206.us = phi float [ 0.000000e+00, %.preheader176.us.new ], [ %77, %57 ]
  %.0162205.us = phi float [ 0.000000e+00, %.preheader176.us.new ], [ %67, %57 ]
  %.0165204.us = phi float [ 0.000000e+00, %.preheader176.us.new ], [ %74, %57 ]
  %.0167203.us = phi float [ 0.000000e+00, %.preheader176.us.new ], [ %64, %57 ]
  %indvars.iv244.us = add nsw i64 %indvars.iv244.us.in, -1
  %58 = fmul float %55, %.0161206.us
  %59 = fmul float %.0162205.us, %56
  %60 = fadd float %59, %58
  %61 = fmul float %exp2, %.0165204.us
  %62 = fadd float %61, %60
  %63 = fmul float %.0167203.us, %28
  %64 = fadd float %63, %62
  %65 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv246.us, i64 %indvars.iv244.us
  store float %64, float* %65, align 4
  %66 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv246.us, i64 %indvars.iv244.us
  %67 = load float, float* %66, align 4
  %indvars.iv244.us.1 = add nsw i64 %indvars.iv244.us.in, -2
  %68 = fmul float %55, %67
  %69 = fmul float %.0161206.us, %56
  %70 = fadd float %69, %68
  %71 = fmul float %exp2, %64
  %72 = fadd float %71, %70
  %73 = fmul float %.0165204.us, %28
  %74 = fadd float %73, %72
  %75 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv246.us, i64 %indvars.iv244.us.1
  store float %74, float* %75, align 4
  %76 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv246.us, i64 %indvars.iv244.us.1
  %77 = load float, float* %76, align 4
  %78 = icmp sgt i64 %indvars.iv244.us.in, 2
  br i1 %78, label %57, label %._crit_edge209.us

._crit_edge209.us:                                ; preds = %57
  %indvars.iv.next247.us = add nuw nsw i64 %indvars.iv246.us, 1
  %exitcond249.us = icmp eq i64 %indvars.iv.next247.us, 4096
  br i1 %exitcond249.us, label %.preheader174.us.new.preheader, label %.preheader176.us.new

.preheader174.us.new.preheader:                   ; preds = %._crit_edge209.us
  br label %.preheader174.us.new

.preheader174.us.new:                             ; preds = %.preheader174.us.new.preheader, %._crit_edge200.us
  %indvars.iv240.us = phi i64 [ %79, %._crit_edge200.us ], [ 0, %.preheader174.us.new.preheader ]
  %scevgep = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 0
  %79 = add nuw nsw i64 %indvars.iv240.us, 1
  %scevgep285 = getelementptr [2160 x float], [2160 x float]* %4, i64 %79, i64 0
  %scevgep287 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv240.us, i64 0
  %scevgep289 = getelementptr [2160 x float], [2160 x float]* %5, i64 %79, i64 0
  %scevgep291 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv240.us, i64 0
  %scevgep293 = getelementptr [2160 x float], [2160 x float]* %6, i64 %79, i64 0
  %bound0 = icmp ult float* %scevgep, %scevgep289
  %bound1 = icmp ult float* %scevgep287, %scevgep285
  %found.conflict = and i1 %bound0, %bound1
  %bound0295 = icmp ult float* %scevgep, %scevgep293
  %bound1296 = icmp ult float* %scevgep291, %scevgep285
  %found.conflict297 = and i1 %bound0295, %bound1296
  %conflict.rdx = or i1 %found.conflict, %found.conflict297
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader174.us.new
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader174.us.new
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next.1, %vector.body ]
  %offset.idx = shl i64 %index, 1
  %80 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv240.us, i64 %offset.idx
  %81 = bitcast float* %80 to <8 x float>*
  %wide.vec = load <8 x float>, <8 x float>* %81, align 4, !alias.scope !4
  %82 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv240.us, i64 %offset.idx
  %83 = bitcast float* %82 to <8 x float>*
  %wide.vec299 = load <8 x float>, <8 x float>* %83, align 4, !alias.scope !7
  %84 = fadd <8 x float> %wide.vec, %wide.vec299
  %85 = or i64 %offset.idx, 1
  %86 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 %85
  %87 = getelementptr float, float* %86, i64 -1
  %88 = bitcast float* %87 to <8 x float>*
  store <8 x float> %84, <8 x float>* %88, align 4, !alias.scope !9, !noalias !11
  %index.next = shl i64 %index, 1
  %offset.idx.1 = or i64 %index.next, 8
  %89 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv240.us, i64 %offset.idx.1
  %90 = bitcast float* %89 to <8 x float>*
  %wide.vec.1 = load <8 x float>, <8 x float>* %90, align 4, !alias.scope !4
  %91 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv240.us, i64 %offset.idx.1
  %92 = bitcast float* %91 to <8 x float>*
  %wide.vec299.1 = load <8 x float>, <8 x float>* %92, align 4, !alias.scope !7
  %93 = fadd <8 x float> %wide.vec.1, %wide.vec299.1
  %94 = or i64 %index.next, 9
  %95 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 %94
  %96 = getelementptr float, float* %95, i64 -1
  %97 = bitcast float* %96 to <8 x float>*
  store <8 x float> %93, <8 x float>* %97, align 4, !alias.scope !9, !noalias !11
  %index.next.1 = add nsw i64 %index, 8
  %98 = icmp eq i64 %index.next.1, 1080
  br i1 %98, label %._crit_edge200.us.loopexit347, label %vector.body, !llvm.loop !12

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv236.us = phi i64 [ %indvars.iv.next237.us.1, %scalar.ph ], [ 0, %scalar.ph.preheader ]
  %99 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv240.us, i64 %indvars.iv236.us
  %100 = load float, float* %99, align 4
  %101 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv240.us, i64 %indvars.iv236.us
  %102 = load float, float* %101, align 4
  %103 = fadd float %100, %102
  %104 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 %indvars.iv236.us
  store float %103, float* %104, align 4
  %indvars.iv.next237.us = or i64 %indvars.iv236.us, 1
  %105 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv240.us, i64 %indvars.iv.next237.us
  %106 = load float, float* %105, align 4
  %107 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv240.us, i64 %indvars.iv.next237.us
  %108 = load float, float* %107, align 4
  %109 = fadd float %106, %108
  %110 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 %indvars.iv.next237.us
  store float %109, float* %110, align 4
  %indvars.iv.next237.us.1 = add nuw nsw i64 %indvars.iv236.us, 2
  %exitcond239.us.1 = icmp eq i64 %indvars.iv.next237.us.1, 2160
  br i1 %exitcond239.us.1, label %._crit_edge200.us.loopexit, label %scalar.ph, !llvm.loop !13

._crit_edge200.us.loopexit:                       ; preds = %scalar.ph
  br label %._crit_edge200.us

._crit_edge200.us.loopexit347:                    ; preds = %vector.body
  br label %._crit_edge200.us

._crit_edge200.us:                                ; preds = %._crit_edge200.us.loopexit347, %._crit_edge200.us.loopexit
  %exitcond243.us = icmp eq i64 %79, 4096
  br i1 %exitcond243.us, label %.preheader172.us.new.preheader, label %.preheader174.us.new

.preheader172.us.new.preheader:                   ; preds = %._crit_edge200.us
  br label %.preheader172.us.new

.preheader172.us.new:                             ; preds = %.preheader172.us.new.preheader, %._crit_edge196.us
  %indvars.iv232.us = phi i64 [ %indvars.iv.next233.us, %._crit_edge196.us ], [ 0, %.preheader172.us.new.preheader ]
  br label %111

; <label>:111:                                    ; preds = %111, %.preheader172.us.new
  %indvars.iv228.us = phi i64 [ 0, %.preheader172.us.new ], [ %indvars.iv.next229.us.1, %111 ]
  %.0156193.us = phi float [ 0.000000e+00, %.preheader172.us.new ], [ %133, %111 ]
  %.1158192.us = phi float [ 0.000000e+00, %.preheader172.us.new ], [ %131, %111 ]
  %.1160191.us = phi float [ 0.000000e+00, %.preheader172.us.new ], [ %120, %111 ]
  %112 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv228.us, i64 %indvars.iv232.us
  %113 = load float, float* %112, align 4
  %114 = fmul float %19, %113
  %115 = fmul float %23, %.0156193.us
  %116 = fadd float %115, %114
  %117 = fmul float %exp2, %.1158192.us
  %118 = fadd float %117, %116
  %119 = fmul float %.1160191.us, %28
  %120 = fadd float %119, %118
  %121 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv228.us, i64 %indvars.iv232.us
  store float %120, float* %121, align 4
  %122 = load float, float* %112, align 4
  %indvars.iv.next229.us = or i64 %indvars.iv228.us, 1
  %123 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next229.us, i64 %indvars.iv232.us
  %124 = load float, float* %123, align 4
  %125 = fmul float %19, %124
  %126 = fmul float %23, %122
  %127 = fadd float %126, %125
  %128 = fmul float %exp2, %120
  %129 = fadd float %128, %127
  %130 = fmul float %.1158192.us, %28
  %131 = fadd float %130, %129
  %132 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv.next229.us, i64 %indvars.iv232.us
  store float %131, float* %132, align 4
  %133 = load float, float* %123, align 4
  %indvars.iv.next229.us.1 = add nuw nsw i64 %indvars.iv228.us, 2
  %exitcond231.us.1 = icmp eq i64 %indvars.iv.next229.us.1, 4096
  br i1 %exitcond231.us.1, label %._crit_edge196.us, label %111

._crit_edge196.us:                                ; preds = %111
  %indvars.iv.next233.us = add nuw nsw i64 %indvars.iv232.us, 1
  %exitcond235.us = icmp eq i64 %indvars.iv.next233.us, 2160
  br i1 %exitcond235.us, label %.preheader170.us.new.preheader, label %.preheader172.us.new

.preheader170.us.new.preheader:                   ; preds = %._crit_edge196.us
  br label %.preheader170.us.new

.preheader170.us.new:                             ; preds = %.preheader170.us.new.preheader, %._crit_edge189.us
  %indvars.iv224.us = phi i64 [ %indvars.iv.next225.us, %._crit_edge189.us ], [ 0, %.preheader170.us.new.preheader ]
  br label %134

; <label>:134:                                    ; preds = %134, %.preheader170.us.new
  %indvars.iv222.us.in = phi i64 [ 4096, %.preheader170.us.new ], [ %indvars.iv222.us.1, %134 ]
  %.0163186.us = phi float [ 0.000000e+00, %.preheader170.us.new ], [ %154, %134 ]
  %.0164185.us = phi float [ 0.000000e+00, %.preheader170.us.new ], [ %144, %134 ]
  %.1166184.us = phi float [ 0.000000e+00, %.preheader170.us.new ], [ %151, %134 ]
  %.1168183.us = phi float [ 0.000000e+00, %.preheader170.us.new ], [ %141, %134 ]
  %indvars.iv222.us = add nsw i64 %indvars.iv222.us.in, -1
  %135 = fmul float %55, %.0163186.us
  %136 = fmul float %.0164185.us, %56
  %137 = fadd float %136, %135
  %138 = fmul float %exp2, %.1166184.us
  %139 = fadd float %138, %137
  %140 = fmul float %.1168183.us, %28
  %141 = fadd float %140, %139
  %142 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv222.us, i64 %indvars.iv224.us
  store float %141, float* %142, align 4
  %143 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv222.us, i64 %indvars.iv224.us
  %144 = load float, float* %143, align 4
  %indvars.iv222.us.1 = add nsw i64 %indvars.iv222.us.in, -2
  %145 = fmul float %55, %144
  %146 = fmul float %.0163186.us, %56
  %147 = fadd float %146, %145
  %148 = fmul float %exp2, %141
  %149 = fadd float %148, %147
  %150 = fmul float %.1166184.us, %28
  %151 = fadd float %150, %149
  %152 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv222.us.1, i64 %indvars.iv224.us
  store float %151, float* %152, align 4
  %153 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv222.us.1, i64 %indvars.iv224.us
  %154 = load float, float* %153, align 4
  %155 = icmp sgt i64 %indvars.iv222.us.in, 2
  br i1 %155, label %134, label %._crit_edge189.us

._crit_edge189.us:                                ; preds = %134
  %indvars.iv.next225.us = add nuw nsw i64 %indvars.iv224.us, 1
  %exitcond227.us = icmp eq i64 %indvars.iv.next225.us, 2160
  br i1 %exitcond227.us, label %.preheader.us.new.preheader, label %.preheader170.us.new

.preheader.us.new.preheader:                      ; preds = %._crit_edge189.us
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %._crit_edge.us
  %indvars.iv218.us = phi i64 [ %156, %._crit_edge.us ], [ 0, %.preheader.us.new.preheader ]
  %scevgep307 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 0
  %156 = add nuw nsw i64 %indvars.iv218.us, 1
  %scevgep309 = getelementptr [2160 x float], [2160 x float]* %4, i64 %156, i64 0
  %scevgep311 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv218.us, i64 0
  %scevgep313 = getelementptr [2160 x float], [2160 x float]* %5, i64 %156, i64 0
  %scevgep315 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv218.us, i64 0
  %scevgep317 = getelementptr [2160 x float], [2160 x float]* %6, i64 %156, i64 0
  %bound0319 = icmp ult float* %scevgep307, %scevgep313
  %bound1320 = icmp ult float* %scevgep311, %scevgep309
  %found.conflict321 = and i1 %bound0319, %bound1320
  %bound0322 = icmp ult float* %scevgep307, %scevgep317
  %bound1323 = icmp ult float* %scevgep315, %scevgep309
  %found.conflict324 = and i1 %bound0322, %bound1323
  %conflict.rdx325 = or i1 %found.conflict321, %found.conflict324
  br i1 %conflict.rdx325, label %scalar.ph304.preheader, label %vector.body302.preheader

vector.body302.preheader:                         ; preds = %.preheader.us.new
  br label %vector.body302

scalar.ph304.preheader:                           ; preds = %.preheader.us.new
  br label %scalar.ph304

vector.body302:                                   ; preds = %vector.body302, %vector.body302.preheader
  %index329 = phi i64 [ 0, %vector.body302.preheader ], [ %index.next330.1, %vector.body302 ]
  %offset.idx333 = shl i64 %index329, 1
  %157 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv218.us, i64 %offset.idx333
  %158 = bitcast float* %157 to <8 x float>*
  %wide.vec337 = load <8 x float>, <8 x float>* %158, align 4, !alias.scope !14
  %159 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv218.us, i64 %offset.idx333
  %160 = bitcast float* %159 to <8 x float>*
  %wide.vec340 = load <8 x float>, <8 x float>* %160, align 4, !alias.scope !17
  %161 = fadd <8 x float> %wide.vec337, %wide.vec340
  %162 = or i64 %offset.idx333, 1
  %163 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 %162
  %164 = getelementptr float, float* %163, i64 -1
  %165 = bitcast float* %164 to <8 x float>*
  store <8 x float> %161, <8 x float>* %165, align 4, !alias.scope !19, !noalias !21
  %index.next330 = shl i64 %index329, 1
  %offset.idx333.1 = or i64 %index.next330, 8
  %166 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv218.us, i64 %offset.idx333.1
  %167 = bitcast float* %166 to <8 x float>*
  %wide.vec337.1 = load <8 x float>, <8 x float>* %167, align 4, !alias.scope !14
  %168 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv218.us, i64 %offset.idx333.1
  %169 = bitcast float* %168 to <8 x float>*
  %wide.vec340.1 = load <8 x float>, <8 x float>* %169, align 4, !alias.scope !17
  %170 = fadd <8 x float> %wide.vec337.1, %wide.vec340.1
  %171 = or i64 %index.next330, 9
  %172 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 %171
  %173 = getelementptr float, float* %172, i64 -1
  %174 = bitcast float* %173 to <8 x float>*
  store <8 x float> %170, <8 x float>* %174, align 4, !alias.scope !19, !noalias !21
  %index.next330.1 = add nsw i64 %index329, 8
  %175 = icmp eq i64 %index.next330.1, 1080
  br i1 %175, label %._crit_edge.us.loopexit346, label %vector.body302, !llvm.loop !22

scalar.ph304:                                     ; preds = %scalar.ph304.preheader, %scalar.ph304
  %indvars.iv.us = phi i64 [ %indvars.iv.next.us.1, %scalar.ph304 ], [ 0, %scalar.ph304.preheader ]
  %176 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv218.us, i64 %indvars.iv.us
  %177 = load float, float* %176, align 4
  %178 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv218.us, i64 %indvars.iv.us
  %179 = load float, float* %178, align 4
  %180 = fadd float %177, %179
  %181 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 %indvars.iv.us
  store float %180, float* %181, align 4
  %indvars.iv.next.us = or i64 %indvars.iv.us, 1
  %182 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv218.us, i64 %indvars.iv.next.us
  %183 = load float, float* %182, align 4
  %184 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv218.us, i64 %indvars.iv.next.us
  %185 = load float, float* %184, align 4
  %186 = fadd float %183, %185
  %187 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 %indvars.iv.next.us
  store float %186, float* %187, align 4
  %indvars.iv.next.us.1 = add nuw nsw i64 %indvars.iv.us, 2
  %exitcond.us.1 = icmp eq i64 %indvars.iv.next.us.1, 2160
  br i1 %exitcond.us.1, label %._crit_edge.us.loopexit, label %scalar.ph304, !llvm.loop !23

._crit_edge.us.loopexit:                          ; preds = %scalar.ph304
  br label %._crit_edge.us

._crit_edge.us.loopexit346:                       ; preds = %vector.body302
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit346, %._crit_edge.us.loopexit
  %exitcond221.us = icmp eq i64 %156, 4096
  br i1 %exitcond221.us, label %._crit_edge181, label %.preheader.us.new

._crit_edge181:                                   ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [2160 x float]* nocapture readonly) #0 {
.preheader.lr.ph.split.us:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph.split.us
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %._crit_edge.us ], [ 0, %.preheader.lr.ph.split.us ]
  %7 = mul nuw nsw i64 %indvars.iv16, 2160
  br label %8

; <label>:8:                                      ; preds = %15, %.preheader.us
  %indvars.iv.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %15 ]
  %9 = add nuw nsw i64 %indvars.iv.us, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #6
  br label %15

; <label>:15:                                     ; preds = %13, %8
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv16, i64 %indvars.iv.us
  %18 = load float, float* %17, align 4
  %19 = fpext float %18 to double
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %19) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 2160
  br i1 %exitcond.us, label %._crit_edge.us, label %8

._crit_edge.us:                                   ; preds = %15
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next17, 4096
  br i1 %exitcond19, label %._crit_edge15, label %.preheader.us

._crit_edge15:                                    ; preds = %._crit_edge.us
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #6
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare float @expf(float) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

; Function Attrs: nounwind readnone
declare float @llvm.exp2.f32(float) #4

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) #5

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) #5

attributes #0 = { noinline nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #1 = { "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #2 = { noinline norecurse nounwind uwtable "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-jump-tables"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #3 = { nounwind "correctly-rounded-divide-sqrt-fp-math"="false" "disable-tail-calls"="false" "less-precise-fpmad"="false" "no-frame-pointer-elim"="true" "no-frame-pointer-elim-non-leaf" "no-infs-fp-math"="false" "no-nans-fp-math"="false" "no-signed-zeros-fp-math"="false" "no-trapping-math"="false" "stack-protector-buffer-size"="8" "target-cpu"="x86-64" "target-features"="+fxsr,+mmx,+sse,+sse2,+x87" "unsafe-fp-math"="false" "use-soft-float"="false" }
attributes #4 = { nounwind readnone }
attributes #5 = { nounwind }
attributes #6 = { cold }

!llvm.ident = !{!0}

!0 = !{!"clang version 4.0.0 (tags/RELEASE_400/final)"}
!1 = distinct !{!1, !2, !3}
!2 = !{!"llvm.loop.vectorize.width", i32 1}
!3 = !{!"llvm.loop.interleave.count", i32 1}
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8}
!8 = distinct !{!8, !6}
!9 = !{!10}
!10 = distinct !{!10, !6}
!11 = !{!5, !8}
!12 = distinct !{!12, !2, !3}
!13 = distinct !{!13, !2, !3}
!14 = !{!15}
!15 = distinct !{!15, !16}
!16 = distinct !{!16, !"LVerDomain"}
!17 = !{!18}
!18 = distinct !{!18, !16}
!19 = !{!20}
!20 = distinct !{!20, !16}
!21 = !{!15, !18}
!22 = distinct !{!22, !2, !3}
!23 = distinct !{!23, !2, !3}
