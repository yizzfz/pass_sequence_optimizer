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
  tail call void (...) @polybench_timer_start() #5
  %10 = load float, float* %3, align 4
  %11 = bitcast i8* %6 to [2160 x float]*
  %12 = bitcast i8* %7 to [2160 x float]*
  tail call void @kernel_deriche(i32 4096, i32 2160, float %10, [2160 x float]* %8, [2160 x float]* %9, [2160 x float]* %11, [2160 x float]* %12)
  tail call void (...) @polybench_timer_stop() #5
  tail call void (...) @polybench_timer_print() #5
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %19

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %14
  %18 = bitcast i8* %5 to [2160 x float]*
  tail call void @print_array(i32 4096, i32 2160, [2160 x float]* %18)
  br label %19

; <label>:19:                                     ; preds = %14, %17, %2
  tail call void @free(i8* %4) #5
  tail call void @free(i8* %5) #5
  tail call void @free(i8* %6) #5
  tail call void @free(i8* %7) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal void @init_array(i32, i32, float* nocapture, [2160 x float]* nocapture) #2 {
  store float 2.500000e-01, float* %2, align 4
  %5 = icmp sgt i32 %0, 0
  %6 = icmp sgt i32 %1, 0
  %or.cond = and i1 %5, %6
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge4

.preheader.us.preheader:                          ; preds = %4
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count8 = zext i32 %0 to i64
  %min.iters.check = icmp ult i32 %1, 4
  %7 = and i32 %1, 3
  %n.mod.vf = zext i32 %7 to i64
  %n.vec = sub nsw i64 %wide.trip.count, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  %cmp.n = icmp eq i32 %7, 0
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv6 = phi i64 [ %indvars.iv.next7, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %8 = mul nuw nsw i64 %indvars.iv6, 313
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %8, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph ], [ %vec.ind.next, %vector.body ]
  %9 = mul nuw nsw <4 x i64> %vec.ind, <i64 991, i64 991, i64 991, i64 991>
  %10 = add nuw nsw <4 x i64> %9, %broadcast.splat
  %11 = trunc <4 x i64> %10 to <4 x i32>
  %12 = srem <4 x i32> %11, <i32 65536, i32 65536, i32 65536, i32 65536>
  %13 = sitofp <4 x i32> %12 to <4 x float>
  %14 = fdiv <4 x float> %13, <float 6.553500e+04, float 6.553500e+04, float 6.553500e+04, float 6.553500e+04>
  %15 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv6, i64 %index
  %16 = bitcast float* %15 to <4 x float>*
  store <4 x float> %14, <4 x float>* %16, align 4
  %index.next = add i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %17 = icmp eq i64 %index.next, %n.vec
  br i1 %17, label %middle.block, label %vector.body, !llvm.loop !1

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %min.iters.checked, %.preheader.us
  %indvars.iv.ph = phi i64 [ 0, %min.iters.checked ], [ 0, %.preheader.us ], [ %n.vec, %middle.block ]
  br label %scalar.ph

scalar.ph:                                        ; preds = %scalar.ph.preheader, %scalar.ph
  %indvars.iv = phi i64 [ %indvars.iv.next, %scalar.ph ], [ %indvars.iv.ph, %scalar.ph.preheader ]
  %18 = mul nuw nsw i64 %indvars.iv, 991
  %19 = add nuw nsw i64 %18, %8
  %20 = trunc i64 %19 to i32
  %21 = srem i32 %20, 65536
  %22 = sitofp i32 %21 to float
  %23 = fdiv float %22, 6.553500e+04
  %24 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv6, i64 %indvars.iv
  store float %23, float* %24, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us.loopexit, label %scalar.ph, !llvm.loop !4

._crit_edge.us.loopexit:                          ; preds = %scalar.ph
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, %wide.trip.count8
  br i1 %exitcond9, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %4
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
  %22 = fmul float %21, %20
  %23 = fadd float %2, -1.000000e+00
  %24 = fmul float %23, %22
  %25 = tail call float @expf(float %8) #5
  %26 = fmul float %25, %20
  %27 = fadd float %2, 1.000000e+00
  %28 = fmul float %27, %26
  %29 = fmul float %2, -2.000000e+00
  %30 = tail call float @expf(float %29) #5
  %31 = fmul float %20, %30
  %32 = fsub float -0.000000e+00, %31
  %exp2 = tail call float @llvm.exp2.f32(float %8)
  %33 = tail call float @expf(float %29) #5
  %34 = fsub float -0.000000e+00, %33
  %35 = icmp sgt i32 %0, 0
  br i1 %35, label %.preheader30.lr.ph, label %.preheader25

