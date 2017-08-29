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
  br i1 %13, label %14, label %19

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to [2160 x float]*
  call fastcc void @print_array(i32 4096, i32 2160, [2160 x float]* %18)
  br label %19

; <label>:19:                                     ; preds = %14, %17, %2
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
  br i1 true, label %.lr.ph32, label %._crit_edge21

.lr.ph32:                                         ; preds = %7
  br i1 true, label %.lr.ph32.split.us.preheader, label %._crit_edge3

.lr.ph32.split.us.preheader:                      ; preds = %.lr.ph32
  %39 = insertelement <2 x float> undef, float %31, i32 0
  %40 = insertelement <2 x float> %39, float %20, i32 1
  br label %.lr.ph32.split.us

.lr.ph32.split.us:                                ; preds = %.lr.ph32.split.us.preheader, %._crit_edge30.us
  %indvars.iv138 = phi i64 [ %indvars.iv.next139, %._crit_edge30.us ], [ 0, %.lr.ph32.split.us.preheader ]
  br i1 true, label %.prol.loopexit154, label %.prol.preheader153

.prol.preheader153:                               ; preds = %.lr.ph32.split.us
  br label %.prol.loopexit154

.prol.loopexit154:                                ; preds = %.prol.preheader153, %.lr.ph32.split.us
  %indvars.iv134.unr.ph = phi i64 [ 1, %.prol.preheader153 ], [ 0, %.lr.ph32.split.us ]
  br i1 false, label %._crit_edge30.us, label %.lr.ph32.split.us.new.preheader

.lr.ph32.split.us.new.preheader:                  ; preds = %.prol.loopexit154
  br label %.lr.ph32.split.us.new

.lr.ph32.split.us.new:                            ; preds = %.lr.ph32.split.us.new.preheader, %.lr.ph32.split.us.new
  %indvars.iv134 = phi i64 [ %indvars.iv.next135.1, %.lr.ph32.split.us.new ], [ %indvars.iv134.unr.ph, %.lr.ph32.split.us.new.preheader ]
  %41 = phi float [ %52, %.lr.ph32.split.us.new ], [ 0.000000e+00, %.lr.ph32.split.us.new.preheader ]
  %42 = phi float [ %64, %.lr.ph32.split.us.new ], [ 0.000000e+00, %.lr.ph32.split.us.new.preheader ]
  %43 = phi float [ %66, %.lr.ph32.split.us.new ], [ 0.000000e+00, %.lr.ph32.split.us.new.preheader ]
  %44 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv138, i64 %indvars.iv134
  %45 = load float, float* %44, align 4
  %46 = fmul float %20, %45
  %47 = fmul float %31, %43
  %48 = fadd float %46, %47
  %49 = fmul float %exp2, %42
  %50 = fadd float %48, %49
  %51 = fmul float %41, %38
  %52 = fadd float %50, %51
  %53 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv138, i64 %indvars.iv134
  store float %52, float* %53, align 4
  %54 = bitcast float* %44 to <2 x float>*
  %indvars.iv.next135 = add nuw nsw i64 %indvars.iv134, 1
  %55 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv138, i64 %indvars.iv.next135
  %56 = load <2 x float>, <2 x float>* %54, align 4
  %57 = fmul <2 x float> %40, %56
  %58 = extractelement <2 x float> %57, i32 0
  %59 = extractelement <2 x float> %57, i32 1
  %60 = fadd float %59, %58
  %61 = fmul float %exp2, %52
  %62 = fadd float %60, %61
  %63 = fmul float %42, %38
  %64 = fadd float %62, %63
  %65 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv138, i64 %indvars.iv.next135
  store float %64, float* %65, align 4
  %66 = load float, float* %55, align 4
  %indvars.iv.next135.1 = add nuw nsw i64 %indvars.iv134, 2
  %exitcond137.1 = icmp eq i64 %indvars.iv.next135.1, 2160
  br i1 %exitcond137.1, label %._crit_edge30.us.loopexit, label %.lr.ph32.split.us.new

._crit_edge30.us.loopexit:                        ; preds = %.lr.ph32.split.us.new
  br label %._crit_edge30.us

