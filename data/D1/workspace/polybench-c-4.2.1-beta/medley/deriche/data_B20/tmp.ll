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
  br i1 true, label %.lr.ph2.split.us.preheader, label %.loopexit

.lr.ph2.split.us.preheader:                       ; preds = %4
  br label %.lr.ph2.split.us

.lr.ph2.split.us:                                 ; preds = %.lr.ph2.split.us.preheader, %._crit_edge.us
  %indvars.iv11 = phi i64 [ %indvars.iv.next12, %._crit_edge.us ], [ 0, %.lr.ph2.split.us.preheader ]
  %5 = mul nuw nsw i64 %indvars.iv11, 313
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
  %12 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv11, i64 %index
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
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next12, 4096
  br i1 %exitcond14, label %.loopexit.loopexit, label %.lr.ph2.split.us

.loopexit.loopexit:                               ; preds = %._crit_edge.us
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %4
  ret void
}

declare void @polybench_timer_start(...) #1

; Function Attrs: noinline nounwind uwtable
define internal void @kernel_deriche(i32, i32, float, [2160 x float]* nocapture readonly, [2160 x float]* nocapture, [2160 x float]* nocapture, [2160 x float]* nocapture) #0 {
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
  %22 = fmul float %20, %21
  %23 = tail call float @expf(float %8) #5
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
  %34 = tail call float @expf(float %33) #5
  %35 = fmul float %20, %34
  %36 = fsub float -0.000000e+00, %35
  %exp2 = call float @llvm.exp2.f32(float %8)
  %37 = tail call float @expf(float %33) #5
  %38 = fsub float -0.000000e+00, %37
  br i1 true, label %.lr.ph28, label %.preheader

.lr.ph28:                                         ; preds = %7
  br i1 true, label %.lr.ph28.split.us.preheader, label %._crit_edge4

.lr.ph28.split.us.preheader:                      ; preds = %.lr.ph28
  %39 = insertelement <2 x float> undef, float %31, i32 0
  %40 = insertelement <2 x float> %39, float %20, i32 1
  br label %.lr.ph28.split.us

.lr.ph28.split.us:                                ; preds = %.lr.ph28.split.us.preheader, %._crit_edge26.us
  %indvars.iv140 = phi i64 [ %indvars.iv.next141, %._crit_edge26.us ], [ 0, %.lr.ph28.split.us.preheader ]
  br i1 true, label %.prol.loopexit156, label %.prol.preheader155

.prol.preheader155:                               ; preds = %.lr.ph28.split.us
  br label %.prol.loopexit156

.prol.loopexit156:                                ; preds = %.prol.preheader155, %.lr.ph28.split.us
  %indvars.iv136.unr.ph = phi i64 [ 1, %.prol.preheader155 ], [ 0, %.lr.ph28.split.us ]
  br i1 false, label %._crit_edge26.us, label %.lr.ph28.split.us.new.preheader

.lr.ph28.split.us.new.preheader:                  ; preds = %.prol.loopexit156
  br label %.lr.ph28.split.us.new

.lr.ph28.split.us.new:                            ; preds = %.lr.ph28.split.us.new.preheader, %.lr.ph28.split.us.new
  %indvars.iv136 = phi i64 [ %indvars.iv.next137.1, %.lr.ph28.split.us.new ], [ %indvars.iv136.unr.ph, %.lr.ph28.split.us.new.preheader ]
  %41 = phi float [ %52, %.lr.ph28.split.us.new ], [ 0.000000e+00, %.lr.ph28.split.us.new.preheader ]
  %42 = phi float [ %64, %.lr.ph28.split.us.new ], [ 0.000000e+00, %.lr.ph28.split.us.new.preheader ]
  %43 = phi float [ %66, %.lr.ph28.split.us.new ], [ 0.000000e+00, %.lr.ph28.split.us.new.preheader ]
  %44 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv140, i64 %indvars.iv136
  %45 = load float, float* %44, align 4
  %46 = fmul float %20, %45
  %47 = fmul float %31, %43
  %48 = fadd float %46, %47
  %49 = fmul float %exp2, %42
  %50 = fadd float %48, %49
  %51 = fmul float %41, %38
  %52 = fadd float %50, %51
  %53 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv140, i64 %indvars.iv136
  store float %52, float* %53, align 4
  %54 = bitcast float* %44 to <2 x float>*
  %indvars.iv.next137 = add nuw nsw i64 %indvars.iv136, 1
  %55 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv140, i64 %indvars.iv.next137
  %56 = load <2 x float>, <2 x float>* %54, align 4
  %57 = fmul <2 x float> %40, %56
  %58 = extractelement <2 x float> %57, i32 0
  %59 = extractelement <2 x float> %57, i32 1
  %60 = fadd float %59, %58
  %61 = fmul float %exp2, %52
  %62 = fadd float %60, %61
  %63 = fmul float %42, %38
  %64 = fadd float %62, %63
  %65 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv140, i64 %indvars.iv.next137
  store float %64, float* %65, align 4
  %66 = load float, float* %55, align 4
  %indvars.iv.next137.1 = add nuw nsw i64 %indvars.iv136, 2
  %exitcond139.1 = icmp eq i64 %indvars.iv.next137.1, 2160
  br i1 %exitcond139.1, label %._crit_edge26.us.loopexit, label %.lr.ph28.split.us.new

