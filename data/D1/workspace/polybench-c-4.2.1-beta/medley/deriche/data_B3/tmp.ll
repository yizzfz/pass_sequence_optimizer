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
  tail call void (...) @polybench_timer_start() #5
  %10 = load float, float* %3, align 4
  %11 = bitcast i8* %6 to [2160 x float]*
  %12 = bitcast i8* %7 to [2160 x float]*
  tail call fastcc void @kernel_deriche(i32 4096, i32 2160, float %10, [2160 x float]* %8, [2160 x float]* %9, [2160 x float]* %11, [2160 x float]* %12)
  tail call void (...) @polybench_timer_stop() #5
  tail call void (...) @polybench_timer_print() #5
  %13 = icmp sgt i32 %0, 42
  br i1 %13, label %14, label %._crit_edge

; <label>:14:                                     ; preds = %2
  %15 = load i8*, i8** %1, align 8
  %strcmpload = load i8, i8* %15, align 1
  %16 = icmp eq i8 %strcmpload, 0
  br i1 %16, label %17, label %._crit_edge

; <label>:17:                                     ; preds = %14
  tail call fastcc void @print_array(i32 4096, i32 2160, [2160 x float]* %9)
  br label %._crit_edge

._crit_edge:                                      ; preds = %14, %2, %17
  tail call void @free(i8* %4) #5
  tail call void @free(i8* %5) #5
  tail call void @free(i8* %6) #5
  tail call void @free(i8* %7) #5
  ret i32 0
}

declare i8* @polybench_alloc_data(i64, i32) local_unnamed_addr #1

; Function Attrs: noinline norecurse nounwind uwtable
define internal fastcc void @init_array(i32, i32, float* nocapture, [2160 x float]* nocapture) unnamed_addr #2 {
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

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv6 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next7, %._crit_edge.us ]
  %8 = mul nuw nsw i64 %indvars.iv6, 313
  br i1 %min.iters.check, label %scalar.ph.preheader, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader.us
  br i1 %cmp.zero, label %scalar.ph.preheader, label %vector.ph

vector.ph:                                        ; preds = %min.iters.checked
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %8, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body.vector.body_crit_edge, %vector.ph
  %index = phi i64 [ 0, %vector.ph ], [ %index.next, %vector.body.vector.body_crit_edge ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %vector.ph ], [ %vec.ind.next, %vector.body.vector.body_crit_edge ]
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
  %17 = icmp eq i64 %index.next, %n.vec
  br i1 %17, label %middle.block, label %vector.body.vector.body_crit_edge, !llvm.loop !1

vector.body.vector.body_crit_edge:                ; preds = %vector.body
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  br label %vector.body

middle.block:                                     ; preds = %vector.body
  br i1 %cmp.n, label %._crit_edge.us, label %scalar.ph.preheader

scalar.ph.preheader:                              ; preds = %middle.block, %min.iters.checked, %.preheader.us
  %indvars.iv.ph = phi i64 [ %n.vec, %middle.block ], [ 0, %min.iters.checked ], [ 0, %.preheader.us ]
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

.preheader30.us:                                  ; preds = %._crit_edge68.us, %.preheader30.us.preheader
  %indvars.iv128 = phi i64 [ 0, %.preheader30.us.preheader ], [ %indvars.iv.next129, %._crit_edge68.us ]
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

.prol.loopexit125:                                ; preds = %.preheader30.us, %.prol.preheader124
  %indvars.iv120.unr.ph = phi i64 [ 1, %.prol.preheader124 ], [ 0, %.preheader30.us ]
  %.01764.us.unr.ph = phi float [ %48, %.prol.preheader124 ], [ 0.000000e+00, %.preheader30.us ]
  %.01963.us.unr.ph = phi float [ %46, %.prol.preheader124 ], [ 0.000000e+00, %.preheader30.us ]
  br i1 %37, label %._crit_edge68.us, label %.preheader30.us.new.preheader

.preheader30.us.new.preheader:                    ; preds = %.prol.loopexit125
  br label %.preheader30.us.new

