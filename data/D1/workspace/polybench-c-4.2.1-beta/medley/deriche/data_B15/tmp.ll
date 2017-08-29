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
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to [2160 x float]*
  call void @print_array(i32 4096, i32 2160, [2160 x float]* %18)
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
define internal void @init_array(i32, i32, float* nocapture, [2160 x float]* nocapture) #2 {
  store float 2.500000e-01, float* %2, align 4
  br i1 true, label %.preheader.lr.ph, label %._crit_edge1

.preheader.lr.ph:                                 ; preds = %4
  br i1 true, label %.preheader.lr.ph.split.us, label %._crit_edge1

.preheader.lr.ph.split.us:                        ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph.split.us
  %indvars.iv2 = phi i64 [ 0, %.preheader.lr.ph.split.us ], [ %indvars.iv.next3, %._crit_edge.us ]
  %5 = mul nuw nsw i64 %indvars.iv2, 313
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
  %12 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv2, i64 %index
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
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next3, 4096
  br i1 %exitcond5, label %._crit_edge1.loopexit, label %.preheader.us

._crit_edge1.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1.loopexit, %.preheader.lr.ph, %4
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
  %32 = fmul float %31, %30
  %33 = fadd float %2, -1.000000e+00
  %34 = fmul float %33, %32
  %35 = tail call float @expf(float %18) #5
  %36 = fmul float %35, %30
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
  br i1 true, label %.lr.ph81, label %.preheader18.thread129

.preheader18.thread129:                           ; preds = %7
  br label %.preheader17.thread

.lr.ph81:                                         ; preds = %7
  br i1 true, label %.lr.ph81.split.us.preheader, label %.lr.ph81.split.preheader

.lr.ph81.split.us.preheader:                      ; preds = %.lr.ph81
  br label %.lr.ph81.split.us

.lr.ph81.split.preheader:                         ; preds = %.lr.ph81
  br i1 undef, label %.lr.ph81.split.prol.loopexit, label %.lr.ph81.split.prol.preheader

.lr.ph81.split.prol.preheader:                    ; preds = %.lr.ph81.split.preheader
  br label %.lr.ph81.split.prol

.lr.ph81.split.prol:                              ; preds = %.lr.ph81.split.prol.preheader, %.lr.ph81.split.prol
  br i1 true, label %.lr.ph81.split.prol.loopexit.loopexit, label %.lr.ph81.split.prol, !llvm.loop !6

.lr.ph81.split.prol.loopexit.loopexit:            ; preds = %.lr.ph81.split.prol
  br label %.lr.ph81.split.prol.loopexit

.lr.ph81.split.prol.loopexit:                     ; preds = %.lr.ph81.split.preheader, %.lr.ph81.split.prol.loopexit.loopexit
  br i1 undef, label %.preheader18.thread, label %.lr.ph81.split.preheader260

.lr.ph81.split.preheader260:                      ; preds = %.lr.ph81.split.prol.loopexit
  br i1 undef, label %.lr.ph81.split.prol.preheader314, label %.lr.ph81.split.prol.loopexit315

.lr.ph81.split.prol.preheader314:                 ; preds = %.lr.ph81.split.preheader260
  br label %.lr.ph81.split.prol318

.lr.ph81.split.prol318:                           ; preds = %.lr.ph81.split.prol318, %.lr.ph81.split.prol.preheader314
  br i1 false, label %.lr.ph81.split.prol318, label %.lr.ph81.split.prol.loopexit315.unr-lcssa, !llvm.loop !8

.lr.ph81.split.prol.loopexit315.unr-lcssa:        ; preds = %.lr.ph81.split.prol318
  br label %.lr.ph81.split.prol.loopexit315

.lr.ph81.split.prol.loopexit315:                  ; preds = %.lr.ph81.split.prol.loopexit315.unr-lcssa, %.lr.ph81.split.preheader260
  br i1 undef, label %.preheader18.loopexit148, label %.lr.ph81.split.preheader260.new

.lr.ph81.split.preheader260.new:                  ; preds = %.lr.ph81.split.prol.loopexit315
  br label %.lr.ph81.split

.preheader18.thread:                              ; preds = %.lr.ph81.split.prol.loopexit
  br label %.lr.ph70

