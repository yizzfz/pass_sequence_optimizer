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
  call fastcc void @init_array(float* nonnull %3, [2160 x float]* %8)
  call void (...) @polybench_timer_start() #5
  %10 = load float, float* %3, align 4
  %11 = bitcast i8* %6 to [2160 x float]*
  %12 = bitcast i8* %7 to [2160 x float]*
  call fastcc void @kernel_deriche(float %10, [2160 x float]* %8, [2160 x float]* %9, [2160 x float]* %11, [2160 x float]* %12)
  call void (...) @polybench_timer_stop() #5
  call void (...) @polybench_timer_print() #5
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to [2160 x float]*
  call fastcc void @print_array([2160 x float]* %18)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  call void @free(i8* %4) #5
  call void @free(i8* %5) #5
  call void @free(i8* %6) #5
  call void @free(i8* %7) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(float* nocapture, [2160 x float]* nocapture) unnamed_addr #2 {
  store float 2.500000e-01, float* %0, align 4
  br i1 true, label %.preheader.lr.ph, label %._crit_edge4

.preheader.lr.ph:                                 ; preds = %2
  br i1 true, label %.preheader.us.preheader, label %._crit_edge4

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next, %._crit_edge.us ]
  %3 = mul nuw nsw i64 %indvars.iv, 313
  br i1 false, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 false, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %3, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %4 = mul nuw nsw <4 x i64> %vec.ind, <i64 991, i64 991, i64 991, i64 991>
  %5 = add nsw <4 x i64> %broadcast.splat, %4
  %6 = trunc <4 x i64> %5 to <4 x i32>
  %7 = srem <4 x i32> %6, <i32 65536, i32 65536, i32 65536, i32 65536>
  %8 = sitofp <4 x i32> %7 to <4 x float>
  %9 = fdiv <4 x float> %8, <float 6.553500e+04, float 6.553500e+04, float 6.553500e+04, float 6.553500e+04>
  %10 = getelementptr inbounds [2160 x float], [2160 x float]* %1, i64 %indvars.iv, i64 %index
  %11 = bitcast float* %10 to <4 x float>*
  store <4 x float> %9, <4 x float>* %11, align 4
  %index.next = add i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %12 = icmp eq i64 %index.next, 2160
  br i1 %12, label %middle.block, label %vector.body, !llvm.loop !1

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
  %exitcond8 = icmp eq i64 %indvars.iv.next, 4096
  br i1 %exitcond8, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %.preheader.lr.ph, %2
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_deriche(float, [2160 x float]* nocapture readonly, [2160 x float]* nocapture, [2160 x float]* nocapture, [2160 x float]* nocapture) unnamed_addr #0 {
  %6 = fsub float -0.000000e+00, %0
  %7 = tail call float @expf(float %6) #5
  %8 = fsub float 1.000000e+00, %7
  %9 = tail call float @expf(float %6) #5
  %10 = fsub float 1.000000e+00, %9
  %11 = fmul float %8, %10
  %12 = fmul float %0, 2.000000e+00
  %13 = tail call float @expf(float %6) #5
  %14 = fmul float %12, %13
  %15 = fadd float %14, 1.000000e+00
  %16 = tail call float @expf(float %12) #5
  %17 = fsub float %15, %16
  %18 = fdiv float %11, %17
  %19 = tail call float @expf(float %6) #5
  %20 = fmul float %18, %19
  %21 = tail call float @expf(float %6) #5
  %22 = fmul float %18, %21
  %23 = insertelement <2 x float> undef, float %0, i32 0
  %24 = shufflevector <2 x float> %23, <2 x float> undef, <2 x i32> zeroinitializer
  %25 = fadd <2 x float> %24, <float -1.000000e+00, float 1.000000e+00>
  %26 = insertelement <2 x float> undef, float %20, i32 0
  %27 = insertelement <2 x float> %26, float %22, i32 1
  %28 = fmul <2 x float> %27, %25
  %29 = extractelement <2 x float> %28, i32 0
  %30 = extractelement <2 x float> %28, i32 1
  %31 = fmul float %0, -2.000000e+00
  %32 = tail call float @expf(float %31) #5
  %33 = fmul float %18, %32
  %34 = fsub float -0.000000e+00, %33
  %exp2 = tail call float @llvm.exp2.f32(float %6)
  %35 = tail call float @expf(float %31) #5
  %36 = fsub float -0.000000e+00, %35
  br i1 true, label %.preheader178.lr.ph, label %.preheader173

.preheader178.lr.ph:                              ; preds = %5
  br i1 true, label %.preheader178.us.preheader, label %._crit_edge181

.preheader178.us.preheader:                       ; preds = %.preheader178.lr.ph
  %37 = insertelement <2 x float> undef, float %29, i32 0
  %38 = insertelement <2 x float> %37, float %18, i32 1
  br label %.preheader178.us

