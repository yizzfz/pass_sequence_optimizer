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
  %4 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %5 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %6 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
  %7 = tail call i8* @polybench_alloc_data(i64 8847360, i32 4) #5
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
  br i1 true, label %.lr.ph3.split.us.preheader, label %._crit_edge4

.lr.ph3.split.us.preheader:                       ; preds = %4
  br label %.lr.ph3.split.us

.lr.ph3.split.us:                                 ; preds = %.lr.ph3.split.us.preheader, %._crit_edge.us
  %indvars.iv11 = phi i64 [ %indvars.iv.next12, %._crit_edge.us ], [ 0, %.lr.ph3.split.us.preheader ]
  %5 = mul nuw nsw i64 %indvars.iv11, 313
  br i1 false, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph3.split.us
  br i1 false, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %5, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %6 = mul nuw nsw <4 x i64> %vec.ind, <i64 991, i64 991, i64 991, i64 991>
  %7 = add nuw nsw <4 x i64> %6, %broadcast.splat
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

scalar.ph.preheader:                              ; preds = %middle.block, %min.iters.checked, %.lr.ph3.split.us
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  br i1 true, label %._crit_edge.us.loopexit, label %scalar.ph, !llvm.loop !4

._crit_edge.us.loopexit:                          ; preds = %scalar.ph
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next12, 4096
  br i1 %exitcond14, label %._crit_edge4.loopexit, label %.lr.ph3.split.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %4
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_deriche(i32, i32, float, [2160 x float]* nocapture readonly, [2160 x float]* nocapture, [2160 x float]* nocapture, [2160 x float]* nocapture) unnamed_addr #0 {
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
  %30 = fmul <2 x float> %27, %29
  %31 = extractelement <2 x float> %30, i32 0
  %32 = extractelement <2 x float> %30, i32 1
  %33 = fmul float %2, -2.000000e+00
  %34 = tail call float @expf(float %33) #5
  %35 = fmul float %20, %34
  %36 = fsub float -0.000000e+00, %35
  %exp2 = tail call float @llvm.exp2.f32(float %8)
  %37 = tail call float @expf(float %33) #5
  %38 = fsub float -0.000000e+00, %37
  br i1 true, label %.lr.ph45, label %._crit_edge33

.lr.ph45:                                         ; preds = %7
  br i1 true, label %.lr.ph45.split.us.preheader, label %._crit_edge14

.lr.ph45.split.us.preheader:                      ; preds = %.lr.ph45
  br label %.lr.ph45.split.us

.lr.ph45.split.us:                                ; preds = %.lr.ph45.split.us.preheader, %._crit_edge43.us
  %indvars.iv100 = phi i64 [ %indvars.iv.next101, %._crit_edge43.us ], [ 0, %.lr.ph45.split.us.preheader ]
  br label %39

; <label>:39:                                     ; preds = %39, %.lr.ph45.split.us
  %indvars.iv96 = phi i64 [ 0, %.lr.ph45.split.us ], [ %indvars.iv.next97.1, %39 ]
  %40 = phi float [ 0.000000e+00, %.lr.ph45.split.us ], [ %62, %39 ]
  %41 = phi float [ 0.000000e+00, %.lr.ph45.split.us ], [ %51, %39 ]
  %42 = phi float [ 0.000000e+00, %.lr.ph45.split.us ], [ %64, %39 ]
  %43 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv100, i64 %indvars.iv96
  %44 = load float, float* %43, align 4
  %45 = fmul float %20, %44
  %46 = fmul float %31, %42
  %47 = fadd float %45, %46
  %48 = fmul float %exp2, %40
  %49 = fadd float %47, %48
  %50 = fmul float %41, %38
  %51 = fadd float %49, %50
  %52 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv100, i64 %indvars.iv96
  store float %51, float* %52, align 4
  %53 = load float, float* %43, align 4
  %indvars.iv.next97 = or i64 %indvars.iv96, 1
  %54 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv100, i64 %indvars.iv.next97
  %55 = load float, float* %54, align 4
  %56 = fmul float %20, %55
  %57 = fmul float %31, %53
  %58 = fadd float %56, %57
  %59 = fmul float %exp2, %51
  %60 = fadd float %58, %59
  %61 = fmul float %40, %38
  %62 = fadd float %60, %61
  %63 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv100, i64 %indvars.iv.next97
  store float %62, float* %63, align 4
  %64 = load float, float* %54, align 4
  %indvars.iv.next97.1 = add nsw i64 %indvars.iv96, 2
  %exitcond99.1 = icmp eq i64 %indvars.iv.next97.1, 2160
  br i1 %exitcond99.1, label %._crit_edge43.us, label %39

