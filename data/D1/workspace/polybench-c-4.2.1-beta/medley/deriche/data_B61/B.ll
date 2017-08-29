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
  %4 = call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %5 = call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %6 = call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %7 = call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %8 = bitcast i8* %4 to [2160 x float]*
  %9 = bitcast i8* %5 to [2160 x float]*
  call void @init_array(float* nonnull %3, [2160 x float]* %8)
  call void (...) @polybench_timer_start() #5
  %10 = load float, float* %3, align 4
  %11 = bitcast i8* %6 to [2160 x float]*
  %12 = bitcast i8* %7 to [2160 x float]*
  call void @kernel_deriche(float %10, [2160 x float]* %8, [2160 x float]* %9, [2160 x float]* %11, [2160 x float]* %12)
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
  call void @print_array([2160 x float]* %18)
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
define internal void @init_array(float* nocapture, [2160 x float]* nocapture) #2 {
.preheader.us.preheader:
  store float 2.500000e-01, float* %0, align 4
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next, %._crit_edge.us ]
  %2 = mul nuw nsw i64 %indvars.iv, 313
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %2, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %.preheader.us
  %index = phi i64 [ 0, %.preheader.us ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %.preheader.us ], [ %vec.ind.next, %vector.body ]
  %3 = mul nuw nsw <4 x i64> %vec.ind, <i64 991, i64 991, i64 991, i64 991>
  %4 = add <4 x i64> %3, %broadcast.splat
  %5 = trunc <4 x i64> %4 to <4 x i32>
  %6 = srem <4 x i32> %5, <i32 65536, i32 65536, i32 65536, i32 65536>
  %7 = sitofp <4 x i32> %6 to <4 x float>
  %8 = fdiv <4 x float> %7, <float 6.553500e+04, float 6.553500e+04, float 6.553500e+04, float 6.553500e+04>
  %9 = getelementptr inbounds [2160 x float], [2160 x float]* %1, i64 %indvars.iv, i64 %index
  %10 = bitcast float* %9 to <4 x float>*
  store <4 x float> %8, <4 x float>* %10, align 4
  %index.next = add nuw nsw i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %11 = icmp eq i64 %index.next, 2160
  br i1 %11, label %._crit_edge.us, label %vector.body, !llvm.loop !1

._crit_edge.us:                                   ; preds = %vector.body
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 4096
  br i1 %exitcond, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_deriche(float, [2160 x float]* nocapture readonly, [2160 x float]* nocapture, [2160 x float]* nocapture, [2160 x float]* nocapture) #0 {
.preheader176.us.preheader:
  %5 = fsub float -0.000000e+00, %0
  %6 = call float @expf(float %5) #5
  %7 = fsub float 1.000000e+00, %6
  %8 = call float @expf(float %5) #5
  %9 = fsub float 1.000000e+00, %8
  %10 = fmul float %7, %9
  %11 = fmul float %0, 2.000000e+00
  %12 = call float @expf(float %5) #5
  %13 = fmul float %11, %12
  %14 = fadd float %13, 1.000000e+00
  %15 = call float @expf(float %11) #5
  %16 = fsub float %14, %15
  %17 = fdiv float %10, %16
  %18 = call float @expf(float %5) #5
  %19 = fmul float %18, %17
  %20 = call float @expf(float %5) #5
  %21 = fmul float %20, %17
  %22 = insertelement <2 x float> undef, float %0, i32 0
  %23 = shufflevector <2 x float> %22, <2 x float> undef, <2 x i32> zeroinitializer
  %24 = fadd <2 x float> %23, <float -1.000000e+00, float 1.000000e+00>
  %25 = insertelement <2 x float> undef, float %19, i32 0
  %26 = insertelement <2 x float> %25, float %21, i32 1
  %27 = fmul <2 x float> %24, %26
  %28 = extractelement <2 x float> %27, i32 0
  %29 = fmul float %0, -2.000000e+00
  %30 = call float @expf(float %29) #5
  %31 = fmul float %17, %30
  %exp2 = call float @llvm.exp2.f32(float %5)
  %32 = call float @expf(float %29) #5
  %33 = fsub float -0.000000e+00, %32
  %34 = insertelement <2 x float> undef, float %28, i32 0
  %35 = insertelement <2 x float> %34, float %17, i32 1
  br label %.preheader176.us.new