.preheader30.us.new:                              ; preds = %.preheader30.us.new.preheader, %.preheader30.us.new..preheader30.us.new_crit_edge
  %indvars.iv120 = phi i64 [ %indvars.iv.next121.1, %.preheader30.us.new..preheader30.us.new_crit_edge ], [ %indvars.iv120.unr.ph, %.preheader30.us.new.preheader ]
  %.0766.us = phi float [ %57, %.preheader30.us.new..preheader30.us.new_crit_edge ], [ 0.000000e+00, %.preheader30.us.new.preheader ]
  %.01764.us = phi float [ %70, %.preheader30.us.new..preheader30.us.new_crit_edge ], [ %.01764.us.unr.ph, %.preheader30.us.new.preheader ]
  %.01963.us = phi float [ %68, %.preheader30.us.new..preheader30.us.new_crit_edge ], [ %.01963.us.unr.ph, %.preheader30.us.new.preheader ]
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
  %indvars.iv.next121.1 = add nsw i64 %indvars.iv120, 2
  %exitcond123.1 = icmp eq i64 %indvars.iv.next121.1, %wide.trip.count122.1
  br i1 %exitcond123.1, label %._crit_edge68.us.loopexit, label %.preheader30.us.new..preheader30.us.new_crit_edge

.preheader30.us.new..preheader30.us.new_crit_edge: ; preds = %.preheader30.us.new
  %70 = load float, float* %60, align 4
  br label %.preheader30.us.new

._crit_edge68.us.loopexit:                        ; preds = %.preheader30.us.new
  br label %._crit_edge68.us

._crit_edge68.us:                                 ; preds = %._crit_edge68.us.loopexit, %.prol.loopexit125
  %indvars.iv.next129 = add nuw nsw i64 %indvars.iv128, 1
  %exitcond131 = icmp eq i64 %indvars.iv.next129, %wide.trip.count130
  br i1 %exitcond131, label %.preheader28.us.preheader, label %.preheader30.us

.preheader28.us.preheader:                        ; preds = %._crit_edge68.us
  %71 = sext i32 %1 to i64
  br label %.preheader28.us

.preheader28.us:                                  ; preds = %._crit_edge61.us, %.preheader28.us.preheader
  %indvars.iv115 = phi i64 [ 0, %.preheader28.us.preheader ], [ %indvars.iv.next116, %._crit_edge61.us ]
  br label %72

; <label>:72:                                     ; preds = %._crit_edge, %.preheader28.us
  %indvars.iv113 = phi i64 [ %71, %.preheader28.us ], [ %indvars.iv.next114, %._crit_edge ]
  %.058.us = phi float [ 0.000000e+00, %.preheader28.us ], [ %.0157.us, %._crit_edge ]
  %.0157.us = phi float [ 0.000000e+00, %.preheader28.us ], [ %79, %._crit_edge ]
  %.0556.us = phi float [ 0.000000e+00, %.preheader28.us ], [ %.0655.us, %._crit_edge ]
  %.0655.us = phi float [ 0.000000e+00, %.preheader28.us ], [ %83, %._crit_edge ]
  %indvars.iv.next114 = add nsw i64 %indvars.iv113, -1
  %73 = fmul float %28, %.0655.us
  %74 = fmul float %.0556.us, %32
  %75 = fadd float %73, %74
  %76 = fmul float %exp2, %.0157.us
  %77 = fadd float %75, %76
  %78 = fmul float %.058.us, %34
  %79 = fadd float %77, %78
  %80 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv115, i64 %indvars.iv.next114
  store float %79, float* %80, align 4
  %81 = icmp sgt i64 %indvars.iv113, 1
  br i1 %81, label %._crit_edge, label %._crit_edge61.us

._crit_edge:                                      ; preds = %72
  %82 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv115, i64 %indvars.iv.next114
  %83 = load float, float* %82, align 4
  br label %72

._crit_edge61.us:                                 ; preds = %72
  %indvars.iv.next116 = add nuw nsw i64 %indvars.iv115, 1
  %exitcond118 = icmp eq i64 %indvars.iv.next116, %wide.trip.count130
  br i1 %exitcond118, label %.preheader26.us.preheader, label %.preheader28.us

.preheader26.us.preheader:                        ; preds = %._crit_edge61.us
  %84 = add nsw i64 %wide.trip.count122.1, -2
  %85 = add nsw i64 %wide.trip.count122.1, -2
  br label %.preheader26.us

