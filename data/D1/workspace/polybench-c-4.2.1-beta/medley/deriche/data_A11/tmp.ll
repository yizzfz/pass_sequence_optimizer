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
  %4 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %5 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %6 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %7 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %8 = bitcast i8* %4 to [2160 x float]*
  %9 = bitcast i8* %5 to [2160 x float]*
  call void @init_array(i32 4096, i32 2160, float* nonnull %3, [2160 x float]* %8, [2160 x float]* %9)
  call void (...) @polybench_timer_start() #5
  %10 = load float, float* %3, align 4
  %11 = bitcast i8* %6 to [2160 x float]*
  %12 = bitcast i8* %7 to [2160 x float]*
  call void @kernel_deriche(i32 4096, i32 2160, float %10, [2160 x float]* %8, [2160 x float]* %9, [2160 x float]* %11, [2160 x float]* %12)
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
  call void @print_array(i32 4096, i32 2160, [2160 x float]* %9)
  br label %18

; <label>:18:                                     ; preds = %14, %17, %2
  call void @free(i8* %4) #5
  call void @free(i8* %5) #5
  call void @free(i8* %6) #5
  call void @free(i8* %7) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, float* nocapture, [2160 x float]* nocapture, [2160 x float]* nocapture readnone) #2 {
  store float 2.500000e-01, float* %2, align 4
  br i1 true, label %.preheader.lr.ph, label %._crit_edge15

.preheader.lr.ph:                                 ; preds = %5
  br i1 true, label %.preheader.lr.ph.split.us, label %._crit_edge15

.preheader.lr.ph.split.us:                        ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph.split.us
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %._crit_edge.us ], [ 0, %.preheader.lr.ph.split.us ]
  %6 = mul nuw nsw i64 %indvars.iv16, 313
  br i1 false, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 false, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %6, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %7 = mul nuw nsw <4 x i64> %vec.ind, <i64 991, i64 991, i64 991, i64 991>
  %8 = add nsw <4 x i64> %7, %broadcast.splat
  %9 = trunc <4 x i64> %8 to <4 x i32>
  %10 = srem <4 x i32> %9, <i32 65536, i32 65536, i32 65536, i32 65536>
  %11 = sitofp <4 x i32> %10 to <4 x float>
  %12 = fdiv <4 x float> %11, <float 6.553500e+04, float 6.553500e+04, float 6.553500e+04, float 6.553500e+04>
  %13 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv16, i64 %index
  %14 = bitcast float* %13 to <4 x float>*
  store <4 x float> %12, <4 x float>* %14, align 4
  %index.next = add i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %15 = icmp eq i64 %index.next, 2160
  br i1 %15, label %middle.block, label %vector.body, !llvm.loop !1

middle.block:                                     ; preds = %vector.body
  br i1 true, label %._crit_edge.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %min.iters.checked, %.preheader.us
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  br i1 true, label %._crit_edge.us.loopexit, label %scalar.ph, !llvm.loop !4

._crit_edge.us.loopexit:                          ; preds = %scalar.ph
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next17, 4096
  br i1 %exitcond19, label %._crit_edge15.loopexit, label %.preheader.us

._crit_edge15.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %.preheader.lr.ph, %5
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_deriche(i32, i32, float, [2160 x float]* nocapture readonly, [2160 x float]* nocapture, [2160 x float]* nocapture, [2160 x float]* nocapture) #0 {
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
  %23 = fadd float %2, -1.000000e+00
  %24 = fmul float %23, %22
  %25 = tail call float @expf(float %8) #5
  %26 = fmul float %25, %20
  %27 = fadd float %2, 1.000000e+00
  %28 = fmul float %27, %26
  %29 = fmul float %2, -2.000000e+00
  %30 = tail call float @expf(float %29) #5
  %31 = fmul float %20, %30
  %32 = fsub float -0.000000e+00, %31
  %exp2 = tail call float @llvm.exp2.f32(float %8)
  %33 = tail call float @expf(float %29) #5
  %34 = fsub float -0.000000e+00, %33
  br i1 true, label %.preheader178.lr.ph, label %.preheader173

.preheader178.lr.ph:                              ; preds = %7
  br i1 true, label %.preheader178.us.preheader, label %._crit_edge181

.preheader178.us.preheader:                       ; preds = %.preheader178.lr.ph
  br label %.preheader178.us

