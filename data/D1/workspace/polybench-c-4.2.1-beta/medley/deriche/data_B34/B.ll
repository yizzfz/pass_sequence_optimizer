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
  br i1 true, label %.lr.ph2.split.us.preheader, label %._crit_edge3

.lr.ph2.split.us.preheader:                       ; preds = %4
  br label %.lr.ph2.split.us

.lr.ph2.split.us:                                 ; preds = %.lr.ph2.split.us.preheader, %._crit_edge.us
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
  br label %.lr.ph28.split.us

.lr.ph28.split.us:                                ; preds = %.lr.ph28.split.us.preheader, %._crit_edge26.us
  %indvars.iv130 = phi i64 [ %indvars.iv.next131, %._crit_edge26.us ], [ 0, %.lr.ph28.split.us.preheader ]
  br label %39

; <label>:39:                                     ; preds = %39, %.lr.ph28.split.us
  %indvars.iv126 = phi i64 [ 0, %.lr.ph28.split.us ], [ %indvars.iv.next127.1, %39 ]
  %40 = phi float [ 0.000000e+00, %.lr.ph28.split.us ], [ %51, %39 ]
  %41 = phi float [ 0.000000e+00, %.lr.ph28.split.us ], [ %62, %39 ]
  %42 = phi float [ 0.000000e+00, %.lr.ph28.split.us ], [ %64, %39 ]
  %43 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv130, i64 %indvars.iv126
  %44 = load float, float* %43, align 4
  %45 = fmul float %20, %44
  %46 = fmul float %31, %42
  %47 = fadd float %45, %46
  %48 = fmul float %exp2, %41
  %49 = fadd float %47, %48
  %50 = fmul float %40, %38
  %51 = fadd float %49, %50
  %52 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv130, i64 %indvars.iv126
  store float %51, float* %52, align 4
  %53 = load float, float* %43, align 4
  %indvars.iv.next127 = or i64 %indvars.iv126, 1
  %54 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv130, i64 %indvars.iv.next127
  %55 = load float, float* %54, align 4
  %56 = fmul float %20, %55
  %57 = fmul float %31, %53
  %58 = fadd float %56, %57
  %59 = fmul float %exp2, %51
  %60 = fadd float %58, %59
  %61 = fmul float %41, %38
  %62 = fadd float %60, %61
  %63 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv130, i64 %indvars.iv.next127
  store float %62, float* %63, align 4
  %64 = load float, float* %54, align 4
  %indvars.iv.next127.1 = add nsw i64 %indvars.iv126, 2
  %exitcond129.1 = icmp eq i64 %indvars.iv.next127.1, 2160
  br i1 %exitcond129.1, label %._crit_edge26.us, label %39

._crit_edge26.us:                                 ; preds = %39
  %indvars.iv.next131 = add nuw nsw i64 %indvars.iv130, 1
  %exitcond133 = icmp eq i64 %indvars.iv.next131, 4096
  br i1 %exitcond133, label %.lr.ph22.split.us.preheader, label %.lr.ph28.split.us

.lr.ph22.split.us.preheader:                      ; preds = %._crit_edge26.us
  br label %.lr.ph22.split.us

.lr.ph22.split.us:                                ; preds = %._crit_edge20.us, %.lr.ph22.split.us.preheader
  %indvars.iv124 = phi i64 [ 0, %.lr.ph22.split.us.preheader ], [ %indvars.iv.next125, %._crit_edge20.us ]
  br label %65