.preheader26.us:                                  ; preds = %._crit_edge52.us, %.preheader26.us.preheader
  %indvars.iv108 = phi i64 [ 0, %.preheader26.us.preheader ], [ %indvars.iv.next109, %._crit_edge52.us ]
  %scevgep142 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv108, i64 2
  %scevgep148 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv108, i64 2
  %scevgep154 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv108, i64 2
  br i1 %lcmp.mod127, label %.prol.loopexit105, label %.prol.preheader104

.prol.preheader104:                               ; preds = %.preheader26.us
  %86 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv108, i64 0
  %87 = load float, float* %86, align 4
  %88 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv108, i64 0
  %89 = load float, float* %88, align 4
  %90 = fadd float %87, %89
  %91 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv108, i64 0
  store float %90, float* %91, align 4
  br label %.prol.loopexit105

.prol.loopexit105:                                ; preds = %.preheader26.us, %.prol.preheader104
  %indvars.iv100.unr.ph = phi i64 [ 1, %.prol.preheader104 ], [ 0, %.preheader26.us ]
  br i1 %37, label %._crit_edge52.us, label %.preheader26.us.new.preheader

.preheader26.us.new.preheader:                    ; preds = %.prol.loopexit105
  %92 = sub nsw i64 %84, %indvars.iv100.unr.ph
  %93 = lshr i64 %92, 1
  %94 = add nuw i64 %93, 1
  %min.iters.check = icmp ult i64 %94, 4
  br i1 %min.iters.check, label %.preheader26.us.new.preheader219, label %min.iters.checked

min.iters.checked:                                ; preds = %.preheader26.us.new.preheader
  %n.mod.vf = and i64 %94, 3
  %n.vec = sub i64 %94, %n.mod.vf
  %cmp.zero = icmp eq i64 %n.vec, 0
  br i1 %cmp.zero, label %.preheader26.us.new.preheader219, label %vector.memcheck

vector.memcheck:                                  ; preds = %min.iters.checked
  %scevgep140 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv108, i64 %indvars.iv100.unr.ph
  %95 = sub nsw i64 %85, %indvars.iv100.unr.ph
  %96 = and i64 %95, -2
  %97 = or i64 %indvars.iv100.unr.ph, %96
  %scevgep143 = getelementptr float, float* %scevgep142, i64 %97
  %scevgep146 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv108, i64 %indvars.iv100.unr.ph
  %scevgep149 = getelementptr float, float* %scevgep148, i64 %97
  %scevgep152 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv108, i64 %indvars.iv100.unr.ph
  %scevgep155 = getelementptr float, float* %scevgep154, i64 %97
  %bound0 = icmp ult float* %scevgep140, %scevgep149
  %bound1 = icmp ult float* %scevgep146, %scevgep143
  %found.conflict = and i1 %bound0, %bound1
  %bound0157 = icmp ult float* %scevgep140, %scevgep155
  %bound1158 = icmp ult float* %scevgep152, %scevgep143
  %found.conflict159 = and i1 %bound0157, %bound1158
  %conflict.rdx = or i1 %found.conflict, %found.conflict159
  %98 = or i64 %indvars.iv100.unr.ph, 2
  %99 = shl nuw i64 %93, 1
  %100 = add i64 %98, %99
  %101 = shl nuw nsw i64 %n.mod.vf, 1
  %ind.end = sub i64 %100, %101
  br i1 %conflict.rdx, label %.preheader26.us.new.preheader219, label %vector.body.preheader

vector.body.preheader:                            ; preds = %vector.memcheck
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %102 = shl i64 %index, 1
  %offset.idx = or i64 %indvars.iv100.unr.ph, %102
  %103 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv108, i64 %offset.idx
  %104 = bitcast float* %103 to <8 x float>*
  %wide.vec = load <8 x float>, <8 x float>* %104, align 4, !alias.scope !6
  %105 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv108, i64 %offset.idx
  %106 = bitcast float* %105 to <8 x float>*
  %wide.vec161 = load <8 x float>, <8 x float>* %106, align 4, !alias.scope !9
  %107 = fadd <8 x float> %wide.vec, %wide.vec161
  %108 = shufflevector <8 x float> %107, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %109 = add nuw nsw i64 %offset.idx, 1
  %110 = fadd <8 x float> %wide.vec, %wide.vec161
  %111 = shufflevector <8 x float> %110, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %112 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv108, i64 %109
  %113 = getelementptr float, float* %112, i64 -1
  %114 = bitcast float* %113 to <8 x float>*
  %interleaved.vec = shufflevector <4 x float> %108, <4 x float> %111, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec, <8 x float>* %114, align 4, !alias.scope !11, !noalias !13
  %index.next = add i64 %index, 4
  %115 = icmp eq i64 %index.next, %n.vec
  br i1 %115, label %middle.block, label %vector.body, !llvm.loop !14

