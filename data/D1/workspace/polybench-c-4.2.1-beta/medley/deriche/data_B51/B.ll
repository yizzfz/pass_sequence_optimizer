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
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %14
  call fastcc void @print_array(i32 4096, i32 2160, [2160 x float]* %9)
  br label %18

; <label>:18:                                     ; preds = %14, %17, %2
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
  br i1 true, label %.preheader.lr.ph, label %.._crit_edge4_crit_edge

.._crit_edge4_crit_edge:                          ; preds = %4
  br label %._crit_edge4

.preheader.lr.ph:                                 ; preds = %4
  br i1 true, label %.preheader.us.preheader, label %.preheader.lr.ph.._crit_edge4_crit_edge

.preheader.lr.ph.._crit_edge4_crit_edge:          ; preds = %.preheader.lr.ph
  br label %._crit_edge4

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next, %._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv, 313
  br i1 false, label %.preheader.us.scalar.ph.preheader_crit_edge, label %min.iters.checked

.preheader.us.scalar.ph.preheader_crit_edge:      ; preds = %.preheader.us
  br label %scalar.ph.preheader

min.iters.checked:                                ; preds = %.preheader.us
  br i1 false, label %min.iters.checked.scalar.ph.preheader_crit_edge, label %vector.ph

min.iters.checked.scalar.ph.preheader_crit_edge:  ; preds = %min.iters.checked
  br label %scalar.ph.preheader

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
  br i1 true, label %._crit_edge.us, label %middle.block.scalar.ph.preheader_crit_edge

middle.block.scalar.ph.preheader_crit_edge:       ; preds = %middle.block
  br label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block.scalar.ph.preheader_crit_edge, %min.iters.checked.scalar.ph.preheader_crit_edge, %.preheader.us.scalar.ph.preheader_crit_edge
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

._crit_edge4:                                     ; preds = %.preheader.lr.ph.._crit_edge4_crit_edge, %.._crit_edge4_crit_edge, %._crit_edge4.loopexit
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
  br i1 true, label %.preheader178.lr.ph, label %..preheader173_crit_edge

..preheader173_crit_edge:                         ; preds = %7
  br label %.preheader173

.preheader178.lr.ph:                              ; preds = %7
  br i1 true, label %.preheader178.us.preheader, label %.preheader178.lr.ph.._crit_edge181_crit_edge

.preheader178.lr.ph.._crit_edge181_crit_edge:     ; preds = %.preheader178.lr.ph
  br label %._crit_edge181

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
  br i1 false, label %.prol.loopexit282.._crit_edge216.us_crit_edge, label %.preheader178.us.new.preheader

.prol.loopexit282.._crit_edge216.us_crit_edge:    ; preds = %.prol.loopexit282
  br label %._crit_edge216.us

.preheader178.us.new.preheader:                   ; preds = %.prol.loopexit282
  br label %.preheader178.us.new

.preheader178.us.new:                             ; preds = %.preheader178.us.new.preheader, %.preheader178.us.new
  %indvars.iv250.us = phi i64 [ %indvars.iv.next251.us.1, %.preheader178.us.new ], [ 0, %.preheader178.us.new.preheader ]
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

._crit_edge216.us:                                ; preds = %.prol.loopexit282.._crit_edge216.us_crit_edge, %._crit_edge216.us.loopexit
  %indvars.iv.next255.us = add nuw nsw i64 %indvars.iv254.us, 1
  %exitcond257.us = icmp eq i64 %indvars.iv.next255.us, 4096
  br i1 %exitcond257.us, label %.preheader177, label %.preheader178.us

.preheader177:                                    ; preds = %._crit_edge216.us
  br i1 true, label %.preheader176.lr.ph, label %.preheader177..preheader173_crit_edge

.preheader177..preheader173_crit_edge:            ; preds = %.preheader177
  br label %.preheader173

.preheader176.lr.ph:                              ; preds = %.preheader177
  br i1 true, label %.preheader176.us.preheader, label %.preheader176.lr.ph.._crit_edge181_crit_edge

