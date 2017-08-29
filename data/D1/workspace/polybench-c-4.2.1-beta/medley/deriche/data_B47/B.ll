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
  %4 = call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %5 = call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %6 = call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %7 = call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
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
  br i1 %13, label %14, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %.._crit_edge_crit_edge19

.._crit_edge_crit_edge19:                         ; preds = %14
  br label %._crit_edge

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to [2160 x float]*
  call void @print_array(i32 4096, i32 2160, [2160 x float]* %18)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge19, %.._crit_edge_crit_edge, %17
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

min.iters.checked:                                ; preds = %middle.block.min.iters.checked_crit_edge, %4
  %indvars.iv14 = phi i64 [ 0, %4 ], [ %indvars.iv.next15, %middle.block.min.iters.checked_crit_edge ]
  %5 = mul nuw nsw i64 %indvars.iv14, 313
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %5, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %min.iters.checked
  %index = phi i64 [ 0, %min.iters.checked ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %min.iters.checked ], [ %vec.ind.next, %vector.body.vector.body_crit_edge ]
  %6 = mul nuw nsw <4 x i64> %vec.ind, <i64 991, i64 991, i64 991, i64 991>
  %7 = add nuw nsw <4 x i64> %6, %broadcast.splat
  %8 = trunc <4 x i64> %7 to <4 x i32>
  %9 = srem <4 x i32> %8, <i32 65536, i32 65536, i32 65536, i32 65536>
  %10 = sitofp <4 x i32> %9 to <4 x float>
  %11 = fdiv <4 x float> %10, <float 6.553500e+04, float 6.553500e+04, float 6.553500e+04, float 6.553500e+04>
  %12 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv14, i64 %index
  %13 = bitcast float* %12 to <4 x float>*
  store <4 x float> %11, <4 x float>* %13, align 4
  %index.next = add nuw nsw i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %14 = icmp eq i64 %index.next, 2160
  br i1 %14, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !1

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 4096
  br i1 %exitcond16, label %15, label %middle.block.min.iters.checked_crit_edge

middle.block.min.iters.checked_crit_edge:         ; preds = %middle.block
  br label %min.iters.checked

; <label>:15:                                     ; preds = %middle.block
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_deriche(i32, i32, float, [2160 x float]* nocapture readonly, [2160 x float]* nocapture, [2160 x float]* nocapture, [2160 x float]* nocapture) #0 {
  %8 = fsub float -0.000000e+00, %2
  %9 = call float @expf(float %8) #5
  %10 = fsub float 1.000000e+00, %9
  %11 = call float @expf(float %8) #5
  %12 = fsub float 1.000000e+00, %11
  %13 = fmul float %10, %12
  %14 = fmul float %2, 2.000000e+00
  %15 = call float @expf(float %8) #5
  %16 = fmul float %14, %15
  %17 = fadd float %16, 1.000000e+00
  %18 = call float @expf(float %14) #5
  %19 = fsub float %17, %18
  %20 = fdiv float %13, %19
  %21 = call float @expf(float %8) #5
  %22 = fmul float %21, %20
  %23 = fadd float %2, -1.000000e+00
  %24 = fmul float %23, %22
  %25 = call float @expf(float %8) #5
  %26 = fmul float %2, -2.000000e+00
  %27 = call float @expf(float %26) #5
  %exp2 = call float @llvm.exp2.f32(float %8)
  %28 = call float @expf(float %26) #5
  %29 = fsub float -0.000000e+00, %28
  %30 = insertelement <2 x float> undef, float %24, i32 0
  %31 = insertelement <2 x float> %30, float %20, i32 1
  br label %32

; <label>:32:                                     ; preds = %._crit_edge240, %7
  %indvars.iv223 = phi i64 [ 0, %7 ], [ %indvars.iv.next224, %._crit_edge240 ]
  br label %33

