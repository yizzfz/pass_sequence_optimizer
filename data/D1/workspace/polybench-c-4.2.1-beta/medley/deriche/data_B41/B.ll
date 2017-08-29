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
  br i1 true, label %.lr.ph2.split.us.preheader, label %._crit_edge3

.lr.ph2.split.us.preheader:                       ; preds = %4
  br label %.lr.ph2.split.us

.lr.ph2.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph2.split.us.preheader
  %indvars.iv10 = phi i64 [ %indvars.iv.next11, %._crit_edge.us ], [ 0, %.lr.ph2.split.us.preheader ]
  %5 = mul nuw nsw i64 %indvars.iv10, 313
  br i1 false, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph2.split.us
  br i1 false, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %5, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
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
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %14 = icmp eq i64 %index.next, 2160
  br i1 %14, label %middle.block, label %vector.body, !llvm.loop !1

middle.block:                                     ; preds = %vector.body
  br i1 true, label %._crit_edge.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %min.iters.checked, %.lr.ph2.split.us
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  br i1 true, label %._crit_edge.us.loopexit, label %scalar.ph, !llvm.loop !4

._crit_edge.us.loopexit:                          ; preds = %scalar.ph
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next11, 4096
  br i1 %exitcond13, label %._crit_edge3.loopexit, label %.lr.ph2.split.us

._crit_edge3.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit, %4
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
  br i1 true, label %.lr.ph28, label %.preheader

.lr.ph28:                                         ; preds = %7
  br i1 true, label %.lr.ph28.split.us.preheader, label %._crit_edge4

.lr.ph28.split.us.preheader:                      ; preds = %.lr.ph28
  %39 = fmul float %31, 0.000000e+00
  %40 = fmul float %exp2, 0.000000e+00
  %41 = fmul float %37, -0.000000e+00
  %42 = insertelement <2 x float> undef, float %31, i32 0
  %43 = insertelement <2 x float> %42, float %20, i32 1
  br label %.lr.ph28.split.us

.lr.ph28.split.us:                                ; preds = %._crit_edge26.us, %.lr.ph28.split.us.preheader
  %indvars.iv136 = phi i64 [ %indvars.iv.next137, %._crit_edge26.us ], [ 0, %.lr.ph28.split.us.preheader ]
  %44 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv136, i64 0
  %45 = load float, float* %44, align 4
  %46 = fmul float %20, %45
  %47 = fadd float %46, %39
  %48 = fadd float %47, %40
  %49 = fadd float %48, %41
  %50 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv136, i64 0
  store float %49, float* %50, align 4
  br i1 false, label %._crit_edge26.us, label %._crit_edge.preheader

._crit_edge.preheader:                            ; preds = %.lr.ph28.split.us
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge.preheader, %._crit_edge
  %indvars.iv.next133154 = phi i64 [ %indvars.iv.next133, %._crit_edge ], [ 1, %._crit_edge.preheader ]
  %51 = phi float [ %64, %._crit_edge ], [ %49, %._crit_edge.preheader ]
  %52 = phi float* [ %55, %._crit_edge ], [ %44, %._crit_edge.preheader ]
  %53 = phi float [ %51, %._crit_edge ], [ 0.000000e+00, %._crit_edge.preheader ]
  %54 = bitcast float* %52 to <2 x float>*
  %55 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv136, i64 %indvars.iv.next133154
  %56 = load <2 x float>, <2 x float>* %54, align 4
  %57 = fmul <2 x float> %43, %56
  %58 = extractelement <2 x float> %57, i32 0
  %59 = extractelement <2 x float> %57, i32 1
  %60 = fadd float %59, %58
  %61 = fmul float %exp2, %51
  %62 = fadd float %60, %61
  %63 = fmul float %53, %38
  %64 = fadd float %62, %63
  %65 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv136, i64 %indvars.iv.next133154
  store float %64, float* %65, align 4
  %indvars.iv.next133 = add nuw nsw i64 %indvars.iv.next133154, 1
  %exitcond135 = icmp eq i64 %indvars.iv.next133, 2160
  br i1 %exitcond135, label %._crit_edge26.us.loopexit, label %._crit_edge

