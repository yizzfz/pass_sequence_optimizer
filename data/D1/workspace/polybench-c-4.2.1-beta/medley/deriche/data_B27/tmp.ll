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
  %4 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %5 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %6 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %7 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
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

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next, %._crit_edge.us ]
  %4 = mul nuw nsw i64 %indvars.iv, 313
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %4, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %.preheader.us
  %index = phi i64 [ 0, %.preheader.us ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %.preheader.us ], [ %vec.ind.next, %vector.body ]
  %5 = mul nuw nsw <4 x i64> %vec.ind, <i64 991, i64 991, i64 991, i64 991>
  %6 = add <4 x i64> %5, %broadcast.splat
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
  %exitcond8 = icmp eq i64 %indvars.iv.next, 4096
  br i1 %exitcond8, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_deriche(i32, i32, float, [2160 x float]* nocapture readonly, [2160 x float]* nocapture, [2160 x float]* nocapture, [2160 x float]* nocapture) unnamed_addr #0 {
.preheader176.lr.ph:
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
  %22 = tail call float @expf(float %7) #5
  %23 = fmul float %22, %19
  %24 = insertelement <2 x float> undef, float %2, i32 0
  %25 = shufflevector <2 x float> %24, <2 x float> undef, <2 x i32> zeroinitializer
  %26 = fadd <2 x float> %25, <float -1.000000e+00, float 1.000000e+00>
  %27 = insertelement <2 x float> undef, float %21, i32 0
  %28 = insertelement <2 x float> %27, float %23, i32 1
  %29 = fmul <2 x float> %26, %28
  %30 = extractelement <2 x float> %29, i32 0
  %31 = fmul float %2, -2.000000e+00
  %32 = tail call float @expf(float %31) #5
  %33 = fmul float %19, %32
  %exp2 = call float @llvm.exp2.f32(float %7)
  %34 = tail call float @expf(float %31) #5
  %35 = fsub float -0.000000e+00, %34
  %36 = insertelement <2 x float> undef, float %30, i32 0
  %37 = insertelement <2 x float> %36, float %19, i32 1
  br label %.preheader176.us

.preheader176.us:                                 ; preds = %.preheader176.lr.ph, %._crit_edge216.us
  %indvars.iv254.us = phi i64 [ %indvars.iv.next255.us, %._crit_edge216.us ], [ 0, %.preheader176.lr.ph ]
  br label %.preheader176.us.new

.preheader176.us.new:                             ; preds = %.preheader176.us, %.preheader176.us.new
  %indvars.iv250.us = phi i64 [ %indvars.iv.next251.us.1, %.preheader176.us.new ], [ 0, %.preheader176.us ]
  %.0155213.us = phi float [ %60, %.preheader176.us.new ], [ 0.000000e+00, %.preheader176.us ]
  %.0157212.us = phi float [ %58, %.preheader176.us.new ], [ 0.000000e+00, %.preheader176.us ]
  %.0159211.us = phi float [ %46, %.preheader176.us.new ], [ 0.000000e+00, %.preheader176.us ]
  %38 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv254.us, i64 %indvars.iv250.us
  %39 = load float, float* %38, align 4
  %40 = fmul float %19, %39
  %41 = fmul float %30, %.0155213.us
  %42 = fadd float %41, %40
  %43 = fmul float %exp2, %.0157212.us
  %44 = fadd float %43, %42
  %45 = fmul float %.0159211.us, %35
  %46 = fadd float %45, %44
  %47 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv254.us, i64 %indvars.iv250.us
  store float %46, float* %47, align 4
  %48 = bitcast float* %38 to <2 x float>*
  %indvars.iv.next251.us = or i64 %indvars.iv250.us, 1
  %49 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv254.us, i64 %indvars.iv.next251.us
  %50 = load <2 x float>, <2 x float>* %48, align 4
  %51 = fmul <2 x float> %37, %50
  %52 = extractelement <2 x float> %51, i32 0
  %53 = extractelement <2 x float> %51, i32 1
  %54 = fadd float %52, %53
  %55 = fmul float %exp2, %46
  %56 = fadd float %55, %54
  %57 = fmul float %.0157212.us, %35
  %58 = fadd float %57, %56
  %59 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv254.us, i64 %indvars.iv.next251.us
  store float %58, float* %59, align 4
  %60 = load float, float* %49, align 4
  %indvars.iv.next251.us.1 = add nuw nsw i64 %indvars.iv250.us, 2
  %exitcond253.us.1 = icmp eq i64 %indvars.iv.next251.us.1, 2160
  br i1 %exitcond253.us.1, label %._crit_edge216.us, label %.preheader176.us.new

