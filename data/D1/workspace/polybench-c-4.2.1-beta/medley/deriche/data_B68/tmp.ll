; ModuleID = 'A.ll'
source_filename = "deriche.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"imgOut\00", align 1
@.str.5 = private unnamed_addr constant [7 x i8] c"%0.2f \00", align 1
@.str.6 = private unnamed_addr constant [17 x i8] c"\0Aend   dump: %s\0A\00", align 1
@.str.7 = private unnamed_addr constant [23 x i8] c"==END   DUMP_ARRAYS==\0A\00", align 1

; Function Attrs: noinline nounwind uwtable
define i32 @main(i32, i8** nocapture readonly) local_unnamed_addr #0 {
  %3 = alloca float, align 4
  %4 = call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %5 = call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %6 = call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %7 = call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %8 = bitcast i8* %4 to [2160 x float]*
  %9 = bitcast i8* %5 to [2160 x float]*
  call fastcc void @init_array(i32 4096, i32 2160, float* nonnull %3, [2160 x float]* %8)
  call void (...) @polybench_timer_start() #5
  %10 = load float, float* %3, align 4
  %11 = bitcast i8* %6 to [2160 x float]*
  %12 = bitcast i8* %7 to [2160 x float]*
  call fastcc void @kernel_deriche(i32 4096, i32 2160, float %10, [2160 x float]* %8, [2160 x float]* %9, [2160 x float]* %11, [2160 x float]* %12)
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
  call fastcc void @print_array(i32 4096, i32 2160, [2160 x float]* %18)
  br label %19

; <label>:19:                                     ; preds = %14, %17, %2
  call void @free(i8* %4) #5
  call void @free(i8* %5) #5
  call void @free(i8* %6) #5
  call void @free(i8* %7) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, float* nocapture, [2160 x float]* nocapture) unnamed_addr #2 {
.preheader.lr.ph:
  store float 2.500000e-01, float* %2, align 4
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.lr.ph, %._crit_edge.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us ], [ 0, %.preheader.lr.ph ]
  %4 = mul nuw nsw i64 %indvars.iv, 313
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %4, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %.preheader.us
  %index = phi i64 [ 0, %.preheader.us ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %.preheader.us ], [ %vec.ind.next, %vector.body ]
  %5 = mul nuw nsw <4 x i64> %vec.ind, <i64 991, i64 991, i64 991, i64 991>
  %6 = add <4 x i64> %broadcast.splat, %5
  %7 = trunc <4 x i64> %6 to <4 x i32>
  %8 = srem <4 x i32> %7, <i32 65536, i32 65536, i32 65536, i32 65536>
  %9 = sitofp <4 x i32> %8 to <4 x float>
  %10 = fdiv <4 x float> %9, <float 6.553500e+04, float 6.553500e+04, float 6.553500e+04, float 6.553500e+04>
  %11 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv, i64 %index
  %12 = bitcast float* %11 to <4 x float>*
  store <4 x float> %10, <4 x float>* %12, align 4
  %index.next = add nuw nsw i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %13 = icmp eq i64 %index.next, 2160
  br i1 %13, label %._crit_edge.us, label %vector.body, !llvm.loop !1

._crit_edge.us:                                   ; preds = %vector.body
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 4096
  br i1 %exitcond, label %._crit_edge15, label %.preheader.us