.preheader178.us:                                 ; preds = %._crit_edge216.us, %.preheader178.us.preheader
  %indvars.iv254.us = phi i64 [ 0, %.preheader178.us.preheader ], [ %indvars.iv.next255.us, %._crit_edge216.us ]
  br i1 true, label %.prol.loopexit282, label %.prol.preheader281

.prol.preheader281:                               ; preds = %.preheader178.us
  br label %.prol.loopexit282

.prol.loopexit282:                                ; preds = %.preheader178.us, %.prol.preheader281
  %indvars.iv250.us.unr.ph = phi i64 [ 1, %.prol.preheader281 ], [ 0, %.preheader178.us ]
  br i1 false, label %._crit_edge216.us, label %.preheader178.us.new.preheader

.preheader178.us.new.preheader:                   ; preds = %.prol.loopexit282
  br label %.preheader178.us.new

.preheader178.us.new:                             ; preds = %.preheader178.us.new.preheader, %.preheader178.us.new
  %indvars.iv250.us = phi i64 [ %indvars.iv.next251.us.1, %.preheader178.us.new ], [ %indvars.iv250.us.unr.ph, %.preheader178.us.new.preheader ]
  %.0155213.us = phi float [ %61, %.preheader178.us.new ], [ 0.000000e+00, %.preheader178.us.new.preheader ]
  %.0157212.us = phi float [ %59, %.preheader178.us.new ], [ 0.000000e+00, %.preheader178.us.new.preheader ]
  %.0159211.us = phi float [ %47, %.preheader178.us.new ], [ 0.000000e+00, %.preheader178.us.new.preheader ]
  %39 = getelementptr inbounds [2160 x float], [2160 x float]* %1, i64 %indvars.iv254.us, i64 %indvars.iv250.us
  %40 = load float, float* %39, align 4
  %41 = fmul float %18, %40
  %42 = fmul float %29, %.0155213.us
  %43 = fadd float %41, %42
  %44 = fmul float %exp2, %.0157212.us
  %45 = fadd float %43, %44
  %46 = fmul float %.0159211.us, %36
  %47 = fadd float %45, %46
  %48 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv254.us, i64 %indvars.iv250.us
  store float %47, float* %48, align 4
  %49 = bitcast float* %39 to <2 x float>*
  %indvars.iv.next251.us = add nuw nsw i64 %indvars.iv250.us, 1
  %50 = getelementptr inbounds [2160 x float], [2160 x float]* %1, i64 %indvars.iv254.us, i64 %indvars.iv.next251.us
  %51 = load <2 x float>, <2 x float>* %49, align 4
  %52 = fmul <2 x float> %38, %51
  %53 = extractelement <2 x float> %52, i32 0
  %54 = extractelement <2 x float> %52, i32 1
  %55 = fadd float %54, %53
  %56 = fmul float %exp2, %47
  %57 = fadd float %55, %56
  %58 = fmul float %.0157212.us, %36
  %59 = fadd float %57, %58
  %60 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv254.us, i64 %indvars.iv.next251.us
  store float %59, float* %60, align 4
  %61 = load float, float* %50, align 4
  %indvars.iv.next251.us.1 = add nuw nsw i64 %indvars.iv250.us, 2
  %exitcond253.us.1 = icmp eq i64 %indvars.iv.next251.us.1, 2160
  br i1 %exitcond253.us.1, label %._crit_edge216.us.loopexit, label %.preheader178.us.new

._crit_edge216.us.loopexit:                       ; preds = %.preheader178.us.new
  br label %._crit_edge216.us

._crit_edge216.us:                                ; preds = %._crit_edge216.us.loopexit, %.prol.loopexit282
  %indvars.iv.next255.us = add nuw nsw i64 %indvars.iv254.us, 1
  %exitcond257.us = icmp eq i64 %indvars.iv.next255.us, 4096
  br i1 %exitcond257.us, label %.preheader177, label %.preheader178.us

.preheader177:                                    ; preds = %._crit_edge216.us
  br i1 true, label %.preheader176.lr.ph, label %.preheader173

.preheader176.lr.ph:                              ; preds = %.preheader177
  br i1 true, label %.preheader176.us.preheader, label %._crit_edge181

.preheader176.us.preheader:                       ; preds = %.preheader176.lr.ph
  %62 = fmul float %30, 0.000000e+00
  %63 = fmul float %33, -0.000000e+00
  %64 = fadd float %62, %63
  %65 = fmul float %exp2, 0.000000e+00
  %66 = fadd float %64, %65
  %67 = fmul float %35, -0.000000e+00
  %68 = fadd float %66, %67
  br label %.preheader176.us