._crit_edge26.us.loopexit:                        ; preds = %._crit_edge
  br label %._crit_edge26.us

._crit_edge26.us:                                 ; preds = %._crit_edge26.us.loopexit, %.lr.ph28.split.us
  %indvars.iv.next137 = add nuw nsw i64 %indvars.iv136, 1
  %exitcond139 = icmp eq i64 %indvars.iv.next137, 4096
  br i1 %exitcond139, label %._crit_edge29, label %.lr.ph28.split.us

._crit_edge29:                                    ; preds = %._crit_edge26.us
  br i1 true, label %.lr.ph22, label %.preheader

.lr.ph22:                                         ; preds = %._crit_edge29
  br i1 true, label %.lr.ph22.split.us.preheader, label %._crit_edge4

.lr.ph22.split.us.preheader:                      ; preds = %.lr.ph22
  %66 = fmul float %32, 0.000000e+00
  %67 = fmul float %35, -0.000000e+00
  %68 = fadd float %66, %67
  %69 = fmul float %exp2, 0.000000e+00
  %70 = fadd float %68, %69
  %71 = fmul float %37, -0.000000e+00
  %72 = fadd float %70, %71
  br label %.lr.ph22.split.us

.lr.ph22.split.us:                                ; preds = %._crit_edge20.us, %.lr.ph22.split.us.preheader
  %indvars.iv127 = phi i64 [ 0, %.lr.ph22.split.us.preheader ], [ %indvars.iv.next128, %._crit_edge20.us ]
  %73 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv127, i64 2159
  store float %72, float* %73, align 4
  br i1 true, label %._crit_edge144.preheader, label %._crit_edge20.us

._crit_edge144.preheader:                         ; preds = %.lr.ph22.split.us
  br label %._crit_edge144

._crit_edge144:                                   ; preds = %._crit_edge144.1, %._crit_edge144.preheader
  %74 = phi float [ %72, %._crit_edge144.preheader ], [ %236, %._crit_edge144.1 ]
  %indvars.iv.next126152 = phi i64 [ 2159, %._crit_edge144.preheader ], [ %indvars.iv.next126.1, %._crit_edge144.1 ]
  %75 = phi float [ 0.000000e+00, %._crit_edge144.preheader ], [ %229, %._crit_edge144.1 ]
  %76 = phi float [ 0.000000e+00, %._crit_edge144.preheader ], [ %85, %._crit_edge144.1 ]
  %77 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv127, i64 %indvars.iv.next126152
  %78 = load float, float* %77, align 4
  %indvars.iv.next126 = add nsw i64 %indvars.iv.next126152, -1
  %79 = fmul float %32, %78
  %80 = fmul float %75, %36
  %81 = fadd float %79, %80
  %82 = fmul float %exp2, %74
  %83 = fadd float %81, %82
  %84 = fmul float %76, %38
  %85 = fadd float %83, %84
  %86 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv127, i64 %indvars.iv.next126
  store float %85, float* %86, align 4
  %87 = icmp sgt i64 %indvars.iv.next126152, 1
  br i1 %87, label %._crit_edge144.1, label %._crit_edge20.us.loopexit

._crit_edge20.us.loopexit:                        ; preds = %._crit_edge144
  br label %._crit_edge20.us

._crit_edge20.us:                                 ; preds = %._crit_edge20.us.loopexit, %.lr.ph22.split.us
  %indvars.iv.next128 = add nuw nsw i64 %indvars.iv127, 1
  %exitcond130 = icmp eq i64 %indvars.iv.next128, 4096
  br i1 %exitcond130, label %._crit_edge23, label %.lr.ph22.split.us

._crit_edge23:                                    ; preds = %._crit_edge20.us
  br i1 true, label %.preheader1.lr.ph, label %.preheader

