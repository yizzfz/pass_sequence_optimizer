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
  call void @init_array(float* nonnull %3, [2160 x float]* %8)
  call void (...) @polybench_timer_start() #5
  %10 = load float, float* %3, align 4
  %11 = bitcast i8* %6 to [2160 x float]*
  %12 = bitcast i8* %7 to [2160 x float]*
  call void @kernel_deriche(float %10, [2160 x float]* %8, [2160 x float]* %9, [2160 x float]* %11, [2160 x float]* %12)
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
  call void @print_array([2160 x float]* %18)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  call void @free(i8* %4) #5
  call void @free(i8* %5) #5
  call void @free(i8* %6) #5
  call void @free(i8* %7) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(float* nocapture, [2160 x float]* nocapture) #2 {
  store float 2.500000e-01, float* %0, align 4
  br label %.preheader

.preheader:                                       ; preds = %middle.block, %2
  %indvars.iv14 = phi i64 [ 0, %2 ], [ %indvars.iv.next15, %middle.block ]
  %3 = mul nuw nsw i64 %indvars.iv14, 313
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %3, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %.preheader
  %index = phi i64 [ 0, %.preheader ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %.preheader ], [ %vec.ind.next, %vector.body ]
  %4 = mul nuw nsw <4 x i64> %vec.ind, <i64 991, i64 991, i64 991, i64 991>
  %5 = add nuw nsw <4 x i64> %broadcast.splat, %4
  %6 = trunc <4 x i64> %5 to <4 x i32>
  %7 = srem <4 x i32> %6, <i32 65536, i32 65536, i32 65536, i32 65536>
  %8 = sitofp <4 x i32> %7 to <4 x float>
  %9 = fdiv <4 x float> %8, <float 6.553500e+04, float 6.553500e+04, float 6.553500e+04, float 6.553500e+04>
  %10 = getelementptr inbounds [2160 x float], [2160 x float]* %1, i64 %indvars.iv14, i64 %index
  %11 = bitcast float* %10 to <4 x float>*
  store <4 x float> %9, <4 x float>* %11, align 4
  %index.next = add nuw nsw i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %12 = icmp eq i64 %index.next, 2160
  br i1 %12, label %middle.block, label %vector.body, !llvm.loop !1

middle.block:                                     ; preds = %vector.body
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 4096
  br i1 %exitcond16, label %13, label %.preheader

; <label>:13:                                     ; preds = %middle.block
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_deriche(float, [2160 x float]* nocapture readonly, [2160 x float]* nocapture, [2160 x float]* nocapture, [2160 x float]* nocapture) #0 {
  %6 = fsub float -0.000000e+00, %0
  %7 = tail call float @expf(float %6) #5
  %8 = fsub float 1.000000e+00, %7
  %9 = tail call float @expf(float %6) #5
  %10 = fsub float 1.000000e+00, %9
  %11 = fmul float %8, %10
  %12 = fmul float %0, 2.000000e+00
  %13 = tail call float @expf(float %6) #5
  %14 = fmul float %12, %13
  %15 = fadd float %14, 1.000000e+00
  %16 = tail call float @expf(float %12) #5
  %17 = fsub float %15, %16
  %18 = fdiv float %11, %17
  %19 = tail call float @expf(float %6) #5
  %20 = fmul float %18, %19
  %21 = fadd float %0, -1.000000e+00
  %22 = fmul float %20, %21
  %23 = tail call float @expf(float %6) #5
  %24 = fmul float %0, -2.000000e+00
  %25 = tail call float @expf(float %24) #5
  %exp2 = call float @llvm.exp2.f32(float %6)
  %26 = tail call float @expf(float %24) #5
  %27 = fsub float -0.000000e+00, %26
  %28 = fmul float %22, 0.000000e+00
  %29 = fmul float %exp2, 0.000000e+00
  %30 = fmul float %26, -0.000000e+00
  %31 = insertelement <2 x float> undef, float %22, i32 0
  %32 = insertelement <2 x float> %31, float %18, i32 1
  br label %.preheader176

.preheader176:                                    ; preds = %66, %5
  %indvars.iv231 = phi i64 [ 0, %5 ], [ %indvars.iv.next232, %66 ]
  %33 = getelementptr inbounds [2160 x float], [2160 x float]* %1, i64 %indvars.iv231, i64 0
  %34 = load float, float* %33, align 4
  %35 = fmul float %18, %34
  %36 = fadd float %35, %28
  %37 = fadd float %36, %29
  %38 = fadd float %37, %30
  %39 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv231, i64 0
  store float %38, float* %39, align 4
  br label %._crit_edge

