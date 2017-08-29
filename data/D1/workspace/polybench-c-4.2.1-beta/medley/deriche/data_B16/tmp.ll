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
  call void @init_array(i32 4096, i32 2160, float* nonnull %3, [2160 x float]* %8)
  call void (...) @polybench_timer_start() #5
  %10 = load float, float* %3, align 4
  %11 = bitcast i8* %6 to [2160 x float]*
  %12 = bitcast i8* %7 to [2160 x float]*
  call void @kernel_deriche(i32 4096, i32 2160, float %10, [2160 x float]* %8, [2160 x float]* %9, [2160 x float]* %11, [2160 x float]* %12)
  call void (...) @polybench_timer_stop() #5
  call void (...) @polybench_timer_print() #5
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %18

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %18

; <label>:17:                                     ; preds = %14
  call void @print_array(i32 4096, i32 2160, [2160 x float]* %9)
  br label %18

; <label>:18:                                     ; preds = %14, %17, %2
  call void @free(i8* %4) #5
  call void @free(i8* %5) #5
  call void @free(i8* %6) #5
  call void @free(i8* %7) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, float* nocapture, [2160 x float]* nocapture) #2 {
  store float 2.500000e-01, float* %2, align 4
  br i1 true, label %.preheader.lr.ph, label %._crit_edge4

.preheader.lr.ph:                                 ; preds = %4
  br i1 true, label %.preheader.lr.ph.split.us, label %._crit_edge4

.preheader.lr.ph.split.us:                        ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph.split.us
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %._crit_edge.us ], [ 0, %.preheader.lr.ph.split.us ]
  %5 = mul nuw nsw i64 %indvars.iv7, 313
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
  %7 = add nsw <4 x i64> %6, %broadcast.splat
  %8 = trunc <4 x i64> %7 to <4 x i32>
  %9 = srem <4 x i32> %8, <i32 65536, i32 65536, i32 65536, i32 65536>
  %10 = sitofp <4 x i32> %9 to <4 x float>
  %11 = fdiv <4 x float> %10, <float 6.553500e+04, float 6.553500e+04, float 6.553500e+04, float 6.553500e+04>
  %12 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv7, i64 %index
  %13 = bitcast float* %12 to <4 x float>*
  store <4 x float> %11, <4 x float>* %13, align 4
  %index.next = add i64 %index, 4
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
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next8, 4096
  br i1 %exitcond10, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %.preheader.lr.ph, %4
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_deriche(i32, i32, float, [2160 x float]*, [2160 x float]*, [2160 x float]*, [2160 x float]*) #0 {
  %8 = alloca [2160 x float]*, align 8
  %9 = alloca [2160 x float]*, align 8
  %10 = alloca [2160 x float]*, align 8
  %11 = alloca [2160 x float]*, align 8
  %12 = alloca i32, align 4
  %13 = alloca i32, align 4
  %14 = alloca float, align 4
  %15 = alloca float, align 4
  %16 = alloca float, align 4
  %17 = alloca float, align 4
  store [2160 x float]* %3, [2160 x float]** %8, align 8
  store [2160 x float]* %4, [2160 x float]** %9, align 8
  store [2160 x float]* %5, [2160 x float]** %10, align 8
  store [2160 x float]* %6, [2160 x float]** %11, align 8
  %18 = fsub float -0.000000e+00, %2
  %19 = tail call float @expf(float %18) #5
  %20 = fsub float 1.000000e+00, %19
  %21 = tail call float @expf(float %18) #5
  %22 = fsub float 1.000000e+00, %21
  %23 = fmul float %20, %22
  %24 = fmul float %2, 2.000000e+00
  %25 = tail call float @expf(float %18) #5
  %26 = fmul float %24, %25
  %27 = fadd float %26, 1.000000e+00
  %28 = tail call float @expf(float %24) #5
  %29 = fsub float %27, %28
  %30 = fdiv float %23, %29
  %31 = tail call float @expf(float %18) #5
  %32 = fmul float %30, %31
  %33 = fadd float %2, -1.000000e+00
  %34 = fmul float %33, %32
  %35 = tail call float @expf(float %18) #5
  %36 = fmul float %30, %35
  %37 = fadd float %2, 1.000000e+00
  %38 = fmul float %37, %36
  %39 = fmul float %2, -2.000000e+00
  %40 = tail call float @expf(float %39) #5
  %41 = fmul float %30, %40
  %42 = fsub float -0.000000e+00, %41
  %exp2 = tail call float @llvm.exp2.f32(float %18)
  %43 = tail call float @expf(float %39) #5
  %44 = fsub float -0.000000e+00, %43
  store i32 0, i32* %12, align 4
  br i1 true, label %.lr.ph73, label %.preheader15.thread111

.preheader15.thread111:                           ; preds = %7
  br label %.preheader14.thread

.lr.ph73:                                         ; preds = %7
  %45 = bitcast float* %14 to i32*
  br i1 true, label %.lr.ph73.split.us.preheader, label %.lr.ph73.split.preheader

.lr.ph73.split.us.preheader:                      ; preds = %.lr.ph73
  br label %.lr.ph73.split.us

.lr.ph73.split.preheader:                         ; preds = %.lr.ph73
  br i1 undef, label %.lr.ph73.split.prol.loopexit, label %.lr.ph73.split.prol.preheader

.lr.ph73.split.prol.preheader:                    ; preds = %.lr.ph73.split.preheader
  br label %.lr.ph73.split.prol

