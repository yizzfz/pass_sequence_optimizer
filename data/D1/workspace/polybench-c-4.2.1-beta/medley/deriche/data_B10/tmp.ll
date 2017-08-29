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
  tail call void (...) @polybench_timer_start() #5
  %9 = load float, float* %3, align 4
  %10 = bitcast i8* %5 to [2160 x float]*
  %11 = bitcast i8* %6 to [2160 x float]*
  %12 = bitcast i8* %7 to [2160 x float]*
  tail call fastcc void @kernel_deriche(i32 4096, i32 2160, float %9, [2160 x float]* %8, [2160 x float]* %10, [2160 x float]* %11, [2160 x float]* %12)
  tail call void (...) @polybench_timer_stop() #5
  tail call void (...) @polybench_timer_print() #5
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %19

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to [2160 x float]*
  tail call fastcc void @print_array(i32 4096, i32 2160, [2160 x float]* %18)
  br label %19

; <label>:19:                                     ; preds = %14, %17, %2
  tail call void @free(i8* %4) #5
  tail call void @free(i8* %5) #5
  tail call void @free(i8* %6) #5
  tail call void @free(i8* %7) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, float* nocapture, [2160 x float]* nocapture) unnamed_addr #2 {
  store float 2.500000e-01, float* %2, align 4
  br i1 true, label %.preheader.us.preheader, label %._crit_edge4

.preheader.us.preheader:                          ; preds = %4
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %5 = mul nuw nsw i64 %indvars.iv6, 313
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
  %7 = add nuw nsw <4 x i64> %6, %broadcast.splat
  %8 = trunc <4 x i64> %7 to <4 x i32>
  %9 = srem <4 x i32> %8, <i32 65536, i32 65536, i32 65536, i32 65536>
  %10 = sitofp <4 x i32> %9 to <4 x float>
  %11 = fdiv <4 x float> %10, <float 6.553500e+04, float 6.553500e+04, float 6.553500e+04, float 6.553500e+04>
  %12 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv6, i64 %index
  %13 = bitcast float* %12 to <4 x float>*
  store <4 x float> %11, <4 x float>* %13, align 4
  %index.next = add nuw nsw i64 %index, 4
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
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, 4096
  br i1 %exitcond9, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %4
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
  br i1 true, label %.preheader36.lr.ph, label %.preheader31

.preheader36.lr.ph:                               ; preds = %7
  br i1 true, label %.preheader36.us.preheader, label %._crit_edge39

.preheader36.us.preheader:                        ; preds = %.preheader36.lr.ph
  br label %.preheader36.us

.preheader36.us:                                  ; preds = %.preheader36.us.preheader, %._crit_edge64.us
  %indvars.iv129 = phi i64 [ %indvars.iv.next130, %._crit_edge64.us ], [ 0, %.preheader36.us.preheader ]
  br i1 true, label %.prol.loopexit123, label %.prol.preheader122

.prol.preheader122:                               ; preds = %.preheader36.us
  br label %.prol.loopexit123

.prol.loopexit123:                                ; preds = %.prol.preheader122, %.preheader36.us
  %indvars.iv118.unr.ph = phi i64 [ 1, %.prol.preheader122 ], [ 0, %.preheader36.us ]
  br i1 false, label %._crit_edge64.us, label %.preheader36.us.new.preheader

.preheader36.us.new.preheader:                    ; preds = %.prol.loopexit123
  br label %.preheader36.us.new