.lr.ph81.split.us:                                ; preds = %.lr.ph81.split.us.preheader, %._crit_edge75.us
  %45 = phi [2160 x float]* [ %73, %._crit_edge75.us ], [ %5, %.lr.ph81.split.us.preheader ]
  %46 = phi [2160 x float]* [ %65, %._crit_edge75.us ], [ %3, %.lr.ph81.split.us.preheader ]
  %storemerge79.us = phi i32 [ %78, %._crit_edge75.us ], [ 0, %.lr.ph81.split.us.preheader ]
  store float 0.000000e+00, float* %14, align 4
  store i32 0, i32* %13, align 4
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge, %.lr.ph81.split.us
  %47 = phi [2160 x float]* [ %45, %.lr.ph81.split.us ], [ %73, %._crit_edge ]
  %48 = phi i32 [ %storemerge79.us, %.lr.ph81.split.us ], [ %66, %._crit_edge ]
  %49 = phi [2160 x float]* [ %46, %.lr.ph81.split.us ], [ %65, %._crit_edge ]
  %50 = phi float [ 0.000000e+00, %.lr.ph81.split.us ], [ %71, %._crit_edge ]
  %51 = phi float [ 0.000000e+00, %.lr.ph81.split.us ], [ %75, %._crit_edge ]
  %52 = phi float [ 0.000000e+00, %.lr.ph81.split.us ], [ %72, %._crit_edge ]
  %storemerge1172.us = phi i32 [ 0, %.lr.ph81.split.us ], [ %76, %._crit_edge ]
  %53 = sext i32 %48 to i64
  %54 = sext i32 %storemerge1172.us to i64
  %55 = getelementptr inbounds [2160 x float], [2160 x float]* %49, i64 %53, i64 %54
  %56 = load float, float* %55, align 4
  %57 = fmul float %30, %56
  %58 = fmul float %34, %50
  %59 = fadd float %58, %57
  %60 = fmul float %exp2, %51
  %61 = fadd float %60, %59
  %62 = fmul float %52, %44
  %63 = fadd float %62, %61
  %64 = getelementptr inbounds [2160 x float], [2160 x float]* %47, i64 %53, i64 %54
  store float %63, float* %64, align 4
  %65 = load [2160 x float]*, [2160 x float]** %8, align 8
  %66 = load i32, i32* %12, align 4
  %67 = sext i32 %66 to i64
  %68 = load i32, i32* %13, align 4
  %69 = sext i32 %68 to i64
  %70 = getelementptr inbounds [2160 x float], [2160 x float]* %65, i64 %67, i64 %69
  %71 = load float, float* %70, align 4
  %72 = load float, float* %14, align 4
  %73 = load [2160 x float]*, [2160 x float]** %10, align 8
  %74 = getelementptr inbounds [2160 x float], [2160 x float]* %73, i64 %67, i64 %69
  %75 = load float, float* %74, align 4
  store float %75, float* %14, align 4
  %76 = add nsw i32 %68, 1
  store i32 %76, i32* %13, align 4
  %77 = icmp slt i32 %76, 2160
  br i1 %77, label %._crit_edge, label %._crit_edge75.us

._crit_edge75.us:                                 ; preds = %._crit_edge
  %78 = add nsw i32 %66, 1
  store i32 %78, i32* %12, align 4
  %79 = icmp slt i32 %78, 4096
  br i1 %79, label %.lr.ph81.split.us, label %.preheader18.loopexit

.preheader18.loopexit148.unr-lcssa:               ; preds = %.lr.ph81.split
  br label %.preheader18.loopexit148

.preheader18.loopexit148:                         ; preds = %.lr.ph81.split.prol.loopexit315, %.preheader18.loopexit148.unr-lcssa
  br label %.preheader18

.preheader18.loopexit:                            ; preds = %._crit_edge75.us
  br label %.preheader18

.preheader18:                                     ; preds = %.preheader18.loopexit, %.preheader18.loopexit148
  %.lcssa35 = phi [2160 x float]* [ %5, %.preheader18.loopexit148 ], [ %73, %.preheader18.loopexit ]
  store i32 0, i32* %12, align 4
  br i1 true, label %.lr.ph70, label %.preheader17.thread

.lr.ph70:                                         ; preds = %.preheader18, %.preheader18.thread
  %.lcssa35127 = phi [2160 x float]* [ %5, %.preheader18.thread ], [ %.lcssa35, %.preheader18 ]
  br i1 true, label %.lr.ph70.split.us.preheader, label %.lr.ph70.split.preheader

.lr.ph70.split.us.preheader:                      ; preds = %.lr.ph70
  br label %.lr.ph70.split.us

.lr.ph70.split.preheader:                         ; preds = %.lr.ph70
  br i1 undef, label %.lr.ph70.split.prol.loopexit, label %.lr.ph70.split.prol.preheader

.lr.ph70.split.prol.preheader:                    ; preds = %.lr.ph70.split.preheader
  br label %.lr.ph70.split.prol

.lr.ph70.split.prol:                              ; preds = %.lr.ph70.split.prol.preheader, %.lr.ph70.split.prol
  br i1 true, label %.lr.ph70.split.prol.loopexit.loopexit, label %.lr.ph70.split.prol, !llvm.loop !9

.lr.ph70.split.prol.loopexit.loopexit:            ; preds = %.lr.ph70.split.prol
  br label %.lr.ph70.split.prol.loopexit

.lr.ph70.split.prol.loopexit:                     ; preds = %.lr.ph70.split.preheader, %.lr.ph70.split.prol.loopexit.loopexit
  br i1 undef, label %.preheader17.thread131, label %.lr.ph70.split.preheader259

.lr.ph70.split.preheader259:                      ; preds = %.lr.ph70.split.prol.loopexit
  br i1 undef, label %.lr.ph70.split.prol.preheader307, label %.lr.ph70.split.prol.loopexit308

.lr.ph70.split.prol.preheader307:                 ; preds = %.lr.ph70.split.preheader259
  br label %.lr.ph70.split.prol311

.lr.ph70.split.prol311:                           ; preds = %.lr.ph70.split.prol311, %.lr.ph70.split.prol.preheader307
  br i1 false, label %.lr.ph70.split.prol311, label %.lr.ph70.split.prol.loopexit308.unr-lcssa, !llvm.loop !10

.lr.ph70.split.prol.loopexit308.unr-lcssa:        ; preds = %.lr.ph70.split.prol311
  br label %.lr.ph70.split.prol.loopexit308

.lr.ph70.split.prol.loopexit308:                  ; preds = %.lr.ph70.split.prol.loopexit308.unr-lcssa, %.lr.ph70.split.preheader259
  br i1 undef, label %.preheader17.loopexit146, label %.lr.ph70.split.preheader259.new