; <label>:65:                                     ; preds = %65, %.lr.ph22.split.us
  %indvars.iv122 = phi i64 [ 2160, %.lr.ph22.split.us ], [ %indvars.iv.next123.1, %65 ]
  %66 = phi float [ 0.000000e+00, %.lr.ph22.split.us ], [ %76, %65 ]
  %67 = phi float [ 0.000000e+00, %.lr.ph22.split.us ], [ %86, %65 ]
  %68 = phi float [ 0.000000e+00, %.lr.ph22.split.us ], [ %79, %65 ]
  %69 = phi float [ 0.000000e+00, %.lr.ph22.split.us ], [ %89, %65 ]
  %indvars.iv.next123 = add nsw i64 %indvars.iv122, -1
  %70 = fmul float %32, %69
  %71 = fmul float %68, %36
  %72 = fadd float %70, %71
  %73 = fmul float %exp2, %67
  %74 = fadd float %72, %73
  %75 = fmul float %66, %38
  %76 = fadd float %74, %75
  %77 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv124, i64 %indvars.iv.next123
  store float %76, float* %77, align 4
  %78 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv124, i64 %indvars.iv.next123
  %79 = load float, float* %78, align 4
  %indvars.iv.next123.1 = add nsw i64 %indvars.iv122, -2
  %80 = fmul float %32, %79
  %81 = fmul float %69, %36
  %82 = fadd float %80, %81
  %83 = fmul float %exp2, %76
  %84 = fadd float %82, %83
  %85 = fmul float %67, %38
  %86 = fadd float %84, %85
  %87 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv124, i64 %indvars.iv.next123.1
  store float %86, float* %87, align 4
  %88 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv124, i64 %indvars.iv.next123.1
  %89 = load float, float* %88, align 4
  %90 = icmp sgt i64 %indvars.iv.next123, 1
  br i1 %90, label %65, label %._crit_edge20.us

._crit_edge20.us:                                 ; preds = %65
  %indvars.iv.next125 = add nuw nsw i64 %indvars.iv124, 1
  %exitcond218 = icmp eq i64 %indvars.iv.next125, 4096
  br i1 %exitcond218, label %.preheader1.us.preheader, label %.lr.ph22.split.us

.preheader1.us.preheader:                         ; preds = %._crit_edge20.us
  br label %.preheader1.us

.preheader1.us:                                   ; preds = %.preheader1.us.preheader, %._crit_edge17.us
  %indvars.iv117 = phi i64 [ %indvars.iv.next118, %._crit_edge17.us ], [ 0, %.preheader1.us.preheader ]
  %scevgep140 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv117, i64 2
  %scevgep146 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv117, i64 2
  %scevgep152 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv117, i64 2
  br i1 true, label %.prol.loopexit114, label %.prol.preheader113

.prol.preheader113:                               ; preds = %.preheader1.us
  br label %.prol.loopexit114

.prol.loopexit114:                                ; preds = %.prol.preheader113, %.preheader1.us
  %indvars.iv109.unr.ph = phi i64 [ 1, %.prol.preheader113 ], [ 0, %.preheader1.us ]
  br i1 false, label %._crit_edge17.us, label %.preheader1.us.new.preheader

.preheader1.us.new.preheader:                     ; preds = %.prol.loopexit114
  %91 = sub nsw i64 2158, %indvars.iv109.unr.ph
  %92 = lshr i64 %91, 1
  %93 = add nuw nsw i64 %92, 1
  br i1 false, label %.preheader1.us.new.preheader216, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader1.us.new.preheader
  %n.mod.vf = and i64 %93, 3
  %n.vec = sub nsw i64 %93, %n.mod.vf
  br i1 false, label %.preheader1.us.new.preheader216, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep138 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv117, i64 %indvars.iv109.unr.ph
  %94 = and i64 %91, 2158
  %95 = or i64 %indvars.iv109.unr.ph, %94
  %scevgep141 = getelementptr float, float* %scevgep140, i64 %95
  %scevgep144 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv117, i64 %indvars.iv109.unr.ph
  %scevgep147 = getelementptr float, float* %scevgep146, i64 %95
  %scevgep150 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv117, i64 %indvars.iv109.unr.ph
  %scevgep153 = getelementptr float, float* %scevgep152, i64 %95
  %bound0 = icmp ult float* %scevgep138, %scevgep147
  %bound1 = icmp ult float* %scevgep144, %scevgep141
  %found.conflict = and i1 %bound0, %bound1
  %bound0155 = icmp ult float* %scevgep138, %scevgep153
  %bound1156 = icmp ult float* %scevgep150, %scevgep141
  %found.conflict157 = and i1 %bound0155, %bound1156
  %conflict.rdx = or i1 %found.conflict, %found.conflict157
  %96 = or i64 %indvars.iv109.unr.ph, 2
  %97 = shl nuw nsw i64 %92, 1
  %98 = add nuw nsw i64 %96, %97
  %99 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub nsw i64 %98, %99
  br i1 %conflict.rdx, label %.preheader1.us.new.preheader216, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %100 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv109.unr.ph, %100
  %101 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv117, i64 %offset.idx
  %102 = bitcast float* %101 to <8 x float>*
  %wide.vec = load <8 x float>, <8 x float>* %102, align 4, !alias.scope !6
  %103 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv117, i64 %offset.idx
  %104 = bitcast float* %103 to <8 x float>*
  %wide.vec159 = load <8 x float>, <8 x float>* %104, align 4, !alias.scope !9
  %105 = fadd <8 x float> %wide.vec, %wide.vec159
  %106 = add nuw nsw i64 %offset.idx, 1
  %107 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv117, i64 %106
  %108 = getelementptr float, float* %107, i64 -1
  %109 = bitcast float* %108 to <8 x float>*
  store <8 x float> %105, <8 x float>* %109, align 4, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %110 = icmp eq i64 %index.next, %n.vec
  br i1 %110, label %middle.block, label %vector.body, !llvm.loop !14

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge17.us, label %.preheader1.us.new.preheader216

