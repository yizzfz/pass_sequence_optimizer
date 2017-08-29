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
  call fastcc void @init_array(i32 4096, i32 2160, float* nonnull %3, [2160 x float]* %8)
  call void (...) @polybench_timer_start() #5
  %9 = load float, float* %3, align 4
  %10 = bitcast i8* %5 to [2160 x float]*
  %11 = bitcast i8* %6 to [2160 x float]*
  %12 = bitcast i8* %7 to [2160 x float]*
  call fastcc void @kernel_deriche(i32 4096, i32 2160, float %9, [2160 x float]* %8, [2160 x float]* %10, [2160 x float]* %11, [2160 x float]* %12)
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
  store float 2.500000e-01, float* %2, align 4
  br i1 true, label %.preheader.lr.ph, label %._crit_edge4

.preheader.lr.ph:                                 ; preds = %4
  br i1 true, label %.preheader.us.preheader, label %._crit_edge4

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %5 = mul i64 %indvars.iv, 313
  br i1 false, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 false, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %5, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %6 = mul nuw nsw <4 x i64> %vec.ind, <i64 991, i64 991, i64 991, i64 991>
  %7 = add <4 x i64> %6, %broadcast.splat
  %8 = trunc <4 x i64> %7 to <4 x i32>
  %9 = srem <4 x i32> %8, <i32 65536, i32 65536, i32 65536, i32 65536>
  %10 = sitofp <4 x i32> %9 to <4 x float>
  %11 = fdiv <4 x float> %10, <float 6.553500e+04, float 6.553500e+04, float 6.553500e+04, float 6.553500e+04>
  %12 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv, i64 %index
  %13 = bitcast float* %12 to <4 x float>*
  store <4 x float> %11, <4 x float>* %13, align 4
  %index.next = add i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %14 = icmp eq i64 %index.next, 2160
  br i1 %14, label %middle.block, label %vector.body, !llvm.loop !1

middle.block:                                     ; preds = %vector.body
  br i1 true, label %._crit_edge.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %min.iters.checked, %.preheader.us
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  br i1 true, label %._crit_edge.us.loopexit, label %scalar.ph, !llvm.loop !4

._crit_edge.us.loopexit:                          ; preds = %scalar.ph
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 4096
  br i1 %exitcond, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %.preheader.lr.ph, %4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_deriche(i32, i32, float, [2160 x float]* nocapture readonly, [2160 x float]* nocapture, [2160 x float]* nocapture, [2160 x float]* nocapture) unnamed_addr #0 {
  %8 = fsub float -0.000000e+00, %2
  %9 = tail call float @expf(float %8) #5
  %10 = fsub float 1.000000e+00, %9
  %11 = tail call float @expf(float %8) #5
  %12 = fsub float 1.000000e+00, %11
  %13 = fmul float %10, %12
  %14 = fmul float %2, 2.000000e+00
  %15 = tail call float @expf(float %8) #5
  %16 = fmul float %14, %15
  %17 = fadd float %16, 1.000000e+00
  %18 = tail call float @expf(float %14) #5
  %19 = fsub float %17, %18
  %20 = fdiv float %13, %19
  %21 = tail call float @expf(float %8) #5
  %22 = fmul float %21, %20
  %23 = tail call float @expf(float %8) #5
  %24 = fmul float %23, %20
  %25 = insertelement <2 x float> undef, float %2, i32 0
  %26 = shufflevector <2 x float> %25, <2 x float> undef, <2 x i32> zeroinitializer
  %27 = fadd <2 x float> %26, <float -1.000000e+00, float 1.000000e+00>
  %28 = insertelement <2 x float> undef, float %22, i32 0
  %29 = insertelement <2 x float> %28, float %24, i32 1
  %30 = fmul <2 x float> %27, %29
  %31 = extractelement <2 x float> %30, i32 0
  %32 = extractelement <2 x float> %30, i32 1
  %33 = fmul float %2, -2.000000e+00
  %34 = tail call float @expf(float %33) #5
  %35 = fmul float %20, %34
  %36 = fsub float -0.000000e+00, %35
  %exp2 = call float @llvm.exp2.f32(float %8)
  %37 = tail call float @expf(float %33) #5
  %38 = fsub float -0.000000e+00, %37
  br i1 true, label %.preheader176.lr.ph, label %.preheader172