.preheader30.lr.ph:                               ; preds = %7
  %36 = icmp sgt i32 %1, 0
  br i1 %36, label %.preheader30.us.preheader, label %._crit_edge33

.preheader30.us.preheader:                        ; preds = %.preheader30.lr.ph
  %xtraiter126 = and i32 %1, 1
  %lcmp.mod127 = icmp eq i32 %xtraiter126, 0
  %37 = icmp eq i32 %1, 1
  %wide.trip.count130 = zext i32 %0 to i64
  %wide.trip.count122.1 = zext i32 %1 to i64
  %38 = fmul float %24, 0.000000e+00
  %39 = fmul float %exp2, 0.000000e+00
  %40 = fmul float %33, -0.000000e+00
  br label %.preheader30.us

.preheader30.us:                                  ; preds = %.preheader30.us.preheader, %._crit_edge68.us
  %indvars.iv128 = phi i64 [ %indvars.iv.next129, %._crit_edge68.us ], [ 0, %.preheader30.us.preheader ]
  br i1 %lcmp.mod127, label %.prol.loopexit125, label %.prol.preheader124

.prol.preheader124:                               ; preds = %.preheader30.us
  %41 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv128, i64 0
  %42 = load float, float* %41, align 4
  %43 = fmul float %20, %42
  %44 = fadd float %38, %43
  %45 = fadd float %39, %44
  %46 = fadd float %40, %45
  %47 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv128, i64 0
  store float %46, float* %47, align 4
  %48 = load float, float* %41, align 4
  br label %.prol.loopexit125

.prol.loopexit125:                                ; preds = %.prol.preheader124, %.preheader30.us
  %indvars.iv120.unr.ph = phi i64 [ 1, %.prol.preheader124 ], [ 0, %.preheader30.us ]
  %.01764.us.unr.ph = phi float [ %48, %.prol.preheader124 ], [ 0.000000e+00, %.preheader30.us ]
  %.01963.us.unr.ph = phi float [ %46, %.prol.preheader124 ], [ 0.000000e+00, %.preheader30.us ]
  br i1 %37, label %._crit_edge68.us, label %.preheader30.us.new.preheader

.preheader30.us.new.preheader:                    ; preds = %.prol.loopexit125
  br label %.preheader30.us.new

.preheader30.us.new:                              ; preds = %.preheader30.us.new.preheader, %.preheader30.us.new
  %indvars.iv120 = phi i64 [ %indvars.iv.next121.1, %.preheader30.us.new ], [ %indvars.iv120.unr.ph, %.preheader30.us.new.preheader ]
  %.0766.us = phi float [ %57, %.preheader30.us.new ], [ 0.000000e+00, %.preheader30.us.new.preheader ]
  %.01764.us = phi float [ %70, %.preheader30.us.new ], [ %.01764.us.unr.ph, %.preheader30.us.new.preheader ]
  %.01963.us = phi float [ %68, %.preheader30.us.new ], [ %.01963.us.unr.ph, %.preheader30.us.new.preheader ]
  %49 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv128, i64 %indvars.iv120
  %50 = load float, float* %49, align 4
  %51 = fmul float %20, %50
  %52 = fmul float %24, %.01764.us
  %53 = fadd float %52, %51
  %54 = fmul float %exp2, %.01963.us
  %55 = fadd float %54, %53
  %56 = fmul float %.0766.us, %34
  %57 = fadd float %56, %55
  %58 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv128, i64 %indvars.iv120
  store float %57, float* %58, align 4
  %59 = load float, float* %49, align 4
  %indvars.iv.next121 = add nuw nsw i64 %indvars.iv120, 1
  %60 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv128, i64 %indvars.iv.next121
  %61 = load float, float* %60, align 4
  %62 = fmul float %20, %61
  %63 = fmul float %24, %59
  %64 = fadd float %63, %62
  %65 = fmul float %exp2, %57
  %66 = fadd float %65, %64
  %67 = fmul float %.01963.us, %34
  %68 = fadd float %67, %66
  %69 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv128, i64 %indvars.iv.next121
  store float %68, float* %69, align 4
  %70 = load float, float* %60, align 4
  %indvars.iv.next121.1 = add nsw i64 %indvars.iv120, 2
  %exitcond123.1 = icmp eq i64 %indvars.iv.next121.1, %wide.trip.count122.1
  br i1 %exitcond123.1, label %._crit_edge68.us.loopexit, label %.preheader30.us.new