.preheader176.us.new:                             ; preds = %._crit_edge216.us, %.preheader176.us.preheader
  %indvars.iv254.us = phi i64 [ %indvars.iv.next255.us, %._crit_edge216.us ], [ 0, %.preheader176.us.preheader ]
  br label %36

; <label>:36:                                     ; preds = %36, %.preheader176.us.new
  %indvars.iv250.us = phi i64 [ 0, %.preheader176.us.new ], [ %indvars.iv.next251.us.1, %36 ]
  %.0155213.us = phi float [ 0.000000e+00, %.preheader176.us.new ], [ %59, %36 ]
  %.0157212.us = phi float [ 0.000000e+00, %.preheader176.us.new ], [ %57, %36 ]
  %.0159211.us = phi float [ 0.000000e+00, %.preheader176.us.new ], [ %45, %36 ]
  %37 = getelementptr inbounds [2160 x float], [2160 x float]* %1, i64 %indvars.iv254.us, i64 %indvars.iv250.us
  %38 = load float, float* %37, align 4
  %39 = fmul float %17, %38
  %40 = fmul float %28, %.0155213.us
  %41 = fadd float %40, %39
  %42 = fmul float %exp2, %.0157212.us
  %43 = fadd float %42, %41
  %44 = fmul float %.0159211.us, %33
  %45 = fadd float %44, %43
  %46 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv254.us, i64 %indvars.iv250.us
  store float %45, float* %46, align 4
  %47 = bitcast float* %37 to <2 x float>*
  %indvars.iv.next251.us = or i64 %indvars.iv250.us, 1
  %48 = getelementptr inbounds [2160 x float], [2160 x float]* %1, i64 %indvars.iv254.us, i64 %indvars.iv.next251.us
  %49 = load <2 x float>, <2 x float>* %47, align 4
  %50 = fmul <2 x float> %35, %49
  %51 = extractelement <2 x float> %50, i32 0
  %52 = extractelement <2 x float> %50, i32 1
  %53 = fadd float %51, %52
  %54 = fmul float %exp2, %45
  %55 = fadd float %54, %53
  %56 = fmul float %.0157212.us, %33
  %57 = fadd float %56, %55
  %58 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv254.us, i64 %indvars.iv.next251.us
  store float %57, float* %58, align 4
  %59 = load float, float* %48, align 4
  %indvars.iv.next251.us.1 = add nuw nsw i64 %indvars.iv250.us, 2
  %exitcond253.us.1 = icmp eq i64 %indvars.iv.next251.us.1, 2160
  br i1 %exitcond253.us.1, label %._crit_edge216.us, label %36

._crit_edge216.us:                                ; preds = %36
  %indvars.iv.next255.us = add nuw nsw i64 %indvars.iv254.us, 1
  %exitcond257.us = icmp eq i64 %indvars.iv.next255.us, 4096
  br i1 %exitcond257.us, label %.lr.ph210.split.us.preheader, label %.preheader176.us.new

.lr.ph210.split.us.preheader:                     ; preds = %._crit_edge216.us
  %60 = extractelement <2 x float> %27, i32 1
  %61 = fsub float -0.000000e+00, %31
  br label %.lr.ph210.split.us

.lr.ph210.split.us:                               ; preds = %.lr.ph210.split.us.preheader, %._crit_edge208.us
  %indvars.iv246.us = phi i64 [ %indvars.iv.next247.us, %._crit_edge208.us ], [ 0, %.lr.ph210.split.us.preheader ]
  br label %62