.lr.ph70.split.preheader259.new:                  ; preds = %.lr.ph70.split.prol.loopexit308
  br label %.lr.ph70.split

.preheader17.thread131:                           ; preds = %.lr.ph70.split.prol.loopexit
  br label %.preheader16.lr.ph

.lr.ph70.split.us:                                ; preds = %.lr.ph70.split.us.preheader, %._crit_edge66.us
  %80 = phi [2160 x float]* [ %107, %._crit_edge66.us ], [ %6, %.lr.ph70.split.us.preheader ]
  %storemerge169.us = phi i32 [ %112, %._crit_edge66.us ], [ 0, %.lr.ph70.split.us.preheader ]
  store float 0.000000e+00, float* %17, align 4
  store float 0.000000e+00, float* %15, align 4
  store i32 2159, i32* %13, align 4
  br label %._crit_edge252

._crit_edge252:                                   ; preds = %._crit_edge252, %.lr.ph70.split.us
  %81 = phi i32 [ 2159, %.lr.ph70.split.us ], [ %110, %._crit_edge252 ]
  %82 = phi [2160 x float]* [ %80, %.lr.ph70.split.us ], [ %107, %._crit_edge252 ]
  %83 = phi i32 [ %storemerge169.us, %.lr.ph70.split.us ], [ %100, %._crit_edge252 ]
  %84 = phi float [ 0.000000e+00, %.lr.ph70.split.us ], [ %105, %._crit_edge252 ]
  %85 = phi float [ 0.000000e+00, %.lr.ph70.split.us ], [ %98, %._crit_edge252 ]
  %86 = phi float [ 0.000000e+00, %.lr.ph70.split.us ], [ %109, %._crit_edge252 ]
  %87 = phi float [ 0.000000e+00, %.lr.ph70.split.us ], [ %106, %._crit_edge252 ]
  %88 = fmul float %38, %84
  %89 = fmul float %85, %42
  %90 = fadd float %89, %88
  %91 = fmul float %exp2, %86
  %92 = fadd float %91, %90
  %93 = fmul float %87, %44
  %94 = fadd float %93, %92
  %95 = sext i32 %83 to i64
  %96 = sext i32 %81 to i64
  %97 = getelementptr inbounds [2160 x float], [2160 x float]* %82, i64 %95, i64 %96
  store float %94, float* %97, align 4
  %98 = load float, float* %15, align 4
  %99 = load [2160 x float]*, [2160 x float]** %8, align 8
  %100 = load i32, i32* %12, align 4
  %101 = sext i32 %100 to i64
  %102 = load i32, i32* %13, align 4
  %103 = sext i32 %102 to i64
  %104 = getelementptr inbounds [2160 x float], [2160 x float]* %99, i64 %101, i64 %103
  %105 = load float, float* %104, align 4
  store float %105, float* %15, align 4
  %106 = load float, float* %17, align 4
  %107 = load [2160 x float]*, [2160 x float]** %11, align 8
  %108 = getelementptr inbounds [2160 x float], [2160 x float]* %107, i64 %101, i64 %103
  %109 = load float, float* %108, align 4
  store float %109, float* %17, align 4
  %110 = add nsw i32 %102, -1
  store i32 %110, i32* %13, align 4
  %111 = icmp sgt i32 %102, 0
  br i1 %111, label %._crit_edge252, label %._crit_edge66.us

._crit_edge66.us:                                 ; preds = %._crit_edge252
  %112 = add nsw i32 %100, 1
  store i32 %112, i32* %12, align 4
  %113 = icmp slt i32 %112, 4096
  br i1 %113, label %.lr.ph70.split.us, label %.preheader17.loopexit

.lr.ph81.split:                                   ; preds = %.lr.ph81.split, %.lr.ph81.split.preheader260.new
  br i1 true, label %.preheader18.loopexit148.unr-lcssa, label %.lr.ph81.split

.preheader17.thread:                              ; preds = %.preheader18, %.preheader18.thread129
  br label %.preheader15

.preheader17.loopexit146.unr-lcssa:               ; preds = %.lr.ph70.split
  br label %.preheader17.loopexit146

.preheader17.loopexit146:                         ; preds = %.lr.ph70.split.prol.loopexit308, %.preheader17.loopexit146.unr-lcssa
  br label %.preheader17

.preheader17.loopexit:                            ; preds = %._crit_edge66.us
  br label %.preheader17

.preheader17:                                     ; preds = %.preheader17.loopexit, %.preheader17.loopexit146
  %.lcssa31 = phi [2160 x float]* [ %6, %.preheader17.loopexit146 ], [ %107, %.preheader17.loopexit ]
  store i32 0, i32* %12, align 4
  br i1 true, label %.preheader16.lr.ph, label %.preheader15

.preheader16.lr.ph:                               ; preds = %.preheader17, %.preheader17.thread131
  %.lcssa31133 = phi [2160 x float]* [ %6, %.preheader17.thread131 ], [ %.lcssa31, %.preheader17 ]
  br i1 true, label %.preheader16.lr.ph.split.us, label %.preheader16.preheader

.preheader16.preheader:                           ; preds = %.preheader16.lr.ph
  br i1 undef, label %.preheader16.prol.loopexit, label %.preheader16.prol.preheader

.preheader16.prol.preheader:                      ; preds = %.preheader16.preheader
  br label %.preheader16.prol