.lr.ph73.split.prol:                              ; preds = %.lr.ph73.split.prol.preheader, %.lr.ph73.split.prol
  br i1 true, label %.lr.ph73.split.prol.loopexit.loopexit, label %.lr.ph73.split.prol, !llvm.loop !6

.lr.ph73.split.prol.loopexit.loopexit:            ; preds = %.lr.ph73.split.prol
  br label %.lr.ph73.split.prol.loopexit

.lr.ph73.split.prol.loopexit:                     ; preds = %.lr.ph73.split.prol.loopexit.loopexit, %.lr.ph73.split.preheader
  br i1 undef, label %.preheader15.thread, label %.lr.ph73.split.preheader215

.lr.ph73.split.preheader215:                      ; preds = %.lr.ph73.split.prol.loopexit
  br i1 undef, label %.lr.ph73.split.prol.preheader268, label %.lr.ph73.split.prol.loopexit269

.lr.ph73.split.prol.preheader268:                 ; preds = %.lr.ph73.split.preheader215
  br label %.lr.ph73.split.prol272

.lr.ph73.split.prol272:                           ; preds = %.lr.ph73.split.prol272, %.lr.ph73.split.prol.preheader268
  br i1 false, label %.lr.ph73.split.prol272, label %.lr.ph73.split.prol.loopexit269.unr-lcssa, !llvm.loop !8

.lr.ph73.split.prol.loopexit269.unr-lcssa:        ; preds = %.lr.ph73.split.prol272
  br label %.lr.ph73.split.prol.loopexit269

.lr.ph73.split.prol.loopexit269:                  ; preds = %.lr.ph73.split.prol.loopexit269.unr-lcssa, %.lr.ph73.split.preheader215
  br i1 undef, label %.preheader15.loopexit129, label %.lr.ph73.split.preheader215.new

.lr.ph73.split.preheader215.new:                  ; preds = %.lr.ph73.split.prol.loopexit269
  br label %.lr.ph73.split

.preheader15.thread:                              ; preds = %.lr.ph73.split.prol.loopexit
  br label %.lr.ph63

.lr.ph73.split.us:                                ; preds = %.lr.ph73.split.us.preheader, %._crit_edge67.us
  %storemerge71.us = phi i32 [ %83, %._crit_edge67.us ], [ 0, %.lr.ph73.split.us.preheader ]
  %46 = phi [2160 x float]* [ %76, %._crit_edge67.us ], [ %5, %.lr.ph73.split.us.preheader ]
  %47 = phi [2160 x float]* [ %68, %._crit_edge67.us ], [ %3, %.lr.ph73.split.us.preheader ]
  store float 0.000000e+00, float* %14, align 4
  store i32 0, i32* %13, align 4
  br label %48

; <label>:48:                                     ; preds = %48, %.lr.ph73.split.us
  %49 = phi i32 [ 0, %.lr.ph73.split.us ], [ %80, %48 ]
  %50 = phi [2160 x float]* [ %46, %.lr.ph73.split.us ], [ %76, %48 ]
  %51 = phi i32 [ %storemerge71.us, %.lr.ph73.split.us ], [ %69, %48 ]
  %52 = phi [2160 x float]* [ %47, %.lr.ph73.split.us ], [ %68, %48 ]
  %53 = phi float [ 0.000000e+00, %.lr.ph73.split.us ], [ %74, %48 ]
  %54 = phi float [ 0.000000e+00, %.lr.ph73.split.us ], [ %81, %48 ]
  %55 = phi float [ 0.000000e+00, %.lr.ph73.split.us ], [ %75, %48 ]
  %56 = sext i32 %51 to i64
  %57 = sext i32 %49 to i64
  %58 = getelementptr inbounds [2160 x float], [2160 x float]* %52, i64 %56, i64 %57
  %59 = load float, float* %58, align 4
  %60 = fmul float %30, %59
  %61 = fmul float %34, %53
  %62 = fadd float %61, %60
  %63 = fmul float %exp2, %54
  %64 = fadd float %63, %62
  %65 = fmul float %55, %44
  %66 = fadd float %65, %64
  %67 = getelementptr inbounds [2160 x float], [2160 x float]* %50, i64 %56, i64 %57
  store float %66, float* %67, align 4
  %68 = load [2160 x float]*, [2160 x float]** %8, align 8
  %69 = load i32, i32* %12, align 4
  %70 = sext i32 %69 to i64
  %71 = load i32, i32* %13, align 4
  %72 = sext i32 %71 to i64
  %73 = getelementptr inbounds [2160 x float], [2160 x float]* %68, i64 %70, i64 %72
  %74 = load float, float* %73, align 4
  %75 = load float, float* %14, align 4
  %76 = load [2160 x float]*, [2160 x float]** %10, align 8
  %77 = getelementptr inbounds [2160 x float], [2160 x float]* %76, i64 %70, i64 %72
  %78 = bitcast float* %77 to i32*
  %79 = load i32, i32* %78, align 4
  store i32 %79, i32* %45, align 4
  %80 = add nsw i32 %71, 1
  %81 = bitcast i32 %79 to float
  store i32 %80, i32* %13, align 4
  %82 = icmp slt i32 %80, 2160
  br i1 %82, label %48, label %._crit_edge67.us

._crit_edge67.us:                                 ; preds = %48
  %83 = add nsw i32 %69, 1
  store i32 %83, i32* %12, align 4
  %84 = icmp slt i32 %83, 4096
  br i1 %84, label %.lr.ph73.split.us, label %.preheader15.loopexit

.preheader15.loopexit129.unr-lcssa:               ; preds = %.lr.ph73.split
  br label %.preheader15.loopexit129

