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
  call fastcc void @init_array(i32 4096, i32 2160, float* nonnull %3, [2160 x float]* %8, [2160 x float]* %9)
  tail call void (...) @polybench_timer_start() #5
  %10 = load float, float* %3, align 4
  %11 = bitcast i8* %6 to [2160 x float]*
  %12 = bitcast i8* %7 to [2160 x float]*
  tail call fastcc void @kernel_deriche(i32 4096, i32 2160, float %10, [2160 x float]* %8, [2160 x float]* %9, [2160 x float]* %11, [2160 x float]* %12)
  tail call void (...) @polybench_timer_stop() #5
  tail call void (...) @polybench_timer_print() #5
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %19

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to [2160 x float]*
  tail call fastcc void @print_array(i32 4096, i32 2160, [2160 x float]* %18)
  br label %19

; <label>:19:                                     ; preds = %14, %17, %2
  tail call void @free(i8* %4) #5
  tail call void @free(i8* %5) #5
  tail call void @free(i8* %6) #5
  tail call void @free(i8* %7) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, float* nocapture, [2160 x float]* nocapture, [2160 x float]* nocapture readnone) unnamed_addr #2 {
.preheader.us.preheader:
  store float 2.500000e-01, float* %2, align 4
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv14 = phi i64 [ %indvars.iv.next15, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %5 = mul nuw nsw i64 %indvars.iv14, 313
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %5, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %.preheader.us
  %index = phi i64 [ 0, %.preheader.us ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %.preheader.us ], [ %vec.ind.next, %vector.body ]
  %6 = mul nuw nsw <4 x i64> %vec.ind, <i64 991, i64 991, i64 991, i64 991>
  %7 = add nuw nsw <4 x i64> %6, %broadcast.splat
  %8 = trunc <4 x i64> %7 to <4 x i32>
  %9 = srem <4 x i32> %8, <i32 65536, i32 65536, i32 65536, i32 65536>
  %10 = sitofp <4 x i32> %9 to <4 x float>
  %11 = fdiv <4 x float> %10, <float 6.553500e+04, float 6.553500e+04, float 6.553500e+04, float 6.553500e+04>
  %12 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv14, i64 %index
  %13 = bitcast float* %12 to <4 x float>*
  store <4 x float> %11, <4 x float>* %13, align 4
  %index.next = add nuw nsw i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %14 = icmp eq i64 %index.next, 2160
  br i1 %14, label %._crit_edge.us, label %vector.body, !llvm.loop !1

._crit_edge.us:                                   ; preds = %vector.body
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond = icmp eq i64 %indvars.iv.next15, 4096
  br i1 %exitcond, label %._crit_edge12, label %.preheader.us

._crit_edge12:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_deriche(i32, i32, float, [2160 x float]* nocapture readonly, [2160 x float]* nocapture, [2160 x float]* nocapture, [2160 x float]* nocapture) unnamed_addr #0 {
.preheader144.lr.ph:
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
  %exp2 = tail call float @llvm.exp2.f32(float %7)
  %34 = tail call float @expf(float %31) #5
  %35 = fsub float -0.000000e+00, %34
  %36 = insertelement <2 x float> undef, float %30, i32 0
  %37 = insertelement <2 x float> %36, float %19, i32 1
  br label %.preheader144.us

.preheader144.us:                                 ; preds = %.preheader144.lr.ph, %._crit_edge172.us
  %indvars.iv237 = phi i64 [ %indvars.iv.next238, %._crit_edge172.us ], [ 0, %.preheader144.lr.ph ]
  br label %.preheader144.us.new

.preheader144.us.new:                             ; preds = %.preheader144.us, %.preheader144.us.new
  %indvars.iv226 = phi i64 [ %indvars.iv.next227.1, %.preheader144.us.new ], [ 0, %.preheader144.us ]
  %38 = phi float [ %63, %.preheader144.us.new ], [ 0.000000e+00, %.preheader144.us ]
  %39 = phi float [ %61, %.preheader144.us.new ], [ 0.000000e+00, %.preheader144.us ]
  %40 = phi float [ %49, %.preheader144.us.new ], [ 0.000000e+00, %.preheader144.us ]
  %41 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv237, i64 %indvars.iv226
  %42 = load float, float* %41, align 4
  %43 = fmul float %19, %42
  %44 = fmul float %30, %38
  %45 = fadd float %44, %43
  %46 = fmul float %exp2, %39
  %47 = fadd float %46, %45
  %48 = fmul float %40, %35
  %49 = fadd float %48, %47
  %50 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv237, i64 %indvars.iv226
  store float %49, float* %50, align 4
  %51 = bitcast float* %41 to <2 x float>*
  %indvars.iv.next227 = or i64 %indvars.iv226, 1
  %52 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv237, i64 %indvars.iv.next227
  %53 = load <2 x float>, <2 x float>* %51, align 4
  %54 = fmul <2 x float> %37, %53
  %55 = extractelement <2 x float> %54, i32 0
  %56 = extractelement <2 x float> %54, i32 1
  %57 = fadd float %55, %56
  %58 = fmul float %exp2, %49
  %59 = fadd float %58, %57
  %60 = fmul float %39, %35
  %61 = fadd float %60, %59
  %62 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv237, i64 %indvars.iv.next227
  store float %61, float* %62, align 4
  %63 = load float, float* %52, align 4
  %indvars.iv.next227.1 = add nuw nsw i64 %indvars.iv226, 2
  %exitcond229.1 = icmp eq i64 %indvars.iv.next227.1, 2160
  br i1 %exitcond229.1, label %._crit_edge172.us, label %.preheader144.us.new

._crit_edge172.us:                                ; preds = %.preheader144.us.new
  %indvars.iv.next238 = add nuw nsw i64 %indvars.iv237, 1
  %exitcond250 = icmp eq i64 %indvars.iv.next238, 4096
  br i1 %exitcond250, label %.preheader142.us.preheader, label %.preheader144.us

.preheader142.us.preheader:                       ; preds = %._crit_edge172.us
  %64 = extractelement <2 x float> %29, i32 1
  %65 = fsub float -0.000000e+00, %33
  br label %.preheader142.us

.preheader142.us:                                 ; preds = %.preheader142.us.preheader, %._crit_edge168.us
  %indvars.iv221 = phi i64 [ %indvars.iv.next222, %._crit_edge168.us ], [ 0, %.preheader142.us.preheader ]
  br label %66

; <label>:66:                                     ; preds = %66, %.preheader142.us
  %indvars.iv219 = phi i64 [ %indvars.iv.next220, %66 ], [ 2160, %.preheader142.us ]
  %.sroa.038.0165.us = phi i32 [ %81, %66 ], [ 0, %.preheader142.us ]
  %67 = phi float [ %82, %66 ], [ 0.000000e+00, %.preheader142.us ]
  %.sroa.037.0164.us = phi i32 [ %.sroa.038.0165.us, %66 ], [ 0, %.preheader142.us ]
  %68 = phi float [ %77, %66 ], [ 0.000000e+00, %.preheader142.us ]
  %69 = phi float [ %68, %66 ], [ 0.000000e+00, %.preheader142.us ]
  %indvars.iv.next220 = add nsw i64 %indvars.iv219, -1
  %70 = fmul float %64, %67
  %71 = bitcast i32 %.sroa.037.0164.us to float
  %72 = fmul float %71, %65
  %73 = fadd float %70, %72
  %74 = fmul float %exp2, %68
  %75 = fadd float %74, %73
  %76 = fmul float %69, %35
  %77 = fadd float %76, %75
  %78 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv221, i64 %indvars.iv.next220
  store float %77, float* %78, align 4
  %79 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv221, i64 %indvars.iv.next220
  %80 = bitcast float* %79 to i32*
  %81 = load i32, i32* %80, align 4
  %82 = bitcast i32 %81 to float
  %83 = icmp sgt i64 %indvars.iv219, 1
  br i1 %83, label %66, label %._crit_edge168.us

._crit_edge168.us:                                ; preds = %66
  %indvars.iv.next222 = add nuw nsw i64 %indvars.iv221, 1
  %exitcond249 = icmp eq i64 %indvars.iv.next222, 4096
  br i1 %exitcond249, label %.preheader140.us.preheader, label %.preheader142.us

.preheader140.us.preheader:                       ; preds = %._crit_edge168.us
  br label %.preheader140.us

.preheader140.us:                                 ; preds = %.preheader140.us.preheader, %._crit_edge161.us
  %indvars.iv214 = phi i64 [ %indvars.iv.next215, %._crit_edge161.us ], [ 0, %.preheader140.us.preheader ]
  %scevgep251 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv214, i64 0
  %scevgep254 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv214, i64 2160
  %scevgep257 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv214, i64 0
  %scevgep260 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv214, i64 2160
  %scevgep263 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv214, i64 0
  %scevgep266 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv214, i64 2160
  %bound0 = icmp ult float* %scevgep251, %scevgep260
  %bound1 = icmp ult float* %scevgep257, %scevgep254
  %found.conflict = and i1 %bound0, %bound1
  %bound0268 = icmp ult float* %scevgep251, %scevgep266
  %bound1269 = icmp ult float* %scevgep263, %scevgep254
  %found.conflict270 = and i1 %bound0268, %bound1269
  %conflict.rdx = or i1 %found.conflict, %found.conflict270
  br i1 %conflict.rdx, label %.preheader140.us.new.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader140.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %84 = shl i64 %index, 1
  %85 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv214, i64 %84
  %86 = bitcast float* %85 to <8 x float>*
  %wide.vec = load <8 x float>, <8 x float>* %86, align 4, !alias.scope !4
  %87 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv214, i64 %84
  %88 = bitcast float* %87 to <8 x float>*
  %wide.vec272 = load <8 x float>, <8 x float>* %88, align 4, !alias.scope !7
  %89 = fadd <8 x float> %wide.vec, %wide.vec272
  %90 = shufflevector <8 x float> %89, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %91 = or i64 %84, 1
  %92 = fadd <8 x float> %wide.vec, %wide.vec272
  %93 = shufflevector <8 x float> %92, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %94 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv214, i64 %91
  %95 = getelementptr float, float* %94, i64 -1
  %96 = bitcast float* %95 to <8 x float>*
  %interleaved.vec = shufflevector <4 x float> %90, <4 x float> %93, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec, <8 x float>* %96, align 4, !alias.scope !9, !noalias !11
  %index.next = add nuw nsw i64 %index, 4
  %97 = icmp eq i64 %index.next, 1080
  br i1 %97, label %middle.block, label %vector.body, !llvm.loop !12

middle.block:                                     ; preds = %vector.body
  br i1 true, label %._crit_edge161.us, label %.preheader140.us.new.preheader

.preheader140.us.new.preheader:                   ; preds = %middle.block, %.preheader140.us
  %indvars.iv206.ph = phi i64 [ 0, %.preheader140.us ], [ 2160, %middle.block ]
  br label %.preheader140.us.new

.preheader140.us.new:                             ; preds = %.preheader140.us.new.preheader, %.preheader140.us.new
  %indvars.iv206 = phi i64 [ %indvars.iv.next207.1, %.preheader140.us.new ], [ %indvars.iv206.ph, %.preheader140.us.new.preheader ]
  %98 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv214, i64 %indvars.iv206
  %99 = load float, float* %98, align 4
  %100 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv214, i64 %indvars.iv206
  %101 = load float, float* %100, align 4
  %102 = fadd float %99, %101
  %103 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv214, i64 %indvars.iv206
  store float %102, float* %103, align 4
  %indvars.iv.next207 = or i64 %indvars.iv206, 1
  %104 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv214, i64 %indvars.iv.next207
  %105 = load float, float* %104, align 4
  %106 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv214, i64 %indvars.iv.next207
  %107 = load float, float* %106, align 4
  %108 = fadd float %105, %107
  %109 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv214, i64 %indvars.iv.next207
  store float %108, float* %109, align 4
  %indvars.iv.next207.1 = add nuw nsw i64 %indvars.iv206, 2
  %exitcond209.1 = icmp eq i64 %indvars.iv.next207.1, 2160
  br i1 %exitcond209.1, label %._crit_edge161.us.loopexit, label %.preheader140.us.new, !llvm.loop !13

._crit_edge161.us.loopexit:                       ; preds = %.preheader140.us.new
  br label %._crit_edge161.us

._crit_edge161.us:                                ; preds = %._crit_edge161.us.loopexit, %middle.block
  %indvars.iv.next215 = add nuw nsw i64 %indvars.iv214, 1
  %exitcond248 = icmp eq i64 %indvars.iv.next215, 4096
  br i1 %exitcond248, label %.preheader138.us.preheader, label %.preheader140.us

.preheader138.us.preheader:                       ; preds = %._crit_edge161.us
  br label %.preheader138.us

.preheader138.us:                                 ; preds = %.preheader138.us.preheader, %._crit_edge157.us
  %indvars.iv201 = phi i64 [ %indvars.iv.next202, %._crit_edge157.us ], [ 0, %.preheader138.us.preheader ]
  br label %.preheader138.us.new

.preheader138.us.new:                             ; preds = %.preheader138.us, %.preheader138.us.new
  %indvars.iv191 = phi i64 [ %indvars.iv.next192.1, %.preheader138.us.new ], [ 0, %.preheader138.us ]
  %110 = phi float [ %134, %.preheader138.us.new ], [ 0.000000e+00, %.preheader138.us ]
  %111 = phi float [ %132, %.preheader138.us.new ], [ 0.000000e+00, %.preheader138.us ]
  %112 = phi float [ %121, %.preheader138.us.new ], [ 0.000000e+00, %.preheader138.us ]
  %113 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv191, i64 %indvars.iv201
  %114 = load float, float* %113, align 4
  %115 = fmul float %19, %114
  %116 = fmul float %30, %110
  %117 = fadd float %116, %115
  %118 = fmul float %exp2, %111
  %119 = fadd float %118, %117
  %120 = fmul float %112, %35
  %121 = fadd float %120, %119
  %122 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv191, i64 %indvars.iv201
  store float %121, float* %122, align 4
  %123 = load float, float* %113, align 4
  %indvars.iv.next192 = or i64 %indvars.iv191, 1
  %124 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next192, i64 %indvars.iv201
  %125 = load float, float* %124, align 4
  %126 = fmul float %19, %125
  %127 = fmul float %30, %123
  %128 = fadd float %127, %126
  %129 = fmul float %exp2, %121
  %130 = fadd float %129, %128
  %131 = fmul float %111, %35
  %132 = fadd float %131, %130
  %133 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv.next192, i64 %indvars.iv201
  store float %132, float* %133, align 4
  %134 = load float, float* %124, align 4
  %indvars.iv.next192.1 = add nuw nsw i64 %indvars.iv191, 2
  %exitcond194.1 = icmp eq i64 %indvars.iv.next192.1, 4096
  br i1 %exitcond194.1, label %._crit_edge157.us, label %.preheader138.us.new

._crit_edge157.us:                                ; preds = %.preheader138.us.new
  %indvars.iv.next202 = add nuw nsw i64 %indvars.iv201, 1
  %exitcond247 = icmp eq i64 %indvars.iv.next202, 2160
  br i1 %exitcond247, label %.preheader136.us.preheader, label %.preheader138.us

.preheader136.us.preheader:                       ; preds = %._crit_edge157.us
  br label %.preheader136.us

.preheader136.us:                                 ; preds = %.preheader136.us.preheader, %._crit_edge153.us
  %indvars.iv186 = phi i64 [ %indvars.iv.next187, %._crit_edge153.us ], [ 0, %.preheader136.us.preheader ]
  br label %135

; <label>:135:                                    ; preds = %135, %.preheader136.us
  %indvars.iv184 = phi i64 [ %indvars.iv.next185, %135 ], [ 4096, %.preheader136.us ]
  %.sroa.036.0150.us = phi i32 [ %150, %135 ], [ 0, %.preheader136.us ]
  %136 = phi float [ %151, %135 ], [ 0.000000e+00, %.preheader136.us ]
  %.sroa.035.0149.us = phi i32 [ %.sroa.036.0150.us, %135 ], [ 0, %.preheader136.us ]
  %137 = phi float [ %146, %135 ], [ 0.000000e+00, %.preheader136.us ]
  %138 = phi float [ %137, %135 ], [ 0.000000e+00, %.preheader136.us ]
  %indvars.iv.next185 = add nsw i64 %indvars.iv184, -1
  %139 = fmul float %64, %136
  %140 = bitcast i32 %.sroa.035.0149.us to float
  %141 = fmul float %140, %65
  %142 = fadd float %139, %141
  %143 = fmul float %exp2, %137
  %144 = fadd float %143, %142
  %145 = fmul float %138, %35
  %146 = fadd float %145, %144
  %147 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv.next185, i64 %indvars.iv186
  store float %146, float* %147, align 4
  %148 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next185, i64 %indvars.iv186
  %149 = bitcast float* %148 to i32*
  %150 = load i32, i32* %149, align 4
  %151 = bitcast i32 %150 to float
  %152 = icmp sgt i64 %indvars.iv184, 1
  br i1 %152, label %135, label %._crit_edge153.us

._crit_edge153.us:                                ; preds = %135
  %indvars.iv.next187 = add nuw nsw i64 %indvars.iv186, 1
  %exitcond = icmp eq i64 %indvars.iv.next187, 2160
  br i1 %exitcond, label %.preheader.us.preheader, label %.preheader136.us

.preheader.us.preheader:                          ; preds = %._crit_edge153.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv180 = phi i64 [ %indvars.iv.next181, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep285 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv180, i64 0
  %scevgep288 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv180, i64 2160
  %scevgep291 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv180, i64 0
  %scevgep294 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv180, i64 2160
  %scevgep297 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv180, i64 0
  %scevgep300 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv180, i64 2160
  %bound0302 = icmp ult float* %scevgep285, %scevgep294
  %bound1303 = icmp ult float* %scevgep291, %scevgep288
  %found.conflict304 = and i1 %bound0302, %bound1303
  %bound0305 = icmp ult float* %scevgep285, %scevgep300
  %bound1306 = icmp ult float* %scevgep297, %scevgep288
  %found.conflict307 = and i1 %bound0305, %bound1306
  %conflict.rdx308 = or i1 %found.conflict304, %found.conflict307
  br i1 %conflict.rdx308, label %.preheader.us.new.preheader, label %vector.body275.preheader

vector.body275.preheader:                         ; preds = %.preheader.us
  br label %vector.body275

vector.body275:                                   ; preds = %vector.body275.preheader, %vector.body275
  %index312 = phi i64 [ %index.next313, %vector.body275 ], [ 0, %vector.body275.preheader ]
  %153 = shl i64 %index312, 1
  %154 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv180, i64 %153
  %155 = bitcast float* %154 to <8 x float>*
  %wide.vec321 = load <8 x float>, <8 x float>* %155, align 4, !alias.scope !14
  %156 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv180, i64 %153
  %157 = bitcast float* %156 to <8 x float>*
  %wide.vec324 = load <8 x float>, <8 x float>* %157, align 4, !alias.scope !17
  %158 = fadd <8 x float> %wide.vec321, %wide.vec324
  %159 = shufflevector <8 x float> %158, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %160 = or i64 %153, 1
  %161 = fadd <8 x float> %wide.vec321, %wide.vec324
  %162 = shufflevector <8 x float> %161, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %163 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv180, i64 %160
  %164 = getelementptr float, float* %163, i64 -1
  %165 = bitcast float* %164 to <8 x float>*
  %interleaved.vec327 = shufflevector <4 x float> %159, <4 x float> %162, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec327, <8 x float>* %165, align 4, !alias.scope !19, !noalias !21
  %index.next313 = add nuw nsw i64 %index312, 4
  %166 = icmp eq i64 %index.next313, 1080
  br i1 %166, label %middle.block276, label %vector.body275, !llvm.loop !22

middle.block276:                                  ; preds = %vector.body275
  br i1 true, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %middle.block276, %.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %.preheader.us ], [ 2160, %middle.block276 ]
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new ], [ %indvars.iv.ph, %.preheader.us.new.preheader ]
  %167 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv180, i64 %indvars.iv
  %168 = load float, float* %167, align 4
  %169 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv180, i64 %indvars.iv
  %170 = load float, float* %169, align 4
  %171 = fadd float %168, %170
  %172 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv180, i64 %indvars.iv
  store float %171, float* %172, align 4
  %indvars.iv.next = or i64 %indvars.iv, 1
  %173 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv180, i64 %indvars.iv.next
  %174 = load float, float* %173, align 4
  %175 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv180, i64 %indvars.iv.next
  %176 = load float, float* %175, align 4
  %177 = fadd float %174, %176
  %178 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv180, i64 %indvars.iv.next
  store float %177, float* %178, align 4
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2160
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader.us.new, !llvm.loop !23

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block276
  %indvars.iv.next181 = add nuw nsw i64 %indvars.iv180, 1
  %exitcond246 = icmp eq i64 %indvars.iv.next181, 4096
  br i1 %exitcond246, label %._crit_edge147, label %.preheader.us

