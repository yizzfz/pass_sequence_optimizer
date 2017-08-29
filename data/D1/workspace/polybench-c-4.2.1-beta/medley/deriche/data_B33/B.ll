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
  tail call void (...) @polybench_timer_start() #5
  %10 = load float, float* %3, align 4
  %11 = bitcast i8* %6 to [2160 x float]*
  %12 = bitcast i8* %7 to [2160 x float]*
  tail call void @kernel_deriche(float %10, [2160 x float]* %8, [2160 x float]* %9, [2160 x float]* %11, [2160 x float]* %12)
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
  %18 = bitcast i8* %5 to [2160 x float]*
  tail call void @print_array([2160 x float]* %18)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  tail call void @free(i8* %4) #5
  tail call void @free(i8* %5) #5
  tail call void @free(i8* %6) #5
  tail call void @free(i8* %7) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(float* nocapture, [2160 x float]* nocapture) #2 {
  store float 2.500000e-01, float* %0, align 4
  br i1 true, label %._crit_edge.lr.ph, label %.loopexit

._crit_edge.lr.ph:                                ; preds = %2
  br i1 true, label %._crit_edge.us.preheader, label %.loopexit

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.preheader, %._crit_edge2.us
  %indvars.iv.us = phi i64 [ %indvars.iv.next.us, %._crit_edge2.us ], [ 0, %._crit_edge.us.preheader ]
  %sext = mul i64 %indvars.iv.us, 1344324763648
  %3 = lshr exact i64 %sext, 32
  br i1 false, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %._crit_edge.us
  br i1 false, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %3, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %4 = mul nuw nsw <4 x i64> %vec.ind, <i64 991, i64 991, i64 991, i64 991>
  %5 = add <4 x i64> %4, %broadcast.splat
  %6 = trunc <4 x i64> %5 to <4 x i32>
  %7 = srem <4 x i32> %6, <i32 65536, i32 65536, i32 65536, i32 65536>
  %8 = sitofp <4 x i32> %7 to <4 x float>
  %9 = fdiv <4 x float> %8, <float 6.553500e+04, float 6.553500e+04, float 6.553500e+04, float 6.553500e+04>
  %10 = getelementptr inbounds [2160 x float], [2160 x float]* %1, i64 %indvars.iv.us, i64 %index
  %11 = bitcast float* %10 to <4 x float>*
  store <4 x float> %9, <4 x float>* %11, align 4
  %index.next = add i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %12 = icmp eq i64 %index.next, 2160
  br i1 %12, label %middle.block, label %vector.body, !llvm.loop !1

middle.block:                                     ; preds = %vector.body
  br i1 true, label %._crit_edge2.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %min.iters.checked, %._crit_edge.us
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  br i1 true, label %._crit_edge2.us.loopexit, label %scalar.ph, !llvm.loop !4

._crit_edge2.us.loopexit:                         ; preds = %scalar.ph
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %._crit_edge2.us.loopexit, %middle.block
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 4096
  br i1 %exitcond.us, label %.loopexit.loopexit, label %._crit_edge.us

.loopexit.loopexit:                               ; preds = %._crit_edge2.us
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge.lr.ph, %2
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_deriche(float, [2160 x float]*, [2160 x float]*, [2160 x float]*, [2160 x float]*) #0 {
  %6 = alloca [2160 x float]*, align 8
  %7 = alloca [2160 x float]*, align 8
  %8 = alloca [2160 x float]*, align 8
  %9 = alloca [2160 x float]*, align 8
  %10 = alloca i32, align 4
  %11 = alloca i32, align 4
  %12 = alloca float, align 4
  %13 = alloca float, align 4
  %14 = alloca float, align 4
  %15 = alloca float, align 4
  store [2160 x float]* %1, [2160 x float]** %6, align 8
  store [2160 x float]* %2, [2160 x float]** %7, align 8
  store [2160 x float]* %3, [2160 x float]** %8, align 8
  store [2160 x float]* %4, [2160 x float]** %9, align 8
  %16 = fsub float -0.000000e+00, %0
  %17 = tail call float @expf(float %16) #5
  %18 = fsub float 1.000000e+00, %17
  %19 = tail call float @expf(float %16) #5
  %20 = fsub float 1.000000e+00, %19
  %21 = fmul float %18, %20
  %22 = fmul float %0, 2.000000e+00
  %23 = tail call float @expf(float %16) #5
  %24 = fmul float %22, %23
  %25 = fadd float %24, 1.000000e+00
  %26 = tail call float @expf(float %22) #5
  %27 = fsub float %25, %26
  %28 = fdiv float %21, %27
  %29 = tail call float @expf(float %16) #5
  %30 = fmul float %28, %29
  %31 = tail call float @expf(float %16) #5
  %32 = fmul float %28, %31
  %33 = insertelement <2 x float> undef, float %0, i32 0
  %34 = shufflevector <2 x float> %33, <2 x float> undef, <2 x i32> zeroinitializer
  %35 = fadd <2 x float> %34, <float -1.000000e+00, float 1.000000e+00>
  %36 = insertelement <2 x float> undef, float %30, i32 0
  %37 = insertelement <2 x float> %36, float %32, i32 1
  %38 = fmul <2 x float> %35, %37
  %39 = extractelement <2 x float> %38, i32 0
  %40 = extractelement <2 x float> %38, i32 1
  %41 = fmul float %0, -2.000000e+00
  %42 = tail call float @expf(float %41) #5
  %43 = fmul float %28, %42
  %44 = fsub float -0.000000e+00, %43
  %exp2 = tail call float @llvm.exp2.f32(float %16)
  %45 = tail call float @expf(float %41) #5
  %46 = fsub float -0.000000e+00, %45
  store i32 0, i32* %10, align 4
  br i1 true, label %.lr.ph77, label %._crit_edge.thread139