.preheader1.us.new.preheader216:                  ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader1.us.new.preheader
  %indvars.iv109.ph = phi i64 [ %indvars.iv109.unr.ph, %vector.memcheck ], [ %indvars.iv109.unr.ph, %min.iters.checked ], [ %indvars.iv109.unr.ph, %.preheader1.us.new.preheader ], [ %ind.end, %middle.block ]
  br label %.preheader1.us.new

.preheader1.us.new:                               ; preds = %.preheader1.us.new.preheader216, %.preheader1.us.new
  %indvars.iv109 = phi i64 [ %indvars.iv.next110.1, %.preheader1.us.new ], [ %indvars.iv109.ph, %.preheader1.us.new.preheader216 ]
  %111 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv117, i64 %indvars.iv109
  %112 = load float, float* %111, align 4
  %113 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv117, i64 %indvars.iv109
  %114 = load float, float* %113, align 4
  %115 = fadd float %112, %114
  %116 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv117, i64 %indvars.iv109
  store float %115, float* %116, align 4
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv109, 1
  %117 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv117, i64 %indvars.iv.next110
  %118 = load float, float* %117, align 4
  %119 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv117, i64 %indvars.iv.next110
  %120 = load float, float* %119, align 4
  %121 = fadd float %118, %120
  %122 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv117, i64 %indvars.iv.next110
  store float %121, float* %122, align 4
  %indvars.iv.next110.1 = add nsw i64 %indvars.iv109, 2
  %exitcond112.1 = icmp eq i64 %indvars.iv.next110.1, 2160
  br i1 %exitcond112.1, label %._crit_edge17.us.loopexit, label %.preheader1.us.new, !llvm.loop !15

._crit_edge17.us.loopexit:                        ; preds = %.preheader1.us.new
  br label %._crit_edge17.us

._crit_edge17.us:                                 ; preds = %._crit_edge17.us.loopexit, %middle.block, %.prol.loopexit114
  %indvars.iv.next118 = add nuw nsw i64 %indvars.iv117, 1
  %exitcond120 = icmp eq i64 %indvars.iv.next118, 4096
  br i1 %exitcond120, label %.preheader.loopexit, label %.preheader1.us

.preheader.loopexit:                              ; preds = %._crit_edge17.us
  br label %.preheader

.preheader:                                       ; preds = %.preheader.loopexit, %7
  br i1 true, label %.lr.ph14, label %._crit_edge10

.lr.ph14:                                         ; preds = %.preheader
  br i1 true, label %.lr.ph14.split.us.preheader, label %._crit_edge4

.lr.ph14.split.us.preheader:                      ; preds = %.lr.ph14
  br label %.lr.ph14.split.us

.lr.ph14.split.us:                                ; preds = %.lr.ph14.split.us.preheader, %._crit_edge13.us
  %indvars.iv104 = phi i64 [ %indvars.iv.next105, %._crit_edge13.us ], [ 0, %.lr.ph14.split.us.preheader ]
  br label %123

