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
.lr.ph4.split.us.preheader:
  store float 2.500000e-01, float* %2, align 4
  br label %.lr.ph4.split.us

.lr.ph4.split.us:                                 ; preds = %.lr.ph4.split.us.preheader, %._crit_edge.us
  %indvars.iv12 = phi i64 [ %indvars.iv.next13, %._crit_edge.us ], [ 0, %.lr.ph4.split.us.preheader ]
  %4 = mul nuw nsw i64 %indvars.iv12, 313
  %broadcast.splatinsert = insertelement <4 x i64> undef, i64 %4, i32 0
  %broadcast.splat = shufflevector <4 x i64> %broadcast.splatinsert, <4 x i64> undef, <4 x i32> zeroinitializer
  br label %vector.body

vector.body:                                      ; preds = %vector.body, %.lr.ph4.split.us
  %index = phi i64 [ 0, %.lr.ph4.split.us ], [ %index.next, %vector.body ]
  %vec.ind = phi <4 x i64> [ <i64 0, i64 1, i64 2, i64 3>, %.lr.ph4.split.us ], [ %vec.ind.next, %vector.body ]
  %5 = mul nuw nsw <4 x i64> %vec.ind, <i64 991, i64 991, i64 991, i64 991>
  %6 = add nuw nsw <4 x i64> %broadcast.splat, %5
  %7 = trunc <4 x i64> %6 to <4 x i32>
  %8 = srem <4 x i32> %7, <i32 65536, i32 65536, i32 65536, i32 65536>
  %9 = sitofp <4 x i32> %8 to <4 x float>
  %10 = fdiv <4 x float> %9, <float 6.553500e+04, float 6.553500e+04, float 6.553500e+04, float 6.553500e+04>
  %11 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv12, i64 %index
  %12 = bitcast float* %11 to <4 x float>*
  store <4 x float> %10, <4 x float>* %12, align 4
  %index.next = add nuw nsw i64 %index, 4
  %vec.ind.next = add <4 x i64> %vec.ind, <i64 4, i64 4, i64 4, i64 4>
  %13 = icmp eq i64 %index.next, 2160
  br i1 %13, label %._crit_edge.us, label %vector.body, !llvm.loop !1

._crit_edge.us:                                   ; preds = %vector.body
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next13, 4096
  br i1 %exitcond15, label %._crit_edge5, label %.lr.ph4.split.us

