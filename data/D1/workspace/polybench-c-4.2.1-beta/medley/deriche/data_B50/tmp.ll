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
  %4 = call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %5 = call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %6 = call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %7 = call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
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
.lr.ph15:
  store float 2.500000e-01, float* %0, align 4
  br label %.lr.ph15.split.us

.lr.ph15.split.us:                                ; preds = %._crit_edge.us, %.lr.ph15
  %indvars.iv17.us = phi i64 [ %indvars.iv.next18.us, %._crit_edge.us ], [ 0, %.lr.ph15 ]
  %2 = mul nuw nsw i64 %indvars.iv17.us, 313
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %2, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %.lr.ph15.split.us
  %index = phi i64 [ 0, %.lr.ph15.split.us ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %.lr.ph15.split.us ], [ %vec.ind.next, %vector.body ]
  %3 = mul nuw nsw <4 x i64> %vec.ind, <i64 991, i64 991, i64 991, i64 991>
  %4 = add nuw nsw <4 x i64> %broadcast.splat, %3
  %5 = trunc <4 x i64> %4 to <4 x i32>
  %6 = srem <4 x i32> %5, <i32 65536, i32 65536, i32 65536, i32 65536>
  %7 = sitofp <4 x i32> %6 to <4 x float>
  %8 = fdiv <4 x float> %7, <float 6.553500e+04, float 6.553500e+04, float 6.553500e+04, float 6.553500e+04>
  %9 = getelementptr inbounds [2160 x float], [2160 x float]* %1, i64 %indvars.iv17.us, i64 %index
  %10 = bitcast float* %9 to <4 x float>*
  store <4 x float> %8, <4 x float>* %10, align 4
  %index.next = add nuw nsw i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %11 = icmp eq i64 %index.next, 2160
  br i1 %11, label %._crit_edge.us, label %vector.body, !llvm.loop !1

._crit_edge.us:                                   ; preds = %vector.body
  %indvars.iv.next18.us = add nuw nsw i64 %indvars.iv17.us, 1
  %exitcond20.us = icmp eq i64 %indvars.iv.next18.us, 4096
  br i1 %exitcond20.us, label %._crit_edge16, label %.lr.ph15.split.us

._crit_edge16:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_deriche(float, [2160 x float]* nocapture readonly, [2160 x float]* nocapture, [2160 x float]* nocapture, [2160 x float]* nocapture) unnamed_addr #0 {
.lr.ph226:
  %5 = fsub float -0.000000e+00, %0
  %6 = call float @expf(float %5) #5
  %7 = fsub float 1.000000e+00, %6
  %8 = call float @expf(float %5) #5
  %9 = fsub float 1.000000e+00, %8
  %10 = fmul float %7, %9
  %11 = fmul float %0, 2.000000e+00
  %12 = call float @expf(float %5) #5
  %13 = fmul float %11, %12
  %14 = fadd float %13, 1.000000e+00
  %15 = call float @expf(float %11) #5
  %16 = fsub float %14, %15
  %17 = fdiv float %10, %16
  %18 = call float @expf(float %5) #5
  %19 = fmul float %17, %18
  %20 = call float @expf(float %5) #5
  %21 = fmul float %17, %20
  %22 = insertelement <2 x float> undef, float %0, i32 0
  %23 = shufflevector <2 x float> %22, <2 x float> undef, <2 x i32> zeroinitializer
  %24 = fadd <2 x float> %23, <float -1.000000e+00, float 1.000000e+00>
  %25 = insertelement <2 x float> undef, float %19, i32 0
  %26 = insertelement <2 x float> %25, float %21, i32 1
  %27 = fmul <2 x float> %26, %24
  %28 = extractelement <2 x float> %27, i32 0
  %29 = fmul float %0, -2.000000e+00
  %30 = call float @expf(float %29) #5
  %31 = fmul float %17, %30
  %exp2 = call float @llvm.exp2.f32(float %5)
  %32 = call float @expf(float %29) #5
  %33 = fsub float -0.000000e+00, %32
  %34 = insertelement <2 x float> undef, float %28, i32 0
  %35 = insertelement <2 x float> %34, float %17, i32 1
  br label %.lr.ph226.split.us