.preheader15.loopexit129:                         ; preds = %.lr.ph73.split.prol.loopexit269, %.preheader15.loopexit129.unr-lcssa
  br label %.preheader15

.preheader15.loopexit:                            ; preds = %._crit_edge67.us
  br label %.preheader15

.preheader15:                                     ; preds = %.preheader15.loopexit, %.preheader15.loopexit129
  %.lcssa33 = phi [2160 x float]* [ %5, %.preheader15.loopexit129 ], [ %76, %.preheader15.loopexit ]
  store i32 0, i32* %12, align 4
  br i1 true, label %.lr.ph63, label %.preheader14.thread

.lr.ph63:                                         ; preds = %.preheader15.thread, %.preheader15
  %.lcssa33109 = phi [2160 x float]* [ %5, %.preheader15.thread ], [ %.lcssa33, %.preheader15 ]
  %85 = bitcast float* %15 to i32*
  %86 = bitcast float* %17 to i32*
  br i1 true, label %.lr.ph63.split.us.preheader, label %.lr.ph63.split.preheader

.lr.ph63.split.us.preheader:                      ; preds = %.lr.ph63
  br label %.lr.ph63.split.us

.lr.ph63.split.preheader:                         ; preds = %.lr.ph63
  br i1 undef, label %.lr.ph63.split.prol.loopexit, label %.lr.ph63.split.prol.preheader

.lr.ph63.split.prol.preheader:                    ; preds = %.lr.ph63.split.preheader
  br label %.lr.ph63.split.prol

.lr.ph63.split.prol:                              ; preds = %.lr.ph63.split.prol.preheader, %.lr.ph63.split.prol
  br i1 true, label %.lr.ph63.split.prol.loopexit.loopexit, label %.lr.ph63.split.prol, !llvm.loop !9

.lr.ph63.split.prol.loopexit.loopexit:            ; preds = %.lr.ph63.split.prol
  br label %.lr.ph63.split.prol.loopexit

.lr.ph63.split.prol.loopexit:                     ; preds = %.lr.ph63.split.prol.loopexit.loopexit, %.lr.ph63.split.preheader
  br i1 undef, label %.preheader14.thread113, label %.lr.ph63.split.preheader214

.lr.ph63.split.preheader214:                      ; preds = %.lr.ph63.split.prol.loopexit
  br i1 undef, label %.lr.ph63.split.prol.preheader261, label %.lr.ph63.split.prol.loopexit262

.lr.ph63.split.prol.preheader261:                 ; preds = %.lr.ph63.split.preheader214
  br label %.lr.ph63.split.prol265

.lr.ph63.split.prol265:                           ; preds = %.lr.ph63.split.prol265, %.lr.ph63.split.prol.preheader261
  br i1 false, label %.lr.ph63.split.prol265, label %.lr.ph63.split.prol.loopexit262.unr-lcssa, !llvm.loop !10

.lr.ph63.split.prol.loopexit262.unr-lcssa:        ; preds = %.lr.ph63.split.prol265
  br label %.lr.ph63.split.prol.loopexit262

.lr.ph63.split.prol.loopexit262:                  ; preds = %.lr.ph63.split.prol.loopexit262.unr-lcssa, %.lr.ph63.split.preheader214
  br i1 undef, label %.preheader14.loopexit127, label %.lr.ph63.split.preheader214.new

.lr.ph63.split.preheader214.new:                  ; preds = %.lr.ph63.split.prol.loopexit262
  br label %.lr.ph63.split

.preheader14.thread113:                           ; preds = %.lr.ph63.split.prol.loopexit
  br label %.preheader13.lr.ph

.lr.ph63.split.us:                                ; preds = %.lr.ph63.split.us.preheader, %._crit_edge59.us
  %storemerge162.us = phi i32 [ %124, %._crit_edge59.us ], [ 0, %.lr.ph63.split.us.preheader ]
  %87 = phi [2160 x float]* [ %116, %._crit_edge59.us ], [ %6, %.lr.ph63.split.us.preheader ]
  store float 0.000000e+00, float* %17, align 4
  store float 0.000000e+00, float* %15, align 4
  store i32 2159, i32* %13, align 4
  br label %88

; <label>:88:                                     ; preds = %88, %.lr.ph63.split.us
  %89 = phi i32 [ 2159, %.lr.ph63.split.us ], [ %120, %88 ]
  %90 = phi [2160 x float]* [ %87, %.lr.ph63.split.us ], [ %116, %88 ]
  %91 = phi i32 [ %storemerge162.us, %.lr.ph63.split.us ], [ %108, %88 ]
  %92 = phi float [ 0.000000e+00, %.lr.ph63.split.us ], [ %121, %88 ]
  %93 = phi float [ 0.000000e+00, %.lr.ph63.split.us ], [ %106, %88 ]
  %94 = phi float [ 0.000000e+00, %.lr.ph63.split.us ], [ %122, %88 ]
  %95 = phi float [ 0.000000e+00, %.lr.ph63.split.us ], [ %115, %88 ]
  %96 = fmul float %38, %92
  %97 = fmul float %93, %42
  %98 = fadd float %97, %96
  %99 = fmul float %exp2, %94
  %100 = fadd float %99, %98
  %101 = fmul float %95, %44
  %102 = fadd float %101, %100
  %103 = sext i32 %91 to i64
  %104 = sext i32 %89 to i64
  %105 = getelementptr inbounds [2160 x float], [2160 x float]* %90, i64 %103, i64 %104
  store float %102, float* %105, align 4
  %106 = load float, float* %15, align 4
  %107 = load [2160 x float]*, [2160 x float]** %8, align 8
  %108 = load i32, i32* %12, align 4
  %109 = sext i32 %108 to i64
  %110 = load i32, i32* %13, align 4
  %111 = sext i32 %110 to i64
  %112 = getelementptr inbounds [2160 x float], [2160 x float]* %107, i64 %109, i64 %111
  %113 = bitcast float* %112 to i32*
  %114 = load i32, i32* %113, align 4
  store i32 %114, i32* %85, align 4
  %115 = load float, float* %17, align 4
  %116 = load [2160 x float]*, [2160 x float]** %11, align 8
  %117 = getelementptr inbounds [2160 x float], [2160 x float]* %116, i64 %109, i64 %111
  %118 = bitcast float* %117 to i32*
  %119 = load i32, i32* %118, align 4
  store i32 %119, i32* %86, align 4
  %120 = add nsw i32 %110, -1
  %121 = bitcast i32 %114 to float
  %122 = bitcast i32 %119 to float
  store i32 %120, i32* %13, align 4
  %123 = icmp sgt i32 %110, 0
  br i1 %123, label %88, label %._crit_edge59.us