.preheader176.us:                                 ; preds = %._crit_edge209.us, %.preheader176.us.preheader
  %indvars.iv246.us = phi i64 [ 0, %.preheader176.us.preheader ], [ %indvars.iv.next247.us, %._crit_edge209.us ]
  br i1 true, label %.prol.loopexit278, label %.prol.preheader277

.prol.preheader277:                               ; preds = %.preheader176.us
  br label %.prol.loopexit278

.prol.loopexit278:                                ; preds = %.preheader176.us, %.prol.preheader277
  %indvars.iv244.us.in.unr.ph = phi i64 [ 2159, %.prol.preheader277 ], [ 2160, %.preheader176.us ]
  %.0165204.us.unr.ph = phi float [ %68, %.prol.preheader277 ], [ 0.000000e+00, %.preheader176.us ]
  br i1 false, label %._crit_edge209.us, label %.preheader176.us.new.preheader

.preheader176.us.new.preheader:                   ; preds = %.prol.loopexit278
  br label %.preheader176.us.new

.preheader176.us.new:                             ; preds = %.preheader176.us.new.preheader, %.preheader176.us.new
  %indvars.iv244.us.in = phi i64 [ %indvars.iv244.us.1, %.preheader176.us.new ], [ %indvars.iv244.us.in.unr.ph, %.preheader176.us.new.preheader ]
  %.0161206.us = phi float [ %88, %.preheader176.us.new ], [ 0.000000e+00, %.preheader176.us.new.preheader ]
  %.0162205.us = phi float [ %78, %.preheader176.us.new ], [ 0.000000e+00, %.preheader176.us.new.preheader ]
  %.0165204.us = phi float [ %85, %.preheader176.us.new ], [ %.0165204.us.unr.ph, %.preheader176.us.new.preheader ]
  %.0167203.us = phi float [ %75, %.preheader176.us.new ], [ 0.000000e+00, %.preheader176.us.new.preheader ]
  %indvars.iv244.us = add nsw i64 %indvars.iv244.us.in, -1
  %69 = fmul float %30, %.0161206.us
  %70 = fmul float %.0162205.us, %34
  %71 = fadd float %69, %70
  %72 = fmul float %exp2, %.0165204.us
  %73 = fadd float %71, %72
  %74 = fmul float %.0167203.us, %36
  %75 = fadd float %73, %74
  %76 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv246.us, i64 %indvars.iv244.us
  store float %75, float* %76, align 4
  %77 = getelementptr inbounds [2160 x float], [2160 x float]* %1, i64 %indvars.iv246.us, i64 %indvars.iv244.us
  %78 = load float, float* %77, align 4
  %indvars.iv244.us.1 = add nsw i64 %indvars.iv244.us.in, -2
  %79 = fmul float %30, %78
  %80 = fmul float %.0161206.us, %34
  %81 = fadd float %79, %80
  %82 = fmul float %exp2, %75
  %83 = fadd float %81, %82
  %84 = fmul float %.0165204.us, %36
  %85 = fadd float %83, %84
  %86 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv246.us, i64 %indvars.iv244.us.1
  store float %85, float* %86, align 4
  %87 = getelementptr inbounds [2160 x float], [2160 x float]* %1, i64 %indvars.iv246.us, i64 %indvars.iv244.us.1
  %88 = load float, float* %87, align 4
  %89 = icmp sgt i64 %indvars.iv244.us.in, 2
  br i1 %89, label %.preheader176.us.new, label %._crit_edge209.us.loopexit

._crit_edge209.us.loopexit:                       ; preds = %.preheader176.us.new
  br label %._crit_edge209.us

._crit_edge209.us:                                ; preds = %._crit_edge209.us.loopexit, %.prol.loopexit278
  %indvars.iv.next247.us = add nuw nsw i64 %indvars.iv246.us, 1
  %exitcond249.us = icmp eq i64 %indvars.iv.next247.us, 4096
  br i1 %exitcond249.us, label %.preheader175, label %.preheader176.us

.preheader175:                                    ; preds = %._crit_edge209.us
  br i1 true, label %.preheader174.lr.ph, label %.preheader173

.preheader174.lr.ph:                              ; preds = %.preheader175
  br i1 true, label %.preheader174.us.preheader, label %._crit_edge181

.preheader174.us.preheader:                       ; preds = %.preheader174.lr.ph
  br label %.preheader174.us

.preheader174.us:                                 ; preds = %._crit_edge200.us, %.preheader174.us.preheader
  %indvars.iv240.us = phi i64 [ 0, %.preheader174.us.preheader ], [ %indvars.iv.next241.us, %._crit_edge200.us ]
  %scevgep296 = getelementptr [2160 x float], [2160 x float]* %2, i64 %indvars.iv240.us, i64 2
  %scevgep302 = getelementptr [2160 x float], [2160 x float]* %3, i64 %indvars.iv240.us, i64 2
  %scevgep308 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 2
  br i1 true, label %.prol.loopexit274, label %.prol.preheader273

