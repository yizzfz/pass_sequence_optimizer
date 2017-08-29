; ModuleID = 'A.ll'
source_filename = "deriche.c"
target datalayout = "e-m:e-i64:64-f80:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

%struct._IO_FILE = type { i32, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, i8*, %struct._IO_marker*, %struct._IO_FILE*, i32, i32, i64, i16, i8, [1 x i8], i8*, i64, i8*, i8*, i8*, i8*, i64, i32, [20 x i8] }
%struct._IO_marker = type { %struct._IO_marker*, %struct._IO_FILE*, i32 }

@.str = private unnamed_addr constant [1 x i8] zeroinitializer, align 1
@stderr = external local_unnamed_addr global %struct._IO_FILE*, align 8
@.str.1 = private unnamed_addr constant [23 x i8] c"==BEGIN DUMP_ARRAYS==\0A\00", align 1
@.str.2 = private unnamed_addr constant [15 x i8] c"begin dump: %s\00", align 1
@.str.3 = private unnamed_addr constant [7 x i8] c"imgOut\00", align 1
@.str.4 = private unnamed_addr constant [2 x i8] c"\0A\00", align 1
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
  tail call void (...) @polybench_timer_start() #5
  %10 = load float, float* %3, align 4
  %11 = bitcast i8* %6 to [2160 x float]*
  %12 = bitcast i8* %7 to [2160 x float]*
  tail call fastcc void @kernel_deriche(i32 4096, i32 2160, float %10, [2160 x float]* %8, [2160 x float]* %9, [2160 x float]* %11, [2160 x float]* %12)
  tail call void (...) @polybench_timer_stop() #5
  tail call void (...) @polybench_timer_print() #5
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(i32 4096, i32 2160, [2160 x float]* %9)
  br label %18

; <label>:18:                                     ; preds = %14, %17, %2
  tail call void @free(i8* %4) #5
  tail call void @free(i8* %5) #5
  tail call void @free(i8* %6) #5
  tail call void @free(i8* %7) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, float* nocapture, [2160 x float]* nocapture) unnamed_addr #2 {
.preheader.preheader.us.preheader:
  store float 2.500000e-01, float* %2, align 4
  br label %.preheader.preheader.us

.preheader.preheader.us:                          ; preds = %.preheader.preheader.us.preheader, %.preheader._crit_edge.us
  %indvars.iv811.us = phi i64 [ %indvars.iv.next9.us, %.preheader._crit_edge.us ], [ 0, %.preheader.preheader.us.preheader ]
  %4 = mul nuw nsw i64 %indvars.iv811.us, 313
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %4, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %.preheader.preheader.us
  %index = phi i64 [ 0, %.preheader.preheader.us ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %.preheader.preheader.us ], [ %vec.ind.next, %vector.body ]
  %5 = mul nuw nsw <4 x i64> %vec.ind, <i64 991, i64 991, i64 991, i64 991>
  %6 = add nuw nsw <4 x i64> %5, %broadcast.splat
  %7 = trunc <4 x i64> %6 to <4 x i32>
  %8 = srem <4 x i32> %7, <i32 65536, i32 65536, i32 65536, i32 65536>
  %9 = sitofp <4 x i32> %8 to <4 x float>
  %10 = fdiv <4 x float> %9, <float 6.553500e+04, float 6.553500e+04, float 6.553500e+04, float 6.553500e+04>
  %11 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv811.us, i64 %index
  %12 = bitcast float* %11 to <4 x float>*
  store <4 x float> %10, <4 x float>* %12, align 4
  %index.next = add i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %13 = icmp eq i64 %index.next, 2160
  br i1 %13, label %.preheader._crit_edge.us, label %vector.body, !llvm.loop !1

.preheader._crit_edge.us:                         ; preds = %vector.body
  %indvars.iv.next9.us = add nuw nsw i64 %indvars.iv811.us, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next9.us, 4096
  br i1 %exitcond14, label %._crit_edge, label %.preheader.preheader.us

._crit_edge:                                      ; preds = %.preheader._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_deriche(i32, i32, float, [2160 x float]* nocapture readonly, [2160 x float]* nocapture, [2160 x float]* nocapture, [2160 x float]* nocapture) unnamed_addr #0 {
.preheader169.us.preheader:
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
  br label %.preheader169.us