.preheader176.lr.ph.._crit_edge181_crit_edge:     ; preds = %.preheader176.lr.ph
  br label %._crit_edge181

.preheader176.us.preheader:                       ; preds = %.preheader176.lr.ph
  br label %.preheader176.us

.preheader176.us:                                 ; preds = %.preheader176.us.preheader, %._crit_edge209.us
  %indvars.iv246.us = phi i64 [ %indvars.iv.next247.us, %._crit_edge209.us ], [ 0, %.preheader176.us.preheader ]
  br i1 true, label %.prol.loopexit278, label %.prol.preheader277

.prol.preheader277:                               ; preds = %.preheader176.us
  br label %.prol.loopexit278

.prol.loopexit278:                                ; preds = %.prol.preheader277, %.preheader176.us
  br i1 false, label %.prol.loopexit278.._crit_edge209.us_crit_edge, label %.preheader176.us.new.preheader

.prol.loopexit278.._crit_edge209.us_crit_edge:    ; preds = %.prol.loopexit278
  br label %._crit_edge209.us

.preheader176.us.new.preheader:                   ; preds = %.prol.loopexit278
  br label %.preheader176.us.new

.preheader176.us.new:                             ; preds = %.preheader176.us.new.preheader, %.preheader176.us.new
  %indvars.iv244.us.in = phi i64 [ %indvars.iv244.us.1, %.preheader176.us.new ], [ 2160, %.preheader176.us.new.preheader ]
  %.0161206.us = phi float [ %83, %.preheader176.us.new ], [ 0.000000e+00, %.preheader176.us.new.preheader ]
  %.0162205.us = phi float [ %73, %.preheader176.us.new ], [ 0.000000e+00, %.preheader176.us.new.preheader ]
  %.0165204.us = phi float [ %80, %.preheader176.us.new ], [ 0.000000e+00, %.preheader176.us.new.preheader ]
  %.0167203.us = phi float [ %70, %.preheader176.us.new ], [ 0.000000e+00, %.preheader176.us.new.preheader ]
  %indvars.iv244.us = add nsw i64 %indvars.iv244.us.in, -1
  %64 = fmul float %32, %.0161206.us
  %65 = fmul float %.0162205.us, %36
  %66 = fadd float %65, %64
  %67 = fmul float %exp2, %.0165204.us
  %68 = fadd float %67, %66
  %69 = fmul float %.0167203.us, %38
  %70 = fadd float %69, %68
  %71 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv246.us, i64 %indvars.iv244.us
  store float %70, float* %71, align 4
  %72 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv246.us, i64 %indvars.iv244.us
  %73 = load float, float* %72, align 4
  %indvars.iv244.us.1 = add nsw i64 %indvars.iv244.us.in, -2
  %74 = fmul float %32, %73
  %75 = fmul float %.0161206.us, %36
  %76 = fadd float %75, %74
  %77 = fmul float %exp2, %70
  %78 = fadd float %77, %76
  %79 = fmul float %.0165204.us, %38
  %80 = fadd float %79, %78
  %81 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv246.us, i64 %indvars.iv244.us.1
  store float %80, float* %81, align 4
  %82 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv246.us, i64 %indvars.iv244.us.1
  %83 = load float, float* %82, align 4
  %84 = icmp sgt i64 %indvars.iv244.us.in, 2
  br i1 %84, label %.preheader176.us.new, label %._crit_edge209.us.loopexit

._crit_edge209.us.loopexit:                       ; preds = %.preheader176.us.new
  br label %._crit_edge209.us

._crit_edge209.us:                                ; preds = %.prol.loopexit278.._crit_edge209.us_crit_edge, %._crit_edge209.us.loopexit
  %indvars.iv.next247.us = add nuw nsw i64 %indvars.iv246.us, 1
  %exitcond249.us = icmp eq i64 %indvars.iv.next247.us, 4096
  br i1 %exitcond249.us, label %.preheader175, label %.preheader176.us