.lr.ph226.split.us:                               ; preds = %._crit_edge223.us, %.lr.ph226
  %indvars.iv264.us = phi i64 [ %indvars.iv.next265.us, %._crit_edge223.us ], [ 0, %.lr.ph226 ]
  br label %.lr.ph226.split.us.new

.lr.ph226.split.us.new:                           ; preds = %.lr.ph226.split.us.new, %.lr.ph226.split.us
  %indvars.iv260.us = phi i64 [ %indvars.iv.next261.us.1, %.lr.ph226.split.us.new ], [ 0, %.lr.ph226.split.us ]
  %.0155219.us = phi float [ %58, %.lr.ph226.split.us.new ], [ 0.000000e+00, %.lr.ph226.split.us ]
  %.0157218.us = phi float [ %56, %.lr.ph226.split.us.new ], [ 0.000000e+00, %.lr.ph226.split.us ]
  %.0159217.us = phi float [ %44, %.lr.ph226.split.us.new ], [ 0.000000e+00, %.lr.ph226.split.us ]
  %36 = getelementptr inbounds [2160 x float], [2160 x float]* %1, i64 %indvars.iv264.us, i64 %indvars.iv260.us
  %37 = load float, float* %36, align 4
  %38 = fmul float %17, %37
  %39 = fmul float %28, %.0155219.us
  %40 = fadd float %38, %39
  %41 = fmul float %exp2, %.0157218.us
  %42 = fadd float %40, %41
  %43 = fmul float %.0159217.us, %33
  %44 = fadd float %42, %43
  %45 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv264.us, i64 %indvars.iv260.us
  store float %44, float* %45, align 4
  %46 = bitcast float* %36 to <2 x float>*
  %indvars.iv.next261.us = or i64 %indvars.iv260.us, 1
  %47 = getelementptr inbounds [2160 x float], [2160 x float]* %1, i64 %indvars.iv264.us, i64 %indvars.iv.next261.us
  %48 = load <2 x float>, <2 x float>* %46, align 4
  %49 = fmul <2 x float> %35, %48
  %50 = extractelement <2 x float> %49, i32 0
  %51 = extractelement <2 x float> %49, i32 1
  %52 = fadd float %51, %50
  %53 = fmul float %exp2, %44
  %54 = fadd float %52, %53
  %55 = fmul float %.0157218.us, %33
  %56 = fadd float %54, %55
  %57 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv264.us, i64 %indvars.iv.next261.us
  store float %56, float* %57, align 4
  %58 = load float, float* %47, align 4
  %indvars.iv.next261.us.1 = add nuw nsw i64 %indvars.iv260.us, 2
  %exitcond263.us.1 = icmp eq i64 %indvars.iv.next261.us.1, 2160
  br i1 %exitcond263.us.1, label %._crit_edge223.us, label %.lr.ph226.split.us.new

._crit_edge223.us:                                ; preds = %.lr.ph226.split.us.new
  %indvars.iv.next265.us = add nuw nsw i64 %indvars.iv264.us, 1
  %exitcond267.us = icmp eq i64 %indvars.iv.next265.us, 4096
  br i1 %exitcond267.us, label %.lr.ph215.split.us.preheader, label %.lr.ph226.split.us

.lr.ph215.split.us.preheader:                     ; preds = %._crit_edge223.us
  %59 = extractelement <2 x float> %27, i32 1
  %60 = fsub float -0.000000e+00, %31
  br label %.lr.ph215.split.us

.lr.ph215.split.us:                               ; preds = %.lr.ph215.split.us.preheader, %._crit_edge212.us
  %indvars.iv256.us = phi i64 [ %indvars.iv.next257.us, %._crit_edge212.us ], [ 0, %.lr.ph215.split.us.preheader ]
  br label %61