.preheader16.prol:                                ; preds = %.preheader16.prol.preheader, %.preheader16.prol
  br i1 true, label %.preheader16.prol.loopexit.loopexit, label %.preheader16.prol, !llvm.loop !11

.preheader16.prol.loopexit.loopexit:              ; preds = %.preheader16.prol
  br label %.preheader16.prol.loopexit

.preheader16.prol.loopexit:                       ; preds = %.preheader16.preheader, %.preheader16.prol.loopexit.loopexit
  br i1 undef, label %.preheader15, label %.preheader16.preheader258

.preheader16.preheader258:                        ; preds = %.preheader16.prol.loopexit
  br i1 undef, label %.preheader16.prol.preheader300, label %.preheader16.prol.loopexit301

.preheader16.prol.preheader300:                   ; preds = %.preheader16.preheader258
  br label %.preheader16.prol304

.preheader16.prol304:                             ; preds = %.preheader16.prol304, %.preheader16.prol.preheader300
  br i1 false, label %.preheader16.prol304, label %.preheader16.prol.loopexit301.unr-lcssa, !llvm.loop !12

.preheader16.prol.loopexit301.unr-lcssa:          ; preds = %.preheader16.prol304
  br label %.preheader16.prol.loopexit301

.preheader16.prol.loopexit301:                    ; preds = %.preheader16.prol.loopexit301.unr-lcssa, %.preheader16.preheader258
  br i1 undef, label %.preheader15.loopexit144, label %.preheader16.preheader258.new

.preheader16.preheader258.new:                    ; preds = %.preheader16.prol.loopexit301
  br label %.preheader16

.preheader16.lr.ph.split.us:                      ; preds = %.preheader16.lr.ph
  br label %.preheader16.us

.preheader16.us:                                  ; preds = %._crit_edge61.us, %.preheader16.lr.ph.split.us
  %indvars.iv83 = phi i64 [ 0, %.preheader16.lr.ph.split.us ], [ %indvars.iv.next84, %._crit_edge61.us ]
  store i32 0, i32* %13, align 4
  br i1 true, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader16.us
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader16.us, %.prol.preheader
  %indvars.iv.us.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader16.us ]
  br i1 false, label %._crit_edge61.us, label %.preheader16.us.new.preheader

.preheader16.us.new.preheader:                    ; preds = %.prol.loopexit
  br label %.preheader16.us.new

.preheader16.us.new:                              ; preds = %.preheader16.us.new.preheader, %.preheader16.us.new
  %indvars.iv.us = phi i64 [ %indvars.iv.next.us.1, %.preheader16.us.new ], [ %indvars.iv.us.unr.ph, %.preheader16.us.new.preheader ]
  %114 = getelementptr inbounds [2160 x float], [2160 x float]* %.lcssa35127, i64 %indvars.iv83, i64 %indvars.iv.us
  %115 = load float, float* %114, align 4
  %116 = getelementptr inbounds [2160 x float], [2160 x float]* %.lcssa31133, i64 %indvars.iv83, i64 %indvars.iv.us
  %117 = load float, float* %116, align 4
  %118 = fadd float %115, %117
  %119 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv83, i64 %indvars.iv.us
  store float %118, float* %119, align 4
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %120 = trunc i64 %indvars.iv.next.us to i32
  store i32 %120, i32* %13, align 4
  %121 = getelementptr inbounds [2160 x float], [2160 x float]* %.lcssa35127, i64 %indvars.iv83, i64 %indvars.iv.next.us
  %122 = load float, float* %121, align 4
  %123 = getelementptr inbounds [2160 x float], [2160 x float]* %.lcssa31133, i64 %indvars.iv83, i64 %indvars.iv.next.us
  %124 = load float, float* %123, align 4
  %125 = fadd float %122, %124
  %126 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv83, i64 %indvars.iv.next.us
  store float %125, float* %126, align 4
  %indvars.iv.next.us.1 = add nuw nsw i64 %indvars.iv.us, 2
  %127 = trunc i64 %indvars.iv.next.us.1 to i32
  store i32 %127, i32* %13, align 4
  %exitcond.us.1 = icmp eq i64 %indvars.iv.next.us.1, 2160
  br i1 %exitcond.us.1, label %._crit_edge61.us.loopexit, label %.preheader16.us.new

._crit_edge61.us.loopexit:                        ; preds = %.preheader16.us.new
  br label %._crit_edge61.us

._crit_edge61.us:                                 ; preds = %._crit_edge61.us.loopexit, %.prol.loopexit
  %indvars.iv.next84 = add nuw nsw i64 %indvars.iv83, 1
  %128 = trunc i64 %indvars.iv.next84 to i32
  store i32 %128, i32* %12, align 4
  %exitcond86 = icmp eq i64 %indvars.iv.next84, 4096
  br i1 %exitcond86, label %.preheader15.loopexit, label %.preheader16.us

.lr.ph70.split:                                   ; preds = %.lr.ph70.split, %.lr.ph70.split.preheader259.new
  br i1 true, label %.preheader17.loopexit146.unr-lcssa, label %.lr.ph70.split

.preheader16:                                     ; preds = %.preheader16, %.preheader16.preheader258.new
  br i1 true, label %.preheader15.loopexit144.unr-lcssa, label %.preheader16

.preheader15.loopexit144.unr-lcssa:               ; preds = %.preheader16
  br label %.preheader15.loopexit144

.preheader15.loopexit144:                         ; preds = %.preheader16.prol.loopexit301, %.preheader15.loopexit144.unr-lcssa
  br label %.preheader15