.preheader175:                                    ; preds = %66
  %40 = fadd float %0, 1.000000e+00
  %41 = fmul float %18, %25
  %42 = fmul float %18, %23
  %43 = fmul float %42, %40
  %44 = fsub float -0.000000e+00, %41
  %45 = fmul float %43, 0.000000e+00
  %46 = fmul float %41, -0.000000e+00
  %47 = fadd float %45, %46
  %48 = fmul float %exp2, 0.000000e+00
  %49 = fadd float %47, %48
  %50 = fmul float %26, -0.000000e+00
  %51 = fadd float %49, %50
  br label %._crit_edge235

._crit_edge:                                      ; preds = %.preheader176, %._crit_edge
  %indvars.iv.next22910 = phi i64 [ 1, %.preheader176 ], [ %indvars.iv.next229, %._crit_edge ]
  %52 = phi float [ %38, %.preheader176 ], [ %64, %._crit_edge ]
  %53 = phi float* [ %33, %.preheader176 ], [ %55, %._crit_edge ]
  %.01571999 = phi float [ 0.000000e+00, %.preheader176 ], [ %52, %._crit_edge ]
  %54 = bitcast float* %53 to <2 x float>*
  %55 = getelementptr inbounds [2160 x float], [2160 x float]* %1, i64 %indvars.iv231, i64 %indvars.iv.next22910
  %56 = load <2 x float>, <2 x float>* %54, align 4
  %57 = fmul <2 x float> %32, %56
  %58 = extractelement <2 x float> %57, i32 0
  %59 = extractelement <2 x float> %57, i32 1
  %60 = fadd float %59, %58
  %61 = fmul float %exp2, %52
  %62 = fadd float %60, %61
  %63 = fmul float %.01571999, %27
  %64 = fadd float %62, %63
  %65 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv231, i64 %indvars.iv.next22910
  store float %64, float* %65, align 4
  %indvars.iv.next229 = add nuw nsw i64 %indvars.iv.next22910, 1
  %exitcond230 = icmp eq i64 %indvars.iv.next229, 2160
  br i1 %exitcond230, label %66, label %._crit_edge

; <label>:66:                                     ; preds = %._crit_edge
  %indvars.iv.next232 = add nuw nsw i64 %indvars.iv231, 1
  %exitcond233 = icmp eq i64 %indvars.iv.next232, 4096
  br i1 %exitcond233, label %.preheader175, label %.preheader176

._crit_edge235:                                   ; preds = %80, %.preheader175
  %indvars.iv225 = phi i64 [ 0, %.preheader175 ], [ %indvars.iv.next226, %80 ]
  %67 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv225, i64 2159
  store float %51, float* %67, align 4
  br label %._crit_edge234

._crit_edge234:                                   ; preds = %._crit_edge234.1, %._crit_edge235
  %68 = phi float [ %51, %._crit_edge235 ], [ %252, %._crit_edge234.1 ]
  %.01651938 = phi float [ 0.000000e+00, %._crit_edge235 ], [ %77, %._crit_edge234.1 ]
  %.01611957 = phi float [ 0.000000e+00, %._crit_edge235 ], [ %245, %._crit_edge234.1 ]
  %indvars.iv2236 = phi i64 [ 2159, %._crit_edge235 ], [ %indvars.iv.next224.1, %._crit_edge234.1 ]
  %indvars.iv.next224 = add nsw i64 %indvars.iv2236, -1
  %69 = getelementptr inbounds [2160 x float], [2160 x float]* %1, i64 %indvars.iv225, i64 %indvars.iv2236
  %70 = load float, float* %69, align 4
  %71 = fmul float %43, %70
  %72 = fmul float %.01611957, %44
  %73 = fadd float %71, %72
  %74 = fmul float %exp2, %68
  %75 = fadd float %73, %74
  %76 = fmul float %.01651938, %27
  %77 = fadd float %75, %76
  %78 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv225, i64 %indvars.iv.next224
  store float %77, float* %78, align 4
  %79 = icmp sgt i64 %indvars.iv2236, 1
  br i1 %79, label %._crit_edge234.1, label %80