._crit_edge43.us:                                 ; preds = %39
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %exitcond103 = icmp eq i64 %indvars.iv.next101, 4096
  br i1 %exitcond103, label %._crit_edge46, label %.lr.ph45.split.us

._crit_edge46:                                    ; preds = %._crit_edge43.us
  br i1 true, label %.lr.ph39, label %._crit_edge33

.lr.ph39:                                         ; preds = %._crit_edge46
  br i1 true, label %.lr.ph39.split.us.preheader, label %._crit_edge14

.lr.ph39.split.us.preheader:                      ; preds = %.lr.ph39
  br label %.lr.ph39.split.us

.lr.ph39.split.us:                                ; preds = %._crit_edge37.us, %.lr.ph39.split.us.preheader
  %indvars.iv91 = phi i64 [ 0, %.lr.ph39.split.us.preheader ], [ %indvars.iv.next92, %._crit_edge37.us ]
  br label %65

; <label>:65:                                     ; preds = %65, %.lr.ph39.split.us
  %indvars.iv89 = phi i64 [ %indvars.iv.next90, %65 ], [ 2160, %.lr.ph39.split.us ]
  %66 = phi float [ %77, %65 ], [ 0.000000e+00, %.lr.ph39.split.us ]
  %67 = phi i32 [ %81, %65 ], [ 0, %.lr.ph39.split.us ]
  %68 = phi float [ %66, %65 ], [ 0.000000e+00, %.lr.ph39.split.us ]
  %69 = phi float [ %84, %65 ], [ 0.000000e+00, %.lr.ph39.split.us ]
  %70 = phi float [ %83, %65 ], [ 0.000000e+00, %.lr.ph39.split.us ]
  %indvars.iv.next90 = add nsw i64 %indvars.iv89, -1
  %71 = fmul float %32, %70
  %72 = fmul float %69, %36
  %73 = fadd float %71, %72
  %74 = fmul float %exp2, %66
  %75 = fadd float %73, %74
  %76 = fmul float %68, %38
  %77 = fadd float %75, %76
  %78 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv91, i64 %indvars.iv.next90
  store float %77, float* %78, align 4
  %79 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv91, i64 %indvars.iv.next90
  %80 = bitcast float* %79 to i32*
  %81 = load i32, i32* %80, align 4
  %82 = icmp sgt i64 %indvars.iv89, 1
  %83 = bitcast i32 %81 to float
  %84 = bitcast i32 %67 to float
  br i1 %82, label %65, label %._crit_edge37.us

._crit_edge37.us:                                 ; preds = %65
  %indvars.iv.next92 = add nuw nsw i64 %indvars.iv91, 1
  %exitcond94 = icmp eq i64 %indvars.iv.next92, 4096
  br i1 %exitcond94, label %._crit_edge40, label %.lr.ph39.split.us

._crit_edge40:                                    ; preds = %._crit_edge37.us
  br i1 true, label %.lr.ph32, label %._crit_edge33

.lr.ph32:                                         ; preds = %._crit_edge40
  br i1 true, label %.lr.ph32.split.us.preheader, label %._crit_edge14

.lr.ph32.split.us.preheader:                      ; preds = %.lr.ph32
  br label %.lr.ph32.split.us

.lr.ph32.split.us:                                ; preds = %.lr.ph32.split.us.preheader, %._crit_edge30.us
  %indvars.iv84 = phi i64 [ %indvars.iv.next85, %._crit_edge30.us ], [ 0, %.lr.ph32.split.us.preheader ]
  %scevgep110 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv84, i64 2
  %scevgep116 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv84, i64 2
  %scevgep122 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv84, i64 2
  br i1 true, label %.prol.loopexit81, label %.prol.preheader80