; <label>:33:                                     ; preds = %._crit_edge, %32
  %indvars.iv220 = phi i64 [ 0, %32 ], [ %indvars.iv.next221.1, %._crit_edge ]
  %.0155192 = phi float [ 0.000000e+00, %32 ], [ %56, %._crit_edge ]
  %.0157191 = phi float [ 0.000000e+00, %32 ], [ %53, %._crit_edge ]
  %.0159190 = phi float [ 0.000000e+00, %32 ], [ %42, %._crit_edge ]
  %34 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv223, i64 %indvars.iv220
  %35 = load float, float* %34, align 4
  %36 = fmul float %20, %35
  %37 = fmul float %24, %.0155192
  %38 = fadd float %37, %36
  %39 = fmul float %exp2, %.0157191
  %40 = fadd float %39, %38
  %41 = fmul float %.0159190, %29
  %42 = fadd float %41, %40
  %43 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv223, i64 %indvars.iv220
  store float %42, float* %43, align 4
  %44 = bitcast float* %34 to <2 x float>*
  %indvars.iv.next221 = or i64 %indvars.iv220, 1
  %45 = load <2 x float>, <2 x float>* %44, align 4
  %46 = fmul <2 x float> %31, %45
  %47 = extractelement <2 x float> %46, i32 0
  %48 = extractelement <2 x float> %46, i32 1
  %49 = fadd float %47, %48
  %50 = fmul float %exp2, %42
  %51 = fadd float %50, %49
  %52 = fmul float %.0157191, %29
  %53 = fadd float %52, %51
  %54 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv223, i64 %indvars.iv.next221
  store float %53, float* %54, align 4
  %indvars.iv.next221.1 = add nuw nsw i64 %indvars.iv220, 2
  %exitcond222.1 = icmp eq i64 %indvars.iv.next221.1, 2160
  br i1 %exitcond222.1, label %57, label %._crit_edge

._crit_edge:                                      ; preds = %33
  %55 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv223, i64 %indvars.iv.next221
  %56 = load float, float* %55, align 4
  br label %33

; <label>:57:                                     ; preds = %33
  %indvars.iv.next224 = add nuw nsw i64 %indvars.iv223, 1
  %exitcond225 = icmp eq i64 %indvars.iv.next224, 4096
  br i1 %exitcond225, label %58, label %._crit_edge240

._crit_edge240:                                   ; preds = %57
  br label %32

; <label>:58:                                     ; preds = %57
  %59 = fadd float %2, 1.000000e+00
  %60 = fmul float %25, %20
  %61 = fmul float %59, %60
  %62 = fmul float %20, %27
  %63 = fsub float -0.000000e+00, %62
  br label %64

; <label>:64:                                     ; preds = %._crit_edge241, %58
  %indvars.iv217 = phi i64 [ 0, %58 ], [ %indvars.iv.next218, %._crit_edge241 ]
  br label %65

; <label>:65:                                     ; preds = %._crit_edge230, %64
  %indvars.iv215 = phi i64 [ 2159, %64 ], [ %indvars.iv.next216.1, %._crit_edge230 ]
  %.0161187 = phi float [ 0.000000e+00, %64 ], [ %86, %._crit_edge230 ]
  %.0162186 = phi float [ 0.000000e+00, %64 ], [ %75, %._crit_edge230 ]
  %.0165185 = phi float [ 0.000000e+00, %64 ], [ %82, %._crit_edge230 ]
  %.0167184 = phi float [ 0.000000e+00, %64 ], [ %72, %._crit_edge230 ]
  %66 = fmul float %61, %.0161187
  %67 = fmul float %.0162186, %63
  %68 = fadd float %67, %66
  %69 = fmul float %exp2, %.0165185
  %70 = fadd float %69, %68
  %71 = fmul float %.0167184, %29
  %72 = fadd float %71, %70
  %73 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv217, i64 %indvars.iv215
  store float %72, float* %73, align 4
  %74 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv217, i64 %indvars.iv215
  %75 = load float, float* %74, align 4
  %indvars.iv.next216 = add nsw i64 %indvars.iv215, -1
  %76 = fmul float %61, %75
  %77 = fmul float %.0161187, %63
  %78 = fadd float %77, %76
  %79 = fmul float %exp2, %72
  %80 = fadd float %79, %78
  %81 = fmul float %.0165185, %29
  %82 = fadd float %81, %80
  %83 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv217, i64 %indvars.iv.next216
  store float %82, float* %83, align 4
  %84 = icmp sgt i64 %indvars.iv215, 1
  br i1 %84, label %._crit_edge230, label %87