.preheader176.lr.ph:                              ; preds = %7
  br i1 true, label %.preheader176.us.preheader, label %._crit_edge179

.preheader176.us.preheader:                       ; preds = %.preheader176.lr.ph
  %39 = insertelement <2 x float> undef, float %31, i32 0
  %40 = insertelement <2 x float> %39, float %20, i32 1
  br label %.preheader176.us

.preheader176.us:                                 ; preds = %.preheader176.us.preheader, %._crit_edge216.us
  %indvars.iv254.us = phi i64 [ %indvars.iv.next255.us, %._crit_edge216.us ], [ 0, %.preheader176.us.preheader ]
  br i1 true, label %.prol.loopexit274, label %.prol.preheader273

.prol.preheader273:                               ; preds = %.preheader176.us
  br label %.prol.loopexit274

.prol.loopexit274:                                ; preds = %.prol.preheader273, %.preheader176.us
  %indvars.iv250.us.unr.ph = phi i64 [ 1, %.prol.preheader273 ], [ 0, %.preheader176.us ]
  br i1 false, label %._crit_edge216.us, label %.preheader176.us.new.preheader

.preheader176.us.new.preheader:                   ; preds = %.prol.loopexit274
  br label %.preheader176.us.new

.preheader176.us.new:                             ; preds = %.preheader176.us.new.preheader, %.preheader176.us.new
  %indvars.iv250.us = phi i64 [ %indvars.iv.next251.us.1, %.preheader176.us.new ], [ %indvars.iv250.us.unr.ph, %.preheader176.us.new.preheader ]
  %.0155213.us = phi float [ %63, %.preheader176.us.new ], [ 0.000000e+00, %.preheader176.us.new.preheader ]
  %.0157212.us = phi float [ %61, %.preheader176.us.new ], [ 0.000000e+00, %.preheader176.us.new.preheader ]
  %.0159211.us = phi float [ %49, %.preheader176.us.new ], [ 0.000000e+00, %.preheader176.us.new.preheader ]
  %41 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv254.us, i64 %indvars.iv250.us
  %42 = load float, float* %41, align 4
  %43 = fmul float %20, %42
  %44 = fmul float %31, %.0155213.us
  %45 = fadd float %44, %43
  %46 = fmul float %exp2, %.0157212.us
  %47 = fadd float %46, %45
  %48 = fmul float %.0159211.us, %38
  %49 = fadd float %48, %47
  %50 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv254.us, i64 %indvars.iv250.us
  store float %49, float* %50, align 4
  %51 = bitcast float* %41 to <2 x float>*
  %indvars.iv.next251.us = add nuw nsw i64 %indvars.iv250.us, 1
  %52 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv254.us, i64 %indvars.iv.next251.us
  %53 = load <2 x float>, <2 x float>* %51, align 4
  %54 = fmul <2 x float> %40, %53
  %55 = extractelement <2 x float> %54, i32 0
  %56 = extractelement <2 x float> %54, i32 1
  %57 = fadd float %55, %56
  %58 = fmul float %exp2, %49
  %59 = fadd float %58, %57
  %60 = fmul float %.0157212.us, %38
  %61 = fadd float %60, %59
  %62 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv254.us, i64 %indvars.iv.next251.us
  store float %61, float* %62, align 4
  %63 = load float, float* %52, align 4
  %indvars.iv.next251.us.1 = add nuw nsw i64 %indvars.iv250.us, 2
  %exitcond253.us.1 = icmp eq i64 %indvars.iv.next251.us.1, 2160
  br i1 %exitcond253.us.1, label %._crit_edge216.us.loopexit, label %.preheader176.us.new

._crit_edge216.us.loopexit:                       ; preds = %.preheader176.us.new
  br label %._crit_edge216.us

._crit_edge216.us:                                ; preds = %._crit_edge216.us.loopexit, %.prol.loopexit274
  %indvars.iv.next255.us = add nuw nsw i64 %indvars.iv254.us, 1
  %exitcond257.us = icmp eq i64 %indvars.iv.next255.us, 4096
  br i1 %exitcond257.us, label %.preheader175, label %.preheader176.us

.preheader175:                                    ; preds = %._crit_edge216.us
  br i1 true, label %.lr.ph210, label %.preheader172

.lr.ph210:                                        ; preds = %.preheader175
  br i1 true, label %.lr.ph210.split.us.preheader, label %._crit_edge179