.prol.preheader273:                               ; preds = %.preheader174.us
  br label %.prol.loopexit274

.prol.loopexit274:                                ; preds = %.preheader174.us, %.prol.preheader273
  %indvars.iv236.us.unr.ph = phi i64 [ 1, %.prol.preheader273 ], [ 0, %.preheader174.us ]
  br i1 false, label %._crit_edge200.us, label %.prol.loopexit274..preheader174.us.new_crit_edge

.prol.loopexit274..preheader174.us.new_crit_edge: ; preds = %.prol.loopexit274
  %90 = sub nsw i64 2158, %indvars.iv236.us.unr.ph
  %91 = lshr i64 %90, 1
  %92 = add nuw nsw i64 %91, 1
  br i1 false, label %.preheader174.us.new.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.prol.loopexit274..preheader174.us.new_crit_edge
  %n.mod.vf = and i64 %92, 3
  %n.vec = sub nsw i64 %92, %n.mod.vf
  br i1 false, label %.preheader174.us.new.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep294 = getelementptr [2160 x float], [2160 x float]* %2, i64 %indvars.iv240.us, i64 %indvars.iv236.us.unr.ph
  %93 = sub nsw i64 2158, %indvars.iv236.us.unr.ph
  %94 = and i64 %93, 2158
  %95 = or i64 %indvars.iv236.us.unr.ph, %94
  %scevgep297 = getelementptr float, float* %scevgep296, i64 %95
  %scevgep300 = getelementptr [2160 x float], [2160 x float]* %3, i64 %indvars.iv240.us, i64 %indvars.iv236.us.unr.ph
  %scevgep303 = getelementptr float, float* %scevgep302, i64 %95
  %scevgep306 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 %indvars.iv236.us.unr.ph
  %scevgep309 = getelementptr float, float* %scevgep308, i64 %95
  %bound0 = icmp ult float* %scevgep294, %scevgep303
  %bound1 = icmp ult float* %scevgep300, %scevgep297
  %found.conflict = and i1 %bound0, %bound1
  %bound0311 = icmp ult float* %scevgep294, %scevgep309
  %bound1312 = icmp ult float* %scevgep306, %scevgep297
  %found.conflict313 = and i1 %bound0311, %bound1312
  %conflict.rdx = or i1 %found.conflict, %found.conflict313
  %96 = or i64 %indvars.iv236.us.unr.ph, 2
  %97 = shl nuw nsw i64 %91, 1
  %98 = add nuw nsw i64 %96, %97
  %99 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub nsw i64 %98, %99
  br i1 %conflict.rdx, label %.preheader174.us.new.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %100 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv236.us.unr.ph, %100
  %101 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv240.us, i64 %offset.idx
  %102 = bitcast float* %101 to <8 x float>*
  %wide.vec = load <8 x float>, <8 x float>* %102, align 4, !alias.scope !6
  %103 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 %offset.idx
  %104 = bitcast float* %103 to <8 x float>*
  %wide.vec315 = load <8 x float>, <8 x float>* %104, align 4, !alias.scope !9
  %105 = fadd <8 x float> %wide.vec, %wide.vec315
  %106 = shufflevector <8 x float> %105, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %107 = add nuw nsw i64 %offset.idx, 1
  %108 = fadd <8 x float> %wide.vec, %wide.vec315
  %109 = shufflevector <8 x float> %108, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %110 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv240.us, i64 %107
  %111 = getelementptr float, float* %110, i64 -1
  %112 = bitcast float* %111 to <8 x float>*
  %interleaved.vec = shufflevector <4 x float> %106, <4 x float> %109, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec, <8 x float>* %112, align 4, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %113 = icmp eq i64 %index.next, %n.vec
  br i1 %113, label %middle.block, label %vector.body, !llvm.loop !14

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge200.us, label %.preheader174.us.new.preheader

.preheader174.us.new.preheader:                   ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.prol.loopexit274..preheader174.us.new_crit_edge
  %indvars.iv236.us.ph = phi i64 [ %ind.end, %middle.block ], [ %indvars.iv236.us.unr.ph, %vector.memcheck ], [ %indvars.iv236.us.unr.ph, %min.iters.checked ], [ %indvars.iv236.us.unr.ph, %.prol.loopexit274..preheader174.us.new_crit_edge ]
  br label %.preheader174.us.new