.preheader15.loopexit:                            ; preds = %._crit_edge61.us
  br label %.preheader15

.preheader15:                                     ; preds = %.preheader15.loopexit, %.preheader16.prol.loopexit, %.preheader17, %.preheader15.loopexit144, %.preheader17.thread
  %.lcssa31130 = phi [2160 x float]* [ %6, %.preheader17.thread ], [ %.lcssa31133, %.preheader15.loopexit144 ], [ %.lcssa31, %.preheader17 ], [ %.lcssa31133, %.preheader16.prol.loopexit ], [ %.lcssa31133, %.preheader15.loopexit ]
  %.lcssa35128 = phi [2160 x float]* [ undef, %.preheader17.thread ], [ %.lcssa35127, %.preheader15.loopexit144 ], [ %.lcssa35127, %.preheader17 ], [ %.lcssa35127, %.preheader16.prol.loopexit ], [ %.lcssa35127, %.preheader15.loopexit ]
  store i32 0, i32* %13, align 4
  br i1 true, label %.lr.ph56, label %.preheader14.thread137

.preheader14.thread137:                           ; preds = %.preheader15
  br label %.preheader13

.lr.ph56:                                         ; preds = %.preheader15
  br i1 true, label %.lr.ph56.split.us.preheader, label %.lr.ph56.split.preheader

.lr.ph56.split.us.preheader:                      ; preds = %.lr.ph56
  br label %.lr.ph56.split.us

.lr.ph56.split.preheader:                         ; preds = %.lr.ph56
  br i1 undef, label %.lr.ph56.split.prol.loopexit, label %.lr.ph56.split.prol.preheader

.lr.ph56.split.prol.preheader:                    ; preds = %.lr.ph56.split.preheader
  br label %.lr.ph56.split.prol

.lr.ph56.split.prol:                              ; preds = %.lr.ph56.split.prol.preheader, %.lr.ph56.split.prol
  br i1 true, label %.lr.ph56.split.prol.loopexit.loopexit, label %.lr.ph56.split.prol, !llvm.loop !13

.lr.ph56.split.prol.loopexit.loopexit:            ; preds = %.lr.ph56.split.prol
  br label %.lr.ph56.split.prol.loopexit

.lr.ph56.split.prol.loopexit:                     ; preds = %.lr.ph56.split.preheader, %.lr.ph56.split.prol.loopexit.loopexit
  br i1 undef, label %.preheader14.thread, label %.lr.ph56.split.preheader257

.lr.ph56.split.preheader257:                      ; preds = %.lr.ph56.split.prol.loopexit
  br i1 undef, label %.lr.ph56.split.prol.preheader293, label %.lr.ph56.split.prol.loopexit294

.lr.ph56.split.prol.preheader293:                 ; preds = %.lr.ph56.split.preheader257
  br label %.lr.ph56.split.prol297

.lr.ph56.split.prol297:                           ; preds = %.lr.ph56.split.prol297, %.lr.ph56.split.prol.preheader293
  br i1 false, label %.lr.ph56.split.prol297, label %.lr.ph56.split.prol.loopexit294.unr-lcssa, !llvm.loop !14

.lr.ph56.split.prol.loopexit294.unr-lcssa:        ; preds = %.lr.ph56.split.prol297
  br label %.lr.ph56.split.prol.loopexit294

.lr.ph56.split.prol.loopexit294:                  ; preds = %.lr.ph56.split.prol.loopexit294.unr-lcssa, %.lr.ph56.split.preheader257
  br i1 undef, label %.preheader14.loopexit142, label %.lr.ph56.split.preheader257.new

.lr.ph56.split.preheader257.new:                  ; preds = %.lr.ph56.split.prol.loopexit294
  br label %.lr.ph56.split

.preheader14.thread:                              ; preds = %.lr.ph56.split.prol.loopexit
  br label %.lr.ph45

.lr.ph56.split.us:                                ; preds = %.lr.ph56.split.us.preheader, %._crit_edge51.us
  %129 = phi [2160 x float]* [ %157, %._crit_edge51.us ], [ %.lcssa35128, %.lr.ph56.split.us.preheader ]
  %130 = phi [2160 x float]* [ %149, %._crit_edge51.us ], [ %4, %.lr.ph56.split.us.preheader ]
  %storemerge355.us = phi i32 [ %162, %._crit_edge51.us ], [ 0, %.lr.ph56.split.us.preheader ]
  store float 0.000000e+00, float* %14, align 4
  store i32 0, i32* %12, align 4
  br label %._crit_edge253