.preheader178.us:                                 ; preds = %.preheader178.us.preheader, %._crit_edge216.us
  %indvars.iv254.us = phi i64 [ %indvars.iv.next255.us, %._crit_edge216.us ], [ 0, %.preheader178.us.preheader ]
  br i1 true, label %.prol.loopexit281, label %.prol.preheader280

.prol.preheader280:                               ; preds = %.preheader178.us
  br label %.prol.loopexit281

.prol.loopexit281:                                ; preds = %.prol.preheader280, %.preheader178.us
  %indvars.iv250.us.unr.ph = phi i64 [ 1, %.prol.preheader280 ], [ 0, %.preheader178.us ]
  br i1 false, label %._crit_edge216.us, label %.preheader178.us.new.preheader

.preheader178.us.new.preheader:                   ; preds = %.prol.loopexit281
  br label %.preheader178.us.new

.preheader178.us.new:                             ; preds = %.preheader178.us.new.preheader, %.preheader178.us.new
  %indvars.iv250.us = phi i64 [ %indvars.iv.next251.us.1, %.preheader178.us.new ], [ %indvars.iv250.us.unr.ph, %.preheader178.us.new.preheader ]
  %.0155213.us = phi float [ %56, %.preheader178.us.new ], [ 0.000000e+00, %.preheader178.us.new.preheader ]
  %.0157212.us = phi float [ %54, %.preheader178.us.new ], [ 0.000000e+00, %.preheader178.us.new.preheader ]
  %.0159211.us = phi float [ %43, %.preheader178.us.new ], [ 0.000000e+00, %.preheader178.us.new.preheader ]
  %35 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv254.us, i64 %indvars.iv250.us
  %36 = load float, float* %35, align 4
  %37 = fmul float %20, %36
  %38 = fmul float %24, %.0155213.us
  %39 = fadd float %38, %37
  %40 = fmul float %exp2, %.0157212.us
  %41 = fadd float %40, %39
  %42 = fmul float %.0159211.us, %34
  %43 = fadd float %42, %41
  %44 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv254.us, i64 %indvars.iv250.us
  store float %43, float* %44, align 4
  %45 = load float, float* %35, align 4
  %indvars.iv.next251.us = add nuw nsw i64 %indvars.iv250.us, 1
  %46 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv254.us, i64 %indvars.iv.next251.us
  %47 = load float, float* %46, align 4
  %48 = fmul float %20, %47
  %49 = fmul float %24, %45
  %50 = fadd float %49, %48
  %51 = fmul float %exp2, %43
  %52 = fadd float %51, %50
  %53 = fmul float %.0157212.us, %34
  %54 = fadd float %53, %52
  %55 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv254.us, i64 %indvars.iv.next251.us
  store float %54, float* %55, align 4
  %56 = load float, float* %46, align 4
  %indvars.iv.next251.us.1 = add nuw nsw i64 %indvars.iv250.us, 2
  %exitcond253.us.1 = icmp eq i64 %indvars.iv.next251.us.1, 2160
  br i1 %exitcond253.us.1, label %._crit_edge216.us.loopexit, label %.preheader178.us.new

._crit_edge216.us.loopexit:                       ; preds = %.preheader178.us.new
  br label %._crit_edge216.us

._crit_edge216.us:                                ; preds = %._crit_edge216.us.loopexit, %.prol.loopexit281
  %indvars.iv.next255.us = add nuw nsw i64 %indvars.iv254.us, 1
  %exitcond257.us = icmp eq i64 %indvars.iv.next255.us, 4096
  br i1 %exitcond257.us, label %.preheader177, label %.preheader178.us

.preheader177:                                    ; preds = %._crit_edge216.us
  br i1 true, label %.preheader176.lr.ph, label %.preheader173

.preheader176.lr.ph:                              ; preds = %.preheader177
  br i1 true, label %.preheader176.us.preheader, label %._crit_edge181

.preheader176.us.preheader:                       ; preds = %.preheader176.lr.ph
  %57 = fmul float %28, 0.000000e+00
  %58 = fmul float %31, -0.000000e+00
  %59 = fadd float %58, %57
  %60 = fmul float %exp2, 0.000000e+00
  %61 = fadd float %60, %59
  %62 = fmul float %33, -0.000000e+00
  %63 = fadd float %62, %61
  br label %.preheader176.us

