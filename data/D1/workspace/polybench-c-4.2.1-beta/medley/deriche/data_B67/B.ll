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
  br i1 %13, label %14, label %.._crit_edge_crit_edge

.._crit_edge_crit_edge:                           ; preds = %2
  br label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %.._crit_edge_crit_edge2

.._crit_edge_crit_edge2:                          ; preds = %14
  br label %._crit_edge

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to [2160 x float]*
  call fastcc void @print_array(i32 4096, i32 2160, [2160 x float]* %18)
  br label %._crit_edge

._crit_edge:                                      ; preds = %.._crit_edge_crit_edge2, %.._crit_edge_crit_edge, %17
  call void @free(i8* %4) #5
  call void @free(i8* %5) #5
  call void @free(i8* %6) #5
  call void @free(i8* %7) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, float* nocapture, [2160 x float]* nocapture) unnamed_addr #2 {
  store float 2.500000e-01, float* %2, align 4
  br i1 true, label %.lr.ph2.split.us.preheader, label %.._crit_edge3_crit_edge

.._crit_edge3_crit_edge:                          ; preds = %4
  br label %._crit_edge3

.lr.ph2.split.us.preheader:                       ; preds = %4
  br label %.lr.ph2.split.us

.lr.ph2.split.us:                                 ; preds = %._crit_edge.us..lr.ph2.split.us_crit_edge, %.lr.ph2.split.us.preheader
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %._crit_edge.us..lr.ph2.split.us_crit_edge ], [ 0, %.lr.ph2.split.us.preheader ]
  %5 = mul nuw nsw i64 %indvars.iv10, 313
  br i1 false, label %.lr.ph2.split.us.scalar.ph.preheader_crit_edge, label %min.iters.checked

.lr.ph2.split.us.scalar.ph.preheader_crit_edge:   ; preds = %.lr.ph2.split.us
  br label %scalar.ph.preheader

min.iters.checked:                                ; preds = %.lr.ph2.split.us
  br i1 false, label %min.iters.checked.scalar.ph.preheader_crit_edge, label %vector.ph

min.iters.checked.scalar.ph.preheader_crit_edge:  ; preds = %min.iters.checked
  br label %scalar.ph.preheader

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %5, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph ], [ %vec.ind.next, %vector.body.vector.body_crit_edge ]
  %6 = mul nuw nsw <4 x i64> %vec.ind, <i64 991, i64 991, i64 991, i64 991>
  %7 = add nuw nsw <4 x i64> %broadcast.splat, %6
  %8 = trunc <4 x i64> %7 to <4 x i32>
  %9 = srem <4 x i32> %8, <i32 65536, i32 65536, i32 65536, i32 65536>
  %10 = sitofp <4 x i32> %9 to <4 x float>
  %11 = fdiv <4 x float> %10, <float 6.553500e+04, float 6.553500e+04, float 6.553500e+04, float 6.553500e+04>
  %12 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv10, i64 %index
  %13 = bitcast float* %12 to <4 x float>*
  store <4 x float> %11, <4 x float>* %13, align 4
  %index.next = add i64 %index, 4
  %14 = icmp eq i64 %index.next, 2160
  br i1 %14, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !1

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  br i1 true, label %middle.block.._crit_edge.us_crit_edge, label %middle.block.scalar.ph.preheader_crit_edge

middle.block.scalar.ph.preheader_crit_edge:       ; preds = %middle.block
  br label %scalar.ph.preheader

middle.block.._crit_edge.us_crit_edge:            ; preds = %middle.block
  br label %._crit_edge.us

scalar.ph.preheader:                              ; preds = %middle.block.scalar.ph.preheader_crit_edge, %min.iters.checked.scalar.ph.preheader_crit_edge, %.lr.ph2.split.us.scalar.ph.preheader_crit_edge
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.scalar.ph_crit_edge, %scalar.ph.preheader
  br i1 true, label %scalar.ph.._crit_edge.us_crit_edge, label %scalar.ph.scalar.ph_crit_edge, !llvm.loop !4

scalar.ph.scalar.ph_crit_edge:                    ; preds = %scalar.ph
  br label %scalar.ph

scalar.ph.._crit_edge.us_crit_edge:               ; preds = %scalar.ph
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %scalar.ph.._crit_edge.us_crit_edge, %middle.block.._crit_edge.us_crit_edge
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next11, 4096
  br i1 %exitcond13, label %._crit_edge.us.._crit_edge3_crit_edge, label %._crit_edge.us..lr.ph2.split.us_crit_edge

._crit_edge.us..lr.ph2.split.us_crit_edge:        ; preds = %._crit_edge.us
  br label %.lr.ph2.split.us

