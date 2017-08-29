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
.preheader.us.preheader:
  store float 2.500000e-01, float* %2, align 4
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv11 = phi i64 [ %indvars.iv.next12, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %4 = mul nuw nsw i64 %indvars.iv11, 313
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %4, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %.preheader.us
  %index = phi i64 [ 0, %.preheader.us ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %.preheader.us ], [ %vec.ind.next, %vector.body ]
  %5 = mul nuw nsw <4 x i64> %vec.ind, <i64 991, i64 991, i64 991, i64 991>
  %6 = add nuw nsw <4 x i64> %broadcast.splat, %5
  %7 = trunc <4 x i64> %6 to <4 x i32>
  %8 = srem <4 x i32> %7, <i32 65536, i32 65536, i32 65536, i32 65536>
  %9 = sitofp <4 x i32> %8 to <4 x float>
  %10 = fdiv <4 x float> %9, <float 6.553500e+04, float 6.553500e+04, float 6.553500e+04, float 6.553500e+04>
  %11 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv11, i64 %index
  %12 = bitcast float* %11 to <4 x float>*
  store <4 x float> %10, <4 x float>* %12, align 4
  %index.next = add nuw nsw i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %13 = icmp eq i64 %index.next, 2160
  br i1 %13, label %._crit_edge.us, label %vector.body, !llvm.loop !1

._crit_edge.us:                                   ; preds = %vector.body
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next12, 4096
  br i1 %exitcond14, label %._crit_edge3, label %.preheader.us

._crit_edge3:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_deriche(i32, i32, float, [2160 x float]* nocapture readonly, [2160 x float]* nocapture, [2160 x float]* nocapture, [2160 x float]* nocapture) unnamed_addr #0 {
.lr.ph42:
  %7 = fsub float -0.000000e+00, %2
  %8 = call float @expf(float %7) #5
  %9 = fsub float 1.000000e+00, %8
  %10 = call float @expf(float %7) #5
  %11 = fsub float 1.000000e+00, %10
  %12 = fmul float %9, %11
  %13 = fmul float %2, 2.000000e+00
  %14 = call float @expf(float %7) #5
  %15 = fmul float %13, %14
  %16 = fadd float %15, 1.000000e+00
  %17 = call float @expf(float %13) #5
  %18 = fsub float %16, %17
  %19 = fdiv float %12, %18
  %20 = call float @expf(float %7) #5
  %21 = fmul float %19, %20
  %22 = call float @expf(float %7) #5
  %23 = fmul float %19, %22
  %24 = insertelement <2 x float> undef, float %2, i32 0
  %25 = shufflevector <2 x float> %24, <2 x float> undef, <2 x i32> zeroinitializer
  %26 = fadd <2 x float> %25, <float -1.000000e+00, float 1.000000e+00>
  %27 = insertelement <2 x float> undef, float %21, i32 0
  %28 = insertelement <2 x float> %27, float %23, i32 1
  %29 = fmul <2 x float> %28, %26
  %30 = extractelement <2 x float> %29, i32 0
  %31 = fmul float %2, -2.000000e+00
  %32 = call float @expf(float %31) #5
  %33 = fmul float %19, %32
  %exp2 = call float @llvm.exp2.f32(float %7)
  %34 = call float @expf(float %31) #5
  %35 = fsub float -0.000000e+00, %34
  br label %.lr.ph42.split.us

.lr.ph42.split.us:                                ; preds = %.lr.ph42, %._crit_edge40.us
  %indvars.iv108 = phi i64 [ %indvars.iv.next109, %._crit_edge40.us ], [ 0, %.lr.ph42 ]
  br label %._crit_edge46.us

._crit_edge46.us:                                 ; preds = %._crit_edge46.us, %.lr.ph42.split.us
  %indvars.iv104 = phi i64 [ 0, %.lr.ph42.split.us ], [ %indvars.iv.next105.1, %._crit_edge46.us ]
  %36 = phi float [ 0.000000e+00, %.lr.ph42.split.us ], [ %58, %._crit_edge46.us ]
  %37 = phi float [ 0.000000e+00, %.lr.ph42.split.us ], [ %47, %._crit_edge46.us ]
  %38 = phi float [ 0.000000e+00, %.lr.ph42.split.us ], [ %60, %._crit_edge46.us ]
  %39 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv108, i64 %indvars.iv104
  %40 = load float, float* %39, align 4
  %41 = fmul float %19, %40
  %42 = fmul float %30, %38
  %43 = fadd float %41, %42
  %44 = fmul float %exp2, %36
  %45 = fadd float %43, %44
  %46 = fmul float %37, %35
  %47 = fadd float %45, %46
  %48 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv108, i64 %indvars.iv104
  store float %47, float* %48, align 4
  %49 = load float, float* %39, align 4
  %indvars.iv.next105 = or i64 %indvars.iv104, 1
  %50 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv108, i64 %indvars.iv.next105
  %51 = load float, float* %50, align 4
  %52 = fmul float %19, %51
  %53 = fmul float %30, %49
  %54 = fadd float %52, %53
  %55 = fmul float %exp2, %47
  %56 = fadd float %54, %55
  %57 = fmul float %36, %35
  %58 = fadd float %56, %57
  %59 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv108, i64 %indvars.iv.next105
  store float %58, float* %59, align 4
  %60 = load float, float* %50, align 4
  %indvars.iv.next105.1 = add nsw i64 %indvars.iv104, 2
  %exitcond107.1 = icmp eq i64 %indvars.iv.next105.1, 2160
  br i1 %exitcond107.1, label %._crit_edge40.us, label %._crit_edge46.us

._crit_edge40.us:                                 ; preds = %._crit_edge46.us
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  %exitcond111 = icmp eq i64 %indvars.iv.next109, 4096
  br i1 %exitcond111, label %.lr.ph36.split.us.preheader, label %.lr.ph42.split.us

.lr.ph36.split.us.preheader:                      ; preds = %._crit_edge40.us
  %61 = extractelement <2 x float> %29, i32 1
  %62 = fsub float -0.000000e+00, %33
  br label %.lr.ph36.split.us

.lr.ph36.split.us:                                ; preds = %.lr.ph36.split.us.preheader, %._crit_edge35.us
  %indvars.iv99 = phi i64 [ %indvars.iv.next100, %._crit_edge35.us ], [ 0, %.lr.ph36.split.us.preheader ]
  br label %._crit_edge49.us

._crit_edge49.us:                                 ; preds = %._crit_edge49.us, %.lr.ph36.split.us
  %indvars.iv97 = phi i64 [ %indvars.iv.next98, %._crit_edge49.us ], [ 2160, %.lr.ph36.split.us ]
  %63 = phi float [ %74, %._crit_edge49.us ], [ 0.000000e+00, %.lr.ph36.split.us ]
  %64 = phi i32 [ %78, %._crit_edge49.us ], [ 0, %.lr.ph36.split.us ]
  %65 = phi float [ %63, %._crit_edge49.us ], [ 0.000000e+00, %.lr.ph36.split.us ]
  %66 = phi float [ %81, %._crit_edge49.us ], [ 0.000000e+00, %.lr.ph36.split.us ]
  %67 = phi float [ %80, %._crit_edge49.us ], [ 0.000000e+00, %.lr.ph36.split.us ]
  %indvars.iv.next98 = add nsw i64 %indvars.iv97, -1
  %68 = fmul float %61, %67
  %69 = fmul float %66, %62
  %70 = fadd float %68, %69
  %71 = fmul float %exp2, %63
  %72 = fadd float %70, %71
  %73 = fmul float %65, %35
  %74 = fadd float %72, %73
  %75 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv99, i64 %indvars.iv.next98
  store float %74, float* %75, align 4
  %76 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv99, i64 %indvars.iv.next98
  %77 = bitcast float* %76 to i32*
  %78 = load i32, i32* %77, align 4
  %79 = icmp sgt i64 %indvars.iv97, 1
  %80 = bitcast i32 %78 to float
  %81 = bitcast i32 %64 to float
  br i1 %79, label %._crit_edge49.us, label %._crit_edge35.us

._crit_edge35.us:                                 ; preds = %._crit_edge49.us
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv99, 1
  %exitcond102 = icmp eq i64 %indvars.iv.next100, 4096
  br i1 %exitcond102, label %.preheader15.us.preheader, label %.lr.ph36.split.us

.preheader15.us.preheader:                        ; preds = %._crit_edge35.us
  br label %.preheader15.us

.preheader15.us:                                  ; preds = %.preheader15.us.preheader, %._crit_edge30.us
  %indvars.iv92 = phi i64 [ %indvars.iv.next93, %._crit_edge30.us ], [ 0, %.preheader15.us.preheader ]
  %scevgep116 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv92, i64 0
  %scevgep119 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv92, i64 2160
  %scevgep122 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv92, i64 0
  %scevgep125 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv92, i64 2160
  %scevgep128 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv92, i64 0
  %scevgep131 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv92, i64 2160
  %bound0 = icmp ult float* %scevgep116, %scevgep125
  %bound1 = icmp ult float* %scevgep122, %scevgep119
  %found.conflict = and i1 %bound0, %bound1
  %bound0133 = icmp ult float* %scevgep116, %scevgep131
  %bound1134 = icmp ult float* %scevgep128, %scevgep119
  %found.conflict135 = and i1 %bound0133, %bound1134
  %conflict.rdx = or i1 %found.conflict, %found.conflict135
  br i1 %conflict.rdx, label %._crit_edge51.us.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader15.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next.1, %vector.body ]
  %82 = shl i64 %index, 1
  %83 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv92, i64 %82
  %84 = bitcast float* %83 to <8 x float>*
  %wide.vec = load <8 x float>, <8 x float>* %84, align 4, !alias.scope !4
  %85 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv92, i64 %82
  %86 = bitcast float* %85 to <8 x float>*
  %wide.vec137 = load <8 x float>, <8 x float>* %86, align 4, !alias.scope !7
  %87 = fadd <8 x float> %wide.vec, %wide.vec137
  %88 = or i64 %82, 1
  %89 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv92, i64 %88
  %90 = getelementptr float, float* %89, i64 -1
  %91 = bitcast float* %90 to <8 x float>*
  store <8 x float> %87, <8 x float>* %91, align 4, !alias.scope !9, !noalias !11
  %index.next = shl i64 %index, 1
  %92 = or i64 %index.next, 8
  %93 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv92, i64 %92
  %94 = bitcast float* %93 to <8 x float>*
  %wide.vec.1 = load <8 x float>, <8 x float>* %94, align 4, !alias.scope !4
  %95 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv92, i64 %92
  %96 = bitcast float* %95 to <8 x float>*
  %wide.vec137.1 = load <8 x float>, <8 x float>* %96, align 4, !alias.scope !7
  %97 = fadd <8 x float> %wide.vec.1, %wide.vec137.1
  %98 = or i64 %index.next, 9
  %99 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv92, i64 %98
  %100 = getelementptr float, float* %99, i64 -1
  %101 = bitcast float* %100 to <8 x float>*
  store <8 x float> %97, <8 x float>* %101, align 4, !alias.scope !9, !noalias !11
  %index.next.1 = add nsw i64 %index, 8
  %102 = icmp eq i64 %index.next.1, 1080
  br i1 %102, label %middle.block, label %vector.body, !llvm.loop !12