._crit_edge15:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_deriche(i32, i32, float, [2160 x float]* nocapture readonly, [2160 x float]* nocapture, [2160 x float]* nocapture, [2160 x float]* nocapture) unnamed_addr #0 {
.preheader178.lr.ph:
  %7 = fsub float -0.000000e+00, %2
  %8 = call float @expf(float %7) #5
  %9 = fsub float 1.000000e+00, %8
  %10 = call float @expf(float %7) #5
  %11 = fsub float 1.000000e+00, %10
  %12 = fmul float %9, %11
  %13 = fmul float %2, 2.000000e+00
  %14 = call float @expf(float %7) #5
  %15 = fmul float %13, %14
  %16 = fadd float %15, 1.000000e+00
  %17 = call float @expf(float %13) #5
  %18 = fsub float %16, %17
  %19 = fdiv float %12, %18
  %20 = call float @expf(float %7) #5
  %21 = fmul float %19, %20
  %22 = call float @expf(float %7) #5
  %23 = fmul float %19, %22
  %24 = insertelement <2 x float> undef, float %2, i32 0
  %25 = shufflevector <2 x float> %24, <2 x float> undef, <2 x i32> zeroinitializer
  %26 = fadd <2 x float> %25, <float -1.000000e+00, float 1.000000e+00>
  %27 = insertelement <2 x float> undef, float %21, i32 0
  %28 = insertelement <2 x float> %27, float %23, i32 1
  %29 = fmul <2 x float> %28, %26
  %30 = extractelement <2 x float> %29, i32 0
  %31 = fmul float %2, -2.000000e+00
  %32 = call float @expf(float %31) #5
  %33 = fmul float %19, %32
  %exp2 = call float @llvm.exp2.f32(float %7)
  %34 = call float @expf(float %31) #5
  %35 = fsub float -0.000000e+00, %34
  %36 = insertelement <2 x float> undef, float %30, i32 0
  %37 = insertelement <2 x float> %36, float %19, i32 1
  br label %.preheader178.us

.preheader178.us:                                 ; preds = %.preheader178.lr.ph, %._crit_edge216.us
  %indvars.iv254.us = phi i64 [ %indvars.iv.next255.us, %._crit_edge216.us ], [ 0, %.preheader178.lr.ph ]
  br label %.preheader178.us.new

.preheader178.us.new:                             ; preds = %.preheader178.us, %.preheader178.us.new
  %indvars.iv250.us = phi i64 [ %indvars.iv.next251.us.1, %.preheader178.us.new ], [ 0, %.preheader178.us ]
  %.0155213.us = phi float [ %60, %.preheader178.us.new ], [ 0.000000e+00, %.preheader178.us ]
  %.0157212.us = phi float [ %58, %.preheader178.us.new ], [ 0.000000e+00, %.preheader178.us ]
  %.0159211.us = phi float [ %46, %.preheader178.us.new ], [ 0.000000e+00, %.preheader178.us ]
  %38 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv254.us, i64 %indvars.iv250.us
  %39 = load float, float* %38, align 4
  %40 = fmul float %19, %39
  %41 = fmul float %30, %.0155213.us
  %42 = fadd float %40, %41
  %43 = fmul float %exp2, %.0157212.us
  %44 = fadd float %42, %43
  %45 = fmul float %.0159211.us, %35
  %46 = fadd float %44, %45
  %47 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv254.us, i64 %indvars.iv250.us
  store float %46, float* %47, align 4
  %48 = bitcast float* %38 to <2 x float>*
  %indvars.iv.next251.us = or i64 %indvars.iv250.us, 1
  %49 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv254.us, i64 %indvars.iv.next251.us
  %50 = load <2 x float>, <2 x float>* %48, align 4
  %51 = fmul <2 x float> %37, %50
  %52 = extractelement <2 x float> %51, i32 0
  %53 = extractelement <2 x float> %51, i32 1
  %54 = fadd float %53, %52
  %55 = fmul float %exp2, %46
  %56 = fadd float %54, %55
  %57 = fmul float %.0157212.us, %35
  %58 = fadd float %56, %57
  %59 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv254.us, i64 %indvars.iv.next251.us
  store float %58, float* %59, align 4
  %60 = load float, float* %49, align 4
  %indvars.iv.next251.us.1 = add nuw nsw i64 %indvars.iv250.us, 2
  %exitcond253.us.1 = icmp eq i64 %indvars.iv.next251.us.1, 2160
  br i1 %exitcond253.us.1, label %._crit_edge216.us, label %.preheader178.us.new

