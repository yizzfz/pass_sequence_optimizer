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
  call void @init_array(i32 4096, i32 2160, float* nonnull %3, [2160 x float]* %8)
  call void (...) @polybench_timer_start() #5
  %10 = load float, float* %3, align 4
  %11 = bitcast i8* %6 to [2160 x float]*
  %12 = bitcast i8* %7 to [2160 x float]*
  call void @kernel_deriche(i32 4096, i32 2160, float %10, [2160 x float]* %8, [2160 x float]* %9, [2160 x float]* %11, [2160 x float]* %12)
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
  call void @print_array(i32 4096, i32 2160, [2160 x float]* %18)
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
define internal void @init_array(i32, i32, float* nocapture, [2160 x float]* nocapture) #2 {
  store float 2.500000e-01, float* %2, align 4
  br i1 true, label %.lr.ph5, label %._crit_edge6

.lr.ph5:                                          ; preds = %4
  br i1 true, label %.lr.ph5.split.us.preheader, label %._crit_edge6

.lr.ph5.split.us.preheader:                       ; preds = %.lr.ph5
  br label %.lr.ph5.split.us

.lr.ph5.split.us:                                 ; preds = %.lr.ph5.split.us.preheader, %._crit_edge.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us ], [ 0, %.lr.ph5.split.us.preheader ]
  %5 = mul i64 %indvars.iv, 313
  br i1 false, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph5.split.us
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

scalar.ph.preheader:                              ; preds = %middle.block, %min.iters.checked, %.lr.ph5.split.us
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  br i1 true, label %._crit_edge.us.loopexit, label %scalar.ph, !llvm.loop !4

._crit_edge.us.loopexit:                          ; preds = %scalar.ph
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 4096
  br i1 %exitcond, label %._crit_edge6.loopexit, label %.lr.ph5.split.us

._crit_edge6.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit, %.lr.ph5, %4
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
  br i1 true, label %.lr.ph228, label %._crit_edge205

.lr.ph228:                                        ; preds = %7
  br i1 true, label %.lr.ph228.split.us.preheader, label %._crit_edge173

.lr.ph228.split.us.preheader:                     ; preds = %.lr.ph228
  %39 = insertelement <2 x float> undef, float %31, i32 0
  %40 = insertelement <2 x float> %39, float %20, i32 1
  br label %.lr.ph228.split.us

.lr.ph228.split.us:                               ; preds = %.lr.ph228.split.us.preheader, %._crit_edge225.us
  %indvars.iv266.us = phi i64 [ %indvars.iv.next267.us, %._crit_edge225.us ], [ 0, %.lr.ph228.split.us.preheader ]
  br i1 true, label %.prol.loopexit294, label %.prol.preheader293

.prol.preheader293:                               ; preds = %.lr.ph228.split.us
  br label %.prol.loopexit294

.prol.loopexit294:                                ; preds = %.prol.preheader293, %.lr.ph228.split.us
  %indvars.iv262.us.unr.ph = phi i64 [ 1, %.prol.preheader293 ], [ 0, %.lr.ph228.split.us ]
  br i1 false, label %._crit_edge225.us, label %.lr.ph228.split.us.new.preheader

.lr.ph228.split.us.new.preheader:                 ; preds = %.prol.loopexit294
  br label %.lr.ph228.split.us.new

.lr.ph228.split.us.new:                           ; preds = %.lr.ph228.split.us.new.preheader, %.lr.ph228.split.us.new
  %indvars.iv262.us = phi i64 [ %indvars.iv.next263.us.1, %.lr.ph228.split.us.new ], [ %indvars.iv262.us.unr.ph, %.lr.ph228.split.us.new.preheader ]
  %.0155221.us = phi float [ %63, %.lr.ph228.split.us.new ], [ 0.000000e+00, %.lr.ph228.split.us.new.preheader ]
  %.0157220.us = phi float [ %61, %.lr.ph228.split.us.new ], [ 0.000000e+00, %.lr.ph228.split.us.new.preheader ]
  %.0159219.us = phi float [ %49, %.lr.ph228.split.us.new ], [ 0.000000e+00, %.lr.ph228.split.us.new.preheader ]
  %41 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv266.us, i64 %indvars.iv262.us
  %42 = load float, float* %41, align 4
  %43 = fmul float %20, %42
  %44 = fmul float %31, %.0155221.us
  %45 = fadd float %44, %43
  %46 = fmul float %exp2, %.0157220.us
  %47 = fadd float %46, %45
  %48 = fmul float %.0159219.us, %38
  %49 = fadd float %48, %47
  %50 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv266.us, i64 %indvars.iv262.us
  store float %49, float* %50, align 4
  %51 = bitcast float* %41 to <2 x float>*
  %indvars.iv.next263.us = add nuw nsw i64 %indvars.iv262.us, 1
  %52 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv266.us, i64 %indvars.iv.next263.us
  %53 = load <2 x float>, <2 x float>* %51, align 4
  %54 = fmul <2 x float> %40, %53
  %55 = extractelement <2 x float> %54, i32 0
  %56 = extractelement <2 x float> %54, i32 1
  %57 = fadd float %55, %56
  %58 = fmul float %exp2, %49
  %59 = fadd float %58, %57
  %60 = fmul float %.0157220.us, %38
  %61 = fadd float %60, %59
  %62 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv266.us, i64 %indvars.iv.next263.us
  store float %61, float* %62, align 4
  %63 = load float, float* %52, align 4
  %indvars.iv.next263.us.1 = add nuw nsw i64 %indvars.iv262.us, 2
  %exitcond265.us.1 = icmp eq i64 %indvars.iv.next263.us.1, 2160
  br i1 %exitcond265.us.1, label %._crit_edge225.us.loopexit, label %.lr.ph228.split.us.new