; <label>:80:                                     ; preds = %._crit_edge234
  %indvars.iv.next226 = add nuw nsw i64 %indvars.iv225, 1
  %exitcond227 = icmp eq i64 %indvars.iv.next226, 4096
  br i1 %exitcond227, label %.preheader173.preheader, label %._crit_edge235

.preheader173.preheader:                          ; preds = %80
  br label %.preheader173

.preheader173:                                    ; preds = %.preheader173.preheader, %middle.block
  %indvars.iv220 = phi i64 [ %indvars.iv.next221, %middle.block ], [ 0, %.preheader173.preheader ]
  %scevgep = getelementptr [2160 x float], [2160 x float]* %2, i64 %indvars.iv220, i64 0
  %81 = add nuw nsw i64 %indvars.iv220, 1
  %scevgep12 = getelementptr [2160 x float], [2160 x float]* %2, i64 %81, i64 0
  %scevgep14 = getelementptr [2160 x float], [2160 x float]* %3, i64 %indvars.iv220, i64 0
  %scevgep16 = getelementptr [2160 x float], [2160 x float]* %3, i64 %81, i64 0
  %scevgep18 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv220, i64 0
  %scevgep20 = getelementptr [2160 x float], [2160 x float]* %4, i64 %81, i64 0
  %bound0 = icmp ult float* %scevgep, %scevgep16
  %bound1 = icmp ult float* %scevgep14, %scevgep12
  %found.conflict = and i1 %bound0, %bound1
  %bound022 = icmp ult float* %scevgep, %scevgep20
  %bound123 = icmp ult float* %scevgep18, %scevgep12
  %found.conflict24 = and i1 %bound022, %bound123
  %conflict.rdx = or i1 %found.conflict, %found.conflict24
  br i1 %conflict.rdx, label %._crit_edge236.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader173
  br label %vector.body

._crit_edge236.preheader:                         ; preds = %.preheader173
  br label %._crit_edge236

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next.1, %vector.body ]
  %82 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv220, i64 %index
  %83 = bitcast float* %82 to <4 x float>*
  %wide.load = load <4 x float>, <4 x float>* %83, align 4, !alias.scope !4
  %84 = getelementptr float, float* %82, i64 4
  %85 = bitcast float* %84 to <4 x float>*
  %wide.load26 = load <4 x float>, <4 x float>* %85, align 4, !alias.scope !4
  %86 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv220, i64 %index
  %87 = bitcast float* %86 to <4 x float>*
  %wide.load27 = load <4 x float>, <4 x float>* %87, align 4, !alias.scope !7
  %88 = getelementptr float, float* %86, i64 4
  %89 = bitcast float* %88 to <4 x float>*
  %wide.load28 = load <4 x float>, <4 x float>* %89, align 4, !alias.scope !7
  %90 = fadd <4 x float> %wide.load, %wide.load27
  %91 = fadd <4 x float> %wide.load26, %wide.load28
  %92 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv220, i64 %index
  %93 = bitcast float* %92 to <4 x float>*
  store <4 x float> %90, <4 x float>* %93, align 4, !alias.scope !9, !noalias !11
  %94 = getelementptr float, float* %92, i64 4
  %95 = bitcast float* %94 to <4 x float>*
  store <4 x float> %91, <4 x float>* %95, align 4, !alias.scope !9, !noalias !11
  %index.next = or i64 %index, 8
  %96 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv220, i64 %index.next
  %97 = bitcast float* %96 to <4 x float>*
  %wide.load.1 = load <4 x float>, <4 x float>* %97, align 4, !alias.scope !4
  %98 = getelementptr float, float* %96, i64 4
  %99 = bitcast float* %98 to <4 x float>*
  %wide.load26.1 = load <4 x float>, <4 x float>* %99, align 4, !alias.scope !4
  %100 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv220, i64 %index.next
  %101 = bitcast float* %100 to <4 x float>*
  %wide.load27.1 = load <4 x float>, <4 x float>* %101, align 4, !alias.scope !7
  %102 = getelementptr float, float* %100, i64 4
  %103 = bitcast float* %102 to <4 x float>*
  %wide.load28.1 = load <4 x float>, <4 x float>* %103, align 4, !alias.scope !7
  %104 = fadd <4 x float> %wide.load.1, %wide.load27.1
  %105 = fadd <4 x float> %wide.load26.1, %wide.load28.1
  %106 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv220, i64 %index.next
  %107 = bitcast float* %106 to <4 x float>*
  store <4 x float> %104, <4 x float>* %107, align 4, !alias.scope !9, !noalias !11
  %108 = getelementptr float, float* %106, i64 4
  %109 = bitcast float* %108 to <4 x float>*
  store <4 x float> %105, <4 x float>* %109, align 4, !alias.scope !9, !noalias !11
  %index.next.1 = add nsw i64 %index, 16
  %110 = icmp eq i64 %index.next.1, 2160
  br i1 %110, label %middle.block.loopexit72, label %vector.body, !llvm.loop !12