middle.block:                                     ; preds = %vector.body
  br label %._crit_edge30.us

._crit_edge51.us.preheader:                       ; preds = %.preheader15.us
  br label %._crit_edge51.us

._crit_edge51.us:                                 ; preds = %._crit_edge51.us.preheader, %._crit_edge51.us
  %indvars.iv86 = phi i64 [ %indvars.iv.next87.1, %._crit_edge51.us ], [ 0, %._crit_edge51.us.preheader ]
  %103 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv92, i64 %indvars.iv86
  %104 = load float, float* %103, align 4
  %105 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv92, i64 %indvars.iv86
  %106 = load float, float* %105, align 4
  %107 = fadd float %104, %106
  %108 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv92, i64 %indvars.iv86
  store float %107, float* %108, align 4
  %indvars.iv.next87 = or i64 %indvars.iv86, 1
  %109 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv92, i64 %indvars.iv.next87
  %110 = load float, float* %109, align 4
  %111 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv92, i64 %indvars.iv.next87
  %112 = load float, float* %111, align 4
  %113 = fadd float %110, %112
  %114 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv92, i64 %indvars.iv.next87
  store float %113, float* %114, align 4
  %indvars.iv.next87.1 = add nuw nsw i64 %indvars.iv86, 2
  %exitcond89.1 = icmp eq i64 %indvars.iv.next87.1, 2160
  br i1 %exitcond89.1, label %._crit_edge30.us.loopexit, label %._crit_edge51.us, !llvm.loop !13

