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
  br i1 true, label %.lr.ph32, label %._crit_edge21

.lr.ph32:                                         ; preds = %7
  br i1 true, label %.lr.ph32.split.us.preheader, label %._crit_edge3

.lr.ph32.split.us.preheader:                      ; preds = %.lr.ph32
  br label %.lr.ph32.split.us

.lr.ph32.split.us:                                ; preds = %.lr.ph32.split.us.preheader, %._crit_edge30.us
  %indvars.iv141 = phi i64 [ %indvars.iv.next142, %._crit_edge30.us ], [ 0, %.lr.ph32.split.us.preheader ]
  br label %39

; <label>:39:                                     ; preds = %39, %.lr.ph32.split.us
  %indvars.iv137 = phi i64 [ 0, %.lr.ph32.split.us ], [ %indvars.iv.next138.1, %39 ]
  %40 = phi float [ 0.000000e+00, %.lr.ph32.split.us ], [ %51, %39 ]
  %41 = phi float [ 0.000000e+00, %.lr.ph32.split.us ], [ %62, %39 ]
  %42 = phi float [ 0.000000e+00, %.lr.ph32.split.us ], [ %64, %39 ]
  %43 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv141, i64 %indvars.iv137
  %44 = load float, float* %43, align 4
  %45 = fmul float %20, %44
  %46 = fmul float %31, %42
  %47 = fadd float %45, %46
  %48 = fmul float %exp2, %41
  %49 = fadd float %47, %48
  %50 = fmul float %40, %38
  %51 = fadd float %49, %50
  %52 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv141, i64 %indvars.iv137
  store float %51, float* %52, align 4
  %53 = load float, float* %43, align 4
  %indvars.iv.next138 = or i64 %indvars.iv137, 1
  %54 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv141, i64 %indvars.iv.next138
  %55 = load float, float* %54, align 4
  %56 = fmul float %20, %55
  %57 = fmul float %31, %53
  %58 = fadd float %56, %57
  %59 = fmul float %exp2, %51
  %60 = fadd float %58, %59
  %61 = fmul float %41, %38
  %62 = fadd float %60, %61
  %63 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv141, i64 %indvars.iv.next138
  store float %62, float* %63, align 4
  %64 = load float, float* %54, align 4
  %indvars.iv.next138.1 = add nsw i64 %indvars.iv137, 2
  %exitcond140.1 = icmp eq i64 %indvars.iv.next138.1, 2160
  br i1 %exitcond140.1, label %._crit_edge30.us, label %39

._crit_edge30.us:                                 ; preds = %39
  %indvars.iv.next142 = add nuw nsw i64 %indvars.iv141, 1
  %exitcond144 = icmp eq i64 %indvars.iv.next142, 4096
  br i1 %exitcond144, label %._crit_edge33, label %.lr.ph32.split.us

._crit_edge33:                                    ; preds = %._crit_edge30.us
  br i1 true, label %.lr.ph26, label %._crit_edge21

.lr.ph26:                                         ; preds = %._crit_edge33
  br i1 true, label %.lr.ph26.split.us.preheader, label %._crit_edge3

.lr.ph26.split.us.preheader:                      ; preds = %.lr.ph26
  br label %.lr.ph26.split.us

.lr.ph26.split.us:                                ; preds = %._crit_edge24.us, %.lr.ph26.split.us.preheader
  %indvars.iv132 = phi i64 [ 0, %.lr.ph26.split.us.preheader ], [ %indvars.iv.next133, %._crit_edge24.us ]
  br label %65