._crit_edge230:                                   ; preds = %65
  %indvars.iv.next216.1 = add nsw i64 %indvars.iv215, -2
  %85 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv217, i64 %indvars.iv.next216
  %86 = load float, float* %85, align 4
  br label %65

; <label>:87:                                     ; preds = %65
  %indvars.iv.next218 = add nuw nsw i64 %indvars.iv217, 1
  %exitcond219 = icmp eq i64 %indvars.iv.next218, 4096
  br i1 %exitcond219, label %.preheader228.preheader, label %._crit_edge241

._crit_edge241:                                   ; preds = %87
  br label %64

.preheader228.preheader:                          ; preds = %87
  br label %.preheader228

.preheader228:                                    ; preds = %..preheader228_crit_edge, %.preheader228.preheader
  %indvars.iv212 = phi i64 [ %indvars.iv.next213, %..preheader228_crit_edge ], [ 0, %.preheader228.preheader ]
  br label %88

; <label>:88:                                     ; preds = %._crit_edge242, %.preheader228
  %indvars.iv209 = phi i64 [ 0, %.preheader228 ], [ %indvars.iv.next210.2, %._crit_edge242 ]
  %89 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv212, i64 %indvars.iv209
  %90 = load float, float* %89, align 4
  %91 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv212, i64 %indvars.iv209
  %92 = load float, float* %91, align 4
  %93 = fadd float %90, %92
  %94 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv212, i64 %indvars.iv209
  store float %93, float* %94, align 4
  %indvars.iv.next210 = add nuw nsw i64 %indvars.iv209, 1
  %95 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv212, i64 %indvars.iv.next210
  %96 = load float, float* %95, align 4
  %97 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv212, i64 %indvars.iv.next210
  %98 = load float, float* %97, align 4
  %99 = fadd float %96, %98
  %100 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv212, i64 %indvars.iv.next210
  store float %99, float* %100, align 4
  %indvars.iv.next210.1 = add nuw nsw i64 %indvars.iv209, 2
  %101 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv212, i64 %indvars.iv.next210.1
  %102 = load float, float* %101, align 4
  %103 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv212, i64 %indvars.iv.next210.1
  %104 = load float, float* %103, align 4
  %105 = fadd float %102, %104
  %106 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv212, i64 %indvars.iv.next210.1
  store float %105, float* %106, align 4
  %indvars.iv.next210.2 = add nuw nsw i64 %indvars.iv209, 3
  %exitcond211.2 = icmp eq i64 %indvars.iv.next210.2, 2160
  br i1 %exitcond211.2, label %107, label %._crit_edge242

._crit_edge242:                                   ; preds = %88
  br label %88

; <label>:107:                                    ; preds = %88
  %indvars.iv.next213 = add nuw nsw i64 %indvars.iv212, 1
  %exitcond214 = icmp eq i64 %indvars.iv.next213, 4096
  br i1 %exitcond214, label %.preheader227.preheader, label %..preheader228_crit_edge

..preheader228_crit_edge:                         ; preds = %107
  br label %.preheader228

.preheader227.preheader:                          ; preds = %107
  br label %.preheader227

.preheader227:                                    ; preds = %..preheader227_crit_edge, %.preheader227.preheader
  %indvars.iv206 = phi i64 [ %indvars.iv.next207, %..preheader227_crit_edge ], [ 0, %.preheader227.preheader ]
  br label %108