._crit_edge30.us:                                 ; preds = %._crit_edge30.us.loopexit, %.prol.loopexit154
  %indvars.iv.next139 = add nuw nsw i64 %indvars.iv138, 1
  %exitcond141 = icmp eq i64 %indvars.iv.next139, 4096
  br i1 %exitcond141, label %._crit_edge33, label %.lr.ph32.split.us

._crit_edge33:                                    ; preds = %._crit_edge30.us
  br i1 true, label %.lr.ph26, label %._crit_edge21

.lr.ph26:                                         ; preds = %._crit_edge33
  br i1 true, label %.lr.ph26.split.us.preheader, label %._crit_edge3

.lr.ph26.split.us.preheader:                      ; preds = %.lr.ph26
  br label %.lr.ph26.split.us

.lr.ph26.split.us:                                ; preds = %._crit_edge24.us, %.lr.ph26.split.us.preheader
  %indvars.iv129 = phi i64 [ 0, %.lr.ph26.split.us.preheader ], [ %indvars.iv.next130, %._crit_edge24.us ]
  br label %67

; <label>:67:                                     ; preds = %67, %.lr.ph26.split.us
  %indvars.iv127 = phi i64 [ 2160, %.lr.ph26.split.us ], [ %indvars.iv.next128.1, %67 ]
  %68 = phi float [ 0.000000e+00, %.lr.ph26.split.us ], [ %78, %67 ]
  %69 = phi float [ 0.000000e+00, %.lr.ph26.split.us ], [ %88, %67 ]
  %70 = phi float [ 0.000000e+00, %.lr.ph26.split.us ], [ %81, %67 ]
  %71 = phi float [ 0.000000e+00, %.lr.ph26.split.us ], [ %91, %67 ]
  %indvars.iv.next128 = add nsw i64 %indvars.iv127, -1
  %72 = fmul float %32, %71
  %73 = fmul float %70, %36
  %74 = fadd float %72, %73
  %75 = fmul float %exp2, %69
  %76 = fadd float %74, %75
  %77 = fmul float %68, %38
  %78 = fadd float %76, %77
  %79 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv129, i64 %indvars.iv.next128
  store float %78, float* %79, align 4
  %80 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv129, i64 %indvars.iv.next128
  %81 = load float, float* %80, align 4
  %indvars.iv.next128.1 = add nsw i64 %indvars.iv127, -2
  %82 = fmul float %32, %81
  %83 = fmul float %71, %36
  %84 = fadd float %82, %83
  %85 = fmul float %exp2, %78
  %86 = fadd float %84, %85
  %87 = fmul float %69, %38
  %88 = fadd float %86, %87
  %89 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv129, i64 %indvars.iv.next128.1
  store float %88, float* %89, align 4
  %90 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv129, i64 %indvars.iv.next128.1
  %91 = load float, float* %90, align 4
  %92 = icmp sgt i64 %indvars.iv.next128, 1
  br i1 %92, label %67, label %._crit_edge24.us

._crit_edge24.us:                                 ; preds = %67
  %indvars.iv.next130 = add nuw nsw i64 %indvars.iv129, 1
  %exitcond132 = icmp eq i64 %indvars.iv.next130, 4096
  br i1 %exitcond132, label %._crit_edge27, label %.lr.ph26.split.us

._crit_edge27:                                    ; preds = %._crit_edge24.us
  br i1 true, label %.lr.ph20, label %._crit_edge21

.lr.ph20:                                         ; preds = %._crit_edge27
  br i1 true, label %.lr.ph20.split.us.preheader, label %._crit_edge3

.lr.ph20.split.us.preheader:                      ; preds = %.lr.ph20
  br label %.lr.ph20.split.us

.lr.ph20.split.us:                                ; preds = %.lr.ph20.split.us.preheader, %._crit_edge18.us
  %indvars.iv122 = phi i64 [ %indvars.iv.next123, %._crit_edge18.us ], [ 0, %.lr.ph20.split.us.preheader ]
  %scevgep165 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv122, i64 2
  %scevgep171 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv122, i64 2
  %scevgep177 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv122, i64 2
  br i1 true, label %.prol.loopexit150, label %.prol.preheader149

.prol.preheader149:                               ; preds = %.lr.ph20.split.us
  br label %.prol.loopexit150