._crit_edge26.us.loopexit:                        ; preds = %.lr.ph28.split.us.new
  br label %._crit_edge26.us

._crit_edge26.us:                                 ; preds = %._crit_edge26.us.loopexit, %.prol.loopexit156
  %indvars.iv.next141 = add nuw nsw i64 %indvars.iv140, 1
  %exitcond143 = icmp eq i64 %indvars.iv.next141, 4096
  br i1 %exitcond143, label %._crit_edge29, label %.lr.ph28.split.us

._crit_edge29:                                    ; preds = %._crit_edge26.us
  br i1 true, label %.lr.ph22, label %.preheader

.lr.ph22:                                         ; preds = %._crit_edge29
  br i1 true, label %.lr.ph22.split.us.preheader, label %._crit_edge4

.lr.ph22.split.us.preheader:                      ; preds = %.lr.ph22
  br label %.lr.ph22.split.us

.lr.ph22.split.us:                                ; preds = %._crit_edge20.us, %.lr.ph22.split.us.preheader
  %indvars.iv131 = phi i64 [ 0, %.lr.ph22.split.us.preheader ], [ %indvars.iv.next132, %._crit_edge20.us ]
  br label %67

; <label>:67:                                     ; preds = %67, %.lr.ph22.split.us
  %indvars.iv129 = phi i64 [ 2160, %.lr.ph22.split.us ], [ %indvars.iv.next130.1, %67 ]
  %68 = phi float [ 0.000000e+00, %.lr.ph22.split.us ], [ %78, %67 ]
  %69 = phi float [ 0.000000e+00, %.lr.ph22.split.us ], [ %88, %67 ]
  %70 = phi float [ 0.000000e+00, %.lr.ph22.split.us ], [ %81, %67 ]
  %71 = phi float [ 0.000000e+00, %.lr.ph22.split.us ], [ %91, %67 ]
  %indvars.iv.next130 = add nsw i64 %indvars.iv129, -1
  %72 = fmul float %32, %71
  %73 = fmul float %70, %36
  %74 = fadd float %72, %73
  %75 = fmul float %exp2, %69
  %76 = fadd float %74, %75
  %77 = fmul float %68, %38
  %78 = fadd float %76, %77
  %79 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv131, i64 %indvars.iv.next130
  store float %78, float* %79, align 4
  %80 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv131, i64 %indvars.iv.next130
  %81 = load float, float* %80, align 4
  %indvars.iv.next130.1 = add nsw i64 %indvars.iv129, -2
  %82 = fmul float %32, %81
  %83 = fmul float %71, %36
  %84 = fadd float %82, %83
  %85 = fmul float %exp2, %78
  %86 = fadd float %84, %85
  %87 = fmul float %69, %38
  %88 = fadd float %86, %87
  %89 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv131, i64 %indvars.iv.next130.1
  store float %88, float* %89, align 4
  %90 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv131, i64 %indvars.iv.next130.1
  %91 = load float, float* %90, align 4
  %92 = icmp sgt i64 %indvars.iv.next130, 1
  br i1 %92, label %67, label %._crit_edge20.us

._crit_edge20.us:                                 ; preds = %67
  %indvars.iv.next132 = add nuw nsw i64 %indvars.iv131, 1
  %exitcond134 = icmp eq i64 %indvars.iv.next132, 4096
  br i1 %exitcond134, label %.loopexit96, label %.lr.ph22.split.us