.preheader175:                                    ; preds = %._crit_edge209.us
  br i1 true, label %.preheader174.lr.ph, label %.preheader175..preheader173_crit_edge

.preheader175..preheader173_crit_edge:            ; preds = %.preheader175
  br label %.preheader173

.preheader174.lr.ph:                              ; preds = %.preheader175
  br i1 true, label %.preheader174.us.preheader, label %.preheader174.lr.ph.._crit_edge181_crit_edge

.preheader174.lr.ph.._crit_edge181_crit_edge:     ; preds = %.preheader174.lr.ph
  br label %._crit_edge181

.preheader174.us.preheader:                       ; preds = %.preheader174.lr.ph
  br label %.preheader174.us

.preheader174.us:                                 ; preds = %.preheader174.us.preheader, %._crit_edge200.us
  %indvars.iv240.us = phi i64 [ %indvars.iv.next241.us, %._crit_edge200.us ], [ 0, %.preheader174.us.preheader ]
  %scevgep294 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 2
  %scevgep300 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv240.us, i64 2
  %scevgep306 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv240.us, i64 2
  br i1 true, label %.prol.loopexit274, label %.prol.preheader273

.prol.preheader273:                               ; preds = %.preheader174.us
  br label %.prol.loopexit274

.prol.loopexit274:                                ; preds = %.prol.preheader273, %.preheader174.us
  br i1 false, label %.prol.loopexit274.._crit_edge200.us_crit_edge, label %.preheader174.us.new.preheader

.prol.loopexit274.._crit_edge200.us_crit_edge:    ; preds = %.prol.loopexit274
  br label %._crit_edge200.us

.preheader174.us.new.preheader:                   ; preds = %.prol.loopexit274
  br i1 false, label %.preheader174.us.new.preheader..preheader174.us.new.preheader370_crit_edge, label %min.iters.checked

.preheader174.us.new.preheader..preheader174.us.new.preheader370_crit_edge: ; preds = %.preheader174.us.new.preheader
  br label %.preheader174.us.new.preheader370

min.iters.checked:                                ; preds = %.preheader174.us.new.preheader
  br i1 false, label %min.iters.checked..preheader174.us.new.preheader370_crit_edge, label %vector.memcheck

min.iters.checked..preheader174.us.new.preheader370_crit_edge: ; preds = %min.iters.checked
  br label %.preheader174.us.new.preheader370

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep292 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 0
  %scevgep295 = getelementptr float, float* %scevgep294, i64 2158
  %scevgep298 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv240.us, i64 0
  %scevgep301 = getelementptr float, float* %scevgep300, i64 2158
  %scevgep304 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv240.us, i64 0
  %scevgep307 = getelementptr float, float* %scevgep306, i64 2158
  %bound0 = icmp ult float* %scevgep292, %scevgep301
  %bound1 = icmp ult float* %scevgep298, %scevgep295
  %found.conflict = and i1 %bound0, %bound1
  %bound0309 = icmp ult float* %scevgep292, %scevgep307
  %bound1310 = icmp ult float* %scevgep304, %scevgep295
  %found.conflict311 = and i1 %bound0309, %bound1310
  %conflict.rdx = or i1 %found.conflict, %found.conflict311
  br i1 %conflict.rdx, label %.preheader174.us.new.preheader370, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %85 = shl i64 %index, 1
  %86 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv240.us, i64 %85
  %87 = bitcast float* %86 to <8 x float>*
  %wide.vec = load <8 x float>, <8 x float>* %87, align 4, !alias.scope !6
  %88 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv240.us, i64 %85
  %89 = bitcast float* %88 to <8 x float>*
  %wide.vec313 = load <8 x float>, <8 x float>* %89, align 4, !alias.scope !9
  %90 = fadd <8 x float> %wide.vec, %wide.vec313
  %91 = shufflevector <8 x float> %90, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %92 = add nuw nsw i64 %85, 1
  %93 = shufflevector <8 x float> %90, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %94 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 %92
  %95 = getelementptr float, float* %94, i64 -1
  %96 = bitcast float* %95 to <8 x float>*
  %interleaved.vec = shufflevector <4 x float> %91, <4 x float> %93, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec, <8 x float>* %96, align 4, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %97 = icmp eq i64 %index.next, 1080
  br i1 %97, label %middle.block, label %vector.body, !llvm.loop !14