.prol.loopexit150:                                ; preds = %.prol.preheader149, %.lr.ph20.split.us
  %indvars.iv118.unr.ph = phi i64 [ 1, %.prol.preheader149 ], [ 0, %.lr.ph20.split.us ]
  br i1 false, label %._crit_edge18.us, label %.lr.ph20.split.us.new.preheader

.lr.ph20.split.us.new.preheader:                  ; preds = %.prol.loopexit150
  %93 = sub nsw i64 2158, %indvars.iv118.unr.ph
  %94 = lshr i64 %93, 1
  %95 = add nuw nsw i64 %94, 1
  br i1 false, label %.lr.ph20.split.us.new.preheader241, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph20.split.us.new.preheader
  %n.mod.vf = and i64 %95, 3
  %n.vec = sub nsw i64 %95, %n.mod.vf
  br i1 false, label %.lr.ph20.split.us.new.preheader241, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep163 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv122, i64 %indvars.iv118.unr.ph
  %96 = sub nsw i64 2158, %indvars.iv118.unr.ph
  %97 = and i64 %96, 2158
  %98 = or i64 %indvars.iv118.unr.ph, %97
  %scevgep166 = getelementptr float, float* %scevgep165, i64 %98
  %scevgep169 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv122, i64 %indvars.iv118.unr.ph
  %scevgep172 = getelementptr float, float* %scevgep171, i64 %98
  %scevgep175 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv122, i64 %indvars.iv118.unr.ph
  %scevgep178 = getelementptr float, float* %scevgep177, i64 %98
  %bound0 = icmp ult float* %scevgep163, %scevgep172
  %bound1 = icmp ult float* %scevgep169, %scevgep166
  %found.conflict = and i1 %bound0, %bound1
  %bound0180 = icmp ult float* %scevgep163, %scevgep178
  %bound1181 = icmp ult float* %scevgep175, %scevgep166
  %found.conflict182 = and i1 %bound0180, %bound1181
  %conflict.rdx = or i1 %found.conflict, %found.conflict182
  %99 = or i64 %indvars.iv118.unr.ph, 2
  %100 = shl nuw nsw i64 %94, 1
  %101 = add nuw nsw i64 %99, %100
  %102 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub nsw i64 %101, %102
  br i1 %conflict.rdx, label %.lr.ph20.split.us.new.preheader241, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %103 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv118.unr.ph, %103
  %104 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv122, i64 %offset.idx
  %105 = bitcast float* %104 to <8 x float>*
  %wide.vec = load <8 x float>, <8 x float>* %105, align 4, !alias.scope !6
  %106 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv122, i64 %offset.idx
  %107 = bitcast float* %106 to <8 x float>*
  %wide.vec184 = load <8 x float>, <8 x float>* %107, align 4, !alias.scope !9
  %108 = fadd <8 x float> %wide.vec, %wide.vec184
  %109 = shufflevector <8 x float> %108, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %110 = add nuw nsw i64 %offset.idx, 1
  %111 = fadd <8 x float> %wide.vec, %wide.vec184
  %112 = shufflevector <8 x float> %111, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %113 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv122, i64 %110
  %114 = getelementptr float, float* %113, i64 -1
  %115 = bitcast float* %114 to <8 x float>*
  %interleaved.vec = shufflevector <4 x float> %109, <4 x float> %112, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec, <8 x float>* %115, align 4, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %116 = icmp eq i64 %index.next, %n.vec
  br i1 %116, label %middle.block, label %vector.body, !llvm.loop !14

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge18.us, label %.lr.ph20.split.us.new.preheader241