.lr.ph210.split.us.preheader:                     ; preds = %.lr.ph210
  br label %.lr.ph210.split.us

.lr.ph210.split.us:                               ; preds = %.lr.ph210.split.us.preheader, %._crit_edge208.us
  %indvars.iv246.us = phi i64 [ %indvars.iv.next247.us, %._crit_edge208.us ], [ 0, %.lr.ph210.split.us.preheader ]
  br label %64

; <label>:64:                                     ; preds = %64, %.lr.ph210.split.us
  %indvars.iv244.us = phi i64 [ 2159, %.lr.ph210.split.us ], [ %indvars.iv.next245.us.1, %64 ]
  %.0161204.us = phi float [ 0.000000e+00, %.lr.ph210.split.us ], [ %84, %64 ]
  %.0162203.us = phi float [ 0.000000e+00, %.lr.ph210.split.us ], [ %74, %64 ]
  %.0165202.us = phi float [ 0.000000e+00, %.lr.ph210.split.us ], [ %81, %64 ]
  %.0167201.us = phi float [ 0.000000e+00, %.lr.ph210.split.us ], [ %71, %64 ]
  %65 = fmul float %32, %.0161204.us
  %66 = fmul float %.0162203.us, %36
  %67 = fadd float %66, %65
  %68 = fmul float %exp2, %.0165202.us
  %69 = fadd float %68, %67
  %70 = fmul float %.0167201.us, %38
  %71 = fadd float %70, %69
  %72 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv246.us, i64 %indvars.iv244.us
  store float %71, float* %72, align 4
  %73 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv246.us, i64 %indvars.iv244.us
  %74 = load float, float* %73, align 4
  %indvars.iv.next245.us = add nsw i64 %indvars.iv244.us, -1
  %75 = fmul float %32, %74
  %76 = fmul float %.0161204.us, %36
  %77 = fadd float %76, %75
  %78 = fmul float %exp2, %71
  %79 = fadd float %78, %77
  %80 = fmul float %.0165202.us, %38
  %81 = fadd float %80, %79
  %82 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv246.us, i64 %indvars.iv.next245.us
  store float %81, float* %82, align 4
  %83 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv246.us, i64 %indvars.iv.next245.us
  %84 = load float, float* %83, align 4
  %indvars.iv.next245.us.1 = add nsw i64 %indvars.iv244.us, -2
  %85 = icmp sgt i64 %indvars.iv244.us, 1
  br i1 %85, label %64, label %._crit_edge208.us

._crit_edge208.us:                                ; preds = %64
  %indvars.iv.next247.us = add nuw nsw i64 %indvars.iv246.us, 1
  %exitcond249.us = icmp eq i64 %indvars.iv.next247.us, 4096
  br i1 %exitcond249.us, label %.preheader174, label %.lr.ph210.split.us

.preheader174:                                    ; preds = %._crit_edge208.us
  br i1 true, label %.preheader173.lr.ph, label %.preheader172

.preheader173.lr.ph:                              ; preds = %.preheader174
  br i1 true, label %.preheader173.us.preheader, label %._crit_edge179

.preheader173.us.preheader:                       ; preds = %.preheader173.lr.ph
  br label %.preheader173.us

.preheader173.us:                                 ; preds = %.preheader173.us.preheader, %._crit_edge199.us
  %indvars.iv240.us = phi i64 [ %indvars.iv.next241.us, %._crit_edge199.us ], [ 0, %.preheader173.us.preheader ]
  %scevgep288 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 2
  %scevgep294 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv240.us, i64 2
  %scevgep300 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv240.us, i64 2
  br i1 true, label %.prol.loopexit270, label %.prol.preheader269

.prol.preheader269:                               ; preds = %.preheader173.us
  br label %.prol.loopexit270

.prol.loopexit270:                                ; preds = %.prol.preheader269, %.preheader173.us
  %indvars.iv236.us.unr.ph = phi i64 [ 1, %.prol.preheader269 ], [ 0, %.preheader173.us ]
  br i1 false, label %._crit_edge199.us, label %.preheader173.us.new.preheader

