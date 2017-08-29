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
  call fastcc void @init_array(i32 4096, i32 2160, float* nonnull %3, [2160 x float]* %8, [2160 x float]* %9)
  call void (...) @polybench_timer_start() #5
  %10 = load float, float* %3, align 4
  %11 = bitcast i8* %4 to [2160 x float]*
  %12 = bitcast i8* %5 to [2160 x float]*
  %13 = bitcast i8* %6 to [2160 x float]*
  %14 = bitcast i8* %7 to [2160 x float]*
  call fastcc void @kernel_deriche(i32 4096, i32 2160, float %10, [2160 x float]* %11, [2160 x float]* %12, [2160 x float]* %13, [2160 x float]* %14)
  call void (...) @polybench_timer_stop() #5
  call void (...) @polybench_timer_print() #5
  %15 = icmp sgt i32 %0, 42
  br i1 %15, label %16, label %._crit_edge

; <label>:16:                                     ; preds = %2
  %17 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %17, align 1
  %18 = icmp eq i8 %strcmpload, 0
  br i1 %18, label %19, label %._crit_edge

; <label>:19:                                     ; preds = %16
  %20 = bitcast i8* %5 to [2160 x float]*
  call fastcc void @print_array(i32 4096, i32 2160, [2160 x float]* %20)
  br label %._crit_edge

._crit_edge:                                      ; preds = %16, %2, %19
  call void @free(i8* %4) #5
  call void @free(i8* %5) #5
  call void @free(i8* %6) #5
  call void @free(i8* %7) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, float* nocapture, [2160 x float]* nocapture, [2160 x float]* nocapture readnone) unnamed_addr #2 {
  store float 2.500000e-01, float* %2, align 4
  br label %vector.ph

vector.ph:                                        ; preds = %middle.block, %5
  %indvars.iv1215 = phi i64 [ 0, %5 ], [ %indvars.iv.next13, %middle.block ]
  %6 = mul nuw nsw i64 %indvars.iv1215, 313
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %6, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %7 = mul nuw nsw <4 x i64> %vec.ind, <i64 991, i64 991, i64 991, i64 991>
  %8 = add nuw nsw <4 x i64> %7, %broadcast.splat
  %9 = trunc <4 x i64> %8 to <4 x i32>
  %10 = srem <4 x i32> %9, <i32 65536, i32 65536, i32 65536, i32 65536>
  %11 = sitofp <4 x i32> %10 to <4 x float>
  %12 = fdiv <4 x float> %11, <float 6.553500e+04, float 6.553500e+04, float 6.553500e+04, float 6.553500e+04>
  %13 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv1215, i64 %index
  %14 = bitcast float* %13 to <4 x float>*
  store <4 x float> %12, <4 x float>* %14, align 4
  %index.next = add nuw nsw i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %15 = icmp eq i64 %index.next, 2160
  br i1 %15, label %middle.block, label %vector.body, !llvm.loop !1

middle.block:                                     ; preds = %vector.body
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv1215, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next13, 4096
  br i1 %exitcond16, label %16, label %vector.ph

