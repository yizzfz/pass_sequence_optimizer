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
.preheader.us.preheader:
  store float 2.500000e-01, float* %2, align 4
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next, %._crit_edge.us ]
  %4 = mul nuw nsw i64 %indvars.iv, 313
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %4, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %.preheader.us
  %index = phi i64 [ 0, %.preheader.us ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %.preheader.us ], [ %vec.ind.next, %vector.body ]
  %5 = mul nuw nsw <4 x i64> %vec.ind, <i64 991, i64 991, i64 991, i64 991>
  %6 = add <4 x i64> %5, %broadcast.splat
  %7 = trunc <4 x i64> %6 to <4 x i32>
  %8 = srem <4 x i32> %7, <i32 65536, i32 65536, i32 65536, i32 65536>
  %9 = sitofp <4 x i32> %8 to <4 x float>
  %10 = fdiv <4 x float> %9, <float 6.553500e+04, float 6.553500e+04, float 6.553500e+04, float 6.553500e+04>
  %11 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv, i64 %index
  %12 = bitcast float* %11 to <4 x float>*
  store <4 x float> %10, <4 x float>* %12, align 4
  %index.next = add nuw nsw i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %13 = icmp eq i64 %index.next, 2160
  br i1 %13, label %._crit_edge.us, label %vector.body, !llvm.loop !1

._crit_edge.us:                                   ; preds = %vector.body
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 4096
  br i1 %exitcond, label %._crit_edge2, label %.preheader.us

._crit_edge2:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_deriche(i32, i32, float, [2160 x float]* nocapture readonly, [2160 x float]* nocapture, [2160 x float]* nocapture, [2160 x float]* nocapture) unnamed_addr #0 {
.preheader65.us.preheader:
  %7 = fsub float -0.000000e+00, %2
  %8 = tail call float @expf(float %7) #5
  %9 = fsub float 1.000000e+00, %8
  %10 = tail call float @expf(float %7) #5
  %11 = fsub float 1.000000e+00, %10
  %12 = fmul float %9, %11
  %13 = fmul float %2, 2.000000e+00
  %14 = tail call float @expf(float %7) #5
  %15 = fmul float %13, %14
  %16 = fadd float %15, 1.000000e+00
  %17 = tail call float @expf(float %13) #5
  %18 = fsub float %16, %17
  %19 = fdiv float %12, %18
  %20 = tail call float @expf(float %7) #5
  %21 = fmul float %20, %19
  %22 = tail call float @expf(float %7) #5
  %23 = fmul float %22, %19
  %24 = insertelement <2 x float> undef, float %2, i32 0
  %25 = shufflevector <2 x float> %24, <2 x float> undef, <2 x i32> zeroinitializer
  %26 = fadd <2 x float> %25, <float -1.000000e+00, float 1.000000e+00>
  %27 = insertelement <2 x float> undef, float %21, i32 0
  %28 = insertelement <2 x float> %27, float %23, i32 1
  %29 = fmul <2 x float> %26, %28
  %30 = extractelement <2 x float> %29, i32 0
  %31 = fmul float %2, -2.000000e+00
  %32 = tail call float @expf(float %31) #5
  %33 = fmul float %19, %32
  %exp2 = call float @llvm.exp2.f32(float %7)
  %34 = tail call float @expf(float %31) #5
  %35 = fsub float -0.000000e+00, %34
  %36 = fmul float %30, 0.000000e+00
  %37 = fmul float %exp2, 0.000000e+00
  %38 = fmul float %34, -0.000000e+00
  %39 = insertelement <2 x float> undef, float %30, i32 0
  %40 = insertelement <2 x float> %39, float %19, i32 1
  br label %.preheader65.us