middle.block:                                     ; preds = %vector.body
  %cmp.n = icmp eq i64 %n.mod.vf, 0
  br i1 %cmp.n, label %._crit_edge52.us, label %.preheader26.us.new.preheader219

.preheader26.us.new.preheader219:                 ; preds = %middle.block, %vector.memcheck, %min.iters.checked, %.preheader26.us.new.preheader
  %indvars.iv100.ph = phi i64 [ %ind.end, %middle.block ], [ %indvars.iv100.unr.ph, %vector.memcheck ], [ %indvars.iv100.unr.ph, %min.iters.checked ], [ %indvars.iv100.unr.ph, %.preheader26.us.new.preheader ]
  br label %.preheader26.us.new

.preheader26.us.new:                              ; preds = %.preheader26.us.new.preheader219, %.preheader26.us.new
  %indvars.iv100 = phi i64 [ %indvars.iv.next101.1, %.preheader26.us.new ], [ %indvars.iv100.ph, %.preheader26.us.new.preheader219 ]
  %116 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv108, i64 %indvars.iv100
  %117 = load float, float* %116, align 4
  %118 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv108, i64 %indvars.iv100
  %119 = load float, float* %118, align 4
  %120 = fadd float %117, %119
  %121 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv108, i64 %indvars.iv100
  store float %120, float* %121, align 4
  %indvars.iv.next101 = add nuw nsw i64 %indvars.iv100, 1
  %122 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv108, i64 %indvars.iv.next101
  %123 = load float, float* %122, align 4
  %124 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv108, i64 %indvars.iv.next101
  %125 = load float, float* %124, align 4
  %126 = fadd float %123, %125
  %127 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv108, i64 %indvars.iv.next101
  store float %126, float* %127, align 4
  %indvars.iv.next101.1 = add nsw i64 %indvars.iv100, 2
  %exitcond103.1 = icmp eq i64 %indvars.iv.next101.1, %wide.trip.count122.1
  br i1 %exitcond103.1, label %._crit_edge52.us.loopexit, label %.preheader26.us.new, !llvm.loop !15

._crit_edge52.us.loopexit:                        ; preds = %.preheader26.us.new
  br label %._crit_edge52.us

._crit_edge52.us:                                 ; preds = %._crit_edge52.us.loopexit, %middle.block, %.prol.loopexit105
  %indvars.iv.next109 = add nuw nsw i64 %indvars.iv108, 1
  %exitcond111 = icmp eq i64 %indvars.iv.next109, %wide.trip.count130
  br i1 %exitcond111, label %.preheader25.loopexit, label %.preheader26.us

.preheader25.loopexit:                            ; preds = %._crit_edge52.us
  br label %.preheader25

.preheader25:                                     ; preds = %.preheader25.loopexit, %7
  %128 = icmp sgt i32 %1, 0
  br i1 %128, label %.preheader24.lr.ph, label %.preheader21

.preheader24.lr.ph:                               ; preds = %.preheader25
  br i1 %35, label %.preheader24.us.preheader, label %._crit_edge33

.preheader24.us.preheader:                        ; preds = %.preheader24.lr.ph
  %xtraiter93 = and i32 %0, 1
  %lcmp.mod94 = icmp eq i32 %xtraiter93, 0
  %129 = icmp eq i32 %0, 1
  %wide.trip.count97 = zext i32 %1 to i64
  %wide.trip.count89.1 = zext i32 %0 to i64
  %130 = fmul float %24, 0.000000e+00
  %131 = fmul float %exp2, 0.000000e+00
  %132 = fmul float %33, -0.000000e+00
  br label %.preheader24.us