.preheader173.us.new.preheader:                   ; preds = %.prol.loopexit270
  %86 = sub nsw i64 2158, %indvars.iv236.us.unr.ph
  %87 = lshr i64 %86, 1
  %88 = add nuw nsw i64 %87, 1
  br i1 false, label %.preheader173.us.new.preheader364, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader173.us.new.preheader
  %n.mod.vf = and i64 %88, 3
  %n.vec = sub nsw i64 %88, %n.mod.vf
  br i1 false, label %.preheader173.us.new.preheader364, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep286 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 %indvars.iv236.us.unr.ph
  %89 = sub nsw i64 2158, %indvars.iv236.us.unr.ph
  %90 = and i64 %89, 2158
  %91 = or i64 %indvars.iv236.us.unr.ph, %90
  %scevgep289 = getelementptr float, float* %scevgep288, i64 %91
  %scevgep292 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv240.us, i64 %indvars.iv236.us.unr.ph
  %scevgep295 = getelementptr float, float* %scevgep294, i64 %91
  %scevgep298 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv240.us, i64 %indvars.iv236.us.unr.ph
  %scevgep301 = getelementptr float, float* %scevgep300, i64 %91
  %bound0 = icmp ult float* %scevgep286, %scevgep295
  %bound1 = icmp ult float* %scevgep292, %scevgep289
  %found.conflict = and i1 %bound0, %bound1
  %bound0303 = icmp ult float* %scevgep286, %scevgep301
  %bound1304 = icmp ult float* %scevgep298, %scevgep289
  %found.conflict305 = and i1 %bound0303, %bound1304
  %conflict.rdx = or i1 %found.conflict, %found.conflict305
  %92 = or i64 %indvars.iv236.us.unr.ph, 2
  %93 = shl nuw nsw i64 %87, 1
  %94 = add nuw nsw i64 %92, %93
  %95 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub nsw i64 %94, %95
  br i1 %conflict.rdx, label %.preheader173.us.new.preheader364, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %96 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv236.us.unr.ph, %96
  %97 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv240.us, i64 %offset.idx
  %98 = bitcast float* %97 to <8 x float>*
  %wide.vec = load <8 x float>, <8 x float>* %98, align 4, !alias.scope !6
  %99 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv240.us, i64 %offset.idx
  %100 = bitcast float* %99 to <8 x float>*
  %wide.vec307 = load <8 x float>, <8 x float>* %100, align 4, !alias.scope !9
  %101 = fadd <8 x float> %wide.vec, %wide.vec307
  %102 = shufflevector <8 x float> %101, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %103 = add nuw nsw i64 %offset.idx, 1
  %104 = fadd <8 x float> %wide.vec, %wide.vec307
  %105 = shufflevector <8 x float> %104, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %106 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 %103
  %107 = getelementptr float, float* %106, i64 -1
  %108 = bitcast float* %107 to <8 x float>*
  %interleaved.vec = shufflevector <4 x float> %102, <4 x float> %105, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec, <8 x float>* %108, align 4, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %109 = icmp eq i64 %index.next, %n.vec
  br i1 %109, label %middle.block, label %vector.body, !llvm.loop !14

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge199.us, label %.preheader173.us.new.preheader364

.preheader173.us.new.preheader364:                ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader173.us.new.preheader
  %indvars.iv236.us.ph = phi i64 [ %indvars.iv236.us.unr.ph, %vector.memcheck ], [ %indvars.iv236.us.unr.ph, %min.iters.checked ], [ %indvars.iv236.us.unr.ph, %.preheader173.us.new.preheader ], [ %ind.end, %middle.block ]
  br label %.preheader173.us.new

.preheader173.us.new:                             ; preds = %.preheader173.us.new.preheader364, %.preheader173.us.new
  %indvars.iv236.us = phi i64 [ %indvars.iv.next237.us.1, %.preheader173.us.new ], [ %indvars.iv236.us.ph, %.preheader173.us.new.preheader364 ]
  %110 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv240.us, i64 %indvars.iv236.us
  %111 = load float, float* %110, align 4
  %112 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv240.us, i64 %indvars.iv236.us
  %113 = load float, float* %112, align 4
  %114 = fadd float %111, %113
  %115 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 %indvars.iv236.us
  store float %114, float* %115, align 4
  %indvars.iv.next237.us = add nuw nsw i64 %indvars.iv236.us, 1
  %116 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv240.us, i64 %indvars.iv.next237.us
  %117 = load float, float* %116, align 4
  %118 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv240.us, i64 %indvars.iv.next237.us
  %119 = load float, float* %118, align 4
  %120 = fadd float %117, %119
  %121 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 %indvars.iv.next237.us
  store float %120, float* %121, align 4
  %indvars.iv.next237.us.1 = add nsw i64 %indvars.iv236.us, 2
  %exitcond239.us.1 = icmp eq i64 %indvars.iv.next237.us.1, 2160
  br i1 %exitcond239.us.1, label %._crit_edge199.us.loopexit, label %.preheader173.us.new, !llvm.loop !15