._crit_edge59.us:                                 ; preds = %88
  %124 = add nsw i32 %108, 1
  store i32 %124, i32* %12, align 4
  %125 = icmp slt i32 %124, 4096
  br i1 %125, label %.lr.ph63.split.us, label %.preheader14.loopexit

.lr.ph73.split:                                   ; preds = %.lr.ph73.split, %.lr.ph73.split.preheader215.new
  br i1 true, label %.preheader15.loopexit129.unr-lcssa, label %.lr.ph73.split

.preheader14.thread:                              ; preds = %.preheader15.thread111, %.preheader15
  br label %.preheader12

.preheader14.loopexit127.unr-lcssa:               ; preds = %.lr.ph63.split
  br label %.preheader14.loopexit127

.preheader14.loopexit127:                         ; preds = %.lr.ph63.split.prol.loopexit262, %.preheader14.loopexit127.unr-lcssa
  br label %.preheader14

.preheader14.loopexit:                            ; preds = %._crit_edge59.us
  br label %.preheader14

.preheader14:                                     ; preds = %.preheader14.loopexit, %.preheader14.loopexit127
  %.lcssa29 = phi [2160 x float]* [ %6, %.preheader14.loopexit127 ], [ %116, %.preheader14.loopexit ]
  store i32 0, i32* %12, align 4
  store i32 0, i32* %13, align 4
  br i1 true, label %.preheader13.lr.ph, label %.preheader12

.preheader13.lr.ph:                               ; preds = %.preheader14.thread113, %.preheader14
  %.lcssa29115 = phi [2160 x float]* [ %6, %.preheader14.thread113 ], [ %.lcssa29, %.preheader14 ]
  br i1 true, label %.preheader13.us.preheader, label %.preheader13.preheader

.preheader13.us.preheader:                        ; preds = %.preheader13.lr.ph
  br label %.preheader13.us

.preheader13.preheader:                           ; preds = %.preheader13.lr.ph
  br i1 undef, label %.preheader13.prol.preheader, label %.preheader13.prol.loopexit

.preheader13.prol.preheader:                      ; preds = %.preheader13.preheader
  br label %.preheader13.prol

.preheader13.prol:                                ; preds = %.preheader13.prol, %.preheader13.prol.preheader
  br i1 false, label %.preheader13.prol, label %.preheader13.prol.loopexit.unr-lcssa, !llvm.loop !11

.preheader13.prol.loopexit.unr-lcssa:             ; preds = %.preheader13.prol
  br label %.preheader13.prol.loopexit

.preheader13.prol.loopexit:                       ; preds = %.preheader13.prol.loopexit.unr-lcssa, %.preheader13.preheader
  br i1 undef, label %.preheader12.loopexit125, label %.preheader13.preheader.new

.preheader13.preheader.new:                       ; preds = %.preheader13.prol.loopexit
  br label %.preheader13

.preheader13.us:                                  ; preds = %.preheader13.us.preheader, %._crit_edge55.us
  %126 = load i32, i32* %12, align 4
  br label %127

; <label>:127:                                    ; preds = %127, %.preheader13.us
  %128 = phi i32 [ %126, %.preheader13.us ], [ %141, %127 ]
  %129 = phi i32 [ 0, %.preheader13.us ], [ %139, %127 ]
  %130 = sext i32 %128 to i64
  %131 = sext i32 %129 to i64
  %132 = getelementptr inbounds [2160 x float], [2160 x float]* %.lcssa33109, i64 %130, i64 %131
  %133 = load float, float* %132, align 4
  %134 = getelementptr inbounds [2160 x float], [2160 x float]* %.lcssa29115, i64 %130, i64 %131
  %135 = load float, float* %134, align 4
  %136 = fadd float %133, %135
  %137 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %130, i64 %131
  store float %136, float* %137, align 4
  %138 = load i32, i32* %13, align 4
  %139 = add nsw i32 %138, 1
  store i32 %139, i32* %13, align 4
  %140 = icmp slt i32 %139, 2160
  %141 = load i32, i32* %12, align 4
  br i1 %140, label %127, label %._crit_edge55.us

._crit_edge55.us:                                 ; preds = %127
  %142 = add nsw i32 %141, 1
  store i32 %142, i32* %12, align 4
  %143 = icmp slt i32 %142, 4096
  store i32 0, i32* %13, align 4
  br i1 %143, label %.preheader13.us, label %.preheader12.loopexit