.preheader1.lr.ph:                                ; preds = %._crit_edge23
  br i1 true, label %.preheader1.us.preheader, label %._crit_edge4

.preheader1.us.preheader:                         ; preds = %.preheader1.lr.ph
  br label %.preheader1.us

.preheader1.us:                                   ; preds = %._crit_edge17.us, %.preheader1.us.preheader
  %indvars.iv120 = phi i64 [ %indvars.iv.next121, %._crit_edge17.us ], [ 0, %.preheader1.us.preheader ]
  %scevgep157 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv120, i64 2
  %scevgep163 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv120, i64 2
  %scevgep169 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv120, i64 2
  br i1 true, label %.prol.loopexit117, label %.prol.preheader116

.prol.preheader116:                               ; preds = %.preheader1.us
  br label %.prol.loopexit117

.prol.loopexit117:                                ; preds = %.preheader1.us, %.prol.preheader116
  %indvars.iv112.unr.ph = phi i64 [ 1, %.prol.preheader116 ], [ 0, %.preheader1.us ]
  br i1 false, label %._crit_edge17.us, label %.prol.loopexit117..preheader1.us.new_crit_edge

.prol.loopexit117..preheader1.us.new_crit_edge:   ; preds = %.prol.loopexit117
  %88 = sub nsw i64 2158, %indvars.iv112.unr.ph
  %89 = lshr i64 %88, 1
  %90 = add nuw nsw i64 %89, 1
  br i1 false, label %.preheader1.us.new.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.prol.loopexit117..preheader1.us.new_crit_edge
  %n.mod.vf = and i64 %90, 3
  %n.vec = sub nsw i64 %90, %n.mod.vf
  br i1 false, label %.preheader1.us.new.preheader, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep155 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv120, i64 %indvars.iv112.unr.ph
  %91 = sub nsw i64 2158, %indvars.iv112.unr.ph
  %92 = and i64 %91, 2158
  %93 = or i64 %indvars.iv112.unr.ph, %92
  %scevgep158 = getelementptr float, float* %scevgep157, i64 %93
  %scevgep161 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv120, i64 %indvars.iv112.unr.ph
  %scevgep164 = getelementptr float, float* %scevgep163, i64 %93
  %scevgep167 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv120, i64 %indvars.iv112.unr.ph
  %scevgep170 = getelementptr float, float* %scevgep169, i64 %93
  %bound0 = icmp ult float* %scevgep155, %scevgep164
  %bound1 = icmp ult float* %scevgep161, %scevgep158
  %found.conflict = and i1 %bound0, %bound1
  %bound0172 = icmp ult float* %scevgep155, %scevgep170
  %bound1173 = icmp ult float* %scevgep167, %scevgep158
  %found.conflict174 = and i1 %bound0172, %bound1173
  %conflict.rdx = or i1 %found.conflict, %found.conflict174
  %94 = or i64 %indvars.iv112.unr.ph, 2
  %95 = shl nuw nsw i64 %89, 1
  %96 = add nuw nsw i64 %94, %95
  %97 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub nsw i64 %96, %97
  br i1 %conflict.rdx, label %.preheader1.us.new.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %98 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv112.unr.ph, %98
  %99 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv120, i64 %offset.idx
  %100 = bitcast float* %99 to <8 x float>*
  %wide.vec = load <8 x float>, <8 x float>* %100, align 4, !alias.scope !6
  %101 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv120, i64 %offset.idx
  %102 = bitcast float* %101 to <8 x float>*
  %wide.vec176 = load <8 x float>, <8 x float>* %102, align 4, !alias.scope !9
  %103 = fadd <8 x float> %wide.vec, %wide.vec176
  %104 = shufflevector <8 x float> %103, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %105 = add nuw nsw i64 %offset.idx, 1
  %106 = fadd <8 x float> %wide.vec, %wide.vec176
  %107 = shufflevector <8 x float> %106, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %108 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv120, i64 %105
  %109 = getelementptr float, float* %108, i64 -1
  %110 = bitcast float* %109 to <8 x float>*
  %interleaved.vec = shufflevector <4 x float> %104, <4 x float> %107, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec, <8 x float>* %110, align 4, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %111 = icmp eq i64 %index.next, %n.vec
  br i1 %111, label %middle.block, label %vector.body, !llvm.loop !14

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge17.us, label %.preheader1.us.new.preheader