middle.block:                                     ; preds = %vector.body
  br i1 true, label %._crit_edge200.us, label %middle.block..preheader174.us.new.preheader370_crit_edge

middle.block..preheader174.us.new.preheader370_crit_edge: ; preds = %middle.block
  br label %.preheader174.us.new.preheader370

.preheader174.us.new.preheader370:                ; preds = %middle.block..preheader174.us.new.preheader370_crit_edge, %min.iters.checked..preheader174.us.new.preheader370_crit_edge, %.preheader174.us.new.preheader..preheader174.us.new.preheader370_crit_edge, %vector.memcheck
  br label %.preheader174.us.new

.preheader174.us.new:                             ; preds = %.preheader174.us.new.preheader370, %.preheader174.us.new
  %indvars.iv236.us = phi i64 [ %indvars.iv.next237.us.1, %.preheader174.us.new ], [ 0, %.preheader174.us.new.preheader370 ]
  %98 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv240.us, i64 %indvars.iv236.us
  %99 = load float, float* %98, align 4
  %100 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv240.us, i64 %indvars.iv236.us
  %101 = load float, float* %100, align 4
  %102 = fadd float %99, %101
  %103 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 %indvars.iv236.us
  store float %102, float* %103, align 4
  %indvars.iv.next237.us = add nuw nsw i64 %indvars.iv236.us, 1
  %104 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv240.us, i64 %indvars.iv.next237.us
  %105 = load float, float* %104, align 4
  %106 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv240.us, i64 %indvars.iv.next237.us
  %107 = load float, float* %106, align 4
  %108 = fadd float %105, %107
  %109 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 %indvars.iv.next237.us
  store float %108, float* %109, align 4
  %indvars.iv.next237.us.1 = add nuw nsw i64 %indvars.iv236.us, 2
  %exitcond239.us.1 = icmp eq i64 %indvars.iv.next237.us.1, 2160
  br i1 %exitcond239.us.1, label %._crit_edge200.us.loopexit, label %.preheader174.us.new, !llvm.loop !15

._crit_edge200.us.loopexit:                       ; preds = %.preheader174.us.new
  br label %._crit_edge200.us

._crit_edge200.us:                                ; preds = %.prol.loopexit274.._crit_edge200.us_crit_edge, %._crit_edge200.us.loopexit, %middle.block
  %indvars.iv.next241.us = add nuw nsw i64 %indvars.iv240.us, 1
  %exitcond243.us = icmp eq i64 %indvars.iv.next241.us, 4096
  br i1 %exitcond243.us, label %.preheader173.loopexit, label %.preheader174.us

.preheader173.loopexit:                           ; preds = %._crit_edge200.us
  br label %.preheader173

.preheader173:                                    ; preds = %.preheader175..preheader173_crit_edge, %.preheader177..preheader173_crit_edge, %..preheader173_crit_edge, %.preheader173.loopexit
  br i1 true, label %.preheader172.lr.ph, label %.preheader173..preheader169_crit_edge

.preheader173..preheader169_crit_edge:            ; preds = %.preheader173
  br label %.preheader169

.preheader172.lr.ph:                              ; preds = %.preheader173
  br i1 true, label %.preheader172.us.preheader, label %.preheader172.lr.ph.._crit_edge181_crit_edge

.preheader172.lr.ph.._crit_edge181_crit_edge:     ; preds = %.preheader172.lr.ph
  br label %._crit_edge181

.preheader172.us.preheader:                       ; preds = %.preheader172.lr.ph
  br label %.preheader172.us

.preheader172.us:                                 ; preds = %.preheader172.us.preheader, %._crit_edge196.us
  %indvars.iv232.us = phi i64 [ %indvars.iv.next233.us, %._crit_edge196.us ], [ 0, %.preheader172.us.preheader ]
  br i1 true, label %.prol.loopexit270, label %.prol.preheader269