.prol.preheader80:                                ; preds = %.lr.ph32.split.us
  br label %.prol.loopexit81

.prol.loopexit81:                                 ; preds = %.prol.preheader80, %.lr.ph32.split.us
  %indvars.iv76.unr.ph = phi i64 [ 1, %.prol.preheader80 ], [ 0, %.lr.ph32.split.us ]
  br i1 false, label %._crit_edge30.us, label %.lr.ph32.split.us.new.preheader

.lr.ph32.split.us.new.preheader:                  ; preds = %.prol.loopexit81
  %85 = sub nsw i64 2158, %indvars.iv76.unr.ph
  %86 = lshr i64 %85, 1
  %87 = add nuw nsw i64 %86, 1
  br i1 false, label %.lr.ph32.split.us.new.preheader186, label %min.iters.checked

min.iters.checked:                                ; preds = %.lr.ph32.split.us.new.preheader
  %n.mod.vf = and i64 %87, 3
  %n.vec = sub nsw i64 %87, %n.mod.vf
  br i1 false, label %.lr.ph32.split.us.new.preheader186, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep108 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv84, i64 %indvars.iv76.unr.ph
  %88 = sub nsw i64 2158, %indvars.iv76.unr.ph
  %89 = and i64 %88, 2158
  %90 = or i64 %indvars.iv76.unr.ph, %89
  %scevgep111 = getelementptr float, float* %scevgep110, i64 %90
  %scevgep114 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv84, i64 %indvars.iv76.unr.ph
  %scevgep117 = getelementptr float, float* %scevgep116, i64 %90
  %scevgep120 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv84, i64 %indvars.iv76.unr.ph
  %scevgep123 = getelementptr float, float* %scevgep122, i64 %90
  %bound0 = icmp ult float* %scevgep108, %scevgep117
  %bound1 = icmp ult float* %scevgep114, %scevgep111
  %found.conflict = and i1 %bound0, %bound1
  %bound0125 = icmp ult float* %scevgep108, %scevgep123
  %bound1126 = icmp ult float* %scevgep120, %scevgep111
  %found.conflict127 = and i1 %bound0125, %bound1126
  %conflict.rdx = or i1 %found.conflict, %found.conflict127
  %91 = or i64 %indvars.iv76.unr.ph, 2
  %92 = shl nuw nsw i64 %86, 1
  %93 = add nuw nsw i64 %91, %92
  %94 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub nsw i64 %93, %94
  br i1 %conflict.rdx, label %.lr.ph32.split.us.new.preheader186, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %95 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv76.unr.ph, %95
  %96 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv84, i64 %offset.idx
  %97 = bitcast float* %96 to <8 x float>*
  %wide.vec = load <8 x float>, <8 x float>* %97, align 4, !alias.scope !6
  %98 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv84, i64 %offset.idx
  %99 = bitcast float* %98 to <8 x float>*
  %wide.vec129 = load <8 x float>, <8 x float>* %99, align 4, !alias.scope !9
  %100 = fadd <8 x float> %wide.vec, %wide.vec129
  %101 = shufflevector <8 x float> %100, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %102 = add nuw nsw i64 %offset.idx, 1
  %103 = fadd <8 x float> %wide.vec, %wide.vec129
  %104 = shufflevector <8 x float> %103, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %105 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv84, i64 %102
  %106 = getelementptr float, float* %105, i64 -1
  %107 = bitcast float* %106 to <8 x float>*
  %interleaved.vec = shufflevector <4 x float> %101, <4 x float> %104, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec, <8 x float>* %107, align 4, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %108 = icmp eq i64 %index.next, %n.vec
  br i1 %108, label %middle.block, label %vector.body, !llvm.loop !14

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge30.us, label %.lr.ph32.split.us.new.preheader186

.lr.ph32.split.us.new.preheader186:               ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.lr.ph32.split.us.new.preheader
  %indvars.iv76.ph = phi i64 [ %indvars.iv76.unr.ph, %vector.memcheck ], [ %indvars.iv76.unr.ph, %min.iters.checked ], [ %indvars.iv76.unr.ph, %.lr.ph32.split.us.new.preheader ], [ %ind.end, %middle.block ]
  br label %.lr.ph32.split.us.new