._crit_edge68.us.loopexit:                        ; preds = %.preheader30.us.new
  br label %._crit_edge68.us

._crit_edge68.us:                                 ; preds = %._crit_edge68.us.loopexit, %.prol.loopexit125
  %indvars.iv.next129 = add nuw nsw i64 %indvars.iv128, 1
  %exitcond131 = icmp eq i64 %indvars.iv.next129, %wide.trip.count130
  br i1 %exitcond131, label %.preheader29, label %.preheader30.us

.preheader29:                                     ; preds = %._crit_edge68.us
  %71 = icmp sgt i32 %0, 0
  br i1 %71, label %.preheader28.lr.ph, label %.preheader25

.preheader28.lr.ph:                               ; preds = %.preheader29
  %72 = icmp sgt i32 %1, 0
  br i1 %72, label %.preheader28.us.preheader, label %._crit_edge33

.preheader28.us.preheader:                        ; preds = %.preheader28.lr.ph
  %73 = sext i32 %1 to i64
  %wide.trip.count117 = zext i32 %0 to i64
  br label %.preheader28.us

.preheader28.us:                                  ; preds = %._crit_edge61.us, %.preheader28.us.preheader
  %indvars.iv115 = phi i64 [ 0, %.preheader28.us.preheader ], [ %indvars.iv.next116, %._crit_edge61.us ]
  br label %74

; <label>:74:                                     ; preds = %.preheader28.us, %74
  %indvars.iv113 = phi i64 [ %73, %.preheader28.us ], [ %indvars.iv.next114, %74 ]
  %.058.us = phi float [ 0.000000e+00, %.preheader28.us ], [ %.0157.us, %74 ]
  %.0157.us = phi float [ 0.000000e+00, %.preheader28.us ], [ %81, %74 ]
  %.0556.us = phi float [ 0.000000e+00, %.preheader28.us ], [ %.0655.us, %74 ]
  %.0655.us = phi float [ 0.000000e+00, %.preheader28.us ], [ %84, %74 ]
  %indvars.iv.next114 = add nsw i64 %indvars.iv113, -1
  %75 = fmul float %28, %.0655.us
  %76 = fmul float %.0556.us, %32
  %77 = fadd float %75, %76
  %78 = fmul float %exp2, %.0157.us
  %79 = fadd float %77, %78
  %80 = fmul float %.058.us, %34
  %81 = fadd float %79, %80
  %82 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv115, i64 %indvars.iv.next114
  store float %81, float* %82, align 4
  %83 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv115, i64 %indvars.iv.next114
  %84 = load float, float* %83, align 4
  %85 = icmp sgt i64 %indvars.iv113, 1
  br i1 %85, label %74, label %._crit_edge61.us

._crit_edge61.us:                                 ; preds = %74
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115, 1
  %exitcond118 = icmp eq i64 %indvars.iv.next116, %wide.trip.count117
  br i1 %exitcond118, label %.preheader27, label %.preheader28.us

.preheader27:                                     ; preds = %._crit_edge61.us
  %86 = icmp sgt i32 %0, 0
  br i1 %86, label %.preheader26.lr.ph, label %.preheader25

.preheader26.lr.ph:                               ; preds = %.preheader27
  %87 = icmp sgt i32 %1, 0
  br i1 %87, label %.preheader26.us.preheader, label %._crit_edge33

.preheader26.us.preheader:                        ; preds = %.preheader26.lr.ph
  %xtraiter106 = and i32 %1, 1
  %lcmp.mod107 = icmp eq i32 %xtraiter106, 0
  %88 = icmp eq i32 %1, 1
  %wide.trip.count110 = zext i32 %0 to i64
  %wide.trip.count102.1 = zext i32 %1 to i64
  %89 = add nsw i64 %wide.trip.count122.1, -2
  %90 = add nsw i64 %wide.trip.count122.1, -2
  br label %.preheader26.us

.preheader26.us:                                  ; preds = %.preheader26.us.preheader, %._crit_edge52.us
  %indvars.iv108 = phi i64 [ %indvars.iv.next109, %._crit_edge52.us ], [ 0, %.preheader26.us.preheader ]
  %scevgep139 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv108, i64 2
  %scevgep145 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv108, i64 2
  %scevgep151 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv108, i64 2
  br i1 %lcmp.mod107, label %.prol.loopexit105, label %.prol.preheader104

