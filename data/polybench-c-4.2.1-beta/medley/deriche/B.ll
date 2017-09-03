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
.preheader.us.preheader:
  store float 2.500000e-01, float* %2, align 4
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv6 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next7, %._crit_edge.us ]
  %4 = mul nuw nsw i64 %indvars.iv6, 313
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %4, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %.preheader.us
  %index = phi i64 [ 0, %.preheader.us ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %.preheader.us ], [ %vec.ind.next, %vector.body ]
  %5 = mul nuw nsw <4 x i64> %vec.ind, <i64 991, i64 991, i64 991, i64 991>
  %6 = add nsw <4 x i64> %5, %broadcast.splat
  %7 = trunc <4 x i64> %6 to <4 x i32>
  %8 = srem <4 x i32> %7, <i32 65536, i32 65536, i32 65536, i32 65536>
  %9 = sitofp <4 x i32> %8 to <4 x float>
  %10 = fdiv <4 x float> %9, <float 6.553500e+04, float 6.553500e+04, float 6.553500e+04, float 6.553500e+04>
  %11 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv6, i64 %index
  %12 = bitcast float* %11 to <4 x float>*
  store <4 x float> %10, <4 x float>* %12, align 4
  %index.next = add nuw nsw i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %13 = icmp eq i64 %index.next, 2160
  br i1 %13, label %._crit_edge.us, label %vector.body, !llvm.loop !1

._crit_edge.us:                                   ; preds = %vector.body
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, 4096
  br i1 %exitcond9, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_deriche(i32, i32, float, [2160 x float]* nocapture readonly, [2160 x float]* nocapture, [2160 x float]* nocapture, [2160 x float]* nocapture) unnamed_addr #0 {
.preheader30.us.preheader:
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
  %22 = fadd float %2, -1.000000e+00
  %23 = fmul float %22, %21
  %24 = tail call float @expf(float %7) #5
  %25 = fadd float %2, 1.000000e+00
  %26 = fmul float %2, -2.000000e+00
  %27 = tail call float @expf(float %26) #5
  %28 = fmul float %19, %27
  %exp2 = tail call float @llvm.exp2.f32(float %7)
  %29 = tail call float @expf(float %26) #5
  %30 = fsub float -0.000000e+00, %29
  %31 = fmul float %23, 0.000000e+00
  %32 = fmul float %exp2, 0.000000e+00
  %33 = fmul float %29, -0.000000e+00
  br label %.preheader30.us

.preheader30.us:                                  ; preds = %._crit_edge68.us, %.preheader30.us.preheader
  %indvars.iv112 = phi i64 [ 0, %.preheader30.us.preheader ], [ %indvars.iv.next113, %._crit_edge68.us ]
  %34 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv112, i64 0
  %35 = load float, float* %34, align 4
  %36 = fmul float %19, %35
  %37 = fadd float %31, %36
  %38 = fadd float %32, %37
  %39 = fadd float %33, %38
  %40 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv112, i64 0
  store float %39, float* %40, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.1, %.preheader30.us
  %41 = phi float [ %39, %.preheader30.us ], [ %244, %._crit_edge.1 ]
  %42 = phi float* [ %34, %.preheader30.us ], [ %236, %._crit_edge.1 ]
  %.01963.us124 = phi float [ 0.000000e+00, %.preheader30.us ], [ %52, %._crit_edge.1 ]
  %indvars.iv108123 = phi i64 [ 0, %.preheader30.us ], [ %indvars.iv.next109.1, %._crit_edge.1 ]
  %indvars.iv.next109 = or i64 %indvars.iv108123, 1
  %43 = load float, float* %42, align 4
  %44 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv112, i64 %indvars.iv.next109
  %45 = load float, float* %44, align 4
  %46 = fmul float %19, %45
  %47 = fmul float %23, %43
  %48 = fadd float %47, %46
  %49 = fmul float %exp2, %41
  %50 = fadd float %49, %48
  %51 = fmul float %.01963.us124, %30
  %52 = fadd float %51, %50
  %53 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv112, i64 %indvars.iv.next109
  store float %52, float* %53, align 4
  %exitcond111 = icmp eq i64 %indvars.iv.next109, 2159
  br i1 %exitcond111, label %._crit_edge68.us, label %._crit_edge.1