.preheader36.us.new:                              ; preds = %.preheader36.us.new.preheader, %.preheader36.us.new
  %indvars.iv118 = phi i64 [ %indvars.iv.next119.1, %.preheader36.us.new ], [ %indvars.iv118.unr.ph, %.preheader36.us.new.preheader ]
  %35 = phi float [ %46, %.preheader36.us.new ], [ 0.000000e+00, %.preheader36.us.new.preheader ]
  %36 = phi float [ %57, %.preheader36.us.new ], [ 0.000000e+00, %.preheader36.us.new.preheader ]
  %37 = phi float [ %59, %.preheader36.us.new ], [ 0.000000e+00, %.preheader36.us.new.preheader ]
  %38 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv129, i64 %indvars.iv118
  %39 = load float, float* %38, align 4
  %40 = fmul float %20, %39
  %41 = fmul float %24, %37
  %42 = fadd float %41, %40
  %43 = fmul float %exp2, %36
  %44 = fadd float %43, %42
  %45 = fmul float %35, %34
  %46 = fadd float %45, %44
  %47 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv129, i64 %indvars.iv118
  store float %46, float* %47, align 4
  %48 = load float, float* %38, align 4
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  %49 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv129, i64 %indvars.iv.next119
  %50 = load float, float* %49, align 4
  %51 = fmul float %20, %50
  %52 = fmul float %24, %48
  %53 = fadd float %52, %51
  %54 = fmul float %exp2, %46
  %55 = fadd float %54, %53
  %56 = fmul float %36, %34
  %57 = fadd float %56, %55
  %58 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv129, i64 %indvars.iv.next119
  store float %57, float* %58, align 4
  %59 = load float, float* %49, align 4
  %indvars.iv.next119.1 = add nuw nsw i64 %indvars.iv118, 2
  %exitcond121.1 = icmp eq i64 %indvars.iv.next119.1, 2160
  br i1 %exitcond121.1, label %._crit_edge64.us.loopexit, label %.preheader36.us.new

._crit_edge64.us.loopexit:                        ; preds = %.preheader36.us.new
  br label %._crit_edge64.us

._crit_edge64.us:                                 ; preds = %._crit_edge64.us.loopexit, %.prol.loopexit123
  %indvars.iv.next130 = add nuw nsw i64 %indvars.iv129, 1
  %exitcond132 = icmp eq i64 %indvars.iv.next130, 4096
  br i1 %exitcond132, label %.preheader35, label %.preheader36.us

.preheader35:                                     ; preds = %._crit_edge64.us
  br i1 true, label %.preheader34.lr.ph, label %.preheader31

.preheader34.lr.ph:                               ; preds = %.preheader35
  br i1 true, label %.preheader34.us.preheader, label %._crit_edge39

.preheader34.us.preheader:                        ; preds = %.preheader34.lr.ph
  br label %.preheader34.us

.preheader34.us:                                  ; preds = %._crit_edge60.us, %.preheader34.us.preheader
  %indvars.iv113 = phi i64 [ 0, %.preheader34.us.preheader ], [ %indvars.iv.next114, %._crit_edge60.us ]
  br label %60

; <label>:60:                                     ; preds = %60, %.preheader34.us
  %indvars.iv111 = phi i64 [ %indvars.iv.next112, %60 ], [ 2160, %.preheader34.us ]
  %61 = phi float [ %62, %60 ], [ 0.000000e+00, %.preheader34.us ]
  %62 = phi float [ %71, %60 ], [ 0.000000e+00, %.preheader34.us ]
  %.sroa.018.057.us = phi i32 [ %.sroa.019.056.us, %60 ], [ 0, %.preheader34.us ]
  %.sroa.019.056.us = phi i32 [ %75, %60 ], [ 0, %.preheader34.us ]
  %63 = phi float [ %76, %60 ], [ 0.000000e+00, %.preheader34.us ]
  %indvars.iv.next112 = add nsw i64 %indvars.iv111, -1
  %64 = fmul float %28, %63
  %65 = bitcast i32 %.sroa.018.057.us to float
  %66 = fmul float %65, %32
  %67 = fadd float %64, %66
  %68 = fmul float %exp2, %62
  %69 = fadd float %68, %67
  %70 = fmul float %61, %34
  %71 = fadd float %70, %69
  %72 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv113, i64 %indvars.iv.next112
  store float %71, float* %72, align 4
  %73 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv113, i64 %indvars.iv.next112
  %74 = bitcast float* %73 to i32*
  %75 = load i32, i32* %74, align 4
  %76 = bitcast i32 %75 to float
  %77 = icmp sgt i64 %indvars.iv111, 1
  br i1 %77, label %60, label %._crit_edge60.us