.prol.preheader104:                               ; preds = %.preheader26.us
  %91 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv108, i64 0
  %92 = load float, float* %91, align 4
  %93 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv108, i64 0
  %94 = load float, float* %93, align 4
  %95 = fadd float %92, %94
  %96 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv108, i64 0
  store float %95, float* %96, align 4
  br label %.prol.loopexit105

.prol.loopexit105:                                ; preds = %.prol.preheader104, %.preheader26.us
  %indvars.iv100.unr.ph = phi i64 [ 1, %.prol.preheader104 ], [ 0, %.preheader26.us ]
  br i1 %88, label %._crit_edge52.us, label %.preheader26.us.new.preheader

.preheader26.us.new.preheader:                    ; preds = %.prol.loopexit105
  %97 = sub nsw i64 %89, %indvars.iv100.unr.ph
  %98 = lshr i64 %97, 1
  %99 = add nuw i64 %98, 1
  %min.iters.check = icmp ult i64 %99, 4
  br i1 %min.iters.check, label %.preheader26.us.new.preheader215, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader26.us.new.preheader
  %n.mod.vf = and i64 %99, 3
  %n.vec = sub i64 %99, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.preheader26.us.new.preheader215, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep137 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv108, i64 %indvars.iv100.unr.ph
  %100 = sub nsw i64 %90, %indvars.iv100.unr.ph
  %101 = and i64 %100, -2
  %102 = or i64 %indvars.iv100.unr.ph, %101
  %scevgep140 = getelementptr float, float* %scevgep139, i64 %102
  %scevgep143 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv108, i64 %indvars.iv100.unr.ph
  %scevgep146 = getelementptr float, float* %scevgep145, i64 %102
  %scevgep149 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv108, i64 %indvars.iv100.unr.ph
  %scevgep152 = getelementptr float, float* %scevgep151, i64 %102
  %bound0 = icmp ult float* %scevgep137, %scevgep146
  %bound1 = icmp ult float* %scevgep143, %scevgep140
  %found.conflict = and i1 %bound0, %bound1
  %bound0154 = icmp ult float* %scevgep137, %scevgep152
  %bound1155 = icmp ult float* %scevgep149, %scevgep140
  %found.conflict156 = and i1 %bound0154, %bound1155
  %conflict.rdx = or i1 %found.conflict, %found.conflict156
  %103 = or i64 %indvars.iv100.unr.ph, 2
  %104 = shl nuw i64 %98, 1
  %105 = add i64 %103, %104
  %106 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %105, %106
  br i1 %conflict.rdx, label %.preheader26.us.new.preheader215, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %107 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv100.unr.ph, %107
  %108 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv108, i64 %offset.idx
  %109 = bitcast float* %108 to <8 x float>*
  %wide.vec = load <8 x float>, <8 x float>* %109, align 4, !alias.scope !6
  %110 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv108, i64 %offset.idx
  %111 = bitcast float* %110 to <8 x float>*
  %wide.vec158 = load <8 x float>, <8 x float>* %111, align 4, !alias.scope !9
  %112 = fadd <8 x float> %wide.vec, %wide.vec158
  %113 = shufflevector <8 x float> %112, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %114 = add nuw nsw i64 %offset.idx, 1
  %115 = fadd <8 x float> %wide.vec, %wide.vec158
  %116 = shufflevector <8 x float> %115, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %117 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv108, i64 %114
  %118 = getelementptr float, float* %117, i64 -1
  %119 = bitcast float* %118 to <8 x float>*
  %interleaved.vec = shufflevector <4 x float> %113, <4 x float> %116, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec, <8 x float>* %119, align 4, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %120 = icmp eq i64 %index.next, %n.vec
  br i1 %120, label %middle.block, label %vector.body, !llvm.loop !14

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge52.us, label %.preheader26.us.new.preheader215

.preheader26.us.new.preheader215:                 ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader26.us.new.preheader
  %indvars.iv100.ph = phi i64 [ %indvars.iv100.unr.ph, %vector.memcheck ], [ %indvars.iv100.unr.ph, %min.iters.checked ], [ %indvars.iv100.unr.ph, %.preheader26.us.new.preheader ], [ %ind.end, %middle.block ]
  br label %.preheader26.us.new