.loopexit96:                                      ; preds = %._crit_edge20.us
  br i1 true, label %.preheader1.lr.ph, label %.preheader

.preheader1.lr.ph:                                ; preds = %.loopexit96
  br i1 true, label %.preheader1.us.preheader, label %._crit_edge4

.preheader1.us.preheader:                         ; preds = %.preheader1.lr.ph
  br label %.preheader1.us

.preheader1.us:                                   ; preds = %.preheader1.us.preheader, %._crit_edge17.us
  %indvars.iv124 = phi i64 [ %indvars.iv.next125, %._crit_edge17.us ], [ 0, %.preheader1.us.preheader ]
  %scevgep166 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv124, i64 2
  %scevgep172 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv124, i64 2
  %scevgep178 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv124, i64 2
  br i1 true, label %.prol.loopexit152, label %.prol.preheader151

.prol.preheader151:                               ; preds = %.preheader1.us
  br label %.prol.loopexit152

.prol.loopexit152:                                ; preds = %.prol.preheader151, %.preheader1.us
  %indvars.iv120.unr.ph = phi i64 [ 1, %.prol.preheader151 ], [ 0, %.preheader1.us ]
  br i1 false, label %._crit_edge17.us, label %.preheader1.us.new.preheader

.preheader1.us.new.preheader:                     ; preds = %.prol.loopexit152
  %93 = sub nsw i64 2158, %indvars.iv120.unr.ph
  %94 = lshr i64 %93, 1
  %95 = add nuw nsw i64 %94, 1
  br i1 false, label %.preheader1.us.new.preheader242, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader1.us.new.preheader
  %n.mod.vf = and i64 %95, 3
  %n.vec = sub nsw i64 %95, %n.mod.vf
  br i1 false, label %.preheader1.us.new.preheader242, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep164 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv124, i64 %indvars.iv120.unr.ph
  %96 = sub nsw i64 2158, %indvars.iv120.unr.ph
  %97 = and i64 %96, 2158
  %98 = or i64 %indvars.iv120.unr.ph, %97
  %scevgep167 = getelementptr float, float* %scevgep166, i64 %98
  %scevgep170 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv124, i64 %indvars.iv120.unr.ph
  %scevgep173 = getelementptr float, float* %scevgep172, i64 %98
  %scevgep176 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv124, i64 %indvars.iv120.unr.ph
  %scevgep179 = getelementptr float, float* %scevgep178, i64 %98
  %bound0 = icmp ult float* %scevgep164, %scevgep173
  %bound1 = icmp ult float* %scevgep170, %scevgep167
  %found.conflict = and i1 %bound0, %bound1
  %bound0181 = icmp ult float* %scevgep164, %scevgep179
  %bound1182 = icmp ult float* %scevgep176, %scevgep167
  %found.conflict183 = and i1 %bound0181, %bound1182
  %conflict.rdx = or i1 %found.conflict, %found.conflict183
  %99 = or i64 %indvars.iv120.unr.ph, 2
  %100 = shl nuw nsw i64 %94, 1
  %101 = add nuw nsw i64 %99, %100
  %102 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub nsw i64 %101, %102
  br i1 %conflict.rdx, label %.preheader1.us.new.preheader242, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %103 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv120.unr.ph, %103
  %104 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv124, i64 %offset.idx
  %105 = bitcast float* %104 to <8 x float>*
  %wide.vec = load <8 x float>, <8 x float>* %105, align 4, !alias.scope !6
  %106 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv124, i64 %offset.idx
  %107 = bitcast float* %106 to <8 x float>*
  %wide.vec185 = load <8 x float>, <8 x float>* %107, align 4, !alias.scope !9
  %108 = fadd <8 x float> %wide.vec, %wide.vec185
  %109 = shufflevector <8 x float> %108, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %110 = add nuw nsw i64 %offset.idx, 1
  %111 = fadd <8 x float> %wide.vec, %wide.vec185
  %112 = shufflevector <8 x float> %111, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %113 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv124, i64 %110
  %114 = getelementptr float, float* %113, i64 -1
  %115 = bitcast float* %114 to <8 x float>*
  %interleaved.vec = shufflevector <4 x float> %109, <4 x float> %112, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec, <8 x float>* %115, align 4, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %116 = icmp eq i64 %index.next, %n.vec
  br i1 %116, label %middle.block, label %vector.body, !llvm.loop !14

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge17.us, label %.preheader1.us.new.preheader242

