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
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to [2160 x float]*
  call fastcc void @print_array(i32 4096, i32 2160, [2160 x float]* %18)
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
define internal fastcc void @init_array(i32, i32, float* nocapture, [2160 x float]* nocapture) unnamed_addr #2 {
  store float 2.500000e-01, float* %2, align 4
  br i1 true, label %.preheader.lr.ph, label %._crit_edge15

.preheader.lr.ph:                                 ; preds = %4
  br i1 true, label %.preheader.us.preheader, label %._crit_edge15

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %5 = mul nuw nsw i64 %indvars.iv, 313
  br i1 false, label %._crit_edge.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 false, label %._crit_edge.preheader, label %vector.ph

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
  br i1 true, label %._crit_edge.us, label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %middle.block, %min.iters.checked, %.preheader.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.preheader, %._crit_edge
  br i1 true, label %._crit_edge.us.loopexit, label %._crit_edge, !llvm.loop !4

._crit_edge.us.loopexit:                          ; preds = %._crit_edge
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 4096
  br i1 %exitcond, label %._crit_edge15.loopexit, label %.preheader.us

._crit_edge15.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %.preheader.lr.ph, %4
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
  br i1 true, label %.preheader178.us.preheader, label %.preheader169

.preheader178.us.preheader:                       ; preds = %.preheader178.lr.ph
  %39 = fmul float %31, 0.000000e+00
  %40 = fmul float %exp2, 0.000000e+00
  %41 = fmul float %37, -0.000000e+00
  %42 = insertelement <2 x float> undef, float %31, i32 0
  %43 = insertelement <2 x float> %42, float %20, i32 1
  br label %.preheader178.us

.preheader178.us:                                 ; preds = %.preheader178.us.preheader, %._crit_edge216.us
  %indvars.iv254.us = phi i64 [ %indvars.iv.next255.us, %._crit_edge216.us ], [ 0, %.preheader178.us.preheader ]
  %44 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv254.us, i64 0
  %45 = load float, float* %44, align 4
  %46 = fmul float %20, %45
  %47 = fadd float %39, %46
  %48 = fadd float %40, %47
  %49 = fadd float %41, %48
  %50 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv254.us, i64 0
  store float %49, float* %50, align 4
  br i1 false, label %._crit_edge216.us, label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %.preheader178.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.preheader, %._crit_edge
  %indvars.iv.next251.us277 = phi i64 [ %indvars.iv.next251.us, %._crit_edge ], [ 1, %._crit_edge.preheader ]
  %51 = phi float [ %63, %._crit_edge ], [ %49, %._crit_edge.preheader ]
  %52 = phi float* [ %54, %._crit_edge ], [ %44, %._crit_edge.preheader ]
  %.0157212.us276 = phi float [ %51, %._crit_edge ], [ 0.000000e+00, %._crit_edge.preheader ]
  %53 = bitcast float* %52 to <2 x float>*
  %54 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv254.us, i64 %indvars.iv.next251.us277
  %55 = load <2 x float>, <2 x float>* %53, align 4
  %56 = fmul <2 x float> %43, %55
  %57 = extractelement <2 x float> %56, i32 0
  %58 = extractelement <2 x float> %56, i32 1
  %59 = fadd float %57, %58
  %60 = fmul float %exp2, %51
  %61 = fadd float %60, %59
  %62 = fmul float %.0157212.us276, %38
  %63 = fadd float %62, %61
  %64 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv254.us, i64 %indvars.iv.next251.us277
  store float %63, float* %64, align 4
  %indvars.iv.next251.us = add nuw nsw i64 %indvars.iv.next251.us277, 1
  %exitcond253.us = icmp eq i64 %indvars.iv.next251.us, 2160
  br i1 %exitcond253.us, label %._crit_edge216.us.loopexit, label %._crit_edge

._crit_edge216.us.loopexit:                       ; preds = %._crit_edge
  br label %._crit_edge216.us

._crit_edge216.us:                                ; preds = %._crit_edge216.us.loopexit, %.preheader178.us
  %indvars.iv.next255.us = add nuw nsw i64 %indvars.iv254.us, 1
  %exitcond257.us = icmp eq i64 %indvars.iv.next255.us, 4096
  br i1 %exitcond257.us, label %.preheader176.lr.ph, label %.preheader178.us