.preheader176.us:                                 ; preds = %.preheader176.us.preheader, %._crit_edge209.us
  %indvars.iv246.us = phi i64 [ %indvars.iv.next247.us, %._crit_edge209.us ], [ 0, %.preheader176.us.preheader ]
  br i1 true, label %.prol.loopexit277, label %.prol.preheader276

.prol.preheader276:                               ; preds = %.preheader176.us
  br label %.prol.loopexit277

.prol.loopexit277:                                ; preds = %.prol.preheader276, %.preheader176.us
  %indvars.iv244.us.in.unr.ph = phi i64 [ 2159, %.prol.preheader276 ], [ 2160, %.preheader176.us ]
  %.0165204.us.unr.ph = phi float [ %63, %.prol.preheader276 ], [ 0.000000e+00, %.preheader176.us ]
  br i1 false, label %._crit_edge209.us, label %.preheader176.us.new.preheader

.preheader176.us.new.preheader:                   ; preds = %.prol.loopexit277
  br label %.preheader176.us.new

.preheader176.us.new:                             ; preds = %.preheader176.us.new.preheader, %.preheader176.us.new
  %indvars.iv244.us.in = phi i64 [ %indvars.iv244.us.1, %.preheader176.us.new ], [ %indvars.iv244.us.in.unr.ph, %.preheader176.us.new.preheader ]
  %.0161206.us = phi float [ %83, %.preheader176.us.new ], [ 0.000000e+00, %.preheader176.us.new.preheader ]
  %.0162205.us = phi float [ %73, %.preheader176.us.new ], [ 0.000000e+00, %.preheader176.us.new.preheader ]
  %.0165204.us = phi float [ %80, %.preheader176.us.new ], [ %.0165204.us.unr.ph, %.preheader176.us.new.preheader ]
  %.0167203.us = phi float [ %70, %.preheader176.us.new ], [ 0.000000e+00, %.preheader176.us.new.preheader ]
  %indvars.iv244.us = add nsw i64 %indvars.iv244.us.in, -1
  %64 = fmul float %28, %.0161206.us
  %65 = fmul float %.0162205.us, %32
  %66 = fadd float %65, %64
  %67 = fmul float %exp2, %.0165204.us
  %68 = fadd float %67, %66
  %69 = fmul float %.0167203.us, %34
  %70 = fadd float %69, %68
  %71 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv246.us, i64 %indvars.iv244.us
  store float %70, float* %71, align 4
  %72 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv246.us, i64 %indvars.iv244.us
  %73 = load float, float* %72, align 4
  %indvars.iv244.us.1 = add nsw i64 %indvars.iv244.us.in, -2
  %74 = fmul float %28, %73
  %75 = fmul float %.0161206.us, %32
  %76 = fadd float %75, %74
  %77 = fmul float %exp2, %70
  %78 = fadd float %77, %76
  %79 = fmul float %.0165204.us, %34
  %80 = fadd float %79, %78
  %81 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv246.us, i64 %indvars.iv244.us.1
  store float %80, float* %81, align 4
  %82 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv246.us, i64 %indvars.iv244.us.1
  %83 = load float, float* %82, align 4
  %84 = icmp sgt i64 %indvars.iv244.us.in, 2
  br i1 %84, label %.preheader176.us.new, label %._crit_edge209.us.loopexit

._crit_edge209.us.loopexit:                       ; preds = %.preheader176.us.new
  br label %._crit_edge209.us

._crit_edge209.us:                                ; preds = %._crit_edge209.us.loopexit, %.prol.loopexit277
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
  br i1 true, label %.prol.loopexit273, label %.prol.preheader272

.prol.preheader272:                               ; preds = %.preheader174.us
  br label %.prol.loopexit273

.prol.loopexit273:                                ; preds = %.prol.preheader272, %.preheader174.us
  %indvars.iv236.us.unr.ph = phi i64 [ 1, %.prol.preheader272 ], [ 0, %.preheader174.us ]
  br i1 false, label %._crit_edge200.us, label %.preheader174.us.new.preheader