; <label>:61:                                     ; preds = %61, %.lr.ph215.split.us
  %indvars.iv254.us = phi i64 [ 2159, %.lr.ph215.split.us ], [ %indvars.iv.next255.us.1, %61 ]
  %.0161208.us = phi float [ 0.000000e+00, %.lr.ph215.split.us ], [ %81, %61 ]
  %.0162207.us = phi float [ 0.000000e+00, %.lr.ph215.split.us ], [ %71, %61 ]
  %.0165206.us = phi float [ 0.000000e+00, %.lr.ph215.split.us ], [ %78, %61 ]
  %.0167205.us = phi float [ 0.000000e+00, %.lr.ph215.split.us ], [ %68, %61 ]
  %62 = fmul float %59, %.0161208.us
  %63 = fmul float %.0162207.us, %60
  %64 = fadd float %62, %63
  %65 = fmul float %exp2, %.0165206.us
  %66 = fadd float %64, %65
  %67 = fmul float %.0167205.us, %33
  %68 = fadd float %66, %67
  %69 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv256.us, i64 %indvars.iv254.us
  store float %68, float* %69, align 4
  %70 = getelementptr inbounds [2160 x float], [2160 x float]* %1, i64 %indvars.iv256.us, i64 %indvars.iv254.us
  %71 = load float, float* %70, align 4
  %indvars.iv.next255.us = add nsw i64 %indvars.iv254.us, -1
  %72 = fmul float %59, %71
  %73 = fmul float %.0161208.us, %60
  %74 = fadd float %72, %73
  %75 = fmul float %exp2, %68
  %76 = fadd float %74, %75
  %77 = fmul float %.0165206.us, %33
  %78 = fadd float %76, %77
  %79 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv256.us, i64 %indvars.iv.next255.us
  store float %78, float* %79, align 4
  %80 = getelementptr inbounds [2160 x float], [2160 x float]* %1, i64 %indvars.iv256.us, i64 %indvars.iv.next255.us
  %81 = load float, float* %80, align 4
  %indvars.iv.next255.us.1 = add nsw i64 %indvars.iv254.us, -2
  %82 = icmp sgt i64 %indvars.iv254.us, 1
  br i1 %82, label %61, label %._crit_edge212.us

._crit_edge212.us:                                ; preds = %61
  %indvars.iv.next257.us = add nuw nsw i64 %indvars.iv256.us, 1
  %exitcond259.us = icmp eq i64 %indvars.iv.next257.us, 4096
  br i1 %exitcond259.us, label %.lr.ph203.split.us.preheader, label %.lr.ph215.split.us

.lr.ph203.split.us.preheader:                     ; preds = %._crit_edge212.us
  br label %.lr.ph203.split.us

.lr.ph203.split.us:                               ; preds = %.lr.ph203.split.us.preheader, %._crit_edge200.us
  %indvars.iv250.us = phi i64 [ %indvars.iv.next251.us, %._crit_edge200.us ], [ 0, %.lr.ph203.split.us.preheader ]
  %scevgep = getelementptr [2160 x float], [2160 x float]* %2, i64 %indvars.iv250.us, i64 0
  %83 = add nuw nsw i64 %indvars.iv250.us, 1
  %scevgep3 = getelementptr [2160 x float], [2160 x float]* %2, i64 %83, i64 0
  %scevgep5 = getelementptr [2160 x float], [2160 x float]* %3, i64 %indvars.iv250.us, i64 0
  %scevgep7 = getelementptr [2160 x float], [2160 x float]* %3, i64 %83, i64 0
  %scevgep9 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv250.us, i64 0
  %scevgep11 = getelementptr [2160 x float], [2160 x float]* %4, i64 %83, i64 0
  %bound0 = icmp ult float* %scevgep, %scevgep7
  %bound1 = icmp ult float* %scevgep5, %scevgep3
  %found.conflict = and i1 %bound0, %bound1
  %bound013 = icmp ult float* %scevgep, %scevgep11
  %bound114 = icmp ult float* %scevgep9, %scevgep3
  %found.conflict15 = and i1 %bound013, %bound114
  %conflict.rdx = or i1 %found.conflict, %found.conflict15
  br i1 %conflict.rdx, label %.lr.ph203.split.us.new.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.lr.ph203.split.us
  br label %vector.body