._crit_edge225.us.loopexit:                       ; preds = %.lr.ph228.split.us.new
  br label %._crit_edge225.us

._crit_edge225.us:                                ; preds = %._crit_edge225.us.loopexit, %.prol.loopexit294
  %indvars.iv.next267.us = add nuw nsw i64 %indvars.iv266.us, 1
  %exitcond269.us = icmp eq i64 %indvars.iv.next267.us, 4096
  br i1 %exitcond269.us, label %._crit_edge229, label %.lr.ph228.split.us

._crit_edge229:                                   ; preds = %._crit_edge225.us
  br i1 true, label %.lr.ph217, label %._crit_edge205

.lr.ph217:                                        ; preds = %._crit_edge229
  br i1 true, label %.lr.ph217.split.us.preheader, label %._crit_edge173

.lr.ph217.split.us.preheader:                     ; preds = %.lr.ph217
  %64 = fmul float %32, 0.000000e+00
  %65 = fmul float %35, -0.000000e+00
  %66 = fadd float %65, %64
  %67 = fmul float %exp2, 0.000000e+00
  %68 = fadd float %67, %66
  %69 = fmul float %37, -0.000000e+00
  %70 = fadd float %69, %68
  br label %.lr.ph217.split.us

.lr.ph217.split.us:                               ; preds = %.lr.ph217.split.us.preheader, %._crit_edge214.us
  %indvars.iv258.us = phi i64 [ %indvars.iv.next259.us, %._crit_edge214.us ], [ 0, %.lr.ph217.split.us.preheader ]
  br i1 true, label %.prol.loopexit290, label %.prol.preheader289

.prol.preheader289:                               ; preds = %.lr.ph217.split.us
  br label %.prol.loopexit290

.prol.loopexit290:                                ; preds = %.prol.preheader289, %.lr.ph217.split.us
  %indvars.iv256.us.in.unr.ph = phi i64 [ 2159, %.prol.preheader289 ], [ 2160, %.lr.ph217.split.us ]
  %.0165208.us.unr.ph = phi float [ %70, %.prol.preheader289 ], [ 0.000000e+00, %.lr.ph217.split.us ]
  br i1 false, label %._crit_edge214.us, label %.lr.ph217.split.us.new.preheader

.lr.ph217.split.us.new.preheader:                 ; preds = %.prol.loopexit290
  br label %.lr.ph217.split.us.new