; <label>:16:                                     ; preds = %middle.block
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_deriche(i32, i32, float, [2160 x float]* nocapture readonly, [2160 x float]* nocapture, [2160 x float]* nocapture, [2160 x float]* nocapture) unnamed_addr #0 {
  %8 = fsub float -0.000000e+00, %2
  %9 = tail call float @expf(float %8) #5
  %10 = fsub float 1.000000e+00, %9
  %11 = fsub float -0.000000e+00, %2
  %12 = tail call float @expf(float %11) #5
  %13 = fsub float 1.000000e+00, %12
  %14 = fmul float %10, %13
  %15 = fmul float %2, 2.000000e+00
  %16 = fsub float -0.000000e+00, %2
  %17 = tail call float @expf(float %16) #5
  %18 = fmul float %15, %17
  %19 = fadd float %18, 1.000000e+00
  %20 = fmul float %2, 2.000000e+00
  %21 = tail call float @expf(float %20) #5
  %22 = fsub float %19, %21
  %23 = fdiv float %14, %22
  %24 = fsub float -0.000000e+00, %2
  %25 = tail call float @expf(float %24) #5
  %26 = fmul float %25, %23
  %27 = fadd float %2, -1.000000e+00
  %28 = fmul float %27, %26
  %29 = fsub float -0.000000e+00, %2
  %30 = tail call float @expf(float %29) #5
  %31 = fmul float %2, -2.000000e+00
  %32 = tail call float @expf(float %31) #5
  %33 = fsub float -0.000000e+00, %2
  %exp2 = tail call float @llvm.exp2.f32(float %33)
  %34 = fmul float %2, -2.000000e+00
  %35 = tail call float @expf(float %34) #5
  %36 = fsub float -0.000000e+00, %35
  %37 = fmul float %28, 0.000000e+00
  %38 = fmul float %exp2, 0.000000e+00
  %39 = fmul float %35, -0.000000e+00
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %72, %7
  %indvars.iv199226 = phi i64 [ 0, %7 ], [ %indvars.iv.next200, %72 ]
  %40 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv199226, i64 0
  %41 = load float, float* %40, align 4
  %42 = fmul float %23, %41
  %43 = fadd float %37, %42
  %44 = fadd float %38, %43
  %45 = fadd float %39, %44
  %46 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv199226, i64 0
  store float %45, float* %46, align 4
  br label %._crit_edge.._crit_edge_crit_edge

._crit_edge169.preheader:                         ; preds = %72
  %47 = fadd float %2, 1.000000e+00
  %48 = fmul float %23, %32
  %49 = fmul float %30, %23
  %50 = fmul float %47, %49
  %51 = fsub float -0.000000e+00, %48
  %52 = fmul float %50, 0.000000e+00
  %53 = fmul float %48, -0.000000e+00
  %54 = fadd float %53, %52
  %55 = fmul float %exp2, 0.000000e+00
  %56 = fadd float %55, %54
  %57 = fmul float %35, -0.000000e+00
  %58 = fadd float %57, %56
  br label %._crit_edge170.preheader

._crit_edge.._crit_edge_crit_edge:                ; preds = %._crit_edge.preheader, %._crit_edge.._crit_edge_crit_edge
  %indvars.iv.next198247 = phi i64 [ 1, %._crit_edge.preheader ], [ %indvars.iv.next198, %._crit_edge.._crit_edge_crit_edge ]
  %59 = phi float [ %45, %._crit_edge.preheader ], [ %70, %._crit_edge.._crit_edge_crit_edge ]
  %indvars.iv197222246 = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next198247, %._crit_edge.._crit_edge_crit_edge ]
  %.0157224245 = phi float [ 0.000000e+00, %._crit_edge.preheader ], [ %59, %._crit_edge.._crit_edge_crit_edge ]
  %60 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv199226, i64 %indvars.iv197222246
  %61 = load float, float* %60, align 4
  %62 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv199226, i64 %indvars.iv.next198247
  %63 = load float, float* %62, align 4
  %64 = fmul float %23, %63
  %65 = fmul float %28, %61
  %66 = fadd float %65, %64
  %67 = fmul float %exp2, %59
  %68 = fadd float %67, %66
  %69 = fmul float %.0157224245, %36
  %70 = fadd float %69, %68
  %71 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv199226, i64 %indvars.iv.next198247
  store float %70, float* %71, align 4
  %indvars.iv.next198 = add nuw nsw i64 %indvars.iv.next198247, 1
  %exitcond234 = icmp eq i64 %indvars.iv.next198, 2160
  br i1 %exitcond234, label %72, label %._crit_edge.._crit_edge_crit_edge

; <label>:72:                                     ; preds = %._crit_edge.._crit_edge_crit_edge
  %indvars.iv.next200 = add nuw nsw i64 %indvars.iv199226, 1
  %exitcond235 = icmp eq i64 %indvars.iv.next200, 4096
  br i1 %exitcond235, label %._crit_edge169.preheader, label %._crit_edge.preheader

._crit_edge170.preheader:                         ; preds = %._crit_edge169, %._crit_edge169.preheader
  %indvars.iv195221 = phi i64 [ 0, %._crit_edge169.preheader ], [ %indvars.iv.next196, %._crit_edge169 ]
  %73 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv195221, i64 2159
  store float %58, float* %73, align 4
  br label %._crit_edge170.._crit_edge170_crit_edge