.lr.ph63.split:                                   ; preds = %.lr.ph63.split, %.lr.ph63.split.preheader214.new
  br i1 true, label %.preheader14.loopexit127.unr-lcssa, label %.lr.ph63.split

.preheader13:                                     ; preds = %.preheader13, %.preheader13.preheader.new
  br i1 false, label %.preheader13, label %.preheader12.loopexit125.unr-lcssa

.preheader12.loopexit125.unr-lcssa:               ; preds = %.preheader13
  br label %.preheader12.loopexit125

.preheader12.loopexit125:                         ; preds = %.preheader13.prol.loopexit, %.preheader12.loopexit125.unr-lcssa
  br label %.preheader12

.preheader12.loopexit:                            ; preds = %._crit_edge55.us
  br label %.preheader12

.preheader12:                                     ; preds = %.preheader12.loopexit, %.preheader12.loopexit125, %.preheader14.thread, %.preheader14
  %.lcssa29112 = phi [2160 x float]* [ %.lcssa29, %.preheader14 ], [ %6, %.preheader14.thread ], [ %.lcssa29115, %.preheader12.loopexit125 ], [ %.lcssa29115, %.preheader12.loopexit ]
  %.lcssa33110 = phi [2160 x float]* [ %.lcssa33109, %.preheader14 ], [ undef, %.preheader14.thread ], [ %.lcssa33109, %.preheader12.loopexit125 ], [ %.lcssa33109, %.preheader12.loopexit ]
  br i1 true, label %.lr.ph51, label %.preheader11.thread119

.preheader11.thread119:                           ; preds = %.preheader12
  br label %.preheader10

.lr.ph51:                                         ; preds = %.preheader12
  %144 = bitcast float* %14 to i32*
  br i1 true, label %.lr.ph51.split.us.preheader, label %.lr.ph51.split.preheader

.lr.ph51.split.us.preheader:                      ; preds = %.lr.ph51
  br label %.lr.ph51.split.us

.lr.ph51.split.preheader:                         ; preds = %.lr.ph51
  br i1 undef, label %.lr.ph51.split.prol.loopexit, label %.lr.ph51.split.prol.preheader

.lr.ph51.split.prol.preheader:                    ; preds = %.lr.ph51.split.preheader
  br label %.lr.ph51.split.prol

.lr.ph51.split.prol:                              ; preds = %.lr.ph51.split.prol.preheader, %.lr.ph51.split.prol
  br i1 true, label %.lr.ph51.split.prol.loopexit.loopexit, label %.lr.ph51.split.prol, !llvm.loop !12

.lr.ph51.split.prol.loopexit.loopexit:            ; preds = %.lr.ph51.split.prol
  br label %.lr.ph51.split.prol.loopexit

.lr.ph51.split.prol.loopexit:                     ; preds = %.lr.ph51.split.prol.loopexit.loopexit, %.lr.ph51.split.preheader
  br i1 undef, label %.preheader11.thread, label %.lr.ph51.split.preheader213

.lr.ph51.split.preheader213:                      ; preds = %.lr.ph51.split.prol.loopexit
  br i1 undef, label %.lr.ph51.split.prol.preheader250, label %.lr.ph51.split.prol.loopexit251

.lr.ph51.split.prol.preheader250:                 ; preds = %.lr.ph51.split.preheader213
  br label %.lr.ph51.split.prol254

.lr.ph51.split.prol254:                           ; preds = %.lr.ph51.split.prol254, %.lr.ph51.split.prol.preheader250
  br i1 false, label %.lr.ph51.split.prol254, label %.lr.ph51.split.prol.loopexit251.unr-lcssa, !llvm.loop !13

.lr.ph51.split.prol.loopexit251.unr-lcssa:        ; preds = %.lr.ph51.split.prol254
  br label %.lr.ph51.split.prol.loopexit251

.lr.ph51.split.prol.loopexit251:                  ; preds = %.lr.ph51.split.prol.loopexit251.unr-lcssa, %.lr.ph51.split.preheader213
  br i1 undef, label %.preheader11.loopexit124, label %.lr.ph51.split.preheader213.new

.lr.ph51.split.preheader213.new:                  ; preds = %.lr.ph51.split.prol.loopexit251
  br label %.lr.ph51.split

.preheader11.thread:                              ; preds = %.lr.ph51.split.prol.loopexit
  br label %.lr.ph42

.lr.ph51.split.us:                                ; preds = %.lr.ph51.split.us.preheader, %._crit_edge47.us
  %145 = phi i32 [ %183, %._crit_edge47.us ], [ 0, %.lr.ph51.split.us.preheader ]
  %146 = phi [2160 x float]* [ %176, %._crit_edge47.us ], [ %.lcssa33110, %.lr.ph51.split.us.preheader ]
  %147 = phi [2160 x float]* [ %168, %._crit_edge47.us ], [ %4, %.lr.ph51.split.us.preheader ]
  store float 0.000000e+00, float* %14, align 4
  store i32 0, i32* %12, align 4
  br label %148