.lr.ph217.split.us.new:                           ; preds = %.lr.ph217.split.us.new.preheader, %.lr.ph217.split.us.new
  %indvars.iv256.us.in = phi i64 [ %indvars.iv256.us.1, %.lr.ph217.split.us.new ], [ %indvars.iv256.us.in.unr.ph, %.lr.ph217.split.us.new.preheader ]
  %.0161210.us = phi float [ %90, %.lr.ph217.split.us.new ], [ 0.000000e+00, %.lr.ph217.split.us.new.preheader ]
  %.0162209.us = phi float [ %80, %.lr.ph217.split.us.new ], [ 0.000000e+00, %.lr.ph217.split.us.new.preheader ]
  %.0165208.us = phi float [ %87, %.lr.ph217.split.us.new ], [ %.0165208.us.unr.ph, %.lr.ph217.split.us.new.preheader ]
  %.0167207.us = phi float [ %77, %.lr.ph217.split.us.new ], [ 0.000000e+00, %.lr.ph217.split.us.new.preheader ]
  %indvars.iv256.us = add nsw i64 %indvars.iv256.us.in, -1
  %71 = fmul float %32, %.0161210.us
  %72 = fmul float %.0162209.us, %36
  %73 = fadd float %72, %71
  %74 = fmul float %exp2, %.0165208.us
  %75 = fadd float %74, %73
  %76 = fmul float %.0167207.us, %38
  %77 = fadd float %76, %75
  %78 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv258.us, i64 %indvars.iv256.us
  store float %77, float* %78, align 4
  %79 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv258.us, i64 %indvars.iv256.us
  %80 = load float, float* %79, align 4
  %indvars.iv256.us.1 = add nsw i64 %indvars.iv256.us.in, -2
  %81 = fmul float %32, %80
  %82 = fmul float %.0161210.us, %36
  %83 = fadd float %82, %81
  %84 = fmul float %exp2, %77
  %85 = fadd float %84, %83
  %86 = fmul float %.0165208.us, %38
  %87 = fadd float %86, %85
  %88 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv258.us, i64 %indvars.iv256.us.1
  store float %87, float* %88, align 4
  %89 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv258.us, i64 %indvars.iv256.us.1
  %90 = load float, float* %89, align 4
  %91 = icmp sgt i64 %indvars.iv256.us.in, 2
  br i1 %91, label %.lr.ph217.split.us.new, label %._crit_edge214.us.loopexit

._crit_edge214.us.loopexit:                       ; preds = %.lr.ph217.split.us.new
  br label %._crit_edge214.us

._crit_edge214.us:                                ; preds = %._crit_edge214.us.loopexit, %.prol.loopexit290
  %indvars.iv.next259.us = add nuw nsw i64 %indvars.iv258.us, 1
  %exitcond261.us = icmp eq i64 %indvars.iv.next259.us, 4096
  br i1 %exitcond261.us, label %._crit_edge218, label %.lr.ph217.split.us

._crit_edge218:                                   ; preds = %._crit_edge214.us
  br i1 true, label %.lr.ph204, label %._crit_edge205

.lr.ph204:                                        ; preds = %._crit_edge218
  br i1 true, label %.lr.ph204.split.us.preheader, label %._crit_edge173

.lr.ph204.split.us.preheader:                     ; preds = %.lr.ph204
  br label %.lr.ph204.split.us

.lr.ph204.split.us:                               ; preds = %.lr.ph204.split.us.preheader, %._crit_edge201.us
  %indvars.iv252.us = phi i64 [ %indvars.iv.next253.us, %._crit_edge201.us ], [ 0, %.lr.ph204.split.us.preheader ]
  %scevgep308 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv252.us, i64 2
  %scevgep314 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv252.us, i64 2
  %scevgep320 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv252.us, i64 2
  br i1 true, label %.prol.loopexit286, label %.prol.preheader285

.prol.preheader285:                               ; preds = %.lr.ph204.split.us
  br label %.prol.loopexit286

.prol.loopexit286:                                ; preds = %.prol.preheader285, %.lr.ph204.split.us
  %indvars.iv248.us.unr.ph = phi i64 [ 1, %.prol.preheader285 ], [ 0, %.lr.ph204.split.us ]
  br i1 false, label %._crit_edge201.us, label %.lr.ph204.split.us.new.preheader