.lr.ph203.split.us.new.preheader:                 ; preds = %.lr.ph203.split.us
  br label %.lr.ph203.split.us.new

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = shl i64 %index, 1
  %84 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv250.us, i64 %offset.idx
  %85 = bitcast float* %84 to <8 x float>*
  %wide.vec = load <8 x float>, <8 x float>* %85, align 4, !alias.scope !4
  %86 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv250.us, i64 %offset.idx
  %87 = bitcast float* %86 to <8 x float>*
  %wide.vec17 = load <8 x float>, <8 x float>* %87, align 4, !alias.scope !7
  %88 = fadd <8 x float> %wide.vec, %wide.vec17
  %89 = shufflevector <8 x float> %88, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %90 = or i64 %offset.idx, 1
  %91 = fadd <8 x float> %wide.vec, %wide.vec17
  %92 = shufflevector <8 x float> %91, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %93 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv250.us, i64 %90
  %94 = getelementptr float, float* %93, i64 -1
  %95 = bitcast float* %94 to <8 x float>*
  %interleaved.vec = shufflevector <4 x float> %89, <4 x float> %92, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec, <8 x float>* %95, align 4, !alias.scope !9, !noalias !11
  %index.next = add nuw nsw i64 %index, 4
  %96 = icmp eq i64 %index.next, 1080
  br i1 %96, label %._crit_edge200.us.loopexit65, label %vector.body, !llvm.loop !12

.lr.ph203.split.us.new:                           ; preds = %.lr.ph203.split.us.new.preheader, %.lr.ph203.split.us.new
  %indvars.iv246.us = phi i64 [ %indvars.iv.next247.us.1, %.lr.ph203.split.us.new ], [ 0, %.lr.ph203.split.us.new.preheader ]
  %97 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv250.us, i64 %indvars.iv246.us
  %98 = load float, float* %97, align 4
  %99 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv250.us, i64 %indvars.iv246.us
  %100 = load float, float* %99, align 4
  %101 = fadd float %98, %100
  %102 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv250.us, i64 %indvars.iv246.us
  store float %101, float* %102, align 4
  %indvars.iv.next247.us = or i64 %indvars.iv246.us, 1
  %103 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv250.us, i64 %indvars.iv.next247.us
  %104 = load float, float* %103, align 4
  %105 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv250.us, i64 %indvars.iv.next247.us
  %106 = load float, float* %105, align 4
  %107 = fadd float %104, %106
  %108 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv250.us, i64 %indvars.iv.next247.us
  store float %107, float* %108, align 4
  %indvars.iv.next247.us.1 = add nuw nsw i64 %indvars.iv246.us, 2
  %exitcond249.us.1 = icmp eq i64 %indvars.iv.next247.us.1, 2160
  br i1 %exitcond249.us.1, label %._crit_edge200.us.loopexit, label %.lr.ph203.split.us.new, !llvm.loop !13

._crit_edge200.us.loopexit:                       ; preds = %.lr.ph203.split.us.new
  br label %._crit_edge200.us

._crit_edge200.us.loopexit65:                     ; preds = %vector.body
  br label %._crit_edge200.us

._crit_edge200.us:                                ; preds = %._crit_edge200.us.loopexit65, %._crit_edge200.us.loopexit
  %indvars.iv.next251.us = add nuw nsw i64 %indvars.iv250.us, 1
  %exitcond253.us = icmp eq i64 %indvars.iv.next251.us, 4096
  br i1 %exitcond253.us, label %.lr.ph195.split.us.preheader, label %.lr.ph203.split.us

.lr.ph195.split.us.preheader:                     ; preds = %._crit_edge200.us
  br label %.lr.ph195.split.us

.lr.ph195.split.us:                               ; preds = %.lr.ph195.split.us.preheader, %._crit_edge192.us
  %indvars.iv242.us = phi i64 [ %indvars.iv.next243.us, %._crit_edge192.us ], [ 0, %.lr.ph195.split.us.preheader ]
  br label %.lr.ph195.split.us.new