.preheader169.us:                                 ; preds = %.preheader169.us.preheader, %._crit_edge200.us
  %indvars.iv161201.us = phi i64 [ %indvars.iv.next162.us, %._crit_edge200.us ], [ 0, %.preheader169.us.preheader ]
  br label %.preheader169.us.new

.preheader169.us.new:                             ; preds = %.preheader169.us, %.preheader169.us.new
  %29 = phi float [ %53, %.preheader169.us.new ], [ 0.000000e+00, %.preheader169.us ]
  %30 = phi float [ %51, %.preheader169.us.new ], [ 0.000000e+00, %.preheader169.us ]
  %31 = phi float [ %40, %.preheader169.us.new ], [ 0.000000e+00, %.preheader169.us ]
  %indvars.iv159198.us = phi i64 [ %indvars.iv.next160.us.1, %.preheader169.us.new ], [ 0, %.preheader169.us ]
  %32 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv161201.us, i64 %indvars.iv159198.us
  %33 = load float, float* %32, align 4
  %34 = fmul float %19, %33
  %35 = fmul float %23, %29
  %36 = fadd float %35, %34
  %37 = fmul float %exp2, %30
  %38 = fadd float %37, %36
  %39 = fmul float %31, %28
  %40 = fadd float %39, %38
  %41 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv161201.us, i64 %indvars.iv159198.us
  store float %40, float* %41, align 4
  %42 = load float, float* %32, align 4
  %indvars.iv.next160.us = or i64 %indvars.iv159198.us, 1
  %43 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv161201.us, i64 %indvars.iv.next160.us
  %44 = load float, float* %43, align 4
  %45 = fmul float %19, %44
  %46 = fmul float %23, %42
  %47 = fadd float %46, %45
  %48 = fmul float %exp2, %40
  %49 = fadd float %48, %47
  %50 = fmul float %30, %28
  %51 = fadd float %50, %49
  %52 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv161201.us, i64 %indvars.iv.next160.us
  store float %51, float* %52, align 4
  %53 = load float, float* %43, align 4
  %indvars.iv.next160.us.1 = add nsw i64 %indvars.iv159198.us, 2
  %exitcond226.1 = icmp eq i64 %indvars.iv.next160.us.1, 2160
  br i1 %exitcond226.1, label %._crit_edge200.us, label %.preheader169.us.new

._crit_edge200.us:                                ; preds = %.preheader169.us.new
  %indvars.iv.next162.us = add nuw nsw i64 %indvars.iv161201.us, 1
  %exitcond234 = icmp eq i64 %indvars.iv.next162.us, 4096
  br i1 %exitcond234, label %.preheader140, label %.preheader169.us

.preheader140:                                    ; preds = %._crit_edge200.us
  %54 = fadd float %2, 1.000000e+00
  %55 = fmul float %19, %26
  %56 = fmul float %24, %19
  %57 = fmul float %54, %56
  %58 = fsub float -0.000000e+00, %55
  br label %.preheader168.us

.preheader168.us:                                 ; preds = %.preheader140, %._crit_edge195.us
  %indvars.iv157196.us = phi i64 [ %indvars.iv.next158.us, %._crit_edge195.us ], [ 0, %.preheader140 ]
  br label %59

; <label>:59:                                     ; preds = %.preheader168.us, %59
  %indvars.iv.next156193.us.in = phi i64 [ 2160, %.preheader168.us ], [ %indvars.iv.next156193.us, %59 ]
  %.sroa.038.0192.us = phi i32 [ 0, %.preheader168.us ], [ %74, %59 ]
  %60 = phi float [ 0.000000e+00, %.preheader168.us ], [ %75, %59 ]
  %.sroa.037.0191.us = phi i32 [ 0, %.preheader168.us ], [ %.sroa.038.0192.us, %59 ]
  %61 = phi float [ 0.000000e+00, %.preheader168.us ], [ %70, %59 ]
  %62 = phi float [ 0.000000e+00, %.preheader168.us ], [ %61, %59 ]
  %indvars.iv.next156193.us = add nsw i64 %indvars.iv.next156193.us.in, -1
  %63 = fmul float %57, %60
  %64 = bitcast i32 %.sroa.037.0191.us to float
  %65 = fmul float %64, %58
  %66 = fadd float %63, %65
  %67 = fmul float %exp2, %61
  %68 = fadd float %67, %66
  %69 = fmul float %62, %28
  %70 = fadd float %69, %68
  %71 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv157196.us, i64 %indvars.iv.next156193.us
  store float %70, float* %71, align 4
  %72 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv157196.us, i64 %indvars.iv.next156193.us
  %73 = bitcast float* %72 to i32*
  %74 = load i32, i32* %73, align 4
  %75 = bitcast i32 %74 to float
  %76 = icmp sgt i64 %indvars.iv.next156193.us.in, 1
  br i1 %76, label %59, label %._crit_edge195.us