._crit_edge.thread139:                            ; preds = %5
  br label %._crit_edge12.thread

.lr.ph77:                                         ; preds = %5
  br i1 true, label %.lr.ph77.split.us.preheader, label %.lr.ph77.split.preheader

.lr.ph77.split.us.preheader:                      ; preds = %.lr.ph77
  %47 = bitcast float* %12 to i32*
  br label %.lr.ph77.split.us

.lr.ph77.split.preheader:                         ; preds = %.lr.ph77
  br i1 undef, label %.lr.ph77.split.prol.loopexit, label %.lr.ph77.split.prol.preheader

.lr.ph77.split.prol.preheader:                    ; preds = %.lr.ph77.split.preheader
  br label %.lr.ph77.split.prol

.lr.ph77.split.prol:                              ; preds = %.lr.ph77.split.prol.preheader, %.lr.ph77.split.prol
  br i1 true, label %.lr.ph77.split.prol.loopexit.loopexit, label %.lr.ph77.split.prol, !llvm.loop !6

.lr.ph77.split.prol.loopexit.loopexit:            ; preds = %.lr.ph77.split.prol
  br label %.lr.ph77.split.prol.loopexit

.lr.ph77.split.prol.loopexit:                     ; preds = %.lr.ph77.split.prol.loopexit.loopexit, %.lr.ph77.split.preheader
  br i1 undef, label %._crit_edge.thread, label %.lr.ph77.split.preheader243

.lr.ph77.split.preheader243:                      ; preds = %.lr.ph77.split.prol.loopexit
  br label %.lr.ph77.split

._crit_edge.thread:                               ; preds = %.lr.ph77.split.prol.loopexit
  br label %.lr.ph67

.lr.ph77.split.us:                                ; preds = %.lr.ph77.split.us.preheader, %._crit_edge71.us
  %storemerge75.us = phi i32 [ %85, %._crit_edge71.us ], [ 0, %.lr.ph77.split.us.preheader ]
  %48 = phi [2160 x float]* [ %78, %._crit_edge71.us ], [ %3, %.lr.ph77.split.us.preheader ]
  %49 = phi [2160 x float]* [ %70, %._crit_edge71.us ], [ %1, %.lr.ph77.split.us.preheader ]
  store float 0.000000e+00, float* %12, align 4
  store i32 0, i32* %11, align 4
  br label %50

; <label>:50:                                     ; preds = %50, %.lr.ph77.split.us
  %51 = phi i32 [ 0, %.lr.ph77.split.us ], [ %82, %50 ]
  %52 = phi [2160 x float]* [ %48, %.lr.ph77.split.us ], [ %78, %50 ]
  %53 = phi i32 [ %storemerge75.us, %.lr.ph77.split.us ], [ %71, %50 ]
  %54 = phi [2160 x float]* [ %49, %.lr.ph77.split.us ], [ %70, %50 ]
  %55 = phi float [ 0.000000e+00, %.lr.ph77.split.us ], [ %76, %50 ]
  %56 = phi float [ 0.000000e+00, %.lr.ph77.split.us ], [ %83, %50 ]
  %57 = phi float [ 0.000000e+00, %.lr.ph77.split.us ], [ %77, %50 ]
  %58 = sext i32 %53 to i64
  %59 = sext i32 %51 to i64
  %60 = getelementptr inbounds [2160 x float], [2160 x float]* %54, i64 %58, i64 %59
  %61 = load float, float* %60, align 4
  %62 = fmul float %28, %61
  %63 = fmul float %39, %55
  %64 = fadd float %62, %63
  %65 = fmul float %exp2, %56
  %66 = fadd float %64, %65
  %67 = fmul float %57, %46
  %68 = fadd float %66, %67
  %69 = getelementptr inbounds [2160 x float], [2160 x float]* %52, i64 %58, i64 %59
  store float %68, float* %69, align 4
  %70 = load [2160 x float]*, [2160 x float]** %6, align 8
  %71 = load i32, i32* %10, align 4
  %72 = sext i32 %71 to i64
  %73 = load i32, i32* %11, align 4
  %74 = sext i32 %73 to i64
  %75 = getelementptr inbounds [2160 x float], [2160 x float]* %70, i64 %72, i64 %74
  %76 = load float, float* %75, align 4
  %77 = load float, float* %12, align 4
  %78 = load [2160 x float]*, [2160 x float]** %8, align 8
  %79 = getelementptr inbounds [2160 x float], [2160 x float]* %78, i64 %72, i64 %74
  %80 = bitcast float* %79 to i32*
  %81 = load i32, i32* %80, align 4
  store i32 %81, i32* %47, align 4
  %82 = add nsw i32 %73, 1
  %83 = bitcast i32 %81 to float
  store i32 %82, i32* %11, align 4
  %84 = icmp slt i32 %82, 2160
  br i1 %84, label %50, label %._crit_edge71.us