._crit_edge216.us:                                ; preds = %.preheader178.us.new
  %indvars.iv.next255.us = add nuw nsw i64 %indvars.iv254.us, 1
  %exitcond257.us = icmp eq i64 %indvars.iv.next255.us, 4096
  br i1 %exitcond257.us, label %.preheader176.us.preheader, label %.preheader178.us

.preheader176.us.preheader:                       ; preds = %._crit_edge216.us
  %61 = extractelement <2 x float> %29, i32 1
  %62 = fsub float -0.000000e+00, %33
  br label %.preheader176.us

.preheader176.us:                                 ; preds = %.preheader176.us.preheader, %._crit_edge209.us
  %indvars.iv246.us = phi i64 [ %indvars.iv.next247.us, %._crit_edge209.us ], [ 0, %.preheader176.us.preheader ]
  br label %.preheader176.us.new

.preheader176.us.new:                             ; preds = %.preheader176.us, %.preheader176.us.new
  %indvars.iv244.us.in = phi i64 [ %indvars.iv244.us.1, %.preheader176.us.new ], [ 2160, %.preheader176.us ]
  %.0161206.us = phi float [ %82, %.preheader176.us.new ], [ 0.000000e+00, %.preheader176.us ]
  %.0162205.us = phi float [ %72, %.preheader176.us.new ], [ 0.000000e+00, %.preheader176.us ]
  %.0165204.us = phi float [ %79, %.preheader176.us.new ], [ 0.000000e+00, %.preheader176.us ]
  %.0167203.us = phi float [ %69, %.preheader176.us.new ], [ 0.000000e+00, %.preheader176.us ]
  %indvars.iv244.us = add nsw i64 %indvars.iv244.us.in, -1
  %63 = fmul float %61, %.0161206.us
  %64 = fmul float %.0162205.us, %62
  %65 = fadd float %63, %64
  %66 = fmul float %exp2, %.0165204.us
  %67 = fadd float %65, %66
  %68 = fmul float %.0167203.us, %35
  %69 = fadd float %67, %68
  %70 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv246.us, i64 %indvars.iv244.us
  store float %69, float* %70, align 4
  %71 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv246.us, i64 %indvars.iv244.us
  %72 = load float, float* %71, align 4
  %indvars.iv244.us.1 = add nsw i64 %indvars.iv244.us.in, -2
  %73 = fmul float %61, %72
  %74 = fmul float %.0161206.us, %62
  %75 = fadd float %73, %74
  %76 = fmul float %exp2, %69
  %77 = fadd float %75, %76
  %78 = fmul float %.0165204.us, %35
  %79 = fadd float %77, %78
  %80 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv246.us, i64 %indvars.iv244.us.1
  store float %79, float* %80, align 4
  %81 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv246.us, i64 %indvars.iv244.us.1
  %82 = load float, float* %81, align 4
  %83 = icmp sgt i64 %indvars.iv244.us.in, 2
  br i1 %83, label %.preheader176.us.new, label %._crit_edge209.us

._crit_edge209.us:                                ; preds = %.preheader176.us.new
  %indvars.iv.next247.us = add nuw nsw i64 %indvars.iv246.us, 1
  %exitcond249.us = icmp eq i64 %indvars.iv.next247.us, 4096
  br i1 %exitcond249.us, label %.preheader174.us.preheader, label %.preheader176.us

.preheader174.us.preheader:                       ; preds = %._crit_edge209.us
  br label %.preheader174.us