.preheader1.us.new.preheader242:                  ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader1.us.new.preheader
  %indvars.iv120.ph = phi i64 [ %indvars.iv120.unr.ph, %vector.memcheck ], [ %indvars.iv120.unr.ph, %min.iters.checked ], [ %indvars.iv120.unr.ph, %.preheader1.us.new.preheader ], [ %ind.end, %middle.block ]
  br label %.preheader1.us.new

.preheader1.us.new:                               ; preds = %.preheader1.us.new.preheader242, %.preheader1.us.new
  %indvars.iv120 = phi i64 [ %indvars.iv.next121.1, %.preheader1.us.new ], [ %indvars.iv120.ph, %.preheader1.us.new.preheader242 ]
  %117 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv124, i64 %indvars.iv120
  %118 = load float, float* %117, align 4
  %119 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv124, i64 %indvars.iv120
  %120 = load float, float* %119, align 4
  %121 = fadd float %118, %120
  %122 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv124, i64 %indvars.iv120
  store float %121, float* %122, align 4
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  %123 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv124, i64 %indvars.iv.next121
  %124 = load float, float* %123, align 4
  %125 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv124, i64 %indvars.iv.next121
  %126 = load float, float* %125, align 4
  %127 = fadd float %124, %126
  %128 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv124, i64 %indvars.iv.next121
  store float %127, float* %128, align 4
  %indvars.iv.next121.1 = add nsw i64 %indvars.iv120, 2
  %exitcond123.1 = icmp eq i64 %indvars.iv.next121.1, 2160
  br i1 %exitcond123.1, label %._crit_edge17.us.loopexit, label %.preheader1.us.new, !llvm.loop !15

._crit_edge17.us.loopexit:                        ; preds = %.preheader1.us.new
  br label %._crit_edge17.us

._crit_edge17.us:                                 ; preds = %._crit_edge17.us.loopexit, %middle.block, %.prol.loopexit152
  %indvars.iv.next125 = add nuw nsw i64 %indvars.iv124, 1
  %exitcond127 = icmp eq i64 %indvars.iv.next125, 4096
  br i1 %exitcond127, label %.preheader.loopexit, label %.preheader1.us

.preheader.loopexit:                              ; preds = %._crit_edge17.us
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %7, %._crit_edge29, %.loopexit96
  br i1 true, label %.lr.ph14, label %.loopexit

.lr.ph14:                                         ; preds = %.preheader
  br i1 true, label %.lr.ph14.split.us.preheader, label %._crit_edge4

.lr.ph14.split.us.preheader:                      ; preds = %.lr.ph14
  br label %.lr.ph14.split.us

.lr.ph14.split.us:                                ; preds = %.lr.ph14.split.us.preheader, %._crit_edge13.us
  %indvars.iv115 = phi i64 [ %indvars.iv.next116, %._crit_edge13.us ], [ 0, %.lr.ph14.split.us.preheader ]
  br i1 true, label %.prol.loopexit146, label %.prol.preheader145

.prol.preheader145:                               ; preds = %.lr.ph14.split.us
  br label %.prol.loopexit146

.prol.loopexit146:                                ; preds = %.prol.preheader145, %.lr.ph14.split.us
  %indvars.iv111.unr.ph = phi i64 [ 1, %.prol.preheader145 ], [ 0, %.lr.ph14.split.us ]
  br i1 false, label %._crit_edge13.us, label %.lr.ph14.split.us.new.preheader

.lr.ph14.split.us.new.preheader:                  ; preds = %.prol.loopexit146
  br label %.lr.ph14.split.us.new