; <label>:123:                                    ; preds = %123, %.lr.ph14.split.us
  %indvars.iv100 = phi i64 [ 0, %.lr.ph14.split.us ], [ %indvars.iv.next101.1, %123 ]
  %124 = phi float [ 0.000000e+00, %.lr.ph14.split.us ], [ %135, %123 ]
  %125 = phi float [ 0.000000e+00, %.lr.ph14.split.us ], [ %146, %123 ]
  %126 = phi float [ 0.000000e+00, %.lr.ph14.split.us ], [ %148, %123 ]
  %127 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv100, i64 %indvars.iv104
  %128 = load float, float* %127, align 4
  %129 = fmul float %20, %128
  %130 = fmul float %31, %126
  %131 = fadd float %129, %130
  %132 = fmul float %exp2, %125
  %133 = fadd float %131, %132
  %134 = fmul float %124, %38
  %135 = fadd float %133, %134
  %136 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv100, i64 %indvars.iv104
  store float %135, float* %136, align 4
  %137 = load float, float* %127, align 4
  %indvars.iv.next101 = or i64 %indvars.iv100, 1
  %138 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next101, i64 %indvars.iv104
  %139 = load float, float* %138, align 4
  %140 = fmul float %20, %139
  %141 = fmul float %31, %137
  %142 = fadd float %140, %141
  %143 = fmul float %exp2, %135
  %144 = fadd float %142, %143
  %145 = fmul float %125, %38
  %146 = fadd float %144, %145
  %147 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv.next101, i64 %indvars.iv104
  store float %146, float* %147, align 4
  %148 = load float, float* %138, align 4
  %indvars.iv.next101.1 = add nsw i64 %indvars.iv100, 2
  %exitcond103.1 = icmp eq i64 %indvars.iv.next101.1, 4096
  br i1 %exitcond103.1, label %._crit_edge13.us, label %123

._crit_edge13.us:                                 ; preds = %123
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %exitcond107 = icmp eq i64 %indvars.iv.next105, 2160
  br i1 %exitcond107, label %.lr.ph9.split.us.preheader, label %.lr.ph14.split.us

.lr.ph9.split.us.preheader:                       ; preds = %._crit_edge13.us
  br label %.lr.ph9.split.us

.lr.ph9.split.us:                                 ; preds = %._crit_edge7.us, %.lr.ph9.split.us.preheader
  %indvars.iv98 = phi i64 [ 0, %.lr.ph9.split.us.preheader ], [ %indvars.iv.next99, %._crit_edge7.us ]
  br label %149

; <label>:149:                                    ; preds = %149, %.lr.ph9.split.us
  %indvars.iv96 = phi i64 [ 4096, %.lr.ph9.split.us ], [ %indvars.iv.next97.1, %149 ]
  %150 = phi float [ 0.000000e+00, %.lr.ph9.split.us ], [ %160, %149 ]
  %151 = phi float [ 0.000000e+00, %.lr.ph9.split.us ], [ %170, %149 ]
  %152 = phi float [ 0.000000e+00, %.lr.ph9.split.us ], [ %163, %149 ]
  %153 = phi float [ 0.000000e+00, %.lr.ph9.split.us ], [ %173, %149 ]
  %indvars.iv.next97 = add nsw i64 %indvars.iv96, -1
  %154 = fmul float %32, %153
  %155 = fmul float %152, %36
  %156 = fadd float %154, %155
  %157 = fmul float %exp2, %151
  %158 = fadd float %156, %157
  %159 = fmul float %150, %38
  %160 = fadd float %158, %159
  %161 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv.next97, i64 %indvars.iv98
  store float %160, float* %161, align 4
  %162 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next97, i64 %indvars.iv98
  %163 = load float, float* %162, align 4
  %indvars.iv.next97.1 = add nsw i64 %indvars.iv96, -2
  %164 = fmul float %32, %163
  %165 = fmul float %153, %36
  %166 = fadd float %164, %165
  %167 = fmul float %exp2, %160
  %168 = fadd float %166, %167
  %169 = fmul float %151, %38
  %170 = fadd float %168, %169
  %171 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv.next97.1, i64 %indvars.iv98
  store float %170, float* %171, align 4
  %172 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next97.1, i64 %indvars.iv98
  %173 = load float, float* %172, align 4
  %174 = icmp sgt i64 %indvars.iv.next97, 1
  br i1 %174, label %149, label %._crit_edge7.us