; <label>:65:                                     ; preds = %65, %.lr.ph26.split.us
  %indvars.iv130 = phi i64 [ 2160, %.lr.ph26.split.us ], [ %indvars.iv.next131.1, %65 ]
  %66 = phi float [ 0.000000e+00, %.lr.ph26.split.us ], [ %76, %65 ]
  %67 = phi float [ 0.000000e+00, %.lr.ph26.split.us ], [ %86, %65 ]
  %68 = phi float [ 0.000000e+00, %.lr.ph26.split.us ], [ %79, %65 ]
  %69 = phi float [ 0.000000e+00, %.lr.ph26.split.us ], [ %89, %65 ]
  %indvars.iv.next131 = add nsw i64 %indvars.iv130, -1
  %70 = fmul float %32, %69
  %71 = fmul float %68, %36
  %72 = fadd float %70, %71
  %73 = fmul float %exp2, %67
  %74 = fadd float %72, %73
  %75 = fmul float %66, %38
  %76 = fadd float %74, %75
  %77 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv132, i64 %indvars.iv.next131
  store float %76, float* %77, align 4
  %78 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv132, i64 %indvars.iv.next131
  %79 = load float, float* %78, align 4
  %indvars.iv.next131.1 = add nsw i64 %indvars.iv130, -2
  %80 = fmul float %32, %79
  %81 = fmul float %69, %36
  %82 = fadd float %80, %81
  %83 = fmul float %exp2, %76
  %84 = fadd float %82, %83
  %85 = fmul float %67, %38
  %86 = fadd float %84, %85
  %87 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv132, i64 %indvars.iv.next131.1
  store float %86, float* %87, align 4
  %88 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv132, i64 %indvars.iv.next131.1
  %89 = load float, float* %88, align 4
  %90 = icmp sgt i64 %indvars.iv.next131, 1
  br i1 %90, label %65, label %._crit_edge24.us

._crit_edge24.us:                                 ; preds = %65
  %indvars.iv.next133 = add nuw nsw i64 %indvars.iv132, 1
  %exitcond135 = icmp eq i64 %indvars.iv.next133, 4096
  br i1 %exitcond135, label %._crit_edge27, label %.lr.ph26.split.us

._crit_edge27:                                    ; preds = %._crit_edge24.us
  br i1 true, label %.lr.ph20, label %._crit_edge21

.lr.ph20:                                         ; preds = %._crit_edge27
  br i1 true, label %.lr.ph20.split.us.preheader, label %._crit_edge3

.lr.ph20.split.us.preheader:                      ; preds = %.lr.ph20
  br label %.lr.ph20.split.us

.lr.ph20.split.us:                                ; preds = %.lr.ph20.split.us.preheader, %._crit_edge18.us
  %indvars.iv125 = phi i64 [ %indvars.iv.next126, %._crit_edge18.us ], [ 0, %.lr.ph20.split.us.preheader ]
  %scevgep151 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv125, i64 2
  %scevgep157 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv125, i64 2
  %scevgep163 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv125, i64 2
  br i1 true, label %.prol.loopexit122, label %.prol.preheader121

.prol.preheader121:                               ; preds = %.lr.ph20.split.us
  br label %.prol.loopexit122

.prol.loopexit122:                                ; preds = %.prol.preheader121, %.lr.ph20.split.us
  %indvars.iv117.unr.ph = phi i64 [ 1, %.prol.preheader121 ], [ 0, %.lr.ph20.split.us ]
  br i1 false, label %._crit_edge18.us, label %.lr.ph20.split.us.new.preheader