._crit_edge30.us.loopexit:                        ; preds = %._crit_edge51.us
  br label %._crit_edge30.us

._crit_edge30.us:                                 ; preds = %._crit_edge30.us.loopexit, %middle.block
  %indvars.iv.next93 = add nuw nsw i64 %indvars.iv92, 1
  %exitcond95 = icmp eq i64 %indvars.iv.next93, 4096
  br i1 %exitcond95, label %.lr.ph27.split.us.preheader, label %.preheader15.us

.lr.ph27.split.us.preheader:                      ; preds = %._crit_edge30.us
  br label %.lr.ph27.split.us

.lr.ph27.split.us:                                ; preds = %.lr.ph27.split.us.preheader, %._crit_edge26.us
  %indvars.iv81 = phi i64 [ %indvars.iv.next82, %._crit_edge26.us ], [ 0, %.lr.ph27.split.us.preheader ]
  br label %._crit_edge53.us

._crit_edge53.us:                                 ; preds = %._crit_edge53.us, %.lr.ph27.split.us
  %indvars.iv77 = phi i64 [ 0, %.lr.ph27.split.us ], [ %indvars.iv.next78.1, %._crit_edge53.us ]
  %115 = phi float [ 0.000000e+00, %.lr.ph27.split.us ], [ %137, %._crit_edge53.us ]
  %116 = phi float [ 0.000000e+00, %.lr.ph27.split.us ], [ %126, %._crit_edge53.us ]
  %117 = phi float [ 0.000000e+00, %.lr.ph27.split.us ], [ %139, %._crit_edge53.us ]
  %118 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv77, i64 %indvars.iv81
  %119 = load float, float* %118, align 4
  %120 = fmul float %19, %119
  %121 = fmul float %30, %117
  %122 = fadd float %120, %121
  %123 = fmul float %exp2, %115
  %124 = fadd float %122, %123
  %125 = fmul float %116, %35
  %126 = fadd float %124, %125
  %127 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv77, i64 %indvars.iv81
  store float %126, float* %127, align 4
  %128 = load float, float* %118, align 4
  %indvars.iv.next78 = or i64 %indvars.iv77, 1
  %129 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next78, i64 %indvars.iv81
  %130 = load float, float* %129, align 4
  %131 = fmul float %19, %130
  %132 = fmul float %30, %128
  %133 = fadd float %131, %132
  %134 = fmul float %exp2, %126
  %135 = fadd float %133, %134
  %136 = fmul float %115, %35
  %137 = fadd float %135, %136
  %138 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv.next78, i64 %indvars.iv81
  store float %137, float* %138, align 4
  %139 = load float, float* %129, align 4
  %indvars.iv.next78.1 = add nsw i64 %indvars.iv77, 2
  %exitcond80.1 = icmp eq i64 %indvars.iv.next78.1, 4096
  br i1 %exitcond80.1, label %._crit_edge26.us, label %._crit_edge53.us