._crit_edge.us.._crit_edge3_crit_edge:            ; preds = %._crit_edge.us
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge.us.._crit_edge3_crit_edge, %.._crit_edge3_crit_edge
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_deriche(i32, i32, float, [2160 x float]* nocapture readonly, [2160 x float]* nocapture, [2160 x float]* nocapture, [2160 x float]* nocapture) unnamed_addr #0 {
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
  %22 = fmul float %20, %21
  %23 = call float @expf(float %8) #5
  %24 = fmul float %20, %23
  %25 = insertelement <2 x float> undef, float %2, i32 0
  %26 = shufflevector <2 x float> %25, <2 x float> undef, <2 x i32> zeroinitializer
  %27 = fadd <2 x float> %26, <float -1.000000e+00, float 1.000000e+00>
  %28 = insertelement <2 x float> undef, float %22, i32 0
  %29 = insertelement <2 x float> %28, float %24, i32 1
  %30 = fmul <2 x float> %29, %27
  %31 = extractelement <2 x float> %30, i32 0
  %32 = extractelement <2 x float> %30, i32 1
  %33 = fmul float %2, -2.000000e+00
  %34 = call float @expf(float %33) #5
  %35 = fmul float %20, %34
  %36 = fsub float -0.000000e+00, %35
  %exp2 = call float @llvm.exp2.f32(float %8)
  %37 = call float @expf(float %33) #5
  %38 = fsub float -0.000000e+00, %37
  br i1 true, label %.lr.ph30, label %.._crit_edge1_crit_edge

.._crit_edge1_crit_edge:                          ; preds = %7
  br label %._crit_edge1

.lr.ph30:                                         ; preds = %7
  br i1 true, label %.lr.ph30.split.us.preheader, label %.lr.ph30.._crit_edge6_crit_edge

.lr.ph30.._crit_edge6_crit_edge:                  ; preds = %.lr.ph30
  br label %._crit_edge6

.lr.ph30.split.us.preheader:                      ; preds = %.lr.ph30
  br label %.lr.ph30.split.us

.lr.ph30.split.us:                                ; preds = %._crit_edge28.us..lr.ph30.split.us_crit_edge, %.lr.ph30.split.us.preheader
  %indvars.iv138 = phi i64 [ %indvars.iv.next139, %._crit_edge28.us..lr.ph30.split.us_crit_edge ], [ 0, %.lr.ph30.split.us.preheader ]
  br label %39

; <label>:39:                                     ; preds = %._crit_edge, %.lr.ph30.split.us
  %indvars.iv134 = phi i64 [ %indvars.iv.next135, %._crit_edge ], [ 0, %.lr.ph30.split.us ]
  %40 = phi float [ %41, %._crit_edge ], [ 0.000000e+00, %.lr.ph30.split.us ]
  %41 = phi float [ %51, %._crit_edge ], [ 0.000000e+00, %.lr.ph30.split.us ]
  %42 = phi float [ %53, %._crit_edge ], [ 0.000000e+00, %.lr.ph30.split.us ]
  %43 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv138, i64 %indvars.iv134
  %44 = load float, float* %43, align 4
  %45 = fmul float %20, %44
  %46 = fmul float %31, %42
  %47 = fadd float %45, %46
  %48 = fmul float %exp2, %41
  %49 = fadd float %47, %48
  %50 = fmul float %40, %38
  %51 = fadd float %49, %50
  %52 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv138, i64 %indvars.iv134
  store float %51, float* %52, align 4
  %indvars.iv.next135 = add nuw nsw i64 %indvars.iv134, 1
  %exitcond137 = icmp eq i64 %indvars.iv.next135, 2160
  br i1 %exitcond137, label %._crit_edge28.us, label %._crit_edge

._crit_edge:                                      ; preds = %39
  %53 = load float, float* %43, align 4
  br label %39

._crit_edge28.us:                                 ; preds = %39
  %indvars.iv.next139 = add nuw nsw i64 %indvars.iv138, 1
  %exitcond141 = icmp eq i64 %indvars.iv.next139, 4096
  br i1 %exitcond141, label %._crit_edge31, label %._crit_edge28.us..lr.ph30.split.us_crit_edge

._crit_edge28.us..lr.ph30.split.us_crit_edge:     ; preds = %._crit_edge28.us
  br label %.lr.ph30.split.us

._crit_edge31:                                    ; preds = %._crit_edge28.us
  br i1 true, label %.lr.ph24, label %._crit_edge31.._crit_edge1_crit_edge

._crit_edge31.._crit_edge1_crit_edge:             ; preds = %._crit_edge31
  br label %._crit_edge1

.lr.ph24:                                         ; preds = %._crit_edge31
  br i1 true, label %.lr.ph24.split.us.preheader, label %.lr.ph24.._crit_edge6_crit_edge

.lr.ph24.._crit_edge6_crit_edge:                  ; preds = %.lr.ph24
  br label %._crit_edge6

.lr.ph24.split.us.preheader:                      ; preds = %.lr.ph24
  br label %.lr.ph24.split.us

.lr.ph24.split.us:                                ; preds = %._crit_edge22.us..lr.ph24.split.us_crit_edge, %.lr.ph24.split.us.preheader
  %indvars.iv129 = phi i64 [ 0, %.lr.ph24.split.us.preheader ], [ %indvars.iv.next130, %._crit_edge22.us..lr.ph24.split.us_crit_edge ]
  br label %54