._crit_edge236:                                   ; preds = %._crit_edge236, %._crit_edge236.preheader
  %indvars.iv217 = phi i64 [ 0, %._crit_edge236.preheader ], [ %indvars.iv.next218.2, %._crit_edge236 ]
  %111 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv220, i64 %indvars.iv217
  %112 = load float, float* %111, align 4
  %113 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv220, i64 %indvars.iv217
  %114 = load float, float* %113, align 4
  %115 = fadd float %112, %114
  %116 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv220, i64 %indvars.iv217
  store float %115, float* %116, align 4
  %indvars.iv.next218 = add nuw nsw i64 %indvars.iv217, 1
  %117 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv220, i64 %indvars.iv.next218
  %118 = load float, float* %117, align 4
  %119 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv220, i64 %indvars.iv.next218
  %120 = load float, float* %119, align 4
  %121 = fadd float %118, %120
  %122 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv220, i64 %indvars.iv.next218
  store float %121, float* %122, align 4
  %indvars.iv.next218.1 = add nsw i64 %indvars.iv217, 2
  %123 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv220, i64 %indvars.iv.next218.1
  %124 = load float, float* %123, align 4
  %125 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv220, i64 %indvars.iv.next218.1
  %126 = load float, float* %125, align 4
  %127 = fadd float %124, %126
  %128 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv220, i64 %indvars.iv.next218.1
  store float %127, float* %128, align 4
  %indvars.iv.next218.2 = add nsw i64 %indvars.iv217, 3
  %exitcond219.2 = icmp eq i64 %indvars.iv.next218.2, 2160
  br i1 %exitcond219.2, label %middle.block.loopexit, label %._crit_edge236, !llvm.loop !13

middle.block.loopexit:                            ; preds = %._crit_edge236
  br label %middle.block

middle.block.loopexit72:                          ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit72, %middle.block.loopexit
  %indvars.iv.next221 = add nuw nsw i64 %indvars.iv220, 1
  %exitcond222 = icmp eq i64 %indvars.iv.next221, 4096
  br i1 %exitcond222, label %.preheader171.preheader, label %.preheader173

.preheader171.preheader:                          ; preds = %middle.block
  %129 = fmul float %22, 0.000000e+00
  %130 = fmul float %exp2, 0.000000e+00
  %131 = fmul float %26, -0.000000e+00
  br label %.preheader171

.preheader171:                                    ; preds = %.preheader171.preheader, %152
  %indvars.iv214 = phi i64 [ %indvars.iv.next215, %152 ], [ 0, %.preheader171.preheader ]
  %132 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 0, i64 %indvars.iv214
  %133 = load float, float* %132, align 4
  %134 = fmul float %18, %133
  %135 = fadd float %134, %129
  %136 = fadd float %135, %130
  %137 = fadd float %136, %131
  %138 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 0, i64 %indvars.iv214
  store float %137, float* %138, align 4
  br label %._crit_edge237

._crit_edge237:                                   ; preds = %._crit_edge237.1, %.preheader171
  %indvars.iv.next2125 = phi i64 [ 1, %.preheader171 ], [ %indvars.iv.next212.1, %._crit_edge237.1 ]
  %139 = phi float [ %137, %.preheader171 ], [ %242, %._crit_edge237.1 ]
  %140 = phi float* [ %132, %.preheader171 ], [ %234, %._crit_edge237.1 ]
  %.11581864 = phi float [ 0.000000e+00, %.preheader171 ], [ %150, %._crit_edge237.1 ]
  %141 = load float, float* %140, align 4
  %142 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv.next2125, i64 %indvars.iv214
  %143 = load float, float* %142, align 4
  %144 = fmul float %18, %143
  %145 = fmul float %22, %141
  %146 = fadd float %144, %145
  %147 = fmul float %exp2, %139
  %148 = fadd float %146, %147
  %149 = fmul float %.11581864, %27
  %150 = fadd float %148, %149
  %151 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv.next2125, i64 %indvars.iv214
  store float %150, float* %151, align 4
  %indvars.iv.next212 = add nuw nsw i64 %indvars.iv.next2125, 1
  %exitcond213 = icmp eq i64 %indvars.iv.next212, 4096
  br i1 %exitcond213, label %152, label %._crit_edge237.1