.preheader174.us.new:                             ; preds = %.preheader174.us.new.preheader, %.preheader174.us.new
  %indvars.iv236.us = phi i64 [ %indvars.iv.next237.us.1, %.preheader174.us.new ], [ %indvars.iv236.us.ph, %.preheader174.us.new.preheader ]
  %114 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv240.us, i64 %indvars.iv236.us
  %115 = load float, float* %114, align 4
  %116 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 %indvars.iv236.us
  %117 = load float, float* %116, align 4
  %118 = fadd float %115, %117
  %119 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv240.us, i64 %indvars.iv236.us
  store float %118, float* %119, align 4
  %indvars.iv.next237.us = add nuw nsw i64 %indvars.iv236.us, 1
  %120 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv240.us, i64 %indvars.iv.next237.us
  %121 = load float, float* %120, align 4
  %122 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 %indvars.iv.next237.us
  %123 = load float, float* %122, align 4
  %124 = fadd float %121, %123
  %125 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv240.us, i64 %indvars.iv.next237.us
  store float %124, float* %125, align 4
  %indvars.iv.next237.us.1 = add nsw i64 %indvars.iv236.us, 2
  %exitcond239.us.1 = icmp eq i64 %indvars.iv.next237.us.1, 2160
  br i1 %exitcond239.us.1, label %._crit_edge200.us.loopexit, label %.preheader174.us.new, !llvm.loop !15

._crit_edge200.us.loopexit:                       ; preds = %.preheader174.us.new
  br label %._crit_edge200.us

._crit_edge200.us:                                ; preds = %._crit_edge200.us.loopexit, %middle.block, %.prol.loopexit274
  %indvars.iv.next241.us = add nuw nsw i64 %indvars.iv240.us, 1
  %exitcond243.us = icmp eq i64 %indvars.iv.next241.us, 4096
  br i1 %exitcond243.us, label %.preheader173.loopexit, label %.preheader174.us

.preheader173.loopexit:                           ; preds = %._crit_edge200.us
  br label %.preheader173

.preheader173:                                    ; preds = %.preheader173.loopexit, %.preheader175, %.preheader177, %5
  br i1 true, label %.preheader172.lr.ph, label %.preheader169

.preheader172.lr.ph:                              ; preds = %.preheader173
  br i1 true, label %.preheader172.us.preheader, label %._crit_edge181

.preheader172.us.preheader:                       ; preds = %.preheader172.lr.ph
  br label %.preheader172.us

.preheader172.us:                                 ; preds = %._crit_edge196.us, %.preheader172.us.preheader
  %indvars.iv232.us = phi i64 [ 0, %.preheader172.us.preheader ], [ %indvars.iv.next233.us, %._crit_edge196.us ]
  br i1 true, label %.prol.loopexit270, label %.prol.preheader269

.prol.preheader269:                               ; preds = %.preheader172.us
  br label %.prol.loopexit270

.prol.loopexit270:                                ; preds = %.preheader172.us, %.prol.preheader269
  %indvars.iv228.us.unr.ph = phi i64 [ 1, %.prol.preheader269 ], [ 0, %.preheader172.us ]
  br i1 false, label %._crit_edge196.us, label %.preheader172.us.new.preheader

.preheader172.us.new.preheader:                   ; preds = %.prol.loopexit270
  br label %.preheader172.us.new

.preheader172.us.new:                             ; preds = %.preheader172.us.new.preheader, %.preheader172.us.new
  %indvars.iv228.us = phi i64 [ %indvars.iv.next229.us.1, %.preheader172.us.new ], [ %indvars.iv228.us.unr.ph, %.preheader172.us.new.preheader ]
  %.0156193.us = phi float [ %147, %.preheader172.us.new ], [ 0.000000e+00, %.preheader172.us.new.preheader ]
  %.1158192.us = phi float [ %145, %.preheader172.us.new ], [ 0.000000e+00, %.preheader172.us.new.preheader ]
  %.1160191.us = phi float [ %134, %.preheader172.us.new ], [ 0.000000e+00, %.preheader172.us.new.preheader ]
  %126 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv228.us, i64 %indvars.iv232.us
  %127 = load float, float* %126, align 4
  %128 = fmul float %18, %127
  %129 = fmul float %29, %.0156193.us
  %130 = fadd float %128, %129
  %131 = fmul float %exp2, %.1158192.us
  %132 = fadd float %130, %131
  %133 = fmul float %.1160191.us, %36
  %134 = fadd float %132, %133
  %135 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv228.us, i64 %indvars.iv232.us
  store float %134, float* %135, align 4
  %136 = load float, float* %126, align 4
  %indvars.iv.next229.us = add nuw nsw i64 %indvars.iv228.us, 1
  %137 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv.next229.us, i64 %indvars.iv232.us
  %138 = load float, float* %137, align 4
  %139 = fmul float %18, %138
  %140 = fmul float %29, %136
  %141 = fadd float %139, %140
  %142 = fmul float %exp2, %134
  %143 = fadd float %141, %142
  %144 = fmul float %.1158192.us, %36
  %145 = fadd float %143, %144
  %146 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv.next229.us, i64 %indvars.iv232.us
  store float %145, float* %146, align 4
  %147 = load float, float* %137, align 4
  %indvars.iv.next229.us.1 = add nuw nsw i64 %indvars.iv228.us, 2
  %exitcond231.us.1 = icmp eq i64 %indvars.iv.next229.us.1, 4096
  br i1 %exitcond231.us.1, label %._crit_edge196.us.loopexit, label %.preheader172.us.new