._crit_edge71.us:                                 ; preds = %50
  %85 = add nsw i32 %71, 1
  store i32 %85, i32* %10, align 4
  %86 = icmp slt i32 %85, 4096
  br i1 %86, label %.lr.ph77.split.us, label %._crit_edge.loopexit

._crit_edge.loopexit159:                          ; preds = %.lr.ph77.split
  br label %._crit_edge

._crit_edge.loopexit:                             ; preds = %._crit_edge71.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.loopexit, %._crit_edge.loopexit159
  %.lcssa33 = phi [2160 x float]* [ %3, %._crit_edge.loopexit159 ], [ %78, %._crit_edge.loopexit ]
  store i32 0, i32* %10, align 4
  br i1 true, label %.lr.ph67, label %._crit_edge12.thread

.lr.ph67:                                         ; preds = %._crit_edge.thread, %._crit_edge
  %.lcssa33137 = phi [2160 x float]* [ %3, %._crit_edge.thread ], [ %.lcssa33, %._crit_edge ]
  br i1 true, label %.lr.ph67.split.us.preheader, label %.lr.ph67.split.preheader

.lr.ph67.split.us.preheader:                      ; preds = %.lr.ph67
  %87 = bitcast float* %13 to i32*
  %88 = bitcast float* %15 to i32*
  br label %.lr.ph67.split.us

.lr.ph67.split.preheader:                         ; preds = %.lr.ph67
  br i1 undef, label %.lr.ph67.split.prol.loopexit, label %.lr.ph67.split.prol.preheader

.lr.ph67.split.prol.preheader:                    ; preds = %.lr.ph67.split.preheader
  br label %.lr.ph67.split.prol

.lr.ph67.split.prol:                              ; preds = %.lr.ph67.split.prol.preheader, %.lr.ph67.split.prol
  br i1 true, label %.lr.ph67.split.prol.loopexit.loopexit, label %.lr.ph67.split.prol, !llvm.loop !8

.lr.ph67.split.prol.loopexit.loopexit:            ; preds = %.lr.ph67.split.prol
  br label %.lr.ph67.split.prol.loopexit

.lr.ph67.split.prol.loopexit:                     ; preds = %.lr.ph67.split.prol.loopexit.loopexit, %.lr.ph67.split.preheader
  br i1 undef, label %._crit_edge12.thread141, label %.lr.ph67.split.preheader242

.lr.ph67.split.preheader242:                      ; preds = %.lr.ph67.split.prol.loopexit
  br label %.lr.ph67.split

._crit_edge12.thread141:                          ; preds = %.lr.ph67.split.prol.loopexit
  br label %._crit_edge13.lr.ph

.lr.ph67.split.us:                                ; preds = %.lr.ph67.split.us.preheader, %._crit_edge63.us
  %storemerge166.us = phi i32 [ %124, %._crit_edge63.us ], [ 0, %.lr.ph67.split.us.preheader ]
  %89 = phi [2160 x float]* [ %117, %._crit_edge63.us ], [ %4, %.lr.ph67.split.us.preheader ]
  store float 0.000000e+00, float* %15, align 4
  store float 0.000000e+00, float* %13, align 4
  store i32 2159, i32* %11, align 4
  br label %90

; <label>:90:                                     ; preds = %90, %.lr.ph67.split.us
  %storemerge1060.us = phi i32 [ 2159, %.lr.ph67.split.us ], [ %storemerge10.us, %90 ]
  %91 = phi [2160 x float]* [ %89, %.lr.ph67.split.us ], [ %117, %90 ]
  %92 = phi i32 [ %storemerge166.us, %.lr.ph67.split.us ], [ %109, %90 ]
  %93 = phi float [ 0.000000e+00, %.lr.ph67.split.us ], [ %121, %90 ]
  %94 = phi float [ 0.000000e+00, %.lr.ph67.split.us ], [ %107, %90 ]
  %95 = phi float [ 0.000000e+00, %.lr.ph67.split.us ], [ %122, %90 ]
  %96 = phi float [ 0.000000e+00, %.lr.ph67.split.us ], [ %116, %90 ]
  %97 = fmul float %40, %93
  %98 = fmul float %94, %44
  %99 = fadd float %97, %98
  %100 = fmul float %exp2, %95
  %101 = fadd float %99, %100
  %102 = fmul float %96, %46
  %103 = fadd float %101, %102
  %104 = sext i32 %92 to i64
  %105 = sext i32 %storemerge1060.us to i64
  %106 = getelementptr inbounds [2160 x float], [2160 x float]* %91, i64 %104, i64 %105
  store float %103, float* %106, align 4
  %107 = load float, float* %13, align 4
  %108 = load [2160 x float]*, [2160 x float]** %6, align 8
  %109 = load i32, i32* %10, align 4
  %110 = sext i32 %109 to i64
  %111 = load i32, i32* %11, align 4
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds [2160 x float], [2160 x float]* %108, i64 %110, i64 %112
  %114 = bitcast float* %113 to i32*
  %115 = load i32, i32* %114, align 4
  store i32 %115, i32* %87, align 4
  %116 = load float, float* %15, align 4
  %117 = load [2160 x float]*, [2160 x float]** %9, align 8
  %118 = getelementptr inbounds [2160 x float], [2160 x float]* %117, i64 %110, i64 %112
  %119 = bitcast float* %118 to i32*
  %120 = load i32, i32* %119, align 4
  store i32 %120, i32* %88, align 4
  %121 = bitcast i32 %115 to float
  %122 = bitcast i32 %120 to float
  %storemerge10.us = add nsw i32 %111, -1
  store i32 %storemerge10.us, i32* %11, align 4
  %123 = icmp sgt i32 %111, 0
  br i1 %123, label %90, label %._crit_edge63.us

