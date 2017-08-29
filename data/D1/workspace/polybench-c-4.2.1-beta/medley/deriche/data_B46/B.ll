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
.lr.ph16:
  store float 2.500000e-01, float* %2, align 4
  br label %.lr.ph16.split.us

.lr.ph16.split.us:                                ; preds = %._crit_edge.us, %.lr.ph16
  %indvars.iv = phi i64 [ 0, %.lr.ph16 ], [ %indvars.iv.next, %._crit_edge.us ]
  %4 = mul nuw nsw i64 %indvars.iv, 313
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph16.split.us
  %indvars.iv.us = phi i64 [ 0, %.lr.ph16.split.us ], [ %indvars.iv.next.us, %._crit_edge ]
  %5 = mul nuw nsw i64 %indvars.iv.us, 991
  %6 = add nuw nsw i64 %5, %4
  %7 = trunc i64 %6 to i32
  %8 = srem i32 %7, 65536
  %9 = sitofp i32 %8 to float
  %10 = fdiv float %9, 6.553500e+04
  %11 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv, i64 %indvars.iv.us
  store float %10, float* %11, align 4
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 2160
  br i1 %exitcond.us, label %._crit_edge.us, label %._crit_edge

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 4096
  br i1 %exitcond, label %._crit_edge17, label %.lr.ph16.split.us

._crit_edge17:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_deriche(i32, i32, float, [2160 x float]* nocapture readonly, [2160 x float]* nocapture, [2160 x float]* nocapture, [2160 x float]* nocapture) unnamed_addr #0 {
.lr.ph228:
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
  %exp2 = tail call float @llvm.exp2.f32(float %7)
  %34 = tail call float @expf(float %31) #5
  %35 = fsub float -0.000000e+00, %34
  %36 = insertelement <2 x float> undef, float %30, i32 0
  %37 = insertelement <2 x float> %36, float %19, i32 1
  br label %.lr.ph228.split.us

.lr.ph228.split.us:                               ; preds = %._crit_edge225.us, %.lr.ph228
  %indvars.iv266.us = phi i64 [ 0, %.lr.ph228 ], [ %indvars.iv.next267.us, %._crit_edge225.us ]
  br label %.lr.ph228.split.us.new

.lr.ph228.split.us.new:                           ; preds = %.lr.ph228.split.us.new..lr.ph228.split.us.new_crit_edge, %.lr.ph228.split.us
  %indvars.iv262.us = phi i64 [ %indvars.iv.next263.us.1, %.lr.ph228.split.us.new..lr.ph228.split.us.new_crit_edge ], [ 0, %.lr.ph228.split.us ]
  %.0155221.us = phi float [ %60, %.lr.ph228.split.us.new..lr.ph228.split.us.new_crit_edge ], [ 0.000000e+00, %.lr.ph228.split.us ]
  %.0157220.us = phi float [ %57, %.lr.ph228.split.us.new..lr.ph228.split.us.new_crit_edge ], [ 0.000000e+00, %.lr.ph228.split.us ]
  %.0159219.us = phi float [ %46, %.lr.ph228.split.us.new..lr.ph228.split.us.new_crit_edge ], [ 0.000000e+00, %.lr.ph228.split.us ]
  %38 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv266.us, i64 %indvars.iv262.us
  %39 = load float, float* %38, align 4
  %40 = fmul float %19, %39
  %41 = fmul float %30, %.0155221.us
  %42 = fadd float %41, %40
  %43 = fmul float %exp2, %.0157220.us
  %44 = fadd float %43, %42
  %45 = fmul float %.0159219.us, %35
  %46 = fadd float %45, %44
  %47 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv266.us, i64 %indvars.iv262.us
  store float %46, float* %47, align 4
  %48 = bitcast float* %38 to <2 x float>*
  %indvars.iv.next263.us = or i64 %indvars.iv262.us, 1
  %49 = load <2 x float>, <2 x float>* %48, align 4
  %50 = fmul <2 x float> %37, %49
  %51 = extractelement <2 x float> %50, i32 0
  %52 = extractelement <2 x float> %50, i32 1
  %53 = fadd float %51, %52
  %54 = fmul float %exp2, %46
  %55 = fadd float %54, %53
  %56 = fmul float %.0157220.us, %35
  %57 = fadd float %56, %55
  %58 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv266.us, i64 %indvars.iv.next263.us
  store float %57, float* %58, align 4
  %indvars.iv.next263.us.1 = add nuw nsw i64 %indvars.iv262.us, 2
  %exitcond265.us.1 = icmp eq i64 %indvars.iv.next263.us.1, 2160
  br i1 %exitcond265.us.1, label %._crit_edge225.us, label %.lr.ph228.split.us.new..lr.ph228.split.us.new_crit_edge