; <label>:54:                                     ; preds = %._crit_edge225, %.lr.ph24.split.us
  %indvars.iv127 = phi i64 [ %indvars.iv.next128, %._crit_edge225 ], [ 2160, %.lr.ph24.split.us ]
  %55 = phi float [ %56, %._crit_edge225 ], [ 0.000000e+00, %.lr.ph24.split.us ]
  %56 = phi float [ %65, %._crit_edge225 ], [ 0.000000e+00, %.lr.ph24.split.us ]
  %57 = phi float [ %58, %._crit_edge225 ], [ 0.000000e+00, %.lr.ph24.split.us ]
  %58 = phi float [ %69, %._crit_edge225 ], [ 0.000000e+00, %.lr.ph24.split.us ]
  %indvars.iv.next128 = add nsw i64 %indvars.iv127, -1
  %59 = fmul float %32, %58
  %60 = fmul float %57, %36
  %61 = fadd float %59, %60
  %62 = fmul float %exp2, %56
  %63 = fadd float %61, %62
  %64 = fmul float %55, %38
  %65 = fadd float %63, %64
  %66 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv129, i64 %indvars.iv.next128
  store float %65, float* %66, align 4
  %67 = icmp sgt i64 %indvars.iv127, 1
  br i1 %67, label %._crit_edge225, label %._crit_edge22.us

._crit_edge225:                                   ; preds = %54
  %68 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv129, i64 %indvars.iv.next128
  %69 = load float, float* %68, align 4
  br label %54

._crit_edge22.us:                                 ; preds = %54
  %indvars.iv.next130 = add nuw nsw i64 %indvars.iv129, 1
  %exitcond132 = icmp eq i64 %indvars.iv.next130, 4096
  br i1 %exitcond132, label %._crit_edge25, label %._crit_edge22.us..lr.ph24.split.us_crit_edge

._crit_edge22.us..lr.ph24.split.us_crit_edge:     ; preds = %._crit_edge22.us
  br label %.lr.ph24.split.us

._crit_edge25:                                    ; preds = %._crit_edge22.us
  br i1 true, label %._crit_edge.lr.ph, label %._crit_edge25.._crit_edge1_crit_edge

._crit_edge25.._crit_edge1_crit_edge:             ; preds = %._crit_edge25
  br label %._crit_edge1

._crit_edge.lr.ph:                                ; preds = %._crit_edge25
  br i1 true, label %._crit_edge.us.preheader, label %._crit_edge.lr.ph.._crit_edge6_crit_edge

._crit_edge.lr.ph.._crit_edge6_crit_edge:         ; preds = %._crit_edge.lr.ph
  br label %._crit_edge6

._crit_edge.us.preheader:                         ; preds = %._crit_edge.lr.ph
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge19.us.._crit_edge.us_crit_edge, %._crit_edge.us.preheader
  %indvars.iv122 = phi i64 [ %indvars.iv.next123, %._crit_edge19.us.._crit_edge.us_crit_edge ], [ 0, %._crit_edge.us.preheader ]
  %scevgep148 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv122, i64 2
  %scevgep154 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv122, i64 2
  %scevgep160 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv122, i64 2
  br i1 true, label %._crit_edge.us..prol.loopexit119_crit_edge, label %.prol.preheader118

._crit_edge.us..prol.loopexit119_crit_edge:       ; preds = %._crit_edge.us
  br label %.prol.loopexit119

.prol.preheader118:                               ; preds = %._crit_edge.us
  br label %.prol.loopexit119

.prol.loopexit119:                                ; preds = %._crit_edge.us..prol.loopexit119_crit_edge, %.prol.preheader118
  %indvars.iv114.unr.ph = phi i64 [ 1, %.prol.preheader118 ], [ 0, %._crit_edge.us..prol.loopexit119_crit_edge ]
  br i1 false, label %.prol.loopexit119.._crit_edge19.us_crit_edge, label %._crit_edge.us.new.preheader

.prol.loopexit119.._crit_edge19.us_crit_edge:     ; preds = %.prol.loopexit119
  br label %._crit_edge19.us

._crit_edge.us.new.preheader:                     ; preds = %.prol.loopexit119
  %70 = sub nsw i64 2158, %indvars.iv114.unr.ph
  %71 = lshr i64 %70, 1
  %72 = add nuw nsw i64 %71, 1
  br i1 false, label %._crit_edge.us.new.preheader.._crit_edge.us.new.preheader224_crit_edge, label %min.iters.checked

._crit_edge.us.new.preheader.._crit_edge.us.new.preheader224_crit_edge: ; preds = %._crit_edge.us.new.preheader
  br label %._crit_edge.us.new.preheader224

min.iters.checked:                                ; preds = %._crit_edge.us.new.preheader
  %n.mod.vf = and i64 %72, 3
  %n.vec = sub nsw i64 %72, %n.mod.vf
  br i1 false, label %min.iters.checked.._crit_edge.us.new.preheader224_crit_edge, label %vector.memcheck