._crit_edge199.us.loopexit:                       ; preds = %.preheader173.us.new
  br label %._crit_edge199.us

._crit_edge199.us:                                ; preds = %._crit_edge199.us.loopexit, %middle.block, %.prol.loopexit270
  %indvars.iv.next241.us = add nuw nsw i64 %indvars.iv240.us, 1
  %exitcond243.us = icmp eq i64 %indvars.iv.next241.us, 4096
  br i1 %exitcond243.us, label %.preheader172.loopexit, label %.preheader173.us

.preheader172.loopexit:                           ; preds = %._crit_edge199.us
  br label %.preheader172

.preheader172:                                    ; preds = %.preheader172.loopexit, %.preheader175, %7, %.preheader174
  br i1 true, label %.preheader171.lr.ph, label %.preheader169

.preheader171.lr.ph:                              ; preds = %.preheader172
  br i1 true, label %.preheader171.us.preheader, label %._crit_edge179

.preheader171.us.preheader:                       ; preds = %.preheader171.lr.ph
  br label %.preheader171.us

.preheader171.us:                                 ; preds = %.preheader171.us.preheader, %._crit_edge195.us
  %indvars.iv232.us = phi i64 [ %indvars.iv.next233.us, %._crit_edge195.us ], [ 0, %.preheader171.us.preheader ]
  br i1 true, label %.prol.loopexit266, label %.prol.preheader265

.prol.preheader265:                               ; preds = %.preheader171.us
  br label %.prol.loopexit266

.prol.loopexit266:                                ; preds = %.prol.preheader265, %.preheader171.us
  %indvars.iv228.us.unr.ph = phi i64 [ 1, %.prol.preheader265 ], [ 0, %.preheader171.us ]
  br i1 false, label %._crit_edge195.us, label %.preheader171.us.new.preheader

.preheader171.us.new.preheader:                   ; preds = %.prol.loopexit266
  br label %.preheader171.us.new

.preheader171.us.new:                             ; preds = %.preheader171.us.new.preheader, %.preheader171.us.new
  %indvars.iv228.us = phi i64 [ %indvars.iv.next229.us.1, %.preheader171.us.new ], [ %indvars.iv228.us.unr.ph, %.preheader171.us.new.preheader ]
  %.0156192.us = phi float [ %143, %.preheader171.us.new ], [ 0.000000e+00, %.preheader171.us.new.preheader ]
  %.1158191.us = phi float [ %141, %.preheader171.us.new ], [ 0.000000e+00, %.preheader171.us.new.preheader ]
  %.1160190.us = phi float [ %130, %.preheader171.us.new ], [ 0.000000e+00, %.preheader171.us.new.preheader ]
  %122 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv228.us, i64 %indvars.iv232.us
  %123 = load float, float* %122, align 4
  %124 = fmul float %20, %123
  %125 = fmul float %31, %.0156192.us
  %126 = fadd float %125, %124
  %127 = fmul float %exp2, %.1158191.us
  %128 = fadd float %127, %126
  %129 = fmul float %.1160190.us, %38
  %130 = fadd float %129, %128
  %131 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv228.us, i64 %indvars.iv232.us
  store float %130, float* %131, align 4
  %132 = load float, float* %122, align 4
  %indvars.iv.next229.us = add nuw nsw i64 %indvars.iv228.us, 1
  %133 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next229.us, i64 %indvars.iv232.us
  %134 = load float, float* %133, align 4
  %135 = fmul float %20, %134
  %136 = fmul float %31, %132
  %137 = fadd float %136, %135
  %138 = fmul float %exp2, %130
  %139 = fadd float %138, %137
  %140 = fmul float %.1158191.us, %38
  %141 = fadd float %140, %139
  %142 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv.next229.us, i64 %indvars.iv232.us
  store float %141, float* %142, align 4
  %143 = load float, float* %133, align 4
  %indvars.iv.next229.us.1 = add nuw nsw i64 %indvars.iv228.us, 2
  %exitcond231.us.1 = icmp eq i64 %indvars.iv.next229.us.1, 4096
  br i1 %exitcond231.us.1, label %._crit_edge195.us.loopexit, label %.preheader171.us.new