.lr.ph204.split.us.new.preheader:                 ; preds = %.prol.loopexit286
  %92 = sub nsw i64 2158, %indvars.iv248.us.unr.ph
  %93 = lshr i64 %92, 1
  %94 = add nuw nsw i64 %93, 1
  br i1 false, label %.lr.ph204.split.us.new.preheader384, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph204.split.us.new.preheader
  %n.mod.vf = and i64 %94, 3
  %n.vec = sub nsw i64 %94, %n.mod.vf
  br i1 false, label %.lr.ph204.split.us.new.preheader384, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep306 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv252.us, i64 %indvars.iv248.us.unr.ph
  %95 = sub nsw i64 2158, %indvars.iv248.us.unr.ph
  %96 = and i64 %95, 2158
  %97 = or i64 %indvars.iv248.us.unr.ph, %96
  %scevgep309 = getelementptr float, float* %scevgep308, i64 %97
  %scevgep312 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv252.us, i64 %indvars.iv248.us.unr.ph
  %scevgep315 = getelementptr float, float* %scevgep314, i64 %97
  %scevgep318 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv252.us, i64 %indvars.iv248.us.unr.ph
  %scevgep321 = getelementptr float, float* %scevgep320, i64 %97
  %bound0 = icmp ult float* %scevgep306, %scevgep315
  %bound1 = icmp ult float* %scevgep312, %scevgep309
  %found.conflict = and i1 %bound0, %bound1
  %bound0323 = icmp ult float* %scevgep306, %scevgep321
  %bound1324 = icmp ult float* %scevgep318, %scevgep309
  %found.conflict325 = and i1 %bound0323, %bound1324
  %conflict.rdx = or i1 %found.conflict, %found.conflict325
  %98 = or i64 %indvars.iv248.us.unr.ph, 2
  %99 = shl nuw nsw i64 %93, 1
  %100 = add nuw nsw i64 %98, %99
  %101 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub nsw i64 %100, %101
  br i1 %conflict.rdx, label %.lr.ph204.split.us.new.preheader384, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %102 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv248.us.unr.ph, %102
  %103 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv252.us, i64 %offset.idx
  %104 = bitcast float* %103 to <8 x float>*
  %wide.vec = load <8 x float>, <8 x float>* %104, align 4, !alias.scope !6
  %105 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv252.us, i64 %offset.idx
  %106 = bitcast float* %105 to <8 x float>*
  %wide.vec327 = load <8 x float>, <8 x float>* %106, align 4, !alias.scope !9
  %107 = fadd <8 x float> %wide.vec, %wide.vec327
  %108 = shufflevector <8 x float> %107, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %109 = add nuw nsw i64 %offset.idx, 1
  %110 = fadd <8 x float> %wide.vec, %wide.vec327
  %111 = shufflevector <8 x float> %110, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %112 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv252.us, i64 %109
  %113 = getelementptr float, float* %112, i64 -1
  %114 = bitcast float* %113 to <8 x float>*
  %interleaved.vec = shufflevector <4 x float> %108, <4 x float> %111, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec, <8 x float>* %114, align 4, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %115 = icmp eq i64 %index.next, %n.vec
  br i1 %115, label %middle.block, label %vector.body, !llvm.loop !14

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge201.us, label %.lr.ph204.split.us.new.preheader384