min.iters.checked.._crit_edge.us.new.preheader224_crit_edge: ; preds = %min.iters.checked
  br label %._crit_edge.us.new.preheader224

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep146 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv122, i64 %indvars.iv114.unr.ph
  %73 = sub nsw i64 2158, %indvars.iv114.unr.ph
  %74 = and i64 %73, 2158
  %75 = or i64 %indvars.iv114.unr.ph, %74
  %scevgep149 = getelementptr float, float* %scevgep148, i64 %75
  %scevgep152 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv122, i64 %indvars.iv114.unr.ph
  %scevgep155 = getelementptr float, float* %scevgep154, i64 %75
  %scevgep158 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv122, i64 %indvars.iv114.unr.ph
  %scevgep161 = getelementptr float, float* %scevgep160, i64 %75
  %bound0 = icmp ult float* %scevgep146, %scevgep155
  %bound1 = icmp ult float* %scevgep152, %scevgep149
  %found.conflict = and i1 %bound0, %bound1
  %bound0163 = icmp ult float* %scevgep146, %scevgep161
  %bound1164 = icmp ult float* %scevgep158, %scevgep149
  %found.conflict165 = and i1 %bound0163, %bound1164
  %conflict.rdx = or i1 %found.conflict, %found.conflict165
  %76 = or i64 %indvars.iv114.unr.ph, 2
  %77 = shl nuw nsw i64 %71, 1
  %78 = add nuw nsw i64 %76, %77
  %79 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub nsw i64 %78, %79
  br i1 %conflict.rdx, label %vector.memcheck.._crit_edge.us.new.preheader224_crit_edge, label %vector.body.preheader

vector.memcheck.._crit_edge.us.new.preheader224_crit_edge: ; preds = %vector.memcheck
  br label %._crit_edge.us.new.preheader224

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.body.preheader
  %index = phi i64 [ %index.next, %vector.body.vector.body_crit_edge ], [ 0, %vector.body.preheader ]
  %80 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv114.unr.ph, %80
  %81 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv122, i64 %offset.idx
  %82 = bitcast float* %81 to <8 x float>*
  %wide.vec = load <8 x float>, <8 x float>* %82, align 4, !alias.scope !6
  %83 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv122, i64 %offset.idx
  %84 = bitcast float* %83 to <8 x float>*
  %wide.vec167 = load <8 x float>, <8 x float>* %84, align 4, !alias.scope !9
  %85 = fadd <8 x float> %wide.vec, %wide.vec167
  %86 = shufflevector <8 x float> %85, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %87 = add nuw nsw i64 %offset.idx, 1
  %88 = fadd <8 x float> %wide.vec, %wide.vec167
  %89 = shufflevector <8 x float> %88, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %90 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv122, i64 %87
  %91 = getelementptr float, float* %90, i64 -1
  %92 = bitcast float* %91 to <8 x float>*
  %interleaved.vec = shufflevector <4 x float> %86, <4 x float> %89, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec, <8 x float>* %92, align 4, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %93 = icmp eq i64 %index.next, %n.vec
  br i1 %93, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !14

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %middle.block.._crit_edge19.us_crit_edge, label %middle.block.._crit_edge.us.new.preheader224_crit_edge

middle.block.._crit_edge.us.new.preheader224_crit_edge: ; preds = %middle.block
  br label %._crit_edge.us.new.preheader224

middle.block.._crit_edge19.us_crit_edge:          ; preds = %middle.block
  br label %._crit_edge19.us

._crit_edge.us.new.preheader224:                  ; preds = %middle.block.._crit_edge.us.new.preheader224_crit_edge, %vector.memcheck.._crit_edge.us.new.preheader224_crit_edge, %min.iters.checked.._crit_edge.us.new.preheader224_crit_edge, %._crit_edge.us.new.preheader.._crit_edge.us.new.preheader224_crit_edge
  %indvars.iv114.ph = phi i64 [ %indvars.iv114.unr.ph, %vector.memcheck.._crit_edge.us.new.preheader224_crit_edge ], [ %indvars.iv114.unr.ph, %min.iters.checked.._crit_edge.us.new.preheader224_crit_edge ], [ %indvars.iv114.unr.ph, %._crit_edge.us.new.preheader.._crit_edge.us.new.preheader224_crit_edge ], [ %ind.end, %middle.block.._crit_edge.us.new.preheader224_crit_edge ]
  br label %._crit_edge.us.new

._crit_edge.us.new:                               ; preds = %._crit_edge.us.new.._crit_edge.us.new_crit_edge, %._crit_edge.us.new.preheader224
  %indvars.iv114 = phi i64 [ %indvars.iv.next115.1, %._crit_edge.us.new.._crit_edge.us.new_crit_edge ], [ %indvars.iv114.ph, %._crit_edge.us.new.preheader224 ]
  %94 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv122, i64 %indvars.iv114
  %95 = load float, float* %94, align 4
  %96 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv122, i64 %indvars.iv114
  %97 = load float, float* %96, align 4
  %98 = fadd float %95, %97
  %99 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv122, i64 %indvars.iv114
  store float %98, float* %99, align 4
  %indvars.iv.next115 = add nuw nsw i64 %indvars.iv114, 1
  %100 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv122, i64 %indvars.iv.next115
  %101 = load float, float* %100, align 4
  %102 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv122, i64 %indvars.iv.next115
  %103 = load float, float* %102, align 4
  %104 = fadd float %101, %103
  %105 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv122, i64 %indvars.iv.next115
  store float %104, float* %105, align 4
  %indvars.iv.next115.1 = add nsw i64 %indvars.iv114, 2
  %exitcond117.1 = icmp eq i64 %indvars.iv.next115.1, 2160
  br i1 %exitcond117.1, label %._crit_edge.us.new.._crit_edge19.us_crit_edge, label %._crit_edge.us.new.._crit_edge.us.new_crit_edge, !llvm.loop !15

