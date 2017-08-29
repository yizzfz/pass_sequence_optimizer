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
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(i32 4096, i32 2160, [2160 x float]* %10)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
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
  br i1 true, label %.preheader.lr.ph..preheader.us_crit_edge, label %._crit_edge5

.preheader.lr.ph..preheader.us_crit_edge:         ; preds = %4
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph..preheader.us_crit_edge
  %indvars.iv6 = phi i64 [ 0, %.preheader.lr.ph..preheader.us_crit_edge ], [ %indvars.iv.next7, %._crit_edge.us ]
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
  br i1 %exitcond9, label %._crit_edge5.loopexit, label %.preheader.us

._crit_edge5.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit, %4
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
  br i1 true, label %.preheader30.lr.ph, label %.preheader25

.preheader30.lr.ph:                               ; preds = %7
  br i1 true, label %.preheader30.lr.ph..preheader30.us_crit_edge, label %._crit_edge33

.preheader30.lr.ph..preheader30.us_crit_edge:     ; preds = %.preheader30.lr.ph
  %39 = fmul float %31, 0.000000e+00
  %40 = fmul float %exp2, 0.000000e+00
  %41 = fmul float %37, -0.000000e+00
  %42 = insertelement <2 x float> undef, float %31, i32 0
  %43 = insertelement <2 x float> %42, float %20, i32 1
  br label %.preheader30.us

.preheader30.us:                                  ; preds = %._crit_edge68.us, %.preheader30.lr.ph..preheader30.us_crit_edge
  %indvars.iv106 = phi i64 [ 0, %.preheader30.lr.ph..preheader30.us_crit_edge ], [ %indvars.iv.next107, %._crit_edge68.us ]
  %44 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv106, i64 0
  %45 = load float, float* %44, align 4
  %46 = fmul float %20, %45
  %47 = fadd float %39, %46
  %48 = fadd float %40, %47
  %49 = fadd float %41, %48
  %50 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv106, i64 0
  store float %49, float* %50, align 4
  br i1 false, label %._crit_edge68.us, label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %.preheader30.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.preheader, %._crit_edge
  %51 = phi float [ %63, %._crit_edge ], [ %49, %._crit_edge.preheader ]
  %52 = phi float* [ %54, %._crit_edge ], [ %44, %._crit_edge.preheader ]
  %.01963.us132 = phi float [ %51, %._crit_edge ], [ 0.000000e+00, %._crit_edge.preheader ]
  %indvars.iv102131 = phi i64 [ %indvars.iv.next103, %._crit_edge ], [ 0, %._crit_edge.preheader ]
  %indvars.iv.next103 = add nuw nsw i64 %indvars.iv102131, 1
  %53 = bitcast float* %52 to <2 x float>*
  %54 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv106, i64 %indvars.iv.next103
  %55 = load <2 x float>, <2 x float>* %53, align 4
  %56 = fmul <2 x float> %43, %55
  %57 = extractelement <2 x float> %56, i32 0
  %58 = extractelement <2 x float> %56, i32 1
  %59 = fadd float %57, %58
  %60 = fmul float %exp2, %51
  %61 = fadd float %60, %59
  %62 = fmul float %.01963.us132, %38
  %63 = fadd float %62, %61
  %64 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv106, i64 %indvars.iv.next103
  store float %63, float* %64, align 4
  %exitcond105 = icmp eq i64 %indvars.iv.next103, 2159
  br i1 %exitcond105, label %._crit_edge68.us.loopexit, label %._crit_edge

._crit_edge68.us.loopexit:                        ; preds = %._crit_edge
  br label %._crit_edge68.us

._crit_edge68.us:                                 ; preds = %._crit_edge68.us.loopexit, %.preheader30.us
  %indvars.iv.next107 = add nuw nsw i64 %indvars.iv106, 1
  %exitcond118 = icmp eq i64 %indvars.iv.next107, 4096
  br i1 %exitcond118, label %.preheader29, label %.preheader30.us

.preheader29:                                     ; preds = %._crit_edge68.us
  br i1 true, label %.preheader28.lr.ph, label %.preheader25