.preheader174.us.new.preheader:                   ; preds = %.prol.loopexit273
  %85 = sub nsw i64 2158, %indvars.iv236.us.unr.ph
  %86 = lshr i64 %85, 1
  %87 = add nuw nsw i64 %86, 1
  br i1 false, label %.preheader174.us.new.preheader372, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader174.us.new.preheader
  %n.mod.vf = and i64 %87, 3
  %n.vec = sub nsw i64 %87, %n.mod.vf
  br i1 false, label %.preheader174.us.new.preheader372, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep294 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 %indvars.iv236.us.unr.ph
  %88 = sub nsw i64 2158, %indvars.iv236.us.unr.ph
  %89 = and i64 %88, 2158
  %90 = or i64 %indvars.iv236.us.unr.ph, %89
  %scevgep297 = getelementptr float, float* %scevgep296, i64 %90
  %scevgep300 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv240.us, i64 %indvars.iv236.us.unr.ph
  %scevgep303 = getelementptr float, float* %scevgep302, i64 %90
  %scevgep306 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv240.us, i64 %indvars.iv236.us.unr.ph
  %scevgep309 = getelementptr float, float* %scevgep308, i64 %90
  %bound0 = icmp ult float* %scevgep294, %scevgep303
  %bound1 = icmp ult float* %scevgep300, %scevgep297
  %found.conflict = and i1 %bound0, %bound1
  %bound0311 = icmp ult float* %scevgep294, %scevgep309
  %bound1312 = icmp ult float* %scevgep306, %scevgep297
  %found.conflict313 = and i1 %bound0311, %bound1312
  %conflict.rdx = or i1 %found.conflict, %found.conflict313
  %91 = or i64 %indvars.iv236.us.unr.ph, 2
  %92 = shl nuw nsw i64 %86, 1
  %93 = add nuw nsw i64 %91, %92
  %94 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub nsw i64 %93, %94
  br i1 %conflict.rdx, label %.preheader174.us.new.preheader372, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %95 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv236.us.unr.ph, %95
  %96 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv240.us, i64 %offset.idx
  %97 = bitcast float* %96 to <8 x float>*
  %wide.vec = load <8 x float>, <8 x float>* %97, align 4, !alias.scope !6
  %98 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv240.us, i64 %offset.idx
  %99 = bitcast float* %98 to <8 x float>*
  %wide.vec315 = load <8 x float>, <8 x float>* %99, align 4, !alias.scope !9
  %100 = fadd <8 x float> %wide.vec, %wide.vec315
  %101 = shufflevector <8 x float> %100, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %102 = add nuw nsw i64 %offset.idx, 1
  %103 = fadd <8 x float> %wide.vec, %wide.vec315
  %104 = shufflevector <8 x float> %103, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %105 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 %102
  %106 = getelementptr float, float* %105, i64 -1
  %107 = bitcast float* %106 to <8 x float>*
  %interleaved.vec = shufflevector <4 x float> %101, <4 x float> %104, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec, <8 x float>* %107, align 4, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %108 = icmp eq i64 %index.next, %n.vec
  br i1 %108, label %middle.block, label %vector.body, !llvm.loop !14

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge200.us, label %.preheader174.us.new.preheader372

.preheader174.us.new.preheader372:                ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader174.us.new.preheader
  %indvars.iv236.us.ph = phi i64 [ %indvars.iv236.us.unr.ph, %vector.memcheck ], [ %indvars.iv236.us.unr.ph, %min.iters.checked ], [ %indvars.iv236.us.unr.ph, %.preheader174.us.new.preheader ], [ %ind.end, %middle.block ]
  br label %.preheader174.us.new

.preheader174.us.new:                             ; preds = %.preheader174.us.new.preheader372, %.preheader174.us.new
  %indvars.iv236.us = phi i64 [ %indvars.iv.next237.us.1, %.preheader174.us.new ], [ %indvars.iv236.us.ph, %.preheader174.us.new.preheader372 ]
  %109 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv240.us, i64 %indvars.iv236.us
  %110 = load float, float* %109, align 4
  %111 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv240.us, i64 %indvars.iv236.us
  %112 = load float, float* %111, align 4
  %113 = fadd float %110, %112
  %114 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 %indvars.iv236.us
  store float %113, float* %114, align 4
  %indvars.iv.next237.us = add nuw nsw i64 %indvars.iv236.us, 1
  %115 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv240.us, i64 %indvars.iv.next237.us
  %116 = load float, float* %115, align 4
  %117 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv240.us, i64 %indvars.iv.next237.us
  %118 = load float, float* %117, align 4
  %119 = fadd float %116, %118
  %120 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 %indvars.iv.next237.us
  store float %119, float* %120, align 4
  %indvars.iv.next237.us.1 = add nsw i64 %indvars.iv236.us, 2
  %exitcond239.us.1 = icmp eq i64 %indvars.iv.next237.us.1, 2160
  br i1 %exitcond239.us.1, label %._crit_edge200.us.loopexit, label %.preheader174.us.new, !llvm.loop !15