._crit_edge60.us:                                 ; preds = %60
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113, 1
  %exitcond116 = icmp eq i64 %indvars.iv.next114, 4096
  br i1 %exitcond116, label %.preheader33, label %.preheader34.us

.preheader33:                                     ; preds = %._crit_edge60.us
  br i1 true, label %.preheader32.lr.ph, label %.preheader31

.preheader32.lr.ph:                               ; preds = %.preheader33
  br i1 true, label %.preheader32.us.preheader, label %._crit_edge39

.preheader32.us.preheader:                        ; preds = %.preheader32.lr.ph
  br label %.preheader32.us

.preheader32.us:                                  ; preds = %.preheader32.us.preheader, %._crit_edge53.us
  %indvars.iv106 = phi i64 [ %indvars.iv.next107, %._crit_edge53.us ], [ 0, %.preheader32.us.preheader ]
  %scevgep140 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv106, i64 2
  %scevgep146 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv106, i64 2
  %scevgep152 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv106, i64 2
  br i1 true, label %.prol.loopexit103, label %.prol.preheader102

.prol.preheader102:                               ; preds = %.preheader32.us
  br label %.prol.loopexit103

.prol.loopexit103:                                ; preds = %.prol.preheader102, %.preheader32.us
  %indvars.iv98.unr.ph = phi i64 [ 1, %.prol.preheader102 ], [ 0, %.preheader32.us ]
  br i1 false, label %._crit_edge53.us, label %.preheader32.us.new.preheader

.preheader32.us.new.preheader:                    ; preds = %.prol.loopexit103
  %78 = sub nsw i64 2158, %indvars.iv98.unr.ph
  %79 = lshr i64 %78, 1
  %80 = add nuw nsw i64 %79, 1
  br i1 false, label %.preheader32.us.new.preheader216, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader32.us.new.preheader
  %n.mod.vf = and i64 %80, 3
  %n.vec = sub nsw i64 %80, %n.mod.vf
  br i1 false, label %.preheader32.us.new.preheader216, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep138 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv106, i64 %indvars.iv98.unr.ph
  %81 = sub nsw i64 2158, %indvars.iv98.unr.ph
  %82 = and i64 %81, 2158
  %83 = or i64 %indvars.iv98.unr.ph, %82
  %scevgep141 = getelementptr float, float* %scevgep140, i64 %83
  %scevgep144 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv106, i64 %indvars.iv98.unr.ph
  %scevgep147 = getelementptr float, float* %scevgep146, i64 %83
  %scevgep150 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv106, i64 %indvars.iv98.unr.ph
  %scevgep153 = getelementptr float, float* %scevgep152, i64 %83
  %bound0 = icmp ult float* %scevgep138, %scevgep147
  %bound1 = icmp ult float* %scevgep144, %scevgep141
  %found.conflict = and i1 %bound0, %bound1
  %bound0155 = icmp ult float* %scevgep138, %scevgep153
  %bound1156 = icmp ult float* %scevgep150, %scevgep141
  %found.conflict157 = and i1 %bound0155, %bound1156
  %conflict.rdx = or i1 %found.conflict, %found.conflict157
  %84 = or i64 %indvars.iv98.unr.ph, 2
  %85 = shl nuw nsw i64 %79, 1
  %86 = add nuw nsw i64 %84, %85
  %87 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub nsw i64 %86, %87
  br i1 %conflict.rdx, label %.preheader32.us.new.preheader216, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %88 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv98.unr.ph, %88
  %89 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv106, i64 %offset.idx
  %90 = bitcast float* %89 to <8 x float>*
  %wide.vec = load <8 x float>, <8 x float>* %90, align 4, !alias.scope !6
  %91 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv106, i64 %offset.idx
  %92 = bitcast float* %91 to <8 x float>*
  %wide.vec159 = load <8 x float>, <8 x float>* %92, align 4, !alias.scope !9
  %93 = fadd <8 x float> %wide.vec, %wide.vec159
  %94 = shufflevector <8 x float> %93, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %95 = add nuw nsw i64 %offset.idx, 1
  %96 = fadd <8 x float> %wide.vec, %wide.vec159
  %97 = shufflevector <8 x float> %96, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %98 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv106, i64 %95
  %99 = getelementptr float, float* %98, i64 -1
  %100 = bitcast float* %99 to <8 x float>*
  %interleaved.vec = shufflevector <4 x float> %94, <4 x float> %97, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec, <8 x float>* %100, align 4, !alias.scope !11, !noalias !13
  %index.next = add nuw nsw i64 %index, 4
  %101 = icmp eq i64 %index.next, %n.vec
  br i1 %101, label %middle.block, label %vector.body, !llvm.loop !14

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge53.us, label %.preheader32.us.new.preheader216

