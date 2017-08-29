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
  br i1 %13, label %14, label %19

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to [2160 x float]*
  call void @print_array(i32 4096, i32 2160, [2160 x float]* %18)
  br label %19

; <label>:19:                                     ; preds = %14, %17, %2
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
  br label %min.iters.checked

min.iters.checked:                                ; preds = %middle.block, %4
  %indvars.iv = phi i64 [ 0, %4 ], [ %indvars.iv.next, %middle.block ]
  %sext = mul nuw nsw i64 %indvars.iv, 1344324763648
  %5 = lshr exact i64 %sext, 32
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %5, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %min.iters.checked
  %index = phi i64 [ 0, %min.iters.checked ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %min.iters.checked ], [ %vec.ind.next, %vector.body ]
  %6 = mul nuw nsw <4 x i64> %vec.ind, <i64 991, i64 991, i64 991, i64 991>
  %7 = add <4 x i64> %6, %broadcast.splat
  %8 = trunc <4 x i64> %7 to <4 x i32>
  %9 = srem <4 x i32> %8, <i32 65536, i32 65536, i32 65536, i32 65536>
  %10 = sitofp <4 x i32> %9 to <4 x float>
  %11 = fdiv <4 x float> %10, <float 6.553500e+04, float 6.553500e+04, float 6.553500e+04, float 6.553500e+04>
  %12 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv, i64 %index
  %13 = bitcast float* %12 to <4 x float>*
  store <4 x float> %11, <4 x float>* %13, align 4
  %index.next = add nuw nsw i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %14 = icmp eq i64 %index.next, 2160
  br i1 %14, label %middle.block, label %vector.body, !llvm.loop !1

middle.block:                                     ; preds = %vector.body
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 4096
  br i1 %exitcond, label %15, label %min.iters.checked

; <label>:15:                                     ; preds = %middle.block
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
  %36 = fmul float %2, -2.000000e+00
  %37 = tail call float @expf(float %36) #5
  %exp2 = call float @llvm.exp2.f32(float %18)
  %38 = tail call float @expf(float %36) #5
  %39 = fsub float -0.000000e+00, %38
  store i32 0, i32* %12, align 4
  br label %40

; <label>:40:                                     ; preds = %7, %77
  %41 = phi i32 [ 0, %7 ], [ %78, %77 ]
  %42 = phi [2160 x float]* [ %5, %7 ], [ %72, %77 ]
  %43 = phi [2160 x float]* [ %3, %7 ], [ %64, %77 ]
  store float 0.000000e+00, float* %14, align 4
  store i32 0, i32* %13, align 4
  br label %44

; <label>:44:                                     ; preds = %40, %44
  %45 = phi [2160 x float]* [ %42, %40 ], [ %72, %44 ]
  %46 = phi i32 [ 0, %40 ], [ %75, %44 ]
  %47 = phi i32 [ %41, %40 ], [ %65, %44 ]
  %48 = phi [2160 x float]* [ %43, %40 ], [ %64, %44 ]
  %49 = phi float [ 0.000000e+00, %40 ], [ %70, %44 ]
  %50 = phi float [ 0.000000e+00, %40 ], [ %74, %44 ]
  %51 = phi float [ 0.000000e+00, %40 ], [ %71, %44 ]
  %52 = sext i32 %47 to i64
  %53 = sext i32 %46 to i64
  %54 = getelementptr inbounds [2160 x float], [2160 x float]* %48, i64 %52, i64 %53
  %55 = load float, float* %54, align 4
  %56 = fmul float %30, %55
  %57 = fmul float %34, %49
  %58 = fadd float %57, %56
  %59 = fmul float %exp2, %50
  %60 = fadd float %59, %58
  %61 = fmul float %51, %39
  %62 = fadd float %61, %60
  %63 = getelementptr inbounds [2160 x float], [2160 x float]* %45, i64 %52, i64 %53
  store float %62, float* %63, align 4
  %64 = load [2160 x float]*, [2160 x float]** %8, align 8
  %65 = load i32, i32* %12, align 4
  %66 = sext i32 %65 to i64
  %67 = load i32, i32* %13, align 4
  %68 = sext i32 %67 to i64
  %69 = getelementptr inbounds [2160 x float], [2160 x float]* %64, i64 %66, i64 %68
  %70 = load float, float* %69, align 4
  %71 = load float, float* %14, align 4
  %72 = load [2160 x float]*, [2160 x float]** %10, align 8
  %73 = getelementptr inbounds [2160 x float], [2160 x float]* %72, i64 %66, i64 %68
  %74 = load float, float* %73, align 4
  store float %74, float* %14, align 4
  %75 = add nsw i32 %67, 1
  store i32 %75, i32* %13, align 4
  %76 = icmp slt i32 %75, 2160
  br i1 %76, label %44, label %77