._crit_edge170.._crit_edge170_crit_edge:          ; preds = %._crit_edge170.._crit_edge170_crit_edge.1, %._crit_edge170.preheader
  %74 = phi float [ %58, %._crit_edge170.preheader ], [ %244, %._crit_edge170.._crit_edge170_crit_edge.1 ]
  %.0165217244 = phi float [ 0.000000e+00, %._crit_edge170.preheader ], [ %83, %._crit_edge170.._crit_edge170_crit_edge.1 ]
  %.0161219243 = phi float [ 0.000000e+00, %._crit_edge170.preheader ], [ %237, %._crit_edge170.._crit_edge170_crit_edge.1 ]
  %indvars.iv.next194220242 = phi i64 [ 2159, %._crit_edge170.preheader ], [ %indvars.iv.next194.1, %._crit_edge170.._crit_edge170_crit_edge.1 ]
  %indvars.iv.next194 = add nsw i64 %indvars.iv.next194220242, -1
  %75 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv195221, i64 %indvars.iv.next194220242
  %76 = load float, float* %75, align 4
  %77 = fmul float %50, %76
  %78 = fmul float %.0161219243, %51
  %79 = fadd float %78, %77
  %80 = fmul float %exp2, %74
  %81 = fadd float %80, %79
  %82 = fmul float %.0165217244, %36
  %83 = fadd float %82, %81
  %84 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv195221, i64 %indvars.iv.next194
  store float %83, float* %84, align 4
  %85 = icmp sgt i64 %indvars.iv.next194220242, 1
  br i1 %85, label %._crit_edge170.._crit_edge170_crit_edge.1, label %._crit_edge169

._crit_edge169:                                   ; preds = %._crit_edge170.._crit_edge170_crit_edge
  %indvars.iv.next196 = add nuw nsw i64 %indvars.iv195221, 1
  %exitcond233 = icmp eq i64 %indvars.iv.next196, 4096
  br i1 %exitcond233, label %vector.memcheck.preheader, label %._crit_edge170.preheader

vector.memcheck.preheader:                        ; preds = %._crit_edge169
  br label %vector.memcheck

vector.memcheck:                                  ; preds = %vector.memcheck.preheader, %._crit_edge171
  %indvars.iv191215 = phi i64 [ %indvars.iv.next192, %._crit_edge171 ], [ 0, %vector.memcheck.preheader ]
  %scevgep = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv191215, i64 0
  %86 = add nuw nsw i64 %indvars.iv191215, 1
  %scevgep249 = getelementptr [2160 x float], [2160 x float]* %4, i64 %86, i64 0
  %scevgep251 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv191215, i64 0
  %scevgep253 = getelementptr [2160 x float], [2160 x float]* %5, i64 %86, i64 0
  %scevgep255 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv191215, i64 0
  %scevgep257 = getelementptr [2160 x float], [2160 x float]* %6, i64 %86, i64 0
  %bound0 = icmp ult float* %scevgep, %scevgep253
  %bound1 = icmp ult float* %scevgep251, %scevgep249
  %found.conflict = and i1 %bound0, %bound1
  %bound0259 = icmp ult float* %scevgep, %scevgep257
  %bound1260 = icmp ult float* %scevgep255, %scevgep249
  %found.conflict261 = and i1 %bound0259, %bound1260
  %conflict.rdx = or i1 %found.conflict, %found.conflict261
  br i1 %conflict.rdx, label %._crit_edge172.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