; <label>:62:                                     ; preds = %62, %.lr.ph210.split.us
  %indvars.iv244.us = phi i64 [ 2159, %.lr.ph210.split.us ], [ %indvars.iv.next245.us.1, %62 ]
  %.0161204.us = phi float [ 0.000000e+00, %.lr.ph210.split.us ], [ %82, %62 ]
  %.0162203.us = phi float [ 0.000000e+00, %.lr.ph210.split.us ], [ %72, %62 ]
  %.0165202.us = phi float [ 0.000000e+00, %.lr.ph210.split.us ], [ %79, %62 ]
  %.0167201.us = phi float [ 0.000000e+00, %.lr.ph210.split.us ], [ %69, %62 ]
  %63 = fmul float %60, %.0161204.us
  %64 = fmul float %.0162203.us, %61
  %65 = fadd float %64, %63
  %66 = fmul float %exp2, %.0165202.us
  %67 = fadd float %66, %65
  %68 = fmul float %.0167201.us, %33
  %69 = fadd float %68, %67
  %70 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv246.us, i64 %indvars.iv244.us
  store float %69, float* %70, align 4
  %71 = getelementptr inbounds [2160 x float], [2160 x float]* %1, i64 %indvars.iv246.us, i64 %indvars.iv244.us
  %72 = load float, float* %71, align 4
  %indvars.iv.next245.us = add nsw i64 %indvars.iv244.us, -1
  %73 = fmul float %60, %72
  %74 = fmul float %.0161204.us, %61
  %75 = fadd float %74, %73
  %76 = fmul float %exp2, %69
  %77 = fadd float %76, %75
  %78 = fmul float %.0165202.us, %33
  %79 = fadd float %78, %77
  %80 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv246.us, i64 %indvars.iv.next245.us
  store float %79, float* %80, align 4
  %81 = getelementptr inbounds [2160 x float], [2160 x float]* %1, i64 %indvars.iv246.us, i64 %indvars.iv.next245.us
  %82 = load float, float* %81, align 4
  %indvars.iv.next245.us.1 = add nsw i64 %indvars.iv244.us, -2
  %83 = icmp sgt i64 %indvars.iv244.us, 1
  br i1 %83, label %62, label %._crit_edge208.us

._crit_edge208.us:                                ; preds = %62
  %indvars.iv.next247.us = add nuw nsw i64 %indvars.iv246.us, 1
  %exitcond249.us = icmp eq i64 %indvars.iv.next247.us, 4096
  br i1 %exitcond249.us, label %.preheader173.us.new.preheader, label %.lr.ph210.split.us

.preheader173.us.new.preheader:                   ; preds = %._crit_edge208.us
  br label %.preheader173.us.new

.preheader173.us.new:                             ; preds = %.preheader173.us.new.preheader, %._crit_edge199.us
  %indvars.iv240.us = phi i64 [ %indvars.iv.next241.us, %._crit_edge199.us ], [ 0, %.preheader173.us.new.preheader ]
  %scevgep = getelementptr [2160 x float], [2160 x float]* %2, i64 %indvars.iv240.us, i64 0
  %84 = add nuw nsw i64 %indvars.iv240.us, 1
  %scevgep278 = getelementptr [2160 x float], [2160 x float]* %2, i64 %84, i64 0
  %scevgep280 = getelementptr [2160 x float], [2160 x float]* %3, i64 %indvars.iv240.us, i64 0
  %scevgep282 = getelementptr [2160 x float], [2160 x float]* %3, i64 %84, i64 0
  %scevgep284 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 0
  %scevgep286 = getelementptr [2160 x float], [2160 x float]* %4, i64 %84, i64 0
  %bound0 = icmp ult float* %scevgep, %scevgep282
  %bound1 = icmp ult float* %scevgep280, %scevgep278
  %found.conflict = and i1 %bound0, %bound1
  %bound0288 = icmp ult float* %scevgep, %scevgep286
  %bound1289 = icmp ult float* %scevgep284, %scevgep278
  %found.conflict290 = and i1 %bound0288, %bound1289
  %conflict.rdx = or i1 %found.conflict, %found.conflict290
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader173.us.new
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader173.us.new
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = shl i64 %index, 1
  %85 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv240.us, i64 %offset.idx
  %86 = bitcast float* %85 to <8 x float>*
  %wide.vec = load <8 x float>, <8 x float>* %86, align 4, !alias.scope !4
  %87 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 %offset.idx
  %88 = bitcast float* %87 to <8 x float>*
  %wide.vec292 = load <8 x float>, <8 x float>* %88, align 4, !alias.scope !7
  %89 = fadd <8 x float> %wide.vec, %wide.vec292
  %90 = shufflevector <8 x float> %89, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %91 = or i64 %offset.idx, 1
  %92 = fadd <8 x float> %wide.vec, %wide.vec292
  %93 = shufflevector <8 x float> %92, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %94 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv240.us, i64 %91
  %95 = getelementptr float, float* %94, i64 -1
  %96 = bitcast float* %95 to <8 x float>*
  %interleaved.vec = shufflevector <4 x float> %90, <4 x float> %93, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec, <8 x float>* %96, align 4, !alias.scope !9, !noalias !11
  %index.next = add nuw nsw i64 %index, 4
  %97 = icmp eq i64 %index.next, 1080
  br i1 %97, label %._crit_edge199.us.loopexit2, label %vector.body, !llvm.loop !12

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv236.us = phi i64 [ %indvars.iv.next237.us.1, %scalar.ph ], [ 0, %scalar.ph.preheader ]
  %98 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv240.us, i64 %indvars.iv236.us
  %99 = load float, float* %98, align 4
  %100 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 %indvars.iv236.us
  %101 = load float, float* %100, align 4
  %102 = fadd float %99, %101
  %103 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv240.us, i64 %indvars.iv236.us
  store float %102, float* %103, align 4
  %indvars.iv.next237.us = or i64 %indvars.iv236.us, 1
  %104 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv240.us, i64 %indvars.iv.next237.us
  %105 = load float, float* %104, align 4
  %106 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 %indvars.iv.next237.us
  %107 = load float, float* %106, align 4
  %108 = fadd float %105, %107
  %109 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv240.us, i64 %indvars.iv.next237.us
  store float %108, float* %109, align 4
  %indvars.iv.next237.us.1 = add nuw nsw i64 %indvars.iv236.us, 2
  %exitcond239.us.1 = icmp eq i64 %indvars.iv.next237.us.1, 2160
  br i1 %exitcond239.us.1, label %._crit_edge199.us.loopexit, label %scalar.ph, !llvm.loop !13