.preheader32.us.new.preheader216:                 ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader32.us.new.preheader
  %indvars.iv98.ph = phi i64 [ %indvars.iv98.unr.ph, %vector.memcheck ], [ %indvars.iv98.unr.ph, %min.iters.checked ], [ %indvars.iv98.unr.ph, %.preheader32.us.new.preheader ], [ %ind.end, %middle.block ]
  br label %.preheader32.us.new

.preheader32.us.new:                              ; preds = %.preheader32.us.new.preheader216, %.preheader32.us.new
  %indvars.iv98 = phi i64 [ %indvars.iv.next99.1, %.preheader32.us.new ], [ %indvars.iv98.ph, %.preheader32.us.new.preheader216 ]
  %102 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv106, i64 %indvars.iv98
  %103 = load float, float* %102, align 4
  %104 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv106, i64 %indvars.iv98
  %105 = load float, float* %104, align 4
  %106 = fadd float %103, %105
  %107 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv106, i64 %indvars.iv98
  store float %106, float* %107, align 4
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98, 1
  %108 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv106, i64 %indvars.iv.next99
  %109 = load float, float* %108, align 4
  %110 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv106, i64 %indvars.iv.next99
  %111 = load float, float* %110, align 4
  %112 = fadd float %109, %111
  %113 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv106, i64 %indvars.iv.next99
  store float %112, float* %113, align 4
  %indvars.iv.next99.1 = add nsw i64 %indvars.iv98, 2
  %exitcond101.1 = icmp eq i64 %indvars.iv.next99.1, 2160
  br i1 %exitcond101.1, label %._crit_edge53.us.loopexit, label %.preheader32.us.new, !llvm.loop !15

._crit_edge53.us.loopexit:                        ; preds = %.preheader32.us.new
  br label %._crit_edge53.us

._crit_edge53.us:                                 ; preds = %._crit_edge53.us.loopexit, %middle.block, %.prol.loopexit103
  %indvars.iv.next107 = add nuw nsw i64 %indvars.iv106, 1
  %exitcond109 = icmp eq i64 %indvars.iv.next107, 4096
  br i1 %exitcond109, label %.preheader31.loopexit, label %.preheader32.us

.preheader31.loopexit:                            ; preds = %._crit_edge53.us
  br label %.preheader31

.preheader31:                                     ; preds = %.preheader31.loopexit, %7, %.preheader35, %.preheader33
  br i1 true, label %.preheader30.lr.ph, label %.preheader27

.preheader30.lr.ph:                               ; preds = %.preheader31
  br i1 true, label %.preheader30.us.preheader, label %._crit_edge39

.preheader30.us.preheader:                        ; preds = %.preheader30.lr.ph
  br label %.preheader30.us

.preheader30.us:                                  ; preds = %.preheader30.us.preheader, %._crit_edge49.us
  %indvars.iv93 = phi i64 [ %indvars.iv.next94, %._crit_edge49.us ], [ 0, %.preheader30.us.preheader ]
  br i1 true, label %.prol.loopexit88, label %.prol.preheader87

.prol.preheader87:                                ; preds = %.preheader30.us
  br label %.prol.loopexit88

.prol.loopexit88:                                 ; preds = %.prol.preheader87, %.preheader30.us
  %indvars.iv83.unr.ph = phi i64 [ 1, %.prol.preheader87 ], [ 0, %.preheader30.us ]
  br i1 false, label %._crit_edge49.us, label %.preheader30.us.new.preheader