.lr.ph14.split.us.new:                            ; preds = %.lr.ph14.split.us.new.preheader, %.lr.ph14.split.us.new
  %indvars.iv111 = phi i64 [ %indvars.iv.next112.1, %.lr.ph14.split.us.new ], [ %indvars.iv111.unr.ph, %.lr.ph14.split.us.new.preheader ]
  %129 = phi float [ %140, %.lr.ph14.split.us.new ], [ 0.000000e+00, %.lr.ph14.split.us.new.preheader ]
  %130 = phi float [ %151, %.lr.ph14.split.us.new ], [ 0.000000e+00, %.lr.ph14.split.us.new.preheader ]
  %131 = phi float [ %153, %.lr.ph14.split.us.new ], [ 0.000000e+00, %.lr.ph14.split.us.new.preheader ]
  %132 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv111, i64 %indvars.iv115
  %133 = load float, float* %132, align 4
  %134 = fmul float %20, %133
  %135 = fmul float %31, %131
  %136 = fadd float %134, %135
  %137 = fmul float %exp2, %130
  %138 = fadd float %136, %137
  %139 = fmul float %129, %38
  %140 = fadd float %138, %139
  %141 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv111, i64 %indvars.iv115
  store float %140, float* %141, align 4
  %142 = load float, float* %132, align 4
  %indvars.iv.next112 = add nuw nsw i64 %indvars.iv111, 1
  %143 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next112, i64 %indvars.iv115
  %144 = load float, float* %143, align 4
  %145 = fmul float %20, %144
  %146 = fmul float %31, %142
  %147 = fadd float %145, %146
  %148 = fmul float %exp2, %140
  %149 = fadd float %147, %148
  %150 = fmul float %130, %38
  %151 = fadd float %149, %150
  %152 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv.next112, i64 %indvars.iv115
  store float %151, float* %152, align 4
  %153 = load float, float* %143, align 4
  %indvars.iv.next112.1 = add nuw nsw i64 %indvars.iv111, 2
  %exitcond114.1 = icmp eq i64 %indvars.iv.next112.1, 4096
  br i1 %exitcond114.1, label %._crit_edge13.us.loopexit, label %.lr.ph14.split.us.new

._crit_edge13.us.loopexit:                        ; preds = %.lr.ph14.split.us.new
  br label %._crit_edge13.us

._crit_edge13.us:                                 ; preds = %._crit_edge13.us.loopexit, %.prol.loopexit146
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115, 1
  %exitcond118 = icmp eq i64 %indvars.iv.next116, 2160
  br i1 %exitcond118, label %._crit_edge15, label %.lr.ph14.split.us

._crit_edge15:                                    ; preds = %._crit_edge13.us
  br i1 true, label %.lr.ph9, label %.loopexit

.lr.ph9:                                          ; preds = %._crit_edge15
  br i1 true, label %.lr.ph9.split.us.preheader, label %._crit_edge4

.lr.ph9.split.us.preheader:                       ; preds = %.lr.ph9
  br label %.lr.ph9.split.us

.lr.ph9.split.us:                                 ; preds = %._crit_edge7.us, %.lr.ph9.split.us.preheader
  %indvars.iv106 = phi i64 [ 0, %.lr.ph9.split.us.preheader ], [ %indvars.iv.next107, %._crit_edge7.us ]
  br label %154

; <label>:154:                                    ; preds = %154, %.lr.ph9.split.us
  %indvars.iv104 = phi i64 [ 4096, %.lr.ph9.split.us ], [ %indvars.iv.next105.1, %154 ]
  %155 = phi float [ 0.000000e+00, %.lr.ph9.split.us ], [ %165, %154 ]
  %156 = phi float [ 0.000000e+00, %.lr.ph9.split.us ], [ %175, %154 ]
  %157 = phi float [ 0.000000e+00, %.lr.ph9.split.us ], [ %168, %154 ]
  %158 = phi float [ 0.000000e+00, %.lr.ph9.split.us ], [ %178, %154 ]
  %indvars.iv.next105 = add nsw i64 %indvars.iv104, -1
  %159 = fmul float %32, %158
  %160 = fmul float %157, %36
  %161 = fadd float %159, %160
  %162 = fmul float %exp2, %156
  %163 = fadd float %161, %162
  %164 = fmul float %155, %38
  %165 = fadd float %163, %164
  %166 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv.next105, i64 %indvars.iv106
  store float %165, float* %166, align 4
  %167 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next105, i64 %indvars.iv106
  %168 = load float, float* %167, align 4
  %indvars.iv.next105.1 = add nsw i64 %indvars.iv104, -2
  %169 = fmul float %32, %168
  %170 = fmul float %158, %36
  %171 = fadd float %169, %170
  %172 = fmul float %exp2, %165
  %173 = fadd float %171, %172
  %174 = fmul float %156, %38
  %175 = fadd float %173, %174
  %176 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv.next105.1, i64 %indvars.iv106
  store float %175, float* %176, align 4
  %177 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next105.1, i64 %indvars.iv106
  %178 = load float, float* %177, align 4
  %179 = icmp sgt i64 %indvars.iv.next105, 1
  br i1 %179, label %154, label %._crit_edge7.us