._crit_edge195.us:                                ; preds = %59
  %indvars.iv.next158.us = add nuw nsw i64 %indvars.iv157196.us, 1
  %exitcond224 = icmp eq i64 %indvars.iv.next158.us, 4096
  br i1 %exitcond224, label %.preheader138.preheader.us.preheader, label %.preheader168.us

.preheader138.preheader.us.preheader:             ; preds = %._crit_edge195.us
  br label %.preheader138.preheader.us

.preheader138.preheader.us:                       ; preds = %.preheader138.preheader.us.preheader, %.preheader138._crit_edge.us
  %indvars.iv153188.us = phi i64 [ %indvars.iv.next154.us, %.preheader138._crit_edge.us ], [ 0, %.preheader138.preheader.us.preheader ]
  %scevgep239 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv153188.us, i64 0
  %scevgep242 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv153188.us, i64 2160
  %scevgep245 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv153188.us, i64 0
  %scevgep248 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv153188.us, i64 2160
  %scevgep251 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv153188.us, i64 0
  %scevgep254 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv153188.us, i64 2160
  %bound0 = icmp ult float* %scevgep239, %scevgep248
  %bound1 = icmp ult float* %scevgep245, %scevgep242
  %found.conflict = and i1 %bound0, %bound1
  %bound0256 = icmp ult float* %scevgep239, %scevgep254
  %bound1257 = icmp ult float* %scevgep251, %scevgep242
  %found.conflict258 = and i1 %bound0256, %bound1257
  %conflict.rdx = or i1 %found.conflict, %found.conflict258
  br i1 %conflict.rdx, label %.preheader138.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader138.preheader.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %77 = shl i64 %index, 1
  %78 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv153188.us, i64 %77
  %79 = bitcast float* %78 to <8 x float>*
  %wide.vec = load <8 x float>, <8 x float>* %79, align 4, !alias.scope !4
  %80 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv153188.us, i64 %77
  %81 = bitcast float* %80 to <8 x float>*
  %wide.vec260 = load <8 x float>, <8 x float>* %81, align 4, !alias.scope !7
  %82 = fadd <8 x float> %wide.vec, %wide.vec260
  %83 = shufflevector <8 x float> %82, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %84 = or i64 %77, 1
  %85 = fadd <8 x float> %wide.vec, %wide.vec260
  %86 = shufflevector <8 x float> %85, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %87 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv153188.us, i64 %84
  %88 = getelementptr float, float* %87, i64 -1
  %89 = bitcast float* %88 to <8 x float>*
  %interleaved.vec = shufflevector <4 x float> %83, <4 x float> %86, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec, <8 x float>* %89, align 4, !alias.scope !9, !noalias !11
  %index.next = add i64 %index, 4
  %90 = icmp eq i64 %index.next, 1080
  br i1 %90, label %middle.block, label %vector.body, !llvm.loop !12

middle.block:                                     ; preds = %vector.body
  br i1 true, label %.preheader138._crit_edge.us, label %.preheader138.us.preheader

.preheader138.us.preheader:                       ; preds = %middle.block, %.preheader138.preheader.us
  %indvars.iv151186.us.ph = phi i64 [ 0, %.preheader138.preheader.us ], [ 2160, %middle.block ]
  br label %.preheader138.us