._crit_edge5:                                     ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_start(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @kernel_deriche(i32, i32, float, [2160 x float]* nocapture readonly, [2160 x float]* nocapture, [2160 x float]* nocapture, [2160 x float]* nocapture) unnamed_addr #0 {
.lr.ph51:
  %7 = fsub float -0.000000e+00, %2
  %8 = tail call float @expf(float %7) #5
  %9 = fsub float 1.000000e+00, %8
  %10 = tail call float @expf(float %7) #5
  %11 = fsub float 1.000000e+00, %10
  %12 = fmul float %9, %11
  %13 = fmul float %2, 2.000000e+00
  %14 = tail call float @expf(float %7) #5
  %15 = fmul float %13, %14
  %16 = fadd float %15, 1.000000e+00
  %17 = tail call float @expf(float %13) #5
  %18 = fsub float %16, %17
  %19 = fdiv float %12, %18
  %20 = tail call float @expf(float %7) #5
  %21 = fmul float %19, %20
  %22 = tail call float @expf(float %7) #5
  %23 = fmul float %19, %22
  %24 = insertelement <2 x float> undef, float %2, i32 0
  %25 = shufflevector <2 x float> %24, <2 x float> undef, <2 x i32> zeroinitializer
  %26 = fadd <2 x float> %25, <float -1.000000e+00, float 1.000000e+00>
  %27 = insertelement <2 x float> undef, float %21, i32 0
  %28 = insertelement <2 x float> %27, float %23, i32 1
  %29 = fmul <2 x float> %26, %28
  %30 = extractelement <2 x float> %29, i32 0
  %31 = fmul float %2, -2.000000e+00
  %32 = tail call float @expf(float %31) #5
  %33 = fmul float %19, %32
  %exp2 = tail call float @llvm.exp2.f32(float %7)
  %34 = tail call float @expf(float %31) #5
  %35 = fsub float -0.000000e+00, %34
  %36 = insertelement <2 x float> undef, float %30, i32 0
  %37 = insertelement <2 x float> %36, float %19, i32 1
  br label %.lr.ph51.split.us

.lr.ph51.split.us:                                ; preds = %.lr.ph51, %._crit_edge49.us
  %indvars.iv106 = phi i64 [ %indvars.iv.next107, %._crit_edge49.us ], [ 0, %.lr.ph51 ]
  br label %38

; <label>:38:                                     ; preds = %38, %.lr.ph51.split.us
  %indvars.iv102 = phi i64 [ 0, %.lr.ph51.split.us ], [ %indvars.iv.next103.1, %38 ]
  %39 = phi float [ 0.000000e+00, %.lr.ph51.split.us ], [ %62, %38 ]
  %40 = phi float [ 0.000000e+00, %.lr.ph51.split.us ], [ %50, %38 ]
  %41 = phi float [ 0.000000e+00, %.lr.ph51.split.us ], [ %64, %38 ]
  %42 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv106, i64 %indvars.iv102
  %43 = load float, float* %42, align 4
  %44 = fmul float %19, %43
  %45 = fmul float %30, %41
  %46 = fadd float %44, %45
  %47 = fmul float %exp2, %39
  %48 = fadd float %46, %47
  %49 = fmul float %40, %35
  %50 = fadd float %48, %49
  %51 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv106, i64 %indvars.iv102
  store float %50, float* %51, align 4
  %52 = bitcast float* %42 to <2 x float>*
  %indvars.iv.next103 = or i64 %indvars.iv102, 1
  %53 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv106, i64 %indvars.iv.next103
  %54 = load <2 x float>, <2 x float>* %52, align 4
  %55 = fmul <2 x float> %37, %54
  %56 = extractelement <2 x float> %55, i32 0
  %57 = extractelement <2 x float> %55, i32 1
  %58 = fadd float %57, %56
  %59 = fmul float %exp2, %50
  %60 = fadd float %58, %59
  %61 = fmul float %39, %35
  %62 = fadd float %60, %61
  %63 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv106, i64 %indvars.iv.next103
  store float %62, float* %63, align 4
  %64 = load float, float* %53, align 4
  %indvars.iv.next103.1 = add nsw i64 %indvars.iv102, 2
  %exitcond105.1 = icmp eq i64 %indvars.iv.next103.1, 2160
  br i1 %exitcond105.1, label %._crit_edge49.us, label %38

._crit_edge49.us:                                 ; preds = %38
  %indvars.iv.next107 = add nuw nsw i64 %indvars.iv106, 1
  %exitcond109 = icmp eq i64 %indvars.iv.next107, 4096
  br i1 %exitcond109, label %.lr.ph44.split.us.preheader, label %.lr.ph51.split.us

.lr.ph44.split.us.preheader:                      ; preds = %._crit_edge49.us
  %65 = extractelement <2 x float> %29, i32 1
  %66 = fsub float -0.000000e+00, %33
  br label %.lr.ph44.split.us

.lr.ph44.split.us:                                ; preds = %.lr.ph44.split.us.preheader, %._crit_edge42.us
  %indvars.iv97 = phi i64 [ %indvars.iv.next98, %._crit_edge42.us ], [ 0, %.lr.ph44.split.us.preheader ]
  br label %67

; <label>:67:                                     ; preds = %67, %.lr.ph44.split.us
  %indvars.iv95 = phi i64 [ %indvars.iv.next96, %67 ], [ 2160, %.lr.ph44.split.us ]
  %68 = phi float [ %79, %67 ], [ 0.000000e+00, %.lr.ph44.split.us ]
  %69 = phi i32 [ %83, %67 ], [ 0, %.lr.ph44.split.us ]
  %70 = phi float [ %68, %67 ], [ 0.000000e+00, %.lr.ph44.split.us ]
  %71 = phi float [ %86, %67 ], [ 0.000000e+00, %.lr.ph44.split.us ]
  %72 = phi float [ %85, %67 ], [ 0.000000e+00, %.lr.ph44.split.us ]
  %indvars.iv.next96 = add nsw i64 %indvars.iv95, -1
  %73 = fmul float %65, %72
  %74 = fmul float %71, %66
  %75 = fadd float %73, %74
  %76 = fmul float %exp2, %68
  %77 = fadd float %75, %76
  %78 = fmul float %70, %35
  %79 = fadd float %77, %78
  %80 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv97, i64 %indvars.iv.next96
  store float %79, float* %80, align 4
  %81 = getelementptr inbounds [2160 x float], [2160 x float]* %3, i64 %indvars.iv97, i64 %indvars.iv.next96
  %82 = bitcast float* %81 to i32*
  %83 = load i32, i32* %82, align 4
  %84 = icmp sgt i64 %indvars.iv95, 1
  %85 = bitcast i32 %83 to float
  %86 = bitcast i32 %69 to float
  br i1 %84, label %67, label %._crit_edge42.us

._crit_edge42.us:                                 ; preds = %67
  %indvars.iv.next98 = add nuw nsw i64 %indvars.iv97, 1
  %exitcond100 = icmp eq i64 %indvars.iv.next98, 4096
  br i1 %exitcond100, label %.lr.ph36.split.us.preheader, label %.lr.ph44.split.us

.lr.ph36.split.us.preheader:                      ; preds = %._crit_edge42.us
  br label %.lr.ph36.split.us

.lr.ph36.split.us:                                ; preds = %.lr.ph36.split.us.preheader, %._crit_edge34.us
  %indvars.iv90 = phi i64 [ %indvars.iv.next91, %._crit_edge34.us ], [ 0, %.lr.ph36.split.us.preheader ]
  %scevgep114 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv90, i64 0
  %scevgep117 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv90, i64 2160
  %scevgep120 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv90, i64 0
  %scevgep123 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv90, i64 2160
  %scevgep126 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv90, i64 0
  %scevgep129 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv90, i64 2160
  %bound0 = icmp ult float* %scevgep114, %scevgep123
  %bound1 = icmp ult float* %scevgep120, %scevgep117
  %found.conflict = and i1 %bound0, %bound1
  %bound0131 = icmp ult float* %scevgep114, %scevgep129
  %bound1132 = icmp ult float* %scevgep126, %scevgep117
  %found.conflict133 = and i1 %bound0131, %bound1132
  %conflict.rdx = or i1 %found.conflict, %found.conflict133
  br i1 %conflict.rdx, label %.lr.ph36.split.us.new.preheader, label %vector.body.preheader

vector.body.preheader:                            ; preds = %.lr.ph36.split.us
  br label %vector.body

vector.body:                                      ; preds = %vector.body.preheader, %vector.body
  %index = phi i64 [ %index.next, %vector.body ], [ 0, %vector.body.preheader ]
  %87 = shl i64 %index, 1
  %88 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv90, i64 %87
  %89 = bitcast float* %88 to <8 x float>*
  %wide.vec = load <8 x float>, <8 x float>* %89, align 4, !alias.scope !4
  %90 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv90, i64 %87
  %91 = bitcast float* %90 to <8 x float>*
  %wide.vec135 = load <8 x float>, <8 x float>* %91, align 4, !alias.scope !7
  %92 = fadd <8 x float> %wide.vec, %wide.vec135
  %93 = shufflevector <8 x float> %92, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %94 = or i64 %87, 1
  %95 = fadd <8 x float> %wide.vec, %wide.vec135
  %96 = shufflevector <8 x float> %95, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %97 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv90, i64 %94
  %98 = getelementptr float, float* %97, i64 -1
  %99 = bitcast float* %98 to <8 x float>*
  %interleaved.vec = shufflevector <4 x float> %93, <4 x float> %96, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec, <8 x float>* %99, align 4, !alias.scope !9, !noalias !11
  %index.next = add nuw nsw i64 %index, 4
  %100 = icmp eq i64 %index.next, 1080
  br i1 %100, label %middle.block, label %vector.body, !llvm.loop !12

middle.block:                                     ; preds = %vector.body
  br label %._crit_edge34.us

.lr.ph36.split.us.new.preheader:                  ; preds = %.lr.ph36.split.us
  br label %.lr.ph36.split.us.new

.lr.ph36.split.us.new:                            ; preds = %.lr.ph36.split.us.new.preheader, %.lr.ph36.split.us.new
  %indvars.iv82 = phi i64 [ %indvars.iv.next83.1, %.lr.ph36.split.us.new ], [ 0, %.lr.ph36.split.us.new.preheader ]
  %101 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv90, i64 %indvars.iv82
  %102 = load float, float* %101, align 4
  %103 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv90, i64 %indvars.iv82
  %104 = load float, float* %103, align 4
  %105 = fadd float %102, %104
  %106 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv90, i64 %indvars.iv82
  store float %105, float* %106, align 4
  %indvars.iv.next83 = or i64 %indvars.iv82, 1
  %107 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv90, i64 %indvars.iv.next83
  %108 = load float, float* %107, align 4
  %109 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv90, i64 %indvars.iv.next83
  %110 = load float, float* %109, align 4
  %111 = fadd float %108, %110
  %112 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv90, i64 %indvars.iv.next83
  store float %111, float* %112, align 4
  %indvars.iv.next83.1 = add nsw i64 %indvars.iv82, 2
  %exitcond85.1 = icmp eq i64 %indvars.iv.next83.1, 2160
  br i1 %exitcond85.1, label %._crit_edge34.us.loopexit, label %.lr.ph36.split.us.new, !llvm.loop !13

._crit_edge34.us.loopexit:                        ; preds = %.lr.ph36.split.us.new
  br label %._crit_edge34.us

._crit_edge34.us:                                 ; preds = %._crit_edge34.us.loopexit, %middle.block
  %indvars.iv.next91 = add nuw nsw i64 %indvars.iv90, 1
  %exitcond93 = icmp eq i64 %indvars.iv.next91, 4096
  br i1 %exitcond93, label %.lr.ph29.split.us.preheader, label %.lr.ph36.split.us

.lr.ph29.split.us.preheader:                      ; preds = %._crit_edge34.us
  br label %.lr.ph29.split.us

.lr.ph29.split.us:                                ; preds = %.lr.ph29.split.us.preheader, %._crit_edge27.us
  %indvars.iv77 = phi i64 [ %indvars.iv.next78, %._crit_edge27.us ], [ 0, %.lr.ph29.split.us.preheader ]
  br label %113

; <label>:113:                                    ; preds = %113, %.lr.ph29.split.us
  %indvars.iv73 = phi i64 [ 0, %.lr.ph29.split.us ], [ %indvars.iv.next74.1, %113 ]
  %114 = phi float [ 0.000000e+00, %.lr.ph29.split.us ], [ %136, %113 ]
  %115 = phi float [ 0.000000e+00, %.lr.ph29.split.us ], [ %125, %113 ]
  %116 = phi float [ 0.000000e+00, %.lr.ph29.split.us ], [ %138, %113 ]
  %117 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv73, i64 %indvars.iv77
  %118 = load float, float* %117, align 4
  %119 = fmul float %19, %118
  %120 = fmul float %30, %116
  %121 = fadd float %119, %120
  %122 = fmul float %exp2, %114
  %123 = fadd float %121, %122
  %124 = fmul float %115, %35
  %125 = fadd float %123, %124
  %126 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv73, i64 %indvars.iv77
  store float %125, float* %126, align 4
  %127 = load float, float* %117, align 4
  %indvars.iv.next74 = or i64 %indvars.iv73, 1
  %128 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next74, i64 %indvars.iv77
  %129 = load float, float* %128, align 4
  %130 = fmul float %19, %129
  %131 = fmul float %30, %127
  %132 = fadd float %130, %131
  %133 = fmul float %exp2, %125
  %134 = fadd float %132, %133
  %135 = fmul float %114, %35
  %136 = fadd float %134, %135
  %137 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv.next74, i64 %indvars.iv77
  store float %136, float* %137, align 4
  %138 = load float, float* %128, align 4
  %indvars.iv.next74.1 = add nsw i64 %indvars.iv73, 2
  %exitcond76.1 = icmp eq i64 %indvars.iv.next74.1, 4096
  br i1 %exitcond76.1, label %._crit_edge27.us, label %113

._crit_edge27.us:                                 ; preds = %113
  %indvars.iv.next78 = add nuw nsw i64 %indvars.iv77, 1
  %exitcond80 = icmp eq i64 %indvars.iv.next78, 2160
  br i1 %exitcond80, label %.lr.ph22.split.us.preheader, label %.lr.ph29.split.us

.lr.ph22.split.us.preheader:                      ; preds = %._crit_edge27.us
  br label %.lr.ph22.split.us

.lr.ph22.split.us:                                ; preds = %.lr.ph22.split.us.preheader, %._crit_edge20.us
  %indvars.iv68 = phi i64 [ %indvars.iv.next69, %._crit_edge20.us ], [ 0, %.lr.ph22.split.us.preheader ]
  br label %139

; <label>:139:                                    ; preds = %139, %.lr.ph22.split.us
  %indvars.iv66 = phi i64 [ %indvars.iv.next67, %139 ], [ 4096, %.lr.ph22.split.us ]
  %140 = phi float [ %151, %139 ], [ 0.000000e+00, %.lr.ph22.split.us ]
  %141 = phi i32 [ %155, %139 ], [ 0, %.lr.ph22.split.us ]
  %142 = phi float [ %140, %139 ], [ 0.000000e+00, %.lr.ph22.split.us ]
  %143 = phi float [ %158, %139 ], [ 0.000000e+00, %.lr.ph22.split.us ]
  %144 = phi float [ %157, %139 ], [ 0.000000e+00, %.lr.ph22.split.us ]
  %indvars.iv.next67 = add nsw i64 %indvars.iv66, -1
  %145 = fmul float %65, %144
  %146 = fmul float %143, %66
  %147 = fadd float %145, %146
  %148 = fmul float %exp2, %140
  %149 = fadd float %147, %148
  %150 = fmul float %142, %35
  %151 = fadd float %149, %150
  %152 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv.next67, i64 %indvars.iv68
  store float %151, float* %152, align 4
  %153 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv.next67, i64 %indvars.iv68
  %154 = bitcast float* %153 to i32*
  %155 = load i32, i32* %154, align 4
  %156 = icmp sgt i64 %indvars.iv66, 1
  %157 = bitcast i32 %155 to float
  %158 = bitcast i32 %141 to float
  br i1 %156, label %139, label %._crit_edge20.us

._crit_edge20.us:                                 ; preds = %139
  %indvars.iv.next69 = add nuw nsw i64 %indvars.iv68, 1
  %exitcond71 = icmp eq i64 %indvars.iv.next69, 2160
  br i1 %exitcond71, label %.lr.ph14.split.us.preheader, label %.lr.ph22.split.us

.lr.ph14.split.us.preheader:                      ; preds = %._crit_edge20.us
  br label %.lr.ph14.split.us

.lr.ph14.split.us:                                ; preds = %.lr.ph14.split.us.preheader, %._crit_edge.us
  %indvars.iv62 = phi i64 [ %indvars.iv.next63, %._crit_edge.us ], [ 0, %.lr.ph14.split.us.preheader ]
  %scevgep148 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv62, i64 0
  %scevgep151 = getelementptr [2160 x float], [2160 x float]* %4, i64 %indvars.iv62, i64 2160
  %scevgep154 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv62, i64 0
  %scevgep157 = getelementptr [2160 x float], [2160 x float]* %5, i64 %indvars.iv62, i64 2160
  %scevgep160 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv62, i64 0
  %scevgep163 = getelementptr [2160 x float], [2160 x float]* %6, i64 %indvars.iv62, i64 2160
  %bound0165 = icmp ult float* %scevgep148, %scevgep157
  %bound1166 = icmp ult float* %scevgep154, %scevgep151
  %found.conflict167 = and i1 %bound0165, %bound1166
  %bound0168 = icmp ult float* %scevgep148, %scevgep163
  %bound1169 = icmp ult float* %scevgep160, %scevgep151
  %found.conflict170 = and i1 %bound0168, %bound1169
  %conflict.rdx171 = or i1 %found.conflict167, %found.conflict170
  br i1 %conflict.rdx171, label %.lr.ph14.split.us.new.preheader, label %vector.body138.preheader

vector.body138.preheader:                         ; preds = %.lr.ph14.split.us
  br label %vector.body138

vector.body138:                                   ; preds = %vector.body138.preheader, %vector.body138
  %index175 = phi i64 [ %index.next176, %vector.body138 ], [ 0, %vector.body138.preheader ]
  %159 = shl i64 %index175, 1
  %160 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv62, i64 %159
  %161 = bitcast float* %160 to <8 x float>*
  %wide.vec184 = load <8 x float>, <8 x float>* %161, align 4, !alias.scope !14
  %162 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv62, i64 %159
  %163 = bitcast float* %162 to <8 x float>*
  %wide.vec187 = load <8 x float>, <8 x float>* %163, align 4, !alias.scope !17
  %164 = fadd <8 x float> %wide.vec184, %wide.vec187
  %165 = shufflevector <8 x float> %164, <8 x float> undef, <4 x i32> <i32 0, i32 2, i32 4, i32 6>
  %166 = or i64 %159, 1
  %167 = fadd <8 x float> %wide.vec184, %wide.vec187
  %168 = shufflevector <8 x float> %167, <8 x float> undef, <4 x i32> <i32 1, i32 3, i32 5, i32 7>
  %169 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv62, i64 %166
  %170 = getelementptr float, float* %169, i64 -1
  %171 = bitcast float* %170 to <8 x float>*
  %interleaved.vec190 = shufflevector <4 x float> %165, <4 x float> %168, <8 x i32> <i32 0, i32 4, i32 1, i32 5, i32 2, i32 6, i32 3, i32 7>
  store <8 x float> %interleaved.vec190, <8 x float>* %171, align 4, !alias.scope !19, !noalias !21
  %index.next176 = add nuw nsw i64 %index175, 4
  %172 = icmp eq i64 %index.next176, 1080
  br i1 %172, label %middle.block139, label %vector.body138, !llvm.loop !22

middle.block139:                                  ; preds = %vector.body138
  br label %._crit_edge.us

.lr.ph14.split.us.new.preheader:                  ; preds = %.lr.ph14.split.us
  br label %.lr.ph14.split.us.new

.lr.ph14.split.us.new:                            ; preds = %.lr.ph14.split.us.new.preheader, %.lr.ph14.split.us.new
  %indvars.iv = phi i64 [ %indvars.iv.next.1, %.lr.ph14.split.us.new ], [ 0, %.lr.ph14.split.us.new.preheader ]
  %173 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv62, i64 %indvars.iv
  %174 = load float, float* %173, align 4
  %175 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv62, i64 %indvars.iv
  %176 = load float, float* %175, align 4
  %177 = fadd float %174, %176
  %178 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv62, i64 %indvars.iv
  store float %177, float* %178, align 4
  %indvars.iv.next = or i64 %indvars.iv, 1
  %179 = getelementptr inbounds [2160 x float], [2160 x float]* %5, i64 %indvars.iv62, i64 %indvars.iv.next
  %180 = load float, float* %179, align 4
  %181 = getelementptr inbounds [2160 x float], [2160 x float]* %6, i64 %indvars.iv62, i64 %indvars.iv.next
  %182 = load float, float* %181, align 4
  %183 = fadd float %180, %182
  %184 = getelementptr inbounds [2160 x float], [2160 x float]* %4, i64 %indvars.iv62, i64 %indvars.iv.next
  store float %183, float* %184, align 4
  %indvars.iv.next.1 = add nsw i64 %indvars.iv, 2
  %exitcond.1 = icmp eq i64 %indvars.iv.next.1, 2160
  br i1 %exitcond.1, label %._crit_edge.us.loopexit, label %.lr.ph14.split.us.new, !llvm.loop !23

._crit_edge.us.loopexit:                          ; preds = %.lr.ph14.split.us.new
  br label %._crit_edge.us

._crit_edge.us:                                   ; preds = %._crit_edge.us.loopexit, %middle.block139
  %indvars.iv.next63 = add nuw nsw i64 %indvars.iv62, 1
  %exitcond = icmp eq i64 %indvars.iv.next63, 4096
  br i1 %exitcond, label %._crit_edge15, label %.lr.ph14.split.us

._crit_edge15:                                    ; preds = %._crit_edge.us
  ret void
}