; <label>:152:                                    ; preds = %._crit_edge237
  %indvars.iv.next215 = add nuw nsw i64 %indvars.iv214, 1
  %exitcond216 = icmp eq i64 %indvars.iv.next215, 2160
  br i1 %exitcond216, label %.preheader170.preheader, label %.preheader171

.preheader170.preheader:                          ; preds = %152
  %153 = fmul float %43, 0.000000e+00
  %154 = fmul float %41, -0.000000e+00
  %155 = fadd float %153, %154
  %156 = fmul float %exp2, 0.000000e+00
  %157 = fadd float %155, %156
  %158 = fmul float %26, -0.000000e+00
  %159 = fadd float %157, %158
  br label %.preheader170

.preheader170:                                    ; preds = %.preheader170.preheader, %173
  %indvars.iv208 = phi i64 [ %indvars.iv.next209, %173 ], [ 0, %.preheader170.preheader ]
  %160 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 4095, i64 %indvars.iv208
  store float %159, float* %160, align 4
  br label %._crit_edge238

._crit_edge238:                                   ; preds = %._crit_edge238.1, %.preheader170
  %161 = phi float [ %159, %.preheader170 ], [ %231, %._crit_edge238.1 ]
  %.11661803 = phi float [ 0.000000e+00, %.preheader170 ], [ %170, %._crit_edge238.1 ]
  %.01631822 = phi float [ 0.000000e+00, %.preheader170 ], [ %224, %._crit_edge238.1 ]
  %indvars.iv2061 = phi i64 [ 4095, %.preheader170 ], [ %indvars.iv.next207.1, %._crit_edge238.1 ]
  %indvars.iv.next207 = add nsw i64 %indvars.iv2061, -1
  %162 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv2061, i64 %indvars.iv208
  %163 = load float, float* %162, align 4
  %164 = fmul float %43, %163
  %165 = fmul float %.01631822, %44
  %166 = fadd float %164, %165
  %167 = fmul float %exp2, %161
  %168 = fadd float %166, %167
  %169 = fmul float %.11661803, %27
  %170 = fadd float %168, %169
  %171 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next207, i64 %indvars.iv208
  store float %170, float* %171, align 4
  %172 = icmp sgt i64 %indvars.iv2061, 1
  br i1 %172, label %._crit_edge238.1, label %173

; <label>:173:                                    ; preds = %._crit_edge238
  %indvars.iv.next209 = add nuw nsw i64 %indvars.iv208, 1
  %exitcond210 = icmp eq i64 %indvars.iv.next209, 2160
  br i1 %exitcond210, label %.preheader.preheader, label %.preheader170

.preheader.preheader:                             ; preds = %173
  br label %.preheader

.preheader:                                       ; preds = %.preheader.preheader, %middle.block30
  %indvars.iv203 = phi i64 [ %indvars.iv.next204, %middle.block30 ], [ 0, %.preheader.preheader ]
  %scevgep34 = getelementptr [2160 x float], [2160 x float]* %2, i64 %indvars.iv203, i64 0
  %174 = add nuw nsw i64 %indvars.iv203, 1
  %scevgep36 = getelementptr [2160 x float], [2160 x float]* %2, i64 %174, i64 0
  %scevgep38 = getelementptr [2160 x float], [2160 x float]* %3, i64 %indvars.iv203, i64 0
  %scevgep40 = getelementptr [2160 x float], [2160 x float]* %3, i64 %174, i64 0
  %scevgep42 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv203, i64 0
  %scevgep44 = getelementptr [2160 x float], [2160 x float]* %4, i64 %174, i64 0
  %bound046 = icmp ult float* %scevgep34, %scevgep40
  %bound147 = icmp ult float* %scevgep38, %scevgep36
  %found.conflict48 = and i1 %bound046, %bound147
  %bound049 = icmp ult float* %scevgep34, %scevgep44
  %bound150 = icmp ult float* %scevgep42, %scevgep36
  %found.conflict51 = and i1 %bound049, %bound150
  %conflict.rdx52 = or i1 %found.conflict48, %found.conflict51
  br i1 %conflict.rdx52, label %._crit_edge239.preheader, label %vector.body29.preheader