.preheader1.us.new.preheader:                     ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.prol.loopexit117..preheader1.us.new_crit_edge
  %indvars.iv112.ph = phi i64 [ %indvars.iv112.unr.ph, %vector.memcheck ], [ %indvars.iv112.unr.ph, %min.iters.checked ], [ %indvars.iv112.unr.ph, %.prol.loopexit117..preheader1.us.new_crit_edge ], [ %ind.end, %middle.block ]
  br label %.preheader1.us.new

.preheader1.us.new:                               ; preds = %.preheader1.us.new.preheader, %.preheader1.us.new
  %indvars.iv112 = phi i64 [ %indvars.iv.next113.1, %.preheader1.us.new ], [ %indvars.iv112.ph, %.preheader1.us.new.preheader ]
  %112 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv120, i64 %indvars.iv112
  %113 = load float, float* %112, align 4
  %114 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv120, i64 %indvars.iv112
  %115 = load float, float* %114, align 4
  %116 = fadd float %113, %115
  %117 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv120, i64 %indvars.iv112
  store float %116, float* %117, align 4
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112, 1
  %118 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv120, i64 %indvars.iv.next113
  %119 = load float, float* %118, align 4
  %120 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv120, i64 %indvars.iv.next113
  %121 = load float, float* %120, align 4
  %122 = fadd float %119, %121
  %123 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv120, i64 %indvars.iv.next113
  store float %122, float* %123, align 4
  %indvars.iv.next113.1 = add nsw i64 %indvars.iv112, 2
  %exitcond115.1 = icmp eq i64 %indvars.iv.next113.1, 2160
  br i1 %exitcond115.1, label %._crit_edge17.us.loopexit, label %.preheader1.us.new, !llvm.loop !15

._crit_edge17.us.loopexit:                        ; preds = %.preheader1.us.new
  br label %._crit_edge17.us

._crit_edge17.us:                                 ; preds = %._crit_edge17.us.loopexit, %middle.block, %.prol.loopexit117
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  %exitcond123 = icmp eq i64 %indvars.iv.next121, 4096
  br i1 %exitcond123, label %.preheader.loopexit, label %.preheader1.us

.preheader.loopexit:                              ; preds = %._crit_edge17.us
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %._crit_edge23, %._crit_edge29, %7
  br i1 true, label %.lr.ph14, label %._crit_edge10

.lr.ph14:                                         ; preds = %.preheader
  br i1 true, label %.lr.ph14.split.us.preheader, label %._crit_edge4

.lr.ph14.split.us.preheader:                      ; preds = %.lr.ph14
  %124 = fmul float %31, 0.000000e+00
  %125 = fmul float %exp2, 0.000000e+00
  %126 = fmul float %37, -0.000000e+00
  br label %.lr.ph14.split.us

.lr.ph14.split.us:                                ; preds = %._crit_edge13.us, %.lr.ph14.split.us.preheader
  %indvars.iv107 = phi i64 [ %indvars.iv.next108, %._crit_edge13.us ], [ 0, %.lr.ph14.split.us.preheader ]
  %127 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 0, i64 %indvars.iv107
  %128 = load float, float* %127, align 4
  %129 = fmul float %20, %128
  %130 = fadd float %129, %124
  %131 = fadd float %130, %125
  %132 = fadd float %131, %126
  %133 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 0, i64 %indvars.iv107
  store float %132, float* %133, align 4
  br i1 false, label %._crit_edge13.us, label %._crit_edge145.preheader