._crit_edge253:                                   ; preds = %._crit_edge253, %.lr.ph56.split.us
  %131 = phi [2160 x float]* [ %129, %.lr.ph56.split.us ], [ %157, %._crit_edge253 ]
  %132 = phi [2160 x float]* [ %130, %.lr.ph56.split.us ], [ %149, %._crit_edge253 ]
  %133 = phi i32 [ %storemerge355.us, %.lr.ph56.split.us ], [ %152, %._crit_edge253 ]
  %134 = phi float [ 0.000000e+00, %.lr.ph56.split.us ], [ %155, %._crit_edge253 ]
  %135 = phi float [ 0.000000e+00, %.lr.ph56.split.us ], [ %159, %._crit_edge253 ]
  %136 = phi float [ 0.000000e+00, %.lr.ph56.split.us ], [ %156, %._crit_edge253 ]
  %storemerge848.us = phi i32 [ 0, %.lr.ph56.split.us ], [ %160, %._crit_edge253 ]
  %137 = sext i32 %storemerge848.us to i64
  %138 = sext i32 %133 to i64
  %139 = getelementptr inbounds [2160 x float], [2160 x float]* %132, i64 %137, i64 %138
  %140 = load float, float* %139, align 4
  %141 = fmul float %30, %140
  %142 = fmul float %34, %134
  %143 = fadd float %142, %141
  %144 = fmul float %exp2, %135
  %145 = fadd float %144, %143
  %146 = fmul float %136, %44
  %147 = fadd float %146, %145
  %148 = getelementptr inbounds [2160 x float], [2160 x float]* %131, i64 %137, i64 %138
  store float %147, float* %148, align 4
  %149 = load [2160 x float]*, [2160 x float]** %9, align 8
  %150 = load i32, i32* %12, align 4
  %151 = sext i32 %150 to i64
  %152 = load i32, i32* %13, align 4
  %153 = sext i32 %152 to i64
  %154 = getelementptr inbounds [2160 x float], [2160 x float]* %149, i64 %151, i64 %153
  %155 = load float, float* %154, align 4
  %156 = load float, float* %14, align 4
  %157 = load [2160 x float]*, [2160 x float]** %10, align 8
  %158 = getelementptr inbounds [2160 x float], [2160 x float]* %157, i64 %151, i64 %153
  %159 = load float, float* %158, align 4
  store float %159, float* %14, align 4
  %160 = add nsw i32 %150, 1
  store i32 %160, i32* %12, align 4
  %161 = icmp slt i32 %160, 4096
  br i1 %161, label %._crit_edge253, label %._crit_edge51.us

._crit_edge51.us:                                 ; preds = %._crit_edge253
  %162 = add nsw i32 %152, 1
  store i32 %162, i32* %13, align 4
  %163 = icmp slt i32 %162, 2160
  br i1 %163, label %.lr.ph56.split.us, label %.preheader14.loopexit

.preheader14.loopexit142.unr-lcssa:               ; preds = %.lr.ph56.split
  br label %.preheader14.loopexit142

.preheader14.loopexit142:                         ; preds = %.lr.ph56.split.prol.loopexit294, %.preheader14.loopexit142.unr-lcssa
  br label %.preheader14

.preheader14.loopexit:                            ; preds = %._crit_edge51.us
  br label %.preheader14

.preheader14:                                     ; preds = %.preheader14.loopexit, %.preheader14.loopexit142
  %.lcssa28 = phi [2160 x float]* [ %4, %.preheader14.loopexit142 ], [ %149, %.preheader14.loopexit ]
  %.lcssa27 = phi [2160 x float]* [ %.lcssa35128, %.preheader14.loopexit142 ], [ %157, %.preheader14.loopexit ]
  store i32 0, i32* %13, align 4
  br i1 true, label %.lr.ph45, label %.preheader13

.lr.ph45:                                         ; preds = %.preheader14, %.preheader14.thread
  %.lcssa27136 = phi [2160 x float]* [ %.lcssa35128, %.preheader14.thread ], [ %.lcssa27, %.preheader14 ]
  %.lcssa28134 = phi [2160 x float]* [ %4, %.preheader14.thread ], [ %.lcssa28, %.preheader14 ]
  br i1 true, label %.lr.ph45.split.us.preheader, label %.lr.ph45.split.preheader

.lr.ph45.split.us.preheader:                      ; preds = %.lr.ph45
  br label %.lr.ph45.split.us

.lr.ph45.split.preheader:                         ; preds = %.lr.ph45
  br i1 undef, label %.lr.ph45.split.prol.loopexit, label %.lr.ph45.split.prol.preheader

.lr.ph45.split.prol.preheader:                    ; preds = %.lr.ph45.split.preheader
  br label %.lr.ph45.split.prol

.lr.ph45.split.prol:                              ; preds = %.lr.ph45.split.prol.preheader, %.lr.ph45.split.prol
  br i1 true, label %.lr.ph45.split.prol.loopexit.loopexit, label %.lr.ph45.split.prol, !llvm.loop !15

.lr.ph45.split.prol.loopexit.loopexit:            ; preds = %.lr.ph45.split.prol
  br label %.lr.ph45.split.prol.loopexit

.lr.ph45.split.prol.loopexit:                     ; preds = %.lr.ph45.split.preheader, %.lr.ph45.split.prol.loopexit.loopexit
  br i1 undef, label %.preheader13, label %.lr.ph45.split.preheader256

.lr.ph45.split.preheader256:                      ; preds = %.lr.ph45.split.prol.loopexit
  br i1 undef, label %.lr.ph45.split.prol.preheader286, label %.lr.ph45.split.prol.loopexit287

.lr.ph45.split.prol.preheader286:                 ; preds = %.lr.ph45.split.preheader256
  br label %.lr.ph45.split.prol290

.lr.ph45.split.prol290:                           ; preds = %.lr.ph45.split.prol290, %.lr.ph45.split.prol.preheader286
  br i1 false, label %.lr.ph45.split.prol290, label %.lr.ph45.split.prol.loopexit287.unr-lcssa, !llvm.loop !16

.lr.ph45.split.prol.loopexit287.unr-lcssa:        ; preds = %.lr.ph45.split.prol290
  br label %.lr.ph45.split.prol.loopexit287

.lr.ph45.split.prol.loopexit287:                  ; preds = %.lr.ph45.split.prol.loopexit287.unr-lcssa, %.lr.ph45.split.preheader256
  br i1 undef, label %.preheader13.loopexit140, label %.lr.ph45.split.preheader256.new