._crit_edge216.us:                                ; preds = %.preheader176.us.new
  %indvars.iv.next255.us = add nuw nsw i64 %indvars.iv254.us, 1
  %exitcond257.us = icmp eq i64 %indvars.iv.next255.us, 4096
  br i1 %exitcond257.us, label %.lr.ph210.split.us.preheader, label %.preheader176.us

.lr.ph210.split.us.preheader:                     ; preds = %._crit_edge216.us
  %61 = extractelement <2 x float> %29, i32 1
  %62 = fsub float -0.000000e+00, %33
  br label %.lr.ph210.split.us

.lr.ph210.split.us:                               ; preds = %.lr.ph210.split.us.preheader, %._crit_edge208.us
  %indvars.iv246.us = phi i64 [ %indvars.iv.next247.us, %._crit_edge208.us ], [ 0, %.lr.ph210.split.us.preheader ]
  br label %63

; <label>:63:                                     ; preds = %63, %.lr.ph210.split.us
  %indvars.iv244.us = phi i64 [ 2159, %.lr.ph210.split.us ], [ %indvars.iv.next245.us.1, %63 ]
  %.0161204.us = phi float [ 0.000000e+00, %.lr.ph210.split.us ], [ %83, %63 ]
  %.0162203.us = phi float [ 0.000000e+00, %.lr.ph210.split.us ], [ %73, %63 ]
  %.0165202.us = phi float [ 0.000000e+00, %.lr.ph210.split.us ], [ %80, %63 ]
  %.0167201.us = phi float [ 0.000000e+00, %.lr.ph210.split.us ], [ %70, %63 ]
  %64 = fmul float %61, %.0161204.us
  %65 = fmul float %.0162203.us, %62
  %66 = fadd float %65, %64
  %67 = fmul float %exp2, %.0165202.us
  %68 = fadd float %67, %66
  %69 = fmul float %.0167201.us, %35
  %70 = fadd float %69, %68
  %71 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv246.us, i64 %indvars.iv244.us
  store float %70, float* %71, align 4
  %72 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv246.us, i64 %indvars.iv244.us
  %73 = load float, float* %72, align 4
  %indvars.iv.next245.us = add nsw i64 %indvars.iv244.us, -1
  %74 = fmul float %61, %73
  %75 = fmul float %.0161204.us, %62
  %76 = fadd float %75, %74
  %77 = fmul float %exp2, %70
  %78 = fadd float %77, %76
  %79 = fmul float %.0165202.us, %35
  %80 = fadd float %79, %78
  %81 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv246.us, i64 %indvars.iv.next245.us
  store float %80, float* %81, align 4
  %82 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv246.us, i64 %indvars.iv.next245.us
  %83 = load float, float* %82, align 4
  %indvars.iv.next245.us.1 = add nsw i64 %indvars.iv244.us, -2
  %84 = icmp sgt i64 %indvars.iv244.us, 1
  br i1 %84, label %63, label %._crit_edge208.us

._crit_edge208.us:                                ; preds = %63
  %indvars.iv.next247.us = add nuw nsw i64 %indvars.iv246.us, 1
  %exitcond249.us = icmp eq i64 %indvars.iv.next247.us, 4096
  br i1 %exitcond249.us, label %.preheader173.us.preheader, label %.lr.ph210.split.us

.preheader173.us.preheader:                       ; preds = %._crit_edge208.us
  br label %.preheader173.us