._crit_edge68.us:                                 ; preds = %._crit_edge
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112, 1
  %exitcond187 = icmp eq i64 %indvars.iv.next113, 4096
  br i1 %exitcond187, label %.preheader28.us.preheader, label %.preheader30.us

.preheader28.us.preheader:                        ; preds = %._crit_edge68.us
  %54 = fmul float %24, %19
  %55 = fmul float %25, %54
  %56 = fsub float -0.000000e+00, %28
  %57 = fmul float %55, 0.000000e+00
  %58 = fmul float %28, -0.000000e+00
  %59 = fadd float %57, %58
  %60 = fadd float %59, %32
  %61 = fadd float %60, %33
  br label %.preheader28.us

.preheader28.us:                                  ; preds = %._crit_edge61.us, %.preheader28.us.preheader
  %indvars.iv105 = phi i64 [ %indvars.iv.next106, %._crit_edge61.us ], [ 0, %.preheader28.us.preheader ]
  %62 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv105, i64 2159
  store float %61, float* %62, align 4
  br label %._crit_edge76

._crit_edge76:                                    ; preds = %._crit_edge76.1, %.preheader28.us
  %63 = phi float [ %61, %.preheader28.us ], [ %233, %._crit_edge76.1 ]
  %indvars.iv.next104122 = phi i64 [ 2159, %.preheader28.us ], [ %indvars.iv.next104.1, %._crit_edge76.1 ]
  %.0655.us121 = phi float [ 0.000000e+00, %.preheader28.us ], [ %226, %._crit_edge76.1 ]
  %.0157.us120 = phi float [ 0.000000e+00, %.preheader28.us ], [ %72, %._crit_edge76.1 ]
  %64 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv105, i64 %indvars.iv.next104122
  %65 = load float, float* %64, align 4
  %indvars.iv.next104 = add nsw i64 %indvars.iv.next104122, -1
  %66 = fmul float %55, %65
  %67 = fmul float %.0655.us121, %56
  %68 = fadd float %66, %67
  %69 = fmul float %exp2, %63
  %70 = fadd float %68, %69
  %71 = fmul float %.0157.us120, %30
  %72 = fadd float %70, %71
  %73 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv105, i64 %indvars.iv.next104
  store float %72, float* %73, align 4
  %74 = icmp sgt i64 %indvars.iv.next104122, 1
  br i1 %74, label %._crit_edge76.1, label %._crit_edge61.us

._crit_edge61.us:                                 ; preds = %._crit_edge76
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv105, 1
  %exitcond186 = icmp eq i64 %indvars.iv.next106, 4096
  br i1 %exitcond186, label %.preheader26.us.preheader, label %.preheader28.us

.preheader26.us.preheader:                        ; preds = %._crit_edge61.us
  br label %.preheader26.us