.lr.ph20.split.us.new.preheader:                  ; preds = %.prol.loopexit122
  %91 = sub nsw i64 2158, %indvars.iv117.unr.ph
  %92 = lshr i64 %91, 1
  %93 = add nuw nsw i64 %92, 1
  br i1 false, label %.lr.ph20.split.us.new.preheader227, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph20.split.us.new.preheader
  %n.mod.vf = and i64 %93, 3
  %n.vec = sub nsw i64 %93, %n.mod.vf
  br i1 false, label %.lr.ph20.split.us.new.preheader227, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep149 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv125, i64 %indvars.iv117.unr.ph
  %94 = sub nsw i64 2158, %indvars.iv117.unr.ph
  %95 = and i64 %94, 2158
  %96 = or i64 %indvars.iv117.unr.ph, %95
  %scevgep152 = getelementptr float, float* %scevgep151, i64 %96
  %scevgep155 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv125, i64 %indvars.iv117.unr.ph
  %scevgep158 = getelementptr float, float* %scevgep157, i64 %96
  %scevgep161 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv125, i64 %indvars.iv117.unr.ph
  %scevgep164 = getelementptr float, float* %scevgep163, i64 %96
  %bound0 = icmp ult float* %scevgep149, %scevgep158
  %bound1 = icmp ult float* %scevgep155, %scevgep152
  %found.conflict = and i1 %bound0, %bound1
  %bound0166 = icmp ult float* %scevgep149, %scevgep164
  %bound1167 = icmp ult float* %scevgep161, %scevgep152
  %found.conflict168 = and i1 %bound0166, %bound1167
  %conflict.rdx = or i1 %found.conflict, %found.conflict168
  %97 = or i64 %indvars.iv117.unr.ph, 2
  %98 = shl nuw nsw i64 %92, 1
  %99 = add nuw nsw i64 %97, %98
  %100 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub nsw i64 %99, %100
  br i1 %conflict.rdx, label %.lr.ph20.split.us.new.preheader227, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %101 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv117.unr.ph, %101
  %102 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv125, i64 %offset.idx
  %103 = bitcast float* %102 to <8 x float>*
  %wide.vec = load <8 x float>, <8 x float>* %103, align 4, !alias.scope !6
  %104 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv125, i64 %offset.idx
  %105 = bitcast float* %104 to <8 x float>*
  %wide.vec170 = load <8 x float>, <8 x float>* %105, align 4, !alias.scope !9
  %106 = fadd <8 x float> %wide.vec, %wide.vec170
  %107 = shufflevector <8 x float> %106, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %108 = add nuw nsw i64 %offset.idx, 1
  %109 = fadd <8 x float> %wide.vec, %wide.vec170
  %110 = shufflevector <8 x float> %109, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %111 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv125, i64 %108
  %112 = getelementptr float, float* %111, i64 -1
  %113 = bitcast float* %112 to <8 x float>*
  %interleaved.vec = shufflevector <4 x float> %107, <4 x float> %110, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec, <8 x float>* %113, align 4, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %114 = icmp eq i64 %index.next, %n.vec
  br i1 %114, label %middle.block, label %vector.body, !llvm.loop !14

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge18.us, label %.lr.ph20.split.us.new.preheader227