declare void @polybench_timer_stop(...) local_unnamed_addr #1

declare void @polybench_timer_print(...) local_unnamed_addr #1

; Function Attrs: noinline nounwind uwtable
define internal fastcc void @print_array(i32, i32, [2160 x float]* nocapture readonly) unnamed_addr #0 {
.lr.ph4.split.us.preheader:
  %3 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %4 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.1, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %3) #6
  %5 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %6 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %5, i8* getelementptr inbounds ([15 x i8], [15 x i8]* @.str.2, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  br label %.lr.ph4.split.us

.lr.ph4.split.us:                                 ; preds = %._crit_edge.us, %.lr.ph4.split.us.preheader
  %indvars.iv12 = phi i64 [ 0, %.lr.ph4.split.us.preheader ], [ %indvars.iv.next13, %._crit_edge.us ]
  %7 = mul nuw nsw i64 %indvars.iv12, 2160
  br label %8

; <label>:8:                                      ; preds = %15, %.lr.ph4.split.us
  %indvars.iv = phi i64 [ %indvars.iv.next, %15 ], [ 0, %.lr.ph4.split.us ]
  %9 = add nuw nsw i64 %7, %indvars.iv
  %10 = trunc i64 %9 to i32
  %11 = srem i32 %10, 20
  %12 = icmp eq i32 %11, 0
  br i1 %12, label %13, label %15

; <label>:13:                                     ; preds = %8
  %14 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %fputc.us = tail call i32 @fputc(i32 10, %struct._IO_FILE* %14) #6
  br label %15

; <label>:15:                                     ; preds = %13, %8
  %16 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %17 = getelementptr inbounds [2160 x float], [2160 x float]* %2, i64 %indvars.iv12, i64 %indvars.iv
  %18 = load float, float* %17, align 4
  %19 = fpext float %18 to double
  %20 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %16, i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.5, i64 0, i64 0), double %19) #7
  %indvars.iv.next = add nuw nsw i64 %indvars.iv, 1
  %exitcond = icmp eq i64 %indvars.iv.next, 2160
  br i1 %exitcond, label %._crit_edge.us, label %8