.preheader176.lr.ph:                              ; preds = %._crit_edge216.us
  br i1 true, label %.preheader176.us.preheader, label %.preheader169

.preheader176.us.preheader:                       ; preds = %.preheader176.lr.ph
  %65 = fmul float %32, 0.000000e+00
  %66 = fmul float %35, -0.000000e+00
  %67 = fadd float %66, %65
  %68 = fmul float %exp2, 0.000000e+00
  %69 = fadd float %68, %67
  %70 = fmul float %37, -0.000000e+00
  %71 = fadd float %70, %69
  br label %.preheader176.us

.preheader176.us:                                 ; preds = %.preheader176.us.preheader, %._crit_edge209.us
  %indvars.iv246.us = phi i64 [ %indvars.iv.next247.us, %._crit_edge209.us ], [ 0, %.preheader176.us.preheader ]
  %72 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv246.us, i64 2159
  store float %71, float* %72, align 4
  br i1 true, label %._crit_edge259.preheader, label %._crit_edge209.us

._crit_edge259.preheader:                         ; preds = %.preheader176.us
  br label %._crit_edge259

._crit_edge259:                                   ; preds = %._crit_edge259.1, %._crit_edge259.preheader
  %73 = phi float [ %71, %._crit_edge259.preheader ], [ %240, %._crit_edge259.1 ]
  %indvars.iv244.us274 = phi i64 [ 2159, %._crit_edge259.preheader ], [ %indvars.iv244.us.1, %._crit_edge259.1 ]
  %.0165204.us273 = phi float [ 0.000000e+00, %._crit_edge259.preheader ], [ %82, %._crit_edge259.1 ]
  %.0161206.us272 = phi float [ 0.000000e+00, %._crit_edge259.preheader ], [ %233, %._crit_edge259.1 ]
  %74 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv246.us, i64 %indvars.iv244.us274
  %75 = load float, float* %74, align 4
  %indvars.iv244.us = add nsw i64 %indvars.iv244.us274, -1
  %76 = fmul float %32, %75
  %77 = fmul float %.0161206.us272, %36
  %78 = fadd float %77, %76
  %79 = fmul float %exp2, %73
  %80 = fadd float %79, %78
  %81 = fmul float %.0165204.us273, %38
  %82 = fadd float %81, %80
  %83 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv246.us, i64 %indvars.iv244.us
  store float %82, float* %83, align 4
  %84 = icmp sgt i64 %indvars.iv244.us274, 1
  br i1 %84, label %._crit_edge259.1, label %._crit_edge209.us.loopexit

._crit_edge209.us.loopexit:                       ; preds = %._crit_edge259
  br label %._crit_edge209.us

._crit_edge209.us:                                ; preds = %._crit_edge209.us.loopexit, %.preheader176.us
  %indvars.iv.next247.us = add nuw nsw i64 %indvars.iv246.us, 1
  %exitcond249.us = icmp eq i64 %indvars.iv.next247.us, 4096
  br i1 %exitcond249.us, label %.preheader174.lr.ph, label %.preheader176.us

.preheader174.lr.ph:                              ; preds = %._crit_edge209.us
  br i1 true, label %.preheader174.us.preheader, label %.preheader169

.preheader174.us.preheader:                       ; preds = %.preheader174.lr.ph
  br label %.preheader174.us