.preheader138.us:                                 ; preds = %.preheader138.us.preheader, %.preheader138.us
  %indvars.iv151186.us = phi i64 [ %indvars.iv.next152.us.1, %.preheader138.us ], [ %indvars.iv151186.us.ph, %.preheader138.us.preheader ]
  %91 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv153188.us, i64 %indvars.iv151186.us
  %92 = load float, float* %91, align 4
  %93 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv153188.us, i64 %indvars.iv151186.us
  %94 = load float, float* %93, align 4
  %95 = fadd float %92, %94
  %96 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv153188.us, i64 %indvars.iv151186.us
  store float %95, float* %96, align 4
  %indvars.iv.next152.us = or i64 %indvars.iv151186.us, 1
  %97 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv153188.us, i64 %indvars.iv.next152.us
  %98 = load float, float* %97, align 4
  %99 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv153188.us, i64 %indvars.iv.next152.us
  %100 = load float, float* %99, align 4
  %101 = fadd float %98, %100
  %102 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv153188.us, i64 %indvars.iv.next152.us
  store float %101, float* %102, align 4
  %indvars.iv.next152.us.1 = add nsw i64 %indvars.iv151186.us, 2
  %exitcond219.1 = icmp eq i64 %indvars.iv.next152.us.1, 2160
  br i1 %exitcond219.1, label %.preheader138._crit_edge.us.loopexit, label %.preheader138.us, !llvm.loop !13

.preheader138._crit_edge.us.loopexit:             ; preds = %.preheader138.us
  br label %.preheader138._crit_edge.us

.preheader138._crit_edge.us:                      ; preds = %.preheader138._crit_edge.us.loopexit, %middle.block
  %indvars.iv.next154.us = add nuw nsw i64 %indvars.iv153188.us, 1
  %exitcond222 = icmp eq i64 %indvars.iv.next154.us, 4096
  br i1 %exitcond222, label %.preheader167.us.preheader, label %.preheader138.preheader.us

.preheader167.us.preheader:                       ; preds = %.preheader138._crit_edge.us
  br label %.preheader167.us

.preheader167.us:                                 ; preds = %.preheader167.us.preheader, %._crit_edge183.us
  %indvars.iv149184.us = phi i64 [ %indvars.iv.next150.us, %._crit_edge183.us ], [ 0, %.preheader167.us.preheader ]
  br label %.preheader167.us.new

.preheader167.us.new:                             ; preds = %.preheader167.us, %.preheader167.us.new
  %103 = phi float [ %127, %.preheader167.us.new ], [ 0.000000e+00, %.preheader167.us ]
  %104 = phi float [ %125, %.preheader167.us.new ], [ 0.000000e+00, %.preheader167.us ]
  %105 = phi float [ %114, %.preheader167.us.new ], [ 0.000000e+00, %.preheader167.us ]
  %indvars.iv147181.us = phi i64 [ %indvars.iv.next148.us.1, %.preheader167.us.new ], [ 0, %.preheader167.us ]
  %106 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv147181.us, i64 %indvars.iv149184.us
  %107 = load float, float* %106, align 4
  %108 = fmul float %19, %107
  %109 = fmul float %23, %103
  %110 = fadd float %109, %108
  %111 = fmul float %exp2, %104
  %112 = fadd float %111, %110
  %113 = fmul float %105, %28
  %114 = fadd float %113, %112
  %115 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv147181.us, i64 %indvars.iv149184.us
  store float %114, float* %115, align 4
  %116 = load float, float* %106, align 4
  %indvars.iv.next148.us = or i64 %indvars.iv147181.us, 1
  %117 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next148.us, i64 %indvars.iv149184.us
  %118 = load float, float* %117, align 4
  %119 = fmul float %19, %118
  %120 = fmul float %23, %116
  %121 = fadd float %120, %119
  %122 = fmul float %exp2, %114
  %123 = fadd float %122, %121
  %124 = fmul float %104, %28
  %125 = fadd float %124, %123
  %126 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv.next148.us, i64 %indvars.iv149184.us
  store float %125, float* %126, align 4
  %127 = load float, float* %117, align 4
  %indvars.iv.next148.us.1 = add nsw i64 %indvars.iv147181.us, 2
  %exitcond212.1 = icmp eq i64 %indvars.iv.next148.us.1, 4096
  br i1 %exitcond212.1, label %._crit_edge183.us, label %.preheader167.us.new

._crit_edge183.us:                                ; preds = %.preheader167.us.new
  %indvars.iv.next150.us = add nuw nsw i64 %indvars.iv149184.us, 1
  %exitcond217 = icmp eq i64 %indvars.iv.next150.us, 2160
  br i1 %exitcond217, label %.preheader166.us.preheader, label %.preheader167.us