._crit_edge200.us.loopexit:                       ; preds = %.preheader174.us.new
  br label %._crit_edge200.us

._crit_edge200.us:                                ; preds = %._crit_edge200.us.loopexit, %middle.block, %.prol.loopexit273
  %indvars.iv.next241.us = add nuw nsw i64 %indvars.iv240.us, 1
  %exitcond243.us = icmp eq i64 %indvars.iv.next241.us, 4096
  br i1 %exitcond243.us, label %.preheader173.loopexit, label %.preheader174.us

.preheader173.loopexit:                           ; preds = %._crit_edge200.us
  br label %.preheader173

.preheader173:                                    ; preds = %.preheader173.loopexit, %7, %.preheader177, %.preheader175
  br i1 true, label %.preheader172.lr.ph, label %.preheader169

.preheader172.lr.ph:                              ; preds = %.preheader173
  br i1 true, label %.preheader172.us.preheader, label %._crit_edge181

.preheader172.us.preheader:                       ; preds = %.preheader172.lr.ph
  br label %.preheader172.us

.preheader172.us:                                 ; preds = %.preheader172.us.preheader, %._crit_edge196.us
  %indvars.iv232.us = phi i64 [ %indvars.iv.next233.us, %._crit_edge196.us ], [ 0, %.preheader172.us.preheader ]
  br i1 true, label %.prol.loopexit269, label %.prol.preheader268

.prol.preheader268:                               ; preds = %.preheader172.us
  br label %.prol.loopexit269

.prol.loopexit269:                                ; preds = %.prol.preheader268, %.preheader172.us
  %indvars.iv228.us.unr.ph = phi i64 [ 1, %.prol.preheader268 ], [ 0, %.preheader172.us ]
  br i1 false, label %._crit_edge196.us, label %.preheader172.us.new.preheader

.preheader172.us.new.preheader:                   ; preds = %.prol.loopexit269
  br label %.preheader172.us.new

.preheader172.us.new:                             ; preds = %.preheader172.us.new.preheader, %.preheader172.us.new
  %indvars.iv228.us = phi i64 [ %indvars.iv.next229.us.1, %.preheader172.us.new ], [ %indvars.iv228.us.unr.ph, %.preheader172.us.new.preheader ]
  %.0156193.us = phi float [ %142, %.preheader172.us.new ], [ 0.000000e+00, %.preheader172.us.new.preheader ]
  %.1158192.us = phi float [ %140, %.preheader172.us.new ], [ 0.000000e+00, %.preheader172.us.new.preheader ]
  %.1160191.us = phi float [ %129, %.preheader172.us.new ], [ 0.000000e+00, %.preheader172.us.new.preheader ]
  %121 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv228.us, i64 %indvars.iv232.us
  %122 = load float, float* %121, align 4
  %123 = fmul float %20, %122
  %124 = fmul float %24, %.0156193.us
  %125 = fadd float %124, %123
  %126 = fmul float %exp2, %.1158192.us
  %127 = fadd float %126, %125
  %128 = fmul float %.1160191.us, %34
  %129 = fadd float %128, %127
  %130 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv228.us, i64 %indvars.iv232.us
  store float %129, float* %130, align 4
  %131 = load float, float* %121, align 4
  %indvars.iv.next229.us = add nuw nsw i64 %indvars.iv228.us, 1
  %132 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next229.us, i64 %indvars.iv232.us
  %133 = load float, float* %132, align 4
  %134 = fmul float %20, %133
  %135 = fmul float %24, %131
  %136 = fadd float %135, %134
  %137 = fmul float %exp2, %129
  %138 = fadd float %137, %136
  %139 = fmul float %.1158192.us, %34
  %140 = fadd float %139, %138
  %141 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv.next229.us, i64 %indvars.iv232.us
  store float %140, float* %141, align 4
  %142 = load float, float* %132, align 4
  %indvars.iv.next229.us.1 = add nuw nsw i64 %indvars.iv228.us, 2
  %exitcond231.us.1 = icmp eq i64 %indvars.iv.next229.us.1, 4096
  br i1 %exitcond231.us.1, label %._crit_edge196.us.loopexit, label %.preheader172.us.new