._crit_edge172.preheader:                         ; preds = %vector.memcheck
  br label %._crit_edge172

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next.1, %vector.body ]
  %87 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv191215, i64 %index
  %88 = bitcast float* %87 to <4 x float>*
  %wide.load = load <4 x float>, <4 x float>* %88, align 4, !alias.scope !4
  %89 = getelementptr float, float* %87, i64 4
  %90 = bitcast float* %89 to <4 x float>*
  %wide.load263 = load <4 x float>, <4 x float>* %90, align 4, !alias.scope !4
  %91 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv191215, i64 %index
  %92 = bitcast float* %91 to <4 x float>*
  %wide.load264 = load <4 x float>, <4 x float>* %92, align 4, !alias.scope !7
  %93 = getelementptr float, float* %91, i64 4
  %94 = bitcast float* %93 to <4 x float>*
  %wide.load265 = load <4 x float>, <4 x float>* %94, align 4, !alias.scope !7
  %95 = fadd <4 x float> %wide.load, %wide.load264
  %96 = fadd <4 x float> %wide.load263, %wide.load265
  %97 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv191215, i64 %index
  %98 = bitcast float* %97 to <4 x float>*
  store <4 x float> %95, <4 x float>* %98, align 4, !alias.scope !9, !noalias !11
  %99 = getelementptr float, float* %97, i64 4
  %100 = bitcast float* %99 to <4 x float>*
  store <4 x float> %96, <4 x float>* %100, align 4, !alias.scope !9, !noalias !11
  %index.next = or i64 %index, 8
  %101 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv191215, i64 %index.next
  %102 = bitcast float* %101 to <4 x float>*
  %wide.load.1 = load <4 x float>, <4 x float>* %102, align 4, !alias.scope !4
  %103 = getelementptr float, float* %101, i64 4
  %104 = bitcast float* %103 to <4 x float>*
  %wide.load263.1 = load <4 x float>, <4 x float>* %104, align 4, !alias.scope !4
  %105 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv191215, i64 %index.next
  %106 = bitcast float* %105 to <4 x float>*
  %wide.load264.1 = load <4 x float>, <4 x float>* %106, align 4, !alias.scope !7
  %107 = getelementptr float, float* %105, i64 4
  %108 = bitcast float* %107 to <4 x float>*
  %wide.load265.1 = load <4 x float>, <4 x float>* %108, align 4, !alias.scope !7
  %109 = fadd <4 x float> %wide.load.1, %wide.load264.1
  %110 = fadd <4 x float> %wide.load263.1, %wide.load265.1
  %111 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv191215, i64 %index.next
  %112 = bitcast float* %111 to <4 x float>*
  store <4 x float> %109, <4 x float>* %112, align 4, !alias.scope !9, !noalias !11
  %113 = getelementptr float, float* %111, i64 4
  %114 = bitcast float* %113 to <4 x float>*
  store <4 x float> %110, <4 x float>* %114, align 4, !alias.scope !9, !noalias !11
  %index.next.1 = add nsw i64 %index, 16
  %115 = icmp eq i64 %index.next.1, 2160
  br i1 %115, label %._crit_edge171.loopexit306, label %vector.body, !llvm.loop !12

._crit_edge172:                                   ; preds = %._crit_edge172, %._crit_edge172.preheader
  %indvars.iv189214 = phi i64 [ 0, %._crit_edge172.preheader ], [ %indvars.iv.next190.2, %._crit_edge172 ]
  %116 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv191215, i64 %indvars.iv189214
  %117 = load float, float* %116, align 4
  %118 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv191215, i64 %indvars.iv189214
  %119 = load float, float* %118, align 4
  %120 = fadd float %117, %119
  %121 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv191215, i64 %indvars.iv189214
  store float %120, float* %121, align 4
  %indvars.iv.next190 = add nuw nsw i64 %indvars.iv189214, 1
  %122 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv191215, i64 %indvars.iv.next190
  %123 = load float, float* %122, align 4
  %124 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv191215, i64 %indvars.iv.next190
  %125 = load float, float* %124, align 4
  %126 = fadd float %123, %125
  %127 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv191215, i64 %indvars.iv.next190
  store float %126, float* %127, align 4
  %indvars.iv.next190.1 = add nsw i64 %indvars.iv189214, 2
  %128 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv191215, i64 %indvars.iv.next190.1
  %129 = load float, float* %128, align 4
  %130 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv191215, i64 %indvars.iv.next190.1
  %131 = load float, float* %130, align 4
  %132 = fadd float %129, %131
  %133 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv191215, i64 %indvars.iv.next190.1
  store float %132, float* %133, align 4
  %indvars.iv.next190.2 = add nsw i64 %indvars.iv189214, 3
  %exitcond231.2 = icmp eq i64 %indvars.iv.next190.2, 2160
  br i1 %exitcond231.2, label %._crit_edge171.loopexit, label %._crit_edge172, !llvm.loop !13