._crit_edge145.preheader:                         ; preds = %.lr.ph14.split.us
  br label %._crit_edge145

._crit_edge145:                                   ; preds = %._crit_edge145.1, %._crit_edge145.preheader
  %indvars.iv.next104150 = phi i64 [ 1, %._crit_edge145.preheader ], [ %indvars.iv.next104.1, %._crit_edge145.1 ]
  %134 = phi float [ %132, %._crit_edge145.preheader ], [ %226, %._crit_edge145.1 ]
  %135 = phi float* [ %127, %._crit_edge145.preheader ], [ %218, %._crit_edge145.1 ]
  %136 = phi float [ 0.000000e+00, %._crit_edge145.preheader ], [ %146, %._crit_edge145.1 ]
  %137 = load float, float* %135, align 4
  %138 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next104150, i64 %indvars.iv107
  %139 = load float, float* %138, align 4
  %140 = fmul float %20, %139
  %141 = fmul float %31, %137
  %142 = fadd float %140, %141
  %143 = fmul float %exp2, %134
  %144 = fadd float %142, %143
  %145 = fmul float %136, %38
  %146 = fadd float %144, %145
  %147 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv.next104150, i64 %indvars.iv107
  store float %146, float* %147, align 4
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv.next104150, 1
  %exitcond106 = icmp eq i64 %indvars.iv.next104, 4096
  br i1 %exitcond106, label %._crit_edge13.us.loopexit, label %._crit_edge145.1

._crit_edge13.us.loopexit:                        ; preds = %._crit_edge145
  br label %._crit_edge13.us

._crit_edge13.us:                                 ; preds = %._crit_edge13.us.loopexit, %.lr.ph14.split.us
  %indvars.iv.next108 = add nuw nsw i64 %indvars.iv107, 1
  %exitcond110 = icmp eq i64 %indvars.iv.next108, 2160
  br i1 %exitcond110, label %._crit_edge15, label %.lr.ph14.split.us

._crit_edge15:                                    ; preds = %._crit_edge13.us
  br i1 true, label %.lr.ph9, label %._crit_edge10

.lr.ph9:                                          ; preds = %._crit_edge15
  br i1 true, label %.lr.ph9.split.us.preheader, label %._crit_edge10

.lr.ph9.split.us.preheader:                       ; preds = %.lr.ph9
  %148 = fmul float %32, 0.000000e+00
  %149 = fmul float %35, -0.000000e+00
  %150 = fadd float %148, %149
  %151 = fmul float %exp2, 0.000000e+00
  %152 = fadd float %150, %151
  %153 = fmul float %37, -0.000000e+00
  %154 = fadd float %152, %153
  br label %.lr.ph9.split.us

.lr.ph9.split.us:                                 ; preds = %._crit_edge7.us, %.lr.ph9.split.us.preheader
  %indvars.iv98 = phi i64 [ 0, %.lr.ph9.split.us.preheader ], [ %indvars.iv.next99, %._crit_edge7.us ]
  %155 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 4095, i64 %indvars.iv98
  store float %154, float* %155, align 4
  br i1 true, label %._crit_edge146.preheader, label %._crit_edge7.us

._crit_edge146.preheader:                         ; preds = %.lr.ph9.split.us
  br label %._crit_edge146

._crit_edge146:                                   ; preds = %._crit_edge146.1, %._crit_edge146.preheader
  %156 = phi float [ %154, %._crit_edge146.preheader ], [ %215, %._crit_edge146.1 ]
  %indvars.iv.next97148 = phi i64 [ 4095, %._crit_edge146.preheader ], [ %indvars.iv.next97.1, %._crit_edge146.1 ]
  %157 = phi float [ 0.000000e+00, %._crit_edge146.preheader ], [ %208, %._crit_edge146.1 ]
  %158 = phi float [ 0.000000e+00, %._crit_edge146.preheader ], [ %167, %._crit_edge146.1 ]
  %159 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next97148, i64 %indvars.iv98
  %160 = load float, float* %159, align 4
  %indvars.iv.next97 = add nsw i64 %indvars.iv.next97148, -1
  %161 = fmul float %32, %160
  %162 = fmul float %157, %36
  %163 = fadd float %161, %162
  %164 = fmul float %exp2, %156
  %165 = fadd float %163, %164
  %166 = fmul float %158, %38
  %167 = fadd float %165, %166
  %168 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv.next97, i64 %indvars.iv98
  store float %167, float* %168, align 4
  %169 = icmp sgt i64 %indvars.iv.next97148, 1
  br i1 %169, label %._crit_edge146.1, label %._crit_edge7.us.loopexit