vector.body29.preheader:                          ; preds = %.preheader
  br label %vector.body29

._crit_edge239.preheader:                         ; preds = %.preheader
  br label %._crit_edge239

vector.body29:                                    ; preds = %vector.body29, %vector.body29.preheader
  %index56 = phi i64 [ 0, %vector.body29.preheader ], [ %index.next57.1, %vector.body29 ]
  %175 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv203, i64 %index56
  %176 = bitcast float* %175 to <4 x float>*
  %wide.load64 = load <4 x float>, <4 x float>* %176, align 4, !alias.scope !14
  %177 = getelementptr float, float* %175, i64 4
  %178 = bitcast float* %177 to <4 x float>*
  %wide.load65 = load <4 x float>, <4 x float>* %178, align 4, !alias.scope !14
  %179 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv203, i64 %index56
  %180 = bitcast float* %179 to <4 x float>*
  %wide.load66 = load <4 x float>, <4 x float>* %180, align 4, !alias.scope !17
  %181 = getelementptr float, float* %179, i64 4
  %182 = bitcast float* %181 to <4 x float>*
  %wide.load67 = load <4 x float>, <4 x float>* %182, align 4, !alias.scope !17
  %183 = fadd <4 x float> %wide.load64, %wide.load66
  %184 = fadd <4 x float> %wide.load65, %wide.load67
  %185 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv203, i64 %index56
  %186 = bitcast float* %185 to <4 x float>*
  store <4 x float> %183, <4 x float>* %186, align 4, !alias.scope !19, !noalias !21
  %187 = getelementptr float, float* %185, i64 4
  %188 = bitcast float* %187 to <4 x float>*
  store <4 x float> %184, <4 x float>* %188, align 4, !alias.scope !19, !noalias !21
  %index.next57 = or i64 %index56, 8
  %189 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv203, i64 %index.next57
  %190 = bitcast float* %189 to <4 x float>*
  %wide.load64.1 = load <4 x float>, <4 x float>* %190, align 4, !alias.scope !14
  %191 = getelementptr float, float* %189, i64 4
  %192 = bitcast float* %191 to <4 x float>*
  %wide.load65.1 = load <4 x float>, <4 x float>* %192, align 4, !alias.scope !14
  %193 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv203, i64 %index.next57
  %194 = bitcast float* %193 to <4 x float>*
  %wide.load66.1 = load <4 x float>, <4 x float>* %194, align 4, !alias.scope !17
  %195 = getelementptr float, float* %193, i64 4
  %196 = bitcast float* %195 to <4 x float>*
  %wide.load67.1 = load <4 x float>, <4 x float>* %196, align 4, !alias.scope !17
  %197 = fadd <4 x float> %wide.load64.1, %wide.load66.1
  %198 = fadd <4 x float> %wide.load65.1, %wide.load67.1
  %199 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv203, i64 %index.next57
  %200 = bitcast float* %199 to <4 x float>*
  store <4 x float> %197, <4 x float>* %200, align 4, !alias.scope !19, !noalias !21
  %201 = getelementptr float, float* %199, i64 4
  %202 = bitcast float* %201 to <4 x float>*
  store <4 x float> %198, <4 x float>* %202, align 4, !alias.scope !19, !noalias !21
  %index.next57.1 = add nsw i64 %index56, 16
  %203 = icmp eq i64 %index.next57.1, 2160
  br i1 %203, label %middle.block30.loopexit71, label %vector.body29, !llvm.loop !22

._crit_edge239:                                   ; preds = %._crit_edge239, %._crit_edge239.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge239.preheader ], [ %indvars.iv.next.2, %._crit_edge239 ]
  %204 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv203, i64 %indvars.iv
  %205 = load float, float* %204, align 4
  %206 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv203, i64 %indvars.iv
  %207 = load float, float* %206, align 4
  %208 = fadd float %205, %207
  %209 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv203, i64 %indvars.iv
  store float %208, float* %209, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %210 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv203, i64 %indvars.iv.next
  %211 = load float, float* %210, align 4
  %212 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv203, i64 %indvars.iv.next
  %213 = load float, float* %212, align 4
  %214 = fadd float %211, %213
  %215 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv203, i64 %indvars.iv.next
  store float %214, float* %215, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %216 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv203, i64 %indvars.iv.next.1
  %217 = load float, float* %216, align 4
  %218 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv203, i64 %indvars.iv.next.1
  %219 = load float, float* %218, align 4
  %220 = fadd float %217, %219
  %221 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv203, i64 %indvars.iv.next.1
  store float %220, float* %221, align 4
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next.2, 2160
  br i1 %exitcond.2, label %middle.block30.loopexit, label %._crit_edge239, !llvm.loop !23