.preheader24.us:                                  ; preds = %._crit_edge48.us, %.preheader24.us.preheader
  %indvars.iv95 = phi i64 [ 0, %.preheader24.us.preheader ], [ %indvars.iv.next96, %._crit_edge48.us ]
  br i1 %lcmp.mod94, label %.prol.loopexit92, label %.prol.preheader91

.prol.preheader91:                                ; preds = %.preheader24.us
  %133 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 0, i64 %indvars.iv95
  %134 = load float, float* %133, align 4
  %135 = fmul float %20, %134
  %136 = fadd float %130, %135
  %137 = fadd float %131, %136
  %138 = fadd float %132, %137
  %139 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 0, i64 %indvars.iv95
  store float %138, float* %139, align 4
  %140 = load float, float* %133, align 4
  br label %.prol.loopexit92

.prol.loopexit92:                                 ; preds = %.preheader24.us, %.prol.preheader91
  %indvars.iv87.unr.ph = phi i64 [ 1, %.prol.preheader91 ], [ 0, %.preheader24.us ]
  %.01844.us.unr.ph = phi float [ %140, %.prol.preheader91 ], [ 0.000000e+00, %.preheader24.us ]
  %.12043.us.unr.ph = phi float [ %138, %.prol.preheader91 ], [ 0.000000e+00, %.preheader24.us ]
  br i1 %129, label %._crit_edge48.us, label %.preheader24.us.new.preheader

.preheader24.us.new.preheader:                    ; preds = %.prol.loopexit92
  br label %.preheader24.us.new

.preheader24.us.new:                              ; preds = %.preheader24.us.new.preheader, %.preheader24.us.new..preheader24.us.new_crit_edge
  %indvars.iv87 = phi i64 [ %indvars.iv.next88.1, %.preheader24.us.new..preheader24.us.new_crit_edge ], [ %indvars.iv87.unr.ph, %.preheader24.us.new.preheader ]
  %.1846.us = phi float [ %149, %.preheader24.us.new..preheader24.us.new_crit_edge ], [ 0.000000e+00, %.preheader24.us.new.preheader ]
  %.01844.us = phi float [ %162, %.preheader24.us.new..preheader24.us.new_crit_edge ], [ %.01844.us.unr.ph, %.preheader24.us.new.preheader ]
  %.12043.us = phi float [ %160, %.preheader24.us.new..preheader24.us.new_crit_edge ], [ %.12043.us.unr.ph, %.preheader24.us.new.preheader ]
  %141 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv87, i64 %indvars.iv95
  %142 = load float, float* %141, align 4
  %143 = fmul float %20, %142
  %144 = fmul float %24, %.01844.us
  %145 = fadd float %144, %143
  %146 = fmul float %exp2, %.12043.us
  %147 = fadd float %146, %145
  %148 = fmul float %.1846.us, %34
  %149 = fadd float %148, %147
  %150 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv87, i64 %indvars.iv95
  store float %149, float* %150, align 4
  %151 = load float, float* %141, align 4
  %indvars.iv.next88 = add nuw nsw i64 %indvars.iv87, 1
  %152 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next88, i64 %indvars.iv95
  %153 = load float, float* %152, align 4
  %154 = fmul float %20, %153
  %155 = fmul float %24, %151
  %156 = fadd float %155, %154
  %157 = fmul float %exp2, %149
  %158 = fadd float %157, %156
  %159 = fmul float %.12043.us, %34
  %160 = fadd float %159, %158
  %161 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv.next88, i64 %indvars.iv95
  store float %160, float* %161, align 4
  %indvars.iv.next88.1 = add nsw i64 %indvars.iv87, 2
  %exitcond90.1 = icmp eq i64 %indvars.iv.next88.1, %wide.trip.count89.1
  br i1 %exitcond90.1, label %._crit_edge48.us.loopexit, label %.preheader24.us.new..preheader24.us.new_crit_edge

.preheader24.us.new..preheader24.us.new_crit_edge: ; preds = %.preheader24.us.new
  %162 = load float, float* %152, align 4
  br label %.preheader24.us.new

._crit_edge48.us.loopexit:                        ; preds = %.preheader24.us.new
  br label %._crit_edge48.us