.lr.ph45.split.preheader256.new:                  ; preds = %.lr.ph45.split.prol.loopexit287
  br label %.lr.ph45.split

.lr.ph45.split.us:                                ; preds = %.lr.ph45.split.us.preheader, %._crit_edge40.us
  %164 = phi [2160 x float]* [ %191, %._crit_edge40.us ], [ %.lcssa31130, %.lr.ph45.split.us.preheader ]
  %storemerge444.us = phi i32 [ %196, %._crit_edge40.us ], [ 0, %.lr.ph45.split.us.preheader ]
  store float 0.000000e+00, float* %16, align 4
  store float 0.000000e+00, float* %17, align 4
  store i32 4095, i32* %12, align 4
  br label %._crit_edge254

._crit_edge254:                                   ; preds = %._crit_edge254, %.lr.ph45.split.us
  %165 = phi i32 [ 4095, %.lr.ph45.split.us ], [ %194, %._crit_edge254 ]
  %166 = phi [2160 x float]* [ %164, %.lr.ph45.split.us ], [ %191, %._crit_edge254 ]
  %167 = phi i32 [ %storemerge444.us, %.lr.ph45.split.us ], [ %186, %._crit_edge254 ]
  %168 = phi float [ 0.000000e+00, %.lr.ph45.split.us ], [ %189, %._crit_edge254 ]
  %169 = phi float [ 0.000000e+00, %.lr.ph45.split.us ], [ %182, %._crit_edge254 ]
  %170 = phi float [ 0.000000e+00, %.lr.ph45.split.us ], [ %193, %._crit_edge254 ]
  %171 = phi float [ 0.000000e+00, %.lr.ph45.split.us ], [ %190, %._crit_edge254 ]
  %172 = fmul float %38, %168
  %173 = fmul float %169, %42
  %174 = fadd float %173, %172
  %175 = fmul float %exp2, %170
  %176 = fadd float %175, %174
  %177 = fmul float %171, %44
  %178 = fadd float %177, %176
  %179 = sext i32 %165 to i64
  %180 = sext i32 %167 to i64
  %181 = getelementptr inbounds [2160 x float], [2160 x float]* %166, i64 %179, i64 %180
  store float %178, float* %181, align 4
  %182 = load float, float* %16, align 4
  %183 = load [2160 x float]*, [2160 x float]** %9, align 8
  %184 = load i32, i32* %12, align 4
  %185 = sext i32 %184 to i64
  %186 = load i32, i32* %13, align 4
  %187 = sext i32 %186 to i64
  %188 = getelementptr inbounds [2160 x float], [2160 x float]* %183, i64 %185, i64 %187
  %189 = load float, float* %188, align 4
  store float %189, float* %16, align 4
  %190 = load float, float* %17, align 4
  %191 = load [2160 x float]*, [2160 x float]** %11, align 8
  %192 = getelementptr inbounds [2160 x float], [2160 x float]* %191, i64 %185, i64 %187
  %193 = load float, float* %192, align 4
  store float %193, float* %17, align 4
  %194 = add nsw i32 %184, -1
  store i32 %194, i32* %12, align 4
  %195 = icmp sgt i32 %184, 0
  br i1 %195, label %._crit_edge254, label %._crit_edge40.us

._crit_edge40.us:                                 ; preds = %._crit_edge254
  %196 = add nsw i32 %186, 1
  store i32 %196, i32* %13, align 4
  %197 = icmp slt i32 %196, 2160
  br i1 %197, label %.lr.ph45.split.us, label %.preheader13.loopexit

.lr.ph56.split:                                   ; preds = %.lr.ph56.split, %.lr.ph56.split.preheader257.new
  br i1 true, label %.preheader14.loopexit142.unr-lcssa, label %.lr.ph56.split

.preheader13.loopexit140.unr-lcssa:               ; preds = %.lr.ph45.split
  br label %.preheader13.loopexit140

.preheader13.loopexit140:                         ; preds = %.lr.ph45.split.prol.loopexit287, %.preheader13.loopexit140.unr-lcssa
  br label %.preheader13

.preheader13.loopexit:                            ; preds = %._crit_edge40.us
  br label %.preheader13

.preheader13:                                     ; preds = %.preheader13.loopexit, %.lr.ph45.split.prol.loopexit, %.preheader14, %.preheader13.loopexit140, %.preheader14.thread137
  %.lcssa27135 = phi [2160 x float]* [ %.lcssa35128, %.preheader14.thread137 ], [ %.lcssa27136, %.preheader13.loopexit140 ], [ %.lcssa27, %.preheader14 ], [ %.lcssa27136, %.lr.ph45.split.prol.loopexit ], [ %.lcssa27136, %.preheader13.loopexit ]
  %.lcssa23 = phi [2160 x float]* [ %4, %.preheader14.thread137 ], [ %.lcssa28134, %.preheader13.loopexit140 ], [ %.lcssa28, %.preheader14 ], [ %.lcssa28134, %.lr.ph45.split.prol.loopexit ], [ %183, %.preheader13.loopexit ]
  %.lcssa22 = phi [2160 x float]* [ %.lcssa31130, %.preheader14.thread137 ], [ %.lcssa31130, %.preheader13.loopexit140 ], [ %.lcssa31130, %.preheader14 ], [ %.lcssa31130, %.lr.ph45.split.prol.loopexit ], [ %191, %.preheader13.loopexit ]
  store i32 0, i32* %12, align 4
  br i1 true, label %.preheader.lr.ph, label %._crit_edge37