._crit_edge7.us:                                  ; preds = %149
  %indvars.iv.next99 = add nuw nsw i64 %indvars.iv98, 1
  %exitcond217 = icmp eq i64 %indvars.iv.next99, 2160
  br i1 %exitcond217, label %._crit_edge10.loopexit, label %.lr.ph9.split.us

._crit_edge10.loopexit:                           ; preds = %._crit_edge7.us
  br label %._crit_edge10

._crit_edge10:                                    ; preds = %._crit_edge10.loopexit, %.preheader
  %175 = phi i1 [ false, %.preheader ], [ true, %._crit_edge10.loopexit ]
  br i1 %175, label %.lr.ph3.split.us.preheader, label %._crit_edge4

.lr.ph3.split.us.preheader:                       ; preds = %._crit_edge10
  br label %.lr.ph3.split.us

.lr.ph3.split.us:                                 ; preds = %.lr.ph3.split.us.preheader, %._crit_edge.us
  %indvars.iv92 = phi i64 [ %indvars.iv.next93, %._crit_edge.us ], [ 0, %.lr.ph3.split.us.preheader ]
  %scevgep174 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv92, i64 2
  %scevgep180 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv92, i64 2
  %scevgep186 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv92, i64 2
  br i1 true, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph3.split.us
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph3.split.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph3.split.us ]
  br i1 false, label %._crit_edge.us, label %.lr.ph3.split.us.new.preheader

.lr.ph3.split.us.new.preheader:                   ; preds = %.prol.loopexit
  %176 = sub nsw i64 2158, %indvars.iv.unr.ph
  %177 = lshr i64 %176, 1
  %178 = add nuw nsw i64 %177, 1
  br i1 false, label %.lr.ph3.split.us.new.preheader215, label %min.iters.checked166

min.iters.checked166:                             ; preds = %.lr.ph3.split.us.new.preheader
  %n.mod.vf167 = and i64 %178, 3
  %n.vec168 = sub nsw i64 %178, %n.mod.vf167
  br i1 false, label %.lr.ph3.split.us.new.preheader215, label %vector.memcheck197

vector.memcheck197:                               ; preds = %min.iters.checked166
  %scevgep172 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv92, i64 %indvars.iv.unr.ph
  %179 = and i64 %176, 2158
  %180 = or i64 %indvars.iv.unr.ph, %179
  %scevgep175 = getelementptr float, float* %scevgep174, i64 %180
  %scevgep178 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv92, i64 %indvars.iv.unr.ph
  %scevgep181 = getelementptr float, float* %scevgep180, i64 %180
  %scevgep184 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv92, i64 %indvars.iv.unr.ph
  %scevgep187 = getelementptr float, float* %scevgep186, i64 %180
  %bound0189 = icmp ult float* %scevgep172, %scevgep181
  %bound1190 = icmp ult float* %scevgep178, %scevgep175
  %found.conflict191 = and i1 %bound0189, %bound1190
  %bound0192 = icmp ult float* %scevgep172, %scevgep187
  %bound1193 = icmp ult float* %scevgep184, %scevgep175
  %found.conflict194 = and i1 %bound0192, %bound1193
  %conflict.rdx195 = or i1 %found.conflict191, %found.conflict194
  %181 = or i64 %indvars.iv.unr.ph, 2
  %182 = shl nuw nsw i64 %177, 1
  %183 = add nuw nsw i64 %181, %182
  %184 = shl nuw nsw i64 %n.mod.vf167, 1
  %ind.end202 = sub nsw i64 %183, %184
  br i1 %conflict.rdx195, label %.lr.ph3.split.us.new.preheader215, label %vector.body162.preheader

vector.body162.preheader:                         ; preds = %vector.memcheck197
  br label %vector.body162

