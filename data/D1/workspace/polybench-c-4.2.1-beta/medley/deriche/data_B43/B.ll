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
.preheader.us.preheader:
  store float 2.500000e-01, float* %2, align 4
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv14.us = phi i64 [ %indvars.iv.next2.us, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %4 = mul nuw nsw i64 %indvars.iv14.us, 313
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %4, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %.preheader.us
  %index = phi i64 [ 0, %.preheader.us ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %.preheader.us ], [ %vec.ind.next, %vector.body ]
  %5 = mul nuw nsw <4 x i64> %vec.ind, <i64 991, i64 991, i64 991, i64 991>
  %6 = add nuw nsw <4 x i64> %5, %broadcast.splat
  %7 = trunc <4 x i64> %6 to <4 x i32>
  %8 = srem <4 x i32> %7, <i32 65536, i32 65536, i32 65536, i32 65536>
  %9 = sitofp <4 x i32> %8 to <4 x float>
  %10 = fdiv <4 x float> %9, <float 6.553500e+04, float 6.553500e+04, float 6.553500e+04, float 6.553500e+04>
  %11 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv14.us, i64 %index
  %12 = bitcast float* %11 to <4 x float>*
  store <4 x float> %10, <4 x float>* %12, align 4
  %index.next = add nuw nsw i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %13 = icmp eq i64 %index.next, 2160
  br i1 %13, label %._crit_edge.us, label %vector.body, !llvm.loop !1

._crit_edge.us:                                   ; preds = %vector.body
  %indvars.iv.next2.us = add nuw nsw i64 %indvars.iv14.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next2.us, 4096
  br i1 %exitcond, label %._crit_edge6, label %.preheader.us

._crit_edge6:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_deriche(i32, i32, float, [2160 x float]* nocapture readonly, [2160 x float]* nocapture, [2160 x float]* nocapture, [2160 x float]* nocapture) unnamed_addr #0 {
.preheader195.lr.ph:
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
  %29 = insertelement <2 x float> undef, float %23, i32 0
  %30 = insertelement <2 x float> %29, float %19, i32 1
  br label %.preheader195.us

.preheader195.us:                                 ; preds = %.preheader195.lr.ph, %._crit_edge242.us
  %indvars.iv189243.us = phi i64 [ %indvars.iv.next190.us, %._crit_edge242.us ], [ 0, %.preheader195.lr.ph ]
  br label %.preheader195.us.new

.preheader195.us.new:                             ; preds = %.preheader195.us, %.preheader195.us.new
  %.0155240.us = phi float [ %53, %.preheader195.us.new ], [ 0.000000e+00, %.preheader195.us ]
  %.0157239.us = phi float [ %51, %.preheader195.us.new ], [ 0.000000e+00, %.preheader195.us ]
  %.0159238.us = phi float [ %39, %.preheader195.us.new ], [ 0.000000e+00, %.preheader195.us ]
  %indvars.iv187237.us = phi i64 [ %indvars.iv.next188.us.1, %.preheader195.us.new ], [ 0, %.preheader195.us ]
  %31 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv189243.us, i64 %indvars.iv187237.us
  %32 = load float, float* %31, align 4
  %33 = fmul float %19, %32
  %34 = fmul float %23, %.0155240.us
  %35 = fadd float %34, %33
  %36 = fmul float %exp2, %.0157239.us
  %37 = fadd float %36, %35
  %38 = fmul float %.0159238.us, %28
  %39 = fadd float %38, %37
  %40 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv189243.us, i64 %indvars.iv187237.us
  store float %39, float* %40, align 4
  %41 = bitcast float* %31 to <2 x float>*
  %indvars.iv.next188.us = or i64 %indvars.iv187237.us, 1
  %42 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv189243.us, i64 %indvars.iv.next188.us
  %43 = load <2 x float>, <2 x float>* %41, align 4
  %44 = fmul <2 x float> %30, %43
  %45 = extractelement <2 x float> %44, i32 0
  %46 = extractelement <2 x float> %44, i32 1
  %47 = fadd float %45, %46
  %48 = fmul float %exp2, %39
  %49 = fadd float %48, %47
  %50 = fmul float %.0157239.us, %28
  %51 = fadd float %50, %49
  %52 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv189243.us, i64 %indvars.iv.next188.us
  store float %51, float* %52, align 4
  %53 = load float, float* %42, align 4
  %indvars.iv.next188.us.1 = add nuw nsw i64 %indvars.iv187237.us, 2
  %exitcond248.us.1 = icmp eq i64 %indvars.iv.next188.us.1, 2160
  br i1 %exitcond248.us.1, label %._crit_edge242.us, label %.preheader195.us.new

._crit_edge242.us:                                ; preds = %.preheader195.us.new
  %indvars.iv.next190.us = add nuw nsw i64 %indvars.iv189243.us, 1
  %exitcond276 = icmp eq i64 %indvars.iv.next190.us, 4096
  br i1 %exitcond276, label %._crit_edge245, label %.preheader195.us

._crit_edge245:                                   ; preds = %._crit_edge242.us
  %54 = fadd float %2, 1.000000e+00
  %55 = fmul float %19, %26
  %56 = fmul float %24, %19
  %57 = fmul float %54, %56
  %58 = fsub float -0.000000e+00, %55
  br label %.preheader194.us

.preheader194.us:                                 ; preds = %._crit_edge245, %._crit_edge233.us
  %indvars.iv185234.us = phi i64 [ %indvars.iv.next186.us, %._crit_edge233.us ], [ 0, %._crit_edge245 ]
  br label %59

; <label>:59:                                     ; preds = %59, %.preheader194.us
  %indvars.iv.next184231.us.in = phi i64 [ 2160, %.preheader194.us ], [ %indvars.iv.next184231.us.1, %59 ]
  %.0161230.us = phi float [ 0.000000e+00, %.preheader194.us ], [ %79, %59 ]
  %.0162229.us = phi float [ 0.000000e+00, %.preheader194.us ], [ %69, %59 ]
  %.0165228.us = phi float [ 0.000000e+00, %.preheader194.us ], [ %76, %59 ]
  %.0167227.us = phi float [ 0.000000e+00, %.preheader194.us ], [ %66, %59 ]
  %indvars.iv.next184231.us = add nsw i64 %indvars.iv.next184231.us.in, -1
  %60 = fmul float %57, %.0161230.us
  %61 = fmul float %.0162229.us, %58
  %62 = fadd float %61, %60
  %63 = fmul float %exp2, %.0165228.us
  %64 = fadd float %63, %62
  %65 = fmul float %.0167227.us, %28
  %66 = fadd float %65, %64
  %67 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv185234.us, i64 %indvars.iv.next184231.us
  store float %66, float* %67, align 4
  %68 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv185234.us, i64 %indvars.iv.next184231.us
  %69 = load float, float* %68, align 4
  %indvars.iv.next184231.us.1 = add nsw i64 %indvars.iv.next184231.us.in, -2
  %70 = fmul float %57, %69
  %71 = fmul float %.0161230.us, %58
  %72 = fadd float %71, %70
  %73 = fmul float %exp2, %66
  %74 = fadd float %73, %72
  %75 = fmul float %.0165228.us, %28
  %76 = fadd float %75, %74
  %77 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv185234.us, i64 %indvars.iv.next184231.us.1
  store float %76, float* %77, align 4
  %78 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv185234.us, i64 %indvars.iv.next184231.us.1
  %79 = load float, float* %78, align 4
  %80 = icmp sgt i64 %indvars.iv.next184231.us, 1
  br i1 %80, label %59, label %._crit_edge233.us

._crit_edge233.us:                                ; preds = %59
  %indvars.iv.next186.us = add nuw nsw i64 %indvars.iv185234.us, 1
  %exitcond270 = icmp eq i64 %indvars.iv.next186.us, 4096
  br i1 %exitcond270, label %.preheader193.us.preheader, label %.preheader194.us

.preheader193.us.preheader:                       ; preds = %._crit_edge233.us
  br label %.preheader193.us

.preheader193.us:                                 ; preds = %.preheader193.us.preheader, %._crit_edge222.us
  %indvars.iv181223.us = phi i64 [ %indvars.iv.next182.us, %._crit_edge222.us ], [ 0, %.preheader193.us.preheader ]
  %scevgep = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv181223.us, i64 0
  %81 = add nuw nsw i64 %indvars.iv181223.us, 1
  %scevgep285 = getelementptr [2160 x float], [2160 x float]* %4, i64 %81, i64 0
  %scevgep287 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv181223.us, i64 0
  %scevgep289 = getelementptr [2160 x float], [2160 x float]* %5, i64 %81, i64 0
  %scevgep291 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv181223.us, i64 0
  %scevgep293 = getelementptr [2160 x float], [2160 x float]* %6, i64 %81, i64 0
  %bound0 = icmp ult float* %scevgep, %scevgep289
  %bound1 = icmp ult float* %scevgep287, %scevgep285
  %found.conflict = and i1 %bound0, %bound1
  %bound0295 = icmp ult float* %scevgep, %scevgep293
  %bound1296 = icmp ult float* %scevgep291, %scevgep285
  %found.conflict297 = and i1 %bound0295, %bound1296
  %conflict.rdx = or i1 %found.conflict, %found.conflict297
  br i1 %conflict.rdx, label %.preheader193.us.new.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader193.us
  br label %vector.body

.preheader193.us.new.preheader:                   ; preds = %.preheader193.us
  br label %.preheader193.us.new

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = shl i64 %index, 1
  %82 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv181223.us, i64 %offset.idx
  %83 = bitcast float* %82 to <8 x float>*
  %wide.vec = load <8 x float>, <8 x float>* %83, align 4, !alias.scope !4
  %84 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv181223.us, i64 %offset.idx
  %85 = bitcast float* %84 to <8 x float>*
  %wide.vec299 = load <8 x float>, <8 x float>* %85, align 4, !alias.scope !7
  %86 = fadd <8 x float> %wide.vec, %wide.vec299
  %87 = shufflevector <8 x float> %86, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %88 = or i64 %offset.idx, 1
  %89 = fadd <8 x float> %wide.vec, %wide.vec299
  %90 = shufflevector <8 x float> %89, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %91 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv181223.us, i64 %88
  %92 = getelementptr float, float* %91, i64 -1
  %93 = bitcast float* %92 to <8 x float>*
  %interleaved.vec = shufflevector <4 x float> %87, <4 x float> %90, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec, <8 x float>* %93, align 4, !alias.scope !9, !noalias !11
  %index.next = add nuw nsw i64 %index, 4
  %94 = icmp eq i64 %index.next, 1080
  br i1 %94, label %._crit_edge222.us.loopexit347, label %vector.body, !llvm.loop !12

.preheader193.us.new:                             ; preds = %.preheader193.us.new.preheader, %.preheader193.us.new
  %indvars.iv179220.us = phi i64 [ %indvars.iv.next180.us.1, %.preheader193.us.new ], [ 0, %.preheader193.us.new.preheader ]
  %95 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv181223.us, i64 %indvars.iv179220.us
  %96 = load float, float* %95, align 4
  %97 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv181223.us, i64 %indvars.iv179220.us
  %98 = load float, float* %97, align 4
  %99 = fadd float %96, %98
  %100 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv181223.us, i64 %indvars.iv179220.us
  store float %99, float* %100, align 4
  %indvars.iv.next180.us = or i64 %indvars.iv179220.us, 1
  %101 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv181223.us, i64 %indvars.iv.next180.us
  %102 = load float, float* %101, align 4
  %103 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv181223.us, i64 %indvars.iv.next180.us
  %104 = load float, float* %103, align 4
  %105 = fadd float %102, %104
  %106 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv181223.us, i64 %indvars.iv.next180.us
  store float %105, float* %106, align 4
  %indvars.iv.next180.us.1 = add nuw nsw i64 %indvars.iv179220.us, 2
  %exitcond247.us.1 = icmp eq i64 %indvars.iv.next180.us.1, 2160
  br i1 %exitcond247.us.1, label %._crit_edge222.us.loopexit, label %.preheader193.us.new, !llvm.loop !13

._crit_edge222.us.loopexit:                       ; preds = %.preheader193.us.new
  br label %._crit_edge222.us

._crit_edge222.us.loopexit347:                    ; preds = %vector.body
  br label %._crit_edge222.us

._crit_edge222.us:                                ; preds = %._crit_edge222.us.loopexit347, %._crit_edge222.us.loopexit
  %indvars.iv.next182.us = add nuw nsw i64 %indvars.iv181223.us, 1
  %exitcond268 = icmp eq i64 %indvars.iv.next182.us, 4096
  br i1 %exitcond268, label %.preheader192.us.preheader, label %.preheader193.us

.preheader192.us.preheader:                       ; preds = %._crit_edge222.us
  br label %.preheader192.us

.preheader192.us:                                 ; preds = %.preheader192.us.preheader, %._crit_edge216.us
  %indvars.iv177217.us = phi i64 [ %indvars.iv.next178.us, %._crit_edge216.us ], [ 0, %.preheader192.us.preheader ]
  br label %.preheader192.us.new

.preheader192.us.new:                             ; preds = %.preheader192.us, %.preheader192.us.new
  %.0156214.us = phi float [ %128, %.preheader192.us.new ], [ 0.000000e+00, %.preheader192.us ]
  %.1158213.us = phi float [ %126, %.preheader192.us.new ], [ 0.000000e+00, %.preheader192.us ]
  %.1160212.us = phi float [ %115, %.preheader192.us.new ], [ 0.000000e+00, %.preheader192.us ]
  %indvars.iv175211.us = phi i64 [ %indvars.iv.next176.us.1, %.preheader192.us.new ], [ 0, %.preheader192.us ]
  %107 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv175211.us, i64 %indvars.iv177217.us
  %108 = load float, float* %107, align 4
  %109 = fmul float %19, %108
  %110 = fmul float %23, %.0156214.us
  %111 = fadd float %110, %109
  %112 = fmul float %exp2, %.1158213.us
  %113 = fadd float %112, %111
  %114 = fmul float %.1160212.us, %28
  %115 = fadd float %114, %113
  %116 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv175211.us, i64 %indvars.iv177217.us
  store float %115, float* %116, align 4
  %117 = load float, float* %107, align 4
  %indvars.iv.next176.us = or i64 %indvars.iv175211.us, 1
  %118 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next176.us, i64 %indvars.iv177217.us
  %119 = load float, float* %118, align 4
  %120 = fmul float %19, %119
  %121 = fmul float %23, %117
  %122 = fadd float %121, %120
  %123 = fmul float %exp2, %115
  %124 = fadd float %123, %122
  %125 = fmul float %.1158213.us, %28
  %126 = fadd float %125, %124
  %127 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv.next176.us, i64 %indvars.iv177217.us
  store float %126, float* %127, align 4
  %128 = load float, float* %118, align 4
  %indvars.iv.next176.us.1 = add nuw nsw i64 %indvars.iv175211.us, 2
  %exitcond246.us.1 = icmp eq i64 %indvars.iv.next176.us.1, 4096
  br i1 %exitcond246.us.1, label %._crit_edge216.us, label %.preheader192.us.new

._crit_edge216.us:                                ; preds = %.preheader192.us.new
  %indvars.iv.next178.us = add nuw nsw i64 %indvars.iv177217.us, 1
  %exitcond262 = icmp eq i64 %indvars.iv.next178.us, 2160
  br i1 %exitcond262, label %.preheader191.us.preheader, label %.preheader192.us

.preheader191.us.preheader:                       ; preds = %._crit_edge216.us
  br label %.preheader191.us

.preheader191.us:                                 ; preds = %.preheader191.us.preheader, %._crit_edge207.us
  %indvars.iv173208.us = phi i64 [ %indvars.iv.next174.us, %._crit_edge207.us ], [ 0, %.preheader191.us.preheader ]
  br label %129

; <label>:129:                                    ; preds = %129, %.preheader191.us
  %indvars.iv.next172205.us.in = phi i64 [ 4096, %.preheader191.us ], [ %indvars.iv.next172205.us.1, %129 ]
  %.0163204.us = phi float [ 0.000000e+00, %.preheader191.us ], [ %149, %129 ]
  %.0164203.us = phi float [ 0.000000e+00, %.preheader191.us ], [ %139, %129 ]
  %.1166202.us = phi float [ 0.000000e+00, %.preheader191.us ], [ %146, %129 ]
  %.1168201.us = phi float [ 0.000000e+00, %.preheader191.us ], [ %136, %129 ]
  %indvars.iv.next172205.us = add nsw i64 %indvars.iv.next172205.us.in, -1
  %130 = fmul float %57, %.0163204.us
  %131 = fmul float %.0164203.us, %58
  %132 = fadd float %131, %130
  %133 = fmul float %exp2, %.1166202.us
  %134 = fadd float %133, %132
  %135 = fmul float %.1168201.us, %28
  %136 = fadd float %135, %134
  %137 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv.next172205.us, i64 %indvars.iv173208.us
  store float %136, float* %137, align 4
  %138 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next172205.us, i64 %indvars.iv173208.us
  %139 = load float, float* %138, align 4
  %indvars.iv.next172205.us.1 = add nsw i64 %indvars.iv.next172205.us.in, -2
  %140 = fmul float %57, %139
  %141 = fmul float %.0163204.us, %58
  %142 = fadd float %141, %140
  %143 = fmul float %exp2, %136
  %144 = fadd float %143, %142
  %145 = fmul float %.1166202.us, %28
  %146 = fadd float %145, %144
  %147 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv.next172205.us.1, i64 %indvars.iv173208.us
  store float %146, float* %147, align 4
  %148 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next172205.us.1, i64 %indvars.iv173208.us
  %149 = load float, float* %148, align 4
  %150 = icmp sgt i64 %indvars.iv.next172205.us, 1
  br i1 %150, label %129, label %._crit_edge207.us

._crit_edge207.us:                                ; preds = %129
  %indvars.iv.next174.us = add nuw nsw i64 %indvars.iv173208.us, 1
  %exitcond256 = icmp eq i64 %indvars.iv.next174.us, 2160
  br i1 %exitcond256, label %.preheader.us.preheader, label %.preheader191.us

.preheader.us.preheader:                          ; preds = %._crit_edge207.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv169197.us = phi i64 [ %indvars.iv.next170.us, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep307 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv169197.us, i64 0
  %151 = add nuw nsw i64 %indvars.iv169197.us, 1
  %scevgep309 = getelementptr [2160 x float], [2160 x float]* %4, i64 %151, i64 0
  %scevgep311 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv169197.us, i64 0
  %scevgep313 = getelementptr [2160 x float], [2160 x float]* %5, i64 %151, i64 0
  %scevgep315 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv169197.us, i64 0
  %scevgep317 = getelementptr [2160 x float], [2160 x float]* %6, i64 %151, i64 0
  %bound0319 = icmp ult float* %scevgep307, %scevgep313
  %bound1320 = icmp ult float* %scevgep311, %scevgep309
  %found.conflict321 = and i1 %bound0319, %bound1320
  %bound0322 = icmp ult float* %scevgep307, %scevgep317
  %bound1323 = icmp ult float* %scevgep315, %scevgep309
  %found.conflict324 = and i1 %bound0322, %bound1323
  %conflict.rdx325 = or i1 %found.conflict321, %found.conflict324
  br i1 %conflict.rdx325, label %.preheader.us.new.preheader, label %vector.body302.preheader

vector.body302.preheader:                         ; preds = %.preheader.us
  br label %vector.body302

.preheader.us.new.preheader:                      ; preds = %.preheader.us
  br label %.preheader.us.new

vector.body302:                                   ; preds = %vector.body302.preheader, %vector.body302
  %index329 = phi i64 [ %index.next330, %vector.body302 ], [ 0, %vector.body302.preheader ]
  %offset.idx333 = shl i64 %index329, 1
  %152 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv169197.us, i64 %offset.idx333
  %153 = bitcast float* %152 to <8 x float>*
  %wide.vec337 = load <8 x float>, <8 x float>* %153, align 4, !alias.scope !14
  %154 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv169197.us, i64 %offset.idx333
  %155 = bitcast float* %154 to <8 x float>*
  %wide.vec340 = load <8 x float>, <8 x float>* %155, align 4, !alias.scope !17
  %156 = fadd <8 x float> %wide.vec337, %wide.vec340
  %157 = shufflevector <8 x float> %156, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %158 = or i64 %offset.idx333, 1
  %159 = fadd <8 x float> %wide.vec337, %wide.vec340
  %160 = shufflevector <8 x float> %159, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %161 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv169197.us, i64 %158
  %162 = getelementptr float, float* %161, i64 -1
  %163 = bitcast float* %162 to <8 x float>*
  %interleaved.vec343 = shufflevector <4 x float> %157, <4 x float> %160, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec343, <8 x float>* %163, align 4, !alias.scope !19, !noalias !21
  %index.next330 = add nuw nsw i64 %index329, 4
  %164 = icmp eq i64 %index.next330, 1080
  br i1 %164, label %._crit_edge.us.loopexit346, label %vector.body302, !llvm.loop !22

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv196.us = phi i64 [ %indvars.iv.next.us.1, %.preheader.us.new ], [ 0, %.preheader.us.new.preheader ]
  %165 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv169197.us, i64 %indvars.iv196.us
  %166 = load float, float* %165, align 4
  %167 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv169197.us, i64 %indvars.iv196.us
  %168 = load float, float* %167, align 4
  %169 = fadd float %166, %168
  %170 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv169197.us, i64 %indvars.iv196.us
  store float %169, float* %170, align 4
  %indvars.iv.next.us = or i64 %indvars.iv196.us, 1
  %171 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv169197.us, i64 %indvars.iv.next.us
  %172 = load float, float* %171, align 4
  %173 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv169197.us, i64 %indvars.iv.next.us
  %174 = load float, float* %173, align 4
  %175 = fadd float %172, %174
  %176 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv169197.us, i64 %indvars.iv.next.us
  store float %175, float* %176, align 4
  %indvars.iv.next.us.1 = add nuw nsw i64 %indvars.iv196.us, 2
  %exitcond.us.1 = icmp eq i64 %indvars.iv.next.us.1, 2160
  br i1 %exitcond.us.1, label %._crit_edge.us.loopexit, label %.preheader.us.new, !llvm.loop !23

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us.loopexit346:                       ; preds = %vector.body302
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit346, %._crit_edge.us.loopexit
  %indvars.iv.next170.us = add nuw nsw i64 %indvars.iv169197.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next170.us, 4096
  br i1 %exitcond, label %._crit_edge199, label %.preheader.us

._crit_edge199:                                   ; preds = %._crit_edge.us
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

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv1215.us = phi i64 [ %indvars.iv.next13.us, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %7 = mul nuw nsw i64 %indvars.iv1215.us, 2160
  br label %8

; <label>:8:                                      ; preds = %15, %.preheader.us
  %indvars.iv14.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %15 ]
  %9 = add nuw nsw i64 %indvars.iv14.us, %7
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
  %17 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv1215.us, i64 %indvars.iv14.us
  %18 = load float, float* %17, align 4
  %19 = fpext float %18 to double
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %19) #7
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv14.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 2160
  br i1 %exitcond.us, label %._crit_edge.us, label %8

._crit_edge.us:                                   ; preds = %15
  %indvars.iv.next13.us = add nuw nsw i64 %indvars.iv1215.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next13.us, 4096
  br i1 %exitcond, label %._crit_edge17, label %.preheader.us

._crit_edge17:                                    ; preds = %._crit_edge.us
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #6
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
