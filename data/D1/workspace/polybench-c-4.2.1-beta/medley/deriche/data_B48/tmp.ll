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
  br i1 true, label %.lr.ph5, label %._crit_edge6

.lr.ph5:                                          ; preds = %4
  br i1 true, label %.lr.ph5.split.us.preheader, label %._crit_edge6

.lr.ph5.split.us.preheader:                       ; preds = %.lr.ph5
  br label %.lr.ph5.split.us

.lr.ph5.split.us:                                 ; preds = %.lr.ph5.split.us.preheader, %._crit_edge.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us ], [ 0, %.lr.ph5.split.us.preheader ]
  %5 = mul nuw nsw i64 %indvars.iv, 313
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
  %exitcond10 = icmp eq i64 %indvars.iv.next, 4096
  br i1 %exitcond10, label %._crit_edge6.loopexit, label %.lr.ph5.split.us

._crit_edge6.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit, %.lr.ph5, %4
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
  br i1 true, label %.lr.ph226, label %._crit_edge204

.lr.ph226:                                        ; preds = %7
  br i1 true, label %.lr.ph226.split.us.preheader, label %._crit_edge173

.lr.ph226.split.us.preheader:                     ; preds = %.lr.ph226
  %39 = insertelement <2 x float> undef, float %31, i32 0
  %40 = insertelement <2 x float> %39, float %20, i32 1
  br label %.lr.ph226.split.us

.lr.ph226.split.us:                               ; preds = %.lr.ph226.split.us.preheader, %._crit_edge223.us
  %indvars.iv264.us = phi i64 [ %indvars.iv.next265.us, %._crit_edge223.us ], [ 0, %.lr.ph226.split.us.preheader ]
  br i1 true, label %.prol.loopexit284, label %.prol.preheader283

.prol.preheader283:                               ; preds = %.lr.ph226.split.us
  br label %.prol.loopexit284

.prol.loopexit284:                                ; preds = %.prol.preheader283, %.lr.ph226.split.us
  %indvars.iv260.us.unr.ph = phi i64 [ 1, %.prol.preheader283 ], [ 0, %.lr.ph226.split.us ]
  br i1 false, label %._crit_edge223.us, label %.lr.ph226.split.us.new.preheader

.lr.ph226.split.us.new.preheader:                 ; preds = %.prol.loopexit284
  br label %.lr.ph226.split.us.new

.lr.ph226.split.us.new:                           ; preds = %.lr.ph226.split.us.new.preheader, %.lr.ph226.split.us.new
  %indvars.iv260.us = phi i64 [ %indvars.iv.next261.us.1, %.lr.ph226.split.us.new ], [ %indvars.iv260.us.unr.ph, %.lr.ph226.split.us.new.preheader ]
  %.0155219.us = phi float [ %63, %.lr.ph226.split.us.new ], [ 0.000000e+00, %.lr.ph226.split.us.new.preheader ]
  %.0157218.us = phi float [ %61, %.lr.ph226.split.us.new ], [ 0.000000e+00, %.lr.ph226.split.us.new.preheader ]
  %.0159217.us = phi float [ %49, %.lr.ph226.split.us.new ], [ 0.000000e+00, %.lr.ph226.split.us.new.preheader ]
  %41 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv264.us, i64 %indvars.iv260.us
  %42 = load float, float* %41, align 4
  %43 = fmul float %20, %42
  %44 = fmul float %31, %.0155219.us
  %45 = fadd float %44, %43
  %46 = fmul float %exp2, %.0157218.us
  %47 = fadd float %46, %45
  %48 = fmul float %.0159217.us, %38
  %49 = fadd float %48, %47
  %50 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv264.us, i64 %indvars.iv260.us
  store float %49, float* %50, align 4
  %51 = bitcast float* %41 to <2 x float>*
  %indvars.iv.next261.us = add nuw nsw i64 %indvars.iv260.us, 1
  %52 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv264.us, i64 %indvars.iv.next261.us
  %53 = load <2 x float>, <2 x float>* %51, align 4
  %54 = fmul <2 x float> %40, %53
  %55 = extractelement <2 x float> %54, i32 0
  %56 = extractelement <2 x float> %54, i32 1
  %57 = fadd float %55, %56
  %58 = fmul float %exp2, %49
  %59 = fadd float %58, %57
  %60 = fmul float %.0157218.us, %38
  %61 = fadd float %60, %59
  %62 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv264.us, i64 %indvars.iv.next261.us
  store float %61, float* %62, align 4
  %63 = load float, float* %52, align 4
  %indvars.iv.next261.us.1 = add nuw nsw i64 %indvars.iv260.us, 2
  %exitcond263.us.1 = icmp eq i64 %indvars.iv.next261.us.1, 2160
  br i1 %exitcond263.us.1, label %._crit_edge223.us.loopexit, label %.lr.ph226.split.us.new