._crit_edge195.us.loopexit:                       ; preds = %.preheader171.us.new
  br label %._crit_edge195.us

._crit_edge195.us:                                ; preds = %._crit_edge195.us.loopexit, %.prol.loopexit266
  %indvars.iv.next233.us = add nuw nsw i64 %indvars.iv232.us, 1
  %exitcond235.us = icmp eq i64 %indvars.iv.next233.us, 2160
  br i1 %exitcond235.us, label %.preheader170, label %.preheader171.us

.preheader170:                                    ; preds = %._crit_edge195.us
  br i1 true, label %.lr.ph189, label %.preheader169

.lr.ph189:                                        ; preds = %.preheader170
  br i1 true, label %.lr.ph189.split.us.preheader, label %.preheader169

.lr.ph189.split.us.preheader:                     ; preds = %.lr.ph189
  br label %.lr.ph189.split.us

.lr.ph189.split.us:                               ; preds = %.lr.ph189.split.us.preheader, %._crit_edge187.us
  %indvars.iv224.us = phi i64 [ %indvars.iv.next225.us, %._crit_edge187.us ], [ 0, %.lr.ph189.split.us.preheader ]
  br label %144

; <label>:144:                                    ; preds = %144, %.lr.ph189.split.us
  %indvars.iv222.us = phi i64 [ 4095, %.lr.ph189.split.us ], [ %indvars.iv.next223.us.1, %144 ]
  %.0163183.us = phi float [ 0.000000e+00, %.lr.ph189.split.us ], [ %164, %144 ]
  %.0164182.us = phi float [ 0.000000e+00, %.lr.ph189.split.us ], [ %154, %144 ]
  %.1166181.us = phi float [ 0.000000e+00, %.lr.ph189.split.us ], [ %161, %144 ]
  %.1168180.us = phi float [ 0.000000e+00, %.lr.ph189.split.us ], [ %151, %144 ]
  %145 = fmul float %32, %.0163183.us
  %146 = fmul float %.0164182.us, %36
  %147 = fadd float %146, %145
  %148 = fmul float %exp2, %.1166181.us
  %149 = fadd float %148, %147
  %150 = fmul float %.1168180.us, %38
  %151 = fadd float %150, %149
  %152 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv222.us, i64 %indvars.iv224.us
  store float %151, float* %152, align 4
  %153 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv222.us, i64 %indvars.iv224.us
  %154 = load float, float* %153, align 4
  %indvars.iv.next223.us = add nsw i64 %indvars.iv222.us, -1
  %155 = fmul float %32, %154
  %156 = fmul float %.0163183.us, %36
  %157 = fadd float %156, %155
  %158 = fmul float %exp2, %151
  %159 = fadd float %158, %157
  %160 = fmul float %.1166181.us, %38
  %161 = fadd float %160, %159
  %162 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv.next223.us, i64 %indvars.iv224.us
  store float %161, float* %162, align 4
  %163 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next223.us, i64 %indvars.iv224.us
  %164 = load float, float* %163, align 4
  %indvars.iv.next223.us.1 = add nsw i64 %indvars.iv222.us, -2
  %165 = icmp sgt i64 %indvars.iv222.us, 1
  br i1 %165, label %144, label %._crit_edge187.us

._crit_edge187.us:                                ; preds = %144
  %indvars.iv.next225.us = add nuw nsw i64 %indvars.iv224.us, 1
  %exitcond227.us = icmp eq i64 %indvars.iv.next225.us, 2160
  br i1 %exitcond227.us, label %.preheader169.loopexit, label %.lr.ph189.split.us

.preheader169.loopexit:                           ; preds = %._crit_edge187.us
  br label %.preheader169

.preheader169:                                    ; preds = %.preheader169.loopexit, %.lr.ph189, %.preheader172, %.preheader170
  %166 = phi i1 [ false, %.preheader172 ], [ false, %.preheader170 ], [ true, %.lr.ph189 ], [ true, %.preheader169.loopexit ]
  br i1 true, label %.preheader.lr.ph, label %._crit_edge179