.preheader28.lr.ph:                               ; preds = %.preheader29
  br i1 true, label %.preheader28.lr.ph..preheader28.us_crit_edge, label %._crit_edge33

.preheader28.lr.ph..preheader28.us_crit_edge:     ; preds = %.preheader28.lr.ph
  %65 = fmul float %32, 0.000000e+00
  %66 = fmul float %35, -0.000000e+00
  %67 = fadd float %65, %66
  %68 = fmul float %exp2, 0.000000e+00
  %69 = fadd float %67, %68
  %70 = fmul float %37, -0.000000e+00
  %71 = fadd float %69, %70
  br label %.preheader28.us

.preheader28.us:                                  ; preds = %._crit_edge61.us, %.preheader28.lr.ph..preheader28.us_crit_edge
  %indvars.iv99 = phi i64 [ 0, %.preheader28.lr.ph..preheader28.us_crit_edge ], [ %indvars.iv.next100, %._crit_edge61.us ]
  %72 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv99, i64 2159
  store float %71, float* %72, align 4
  br i1 true, label %._crit_edge70.preheader, label %._crit_edge61.us

._crit_edge70.preheader:                          ; preds = %.preheader28.us
  br label %._crit_edge70

._crit_edge70:                                    ; preds = %._crit_edge70.1, %._crit_edge70.preheader
  %73 = phi float [ %71, %._crit_edge70.preheader ], [ %239, %._crit_edge70.1 ]
  %indvars.iv.next98129 = phi i64 [ 2159, %._crit_edge70.preheader ], [ %indvars.iv.next98.1, %._crit_edge70.1 ]
  %.0655.us128 = phi float [ 0.000000e+00, %._crit_edge70.preheader ], [ %232, %._crit_edge70.1 ]
  %.0157.us127 = phi float [ 0.000000e+00, %._crit_edge70.preheader ], [ %82, %._crit_edge70.1 ]
  %74 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv99, i64 %indvars.iv.next98129
  %75 = load float, float* %74, align 4
  %indvars.iv.next98 = add nsw i64 %indvars.iv.next98129, -1
  %76 = fmul float %32, %75
  %77 = fmul float %.0655.us128, %36
  %78 = fadd float %76, %77
  %79 = fmul float %exp2, %73
  %80 = fadd float %78, %79
  %81 = fmul float %.0157.us127, %38
  %82 = fadd float %80, %81
  %83 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv99, i64 %indvars.iv.next98
  store float %82, float* %83, align 4
  %84 = icmp sgt i64 %indvars.iv.next98129, 1
  br i1 %84, label %._crit_edge70.1, label %._crit_edge61.us.loopexit

._crit_edge61.us.loopexit:                        ; preds = %._crit_edge70
  br label %._crit_edge61.us

._crit_edge61.us:                                 ; preds = %._crit_edge61.us.loopexit, %.preheader28.us
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv99, 1
  %exitcond117 = icmp eq i64 %indvars.iv.next100, 4096
  br i1 %exitcond117, label %.preheader27, label %.preheader28.us

.preheader27:                                     ; preds = %._crit_edge61.us
  br i1 true, label %.preheader26.lr.ph, label %.preheader25

.preheader26.lr.ph:                               ; preds = %.preheader27
  br i1 true, label %.preheader26.lr.ph..preheader26.us_crit_edge, label %._crit_edge33

.preheader26.lr.ph..preheader26.us_crit_edge:     ; preds = %.preheader26.lr.ph
  br label %.preheader26.us