.prol.preheader269:                               ; preds = %.preheader172.us
  br label %.prol.loopexit270

.prol.loopexit270:                                ; preds = %.prol.preheader269, %.preheader172.us
  br i1 false, label %.prol.loopexit270.._crit_edge196.us_crit_edge, label %.preheader172.us.new.preheader

.prol.loopexit270.._crit_edge196.us_crit_edge:    ; preds = %.prol.loopexit270
  br label %._crit_edge196.us

.preheader172.us.new.preheader:                   ; preds = %.prol.loopexit270
  br label %.preheader172.us.new

.preheader172.us.new:                             ; preds = %.preheader172.us.new.preheader, %.preheader172.us.new
  %indvars.iv228.us = phi i64 [ %indvars.iv.next229.us.1, %.preheader172.us.new ], [ 0, %.preheader172.us.new.preheader ]
  %.0156193.us = phi float [ %131, %.preheader172.us.new ], [ 0.000000e+00, %.preheader172.us.new.preheader ]
  %.1158192.us = phi float [ %129, %.preheader172.us.new ], [ 0.000000e+00, %.preheader172.us.new.preheader ]
  %.1160191.us = phi float [ %118, %.preheader172.us.new ], [ 0.000000e+00, %.preheader172.us.new.preheader ]
  %110 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv228.us, i64 %indvars.iv232.us
  %111 = load float, float* %110, align 4
  %112 = fmul float %20, %111
  %113 = fmul float %31, %.0156193.us
  %114 = fadd float %113, %112
  %115 = fmul float %exp2, %.1158192.us
  %116 = fadd float %115, %114
  %117 = fmul float %.1160191.us, %38
  %118 = fadd float %117, %116
  %119 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv228.us, i64 %indvars.iv232.us
  store float %118, float* %119, align 4
  %120 = load float, float* %110, align 4
  %indvars.iv.next229.us = add nuw nsw i64 %indvars.iv228.us, 1
  %121 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next229.us, i64 %indvars.iv232.us
  %122 = load float, float* %121, align 4
  %123 = fmul float %20, %122
  %124 = fmul float %31, %120
  %125 = fadd float %124, %123
  %126 = fmul float %exp2, %118
  %127 = fadd float %126, %125
  %128 = fmul float %.1158192.us, %38
  %129 = fadd float %128, %127
  %130 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv.next229.us, i64 %indvars.iv232.us
  store float %129, float* %130, align 4
  %131 = load float, float* %121, align 4
  %indvars.iv.next229.us.1 = add nuw nsw i64 %indvars.iv228.us, 2
  %exitcond231.us.1 = icmp eq i64 %indvars.iv.next229.us.1, 4096
  br i1 %exitcond231.us.1, label %._crit_edge196.us.loopexit, label %.preheader172.us.new

._crit_edge196.us.loopexit:                       ; preds = %.preheader172.us.new
  br label %._crit_edge196.us

._crit_edge196.us:                                ; preds = %.prol.loopexit270.._crit_edge196.us_crit_edge, %._crit_edge196.us.loopexit
  %indvars.iv.next233.us = add nuw nsw i64 %indvars.iv232.us, 1
  %exitcond235.us = icmp eq i64 %indvars.iv.next233.us, 2160
  br i1 %exitcond235.us, label %.preheader171, label %.preheader172.us

.preheader171:                                    ; preds = %._crit_edge196.us
  br i1 true, label %.preheader170.lr.ph, label %.preheader171..preheader169_crit_edge

.preheader171..preheader169_crit_edge:            ; preds = %.preheader171
  br label %.preheader169

.preheader170.lr.ph:                              ; preds = %.preheader171
  br i1 true, label %.preheader170.us.preheader, label %.preheader170.lr.ph.._crit_edge181_crit_edge

.preheader170.lr.ph.._crit_edge181_crit_edge:     ; preds = %.preheader170.lr.ph
  br label %._crit_edge181