._crit_edge196.us.loopexit:                       ; preds = %.preheader172.us.new
  br label %._crit_edge196.us

._crit_edge196.us:                                ; preds = %._crit_edge196.us.loopexit, %.prol.loopexit270
  %indvars.iv.next233.us = add nuw nsw i64 %indvars.iv232.us, 1
  %exitcond235.us = icmp eq i64 %indvars.iv.next233.us, 2160
  br i1 %exitcond235.us, label %.preheader171, label %.preheader172.us

.preheader171:                                    ; preds = %._crit_edge196.us
  br i1 true, label %.preheader170.lr.ph, label %.preheader169

.preheader170.lr.ph:                              ; preds = %.preheader171
  br i1 true, label %.preheader170.us.preheader, label %._crit_edge181

.preheader170.us.preheader:                       ; preds = %.preheader170.lr.ph
  %148 = fmul float %30, 0.000000e+00
  %149 = fmul float %33, -0.000000e+00
  %150 = fadd float %148, %149
  %151 = fmul float %exp2, 0.000000e+00
  %152 = fadd float %150, %151
  %153 = fmul float %35, -0.000000e+00
  %154 = fadd float %152, %153
  br label %.preheader170.us

.preheader170.us:                                 ; preds = %._crit_edge189.us, %.preheader170.us.preheader
  %indvars.iv224.us = phi i64 [ 0, %.preheader170.us.preheader ], [ %indvars.iv.next225.us, %._crit_edge189.us ]
  br i1 true, label %.prol.loopexit266, label %.prol.preheader265

.prol.preheader265:                               ; preds = %.preheader170.us
  br label %.prol.loopexit266

.prol.loopexit266:                                ; preds = %.preheader170.us, %.prol.preheader265
  %indvars.iv222.us.in.unr.ph = phi i64 [ 4095, %.prol.preheader265 ], [ 4096, %.preheader170.us ]
  %.1166184.us.unr.ph = phi float [ %154, %.prol.preheader265 ], [ 0.000000e+00, %.preheader170.us ]
  br i1 false, label %._crit_edge189.us, label %.preheader170.us.new.preheader

.preheader170.us.new.preheader:                   ; preds = %.prol.loopexit266
  br label %.preheader170.us.new

.preheader170.us.new:                             ; preds = %.preheader170.us.new.preheader, %.preheader170.us.new
  %indvars.iv222.us.in = phi i64 [ %indvars.iv222.us.1, %.preheader170.us.new ], [ %indvars.iv222.us.in.unr.ph, %.preheader170.us.new.preheader ]
  %.0163186.us = phi float [ %174, %.preheader170.us.new ], [ 0.000000e+00, %.preheader170.us.new.preheader ]
  %.0164185.us = phi float [ %164, %.preheader170.us.new ], [ 0.000000e+00, %.preheader170.us.new.preheader ]
  %.1166184.us = phi float [ %171, %.preheader170.us.new ], [ %.1166184.us.unr.ph, %.preheader170.us.new.preheader ]
  %.1168183.us = phi float [ %161, %.preheader170.us.new ], [ 0.000000e+00, %.preheader170.us.new.preheader ]
  %indvars.iv222.us = add nsw i64 %indvars.iv222.us.in, -1
  %155 = fmul float %30, %.0163186.us
  %156 = fmul float %.0164185.us, %34
  %157 = fadd float %155, %156
  %158 = fmul float %exp2, %.1166184.us
  %159 = fadd float %157, %158
  %160 = fmul float %.1168183.us, %36
  %161 = fadd float %159, %160
  %162 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv222.us, i64 %indvars.iv224.us
  store float %161, float* %162, align 4
  %163 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv222.us, i64 %indvars.iv224.us
  %164 = load float, float* %163, align 4
  %indvars.iv222.us.1 = add nsw i64 %indvars.iv222.us.in, -2
  %165 = fmul float %30, %164
  %166 = fmul float %.0163186.us, %34
  %167 = fadd float %165, %166
  %168 = fmul float %exp2, %161
  %169 = fadd float %167, %168
  %170 = fmul float %.1166184.us, %36
  %171 = fadd float %169, %170
  %172 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv222.us.1, i64 %indvars.iv224.us
  store float %171, float* %172, align 4
  %173 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv222.us.1, i64 %indvars.iv224.us
  %174 = load float, float* %173, align 4
  %175 = icmp sgt i64 %indvars.iv222.us.in, 2
  br i1 %175, label %.preheader170.us.new, label %._crit_edge189.us.loopexit