.preheader26.us:                                  ; preds = %._crit_edge52.us, %.preheader26.lr.ph..preheader26.us_crit_edge
  %indvars.iv94 = phi i64 [ 0, %.preheader26.lr.ph..preheader26.us_crit_edge ], [ %indvars.iv.next95, %._crit_edge52.us ]
  %scevgep = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv94, i64 0
  %scevgep134 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv94, i64 2160
  %scevgep136 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv94, i64 0
  %scevgep138 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv94, i64 2160
  %scevgep140 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv94, i64 0
  %scevgep142 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv94, i64 2160
  br i1 false, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader26.us
  br i1 false, label %scalar.ph.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %bound0 = icmp ult float* %scevgep, %scevgep138
  %bound1 = icmp ult float* %scevgep136, %scevgep134
  %found.conflict = and i1 %bound0, %bound1
  %bound0144 = icmp ult float* %scevgep, %scevgep142
  %bound1145 = icmp ult float* %scevgep140, %scevgep134
  %found.conflict146 = and i1 %bound0144, %bound1145
  %conflict.rdx = or i1 %found.conflict, %found.conflict146
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next.1, %vector.body ]
  %85 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv94, i64 %index
  %86 = bitcast float* %85 to <4 x float>*
  %wide.load = load <4 x float>, <4 x float>* %86, align 4, !alias.scope !6
  %87 = getelementptr float, float* %85, i64 4
  %88 = bitcast float* %87 to <4 x float>*
  %wide.load148 = load <4 x float>, <4 x float>* %88, align 4, !alias.scope !6
  %89 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv94, i64 %index
  %90 = bitcast float* %89 to <4 x float>*
  %wide.load149 = load <4 x float>, <4 x float>* %90, align 4, !alias.scope !9
  %91 = getelementptr float, float* %89, i64 4
  %92 = bitcast float* %91 to <4 x float>*
  %wide.load150 = load <4 x float>, <4 x float>* %92, align 4, !alias.scope !9
  %93 = fadd <4 x float> %wide.load, %wide.load149
  %94 = fadd <4 x float> %wide.load148, %wide.load150
  %95 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv94, i64 %index
  %96 = bitcast float* %95 to <4 x float>*
  store <4 x float> %93, <4 x float>* %96, align 4, !alias.scope !11, !noalias !13
  %97 = getelementptr float, float* %95, i64 4
  %98 = bitcast float* %97 to <4 x float>*
  store <4 x float> %94, <4 x float>* %98, align 4, !alias.scope !11, !noalias !13
  %index.next = or i64 %index, 8
  %99 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv94, i64 %index.next
  %100 = bitcast float* %99 to <4 x float>*
  %wide.load.1 = load <4 x float>, <4 x float>* %100, align 4, !alias.scope !6
  %101 = getelementptr float, float* %99, i64 4
  %102 = bitcast float* %101 to <4 x float>*
  %wide.load148.1 = load <4 x float>, <4 x float>* %102, align 4, !alias.scope !6
  %103 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv94, i64 %index.next
  %104 = bitcast float* %103 to <4 x float>*
  %wide.load149.1 = load <4 x float>, <4 x float>* %104, align 4, !alias.scope !9
  %105 = getelementptr float, float* %103, i64 4
  %106 = bitcast float* %105 to <4 x float>*
  %wide.load150.1 = load <4 x float>, <4 x float>* %106, align 4, !alias.scope !9
  %107 = fadd <4 x float> %wide.load.1, %wide.load149.1
  %108 = fadd <4 x float> %wide.load148.1, %wide.load150.1
  %109 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv94, i64 %index.next
  %110 = bitcast float* %109 to <4 x float>*
  store <4 x float> %107, <4 x float>* %110, align 4, !alias.scope !11, !noalias !13
  %111 = getelementptr float, float* %109, i64 4
  %112 = bitcast float* %111 to <4 x float>*
  store <4 x float> %108, <4 x float>* %112, align 4, !alias.scope !11, !noalias !13
  %index.next.1 = add nsw i64 %index, 16
  %113 = icmp eq i64 %index.next.1, 2160
  br i1 %113, label %middle.block, label %vector.body, !llvm.loop !14

middle.block:                                     ; preds = %vector.body
  br i1 true, label %._crit_edge52.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader26.us
  %indvars.iv90.ph = phi i64 [ 0, %vector.memcheck ], [ 0, %min.iters.checked ], [ 0, %.preheader26.us ], [ 2160, %middle.block ]
  br i1 false, label %scalar.ph.prol.preheader, label %scalar.ph.prol.loopexit.unr-lcssa

scalar.ph.prol.preheader:                         ; preds = %scalar.ph.preheader
  br label %scalar.ph.prol

