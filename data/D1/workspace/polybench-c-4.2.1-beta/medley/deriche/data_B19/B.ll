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
  %exp2 = tail call float @llvm.exp2.f32(float %8)
  %37 = tail call float @expf(float %33) #5
  %38 = fsub float -0.000000e+00, %37
  br i1 true, label %.preheader178.lr.ph, label %.preheader173

.preheader178.lr.ph:                              ; preds = %7
  br i1 true, label %.preheader178.us.preheader, label %._crit_edge181

.preheader178.us.preheader:                       ; preds = %.preheader178.lr.ph
  %39 = insertelement <2 x float> undef, float %31, i32 0
  %40 = insertelement <2 x float> %39, float %20, i32 1
  br label %.preheader178.us

.preheader178.us:                                 ; preds = %.preheader178.us.preheader, %._crit_edge216.us
  %indvars.iv254.us = phi i64 [ %indvars.iv.next255.us, %._crit_edge216.us ], [ 0, %.preheader178.us.preheader ]
  br i1 true, label %.prol.loopexit282, label %.prol.preheader281

.prol.preheader281:                               ; preds = %.preheader178.us
  br label %.prol.loopexit282

.prol.loopexit282:                                ; preds = %.prol.preheader281, %.preheader178.us
  %indvars.iv250.us.unr.ph = phi i64 [ 1, %.prol.preheader281 ], [ 0, %.preheader178.us ]
  br i1 false, label %._crit_edge216.us, label %.preheader178.us.new.preheader

.preheader178.us.new.preheader:                   ; preds = %.prol.loopexit282
  br label %.preheader178.us.new

.preheader178.us.new:                             ; preds = %.preheader178.us.new.preheader, %.preheader178.us.new
  %indvars.iv250.us = phi i64 [ %indvars.iv.next251.us.1, %.preheader178.us.new ], [ %indvars.iv250.us.unr.ph, %.preheader178.us.new.preheader ]
  %.0155213.us = phi float [ %63, %.preheader178.us.new ], [ 0.000000e+00, %.preheader178.us.new.preheader ]
  %.0157212.us = phi float [ %61, %.preheader178.us.new ], [ 0.000000e+00, %.preheader178.us.new.preheader ]
  %.0159211.us = phi float [ %49, %.preheader178.us.new ], [ 0.000000e+00, %.preheader178.us.new.preheader ]
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
  %64 = fmul float %32, 0.000000e+00
  %65 = fmul float %35, -0.000000e+00
  %66 = fadd float %65, %64
  %67 = fmul float %exp2, 0.000000e+00
  %68 = fadd float %67, %66
  %69 = fmul float %37, -0.000000e+00
  %70 = fadd float %69, %68
  br label %.preheader176.us

.preheader176.us:                                 ; preds = %.preheader176.us.preheader, %._crit_edge209.us
  %indvars.iv246.us = phi i64 [ %indvars.iv.next247.us, %._crit_edge209.us ], [ 0, %.preheader176.us.preheader ]
  br i1 true, label %.prol.loopexit278, label %.prol.preheader277

.prol.preheader277:                               ; preds = %.preheader176.us
  br label %.prol.loopexit278

.prol.loopexit278:                                ; preds = %.prol.preheader277, %.preheader176.us
  %indvars.iv244.us.in.unr.ph = phi i64 [ 2159, %.prol.preheader277 ], [ 2160, %.preheader176.us ]
  %.0165204.us.unr.ph = phi float [ %70, %.prol.preheader277 ], [ 0.000000e+00, %.preheader176.us ]
  br i1 false, label %._crit_edge209.us, label %.preheader176.us.new.preheader

.preheader176.us.new.preheader:                   ; preds = %.prol.loopexit278
  br label %.preheader176.us.new