._crit_edge63.us:                                 ; preds = %90
  %124 = add nsw i32 %109, 1
  store i32 %124, i32* %10, align 4
  %125 = icmp slt i32 %124, 4096
  br i1 %125, label %.lr.ph67.split.us, label %._crit_edge12.loopexit

.lr.ph77.split:                                   ; preds = %.lr.ph77.split, %.lr.ph77.split.preheader243
  br i1 true, label %._crit_edge.loopexit159, label %.lr.ph77.split

._crit_edge12.thread:                             ; preds = %._crit_edge.thread139, %._crit_edge
  br label %._crit_edge14

._crit_edge12.loopexit157:                        ; preds = %.lr.ph67.split
  br label %._crit_edge12

._crit_edge12.loopexit:                           ; preds = %._crit_edge63.us
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge12.loopexit, %._crit_edge12.loopexit157
  %.lcssa29 = phi [2160 x float]* [ %4, %._crit_edge12.loopexit157 ], [ %117, %._crit_edge12.loopexit ]
  store i32 0, i32* %10, align 4
  br i1 true, label %._crit_edge13.lr.ph, label %._crit_edge14

._crit_edge13.lr.ph:                              ; preds = %._crit_edge12.thread141, %._crit_edge12
  %.lcssa29143 = phi [2160 x float]* [ %4, %._crit_edge12.thread141 ], [ %.lcssa29, %._crit_edge12 ]
  br i1 true, label %._crit_edge13.us.preheader, label %._crit_edge13.preheader

._crit_edge13.us.preheader:                       ; preds = %._crit_edge13.lr.ph
  br label %._crit_edge13.us

._crit_edge13.preheader:                          ; preds = %._crit_edge13.lr.ph
  br i1 undef, label %._crit_edge13.prol.loopexit, label %._crit_edge13.prol.preheader

._crit_edge13.prol.preheader:                     ; preds = %._crit_edge13.preheader
  br label %._crit_edge13.prol

._crit_edge13.prol:                               ; preds = %._crit_edge13.prol.preheader, %._crit_edge13.prol
  br i1 true, label %._crit_edge13.prol.loopexit.loopexit, label %._crit_edge13.prol, !llvm.loop !9

._crit_edge13.prol.loopexit.loopexit:             ; preds = %._crit_edge13.prol
  br label %._crit_edge13.prol.loopexit

._crit_edge13.prol.loopexit:                      ; preds = %._crit_edge13.prol.loopexit.loopexit, %._crit_edge13.preheader
  br i1 undef, label %._crit_edge14, label %._crit_edge13.preheader241

._crit_edge13.preheader241:                       ; preds = %._crit_edge13.prol.loopexit
  br label %._crit_edge13

._crit_edge13.us:                                 ; preds = %._crit_edge13.us.preheader, %._crit_edge58.us
  %indvars.iv111 = phi i64 [ %indvars.iv.next112, %._crit_edge58.us ], [ 0, %._crit_edge13.us.preheader ]
  store i32 0, i32* %11, align 4
  br i1 true, label %.prol.loopexit, label %126

; <label>:126:                                    ; preds = %._crit_edge13.us
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %._crit_edge13.us, %126
  %indvars.iv.unr.ph = phi i64 [ 1, %126 ], [ 0, %._crit_edge13.us ]
  br i1 false, label %._crit_edge58.us, label %._crit_edge13.us.new.preheader

._crit_edge13.us.new.preheader:                   ; preds = %.prol.loopexit
  br label %._crit_edge13.us.new

._crit_edge13.us.new:                             ; preds = %._crit_edge13.us.new.preheader, %._crit_edge13.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %._crit_edge13.us.new ], [ %indvars.iv.unr.ph, %._crit_edge13.us.new.preheader ]
  %127 = getelementptr inbounds [2160 x float], [2160 x float]* %.lcssa33137, i64 %indvars.iv111, i64 %indvars.iv
  %128 = load float, float* %127, align 4
  %129 = getelementptr inbounds [2160 x float], [2160 x float]* %.lcssa29143, i64 %indvars.iv111, i64 %indvars.iv
  %130 = load float, float* %129, align 4
  %131 = fadd float %128, %130
  %132 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv111, i64 %indvars.iv
  store float %131, float* %132, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %133 = trunc i64 %indvars.iv.next to i32
  store i32 %133, i32* %11, align 4
  %134 = getelementptr inbounds [2160 x float], [2160 x float]* %.lcssa33137, i64 %indvars.iv111, i64 %indvars.iv.next
  %135 = load float, float* %134, align 4
  %136 = getelementptr inbounds [2160 x float], [2160 x float]* %.lcssa29143, i64 %indvars.iv111, i64 %indvars.iv.next
  %137 = load float, float* %136, align 4
  %138 = fadd float %135, %137
  %139 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv111, i64 %indvars.iv.next
  store float %138, float* %139, align 4
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %140 = trunc i64 %indvars.iv.next.1 to i32
  store i32 %140, i32* %11, align 4
  %exitcond110.1 = icmp eq i64 %indvars.iv.next.1, 2160
  br i1 %exitcond110.1, label %._crit_edge58.us.loopexit, label %._crit_edge13.us.new