._crit_edge223.us.loopexit:                       ; preds = %.lr.ph226.split.us.new
  br label %._crit_edge223.us

._crit_edge223.us:                                ; preds = %._crit_edge223.us.loopexit, %.prol.loopexit284
  %indvars.iv.next265.us = add nuw nsw i64 %indvars.iv264.us, 1
  %exitcond267.us = icmp eq i64 %indvars.iv.next265.us, 4096
  br i1 %exitcond267.us, label %.lr.ph215, label %.lr.ph226.split.us

.lr.ph215:                                        ; preds = %._crit_edge223.us
  br label %.lr.ph215.split.us

.lr.ph215.split.us:                               ; preds = %.lr.ph215, %._crit_edge212.us
  %indvars.iv256.us = phi i64 [ %indvars.iv.next257.us, %._crit_edge212.us ], [ 0, %.lr.ph215 ]
  br label %64

; <label>:64:                                     ; preds = %64, %.lr.ph215.split.us
  %indvars.iv254.us = phi i64 [ 2159, %.lr.ph215.split.us ], [ %indvars.iv.next255.us.1, %64 ]
  %.0161208.us = phi float [ 0.000000e+00, %.lr.ph215.split.us ], [ %84, %64 ]
  %.0162207.us = phi float [ 0.000000e+00, %.lr.ph215.split.us ], [ %74, %64 ]
  %.0165206.us = phi float [ 0.000000e+00, %.lr.ph215.split.us ], [ %81, %64 ]
  %.0167205.us = phi float [ 0.000000e+00, %.lr.ph215.split.us ], [ %71, %64 ]
  %65 = fmul float %32, %.0161208.us
  %66 = fmul float %.0162207.us, %36
  %67 = fadd float %66, %65
  %68 = fmul float %exp2, %.0165206.us
  %69 = fadd float %68, %67
  %70 = fmul float %.0167205.us, %38
  %71 = fadd float %70, %69
  %72 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv256.us, i64 %indvars.iv254.us
  store float %71, float* %72, align 4
  %73 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv256.us, i64 %indvars.iv254.us
  %74 = load float, float* %73, align 4
  %indvars.iv.next255.us = add nsw i64 %indvars.iv254.us, -1
  %75 = fmul float %32, %74
  %76 = fmul float %.0161208.us, %36
  %77 = fadd float %76, %75
  %78 = fmul float %exp2, %71
  %79 = fadd float %78, %77
  %80 = fmul float %.0165206.us, %38
  %81 = fadd float %80, %79
  %82 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv256.us, i64 %indvars.iv.next255.us
  store float %81, float* %82, align 4
  %83 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv256.us, i64 %indvars.iv.next255.us
  %84 = load float, float* %83, align 4
  %indvars.iv.next255.us.1 = add nsw i64 %indvars.iv254.us, -2
  %85 = icmp sgt i64 %indvars.iv254.us, 1
  br i1 %85, label %64, label %._crit_edge212.us