; <label>:77:                                     ; preds = %44
  %78 = add nsw i32 %65, 1
  store i32 %78, i32* %12, align 4
  %79 = icmp slt i32 %78, 4096
  br i1 %79, label %40, label %80

; <label>:80:                                     ; preds = %77
  %81 = fadd float %2, 1.000000e+00
  %82 = fmul float %30, %37
  %83 = fmul float %30, %35
  %84 = fmul float %81, %83
  %85 = fsub float -0.000000e+00, %82
  store i32 0, i32* %12, align 4
  br label %86

; <label>:86:                                     ; preds = %80, %121
  %87 = phi i32 [ 0, %80 ], [ %122, %121 ]
  %88 = phi [2160 x float]* [ %6, %80 ], [ %116, %121 ]
  store float 0.000000e+00, float* %17, align 4
  store float 0.000000e+00, float* %15, align 4
  store i32 2159, i32* %13, align 4
  br label %89

; <label>:89:                                     ; preds = %86, %89
  %90 = phi [2160 x float]* [ %88, %86 ], [ %116, %89 ]
  %91 = phi i32 [ 2159, %86 ], [ %119, %89 ]
  %92 = phi i32 [ %87, %86 ], [ %109, %89 ]
  %93 = phi float [ 0.000000e+00, %86 ], [ %114, %89 ]
  %94 = phi float [ 0.000000e+00, %86 ], [ %107, %89 ]
  %95 = phi float [ 0.000000e+00, %86 ], [ %118, %89 ]
  %96 = phi float [ 0.000000e+00, %86 ], [ %115, %89 ]
  %97 = fmul float %84, %93
  %98 = fmul float %94, %85
  %99 = fadd float %98, %97
  %100 = fmul float %exp2, %95
  %101 = fadd float %100, %99
  %102 = fmul float %96, %39
  %103 = fadd float %102, %101
  %104 = sext i32 %92 to i64
  %105 = sext i32 %91 to i64
  %106 = getelementptr inbounds [2160 x float], [2160 x float]* %90, i64 %104, i64 %105
  store float %103, float* %106, align 4
  %107 = load float, float* %15, align 4
  %108 = load [2160 x float]*, [2160 x float]** %8, align 8
  %109 = load i32, i32* %12, align 4
  %110 = sext i32 %109 to i64
  %111 = load i32, i32* %13, align 4
  %112 = sext i32 %111 to i64
  %113 = getelementptr inbounds [2160 x float], [2160 x float]* %108, i64 %110, i64 %112
  %114 = load float, float* %113, align 4
  store float %114, float* %15, align 4
  %115 = load float, float* %17, align 4
  %116 = load [2160 x float]*, [2160 x float]** %11, align 8
  %117 = getelementptr inbounds [2160 x float], [2160 x float]* %116, i64 %110, i64 %112
  %118 = load float, float* %117, align 4
  store float %118, float* %17, align 4
  %119 = add nsw i32 %111, -1
  store i32 %119, i32* %13, align 4
  %120 = icmp sgt i32 %111, 0
  br i1 %120, label %89, label %121

; <label>:121:                                    ; preds = %89
  %122 = add nsw i32 %109, 1
  store i32 %122, i32* %12, align 4
  %123 = icmp slt i32 %122, 4096
  br i1 %123, label %86, label %124

; <label>:124:                                    ; preds = %121
  store i32 0, i32* %12, align 4
  store i32 0, i32* %13, align 4
  br label %.preheader21