.lr.ph204.split.us.new.preheader384:              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph204.split.us.new.preheader
  %indvars.iv248.us.ph = phi i64 [ %indvars.iv248.us.unr.ph, %vector.memcheck ], [ %indvars.iv248.us.unr.ph, %min.iters.checked ], [ %indvars.iv248.us.unr.ph, %.lr.ph204.split.us.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph204.split.us.new

.lr.ph204.split.us.new:                           ; preds = %.lr.ph204.split.us.new.preheader384, %.lr.ph204.split.us.new
  %indvars.iv248.us = phi i64 [ %indvars.iv.next249.us.1, %.lr.ph204.split.us.new ], [ %indvars.iv248.us.ph, %.lr.ph204.split.us.new.preheader384 ]
  %116 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv252.us, i64 %indvars.iv248.us
  %117 = load float, float* %116, align 4
  %118 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv252.us, i64 %indvars.iv248.us
  %119 = load float, float* %118, align 4
  %120 = fadd float %117, %119
  %121 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv252.us, i64 %indvars.iv248.us
  store float %120, float* %121, align 4
  %indvars.iv.next249.us = add nuw nsw i64 %indvars.iv248.us, 1
  %122 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv252.us, i64 %indvars.iv.next249.us
  %123 = load float, float* %122, align 4
  %124 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv252.us, i64 %indvars.iv.next249.us
  %125 = load float, float* %124, align 4
  %126 = fadd float %123, %125
  %127 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv252.us, i64 %indvars.iv.next249.us
  store float %126, float* %127, align 4
  %indvars.iv.next249.us.1 = add nuw nsw i64 %indvars.iv248.us, 2
  %exitcond251.us.1 = icmp eq i64 %indvars.iv.next249.us.1, 2160
  br i1 %exitcond251.us.1, label %._crit_edge201.us.loopexit, label %.lr.ph204.split.us.new, !llvm.loop !15

._crit_edge201.us.loopexit:                       ; preds = %.lr.ph204.split.us.new
  br label %._crit_edge201.us

._crit_edge201.us:                                ; preds = %._crit_edge201.us.loopexit, %middle.block, %.prol.loopexit286
  %indvars.iv.next253.us = add nuw nsw i64 %indvars.iv252.us, 1
  %exitcond255.us = icmp eq i64 %indvars.iv.next253.us, 4096
  br i1 %exitcond255.us, label %._crit_edge205.loopexit, label %.lr.ph204.split.us

._crit_edge205.loopexit:                          ; preds = %._crit_edge201.us
  br label %._crit_edge205

._crit_edge205:                                   ; preds = %._crit_edge205.loopexit, %._crit_edge229, %7, %._crit_edge218
  br i1 true, label %.lr.ph196, label %._crit_edge186

.lr.ph196:                                        ; preds = %._crit_edge205
  br i1 true, label %.lr.ph196.split.us.preheader, label %._crit_edge173

.lr.ph196.split.us.preheader:                     ; preds = %.lr.ph196
  br label %.lr.ph196.split.us

.lr.ph196.split.us:                               ; preds = %.lr.ph196.split.us.preheader, %._crit_edge193.us
  %indvars.iv244.us = phi i64 [ %indvars.iv.next245.us, %._crit_edge193.us ], [ 0, %.lr.ph196.split.us.preheader ]
  br i1 true, label %.prol.loopexit282, label %.prol.preheader281

.prol.preheader281:                               ; preds = %.lr.ph196.split.us
  br label %.prol.loopexit282

.prol.loopexit282:                                ; preds = %.prol.preheader281, %.lr.ph196.split.us
  %indvars.iv240.us.unr.ph = phi i64 [ 1, %.prol.preheader281 ], [ 0, %.lr.ph196.split.us ]
  br i1 false, label %._crit_edge193.us, label %.lr.ph196.split.us.new.preheader

.lr.ph196.split.us.new.preheader:                 ; preds = %.prol.loopexit282
  br label %.lr.ph196.split.us.new

.lr.ph196.split.us.new:                           ; preds = %.lr.ph196.split.us.new.preheader, %.lr.ph196.split.us.new
  %indvars.iv240.us = phi i64 [ %indvars.iv.next241.us.1, %.lr.ph196.split.us.new ], [ %indvars.iv240.us.unr.ph, %.lr.ph196.split.us.new.preheader ]
  %.0156189.us = phi float [ %149, %.lr.ph196.split.us.new ], [ 0.000000e+00, %.lr.ph196.split.us.new.preheader ]
  %.1158188.us = phi float [ %147, %.lr.ph196.split.us.new ], [ 0.000000e+00, %.lr.ph196.split.us.new.preheader ]
  %.1160187.us = phi float [ %136, %.lr.ph196.split.us.new ], [ 0.000000e+00, %.lr.ph196.split.us.new.preheader ]
  %128 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 %indvars.iv244.us
  %129 = load float, float* %128, align 4
  %130 = fmul float %20, %129
  %131 = fmul float %31, %.0156189.us
  %132 = fadd float %131, %130
  %133 = fmul float %exp2, %.1158188.us
  %134 = fadd float %133, %132
  %135 = fmul float %.1160187.us, %38
  %136 = fadd float %135, %134
  %137 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv240.us, i64 %indvars.iv244.us
  store float %136, float* %137, align 4
  %138 = load float, float* %128, align 4
  %indvars.iv.next241.us = add nuw nsw i64 %indvars.iv240.us, 1
  %139 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next241.us, i64 %indvars.iv244.us
  %140 = load float, float* %139, align 4
  %141 = fmul float %20, %140
  %142 = fmul float %31, %138
  %143 = fadd float %142, %141
  %144 = fmul float %exp2, %136
  %145 = fadd float %144, %143
  %146 = fmul float %.1158188.us, %38
  %147 = fadd float %146, %145
  %148 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv.next241.us, i64 %indvars.iv244.us
  store float %147, float* %148, align 4
  %149 = load float, float* %139, align 4
  %indvars.iv.next241.us.1 = add nuw nsw i64 %indvars.iv240.us, 2
  %exitcond243.us.1 = icmp eq i64 %indvars.iv.next241.us.1, 4096
  br i1 %exitcond243.us.1, label %._crit_edge193.us.loopexit, label %.lr.ph196.split.us.new

._crit_edge193.us.loopexit:                       ; preds = %.lr.ph196.split.us.new
  br label %._crit_edge193.us

._crit_edge193.us:                                ; preds = %._crit_edge193.us.loopexit, %.prol.loopexit282
  %indvars.iv.next245.us = add nuw nsw i64 %indvars.iv244.us, 1
  %exitcond247.us = icmp eq i64 %indvars.iv.next245.us, 2160
  br i1 %exitcond247.us, label %._crit_edge197, label %.lr.ph196.split.us

._crit_edge197:                                   ; preds = %._crit_edge193.us
  br i1 true, label %.lr.ph185, label %._crit_edge186

.lr.ph185:                                        ; preds = %._crit_edge197
  br i1 true, label %.lr.ph185.split.us.preheader, label %._crit_edge173

.lr.ph185.split.us.preheader:                     ; preds = %.lr.ph185
  %150 = fmul float %32, 0.000000e+00
  %151 = fmul float %35, -0.000000e+00
  %152 = fadd float %151, %150
  %153 = fmul float %exp2, 0.000000e+00
  %154 = fadd float %153, %152
  %155 = fmul float %37, -0.000000e+00
  %156 = fadd float %155, %154
  br label %.lr.ph185.split.us

.lr.ph185.split.us:                               ; preds = %.lr.ph185.split.us.preheader, %._crit_edge182.us
  %indvars.iv236.us = phi i64 [ %indvars.iv.next237.us, %._crit_edge182.us ], [ 0, %.lr.ph185.split.us.preheader ]
  br i1 true, label %.prol.loopexit278, label %.prol.preheader277

.prol.preheader277:                               ; preds = %.lr.ph185.split.us
  br label %.prol.loopexit278

.prol.loopexit278:                                ; preds = %.prol.preheader277, %.lr.ph185.split.us
  %indvars.iv234.us.in.unr.ph = phi i64 [ 4095, %.prol.preheader277 ], [ 4096, %.lr.ph185.split.us ]
  %.1166176.us.unr.ph = phi float [ %156, %.prol.preheader277 ], [ 0.000000e+00, %.lr.ph185.split.us ]
  br i1 false, label %._crit_edge182.us, label %.lr.ph185.split.us.new.preheader

.lr.ph185.split.us.new.preheader:                 ; preds = %.prol.loopexit278
  br label %.lr.ph185.split.us.new

.lr.ph185.split.us.new:                           ; preds = %.lr.ph185.split.us.new.preheader, %.lr.ph185.split.us.new
  %indvars.iv234.us.in = phi i64 [ %indvars.iv234.us.1, %.lr.ph185.split.us.new ], [ %indvars.iv234.us.in.unr.ph, %.lr.ph185.split.us.new.preheader ]
  %.0163178.us = phi float [ %176, %.lr.ph185.split.us.new ], [ 0.000000e+00, %.lr.ph185.split.us.new.preheader ]
  %.0164177.us = phi float [ %166, %.lr.ph185.split.us.new ], [ 0.000000e+00, %.lr.ph185.split.us.new.preheader ]
  %.1166176.us = phi float [ %173, %.lr.ph185.split.us.new ], [ %.1166176.us.unr.ph, %.lr.ph185.split.us.new.preheader ]
  %.1168175.us = phi float [ %163, %.lr.ph185.split.us.new ], [ 0.000000e+00, %.lr.ph185.split.us.new.preheader ]
  %indvars.iv234.us = add nsw i64 %indvars.iv234.us.in, -1
  %157 = fmul float %32, %.0163178.us
  %158 = fmul float %.0164177.us, %36
  %159 = fadd float %158, %157
  %160 = fmul float %exp2, %.1166176.us
  %161 = fadd float %160, %159
  %162 = fmul float %.1168175.us, %38
  %163 = fadd float %162, %161
  %164 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv234.us, i64 %indvars.iv236.us
  store float %163, float* %164, align 4
  %165 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv234.us, i64 %indvars.iv236.us
  %166 = load float, float* %165, align 4
  %indvars.iv234.us.1 = add nsw i64 %indvars.iv234.us.in, -2
  %167 = fmul float %32, %166
  %168 = fmul float %.0163178.us, %36
  %169 = fadd float %168, %167
  %170 = fmul float %exp2, %163
  %171 = fadd float %170, %169
  %172 = fmul float %.1166176.us, %38
  %173 = fadd float %172, %171
  %174 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv234.us.1, i64 %indvars.iv236.us
  store float %173, float* %174, align 4
  %175 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv234.us.1, i64 %indvars.iv236.us
  %176 = load float, float* %175, align 4
  %177 = icmp sgt i64 %indvars.iv234.us.in, 2
  br i1 %177, label %.lr.ph185.split.us.new, label %._crit_edge182.us.loopexit

._crit_edge182.us.loopexit:                       ; preds = %.lr.ph185.split.us.new
  br label %._crit_edge182.us

._crit_edge182.us:                                ; preds = %._crit_edge182.us.loopexit, %.prol.loopexit278
  %indvars.iv.next237.us = add nuw nsw i64 %indvars.iv236.us, 1
  %exitcond239.us = icmp eq i64 %indvars.iv.next237.us, 2160
  br i1 %exitcond239.us, label %._crit_edge186.loopexit, label %.lr.ph185.split.us

._crit_edge186.loopexit:                          ; preds = %._crit_edge182.us
  br label %._crit_edge186

._crit_edge186:                                   ; preds = %._crit_edge186.loopexit, %._crit_edge205, %._crit_edge197
  %178 = phi i1 [ false, %._crit_edge205 ], [ false, %._crit_edge197 ], [ true, %._crit_edge186.loopexit ]
  br i1 true, label %.lr.ph172, label %._crit_edge173

.lr.ph172:                                        ; preds = %._crit_edge186
  br i1 %178, label %.lr.ph172.split.us.preheader, label %._crit_edge173

.lr.ph172.split.us.preheader:                     ; preds = %.lr.ph172
  br label %.lr.ph172.split.us

.lr.ph172.split.us:                               ; preds = %.lr.ph172.split.us.preheader, %._crit_edge.us
  %indvars.iv230.us = phi i64 [ %indvars.iv.next231.us, %._crit_edge.us ], [ 0, %.lr.ph172.split.us.preheader ]
  %scevgep342 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv230.us, i64 2
  %scevgep348 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv230.us, i64 2
  %scevgep354 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv230.us, i64 2
  br i1 true, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph172.split.us
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph172.split.us
  %indvars.iv.us.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph172.split.us ]
  br i1 false, label %._crit_edge.us, label %.lr.ph172.split.us.new.preheader