._crit_edge58.us.loopexit:                        ; preds = %._crit_edge13.us.new
  br label %._crit_edge58.us

._crit_edge58.us:                                 ; preds = %._crit_edge58.us.loopexit, %.prol.loopexit
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv111, 1
  %141 = trunc i64 %indvars.iv.next112 to i32
  store i32 %141, i32* %10, align 4
  %exitcond114 = icmp eq i64 %indvars.iv.next112, 4096
  br i1 %exitcond114, label %._crit_edge14.loopexit, label %._crit_edge13.us

.lr.ph67.split:                                   ; preds = %.lr.ph67.split, %.lr.ph67.split.preheader242
  br i1 true, label %._crit_edge12.loopexit157, label %.lr.ph67.split

._crit_edge14.loopexit155:                        ; preds = %._crit_edge13
  br label %._crit_edge14

._crit_edge14.loopexit:                           ; preds = %._crit_edge58.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %._crit_edge14.loopexit155, %._crit_edge12.thread, %._crit_edge13.prol.loopexit, %._crit_edge12
  %.lcssa29140 = phi [2160 x float]* [ %.lcssa29143, %._crit_edge13.prol.loopexit ], [ %.lcssa29, %._crit_edge12 ], [ %4, %._crit_edge12.thread ], [ %.lcssa29143, %._crit_edge14.loopexit155 ], [ %.lcssa29143, %._crit_edge14.loopexit ]
  %.lcssa33138 = phi [2160 x float]* [ %.lcssa33137, %._crit_edge13.prol.loopexit ], [ %.lcssa33137, %._crit_edge12 ], [ undef, %._crit_edge12.thread ], [ %.lcssa33137, %._crit_edge14.loopexit155 ], [ %.lcssa33137, %._crit_edge14.loopexit ]
  store i32 0, i32* %11, align 4
  br i1 true, label %.lr.ph54, label %._crit_edge15.thread147

._crit_edge15.thread147:                          ; preds = %._crit_edge14
  br label %._crit_edge16

.lr.ph54:                                         ; preds = %._crit_edge14
  br i1 true, label %.lr.ph54.split.us.preheader, label %.lr.ph54.split.preheader

.lr.ph54.split.us.preheader:                      ; preds = %.lr.ph54
  %142 = bitcast float* %12 to i32*
  br label %.lr.ph54.split.us

.lr.ph54.split.preheader:                         ; preds = %.lr.ph54
  br i1 undef, label %.lr.ph54.split.prol.loopexit, label %.lr.ph54.split.prol.preheader

.lr.ph54.split.prol.preheader:                    ; preds = %.lr.ph54.split.preheader
  br label %.lr.ph54.split.prol

.lr.ph54.split.prol:                              ; preds = %.lr.ph54.split.prol.preheader, %.lr.ph54.split.prol
  br i1 true, label %.lr.ph54.split.prol.loopexit.loopexit, label %.lr.ph54.split.prol, !llvm.loop !10

.lr.ph54.split.prol.loopexit.loopexit:            ; preds = %.lr.ph54.split.prol
  br label %.lr.ph54.split.prol.loopexit

.lr.ph54.split.prol.loopexit:                     ; preds = %.lr.ph54.split.prol.loopexit.loopexit, %.lr.ph54.split.preheader
  br i1 undef, label %._crit_edge15.thread, label %.lr.ph54.split.preheader240

.lr.ph54.split.preheader240:                      ; preds = %.lr.ph54.split.prol.loopexit
  br label %.lr.ph54.split

._crit_edge15.thread:                             ; preds = %.lr.ph54.split.prol.loopexit
  br label %.lr.ph44

.lr.ph54.split.us:                                ; preds = %.lr.ph54.split.us.preheader, %._crit_edge49.us
  %storemerge353.us = phi i32 [ %180, %._crit_edge49.us ], [ 0, %.lr.ph54.split.us.preheader ]
  %143 = phi [2160 x float]* [ %173, %._crit_edge49.us ], [ %.lcssa33138, %.lr.ph54.split.us.preheader ]
  %144 = phi [2160 x float]* [ %165, %._crit_edge49.us ], [ %2, %.lr.ph54.split.us.preheader ]
  store float 0.000000e+00, float* %12, align 4
  store i32 0, i32* %10, align 4
  br label %145