._crit_edge212.us:                                ; preds = %64
  %indvars.iv.next257.us = add nuw nsw i64 %indvars.iv256.us, 1
  %exitcond259.us = icmp eq i64 %indvars.iv.next257.us, 4096
  br i1 %exitcond259.us, label %.lr.ph203.split.us.preheader, label %.lr.ph215.split.us

.lr.ph203.split.us.preheader:                     ; preds = %._crit_edge212.us
  br label %.lr.ph203.split.us

.lr.ph203.split.us:                               ; preds = %.lr.ph203.split.us.preheader, %._crit_edge200.us
  %indvars.iv250.us = phi i64 [ %indvars.iv.next251.us, %._crit_edge200.us ], [ 0, %.lr.ph203.split.us.preheader ]
  %scevgep296 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv250.us, i64 2
  %scevgep302 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv250.us, i64 2
  %scevgep308 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv250.us, i64 2
  br i1 true, label %.prol.loopexit280, label %.prol.preheader279

.prol.preheader279:                               ; preds = %.lr.ph203.split.us
  br label %.prol.loopexit280

.prol.loopexit280:                                ; preds = %.prol.preheader279, %.lr.ph203.split.us
  %indvars.iv246.us.unr.ph = phi i64 [ 1, %.prol.preheader279 ], [ 0, %.lr.ph203.split.us ]
  br i1 false, label %._crit_edge200.us, label %.lr.ph203.split.us.new.preheader

.lr.ph203.split.us.new.preheader:                 ; preds = %.prol.loopexit280
  %86 = sub nsw i64 2158, %indvars.iv246.us.unr.ph
  %87 = lshr i64 %86, 1
  %88 = add nuw nsw i64 %87, 1
  br i1 false, label %.lr.ph203.split.us.new.preheader372, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph203.split.us.new.preheader
  %n.mod.vf = and i64 %88, 3
  %n.vec = sub nsw i64 %88, %n.mod.vf
  br i1 false, label %.lr.ph203.split.us.new.preheader372, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep294 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv250.us, i64 %indvars.iv246.us.unr.ph
  %89 = sub nsw i64 2158, %indvars.iv246.us.unr.ph
  %90 = and i64 %89, 2158
  %91 = or i64 %indvars.iv246.us.unr.ph, %90
  %scevgep297 = getelementptr float, float* %scevgep296, i64 %91
  %scevgep300 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv250.us, i64 %indvars.iv246.us.unr.ph
  %scevgep303 = getelementptr float, float* %scevgep302, i64 %91
  %scevgep306 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv250.us, i64 %indvars.iv246.us.unr.ph
  %scevgep309 = getelementptr float, float* %scevgep308, i64 %91
  %bound0 = icmp ult float* %scevgep294, %scevgep303
  %bound1 = icmp ult float* %scevgep300, %scevgep297
  %found.conflict = and i1 %bound0, %bound1
  %bound0311 = icmp ult float* %scevgep294, %scevgep309
  %bound1312 = icmp ult float* %scevgep306, %scevgep297
  %found.conflict313 = and i1 %bound0311, %bound1312
  %conflict.rdx = or i1 %found.conflict, %found.conflict313
  %92 = or i64 %indvars.iv246.us.unr.ph, 2
  %93 = shl nuw nsw i64 %87, 1
  %94 = add nuw nsw i64 %92, %93
  %95 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub nsw i64 %94, %95
  br i1 %conflict.rdx, label %.lr.ph203.split.us.new.preheader372, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %96 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv246.us.unr.ph, %96
  %97 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv250.us, i64 %offset.idx
  %98 = bitcast float* %97 to <8 x float>*
  %wide.vec = load <8 x float>, <8 x float>* %98, align 4, !alias.scope !6
  %99 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv250.us, i64 %offset.idx
  %100 = bitcast float* %99 to <8 x float>*
  %wide.vec315 = load <8 x float>, <8 x float>* %100, align 4, !alias.scope !9
  %101 = fadd <8 x float> %wide.vec, %wide.vec315
  %102 = shufflevector <8 x float> %101, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %103 = add nuw nsw i64 %offset.idx, 1
  %104 = fadd <8 x float> %wide.vec, %wide.vec315
  %105 = shufflevector <8 x float> %104, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %106 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv250.us, i64 %103
  %107 = getelementptr float, float* %106, i64 -1
  %108 = bitcast float* %107 to <8 x float>*
  %interleaved.vec = shufflevector <4 x float> %102, <4 x float> %105, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec, <8 x float>* %108, align 4, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %109 = icmp eq i64 %index.next, %n.vec
  br i1 %109, label %middle.block, label %vector.body, !llvm.loop !14

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge200.us, label %.lr.ph203.split.us.new.preheader372