._crit_edge.us.new.._crit_edge.us.new_crit_edge:  ; preds = %._crit_edge.us.new
  br label %._crit_edge.us.new

._crit_edge.us.new.._crit_edge19.us_crit_edge:    ; preds = %._crit_edge.us.new
  br label %._crit_edge19.us

._crit_edge19.us:                                 ; preds = %._crit_edge.us.new.._crit_edge19.us_crit_edge, %middle.block.._crit_edge19.us_crit_edge, %.prol.loopexit119.._crit_edge19.us_crit_edge
  %indvars.iv.next123 = add nuw nsw i64 %indvars.iv122, 1
  %exitcond125 = icmp eq i64 %indvars.iv.next123, 4096
  br i1 %exitcond125, label %._crit_edge19.us.._crit_edge1_crit_edge, label %._crit_edge19.us.._crit_edge.us_crit_edge

._crit_edge19.us.._crit_edge.us_crit_edge:        ; preds = %._crit_edge19.us
  br label %._crit_edge.us

._crit_edge19.us.._crit_edge1_crit_edge:          ; preds = %._crit_edge19.us
  br label %._crit_edge1

._crit_edge1:                                     ; preds = %._crit_edge19.us.._crit_edge1_crit_edge, %._crit_edge25.._crit_edge1_crit_edge, %._crit_edge31.._crit_edge1_crit_edge, %.._crit_edge1_crit_edge
  br i1 true, label %.lr.ph16, label %._crit_edge1.._crit_edge12_crit_edge

._crit_edge1.._crit_edge12_crit_edge:             ; preds = %._crit_edge1
  br label %._crit_edge12

.lr.ph16:                                         ; preds = %._crit_edge1
  br i1 true, label %.lr.ph16.split.us.preheader, label %.lr.ph16.._crit_edge6_crit_edge

.lr.ph16.._crit_edge6_crit_edge:                  ; preds = %.lr.ph16
  br label %._crit_edge6

.lr.ph16.split.us.preheader:                      ; preds = %.lr.ph16
  br label %.lr.ph16.split.us

.lr.ph16.split.us:                                ; preds = %._crit_edge15.us..lr.ph16.split.us_crit_edge, %.lr.ph16.split.us.preheader
  %indvars.iv109 = phi i64 [ %indvars.iv.next110, %._crit_edge15.us..lr.ph16.split.us_crit_edge ], [ 0, %.lr.ph16.split.us.preheader ]
  br label %106

; <label>:106:                                    ; preds = %._crit_edge226, %.lr.ph16.split.us
  %indvars.iv105 = phi i64 [ %indvars.iv.next106, %._crit_edge226 ], [ 0, %.lr.ph16.split.us ]
  %107 = phi float [ %108, %._crit_edge226 ], [ 0.000000e+00, %.lr.ph16.split.us ]
  %108 = phi float [ %118, %._crit_edge226 ], [ 0.000000e+00, %.lr.ph16.split.us ]
  %109 = phi float [ %120, %._crit_edge226 ], [ 0.000000e+00, %.lr.ph16.split.us ]
  %110 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv105, i64 %indvars.iv109
  %111 = load float, float* %110, align 4
  %112 = fmul float %20, %111
  %113 = fmul float %31, %109
  %114 = fadd float %112, %113
  %115 = fmul float %exp2, %108
  %116 = fadd float %114, %115
  %117 = fmul float %107, %38
  %118 = fadd float %116, %117
  %119 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv105, i64 %indvars.iv109
  store float %118, float* %119, align 4
  %indvars.iv.next106 = add nuw nsw i64 %indvars.iv105, 1
  %exitcond108 = icmp eq i64 %indvars.iv.next106, 4096
  br i1 %exitcond108, label %._crit_edge15.us, label %._crit_edge226

._crit_edge226:                                   ; preds = %106
  %120 = load float, float* %110, align 4
  br label %106

._crit_edge15.us:                                 ; preds = %106
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv109, 1
  %exitcond112 = icmp eq i64 %indvars.iv.next110, 2160
  br i1 %exitcond112, label %._crit_edge17, label %._crit_edge15.us..lr.ph16.split.us_crit_edge

._crit_edge15.us..lr.ph16.split.us_crit_edge:     ; preds = %._crit_edge15.us
  br label %.lr.ph16.split.us

._crit_edge17:                                    ; preds = %._crit_edge15.us
  br i1 true, label %.lr.ph11, label %._crit_edge17.._crit_edge12_crit_edge

._crit_edge17.._crit_edge12_crit_edge:            ; preds = %._crit_edge17
  br label %._crit_edge12

.lr.ph11:                                         ; preds = %._crit_edge17
  br i1 true, label %.lr.ph11.split.us.preheader, label %.lr.ph11.._crit_edge12_crit_edge

.lr.ph11.._crit_edge12_crit_edge:                 ; preds = %.lr.ph11
  br label %._crit_edge12

.lr.ph11.split.us.preheader:                      ; preds = %.lr.ph11
  br label %.lr.ph11.split.us

.lr.ph11.split.us:                                ; preds = %._crit_edge9.us..lr.ph11.split.us_crit_edge, %.lr.ph11.split.us.preheader
  %indvars.iv100 = phi i64 [ 0, %.lr.ph11.split.us.preheader ], [ %indvars.iv.next101, %._crit_edge9.us..lr.ph11.split.us_crit_edge ]
  br label %121