.preheader65.us:                                  ; preds = %._crit_edge119.us, %.preheader65.us.preheader
  %indvars.iv166 = phi i64 [ 0, %.preheader65.us.preheader ], [ %indvars.iv.next167, %._crit_edge119.us ]
  %41 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv166, i64 0
  %42 = load float, float* %41, align 4
  %43 = fmul float %19, %42
  %44 = fadd float %36, %43
  %45 = fadd float %37, %44
  %46 = fadd float %38, %45
  %47 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv166, i64 0
  store float %46, float* %47, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %.preheader65.us, %._crit_edge
  %indvars.iv.next148.us173 = phi i64 [ 1, %.preheader65.us ], [ %indvars.iv.next148.us, %._crit_edge ]
  %48 = phi float [ %46, %.preheader65.us ], [ %60, %._crit_edge ]
  %49 = phi float* [ %41, %.preheader65.us ], [ %51, %._crit_edge ]
  %.033116.us172 = phi float [ 0.000000e+00, %.preheader65.us ], [ %48, %._crit_edge ]
  %50 = bitcast float* %49 to <2 x float>*
  %51 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv166, i64 %indvars.iv.next148.us173
  %52 = load <2 x float>, <2 x float>* %50, align 4
  %53 = fmul <2 x float> %40, %52
  %54 = extractelement <2 x float> %53, i32 0
  %55 = extractelement <2 x float> %53, i32 1
  %56 = fadd float %54, %55
  %57 = fmul float %exp2, %48
  %58 = fadd float %57, %56
  %59 = fmul float %.033116.us172, %35
  %60 = fadd float %59, %58
  %61 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv166, i64 %indvars.iv.next148.us173
  store float %60, float* %61, align 4
  %indvars.iv.next148.us = add nuw nsw i64 %indvars.iv.next148.us173, 1
  %exitcond150.us = icmp eq i64 %indvars.iv.next148.us, 2160
  br i1 %exitcond150.us, label %._crit_edge119.us, label %._crit_edge

._crit_edge119.us:                                ; preds = %._crit_edge
  %indvars.iv.next167 = add nuw nsw i64 %indvars.iv166, 1
  %exitcond241 = icmp eq i64 %indvars.iv.next167, 4096
  br i1 %exitcond241, label %.lr.ph112.split.us.preheader, label %.preheader65.us

.lr.ph112.split.us.preheader:                     ; preds = %._crit_edge119.us
  %62 = extractelement <2 x float> %29, i32 1
  %63 = fsub float -0.000000e+00, %33
  %64 = fmul float %62, 0.000000e+00
  %65 = fmul float %33, -0.000000e+00
  %66 = fadd float %65, %64
  %67 = fadd float %37, %66
  %68 = fadd float %38, %67
  br label %.lr.ph112.split.us

.lr.ph112.split.us:                               ; preds = %._crit_edge108.us, %.lr.ph112.split.us.preheader
  %indvars.iv164 = phi i64 [ %indvars.iv.next165, %._crit_edge108.us ], [ 0, %.lr.ph112.split.us.preheader ]
  %69 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv164, i64 2159
  store float %68, float* %69, align 4
  br label %._crit_edge157

._crit_edge157:                                   ; preds = %._crit_edge157.1, %.lr.ph112.split.us
  %70 = phi float [ %68, %.lr.ph112.split.us ], [ %244, %._crit_edge157.1 ]
  %71 = phi float [ 0.000000e+00, %.lr.ph112.split.us ], [ %81, %._crit_edge157.1 ]
  %72 = phi float [ 0.000000e+00, %.lr.ph112.split.us ], [ %237, %._crit_edge157.1 ]
  %indvars.iv145.us171 = phi i64 [ 2159, %.lr.ph112.split.us ], [ %indvars.iv.next146.us.1, %._crit_edge157.1 ]
  %indvars.iv.next146.us = add nsw i64 %indvars.iv145.us171, -1
  %73 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv164, i64 %indvars.iv145.us171
  %74 = load float, float* %73, align 4
  %75 = fmul float %62, %74
  %76 = fmul float %72, %63
  %77 = fadd float %76, %75
  %78 = fmul float %exp2, %70
  %79 = fadd float %78, %77
  %80 = fmul float %71, %35
  %81 = fadd float %80, %79
  %82 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv164, i64 %indvars.iv.next146.us
  store float %81, float* %82, align 4
  %83 = icmp sgt i64 %indvars.iv145.us171, 1
  br i1 %83, label %._crit_edge157.1, label %._crit_edge108.us

._crit_edge108.us:                                ; preds = %._crit_edge157
  %indvars.iv.next165 = add nuw nsw i64 %indvars.iv164, 1
  %exitcond240 = icmp eq i64 %indvars.iv.next165, 4096
  br i1 %exitcond240, label %.preheader61.us.preheader, label %.lr.ph112.split.us