.preheader26.us.new:                              ; preds = %.preheader26.us.new.preheader215, %.preheader26.us.new
  %indvars.iv100 = phi i64 [ %indvars.iv.next101.1, %.preheader26.us.new ], [ %indvars.iv100.ph, %.preheader26.us.new.preheader215 ]
  %121 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv108, i64 %indvars.iv100
  %122 = load float, float* %121, align 4
  %123 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv108, i64 %indvars.iv100
  %124 = load float, float* %123, align 4
  %125 = fadd float %122, %124
  %126 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv108, i64 %indvars.iv100
  store float %125, float* %126, align 4
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %127 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv108, i64 %indvars.iv.next101
  %128 = load float, float* %127, align 4
  %129 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv108, i64 %indvars.iv.next101
  %130 = load float, float* %129, align 4
  %131 = fadd float %128, %130
  %132 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv108, i64 %indvars.iv.next101
  store float %131, float* %132, align 4
  %indvars.iv.next101.1 = add nsw i64 %indvars.iv100, 2
  %exitcond103.1 = icmp eq i64 %indvars.iv.next101.1, %wide.trip.count102.1
  br i1 %exitcond103.1, label %._crit_edge52.us.loopexit, label %.preheader26.us.new, !llvm.loop !15

._crit_edge52.us.loopexit:                        ; preds = %.preheader26.us.new
  br label %._crit_edge52.us

._crit_edge52.us:                                 ; preds = %._crit_edge52.us.loopexit, %middle.block, %.prol.loopexit105
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  %exitcond111 = icmp eq i64 %indvars.iv.next109, %wide.trip.count110
  br i1 %exitcond111, label %.preheader25.loopexit, label %.preheader26.us

.preheader25.loopexit:                            ; preds = %._crit_edge52.us
  br label %.preheader25

.preheader25:                                     ; preds = %.preheader25.loopexit, %7, %.preheader29, %.preheader27
  %133 = icmp sgt i32 %1, 0
  br i1 %133, label %.preheader24.lr.ph, label %.preheader21

.preheader24.lr.ph:                               ; preds = %.preheader25
  %134 = icmp sgt i32 %0, 0
  br i1 %134, label %.preheader24.us.preheader, label %._crit_edge33

.preheader24.us.preheader:                        ; preds = %.preheader24.lr.ph
  %xtraiter93 = and i32 %0, 1
  %lcmp.mod94 = icmp eq i32 %xtraiter93, 0
  %135 = icmp eq i32 %0, 1
  %wide.trip.count97 = zext i32 %1 to i64
  %wide.trip.count89.1 = zext i32 %0 to i64
  %136 = fmul float %24, 0.000000e+00
  %137 = fmul float %exp2, 0.000000e+00
  %138 = fmul float %33, -0.000000e+00
  br label %.preheader24.us

.preheader24.us:                                  ; preds = %.preheader24.us.preheader, %._crit_edge48.us
  %indvars.iv95 = phi i64 [ %indvars.iv.next96, %._crit_edge48.us ], [ 0, %.preheader24.us.preheader ]
  br i1 %lcmp.mod94, label %.prol.loopexit92, label %.prol.preheader91

.prol.preheader91:                                ; preds = %.preheader24.us
  %139 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 0, i64 %indvars.iv95
  %140 = load float, float* %139, align 4
  %141 = fmul float %20, %140
  %142 = fadd float %136, %141
  %143 = fadd float %137, %142
  %144 = fadd float %138, %143
  %145 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 0, i64 %indvars.iv95
  store float %144, float* %145, align 4
  %146 = load float, float* %139, align 4
  br label %.prol.loopexit92

.prol.loopexit92:                                 ; preds = %.prol.preheader91, %.preheader24.us
  %indvars.iv87.unr.ph = phi i64 [ 1, %.prol.preheader91 ], [ 0, %.preheader24.us ]
  %.01844.us.unr.ph = phi float [ %146, %.prol.preheader91 ], [ 0.000000e+00, %.preheader24.us ]
  %.12043.us.unr.ph = phi float [ %144, %.prol.preheader91 ], [ 0.000000e+00, %.preheader24.us ]
  br i1 %135, label %._crit_edge48.us, label %.preheader24.us.new.preheader

.preheader24.us.new.preheader:                    ; preds = %.prol.loopexit92
  br label %.preheader24.us.new