._crit_edge189.us.loopexit:                       ; preds = %.preheader170.us.new
  br label %._crit_edge189.us

._crit_edge189.us:                                ; preds = %._crit_edge189.us.loopexit, %.prol.loopexit266
  %indvars.iv.next225.us = add nuw nsw i64 %indvars.iv224.us, 1
  %exitcond227.us = icmp eq i64 %indvars.iv.next225.us, 2160
  br i1 %exitcond227.us, label %.preheader169.loopexit, label %.preheader170.us

.preheader169.loopexit:                           ; preds = %._crit_edge189.us
  br label %.preheader169

.preheader169:                                    ; preds = %.preheader169.loopexit, %.preheader171, %.preheader173
  %176 = phi i1 [ false, %.preheader173 ], [ false, %.preheader171 ], [ true, %.preheader169.loopexit ]
  br i1 true, label %.preheader.lr.ph, label %._crit_edge181

.preheader.lr.ph:                                 ; preds = %.preheader169
  br i1 %176, label %.preheader.us.preheader, label %._crit_edge181

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv218.us = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next219.us, %._crit_edge.us ]
  %scevgep330 = getelementptr [2160 x float], [2160 x float]* %2, i64 %indvars.iv218.us, i64 2
  %scevgep336 = getelementptr [2160 x float], [2160 x float]* %3, i64 %indvars.iv218.us, i64 2
  %scevgep342 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 2
  br i1 true, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us, %.prol.preheader
  %indvars.iv.us.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us ]
  br i1 false, label %._crit_edge.us, label %.prol.loopexit..preheader.us.new_crit_edge

.prol.loopexit..preheader.us.new_crit_edge:       ; preds = %.prol.loopexit
  %177 = sub nsw i64 2158, %indvars.iv.us.unr.ph
  %178 = lshr i64 %177, 1
  %179 = add nuw nsw i64 %178, 1
  br i1 false, label %.preheader.us.new.preheader, label %min.iters.checked322

min.iters.checked322:                             ; preds = %.prol.loopexit..preheader.us.new_crit_edge
  %n.mod.vf323 = and i64 %179, 3
  %n.vec324 = sub nsw i64 %179, %n.mod.vf323
  br i1 false, label %.preheader.us.new.preheader, label %vector.memcheck353

vector.memcheck353:                               ; preds = %min.iters.checked322
  %scevgep328 = getelementptr [2160 x float], [2160 x float]* %2, i64 %indvars.iv218.us, i64 %indvars.iv.us.unr.ph
  %180 = sub nsw i64 2158, %indvars.iv.us.unr.ph
  %181 = and i64 %180, 2158
  %182 = or i64 %indvars.iv.us.unr.ph, %181
  %scevgep331 = getelementptr float, float* %scevgep330, i64 %182
  %scevgep334 = getelementptr [2160 x float], [2160 x float]* %3, i64 %indvars.iv218.us, i64 %indvars.iv.us.unr.ph
  %scevgep337 = getelementptr float, float* %scevgep336, i64 %182
  %scevgep340 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 %indvars.iv.us.unr.ph
  %scevgep343 = getelementptr float, float* %scevgep342, i64 %182
  %bound0345 = icmp ult float* %scevgep328, %scevgep337
  %bound1346 = icmp ult float* %scevgep334, %scevgep331
  %found.conflict347 = and i1 %bound0345, %bound1346
  %bound0348 = icmp ult float* %scevgep328, %scevgep343
  %bound1349 = icmp ult float* %scevgep340, %scevgep331
  %found.conflict350 = and i1 %bound0348, %bound1349
  %conflict.rdx351 = or i1 %found.conflict347, %found.conflict350
  %183 = or i64 %indvars.iv.us.unr.ph, 2
  %184 = shl nuw nsw i64 %178, 1
  %185 = add nuw nsw i64 %183, %184
  %186 = shl nuw nsw i64 %n.mod.vf323, 1
  %ind.end358 = sub nsw i64 %185, %186
  br i1 %conflict.rdx351, label %.preheader.us.new.preheader, label %vector.body318.preheader

vector.body318.preheader:                         ; preds = %vector.memcheck353
  br label %vector.body318