._crit_edge.us:                                   ; preds = %15
  %indvars.iv.next13 = add nuw nsw i64 %indvars.iv12, 1
  %exitcond15 = icmp eq i64 %indvars.iv.next13, 4096
  br i1 %exitcond15, label %._crit_edge5, label %.lr.ph4.split.us

._crit_edge5:                                     ; preds = %._crit_edge.us
  %21 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %22 = tail call i32 (%struct._IO_FILE*, i8*, ...) @fprintf(%struct._IO_FILE* %21, i8* getelementptr inbounds ([17 x i8], [17 x i8]* @.str.6, i64 0, i64 0), i8* getelementptr inbounds ([7 x i8], [7 x i8]* @.str.3, i64 0, i64 0)) #7
  %23 = load %struct._IO_FILE*, %struct._IO_FILE** @stderr, align 8
  %24 = tail call i64 @fwrite(i8* getelementptr inbounds ([23 x i8], [23 x i8]* @.str.7, i64 0, i64 0), i64 22, i64 1, %struct._IO_FILE* %23) #6
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
!4 = !{!5}
!5 = distinct !{!5, !6}
!6 = distinct !{!6, !"LVerDomain"}
!7 = !{!8}
!8 = distinct !{!8, !6}
!9 = !{!10}
!10 = distinct !{!10, !6}
!11 = !{!5, !8}
!12 = distinct !{!12, !2, !3}
!13 = distinct !{!13, !2, !3}
!14 = !{!15}
!15 = distinct !{!15, !16}
!16 = distinct !{!16, !"LVerDomain"}
!17 = !{!18}
!18 = distinct !{!18, !16}
!19 = !{!20}
!20 = distinct !{!20, !16}
!21 = !{!15, !18}
!22 = distinct !{!22, !2, !3}
!23 = distinct !{!23, !2, !3}