; <label>:108:                                    ; preds = %._crit_edge234, %.preheader227
  %indvars.iv203 = phi i64 [ 0, %.preheader227 ], [ %indvars.iv.next204.1, %._crit_edge234 ]
  %.0156179 = phi float [ 0.000000e+00, %.preheader227 ], [ %130, %._crit_edge234 ]
  %.1158178 = phi float [ 0.000000e+00, %.preheader227 ], [ %128, %._crit_edge234 ]
  %.1160177 = phi float [ 0.000000e+00, %.preheader227 ], [ %117, %._crit_edge234 ]
  %109 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv203, i64 %indvars.iv206
  %110 = load float, float* %109, align 4
  %111 = fmul float %20, %110
  %112 = fmul float %24, %.0156179
  %113 = fadd float %112, %111
  %114 = fmul float %exp2, %.1158178
  %115 = fadd float %114, %113
  %116 = fmul float %.1160177, %29
  %117 = fadd float %116, %115
  %118 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv203, i64 %indvars.iv206
  store float %117, float* %118, align 4
  %119 = load float, float* %109, align 4
  %indvars.iv.next204 = or i64 %indvars.iv203, 1
  %120 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next204, i64 %indvars.iv206
  %121 = load float, float* %120, align 4
  %122 = fmul float %20, %121
  %123 = fmul float %24, %119
  %124 = fadd float %123, %122
  %125 = fmul float %exp2, %117
  %126 = fadd float %125, %124
  %127 = fmul float %.1158178, %29
  %128 = fadd float %127, %126
  %129 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv.next204, i64 %indvars.iv206
  store float %128, float* %129, align 4
  %indvars.iv.next204.1 = add nuw nsw i64 %indvars.iv203, 2
  %exitcond205.1 = icmp eq i64 %indvars.iv.next204.1, 4096
  br i1 %exitcond205.1, label %131, label %._crit_edge234

._crit_edge234:                                   ; preds = %108
  %130 = load float, float* %120, align 4
  br label %108

; <label>:131:                                    ; preds = %108
  %indvars.iv.next207 = add nuw nsw i64 %indvars.iv206, 1
  %exitcond208 = icmp eq i64 %indvars.iv.next207, 2160
  br i1 %exitcond208, label %.preheader226.preheader, label %..preheader227_crit_edge

..preheader227_crit_edge:                         ; preds = %131
  br label %.preheader227

.preheader226.preheader:                          ; preds = %131
  br label %.preheader226

.preheader226:                                    ; preds = %..preheader226_crit_edge, %.preheader226.preheader
  %indvars.iv200 = phi i64 [ %indvars.iv.next201, %..preheader226_crit_edge ], [ 0, %.preheader226.preheader ]
  br label %132

; <label>:132:                                    ; preds = %._crit_edge236, %.preheader226
  %indvars.iv198 = phi i64 [ 4095, %.preheader226 ], [ %indvars.iv.next199.1, %._crit_edge236 ]
  %.0163174 = phi float [ 0.000000e+00, %.preheader226 ], [ %153, %._crit_edge236 ]
  %.0164173 = phi float [ 0.000000e+00, %.preheader226 ], [ %142, %._crit_edge236 ]
  %.1166172 = phi float [ 0.000000e+00, %.preheader226 ], [ %149, %._crit_edge236 ]
  %.1168171 = phi float [ 0.000000e+00, %.preheader226 ], [ %139, %._crit_edge236 ]
  %133 = fmul float %61, %.0163174
  %134 = fmul float %.0164173, %63
  %135 = fadd float %134, %133
  %136 = fmul float %exp2, %.1166172
  %137 = fadd float %136, %135
  %138 = fmul float %.1168171, %29
  %139 = fadd float %138, %137
  %140 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv198, i64 %indvars.iv200
  store float %139, float* %140, align 4
  %141 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv198, i64 %indvars.iv200
  %142 = load float, float* %141, align 4
  %indvars.iv.next199 = add nsw i64 %indvars.iv198, -1
  %143 = fmul float %61, %142
  %144 = fmul float %.0163174, %63
  %145 = fadd float %144, %143
  %146 = fmul float %exp2, %139
  %147 = fadd float %146, %145
  %148 = fmul float %.1166172, %29
  %149 = fadd float %148, %147
  %150 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv.next199, i64 %indvars.iv200
  store float %149, float* %150, align 4
  %151 = icmp sgt i64 %indvars.iv198, 1
  br i1 %151, label %._crit_edge236, label %154

._crit_edge236:                                   ; preds = %132
  %indvars.iv.next199.1 = add nsw i64 %indvars.iv198, -2
  %152 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next199, i64 %indvars.iv200
  %153 = load float, float* %152, align 4
  br label %132