._crit_edge147:                                   ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [2160 x float]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv15 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next16, %._crit_edge.us ]
  %7 = mul nuw nsw i64 %indvars.iv15, 2160
  br label %8

; <label>:8:                                      ; preds = %15, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %15 ], [ 0, %.preheader.us ]
  %9 = add nuw nsw i64 %indvars.iv, %7
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
  %17 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv15, i64 %indvars.iv
  %18 = load float, float* %17, align 4
  %19 = fpext float %18 to double
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %19) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond20 = icmp eq i64 %indvars.iv.next, 2160
  br i1 %exitcond20, label %._crit_edge.us, label %8

._crit_edge.us:                                   ; preds = %15
  %indvars.iv.next16 = add nuw nsw i64 %indvars.iv15, 1
  %exitcond = icmp eq i64 %indvars.iv.next16, 4096
  br i1 %exitcond, label %._crit_edge13, label %.preheader.us

._crit_edge13:                                    ; preds = %._crit_edge.us
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare float @expf(float) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

; Function Attrs: nounwind readnone
declare float @llvm.exp2.f32(float) #4

; Function Attrs: nounwind
declare i64 @fwrite(i8* nocapture, i64, i64, %struct._IO_FILE* nocapture) local_unnamed_addr #5

; Function Attrs: nounwind
declare i32 @fputc(i32, %struct._IO_FILE* nocapture) local_unnamed_addr #5

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