scalar.ph.prol:                                   ; preds = %scalar.ph.prol.preheader
  br label %scalar.ph.prol.loopexit.unr-lcssa

scalar.ph.prol.loopexit.unr-lcssa:                ; preds = %scalar.ph.preheader, %scalar.ph.prol
  br label %scalar.ph.prol.loopexit

scalar.ph.prol.loopexit:                          ; preds = %scalar.ph.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge52.us.loopexit, label %scalar.ph.preheader.new

scalar.ph.preheader.new:                          ; preds = %scalar.ph.prol.loopexit
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader.new
  %indvars.iv90 = phi i64 [ %indvars.iv90.ph, %scalar.ph.preheader.new ], [ %indvars.iv.next91.1, %scalar.ph ]
  %114 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv94, i64 %indvars.iv90
  %115 = load float, float* %114, align 4
  %116 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv94, i64 %indvars.iv90
  %117 = load float, float* %116, align 4
  %118 = fadd float %115, %117
  %119 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv94, i64 %indvars.iv90
  store float %118, float* %119, align 4
  %indvars.iv.next91 = or i64 %indvars.iv90, 1
  %120 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv94, i64 %indvars.iv.next91
  %121 = load float, float* %120, align 4
  %122 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv94, i64 %indvars.iv.next91
  %123 = load float, float* %122, align 4
  %124 = fadd float %121, %123
  %125 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv94, i64 %indvars.iv.next91
  store float %124, float* %125, align 4
  %exitcond93.1 = icmp eq i64 %indvars.iv.next91, 2159
  %indvars.iv.next91.1 = add nsw i64 %indvars.iv90, 2
  br i1 %exitcond93.1, label %._crit_edge52.us.loopexit.unr-lcssa, label %scalar.ph, !llvm.loop !15

._crit_edge52.us.loopexit.unr-lcssa:              ; preds = %scalar.ph
  br label %._crit_edge52.us.loopexit

._crit_edge52.us.loopexit:                        ; preds = %scalar.ph.prol.loopexit, %._crit_edge52.us.loopexit.unr-lcssa
  br label %._crit_edge52.us

._crit_edge52.us:                                 ; preds = %._crit_edge52.us.loopexit, %middle.block
  %indvars.iv.next95 = add nuw nsw i64 %indvars.iv94, 1
  %exitcond116 = icmp eq i64 %indvars.iv.next95, 4096
  br i1 %exitcond116, label %.preheader25.loopexit, label %.preheader26.us

.preheader25.loopexit:                            ; preds = %._crit_edge52.us
  br label %.preheader25

.preheader25:                                     ; preds = %.preheader25.loopexit, %7, %.preheader29, %.preheader27
  br i1 true, label %.preheader24.lr.ph, label %.preheader21

.preheader24.lr.ph:                               ; preds = %.preheader25
  br i1 true, label %.preheader24.lr.ph..preheader24.us_crit_edge, label %._crit_edge33

.preheader24.lr.ph..preheader24.us_crit_edge:     ; preds = %.preheader24.lr.ph
  %126 = fmul float %31, 0.000000e+00
  %127 = fmul float %exp2, 0.000000e+00
  %128 = fmul float %37, -0.000000e+00
  br label %.preheader24.us

.preheader24.us:                                  ; preds = %._crit_edge48.us, %.preheader24.lr.ph..preheader24.us_crit_edge
  %indvars.iv87 = phi i64 [ 0, %.preheader24.lr.ph..preheader24.us_crit_edge ], [ %indvars.iv.next88, %._crit_edge48.us ]
  %129 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 0, i64 %indvars.iv87
  %130 = load float, float* %129, align 4
  %131 = fmul float %20, %130
  %132 = fadd float %126, %131
  %133 = fadd float %127, %132
  %134 = fadd float %128, %133
  %135 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 0, i64 %indvars.iv87
  store float %134, float* %135, align 4
  br i1 false, label %._crit_edge48.us, label %._crit_edge72.preheader

._crit_edge72.preheader:                          ; preds = %.preheader24.us
  br label %._crit_edge72