.lr.ph195.split.us.new:                           ; preds = %.lr.ph195.split.us.new, %.lr.ph195.split.us
  %indvars.iv238.us = phi i64 [ %indvars.iv.next239.us.1, %.lr.ph195.split.us.new ], [ 0, %.lr.ph195.split.us ]
  %.0156188.us = phi float [ %130, %.lr.ph195.split.us.new ], [ 0.000000e+00, %.lr.ph195.split.us ]
  %.1158187.us = phi float [ %128, %.lr.ph195.split.us.new ], [ 0.000000e+00, %.lr.ph195.split.us ]
  %.1160186.us = phi float [ %117, %.lr.ph195.split.us.new ], [ 0.000000e+00, %.lr.ph195.split.us ]
  %109 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv238.us, i64 %indvars.iv242.us
  %110 = load float, float* %109, align 4
  %111 = fmul float %17, %110
  %112 = fmul float %28, %.0156188.us
  %113 = fadd float %111, %112
  %114 = fmul float %exp2, %.1158187.us
  %115 = fadd float %113, %114
  %116 = fmul float %.1160186.us, %33
  %117 = fadd float %115, %116
  %118 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv238.us, i64 %indvars.iv242.us
  store float %117, float* %118, align 4
  %119 = load float, float* %109, align 4
  %indvars.iv.next239.us = or i64 %indvars.iv238.us, 1
  %120 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv.next239.us, i64 %indvars.iv242.us
  %121 = load float, float* %120, align 4
  %122 = fmul float %17, %121
  %123 = fmul float %28, %119
  %124 = fadd float %122, %123
  %125 = fmul float %exp2, %117
  %126 = fadd float %124, %125
  %127 = fmul float %.1158187.us, %33
  %128 = fadd float %126, %127
  %129 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv.next239.us, i64 %indvars.iv242.us
  store float %128, float* %129, align 4
  %130 = load float, float* %120, align 4
  %indvars.iv.next239.us.1 = add nuw nsw i64 %indvars.iv238.us, 2
  %exitcond241.us.1 = icmp eq i64 %indvars.iv.next239.us.1, 4096
  br i1 %exitcond241.us.1, label %._crit_edge192.us, label %.lr.ph195.split.us.new

._crit_edge192.us:                                ; preds = %.lr.ph195.split.us.new
  %indvars.iv.next243.us = add nuw nsw i64 %indvars.iv242.us, 1
  %exitcond245.us = icmp eq i64 %indvars.iv.next243.us, 2160
  br i1 %exitcond245.us, label %.lr.ph184.split.us.preheader, label %.lr.ph195.split.us

.lr.ph184.split.us.preheader:                     ; preds = %._crit_edge192.us
  br label %.lr.ph184.split.us

.lr.ph184.split.us:                               ; preds = %.lr.ph184.split.us.preheader, %._crit_edge181.us
  %indvars.iv234.us = phi i64 [ %indvars.iv.next235.us, %._crit_edge181.us ], [ 0, %.lr.ph184.split.us.preheader ]
  br label %131

; <label>:131:                                    ; preds = %131, %.lr.ph184.split.us
  %indvars.iv232.us = phi i64 [ 4095, %.lr.ph184.split.us ], [ %indvars.iv.next233.us.1, %131 ]
  %.0163177.us = phi float [ 0.000000e+00, %.lr.ph184.split.us ], [ %151, %131 ]
  %.0164176.us = phi float [ 0.000000e+00, %.lr.ph184.split.us ], [ %141, %131 ]
  %.1166175.us = phi float [ 0.000000e+00, %.lr.ph184.split.us ], [ %148, %131 ]
  %.1168174.us = phi float [ 0.000000e+00, %.lr.ph184.split.us ], [ %138, %131 ]
  %132 = fmul float %59, %.0163177.us
  %133 = fmul float %.0164176.us, %60
  %134 = fadd float %132, %133
  %135 = fmul float %exp2, %.1166175.us
  %136 = fadd float %134, %135
  %137 = fmul float %.1168174.us, %33
  %138 = fadd float %136, %137
  %139 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv232.us, i64 %indvars.iv234.us
  store float %138, float* %139, align 4
  %140 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv232.us, i64 %indvars.iv234.us
  %141 = load float, float* %140, align 4
  %indvars.iv.next233.us = add nsw i64 %indvars.iv232.us, -1
  %142 = fmul float %59, %141
  %143 = fmul float %.0163177.us, %60
  %144 = fadd float %142, %143
  %145 = fmul float %exp2, %138
  %146 = fadd float %144, %145
  %147 = fmul float %.1166175.us, %33
  %148 = fadd float %146, %147
  %149 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next233.us, i64 %indvars.iv234.us
  store float %148, float* %149, align 4
  %150 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv.next233.us, i64 %indvars.iv234.us
  %151 = load float, float* %150, align 4
  %indvars.iv.next233.us.1 = add nsw i64 %indvars.iv232.us, -2
  %152 = icmp sgt i64 %indvars.iv232.us, 1
  br i1 %152, label %131, label %._crit_edge181.us