.preheader173.us:                                 ; preds = %.preheader173.us.preheader, %._crit_edge199.us
  %indvars.iv240.us = phi i64 [ %indvars.iv.next241.us, %._crit_edge199.us ], [ 0, %.preheader173.us.preheader ]
  %scevgep286 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 0
  %scevgep289 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 2160
  %scevgep292 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv240.us, i64 0
  %scevgep295 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv240.us, i64 2160
  %scevgep298 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv240.us, i64 0
  %scevgep301 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv240.us, i64 2160
  %bound0 = icmp ult float* %scevgep286, %scevgep295
  %bound1 = icmp ult float* %scevgep292, %scevgep289
  %found.conflict = and i1 %bound0, %bound1
  %bound0303 = icmp ult float* %scevgep286, %scevgep301
  %bound1304 = icmp ult float* %scevgep298, %scevgep289
  %found.conflict305 = and i1 %bound0303, %bound1304
  %conflict.rdx = or i1 %found.conflict, %found.conflict305
  br i1 %conflict.rdx, label %.preheader173.us.new.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader173.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %85 = shl i64 %index, 1
  %86 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv240.us, i64 %85
  %87 = bitcast float* %86 to <8 x float>*
  %wide.vec = load <8 x float>, <8 x float>* %87, align 4, !alias.scope !4
  %88 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv240.us, i64 %85
  %89 = bitcast float* %88 to <8 x float>*
  %wide.vec307 = load <8 x float>, <8 x float>* %89, align 4, !alias.scope !7
  %90 = fadd <8 x float> %wide.vec, %wide.vec307
  %91 = shufflevector <8 x float> %90, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %92 = or i64 %85, 1
  %93 = fadd <8 x float> %wide.vec, %wide.vec307
  %94 = shufflevector <8 x float> %93, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %95 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 %92
  %96 = getelementptr float, float* %95, i64 -1
  %97 = bitcast float* %96 to <8 x float>*
  %interleaved.vec = shufflevector <4 x float> %91, <4 x float> %94, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec, <8 x float>* %97, align 4, !alias.scope !9, !noalias !11
  %index.next = add nuw nsw i64 %index, 4
  %98 = icmp eq i64 %index.next, 1080
  br i1 %98, label %middle.block, label %vector.body, !llvm.loop !12

middle.block:                                     ; preds = %vector.body
  br label %._crit_edge199.us

.preheader173.us.new.preheader:                   ; preds = %.preheader173.us
  br label %.preheader173.us.new

.preheader173.us.new:                             ; preds = %.preheader173.us.new.preheader, %.preheader173.us.new
  %indvars.iv236.us = phi i64 [ %indvars.iv.next237.us.1, %.preheader173.us.new ], [ 0, %.preheader173.us.new.preheader ]
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
  br i1 %exitcond239.us.1, label %._crit_edge199.us.loopexit, label %.preheader173.us.new, !llvm.loop !13

._crit_edge199.us.loopexit:                       ; preds = %.preheader173.us.new
  br label %._crit_edge199.us

._crit_edge199.us:                                ; preds = %._crit_edge199.us.loopexit, %middle.block
  %indvars.iv.next241.us = add nuw nsw i64 %indvars.iv240.us, 1
  %exitcond243.us = icmp eq i64 %indvars.iv.next241.us, 4096
  br i1 %exitcond243.us, label %.preheader171.us.preheader, label %.preheader173.us

.preheader171.us.preheader:                       ; preds = %._crit_edge199.us
  br label %.preheader171.us

.preheader171.us:                                 ; preds = %.preheader171.us.preheader, %._crit_edge195.us
  %indvars.iv232.us = phi i64 [ %indvars.iv.next233.us, %._crit_edge195.us ], [ 0, %.preheader171.us.preheader ]
  br label %.preheader171.us.new

.preheader171.us.new:                             ; preds = %.preheader171.us, %.preheader171.us.new
  %indvars.iv228.us = phi i64 [ %indvars.iv.next229.us.1, %.preheader171.us.new ], [ 0, %.preheader171.us ]
  %.0156192.us = phi float [ %132, %.preheader171.us.new ], [ 0.000000e+00, %.preheader171.us ]
  %.1158191.us = phi float [ %130, %.preheader171.us.new ], [ 0.000000e+00, %.preheader171.us ]
  %.1160190.us = phi float [ %119, %.preheader171.us.new ], [ 0.000000e+00, %.preheader171.us ]
  %111 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv228.us, i64 %indvars.iv232.us
  %112 = load float, float* %111, align 4
  %113 = fmul float %19, %112
  %114 = fmul float %30, %.0156192.us
  %115 = fadd float %114, %113
  %116 = fmul float %exp2, %.1158191.us
  %117 = fadd float %116, %115
  %118 = fmul float %.1160190.us, %35
  %119 = fadd float %118, %117
  %120 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv228.us, i64 %indvars.iv232.us
  store float %119, float* %120, align 4
  %121 = load float, float* %111, align 4
  %indvars.iv.next229.us = or i64 %indvars.iv228.us, 1
  %122 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next229.us, i64 %indvars.iv232.us
  %123 = load float, float* %122, align 4
  %124 = fmul float %19, %123
  %125 = fmul float %30, %121
  %126 = fadd float %125, %124
  %127 = fmul float %exp2, %119
  %128 = fadd float %127, %126
  %129 = fmul float %.1158191.us, %35
  %130 = fadd float %129, %128
  %131 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv.next229.us, i64 %indvars.iv232.us
  store float %130, float* %131, align 4
  %132 = load float, float* %122, align 4
  %indvars.iv.next229.us.1 = add nuw nsw i64 %indvars.iv228.us, 2
  %exitcond231.us.1 = icmp eq i64 %indvars.iv.next229.us.1, 4096
  br i1 %exitcond231.us.1, label %._crit_edge195.us, label %.preheader171.us.new