._crit_edge26.us:                                 ; preds = %._crit_edge53.us
  %indvars.iv.next82 = add nuw nsw i64 %indvars.iv81, 1
  %exitcond84 = icmp eq i64 %indvars.iv.next82, 2160
  br i1 %exitcond84, label %.lr.ph23.split.us.preheader, label %.lr.ph27.split.us

.lr.ph23.split.us.preheader:                      ; preds = %._crit_edge26.us
  br label %.lr.ph23.split.us

.lr.ph23.split.us:                                ; preds = %.lr.ph23.split.us.preheader, %._crit_edge22.us
  %indvars.iv72 = phi i64 [ %indvars.iv.next73, %._crit_edge22.us ], [ 0, %.lr.ph23.split.us.preheader ]
  br label %._crit_edge56.us

._crit_edge56.us:                                 ; preds = %._crit_edge56.us, %.lr.ph23.split.us
  %indvars.iv70 = phi i64 [ %indvars.iv.next71, %._crit_edge56.us ], [ 4096, %.lr.ph23.split.us ]
  %140 = phi float [ %151, %._crit_edge56.us ], [ 0.000000e+00, %.lr.ph23.split.us ]
  %141 = phi i32 [ %155, %._crit_edge56.us ], [ 0, %.lr.ph23.split.us ]
  %142 = phi float [ %140, %._crit_edge56.us ], [ 0.000000e+00, %.lr.ph23.split.us ]
  %143 = phi float [ %158, %._crit_edge56.us ], [ 0.000000e+00, %.lr.ph23.split.us ]
  %144 = phi float [ %157, %._crit_edge56.us ], [ 0.000000e+00, %.lr.ph23.split.us ]
  %indvars.iv.next71 = add nsw i64 %indvars.iv70, -1
  %145 = fmul float %61, %144
  %146 = fmul float %143, %62
  %147 = fadd float %145, %146
  %148 = fmul float %exp2, %140
  %149 = fadd float %147, %148
  %150 = fmul float %142, %35
  %151 = fadd float %149, %150
  %152 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv.next71, i64 %indvars.iv72
  store float %151, float* %152, align 4
  %153 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next71, i64 %indvars.iv72
  %154 = bitcast float* %153 to i32*
  %155 = load i32, i32* %154, align 4
  %156 = icmp sgt i64 %indvars.iv70, 1
  %157 = bitcast i32 %155 to float
  %158 = bitcast i32 %141 to float
  br i1 %156, label %._crit_edge56.us, label %._crit_edge22.us