.preheader174.us:                                 ; preds = %.preheader174.us.preheader, %._crit_edge200.us
  %indvars.iv240.us = phi i64 [ %indvars.iv.next241.us, %._crit_edge200.us ], [ 0, %.preheader174.us.preheader ]
  %scevgep = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 0
  %scevgep279 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 2160
  %scevgep281 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv240.us, i64 0
  %scevgep283 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv240.us, i64 2160
  %scevgep285 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv240.us, i64 0
  %scevgep287 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv240.us, i64 2160
  br i1 false, label %._crit_edge260.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader174.us
  br i1 false, label %._crit_edge260.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult float* %scevgep, %scevgep283
  %bound1 = icmp ult float* %scevgep281, %scevgep279
  %found.conflict = and i1 %bound0, %bound1
  %bound0289 = icmp ult float* %scevgep, %scevgep287
  %bound1290 = icmp ult float* %scevgep285, %scevgep279
  %found.conflict291 = and i1 %bound0289, %bound1290
  %conflict.rdx = or i1 %found.conflict, %found.conflict291
  br i1 %conflict.rdx, label %._crit_edge260.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next.1, %vector.body ]
  %85 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv240.us, i64 %index
  %86 = bitcast float* %85 to <4 x float>*
  %wide.load = load <4 x float>, <4 x float>* %86, align 4, !alias.scope !6
  %87 = getelementptr float, float* %85, i64 4
  %88 = bitcast float* %87 to <4 x float>*
  %wide.load293 = load <4 x float>, <4 x float>* %88, align 4, !alias.scope !6
  %89 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv240.us, i64 %index
  %90 = bitcast float* %89 to <4 x float>*
  %wide.load294 = load <4 x float>, <4 x float>* %90, align 4, !alias.scope !9
  %91 = getelementptr float, float* %89, i64 4
  %92 = bitcast float* %91 to <4 x float>*
  %wide.load295 = load <4 x float>, <4 x float>* %92, align 4, !alias.scope !9
  %93 = fadd <4 x float> %wide.load, %wide.load294
  %94 = fadd <4 x float> %wide.load293, %wide.load295
  %95 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 %index
  %96 = bitcast float* %95 to <4 x float>*
  store <4 x float> %93, <4 x float>* %96, align 4, !alias.scope !11, !noalias !13
  %97 = getelementptr float, float* %95, i64 4
  %98 = bitcast float* %97 to <4 x float>*
  store <4 x float> %94, <4 x float>* %98, align 4, !alias.scope !11, !noalias !13
  %index.next = or i64 %index, 8
  %99 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv240.us, i64 %index.next
  %100 = bitcast float* %99 to <4 x float>*
  %wide.load.1 = load <4 x float>, <4 x float>* %100, align 4, !alias.scope !6
  %101 = getelementptr float, float* %99, i64 4
  %102 = bitcast float* %101 to <4 x float>*
  %wide.load293.1 = load <4 x float>, <4 x float>* %102, align 4, !alias.scope !6
  %103 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv240.us, i64 %index.next
  %104 = bitcast float* %103 to <4 x float>*
  %wide.load294.1 = load <4 x float>, <4 x float>* %104, align 4, !alias.scope !9
  %105 = getelementptr float, float* %103, i64 4
  %106 = bitcast float* %105 to <4 x float>*
  %wide.load295.1 = load <4 x float>, <4 x float>* %106, align 4, !alias.scope !9
  %107 = fadd <4 x float> %wide.load.1, %wide.load294.1
  %108 = fadd <4 x float> %wide.load293.1, %wide.load295.1
  %109 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 %index.next
  %110 = bitcast float* %109 to <4 x float>*
  store <4 x float> %107, <4 x float>* %110, align 4, !alias.scope !11, !noalias !13
  %111 = getelementptr float, float* %109, i64 4
  %112 = bitcast float* %111 to <4 x float>*
  store <4 x float> %108, <4 x float>* %112, align 4, !alias.scope !11, !noalias !13
  %index.next.1 = add nsw i64 %index, 16
  %113 = icmp eq i64 %index.next.1, 2160
  br i1 %113, label %middle.block, label %vector.body, !llvm.loop !14

middle.block:                                     ; preds = %vector.body
  br i1 true, label %._crit_edge200.us, label %._crit_edge260.preheader

._crit_edge260.preheader:                         ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader174.us
  %indvars.iv236.us.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader174.us ], [ 2160, %middle.block ]
  br i1 false, label %._crit_edge260.prol.preheader, label %._crit_edge260.prol.loopexit.unr-lcssa

._crit_edge260.prol.preheader:                    ; preds = %._crit_edge260.preheader
  br label %._crit_edge260.prol