.lr.ph20.split.us.new.preheader227:               ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph20.split.us.new.preheader
  %indvars.iv117.ph = phi i64 [ %indvars.iv117.unr.ph, %vector.memcheck ], [ %indvars.iv117.unr.ph, %min.iters.checked ], [ %indvars.iv117.unr.ph, %.lr.ph20.split.us.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph20.split.us.new

.lr.ph20.split.us.new:                            ; preds = %.lr.ph20.split.us.new.preheader227, %.lr.ph20.split.us.new
  %indvars.iv117 = phi i64 [ %indvars.iv.next118.1, %.lr.ph20.split.us.new ], [ %indvars.iv117.ph, %.lr.ph20.split.us.new.preheader227 ]
  %115 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv125, i64 %indvars.iv117
  %116 = load float, float* %115, align 4
  %117 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv125, i64 %indvars.iv117
  %118 = load float, float* %117, align 4
  %119 = fadd float %116, %118
  %120 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv125, i64 %indvars.iv117
  store float %119, float* %120, align 4
  %indvars.iv.next118 = add nuw nsw i64 %indvars.iv117, 1
  %121 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv125, i64 %indvars.iv.next118
  %122 = load float, float* %121, align 4
  %123 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv125, i64 %indvars.iv.next118
  %124 = load float, float* %123, align 4
  %125 = fadd float %122, %124
  %126 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv125, i64 %indvars.iv.next118
  store float %125, float* %126, align 4
  %indvars.iv.next118.1 = add nsw i64 %indvars.iv117, 2
  %exitcond120.1 = icmp eq i64 %indvars.iv.next118.1, 2160
  br i1 %exitcond120.1, label %._crit_edge18.us.loopexit, label %.lr.ph20.split.us.new, !llvm.loop !15

._crit_edge18.us.loopexit:                        ; preds = %.lr.ph20.split.us.new
  br label %._crit_edge18.us

._crit_edge18.us:                                 ; preds = %._crit_edge18.us.loopexit, %middle.block, %.prol.loopexit122
  %indvars.iv.next126 = add nuw nsw i64 %indvars.iv125, 1
  %exitcond128 = icmp eq i64 %indvars.iv.next126, 4096
  br i1 %exitcond128, label %._crit_edge21.loopexit, label %.lr.ph20.split.us

._crit_edge21.loopexit:                           ; preds = %._crit_edge18.us
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21.loopexit, %7, %._crit_edge33, %._crit_edge27
  br i1 true, label %.lr.ph14, label %._crit_edge9

.lr.ph14:                                         ; preds = %._crit_edge21
  br i1 true, label %.lr.ph14.split.us.preheader, label %._crit_edge3

.lr.ph14.split.us.preheader:                      ; preds = %.lr.ph14
  br label %.lr.ph14.split.us

.lr.ph14.split.us:                                ; preds = %.lr.ph14.split.us.preheader, %._crit_edge12.us
  %indvars.iv112 = phi i64 [ %indvars.iv.next113, %._crit_edge12.us ], [ 0, %.lr.ph14.split.us.preheader ]
  br label %127

; <label>:127:                                    ; preds = %127, %.lr.ph14.split.us
  %indvars.iv108 = phi i64 [ 0, %.lr.ph14.split.us ], [ %indvars.iv.next109.1, %127 ]
  %128 = phi float [ 0.000000e+00, %.lr.ph14.split.us ], [ %139, %127 ]
  %129 = phi float [ 0.000000e+00, %.lr.ph14.split.us ], [ %150, %127 ]
  %130 = phi float [ 0.000000e+00, %.lr.ph14.split.us ], [ %152, %127 ]
  %131 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv108, i64 %indvars.iv112
  %132 = load float, float* %131, align 4
  %133 = fmul float %20, %132
  %134 = fmul float %31, %130
  %135 = fadd float %133, %134
  %136 = fmul float %exp2, %129
  %137 = fadd float %135, %136
  %138 = fmul float %128, %38
  %139 = fadd float %137, %138
  %140 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv108, i64 %indvars.iv112
  store float %139, float* %140, align 4
  %141 = load float, float* %131, align 4
  %indvars.iv.next109 = or i64 %indvars.iv108, 1
  %142 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next109, i64 %indvars.iv112
  %143 = load float, float* %142, align 4
  %144 = fmul float %20, %143
  %145 = fmul float %31, %141
  %146 = fadd float %144, %145
  %147 = fmul float %exp2, %139
  %148 = fadd float %146, %147
  %149 = fmul float %129, %38
  %150 = fadd float %148, %149
  %151 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv.next109, i64 %indvars.iv112
  store float %150, float* %151, align 4
  %152 = load float, float* %142, align 4
  %indvars.iv.next109.1 = add nsw i64 %indvars.iv108, 2
  %exitcond111.1 = icmp eq i64 %indvars.iv.next109.1, 4096
  br i1 %exitcond111.1, label %._crit_edge12.us, label %127

._crit_edge12.us:                                 ; preds = %127
  %indvars.iv.next113 = add nuw nsw i64 %indvars.iv112, 1
  %exitcond115 = icmp eq i64 %indvars.iv.next113, 2160
  br i1 %exitcond115, label %._crit_edge15, label %.lr.ph14.split.us

._crit_edge15:                                    ; preds = %._crit_edge12.us
  br i1 true, label %.lr.ph8, label %._crit_edge9

.lr.ph8:                                          ; preds = %._crit_edge15
  br i1 true, label %.lr.ph8.split.us.preheader, label %._crit_edge9

.lr.ph8.split.us.preheader:                       ; preds = %.lr.ph8
  br label %.lr.ph8.split.us

.lr.ph8.split.us:                                 ; preds = %._crit_edge6.us, %.lr.ph8.split.us.preheader
  %indvars.iv103 = phi i64 [ 0, %.lr.ph8.split.us.preheader ], [ %indvars.iv.next104, %._crit_edge6.us ]
  br label %153

; <label>:153:                                    ; preds = %153, %.lr.ph8.split.us
  %indvars.iv101 = phi i64 [ 4096, %.lr.ph8.split.us ], [ %indvars.iv.next102.1, %153 ]
  %154 = phi float [ 0.000000e+00, %.lr.ph8.split.us ], [ %164, %153 ]
  %155 = phi float [ 0.000000e+00, %.lr.ph8.split.us ], [ %174, %153 ]
  %156 = phi float [ 0.000000e+00, %.lr.ph8.split.us ], [ %167, %153 ]
  %157 = phi float [ 0.000000e+00, %.lr.ph8.split.us ], [ %177, %153 ]
  %indvars.iv.next102 = add nsw i64 %indvars.iv101, -1
  %158 = fmul float %32, %157
  %159 = fmul float %156, %36
  %160 = fadd float %158, %159
  %161 = fmul float %exp2, %155
  %162 = fadd float %160, %161
  %163 = fmul float %154, %38
  %164 = fadd float %162, %163
  %165 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv.next102, i64 %indvars.iv103
  store float %164, float* %165, align 4
  %166 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next102, i64 %indvars.iv103
  %167 = load float, float* %166, align 4
  %indvars.iv.next102.1 = add nsw i64 %indvars.iv101, -2
  %168 = fmul float %32, %167
  %169 = fmul float %157, %36
  %170 = fadd float %168, %169
  %171 = fmul float %exp2, %164
  %172 = fadd float %170, %171
  %173 = fmul float %155, %38
  %174 = fadd float %172, %173
  %175 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv.next102.1, i64 %indvars.iv103
  store float %174, float* %175, align 4
  %176 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next102.1, i64 %indvars.iv103
  %177 = load float, float* %176, align 4
  %178 = icmp sgt i64 %indvars.iv.next102, 1
  br i1 %178, label %153, label %._crit_edge6.us

._crit_edge6.us:                                  ; preds = %153
  %indvars.iv.next104 = add nuw nsw i64 %indvars.iv103, 1
  %exitcond106 = icmp eq i64 %indvars.iv.next104, 2160
  br i1 %exitcond106, label %._crit_edge9.loopexit, label %.lr.ph8.split.us

._crit_edge9.loopexit:                            ; preds = %._crit_edge6.us
  br label %._crit_edge9

._crit_edge9:                                     ; preds = %._crit_edge9.loopexit, %._crit_edge21, %.lr.ph8, %._crit_edge15
  %179 = phi i1 [ false, %._crit_edge15 ], [ true, %.lr.ph8 ], [ false, %._crit_edge21 ], [ true, %._crit_edge9.loopexit ]
  br i1 %179, label %.lr.ph2.split.us.preheader, label %._crit_edge3

.lr.ph2.split.us.preheader:                       ; preds = %._crit_edge9
  br label %.lr.ph2.split.us

.lr.ph2.split.us:                                 ; preds = %.lr.ph2.split.us.preheader, %._crit_edge.us
  %indvars.iv97 = phi i64 [ %indvars.iv.next98, %._crit_edge.us ], [ 0, %.lr.ph2.split.us.preheader ]
  %scevgep185 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv97, i64 2
  %scevgep191 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv97, i64 2
  %scevgep197 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv97, i64 2
  br i1 true, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph2.split.us
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph2.split.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph2.split.us ]
  br i1 false, label %._crit_edge.us, label %.lr.ph2.split.us.new.preheader