.preheader174.us:                                 ; preds = %.preheader174.us.preheader, %._crit_edge200.us
  %indvars.iv240.us = phi i64 [ %indvars.iv.next241.us, %._crit_edge200.us ], [ 0, %.preheader174.us.preheader ]
  %scevgep = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 0
  %84 = add nuw nsw i64 %indvars.iv240.us, 1
  %scevgep295 = getelementptr [2160 x float], [2160 x float]* %4, i64 %84, i64 0
  %scevgep297 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv240.us, i64 0
  %scevgep299 = getelementptr [2160 x float], [2160 x float]* %5, i64 %84, i64 0
  %scevgep301 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv240.us, i64 0
  %scevgep303 = getelementptr [2160 x float], [2160 x float]* %6, i64 %84, i64 0
  %bound0 = icmp ult float* %scevgep, %scevgep299
  %bound1 = icmp ult float* %scevgep297, %scevgep295
  %found.conflict = and i1 %bound0, %bound1
  %bound0305 = icmp ult float* %scevgep, %scevgep303
  %bound1306 = icmp ult float* %scevgep301, %scevgep295
  %found.conflict307 = and i1 %bound0305, %bound1306
  %conflict.rdx = or i1 %found.conflict, %found.conflict307
  br i1 %conflict.rdx, label %.preheader174.us.new.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader174.us
  br label %vector.body

.preheader174.us.new.preheader:                   ; preds = %.preheader174.us
  br label %.preheader174.us.new

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = shl i64 %index, 1
  %85 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv240.us, i64 %offset.idx
  %86 = bitcast float* %85 to <8 x float>*
  %wide.vec = load <8 x float>, <8 x float>* %86, align 4, !alias.scope !4
  %87 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv240.us, i64 %offset.idx
  %88 = bitcast float* %87 to <8 x float>*
  %wide.vec309 = load <8 x float>, <8 x float>* %88, align 4, !alias.scope !7
  %89 = fadd <8 x float> %wide.vec, %wide.vec309
  %90 = shufflevector <8 x float> %89, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %91 = or i64 %offset.idx, 1
  %92 = fadd <8 x float> %wide.vec, %wide.vec309
  %93 = shufflevector <8 x float> %92, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %94 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 %91
  %95 = getelementptr float, float* %94, i64 -1
  %96 = bitcast float* %95 to <8 x float>*
  %interleaved.vec = shufflevector <4 x float> %90, <4 x float> %93, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec, <8 x float>* %96, align 4, !alias.scope !9, !noalias !11
  %index.next = add nuw nsw i64 %index, 4
  %97 = icmp eq i64 %index.next, 1080
  br i1 %97, label %._crit_edge200.us.loopexit357, label %vector.body, !llvm.loop !12

.preheader174.us.new:                             ; preds = %.preheader174.us.new.preheader, %.preheader174.us.new
  %indvars.iv236.us = phi i64 [ %indvars.iv.next237.us.1, %.preheader174.us.new ], [ 0, %.preheader174.us.new.preheader ]
  %98 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv240.us, i64 %indvars.iv236.us
  %99 = load float, float* %98, align 4
  %100 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv240.us, i64 %indvars.iv236.us
  %101 = load float, float* %100, align 4
  %102 = fadd float %99, %101
  %103 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 %indvars.iv236.us
  store float %102, float* %103, align 4
  %indvars.iv.next237.us = or i64 %indvars.iv236.us, 1
  %104 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv240.us, i64 %indvars.iv.next237.us
  %105 = load float, float* %104, align 4
  %106 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv240.us, i64 %indvars.iv.next237.us
  %107 = load float, float* %106, align 4
  %108 = fadd float %105, %107
  %109 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 %indvars.iv.next237.us
  store float %108, float* %109, align 4
  %indvars.iv.next237.us.1 = add nuw nsw i64 %indvars.iv236.us, 2
  %exitcond239.us.1 = icmp eq i64 %indvars.iv.next237.us.1, 2160
  br i1 %exitcond239.us.1, label %._crit_edge200.us.loopexit, label %.preheader174.us.new, !llvm.loop !13

._crit_edge200.us.loopexit:                       ; preds = %.preheader174.us.new
  br label %._crit_edge200.us

._crit_edge200.us.loopexit357:                    ; preds = %vector.body
  br label %._crit_edge200.us

._crit_edge200.us:                                ; preds = %._crit_edge200.us.loopexit357, %._crit_edge200.us.loopexit
  %indvars.iv.next241.us = add nuw nsw i64 %indvars.iv240.us, 1
  %exitcond243.us = icmp eq i64 %indvars.iv.next241.us, 4096
  br i1 %exitcond243.us, label %.preheader172.us.preheader, label %.preheader174.us