.preheader30.us.new.preheader:                    ; preds = %.prol.loopexit88
  br label %.preheader30.us.new

.preheader30.us.new:                              ; preds = %.preheader30.us.new.preheader, %.preheader30.us.new
  %indvars.iv83 = phi i64 [ %indvars.iv.next84.1, %.preheader30.us.new ], [ %indvars.iv83.unr.ph, %.preheader30.us.new.preheader ]
  %114 = phi float [ %125, %.preheader30.us.new ], [ 0.000000e+00, %.preheader30.us.new.preheader ]
  %115 = phi float [ %136, %.preheader30.us.new ], [ 0.000000e+00, %.preheader30.us.new.preheader ]
  %116 = phi float [ %138, %.preheader30.us.new ], [ 0.000000e+00, %.preheader30.us.new.preheader ]
  %117 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv83, i64 %indvars.iv93
  %118 = load float, float* %117, align 4
  %119 = fmul float %20, %118
  %120 = fmul float %24, %116
  %121 = fadd float %120, %119
  %122 = fmul float %exp2, %115
  %123 = fadd float %122, %121
  %124 = fmul float %114, %34
  %125 = fadd float %124, %123
  %126 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv83, i64 %indvars.iv93
  store float %125, float* %126, align 4
  %127 = load float, float* %117, align 4
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  %128 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next84, i64 %indvars.iv93
  %129 = load float, float* %128, align 4
  %130 = fmul float %20, %129
  %131 = fmul float %24, %127
  %132 = fadd float %131, %130
  %133 = fmul float %exp2, %125
  %134 = fadd float %133, %132
  %135 = fmul float %115, %34
  %136 = fadd float %135, %134
  %137 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv.next84, i64 %indvars.iv93
  store float %136, float* %137, align 4
  %138 = load float, float* %128, align 4
  %indvars.iv.next84.1 = add nuw nsw i64 %indvars.iv83, 2
  %exitcond86.1 = icmp eq i64 %indvars.iv.next84.1, 4096
  br i1 %exitcond86.1, label %._crit_edge49.us.loopexit, label %.preheader30.us.new

._crit_edge49.us.loopexit:                        ; preds = %.preheader30.us.new
  br label %._crit_edge49.us

._crit_edge49.us:                                 ; preds = %._crit_edge49.us.loopexit, %.prol.loopexit88
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %exitcond96 = icmp eq i64 %indvars.iv.next94, 2160
  br i1 %exitcond96, label %.preheader29, label %.preheader30.us

.preheader29:                                     ; preds = %._crit_edge49.us
  br i1 true, label %.preheader28.lr.ph, label %.preheader27

.preheader28.lr.ph:                               ; preds = %.preheader29
  br i1 true, label %.preheader28.us.preheader, label %._crit_edge39

.preheader28.us.preheader:                        ; preds = %.preheader28.lr.ph
  br label %.preheader28.us

.preheader28.us:                                  ; preds = %._crit_edge45.us, %.preheader28.us.preheader
  %indvars.iv78 = phi i64 [ 0, %.preheader28.us.preheader ], [ %indvars.iv.next79, %._crit_edge45.us ]
  br label %139

; <label>:139:                                    ; preds = %139, %.preheader28.us
  %indvars.iv76 = phi i64 [ %indvars.iv.next77, %139 ], [ 4096, %.preheader28.us ]
  %140 = phi float [ %141, %139 ], [ 0.000000e+00, %.preheader28.us ]
  %141 = phi float [ %150, %139 ], [ 0.000000e+00, %.preheader28.us ]
  %.sroa.016.042.us = phi i32 [ %.sroa.017.041.us, %139 ], [ 0, %.preheader28.us ]
  %.sroa.017.041.us = phi i32 [ %154, %139 ], [ 0, %.preheader28.us ]
  %142 = phi float [ %155, %139 ], [ 0.000000e+00, %.preheader28.us ]
  %indvars.iv.next77 = add nsw i64 %indvars.iv76, -1
  %143 = fmul float %28, %142
  %144 = bitcast i32 %.sroa.016.042.us to float
  %145 = fmul float %144, %32
  %146 = fadd float %143, %145
  %147 = fmul float %exp2, %141
  %148 = fadd float %147, %146
  %149 = fmul float %140, %34
  %150 = fadd float %149, %148
  %151 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv.next77, i64 %indvars.iv78
  store float %150, float* %151, align 4
  %152 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next77, i64 %indvars.iv78
  %153 = bitcast float* %152 to i32*
  %154 = load i32, i32* %153, align 4
  %155 = bitcast i32 %154 to float
  %156 = icmp sgt i64 %indvars.iv76, 1
  br i1 %156, label %139, label %._crit_edge45.us