._crit_edge22.us:                                 ; preds = %._crit_edge56.us
  %indvars.iv.next73 = add nuw nsw i64 %indvars.iv72, 1
  %exitcond75 = icmp eq i64 %indvars.iv.next73, 2160
  br i1 %exitcond75, label %.preheader.us.preheader, label %.lr.ph23.split.us

.preheader.us.preheader:                          ; preds = %._crit_edge22.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep150 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv66, i64 0
  %scevgep153 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv66, i64 2160
  %scevgep156 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv66, i64 0
  %scevgep159 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv66, i64 2160
  %scevgep162 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv66, i64 0
  %scevgep165 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv66, i64 2160
  %bound0167 = icmp ult float* %scevgep150, %scevgep159
  %bound1168 = icmp ult float* %scevgep156, %scevgep153
  %found.conflict169 = and i1 %bound0167, %bound1168
  %bound0170 = icmp ult float* %scevgep150, %scevgep165
  %bound1171 = icmp ult float* %scevgep162, %scevgep153
  %found.conflict172 = and i1 %bound0170, %bound1171
  %conflict.rdx173 = or i1 %found.conflict169, %found.conflict172
  br i1 %conflict.rdx173, label %._crit_edge58.us.preheader, label %vector.body140.preheader

vector.body140.preheader:                         ; preds = %.preheader.us
  br label %vector.body140