.preheader24.us.new:                              ; preds = %.preheader24.us.new.preheader, %.preheader24.us.new
  %indvars.iv87 = phi i64 [ %indvars.iv.next88.1, %.preheader24.us.new ], [ %indvars.iv87.unr.ph, %.preheader24.us.new.preheader ]
  %.1846.us = phi float [ %155, %.preheader24.us.new ], [ 0.000000e+00, %.preheader24.us.new.preheader ]
  %.01844.us = phi float [ %168, %.preheader24.us.new ], [ %.01844.us.unr.ph, %.preheader24.us.new.preheader ]
  %.12043.us = phi float [ %166, %.preheader24.us.new ], [ %.12043.us.unr.ph, %.preheader24.us.new.preheader ]
  %147 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv87, i64 %indvars.iv95
  %148 = load float, float* %147, align 4
  %149 = fmul float %20, %148
  %150 = fmul float %24, %.01844.us
  %151 = fadd float %150, %149
  %152 = fmul float %exp2, %.12043.us
  %153 = fadd float %152, %151
  %154 = fmul float %.1846.us, %34
  %155 = fadd float %154, %153
  %156 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv87, i64 %indvars.iv95
  store float %155, float* %156, align 4
  %157 = load float, float* %147, align 4
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  %158 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next88, i64 %indvars.iv95
  %159 = load float, float* %158, align 4
  %160 = fmul float %20, %159
  %161 = fmul float %24, %157
  %162 = fadd float %161, %160
  %163 = fmul float %exp2, %155
  %164 = fadd float %163, %162
  %165 = fmul float %.12043.us, %34
  %166 = fadd float %165, %164
  %167 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv.next88, i64 %indvars.iv95
  store float %166, float* %167, align 4
  %168 = load float, float* %158, align 4
  %indvars.iv.next88.1 = add nsw i64 %indvars.iv87, 2
  %exitcond90.1 = icmp eq i64 %indvars.iv.next88.1, %wide.trip.count89.1
  br i1 %exitcond90.1, label %._crit_edge48.us.loopexit, label %.preheader24.us.new

._crit_edge48.us.loopexit:                        ; preds = %.preheader24.us.new
  br label %._crit_edge48.us

._crit_edge48.us:                                 ; preds = %._crit_edge48.us.loopexit, %.prol.loopexit92
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %exitcond98 = icmp eq i64 %indvars.iv.next96, %wide.trip.count97
  br i1 %exitcond98, label %.preheader23, label %.preheader24.us

.preheader23:                                     ; preds = %._crit_edge48.us
  %169 = icmp sgt i32 %1, 0
  br i1 %169, label %.preheader22.lr.ph, label %.preheader21

.preheader22.lr.ph:                               ; preds = %.preheader23
  %170 = icmp sgt i32 %0, 0
  br i1 %170, label %.preheader22.us.preheader, label %._crit_edge33

.preheader22.us.preheader:                        ; preds = %.preheader22.lr.ph
  %171 = sext i32 %0 to i64
  %wide.trip.count84 = zext i32 %1 to i64
  br label %.preheader22.us

.preheader22.us:                                  ; preds = %._crit_edge41.us, %.preheader22.us.preheader
  %indvars.iv82 = phi i64 [ 0, %.preheader22.us.preheader ], [ %indvars.iv.next83, %._crit_edge41.us ]
  br label %172

; <label>:172:                                    ; preds = %.preheader22.us, %172
  %indvars.iv80 = phi i64 [ %171, %.preheader22.us ], [ %indvars.iv.next81, %172 ]
  %.138.us = phi float [ 0.000000e+00, %.preheader22.us ], [ %.1237.us, %172 ]
  %.1237.us = phi float [ 0.000000e+00, %.preheader22.us ], [ %179, %172 ]
  %.0336.us = phi float [ 0.000000e+00, %.preheader22.us ], [ %.0435.us, %172 ]
  %.0435.us = phi float [ 0.000000e+00, %.preheader22.us ], [ %182, %172 ]
  %indvars.iv.next81 = add nsw i64 %indvars.iv80, -1
  %173 = fmul float %28, %.0435.us
  %174 = fmul float %.0336.us, %32
  %175 = fadd float %173, %174
  %176 = fmul float %exp2, %.1237.us
  %177 = fadd float %175, %176
  %178 = fmul float %.138.us, %34
  %179 = fadd float %177, %178
  %180 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv.next81, i64 %indvars.iv82
  store float %179, float* %180, align 4
  %181 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next81, i64 %indvars.iv82
  %182 = load float, float* %181, align 4
  %183 = icmp sgt i64 %indvars.iv80, 1
  br i1 %183, label %172, label %._crit_edge41.us