._crit_edge7.us.loopexit:                         ; preds = %._crit_edge146
  br label %._crit_edge7.us

._crit_edge7.us:                                  ; preds = %._crit_edge7.us.loopexit, %.lr.ph9.split.us
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98, 1
  %exitcond101 = icmp eq i64 %indvars.iv.next99, 2160
  br i1 %exitcond101, label %._crit_edge7.us.._crit_edge10_crit_edge, label %.lr.ph9.split.us

._crit_edge7.us.._crit_edge10_crit_edge:          ; preds = %._crit_edge7.us
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %.lr.ph9, %._crit_edge15, %.preheader, %._crit_edge7.us.._crit_edge10_crit_edge
  %170 = phi i1 [ false, %._crit_edge7.us.._crit_edge10_crit_edge ], [ true, %.preheader ], [ true, %._crit_edge15 ], [ false, %.lr.ph9 ]
  br i1 %170, label %._crit_edge4, label %.lr.ph3.split.us.preheader

.lr.ph3.split.us.preheader:                       ; preds = %._crit_edge10
  br label %.lr.ph3.split.us

.lr.ph3.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph3.split.us.preheader
  %indvars.iv92 = phi i64 [ %indvars.iv.next93, %._crit_edge.us ], [ 0, %.lr.ph3.split.us.preheader ]
  %scevgep191 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv92, i64 2
  %scevgep197 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv92, i64 2
  %scevgep203 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv92, i64 2
  br i1 true, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph3.split.us
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.lr.ph3.split.us, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph3.split.us ]
  br i1 false, label %._crit_edge.us, label %.prol.loopexit..lr.ph3.split.us.new_crit_edge

.prol.loopexit..lr.ph3.split.us.new_crit_edge:    ; preds = %.prol.loopexit
  %171 = sub nsw i64 2158, %indvars.iv.unr.ph
  %172 = lshr i64 %171, 1
  %173 = add nuw nsw i64 %172, 1
  br i1 false, label %.lr.ph3.split.us.new.preheader, label %min.iters.checked183

min.iters.checked183:                             ; preds = %.prol.loopexit..lr.ph3.split.us.new_crit_edge
  %n.mod.vf184 = and i64 %173, 3
  %n.vec185 = sub nsw i64 %173, %n.mod.vf184
  br i1 false, label %.lr.ph3.split.us.new.preheader, label %vector.memcheck214

vector.memcheck214:                               ; preds = %min.iters.checked183
  %scevgep189 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv92, i64 %indvars.iv.unr.ph
  %174 = sub nsw i64 2158, %indvars.iv.unr.ph
  %175 = and i64 %174, 2158
  %176 = or i64 %indvars.iv.unr.ph, %175
  %scevgep192 = getelementptr float, float* %scevgep191, i64 %176
  %scevgep195 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv92, i64 %indvars.iv.unr.ph
  %scevgep198 = getelementptr float, float* %scevgep197, i64 %176
  %scevgep201 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv92, i64 %indvars.iv.unr.ph
  %scevgep204 = getelementptr float, float* %scevgep203, i64 %176
  %bound0206 = icmp ult float* %scevgep189, %scevgep198
  %bound1207 = icmp ult float* %scevgep195, %scevgep192
  %found.conflict208 = and i1 %bound0206, %bound1207
  %bound0209 = icmp ult float* %scevgep189, %scevgep204
  %bound1210 = icmp ult float* %scevgep201, %scevgep192
  %found.conflict211 = and i1 %bound0209, %bound1210
  %conflict.rdx212 = or i1 %found.conflict208, %found.conflict211
  %177 = or i64 %indvars.iv.unr.ph, 2
  %178 = shl nuw nsw i64 %172, 1
  %179 = add nuw nsw i64 %177, %178
  %180 = shl nuw nsw i64 %n.mod.vf184, 1
  %ind.end219 = sub nsw i64 %179, %180
  br i1 %conflict.rdx212, label %.lr.ph3.split.us.new.preheader, label %vector.body179.preheader