; <label>:148:                                    ; preds = %148, %.lr.ph51.split.us
  %149 = phi i32 [ 0, %.lr.ph51.split.us ], [ %180, %148 ]
  %150 = phi [2160 x float]* [ %146, %.lr.ph51.split.us ], [ %176, %148 ]
  %151 = phi [2160 x float]* [ %147, %.lr.ph51.split.us ], [ %168, %148 ]
  %152 = phi i32 [ %145, %.lr.ph51.split.us ], [ %171, %148 ]
  %153 = phi float [ 0.000000e+00, %.lr.ph51.split.us ], [ %174, %148 ]
  %154 = phi float [ 0.000000e+00, %.lr.ph51.split.us ], [ %181, %148 ]
  %155 = phi float [ 0.000000e+00, %.lr.ph51.split.us ], [ %175, %148 ]
  %156 = sext i32 %149 to i64
  %157 = sext i32 %152 to i64
  %158 = getelementptr inbounds [2160 x float], [2160 x float]* %151, i64 %156, i64 %157
  %159 = load float, float* %158, align 4
  %160 = fmul float %30, %159
  %161 = fmul float %34, %153
  %162 = fadd float %161, %160
  %163 = fmul float %exp2, %154
  %164 = fadd float %163, %162
  %165 = fmul float %155, %44
  %166 = fadd float %165, %164
  %167 = getelementptr inbounds [2160 x float], [2160 x float]* %150, i64 %156, i64 %157
  store float %166, float* %167, align 4
  %168 = load [2160 x float]*, [2160 x float]** %9, align 8
  %169 = load i32, i32* %12, align 4
  %170 = sext i32 %169 to i64
  %171 = load i32, i32* %13, align 4
  %172 = sext i32 %171 to i64
  %173 = getelementptr inbounds [2160 x float], [2160 x float]* %168, i64 %170, i64 %172
  %174 = load float, float* %173, align 4
  %175 = load float, float* %14, align 4
  %176 = load [2160 x float]*, [2160 x float]** %10, align 8
  %177 = getelementptr inbounds [2160 x float], [2160 x float]* %176, i64 %170, i64 %172
  %178 = bitcast float* %177 to i32*
  %179 = load i32, i32* %178, align 4
  store i32 %179, i32* %144, align 4
  %180 = add nsw i32 %169, 1
  %181 = bitcast i32 %179 to float
  store i32 %180, i32* %12, align 4
  %182 = icmp slt i32 %180, 4096
  br i1 %182, label %148, label %._crit_edge47.us

._crit_edge47.us:                                 ; preds = %148
  %183 = add nsw i32 %171, 1
  store i32 %183, i32* %13, align 4
  %184 = icmp slt i32 %183, 2160
  br i1 %184, label %.lr.ph51.split.us, label %.preheader11.loopexit

.preheader11.loopexit124.unr-lcssa:               ; preds = %.lr.ph51.split
  br label %.preheader11.loopexit124

.preheader11.loopexit124:                         ; preds = %.lr.ph51.split.prol.loopexit251, %.preheader11.loopexit124.unr-lcssa
  br label %.preheader11

.preheader11.loopexit:                            ; preds = %._crit_edge47.us
  br label %.preheader11

.preheader11:                                     ; preds = %.preheader11.loopexit, %.preheader11.loopexit124
  %.lcssa25 = phi [2160 x float]* [ %4, %.preheader11.loopexit124 ], [ %168, %.preheader11.loopexit ]
  %.lcssa24 = phi [2160 x float]* [ %.lcssa33110, %.preheader11.loopexit124 ], [ %176, %.preheader11.loopexit ]
  store i32 0, i32* %13, align 4
  br i1 true, label %.lr.ph42, label %.preheader10

.lr.ph42:                                         ; preds = %.preheader11.thread, %.preheader11
  %.lcssa24118 = phi [2160 x float]* [ %.lcssa33110, %.preheader11.thread ], [ %.lcssa24, %.preheader11 ]
  %.lcssa25116 = phi [2160 x float]* [ %4, %.preheader11.thread ], [ %.lcssa25, %.preheader11 ]
  %185 = bitcast float* %16 to i32*
  %186 = bitcast float* %17 to i32*
  br i1 true, label %.lr.ph42.split.us.preheader, label %.lr.ph42.split.preheader

.lr.ph42.split.us.preheader:                      ; preds = %.lr.ph42
  br label %.lr.ph42.split.us

.lr.ph42.split.preheader:                         ; preds = %.lr.ph42
  br i1 undef, label %.lr.ph42.split.prol.loopexit, label %.lr.ph42.split.prol.preheader

.lr.ph42.split.prol.preheader:                    ; preds = %.lr.ph42.split.preheader
  br label %.lr.ph42.split.prol

.lr.ph42.split.prol:                              ; preds = %.lr.ph42.split.prol.preheader, %.lr.ph42.split.prol
  br i1 true, label %.lr.ph42.split.prol.loopexit.loopexit, label %.lr.ph42.split.prol, !llvm.loop !14

.lr.ph42.split.prol.loopexit.loopexit:            ; preds = %.lr.ph42.split.prol
  br label %.lr.ph42.split.prol.loopexit

.lr.ph42.split.prol.loopexit:                     ; preds = %.lr.ph42.split.prol.loopexit.loopexit, %.lr.ph42.split.preheader
  br i1 undef, label %.preheader10, label %.lr.ph42.split.preheader212

.lr.ph42.split.preheader212:                      ; preds = %.lr.ph42.split.prol.loopexit
  br i1 undef, label %.lr.ph42.split.prol.preheader243, label %.lr.ph42.split.prol.loopexit244

.lr.ph42.split.prol.preheader243:                 ; preds = %.lr.ph42.split.preheader212
  br label %.lr.ph42.split.prol247

.lr.ph42.split.prol247:                           ; preds = %.lr.ph42.split.prol247, %.lr.ph42.split.prol.preheader243
  br i1 false, label %.lr.ph42.split.prol247, label %.lr.ph42.split.prol.loopexit244.unr-lcssa, !llvm.loop !15