._crit_edge260.prol:                              ; preds = %._crit_edge260.prol.preheader
  br label %._crit_edge260.prol.loopexit.unr-lcssa

._crit_edge260.prol.loopexit.unr-lcssa:           ; preds = %._crit_edge260.preheader, %._crit_edge260.prol
  br label %._crit_edge260.prol.loopexit

._crit_edge260.prol.loopexit:                     ; preds = %._crit_edge260.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge200.us.loopexit, label %._crit_edge260.preheader.new

._crit_edge260.preheader.new:                     ; preds = %._crit_edge260.prol.loopexit
  br label %._crit_edge260

._crit_edge260:                                   ; preds = %._crit_edge260, %._crit_edge260.preheader.new
  %indvars.iv236.us = phi i64 [ %indvars.iv236.us.ph, %._crit_edge260.preheader.new ], [ %indvars.iv.next237.us.1, %._crit_edge260 ]
  %114 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv240.us, i64 %indvars.iv236.us
  %115 = load float, float* %114, align 4
  %116 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv240.us, i64 %indvars.iv236.us
  %117 = load float, float* %116, align 4
  %118 = fadd float %115, %117
  %119 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 %indvars.iv236.us
  store float %118, float* %119, align 4
  %indvars.iv.next237.us = or i64 %indvars.iv236.us, 1
  %120 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv240.us, i64 %indvars.iv.next237.us
  %121 = load float, float* %120, align 4
  %122 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv240.us, i64 %indvars.iv.next237.us
  %123 = load float, float* %122, align 4
  %124 = fadd float %121, %123
  %125 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 %indvars.iv.next237.us
  store float %124, float* %125, align 4
  %indvars.iv.next237.us.1 = add nsw i64 %indvars.iv236.us, 2
  %exitcond239.us.1 = icmp eq i64 %indvars.iv.next237.us.1, 2160
  br i1 %exitcond239.us.1, label %._crit_edge200.us.loopexit.unr-lcssa, label %._crit_edge260, !llvm.loop !15

._crit_edge200.us.loopexit.unr-lcssa:             ; preds = %._crit_edge260
  br label %._crit_edge200.us.loopexit

._crit_edge200.us.loopexit:                       ; preds = %._crit_edge260.prol.loopexit, %._crit_edge200.us.loopexit.unr-lcssa
  br label %._crit_edge200.us

._crit_edge200.us:                                ; preds = %._crit_edge200.us.loopexit, %middle.block
  %indvars.iv.next241.us = add nuw nsw i64 %indvars.iv240.us, 1
  %exitcond243.us = icmp eq i64 %indvars.iv.next241.us, 4096
  br i1 %exitcond243.us, label %.preheader173.loopexit, label %.preheader174.us

.preheader173.loopexit:                           ; preds = %._crit_edge200.us
  br label %.preheader173

.preheader173:                                    ; preds = %.preheader173.loopexit, %7
  br i1 true, label %.preheader172.lr.ph, label %.preheader169

.preheader172.lr.ph:                              ; preds = %.preheader173
  br i1 true, label %.preheader172.us.preheader, label %._crit_edge181

.preheader172.us.preheader:                       ; preds = %.preheader172.lr.ph
  %126 = fmul float %31, 0.000000e+00
  %127 = fmul float %exp2, 0.000000e+00
  %128 = fmul float %37, -0.000000e+00
  br label %.preheader172.us

.preheader172.us:                                 ; preds = %.preheader172.us.preheader, %._crit_edge196.us
  %indvars.iv232.us = phi i64 [ %indvars.iv.next233.us, %._crit_edge196.us ], [ 0, %.preheader172.us.preheader ]
  %129 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 0, i64 %indvars.iv232.us
  %130 = load float, float* %129, align 4
  %131 = fmul float %20, %130
  %132 = fadd float %126, %131
  %133 = fadd float %127, %132
  %134 = fadd float %128, %133
  %135 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 0, i64 %indvars.iv232.us
  store float %134, float* %135, align 4
  br i1 false, label %._crit_edge196.us, label %._crit_edge261.preheader

._crit_edge261.preheader:                         ; preds = %.preheader172.us
  br label %._crit_edge261