vector.body179.preheader:                         ; preds = %vector.memcheck214
  br label %vector.body179

vector.body179:                                   ; preds = %vector.body179.preheader, %vector.body179
  %index216 = phi i64 [ %index.next217, %vector.body179 ], [ 0, %vector.body179.preheader ]
  %181 = shl i64 %index216, 1
  %offset.idx221 = or i64 %indvars.iv.unr.ph, %181
  %182 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv92, i64 %offset.idx221
  %183 = bitcast float* %182 to <8 x float>*
  %wide.vec225 = load <8 x float>, <8 x float>* %183, align 4, !alias.scope !16
  %184 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv92, i64 %offset.idx221
  %185 = bitcast float* %184 to <8 x float>*
  %wide.vec228 = load <8 x float>, <8 x float>* %185, align 4, !alias.scope !19
  %186 = fadd <8 x float> %wide.vec225, %wide.vec228
  %187 = shufflevector <8 x float> %186, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %188 = add nuw nsw i64 %offset.idx221, 1
  %189 = fadd <8 x float> %wide.vec225, %wide.vec228
  %190 = shufflevector <8 x float> %189, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %191 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv92, i64 %188
  %192 = getelementptr float, float* %191, i64 -1
  %193 = bitcast float* %192 to <8 x float>*
  %interleaved.vec231 = shufflevector <4 x float> %187, <4 x float> %190, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec231, <8 x float>* %193, align 4, !alias.scope !21, !noalias !23
  %index.next217 = add i64 %index216, 4
  %194 = icmp eq i64 %index.next217, %n.vec185
  br i1 %194, label %middle.block180, label %vector.body179, !llvm.loop !24

middle.block180:                                  ; preds = %vector.body179
  %cmp.n220 = icmp eq i64 %n.mod.vf184, 0
  br i1 %cmp.n220, label %._crit_edge.us, label %.lr.ph3.split.us.new.preheader

.lr.ph3.split.us.new.preheader:                   ; preds = %middle.block180, %vector.memcheck214, %min.iters.checked183, %.prol.loopexit..lr.ph3.split.us.new_crit_edge
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr.ph, %vector.memcheck214 ], [ %indvars.iv.unr.ph, %min.iters.checked183 ], [ %indvars.iv.unr.ph, %.prol.loopexit..lr.ph3.split.us.new_crit_edge ], [ %ind.end219, %middle.block180 ]
  br label %.lr.ph3.split.us.new

.lr.ph3.split.us.new:                             ; preds = %.lr.ph3.split.us.new.preheader, %.lr.ph3.split.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph3.split.us.new ], [ %indvars.iv.ph, %.lr.ph3.split.us.new.preheader ]
  %195 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv92, i64 %indvars.iv
  %196 = load float, float* %195, align 4
  %197 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv92, i64 %indvars.iv
  %198 = load float, float* %197, align 4
  %199 = fadd float %196, %198
  %200 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv92, i64 %indvars.iv
  store float %199, float* %200, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %201 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv92, i64 %indvars.iv.next
  %202 = load float, float* %201, align 4
  %203 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv92, i64 %indvars.iv.next
  %204 = load float, float* %203, align 4
  %205 = fadd float %202, %204
  %206 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv92, i64 %indvars.iv.next
  store float %205, float* %206, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2160
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph3.split.us.new, !llvm.loop !25