.preheader166.us.preheader:                       ; preds = %._crit_edge183.us
  br label %.preheader166.us

.preheader166.us:                                 ; preds = %.preheader166.us.preheader, %._crit_edge178.us
  %indvars.iv145179.us = phi i64 [ %indvars.iv.next146.us, %._crit_edge178.us ], [ 0, %.preheader166.us.preheader ]
  br label %128

; <label>:128:                                    ; preds = %.preheader166.us, %128
  %indvars.iv.next144176.us.in = phi i64 [ 4096, %.preheader166.us ], [ %indvars.iv.next144176.us, %128 ]
  %.sroa.036.0175.us = phi i32 [ 0, %.preheader166.us ], [ %143, %128 ]
  %129 = phi float [ 0.000000e+00, %.preheader166.us ], [ %144, %128 ]
  %.sroa.035.0174.us = phi i32 [ 0, %.preheader166.us ], [ %.sroa.036.0175.us, %128 ]
  %130 = phi float [ 0.000000e+00, %.preheader166.us ], [ %139, %128 ]
  %131 = phi float [ 0.000000e+00, %.preheader166.us ], [ %130, %128 ]
  %indvars.iv.next144176.us = add nsw i64 %indvars.iv.next144176.us.in, -1
  %132 = fmul float %57, %129
  %133 = bitcast i32 %.sroa.035.0174.us to float
  %134 = fmul float %133, %58
  %135 = fadd float %132, %134
  %136 = fmul float %exp2, %130
  %137 = fadd float %136, %135
  %138 = fmul float %131, %28
  %139 = fadd float %138, %137
  %140 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv.next144176.us, i64 %indvars.iv145179.us
  store float %139, float* %140, align 4
  %141 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next144176.us, i64 %indvars.iv145179.us
  %142 = bitcast float* %141 to i32*
  %143 = load i32, i32* %142, align 4
  %144 = bitcast i32 %143 to float
  %145 = icmp sgt i64 %indvars.iv.next144176.us.in, 1
  br i1 %145, label %128, label %._crit_edge178.us

._crit_edge178.us:                                ; preds = %128
  %indvars.iv.next146.us = add nuw nsw i64 %indvars.iv145179.us, 1
  %exitcond210 = icmp eq i64 %indvars.iv.next146.us, 2160
  br i1 %exitcond210, label %.preheader.preheader.us.preheader, label %.preheader166.us

.preheader.preheader.us.preheader:                ; preds = %._crit_edge178.us
  br label %.preheader.preheader.us

.preheader.preheader.us:                          ; preds = %.preheader.preheader.us.preheader, %.preheader._crit_edge.us
  %indvars.iv141171.us = phi i64 [ %indvars.iv.next142.us, %.preheader._crit_edge.us ], [ 0, %.preheader.preheader.us.preheader ]
  %scevgep273 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv141171.us, i64 0
  %scevgep276 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv141171.us, i64 2160
  %scevgep279 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv141171.us, i64 0
  %scevgep282 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv141171.us, i64 2160
  %scevgep285 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv141171.us, i64 0
  %scevgep288 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv141171.us, i64 2160
  %bound0290 = icmp ult float* %scevgep273, %scevgep282
  %bound1291 = icmp ult float* %scevgep279, %scevgep276
  %found.conflict292 = and i1 %bound0290, %bound1291
  %bound0293 = icmp ult float* %scevgep273, %scevgep288
  %bound1294 = icmp ult float* %scevgep285, %scevgep276
  %found.conflict295 = and i1 %bound0293, %bound1294
  %conflict.rdx296 = or i1 %found.conflict292, %found.conflict295
  br i1 %conflict.rdx296, label %.preheader.us.preheader, label %vector.body263.preheader

vector.body263.preheader:                         ; preds = %.preheader.preheader.us
  br label %vector.body263