.lr.ph20.split.us.new.preheader241:               ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph20.split.us.new.preheader
  %indvars.iv118.ph = phi i64 [ %indvars.iv118.unr.ph, %vector.memcheck ], [ %indvars.iv118.unr.ph, %min.iters.checked ], [ %indvars.iv118.unr.ph, %.lr.ph20.split.us.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph20.split.us.new

.lr.ph20.split.us.new:                            ; preds = %.lr.ph20.split.us.new.preheader241, %.lr.ph20.split.us.new
  %indvars.iv118 = phi i64 [ %indvars.iv.next119.1, %.lr.ph20.split.us.new ], [ %indvars.iv118.ph, %.lr.ph20.split.us.new.preheader241 ]
  %117 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv122, i64 %indvars.iv118
  %118 = load float, float* %117, align 4
  %119 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv122, i64 %indvars.iv118
  %120 = load float, float* %119, align 4
  %121 = fadd float %118, %120
  %122 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv122, i64 %indvars.iv118
  store float %121, float* %122, align 4
  %indvars.iv.next119 = add nuw nsw i64 %indvars.iv118, 1
  %123 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv122, i64 %indvars.iv.next119
  %124 = load float, float* %123, align 4
  %125 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv122, i64 %indvars.iv.next119
  %126 = load float, float* %125, align 4
  %127 = fadd float %124, %126
  %128 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv122, i64 %indvars.iv.next119
  store float %127, float* %128, align 4
  %indvars.iv.next119.1 = add nsw i64 %indvars.iv118, 2
  %exitcond121.1 = icmp eq i64 %indvars.iv.next119.1, 2160
  br i1 %exitcond121.1, label %._crit_edge18.us.loopexit, label %.lr.ph20.split.us.new, !llvm.loop !15

._crit_edge18.us.loopexit:                        ; preds = %.lr.ph20.split.us.new
  br label %._crit_edge18.us

._crit_edge18.us:                                 ; preds = %._crit_edge18.us.loopexit, %middle.block, %.prol.loopexit150
  %indvars.iv.next123 = add nuw nsw i64 %indvars.iv122, 1
  %exitcond125 = icmp eq i64 %indvars.iv.next123, 4096
  br i1 %exitcond125, label %._crit_edge21.loopexit, label %.lr.ph20.split.us

._crit_edge21.loopexit:                           ; preds = %._crit_edge18.us
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21.loopexit, %7, %._crit_edge33, %._crit_edge27
  br i1 true, label %.lr.ph14, label %._crit_edge9

.lr.ph14:                                         ; preds = %._crit_edge21
  br i1 true, label %.lr.ph14.split.us.preheader, label %._crit_edge3

.lr.ph14.split.us.preheader:                      ; preds = %.lr.ph14
  br label %.lr.ph14.split.us

.lr.ph14.split.us:                                ; preds = %.lr.ph14.split.us.preheader, %._crit_edge12.us
  %indvars.iv113 = phi i64 [ %indvars.iv.next114, %._crit_edge12.us ], [ 0, %.lr.ph14.split.us.preheader ]
  br i1 true, label %.prol.loopexit144, label %.prol.preheader143

.prol.preheader143:                               ; preds = %.lr.ph14.split.us
  br label %.prol.loopexit144

.prol.loopexit144:                                ; preds = %.prol.preheader143, %.lr.ph14.split.us
  %indvars.iv109.unr.ph = phi i64 [ 1, %.prol.preheader143 ], [ 0, %.lr.ph14.split.us ]
  br i1 false, label %._crit_edge12.us, label %.lr.ph14.split.us.new.preheader

.lr.ph14.split.us.new.preheader:                  ; preds = %.prol.loopexit144
  br label %.lr.ph14.split.us.new

.lr.ph14.split.us.new:                            ; preds = %.lr.ph14.split.us.new.preheader, %.lr.ph14.split.us.new
  %indvars.iv109 = phi i64 [ %indvars.iv.next110.1, %.lr.ph14.split.us.new ], [ %indvars.iv109.unr.ph, %.lr.ph14.split.us.new.preheader ]
  %129 = phi float [ %140, %.lr.ph14.split.us.new ], [ 0.000000e+00, %.lr.ph14.split.us.new.preheader ]
  %130 = phi float [ %151, %.lr.ph14.split.us.new ], [ 0.000000e+00, %.lr.ph14.split.us.new.preheader ]
  %131 = phi float [ %153, %.lr.ph14.split.us.new ], [ 0.000000e+00, %.lr.ph14.split.us.new.preheader ]
  %132 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv109, i64 %indvars.iv113
  %133 = load float, float* %132, align 4
  %134 = fmul float %20, %133
  %135 = fmul float %31, %131
  %136 = fadd float %134, %135
  %137 = fmul float %exp2, %130
  %138 = fadd float %136, %137
  %139 = fmul float %129, %38
  %140 = fadd float %138, %139
  %141 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv109, i64 %indvars.iv113
  store float %140, float* %141, align 4
  %142 = load float, float* %132, align 4
  %indvars.iv.next110 = add nuw nsw i64 %indvars.iv109, 1
  %143 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next110, i64 %indvars.iv113
  %144 = load float, float* %143, align 4
  %145 = fmul float %20, %144
  %146 = fmul float %31, %142
  %147 = fadd float %145, %146
  %148 = fmul float %exp2, %140
  %149 = fadd float %147, %148
  %150 = fmul float %130, %38
  %151 = fadd float %149, %150
  %152 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv.next110, i64 %indvars.iv113
  store float %151, float* %152, align 4
  %153 = load float, float* %143, align 4
  %indvars.iv.next110.1 = add nuw nsw i64 %indvars.iv109, 2
  %exitcond112.1 = icmp eq i64 %indvars.iv.next110.1, 4096
  br i1 %exitcond112.1, label %._crit_edge12.us.loopexit, label %.lr.ph14.split.us.new

._crit_edge12.us.loopexit:                        ; preds = %.lr.ph14.split.us.new
  br label %._crit_edge12.us

._crit_edge12.us:                                 ; preds = %._crit_edge12.us.loopexit, %.prol.loopexit144
  %indvars.iv.next114 = add nuw nsw i64 %indvars.iv113, 1
  %exitcond116 = icmp eq i64 %indvars.iv.next114, 2160
  br i1 %exitcond116, label %._crit_edge15, label %.lr.ph14.split.us

._crit_edge15:                                    ; preds = %._crit_edge12.us
  br i1 true, label %.lr.ph8, label %._crit_edge9

.lr.ph8:                                          ; preds = %._crit_edge15
  br i1 true, label %.lr.ph8.split.us.preheader, label %._crit_edge9

.lr.ph8.split.us.preheader:                       ; preds = %.lr.ph8
  br label %.lr.ph8.split.us

.lr.ph8.split.us:                                 ; preds = %._crit_edge6.us, %.lr.ph8.split.us.preheader
  %indvars.iv104 = phi i64 [ 0, %.lr.ph8.split.us.preheader ], [ %indvars.iv.next105, %._crit_edge6.us ]
  br label %154

; <label>:154:                                    ; preds = %154, %.lr.ph8.split.us
  %indvars.iv102 = phi i64 [ 4096, %.lr.ph8.split.us ], [ %indvars.iv.next103.1, %154 ]
  %155 = phi float [ 0.000000e+00, %.lr.ph8.split.us ], [ %165, %154 ]
  %156 = phi float [ 0.000000e+00, %.lr.ph8.split.us ], [ %175, %154 ]
  %157 = phi float [ 0.000000e+00, %.lr.ph8.split.us ], [ %168, %154 ]
  %158 = phi float [ 0.000000e+00, %.lr.ph8.split.us ], [ %178, %154 ]
  %indvars.iv.next103 = add nsw i64 %indvars.iv102, -1
  %159 = fmul float %32, %158
  %160 = fmul float %157, %36
  %161 = fadd float %159, %160
  %162 = fmul float %exp2, %156
  %163 = fadd float %161, %162
  %164 = fmul float %155, %38
  %165 = fadd float %163, %164
  %166 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv.next103, i64 %indvars.iv104
  store float %165, float* %166, align 4
  %167 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next103, i64 %indvars.iv104
  %168 = load float, float* %167, align 4
  %indvars.iv.next103.1 = add nsw i64 %indvars.iv102, -2
  %169 = fmul float %32, %168
  %170 = fmul float %158, %36
  %171 = fadd float %169, %170
  %172 = fmul float %exp2, %165
  %173 = fadd float %171, %172
  %174 = fmul float %156, %38
  %175 = fadd float %173, %174
  %176 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv.next103.1, i64 %indvars.iv104
  store float %175, float* %176, align 4
  %177 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next103.1, i64 %indvars.iv104
  %178 = load float, float* %177, align 4
  %179 = icmp sgt i64 %indvars.iv.next103, 1
  br i1 %179, label %154, label %._crit_edge6.us

._crit_edge6.us:                                  ; preds = %154
  %indvars.iv.next105 = add nuw nsw i64 %indvars.iv104, 1
  %exitcond107 = icmp eq i64 %indvars.iv.next105, 2160
  br i1 %exitcond107, label %._crit_edge9.loopexit, label %.lr.ph8.split.us

._crit_edge9.loopexit:                            ; preds = %._crit_edge6.us
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %._crit_edge21, %.lr.ph8, %._crit_edge15
  %180 = phi i1 [ false, %._crit_edge15 ], [ true, %.lr.ph8 ], [ false, %._crit_edge21 ], [ true, %._crit_edge9.loopexit ]
  br i1 %180, label %.lr.ph2.split.us.preheader, label %._crit_edge3

.lr.ph2.split.us.preheader:                       ; preds = %._crit_edge9
  br label %.lr.ph2.split.us

.lr.ph2.split.us:                                 ; preds = %.lr.ph2.split.us.preheader, %._crit_edge.us
  %indvars.iv97 = phi i64 [ %indvars.iv.next98, %._crit_edge.us ], [ 0, %.lr.ph2.split.us.preheader ]
  %scevgep199 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv97, i64 2
  %scevgep205 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv97, i64 2
  %scevgep211 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv97, i64 2
  br i1 true, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph2.split.us
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph2.split.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph2.split.us ]
  br i1 false, label %._crit_edge.us, label %.lr.ph2.split.us.new.preheader