._crit_edge41.us:                                 ; preds = %172
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond85 = icmp eq i64 %indvars.iv.next83, %wide.trip.count84
  br i1 %exitcond85, label %.preheader21.loopexit, label %.preheader22.us

.preheader21.loopexit:                            ; preds = %._crit_edge41.us
  br label %.preheader21

.preheader21:                                     ; preds = %.preheader21.loopexit, %.preheader25, %.preheader23
  %184 = icmp sgt i32 %0, 0
  %185 = icmp sgt i32 %1, 0
  %or.cond = and i1 %184, %185
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge33

.preheader.us.preheader:                          ; preds = %.preheader21
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %186 = icmp eq i32 %1, 1
  %wide.trip.count78 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  %187 = add nsw i64 %wide.trip.count.1, -2
  %188 = add nsw i64 %wide.trip.count.1, -2
  br label %.preheader.us

.preheader.us:                                    ; preds = %.preheader.us.preheader, %._crit_edge.us
  %indvars.iv76 = phi i64 [ %indvars.iv.next77, %._crit_edge.us ], [ 0, %.preheader.us.preheader ]
  %scevgep173 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv76, i64 2
  %scevgep179 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv76, i64 2
  %scevgep185 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv76, i64 2
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  %189 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv76, i64 0
  %190 = load float, float* %189, align 4
  %191 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv76, i64 0
  %192 = load float, float* %191, align 4
  %193 = fadd float %190, %192
  %194 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv76, i64 0
  store float %193, float* %194, align 4
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.prol.preheader, %.preheader.us
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us ]
  br i1 %186, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  %195 = sub nsw i64 %187, %indvars.iv.unr.ph
  %196 = lshr i64 %195, 1
  %197 = add nuw i64 %196, 1
  %min.iters.check164 = icmp ult i64 %197, 4
  br i1 %min.iters.check164, label %.preheader.us.new.preheader214, label %min.iters.checked165

min.iters.checked165:                             ; preds = %.preheader.us.new.preheader
  %n.mod.vf166 = and i64 %197, 3
  %n.vec167 = sub i64 %197, %n.mod.vf166
  %cmp.zero168 = icmp eq i64 %n.vec167, 0
  br i1 %cmp.zero168, label %.preheader.us.new.preheader214, label %vector.memcheck196

vector.memcheck196:                               ; preds = %min.iters.checked165
  %scevgep171 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv76, i64 %indvars.iv.unr.ph
  %198 = sub nsw i64 %188, %indvars.iv.unr.ph
  %199 = and i64 %198, -2
  %200 = or i64 %indvars.iv.unr.ph, %199
  %scevgep174 = getelementptr float, float* %scevgep173, i64 %200
  %scevgep177 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv76, i64 %indvars.iv.unr.ph
  %scevgep180 = getelementptr float, float* %scevgep179, i64 %200
  %scevgep183 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv76, i64 %indvars.iv.unr.ph
  %scevgep186 = getelementptr float, float* %scevgep185, i64 %200
  %bound0188 = icmp ult float* %scevgep171, %scevgep180
  %bound1189 = icmp ult float* %scevgep177, %scevgep174
  %found.conflict190 = and i1 %bound0188, %bound1189
  %bound0191 = icmp ult float* %scevgep171, %scevgep186
  %bound1192 = icmp ult float* %scevgep183, %scevgep174
  %found.conflict193 = and i1 %bound0191, %bound1192
  %conflict.rdx194 = or i1 %found.conflict190, %found.conflict193
  %201 = or i64 %indvars.iv.unr.ph, 2
  %202 = shl nuw i64 %196, 1
  %203 = add i64 %201, %202
  %204 = shl nuw nsw i64 %n.mod.vf166, 1
  %ind.end201 = sub i64 %203, %204
  br i1 %conflict.rdx194, label %.preheader.us.new.preheader214, label %vector.body161.preheader

vector.body161.preheader:                         ; preds = %vector.memcheck196
  br label %vector.body161