.preheader172.us.preheader:                       ; preds = %._crit_edge200.us
  br label %.preheader172.us

.preheader172.us:                                 ; preds = %.preheader172.us.preheader, %._crit_edge196.us
  %indvars.iv232.us = phi i64 [ %indvars.iv.next233.us, %._crit_edge196.us ], [ 0, %.preheader172.us.preheader ]
  br label %.preheader172.us.new

.preheader172.us.new:                             ; preds = %.preheader172.us, %.preheader172.us.new
  %indvars.iv228.us = phi i64 [ %indvars.iv.next229.us.1, %.preheader172.us.new ], [ 0, %.preheader172.us ]
  %.0156193.us = phi float [ %131, %.preheader172.us.new ], [ 0.000000e+00, %.preheader172.us ]
  %.1158192.us = phi float [ %129, %.preheader172.us.new ], [ 0.000000e+00, %.preheader172.us ]
  %.1160191.us = phi float [ %118, %.preheader172.us.new ], [ 0.000000e+00, %.preheader172.us ]
  %110 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv228.us, i64 %indvars.iv232.us
  %111 = load float, float* %110, align 4
  %112 = fmul float %19, %111
  %113 = fmul float %30, %.0156193.us
  %114 = fadd float %112, %113
  %115 = fmul float %exp2, %.1158192.us
  %116 = fadd float %114, %115
  %117 = fmul float %.1160191.us, %35
  %118 = fadd float %116, %117
  %119 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv228.us, i64 %indvars.iv232.us
  store float %118, float* %119, align 4
  %120 = load float, float* %110, align 4
  %indvars.iv.next229.us = or i64 %indvars.iv228.us, 1
  %121 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next229.us, i64 %indvars.iv232.us
  %122 = load float, float* %121, align 4
  %123 = fmul float %19, %122
  %124 = fmul float %30, %120
  %125 = fadd float %123, %124
  %126 = fmul float %exp2, %118
  %127 = fadd float %125, %126
  %128 = fmul float %.1158192.us, %35
  %129 = fadd float %127, %128
  %130 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv.next229.us, i64 %indvars.iv232.us
  store float %129, float* %130, align 4
  %131 = load float, float* %121, align 4
  %indvars.iv.next229.us.1 = add nuw nsw i64 %indvars.iv228.us, 2
  %exitcond231.us.1 = icmp eq i64 %indvars.iv.next229.us.1, 4096
  br i1 %exitcond231.us.1, label %._crit_edge196.us, label %.preheader172.us.new

._crit_edge196.us:                                ; preds = %.preheader172.us.new
  %indvars.iv.next233.us = add nuw nsw i64 %indvars.iv232.us, 1
  %exitcond235.us = icmp eq i64 %indvars.iv.next233.us, 2160
  br i1 %exitcond235.us, label %.preheader170.us.preheader, label %.preheader172.us

.preheader170.us.preheader:                       ; preds = %._crit_edge196.us
  br label %.preheader170.us

.preheader170.us:                                 ; preds = %.preheader170.us.preheader, %._crit_edge189.us
  %indvars.iv224.us = phi i64 [ %indvars.iv.next225.us, %._crit_edge189.us ], [ 0, %.preheader170.us.preheader ]
  br label %.preheader170.us.new