._crit_edge72:                                    ; preds = %._crit_edge72.1, %._crit_edge72.preheader
  %136 = phi float [ %134, %._crit_edge72.preheader ], [ %229, %._crit_edge72.1 ]
  %137 = phi float* [ %129, %._crit_edge72.preheader ], [ %221, %._crit_edge72.1 ]
  %.12043.us125 = phi float [ 0.000000e+00, %._crit_edge72.preheader ], [ %147, %._crit_edge72.1 ]
  %indvars.iv83124 = phi i64 [ 0, %._crit_edge72.preheader ], [ %indvars.iv.next84.1, %._crit_edge72.1 ]
  %indvars.iv.next84 = or i64 %indvars.iv83124, 1
  %138 = load float, float* %137, align 4
  %139 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next84, i64 %indvars.iv87
  %140 = load float, float* %139, align 4
  %141 = fmul float %20, %140
  %142 = fmul float %31, %138
  %143 = fadd float %142, %141
  %144 = fmul float %exp2, %136
  %145 = fadd float %144, %143
  %146 = fmul float %.12043.us125, %38
  %147 = fadd float %146, %145
  %148 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv.next84, i64 %indvars.iv87
  store float %147, float* %148, align 4
  %exitcond86 = icmp eq i64 %indvars.iv.next84, 4095
  br i1 %exitcond86, label %._crit_edge48.us.loopexit, label %._crit_edge72.1

._crit_edge48.us.loopexit:                        ; preds = %._crit_edge72
  br label %._crit_edge48.us

._crit_edge48.us:                                 ; preds = %._crit_edge48.us.loopexit, %.preheader24.us
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  %exitcond115 = icmp eq i64 %indvars.iv.next88, 2160
  br i1 %exitcond115, label %.preheader23, label %.preheader24.us

.preheader23:                                     ; preds = %._crit_edge48.us
  br i1 true, label %.preheader22.lr.ph, label %.preheader21

.preheader22.lr.ph:                               ; preds = %.preheader23
  br i1 true, label %.preheader22.lr.ph..preheader22.us_crit_edge, label %._crit_edge33

.preheader22.lr.ph..preheader22.us_crit_edge:     ; preds = %.preheader22.lr.ph
  %149 = fmul float %32, 0.000000e+00
  %150 = fmul float %35, -0.000000e+00
  %151 = fadd float %149, %150
  %152 = fmul float %exp2, 0.000000e+00
  %153 = fadd float %151, %152
  %154 = fmul float %37, -0.000000e+00
  %155 = fadd float %153, %154
  br label %.preheader22.us

.preheader22.us:                                  ; preds = %._crit_edge41.us, %.preheader22.lr.ph..preheader22.us_crit_edge
  %indvars.iv80 = phi i64 [ 0, %.preheader22.lr.ph..preheader22.us_crit_edge ], [ %indvars.iv.next81, %._crit_edge41.us ]
  %156 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 4095, i64 %indvars.iv80
  store float %155, float* %156, align 4
  br i1 true, label %._crit_edge73.preheader, label %._crit_edge41.us

._crit_edge73.preheader:                          ; preds = %.preheader22.us
  br label %._crit_edge73

._crit_edge73:                                    ; preds = %._crit_edge73.1, %._crit_edge73.preheader
  %157 = phi float [ %155, %._crit_edge73.preheader ], [ %218, %._crit_edge73.1 ]
  %indvars.iv.next79122 = phi i64 [ 4095, %._crit_edge73.preheader ], [ %indvars.iv.next79.1, %._crit_edge73.1 ]
  %.0435.us121 = phi float [ 0.000000e+00, %._crit_edge73.preheader ], [ %211, %._crit_edge73.1 ]
  %.1237.us120 = phi float [ 0.000000e+00, %._crit_edge73.preheader ], [ %166, %._crit_edge73.1 ]
  %158 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next79122, i64 %indvars.iv80
  %159 = load float, float* %158, align 4
  %indvars.iv.next79 = add nsw i64 %indvars.iv.next79122, -1
  %160 = fmul float %32, %159
  %161 = fmul float %.0435.us121, %36
  %162 = fadd float %160, %161
  %163 = fmul float %exp2, %157
  %164 = fadd float %162, %163
  %165 = fmul float %.1237.us120, %38
  %166 = fadd float %164, %165
  %167 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv.next79, i64 %indvars.iv80
  store float %166, float* %167, align 4
  %168 = icmp sgt i64 %indvars.iv.next79122, 1
  br i1 %168, label %._crit_edge73.1, label %._crit_edge41.us.loopexit