; <label>:121:                                    ; preds = %._crit_edge227, %.lr.ph11.split.us
  %indvars.iv98 = phi i64 [ %indvars.iv.next99, %._crit_edge227 ], [ 4096, %.lr.ph11.split.us ]
  %122 = phi float [ %123, %._crit_edge227 ], [ 0.000000e+00, %.lr.ph11.split.us ]
  %123 = phi float [ %132, %._crit_edge227 ], [ 0.000000e+00, %.lr.ph11.split.us ]
  %124 = phi float [ %125, %._crit_edge227 ], [ 0.000000e+00, %.lr.ph11.split.us ]
  %125 = phi float [ %136, %._crit_edge227 ], [ 0.000000e+00, %.lr.ph11.split.us ]
  %indvars.iv.next99 = add nsw i64 %indvars.iv98, -1
  %126 = fmul float %32, %125
  %127 = fmul float %124, %36
  %128 = fadd float %126, %127
  %129 = fmul float %exp2, %123
  %130 = fadd float %128, %129
  %131 = fmul float %122, %38
  %132 = fadd float %130, %131
  %133 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv.next99, i64 %indvars.iv100
  store float %132, float* %133, align 4
  %134 = icmp sgt i64 %indvars.iv98, 1
  br i1 %134, label %._crit_edge227, label %._crit_edge9.us

._crit_edge227:                                   ; preds = %121
  %135 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next99, i64 %indvars.iv100
  %136 = load float, float* %135, align 4
  br label %121

._crit_edge9.us:                                  ; preds = %121
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %exitcond103 = icmp eq i64 %indvars.iv.next101, 2160
  br i1 %exitcond103, label %._crit_edge9.us.._crit_edge12_crit_edge, label %._crit_edge9.us..lr.ph11.split.us_crit_edge

._crit_edge9.us..lr.ph11.split.us_crit_edge:      ; preds = %._crit_edge9.us
  br label %.lr.ph11.split.us

._crit_edge9.us.._crit_edge12_crit_edge:          ; preds = %._crit_edge9.us
  br label %._crit_edge12

._crit_edge12:                                    ; preds = %._crit_edge9.us.._crit_edge12_crit_edge, %.lr.ph11.._crit_edge12_crit_edge, %._crit_edge17.._crit_edge12_crit_edge, %._crit_edge1.._crit_edge12_crit_edge
  %137 = phi i1 [ false, %._crit_edge17.._crit_edge12_crit_edge ], [ true, %.lr.ph11.._crit_edge12_crit_edge ], [ false, %._crit_edge1.._crit_edge12_crit_edge ], [ true, %._crit_edge9.us.._crit_edge12_crit_edge ]
  br i1 %137, label %.lr.ph5.split.us.preheader, label %._crit_edge12.._crit_edge6_crit_edge

._crit_edge12.._crit_edge6_crit_edge:             ; preds = %._crit_edge12
  br label %._crit_edge6

.lr.ph5.split.us.preheader:                       ; preds = %._crit_edge12
  br label %.lr.ph5.split.us

.lr.ph5.split.us:                                 ; preds = %._crit_edge3.us..lr.ph5.split.us_crit_edge, %.lr.ph5.split.us.preheader
  %indvars.iv94 = phi i64 [ %indvars.iv.next95, %._crit_edge3.us..lr.ph5.split.us_crit_edge ], [ 0, %.lr.ph5.split.us.preheader ]
  %scevgep182 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv94, i64 2
  %scevgep188 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv94, i64 2
  %scevgep194 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv94, i64 2
  br i1 true, label %.lr.ph5.split.us..prol.loopexit_crit_edge, label %.prol.preheader

.lr.ph5.split.us..prol.loopexit_crit_edge:        ; preds = %.lr.ph5.split.us
  br label %.prol.loopexit

.prol.preheader:                                  ; preds = %.lr.ph5.split.us
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph5.split.us..prol.loopexit_crit_edge, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph5.split.us..prol.loopexit_crit_edge ]
  br i1 false, label %.prol.loopexit.._crit_edge3.us_crit_edge, label %.lr.ph5.split.us.new.preheader

.prol.loopexit.._crit_edge3.us_crit_edge:         ; preds = %.prol.loopexit
  br label %._crit_edge3.us

.lr.ph5.split.us.new.preheader:                   ; preds = %.prol.loopexit
  %138 = sub nsw i64 2158, %indvars.iv.unr.ph
  %139 = lshr i64 %138, 1
  %140 = add nuw nsw i64 %139, 1
  br i1 false, label %.lr.ph5.split.us.new.preheader..lr.ph5.split.us.new.preheader223_crit_edge, label %min.iters.checked174

.lr.ph5.split.us.new.preheader..lr.ph5.split.us.new.preheader223_crit_edge: ; preds = %.lr.ph5.split.us.new.preheader
  br label %.lr.ph5.split.us.new.preheader223

min.iters.checked174:                             ; preds = %.lr.ph5.split.us.new.preheader
  %n.mod.vf175 = and i64 %140, 3
  %n.vec176 = sub nsw i64 %140, %n.mod.vf175
  br i1 false, label %min.iters.checked174..lr.ph5.split.us.new.preheader223_crit_edge, label %vector.memcheck205