.preheader176.us.new:                             ; preds = %.preheader176.us.new.preheader, %.preheader176.us.new
  %indvars.iv244.us.in = phi i64 [ %indvars.iv244.us.1, %.preheader176.us.new ], [ %indvars.iv244.us.in.unr.ph, %.preheader176.us.new.preheader ]
  %.0161206.us = phi float [ %90, %.preheader176.us.new ], [ 0.000000e+00, %.preheader176.us.new.preheader ]
  %.0162205.us = phi float [ %80, %.preheader176.us.new ], [ 0.000000e+00, %.preheader176.us.new.preheader ]
  %.0165204.us = phi float [ %87, %.preheader176.us.new ], [ %.0165204.us.unr.ph, %.preheader176.us.new.preheader ]
  %.0167203.us = phi float [ %77, %.preheader176.us.new ], [ 0.000000e+00, %.preheader176.us.new.preheader ]
  %indvars.iv244.us = add nsw i64 %indvars.iv244.us.in, -1
  %71 = fmul float %32, %.0161206.us
  %72 = fmul float %.0162205.us, %36
  %73 = fadd float %72, %71
  %74 = fmul float %exp2, %.0165204.us
  %75 = fadd float %74, %73
  %76 = fmul float %.0167203.us, %38
  %77 = fadd float %76, %75
  %78 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv246.us, i64 %indvars.iv244.us
  store float %77, float* %78, align 4
  %79 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv246.us, i64 %indvars.iv244.us
  %80 = load float, float* %79, align 4
  %indvars.iv244.us.1 = add nsw i64 %indvars.iv244.us.in, -2
  %81 = fmul float %32, %80
  %82 = fmul float %.0161206.us, %36
  %83 = fadd float %82, %81
  %84 = fmul float %exp2, %77
  %85 = fadd float %84, %83
  %86 = fmul float %.0165204.us, %38
  %87 = fadd float %86, %85
  %88 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv246.us, i64 %indvars.iv244.us.1
  store float %87, float* %88, align 4
  %89 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv246.us, i64 %indvars.iv244.us.1
  %90 = load float, float* %89, align 4
  %91 = icmp sgt i64 %indvars.iv244.us.in, 2
  br i1 %91, label %.preheader176.us.new, label %._crit_edge209.us.loopexit

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

.preheader174.us:                                 ; preds = %.preheader174.us.preheader, %._crit_edge200.us
  %indvars.iv240.us = phi i64 [ %indvars.iv.next241.us, %._crit_edge200.us ], [ 0, %.preheader174.us.preheader ]
  %scevgep296 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 2
  %scevgep302 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv240.us, i64 2
  %scevgep308 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv240.us, i64 2
  br i1 true, label %.prol.loopexit274, label %.prol.preheader273

.prol.preheader273:                               ; preds = %.preheader174.us
  br label %.prol.loopexit274

.prol.loopexit274:                                ; preds = %.prol.preheader273, %.preheader174.us
  %indvars.iv236.us.unr.ph = phi i64 [ 1, %.prol.preheader273 ], [ 0, %.preheader174.us ]
  br i1 false, label %._crit_edge200.us, label %.preheader174.us.new.preheader

.preheader174.us.new.preheader:                   ; preds = %.prol.loopexit274
  %92 = sub nsw i64 2158, %indvars.iv236.us.unr.ph
  %93 = lshr i64 %92, 1
  %94 = add nuw nsw i64 %93, 1
  br i1 false, label %.preheader174.us.new.preheader372, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader174.us.new.preheader
  %n.mod.vf = and i64 %94, 3
  %n.vec = sub nsw i64 %94, %n.mod.vf
  br i1 false, label %.preheader174.us.new.preheader372, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep294 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 %indvars.iv236.us.unr.ph
  %95 = sub nsw i64 2158, %indvars.iv236.us.unr.ph
  %96 = and i64 %95, 2158
  %97 = or i64 %indvars.iv236.us.unr.ph, %96
  %scevgep297 = getelementptr float, float* %scevgep296, i64 %97
  %scevgep300 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv240.us, i64 %indvars.iv236.us.unr.ph
  %scevgep303 = getelementptr float, float* %scevgep302, i64 %97
  %scevgep306 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv240.us, i64 %indvars.iv236.us.unr.ph
  %scevgep309 = getelementptr float, float* %scevgep308, i64 %97
  %bound0 = icmp ult float* %scevgep294, %scevgep303
  %bound1 = icmp ult float* %scevgep300, %scevgep297
  %found.conflict = and i1 %bound0, %bound1
  %bound0311 = icmp ult float* %scevgep294, %scevgep309
  %bound1312 = icmp ult float* %scevgep306, %scevgep297
  %found.conflict313 = and i1 %bound0311, %bound1312
  %conflict.rdx = or i1 %found.conflict, %found.conflict313
  %98 = or i64 %indvars.iv236.us.unr.ph, 2
  %99 = shl nuw nsw i64 %93, 1
  %100 = add nuw nsw i64 %98, %99
  %101 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub nsw i64 %100, %101
  br i1 %conflict.rdx, label %.preheader174.us.new.preheader372, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %102 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv236.us.unr.ph, %102
  %103 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv240.us, i64 %offset.idx
  %104 = bitcast float* %103 to <8 x float>*
  %wide.vec = load <8 x float>, <8 x float>* %104, align 4, !alias.scope !6
  %105 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv240.us, i64 %offset.idx
  %106 = bitcast float* %105 to <8 x float>*
  %wide.vec315 = load <8 x float>, <8 x float>* %106, align 4, !alias.scope !9
  %107 = fadd <8 x float> %wide.vec, %wide.vec315
  %108 = shufflevector <8 x float> %107, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %109 = add nuw nsw i64 %offset.idx, 1
  %110 = fadd <8 x float> %wide.vec, %wide.vec315
  %111 = shufflevector <8 x float> %110, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %112 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 %109
  %113 = getelementptr float, float* %112, i64 -1
  %114 = bitcast float* %113 to <8 x float>*
  %interleaved.vec = shufflevector <4 x float> %108, <4 x float> %111, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec, <8 x float>* %114, align 4, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %115 = icmp eq i64 %index.next, %n.vec
  br i1 %115, label %middle.block, label %vector.body, !llvm.loop !14

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge200.us, label %.preheader174.us.new.preheader372