.lr.ph228.split.us.new..lr.ph228.split.us.new_crit_edge: ; preds = %.lr.ph228.split.us.new
  %59 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv266.us, i64 %indvars.iv.next263.us
  %60 = load float, float* %59, align 4
  br label %.lr.ph228.split.us.new

._crit_edge225.us:                                ; preds = %.lr.ph228.split.us.new
  %indvars.iv.next267.us = add nuw nsw i64 %indvars.iv266.us, 1
  %exitcond269.us = icmp eq i64 %indvars.iv.next267.us, 4096
  br i1 %exitcond269.us, label %.lr.ph217.split.us.preheader, label %.lr.ph228.split.us

.lr.ph217.split.us.preheader:                     ; preds = %._crit_edge225.us
  %61 = extractelement <2 x float> %29, i32 1
  %62 = fsub float -0.000000e+00, %33
  br label %.lr.ph217.split.us

.lr.ph217.split.us:                               ; preds = %._crit_edge214.us, %.lr.ph217.split.us.preheader
  %indvars.iv258.us = phi i64 [ 0, %.lr.ph217.split.us.preheader ], [ %indvars.iv.next259.us, %._crit_edge214.us ]
  br label %.lr.ph217.split.us.new

.lr.ph217.split.us.new:                           ; preds = %.lr.ph217.split.us.new..lr.ph217.split.us.new_crit_edge, %.lr.ph217.split.us
  %indvars.iv256.us.in = phi i64 [ %indvars.iv256.us.1, %.lr.ph217.split.us.new..lr.ph217.split.us.new_crit_edge ], [ 2160, %.lr.ph217.split.us ]
  %.0161210.us = phi float [ %83, %.lr.ph217.split.us.new..lr.ph217.split.us.new_crit_edge ], [ 0.000000e+00, %.lr.ph217.split.us ]
  %.0162209.us = phi float [ %72, %.lr.ph217.split.us.new..lr.ph217.split.us.new_crit_edge ], [ 0.000000e+00, %.lr.ph217.split.us ]
  %.0165208.us = phi float [ %79, %.lr.ph217.split.us.new..lr.ph217.split.us.new_crit_edge ], [ 0.000000e+00, %.lr.ph217.split.us ]
  %.0167207.us = phi float [ %69, %.lr.ph217.split.us.new..lr.ph217.split.us.new_crit_edge ], [ 0.000000e+00, %.lr.ph217.split.us ]
  %indvars.iv256.us = add nsw i64 %indvars.iv256.us.in, -1
  %63 = fmul float %61, %.0161210.us
  %64 = fmul float %.0162209.us, %62
  %65 = fadd float %64, %63
  %66 = fmul float %exp2, %.0165208.us
  %67 = fadd float %66, %65
  %68 = fmul float %.0167207.us, %35
  %69 = fadd float %68, %67
  %70 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv258.us, i64 %indvars.iv256.us
  store float %69, float* %70, align 4
  %71 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv258.us, i64 %indvars.iv256.us
  %72 = load float, float* %71, align 4
  %indvars.iv256.us.1 = add nsw i64 %indvars.iv256.us.in, -2
  %73 = fmul float %61, %72
  %74 = fmul float %.0161210.us, %62
  %75 = fadd float %74, %73
  %76 = fmul float %exp2, %69
  %77 = fadd float %76, %75
  %78 = fmul float %.0165208.us, %35
  %79 = fadd float %78, %77
  %80 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv258.us, i64 %indvars.iv256.us.1
  store float %79, float* %80, align 4
  %81 = icmp sgt i64 %indvars.iv256.us.in, 2
  br i1 %81, label %.lr.ph217.split.us.new..lr.ph217.split.us.new_crit_edge, label %._crit_edge214.us

.lr.ph217.split.us.new..lr.ph217.split.us.new_crit_edge: ; preds = %.lr.ph217.split.us.new
  %82 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv258.us, i64 %indvars.iv256.us.1
  %83 = load float, float* %82, align 4
  br label %.lr.ph217.split.us.new