.lr.ph32.split.us.new:                            ; preds = %.lr.ph32.split.us.new.preheader186, %.lr.ph32.split.us.new
  %indvars.iv76 = phi i64 [ %indvars.iv.next77.1, %.lr.ph32.split.us.new ], [ %indvars.iv76.ph, %.lr.ph32.split.us.new.preheader186 ]
  %109 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv84, i64 %indvars.iv76
  %110 = load float, float* %109, align 4
  %111 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv84, i64 %indvars.iv76
  %112 = load float, float* %111, align 4
  %113 = fadd float %110, %112
  %114 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv84, i64 %indvars.iv76
  store float %113, float* %114, align 4
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %115 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv84, i64 %indvars.iv.next77
  %116 = load float, float* %115, align 4
  %117 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv84, i64 %indvars.iv.next77
  %118 = load float, float* %117, align 4
  %119 = fadd float %116, %118
  %120 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv84, i64 %indvars.iv.next77
  store float %119, float* %120, align 4
  %indvars.iv.next77.1 = add nsw i64 %indvars.iv76, 2
  %exitcond79.1 = icmp eq i64 %indvars.iv.next77.1, 2160
  br i1 %exitcond79.1, label %._crit_edge30.us.loopexit, label %.lr.ph32.split.us.new, !llvm.loop !15

._crit_edge30.us.loopexit:                        ; preds = %.lr.ph32.split.us.new
  br label %._crit_edge30.us

._crit_edge30.us:                                 ; preds = %._crit_edge30.us.loopexit, %middle.block, %.prol.loopexit81
  %indvars.iv.next85 = add nuw nsw i64 %indvars.iv84, 1
  %exitcond87 = icmp eq i64 %indvars.iv.next85, 4096
  br i1 %exitcond87, label %._crit_edge33.loopexit, label %.lr.ph32.split.us

._crit_edge33.loopexit:                           ; preds = %._crit_edge30.us
  br label %._crit_edge33

._crit_edge33:                                    ; preds = %._crit_edge33.loopexit, %7, %._crit_edge46, %._crit_edge40
  br i1 true, label %.lr.ph26, label %._crit_edge21

.lr.ph26:                                         ; preds = %._crit_edge33
  br i1 true, label %.lr.ph26.split.us.preheader, label %._crit_edge14

.lr.ph26.split.us.preheader:                      ; preds = %.lr.ph26
  br label %.lr.ph26.split.us

.lr.ph26.split.us:                                ; preds = %.lr.ph26.split.us.preheader, %._crit_edge24.us
  %indvars.iv71 = phi i64 [ %indvars.iv.next72, %._crit_edge24.us ], [ 0, %.lr.ph26.split.us.preheader ]
  br label %121

; <label>:121:                                    ; preds = %121, %.lr.ph26.split.us
  %indvars.iv67 = phi i64 [ 0, %.lr.ph26.split.us ], [ %indvars.iv.next68.1, %121 ]
  %122 = phi float [ 0.000000e+00, %.lr.ph26.split.us ], [ %144, %121 ]
  %123 = phi float [ 0.000000e+00, %.lr.ph26.split.us ], [ %133, %121 ]
  %124 = phi float [ 0.000000e+00, %.lr.ph26.split.us ], [ %146, %121 ]
  %125 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv67, i64 %indvars.iv71
  %126 = load float, float* %125, align 4
  %127 = fmul float %20, %126
  %128 = fmul float %31, %124
  %129 = fadd float %127, %128
  %130 = fmul float %exp2, %122
  %131 = fadd float %129, %130
  %132 = fmul float %123, %38
  %133 = fadd float %131, %132
  %134 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv67, i64 %indvars.iv71
  store float %133, float* %134, align 4
  %135 = load float, float* %125, align 4
  %indvars.iv.next68 = or i64 %indvars.iv67, 1
  %136 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next68, i64 %indvars.iv71
  %137 = load float, float* %136, align 4
  %138 = fmul float %20, %137
  %139 = fmul float %31, %135
  %140 = fadd float %138, %139
  %141 = fmul float %exp2, %133
  %142 = fadd float %140, %141
  %143 = fmul float %122, %38
  %144 = fadd float %142, %143
  %145 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv.next68, i64 %indvars.iv71
  store float %144, float* %145, align 4
  %146 = load float, float* %136, align 4
  %indvars.iv.next68.1 = add nsw i64 %indvars.iv67, 2
  %exitcond70.1 = icmp eq i64 %indvars.iv.next68.1, 4096
  br i1 %exitcond70.1, label %._crit_edge24.us, label %121