.lr.ph2.split.us.new.preheader:                   ; preds = %.prol.loopexit
  %180 = sub nsw i64 2158, %indvars.iv.unr.ph
  %181 = lshr i64 %180, 1
  %182 = add nuw nsw i64 %181, 1
  br i1 false, label %.lr.ph2.split.us.new.preheader226, label %min.iters.checked177

min.iters.checked177:                             ; preds = %.lr.ph2.split.us.new.preheader
  %n.mod.vf178 = and i64 %182, 3
  %n.vec179 = sub nsw i64 %182, %n.mod.vf178
  br i1 false, label %.lr.ph2.split.us.new.preheader226, label %vector.memcheck208

vector.memcheck208:                               ; preds = %min.iters.checked177
  %scevgep183 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv97, i64 %indvars.iv.unr.ph
  %183 = sub nsw i64 2158, %indvars.iv.unr.ph
  %184 = and i64 %183, 2158
  %185 = or i64 %indvars.iv.unr.ph, %184
  %scevgep186 = getelementptr float, float* %scevgep185, i64 %185
  %scevgep189 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv97, i64 %indvars.iv.unr.ph
  %scevgep192 = getelementptr float, float* %scevgep191, i64 %185
  %scevgep195 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv97, i64 %indvars.iv.unr.ph
  %scevgep198 = getelementptr float, float* %scevgep197, i64 %185
  %bound0200 = icmp ult float* %scevgep183, %scevgep192
  %bound1201 = icmp ult float* %scevgep189, %scevgep186
  %found.conflict202 = and i1 %bound0200, %bound1201
  %bound0203 = icmp ult float* %scevgep183, %scevgep198
  %bound1204 = icmp ult float* %scevgep195, %scevgep186
  %found.conflict205 = and i1 %bound0203, %bound1204
  %conflict.rdx206 = or i1 %found.conflict202, %found.conflict205
  %186 = or i64 %indvars.iv.unr.ph, 2
  %187 = shl nuw nsw i64 %181, 1
  %188 = add nuw nsw i64 %186, %187
  %189 = shl nuw nsw i64 %n.mod.vf178, 1
  %ind.end213 = sub nsw i64 %188, %189
  br i1 %conflict.rdx206, label %.lr.ph2.split.us.new.preheader226, label %vector.body173.preheader