.preheader170.us.new:                             ; preds = %.preheader170.us, %.preheader170.us.new
  %indvars.iv222.us.in = phi i64 [ %indvars.iv222.us.1, %.preheader170.us.new ], [ 4096, %.preheader170.us ]
  %.0163186.us = phi float [ %151, %.preheader170.us.new ], [ 0.000000e+00, %.preheader170.us ]
  %.0164185.us = phi float [ %141, %.preheader170.us.new ], [ 0.000000e+00, %.preheader170.us ]
  %.1166184.us = phi float [ %148, %.preheader170.us.new ], [ 0.000000e+00, %.preheader170.us ]
  %.1168183.us = phi float [ %138, %.preheader170.us.new ], [ 0.000000e+00, %.preheader170.us ]
  %indvars.iv222.us = add nsw i64 %indvars.iv222.us.in, -1
  %132 = fmul float %61, %.0163186.us
  %133 = fmul float %.0164185.us, %62
  %134 = fadd float %132, %133
  %135 = fmul float %exp2, %.1166184.us
  %136 = fadd float %134, %135
  %137 = fmul float %.1168183.us, %35
  %138 = fadd float %136, %137
  %139 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv222.us, i64 %indvars.iv224.us
  store float %138, float* %139, align 4
  %140 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv222.us, i64 %indvars.iv224.us
  %141 = load float, float* %140, align 4
  %indvars.iv222.us.1 = add nsw i64 %indvars.iv222.us.in, -2
  %142 = fmul float %61, %141
  %143 = fmul float %.0163186.us, %62
  %144 = fadd float %142, %143
  %145 = fmul float %exp2, %138
  %146 = fadd float %144, %145
  %147 = fmul float %.1166184.us, %35
  %148 = fadd float %146, %147
  %149 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv222.us.1, i64 %indvars.iv224.us
  store float %148, float* %149, align 4
  %150 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv222.us.1, i64 %indvars.iv224.us
  %151 = load float, float* %150, align 4
  %152 = icmp sgt i64 %indvars.iv222.us.in, 2
  br i1 %152, label %.preheader170.us.new, label %._crit_edge189.us

._crit_edge189.us:                                ; preds = %.preheader170.us.new
  %indvars.iv.next225.us = add nuw nsw i64 %indvars.iv224.us, 1
  %exitcond227.us = icmp eq i64 %indvars.iv.next225.us, 2160
  br i1 %exitcond227.us, label %.preheader.us.preheader, label %.preheader170.us