.preheader174.us.new.preheader372:                ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader174.us.new.preheader
  %indvars.iv236.us.ph = phi i64 [ %indvars.iv236.us.unr.ph, %vector.memcheck ], [ %indvars.iv236.us.unr.ph, %min.iters.checked ], [ %indvars.iv236.us.unr.ph, %.preheader174.us.new.preheader ], [ %ind.end, %middle.block ]
  br label %.preheader174.us.new

.preheader174.us.new:                             ; preds = %.preheader174.us.new.preheader372, %.preheader174.us.new
  %indvars.iv236.us = phi i64 [ %indvars.iv.next237.us.1, %.preheader174.us.new ], [ %indvars.iv236.us.ph, %.preheader174.us.new.preheader372 ]
  %116 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv240.us, i64 %indvars.iv236.us
  %117 = load float, float* %116, align 4
  %118 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv240.us, i64 %indvars.iv236.us
  %119 = load float, float* %118, align 4
  %120 = fadd float %117, %119
  %121 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 %indvars.iv236.us
  store float %120, float* %121, align 4
  %indvars.iv.next237.us = add nuw nsw i64 %indvars.iv236.us, 1
  %122 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv240.us, i64 %indvars.iv.next237.us
  %123 = load float, float* %122, align 4
  %124 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv240.us, i64 %indvars.iv.next237.us
  %125 = load float, float* %124, align 4
  %126 = fadd float %123, %125
  %127 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 %indvars.iv.next237.us
  store float %126, float* %127, align 4
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

.preheader173:                                    ; preds = %.preheader173.loopexit, %.preheader177, %7, %.preheader175
  br i1 true, label %.preheader172.lr.ph, label %.preheader169

.preheader172.lr.ph:                              ; preds = %.preheader173
  br i1 true, label %.preheader172.us.preheader, label %._crit_edge181

.preheader172.us.preheader:                       ; preds = %.preheader172.lr.ph
  br label %.preheader172.us

.preheader172.us:                                 ; preds = %.preheader172.us.preheader, %._crit_edge196.us
  %indvars.iv232.us = phi i64 [ %indvars.iv.next233.us, %._crit_edge196.us ], [ 0, %.preheader172.us.preheader ]
  br i1 true, label %.prol.loopexit270, label %.prol.preheader269

.prol.preheader269:                               ; preds = %.preheader172.us
  br label %.prol.loopexit270

.prol.loopexit270:                                ; preds = %.prol.preheader269, %.preheader172.us
  %indvars.iv228.us.unr.ph = phi i64 [ 1, %.prol.preheader269 ], [ 0, %.preheader172.us ]
  br i1 false, label %._crit_edge196.us, label %.preheader172.us.new.preheader