._crit_edge48.us:                                 ; preds = %._crit_edge48.us.loopexit, %.prol.loopexit92
  %indvars.iv.next96 = add nuw nsw i64 %indvars.iv95, 1
  %exitcond98 = icmp eq i64 %indvars.iv.next96, %wide.trip.count97
  br i1 %exitcond98, label %.preheader22.us.preheader, label %.preheader24.us

.preheader22.us.preheader:                        ; preds = %._crit_edge48.us
  %163 = sext i32 %0 to i64
  br label %.preheader22.us

.preheader22.us:                                  ; preds = %._crit_edge41.us, %.preheader22.us.preheader
  %indvars.iv82 = phi i64 [ 0, %.preheader22.us.preheader ], [ %indvars.iv.next83, %._crit_edge41.us ]
  br label %164

; <label>:164:                                    ; preds = %._crit_edge217, %.preheader22.us
  %indvars.iv80 = phi i64 [ %163, %.preheader22.us ], [ %indvars.iv.next81, %._crit_edge217 ]
  %.138.us = phi float [ 0.000000e+00, %.preheader22.us ], [ %.1237.us, %._crit_edge217 ]
  %.1237.us = phi float [ 0.000000e+00, %.preheader22.us ], [ %171, %._crit_edge217 ]
  %.0336.us = phi float [ 0.000000e+00, %.preheader22.us ], [ %.0435.us, %._crit_edge217 ]
  %.0435.us = phi float [ 0.000000e+00, %.preheader22.us ], [ %175, %._crit_edge217 ]
  %indvars.iv.next81 = add nsw i64 %indvars.iv80, -1
  %165 = fmul float %28, %.0435.us
  %166 = fmul float %.0336.us, %32
  %167 = fadd float %165, %166
  %168 = fmul float %exp2, %.1237.us
  %169 = fadd float %167, %168
  %170 = fmul float %.138.us, %34
  %171 = fadd float %169, %170
  %172 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv.next81, i64 %indvars.iv82
  store float %171, float* %172, align 4
  %173 = icmp sgt i64 %indvars.iv80, 1
  br i1 %173, label %._crit_edge217, label %._crit_edge41.us

._crit_edge217:                                   ; preds = %164
  %174 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next81, i64 %indvars.iv82
  %175 = load float, float* %174, align 4
  br label %164

._crit_edge41.us:                                 ; preds = %164
  %indvars.iv.next83 = add nuw nsw i64 %indvars.iv82, 1
  %exitcond85 = icmp eq i64 %indvars.iv.next83, %wide.trip.count97
  br i1 %exitcond85, label %.preheader21.loopexit, label %.preheader22.us

.preheader21.loopexit:                            ; preds = %._crit_edge41.us
  br label %.preheader21

.preheader21:                                     ; preds = %.preheader21.loopexit, %.preheader25
  %176 = phi i1 [ true, %.preheader25 ], [ false, %.preheader21.loopexit ]
  %.not = xor i1 %35, true
  %brmerge = or i1 %176, %.not
  br i1 %brmerge, label %._crit_edge33, label %.preheader.us.preheader

.preheader.us.preheader:                          ; preds = %.preheader21
  %xtraiter = and i32 %1, 1
  %lcmp.mod = icmp eq i32 %xtraiter, 0
  %177 = icmp eq i32 %1, 1
  %wide.trip.count78 = zext i32 %0 to i64
  %wide.trip.count.1 = zext i32 %1 to i64
  %178 = add nsw i64 %wide.trip.count.1, -2
  %179 = add nsw i64 %wide.trip.count.1, -2
  br label %.preheader.us

.preheader.us:                                    ; preds = %._crit_edge.us, %.preheader.us.preheader
  %indvars.iv76 = phi i64 [ 0, %.preheader.us.preheader ], [ %indvars.iv.next77, %._crit_edge.us ]
  %scevgep176 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv76, i64 2
  %scevgep182 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv76, i64 2
  %scevgep188 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv76, i64 2
  br i1 %lcmp.mod, label %.prol.loopexit, label %.prol.preheader

.prol.preheader:                                  ; preds = %.preheader.us
  %180 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv76, i64 0
  %181 = load float, float* %180, align 4
  %182 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv76, i64 0
  %183 = load float, float* %182, align 4
  %184 = fadd float %181, %183
  %185 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv76, i64 0
  store float %184, float* %185, align 4
  br label %.prol.loopexit