._crit_edge24.us:                                 ; preds = %121
  %indvars.iv.next72 = add nuw nsw i64 %indvars.iv71, 1
  %exitcond74 = icmp eq i64 %indvars.iv.next72, 2160
  br i1 %exitcond74, label %._crit_edge27, label %.lr.ph26.split.us

._crit_edge27:                                    ; preds = %._crit_edge24.us
  br i1 true, label %.lr.ph20, label %._crit_edge21

.lr.ph20:                                         ; preds = %._crit_edge27
  br i1 true, label %.lr.ph20.split.us.preheader, label %._crit_edge14

.lr.ph20.split.us.preheader:                      ; preds = %.lr.ph20
  br label %.lr.ph20.split.us

.lr.ph20.split.us:                                ; preds = %._crit_edge18.us, %.lr.ph20.split.us.preheader
  %indvars.iv62 = phi i64 [ 0, %.lr.ph20.split.us.preheader ], [ %indvars.iv.next63, %._crit_edge18.us ]
  br label %147

; <label>:147:                                    ; preds = %147, %.lr.ph20.split.us
  %indvars.iv60 = phi i64 [ %indvars.iv.next61, %147 ], [ 4096, %.lr.ph20.split.us ]
  %148 = phi float [ %159, %147 ], [ 0.000000e+00, %.lr.ph20.split.us ]
  %149 = phi i32 [ %163, %147 ], [ 0, %.lr.ph20.split.us ]
  %150 = phi float [ %148, %147 ], [ 0.000000e+00, %.lr.ph20.split.us ]
  %151 = phi float [ %166, %147 ], [ 0.000000e+00, %.lr.ph20.split.us ]
  %152 = phi float [ %165, %147 ], [ 0.000000e+00, %.lr.ph20.split.us ]
  %indvars.iv.next61 = add nsw i64 %indvars.iv60, -1
  %153 = fmul float %32, %152
  %154 = fmul float %151, %36
  %155 = fadd float %153, %154
  %156 = fmul float %exp2, %148
  %157 = fadd float %155, %156
  %158 = fmul float %150, %38
  %159 = fadd float %157, %158
  %160 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv.next61, i64 %indvars.iv62
  store float %159, float* %160, align 4
  %161 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next61, i64 %indvars.iv62
  %162 = bitcast float* %161 to i32*
  %163 = load i32, i32* %162, align 4
  %164 = icmp sgt i64 %indvars.iv60, 1
  %165 = bitcast i32 %163 to float
  %166 = bitcast i32 %149 to float
  br i1 %164, label %147, label %._crit_edge18.us

._crit_edge18.us:                                 ; preds = %147
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond65 = icmp eq i64 %indvars.iv.next63, 2160
  br i1 %exitcond65, label %._crit_edge21.loopexit, label %.lr.ph20.split.us

._crit_edge21.loopexit:                           ; preds = %._crit_edge18.us
  br label %._crit_edge21

._crit_edge21:                                    ; preds = %._crit_edge21.loopexit, %._crit_edge33, %._crit_edge27
  %167 = phi i1 [ false, %._crit_edge27 ], [ false, %._crit_edge33 ], [ true, %._crit_edge21.loopexit ]
  br i1 %167, label %.lr.ph13.split.us.preheader, label %._crit_edge14

.lr.ph13.split.us.preheader:                      ; preds = %._crit_edge21
  br label %.lr.ph13.split.us