.lr.ph42.split.prol.loopexit244.unr-lcssa:        ; preds = %.lr.ph42.split.prol247
  br label %.lr.ph42.split.prol.loopexit244

.lr.ph42.split.prol.loopexit244:                  ; preds = %.lr.ph42.split.prol.loopexit244.unr-lcssa, %.lr.ph42.split.preheader212
  br i1 undef, label %.preheader10.loopexit122, label %.lr.ph42.split.preheader212.new

.lr.ph42.split.preheader212.new:                  ; preds = %.lr.ph42.split.prol.loopexit244
  br label %.lr.ph42.split

.lr.ph42.split.us:                                ; preds = %.lr.ph42.split.us.preheader, %._crit_edge37.us
  %storemerge341.us = phi i32 [ %224, %._crit_edge37.us ], [ 0, %.lr.ph42.split.us.preheader ]
  %187 = phi [2160 x float]* [ %216, %._crit_edge37.us ], [ %.lcssa29112, %.lr.ph42.split.us.preheader ]
  store float 0.000000e+00, float* %16, align 4
  store float 0.000000e+00, float* %17, align 4
  store i32 4095, i32* %12, align 4
  br label %188

; <label>:188:                                    ; preds = %188, %.lr.ph42.split.us
  %189 = phi i32 [ 4095, %.lr.ph42.split.us ], [ %220, %188 ]
  %190 = phi [2160 x float]* [ %187, %.lr.ph42.split.us ], [ %216, %188 ]
  %191 = phi i32 [ %storemerge341.us, %.lr.ph42.split.us ], [ %210, %188 ]
  %192 = phi float [ 0.000000e+00, %.lr.ph42.split.us ], [ %221, %188 ]
  %193 = phi float [ 0.000000e+00, %.lr.ph42.split.us ], [ %206, %188 ]
  %194 = phi float [ 0.000000e+00, %.lr.ph42.split.us ], [ %222, %188 ]
  %195 = phi float [ 0.000000e+00, %.lr.ph42.split.us ], [ %215, %188 ]
  %196 = fmul float %38, %192
  %197 = fmul float %193, %42
  %198 = fadd float %197, %196
  %199 = fmul float %exp2, %194
  %200 = fadd float %199, %198
  %201 = fmul float %195, %44
  %202 = fadd float %201, %200
  %203 = sext i32 %189 to i64
  %204 = sext i32 %191 to i64
  %205 = getelementptr inbounds [2160 x float], [2160 x float]* %190, i64 %203, i64 %204
  store float %202, float* %205, align 4
  %206 = load float, float* %16, align 4
  %207 = load [2160 x float]*, [2160 x float]** %9, align 8
  %208 = load i32, i32* %12, align 4
  %209 = sext i32 %208 to i64
  %210 = load i32, i32* %13, align 4
  %211 = sext i32 %210 to i64
  %212 = getelementptr inbounds [2160 x float], [2160 x float]* %207, i64 %209, i64 %211
  %213 = bitcast float* %212 to i32*
  %214 = load i32, i32* %213, align 4
  store i32 %214, i32* %185, align 4
  %215 = load float, float* %17, align 4
  %216 = load [2160 x float]*, [2160 x float]** %11, align 8
  %217 = getelementptr inbounds [2160 x float], [2160 x float]* %216, i64 %209, i64 %211
  %218 = bitcast float* %217 to i32*
  %219 = load i32, i32* %218, align 4
  store i32 %219, i32* %186, align 4
  %220 = add nsw i32 %208, -1
  %221 = bitcast i32 %214 to float
  %222 = bitcast i32 %219 to float
  store i32 %220, i32* %12, align 4
  %223 = icmp sgt i32 %208, 0
  br i1 %223, label %188, label %._crit_edge37.us

._crit_edge37.us:                                 ; preds = %188
  %224 = add nsw i32 %210, 1
  store i32 %224, i32* %13, align 4
  %225 = icmp slt i32 %224, 2160
  br i1 %225, label %.lr.ph42.split.us, label %.preheader10.loopexit

.lr.ph51.split:                                   ; preds = %.lr.ph51.split, %.lr.ph51.split.preheader213.new
  br i1 true, label %.preheader11.loopexit124.unr-lcssa, label %.lr.ph51.split

.preheader10.loopexit122.unr-lcssa:               ; preds = %.lr.ph42.split
  br label %.preheader10.loopexit122

.preheader10.loopexit122:                         ; preds = %.lr.ph42.split.prol.loopexit244, %.preheader10.loopexit122.unr-lcssa
  br label %.preheader10

.preheader10.loopexit:                            ; preds = %._crit_edge37.us
  br label %.preheader10

.preheader10:                                     ; preds = %.preheader10.loopexit, %.preheader10.loopexit122, %.lr.ph42.split.prol.loopexit, %.preheader11.thread119, %.preheader11
  %.lcssa24117 = phi [2160 x float]* [ %.lcssa24, %.preheader11 ], [ %.lcssa33110, %.preheader11.thread119 ], [ %.lcssa24118, %.lr.ph42.split.prol.loopexit ], [ %.lcssa24118, %.preheader10.loopexit122 ], [ %.lcssa24118, %.preheader10.loopexit ]
  %.lcssa20 = phi [2160 x float]* [ %.lcssa25, %.preheader11 ], [ %4, %.preheader11.thread119 ], [ %.lcssa25116, %.lr.ph42.split.prol.loopexit ], [ %.lcssa25116, %.preheader10.loopexit122 ], [ %207, %.preheader10.loopexit ]
  %.lcssa19 = phi [2160 x float]* [ %.lcssa29112, %.preheader11 ], [ %.lcssa29112, %.preheader11.thread119 ], [ %.lcssa29112, %.lr.ph42.split.prol.loopexit ], [ %.lcssa29112, %.preheader10.loopexit122 ], [ %216, %.preheader10.loopexit ]
  store i32 0, i32* %12, align 4
  br i1 true, label %.preheader.lr.ph, label %._crit_edge34