.lr.ph203.split.us.new.preheader372:              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph203.split.us.new.preheader
  %indvars.iv246.us.ph = phi i64 [ %indvars.iv246.us.unr.ph, %vector.memcheck ], [ %indvars.iv246.us.unr.ph, %min.iters.checked ], [ %indvars.iv246.us.unr.ph, %.lr.ph203.split.us.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph203.split.us.new

.lr.ph203.split.us.new:                           ; preds = %.lr.ph203.split.us.new.preheader372, %.lr.ph203.split.us.new
  %indvars.iv246.us = phi i64 [ %indvars.iv.next247.us.1, %.lr.ph203.split.us.new ], [ %indvars.iv246.us.ph, %.lr.ph203.split.us.new.preheader372 ]
  %110 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv250.us, i64 %indvars.iv246.us
  %111 = load float, float* %110, align 4
  %112 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv250.us, i64 %indvars.iv246.us
  %113 = load float, float* %112, align 4
  %114 = fadd float %111, %113
  %115 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv250.us, i64 %indvars.iv246.us
  store float %114, float* %115, align 4
  %indvars.iv.next247.us = add nuw nsw i64 %indvars.iv246.us, 1
  %116 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv250.us, i64 %indvars.iv.next247.us
  %117 = load float, float* %116, align 4
  %118 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv250.us, i64 %indvars.iv.next247.us
  %119 = load float, float* %118, align 4
  %120 = fadd float %117, %119
  %121 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv250.us, i64 %indvars.iv.next247.us
  store float %120, float* %121, align 4
  %indvars.iv.next247.us.1 = add nsw i64 %indvars.iv246.us, 2
  %exitcond249.us.1 = icmp eq i64 %indvars.iv.next247.us.1, 2160
  br i1 %exitcond249.us.1, label %._crit_edge200.us.loopexit, label %.lr.ph203.split.us.new, !llvm.loop !15

._crit_edge200.us.loopexit:                       ; preds = %.lr.ph203.split.us.new
  br label %._crit_edge200.us

._crit_edge200.us:                                ; preds = %._crit_edge200.us.loopexit, %middle.block, %.prol.loopexit280
  %indvars.iv.next251.us = add nuw nsw i64 %indvars.iv250.us, 1
  %exitcond253.us = icmp eq i64 %indvars.iv.next251.us, 4096
  br i1 %exitcond253.us, label %._crit_edge204.loopexit, label %.lr.ph203.split.us

._crit_edge204.loopexit:                          ; preds = %._crit_edge200.us
  br label %._crit_edge204

._crit_edge204:                                   ; preds = %._crit_edge204.loopexit, %7
  br i1 true, label %.lr.ph195, label %._crit_edge185

.lr.ph195:                                        ; preds = %._crit_edge204
  br i1 true, label %.lr.ph195.split.us.preheader, label %._crit_edge173

.lr.ph195.split.us.preheader:                     ; preds = %.lr.ph195
  br label %.lr.ph195.split.us

.lr.ph195.split.us:                               ; preds = %.lr.ph195.split.us.preheader, %._crit_edge192.us
  %indvars.iv242.us = phi i64 [ %indvars.iv.next243.us, %._crit_edge192.us ], [ 0, %.lr.ph195.split.us.preheader ]
  br i1 true, label %.prol.loopexit276, label %.prol.preheader275

.prol.preheader275:                               ; preds = %.lr.ph195.split.us
  br label %.prol.loopexit276

.prol.loopexit276:                                ; preds = %.prol.preheader275, %.lr.ph195.split.us
  %indvars.iv238.us.unr.ph = phi i64 [ 1, %.prol.preheader275 ], [ 0, %.lr.ph195.split.us ]
  br i1 false, label %._crit_edge192.us, label %.lr.ph195.split.us.new.preheader

.lr.ph195.split.us.new.preheader:                 ; preds = %.prol.loopexit276
  br label %.lr.ph195.split.us.new

.lr.ph195.split.us.new:                           ; preds = %.lr.ph195.split.us.new.preheader, %.lr.ph195.split.us.new
  %indvars.iv238.us = phi i64 [ %indvars.iv.next239.us.1, %.lr.ph195.split.us.new ], [ %indvars.iv238.us.unr.ph, %.lr.ph195.split.us.new.preheader ]
  %.0156188.us = phi float [ %143, %.lr.ph195.split.us.new ], [ 0.000000e+00, %.lr.ph195.split.us.new.preheader ]
  %.1158187.us = phi float [ %141, %.lr.ph195.split.us.new ], [ 0.000000e+00, %.lr.ph195.split.us.new.preheader ]
  %.1160186.us = phi float [ %130, %.lr.ph195.split.us.new ], [ 0.000000e+00, %.lr.ph195.split.us.new.preheader ]
  %122 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv238.us, i64 %indvars.iv242.us
  %123 = load float, float* %122, align 4
  %124 = fmul float %20, %123
  %125 = fmul float %31, %.0156188.us
  %126 = fadd float %125, %124
  %127 = fmul float %exp2, %.1158187.us
  %128 = fadd float %127, %126
  %129 = fmul float %.1160186.us, %38
  %130 = fadd float %129, %128
  %131 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv238.us, i64 %indvars.iv242.us
  store float %130, float* %131, align 4
  %132 = load float, float* %122, align 4
  %indvars.iv.next239.us = add nuw nsw i64 %indvars.iv238.us, 1
  %133 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next239.us, i64 %indvars.iv242.us
  %134 = load float, float* %133, align 4
  %135 = fmul float %20, %134
  %136 = fmul float %31, %132
  %137 = fadd float %136, %135
  %138 = fmul float %exp2, %130
  %139 = fadd float %138, %137
  %140 = fmul float %.1158187.us, %38
  %141 = fadd float %140, %139
  %142 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv.next239.us, i64 %indvars.iv242.us
  store float %141, float* %142, align 4
  %143 = load float, float* %133, align 4
  %indvars.iv.next239.us.1 = add nuw nsw i64 %indvars.iv238.us, 2
  %exitcond241.us.1 = icmp eq i64 %indvars.iv.next239.us.1, 4096
  br i1 %exitcond241.us.1, label %._crit_edge192.us.loopexit, label %.lr.ph195.split.us.new

._crit_edge192.us.loopexit:                       ; preds = %.lr.ph195.split.us.new
  br label %._crit_edge192.us

._crit_edge192.us:                                ; preds = %._crit_edge192.us.loopexit, %.prol.loopexit276
  %indvars.iv.next243.us = add nuw nsw i64 %indvars.iv242.us, 1
  %exitcond245.us = icmp eq i64 %indvars.iv.next243.us, 2160
  br i1 %exitcond245.us, label %.lr.ph184, label %.lr.ph195.split.us

.lr.ph184:                                        ; preds = %._crit_edge192.us
  br label %.lr.ph184.split.us

.lr.ph184.split.us:                               ; preds = %.lr.ph184, %._crit_edge181.us
  %indvars.iv234.us = phi i64 [ %indvars.iv.next235.us, %._crit_edge181.us ], [ 0, %.lr.ph184 ]
  br label %144

; <label>:144:                                    ; preds = %144, %.lr.ph184.split.us
  %indvars.iv232.us = phi i64 [ 4095, %.lr.ph184.split.us ], [ %indvars.iv.next233.us.1, %144 ]
  %.0163177.us = phi float [ 0.000000e+00, %.lr.ph184.split.us ], [ %164, %144 ]
  %.0164176.us = phi float [ 0.000000e+00, %.lr.ph184.split.us ], [ %154, %144 ]
  %.1166175.us = phi float [ 0.000000e+00, %.lr.ph184.split.us ], [ %161, %144 ]
  %.1168174.us = phi float [ 0.000000e+00, %.lr.ph184.split.us ], [ %151, %144 ]
  %145 = fmul float %32, %.0163177.us
  %146 = fmul float %.0164176.us, %36
  %147 = fadd float %146, %145
  %148 = fmul float %exp2, %.1166175.us
  %149 = fadd float %148, %147
  %150 = fmul float %.1168174.us, %38
  %151 = fadd float %150, %149
  %152 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv232.us, i64 %indvars.iv234.us
  store float %151, float* %152, align 4
  %153 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv232.us, i64 %indvars.iv234.us
  %154 = load float, float* %153, align 4
  %indvars.iv.next233.us = add nsw i64 %indvars.iv232.us, -1
  %155 = fmul float %32, %154
  %156 = fmul float %.0163177.us, %36
  %157 = fadd float %156, %155
  %158 = fmul float %exp2, %151
  %159 = fadd float %158, %157
  %160 = fmul float %.1166175.us, %38
  %161 = fadd float %160, %159
  %162 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv.next233.us, i64 %indvars.iv234.us
  store float %161, float* %162, align 4
  %163 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next233.us, i64 %indvars.iv234.us
  %164 = load float, float* %163, align 4
  %indvars.iv.next233.us.1 = add nsw i64 %indvars.iv232.us, -2
  %165 = icmp sgt i64 %indvars.iv232.us, 1
  br i1 %165, label %144, label %._crit_edge181.us

._crit_edge181.us:                                ; preds = %144
  %indvars.iv.next235.us = add nuw nsw i64 %indvars.iv234.us, 1
  %exitcond237.us = icmp eq i64 %indvars.iv.next235.us, 2160
  br i1 %exitcond237.us, label %._crit_edge185.loopexit, label %.lr.ph184.split.us

._crit_edge185.loopexit:                          ; preds = %._crit_edge181.us
  br label %._crit_edge185

._crit_edge185:                                   ; preds = %._crit_edge185.loopexit, %._crit_edge204
  br i1 true, label %.lr.ph172, label %._crit_edge173

.lr.ph172:                                        ; preds = %._crit_edge185
  br i1 true, label %.lr.ph172.split.us.preheader, label %._crit_edge173

.lr.ph172.split.us.preheader:                     ; preds = %.lr.ph172
  br label %.lr.ph172.split.us

.lr.ph172.split.us:                               ; preds = %.lr.ph172.split.us.preheader, %._crit_edge.us
  %indvars.iv228.us = phi i64 [ %indvars.iv.next229.us, %._crit_edge.us ], [ 0, %.lr.ph172.split.us.preheader ]
  %scevgep330 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv228.us, i64 2
  %scevgep336 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv228.us, i64 2
  %scevgep342 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv228.us, i64 2
  br i1 true, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph172.split.us
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph172.split.us
  %indvars.iv.us.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph172.split.us ]
  br i1 false, label %._crit_edge.us, label %.lr.ph172.split.us.new.preheader