.preheader21:                                     ; preds = %middle.block, %124
  %indvars.iv62 = phi i64 [ 0, %124 ], [ %indvars.iv.next63, %middle.block ]
  %scevgep = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv62, i64 0
  %125 = add nuw nsw i64 %indvars.iv62, 1
  %scevgep96 = getelementptr [2160 x float], [2160 x float]* %4, i64 %125, i64 0
  %scevgep98 = getelementptr [2160 x float], [2160 x float]* %72, i64 %indvars.iv62, i64 0
  %scevgep100 = getelementptr [2160 x float], [2160 x float]* %72, i64 %125, i64 0
  %scevgep102 = getelementptr [2160 x float], [2160 x float]* %116, i64 %indvars.iv62, i64 0
  %scevgep104 = getelementptr [2160 x float], [2160 x float]* %116, i64 %125, i64 0
  %bound0 = icmp ult float* %scevgep, %scevgep100
  %bound1 = icmp ult float* %scevgep98, %scevgep96
  %found.conflict = and i1 %bound0, %bound1
  %bound0106 = icmp ult float* %scevgep, %scevgep104
  %bound1107 = icmp ult float* %scevgep102, %scevgep96
  %found.conflict108 = and i1 %bound0106, %bound1107
  %conflict.rdx = or i1 %found.conflict, %found.conflict108
  br i1 %conflict.rdx, label %scalar.ph.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.preheader21
  br label %vector.body

scalar.ph.preheader:                              ; preds = %.preheader21
  br label %scalar.ph

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %offset.idx = shl i64 %index, 1
  %126 = getelementptr inbounds [2160 x float], [2160 x float]* %72, i64 %indvars.iv62, i64 %offset.idx
  %127 = bitcast float* %126 to <8 x float>*
  %wide.vec = load <8 x float>, <8 x float>* %127, align 4, !alias.scope !4
  %128 = getelementptr inbounds [2160 x float], [2160 x float]* %116, i64 %indvars.iv62, i64 %offset.idx
  %129 = bitcast float* %128 to <8 x float>*
  %wide.vec110 = load <8 x float>, <8 x float>* %129, align 4, !alias.scope !7
  %130 = fadd <8 x float> %wide.vec, %wide.vec110
  %131 = shufflevector <8 x float> %130, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %132 = or i64 %offset.idx, 1
  %133 = fadd <8 x float> %wide.vec, %wide.vec110
  %134 = shufflevector <8 x float> %133, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %135 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv62, i64 %132
  %136 = getelementptr float, float* %135, i64 -1
  %137 = bitcast float* %136 to <8 x float>*
  %interleaved.vec = shufflevector <4 x float> %131, <4 x float> %134, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec, <8 x float>* %137, align 4, !alias.scope !9, !noalias !11
  %index.next = add nuw nsw i64 %index, 4
  %138 = icmp eq i64 %index.next, 1080
  br i1 %138, label %middle.block.loopexit179, label %vector.body, !llvm.loop !12

.preheader:                                       ; preds = %middle.block
  store i32 0, i32* %13, align 4
  store i32 4096, i32* %12, align 4
  br label %151

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv59 = phi i64 [ %indvars.iv.next60.1, %scalar.ph ], [ 0, %scalar.ph.preheader ]
  %139 = getelementptr inbounds [2160 x float], [2160 x float]* %72, i64 %indvars.iv62, i64 %indvars.iv59
  %140 = load float, float* %139, align 4
  %141 = getelementptr inbounds [2160 x float], [2160 x float]* %116, i64 %indvars.iv62, i64 %indvars.iv59
  %142 = load float, float* %141, align 4
  %143 = fadd float %140, %142
  %144 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv62, i64 %indvars.iv59
  store float %143, float* %144, align 4
  %indvars.iv.next60 = or i64 %indvars.iv59, 1
  %145 = getelementptr inbounds [2160 x float], [2160 x float]* %72, i64 %indvars.iv62, i64 %indvars.iv.next60
  %146 = load float, float* %145, align 4
  %147 = getelementptr inbounds [2160 x float], [2160 x float]* %116, i64 %indvars.iv62, i64 %indvars.iv.next60
  %148 = load float, float* %147, align 4
  %149 = fadd float %146, %148
  %150 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv62, i64 %indvars.iv.next60
  store float %149, float* %150, align 4
  %indvars.iv.next60.1 = add nuw nsw i64 %indvars.iv59, 2
  %exitcond61.1 = icmp eq i64 %indvars.iv.next60.1, 2160
  br i1 %exitcond61.1, label %middle.block.loopexit, label %scalar.ph, !llvm.loop !13

middle.block.loopexit:                            ; preds = %scalar.ph
  br label %middle.block