._crit_edge214.us:                                ; preds = %.lr.ph217.split.us.new
  %indvars.iv.next259.us = add nuw nsw i64 %indvars.iv258.us, 1
  %exitcond261.us = icmp eq i64 %indvars.iv.next259.us, 4096
  br i1 %exitcond261.us, label %.lr.ph204.split.us.preheader, label %.lr.ph217.split.us

.lr.ph204.split.us.preheader:                     ; preds = %._crit_edge214.us
  br label %.lr.ph204.split.us

.lr.ph204.split.us:                               ; preds = %.lr.ph204.split.us.preheader, %._crit_edge201.us
  %indvars.iv252.us = phi i64 [ %indvars.iv.next253.us, %._crit_edge201.us ], [ 0, %.lr.ph204.split.us.preheader ]
  br label %.lr.ph204.split.us.new

.lr.ph204.split.us.new:                           ; preds = %.lr.ph204.split.us.new, %.lr.ph204.split.us
  %indvars.iv248.us = phi i64 [ 0, %.lr.ph204.split.us ], [ %indvars.iv.next249.us.1, %.lr.ph204.split.us.new ]
  %84 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv252.us, i64 %indvars.iv248.us
  %85 = load float, float* %84, align 4
  %86 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv252.us, i64 %indvars.iv248.us
  %87 = load float, float* %86, align 4
  %88 = fadd float %85, %87
  %89 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv252.us, i64 %indvars.iv248.us
  store float %88, float* %89, align 4
  %indvars.iv.next249.us = or i64 %indvars.iv248.us, 1
  %90 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv252.us, i64 %indvars.iv.next249.us
  %91 = load float, float* %90, align 4
  %92 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv252.us, i64 %indvars.iv.next249.us
  %93 = load float, float* %92, align 4
  %94 = fadd float %91, %93
  %95 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv252.us, i64 %indvars.iv.next249.us
  store float %94, float* %95, align 4
  %indvars.iv.next249.us.1 = add nuw nsw i64 %indvars.iv248.us, 2
  %exitcond251.us.1 = icmp eq i64 %indvars.iv.next249.us.1, 2160
  br i1 %exitcond251.us.1, label %._crit_edge201.us, label %.lr.ph204.split.us.new

._crit_edge201.us:                                ; preds = %.lr.ph204.split.us.new
  %indvars.iv.next253.us = add nuw nsw i64 %indvars.iv252.us, 1
  %exitcond255.us = icmp eq i64 %indvars.iv.next253.us, 4096
  br i1 %exitcond255.us, label %.lr.ph196.split.us.preheader, label %.lr.ph204.split.us

.lr.ph196.split.us.preheader:                     ; preds = %._crit_edge201.us
  br label %.lr.ph196.split.us

.lr.ph196.split.us:                               ; preds = %.lr.ph196.split.us.preheader, %._crit_edge193.us
  %indvars.iv244.us = phi i64 [ %indvars.iv.next245.us, %._crit_edge193.us ], [ 0, %.lr.ph196.split.us.preheader ]
  br label %.lr.ph196.split.us.new

.lr.ph196.split.us.new:                           ; preds = %.lr.ph196.split.us.new..lr.ph196.split.us.new_crit_edge, %.lr.ph196.split.us
  %indvars.iv240.us = phi i64 [ %indvars.iv.next241.us.1, %.lr.ph196.split.us.new..lr.ph196.split.us.new_crit_edge ], [ 0, %.lr.ph196.split.us ]
  %.0156189.us = phi float [ %117, %.lr.ph196.split.us.new..lr.ph196.split.us.new_crit_edge ], [ 0.000000e+00, %.lr.ph196.split.us ]
  %.1158188.us = phi float [ %115, %.lr.ph196.split.us.new..lr.ph196.split.us.new_crit_edge ], [ 0.000000e+00, %.lr.ph196.split.us ]
  %.1160187.us = phi float [ %104, %.lr.ph196.split.us.new..lr.ph196.split.us.new_crit_edge ], [ 0.000000e+00, %.lr.ph196.split.us ]
  %96 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv240.us, i64 %indvars.iv244.us
  %97 = load float, float* %96, align 4
  %98 = fmul float %19, %97
  %99 = fmul float %30, %.0156189.us
  %100 = fadd float %99, %98
  %101 = fmul float %exp2, %.1158188.us
  %102 = fadd float %101, %100
  %103 = fmul float %.1160187.us, %35
  %104 = fadd float %103, %102
  %105 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv240.us, i64 %indvars.iv244.us
  store float %104, float* %105, align 4
  %106 = load float, float* %96, align 4
  %indvars.iv.next241.us = or i64 %indvars.iv240.us, 1
  %107 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next241.us, i64 %indvars.iv244.us
  %108 = load float, float* %107, align 4
  %109 = fmul float %19, %108
  %110 = fmul float %30, %106
  %111 = fadd float %110, %109
  %112 = fmul float %exp2, %104
  %113 = fadd float %112, %111
  %114 = fmul float %.1158188.us, %35
  %115 = fadd float %114, %113
  %116 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv.next241.us, i64 %indvars.iv244.us
  store float %115, float* %116, align 4
  %indvars.iv.next241.us.1 = add nuw nsw i64 %indvars.iv240.us, 2
  %exitcond243.us.1 = icmp eq i64 %indvars.iv.next241.us.1, 4096
  br i1 %exitcond243.us.1, label %._crit_edge193.us, label %.lr.ph196.split.us.new..lr.ph196.split.us.new_crit_edge