.lr.ph13.split.us:                                ; preds = %.lr.ph13.split.us.preheader, %._crit_edge.us
  %indvars.iv56 = phi i64 [ %indvars.iv.next57, %._crit_edge.us ], [ 0, %.lr.ph13.split.us.preheader ]
  %scevgep144 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv56, i64 2
  %scevgep150 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv56, i64 2
  %scevgep156 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv56, i64 2
  br i1 true, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.lr.ph13.split.us
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.lr.ph13.split.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.lr.ph13.split.us ]
  br i1 false, label %._crit_edge.us, label %.lr.ph13.split.us.new.preheader

.lr.ph13.split.us.new.preheader:                  ; preds = %.prol.loopexit
  %168 = sub nsw i64 2158, %indvars.iv.unr.ph
  %169 = lshr i64 %168, 1
  %170 = add nuw nsw i64 %169, 1
  br i1 false, label %.lr.ph13.split.us.new.preheader185, label %min.iters.checked136

min.iters.checked136:                             ; preds = %.lr.ph13.split.us.new.preheader
  %n.mod.vf137 = and i64 %170, 3
  %n.vec138 = sub nsw i64 %170, %n.mod.vf137
  br i1 false, label %.lr.ph13.split.us.new.preheader185, label %vector.memcheck167

vector.memcheck167:                               ; preds = %min.iters.checked136
  %scevgep142 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv56, i64 %indvars.iv.unr.ph
  %171 = sub nsw i64 2158, %indvars.iv.unr.ph
  %172 = and i64 %171, 2158
  %173 = or i64 %indvars.iv.unr.ph, %172
  %scevgep145 = getelementptr float, float* %scevgep144, i64 %173
  %scevgep148 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv56, i64 %indvars.iv.unr.ph
  %scevgep151 = getelementptr float, float* %scevgep150, i64 %173
  %scevgep154 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv56, i64 %indvars.iv.unr.ph
  %scevgep157 = getelementptr float, float* %scevgep156, i64 %173
  %bound0159 = icmp ult float* %scevgep142, %scevgep151
  %bound1160 = icmp ult float* %scevgep148, %scevgep145
  %found.conflict161 = and i1 %bound0159, %bound1160
  %bound0162 = icmp ult float* %scevgep142, %scevgep157
  %bound1163 = icmp ult float* %scevgep154, %scevgep145
  %found.conflict164 = and i1 %bound0162, %bound1163
  %conflict.rdx165 = or i1 %found.conflict161, %found.conflict164
  %174 = or i64 %indvars.iv.unr.ph, 2
  %175 = shl nuw nsw i64 %169, 1
  %176 = add nuw nsw i64 %174, %175
  %177 = shl nuw nsw i64 %n.mod.vf137, 1
  %ind.end172 = sub nsw i64 %176, %177
  br i1 %conflict.rdx165, label %.lr.ph13.split.us.new.preheader185, label %vector.body132.preheader

vector.body132.preheader:                         ; preds = %vector.memcheck167
  br label %vector.body132

vector.body132:                                   ; preds = %vector.body132.preheader, %vector.body132
  %index169 = phi i64 [ %index.next170, %vector.body132 ], [ 0, %vector.body132.preheader ]
  %178 = shl i64 %index169, 1
  %offset.idx174 = or i64 %indvars.iv.unr.ph, %178
  %179 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv56, i64 %offset.idx174
  %180 = bitcast float* %179 to <8 x float>*
  %wide.vec178 = load <8 x float>, <8 x float>* %180, align 4, !alias.scope !16
  %181 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv56, i64 %offset.idx174
  %182 = bitcast float* %181 to <8 x float>*
  %wide.vec181 = load <8 x float>, <8 x float>* %182, align 4, !alias.scope !19
  %183 = fadd <8 x float> %wide.vec178, %wide.vec181
  %184 = shufflevector <8 x float> %183, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %185 = add nuw nsw i64 %offset.idx174, 1
  %186 = fadd <8 x float> %wide.vec178, %wide.vec181
  %187 = shufflevector <8 x float> %186, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %188 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv56, i64 %185
  %189 = getelementptr float, float* %188, i64 -1
  %190 = bitcast float* %189 to <8 x float>*
  %interleaved.vec184 = shufflevector <4 x float> %184, <4 x float> %187, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec184, <8 x float>* %190, align 4, !alias.scope !21, !noalias !23
  %index.next170 = add i64 %index169, 4
  %191 = icmp eq i64 %index.next170, %n.vec138
  br i1 %191, label %middle.block133, label %vector.body132, !llvm.loop !24