.preheader26.us:                                  ; preds = %.preheader26.us.preheader, %._crit_edge52.us
  %indvars.iv100 = phi i64 [ %75, %._crit_edge52.us ], [ 0, %.preheader26.us.preheader ]
  %scevgep = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv100, i64 0
  %75 = add nuw nsw i64 %indvars.iv100, 1
  %scevgep126 = getelementptr [2160 x float], [2160 x float]* %4, i64 %75, i64 0
  %scevgep128 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv100, i64 0
  %scevgep130 = getelementptr [2160 x float], [2160 x float]* %5, i64 %75, i64 0
  %scevgep132 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv100, i64 0
  %scevgep134 = getelementptr [2160 x float], [2160 x float]* %6, i64 %75, i64 0
  %bound0 = icmp ult float* %scevgep, %scevgep130
  %bound1 = icmp ult float* %scevgep128, %scevgep126
  %found.conflict = and i1 %bound0, %bound1
  %bound0136 = icmp ult float* %scevgep, %scevgep134
  %bound1137 = icmp ult float* %scevgep132, %scevgep126
  %found.conflict138 = and i1 %bound0136, %bound1137
  %conflict.rdx = or i1 %found.conflict, %found.conflict138
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader26.us
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader26.us
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body, %vector.body.preheader
  %index = phi i64 [ 0, %vector.body.preheader ], [ %index.next.1, %vector.body ]
  %76 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv100, i64 %index
  %77 = bitcast float* %76 to <4 x float>*
  %wide.load = load <4 x float>, <4 x float>* %77, align 4, !alias.scope !4
  %78 = getelementptr float, float* %76, i64 4
  %79 = bitcast float* %78 to <4 x float>*
  %wide.load140 = load <4 x float>, <4 x float>* %79, align 4, !alias.scope !4
  %80 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv100, i64 %index
  %81 = bitcast float* %80 to <4 x float>*
  %wide.load141 = load <4 x float>, <4 x float>* %81, align 4, !alias.scope !7
  %82 = getelementptr float, float* %80, i64 4
  %83 = bitcast float* %82 to <4 x float>*
  %wide.load142 = load <4 x float>, <4 x float>* %83, align 4, !alias.scope !7
  %84 = fadd <4 x float> %wide.load, %wide.load141
  %85 = fadd <4 x float> %wide.load140, %wide.load142
  %86 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv100, i64 %index
  %87 = bitcast float* %86 to <4 x float>*
  store <4 x float> %84, <4 x float>* %87, align 4, !alias.scope !9, !noalias !11
  %88 = getelementptr float, float* %86, i64 4
  %89 = bitcast float* %88 to <4 x float>*
  store <4 x float> %85, <4 x float>* %89, align 4, !alias.scope !9, !noalias !11
  %index.next = or i64 %index, 8
  %90 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv100, i64 %index.next
  %91 = bitcast float* %90 to <4 x float>*
  %wide.load.1 = load <4 x float>, <4 x float>* %91, align 4, !alias.scope !4
  %92 = getelementptr float, float* %90, i64 4
  %93 = bitcast float* %92 to <4 x float>*
  %wide.load140.1 = load <4 x float>, <4 x float>* %93, align 4, !alias.scope !4
  %94 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv100, i64 %index.next
  %95 = bitcast float* %94 to <4 x float>*
  %wide.load141.1 = load <4 x float>, <4 x float>* %95, align 4, !alias.scope !7
  %96 = getelementptr float, float* %94, i64 4
  %97 = bitcast float* %96 to <4 x float>*
  %wide.load142.1 = load <4 x float>, <4 x float>* %97, align 4, !alias.scope !7
  %98 = fadd <4 x float> %wide.load.1, %wide.load141.1
  %99 = fadd <4 x float> %wide.load140.1, %wide.load142.1
  %100 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv100, i64 %index.next
  %101 = bitcast float* %100 to <4 x float>*
  store <4 x float> %98, <4 x float>* %101, align 4, !alias.scope !9, !noalias !11
  %102 = getelementptr float, float* %100, i64 4
  %103 = bitcast float* %102 to <4 x float>*
  store <4 x float> %99, <4 x float>* %103, align 4, !alias.scope !9, !noalias !11
  %index.next.1 = add nsw i64 %index, 16
  %104 = icmp eq i64 %index.next.1, 2160
  br i1 %104, label %._crit_edge52.us.loopexit189, label %vector.body, !llvm.loop !12