._crit_edge7.us:                                  ; preds = %154
  %indvars.iv.next107 = add nuw nsw i64 %indvars.iv106, 1
  %exitcond109 = icmp eq i64 %indvars.iv.next107, 2160
  br i1 %exitcond109, label %.loopexit.loopexit, label %.lr.ph9.split.us

.loopexit.loopexit:                               ; preds = %._crit_edge7.us
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %.preheader, %._crit_edge15
  br i1 true, label %.lr.ph3.split.us.preheader, label %._crit_edge4

.lr.ph3.split.us.preheader:                       ; preds = %.loopexit
  br label %.lr.ph3.split.us

.lr.ph3.split.us:                                 ; preds = %.lr.ph3.split.us.preheader, %._crit_edge.us
  %indvars.iv99 = phi i64 [ %indvars.iv.next100, %._crit_edge.us ], [ 0, %.lr.ph3.split.us.preheader ]
  %scevgep200 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv99, i64 2
  %scevgep206 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv99, i64 2
  %scevgep212 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv99, i64 2
  br i1 true, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph3.split.us
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph3.split.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph3.split.us ]
  br i1 false, label %._crit_edge.us, label %.lr.ph3.split.us.new.preheader

.lr.ph3.split.us.new.preheader:                   ; preds = %.prol.loopexit
  %180 = sub nsw i64 2158, %indvars.iv.unr.ph
  %181 = lshr i64 %180, 1
  %182 = add nuw nsw i64 %181, 1
  br i1 false, label %.lr.ph3.split.us.new.preheader241, label %min.iters.checked192

min.iters.checked192:                             ; preds = %.lr.ph3.split.us.new.preheader
  %n.mod.vf193 = and i64 %182, 3
  %n.vec194 = sub nsw i64 %182, %n.mod.vf193
  br i1 false, label %.lr.ph3.split.us.new.preheader241, label %vector.memcheck223

vector.memcheck223:                               ; preds = %min.iters.checked192
  %scevgep198 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv99, i64 %indvars.iv.unr.ph
  %183 = sub nsw i64 2158, %indvars.iv.unr.ph
  %184 = and i64 %183, 2158
  %185 = or i64 %indvars.iv.unr.ph, %184
  %scevgep201 = getelementptr float, float* %scevgep200, i64 %185
  %scevgep204 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv99, i64 %indvars.iv.unr.ph
  %scevgep207 = getelementptr float, float* %scevgep206, i64 %185
  %scevgep210 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv99, i64 %indvars.iv.unr.ph
  %scevgep213 = getelementptr float, float* %scevgep212, i64 %185
  %bound0215 = icmp ult float* %scevgep198, %scevgep207
  %bound1216 = icmp ult float* %scevgep204, %scevgep201
  %found.conflict217 = and i1 %bound0215, %bound1216
  %bound0218 = icmp ult float* %scevgep198, %scevgep213
  %bound1219 = icmp ult float* %scevgep210, %scevgep201
  %found.conflict220 = and i1 %bound0218, %bound1219
  %conflict.rdx221 = or i1 %found.conflict217, %found.conflict220
  %186 = or i64 %indvars.iv.unr.ph, 2
  %187 = shl nuw nsw i64 %181, 1
  %188 = add nuw nsw i64 %186, %187
  %189 = shl nuw nsw i64 %n.mod.vf193, 1
  %ind.end228 = sub nsw i64 %188, %189
  br i1 %conflict.rdx221, label %.lr.ph3.split.us.new.preheader241, label %vector.body188.preheader

vector.body188.preheader:                         ; preds = %vector.memcheck223
  br label %vector.body188

vector.body188:                                   ; preds = %vector.body188.preheader, %vector.body188
  %index225 = phi i64 [ %index.next226, %vector.body188 ], [ 0, %vector.body188.preheader ]
  %190 = shl i64 %index225, 1
  %offset.idx230 = or i64 %indvars.iv.unr.ph, %190
  %191 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv99, i64 %offset.idx230
  %192 = bitcast float* %191 to <8 x float>*
  %wide.vec234 = load <8 x float>, <8 x float>* %192, align 4, !alias.scope !16
  %193 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv99, i64 %offset.idx230
  %194 = bitcast float* %193 to <8 x float>*
  %wide.vec237 = load <8 x float>, <8 x float>* %194, align 4, !alias.scope !19
  %195 = fadd <8 x float> %wide.vec234, %wide.vec237
  %196 = shufflevector <8 x float> %195, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %197 = add nuw nsw i64 %offset.idx230, 1
  %198 = fadd <8 x float> %wide.vec234, %wide.vec237
  %199 = shufflevector <8 x float> %198, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %200 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv99, i64 %197
  %201 = getelementptr float, float* %200, i64 -1
  %202 = bitcast float* %201 to <8 x float>*
  %interleaved.vec240 = shufflevector <4 x float> %196, <4 x float> %199, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec240, <8 x float>* %202, align 4, !alias.scope !21, !noalias !23
  %index.next226 = add i64 %index225, 4
  %203 = icmp eq i64 %index.next226, %n.vec194
  br i1 %203, label %middle.block189, label %vector.body188, !llvm.loop !24