.preheader61.us.preheader:                        ; preds = %._crit_edge108.us
  br label %.preheader61.us

.preheader61.us:                                  ; preds = %.preheader61.us.preheader, %._crit_edge97.us
  %indvars.iv141.us = phi i64 [ %indvars.iv.next142.us, %._crit_edge97.us ], [ 0, %.preheader61.us.preheader ]
  %scevgep = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv141.us, i64 0
  %84 = add nuw nsw i64 %indvars.iv141.us, 1
  %scevgep178 = getelementptr [2160 x float], [2160 x float]* %4, i64 %84, i64 0
  %scevgep180 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv141.us, i64 0
  %scevgep182 = getelementptr [2160 x float], [2160 x float]* %5, i64 %84, i64 0
  %scevgep184 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv141.us, i64 0
  %scevgep186 = getelementptr [2160 x float], [2160 x float]* %6, i64 %84, i64 0
  %bound0 = icmp ult float* %scevgep, %scevgep182
  %bound1 = icmp ult float* %scevgep180, %scevgep178
  %found.conflict = and i1 %bound0, %bound1
  %bound0188 = icmp ult float* %scevgep, %scevgep186
  %bound1189 = icmp ult float* %scevgep184, %scevgep178
  %found.conflict190 = and i1 %bound0188, %bound1189
  %conflict.rdx = or i1 %found.conflict, %found.conflict190
  br i1 %conflict.rdx, label %._crit_edge158.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader61.us
  br label %vector.body

._crit_edge158.preheader:                         ; preds = %.preheader61.us
  br label %._crit_edge158

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next.1, %vector.body ]
  %85 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv141.us, i64 %index
  %86 = bitcast float* %85 to <4 x float>*
  %wide.load = load <4 x float>, <4 x float>* %86, align 4, !alias.scope !4
  %87 = getelementptr float, float* %85, i64 4
  %88 = bitcast float* %87 to <4 x float>*
  %wide.load192 = load <4 x float>, <4 x float>* %88, align 4, !alias.scope !4
  %89 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv141.us, i64 %index
  %90 = bitcast float* %89 to <4 x float>*
  %wide.load193 = load <4 x float>, <4 x float>* %90, align 4, !alias.scope !7
  %91 = getelementptr float, float* %89, i64 4
  %92 = bitcast float* %91 to <4 x float>*
  %wide.load194 = load <4 x float>, <4 x float>* %92, align 4, !alias.scope !7
  %93 = fadd <4 x float> %wide.load, %wide.load193
  %94 = fadd <4 x float> %wide.load192, %wide.load194
  %95 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv141.us, i64 %index
  %96 = bitcast float* %95 to <4 x float>*
  store <4 x float> %93, <4 x float>* %96, align 4, !alias.scope !9, !noalias !11
  %97 = getelementptr float, float* %95, i64 4
  %98 = bitcast float* %97 to <4 x float>*
  store <4 x float> %94, <4 x float>* %98, align 4, !alias.scope !9, !noalias !11
  %index.next = or i64 %index, 8
  %99 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv141.us, i64 %index.next
  %100 = bitcast float* %99 to <4 x float>*
  %wide.load.1 = load <4 x float>, <4 x float>* %100, align 4, !alias.scope !4
  %101 = getelementptr float, float* %99, i64 4
  %102 = bitcast float* %101 to <4 x float>*
  %wide.load192.1 = load <4 x float>, <4 x float>* %102, align 4, !alias.scope !4
  %103 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv141.us, i64 %index.next
  %104 = bitcast float* %103 to <4 x float>*
  %wide.load193.1 = load <4 x float>, <4 x float>* %104, align 4, !alias.scope !7
  %105 = getelementptr float, float* %103, i64 4
  %106 = bitcast float* %105 to <4 x float>*
  %wide.load194.1 = load <4 x float>, <4 x float>* %106, align 4, !alias.scope !7
  %107 = fadd <4 x float> %wide.load.1, %wide.load193.1
  %108 = fadd <4 x float> %wide.load192.1, %wide.load194.1
  %109 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv141.us, i64 %index.next
  %110 = bitcast float* %109 to <4 x float>*
  store <4 x float> %107, <4 x float>* %110, align 4, !alias.scope !9, !noalias !11
  %111 = getelementptr float, float* %109, i64 4
  %112 = bitcast float* %111 to <4 x float>*
  store <4 x float> %108, <4 x float>* %112, align 4, !alias.scope !9, !noalias !11
  %index.next.1 = add nsw i64 %index, 16
  %113 = icmp eq i64 %index.next.1, 2160
  br i1 %113, label %._crit_edge97.us.loopexit246, label %vector.body, !llvm.loop !12