middle.block30.loopexit:                          ; preds = %._crit_edge239
  br label %middle.block30

middle.block30.loopexit71:                        ; preds = %vector.body29
  br label %middle.block30

middle.block30:                                   ; preds = %middle.block30.loopexit71, %middle.block30.loopexit
  %indvars.iv.next204 = add nuw nsw i64 %indvars.iv203, 1
  %exitcond205 = icmp eq i64 %indvars.iv.next204, 4096
  br i1 %exitcond205, label %222, label %.preheader

; <label>:222:                                    ; preds = %middle.block30
  ret void

._crit_edge238.1:                                 ; preds = %._crit_edge238
  %indvars.iv.next207.1 = add nsw i64 %indvars.iv2061, -2
  %223 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv.next207, i64 %indvars.iv208
  %224 = load float, float* %223, align 4
  %225 = fmul float %43, %224
  %226 = fmul float %163, %44
  %227 = fadd float %225, %226
  %228 = fmul float %exp2, %170
  %229 = fadd float %227, %228
  %230 = fmul float %161, %27
  %231 = fadd float %229, %230
  %232 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next207.1, i64 %indvars.iv208
  store float %231, float* %232, align 4
  br label %._crit_edge238

._crit_edge237.1:                                 ; preds = %._crit_edge237
  %233 = load float, float* %142, align 4
  %234 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv.next212, i64 %indvars.iv214
  %235 = load float, float* %234, align 4
  %236 = fmul float %18, %235
  %237 = fmul float %22, %233
  %238 = fadd float %236, %237
  %239 = fmul float %exp2, %150
  %240 = fadd float %238, %239
  %241 = fmul float %139, %27
  %242 = fadd float %240, %241
  %243 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv.next212, i64 %indvars.iv214
  store float %242, float* %243, align 4
  %indvars.iv.next212.1 = add nsw i64 %indvars.iv.next2125, 2
  br label %._crit_edge237

._crit_edge234.1:                                 ; preds = %._crit_edge234
  %indvars.iv.next224.1 = add nsw i64 %indvars.iv2236, -2
  %244 = getelementptr inbounds [2160 x float], [2160 x float]* %1, i64 %indvars.iv225, i64 %indvars.iv.next224
  %245 = load float, float* %244, align 4
  %246 = fmul float %43, %245
  %247 = fmul float %70, %44
  %248 = fadd float %246, %247
  %249 = fmul float %exp2, %77
  %250 = fadd float %248, %249
  %251 = fmul float %68, %27
  %252 = fadd float %250, %251
  %253 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv225, i64 %indvars.iv.next224.1
  store float %252, float* %253, align 4
  br label %._crit_edge234
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([2160 x float]* nocapture readonly) #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.preheader

.preheader:                                       ; preds = %18, %1
  %indvars.iv14 = phi i64 [ 0, %1 ], [ %indvars.iv.next15, %18 ]
  %6 = mul nuw nsw i64 %indvars.iv14, 2160
  br label %._crit_edge17

._crit_edge17:                                    ; preds = %._crit_edge, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next, %._crit_edge ]
  %7 = add nuw nsw i64 %6, %indvars.iv
  %8 = trunc i64 %7 to i32
  %9 = srem i32 %8, 20
  %10 = icmp eq i32 %9, 0
  br i1 %10, label %11, label %._crit_edge

; <label>:11:                                     ; preds = %._crit_edge17
  %12 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %12) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge17, %11
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %14 = getelementptr inbounds [2160 x float], [2160 x float]* %0, i64 %indvars.iv14, i64 %indvars.iv
  %15 = load float, float* %14, align 4
  %16 = fpext float %15 to double
  %17 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %13, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %16) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2160
  br i1 %exitcond, label %18, label %._crit_edge17

; <label>:18:                                     ; preds = %._crit_edge
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 4096
  br i1 %exitcond16, label %19, label %.preheader

; <label>:19:                                     ; preds = %18
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #6
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