._crit_edge199.us.loopexit:                       ; preds = %scalar.ph
  br label %._crit_edge199.us

._crit_edge199.us.loopexit2:                      ; preds = %vector.body
  br label %._crit_edge199.us

._crit_edge199.us:                                ; preds = %._crit_edge199.us.loopexit2, %._crit_edge199.us.loopexit
  %indvars.iv.next241.us = add nuw nsw i64 %indvars.iv240.us, 1
  %exitcond243.us = icmp eq i64 %indvars.iv.next241.us, 4096
  br i1 %exitcond243.us, label %.preheader171.us.new.preheader, label %.preheader173.us.new

.preheader171.us.new.preheader:                   ; preds = %._crit_edge199.us
  br label %.preheader171.us.new

.preheader171.us.new:                             ; preds = %.preheader171.us.new.preheader, %._crit_edge195.us
  %indvars.iv232.us = phi i64 [ %indvars.iv.next233.us, %._crit_edge195.us ], [ 0, %.preheader171.us.new.preheader ]
  br label %110

; <label>:110:                                    ; preds = %110, %.preheader171.us.new
  %indvars.iv228.us = phi i64 [ 0, %.preheader171.us.new ], [ %indvars.iv.next229.us.1, %110 ]
  %.0156192.us = phi float [ 0.000000e+00, %.preheader171.us.new ], [ %132, %110 ]
  %.1158191.us = phi float [ 0.000000e+00, %.preheader171.us.new ], [ %130, %110 ]
  %.1160190.us = phi float [ 0.000000e+00, %.preheader171.us.new ], [ %119, %110 ]
  %111 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv228.us, i64 %indvars.iv232.us
  %112 = load float, float* %111, align 4
  %113 = fmul float %17, %112
  %114 = fmul float %28, %.0156192.us
  %115 = fadd float %114, %113
  %116 = fmul float %exp2, %.1158191.us
  %117 = fadd float %116, %115
  %118 = fmul float %.1160190.us, %33
  %119 = fadd float %118, %117
  %120 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv228.us, i64 %indvars.iv232.us
  store float %119, float* %120, align 4
  %121 = load float, float* %111, align 4
  %indvars.iv.next229.us = or i64 %indvars.iv228.us, 1
  %122 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv.next229.us, i64 %indvars.iv232.us
  %123 = load float, float* %122, align 4
  %124 = fmul float %17, %123
  %125 = fmul float %28, %121
  %126 = fadd float %125, %124
  %127 = fmul float %exp2, %119
  %128 = fadd float %127, %126
  %129 = fmul float %.1158191.us, %33
  %130 = fadd float %129, %128
  %131 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv.next229.us, i64 %indvars.iv232.us
  store float %130, float* %131, align 4
  %132 = load float, float* %122, align 4
  %indvars.iv.next229.us.1 = add nuw nsw i64 %indvars.iv228.us, 2
  %exitcond231.us.1 = icmp eq i64 %indvars.iv.next229.us.1, 4096
  br i1 %exitcond231.us.1, label %._crit_edge195.us, label %110