._crit_edge158:                                   ; preds = %._crit_edge158, %._crit_edge158.preheader
  %indvars.iv137.us = phi i64 [ 0, %._crit_edge158.preheader ], [ %indvars.iv.next138.us.2, %._crit_edge158 ]
  %114 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv141.us, i64 %indvars.iv137.us
  %115 = load float, float* %114, align 4
  %116 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv141.us, i64 %indvars.iv137.us
  %117 = load float, float* %116, align 4
  %118 = fadd float %115, %117
  %119 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv141.us, i64 %indvars.iv137.us
  store float %118, float* %119, align 4
  %indvars.iv.next138.us = add nuw nsw i64 %indvars.iv137.us, 1
  %120 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv141.us, i64 %indvars.iv.next138.us
  %121 = load float, float* %120, align 4
  %122 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv141.us, i64 %indvars.iv.next138.us
  %123 = load float, float* %122, align 4
  %124 = fadd float %121, %123
  %125 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv141.us, i64 %indvars.iv.next138.us
  store float %124, float* %125, align 4
  %indvars.iv.next138.us.1 = add nsw i64 %indvars.iv137.us, 2
  %126 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv141.us, i64 %indvars.iv.next138.us.1
  %127 = load float, float* %126, align 4
  %128 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv141.us, i64 %indvars.iv.next138.us.1
  %129 = load float, float* %128, align 4
  %130 = fadd float %127, %129
  %131 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv141.us, i64 %indvars.iv.next138.us.1
  store float %130, float* %131, align 4
  %indvars.iv.next138.us.2 = add nsw i64 %indvars.iv137.us, 3
  %exitcond140.us.2 = icmp eq i64 %indvars.iv.next138.us.2, 2160
  br i1 %exitcond140.us.2, label %._crit_edge97.us.loopexit, label %._crit_edge158, !llvm.loop !13

._crit_edge97.us.loopexit:                        ; preds = %._crit_edge158
  br label %._crit_edge97.us

._crit_edge97.us.loopexit246:                     ; preds = %vector.body
  br label %._crit_edge97.us

._crit_edge97.us:                                 ; preds = %._crit_edge97.us.loopexit246, %._crit_edge97.us.loopexit
  %indvars.iv.next142.us = add nuw nsw i64 %indvars.iv141.us, 1
  %exitcond144.us = icmp eq i64 %indvars.iv.next142.us, 4096
  br i1 %exitcond144.us, label %.preheader57.us.preheader, label %.preheader61.us

.preheader57.us.preheader:                        ; preds = %._crit_edge97.us
  br label %.preheader57.us

.preheader57.us:                                  ; preds = %._crit_edge86.us, %.preheader57.us.preheader
  %indvars.iv162 = phi i64 [ %indvars.iv.next163, %._crit_edge86.us ], [ 0, %.preheader57.us.preheader ]
  %132 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 0, i64 %indvars.iv162
  %133 = load float, float* %132, align 4
  %134 = fmul float %19, %133
  %135 = fadd float %36, %134
  %136 = fadd float %37, %135
  %137 = fadd float %38, %136
  %138 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 0, i64 %indvars.iv162
  store float %137, float* %138, align 4
  br label %._crit_edge159