._crit_edge41.us.loopexit:                        ; preds = %._crit_edge73
  br label %._crit_edge41.us

._crit_edge41.us:                                 ; preds = %._crit_edge41.us.loopexit, %.preheader22.us
  %indvars.iv.next81 = add nuw nsw i64 %indvars.iv80, 1
  %exitcond114 = icmp eq i64 %indvars.iv.next81, 2160
  br i1 %exitcond114, label %.preheader21.loopexit, label %.preheader22.us

.preheader21.loopexit:                            ; preds = %._crit_edge41.us
  br label %.preheader21

.preheader21:                                     ; preds = %.preheader21.loopexit, %.preheader25, %.preheader23
  br i1 true, label %.preheader.lr.ph..preheader.us_crit_edge, label %._crit_edge33

.preheader.lr.ph..preheader.us_crit_edge:         ; preds = %.preheader21
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph..preheader.us_crit_edge
  %indvars.iv75 = phi i64 [ 0, %.preheader.lr.ph..preheader.us_crit_edge ], [ %indvars.iv.next76, %._crit_edge.us ]
  %scevgep160 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv75, i64 0
  %scevgep162 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv75, i64 2160
  %scevgep164 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv75, i64 0
  %scevgep166 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv75, i64 2160
  %scevgep168 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv75, i64 0
  %scevgep170 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv75, i64 2160
  br i1 false, label %scalar.ph153.preheader, label %min.iters.checked155

min.iters.checked155:                             ; preds = %.preheader.us
  br i1 false, label %scalar.ph153.preheader, label %vector.memcheck180

vector.memcheck180:                               ; preds = %min.iters.checked155
  %bound0172 = icmp ult float* %scevgep160, %scevgep166
  %bound1173 = icmp ult float* %scevgep164, %scevgep162
  %found.conflict174 = and i1 %bound0172, %bound1173
  %bound0175 = icmp ult float* %scevgep160, %scevgep170
  %bound1176 = icmp ult float* %scevgep168, %scevgep162
  %found.conflict177 = and i1 %bound0175, %bound1176
  %conflict.rdx178 = or i1 %found.conflict174, %found.conflict177
  br i1 %conflict.rdx178, label %scalar.ph153.preheader, label %vector.body151.preheader

vector.body151.preheader:                         ; preds = %vector.memcheck180
  br label %vector.body151