._crit_edge196.us.loopexit:                       ; preds = %.preheader172.us.new
  br label %._crit_edge196.us

._crit_edge196.us:                                ; preds = %._crit_edge196.us.loopexit, %.prol.loopexit269
  %indvars.iv.next233.us = add nuw nsw i64 %indvars.iv232.us, 1
  %exitcond235.us = icmp eq i64 %indvars.iv.next233.us, 2160
  br i1 %exitcond235.us, label %.preheader171, label %.preheader172.us

.preheader171:                                    ; preds = %._crit_edge196.us
  br i1 true, label %.preheader170.lr.ph, label %.preheader169

.preheader170.lr.ph:                              ; preds = %.preheader171
  br i1 true, label %.preheader170.us.preheader, label %._crit_edge181

.preheader170.us.preheader:                       ; preds = %.preheader170.lr.ph
  %143 = fmul float %28, 0.000000e+00
  %144 = fmul float %31, -0.000000e+00
  %145 = fadd float %144, %143
  %146 = fmul float %exp2, 0.000000e+00
  %147 = fadd float %146, %145
  %148 = fmul float %33, -0.000000e+00
  %149 = fadd float %148, %147
  br label %.preheader170.us

.preheader170.us:                                 ; preds = %.preheader170.us.preheader, %._crit_edge189.us
  %indvars.iv224.us = phi i64 [ %indvars.iv.next225.us, %._crit_edge189.us ], [ 0, %.preheader170.us.preheader ]
  br i1 true, label %.prol.loopexit265, label %.prol.preheader264

.prol.preheader264:                               ; preds = %.preheader170.us
  br label %.prol.loopexit265

.prol.loopexit265:                                ; preds = %.prol.preheader264, %.preheader170.us
  %indvars.iv222.us.in.unr.ph = phi i64 [ 4095, %.prol.preheader264 ], [ 4096, %.preheader170.us ]
  %.1166184.us.unr.ph = phi float [ %149, %.prol.preheader264 ], [ 0.000000e+00, %.preheader170.us ]
  br i1 false, label %._crit_edge189.us, label %.preheader170.us.new.preheader

.preheader170.us.new.preheader:                   ; preds = %.prol.loopexit265
  br label %.preheader170.us.new

.preheader170.us.new:                             ; preds = %.preheader170.us.new.preheader, %.preheader170.us.new
  %indvars.iv222.us.in = phi i64 [ %indvars.iv222.us.1, %.preheader170.us.new ], [ %indvars.iv222.us.in.unr.ph, %.preheader170.us.new.preheader ]
  %.0163186.us = phi float [ %169, %.preheader170.us.new ], [ 0.000000e+00, %.preheader170.us.new.preheader ]
  %.0164185.us = phi float [ %159, %.preheader170.us.new ], [ 0.000000e+00, %.preheader170.us.new.preheader ]
  %.1166184.us = phi float [ %166, %.preheader170.us.new ], [ %.1166184.us.unr.ph, %.preheader170.us.new.preheader ]
  %.1168183.us = phi float [ %156, %.preheader170.us.new ], [ 0.000000e+00, %.preheader170.us.new.preheader ]
  %indvars.iv222.us = add nsw i64 %indvars.iv222.us.in, -1
  %150 = fmul float %28, %.0163186.us
  %151 = fmul float %.0164185.us, %32
  %152 = fadd float %151, %150
  %153 = fmul float %exp2, %.1166184.us
  %154 = fadd float %153, %152
  %155 = fmul float %.1168183.us, %34
  %156 = fadd float %155, %154
  %157 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv222.us, i64 %indvars.iv224.us
  store float %156, float* %157, align 4
  %158 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv222.us, i64 %indvars.iv224.us
  %159 = load float, float* %158, align 4
  %indvars.iv222.us.1 = add nsw i64 %indvars.iv222.us.in, -2
  %160 = fmul float %28, %159
  %161 = fmul float %.0163186.us, %32
  %162 = fadd float %161, %160
  %163 = fmul float %exp2, %156
  %164 = fadd float %163, %162
  %165 = fmul float %.1166184.us, %34
  %166 = fadd float %165, %164
  %167 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv222.us.1, i64 %indvars.iv224.us
  store float %166, float* %167, align 4
  %168 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv222.us.1, i64 %indvars.iv224.us
  %169 = load float, float* %168, align 4
  %170 = icmp sgt i64 %indvars.iv222.us.in, 2
  br i1 %170, label %.preheader170.us.new, label %._crit_edge189.us.loopexit