; <label>:145:                                    ; preds = %145, %.lr.ph54.split.us
  %146 = phi i32 [ 0, %.lr.ph54.split.us ], [ %177, %145 ]
  %147 = phi [2160 x float]* [ %143, %.lr.ph54.split.us ], [ %173, %145 ]
  %148 = phi [2160 x float]* [ %144, %.lr.ph54.split.us ], [ %165, %145 ]
  %149 = phi i32 [ %storemerge353.us, %.lr.ph54.split.us ], [ %168, %145 ]
  %150 = phi float [ 0.000000e+00, %.lr.ph54.split.us ], [ %171, %145 ]
  %151 = phi float [ 0.000000e+00, %.lr.ph54.split.us ], [ %178, %145 ]
  %152 = phi float [ 0.000000e+00, %.lr.ph54.split.us ], [ %172, %145 ]
  %153 = sext i32 %146 to i64
  %154 = sext i32 %149 to i64
  %155 = getelementptr inbounds [2160 x float], [2160 x float]* %148, i64 %153, i64 %154
  %156 = load float, float* %155, align 4
  %157 = fmul float %28, %156
  %158 = fmul float %39, %150
  %159 = fadd float %157, %158
  %160 = fmul float %exp2, %151
  %161 = fadd float %159, %160
  %162 = fmul float %152, %46
  %163 = fadd float %161, %162
  %164 = getelementptr inbounds [2160 x float], [2160 x float]* %147, i64 %153, i64 %154
  store float %163, float* %164, align 4
  %165 = load [2160 x float]*, [2160 x float]** %7, align 8
  %166 = load i32, i32* %10, align 4
  %167 = sext i32 %166 to i64
  %168 = load i32, i32* %11, align 4
  %169 = sext i32 %168 to i64
  %170 = getelementptr inbounds [2160 x float], [2160 x float]* %165, i64 %167, i64 %169
  %171 = load float, float* %170, align 4
  %172 = load float, float* %12, align 4
  %173 = load [2160 x float]*, [2160 x float]** %8, align 8
  %174 = getelementptr inbounds [2160 x float], [2160 x float]* %173, i64 %167, i64 %169
  %175 = bitcast float* %174 to i32*
  %176 = load i32, i32* %175, align 4
  store i32 %176, i32* %142, align 4
  %177 = add nsw i32 %166, 1
  %178 = bitcast i32 %176 to float
  store i32 %177, i32* %10, align 4
  %179 = icmp slt i32 %177, 4096
  br i1 %179, label %145, label %._crit_edge49.us

._crit_edge49.us:                                 ; preds = %145
  %180 = add nsw i32 %168, 1
  store i32 %180, i32* %11, align 4
  %181 = icmp slt i32 %180, 2160
  br i1 %181, label %.lr.ph54.split.us, label %._crit_edge15.loopexit

._crit_edge13:                                    ; preds = %._crit_edge13, %._crit_edge13.preheader241
  br i1 true, label %._crit_edge14.loopexit155, label %._crit_edge13

._crit_edge15.loopexit153:                        ; preds = %.lr.ph54.split
  br label %._crit_edge15

._crit_edge15.loopexit:                           ; preds = %._crit_edge49.us
  br label %._crit_edge15

._crit_edge15:                                    ; preds = %._crit_edge15.loopexit, %._crit_edge15.loopexit153
  %.lcssa26 = phi [2160 x float]* [ %2, %._crit_edge15.loopexit153 ], [ %165, %._crit_edge15.loopexit ]
  %.lcssa25 = phi [2160 x float]* [ %.lcssa33138, %._crit_edge15.loopexit153 ], [ %173, %._crit_edge15.loopexit ]
  store i32 0, i32* %11, align 4
  br i1 true, label %.lr.ph44, label %._crit_edge16

.lr.ph44:                                         ; preds = %._crit_edge15.thread, %._crit_edge15
  %.lcssa25146 = phi [2160 x float]* [ %.lcssa33138, %._crit_edge15.thread ], [ %.lcssa25, %._crit_edge15 ]
  %.lcssa26144 = phi [2160 x float]* [ %2, %._crit_edge15.thread ], [ %.lcssa26, %._crit_edge15 ]
  br i1 true, label %.lr.ph44.split.us.preheader, label %.lr.ph44.split.preheader

.lr.ph44.split.us.preheader:                      ; preds = %.lr.ph44
  %182 = bitcast float* %14 to i32*
  %183 = bitcast float* %15 to i32*
  br label %.lr.ph44.split.us

.lr.ph44.split.preheader:                         ; preds = %.lr.ph44
  br i1 undef, label %.lr.ph44.split.prol.loopexit, label %.lr.ph44.split.prol.preheader

.lr.ph44.split.prol.preheader:                    ; preds = %.lr.ph44.split.preheader
  br label %.lr.ph44.split.prol

.lr.ph44.split.prol:                              ; preds = %.lr.ph44.split.prol.preheader, %.lr.ph44.split.prol
  br i1 true, label %.lr.ph44.split.prol.loopexit.loopexit, label %.lr.ph44.split.prol, !llvm.loop !11

.lr.ph44.split.prol.loopexit.loopexit:            ; preds = %.lr.ph44.split.prol
  br label %.lr.ph44.split.prol.loopexit

.lr.ph44.split.prol.loopexit:                     ; preds = %.lr.ph44.split.prol.loopexit.loopexit, %.lr.ph44.split.preheader
  br i1 undef, label %._crit_edge16, label %.lr.ph44.split.preheader239

.lr.ph44.split.preheader239:                      ; preds = %.lr.ph44.split.prol.loopexit
  br label %.lr.ph44.split

.lr.ph44.split.us:                                ; preds = %.lr.ph44.split.us.preheader, %._crit_edge40.us
  %storemerge443.us = phi i32 [ %219, %._crit_edge40.us ], [ 0, %.lr.ph44.split.us.preheader ]
  %184 = phi [2160 x float]* [ %212, %._crit_edge40.us ], [ %.lcssa29140, %.lr.ph44.split.us.preheader ]
  store float 0.000000e+00, float* %14, align 4
  store float 0.000000e+00, float* %15, align 4
  store i32 4095, i32* %10, align 4
  br label %185