._crit_edge195.us:                                ; preds = %110
  %indvars.iv.next233.us = add nuw nsw i64 %indvars.iv232.us, 1
  %exitcond235.us = icmp eq i64 %indvars.iv.next233.us, 2160
  br i1 %exitcond235.us, label %.lr.ph189.split.us.preheader, label %.preheader171.us.new

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
  %134 = fmul float %60, %.0163183.us
  %135 = fmul float %.0164182.us, %61
  %136 = fadd float %135, %134
  %137 = fmul float %exp2, %.1166181.us
  %138 = fadd float %137, %136
  %139 = fmul float %.1168180.us, %33
  %140 = fadd float %139, %138
  %141 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv222.us, i64 %indvars.iv224.us
  store float %140, float* %141, align 4
  %142 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv222.us, i64 %indvars.iv224.us
  %143 = load float, float* %142, align 4
  %indvars.iv.next223.us = add nsw i64 %indvars.iv222.us, -1
  %144 = fmul float %60, %143
  %145 = fmul float %.0163183.us, %61
  %146 = fadd float %145, %144
  %147 = fmul float %exp2, %140
  %148 = fadd float %147, %146
  %149 = fmul float %.1166181.us, %33
  %150 = fadd float %149, %148
  %151 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next223.us, i64 %indvars.iv224.us
  store float %150, float* %151, align 4
  %152 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv.next223.us, i64 %indvars.iv224.us
  %153 = load float, float* %152, align 4
  %indvars.iv.next223.us.1 = add nsw i64 %indvars.iv222.us, -2
  %154 = icmp sgt i64 %indvars.iv222.us, 1
  br i1 %154, label %133, label %._crit_edge187.us

._crit_edge187.us:                                ; preds = %133
  %indvars.iv.next225.us = add nuw nsw i64 %indvars.iv224.us, 1
  %exitcond227.us = icmp eq i64 %indvars.iv.next225.us, 2160
  br i1 %exitcond227.us, label %.preheader.us.new.preheader, label %.lr.ph189.split.us

.preheader.us.new.preheader:                      ; preds = %._crit_edge187.us
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %._crit_edge.us
  %indvars.iv218.us = phi i64 [ %indvars.iv.next219.us, %._crit_edge.us ], [ 0, %.preheader.us.new.preheader ]
  %scevgep300 = getelementptr [2160 x float], [2160 x float]* %2, i64 %indvars.iv218.us, i64 0
  %155 = add nuw nsw i64 %indvars.iv218.us, 1
  %scevgep302 = getelementptr [2160 x float], [2160 x float]* %2, i64 %155, i64 0
  %scevgep304 = getelementptr [2160 x float], [2160 x float]* %3, i64 %indvars.iv218.us, i64 0
  %scevgep306 = getelementptr [2160 x float], [2160 x float]* %3, i64 %155, i64 0
  %scevgep308 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 0
  %scevgep310 = getelementptr [2160 x float], [2160 x float]* %4, i64 %155, i64 0
  %bound0312 = icmp ult float* %scevgep300, %scevgep306
  %bound1313 = icmp ult float* %scevgep304, %scevgep302
  %found.conflict314 = and i1 %bound0312, %bound1313
  %bound0315 = icmp ult float* %scevgep300, %scevgep310
  %bound1316 = icmp ult float* %scevgep308, %scevgep302
  %found.conflict317 = and i1 %bound0315, %bound1316
  %conflict.rdx318 = or i1 %found.conflict314, %found.conflict317
  br i1 %conflict.rdx318, label %scalar.ph297.preheader, label %vector.body295.preheader

vector.body295.preheader:                         ; preds = %.preheader.us.new
  br label %vector.body295

scalar.ph297.preheader:                           ; preds = %.preheader.us.new
  br label %scalar.ph297