._crit_edge171.loopexit:                          ; preds = %._crit_edge172
  br label %._crit_edge171

._crit_edge171.loopexit306:                       ; preds = %vector.body
  br label %._crit_edge171

._crit_edge171:                                   ; preds = %._crit_edge171.loopexit306, %._crit_edge171.loopexit
  %indvars.iv.next192 = add nuw nsw i64 %indvars.iv191215, 1
  %exitcond232 = icmp eq i64 %indvars.iv.next192, 4096
  br i1 %exitcond232, label %._crit_edge174.preheader.preheader, label %vector.memcheck

._crit_edge174.preheader.preheader:               ; preds = %._crit_edge171
  %134 = fmul float %28, 0.000000e+00
  %135 = fmul float %exp2, 0.000000e+00
  %136 = fmul float %35, -0.000000e+00
  br label %._crit_edge174.preheader

._crit_edge174.preheader:                         ; preds = %._crit_edge174.preheader.preheader, %._crit_edge173
  %indvars.iv187213 = phi i64 [ %indvars.iv.next188, %._crit_edge173 ], [ 0, %._crit_edge174.preheader.preheader ]
  %137 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 0, i64 %indvars.iv187213
  %138 = load float, float* %137, align 4
  %139 = fmul float %23, %138
  %140 = fadd float %134, %139
  %141 = fadd float %135, %140
  %142 = fadd float %136, %141
  %143 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 0, i64 %indvars.iv187213
  store float %142, float* %143, align 4
  br label %._crit_edge174.._crit_edge174_crit_edge

._crit_edge174.._crit_edge174_crit_edge:          ; preds = %._crit_edge174.preheader, %._crit_edge174.._crit_edge174_crit_edge
  %indvars.iv.next186241 = phi i64 [ 1, %._crit_edge174.preheader ], [ %indvars.iv.next186, %._crit_edge174.._crit_edge174_crit_edge ]
  %144 = phi float [ %142, %._crit_edge174.preheader ], [ %155, %._crit_edge174.._crit_edge174_crit_edge ]
  %indvars.iv185209240 = phi i64 [ 0, %._crit_edge174.preheader ], [ %indvars.iv.next186241, %._crit_edge174.._crit_edge174_crit_edge ]
  %.1158211239 = phi float [ 0.000000e+00, %._crit_edge174.preheader ], [ %144, %._crit_edge174.._crit_edge174_crit_edge ]
  %145 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv185209240, i64 %indvars.iv187213
  %146 = load float, float* %145, align 4
  %147 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next186241, i64 %indvars.iv187213
  %148 = load float, float* %147, align 4
  %149 = fmul float %23, %148
  %150 = fmul float %28, %146
  %151 = fadd float %150, %149
  %152 = fmul float %exp2, %144
  %153 = fadd float %152, %151
  %154 = fmul float %.1158211239, %36
  %155 = fadd float %154, %153
  %156 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv.next186241, i64 %indvars.iv187213
  store float %155, float* %156, align 4
  %indvars.iv.next186 = add nuw nsw i64 %indvars.iv.next186241, 1
  %exitcond229 = icmp eq i64 %indvars.iv.next186, 4096
  br i1 %exitcond229, label %._crit_edge173, label %._crit_edge174.._crit_edge174_crit_edge

._crit_edge173:                                   ; preds = %._crit_edge174.._crit_edge174_crit_edge
  %indvars.iv.next188 = add nuw nsw i64 %indvars.iv187213, 1
  %exitcond230 = icmp eq i64 %indvars.iv.next188, 2160
  br i1 %exitcond230, label %._crit_edge176.preheader.preheader, label %._crit_edge174.preheader

._crit_edge176.preheader.preheader:               ; preds = %._crit_edge173
  %157 = fmul float %50, 0.000000e+00
  %158 = fmul float %48, -0.000000e+00
  %159 = fadd float %158, %157
  %160 = fmul float %exp2, 0.000000e+00
  %161 = fadd float %160, %159
  %162 = fmul float %35, -0.000000e+00
  %163 = fadd float %162, %161
  br label %._crit_edge176.preheader