.lr.ph172.split.us.new.preheader:                 ; preds = %.prol.loopexit
  %179 = sub nsw i64 2158, %indvars.iv.us.unr.ph
  %180 = lshr i64 %179, 1
  %181 = add nuw nsw i64 %180, 1
  br i1 false, label %.lr.ph172.split.us.new.preheader383, label %min.iters.checked334

min.iters.checked334:                             ; preds = %.lr.ph172.split.us.new.preheader
  %n.mod.vf335 = and i64 %181, 3
  %n.vec336 = sub nsw i64 %181, %n.mod.vf335
  br i1 false, label %.lr.ph172.split.us.new.preheader383, label %vector.memcheck365

vector.memcheck365:                               ; preds = %min.iters.checked334
  %scevgep340 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv230.us, i64 %indvars.iv.us.unr.ph
  %182 = sub nsw i64 2158, %indvars.iv.us.unr.ph
  %183 = and i64 %182, 2158
  %184 = or i64 %indvars.iv.us.unr.ph, %183
  %scevgep343 = getelementptr float, float* %scevgep342, i64 %184
  %scevgep346 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv230.us, i64 %indvars.iv.us.unr.ph
  %scevgep349 = getelementptr float, float* %scevgep348, i64 %184
  %scevgep352 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv230.us, i64 %indvars.iv.us.unr.ph
  %scevgep355 = getelementptr float, float* %scevgep354, i64 %184
  %bound0357 = icmp ult float* %scevgep340, %scevgep349
  %bound1358 = icmp ult float* %scevgep346, %scevgep343
  %found.conflict359 = and i1 %bound0357, %bound1358
  %bound0360 = icmp ult float* %scevgep340, %scevgep355
  %bound1361 = icmp ult float* %scevgep352, %scevgep343
  %found.conflict362 = and i1 %bound0360, %bound1361
  %conflict.rdx363 = or i1 %found.conflict359, %found.conflict362
  %185 = or i64 %indvars.iv.us.unr.ph, 2
  %186 = shl nuw nsw i64 %180, 1
  %187 = add nuw nsw i64 %185, %186
  %188 = shl nuw nsw i64 %n.mod.vf335, 1
  %ind.end370 = sub nsw i64 %187, %188
  br i1 %conflict.rdx363, label %.lr.ph172.split.us.new.preheader383, label %vector.body330.preheader