.preheader172.us.new.preheader:                   ; preds = %.prol.loopexit270
  br label %.preheader172.us.new

.preheader172.us.new:                             ; preds = %.preheader172.us.new.preheader, %.preheader172.us.new
  %indvars.iv228.us = phi i64 [ %indvars.iv.next229.us.1, %.preheader172.us.new ], [ %indvars.iv228.us.unr.ph, %.preheader172.us.new.preheader ]
  %.0156193.us = phi float [ %149, %.preheader172.us.new ], [ 0.000000e+00, %.preheader172.us.new.preheader ]
  %.1158192.us = phi float [ %147, %.preheader172.us.new ], [ 0.000000e+00, %.preheader172.us.new.preheader ]
  %.1160191.us = phi float [ %136, %.preheader172.us.new ], [ 0.000000e+00, %.preheader172.us.new.preheader ]
  %128 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv228.us, i64 %indvars.iv232.us
  %129 = load float, float* %128, align 4
  %130 = fmul float %20, %129
  %131 = fmul float %31, %.0156193.us
  %132 = fadd float %131, %130
  %133 = fmul float %exp2, %.1158192.us
  %134 = fadd float %133, %132
  %135 = fmul float %.1160191.us, %38
  %136 = fadd float %135, %134
  %137 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv228.us, i64 %indvars.iv232.us
  store float %136, float* %137, align 4
  %138 = load float, float* %128, align 4
  %indvars.iv.next229.us = add nuw nsw i64 %indvars.iv228.us, 1
  %139 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next229.us, i64 %indvars.iv232.us
  %140 = load float, float* %139, align 4
  %141 = fmul float %20, %140
  %142 = fmul float %31, %138
  %143 = fadd float %142, %141
  %144 = fmul float %exp2, %136
  %145 = fadd float %144, %143
  %146 = fmul float %.1158192.us, %38
  %147 = fadd float %146, %145
  %148 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv.next229.us, i64 %indvars.iv232.us
  store float %147, float* %148, align 4
  %149 = load float, float* %139, align 4
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
  %150 = fmul float %32, 0.000000e+00
  %151 = fmul float %35, -0.000000e+00
  %152 = fadd float %151, %150
  %153 = fmul float %exp2, 0.000000e+00
  %154 = fadd float %153, %152
  %155 = fmul float %37, -0.000000e+00
  %156 = fadd float %155, %154
  br label %.preheader170.us

.preheader170.us:                                 ; preds = %.preheader170.us.preheader, %._crit_edge189.us
  %indvars.iv224.us = phi i64 [ %indvars.iv.next225.us, %._crit_edge189.us ], [ 0, %.preheader170.us.preheader ]
  br i1 true, label %.prol.loopexit266, label %.prol.preheader265

.prol.preheader265:                               ; preds = %.preheader170.us
  br label %.prol.loopexit266

.prol.loopexit266:                                ; preds = %.prol.preheader265, %.preheader170.us
  %indvars.iv222.us.in.unr.ph = phi i64 [ 4095, %.prol.preheader265 ], [ 4096, %.preheader170.us ]
  %.1166184.us.unr.ph = phi float [ %156, %.prol.preheader265 ], [ 0.000000e+00, %.preheader170.us ]
  br i1 false, label %._crit_edge189.us, label %.preheader170.us.new.preheader

.preheader170.us.new.preheader:                   ; preds = %.prol.loopexit266
  br label %.preheader170.us.new