.lr.ph172.split.us.new.preheader:                 ; preds = %.prol.loopexit
  %166 = sub nsw i64 2158, %indvars.iv.us.unr.ph
  %167 = lshr i64 %166, 1
  %168 = add nuw nsw i64 %167, 1
  br i1 false, label %.lr.ph172.split.us.new.preheader371, label %min.iters.checked322

min.iters.checked322:                             ; preds = %.lr.ph172.split.us.new.preheader
  %n.mod.vf323 = and i64 %168, 3
  %n.vec324 = sub nsw i64 %168, %n.mod.vf323
  br i1 false, label %.lr.ph172.split.us.new.preheader371, label %vector.memcheck353

vector.memcheck353:                               ; preds = %min.iters.checked322
  %scevgep328 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv228.us, i64 %indvars.iv.us.unr.ph
  %169 = sub nsw i64 2158, %indvars.iv.us.unr.ph
  %170 = and i64 %169, 2158
  %171 = or i64 %indvars.iv.us.unr.ph, %170
  %scevgep331 = getelementptr float, float* %scevgep330, i64 %171
  %scevgep334 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv228.us, i64 %indvars.iv.us.unr.ph
  %scevgep337 = getelementptr float, float* %scevgep336, i64 %171
  %scevgep340 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv228.us, i64 %indvars.iv.us.unr.ph
  %scevgep343 = getelementptr float, float* %scevgep342, i64 %171
  %bound0345 = icmp ult float* %scevgep328, %scevgep337
  %bound1346 = icmp ult float* %scevgep334, %scevgep331
  %found.conflict347 = and i1 %bound0345, %bound1346
  %bound0348 = icmp ult float* %scevgep328, %scevgep343
  %bound1349 = icmp ult float* %scevgep340, %scevgep331
  %found.conflict350 = and i1 %bound0348, %bound1349
  %conflict.rdx351 = or i1 %found.conflict347, %found.conflict350
  %172 = or i64 %indvars.iv.us.unr.ph, 2
  %173 = shl nuw nsw i64 %167, 1
  %174 = add nuw nsw i64 %172, %173
  %175 = shl nuw nsw i64 %n.mod.vf323, 1
  %ind.end358 = sub nsw i64 %174, %175
  br i1 %conflict.rdx351, label %.lr.ph172.split.us.new.preheader371, label %vector.body318.preheader