.preheader170.us.preheader:                       ; preds = %.preheader170.lr.ph
  br label %.preheader170.us

.preheader170.us:                                 ; preds = %.preheader170.us.preheader, %._crit_edge189.us
  %indvars.iv224.us = phi i64 [ %indvars.iv.next225.us, %._crit_edge189.us ], [ 0, %.preheader170.us.preheader ]
  br i1 true, label %.prol.loopexit266, label %.prol.preheader265

.prol.preheader265:                               ; preds = %.preheader170.us
  br label %.prol.loopexit266

.prol.loopexit266:                                ; preds = %.prol.preheader265, %.preheader170.us
  br i1 false, label %.prol.loopexit266.._crit_edge189.us_crit_edge, label %.preheader170.us.new.preheader

.prol.loopexit266.._crit_edge189.us_crit_edge:    ; preds = %.prol.loopexit266
  br label %._crit_edge189.us

.preheader170.us.new.preheader:                   ; preds = %.prol.loopexit266
  br label %.preheader170.us.new

.preheader170.us.new:                             ; preds = %.preheader170.us.new.preheader, %.preheader170.us.new
  %indvars.iv222.us.in = phi i64 [ %indvars.iv222.us.1, %.preheader170.us.new ], [ 4096, %.preheader170.us.new.preheader ]
  %.0163186.us = phi float [ %151, %.preheader170.us.new ], [ 0.000000e+00, %.preheader170.us.new.preheader ]
  %.0164185.us = phi float [ %141, %.preheader170.us.new ], [ 0.000000e+00, %.preheader170.us.new.preheader ]
  %.1166184.us = phi float [ %148, %.preheader170.us.new ], [ 0.000000e+00, %.preheader170.us.new.preheader ]
  %.1168183.us = phi float [ %138, %.preheader170.us.new ], [ 0.000000e+00, %.preheader170.us.new.preheader ]
  %indvars.iv222.us = add nsw i64 %indvars.iv222.us.in, -1
  %132 = fmul float %32, %.0163186.us
  %133 = fmul float %.0164185.us, %36
  %134 = fadd float %133, %132
  %135 = fmul float %exp2, %.1166184.us
  %136 = fadd float %135, %134
  %137 = fmul float %.1168183.us, %38
  %138 = fadd float %137, %136
  %139 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv222.us, i64 %indvars.iv224.us
  store float %138, float* %139, align 4
  %140 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv222.us, i64 %indvars.iv224.us
  %141 = load float, float* %140, align 4
  %indvars.iv222.us.1 = add nsw i64 %indvars.iv222.us.in, -2
  %142 = fmul float %32, %141
  %143 = fmul float %.0163186.us, %36
  %144 = fadd float %143, %142
  %145 = fmul float %exp2, %138
  %146 = fadd float %145, %144
  %147 = fmul float %.1166184.us, %38
  %148 = fadd float %147, %146
  %149 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv222.us.1, i64 %indvars.iv224.us
  store float %148, float* %149, align 4
  %150 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv222.us.1, i64 %indvars.iv224.us
  %151 = load float, float* %150, align 4
  %152 = icmp sgt i64 %indvars.iv222.us.in, 2
  br i1 %152, label %.preheader170.us.new, label %._crit_edge189.us.loopexit

._crit_edge189.us.loopexit:                       ; preds = %.preheader170.us.new
  br label %._crit_edge189.us

._crit_edge189.us:                                ; preds = %.prol.loopexit266.._crit_edge189.us_crit_edge, %._crit_edge189.us.loopexit
  %indvars.iv.next225.us = add nuw nsw i64 %indvars.iv224.us, 1
  %exitcond227.us = icmp eq i64 %indvars.iv.next225.us, 2160
  br i1 %exitcond227.us, label %.preheader169.loopexit, label %.preheader170.us

.preheader169.loopexit:                           ; preds = %._crit_edge189.us
  br label %.preheader169