.preheader170.us.new:                             ; preds = %.preheader170.us.new.preheader, %.preheader170.us.new
  %indvars.iv222.us.in = phi i64 [ %indvars.iv222.us.1, %.preheader170.us.new ], [ %indvars.iv222.us.in.unr.ph, %.preheader170.us.new.preheader ]
  %.0163186.us = phi float [ %176, %.preheader170.us.new ], [ 0.000000e+00, %.preheader170.us.new.preheader ]
  %.0164185.us = phi float [ %166, %.preheader170.us.new ], [ 0.000000e+00, %.preheader170.us.new.preheader ]
  %.1166184.us = phi float [ %173, %.preheader170.us.new ], [ %.1166184.us.unr.ph, %.preheader170.us.new.preheader ]
  %.1168183.us = phi float [ %163, %.preheader170.us.new ], [ 0.000000e+00, %.preheader170.us.new.preheader ]
  %indvars.iv222.us = add nsw i64 %indvars.iv222.us.in, -1
  %157 = fmul float %32, %.0163186.us
  %158 = fmul float %.0164185.us, %36
  %159 = fadd float %158, %157
  %160 = fmul float %exp2, %.1166184.us
  %161 = fadd float %160, %159
  %162 = fmul float %.1168183.us, %38
  %163 = fadd float %162, %161
  %164 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv222.us, i64 %indvars.iv224.us
  store float %163, float* %164, align 4
  %165 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv222.us, i64 %indvars.iv224.us
  %166 = load float, float* %165, align 4
  %indvars.iv222.us.1 = add nsw i64 %indvars.iv222.us.in, -2
  %167 = fmul float %32, %166
  %168 = fmul float %.0163186.us, %36
  %169 = fadd float %168, %167
  %170 = fmul float %exp2, %163
  %171 = fadd float %170, %169
  %172 = fmul float %.1166184.us, %38
  %173 = fadd float %172, %171
  %174 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv222.us.1, i64 %indvars.iv224.us
  store float %173, float* %174, align 4
  %175 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv222.us.1, i64 %indvars.iv224.us
  %176 = load float, float* %175, align 4
  %177 = icmp sgt i64 %indvars.iv222.us.in, 2
  br i1 %177, label %.preheader170.us.new, label %._crit_edge189.us.loopexit

._crit_edge189.us.loopexit:                       ; preds = %.preheader170.us.new
  br label %._crit_edge189.us

._crit_edge189.us:                                ; preds = %._crit_edge189.us.loopexit, %.prol.loopexit266
  %indvars.iv.next225.us = add nuw nsw i64 %indvars.iv224.us, 1
  %exitcond227.us = icmp eq i64 %indvars.iv.next225.us, 2160
  br i1 %exitcond227.us, label %.preheader169.loopexit, label %.preheader170.us

.preheader169.loopexit:                           ; preds = %._crit_edge189.us
  br label %.preheader169

.preheader169:                                    ; preds = %.preheader169.loopexit, %.preheader173, %.preheader171
  %178 = phi i1 [ false, %.preheader173 ], [ false, %.preheader171 ], [ true, %.preheader169.loopexit ]
  br i1 true, label %.preheader.lr.ph, label %._crit_edge181

.preheader.lr.ph:                                 ; preds = %.preheader169
  br i1 %178, label %.preheader.us.preheader, label %._crit_edge181

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv218.us = phi i64 [ %indvars.iv.next219.us, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep330 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 2
  %scevgep336 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv218.us, i64 2
  %scevgep342 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv218.us, i64 2
  br i1 true, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us
  %indvars.iv.us.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us ]
  br i1 false, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  %179 = sub nsw i64 2158, %indvars.iv.us.unr.ph
  %180 = lshr i64 %179, 1
  %181 = add nuw nsw i64 %180, 1
  br i1 false, label %.preheader.us.new.preheader371, label %min.iters.checked322

min.iters.checked322:                             ; preds = %.preheader.us.new.preheader
  %n.mod.vf323 = and i64 %181, 3
  %n.vec324 = sub nsw i64 %181, %n.mod.vf323
  br i1 false, label %.preheader.us.new.preheader371, label %vector.memcheck353

vector.memcheck353:                               ; preds = %min.iters.checked322
  %scevgep328 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 %indvars.iv.us.unr.ph
  %182 = sub nsw i64 2158, %indvars.iv.us.unr.ph
  %183 = and i64 %182, 2158
  %184 = or i64 %indvars.iv.us.unr.ph, %183
  %scevgep331 = getelementptr float, float* %scevgep330, i64 %184
  %scevgep334 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv218.us, i64 %indvars.iv.us.unr.ph
  %scevgep337 = getelementptr float, float* %scevgep336, i64 %184
  %scevgep340 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv218.us, i64 %indvars.iv.us.unr.ph
  %scevgep343 = getelementptr float, float* %scevgep342, i64 %184
  %bound0345 = icmp ult float* %scevgep328, %scevgep337
  %bound1346 = icmp ult float* %scevgep334, %scevgep331
  %found.conflict347 = and i1 %bound0345, %bound1346
  %bound0348 = icmp ult float* %scevgep328, %scevgep343
  %bound1349 = icmp ult float* %scevgep340, %scevgep331
  %found.conflict350 = and i1 %bound0348, %bound1349
  %conflict.rdx351 = or i1 %found.conflict347, %found.conflict350
  %185 = or i64 %indvars.iv.us.unr.ph, 2
  %186 = shl nuw nsw i64 %180, 1
  %187 = add nuw nsw i64 %185, %186
  %188 = shl nuw nsw i64 %n.mod.vf323, 1
  %ind.end358 = sub nsw i64 %187, %188
  br i1 %conflict.rdx351, label %.preheader.us.new.preheader371, label %vector.body318.preheader