vector.body318.preheader:                         ; preds = %vector.memcheck353
  br label %vector.body318

vector.body318:                                   ; preds = %vector.body318.preheader, %vector.body318
  %index355 = phi i64 [ %index.next356, %vector.body318 ], [ 0, %vector.body318.preheader ]
  %176 = shl i64 %index355, 1
  %offset.idx360 = or i64 %indvars.iv.us.unr.ph, %176
  %177 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv228.us, i64 %offset.idx360
  %178 = bitcast float* %177 to <8 x float>*
  %wide.vec364 = load <8 x float>, <8 x float>* %178, align 4, !alias.scope !16
  %179 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv228.us, i64 %offset.idx360
  %180 = bitcast float* %179 to <8 x float>*
  %wide.vec367 = load <8 x float>, <8 x float>* %180, align 4, !alias.scope !19
  %181 = fadd <8 x float> %wide.vec364, %wide.vec367
  %182 = shufflevector <8 x float> %181, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %183 = add nuw nsw i64 %offset.idx360, 1
  %184 = fadd <8 x float> %wide.vec364, %wide.vec367
  %185 = shufflevector <8 x float> %184, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %186 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv228.us, i64 %183
  %187 = getelementptr float, float* %186, i64 -1
  %188 = bitcast float* %187 to <8 x float>*
  %interleaved.vec370 = shufflevector <4 x float> %182, <4 x float> %185, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec370, <8 x float>* %188, align 4, !alias.scope !21, !noalias !23
  %index.next356 = add i64 %index355, 4
  %189 = icmp eq i64 %index.next356, %n.vec324
  br i1 %189, label %middle.block319, label %vector.body318, !llvm.loop !24