scalar.ph:                                        ; preds = %scalar.ph, %scalar.ph.preheader
  %indvars.iv96 = phi i64 [ 0, %scalar.ph.preheader ], [ %indvars.iv.next97.2, %scalar.ph ]
  %105 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv100, i64 %indvars.iv96
  %106 = load float, float* %105, align 4
  %107 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv100, i64 %indvars.iv96
  %108 = load float, float* %107, align 4
  %109 = fadd float %106, %108
  %110 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv100, i64 %indvars.iv96
  store float %109, float* %110, align 4
  %indvars.iv.next97 = add nuw nsw i64 %indvars.iv96, 1
  %111 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv100, i64 %indvars.iv.next97
  %112 = load float, float* %111, align 4
  %113 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv100, i64 %indvars.iv.next97
  %114 = load float, float* %113, align 4
  %115 = fadd float %112, %114
  %116 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv100, i64 %indvars.iv.next97
  store float %115, float* %116, align 4
  %indvars.iv.next97.1 = add nsw i64 %indvars.iv96, 2
  %117 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv100, i64 %indvars.iv.next97.1
  %118 = load float, float* %117, align 4
  %119 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv100, i64 %indvars.iv.next97.1
  %120 = load float, float* %119, align 4
  %121 = fadd float %118, %120
  %122 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv100, i64 %indvars.iv.next97.1
  store float %121, float* %122, align 4
  %exitcond99.2 = icmp eq i64 %indvars.iv.next97.1, 2159
  %indvars.iv.next97.2 = add nsw i64 %indvars.iv96, 3
  br i1 %exitcond99.2, label %._crit_edge52.us.loopexit, label %scalar.ph, !llvm.loop !13

._crit_edge52.us.loopexit:                        ; preds = %scalar.ph
  br label %._crit_edge52.us

._crit_edge52.us.loopexit189:                     ; preds = %vector.body
  br label %._crit_edge52.us

._crit_edge52.us:                                 ; preds = %._crit_edge52.us.loopexit189, %._crit_edge52.us.loopexit
  %exitcond185 = icmp eq i64 %75, 4096
  br i1 %exitcond185, label %.preheader24.us.preheader, label %.preheader26.us

.preheader24.us.preheader:                        ; preds = %._crit_edge52.us
  br label %.preheader24.us

.preheader24.us:                                  ; preds = %.preheader24.us.preheader, %._crit_edge48.us
  %indvars.iv93 = phi i64 [ %indvars.iv.next94, %._crit_edge48.us ], [ 0, %.preheader24.us.preheader ]
  %123 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 0, i64 %indvars.iv93
  %124 = load float, float* %123, align 4
  %125 = fmul float %19, %124
  %126 = fadd float %31, %125
  %127 = fadd float %32, %126
  %128 = fadd float %33, %127
  %129 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 0, i64 %indvars.iv93
  store float %128, float* %129, align 4
  br label %._crit_edge78

._crit_edge78:                                    ; preds = %._crit_edge78.1, %.preheader24.us
  %130 = phi float [ %128, %.preheader24.us ], [ %223, %._crit_edge78.1 ]
  %131 = phi float* [ %123, %.preheader24.us ], [ %215, %._crit_edge78.1 ]
  %.12043.us119 = phi float [ 0.000000e+00, %.preheader24.us ], [ %141, %._crit_edge78.1 ]
  %indvars.iv89118 = phi i64 [ 0, %.preheader24.us ], [ %indvars.iv.next90.1, %._crit_edge78.1 ]
  %indvars.iv.next90 = or i64 %indvars.iv89118, 1
  %132 = load float, float* %131, align 4
  %133 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next90, i64 %indvars.iv93
  %134 = load float, float* %133, align 4
  %135 = fmul float %19, %134
  %136 = fmul float %23, %132
  %137 = fadd float %136, %135
  %138 = fmul float %exp2, %130
  %139 = fadd float %138, %137
  %140 = fmul float %.12043.us119, %30
  %141 = fadd float %140, %139
  %142 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv.next90, i64 %indvars.iv93
  store float %141, float* %142, align 4
  %exitcond92 = icmp eq i64 %indvars.iv.next90, 4095
  br i1 %exitcond92, label %._crit_edge48.us, label %._crit_edge78.1

._crit_edge48.us:                                 ; preds = %._crit_edge78
  %indvars.iv.next94 = add nuw nsw i64 %indvars.iv93, 1
  %exitcond184 = icmp eq i64 %indvars.iv.next94, 2160
  br i1 %exitcond184, label %.preheader22.us.preheader, label %.preheader24.us