.lr.ph2.split.us.new.preheader:                   ; preds = %.prol.loopexit
  %181 = sub nsw i64 2158, %indvars.iv.unr.ph
  %182 = lshr i64 %181, 1
  %183 = add nuw nsw i64 %182, 1
  br i1 false, label %.lr.ph2.split.us.new.preheader240, label %min.iters.checked191

min.iters.checked191:                             ; preds = %.lr.ph2.split.us.new.preheader
  %n.mod.vf192 = and i64 %183, 3
  %n.vec193 = sub nsw i64 %183, %n.mod.vf192
  br i1 false, label %.lr.ph2.split.us.new.preheader240, label %vector.memcheck222

vector.memcheck222:                               ; preds = %min.iters.checked191
  %scevgep197 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv97, i64 %indvars.iv.unr.ph
  %184 = sub nsw i64 2158, %indvars.iv.unr.ph
  %185 = and i64 %184, 2158
  %186 = or i64 %indvars.iv.unr.ph, %185
  %scevgep200 = getelementptr float, float* %scevgep199, i64 %186
  %scevgep203 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv97, i64 %indvars.iv.unr.ph
  %scevgep206 = getelementptr float, float* %scevgep205, i64 %186
  %scevgep209 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv97, i64 %indvars.iv.unr.ph
  %scevgep212 = getelementptr float, float* %scevgep211, i64 %186
  %bound0214 = icmp ult float* %scevgep197, %scevgep206
  %bound1215 = icmp ult float* %scevgep203, %scevgep200
  %found.conflict216 = and i1 %bound0214, %bound1215
  %bound0217 = icmp ult float* %scevgep197, %scevgep212
  %bound1218 = icmp ult float* %scevgep209, %scevgep200
  %found.conflict219 = and i1 %bound0217, %bound1218
  %conflict.rdx220 = or i1 %found.conflict216, %found.conflict219
  %187 = or i64 %indvars.iv.unr.ph, 2
  %188 = shl nuw nsw i64 %182, 1
  %189 = add nuw nsw i64 %187, %188
  %190 = shl nuw nsw i64 %n.mod.vf192, 1
  %ind.end227 = sub nsw i64 %189, %190
  br i1 %conflict.rdx220, label %.lr.ph2.split.us.new.preheader240, label %vector.body187.preheader