middle.block.loopexit179:                         ; preds = %vector.body
  br label %middle.block

middle.block:                                     ; preds = %middle.block.loopexit179, %middle.block.loopexit
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond64 = icmp eq i64 %indvars.iv.next63, 4096
  br i1 %exitcond64, label %.preheader, label %.preheader21

; <label>:151:                                    ; preds = %.preheader, %188
  %152 = phi i32 [ 0, %.preheader ], [ %189, %188 ]
  %153 = phi [2160 x float]* [ %72, %.preheader ], [ %183, %188 ]
  %154 = phi [2160 x float]* [ %4, %.preheader ], [ %175, %188 ]
  store float 0.000000e+00, float* %14, align 4
  store i32 0, i32* %12, align 4
  br label %155

; <label>:155:                                    ; preds = %151, %155
  %156 = phi [2160 x float]* [ %153, %151 ], [ %183, %155 ]
  %157 = phi [2160 x float]* [ %154, %151 ], [ %175, %155 ]
  %158 = phi i32 [ 0, %151 ], [ %186, %155 ]
  %159 = phi i32 [ %152, %151 ], [ %178, %155 ]
  %160 = phi float [ 0.000000e+00, %151 ], [ %181, %155 ]
  %161 = phi float [ 0.000000e+00, %151 ], [ %185, %155 ]
  %162 = phi float [ 0.000000e+00, %151 ], [ %182, %155 ]
  %163 = sext i32 %158 to i64
  %164 = sext i32 %159 to i64
  %165 = getelementptr inbounds [2160 x float], [2160 x float]* %157, i64 %163, i64 %164
  %166 = load float, float* %165, align 4
  %167 = fmul float %30, %166
  %168 = fmul float %34, %160
  %169 = fadd float %168, %167
  %170 = fmul float %exp2, %161
  %171 = fadd float %170, %169
  %172 = fmul float %162, %39
  %173 = fadd float %172, %171
  %174 = getelementptr inbounds [2160 x float], [2160 x float]* %156, i64 %163, i64 %164
  store float %173, float* %174, align 4
  %175 = load [2160 x float]*, [2160 x float]** %9, align 8
  %176 = load i32, i32* %12, align 4
  %177 = sext i32 %176 to i64
  %178 = load i32, i32* %13, align 4
  %179 = sext i32 %178 to i64
  %180 = getelementptr inbounds [2160 x float], [2160 x float]* %175, i64 %177, i64 %179
  %181 = load float, float* %180, align 4
  %182 = load float, float* %14, align 4
  %183 = load [2160 x float]*, [2160 x float]** %10, align 8
  %184 = getelementptr inbounds [2160 x float], [2160 x float]* %183, i64 %177, i64 %179
  %185 = load float, float* %184, align 4
  store float %185, float* %14, align 4
  %186 = add nsw i32 %176, 1
  store i32 %186, i32* %12, align 4
  %187 = icmp slt i32 %186, 4096
  br i1 %187, label %155, label %188

; <label>:188:                                    ; preds = %155
  %189 = add nsw i32 %178, 1
  store i32 %189, i32* %13, align 4
  %190 = icmp slt i32 %189, 2160
  br i1 %190, label %151, label %191

; <label>:191:                                    ; preds = %188
  store i32 0, i32* %13, align 4
  br label %192

; <label>:192:                                    ; preds = %191, %227
  %193 = phi i32 [ 0, %191 ], [ %228, %227 ]
  %194 = phi [2160 x float]* [ %116, %191 ], [ %222, %227 ]
  store float 0.000000e+00, float* %16, align 4
  store float 0.000000e+00, float* %17, align 4
  store i32 4095, i32* %12, align 4
  br label %195