.prol.loopexit:                                   ; preds = %.preheader.us, %.prol.preheader
  %indvars.iv.unr.ph = phi i64 [ 1, %.prol.preheader ], [ 0, %.preheader.us ]
  br i1 %177, label %._crit_edge.us, label %.preheader.us.new.preheader

.preheader.us.new.preheader:                      ; preds = %.prol.loopexit
  %186 = sub nsw i64 %178, %indvars.iv.unr.ph
  %187 = lshr i64 %186, 1
  %188 = add nuw i64 %187, 1
  %min.iters.check167 = icmp ult i64 %188, 4
  br i1 %min.iters.check167, label %.preheader.us.new.preheader218, label %min.iters.checked168

min.iters.checked168:                             ; preds = %.preheader.us.new.preheader
  %n.mod.vf169 = and i64 %188, 3
  %n.vec170 = sub i64 %188, %n.mod.vf169
  %cmp.zero171 = icmp eq i64 %n.vec170, 0
  br i1 %cmp.zero171, label %.preheader.us.new.preheader218, label %vector.memcheck199

vector.memcheck199:                               ; preds = %min.iters.checked168
  %scevgep174 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv76, i64 %indvars.iv.unr.ph
  %189 = sub nsw i64 %179, %indvars.iv.unr.ph
  %190 = and i64 %189, -2
  %191 = or i64 %indvars.iv.unr.ph, %190
  %scevgep177 = getelementptr float, float* %scevgep176, i64 %191
  %scevgep180 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv76, i64 %indvars.iv.unr.ph
  %scevgep183 = getelementptr float, float* %scevgep182, i64 %191
  %scevgep186 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv76, i64 %indvars.iv.unr.ph
  %scevgep189 = getelementptr float, float* %scevgep188, i64 %191
  %bound0191 = icmp ult float* %scevgep174, %scevgep183
  %bound1192 = icmp ult float* %scevgep180, %scevgep177
  %found.conflict193 = and i1 %bound0191, %bound1192
  %bound0194 = icmp ult float* %scevgep174, %scevgep189
  %bound1195 = icmp ult float* %scevgep186, %scevgep177
  %found.conflict196 = and i1 %bound0194, %bound1195
  %conflict.rdx197 = or i1 %found.conflict193, %found.conflict196
  %192 = or i64 %indvars.iv.unr.ph, 2
  %193 = shl nuw i64 %187, 1
  %194 = add i64 %192, %193
  %195 = shl nuw nsw i64 %n.mod.vf169, 1
  %ind.end204 = sub i64 %194, %195
  br i1 %conflict.rdx197, label %.preheader.us.new.preheader218, label %vector.body164.preheader

vector.body164.preheader:                         ; preds = %vector.memcheck199
  br label %vector.body164

vector.body164:                                   ; preds = %vector.body164.preheader, %vector.body164
  %index201 = phi i64 [ %index.next202, %vector.body164 ], [ 0, %vector.body164.preheader ]
  %196 = shl i64 %index201, 1
  %offset.idx206 = or i64 %indvars.iv.unr.ph, %196
  %197 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv76, i64 %offset.idx206
  %198 = bitcast float* %197 to <8 x float>*
  %wide.vec210 = load <8 x float>, <8 x float>* %198, align 4, !alias.scope !16
  %199 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv76, i64 %offset.idx206
  %200 = bitcast float* %199 to <8 x float>*
  %wide.vec213 = load <8 x float>, <8 x float>* %200, align 4, !alias.scope !19
  %201 = fadd <8 x float> %wide.vec210, %wide.vec213
  %202 = shufflevector <8 x float> %201, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %203 = add nuw nsw i64 %offset.idx206, 1
  %204 = fadd <8 x float> %wide.vec210, %wide.vec213
  %205 = shufflevector <8 x float> %204, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %206 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv76, i64 %203
  %207 = getelementptr float, float* %206, i64 -1
  %208 = bitcast float* %207 to <8 x float>*
  %interleaved.vec216 = shufflevector <4 x float> %202, <4 x float> %205, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec216, <8 x float>* %208, align 4, !alias.scope !21, !noalias !23
  %index.next202 = add i64 %index201, 4
  %209 = icmp eq i64 %index.next202, %n.vec170
  br i1 %209, label %middle.block165, label %vector.body164, !llvm.loop !24