.preheader22.us.preheader:                        ; preds = %._crit_edge48.us
  br label %.preheader22.us

.preheader22.us:                                  ; preds = %.preheader22.us.preheader, %._crit_edge41.us
  %indvars.iv86 = phi i64 [ %indvars.iv.next87, %._crit_edge41.us ], [ 0, %.preheader22.us.preheader ]
  %143 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 4095, i64 %indvars.iv86
  store float %61, float* %143, align 4
  br label %._crit_edge79

._crit_edge79:                                    ; preds = %._crit_edge79.1, %.preheader22.us
  %144 = phi float [ %61, %.preheader22.us ], [ %212, %._crit_edge79.1 ]
  %indvars.iv.next85117 = phi i64 [ 4095, %.preheader22.us ], [ %indvars.iv.next85.1, %._crit_edge79.1 ]
  %.0435.us116 = phi float [ 0.000000e+00, %.preheader22.us ], [ %205, %._crit_edge79.1 ]
  %.1237.us115 = phi float [ 0.000000e+00, %.preheader22.us ], [ %153, %._crit_edge79.1 ]
  %145 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next85117, i64 %indvars.iv86
  %146 = load float, float* %145, align 4
  %indvars.iv.next85 = add nsw i64 %indvars.iv.next85117, -1
  %147 = fmul float %55, %146
  %148 = fmul float %.0435.us116, %56
  %149 = fadd float %147, %148
  %150 = fmul float %exp2, %144
  %151 = fadd float %149, %150
  %152 = fmul float %.1237.us115, %30
  %153 = fadd float %151, %152
  %154 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv.next85, i64 %indvars.iv86
  store float %153, float* %154, align 4
  %155 = icmp sgt i64 %indvars.iv.next85117, 1
  br i1 %155, label %._crit_edge79.1, label %._crit_edge41.us

._crit_edge41.us:                                 ; preds = %._crit_edge79
  %indvars.iv.next87 = add nuw nsw i64 %indvars.iv86, 1
  %exitcond183 = icmp eq i64 %indvars.iv.next87, 2160
  br i1 %exitcond183, label %.preheader.us.preheader, label %.preheader22.us