; <label>:195:                                    ; preds = %192, %195
  %196 = phi [2160 x float]* [ %194, %192 ], [ %222, %195 ]
  %197 = phi i32 [ 4095, %192 ], [ %225, %195 ]
  %198 = phi i32 [ %193, %192 ], [ %217, %195 ]
  %199 = phi float [ 0.000000e+00, %192 ], [ %220, %195 ]
  %200 = phi float [ 0.000000e+00, %192 ], [ %213, %195 ]
  %201 = phi float [ 0.000000e+00, %192 ], [ %224, %195 ]
  %202 = phi float [ 0.000000e+00, %192 ], [ %221, %195 ]
  %203 = fmul float %84, %199
  %204 = fmul float %200, %85
  %205 = fadd float %204, %203
  %206 = fmul float %exp2, %201
  %207 = fadd float %206, %205
  %208 = fmul float %202, %39
  %209 = fadd float %208, %207
  %210 = sext i32 %197 to i64
  %211 = sext i32 %198 to i64
  %212 = getelementptr inbounds [2160 x float], [2160 x float]* %196, i64 %210, i64 %211
  store float %209, float* %212, align 4
  %213 = load float, float* %16, align 4
  %214 = load [2160 x float]*, [2160 x float]** %9, align 8
  %215 = load i32, i32* %12, align 4
  %216 = sext i32 %215 to i64
  %217 = load i32, i32* %13, align 4
  %218 = sext i32 %217 to i64
  %219 = getelementptr inbounds [2160 x float], [2160 x float]* %214, i64 %216, i64 %218
  %220 = load float, float* %219, align 4
  store float %220, float* %16, align 4
  %221 = load float, float* %17, align 4
  %222 = load [2160 x float]*, [2160 x float]** %11, align 8
  %223 = getelementptr inbounds [2160 x float], [2160 x float]* %222, i64 %216, i64 %218
  %224 = load float, float* %223, align 4
  store float %224, float* %17, align 4
  %225 = add nsw i32 %215, -1
  store i32 %225, i32* %12, align 4
  %226 = icmp sgt i32 %215, 0
  br i1 %226, label %195, label %227

; <label>:227:                                    ; preds = %195
  %228 = add nsw i32 %217, 1
  store i32 %228, i32* %13, align 4
  %229 = icmp slt i32 %228, 2160
  br i1 %229, label %192, label %230

; <label>:230:                                    ; preds = %227
  store i32 0, i32* %12, align 4
  br label %min.iters.checked116

min.iters.checked116:                             ; preds = %middle.block114, %230
  %indvars.iv57 = phi i64 [ 0, %230 ], [ %indvars.iv.next58, %middle.block114 ]
  %scevgep118 = getelementptr [2160 x float], [2160 x float]* %214, i64 %indvars.iv57, i64 0
  %231 = add nuw nsw i64 %indvars.iv57, 1
  %scevgep120 = getelementptr [2160 x float], [2160 x float]* %214, i64 %231, i64 0
  %scevgep122 = getelementptr [2160 x float], [2160 x float]* %183, i64 %indvars.iv57, i64 0
  %scevgep124 = getelementptr [2160 x float], [2160 x float]* %183, i64 %231, i64 0
  %scevgep126 = getelementptr [2160 x float], [2160 x float]* %222, i64 %indvars.iv57, i64 0
  %scevgep128 = getelementptr [2160 x float], [2160 x float]* %222, i64 %231, i64 0
  %bound0130 = icmp ult float* %scevgep118, %scevgep124
  %bound1131 = icmp ult float* %scevgep122, %scevgep120
  %found.conflict132 = and i1 %bound0130, %bound1131
  %bound0133 = icmp ult float* %scevgep118, %scevgep128
  %bound1134 = icmp ult float* %scevgep126, %scevgep120
  %found.conflict135 = and i1 %bound0133, %bound1134
  %conflict.rdx136 = or i1 %found.conflict132, %found.conflict135
  br i1 %conflict.rdx136, label %scalar.ph115.preheader, label %vector.body113.preheader

vector.body113.preheader:                         ; preds = %min.iters.checked116
  br label %vector.body113

scalar.ph115.preheader:                           ; preds = %min.iters.checked116
  br label %scalar.ph115