; <label>:185:                                    ; preds = %185, %.lr.ph44.split.us
  %storemerge737.us = phi i32 [ 4095, %.lr.ph44.split.us ], [ %storemerge7.us, %185 ]
  %186 = phi [2160 x float]* [ %184, %.lr.ph44.split.us ], [ %212, %185 ]
  %187 = phi i32 [ %storemerge443.us, %.lr.ph44.split.us ], [ %206, %185 ]
  %188 = phi float [ 0.000000e+00, %.lr.ph44.split.us ], [ %216, %185 ]
  %189 = phi float [ 0.000000e+00, %.lr.ph44.split.us ], [ %202, %185 ]
  %190 = phi float [ 0.000000e+00, %.lr.ph44.split.us ], [ %217, %185 ]
  %191 = phi float [ 0.000000e+00, %.lr.ph44.split.us ], [ %211, %185 ]
  %192 = fmul float %40, %188
  %193 = fmul float %189, %44
  %194 = fadd float %192, %193
  %195 = fmul float %exp2, %190
  %196 = fadd float %194, %195
  %197 = fmul float %191, %46
  %198 = fadd float %196, %197
  %199 = sext i32 %storemerge737.us to i64
  %200 = sext i32 %187 to i64
  %201 = getelementptr inbounds [2160 x float], [2160 x float]* %186, i64 %199, i64 %200
  store float %198, float* %201, align 4
  %202 = load float, float* %14, align 4
  %203 = load [2160 x float]*, [2160 x float]** %7, align 8
  %204 = load i32, i32* %10, align 4
  %205 = sext i32 %204 to i64
  %206 = load i32, i32* %11, align 4
  %207 = sext i32 %206 to i64
  %208 = getelementptr inbounds [2160 x float], [2160 x float]* %203, i64 %205, i64 %207
  %209 = bitcast float* %208 to i32*
  %210 = load i32, i32* %209, align 4
  store i32 %210, i32* %182, align 4
  %211 = load float, float* %15, align 4
  %212 = load [2160 x float]*, [2160 x float]** %9, align 8
  %213 = getelementptr inbounds [2160 x float], [2160 x float]* %212, i64 %205, i64 %207
  %214 = bitcast float* %213 to i32*
  %215 = load i32, i32* %214, align 4
  store i32 %215, i32* %183, align 4
  %216 = bitcast i32 %210 to float
  %217 = bitcast i32 %215 to float
  %storemerge7.us = add nsw i32 %204, -1
  store i32 %storemerge7.us, i32* %10, align 4
  %218 = icmp sgt i32 %204, 0
  br i1 %218, label %185, label %._crit_edge40.us

._crit_edge40.us:                                 ; preds = %185
  %219 = add nsw i32 %206, 1
  store i32 %219, i32* %11, align 4
  %220 = icmp slt i32 %219, 2160
  br i1 %220, label %.lr.ph44.split.us, label %._crit_edge16.loopexit

.lr.ph54.split:                                   ; preds = %.lr.ph54.split, %.lr.ph54.split.preheader240
  br i1 true, label %._crit_edge15.loopexit153, label %.lr.ph54.split

._crit_edge16.loopexit151:                        ; preds = %.lr.ph44.split
  br label %._crit_edge16

._crit_edge16.loopexit:                           ; preds = %._crit_edge40.us
  br label %._crit_edge16

._crit_edge16:                                    ; preds = %._crit_edge16.loopexit, %._crit_edge16.loopexit151, %._crit_edge15.thread147, %.lr.ph44.split.prol.loopexit, %._crit_edge15
  %.lcssa25145 = phi [2160 x float]* [ %.lcssa25, %._crit_edge15 ], [ %.lcssa25146, %.lr.ph44.split.prol.loopexit ], [ %.lcssa33138, %._crit_edge15.thread147 ], [ %.lcssa25146, %._crit_edge16.loopexit151 ], [ %.lcssa25146, %._crit_edge16.loopexit ]
  %.lcssa21 = phi [2160 x float]* [ %.lcssa26, %._crit_edge15 ], [ %.lcssa26144, %.lr.ph44.split.prol.loopexit ], [ %2, %._crit_edge15.thread147 ], [ %.lcssa26144, %._crit_edge16.loopexit151 ], [ %203, %._crit_edge16.loopexit ]
  %.lcssa20 = phi [2160 x float]* [ %.lcssa29140, %._crit_edge15 ], [ %.lcssa29140, %.lr.ph44.split.prol.loopexit ], [ %.lcssa29140, %._crit_edge15.thread147 ], [ %.lcssa29140, %._crit_edge16.loopexit151 ], [ %212, %._crit_edge16.loopexit ]
  store i32 0, i32* %10, align 4
  br i1 true, label %._crit_edge17.lr.ph, label %._crit_edge35

._crit_edge17.lr.ph:                              ; preds = %._crit_edge16
  br i1 true, label %._crit_edge17.us.preheader, label %._crit_edge17.preheader

._crit_edge17.us.preheader:                       ; preds = %._crit_edge17.lr.ph
  br label %._crit_edge17.us

._crit_edge17.preheader:                          ; preds = %._crit_edge17.lr.ph
  br i1 undef, label %._crit_edge17.prol.loopexit, label %._crit_edge17.prol.preheader

._crit_edge17.prol.preheader:                     ; preds = %._crit_edge17.preheader
  br label %._crit_edge17.prol