vector.body330.preheader:                         ; preds = %vector.memcheck365
  br label %vector.body330

vector.body330:                                   ; preds = %vector.body330.preheader, %vector.body330
  %index367 = phi i64 [ %index.next368, %vector.body330 ], [ 0, %vector.body330.preheader ]
  %189 = shl i64 %index367, 1
  %offset.idx372 = or i64 %indvars.iv.us.unr.ph, %189
  %190 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv230.us, i64 %offset.idx372
  %191 = bitcast float* %190 to <8 x float>*
  %wide.vec376 = load <8 x float>, <8 x float>* %191, align 4, !alias.scope !16
  %192 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv230.us, i64 %offset.idx372
  %193 = bitcast float* %192 to <8 x float>*
  %wide.vec379 = load <8 x float>, <8 x float>* %193, align 4, !alias.scope !19
  %194 = fadd <8 x float> %wide.vec376, %wide.vec379
  %195 = shufflevector <8 x float> %194, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %196 = add nuw nsw i64 %offset.idx372, 1
  %197 = fadd <8 x float> %wide.vec376, %wide.vec379
  %198 = shufflevector <8 x float> %197, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %199 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv230.us, i64 %196
  %200 = getelementptr float, float* %199, i64 -1
  %201 = bitcast float* %200 to <8 x float>*
  %interleaved.vec382 = shufflevector <4 x float> %195, <4 x float> %198, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec382, <8 x float>* %201, align 4, !alias.scope !21, !noalias !23
  %index.next368 = add i64 %index367, 4
  %202 = icmp eq i64 %index.next368, %n.vec336
  br i1 %202, label %middle.block331, label %vector.body330, !llvm.loop !24