.preheader.lr.ph:                                 ; preds = %.preheader10
  br i1 true, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  br i1 undef, label %.preheader.prol.preheader, label %.preheader.prol.loopexit

.preheader.prol.preheader:                        ; preds = %.preheader.preheader
  br label %.preheader.prol

.preheader.prol:                                  ; preds = %.preheader.prol, %.preheader.prol.preheader
  br i1 false, label %.preheader.prol, label %.preheader.prol.loopexit.unr-lcssa, !llvm.loop !16

.preheader.prol.loopexit.unr-lcssa:               ; preds = %.preheader.prol
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %.preheader.prol.loopexit.unr-lcssa, %.preheader.preheader
  br i1 undef, label %._crit_edge34.loopexit120, label %.preheader.preheader.new

.preheader.preheader.new:                         ; preds = %.preheader.prol.loopexit
  br label %.preheader

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  store i32 0, i32* %13, align 4
  %226 = load i32, i32* %12, align 4
  br label %227

; <label>:227:                                    ; preds = %227, %.preheader.us
  %228 = phi i32 [ %226, %.preheader.us ], [ %241, %227 ]
  %229 = phi i32 [ 0, %.preheader.us ], [ %239, %227 ]
  %230 = sext i32 %228 to i64
  %231 = sext i32 %229 to i64
  %232 = getelementptr inbounds [2160 x float], [2160 x float]* %.lcssa24117, i64 %230, i64 %231
  %233 = load float, float* %232, align 4
  %234 = getelementptr inbounds [2160 x float], [2160 x float]* %.lcssa19, i64 %230, i64 %231
  %235 = load float, float* %234, align 4
  %236 = fadd float %233, %235
  %237 = getelementptr inbounds [2160 x float], [2160 x float]* %.lcssa20, i64 %230, i64 %231
  store float %236, float* %237, align 4
  %238 = load i32, i32* %13, align 4
  %239 = add nsw i32 %238, 1
  store i32 %239, i32* %13, align 4
  %240 = icmp slt i32 %239, 2160
  %241 = load i32, i32* %12, align 4
  br i1 %240, label %227, label %._crit_edge.us

._crit_edge.us:                                   ; preds = %227
  %242 = add nsw i32 %241, 1
  store i32 %242, i32* %12, align 4
  %243 = icmp slt i32 %242, 4096
  br i1 %243, label %.preheader.us, label %._crit_edge34.loopexit

.lr.ph42.split:                                   ; preds = %.lr.ph42.split, %.lr.ph42.split.preheader212.new
  br i1 true, label %.preheader10.loopexit122.unr-lcssa, label %.lr.ph42.split

.preheader:                                       ; preds = %.preheader, %.preheader.preheader.new
  br i1 false, label %.preheader, label %._crit_edge34.loopexit120.unr-lcssa

._crit_edge34.loopexit120.unr-lcssa:              ; preds = %.preheader
  br label %._crit_edge34.loopexit120

._crit_edge34.loopexit120:                        ; preds = %.preheader.prol.loopexit, %._crit_edge34.loopexit120.unr-lcssa
  br label %._crit_edge34

._crit_edge34.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge34

._crit_edge34:                                    ; preds = %._crit_edge34.loopexit, %._crit_edge34.loopexit120, %.preheader10
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [2160 x float]* nocapture readonly) #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  br i1 true, label %.preheader.lr.ph, label %._crit_edge4

.preheader.lr.ph:                                 ; preds = %3
  br i1 true, label %.preheader.lr.ph.split.us, label %._crit_edge4

.preheader.lr.ph.split.us:                        ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph.split.us
  %indvars.iv7 = phi i64 [ %indvars.iv.next8, %._crit_edge.us ], [ 0, %.preheader.lr.ph.split.us ]
  %8 = mul nsw i64 %indvars.iv7, 2160
  br label %9

; <label>:9:                                      ; preds = %16, %.preheader.us
  %indvars.iv.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %16 ]
  %10 = add nsw i64 %indvars.iv.us, %8
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
  %18 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv7, i64 %indvars.iv.us
  %19 = load float, float* %18, align 4
  %20 = fpext float %19 to double
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %20) #7
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 2160
  br i1 %exitcond.us, label %._crit_edge.us, label %9

._crit_edge.us:                                   ; preds = %16
  %indvars.iv.next8 = add nuw nsw i64 %indvars.iv7, 1
  %exitcond10 = icmp eq i64 %indvars.iv.next8, 4096
  br i1 %exitcond10, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %.preheader.lr.ph, %3
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #6
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
!4 = distinct !{!4, !5, !2, !3}
!5 = !{!"llvm.loop.unroll.runtime.disable"}
!6 = distinct !{!6, !7}
!7 = !{!"llvm.loop.unroll.disable"}
!8 = distinct !{!8, !7}
!9 = distinct !{!9, !7}
!10 = distinct !{!10, !7}
!11 = distinct !{!11, !7}
!12 = distinct !{!12, !7}
!13 = distinct !{!13, !7}
!14 = distinct !{!14, !7}
!15 = distinct !{!15, !7}
!16 = distinct !{!16, !7}