middle.block189:                                  ; preds = %vector.body188
  %cmp.n229 = icmp eq i64 %n.mod.vf193, 0
  br i1 %cmp.n229, label %._crit_edge.us, label %.lr.ph3.split.us.new.preheader241

.lr.ph3.split.us.new.preheader241:                ; preds = %middle.block189, %vector.memcheck223, %min.iters.checked192, %.lr.ph3.split.us.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr.ph, %vector.memcheck223 ], [ %indvars.iv.unr.ph, %min.iters.checked192 ], [ %indvars.iv.unr.ph, %.lr.ph3.split.us.new.preheader ], [ %ind.end228, %middle.block189 ]
  br label %.lr.ph3.split.us.new

.lr.ph3.split.us.new:                             ; preds = %.lr.ph3.split.us.new.preheader241, %.lr.ph3.split.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph3.split.us.new ], [ %indvars.iv.ph, %.lr.ph3.split.us.new.preheader241 ]
  %204 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv99, i64 %indvars.iv
  %205 = load float, float* %204, align 4
  %206 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv99, i64 %indvars.iv
  %207 = load float, float* %206, align 4
  %208 = fadd float %205, %207
  %209 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv99, i64 %indvars.iv
  store float %208, float* %209, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %210 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv99, i64 %indvars.iv.next
  %211 = load float, float* %210, align 4
  %212 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv99, i64 %indvars.iv.next
  %213 = load float, float* %212, align 4
  %214 = fadd float %211, %213
  %215 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv99, i64 %indvars.iv.next
  store float %214, float* %215, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2160
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph3.split.us.new, !llvm.loop !25

._crit_edge.us.loopexit:                          ; preds = %.lr.ph3.split.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block189, %.prol.loopexit
  %indvars.iv.next100 = add nuw nsw i64 %indvars.iv99, 1
  %exitcond102 = icmp eq i64 %indvars.iv.next100, 4096
  br i1 %exitcond102, label %._crit_edge4.loopexit, label %.lr.ph3.split.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %.lr.ph14, %.lr.ph9, %.lr.ph22, %.lr.ph28, %.preheader1.lr.ph, %.loopexit
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
  br i1 true, label %.lr.ph2.split.us.preheader, label %.loopexit

.lr.ph2.split.us.preheader:                       ; preds = %3
  br label %.lr.ph2.split.us

.lr.ph2.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph2.split.us.preheader
  %indvars.iv13 = phi i64 [ 0, %.lr.ph2.split.us.preheader ], [ %indvars.iv.next14, %._crit_edge.us ]
  %8 = mul nsw i64 %indvars.iv13, 2160
  br label %9

; <label>:9:                                      ; preds = %16, %.lr.ph2.split.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %16 ], [ 0, %.lr.ph2.split.us ]
  %10 = add i64 %8, %indvars.iv
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc = call i32 @fputc(i32 10, %struct._IO_FILE* %15) #6
  br label %16

; <label>:16:                                     ; preds = %14, %9
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv13, i64 %indvars.iv
  %19 = load float, float* %18, align 4
  %20 = fpext float %19 to double
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %20) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2160
  br i1 %exitcond, label %._crit_edge.us, label %9

._crit_edge.us:                                   ; preds = %16
  %indvars.iv.next14 = add nuw nsw i64 %indvars.iv13, 1
  %exitcond16 = icmp eq i64 %indvars.iv.next14, 4096
  br i1 %exitcond16, label %.loopexit.loopexit, label %.lr.ph2.split.us

.loopexit.loopexit:                               ; preds = %._crit_edge.us
  br label %.loopexit

.loopexit:                                        ; preds = %.loopexit.loopexit, %3
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #6
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