.lr.ph196.split.us.new..lr.ph196.split.us.new_crit_edge: ; preds = %.lr.ph196.split.us.new
  %117 = load float, float* %107, align 4
  br label %.lr.ph196.split.us.new

._crit_edge193.us:                                ; preds = %.lr.ph196.split.us.new
  %indvars.iv.next245.us = add nuw nsw i64 %indvars.iv244.us, 1
  %exitcond247.us = icmp eq i64 %indvars.iv.next245.us, 2160
  br i1 %exitcond247.us, label %.lr.ph185.split.us.preheader, label %.lr.ph196.split.us

.lr.ph185.split.us.preheader:                     ; preds = %._crit_edge193.us
  br label %.lr.ph185.split.us

.lr.ph185.split.us:                               ; preds = %._crit_edge182.us, %.lr.ph185.split.us.preheader
  %indvars.iv236.us = phi i64 [ 0, %.lr.ph185.split.us.preheader ], [ %indvars.iv.next237.us, %._crit_edge182.us ]
  br label %.lr.ph185.split.us.new

.lr.ph185.split.us.new:                           ; preds = %.lr.ph185.split.us.new..lr.ph185.split.us.new_crit_edge, %.lr.ph185.split.us
  %indvars.iv234.us.in = phi i64 [ %indvars.iv234.us.1, %.lr.ph185.split.us.new..lr.ph185.split.us.new_crit_edge ], [ 4096, %.lr.ph185.split.us ]
  %.0163178.us = phi float [ %138, %.lr.ph185.split.us.new..lr.ph185.split.us.new_crit_edge ], [ 0.000000e+00, %.lr.ph185.split.us ]
  %.0164177.us = phi float [ %127, %.lr.ph185.split.us.new..lr.ph185.split.us.new_crit_edge ], [ 0.000000e+00, %.lr.ph185.split.us ]
  %.1166176.us = phi float [ %134, %.lr.ph185.split.us.new..lr.ph185.split.us.new_crit_edge ], [ 0.000000e+00, %.lr.ph185.split.us ]
  %.1168175.us = phi float [ %124, %.lr.ph185.split.us.new..lr.ph185.split.us.new_crit_edge ], [ 0.000000e+00, %.lr.ph185.split.us ]
  %indvars.iv234.us = add nsw i64 %indvars.iv234.us.in, -1
  %118 = fmul float %61, %.0163178.us
  %119 = fmul float %.0164177.us, %62
  %120 = fadd float %119, %118
  %121 = fmul float %exp2, %.1166176.us
  %122 = fadd float %121, %120
  %123 = fmul float %.1168175.us, %35
  %124 = fadd float %123, %122
  %125 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv234.us, i64 %indvars.iv236.us
  store float %124, float* %125, align 4
  %126 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv234.us, i64 %indvars.iv236.us
  %127 = load float, float* %126, align 4
  %indvars.iv234.us.1 = add nsw i64 %indvars.iv234.us.in, -2
  %128 = fmul float %61, %127
  %129 = fmul float %.0163178.us, %62
  %130 = fadd float %129, %128
  %131 = fmul float %exp2, %124
  %132 = fadd float %131, %130
  %133 = fmul float %.1166176.us, %35
  %134 = fadd float %133, %132
  %135 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv234.us.1, i64 %indvars.iv236.us
  store float %134, float* %135, align 4
  %136 = icmp sgt i64 %indvars.iv234.us.in, 2
  br i1 %136, label %.lr.ph185.split.us.new..lr.ph185.split.us.new_crit_edge, label %._crit_edge182.us