._crit_edge189.us.loopexit:                       ; preds = %.preheader170.us.new
  br label %._crit_edge189.us

._crit_edge189.us:                                ; preds = %._crit_edge189.us.loopexit, %.prol.loopexit265
  %indvars.iv.next225.us = add nuw nsw i64 %indvars.iv224.us, 1
  %exitcond227.us = icmp eq i64 %indvars.iv.next225.us, 2160
  br i1 %exitcond227.us, label %.preheader169.loopexit, label %.preheader170.us

.preheader169.loopexit:                           ; preds = %._crit_edge189.us
  br label %.preheader169

.preheader169:                                    ; preds = %.preheader169.loopexit, %.preheader173, %.preheader171
  br i1 true, label %.preheader.lr.ph, label %._crit_edge181

.preheader.lr.ph:                                 ; preds = %.preheader169
  br i1 true, label %.preheader.us.preheader, label %._crit_edge181

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
  %171 = sub nsw i64 2158, %indvars.iv.us.unr.ph
  %172 = lshr i64 %171, 1
  %173 = add nuw nsw i64 %172, 1
  br i1 false, label %.preheader.us.new.preheader371, label %min.iters.checked322

min.iters.checked322:                             ; preds = %.preheader.us.new.preheader
  %n.mod.vf323 = and i64 %173, 3
  %n.vec324 = sub nsw i64 %173, %n.mod.vf323
  br i1 false, label %.preheader.us.new.preheader371, label %vector.memcheck353

vector.memcheck353:                               ; preds = %min.iters.checked322
  %scevgep328 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 %indvars.iv.us.unr.ph
  %174 = sub nsw i64 2158, %indvars.iv.us.unr.ph
  %175 = and i64 %174, 2158
  %176 = or i64 %indvars.iv.us.unr.ph, %175
  %scevgep331 = getelementptr float, float* %scevgep330, i64 %176
  %scevgep334 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv218.us, i64 %indvars.iv.us.unr.ph
  %scevgep337 = getelementptr float, float* %scevgep336, i64 %176
  %scevgep340 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv218.us, i64 %indvars.iv.us.unr.ph
  %scevgep343 = getelementptr float, float* %scevgep342, i64 %176
  %bound0345 = icmp ult float* %scevgep328, %scevgep337
  %bound1346 = icmp ult float* %scevgep334, %scevgep331
  %found.conflict347 = and i1 %bound0345, %bound1346
  %bound0348 = icmp ult float* %scevgep328, %scevgep343
  %bound1349 = icmp ult float* %scevgep340, %scevgep331
  %found.conflict350 = and i1 %bound0348, %bound1349
  %conflict.rdx351 = or i1 %found.conflict347, %found.conflict350
  %177 = or i64 %indvars.iv.us.unr.ph, 2
  %178 = shl nuw nsw i64 %172, 1
  %179 = add nuw nsw i64 %177, %178
  %180 = shl nuw nsw i64 %n.mod.vf323, 1
  %ind.end358 = sub nsw i64 %179, %180
  br i1 %conflict.rdx351, label %.preheader.us.new.preheader371, label %vector.body318.preheader

vector.body318.preheader:                         ; preds = %vector.memcheck353
  br label %vector.body318