._crit_edge159:                                   ; preds = %._crit_edge159.1, %.preheader57.us
  %indvars.iv.next134.us170 = phi i64 [ 1, %.preheader57.us ], [ %indvars.iv.next134.us.1, %._crit_edge159.1 ]
  %139 = phi float [ %137, %.preheader57.us ], [ %234, %._crit_edge159.1 ]
  %140 = phi float* [ %132, %.preheader57.us ], [ %226, %._crit_edge159.1 ]
  %.13483.us169 = phi float [ 0.000000e+00, %.preheader57.us ], [ %150, %._crit_edge159.1 ]
  %141 = load float, float* %140, align 4
  %142 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next134.us170, i64 %indvars.iv162
  %143 = load float, float* %142, align 4
  %144 = fmul float %19, %143
  %145 = fmul float %30, %141
  %146 = fadd float %145, %144
  %147 = fmul float %exp2, %139
  %148 = fadd float %147, %146
  %149 = fmul float %.13483.us169, %35
  %150 = fadd float %149, %148
  %151 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv.next134.us170, i64 %indvars.iv162
  store float %150, float* %151, align 4
  %indvars.iv.next134.us = add nuw nsw i64 %indvars.iv.next134.us170, 1
  %exitcond136.us = icmp eq i64 %indvars.iv.next134.us, 4096
  br i1 %exitcond136.us, label %._crit_edge86.us, label %._crit_edge159.1

._crit_edge86.us:                                 ; preds = %._crit_edge159
  %indvars.iv.next163 = add nuw nsw i64 %indvars.iv162, 1
  %exitcond239 = icmp eq i64 %indvars.iv.next163, 2160
  br i1 %exitcond239, label %.lr.ph78.split.us.preheader, label %.preheader57.us

.lr.ph78.split.us.preheader:                      ; preds = %._crit_edge86.us
  br label %.lr.ph78.split.us

.lr.ph78.split.us:                                ; preds = %._crit_edge74.us, %.lr.ph78.split.us.preheader
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge74.us ], [ 0, %.lr.ph78.split.us.preheader ]
  %152 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 4095, i64 %indvars.iv
  store float %68, float* %152, align 4
  br label %._crit_edge160

._crit_edge160:                                   ; preds = %._crit_edge160.1, %.lr.ph78.split.us
  %153 = phi float [ %68, %.lr.ph78.split.us ], [ %223, %._crit_edge160.1 ]
  %154 = phi float [ 0.000000e+00, %.lr.ph78.split.us ], [ %164, %._crit_edge160.1 ]
  %155 = phi float [ 0.000000e+00, %.lr.ph78.split.us ], [ %216, %._crit_edge160.1 ]
  %indvars.iv131.us168 = phi i64 [ 4095, %.lr.ph78.split.us ], [ %indvars.iv.next132.us.1, %._crit_edge160.1 ]
  %indvars.iv.next132.us = add nsw i64 %indvars.iv131.us168, -1
  %156 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv131.us168, i64 %indvars.iv
  %157 = load float, float* %156, align 4
  %158 = fmul float %62, %157
  %159 = fmul float %155, %63
  %160 = fadd float %159, %158
  %161 = fmul float %exp2, %153
  %162 = fadd float %161, %160
  %163 = fmul float %154, %35
  %164 = fadd float %163, %162
  %165 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv.next132.us, i64 %indvars.iv
  store float %164, float* %165, align 4
  %166 = icmp sgt i64 %indvars.iv131.us168, 1
  br i1 %166, label %._crit_edge160.1, label %._crit_edge74.us

._crit_edge74.us:                                 ; preds = %._crit_edge160
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2160
  br i1 %exitcond, label %.preheader.us.preheader, label %.lr.ph78.split.us