.preheader.lr.ph:                                 ; preds = %.preheader13
  br i1 true, label %.preheader.us.preheader, label %.preheader.preheader

.preheader.us.preheader:                          ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.preheader:                             ; preds = %.preheader.lr.ph
  br i1 undef, label %.preheader.prol.preheader, label %.preheader.prol.loopexit

.preheader.prol.preheader:                        ; preds = %.preheader.preheader
  br label %.preheader.prol

.preheader.prol:                                  ; preds = %.preheader.prol, %.preheader.prol.preheader
  br i1 false, label %.preheader.prol, label %.preheader.prol.loopexit.unr-lcssa, !llvm.loop !17

.preheader.prol.loopexit.unr-lcssa:               ; preds = %.preheader.prol
  br label %.preheader.prol.loopexit

.preheader.prol.loopexit:                         ; preds = %.preheader.prol.loopexit.unr-lcssa, %.preheader.preheader
  br i1 undef, label %._crit_edge37.loopexit138, label %.preheader.preheader.new

.preheader.preheader.new:                         ; preds = %.preheader.prol.loopexit
  br label %.preheader

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  store i32 0, i32* %13, align 4
  %198 = load i32, i32* %12, align 4
  br label %._crit_edge255

._crit_edge255:                                   ; preds = %._crit_edge255, %.preheader.us
  %199 = phi i32 [ %198, %.preheader.us ], [ %211, %._crit_edge255 ]
  %storemerge636.us = phi i32 [ 0, %.preheader.us ], [ %209, %._crit_edge255 ]
  %200 = sext i32 %199 to i64
  %201 = sext i32 %storemerge636.us to i64
  %202 = getelementptr inbounds [2160 x float], [2160 x float]* %.lcssa27135, i64 %200, i64 %201
  %203 = load float, float* %202, align 4
  %204 = getelementptr inbounds [2160 x float], [2160 x float]* %.lcssa22, i64 %200, i64 %201
  %205 = load float, float* %204, align 4
  %206 = fadd float %203, %205
  %207 = getelementptr inbounds [2160 x float], [2160 x float]* %.lcssa23, i64 %200, i64 %201
  store float %206, float* %207, align 4
  %208 = load i32, i32* %13, align 4
  %209 = add nsw i32 %208, 1
  store i32 %209, i32* %13, align 4
  %210 = icmp slt i32 %209, 2160
  %211 = load i32, i32* %12, align 4
  br i1 %210, label %._crit_edge255, label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge255
  %212 = add nsw i32 %211, 1
  store i32 %212, i32* %12, align 4
  %213 = icmp slt i32 %212, 4096
  br i1 %213, label %.preheader.us, label %._crit_edge37.loopexit

.lr.ph45.split:                                   ; preds = %.lr.ph45.split, %.lr.ph45.split.preheader256.new
  br i1 true, label %.preheader13.loopexit140.unr-lcssa, label %.lr.ph45.split

.preheader:                                       ; preds = %.preheader, %.preheader.preheader.new
  br i1 false, label %.preheader, label %._crit_edge37.loopexit138.unr-lcssa

._crit_edge37.loopexit138.unr-lcssa:              ; preds = %.preheader
  br label %._crit_edge37.loopexit138

._crit_edge37.loopexit138:                        ; preds = %.preheader.prol.loopexit, %._crit_edge37.loopexit138.unr-lcssa
  br label %._crit_edge37

._crit_edge37.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge37

._crit_edge37:                                    ; preds = %._crit_edge37.loopexit, %.preheader13, %._crit_edge37.loopexit138
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [2160 x float]* nocapture readonly) #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #6
  br i1 true, label %.preheader.lr.ph, label %._crit_edge1

.preheader.lr.ph:                                 ; preds = %3
  br i1 true, label %.preheader.lr.ph.split.us, label %._crit_edge1

.preheader.lr.ph.split.us:                        ; preds = %.preheader.lr.ph
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.lr.ph.split.us
  %indvars.iv2 = phi i64 [ 0, %.preheader.lr.ph.split.us ], [ %indvars.iv.next3, %._crit_edge.us ]
  %8 = mul nsw i64 %indvars.iv2, 2160
  br label %._crit_edge7

._crit_edge7:                                     ; preds = %._crit_edge, %.preheader.us
  %indvars.iv.us = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next.us, %._crit_edge ]
  %9 = add nsw i64 %indvars.iv.us, %8
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %._crit_edge

; <label>:13:                                     ; preds = %._crit_edge7
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge7, %13
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %16 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv2, i64 %indvars.iv.us
  %17 = load float, float* %16, align 4
  %18 = fpext float %17 to double
  %19 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %15, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %18) #6
  %indvars.iv.next.us = add nuw nsw i64 %indvars.iv.us, 1
  %exitcond.us = icmp eq i64 %indvars.iv.next.us, 2160
  br i1 %exitcond.us, label %._crit_edge.us, label %._crit_edge7

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next3 = add nuw nsw i64 %indvars.iv2, 1
  %exitcond5 = icmp eq i64 %indvars.iv.next3, 4096
  br i1 %exitcond5, label %._crit_edge1.loopexit, label %.preheader.us

._crit_edge1.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge1.loopexit, %.preheader.lr.ph, %3
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #6
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %22) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) #3

; Function Attrs: nounwind
declare float @expf(float) #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) #3

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
!17 = distinct !{!17, !7}