.preheader.us.preheader:                          ; preds = %._crit_edge189.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv218.us = phi i64 [ %indvars.iv.next219.us, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep317 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 0
  %153 = add nuw nsw i64 %indvars.iv218.us, 1
  %scevgep319 = getelementptr [2160 x float], [2160 x float]* %4, i64 %153, i64 0
  %scevgep321 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv218.us, i64 0
  %scevgep323 = getelementptr [2160 x float], [2160 x float]* %5, i64 %153, i64 0
  %scevgep325 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv218.us, i64 0
  %scevgep327 = getelementptr [2160 x float], [2160 x float]* %6, i64 %153, i64 0
  %bound0329 = icmp ult float* %scevgep317, %scevgep323
  %bound1330 = icmp ult float* %scevgep321, %scevgep319
  %found.conflict331 = and i1 %bound0329, %bound1330
  %bound0332 = icmp ult float* %scevgep317, %scevgep327
  %bound1333 = icmp ult float* %scevgep325, %scevgep319
  %found.conflict334 = and i1 %bound0332, %bound1333
  %conflict.rdx335 = or i1 %found.conflict331, %found.conflict334
  br i1 %conflict.rdx335, label %.preheader.us.new.preheader, label %vector.body312.preheader

vector.body312.preheader:                         ; preds = %.preheader.us
  br label %vector.body312

.preheader.us.new.preheader:                      ; preds = %.preheader.us
  br label %.preheader.us.new

vector.body312:                                   ; preds = %vector.body312.preheader, %vector.body312
  %index339 = phi i64 [ %index.next340, %vector.body312 ], [ 0, %vector.body312.preheader ]
  %offset.idx343 = shl i64 %index339, 1
  %154 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv218.us, i64 %offset.idx343
  %155 = bitcast float* %154 to <8 x float>*
  %wide.vec347 = load <8 x float>, <8 x float>* %155, align 4, !alias.scope !14
  %156 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv218.us, i64 %offset.idx343
  %157 = bitcast float* %156 to <8 x float>*
  %wide.vec350 = load <8 x float>, <8 x float>* %157, align 4, !alias.scope !17
  %158 = fadd <8 x float> %wide.vec347, %wide.vec350
  %159 = shufflevector <8 x float> %158, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %160 = or i64 %offset.idx343, 1
  %161 = fadd <8 x float> %wide.vec347, %wide.vec350
  %162 = shufflevector <8 x float> %161, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %163 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 %160
  %164 = getelementptr float, float* %163, i64 -1
  %165 = bitcast float* %164 to <8 x float>*
  %interleaved.vec353 = shufflevector <4 x float> %159, <4 x float> %162, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec353, <8 x float>* %165, align 4, !alias.scope !19, !noalias !21
  %index.next340 = add nuw nsw i64 %index339, 4
  %166 = icmp eq i64 %index.next340, 1080
  br i1 %166, label %._crit_edge.us.loopexit356, label %vector.body312, !llvm.loop !22

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv.us = phi i64 [ %indvars.iv.next.us.1, %.preheader.us.new ], [ 0, %.preheader.us.new.preheader ]
  %167 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv218.us, i64 %indvars.iv.us
  %168 = load float, float* %167, align 4
  %169 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv218.us, i64 %indvars.iv.us
  %170 = load float, float* %169, align 4
  %171 = fadd float %168, %170
  %172 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 %indvars.iv.us
  store float %171, float* %172, align 4
  %indvars.iv.next.us = or i64 %indvars.iv.us, 1
  %173 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv218.us, i64 %indvars.iv.next.us
  %174 = load float, float* %173, align 4
  %175 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv218.us, i64 %indvars.iv.next.us
  %176 = load float, float* %175, align 4
  %177 = fadd float %174, %176
  %178 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 %indvars.iv.next.us
  store float %177, float* %178, align 4
  %indvars.iv.next.us.1 = add nuw nsw i64 %indvars.iv.us, 2
  %exitcond.us.1 = icmp eq i64 %indvars.iv.next.us.1, 2160
  br i1 %exitcond.us.1, label %._crit_edge.us.loopexit, label %.preheader.us.new, !llvm.loop !23

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us.loopexit356:                       ; preds = %vector.body312
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit356, %._crit_edge.us.loopexit
  %indvars.iv.next219.us = add nuw nsw i64 %indvars.iv218.us, 1
  %exitcond221.us = icmp eq i64 %indvars.iv.next219.us, 4096
  br i1 %exitcond221.us, label %._crit_edge181, label %.preheader.us

._crit_edge181:                                   ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [2160 x float]* nocapture readonly) unnamed_addr #0 {
.preheader.lr.ph:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.lr.ph, %._crit_edge.us
  %indvars.iv15.us = phi i64 [ %indvars.iv.next16.us, %._crit_edge.us ], [ 0, %.preheader.lr.ph ]
  %7 = mul nuw nsw i64 %indvars.iv15.us, 2160
  br label %8

; <label>:8:                                      ; preds = %15, %.preheader.us
  %indvars.iv.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %15 ]
  %9 = add nuw nsw i64 %7, %indvars.iv.us
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %14) #6
  br label %15

; <label>:15:                                     ; preds = %13, %8
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv15.us, i64 %indvars.iv.us
  %18 = load float, float* %17, align 4
  %19 = fpext float %18 to double
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %19) #7
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 2160
  br i1 %exitcond.us, label %._crit_edge.us, label %8

._crit_edge.us:                                   ; preds = %15
  %indvars.iv.next16.us = add nuw nsw i64 %indvars.iv15.us, 1
  %exitcond18.us = icmp eq i64 %indvars.iv.next16.us, 4096
  br i1 %exitcond18.us, label %._crit_edge14, label %.preheader.us

._crit_edge14:                                    ; preds = %._crit_edge.us
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) local_unnamed_addr #3

; Function Attrs: nounwind
declare float @expf(float) local_unnamed_addr #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) local_unnamed_addr #1

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
attributes #7 = { cold nounwind }

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