middle.block331:                                  ; preds = %vector.body330
  %cmp.n371 = icmp eq i64 %n.mod.vf335, 0
  br i1 %cmp.n371, label %._crit_edge.us, label %.lr.ph172.split.us.new.preheader383

.lr.ph172.split.us.new.preheader383:              ; preds = %middle.block331, %vector.memcheck365, %min.iters.checked334, %.lr.ph172.split.us.new.preheader
  %indvars.iv.us.ph = phi i64 [ %indvars.iv.us.unr.ph, %vector.memcheck365 ], [ %indvars.iv.us.unr.ph, %min.iters.checked334 ], [ %indvars.iv.us.unr.ph, %.lr.ph172.split.us.new.preheader ], [ %ind.end370, %middle.block331 ]
  br label %.lr.ph172.split.us.new

.lr.ph172.split.us.new:                           ; preds = %.lr.ph172.split.us.new.preheader383, %.lr.ph172.split.us.new
  %indvars.iv.us = phi i64 [ %indvars.iv.next.us.1, %.lr.ph172.split.us.new ], [ %indvars.iv.us.ph, %.lr.ph172.split.us.new.preheader383 ]
  %203 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv230.us, i64 %indvars.iv.us
  %204 = load float, float* %203, align 4
  %205 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv230.us, i64 %indvars.iv.us
  %206 = load float, float* %205, align 4
  %207 = fadd float %204, %206
  %208 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv230.us, i64 %indvars.iv.us
  store float %207, float* %208, align 4
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %209 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv230.us, i64 %indvars.iv.next.us
  %210 = load float, float* %209, align 4
  %211 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv230.us, i64 %indvars.iv.next.us
  %212 = load float, float* %211, align 4
  %213 = fadd float %210, %212
  %214 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv230.us, i64 %indvars.iv.next.us
  store float %213, float* %214, align 4
  %indvars.iv.next.us.1 = add nuw nsw i64 %indvars.iv.us, 2
  %exitcond.us.1 = icmp eq i64 %indvars.iv.next.us.1, 2160
  br i1 %exitcond.us.1, label %._crit_edge.us.loopexit, label %.lr.ph172.split.us.new, !llvm.loop !25

._crit_edge.us.loopexit:                          ; preds = %.lr.ph172.split.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block331, %.prol.loopexit
  %indvars.iv.next231.us = add nuw nsw i64 %indvars.iv230.us, 1
  %exitcond233.us = icmp eq i64 %indvars.iv.next231.us, 4096
  br i1 %exitcond233.us, label %._crit_edge173.loopexit, label %.lr.ph172.split.us

._crit_edge173.loopexit:                          ; preds = %._crit_edge.us
  br label %._crit_edge173

._crit_edge173:                                   ; preds = %._crit_edge173.loopexit, %.lr.ph204, %.lr.ph228, %.lr.ph217, %.lr.ph196, %.lr.ph185, %.lr.ph172, %._crit_edge186
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [2160 x float]* nocapture readonly) #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  br i1 true, label %.lr.ph16, label %._crit_edge17

.lr.ph16:                                         ; preds = %3
  br i1 true, label %.lr.ph16.split.us.preheader, label %._crit_edge17

.lr.ph16.split.us.preheader:                      ; preds = %.lr.ph16
  br label %.lr.ph16.split.us

.lr.ph16.split.us:                                ; preds = %.lr.ph16.split.us.preheader, %._crit_edge.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us ], [ 0, %.lr.ph16.split.us.preheader ]
  %8 = mul i64 %indvars.iv, 2160
  br label %9

; <label>:9:                                      ; preds = %16, %.lr.ph16.split.us
  %indvars.iv.us = phi i64 [ 0, %.lr.ph16.split.us ], [ %indvars.iv.next.us, %16 ]
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
  br i1 %exitcond, label %._crit_edge17.loopexit, label %.lr.ph16.split.us

._crit_edge17.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %.lr.ph16, %3
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #6
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