vector.body173.preheader:                         ; preds = %vector.memcheck208
  br label %vector.body173

vector.body173:                                   ; preds = %vector.body173.preheader, %vector.body173
  %index210 = phi i64 [ %index.next211, %vector.body173 ], [ 0, %vector.body173.preheader ]
  %190 = shl i64 %index210, 1
  %offset.idx215 = or i64 %indvars.iv.unr.ph, %190
  %191 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv97, i64 %offset.idx215
  %192 = bitcast float* %191 to <8 x float>*
  %wide.vec219 = load <8 x float>, <8 x float>* %192, align 4, !alias.scope !16
  %193 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv97, i64 %offset.idx215
  %194 = bitcast float* %193 to <8 x float>*
  %wide.vec222 = load <8 x float>, <8 x float>* %194, align 4, !alias.scope !19
  %195 = fadd <8 x float> %wide.vec219, %wide.vec222
  %196 = shufflevector <8 x float> %195, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %197 = add nuw nsw i64 %offset.idx215, 1
  %198 = fadd <8 x float> %wide.vec219, %wide.vec222
  %199 = shufflevector <8 x float> %198, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %200 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv97, i64 %197
  %201 = getelementptr float, float* %200, i64 -1
  %202 = bitcast float* %201 to <8 x float>*
  %interleaved.vec225 = shufflevector <4 x float> %196, <4 x float> %199, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec225, <8 x float>* %202, align 4, !alias.scope !21, !noalias !23
  %index.next211 = add i64 %index210, 4
  %203 = icmp eq i64 %index.next211, %n.vec179
  br i1 %203, label %middle.block174, label %vector.body173, !llvm.loop !24

middle.block174:                                  ; preds = %vector.body173
  %cmp.n214 = icmp eq i64 %n.mod.vf178, 0
  br i1 %cmp.n214, label %._crit_edge.us, label %.lr.ph2.split.us.new.preheader226

.lr.ph2.split.us.new.preheader226:                ; preds = %middle.block174, %vector.memcheck208, %min.iters.checked177, %.lr.ph2.split.us.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr.ph, %vector.memcheck208 ], [ %indvars.iv.unr.ph, %min.iters.checked177 ], [ %indvars.iv.unr.ph, %.lr.ph2.split.us.new.preheader ], [ %ind.end213, %middle.block174 ]
  br label %.lr.ph2.split.us.new

.lr.ph2.split.us.new:                             ; preds = %.lr.ph2.split.us.new.preheader226, %.lr.ph2.split.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph2.split.us.new ], [ %indvars.iv.ph, %.lr.ph2.split.us.new.preheader226 ]
  %204 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv97, i64 %indvars.iv
  %205 = load float, float* %204, align 4
  %206 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv97, i64 %indvars.iv
  %207 = load float, float* %206, align 4
  %208 = fadd float %205, %207
  %209 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv97, i64 %indvars.iv
  store float %208, float* %209, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %210 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv97, i64 %indvars.iv.next
  %211 = load float, float* %210, align 4
  %212 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv97, i64 %indvars.iv.next
  %213 = load float, float* %212, align 4
  %214 = fadd float %211, %213
  %215 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv97, i64 %indvars.iv.next
  store float %214, float* %215, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2160
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph2.split.us.new, !llvm.loop !25

._crit_edge.us.loopexit:                          ; preds = %.lr.ph2.split.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block174, %.prol.loopexit
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %exitcond = icmp eq i64 %indvars.iv.next98, 4096
  br i1 %exitcond, label %._crit_edge3.loopexit, label %.lr.ph2.split.us

._crit_edge3.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge3

._crit_edge3:                                     ; preds = %._crit_edge3.loopexit, %._crit_edge9, %.lr.ph14, %.lr.ph20, %.lr.ph32, %.lr.ph26
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