vector.body151:                                   ; preds = %vector.body151, %vector.body151.preheader
  %index182 = phi i64 [ 0, %vector.body151.preheader ], [ %index.next183.1, %vector.body151 ]
  %169 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv75, i64 %index182
  %170 = bitcast float* %169 to <4 x float>*
  %wide.load190 = load <4 x float>, <4 x float>* %170, align 4, !alias.scope !16
  %171 = getelementptr float, float* %169, i64 4
  %172 = bitcast float* %171 to <4 x float>*
  %wide.load191 = load <4 x float>, <4 x float>* %172, align 4, !alias.scope !16
  %173 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv75, i64 %index182
  %174 = bitcast float* %173 to <4 x float>*
  %wide.load192 = load <4 x float>, <4 x float>* %174, align 4, !alias.scope !19
  %175 = getelementptr float, float* %173, i64 4
  %176 = bitcast float* %175 to <4 x float>*
  %wide.load193 = load <4 x float>, <4 x float>* %176, align 4, !alias.scope !19
  %177 = fadd <4 x float> %wide.load190, %wide.load192
  %178 = fadd <4 x float> %wide.load191, %wide.load193
  %179 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv75, i64 %index182
  %180 = bitcast float* %179 to <4 x float>*
  store <4 x float> %177, <4 x float>* %180, align 4, !alias.scope !21, !noalias !23
  %181 = getelementptr float, float* %179, i64 4
  %182 = bitcast float* %181 to <4 x float>*
  store <4 x float> %178, <4 x float>* %182, align 4, !alias.scope !21, !noalias !23
  %index.next183 = or i64 %index182, 8
  %183 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv75, i64 %index.next183
  %184 = bitcast float* %183 to <4 x float>*
  %wide.load190.1 = load <4 x float>, <4 x float>* %184, align 4, !alias.scope !16
  %185 = getelementptr float, float* %183, i64 4
  %186 = bitcast float* %185 to <4 x float>*
  %wide.load191.1 = load <4 x float>, <4 x float>* %186, align 4, !alias.scope !16
  %187 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv75, i64 %index.next183
  %188 = bitcast float* %187 to <4 x float>*
  %wide.load192.1 = load <4 x float>, <4 x float>* %188, align 4, !alias.scope !19
  %189 = getelementptr float, float* %187, i64 4
  %190 = bitcast float* %189 to <4 x float>*
  %wide.load193.1 = load <4 x float>, <4 x float>* %190, align 4, !alias.scope !19
  %191 = fadd <4 x float> %wide.load190.1, %wide.load192.1
  %192 = fadd <4 x float> %wide.load191.1, %wide.load193.1
  %193 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv75, i64 %index.next183
  %194 = bitcast float* %193 to <4 x float>*
  store <4 x float> %191, <4 x float>* %194, align 4, !alias.scope !21, !noalias !23
  %195 = getelementptr float, float* %193, i64 4
  %196 = bitcast float* %195 to <4 x float>*
  store <4 x float> %192, <4 x float>* %196, align 4, !alias.scope !21, !noalias !23
  %index.next183.1 = add nsw i64 %index182, 16
  %197 = icmp eq i64 %index.next183.1, 2160
  br i1 %197, label %middle.block152, label %vector.body151, !llvm.loop !24

middle.block152:                                  ; preds = %vector.body151
  br i1 true, label %._crit_edge.us, label %scalar.ph153.preheader

scalar.ph153.preheader:                           ; preds = %middle.block152, %vector.memcheck180, %min.iters.checked155, %.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %vector.memcheck180 ], [ 0, %min.iters.checked155 ], [ 0, %.preheader.us ], [ 2160, %middle.block152 ]
  br i1 false, label %scalar.ph153.prol.preheader, label %scalar.ph153.prol.loopexit.unr-lcssa

scalar.ph153.prol.preheader:                      ; preds = %scalar.ph153.preheader
  br label %scalar.ph153.prol

scalar.ph153.prol:                                ; preds = %scalar.ph153.prol.preheader
  br label %scalar.ph153.prol.loopexit.unr-lcssa

scalar.ph153.prol.loopexit.unr-lcssa:             ; preds = %scalar.ph153.preheader, %scalar.ph153.prol
  br label %scalar.ph153.prol.loopexit

scalar.ph153.prol.loopexit:                       ; preds = %scalar.ph153.prol.loopexit.unr-lcssa
  br i1 false, label %._crit_edge.us.loopexit, label %scalar.ph153.preheader.new

scalar.ph153.preheader.new:                       ; preds = %scalar.ph153.prol.loopexit
  br label %scalar.ph153

scalar.ph153:                                     ; preds = %scalar.ph153, %scalar.ph153.preheader.new
  %indvars.iv = phi i64 [ %indvars.iv.ph, %scalar.ph153.preheader.new ], [ %indvars.iv.next.1, %scalar.ph153 ]
  %198 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv75, i64 %indvars.iv
  %199 = load float, float* %198, align 4
  %200 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv75, i64 %indvars.iv
  %201 = load float, float* %200, align 4
  %202 = fadd float %199, %201
  %203 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv75, i64 %indvars.iv
  store float %202, float* %203, align 4
  %indvars.iv.next = or i64 %indvars.iv, 1
  %204 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv75, i64 %indvars.iv.next
  %205 = load float, float* %204, align 4
  %206 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv75, i64 %indvars.iv.next
  %207 = load float, float* %206, align 4
  %208 = fadd float %205, %207
  %209 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv75, i64 %indvars.iv.next
  store float %208, float* %209, align 4
  %exitcond.1 = icmp eq i64 %indvars.iv.next, 2159
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  br i1 %exitcond.1, label %._crit_edge.us.loopexit.unr-lcssa, label %scalar.ph153, !llvm.loop !25