middle.block319:                                  ; preds = %vector.body318
  %cmp.n359 = icmp eq i64 %n.mod.vf323, 0
  br i1 %cmp.n359, label %._crit_edge.us, label %.lr.ph172.split.us.new.preheader371

.lr.ph172.split.us.new.preheader371:              ; preds = %middle.block319, %vector.memcheck353, %min.iters.checked322, %.lr.ph172.split.us.new.preheader
  %indvars.iv.us.ph = phi i64 [ %indvars.iv.us.unr.ph, %vector.memcheck353 ], [ %indvars.iv.us.unr.ph, %min.iters.checked322 ], [ %indvars.iv.us.unr.ph, %.lr.ph172.split.us.new.preheader ], [ %ind.end358, %middle.block319 ]
  br label %.lr.ph172.split.us.new

.lr.ph172.split.us.new:                           ; preds = %.lr.ph172.split.us.new.preheader371, %.lr.ph172.split.us.new
  %indvars.iv.us = phi i64 [ %indvars.iv.next.us.1, %.lr.ph172.split.us.new ], [ %indvars.iv.us.ph, %.lr.ph172.split.us.new.preheader371 ]
  %190 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv228.us, i64 %indvars.iv.us
  %191 = load float, float* %190, align 4
  %192 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv228.us, i64 %indvars.iv.us
  %193 = load float, float* %192, align 4
  %194 = fadd float %191, %193
  %195 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv228.us, i64 %indvars.iv.us
  store float %194, float* %195, align 4
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %196 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv228.us, i64 %indvars.iv.next.us
  %197 = load float, float* %196, align 4
  %198 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv228.us, i64 %indvars.iv.next.us
  %199 = load float, float* %198, align 4
  %200 = fadd float %197, %199
  %201 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv228.us, i64 %indvars.iv.next.us
  store float %200, float* %201, align 4
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv.us, 2
  %exitcond.us.1 = icmp eq i64 %indvars.iv.next.us.1, 2160
  br i1 %exitcond.us.1, label %._crit_edge.us.loopexit, label %.lr.ph172.split.us.new, !llvm.loop !25