._crit_edge176.preheader:                         ; preds = %._crit_edge176.preheader.preheader, %._crit_edge175
  %indvars.iv183208 = phi i64 [ %indvars.iv.next184, %._crit_edge175 ], [ 0, %._crit_edge176.preheader.preheader ]
  %164 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 4095, i64 %indvars.iv183208
  store float %163, float* %164, align 4
  br label %._crit_edge176.._crit_edge176_crit_edge

._crit_edge176.._crit_edge176_crit_edge:          ; preds = %._crit_edge176.._crit_edge176_crit_edge.1, %._crit_edge176.preheader
  %165 = phi float [ %163, %._crit_edge176.preheader ], [ %234, %._crit_edge176.._crit_edge176_crit_edge.1 ]
  %.1166204238 = phi float [ 0.000000e+00, %._crit_edge176.preheader ], [ %174, %._crit_edge176.._crit_edge176_crit_edge.1 ]
  %.0163206237 = phi float [ 0.000000e+00, %._crit_edge176.preheader ], [ %227, %._crit_edge176.._crit_edge176_crit_edge.1 ]
  %indvars.iv.next182207236 = phi i64 [ 4095, %._crit_edge176.preheader ], [ %indvars.iv.next182.1, %._crit_edge176.._crit_edge176_crit_edge.1 ]
  %indvars.iv.next182 = add nsw i64 %indvars.iv.next182207236, -1
  %166 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next182207236, i64 %indvars.iv183208
  %167 = load float, float* %166, align 4
  %168 = fmul float %50, %167
  %169 = fmul float %.0163206237, %51
  %170 = fadd float %169, %168
  %171 = fmul float %exp2, %165
  %172 = fadd float %171, %170
  %173 = fmul float %.1166204238, %36
  %174 = fadd float %173, %172
  %175 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv.next182, i64 %indvars.iv183208
  store float %174, float* %175, align 4
  %176 = icmp sgt i64 %indvars.iv.next182207236, 1
  br i1 %176, label %._crit_edge176.._crit_edge176_crit_edge.1, label %._crit_edge175

._crit_edge175:                                   ; preds = %._crit_edge176.._crit_edge176_crit_edge
  %indvars.iv.next184 = add nuw nsw i64 %indvars.iv183208, 1
  %exitcond228 = icmp eq i64 %indvars.iv.next184, 2160
  br i1 %exitcond228, label %vector.memcheck291.preheader, label %._crit_edge176.preheader

vector.memcheck291.preheader:                     ; preds = %._crit_edge175
  br label %vector.memcheck291

vector.memcheck291:                               ; preds = %vector.memcheck291.preheader, %._crit_edge177
  %indvars.iv179202 = phi i64 [ %indvars.iv.next180, %._crit_edge177 ], [ 0, %vector.memcheck291.preheader ]
  %scevgep271 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv179202, i64 0
  %177 = add nuw nsw i64 %indvars.iv179202, 1
  %scevgep273 = getelementptr [2160 x float], [2160 x float]* %4, i64 %177, i64 0
  %scevgep275 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv179202, i64 0
  %scevgep277 = getelementptr [2160 x float], [2160 x float]* %5, i64 %177, i64 0
  %scevgep279 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv179202, i64 0
  %scevgep281 = getelementptr [2160 x float], [2160 x float]* %6, i64 %177, i64 0
  %bound0283 = icmp ult float* %scevgep271, %scevgep277
  %bound1284 = icmp ult float* %scevgep275, %scevgep273
  %found.conflict285 = and i1 %bound0283, %bound1284
  %bound0286 = icmp ult float* %scevgep271, %scevgep281
  %bound1287 = icmp ult float* %scevgep279, %scevgep273
  %found.conflict288 = and i1 %bound0286, %bound1287
  %conflict.rdx289 = or i1 %found.conflict285, %found.conflict288
  br i1 %conflict.rdx289, label %._crit_edge178.preheader, label %vector.body266.preheader

vector.body266.preheader:                         ; preds = %vector.memcheck291
  br label %vector.body266