vector.body140:                                   ; preds = %vector.body140, %vector.body140.preheader
  %index177 = phi i64 [ 0, %vector.body140.preheader ], [ %index.next178.1, %vector.body140 ]
  %159 = shl i64 %index177, 1
  %160 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv66, i64 %159
  %161 = bitcast float* %160 to <8 x float>*
  %wide.vec186 = load <8 x float>, <8 x float>* %161, align 4, !alias.scope !14
  %162 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv66, i64 %159
  %163 = bitcast float* %162 to <8 x float>*
  %wide.vec189 = load <8 x float>, <8 x float>* %163, align 4, !alias.scope !17
  %164 = fadd <8 x float> %wide.vec186, %wide.vec189
  %165 = or i64 %159, 1
  %166 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv66, i64 %165
  %167 = getelementptr float, float* %166, i64 -1
  %168 = bitcast float* %167 to <8 x float>*
  store <8 x float> %164, <8 x float>* %168, align 4, !alias.scope !19, !noalias !21
  %index.next178 = shl i64 %index177, 1
  %169 = or i64 %index.next178, 8
  %170 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv66, i64 %169
  %171 = bitcast float* %170 to <8 x float>*
  %wide.vec186.1 = load <8 x float>, <8 x float>* %171, align 4, !alias.scope !14
  %172 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv66, i64 %169
  %173 = bitcast float* %172 to <8 x float>*
  %wide.vec189.1 = load <8 x float>, <8 x float>* %173, align 4, !alias.scope !17
  %174 = fadd <8 x float> %wide.vec186.1, %wide.vec189.1
  %175 = or i64 %index.next178, 9
  %176 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv66, i64 %175
  %177 = getelementptr float, float* %176, i64 -1
  %178 = bitcast float* %177 to <8 x float>*
  store <8 x float> %174, <8 x float>* %178, align 4, !alias.scope !19, !noalias !21
  %index.next178.1 = add nsw i64 %index177, 8
  %179 = icmp eq i64 %index.next178.1, 1080
  br i1 %179, label %middle.block141, label %vector.body140, !llvm.loop !22

middle.block141:                                  ; preds = %vector.body140
  br label %._crit_edge.us

._crit_edge58.us.preheader:                       ; preds = %.preheader.us
  br label %._crit_edge58.us

._crit_edge58.us:                                 ; preds = %._crit_edge58.us.preheader, %._crit_edge58.us
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %._crit_edge58.us ], [ 0, %._crit_edge58.us.preheader ]
  %180 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv66, i64 %indvars.iv
  %181 = load float, float* %180, align 4
  %182 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv66, i64 %indvars.iv
  %183 = load float, float* %182, align 4
  %184 = fadd float %181, %183
  %185 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv66, i64 %indvars.iv
  store float %184, float* %185, align 4
  %indvars.iv.next = or i64 %indvars.iv, 1
  %186 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv66, i64 %indvars.iv.next
  %187 = load float, float* %186, align 4
  %188 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv66, i64 %indvars.iv.next
  %189 = load float, float* %188, align 4
  %190 = fadd float %187, %189
  %191 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv66, i64 %indvars.iv.next
  store float %190, float* %191, align 4
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2160
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %._crit_edge58.us, !llvm.loop !23

._crit_edge.us.loopexit:                          ; preds = %._crit_edge58.us
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block141
  %indvars.iv.next67 = add nuw nsw i64 %indvars.iv66, 1
  %exitcond = icmp eq i64 %indvars.iv.next67, 4096
  br i1 %exitcond, label %.preheader12._crit_edge, label %.preheader.us

.preheader12._crit_edge:                          ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [2160 x float]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv12 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next13, %._crit_edge.us ]
  %7 = mul nuw nsw i64 %indvars.iv12, 2160
  br label %._crit_edge5.us

._crit_edge5.us:                                  ; preds = %._crit_edge4.us, %.preheader.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge4.us ], [ 0, %.preheader.us ]
  %8 = add nuw nsw i64 %7, %indvars.iv
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge4.us

; <label>:12:                                     ; preds = %._crit_edge5.us
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = call i32 @fputc(i32 10, %struct._IO_FILE* %13) #6
  br label %._crit_edge4.us

._crit_edge4.us:                                  ; preds = %._crit_edge5.us, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv12, i64 %indvars.iv
  %16 = load float, float* %15, align 4
  %17 = fpext float %16 to double
  %18 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %17) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2160
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge5.us

._crit_edge.us:                                   ; preds = %._crit_edge4.us
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next13, 4096
  br i1 %exitcond15, label %._crit_edge3, label %.preheader.us

._crit_edge3:                                     ; preds = %._crit_edge.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #6
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