middle.block133:                                  ; preds = %vector.body132
  %cmp.n173 = icmp eq i64 %n.mod.vf137, 0
  br i1 %cmp.n173, label %._crit_edge.us, label %.lr.ph13.split.us.new.preheader185

.lr.ph13.split.us.new.preheader185:               ; preds = %middle.block133, %vector.memcheck167, %min.iters.checked136, %.lr.ph13.split.us.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr.ph, %vector.memcheck167 ], [ %indvars.iv.unr.ph, %min.iters.checked136 ], [ %indvars.iv.unr.ph, %.lr.ph13.split.us.new.preheader ], [ %ind.end172, %middle.block133 ]
  br label %.lr.ph13.split.us.new

.lr.ph13.split.us.new:                            ; preds = %.lr.ph13.split.us.new.preheader185, %.lr.ph13.split.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph13.split.us.new ], [ %indvars.iv.ph, %.lr.ph13.split.us.new.preheader185 ]
  %192 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv56, i64 %indvars.iv
  %193 = load float, float* %192, align 4
  %194 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv56, i64 %indvars.iv
  %195 = load float, float* %194, align 4
  %196 = fadd float %193, %195
  %197 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv56, i64 %indvars.iv
  store float %196, float* %197, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %198 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv56, i64 %indvars.iv.next
  %199 = load float, float* %198, align 4
  %200 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv56, i64 %indvars.iv.next
  %201 = load float, float* %200, align 4
  %202 = fadd float %199, %201
  %203 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv56, i64 %indvars.iv.next
  store float %202, float* %203, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2160
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph13.split.us.new, !llvm.loop !25

._crit_edge.us.loopexit:                          ; preds = %.lr.ph13.split.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block133, %.prol.loopexit
  %indvars.iv.next57 = add nuw nsw i64 %indvars.iv56, 1
  %exitcond = icmp eq i64 %indvars.iv.next57, 4096
  br i1 %exitcond, label %._crit_edge14.loopexit, label %.lr.ph13.split.us

._crit_edge14.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge14

._crit_edge14:                                    ; preds = %._crit_edge14.loopexit, %._crit_edge21, %.lr.ph26, %.lr.ph20, %.lr.ph32, %.lr.ph45, %.lr.ph39
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [2160 x float]* nocapture readonly) unnamed_addr #0 {
  %4 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %5 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %4) #6
  %6 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %7 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %6, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  br i1 true, label %.lr.ph3.split.us.preheader, label %._crit_edge4

.lr.ph3.split.us.preheader:                       ; preds = %3
  br label %.lr.ph3.split.us

.lr.ph3.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph3.split.us.preheader
  %indvars.iv11 = phi i64 [ 0, %.lr.ph3.split.us.preheader ], [ %indvars.iv.next12, %._crit_edge.us ]
  %8 = mul nsw i64 %indvars.iv11, 2160
  br label %9

; <label>:9:                                      ; preds = %16, %.lr.ph3.split.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %16 ], [ 0, %.lr.ph3.split.us ]
  %10 = add nsw i64 %8, %indvars.iv
  %11 = trunc i64 %10 to i32
  %12 = srem i32 %11, 20
  %13 = icmp eq i32 %12, 0
  br i1 %13, label %14, label %16

; <label>:14:                                     ; preds = %9
  %15 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %15) #6
  br label %16

; <label>:16:                                     ; preds = %14, %9
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %18 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv11, i64 %indvars.iv
  %19 = load float, float* %18, align 4
  %20 = fpext float %19 to double
  %21 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %17, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %20) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2160
  br i1 %exitcond, label %._crit_edge.us, label %9

._crit_edge.us:                                   ; preds = %16
  %indvars.iv.next12 = add nuw nsw i64 %indvars.iv11, 1
  %exitcond14 = icmp eq i64 %indvars.iv.next12, 4096
  br i1 %exitcond14, label %._crit_edge4.loopexit, label %.lr.ph3.split.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %3
  %22 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %23 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %22, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  %24 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %25 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %24) #6
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