._crit_edge261:                                   ; preds = %._crit_edge261.1, %._crit_edge261.preheader
  %indvars.iv.next229.us270 = phi i64 [ 1, %._crit_edge261.preheader ], [ %indvars.iv.next229.us.1, %._crit_edge261.1 ]
  %136 = phi float [ %134, %._crit_edge261.preheader ], [ %230, %._crit_edge261.1 ]
  %137 = phi float* [ %129, %._crit_edge261.preheader ], [ %222, %._crit_edge261.1 ]
  %.1158192.us269 = phi float [ 0.000000e+00, %._crit_edge261.preheader ], [ %147, %._crit_edge261.1 ]
  %138 = load float, float* %137, align 4
  %139 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next229.us270, i64 %indvars.iv232.us
  %140 = load float, float* %139, align 4
  %141 = fmul float %20, %140
  %142 = fmul float %31, %138
  %143 = fadd float %142, %141
  %144 = fmul float %exp2, %136
  %145 = fadd float %144, %143
  %146 = fmul float %.1158192.us269, %38
  %147 = fadd float %146, %145
  %148 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv.next229.us270, i64 %indvars.iv232.us
  store float %147, float* %148, align 4
  %indvars.iv.next229.us = add nuw nsw i64 %indvars.iv.next229.us270, 1
  %exitcond231.us = icmp eq i64 %indvars.iv.next229.us, 4096
  br i1 %exitcond231.us, label %._crit_edge196.us.loopexit, label %._crit_edge261.1

._crit_edge196.us.loopexit:                       ; preds = %._crit_edge261
  br label %._crit_edge196.us

._crit_edge196.us:                                ; preds = %._crit_edge196.us.loopexit, %.preheader172.us
  %indvars.iv.next233.us = add nuw nsw i64 %indvars.iv232.us, 1
  %exitcond235.us = icmp eq i64 %indvars.iv.next233.us, 2160
  br i1 %exitcond235.us, label %.preheader170.lr.ph, label %.preheader172.us

.preheader170.lr.ph:                              ; preds = %._crit_edge196.us
  br i1 true, label %.preheader170.us.preheader, label %._crit_edge181

.preheader170.us.preheader:                       ; preds = %.preheader170.lr.ph
  %149 = fmul float %32, 0.000000e+00
  %150 = fmul float %35, -0.000000e+00
  %151 = fadd float %150, %149
  %152 = fmul float %exp2, 0.000000e+00
  %153 = fadd float %152, %151
  %154 = fmul float %37, -0.000000e+00
  %155 = fadd float %154, %153
  br label %.preheader170.us

.preheader170.us:                                 ; preds = %.preheader170.us.preheader, %._crit_edge189.us
  %indvars.iv224.us = phi i64 [ %indvars.iv.next225.us, %._crit_edge189.us ], [ 0, %.preheader170.us.preheader ]
  %156 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 4095, i64 %indvars.iv224.us
  store float %155, float* %156, align 4
  br i1 true, label %._crit_edge262.preheader, label %._crit_edge189.us

._crit_edge262.preheader:                         ; preds = %.preheader170.us
  br label %._crit_edge262

._crit_edge262:                                   ; preds = %._crit_edge262.1, %._crit_edge262.preheader
  %157 = phi float [ %155, %._crit_edge262.preheader ], [ %219, %._crit_edge262.1 ]
  %indvars.iv222.us267 = phi i64 [ 4095, %._crit_edge262.preheader ], [ %indvars.iv222.us.1, %._crit_edge262.1 ]
  %.1166184.us266 = phi float [ 0.000000e+00, %._crit_edge262.preheader ], [ %166, %._crit_edge262.1 ]
  %.0163186.us265 = phi float [ 0.000000e+00, %._crit_edge262.preheader ], [ %212, %._crit_edge262.1 ]
  %158 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv222.us267, i64 %indvars.iv224.us
  %159 = load float, float* %158, align 4
  %indvars.iv222.us = add nsw i64 %indvars.iv222.us267, -1
  %160 = fmul float %32, %159
  %161 = fmul float %.0163186.us265, %36
  %162 = fadd float %161, %160
  %163 = fmul float %exp2, %157
  %164 = fadd float %163, %162
  %165 = fmul float %.1166184.us266, %38
  %166 = fadd float %165, %164
  %167 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv222.us, i64 %indvars.iv224.us
  store float %166, float* %167, align 4
  %168 = icmp sgt i64 %indvars.iv222.us267, 1
  br i1 %168, label %._crit_edge262.1, label %._crit_edge189.us.loopexit