vector.body318:                                   ; preds = %vector.body318.preheader, %vector.body318
  %index355 = phi i64 [ %index.next356, %vector.body318 ], [ 0, %vector.body318.preheader ]
  %181 = shl i64 %index355, 1
  %offset.idx360 = or i64 %indvars.iv.us.unr.ph, %181
  %182 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv218.us, i64 %offset.idx360
  %183 = bitcast float* %182 to <8 x float>*
  %wide.vec364 = load <8 x float>, <8 x float>* %183, align 4, !alias.scope !16
  %184 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv218.us, i64 %offset.idx360
  %185 = bitcast float* %184 to <8 x float>*
  %wide.vec367 = load <8 x float>, <8 x float>* %185, align 4, !alias.scope !19
  %186 = fadd <8 x float> %wide.vec364, %wide.vec367
  %187 = shufflevector <8 x float> %186, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %188 = add nuw nsw i64 %offset.idx360, 1
  %189 = fadd <8 x float> %wide.vec364, %wide.vec367
  %190 = shufflevector <8 x float> %189, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %191 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 %188
  %192 = getelementptr float, float* %191, i64 -1
  %193 = bitcast float* %192 to <8 x float>*
  %interleaved.vec370 = shufflevector <4 x float> %187, <4 x float> %190, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec370, <8 x float>* %193, align 4, !alias.scope !21, !noalias !23
  %index.next356 = add i64 %index355, 4
  %194 = icmp eq i64 %index.next356, %n.vec324
  br i1 %194, label %middle.block319, label %vector.body318, !llvm.loop !24

middle.block319:                                  ; preds = %vector.body318
  %cmp.n359 = icmp eq i64 %n.mod.vf323, 0
  br i1 %cmp.n359, label %._crit_edge.us, label %.preheader.us.new.preheader371

.preheader.us.new.preheader371:                   ; preds = %middle.block319, %vector.memcheck353, %min.iters.checked322, %.preheader.us.new.preheader
  %indvars.iv.us.ph = phi i64 [ %indvars.iv.us.unr.ph, %vector.memcheck353 ], [ %indvars.iv.us.unr.ph, %min.iters.checked322 ], [ %indvars.iv.us.unr.ph, %.preheader.us.new.preheader ], [ %ind.end358, %middle.block319 ]
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader371, %.preheader.us.new
  %indvars.iv.us = phi i64 [ %indvars.iv.next.us.1, %.preheader.us.new ], [ %indvars.iv.us.ph, %.preheader.us.new.preheader371 ]
  %195 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv218.us, i64 %indvars.iv.us
  %196 = load float, float* %195, align 4
  %197 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv218.us, i64 %indvars.iv.us
  %198 = load float, float* %197, align 4
  %199 = fadd float %196, %198
  %200 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 %indvars.iv.us
  store float %199, float* %200, align 4
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %201 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv218.us, i64 %indvars.iv.next.us
  %202 = load float, float* %201, align 4
  %203 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv218.us, i64 %indvars.iv.next.us
  %204 = load float, float* %203, align 4
  %205 = fadd float %202, %204
  %206 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 %indvars.iv.next.us
  store float %205, float* %206, align 4
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

._crit_edge181:                                   ; preds = %._crit_edge181.loopexit, %.preheader176.lr.ph, %.preheader178.lr.ph, %.preheader174.lr.ph, %.preheader172.lr.ph, %.preheader170.lr.ph, %.preheader.lr.ph, %.preheader169
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [2160 x float]* nocapture readonly) #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %.preheader.lr.ph, label %._crit_edge15

.preheader.lr.ph:                                 ; preds = %3
  br i1 true, label %.preheader.lr.ph.split.us, label %._crit_edge15

.preheader.lr.ph.split.us:                        ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph.split.us
  %indvars.iv16 = phi i64 [ %indvars.iv.next17, %._crit_edge.us ], [ 0, %.preheader.lr.ph.split.us ]
  %8 = mul nsw i64 %indvars.iv16, 2160
  br label %9

; <label>:9:                                      ; preds = %16, %.preheader.us
  %indvars.iv.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %16 ]
  %10 = add nsw i64 %indvars.iv.us, %8
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
  %18 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv16, i64 %indvars.iv.us
  %19 = load float, float* %18, align 4
  %20 = fpext float %19 to double
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 2160
  br i1 %exitcond.us, label %._crit_edge.us, label %9

._crit_edge.us:                                   ; preds = %16
  %indvars.iv.next17 = add nuw nsw i64 %indvars.iv16, 1
  %exitcond19 = icmp eq i64 %indvars.iv.next17, 4096
  br i1 %exitcond19, label %._crit_edge15.loopexit, label %.preheader.us

._crit_edge15.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %.preheader.lr.ph, %3
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare float @expf(float) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

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