._crit_edge.us.loopexit:                          ; preds = %.lr.ph172.split.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block319, %.prol.loopexit
  %indvars.iv.next229.us = add nuw nsw i64 %indvars.iv228.us, 1
  %exitcond231.us = icmp eq i64 %indvars.iv.next229.us, 4096
  br i1 %exitcond231.us, label %._crit_edge173.loopexit, label %.lr.ph172.split.us

._crit_edge173.loopexit:                          ; preds = %._crit_edge.us
  br label %._crit_edge173

._crit_edge173:                                   ; preds = %._crit_edge173.loopexit, %.lr.ph195, %.lr.ph226, %.lr.ph172, %._crit_edge185
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
  br i1 true, label %.lr.ph16, label %._crit_edge17

.lr.ph16:                                         ; preds = %3
  br i1 true, label %.lr.ph16.split.us.preheader, label %._crit_edge17

.lr.ph16.split.us.preheader:                      ; preds = %.lr.ph16
  br label %.lr.ph16.split.us

.lr.ph16.split.us:                                ; preds = %._crit_edge.us, %.lr.ph16.split.us.preheader
  %indvars.iv = phi i64 [ 0, %.lr.ph16.split.us.preheader ], [ %indvars.iv.next, %._crit_edge.us ]
  %8 = mul nsw i64 %indvars.iv, 2160
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
  %exitcond21 = icmp eq i64 %indvars.iv.next, 4096
  br i1 %exitcond21, label %._crit_edge17.loopexit, label %.lr.ph16.split.us

._crit_edge17.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge17.loopexit, %.lr.ph16, %3
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