.lr.ph185.split.us.new..lr.ph185.split.us.new_crit_edge: ; preds = %.lr.ph185.split.us.new
  %137 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv234.us.1, i64 %indvars.iv236.us
  %138 = load float, float* %137, align 4
  br label %.lr.ph185.split.us.new

._crit_edge182.us:                                ; preds = %.lr.ph185.split.us.new
  %indvars.iv.next237.us = add nuw nsw i64 %indvars.iv236.us, 1
  %exitcond239.us = icmp eq i64 %indvars.iv.next237.us, 2160
  br i1 %exitcond239.us, label %.lr.ph172.split.us.preheader, label %.lr.ph185.split.us

.lr.ph172.split.us.preheader:                     ; preds = %._crit_edge182.us
  br label %.lr.ph172.split.us

.lr.ph172.split.us:                               ; preds = %.lr.ph172.split.us.preheader, %._crit_edge.us
  %indvars.iv230.us = phi i64 [ %indvars.iv.next231.us, %._crit_edge.us ], [ 0, %.lr.ph172.split.us.preheader ]
  br label %.lr.ph172.split.us.new

.lr.ph172.split.us.new:                           ; preds = %.lr.ph172.split.us.new, %.lr.ph172.split.us
  %indvars.iv.us = phi i64 [ 0, %.lr.ph172.split.us ], [ %indvars.iv.next.us.1, %.lr.ph172.split.us.new ]
  %139 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv230.us, i64 %indvars.iv.us
  %140 = load float, float* %139, align 4
  %141 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv230.us, i64 %indvars.iv.us
  %142 = load float, float* %141, align 4
  %143 = fadd float %140, %142
  %144 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv230.us, i64 %indvars.iv.us
  store float %143, float* %144, align 4
  %indvars.iv.next.us = or i64 %indvars.iv.us, 1
  %145 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv230.us, i64 %indvars.iv.next.us
  %146 = load float, float* %145, align 4
  %147 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv230.us, i64 %indvars.iv.next.us
  %148 = load float, float* %147, align 4
  %149 = fadd float %146, %148
  %150 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv230.us, i64 %indvars.iv.next.us
  store float %149, float* %150, align 4
  %indvars.iv.next.us.1 = add nuw nsw i64 %indvars.iv.us, 2
  %exitcond.us.1 = icmp eq i64 %indvars.iv.next.us.1, 2160
  br i1 %exitcond.us.1, label %._crit_edge.us, label %.lr.ph172.split.us.new

._crit_edge.us:                                   ; preds = %.lr.ph172.split.us.new
  %indvars.iv.next231.us = add nuw nsw i64 %indvars.iv230.us, 1
  %exitcond233.us = icmp eq i64 %indvars.iv.next231.us, 4096
  br i1 %exitcond233.us, label %._crit_edge173, label %.lr.ph172.split.us

._crit_edge173:                                   ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [2160 x float]* nocapture readonly) unnamed_addr #0 {
.lr.ph16:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.lr.ph16.split.us

.lr.ph16.split.us:                                ; preds = %._crit_edge.us, %.lr.ph16
  %indvars.iv = phi i64 [ 0, %.lr.ph16 ], [ %indvars.iv.next, %._crit_edge.us ]
  %7 = mul nuw nsw i64 %indvars.iv, 2160
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge, %.lr.ph16.split.us
  %indvars.iv.us = phi i64 [ 0, %.lr.ph16.split.us ], [ %indvars.iv.next.us, %._crit_edge ]
  %8 = add nuw nsw i64 %indvars.iv.us, %7
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge

; <label>:12:                                     ; preds = %._crit_edge21
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge21, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv, i64 %indvars.iv.us
  %16 = load float, float* %15, align 4
  %17 = fpext float %16 to double
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %17) #7
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 2160
  br i1 %exitcond.us, label %._crit_edge.us, label %._crit_edge21

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 4096
  br i1 %exitcond, label %._crit_edge17, label %.lr.ph16.split.us

._crit_edge17:                                    ; preds = %._crit_edge.us
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #6
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