vector.body295:                                   ; preds = %vector.body295.preheader, %vector.body295
  %index322 = phi i64 [ %index.next323, %vector.body295 ], [ 0, %vector.body295.preheader ]
  %offset.idx326 = shl i64 %index322, 1
  %156 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv218.us, i64 %offset.idx326
  %157 = bitcast float* %156 to <8 x float>*
  %wide.vec330 = load <8 x float>, <8 x float>* %157, align 4, !alias.scope !14
  %158 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 %offset.idx326
  %159 = bitcast float* %158 to <8 x float>*
  %wide.vec333 = load <8 x float>, <8 x float>* %159, align 4, !alias.scope !17
  %160 = fadd <8 x float> %wide.vec330, %wide.vec333
  %161 = shufflevector <8 x float> %160, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %162 = or i64 %offset.idx326, 1
  %163 = fadd <8 x float> %wide.vec330, %wide.vec333
  %164 = shufflevector <8 x float> %163, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %165 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv218.us, i64 %162
  %166 = getelementptr float, float* %165, i64 -1
  %167 = bitcast float* %166 to <8 x float>*
  %interleaved.vec336 = shufflevector <4 x float> %161, <4 x float> %164, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec336, <8 x float>* %167, align 4, !alias.scope !19, !noalias !21
  %index.next323 = add nuw nsw i64 %index322, 4
  %168 = icmp eq i64 %index.next323, 1080
  br i1 %168, label %._crit_edge.us.loopexit1, label %vector.body295, !llvm.loop !22

scalar.ph297:                                     ; preds = %scalar.ph297.preheader, %scalar.ph297
  %indvars.iv.us = phi i64 [ %indvars.iv.next.us.1, %scalar.ph297 ], [ 0, %scalar.ph297.preheader ]
  %169 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv218.us, i64 %indvars.iv.us
  %170 = load float, float* %169, align 4
  %171 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 %indvars.iv.us
  %172 = load float, float* %171, align 4
  %173 = fadd float %170, %172
  %174 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv218.us, i64 %indvars.iv.us
  store float %173, float* %174, align 4
  %indvars.iv.next.us = or i64 %indvars.iv.us, 1
  %175 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv218.us, i64 %indvars.iv.next.us
  %176 = load float, float* %175, align 4
  %177 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 %indvars.iv.next.us
  %178 = load float, float* %177, align 4
  %179 = fadd float %176, %178
  %180 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv218.us, i64 %indvars.iv.next.us
  store float %179, float* %180, align 4
  %indvars.iv.next.us.1 = add nuw nsw i64 %indvars.iv.us, 2
  %exitcond.us.1 = icmp eq i64 %indvars.iv.next.us.1, 2160
  br i1 %exitcond.us.1, label %._crit_edge.us.loopexit, label %scalar.ph297, !llvm.loop !23

._crit_edge.us.loopexit:                          ; preds = %scalar.ph297
  br label %._crit_edge.us

._crit_edge.us.loopexit1:                         ; preds = %vector.body295
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit1, %._crit_edge.us.loopexit
  %indvars.iv.next219.us = add nuw nsw i64 %indvars.iv218.us, 1
  %exitcond221.us = icmp eq i64 %indvars.iv.next219.us, 4096
  br i1 %exitcond221.us, label %._crit_edge179, label %.preheader.us.new

._crit_edge179:                                   ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([2160 x float]* nocapture readonly) #0 {
.preheader.us.preheader:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #6
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next, %._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv, 2160
  br label %6

; <label>:6:                                      ; preds = %13, %.preheader.us
  %indvars.iv.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %13 ]
  %7 = add nuw nsw i64 %indvars.iv.us, %5
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %13

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %13

; <label>:13:                                     ; preds = %11, %6
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2160 x float], [2160 x float]* %0, i64 %indvars.iv, i64 %indvars.iv.us
  %16 = load float, float* %15, align 4
  %17 = fpext float %16 to double
  %18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %17) #7
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 2160
  br i1 %exitcond.us, label %._crit_edge.us, label %6

._crit_edge.us:                                   ; preds = %13
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 4096
  br i1 %exitcond, label %._crit_edge15, label %.preheader.us

._crit_edge15:                                    ; preds = %._crit_edge.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8*) #3

; Function Attrs: nounwind
declare float @expf(float) #3

declare i32 @fprintf(%struct._IO_FILE*, i8*, ...) #1

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