vector.body113:                                   ; preds = %vector.body113.preheader, %vector.body113
  %index140 = phi i64 [ %index.next141, %vector.body113 ], [ 0, %vector.body113.preheader ]
  %offset.idx144 = shl i64 %index140, 1
  %232 = getelementptr inbounds [2160 x float], [2160 x float]* %183, i64 %indvars.iv57, i64 %offset.idx144
  %233 = bitcast float* %232 to <8 x float>*
  %wide.vec148 = load <8 x float>, <8 x float>* %233, align 4, !alias.scope !14
  %234 = getelementptr inbounds [2160 x float], [2160 x float]* %222, i64 %indvars.iv57, i64 %offset.idx144
  %235 = bitcast float* %234 to <8 x float>*
  %wide.vec151 = load <8 x float>, <8 x float>* %235, align 4, !alias.scope !17
  %236 = fadd <8 x float> %wide.vec148, %wide.vec151
  %237 = shufflevector <8 x float> %236, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %238 = or i64 %offset.idx144, 1
  %239 = fadd <8 x float> %wide.vec148, %wide.vec151
  %240 = shufflevector <8 x float> %239, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %241 = getelementptr inbounds [2160 x float], [2160 x float]* %214, i64 %indvars.iv57, i64 %238
  %242 = getelementptr float, float* %241, i64 -1
  %243 = bitcast float* %242 to <8 x float>*
  %interleaved.vec154 = shufflevector <4 x float> %237, <4 x float> %240, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec154, <8 x float>* %243, align 4, !alias.scope !19, !noalias !21
  %index.next141 = add nuw nsw i64 %index140, 4
  %244 = icmp eq i64 %index.next141, 1080
  br i1 %244, label %middle.block114.loopexit178, label %vector.body113, !llvm.loop !22

scalar.ph115:                                     ; preds = %scalar.ph115.preheader, %scalar.ph115
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %scalar.ph115 ], [ 0, %scalar.ph115.preheader ]
  %245 = getelementptr inbounds [2160 x float], [2160 x float]* %183, i64 %indvars.iv57, i64 %indvars.iv
  %246 = load float, float* %245, align 4
  %247 = getelementptr inbounds [2160 x float], [2160 x float]* %222, i64 %indvars.iv57, i64 %indvars.iv
  %248 = load float, float* %247, align 4
  %249 = fadd float %246, %248
  %250 = getelementptr inbounds [2160 x float], [2160 x float]* %214, i64 %indvars.iv57, i64 %indvars.iv
  store float %249, float* %250, align 4
  %indvars.iv.next = or i64 %indvars.iv, 1
  %251 = getelementptr inbounds [2160 x float], [2160 x float]* %183, i64 %indvars.iv57, i64 %indvars.iv.next
  %252 = load float, float* %251, align 4
  %253 = getelementptr inbounds [2160 x float], [2160 x float]* %222, i64 %indvars.iv57, i64 %indvars.iv.next
  %254 = load float, float* %253, align 4
  %255 = fadd float %252, %254
  %256 = getelementptr inbounds [2160 x float], [2160 x float]* %214, i64 %indvars.iv57, i64 %indvars.iv.next
  store float %255, float* %256, align 4
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2160
  br i1 %exitcond.1, label %middle.block114.loopexit, label %scalar.ph115, !llvm.loop !23

middle.block114.loopexit:                         ; preds = %scalar.ph115
  br label %middle.block114

middle.block114.loopexit178:                      ; preds = %vector.body113
  br label %middle.block114

middle.block114:                                  ; preds = %middle.block114.loopexit178, %middle.block114.loopexit
  %indvars.iv.next58 = add nuw nsw i64 %indvars.iv57, 1
  %exitcond = icmp eq i64 %indvars.iv.next58, 4096
  br i1 %exitcond, label %257, label %min.iters.checked116

; <label>:257:                                    ; preds = %middle.block114
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [2160 x float]* nocapture readonly) #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %8

; <label>:8:                                      ; preds = %23, %3
  %indvars.iv1 = phi i64 [ 0, %3 ], [ %indvars.iv.next2, %23 ]
  %9 = mul nuw nsw i64 %indvars.iv1, 2160
  br label %10

; <label>:10:                                     ; preds = %17, %8
  %indvars.iv = phi i64 [ 0, %8 ], [ %indvars.iv.next, %17 ]
  %11 = add nuw nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %17

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %16) #6
  br label %17

; <label>:17:                                     ; preds = %15, %10
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv1, i64 %indvars.iv
  %20 = load float, float* %19, align 4
  %21 = fpext float %20 to double
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %21) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2160
  br i1 %exitcond, label %23, label %10

; <label>:23:                                     ; preds = %17
  %indvars.iv.next2 = add nuw nsw i64 %indvars.iv1, 1
  %exitcond3 = icmp eq i64 %indvars.iv.next2, 4096
  br i1 %exitcond3, label %24, label %8

; <label>:24:                                     ; preds = %23
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %27) #6
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