._crit_edge45.us:                                 ; preds = %139
  %indvars.iv.next79 = add nuw nsw i64 %indvars.iv78, 1
  %exitcond81 = icmp eq i64 %indvars.iv.next79, 2160
  br i1 %exitcond81, label %.preheader27.loopexit, label %.preheader28.us

.preheader27.loopexit:                            ; preds = %._crit_edge45.us
  br label %.preheader27

.preheader27:                                     ; preds = %.preheader27.loopexit, %.preheader31, %.preheader29
  br i1 true, label %.preheader.us.preheader, label %._crit_edge39

.preheader.us.preheader:                          ; preds = %.preheader27
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep174 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv72, i64 2
  %scevgep180 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv72, i64 2
  %scevgep186 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv72, i64 2
  br i1 true, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us ]
  br i1 false, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  %157 = sub nsw i64 2158, %indvars.iv.unr.ph
  %158 = lshr i64 %157, 1
  %159 = add nuw nsw i64 %158, 1
  br i1 false, label %.preheader.us.new.preheader215, label %min.iters.checked166

min.iters.checked166:                             ; preds = %.preheader.us.new.preheader
  %n.mod.vf167 = and i64 %159, 3
  %n.vec168 = sub nsw i64 %159, %n.mod.vf167
  br i1 false, label %.preheader.us.new.preheader215, label %vector.memcheck197

vector.memcheck197:                               ; preds = %min.iters.checked166
  %scevgep172 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv72, i64 %indvars.iv.unr.ph
  %160 = sub nsw i64 2158, %indvars.iv.unr.ph
  %161 = and i64 %160, 2158
  %162 = or i64 %indvars.iv.unr.ph, %161
  %scevgep175 = getelementptr float, float* %scevgep174, i64 %162
  %scevgep178 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv72, i64 %indvars.iv.unr.ph
  %scevgep181 = getelementptr float, float* %scevgep180, i64 %162
  %scevgep184 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv72, i64 %indvars.iv.unr.ph
  %scevgep187 = getelementptr float, float* %scevgep186, i64 %162
  %bound0189 = icmp ult float* %scevgep172, %scevgep181
  %bound1190 = icmp ult float* %scevgep178, %scevgep175
  %found.conflict191 = and i1 %bound0189, %bound1190
  %bound0192 = icmp ult float* %scevgep172, %scevgep187
  %bound1193 = icmp ult float* %scevgep184, %scevgep175
  %found.conflict194 = and i1 %bound0192, %bound1193
  %conflict.rdx195 = or i1 %found.conflict191, %found.conflict194
  %163 = or i64 %indvars.iv.unr.ph, 2
  %164 = shl nuw nsw i64 %158, 1
  %165 = add nuw nsw i64 %163, %164
  %166 = shl nuw nsw i64 %n.mod.vf167, 1
  %ind.end202 = sub nsw i64 %165, %166
  br i1 %conflict.rdx195, label %.preheader.us.new.preheader215, label %vector.body162.preheader

vector.body162.preheader:                         ; preds = %vector.memcheck197
  br label %vector.body162