min.iters.checked174..lr.ph5.split.us.new.preheader223_crit_edge: ; preds = %min.iters.checked174
  br label %.lr.ph5.split.us.new.preheader223

vector.memcheck205:                               ; preds = %min.iters.checked174
  %scevgep180 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv94, i64 %indvars.iv.unr.ph
  %141 = sub nsw i64 2158, %indvars.iv.unr.ph
  %142 = and i64 %141, 2158
  %143 = or i64 %indvars.iv.unr.ph, %142
  %scevgep183 = getelementptr float, float* %scevgep182, i64 %143
  %scevgep186 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv94, i64 %indvars.iv.unr.ph
  %scevgep189 = getelementptr float, float* %scevgep188, i64 %143
  %scevgep192 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv94, i64 %indvars.iv.unr.ph
  %scevgep195 = getelementptr float, float* %scevgep194, i64 %143
  %bound0197 = icmp ult float* %scevgep180, %scevgep189
  %bound1198 = icmp ult float* %scevgep186, %scevgep183
  %found.conflict199 = and i1 %bound0197, %bound1198
  %bound0200 = icmp ult float* %scevgep180, %scevgep195
  %bound1201 = icmp ult float* %scevgep192, %scevgep183
  %found.conflict202 = and i1 %bound0200, %bound1201
  %conflict.rdx203 = or i1 %found.conflict199, %found.conflict202
  %144 = or i64 %indvars.iv.unr.ph, 2
  %145 = shl nuw nsw i64 %139, 1
  %146 = add nuw nsw i64 %144, %145
  %147 = shl nuw nsw i64 %n.mod.vf175, 1
  %ind.end210 = sub nsw i64 %146, %147
  br i1 %conflict.rdx203, label %vector.memcheck205..lr.ph5.split.us.new.preheader223_crit_edge, label %vector.body170.preheader

vector.memcheck205..lr.ph5.split.us.new.preheader223_crit_edge: ; preds = %vector.memcheck205
  br label %.lr.ph5.split.us.new.preheader223

vector.body170.preheader:                         ; preds = %vector.memcheck205
  br label %vector.body170

vector.body170:                                   ; preds = %vector.body170.vector.body170_crit_edge, %vector.body170.preheader
  %index207 = phi i64 [ %index.next208, %vector.body170.vector.body170_crit_edge ], [ 0, %vector.body170.preheader ]
  %148 = shl i64 %index207, 1
  %offset.idx212 = or i64 %indvars.iv.unr.ph, %148
  %149 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv94, i64 %offset.idx212
  %150 = bitcast float* %149 to <8 x float>*
  %wide.vec216 = load <8 x float>, <8 x float>* %150, align 4, !alias.scope !16
  %151 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv94, i64 %offset.idx212
  %152 = bitcast float* %151 to <8 x float>*
  %wide.vec219 = load <8 x float>, <8 x float>* %152, align 4, !alias.scope !19
  %153 = fadd <8 x float> %wide.vec216, %wide.vec219
  %154 = shufflevector <8 x float> %153, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %155 = add nuw nsw i64 %offset.idx212, 1
  %156 = fadd <8 x float> %wide.vec216, %wide.vec219
  %157 = shufflevector <8 x float> %156, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %158 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv94, i64 %155
  %159 = getelementptr float, float* %158, i64 -1
  %160 = bitcast float* %159 to <8 x float>*
  %interleaved.vec222 = shufflevector <4 x float> %154, <4 x float> %157, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec222, <8 x float>* %160, align 4, !alias.scope !21, !noalias !23
  %index.next208 = add i64 %index207, 4
  %161 = icmp eq i64 %index.next208, %n.vec176
  br i1 %161, label %middle.block171, label %vector.body170.vector.body170_crit_edge, !llvm.loop !24

vector.body170.vector.body170_crit_edge:          ; preds = %vector.body170
  br label %vector.body170

middle.block171:                                  ; preds = %vector.body170
  %cmp.n211 = icmp eq i64 %n.mod.vf175, 0
  br i1 %cmp.n211, label %middle.block171.._crit_edge3.us_crit_edge, label %middle.block171..lr.ph5.split.us.new.preheader223_crit_edge

middle.block171..lr.ph5.split.us.new.preheader223_crit_edge: ; preds = %middle.block171
  br label %.lr.ph5.split.us.new.preheader223

middle.block171.._crit_edge3.us_crit_edge:        ; preds = %middle.block171
  br label %._crit_edge3.us

.lr.ph5.split.us.new.preheader223:                ; preds = %middle.block171..lr.ph5.split.us.new.preheader223_crit_edge, %vector.memcheck205..lr.ph5.split.us.new.preheader223_crit_edge, %min.iters.checked174..lr.ph5.split.us.new.preheader223_crit_edge, %.lr.ph5.split.us.new.preheader..lr.ph5.split.us.new.preheader223_crit_edge
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr.ph, %vector.memcheck205..lr.ph5.split.us.new.preheader223_crit_edge ], [ %indvars.iv.unr.ph, %min.iters.checked174..lr.ph5.split.us.new.preheader223_crit_edge ], [ %indvars.iv.unr.ph, %.lr.ph5.split.us.new.preheader..lr.ph5.split.us.new.preheader223_crit_edge ], [ %ind.end210, %middle.block171..lr.ph5.split.us.new.preheader223_crit_edge ]
  br label %.lr.ph5.split.us.new