; <label>:154:                                    ; preds = %132
  %indvars.iv.next201 = add nuw nsw i64 %indvars.iv200, 1
  %exitcond202 = icmp eq i64 %indvars.iv.next201, 2160
  br i1 %exitcond202, label %.preheader.preheader, label %..preheader226_crit_edge

..preheader226_crit_edge:                         ; preds = %154
  br label %.preheader226

.preheader.preheader:                             ; preds = %154
  br label %.preheader

.preheader:                                       ; preds = %..preheader_crit_edge, %.preheader.preheader
  %indvars.iv195 = phi i64 [ %indvars.iv.next196, %..preheader_crit_edge ], [ 0, %.preheader.preheader ]
  br label %155

; <label>:155:                                    ; preds = %._crit_edge243, %.preheader
  %indvars.iv = phi i64 [ 0, %.preheader ], [ %indvars.iv.next.2, %._crit_edge243 ]
  %156 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv195, i64 %indvars.iv
  %157 = load float, float* %156, align 4
  %158 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv195, i64 %indvars.iv
  %159 = load float, float* %158, align 4
  %160 = fadd float %157, %159
  %161 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv195, i64 %indvars.iv
  store float %160, float* %161, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %162 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv195, i64 %indvars.iv.next
  %163 = load float, float* %162, align 4
  %164 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv195, i64 %indvars.iv.next
  %165 = load float, float* %164, align 4
  %166 = fadd float %163, %165
  %167 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv195, i64 %indvars.iv.next
  store float %166, float* %167, align 4
  %indvars.iv.next.1 = add nuw nsw i64 %indvars.iv, 2
  %168 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv195, i64 %indvars.iv.next.1
  %169 = load float, float* %168, align 4
  %170 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv195, i64 %indvars.iv.next.1
  %171 = load float, float* %170, align 4
  %172 = fadd float %169, %171
  %173 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv195, i64 %indvars.iv.next.1
  store float %172, float* %173, align 4
  %indvars.iv.next.2 = add nuw nsw i64 %indvars.iv, 3
  %exitcond.2 = icmp eq i64 %indvars.iv.next.2, 2160
  br i1 %exitcond.2, label %174, label %._crit_edge243

._crit_edge243:                                   ; preds = %155
  br label %155

; <label>:174:                                    ; preds = %155
  %indvars.iv.next196 = add nuw nsw i64 %indvars.iv195, 1
  %exitcond197 = icmp eq i64 %indvars.iv.next196, 4096
  br i1 %exitcond197, label %175, label %..preheader_crit_edge

..preheader_crit_edge:                            ; preds = %174
  br label %.preheader

; <label>:175:                                    ; preds = %174
  ret void
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [2160 x float]* nocapture readonly) #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %8

; <label>:8:                                      ; preds = %._crit_edge19, %3
  %indvars.iv14 = phi i64 [ 0, %3 ], [ %indvars.iv.next15, %._crit_edge19 ]
  %9 = mul nuw nsw i64 %indvars.iv14, 2160
  br label %10

; <label>:10:                                     ; preds = %._crit_edge._crit_edge, %8
  %indvars.iv = phi i64 [ 0, %8 ], [ %indvars.iv.next, %._crit_edge._crit_edge ]
  %11 = add nuw nsw i64 %indvars.iv, %9
  %12 = trunc i64 %11 to i32
  %13 = srem i32 %12, 20
  %14 = icmp eq i32 %13, 0
  br i1 %14, label %15, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %10
  br label %._crit_edge

; <label>:15:                                     ; preds = %10
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %16) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge, %15
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv14, i64 %indvars.iv
  %19 = load float, float* %18, align 4
  %20 = fpext float %19 to double
  %21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %20) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2160
  br i1 %exitcond, label %22, label %._crit_edge._crit_edge

._crit_edge._crit_edge:                           ; preds = %._crit_edge
  br label %10

; <label>:22:                                     ; preds = %._crit_edge
  %indvars.iv.next15 = add nuw nsw i64 %indvars.iv14, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next15, 4096
  br i1 %exitcond16, label %23, label %._crit_edge19

._crit_edge19:                                    ; preds = %22
  br label %8

; <label>:23:                                     ; preds = %22
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %24, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  %26 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %27 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %26) #6
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