._crit_edge178.preheader:                         ; preds = %vector.memcheck291
  br label %._crit_edge178

vector.body266:                                   ; preds = %vector.body266, %vector.body266.preheader
  %index293 = phi i64 [ 0, %vector.body266.preheader ], [ %index.next294.1, %vector.body266 ]
  %178 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv179202, i64 %index293
  %179 = bitcast float* %178 to <4 x float>*
  %wide.load301 = load <4 x float>, <4 x float>* %179, align 4, !alias.scope !14
  %180 = getelementptr float, float* %178, i64 4
  %181 = bitcast float* %180 to <4 x float>*
  %wide.load302 = load <4 x float>, <4 x float>* %181, align 4, !alias.scope !14
  %182 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv179202, i64 %index293
  %183 = bitcast float* %182 to <4 x float>*
  %wide.load303 = load <4 x float>, <4 x float>* %183, align 4, !alias.scope !17
  %184 = getelementptr float, float* %182, i64 4
  %185 = bitcast float* %184 to <4 x float>*
  %wide.load304 = load <4 x float>, <4 x float>* %185, align 4, !alias.scope !17
  %186 = fadd <4 x float> %wide.load301, %wide.load303
  %187 = fadd <4 x float> %wide.load302, %wide.load304
  %188 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv179202, i64 %index293
  %189 = bitcast float* %188 to <4 x float>*
  store <4 x float> %186, <4 x float>* %189, align 4, !alias.scope !19, !noalias !21
  %190 = getelementptr float, float* %188, i64 4
  %191 = bitcast float* %190 to <4 x float>*
  store <4 x float> %187, <4 x float>* %191, align 4, !alias.scope !19, !noalias !21
  %index.next294 = or i64 %index293, 8
  %192 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv179202, i64 %index.next294
  %193 = bitcast float* %192 to <4 x float>*
  %wide.load301.1 = load <4 x float>, <4 x float>* %193, align 4, !alias.scope !14
  %194 = getelementptr float, float* %192, i64 4
  %195 = bitcast float* %194 to <4 x float>*
  %wide.load302.1 = load <4 x float>, <4 x float>* %195, align 4, !alias.scope !14
  %196 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv179202, i64 %index.next294
  %197 = bitcast float* %196 to <4 x float>*
  %wide.load303.1 = load <4 x float>, <4 x float>* %197, align 4, !alias.scope !17
  %198 = getelementptr float, float* %196, i64 4
  %199 = bitcast float* %198 to <4 x float>*
  %wide.load304.1 = load <4 x float>, <4 x float>* %199, align 4, !alias.scope !17
  %200 = fadd <4 x float> %wide.load301.1, %wide.load303.1
  %201 = fadd <4 x float> %wide.load302.1, %wide.load304.1
  %202 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv179202, i64 %index.next294
  %203 = bitcast float* %202 to <4 x float>*
  store <4 x float> %200, <4 x float>* %203, align 4, !alias.scope !19, !noalias !21
  %204 = getelementptr float, float* %202, i64 4
  %205 = bitcast float* %204 to <4 x float>*
  store <4 x float> %201, <4 x float>* %205, align 4, !alias.scope !19, !noalias !21
  %index.next294.1 = add nsw i64 %index293, 16
  %206 = icmp eq i64 %index.next294.1, 2160
  br i1 %206, label %._crit_edge177.loopexit305, label %vector.body266, !llvm.loop !22