._crit_edge181.us:                                ; preds = %131
  %indvars.iv.next235.us = add nuw nsw i64 %indvars.iv234.us, 1
  %exitcond237.us = icmp eq i64 %indvars.iv.next235.us, 2160
  br i1 %exitcond237.us, label %.lr.ph172.split.us.preheader, label %.lr.ph184.split.us

.lr.ph172.split.us.preheader:                     ; preds = %._crit_edge181.us
  br label %.lr.ph172.split.us

.lr.ph172.split.us:                               ; preds = %.lr.ph172.split.us.preheader, %._crit_edge.us
  %indvars.iv228.us = phi i64 [ %indvars.iv.next229.us, %._crit_edge.us ], [ 0, %.lr.ph172.split.us.preheader ]
  %scevgep25 = getelementptr [2160 x float], [2160 x float]* %2, i64 %indvars.iv228.us, i64 0
  %153 = add nuw nsw i64 %indvars.iv228.us, 1
  %scevgep27 = getelementptr [2160 x float], [2160 x float]* %2, i64 %153, i64 0
  %scevgep29 = getelementptr [2160 x float], [2160 x float]* %3, i64 %indvars.iv228.us, i64 0
  %scevgep31 = getelementptr [2160 x float], [2160 x float]* %3, i64 %153, i64 0
  %scevgep33 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv228.us, i64 0
  %scevgep35 = getelementptr [2160 x float], [2160 x float]* %4, i64 %153, i64 0
  %bound037 = icmp ult float* %scevgep25, %scevgep31
  %bound138 = icmp ult float* %scevgep29, %scevgep27
  %found.conflict39 = and i1 %bound037, %bound138
  %bound040 = icmp ult float* %scevgep25, %scevgep35
  %bound141 = icmp ult float* %scevgep33, %scevgep27
  %found.conflict42 = and i1 %bound040, %bound141
  %conflict.rdx43 = or i1 %found.conflict39, %found.conflict42
  br i1 %conflict.rdx43, label %.lr.ph172.split.us.new.preheader, label %vector.body20.preheader

vector.body20.preheader:                          ; preds = %.lr.ph172.split.us
  br label %vector.body20

.lr.ph172.split.us.new.preheader:                 ; preds = %.lr.ph172.split.us
  br label %.lr.ph172.split.us.new

vector.body20:                                    ; preds = %vector.body20.preheader, %vector.body20
  %index47 = phi i64 [ %index.next48, %vector.body20 ], [ 0, %vector.body20.preheader ]
  %offset.idx51 = shl i64 %index47, 1
  %154 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv228.us, i64 %offset.idx51
  %155 = bitcast float* %154 to <8 x float>*
  %wide.vec55 = load <8 x float>, <8 x float>* %155, align 4, !alias.scope !14
  %156 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv228.us, i64 %offset.idx51
  %157 = bitcast float* %156 to <8 x float>*
  %wide.vec58 = load <8 x float>, <8 x float>* %157, align 4, !alias.scope !17
  %158 = fadd <8 x float> %wide.vec55, %wide.vec58
  %159 = shufflevector <8 x float> %158, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %160 = or i64 %offset.idx51, 1
  %161 = fadd <8 x float> %wide.vec55, %wide.vec58
  %162 = shufflevector <8 x float> %161, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %163 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv228.us, i64 %160
  %164 = getelementptr float, float* %163, i64 -1
  %165 = bitcast float* %164 to <8 x float>*
  %interleaved.vec61 = shufflevector <4 x float> %159, <4 x float> %162, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec61, <8 x float>* %165, align 4, !alias.scope !19, !noalias !21
  %index.next48 = add nuw nsw i64 %index47, 4
  %166 = icmp eq i64 %index.next48, 1080
  br i1 %166, label %._crit_edge.us.loopexit64, label %vector.body20, !llvm.loop !22