._crit_edge189.us.loopexit:                       ; preds = %._crit_edge262
  br label %._crit_edge189.us

._crit_edge189.us:                                ; preds = %._crit_edge189.us.loopexit, %.preheader170.us
  %indvars.iv.next225.us = add nuw nsw i64 %indvars.iv224.us, 1
  %exitcond227.us = icmp eq i64 %indvars.iv.next225.us, 2160
  br i1 %exitcond227.us, label %.preheader169.loopexit, label %.preheader170.us

.preheader169.loopexit:                           ; preds = %._crit_edge189.us
  br label %.preheader169

.preheader169:                                    ; preds = %.preheader169.loopexit, %.preheader173, %.preheader178.lr.ph, %.preheader176.lr.ph, %.preheader174.lr.ph
  %169 = phi i1 [ false, %.preheader174.lr.ph ], [ false, %.preheader176.lr.ph ], [ false, %.preheader178.lr.ph ], [ false, %.preheader173 ], [ true, %.preheader169.loopexit ]
  br i1 true, label %.preheader.lr.ph, label %._crit_edge181

.preheader.lr.ph:                                 ; preds = %.preheader169
  br i1 %169, label %.preheader.us.preheader, label %._crit_edge181

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv218.us = phi i64 [ %indvars.iv.next219.us, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep305 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 0
  %scevgep307 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 2160
  %scevgep309 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv218.us, i64 0
  %scevgep311 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv218.us, i64 2160
  %scevgep313 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv218.us, i64 0
  %scevgep315 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv218.us, i64 2160
  br i1 false, label %._crit_edge263.preheader, label %min.iters.checked300

min.iters.checked300:                             ; preds = %.preheader.us
  br i1 false, label %._crit_edge263.preheader, label %vector.memcheck325

vector.memcheck325:                               ; preds = %min.iters.checked300
  %bound0317 = icmp ult float* %scevgep305, %scevgep311
  %bound1318 = icmp ult float* %scevgep309, %scevgep307
  %found.conflict319 = and i1 %bound0317, %bound1318
  %bound0320 = icmp ult float* %scevgep305, %scevgep315
  %bound1321 = icmp ult float* %scevgep313, %scevgep307
  %found.conflict322 = and i1 %bound0320, %bound1321
  %conflict.rdx323 = or i1 %found.conflict319, %found.conflict322
  br i1 %conflict.rdx323, label %._crit_edge263.preheader, label %vector.body296.preheader

vector.body296.preheader:                         ; preds = %vector.memcheck325
  br label %vector.body296

vector.body296:                                   ; preds = %vector.body296, %vector.body296.preheader
  %index327 = phi i64 [ 0, %vector.body296.preheader ], [ %index.next328.1, %vector.body296 ]
  %170 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv218.us, i64 %index327
  %171 = bitcast float* %170 to <4 x float>*
  %wide.load335 = load <4 x float>, <4 x float>* %171, align 4, !alias.scope !16
  %172 = getelementptr float, float* %170, i64 4
  %173 = bitcast float* %172 to <4 x float>*
  %wide.load336 = load <4 x float>, <4 x float>* %173, align 4, !alias.scope !16
  %174 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv218.us, i64 %index327
  %175 = bitcast float* %174 to <4 x float>*
  %wide.load337 = load <4 x float>, <4 x float>* %175, align 4, !alias.scope !19
  %176 = getelementptr float, float* %174, i64 4
  %177 = bitcast float* %176 to <4 x float>*
  %wide.load338 = load <4 x float>, <4 x float>* %177, align 4, !alias.scope !19
  %178 = fadd <4 x float> %wide.load335, %wide.load337
  %179 = fadd <4 x float> %wide.load336, %wide.load338
  %180 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 %index327
  %181 = bitcast float* %180 to <4 x float>*
  store <4 x float> %178, <4 x float>* %181, align 4, !alias.scope !21, !noalias !23
  %182 = getelementptr float, float* %180, i64 4
  %183 = bitcast float* %182 to <4 x float>*
  store <4 x float> %179, <4 x float>* %183, align 4, !alias.scope !21, !noalias !23
  %index.next328 = or i64 %index327, 8
  %184 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv218.us, i64 %index.next328
  %185 = bitcast float* %184 to <4 x float>*
  %wide.load335.1 = load <4 x float>, <4 x float>* %185, align 4, !alias.scope !16
  %186 = getelementptr float, float* %184, i64 4
  %187 = bitcast float* %186 to <4 x float>*
  %wide.load336.1 = load <4 x float>, <4 x float>* %187, align 4, !alias.scope !16
  %188 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv218.us, i64 %index.next328
  %189 = bitcast float* %188 to <4 x float>*
  %wide.load337.1 = load <4 x float>, <4 x float>* %189, align 4, !alias.scope !19
  %190 = getelementptr float, float* %188, i64 4
  %191 = bitcast float* %190 to <4 x float>*
  %wide.load338.1 = load <4 x float>, <4 x float>* %191, align 4, !alias.scope !19
  %192 = fadd <4 x float> %wide.load335.1, %wide.load337.1
  %193 = fadd <4 x float> %wide.load336.1, %wide.load338.1
  %194 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 %index.next328
  %195 = bitcast float* %194 to <4 x float>*
  store <4 x float> %192, <4 x float>* %195, align 4, !alias.scope !21, !noalias !23
  %196 = getelementptr float, float* %194, i64 4
  %197 = bitcast float* %196 to <4 x float>*
  store <4 x float> %193, <4 x float>* %197, align 4, !alias.scope !21, !noalias !23
  %index.next328.1 = add nsw i64 %index327, 16
  %198 = icmp eq i64 %index.next328.1, 2160
  br i1 %198, label %middle.block297, label %vector.body296, !llvm.loop !24

middle.block297:                                  ; preds = %vector.body296
  br i1 true, label %._crit_edge.us, label %._crit_edge263.preheader

._crit_edge263.preheader:                         ; preds = %middle.block297, %vector.memcheck325, %min.iters.checked300, %.preheader.us
  %indvars.iv.us.ph = phi i64 [ 0, %vector.memcheck325 ], [ 0, %min.iters.checked300 ], [ 0, %.preheader.us ], [ 2160, %middle.block297 ]
  br i1 false, label %._crit_edge263.prol.preheader, label %._crit_edge263.prol.loopexit.unr-lcssa

._crit_edge263.prol.preheader:                    ; preds = %._crit_edge263.preheader
  br label %._crit_edge263.prol

._crit_edge263.prol:                              ; preds = %._crit_edge263.prol.preheader
  br label %._crit_edge263.prol.loopexit.unr-lcssa

._crit_edge263.prol.loopexit.unr-lcssa:           ; preds = %._crit_edge263.preheader, %._crit_edge263.prol
  br label %._crit_edge263.prol.loopexit

._crit_edge263.prol.loopexit:                     ; preds = %._crit_edge263.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge.us.loopexit, label %._crit_edge263.preheader.new

._crit_edge263.preheader.new:                     ; preds = %._crit_edge263.prol.loopexit
  br label %._crit_edge263

._crit_edge263:                                   ; preds = %._crit_edge263, %._crit_edge263.preheader.new
  %indvars.iv.us = phi i64 [ %indvars.iv.us.ph, %._crit_edge263.preheader.new ], [ %indvars.iv.next.us.1, %._crit_edge263 ]
  %199 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv218.us, i64 %indvars.iv.us
  %200 = load float, float* %199, align 4
  %201 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv218.us, i64 %indvars.iv.us
  %202 = load float, float* %201, align 4
  %203 = fadd float %200, %202
  %204 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 %indvars.iv.us
  store float %203, float* %204, align 4
  %indvars.iv.next.us = or i64 %indvars.iv.us, 1
  %205 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv218.us, i64 %indvars.iv.next.us
  %206 = load float, float* %205, align 4
  %207 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv218.us, i64 %indvars.iv.next.us
  %208 = load float, float* %207, align 4
  %209 = fadd float %206, %208
  %210 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv218.us, i64 %indvars.iv.next.us
  store float %209, float* %210, align 4
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv.us, 2
  %exitcond.us.1 = icmp eq i64 %indvars.iv.next.us.1, 2160
  br i1 %exitcond.us.1, label %._crit_edge.us.loopexit.unr-lcssa, label %._crit_edge263, !llvm.loop !25

._crit_edge.us.loopexit.unr-lcssa:                ; preds = %._crit_edge263
  br label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %._crit_edge263.prol.loopexit, %._crit_edge.us.loopexit.unr-lcssa
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block297
  %indvars.iv.next219.us = add nuw nsw i64 %indvars.iv218.us, 1
  %exitcond221.us = icmp eq i64 %indvars.iv.next219.us, 4096
  br i1 %exitcond221.us, label %._crit_edge181.loopexit, label %.preheader.us

._crit_edge181.loopexit:                          ; preds = %._crit_edge.us
  br label %._crit_edge181

._crit_edge181:                                   ; preds = %._crit_edge181.loopexit, %.preheader.lr.ph, %.preheader169, %.preheader170.lr.ph, %.preheader172.lr.ph
  ret void

._crit_edge262.1:                                 ; preds = %._crit_edge262
  %211 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv222.us, i64 %indvars.iv224.us
  %212 = load float, float* %211, align 4
  %indvars.iv222.us.1 = add nsw i64 %indvars.iv222.us267, -2
  %213 = fmul float %32, %212
  %214 = fmul float %159, %36
  %215 = fadd float %214, %213
  %216 = fmul float %exp2, %166
  %217 = fadd float %216, %215
  %218 = fmul float %157, %38
  %219 = fadd float %218, %217
  %220 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv222.us.1, i64 %indvars.iv224.us
  store float %219, float* %220, align 4
  br label %._crit_edge262

._crit_edge261.1:                                 ; preds = %._crit_edge261
  %221 = load float, float* %139, align 4
  %222 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next229.us, i64 %indvars.iv232.us
  %223 = load float, float* %222, align 4
  %224 = fmul float %20, %223
  %225 = fmul float %31, %221
  %226 = fadd float %225, %224
  %227 = fmul float %exp2, %147
  %228 = fadd float %227, %226
  %229 = fmul float %136, %38
  %230 = fadd float %229, %228
  %231 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv.next229.us, i64 %indvars.iv232.us
  store float %230, float* %231, align 4
  %indvars.iv.next229.us.1 = add nsw i64 %indvars.iv.next229.us270, 2
  br label %._crit_edge261

._crit_edge259.1:                                 ; preds = %._crit_edge259
  %232 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv246.us, i64 %indvars.iv244.us
  %233 = load float, float* %232, align 4
  %indvars.iv244.us.1 = add nsw i64 %indvars.iv244.us274, -2
  %234 = fmul float %32, %233
  %235 = fmul float %75, %36
  %236 = fadd float %235, %234
  %237 = fmul float %exp2, %82
  %238 = fadd float %237, %236
  %239 = fmul float %73, %38
  %240 = fadd float %239, %238
  %241 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv246.us, i64 %indvars.iv244.us.1
  store float %240, float* %241, align 4
  br label %._crit_edge259
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

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %8 = mul i64 %indvars.iv, 2160
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %._crit_edge ]
  %9 = add i64 %indvars.iv.us, %8
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %._crit_edge16
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge16, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv, i64 %indvars.iv.us
  %17 = load float, float* %16, align 4
  %18 = fpext float %17 to double
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %18) #7
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 2160
  br i1 %exitcond.us, label %._crit_edge.us, label %._crit_edge16

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 4096
  br i1 %exitcond, label %._crit_edge15.loopexit, label %.preheader.us

._crit_edge15.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %.preheader.lr.ph, %3
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #6
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