._crit_edge17.prol:                               ; preds = %._crit_edge17.prol.preheader, %._crit_edge17.prol
  br i1 true, label %._crit_edge17.prol.loopexit.loopexit, label %._crit_edge17.prol, !llvm.loop !12

._crit_edge17.prol.loopexit.loopexit:             ; preds = %._crit_edge17.prol
  br label %._crit_edge17.prol.loopexit

._crit_edge17.prol.loopexit:                      ; preds = %._crit_edge17.prol.loopexit.loopexit, %._crit_edge17.preheader
  br i1 undef, label %._crit_edge35, label %._crit_edge17.preheader238

._crit_edge17.preheader238:                       ; preds = %._crit_edge17.prol.loopexit
  br label %._crit_edge17

._crit_edge17.us:                                 ; preds = %._crit_edge17.us.preheader, %._crit_edge34.us
  %221 = phi i32 [ %235, %._crit_edge34.us ], [ 0, %._crit_edge17.us.preheader ]
  store i32 0, i32* %11, align 4
  br label %._crit_edge79.us

._crit_edge79.us:                                 ; preds = %._crit_edge79.us, %._crit_edge17.us
  %222 = phi i32 [ %221, %._crit_edge17.us ], [ %.pre.us, %._crit_edge79.us ]
  %223 = phi i32 [ 0, %._crit_edge17.us ], [ %233, %._crit_edge79.us ]
  %224 = sext i32 %222 to i64
  %225 = sext i32 %223 to i64
  %226 = getelementptr inbounds [2160 x float], [2160 x float]* %.lcssa25145, i64 %224, i64 %225
  %227 = load float, float* %226, align 4
  %228 = getelementptr inbounds [2160 x float], [2160 x float]* %.lcssa20, i64 %224, i64 %225
  %229 = load float, float* %228, align 4
  %230 = fadd float %227, %229
  %231 = getelementptr inbounds [2160 x float], [2160 x float]* %.lcssa21, i64 %224, i64 %225
  store float %230, float* %231, align 4
  %232 = load i32, i32* %11, align 4
  %233 = add nsw i32 %232, 1
  store i32 %233, i32* %11, align 4
  %234 = icmp slt i32 %233, 2160
  %.pre.us = load i32, i32* %10, align 4
  br i1 %234, label %._crit_edge79.us, label %._crit_edge34.us

._crit_edge34.us:                                 ; preds = %._crit_edge79.us
  %235 = add nsw i32 %.pre.us, 1
  store i32 %235, i32* %10, align 4
  %236 = icmp slt i32 %235, 4096
  br i1 %236, label %._crit_edge17.us, label %._crit_edge35.loopexit

.lr.ph44.split:                                   ; preds = %.lr.ph44.split, %.lr.ph44.split.preheader239
  br i1 true, label %._crit_edge16.loopexit151, label %.lr.ph44.split

._crit_edge17:                                    ; preds = %._crit_edge17, %._crit_edge17.preheader238
  br i1 true, label %._crit_edge35.loopexit149, label %._crit_edge17

._crit_edge35.loopexit149:                        ; preds = %._crit_edge17
  br label %._crit_edge35

._crit_edge35.loopexit:                           ; preds = %._crit_edge34.us
  br label %._crit_edge35

._crit_edge35:                                    ; preds = %._crit_edge35.loopexit, %._crit_edge35.loopexit149, %._crit_edge17.prol.loopexit, %._crit_edge16
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array([2160 x float]* nocapture readonly) #0 {
  %2 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %3 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %2) #6
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %4, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  br i1 true, label %._crit_edge.lr.ph, label %.loopexit

._crit_edge.lr.ph:                                ; preds = %1
  br i1 true, label %._crit_edge.us.preheader, label %.loopexit

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge3.us, %._crit_edge.us.preheader
  %indvars.iv = phi i64 [ 0, %._crit_edge.us.preheader ], [ %indvars.iv.next, %._crit_edge3.us ]
  %6 = mul nsw i64 %indvars.iv, 2160
  br label %7

; <label>:7:                                      ; preds = %._crit_edge2.us, %._crit_edge.us
  %indvars.iv.us = phi i64 [ 0, %._crit_edge.us ], [ %indvars.iv.next.us, %._crit_edge2.us ]
  %8 = add i64 %6, %indvars.iv.us
  %9 = trunc i64 %8 to i32
  %10 = srem i32 %9, 20
  %11 = icmp eq i32 %10, 0
  br i1 %11, label %12, label %._crit_edge2.us

; <label>:12:                                     ; preds = %7
  %13 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %13) #6
  br label %._crit_edge2.us

._crit_edge2.us:                                  ; preds = %7, %12
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %15 = getelementptr inbounds [2160 x float], [2160 x float]* %0, i64 %indvars.iv, i64 %indvars.iv.us
  %16 = load float, float* %15, align 4
  %17 = fpext float %16 to double
  %18 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %14, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %17) #7
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 2160
  br i1 %exitcond.us, label %._crit_edge3.us, label %7

._crit_edge3.us:                                  ; preds = %._crit_edge2.us
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 4096
  br i1 %exitcond, label %.loopexit.loopexit, label %._crit_edge.us

.loopexit.loopexit:                               ; preds = %._crit_edge3.us
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %._crit_edge.lr.ph, %1
  %19 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %19, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %21) #6
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