._crit_edge178:                                   ; preds = %._crit_edge178, %._crit_edge178.preheader
  %indvars.iv201 = phi i64 [ 0, %._crit_edge178.preheader ], [ %indvars.iv.next.2, %._crit_edge178 ]
  %207 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv179202, i64 %indvars.iv201
  %208 = load float, float* %207, align 4
  %209 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv179202, i64 %indvars.iv201
  %210 = load float, float* %209, align 4
  %211 = fadd float %208, %210
  %212 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv179202, i64 %indvars.iv201
  store float %211, float* %212, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv201, 1
  %213 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv179202, i64 %indvars.iv.next
  %214 = load float, float* %213, align 4
  %215 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv179202, i64 %indvars.iv.next
  %216 = load float, float* %215, align 4
  %217 = fadd float %214, %216
  %218 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv179202, i64 %indvars.iv.next
  store float %217, float* %218, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv201, 2
  %219 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv179202, i64 %indvars.iv.next.1
  %220 = load float, float* %219, align 4
  %221 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv179202, i64 %indvars.iv.next.1
  %222 = load float, float* %221, align 4
  %223 = fadd float %220, %222
  %224 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv179202, i64 %indvars.iv.next.1
  store float %223, float* %224, align 4
  %indvars.iv.next.2 = add nsw i64 %indvars.iv201, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next.2, 2160
  br i1 %exitcond.2, label %._crit_edge177.loopexit, label %._crit_edge178, !llvm.loop !23

._crit_edge177.loopexit:                          ; preds = %._crit_edge178
  br label %._crit_edge177

._crit_edge177.loopexit305:                       ; preds = %vector.body266
  br label %._crit_edge177

._crit_edge177:                                   ; preds = %._crit_edge177.loopexit305, %._crit_edge177.loopexit
  %indvars.iv.next180 = add nuw nsw i64 %indvars.iv179202, 1
  %exitcond227 = icmp eq i64 %indvars.iv.next180, 4096
  br i1 %exitcond227, label %225, label %vector.memcheck291

; <label>:225:                                    ; preds = %._crit_edge177
  ret void

._crit_edge176.._crit_edge176_crit_edge.1:        ; preds = %._crit_edge176.._crit_edge176_crit_edge
  %indvars.iv.next182.1 = add nsw i64 %indvars.iv.next182207236, -2
  %226 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next182, i64 %indvars.iv183208
  %227 = load float, float* %226, align 4
  %228 = fmul float %50, %227
  %229 = fmul float %167, %51
  %230 = fadd float %229, %228
  %231 = fmul float %exp2, %174
  %232 = fadd float %231, %230
  %233 = fmul float %165, %36
  %234 = fadd float %233, %232
  %235 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv.next182.1, i64 %indvars.iv183208
  store float %234, float* %235, align 4
  br label %._crit_edge176.._crit_edge176_crit_edge

._crit_edge170.._crit_edge170_crit_edge.1:        ; preds = %._crit_edge170.._crit_edge170_crit_edge
  %indvars.iv.next194.1 = add nsw i64 %indvars.iv.next194220242, -2
  %236 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv195221, i64 %indvars.iv.next194
  %237 = load float, float* %236, align 4
  %238 = fmul float %50, %237
  %239 = fmul float %76, %51
  %240 = fadd float %239, %238
  %241 = fmul float %exp2, %83
  %242 = fadd float %241, %240
  %243 = fmul float %74, %36
  %244 = fadd float %243, %242
  %245 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv195221, i64 %indvars.iv.next194.1
  store float %244, float* %245, align 4
  br label %._crit_edge170.._crit_edge170_crit_edge
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [2160 x float]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %20, %3
  %indvars.iv1316 = phi i64 [ 0, %3 ], [ %indvars.iv.next14, %20 ]
  %8 = mul nuw nsw i64 %indvars.iv1316, 2160
  br label %._crit_edge12._crit_edge

._crit_edge12._crit_edge:                         ; preds = %._crit_edge12, %._crit_edge.preheader
  %indvars.iv15 = phi i64 [ 0, %._crit_edge.preheader ], [ %indvars.iv.next, %._crit_edge12 ]
  %9 = add nuw nsw i64 %indvars.iv15, %8
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge12

; <label>:13:                                     ; preds = %._crit_edge12._crit_edge
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #6
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12._crit_edge, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv1316, i64 %indvars.iv15
  %17 = load float, float* %16, align 4
  %18 = fpext float %17 to double
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %18) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv15, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2160
  br i1 %exitcond, label %20, label %._crit_edge12._crit_edge

; <label>:20:                                     ; preds = %._crit_edge12
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv1316, 1
  %exitcond17 = icmp eq i64 %indvars.iv.next14, 4096
  br i1 %exitcond17, label %21, label %._crit_edge.preheader

; <label>:21:                                     ; preds = %20
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