.lr.ph172.split.us.new:                           ; preds = %.lr.ph172.split.us.new.preheader, %.lr.ph172.split.us.new
  %indvars.iv.us = phi i64 [ %indvars.iv.next.us.1, %.lr.ph172.split.us.new ], [ 0, %.lr.ph172.split.us.new.preheader ]
  %167 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv228.us, i64 %indvars.iv.us
  %168 = load float, float* %167, align 4
  %169 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv228.us, i64 %indvars.iv.us
  %170 = load float, float* %169, align 4
  %171 = fadd float %168, %170
  %172 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv228.us, i64 %indvars.iv.us
  store float %171, float* %172, align 4
  %indvars.iv.next.us = or i64 %indvars.iv.us, 1
  %173 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv228.us, i64 %indvars.iv.next.us
  %174 = load float, float* %173, align 4
  %175 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv228.us, i64 %indvars.iv.next.us
  %176 = load float, float* %175, align 4
  %177 = fadd float %174, %176
  %178 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv228.us, i64 %indvars.iv.next.us
  store float %177, float* %178, align 4
  %indvars.iv.next.us.1 = add nuw nsw i64 %indvars.iv.us, 2
  %exitcond.us.1 = icmp eq i64 %indvars.iv.next.us.1, 2160
  br i1 %exitcond.us.1, label %._crit_edge.us.loopexit, label %.lr.ph172.split.us.new, !llvm.loop !23

._crit_edge.us.loopexit:                          ; preds = %.lr.ph172.split.us.new
  br label %._crit_edge.us

._crit_edge.us.loopexit64:                        ; preds = %vector.body20
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit64, %._crit_edge.us.loopexit
  %indvars.iv.next229.us = add nuw nsw i64 %indvars.iv228.us, 1
  %exitcond231.us = icmp eq i64 %indvars.iv.next229.us, 4096
  br i1 %exitcond231.us, label %._crit_edge173, label %.lr.ph172.split.us

._crit_edge173:                                   ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array([2160 x float]* nocapture readonly) unnamed_addr #0 {
.lr.ph15:
  %1 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %2 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %1) #6
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %3, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.lr.ph15.split.us

.lr.ph15.split.us:                                ; preds = %._crit_edge.us, %.lr.ph15
  %indvars.iv17.us = phi i64 [ %indvars.iv.next18.us, %._crit_edge.us ], [ 0, %.lr.ph15 ]
  %5 = mul nuw nsw i64 %indvars.iv17.us, 2160
  br label %6

; <label>:6:                                      ; preds = %._crit_edge, %.lr.ph15.split.us
  %indvars.iv.us = phi i64 [ 0, %.lr.ph15.split.us ], [ %indvars.iv.next.us, %._crit_edge ]
  %7 = add nuw nsw i64 %5, %indvars.iv.us
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %6
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %6, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [2160 x float], [2160 x float]* %0, i64 %indvars.iv17.us, i64 %indvars.iv.us
  %15 = load float, float* %14, align 4
  %16 = fpext float %15 to double
  %17 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 2160
  br i1 %exitcond.us, label %._crit_edge.us, label %6

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next18.us = add nuw nsw i64 %indvars.iv17.us, 1
  %exitcond20.us = icmp eq i64 %indvars.iv.next18.us, 4096
  br i1 %exitcond20.us, label %._crit_edge16, label %.lr.ph15.split.us

._crit_edge16:                                    ; preds = %._crit_edge.us
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %20) #6
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