vector.body187.preheader:                         ; preds = %vector.memcheck222
  br label %vector.body187

vector.body187:                                   ; preds = %vector.body187.preheader, %vector.body187
  %index224 = phi i64 [ %index.next225, %vector.body187 ], [ 0, %vector.body187.preheader ]
  %191 = shl i64 %index224, 1
  %offset.idx229 = or i64 %indvars.iv.unr.ph, %191
  %192 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv97, i64 %offset.idx229
  %193 = bitcast float* %192 to <8 x float>*
  %wide.vec233 = load <8 x float>, <8 x float>* %193, align 4, !alias.scope !16
  %194 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv97, i64 %offset.idx229
  %195 = bitcast float* %194 to <8 x float>*
  %wide.vec236 = load <8 x float>, <8 x float>* %195, align 4, !alias.scope !19
  %196 = fadd <8 x float> %wide.vec233, %wide.vec236
  %197 = shufflevector <8 x float> %196, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %198 = add nuw nsw i64 %offset.idx229, 1
  %199 = fadd <8 x float> %wide.vec233, %wide.vec236
  %200 = shufflevector <8 x float> %199, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %201 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv97, i64 %198
  %202 = getelementptr float, float* %201, i64 -1
  %203 = bitcast float* %202 to <8 x float>*
  %interleaved.vec239 = shufflevector <4 x float> %197, <4 x float> %200, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec239, <8 x float>* %203, align 4, !alias.scope !21, !noalias !23
  %index.next225 = add i64 %index224, 4
  %204 = icmp eq i64 %index.next225, %n.vec193
  br i1 %204, label %middle.block188, label %vector.body187, !llvm.loop !24