._crit_edge.us.loopexit.unr-lcssa:                ; preds = %scalar.ph153
  br label %._crit_edge.us.loopexit

._crit_edge.us.loopexit:                          ; preds = %scalar.ph153.prol.loopexit, %._crit_edge.us.loopexit.unr-lcssa
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block152
  %indvars.iv.next76 = add nuw nsw i64 %indvars.iv75, 1
  %exitcond113 = icmp eq i64 %indvars.iv.next76, 4096
  br i1 %exitcond113, label %._crit_edge33.loopexit, label %.preheader.us

._crit_edge33.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge33

._crit_edge33:                                    ; preds = %._crit_edge33.loopexit, %.preheader28.lr.ph, %.preheader30.lr.ph, %.preheader26.lr.ph, %.preheader24.lr.ph, %.preheader22.lr.ph, %.preheader21
  ret void

._crit_edge73.1:                                  ; preds = %._crit_edge73
  %210 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next79, i64 %indvars.iv80
  %211 = load float, float* %210, align 4
  %indvars.iv.next79.1 = add nsw i64 %indvars.iv.next79122, -2
  %212 = fmul float %32, %211
  %213 = fmul float %159, %36
  %214 = fadd float %212, %213
  %215 = fmul float %exp2, %166
  %216 = fadd float %214, %215
  %217 = fmul float %157, %38
  %218 = fadd float %216, %217
  %219 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv.next79.1, i64 %indvars.iv80
  store float %218, float* %219, align 4
  br label %._crit_edge73

._crit_edge72.1:                                  ; preds = %._crit_edge72
  %indvars.iv.next84.1 = add nsw i64 %indvars.iv83124, 2
  %220 = load float, float* %139, align 4
  %221 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next84.1, i64 %indvars.iv87
  %222 = load float, float* %221, align 4
  %223 = fmul float %20, %222
  %224 = fmul float %31, %220
  %225 = fadd float %224, %223
  %226 = fmul float %exp2, %147
  %227 = fadd float %226, %225
  %228 = fmul float %136, %38
  %229 = fadd float %228, %227
  %230 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv.next84.1, i64 %indvars.iv87
  store float %229, float* %230, align 4
  br label %._crit_edge72

._crit_edge70.1:                                  ; preds = %._crit_edge70
  %231 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv99, i64 %indvars.iv.next98
  %232 = load float, float* %231, align 4
  %indvars.iv.next98.1 = add nsw i64 %indvars.iv.next98129, -2
  %233 = fmul float %32, %232
  %234 = fmul float %75, %36
  %235 = fadd float %233, %234
  %236 = fmul float %exp2, %82
  %237 = fadd float %235, %236
  %238 = fmul float %73, %38
  %239 = fadd float %237, %238
  %240 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv99, i64 %indvars.iv.next98.1
  store float %239, float* %240, align 4
  br label %._crit_edge70
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [2160 x float]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %.preheader.lr.ph..preheader.us_crit_edge, label %._crit_edge5

.preheader.lr.ph..preheader.us_crit_edge:         ; preds = %3
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph..preheader.us_crit_edge
  %indvars.iv7 = phi i64 [ 0, %.preheader.lr.ph..preheader.us_crit_edge ], [ %indvars.iv.next8, %._crit_edge.us ]
  %8 = mul nuw nsw i64 %indvars.iv7, 2160
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %9 = add nuw nsw i64 %indvars.iv, %8
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %._crit_edge6
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge6, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv7, i64 %indvars.iv
  %17 = load float, float* %16, align 4
  %18 = fpext float %17 to double
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2160
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge6

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 4096
  br i1 %exitcond9, label %._crit_edge5.loopexit, label %.preheader.us

._crit_edge5.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge5.loopexit, %3
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #6
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