vector.body162:                                   ; preds = %vector.body162.preheader, %vector.body162
  %index199 = phi i64 [ %index.next200, %vector.body162 ], [ 0, %vector.body162.preheader ]
  %167 = shl i64 %index199, 1
  %offset.idx204 = or i64 %indvars.iv.unr.ph, %167
  %168 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv72, i64 %offset.idx204
  %169 = bitcast float* %168 to <8 x float>*
  %wide.vec208 = load <8 x float>, <8 x float>* %169, align 4, !alias.scope !16
  %170 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv72, i64 %offset.idx204
  %171 = bitcast float* %170 to <8 x float>*
  %wide.vec211 = load <8 x float>, <8 x float>* %171, align 4, !alias.scope !19
  %172 = fadd <8 x float> %wide.vec208, %wide.vec211
  %173 = shufflevector <8 x float> %172, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %174 = add nuw nsw i64 %offset.idx204, 1
  %175 = fadd <8 x float> %wide.vec208, %wide.vec211
  %176 = shufflevector <8 x float> %175, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %177 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv72, i64 %174
  %178 = getelementptr float, float* %177, i64 -1
  %179 = bitcast float* %178 to <8 x float>*
  %interleaved.vec214 = shufflevector <4 x float> %173, <4 x float> %176, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec214, <8 x float>* %179, align 4, !alias.scope !21, !noalias !23
  %index.next200 = add nuw nsw i64 %index199, 4
  %180 = icmp eq i64 %index.next200, %n.vec168
  br i1 %180, label %middle.block163, label %vector.body162, !llvm.loop !24

middle.block163:                                  ; preds = %vector.body162
  %cmp.n203 = icmp eq i64 %n.mod.vf167, 0
  br i1 %cmp.n203, label %._crit_edge.us, label %.preheader.us.new.preheader215

.preheader.us.new.preheader215:                   ; preds = %middle.block163, %vector.memcheck197, %min.iters.checked166, %.preheader.us.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr.ph, %vector.memcheck197 ], [ %indvars.iv.unr.ph, %min.iters.checked166 ], [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ], [ %ind.end202, %middle.block163 ]
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader215, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new ], [ %indvars.iv.ph, %.preheader.us.new.preheader215 ]
  %181 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv72, i64 %indvars.iv
  %182 = load float, float* %181, align 4
  %183 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv72, i64 %indvars.iv
  %184 = load float, float* %183, align 4
  %185 = fadd float %182, %184
  %186 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv72, i64 %indvars.iv
  store float %185, float* %186, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %187 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv72, i64 %indvars.iv.next
  %188 = load float, float* %187, align 4
  %189 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv72, i64 %indvars.iv.next
  %190 = load float, float* %189, align 4
  %191 = fadd float %188, %190
  %192 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv72, i64 %indvars.iv.next
  store float %191, float* %192, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2160
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader.us.new, !llvm.loop !25

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block163, %.prol.loopexit
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond = icmp eq i64 %indvars.iv.next73, 4096
  br i1 %exitcond, label %._crit_edge39.loopexit, label %.preheader.us

._crit_edge39.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge39

._crit_edge39:                                    ; preds = %._crit_edge39.loopexit, %.preheader34.lr.ph, %.preheader36.lr.ph, %.preheader32.lr.ph, %.preheader30.lr.ph, %.preheader28.lr.ph, %.preheader27
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [2160 x float]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %.preheader.us.preheader, label %._crit_edge5

.preheader.us.preheader:                          ; preds = %3
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv7 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next8, %._crit_edge.us ]
  %8 = mul nuw nsw i64 %indvars.iv7, 2160
  br label %9

; <label>:9:                                      ; preds = %16, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %16 ], [ 0, %.preheader.us ]
  %10 = add nuw nsw i64 %indvars.iv, %8
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
  %18 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv7, i64 %indvars.iv
  %19 = load float, float* %18, align 4
  %20 = fpext float %19 to double
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %20) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2160
  br i1 %exitcond, label %._crit_edge.us, label %9

._crit_edge.us:                                   ; preds = %16
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next8, 4096
  br i1 %exitcond10, label %._crit_edge5.loopexit, label %.preheader.us

._crit_edge5.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit, %3
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #6
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare float @expf(float) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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