.preheader.us.preheader:                          ; preds = %._crit_edge74.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv127.us = phi i64 [ %indvars.iv.next128.us, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep200 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv127.us, i64 0
  %167 = add nuw nsw i64 %indvars.iv127.us, 1
  %scevgep202 = getelementptr [2160 x float], [2160 x float]* %4, i64 %167, i64 0
  %scevgep204 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv127.us, i64 0
  %scevgep206 = getelementptr [2160 x float], [2160 x float]* %5, i64 %167, i64 0
  %scevgep208 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv127.us, i64 0
  %scevgep210 = getelementptr [2160 x float], [2160 x float]* %6, i64 %167, i64 0
  %bound0212 = icmp ult float* %scevgep200, %scevgep206
  %bound1213 = icmp ult float* %scevgep204, %scevgep202
  %found.conflict214 = and i1 %bound0212, %bound1213
  %bound0215 = icmp ult float* %scevgep200, %scevgep210
  %bound1216 = icmp ult float* %scevgep208, %scevgep202
  %found.conflict217 = and i1 %bound0215, %bound1216
  %conflict.rdx218 = or i1 %found.conflict214, %found.conflict217
  br i1 %conflict.rdx218, label %._crit_edge161.preheader, label %vector.body195.preheader

vector.body195.preheader:                         ; preds = %.preheader.us
  br label %vector.body195

._crit_edge161.preheader:                         ; preds = %.preheader.us
  br label %._crit_edge161

vector.body195:                                   ; preds = %vector.body195, %vector.body195.preheader
  %index222 = phi i64 [ 0, %vector.body195.preheader ], [ %index.next223.1, %vector.body195 ]
  %168 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv127.us, i64 %index222
  %169 = bitcast float* %168 to <4 x float>*
  %wide.load230 = load <4 x float>, <4 x float>* %169, align 4, !alias.scope !14
  %170 = getelementptr float, float* %168, i64 4
  %171 = bitcast float* %170 to <4 x float>*
  %wide.load231 = load <4 x float>, <4 x float>* %171, align 4, !alias.scope !14
  %172 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv127.us, i64 %index222
  %173 = bitcast float* %172 to <4 x float>*
  %wide.load232 = load <4 x float>, <4 x float>* %173, align 4, !alias.scope !17
  %174 = getelementptr float, float* %172, i64 4
  %175 = bitcast float* %174 to <4 x float>*
  %wide.load233 = load <4 x float>, <4 x float>* %175, align 4, !alias.scope !17
  %176 = fadd <4 x float> %wide.load230, %wide.load232
  %177 = fadd <4 x float> %wide.load231, %wide.load233
  %178 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv127.us, i64 %index222
  %179 = bitcast float* %178 to <4 x float>*
  store <4 x float> %176, <4 x float>* %179, align 4, !alias.scope !19, !noalias !21
  %180 = getelementptr float, float* %178, i64 4
  %181 = bitcast float* %180 to <4 x float>*
  store <4 x float> %177, <4 x float>* %181, align 4, !alias.scope !19, !noalias !21
  %index.next223 = or i64 %index222, 8
  %182 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv127.us, i64 %index.next223
  %183 = bitcast float* %182 to <4 x float>*
  %wide.load230.1 = load <4 x float>, <4 x float>* %183, align 4, !alias.scope !14
  %184 = getelementptr float, float* %182, i64 4
  %185 = bitcast float* %184 to <4 x float>*
  %wide.load231.1 = load <4 x float>, <4 x float>* %185, align 4, !alias.scope !14
  %186 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv127.us, i64 %index.next223
  %187 = bitcast float* %186 to <4 x float>*
  %wide.load232.1 = load <4 x float>, <4 x float>* %187, align 4, !alias.scope !17
  %188 = getelementptr float, float* %186, i64 4
  %189 = bitcast float* %188 to <4 x float>*
  %wide.load233.1 = load <4 x float>, <4 x float>* %189, align 4, !alias.scope !17
  %190 = fadd <4 x float> %wide.load230.1, %wide.load232.1
  %191 = fadd <4 x float> %wide.load231.1, %wide.load233.1
  %192 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv127.us, i64 %index.next223
  %193 = bitcast float* %192 to <4 x float>*
  store <4 x float> %190, <4 x float>* %193, align 4, !alias.scope !19, !noalias !21
  %194 = getelementptr float, float* %192, i64 4
  %195 = bitcast float* %194 to <4 x float>*
  store <4 x float> %191, <4 x float>* %195, align 4, !alias.scope !19, !noalias !21
  %index.next223.1 = add nsw i64 %index222, 16
  %196 = icmp eq i64 %index.next223.1, 2160
  br i1 %196, label %._crit_edge.us.loopexit245, label %vector.body195, !llvm.loop !22

._crit_edge161:                                   ; preds = %._crit_edge161, %._crit_edge161.preheader
  %indvars.iv.us = phi i64 [ 0, %._crit_edge161.preheader ], [ %indvars.iv.next.us.2, %._crit_edge161 ]
  %197 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv127.us, i64 %indvars.iv.us
  %198 = load float, float* %197, align 4
  %199 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv127.us, i64 %indvars.iv.us
  %200 = load float, float* %199, align 4
  %201 = fadd float %198, %200
  %202 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv127.us, i64 %indvars.iv.us
  store float %201, float* %202, align 4
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %203 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv127.us, i64 %indvars.iv.next.us
  %204 = load float, float* %203, align 4
  %205 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv127.us, i64 %indvars.iv.next.us
  %206 = load float, float* %205, align 4
  %207 = fadd float %204, %206
  %208 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv127.us, i64 %indvars.iv.next.us
  store float %207, float* %208, align 4
  %indvars.iv.next.us.1 = add nsw i64 %indvars.iv.us, 2
  %209 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv127.us, i64 %indvars.iv.next.us.1
  %210 = load float, float* %209, align 4
  %211 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv127.us, i64 %indvars.iv.next.us.1
  %212 = load float, float* %211, align 4
  %213 = fadd float %210, %212
  %214 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv127.us, i64 %indvars.iv.next.us.1
  store float %213, float* %214, align 4
  %indvars.iv.next.us.2 = add nsw i64 %indvars.iv.us, 3
  %exitcond.us.2 = icmp eq i64 %indvars.iv.next.us.2, 2160
  br i1 %exitcond.us.2, label %._crit_edge.us.loopexit, label %._crit_edge161, !llvm.loop !23

._crit_edge.us.loopexit:                          ; preds = %._crit_edge161
  br label %._crit_edge.us

._crit_edge.us.loopexit245:                       ; preds = %vector.body195
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit245, %._crit_edge.us.loopexit
  %indvars.iv.next128.us = add nuw nsw i64 %indvars.iv127.us, 1
  %exitcond130.us = icmp eq i64 %indvars.iv.next128.us, 4096
  br i1 %exitcond130.us, label %._crit_edge68, label %.preheader.us

._crit_edge68:                                    ; preds = %._crit_edge.us
  ret void

._crit_edge160.1:                                 ; preds = %._crit_edge160
  %indvars.iv.next132.us.1 = add nsw i64 %indvars.iv131.us168, -2
  %215 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next132.us, i64 %indvars.iv
  %216 = load float, float* %215, align 4
  %217 = fmul float %62, %216
  %218 = fmul float %157, %63
  %219 = fadd float %218, %217
  %220 = fmul float %exp2, %164
  %221 = fadd float %220, %219
  %222 = fmul float %153, %35
  %223 = fadd float %222, %221
  %224 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv.next132.us.1, i64 %indvars.iv
  store float %223, float* %224, align 4
  br label %._crit_edge160

._crit_edge159.1:                                 ; preds = %._crit_edge159
  %225 = load float, float* %142, align 4
  %226 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next134.us, i64 %indvars.iv162
  %227 = load float, float* %226, align 4
  %228 = fmul float %19, %227
  %229 = fmul float %30, %225
  %230 = fadd float %229, %228
  %231 = fmul float %exp2, %150
  %232 = fadd float %231, %230
  %233 = fmul float %139, %35
  %234 = fadd float %233, %232
  %235 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv.next134.us, i64 %indvars.iv162
  store float %234, float* %235, align 4
  %indvars.iv.next134.us.1 = add nsw i64 %indvars.iv.next134.us170, 2
  br label %._crit_edge159

._crit_edge157.1:                                 ; preds = %._crit_edge157
  %indvars.iv.next146.us.1 = add nsw i64 %indvars.iv145.us171, -2
  %236 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv164, i64 %indvars.iv.next146.us
  %237 = load float, float* %236, align 4
  %238 = fmul float %62, %237
  %239 = fmul float %74, %63
  %240 = fadd float %239, %238
  %241 = fmul float %exp2, %81
  %242 = fadd float %241, %240
  %243 = fmul float %70, %35
  %244 = fadd float %243, %242
  %245 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv164, i64 %indvars.iv.next146.us.1
  store float %244, float* %245, align 4
  br label %._crit_edge157
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [2160 x float]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next, %._crit_edge.us ]
  %7 = mul nuw nsw i64 %indvars.iv, 2160
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %._crit_edge ]
  %8 = add nuw nsw i64 %indvars.iv.us, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge3
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %13) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge3, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv, i64 %indvars.iv.us
  %16 = load float, float* %15, align 4
  %17 = fpext float %16 to double
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %17) #7
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 2160
  br i1 %exitcond.us, label %._crit_edge.us, label %._crit_edge3

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 4096
  br i1 %exitcond, label %._crit_edge1, label %.preheader.us

._crit_edge1:                                     ; preds = %._crit_edge.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
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