._crit_edge195.us:                                ; preds = %.preheader171.us.new
  %indvars.iv.next233.us = add nuw nsw i64 %indvars.iv232.us, 1
  %exitcond235.us = icmp eq i64 %indvars.iv.next233.us, 2160
  br i1 %exitcond235.us, label %.lr.ph189.split.us.preheader, label %.preheader171.us

.lr.ph189.split.us.preheader:                     ; preds = %._crit_edge195.us
  br label %.lr.ph189.split.us

.lr.ph189.split.us:                               ; preds = %.lr.ph189.split.us.preheader, %._crit_edge187.us
  %indvars.iv224.us = phi i64 [ %indvars.iv.next225.us, %._crit_edge187.us ], [ 0, %.lr.ph189.split.us.preheader ]
  br label %133

; <label>:133:                                    ; preds = %133, %.lr.ph189.split.us
  %indvars.iv222.us = phi i64 [ 4095, %.lr.ph189.split.us ], [ %indvars.iv.next223.us.1, %133 ]
  %.0163183.us = phi float [ 0.000000e+00, %.lr.ph189.split.us ], [ %153, %133 ]
  %.0164182.us = phi float [ 0.000000e+00, %.lr.ph189.split.us ], [ %143, %133 ]
  %.1166181.us = phi float [ 0.000000e+00, %.lr.ph189.split.us ], [ %150, %133 ]
  %.1168180.us = phi float [ 0.000000e+00, %.lr.ph189.split.us ], [ %140, %133 ]
  %134 = fmul float %61, %.0163183.us
  %135 = fmul float %.0164182.us, %62
  %136 = fadd float %135, %134
  %137 = fmul float %exp2, %.1166181.us
  %138 = fadd float %137, %136
  %139 = fmul float %.1168180.us, %35
  %140 = fadd float %139, %138
  %141 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv222.us, i64 %indvars.iv224.us
  store float %140, float* %141, align 4
  %142 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv222.us, i64 %indvars.iv224.us
  %143 = load float, float* %142, align 4
  %indvars.iv.next223.us = add nsw i64 %indvars.iv222.us, -1
  %144 = fmul float %61, %143
  %145 = fmul float %.0163183.us, %62
  %146 = fadd float %145, %144
  %147 = fmul float %exp2, %140
  %148 = fadd float %147, %146
  %149 = fmul float %.1166181.us, %35
  %150 = fadd float %149, %148
  %151 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv.next223.us, i64 %indvars.iv224.us
  store float %150, float* %151, align 4
  %152 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next223.us, i64 %indvars.iv224.us
  %153 = load float, float* %152, align 4
  %indvars.iv.next223.us.1 = add nsw i64 %indvars.iv222.us, -2
  %154 = icmp sgt i64 %indvars.iv222.us, 1
  br i1 %154, label %133, label %._crit_edge187.us

._crit_edge187.us:                                ; preds = %133
  %indvars.iv.next225.us = add nuw nsw i64 %indvars.iv224.us, 1
  %exitcond227.us = icmp eq i64 %indvars.iv.next225.us, 2160
  br i1 %exitcond227.us, label %.preheader.us.preheader, label %.lr.ph189.split.us