vector.body318.preheader:                         ; preds = %vector.memcheck353
  br label %vector.body318

vector.body318:                                   ; preds = %vector.body318.preheader, %vector.body318
  %index355 = phi i64 [ %index.next356, %vector.body318 ], [ 0, %vector.body318.preheader ]
  %189 = shl i64 %index355, 1
  %offset.idx360 = or i64 %indvars.iv.us.unr.ph, %189
  %190 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv218.us, i64 %offset.idx360
  %191 = bitcast float* %190 to <8 x float>*
  %wide.vec364 = load <8 x float>, <8 x float>* %191, align 4, !alias.scope !16
  %192 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv218.us, i64 %offset.idx360
  %193 = bitcast float* %192 to <8 x float>*
  %wide.vec367 = load <8 x float>, <8 x float>* %193, align 4, !alias.scope !19
  %194 = fadd <8 x float> %wide.vec364, %wide.vec367
  %195 = shufflevector <8 x float> %194, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %196 = add nuw nsw i64 %offset.idx360, 1
  %197 = fadd <8 x float> %wide.vec364, %wide.vec367
  %198 = shufflevector <8 x float> %197, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %199 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 %196
  %200 = getelementptr float, float* %199, i64 -1
  %201 = bitcast float* %200 to <8 x float>*
  %interleaved.vec370 = shufflevector <4 x float> %195, <4 x float> %198, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec370, <8 x float>* %201, align 4, !alias.scope !21, !noalias !23
  %index.next356 = add i64 %index355, 4
  %202 = icmp eq i64 %index.next356, %n.vec324
  br i1 %202, label %middle.block319, label %vector.body318, !llvm.loop !24

middle.block319:                                  ; preds = %vector.body318
  %cmp.n359 = icmp eq i64 %n.mod.vf323, 0
  br i1 %cmp.n359, label %._crit_edge.us, label %.preheader.us.new.preheader371

.preheader.us.new.preheader371:                   ; preds = %middle.block319, %vector.memcheck353, %min.iters.checked322, %.preheader.us.new.preheader
  %indvars.iv.us.ph = phi i64 [ %indvars.iv.us.unr.ph, %vector.memcheck353 ], [ %indvars.iv.us.unr.ph, %min.iters.checked322 ], [ %indvars.iv.us.unr.ph, %.preheader.us.new.preheader ], [ %ind.end358, %middle.block319 ]
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader371, %.preheader.us.new
  %indvars.iv.us = phi i64 [ %indvars.iv.next.us.1, %.preheader.us.new ], [ %indvars.iv.us.ph, %.preheader.us.new.preheader371 ]
  %203 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv218.us, i64 %indvars.iv.us
  %204 = load float, float* %203, align 4
  %205 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv218.us, i64 %indvars.iv.us
  %206 = load float, float* %205, align 4
  %207 = fadd float %204, %206
  %208 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 %indvars.iv.us
  store float %207, float* %208, align 4
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %209 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv218.us, i64 %indvars.iv.next.us
  %210 = load float, float* %209, align 4
  %211 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv218.us, i64 %indvars.iv.next.us
  %212 = load float, float* %211, align 4
  %213 = fadd float %210, %212
  %214 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 %indvars.iv.next.us
  store float %213, float* %214, align 4
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

._crit_edge181:                                   ; preds = %._crit_edge181.loopexit, %.preheader174.lr.ph, %.preheader178.lr.ph, %.preheader176.lr.ph, %.preheader172.lr.ph, %.preheader170.lr.ph, %.preheader.lr.ph, %.preheader169
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [2160 x float]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #6
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
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #6
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
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #6
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