vector.body162:                                   ; preds = %vector.body162.preheader, %vector.body162
  %index199 = phi i64 [ %index.next200, %vector.body162 ], [ 0, %vector.body162.preheader ]
  %185 = shl i64 %index199, 1
  %offset.idx204 = or i64 %indvars.iv.unr.ph, %185
  %186 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv92, i64 %offset.idx204
  %187 = bitcast float* %186 to <8 x float>*
  %wide.vec208 = load <8 x float>, <8 x float>* %187, align 4, !alias.scope !16
  %188 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv92, i64 %offset.idx204
  %189 = bitcast float* %188 to <8 x float>*
  %wide.vec211 = load <8 x float>, <8 x float>* %189, align 4, !alias.scope !19
  %190 = fadd <8 x float> %wide.vec208, %wide.vec211
  %191 = add nuw nsw i64 %offset.idx204, 1
  %192 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv92, i64 %191
  %193 = getelementptr float, float* %192, i64 -1
  %194 = bitcast float* %193 to <8 x float>*
  store <8 x float> %190, <8 x float>* %194, align 4, !alias.scope !21, !noalias !23
  %index.next200 = add i64 %index199, 4
  %195 = icmp eq i64 %index.next200, %n.vec168
  br i1 %195, label %middle.block163, label %vector.body162, !llvm.loop !24

middle.block163:                                  ; preds = %vector.body162
  %cmp.n203 = icmp eq i64 %n.mod.vf167, 0
  br i1 %cmp.n203, label %._crit_edge.us, label %.lr.ph3.split.us.new.preheader215

.lr.ph3.split.us.new.preheader215:                ; preds = %middle.block163, %vector.memcheck197, %min.iters.checked166, %.lr.ph3.split.us.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr.ph, %vector.memcheck197 ], [ %indvars.iv.unr.ph, %min.iters.checked166 ], [ %indvars.iv.unr.ph, %.lr.ph3.split.us.new.preheader ], [ %ind.end202, %middle.block163 ]
  br label %.lr.ph3.split.us.new

.lr.ph3.split.us.new:                             ; preds = %.lr.ph3.split.us.new.preheader215, %.lr.ph3.split.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph3.split.us.new ], [ %indvars.iv.ph, %.lr.ph3.split.us.new.preheader215 ]
  %196 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv92, i64 %indvars.iv
  %197 = load float, float* %196, align 4
  %198 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv92, i64 %indvars.iv
  %199 = load float, float* %198, align 4
  %200 = fadd float %197, %199
  %201 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv92, i64 %indvars.iv
  store float %200, float* %201, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %202 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv92, i64 %indvars.iv.next
  %203 = load float, float* %202, align 4
  %204 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv92, i64 %indvars.iv.next
  %205 = load float, float* %204, align 4
  %206 = fadd float %203, %205
  %207 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv92, i64 %indvars.iv.next
  store float %206, float* %207, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2160
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph3.split.us.new, !llvm.loop !25

._crit_edge.us.loopexit:                          ; preds = %.lr.ph3.split.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block163, %.prol.loopexit
  %indvars.iv.next93 = add nuw nsw i64 %indvars.iv92, 1
  %exitcond = icmp eq i64 %indvars.iv.next93, 4096
  br i1 %exitcond, label %._crit_edge4.loopexit, label %.lr.ph3.split.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %._crit_edge10, %.lr.ph14, %.lr.ph28
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
  br i1 true, label %.lr.ph2.split.us.preheader, label %._crit_edge3

.lr.ph2.split.us.preheader:                       ; preds = %3
  br label %.lr.ph2.split.us

.lr.ph2.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph2.split.us.preheader
  %indvars.iv11 = phi i64 [ 0, %.lr.ph2.split.us.preheader ], [ %indvars.iv.next12, %._crit_edge.us ]
  %8 = mul nsw i64 %indvars.iv11, 2160
  br label %9

; <label>:9:                                      ; preds = %16, %.lr.ph2.split.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %16 ], [ 0, %.lr.ph2.split.us ]
  %10 = add nsw i64 %8, %indvars.iv
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
  %18 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv11, i64 %indvars.iv
  %19 = load float, float* %18, align 4
  %20 = fpext float %19 to double
  %21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %20) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2160
  br i1 %exitcond, label %._crit_edge.us, label %9

._crit_edge.us:                                   ; preds = %16
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next12, 4096
  br i1 %exitcond14, label %._crit_edge3.loopexit, label %.lr.ph2.split.us

._crit_edge3.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit, %3
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
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