vector.body161:                                   ; preds = %vector.body161.preheader, %vector.body161
  %index198 = phi i64 [ %index.next199, %vector.body161 ], [ 0, %vector.body161.preheader ]
  %205 = shl i64 %index198, 1
  %offset.idx203 = or i64 %indvars.iv.unr.ph, %205
  %206 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv76, i64 %offset.idx203
  %207 = bitcast float* %206 to <8 x float>*
  %wide.vec207 = load <8 x float>, <8 x float>* %207, align 4, !alias.scope !16
  %208 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv76, i64 %offset.idx203
  %209 = bitcast float* %208 to <8 x float>*
  %wide.vec210 = load <8 x float>, <8 x float>* %209, align 4, !alias.scope !19
  %210 = fadd <8 x float> %wide.vec207, %wide.vec210
  %211 = shufflevector <8 x float> %210, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %212 = add nuw nsw i64 %offset.idx203, 1
  %213 = fadd <8 x float> %wide.vec207, %wide.vec210
  %214 = shufflevector <8 x float> %213, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %215 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv76, i64 %212
  %216 = getelementptr float, float* %215, i64 -1
  %217 = bitcast float* %216 to <8 x float>*
  %interleaved.vec213 = shufflevector <4 x float> %211, <4 x float> %214, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec213, <8 x float>* %217, align 4, !alias.scope !21, !noalias !23
  %index.next199 = add i64 %index198, 4
  %218 = icmp eq i64 %index.next199, %n.vec167
  br i1 %218, label %middle.block162, label %vector.body161, !llvm.loop !24

middle.block162:                                  ; preds = %vector.body161
  %cmp.n202 = icmp eq i64 %n.mod.vf166, 0
  br i1 %cmp.n202, label %._crit_edge.us, label %.preheader.us.new.preheader214

.preheader.us.new.preheader214:                   ; preds = %middle.block162, %vector.memcheck196, %min.iters.checked165, %.preheader.us.new.preheader
  %indvars.iv.ph = phi i64 [ %indvars.iv.unr.ph, %vector.memcheck196 ], [ %indvars.iv.unr.ph, %min.iters.checked165 ], [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ], [ %ind.end201, %middle.block162 ]
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader214, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new ], [ %indvars.iv.ph, %.preheader.us.new.preheader214 ]
  %219 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv76, i64 %indvars.iv
  %220 = load float, float* %219, align 4
  %221 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv76, i64 %indvars.iv
  %222 = load float, float* %221, align 4
  %223 = fadd float %220, %222
  %224 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv76, i64 %indvars.iv
  store float %223, float* %224, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %225 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv76, i64 %indvars.iv.next
  %226 = load float, float* %225, align 4
  %227 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv76, i64 %indvars.iv.next
  %228 = load float, float* %227, align 4
  %229 = fadd float %226, %228
  %230 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv76, i64 %indvars.iv.next
  store float %229, float* %230, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader.us.new, !llvm.loop !25

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block162, %.prol.loopexit
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %exitcond = icmp eq i64 %indvars.iv.next77, %wide.trip.count78
  br i1 %exitcond, label %._crit_edge33.loopexit, label %.preheader.us

._crit_edge33.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge33

._crit_edge33:                                    ; preds = %._crit_edge33.loopexit, %.preheader28.lr.ph, %.preheader30.lr.ph, %.preheader26.lr.ph, %.preheader24.lr.ph, %.preheader22.lr.ph, %.preheader21
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
  %8 = icmp sgt i32 %0, 0
  %9 = icmp sgt i32 %1, 0
  %or.cond = and i1 %8, %9
  br i1 %or.cond, label %.preheader.us.preheader, label %._crit_edge4

.preheader.us.preheader:                          ; preds = %3
  %10 = sext i32 %1 to i64
  %wide.trip.count = zext i32 %1 to i64
  %wide.trip.count8 = zext i32 %0 to i64
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv6 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next7, %._crit_edge.us ]
  %11 = mul nsw i64 %indvars.iv6, %10
  br label %12

; <label>:12:                                     ; preds = %19, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %19 ]
  %13 = add nsw i64 %indvars.iv, %11
  %14 = trunc i64 %13 to i32
  %15 = srem i32 %14, 20
  %16 = icmp eq i32 %15, 0
  br i1 %16, label %17, label %19

; <label>:17:                                     ; preds = %12
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %18) #6
  br label %19

; <label>:19:                                     ; preds = %17, %12
  %20 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %21 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv6, i64 %indvars.iv
  %22 = load float, float* %21, align 4
  %23 = fpext float %22 to double
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %20, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %23) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %12

._crit_edge.us:                                   ; preds = %19
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, %wide.trip.count8
  br i1 %exitcond9, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %3
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %25, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #6
  %27 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %28 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %27) #6
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