middle.block165:                                  ; preds = %vector.body164
  %cmp.n205 = icmp eq i64 %n.mod.vf169, 0
  br i1 %cmp.n205, label %._crit_edge.us, label %.preheader.us.new.preheader218

.preheader.us.new.preheader218:                   ; preds = %middle.block165, %vector.memcheck199, %min.iters.checked168, %.preheader.us.new.preheader
  %indvars.iv.ph = phi i64 [ %ind.end204, %middle.block165 ], [ %indvars.iv.unr.ph, %vector.memcheck199 ], [ %indvars.iv.unr.ph, %min.iters.checked168 ], [ %indvars.iv.unr.ph, %.preheader.us.new.preheader ]
  br label %.preheader.us.new

.preheader.us.new:                                ; preds = %.preheader.us.new.preheader218, %.preheader.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.preheader.us.new ], [ %indvars.iv.ph, %.preheader.us.new.preheader218 ]
  %210 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv76, i64 %indvars.iv
  %211 = load float, float* %210, align 4
  %212 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv76, i64 %indvars.iv
  %213 = load float, float* %212, align 4
  %214 = fadd float %211, %213
  %215 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv76, i64 %indvars.iv
  store float %214, float* %215, align 4
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %216 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv76, i64 %indvars.iv.next
  %217 = load float, float* %216, align 4
  %218 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv76, i64 %indvars.iv.next
  %219 = load float, float* %218, align 4
  %220 = fadd float %217, %219
  %221 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv76, i64 %indvars.iv.next
  store float %220, float* %221, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, %wide.trip.count.1
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.preheader.us.new, !llvm.loop !25

._crit_edge.us.loopexit:                          ; preds = %.preheader.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block165, %.prol.loopexit
  %indvars.iv.next77 = add nuw nsw i64 %indvars.iv76, 1
  %exitcond = icmp eq i64 %indvars.iv.next77, %wide.trip.count78
  br i1 %exitcond, label %._crit_edge33.loopexit, label %.preheader.us

._crit_edge33.loopexit:                           ; preds = %._crit_edge.us
  br label %._crit_edge33

._crit_edge33:                                    ; preds = %._crit_edge33.loopexit, %.preheader21, %.preheader24.lr.ph, %.preheader30.lr.ph
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [2160 x float]* nocapture readonly) unnamed_addr #0 {
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
  br label %._crit_edge11

._crit_edge11:                                    ; preds = %._crit_edge, %.preheader.us
  %indvars.iv = phi i64 [ 0, %.preheader.us ], [ %indvars.iv.next, %._crit_edge ]
  %12 = add nsw i64 %indvars.iv, %11
  %13 = trunc i64 %12 to i32
  %14 = srem i32 %13, 20
  %15 = icmp eq i32 %14, 0
  br i1 %15, label %16, label %._crit_edge

; <label>:16:                                     ; preds = %._crit_edge11
  %17 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %17) #6
  br label %._crit_edge

._crit_edge:                                      ; preds = %._crit_edge11, %16
  %18 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %19 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv6, i64 %indvars.iv
  %20 = load float, float* %19, align 4
  %21 = fpext float %20 to double
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %18, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %21) #6
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, %wide.trip.count
  br i1 %exitcond, label %._crit_edge.us, label %._crit_edge11

._crit_edge.us:                                   ; preds = %._crit_edge
  %indvars.iv.next7 = add nuw nsw i64 %indvars.iv6, 1
  %exitcond9 = icmp eq i64 %indvars.iv.next7, %wide.trip.count8
  br i1 %exitcond9, label %._crit_edge4.loopexit, label %.preheader.us

._crit_edge4.loopexit:                            ; preds = %._crit_edge.us
  br label %._crit_edge4

._crit_edge4:                                     ; preds = %._crit_edge4.loopexit, %3
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %23, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #6
  %25 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %26 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %25) #6
  ret void
}

; Function Attrs: nounwind
declare void @free(i8* nocapture) local_unnamed_addr #3

; Function Attrs: nounwind
declare float @expf(float) local_unnamed_addr #3

; Function Attrs: nounwind
declare i32 @fprintf(%struct._IO_FILE* nocapture, i8* nocapture readonly, ...) local_unnamed_addr #3

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
