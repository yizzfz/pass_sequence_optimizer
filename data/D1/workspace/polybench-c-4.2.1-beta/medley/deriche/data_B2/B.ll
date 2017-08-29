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
  %5 = sext i32 %1 to i64
  %6 = sext i32 %0 to i64
  %7 = icmp sgt i32 %0, 0
  %8 = icmp sgt i32 %1, 0
  %or.cond = and i1 %7, %8
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge6

.preheader.us.preheader:                          ; preds = %4
  %min.iters.check = icmp ult i32 %1, 4
  %n.vec = and i64 %5, -4
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i64 %5, %n.vec
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv14.us = phi i64 [ %indvars.iv.next2.us, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %9 = mul nuw nsw i64 %indvars.iv14.us, 313
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %9, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %10 = mul nuw nsw <4 x i64> %vec.ind, <i64 991, i64 991, i64 991, i64 991>
  %11 = add nuw nsw <4 x i64> %10, %broadcast.splat
  %12 = trunc <4 x i64> %11 to <4 x i32>
  %13 = srem <4 x i32> %12, <i32 65536, i32 65536, i32 65536, i32 65536>
  %14 = sitofp <4 x i32> %13 to <4 x float>
  %15 = fdiv <4 x float> %14, <float 6.553500e+04, float 6.553500e+04, float 6.553500e+04, float 6.553500e+04>
  %16 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv14.us, i64 %index
  %17 = bitcast float* %16 to <4 x float>*
  store <4 x float> %15, <4 x float>* %17, align 4
  %index.next = add i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %18 = icmp eq i64 %index.next, %n.vec
  br i1 %18, label %middle.block, label %vector.body, !llvm.loop !1

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %min.iters.checked, %.preheader.us
  %indvars.iv3.us.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %.preheader.us ], [ %n.vec, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv3.us = phi i64 [ %indvars.iv.next.us, %scalar.ph ], [ %indvars.iv3.us.ph, %scalar.ph.preheader ]
  %19 = mul nuw nsw i64 %indvars.iv3.us, 991
  %20 = add nuw nsw i64 %19, %9
  %21 = trunc i64 %20 to i32
  %22 = srem i32 %21, 65536
  %23 = sitofp i32 %22 to float
  %24 = fdiv float %23, 6.553500e+04
  %25 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv14.us, i64 %indvars.iv3.us
  store float %24, float* %25, align 4
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv3.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, %5
  br i1 %exitcond, label %._crit_edge.us.loopexit, label %scalar.ph, !llvm.loop !4

._crit_edge.us.loopexit:                          ; preds = %scalar.ph
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block
  %indvars.iv.next2.us = add nuw nsw i64 %indvars.iv14.us, 1
  %exitcond8 = icmp eq i64 %indvars.iv.next2.us, %6
  br i1 %exitcond8, label %._crit_edge6.loopexit, label %.preheader.us

._crit_edge6.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge6.loopexit, %4
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
  %exp2 = tail call float @llvm.exp2.f32(float %8)
  %35 = tail call float @expf(float %33) #5
  %36 = fsub float -0.000000e+00, %35
  %37 = sext i32 %1 to i64
  %38 = sext i32 %0 to i64
  %39 = icmp sgt i32 %0, 0
  br i1 %39, label %.preheader50.lr.ph, label %._crit_edge95.thread128

._crit_edge95.thread128:                          ; preds = %7
  %40 = fmul float %20, %34
  %41 = fsub float -0.000000e+00, %40
  br label %.preheader46

.preheader50.lr.ph:                               ; preds = %7
  %42 = icmp sgt i32 %1, 0
  br i1 %42, label %.preheader50.us.preheader, label %._crit_edge95.thread

.preheader50.us.preheader:                        ; preds = %.preheader50.lr.ph
  %xtraiter124 = and i64 %37, 1
  %lcmp.mod125 = icmp eq i64 %xtraiter124, 0
  %43 = icmp eq i32 %1, 1
  %44 = insertelement <2 x float> undef, float %31, i32 0
  %45 = insertelement <2 x float> %44, float %20, i32 1
  %46 = fmul float %31, 0.000000e+00
  %47 = fmul float %exp2, 0.000000e+00
  %48 = fmul float %35, -0.000000e+00
  br label %.preheader50.us

._crit_edge95.thread:                             ; preds = %.preheader50.lr.ph
  %49 = fmul float %20, %34
  %50 = fsub float -0.000000e+00, %49
  br label %.preheader49.lr.ph

.preheader50.us:                                  ; preds = %.preheader50.us.preheader, %._crit_edge92.us
  %indvars.iv4193.us = phi i64 [ %indvars.iv.next42.us, %._crit_edge92.us ], [ 0, %.preheader50.us.preheader ]
  br i1 %lcmp.mod125, label %.prol.loopexit123, label %51

; <label>:51:                                     ; preds = %.preheader50.us
  %52 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv4193.us, i64 0
  %53 = load float, float* %52, align 4
  %54 = fmul float %20, %53
  %55 = fadd float %46, %54
  %56 = fadd float %47, %55
  %57 = fadd float %48, %56
  %58 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv4193.us, i64 0
  store float %57, float* %58, align 4
  %59 = load float, float* %52, align 4
  br label %.prol.loopexit123

.prol.loopexit123:                                ; preds = %.preheader50.us, %51
  %.01789.us.unr.ph = phi float [ %59, %51 ], [ 0.000000e+00, %.preheader50.us ]
  %.01988.us.unr.ph = phi float [ %57, %51 ], [ 0.000000e+00, %.preheader50.us ]
  %indvars.iv3987.us.unr.ph = phi i64 [ 1, %51 ], [ 0, %.preheader50.us ]
  br i1 %43, label %._crit_edge92.us, label %.preheader50.us.new.preheader

.preheader50.us.new.preheader:                    ; preds = %.prol.loopexit123
  br label %.preheader50.us.new

.preheader50.us.new:                              ; preds = %.preheader50.us.new.preheader, %.preheader50.us.new
  %.0790.us = phi float [ %68, %.preheader50.us.new ], [ 0.000000e+00, %.preheader50.us.new.preheader ]
  %.01789.us = phi float [ %82, %.preheader50.us.new ], [ %.01789.us.unr.ph, %.preheader50.us.new.preheader ]
  %.01988.us = phi float [ %80, %.preheader50.us.new ], [ %.01988.us.unr.ph, %.preheader50.us.new.preheader ]
  %indvars.iv3987.us = phi i64 [ %indvars.iv.next40.us.1, %.preheader50.us.new ], [ %indvars.iv3987.us.unr.ph, %.preheader50.us.new.preheader ]
  %60 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv4193.us, i64 %indvars.iv3987.us
  %61 = load float, float* %60, align 4
  %62 = fmul float %20, %61
  %63 = fmul float %31, %.01789.us
  %64 = fadd float %63, %62
  %65 = fmul float %exp2, %.01988.us
  %66 = fadd float %65, %64
  %67 = fmul float %.0790.us, %36
  %68 = fadd float %67, %66
  %69 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv4193.us, i64 %indvars.iv3987.us
  store float %68, float* %69, align 4
  %70 = bitcast float* %60 to <2 x float>*
  %indvars.iv.next40.us = add nuw nsw i64 %indvars.iv3987.us, 1
  %71 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv4193.us, i64 %indvars.iv.next40.us
  %72 = load <2 x float>, <2 x float>* %70, align 4
  %73 = fmul <2 x float> %45, %72
  %74 = extractelement <2 x float> %73, i32 0
  %75 = extractelement <2 x float> %73, i32 1
  %76 = fadd float %74, %75
  %77 = fmul float %exp2, %68
  %78 = fadd float %77, %76
  %79 = fmul float %.01988.us, %36
  %80 = fadd float %79, %78
  %81 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv4193.us, i64 %indvars.iv.next40.us
  store float %80, float* %81, align 4
  %82 = load float, float* %71, align 4
  %indvars.iv.next40.us.1 = add nuw nsw i64 %indvars.iv3987.us, 2
  %exitcond121.1 = icmp eq i64 %indvars.iv.next40.us.1, %37
  br i1 %exitcond121.1, label %._crit_edge92.us.loopexit, label %.preheader50.us.new

._crit_edge92.us.loopexit:                        ; preds = %.preheader50.us.new
  br label %._crit_edge92.us

._crit_edge92.us:                                 ; preds = %._crit_edge92.us.loopexit, %.prol.loopexit123
  %indvars.iv.next42.us = add nuw nsw i64 %indvars.iv4193.us, 1
  %exitcond126 = icmp eq i64 %indvars.iv.next42.us, %38
  br i1 %exitcond126, label %._crit_edge95, label %.preheader50.us

._crit_edge95:                                    ; preds = %._crit_edge92.us
  %83 = icmp sgt i32 %0, 0
  %84 = fmul float %20, %34
  %85 = fsub float -0.000000e+00, %84
  br i1 %83, label %.preheader49.lr.ph, label %.preheader46

.preheader49.lr.ph:                               ; preds = %._crit_edge95.thread, %._crit_edge95
  %86 = phi float [ %50, %._crit_edge95.thread ], [ %85, %._crit_edge95 ]
  %.in132 = add i32 %1, -1
  %87 = sext i32 %.in132 to i64
  %88 = icmp sgt i32 %.in132, -1
  br i1 %88, label %.preheader49.us.preheader, label %.preheader47.lr.ph

.preheader49.us.preheader:                        ; preds = %.preheader49.lr.ph
  br label %.preheader49.us

.preheader49.us:                                  ; preds = %.preheader49.us.preheader, %._crit_edge84.us
  %indvars.iv3785.us = phi i64 [ %indvars.iv.next38.us, %._crit_edge84.us ], [ 0, %.preheader49.us.preheader ]
  br label %89

; <label>:89:                                     ; preds = %.preheader49.us, %89
  %.082.us = phi float [ 0.000000e+00, %.preheader49.us ], [ %.0181.us, %89 ]
  %.0181.us = phi float [ 0.000000e+00, %.preheader49.us ], [ %96, %89 ]
  %.0580.us = phi float [ 0.000000e+00, %.preheader49.us ], [ %.0679.us, %89 ]
  %.0679.us = phi float [ 0.000000e+00, %.preheader49.us ], [ %99, %89 ]
  %indvars.iv3578.us = phi i64 [ %87, %.preheader49.us ], [ %indvars.iv.next36.us, %89 ]
  %90 = fmul float %32, %.0679.us
  %91 = fmul float %.0580.us, %86
  %92 = fadd float %90, %91
  %93 = fmul float %exp2, %.0181.us
  %94 = fadd float %92, %93
  %95 = fmul float %.082.us, %36
  %96 = fadd float %94, %95
  %97 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv3785.us, i64 %indvars.iv3578.us
  store float %96, float* %97, align 4
  %98 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv3785.us, i64 %indvars.iv3578.us
  %99 = load float, float* %98, align 4
  %indvars.iv.next36.us = add nsw i64 %indvars.iv3578.us, -1
  %100 = icmp sgt i64 %indvars.iv3578.us, 0
  br i1 %100, label %89, label %._crit_edge84.us

._crit_edge84.us:                                 ; preds = %89
  %indvars.iv.next38.us = add nuw nsw i64 %indvars.iv3785.us, 1
  %exitcond119 = icmp eq i64 %indvars.iv.next38.us, %38
  br i1 %exitcond119, label %.preheader48, label %.preheader49.us

.preheader48:                                     ; preds = %._crit_edge84.us
  %101 = icmp sgt i32 %0, 0
  br i1 %101, label %.preheader47.lr.ph, label %.preheader46

.preheader47.lr.ph:                               ; preds = %.preheader49.lr.ph, %.preheader48
  %102 = icmp sgt i32 %1, 0
  br i1 %102, label %.preheader47.us.preheader, label %._crit_edge54

.preheader47.us.preheader:                        ; preds = %.preheader47.lr.ph
  %xtraiter115 = and i64 %37, 1
  %lcmp.mod116 = icmp eq i64 %xtraiter115, 0
  %103 = icmp eq i32 %1, 1
  %104 = add nsw i64 %37, -2
  %105 = add nsw i64 %37, -2
  br label %.preheader47.us

.preheader47.us:                                  ; preds = %.preheader47.us.preheader, %._crit_edge75.us
  %indvars.iv3376.us = phi i64 [ %indvars.iv.next34.us, %._crit_edge75.us ], [ 0, %.preheader47.us.preheader ]
  %scevgep135 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv3376.us, i64 2
  %scevgep141 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv3376.us, i64 2
  %scevgep147 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv3376.us, i64 2
  br i1 %lcmp.mod116, label %.prol.loopexit114, label %106

; <label>:106:                                    ; preds = %.preheader47.us
  %107 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv3376.us, i64 0
  %108 = load float, float* %107, align 4
  %109 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv3376.us, i64 0
  %110 = load float, float* %109, align 4
  %111 = fadd float %108, %110
  %112 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv3376.us, i64 0
  store float %111, float* %112, align 4
  br label %.prol.loopexit114

.prol.loopexit114:                                ; preds = %.preheader47.us, %106
  %indvars.iv3173.us.unr.ph = phi i64 [ 1, %106 ], [ 0, %.preheader47.us ]
  br i1 %103, label %._crit_edge75.us, label %.preheader47.us.new.preheader

.preheader47.us.new.preheader:                    ; preds = %.prol.loopexit114
  %113 = sub nsw i64 %104, %indvars.iv3173.us.unr.ph
  %114 = lshr i64 %113, 1
  %115 = add nuw i64 %114, 1
  %min.iters.check = icmp ult i64 %115, 4
  br i1 %min.iters.check, label %.preheader47.us.new.preheader211, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader47.us.new.preheader
  %n.mod.vf = and i64 %115, 3
  %n.vec = sub i64 %115, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.preheader47.us.new.preheader211, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep133 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv3376.us, i64 %indvars.iv3173.us.unr.ph
  %116 = sub nsw i64 %105, %indvars.iv3173.us.unr.ph
  %117 = and i64 %116, -2
  %118 = or i64 %indvars.iv3173.us.unr.ph, %117
  %scevgep136 = getelementptr float, float* %scevgep135, i64 %118
  %scevgep139 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv3376.us, i64 %indvars.iv3173.us.unr.ph
  %scevgep142 = getelementptr float, float* %scevgep141, i64 %118
  %scevgep145 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv3376.us, i64 %indvars.iv3173.us.unr.ph
  %scevgep148 = getelementptr float, float* %scevgep147, i64 %118
  %bound0 = icmp ult float* %scevgep133, %scevgep142
  %bound1 = icmp ult float* %scevgep139, %scevgep136
  %found.conflict = and i1 %bound0, %bound1
  %bound0150 = icmp ult float* %scevgep133, %scevgep148
  %bound1151 = icmp ult float* %scevgep145, %scevgep136
  %found.conflict152 = and i1 %bound0150, %bound1151
  %conflict.rdx = or i1 %found.conflict, %found.conflict152
  %119 = or i64 %indvars.iv3173.us.unr.ph, 2
  %120 = shl nuw i64 %114, 1
  %121 = add i64 %119, %120
  %122 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %121, %122
  br i1 %conflict.rdx, label %.preheader47.us.new.preheader211, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %123 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv3173.us.unr.ph, %123
  %124 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv3376.us, i64 %offset.idx
  %125 = bitcast float* %124 to <8 x float>*
  %wide.vec = load <8 x float>, <8 x float>* %125, align 4, !alias.scope !6
  %126 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv3376.us, i64 %offset.idx
  %127 = bitcast float* %126 to <8 x float>*
  %wide.vec154 = load <8 x float>, <8 x float>* %127, align 4, !alias.scope !9
  %128 = fadd <8 x float> %wide.vec, %wide.vec154
  %129 = shufflevector <8 x float> %128, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %130 = add nuw nsw i64 %offset.idx, 1
  %131 = fadd <8 x float> %wide.vec, %wide.vec154
  %132 = shufflevector <8 x float> %131, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %133 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv3376.us, i64 %130
  %134 = getelementptr float, float* %133, i64 -1
  %135 = bitcast float* %134 to <8 x float>*
  %interleaved.vec = shufflevector <4 x float> %129, <4 x float> %132, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec, <8 x float>* %135, align 4, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %136 = icmp eq i64 %index.next, %n.vec
  br i1 %136, label %middle.block, label %vector.body, !llvm.loop !14

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge75.us, label %.preheader47.us.new.preheader211

.preheader47.us.new.preheader211:                 ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader47.us.new.preheader
  %indvars.iv3173.us.ph = phi i64 [ %indvars.iv3173.us.unr.ph, %vector.memcheck ], [ %indvars.iv3173.us.unr.ph, %min.iters.checked ], [ %indvars.iv3173.us.unr.ph, %.preheader47.us.new.preheader ], [ %ind.end, %middle.block ]
  br label %.preheader47.us.new

.preheader47.us.new:                              ; preds = %.preheader47.us.new.preheader211, %.preheader47.us.new
  %indvars.iv3173.us = phi i64 [ %indvars.iv.next32.us.1, %.preheader47.us.new ], [ %indvars.iv3173.us.ph, %.preheader47.us.new.preheader211 ]
  %137 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv3376.us, i64 %indvars.iv3173.us
  %138 = load float, float* %137, align 4
  %139 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv3376.us, i64 %indvars.iv3173.us
  %140 = load float, float* %139, align 4
  %141 = fadd float %138, %140
  %142 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv3376.us, i64 %indvars.iv3173.us
  store float %141, float* %142, align 4
  %indvars.iv.next32.us = add nuw nsw i64 %indvars.iv3173.us, 1
  %143 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv3376.us, i64 %indvars.iv.next32.us
  %144 = load float, float* %143, align 4
  %145 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv3376.us, i64 %indvars.iv.next32.us
  %146 = load float, float* %145, align 4
  %147 = fadd float %144, %146
  %148 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv3376.us, i64 %indvars.iv.next32.us
  store float %147, float* %148, align 4
  %indvars.iv.next32.us.1 = add nuw nsw i64 %indvars.iv3173.us, 2
  %exitcond112.1 = icmp eq i64 %indvars.iv.next32.us.1, %37
  br i1 %exitcond112.1, label %._crit_edge75.us.loopexit, label %.preheader47.us.new, !llvm.loop !15

._crit_edge75.us.loopexit:                        ; preds = %.preheader47.us.new
  br label %._crit_edge75.us

._crit_edge75.us:                                 ; preds = %._crit_edge75.us.loopexit, %middle.block, %.prol.loopexit114
  %indvars.iv.next34.us = add nuw nsw i64 %indvars.iv3376.us, 1
  %exitcond117 = icmp eq i64 %indvars.iv.next34.us, %38
  br i1 %exitcond117, label %.preheader46.loopexit, label %.preheader47.us

.preheader46.loopexit:                            ; preds = %._crit_edge75.us
  br label %.preheader46

.preheader46:                                     ; preds = %.preheader46.loopexit, %._crit_edge95, %._crit_edge95.thread128, %.preheader48
  %149 = phi float [ %86, %.preheader48 ], [ %41, %._crit_edge95.thread128 ], [ %85, %._crit_edge95 ], [ %86, %.preheader46.loopexit ]
  %150 = icmp sgt i32 %1, 0
  br i1 %150, label %.preheader45.lr.ph, label %.preheader43

.preheader45.lr.ph:                               ; preds = %.preheader46
  %151 = icmp sgt i32 %0, 0
  br i1 %151, label %.preheader45.us.preheader, label %._crit_edge72.thread131

.preheader45.us.preheader:                        ; preds = %.preheader45.lr.ph
  %xtraiter108 = and i64 %38, 1
  %lcmp.mod109 = icmp eq i64 %xtraiter108, 0
  %152 = icmp eq i32 %0, 1
  %153 = fmul float %31, 0.000000e+00
  %154 = fmul float %exp2, 0.000000e+00
  %155 = fmul float %35, -0.000000e+00
  br label %.preheader45.us

._crit_edge72.thread131:                          ; preds = %.preheader45.lr.ph
  br label %.preheader44.lr.ph

.preheader45.us:                                  ; preds = %.preheader45.us.preheader, %._crit_edge69.us
  %indvars.iv2970.us = phi i64 [ %indvars.iv.next30.us, %._crit_edge69.us ], [ 0, %.preheader45.us.preheader ]
  br i1 %lcmp.mod109, label %.prol.loopexit107, label %156

; <label>:156:                                    ; preds = %.preheader45.us
  %157 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 0, i64 %indvars.iv2970.us
  %158 = load float, float* %157, align 4
  %159 = fmul float %20, %158
  %160 = fadd float %153, %159
  %161 = fadd float %154, %160
  %162 = fadd float %155, %161
  %163 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 0, i64 %indvars.iv2970.us
  store float %162, float* %163, align 4
  %164 = load float, float* %157, align 4
  br label %.prol.loopexit107

.prol.loopexit107:                                ; preds = %.preheader45.us, %156
  %.01866.us.unr.ph = phi float [ %164, %156 ], [ 0.000000e+00, %.preheader45.us ]
  %.12065.us.unr.ph = phi float [ %162, %156 ], [ 0.000000e+00, %.preheader45.us ]
  %indvars.iv2764.us.unr.ph = phi i64 [ 1, %156 ], [ 0, %.preheader45.us ]
  br i1 %152, label %._crit_edge69.us, label %.preheader45.us.new.preheader

.preheader45.us.new.preheader:                    ; preds = %.prol.loopexit107
  br label %.preheader45.us.new

.preheader45.us.new:                              ; preds = %.preheader45.us.new.preheader, %.preheader45.us.new
  %.1867.us = phi float [ %173, %.preheader45.us.new ], [ 0.000000e+00, %.preheader45.us.new.preheader ]
  %.01866.us = phi float [ %186, %.preheader45.us.new ], [ %.01866.us.unr.ph, %.preheader45.us.new.preheader ]
  %.12065.us = phi float [ %184, %.preheader45.us.new ], [ %.12065.us.unr.ph, %.preheader45.us.new.preheader ]
  %indvars.iv2764.us = phi i64 [ %indvars.iv.next28.us.1, %.preheader45.us.new ], [ %indvars.iv2764.us.unr.ph, %.preheader45.us.new.preheader ]
  %165 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv2764.us, i64 %indvars.iv2970.us
  %166 = load float, float* %165, align 4
  %167 = fmul float %20, %166
  %168 = fmul float %31, %.01866.us
  %169 = fadd float %168, %167
  %170 = fmul float %exp2, %.12065.us
  %171 = fadd float %170, %169
  %172 = fmul float %.1867.us, %36
  %173 = fadd float %172, %171
  %174 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv2764.us, i64 %indvars.iv2970.us
  store float %173, float* %174, align 4
  %175 = load float, float* %165, align 4
  %indvars.iv.next28.us = add nuw nsw i64 %indvars.iv2764.us, 1
  %176 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next28.us, i64 %indvars.iv2970.us
  %177 = load float, float* %176, align 4
  %178 = fmul float %20, %177
  %179 = fmul float %31, %175
  %180 = fadd float %179, %178
  %181 = fmul float %exp2, %173
  %182 = fadd float %181, %180
  %183 = fmul float %.12065.us, %36
  %184 = fadd float %183, %182
  %185 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv.next28.us, i64 %indvars.iv2970.us
  store float %184, float* %185, align 4
  %186 = load float, float* %176, align 4
  %indvars.iv.next28.us.1 = add nuw nsw i64 %indvars.iv2764.us, 2
  %exitcond105.1 = icmp eq i64 %indvars.iv.next28.us.1, %38
  br i1 %exitcond105.1, label %._crit_edge69.us.loopexit, label %.preheader45.us.new

._crit_edge69.us.loopexit:                        ; preds = %.preheader45.us.new
  br label %._crit_edge69.us

._crit_edge69.us:                                 ; preds = %._crit_edge69.us.loopexit, %.prol.loopexit107
  %indvars.iv.next30.us = add nuw nsw i64 %indvars.iv2970.us, 1
  %exitcond110 = icmp eq i64 %indvars.iv.next30.us, %37
  br i1 %exitcond110, label %._crit_edge72, label %.preheader45.us

._crit_edge72:                                    ; preds = %._crit_edge69.us
  %187 = icmp sgt i32 %1, 0
  br i1 %187, label %.preheader44.lr.ph, label %.preheader43

.preheader44.lr.ph:                               ; preds = %._crit_edge72.thread131, %._crit_edge72
  %.in = add i32 %0, -1
  %188 = sext i32 %.in to i64
  %189 = icmp sgt i32 %.in, -1
  br i1 %189, label %.preheader44.us.preheader, label %.preheader43

.preheader44.us.preheader:                        ; preds = %.preheader44.lr.ph
  br label %.preheader44.us

.preheader44.us:                                  ; preds = %.preheader44.us.preheader, %._crit_edge61.us
  %indvars.iv2562.us = phi i64 [ %indvars.iv.next26.us, %._crit_edge61.us ], [ 0, %.preheader44.us.preheader ]
  br label %190

; <label>:190:                                    ; preds = %.preheader44.us, %190
  %.159.us = phi float [ 0.000000e+00, %.preheader44.us ], [ %.1258.us, %190 ]
  %.1258.us = phi float [ 0.000000e+00, %.preheader44.us ], [ %197, %190 ]
  %.0357.us = phi float [ 0.000000e+00, %.preheader44.us ], [ %.0456.us, %190 ]
  %.0456.us = phi float [ 0.000000e+00, %.preheader44.us ], [ %200, %190 ]
  %indvars.iv2355.us = phi i64 [ %188, %.preheader44.us ], [ %indvars.iv.next24.us, %190 ]
  %191 = fmul float %32, %.0456.us
  %192 = fmul float %.0357.us, %149
  %193 = fadd float %191, %192
  %194 = fmul float %exp2, %.1258.us
  %195 = fadd float %193, %194
  %196 = fmul float %.159.us, %36
  %197 = fadd float %195, %196
  %198 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv2355.us, i64 %indvars.iv2562.us
  store float %197, float* %198, align 4
  %199 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv2355.us, i64 %indvars.iv2562.us
  %200 = load float, float* %199, align 4
  %indvars.iv.next24.us = add nsw i64 %indvars.iv2355.us, -1
  %201 = icmp sgt i64 %indvars.iv2355.us, 0
  br i1 %201, label %190, label %._crit_edge61.us

._crit_edge61.us:                                 ; preds = %190
  %indvars.iv.next26.us = add nuw nsw i64 %indvars.iv2562.us, 1
  %exitcond103 = icmp eq i64 %indvars.iv.next26.us, %37
  br i1 %exitcond103, label %.preheader43.loopexit, label %.preheader44.us

.preheader43.loopexit:                            ; preds = %._crit_edge61.us
  br label %.preheader43

.preheader43:                                     ; preds = %.preheader43.loopexit, %.preheader46, %.preheader44.lr.ph, %._crit_edge72
  %202 = icmp sgt i32 %0, 0
  %203 = icmp sgt i32 %1, 0
  %or.cond = and i1 %202, %203
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge54

.preheader.us.preheader:                          ; preds = %.preheader43
  %xtraiter = and i64 %37, 1
  %lcmp.mod = icmp eq i64 %xtraiter, 0
  %204 = icmp eq i32 %1, 1
  %205 = add nsw i64 %37, -2
  %206 = add nsw i64 %37, -2
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv2152.us = phi i64 [ %indvars.iv.next22.us, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep169 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv2152.us, i64 2
  %scevgep175 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv2152.us, i64 2
  %scevgep181 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv2152.us, i64 2
  br i1 %lcmp.mod, label %.prol.loopexit, label %207

; <label>:207:                                    ; preds = %.preheader.us
  %208 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv2152.us, i64 0
  %209 = load float, float* %208, align 4
  %210 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv2152.us, i64 0
  %211 = load float, float* %210, align 4
  %212 = fadd float %209, %211
  %213 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv2152.us, i64 0
  store float %212, float* %213, align 4
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us, %207
  %indvars.iv51.us.unr.ph = phi i64 [ 1, %207 ], [ 0, %.preheader.us ]
  br i1 %204, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  %214 = sub nsw i64 %205, %indvars.iv51.us.unr.ph
  %215 = lshr i64 %214, 1
  %216 = add nuw i64 %215, 1
  %min.iters.check160 = icmp ult i64 %216, 4
  br i1 %min.iters.check160, label %.preheader.us.new.preheader210, label %min.iters.checked161

min.iters.checked161:                             ; preds = %.preheader.us.new.preheader
  %n.mod.vf162 = and i64 %216, 3
  %n.vec163 = sub i64 %216, %n.mod.vf162
  %cmp.zero164 = icmp eq i64 %n.vec163, 0
  br i1 %cmp.zero164, label %.preheader.us.new.preheader210, label %vector.memcheck192

vector.memcheck192:                               ; preds = %min.iters.checked161
  %scevgep167 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv2152.us, i64 %indvars.iv51.us.unr.ph
  %217 = sub nsw i64 %206, %indvars.iv51.us.unr.ph
  %218 = and i64 %217, -2
  %219 = or i64 %indvars.iv51.us.unr.ph, %218
  %scevgep170 = getelementptr float, float* %scevgep169, i64 %219
  %scevgep173 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv2152.us, i64 %indvars.iv51.us.unr.ph
  %scevgep176 = getelementptr float, float* %scevgep175, i64 %219
  %scevgep179 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv2152.us, i64 %indvars.iv51.us.unr.ph
  %scevgep182 = getelementptr float, float* %scevgep181, i64 %219
  %bound0184 = icmp ult float* %scevgep167, %scevgep176
  %bound1185 = icmp ult float* %scevgep173, %scevgep170
  %found.conflict186 = and i1 %bound0184, %bound1185
  %bound0187 = icmp ult float* %scevgep167, %scevgep182
  %bound1188 = icmp ult float* %scevgep179, %scevgep170
  %found.conflict189 = and i1 %bound0187, %bound1188
  %conflict.rdx190 = or i1 %found.conflict186, %found.conflict189
  %220 = or i64 %indvars.iv51.us.unr.ph, 2
  %221 = shl nuw i64 %215, 1
  %222 = add i64 %220, %221
  %223 = shl nuw nsw i64 %n.mod.vf162, 1
  %ind.end197 = sub i64 %222, %223
  br i1 %conflict.rdx190, label %.preheader.us.new.preheader210, label %vector.body157.preheader

vector.body157.preheader:                         ; preds = %vector.memcheck192
  br label %vector.body157

vector.body157:                                   ; preds = %vector.body157.preheader, %vector.body157
  %index194 = phi i64 [ %index.next195, %vector.body157 ], [ 0, %vector.body157.preheader ]
  %224 = shl i64 %index194, 1
  %offset.idx199 = or i64 %indvars.iv51.us.unr.ph, %224
  %225 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv2152.us, i64 %offset.idx199
  %226 = bitcast float* %225 to <8 x float>*
  %wide.vec203 = load <8 x float>, <8 x float>* %226, align 4, !alias.scope !16
  %227 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv2152.us, i64 %offset.idx199
  %228 = bitcast float* %227 to <8 x float>*
  %wide.vec206 = load <8 x float>, <8 x float>* %228, align 4, !alias.scope !19
  %229 = fadd <8 x float> %wide.vec203, %wide.vec206
  %230 = shufflevector <8 x float> %229, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %231 = add nuw nsw i64 %offset.idx199, 1
  %232 = fadd <8 x float> %wide.vec203, %wide.vec206
  %233 = shufflevector <8 x float> %232, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %234 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv2152.us, i64 %231
  %235 = getelementptr float, float* %234, i64 -1
  %236 = bitcast float* %235 to <8 x float>*
  %interleaved.vec209 = shufflevector <4 x float> %230, <4 x float> %233, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec209, <8 x float>* %236, align 4, !alias.scope !21, !noalias !23
  %index.next195 = add i64 %index194, 4
  %237 = icmp eq i64 %index.next195, %n.vec163
  br i1 %237, label %middle.block158, label %vector.body157, !llvm.loop !24

middle.block158:                                  ; preds = %vector.body157
  %cmp.n198 = icmp eq i64 %n.mod.vf162, 0
  br i1 %cmp.n198, label %._crit_edge.us, label %.preheader.us.new.preheader210

.preheader.us.new.preheader210:                   ; preds = %middle.block158, %vector.memcheck192, %min.iters.checked161, %.preheader.us.new.preheader
  %indvars.iv51.us.ph = phi i64 [ %indvars.iv51.us.unr.ph, %vector.memcheck192 ], [ %indvars.iv51.us.unr.ph, %min.iters.checked161 ], [ %indvars.iv51.us.unr.ph, %.preheader.us.new.preheader ], [ %ind.end197, %middle.block158 ]
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader210, %.preheader.us.new
  %indvars.iv51.us = phi i64 [ %indvars.iv.next.us.1, %.preheader.us.new ], [ %indvars.iv51.us.ph, %.preheader.us.new.preheader210 ]
  %238 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv2152.us, i64 %indvars.iv51.us
  %239 = load float, float* %238, align 4
  %240 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv2152.us, i64 %indvars.iv51.us
  %241 = load float, float* %240, align 4
  %242 = fadd float %239, %241
  %243 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv2152.us, i64 %indvars.iv51.us
  store float %242, float* %243, align 4
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv51.us, 1
  %244 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv2152.us, i64 %indvars.iv.next.us
  %245 = load float, float* %244, align 4
  %246 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv2152.us, i64 %indvars.iv.next.us
  %247 = load float, float* %246, align 4
  %248 = fadd float %245, %247
  %249 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv2152.us, i64 %indvars.iv.next.us
  store float %248, float* %249, align 4
  %indvars.iv.next.us.1 = add nuw nsw i64 %indvars.iv51.us, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.us.1, %37
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader.us.new, !llvm.loop !25

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block158, %.prol.loopexit
  %indvars.iv.next22.us = add nuw nsw i64 %indvars.iv2152.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next22.us, %38
  br i1 %exitcond, label %._crit_edge54.loopexit, label %.preheader.us

._crit_edge54.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge54

._crit_edge54:                                    ; preds = %._crit_edge54.loopexit, %.preheader47.lr.ph, %.preheader43
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [2160 x float]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  %8 = sext i32 %1 to i64
  %9 = sext i32 %0 to i64
  %10 = icmp sgt i32 %0, 0
  %11 = icmp sgt i32 %1, 0
  %or.cond = and i1 %10, %11
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge7

.preheader.us.preheader:                          ; preds = %3
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv25.us = phi i64 [ %indvars.iv.next3.us, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %12 = mul nsw i64 %indvars.iv25.us, %8
  br label %13

; <label>:13:                                     ; preds = %20, %.preheader.us
  %indvars.iv4.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %20 ]
  %14 = add nsw i64 %indvars.iv4.us, %12
  %15 = trunc i64 %14 to i32
  %16 = srem i32 %15, 20
  %17 = icmp eq i32 %16, 0
  br i1 %17, label %18, label %20

; <label>:18:                                     ; preds = %13
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %19) #6
  br label %20

; <label>:20:                                     ; preds = %18, %13
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv25.us, i64 %indvars.iv4.us
  %23 = load float, float* %22, align 4
  %24 = fpext float %23 to double
  %25 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %24) #7
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv4.us, 1
  %exitcond = icmp eq i64 %indvars.iv.next.us, %8
  br i1 %exitcond, label %._crit_edge.us, label %13

._crit_edge.us:                                   ; preds = %20
  %indvars.iv.next3.us = add nuw nsw i64 %indvars.iv25.us, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next3.us, %9
  br i1 %exitcond9, label %._crit_edge7.loopexit, label %.preheader.us

._crit_edge7.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge7.loopexit, %3
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %26, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  %28 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %29 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %28) #6
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