.preheader169:                                    ; preds = %.preheader171..preheader169_crit_edge, %.preheader173..preheader169_crit_edge, %.preheader169.loopexit
  br i1 true, label %.preheader.lr.ph, label %.preheader169.._crit_edge181_crit_edge

.preheader169.._crit_edge181_crit_edge:           ; preds = %.preheader169
  br label %._crit_edge181

.preheader.lr.ph:                                 ; preds = %.preheader169
  br i1 true, label %.preheader.us.preheader, label %.preheader.lr.ph.._crit_edge181_crit_edge

.preheader.lr.ph.._crit_edge181_crit_edge:        ; preds = %.preheader.lr.ph
  br label %._crit_edge181

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv218.us = phi i64 [ %indvars.iv.next219.us, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep328 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 2
  %scevgep334 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv218.us, i64 2
  %scevgep340 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv218.us, i64 2
  br i1 true, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us
  br i1 false, label %.prol.loopexit.._crit_edge.us_crit_edge, label %.preheader.us.new.preheader

.prol.loopexit.._crit_edge.us_crit_edge:          ; preds = %.prol.loopexit
  br label %._crit_edge.us

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  br i1 false, label %.preheader.us.new.preheader..preheader.us.new.preheader369_crit_edge, label %min.iters.checked320

.preheader.us.new.preheader..preheader.us.new.preheader369_crit_edge: ; preds = %.preheader.us.new.preheader
  br label %.preheader.us.new.preheader369

min.iters.checked320:                             ; preds = %.preheader.us.new.preheader
  br i1 false, label %min.iters.checked320..preheader.us.new.preheader369_crit_edge, label %vector.memcheck351

min.iters.checked320..preheader.us.new.preheader369_crit_edge: ; preds = %min.iters.checked320
  br label %.preheader.us.new.preheader369

vector.memcheck351:                               ; preds = %min.iters.checked320
  %scevgep326 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 0
  %scevgep329 = getelementptr float, float* %scevgep328, i64 2158
  %scevgep332 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv218.us, i64 0
  %scevgep335 = getelementptr float, float* %scevgep334, i64 2158
  %scevgep338 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv218.us, i64 0
  %scevgep341 = getelementptr float, float* %scevgep340, i64 2158
  %bound0343 = icmp ult float* %scevgep326, %scevgep335
  %bound1344 = icmp ult float* %scevgep332, %scevgep329
  %found.conflict345 = and i1 %bound0343, %bound1344
  %bound0346 = icmp ult float* %scevgep326, %scevgep341
  %bound1347 = icmp ult float* %scevgep338, %scevgep329
  %found.conflict348 = and i1 %bound0346, %bound1347
  %conflict.rdx349 = or i1 %found.conflict345, %found.conflict348
  br i1 %conflict.rdx349, label %.preheader.us.new.preheader369, label %vector.body316.preheader

vector.body316.preheader:                         ; preds = %vector.memcheck351
  br label %vector.body316

vector.body316:                                   ; preds = %vector.body316.preheader, %vector.body316
  %index353 = phi i64 [ %index.next354, %vector.body316 ], [ 0, %vector.body316.preheader ]
  %153 = shl i64 %index353, 1
  %154 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv218.us, i64 %153
  %155 = bitcast float* %154 to <8 x float>*
  %wide.vec362 = load <8 x float>, <8 x float>* %155, align 4, !alias.scope !16
  %156 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv218.us, i64 %153
  %157 = bitcast float* %156 to <8 x float>*
  %wide.vec365 = load <8 x float>, <8 x float>* %157, align 4, !alias.scope !19
  %158 = fadd <8 x float> %wide.vec362, %wide.vec365
  %159 = shufflevector <8 x float> %158, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %160 = add nuw nsw i64 %153, 1
  %161 = shufflevector <8 x float> %158, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %162 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 %160
  %163 = getelementptr float, float* %162, i64 -1
  %164 = bitcast float* %163 to <8 x float>*
  %interleaved.vec368 = shufflevector <4 x float> %159, <4 x float> %161, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec368, <8 x float>* %164, align 4, !alias.scope !21, !noalias !23
  %index.next354 = add i64 %index353, 4
  %165 = icmp eq i64 %index.next354, 1080
  br i1 %165, label %middle.block317, label %vector.body316, !llvm.loop !24

middle.block317:                                  ; preds = %vector.body316
  br i1 true, label %._crit_edge.us, label %middle.block317..preheader.us.new.preheader369_crit_edge

middle.block317..preheader.us.new.preheader369_crit_edge: ; preds = %middle.block317
  br label %.preheader.us.new.preheader369

.preheader.us.new.preheader369:                   ; preds = %middle.block317..preheader.us.new.preheader369_crit_edge, %min.iters.checked320..preheader.us.new.preheader369_crit_edge, %.preheader.us.new.preheader..preheader.us.new.preheader369_crit_edge, %vector.memcheck351
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader369, %.preheader.us.new
  %indvars.iv.us = phi i64 [ %indvars.iv.next.us.1, %.preheader.us.new ], [ 0, %.preheader.us.new.preheader369 ]
  %166 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv218.us, i64 %indvars.iv.us
  %167 = load float, float* %166, align 4
  %168 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv218.us, i64 %indvars.iv.us
  %169 = load float, float* %168, align 4
  %170 = fadd float %167, %169
  %171 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 %indvars.iv.us
  store float %170, float* %171, align 4
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %172 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv218.us, i64 %indvars.iv.next.us
  %173 = load float, float* %172, align 4
  %174 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv218.us, i64 %indvars.iv.next.us
  %175 = load float, float* %174, align 4
  %176 = fadd float %173, %175
  %177 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 %indvars.iv.next.us
  store float %176, float* %177, align 4
  %indvars.iv.next.us.1 = add nuw nsw i64 %indvars.iv.us, 2
  %exitcond.us.1 = icmp eq i64 %indvars.iv.next.us.1, 2160
  br i1 %exitcond.us.1, label %._crit_edge.us.loopexit, label %.preheader.us.new, !llvm.loop !25

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.prol.loopexit.._crit_edge.us_crit_edge, %._crit_edge.us.loopexit, %middle.block317
  %indvars.iv.next219.us = add nuw nsw i64 %indvars.iv218.us, 1
  %exitcond221.us = icmp eq i64 %indvars.iv.next219.us, 4096
  br i1 %exitcond221.us, label %._crit_edge181.loopexit, label %.preheader.us

._crit_edge181.loopexit:                          ; preds = %._crit_edge.us
  br label %._crit_edge181

._crit_edge181:                                   ; preds = %.preheader.lr.ph.._crit_edge181_crit_edge, %.preheader169.._crit_edge181_crit_edge, %.preheader170.lr.ph.._crit_edge181_crit_edge, %.preheader172.lr.ph.._crit_edge181_crit_edge, %.preheader174.lr.ph.._crit_edge181_crit_edge, %.preheader176.lr.ph.._crit_edge181_crit_edge, %.preheader178.lr.ph.._crit_edge181_crit_edge, %._crit_edge181.loopexit
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
  br i1 true, label %.preheader.lr.ph, label %.._crit_edge15_crit_edge

.._crit_edge15_crit_edge:                         ; preds = %3
  br label %._crit_edge15

.preheader.lr.ph:                                 ; preds = %3
  br i1 true, label %.preheader.us.preheader, label %.preheader.lr.ph.._crit_edge15_crit_edge

.preheader.lr.ph.._crit_edge15_crit_edge:         ; preds = %.preheader.lr.ph
  br label %._crit_edge15

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next, %._crit_edge.us ]
  %8 = mul nsw i64 %indvars.iv, 2160
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
  %exitcond19 = icmp eq i64 %indvars.iv.next, 4096
  br i1 %exitcond19, label %._crit_edge15.loopexit, label %.preheader.us

._crit_edge15.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %.preheader.lr.ph.._crit_edge15_crit_edge, %.._crit_edge15_crit_edge, %._crit_edge15.loopexit
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