.preheader.us.preheader:                          ; preds = %._crit_edge187.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv218.us = phi i64 [ %indvars.iv.next219.us, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep320 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 0
  %scevgep323 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 2160
  %scevgep326 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv218.us, i64 0
  %scevgep329 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv218.us, i64 2160
  %scevgep332 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv218.us, i64 0
  %scevgep335 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv218.us, i64 2160
  %bound0337 = icmp ult float* %scevgep320, %scevgep329
  %bound1338 = icmp ult float* %scevgep326, %scevgep323
  %found.conflict339 = and i1 %bound0337, %bound1338
  %bound0340 = icmp ult float* %scevgep320, %scevgep335
  %bound1341 = icmp ult float* %scevgep332, %scevgep323
  %found.conflict342 = and i1 %bound0340, %bound1341
  %conflict.rdx343 = or i1 %found.conflict339, %found.conflict342
  br i1 %conflict.rdx343, label %.preheader.us.new.preheader, label %vector.body310.preheader

vector.body310.preheader:                         ; preds = %.preheader.us
  br label %vector.body310

vector.body310:                                   ; preds = %vector.body310.preheader, %vector.body310
  %index347 = phi i64 [ %index.next348, %vector.body310 ], [ 0, %vector.body310.preheader ]
  %155 = shl i64 %index347, 1
  %156 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv218.us, i64 %155
  %157 = bitcast float* %156 to <8 x float>*
  %wide.vec356 = load <8 x float>, <8 x float>* %157, align 4, !alias.scope !14
  %158 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv218.us, i64 %155
  %159 = bitcast float* %158 to <8 x float>*
  %wide.vec359 = load <8 x float>, <8 x float>* %159, align 4, !alias.scope !17
  %160 = fadd <8 x float> %wide.vec356, %wide.vec359
  %161 = shufflevector <8 x float> %160, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %162 = or i64 %155, 1
  %163 = fadd <8 x float> %wide.vec356, %wide.vec359
  %164 = shufflevector <8 x float> %163, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %165 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 %162
  %166 = getelementptr float, float* %165, i64 -1
  %167 = bitcast float* %166 to <8 x float>*
  %interleaved.vec362 = shufflevector <4 x float> %161, <4 x float> %164, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec362, <8 x float>* %167, align 4, !alias.scope !19, !noalias !21
  %index.next348 = add nuw nsw i64 %index347, 4
  %168 = icmp eq i64 %index.next348, 1080
  br i1 %168, label %middle.block311, label %vector.body310, !llvm.loop !22

middle.block311:                                  ; preds = %vector.body310
  br label %._crit_edge.us

.preheader.us.new.preheader:                      ; preds = %.preheader.us
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv.us = phi i64 [ %indvars.iv.next.us.1, %.preheader.us.new ], [ 0, %.preheader.us.new.preheader ]
  %169 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv218.us, i64 %indvars.iv.us
  %170 = load float, float* %169, align 4
  %171 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv218.us, i64 %indvars.iv.us
  %172 = load float, float* %171, align 4
  %173 = fadd float %170, %172
  %174 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 %indvars.iv.us
  store float %173, float* %174, align 4
  %indvars.iv.next.us = or i64 %indvars.iv.us, 1
  %175 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv218.us, i64 %indvars.iv.next.us
  %176 = load float, float* %175, align 4
  %177 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv218.us, i64 %indvars.iv.next.us
  %178 = load float, float* %177, align 4
  %179 = fadd float %176, %178
  %180 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 %indvars.iv.next.us
  store float %179, float* %180, align 4
  %indvars.iv.next.us.1 = add nuw nsw i64 %indvars.iv.us, 2
  %exitcond.us.1 = icmp eq i64 %indvars.iv.next.us.1, 2160
  br i1 %exitcond.us.1, label %._crit_edge.us.loopexit, label %.preheader.us.new, !llvm.loop !23

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block311
  %indvars.iv.next219.us = add nuw nsw i64 %indvars.iv218.us, 1
  %exitcond221.us = icmp eq i64 %indvars.iv.next219.us, 4096
  br i1 %exitcond221.us, label %._crit_edge179, label %.preheader.us

._crit_edge179:                                   ; preds = %._crit_edge.us
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
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph
  %indvars.iv = phi i64 [ 0, %.preheader.lr.ph ], [ %indvars.iv.next, %._crit_edge.us ]
  %7 = mul nuw nsw i64 %indvars.iv, 2160
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
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %14) #6
  br label %15

; <label>:15:                                     ; preds = %13, %8
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv, i64 %indvars.iv.us
  %18 = load float, float* %17, align 4
  %19 = fpext float %18 to double
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %19) #7
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 2160
  br i1 %exitcond.us, label %._crit_edge.us, label %8

._crit_edge.us:                                   ; preds = %15
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next, 4096
  br i1 %exitcond19, label %._crit_edge15, label %.preheader.us

._crit_edge15:                                    ; preds = %._crit_edge.us
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
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