.preheader.us.preheader:                          ; preds = %._crit_edge41.us
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv81 = phi i64 [ %156, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep148 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv81, i64 0
  %156 = add nuw nsw i64 %indvars.iv81, 1
  %scevgep150 = getelementptr [2160 x float], [2160 x float]* %4, i64 %156, i64 0
  %scevgep152 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv81, i64 0
  %scevgep154 = getelementptr [2160 x float], [2160 x float]* %5, i64 %156, i64 0
  %scevgep156 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv81, i64 0
  %scevgep158 = getelementptr [2160 x float], [2160 x float]* %6, i64 %156, i64 0
  %bound0160 = icmp ult float* %scevgep148, %scevgep154
  %bound1161 = icmp ult float* %scevgep152, %scevgep150
  %found.conflict162 = and i1 %bound0160, %bound1161
  %bound0163 = icmp ult float* %scevgep148, %scevgep158
  %bound1164 = icmp ult float* %scevgep156, %scevgep150
  %found.conflict165 = and i1 %bound0163, %bound1164
  %conflict.rdx166 = or i1 %found.conflict162, %found.conflict165
  br i1 %conflict.rdx166, label %scalar.ph145.preheader, label %vector.body143.preheader

vector.body143.preheader:                         ; preds = %.preheader.us
  br label %vector.body143

scalar.ph145.preheader:                           ; preds = %.preheader.us
  br label %scalar.ph145

vector.body143:                                   ; preds = %vector.body143, %vector.body143.preheader
  %index170 = phi i64 [ 0, %vector.body143.preheader ], [ %index.next171.1, %vector.body143 ]
  %157 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv81, i64 %index170
  %158 = bitcast float* %157 to <4 x float>*
  %wide.load178 = load <4 x float>, <4 x float>* %158, align 4, !alias.scope !14
  %159 = getelementptr float, float* %157, i64 4
  %160 = bitcast float* %159 to <4 x float>*
  %wide.load179 = load <4 x float>, <4 x float>* %160, align 4, !alias.scope !14
  %161 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv81, i64 %index170
  %162 = bitcast float* %161 to <4 x float>*
  %wide.load180 = load <4 x float>, <4 x float>* %162, align 4, !alias.scope !17
  %163 = getelementptr float, float* %161, i64 4
  %164 = bitcast float* %163 to <4 x float>*
  %wide.load181 = load <4 x float>, <4 x float>* %164, align 4, !alias.scope !17
  %165 = fadd <4 x float> %wide.load178, %wide.load180
  %166 = fadd <4 x float> %wide.load179, %wide.load181
  %167 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv81, i64 %index170
  %168 = bitcast float* %167 to <4 x float>*
  store <4 x float> %165, <4 x float>* %168, align 4, !alias.scope !19, !noalias !21
  %169 = getelementptr float, float* %167, i64 4
  %170 = bitcast float* %169 to <4 x float>*
  store <4 x float> %166, <4 x float>* %170, align 4, !alias.scope !19, !noalias !21
  %index.next171 = or i64 %index170, 8
  %171 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv81, i64 %index.next171
  %172 = bitcast float* %171 to <4 x float>*
  %wide.load178.1 = load <4 x float>, <4 x float>* %172, align 4, !alias.scope !14
  %173 = getelementptr float, float* %171, i64 4
  %174 = bitcast float* %173 to <4 x float>*
  %wide.load179.1 = load <4 x float>, <4 x float>* %174, align 4, !alias.scope !14
  %175 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv81, i64 %index.next171
  %176 = bitcast float* %175 to <4 x float>*
  %wide.load180.1 = load <4 x float>, <4 x float>* %176, align 4, !alias.scope !17
  %177 = getelementptr float, float* %175, i64 4
  %178 = bitcast float* %177 to <4 x float>*
  %wide.load181.1 = load <4 x float>, <4 x float>* %178, align 4, !alias.scope !17
  %179 = fadd <4 x float> %wide.load178.1, %wide.load180.1
  %180 = fadd <4 x float> %wide.load179.1, %wide.load181.1
  %181 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv81, i64 %index.next171
  %182 = bitcast float* %181 to <4 x float>*
  store <4 x float> %179, <4 x float>* %182, align 4, !alias.scope !19, !noalias !21
  %183 = getelementptr float, float* %181, i64 4
  %184 = bitcast float* %183 to <4 x float>*
  store <4 x float> %180, <4 x float>* %184, align 4, !alias.scope !19, !noalias !21
  %index.next171.1 = add nsw i64 %index170, 16
  %185 = icmp eq i64 %index.next171.1, 2160
  br i1 %185, label %._crit_edge.us.loopexit188, label %vector.body143, !llvm.loop !22

scalar.ph145:                                     ; preds = %scalar.ph145, %scalar.ph145.preheader
  %indvars.iv = phi i64 [ 0, %scalar.ph145.preheader ], [ %indvars.iv.next.2, %scalar.ph145 ]
  %186 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv81, i64 %indvars.iv
  %187 = load float, float* %186, align 4
  %188 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv81, i64 %indvars.iv
  %189 = load float, float* %188, align 4
  %190 = fadd float %187, %189
  %191 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv81, i64 %indvars.iv
  store float %190, float* %191, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %192 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv81, i64 %indvars.iv.next
  %193 = load float, float* %192, align 4
  %194 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv81, i64 %indvars.iv.next
  %195 = load float, float* %194, align 4
  %196 = fadd float %193, %195
  %197 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv81, i64 %indvars.iv.next
  store float %196, float* %197, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %198 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv81, i64 %indvars.iv.next.1
  %199 = load float, float* %198, align 4
  %200 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv81, i64 %indvars.iv.next.1
  %201 = load float, float* %200, align 4
  %202 = fadd float %199, %201
  %203 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv81, i64 %indvars.iv.next.1
  store float %202, float* %203, align 4
  %exitcond.2 = icmp eq i64 %indvars.iv.next.1, 2159
  %indvars.iv.next.2 = add nsw i64 %indvars.iv, 3
  br i1 %exitcond.2, label %._crit_edge.us.loopexit, label %scalar.ph145, !llvm.loop !23

._crit_edge.us.loopexit:                          ; preds = %scalar.ph145
  br label %._crit_edge.us

._crit_edge.us.loopexit188:                       ; preds = %vector.body143
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit188, %._crit_edge.us.loopexit
  %exitcond182 = icmp eq i64 %156, 4096
  br i1 %exitcond182, label %._crit_edge33, label %.preheader.us

._crit_edge33:                                    ; preds = %._crit_edge.us
  ret void

._crit_edge79.1:                                  ; preds = %._crit_edge79
  %204 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next85, i64 %indvars.iv86
  %205 = load float, float* %204, align 4
  %indvars.iv.next85.1 = add nsw i64 %indvars.iv.next85117, -2
  %206 = fmul float %55, %205
  %207 = fmul float %146, %56
  %208 = fadd float %206, %207
  %209 = fmul float %exp2, %153
  %210 = fadd float %208, %209
  %211 = fmul float %144, %30
  %212 = fadd float %210, %211
  %213 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv.next85.1, i64 %indvars.iv86
  store float %212, float* %213, align 4
  br label %._crit_edge79

._crit_edge78.1:                                  ; preds = %._crit_edge78
  %indvars.iv.next90.1 = add nsw i64 %indvars.iv89118, 2
  %214 = load float, float* %133, align 4
  %215 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next90.1, i64 %indvars.iv93
  %216 = load float, float* %215, align 4
  %217 = fmul float %19, %216
  %218 = fmul float %23, %214
  %219 = fadd float %218, %217
  %220 = fmul float %exp2, %141
  %221 = fadd float %220, %219
  %222 = fmul float %130, %30
  %223 = fadd float %222, %221
  %224 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv.next90.1, i64 %indvars.iv93
  store float %223, float* %224, align 4
  br label %._crit_edge78

._crit_edge76.1:                                  ; preds = %._crit_edge76
  %225 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv105, i64 %indvars.iv.next104
  %226 = load float, float* %225, align 4
  %indvars.iv.next104.1 = add nsw i64 %indvars.iv.next104122, -2
  %227 = fmul float %55, %226
  %228 = fmul float %65, %56
  %229 = fadd float %227, %228
  %230 = fmul float %exp2, %72
  %231 = fadd float %229, %230
  %232 = fmul float %63, %30
  %233 = fadd float %231, %232
  %234 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv105, i64 %indvars.iv.next104.1
  store float %233, float* %234, align 4
  br label %._crit_edge76

._crit_edge.1:                                    ; preds = %._crit_edge
  %indvars.iv.next109.1 = add nsw i64 %indvars.iv108123, 2
  %235 = load float, float* %44, align 4
  %236 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv112, i64 %indvars.iv.next109.1
  %237 = load float, float* %236, align 4
  %238 = fmul float %19, %237
  %239 = fmul float %23, %235
  %240 = fadd float %239, %238
  %241 = fmul float %exp2, %52
  %242 = fadd float %241, %240
  %243 = fmul float %41, %30
  %244 = fadd float %243, %242
  %245 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv112, i64 %indvars.iv.next109.1
  store float %244, float* %245, align 4
  br label %._crit_edge
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [2160 x float]* nocapture readonly) unnamed_addr #0 {
.preheader.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #6
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv7 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next8, %._crit_edge.us ]
  %7 = mul nuw nsw i64 %indvars.iv7, 2160
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %8 = add nuw nsw i64 %indvars.iv, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge6
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge6, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv7, i64 %indvars.iv
  %16 = load float, float* %15, align 4
  %17 = fpext float %16 to double
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %17) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2160
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge6

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next8, 4096
  br i1 %exitcond9, label %._crit_edge4, label %.preheader.us

._crit_edge4:                                     ; preds = %._crit_edge.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #6
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #6
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