vector.body263:                                   ; preds = %vector.body263.preheader, %vector.body263
  %index300 = phi i64 [ %index.next301, %vector.body263 ], [ 0, %vector.body263.preheader ]
  %146 = shl i64 %index300, 1
  %147 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv141171.us, i64 %146
  %148 = bitcast float* %147 to <8 x float>*
  %wide.vec309 = load <8 x float>, <8 x float>* %148, align 4, !alias.scope !14
  %149 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv141171.us, i64 %146
  %150 = bitcast float* %149 to <8 x float>*
  %wide.vec312 = load <8 x float>, <8 x float>* %150, align 4, !alias.scope !17
  %151 = fadd <8 x float> %wide.vec309, %wide.vec312
  %152 = shufflevector <8 x float> %151, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %153 = or i64 %146, 1
  %154 = fadd <8 x float> %wide.vec309, %wide.vec312
  %155 = shufflevector <8 x float> %154, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %156 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv141171.us, i64 %153
  %157 = getelementptr float, float* %156, i64 -1
  %158 = bitcast float* %157 to <8 x float>*
  %interleaved.vec315 = shufflevector <4 x float> %152, <4 x float> %155, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec315, <8 x float>* %158, align 4, !alias.scope !19, !noalias !21
  %index.next301 = add i64 %index300, 4
  %159 = icmp eq i64 %index.next301, 1080
  br i1 %159, label %middle.block264, label %vector.body263, !llvm.loop !22

middle.block264:                                  ; preds = %vector.body263
  br i1 true, label %.preheader._crit_edge.us, label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %middle.block264, %.preheader.preheader.us
  %indvars.iv170.us.ph = phi i64 [ 0, %.preheader.preheader.us ], [ 2160, %middle.block264 ]
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %.preheader.us
  %indvars.iv170.us = phi i64 [ %indvars.iv.next.us.1, %.preheader.us ], [ %indvars.iv170.us.ph, %.preheader.us.preheader ]
  %160 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv141171.us, i64 %indvars.iv170.us
  %161 = load float, float* %160, align 4
  %162 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv141171.us, i64 %indvars.iv170.us
  %163 = load float, float* %162, align 4
  %164 = fadd float %161, %163
  %165 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv141171.us, i64 %indvars.iv170.us
  store float %164, float* %165, align 4
  %indvars.iv.next.us = or i64 %indvars.iv170.us, 1
  %166 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv141171.us, i64 %indvars.iv.next.us
  %167 = load float, float* %166, align 4
  %168 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv141171.us, i64 %indvars.iv.next.us
  %169 = load float, float* %168, align 4
  %170 = fadd float %167, %169
  %171 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv141171.us, i64 %indvars.iv.next.us
  store float %170, float* %171, align 4
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv170.us, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.us.1, 2160
  br i1 %exitcond.1, label %.preheader._crit_edge.us.loopexit, label %.preheader.us, !llvm.loop !23

.preheader._crit_edge.us.loopexit:                ; preds = %.preheader.us
  br label %.preheader._crit_edge.us

.preheader._crit_edge.us:                         ; preds = %.preheader._crit_edge.us.loopexit, %middle.block264
  %indvars.iv.next142.us = add nuw nsw i64 %indvars.iv141171.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next142.us, 4096
  br i1 %exitcond, label %._crit_edge, label %.preheader.preheader.us

._crit_edge:                                      ; preds = %.preheader._crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [2160 x float]* nocapture readonly) unnamed_addr #0 {
.preheader.preheader.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.preheader.preheader.us

.preheader.preheader.us:                          ; preds = %.preheader.preheader.us.preheader, %.preheader._crit_edge.us
  %indvars.iv912.us = phi i64 [ %indvars.iv.next10.us, %.preheader._crit_edge.us ], [ 0, %.preheader.preheader.us.preheader ]
  %7 = mul nsw i64 %indvars.iv912.us, 2160
  br label %8

; <label>:8:                                      ; preds = %.preheader.us, %.preheader.preheader.us
  %indvars.iv11.us = phi i64 [ 0, %.preheader.preheader.us ], [ %indvars.iv.next.us, %.preheader.us ]
  %9 = add nsw i64 %indvars.iv11.us, %7
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %.preheader.us

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %13, %8
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv912.us, i64 %indvars.iv11.us
  %17 = load float, float* %16, align 4
  %18 = fpext float %17 to double
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %18) #7
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv11.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, 2160
  br i1 %exitcond, label %.preheader._crit_edge.us, label %8

.preheader._crit_edge.us:                         ; preds = %.preheader.us
  %indvars.iv.next10.us = add nuw nsw i64 %indvars.iv912.us, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next10.us, 4096
  br i1 %exitcond15, label %._crit_edge, label %.preheader.preheader.us

._crit_edge:                                      ; preds = %.preheader._crit_edge.us
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #6
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