.preheader.lr.ph:                                 ; preds = %.preheader169
  br i1 %166, label %.preheader.us.preheader, label %._crit_edge179

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv218.us = phi i64 [ %indvars.iv.next219.us, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep322 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 2
  %scevgep328 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv218.us, i64 2
  %scevgep334 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv218.us, i64 2
  br i1 true, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us
  %indvars.iv.us.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us ]
  br i1 false, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  %167 = sub nsw i64 2158, %indvars.iv.us.unr.ph
  %168 = lshr i64 %167, 1
  %169 = add nuw nsw i64 %168, 1
  br i1 false, label %.preheader.us.new.preheader363, label %min.iters.checked314

min.iters.checked314:                             ; preds = %.preheader.us.new.preheader
  %n.mod.vf315 = and i64 %169, 3
  %n.vec316 = sub nsw i64 %169, %n.mod.vf315
  br i1 false, label %.preheader.us.new.preheader363, label %vector.memcheck345

vector.memcheck345:                               ; preds = %min.iters.checked314
  %scevgep320 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 %indvars.iv.us.unr.ph
  %170 = sub nsw i64 2158, %indvars.iv.us.unr.ph
  %171 = and i64 %170, 2158
  %172 = or i64 %indvars.iv.us.unr.ph, %171
  %scevgep323 = getelementptr float, float* %scevgep322, i64 %172
  %scevgep326 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv218.us, i64 %indvars.iv.us.unr.ph
  %scevgep329 = getelementptr float, float* %scevgep328, i64 %172
  %scevgep332 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv218.us, i64 %indvars.iv.us.unr.ph
  %scevgep335 = getelementptr float, float* %scevgep334, i64 %172
  %bound0337 = icmp ult float* %scevgep320, %scevgep329
  %bound1338 = icmp ult float* %scevgep326, %scevgep323
  %found.conflict339 = and i1 %bound0337, %bound1338
  %bound0340 = icmp ult float* %scevgep320, %scevgep335
  %bound1341 = icmp ult float* %scevgep332, %scevgep323
  %found.conflict342 = and i1 %bound0340, %bound1341
  %conflict.rdx343 = or i1 %found.conflict339, %found.conflict342
  %173 = or i64 %indvars.iv.us.unr.ph, 2
  %174 = shl nuw nsw i64 %168, 1
  %175 = add nuw nsw i64 %173, %174
  %176 = shl nuw nsw i64 %n.mod.vf315, 1
  %ind.end350 = sub nsw i64 %175, %176
  br i1 %conflict.rdx343, label %.preheader.us.new.preheader363, label %vector.body310.preheader

vector.body310.preheader:                         ; preds = %vector.memcheck345
  br label %vector.body310

vector.body310:                                   ; preds = %vector.body310.preheader, %vector.body310
  %index347 = phi i64 [ %index.next348, %vector.body310 ], [ 0, %vector.body310.preheader ]
  %177 = shl i64 %index347, 1
  %offset.idx352 = or i64 %indvars.iv.us.unr.ph, %177
  %178 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv218.us, i64 %offset.idx352
  %179 = bitcast float* %178 to <8 x float>*
  %wide.vec356 = load <8 x float>, <8 x float>* %179, align 4, !alias.scope !16
  %180 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv218.us, i64 %offset.idx352
  %181 = bitcast float* %180 to <8 x float>*
  %wide.vec359 = load <8 x float>, <8 x float>* %181, align 4, !alias.scope !19
  %182 = fadd <8 x float> %wide.vec356, %wide.vec359
  %183 = shufflevector <8 x float> %182, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %184 = add nuw nsw i64 %offset.idx352, 1
  %185 = fadd <8 x float> %wide.vec356, %wide.vec359
  %186 = shufflevector <8 x float> %185, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %187 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 %184
  %188 = getelementptr float, float* %187, i64 -1
  %189 = bitcast float* %188 to <8 x float>*
  %interleaved.vec362 = shufflevector <4 x float> %183, <4 x float> %186, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec362, <8 x float>* %189, align 4, !alias.scope !21, !noalias !23
  %index.next348 = add i64 %index347, 4
  %190 = icmp eq i64 %index.next348, %n.vec316
  br i1 %190, label %middle.block311, label %vector.body310, !llvm.loop !24