.lr.ph5.split.us.new:                             ; preds = %.lr.ph5.split.us.new..lr.ph5.split.us.new_crit_edge, %.lr.ph5.split.us.new.preheader223
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph5.split.us.new..lr.ph5.split.us.new_crit_edge ], [ %indvars.iv.ph, %.lr.ph5.split.us.new.preheader223 ]
  %162 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv94, i64 %indvars.iv
  %163 = load float, float* %162, align 4
  %164 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv94, i64 %indvars.iv
  %165 = load float, float* %164, align 4
  %166 = fadd float %163, %165
  %167 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv94, i64 %indvars.iv
  store float %166, float* %167, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %168 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv94, i64 %indvars.iv.next
  %169 = load float, float* %168, align 4
  %170 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv94, i64 %indvars.iv.next
  %171 = load float, float* %170, align 4
  %172 = fadd float %169, %171
  %173 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv94, i64 %indvars.iv.next
  store float %172, float* %173, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2160
  br i1 %exitcond.1, label %.lr.ph5.split.us.new.._crit_edge3.us_crit_edge, label %.lr.ph5.split.us.new..lr.ph5.split.us.new_crit_edge, !llvm.loop !25

.lr.ph5.split.us.new..lr.ph5.split.us.new_crit_edge: ; preds = %.lr.ph5.split.us.new
  br label %.lr.ph5.split.us.new

.lr.ph5.split.us.new.._crit_edge3.us_crit_edge:   ; preds = %.lr.ph5.split.us.new
  br label %._crit_edge3.us

._crit_edge3.us:                                  ; preds = %.lr.ph5.split.us.new.._crit_edge3.us_crit_edge, %middle.block171.._crit_edge3.us_crit_edge, %.prol.loopexit.._crit_edge3.us_crit_edge
  %indvars.iv.next95 = add nuw nsw i64 %indvars.iv94, 1
  %exitcond = icmp eq i64 %indvars.iv.next95, 4096
  br i1 %exitcond, label %._crit_edge3.us.._crit_edge6_crit_edge, label %._crit_edge3.us..lr.ph5.split.us_crit_edge

._crit_edge3.us..lr.ph5.split.us_crit_edge:       ; preds = %._crit_edge3.us
  br label %.lr.ph5.split.us

._crit_edge3.us.._crit_edge6_crit_edge:           ; preds = %._crit_edge3.us
  br label %._crit_edge6

._crit_edge6:                                     ; preds = %._crit_edge3.us.._crit_edge6_crit_edge, %._crit_edge12.._crit_edge6_crit_edge, %.lr.ph16.._crit_edge6_crit_edge, %._crit_edge.lr.ph.._crit_edge6_crit_edge, %.lr.ph24.._crit_edge6_crit_edge, %.lr.ph30.._crit_edge6_crit_edge
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [2160 x float]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  br i1 true, label %.lr.ph4.split.us.preheader, label %.._crit_edge5_crit_edge

.._crit_edge5_crit_edge:                          ; preds = %3
  br label %._crit_edge5

.lr.ph4.split.us.preheader:                       ; preds = %3
  br label %.lr.ph4.split.us

.lr.ph4.split.us:                                 ; preds = %._crit_edge2.us..lr.ph4.split.us_crit_edge, %.lr.ph4.split.us.preheader
  %indvars.iv12 = phi i64 [ 0, %.lr.ph4.split.us.preheader ], [ %indvars.iv.next13, %._crit_edge2.us..lr.ph4.split.us_crit_edge ]
  %8 = mul nsw i64 %indvars.iv12, 2160
  br label %9

; <label>:9:                                      ; preds = %._crit_edge.us._crit_edge, %.lr.ph4.split.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge.us._crit_edge ], [ 0, %.lr.ph4.split.us ]
  %10 = add nsw i64 %8, %indvars.iv
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %.._crit_edge.us_crit_edge

.._crit_edge.us_crit_edge:                        ; preds = %9
  br label %._crit_edge.us

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %15) #6
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %.._crit_edge.us_crit_edge, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv12, i64 %indvars.iv
  %18 = load float, float* %17, align 4
  %19 = fpext float %18 to double
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %19) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2160
  br i1 %exitcond, label %._crit_edge2.us, label %._crit_edge.us._crit_edge

._crit_edge.us._crit_edge:                        ; preds = %._crit_edge.us
  br label %9

._crit_edge2.us:                                  ; preds = %._crit_edge.us
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next13, 4096
  br i1 %exitcond15, label %._crit_edge2.us.._crit_edge5_crit_edge, label %._crit_edge2.us..lr.ph4.split.us_crit_edge

._crit_edge2.us..lr.ph4.split.us_crit_edge:       ; preds = %._crit_edge2.us
  br label %.lr.ph4.split.us

._crit_edge2.us.._crit_edge5_crit_edge:           ; preds = %._crit_edge2.us
  br label %._crit_edge5

._crit_edge5:                                     ; preds = %._crit_edge2.us.._crit_edge5_crit_edge, %.._crit_edge5_crit_edge
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #6
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