._crit_edge.us.loopexit:                          ; preds = %.lr.ph3.split.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block180, %.prol.loopexit
  %indvars.iv.next93 = add nuw nsw i64 %indvars.iv92, 1
  %exitcond = icmp eq i64 %indvars.iv.next93, 4096
  br i1 %exitcond, label %._crit_edge4.loopexit, label %.lr.ph3.split.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %._crit_edge10, %.lr.ph14, %.preheader1.lr.ph, %.lr.ph22, %.lr.ph28
  ret void

._crit_edge146.1:                                 ; preds = %._crit_edge146
  %207 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next97, i64 %indvars.iv98
  %208 = load float, float* %207, align 4
  %indvars.iv.next97.1 = add nsw i64 %indvars.iv.next97148, -2
  %209 = fmul float %32, %208
  %210 = fmul float %160, %36
  %211 = fadd float %209, %210
  %212 = fmul float %exp2, %167
  %213 = fadd float %211, %212
  %214 = fmul float %156, %38
  %215 = fadd float %213, %214
  %216 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv.next97.1, i64 %indvars.iv98
  store float %215, float* %216, align 4
  br label %._crit_edge146

._crit_edge145.1:                                 ; preds = %._crit_edge145
  %217 = load float, float* %138, align 4
  %218 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next104, i64 %indvars.iv107
  %219 = load float, float* %218, align 4
  %220 = fmul float %20, %219
  %221 = fmul float %31, %217
  %222 = fadd float %220, %221
  %223 = fmul float %exp2, %146
  %224 = fadd float %222, %223
  %225 = fmul float %134, %38
  %226 = fadd float %224, %225
  %227 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv.next104, i64 %indvars.iv107
  store float %226, float* %227, align 4
  %indvars.iv.next104.1 = add nsw i64 %indvars.iv.next104150, 2
  br label %._crit_edge145

._crit_edge144.1:                                 ; preds = %._crit_edge144
  %228 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv127, i64 %indvars.iv.next126
  %229 = load float, float* %228, align 4
  %indvars.iv.next126.1 = add nsw i64 %indvars.iv.next126152, -2
  %230 = fmul float %32, %229
  %231 = fmul float %78, %36
  %232 = fadd float %230, %231
  %233 = fmul float %exp2, %85
  %234 = fadd float %232, %233
  %235 = fmul float %74, %38
  %236 = fadd float %234, %235
  %237 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv127, i64 %indvars.iv.next126.1
  store float %236, float* %237, align 4
  br label %._crit_edge144
}

declare void @polybench_timer_stop(...) #1

declare void @polybench_timer_print(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @print_array(i32, i32, [2160 x float]* nocapture readonly) #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  br i1 true, label %.lr.ph2.split.us.preheader, label %._crit_edge3

.lr.ph2.split.us.preheader:                       ; preds = %3
  br label %.lr.ph2.split.us

.lr.ph2.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph2.split.us.preheader
  %indvars.iv10 = phi i64 [ 0, %.lr.ph2.split.us.preheader ], [ %indvars.iv.next11, %._crit_edge.us ]
  %8 = mul nsw i64 %indvars.iv10, 2160
  br label %9

; <label>:9:                                      ; preds = %._crit_edge, %.lr.ph2.split.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %._crit_edge ], [ 0, %.lr.ph2.split.us ]
  %10 = add nsw i64 %8, %indvars.iv
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %15) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %9, %14
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv10, i64 %indvars.iv
  %18 = load float, float* %17, align 4
  %19 = fpext float %18 to double
  %20 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %19) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2160
  br i1 %exitcond, label %._crit_edge.us, label %9

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next11, 4096
  br i1 %exitcond13, label %._crit_edge3.loopexit, label %.lr.ph2.split.us

._crit_edge3.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit, %3
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #6
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