middle.block311:                                  ; preds = %vector.body310
  %cmp.n351 = icmp eq i64 %n.mod.vf315, 0
  br i1 %cmp.n351, label %._crit_edge.us, label %.preheader.us.new.preheader363

.preheader.us.new.preheader363:                   ; preds = %middle.block311, %vector.memcheck345, %min.iters.checked314, %.preheader.us.new.preheader
  %indvars.iv.us.ph = phi i64 [ %indvars.iv.us.unr.ph, %vector.memcheck345 ], [ %indvars.iv.us.unr.ph, %min.iters.checked314 ], [ %indvars.iv.us.unr.ph, %.preheader.us.new.preheader ], [ %ind.end350, %middle.block311 ]
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader363, %.preheader.us.new
  %indvars.iv.us = phi i64 [ %indvars.iv.next.us.1, %.preheader.us.new ], [ %indvars.iv.us.ph, %.preheader.us.new.preheader363 ]
  %191 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv218.us, i64 %indvars.iv.us
  %192 = load float, float* %191, align 4
  %193 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv218.us, i64 %indvars.iv.us
  %194 = load float, float* %193, align 4
  %195 = fadd float %192, %194
  %196 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 %indvars.iv.us
  store float %195, float* %196, align 4
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %197 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv218.us, i64 %indvars.iv.next.us
  %198 = load float, float* %197, align 4
  %199 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv218.us, i64 %indvars.iv.next.us
  %200 = load float, float* %199, align 4
  %201 = fadd float %198, %200
  %202 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 %indvars.iv.next.us
  store float %201, float* %202, align 4
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv.us, 2
  %exitcond.us.1 = icmp eq i64 %indvars.iv.next.us.1, 2160
  br i1 %exitcond.us.1, label %._crit_edge.us.loopexit, label %.preheader.us.new, !llvm.loop !25

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block311, %.prol.loopexit
  %indvars.iv.next219.us = add nuw nsw i64 %indvars.iv218.us, 1
  %exitcond221.us = icmp eq i64 %indvars.iv.next219.us, 4096
  br i1 %exitcond221.us, label %._crit_edge179.loopexit, label %.preheader.us

._crit_edge179.loopexit:                          ; preds = %._crit_edge.us
  br label %._crit_edge179

._crit_edge179:                                   ; preds = %._crit_edge179.loopexit, %.preheader173.lr.ph, %.preheader176.lr.ph, %.lr.ph210, %.preheader171.lr.ph, %.preheader.lr.ph, %.preheader169
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [2160 x float]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  br i1 true, label %.preheader.lr.ph, label %._crit_edge15

.preheader.lr.ph:                                 ; preds = %3
  br i1 true, label %.preheader.us.preheader, label %._crit_edge15

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %8 = mul i64 %indvars.iv, 2160
  br label %9

; <label>:9:                                      ; preds = %16, %.preheader.us
  %indvars.iv.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %16 ]
  %10 = add i64 %indvars.iv.us, %8
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %15) #6
  br label %16

; <label>:16:                                     ; preds = %14, %9
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv, i64 %indvars.iv.us
  %19 = load float, float* %18, align 4
  %20 = fpext float %19 to double
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %20) #7
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 2160
  br i1 %exitcond.us, label %._crit_edge.us, label %9

._crit_edge.us:                                   ; preds = %16
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 4096
  br i1 %exitcond, label %._crit_edge15.loopexit, label %.preheader.us

._crit_edge15.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %.preheader.lr.ph, %3
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #6
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
!4 = distinct !{!4, !5, !2, !3}
!5 = !{!"llvm.loop.unroll.runtime.disable"}
!6 = !{!7}
!7 = distinct !{!7, !8}
!8 = distinct !{!8, !"LVerDomain"}
!9 = !{!10}
!10 = distinct !{!10, !8}
!11 = !{!12}
!12 = distinct !{!12, !8}
!13 = !{!7, !10}
!14 = distinct !{!14, !2, !3}
!15 = distinct !{!15, !2, !3}
!16 = !{!17}
!17 = distinct !{!17, !18}
!18 = distinct !{!18, !"LVerDomain"}
!19 = !{!20}
!20 = distinct !{!20, !18}
!21 = !{!22}
!22 = distinct !{!22, !18}
!23 = !{!17, !20}
!24 = distinct !{!24, !2, !3}
!25 = distinct !{!25, !2, !3}