vector.body318:                                   ; preds = %vector.body318.preheader, %vector.body318
  %index355 = phi i64 [ %index.next356, %vector.body318 ], [ 0, %vector.body318.preheader ]
  %187 = shl i64 %index355, 1
  %offset.idx360 = or i64 %indvars.iv.us.unr.ph, %187
  %188 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv218.us, i64 %offset.idx360
  %189 = bitcast float* %188 to <8 x float>*
  %wide.vec364 = load <8 x float>, <8 x float>* %189, align 4, !alias.scope !16
  %190 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 %offset.idx360
  %191 = bitcast float* %190 to <8 x float>*
  %wide.vec367 = load <8 x float>, <8 x float>* %191, align 4, !alias.scope !19
  %192 = fadd <8 x float> %wide.vec364, %wide.vec367
  %193 = shufflevector <8 x float> %192, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %194 = add nuw nsw i64 %offset.idx360, 1
  %195 = fadd <8 x float> %wide.vec364, %wide.vec367
  %196 = shufflevector <8 x float> %195, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %197 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv218.us, i64 %194
  %198 = getelementptr float, float* %197, i64 -1
  %199 = bitcast float* %198 to <8 x float>*
  %interleaved.vec370 = shufflevector <4 x float> %193, <4 x float> %196, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec370, <8 x float>* %199, align 4, !alias.scope !21, !noalias !23
  %index.next356 = add i64 %index355, 4
  %200 = icmp eq i64 %index.next356, %n.vec324
  br i1 %200, label %middle.block319, label %vector.body318, !llvm.loop !24

middle.block319:                                  ; preds = %vector.body318
  %cmp.n359 = icmp eq i64 %n.mod.vf323, 0
  br i1 %cmp.n359, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %middle.block319, %vector.memcheck353, %min.iters.checked322, %.prol.loopexit..preheader.us.new_crit_edge
  %indvars.iv.us.ph = phi i64 [ %ind.end358, %middle.block319 ], [ %indvars.iv.us.unr.ph, %vector.memcheck353 ], [ %indvars.iv.us.unr.ph, %min.iters.checked322 ], [ %indvars.iv.us.unr.ph, %.prol.loopexit..preheader.us.new_crit_edge ]
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader, %.preheader.us.new
  %indvars.iv.us = phi i64 [ %indvars.iv.next.us.1, %.preheader.us.new ], [ %indvars.iv.us.ph, %.preheader.us.new.preheader ]
  %201 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv218.us, i64 %indvars.iv.us
  %202 = load float, float* %201, align 4
  %203 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 %indvars.iv.us
  %204 = load float, float* %203, align 4
  %205 = fadd float %202, %204
  %206 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv218.us, i64 %indvars.iv.us
  store float %205, float* %206, align 4
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %207 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv218.us, i64 %indvars.iv.next.us
  %208 = load float, float* %207, align 4
  %209 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 %indvars.iv.next.us
  %210 = load float, float* %209, align 4
  %211 = fadd float %208, %210
  %212 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv218.us, i64 %indvars.iv.next.us
  store float %211, float* %212, align 4
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv.us, 2
  %exitcond.us.1 = icmp eq i64 %indvars.iv.next.us.1, 2160
  br i1 %exitcond.us.1, label %._crit_edge.us.loopexit, label %.preheader.us.new, !llvm.loop !25

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block319, %.prol.loopexit
  %indvars.iv.next219.us = add nuw nsw i64 %indvars.iv218.us, 1
  %exitcond221.us = icmp eq i64 %indvars.iv.next219.us, 4096
  br i1 %exitcond221.us, label %._crit_edge181.loopexit, label %.preheader.us

._crit_edge181.loopexit:                          ; preds = %._crit_edge.us
  br label %._crit_edge181

._crit_edge181:                                   ; preds = %._crit_edge181.loopexit, %.preheader.lr.ph, %.preheader169, %.preheader170.lr.ph, %.preheader172.lr.ph, %.preheader174.lr.ph, %.preheader176.lr.ph, %.preheader178.lr.ph
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2160 x float]* nocapture readonly) unnamed_addr #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  br i1 true, label %.preheader.lr.ph, label %._crit_edge14

.preheader.lr.ph:                                 ; preds = %1
  br i1 true, label %.preheader.us.preheader, label %._crit_edge14

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv15.us = phi i64 [ %indvars.iv.next16.us, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %6 = mul nsw i64 %indvars.iv15.us, 2160
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %._crit_edge ]
  %7 = add nsw i64 %6, %indvars.iv.us
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge21
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge21, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [2160 x float], [2160 x float]* %0, i64 %indvars.iv15.us, i64 %indvars.iv.us
  %15 = load float, float* %14, align 4
  %16 = fpext float %15 to double
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 2160
  br i1 %exitcond.us, label %._crit_edge.us, label %._crit_edge21

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next16.us = add nuw nsw i64 %indvars.iv15.us, 1
  %exitcond18.us = icmp eq i64 %indvars.iv.next16.us, 4096
  br i1 %exitcond18.us, label %._crit_edge14.loopexit, label %.preheader.us

._crit_edge14.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %.preheader.lr.ph, %1
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #6
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