middle.block188:                                  ; preds = %vector.body187
  %cmp.n228 = icmp eq i64 %n.mod.vf192, 0
  br i1 %cmp.n228, label %._crit_edge.us, label %.lr.ph2.split.us.new.preheader240

.lr.ph2.split.us.new.preheader240:                ; preds = %middle.block188, %vector.memcheck222, %min.iters.checked191, %.lr.ph2.split.us.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr.ph, %vector.memcheck222 ], [ %indvars.iv.unr.ph, %min.iters.checked191 ], [ %indvars.iv.unr.ph, %.lr.ph2.split.us.new.preheader ], [ %ind.end227, %middle.block188 ]
  br label %.lr.ph2.split.us.new

.lr.ph2.split.us.new:                             ; preds = %.lr.ph2.split.us.new.preheader240, %.lr.ph2.split.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph2.split.us.new ], [ %indvars.iv.ph, %.lr.ph2.split.us.new.preheader240 ]
  %205 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv97, i64 %indvars.iv
  %206 = load float, float* %205, align 4
  %207 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv97, i64 %indvars.iv
  %208 = load float, float* %207, align 4
  %209 = fadd float %206, %208
  %210 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv97, i64 %indvars.iv
  store float %209, float* %210, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %211 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv97, i64 %indvars.iv.next
  %212 = load float, float* %211, align 4
  %213 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv97, i64 %indvars.iv.next
  %214 = load float, float* %213, align 4
  %215 = fadd float %212, %214
  %216 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv97, i64 %indvars.iv.next
  store float %215, float* %216, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2160
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph2.split.us.new, !llvm.loop !25

._crit_edge.us.loopexit:                          ; preds = %.lr.ph2.split.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block188, %.prol.loopexit
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %exitcond100 = icmp eq i64 %indvars.iv.next98, 4096
  br i1 %exitcond100, label %._crit_edge3.loopexit, label %.lr.ph2.split.us

._crit_edge3.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit, %._crit_edge9, %.lr.ph14, %.lr.ph20, %.lr.ph32, %.lr.ph26
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
  br i1 true, label %.lr.ph2.split.us.preheader, label %._crit_edge3

.lr.ph2.split.us.preheader:                       ; preds = %3
  br label %.lr.ph2.split.us

.lr.ph2.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph2.split.us.preheader
  %indvars.iv10 = phi i64 [ 0, %.lr.ph2.split.us.preheader ], [ %indvars.iv.next11, %._crit_edge.us ]
  %8 = mul nsw i64 %indvars.iv10, 2160
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
  %18 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv10, i64 %indvars.iv
  %19 = load float, float* %18, align 4
  %20 = fpext float %19 to double
  %21 = call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %20) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2160
  br i1 %exitcond, label %._crit_edge.us, label %9

._crit_edge.us:                                   ; preds = %16
  %indvars.iv.next11 = add nuw nsw i64 %indvars.iv10, 1
  %exitcond13 = icmp eq i64 %indvars.iv.next11, 4096
  br i1 %exitcond13, label %._crit_edge3.loopexit, label %.lr.ph2.split.us

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
